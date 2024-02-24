
; C-64: not compatible with Final Replay, as it resets the load vector after run

LOAD_BY_KERNAL = 0; to determine KERNAL throughput

.include "cia.inc"

.include "basic.inc"
.include "float.inc"
.include "kernal.inc"

.include "standard.inc"

.include "loader.inc"


.import openfile
.import pollblock

.importzp loader_zp_first
.importzp loader_zp_last

.import __DISKIO_LOAD__
.import __DISKIO_RUN__
.import __DISKIO_SIZE__

.import __ROM_THUNKS_LOAD__
.import __ROM_THUNKS_RUN__
.import __ROM_THUNKS_SIZE__

.import __RESIDENT_CODE_LOAD__
.import __RESIDENT_CODE_RUN__
.import __RESIDENT_CODE_SIZE__

DISKIO_SIZE_ALIGNED = ALIGN __DISKIO_SIZE__ + __RESIDENT_CODE_SIZE__, $0100
RESIDENT_OFFSET     = __RESIDENT_CODE_LOAD__ - __RESIDENT_CODE_RUN__

POINTERS            = $fe

FILE_NOT_FOUND      = $04
DEVICE_NOT_PRESENT  = $05
LOAD_ERROR          = $1d
BREAK_ERROR         = $1e

.if PLATFORM = diskio::platform::COMMODORE_16
            .include "pio.inc"
            .include "ted.inc"
.else
    .if PLATFORM = diskio::platform::COMMODORE_128
            .include "mmu.inc"
    .endif
            .include "vic.inc"
.endif

            ldx #loader_zp_last - loader_zp_first + 2; add space for relocateable restorezp return address
:           lda loader_zp_first,x
            pha
            dex
            bpl :-

.if LOAD_BY_KERNAL = 0
    .if PLATFORM = diskio::platform::COMMODORE_128
            lda #BANK_0 | SYSTEM_ROM | MID_RAM | LOW_RAM | IO_SPACE
            sta MMU_CR
    .endif
            LOADER_INSTALL

            ; out: a    - status
            ;      x    - drive type
            ;      y    - zeropage address containing a pointer to a zero-terminated version string
            ;      c    - error
            bcc installed

            ; install error
            eor #$ff
            adc #$00
            sta insterror + 1

            jsr restorezp + RESIDENT_OFFSET
            jsr new

            ldx #LOAD_ERROR
            lda #$40
            ora MSGFLG
            sta MSGFLG; enable print I/O error number
insterror:  lda #0
            cmp #.lobyte($0100 - diskio::status::DEVICE_INCOMPATIBLE)
            bne :+
            ldx #devincomp - strings
            jmp printstr
:           jmp ERROR9 + 2; print I/O error number and return to basic

installed:  txa
            pha
            lda #PETSCII_RETURN
            jsr BSOUT

            lda COLOR
            pha
    .if PLATFORM = diskio::platform::COMMODORE_16
            lda #COLOUR_BLUE | INTENSITY_4
            sta COLOR
    .else
            lda #PETSCII_WHITE
            jsr BSOUT
    .endif
            ldx $00,y
            stx POINTERS + 0
            ldx $01,y
            stx POINTERS + 1
            ldy #$00
            beq :+
printinfo:  and #$7f; lower case
            jsr BSOUT
            iny
:           lda (POINTERS),y
            bne printinfo
            pla
            sta COLOR
.endif; LOAD_BY_KERNAL = 0

.if PLATFORM = diskio::platform::COMMODORE_64
            lda PNTR
            beq nonewline
            cmp #SCREEN_COLUMNS
            beq nonewline
.endif
            lda #PETSCII_RETURN
            jsr BSOUT

nonewline:  ldx #ntsc - strings
.if PLATFORM = diskio::platform::COMMODORE_16
            lda #PAL_NTSC_MASK
            and TED_CTRL2
            bne :+
.else
            lda PALNTS
            beq :+
