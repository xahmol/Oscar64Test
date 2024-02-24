
__NO_SAVE_SYMBOLS_IMPORT = 1
.include "loader.inc"

.include "drives/drivecode-common.inc"
.include "hal/hal.inc"

.include "cpu.inc"
.include "kernal.inc"

.segment "DISKIO_PLUGIN_ZP" : zeropage

PARAMSPTR: .res 2
SAVEPTR:   .res 2
LENGTH:    .res 2
BLOCKCNT:  .res 1
BYTECOUNT: .res 1

MAXBLOCKS = 64

.segment "DISKIO_PLUGIN"

.ifdef TRNSADDR
            .org TRNSADDR - 2
            .word * + 2; load address
.endif

.exportzp status_FILE_TOO_LARGE         = diskio::status::FILE_TOO_LARGE
.exportzp status_FILE_ON_DISK_TOO_SMALL = diskio::status::FILE_ON_DISK_TOO_SMALL
.exportzp status_FILE_ON_DISK_TOO_LARGE = diskio::status::FILE_ON_DISK_TOO_LARGE
.exportzp status_WRITE_PROTECT_ON       = diskio::status::WRITE_PROTECT_ON

WRITE_PROTECTED = $fe

SAVE_FROM_RAM_UNDER_IO = LOAD_UNDER_D000_DFFF & (PLATFORM <> diskio::platform::COMMODORE_16)

.if LOAD_VIA_KERNAL_FALLBACK
.import KERNLCLOSE
.endif; LOAD_VIA_KERNAL_FALLBACK

.import sendbyte
.import receivbyte

.export save

save:       stx PARAMSPTR
            sty PARAMSPTR + 1

            ldy #saveparams::buffer
            lda (PARAMSPTR),y
            sta swapparams
            iny
            lda (PARAMSPTR),y
            sta swapparams + 1

            ldy #saveparams::filename
            lda (PARAMSPTR),y
            sta SAVEPTR
            iny
            lda (PARAMSPTR),y
            sta SAVEPTR + 1
            dey
           ;ldy #0
:           lda (SAVEPTR),y
            beq :+
            sta savename41 - drvsaver41 + saver41,y
.if ONLY_1541_AND_COMPATIBLE = 0
            sta savename71 - drvsaver71 + saver71,y
            sta savename81 - drvsaver81 + saver81,y
.endif; ONLY_1541_AND_COMPATIBLE

            iny
            cpy #FILENAME_MAXLENGTH
            bcc :-
:           cpy #0
            bne :+
            lda #diskio::status::FILE_NOT_FOUND
            sec
            rts

:           ldy #saveparams::length
            clc
            lda #2
            adc (PARAMSPTR),y
            sta LENGTH
            tax
            iny
            lda #0
            adc (PARAMSPTR),y
            sta LENGTH + 1
            tay

            lda #0
            sta BLOCKCNT
            clc
:           inc BLOCKCNT
            bne :+
            dec BLOCKCNT
:           txa
            sbc #$fe
            tax
            tya
            sbc #0
            tay
            bcs :--

            lda BLOCKCNT
            cmp #MAXBLOCKS + 1
            bcc :+
            lda #diskio::status::FILE_TOO_LARGE
            rts

:           ldx #.lobyte(swapparams)
            ldy #.hibyte(swapparams)
            jsr swapdrvcod
            bcc saverinstd

.if LOAD_VIA_KERNAL_FALLBACK

            cmp #diskio::status::DEVICE_INCOMPATIBLE
            beq :+
            sec
            rts
:
            ldx SAVEPTR
            ldy SAVEPTR + 1
            BUFFER_MEMCONFIG
            ENABLE_KERNAL_SERIAL_ROUTINES
            jsr kernalsave
            RESTORE_MEMCONFIG_Y
.endif; !LOAD_VIA_KERNAL_FALLBACK
            rts

saverinstd: SET_FLAGS_N_DATA_V_CLK
            bmi saverinstd
            SYNC
:           SET_FLAGS_N_DATA_V_CLK
            bpl :-
            CLEAR
:           SET_FLAGS_N_DATA_V_CLK
            bvs :-

