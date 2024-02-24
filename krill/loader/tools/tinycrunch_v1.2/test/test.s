    .include "params.inc"
    .import decrunch
.ifdef TC_BLOCK_INTERFACE
    .export tc_getblock
.endif

    lda#5
    sta $d021
    jsr $e536
    lda#0
    sta $d021

    lda#$7f
    sta $dc0d     ; kill CIA irq

    bit $d011
    bpl *-3
    bit $d011
    bmi *-3
    lda#$56
    sta $07e7

    lda#3
    sta $d011
    lda#2
    sta $d020
    lda#$3b
    sta $d011
    lda#$18
    sta $d018
.ifdef TC_BLOCK_INTERFACE
    jsr hide_the_test_data
    jsr tc_getblock
.endif

    lda#<dcSrc
    ldx#>dcSrc
    jsr decrunch

    lda#11
    sta $d020

    lda#$3b
    sta $d011
    lda#$18
    sta $d018
go:
    jmp go


tc_getblock:
    ldy $d020
    lda#8
    sta $d020
    ldx#0
@s: lda #255
@i: eor dcSrc,x
@o: sta dcSrc,x
    inc $d020
    dec $d020
    inx
    bne @s
    lda @i+2
    cmp#$42
    beq noi
    inc @i+2
    inc @o+2
noi:
    sty $d020
    rts

hide_the_test_data:
    ldx#0
@s: lda#255
@i: eor dcSrc,x
@o: sta dcSrc,x
    inx
    bne @s
    inc @i+2
    inc @o+2
    lda @o+2
    cmp#$42
    bne @s
    rts

