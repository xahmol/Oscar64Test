#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <petscii.h>
#include <c64/kernalio.h>
#include <c128/vdc.h>
#include <c128/mmu.h>
#include "c128/vdc.h"
#include "banking.h"
#include "peekpoke.h"

// Section and region for low memory area overlay
#pragma overlay( ovl1, 1 )
#pragma section( bcode1, 0 )
#pragma section( bdata1, 0 )
#pragma section( bbss1, 0 )
#pragma region(bank1, 0x1300, 0x1b00, , 1, { bcode1, bdata1, bbss1  } )

#pragma code ( code )
#pragma data ( data )
#pragma bss (bss)

void load_overlay(const char *fname)
{
    krnio_setbnk(0, 0);
    krnio_setnam(fname);
    if (!krnio_load(1, 8, 1))
    {
        printf("loading overlay file failed.");
        exit(1);
    }
}

void bnk_init()
// Initialise banking functions in low memory
{
    // Set 8Kb shared memory size
    // So set MMU Ram Configuration Register at:
    // - bit 0-1:   %10 for 8 KB common RAM
    // - bit 2-3:   %01 for bootom of RAM bank 0 is common
    // - bit 7:     $0 for VIC RAM in bank 0
    xmmu.rcr = 0x06;

    // Load overlay in low memory
    load_overlay("ovl1");
}

void bnk_exit()
// Retsore to default situtation for shared memory
{
    // Set 8Kb shared memory size
    // So set MMU Ram Configuration Register at:
    // - bit 0-1:   %00 for 1 KB common RAM
    // - bit 2-3:   %01 for bootom of RAM bank 0 is common
    // - bit 7:     $0 for VIC RAM in bank 0
    xmmu.rcr = 0x04;
}


// Now switch code generation to low region
#pragma code ( bcode1 )
#pragma data ( bdata1 )
#pragma bss ( bbss1 )

char bnk_readb(char cr, volatile char * p)
// Function to read a byte from given address with specified banking config register value
{
    char old = mmu.cr;
    mmu.cr = cr;
	char c = *p;
	mmu.cr = old;
	return c;
}

unsigned bnk_readw(char cr, volatile unsigned * p)
{
    char old = mmu.cr;
	mmu.cr = cr;
	unsigned w = *p;
	mmu.cr = old;
	return w;
}

void bnk_writeb(char cr, volatile char * p, char b)
{
	char old = mmu.cr;
	mmu.cr = cr;
	*p = b;
	mmu.cr = old;
}

void bnk_writew(char cr, volatile unsigned * p, unsigned w)
{
	char old = mmu.cr;
	mmu.cr = cr;
	*p = w;
	mmu.cr = old;
}

void bnk_memcpy(char dcr, char * dp, char scr, volatile char * sp, unsigned size)
{
    char old = mmu.cr;
	while (size > 0)
	{
		mmu.cr = scr;
		char c = * sp++;
		mmu.cr = dcr;
		*dp++ = c;
		size--;
	}
    mmu.cr = old;
}

void bnk_memset(char cr, char *p, char val, unsigned size)
{
    char old = mmu.cr;
    mmu.cr = cr;
	while (size > 0)
	{
		*p++ = val;
		size--;
	}
    mmu.cr = old;
}

void bnk_cpytovdc(unsigned vdcdest, char scr, volatile char * sp, unsigned size)
{
    char old = mmu.cr;
	while (size > 0)
	{
		mmu.cr = scr;
		char c = * sp++;
		mmu.cr = BNK_DEFAULT;
		vdc_mem_write_at(vdcdest++,c);
		size--;
	}
    mmu.cr = old;
}

void bnk_cpyfromvdc(char dcr, volatile char * dp, unsigned vdcsrc, unsigned size)
{
    char old = mmu.cr;
	while (size > 0)
	{
        mmu.cr = BNK_DEFAULT;
		char c = vdc_mem_read_at(vdcsrc);
		mmu.cr = dcr;
		*dp++ = c;		
		size--;
	}
    mmu.cr = old;
}

#pragma code ( code )
#pragma data ( data )
#pragma bss (bss)

