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

// Memory region for code, data etc. from 0x1c80 to 0xbfff
#pragma region( main, 0x1c80, 0xc000, , , {code, data, bss, heap, stack} )

int main(void)
{
	char x, y, key, mode, screencode = 0, color = 0, reverse = 0;
	char xoffset, yoffset, direction;
	
	//unsigned address;

	//char testdata[81] = "this is a test to write data to the disk.";
	//char filename[15] = "test1";

	//char testb;
	//unsigned testw;

	// Init screen and banking functions, start with default 80x25 text mode
	vdc_init(VDC_TEXT_80x25, 1);

	// Loading assets
	vdc_prints(0,0,"Starting Oscar64 VDC demo.");
	vdc_prints(0,2,"Loading assets:");
	vdc_prints(0,3,"- screen");
	if(!bnk_load(bootdevice,1,(char*)0x5000,"screen"))
	{
		vdc_prints(0,6,"Load error.");
		exit(1);
	}

	//vdc_prints(0,6,"Getch() test. Press key, q is exit.");
	//do
	//{
	//	key=getch();
	//	sprintf(linebuffer,"Key pressed: %3u",key);
	//	vdc_prints(0,7,linebuffer);
	//} while (key!='q');
	
	//printf("- standard charset\n");
	//if(!bnk_load(bootdevice,1,(char*)0x3000,"charstd"))
	//{
	//	printf("load error.\n\r");
	//}
	//printf("- alternate charset\n");
	//if(!bnk_load(bootdevice,1,(char*)0x4000,"charalt"))
	//{
	//	printf("load error.\n\r");
	//}
	//bnk_redef_charset(vdc_state.char_std,BNK_1_FULL,(char*)0x3000,256);
	//bnk_redef_charset(vdc_state.char_alt,BNK_1_FULL,(char*)0x4000,256);
	//getch();

	// Save and load test

	// Write sample data
	//printf("write data.\n");
	//krnio_setbnk(0, 0);
	//krnio_setnam(filename);
	//printf("return value open: %d\n", krnio_open(1, bootdevice, 1));
	//printf("status after open: %d\n", krnio_pstatus[1]);
	//printf("return value write: %d\n", krnio_write(1, testdata, 81));
	//printf("status after write: %d\n", krnio_pstatus[1]);
	//krnio_close(1);

	// Wipe sample data to be able to see if it loads back correctly
	//memset(testdata, 0, 81);

	// Read sample data
	//printf("read data.\n");
	//krnio_setbnk(0, 0);
	//krnio_setnam(filename);
	//printf("return value open: %d\n", krnio_open(1, bootdevice, 0));
	//printf("status after open: %d\n", krnio_pstatus[1]);
	//printf("return value read: %d\n", krnio_read(1, testdata, 81));
	//printf("status after read: %d\n", krnio_pstatus[1]);
	//krnio_close(1);
	//printf("data read:\n%s\n", testdata);
	//getch();

	// Wipe sample data again and set new sample data
	//memset(testdata, 0, 81);
	//strcpy(testdata, "now a save and load test.");
	//strcpy(filename, "test2");

	// Save sample data
	//printf("write data.\n");
	//krnio_setbnk(0, 0);
	//krnio_setnam(filename);
	//printf("return value save: %d\n", krnio_save(bootdevice, testdata, testdata + strlen(testdata)));
	//printf("status after write: %d\n", krnio_pstatus[1]);

	// Wipe sample data to be able to see if it loads back correctly
	//memset(testdata, 0, 81);

	// Load sample data
	//printf("load data.\n");
	//krnio_setbnk(0, 0);
	//krnio_setnam(filename);
	//printf("return value load: %d\n", krnio_load(1, bootdevice, 1));
	//printf("status after write: %d\n", krnio_pstatus[1]);
	//printf("data read:\n%s\n", testdata);
	//getch();

	//testb = 0x60;
	//testw = 0x6060;
	//strcpy(testdata, "copy testing.");
	//bnk_writeb(BNK_1_FULL, (void *)0xd000, testb);
	//bnk_writew(BNK_1_FULL, (void *)0xd001, testw);
	//printf("\n\rwrite byte: %2X read byte: %2X\n", testb, bnk_readb(BNK_1_FULL, (void *)0xd000));
	//printf("write word: %4X read word: %4X\n", testw, bnk_readw(BNK_1_FULL, (void *)0xd001));

	//bnk_memcpy(BNK_1_FULL, (void *)0xd000, BNK_DEFAULT, testdata, strlen(testdata));
	//bnk_memcpy(BNK_DEFAULT, linebuffer, BNK_1_FULL, (void *)0xd000, strlen(testdata));
	//printf("write string: %s\nread string: %s\n", testdata,linebuffer);
	//bnk_cpytovdc(vdc_state.base_text,BNK_1_FULL,(void *)0xd000,strlen(testdata));
	//bnk_cpyfromvdc(BNK_1_FULL,(void*)0x2000,vdc_state.base_text,2000);

	//getch();
	//vdc_cls();
	//bnk_cpytovdc(vdc_state.base_text,BNK_1_FULL,(void*)0x2000,2000);

	//getch();
	vdc_cls();

	for (mode = 0; mode < 2; mode++)
	{
		// Set VDC mode
		if (mode)
		{
			vdc_set_mode(mode);
		}

		xoffset=0;
		yoffset=0;

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
		vdc_prints(0,3,"Move by Q,W,E,A,S,D,Z,X,C keys. ESC or STOP to exit.");
		vdc_prints(0,vdc_state.height-1,"Petscii art credit: 'Love is the drug' Atlantis, 2023, Art by Lobo.");

		// Draw frame
		vdc_printc(4, 4, FRAME_UC_L, VDC_LRED);
		vdc_hchar(5, 4, FRAME_UP, VDC_LRED, 70);
		vdc_printc(75, 4, FRAME_UC_R, VDC_LRED);
		vdc_vchar(4, 5, FRAME_LEFT, VDC_LRED, vdc_state.height - 7);
		vdc_vchar(75, 5, FRAME_RIGHT, VDC_LRED, vdc_state.height - 7);
		vdc_printc(4, vdc_state.height - 2, FRAME_BC_L, VDC_LRED);
		vdc_hchar(5, vdc_state.height - 2, FRAME_DOWN, VDC_LRED, 70);
		vdc_printc(75, vdc_state.height - 2, FRAME_BC_R, VDC_LRED);

		// Copy viewport from bank 1 screen
		bnk_cpy_viewporttovdc(BNK_1_FULL,(char*)0x5000,80,150,xoffset,yoffset,5,5,70,vdc_state.height - 7);

		// Scroll contents using WASD keys, ESC to quit
		do
		{
			key =getch();
			direction=0;
			if((key=='q'|| key=='w' || key=='e') && yoffset>0 ) { direction |= SCROLL_UP; }
			if((key=='z'|| key=='x' || key=='c' || key=='s') && yoffset<150 - vdc_state.height + 6) { direction |= SCROLL_DOWN; }
			if((key=='q'|| key=='a' || key=='z') && xoffset>0) { direction |= SCROLL_LEFT; }
			if((key=='e'|| key=='d' || key=='c') && xoffset<9) { direction |= SCROLL_RIGHT; }
			if(direction)
			{
				bnk_viewportscroll(BNK_1_FULL,(char*)0x5000,80,150,xoffset,yoffset,5,5,70,vdc_state.height - 7,direction);
				if(direction&SCROLL_UP ) { yoffset--; }
				if(direction&SCROLL_DOWN) { yoffset++; }
				if(direction&SCROLL_LEFT ) { xoffset--; }
				if(direction&SCROLL_RIGHT) { xoffset++; }
			}
		} while (key!=CH_ESC && key!=CH_STOP);
	}

	vdc_exit();

	return 0;
}
