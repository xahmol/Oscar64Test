/**************************************************************************
 *
 * FILE  params.h
 * Copyright (c) 2012, 2015 Daniel Kahlin
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   parameter parsing
 *
 ******/
#ifndef PARAMS_H
#define PARAMS_H

#include "memory.h"

int parse_value(char *str);
void parse_range(char *str, mem_ptr_t *low, mem_ptr_t *high);
file_t parse_filename(char *str);

#endif /* PARAMS_H */
/* eof */
