    .export decrunch
.ifdef TC_NO_HEADER
    .define sp tc_sp
    .define dp tc_dp
    .exportzp tc_sp, tc_dp
.endif
    .define sbx axs

DECOMPVARS = 4   ; 6 bytes
dp=DECOMPVARS + 0  ; 4
sp=DECOMPVARS + 2  ; 6  ; sp must follow dp, cf init code
cs=DECOMPVARS + 4  ; 8



.ifdef TC_BLOCK_INTERFACE
    .import tc_getblock
.endif

.ifdef TC_NO_HEADER
decrunch_done:
.else
decrunch:
    stx sp+1

    ldy#2
init_loop:
    sta dp,y   ;first iter stores sp-low :D
.ifdef TC_BLOCK_INTERFACE
    ; read three blocks ahead,
    ;  - one because literal strings read up to 128 bytes past sp
    ;  - two more to absorb up to 256 blocks worth of read 254 bytes/use 256 bytes
    tya
    pha
    jsr tc_getblock
    pla
    tay
.endif
    lda (sp),y
    dey
    bpl init_loop
    pha

    lda#$02
    bne update_sp

decrunch_done:
    pla
    iny
    sta(dp),y  ; overwrite EOF sentinal for in place decompression
.endif
    rts

literal_run:
literal_loop:
    iny
    lda(sp),y
    sta(dp),y
    dex
    bmi literal_loop

    tya
    pha
    clc
increase_dp_by_a_and_sp_by_tos_plus_one:
    adc dp
    sta dp
    bcc :+
    inc dp+1
:
    pla
update_sp:
    sec
    adc sp
    sta sp
    bcc :+
    inc sp+1
.ifdef TC_BLOCK_INTERFACE
    jsr tc_getblock
.endif
:

.ifdef TC_NO_HEADER
decrunch:
.endif
next_command:
    ldy#0
    lax(sp),y
    beq decrunch_done
    ; literal:   x = 128+length-1
    ; near copy: a = %11xxxxxx
    ; far copy:  a|0xf8 = >(~(offset-1)), x = 8*(length-2) | (some low bits)
    asl
    bcc far_copy
    bpl literal_run

near_copy:
    ldx#$07   ; clear high byte of -ve offset. Also ensures copy_loop doesn't loop.
    .byt $f0  ; beq (not taken) to skip over the iny
far_copy:
    iny
    ; carry is set for near_copy, clear for far_copy

    lda(sp),y ;fetch second byte (or for near copy, refetch first).  This is low 8 bits of offset.
    adc dp
    sta cs
    txa
    ora#$f8
    adc dp+1
    sta cs+1
    tya
    pha  ; save opcode length to stack
    ldy#1
    lda(cs),y
    sta(dp),y

copy_loop:
    iny
    lda(cs),y
    sta(dp),y
    txa   ; spend an extra 2 cycles per byte here to save 10 in the bitfield extraction. A win on average
    sbx#8
    bpl copy_loop
    tya
    bcc increase_dp_by_a_and_sp_by_tos_plus_one ; always taken.
edecrunch:

