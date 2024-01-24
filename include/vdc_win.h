#ifndef VDC_WIN_H
#define VDC_WIN_H

// Define window settings
#define WIN_MAX_NR 5      // Maximum number of windows (of memory allows)
#define WIN_MEMORY 0x0800 // Maximum memory available for windows (now 2 KB)

// Border flags
#define WIN_BOR_UP 0x80    // Bit 7: set top border on (1) or off (0)
#define WIN_BOR_LE 0x40    // Bit 6: set left border on (1) or off (0)
#define WIN_BOR_RI 0x20    // Bit 5: set right border on (1) or off (0)
#define WIN_BOR_BO 0x10    // Bit 4: set bottom border on (1) or off (0)
                           // Bit 0-3: style number (0-15 or max defined)
#define WIN_BOR_ALL 0xF0   // All borders on
#define WIN_BOR_NOTOP 0x70 // All borders expect for top

struct VDCWin
{
    char sx, sy, wx, wy;
    char cx, cy;

    unsigned sp, cp;
};
struct VDCViewport
{
    char sourcebank;
    char *sourcebase;
    unsigned sourcewidth;
    unsigned sourceheight;
    unsigned sourcexoffset;
    unsigned sourceyoffset;
    struct VDCWin win;
};
struct WinStyleStruct
{
    char color;
    char upcornleft;
    char upcornright;
    char bocornleft;
    char bocornright;
    char up;
    char down;
    char left;
    char right;
};
struct WinCfgStruct
{
    char *membase;
    unsigned memsize;
    char active;
};
extern struct WinCfgStruct winCfg;
struct WinStruct
{
    char *memaddress;
    struct VDCWin win;
};
extern struct WinStruct windows[WIN_MAX_NR];

// Initialize the VDCWin structure for the given screen and coordinates, does
// not clear the window
//
void vdcwin_init(struct VDCWin *win, char sx, char sy, char wx, char wy);

// Clear the window
//
void vdcwin_clear(struct VDCWin *win);

// Fill the window with the given character and color
//
void vdcwin_fill(struct VDCWin *win, char ch);

// Show or hide the cursor by setting or clearing the reverse attribute
//
void vdcwin_cursor_show(struct VDCWin *win, bool show);

// Move the cursor to the given location
//
void vdcwin_cursor_move(struct VDCWin *win, char cx, char cy);

// Move the cursor in the window, returns true if the cursor could be moved
//
bool vdcwin_cursor_left(struct VDCWin *win);
bool vdcwin_cursor_right(struct VDCWin *win);
bool vdcwin_cursor_up(struct VDCWin *win);
bool vdcwin_cursor_down(struct VDCWin *win);
bool vdcwin_cursor_forward(struct VDCWin *win);
bool vdcwin_cursor_backward(struct VDCWin *win);
bool vdcwin_cursor_newline(struct VDCWin *win);

// Read the full window into a string
//
void vdcwin_read_string(struct VDCWin *win, char *buffer);

// Write the fill window with the given string
//
void vdcwin_write_string(struct VDCWin *win, const char *buffer);

// Put a single char at the cursor location and advance the cursor
//
void vdcwin_put_char(struct VDCWin *win, char ch);

// Put an array of chars at the cursor location and advance the cursor
//
void vdcwin_put_chars(struct VDCWin *win, const char *chars, char num);

// Put a zero terminated string at the cursor location and advance the cursor
//
char vdcwin_put_string(struct VDCWin *win, const char *str);

// Put a single raw char at the cursor location and advance the cursor
//
void vdcwin_put_char_raw(struct VDCWin *win, char ch);

// Put an array of raw chars at the cursor location and advance the cursor
//
void vdcwin_put_chars_raw(struct VDCWin *win, const char *chars, char num);

// Put a zero terminated raw string at the cursor location and advance the cursor
//
char vdcwin_put_string_raw(struct VDCWin *win, const char *str);

// Put a single char at the given window location
//
void vdcwin_putat_char(struct VDCWin *win, char x, char y, char ch);

// Put an array of chars at the given window location
//
void vdcwin_putat_chars(struct VDCWin *win, char x, char y, const char *chars, char num);

// Put a zero terminated string at the given window location
//
char vdcwin_putat_string(struct VDCWin *win, char x, char y, const char *str);

// Put a single raw char at the given window location
//
void vdcwin_putat_char_raw(struct VDCWin *win, char x, char y, char ch);

// Put an array of raw chars at the given window location
//
void vdcwin_putat_chars_raw(struct VDCWin *win, char x, char y, const char *chars, char num);

// Put a zero terminated string at the given window location
//
char vdcwin_putat_string_raw(struct VDCWin *win, char x, char y, const char *str);

// Get a single char at the given window location
//
char vdcwin_getat_char(struct VDCWin *win, char x, char y);

// Get an array of chars at the given window location
//
void vdcwin_getat_chars(struct VDCWin *win, char x, char y, char *chars, char num);

// Get a single char at the given window location
//
char vdcwin_getat_char_raw(struct VDCWin *win, char x, char y);

// Get an array of chars at the given window location
//
void vdcwin_getat_chars_raw(struct VDCWin *win, char x, char y, char *chars, char num);

// Put an array of characters into a rectangle in the char win
void vdcwin_put_rect_raw(struct VDCWin *win, char x, char y, char w, char h, char cr, const char *chars);

void vdcwin_put_rect(struct VDCWin *win, char x, char y, char w, char h, char cr, const char *chars);

// Get an array of characters from a rectangle of a char win
void vdcwin_get_rect_raw(struct VDCWin *win, char x, char y, char w, char h, char cr, char *chars);

void vdcwin_get_rect(struct VDCWin *win, char x, char y, char w, char h, char cr, char *chars);

// Insert one space character at the cursor position
//
void vdcwin_insert_char(struct VDCWin *win);

// Delete the character at the cursor position
//
void vdcwin_delete_char(struct VDCWin *win);

int vdcwin_getch(void);

int vdcwin_checkch(void);

// Edit the window position using the char as the input
//
bool vdcwin_edit_char(struct VDCWin *win, char ch);

// Edit the window using keyboard input, returns the key the exited
// the edit, either return or stop
//
char vdcwin_edit(struct VDCWin *win);

// Scroll the window in the given direction, does not fill the new
// empty space
//
void vdcwin_scroll_left(struct VDCWin *win, char by);
void vdcwin_scroll_right(struct VDCWin *win, char by);
void vdcwin_scroll_up(struct VDCWin *win, char by);
void vdcwin_scroll_down(struct VDCWin *win, char by);

// Fill the given rectangle with the character and color
//
inline void vdcwin_fill_rect(struct VDCWin *win, char x, char y, char w, char h, char ch);

// Fill the given rectangle with the screen code and color
//
void vdcwin_fill_rect_raw(struct VDCWin *win, char x, char y, char w, char h, char ch);

void vdcwin_printline(struct VDCWin *win, const char *str);
void vdcwin_printwrap(struct VDCWin *win, const char *str);
void vdcwin_border_clear(struct VDCWin *win, char border);

void vdcwin_viewport_init(struct VDCViewport *vp, char sourcebank, char *sourcebase, unsigned sourcewidth, unsigned sourceheight, unsigned viewwidth, unsigned viewheight, char viewsx, char viewsy);
void vdcwin_cpy_viewport(struct VDCViewport *viewport);
void vdcwin_viewportscroll(struct VDCViewport *viewport, char direction);

#pragma compile("vdc_win.c")

#endif
