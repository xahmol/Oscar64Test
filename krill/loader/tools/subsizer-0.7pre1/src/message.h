/**************************************************************************
 *
 * FILE  message.h
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   Message handling.
 *
 ******/
#ifndef MESSAGE_H
#define MESSAGE_H

#include <stdarg.h>

typedef enum { MSG_DEBUG, MSG_VERBOSE } msg_level_t;

void msg(msg_level_t level, const char *s, ...);
void vmsg(msg_level_t level, const char *s, va_list ap);

#endif /* MESSAGE_H */
/* eof */
