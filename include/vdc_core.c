#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <petscii.h>
#include <c128/vdc.h>
#include "vdc_core.h"
#include "peekpoke.h"

char linebuffer[81];
struct VDCStatus vdc_state;

struct VDCModeSet vdc_modes[2] =
    {
        {80, 25, 0, 0x0000, 0x0800, 0x1000, 0x1800, 0x2000, 0x3000, 0x4000, {VDCR_HTOTAL, 0x7f, VDCR_VTOTAL, 0x26, VDCR_VDISPLAY, 0x19, VDCR_VSYNC, 0x20, VDCR_LACE, 0xfc, VDCR_CSIZE, 0xe7, 255}},
        {80, 50, 1, 0x0000, 0x1000, 0x4000, 0x5000, 0x2000, 0x3000, 0x6000, {VDCR_HTOTAL, 0x80, VDCR_VTOTAL, 0x40, VDCR_VDISPLAY, 0x32, VDCR_VSYNC, 0x3a, VDCR_LACE, 0x03, VDCR_CSIZE, 0x07, 255}}};

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

void vdc_set_disp_address(unsigned text, unsigned attr)
// Function to set the VDC display addresses for text and attributes
{
    // Text
    vdc_reg_write(VDCR_DISP_ADDRH, text >> 8); // Set high byte of text address
    vdc_reg_write(VDCR_DISP_ADDRL, text);      // Set low byte of text address
    // Attribute
    vdc_reg_write(VDCR_ATTR_ADDRH, attr >> 8); // Set high byte of attribute address
    vdc_reg_write(VDCR_ATTR_ADDRL, attr);      // Set low byte of attribute address
}

void vdc_set_charset_address(unsigned address)
// Function to set the VDC display addresses for text and attributes
{
    // Get old value and wipe bits 5-7
    char value = vdc_reg_read(VDCR_CHAR_ADDRH) & 0x1f;
    printf("%2X %2X", vdc_reg_read(VDCR_CHAR_ADDRH), value);

    // Calculate most significant three bits of address and add to value
    value += (address >> 8) & 0xe0;

    // Save new value
    vdc_reg_write(VDCR_CHAR_ADDRH, value);
}

char vdc_set_mode(char mode)
// Function to set one of the preset VDC modes. Returns 1=succes, 0=fail.
{
    char index = 0;

    // Check if extended memory is required and available. If not, return with code 0.
    if (vdc_modes[mode].extmem && vdc_state.memsize == 16)
    {
        return 0;
    }

    // Set screen state
    vdc_state.width = vdc_modes[mode].width;
    vdc_state.height = vdc_modes[mode].height;
    vdc_state.base_text = vdc_modes[mode].base_text;
    vdc_state.base_attr = vdc_modes[mode].base_attr;
    vdc_state.swap_text = vdc_modes[mode].swap_text;
    vdc_state.swap_attr = vdc_modes[mode].swap_attr;
    vdc_state.char_std = vdc_modes[mode].char_std;
    vdc_state.char_alt = vdc_modes[mode].char_alt;
    vdc_state.extended = vdc_modes[mode].extended;

    // Set VDC addresses
    vdc_set_disp_address(vdc_modes[mode].base_text, vdc_modes[mode].base_attr);
    vdc_set_charset_address(vdc_modes[mode].char_std);

    do
    {
        vdc_reg_write(vdc_modes[mode].regset[index++], vdc_modes[mode].regset[index++]);
    } while (vdc_modes[mode].regset[index] != 255);

    // Check if extended memory is required and not yet set. If so, set.
    if (vdc_modes[mode].extmem && !vdc_state.memextended)
    {
        vdc_set_extended_memsize();
    }
    else
    {
        vdc_cls();
    }
}

void vdc_init(char mode, char extmem)
// Initialize VDC screen
{
    // Init screen colors
    vdc_bgcolor(VDC_BLACK);
    vdc_fgcolor(VDC_LYELLOW);
    vdc_state.text_attr = VDC_LYELLOW + VDC_A_ALTCHAR;

    // Detect VDC memsize and set to extended if 64 KB
    vdc_detect_mem_size();

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

    // Set screen mode
    vdc_set_mode(mode);

    // If 64 KB VDC and extmem is requested, enable it.
    if (vdc_state.memsize == 64 && extmem)
    {
        vdc_set_extended_memsize();
    }
}

void vdc_exit()
// Return to normal state of VDC
{
    fastmode(0);                  // Disable fast mode
    vdc_set_mode(VDC_TEXT_80x25); // Set default mode
    vdc_cls();                    // Clear screen
}

unsigned vdc_coords(char x, char y)
// Function returns a VDC memory address for given x,y coords. To be added to base address for text or attributes.
{
    return (y * vdc_state.width) + x;
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
    vdc_state.memsize = (vdc_mem_read_at(0x1fff) == 0x00) ? 64 : 16;

    // Restore bit 4 of register 28
    vdc_reg_write(VDCR_CHAR_ADDRH, ramtype);

    // Do a clear screen
    vdc_cls();
}

void vdc_disable_display()
// Function to disable VDC display
{
    vdc_reg_write(VDCR_HSTART, 0x80);
}

void vdc_enable_display()
// Function to enable VDC display
{
    vdc_reg_write(VDCR_HSTART, 0x7d);
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

void vdc_block_copy_page(unsigned dest, unsigned src, char length)
// Function to copy maximum a page within VDC memory using fast block copy
// Input: Destination (dest) amd source (src) addresses, length max 255 zero based
{
    // Set base addresses
    vdc_mem_addr(dest);                                             // Set VDC destination address
    vdc_reg_write(VDCR_VSCROLL, vdc_reg_read(VDCR_VSCROLL) | 0x80); // Set copy bit (bit 7) of registerv 24
    vdc_reg_write(VDCR_BLOCK_ADDRH, src >> 8);                      // Set high byte of source address
    vdc_reg_write(VDCR_BLOCK_ADDRL, src);                           // Set low byte of source address
    vdc_reg(VDCR_DATA);                                             // Write to VDC

    // Set length
    vdc_reg_write(VDCR_DSIZE, length); // Set length in register 30
}

void vdc_block_copy(unsigned dest, unsigned src, unsigned length)
// Function to copy multiple pages within VDC memory using fast block copy
// Input: Destination (dest) amd source (src) addresses, length zero based
{
    char pages = length / 256;    // Calculate number of pages
    char lastpage = length % 256; // Calculate length left after doing all full pages

    // Copy full pages
    for (char page = 0; page < pages; page++)
    {
        vdc_block_copy_page(dest, src, 255);
        dest += 256;
        src += 256;
    }

    // Copy length left
    vdc_block_copy_page(dest, src, lastpage);
}

void vdc_scroll_copy(unsigned dest, unsigned src, char lines, char length)
// Function to copy a window of lines by length within VDC memory to another location
// Source address is address of upper left corner
{
    for (char line = 0; line < lines; line++)
    {
        vdc_block_copy_page(dest, src, length);
        src += vdc_state.width;
        dest += vdc_state.width;
    }
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
    // Check if 64 KB VDC, return if 16. Also return if already set.
    if (vdc_state.memsize == 16 || vdc_state.memextended)
    {
        return;
    }

    vdc_disable_display();                                                // Disable display to not show artifacts
    vdc_wipe_mem();                                                       // Wipe memory to avoid artifacts
    vdc_reg_write(VDCR_CHAR_ADDRH, vdc_reg_read(VDCR_CHAR_ADDRH) | 0x10); // Setting memory mode to 64KB by setting bit 4 of register 28
    vdc_restore_charsets();                                               // Restore charsets from ROM
    vdc_cls();                                                            // CLear VDC screen with spaces in color ywllow
    vdc_enable_display();                                                 // Enable display again
    vdc_state.memextended = 1;                                            // Set state flag
}

void vdc_set_default_memsize()
// Function to set VDC in default memory configuration
{
    // Check if already in default mode
    if (!vdc_state.memextended)
    {
        return;
    }

    vdc_disable_display();                                                // Disable display to not show artifacts
    vdc_wipe_mem();                                                       // Wipe memory to avoid artifacts
    vdc_reg_write(VDCR_CHAR_ADDRH, vdc_reg_read(VDCR_CHAR_ADDRH) & 0xef); // Setting memory mode to 64KB by clearing bit 4 of register 28
    vdc_restore_charsets();                                               // Restore charsets from ROM
    vdc_cls();                                                            // CLear VDC screen with spaces in color ywllow
    vdc_enable_display();                                                 // Enable display again
    vdc_state.memextended = 0;                                            // Set state flag
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
    vdc_state.text_attr = (vdc_state.text_attr & 0xf0) + color;
}

void vdc_altchar(char set)
// Clear (set=0) or set (set=1) alternate charset mode
{
    vdc_state.text_attr = (set) ? (vdc_state.text_attr | VDC_A_ALTCHAR) : (vdc_state.text_attr & ~VDC_A_ALTCHAR);
}

void vdc_blink(char set)
// Clear (set=0) or set (set=1) blink mode
{
    vdc_state.text_attr = (set) ? (vdc_state.text_attr | VDC_A_BLINK) : (vdc_state.text_attr & ~VDC_A_BLINK);
}

void vdc_underline(char set)
// Clear (set=0) or set (set=1) underline mode
{
    vdc_state.text_attr = (set) ? (vdc_state.text_attr | VDC_A_UNDERLINE) : (vdc_state.text_attr & ~VDC_A_UNDERLINE);
}

void vdc_reverse(char set)
// Clear (set=0) or set (set=1) reverse mode
{
    vdc_state.text_attr = (set) ? (vdc_state.text_attr | VDC_A_REVERSE) : (vdc_state.text_attr & ~VDC_A_REVERSE);
}

void vdc_printc(char x, char y, char val, char attr)
// Function to plot a char at a given coordinate
{
    unsigned address = vdc_coords(x, y);
    vdc_mem_write_at(address + vdc_state.base_text, val);
    vdc_mem_write_at(address + vdc_state.base_attr, attr);
}

void vdc_prints(char x, char y, const char *string)
// Function to plot a string at a given coordinate
{
    unsigned address = vdc_coords(x, y);
    char len = strlen(string);

    // Print text
    vdc_mem_addr(address + vdc_state.base_text);
    for (char i = 0; i < len; i++)
    {
        vdc_write(pet2screen(string[i]));
    }

    // Color
    vdc_block_fill(address + vdc_state.base_attr, vdc_state.text_attr, len - 1);
}

void vdc_hchar(char x, char y, char val, char attr, char length)
// Function to plot horizontal line using block copy
{
    unsigned address = vdc_coords(x, y);
    vdc_block_fill(address + vdc_state.base_text, val, length - 1);  // Text
    vdc_block_fill(address + vdc_state.base_attr, attr, length - 1); // Attributes
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
        vdc_hchar(x, i, val, vdc_state.text_attr, length);
    }
}

void vdc_cls()
// Function to clear VDC screen with given value and attribute
{
    vdc_clear(0, 0, C_SPACE, vdc_state.width, vdc_state.height);
}