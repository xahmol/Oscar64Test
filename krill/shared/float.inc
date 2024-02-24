
.ifndef _FLOAT_INC_
_FLOAT_INC_ = 1

.include "basic.inc"
.include "kernal.inc"

.macro UINT16TOFAC
            ldy #$00
            jsr INT24TOMANTISSA
            sec
            jsr NORMALIZE
.endmacro

.macro INT32TOFAC arg
            lda arg + $00
            ldx arg + $01
            ldy arg + $02
            jsr INT24TOMANTISSA
            lda arg + $03
            sta FACHO
            sec
            jsr NORMALIZE
.endmacro

.endif; FLOAT_INC
