/**************************************************************************
 *
 * FILE  fold.c
 * Copyright (c) 2015, 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *
 ******/
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "decrunchers.h"
#include "fold.h"
#include "generate_sfx.h"
#include "ops6502.h"
#include "../global.h"
#include "../memory.h"


/**************************************************************************
 *
 * NAME  is_basic(), is_io(), is_kernal()
 *
 * DESCRIPTION
 *   Identify if address is within special section.
 *
 ******/
static int is_basic(mem_ptr_t ad)
{
    if (ad >= 0xa000 && ad <= 0xbfff) {
	return 1;
    }
    return 0;
}

static int is_io(mem_ptr_t ad)
{
    if (ad >= 0xd000 && ad <= 0xdfff) {
	return 1;
    }
    return 0;
}

static int is_kernal(mem_ptr_t ad)
{
    if (ad >= 0xe000 && ad <= 0xffff) {
	return 1;
    }
    return 0;
}


/**************************************************************************
 *
 * SECTION  rle parser
 *
 ******/
typedef struct {
    mem_ptr_t sa;
    size_t n;
    uint8_t val;
} RleEntry;

static int cmp_rle(const void *a, const void *b)
{
    const RleEntry *ar = a;
    const RleEntry *br = b;

    /* sort on I/O area first */
    if (is_io(ar->sa) && !is_io(br->sa)) {
	return 1;
    }
    if (!is_io(ar->sa) && is_io(br->sa)) {
	return -1;
    }

    /* sort on kernal area second */
    if (is_kernal(ar->sa) && !is_kernal(br->sa)) {
	return 1;
    }
    if (!is_kernal(ar->sa) && is_kernal(br->sa)) {
	return -1;
    }

    /* sort on basic area third */
    if (is_basic(ar->sa) && !is_basic(br->sa)) {
	return 1;
    }
    if (!is_basic(ar->sa) && is_basic(br->sa)) {
	return -1;
    }

    /* lastly sort on size */
    if (ar->n < br->n) {
	return 1;
    }
    if (ar->n > br->n) {
	return -1;
    }

    return 0;
}

static size_t n_entries;
static RleEntry rle[256];

static void scan_rle(Memory *mem, mem_ptr_t sa, mem_ptr_t ea)
{
    mem_ptr_t ad = sa;
    int n_rle;
    int last_byte;
    int min_rle = 50;

    n_entries = 0;
    n_rle = 0;
    last_byte = -1;
    while (ad < ea) {
	uint8_t c = get_byte(mem, ad);
	if (c != last_byte) {
	    if (n_rle >= min_rle) {
		rle[n_entries].sa = ad - n_rle - 1;
		rle[n_entries].n = n_rle;
		rle[n_entries].val = last_byte;
		n_entries++;
	    }
	    n_rle = 0;
	    last_byte = c;
	} else {
	    n_rle++;
	}
	ad++;
    }
    /* here we should flush the last entry */

    qsort(rle, n_entries, sizeof(RleEntry), cmp_rle);
}


#if 0
static void dump_rle_entries(void)
{
    int i;
    for (i = 0; i < n_entries; i++) {
	size_t n = rle[i].n;
	mem_ptr_t sa = rle[i].sa;
	mem_ptr_t ea = sa + n;
	uint8_t val = rle[i].val;

	if (n == 0) {
	    continue;
	}

	printf("slot: $%04X-$%04X = $%02X (%zu bytes)\n", sa, ea - 1, val, n);
    }
}
#endif


/**************************************************************************
 *
 * SECTION  folding logic
 *
 ******/
static int generate_copy(uint8_t *buf, mem_ptr_t sa, mem_ptr_t da, size_t n)
{
    uint8_t *p = buf;

    /* generate copy */
    MNE_LDXI(p, n);
    int lp1 = p - buf;
    MNE_LDAX(p, sa - 1);
    MNE_STAX(p, da - 1);
    MNE_DEX(p);
    int br1 = p - buf;
    MNE_BNE(p, lp1 - br1);

    return p - buf;
}

static int generate_fill(uint8_t *buf, mem_ptr_t ta, size_t n, uint8_t val)
{
    uint8_t *p = buf;

    MNE_LDXI(p, n);
    MNE_LDAI(p, val);
    int lp1 = p - buf;
    MNE_STAX(p, ta - 1);
    MNE_DEX(p);
    int br1 = p - buf;
    MNE_BNE(p, lp1 - br1);

    return p - buf;
}


