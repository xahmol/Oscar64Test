;**************************************************************************
;*
;* FILE  decrunch_normal.asm
;* Copyright (c) 2015 Daniel Kahlin <daniel@kahlin.net>
;* Written by Daniel Kahlin <daniel@kahlin.net>
;*
;* DESCRIPTION
;*   subsizer 0.7pre1 executable decruncher
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


	ldy	#DECRUNCHER_LEN
tl_lp1:
	lda.w	decruncher_st-1,y
	sta.w	decruncher-1,y
	cpy	#WRAP_LEN+1
	bcs	tl_skp1
	lda.w	wrap_st-1,y
	sta.w	wrap-1,y
tl_skp1:
	dey
	bne	tl_lp1
; Y = 0
	endif

;	ldy	#0
dc_lp01:
	ldx	#4
	jsr	dc_get_bits
	sta	bits,y

	tya
	and	#PART_MASK
	bne	dc_skp01
; Acc = 0
	sta	base_l,y
	sta	base_h,y
	beq	dc_skp02	; always taken
dc_skp01:
	lda	#0
	sta.z	tmp_zp
	ldx	bits-1,y
	sec
dc_lp02:
	rol
	rol.z	tmp_zp
	dex
	bpl	dc_lp02
; C = 0
;	clc
	adc	base_l-1,y
	sta	base_l,y
	lda.z	tmp_zp
	adc	base_h-1,y
	sta	base_h,y
dc_skp02:
	iny
	cpy	#N_PARTS*4+4
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
	org	$f9
tmp_zp:
len_zp:
	ds.b	1
copy_zp:
	ds.w	1
hibits_zp:
	ds.b	1
zp_end:
	seg	code
decruncher_st:
	rorg	zp_end
decruncher:				;+0ftDecruncher

dest_zp:
	dc.w	$0000			;+0ftDestEnd
buf_zp:
	dc.b	$80			;+0ftBufZp


	if	HAVE_LONG_PARTS
tabo:
	dc.b	48,0,16,32
tabb:
	dc.b	2,4,4,4
	else
tabo:
	dc.b	24,0,8,16
tabb:
	dc.b	2,3,3,3
	endif

decrunch_entry:
dc_literal:
	lda	dest_zp
	bne	dc_skp5
	dec	dest_zp+1
dc_skp5:
	dec	dest_zp
	jsr	dc_get_byte
;	ldy	#0
	sta	(dest_zp),y
; 	bcs	dc_lp1		; always taken

decrunch_main:
; Y = 0
;------
; perform actual decrunch
dc_lp1:
	jsr	dc_get_bit
	bcs	dc_literal
; Y = 0
; get length as bits/base.
;	ldy	#$ff+1
dc_lp2:
	iny
	cpy	#N_PARTS
	beq	dc_skp0
	jsr	dc_get_bit
	bcc	dc_lp2
dc_skp0:
	ldx	bits_len-1,y
	jsr	dc_get_bits
; C = 0
	adc	base_len-1,y
	sta	len_zp
; C = 0

;******
;* IN: len = $01..$100 (Acc = $00..$ff)
;* OUT: dest_zp = dest_zp - len,  Y = len-1
;*
	tay
;	clc
	eor	#$ff
	adc	dest_zp
	sta	dest_zp
	bcs	dc_skp22
	dec	dest_zp+1
dc_skp22:

; check end marker here to avoid thrashing carry earlier
	cpy	#$00			;+1ftEndMarkerMinusOne
	beq	done

;******
;* Get selector bits depending on length.
;*
;* IN: len = $01..$100 (Y = $00..$ff)
;* OUT:
;*
	cpy	#4
	bcc	dc_skp2
	ldy	#3
dc_skp2:

; get offset as bits/base.
	ldx	tabb,y
	jsr	dc_get_bits
; C = 0
	adc	tabo,y
	tay

	ldx	bits_offs,y
	jsr	dc_get_bits
; C = 0
	adc	base_offs_l,y
	tax
	lda	hibits_zp
	adc	base_offs_h,y
	tay
; X/Y = offset - 1

	sec
	txa
	adc	dest_zp
	sta	copy_zp
	tya
	adc	dest_zp+1
	sta	copy_zp+1

;******
;* Reverse fast copy
;*
;* IN: len = $01..$100 (len_zp = $00..$ff), C = 0
;*
	ldy	len_zp
	beq	dc_skp4
dc_lp4:
	lda	(copy_zp),y
	sta	(dest_zp),y
	dey
	bne	dc_lp4
dc_skp4:
	lda	(copy_zp),y
	sta	(dest_zp),y
	bcc	dc_lp1		; always taken


;**************************************************************************
;*
;* NAME  dc_get_bits
;*
;* DESCRIPTION
;*   Get bits from the packed stream.
;*
;*   IN:
;*     X         = number of bits to get
;*
;*   OUT:
;*     Acc       = bit 7-0
;*     hibits_zp = bit 15-8
;*     C         = bit 16
;*     Y         = preserved
;*     X         = 0
;*     Z         = 1
;*
;******
dc_get_bits:
	lda	#0
	sta	hibits_zp
	cpx	#1
	bcc	dcg_ex1
dcg_lp1:
	asl	buf_zp
	bne	dcg_skp1
; C=1 (because the marker bit was just shifted out)
	pha
	jsr	dc_get_byte
	rol
	sta	buf_zp
	pla
dcg_skp1:
	rol
	rol	hibits_zp
	dex
	bne	dcg_lp1		; C=0 for all X!=0
dcg_ex1:
	rts


;**************************************************************************
;*
;* NAME  dc_get_bit
;*
;* DESCRIPTION
;*   Get one bit from the packed stream into carry
;*
;*   IN:
;*     -
;*
;*   OUT:
;*     Acc       = ?
;*     C         = bit 0
;*     Y         = preserved
;*     X         = preserved
;*     Z         = 0
;*
;******
dc_get_bit:
	asl	buf_zp
	bne	dcgb_ex1
; C=1 (because the marker bit was just shifted out)
	jsr	dc_get_byte
	rol
	sta	buf_zp
dcgb_ex1:
	rts


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
	lda.w	$0000			;+1ftSrcEnd
	rts

;******
;* exit out
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


	ifnconst MAKE_EXE
	echo "header", begin_header, end_header, end_header-begin_header
	echo "tail", begin_tail, end_tail, end_tail-begin_tail
	echo "decruncher", begin_decruncher, end_decruncher, end_decruncher-begin_decruncher
	echo "[run] decruncher", decruncher, decruncher+DECRUNCHER_LEN, DECRUNCHER_LEN
	echo "[run] tables", begin_tables, end_tables, end_tables-begin_tables
	endif
; eof
