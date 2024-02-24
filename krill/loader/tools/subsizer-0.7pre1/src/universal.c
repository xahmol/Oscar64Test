/**************************************************************************
 *
 * FILE  universal.c
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   universal encodings
 *
 ******/
#include <stdio.h>

#include "bitfunc.h"
#include "universal.h"
#include "global.h"


/**************************************************************************
 *
 * NAME  cost_unary, write_unary, read_unary
 *
 ******/
int cost_unary(int v, int lim)
{
    if (v == lim-1) {
	return v;
    }
    return v+1;
}


void write_unary(BitWriteState *bws, int v, int lim, int pol)
{
    uint32_t mask = pol ? 0xfffffff : 0;
    int endbit = pol ? 0 : 1;

    bitwr_write(bws, mask, v);
    if (v < lim-1) {
	bitwr_write(bws, endbit, 1);
    }
}


int read_unary(BitReadState *brs, int lim, int pol)
{
    int n = 0;
    while (bitrd_read(brs, 1) == pol) {
	n++;
	if (n == lim-1) {
	    break;
	}
    }
    return n;
}


/**************************************************************************
 *
 * NAME  cost_eliasgamma, write_eliasgamma, read_eliasgamma
 *
 ******/
int cost_eliasgamma(int v)
{
    int n;

    /* find first 1 */
    for (n = 31; n >= 0; n--) {
	if ( (v>>n) & 0x01)
	    break;
    }
    return n + n+1;
}


void write_eliasgamma(BitWriteState *bws, int v)
{
    int n;
    /* find first 1 */
    for (n = 31; n >= 0; n--) {
	if ( (v>>n) & 0x01)
	    break;
    }

    bitwr_write(bws, 0, n);
    bitwr_write(bws, v, n+1);
}


int read_eliasgamma(BitReadState *brs)
{
    int v;
    int n = 0;
    while (bitrd_read(brs, 1) == 0) {
	n++;
    }
    if (n == 16) {
	/* short cut to end marker */
	return 0x10000;
    }

    v = bitrd_read(brs, n);
    v |= 1<<n;

    return v;
}


/* eof */
