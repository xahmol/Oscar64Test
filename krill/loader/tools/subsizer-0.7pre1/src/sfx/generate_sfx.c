/**************************************************************************
 *
 * FILE  generate_sfx.c
 * Copyright (c) 2015, 2016, 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *
 ******/
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "decrunchers_data.h"
#include "generate_sfx.h"
#include "ops6502.h"
#include "../buffer.h"
#include "../global.h"
#include "../memory.h"


static size_t wrap_len;
static mem_ptr_t tail_addr;
static mem_ptr_t src_end_addr;
static mem_ptr_t wrap_src_addr;
static mem_ptr_t decr_store_addr;
static mem_ptr_t decr_addr;
static size_t decr_len;
static uint8_t first_bitbuf;
static int endm_v;
static mem_ptr_t dest_end_addr;


uint8_t header_buf[256];
int header_l;

uint8_t prologue_buf[256];
int prologue_l;

uint8_t epilogue_buf[16];
int epilogue_l;


/**************************************************************************
 *
 * SECTION  common stage processing
 *
 ******/
static SfxConfig config;

#define FLAG_SYSLESS (FLAG_XBASE << 0)

static void get_options(char *opts)
{
    char *next;
    char *curr;

    if (*opts == 0) {
	return;
    }

    curr = opts;
    do {
	char *val;
	next = strchr(curr, ',');
	if (next) {
	    *next++ = 0;
	}

	val = strchr(curr, '=');
	if (val) {
	    *val++ = 0;
	}

	if (debug_g) {
	    printf("flag: %s, val: %s\n", curr, val);
	}

	if (strcmp("clean", curr) == 0) {
	    config.flags &= ~FLAG_DIRTY;
	    config.fold = 0x400;
	    continue;
	}
	if (strcmp("dirty", curr) == 0) {
	    config.flags |= FLAG_DIRTY;
	    config.fold = 0x200;
	    continue;
	}
	if (strcmp("fold", curr) == 0) {
	    if (val) {
		uint16_t v;
		v = strtoul(val, 0, 0);
		config.fold = v;
	    } else {
		config.fold = 0x200;
	    }
	    continue;
	}
	if (strcmp("nofold", curr) == 0) {
	    config.fold = 0;
	    continue;
	}
	if (strcmp("sei", curr) == 0) {
	    config.flags |= FLAG_NOCLI;
	    continue;
	}
	if (strcmp("mem", curr) == 0) {
	    uint8_t v;
	    v = strtoul(val, 0, 0);
	    config.mem = v;
	    continue;
	}
	if (strcmp("jmp", curr) == 0) {
	    uint16_t v;
	    v = strtoul(val, 0, 0);
	    config.jump = v;
	    continue;
	}
	if (strcmp("sysless", curr) == 0) {
	    config.flags |= FLAG_SYSLESS;
	    continue;
	}
	if (strcmp("load", curr) == 0) {
	    uint16_t v;
	    v = strtoul(val, 0, 0);
	    config.loadback = v;
	    config.flags |= FLAG_SYSLESS;
	    continue;
	}
	panic("unknown option: %s", curr);
    } while ( (curr = next) );

}


SfxConfig *prepare_sfx(int num_opts, char **opts, int jmp)
{

    config.loadback = 0x0801;
    config.mem = 0x37;
    config.mem_during = 0x34;
    config.jump = jmp;
    config.fold = 0x0400;
    config.flags = 0;

    while (num_opts) {
	get_options(*opts++);
	num_opts--;
    }

    return &config;
}


/**************************************************************************
 *
 * SECTION  variants
 *
 ******/
static FixStruct *find_variant(FixStruct *fs, int flags)
{
    while (fs->addr) {
	if (fs->flags == (flags & FLAG_MASK)) {
	    return fs;
	}
	fs++;
    }

    panic("couldn't find variant");
    return 0;
}


#if 0
/**************************************************************************
 *
 * SECTION  common stage processing
 *
 ******/
static void scan_ft(FixStruct *fs)
{
    FixEntry *fe = fs->fix_entry;

    for (; fe->type != ftEnd; fe++) {
	int offs = fe->addr - fs->addr;

	switch (fe->type) {
	default:
	    break;
	}
    }
}
#endif

static int process_ft(Memory *mem, mem_ptr_t sa, FixStruct *fs)
{
    int i;
    FixEntry *fe = fs->fix_entry;
    int len = fs->len;

    for (i = 0; i < len; i++) {
	set_byte(mem, sa + i, fs->data[i] ^ XOR_MAGIC);
    }

    for (; fe->type != ftEnd; fe++) {
	mem_ptr_t ad = sa + fe->addr - fs->addr;
	switch (fe->type) {
	case ftBufZp:
	    set_byte(mem, ad, first_bitbuf);
	    break;
	case ftDestEnd:
	    set_word(mem, ad, dest_end_addr);
	    break;
	case ftEndMarkerMinusOne:
	    set_byte(mem, ad, endm_v - 1);
	    break;
	case ftSrcEnd:
	    set_word(mem, ad, src_end_addr);
	    break;
	default:
	    break;
	}
    }

    return len;
}




static int generate_header(uint8_t *buf)
{
    uint8_t *p = buf;

    /* generate memory setup */
    MNE_SEI(p);
    MNE_LDAI(p, config.mem_during);
    MNE_STAZ(p, 0x01);
    MNE_JMP(p, tail_addr);

    return p - buf;
}


