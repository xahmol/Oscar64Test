/*
Oscar64 VDC function library

Written in 2024 by Xander Mol

https://github.com/xahmol/Oscar64Test

https://www.idreamtin8bits.com/

Code and resources from others used:

-   Oscar64 cross compiler

    https://github.com/drmortalwombat/oscar64

    Many thanks also to https://github.com/drmortalwombat to provide extrordinary support and tips for making this and adapting Oscar64 to my needs faster than I could ask it.

-   Screens used in the demo made with my own VDC Screen Editor.

    https://github.com/xahmol/VDCScreenEdit

-   Commodore logo charset created using CharPad Pro.

    https://subchristsoftware.itch.io/c64-pro-editions

-   C128 Programmers Reference Guide: For the basic VDC register routines and VDC code inspiration

    http://www.zimmers.net/anonftp/pub/cbm/manuals/c128/C128_Programmers_Reference_Guide.pdf

-   Tokra: For the optimal VDC registry settings for 80x50 and 80x70 textmodes

-   Scott Hutter - VDC Core functions inspiration:

    https://github.com/Commodore64128/vdc_gui/blob/master/src/vdc_core.c

    (used as starting point)

-   Scott Robison for teaching me how o create a C128 disk boot sector

-   Francesco Sblendorio - Screen Utility: used for inspiration:

    https://github.com/xlar54/ultimateii-dos-lib/blob/master/src/samples/screen_utility.c

-   DevDef: Commodore 128 Assembly - Part 3: The 80-column (8563) chip

    https://devdef.blogspot.com/2018/03/commodore-128-assembly-part-3-80-column.html

-   Tips and Tricks for C128: VDC

    http://commodore128.mirkosoft.sk/vdc.html

-   Steve Goldsmith - C3L Commodore 128 CP/M C Library

    https://github.com/sgjava/c3l

    (Used for inspiration and for the text wrap and random sentence generator functions)

-   Bart van Leeuwen: For inspiration and advice while coding. Also for providing the excellent Device Manager ROM to make testing on real hardware very easy

-   Original windowing system code on Commodore 128 by unknown author.
   
-   Tested using real hardware (C128D and C128DCR) plus VICE.

The code can be used freely as long as you retain a notice describing original source and author.

THE PROGRAMS ARE DISTRIBUTED IN THE HOPE THAT THEY WILL BE USEFUL, BUT WITHOUT ANY WARRANTY. USE THEM AT YOUR OWN RISK!
*/

#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <petscii.h>
#include <c128/vdc.h>
#include "vdc_core.h"
#include "banking.h"
#include "vdc_softscroll.h"

char vdc_softscroll_init(struct VDCSoftScrollSettings *settings, char mode)
// Initialisize virtual screen for softscroll. Returns 1 on succes, 0 in fail
{
    unsigned vdcsize = settings->width * settings->height;
    unsigned sourcesize = vdcsize + vdcsize + 48;

    // Return if virtual screen is too big to leave room for charsets
    if ((sourcesize > 8192 && !vdc_state.memextended) || (sourcesize > 57344))
    {
        return 0;
    }

    vdc_set_mode(mode);

    // Set up new vdc state
    vdc_state.base_text = 0x2000;
    vdc_state.base_attr = 0x2000 + vdcsize;
    vdc_state.char_std = 0x0000;
    vdc_state.char_alt = 0x1000;
    vdc_state.disp_skip = settings->width - vdc_state.width;
    vdc_set_multab();

    // Set up virtual sceen and copy contents to it
    vdc_cls();
    vdc_set_charset_address(vdc_state.char_std);
    vdc_restore_charsets();
    vdc_set_disp_address(vdc_state.base_text, vdc_state.base_attr);
    vdc_reg_write(VDCR_ROWINC, vdc_state.disp_skip);
    bnk_cpytovdc(vdc_state.base_text, settings->cr, settings->source, vdcsize);
    bnk_cpytovdc(vdc_state.base_attr, settings->cr, settings->source + vdcsize + 48, vdcsize);

    // Init scroll settings
    settings->addr_offset = 0;
    settings->hscroll = 0;
    settings->vscroll = 0;
    settings->vscroll_base = vdc_reg_read(VDCR_VSCROLL) & 0xf0;
    settings->hscroll_def = vdc_reg_read(VDCR_HSCROLL) & 0x0f;
    settings->hscroll_base = vdc_reg_read(VDCR_HSCROLL) & 0xf0;
    settings->xoff = 0;
    settings->yoff = 0;
    return 1;
}

