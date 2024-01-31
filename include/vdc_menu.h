#ifndef VDC_MENU_H
#define VDC_MENU_H

#include <c128/vdc.h>
#include "vdc_core.h"
#include "vdc_win.h"
#include "defines.h"

// Define
// Set these for menubar and pulldown menu dimensions
#define VDC_MENUBAR_MAXOPTIONS 5  // Number of options in main menu bar
#define VDC_MENUBAR_MAXLENGTH 9   // Maxiumum length of main menu bar option names
#define VDC_PULLDOWN_NUMBER 7     // Number of pull down menus defined
#define VDC_PULLDOWN_MAXOPTIONS 6 // Maximum number of options for pull down meus
#define VDC_PULLDOWN_MAXLENGTH 17 // Maximum length of pull down menu option names

// Set default colours and styles to use
#define VDC_MENUBAR_HEADERCOL VDC_LGREEN + VDC_A_ALTCHAR + VDC_A_REVERSE   // Header bar color
#define VDC_MENUBAR_BARCOL VDC_DGREEN + VDC_A_ALTCHAR + VDC_A_REVERSE      // Menu bar color
#define VDC_MENUBAR_HIGHLLIGHT VDC_WHITE + VDC_A_ALTCHAR + VDC_A_REVERSE   // Menu bar color of selected option
#define VDC_PULLDOWN_SELECTCOL VDC_LYELLOW + VDC_A_ALTCHAR + VDC_A_REVERSE // Pull down color of selected option
#define VDC_PULLDOWN_NORMALCOL VDC_DCYAN + VDC_A_ALTCHAR + VDC_A_REVERSE   // Pull down color of not selected option
#define VDC_PULLDOWN_BORFULL WIN_BOR_ALL                                   // Set borderstyle for separate pulldown
#define VDC_PULLDOWN_BORTOP WIN_BOR_NOTOP                                  // Set borderstyle for main menu pulldowns
#define VDC_PULLDOWN_SELECTCH CH_MINUS                                     // Set char before selected option
#define VDC_POPUP_COLOR VDC_LYELLOW + VDC_A_ALTCHAR                        // Set pop-up window default attributes
#define VDC_POPUP_BORDER WIN_BOR_ALL                                       // Default pop-up border style
#define VDC_MENU_YESNO 5                                                   // Number for Yes No pull down menu

// Function prototypes
void menu_placeheader(const char *header);
void menu_placebar(char y);
void menu_placetop(const char *header);
char menu_pulldown(char xpos, char ypos, char menunumber, unsigned char escapable);
char menu_main();
char menu_areyousure(const char *message);
void menu_fileerrormessage();
void menu_messagepopup(const char *message);

// Variables
struct VDCMenuBar
{
    char titles[VDC_MENUBAR_MAXOPTIONS][VDC_MENUBAR_MAXLENGTH];
    char xstart[VDC_MENUBAR_MAXOPTIONS];
    char ypos;
};
extern struct VDCMenuBar menubar;
extern char pulldown_options[VDC_PULLDOWN_NUMBER];
extern char pulldown_titles[VDC_PULLDOWN_NUMBER][VDC_PULLDOWN_MAXOPTIONS][VDC_PULLDOWN_MAXLENGTH];

#pragma compile("vdc_menu.c")

#endif