waitready:  SET_FLAGS_N_DATA_V_CLK
            bvc waitready

            ldy #saveparams::from
            lda (PARAMSPTR),y
            sta SAVEPTR
            iny
            lda (PARAMSPTR),y
            sta SAVEPTR + 1

            ; get status/number of file blocks
            jsr receivbyte
            beq devnotpres
            cmp #WRITE_PROTECTED
            beq writeprot
            cmp #diskio::status::FILE_NOT_FOUND; = $ff
            beq savereturn

            cmp BLOCKCNT
            beq :+

            php
            lda #0
            jsr sendbyte
            plp
            lda #diskio::status::FILE_ON_DISK_TOO_SMALL
            bcc savereturn
            lda #diskio::status::FILE_ON_DISK_TOO_LARGE
            bcs savereturn; jmp

:           jsr sendcount

            ldy #saveparams::loadaddress
            lda (PARAMSPTR),y
            jsr sendbyte
            dec BYTECOUNT
            iny
            lda (PARAMSPTR),y
            jsr sendbyte
            dec BYTECOUNT

.if SAVE_FROM_RAM_UNDER_IO
            BUFFER_MEMCONFIG
.endif
            jsr sendloop
            beq savedone

:           jsr sendblock
            bne :-
savedone:
.if SAVE_FROM_RAM_UNDER_IO
            RESTORE_MEMCONFIG_Y
.endif
            lda #diskio::status::OK
            SKIPWORD
writeprot:  lda #diskio::status::WRITE_PROTECT_ON
            SKIPWORD
devnotpres: lda #diskio::status::DEVICE_NOT_PRESENT
savereturn:
            pha
            jsr restoreldr
            pla
            cmp #diskio::status::OK + 1
            rts

sendblock:  SET_FLAGS_N_DATA_V_CLK
            bvc sendblock

            jsr sendcount

sendloop:   ldy #0
:
.if SAVE_FROM_RAM_UNDER_IO
            ENABLE_ALL_RAM_X
            lda (SAVEPTR),y
            ENABLE_IO_SPACE_X
.else
            lda (SAVEPTR),y
.endif
            jsr sendbyte
            iny
            dec BYTECOUNT
            bne :-

            clc
            tya
            adc SAVEPTR
            sta SAVEPTR
            bcc :+
            inc SAVEPTR + 1
:
            CLEAR

            dec BLOCKCNT
            rts

sendcount:  lda #$fe
            ldx LENGTH + 1
            bne :+
            ldx LENGTH
            cpx #$fe
            bcs :+
            txa
:           sta BYTECOUNT

            sec
            lda LENGTH
            sbc BYTECOUNT
            sta LENGTH
            bcs :+
            dec LENGTH + 1

:           lda BYTECOUNT
            jmp sendbyte

saver41:
            .org $05ba; loadfile41

            .assert * <= loadfile41, error, "***** 1541 save code above loadfile41 position. *****"
            .assert * >= loadfile41, error, "***** 1541 save code below loadfile41 position. *****"

drvsaver41: .scope cbm1541

.include "via.inc"

            .assert (filesectors + MAXBLOCKS + 1) <= wdogentr41, error, "***** 1541 track/sector buffer too small. *****"

filetracks    = idxloop41
filesectors   = idxloop41 + MAXBLOCKS + 1
writeblock    = $0510
rawblock      = $0700

CURRBLOCK     = $06
SENDVALUE     = $09
TRKSEC        = SENDVALUE
BLOCKSIZE     = $0e
NUMBLOCKS     = $74

DSKID         = $12
BUFPNT        = $30
HDRPNT        = $32
HBID          = $39
DRIVE         = $3d
DBID          = $47

SRCH          = $f510
SRCH20        = $f538
SRCH30        = $f54e
ERR           = $f553
WRT05         = $f575
WRT10         = $f586
CHKBLK        = $f5e9
WRITEBLOCKLEN = CHKBLK - $10 - SRCH; $c9

TIMER         = VIA2_T1C_H

            bmi filenotfnd

            lda #BUSY_LED | MOTOR
            jsr setbv2b41
           ;ldy FILETRACK
            lda FILESECTOR41
            bcs filefound; jmp

RESTORELOOP41 = $d9
RESTOREMAIN41 = RESTORELOOP41 + 1

            ; FILENAMEHASHVALSLO and NUMBLOCKS, will possibly be overwritten
