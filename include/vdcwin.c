#include <c128/vdc.h>
#include "vdcwin.h"
#include "vdc_core.h"
#include "banking.h"

static inline void copy_fwd(unsigned sdp, const unsigned ssp, unsigned cdp, const unsigned csp, char n)
{
	// Screen copy
	vdc_block_copy(sdp, ssp, n);
	// Color copy
	vdc_block_copy(cdp, csp, n);
}

static inline void fill_fwd(unsigned sdp, unsigned cdp, char ch, char color, char n)
{
	// Screen fill
	vdc_block_fill(sdp, ch, n);
	// Color fill
	vdc_block_fill(cdp, color, n);
}

static inline void copy_bwd(unsigned sdp, const unsigned ssp, unsigned cdp, const unsigned csp, char n)
{
	// Check if swap memory is available given screenmode and VDC memory size
	if (!vdc_state.memextended && vdc_state.swap_text > 0x3ff)
	{
		// Screen copy via bank 0 linebuffer
		bnk_cpyfromvdc(BNK_DEFAULT, linebuffer, ssp, n);
		bnk_cpytovdc(sdp, BNK_DEFAULT, linebuffer, n);
		// Color copy via bank 0 linebuffer
		bnk_cpyfromvdc(BNK_DEFAULT, linebuffer, csp, n);
		bnk_cpytovdc(cdp, BNK_DEFAULT, linebuffer, n);
	}
	else
	{
		// Screen copy via swap VDC memory
		vdc_block_copy(vdc_state.swap_text, ssp, n);
		vdc_block_copy(sdp, vdc_state.swap_text, n);
		// Color copy via swap VDC memory
		vdc_block_copy(vdc_state.swap_text, csp, n);
		vdc_block_copy(cdp, vdc_state.swap_text, n);
	}
}

void vdcwin_init(VDCWin *win, char sx, char sy, char wx, char wy)
{
	win->sx = sx;
	win->sy = sy;
	win->wx = wx;
	win->wy = wy;
	win->cx = 0;
	win->cy = 0;
	win->sp = vdc_state.base_text + vdc_coords(sx, sy);
	win->cp = vdc_state.base_attr + vdc_coords(sx, sy);
}

void vdcwin_clear(VDCWin *win)
{
	vdcwin_fill(win, ' ');
}

void vdcwin_fill(VDCWin *win, char ch)
{
	vdc_clear(win->sx, win->sy, ch, win->wy);
}

void vdcwin_cursor_show(VDCWin *win, bool show)
{
	unsigned cp = vdc_state.base_attr + vdc_coords(win->sx + win->cx, win->sy + win->cy);
	if (show)
		vdc_mem_write_at(cp, vdc_mem_read_at(cp) != VDC_A_REVERSE);
	else
		vdc_mem_write_at(cp, vdc_mem_read_at(cp) &= (VDC_A_REVERSE - 1));
}

void vdcwin_cursor_move(VDCWin *win, char cx, char cy)
{
	win->cx = cx;
	win->cy = cy;
}

bool vdcwin_cursor_left(VDCWin *win)
{
	if (win->cx > 0)
	{
		win->cx--;
		return true;
	}

	return false;
}

bool vdcwin_cursor_right(VDCWin *win)
{
	if (win->cx + 1 < win->wx)
	{
		win->cx++;
		return true;
	}

	return false;
}

bool vdcwin_cursor_up(VDCWin *win)
{
	if (win->cy > 0)
	{
		win->cy--;
		return true;
	}

	return false;
}

bool vdcwin_cursor_down(VDCWin *win)
{
	if (win->cy + 1 < win->wy)
	{
		win->cy++;
		return true;
	}

	return false;
}

bool vdcwin_cursor_newline(VDCWin *win)
{
	win->cx = 0;
	if (win->cy + 1 < win->wy)
	{
		win->cy++;
		return true;
	}

	return false;
}

bool vdcwin_cursor_forward(VDCWin *win)
{
	if (win->cx + 1 < win->wx)
	{
		win->cx++;
		return true;
	}
	else if (win->cy + 1 < win->wy)
	{
		win->cx = 0;
		win->cy++;
		return true;
	}

	return false;
}

bool vdcwin_cursor_backward(VDCWin *win)
{
	if (win->cx > 0)
	{
		win->cx--;
		return true;
	}
	else if (win->cy > 0)
	{
		win->cx = win->wx - 1;
		win->cy--;
		return true;
	}

	return false;
}

