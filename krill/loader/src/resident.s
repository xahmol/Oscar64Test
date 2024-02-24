
.fileopt comment, "Loader resident code portion"
.fileopt compiler, "CA65"
.fileopt author, "Gunnar Ruthenberg"

__NO_LOADER_SYMBOLS_IMPORT = 1
__NOIMPORTVARS = 1

.include "loader.inc"
.include "kernal.inc"

.include "cpu.inc"

.include "hal/hal.inc"


HAVE_DECOMPRESSOR    = DECOMPRESSOR <> DECOMPRESSORS::NONE
LOAD_TO_RAM_UNDER_IO = LOAD_UNDER_D000_DFFF & (PLATFORM <> diskio::platform::COMMODORE_16)
HAVE_ENDGETBLOCK     = (PLATFORM <> diskio::platform::COMMODORE_64) | USE_2_MHZ
LOADCOMPD_TO         = LOAD_COMPD_API & LOAD_TO_API
OPENFILE_POLLBLOCK   = DISABLE_WATCHDOG | .defined(OPENFILE_POLLBLOCK_API)

.if LOAD_COMPD_API & (!HAVE_DECOMPRESSOR)
    .error "***** Option LOAD_COMPD_API requires DECOMPRESSOR != DECOMPRESSORS::NONE *****"
.endif

.if MEM_DECOMP_API & (!HAVE_DECOMPRESSOR)
    .error "***** Option MEM_DECOMP_API requires DECOMPRESSOR != DECOMPRESSORS::NONE *****"
.endif

.if MEM_DECOMP_TO_API & (!MEM_DECOMP_API)
    .error "***** Option MEM_DECOMP_TO_API requires MEM_DECOMP_API *****"
.endif

.if HAVE_DECOMPRESSOR & (!LOAD_COMPD_API) & (!MEM_DECOMP_API)
    .error "***** Decompressor included but not used, as neither LOAD_COMPD_API nor MEM_DECOMP_API are enabled *****"
.endif

.if (!LOAD_RAW_API) & (!LOAD_COMPD_API)
    .error "***** No actual loading calls enabled, please select LOAD_RAW_API and/or LOAD_COMPD_API *****"
.endif

.if (FILENAME_MAXLENGTH < 1) | (FILENAME_MAXLENGTH > 16)
    .error "***** Invalid FILENAME_MAXLENGTH setting, please set it to 1..16 *****"
.endif


.segment "DISKIO_ZP" : zeropage

; all zeropage variables can be
; overwritten when the loader is idle

.macro alloc_zpvar symbol
symbol:       .res 1
    .exportzp symbol
.endmacro

.macro alloc_zpvar_2 symbol
symbol:       .res 2
    .exportzp symbol
.endmacro

loader_zp_first = *
.export loader_zp_first

alloc_zpvar loadaddrlo
alloc_zpvar loadaddrhi

.if LOADCOMPD_TO
    alloc_zpvar loadaddroffslo
    alloc_zpvar loadaddroffshi
.endif

.if HAVE_DECOMPRESSOR
    .if MEM_DECOMP_TO_API
    alloc_zpvar decdestlo
    alloc_zpvar decdesthi
    .else
decdestlo:    .res 1
decdesthi:    .res 1
    .endif
    .if DECOMPRESSOR = DECOMPRESSORS::TSCRUNCH
              .res 2; dummy variables for init loop
    .elseif DECOMPRESSOR = DECOMPRESSORS::ZX0
              .res 1; dummy variable for init loop
    .endif
.endif

.if LOAD_VIA_KERNAL_FALLBACK | END_ADDRESS_API
    alloc_zpvar endaddrlo
    alloc_zpvar endaddrhi
.endif

alloc_zpvar_2 BLOCKDESTLO
BLOCKINDEX = BLOCKDESTLO
.if HAVE_DECOMPRESSOR
    alloc_zpvar BLOCKSIZE
.else
    BLOCKSIZE = BLOCKINDEX + 1
.endif
.if LOAD_COMPD_API | LOAD_TO_RAM_UNDER_IO
    alloc_zpvar STACKPOINTER
.endif
.if HAVE_DECOMPRESSOR
    alloc_zpvar STREAMAVAIL
.endif

.if PLATFORM <> diskio::platform::COMMODORE_16
    alloc_zpvar GETBYTE_CLOCK_ATN_HI
.endif

.if LOAD_VIA_KERNAL_FALLBACK
    alloc_zpvar KERNALBLKC
.endif

DECOMPVARS:
.exportzp DECOMPVARS

.if DECOMPRESSOR = DECOMPRESSORS::NONE

.elseif DECOMPRESSOR = DECOMPRESSORS::BITNAX
    NO_ZP_READ_PTR = 1
    POLLBLOCK_PRESERVE_X = 1
              .res 7
.elseif DECOMPRESSOR = DECOMPRESSORS::BYTEBOOZER2
    NO_ZP_READ_PTR = 1
    POLLBLOCK_PRESERVE_X = 1
              .res 1
.elseif DECOMPRESSOR = DECOMPRESSORS::DOYNAX_LZ
    NO_ZP_READ_PTR = 1
    POLLBLOCK_PRESERVE_X = 1
              .res 3
.elseif DECOMPRESSOR = DECOMPRESSORS::EXOMIZER
    NO_BLOCK_INTERFACE = 1
              .res 9
.elseif DECOMPRESSOR = DECOMPRESSORS::LEVELCRUSH
    NO_BLOCK_INTERFACE = 1
              .res 2