saveentry:  lda #ATNA_OUT | DATA_OUT
            ldx #RESTOREMAIN41
            sta (.lobyte($03 - RESTOREMAIN41),x); VIA1_PRB

:           lda $00,x
            sta .lobyte($0100 - RESTOREMAIN41),x
            cpx #$0100 - 21
            bcc :+
            lda SECTORLINKTABLE41 + 21,x
            sta RESTORELOOP41 + 21,x
:           inx
            bne :--

            jsr initlink41

           ;ldy #0
:           lda #CLK_IN
            and (V1B41),y; VIA1_PRB
            beq :-
            lda #ATNA_OUT | CLK_OUT
            sta (V1B41),y; VIA1_PRB
:           lda (V1B41),y; VIA1_PRB
            lsr
            bcs :-
            ldx #$ff
:           inx
saveinit:   lda savename41,x
            sta FILENAME41,x
            bne :-
            sta NUMBLOCKS

            lda (V2B41),y; VIA2_PRB
            ldy #WRITE_PROTECTED
            and #WRITE_PROTECT
            beq writeprot

            jsr findfile41; SP = $08 -> $06

enumblocks: ldx NUMBLOCKS
            lda filesectors,x
            ldy filetracks,x
            jsr getblock41
            bcc enumblocks

            inc NUMBLOCKS
            lda LINKSECTOR41
            ldy LINKTRACK41
filefound:  ldx NUMBLOCKS
            cpx #MAXBLOCKS + 1
            bcs :+
            sta filesectors,x
            tya
            sta filetracks,x
            bne enumblocks
:
            ldy NUMBLOCKS

filenotfnd: ; y = diskio::status::FILE_NOT_FOUND = $ff
writeprot:  ; y = WRITE_PROTECTED = $fe

            .assert getbyterts41 < writeblock, error, "***** getbyte runs into writeblock *****"

            ldx #WRITEBLOCKLEN + 1
            lda #OPC_RTS
:           sta writeblock - 1,x
            lda SRCH - 2,x
            dex
            bne :-
            inc writeblock + WRT10 - 3 - SRCH; OPC_JMP_ABS -> OPC_EOR_ABS, no write protect check
            lda #OPC_TXA
            sta writeblock + SRCH30 - SRCH
            inc writeblock + ERR - SRCH; OPC_JMP_ABS -> OPC_EOR_ABS, no sync timeout check
            stx BUFPNT
            stx HDRPNT + 1
            stx DRIVE
            inx
:           lda ID041,x
            jsr sertoraw41
            sta DSKID,x
            dex
            bpl :-
            stx TIMER
            ldx #.hibyte(writeblock)
            stx writeblock + SRCH20 + 2 - SRCH
            stx writeblock + WRT10 + 5 - SRCH

            pla

            tya
            ENABLE_WATCHDOG
            DRIVESENDBYTE 1541, SENDVALUE

           ;ldy #0
            beq saveloopin; jmp

saveloop:   jsr rdygetbyte
            beq saverexit; branch if file on disk too small/large

            sta BLOCKSIZE

           ;ldx #0
:           jsr getbytewdog41
            sta rawblock + 2,x
            inx
            cpx BLOCKSIZE
            bcc :-

            lda #ATNA_OUT | CLK_OUT | DATA_OUT
            sta VIA1_PRB
            sei

            lda #0
:           sta rawblock + 2,x
            inx
            bne :-

            ldx CURRBLOCK
            ldy filesectors + 1,x
            lda filetracks + 1,x
            sta rawblock
            bne :+
            ldy BLOCKSIZE
            iny
:           sty rawblock + 1
            ldy filetracks,x
            sty TRKSEC
            lda filesectors,x
            sta TRKSEC + 1
            jsr trkseek41
            ldx #.lobyte(TRKSEC)
            stx HDRPNT
            dex
            stx HBID; 8
            dex
            stx DBID; 7
           ;ldx #.hibyte(rawblock)
            stx BUFPNT + 1
            jsr writeblock + WRT05 - SRCH
            ldy CURRBLOCK
            iny
saveloopin: sty CURRBLOCK
            cpy NUMBLOCKS
            bcc saveloop

saverexit:  lda #OPC_JSR_ABS
            sta restore
            lda CURRTRACK41
            pha

rdygetbyte: ldx #0
            lda #ATNA_OUT
            sta (V1B41,x); VIA1_PRB
