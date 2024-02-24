;
; Copyright (c) 2002 - 2020 Magnus Lind.
;
; This software is provided 'as-is', without any express or implied warranty.
; In no event will the authors be held liable for any damages arising from
; the use of this software.
;
; Permission is granted to anyone to use this software for any purpose,
; including commercial applications, and to alter it and redistribute it
; freely, subject to the following restrictions:
;
;   1. The origin of this software must not be misrepresented; you must not
;   claim that you wrote the original software. If you use this software in a
;   product, an acknowledgment in the product documentation would be
;   appreciated but is not required.
;
;   2. Altered source versions must be plainly marked as such, and must not
;   be misrepresented as being the original software.
;
;   3. This notice may not be removed or altered from any distribution.
;
;   4. The names of this software and/or it's copyright holders may not be
;   used to endorse or promote products derived from this software without
;   specific prior written permission.
;
; -------------------------------------------------------------------
; Known quirks:
;  Can't handle a sequence reference that ends at $ffff. It is left in
;  since it is a corner case and fixing it impacts negatively on
;  performance or backwards compatibility.
;  A simple way to work around this is to not decrunch to address $ffff.
; -------------------------------------------------------------------
; Controls if the shared get_bits routines should be inlined or not.
;INLINE_GET_BITS=1
 IFNCONST INLINE_GET_BITS
INLINE_GET_BITS = 0
 ENDIF
; -------------------------------------------------------------------
; if literal sequences is not used (the data was crunched with the -c
; flag) then the following line can be uncommented for shorter and.
; slightly faster code.
;LITERAL_SEQUENCES_NOT_USED = 1
 IFNCONST LITERAL_SEQUENCES_NOT_USED
LITERAL_SEQUENCES_NOT_USED = 0
 ENDIF
; -------------------------------------------------------------------
; if the sequence length is limited to 256 (the data was crunched with
; the -M256 flag) then the following line can be uncommented for
; shorter and slightly faster code.
;MAX_SEQUENCE_LENGTH_256 = 1
 IFNCONST MAX_SEQUENCE_LENGTH_256
MAX_SEQUENCE_LENGTH_256 = 0
 ENDIF
; -------------------------------------------------------------------
; if the sequence length 3 has its own offset table (the data was
; crunched with the -P+16 flag) then the following
; line must be uncommented.
;EXTRA_TABLE_ENTRY_FOR_LENGTH_THREE = 1
 IFNCONST EXTRA_TABLE_ENTRY_FOR_LENGTH_THREE
EXTRA_TABLE_ENTRY_FOR_LENGTH_THREE = 0
 ENDIF
; -------------------------------------------------------------------
; if sequence offsets are not reused (the data was crunched with the
; -P-32 flag) then the following line must be uncommented. Uncommenting the
; line will also result in shorter and slightly faster code.
;DONT_REUSE_OFFSET = 1
 IFNCONST DONT_REUSE_OFFSET
DONT_REUSE_OFFSET = 0
 ENDIF
; -------------------------------------------------------------------
; if decrunching forwards then the following line must be uncommented.
;DECRUNCH_FORWARDS = 1
 IFNCONST DECRUNCH_FORWARDS
DECRUNCH_FORWARDS = 0
 ENDIF
; -------------------------------------------------------------------
; if split encoding is used (the data is crunched with the -E flag)
; then the following line must be uncommented.
;ENABLE_SPLIT_ENCODING = 1
 IFNCONST ENABLE_SPLIT_ENCODING
ENABLE_SPLIT_ENCODING = 0
 ENDIF

; -------------------------------------------------------------------
; The decruncher jsr:s to the exod_get_crunched_byte address when it wants to
; read a crunched byte into A. This subroutine has to preserve X and Y
; register and must not modify the state of the carry nor the overflow flag.
; -------------------------------------------------------------------
; -------------------------------------------------------------------
; The exod_decrunch function is the heart of the decruncher. (for non split
; crunched files)
; It initializes the decruncher zeropage locations and precalculates the
; decrunch tables and decrunches the data
; This function will not change the interrupt status bit and it will not
; modify the memory configuration.
; -------------------------------------------------------------------
 IF ENABLE_SPLIT_ENCODING != 0
; -------------------------------------------------------------------
; To decrunch files crunched with the split feature (-E) you can't use the
; decrunch function. Instead you call the split_decrunch function. But you
; can only do this if the decrunch table contains the encoding used by the
; file you are decrunching. To generate the correct content for the decrunch
; table call set the get_crunched_byte function to point to the encoding data
; and then call the split_gentable function.
; -------------------------------------------------------------------
 ENDIF
