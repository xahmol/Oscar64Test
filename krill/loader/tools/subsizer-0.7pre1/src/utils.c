/**************************************************************************
 *
 * FILE  utils.c
 * Copyright (c) 2012, 2015, 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   utility functions.
 *
 ******/
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>

#include "global.h"
#include "utils.h"

/**************************************************************************
 *
 * SECTION  memory functions
 *
 ******/
void *safe_malloc(size_t size, const char *msg)
{
    void *ptr = malloc(size);
    if (!ptr) {
	panic("couldn't malloc: %s", msg);
    }

    return ptr;
}

void *safe_calloc(size_t nmemb, size_t size, const char *msg)
{
    void *ptr = calloc(nmemb, size);
    if (!ptr) {
	panic("couldn't calloc: %s", msg);
    }

    return ptr;
}

void *safe_realloc(void *ptr, size_t size, const char *msg)
{
    ptr = realloc(ptr, size);
    if (!ptr) {
	panic("couldn't realloc: %s", msg);
    }

    return ptr;
}


char *safe_strdup(const char *str, const char *msg)
{
    char *dup = strdup(str);
    if (!dup) {
	panic("couldn't strdup: %s", msg);
    }

    return dup;
}


#if 0
/* apparently not present in mingw32 */
char *safe_strndup(const char *str, int n, const char *msg)
{
    char *dup = strndup(str, n);
    if (!dup) {
	panic("couldn't strndup: %s", msg);
    }

    return dup;
}
#endif


/**************************************************************************
 *
 * SECTION  time functions
 *
 ******/
double get_time(void)
{
    struct timeval tv;
    gettimeofday(&tv, 0);

    return tv.tv_sec + 0.000001 * tv.tv_usec;
}


/* eof */