static char p2smap[] = {0x00, 0x00, 0x40, 0x20, 0x80, 0xc0, 0x80, 0x80};
static char s2pmap[] = {0x40, 0x00, 0x20, 0xc0, 0xc0, 0x80, 0xa0, 0x40};

static inline char p2s(char ch)
{
	return ch ^ p2smap[ch >> 5];
}

static inline char s2p(char ch)
{
	return ch ^ s2pmap[ch >> 5];
}

void vdcwin_read_string(VDCWin *win, char *buffer)
{
	unsigned sp = win->sp;

	char i = 0;
	for (char y = 0; y < win->wy; y++)
	{
		for (char x = 0; x < win->wx; x++)
		{
			buffer[i++] = s2p(vdc_mem_read_at(sp + x));
		}
		sp += vdc_state.width;
	}
	while (i > 0 && buffer[i - 1] == ' ')
		i--;
	buffer[i] = 0;
}

void vdcwin_write_string(VDCWin *win, const char *buffer)
{
	unsigned dp = win->sp;
	for (char y = 0; y < win->wy; y++)
	{
		for (char x = 0; x < win->wx; x++)
		{
			char ch = *buffer;
			if (ch)
			{
				vdc_mem_write_at(dp + x, p2s(ch));
				buffer++;
			}
			else
				vdc_mem_write_at(dp + x, ' ');
		}
		dp += vdc_state.width;
	}
}

void vdcwin_put_char(VDCWin *win, char ch, char color)
{
	vdcwin_putat_char(win, win->cx, win->cy, ch, color);
	win->cx++;
	if (win->cx == win->wx)
	{
		win->cx = 0;
		win->cy++;
	}
}

void vdcwin_put_chars(VDCWin *win, const char *chars, char num, char color)
{
	vdcwin_putat_chars(win, win->cx, win->cy, chars, color);
	win->cx += num;
	if (win->cx >= win->wx)
	{
		win->cx = 0;
		win->cy++;
	}
}

char vdcwin_put_string(VDCWin *win, const char *str, char color)
{
	char n = vdcwin_putat_string(win, win->cx, win->cy, str, color);
	win->cx += n;
	if (win->cx >= win->wx)
	{
		win->cx = 0;
		win->cy++;
	}
	return n;
}

void vdcwin_put_char_raw(VDCWin *win, char ch, char color)
{
	vdcwin_putat_char_raw(win, win->cx, win->cy, ch, color);
	win->cx++;
	if (win->cx == win->wx)
	{
		win->cx = 0;
		win->cy++;
	}
}

void vdcwin_put_chars_raw(VDCWin *win, const char *chars, char num, char color)
{
	vdcwin_putat_chars_raw(win, win->cx, win->cy, chars, color);
	win->cx += num;
	if (win->cx >= win->wx)
	{
		win->cx = 0;
		win->cy++;
	}
}

char vdcwin_put_string_raw(VDCWin *win, const char *str, char color)
{
	char n = vdcwin_putat_string_raw(win, win->cx, win->cy, str, color);
	win->cx += n;
	if (win->cx >= win->wx)
	{
		win->cx = 0;
		win->cy++;
	}
	return n;
}

void vdcwin_putat_char(VDCWin *win, char x, char y, char ch, char color)
{
	vdc_printc(win->sx + x, win->sy + y, p2s(ch), color);
}

#pragma native(vdcwin_putat_char)

void vdcwin_putat_chars(VDCWin *win, char x, char y, const char *chars, char num, char color)
{
	for (char i = 0; i < num; i++)
	{
		vdc_printc(win->sx + x + i, win->sy + y, p2s(chars[i]), color);
	}
}

#pragma native(vdcwin_putat_chars)

char vdcwin_putat_string(VDCWin *win, char x, char y, const char *str, char color)
{
	char i = 0;
	while (char ch = str[i])
	{
		vdc_printc(win->sx + x + i, win->sy + y, p2s(ch), color);
		i++;
	}

	return i;
}

#pragma native(vdcwin_putat_string)

void vdcwin_putat_char_raw(VDCWin *win, char x, char y, char ch, char color)
{
	vdc_printc(win->sx + x, win->sy + y, ch, color);
}

#pragma native(vdcwin_putat_char_raw)

void vdcwin_putat_chars_raw(VDCWin *win, char x, char y, const char *chars, char num, char color)
{
	for (char i = 0; i < num; i++)
	{
		vdc_printc(win->sx + x + i, win->sy + y, chars[i], color);
	}
}

#pragma native(vdcwin_putat_chars_raw)

