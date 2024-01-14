#ifndef VDvdcwin_H
#define VDvdcwin_H

struct VDCWin
{
	char		sx, sy, wx, wy;
	char		cx, cy;

	unsigned	sp, cp;
};

// Initialize the VDCWin structure for the given screen and coordinates, does
// not clear the window
//
void vdcwin_init(VDCWin *win, char sx, char sy, char wx, char wy);


// Clear the window
//
void vdcwin_clear(VDCWin *win);

// Fill the window with the given character and color
//
void vdcwin_fill(VDCWin *win, char ch);


// Show or hide the cursor by setting or clearing the reverse attribute
//
void vdcwin_cursor_show(VDCWin *win, bool show);

// Move the cursor to the given location
//
void vdcwin_cursor_move(VDCWin * win, char cx, char cy);


// Move the cursor in the window, returns true if the cursor could be moved
//
bool vdcwin_cursor_left(VDCWin * win);
bool vdcwin_cursor_right(VDCWin * win);
bool vdcwin_cursor_up(VDCWin * win);
bool vdcwin_cursor_down(VDCWin * win);
bool vdcwin_cursor_forward(VDCWin * win);
bool vdcwin_cursor_backward(VDCWin * win);
bool vdcwin_cursor_newline(VDCWin * win);

// Read the full window into a string
//
void vdcwin_read_string(VDCWin * win, char * buffer);

// Write the fill window with the given string
//
void vdcwin_write_string(VDCWin * win, const char * buffer);

// Put a single char at the cursor location and advance the cursor
//
void vdcwin_put_char(VDCWin * win, char ch, char color);

// Put an array of chars at the cursor location and advance the cursor
//
void vdcwin_put_chars(VDCWin * win, const char * chars, char num, char color);

// Put a zero terminated string at the cursor location and advance the cursor
//
char vdcwin_put_string(VDCWin * win, const char * str, char color);

// Put a single raw char at the cursor location and advance the cursor
//
void vdcwin_put_char_raw(VDCWin * win, char ch, char color);

// Put an array of raw chars at the cursor location and advance the cursor
//
void vdcwin_put_chars_raw(VDCWin * win, const char * chars, char num, char color);

// Put a zero terminated raw string at the cursor location and advance the cursor
//
char vdcwin_put_string_raw(VDCWin * win, const char * str, char color);



// Put a single char at the given window location
//
void vdcwin_putat_char(VDCWin * win, char x, char y, char ch, char color);

// Put an array of chars at the given window location
//
void vdcwin_putat_chars(VDCWin * win, char x, char y, const char * chars, char num, char color);

// Put a zero terminated string at the given window location
//
char vdcwin_putat_string(VDCWin * win, char x, char y, const char * str, char color);


// Put a single raw char at the given window location
//
void vdcwin_putat_char_raw(VDCWin * win, char x, char y, char ch, char color);

// Put an array of raw chars at the given window location
//
void vdcwin_putat_chars_raw(VDCWin * win, char x, char y, const char * chars, char num, char color);

// Put a zero terminated string at the given window location
//
char vdcwin_putat_string_raw(VDCWin * win, char x, char y, const char * str, char color);


// Get a single char at the given window location
//
char vdcwin_getat_char(VDCWin * win, char x, char y);

// Get an array of chars at the given window location
//
void vdcwin_getat_chars(VDCWin * win, char x, char y, char * chars, char num);



// Get a single char at the given window location
//
char vdcwin_getat_char_raw(VDCWin * win, char x, char y);

// Get an array of chars at the given window location
//
void vdcwin_getat_chars_raw(VDCWin * win, char x, char y, char * chars, char num);


// Put an array of characters into a rectangle in the char win
void vdcwin_put_rect_raw(VDCWin *win, char x, char y, char w, char h, char cr, const char *chars, char color);

void vdcwin_put_rect(VDCWin *win, char x, char y, char w, char h, char cr, const char *chars, char color);

// Get an array of characters from a rectangle of a char win
void vdcwin_get_rect_raw(VDCWin *win, char x, char y, char w, char h, char cr, char *chars);

void vdcwin_get_rect(VDCWin *win, char x, char y, char w, char h, char cr, char *chars);



// Insert one space character at the cursor position
//
void vdcwin_insert_char(VDCWin * win);

// Delete the character at the cursor position
//
void vdcwin_delete_char(VDCWin * win);

int vdcwin_getch(void);

int vdcwin_checkch(void);

// Edit the window position using the char as the input
//
bool vdcwin_edit_char(VDCWin * win, char ch);

// Edit the window using keyboard input, returns the key the exited
// the edit, either return or stop
//
char vdcwin_edit(VDCWin * win);

// Scroll the window in the given direction, does not fill the new
// empty space
//
void vdcwin_scroll_left(VDCWin * win, char by);
void vdcwin_scroll_right(VDCWin * win, char by);
void vdcwin_scroll_up(VDCWin * win, char by);
void vdcwin_scroll_down(VDCWin * win, char by);

// Fill the given rectangle with the character and color
//
inline void vdcwin_fill_rect(VDCWin * win, char x, char y, char w, char h, char ch, char color);

// Fill the given rectangle with the screen code and color
//
void vdcwin_fill_rect_raw(VDCWin * win, char x, char y, char w, char h, char ch, char color);


#pragma compile("vdcwin.c")


#endif