.endif
            ldx #pal - strings
:           jsr printstr

            lda #','
            jsr BSOUT
            lda #' '
            jsr BSOUT
            lda #'#'
            jsr BSOUT
.if PLATFORM = diskio::platform::COMMODORE_128
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | BASIC_LO | IO_SPACE
            sta MMU_CR
.endif
            lda #0
            ldx FA
            jsr LINPRT
.if PLATFORM = diskio::platform::COMMODORE_128
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | LOW_RAM | IO_SPACE
            sta MMU_CR
.endif
            lda #':'
            jsr BSOUT
            lda #' '
            jsr BSOUT
            pla
            and #%00001111
            tay
            ldx drivemsgs,y
            jsr printstr
            lda #PETSCII_RETURN
            jsr BSOUT

            ldx #.lobyte(__ROM_THUNKS_SIZE__)
:           lda __ROM_THUNKS_LOAD__ - 1,x
            sta __ROM_THUNKS_RUN__ - 1,x
            dex
            bne :-

            lda #.hibyte(__DISKIO_LOAD__)
            sta copyresilp + 2
            lda #.hibyte(__DISKIO_RUN__)
            sta copyresilp + 5
            ldx #.hibyte(DISKIO_SIZE_ALIGNED)
            ldy #$00
copyresilp: lda a:.lobyte(__DISKIO_LOAD__),y
            sta a:.lobyte(__DISKIO_RUN__),y
            iny
            bne copyresilp
            inc copyresilp + 2
            inc copyresilp + 5
            dex
            bne copyresilp

.if PLATFORM = diskio::platform::COMMODORE_128
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | BASIC_LO | IO_SPACE
            sta MMU_CR
.endif

.if PLATFORM = diskio::platform::COMMODORE_16
            lda #PAL_NTSC_MASK
            and TED_CTRL2
            bne :+
.else
            lda PALNTS
            beq :+
.endif
            INT32TOFAC numccpal
            jmp :++
:           INT32TOFAC numccntsc
:           ldx #.lobyte(cycspersec)
            ldy #.hibyte(cycspersec)
            jsr MOV2M

            lda FA
            sta driveno + 1

            lda ILOAD + 0
            sta prvload + 1
            lda ILOAD + 1
            sta prvload + 2
            lda #.lobyte(load)
            sta ILOAD + 0
            lda #.hibyte(load)
            sta ILOAD + 1

            lda #.lobyte(ramirq)
            sta IRQ_VECTOR + 0
            lda #.hibyte(ramirq)
            sta IRQ_VECTOR + 1

            jsr restorezp + RESIDENT_OFFSET
            jsr new

.if PLATFORM <> diskio::platform::COMMODORE_16
            lda #.lobyte(~CIA_VIC2_BANK_OUTPUT)
            ora CIA2_PRA
            sta CIA2_PRA
            lda #.lobyte(~CIA_SERIAL_DATA_IN_OUTPUT | CIA_SERIAL_CLK_IN_OUTPUT)
            sta CIA2_DDRA
.endif
            clc
            rts; return to BASIC interpreter

new:        tsx
            stx sp + 1
            lda STACK + $f9
            sta st0 + 1
            lda STACK + $fa
            sta st1 + 1
            jsr NEW
st0:        lda #0
            sta STACK + $f9
st1:        lda #0
            sta STACK + $fa
sp:         ldx #0
            txs
            rts

printstr:   lda strings,x
            bne :+
            rts
:           jsr BSOUT
            inx
            bne printstr
            rts

numccntsc:  CYCLES_PER_SECOND_NTSC
numccpal:   CYCLES_PER_SECOND_PAL

drivemsgs:  .byte msg1541 - strings - 1
            .byte msg1541 - strings, msg1541c - strings, msg1541ii - strings, msg1541u - strings
            .byte msg1570 - strings, msg1571 - strings, msg1571cr - strings, msg1581 - strings, msgfd2000 - strings, msgfd4000 - strings