:
restore:    jmp getbytewdog41
            sta $00,x
            inx
            bne :-
            sei

            pla
            sta CURRTRACK41

            jmp RESTOREMAIN41

            .endscope

savename41: .res FILENAME_MAXLENGTH
            .byte 0

            .assert * <= $0700, error, "***** 1541 save code too large. *****"

            .reloc
saver41end:

.if ONLY_1541_AND_COMPATIBLE = 0

saver71:
            .org $04e1; loadfile71

            .assert * <= loadfile71, error, "***** 1571 save code above loadfile71 position. *****"
            .assert * >= loadfile71, error, "***** 1571 save code below loadfile71 position. *****"

drvsaver71: .scope cbm1571

.include "via.inc"

            .assert (filesectors + MAXBLOCKS + 1) <= rawblock, error, "***** 1571 track/sector buffer too small. *****"

writeblock    = $0310
rawblock      = $0700

NUMBLOCKS     = $1b
CURRBLOCK     = $1c
BLOCKSIZE     = $1d
SENDVALUE     = $1e
TRKSEC        = SENDVALUE

BUFPNT        = $30
HDRPNT        = $32
HBID          = $39
DRIVE         = $3d
DBID          = $47

SRCH          = $f510
SRCH20        = $f538
SRCH30        = $f54e
ERR           = $f553
WRT05         = $f575
WRT10         = $f586
CHKBLK        = $f5e9
WRITEBLOCKLEN = CHKBLK - $10 - SRCH

TIMER         = VIA2_T1C_H

            bcc aftfindfil
           ;lda #diskio::status::FILE_NOT_FOUND; $ff
            jmp filenotfnd

.import CUSTOMZPBUFFSIZE71

            lda #ATNA_OUT | DATA_OUT
            sta VIA1_PRB

            ldx #0
:           lda CUSTOMZPBUFFER71,x
            sta $00,x
            inx
            cpx #.lobyte(CUSTOMZPBUFFSIZE71)
            bne :-

            ldx #0
            stx NUMBLOCKS

:           lda #CLK_IN
            and VIA1_PRB
            beq :-
            lda #ATNA_OUT | CLK_OUT
            sta VIA1_PRB
:           lda VIA1_PRB
            lsr
            bcs :-

            lda #WRITE_PROTECT
            and VIA2_PRB
            beq writeprot

           ;ldx #0
dosave:     lda savename71,x
            beq :+
            sta FILENAME71,x
            inx
            bne dosave
:
            sec
            jmp findfile71

aftfindfil: lda #BUSY_LED | MOTOR
            jsr bsetv2b71
            lda DIRSECTORS71,x
            bcc :+; jmp

enumblocks: ldx NUMBLOCKS
            lda filesectors,x
            ldy filetracks,x
            jsr getblock71
            bcs enumblocks

            lda LINKSECTOR71
            ldy LINKTRACK71
            inc NUMBLOCKS
:           ldx NUMBLOCKS
            cpx #MAXBLOCKS + 1
            bcs :+
            sta filesectors,x
            tya
            sta filetracks,x
            bne enumblocks
:
            ldx #WRITEBLOCKLEN
:           lda SRCH - 1,x
            sta writeblock - 1,x
            dex
            bne :-
            inc writeblock + WRT10 - 3 - SRCH; OPC_JMP_ABS -> OPC_EOR_ABS, no write protect check
            lda #.hibyte(writeblock)
            sta writeblock + SRCH20 + 2 - SRCH
            sta writeblock + WRT10 + 5 - SRCH
            lda #OPC_TXA
            sta writeblock + SRCH30 - SRCH
            inc writeblock + ERR - SRCH; OPC_JMP_ABS -> OPC_EOR_ABS, no sync timeout check
            lda #OPC_RTS
            sta writeblock + WRITEBLOCKLEN
            stx BUFPNT
            stx HDRPNT + 1
            stx DRIVE
            lda #.lobyte(TRKSEC)
            sta HDRPNT
            ldx #$08
            stx HBID
            dex
            stx DBID
           ;ldy #.hibyte(rawblock)
            stx BUFPNT + 1

            lda NUMBLOCKS
            SKIPWORD
