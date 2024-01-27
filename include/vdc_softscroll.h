#ifndef VDC_SOFTSCROLL_H
#define VDC_SOFTSCROL_H

// Function prototypes
char vdc_softscroll_init(struct VDCSoftScrollSettings *settings , char mode);
void vdc_softscroll_exit(struct VDCSoftScrollSettings *settings, char mode);
void vdc_softscroll_down(struct VDCSoftScrollSettings *settings, char step);
void vdc_softscroll_up(struct VDCSoftScrollSettings *settings, char step);
void vdc_softscroll_right(struct VDCSoftScrollSettings *settings, char step);
void vdc_softscroll_left(struct VDCSoftScrollSettings *settings, char step);

// Variables
struct VDCSoftScrollSettings {
    char cr;
    char* source;
    char width;
    char height;
    unsigned addr_offset;
    char vscroll;
    char hscroll;
    char vscroll_base;
    char hscroll_base;
    char xoff;
    char yoff;
    char hscroll_def;
};

#pragma compile("vdc_softscroll.c")

#endif