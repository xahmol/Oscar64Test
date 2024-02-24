/**************************************************************************
 *
 * FILE  match.c
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   create match structure
 *
 ******/
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#include "global.h"
#include "match.h"
#include "utils.h"


/**************************************************************************
 *
 * SECTION  packer
 *
 ******/

MatchTree *create_matchtree(void)
{
    MatchTree *mt;

    mt = safe_malloc(sizeof(MatchTree), "MatchTree");
    mt->match = 0;
    mt->match_buf = 0;

    mt->min_offs = 1;
    mt->max_offs = 0x10000;

    /* shortest match is l=1 */
    /* 1 + 1 + 1 + 5 bits is less than 1 * literal */
    //mt->min_offs1 = 1;
    mt->max_offs1 = 32;
#if 0
    /* 1 + 2 + 1 + 13 bits is less than 2 * literal */
    //mt->min_offs2 = 1;
    mt->max_offs2 = 0x2000;
#else
    /* shortest match is l=2 */
    /* 1 + 1 + 1 + 14 bits is less than 2 * literal */
    //mt->min_offs2 = 1;
    mt->max_offs2 = 0x4000;
#endif
    mt->min_len = 1;
    mt->max_len = 0x100;
    mt->min_rle = 2;
    mt->max_rle = 0x100;
    mt->rle_holdoff = 8;
    //mt->rle_holdoff = 1000000;

    /* maybe allocate entries for the actual buffer already here? */

    //printf("sizeof(Match) = %d\n", sizeof(Match));

    return mt;
}

void destroy_matchtree(MatchTree *mt)
{
    if (mt) {
	free(mt->match);
	free(mt->match_buf);
	free(mt);
    }
}


int build_match(MatchTree *mt, uint8_t *buf, int len)
{
    int cur;
    int rcnt;

    mt->buf = buf;
    mt->len = len;
    mt->match = safe_malloc(len * sizeof(Match *), "match table");

    /* this should be replaced by some dynamic realloc! */
    mt->match_buf = safe_malloc(200000000 * sizeof(Match), "matches");


    Match *cur_m = mt->match_buf;

    /* do the processing */
    rcnt = 0;
    cur = 0;
    while (cur < len) {
	int i;
	int window;
	int rlen;
	Match **mp = &mt->match[cur];
	uint8_t v = buf[cur];
	Match *last_m = cur_m;

	/* find matches */
	*mp = 0;

	/* check rle */
	rlen = 1;
	while ((cur + rlen < len) && buf[cur + rlen] == v) {
	    rlen++;
	    if (rlen == mt->max_rle) {
		break;
	    }
	}
	if (rlen >= mt->min_rle) {
	    /* skip the first rle */
	    if (rcnt > 0) {
		make_rle(cur_m, cur, rlen);
		cur_m++;
	    }
	    rcnt++;
	    if (rcnt > mt->rle_holdoff) {
		goto cont;  /* gaah!  Clean me up! */
	    }
	} else {
	    rcnt = 0;
	}

	/* max search range from the current offset */
	window = (cur < mt->max_offs) ? cur : mt->max_offs;

	/* seek for matches within that window */
	for (i = mt->min_offs; i <= window; i++) {
	    int moffs = i;
	    int mlen = 0;

	    /*
	     * optimized search, first check if at least one byte matches,
	     * then start scanning with end check and similar
	     */
	    if (buf[cur-i] == v) {
		mlen++;

		while ((cur+mlen < len) && buf[cur-i+mlen] == buf[cur+mlen]) {
		    mlen++;
		    if (mlen == mt->max_len) {
			break;
		    }
		}
	    }

	    /* this should probably consider the min_len. */
	    if ( (mlen >= mt->min_len) && (
		   (mlen >= 1 && moffs <= mt->max_offs1) ||
		   (mlen >= 2 && moffs <= mt->max_offs2) ||
		   (mlen >= 3) )
		 ) {
		make_match(cur_m, moffs, mlen);
		cur_m++;
	    }

	}

    cont:
	if (last_m != cur_m) {
	    make_end(cur_m);
	    cur_m++;
	    *mp = last_m;
	}

	cur++;
    }

    if (debug_g) {
	int n_tot = 0, n_rle_tot = 0;
	for (cur = 0; cur < len; cur++) {
	    printf("%d: $%02x, ", cur, mt->buf[cur]);
	    if (mt->match[cur] == 0) {
		printf("literal\n");
	    } else {
		int n = 0, n_rle = 0;
		int max_match = 0, max_rle = 0;
		Match *m = mt->match[cur];
		while (m && !is_end(m)) {
		    if (is_rle(m)) {
			int l = get_rle_len(m);
			if (l > max_rle) {
			    max_rle = l;
			}
			n_rle++;
		    } else if (is_match(m)) {
			int l = get_match_len(m);
			if (l > max_match) {
			    max_match = l;
			}
			n++;
		    }
		    m++;
		}
		n_tot += n;
		n_rle_tot += n_rle;
		if (n_rle) {
		    printf("%d rle (l=%d)", n_rle, max_rle);
		}
		if (n) {
		    if (n_rle) {
			printf(", ");
		    }
		    printf("%d matches (l=%d)", n, max_match);
		}
		printf("\n");
	    }
	}
	printf("%d total rle\n", n_rle_tot);
	printf("%d total matches\n", n_tot);
    }

    return 0;
}



/* eof */