void vdc_softscroll_exit(struct VDCSoftScrollSettings *settings, char mode)
// Exit soft scroll virtual screen
{
    vdc_cls();
    vdc_reg_write(VDCR_ROWINC, 0);
    vdc_reg_write(VDCR_VSCROLL, settings->vscroll_base);
    vdc_reg_write(VDCR_HSCROLL, settings->hscroll_base + settings->hscroll_def);
    vdc_set_mode(mode);
}

void vdc_softscroll_down(struct VDCSoftScrollSettings *settings, char step)
// Do a soft scroll down
{
    vdc_pass_vblank();

    settings->vscroll += step;
    if (settings->vscroll > 8 - step)
    {
        if (settings->yoff < settings->height - vdc_state.height - 1)
        {
            settings->vscroll = 0;
            settings->yoff++;
            settings->addr_offset += settings->width;
            vdc_reg_write(VDCR_VSCROLL, settings->vscroll_base);
            vdc_set_disp_address(vdc_state.base_text + settings->addr_offset, vdc_state.base_attr + settings->addr_offset);
        }
        else
        {
            settings->vscroll -= step;
        }
    }
    else
    {
        vdc_reg_write(VDCR_VSCROLL, settings->vscroll_base + settings->vscroll);
    }
}

void vdc_softscroll_up(struct VDCSoftScrollSettings *settings, char step)
// Do a soft scroll up
{
    vdc_pass_vblank();
    if (settings->vscroll > step - 1)
    {
        settings->vscroll -= step;
        vdc_reg_write(VDCR_VSCROLL, settings->vscroll_base + settings->vscroll);
    }
    else
    {
        if (settings->yoff)
        {
            settings->vscroll = 8 - step;
            settings->yoff--;
            settings->addr_offset -= settings->width;
            vdc_wait_no_vblank();
            vdc_reg_write(VDCR_VSCROLL, settings->vscroll_base + settings->vscroll);
            vdc_set_disp_address(vdc_state.base_text + settings->addr_offset, vdc_state.base_attr + settings->addr_offset);
        }
    }
}

void vdc_softscroll_right(struct VDCSoftScrollSettings *settings, char step)
// Do a soft scroll right
{
    if (settings->hscroll > step - 1)
    {
        settings->hscroll -= step;
        vdc_wait_vblank();
        vdc_reg_write(VDCR_HSCROLL, settings->hscroll_base + settings->hscroll);
    }
    else
    {
        if ((settings->xoff + 1) < settings->width - vdc_state.width)
        {
            settings->hscroll = 8 - step + settings->hscroll_def % step;
            settings->xoff++;
            settings->addr_offset++;
            vdc_wait_no_vblank();
            vdc_set_disp_address(vdc_state.base_text + settings->addr_offset, vdc_state.base_attr + settings->addr_offset);
            vdc_wait_vblank();
            vdc_reg_write(VDCR_HSCROLL, settings->hscroll_base + settings->hscroll);
        }
    }
}

void vdc_softscroll_left(struct VDCSoftScrollSettings *settings, char step)
// Do a soft scroll left
{
    settings->hscroll += step;
    if (settings->hscroll > 8 - step)
    {
        if (settings->xoff)
        {
            settings->hscroll = settings->hscroll_def % step;
            settings->xoff--;
            settings->addr_offset--;
            vdc_wait_no_vblank();
            vdc_set_disp_address(vdc_state.base_text + settings->addr_offset, vdc_state.base_attr + settings->addr_offset);
            vdc_pass_vblank();
            vdc_reg_write(VDCR_HSCROLL, settings->hscroll_base);
        }
        else
        {
            settings->hscroll = settings->hscroll_def;
            vdc_reg_write(VDCR_HSCROLL, settings->hscroll_base + settings->hscroll);
        }
    }
    else
    {
        vdc_reg_write(VDCR_HSCROLL, settings->hscroll_base + settings->hscroll);
    }
}