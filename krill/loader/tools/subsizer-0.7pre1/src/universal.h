/**************************************************************************
 *
 * FILE  universal.h
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   universal encodings
 *
 ******/
#ifndef UNIVERSAL_H
#define UNIVERSAL_H

#include "bitfunc.h"

int cost_unary(int v, int lim);
void write_unary(BitWriteState *bws, int v, int lim, int pol);
int read_unary(BitReadState *brs, int lim, int pol);

int cost_eliasgamma(int v);
void write_eliasgamma(BitWriteState *bws, int v);
int read_eliasgamma(BitReadState *brs);

#endif /* UNIVERSAL_H */
/* eof */
