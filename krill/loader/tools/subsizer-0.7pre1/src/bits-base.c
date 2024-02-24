/**************************************************************************
 *
 * FILE  bits-base.c
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   bits-base optimization
 *
 ******/
#include <math.h>
#include <stdio.h>
#include <string.h>

#include "bitfunc.h"
#include "bits-base.h"
#include "global.h"
#include "histogram.h"
#include "universal.h"

#define DEBUG_COMPLEXITY 0
#define HAVE_CACHE 1

#define MAX_VALUES 0x10000

static unsigned int base_cost[MAX_PARTS];
static unsigned int so_far[MAX_VALUES+1];
static unsigned int cost_left[MAX_VALUES+1];

#if DEBUG_COMPLEXITY
static size_t n_entry, n_tested, n_copy, n_hits;
#endif

#if HAVE_CACHE
/**************************************************************************
 *
 * SECTION  optimization cache
 *
 ******/
#define CACHE_ENTRIES MAX_VALUES

typedef struct {
    int len;
    char parts[MAX_PARTS];
} CacheEntry;

static CacheEntry cache[CACHE_ENTRIES][MAX_PARTS];

static void invalidate_cache(void)
{
    int id, bit;
    for (id = 0; id < CACHE_ENTRIES; id++) {
	for (bit = 0; bit < MAX_PARTS; bit++) {
	    cache[id][bit].len = -1;
	}
    }
}

static inline int hash_func(int base)
{
    return base;
}


static inline void add_cache(int n_b, int bit, int base, char *enc, int len)
{
    int i;
    int id = hash_func(base);

    cache[id][bit].len = len;
    for (i = bit; i < n_b; i++) {
	cache[id][bit].parts[i] = enc[i];
    }
}


static inline int find_cache(int n_b, int bit, int base, char *enc)
{
    int i;
    int id = hash_func(base);

    int l = cache[id][bit].len;
    if (l >= 0) {
	for (i = bit; i < n_b; i++) {
	    enc[i] = cache[id][bit].parts[i];
	}
    }
    return l;
}


#endif


/**************************************************************************
 *
 * SECTION  optimize encoding
 *
 ******/
static int calc_enc(int n_b, int bit, int base, char *enc)
{
    int i, min_len = 0x10000000;
    char min_enc[MAX_PARTS];

#if DEBUG_COMPLEXITY
    n_entry++;
#endif

    for (i = 0; i < 16; i++) {
	int len;
	int lim = base + (1 << i);
	/*
	 * this should consider the length encodings mapped to
	 * the particular offset.
	 * maybe it can be handled by subtracting from the costs.
	 */
	int cost = base_cost[bit] + i;

	if (lim > MAX_VALUES-1) {
	    if (bit < n_b-1) {
		break;
	    }
	    lim = MAX_VALUES;
	}


	len = (so_far[lim] - so_far[base]) * cost;

	if (bit < n_b-1) {
	    if (cost_left[lim]) {
#if HAVE_CACHE
		int tmp = find_cache(n_b, bit + 1, lim, min_enc);
		if (tmp >= 0) {
		    len += tmp;
#if DEBUG_COMPLEXITY
		    n_hits++;
#endif
		} else {
		    len += calc_enc(n_b, bit + 1, lim, min_enc);
		}
#else
		len += calc_enc(n_b, bit + 1, lim, min_enc);
#endif
	    } else {
		/* didn't use all entries */
		break;
	    }
	} else {
	    /* out of bits, return the alternative cost */
	    len += cost_left[lim];
	}


#if DEBUG_COMPLEXITY
	n_tested++;
#endif

	if (len < min_len) {
	    int j;
	    min_len = len;
	    enc[bit] = i;
	    for (j = bit+1; j < n_b; j++) {
		enc[j] = min_enc[j];
	    }
#if DEBUG_COMPLEXITY
	    n_copy++;
#endif
	}

    }

#if HAVE_CACHE
    add_cache(n_b, bit, base, enc, min_len);
#endif
    return min_len;
}

static void build_arrays(Hist *h)
{
    int i;

    memset(so_far, 0, sizeof(so_far));
    memset(cost_left, 0, sizeof(cost_left));

    int acc = 0;
    for (i = 0; i < h->range; i++) {
	so_far[i] = acc;
	acc += h->bin[i];
    }
    so_far[i] = acc;

    double cost = 0;
    cost_left[h->range] = 0;
    for (i = h->range-1; i >= 0; i--) {
	cost += h->cost[i];
	cost_left[i] = cost;
    }
}

