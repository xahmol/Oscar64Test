#ifndef PEEKPOKE_H
#define PEEKPOKE_H

// Defines for PEEK and POKE functions
#define POKE(addr, val) (*(unsigned char *)(addr) = (val))
#define POKEW(addr, val) (*(unsigned *)(addr) = (val))
#define PEEK(addr) (*(unsigned char *)(addr))
#define PEEKW(addr) (*(unsigned *)(addr))

#endif