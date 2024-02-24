/**************************************************************************
 *
 * FILE  utils.h
 * Copyright (c) 2012, 2015, 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   utility functions.
 *
 ******/
#ifndef UTILS_H
#define UTILS_H

#include <stdlib.h>

/* memory functions */
void *safe_malloc(size_t size, const char *msg);
void *safe_calloc(size_t nmemb, size_t size, const char *msg);
void *safe_realloc(void *ptr, size_t size, const char *msg);
char *safe_strdup(const char *str, const char *msg);
#if 0
/* apparently not present in mingw32 */
char *safe_strndup(const char *str, int n, const char *msg);
#endif

/* time functions */
double get_time(void);


#endif /* UTILS_H */
/* eof */
