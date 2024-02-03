#ifndef __DEFINES_H_
#define __DEFINES_H_

// Memory map bank 1
#define MEM_WINDOW 0x2000
#define MEM_SCREEN1 0x4000
#define MEM_SCREEN2 0xA000
#define MEM_CHARSET 0xD000

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