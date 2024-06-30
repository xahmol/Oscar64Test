/*
Oscar64 VDC Demo

Testing and demonstrating my C128 VDC functions for the Oscar64 C compiller

Written in 2024 by Xander Mol

https://github.com/xahmol/Oscar64Test

https://www.idreamtin8bits.com/

Credit to included music:

-   Music by Nordischsound:

	Ultimate Axel F.                    https://csdb.dk/release/?id=228585

	Faded                               https://csdb.dk/release/?id=229218

Credit to included PESTCII art:

-	PETSCII art:
	Love is the Drug, art by Lobo. https://csdb.dk/release/?id=237148

-	Text scroller PETSCII font:
	Small Round Font by Cupid. https://csdb.dk/release/?id=188169

Code and resources from others used:

-   Oscar64 cross compiler

	https://github.com/drmortalwombat/oscar64

	Many thanks also to https://github.com/drmortalwombat to provide extrordinary support and tips for making this and adapting Oscar64 to my needs faster than I could ask it.

-   Krill's Loader, Repository Version 194, by Krill / Plush.

	https://csdb.dk/release/?id=226124

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
#include <stdio.h>
#include <conio.h>
#include <petscii.h>
#include <c64/kernalio.h>
#include <c64/cia.h>
#include <c128/vdc.h>
#include <c128/mmu.h>
#include "defines.h"
#include "vdc_core.h"
#include "banking.h"
#include "vdc_softscroll.h"
#include "vdc_win.h"
#include "vdc_menu.h"
#include "vdc_textscroller.h"

#if defined(KRILL)
#include "krill.h"
#endif

// Memory region for code, data etc. from 0x1c80 to 0xbfff
#pragma region( vdctest, 0x1c80, 0xc000, , , {code, data, bss, heap, stack} )

// Set zeropage range to use for C compiler
// Krill loader uses eb-fc
// SID file uses fd-fe
#pragma region( zeropage, 0x80, 0xf4, , , {} )

struct SCREENSettings
{
	char width;
	char height;
};
struct SCREENSettings screenset[3] = {
	{80, 150},
	{160, 75},
	{80, 25}};

void generateSentence(char *sentence)
// Adappted from
// https://github.com/sgjava/c3l/blob/main/src/demo/dsent.c
// Copyright (c) Steven P. Goldsmith. All rights reserved.
{
	char articles[2][4] = {"The", "A"};
	char nouns[5][15] = {"blue jay", "cardinal", "eastern phoebe",
						 "grackle", "sandhill crane"};
	char verbs[5][6] = {"flies", "jumps", "sleeps", "eats", "walks"};
	char adjectives[5][6] = {"big", "small", "angry", "wet", "happy"};
	int articleIndex = rand() % (sizeof(articles) / sizeof(articles[0]));
	int nounIndex = rand() % (sizeof(nouns) / sizeof(nouns[0]));
	int verbIndex = rand() % (sizeof(verbs) / sizeof(verbs[0]));
	int adjectiveIndex = rand() % (sizeof(adjectives) / sizeof(adjectives[0]));
	sentence[0] = '\0';
	sprintf(sentence, "%s %s %s %s.", articles[articleIndex],
			adjectives[adjectiveIndex], nouns[nounIndex], verbs[verbIndex]);
}

void settings_screenmode()
// Set screen mode from main menu
{
	char old_attr = vdc_state.text_attr;
	char menuchoice;

	vdc_state.text_attr = VDC_POPUP_COLOR;
	vdcwin_win_new(VDC_POPUP_BORDER, 8, 8, 30, 10);

	vdc_prints(10, 9, "Select screen mode");
	menuchoice = menu_pulldown(25, 11, 7, 1);
	vdcwin_win_free();

	if (menuchoice)
	{
		vdc_set_mode(menuchoice - 1);
	}

	vdc_state.text_attr = old_attr;
}

void settings_versioninfo()
// Print version information
{
	char old_attr = vdc_state.text_attr;
	char version[22];

	vdc_state.text_attr = VDC_POPUP_COLOR;
	vdcwin_win_new(VDC_POPUP_BORDER, 5, 5, 60, 15);

	vdc_underline(1);
	vdc_prints(6, 6, "Version information and credits");
	vdc_underline(0);
	vdc_prints(6, 8, "Oscar64 VDC Demo");
	vdc_prints(6, 9, "Written in 2024 by Xander Mol");
	sprintf(linebuffer, "Version: %s", VERSION);
	vdc_prints(6, 10, linebuffer);
	vdc_prints(6, 12, "Music by Nordischsound");
	vdc_prints(6, 13, "Full source code, documentation and credits at:");
	vdc_prints(6, 14, "https://github.com/xahmol/Oscar64Test/");
	vdc_prints(6, 16, "(C) 2024, IDreamtIn8Bits.com");
	vdc_prints(6, 18, "Press a key to continue.");

	getch();
	vdcwin_win_free();
	vdc_state.text_attr = old_attr;
}

void windows_windowstacking()
// Windowing demo
{
	char x, y;

	// Create windows
	srand(cia1.todt + cia1.tods + 1);

	x = 0;
	do
	{
		vdcwin_win_new(WIN_BOR_ALL + (x % 2), 5 + (x * 5), 5 + (x * 3), 40, vdc_state.height / 3);

		for (y = 0; y < 100; y++)
		{
			vdc_textcolor(rand() % 15 + 1);
			generateSentence(linebuffer);
			vdcwin_printwrap(&windows[winCfg.active - 1].win, linebuffer);
			if (windows[winCfg.active - 1].win.cx)
			{
				vdcwin_put_char(&windows[winCfg.active - 1].win, ' ');
			}
		}
		getch();

		vdc_textcolor(VDC_LYELLOW);
		x++;
	} while (winCfg.active < WIN_MAX_NR);

	do
	{
		vdcwin_win_free();

		for (y = 0; y < 100; y++)
		{
			vdc_textcolor(rand() % 15 + 1);
			generateSentence(linebuffer);
			vdcwin_printwrap(&windows[winCfg.active - 1].win, linebuffer);
			if (windows[winCfg.active - 1].win.cx)
			{
				vdcwin_put_char(&windows[winCfg.active - 1].win, ' ');
			}
		}
		getch();

		vdc_textcolor(VDC_LYELLOW);
	} while (winCfg.active > 1);

	vdcwin_win_free();
}

void windows_textinput()
{
	char *input = malloc(251);
	vdcwin_win_new(WIN_BOR_ALL, 5, (vdc_state.height / 2) - 6, 60, 12);
	vdcwin_putat_string(&windows[winCfg.active - 1].win, 0, 1, "Try text entry in window, accept with RETURN.");
	vdcwin_win_new(WIN_BOR_ALL, 10, (vdc_state.height / 2) - 3, 50, 5);
	vdcwin_edit(&windows[winCfg.active - 1].win);
	vdcwin_get_rect(&windows[winCfg.active - 1].win, 0, 0, 50, 5, BNK_DEFAULT, input);
	vdcwin_win_free();
	vdcwin_clear(&windows[winCfg.active - 1].win);
	vdcwin_putat_string(&windows[winCfg.active - 1].win, 0, 1, "Entered string formatted with word wrap:");
	vdcwin_cursor_move(&windows[winCfg.active - 1].win, 0, 3);
	vdcwin_printwrap(&windows[winCfg.active - 1].win, input);
	vdcwin_printline(&windows[winCfg.active - 1].win, "");
	vdcwin_cursor_down(&windows[winCfg.active - 1].win);
	vdcwin_put_string(&windows[winCfg.active - 1].win, "Press key.");
	getch();
	vdcwin_win_free();
	free(input);
}

char screen_switch(char screen, char end, char fullscreen)
// Function to load second screen or restore first screen if needed
{
	char succes = 1;

	// Clears screen but header and prints loading messeage
	vdc_clear(0, 2, CH_SPACE, 80, vdc_state.height - 2);
	vdc_prints(0, 3, "Loading screen data.");

	if (screen == 0 || screen == 2)
	{
#ifndef KRILL
#ifndef FLOSSIEC
		// Pause music
		sid_pausemusic();
#endif
#endif

		// Loads back logo screen
		if (end)
		{
#if defined(KRILL)
			if (krill_load(BNK_1_IO, MEM_SCREEN, "screen2"))
#else
#if defined(FLOSSIEC)
			if (fastload_load(BNK_1_IO, (char *)MEM_SCREEN, 1))
#else
			if (!bnk_load(bootdevice, 1, (char *)MEM_SCREEN, "screen2"))
#endif
#endif
			{
				menu_fileerrormessage();
				succes = 0;
			}
		}

		// Load petscii art screen
		else
		{
			if (screen == 0)
			{
#if defined(KRILL)
				if (krill_load(BNK_1_IO, MEM_SCREEN, "screen1"))
#else
#if defined(FLOSSIEC)
				if (fastload_load(BNK_1_IO, (char *)MEM_SCREEN, 0))
#else
				if (!bnk_load(bootdevice, 1, (char *)MEM_SCREEN, "screen1"))
#endif
#endif
				{
					menu_fileerrormessage();
					succes = 0;
				}
				if (!fullscreen)
				{
					vdc_prints(0, vdc_state.height - 1, "Petscii art credit: 'Love is the drug' Atlantis, 2023, Art by Lobo.");
				}
			}
			else
			{
#if defined(KRILL)
				if (krill_load(BNK_1_IO, MEM_SCREEN, "screen3"))
#else
#if defined(FLOSSIEC)
				if (fastload_load(BNK_1_IO, (char *)MEM_SCREEN, 2))
#else
				if (!bnk_load(bootdevice, 1, (char *)MEM_SCREEN, "screen3"))
#endif
#endif
				{
					menu_fileerrormessage();
					succes = 0;
				}
				vdc_prints(0, 4, "Loading charset.");
#if defined(KRILL)
				if (krill_load(BNK_1_IO, MEM_CHARSET, "chars1"))
#else
#if defined(FLOSSIEC)
				if (fastload_load(BNK_1_IO, (char *)MEM_CHARSET, 3))
#else
				if (!bnk_load(bootdevice, 1, (char *)MEM_CHARSET, "chars1"))
#endif
#endif
				{
					menu_fileerrormessage();
					succes = 0;
				}
			}
		}

#ifndef KRILL
#ifndef FLOSSIEC
		// Resume music
		sid_pausemusic();
#endif
#endif
	}

	// Clear loading message
	vdc_clear(0, 3, CH_SPACE, 80, 2);

	// Return succes code
	return succes;
}

void viewport_demo(char screen)
// Viewport scrolling demo
{
	char key, direction;
	struct VDCWin win_vpdemo;
	struct VDCViewport vp_vpdemo;

	if (!screen_switch(screen, 0, 0))
	{
		return;
	}

	vdc_prints(0, 3, "Move by W,A,S,D or cursor keys. ESC or STOP to exit.");

	// Init and copy viewport from bank 1 screen
	vdcwin_init(&win_vpdemo, 5, 5, 70, vdc_state.height - 7);
	vdcwin_border_clear(&win_vpdemo, WIN_BOR_ALL);
	vdcwin_viewport_init(&vp_vpdemo, BNK_1_FULL, (char *)MEM_SCREEN, screenset[screen].width, screenset[screen].height, 70, vdc_state.height - 7, 5, 5);
	vdcwin_cpy_viewport(&vp_vpdemo);

	// Scroll contents using WASD keys, ESC to quit
	do
	{
		key = getch();
		direction = 0;
		if ((key == 'w' || key == CH_CURS_UP) && vp_vpdemo.sourceyoffset > 0)
		{
			direction |= SCROLL_UP;
		}
		if ((key == 's' || key == CH_CURS_DOWN) && vp_vpdemo.sourceyoffset < (screenset[screen].height - vdc_state.height + 6))
		{
			direction |= SCROLL_DOWN;
		}
		if ((key == 'a' || key == CH_CURS_LEFT) && vp_vpdemo.sourcexoffset > 0)
		{
			direction |= SCROLL_LEFT;
		}
		if ((key == 'd' || key == CH_CURS_RIGHT) && vp_vpdemo.sourcexoffset < screenset[screen].width - 71)
		{
			direction |= SCROLL_RIGHT;
		}
		if (direction)
		{
			vdcwin_viewportscroll(&vp_vpdemo, direction);
		}
	} while (key != CH_ESC && key != CH_STOP);

	screen_switch(screen, 1, 0);
}

void scroll_fullscreen_smooth(char screen)
// Full screen smooth scroll demo
{
	struct VDCSoftScrollSettings softscroll;
	char key;

	screen_switch(screen, 0, 1);
	softscroll.cr = BNK_1_FULL;
	softscroll.source = (char *)MEM_SCREEN;
	softscroll.width = screenset[screen].width;
	softscroll.height = screenset[screen].height;

	// vdc_clear(0, 2, CH_SPACE, 80, vdc_state.height - 2);
	// sprintf(linebuffer,"Screen: %u Address: %4x W: %3u H: %3u",screen,softscroll.source,softscroll.width,softscroll.height);
	// vdc_prints(0,3,linebuffer);
	// getch();

	if (vdc_softscroll_init(&softscroll, vdc_state.mode))
	{
		do
		{
			key = getch();
			if (key == 'w' || key == CH_CURS_UP)
			{
				vdc_softscroll_up(&softscroll, 2);
			}
			if (key == 's' || key == CH_CURS_DOWN)
			{
				vdc_softscroll_down(&softscroll, 2);
			}
			if (key == 'a' || key == CH_CURS_LEFT)
			{
				vdc_softscroll_left(&softscroll, 2);
			}
			if (key == 'd' || key == CH_CURS_RIGHT)
			{
				vdc_softscroll_right(&softscroll, 2);
			}
		} while (key != CH_ESC && key != CH_STOP);
		vdc_softscroll_exit(&softscroll, vdc_state.mode);
	}
	screen_switch(screen, 1, 1);
}

void scroll_bigfont()
{
	struct TXTSCRBigFont bigfont;
	struct TXTSCRScrollText scroller;
	char color[5] = {VDC_LGREY, VDC_LCYAN, VDC_DCYAN, VDC_LBLUE, VDC_DBLUE};
	char scrolltext[] = "Welcome to Oscar64 VDC Demo. This demo is written to test and demonstrate the VDC library functions I have tried to build for the Oscar64 compiler. Hope you enjoy it! Greetings, Xander Mol.     ";
	char key;

	// Loading big PETSCII font data
	vdc_clear(0, 2, CH_SPACE, 80, vdc_state.height - 2);
	vdc_prints(0, 3, "Loading data.");

	vdc_prints(0, 4, "Loading scroll PETSCII font: 'Small Round Font' by Cupid.");

#if defined(KRILL)
	if (krill_load(BNK_1_IO, MEM_CHARSET, "chars2"))
#else
#if defined(FLOSSIEC)
	if (fastload_load(BNK_1_IO, (char *)MEM_CHARSET, 4))
#else
	if (!bnk_load(bootdevice, 1, (char *)MEM_CHARSET, "chars2"))
#endif
#endif
	{
		menu_fileerrormessage();
		return;
	}

	vdc_clear(0, 3, CH_SPACE, 80, 2);

	// Initialise big font
	txtscr_bigfont_init(&bigfont, BNK_1_FULL, (char *)MEM_CHARSET, 80, 4, 5, 91, color);

	// Initialize scroller
	txtscr_scroller_init(&scroller, &bigfont, scrolltext, 5, (vdc_state.height / 2) - 2, 70, WIN_BOR_ALL);

	// Debounce keypreses
	while (vdcwin_checkch())
	{
		;
	}

	// Bigfont sroller
	do
	{
		key = vdcwin_checkch();
		txtscr_scroll_do(&scroller);
	} while (key != CH_ESC && key != CH_STOP);
}

void charset_demo()
// Charset redefine demo
{
	struct VDCViewport vp_chardemo;

	char wave_base = vdc_reg_read(VDCR_VSCROLL) & 0xf0;
	char wave = 0;
	char dir = 1;

	// Clear screen but header
	vdc_clear(0, 2, CH_SPACE, 80, vdc_state.height - 2);

	// Loading screen and set charset
	screen_switch(2, 0, 0);
	bnk_redef_charset(vdc_state.char_std, BNK_1_FULL, (char *)MEM_CHARSET, 256);

	// Init and copy viewport from bank 1 screen
	vdcwin_viewport_init(&vp_chardemo, BNK_1_FULL, (char *)MEM_SCREEN, 80, 25, 80, (vdc_state.height > 25) ? 25 : 23, 0, (vdc_state.height / 2) - 10);
	vdcwin_cpy_viewport(&vp_chardemo);

	// Print messages
	vdc_prints(47, 3, "Graphics from redefining charset.");
	vdc_prints(70, 4, "Press key.");

	// Debounce character input
	getch();

	vdc_reg_write(VDCR_VSCROLL, wave_base);

	// Restore charset and logo screen
	vdc_restore_charsets();
	screen_switch(2, 1, 0);
}

int main(void)
{
	struct VDCViewport vp_logo;
	char menuchoice = 0;
	char musicchoice = 1;

	// Initialise CIA clock
	cia_init();

	// Initialize memory settings for backing up windows backgrounds
	vdcwin_winstorage_init(BNK_1_FULL, (char *)MEM_WINDOW, WIN_MEMORY);

	// Init low memory
	bnk_init();

#if defined(KRILL)
	// Install Krill's loader
	krill_loadcode();
#endif

#if defined(FLOSSIEC)
	// Map asset filenames
	fastload_mapdir("screen1,screen2,screen3,chars1,chars2,music1,music2");
#endif

	// Init screen and banking functions, start with default 80x25 text mode
	vdc_init(VDC_TEXT_80x25_PAL, 1);
#if defined(KRILL)
	krill_init();
#endif

	// Loading assets
	vdc_prints(0, 0, "Starting Oscar64 VDC demo.");
	sprintf(linebuffer, "VDC memory detected: %u KB, extended memory %sabled.", vdc_state.memsize, (vdc_state.memextended) ? "En" : "Dis");
	vdc_prints(0, 2, linebuffer);
	vdc_prints(0, 4, "Loading assets:");
	vdc_prints(0, 5, "- screen: Logo and test screen");
#if defined(KRILL)
	if (krill_load(BNK_1_IO, MEM_SCREEN, "screen2"))
#else
#if defined(FLOSSIEC)
	if (fastload_load(BNK_1_IO, (char *)MEM_SCREEN, 1))
#else
	if (!bnk_load(bootdevice, 1, (char *)MEM_SCREEN, "screen2"))
#endif
#endif
	{
		menu_fileerrormessage();
		exit(1);
	}
	vdc_prints(0, 6, "- music: Ultimate Axel F from Nordischsound");
#if defined(KRILL)
	if (krill_load(BNK_1_IO, MEM_SID, "music1"))
#else
#if defined(FLOSSIEC)
	if (fastload_load(BNK_1_IO, (char *)MEM_SID, 5))
#else
	if (!bnk_load(bootdevice, 1, (char *)MEM_SID, "music1"))
#endif
#endif
	{
		menu_fileerrormessage();
		exit(1);
	}

	sid_startmusic();

	do
	{
		menu_placetop(" Oscar64 VDC Demo");

		// Initialise logo viewport
		vdcwin_viewport_init(&vp_logo, BNK_1_FULL, (char *)MEM_SCREEN, 160, 75, 48, 12, 16, (vdc_state.height / 2) - 6);
		vp_logo.sourcexoffset = 16;
		vp_logo.sourceyoffset = 6;

		// Draw info, intructions and logo
		sprintf(linebuffer, "VDC memory detected: %u KB, extended memory %sabled.", vdc_state.memsize, (vdc_state.memextended) ? "En" : "Dis");
		vdc_prints(0, 3, linebuffer);
		sprintf(linebuffer, "Screenmode: %s", pulldown_titles[7][vdc_state.mode]);
		vdc_prints(0, 4, linebuffer);
		vdc_prints(0, vdc_state.height - 4, "Select desired demo using cursor keys and RETURN in menu.");
		vdc_prints(0, vdc_state.height - 3, "In scrolling demos, press WASD or cursor keys to move, ESC to exit.");
		vdc_prints(0, vdc_state.height - 2, "In other demos, press a key to continue to next step.");
		vdcwin_cpy_viewport(&vp_logo);

		// Start menu lselection
		menuchoice = menu_main();

		switch (menuchoice)
		{
		case 11:
			settings_screenmode();
			break;

		case 12:
			settings_versioninfo();
			break;

		case 21:
			windows_windowstacking();
			break;

		case 22:
			windows_textinput();
			break;

		case 31:
		case 32:
			viewport_demo(menuchoice - 31);
			break;

		case 41:
		case 42:
			scroll_fullscreen_smooth(menuchoice - 41);
			break;

		case 43:
			scroll_bigfont();
			break;

		case 51:
			charset_demo();
			break;

		case 61:
		case 62:
			if (musicchoice != (menuchoice - 60))
			{
				sid_stopmusic();
				musicchoice = menuchoice - 60;
				sprintf(linebuffer, "music%u", musicchoice);
#if defined(KRILL)
				if (krill_load(BNK_1_IO, MEM_SID, linebuffer))
#else
#if defined(FLOSSIEC)
				if (fastload_load(BNK_1_IO, (char *)MEM_SID, 4+musicchoice))
#else
				if (!bnk_load(bootdevice, 1, (char *)MEM_SID, linebuffer))
#endif
#endif
				{
					menu_fileerrormessage();
				}
				sid_startmusic();
			}
			break;

		case 63:
			sid_stopmusic();
			break;

		case 64:
			sid_startmusic();
			break;

		default:
			break;
		}
	} while (menuchoice != 13);

	sid_stopmusic();
	vdc_exit();
#if defined(KRILL)
	krill_done();
#endif

	return 0;
}
