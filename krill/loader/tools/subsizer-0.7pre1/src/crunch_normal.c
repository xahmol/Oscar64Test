/**************************************************************************
 *
 * FILE  crunch_normal.c
 * Copyright (c) 2015, 2016, 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   optimize encoding and generate
 *
 ******/
#include <math.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>

#include "bitfunc.h"
#include "bits-base.h"
#include "buffer.h"
#include "pathfinder.h"
#include "global.h"
#include "histogram.h"
#include "match.h"
#include "memory.h"
#include "message.h"
#include "utils.h"
#include "sfx/fold.h"
#include "sfx/generate_sfx.h"

#define HAVE_THREE_BYTE 1

#define LEN_PARTS 16
#define SINGLE_BYTE_PARTS 4
#define TWO_BYTE_PARTS 16
#define THREE_BYTE_PARTS 16
#define LONG_MATCH_PARTS 16

#define MIN_MATCH 1


/**************************************************************************
 *
 * NAME  optimize_encoding
 *
 * DESCRIPTION
 *   Use statistics of the primary units on the cheapest path to calculate
 *   an optimized encoding.
 *
 ******/
struct EncodingSet {
    int endm;
    Encoding bitsl;
    Encoding bits1;
    Encoding bits2;
#if HAVE_THREE_BYTE
    Encoding bits3;
#endif
    Encoding bits;
};


static void print_enc_set(EncodingSet *es)
{
    print_enc(&es->bitsl);
    printf(",");
    print_enc(&es->bits1);
    printf(",");
    print_enc(&es->bits2);
#if HAVE_THREE_BYTE
    printf(",");
    print_enc(&es->bits3);
#endif
    printf(",");
    print_enc(&es->bits);
    printf("\n");
}

static void print_enc_stats(Hist *h, Encoding *enc, char *label)
{
    printf("%s (n=%zu, e_min=%.2f): ", label, get_number(h), get_entropy(h));
    print_enc_long(enc);
}

typedef struct {
    Hist *h_len;
    Hist *h_offs1;
    Hist *h_offs2;
    Hist *h_offs3;
    Hist *h_offs;
} Stats;

static Stats *create_stats(void)
{
    Stats *st;

    st = safe_malloc(sizeof(Stats), "Stats");

    st->h_len = create_histogram(0x10000, 0);
    st->h_offs1 = create_histogram(0x10000, 0);
    st->h_offs2 = create_histogram(0x10000, 0);
#if HAVE_THREE_BYTE
    st->h_offs3 = create_histogram(0x10000, 0);
#endif
    st->h_offs = create_histogram(0x10000, 0);

    return st;
}

static void destroy_stats(Stats *st)
{
    if (st) {
	destroy_histogram(st->h_len);
	destroy_histogram(st->h_offs1);
	destroy_histogram(st->h_offs2);
#if HAVE_THREE_BYTE
	destroy_histogram(st->h_offs3);
#endif
	destroy_histogram(st->h_offs);
    }
    free(st);
}


