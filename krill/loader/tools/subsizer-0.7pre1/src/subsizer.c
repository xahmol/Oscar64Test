/**************************************************************************
 *
 * FILE  subsizer.c
 * Copyright (c) 2012, 2015, 2016, 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   CBM packer/cruncher
 *
 ******/
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <unistd.h>

#include "bitfunc.h"
#include "buffer.h"
#include "crunch_normal.h"
#include "pathfinder.h"
#include "global.h"
#include "match.h"
#include "memory.h"
#include "message.h"
#include "params.h"
#include "sfx/detect_start.h"
#include "utils.h"

#define MAX_DECRUNCH_SIZE 0x100000

#define HAVE_CRUNCH_LEVEL 0


#define PROGRAM "subsizer"

const char program_g[] = PROGRAM;


typedef struct {
    char *name;
    int (*pack_func)(Buffer *, Buffer *);
    int (*depack_func)(Buffer *, Buffer *);
    int (*mem_func)(Memory *, Memory *, int num_opts, char **opts);
    int (*sfx_func)(Memory *, Memory *, int num_opts, char **opts, int jmp);
} Type;

Type types[] = {
    { /* crunch_normal */
	"normal",
	crunch_normal, decrunch_normal,
	crunch_normal_mem,
	crunch_normal_sfx
    },
    { 0, 0, 0, 0, 0 }
};


static int crunch_raw(Type *p, int num_files, char **srcnames, char *destname, int backwards_mode);
static int decrunch_raw(Type *p, int num_files, char **srcnames, char *destname, int backwards_mode);

static int crunch_mem(Type *p, int num_files, char **srcnames, char *destname, int forwards_mode);
#if HAVE_CRUNCH_LEVEL
static int crunch_level(Type *p, int num_files, char **srcnames, char *destname);
#endif

static int crunch_sfx(Type *p, int num_files, char **srcnames, char *destname, int num_sfx_opts, char **sfx_opts);



