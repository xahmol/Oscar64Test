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

// Memory region for code, data etc. from 0x1c80 to 0xbfff
#pragma region( vdctest, 0x1c80, 0xc000, , , {code, data, bss, heap, stack} )
#pragma region( zeropage, 0x80, 0xfb, , , {} )

struct SCREENSettings
{
	char *source;
	char width;
	char height;
};
struct SCREENSettings screenset[2] = {
	{(char *)MEM_SCREEN1, 80, 150},
	{(char *)MEM_SCREEN2, 160, 75}};

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

void viewport_demo(char screen)
// Viewport scrolling demo
{
	char key, direction;
	struct VDCWin win_vpdemo;
	struct VDCViewport vp_vpdemo;

	vdc_clear(0, 2, CH_SPACE, 80, vdc_state.height - 2);
	vdc_prints(0, 3, "Move by W,A,S,D or cursor keys. ESC or STOP to exit.");

	if (screen == 0)
	{
		vdc_prints(0, vdc_state.height - 1, "Petscii art credit: 'Love is the drug' Atlantis, 2023, Art by Lobo.");
	}

	// Init and copy viewport from bank 1 screen
	vdcwin_init(&win_vpdemo, 5, 5, 70, vdc_state.height - 7);
	vdcwin_border_clear(&win_vpdemo, WIN_BOR_ALL);
	vdcwin_viewport_init(&vp_vpdemo, BNK_1_FULL, screenset[screen].source, screenset[screen].width, screenset[screen].height, 70, vdc_state.height - 7, 5, 5);
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
}

void scroll_fullscreen_smooth(char screen)
// Full screen smooth scroll demo
{
	struct VDCSoftScrollSettings softscroll;
	char key;

	softscroll.cr = BNK_1_FULL;
	softscroll.source = screenset[screen].source;
	softscroll.width = screenset[screen].width;
	softscroll.height = screenset[screen].height;

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

	// Init screen and banking functions, start with default 80x25 text mode
	vdc_init(VDC_TEXT_80x25_PAL, 1);

	// Loading assets
	vdc_prints(0, 0, "Starting Oscar64 VDC demo.");
	sprintf(linebuffer, "VDC memory detected: %u KB, extended memory %sabled.", vdc_state.memsize, (vdc_state.memextended) ? "En" : "Dis");
	vdc_prints(0, 2, linebuffer);
	vdc_prints(0, 4, "Loading assets:");
	vdc_prints(0, 5, "- screen 1: Love is a Drug");
	if (!bnk_load(bootdevice, 1, (char *)MEM_SCREEN1, "screen1"))
	{
		menu_fileerrormessage();
		exit(1);
	}
	vdc_prints(0, 6, "- screen 2: Logo test screen");
	if (!bnk_load(bootdevice, 1, (char *)MEM_SCREEN2, "screen2"))
	{
		menu_fileerrormessage();
		exit(1);
	}
	vdc_prints(0, 7, "- music: Ultimate Axel F from Nordischsound");
	if (!bnk_load(bootdevice, 1, (char *)MEM_SID, "music1"))
	{
		menu_fileerrormessage();
		exit(1);
	}

	sid_startmusic();

	do
	{
		menu_placetop(" Oscar64 VDC Demo");

		// Initialise logo viewport
		vdcwin_viewport_init(&vp_logo, BNK_1_FULL, (char *)MEM_SCREEN2, 160, 75, 48, 12, 16, (vdc_state.height / 2) - 6);
		vp_logo.sourcexoffset = 16;
		vp_logo.sourceyoffset = 6;

		// Draw info, intructions and logo
		sprintf(linebuffer, "VDC memory detected: %u KB, extended memory %sabled.", vdc_state.memsize, (vdc_state.memextended) ? "En" : "Dis");
		vdc_prints(0, 3, linebuffer);
		sprintf(linebuffer, "Screenmode: %s", pulldown_titles[6][vdc_state.mode]);
		vdc_prints(0, 4, linebuffer);
		vdc_prints(0, vdc_state.height - 4, "Select desired demo using cursor keys and RETURN in menu.");
		vdc_prints(0, vdc_state.height - 3, "In scrolling demos, press WASD or cursor keys to move, ESC to exit.");
		vdc_prints(0, vdc_state.height - 2, "In other demos, press a kety to continue to next step.");
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

		case 31:
		case 32:
			viewport_demo(menuchoice - 31);
			break;

		case 41:
		case 42:
			scroll_fullscreen_smooth(menuchoice - 41);
			break;

		case 61:
		case 62:
			if (musicchoice != (menuchoice - 60))
			{
				sid_stopmusic();
				musicchoice = menuchoice - 60;
				sprintf(linebuffer, "music%u", musicchoice);
				if (!bnk_load(bootdevice, 1, (char *)MEM_SID, linebuffer))
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

	return 0;
}
