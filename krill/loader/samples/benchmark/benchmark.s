
; all measurements are done with video frame granularity on PAL

.ifndef LOADERCPU
LOADERCPU = 100; per cent
.endif

OVERALL = (BENCHMARK = BITFIRE)

.enum
            BITFIRE          = 0; throughput is 185526 * 50 / <printed value> = X B/s
            SPINDLE_CODE     = 1; throughput is  $4000 * 50 / <median of printed values> = X B/s
            SPINDLE_GRAPHICS = 2; throughput is  $4400 * 50 / <median of printed values> = X B/s
.endenum

VERIFY = 0
NONSEQUENTIAL = 0

FILECOUNT  = $fc
LOADER_CPU = $fd
FRAMECOUNT = $fe

.include "loadersymbols-c64.inc"

.ifdef loadcompd
LOAD = loadcompd
.else
LOAD = loadraw
.endif

            .org $080d

            lda #$7f
            sta $dc0d

            jsr install

            ldx #<test
            ldy #>test
            jsr LOAD
            bcc :+

error:      inc $d021
            sta $d021
            jmp error

:           lda #$35
            sta $01

            lda numfiles
            sta FILECOUNT
            lda #LOADERCPU
            sta LOADER_CPU
            sta $0428
            lda #0
            ldx #38
:           sta $0429,x
            dex
            bpl :-

.if LOADERCPU < 100

            lda #<irq
            sta $fffe
            lda #>irq
            sta $ffff

            lda #$1b
            sta $d011
            lda #$33
            sta $d012

            lda #$01
            sta $d01a
            sta $d019

.endif
            lda #<((312 * 63) - 1); PAL
            sta $dc04
            lda #>((312 * 63) - 1); PAL
            sta $dc05
            lda #$ff
            sta $dc06
            sta $dc07
.if OVERALL
.else
loadnext:
.endif
            lda #$51
            sta $dc0f
            sta $dc0e
.if OVERALL
loadnext:
.endif

.if NONSEQUENTIAL
            lda filenames
            inc * - 2
            sta filename
            ldx #<filename
            ldy #>filename
.else
            ldx #<next
            ldy #>next
.endif
            jsr LOAD
.if LOADERCPU < 100
            bcs error
.endif
.if OVERALL
.else
           ;lda #0
            sta $dc0e
            ldx #0
            inc * - 1
            sec
            lda #$ff
            sbc $dc06
            sta $0429,x
            lda #$ff
            sbc $dc07
            sta $0429 + 8,x
.endif
.if VERIFY
            jsr checksum
.endif
            dec FILECOUNT
            bne loadnext

.if OVERALL
           ;lda #0
            sta $dc0e
            sec
            lda #$ff
            sbc $dc06
            tay
            lda #$ff
            sbc $dc07
            tax
            tya
.else
            clc
            lda #0
            tax
            ldy numfiles
            dey
:           adc $0429,y
            bcc :+
            inx
            clc
:           dey
            bpl :--
.endif
            sta FRAMECOUNT + 0
            stx FRAMECOUNT + 1

            jsr prntfrmcnt

            lda #0
            sta $d7fe
            sta $d7ff

done:       inc $d020
            jmp done

prntfrmcnt: ldx #1
            ldy #0
            jsr :+
            dex
:           lda FRAMECOUNT,x
            pha
            lsr
            lsr
            lsr
            lsr
            jsr :+
            pla
            and #$0f
:           clc
            adc #'0'
            cmp #'9' + 1
            bcc :+
            sbc #'9'
:           sta $0400,y
            iny
            rts

.if LOADERCPU < 100

irq:        pha
            txa
            pha
            tya
            pha

            lda $d020
            pha
            ldx #<(312 * (100 - LOADERCPU) / 100); PAL
            ldy #>(312 * (100 - LOADERCPU) / 100); PAL
:           lda $d012
:           inc $d020
            cmp $d012
            beq :-
            dex
            bne :--
            dey
            bpl :--
            pla
            sta $d020

            pla
            tay
            pla
            tax
            pla
            inc $d019
            rti

.endif

numfiles:
.if BENCHMARK = BITFIRE
            .byte 18
.else
            .byte 8
.endif
test:       .asciiz "test"
.if NONSEQUENTIAL
filename:   .asciiz " .tc"
filenames:  .byte "abcdefghijklmnopqr"
.else
next = * - 1
.endif

.if VERIFY

OFFSET = 0; $e9

checksum:   ldy #0
            lda verify,y
            sec
            sbc #<OFFSET
            sta checkloop + 1
            lda verify + 1,y
            sbc #>OFFSET
            sta checkloop + 2
            sec
            lda verify + 2,y
            sbc verify,y
            tax
            lda verify + 3,y
            sbc verify + 1,y
            tay
            clc
            txa
            eor #$ff
            adc #1
            tax
            tya
            eor #$ff
            adc #0
            tay
            clc
            lda #0
checkloop:  adc $ff00
            inc checkloop + 1
            bne :+
            inc checkloop + 2
:           inx
            bne checkloop
            iny
            bne checkloop
            ldy checksum + 1
            ldx verify + 4,y
            cmp verify + 4,y
            bne chksumfail
            tya
            clc
            adc #6
            sta checksum + 1
            rts

chksumfail: .byte 2

verify:     .word $a800, $b4f2, $f4; a
            .word $2800, $bf80, $24; b
            .word $7400, $bd00, $af; c
            .word $2f80, $4900, $8d; d
            .word $2800, $6600, $9d; e
            .word $2800, $4396, $69; f
            .word $5c00, $62d5, $7e; g
            .word $2800, $2d00, $e9; h
            .word $2900, $4500, $50; i
            .word $4800, $6358, $b0; j
            .word $2800, $6200, $39; k
            .word $6100, $7300, $45; l
            .word $2800, $67a1, $9c; m
            .word $b900, $bef7, $f8; n
            .word $6600, $8000, $a3; o
            .word $9000, $af00, $d4; p
            .word $2800, $666b, $b8; q
            .word $8000, $a800, $58; r

.endif; VERIFY

            .res LOAD - *
.incbin "../../build/loader-c64.prg", 2

            .res install - *
.incbin "../../build/install-c64.prg", 2
