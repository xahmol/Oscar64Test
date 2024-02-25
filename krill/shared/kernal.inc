
.ifndef _KERNAL_INC_
_KERNAL_INC_ = 1

DEVICE_SCREEN                          = $03

.if .defined(PLATFORM) & (PLATFORM = 128)

BANK                                   = $02
PC                                     = $03
S_REG                                  = $05
A_REG                                  = $06
X_REG                                  = $07
Y_REG                                  = $08
TEMPST                                 = $1b; temporary string descriptor stack
 TEMPST_LEN                            = 0
 TEMPST_PTR                            = 1
INDEX1                                 = $24; utility pointer area
VARTAB                                 = $2f; start of BASIC variables
FRETOP                                 = $35; pointer: bottom of string storage
FACEXP                                 = $63; FAC exponent
FACHO                                  = $64; FAC mantissa

.else

INDEX1                                 = $22; utility pointer area
VARTAB                                 = $2d; start of BASIC variables
FRETOP                                 = $33; pointer: bottom of string storage
FRESPC                                 = $35; utility string pointer
FACEXP                                 = $61; FAC exponent
FACHO                                  = $62; FAC mantissa
STRDSC                                 = $64; temporary string descriptor
 STRDSC_LEN                            = 0
 STRDSC_PTR                            = 1
FACSGN                                 = $66; FAC sign

.endif

STATUS                                 = $90
VERCK                                  = $93

CINV                                   = $0314
CBINV                                  = $0316

C3PO                                   = $94; serial bus output char buffered flag
BSOUR                                  = $95; char buffer for serial bus

.if .defined(PLATFORM) & (PLATFORM = 16)

KERNAL_ROM                             = $8000
KERNAL_ROM_SIZE                        = $8000

LDTND                                  = $97; logical file index/open files count
DFLTN                                  = $98; default input device
DFLTO                                  = $99; default output device
MSGFLG                                 = $9a
EAL                                    = $9d; end address lo
EAH                                    = $9e; end address hi
R2D2                                   = $a6; serial bus EOI flag
BSOUR1                                 = $a8; serial bus shift counter
COUNT                                  = $aa; serial bus counter
FNLEN                                  = $ab; length of current file name
LA                                     = $ac; logical file number
SA                                     = $ad; current secondary address
FA                                     = $ae; current I/O device
FNADR                                  = $af; current file name
MEMUSS                                 = $b4; load ram base
PNT                                    = $c8; current screen line address
PNTR                                   = $ca; cursor column on current line
QTSW                                   = $cb; quote switch
USE4DY                                 = $f9

IBASIN                                 = $0322; CHRIN vector
IBSOUT                                 = $0324; CHROUT vector
ILOAD                                  = $032e; LOAD vector

COLOR                                  = $053b

PALETTE                                = $07f9
PALETTE_DEFAULT                        = $ff
PALETTE_USER                           = $00

CLRSCR                                 = $d88b
NOEOI                                  = $e19f; send byte on serial bus
CHECKPARALLEL                          = $eda9; check if drive is parallel
LUKING                                 = $f160
LODING                                 = $f189
ERROR9                                 = $f28b
NLOAD                                  = $f04a
KPREND                                 = $fcc3; restore registers and return from IRQ handler

.else; !(.defined(PLATFORM) & (PLATFORM = 16))

KERNAL_ROM                             = $e000
KERNAL_ROM_SIZE                        = $2000

LDTND                                  = $98; logical file index/open files count
DFLTN                                  = $99; default input device
DFLTO                                  = $9a; default output device
MSGFLG                                 = $9d
R2D2                                   = $a3; serial bus EOI flag
BSOUR1                                 = $a4; serial bus shift counter
COUNT                                  = $a5; serial bus counter
EAL                                    = $ae; end address lo
EAH                                    = $af; end address hi
FNLEN                                  = $b7; length of current file name
LA                                     = $b8; logical file number
SA                                     = $b9; current secondary address
FA                                     = $ba; current I/O device
FNADR                                  = $bb; current file name
STAL                                   = $c1; start address lo
STAH                                   = $c2; start address hi
MEMUSS                                 = $c3; load ram base

    .if .defined(PLATFORM) & (PLATFORM = 128)
FNBANK                                 = $c7; filename bank
MODE                                   = $d7
PNT                                    = $e0; current screen line address
USER                                   = $e2; current screen line colour address
PNTR                                   = $ec; cursor column on current line
COLOR                                  = $f1
QTSW                                   = $f4; quote switch
BUF                                    = $0200; BASIC and monitor input buffer
PALNTS                                 = $0a03; 0: NTSC, 1: PAL
ENABL                                  = $0a0f; RS232 activity flags
SERIAL                                 = $0a1c
BLNON                                  = $0a26; on/off blink flag
BLNSW                                  = $0a27; cursor blink enable
BLNCT                                  = $0a28; count to toggle cursor
GDBLN                                  = $0a29; char under cursor
GDCOL                                  = $0a2a; original colour under cursor
VM1                                    = $0a2c; VIC text screen and character base ($d018 shadow)
    .else; !(.defined(PLATFORM) & (PLATFORM = 128))
