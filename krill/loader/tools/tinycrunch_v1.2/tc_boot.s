
boot_start=$0801
    sei
    ldx#decrunch_end-decrunch_dst
:   lda decrunch_src-1,x
    sta decrunch_dst-1,x
    dex
    bne :-
    jmp decrunch_dst


decrunch_src:
    .org $0100
decrunch_dst:
    lda 1
    pha
    lda#$34
    sta 1
o_stream0:
    lda#0
    ldx#0
    lda decrunch ; replaced with JSR iff chunk present
o_stream1:
    lda#0
    ldx#0
    lda decrunch ; replaced with JSR iff chunk present
    pla
    sta 1
    cli
o_start:
    jmp $080d
    .include "tc_decode_f.s"
decrunch_end:
    ; patch addresses
    .byte <(o_stream0 - boot_start + decrunch_src - decrunch_dst)
    .byte <(o_stream1 - boot_start + decrunch_src - decrunch_dst)
    .byte <(o_start   - boot_start + decrunch_src - decrunch_dst)

