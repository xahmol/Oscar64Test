#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <conio.h>
#include <petscii.h>
#include <c64/kernalio.h>
#include <c128/vdc.h>
#include <c128/mmu.h>
#include "defines.h"
#include "vdc_core.h"
#include "banking.h"
#include "vdc_softscroll.h"
#include "vdc_win.h"

// Memory region for code, data etc. from 0x1c80 to 0xbfff
#pragma region( main, 0x1c80, 0xc000, , , {code, data, bss, heap, stack} )

int main(void)
{
	char x, y, key, mode, screencode = 0, color = 0, reverse = 0;
	char direction;

	// Initialise start viewport settings
	struct VDCViewport viewport;
	struct VDCSoftScrollSettings softscroll = {BNK_1_FULL, (char *)0x8000, 160, 75, 0, 0, 0, 0, 0, 0, 0, 0};

	// Initialise raster bar
	// char raster[65] = {
	//	VDC_BLACK,
	//	VDC_DBLUE, VDC_BLACK, VDC_DBLUE, VDC_LBLUE,
	//	VDC_BLACK, VDC_DBLUE, VDC_LBLUE, VDC_DBLUE,
	//	VDC_BLACK, VDC_LBLUE, VDC_LCYAN, VDC_LBLUE,
	//	VDC_BLACK, VDC_LBLUE, VDC_LCYAN, VDC_LBLUE,
	//	VDC_BLACK, VDC_LCYAN, VDC_WHITE, VDC_LCYAN,
	//	VDC_BLACK, VDC_LCYAN, VDC_WHITE, VDC_LCYAN,
	//	VDC_BLACK, VDC_WHITE, VDC_LYELLOW, VDC_WHITE,
	//	VDC_BLACK, VDC_WHITE, VDC_LYELLOW, VDC_WHITE,
	//	VDC_BLACK, VDC_LYELLOW, VDC_LGREEN, VDC_WHITE,
	//	VDC_LGREEN, VDC_LYELLOW, VDC_BLACK, VDC_LYELLOW,
	//	VDC_LGREEN, VDC_DGREEN, VDC_BLACK, VDC_DGREEN,
	//	VDC_LGREEN, VDC_DGREEN, VDC_BLACK, VDC_DGREEN,
	//	VDC_LGREEN, VDC_DRED, VDC_BLACK, VDC_DRED,
	//	VDC_LRED, VDC_DRED, VDC_BLACK, VDC_DRED,
	//	VDC_LRED, VDC_DYELLOW, VDC_BLACK, VDC_DYELLOW,
	//	VDC_LRED, VDC_DYELLOW, VDC_BLACK, VDC_DRED};

	// unsigned address;

	// char testdata[81] = "this is a test to write data to the disk.";
	// char filename[15] = "test1";

	// char testb;
	// unsigned testw;

	// Init screen and banking functions, start with default 80x25 text mode
	vdc_init(VDC_TEXT_80x25_PAL, 1);

	// Loading assets
	vdc_prints(0, 0, "Starting Oscar64 VDC demo.");
	sprintf(linebuffer, "VDC memory detected: %u KB, extended memory %sabled.", vdc_state.memsize, (vdc_state.memextended) ? "En" : "Dis");
	vdc_prints(0, 2, linebuffer);
	vdc_prints(0, 4, "Loading assets:");
	vdc_prints(0, 5, "- screen 1: Love is a Drug");
	if (!bnk_load(bootdevice, 1, (char *)0x2000, "screen1"))
	{
		vdc_prints(0, 6, "Load error.");
		exit(1);
	}
	vdc_prints(0, 6, "- screen 2: Logo test screen");
	if (!bnk_load(bootdevice, 1, (char *)0x8000, "screen2"))
	{
		vdc_prints(0, 7, "Load error.");
		exit(1);
	}

	// vdc_prints(0,6,"Getch() test. Press key, q is exit.");
	// do
	//{
	//	key=getch();
	//	sprintf(linebuffer,"Key pressed: %3u",key);
	//	vdc_prints(0,7,linebuffer);
	// } while (key!='q');

	// printf("- standard charset\n");
	// if(!bnk_load(bootdevice,1,(char*)0x3000,"charstd"))
	//{
	//	printf("load error.\n\r");
	// }
	// printf("- alternate charset\n");
	// if(!bnk_load(bootdevice,1,(char*)0x4000,"charalt"))
	//{
	//	printf("load error.\n\r");
	// }
	// bnk_redef_charset(vdc_state.char_std,BNK_1_FULL,(char*)0x3000,256);
	// bnk_redef_charset(vdc_state.char_alt,BNK_1_FULL,(char*)0x4000,256);
	// getch();

	// Save and load test

	// Write sample data
	// printf("write data.\n");
	// krnio_setbnk(0, 0);
	// krnio_setnam(filename);
	// printf("return value open: %d\n", krnio_open(1, bootdevice, 1));
	// printf("status after open: %d\n", krnio_pstatus[1]);
	// printf("return value write: %d\n", krnio_write(1, testdata, 81));
	// printf("status after write: %d\n", krnio_pstatus[1]);
	// krnio_close(1);

	// Wipe sample data to be able to see if it loads back correctly
	// memset(testdata, 0, 81);

	// Read sample data
	// printf("read data.\n");
	// krnio_setbnk(0, 0);
	// krnio_setnam(filename);
	// printf("return value open: %d\n", krnio_open(1, bootdevice, 0));
	// printf("status after open: %d\n", krnio_pstatus[1]);
	// printf("return value read: %d\n", krnio_read(1, testdata, 81));
	// printf("status after read: %d\n", krnio_pstatus[1]);
	// krnio_close(1);
	// printf("data read:\n%s\n", testdata);
	// getch();

	// Wipe sample data again and set new sample data
	// memset(testdata, 0, 81);
	// strcpy(testdata, "now a save and load test.");
	// strcpy(filename, "test2");

	// Save sample data
	// printf("write data.\n");
	// krnio_setbnk(0, 0);
	// krnio_setnam(filename);
	// printf("return value save: %d\n", krnio_save(bootdevice, testdata, testdata + strlen(testdata)));
	// printf("status after write: %d\n", krnio_pstatus[1]);

	// Wipe sample data to be able to see if it loads back correctly
	// memset(testdata, 0, 81);

	// Load sample data
	// printf("load data.\n");
	// krnio_setbnk(0, 0);
	// krnio_setnam(filename);
	// printf("return value load: %d\n", krnio_load(1, bootdevice, 1));
	// printf("status after write: %d\n", krnio_pstatus[1]);
	// printf("data read:\n%s\n", testdata);
	// getch();

	// testb = 0x60;
	// testw = 0x6060;
	// strcpy(testdata, "copy testing.");
	// bnk_writeb(BNK_1_FULL, (void *)0xd000, testb);
	// bnk_writew(BNK_1_FULL, (void *)0xd001, testw);
	// printf("\n\rwrite byte: %2X read byte: %2X\n", testb, bnk_readb(BNK_1_FULL, (void *)0xd000));
	// printf("write word: %4X read word: %4X\n", testw, bnk_readw(BNK_1_FULL, (void *)0xd001));

	// bnk_memcpy(BNK_1_FULL, (void *)0xd000, BNK_DEFAULT, testdata, strlen(testdata));
	// bnk_memcpy(BNK_DEFAULT, linebuffer, BNK_1_FULL, (void *)0xd000, strlen(testdata));
	// printf("write string: %s\nread string: %s\n", testdata,linebuffer);
	// bnk_cpytovdc(vdc_state.base_text,BNK_1_FULL,(void *)0xd000,strlen(testdata));
	// bnk_cpyfromvdc(BNK_1_FULL,(void*)0x2000,vdc_state.base_text,2000);

	// getch();
	// vdc_cls();
	// bnk_cpytovdc(vdc_state.base_text,BNK_1_FULL,(void*)0x2000,2000);

	// getch();

	for (mode = 0; mode < 3; mode++)
	{
		if (vdc_softscroll_init(&softscroll, mode))
		{
			do
			{
				key = getch();
				if (key == 'w' || key == CH_CURS_UP)
				{
					if (softscroll.yoff)
					{
						vdc_softscroll_up(&softscroll, 2);
					}
				}
				if (key == 's' || key == CH_CURS_DOWN)
				{
					if (softscroll.yoff < (softscroll.height * 8))
					{
						vdc_softscroll_down(&softscroll, 2);
					}
				}
				if (key == 'a' || key == CH_CURS_LEFT)
				{
					if (softscroll.xoff)
					{
						vdc_softscroll_left(&softscroll, 2);
					}
				}
				if (key == 'd' || key == CH_CURS_RIGHT)
				{
					if (softscroll.xoff < (softscroll.width * 8))
					{
						vdc_softscroll_right(&softscroll, 2);
					}
				}
			} while (key != CH_ESC && key != CH_STOP);
			vdc_softscroll_exit(&softscroll, mode);
		}
	}

	for (mode = 0; mode < 6; mode++)
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

		// Draw frame
		vdc_printc(4, 4, FRAME_UC_L, VDC_LRED);
		vdc_hchar(5, 4, FRAME_UP, VDC_LRED, 70);
		vdc_printc(75, 4, FRAME_UC_R, VDC_LRED);
		vdc_vchar(4, 5, FRAME_LEFT, VDC_LRED, vdc_state.height - 7);
		vdc_vchar(75, 5, FRAME_RIGHT, VDC_LRED, vdc_state.height - 7);
		vdc_printc(4, vdc_state.height - 2, FRAME_BC_L, VDC_LRED);
		vdc_hchar(5, vdc_state.height - 2, FRAME_DOWN, VDC_LRED, 70);
		vdc_printc(75, vdc_state.height - 2, FRAME_BC_R, VDC_LRED);

		// Init and copy viewport from bank 1 screen
		vdcwin_viewport_init(&viewport,BNK_1_FULL, (char *)0x2000, 80, 150, 70, vdc_state.height - 7,5,5);
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