; -------------------------------------------------------------------
; zero page addresses used
; -------------------------------------------------------------------
exod_zp_len_lo = $9e
exod_zp_len_hi = $9f

exod_zp_src_lo  = $ae
exod_zp_src_hi  = exod_zp_src_lo + 1

exod_zp_bits_hi = $a7
 IF DONT_REUSE_OFFSET == 0
exod_zp_ro_state = $a8
 ENDIF

exod_zp_bitbuf  = $fd
exod_zp_dest_lo = exod_zp_bitbuf + 1      ; dest addr lo
exod_zp_dest_hi = exod_zp_bitbuf + 2      ; dest addr hi

 SUBROUTINE exodecrunch
 IF EXTRA_TABLE_ENTRY_FOR_LENGTH_THREE != 0
.encoded_entries = 68
 ELSE
.encoded_entries = 52
 ENDIF

.tabl_bi = exod_decrunch_table
.tabl_lo = exod_decrunch_table + .encoded_entries
.tabl_hi = exod_decrunch_table + .encoded_entries * 2

        ;; refill bits is always inlined
 MAC exod_mac_refill_bits
        pha
        jsr exod_get_crunched_byte
        rol
        sta exod_zp_bitbuf
        pla
 ENDM

 MAC exod_mac_get_bits
 IF INLINE_GET_BITS != 0
        adc #$80                ; needs c=0, affects v
        asl
        bpl .gb_skip
.gb_next:
        asl exod_zp_bitbuf
        bne .gb_ok
        exod_mac_refill_bits
.gb_ok:
        rol
        bmi .gb_next
.gb_skip:
        bvc .skip
.gb_get_hi:
        sec
        sta exod_zp_bits_hi
        jsr exod_get_crunched_byte
.skip:
 ELSE
        jsr exod_get_bits
 ENDIF
 ENDM

 MAC exod_mac_init_zp
; -------------------------------------------------------------------
; init zeropage and x reg. (8 bytes)
;
.init_zp:
        jsr exod_get_crunched_byte
        sta exod_zp_bitbuf - 1,x
        dex
        bne .init_zp
 ENDM

 IF INLINE_GET_BITS == 0
exod_get_bits:
        adc #$80                ; needs c=0, affects v
        asl
        bpl .gb_skip
.gb_next:
        asl exod_zp_bitbuf
        bne .gb_ok
        exod_mac_refill_bits
.gb_ok:
        rol
        bmi .gb_next
.gb_skip:
        bvs .gb_get_hi
        rts
.gb_get_hi:
        sec
        sta exod_zp_bits_hi
        jmp exod_get_crunched_byte
 ENDIF
; -------------------------------------------------------------------
; no code below this comment has to be modified in order to generate
; a working decruncher of this source file.
; However, you may want to relocate the tables last in the file to a
; more suitable address.
; -------------------------------------------------------------------

; -------------------------------------------------------------------
; jsr this label to decrunch, it will in turn init the tables and
; call the decruncher
; no constraints on register content, however the
; decimal flag has to be cleared (it almost always is, otherwise do a cld)
exod_decrunch:
 IF ENABLE_SPLIT_ENCODING != 0
        ldx #3
        jsr .internal_gentable
        jmp .normal_decrunch
exod_split_gentable:
        ldx #1
.internal_gentable:
        jsr .split_init_zp
 ELSE
        ldx #3
        exod_mac_init_zp
 ENDIF
; -------------------------------------------------------------------
; calculate tables (64 bytes) + get_bits macro
; x and y must be #0 when entering
;
        ldy #0
        clc
.table_gen:
        tax
        tya
        and #$0f
        sta .tabl_lo,y
        beq .shortcut            ; start a new sequence
; -------------------------------------------------------------------
        txa
        adc .tabl_lo - 1,y
        sta .tabl_lo,y
        lda exod_zp_len_hi
        adc .tabl_hi - 1,y
.shortcut:
        sta .tabl_hi,y
; -------------------------------------------------------------------
        lda #$01
        sta <exod_zp_len_hi
        lda #$78                ; %01111000
        exod_mac_get_bits
; -------------------------------------------------------------------
        lsr
        tax
        beq .rolled
        php
.rolle:
        asl exod_zp_len_hi
        sec
        ror
        dex
        bne .rolle
        plp
.rolled:
        ror
        sta .tabl_bi,y
        bmi .no_fixup_lohi
        lda exod_zp_len_hi
        stx exod_zp_len_hi
        .BYTE $24
.no_fixup_lohi:
        txa
; -------------------------------------------------------------------
        iny
        cpy #.encoded_entries
        bne .table_gen
