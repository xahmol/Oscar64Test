/**************************************************************************
 *
 * FILE  detect_start.h
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   Try to detect start address for a program file.
 *
 ******/
#ifndef DETECT_START_H
#define DETECT_START_H

#include "../memory.h"

int detect_start(Memory *mem);

#endif /* DETECT_START_H */
/* eof */
