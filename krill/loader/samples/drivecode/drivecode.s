
.include "loadersymbols-c64.inc"

.include "loader.inc"

            .org $080d

            jsr install

loop:       inc $d020

            ldx #<swapparams
            ldy #>swapparams
            jsr swapdrvcod

            inc $d020

wait:       bit $dd00
            bpl wait

            inc $d020

            jsr restoreldr

            inc $d020

            ldx #<filename
            ldy #>filename
            jsr loadraw
            bcc loop

error:      sta $d021
            inc $d021
            jmp error

swapparams: .word $8000; buffer
            .word drvcoderun; entry
            .word drvcoderun; to
            .word drivecoded - drivecode; length
            .word drivecode; from

filename:   .byte "pic1", 0

drivecode:
            .org $0200

drvcoderun: lda #$12; ATNA_OUT | DATA_OUT
            sta $1800; busy

drvcodloop: lda #$08
            eor $1c00
            sta $1c00
            lda #0
:           dex
            bne :-
:           dey
            bne :-
            clc
            adc #1
            bne :--
            lda #6
            dec * - 1
            bne drvcodloop

            RETURNTOLOADER41

            .org * - (drvcoderun - drivecode)
drivecoded:

            .res loadraw - *
.incbin "../../build/loader-c64.prg", 2

            .res swapdrvcod - *
.incbin "../../build/customdrivecode-c64.prg", 2

            .res install - *
.incbin "../../build/install-c64.prg", 2