int main(int argc, char *argv[])
{
    int c;
    char **srcnames = 0;
    char *destname = "a.out";
    enum { MODE_RAW, MODE_SFX, MODE_MEM, MODE_LEVEL } mode;
    int num_sfx_opts = 0;
    char *sfx_opts[256];
    int backwards_mode;
    int forwards_mode;
    int depack_mode;
    char *pack_type;


    /* defaults */
    verbose_g = 1;
    debug_g = 0;
    mode = MODE_RAW;  /* always raw mode for now */
    backwards_mode = 0;
    forwards_mode = 0;
    depack_mode = 0;
    pack_type = "normal";

    /*
     * scan for valid options
     */
    while (EOF != (c = getopt(argc, argv, "o:t:rmlxX:bfdqvDVh"))) {
        switch (c) {
	
	/* a missing parameter */
	case ':':
	/* an illegal option */
	case '?':
	    exit(1);

	/* set quiet mode */
	case 'q':
	    verbose_g = 0;
	    break;

	/* set verbose mode */
	case 'v':
	    verbose_g++;
	    break;

	/* set debug mode */
	case 'D':
	    debug_g = 1;
	    break;

	/* print version */
	case 'V':
	    fprintf (stdout, PROGRAM " " VERSION "\n");
	    exit(0);

	/* print help */
	case 'h':
	    fprintf(stderr,
PROGRAM " " VERSION ": CBM packer/cruncher\n"
"Copyright (c) 2012, 2015, 2016, 2017 Daniel Kahlin <daniel@kahlin.net>\n"
"Written by Daniel Kahlin <daniel@kahlin.net>\n"
"\n"
"usage: " PROGRAM " [OPTION] FILE...\n"
"\n"
"Valid options:\n"
"    -t<type>        select algorithm type (default: normal)\n"
"    -r              raw file\n"
"    -m              memory file\n"
#if HAVE_CRUNCH_LEVEL
"    -l              level file\n"
#endif
"    -x              executable file\n"
"    -X<opts>        executable options (implies '-x')\n"
"    -b              backwards mode\n"
"    -f              forwards mode\n"
"    -d              decompress\n"
"    -o<name>        output file\n"
"    -q              be quiet\n"
"    -v              be verbose (can be multiple)\n"
"    -D              display debug information\n"
"    -h              displays this help text\n"
"    -V              output program version\n"
	    );
	    exit(0);
	  
	/* set destination name */
	case 'o':
	    destname = optarg;
	    break;

	/* set algorithm type */
	case 't':
	    pack_type = optarg;
	    break;

	/* run in raw mode */
	case 'r':
	    mode = MODE_RAW;
	    break;

	/* run in memory mode */
	case 'm':
	    mode = MODE_MEM;
	    break;

	/* run in level mode */
	case 'l':
	    mode = MODE_LEVEL;
	    break;

	/* set executable mode */
	case 'x':
	    mode = MODE_SFX;
	    break;

	/* set executable options (implying -x) */
	case 'X':
	    mode = MODE_SFX;
	    sfx_opts[num_sfx_opts] = optarg;
	    num_sfx_opts++;
	    break;

	/* run in backwards mode */
	case 'b':
	    backwards_mode = 1;
	    break;

	/* run in forwards mode */
	case 'f':
	    forwards_mode = 1;
	    break;

	/* run in depack mode */
	case 'd':
	    depack_mode = 1;
	    break;

	/* default behavior */
	default:
	    break;
	}
    }

    /*
     * optind now points at the first non option argument
     * expect one or more arguments
     */
    int num_files = argc - optind;
    if (num_files < 1) {
	panic("too few arguments");
    }
    srcnames = &argv[optind];

    Type *p = types;
    while (p->name) {
	if (strcmp(p->name, pack_type) == 0) {
	    break;
	}
	p++;
    }
    if (!p->name) {
	panic("unknown type '%s'", pack_type);
    }


    if (!depack_mode) {
	/* handle crunching */
	switch (mode) {
	case MODE_RAW:
	    crunch_raw(p, num_files, srcnames, destname, backwards_mode);
	    break;
	case MODE_MEM:
	    crunch_mem(p, num_files, srcnames, destname, forwards_mode);
	    break;
#if HAVE_CRUNCH_LEVEL
	case MODE_LEVEL:
	    crunch_level(p, num_files, srcnames, destname);
	    break;
#endif
	case MODE_SFX:

	    if (!p->sfx_func) {
		panic("sfx not available for '%s'", p->name);
	    }
	    crunch_sfx(p, num_files, srcnames, destname, num_sfx_opts, sfx_opts);
	    break;
	default:
	    panic("internal: invalid mode (%d)", mode);
	    break;
	}
    } else {
	/* handle decrunching */
	switch (mode) {
	case MODE_RAW:
	    decrunch_raw(p, num_files, srcnames, destname, backwards_mode);
	    break;
	case MODE_SFX:
	    panic("cannot depack sfx");
	    break;
	default:
	    panic("internal: invalid mode (%d)", mode);
	    break;
	}
    }


    exit(0);
}


static int crunch_raw(Type *p, int num_files, char **srcnames, char *destname, int backwards_mode)
{
    int ret;
    Buffer *sbf;
    Buffer *dbf;

    /* this should handle more than one file */
    sbf = create_buffer_from_file(srcnames[0]);

    dbf = create_buffer(MAX_DECRUNCH_SIZE);

    if (backwards_mode) {
	reverse_buffer(sbf);
    }

    ret = p->pack_func(sbf, dbf);
    if (ret) {
	printf("warning: packing failed. packer returned non-zero!\n");
    }

    msg(MSG_VERBOSE, "packed %zu bytes into %zu bytes\n", sbf->len, dbf->len);

#if 1
    /* verify */
    Buffer *vbf;
    vbf = create_buffer(MAX_DECRUNCH_SIZE);
    ret = p->depack_func(dbf, vbf);
    if (ret) {
	printf("warning: verify failed. depacker returned non-zero!\n");
    } else if (compare_buffer(sbf, vbf) != 0) {
	printf("warning: verify failed. depacked data does not match source data!\n");
    } else {
	msg(MSG_VERBOSE, "verifed %zu bytes...ok\n", sbf->len);
    }
    destroy_buffer(vbf);
#endif

    if (backwards_mode) {
	reverse_buffer(dbf);
    }

    write_buffer_to_file(dbf, destname);

    destroy_buffer(dbf);
    destroy_buffer(sbf);

    return 0;
}



