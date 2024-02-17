#ifndef VDC_TEXTSCROLLERL_H
#define VVDC_TEXTSCROLLERL_H

#include "vdc_win.h"

// Function prototypes
void txtscr_bigfont_init(struct TXTSCRBigFont *settings, char scr, char *sp, char width, char ch_width, char ch_height, char ch_num, char *color);
void txtscr_bigfont_printchar(struct TXTSCRBigFont *settings, char ch, char x, char y, char w);
void txtscr_scroller_init(struct TXTSCRScrollText *settings, struct TXTSCRBigFont *bigfont, char *textscr, char xs, char ys, char xw, char border);
void txtscr_scroll_do(struct TXTSCRScrollText *settings);

// Global vars
struct TXTSCRBigFont {
    char num;
    char cr;
    unsigned line_incr;
    char width;
    char height;
    char *address[91];
    char color[8];
};
struct TXTSCRScrollText {
    char *textscr;
    struct TXTSCRBigFont *bigfont;
    struct VDCWin win;
    unsigned count_char;
    char count_col;
    char count_softx;
};

#pragma compile("vdc_textscroller.c")

#endif