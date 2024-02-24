/**************************************************************************
 *
 * FILE  global.c
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   Global functions.
 *
 ******/
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

#include "global.h"

/* global variables */
int verbose_g;
int debug_g;

void panic(const char *str, ...)
{
    va_list args;

    fprintf(stderr, "%s: ", program_g);
    va_start(args, str);
    vfprintf(stderr, str, args);
    va_end(args);
    fputc('\n', stderr);
    exit(1);
}

/* eof */