.elseif DECOMPRESSOR = DECOMPRESSORS::LZSA2
              .res 13
.elseif DECOMPRESSOR = DECOMPRESSORS::NUCRUNCH
    NO_ZP_READ_PTR = 1
    POLLBLOCK_PRESERVE_X = 1
              .res 5
.elseif DECOMPRESSOR = DECOMPRESSORS::PUCRUNCH
    NO_BLOCK_INTERFACE = 1
              .res 3
.elseif DECOMPRESSOR = DECOMPRESSORS::SUBSIZER
    NO_BLOCK_INTERFACE = 1
              .res 8
.elseif DECOMPRESSOR = DECOMPRESSORS::TINYCRUNCH
    EXTRAREADAHEAD = 1
              .res 6
.elseif DECOMPRESSOR = DECOMPRESSORS::TSCRUNCH
              .res 5
.elseif DECOMPRESSOR = DECOMPRESSORS::ZX0
    USE_DALI = 1
              .res 5
.endif

.ifndef POLLBLOCK_PRESERVE_X
    POLLBLOCK_PRESERVE_X = 0
.endif

.ifdef NO_BLOCK_INTERFACE
    HAVE_BLOCK_INTERFACE = 0
    NO_ZP_READ_PTR = 1
    decompsrc      = getstrmbyt + 1
.else
    HAVE_BLOCK_INTERFACE = 1
.endif

.ifndef EXTRAREADAHEAD
    EXTRAREADAHEAD = 0
.endif

; base read-ahead of 1 due to read 254/use 256 bytes STREAMAVAIL inaccuracy (plus 1 for >= ~128 blocks, see getblock)
BASEREADAHEAD = 1
READAHEAD     = BASEREADAHEAD + EXTRAREADAHEAD

.ifdef NO_ZP_READ_PTR
    ZP_READ_PTR = 0
.else
    ZP_READ_PTR = 1
.endif


HAVE_GETBYTE = !HAVE_BLOCK_INTERFACE

.macro SET_DECSRC_LO
    .if LOAD_COMPD_API
        .if ZP_READ_PTR
            sta .lobyte(decompsrc)
        .endif
        .if HAVE_GETBYTE
            sta decompsrc
        .endif
     .endif; LOAD_COMPD_API
.endmacro

.macro SET_DECSRC_HI
    .if LOAD_COMPD_API
        .if ZP_READ_PTR
            sta .lobyte(decompsrc + 1)
        .else
            sta decompsrc + 1
            .if DECOMPRESSOR = DECOMPRESSORS::ZX0
                .if READ2_OPT
            sta lz_read_2 + 2
                .endif
            sta lz_read_3 + 2
            .endif
        .endif
     .endif; LOAD_COMPD_API
.endmacro


loader_zp_last = * - 1
.export loader_zp_last

            CHECK_LOADER_ZP_ADDRESSES

.segment "DISKIO"


.if PLATFORM = diskio::platform::COMMODORE_16
KERNAL_FALLBACK_WAIT_FOR_BLOCK_READY_DELAY = $0c
.else
KERNAL_FALLBACK_WAIT_FOR_BLOCK_READY_DELAY = $07
.endif


.ifdef RESIADDR
            .org RESIADDR - 2
            .word * + 2; load address
.endif

            CHECK_RESIDENT_START_ADDRESS

.if LOAD_RAW_API

.export loadraw

            ; --- load file without decompression ---
            ; in:  x/y - x: lo, y: hi to 0-terminated filename string,
            ;            zero-length file name will load next file
            ;      c - if LOAD_TO_API != 0, c = 0: load to address as stored in the file
            ;                               c = 1: load to caller-specified address (loadaddrlo/hi)
            ; out: c - set on error
            ;      a - status

            ; C-64/128: when LOAD_UNDER_D000_DFFF is non-0, this call assumes that the IO space at $d000 is enabled
loadraw:    jsr openfile
    .if LOAD_VIA_KERNAL_FALLBACK
            bcs openerror; only with kernal fallback because only then the call might fail
    .endif; LOAD_VIA_KERNAL_FALLBACK

    .if LOAD_TO_RAM_UNDER_IO
            BUFFER_MEMCONFIG
    .endif; LOAD_TO_RAM_UNDER_IO

    .if LOAD_COMPD_API | LOAD_TO_RAM_UNDER_IO
            tsx
            stx STACKPOINTER
    .endif; LOAD_COMPD_API
:
    .if LOAD_VIA_KERNAL_FALLBACK & LOAD_COMPD_API
            lda #0
            sta STREAMAVAIL
    .endif; LOAD_VIA_KERNAL_FALLBACK & LOAD_COMPD_API

            jsr pollblock
            bcc :-

.if LOAD_TO_RAM_UNDER_IO
            RESTORE_MEMCONFIG_Y
.endif
            cmp #diskio::status::OK + 1
    .if LOAD_VIA_KERNAL_FALLBACK
openerror:
    .endif; LOAD_VIA_KERNAL_FALLBACK
            rts

.endif; LOAD_RAW_API

.if LOAD_COMPD_API

.export loadcompd
    .if DISABLE_WATCHDOG
.export loadcompdopen
.export loadcompdexecute
    .endif; DISABLE_WATCHDOG

            ; --- load a compressed file ---
            ; in:  x/y - x: lo, y: hi to 0-terminated filename string,
            ;            zero-length file name will load next file
            ;      c - if LOAD_TO_API != 0, c = 0: load to address as stored in the file
            ;                               c = 1: load with caller-specified address offset (loadaddroffslo/hi)
            ; out: c - set on error
            ;      a - status

            ; C-64/128: when LOAD_UNDER_D000_DFFF is non-0, this call assumes that the IO space at $d000 is enabled