static void collect_statistics(Stats *st, PrimaryPath *pp, CostFuncSet *cfs, EncodingSet *es)
{
    Hist *h_lit = create_histogram(0x100, 0);
    Hist *h_lit_run = create_histogram(0x10000, 0);
    Hist *h_mat_run = create_histogram(0x10000, 0);

    int src = 0;
    int r_lit = 0;
    int r_mat = 0;
    Match *m = pp->path;
    while (!is_end(m)) {

	if (debug_g) {
	    printf("%d: ", src);
	}
	if (is_match(m) && get_match_len(m) >= MIN_MATCH) {
	    int l = get_match_len(m);
	    int of = get_match_offs(m);

	    if (debug_g) {
		printf("match of=%d, l=%d", of, l);
	    }
	    /* accumulate histograms to optimize encoding */
	    /*
	     * these should also record the alternative cost of allowing a
	     * particular offset.
	     *
	     */
	    double cost_lt = cfs->cost_lit(es, l);
	    double cost_of = 1 + cfs->cost_moffs(es, of, l);
	    double cost_l = 1 + cfs->cost_mlen(es, l);

	    hist_add(st->h_len, l, cost_lt - cost_of);
	    switch (l) {
	    case 1:
		hist_add(st->h_offs1, of, cost_lt - cost_l);
		break;
	    case 2:
		hist_add(st->h_offs2, of, cost_lt - cost_l);
		break;
#if HAVE_THREE_BYTE
	    case 3:
		hist_add(st->h_offs3, of, cost_lt - cost_l);
		break;
#endif
	    default:
		hist_add(st->h_offs, of, cost_lt - cost_l);
		break;
	    }

	    src += l;

	    /* handle histograms for literal and match runs. */
	    /*
	     * this should probably record the first occurrance
	     * and fill in the repeat there when flushed.
	     */
	    if (r_lit) {
		hist_add(h_lit_run, r_lit, 0);
		r_lit = 0;
	    }
	    r_mat++;

	} else {
	    int l = get_literal_len(m);
	    if (debug_g) {
		printf("literal l=%d (", l);
	    }
	    while (l) {
		uint8_t lit = pp->buf[src];
		if (debug_g) {
		    printf("$%02x", lit);
		    if (l > 1) {
			printf(" ");
		    }
		}
		hist_add(h_lit, lit, 0);
		src++;
		--l;
	    }
	    if (debug_g) {
		printf(")");
	    }

	    /* handle histograms for literal and match runs. */
	    /*
	     * this should probably record the first occurrance
	     * and fill in the repeat there when flushed.
	     */
	    if (r_mat) {
		hist_add(h_mat_run, r_mat, 0);
		r_mat = 0;
	    }
	    r_lit++;
	}
	m++;

	if (debug_g) {
	    printf("\n");
	}
    }
    /* flush any unflushed runs */
    if (r_lit) {
	hist_add(h_lit_run, r_lit, 0);
    }
    if (r_mat) {
	hist_add(h_mat_run, r_mat, 0);
    }

    if (debug_g) {
	printf("length=%d\n", src);

	printf("max_lit_run=%d, max_mat_run=%d\n", get_histrange(h_lit_run), get_histrange(h_mat_run));

	size_t n_lit = get_number(h_lit);
	double e_lit = get_entropy(h_lit);
	printf("literals (n=%zu, e_min=%.2f), theoretical gain = %d bytes\n", n_lit, e_lit, (int)(n_lit - (n_lit * e_lit / 8.0)));

#if 1
	printf("   val   len   l=1   l=2   l=3   l>3   lit\n");
	int i;
	for (i = 0; i < 256; i++) {
	    printf(" %4d: %5zu %5zu %5zu %5zu %5zu %5zu\n", i, st->h_len->bin[i], st->h_offs1->bin[i], st->h_offs2->bin[i], st->h_offs3->bin[i], st->h_offs->bin[i], h_lit->bin[i]);
	}
#endif

    }

    destroy_histogram(h_lit);
    destroy_histogram(h_lit_run);
    destroy_histogram(h_mat_run);

}

static void optimize_encoding(Stats *st, EncodingSet *es)
{
    optimize_enc(st->h_len, MIN_MATCH, LEN_PARTS, PRE_UNARY, &es->bitsl);
    optimize_enc(st->h_offs1, 1, SINGLE_BYTE_PARTS, PRE_BINARY, &es->bits1);
    optimize_enc(st->h_offs2, 1, TWO_BYTE_PARTS, PRE_BINARY, &es->bits2);
#if HAVE_THREE_BYTE
    optimize_enc(st->h_offs3, 1, THREE_BYTE_PARTS, PRE_BINARY, &es->bits3);
#endif
    optimize_enc(st->h_offs, 1, LONG_MATCH_PARTS, PRE_BINARY, &es->bits);

    /* find end marker candidate */
    es->endm = 0; /* impossible marker */
    int i;
    for (i = MIN_MATCH; i < st->h_len->range; i++) {
	if (st->h_len->bin[i] == 0) {
	    es->endm = i;
	    break;
	}
    }

#if 1
    /* see if end marker is outside the encodable range (ugly, fixme!) */
    if (cost_enc(&es->bitsl, es->endm) > 0x1000) {
       printf("Warning: end marker out of range, forcing allocation!\n");
       hist_add(st->h_len, es->endm, 1);
       optimize_enc(st->h_len, MIN_MATCH, LEN_PARTS, PRE_UNARY, &es->bitsl);
    }
#endif

    if (debug_g) {
	print_enc_stats(st->h_len, &es->bitsl, "lengths");
	print_enc_stats(st->h_offs1, &es->bits1, "offs (l=1)");
	print_enc_stats(st->h_offs2, &es->bits2, "offs (l=2)");
#if HAVE_THREE_BYTE
	print_enc_stats(st->h_offs3, &es->bits3, "offs (l=3)");
	print_enc_stats(st->h_offs, &es->bits, "offs (l>3)");
#else
	print_enc_stats(st->h_offs, &es->bits, "offs (l>2)");
#endif
	printf("end marker: l=%d\n", es->endm);

    }

}


