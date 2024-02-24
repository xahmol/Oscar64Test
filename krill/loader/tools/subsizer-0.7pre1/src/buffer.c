/**************************************************************************
 *
 * FILE  buffer.c
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   handling of buffers
 *
 ******/
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "global.h"
#include "buffer.h"
#include "utils.h"


/**************************************************************************
 *
 * NAME  create_buffer, destroy_buffer
 *
 * DESCRIPTION
 *   Create/destroy buffer.
 *
 ******/
Buffer *create_buffer(size_t size)
{
    Buffer *bf;

    bf = safe_malloc(sizeof(Buffer), "Buffer");
    bf->buf = safe_malloc(size, "Buffer buf");
    bf->size = size;

    bf->pos = 0;
    bf->len = 0;

    return bf;
}

void destroy_buffer(Buffer *bf)
{
    free(bf->buf);
    free(bf);
}



/**************************************************************************
 *
 * NAME  create_buffer_from_file
 *
 * DESCRIPTION
 *   Create a new buffer from file.
 *
 ******/
Buffer *create_buffer_from_file(const char *name)
{
    Buffer *bf;
    size_t len;
    FILE *fp;

    fp = fopen(name, "rb");
    if (!fp) {
	panic("couldn't open file for reading");
    }

    fseek(fp, 0, SEEK_END);
    len = ftell(fp);
    bf = create_buffer(len);

    fseek(fp, 0, SEEK_SET);

    uint8_t *b = bf->buf;
    int l = len;
    while (l > 0) {
	size_t n;
	n = fread(b, 1, l, fp);
	b += n;
	l -= n;
    }

    fclose(fp);

    bf->len = len;

    return bf;
}


/**************************************************************************
 *
 * NAME  write_buffer_to_file
 *
 * DESCRIPTION
 *   Write buffer contents to file.
 *
 ******/
void write_buffer_to_file(Buffer *bf, const char *name)
{
    FILE *fp;

    fp = fopen(name, "wb");
    if (!fp) {
	panic("couldn't open file for writing");
    }

    fwrite(bf->buf, 1, bf->len, fp);

    fclose(fp);

}


/**************************************************************************
 *
 * NAME  compare_buffer
 *
 * DESCRIPTION
 *   Compare buffer contents
 *
 ******/
int compare_buffer(Buffer *bf1, Buffer *bf2)
{
    if (bf1->len != bf2->len) {
	return -1;
    }

    if (memcmp(bf1->buf, bf2->buf, bf1->len) != 0) {
	return -1;
    }

    return 0;
}


/**************************************************************************
 *
 * NAME  reverse_buffer
 *
 * DESCRIPTION
 *   Reverse buffer contents
 *
 ******/
void reverse_buffer(Buffer *bf)
{
    size_t i, l;
    uint8_t *buf;

    l = bf->len;
    buf = bf->buf;

    for (i = 0; i < l/2; i++) {
	uint8_t b;
	b = buf[l-i-1];
	buf[l-i-1] = buf[i];
	buf[i] = b;
    }
}


/* eof */
