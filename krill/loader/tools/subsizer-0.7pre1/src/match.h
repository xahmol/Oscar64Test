/**************************************************************************
 *
 * FILE  match.h
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   create match structure
 *
 ******/
#ifndef MATCH_H
#define MATCH_H

#include <stdint.h>



typedef struct {
    /*
     * MTYPE_END: ?
     * MTYPE_LITERAL: ?
     * MTYPE_MATCH: ?
     * MTYPE_RLE: ?
     */
#define MTYPE_END 0
#define MTYPE_LITERAL 1
#define MTYPE_MATCH 2
#define MTYPE_RLE 3

    uint32_t type:8;
    uint32_t len:24;
    uint32_t offs;
} Match;



static inline void make_end(Match *m)
{
    m->type = MTYPE_END;
}

static inline int is_end(Match *m)
{
    return m->type == MTYPE_END;
}


static inline void make_rle(Match *m, uint32_t src, int len)
{
    m->type = MTYPE_RLE;
    m->offs = src;
    m->len = len;
}

static inline int is_rle(Match *m)
{
    return m->type == MTYPE_RLE;
}
static inline int get_rle_len(Match *m)
{
    return m->len;
}
static inline int get_rle_src(Match *m)
{
    return m->offs;
}


static inline void make_match(Match *m, uint32_t offs, int len)
{
    m->type = MTYPE_MATCH;
    m->len = len;
    m->offs = offs;
}

static inline int is_match(Match *m)
{
    return m->type == MTYPE_MATCH;
}
static inline int get_match_len(Match *m)
{
    return m->len;
}
static inline int get_match_offs(Match *m)
{
    return m->offs;
}


static inline void make_literal(Match *m, uint32_t src, int len)
{
    m->type = MTYPE_LITERAL;
    m->offs = src;
    m->len = len;
}

static inline int is_literal(Match *m)
{
    return m->type == MTYPE_LITERAL;
}
static inline int get_literal_len(Match *m)
{
    return m->len;
}
static inline int get_literal_src(Match *m)
{
    return m->offs;
}

typedef struct {
    int min_offs;
    int max_offs;
    int max_offs1;
    int max_offs2;
    int min_len;
    int max_len;
    int min_rle;
    int max_rle;
    int rle_holdoff;

    uint8_t *buf;
    int len;
    Match **match;
    Match *match_buf;
} MatchTree;


MatchTree *create_matchtree(void);
void destroy_matchtree(MatchTree *mt);

int build_match(MatchTree *mt, uint8_t *srcbuf, int srclen);

#endif /* MATCH_H */
/* eof */