loadcompd:
    .if LOAD_TO_API
            bcs :+
            clc
            jsr openfile
            jmp compdfileopen
:
    .endif; LOAD_TO_API
            jsr loadcompdopen
compdfileopen:
    .if LOAD_VIA_KERNAL_FALLBACK
            ; only with kernal fallback because only then the call can fail
            bcc :+
            rts
:
    .endif; LOAD_VIA_KERNAL_FALLBACK

loadcompdexecute:

    .if LOAD_TO_RAM_UNDER_IO
            BUFFER_MEMCONFIG
    .endif; LOAD_TO_RAM_UNDER_IO

            tsx
            stx STACKPOINTER

    .if LOAD_TO_RAM_UNDER_IO
            ENABLE_ALL_RAM
    .endif; LOAD_TO_RAM_UNDER_IO

            jsr decompress

    .if LOAD_TO_RAM_UNDER_IO
            ENABLE_IO_SPACE
    .endif; LOAD_TO_RAM_UNDER_IO

            ; decompression is finished

            ; handle case that decompressing is as quick as loading,
            ; this will fetch the loading finished status and ack loading,
            ; and also loads any remaining uncompressed blob with in-place decompression
:           jsr pollblock
            bcc :-

            ; loading and decompression is done

            OK_CLC; a = #diskio::status::OK; $00, clc = all ok
.endif; !LOAD_COMPD_API

pollfail:
.if LOAD_VIA_KERNAL_FALLBACK
            stx :+ + 1; x holds KERNAL error code
.endif; LOAD_VIA_KERNAL_FALLBACK

.if LOAD_COMPD_API | LOAD_TO_RAM_UNDER_IO
            ldx STACKPOINTER
            txs
.endif; !LOAD_COMPD_API

.if LOAD_TO_RAM_UNDER_IO
            RESTORE_MEMCONFIG_Y
.endif

.if LOAD_VIA_KERNAL_FALLBACK
            php
            tay
            BRANCH_IF_NOT_INSTALLED :+
            plp
polldone:   php
            IDLE
:           ldx #0; x holds KERNAL error code
            tya
            plp
.else; !LOAD_VIA_KERNAL_FALLBACK
polldone:   IDLE
.endif; !LOAD_VIA_KERNAL_FALLBACK

eofidle:
.if DECOMPRESSOR = DECOMPRESSORS::PUCRUNCH
            ; return execution address in x/y
            ldx lo + 1
            ldy hi + 1
.endif; DECOMPRESSOR = DECOMPRESSORS::PUCRUNCH
blknotrdy:
loaddone:   rts

POLL_RESTORE = LOAD_VIA_KERNAL_FALLBACK | HAVE_ENDGETBLOCK

.if POLL_RESTORE

pollfailr:  tay
            ENDGETBLOCK
            IDLE
            tya
            jmp pollfail

polldoner:  tay
            ENDGETBLOCK
            tya
            jmp polldone

.endif; POLL_RESTORE

.if OPENFILE_POLLBLOCK
.export pollblock
.endif; OPENFILE_POLLBLOCK

pollblock:
.if LOAD_VIA_KERNAL_FALLBACK
            BRANCH_IF_INSTALLED :+
            jmp kernalgblk
:
.endif; LOAD_VIA_KERNAL_FALLBACK

            POLL_BLOCK eofidle, blknotrdy, pollfail
            SEND_BLOCK_SIGNAL

            lda #OPC_RTS; disable getblock store and loop
            jsr getbyteswt; get next contiguous block index/block size or error/eof code
           ;sec
            tax
            inx
.if POLL_RESTORE
            beq pollfailr; branch if a = $ff = diskio::status::FILE_NOT_FOUND
            tay
            beq polldoner
.else; !POLL_RESTORE
            beq pollfail; branch if a = $ff = diskio::status::FILE_NOT_FOUND
            tay
            beq polldone
.endif; !POLL_RESTORE

            dey
            jsr get1byte; get block index and last block size/next contiguous block index flag

            cmp #$80; sign extension
            ror
            bcs :+; branch if file's last block
.if LOAD_COMPD_API
            sty STREAMAVAIL
.endif; LOAD_COMPD_API
            ldy #$01; block size
:           clc
            adc BLOCKINDEX
            sta BLOCKINDEX
            clc
            bne calcaddr

            ; first block: get load address

            jsr get1byte; load address lo
.if LOADCOMPD_TO
            clc
            adc loadaddroffslo
            php
.endif; LOADCOMPD_TO
storeladrl: sta loadaddrlo; is changed to lda on load_to
            SET_DECSRC_LO
            jsr get1byte; load address hi
.if LOADCOMPD_TO
            plp
            adc loadaddroffshi
            sec
.endif; LOADCOMPD_TO
storeladrh: sta loadaddrhi; is changed to lda on load_to
            SET_DECSRC_HI
           ;sec

calcaddr:   ; calculate the position in memory according to the block index,
            ; this is performing: pos = loadaddr + BLOCKINDEX * 254 - (BLOCKINDEX ? 2 : 0)
            php
            lda loadaddrlo
            sbc BLOCKINDEX
            pha
            lda loadaddrhi
            adc BLOCKINDEX
            tax
            pla
            plp
            sbc BLOCKINDEX
            bcs :+
            dex
