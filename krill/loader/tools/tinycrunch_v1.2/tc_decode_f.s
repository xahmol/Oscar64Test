    .export decrunch
.ifdef TC_NO_HEADER
    .define sp tc_sp
    .define dp tc_dp
    .exportzp tc_sp, tc_dp
.endif
    .define sbx axs

DECOMPVARS = 250   ; 6 bytes
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

    sec
    bcs update_sp

decrunch_done:
    pla
    iny
    sta(dp),y  ; overwrite EOF sentinal for in place decompression
.endif
    rts



ihidp_fc:
    inc dp+1
    clc
    bcc update_sp



far_copy:
    beq decrunch_done
    iny
    clc
    lda(sp),y
    adc dp
    sta cs
    txa
    ora#$f8
    adc dp+1
    sta cs+1
    lda(cs),y
    sta(dp),y

copy_loop:
    iny
    lda(cs),y
    sta(dp),y
    txa
    sbx#8
    bpl copy_loop
    tya
    adc dp
    sta dp
    bcs ihidp_fc
update_sp:
    lda#2
    adc sp
    sta sp
    bcs next_source_page

.ifdef TC_NO_HEADER
decrunch:
.endif
next_command:
    ldy#0
    lax(sp),y
    bpl far_copy
    asl
    bmi near_copy


literal_run:
literal_loop:
    iny
    lda(sp),y
    sta(dp),y
    dex
    bmi literal_loop

    tya
    ; carry should be set at this point
    adc sp
    sta sp
    bcc :+
    inc sp+1
.ifdef TC_BLOCK_INTERFACE
    jsr tc_getblock
.endif
    clc
:
    tya
    adc dp
    sta dp
    bcc :+
    inc dp+1
:

    ldy#0
    lax(sp),y
    bpl far_copy
    asl
    bpl literal_run


near_copy:
    ; carry should already be set
    txa
    adc dp
    sta cs
    lda#$ff
    adc dp+1
    sta cs+1
    iny
    lda(cs),y
    sta(dp),y
    iny
    lda(cs),y
    sta(dp),y
    lda#1 ; carry should be set
    adc dp
    sta dp
    bcs ihidp_nc
incsp_nc:
    inc sp
    bne next_command
next_source_page:
    inc sp+1
.ifdef TC_BLOCK_INTERFACE
    jsr tc_getblock
.endif
    jmp next_command

ihidp_nc:
    inc dp+1
    bcs incsp_nc






edecrunch:

