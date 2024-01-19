#ifndef VDC_CORE_H
#define VDC_CORE_H

// VDC color values
#define VDC_BLACK 0
#define VDC_DGREY 1
#define VDC_DBLUE 2
#define VDC_LBLUE 3
#define VDC_DGREEN 4
#define VDC_LGREEN 5
#define VDC_DCYAN 6
#define VDC_LCYAN 7
#define VDC_DRED 8
#define VDC_LRED 9
#define VDC_DPURPLE 10
#define VDC_LPURPLE 11
#define VDC_DYELLOW 12
#define VDC_LYELLOW 13
#define VDC_LGREY 14
#define VDC_WHITE 15

// VDC attribute values
#define VDC_A_BLINK 16
#define VDC_A_UNDERLINE 32
#define VDC_A_REVERSE 64
#define VDC_A_ALTCHAR 128

// Character codes
#define C_SPACE 32

// Function prototypes
char screen_width();
void screen_setmode(char mode);
void fastmode(char set);
char pet2screen(char p);
void vdc_set_disp_address(unsigned text, unsigned attr);
void vdc_set_charset_address(unsigned address);
void vdc_set_multab();
char vdc_set_mode(char mode);
void vdc_init(char mode, char extmem);
void vdc_exit();
unsigned vdc_coords(char x, char y);
void vdc_restore_charsets();
void vdc_detect_mem_size();
void vdc_disable_display();
void vdc_enable_display();
void vdc_block_fill(unsigned address, char value, char length);
void vdc_block_copy_page(unsigned dest, unsigned src, char length);
void vdc_block_copy(unsigned dest, unsigned src, unsigned length);
void vdc_scroll_copy(unsigned dest, unsigned src, char lines, char length);
void vdc_wipe_mem();
void vdc_set_extended_memsize();
void vdc_set_default_memsize();
void vdc_bgcolor(char color);
void vdc_fgcolor(char color);
void vdc_textcolor(char color);
void vdc_altchar(char set);
void vdc_blink(char set);
void vdc_underline(char set);
void vdc_reverse(char set);
void vdc_printc(char x, char y, char val, char attr);
void vdc_prints(char x, char y, const char *string);
void vdc_hchar(char x, char y, char val, char attr, char length);
void vdc_vchar(char x, char y, char val, char attr, char length);
void vdc_clear(char x, char y, char val, char length, char lines);
void vdc_cls();
void vdc_wait_vblank();
void vdc_wait_no_vblank();
void vdc_pass_vblank();

// Global variables
enum VDCMode
{
    VDC_TEXT_80x25_PAL,
    VDC_TEXT_80x50_PAL,
    VDC_TEXT_80x68_PAL,
    VDC_TEXT_80x25_NTSC,
    VDC_TEXT_80x50_NTSC,
    VDC_TEXT_80x58_NTSC
};
struct VDCModeSet
{
    unsigned width;
    unsigned height;
    char extmem;
    unsigned base_text;
    unsigned base_attr;
    unsigned swap_text;
    unsigned swap_attr;
    unsigned char_std;
    unsigned char_alt;
    unsigned extended;
    char regset[17];
};
extern struct VDCModeSet vdc_modes[6];
struct VDCStatus
{
    char memsize;
    char memextended;
    char mode;
    unsigned width;
    unsigned height;
    char text_attr;
    unsigned base_text;
    unsigned base_attr;
    unsigned swap_text;
    unsigned swap_attr;
    unsigned char_std;
    unsigned char_alt;
    unsigned extended;
    unsigned dispaddr_offset;
    char disp_skip;
};
extern struct VDCStatus vdc_state;
extern char linebuffer[81];
extern unsigned multab[72];

#pragma compile("vdc_core.c")

#endif