:           clc
            sty BLOCKSIZE
            sbc BLOCKSIZE
            sta storebyte + 1

            ; getblock loop/get1byte subroutine

.if LOAD_TO_RAM_UNDER_IO
            ; trading off size for speed: choose either of two getblock loops
            ; depending on the destination of the data to be downloaded
            php
            txa
            sbc #1
            cmp #.hibyte($cf00)
            bcc :+
            cmp #.hibyte($e000)
    .if (PLATFORM = diskio::platform::COMMODORE_128) & USE_ASYNCHRONOUS_BURST_HANDSHAKE
            bcs :+
            jmp getblockio
    .else; !((PLATFORM = diskio::platform::COMMODORE_128) & USE_ASYNCHRONOUS_BURST_HANDSHAKE)
            bcc getblockio
    .endif; !((PLATFORM = diskio::platform::COMMODORE_128) & USE_ASYNCHRONOUS_BURST_HANDSHAKE)
:           plp
.endif; LOAD_TO_RAM_UNDER_IO

            lda #OPC_STA_ABSY; enable getblock store and loop
getbyteswt: sta storebyte
            txa
            sbc #1
            sta storebyte + 2

.macro STORE
storebyte:  sta $0000,y
.endmacro; STORE
get1byte:   RECEIVE STORE, recvdblock

.if LOAD_TO_RAM_UNDER_IO
recvdblock: jmp gotblock

getblockio: plp
            sta storebytio + 2
            lda storebyte + 1
            sta storebytio + 1

            RECEIVE STOREBYTE_ALLRAM, gotblock
.endif; LOAD_TO_RAM_UNDER_IO

EARLY_RECEIVE_RTS = HAVE_ENDGETBLOCK | END_ADDRESS_API | OPENFILE_POLLBLOCK

.if EARLY_RECEIVE_RTS
.ifdef recvdblock
gotblock:
.else
recvdblock:
.endif

.endif; EARLY_RECEIVE_RTS

.if END_ADDRESS_API

            ldx storebyte + 1
            cpx endaddrlo
            ldy storebyte + 2
            iny
            tya
            sbc endaddrhi
            bcc :+
            stx endaddrlo
            sty endaddrhi
:           ldy #0

.endif; END_ADDRESS_API

.if HAVE_ENDGETBLOCK
            ENDGETBLOCK
.endif; HAVE_ENDGETBLOCK

.if EARLY_RECEIVE_RTS
    .if OPENFILE_POLLBLOCK
            lda #diskio::status::OK
    .endif; OPENFILE_POLLBLOCK
            clc
            rts

.endif; EARLY_RECEIVE_RTS


.if OPENFILE_POLLBLOCK
.export openfile
.endif; OPENFILE_POLLBLOCK

openfile:
.if LOADCOMPD_TO
            lda #$00
            sta loadaddroffslo
            sta loadaddroffshi
.endif; LOADCOMPD_TO
.if LOAD_TO_API
            lda #OPC_LDA_ZP
            bcs :+
loadcompdopen:
            lda #OPC_STA_ZP
:           sta storeladrl
            sta storeladrh
.else; !LOAD_TO_API
loadcompdopen:
.endif; !LOAD_TO_API

.if MEM_DECOMP_TO_API
            lda #OPC_STA_ZP
            sta storedadrl
            sta storedadrh
.endif; MEM_DECOMP_TO_API

.if LOAD_VIA_KERNAL_FALLBACK
    .if LOAD_COMPD_API
            lda #0
            sta STREAMAVAIL
    .endif; LOAD_COMPD_API

            BRANCH_IF_INSTALLED :+
            jmp kernalopen
:
.endif; LOAD_VIA_KERNAL_FALLBACK

            jsr wakeup

:           BRANCH_IF_BLOCK_NOT_READY :-

           ;ldy #0
sendname:   lda (BLOCKDESTLO),y
            pha
            SENDBYTE sendstore
            iny
            pla
            bne sendname

.if LOAD_VIA_KERNAL_FALLBACK
            ; check whether the loader is still installed
            ldx #KERNAL_FALLBACK_WAIT_FOR_BLOCK_READY_DELAY - 1; some delay until the drive side is ready
:           dex
            bpl :-
            SET_FLAGS_N_DATA_V_CLK
            bvc :+

            ; if not, try again with KERNAL routines
            ldx BLOCKDESTLO
            ldy BLOCKDESTLO + 1
            jmp kernalopen

:
.endif; LOAD_VIA_KERNAL_FALLBACK

.if DECOMPRESSOR = DECOMPRESSORS::ZX0
    .if USE_DALI
    .else
            ldy #$40; .lz_bits
    .endif
.endif; DECOMPRESSOR = DECOMPRESSORS::ZX0

wakeup:     stx BLOCKINDEX; = BLOCKDESTLO, filename pointer lobyte parameter
            sty BLOCKINDEX + 1

            ldy #0
.if HAVE_GETBYTE
            stx getstrmbyt + 1
.endif; HAVE_GETBYTE
.if LOAD_COMPD_API
            sty STREAMAVAIL
.endif; LOAD_COMPD_API
.if END_ADDRESS_API
            sty endaddrlo
            sty endaddrhi
.endif; END_ADDRESS_API
            CLEAR sendstore
            RECEIVE_SETUP

.if LOAD_VIA_KERNAL_FALLBACK
            clc
.endif; LOAD_VIA_KERNAL_FALLBACK

.ifndef recvdblock
recvdblock:
.endif
.ifndef gotblock
gotblock:
.endif
            rts

