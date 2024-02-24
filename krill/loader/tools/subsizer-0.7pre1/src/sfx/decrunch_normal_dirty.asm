;**************************************************************************
;*
;* FILE  decrunch_normal_dirty.asm
;* Copyright (c) 2015, 2017 Daniel Kahlin <daniel@kahlin.net>
;* Written by Daniel Kahlin <daniel@kahlin.net>
;*
;* DESCRIPTION
;*   subsizer 0.7pre1 executable decruncher - dirty version
;*
;******
	processor 6502

	seg	code

	mac	NEW_PART
	org	$0000
	dc.b	{1},0
	endm

;**************************************************************************
;*
;* Configuration options
;*
;******
	ifnconst MAKE_EXE
HAVE_CLI		equ	1
	endif
HAVE_LONG_PARTS		equ	1


	if HAVE_LONG_PARTS
PART_MASK	equ	%00001111
N_PARTS		equ	16
	else
PART_MASK	equ	%00000111
N_PARTS		equ	8
	endif


	NEW_PART "header"
	subroutine header
	org	$0801
begin_header:
;**************************************************************************
;*
;* Basic line!
;*
;******
	if 	0
start_of_line:
	dc.w	end_line
	dc.w	0
	dc.b	$9e,"2069 /T.L.R/",0
end_line:
	dc.w	0
	else
start_of_line:
	dc.w	end_line
	dc.w	0
	dc.b	$9e,"2063 SUBSIZER!",0
end_line:
	dc.b	$a0,$00
	endif

;**************************************************************************
;*
;* NAME  start
;*
;******
start:
	ifnconst MAKE_EXE
	sei
	lda	#$34
	sta	$01
	jmp	tail
	endif

end_header:



	NEW_PART "tail"
	subroutine tail
	org	$1000
begin_tail:
;**************************************************************************
;*
;* NAME  tail
;*
;******
tail:	
	ifnconst MAKE_EXE
wrap		equ	$07e8
wrap_st		equ	$3000
WRAP_LEN	equ	$10


	ldx	#DECRUNCHER_LEN
tl_lp1:
	lda.w	decruncher_st-1,x
	sta.w	decruncher-1,x
	cpx	#WRAP_LEN+1
	bcs	tl_skp1
	lda.w	wrap_st-1,x
	sta.w	wrap-1,x
tl_skp1:
	dex
	bne	tl_lp1
; X = 0
	endif

;	ldx	#0
dc_lp01:

;******
;* get 4 bits
; could be optimized by storing the bits in zp from the beginning and
; then shifting out 4 bits at a time, increasing the ptr.
	lda	#%11100000
dcg_lp1:
	asl.z	buf_zp
	bne	dcg_skp1
; C=1 (because the marker bit was just shifted out)
	tay
	jsr	dc_get_byte
	rol
	sta.z	buf_zp
	tya
dcg_skp1:
	rol
	bcs	dcg_lp1
; Acc = 4 bits.
	sta.z	bits,x

	txa
	and	#PART_MASK
	tay
	beq	dc_skp01

	lda	#0
	sta.z	hibits_zp
	ldy.z	bits-1,x
	sec
dc_lp02:
	rol
	rol.z	hibits_zp
	dey
	bpl	dc_lp02
; C = 0
;	clc
	adc.z	base_l-1,x
	tay
	lda.z	hibits_zp
	adc.z	base_h-1,x

dc_skp01:
	sta.z	base_h,x
	sty.z	base_l,x

	inx
	cpx	#N_PARTS*4+4
	bne	dc_lp01

; perform decrunch
	ldy	#0
	jmp	decrunch_entry



end_tail:


	NEW_PART "decruncher"
	org	zp_end
	subroutine decruncher
begin_decruncher:
;**************************************************************************
;*
;* NAME  decruncher
;*
;* DESCRIPTION
;*   decruncher
;*
;******
	seg.u	zp
	org	$be
hibits_zp:
	ds.b	1
zp_end:
	seg	code
decruncher_st:
	rorg	zp_end
decruncher:				;+0ftDecruncher

buf_zp:
	dc.b	$80			;+0ftBufZp

	if	HAVE_LONG_PARTS
tabb:
	dc.b	%10000000 | [48 >> 2]	; 2 bits
	dc.b	%11100000 | [0  >> 4]	; 4 bits
	dc.b	%11100000 | [16 >> 4]	; 4 bits
	dc.b	%11100000 | [32 >> 4]	; 4 bits
	else
tabb:
	dc.b	%10000000 | [24 >> 2]	; 2 bits
	dc.b	%11000000 | [0  >> 3]	; 3 bits
	dc.b	%11000000 | [8  >> 3]	; 3 bits
	dc.b	%11000000 | [16 >> 3]	; 3 bits
	endif

;******
;* get bit macro
	mac	get_bit
	asl.z	buf_zp
	bne	.gb_skp1
; C=1 (because the marker bit was just shifted out)
	jsr	dc_get_byte
	rol
	sta.z	buf_zp
.gb_skp1:
	endm

;******
;* get bits max8 macro
	mac	get_bits_max8
.gb_lp1:
	asl.z	buf_zp
	bne	.gb_skp1
; C=1 (because the marker bit was just shifted out)
	pha
	jsr	dc_get_byte
	rol
	sta.z	buf_zp
	pla
.gb_skp1:
	rol
	dey
	bne	.gb_lp1
	endm


;******
;* get bits max8 masked macro
	mac	get_bits_max8_masked
.gb_lp1:
	asl.z	buf_zp
	bne	.gb_skp1
