
TEST_SAVE               = 0
TEST_INVALID_PARAMETERS = 0
TEST_BUS_LOCK           = 0
NO_SPRITES_OR_IRQ       = 0
VERIFY                  = 0; verify correct loading by loading twice and comparing
PAUSE_BETWEEN_LOADS     = 0; delay value
INSTALL_ONLY            = 0
KEY_FOR_WATCHDOG        = 0
LITTLE_CPU_FOR_LOADER   = 0

COUPLED_TIMERS          = NO_SPRITES_OR_IRQ; Plus/4: As TED timer emulation is horribly broken on VICE, only use coupled
                                           ;         timers if there is no other way to measure more than 64K cycles
.include "standard.inc"

.include "../include/loader.inc"; includes config.inc

.if !((DIRTRACK = 18) | (DIRTRACK = 17))
    .error "The test application only supports DIRTRACK = 18 or DIRTRACK = 17"
.endif
.if !((DIRTRACK81 = 40) | (DIRTRACK81 = 39))
    .error "The test application only supports DIRTRACK81 = 40 or DIRTRACK81 = 39"
.endif

.include "../version.inc"
.include "datetime.inc"

.include "cpu.inc"
.if PLATFORM = diskio::platform::COMMODORE_16
    .include "pio.inc"
    .include "ted.inc"
.else
    .include "cia.inc"
    .include "vic.inc"
.endif

.if PLATFORM = diskio::platform::COMMODORE_128
    .include "mmu.inc"
    .include "vdc.inc"
.endif

.include "float.inc"
.include "basic.inc"
.include "kernal.inc"

.macpack cbm
.macpack longbranch

.segment "ZEROPAGE" : zeropage

.if PLATFORM = diskio::platform::COMMODORE_16
IRQSLACK = $03; 0: NTSC
.else
IRQSLACK = $a8; RS232 Input Bit count/Tape temporary
.endif

POINTERS:              .res 6

IRQ_SLACK                          = $00
KERNAL_FALLBACK_IRQ_SLACK_PARALLEL = $00
KERNAL_FALLBACK_IRQ_SLACK_BURST    = $30
.if PLATFORM = diskio::platform::COMMODORE_128
KERNAL_FALLBACK_IRQ_SLACK_SERIAL   = $37
.else
KERNAL_FALLBACK_IRQ_SLACK_SERIAL   = $1f
.endif


LOAD_TO_UPPER_MEM = LOAD_UNDER_D000_DFFF; on C-16/+4, himem is $8000..$fcff, but it can be loaded to regardless of this setting

.if LOAD_TO_UPPER_MEM

.segment "BITMAPHI"
.import __BITMAPHI_LOAD__
BITMAP = __BITMAPHI_LOAD__

    .if PLATFORM = diskio::platform::COMMODORE_16
.segment "COLRAM"
.import __COLRAM_LOAD__
COLRAM = __COLRAM_LOAD__
    .else
.segment "COLRAMHI"
.import __COLRAMHI_LOAD__
COLRAM = __COLRAMHI_LOAD__
    .endif

.else; !LOAD_TO_UPPER_MEM

.segment "BITMAP"
.import __BITMAP_LOAD__
BITMAP = __BITMAP_LOAD__

.segment "COLRAM"
.import __COLRAM_LOAD__
COLRAM = __COLRAM_LOAD__

.endif

.if PLATFORM <> diskio::platform::COMMODORE_16
.segment "SPRITES"
.import __SPRITES_LOAD__
SPRITES = __SPRITES_LOAD__

    .if LOAD_TO_UPPER_MEM
SPRITESCR = SPRITES + $0400
    .else
SPRITESCR = COLRAM
    .endif
.endif

TESTNAMEPOS = $0b; x coord

; cannot define string symbols from the command line with ca65
.if DECOMPRESSOR = DECOMPRESSORS::BITNAX
    .define COMPEXT "BNX"
    .define SAFETYMARGIN 0
.elseif DECOMPRESSOR = DECOMPRESSORS::BYTEBOOZER2
    .define COMPEXT "B2"
    .define SAFETYMARGIN 3
.elseif DECOMPRESSOR = DECOMPRESSORS::DOYNAX_LZ
    .define COMPEXT "DNX"
    .define SAFETYMARGIN 4
.elseif DECOMPRESSOR = DECOMPRESSORS::EXOMIZER
    .define COMPEXT "EXO"
    .define SAFETYMARGIN 3
.elseif DECOMPRESSOR = DECOMPRESSORS::LEVELCRUSH
    .define COMPEXT "LC"
    .define SAFETYMARGIN 3
.elseif DECOMPRESSOR = DECOMPRESSORS::LZSA2
    .define COMPEXT "SA2"
    .define SAFETYMARGIN 0
.elseif DECOMPRESSOR = DECOMPRESSORS::NUCRUNCH
    .define COMPEXT "NC"
    .define SAFETYMARGIN 5
.elseif DECOMPRESSOR = DECOMPRESSORS::PUCRUNCH
    .define COMPEXT "PU"
    .define SAFETYMARGIN 36
.elseif DECOMPRESSOR = DECOMPRESSORS::SUBSIZER
    .define COMPEXT "SSZ"
    .define SAFETYMARGIN 2
.elseif DECOMPRESSOR = DECOMPRESSORS::TINYCRUNCH
    .define COMPEXT "TC"
    .define SAFETYMARGIN 0
.elseif DECOMPRESSOR = DECOMPRESSORS::TSCRUNCH
    .define COMPEXT "TS"
    .define SAFETYMARGIN 0
.elseif DECOMPRESSOR = DECOMPRESSORS::ZX0
    .define COMPEXT "ZX0"
    .define SAFETYMARGIN 0
.else
    .define COMPEXT "PRG"
    .define SAFETYMARGIN 0
.endif


; testing macros

.if VERIFY
    .macro VERIFY_PROLOGUE
            ; copy away
            jsr piccopy
    .endmacro

    .macro VERIFY_EPILOGUE
            .local verifyok

            jsr piccomp
            beq verifyok
            jsr verifyfail
verifyok:
    .endmacro
.endif


.macro MEMCONFIG_BUFFER
    .if PLATFORM = diskio::platform::COMMODORE_16
            lda TED_CHARGEN_ADDR
    .elseif PLATFORM = diskio::platform::COMMODORE_128
            lda #BANK_0 | HIGH_RAM | MID_RAM | LOW_RAM | IO_SPACE; $3e
            sta MMU_CR
    .else
            lda IO_PORT_DIRECTION
            pha
            lda IO_PORT
    .endif
            pha
.endmacro

.macro MEMCONFIG_CHECK
            pla
    .if PLATFORM = diskio::platform::COMMODORE_16
            eor TED_CHARGEN_ADDR
            and #ROM_IS_ENABLED | FORCE_SINGLE_CLOCK
            beq :+
            lda #MEMCONFCHNG
            jsr error
    .elseif PLATFORM = diskio::platform::COMMODORE_128
            cmp MMU_CR
            beq :+
            tax       ; expected
            ldy MMU_CR; actual
            lda #MEMCONFCHNG
            jsr error
    .else
            tax
            ldy IO_PORT
            pla
            cpx IO_PORT
            bne :+
            tax
            ldy IO_PORT_DIRECTION
            cpx IO_PORT_DIRECTION
            beq :++
:           lda #MEMCONFCHNG
            jsr error
    .endif
:
.endmacro

.macro ENABLE_MEMCONFIG_CHECK
            lda #$ff
            sta memcfgchks
.endmacro

.macro DISABLE_MEMCONFIG_CHECK
            lda #0
            sta memcfgchks
.endmacro

.macro ENABLE_ALL_ROM
    .if PLATFORM = diskio::platform::COMMODORE_16
            sta TED_ROM_ENABLE
    .elseif PLATFORM = diskio::platform::COMMODORE_128
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | BASIC_LO | IO_SPACE
            sta MMU_CR
    .else
            lda #MEMCONFIG_IO_KERNAL_BASIC
            sta IO_PORT
    .endif
.endmacro

.macro ENABLE_ALL_RAM
    .if PLATFORM = diskio::platform::COMMODORE_16
            sta TED_RAM_ENABLE
    .elseif PLATFORM = diskio::platform::COMMODORE_128
            lda #BANK_0 | HIGH_RAM | MID_RAM | LOW_RAM | RAM_ROM
            sta MMU_CR
    .else
            lda #MEMCONFIG_ALL_RAM
            sta IO_PORT
    .endif
.endmacro

.macro PUSH_MEMCONFIG
    .if PLATFORM = diskio::platform::COMMODORE_16
            lda TED_CHARGEN_ADDR
            lsr
            php
    .elseif PLATFORM = diskio::platform::COMMODORE_128
            lda MMU_CR
            pha
    .else
            lda IO_PORT
            pha
    .endif
.endmacro

.macro PUSH_MEMCONFIG_AND_ENABLE_ALL_ROM
            PUSH_MEMCONFIG
            ENABLE_ALL_ROM
.endmacro

.macro PUSH_MEMCONFIG_AND_ENABLE_ALL_RAM
            PUSH_MEMCONFIG
            ENABLE_ALL_RAM
.endmacro

.macro POP_MEMCONFIG
    .if PLATFORM = diskio::platform::COMMODORE_16
            .local enable_ram

            plp
            ENABLE_ALL_RAM
            bcc enable_ram
            ENABLE_ALL_ROM
enable_ram:
    .elseif PLATFORM = diskio::platform::COMMODORE_128
            pla
            sta MMU_CR
    .else
            pla
            sta IO_PORT
    .endif
.endmacro


.macro TEST testmacro, filename, redzone
            .local redzoneok

    .if TEST_BUS_LOCK
            ENTER_BUS_LOCK
:           inc CIA2_PRA
            dex
            bne :-
            ror CIA2_PRA
            dey
            bne :-
            LEAVE_BUS_LOCK
    .endif; TEST_BUS_LOCK

            DISABLE_MEMCONFIG_CHECK
            PUSH_MEMCONFIG_AND_ENABLE_ALL_RAM
            lda looprunlo
            sta redzone
            POP_MEMCONFIG
            ENABLE_MEMCONFIG_CHECK

            MEMCONFIG_BUFFER
    .if !NO_SPRITES_OR_IRQ
            lda #.lobyte(filename)
            sta filenamelo
            lda #.hibyte(filename)
            sta filenamehi
    .endif
            testmacro filename
            MEMCONFIG_CHECK

            DISABLE_MEMCONFIG_CHECK
            PUSH_MEMCONFIG_AND_ENABLE_ALL_RAM
            lda looprunlo
            cmp redzone
            beq redzoneok
            lda #ERRSAFETYMARGIN
            ldx #.lobyte(redzone)
            ldy #.hibyte(redzone)
            jmp error
redzoneok:  POP_MEMCONFIG
            ENABLE_MEMCONFIG_CHECK

    .if VERIFY
            VERIFY_PROLOGUE
            testmacro filename
            VERIFY_EPILOGUE
    .endif
            jsr checkkeys
.endmacro

.macro CHECKLOADADDRESSRAW
            .local lodaddfail
            .local loadaddrok

    .if LOAD_TO_API
            lda #.lobyte(BITMAP + $20)
    .else
            lda #.lobyte(BITMAP)
    .endif
            cmp loadaddrlo
            bne lodaddfail
            lda #.hibyte(BITMAP)
            cmp loadaddrhi
            beq loadaddrok
lodaddfail: lda #ERRLOADADDR
            ldx loadaddrlo
            ldy loadaddrhi
            jmp error
loadaddrok:
.endmacro

.macro CHECKLOADADDRESSCOMPD
            .local loadaddrok

            ; load address must be > BITMAP address
            lda #.lobyte(BITMAP)
            cmp loadaddrlo
            lda #.hibyte(BITMAP)
            sbc loadaddrhi
            bcc loadaddrok
            lda #ERRLOADADDR
            ldx loadaddrlo
            ldy loadaddrhi
            jmp error
loadaddrok:

.endmacro

.macro CHECKENDADDRESSRAW
    .if END_ADDRESS_API
            .local endaddfail
            .local endaddrok

            clc
            lda #.lobyte(BITMAP_SIZE)
            adc loadaddrlo
            eor endaddrlo
            bne endaddfail
            lda #.hibyte(BITMAP_SIZE)
            adc loadaddrhi
            cmp endaddrhi
            beq endaddrok
endaddfail: lda #ERRENDADDR
            ldx endaddrlo
            ldy endaddrhi
            jmp error
endaddrok:
    .endif; END_ADDRESS_API
.endmacro

.macro CHECKENDADDRESSCOMPD dataoffset
    .if END_ADDRESS_API
            .local endaddfail
            .local endaddrok

            lda endaddrlo
            cmp #.lobyte(BITMAP + BITMAP_SIZE + dataoffset)
            bcc endaddfail
            lda endaddrhi
            cmp #.hibyte(BITMAP + BITMAP_SIZE + dataoffset)
            beq endaddrok
endaddfail: lda #ERRENDADDR
            ldx endaddrlo
            ldy endaddrhi
            jmp error
endaddrok:
    .endif; END_ADDRESS_API
.endmacro

.macro PRINTTESTNAME testname
            .local filllength
            .local name
            .local nameend

            DISABLE_MEMCONFIG_CHECK

            lda #0
            sta DFLTO

    .if !NO_SPRITES_OR_IRQ
            lda #.lobyte(name)
            sta testnamelo
            lda #.hibyte(name)
            sta testnamehi
    .endif
            ldx #TESTNAMEPOS
            ldy #$01
            jsr setplotxy
            ldx #.lobyte(name)
            ldy #.hibyte(name)
            jsr plottext
    .if PLATFORM = diskio::platform::COMMODORE_16
            sec
            lda #.lobyte(COLRAM + $0c38)
            sbc POINTERS + 2
    .else
            lda #$10
    .endif
            sta filllength
            sec
            lda #.lobyte(emptytexte)
filllength = * + 1
            sbc #$00
            tax
            lda #.hibyte(emptytexte)
            sbc #$00
            tay
            jsr plottext

            ENABLE_MEMCONFIG_CHECK
            jmp nameend

name:       .byte testname, 0
nameend:
.endmacro

.macro TESTUNCOMPRESSED testmacro, testname, dataoffset
            PRINTTESTNAME testname

            TEST testmacro, pic1unc, BITMAP + BITMAP_SIZE + dataoffset
            CHECKLOADADDRESSRAW
            CHECKENDADDRESSRAW

            TEST testmacro, pic2unc, BITMAP + BITMAP_SIZE + dataoffset
            CHECKLOADADDRESSRAW
            CHECKENDADDRESSRAW
.endmacro

.macro TESTCOMPRESSED testmacro, testname, dataoffset
            PRINTTESTNAME .concat(testname, ":", COMPEXT)

            TEST testmacro, pic1compd, BITMAP + BITMAP_SIZE + SAFETYMARGIN + dataoffset
            CHECKLOADADDRESSCOMPD
            CHECKENDADDRESSCOMPD dataoffset

            TEST testmacro, pic2compd, BITMAP + BITMAP_SIZE + SAFETYMARGIN + dataoffset
            CHECKLOADADDRESSCOMPD
            CHECKENDADDRESSCOMPD dataoffset
.endmacro

.macro CONSOLE text
            lda #.lobyte(text)
            ldy #.hibyte(text)
            jsr consoleout
.endmacro

.macro INITSTAT
            jsr initstat
.endmacro

.macro PRINTSTAT numbytes
            DISABLE_MEMCONFIG_CHECK
            ldx #.hibyte(numbytes)
            ldy #.lobyte(numbytes)
            jsr printstat
            ENABLE_MEMCONFIG_CHECK
.endmacro