void optimize_enc(Hist *h, int floor, int n, prefix_t prefix, Encoding *enc)
{
    int i;
    Encoding tmp;
    if (!enc) {
	enc = &tmp;
    }

    enc->floor = floor;
    enc->n = n;
    enc->prefix = prefix;

    build_arrays(h);

    for (i = 0; i < n; i++) {
	switch (prefix) {
	case PRE_BINARY:
	    base_cost[i] = ceil( log(n) / log(2) );
	    break;
	case PRE_UNARY:
	case PRE_UNARY_INV:
	    base_cost[i] = cost_unary(i, n);
	    break;
	}
    }

#if DEBUG_COMPLEXITY
    n_entry = 0;
    n_tested = 0;
    n_copy = 0;
    n_hits = 0;
#endif

#if HAVE_CACHE
    invalidate_cache();
#endif


    char bits[MAX_PARTS];
    for (i = 0; i < n; i++) {
        bits[i] = 0;
    }

    calc_enc(n, 0, floor, bits);


    for (i = 0; i < n; i++) {
	enc->parts[i] = bits[i];
    }

#if DEBUG_COMPLEXITY
    printf("  n_entry=%zu, n_tested=%zu, n_copy=%zu, n_hits=%zu\n", n_entry, n_tested, n_copy, n_hits);
#endif
}


/**************************************************************************
 *
 * NAME  print_enc, print_enc_long
 *
 * DESCRIPTION
 *   Print out encoding
 *
 ******/
void print_enc(Encoding *enc)
{
    int i;

    for (i = 0; i < enc->n; i++) {
	printf("%X", enc->parts[i]);
    }
}

void print_enc_long(Encoding *enc)
{
    int i;
    int lim = enc->floor;

    printf("enc = { ");
    for (i = 0; i < enc->n; i++) {
	lim += 1 << enc->parts[i];
	if (i != 0) {
	    printf(", ");
	}
	printf("%d", enc->parts[i]);
    }
    lim--;

    printf(" } %d..%d\n", enc->floor, lim);
}


/**************************************************************************
 *
 * SECTION  encoding
 *
 ******/
int cost_enc(Encoding *enc, int v)
{
    int i, of, base;

    base = enc->floor;
    of = -1;
    for (i = 0; i < enc->n; i++) {
	base += 1 << enc->parts[i];
	if (v < base) {
	    of = i;
	    break;
	}
    }
    if (of < 0) {
	/* fault */
	return 0x100000;
    }

    switch (enc->prefix) {
    case PRE_BINARY:
	return ceil( log(enc->n) / log(2) ) + enc->parts[of];
    case PRE_UNARY:
    case PRE_UNARY_INV:
	return cost_unary(of, enc->n) + enc->parts[of];
    default:
	/* should never happen */
	return 0x100000;
    }
}



void write_enc(BitWriteState *bws, Encoding *enc, int v)
{
    int i, of, base;

    base = enc->floor;
    of = -1;
    for (i = 0; i < enc->n; i++) {
	base += 1 << enc->parts[i];
	if (v < base) {
	    of = i;
	    break;
	}
    }
    if (of < 0) {
	/* fault */
	//return 0x100000;
    }

    switch (enc->prefix) {
    case PRE_BINARY:
	bitwr_write(bws, of, ceil( log(enc->n) / log(2) ));
	break;
    case PRE_UNARY:
	write_unary(bws, of, enc->n, 0);
	break;
    case PRE_UNARY_INV:
	write_unary(bws, of, enc->n, 1);
	break;
    }
    bitwr_write(bws, v-base, enc->parts[of]);
}


int read_enc(BitReadState *brs, Encoding *enc)
{
    int i, of, base;

    switch (enc->prefix) {
    case PRE_BINARY:
	of = bitrd_read(brs, ceil( log(enc->n) / log(2) ));
	break;
    case PRE_UNARY:
	of = read_unary(brs, enc->n, 0);
	break;
    case PRE_UNARY_INV:
	of = read_unary(brs, enc->n, 1);
	break;
    default:
	/* should never happen */
	of = 0;
	break;
    }

    base = enc->floor;
    for (i = 0; i < of; i++) {
	base += 1 << enc->parts[i];
    }

    return base + bitrd_read(brs, enc->parts[of]);
}

/* eof */