.macro POLLBLOCK
            .local noblock

    .if LOAD_COMPD_API
        .if LOAD_TO_RAM_UNDER_IO
            BUFFER_MEMCONFIG
            ENABLE_IO_SPACE
        .endif; LOAD_TO_RAM_UNDER_IO

        .if LOAD_VIA_KERNAL_FALLBACK
            BRANCH_IF_NOT_INSTALLED noblock
        .endif; LOAD_VIA_KERNAL_FALLBACK

            BRANCH_IF_BLOCK_NOT_READY noblock

        .if POLLBLOCK_PRESERVE_X
            txa
            pha
        .endif; POLLBLOCK_PRESERVE_X
            jsr pollblock
        .if POLLBLOCK_PRESERVE_X
            pla
            tax
        .endif; POLLBLOCK_PRESERVE_X
noblock:
        .if LOAD_TO_RAM_UNDER_IO
            RESTORE_MEMCONFIG_Y
            ldy #0
        .endif; LOAD_TO_RAM_UNDER_IO
    .endif; LOAD_COMPD_API
.endmacro

.macro GETBLOCK page
            .local getblock
            .local eof

    .if LOAD_TO_RAM_UNDER_IO
            BUFFER_MEMCONFIG
            ENABLE_IO_SPACE
    .endif; LOAD_TO_RAM_UNDER_IO

getblock:   jsr pollblock
            bcs eof
            lda STREAMAVAIL; add 1 for read 254/use 256 bytes STREAMAVAIL
            asl            ; inaccuracy starting with 128 file blocks
            lda #READAHEAD + 1; +1 because the following sbc will subtract one too many due to cleared carry
            adc page
           ;clc
            sbc loadaddrhi
            cmp STREAMAVAIL
            bcs getblock
eof:
    .if LOAD_TO_RAM_UNDER_IO
            RESTORE_MEMCONFIG_Y
            ldy #0
    .endif; LOAD_TO_RAM_UNDER_IO
.endmacro

.if HAVE_GETBYTE

getbyte:    inc getstrmbyt + 1
            beq :+

    .if LOAD_TO_RAM_UNDER_IO
            ENABLE_IO_SPACE
    .endif; LOAD_TO_RAM_UNDER_IO

    .if LOAD_VIA_KERNAL_FALLBACK
            BRANCH_IF_NOT_INSTALLED retstrmbyt
    .endif; LOAD_VIA_KERNAL_FALLBACK

            BRANCH_IF_BLOCK_READY :++

retstrmbyt:
    .if LOAD_TO_RAM_UNDER_IO
            ENABLE_ALL_RAM
    .endif; LOAD_TO_RAM_UNDER_IO

getstrmbyt: lda $ff00
            rts

:           inc getstrmbyt + 2

:           php
            txa
            pha
            tya
            pha
            GETBLOCK getstrmbyt + 2
            pla
            tay
            pla
            tax
            plp
            jmp retstrmbyt

.endif; HAVE_GETBYTE

.if FILE_EXISTS_API

.export fileexists

            ; --- check if file exists ---
            ; in:  x/y - x: lo, y: hi to 0-terminated filename string
            ; out: c - set on file not found or error
            ;      a - status
fileexists:
    .if LOAD_VIA_KERNAL_FALLBACK
            BRANCH_IF_INSTALLED xinstalled

            BUFFER_MEMCONFIG
            ENABLE_KERNAL_SERIAL_ROUTINES
            jsr :+
            RESTORE_MEMCONFIG_Y
            rts

:           jsr openfile
            bcs xreturn
            ldx LA
            jsr CHKIN
            jsr BASIN
            lda STATUS
            pha
            jsr KERNLCLOSE
            pla
            beq :+
            lda #diskio::status::FILE_NOT_FOUND
            sec
            rts
:           OK_CLC
            rts
xinstalled:
    .endif; LOAD_VIA_KERNAL_FALLBACK

            jsr openfile
xblknotrdy: POLL_BLOCK xeofidle, xblknotrdy, xpollfail
            CLOSE_FILE
            lda #diskio::status::FILE_NOT_FOUND
            bcc xreturn
            lda #diskio::status::OK
            SKIPWORD
xeofidle:
xpollfail:  lda #diskio::status::DEVICE_NOT_PRESENT
xreturn:    cmp #diskio::status::OK + 1
            rts

.endif; FILE_EXISTS_API

.if CLOSE_FILE_API

.export closefile

            ; ----- close an open file -----
            ; in:  nothing
            ; out: undefined
closefile:
    .if LOAD_VIA_KERNAL_FALLBACK
            BRANCH_IF_INSTALLED cinstalled

            BUFFER_MEMCONFIG
            ENABLE_KERNAL_SERIAL_ROUTINES
            jsr KERNLCLOSE
            RESTORE_MEMCONFIG_Y
            rts
cinstalled:
    .endif; LOAD_VIA_KERNAL_FALLBACK

cblknotrdy: POLL_BLOCK ceofidle, cblknotrdy, cpollfail
            CLOSE_FILE
ceofidle:
cpollfail:  rts

.endif; CLOSE_FILE_API

.if LOAD_VIA_KERNAL_FALLBACK

.export KERNLCLOSE

kernalopen: BUFFER_MEMCONFIG
            ENABLE_KERNAL_SERIAL_ROUTINES
            jsr :+
            RESTORE_MEMCONFIG_Y
            rts
:
    .if KERNAL_FALLBACK_SEI_WORKAROUNDS
            ENABLE_WAITBUSY_KERNAL
    .endif; KERNAL_FALLBACK_SEI_WORKAROUNDS

            stx namestrpos
            sty namestrpos + 1
            ldx #$ff