/**************************************************************************
 *
 * SECTION  packer
 *
 ******/
static inline double cost_lit(EncodingSet *es, int l)
{
    return l * 9;
}


static inline double cost_mlen(EncodingSet *es, int l)
{
    return cost_enc(&es->bitsl, l);
}

static void write_mlen(BitWriteState *bws, EncodingSet *es, int l)
{
    write_enc(bws, &es->bitsl, l);
}

static int read_mlen(BitReadState *brs, EncodingSet *es)
{
    return read_enc(brs, &es->bitsl);
}


static inline double cost_moffs(EncodingSet *es, int of, int l)
{
    switch (l) {
    case 1:
	return cost_enc(&es->bits1, of);
    case 2:
	return cost_enc(&es->bits2, of);
#if HAVE_THREE_BYTE
    case 3:
	return cost_enc(&es->bits3, of);
#endif
    default:
	return cost_enc(&es->bits, of);
    }
}

static void write_moffs(BitWriteState *bws, EncodingSet *es, int of, int l)
{
    switch (l) {
    case 1:
	write_enc(bws, &es->bits1, of);
	break;
    case 2:
	write_enc(bws, &es->bits2, of);
	break;
#if HAVE_THREE_BYTE
    case 3:
	write_enc(bws, &es->bits3, of);
	break;
#endif
    default:
	write_enc(bws, &es->bits, of);
	break;
    }
}

static int read_moffs(BitReadState *brs, EncodingSet *es, int l)
{
    switch (l) {
    case 1:
	return read_enc(brs, &es->bits1);
    case 2:
	return read_enc(brs, &es->bits2);
#if HAVE_THREE_BYTE
    case 3:
	return read_enc(brs, &es->bits3);
#endif
    default:
	return read_enc(brs, &es->bits);
    }
}


static inline int cost_endm(EncodingSet *es)
{
    return 1 + cost_mlen(es, es->endm);
}

static void write_endm(BitWriteState *bws, EncodingSet *es)
{
    bitwr_write(bws, 0, 1);
    write_mlen(bws, es, es->endm);
}


static CostFuncSet cfs = {
    cost_lit,
    cost_mlen,
    cost_moffs
};



static inline double cost_lit_init(EncodingSet *es, int l)
{
    return l * 9;
}

static inline double cost_mlen_init(EncodingSet *es, int l)
{
    return ceil( 0 + log(l) / log(2) );
}

static inline double cost_moffs_init(EncodingSet *es, int of, int l)
{
    if (l == 1) {
	return ceil( 0 + log(of) / log(2) );
    }
    return ceil( 2 + log(of) / log(2) );
}

static CostFuncSet cfs_init = {
    cost_lit_init,
    cost_mlen_init,
    cost_moffs_init
};

static PrimaryPath *optimize_tree(MatchTree *mt, EncodingSet *es)
{
    int max_passes = 16;  /* should be configurable. */

    int i;
    PrimaryPath *pp;
    Stats *st;

    /* calculate initial encoding using doctored cost */
    pp = find_cheapest_path(mt, &cfs_init, es, FCP_INITIAL_LITERAL);
    st = create_stats();
    collect_statistics(st, pp, &cfs_init, es);
    optimize_encoding(st, es);
    destroy_stats(st);

    /*
     * keep iterating find_cheapest_path + optimize_encoding until encoding
     * no longer changes.
     */
    EncodingSet last_es;
    for (i = 0; i < max_passes; i++) {
	memcpy(&last_es, es, sizeof(EncodingSet));
	destroy_primarypath(pp);

	if (verbose_g) {
	    print_enc_set(es);
	    printf("end marker: l=%d (cost=%d)\n", es->endm, cost_endm(es));
	}
	pp = find_cheapest_path(mt, &cfs, es, FCP_INITIAL_LITERAL);

	/* endm + parts + space of end marker */
	int overhead = 8 + 4 * (4*16 + 4) + cost_endm(es);
	size_t cost = (pp->cost + overhead + 7) / 8;

	msg(MSG_VERBOSE, " %zu (left %.2f%%)\n", cost, ((100.0 * cost) / pp->len));
	st = create_stats();
	collect_statistics(st, pp, &cfs, es);
	optimize_encoding(st, es);
	destroy_stats(st);

	if (memcmp(es, &last_es, sizeof(EncodingSet)) == 0) {
	    break;
	}
    }

    /* check for impossible marker */
    if (es->endm == 0) {
	fprintf(stderr, "error: couldn't find an end marker!\n");
    }

    return pp;
}


