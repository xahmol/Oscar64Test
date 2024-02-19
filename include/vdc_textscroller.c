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
#include <c128/vdc.h>
#include "vdc_core.h"
#include "banking.h"
#include "vdc_win.h"
#include "vdc_textscroller.h"

void txtscr_bigfont_init(struct TXTSCRBigFont *settings, char scr, char *sp, char width, char ch_width, char ch_height, char ch_num, char *color)
// Initialise big font
{
    char i;

    settings->num = ch_num;
    settings->cr = scr;
    settings->line_incr = width;
    settings->width = ch_width;
    settings->height = ch_height;

    for (i = 0; i < ch_num; i++)
    {
        settings->address[i] = sp + ((i / (width / ch_width)) * (width * ch_height)) + ((i % (width / ch_width)) * ch_width);
    }
    for (i = 0; i < ch_height; i++)
    {
        settings->color[i] = *(color + i);
    }
}

void txtscr_bigfont_printchar(struct TXTSCRBigFont *settings, char ch, char x, char y, char col)
// Print a big font char
{
    char *address = settings->address[ch - 32];
    char line;

    for (line = 0; line < settings->height; line++)
    {
        vdc_printc(x, y + line, bnk_readb(settings->cr, address + col), settings->color[line]);
        address += settings->line_incr;
    }
}

void txtscr_scroller_init(struct TXTSCRScrollText *settings, struct TXTSCRBigFont *bigfont, char *textscr, char xs, char ys, char xw, char border)
{
    settings->textscr = textscr;
    settings->bigfont = bigfont;
    settings->count_char = 0;
    settings->count_col = 0;
    settings->count_softx = 0;
    vdcwin_init(&settings->win, xs, ys, xw, settings->bigfont->height);
    vdcwin_border_clear(&settings->win, WIN_BOR_ALL);
}

void txtscr_scroll_do(struct TXTSCRScrollText *settings)
{
    char y, ch;

    // Copy scroll lines to left
    vdcwin_scroll_left(&settings->win, 1);

    // Get char to print
    do
    {
        ch = *(settings->textscr + settings->count_char);

        // Has last char been arrived at?
        if (!ch)
        {
            settings->count_char = 0;
        }
    } while (!ch);

    // Print next column of char
    txtscr_bigfont_printchar(settings->bigfont, ch, settings->win.sx + settings->win.wx - 1, settings->win.sy, settings->count_col);
    settings->count_col++;
    if (settings->count_col > settings->bigfont->width - 1)
    {
        settings->count_col = 0;
        settings->count_char++;
    }
}