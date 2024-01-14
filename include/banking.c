#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <petscii.h>
#include <c64/kernalio.h>
#include <c128/vdc.h>
#include <c128/mmu.h>
#include "c128/vdc.h"
#include "banking.h"
#include "peekpoke.h"
#include "vdc_core.h"

// Section and region for low memory area overlay
#pragma overlay(ovl1, 1)
#pragma section(bcode1, 0)
#pragma section(bdata1, 0)
#pragma section(bbss1, 0)
#pragma region(bank1, 0x1300, 0x1b00, , 1, { bcode1, bdata1, bbss1  } )

#pragma code(code)
#pragma data(data)
#pragma bss(bss)

char bootdevice;

char getcurrentdevice()
// Return last used device number for IO operations. Default on 8 if still zero.
{
	// Feading zeropage address containg current device number ($BA)
	char curunit = *(char *)0xba;

	// Default on 8 if still zero
	if (!curunit)
	{
		curunit = 8;
	}
	return curunit;
}

void load_overlay(const char *fname)
// Loading an overlay file
{
	krnio_setbnk(0, 0);
	krnio_setnam(fname);
	if (!krnio_load(1, bootdevice, 1))
	{
		printf("loading overlay file failed.\n");
		exit(1);
	}
}

void bnk_init()
// Initialise banking functions in low memory
{
	// Get device ID used to load the program
	bootdevice = getcurrentdevice();
	printf("bootdevice: %u\n", bootdevice);

	// Set 8Kb shared memory size
	// So set MMU Ram Configuration Register at:
	// - bit 0-1:   %10 for 8 KB common RAM
	// - bit 2-3:   %01 for bootom of RAM bank 0 is common
	// - bit 7:     $0 for VIC RAM in bank 0
	xmmu.rcr = 0x06;

	// Load overlay in low memory
	printf("loading low memory code.\n");
	load_overlay("ovl1");
}

void bnk_exit()
// Retsore to default situtation for shared memory
{
	// Set 8Kb shared memory size
	// So set MMU Ram Configuration Register at:
	// - bit 0-1:   %00 for 1 KB common RAM
	// - bit 2-3:   %01 for bootom of RAM bank 0 is common
	// - bit 7:     $0 for VIC RAM in bank 0
	xmmu.rcr = 0x04;
}

// Now switch code generation to low region
#pragma code(bcode1)
#pragma data(bdata1)
#pragma bss(bbss1)

char bnk_readb(char cr, volatile char *p)
// Function to read a byte from given address with specified banking config register value
{
	char old = mmu.cr;
	mmu.cr = cr;
	char c = *p;
	mmu.cr = old;
	return c;
}

unsigned bnk_readw(char cr, volatile unsigned *p)
// Function to read a word from given address with specified banking config register value
{
	char old = mmu.cr;
	mmu.cr = cr;
	unsigned w = *p;
	mmu.cr = old;
	return w;
}

void bnk_writeb(char cr, volatile char *p, char b)
// Function to write a byte to given address with specified banking config register value
{
	char old = mmu.cr;
	mmu.cr = cr;
	*p = b;
	mmu.cr = old;
}

void bnk_writew(char cr, volatile unsigned *p, unsigned w)
// Function to write a word to given address with specified banking config register value
{
	char old = mmu.cr;
	mmu.cr = cr;
	*p = w;
	mmu.cr = old;
}

void bnk_memcpy(char dcr, char *dp, char scr, volatile char *sp, unsigned size)
// Menory copy of size bytes from source bank/address to destination source/address
{
	char old = mmu.cr;
	while (size > 0)
	{
		mmu.cr = scr;
		char c = *sp++;
		mmu.cr = dcr;
		*dp++ = c;
		size--;
	}
	mmu.cr = old;
}

void bnk_memset(char cr, char *p, char val, unsigned size)
// Fill memory from bank/address with value, size is bytes to fill
{
	char old = mmu.cr;
	mmu.cr = cr;
	while (size > 0)
	{
		*p++ = val;
		size--;
	}
	mmu.cr = old;
}