char vdcwin_putat_string_raw(VDCWin *win, char x, char y, const char *str, char color)
{
	char i = 0;
	while (char ch = str[i])
	{
		vdc_printc(win->sx + x + i, win->sy + y, ch, color);
		i++;
	}

	return i;
}

#pragma native(vdcwin_putat_string_raw)

char vdcwin_getat_char(VDCWin *win, char x, char y)
{
	unsigned sp = win->sp + vdc_coords(x, y);

	return s2p(vdc_mem_read_at(sp));
}

#pragma native(vdcwin_getat_char)

void vdcwin_getat_chars(VDCWin *win, char x, char y, char *chars, char num)
{
	unsigned sp = win->sp + vdc_coords(x, y);

	for (char i = 0; i < num; i++)
	{
		chars[i] = s2p(vdc_mem_read_at(sp + i));
	}
}

#pragma native(vdcwin_getat_chars)

char vdcwin_getat_char_raw(VDCWin *win, char x, char y)
{
	unsigned sp = win->sp + vdc_coords(x, y);

	return vdc_mem_read_at(sp);
}

#pragma native(vdcwin_getat_chars_raw)

void vdcwin_getat_chars_raw(VDCWin *win, char x, char y, char *chars, char num)
{
	unsigned sp = win->sp + vdc_coords(x, y);

	for (char i = 0; i < num; i++)
	{
		chars[i] = vdc_mem_read_at(sp + i);
	}
}

#pragma native(vdcwin_put_rect_raw)

void vdcwin_put_rect_raw(VDCWin *win, char x, char y, char w, char h, char cr, const char *chars, char color)
{
	int offset = vdc_coords(x, y);

	unsigned sp = win->sp + offset;
	unsigned cp = win->cp + offset;

	for (char i = 0; i < h; i++)
	{
		bnk_cpytovdc(sp, cr, chars, w);
		vdc_block_fill(cp, color, w);
		chars += w;
		sp += vdc_state.width;
		cp += vdc_state.width;
	}
}

#pragma native(vdcwin_put_rect)

void vdcwin_put_rect(VDCWin *win, char x, char y, char w, char h, char cr, const char *chars, char color)
{
	int offset = vdc_coords(x, y);

	unsigned sp = win->sp + offset;
	unsigned cp = win->cp + offset;

	for (char i = 0; i < h; i++)
	{

		for (char j = 0; j < w; j++)
		{
			vdc_mem_write_at(sp + j, p2s(bnk_readb(cr, chars + j)));
			vdc_mem_write_at(cp + j, color);
		}

		chars += w;
		sp += vdc_state.width;
		cp += vdc_state.width;
	}
}

#pragma native(vdcwin_get_rect_raw)

void vdcwin_get_rect_raw(VDCWin *win, char x, char y, char w, char h, char cr, char *chars)
{
	int offset = vdc_coords(x, y);

	unsigned sp = win->sp + offset;

	for (char i = 0; i < h; i++)
	{
		bnk_cpyfromvdc(cr, chars, sp, w);
		chars += w;
		sp += vdc_state.width;
	}
}

#pragma native(vdcwin_get_rect)

void vdcwin_get_rect(VDCWin *win, char x, char y, char w, char h, char cr, char *chars)
{
	int offset = vdc_coords(x, y);

	unsigned sp = win->sp + offset;

	for (char i = 0; i < h; i++)
	{

		for (char j = 0; j < w; j++)
		{
			bnk_writeb(chars + j, s2p(vdc_mem_read_at(sp + j)));
		}

		chars += w;
		sp += vdc_state.width;
	}
}

#pragma native(vdcwin_getat_chars_raw)

void vdcwin_insert_char(VDCWin *win)
{
	char y = win->wy - 1, rx = win->wx - 1;

	unsigned sp = win->sp + vdc_coords(0, y);
	unsigned cp = win->cp + vdc_coords(0, y);

	while (y > win->cy)
	{
		copy_bwd(sp + 1, sp, cp + 1, cp, rx);

		sp -= vdc_state.width;
		cp -= vdc_state.width;
		vdc_mem_write_at(sp + vdc_state.width, vdc_mem_read_at(sp + rx));
		vdc_mem_write_at(cp + vdc_state.width, vdc_mem_read_at(cp + rx));
		y--;
	}

	sp += win->cx;
	cp += win->cx;
	rx -= win->cx;

	copy_bwd(sp + 1, sp, cp + 1, cp, rx);

	vdc_mem_write_at(sp, ' ');
}

