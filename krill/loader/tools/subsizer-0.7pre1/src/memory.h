/**************************************************************************
 *
 * FILE  memory.h
 * Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *   handling of memory layouts
 *
 ******/
#ifndef MEMORY_H
#define MEMORY_H

#include <stdint.h>
#include <stdlib.h>

typedef uint32_t mem_ptr_t;

typedef struct {
    uint8_t *buf;
    size_t size;

    int low;
    int high;
} Memory;


Memory *create_memory(size_t size);
void destroy_memory(Memory *mem);

uint8_t get_byte(Memory *mem, mem_ptr_t ad);
void set_byte(Memory *mem, mem_ptr_t ad, uint8_t val);
uint16_t get_word(Memory *mem, mem_ptr_t ad);
void set_word(Memory *mem, mem_ptr_t ad, uint16_t val);

size_t insert_mem(Memory *dmem, mem_ptr_t da, uint8_t *src, size_t len);



enum mode_t {
    MODE_NORMAL = 0,
    MODE_NEWADDR,
    MODE_RAW
};

typedef struct {
    char *name;
    enum mode_t mode;
    mem_ptr_t la;
    int offs;
    int len;
} file_t;

void load_mem(Memory *mem, file_t *f, mem_ptr_t *aptr, size_t *lptr);

void load_file_to_memory(Memory *mem, const char *name);
void save_file_from_memory(Memory *mem, const char *name);


#endif /* MEMORY_H */
/* eof */
