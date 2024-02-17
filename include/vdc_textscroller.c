#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <petscii.h>
#include <c128/vdc.h>
#include "vdc_core.h"
#include "banking.h"
#include "vdc_win.h"
#include "vdc_textscroller.h"

void txtscr_bigfont_init(struct TXTSCRBigFont *settings, char scr, char *sp, char width, char ch_width, char ch_height, char ch_num, char *color)
// Initialise big font
{
    char i;

    settings->num = ch_num;
    settings->cr = scr;
    settings->line_incr = width;
    settings->width = ch_width;
    settings->height = ch_height;

    for (i = 0; i < ch_num; i++)
    {
        settings->address[i] = sp + ((i / (width / ch_width)) * (width * ch_height)) + ((i % (width / ch_width)) * ch_width);
    }
    for (i = 0; i < ch_height; i++)
    {
        settings->color[i] = *(color + i);
    }
}

void txtscr_bigfont_printchar(struct TXTSCRBigFont *settings, char ch, char x, char y, char col)
// Print a big font char
{
    char *address = settings->address[ch - 32];
    char line;

    for (line = 0; line < settings->height; line++)
    {
        vdc_printc(x, y + line, bnk_readb(settings->cr, address + col), settings->color[line]);
        address += settings->line_incr;
    }
}

void txtscr_scroller_init(struct TXTSCRScrollText *settings, struct TXTSCRBigFont *bigfont, char *textscr, char xs, char ys, char xw, char border)
{
    settings->textscr = textscr;
    settings->bigfont = bigfont;
    settings->count_char = 0;
    settings->count_col = 0;
    settings->count_softx = 0;
    vdcwin_init(&settings->win, xs, ys, xw, settings->bigfont->height);
    vdcwin_border_clear(&settings->win, WIN_BOR_ALL);
}

void txtscr_scroll_do(struct TXTSCRScrollText *settings)
{
    char y, ch;

    // Copy scroll lines to left
    vdcwin_scroll_left(&settings->win, 1);

    // Get char to print
    do
    {
        ch = *(settings->textscr + settings->count_char);

        // Has last char been arrived at?
        if (!ch)
        {
            settings->count_char = 0;
        }
    } while (!ch);

    // Print next column of char
    txtscr_bigfont_printchar(settings->bigfont, ch, settings->win.sx + settings->win.wx - 1, settings->win.sy, settings->count_col);
    settings->count_col++;
    if (settings->count_col > settings->bigfont->width - 1)
    {
        settings->count_col = 0;
        settings->count_char++;
    }
}