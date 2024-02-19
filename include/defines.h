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

#ifndef __DEFINES_H_
#define __DEFINES_H_

// Memory map bank 1
#define MEM_SID 0x2000
#define MEM_SCREEN 0x4000
#define MEM_CHARSET 0xA000
#define MEM_WINDOW 0xA800

// References to steering chars
#define CH_CURS_UP 145    // Petscii control code for Cursor Up
#define CH_CURS_DOWN 17   // Petscii control code for Cursor Down
#define CH_CURS_LEFT 157  // Petscii control code for Cursor Left
#define CH_CURS_RIGHT 29  // Petscii control code for Cursor Right
#define CH_PI 222         // Petscii control code for Pi
#define CH_HOME 19        // Petscii control code for Home (HOME)
#define CH_CLEAR 147      // Petscii control code for Clear (SHIFT+HOME)
#define CH_DEL 20         // Petscii control code for delete (DEL)
#define CH_INS 148        // Petscii control code for Insert (SHIFT+DEL)
#define CH_ENTER 13       // Petscii control code for enter (RETURN)
#define CH_STOP 3         // Petscii control code for stop (STOP)
#define CH_RUN 10         // Petscii control code for run (SHIFT+STOP)
#define CH_TAB 9          // Petscii control code for tab (TAB)
#define CH_LIRA 92        // Petscii control code for pound sign
#define CH_ESC 27         // Petscii control code for escape (ESC)
#define CH_FONT_LOWER 14  // Petscii control code for lower case font
#define CH_FONT_UPPER 142 // Petscii control code for upper case font
#define CH_ARROW_UP 94    // Petscii control code for arrow up
#define CH_ARROW_LEFT 95  // Petscii control code for arrow left
#define CH_SPACE 32       // Petscii code and Screencode for space
#define CH_MINUS 45       // Screencode for minus
#define CH_BLACK 144      // Petscii control code for black           CTRL-1
#define CH_WHITE 5        // Petscii control code for white           CTRL-2
#define CH_DRED 28        // Petscii control code for dark red        CTRL-3
#define CH_LCYAN 159      // Petscii control code for light cyan      CTRL-4
#define CH_LPURPLE 156    // Petscii control code for light purple    CTRL-5
#define CH_DGREEN 30      // Petscii control code for dark green      CTRL-6
#define CH_DBLUE 31       // Petscii control code for dark blue       CTRL-7
#define CH_LYELLOW 158    // Petscii control code for light yellow    CTRL-8
#define CH_RVSON 18       // Petscii control code for RVS ON          CTRL-9
#define CH_RVSOFF 146     // Petscii control code for RVS OFF         CTRL-0
#define CH_DPURPLE 129    // Petscii control code for dark purple     C=-1
#define CH_DYELLOW 149    // Petscii control code for dark yellow     C=-2
#define CH_LRED 150       // Petscii control code for light red       C=-3
#define CH_DCYAN 151      // Petscii control code for dark cyan       C=-4
#define CH_DGREY 152      // Petscii control code for dark grey       C=-5
#define CH_LGREEN 153     // Petscii control code for light green     C=-6
#define CH_LBLUE 154      // Petscii control code for light blue      C=-7
#define CH_LGREY 155      // Petscii control code for light grey      C=-8

#endif // __DEFINES_H_