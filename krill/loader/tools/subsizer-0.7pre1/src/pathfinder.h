/**************************************************************************
 *
 * FILE  pathfinder.h
 * Copyright (c) 2015, 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   create encoding structure
 *
 ******/
#ifndef PATHFINDER_H
#define PATHFINDER_H

#include <stdint.h>
#include <stdlib.h>

#include "match.h"

typedef struct {
    int n;
    double cost;
    Match *path;
    uint8_t *buf;
    size_t len;
} PrimaryPath;

PrimaryPath *create_primarypath(int n, uint8_t *buf);
void destroy_primarypath(PrimaryPath *pp);


typedef struct EncodingSet EncodingSet;

typedef struct {
    double (*cost_lit)(EncodingSet *es, int l);
    double (*cost_mlen)(EncodingSet *es, int l);
    double (*cost_moffs)(EncodingSet *es, int of, int l);
} CostFuncSet;

#define FCP_ENFORCE_EXCLUSION (1 << 0)
#define FCP_LITERAL_SEQUENCES (1 << 1)
#define FCP_INITIAL_LITERAL   (1 << 2)

PrimaryPath *find_cheapest_path(MatchTree *mt, CostFuncSet *cfs, EncodingSet *es, unsigned int flags);


#endif /* PATHFINDER_H */
/* eof */
