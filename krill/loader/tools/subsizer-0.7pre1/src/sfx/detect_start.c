/**************************************************************************
 *
 * FILE  detect_start.c
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   Try to detect start address for a program file.
 *
 ******/
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>

#include "../global.h"
#include "../memory.h"
#include "detect_start.h"

/**************************************************************************
 *
 * SECTION  memory functions
 *
 ******/
int detect_start(Memory *mem)
{
    int jmp = -1;

    if (mem->low == 0x0801) {
	/* try to find jmp by looking at the sys */
	if (get_byte(mem, 0x0805) == 0x9e) {
	    int ad;
	    for (ad = 0x0806; ad < 0x900; ad++) {
		if (isdigit(get_byte(mem, ad))) {
		    break;
		}
	    }
	    jmp = atoi((char *)&mem->buf[ad]);
	}
    }
    return jmp;
}


/* eof */