BLNSW                                  = $cc; cursor blink enable
BLNCT                                  = $cd; count to toggle cursor
GDBLN                                  = $ce; char under cursor
BLNON                                  = $cf; on/off blink flag
PNT                                    = $d1; current screen line address
PNTR                                   = $d3; cursor column on current line
QTSW                                   = $d4; quote switch
LDTB1                                  = $d9
USER                                   = $f3; current screen line colour address

COLOR                                  = $0286
GDCOL                                  = $0287; original colour under cursor
ENABL                                  = $02a1; RS232 activity flags
PALNTS                                 = $02a6; 0: NTSC, 1: PAL
    .endif; !(.defined(PLATFORM) & (PLATFORM = 128))

NMINV                                  = $0318
IOPEN                                  = $031a
ICLOSE                                 = $031c
ICHKIN                                 = $031e
ICHKOUT                                = $0320
ICLRCH                                 = $0322
IBASIN                                 = $0324
IBSOUT                                 = $0326
ISTOP                                  = $0328
IGETIN                                 = $032a
ICLALL                                 = $032c
USRCMD                                 = $032e
ILOAD                                  = $0330
ISAVE                                  = $0332

    .if .defined(PLATFORM) & (PLATFORM = 128)
PRINT                                  = $c72d
CURSORON                               = $cb21
DSPP                                   = $cc34; reset cursor blink count, set colour pointer, put a char on the screen
NOEOI                                  = $e3ae; send byte on serial bus
LUKING                                 = $f50f
LODING                                 = $f533
ERROR9                                 = $f694
SETBANK                                = $f73f
KPREND                                 = $ff33; restore registers and return from IRQ handler
SWAPPER                                = $ff5f
JSRFAR                                 = $ff6e
FETCH                                  = $ff74
    .else; !(.defined(PLATFORM) & (PLATFORM = 128))
POLYX                                  = $e059
CLRSCR                                 = $e544
DSPP                                   = $ea13; reset cursor blink count, set colour pointer, put a char on the screen
DSPP2                                  = $ea1c; put a char on the screen
SCOLOR                                 = $ea24; synchronise colour pointer
KEY                                    = $ea31; keyboard/cursor handler
KPREND                                 = $ea7e; ack timer, restore registers and return from IRQ handler
ROWSLO                                 = $ecf0
NOEOI                                  = $ed5a; send byte on serial bus
NLOAD                                  = $f4a5
LUKING                                 = $f5af
LODING                                 = $f5d2
ERROR9                                 = $f713
    .endif; !(.defined(PLATFORM) & (PLATFORM = 128))

.endif; !(.defined(PLATFORM) & (PLATFORM = 16))


SECND                                  = $ff93
 SA_LISTEN                             = $20
 SA_UNLISTEN                           = $3f
 SA_TALK                               = $40
 SA_UNTALK                             = $5f
 SA_OPENCHANNEL                        = $60
 SA_CLOSE                              = $e0
 SA_OPEN                               = $f0
TKSA                                   = $ff96
ACPTR                                  = $ffa5
CIOUT                                  = $ffa8
UNTLK                                  = $ffab
UNLSN                                  = $ffae
LISTN                                  = $ffb1
TALK                                   = $ffb4
READSS                                 = $ffb7
 KERNAL_STATUS_EOF                     = %01000000
 KERNAL_STATUS_EOF_BURST               = %00011111
 KERNAL_STATUS_ERROR_BURST             = %00000010; >= 2
SETLFS                                 = $ffba
 COMMAND_ERROR_CHANNEL                 = $0f
SETNAM                                 = $ffbd
OPEN                                   = $ffc0
 OPEN_TOOMANYFILES                     = $01
 OPEN_FILEOPEN                         = $02
 OPEN_FILENOTOPEN                      = $03
 OPEN_FILENOTFOUND                     = $04
 OPEN_DEVICENOTPRESENT                 = $05
 OPEN_NOTINPUTFILE                     = $06
 OPEN_NOTOUTPUTFILE                    = $07
 OPEN_MISSINGFILENAME                  = $08
 OPEN_ILLEGALDEVICENUMBER              = $09
CLOSE                                  = $ffc3
CHKIN                                  = $ffc6
CKOUT                                  = $ffc9
CLRCH                                  = $ffcc
BASIN                                  = $ffcf
BSOUT                                  = $ffd2
LOAD                                   = $ffd5
SAVE                                   = $ffd8
CLALL                                  = $ffe7

.endif; !_KERNAL_INC_
