/**************************************************************************
 *
 * FILE  histogram.h
 * Copyright (c) 2015, 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   handling of histograms
 *
 ******/
#ifndef HISTOGRAM_H
#define HISTOGRAM_H

#include <stdint.h>
#include <stdlib.h>

typedef struct {
    int val;
    size_t n;
    double cost;
} HistEntry;

typedef struct {
    int range;
    size_t *bin;
    double *cost;

    int window;
    HistEntry *wbuf;
    int wcnt;

    HistEntry *he;
} Hist;

Hist *create_histogram(int range, int window);
void destroy_histogram(Hist *h);
void hist_reset(Hist *h);
void hist_add(Hist *h, int v, double cost);
HistEntry *get_histlist(Hist *h);
int get_histrange(Hist *h);
size_t get_number(Hist *h);
double get_entropy(Hist *h);

#endif /* HISTOGRAM_H */
/* eof */
