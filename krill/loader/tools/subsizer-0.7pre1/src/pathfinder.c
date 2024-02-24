/**************************************************************************
 *
 * FILE  pathfinder.c
 * Copyright (c) 2015, 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   find optimized path by considering encoding cost
 *
 ******/
#include <limits.h>
#include <stdio.h>
#include <stdint.h>

#include "bitfunc.h"
#include "pathfinder.h"
#include "global.h"
#include "match.h"
#include "message.h"
#include "utils.h"

#define DEBUG_COMPLEXITY 0


PrimaryPath *create_primarypath(int n, uint8_t *buf)
{
    PrimaryPath *pp;

    pp = safe_malloc(sizeof(PrimaryPath), "primarypath");
    /* allocate n+1 entries to allow for the end marker */
    pp->path = safe_malloc( (n + 1) * sizeof(Match), "matches");
    pp->n = n;
    pp->buf = buf;

    /* insert end marker */
    make_end(&(pp->path[n]));

    return pp;
}

void destroy_primarypath(PrimaryPath *pp)
{
    if (pp) {
	free(pp->path);
	free(pp);
    }
}


/**************************************************************************
 *
 * SECTION  fast cost functions
 *
 ******/
double litcost[0x10000];
double lencost[0x10000];
double offscost1[0x10000];
double offscost2[0x10000];
double offscost3[0x10000];
double offscost[0x10000];

static void prepare_fast(CostFuncSet *cfs, EncodingSet *es)
{
    int i;

    /* prepare tables for fast cost calculations */
    for (i = 0; i < 0x10000; i++) {
	litcost[i] = cfs->cost_lit(es, i);
	lencost[i] = cfs->cost_mlen(es, i);
	offscost1[i] = cfs->cost_moffs(es, i, 1);
	offscost2[i] = cfs->cost_moffs(es, i, 2);
	offscost3[i] = cfs->cost_moffs(es, i, 3);
	offscost[i] = cfs->cost_moffs(es, i, 4);
    }
}

static inline double fast_lit(int l)
{
    return litcost[l];
}

static inline double fast_mlen(int l)
{
    return lencost[l];
}

static inline double fast_moffs(int of, int l)
{
    switch (l) {
    case 1:
	return offscost1[of];
    case 2:
	return offscost2[of];
    case 3:
	return offscost3[of];
    default:
	return offscost[of];
    }
}


/**************************************************************************
 *
 * NAME  find_cheapest_path
 *
 * DESCRIPTION
 *   Consider encoding cost to find the cheapest path through all matches
 *
 ******/