void bnk_cpytovdc(unsigned vdcdest, char scr, volatile char *sp, unsigned size)
// Menory copy of size bytes from source bank/address to destination VDC address
{
	char old = mmu.cr;
	mmu.cr = BNK_DEFAULT;
	vdc_mem_addr(vdcdest);

	while (size > 0)
	{
		mmu.cr = scr;
		char c = *sp++;
		mmu.cr = BNK_DEFAULT;
		vdc_write(c);
		size--;
	}
	mmu.cr = old;
}

void bnk_cpyfromvdc(char dcr, volatile char *dp, unsigned vdcsrc, unsigned size)
// Menory copy of size bytes from source VDC address to destination bank/address
{
	char old = mmu.cr;
	while (size > 0)
	{
		mmu.cr = BNK_DEFAULT;
		char c = vdc_mem_read_at(vdcsrc++);
		mmu.cr = dcr;
		*dp++ = c;
		size--;
	}
	mmu.cr = old;
}

void bnk_redef_charset(unsigned vdcdest, char scr, volatile char *sp, unsigned size)
// Function to copy charset definition from normal memory to VDC
// Input: Source normal memory address and bank config where charset defintion resides,
//		  Destination address in VDC memory,
//		  Numbers of characters to redefine.
// Takes charset definition of 8 bytes per character as input.
// Destination address should be the location pointed as character definition address
{
	char old = mmu.cr;
	mmu.cr = BNK_DEFAULT;
	vdc_mem_addr(vdcdest);

	while (size > 0)
	{
		// Copy charset data per char
		for (char i = 0; i < 8; i++)
		{
			mmu.cr = scr;
			char c = *sp++;
			mmu.cr = BNK_DEFAULT;
			vdc_write(c);
		}
		// Add 8 byte zero padding needed for charsets of 8 bytes high
		for (char i = 0; i < 8; i++)
		{
			vdc_write(0);
		}
		size--;
	}
	mmu.cr = old;
}

void bnk_cpy_viewporttovdc(char sourcebank, char *sourcebase, unsigned sourcewidth, unsigned sourceheight, unsigned sourcexoffset, unsigned sourceyoffset, char xcoord, char ycoord, char viewwidth, char viewheight)
// Function to copy a viewport on the source screen map to the VDC
// Input:
// - Source:	sourcebase			= source base address in memory
//				sourcebank			= memory bank of source (configuration register setting)
//				sourcewidth			= number of characters per line in source screen map
//				sourceheight		= number of lines in source screen map
//				sourcexoffset		= horizontal offset on source screen map to start upper left corner of viewpoint
//				sourceyoffset		= vertical offset on source screen map to start upper left corner of viewpoint
// - Viewport:	xcoord				= x coordinate of viewport upper left corner
//				ycoord				= y coordinate of viewport upper left corner
//				viewwidth			= width of viewport in number of characters
//				viewheight			= height of viewport in number of lines
{
	// Charachters
	unsigned vdcbase = vdc_state.base_text + vdc_coords(xcoord, ycoord);
	char* address;
	sourcebase += (sourceyoffset * sourcewidth) + sourcexoffset;
	address = sourcebase;

	for (char i = 0; i < viewheight; i++)
	{
		bnk_cpytovdc(vdcbase, sourcebank, address, viewwidth);
		vdcbase += vdc_state.width;
		address += vdc_state.width;
	}

	// Attributes
	vdcbase = vdc_state.base_attr + vdc_coords(xcoord, ycoord);
	sourcebase += (sourceheight * sourcewidth) + 48;
	address = sourcebase;

	for (char i = 0; i < viewheight; i++)
	{
		bnk_cpytovdc(vdcbase, sourcebank, address, viewwidth);
		vdcbase += vdc_state.width;
		address += vdc_state.width;
	}
}