/**************************************************************************
 *
 * NAME  generate
 *
 * DESCRIPTION
 *   Generate packed output from optimized structure.
 *
 ******/
static int generate(PrimaryPath *pp, EncodingSet *es, uint8_t *buf, int flags)
{
    int i;
    BitWriteState bws;
    int l;

    bitwr_init(&bws, buf, BITMODE_SIDEBYTE | flags);

    bitwr_write8s(&bws, es->endm);

    for (i = 0; i < es->bitsl.n; i++) {
	bitwr_write(&bws, es->bitsl.parts[i], 4);
    }
    for (i = 0; i < es->bits2.n; i++) {
	bitwr_write(&bws, es->bits2.parts[i], 4);
    }
#if HAVE_THREE_BYTE
    for (i = 0; i < es->bits3.n; i++) {
	bitwr_write(&bws, es->bits3.parts[i], 4);
    }
#endif
    for (i = 0; i < es->bits.n; i++) {
	bitwr_write(&bws, es->bits.parts[i], 4);
    }
    for (i = 0; i < es->bits1.n; i++) {
	bitwr_write(&bws, es->bits1.parts[i], 4);
    }

    l = 0;
    Match *m = pp->path;

    /* initial literal */
    if (is_literal(m) && get_literal_len(m) == 1) {
	bitwr_write8s(&bws, pp->buf[l]);
	l++;
	m++;
    } else {
	panic("internal fault");
    }

    while (!is_end(m)) {

	if (is_match(m)) {
	    /* match */
	    bitwr_write(&bws, 0, 1);
	    write_mlen(&bws, es, get_match_len(m));
	    write_moffs(&bws, es, get_match_offs(m), get_match_len(m));

	    l += get_match_len(m);
	} else {
	    int n = get_literal_len(m);
	    while (n) {
		/* literal */
		bitwr_write(&bws, 1, 1);
		bitwr_write8s(&bws, pp->buf[l]);
		l++;
		--n;
	    }
	}
	m++;
    }

    /* end marker */
    write_endm(&bws, es);

    return bitwr_flush(&bws);
}


/**************************************************************************
 *
 * NAME  crunch_normal_int
 *
 * DESCRIPTION
 *   Common cruncher parts
 *
 ******/
static int crunch_normal_int(Buffer *sbf, Buffer *dbf, int flags)
{
    MatchTree *mt = create_matchtree();
    double t1, t2;
    EncodingSet es;
    memset(&es, 0, sizeof(EncodingSet));

    msg(MSG_VERBOSE, "build matches...\n");
    t1 = get_time();
    build_match(mt, sbf->buf, sbf->len);
    t2 = get_time();
    msg(MSG_VERBOSE, "...%.2f s\n", t2 - t1);

    msg(MSG_VERBOSE, "optimizing matches...\n");
    t1 = get_time();
    PrimaryPath *pp = optimize_tree(mt, &es);
    t2 = get_time();
    msg(MSG_VERBOSE, "...%.2f s\n", t2 - t1);

    destroy_matchtree(mt);

    msg(MSG_VERBOSE, "generating output...\n");
    t1 = get_time();
    dbf->len = generate(pp, &es, dbf->buf, flags);
    t2 = get_time();
    msg(MSG_VERBOSE, "...%.2f s\n", t2 - t1);

    destroy_primarypath(pp);

    return 0;
}


/**************************************************************************
 *
 * NAME  decrunch_normal_int
 *
 * DESCRIPTION
 *   Common decruncher parts
 *
 ******/
