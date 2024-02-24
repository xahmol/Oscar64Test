/**************************************************************************
 *
 * FILE  bits-base.h
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   bits-base optimization
 *
 ******/
#ifndef BITS_BASE_H
#define BITS_BASE_H

#include "bitfunc.h"
#include "histogram.h"

typedef enum {
    PRE_BINARY = 0,
    PRE_UNARY = 1,
    PRE_UNARY_INV,
} prefix_t;

#define MAX_PARTS 16
typedef struct {
    int floor;
    int n;
    prefix_t prefix;
    char parts[MAX_PARTS];
} Encoding;

void optimize_enc(Hist *h, int floor, int n, prefix_t prefix, Encoding *enc);

void print_enc(Encoding *enc);
void print_enc_long(Encoding *enc);

int cost_enc(Encoding *enc, int v);
void write_enc(BitWriteState *bws, Encoding *enc, int v);
int read_enc(BitReadState *brs, Encoding *enc);


#endif /* BITS_BASE_H */
/* eof */