void bnk_viewportscroll(char sourcebank, char *sourcebase, unsigned sourcewidth, unsigned sourceheight, unsigned sourcexoffset, unsigned sourceyoffset, char xcoord, char ycoord, char viewwidth, char viewheight, char direction)
// Function to scroll a viewport on the source screen map on the VDC in the given direction
// Input:
// - Source:	sourcebase			= source base address in memory
//				sourcebank			= memory bank of source (0 or 1)
//				sourcewidth			= number of characters per line in source screen map
//				sourceheight		= number of lines in source screen map
//				sourcexoffset		= horizontal offset on source screen map to start upper left corner of viewpoint
//				sourceyoffset		= vertical offset on source screen map to start upper left corner of viewpoint
// - Viewport:	xcoord				= x coordinate of viewport upper left corner
//				ycoord				= y coordinate of viewport upper left corner
//				viewwidth			= width of viewport in number of characters
//				viewheight			= height of viewport in number of lines
// - Direction:	direction			= Bit pattern for direction of scroll:
//									  bit 7 set ($01): Left
//									  bit 6 set ($02): right
//									  bit 5 set ($04): down
//									  bit 4 set ($08): up
{
	unsigned sourceaddr = vdc_state.base_text + vdc_coords(xcoord, ycoord);
	unsigned destaddr = vdc_state.swap_text + vdc_coords(xcoord, ycoord);
	unsigned attr_off = vdc_state.base_attr - vdc_state.base_text;

	// Return if no swap memory available with selected textmode and no extended memory
	if (!vdc_state.memextended && vdc_state.swap_text > 0x3fff)
	{
		return;
	}

	// First copy viewport to swap screen
	// Characters
	vdc_scroll_copy(destaddr, sourceaddr, viewheight, viewwidth);

	// Attributes
	sourceaddr += attr_off;
	destaddr += attr_off;
	vdc_scroll_copy(destaddr, sourceaddr, viewheight, viewwidth);

	// Then copy back to main screen one position scrolled
	sourceaddr = vdc_state.swap_text + vdc_coords(xcoord, ycoord);
	destaddr = vdc_state.base_text + vdc_coords(xcoord, ycoord);

	if (direction == SCROLL_LEFT)
	{
		++destaddr;
		viewwidth--;
	}
	if (direction == SCROLL_RIGHT)
	{
		++sourceaddr;
		viewwidth--;
	}
	if (direction == SCROLL_DOWN)
	{
		sourceaddr += vdc_state.width;
		viewheight--;
	}
	if (direction == SCROLL_UP)
	{
		destaddr += vdc_state.width;
		viewheight--;
	}

	// Characters
	vdc_scroll_copy(destaddr, sourceaddr, viewheight, viewwidth);

	// Attributes
	sourceaddr += attr_off;
	destaddr += attr_off;
	vdc_scroll_copy(destaddr, sourceaddr, viewheight, viewwidth);

	// Finally add the new line or column
	switch (direction)
	{
	case SCROLL_LEFT:
		sourcexoffset--;
		viewwidth = 1;
		break;

	case SCROLL_RIGHT:
		sourcexoffset += viewwidth + 1;
		xcoord += viewwidth;
		viewwidth = 1;
		break;

	case SCROLL_UP:
		sourceyoffset--;
		viewheight = 1;
		break;

	case SCROLL_DOWN:
		sourceyoffset += viewheight + 1;
		ycoord += viewheight;
		viewheight = 1;
		break;

	default:
		break;
	}
	bnk_cpy_viewporttovdc(sourcebank, sourcebase, sourcewidth, sourceheight, sourcexoffset, sourceyoffset, xcoord, ycoord, viewwidth, viewheight);
}

bool bnk_load(char device, char bank, const char *start, const char *fname)
{
	krnio_setbnk(bank, 0);
	krnio_setnam(fname);
	__asm
	{
		lda	#1
		ldx	device
		ldy #0		
		jsr	$ffba // setlfs
		
		lda #0
		ldx start
		ldy start+1
		jsr	$FFD5 // load

		lda #0
		bcs W1
		lda #1
	W1: sta accu
	}
}
#pragma native(bnk_load)

bool bnk_save(char device, char bank, const char *start, const char *end, const char *fname)
{
	krnio_setbnk(bank, 0);
	krnio_setnam(fname);
	return krnio_save(device, start, end);
}

#pragma code(code)
#pragma data(data)
#pragma bss(bss)