; C=1 (because the marker bit was just shifted out)
	tay
	jsr	dc_get_byte
	rol
	sta.z	buf_zp
	tya
.gb_skp1:
	rol
	bcs	.gb_lp1
	endm


;******
;* get bits max16 macro
	mac	get_bits_max16
.gb_lp1:
	asl.z	buf_zp
	bne	.gb_skp1
; C=1 (because the marker bit was just shifted out)
	pha
	jsr	dc_get_byte
	rol
	sta.z	buf_zp
	pla
.gb_skp1:
	rol
	rol.z	hibits_zp
	dey
	bne	.gb_lp1		; C=0 for all Y!=0
	endm


;**************************************************************************
;*
;* NAME  dc_get_byte
;*
;* DESCRIPTION
;*   Get byte from the packed stream.
;*
;******
dc_get_byte:
	lda.z	dc_ptr
	bne	dcgb_skp1
	dec.z	dc_ptr+1
dcgb_skp1:
	dec.z	dc_ptr
dc_ptr	equ	. + 1
	lda.w	$0000			;+1ftSrcEnd
	rts


;******
;* Reverse fast copy
;*
;* IN: len = $01..$100 (len_zp = $00..$ff), C = 0
;*
copy:
len_zp	equ	. + 1
	ldy	#0
	beq	dc_skp4
dc_lp4:
copy_zp	equ	.+1
	lda.w	$0000,y
dest_zp	equ	.+1
	sta.w	$0000,y			;+1ftDestEnd
	dey
	bne	dc_lp4
dc_skp4:
	lda	(copy_zp),y
;	sta	(dest_zp),y
	bcc	dc_common		; always taken

decrunch_entry:
dc_literal:
	lda	dest_zp
	bne	dc_skp5
	dec	dest_zp+1
dc_skp5:
	dec	dest_zp
	jsr	dc_get_byte
;	ldy	#0
dc_common:
	sta	(dest_zp),y
	; fall through

decrunch_main:
;------
; perform actual decrunch
dc_lp1:
	get_bit
	bcs	dc_literal

; get length as bits/base.
	ldx	#$100-N_PARTS
dc_lp2:
	inx
	beq	dc_skp0
	get_bit
	bcc	dc_lp2
	clc
dc_skp0:
; C = 0, Y = 0
;	lda	#0
	tya
	ldy.z	[bits_len+N_PARTS-1]&$ff,x
	beq	dcb1_skp2
	get_bits_max8
dcb1_skp2:
; C = 0
	adc.z	[base_len+N_PARTS-1]&$ff,x
	sta	len_zp
; C = 0

;******
;* IN: len = $01..$100 (Acc = $00..$ff)
;* OUT: dest_zp = dest_zp - len,  X = len-1
;*
	tax
;	clc
	eor	#$ff
	adc	dest_zp
	sta	dest_zp
	bcs	dc_skp22
	dec	dest_zp+1
dc_skp22:

; check end marker here to avoid thrashing carry earlier
	cpx	#$00			;+1ftEndMarkerMinusOne
	beq	done

;******
;* Get selector bits depending on length.
;*
;* IN: len = $01..$100 (X = $00..$ff)
;* OUT:
;*
	cpx	#4
	bcc	dc_skp2
	ldx	#3
dc_skp2:

; get offset as bits/base.
	lda	tabb,x
	get_bits_max8_masked
	tax
; C = 0

	lda	#0
	sta	hibits_zp
	ldy.z	bits_offs,x
	beq	dcb3_skp2
	get_bits_max16
dcb3_skp2:
; C = 0,  Acc/hibits_zp + base_offs,x = offset - 1

; perform: copy_zp = Acc/hibits_zp + base_offs,x + 1 + dest_zp
; result:  copy_zp = dest_zp + offset
	adc.z	base_offs_l,x
	bcc	dcb3_skp3
	inc	hibits_zp
dcb3_skp3:
	sec
	adc	dest_zp
	sta	copy_zp
	lda	hibits_zp
	adc.z	base_offs_h,x
; C = 0
	adc	dest_zp+1
	sta	copy_zp+1

	jmp	copy

done:
	ifnconst MAKE_EXE
	lda	#$37
	sta	$01
	if	HAVE_CLI
	cli
	endif
	jmp	$0830
	endif

	rend
DECRUNCHER_LEN	equ	. - decruncher_st


end_decruncher:

	seg.u	tables
	org	$0002
begin_tables:
;**************************************************************************
;*
;* NAME  base_l, base_h, bits
;*
;* DESCRIPTION
;*   Data for bits/base decoding.
;*
;******
base_l:
base_len:
	ds.b	N_PARTS,0
base_offs_l:
	ds.b	N_PARTS*3+4,0
base_h	equ	. - N_PARTS
;	ds.b	N_PARTS,0
base_offs_h:
	ds.b	N_PARTS*3+4,0

bits:
bits_len:
	ds.b	N_PARTS,0
bits_offs:
	ds.b	N_PARTS*3+4,0

end_tables:


	ifnconst MAKE_EXE
	echo "header", begin_header, end_header, end_header-begin_header
	echo "tail", begin_tail, end_tail, end_tail-begin_tail
	echo "decruncher", begin_decruncher, end_decruncher, end_decruncher-begin_decruncher
	echo "[run] decruncher", decruncher, decruncher+DECRUNCHER_LEN, DECRUNCHER_LEN
	echo "[run] tables", begin_tables, end_tables, end_tables-begin_tables
	endif
; eof