strings:
.if PLATFORM = diskio::platform::COMMODORE_16
pal:        .byte "pal", 0
ntsc:       .byte "ntsc", 0
.else
.if NTSC_COMPATIBILITY
pal:        .byte "pal - warning: ntsc_compatibility slows "
            .byte "down pal speed", 0
ntsc:       .byte "ntsc", 0
.else
pal:        .byte "pal", 0
ntsc:       .byte "ntsc - warning: ntsc_compatibility is   "
            .byte "not enabled in loader config", 0
.endif
.endif

msg1541:    .byte "cbm 1541", 0
msg1541c:   .byte "cbm 1541-c", 0
msg1541ii:  .byte "cbm 1541-ii", 0
msg1541u:   .byte "1541u", 0
msg1570:    .byte "cbm 1570", 0
msg1571:    .byte "cbm 1571", 0
msg1571cr:  .byte "cbm 1571cr", 0
msg1581:    .byte "cbm 1581", 0
msgfd2000:  .byte "cbm fd 2000", 0
msgfd4000:  .byte "cbm fd 4000", 0

devincomp:  .byte "device incompatible", 0
uninstlmsg: .byte "uninstalling loader", 0

.segment "ROM_THUNKS"

load:       jsr enableram
            jmp doload

prevload:   jsr enablerom
prvload:    jmp $0000

irq:        jsr enableram
            jsr irqsub
            jsr enablerom
.if PLATFORM = diskio::platform::COMMODORE_16
            lda TED_IRR
            sta TED_IRR
.elseif PLATFORM = diskio::platform::COMMODORE_128
            bit CIA1_ICR
.endif
            jmp KPREND

romjsr:     stx :+ + 1
            sty :+ + 2
            tax
            jsr enablerom
:           jsr $0000
            jmp enableram

clr:        jsr enablerom
            jsr CLR
            jsr enableram
            jmp clrst0

fromint32:  jsr enablerom

            jsr INT24TOMANTISSA
cyclesmsb:  lda #0
            sta FACHO
            jsr NORMALIZE
            jmp MOVAF; fac#2 = fac#1

time:       jsr fromint32; fac#2 = numcycles

            lda #.lobyte(cycspersec)
            ldy #.hibyte(cycspersec)
            jsr FDIVM; fac#1 = fac#2 / cycles per second
            jsr MUL10; fac#1 *= 10

            ; seconds = numcycles / cycles per second
            jmp print1dec

throughput: jsr fromint32; fac#2 = numbytes

            lda #.lobyte(floatbuff)
            jsr divide; KB/s = numbytes / seconds

print1dec:  ldx #.lobyte(floatbuff)
            ldy #.hibyte(floatbuff)
            jsr MOV2M

            jsr FLPINT; fac#1 to int
            jsr GIVAYF; int to fac#1
            jsr DIV10; fac#1 /= 10

            jsr FOUT
            jsr STROUT
            jmp enableram

divide:     ldy #.hibyte(floatbuff)
            jsr FDIVM; fac#1 = fac#2 / arg
            jsr DIV10; fac#1 /= 10
.if LOAD_BY_KERNAL = 0
            jmp FADDH; fac#1 += 0.5
.else
            rts
.endif

speedup:    jsr enablerom
            jsr CONUPK; fac#2 = throughput

            lda #.lobyte(kernalthrp)
            jsr divide; fac#1 = throughput / kernal_throughput

            jsr FLPINT; fac#1 -> int (a/y)

            ; fall through
.if PLATFORM = diskio::platform::COMMODORE_16
enableram:  sta TED_RAM_ENABLE
            rts
enablerom:  sta TED_ROM_ENABLE
            rts
.elseif PLATFORM = diskio::platform::COMMODORE_128
enableram:  ldx #BANK_0 | HIGH_RAM | MID_RAM | LOW_RAM | IO_SPACE
            stx MMU_CR
            rts
