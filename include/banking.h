#ifndef BANKING_H
#define BANKING_H

#define BNK_DEFAULT 0x0e
#define BNK_0_FULL 0x3f
#define BNK_1_FULL 0x7f
#define BMK_0_IO 0x3e
#define BNK_1_IO 0x7e

void load_overlay(const char *fname);
void bnk_init();
void bnk_exit();

__noinline char bnk_readb(char cr, volatile char *p);
__noinline unsigned bnk_readw(char cr, volatile unsigned *p);
__noinline unsigned long bnk_readl(char cr, volatile unsigned long *p);
__noinline void bnk_writeb(char cr, volatile char *p, char b);
__noinline void bnk_writew(char cr, volatile unsigned *p, unsigned w);
__noinline void bnk_writel(char cr, volatile unsigned long *p, unsigned long l);
__noinline void bnk_memcpy(char dcr, char *dp, char scr, volatile char *sp, unsigned size);
__noinline void bnk_memset(char cr, char *p, char val, unsigned size);
__noinline void bnk_cpytovdc(unsigned vdcdest, char scr, volatile char * sp, unsigned size);
__noinline void bnk_cpyfromvdc(char dcr, volatile char * dp, unsigned vdcsrc, unsigned size);

#pragma compile("banking.c")

#endif