static int decrunch_raw(Type *p, int num_files, char **srcnames, char *destname, int backwards_mode)
{
    int ret;
    Buffer *sbf;
    Buffer *dbf;

    /* this should handle more than one file */
    sbf = create_buffer_from_file(srcnames[0]);

    dbf = create_buffer(MAX_DECRUNCH_SIZE);

    if (backwards_mode) {
	reverse_buffer(sbf);
    }

    ret = p->depack_func(sbf, dbf);
    if (ret) {
	printf("warning: depacking failed. depacker returned non-zero!\n");
    }
    msg(MSG_VERBOSE, "depacked %zu bytes into %zu bytes\n", sbf->len, dbf->len);

    if (backwards_mode) {
	reverse_buffer(dbf);
    }

    write_buffer_to_file(dbf, destname);

    destroy_buffer(dbf);
    destroy_buffer(sbf);

    return 0;
}


static int crunch_mem(Type *p, int num_files, char **srcnames, char *destname, int forwards_mode)
{
    int i;
    int ret;
    Memory *smem;
    Memory *dmem;
    int srclen, destlen;

    smem = create_memory(0x10000);
    dmem = create_memory(0x10000);

    for (i = 0; i < num_files; i++) {
	char *name = srcnames[i];
	file_t f;

	f = parse_filename(name);
	load_mem(smem, &f, 0, 0);
    }
    srclen = smem->high - smem->low;

    //    ret = p->mem_func(smem, dmem, 0, 0);
    ret = p->mem_func(smem, dmem, forwards_mode, 0);  // FIXME: kludge!!!!
    if (ret) {
	printf("warning: packing failed. packer returned non-zero!\n");
    }

    destlen = dmem->high - dmem->low;
    msg(MSG_VERBOSE, "packed %d bytes (%d blocks) into %d bytes (%d blocks)\n", srclen, (srclen+2+253)/254, destlen, (destlen+2+253)/254 );

    save_file_from_memory(dmem, destname);

    destroy_memory(dmem);
    destroy_memory(smem);

    return 0;
}


static int crunch_sfx(Type *p, int num_files, char **srcnames, char *destname, int num_sfx_opts, char **sfx_opts)
{
    int i;
    int ret;
    Memory *smem;
    Memory *dmem;
    int srclen, destlen;
    int jmp = -1;

    smem = create_memory(0x10000);
    dmem = create_memory(0x10000);

    for (i = 0; i < num_files; i++) {
	char *name = srcnames[i];
	file_t f;

	f = parse_filename(name);
	load_mem(smem, &f, 0, 0);
    }
    srclen = smem->high - smem->low;

    if (jmp < 0) {
	int r;
	r = detect_start(smem);
#if 0
	if (r < 0) {
	    panic("couldn't detect start address!");
	}
#endif
	jmp = r;

	msg(MSG_VERBOSE, "detected sys: $%04X\n", jmp);
    }

    /* if presumable basic start, make sure $0800 ends up $00 */
    if (smem->low == 0x0801) {
	set_byte(smem, 0x0800, 0x00);
	smem->low = 0x0800;
    }

    ret = p->sfx_func(smem, dmem, num_sfx_opts, sfx_opts, jmp);
    if (ret) {
	printf("warning: packing failed. packer returned non-zero!\n");
    }

    destlen = dmem->high - dmem->low;
    msg(MSG_VERBOSE, "packed %d bytes (%d blocks) into %d bytes (%d blocks)\n", srclen, (srclen+2+253)/254, destlen, (destlen+2+253)/254 );

    save_file_from_memory(dmem, destname);

    destroy_memory(dmem);
    destroy_memory(smem);

    return 0;
}

/* eof */
