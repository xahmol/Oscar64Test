/**************************************************************************
 *
 * FILE  bitfunc.c
 * Copyright (c) 2009-2011, 2013-2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   bitstream read/write functions.
 *
 ******/
#include <stdint.h>
#include <stdlib.h>

#include "bitfunc.h"


/**************************************************************************
 *
 * SECTION  bit writer
 *
 ******/
void bitwr_init(BitWriteState *bws, uint8_t *destbuf, unsigned flags)
{
    bws->ptr = destbuf;
    bws->pos = 0;
    bws->bits = 0;

    bws->bit = 0;
    bws->buf = 0;
    bws->bpos = 0;

    bws->flags = flags;

    if (bws->flags & BITMODE_PRESHIFT) {
	/*
	 * first byte shall be rol:ed one bit with a 1 inserted
	 * we reserve this bit here and apply the shift afterwards
	 */
	bitwr_write(bws, 0, 1);
    }
}


void bitwr_write(BitWriteState *bws, uint32_t data, int n)
{
    bws->bits += n;

    /* mask source data */
    data &= (1 << n) - 1;

    /* process bits */
    while (n) {
	int fr = 8-bws->bit;
	int nn = (n > fr) ? fr : n;
	if (bws->bit == 0) {
	    bws->bpos = bws->pos;
	    bws->pos++;
	}
	bws->buf <<= nn;
	bws->buf |= data >> (n-nn);
	bws->bit += nn;
	if (bws->bit == 8) {
	    bws->ptr[bws->bpos] = bws->buf;
	    bws->bit = 0;
	}
	n -= nn;
    }
}


void bitwr_write8s(BitWriteState *bws, uint8_t data)
{
    if ( !(bws->flags & BITMODE_SIDEBYTE) ) {
	bitwr_write(bws, data, 8);
	return;
    }

    bws->bits += 8;

    bws->ptr[bws->pos] = data;
    bws->pos++;
}


int bitwr_flush(BitWriteState *bws)
{
    if (bws->bit > 0) {
	bitwr_write(bws, 0, 8-bws->bit);
    }

    if (bws->flags & BITMODE_PRESHIFT) {
	/*
	 * first byte shall be rol:ed one bit with a 1 inserted
	 * apply the shift here (MSB was unused since before)
	 */
	bws->ptr[0] = (bws->ptr[0] << 1) | 0x01;
    }

    return bws->pos;
}


/**************************************************************************
 *
 * SECTION  bit reader
 *
 ******/
void bitrd_init(BitReadState *brs, uint8_t *srcbuf, unsigned int flags)
{
    brs->ptr = srcbuf;
    brs->pos = 0;
    brs->bits = 0;

    brs->bit = 0;
    brs->buf = 0;

    brs->flags = flags;

    if (brs->flags & BITMODE_PRESHIFT) {
	/*
	 * first byte shall be ror:ed one bit with a 1 inserted
	 * and one bit pop:ed.  Preserve buf[0] for later.
	 */
	uint8_t tmp = brs->ptr[0];
	brs->ptr[0] >>= 1;
	bitrd_read(brs, 1);
	brs->ptr[0] = tmp;
    }
}


uint32_t bitrd_read(BitReadState *brs, int n)
{
    brs->bits += n;
    uint32_t data = 0;

    while (n) {
	if (brs->bit == 0) {
	    brs->buf = brs->ptr[brs->pos];
	    brs->pos++;
	    brs->bit = 8;
	}
	int nn = (n > brs->bit) ? brs->bit : n;
	
	data <<= nn;
	data |= brs->buf >> (8-nn);
	brs->buf <<= nn;
	brs->bit -= nn;
	n -= nn;
    }
    return data;
}


uint8_t bitrd_read8s(BitReadState *brs)
{
    if ( !(brs->flags & BITMODE_SIDEBYTE) ) {
	return bitrd_read(brs, 8);
    }
    brs->bits += 8;
    uint8_t data = 0;

    data = brs->ptr[brs->pos];
    brs->pos++;
    return data;
}


#if 0
/**************************************************************************
 *
 * SECTION  test functions
 *
 ******/
void bit_test(void)
{
    int i;
    BitWriteState bws;
    BitReadState brs;
    uint8_t buf[256];
    int len;
    bitwr_init(&bws, buf, 0);

    bitwr_write(&bws, 1, 1);
    bitwr_write(&bws, 0, 1);
    bitwr_write(&bws, 3, 2);
    bitwr_write(&bws, 0x5a6b7c, 24);

    len=bitwr_flush(&bws);
    printf("buf (%d): ",bws.bits);
    for (i=0; i<len; i++) {
	printf("%02X ",buf[i]);
    }
    printf("\n");

    bitrd_init(&brs, buf, 0);
    uint32_t d;
    d=bitrd_read(&brs, 1);
    printf("rd: %08X\n",d);
    d=bitrd_read(&brs, 0);
    printf("rd: %08X\n",d);
    d=bitrd_read(&brs, 3);
    printf("rd: %08X\n",d);
    d=bitrd_read(&brs, 24);
    printf("rd: %08X\n",d);

}
#endif


/* eof */