static int decrunch_normal_int(Buffer *sbf, Buffer *dbf, int flags, size_t *safep)
{
    int i;
    BitReadState brs;
    int cur;
    EncodingSet es;
    int safe;
    int spos;
    uint8_t *destbuf = dbf->buf;

    bitrd_init(&brs, sbf->buf, BITMODE_SIDEBYTE | flags);

    es.endm = bitrd_read8s(&brs);

    es.bitsl.floor = MIN_MATCH;
    es.bitsl.n = LEN_PARTS;
    es.bitsl.prefix = PRE_UNARY;
    for (i = 0; i < es.bitsl.n; i++) {
	es.bitsl.parts[i] = bitrd_read(&brs, 4);
    }

    es.bits2.floor = 1;
    es.bits2.n = TWO_BYTE_PARTS;
    es.bits2.prefix = PRE_BINARY;
    for (i = 0; i < es.bits2.n; i++) {
	es.bits2.parts[i] = bitrd_read(&brs, 4);
    }

#if HAVE_THREE_BYTE
    es.bits3.floor = 1;
    es.bits3.n = THREE_BYTE_PARTS;
    es.bits3.prefix = PRE_BINARY;
    for (i = 0; i < es.bits3.n; i++) {
	es.bits3.parts[i] = bitrd_read(&brs, 4);
    }
#endif

    es.bits.floor = 1;
    es.bits.n = LONG_MATCH_PARTS;
    es.bits.prefix = PRE_BINARY;
    for (i = 0; i < es.bits.n; i++) {
	es.bits.parts[i] = bitrd_read(&brs, 4);
    }

    es.bits1.floor = 1;
    es.bits1.n = SINGLE_BYTE_PARTS;
    es.bits1.prefix = PRE_BINARY;
    for (i = 0; i < es.bits1.n; i++) {
	es.bits1.parts[i] = bitrd_read(&brs, 4);
    }


    cur = 0;
    safe = 0;
    spos = dbf->len - sbf->len;  /* extremely ugly: assumes dbf contains the unpacked data */
    while (1) {
	if (cur == 0 || bitrd_read(&brs, 1)) {
	    uint8_t c = bitrd_read8s(&brs);
	    destbuf[cur] = c;
	    cur++;
	} else {
	    int len, offs;
	    len = read_mlen(&brs, &es);
	    if (len == es.endm) {
		break;
	    }
	    offs = read_moffs(&brs, &es, len);
	    if (offs > cur) {
		fprintf(stderr, "error: offset out of range\n");
		break;
	    }
	    for (i = 0; i < len; i++) {
		destbuf[cur] = destbuf[cur-offs];
		cur++;
	    }
	}
	/* check safe distance */
	int dist = cur - (brs.pos + spos);
	if (dist > safe) {
	    safe = dist;
	}
    }
    dbf->len = cur;

    msg(MSG_DEBUG, "safe = %d\n", safe);

    if (safep) {
	*safep = safe;
    }

    return 0;
}


/**************************************************************************
 *
 * NAME  crunch_normal
 *
 * DESCRIPTION
 *   Cruncher for the "normal" algorithm
 *
 ******/
int crunch_normal(Buffer *sbf, Buffer *dbf)
{
    return crunch_normal_int(sbf, dbf, 0);
}


/**************************************************************************
 *
 * NAME  decrunch_normal
 *
 * DESCRIPTION
 *   Decruncher for the "normal" algorithm
 *
 ******/
int decrunch_normal(Buffer *sbf, Buffer *dbf)
{
    return decrunch_normal_int(sbf, dbf, 0, 0);
}


/**************************************************************************
 *
 * NAME  crunch_normal_mem
 *
 * DESCRIPTION
 *   Memory cruncher for the "normal" algorithm
 *
 ******/