enablerom:  pha
            lda #BANK_0 | SYSTEM_ROM | BASIC_HI | BASIC_LO | IO_SPACE
            sta MMU_CR
            pla
            rts

dspp:       jsr enablerom
            jsr DSPP; put a char on the screen
            jmp enableram

print:      jsr enablerom
            jsr PRINT
            jmp enableram

fetch:      jsr enablerom
            jsr FETCH
            jmp enableram
.else
enableram:  ldx #MEMCONFIG_IO
            stx IO_PORT
            rts
enablerom:  pha
            lda #MEMCONFIG_IO_KERNAL_BASIC
            sta IO_PORT
            pla
            rts

dspp:       jsr enablerom
            jsr DSPP; put a char on the screen
            jmp enableram
.endif

enableromc: jsr enablerom
            cli
            rts

cycspersec: .res 5
floatbuff:  .res 5

kernalthrp: .byte $7f, $47, $de, $23, $10; .39 kB/s

.segment "RESIDENT_CODE"

doload:     sta VERCK; load/verify

.if LOAD_BY_KERNAL

.if PLATFORM = diskio::platform::COMMODORE_16
; note: time measurement does not work without coupled timers due to no interrupts, and timers are horribly broken in VICE
screen   = $0800
numbytes = $b45a; threeve
.else
screen   = $0400
numbytes = $c7ff; oneder
.endif
            jsr initstat
            lda VERCK

            ldx #.lobyte(NLOAD)
            ldy #.hibyte(NLOAD)
            jsr romjsr

            php
            pha
            txa
            pha
            tya
            pha

            lda #.lobyte(numbytes)
            sta numbyteslo
            lda #.hibyte(numbytes)
            sta numbyteshi
            jsr getstat

            lda #PETSCII_RETURN
            jsr chrout

            lda numcycles + 0
            ora numcycles + 1
            ora numcycles + 2
            ora cyclesmsb + 1
            bne :+
            inc numcycles + 0; avoid division by 0

:           lda numcycles + 0
            ldx numcycles + 1
            ldy numcycles + 2
            sec
            jsr time
            lda #' '
            jsr chrout
            lda #'s'
            jsr chrout
            lda #PETSCII_RETURN
            jsr chrout

            clc
            lda #2; include load address
            adc numbyteslo
            ldx numbyteshi
            bcc :+
            inx
:           ldy #0
            sty cyclesmsb + 1
            sec
            jsr throughput
            lda #' '
            jsr chrout
            lda #'k'
            jsr chrout
            lda #'b'
            jsr chrout
            lda #'/'
            jsr chrout
            lda #'s'
            jsr chrout

            lda #PETSCII_RETURN
            jsr chrout

            lda floatbuff + 0
            sta screen + 0
            lda floatbuff + 1
            sta screen + 1
            lda floatbuff + 2
            sta screen + 2
            lda floatbuff + 3
            sta screen + 3
            lda floatbuff + 4
            sta screen + 4

            pla
            tay
            pla
            tax
            pla
            plp
            jmp enablerom; return to BASIC interpreter
.endif; LOAD_BY_KERNAL

.if 0
            lda #$7f
            and MSGFLG
            sta MSGFLG; no messages (non-direct mode)
.endif
            lda FA
            cmp #8
            bcc jmprevload
            cmp #31
            bcs jmprevload

            ldy #0
            lda (FNADR),y
            cmp #'$'
            bne :++

            lda #uninstlmsg - strings
            ldx #.lobyte(printstr)
            ldy #.hibyte(printstr)
            jsr romjsr

.if PLATFORM <> diskio::platform::COMMODORE_16
            lda #CIA_VIC2_BANK_OUTPUT
            sta CIA2_DDRA
            and CIA2_PRA
            sta CIA2_PRA
.endif
            LOADER_UNINSTALL

            lda #4; need some delay before
            ldx #0; the drive has completed
            ldy #0; its startup check