.macro MEMCLEAR address, size
            lda #.hibyte(size)
            ldx #.hibyte(address)
            jsr memclear
.endmacro

.macro MEMCOPY source, dest, size
            lda #.hibyte(size)
            ldx #.hibyte(source)
            ldy #.hibyte(dest)
            jsr memcopy
.endmacro

.macro MEMCOMP buffer1, buffer2, size
            lda #.lobyte(size)
            sta POINTERS + $00
            lda #.hibyte(size)
            ldx #.hibyte(buffer1)
            ldy #.hibyte(buffer2)
            jsr memcomp
.endmacro


.segment "CODE"

            sei
            ldx #$ff
            txs

.if USE_2_MHZ
            lda #0
            sta VIC2_C128_CLOCK
.endif

.if (PLATFORM = diskio::platform::COMMODORE_64) & LOAD_TO_UPPER_MEM
            IEEE_488_CODE_START = $c800
            IEEE_488_CODE_END   = $d000
            IEEE_488_CODE_RELOC = $0800

            lda IOPEN + 1
            cmp #.hibyte(IEEE_488_CODE_START)
            bcc noieeerloc
            cmp #.hibyte(IEEE_488_CODE_END)
            bcs noieeerloc

            lda #0
            sta POINTERS
            sta POINTERS + 2
            lda #.hibyte(IEEE_488_CODE_START)
            sta POINTERS + 1
            lda #.hibyte(IEEE_488_CODE_RELOC)
            sta POINTERS + 3
            sec
            sbc POINTERS + 1
            sta POINTERS + 4
            ldx #.hibyte(IEEE_488_CODE_END - IEEE_488_CODE_START)
relocloop:  ldy #0
            lda (POINTERS),y
            sta (POINTERS + 2),y
            cmp #OPC_JSR_ABS
            beq :+
            cmp #OPC_JMP_ABS
            beq :+
            cmp #OPC_JMP_ABSI
            beq :+
            cmp #OPC_LDA_ABSX
            bne noreloc
:           ldy #2
            lda (POINTERS),y
            ldy #0
            cmp #.hibyte(IEEE_488_CODE_START)
            bcc noreloc
            cmp #.hibyte(IEEE_488_CODE_END)
            bcs noreloc
            iny
            lda (POINTERS),y
            sta (POINTERS + 2),y
            iny
            lda POINTERS + 4
            adc (POINTERS),y
            sta (POINTERS + 2),y
noreloc:    tya
            sec
            adc POINTERS
            sta POINTERS
            sta POINTERS + 2
            bcc relocloop
            inc POINTERS + 1
            inc POINTERS + 3
            dex
            bne relocloop
            ldx #ISAVE - IOPEN
:           lda IOPEN + 1,x
            cmp #.hibyte(IEEE_488_CODE_START)
            bcc :+
            cmp #.hibyte(IEEE_488_CODE_END)
            bcs :+
            adc POINTERS + 4
            sta IOPEN + 1,x
:           dex
            dex
            bpl :--
noieeerloc:
.endif

.if PLATFORM = diskio::platform::COMMODORE_16
            ; pucrunch turns off the screen during decompression
            lda #DISPLAY_DISABLE
            sta TED_CTRL1
            ; YAPE doesn't set FA to the current
            ; drive when using autostart
            lda FA
            and #.lobyte(~$01)
            cmp #$08
            beq :+
            lda #$08
            sta FA
:
.endif
            lda #0; OPC_BRK
            ldx #$40; MMU registers are at $ff00..$ff07, TED registers are at $ff00..$ff3f
:           sta $ff00,x; guard against calling ROM
            inx        ; code with RAM enabled
            bne :-

            lda #.lobyte(nmihandler)
.if PLATFORM <> diskio::platform::COMMODORE_16
            sta NMINV + $00
.endif
            sta NMI_VECTORLO
            lda #.hibyte(nmihandler)
.if PLATFORM <> diskio::platform::COMMODORE_16
            sta NMINV + $01
.endif
            sta NMI_VECTORHI

            lda #.lobyte(ramirq)
            sta IRQ_VECTORLO
            lda #.hibyte(ramirq)
            sta IRQ_VECTORHI

.if PLATFORM = diskio::platform::COMMODORE_16

            ldx #$00
            stx tod_hrs
            stx tod_mins
            stx tod_secs
            stx tod_10s
            stx tod_frames

            lda #PAL_NTSC_MASK
            and TED_CTRL2
            bne :+
            inx; PAL
:           stx palntsc

            jsr waitvbl
            lda TED_CHARGEN_ADDR
            and #.lobyte(~(CHARGEN_ADDR_MASK | FORCE_SINGLE_CLOCK))
            ora #MAKE_CHARGEN_ADDR(CHARSET_ADDR_UPPERLOWER)
            sta TED_CHARGEN_ADDR
            lda #COLOUR_BLACK
            sta TED_BGCOLOUR
            sta TED_BORDERCOLOUR

    .if COUPLED_TIMERS = 0
calibrate:  jsr readctr
            stx prevctr3lo
            sty prevctr3hi
            lda #$00
            sta adjustdiff
            jsr docalibrte
            sta adjustdiff
            jsr docalibrte
            cmp #$00
            bne calibrate
            cpx #$00
            bne calibrate
            cpy #$00
            bne calibrate
    .endif

            lda #PALETTE_DEFAULT
            sta PALETTE

            CONSOLE startupmsg

            jsr waitvbl
            lda #TEXT_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_3
            sta TED_CTRL1

            lda TED_RASTERLINE
:           cmp TED_RASTERLINE
            beq :-
:           ldx TED_RASTERLINE
            lda TED_RASTERLINE_MSB
            cpx TED_RASTERLINE
            bne :-
            stx TED_IRQ_RASTERLINE
            lsr
            lda TED_IMR
            and #.lobyte(~IRQ_RASTERLINE_MSB)
            bcc :+
            ora #IRQ_RASTERLINE_MSB
:           sta TED_IMR

            lda #.lobyte(clockirq)
            sta CINV + $00
            lda #.hibyte(clockirq)
            sta CINV + $01
            lda #RASTER_IRQ
            sta TED_IMR
            lda TED_IRR
            sta TED_IRR

.else; PLATFORM <> diskio::platform::COMMODORE_16

    .if PLATFORM = diskio::platform::COMMODORE_128
            ldx #leaveirqe - leaveirq - 1
:           lda leaveirq,x
            sta BUF,x
            dex
            bpl :-
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | LOW_RAM | IO_SPACE
            sta MMU_CR
    .else; PLATFORM <> diskio::platform::COMMODORE_128
            lda #MEMCONFIG_IO_KERNAL_BASIC
            sta IO_PORT
    .endif; PLATFORM <> diskio::platform::COMMODORE_128

            ; detect video standard
:           bit VIC2_CTRL1
            bmi :-
:           bit VIC2_CTRL1
            bpl :-
            lda #$37
:           cmp VIC2_RASTERLINE
            bne :-
            lda VIC2_CTRL1
            asl
            lda #$00
    .if PLATFORM = diskio::platform::COMMODORE_128
            bcc :+
            lda #$ff; 0: NTSC, $ff: PAL
:
    .else
            rol; 0: NTSC, 1: PAL
    .endif
            sta palntsc

            ; detect mains frequency
            lda #TOD_SET_CLOCK | TIMER_STOP
            sta CIA1_CRB
            ldx #0
            stx CIA1_TOD_10S
            ldy #$ff
            sty CIA1_TA_LO
            sty CIA1_TA_HI
            ldy #TOD_FREQ_60HZ | FORCE_LOAD | CONTINUOUS | TIMER_START
            sty CIA1_CRA
            lda #CIA_CLR_INTF | TIMERA_IRQ
            bit CIA1_ICR
            sta CIA1_ICR
:           cpx CIA1_TOD_10S
            bne haveac
            bit CIA1_ICR
            beq :-
:           bit CIA1_ICR
            bne noac
            cpx CIA1_TOD_10S
            beq :-
haveac:     sty CIA1_CRA
            ldx CIA1_TOD_10S
:           cpx CIA1_TOD_10S
            beq :-
            lda CIA1_TA_HI
            cmp #$50
            lda #TOD_FREQ_60HZ
            ldx #60
            bcs :+
            lda #TOD_FREQ_50HZ
            ldx #50
:           sta CIA1_CRA
            stx mainsfreq + 1
noac:
            jsr waitvbl
            lda #DISPLAY_DISABLE
            sta VIC2_CTRL1
            lda #VIC2_MAKE_ADDR($0400, CHARSET_ADDR_UPPERLOWER)
            sta VIC2_ADDR
            lda VIC2_ADDR
            lda #COLOUR_BLACK
            sta VIC2_BGCOLOUR
            sta VIC2_BORDERCOLOUR

            CONSOLE startupmsg

            jsr waitvbl
            lda #TEXT_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_3
            sta VIC2_CTRL1

            lda #0
            sta CIA1_TOD_HRS
            sta CIA1_TOD_MIN
            sta CIA1_TOD_SEC
            sta CIA1_TOD_10S

.endif; PLATFORM <> diskio::platform::COMMODORE_16

            cli

            CONSOLE detectedms
            lda #.lobyte(paltext)
            ldy #.hibyte(paltext)
            ldx palntsc
            bne :+
            lda #.lobyte(ntsctext)
            ldy #.hibyte(ntsctext)
:           jsr consoleout
            CONSOLE systemmsg

            PUSH_MEMCONFIG_AND_ENABLE_ALL_ROM

            lda palntsc
            beq ntsckbs
            INT32TOFAC numccpal; fac#1 = cyclespersecond
            jmp :+
ntsckbs:    INT32TOFAC numccntsc; fac#1 = cyclespersecond
:           jsr DIV10; fac#1 /= 10
            ldx #.lobyte(cyclesperd)
            ldy #.hibyte(cyclesperd)
            jsr MOV2M; cyclesperd = fac#1 = cycles per 1/10 seconds

            lda #.hibyte(100)
            ldy #.lobyte(100)
            jsr GIVAYF; fac#1 = 100
            ldx #.lobyte(hundred)
            ldy #.hibyte(hundred)
            jsr MOV2M; hundred = fac#1 = 100

            POP_MEMCONFIG

.if PLATFORM <> diskio::platform::COMMODORE_16
            CONSOLE detectedms
            lda #0
mainsfreq:  ldx #0
            jsr printword
            CONSOLE acfreqmsg
.endif
            lda #.hibyte(__DISKIO_INSTALL_SIZE__)
            jsr tohex
            stx inssizebyt
            sta inssizebyt + 1
            lda #.lobyte(__DISKIO_INSTALL_SIZE__)
            jsr tohex
            stx inssizebyt + 2
            sta inssizebyt + 3
            CONSOLE inssizemsg

            lda #.hibyte(__DISKIO_SIZE__)
            jsr tohex
            stx ressizebyt
            sta ressizebyt + 1
            lda #.lobyte(__DISKIO_SIZE__)
            jsr tohex
            stx ressizebyt + 2
            sta ressizebyt + 3
            CONSOLE ressizemsg

.if TEST_SAVE
            .import __DISKIO_PLUGIN_SIZE__

            lda #.hibyte(__DISKIO_PLUGIN_SIZE__)
            jsr tohex
            stx trnsizebyt
            sta trnsizebyt + 1
            lda #.lobyte(__DISKIO_PLUGIN_SIZE__)
            jsr tohex
            stx trnsizebyt + 2
            sta trnsizebyt + 3
            CONSOLE trnsizemsg
.endif

            CONSOLE installmsg
            lda #0
            ldx FA
            jsr printword
            CONSOLE installrst

            lda #.lobyte(brkhandler)
            sta CBINV
            lda #.hibyte(brkhandler)
            sta CBINV + 1
            lda IBSOUT
            sta bsout + 1
            lda IBSOUT + 1
            sta bsout + 2
.if PLATFORM = diskio::platform::COMMODORE_128
            lda #.lobyte(dualhead)
            sta IBSOUT
            lda #.hibyte(dualhead)
            sta IBSOUT + 1
.endif; PLATFORM = diskio::platform::COMMODORE_128

            LOADER_INSTALL

.if PLATFORM = diskio::platform::COMMODORE_128
            pha
            lda bsout + 1
            sta IBSOUT
            lda bsout + 2
            sta IBSOUT + 1
            pla
.endif; PLATFORM = diskio::platform::COMMODORE_128

            stx drivetype
            bcc :+
.if LOAD_VIA_KERNAL_FALLBACK
            cmp #diskio::status::DEVICE_INCOMPATIBLE
            beq :+
            cmp #diskio::status::TOO_MANY_DEVICES
            beq :+
.endif
            jmp error

:           tya
            pha

            php
            sei
            lda #COLOUR_BLACK
            sta BGCOLOUR
            sta BORDERCOLOUR
            plp

.if PLATFORM <> diskio::platform::COMMODORE_16
            lda palntsc; as detected
            cmp PALNTS; $02a6 (C-64) or $0a03 (C-128), as set by KERNAL
            beq :+
            lda #ERRPALNTSC
            jmp error
:
.endif; PLATFORM <> diskio::platform::COMMODORE_16

            DISABLE_MEMCONFIG_CHECK

            CONSOLE runningmsg

            ldx #IRQ_SLACK
            lda drivetype
            bpl drvconsole

            cmp #diskio::drivetype::DRIVE_GENERIC_PARALLEL
            bne :+
            lda #drivemsgpa - drivemsgsl + diskio::drivetype::DRIVE_1541; generic parallel drive
            ldx #KERNAL_FALLBACK_IRQ_SLACK_PARALLEL
            jmp drvconsole

:           cmp #diskio::drivetype::DRIVE_GENERIC_BURST
            bne :+
            lda #drivemsgbr - drivemsgsl + diskio::drivetype::DRIVE_1541; generic burst drive
            ldx #KERNAL_FALLBACK_IRQ_SLACK_BURST
            jmp drvconsole

:           lda #drivemsgsr - drivemsgsl + diskio::drivetype::DRIVE_1541; generic serial drive
            ldx #KERNAL_FALLBACK_IRQ_SLACK_SERIAL
drvconsole: stx IRQSLACK
            and #%00001111
            tax
            lda drivemsgsl - diskio::drivetype::DRIVE_1541,x
            ldy drivemsgsh - diskio::drivetype::DRIVE_1541,x
            jsr consoleout

            CONSOLE returnmsg

            bit drivetype
            bmi no2bitatn
.if PLATFORM = diskio::platform::COMMODORE_128
            bit CIA1_CRA
            bvs :+; branch if IO mode is set to output
            CONSOLE burstmsg
            jmp no2bitatn
:
.endif; PLATFORM = diskio::platform::COMMODORE_128
            CONSOLE twobitatnm
no2bitatn:

            CONSOLE quotemsg
            pla
            tax
            lda 0,x
            ldy 1,x
            ; print version string
            jsr consoleout
            lda #$00
            sta QTSW; leave quote mode
            sta consoletime
            CONSOLE quotemsg + 1
            lda #$00
            sta QTSW; leave quote mode
            CONSOLE returnmsg

.if PLATFORM = diskio::platform::COMMODORE_16

            jsr pauseonkey; don't continue as long as any key is pressed

            CONSOLE loopmsg

            sei
            jsr waitvbl

            lda #DISPLAY_DISABLE
            sta TED_CTRL1

            ldx #$00
