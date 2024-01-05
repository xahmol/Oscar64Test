#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <c128/vdc.h>
#include "vdc_core.h"
#include "peekpoke.h"

char vdc_memsize = 0;
char linebuffer[81];
char linebuffer2[81];
char vdc_text_attr = VDC_LYELLOW + VDC_A_ALTCHAR;

unsigned char ascToPetTable[256] = {
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x14, 0x20, 0x0d, 0x11, 0x93, 0x0a, 0x0e, 0x0f,
    0x10, 0x0b, 0x12, 0x13, 0x08, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f,
    0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f,
    0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f,
    0x40, 0xc1, 0xc2, 0xc3, 0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xcf,
    0xd0, 0xd1, 0xd2, 0xd3, 0xd4, 0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0xda, 0x5b, 0x5c, 0x5d, 0x5e, 0x5f,
    0xc0, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f,
    0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5a, 0xdb, 0xdc, 0xdd, 0xde, 0xdf,
    0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f,
    0x90, 0x91, 0x92, 0x0c, 0x94, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9a, 0x9b, 0x9c, 0x9d, 0x9e, 0x9f,
    0xa0, 0xa1, 0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7, 0xa8, 0xa9, 0xaa, 0xab, 0xac, 0xad, 0xae, 0xaf,
    0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5, 0xb6, 0xb7, 0xb8, 0xb9, 0xba, 0xbb, 0xbc, 0xbd, 0xbe, 0xbf,
    0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f,
    0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a, 0x7b, 0x7c, 0x7d, 0x7e, 0x7f,
    0xe0, 0xe1, 0xe2, 0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9, 0xea, 0xeb, 0xec, 0xed, 0xee, 0xef,
    0xf0, 0xf1, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8, 0xf9, 0xfa, 0xfb, 0xfc, 0xfd, 0xfe, 0xff};

char screen_width()
// Return screenwidth 40 or 80
{
    if (*(volatile char *)0xd7 >= 128)
    {
        return 80;
    }
    else
    {
        return 40;
    }
}

void screen_setmode(char mode)
// Set mode of text screen: inpout 40 or 80 for repp. VIC-II or VDC mode
{
    if (mode != screen_width())
    {
        __asm
        {
            jsr 0xff5f
        }
    }
}

void fastmode(char set)
// Set (1) or disable (0) fast 2 MHz mode. Set blanks VIC.
{
    if (set)
    {
        POKE(0xd011, PEEK(0xd011) & (~(1 << 4))); // Disable the 5th bit of the SCROLY register to blank VIC screen
        POKE(0xd011, PEEK(0xd011) & (~(1 << 7))); // Disable the 8th bit of the SCROLY register to avoid accidentally setting raster interrupt to high
        POKE(0xd030, 1);                          // Set C128 speed to FAST (2 Mhz)
    }
    else
    {
        POKE(0xd030, 0);                          // Switch to 1Mhz mode
        POKE(0xd011, PEEK(0xd011) | (1 << 4));    // Enable the 5th bit of the SCROLY register to blank VIC screen
        POKE(0xd011, PEEK(0xd011) & (~(1 << 7))); // Disable the 8th bit of the SCROLY register to avoid accidentally setting raster interrupt to high
    }
}

char *AscToPet(char *ascii)
{
    // Convert a ASCIIstring to an PETSCII string

    unsigned char x;

    for (x = 0; (x < strlen(ascii) && x < 100); x++)
    {
        linebuffer2[x] = ascToPetTable[ascii[x]];
    }
    linebuffer2[x] = 0;
    return linebuffer2;
}

char pet2screen(char p)
// Convert Petscii values to screen code values
{
    if (p < 32)
        p = p + 128;
    else if (p > 63 && p < 96)
        p = p - 64;
    else if (p > 95 && p < 128)
        p = p - 32;
    else if (p > 127 && p < 160)
        p = p + 64;
    else if (p > 159 && p < 192)
        p = p - 64;
    else if (p > 191 && p < 255)
        p = p - 128;
    else if (p == 255)
        p = 94;

    return p;
}

void vdc_init()
// Initialize VDC screen
{
    // Give message if 40 column screen is active and wait on key before switching to 80
    if (screen_width() == 40)
    {
        printf("SWITCH TO 80 COLUMN SCREEN\nAND PRESS KEY.\n");
        getch();
        clrscr();
        screen_setmode(80);
    }

    // Set 2 Mhz mode
    fastmode(1);

    // Init screen colors
    vdc_bgcolor(VDC_BLACK);
    vdc_fgcolor(VDC_LYELLOW);
    vdc_text_attr = VDC_LYELLOW + VDC_A_ALTCHAR;
    vdc_cls();
}

void vdc_exit()
// Return to normal state of VDC
{
    fastmode(0); // Disable fast mode
    vdc_cls();   // Clear screen
}

unsigned vdc_coords(char x, char y)
// Function returns a VDC memory address for given x,y coords. To be added to base address for text or attributes.
{
    unsigned addr = (y * 80) + x;

    if (addr < 2000)
        return addr;
    else
        return -1;
}

void vdc_restore_charsets()
// Restore charsets from ROM
{
    __asm
    {
	    jsr 0xff62
    }
}

void vdc_detect_mem_size()
// Function to detect VDC memory size. Returns size in KB in glbal variable.
{
    // Reading register 28, safeguarding value, setting bit 4 and storing back to register 28
    char ramtype = vdc_reg_read(VDCR_CHAR_ADDRH);
    vdc_reg_write(VDCR_CHAR_ADDRH, ramtype | 0x10);

    // Writing a $00 value to VDC $1fff
    vdc_mem_write_at(0x1fff, 0x00);

    // Writing a $ff value to VDC $9fff
    vdc_mem_write_at(0x9fff, 0xff);

    // Reading back value of VDC $1fff and comparing value with $00 to see if 64KB address could be read
    // If value has remained 0, then 64 KB VDC mem is detected, else 16.
    vdc_memsize = (vdc_mem_read_at(0x1fff) == 0x00) ? 64 : 16;

    // Restore bit 4 of register 28
    vdc_reg_write(VDCR_CHAR_ADDRH, ramtype);
}

void vdc_disable_display()
// Function to disable VDC display
{
    vdc_reg_write(VDCR_CWIDTH, 0);
}

void vdc_enble_display()
// Function to enable VDC display
{
    vdc_reg_write(VDCR_CWIDTH, 0x7d);
}

void vdc_block_fill(unsigned address, char value, char length)
// Function to flll VDC area with blockfill
// Input:   address =   start address
//          value   =   value to fill area with
//          length  =   number of positions to fill, zero based, max 255
{
    vdc_mem_addr(address);                                          // Set VDC address
    vdc_write(value);                                               // Write value to data register
    vdc_reg_write(VDCR_VSCROLL, vdc_reg_read(VDCR_VSCROLL) & 0x7f); // Clear copy bit (bit 7) of register 24
    vdc_reg_write(VDCR_DSIZE, length);                              // Set block copy length
}

void vdc_wipe_mem()
// Function to wipe VDC memory to avoid visible screen corruption on VDC mem lauout change
{
    unsigned address = 0;

    for (char x = 0; x < 255; x++)
    {
        vdc_block_fill(address, 0, 255);
        address += 256;
    }
    vdc_block_fill(address, 0, 255);
}

void vdc_set_extended_memsize()
// Function to set VDC in 64k memory configuration
{
    vdc_disable_display();                                                // Disable display to not show artifacts
    vdc_wipe_mem();                                                       // Wipe memory to avoid artifacts
    vdc_reg_write(VDCR_CHAR_ADDRH, vdc_reg_read(VDCR_CHAR_ADDRH) | 0x10); // Setting memory mode to 64KB by setting bit 4 of register 28
    vdc_restore_charsets();                                               // Restore charsets from ROM
    vdc_cls();                                                            // CLear VDC screen with spaces in color ywllow
    vdc_enble_display();                                                  // Enable display again
}

