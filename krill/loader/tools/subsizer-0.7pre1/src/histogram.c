/**************************************************************************
 *
 * FILE  histogram.c
 * Copyright (c) 2015, 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   handling of histograms
 *
 ******/
#include <math.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#include "global.h"
#include "histogram.h"
#include "utils.h"


Hist *create_histogram(int range, int window)
{
    Hist *h;

    h = safe_malloc(sizeof(Hist), "Histogram");
    h->range = range;
    h->bin = safe_calloc(range, sizeof(size_t), "histogram bins");
    h->cost = safe_calloc(range, sizeof(double), "histogram costs");

    h->window = window;
    h->wbuf = 0;
    h->wcnt = 0;
    if (h->window) {
	h->wbuf = safe_calloc(h->window, sizeof(HistEntry), "histogram window");
    }

    h->he = 0;
    return h;
}

void destroy_histogram(Hist *h)
{
    free(h->he);
    free(h->wbuf);
    free(h->bin);
    free(h->cost);
    free(h);
}

void hist_reset(Hist *h)
{
    int i;
    for (i = 0; i < h->range; i++) {
	h->bin[i] = 0;
	h->cost[i] = 0;
    }
}


void hist_add(Hist *h, int v, double cost)
{
    h->bin[v]++;
    h->cost[v] += cost;

    if (h->wbuf) {
	HistEntry *he = &h->wbuf[h->wcnt];
	if (he->n) {
	    h->bin[he->val]--;
	    h->cost[he->val] -= he->cost;
	}

	he->n = 1;
	he->val = v;
	he->cost = cost;

	h->wcnt = (h->wcnt + 1) % h->window;
    }
}


HistEntry *get_histlist(Hist *h)
{
    int i;
    int n;
    HistEntry *he = h->he;

    if (he) {
	return he;
    }

    n = 0;
    for (i = 0; i < h->range; i++) {
	if (h->bin[i]) {
	    n++;
	}
    }

    he = safe_malloc(sizeof(HistEntry) * (n + 1), "histogram list");
    h->he = he;
    for (i = 0; i < h->range; i++) {
	if (h->bin[i]) {
	    he->val = i;
	    he->n = h->bin[i];
	    he->cost = h->cost[i];
	    he++;
	}
    }
    he->n = 0;

    return h->he;
}


/**************************************************************************
 *
 * NAME  get_histrange
 *
 * DESCRIPTION
 *   get the actual range used.
 *
 ******/
int get_histrange(Hist *h)
{
    int i;
    for (i = h->range-1; i >= 0; --i) {
	if (h->bin[i])
	    break;
    }

    return i;
}

/**************************************************************************
 *
 * NAME  get_number
 *
 * DESCRIPTION
 *   get the number of values added.
 *
 ******/
size_t get_number(Hist *h)
{
    int i;
    size_t n;

    n = 0;
    for (i = 0; i < h->range; i++) {
	n += h->bin[i];
    }

    return n;
}

/**************************************************************************
 *
 * NAME  get_entropy
 *
 * DESCRIPTION
 *   Calculate the Shannon entropy of a histogram
 *
 ******/
double get_entropy(Hist *h)
{
    int i;
    double e;

    size_t n = get_number(h);

    e = 0.0;
    for (i = 0; i < h->range; i++) {
	if (h->bin[i]) {
	    double p = (double)h->bin[i] / n;
	    e += -(log(p)/log(2)) * p;
	}
    }

    return e;
}


/* eof */