:           lda #INTENSITY_4 | (INTENSITY_6 >> 4)
            sta COLRAM + $00,x
            sta COLRAM + $0100,x
            sta COLRAM + $0200,x
            sta COLRAM + $0300,x
            lda #(COLOUR_WHITE << 4) | COLOUR_WHITE
            sta COLRAM + $0400,x
            sta COLRAM + $0500,x
            sta COLRAM + $0600,x
            sta COLRAM + $0700,x
            lda #INTENSITY_6 | COLOUR_YELLOW
            sta COLRAM + $0800,x
            sta COLRAM + $0900,x
            sta COLRAM + $0a00,x
            sta COLRAM + $0b00,x
            lda #' '
            sta COLRAM + $0c00,x
            sta COLRAM + $0d00,x
            sta COLRAM + $0e00,x
            sta COLRAM + $0f00,x
            inx
            bne :-
            txa
            ldx #$06 * $08 - 1
:           sta COLRAM + $0c60,x
            sta COLRAM + $0c88,x
            sta COLRAM + $0d00,x; space character
            sta COLRAM + $0860,x
            dex
            bpl :-
            ldx #$11
            stx COLRAM + $0c38
            inx
            stx COLRAM + $0c39
            inx
            stx COLRAM + $0c3a
            inx
            stx COLRAM + $0c3b
            inx
            stx COLRAM + $0c3c
            inx
            stx COLRAM + $0c3d

            lda #$b0
            sta TED_CURSOR_LO
            lda #$00
            sta TED_CURSOR_HI
            lda #INTENSITY_0 | COLOUR_BLACK
            sta TED_BGCOLOUR0

            MEMCLEAR BITMAP, ALIGN BITMAP_SIZE, $0100

            jsr waitvbl

            lda #BITMAP_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_3
            sta TED_CTRL1
            lda TED_BITMAP_ADDR
            and #.lobyte(~(BITMAP_ADDR_MASK | CHARSET_BITMAP_IN_ROM))
            ora #MAKE_BITMAP_ADDR(BITMAP)
            sta TED_BITMAP_ADDR
            lda TED_SCREEN_ADDR
            and #.lobyte(~SCREEN_ADDR_MASK)
            ora #MAKE_SCREEN_ADDR(COLRAM)
            sta TED_SCREEN_ADDR

            sei
            sec
            lda #$c7
            sbc IRQSLACK
            sta TED_IRQ_RASTERLINE
            lda #.lobyte(~IRQ_RASTERLINE_MSB)
            and TED_IMR
            sta TED_IMR
            lda #.lobyte(irq1)
            sta CINV
            lda #.hibyte(irq1)
            sta CINV + 1
            cli

.else; PLATFORM <> diskio::platform::COMMODORE_16

            jsr pauseonkey; don't continue as long as any key is pressed

            CONSOLE loopmsg

            sei
            jsr waitvbl

            lda #DISPLAY_DISABLE
            sta VIC2_CTRL1

            ldx #$00
:
    .if LOAD_TO_UPPER_MEM
            ENABLE_ALL_RAM
    .endif
            lda #$00
            sta SPRITES + $00,x
            sta SPRITES + $0100,x
            lda #(COLOUR_LIGHTGREY << 4) | COLOUR_DARKGREY
            sta COLRAM + $00,x
            sta COLRAM + $0100,x
            sta COLRAM + $0200,x
            sta COLRAM + $0300,x
    .if LOAD_TO_UPPER_MEM
            ENABLE_ALL_ROM
    .endif
            inx
            bne :-

            MEMCLEAR BITMAP, ALIGN BITMAP_SIZE, $0100

SPRITESXPOS = $18

            lda #SPRITESXPOS + SPRITE_WIDTH * 0
            sta SPRITE0_X
            lda #SPRITESXPOS + SPRITE_WIDTH * 1
            sta SPRITE1_X
            lda #SPRITESXPOS + SPRITE_WIDTH * 2
            sta SPRITE2_X
            lda #SPRITESXPOS + SPRITE_WIDTH * 3
            sta SPRITE3_X
            lda #SPRITESXPOS + SPRITE_WIDTH * 4
            sta SPRITE4_X
            lda #SPRITESXPOS + SPRITE_WIDTH * 5
            sta SPRITE5_X
            lda #SPRITESXPOS + SPRITE_WIDTH * 6
            sta SPRITE6_X
            lda #SPRITESXPOS + SPRITE_WIDTH * 7
            sta SPRITE7_X

            lda #$fb
            sta SPRITE0_Y
            sta SPRITE1_Y
            sta SPRITE2_Y
            sta SPRITE3_Y
            sta SPRITE4_Y
            sta SPRITE5_Y
            sta SPRITE6_Y
            sta SPRITE7_Y

            lda #%00000000
            sta SPRITES_X_MSB
            lda #%11111111
            sta VIC2_SPR_ENABLE
            lda #COLOUR_YELLOW
            sta VIC2_SPR0_COLOUR
            sta VIC2_SPR1_COLOUR
            sta VIC2_SPR2_COLOUR
            sta VIC2_SPR3_COLOUR
            sta VIC2_SPR4_COLOUR
            sta VIC2_SPR5_COLOUR
            sta VIC2_SPR6_COLOUR
            sta VIC2_SPR7_COLOUR

            ldx #MAKE_SPRITE_POINTER(SPRITES)
            stx SPRITESCR + SPRITE_POINTERS
            inx
            stx SPRITESCR + SPRITE_POINTERS + 1
            inx
            stx SPRITESCR + SPRITE_POINTERS + 2
            inx
            stx SPRITESCR + SPRITE_POINTERS + 3
            inx
            stx SPRITESCR + SPRITE_POINTERS + 4
            inx
            stx SPRITESCR + SPRITE_POINTERS + 5
            inx
            stx SPRITESCR + SPRITE_POINTERS + 6
            inx
            stx SPRITESCR + SPRITE_POINTERS + 7

    .if PLATFORM = diskio::platform::COMMODORE_128
            lda #IO_PORT_CHARGEN_DISABLED
            sta IO_PORT
    .endif
            lda #BITMAP_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_3
            sta VIC2_CTRL1
            lda #VIC2_MAKE_ADDR COLRAM, BITMAP
            sta VIC2_ADDR
            SET_VIC_BANK VIC2_MAKE_BANK BITMAP

    .if LOAD_TO_UPPER_MEM
            lda #$01
            sta VIC2_RASTERLINE
            lda #.lobyte(irq0)
            sta CINV
            lda #.hibyte(irq0)
    .else
            sec
            lda #$f8
            sbc IRQSLACK
            sta VIC2_RASTERLINE
            lda #.lobyte(irq1)
            sta CINV
            lda #.hibyte(irq1)
    .endif
            sta CINV + 1
            lda #ALL_COLUMNS
            sta CIA1_PRA
            lda #CIA_CLR_INTF | EVERY_IRQ
            sta CIA1_ICR
            bit CIA1_ICR
            lda #RASTER_IRQ
            sta VIC2_IMR
            sta VIC2_IRR

.endif; PLATFORM <> diskio::platform::COMMODORE_16

            ; print the static settings
            lda #.lobyte(printstatc)
            sta IBSOUT
            lda #.hibyte(printstatc)
            sta IBSOUT + 1
            lda #0
            sta DFLTO

            cli

            PUSH_MEMCONFIG_AND_ENABLE_ALL_ROM

            ldx #$00
            ldy #$00
            jsr setplotxy

            ldx #.lobyte(paltext)
            ldy #.hibyte(paltext)
            lda palntsc
            bne :+
            ldx #.lobyte(ntsctext)
            ldy #.hibyte(ntsctext)
:           jsr plottext

            lda #','
            jsr BSOUT

            lda #' '
            jsr BSOUT
            lda #'#'
.if PLATFORM = diskio::platform::COMMODORE_128
            bit drivetype
            bmi :+
            bit CIA1_CRA
            bvs :+; branch if IO mode is set to output
            lda #'b'; burst mode
:
.endif
            jsr BSOUT
            lda FA
            cmp #10
            bcc :+
            lda #'1'
            jsr BSOUT
            sec
            lda FA
            sbc #10
:           ora #'0'
            jsr BSOUT
            lda #'/'
            jsr BSOUT

            lda drivetype
            and #%00001111
            tax
            lda drivtypesl - diskio::drivetype::DRIVE_1541,x
            ldy drivtypesh - diskio::drivetype::DRIVE_1541,x
            tax
            jsr plottext

            lda #','
            jsr BSOUT
            lda #' '
            jsr BSOUT
            lda #'$'
            jsr BSOUT

            lda #.hibyte(__DISKIO_SIZE__)
            beq :+
            jsr plotbyte
:           lda #.lobyte(__DISKIO_SIZE__)
            jsr plothex

            POP_MEMCONFIG

.if !INSTALL_ONLY

.if PLATFORM = diskio::platform::COMMODORE_16
            sta TED_RAM_ENABLE
            lda #.lobyte(~FORCE_SINGLE_CLOCK)
            sei
            and TED_CHARGEN_ADDR
            sta TED_CHARGEN_ADDR
            cli
.elseif PLATFORM = diskio::platform::COMMODORE_128
            lda #BANK_0 | HIGH_RAM | MID_RAM | LOW_RAM | IO_SPACE; $3e
            sta MMU_CR
.else
            lda #MEMCONFIG_IO
            sta IO_PORT
.endif

            ENABLE_MEMCONFIG_CHECK

.if NO_SPRITES_OR_IRQ
    .if PLATFORM <> diskio::platform::COMMODORE_16
            lda #$00
            sta VIC2_IMR
            sei
            sta VIC2_SPR_ENABLE
    .else
            lda #$00
            sta TED_IMR
            lda TED_IRR
            sta TED_IRR
            sei
            lda #BITMAP_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_3
            sta TED_CTRL1
    .endif
.endif

testloop:
.if !NO_SPRITES_OR_IRQ
            DISABLE_MEMCONFIG_CHECK
            PUSH_MEMCONFIG_AND_ENABLE_ALL_ROM

            lda bsout + 1
            sta IBSOUT
            lda bsout + 2
            sta IBSOUT + 1

            CONSOLE looprunmsg
looprunhi = * + 1
            lda #0
looprunlo = * + 1
            ldx #1
            jsr printword

    .if USE_2_MHZ
            ldx #'1'
            lda VIC2_C128_CLOCK
            cmp #.lobyte(~C128_INC_LINECNTR); $fd, will say "1 MHz" for Turbo Chameleon turbo mode ($ff, as on C-64)
            bne :+
            inx
:           stx mhz
            CONSOLE mhzmsg
    .endif
            CONSOLE returnmsg

            lda #.lobyte(printstatc)
            sta IBSOUT
            lda #.hibyte(printstatc)
            sta IBSOUT + 1

            inc looprunlo
            bne :+
            inc looprunhi
:
            POP_MEMCONFIG
            ENABLE_MEMCONFIG_CHECK
.endif

.if LOAD_RAW_API
            ; --- load raw ---

    .macro LOAD_RAW filename
            .local done

            INITSTAT

        .if LOAD_TO_API
            LOADRAW_LOADTO filename, BITMAP + $20
        .else
            LOADRAW filename
        .endif
            jcs error

            PRINTSTAT BITMAP_SIZE + 2
done:
    .endmacro

    .if LOAD_TO_API
            TESTUNCOMPRESSED LOAD_RAW, "LoadRaw", $20
    .else
            TESTUNCOMPRESSED LOAD_RAW, "LoadRaw", 0
    .endif

    .if TEST_INVALID_PARAMETERS
            PRINTTESTNAME "LoadRawInv"
        .if !NO_SPRITES_OR_IRQ
            lda #.lobyte(bogusname)
            sta filenamelo
            lda #.hibyte(bogusname)
            sta filenamehi
        .endif
            INITSTAT
            MEMCONFIG_BUFFER

            LOADRAW bogusname
            jcc error
            cmp #diskio::status::FILE_NOT_FOUND
            jne error

            PRINTSTAT 0
            MEMCONFIG_CHECK
    .endif
.endif

.if FILE_EXISTS_API
            PRINTTESTNAME "FileExists"

            lda #.lobyte(pic1unc)
            sta filenamelo
            lda #.hibyte(pic1unc)
            sta filenamehi
            INITSTAT

            FILEEXISTS pic1unc
            jcs error

            PRINTSTAT 0

            lda #.lobyte(bogusname)
            sta filenamelo
            lda #.hibyte(bogusname)
            sta filenamehi
            INITSTAT

            FILEEXISTS bogusname
            jcc error
            cmp #diskio::status::FILE_NOT_FOUND
            jne error

            PRINTSTAT 0

            jsr checkkeys
.endif

.if TEST_SAVE
            PRINTTESTNAME "Save"

            lda #.lobyte(pic1unc)
            sta filenamelo
            lda #.hibyte(pic1unc)
            sta filenamehi
            INITSTAT

            SAVE_OVERWRITE saveparams
            bcc donesave
            jmp error

saveparams: .word pic1unc; filename
            .word BITMAP; from
            .word BITMAP_SIZE; length
            .word BITMAP; loadaddress
            .word __SWAPBUFFER_LOAD__; buffer

donesave:   PRINTSTAT BITMAP_SIZE + 2

            jsr checkkeys
.endif; TEST_SAVE

.if MEM_DECOMP_API

            ; --- load a compressed file, then decompress after loading

    .macro LOADANDMEMDECOMP_COMMON filename
            .local done

            INITSTAT

        .if LOAD_RAW_API
            LOADRAW filename
            jcs error
        .else
            .error "To test memory decompression, please set LOAD_RAW_API to non-0"
        .endif

            clc
done:
    .endmacro

    .macro LOADANDMEMDECOMP filename
            .local done

        .if VERIFY
            .local verifyok

            MEMCLEAR BITMAP, ALIGN BITMAP_SIZE, $0100

            LOADANDMEMDECOMP_COMMON filename

            PUSH_MEMCONFIG_AND_ENABLE_ALL_RAM
            MEMCOPY BITMAP + ALIGN (BITMAP_SIZE >> 1), $0100, COMPDATA + ALIGN BITMAP_SIZE, $0100, ALIGN BITMAP_SIZE, $0100
            POP_MEMCONFIG
            MEMCLEAR BITMAP, ALIGN BITMAP_SIZE, $0100

            LOADANDMEMDECOMP_COMMON filename
            PUSH_MEMCONFIG_AND_ENABLE_ALL_RAM

            MEMCOMP BITMAP + ALIGN (BITMAP_SIZE >> 1), $0100, COMPDATA + ALIGN BITMAP_SIZE, $0100, ALIGN BITMAP_SIZE, $0100

            php
            pla
            tax
            POP_MEMCONFIG
            txa
            pha
            plp
            beq verifyok
            jsr verifyfail
verifyok:
        .else
            LOADANDMEMDECOMP_COMMON filename
        .endif

        .if LOAD_TO_UPPER_MEM
            PUSH_MEMCONFIG_AND_ENABLE_ALL_RAM
        .endif

            lda loadaddrlo
            sta POINTERS
            lda loadaddrhi
            sta POINTERS + 1
            dec loadaddrlo
            inc loadaddrhi

        .if MEM_DECOMP_TO_API
            MEMDECOMP_TO POINTERS, POINTERS + 1, BITMAP - $10
        .else
            MEMDECOMP POINTERS, POINTERS + 1
        .endif

        .if LOAD_TO_UPPER_MEM
            POP_MEMCONFIG
        .endif

            PRINTSTAT BITMAP_SIZE + 2
done:
    .endmacro

            TESTCOMPRESSED LOADANDMEMDECOMP, "MemDecomp", 0
.endif

.if LOAD_COMPD_API

            ; --- load with decompression ---

    .macro LOADCOMPRESSED filename
            .local done

            INITSTAT

        .if LOAD_TO_API
            LOADCOMPD_RELTO filename, -$10
        .else
            LOADCOMPD filename
        .endif
            jcs error

            PRINTSTAT BITMAP_SIZE + 2
