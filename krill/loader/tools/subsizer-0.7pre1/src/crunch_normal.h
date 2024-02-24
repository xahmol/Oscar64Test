/**************************************************************************
 *
 * FILE  crunch_normal.h
 * Copyright (c) 2015, 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   create encoding structure
 *
 ******/
#ifndef CRUNCH_NORMAL_H
#define CRUNCH_NORMAL_H

#include <stdint.h>

#include "buffer.h"
#include "memory.h"

int crunch_normal(Buffer *sbf, Buffer *dbf);
int decrunch_normal(Buffer *sbf, Buffer *dbf);
int crunch_normal_mem(Memory *smem, Memory *dmem, int num_opts, char **opts);
int crunch_normal_sfx(Memory *smem, Memory *dmem, int num_opts, char **opts, int jmp);

#endif /* CRUNCH_NORMAL_H */
/* eof */
