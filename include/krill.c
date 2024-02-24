/*
Oscar64 VDC function library

Written in 2024 by Xander Mol

https://github.com/xahmol/Oscar64Test

https://www.idreamtin8bits.com/

Code and resources from others used:

-   Oscar64 cross compiler

    https://github.com/drmortalwombat/oscar64

    Many thanks also to https://github.com/drmortalwombat to provide extrordinary support and tips for making this and adapting Oscar64 to my needs faster than I could ask it.

-   Screens used in the demo made with my own VDC Screen Editor.

    https://github.com/xahmol/VDCScreenEdit

-   Commodore logo charset created using CharPad Pro.

    https://subchristsoftware.itch.io/c64-pro-editions

-   C128 Programmers Reference Guide: For the basic VDC register routines and VDC code inspiration

    http://www.zimmers.net/anonftp/pub/cbm/manuals/c128/C128_Programmers_Reference_Guide.pdf

-   Tokra: For the optimal VDC registry settings for 80x50 and 80x70 textmodes

-   Scott Hutter - VDC Core functions inspiration:

    https://github.com/Commodore64128/vdc_gui/blob/master/src/vdc_core.c

    (used as starting point)

-   Scott Robison for teaching me how o create a C128 disk boot sector

-   Francesco Sblendorio - Screen Utility: used for inspiration:

    https://github.com/xlar54/ultimateii-dos-lib/blob/master/src/samples/screen_utility.c

-   DevDef: Commodore 128 Assembly - Part 3: The 80-column (8563) chip

    https://devdef.blogspot.com/2018/03/commodore-128-assembly-part-3-80-column.html

-   Tips and Tricks for C128: VDC

    http://commodore128.mirkosoft.sk/vdc.html

-   Steve Goldsmith - C3L Commodore 128 CP/M C Library

    https://github.com/sgjava/c3l

    (Used for inspiration and for the text wrap and random sentence generator functions)

-   Bart van Leeuwen: For inspiration and advice while coding. Also for providing the excellent Device Manager ROM to make testing on real hardware very easy

-   Original windowing system code on Commodore 128 by unknown author.

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
// Load a raw file with Krill's loader
{
    char old_cr = mmu.cr;
    char error = 0;
    krill_filelo = (unsigned)krill_filename;
    krill_filehi = ((unsigned)krill_filename) >> 8;
    krill_startlo = start;
    krill_starthi = start>>8;
    strcpy(krill_filename,fname);
    error = krill_load_core(cr);
}

// Now switch code generation to low region
#pragma code(bcode1)
#pragma data(bdata1)
#pragma bss(bbss1)

char krill_filename[16];
char krill_filelo, krill_filehi, krill_startlo, krill_starthi, oldcr;

__asm krill_interrupt
// Krill IRQ handler
{
	jsr $c024
    bcc $ff33
    jsr $f5f8
    jmp $ff33
}

void krill_init()
// Initialise Krill's loader
{
    char error = 0;
    cia1.icr =0x7f;
    cia2.pra = 2;

    error = krill_install();
    if (error)
    {
        printf("error in installing. error code: %u.\n");
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
    }
}

char krill_load_core(char cr)
// Load a raw file with Krill's loader
{
    oldcr = mmu.cr;
    mmu.cr = cr;
    __asm
        {
        lda krill_startlo
        sta KRILL_LOAD_LO
        lda krill_starthi
        sta KRILL_LOAD_HI
        ldx krill_filelo
        ldy krill_filehi
        sec
        jsr KRILL_LOADRAW
        bcs krill_load_error
        lda #$00
krill_load_error:
        sta accu
         }
    mmu.cr = oldcr;
}

#pragma code(code)
#pragma data(data)
#pragma bss(bss)