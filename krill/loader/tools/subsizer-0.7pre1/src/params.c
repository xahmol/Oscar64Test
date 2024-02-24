/**************************************************************************
 *
 * FILE  params.c
 * Copyright (c) 2012, 2015 Daniel Kahlin
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   parameter parsing
 *
 ******/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "memory.h"
#include "global.h"
#include "params.h"



static unsigned long int my_strtoul(char *ptr, char **eptr)
{
    int base;
    unsigned long int v;

    switch (*ptr) {
    case '$':
	base = 16;
	ptr++;
	break;
    case '@':
	base = 8;
	ptr++;
	break;
    case '%':
	base = 2;
	ptr++;
	break;
    default:
	base = 0;
	break;
    }

    v = strtoul(ptr, eptr, base);

    return v;
}


int parse_value(char *str)
{
    char *eptr;
    unsigned long int v;

    v = my_strtoul(str, &eptr);
    if ( str == eptr || *eptr != 0 )
	panic("couldn't parse value (%s)", str);

    return v;
}

void parse_range(char *str, mem_ptr_t *low, mem_ptr_t *high)
{
    char *p;
    if ( !(str && strlen(str)) ) {
	return;
    }

    p = strchr(str, '-');
    if (p) {
	*p++ = 0;
	if (*p != 0) {
	    *high = parse_value(p);
	}
    }
    if (*str != 0) {
	*low = parse_value(str);
    }
}

file_t parse_filename(char *name)
{
    char *p, *name_end;
    char c;
    char *eptr;
    unsigned long int v;
    file_t file;

    file.name = name;
    file.mode = MODE_NORMAL;
    file.la = 0;
    file.offs = -1;
    file.len = -1;


    p = name;
    /* parse */
    p = strpbrk(p, ",@");
    if (p) {
	name_end = p;
	c = *p++;

	switch (c) {
	case ',':
	    v = my_strtoul(p, &eptr);
	    if (p == eptr && *p != ',') {
		panic("missing start address");
	    }
	    if (p != eptr) {
		file.la = v;
		file.mode = MODE_NEWADDR;
	    }

	    p = eptr;
	    break;
	case '@':
	    file.la = my_strtoul(p, &eptr);
	    if (p == eptr) {
		panic("missing start address");
	    }
	    file.mode = MODE_RAW;

	    p = eptr;
	    break;
	default:
	    break;
	}

	p = strchr(p, ',');
	if (p) {
	    p++;
	    v = my_strtoul(p, &eptr);
	    if (p != eptr) {
		file.offs = v;
	    }

	    p = strchr(p, ',');
	    if (p) {
		p++;
		file.len = parse_value(p);
	    }
	}

	/* mark the end of the file name */
	*name_end = 0;
    }

    if (debug_g) {
	printf("name='%s', ad=$%04X, offs=%d, len=%d, mode=%d\n", file.name, file.la, file.offs, file.len, file.mode);
    } 

    return file;
}

/* eof */
