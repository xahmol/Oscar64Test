
.include "loadersymbols-c64.inc"

            .org $080d

            jsr install

loop:       inc $d020

            ldx #<saveparams
            ldy #>saveparams
            jsr save
            bcs error

            ldx #<filename
            ldy #>filename
            jsr loadraw
            bcs error

            lda $04fc
            sta $0400
            bcc loop

error:      inc $d021
            jmp error

saveparams: .word filename
            .word $0400; from
            .word $00fc; length in bytes
            .word $0401; loadaddress
            .word $8000; drive-code buffer, $0800 bytes to scratch

filename:   .byte "savefile", 0

            .res loadraw - *
.incbin "../../build/loader-c64.prg", 2

            .res save - *
.incbin "../../build/save-c64.prg", 2

            .res install - *
.incbin "../../build/install-c64.prg", 2
