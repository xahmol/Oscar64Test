#ifndef BANKING_H
#define BANKING_H

// Defines for MMU modes, MMU $FF00 configuration values
#define BNK_DEFAULT 0x0e
#define BNK_CHARROM 0x01
#define BNK_0_FULL 0x3f
#define BNK_1_FULL 0x7f
#define BMK_0_IO 0x3e
#define BNK_1_IO 0x7e

// Defines for scroll directions
#define SCROLL_LEFT 0x01
#define SCROLL_RIGHT 0x02
#define SCROLL_DOWN 0x04
#define SCROLL_UP 0x08

// Function Prototypes

// Not in overlay
void load_overlay(const char *fname);
void bnk_init();
void bnk_exit();
char getcurrentdevice();

// In overlay
__noinline char bnk_readb(char cr, volatile char *p);
__noinline unsigned bnk_readw(char cr, volatile unsigned *p);
__noinline unsigned long bnk_readl(char cr, volatile unsigned long *p);
__noinline void bnk_writeb(char cr, volatile char *p, char b);
__noinline void bnk_writew(char cr, volatile unsigned *p, unsigned w);
__noinline void bnk_writel(char cr, volatile unsigned long *p, unsigned long l);
__noinline void bnk_memcpy(char dcr, char *dp, char scr, volatile char *sp, unsigned size);
__noinline void bnk_memset(char cr, char *p, char val, unsigned size);
__noinline void bnk_cpytovdc(unsigned vdcdest, char scr, volatile char *sp, unsigned size);
__noinline void bnk_cpyfromvdc(char dcr, volatile char *dp, unsigned vdcsrc, unsigned size);
__noinline void bnk_redef_charset(unsigned vdcdest, char scr, volatile char *sp, unsigned size);
__noinline bool bnk_load(char device, char bank, const char *start, const char *fname);
__noinline bool bnk_save(char device, char bank, const char *start, const char *end, const char *fname);
__noinline void sid_startmusic();
__noinline void sid_stopmusic();

// Global variables
extern char bootdevice;

#pragma compile("banking.c")

#endif