:           inx
namestrpos = * + 1
            lda a:$00,x
            bne :-
            txa
            pha; name length

    .if PLATFORM = diskio::platform::COMMODORE_128
            lda #0
            sta FNLEN
            lda #COMMAND_ERROR_CHANNEL
            ldx FA
            tay
            jsr SETLFS
            jsr OPEN
            bcs burstopner

        .if KERNAL_FALLBACK_OPEN_SEI_WORKAROUNDS

            PUSH_CLOCKCONFIG_AND_FORCE_SLOW_CLOCK

            CLEAR_DATA_OUT_CLEAR_CLK_OUT_ASSERT_ATN
:           SET_FLAGS_N_DATA_V_CLK
            bpl :-

            ldx #$b8; delay
:           dex     ; of
            bne :-  ; ~1 ms

            lda FA
            sta DFLTO
            ora #SA_LISTEN
            sta BSOUR
            sei
            jsr NOEOI; send byte
            lda #SA_OPENCHANNEL | COMMAND_ERROR_CHANNEL
            jsr SECND; send listen secondary address

            POP_CLOCKCONFIG

        .else; !KERNAL_FALLBACK_SEI_WORKAROUNDS
            ldx LA
            jsr CKOUT
        .endif; !KERNAL_FALLBACK_SEI_WORKAROUNDS
            bcc :+
burstopner: tax
            pla; name length
            txa
            jmp kernlopner

:           ldy #burstldcme - burstldcmd
:           lda burstldcmd - 1,y
            jsr BSOUT
            dey
            bne :-
            pla; name length
            sta FNLEN
            lda namestrpos
            sta FNADR
            lda namestrpos + 1
            sta FNADR + 1
:           lda (FNADR),y
            jsr BSOUT
            iny
            cpy FNLEN
            bne :-
            jsr CLRCH
            bit SERIAL
            bvs burstload

            lda FNLEN
            pha
            lda LA
            jsr CLOSE
            jmp noburstlod

burstload:  START_BURST_LOAD

            jmp kernalfinp

getburstby: GET_BURST_BYTE
            rts

burstldcmd: .byte $1f, "0u"; read backwards
burstldcme:

noburstlod:
    .endif; PLATFORM = diskio::platform::COMMODORE_128

            PREPARE_PARALLEL_CHECK

            lda #KERNALFILENO
            ldx FA
            ldy #$00
            jsr SETLFS
            pla; name length
            ldx namestrpos
            ldy namestrpos + 1
            jsr SETNAM
            jsr OPEN
            bcs kernlopner

    .if KERNAL_FALLBACK_OPEN_SEI_WORKAROUNDS
            BRANCH_IF_DRIVE_PARALLEL noseiwrkar

        .if USE_2_MHZ
            PUSH_CLOCKCONFIG_AND_FORCE_SLOW_CLOCK
        .endif
            CLEAR_DATA_OUT_CLEAR_CLK_OUT_ASSERT_ATN
:           SET_FLAGS_N_DATA_V_CLK
            bpl :-
            ldx #$b8; delay
:           dex     ; of
            bne :-  ; ~1 ms
            lda FA
            sta DFLTN
            ora #SA_TALK
            sta BSOUR
            sei
            jsr NOEOI; send byte
            lda #SA_OPENCHANNEL; secondary address
            jsr TKSA; send talk secondary address
        .if USE_2_MHZ
            POP_CLOCKCONFIG
        .endif
            jmp kernalfinp
noseiwrkar:
    .endif; !KERNAL_FALLBACK_SEI_WORKAROUNDS

            ldx LA
            jsr CHKIN

kernalfinp: ldx #$ff
            stx KERNALBLKC
    .if HAVE_GETBYTE
            stx getstrmbyt + 1
    .endif

            ; file not found is not detected at this point
            ; but after "getting" the load address,
            ; the busy LED will keep flashing

            OK_CLC
            rts

kernlopner: tax
            lda #diskio::status::DEVICE_NOT_PRESENT
            cpx #OPEN_DEVICENOTPRESENT
            beq :+
            lda #diskio::status::GENERIC_KERNAL_ERROR
:           sec; error
            rts

kernalgblk:
    .if LOAD_COMPD_API
            clc
            lda #READAHEAD + 1; +1 because the following sbc will subtract one too many due to cleared carry
        .if ZP_READ_PTR
            adc .lobyte(decompsrc + 1)
        .else
            adc decompsrc + 1
        .endif
           ;clc
            sbc loadaddrhi
            cmp STREAMAVAIL
            bcs :+
            rts; requested page is already in memory
:
    .endif; LOAD_COMPD_API

            BUFFER_MEMCONFIG
            ENABLE_KERNAL_SERIAL_ROUTINES
            jsr dokernalgb
            RESTORE_MEMCONFIG_Y
    .if LOAD_COMPD_API
            bcc kernalgblk
            beq :+
    .else; !LOAD_COMPD_API
            beq :+
            bcc :+
    .endif; !LOAD_COMPD_API
            jmp pollfail
:           rts

dokernalgb: ldx KERNALBLKC
            bne kernalgble

            ldx #$fe; $0100 bytes minus 2 bytes for track/sector link

    .if PLATFORM = diskio::platform::COMMODORE_128
            bit SERIAL
            bvc :+
            jsr gburstatus
            bcc :+
            jmp kernlgberr
:
    .endif; PLATFORM = diskio::platform::COMMODORE_128

            stx KERNALBLKC