static int generate_prologue(uint8_t *buf, mem_ptr_t ca, mem_ptr_t la, int xy)
{
    uint8_t *p = buf;

#if 0
    /* generate memory setup */
    MNE_SEI(p);
    MNE_LDAI(p, 0x34);
    MNE_STAZ(p, 0x01);
#endif

    mem_ptr_t src1, dest1;
    size_t len1;
    mem_ptr_t src2, dest2;
    size_t len2;

    src1 = decr_store_addr;
    dest1 = decr_addr;
    len1 = decr_len;

    src2 = wrap_src_addr;
    dest2 = la;
    len2 = wrap_len;

    /* generate copy */
    MNE_LDXYI(p, len1, xy);
    if ( xy & (dest2 <= 0x1f6) ) {
	/*
	 * this is a bit kludgy: sets stack to ~$CA on the dirty decruncher
	 * if required for safe uncrunch.   FIXME: should check if overlap!
	 */
	MNE_TXS(p);
    }
    int lp1 = p - buf;
    MNE_LDAXY(p, src1 - 1, xy);
    MNE_STAXY(p, dest1 - 1, xy);
    if (len2 && len1 > len2) {
	MNE_CPXYI(p, len2 + 1, xy);
	MNE_BCS(p, 8);
	MNE_LDAXY(p, src2 - 1, xy);
	MNE_STAXY(p, dest2 - 1, xy);
    }
    MNE_DEXY(p, xy);
    int br1 = p - buf;
    MNE_BNE(p, lp1 - br1);

    if (len2 > len1) {
	int offs = (0x100-len2) & 0xff;
	int pages = (len2 >> 8) + 1;  /* fix me */

	MNE_LDXYI(p, pages, !xy);
	MNE_LDXYI(p, offs, xy);
	int lp2 = p - buf;
	MNE_LDAXY(p, src2 - offs, xy);
	MNE_STAXY(p, dest2 - offs, xy);
	MNE_INXY(p, xy);
	int br2 = p - buf;
	MNE_BNE(p, lp2 - br2);
	MNE_INC(p, ca + lp2 + 2);
	MNE_INC(p, ca + lp2 + 5);
	MNE_DEXY(p, !xy);
	int br3 = p - buf;
	MNE_BNE(p, lp2 - br3);
    }


    return p - buf;
}


static int generate_epilogue(uint8_t *buf)
{
    uint8_t *p = buf;

    /* generate memory setup */
    if ( config.mem != config.mem_during ) {
	MNE_LDAI(p, config.mem);
	MNE_STAZ(p, 0x01);
    }

    /* generate CLI */
    if ( !(config.flags & FLAG_NOCLI) ) {
	MNE_CLI(p);
    }

    /* generate jump */
    MNE_JMP(p, config.jump);

    return p - buf;
}


int generate_sfx(Buffer *sbf, Memory *dmem, Memory *smem, int safe, int endm, SfxConfig *conf)
{
    /* should actually use conf instead of config directly */
    mem_ptr_t dest_end = smem->high;

    mem_ptr_t sa = config.loadback;
    mem_ptr_t la = smem->low - safe;

    mem_ptr_t ca = sa;
    mem_ptr_t ea = sa;
    int xy = 0;

    if (config.flags & FLAG_DIRTY) {
	xy = 1;
    }


    FixStruct *fs_header = find_variant(fs_list_header, config.flags);
    FixStruct *fs_tail = find_variant(fs_list_tail, config.flags);
    FixStruct *fs_decruncher = find_variant(fs_list_decruncher, config.flags);

    endm_v = endm;
    dest_end_addr = dest_end;

    /* pop first bitbuf from the end of the stream */
    first_bitbuf = sbf->buf[sbf->len-1];
    sbf->len--;


    /******
     * generate header (= sys + memory init + jump)
     *
     */
    mem_ptr_t header_end;
    header_l = generate_header(header_buf);
    header_end = sa + header_l;
    if ( !(config.flags & FLAG_SYSLESS) ) {
	header_end += fs_header->len;
    }

    /*
     * determine if the header overlaps the highest possible start
     * of the packed data
     */
    if (header_end > la) {
	/* yes, we need an overlap */
	wrap_len = header_end - la;
    } else {
	/* no, force the start of the packed data to be where it already is */
	wrap_len = 0;
	la = header_end;
    }
    src_end_addr = la + sbf->len;
    wrap_src_addr = src_end_addr;
    tail_addr = src_end_addr + wrap_len;
    generate_header(header_buf);

    /* emit header */
    if ( !(config.flags & FLAG_SYSLESS) ) {
	ca += process_ft(dmem, ca, fs_header);
    }
    ca += insert_mem(dmem, ca, header_buf, header_l);

    /* emit packed data (wrap_len may be 0) */
    ca += insert_mem(dmem, ca, sbf->buf + wrap_len, sbf->len - wrap_len);
    ca += insert_mem(dmem, ca, sbf->buf, wrap_len);


    /******
     * generate decruncher
     *
     */
    epilogue_l = generate_epilogue(epilogue_buf);
    decr_addr = fs_decruncher->addr;
    decr_len = fs_decruncher->len + epilogue_l;


    /******
     * generate prologue + tail
     *
     */
    prologue_l = generate_prologue(prologue_buf, ca, la, xy);
    decr_store_addr = ca + prologue_l + fs_tail->len;
    generate_prologue(prologue_buf, ca, la, xy);

    /* emit prologue + tail */
    ca += insert_mem(dmem, ca, prologue_buf, prologue_l);
    ca += process_ft(dmem, ca, fs_tail);

    /* emit decruncher */
    ca += process_ft(dmem, ca, fs_decruncher);
    ca += insert_mem(dmem, ca, epilogue_buf, epilogue_l);


    /* clean up */
    ea = ca;

    dmem->low = sa;
    dmem->high = ea;

    return 0;
}

/* eof */
