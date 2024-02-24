/**************************************************************************
 *
 * FILE  global.h
 * Copyright (c) 2015, 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   Global functions.
 *
 ******/
#ifndef GLOBAL_H
#define GLOBAL_H

#include <stdarg.h>

#define PACKAGE "subsizer"
#define VERSION "0.7pre1"

/* global variables */
extern const char program_g[];
extern int verbose_g;
extern int debug_g;

void panic(const char *str, ...);

#endif /* GLOBAL_H */
/* eof */
