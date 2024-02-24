/**************************************************************************
 *
 * FILE  memory.c
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   handling of memory layouts
 *
 ******/
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "global.h"
#include "memory.h"
#include "message.h"
#include "utils.h"


/**************************************************************************
 *
 * NAME  create_memory, destroy_memory
 *
 * DESCRIPTION
 *   Create/destroy memory.
 *
 ******/
Memory *create_memory(size_t size)
{
    Memory *mem;

    mem = safe_malloc(sizeof(Memory), "Memory");
    mem->buf = safe_calloc(size, 1, "Memory buf");
    mem->size = size;

    mem->low = -1;
    mem->high = -1;

    return mem;
}

void destroy_memory(Memory *mem)
{
    free(mem->buf);
    free(mem);
}


/**************************************************************************
 *
 * NAME  get_byte, set_byte, get_word, set_word
 *
 * DESCRIPTION
 *   Memory accessors.
 *
 ******/
uint8_t get_byte(Memory *mem, mem_ptr_t ad)
{
    return mem->buf[ad & (mem->size-1)];
}


void set_byte(Memory *mem, mem_ptr_t ad, uint8_t val)
{
    mem->buf[ad & (mem->size-1)] = val;
}

uint16_t get_word(Memory *mem, mem_ptr_t ad)
{
    return get_byte(mem, ad) | (get_byte(mem, ad+1) << 8);
}

void set_word(Memory *mem, mem_ptr_t ad, uint16_t val)
{
    set_byte(mem, ad, val & 0xff);
    set_byte(mem, ad+1, val >> 8);
}


size_t insert_mem(Memory *dmem, mem_ptr_t da, uint8_t *src, size_t len)
{
    memcpy(dmem->buf + da, src, len);

    return len;
}


/**************************************************************************
 *
 * NAME  load_mem
 *
 * DESCRIPTION
 *   load a file to memory.
 *
 ******/
void load_mem(Memory *mem, file_t *f, mem_ptr_t *aptr, size_t *lptr)
{
    FILE *fp;
    size_t lrd;
    mem_ptr_t ad;
    mem_ptr_t la;
    int c;

    fp = fopen(f->name, "rb");
    if (!fp) {
	panic("couldn't open source file");
    }

    la = f->la;

    switch (f->mode) {
    case MODE_NORMAL:
	/* get load address */
	la = fgetc(fp) + (fgetc(fp) << 8);
	break;
    case MODE_NEWADDR:
	/* skip load address */
	fgetc(fp);
	fgetc(fp);
	break;
    case MODE_RAW:
	/* no load address */
	break;
    default:
	break;
    }

    /* skip offset if any */
    if (f->offs > 0) {
	fseek(fp, f->offs, SEEK_CUR);
    }

    /* load file body */
    ad = la;
    lrd = 0;
    while ( c = fgetc(fp), c != EOF ) {
	set_byte(mem, ad, c);
	ad++;
	lrd++;
	/* if a max len is specified, then terminate when it has been
	   reached. */
	if (f->len > 0 && lrd >= f->len)
	    break;
    }

    fclose(fp);

    msg(MSG_VERBOSE, "read '%s' $%04X-$%04X.\n", f->name, la, ad);


    if (mem->low < 0 || mem->low > la) {
	mem->low = la;
    }
    if (mem->high < 0 || mem->high < ad) {
	mem->high = ad;
    }

    if (aptr) {
	*aptr = la;
    }
    if (lptr) {
	*lptr = lrd;
    }
}


/**************************************************************************
 *
 * NAME  load_file_to_memory
 *
 * DESCRIPTION
 *   load a file to memory.
 *
 ******/
void load_file_to_memory(Memory *mem, const char *name)
{
    size_t len;
    FILE *fp;
    size_t la;
    size_t sa;
    size_t ea;

    fp = fopen(name, "rb");
    if (!fp) {
	panic("couldn't open file for reading");
    }

    fseek(fp, 0, SEEK_END);
    len = ftell(fp);

    fseek(fp, 0, SEEK_SET);
    la = fgetc(fp) | (fgetc(fp) << 8);
    len -= 2;

    sa = la;
    ea = sa + len;

    uint8_t *b = mem->buf + sa;
    int l = len;
    while (l > 0) {
	size_t n;
	n = fread(b, 1, l, fp);
	b += n;
	l -= n;
    }

    fclose(fp);

    if (mem->low < 0 || mem->low > sa) {
	mem->low = sa;
    }
    if (mem->high < 0 || mem->high < ea) {
	mem->high = ea;
    }
}


/**************************************************************************
 *
 * NAME  save_file_from_memory
 *
 * DESCRIPTION
 *   Write memory contents to file.
 *
 ******/
void save_file_from_memory(Memory *mem, const char *name)
{
    FILE *fp;
    size_t la;
    size_t sa;
    size_t ea;

    sa = mem->low;
    ea = mem->high;
    la = sa;

    fp = fopen(name, "wb");
    if (!fp) {
	panic("couldn't open file for writing");
    }

    fputc(la & 0xff, fp);
    fputc(la >> 8, fp);
    fwrite(mem->buf + sa, 1, ea - sa, fp);

    fclose(fp);

}


/* eof */
