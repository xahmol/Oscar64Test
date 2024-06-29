/*
Oscar64 Krill's loader function library

Written in 2024 by Xander Mol

https://github.com/xahmol/Oscar64Test

https://www.idreamtin8bits.com/

Code and resources from others used:

-   Oscar64 cross compiler

    https://github.com/drmortalwombat/oscar64

    Many thanks also to https://github.com/drmortalwombat to provide extrordinary support and tips for making this and adapting Oscar64 to my needs faster than I could ask it.

-   Krill's Loader, Repository Version 194, by Krill / Plush.

    https://csdb.dk/release/?id=226124

-   Tested using real hardware (C128D and C128DCR) plus VICE.

The code can be used freely as long as you retain a notice describing original source and author.

THE PROGRAMS ARE DISTRIBUTED IN THE HOPE THAT THEY WILL BE USEFUL, BUT WITHOUT ANY WARRANTY. USE THEM AT YOUR OWN RISK!
*/

#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <petscii.h>
#include <c64/kernalio.h>
#include <c64/cia.h>
#include <c64/vic.h>
#include <c128/vdc.h>
#include <c128/mmu.h>
#include "c128/vdc.h"
#include "banking.h"
#include "peekpoke.h"
#include "vdc_core.h"
#include "krill.h"

#pragma code(code)
#pragma data(data)
#pragma bss(bss)

char krill_install()
// Install Krill code on drive, return error or succes code
{
    __asm
    {
        jsr KRILL_INSTALL
        bcs krill_install_error
        lda #$00
krill_install_error:
        sta accu
    }
}

void krill_loadcode()
// Load and initialise Krill's loader code
{
    printf("loading krill's loader: installer.\n");
    load_overlay("install-c128");
    printf("loading krill's loader: resident code.\n");
    load_overlay("loader-c128");
}

char krill_load(char cr, const unsigned start, const char *fname)
// Load a file with Krill's loader, decompress if needed
{
    krillvar.oldcr = mmu.cr;
    krillvar.cr = cr;
    krillvar.error = 0;
    krillzp.loadaddr = start;
    strcpy(krillvar.filename,fname);
    krill_load_core();
    return krillvar.error;
}

// Now switch code generation to low region
#pragma code(bcode1)
#pragma data(bdata1)
#pragma bss(bbss1)

volatile struct KRILLVARS krillvar;

__asm krill_interrupt
// Krill IRQ handler
{
	jsr $c024
    bcc krillirq
    jsr $f5f8
krillirq:
    jmp $ff33
}

void krill_init()
// Initialise Krill's loader
{
    cia1.icr =0x7f;
    cia2.pra = 2;

    krillvar.error = krill_install();
    if (krillvar.error)
    {
        printf("error in installing. error code: %u.\n",krillvar.error);
        exit(1);
    }

    // Set new IRQ vector to Krill handler
	__asm
		{
		sei									
        lda #<krill_interrupt					
		sta $314																
        lda #>krill_interrupt					
		sta $315
		cli
		}
}

void krill_done()
// Disable Krill IRQ handler
{
    __asm 
    {
        sei								
        lda #$65				
		sta $314							
        lda #$fa
		sta $315
		cli
        jsr KRILL_UNINSTA
    }
}

void krill_load_core()
// Load a file with Krill's loader
{
    char filelo = (unsigned)krillvar.filename;
    char filehi = ((unsigned)krillvar.filename) >> 8;
    char error = 0;
    mmu.cr = krillvar.cr;
    __asm
        {
        ldx filelo
        ldy filehi
        sec
        jsr KRILL_LOADRAW
        bcs krill_load_error
        lda #$00
krill_load_error:
        sta error
         }
    krillvar.error = error;
    mmu.cr = krillvar.oldcr;
}

#pragma code(code)
#pragma data(data)
#pragma bss(bss)