void vdcwin_delete_char(VDCWin *win)
{
	unsigned sp = win->sp + vdc_coords(0, win->cy);
	unsigned cp = win->cp + vdc_coords(0, win->cy);

	char x = win->cx, rx = win->wx - 1;

	copy_fwd(sp + x, sp + x + 1, cp + x, cp + x + 1, rx - x);

	char y = win->cy + 1;
	while (y < win->wy)
	{
		vdc_mem_write_at(sp + rx, vdc_mem_read_at(sp + vdc_state.width));
		vdc_mem_write_at(cp + rx, vdc_mem_read_at(cp + vdc_state.width));

		sp += vdc_state.width;
		cp += vdc_state.width;

		copy_fwd(sp, sp + 1, cp, cp + 1, rx);

		y++;
	}

	vdc_mem_write_at(sp + rx, ' ');
}

int vdcwin_getch(void)
{
	__asm
	{
		L1:
			jsr	0xffe4
			cmp	#0
			beq	L1
			sta	accu
			lda	#0
			sta	accu + 1
	}
}

int vdcwin_checkch(void)
{
	__asm
	{
		L1:
			jsr	0xffe4
			sta	accu
			lda	#0
			sta	accu + 1
	}
}

bool vdcwin_edit_char(VDCWin *win, char ch)
{
	switch (ch)
	{
	case 13:
	case 3:
		return true;

	case 19:
		win->cx = 0;
		win->cy = 0;
		return false;

	case 147:
		vdcwin_clear(win);
		win->cx = 0;
		win->cy = 0;
		return false;

	case 17:
		vdcwin_cursor_down(win);
		return false;

	case 145: // CRSR_UP
		vdcwin_cursor_up(win);
		return false;

	case 29:
		vdcwin_cursor_forward(win);
		return false;

	case 157:
		vdcwin_cursor_backward(win);
		return false;

	case 20:
		if (vdcwin_cursor_backward(win))
			vdcwin_delete_char(win);
		return false;

	default:
		if (ch >= 32 && ch < 128 || ch >= 160)
		{
			if (win->cy + 1 < win->wy || win->cx + 1 < win->wx)
			{
				vdcwin_insert_char(win);
				vdcwin_put_char(win, ch, 1);
			}
		}
		return false;
	}
}

char vdcwin_edit(VDCWin *win)
{
	for (;;)
	{
		vdcwin_cursor_show(win, true);
		char ch = vdcwin_getch();
		vdcwin_cursor_show(win, false);

		if (vdcwin_edit_char(win, ch))
			return ch;
	}
}

void vdcwin_scroll_left(VDCWin *win, char by)
{
	unsigned sp = win->sp;
	unsigned cp = win->cp;

	char rx = win->wx - by;

	for (char y = 0; y < win->wy; y++)
	{
		copy_fwd(sp, sp + by, cp, cp + by, rx);
		sp += vdc_state.width;
		cp += vdc_state.width;
	}
}

void vdcwin_scroll_right(VDCWin *win, char by)
{
	unsigned sp = win->sp;
	unsigned cp = win->cp;

	char rx = win->wx - by;

	for (char y = 0; y < win->wy; y++)
	{
		copy_bwd(sp + by, sp, cp + by, cp, rx);
		sp += vdc_state.width;
		cp += vdc_state.width;
	}
}

void vdcwin_scroll_up(VDCWin *win, char by)
{
	unsigned sp = win->sp;
	unsigned cp = win->cp;

	char rx = win->wx;
	int dst = vdc_state.width*by;

	for (char y = 0; y < win->wy - by; y++)
	{
		copy_fwd(sp, sp + dst, cp, cp + dst, rx);
		sp += vdc_state.width;
		cp += vdc_state.width;
	}
}

void vdcwin_scroll_down(VDCWin *win, char by)
{
	unsigned sp = win->sp + vdc_state.width*win->wy;
	unsigned cp = win->cp + vdc_state.width*win->wy;

	char rx = win->wx;

	int dst = vdc_state.width*by;

	for (char y = 0; y < win->wy - by; y++)
	{
		sp -= vdc_state.width;
		cp -= vdc_state.width;
		copy_fwd(sp, sp - dst, cp, cp - dst, rx);
	}
}

void vdcwin_fill_rect_raw(VDCWin *win, char x, char y, char w, char h, char ch, char color)
{
	if (w > 0)
	{
		for (char i = 0; i < h; i++)
		{
			vdc_hchar(win->sx+x,win->sy+y+i,ch,color,w);
		}
	}
}

void vdcwin_fill_rect(VDCWin *win, char x, char y, char w, char h, char ch, char color)
{
	vdcwin_fill_rect_raw(win, x, y, w, h, p2s(ch), color);
}