:           dex
            bne :-
            dey
            bne :-
            sec
            sbc #1
            bne :-

jmprevload: lda VERCK; load/verify
            jmp prevload

:           ldx #loader_zp_last - loader_zp_first + 2; add space for relocateable restorezp return address
:           lda $00,x
            pha
            dex
            bpl :-

            lda CINV + 0
            sta previrqlo + 1
            lda CINV + 1
            sta previrqhi + 1

            lda FA
driveno:    cmp #0
            bne :+; only one drive can load
            lda VERCK
            beq :++; verify is not implemented
:           sec
            lda #diskio::status::GENERIC_KERNAL_ERROR
            jmp error
:
            ; convert file name
            ldy #0
.if PLATFORM = diskio::platform::COMMODORE_128
            lda #FNADR
            ldx FNBANK
            jsr fetch
.else
            lda (FNADR),y
.endif
            pha
            iny
.if PLATFORM = diskio::platform::COMMODORE_128
            lda #FNADR
            ldx FNBANK
            jsr fetch
.else
            lda (FNADR),y
.endif
            tax
            pla
            cmp #'0'
            bne :++
            cpx #':'
            bne :++
            clc
            lda #2
            adc FNADR
            sta FNADR
            bcc :+
            inc FNADR + 1
:           dec FNLEN
            dec FNLEN
            lda #0
:           php

            ldy FNLEN
            cpy #FILENAME_MAXLENGTH
            bcs :+
            lda #0
            sta filename,y
            SKIPWORD
:           ldy #FILENAME_MAXLENGTH
            dey
:
.if PLATFORM = diskio::platform::COMMODORE_128
            lda #FNADR
            ldx FNBANK
            jsr fetch
.else
            lda (FNADR),y
.endif
            sta filename,y
            dey
            bpl :-

            plp
            bne :++
            sec
            lda FNADR
            sbc #2
            sta FNADR
            bcs :+
            dec FNADR + 1
:           inc FNLEN
            inc FNLEN
:
            bit MSGFLG
            bpl :+

            ldx #.lobyte(LUKING); searching for <filename>
            ldy #.hibyte(LUKING)
            jsr romjsr
            jsr cursoron

.if PLATFORM = diskio::platform::COMMODORE_16
            lda TED_IMR
            pha
.endif
            lda CINV + 1
            cmp #.hibyte(KERNAL_ROM)
            bcc :+
            sei
.if PLATFORM = diskio::platform::COMMODORE_16
            lda #COUNTER_3_IRQ
            sta TED_IMR
.endif
            lda #.lobyte(irq)
            sta CINV
            lda #.hibyte(irq)
            sta CINV + 1
            cli
:
.if PLATFORM <> diskio::platform::COMMODORE_16
            lda #CIA_VIC2_BANK_OUTPUT
            sta CIA2_DDRA
            and CIA2_PRA
            sta CIA2_PRA
.endif
            ldx #.lobyte(filename)
            ldy #.hibyte(filename)
            lda #0
            sta STATUS
            cmp SA; secondary address
            bcc :+
            lda MEMUSS
            sta loadaddrlo
            lda MEMUSS + 1
            sta loadaddrhi
:           jsr openfile; this returns immediately

waitopen:   jsr pollblock
            bcc :+
            jmp error
:           tax
            bne waitopen

            lda #OPC_BIT_ABS
            bit MSGFLG
            bpl :+

            jsr cursoroff

            ldx #.lobyte(LODING)
            ldy #.hibyte(LODING)
            jsr romjsr
            lda #' '
            jsr chrout
            lda loadaddrlo
            ldx loadaddrhi
            jsr printhex
            lda #'-'
            jsr chrout
            lda endaddrlo
            ldx endaddrhi
            jsr printhex

            jsr cursoron

            lda #OPC_JSR_ABS; opt
:           sta loadloop

            lda #STOP_COLUMN
