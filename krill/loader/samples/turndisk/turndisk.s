
.include "standard.inc"

.include "loader.inc"

.if PLATFORM = diskio::platform::COMMODORE_16
    .include "ted.inc"
.else
    .include "vic.inc"
.endif


screen     = $5800
bitmap     = $6000

one_bits   = COLOUR_DARKGREY
zero_bits  = COLOUR_MEDIUMGREY


            MEMSET #bitmap, #BITMAP_SIZE, #BITMAP_BACKGROUND

.if PLATFORM = diskio::platform::COMMODORE_16
            lda #$00   ; disable all interrupts,
            sta TED_IMR; as KERNAL routines do cli
            lda TED_IRR; with LOAD_VIA_KERNAL_FALLBACK
            sta TED_IRR

            MEMSET #screen, #SCREEN_SIZE, #MAKE_HIRES_INTENSITIES(one_bits, zero_bits)
            MEMSET #screen + PAD(SCREEN_SIZE), #SCREEN_SIZE, #MAKE_HIRES_COLOURS(one_bits, zero_bits)
.else
    .if PLATFORM = diskio::platform::COMMODORE_128
            lda #IO_PORT_CHARGEN_DISABLED
            sta IO_PORT
            lda #NO_INTERRUPTS
            sta VIC2_IMR
    .endif
            lda #CIA_CLR_INTF | EVERY_IRQ; disable KERNAL timer interrupts
            sta CIA1_ICR
            bit CIA1_ICR

            MEMSET #screen, #SCREEN_SIZE, #MAKE_HIRES_COLOURS(one_bits, zero_bits)
.endif
            DISPLAY_HIRES_BITMAP bitmap, screen

            lda #COLOUR_BLACK
            sta BORDERCOLOUR

            LOADER_INSTALL
            bcs error

.if FILE_EXISTS_API

side1file:  FILEEXISTS filename1; filename1 exists only on the first side
            bcc :+; branch on success
            cmp #diskio::status::FILE_NOT_FOUND
            bne error
            inc BORDERCOLOUR
            jmp side1file
:
            LOADRAW filename1; filename1 is only found on the first side
            bcs error

side2file:  FILEEXISTS filename2; filename2 exists only on the second side
            bcc :+; branch on success
            cmp #diskio::status::FILE_NOT_FOUND
            bne error
            dec BORDERCOLOUR
            jmp side2file
:
            LOADRAW filename2; filename2 is only found on the second side
            bcc side1file
            bcs error; jmp

.else; !FILE_EXISTS_API

side1file:  LOADRAW filename1; filename1 is only found on the first side
            bcc side2file; branch on success
            cmp #diskio::status::FILE_NOT_FOUND
            bne error

            inc BORDERCOLOUR
            jmp side1file

side2file:  LOADRAW filename2; filename2 is only found on the second side
            bcc side1file; branch on success
            cmp #diskio::status::FILE_NOT_FOUND
            bne error

            dec BORDERCOLOUR
            jmp side2file

.endif; FILE_EXISTS_API

error:      ldx #COLOUR_BLACK
:           sta BORDERCOLOUR
            stx BORDERCOLOUR
            jmp :-

filename1:  .asciiz "pic1"
filename2:  .asciiz "pic2"
