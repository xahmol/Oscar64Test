#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <petscii.h>
#include <c64/kernalio.h>
#include <c128/vdc.h>
#include "vdc_core.h"
#include "banking.h"
#include "peekpoke.h"

// Section and region for low memory area overlay
#pragma overlay( ovl1, 1 )
#pragma section( bcode1, 0 )
#pragma section( bdata1, 0 )
#pragma region(bank1, 0x1300, 0x1b00, , 1, { bcode1, bdata1 } )

#pragma code ( code )
#pragma data ( data )

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

// Now switch code generation to low region
#pragma code ( bcode1 )
#pragma data ( bdata1 )

void low_test()
{
    vdc_hchar(0,0,0,VDC_LGREEN,80);
    vdc_prints(0,2,"Testing low code");
    getch();
    vdc_cls();
}

#pragma code ( code )
#pragma data ( data )