.if PLATFORM = diskio::platform::COMMODORE_16
            sta PIO_KEYBOARD_COLUMN
.else
            sta CIA1_PRA
.endif
            ; main loading loop
loadloop:   jsr initstat

.if PLATFORM = diskio::platform::COMMODORE_128
            sei
.endif
            jsr pollblock
.if PLATFORM = diskio::platform::COMMODORE_128
            cli
.endif
            bcs :+
            tax
            bne loadloop
            beq :++; jmp

:           pha
            jsr getstat
            pla
            sec
:           php
            pha
            clc
            lda #256 - 4
            sei
            adc PNTR
            sta PNTR
            tay
            lda endaddrhi
            jsr hexnib2scr
            lda endaddrlo
            jsr hexnib2scr
            sty PNTR
            lda #OPC_BIT_ABS
            sta loadloop
            pla
            plp

.if PLATFORM = diskio::platform::COMMODORE_16
            sta TED_KEYBOARD_LATCH
            bit TED_KEYBOARD_LATCH
.else
            bit CIA1_PRB
.endif
            bpl break

            bcc loadloop

            cmp #diskio::status::OK
            beq :+
            jmp error

break:      jsr closefile

            lda #BREAK_ERROR
            jmp error

:           bit MSGFLG
            bmi :+

            clc
            jmp noerror

:           sec
            lda endaddrlo
            sta VARTAB
            sta EAL
            sbc loadaddrlo
            sta numbyteslo
            lda endaddrhi
            sta VARTAB + 1
            sta EAH
            sbc loadaddrhi
            sta numbyteshi

            clc
            lda #2; load address
            adc numbyteslo
            sta numbyteslo
            bcc :+
            inc numbyteshi
:
            tsx
            stx clrsp + 1
            lda STACK + $f9
            sta clrst0 + 1
            lda STACK + $fa
            sta clrst1 + 1
            jmp clr
clrst0:     lda #0
            sta STACK + $f9
clrst1:     lda #0
            sta STACK + $fa
clrsp:      ldx #0
            txs

            jsr cursoroff

            lda #':'
            jsr chrout

            lda numcycles + 0
            ora numcycles + 1
            ora numcycles + 2
            ora cyclesmsb + 1
            bne :+
            inc numcycles + 0; avoid division by 0

:           lda numcycles + 0
            ldx numcycles + 1
            ldy numcycles + 2
            sec
            jsr time
            lda #'s'
            jsr chrout
            lda #','
            jsr chrout

            lda numbyteslo
            ldx numbyteshi
            ldy #0
            sec
            jsr throughput

            lda #'k'
            jsr chrout
            lda #'b'
            jsr chrout
            lda #'/'
            jsr chrout
            lda #'s'
            jsr chrout
            lda #','
            jsr chrout
            lda #' '
            jsr chrout

            lda #.lobyte(floatbuff)
            ldy #.hibyte(floatbuff)
            jsr speedup
            tya
            ldx #$ff
:           inx
            sec
            tay
            sbc #10
            bcs :-
            tya
            pha
            txa
            beq :+
            adc #'0'
            jsr chrout
:           pla
            clc
            adc #'0'
            jsr chrout
            lda #'x'
            jsr chrout

            clc
bccnoerror: bcc noerror

error:      pha
            jsr cursoroff
            pla
            sec
            ; fall through

noerror:    ; carry is clear when branching here
.if PLATFORM <> diskio::platform::COMMODORE_16
            pha
            lda #.lobyte(~CIA_VIC2_BANK_OUTPUT)
            ora CIA2_PRA
            sta CIA2_PRA
            lda #.lobyte(~CIA_SERIAL_DATA_IN_OUTPUT | CIA_SERIAL_CLK_IN_OUTPUT)
            sta CIA2_DDRA
            pla
.endif
            sei
            bit MSGFLG
            bpl :+

            tax
previrqlo:  lda #0
            sta CINV + 0
previrqhi:  lda #0
            sta CINV + 1