kernalgble: cpx #$ff
            bne kernalgblp

            inc KERNALBLKC; EOF may happen in first block

            ; retrieve load address

            ldx #$fc; $0100 bytes minus 2 bytes track/sector link and 2 bytes load address

    .if PLATFORM = diskio::platform::COMMODORE_128
            bit SERIAL
            bvc burstopnok
            jsr getburstby; status
            cmp #KERNAL_STATUS_ERROR_BURST
            bcc burstopnok
            bne :+
            lda #diskio::status::FILE_NOT_FOUND
:           cmp #KERNAL_STATUS_EOF_BURST
            beq :+
            ; this is a job error code
            jmp KERNLCLOSE
:           jsr getburstby
            tax
            dex; load address
            dex
burstopnok:
    .endif; PLATFORM = diskio::platform::COMMODORE_128

    .if LOAD_TO_API
            lda #OPC_STA_ZP
            cmp storeladrl
            beq nokrnlodto

            lda loadaddrlo
            sta endaddrlo
            lda loadaddrhi
            sta endaddrhi

        .if PLATFORM = diskio::platform::COMMODORE_128
            bit SERIAL
            bvc :+
            jsr getburstby; skip load
            jsr getburstby; address
            jmp kern1stblk
:
        .endif; PLATFORM = diskio::platform::COMMODORE_128
            jsr BASIN; skip load
            jsr BASIN; address
            jmp kern1stblk
nokrnlodto:
    .endif; LOAD_TO_API

    .if PLATFORM = diskio::platform::COMMODORE_128
            bit SERIAL
            bvc :+
            jsr getburstby
            jmp :++
:           jsr BASIN
:
    .else; !PLATFORM = diskio::platform::COMMODORE_128
            jsr BASIN
    .endif; !PLATFORM = diskio::platform::COMMODORE_128
    .if LOADCOMPD_TO
            clc
            adc loadaddroffslo
            php
    .endif; LOADCOMPD_TO
            sta loadaddrlo
kernalstrl: sta endaddrlo
            SET_DECSRC_LO

    .if PLATFORM = diskio::platform::COMMODORE_128
            bit SERIAL
            bvc :+
            jsr getburstby
            jmp :++
:           jsr BASIN
:
    .else; !PLATFORM = diskio::platform::COMMODORE_128
            jsr BASIN
    .endif; !PLATFORM = diskio::platform::COMMODORE_128
    .if LOADCOMPD_TO
            plp
            adc loadaddroffshi
    .endif; LOADCOMPD_TO
            sta loadaddrhi
kernalstrh: sta endaddrhi
            SET_DECSRC_HI

kern1stblk: lda STATUS
            bne kernfnotf; #diskio::status::FILE_NOT_FOUND; cannot determine type of error

kernalgblp:
    .if PLATFORM = diskio::platform::COMMODORE_128
            bit SERIAL
            bvc :+
            jsr getburstby
            jmp kernbytldd
:
    .endif; PLATFORM = diskio::platform::COMMODORE_128

            lda STATUS
            bne kernlgberr

    .if KERNAL_FALLBACK_SEI_WORKAROUNDS
            BRANCH_IF_DRIVE_PARALLEL :++
:           BRANCH_IF_BLOCK_NOT_READY :-
:
    .endif; KERNAL_FALLBACK_SEI_WORKAROUNDS

            jsr BASIN

            ldy STATUS
            beq kernbytldd
            cpy #KERNAL_STATUS_EOF; $40
            bne KERNLCLOSE
            pha
            tya
            jsr KERNLCLOSE
            pla

kernbytldd:
    .if LOAD_TO_RAM_UNDER_IO
            ENABLE_ALL_RAM_Y
    .endif; LOAD_TO_RAM_UNDER_IO

            ldy #0
            sta (endaddrlo),y

    .if LOAD_TO_RAM_UNDER_IO
            ENABLE_KERNAL_SERIAL_ROUTINES
    .endif; LOAD_TO_RAM_UNDER_IO

            inc endaddrlo
            bne :+
            inc endaddrhi
:           dex
            bne kernalgblp

            stx KERNALBLKC

    .if LOAD_COMPD_API
            clc
            lda endaddrhi
            sbc loadaddrhi
            bcs :+
            lda #0
:           sta STREAMAVAIL
    .endif; LOAD_COMPD_API

            clc
kernalbeof: lda #diskio::status::OK
            rts

kernlgberr: cmp #KERNAL_STATUS_EOF; $40
            beq kernalbeof; carry is set when branching
            sec
            rts

    .if PLATFORM = diskio::platform::COMMODORE_128
gburstatus: lda STATUS
            cmp #KERNAL_STATUS_ERROR_BURST
            bcc :++
            cmp #KERNAL_STATUS_EOF_BURST
            bne :+
            lda #KERNAL_STATUS_EOF; $40
            sta STATUS
:           jsr KERNLCLOSE
            bcs :++

:           jsr getburstby
            cmp #KERNAL_STATUS_ERROR_BURST
            bcc :+
            sta STATUS
            cmp #KERNAL_STATUS_EOF_BURST
            bne :--; branch if not EOF, this is a job error code
            jsr getburstby
            tax
            clc
:           rts
    .endif; PLATFORM = diskio::platform::COMMODORE_128

kernfnotf:  lda #diskio::status::FILE_NOT_FOUND; cannot determine type of error

            ; EOF or error, close file