static int generate_trampoline(uint8_t *buf, mem_ptr_t ca, mem_ptr_t ta, size_t n, uint8_t val, mem_ptr_t sa, SfxConfig *conf)
{
    uint8_t *p = buf;
    int tl;
    mem_ptr_t tra = 0xd000;

    /* length of trampoline */
    tl = (conf->flags & FLAG_NOCLI) ? 9 : 10;

    /* if trampoline fits below the decrunched data, put it there */
    if ( (0x0002 + tl) <= sa ) {
	tra = sa - tl;
    }

    /* generate copy */
    MNE_LDAI(p, conf->mem);
    MNE_STAZ(p, 0x01);

    MNE_LDXI(p, tl);
    int lp1 = p - buf;
    MNE_LDAX(p, ca + 22 - 1);
    MNE_STAX(p, tra - 1);
    MNE_DEX(p);
    int br1 = p - buf;
    MNE_BNE(p, lp1 - br1);
    MNE_LDXI(p, n);
    MNE_LDAI(p, val);
    MNE_JMP(p, tra);

    int lp2 = p - buf;
    MNE_STAX(p, ta - 1);
    MNE_DEX(p);
    int br2 = p - buf;
    MNE_BNE(p, lp2 - br2);
    if ( !(conf->flags & FLAG_NOCLI) ) {
	MNE_CLI(p);
    }
    MNE_JMP(p, conf->jump);


    return p - buf;
}

static void do_fold_a(Memory *smem, mem_ptr_t low_limit, SfxConfig *conf)
{
    mem_ptr_t sa = smem->low;

    mem_ptr_t ad = low_limit;
    mem_ptr_t last_ca = 0;
    int last_val = -1;
    int last_n = -1;
    uint8_t *last_jmpaddr = 0;
    int i;

    int count = 0;
    int areas = 0;

    for (i = 0; i < n_entries; i++) {
	mem_ptr_t ca = rle[i].sa;
	int n = rle[i].n;
	int val = rle[i].val;
	uint8_t *buf = smem->buf + ca;
	uint8_t *p = buf;
	int left = ad - sa;

	if (last_jmpaddr) {
	    OP_ADR(last_jmpaddr, ca);
	    last_jmpaddr = 0;
	}

	if (left <= 0) {
	    p += generate_fill(p, last_ca, last_n, last_val);
	    generate_trampoline(p, ca+10, ca, n, val, sa, conf);

	    /* the counters should be possible to unify */
	    areas++;
	    count += p - buf;
	    break;
	}

	if (last_n < 0) {
	    int nmax = n - 14;
	    if ( left < nmax ) {
		nmax = left;
		n = nmax + 14;
	    }
	    ad -= nmax;
	    p += generate_copy(p, ca+14, ad, nmax);
	    last_jmpaddr = p + 1;
	    MNE_JMP(p, 0x0000);
	    memcpy(p, smem->buf + ad, nmax);
	    p += nmax;
	} else {
	    int nmax = n - 24;
	    if ( left < nmax ) {
		nmax = left;
		n = nmax + 24;
	    }
	    ad -= nmax;
	    p += generate_fill(p, last_ca, last_n, last_val);
	    p += generate_copy(p, ca+24, ad, nmax);
	    last_jmpaddr = p + 1;
	    MNE_JMP(p, 0x0000);
	    memcpy(p, smem->buf + ad, nmax);
	    p += nmax;
	}

	areas++;
	count += p - buf;

	last_ca = ca;
	last_n = n;
	last_val = val;
    }

    conf->mem = 0x34;
    conf->flags |= FLAG_NOCLI;
    conf->jump = rle[0].sa;

    smem->low = low_limit;

    printf("folded $%04x-$%04x into %d chunks (%d bytes overhead)\n", sa, low_limit, areas, count - (low_limit-sa));
}


/**************************************************************************
 *
 * NAME  fold()
 *
 * DESCRIPTION
 *   Fold low part in rle segments.
 *
 ******/
SfxConfig *fold(Memory *smem, Memory *dmem, mem_ptr_t low_limit, mem_ptr_t high_limit, SfxConfig *conf)
{
    mem_ptr_t sa = smem->low;
    mem_ptr_t ea = smem->high;

    if (sa >= low_limit) {
	/* no fold required */
	return conf;
    }
#if 0
    size_t n = low_limit - sa;

    if (ea <= high_limit - n) {
	/* simple copy possible (should consider the size of the copy routine) */
	printf("simple fold possible\n");
	return conf;
    }
#endif
    /* perform full fold */

    /* find rle slots above the desired low limit */
    scan_rle(smem, low_limit, ea);

    do_fold_a(smem, low_limit, conf);

    //dump_rle_entries();

    return conf;
}

/* eof */
