/**************************************************************************
 *
 * FILE  buffer.h
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   handling of buffers
 *
 ******/
#ifndef BUFFER_H
#define BUFFER_H

#include <stdint.h>
#include <stdlib.h>

typedef struct {
    uint8_t *buf;
    size_t size;

    size_t pos;
    size_t len;

} Buffer;


Buffer *create_buffer(size_t size);
void destroy_buffer(Buffer *bf);
Buffer *create_buffer_from_file(const char *name);
void write_buffer_to_file(Buffer *bf, const char *name);
int compare_buffer(Buffer *bf1, Buffer *bf2);
void reverse_buffer(Buffer *bf);


#endif /* BUFFER_H */
/* eof */