.if PLATFORM = diskio::platform::COMMODORE_16
            pla
            and #.lobyte(~IRQ_RASTERLINE_MSB)
            sta TED_IMR
.endif
            txa

:           jsr restorezp

            bcc loadsucces
            tax
            cpx #BREAK_ERROR
            beq :+
            lda #LOAD_ERROR
:           cpx #diskio::status::FILE_NOT_FOUND
            bne :+
            lda #FILE_NOT_FOUND

:           cpx #diskio::status::DEVICE_NOT_PRESENT
            bne :+

            ; switch back to KERNAL loading
.if PLATFORM <> diskio::platform::COMMODORE_16
            lda #CIA_VIC2_BANK_OUTPUT
            and CIA2_PRA
            sta CIA2_PRA
.endif
            lda prvload + 1
            sta ILOAD + 0
            lda prvload + 2
            sta ILOAD + 1
            jmp jmprevload; note: searching for <filename> is printed again

:           sec

loadsucces: ldx EAL
            ldy EAH
            jmp enableromc; return to BASIC interpreter

chrout:     ldx #.lobyte(BSOUT)
            ldy #.hibyte(BSOUT)
            jmp romjsr

printhex:   pha
            txa
            pha
            lda #'$'
            jsr chrout
            pla
            jsr printnum
            pla
printnum:   pha
            lsr
            lsr
            lsr
            lsr
            jsr printdigit
            pla
            and #%00001111
printdigit: cmp #10
            bcs :+
            adc #'0'
            SKIPWORD
:           adc #'a' - 10 - $01
            jmp chrout

hexnib2scr: tax
            lsr
            lsr
            lsr
            lsr
            jsr :+
            txa
            and #%00001111

:           cmp #10
            bcs :+
            adc #'0'
            SKIPWORD
:           sbc #9
.if PLATFORM = diskio::platform::COMMODORE_128
            bit MODE
            bpl :++
            cmp #'0'
            bcs :+
            adc #'a' - 1
:           jsr print
            SKIPWORD
:
.endif
            sta (PNT),y
            iny
            rts

initstat:
.if PLATFORM = diskio::platform::COMMODORE_16
            sei
            lda #0
            sta cycles_hi
            sta TED_COUNTER3_LO
            sta TED_COUNTER3_HI
            cli
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

getstat:
.if PLATFORM = diskio::platform::COMMODORE_16
            sei
:           ldx TED_COUNTER3_HI
            lda TED_COUNTER3_LO
            cpx TED_COUNTER3_HI
            bne :-
            clc
            eor #$ff
            adc #1
            sta numcycles + 0
            txa
            eor #$ff
            adc #0
            sta numcycles + 1
            lda cycles_hi
            sta numcycles + 2
            cli
.else
            lda #.lobyte(~TIMER_START)
            and CIA2_CRA
            sta CIA2_CRA
            lda #TIMER_STOP
            sta CIA2_CRB

            sec
            lda #$ff - 31; subtract overhead
            sbc CIA2_TA_LO
            sta numcycles + 0
            lda #$ff
            sbc CIA2_TA_HI
            sta numcycles + 1
            lda #$ff
            sbc CIA2_TB_LO
            sta numcycles + 2
            lda #$ff
            sbc CIA2_TB_HI
            sta cyclesmsb + 1
.endif
            rts

cursoron:
.if PLATFORM = diskio::platform::COMMODORE_16
            clc
            lda PNT + 0
            adc PNTR
            sta TED_CURSOR_LO
            lda PNT + 1
            and #$03
            adc #$00
            sta TED_CURSOR_HI
            rts

cursoroff:  lda #$ff
            sta TED_CURSOR_LO
            sta TED_CURSOR_HI
            rts
.else
            lda #0
            sta BLNSW
.if PLATFORM = diskio::platform::COMMODORE_128
            ldx #.lobyte(CURSORON)
            ldy #.hibyte(CURSORON)
            jsr romjsr