; -------------------------------------------------------------------
 IF ENABLE_SPLIT_ENCODING != 0
        rts
exod_split_decrunch:
        ldx #3
        jsr .split_init_zp
; X reg must be 0 here
        sec
.normal_decrunch
 ENDIF
; -------------------------------------------------------------------
; prepare for main decruncher
 IF DONT_REUSE_OFFSET == 0
        ror exod_zp_ro_state
        sec
 ENDIF
        ldy exod_zp_dest_lo
        stx exod_zp_dest_lo
        stx exod_zp_bits_hi
; -------------------------------------------------------------------
; copy one literal byte to destination (11 bytes)
;
.literal_start1:
 IF DECRUNCH_FORWARDS == 0
        tya
        bne .no_hi_decr
        dec exod_zp_dest_hi
 IF DONT_REUSE_OFFSET == 0
        dec exod_zp_src_hi
 ENDIF
.no_hi_decr:
        dey
 ENDIF
        jsr exod_get_crunched_byte
        sta (exod_zp_dest_lo),y
 IF DECRUNCH_FORWARDS != 0
        iny
        bne skip_hi_incr
        inc exod_zp_dest_hi
 IF DONT_REUSE_OFFSET == 0
        inc exod_zp_src_hi
 ENDIF
skip_hi_incr:
 ENDIF
; -------------------------------------------------------------------
; fetch sequence length index (15 bytes)
; x must be #0 when entering and contains the length index + 1
; when exiting or 0 for literal byte
.next_round:
 IF DONT_REUSE_OFFSET == 0
        ror exod_zp_ro_state
 ENDIF
        dex
        lda exod_zp_bitbuf
.no_literal1:
        asl
        bne .nofetch8
        jsr exod_get_crunched_byte
        rol
.nofetch8:
        inx
        bcc .no_literal1
        sta exod_zp_bitbuf
; -------------------------------------------------------------------
; check for literal byte (2 bytes)
;
        beq .literal_start1
; -------------------------------------------------------------------
; check for decrunch done and literal sequences (4 bytes)
;
        cpx #$11
 IF INLINE_GET_BITS != 0
        bcc .skip_jmp
        jmp .exit_or_lit_seq
.skip_jmp:
 ELSE
        bcs .exit_or_lit_seq
 ENDIF
; -------------------------------------------------------------------
; calulate length of sequence (zp_len) (18(11) bytes) + get_bits macro
;
        lda .tabl_bi - 1,x
        exod_mac_get_bits
        adc .tabl_lo - 1,x       ; we have now calculated zp_len_lo
        sta exod_zp_len_lo
 IF MAX_SEQUENCE_LENGTH_256 == 0
        lda exod_zp_bits_hi
        adc .tabl_hi - 1,x       ; c = 0 after this.
        sta exod_zp_len_hi
; -------------------------------------------------------------------
; here we decide what offset table to use (27(26) bytes) + get_bits_nc macro
; z-flag reflects zp_len_hi here
;
        ldx exod_zp_len_lo
 ELSE
        tax
 ENDIF
 IF MAX_SEQUENCE_LENGTH_256 == 0
        lda #0
 ENDIF
 IF DONT_REUSE_OFFSET == 0
; -------------------------------------------------------------------
; here we decide to reuse latest offset or not (13(15) bytes)
;
        bit <exod_zp_ro_state
        bmi .test_reuse
.no_reuse:
 ENDIF
; -------------------------------------------------------------------
; here we decide what offset table to use (17(15) bytes)
;
 IF MAX_SEQUENCE_LENGTH_256 == 0
        sta <exod_zp_bits_hi
 ENDIF
        lda #$e1
 IF EXTRA_TABLE_ENTRY_FOR_LENGTH_THREE != 0
        cpx #$04
 ELSE
        cpx #$03
 ENDIF
        bcs .gbnc2_next
        lda .tabl_bit - 1,x
.gbnc2_next:
        asl exod_zp_bitbuf
        bne .gbnc2_ok
        tax
        jsr exod_get_crunched_byte
        rol
        sta exod_zp_bitbuf
        txa
.gbnc2_ok:
        rol
        bcs .gbnc2_next
        tax
; -------------------------------------------------------------------
; calulate absolute offset (zp_src) (17 bytes) + get_bits macro
;
        lda .tabl_bi,x
        exod_mac_get_bits
 IF DECRUNCH_FORWARDS == 0
        adc .tabl_lo,x
        sta exod_zp_src_lo
        lda exod_zp_bits_hi
        adc .tabl_hi,x
        adc exod_zp_dest_hi
        sta exod_zp_src_hi
 ELSE
        clc
        adc .tabl_lo,x
        eor #$ff
        sta exod_zp_src_lo
        lda exod_zp_bits_hi
        adc .tabl_hi,x
        eor #$ff
        adc exod_zp_dest_hi
        sta exod_zp_src_hi
        clc
 ENDIF