KERNLCLOSE: pha; KERNAL status byte

            lda #KERNALFILENO
            jsr CLOSE
            jsr CLALL
            jsr CLRCH

            pla; KERNAL status byte
    .if PLATFORM = diskio::platform::COMMODORE_16
            sta STATUS; the CLRCH call above sets STATUS ($90)
    .endif; PLATFORM = diskio::platform::COMMODORE_16
            cmp #KERNAL_STATUS_EOF; $40
            bne kernaloerr
           ;sec
            rts; EOF
kernaloerr: sec
            tax
            cmp #diskio::status::DEVICE_NOT_PRESENT
            bcs :+
            lda #diskio::status::GENERIC_KERNAL_ERROR
            sec
:           rts

.endif; LOAD_VIA_KERNAL_FALLBACK

.if MEM_DECOMP_API

.export memdecomp

            ; --- decompress a compressed file from memory ---
            ; in:  x/y - lo/hi of compressed file in memory
            ;      c   - if MEMDECOMP_TO_API != 0, c = 0: decompress to address as stored in the file
            ;                                      c = 1: decompress to caller-specified address (decdestlo/hi)
            ; out: undefined

memdecomp:
    .if MEM_DECOMP_TO_API
            lda #OPC_STA_ZP
            bcc :+
            lda #OPC_LDA_ZP
:           sta storedadrl
            sta storedadrh
    .endif; MEM_DECOMP_TO_API

            stx loadaddrlo
            sty loadaddrhi

    .if DECOMPRESSOR = DECOMPRESSORS::ZX0
            txa
            bne :+
            dey
:           dex
    .endif

    .if ZP_READ_PTR
            stx .lobyte(decompsrc)
    .endif; ZP_READ_PTR
    .if HAVE_GETBYTE
            dex
            stx decompsrc
    .endif; HAVE_GETBYTE
    .if ZP_READ_PTR
            sty .lobyte(decompsrc + 1)
    .else; !ZP_READ_PTR
        .if HAVE_GETBYTE
            cpx #$ff
            bne :+
            dey
:
        .endif; HAVE_GETBYTE
            sty decompsrc + 1
    .endif; !ZP_READ_PTR
            ldy #0

    .if DECOMPRESSOR = DECOMPRESSORS::PUCRUNCH
            jsr decompress
            ; return the execution address in x/y
            ldx lo + 1
            ldy hi + 1
            rts
    .else
        .if DECOMPRESSOR = DECOMPRESSORS::ZX0
            .if USE_DALI
            .else
            ldx #$40
            stx BLOCKINDEX + 1; .lz_bits
            .endif
        .endif
            jmp decompress
    .endif

.endif; MEM_DECOMP_API

.if UNINSTALL_API

.export uninstall

            ; --- uninstall the loader ---
            ; in:  nothing
            ; out: undefined
uninstall:  DO_UNINSTALL
            rts

.endif; UNINSTALL_API


.if DECOMPRESSOR = DECOMPRESSORS::BITNAX
    .export DECOMPRESSOR_BITNAX = DECOMPRESSOR
    .include "decompress/bitnaxdecomp.s"

.elseif DECOMPRESSOR = DECOMPRESSORS::BYTEBOOZER2
    .export DECOMPRESSOR_BYTEBOOZER2 = DECOMPRESSOR
    .include "decompress/b2decomp.s"

.elseif DECOMPRESSOR = DECOMPRESSORS::DOYNAX_LZ
    .export DECOMPRESSOR_DOYNAX_LZ = DECOMPRESSOR
    .include "decompress/doynaxdecomp.s"

.elseif DECOMPRESSOR = DECOMPRESSORS::EXOMIZER
    .export DECOMPRESSOR_EXOMIZER = DECOMPRESSOR
    .include "decompress/exodecomp.s"

.elseif DECOMPRESSOR = DECOMPRESSORS::LEVELCRUSH
    .export DECOMPRESSOR_LEVELCRUSH = DECOMPRESSOR
    .include "decompress/lcdecomp.s"

.elseif DECOMPRESSOR = DECOMPRESSORS::LZSA2
    .export DECOMPRESSOR_LZSA2 = DECOMPRESSOR
    .include "decompress/lzsa2decomp.s"

.elseif DECOMPRESSOR = DECOMPRESSORS::NUCRUNCH
    .export DECOMPRESSOR_NUCRUNCH = DECOMPRESSOR
    .include "decompress/ncdecomp.s"

.elseif DECOMPRESSOR = DECOMPRESSORS::PUCRUNCH
    .export DECOMPRESSOR_PUCRUNCH = DECOMPRESSOR
    .include "decompress/pudecomp.s"

.elseif DECOMPRESSOR = DECOMPRESSORS::SUBSIZER
    .export DECOMPRESSOR_SUBSIZER = DECOMPRESSOR
    .include "decompress/subsizerdecomp.s"

.elseif DECOMPRESSOR = DECOMPRESSORS::TINYCRUNCH
    .export DECOMPRESSOR_TINYCRUNCH = DECOMPRESSOR
    .include "decompress/tcdecomp.s"

.elseif DECOMPRESSOR = DECOMPRESSORS::TSCRUNCH
    .export DECOMPRESSOR_TSCRUNCH = DECOMPRESSOR
    .include "decompress/tsdecomp.s"

.elseif DECOMPRESSOR = DECOMPRESSORS::ZX0
    .export DECOMPRESSOR_ZX0 = DECOMPRESSOR
    .include "decompress/zx0decomp.s"

.else
    .export DECOMPRESSOR_NONE = DECOMPRESSORS::NONE
.endif

            CHECK_RESIDENT_END_ADDRESS