done:
    .endmacro

    .if LOAD_TO_API
            TESTCOMPRESSED LOADCOMPRESSED, "LoadCompd", -$10
    .else
            TESTCOMPRESSED LOADCOMPRESSED, "LoadCompd", 0
    .endif

    .if TEST_INVALID_PARAMETERS
            PRINTTESTNAME "LoadCompdInv"
        .if !NO_SPRITES_OR_IRQ
            lda #.lobyte(bogusname)
            sta filenamelo
            lda #.hibyte(bogusname)
            sta filenamehi
        .endif
            INITSTAT
            MEMCONFIG_BUFFER

            LOADCOMPD bogusname
            jcc error
            cmp #diskio::status::FILE_NOT_FOUND
            jne error

            PRINTSTAT 0
loadcmpdun: MEMCONFIG_CHECK
    .endif
.endif; LOAD_COMPD_API

            inc bordercol + 1
setborder:  lda #1
            beq :+
bordercol:  lda #0
            sta BORDERCOLOUR
:
    .if USE_2_MHZ
            lda #C128_TWO_MHZ
            eor VIC2_C128_CLOCK
            sta VIC2_C128_CLOCK
    .endif
            jmp testloop

.if PLATFORM = diskio::platform::COMMODORE_16

pauseonkey: lda #ALL_COLUMNS
:           sei
            sta PIO_KEYBOARD_COLUMN
            sta TED_KEYBOARD_LATCH
            ldx TED_KEYBOARD_LATCH
            sta TED_KEYBOARD_LATCH
            cpx TED_KEYBOARD_LATCH
            cli
            bne :-
            cpx #NO_ROWS
            beq :+; branch if no key presed
            ; pause on any key except left shift (lock)
            ldx #LEFT_SHIFT_COLUMN
            ldy #LEFT_SHIFT_ROW
            sei
            stx PIO_KEYBOARD_COLUMN
            stx TED_KEYBOARD_LATCH
            cpy TED_KEYBOARD_LATCH
            cli
            bne pauseonkey
:           rts

.else; PLATFORM <> diskio::platform::COMMODORE_16

pauseonkey: lda #ALL_COLUMNS
:           sei
            sta CIA1_PRA
            ldx CIA1_PRB
            cpx CIA1_PRB
            cli
            bne :-
            inx
            beq :+; branch if no key presed
            ; pause on any key except left shift (lock)
            lda #LEFT_SHIFT_COLUMN
            ldx #LEFT_SHIFT_ROW
            sei
            sta CIA1_PRA
            cpx CIA1_PRB
            cli
            bne pauseonkey
:           rts

.endif; PLATFORM <> diskio::platform::COMMODORE_16

checkkeys:
.if PAUSE_BETWEEN_LOADS
            lda #PAUSE_BETWEEN_LOADS
            ldx #$00
            ldy #$00
:           dex
            bne :-
            dey
            bne :-
            sec
            sbc #$01
            bne :-
.endif

.if !UNINSTALL_API
            jmp pauseonkey
.else

    .if PLATFORM = diskio::platform::COMMODORE_16
            lda #ALL_COLUMNS
            sta PIO_KEYBOARD_COLUMN
            sta TED_KEYBOARD_LATCH
            lda TED_KEYBOARD_LATCH
            cmp #NO_ROWS
    .else
            inc CIA1_PRB; uninstall on keypress
    .endif
            bne off
            rts

off:
            LOADER_UNINSTALL
.endif; !UNINSTALL_API

.else ; INSTALL_ONLY
    .if UNINSTALL_API
:
        .if PLATFORM = diskio::platform::COMMODORE_16
            lda #ALL_COLUMNS
            sta PIO_KEYBOARD_COLUMN
            sta TED_KEYBOARD_LATCH
            lda TED_KEYBOARD_LATCH
            cmp #NO_ROWS
        .else
            inc CIA1_PRB; uninstall on keypress
        .endif
            beq :-
            LOADER_UNINSTALL
    .endif; UNINSTALL_API
.endif; INSTALL_ONLY

            DISABLE_MEMCONFIG_CHECK

.if UNINSTALL_API
            lda #MSGUNINST
            jsr printmsg
            lda bsout + 1
            sta IBSOUT
            lda bsout + 2
            sta IBSOUT + 1
            CONSOLE cmsguninst

    .if 0
            sei
            lda #.lobyte(KEY)
            sta CINV
            lda #.hibyte(KEY)
            sta CINV + 1

            lda #0
            sta VIC2_IMR
            sta VIC2_IRR
            sta VIC2_SPR_ENABLE
            dec BORDERCOLOUR

            lda #savefilend - savefile
            Ldx #.lobyte(savefile)
            ldy #.hibyte(savefile)
            jsr SETNAM
            lda #0
            ldx FA
            tay
            jsr SETLFS

            lda #.lobyte(savefile)
            sta STAL
            lda #.hibyte(savefile)
            sta STAH

            lda #STAL
            ldx #.lobyte(savefilend)
            ldy #.hibyte(savefilend)
            jsr SAVE
            bcc :+
            jmp error

savefile:   .byte "savefile"
savefilend:

:
    .endif
.endif
            jsr waitvbl
            lda #COLOUR_GREEN
            sta bordercol + 1
            sta BORDERCOLOUR

halt:       jmp halt

waitvbl:
.if PLATFORM <> diskio::platform::COMMODORE_16
            lda palntsc
            cmp #$01
.endif
            WAIT_VBL
            rts

initstat:
.if !NO_SPRITES_OR_IRQ
            DISABLE_MEMCONFIG_CHECK
            PUSH_MEMCONFIG_AND_ENABLE_ALL_ROM

            lda bsout + 1
            sta IBSOUT
            lda bsout + 2
            sta IBSOUT + 1

            CONSOLE logmsg

testnamelo = * + 1
            lda #$00
testnamehi = * + 1
            ldy #$00
            jsr consoleout
            CONSOLE spacemsg
            lda filenamehi
            beq noname
            CONSOLE quotemsg
filenamelo = * + 1
            lda #$00
            sta POINTERS
filenamehi = * + 1
            lda #$00
            sta POINTERS + 1
            ldy #0
:           lda (POINTERS),y
            beq :++
            cmp #$40
            bcc :+
            eor #$80
:           sta capsname,y
            iny
            bne :--
:           sta capsname,y
            lda #.lobyte(capsname)
            ldy #.hibyte(capsname)
            jsr consoleout
            CONSOLE quotemsg + 1

noname:     lda #.lobyte(printstatc)
            sta IBSOUT
            lda #.hibyte(printstatc)
            sta IBSOUT + 1

            POP_MEMCONFIG
            ENABLE_MEMCONFIG_CHECK
.endif

.if PLATFORM = diskio::platform::COMMODORE_16
calibinits:
    .if COUPLED_TIMERS
            ldx #$ff

            lda TED_CHARGEN_ADDR
            and #FORCE_SINGLE_CLOCK
            pha
            bne :+
            lda #FORCE_SINGLE_CLOCK
            php
            sei
            ora TED_CHARGEN_ADDR
            sta TED_CHARGEN_ADDR
            plp

:           stx TED_COUNTER1_LO
            stx TED_COUNTER1_HI
            stx TED_COUNTER2_LO
            stx TED_COUNTER2_HI

            pla
            bne :+
            lda #.lobyte(~FORCE_SINGLE_CLOCK)
            php
            sei
            and TED_CHARGEN_ADDR
            sta TED_CHARGEN_ADDR
            plp
:
    .else
            jsr readcycles
            sta prvcycslo
            stx prvcycsmid
            sty prvcycshi
    .endif
.else
            lda #$ff
            sta CIA2_TA_LO
            sta CIA2_TA_HI
            sta CIA2_TB_LO
            sta CIA2_TB_HI
            lda #FORCE_LOAD | CONTINUOUS | COUNT_TA_UNDF | TIMER_START
            sta CIA2_CRB
            lda CIA2_CRA
            and #.lobyte(~(COUNT_CNT | ONE_SHOT))
            ora #FORCE_LOAD | CONTINUOUS | TIMER_START
            sta CIA2_CRA
.endif
            rts

            ; in: x/y - number of bytes transferred
printstat:
.if PLATFORM = diskio::platform::COMMODORE_16

            stx statxbuf
            sty statybuf

    .if COUPLED_TIMERS
            lda TED_CHARGEN_ADDR
            and #FORCE_SINGLE_CLOCK
            pha
            bne :+
            lda #FORCE_SINGLE_CLOCK
            php
            sei
            ora TED_CHARGEN_ADDR
            sta TED_CHARGEN_ADDR
            plp

:           ldy TED_COUNTER1_HI
            ldx TED_COUNTER2_HI
            lda TED_COUNTER1_LO
            sta :+ + 1
            lda TED_COUNTER2_LO
            cpy TED_COUNTER1_HI
            bne :-
            cpx TED_COUNTER2_HI
            bne :-
            pha; TED_COUNTER2_LO
            eor #$ff
            sbc #70; empirically found offset
            sta numcycles + $00
            txa; TED_COUNTER2_HI
            eor #$ff
            sbc #$00
            sta numcycles + $01
            pla; TED_COUNTER2_LO
:           sbc #$00; TED_COUNTER1_LO
            sta numcycles + $02
            lda #$00
            sta numcycles + $03

            pla
            bne :+
            lda #.lobyte(~FORCE_SINGLE_CLOCK)
            php
            sei
            and TED_CHARGEN_ADDR
            sta TED_CHARGEN_ADDR
            plp
:
    .else
        .if NO_SPRITES_OR_IRQ
            ; no speed measurement without IRQs nor coupled timers
            rts
        .endif

            jsr diffcycles
    .endif
            PUSH_MEMCONFIG_AND_ENABLE_ALL_ROM

.else; PLATFORM <> diskio::platform::COMMODORE_16

            lda #.lobyte(~TIMER_START)
            and CIA2_CRA
            sta CIA2_CRA
            lda #TIMER_STOP
            sta CIA2_CRB

            PUSH_MEMCONFIG_AND_ENABLE_ALL_ROM

            sec
            lda #$ff - 31; subtract overhead
            sbc CIA2_TA_LO
            sta numcycles + $00
            lda #$ff
            sbc CIA2_TA_HI
            sta numcycles + $01
            lda #$ff
            sbc CIA2_TB_LO
            sta numcycles + $02
            lda #$ff
            sbc CIA2_TB_HI
            sta numcycles + $03

            stx statxbuf
            sty statybuf

.endif; PLATFORM <> diskio::platform::COMMODORE_16

            ; print kB/s figure
            lda #0
            sta DFLTO

.if NO_SPRITES_OR_IRQ
            lda #.lobyte(printstatb)
            sta IBSOUT
            lda #.hibyte(printstatb)
            sta IBSOUT + 1

            lda #.lobyte(BITMAP + (8 * (SCREEN_ROWS - 1) * SCREEN_COLUMNS))
            pha
            lda #.hibyte(BITMAP + (8 * (SCREEN_ROWS - 1) * SCREEN_COLUMNS))
            pha
.else
            ldx #$00
            ldy #$01
            jsr setplotxy
            ; buffer pointer to stats
            lda POINTERS + $02
            pha
            lda POINTERS + $03
            pha
.endif

statxbuf = * + $01
            lda #$00; number of bytes transferred
statybuf = * + $01
            ldy #$00
            jsr GIVAYF; fac#1 = numbytes

            lda #.lobyte(cyclesperd)
            ldy #.hibyte(cyclesperd)
            jsr FMULT; fac#1 *= cycles per 1/10 seconds
            jsr MOVAF; fac#2 = fac#1

            lda numcycles + $00
            ora numcycles + $01
            ora numcycles + $02
            ora numcycles + $03
            bne :+
            inc numcycles + $00
:           INT32TOFAC numcycles; fac#1 = numcycles

            jsr FDIVT; fac#1 = fac#2 / numcycles

            jsr FADDH; fac#1 += 0.5
            jsr MOVAF; fac#2 = fac#1

            ldx #$00
            lda #.lobyte(hundred)
            ldy #.hibyte(hundred)
            jsr FDIVM; fac#1 = fac#2 / 100

            ; fac#1 = cyclespersecond * numbytes / numcycles / 1000
            jsr FOUT

            ; truncate to 2 decimals (floored rounding)
            ldy #$00
:           lda FBUFFR + 1,y
            beq :+
            iny
            cmp #'.'
            bne :-
            iny
            iny
:           lda #0
            sta FBUFFR + 1,y
.if !NO_SPRITES_OR_IRQ
            sty statlen
.endif
            ; restore pointer to sprite bitmap
            pla
            sta POINTERS + 3
            pla
            sta POINTERS + 2

            ldx #TESTNAMEPOS; num chars
            lda statxbuf
            ora statybuf
            beq :+

            ldx #.lobyte(FBUFFR + 1)
            ldy #.hibyte(FBUFFR + 1)
            jsr plottext

            ldx #.lobyte(kbstext)
            ldy #.hibyte(kbstext)
            jsr plottext

.if NO_SPRITES_OR_IRQ
:
.else; NO_SPRITES_OR_IRQ
            sec
            lda #TESTNAMEPOS; num chars
statlen = * + 1
            sbc #0
            sbc #5; length of " kB/s"
            tax
            beq :++
            bmi :++
:           lda #' '
            jsr BSOUT
            dex
            bne :-
:
            lda bsout + 1
            sta IBSOUT
            lda bsout + 2
            sta IBSOUT + 1

            lda statxbuf
            ora statybuf
            beq nokbscons

            CONSOLE kbsspcmsg
            CONSOLE FBUFFR + 1
            CONSOLE kbscoltext
.if PLATFORM = diskio::platform::COMMODORE_64
            lda PNTR
            beq :+
            cmp #SCREEN_COLUMNS
            bne :++
:           inc consoletime
            jmp nonewline
:
.endif
nokbscons:  CONSOLE returnmsg
nonewline:
.endif; NO_SPRITES_OR_IRQ

            lda #.lobyte(printstatc)
            sta IBSOUT
            lda #.hibyte(printstatc)
            sta IBSOUT + 1

            POP_MEMCONFIG
            rts

error:      sei
            sta errora + 1
            stx errorx + 1
            sty errory + 1
            DISABLE_MEMCONFIG_CHECK
.if PLATFORM = diskio::platform::COMMODORE_16
            sta TED_ROM_ENABLE
.elseif PLATFORM <> diskio::platform::COMMODORE_128
            lda #MEMCONFIG_IO_KERNAL
            sta IO_PORT
.endif; PLATFORM <> diskio::platform::COMMODORE_128
            tsx
            dex
            dex
            txs
            pla
            sec
            sbc #$02
            sta erroraddrl + 1
            pla
            cli
            sbc #$00
            sta erroraddrh + 1

errora:     lda #$00
errorx:     ldx #$00
errory:     ldy #$00
            ; print error message
            lsr putchar + 1
            jsr prntmsgadr
            lda bsout + 1
            sta IBSOUT
            lda bsout + 2
            sta IBSOUT + 1
            jsr timestamp
            lda #PETSCII_RED
            jsr BSOUT
            sec
            ror putchar + 1
            lda errora + 1
            ldx errorx + 1
            ldy errory + 1
            jsr prntmsgadr
.if PLATFORM = diskio::platform::COMMODORE_128
            jsr SWAPPER
            jsr timestamp
            lda #PETSCII_RED
            jsr BSOUT
            sec
            ror putchar + 1
            lda errora + 1
            ldx errorx + 1
            ldy errory + 1
            jsr prntmsgadr
.endif; PLATFORM = diskio::platform::COMMODORE_128

errorhalt:  jsr waitvbl
            php
            sei
            lda #COLOUR_RED
            sta BORDERCOLOUR
            sta bordercol + 1
            plp
            lda #.lobyte(~MULTICOLOUR_MODE)
