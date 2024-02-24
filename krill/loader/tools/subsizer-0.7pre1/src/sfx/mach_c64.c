/**************************************************************************
 *
 * FILE  mach_c64.c
 * Copyright (c) 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *
 ******/

#include "../memory.h"


/**************************************************************************
 *
 * NAME  is_basic(), is_io(), is_kernal()
 *
 * DESCRIPTION
 *   Identify if address is within special section.
 *
 ******/
int is_basic(mem_ptr_t ad)
{
    if (ad >= 0xa000 && ad <= 0xbfff) {
	return 1;
    }
    return 0;
}

int is_io(mem_ptr_t ad)
{
    if (ad >= 0xd000 && ad <= 0xdfff) {
	return 1;
    }
    return 0;
}

int is_kernal(mem_ptr_t ad)
{
    if (ad >= 0xe000 && ad <= 0xffff) {
	return 1;
    }
    return 0;
}



/* eof */