; -------------------------------------------------------------------
; prepare for copy loop (2 bytes)
;
        ldx exod_zp_len_lo
; -------------------------------------------------------------------
; main copy loop (30 bytes)
;
.copy_next:
 IF DECRUNCH_FORWARDS == 0
        tya
        bne .copy_skip_hi
        dec exod_zp_dest_hi
        dec exod_zp_src_hi
.copy_skip_hi:
        dey
 ENDIF
 IF LITERAL_SEQUENCES_NOT_USED == 0
        bcs .get_literal_byte
 ENDIF
        lda (exod_zp_src_lo),y
.literal_byte_gotten:
        sta (exod_zp_dest_lo),y
 IF DECRUNCH_FORWARDS != 0
        iny
        bne copy_skip_hi
        inc exod_zp_dest_hi
        inc exod_zp_src_hi
copy_skip_hi:
 ENDIF
        dex
        bne .copy_next
 IF MAX_SEQUENCE_LENGTH_256 == 0
        lda exod_zp_len_hi
 IF INLINE_GET_BITS != 0
        bne .copy_next_hi
 ENDIF
 ENDIF
        stx exod_zp_bits_hi
 IF INLINE_GET_BITS == 0
        beq .next_round
 ELSE
        jmp .next_round
 ENDIF
 IF MAX_SEQUENCE_LENGTH_256 == 0
.copy_next_hi:
        dec exod_zp_len_hi
        jmp .copy_next
 ENDIF
 IF DONT_REUSE_OFFSET == 0
; -------------------------------------------------------------------
; test for offset reuse (11 bytes)
;
.test_reuse:
        bvs .no_reuse
 IF MAX_SEQUENCE_LENGTH_256 != 0
        lda #$00                ; fetch one bit
 ENDIF
        asl exod_zp_bitbuf
        bne .gbnc1_ok
        pha
        jsr exod_get_crunched_byte
        rol
        sta exod_zp_bitbuf
        pla
.gbnc1_ok:
        rol
        beq .no_reuse            ; bit == 0 => C=0, no reuse
        bne .copy_next           ; bit != 0 => C=0, reuse previous offset
 ENDIF
; -------------------------------------------------------------------
; exit or literal sequence handling (16(12) bytes)
;
.exit_or_lit_seq:
 IF LITERAL_SEQUENCES_NOT_USED == 0
        beq .decr_exit
        jsr exod_get_crunched_byte
 IF MAX_SEQUENCE_LENGTH_256 == 0
        sta exod_zp_len_hi
 ENDIF
        jsr exod_get_crunched_byte
        tax
        bcs .copy_next
.decr_exit:
 ENDIF
        rts
 IF LITERAL_SEQUENCES_NOT_USED == 0
.get_literal_byte:
        jsr exod_get_crunched_byte
        bcs .literal_byte_gotten
 ENDIF
 IF EXTRA_TABLE_ENTRY_FOR_LENGTH_THREE != 0
; -------------------------------------------------------------------
; the static stable used for bits+offset for lengths 1, 2 and 3 (3 bytes)
; bits 2, 4, 4 and offsets 64, 48, 32 corresponding to
; %10010000, %11100011, %11100010
.tabl_bit:
        .BYTE $90, $e3, $e2
 ELSE
; -------------------------------------------------------------------
; the static stable used for bits+offset for lengths 1 and 2 (2 bytes)
; bits 2, 4 and offsets 48, 32 corresponding to %10001100, %11100010
.tabl_bit:
        .BYTE $8c, $e2
 ENDIF

 IF ENABLE_SPLIT_ENCODING != 0
.split_init_zp:
        exod_mac_init_zp
        rts
 ENDIF
; -------------------------------------------------------------------
; end of decruncher
; -------------------------------------------------------------------

; -------------------------------------------------------------------
; this 156 (204) byte table area may be relocated. It may also be
; clobbered by other data between decrunches.
; -------------------------------------------------------------------
exod_decrunch_table:
        .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 IF EXTRA_TABLE_ENTRY_FOR_LENGTH_THREE != 0
        .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 ENDIF
        .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .byte 0,0,0,0,0,0,0,0,0,0,0,0
; -------------------------------------------------------------------
; end of decruncher
; -------------------------------------------------------------------
