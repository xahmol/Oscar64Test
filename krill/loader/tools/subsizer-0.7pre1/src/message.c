/**************************************************************************
 *
 * FILE  message.c
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   Message handling
 *
 ******/
#include <stdio.h>
#include <stdarg.h>

#include "global.h"
#include "message.h"


void vmsg(msg_level_t level, const char *s, va_list ap)
{
    switch (level) {
    case MSG_DEBUG:
	if (!debug_g) {
	    return;
	}
	break;
    case MSG_VERBOSE:
	if (!verbose_g) {
	    return;
	}
	break;
    default:
	break;
    }

    vprintf(s, ap);
}


void msg(msg_level_t level, const char *s, ...)
{
    va_list ap;
    va_start(ap, s);

    vmsg(level, s, ap);

    va_end(ap);
}


/* eof */
