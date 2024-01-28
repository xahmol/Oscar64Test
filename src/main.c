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

// Memory region for code, data etc. from 0x1c80 to 0xbfff
#pragma region( vdctest, 0x1c80, 0xc000, , , {code, data, bss, heap, stack} )

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

int main(void)
{
	// Set demo variables
	char x, y, key, mode, screencode = 0, color = 0, reverse = 0;
	char direction;
	struct VDCWin window;

	// Initialise start viewport settings
	struct VDCViewport viewport;
	struct VDCSoftScrollSettings softscroll = {BNK_1_FULL, (char *)MEM_SCREEN2, 160, 75, 0, 0, 0, 0, 0, 0, 0, 0};

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
		vdc_prints(0, 6, "Load error.");
		exit(1);
	}
	vdc_prints(0, 6, "- screen 2: Logo test screen");
	if (!bnk_load(bootdevice, 1, (char *)MEM_SCREEN2, "screen2"))
	{
		vdc_prints(0, 7, "Load error.");
		exit(1);
	}

	// Windowing test
	for (mode = 0; mode < 3; mode++)
	{
		// Set VDC mode
		vdc_set_mode(mode);

		// Draw header
		 vdc_hchar(0, 0, C_SPACE, VDC_LGREEN + VDC_A_REVERSE + VDC_A_ALTCHAR, 79);
		 vdc_textcolor(VDC_LGREEN);
		 vdc_reverse(1);
		 vdc_prints(0, 0, "Oscar64 VDC demo");
		 vdc_reverse(0);
		 vdc_textcolor(VDC_LYELLOW);
		
		// Print mem and screen size
		 sprintf(linebuffer, "VDC Memory Detected: %d KB, screen size: %dx%d, ext.mem: %s", vdc_state.memsize, vdc_state.width, vdc_state.height, (vdc_state.memextended) ? "On " : "Off");
		 vdc_prints(0, 2, linebuffer);
		 vdc_prints(0, 3, "Press key to continue in every stage.");
		
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

	// Soft scroll test
	for (mode = 0; mode < 3; mode++)
	{
		if (vdc_softscroll_init(&softscroll, mode))
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
			vdc_softscroll_exit(&softscroll, mode);
		}
	}

	// Viewport test
	for (mode = 0; mode < 3; mode++)
	{
		// Set VDC mode
		vdc_set_mode(mode);

		// Draw header
		vdc_hchar(0, 0, C_SPACE, VDC_LGREEN + VDC_A_REVERSE + VDC_A_ALTCHAR, 79);
		vdc_textcolor(VDC_LGREEN);
		vdc_reverse(1);
		vdc_prints(0, 0, "Oscar64 VDC demo");
		vdc_reverse(0);
		vdc_textcolor(VDC_LYELLOW);

		// Print mem and screen size
		sprintf(linebuffer, "VDC Memory Detected: %d KB, screen size: %dx%d, ext.mem: %s", vdc_state.memsize, vdc_state.width, vdc_state.height, (vdc_state.memextended) ? "On " : "Off");
		vdc_prints(0, 2, linebuffer);
		vdc_prints(0, 3, "Move by W,A,S,D or cursor keys. ESC or STOP to exit.");
		vdc_prints(0, vdc_state.height - 1, "Petscii art credit: 'Love is the drug' Atlantis, 2023, Art by Lobo.");

		// Init and copy viewport from bank 1 screen
		vdcwin_viewport_init(&viewport, BNK_1_FULL, (char *)MEM_SCREEN1, 80, 150, 70, vdc_state.height - 7, 5, 5);
		vdcwin_cpy_viewport(&viewport);

		// Scroll contents using WASD keys, ESC to quit
		do
		{
			key = getch();
			direction = 0;
			if ((key == 'w' || key == CH_CURS_UP) && viewport.sourceyoffset > 0)
			{
				direction |= SCROLL_UP;
			}
			if ((key == 's' || key == CH_CURS_DOWN) && viewport.sourceyoffset < 150 - vdc_state.height + 6)
			{
				direction |= SCROLL_DOWN;
			}
			if ((key == 'a' || key == CH_CURS_LEFT) && viewport.sourcexoffset > 0)
			{
				direction |= SCROLL_LEFT;
			}
			if ((key == 'd' || key == CH_CURS_RIGHT) && viewport.sourcexoffset < 9)
			{
				direction |= SCROLL_RIGHT;
			}
			if (direction)
			{
				vdcwin_viewportscroll(&viewport, direction);
			}
		} while (key != CH_ESC && key != CH_STOP);
	}

	vdc_exit();

	return 0;
}
