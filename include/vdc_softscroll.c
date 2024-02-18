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