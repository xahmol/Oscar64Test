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

#ifndef VDC_TEXTSCROLLERL_H
#define VVDC_TEXTSCROLLERL_H

#include "vdc_win.h"

// Function prototypes
void txtscr_bigfont_init(struct TXTSCRBigFont *settings, char scr, char *sp, char width, char ch_width, char ch_height, char ch_num, char *color);
void txtscr_bigfont_printchar(struct TXTSCRBigFont *settings, char ch, char x, char y, char w);
void txtscr_scroller_init(struct TXTSCRScrollText *settings, struct TXTSCRBigFont *bigfont, char *textscr, char xs, char ys, char xw, char border);
void txtscr_scroll_do(struct TXTSCRScrollText *settings);

// Global vars
struct TXTSCRBigFont {
    char num;
    char cr;
    unsigned line_incr;
    char width;
    char height;
    char *address[91];
    char color[8];
};
struct TXTSCRScrollText {
    char *textscr;
    struct TXTSCRBigFont *bigfont;
    struct VDCWin win;
    unsigned count_char;
    char count_col;
    char count_softx;
};

#pragma compile("vdc_textscroller.c")

#endif