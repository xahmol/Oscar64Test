#include <stdbool.h>
#include <petscii.h>
#include <c64/kernalio.h>
#include <c128/vdc.h>
#include "vdc_win.h"
#include "vdc_core.h"
#include "banking.h"
#include "vdc_menu.h"

struct VDCMenuBar menubar = {
    {"Settings", "Windows", "Viewport", "Scroll", "Charset", "Music"},
    {0, 0, 0, 0, 0, 0},
    1};

char pulldown_options[VDC_PULLDOWN_NUMBER] = {3, 2, 2, 2, 1, 4, 2, 6};
char pulldown_titles[VDC_PULLDOWN_NUMBER][VDC_PULLDOWN_MAXOPTIONS][VDC_PULLDOWN_MAXLENGTH] = {
    {"Screenmode",
     "Info      ",
     "Exit      "},
    {"Window on window",
     "Text entry      "},
    {"Screen 1",
     "Screen 2"},
    {"Fullscreen 1",
     "Fullscreen 2"},
    {"Charset demo"},
    {"Ultimate Axel F",
     "Faded          ",
     "Stop music     ",
     "Restart music  "},
    {"Yes",
     "No "},
    {"PAL  80x25",
     "PAL  80x50",
     "PAL  80x70",
     "NTSC 80x25",
     "NTSC 80x50",
     "NTSC 80x60"}};

void menu_placeheader(const char *header)
// Print header title
{
    vdc_hchar(0, 0, C_SPACE, VDC_MENUBAR_HEADERCOL, 80);
    vdc_prints_attr(0, 0, header, VDC_MENUBAR_HEADERCOL);
}

void menu_placebar(char y)
// Place main meny bar at given line ycoord
{
    char xcoord = 1;
    char len;

    menubar.ypos = y;

    vdc_hchar(0, y, C_SPACE, VDC_MENUBAR_BARCOL, 80);

    for (char i = 0; i < VDC_MENUBAR_MAXOPTIONS; i++)
    {
        len = strlen(menubar.titles[i]);
        if (xcoord + len > vdc_state.width - 1)
        {
            xcoord = vdc_state.width - 1 - len;
        }
        vdc_prints_attr(xcoord, y, menubar.titles[i], VDC_MENUBAR_BARCOL);
        menubar.xstart[i] = xcoord;
        xcoord += len + 1;
    }
}

void menu_placetop(const char *header)
// Place both header and menubar at lines 0 and 1
{
    vdc_cls();
    menu_placeheader(header);
    menu_placebar(1);
}

char menu_pulldown(char xpos, char ypos, char menunumber, unsigned char escapable)
/* Function for pull down menu
   Input:
   - xpos = x-coordinate of upper left corner
   - ypos = y-coordinate of upper left corner
   - menunumber =
     number of the menu as defined in pulldownmenuoptions array
   - espacable: ability to escape with escape key enabled (1) or not (0)  */

{
    char x;
    char key;
    char exit = 0;
    char menuchoice = 1;
    char width = strlen(pulldown_titles[menunumber][0]) + 2;
    char height = pulldown_options[menunumber];
    char topmenu = (menunumber > VDC_MENUBAR_MAXOPTIONS - 1) ? 0 : 1;
    char border = topmenu ? VDC_PULLDOWN_BORTOP : VDC_PULLDOWN_BORFULL;

    vdcwin_win_new(border, xpos, ypos, width, height);

    for (x = 0; x < height; x++)
    {
        sprintf(linebuffer, " %s ", pulldown_titles[menunumber][x]);
        vdc_prints_attr(xpos, ypos + x, linebuffer, VDC_PULLDOWN_NORMALCOL);
    }

    do
    {
        sprintf(linebuffer, "%c%s ", VDC_PULLDOWN_SELECTCH, pulldown_titles[menunumber][menuchoice - 1]);
        vdc_prints_attr(xpos, ypos + menuchoice - 1, linebuffer, VDC_PULLDOWN_SELECTCOL);

        do
        {
            key = vdcwin_getch();
        } while (key != CH_ENTER && key != CH_CURS_LEFT && key != CH_CURS_RIGHT && key != CH_CURS_UP && key != CH_CURS_DOWN && key != CH_ESC && key != CH_STOP);

        switch (key)
        {
        case CH_ESC:
        case CH_STOP:
            if (escapable == 1)
            {
                exit = 1;
                menuchoice = 0;
            }
            break;

        case CH_ENTER:
            exit = 1;
            break;

        case CH_CURS_LEFT:
            if (topmenu)
            {
                exit = 1;
                menuchoice = 18;
            }
            break;

        case CH_CURS_RIGHT:
            if (topmenu)
            {
                exit = 1;
                menuchoice = 19;
            }
            break;

        case CH_CURS_DOWN:
        case CH_CURS_UP:
            sprintf(linebuffer, " %s ", pulldown_titles[menunumber][menuchoice - 1]);
            vdc_prints_attr(xpos, ypos + menuchoice - 1, linebuffer, VDC_PULLDOWN_NORMALCOL);
            if (key == CH_CURS_UP)
            {
                menuchoice--;
                if (menuchoice < 1)
                {
                    menuchoice = height;
                }
            }
            else
            {
                menuchoice++;
                if (menuchoice > height)
                {
                    menuchoice = 1;
                }
            }
            break;

        default:
            break;
        }
    } while (exit == 0);

    vdcwin_win_free();

    return menuchoice;
}

