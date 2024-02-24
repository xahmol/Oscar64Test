;**************************************************************************
;*
;* FILE  decrunch_normal.asm
;* Copyright (c) 2015, 2017 Daniel Kahlin <daniel@kahlin.net>
;* Written by Daniel Kahlin <daniel@kahlin.net>
;*
;* DESCRIPTION
;*   subsizer 0.7pre1 decruncher - stand alone version
;*
;*   usage:
;*     You need to provide a function to get a byte from the input
;*     stream. (must preserve X,Y and C)
;*
;*     typical function:
;*
;*       dc_get_byte:
;*           lda   dcgb_ptr
;*           bne   dcgb_skp1
;*           dec   dcgb_ptr+1
;*       dcgb_skp1:
;*           dec   dcgb_ptr
;*       dcgb_ptr  equ    . + 1
;*           lda   data_end
;*           rts
;*
;*     To decrunch just do:
;*
;*	 jsr decrunch
;*
;*     The decruncher will use a temporary area of 188 bytes during
;*     decrunching.
;*
;******


;**************************************************************************
;*
;* Configuration options
;*
;******
HAVE_LONG_PARTS		equ	1


	if HAVE_LONG_PARTS
PART_MASK	equ	%00001111
N_PARTS		equ	16
	else
PART_MASK	equ	%00000111
N_PARTS		equ	8
	endif


	seg.u	zp
	org	$f8
len_zp:
	ds.b	1
copy_zp:
	ds.w	1
hibits_zp:
	ds.b	1
buf_zp:
	ds.b	1
dest_zp:
	ds.w	1
endm_zp:
	ds.b	1


	seg	code

;**************************************************************************
;*
;* NAME  fast macros
;*
;******

;******
;* get bit macro
	mac	get_bit
	asl	buf_zp
	bne	.gb_skp1
; C=1 (because the marker bit was just shifted out)
	jsr	dc_get_byte
	rol
	sta	buf_zp
.gb_skp1:
	endm


;******
;* get bits max8 macro
	mac	get_bits_max8
.gb_lp1:
	asl	buf_zp
	bne	.gb_skp1
; C=1 (because the marker bit was just shifted out)
	pha
	jsr	dc_get_byte
	rol
	sta	buf_zp
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
	asl	buf_zp
	bne	.gb_skp1
; C=1 (because the marker bit was just shifted out)
	tay
	jsr	dc_get_byte
	rol
	sta	buf_zp
	tya
.gb_skp1:
	rol
	bcs	.gb_lp1
	endm


;******
;* get bits max16 macro
	mac	get_bits_max16
.gb_lp1:
	asl	buf_zp
	bne	.gb_skp1
; C=1 (because the marker bit was just shifted out)
	pha
	jsr	dc_get_byte
	rol
	sta	buf_zp
	pla
.gb_skp1:
	rol
	rol	hibits_zp
	dey
	bne	.gb_lp1		; C=0 for all Y!=0
	endm


;**************************************************************************
;*
;* NAME  decrunch
;*
;******
decrunch:
	ldx	#4
; Get dest_zp, endm_zp and buf_zp
dc_lp00:
	jsr	dc_get_byte
	sta	buf_zp-1,x
	dex
	bne	dc_lp00
; X = 0

;	ldx	#0
dc_lp01:

;******
;* get 4 bits
	lda	#%11100000
dcg_lp1:
	asl	buf_zp
	bne	dcg_skp1
; C=1 (because the marker bit was just shifted out)
	tay
	jsr	dc_get_byte
	rol
	sta	buf_zp
	tya
dcg_skp1:
	rol
	bcs	dcg_lp1
; Acc = 4 bits.

	sta	bits,x

	txa
	and	#PART_MASK
	tay
	beq	dc_skp01

	lda	#0
	sta	hibits_zp
	ldy	bits-1,x
	sec
dc_lp02:
	rol
	rol	hibits_zp
	dey
	bpl	dc_lp02
; C = 0
;	clc
	adc	base_l-1,x
	tay
	lda	hibits_zp
	adc	base_h-1,x

dc_skp01:
	sta	base_h,x
	tya
	sta	base_l,x
	inx
	cpx	#N_PARTS*4+4
	bne	dc_lp01

; perform decrunch
	ldy	#0
	; fall through

;**************************************************************************
;*
;* NAME  decruncher
;*
;* DESCRIPTION
;*   decruncher
;*
;******
decrunch_entry:

;******
;* single literal byte
;*
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
	ldx	#$80-N_PARTS
dc_lp2:
	inx
	bmi	dc_skp0
	get_bit
	bcc	dc_lp2
	clc
dc_skp0:
; C = 0, Y = 0
;	lda	#0
	tya
	ldy	[bits_len-$80+N_PARTS-1],x
	beq	dcb1_skp2
	get_bits_max8
dcb1_skp2:
; C = 0
	adc	[base_len-$80+N_PARTS-1],x
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
	cpx	endm_zp
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
	ldy	bits_offs,x
	beq	dcb3_skp2
	get_bits_max16
dcb3_skp2:
; C = 0,  Acc/hibits_zp + base_offs,x = offset - 1

; perform: copy_zp = Acc/hibits_zp + base_offs,x + 1 + dest_zp
; result:  copy_zp = dest_zp + offset
	adc	base_offs_l,x
	bcc	dcb3_skp3
	inc	hibits_zp
dcb3_skp3:
	sec
	adc	dest_zp
	sta	copy_zp
	lda	hibits_zp
	adc	base_offs_h,x
; C = 0
	adc	dest_zp+1
	sta	copy_zp+1

;******
;* Reverse fast copy
;*
;* IN: len = $01..$100 (len_zp = $00..$ff), C = 0
;*
copy:
	ldy	len_zp
	beq	dc_skp4
dc_lp4:
	lda	(copy_zp),y
	sta	(dest_zp),y
	dey
	bne	dc_lp4
dc_skp4:
	lda	(copy_zp),y
;	sta	(dest_zp),y
	jmp	dc_common
;	bcc	dc_common		; always taken

;******
;* exit out
done:
	rts

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



	if	0
;**************************************************************************
;*
;* NAME  dc_get_byte
;*
;* DESCRIPTION
;*   Get byte from the packed stream.
;*
;******
dc_get_byte:
	lda	dc_ptr
	bne	dcgb_skp1
	dec	dc_ptr+1
dcgb_skp1:
	dec	dc_ptr
dc_ptr	equ	. + 1
	lda.w	$0000
	rts
	endif


end_decruncher:

	seg.u	tables
	org	$0334
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

	seg	code
; eof
