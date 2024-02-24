/**************************************************************************
 *
 * FILE  mach_c64.h
 * Copyright (c) 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *
 ******/
#ifndef MACH_C64_H
#define MACH_C64_H

#include "../memory.h"

int is_basic(mem_ptr_t ad);
int is_io(mem_ptr_t ad);
int is_kernal(mem_ptr_t ad);

#endif /* MACH_C64_H */
/* eof */