.if PLATFORM = diskio::platform::COMMODORE_16
            and TED_CTRL2
            sta TED_CTRL2
.else
            and VIC2_CTRL2
            sta VIC2_CTRL2
.endif
errorhaltl: ldy #12
:           jsr waitvbl
            dey
            bne :-
            lda #COLOUR_RED ^ COLOUR_BLACK
            eor BORDERCOLOUR
            php
            sei
            sta BORDERCOLOUR
            sta bordercol + 1
            plp
.if PLATFORM = diskio::platform::COMMODORE_128
            lda #VRT
:           bit VDC_SR
            beq :-
            lda #FG_BG
            sta VDC_CR
            lda #RED
:           bit VDC_SR; wait until update ready
            bpl :-
            eor VDC_DR
            sta VDC_DR
.endif; PLATFORM = diskio::platform::COMMODORE_128
            jmp errorhaltl

.if PLATFORM = diskio::platform::COMMODORE_128
:           jsr bsout
            ldx dualheadx + 1
            rts

dualhead:   stx dualheadx + 1
            ldx DFLTO
            cpx #8
            bcs :-
            sta :+ + 1
            jsr bsout
            jsr SWAPPER
:           lda #0
            jsr bsout
            jsr SWAPPER
dualheadx:  ldx #0
            rts
.endif; PLATFORM = diskio::platform::COMMODORE_128

consoleout:
.if PLATFORM = diskio::platform::COMMODORE_128
            tax
            pha
            tya
            pha
            lda consoletime
            pha
            txa
            jsr doconsout
            jsr SWAPPER
            pla
            sta consoletime
            pla
            tay
            pla
            jsr doconsout
            jmp SWAPPER
doconsout:
.endif; PLATFORM = diskio::platform::COMMODORE_128

            sta POINTERS + $00
            sty POINTERS + $01

            PUSH_MEMCONFIG_AND_ENABLE_ALL_ROM

            lda #DEVICE_SCREEN
            sta DFLTO
            lda #$00
            sta QTSW; disable quote mode
consoletime = * + $01
            lda #$00
            beq notimestmp; don't print timestamp if 0
            lda #$00
            sta consoletime
            jsr timestamp
notimestmp:

.if PLATFORM = diskio::platform::COMMODORE_128
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | LOW_RAM | IO_SPACE
            sta MMU_CR
.elseif PLATFORM <> diskio::platform::COMMODORE_16
            lda #MEMCONFIG_IO_KERNAL
            sta IO_PORT
.endif
            ldy #$00
:
            lda (POINTERS + $00),y
            beq :++
            pha
            jsr BSOUT
            pla
            cmp #PETSCII_RETURN
            bne :+
            inc consoletime
:           iny
            bne :--
:
            POP_MEMCONFIG
            rts

timestamp:  lda #$00
            sta QTSW; disable quote mode
            lda PNTR
            beq :+
.if PLATFORM = diskio::platform::COMMODORE_64
            cmp #SCREEN_COLUMNS
            beq :+
.endif
            lda #PETSCII_RETURN
            jsr BSOUT
:           lda #PETSCII_LIGHTBLUE
            jsr BSOUT
.if PLATFORM = diskio::platform::COMMODORE_16
            lda tod_hrs
.else
            lda #%00011111
            and CIA1_TOD_HRS
prevhours:  cmp #$00
            sta prevhours + 1
            bcs :+
            lda #$12
            php
            sei
            sed
            adc hoursbase + 1
            plp
            sta hoursbase + 1
            lda prevhours + 1
:           clc
            php
            sei
            sed
hoursbase:  adc #$00
            plp
            cmp #0
.endif
            beq :+
            jsr putconbyte
            lda #':'
            jsr BSOUT
:
.if PLATFORM = diskio::platform::COMMODORE_16
            lda tod_mins
.else
            lda CIA1_TOD_MIN
.endif
            jsr putconbyte
            lda #':'
            jsr BSOUT
.if PLATFORM = diskio::platform::COMMODORE_16
            lda tod_secs
.else
            lda CIA1_TOD_SEC
.endif
            jsr putconbyte
.if PLATFORM <> diskio::platform::COMMODORE_16
            bit CIA1_TOD_10S; to free the latch
.endif
            lda #'.'
            jsr BSOUT
.if PLATFORM = diskio::platform::COMMODORE_16
            lda tod_10s
.else
            lda CIA1_TOD_10S
.endif
            jsr putconibbl
            lda #' '
            jmp BSOUT

putconword: txa
            pha
            tya
            jsr putconbyte
            pla

putconbyte: tax
            lsr
            lsr
            lsr
            lsr
            cmp #10
            bcc :+
            adc #'a' - '0' - 10 - 1
:           adc #'0'
            jsr BSOUT
            txa
putconibbl: and #%00001111
            cmp #10
            bcc :+
            adc #'a' - '0' - 10 - 1
:           adc #'0'
            jmp BSOUT

prntmsgadr: cmp #ERRBRKOPC
            beq :+
            sec; with address
            SKIPBYTE

printmsg:   clc
            sta printa
:           stx printx
            sty printy

            tax
            lda errormsgsl,x
            sta POINTERS + $00
            lda errormsgsh,x
            sta POINTERS + $01

            lda putchar + 1
            bmi :+

            lda #.lobyte(BITMAP)
            sta POINTERS + $02
            lda #.hibyte(BITMAP)
            sta POINTERS + $03
            lda #$00
            tay
clearline:  sta BITMAP + $00,y
            sta BITMAP + $40,y
            iny
            bne clearline

            lda #1
:           sta putchar + 1
            tay
            bne :+
.if PLATFORM = diskio::platform::COMMODORE_16
            lda TED_SCREEN_ADDR
            and #.lobyte(~SCREEN_ADDR_MASK)
            ora #MAKE_SCREEN_ADDR($0800)
            sta TED_SCREEN_ADDR
            lda #.hibyte($0c00)
.else
            lda #VIC2_MAKE_ADDR($0400, CHARSET_ADDR_UPPERLOWER)
            sta VIC2_ADDR
            lda #.hibyte($0400)
.endif
            sta POINTERS + $03

:
.if PLATFORM = diskio::platform::COMMODORE_16
            PUSH_MEMCONFIG_AND_ENABLE_ALL_ROM
.elseif PLATFORM = diskio::platform::COMMODORE_128
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | LOW_RAM | RAM_ROM
            bit putchar + 1
            bpl :+
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | LOW_RAM | IO_SPACE
:           sta MMU_CR
.else; PLATFORM <> diskio::platform::COMMODORE_128
            lda #IO_PORT_DIRECTION_DEFAULT
            sta IO_PORT_DIRECTION
            lda #MEMCONFIG_IO_KERNAL
            sta IO_PORT
.endif; PLATFORM <> diskio::platform::COMMODORE_128

            txa
            pha
            eor #MSGUNINST
            beq doprintmsg
            bcc :+
            lda #'@'
            jsr putchar
erroraddrh: lda #$00
            jsr puthex
erroraddrl: lda #$00
            jsr puthexnum
            lda #' '
            jsr putchar
:
            lda #'A'
            jsr putchar
            lda #'='
            jsr putchar
printa = * + 1
            lda #0
            jsr puthex

            lda #' '
            jsr putchar
            lda #'X'
            jsr putchar
            lda #'='
            jsr putchar
printx = * + 1
            lda #$00
            jsr puthex
            lda #' '
            jsr putchar
            lda #'Y'
            jsr putchar
            lda #'='
            jsr putchar
printy = * + 1
            lda #$00
            jsr puthex
            lda #':'
            jsr putchar
            lda #' '
            jsr putchar

            lda #$00
            sta doprintmsg + 1
doprintmsg: ldy #$00
            lda (POINTERS + $00),y
            beq :+
            jsr putchar
            inc doprintmsg + 1
            bne doprintmsg
:           pla
            cmp #ERRBRKOPC
            bne :+

brkaddrhi = * + $01
            lda #$00
            jsr puthexnum
brkaddrlo = * + $01
            lda #$00
            jsr puthexnum
            lda #'.'
            jsr putchar
:
.if PLATFORM = diskio::platform::COMMODORE_16
            POP_MEMCONFIG
.elseif PLATFORM = diskio::platform::COMMODORE_128
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | LOW_RAM | IO_SPACE
            sta MMU_CR
.else; PLATFORM <> diskio::platform::COMMODORE_128
            lda #MEMCONFIG_IO_KERNAL
            sta IO_PORT
.endif; PLATFORM <> diskio::platform::COMMODORE_128
            rts

tohex:      tay
            lsr
            lsr
            lsr
            lsr
            cmp #10
            bcc :+
            adc #.lobyte('a' - '0' + $80 - 10 - 1)
:           adc #'0'
            tax
            tya
            and #%00001111
            cmp #10
            bcc :+
            adc #.lobyte('a' - '0' + $80 - 10 - 1)
:           adc #'0'
            rts

puthex:     tax
            lda #'$'
            jsr putchar
            txa
puthexnum:  jsr tohex
            pha
            txa
            jsr putchar
            pla

putchar:    ldy #$00
            bpl :+
            jmp bsout

:           jsr petsciiscr
            ldy putchar + 1
            bne plotbitmap

            ; print char to screen
            sta (POINTERS + $02),y
            lda POINTERS + $03
            pha
            and #%00000011
.if PLATFORM = diskio::platform::COMMODORE_16
            ora #.hibyte($0800)
            sta POINTERS + $03
            lda #COLOUR_WHITE | INTENSITY_7
            sta (POINTERS + $02),y
.elseif PLATFORM = diskio::platform::COMMODORE_128
            ora #.hibyte(VIC2_COLOURRAM)
            sta POINTERS + $03
            lda MMU_CR
            pha
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | LOW_RAM | IO_SPACE
            sta MMU_CR
            lda #COLOUR_WHITE
            sta (POINTERS + $02),y
            pla
            sta MMU_CR
.else; PLATFORM <> diskio::platform::COMMODORE_128
            ora #.hibyte(VIC2_COLOURRAM)
            sta POINTERS + $03
            lda IO_PORT
            pha
            lda #MEMCONFIG_IO
            sta IO_PORT
            lda #COLOUR_WHITE
            sta (POINTERS + $02),y
            pla
            sta IO_PORT
.endif; PLATFORM <> diskio::platform::COMMODORE_128

            pla
            sta POINTERS + $03
            inc POINTERS + $02
            rts

            ; plot char to bitmap
plotbitmap:
.if PLATFORM = diskio::platform::COMMODORE_64
            tay
            lda IO_PORT
            pha
            lda #MEMCONFIG_CHARGEN
            sta IO_PORT
            tya
.endif
            ldy #$00
            sty POINTERS + $05
            asl
            rol POINTERS + $05
            asl
            rol POINTERS + $05
            asl
            rol POINTERS + $05
            sta POINTERS + $04
            lda #.hibyte(ROM_CHARSET_UPLOW)
            adc POINTERS + $05
            sta POINTERS + $05
            ldy #$07
:           lda (POINTERS + $04),y
            sta (POINTERS + $02),y
            dey
            bpl :-
            clc
            lda #$08
            adc POINTERS + $02
            sta POINTERS + $02
            bcc :+
            inc POINTERS + $03
:
.if PLATFORM = diskio::platform::COMMODORE_64
            pla
            sta IO_PORT
.endif
            rts

            ; in: a - length in pages
            ;     x - destination hibyte
memclear:   stx POINTERS + $01
            ldy #$00
            sty POINTERS + $00
            tax
            PUSH_MEMCONFIG_AND_ENABLE_ALL_RAM
            tya
memclrlp:   sta (POINTERS + $00),y
            iny
            bne memclrlp
            inc POINTERS + $01
            dex
            bne memclrlp
            POP_MEMCONFIG
            rts

            ; in: a - length in pages
            ;     x - source hibyte
            ;     y - destination hibyte
memcopy:    stx POINTERS + $01
            sty POINTERS + $03
            ldy #$00
            sty POINTERS + $00
            sty POINTERS + $02
            tax
memcpylp:   lda (POINTERS + $00),y
            sta (POINTERS + $02),y
            iny
            bne memcpylp
            inc POINTERS + $01
            inc POINTERS + $03
            dex
            bne memcpylp
            rts

            .import __SWAPBUFFER_LOAD__

            .pushseg
            .segment "SWAPBUFFER"
            .popseg

.if VERIFY

COMPDATA = __SWAPBUFFER_LOAD__
COMPBMP  = COMPDATA

verifyfail: tya
            jsr tohex
            sta verifysrc + $03
            stx verifysrc + $02
            sta verifydest + $03
            stx verifydest + $02
            lda POINTERS + $02
            jsr tohex
            sta verifysrc + $01
            stx verifysrc + $00
            lda POINTERS + $04
            jsr tohex
            sta verifydest + $01
            stx verifydest + $00
            pla
            pla
            lda #MSGVERIFAIL
            jmp error

piccopy:
.if LOAD_TO_UPPER_MEM
            PUSH_MEMCONFIG_AND_ENABLE_ALL_RAM
.endif
            MEMCOPY BITMAP, COMPBMP, ALIGN BITMAP_SIZE, $0100
.if LOAD_TO_UPPER_MEM
            POP_MEMCONFIG
.endif
            rts

piccomp:
.if LOAD_TO_UPPER_MEM
            PUSH_MEMCONFIG_AND_ENABLE_ALL_RAM
.endif
            MEMCOMP BITMAP, COMPBMP, ALIGN BITMAP_SIZE, $0100
.if LOAD_TO_UPPER_MEM
            php
            pla
            tax
            POP_MEMCONFIG
            txa
            pha
            plp
.endif
            rts

            ; in: POINTERS + $00 - lobyte of length
            ;     a - hibyte of length
            ;     x - memory area 1 hibyte
            ;     y - memory area 2 hibyte
memcomp:    stx POINTERS + $02
            sty POINTERS + $04
            ldy #$00
            sty POINTERS + $01
            sty POINTERS + $03
            tax
memcmplp:   lda (POINTERS + $01),y
            cmp (POINTERS + $03),y
            bne memcmpne
            iny
            bne memcmplp
            inc POINTERS + $02
            inc POINTERS + $04
            dex
            bne memcmplp
            lda POINTERS + $00
            beq memcmpne
memcmpl1:   lda (POINTERS + $01),y
            cmp (POINTERS + $03),y
            bne memcmpne
            iny
            cpy POINTERS + $00
            bne memcmpl1
memcmpne:   rts

.endif; VERIFY

plothex:    pha
            lsr
            lsr
            lsr
            lsr
            cmp #10
            bcc :+
            adc #'a' - '0' - 10 - 1
:           adc #'0'
            jsr BSOUT
            pla
plotbyte:   and #%00001111
            cmp #10
            bcc :+
            adc #'a' - '0' - 10 - 1
:           adc #'0'
            jmp BSOUT

plottext:   PUSH_MEMCONFIG_AND_ENABLE_ALL_ROM
            stx POINTERS + $00
            sty POINTERS + $01

            ldy #$00
plotloop:   lda (POINTERS + $00),y
            beq plotend
            jsr petsciiscr
            cmp #$1f; scrcode "_" fix
            bne :+
            lda #$64
:           jsr BSOUT
            iny
            bne plotloop

plotend:    POP_MEMCONFIG
            rts

petsciiscr: ; convert to screen code
            cmp #$60
            bcc :+
            and #%01011111
            SKIPWORD
:           and #%00111111
            rts

printword:
.if PLATFORM = diskio::platform::COMMODORE_128
            pha
            ENABLE_ALL_ROM
            pla
            tay
            txa
            pha
            tya
            pha
.endif; PLATFORM = diskio::platform::COMMODORE_128
            jsr LINPRT
