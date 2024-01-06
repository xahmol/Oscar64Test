#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <conio.h>
#include <petscii.h>
#include <c128/vdc.h>
#include <c128/mmu.h>
#include "defines.h"
#include "vdc_core.h"

// Memory region for code, data etc. from 0x1c80 to 0xbfff
#pragma region( main, 0x1c80, 0xc000, , , {code, data, bss, heap, stack} )

int main(void)
{
	char x, y, screencode = 0, color = 0, reverse = 0;
	unsigned address;

	vdc_init();

	vdc_hchar(0, 0, C_SPACE, VDC_LGREEN + VDC_A_REVERSE + VDC_A_ALTCHAR, 79);
	vdc_textcolor(VDC_LGREEN);
	vdc_reverse(1);
	vdc_prints(0, 0, "Oscar64 VDC demo");
	vdc_reverse(0);
	vdc_textcolor(VDC_LYELLOW);

	// Detect VDC mem size
	sprintf(linebuffer, "VDC Memory Detected: %u KB", vdc_memsize);
	vdc_prints(0, 2, linebuffer);

	// Draw frame
	vdc_printc(4, 3, FRAME_UC_L, VDC_LRED);
	vdc_hchar(5, 3, FRAME_UP, VDC_LRED, 70);
	vdc_printc(75, 3, FRAME_UC_R, VDC_LRED);
	vdc_vchar(4, 4, FRAME_LEFT, VDC_LRED, 20);
	vdc_vchar(75, 4, FRAME_RIGHT, VDC_LRED, 20);
	vdc_printc(4, 24, FRAME_BC_L, VDC_LRED);
	vdc_hchar(5, 24, FRAME_DOWN, VDC_LRED, 70);
	vdc_printc(75, 24, FRAME_BC_R, VDC_LRED);

	// Draw contents of frame
	for (y = 4; y < 24; y++)
	{
		for (x = 5; x < 75; x++)
		{
			vdc_printc(x, y, screencode++, color++ + (reverse * VDC_A_REVERSE));
			if (color > 15)
			{
				color = 0;
				reverse = !reverse;
			}
		}
	}

	// Scroll contents up
	address = vdc_coords(5,4);
	for(x=0;x<20;x++)
	{
		getch();
		vdc_scroll_copy(address+VDCBASETEXT,address+VDCBASETEXT+80,19,70);
		vdc_scroll_copy(address+VDCBASEATTR,address+VDCBASEATTR+80,19,70);
		vdc_hchar(5,23,C_SPACE,VDC_LYELLOW,70);
	}

	vdc_exit();

	return 0;
}