PrimaryPath *find_cheapest_path(MatchTree *mt, CostFuncSet *cfs, EncodingSet *es, unsigned int flags)
{
    int i, j;
    int cur;
    int len = mt->len;
    double *dist;
    double *prev;
    Match *path;

    /* configuration */
    int min_match = 1;
    int enforce_exclusion = (flags & FCP_ENFORCE_EXCLUSION);
    int literal_sequences = (flags & FCP_LITERAL_SEQUENCES);
    int initial_literal = (flags & FCP_INITIAL_LITERAL);

    /* construct lookup tables */
    prepare_fast(cfs, es);

    /* create path tables */
    dist = safe_malloc(sizeof(double) * (len + 1), "dist table");
    prev = safe_malloc(sizeof(double) * (len + 1), "prev table");
    path = safe_malloc(sizeof(Match) * (len + 1), "match table");

    /* initialize costs */
    for (i = 0; i < len+1; i++) {
	/* make sure we have headroom for a few additions. */
	dist[i] = INT_MAX - 0x10000;
	prev[i] = -1;
	//path[i] = 0;
    }
    dist[0] = 0;

#if DEBUG_COMPLEXITY
    int n_match, n_match_taken, n_rle, n_rle_taken, n_lt, n_lt_taken;
    n_match = 0;
    n_match_taken = 0;
    n_rle = 0;
    n_rle_taken = 0;
    n_lt = 0;
    n_lt_taken = 0;
#endif

    /*
     * calculate costs
     */
    cur = 0;
    while (cur < len) {
	int v;
	double w;
	Match *m = mt->match[cur];

	while (m && !is_end(m)) {

	    if (is_match(m) && get_match_len(m) >= min_match ) {
		/* match */
		int l = get_match_len(m);
		int of = get_match_offs(m);
		/*
		 * - does not consider when the escape bit isn't needed.
		 */
		/*
		 * scan through all possible shorter lengths and see if
		 * any are cheaper.
		 * TODO: which choices are actually interesting here?
		 */
		int c = 4;
		while (c && l >= min_match) {
		    w = 1 + fast_mlen(l) + fast_moffs(of, l);
		    v = cur + l;

#if DEBUG_COMPLEXITY
		    n_match++;
#endif
		    if (dist[v] > dist[cur] + w) {
			dist[v] = dist[cur] + w;
			prev[v] = cur;
			make_match(&path[v], of, l);
#if DEBUG_COMPLEXITY
			n_match_taken++;
#endif
		    }

		    l--;
		    c--;
		}
	    } else if (is_rle(m) && get_rle_len(m) >= min_match) {
		/* match */
		int l = get_rle_len(m);
		int of = 1;
		/*
		 * - does not consider when the escape bit isn't needed.
		 */
		/*
		 * scan through all possible shorter lengths and see if
		 * any are cheaper.
		 * TODO: which choices are actually interesting here?
		 */
		int c = 4;
		while (c && l >= min_match) {
		    w = 1 + fast_mlen(l) + fast_moffs(of, l);
		    v = cur + l;

#if DEBUG_COMPLEXITY
		    n_rle++;
#endif
		    if (dist[v] > dist[cur] + w) {
			dist[v] = dist[cur] + w;
			prev[v] = cur;
			make_match(&path[v], of, l);
#if DEBUG_COMPLEXITY
			n_rle_taken++;
#endif
		    }

		    l--;
		    c--;
		}
	    }

	    m++;
	}

	/* literal */
	/*
	 * - should be expanded to handle all possible literal
	 *   sequences
	 */
	if ( enforce_exclusion &&
	     (cur > 0) && (mt->buf[cur-1] == mt->buf[cur]) ) {
	    /* force unbearable cost for bytes breaking the
	       exclusion property */
	    w = 30000;
	} else {
	    w = fast_lit(1);
	}

	v = cur + 1;
#if DEBUG_COMPLEXITY
	n_lt++;
#endif
	if (dist[v] > dist[cur] + w) {
	    dist[v] = dist[cur] + w;
	    prev[v] = cur;
	    make_literal(&path[v], cur, 1);
#if DEBUG_COMPLEXITY
	    n_lt_taken++;
#endif
	}

	if ( !( initial_literal && (cur == 0) ) && literal_sequences ) {
	    int l = (cur + 256 < len) ? 256 : len - cur;
	    while (l > 1) {
		w = fast_lit(l);
		v = cur + l;
#if DEBUG_COMPLEXITY
		n_lt++;
#endif
		if (dist[v] > dist[cur] + w) {
		    dist[v] = dist[cur] + w;
		    prev[v] = cur;
		    make_literal(&path[v], cur, l);
#if DEBUG_COMPLEXITY
		    n_lt_taken++;
#endif
		}

		l--;
	    }
	}


	cur++;
    }

    msg(MSG_DEBUG, "cost=%f bits (%f bytes)\n", dist[len], (dist[len]+7)/8);

#if DEBUG_COMPLEXITY
    printf("n_match=%d (%d), n_rle=%d (%d), n_lit=%d (%d)\n", n_match, n_match_taken, n_rle, n_rle_taken, n_lt, n_lt_taken);
#endif

    /*
     * Backtrack the cheapest path to find the number of primary units
     * to allocate.
     */
    i = len;
    j = 0;
    while (i > 0) {
	j++;
	i = prev[i];
    }

    PrimaryPath *pp;
    pp = create_primarypath(j, mt->buf);
    pp->len = len;
    pp->cost = dist[len];

    /*
     * Backtrack the cheapest path and create primary units accordingly.
     */
    i = len;
    j = pp->n-1;
    while (i > 0) {
	pp->path[j] = path[i];
	j--;
	i = prev[i];
    }


    /* free up path tables */
    free(dist);
    free(prev);
    free(path);

    return pp;
}


/* eof */