int crunch_normal_mem(Memory *smem, Memory *dmem, int num_opts, char **opts)
{
    int ret;
    Buffer *sbf;
    Buffer *dbf;
    size_t safe = 0;
    mem_ptr_t sa, ea, ca;
    uint8_t endm, first;
    int forwards_mode = num_opts; // FIXME: kludge!!!!

    sbf = create_buffer(smem->high - smem->low);
    sbf->len = smem->high - smem->low;
    memcpy(sbf->buf, smem->buf + smem->low, sbf->len);
    dbf = create_buffer(0x100000);

    if (!forwards_mode) {
	/* crunch in reverse */
	reverse_buffer(sbf);
	ret = crunch_normal_int(sbf, dbf, BITMODE_PRESHIFT);

	/* check safe distance (reuse sbf as target) */
	decrunch_normal_int(dbf, sbf, BITMODE_PRESHIFT, &safe);
	destroy_buffer(sbf);

	/* reverse result */
	reverse_buffer(dbf);
    } else {
	/* crunch forwards */
	ret = crunch_normal_int(sbf, dbf, BITMODE_PRESHIFT);

	/* check safe distance (reuse sbf as target) */
	decrunch_normal_int(dbf, sbf, BITMODE_PRESHIFT, &safe);
	destroy_buffer(sbf);
    }

    msg(MSG_VERBOSE, "safe = %zu\n", safe);

    //sa = 0x1000;
    if (!forwards_mode) {
	/* default output address is the minimum margin required for safe uncrunch */
	sa = smem->low - safe;

	/* generate output */
	ca = sa;
	ca += insert_mem(dmem, sa, dbf->buf, dbf->len);

	/* pop first */
	first = get_byte(dmem, --ca);
	/* pop endm */
	endm = get_byte(dmem, --ca);

	/* add first */
	set_byte(dmem, ca++, first);
	/* add target address (in reverse) */
	set_byte(dmem, ca++, (smem->high) & 0xff);
	set_byte(dmem, ca++, (smem->high) >> 8);
	/* add endm (adjusted) */
	set_byte(dmem, ca++, endm - 1);

	ea = ca;
    } else {
	/* default output address is the minimum margin required for safe uncrunch */
	ea = smem->high + safe;

	/* generate output */
	ca = ea - dbf->len;
	insert_mem(dmem, ca, dbf->buf, dbf->len);

	/* pop first */
	first = get_byte(dmem, ca++);
	/* pop endm */
	endm = get_byte(dmem, ca++);

	/* add first */
	set_byte(dmem, --ca, first);
	/* add target address (in reverse) */
	set_byte(dmem, --ca, (smem->low) & 0xff);
	set_byte(dmem, --ca, (smem->low) >> 8);
	/* add endm (adjusted) */
	set_byte(dmem, --ca, endm - 1);

	sa = ca;
    }

    dmem->low = sa;
    dmem->high = ea;

    destroy_buffer(dbf);

    return ret;
}


/**************************************************************************
 *
 * NAME  crunch_normal_sfx
 *
 * DESCRIPTION
 *   Executable cruncher for the "normal" algorithm
 *
 ******/
int crunch_normal_sfx(Memory *smem, Memory *dmem, int num_opts, char **opts, int jmp)
{
    int ret;
    Buffer *sbf;
    Buffer *dbf;
    int endm;
    uint8_t tmp;
    size_t safe = 0;
    SfxConfig *conf;

    /* get initial options */
    conf = prepare_sfx(num_opts, opts, jmp);

    /* fold if applicable */
    if (conf->fold) {
	/* this should probably not change smem */
	conf = fold(smem, 0, conf->fold, 0x10000, conf);
    }

    sbf = create_buffer(smem->high - smem->low);
    sbf->len = smem->high - smem->low;
    memcpy(sbf->buf, smem->buf + smem->low, sbf->len);
    dbf = create_buffer(0x100000);

    /* crunch in reverse */
    reverse_buffer(sbf);
    ret = crunch_normal_int(sbf, dbf, BITMODE_PRESHIFT);

    /* check safe distance (reuse sbf as target) */
    decrunch_normal_int(dbf, sbf, BITMODE_PRESHIFT, &safe);
    destroy_buffer(sbf);

    /* reverse result */
    reverse_buffer(dbf);

    /* pop endm from the end of the stream */
    tmp = dbf->buf[dbf->len-1];
    endm = dbf->buf[dbf->len-2];
    dbf->buf[dbf->len-2] = tmp;
    dbf->len--;

    msg(MSG_VERBOSE, "safe = %zu\n", safe);

    /* generate output */
    generate_sfx(dbf, dmem, smem, safe, endm, conf);

    destroy_buffer(dbf);

    return ret;
}


/* eof */