.endif
:           rts

cursoroff:  inc BLNSW
            lda BLNON     ; Flag: Cursor Status
            beq :-
            lda GDBLN     ; Character under Cursor while Cursor Inverted
            ldx GDCOL     ; Background Color under Cursor
            ldy #$00
            sty BLNON     ; Flag: Cursor Status
            jmp dspp
.endif

restorezp:  sta abuf + 1
            php
            pla
            tay

            tsx
            txa
            clc
            adc #loader_zp_last - loader_zp_first + 1
            tax
            pla
            sta a:STACK + 3,x
            pla
            sta a:STACK + 4,x
            ldx #loader_zp_first
:           pla
            sta $00,x
            inx
            cpx #loader_zp_last + 1
            bne :-

            tya
            pha
            plp
abuf:       lda #0
            rts

irqsub:
.if PLATFORM = diskio::platform::COMMODORE_16
            inc cycles_hi
            lda #COUNTER_3_IRQ
            sta TED_IRR
.else
            lda #OPC_RTS
            sta irqsubend
            jsr ramirq
            lda #OPC_RTI
            sta irqsubend
.endif
            rts

ramirq:     sta irqabuffer + 1
.if PLATFORM = diskio::platform::COMMODORE_16
            inc cycles_hi
            lda #COUNTER_3_IRQ
            sta TED_IRR
.else
    .if PLATFORM = diskio::platform::COMMODORE_128
            lda MMU_CR
            sta irqmmubuff + 1
            lda #BANK_0 | HIGH_RAM | MID_RAM | LOW_RAM | IO_SPACE
            sta MMU_CR
            lda #RASTER_IRQ
            sta VIC2_IRR
            bit MODE
            bmi irqabuffer
    .endif
            ; blink cursor: copied from $ea34 (KEY + 3) and modified
            lda BLNSW     ; Flag: Cursor blink
            bne noblink
            dec BLNCT     ; Timer: Count down for Cursor blink toggle
            bne noblink

            sty irqybuffer + 1

            lda #20
            sta BLNCT     ; Timer: Count down for Cursor blink toggle
            ldy PNTR      ; Cursor Column on current Line
            lda GDCOL     ; Background Color under Cursor
            pha
            lda (PNT),Y   ; Pointer: Current Screen Line Address
            lsr BLNON     ; Flag: Cursor Status
            bcs :+
            inc BLNON     ; Flag: Cursor Status
            sta GDBLN     ; Character under Cursor while Cursor Inverted
            lda PNT       ; Pointer: Current Screen Line Address
            sta USER      ; Pointer: Current Color RAM Location
            lda PNT + 1   ; Pointer: Current Screen Line Address
            and #$03
            ora #$d8
            sta USER + 1  ; Pointer: Current Color RAM Location
            lda (USER),Y  ; Pointer: Current Color RAM Location
            sta GDCOL     ; Background Color under Cursor
            pla
            lda COLOR     ; Current Character Color code
            pha
            lda GDBLN     ; Character under Cursor while Cursor Inverted
:           eor #$80
            sta (PNT),Y   ; Pointer: Current Screen Line Address
            pla
            sta (USER),Y  ; Pointer: Current Color RAM Location

irqybuffer: ldy #0

noblink:
    .if PLATFORM = diskio::platform::COMMODORE_64
            bit CIA1_ICR
    .endif;  PLATFORM = diskio::platform::COMMODORE_64
    .if PLATFORM = diskio::platform::COMMODORE_128
irqmmubuff: lda #0
            sta MMU_CR
    .endif
.endif
irqabuffer: lda #0
irqsubend:  rti

.if PLATFORM = diskio::platform::COMMODORE_16
cycles_hi:  .res 1
.endif

numcycles:  .res 3
numbyteslo: .res 1
numbyteshi: .res 1

filename:   .res FILENAME_MAXLENGTH
            .byte 0