.if PLATFORM = diskio::platform::COMMODORE_128
            jsr SWAPPER
            pla
            tay
            pla
            tax
            tya
            jsr LINPRT
            jsr SWAPPER
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | LOW_RAM | IO_SPACE
            sta MMU_CR
.endif; PLATFORM = diskio::platform::COMMODORE_128
            rts

.if PLATFORM = diskio::platform::COMMODORE_16

setplotxy:  txa
            pha
            lda #.lobyte(COLRAM + $0fe8)
            ldx #.hibyte(COLRAM + $0fe8)
            cpy #$00
            beq :+
            ; second stats char line
            lda #.lobyte(COLRAM + $0c10)
            ldx #.hibyte(COLRAM + $0c10)
:           sta POINTERS + $02
            stx POINTERS + $03
            pla
            clc
            adc POINTERS + $02
            sta POINTERS + $02
            bcc :+
            inc POINTERS + $03
:           rts

.if NO_SPRITES_OR_IRQ
printstatb: stx printxbuf
            sty printybuf
            jsr plotbitmap
printxbuf = * + $01
            ldx #$00
            jmp printstatr
.endif

printstatc: sty printybuf
            pha
            lda DFLTO
            beq :+
            pla
bsout:      jmp $00
:           pla
            ldy #$00
            sta (POINTERS + $02),y
            inc POINTERS + $02
            bne :+
            inc POINTERS + $03
:
printstatr:
printybuf = * + $01
            ldy #$00
            clc
            rts

.else; PLATFORM <> diskio::platform::COMMODORE_16

setplotxy:  clc
            lda plotxposlo,x
            adc plotypos,y
            sta POINTERS + $02
            lda plotxposhi,x
            sta POINTERS + $03
            rts

plotxposlo: .lobytes SPRITES + $0000, SPRITES + $0001, SPRITES + $0002
            .lobytes SPRITES + $0040, SPRITES + $0041, SPRITES + $0042
            .lobytes SPRITES + $0080, SPRITES + $0081, SPRITES + $0082
            .lobytes SPRITES + $00c0, SPRITES + $00c1, SPRITES + $00c2
            .lobytes SPRITES + $0100, SPRITES + $0101, SPRITES + $0102
            .lobytes SPRITES + $0140, SPRITES + $0141, SPRITES + $0142
            .lobytes SPRITES + $0180, SPRITES + $0181, SPRITES + $0182
            .lobytes SPRITES + $01c0, SPRITES + $01c1, SPRITES + $01c2
plotxposhi: .hibytes SPRITES + $0000, SPRITES + $0001, SPRITES + $0002
            .hibytes SPRITES + $0040, SPRITES + $0041, SPRITES + $0042
            .hibytes SPRITES + $0080, SPRITES + $0081, SPRITES + $0082
            .hibytes SPRITES + $00c0, SPRITES + $00c1, SPRITES + $00c2
            .hibytes SPRITES + $0100, SPRITES + $0101, SPRITES + $0102
            .hibytes SPRITES + $0140, SPRITES + $0141, SPRITES + $0142
            .hibytes SPRITES + $0180, SPRITES + $0181, SPRITES + $0182
            .hibytes SPRITES + $01c0, SPRITES + $01c1, SPRITES + $01c2
plotypos:   .byte $00 * $03, $08 * $03, $10 * $03

.if NO_SPRITES_OR_IRQ
printstatb: sta POINTERS + $05
            txa
            pha
            tya
            pha
    .if PLATFORM = diskio::platform::COMMODORE_128
            lda MMU_CR
            pha
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | LOW_RAM | RAM_ROM
            sta MMU_CR
    .else; PLATFORM <> diskio::platform::COMMODORE_128
            lda IO_PORT
            pha
            lda #MEMCONFIG_CHARGEN
            sta IO_PORT
    .endif; PLATFORM <> diskio::platform::COMMODORE_128

            lda POINTERS + $05
            jsr plotbitmap
            jmp printstatr
.endif

printstatc: sta POINTERS + $05
            lda DFLTO
            beq :+
            lda POINTERS + $05
bsout:      jmp $00
:           txa
            pha
            tya
            pha
    .if PLATFORM = diskio::platform::COMMODORE_128
            lda MMU_CR
            pha
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | LOW_RAM | RAM_ROM
            sta MMU_CR
    .else; PLATFORM <> diskio::platform::COMMODORE_128
            lda IO_PORT
            pha
            lda #MEMCONFIG_CHARGEN
            sta IO_PORT
    .endif; PLATFORM <> diskio::platform::COMMODORE_128

            lda POINTERS + $05
            ldy #$00
            sty POINTERS + $05
            asl
            rol POINTERS + $05
            asl
            rol POINTERS + $05
            asl
            sta POINTERS + $04
            lda POINTERS + $05
            rol
            adc #.hibyte(CHARSET_ADDR_UPPERLOWER)
            sta POINTERS + $05

            ldx #$08
:           lda (POINTERS + $04),y
            sta (POINTERS + $02),y
            iny
            inc POINTERS + $02
            inc POINTERS + $02
            dex
            bne :-

            lda POINTERS + $02
            sbc #$0e
            sta POINTERS + $02

            and #%00111111
            cmp #$03
            beq :+
            cmp #$03 + $08 * 3
            bne :++
:           lda #$40 - 3 - 1
            adc POINTERS + $02
            sta POINTERS + $02
            bcc :+
            inc POINTERS + $03
:
printstatr:
            pla
    .if PLATFORM = diskio::platform::COMMODORE_128
            sta MMU_CR
    .else; PLATFORM <> diskio::platform::COMMODORE_128
            sta IO_PORT
    .endif; PLATFORM <> diskio::platform::COMMODORE_128
            pla
            tay
            pla
            tax
            rts

.endif; PLATFORM <> diskio::platform::COMMODORE_16

.if PLATFORM = diskio::platform::COMMODORE_16

ramirq:     pha
            txa
            pha
            tya
            pha
            sta TED_ROM_BANK_0
            tsx
            inx
            inx
            inx
            inx
            lda STACK,x
            and #BREAK
            bne :+
            jmp (CINV)
:           jmp (CBINV)

clockirq:   LOADER_IRQ_HANDLER_PROLOGUE

            jsr update_clk
            jmp irqendx

            ; IRQ handler to switch on bitmap mode after the upper border area

irq0:       LOADER_IRQ_HANDLER_PROLOGUE

            lda #INVALID_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_3
            sta TED_CTRL1; set scrolly

consolswtc: lda #0
            beq :+

            ; display console
            lda #CHARSET_BITMAP_IN_ROM
            ora TED_BITMAP_ADDR
            tax
            lda TED_SCREEN_ADDR
            and #.lobyte(~SCREEN_ADDR_MASK)
            ora #MAKE_SCREEN_ADDR($0c00)
            ldy #TEXT_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_3
            bne :++

:           lda #.lobyte(~(CHARSET_BITMAP_IN_ROM))
            and TED_BITMAP_ADDR
            tax
            lda TED_SCREEN_ADDR
            and #.lobyte(~SCREEN_ADDR_MASK)
            ora #MAKE_SCREEN_ADDR(COLRAM)
            ldy #BITMAP_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_3
:           stx TED_BITMAP_ADDR
            sta TED_SCREEN_ADDR

:           lda TED_RASTERLINE_MSB
            lsr
            bcs :-
            lda #$01
:           cmp TED_RASTERLINE
            bcs :-
            nop
            nop
            STABILIZE_RASTER

            ldx #$07
:           dex
            bne :-

            sty TED_CTRL1; disable invalid mode

            lda #.lobyte(SCREEN_SIZE)
            sta TED_CURSOR_LO
            lda #.hibyte(SCREEN_SIZE)
            sta TED_CURSOR_HI

            lda #.lobyte(~IRQ_RASTERLINE_MSB)
            and TED_IMR
            sta TED_IMR

            ldx #1
            lda consolswtc + 1
            beq :+
            dex
            stx BORDERCOLOUR
:           stx setborder + 1
            txa
            beq :+
            lda bordercol + 1
            cmp BORDERCOLOUR
            beq :+
            sta BORDERCOLOUR
:
            ; the last piture display line is 200 + 3 - 1 = 202 ($ca),
            ; at the end of it, set the raster count back
            ; to 203 - 17 = 186 = $ba (NTSC) or
            ; to 203 - 33 = 170 = $aa (PAL)
            sec
            lda #$c7
            sbc IRQSLACK
            ldx #.lobyte(irq1)
            ldy #.hibyte(irq1)
            jmp irqend

            ; IRQ handler to extend the screen

irq1:       LOADER_IRQ_HANDLER_PROLOGUE

            lda #$b0
            sta TED_CURSOR_LO
            lda #$00
            sta TED_CURSOR_HI

            lda #$10; NTSC
            ldx palntsc
            beq :+
            lda #$18; PAL
:           sta lineoffset

            lda #$c9
:           cmp TED_RASTERLINE
            bcs :-
            ; $ca
            nop
            nop
            STABILIZE_RASTER

            inc TED_CTRL1
            lda TED_SCREEN_ADDR
            and #.lobyte(~SCREEN_ADDR_MASK)
            ora #MAKE_SCREEN_ADDR(COLRAM + $0800)
            sta TED_SCREEN_ADDR
            sec
            lda TED_RASTERLINE; $ca
lineoffset = * + 1
            sbc #$00; $10 (NTSC) or $18 (PAL)
            sta TED_RASTERLINE
            ldx #$08
:           dex
            bne :-
            lda #CHARSET_BITMAP_IN_ROM
            ora TED_BITMAP_ADDR
            sta TED_BITMAP_ADDR
            lda #INVALID_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_4
            sta TED_CTRL1; hide garbage
            lda TED_CHARGEN_ADDR
            and #.lobyte(~CHARGEN_ADDR_MASK)
            ora #MAKE_CHARGEN_ADDR(CHARSET_ADDR_UPPERLOWER)
            sta TED_CHARGEN_ADDR

            lda #TEXT_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_4
            sta TED_CTRL1; switch to text mode
            lda #$07
            ora TED_VERTSUBCOUNT
            sta TED_VERTSUBCOUNT
            lda #.lobyte(~MULTICOLOUR_MODE)
            and TED_CTRL2
            sta TED_CTRL2

            sec
            lda #$da
            sbc lineoffset; PAL: $da - $18 = $c2
            ldx IRQSLACK
            bne :+
            sbc IRQSLACK
            ldx #.lobyte(irq2)
            ldy #.hibyte(irq2)
            jmp irqend

:           cmp TED_RASTERLINE
            bcs :-
            jmp irq2main

            ; this handler is called just before the 2nd extra char row has finished displaying

irq2:       LOADER_IRQ_HANDLER_PROLOGUE

irq2main:   lda TED_CHARGEN_ADDR
            and #.lobyte(~CHARGEN_ADDR_MASK)
            ora #MAKE_CHARGEN_ADDR(COLRAM + $0c00)
            tax
            sec
            lda #$db
            sbc lineoffset
            tay

            lda palntsc
            bne :+++; branch if PAL

            ; NTSC
:           cpy TED_RASTERLINE
            bcs :-
            nop
            nop
            STABILIZE_RASTER

            lda #INVALID_MODE | DISPLAY_ENABLE | LINES_24 | SCROLLY_4
            sta TED_CTRL1; open border
            ldy #$06
:           dey
            bne :-
            nop
            lda #.lobyte(~CHARSET_BITMAP_IN_ROM)
            and TED_BITMAP_ADDR
            jmp :+++

:           lda #.lobyte(~CHARSET_BITMAP_IN_ROM)
            and TED_BITMAP_ADDR
:           cpy TED_RASTERLINE
            bcs :-

:           stx TED_CHARGEN_ADDR
            sta TED_BITMAP_ADDR

            lda palntsc
            beq ntscborder

            lda TED_CHARGEN_ADDR
            and #.lobyte(~CHARGEN_ADDR_MASK)
            ora #MAKE_CHARGEN_ADDR(COLRAM + $0c00)
            sta TED_CHARGEN_ADDR

            lda #$ca
            ldx IRQSLACK
            bne :+
            sec
            sbc IRQSLACK
            ldx #.lobyte(irq3)
            ldy #.hibyte(irq3)
            jmp irqend

:           cmp TED_RASTERLINE
            bcs :-
            jmp irq3main

            ; this handler is called just before the 3rd extra char row has finished displaying

irq3:       LOADER_IRQ_HANDLER_PROLOGUE

irq3main:   lda #FORCE_SINGLE_CLOCK
            ora TED_CHARGEN_ADDR
            sta TED_CHARGEN_ADDR

            lda #$ca
:           cmp TED_RASTERLINE
            bcs :-

            lda #INVALID_MODE | DISPLAY_ENABLE | LINES_24 | SCROLLY_4
            sta TED_CTRL1; open border

            lda TED_RASTERLINE
:           cmp TED_RASTERLINE
            beq :-
            nop
            STABILIZE_RASTER

ntscborder: lda TED_SCREEN_ADDR
            and #.lobyte(~SCREEN_ADDR_MASK)
            ora #MAKE_SCREEN_ADDR(COLRAM)
            sta TED_SCREEN_ADDR
            lda #.lobyte(~CHARSET_BITMAP_IN_ROM)
            and TED_BITMAP_ADDR
            sta TED_BITMAP_ADDR
            lda palntsc
            bne :++
            ldx #$08
:           dex
            bne :-
:           clc
            lda lineoffset
            adc TED_RASTERLINE
            sta TED_RASTERLINE

            jsr update_clk

            lda TED_CHARGEN_ADDR
            and #.lobyte(~(CHARGEN_ADDR_MASK | FORCE_SINGLE_CLOCK))
            ora #MAKE_CHARGEN_ADDR(COLRAM + $0c00)
            tax
            lda #ALL_COLUMNS
            sta PIO_KEYBOARD_COLUMN
            sta TED_KEYBOARD_LATCH
            lda TED_KEYBOARD_LATCH
            eor #NO_ROWS
            sta consolswtc + 1
            beq :+
            lda TED_CHARGEN_ADDR
            and #.lobyte(~CHARGEN_ADDR_MASK)
            ora #MAKE_CHARGEN_ADDR(CHARSET_ADDR_UPPERLOWER)
            tax
:           stx TED_CHARGEN_ADDR

            lda IRQSLACK
            beq :++
            lda #IRQ_RASTERLINE_MSB
            ora TED_IMR
            sta TED_IMR
            sec
            lda palntsc
            bne :+
            lda #.lobyte(DISPLAY_LINES_NTSC)
            SKIPWORD
:           lda #.lobyte(DISPLAY_LINES_PAL)
            sbc IRQSLACK
:           ldx #.lobyte(irq0)
            ldy #.hibyte(irq0)

irqend:     sta TED_IRQ_RASTERLINE
            stx CINV
            sty CINV + 1
irqendx:    lda #RASTER_IRQ
            sta TED_IRR
irqendy:

memcfgchks = * + $01
            ldx #0
            beq memchkok

    .if !LOAD_VIA_KERNAL_FALLBACK
            lda TED_CHARGEN_ADDR
            lsr
            bcc memchkok
            rol
            tax
            tay
            lda #MSGINVMCONF
            jmp error
    .endif

memchkok:   LOADER_IRQ_HANDLER_EPILOGUE
            pla
            tay
            pla
            tax
            pla
            rti

update_clk:
    .if COUPLED_TIMERS = 0
            jsr readctrfix
            tya
            pha
            txa
            pha
            sec
            lda prevctr3lo
            stx :+ + 1
:           sbc #$00
            tax
            lda prevctr3hi
            sty :+ + 1
:           sbc #$00
            tay
            txa
            clc
            adc cycles_lo
            sta cycles_lo
            tya
            adc cycles_mid
            sta cycles_mid
            bcc :+
            inc cycles_hi

