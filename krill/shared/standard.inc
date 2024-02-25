
.ifndef _STANDARD_INC_
_STANDARD_INC_ = 1


.include "cpu.inc"; SKIPWORD


;; binary arithmetics

.define IS_POWER_OF_2(value) (((value) & ((value) - 1)) = 0)

.define ALIGN(value, align) (((value) + (align) - 1) & ~((align) - 1))

.define TOP_BIT(value) (-1 + ((value) >= $1) + ((value) >= $2) + ((value) >= $4) + ((value) >= $8) + ((value) >= $10) + ((value) >= $20) + ((value) >= $40) + ((value) >= $80) + ((value) >= $0100) + ((value) >= $0200) + ((value) >= $0400) + ((value) >= $0800) + ((value) >= $1000) + ((value) >= $2000) + ((value) >= $4000) + ((value) >= $8000))

; rounds up to nearest power of 2
.define PAD(value) (1 + (((value) > $1) * $1) + (((value) > $2) * $2) + (((value) > $4) * $4) + (((value) > $8) * 8) + (((value) > $10) * $10) + (((value) > $20) * $20) + (((value) > $40) * $40) + (((value) > $80) * $80) + (((value) > $100) * $100) + (((value) > $200) * $200) + (((value) > $400) * $400) + (((value) > $800) * $800) + (((value) > $1000) * $1000) + (((value) > $2000) * $2000) + (((value) > $4000) * $4000) + (((value) > $8000) * $8000))


;; subroutine calling using the stack

; arguments are always pushed and popped with 16-bit sizes

.macro PUSH_ARG value
    .ifnblank value
    	    .if (.match (.left (1, {value}), #))
            lda #<(.right (.tcount ({value}) - 1, {value}))
            pha
            lda #>(.right (.tcount ({value}) - 1, {value}))
            pha
         .else
            lda value + 0
            pha
            lda value + 1
            pha
         .endif
    .endif
.endmacro

.macro POP_ARG
            pla
            tay
            pla
.endmacro

.macro CALL address, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8
            .local postcall

            lda #>(postcall - 1)
            pha
            lda #<(postcall - 1)
            pha
            tsx
            PUSH_ARG arg8
            PUSH_ARG arg7
            PUSH_ARG arg6
            PUSH_ARG arg5
            PUSH_ARG arg4
            PUSH_ARG arg3
            PUSH_ARG arg2
            PUSH_ARG arg1
            txa
            pha            
            jmp address
postcall:
.endmacro

.macro VARARGS_START
            pla
            tax
.endmacro

.macro VARARGS_END
            txs
.endmacro


;; memory manipulation

.macro MEMSET address, size, value

    .ifref __memset_impl 
            CALL __memset_impl, address, size, value
    .else
            .local  __post_memset_impl

            CALL __memset_impl, address, size, value; for .ifref detection
            jmp __post_memset_impl

            ; this implementation is optimized for
            ; fast inner loops at reasonable overhead
            ; (only one write access per loop pass)

__memset_impl:
            ; not re-entrant
        .scope

            VARARGS_START
            POP_ARG
            sta memsetlo
            sty memsethi
            POP_ARG
            sta memsetsizelo
            sty memsetsizehi
            POP_ARG
            sta memsetvalue
            VARARGS_END

            ; check if region to fill starts on a page boundary
memsetlo = * + $01
            ldx #$00
            beq memsetpage

            ; if not, fill <256 bytes at the beginning of the region
            sec
            lda #$00
            sbc memsetlo; number of bytes until next page boundary
            sec
memsetsizelo = * + $01
            sbc #$00
            tax
            lda #$00
            sbc memsetsizehi
            bcc :++

            ; region is between two page boundaries
            lda memsetlo
            sta :+ + $01
            lda memsethi
            sta :+ + $02
:           sta a:$00,x
            dex
            bne :-
            rts; that's it

:           ; region stretches beyond at least one page boundary
            lda memsethi
            sta :+ + $02
            lda memsetvalue
            ldx memsetlo
:           sta a:$00,x
            inx
            bne :-
            sec; update memsetsize
           ;ldx #$00
            txa
            sbc memsetlo
            sta :+ + $01
            lda memsetsizelo
:           sbc #$00
            sta memsetsizelo
            bcs :+
            dec memsetsizehi
:

            ; fill whole pages
memsetpage: 
memsetsizehi = * + $01
            ldy #$00
            beq memsetend
            lda memsethi
            sta :+ + $02
memsetvalue = * + $01
            lda #$00
           ;ldx #$00
:           sta a:$00,x
            inx
            bne :-
            inc :- + $02
            dey
            bne :-
            lda :- + $02
            SKIPWORD

memsetend: ; fill remaining <256 bytes
memsethi = * + $01
            lda #$00
            sta :+ + $03
            lda memsetvalue
            ldx memsetsizelo
            inx
:           dex
            sta a:$00,x
            bne :-
            rts

        .endscope

__post_memset_impl:
    .endif; __memset_impl
.endmacro

.endif; !_STANDARD_INC_
