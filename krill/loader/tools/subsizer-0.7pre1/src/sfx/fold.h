/**************************************************************************
 *
 * FILE  fold.h
 * Copyright (c) 2015, 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *
 ******/
#ifndef FOLD_H
#define FOLD_H

#include "generate_sfx.h"
#include "../memory.h"

SfxConfig *fold(Memory *smem, Memory *dmem, mem_ptr_t low_limit, mem_ptr_t high_limit, SfxConfig *conf);


#endif /* FOLD_H */
/* eof */