char menu_main()
{
    /* Function for main menu selection */

    unsigned char menubarchoice = 1;
    unsigned char menuoptionchoice = 0;
    unsigned char key;
    unsigned char xpos;

    menu_placebar(menubar.ypos);

    do
    {
        do
        {
            vdc_prints_attr(menubar.xstart[menubarchoice - 1], menubar.ypos, menubar.titles[menubarchoice - 1], VDC_MENUBAR_HIGHLLIGHT);

            do
            {
                key = vdcwin_getch();
            } while (key != CH_ENTER && key != CH_CURS_LEFT && key != CH_CURS_RIGHT && key != CH_ESC && key != CH_STOP);

            vdc_prints_attr(menubar.xstart[menubarchoice - 1], menubar.ypos, menubar.titles[menubarchoice - 1], VDC_MENUBAR_BARCOL);

            if (key == CH_CURS_LEFT)
            {
                menubarchoice--;
                if (menubarchoice < 1)
                {
                    menubarchoice = VDC_MENUBAR_MAXOPTIONS;
                }
            }
            else if (key == CH_CURS_RIGHT)
            {
                menubarchoice++;
                if (menubarchoice > VDC_MENUBAR_MAXOPTIONS)
                {
                    menubarchoice = 1;
                }
            }
        } while (key != CH_ENTER && key != CH_ESC && key != CH_STOP);
        if (key != CH_ESC && key != CH_STOP)
        {
            xpos = menubar.xstart[menubarchoice - 1];
            menuoptionchoice = menu_pulldown(xpos, menubar.ypos + 1, menubarchoice - 1, 1);
            if (menuoptionchoice == 18)
            {
                menuoptionchoice = 0;
                menubarchoice--;
                if (menubarchoice < 1)
                {
                    menubarchoice = VDC_MENUBAR_MAXOPTIONS;
                }
            }
            if (menuoptionchoice == 19)
            {
                menuoptionchoice = 0;
                menubarchoice++;
                if (menubarchoice > VDC_MENUBAR_MAXOPTIONS)
                {
                    menubarchoice = 1;
                }
            }
        }
        else
        {
            menuoptionchoice = 99;
        }
    } while (menuoptionchoice == 0);

    return menubarchoice * 10 + menuoptionchoice;
}

char menu_areyousure(const char *message)
// Pull down menu to verify if player is sure
{
    char choice;
    char old_attr = vdc_state.text_attr;

    vdc_state.text_attr = VDC_POPUP_COLOR;

    vdcwin_win_new(VDC_POPUP_BORDER, 8, 8, 30, 6);
    vdc_prints(10, 9, message);
    vdc_prints(10, 10, "Are you sure?");
    choice = menu_pulldown(25, 11, VDC_MENU_YESNO, 0);
    vdcwin_win_free();

    vdc_state.text_attr = old_attr;

    return choice;
}

void menu_fileerrormessage()
// Show message for file error encountered
{
    char old_attr = vdc_state.text_attr;

    vdc_state.text_attr = VDC_POPUP_COLOR;
    vdcwin_win_new(VDC_POPUP_BORDER, 8, 8, 30, 6);

    vdc_prints(10, 9, "File error!");

    sprintf(linebuffer, "Error nr.: %2X", krnio_pstatus[1]);
    vdc_prints(10, 11, linebuffer);

    vdc_prints(10, 13, "Press key.");
    vdcwin_getch();

    vdcwin_win_free();
    vdc_state.text_attr = old_attr;
}

void menu_messagepopup(const char *message)
// Show popup with a message
{
    char old_attr = vdc_state.text_attr;

    vdc_state.text_attr = VDC_POPUP_COLOR;
    vdcwin_win_new(VDC_POPUP_BORDER, 8, 8, 30, 6);

    vdc_prints(10, 9, message);

    vdc_prints(10, 11, "Press key.");
    vdcwin_getch();

    vdcwin_win_free();
    vdc_state.text_attr = old_attr;
}