:           pla
            sta prevctr3lo
            pla
            sta prevctr3hi
    .endif; COUPLED_TIMERS = 0

            sed
            ldx #$00
            clc
            lda #$01
            adc tod_frames
            sta tod_frames
            ldy palntsc
            beq :+
            cmp #5
            jmp :++
:           cmp #6
:           bne tod_done
            stx tod_frames
            clc
            lda #$01
            adc tod_10s
            sta tod_10s
            cmp #$10
            bne tod_done
            stx tod_10s
            clc
            lda #$01
            adc tod_secs
            sta tod_secs
            cmp #$60
            bne tod_done
            stx tod_secs
            clc
            lda #$01
            adc tod_mins
            sta tod_mins
            cmp #$60
            bne tod_done
            stx tod_mins
            clc
            lda #$01
            adc tod_hrs
            sta tod_hrs
tod_done:   cld
            rts

    .if COUPLED_TIMERS = 0
readctr:    ldy TED_COUNTER3_HI
            ldx TED_COUNTER3_LO
            cpy TED_COUNTER3_HI
            bne readctr
            rts

readctrfix: lda TED_CHARGEN_ADDR
            and #FORCE_SINGLE_CLOCK
            pha
            bne :+
            lda #FORCE_SINGLE_CLOCK
            php
            sei
            ora TED_CHARGEN_ADDR
            sta TED_CHARGEN_ADDR
            plp
:
            ldx TED_COUNTER3_LO
            ldy TED_COUNTER3_HI
            cpx TED_COUNTER3_LO
            bcs :+
            ldx TED_COUNTER3_LO
            ldy TED_COUNTER3_HI
            nop
            jmp :++
:           txa
            sbc #$0e
            tax
            tya
            sbc #$00
            tay
:
            pla
            bne :+
            lda #.lobyte(~FORCE_SINGLE_CLOCK)
            php
            sei
            and TED_CHARGEN_ADDR
            sta TED_CHARGEN_ADDR
            plp
:           rts

readcycles: lda cycles_hi
            sta cycshibuf
            lda cycles_mid
            sta cycsmidbuf

            lda prevctr3lo
            sta prevctr3lb
            lda prevctr3hi
            sta prevctr3hb

            jsr readctr; counter runs backwards
            stx ctr3lobuf
            sty ctr3hibuf

            ldx cycles_lo
cycsmidbuf = * + $01
            lda #$00
            cmp cycles_mid
            bne readcycles
cycshibuf = * + $01
            lda #$00
            cmp cycles_hi
            bne readcycles

            stx cycslobuf

            sec
prevctr3lb = * + $01
            lda #$00
ctr3lobuf = * + $01
            sbc #$00
            tax
prevctr3hb = * + $01
            lda #$00
ctr3hibuf = * + $01
            sbc #$00
            tay

            clc
            txa
cycslobuf = * + $01
            adc #$00
            pha
            tya
            adc cycsmidbuf
            tax
            lda #$00
            adc cycshibuf
            tay
            pla
            rts

docalibrte: jsr calibinits
            nop; ldx #byteslo
            nop; ldy #byteshi
            nop; jsr printstat
            nop
            nop
            nop; stx statxbuf
            nop
            nop; sty statybuf
            nop
            nop; jsr diffcycles
            nop
            nop

            ; fall through

diffcycles: jsr readcycles

            sec
            sbc prvcycslo
            sta numcycles + $00
            txa
            sbc prvcycsmid
            sta numcycles + $01
            tya
            sbc prvcycshi
            sta numcycles + $02
            lda #$00
            sta numcycles + $03

            sec
            lda numcycles + $00
adjustdiff = * + $01
            sbc #$00
            sta numcycles + $00
            bcs :+
            lda numcycles + $01
            dec numcycles + $01
            tax
            bne :+
            lda numcycles + $02
            dec numcycles + $02
            tax
            bne :+
            dec numcycles + $03
:           rts
    .endif; COUPLED_TIMERS = 0

.else; PLATFORM <> diskio::platform::COMMODORE_16

ramirq:     pha
            txa
            tsx
            pha
            tya
            pha
    .if PLATFORM = diskio::platform::COMMODORE_128
            lda MMU_CR
            pha
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | BASIC_LO | IO_SPACE
            sta MMU_CR
    .endif;  PLATFORM = diskio::platform::COMMODORE_128
            inx
            inx
            lda STACK,x
            and #FLAG_B
            bne :+
            jmp (CINV)
:           jmp (CBINV)

consoleirq:
    .if PLATFORM <> diskio::platform::COMMODORE_128
            lda IO_PORT
            pha
            lda #MEMCONFIG_IO
            sta IO_PORT
    .endif; PLATFORM <> diskio::platform::COMMODORE_128

            lda #0
            sta BORDERCOLOUR

            lda #TEXT_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_3; $3b
            sta VIC2_CTRL1; set 25 rows bit
            ldx #VIC2_MAKE_ADDR($0400, CHARSET_ADDR_UPPERLOWER)
            bit drivetype
            bpl :++; branch if not generic drive
            ; KERNAL fallback active
            ; note: this may glitch due to a race condition, the KERNAL ROM's serial bus code does
            ;       things like lda $dd00 : and/ora #value : sta $dd00, which may be interrupted
            ;       between lda and sta by this IRQ, thus setting the previous VIC bank again
            lda CIA2_PRA
            and #.lobyte(~VIC2_BANK)
            ora #VIC2_MAKE_BANK $0400
            tay
            lda #$09 - 1
:           cmp VIC2_RASTERLINE
            bcs :-
            stx VIC2_ADDR
            sty CIA2_PRA
    .if PLATFORM = diskio::platform::COMMODORE_128
            lda #IO_PORT_CHARGEN_ENABLED
            sta IO_PORT
    .endif; PLATFORM = diskio::platform::COMMODORE_128
            jmp :++
:           stx VIC2_ADDR
            SET_VIC_BANK VIC2_MAKE_BANK $0400
    .if PLATFORM = diskio::platform::COMMODORE_128
            lda #IO_PORT_CHARGEN_ENABLED
            sta IO_PORT
    .endif; PLATFORM = diskio::platform::COMMODORE_128
:
    .if !LOAD_TO_UPPER_MEM
            jmp prepirq

    .else ; LOAD_TO_UPPER_MEM

            sec
            lda #$f8
            sbc IRQSLACK
            ldx #.lobyte(irq1)
            ldy #.hibyte(irq1)
            jmp irqend

            ; IRQ handler to switch back the bank setting,
            ; needed because the sprites are in another
            ; VIC bank than the bitmap

irq0:
        .if PLATFORM <> diskio::platform::COMMODORE_128
            lda IO_PORT
            pha
            lda #MEMCONFIG_IO
            sta IO_PORT
        .endif; PLATFORM <> diskio::platform::COMMODORE_128

            lda #VIC2_MAKE_ADDR COLRAM, BITMAP
            sta VIC2_ADDR
            SET_VIC_BANK VIC2_MAKE_BANK BITMAP

            sec
            lda #$f8
            sbc IRQSLACK
            ldx #.lobyte(irq1)
            ldy #.hibyte(irq1)
            jmp irqend

    .endif; LOAD_TO_UPPER_MEM

            ; IRQ handler to open the y-border
irq1:
    .if PLATFORM <> diskio::platform::COMMODORE_128
            lda IO_PORT
            pha
            lda #MEMCONFIG_IO
            sta IO_PORT
    .endif; PLATFORM <> diskio::platform::COMMODORE_128

    .if USE_2_MHZ
            lda VIC2_C128_CLOCK
            pha
            lda #0
            sta VIC2_C128_CLOCK
    .endif
            lda #$f8
:           bit VIC2_CTRL1
            bmi :+
            cmp VIC2_RASTERLINE
            bcs :-
:
            lda #.lobyte(~LINES_25)
            and VIC2_CTRL1
            sta VIC2_CTRL1

            lda #$f9
:           cmp VIC2_RASTERLINE
            beq :-
            ldx #VIC2_MAKE_ADDR COLRAM, BITMAP
            bit drivetype
            bpl :++; branch if not generic drive
            ; KERNAL fallback active
            ; note: this may glitch due to a race condition, the KERNAL ROM's serial bus code does
            ;       things like lda $dd00 : and/ora #value : sta $dd00, which may be interrupted
            ;       between lda and sta by this IRQ, thus setting the previous VIC bank again
            ldy #$07
:           dey
            bne :-
            lda CIA2_PRA
            and #.lobyte(~VIC2_BANK)
            ora #VIC2_MAKE_BANK BITMAP
            sta CIA2_PRA
            jmp :+++
:           lda #VIC2_MAKE_BANK BITMAP
            ldy #$08
:           dey
            bne :-
            sta CIA2_PRA,y
:           stx VIC2_ADDR

    .if PLATFORM = diskio::platform::COMMODORE_128
            lda #IO_PORT_CHARGEN_DISABLED
            sta IO_PORT
            lda #%11111111
            sta VIC2_SPR_ENABLE
    .endif; PLATFORM = diskio::platform::COMMODORE_128

    .if LOAD_TO_UPPER_MEM
            lda #$fa
:           bit VIC2_CTRL1
            bmi :+
            cmp VIC2_RASTERLINE
            bcs :-
:
            lda #VIC2_MAKE_ADDR SPRITESCR, BITMAP
            sta VIC2_ADDR
            bit drivetype
            bpl :+; branch if not generic drive
            ; KERNAL fallback active
            ; note: this may glitch due to a race condition, the KERNAL ROM's serial bus code does
            ;       things like lda $dd00 : and/ora #value : sta $dd00, which may be interrupted
            ;       between lda and sta by this IRQ, thus setting the previous VIC bank again
            lda CIA2_PRA
            and #.lobyte(~VIC2_BANK)
            ora #VIC2_MAKE_BANK SPRITES
            sta CIA2_PRA
            jmp :++
:           SET_VIC_BANK VIC2_MAKE_BANK SPRITES
:
    .endif

    .if USE_2_MHZ
            pla
            sta VIC2_C128_CLOCK
    .endif

            lda #$fb
:           bit VIC2_CTRL1
            bmi :+
            cmp VIC2_RASTERLINE
            bcs :-
:
            lda #BITMAP_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_3; $3b
            sta VIC2_CTRL1; set 25 rows bit
            lda #SINGLECOLOUR_MODE | COLUMNS_40 | SCROLLX_0; $08
            sta VIC2_CTRL2

    .if LITTLE_CPU_FOR_LOADER
            inc BORDERCOLOUR
            lda #$f5
:           cmp VIC2_RASTERLINE
            bne :-
            dec BORDERCOLOUR
    .endif

            lda #ALL_COLUMNS
            sta CIA1_PRA
            lda CIA1_PRB
            cmp #NO_ROWS
            beq :++
            bit drivetype
            bpl :+; branch if not generic drive
            lda #$00
            SKIPWORD
:           lda #$08
            ldx #.lobyte(consoleirq)
            ldy #.hibyte(consoleirq)
            bne irqend; jmp

:           lda #1
            SKIPWORD
prepirq:    lda #0
            sta setborder + 1
            tax
            beq :+
            lda BORDERCOLOUR
            eor bordercol + 1
            and #%00001111
            beq :+
            lda bordercol + 1
            sta BORDERCOLOUR
:
    .if LOAD_TO_UPPER_MEM
            bit drivetype
            bmi :+
            lda #$01
            ldx #.lobyte(irq0)
            ldy #.hibyte(irq0)
            bne irqend; jmp

:           bit VIC2_CTRL1
            bpl :-
            lda #$1c
:           cmp VIC2_RASTERLINE
            bcs :-
            lda #VIC2_MAKE_ADDR COLRAM, BITMAP
            sta VIC2_ADDR
            ; KERNAL fallback active
            ; note: this may glitch due to a race condition, the KERNAL ROM's serial bus code does
            ;       things like lda $dd00 : and/ora #value : sta $dd00, which may be interrupted
            ;       between lda and sta by this IRQ, thus setting the previous VIC bank again
            lda CIA2_PRA
            and #.lobyte(~VIC2_BANK)
            ora #VIC2_MAKE_BANK BITMAP
            sta CIA2_PRA
    .endif
            sec
            lda #$f8
            sbc IRQSLACK
            ldx #.lobyte(irq1)
            ldy #.hibyte(irq1)

irqend:     sta VIC2_RASTERLINE
            stx CINV + $00
            sty CINV + $01

    .if KEY_FOR_WATCHDOG
            lda #ALL_COLUMNS
            sta CIA1_PRA
            ldx CIA1_PRB
            inx
            beq :++
            lda #.lobyte(~(CIA_SERIAL_DATA_IN_OUTPUT | CIA_SERIAL_CLK_IN_OUTPUT))
            sta CIA2_DDRA
            lda #VIC2_BANK_MASK
            and CIA2_PRA
            sta CIA2_PRA
:           inc BORDERCOLOUR
            jmp :-
:
    .endif
            lda #RASTER_IRQ
            sta VIC2_IRR

    .if PLATFORM = diskio::platform::COMMODORE_128
            pla
            pha

memcfgchks = * + $01
            ldx #$00
            beq memchkok

        .if LOAD_TO_UPPER_MEM
            .if LOAD_VIA_KERNAL_FALLBACK
            cmp #BANK_0 | SYSTEM_ROM | MID_RAM | LOW_RAM | IO_SPACE; $0e
            beq memchkok
            cmp #BANK_0 | HIGH_RAM | MID_RAM | LOW_RAM | IO_SPACE; $3e
            beq memchkok
            cmp #BANK_0 | HIGH_RAM | MID_RAM | LOW_RAM | RAM_ROM; $3f
            beq memchkok
            .else
            cmp #BANK_0 | HIGH_RAM | MID_RAM | LOW_RAM | IO_SPACE; $3e
            beq memchkok
            cmp #BANK_0 | HIGH_RAM | MID_RAM | LOW_RAM | RAM_ROM; $3f
            beq memchkok
            .endif
        .else
            .if LOAD_VIA_KERNAL_FALLBACK
            cmp #BANK_0 | SYSTEM_ROM | MID_RAM | LOW_RAM | IO_SPACE; $0e
            beq memchkok
            cmp #BANK_0 | HIGH_RAM | MID_RAM | LOW_RAM | IO_SPACE; $3e
            beq memchkok
            cmp #BANK_0 | HIGH_RAM | MID_RAM | LOW_RAM | RAM_ROM; $3f
            beq memchkok
            .else
            cmp #BANK_0 | HIGH_RAM | MID_RAM | LOW_RAM | IO_SPACE; $3e
            beq memchkok
            cmp #BANK_0 | HIGH_RAM | MID_RAM | LOW_RAM | RAM_ROM; $3f
            beq memchkok
            .endif
        .endif

            tax; faulty config value displayed in x and y
            tay
            lda #MSGINVMCONF
            jmp error
memchkok:

    .else; PLATFORM <> diskio::platform::COMMODORE_128

            pla
            sta IO_PORT

            and #%00111111; mask out the upper 2 bits (C-128 CAPS LOCK (ASCII/DIN) and Flash8 clock control bits)
            ora #CASSETTE_SENSE; this is 0 on SX-64

memcfgchks = * + 1
            ldx #$00
            beq memchkok

        .if LOAD_TO_UPPER_MEM
            .if LOAD_VIA_KERNAL_FALLBACK
            cmp #MEMCONFIG_ALL_RAM
            beq memchkok
            cmp #MEMCONFIG_IO
            beq memchkok
            cmp #MEMCONFIG_IO_KERNAL_BASIC
            beq memchkok
            .else
            cmp #MEMCONFIG_ALL_RAM
            beq memchkok
            cmp #MEMCONFIG_IO
            beq memchkok
            .endif
        .else
            .if LOAD_VIA_KERNAL_FALLBACK
            cmp #MEMCONFIG_IO
            beq memchkok
            cmp #MEMCONFIG_IO_KERNAL_BASIC
            beq memchkok
            .else
            cmp #MEMCONFIG_IO
            beq memchkok
            .endif
        .endif

            tax; faulty config value displayed in x and y
            tay
            lda #MSGINVMCONF
            jmp error
