/**************************************************************************
 *
 * FILE  generate_sfx.h
 * Copyright (c) 2015, 2016 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *
 ******/
#ifndef GENERATE_SFX_H
#define GENERATE_SFX_H

#include <stdint.h>
#include "../buffer.h"
#include "../memory.h"


typedef struct {
    mem_ptr_t loadback;
    uint8_t mem;
    uint8_t mem_during;
    mem_ptr_t jump;
    mem_ptr_t fold;
    int flags;
} SfxConfig;


SfxConfig *prepare_sfx(int num_opts, char **opts, int jmp);
int generate_sfx(Buffer *sbf, Memory *dmem, Memory *smem, int safe, int endm, SfxConfig *conf);

#endif /* GENERATE_SFX_H */
/* eof */
