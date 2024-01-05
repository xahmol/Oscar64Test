#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <conio.h>
#include <c128/vdc.h>
#include <c128/mmu.h>
#include "vdc_core.h"

// Memory region for code, data etc. from 0x1c80 to 0xbfff
#pragma region( main, 0x1c80, 0xc000, , , {code, data, bss, heap, stack} )

int main(void)
{
	// Switch MMU to RAM in low and mid range
	mmu.cr = 0x0e;

	vdc_init();

	vdc_textcolor(VDC_LRED);
	vdc_underline(1);
	vdc_prints(0,0,"Test.");
	vdc_underline(0);
	getch();

	vdc_disable_display();
	getch();
	vdc_enble_display();

	vdc_detect_mem_size();
	vdc_textcolor(VDC_LYELLOW);
	sprintf(linebuffer,"VDC Memory Detected: %u",vdc_memsize);
	vdc_prints(0,2,linebuffer);

	getch();

	vdc_set_extended_memsize();
	vdc_textcolor(VDC_LGREEN);
	vdc_reverse(1);
	vdc_prints(0,0,"Extended memory set");
	vdc_reverse(0);
	vdc_textcolor(VDC_LYELLOW);

	getch();

	vdc_set_default_memsize();
	vdc_blink(1);
	vdc_prints(0,0,"Default memory set");
	vdc_blink(0);

	getch();

	vdc_exit();

	// Switch MMU to ROM in low and mid range
	mmu.cr = 0x00;

	return 0;
}