writeprot:  lda #WRITE_PROTECTED
filenotfnd:
            ldx #.lobyte(trkseek71) - 1
            txs

            ldy #$ff
            sty TIMER
            ENABLE_WATCHDOG
            DRIVESENDBYTE 1571, SENDVALUE

            lda NUMBLOCKS
            beq saverexit

           ;ldy #0
saveloop:   sty CURRBLOCK

            jsr rdygetbyte
            beq saverexit; branch if file on disk too small/large
            sta BLOCKSIZE

           ;ldx #0
:           jsr getbyte
            sta rawblock + 2,x
            inx
            cpx BLOCKSIZE
            bcc :-

            lda #ATNA_OUT | CLK_OUT | DATA_OUT
            sta VIA1_PRB
            sei

            lda #0
            beq :++; jmp
:           sta rawblock + 2,x
            inx
:           cpx #$fe
            bcc :--

            ldx CURRBLOCK
            ldy filesectors + 1,x
            lda filetracks + 1,x
            sta rawblock
            bne :+
            ldy BLOCKSIZE
            iny
:           sty rawblock + 1
            ldy filetracks,x
            sty TRKSEC
            lda filesectors,x
            sta TRKSEC + 1
            sta CLEARSECTORLINKTABLE71
            jsr trkseek71
            jsr onemhz71
            jsr writeblock + WRT05 - SRCH

            ldy CURRBLOCK
            iny
            cpy NUMBLOCKS
            bcc saveloop

saverexit:  lda #ATNA_OUT | CLK_OUT | DATA_OUT
            sta VIA1_PRB

            sei
            ldx CURRTRACK71
            txs

.macro HOOK71
            tsx
            stx CURRTRACK71
            ldx #0
.endmacro
            RETURNTOLOADER71 HOOK71

rdygetbyte: ldx #0
            lda #ATNA_OUT
            sta VIA1_PRB

getbyte:    lda #$ff
            sta TIMER
            ENABLE_WATCHDOG
            DRIVEGETBYTE 1571, getbytecmp
            rts

filetracks  = idleloop71
filesectors = *

            .endscope

savename71: .res FILENAME_MAXLENGTH
            .byte 0

            .reloc
saver71end:

saver81:
            .org $0594; loadfile81

            .assert * <= loadfile81, error, "***** 1581 save code above loadfile81 position. *****"
            .assert * >= loadfile81, error, "***** 1581 save code below loadfile81 position. *****"

drvsaver81: .scope cbm1581

.include "cia.inc"

filetracks        = $0900
filesectors       = $0a00
rawblock          = $0b00

NUMBLOCKS         = $18
CURRBLOCK         = $19
BLOCKSIZE         = $1a
SENDVALUE         = $1b

STROBE_CONTROLLER = $ff54

OK_DV             = $00
WRTSD_DV          = $90
TRKWRT_DV         = $a2

FD2K4K_F          = $fea4

BUFFER0           = $0300
BUFFERSIZE        = $0100

BUFFERINDEX       = (rawblock - BUFFER0) / BUFFERSIZE

JOBCODESTABLE     = $02
JOBTRKSCTTABLE    = $0b

TRACKOFFSET       = 0
SECTOROFFSET      = 1

BUFFERTRACK       = JOBTRKSCTTABLE + (2 * BUFFERINDEX) + TRACKOFFSET
BUFFERSECTOR      = JOBTRKSCTTABLE + (2 * BUFFERINDEX) + SECTOROFFSET

            bcc aftfindfil
            bcs filenotfnd; jmp

            lda #DATA_OUT
            sta CIA_PRB

            jsr swapzp81; restore loader zeropage

            lda FD2K4K_F
            cmp #'f'
            bne notonfd
            ldx #fdwatchdge - fdwatchdog - 1
:           lda fdwatchdog,x
            sta getbyte,x
            dex
            bpl :-
notonfd:
            ldx #0
            stx NUMBLOCKS

:           lda #CLK_IN
            and CIA_PRB
            beq :-
            lda #CLK_OUT
            sta CIA_PRB
:           lda CIA_PRB
            lsr
            bcs :-

            lda #WRITE_PROTECT
            and CIA_PRB
            beq writeprot

dosave:     lda savename81,x
            beq :+
            sta filename81,x
            inx
            bne dosave
:
            sec
            jmp findfile81

