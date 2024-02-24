/**************************************************************************
 *
 * FILE  bitfunc.h
 * Copyright (c) 2009-2011, 2013-2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   bitstream read/write functions.
 *
 ******/
#ifndef BITFUNC_H
#define BITFUNC_H

#include <stdint.h>

#define BITMODE_SIDEBYTE (1<<0)
#define BITMODE_PRESHIFT (1<<1)
//#define BITMODE_ROR      (1<<2)

/* bit writer */
typedef struct {
    uint8_t *ptr;
    int pos;
    int bits;
    uint8_t buf;
    int bit;
    int bpos;
    unsigned int flags;
} BitWriteState;

void bitwr_init(BitWriteState *bws, uint8_t *destbuf, unsigned int flags);
void bitwr_write(BitWriteState *bws, uint32_t data, int n);
void bitwr_write8s(BitWriteState *bws, uint8_t data);
int bitwr_flush(BitWriteState *bws);

/* bit reader */
typedef struct {
    uint8_t *ptr;
    int pos;
    int bits;
    uint8_t buf;
    int bit;
    unsigned int flags;
} BitReadState;

void bitrd_init(BitReadState *brs, uint8_t *srcbuf, unsigned int flags);
uint32_t bitrd_read(BitReadState *brs, int n);
uint8_t bitrd_read8s(BitReadState *brs);

#endif /* BITFUNC_H */
/* eof */