void vdc_set_default_memsize()
// Function to set VDC in default memory configuration
{
    vdc_disable_display();                                                // Disable display to not show artifacts
    vdc_wipe_mem();                                                       // Wipe memory to avoid artifacts
    vdc_reg_write(VDCR_CHAR_ADDRH, vdc_reg_read(VDCR_CHAR_ADDRH) & 0xef); // Setting memory mode to 64KB by clearing bit 4 of register 28
    vdc_restore_charsets();                                               // Restore charsets from ROM
    vdc_cls();                                                            // CLear VDC screen with spaces in color ywllow
    vdc_enble_display();                                                  // Enable display again
}

void vdc_bgcolor(char color)
// Set VDC background color
{
    vdc_reg_write(VDCR_COLOR, (vdc_reg_read(VDCR_COLOR) & 0xf0) + color);
}

void vdc_fgcolor(char color)
// Set VDC foreground color
{
    vdc_reg_write(VDCR_COLOR, (vdc_reg_read(VDCR_COLOR) & 0x0f) + (color * 16));
}

void vdc_textcolor(char color)
// Set default text attributes
{
    // Set color while retaining bits 4-7
    vdc_text_attr = (vdc_text_attr & 0xf0) + color;
}

void vdc_altchar(char set)
// Clear (set=0) or set (set=1) alternate charset mode
{
    vdc_text_attr = (set) ? (vdc_text_attr | VDC_A_ALTCHAR) : (vdc_text_attr & ~VDC_A_ALTCHAR);
}

void vdc_blink(char set)
// Clear (set=0) or set (set=1) blink mode
{
    vdc_text_attr = (set) ? (vdc_text_attr | VDC_A_BLINK) : (vdc_text_attr & ~VDC_A_BLINK);
}

void vdc_underline(char set)
// Clear (set=0) or set (set=1) underline mode
{
    vdc_text_attr = (set) ? (vdc_text_attr | VDC_A_UNDERLINE) : (vdc_text_attr & ~VDC_A_UNDERLINE);
}

void vdc_reverse(char set)
// Clear (set=0) or set (set=1) reverse mode
{
    vdc_text_attr = (set) ? (vdc_text_attr | VDC_A_REVERSE) : (vdc_text_attr & ~VDC_A_REVERSE);
}

void vdc_printc(char x, char y, char val)
// Function to plot a char at a given coordinate
{
    unsigned address = vdc_coords(x, y);
    vdc_mem_write_at(address + VDCBASETEXT, pet2screen(ascToPetTable[val]));
    vdc_mem_write_at(address + VDCBASETEXT, vdc_text_attr);
}

void vdc_prints(char x, char y, const char *string)
// Function to plot a string at a given coordinate
{
    unsigned address = vdc_coords(x, y);
    char len = strlen(string);

    // Print text
    vdc_mem_addr(address + VDCBASETEXT);
    for (char i = 0; i < len; i++)
    {
        vdc_write(pet2screen(ascToPetTable[string[i]]));
    }

    // Color
    vdc_block_fill(address + VDCBASEATTR, vdc_text_attr, len - 1);
}

void vdc_hchar(char x, char y, char val, char attr, char length)
// Function to plot horizontal line using block copy
{
    unsigned address = vdc_coords(x, y);
    vdc_block_fill(address + VDCBASETEXT, val, length - 1); // Text
    vdc_block_fill(address + VDCBASEATTR, val, length - 1); // Attributes
}

void vdc_vchar(char x, char y, char val, char attr, char length)
// Function to plot vertical line from top to bottom
{
    for (char i = y; i < y + length; i++)
    {
        vdc_printc(x, i, val, attr);
    }
}

void vdc_clear(char x, char y, char val, char length, char lines)
// Function to clear VDC area with given value and attribute
{
    for (char i = y; i < y + lines; i++)
    {
        vdc_hchar(x, i, pet2screen(val), vdc_text_attr, length);
    }
}

void vdc_cls()
// Function to clear VDC screen with given value and attribute
{
    vdc_clear(0, 0, ' ', 80, 25);
}