aftfindfil: tya
            pha
            jsr bsyledon81
            pla
            tay
            lda DIRTRACKS81,x
            bne :+; jmp

enumblocks: ldx NUMBLOCKS
            lda filetracks,x
            ldy filesectors,x
            jsr getblock81
            bcs enumblocks

           ;lda LINKTRACK
           ;ldy LINKSECTOR
            inc NUMBLOCKS
:           ldx NUMBLOCKS

            cpx #MAXBLOCKS + 1
            bcs :+
            pha
            tya
            sta filesectors,x
            pla
            sta filetracks,x
            bne enumblocks
:
            txa
            SKIPWORD
writeprot:  lda #WRITE_PROTECTED
            SKIPWORD
filenotfnd: lda #diskio::status::FILE_NOT_FOUND; $ff
            pha

            jsr initwdog81
            jsr enablwdg81

            pla

            DRIVESENDBYTE 1581, SENDVALUE

            lda NUMBLOCKS
            beq saverexit

           ;ldy #0
saveloop:   sty CURRBLOCK

            jsr enablwdg81

            jsr rdygetbyte
            beq saverexit; branch if file on disk too small/large
            sta BLOCKSIZE

           ;ldx #0
:           jsr getbyte
            sta rawblock + 2,x
            inx
            cpx BLOCKSIZE
            bcc :-

            lda #CLK_OUT | DATA_OUT
            sta CIA_PRB
            sei

            lda #0
            beq :++; jmp
:           sta rawblock + 2,x
            inx
:           cpx #$fe
            bcc :--

retry:      ldx CURRBLOCK
            ldy filesectors + 1,x
            lda filetracks + 1,x
            sta rawblock
            bne :+
            ldy BLOCKSIZE
            iny
:           sty rawblock + 1

            lda filetracks,x
            sta BUFFERTRACK
            lda filesectors,x
            sta BUFFERSECTOR
            jsr initcntr81
            lda #WRTSD_DV
            ldx #BUFFERINDEX
            jsr STROBE_CONTROLLER

            lda JOBCODESTABLE + BUFFERINDEX; FD does not return the error status in the accu
            cmp #OK_DV + 1
            bcs retry

            ldy CURRBLOCK
            iny
            cpy NUMBLOCKS
            bcc saveloop

:           lda #TRKWRT_DV
            ldx #BUFFERINDEX
            jsr STROBE_CONTROLLER

            lda JOBCODESTABLE + BUFFERINDEX; FD does not return the error status in the accu
            cmp #OK_DV + 1
            bcs :-

saverexit:  lda #CLK_OUT | DATA_OUT
            sta CIA_PRB
            sei

zpbuffer = returnrun + returnend - return

            ldx #returnend - return - 1
:           lda return,x
            sta returnrun,x
            lda $00,x
            sta zpbuffer,x; buffer zeropage, as it will be overwritten with pre-loader system zeropage
            dex
            bpl :-

            jmp returnrun
return:
            .org rawblock

.macro HOOK81
            ldx #returnend - return - 1
:           lda zpbuffer,x
            sta $00,x; restore zeropage
            dex
            bpl :-

            jsr swapzp81
.endmacro

returnrun:  RETURNTOLOADER81 HOOK81

            .org * - returnrun + return
returnend:

rdygetbyte: ldx #0
            stx CIA_PRB

getbyte:    lda #COUNT_PHI2 | FORCE_LOAD | ONE_SHOT | TIMER_START
            sta CIA_CRB; reset watchdog time-out

            DRIVEGETBYTE 1581
            rts

fdwatchdog: lda #$ff
            sta $4005; VIA_T1C_H
fdwatchdge:
            .endscope

savename81: .res FILENAME_MAXLENGTH
            .byte 0

            .assert * <= DRVCODEND81, error, "***** 1581 save code too large. *****"

            .reloc
saver81end:

.endif; ONLY_1541_AND_COMPATIBLE

.if LOAD_VIA_KERNAL_FALLBACK

kernalsave: stx namestrpos
            sty namestrpos + 1
            ldx #0
namestrpos = * + 1
:           lda $ffff,x
            beq :+
            sta savename + 2,x
            inx
            cpx #FILENAME_MAXLENGTH
            bcc :-