memchkok:
    .endif; PLATFORM <> diskio::platform::COMMODORE_128

    .if PLATFORM = diskio::platform::COMMODORE_128
            jmp BUF; leaveirq

leaveirq:   pla
            sta MMU_CR
    .endif;  PLATFORM = diskio::platform::COMMODORE_128
            pla
            tay
            pla
            tax
            pla
            rti
leaveirqe:

.endif; PLATFORM <> diskio::platform::COMMODORE_16

nmihandler: lda #SPURIOUSNMI
            jmp error

brkhandler: pla
            sta brkyreg + 1
            pla
            sta brkxreg + 1
            pla
            sta printa
            pla
            pla
    .if PLATFORM = diskio::platform::COMMODORE_128
            pla
    .endif;  PLATFORM = diskio::platform::COMMODORE_128
            cld
            sec
            sbc #$02
            sta brkaddrlo
            pla
            sbc #$00
            sta brkaddrhi

            lda #ERRBRKOPC
brkxreg:    ldx #0
brkyreg:    ldy #0
            jmp error

.rodata

startupmsg: .byte PETSCII_CLEAR, PETSCII_LO_UP_CASE
            .byte PETSCII_WHITE, "Loader test application", PETSCII_RETURN
            .byte PETSCII_CYAN,  "by Krill/Plush", PETSCII_RETURN
            .byte PETSCII_GREEN, "Repository version ", REPOSITORY_VERSION_STRING, PETSCII_RETURN
            .byte PETSCII_LIGHTGREEN, "built on ", DATETIME, PETSCII_RETURN
            .byte PETSCII_RETURN, 0

detectedms: .byte PETSCII_YELLOW, "Detected ", PETSCII_CYAN, 0
systemmsg:  .byte PETSCII_YELLOW, " system", PETSCII_RETURN, 0
acfreqmsg:  .byte PETSCII_YELLOW, " Hz AC frequency", PETSCII_RETURN, 0
inssizemsg: .byte PETSCII_YELLOW, "Installer size is ", PETSCII_CYAN, "$"
inssizebyt: .byte 0, 0, 0, 0
            .byte PETSCII_YELLOW, " bytes", PETSCII_RETURN, 0
ressizemsg: .byte PETSCII_YELLOW, "Resident  size is ", PETSCII_CYAN, "$"
ressizebyt: .byte 0, 0, 0, 0
            .byte PETSCII_YELLOW, " bytes", PETSCII_RETURN, 0
.if TEST_SAVE
trnsizemsg: .byte PETSCII_YELLOW, "Transient size is ", PETSCII_CYAN, "$"
trnsizebyt: .byte 0, 0, 0, 0
            .byte PETSCII_YELLOW, " bytes", PETSCII_RETURN, 0
.endif
installmsg: .byte PETSCII_YELLOW, "Installing loader on dev ", PETSCII_CYAN, "#", 0
installrst: .byte PETSCII_YELLOW, "... ", PETSCII_RETURN, 0
runningmsg: .byte PETSCII_YELLOW, "Running on ", 0
quotemsg:   .byte PETSCII_LIGHTGREEN, '"', 0
returnmsg:  .byte PETSCII_RETURN, 0
twobitatnm: .byte PETSCII_YELLOW, "Using ", PETSCII_CYAN, "2bit+ATN", PETSCII_YELLOW, " transfers", PETSCII_RETURN, 0
burstmsg:   .byte PETSCII_YELLOW, "Using ", PETSCII_CYAN, "burst+ATN"
.if ASYNCHRONOUS_BURST_HANDSHAKE
            .byte "+CLK"
.endif
            .byte PETSCII_YELLOW, " transfers", PETSCII_RETURN, 0
loopmsg:
.byte PETSCII_YELLOW, "Running test loop", PETSCII_RETURN
.if PLATFORM <> diskio::platform::COMMODORE_128
            .byte PETSCII_RETURN, PETSCII_RETURN, PETSCII_RETURN, PETSCII_RETURN
            .byte PETSCII_RETURN, PETSCII_RETURN
    .if TEST_SAVE
    .else
            .byte PETSCII_RETURN
    .endif
.endif
            .byte 0
looprunmsg: .byte PETSCII_YELLOW, "Test loop run #", PETSCII_CYAN, 0
mhzmsg:     .byte ", ", PETSCII_CYAN
mhz:        .byte "1", PETSCII_YELLOW, " MHz", 0
logmsg:     .byte PETSCII_CYAN, 0
kbsspcmsg:  .byte PETSCII_CYAN
spacemsg:   .byte " ", 0

paltext:    .byte "PAL", 0
ntsctext:   .byte "NTSC", 0

drivemsgsl: .byte .lobyte(msg1541), .lobyte(msg1541c), .lobyte(msg1541ii), .lobyte(msg1541u)
            .byte .lobyte(msg1570), .lobyte(msg1571), .lobyte(msg1571cr), .lobyte(msg1581), .lobyte(msgfd2000), .lobyte(msgfd4000)
            .byte .lobyte(msgenerics - 1)
drivemsgsr: .byte .lobyte(msgenerics)
drivemsgbr: .byte .lobyte(msgenericb)
drivemsgpa: .byte .lobyte(msgenericp)

drivemsgsh: .byte .hibyte(msg1541), .hibyte(msg1541c), .hibyte(msg1541ii), .hibyte(msg1541u)
            .byte .hibyte(msg1570), .hibyte(msg1571), .hibyte(msg1571cr), .hibyte(msg1581), .hibyte(msgfd2000), .hibyte(msgfd4000)
            .byte .hibyte(msgenerics - 1)
            .byte .hibyte(msgenerics)
            .byte .hibyte(msgenericb)
            .byte .hibyte(msgenericp)

msg1541:    .byte PETSCII_CYAN, "CBM 1541", 0
msg1541c:   .byte PETSCII_CYAN, "CBM 1541-C", 0
msg1541ii:  .byte PETSCII_CYAN, "CBM 1541-II", 0
msg1541u:   .byte PETSCII_CYAN, "1541U", 0
msg1570:    .byte PETSCII_CYAN, "CBM 1570", 0
msg1571:    .byte PETSCII_CYAN, "CBM 1571", 0
msg1571cr:  .byte PETSCII_CYAN, "CBM 1571CR", 0
msg1581:    .byte PETSCII_CYAN, "CBM 1581", 0
msgfd2000:  .byte PETSCII_CYAN, "CBM FD 2000", 0
msgfd4000:  .byte PETSCII_CYAN, "CBM FD 4000", 0
msgenerics: .byte PETSCII_CYAN, "generic serial drive", 0
msgenericb: .byte PETSCII_CYAN, "generic burst drive", 0
msgenericp: .byte PETSCII_CYAN, "generic parallel drive", 0

drivtypesl: .byte .lobyte(str1541), .lobyte(str1541c), .lobyte(str1541ii), .lobyte(str1541u)
            .byte .lobyte(str1570), .lobyte(str1571), .lobyte(str1571cr), .lobyte(str1581), .lobyte(strfd2000), .lobyte(strfd4000)
            .byte .lobyte(strgenrics - 1)
            .byte .lobyte(strgenrics)
            .byte .lobyte(strgenricb)
            .byte .lobyte(strgenricp)

drivtypesh: .byte .hibyte(str1541), .hibyte(str1541c), .hibyte(str1541ii), .hibyte(str1541u)
            .byte .hibyte(str1570), .hibyte(str1571), .hibyte(str1571), .hibyte(str1581), .hibyte(strfd2000), .hibyte(strfd4000)
            .byte .hibyte(strgenrics - 1)
            .byte .hibyte(strgenrics)
            .byte .hibyte(strgenricb)
            .byte .hibyte(strgenricp)

            ;     "123456789" max length
str1541:    .byte "CBM1541"  , 0
str1541c:   .byte "CBM1541C" , 0
str1541ii:  .byte "CBM1541II", 0
str1541u:   .byte "1541U"    , 0
str1570:    .byte "CBM1570"  , 0
str1571:    .byte "CBM1571"  , 0
str1571cr:  .byte "CBM1571CR", 0
str1581:    .byte "CBM1581"  , 0
strfd2000:  .byte "CMDFD2000", 0
strfd4000:  .byte "CMDFD4000", 0
strgenrics: .byte "gn serial", 0
strgenricb: .byte "gen burst", 0
strgenricp: .byte "parallel",  0

kbscoltext: .byte PETSCII_YELLOW
kbstext:    .byte " kB/s", 0

            .byte "                                        "
emptytexte: .byte 0

.if LOAD_TO_UPPER_MEM

pic1unc:    .byte "ab-pic1hiram.bin", 0
    .if LOAD_VIA_KERNAL_FALLBACK | VERIFY
pic2unc:    .byte "bb-pic2hiram.bin", 0
    .else
pic2unc:    .byte 0; use loadnext functionality
    .endif

    .if DECOMPRESSOR <> DECOMPRESSORS::NONE
pic1compd:  .byte "ap-pic1hiram.pak", 0
        .if LOAD_VIA_KERNAL_FALLBACK | VERIFY
pic2compd:  .byte "bp-pic2hiram.pak", 0
        .else
pic2compd:  .byte 0; use loadnext functionality
        .endif
    .else
pic1compd:
pic2compd:  .byte 0
    .endif

.else; !LOAD_TO_UPPER_MEM

pic1unc:    .byte "r1-raw", 0
    .if LOAD_VIA_KERNAL_FALLBACK | VERIFY
pic2unc:    .byte "r2-raw", 0
    .else
pic2unc:    .byte 0; use loadnext functionality
    .endif

    .if DECOMPRESSOR <> DECOMPRESSORS::NONE
pic1compd:  .byte "p1-pak", 0
        .if LOAD_VIA_KERNAL_FALLBACK | VERIFY
pic2compd:  .byte "p2-pak", 0
        .else
pic2compd:  .byte 0; use loadnext functionality
        .endif
    .else
pic1compd:
pic2compd:  .byte 0
    .endif

.endif

bogusname:  .byte $ff, $ff, $ff, $ff
            .byte $ff, $ff, $ff, $ff
            .byte $ff, $ff, $ff, $ff
            .byte $ff, $ff, $ff, $ff, 0

errormsgsl: .repeat $78, I
                .byte .lobyte(invaliderr)
            .endrep

ERRPALNTSC = * - errormsgsl
            .byte .lobyte(emgpalntsc)
ERRLOADADDR = * - errormsgsl
            .byte .lobyte(emsglodadd)
ERRENDADDR = * - errormsgsl
            .byte .lobyte(emsgendadd)
ERRBYTESLOADED = * - errormsgsl
            .byte .lobyte(emsgbytlod)
ERRSAFETYMARGIN = * - errormsgsl
            .byte .lobyte(emsgsafety)
MSGUNINST = * - errormsgsl
            .byte .lobyte(emsguninst)
ERRBRKOPC = * - errormsgsl
            .byte .lobyte(emsgbrkopc)
SPURIOUSNMI = * - errormsgsl
            .byte .lobyte(emsgspunmi)
MEMCONFCHNG = * - errormsgsl
            .byte .lobyte(emsgmemcfg)
MSGINVMCONF = * - errormsgsl
            .byte .lobyte(emsginvmcf)
MSGVERIFAIL = * - errormsgsl
            .byte .lobyte(emsgverifl)

            .repeat $74, I
                .byte .lobyte(invaliderr)
            .endrep

            .byte .lobyte(emsgftoobg)
            .byte .lobyte(emsgftoosm)
            .byte .lobyte(emsgftoolr)
            .byte .lobyte(emsgwritep)
            .byte .lobyte(emsgdevinc)
            .byte .lobyte(emsgtoomd)
            .byte .lobyte(emsggenker)
            .byte .lobyte(emsgdevnp)
            .byte .lobyte(emsgfnotf); $ff

errormsgsh: .repeat $78, I
                .byte .hibyte(invaliderr)
            .endrep

            .byte .hibyte(emgpalntsc)
            .byte .hibyte(emsglodadd)
            .byte .hibyte(emsgendadd)
            .byte .hibyte(emsgbytlod)
            .byte .hibyte(emsgsafety)
            .byte .hibyte(emsguninst)
            .byte .hibyte(emsgbrkopc)
            .byte .hibyte(emsgspunmi)
            .byte .hibyte(emsgmemcfg)
            .byte .hibyte(emsginvmcf)
            .byte .hibyte(emsgverifl)

            .repeat $74, I
                .byte .hibyte(invaliderr)
            .endrep

            .byte .hibyte(emsgftoobg)
            .byte .hibyte(emsgftoosm)
            .byte .hibyte(emsgftoolr)
            .byte .hibyte(emsgwritep)
            .byte .hibyte(emsgdevinc)
            .byte .hibyte(emsgtoomd)
            .byte .hibyte(emsggenker)
            .byte .hibyte(emsgdevnp)
            .byte .hibyte(emsgfnotf); $ff

.assert errormsgsh - errormsgsl = $0100, error, "errormsgsl has wrong length"
.assert * - errormsgsh = $0100, error, "errormsgsh has wrong length"

emgpalntsc: .byte "PAL/NTSC detection mismatch. ", 0
emsglodadd: .byte "Wrong load address. ", 0
emsgendadd: .byte "Wrong end address. ", 0
emsgbytlod: .byte "Wrong amount of bytes loaded. ", 0
emsgsafety: .byte "Safety margin exceeded.", 0
emsginvmcf: .byte "Invalid memory configuration. ", 0
cmsguninst: .byte PETSCII_WHITE
emsguninst: .byte "The loader is now uninstalled. ", 0
emsgbrkopc: .byte "Executed BRK instruction at $", 0
emsgspunmi: .byte "Spurious NMI. ", 0
emsgmemcfg: .byte "Memory config changed. ", 0
emsgverifl: .byte "Verify failed at $"
verifysrc:  .byte "0000/$"
verifydest: .byte "0000. ", 0

emsgftoobg: .byte "File too large. ", 0
emsgftoosm: .byte "File on disk too small. ", 0
emsgftoolr: .byte "File on disk too large. ", 0
emsgwritep: .byte "Write protect on. ", 0
emsgdevinc: .byte "Device incompatible. ", 0
emsgtoomd:  .byte "Too many devices. ", 0
emsggenker: .byte "Generic KERNAL error. ", 0
emsgdevnp:  .byte "Device not present. ", 0
emsgfnotf:  .byte "File not found. ", 0

invaliderr: .byte "Invalid error code. ", 0

numccpal:   CYCLES_PER_SECOND_PAL
numccntsc:  CYCLES_PER_SECOND_NTSC

.bss

palntsc:    .res 1
drivetype:  .res 1

.if PLATFORM = diskio::platform::COMMODORE_16
tod_hrs:    .res 1
tod_mins:   .res 1
tod_secs:   .res 1
tod_10s:    .res 1
tod_frames: .res 1

    .if COUPLED_TIMERS = 0
prevctr3lo: .res 1
prevctr3hi: .res 1

cycles_hi:  .res 1
cycles_mid: .res 1
cycles_lo:  .res 1

prvcycslo:  .res 1
prvcycsmid: .res 1
prvcycshi:  .res 1
    .endif; COUPLED_TIMERS
.endif

numcycles:  .res 4
cyclesperd: .res 5
hundred:    .res 5

capsname:

.segment "END"
