#ifndef VDC_CORE_H
#define VDC_CORE_H

// VDC addressing
#define VDCBASETEXT 0x0000 // Base address for text screen characters
#define VDCBASEATTR 0x0800 // Base address for text screen attributes
#define VDCSWAPTEXT 0x1000 // Base address for swap text screen characters
#define VDCSWAPATTR 0x1800 // Base address for swap text screen attributes
#define VDCCHARSTD 0x2000  // Base address for standard charset
#define VDCCHARALT 0x3000  // Base address for alternate charset
#define VDCEXTENDED 0x4000 // Base address of 64K VDC extended memory space

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
char screenwidth();
void screen_setmode(char mode);
void fastmode(char set);
char *AscToPet(char *ascii);
char pet2screen(char p);
void vdc_init();
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

// Global variables
extern char vdc_memsize;
extern char linebuffer[81];
extern char vdc_text_attr;

#pragma compile("vdc_core.c")

#endif