:           stx FNLEN

            lda #KERNALFILENO
            ldx FA
            ldy #$00
            jsr SETLFS
            lda FNLEN
            ldx #.lobyte(savename + 2)
            ldy #.hibyte(savename + 2)
            jsr SETNAM
            jsr OPEN
            bcs jmpsaveerr

            ldx LA
            jsr CHKIN

            ldx #0
            ldy #0
kernalenum: lda STATUS
            bne kernlenumd

    .if KERNAL_FALLBACK_SEI_WORKAROUNDS
            BRANCH_IF_DRIVE_PARALLEL :++
:           BRANCH_IF_BLOCK_NOT_READY :-
:
    .endif; KERNAL_FALLBACK_SEI_WORKAROUNDS
            jsr BASIN
            lda STATUS
            bne kernlenumd
            inx
            bne kernalenum
            iny
            bne kernalenum
kernlenumd: cmp #KERNAL_STATUS_EOF
            bne jmpsaveerr

            lda #diskio::status::FILE_NOT_FOUND
            cpx #0
            bne :+
            cpy #0
            bne :+
jmpsaveerr: jmp saveerror
:           lda #0
            sta BYTECOUNT
            clc
:           inc BYTECOUNT
            bne :+
            dec BYTECOUNT
:           txa
            sbc #$fe
            tax
            tya
            sbc #0
            tay
            bcs :--

            lda BYTECOUNT
            cmp BLOCKCNT
            beq :+

            lda #diskio::status::FILE_ON_DISK_TOO_SMALL
            bcc jmpsaveerr
            lda #diskio::status::FILE_ON_DISK_TOO_LARGE
            bcs jmpsaveerr; jmp
:
            jsr KERNLCLOSE

            lda #KERNALFILENO
            ldx FA
            ldy #$01
            jsr SETLFS
            clc
            lda #2
            adc FNLEN
            ldx #.lobyte(savename)
            ldy #.hibyte(savename)
            jsr SETNAM
            jsr OPEN
            bcs saveerror

            ldx LA
            jsr CKOUT
            lda #diskio::status::GENERIC_KERNAL_ERROR
            ldx STATUS
            bne saveerror

            ldy #saveparams::loadaddress
            lda (PARAMSPTR),y
            jsr BSOUT
            iny
            lda (PARAMSPTR),y
            jsr BSOUT

            lda #diskio::status::WRITE_PROTECT_ON
            ldx STATUS
            bne saveerror

            sec
            lda LENGTH
            sbc #2
            sta LENGTH
            bcs :+
            dec LENGTH + 1
:
            ldy #saveparams::from
            lda (PARAMSPTR),y
            sta SAVEPTR
            iny
            lda (PARAMSPTR),y
            sta SAVEPTR + 1

krnlsavelp: lda #diskio::status::GENERIC_KERNAL_ERROR
            ldx STATUS
            bne saveerror

            ldy #0
.if SAVE_FROM_RAM_UNDER_IO
            ENABLE_ALL_RAM_X
            lda (SAVEPTR),y
            ENABLE_KERNAL_SERIAL_ROUTINES_Y
.else
            lda (SAVEPTR),y
.endif
            jsr BSOUT
            inc SAVEPTR
            bne :+
            inc SAVEPTR + 1
:           sec
            lda LENGTH
            sbc #1
            sta LENGTH
            lda LENGTH + 1
            sbc #0
            bcc :+
            sta LENGTH + 1
            ora LENGTH
            bne krnlsavelp
:
            lda #diskio::status::OK

saveerror:  pha
            txa
            pha
            jsr KERNLCLOSE
            pla
            tax
            pla
            cmp #diskio::status::OK + 1
            rts

savename:   .byte "@:"
            .res FILENAME_MAXLENGTH

.endif; LOAD_VIA_KERNAL_FALLBACK

swapparams: .word 0; buffer

            .word cbm1541::saveentry; entry
            .word drvsaver41; to
            .word saver41end - saver41; length
            .word saver41; from

.if ONLY_1541_AND_COMPATIBLE = 0

            .word drvsaver71 + 5; entry
            .word drvsaver71; to
            .word saver71end - saver71; length
            .word saver71; from

            .word drvsaver81 + 4; entry
            .word drvsaver81; to
            .word saver81end - saver81; length
            .word saver81; from

.endif; ONLY_1541_AND_COMPATIBLE
