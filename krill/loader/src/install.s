
.fileopt comment, "Loader install code portion"
.fileopt compiler, "CA65"
.fileopt author, "Gunnar Ruthenberg"

__NO_LOADER_SYMBOLS_IMPORT = 1
.include "loader.inc"
.include "../version.inc"

.include "cpu.inc"
.include "cia.inc"
.include "vdc.inc"

.include "basic.inc"; for PETSCII_RETURN
.include "kernal.inc"

CBM1581_8 = $a6e9; the '8' in the 1581's ID string
FD_F_HD_H = $fea4; the 'f' in the CMD FD 2000/4000's ID string or the 'h' in the CMD HD's ID string


.include "hal/hal.inc"

.include "drives/drivecode-common.inc"

.importzp loadaddrlo


.if ONLY_1541_AND_COMPATIBLE = 0
.import cmdfdfix0
.import cmdfdfix1
.import cmdfdfix2
    .if !DISABLE_WATCHDOG
.import cmdfdfix3
.import cmdfdfix4
        .if ::PLATFORM = diskio::platform::COMMODORE_128
.import cmdfdfix5
.import cmdfdfix6
        .endif ; ::PLATFORM = diskio::platform::COMMODORE_128
    .endif; !DISABLE_WATCHDOG
.endif; ONLY_1541_AND_COMPATIBLE = 0


USE_GENERIC_DRIVE = 0


.macro itoa4 value
            .if (value & $0f > 9)
                .byte (value & $0f) + 'a' - 10
            .else
                .byte (value & $0f) + '0'
            .endif
.endmacro

.macro itoa1 value
            itoa4 value <> 0
.endmacro

.macro itoa8 value
            itoa4 value >> 4
            itoa4 value & $0f
.endmacro

.macro itoa16 value
            itoa8 value >> 8
            itoa8 value & $ff
.endmacro


.segment "DISKIO_INSTALL"

.ifdef INSTADDR
            .org INSTADDR - 2
            .word * + 2; load address
.endif

.export install

            ; Install the loader

            ; in:  nothing
            ; out: c - set on error
            ;      a - status
            ;      x - drive type (one of diskio::drivetype)
            ;      y - if status is diskio::status::OK, zp address of version string address
install:    jmp doinstall

            ; unfortunately, scopes must be defined before using them,
            ; this is why the actual install code is moved to after the drive code
.scope cbm1541
drivecode41:
            .include "drives/drivecode1541.s"

            .exportzp ID041
            .exportzp CURRTRACK41
            .exportzp NUMFILES41
            .exportzp SECTORLINKTABLE41

            .export topofstack41
            .export idleloop41
            .export getbytecmp41
            .export BLOCKBUFFER41

            ; symbols used by the saver
            .exportzp V1B41
            .exportzp V2B41
            .exportzp LEDSTATE41
            .exportzp FILESECTOR41
            .exportzp FILENAME41
            .exportzp LINKTRACK41
            .exportzp LINKSECTOR41
            .exportzp REQUESTEDSECTOR41

            .export trkseek41
            .export initlink41
            .export sertoraw41
            .export getbytewdog41
            .export getbyte41
            .export getbyterts41
            .export setbv2b41
            .export getblock41
            .export idxloop41
            .export wdogentr41
            .export findfile41
            .export loadfile41
.endscope

.if ONLY_1541_AND_COMPATIBLE = 0

.scope cbm1571
drivecode71:
            .include "drives/drivecode1571.s"

            .exportzp SECTORLINKTABLE71
            .exportzp CUSTOMZPBUFFER71
            .exportzp CUSTOMUPLOADSIZE71

            .export topofstack71
            .export idleloop71
            .export BLOCKBUFFER71

            ; symbols used by the saver
            .exportzp CURRTRACK71
            .exportzp LEDSTATE71
            .exportzp CLEARSECTORLINKTABLE71
            .exportzp FILENAME71
            .exportzp LINKTRACK71
            .exportzp LINKSECTOR71
            .exportzp DIRSECTORS71

            .export bsetv2b71
            .export trkseek71
            .export initlink71
            .export onemhz71
            .export getblock71
            .export findfile71
            .export loadfile71
            .export idxloop71
.endscope

.scope cbm1581
drivecode81:
            .include "drives/drivecode1581.s"

            .exportzp CUSTOMPARAM81

            .export dcodinit81
            .export BLOCKBUFFER81
            .export CUSTOMRECEIVE81
            .export loadfile81

            ; symbols used by the saver
            .export filename81
            .export swapzp81
            .export getblock81
            .export initwdog81
            .export enablwdg81
            .export initcntr81
            .export bsyledon81
            .export findfile81
            .export DIRTRACKS81
.endscope

.endif; ONLY_1541_AND_COMPATIBLE = 0

doinstall:  lda #.lobyte(version)
            sta loadaddrlo
            lda #.hibyte(version)
            sta loadaddrlo + 1

            BRANCH_IF_NOT_INSTALLED :+
            jmp isinstalld

:           php; I flag buffer

            jsr CLALL

.if PLATFORM = diskio::platform::COMMODORE_128

            ; set data and filename banks to current program bank
            lda MMU_CR
            asl
            rol
            rol
            and #$03; BA
            tax     ; FNBANK
            jsr SETBANK

.endif; PLATFORM = diskio::platform::COMMODORE_128

            ; try the drive as denoted by FA (current drive) first
            lda FA
            cmp #MIN_DEVICE_NO
            bcc :+
            cmp #MAX_DEVICE_NO + 1
            bcc :++
:           lda #MIN_DEVICE_NO; FA does not contain a drive address (MIN_DEVICE_NO..MAX_DEVICE_NO), try MIN_DEVICE_NO first
:
            ; find first available drive,
            ; this is done via the high-level open/read/close routines,
            ; so non-serial bus devices will also respond
            sta FA

find1stdrv: pha; buffer active drive device number

            lda #0
            tax
            tay
            jsr SETNAM
            lda #COMMAND_ERROR_CHANNEL
            ldx FA
            tay
            jsr SETLFS
            jsr OPEN
            bcc openokay

            cmp #OPEN_DEVICENOTPRESENT
            beq trynextdev
            tax
            pla; buffered active drive device number
            lda #diskio::status::GENERIC_KERNAL_ERROR
            bne installerr; jmp

trynextdev: ; device not present, try next address
            lda #COMMAND_ERROR_CHANNEL
            jsr CLOSE
            jsr CLRCH
            ldx FA
            inx
            cpx #MAX_DEVICE_NO + 1
            bne :+
            ldx #MIN_DEVICE_NO
:           stx FA
            pla; buffered active drive device number
            cmp FA
            bne find1stdrv

            lda #diskio::status::DEVICE_NOT_PRESENT
            ldx #diskio::drivetype::DEVICE_NONE
installerr: ldy #loadaddrlo
            plp; I flag restore
            sec
            rts

openokay:   ldx #COMMAND_ERROR_CHANNEL
            jsr CKOUT
            jsr READSS
            bne trynextdev
            jsr CLRCH
            ; read error channel, this also stops potentially blinking error LED
            ldx #COMMAND_ERROR_CHANNEL
            jsr CHKIN
:           jsr READSS
            bne :+
            jsr BASIN
            jmp :-
:           lda #COMMAND_ERROR_CHANNEL
            jsr CLOSE
            jsr CLRCH

            pla; buffered active drive device number, leave FA at first detected present device

.if USE_GENERIC_DRIVE
            jmp usegeneric
.endif

.if ONLY_1541_AND_COMPATIBLE = 0
            ; check if drive allows code upload and execution
            jsr chkdrvcode
            beq notgeneric

usegeneric: ; no compatible drive found
            lda #diskio::status::DEVICE_INCOMPATIBLE
            jmp nodrvcode

notgeneric: ; check which model the drive is and upload corresponding drive code
            jsr getmodel

            sty drivetype
            tya
            bmi usegeneric
            lsr
            lsr
            lsr
            lsr
            tax
            tya
            and #diskio::drivetype::DRIVES_MASK
            cmp #diskio::drivetype::DRIVES_1581_CMD
            bne not1581cmd

            cpy #diskio::drivetype::DRIVE_CMD_HD
            beq usegeneric
            cpy #diskio::drivetype::DRIVE_1581
            beq is1581

            lda #OPC_BIT_ABS
            sta cmdfdfix0 - cbm1581::drvcodebeg81 + cbm1581::drivecode81
            lda #.lobyte($54); DIRTRACKFD
            sta cmdfdfix1 - cbm1581::drvcodebeg81 + cbm1581::drivecode81
            lda #.hibyte($54); DIRTRACKFD
            sta cmdfdfix2 - cbm1581::drvcodebeg81 + cbm1581::drivecode81
    .if (::PLATFORM <> diskio::platform::COMMODORE_128) & (!DISABLE_WATCHDOG)
            lda #$ff
            ldy #.lobyte($1c05)
    .endif
            jmp iscmdfd

is1581:     lda #OPC_JMP_ABS
            sta cmdfdfix0 - cbm1581::drvcodebeg81 + cbm1581::drivecode81
            lda #.lobyte($022b); DIRTRACK81
            sta cmdfdfix1 - cbm1581::drvcodebeg81 + cbm1581::drivecode81
            lda #.hibyte($022b); DIRTRACK81
            sta cmdfdfix2 - cbm1581::drvcodebeg81 + cbm1581::drivecode81
    .if (::PLATFORM <> diskio::platform::COMMODORE_128) & (!DISABLE_WATCHDOG)
            lda #COUNT_TA_UNDF | FORCE_LOAD | ONE_SHOT | TIMER_START
            ldy #.lobyte(CIA_CRB)
iscmdfd:    sta cmdfdfix3 - cbm1581::drvcodebeg81 + cbm1581::drivecode81
            sty cmdfdfix4 - cbm1581::drvcodebeg81 + cbm1581::drivecode81
    .else
iscmdfd:
    .endif
not1581cmd:
            lda dcodeselt0,x
            sta dcodesel0
            lda dcodeselt1,x
            sta dcodesel1
            lda dcodeselt2,x
            sta dcodesel2
            lda dcodeselt3,x
            sta dcodesel3
            lda dcodeselt4,x
            sta dcodesel4
            lda dcodeselt5,x
            sta dcodesel5
            lda dcodeselt6,x
            sta dcodesel6
            lda dcodeselt7,x
            sta dcodesel7
            lda dcodeselt8,x
            sta dcodesel8
            lda dcodeselt9,x
            sta family
            lda dcodeselta,x
            sta dirtrack

.else; ONLY_1541_AND_COMPATIBLE

            jsr chkdrvcode
            beq :+
            ; no compatible drive found
            lda #diskio::status::DEVICE_INCOMPATIBLE
            jmp nodrvcode

            ; check if 1541U
:           jsr drvlistn
            ldx #0
:           lda drvch1541u,x
            jsr CIOUT
            inx
            cpx #drvchkued - drvch1541u
            bne :-
            jsr UNLSN
            lda #.lobyte($0300)
            ldx #.hibyte($0300)
            jsr memreadbyt
            bmi :+; branch if 1541U
            lda #diskio::drivetype::DRIVE_1541
            SKIPWORD
:           lda #diskio::drivetype::DRIVE_1541U
            sta drivetype

            lda #.lobyte(cbm1541::drvcodeend41 - cbm1541::drvcodebeg41 + cbm1541::drivecode41)
            sta dcodesel0
            lda #.hibyte(cbm1541::drvcodeend41 - cbm1541::drvcodebeg41 + cbm1541::drivecode41)
            sta dcodesel1
            lda #.lobyte(cbm1541::drvprgend41 - cbm1541::drvcodeend41 + cbm1541::TRAMPOLINEOFFSET)
            sta dcodesel2
            lda #.lobyte(cbm1541::drivecode41)
            sta dcodesel3
            lda #.hibyte(cbm1541::drivecode41)
            sta dcodesel4
            lda #.hibyte(cbm1541::drvcodeend41 - cbm1541::TRAMPOLINEOFFSET)
            sta dcodesel5
            lda #.lobyte(cbm1541::drvcodeend41 - cbm1541::TRAMPOLINEOFFSET)
            sta dcodesel6
            lda #.hibyte(cbm1541::dinstall)
            sta dcodesel7
            lda #.lobyte(cbm1541::dinstall)
            sta dcodesel8

.endif; ONLY_1541_AND_COMPATIBLE

            ; check if there is more than 1 drive on the serial bus,
            ; upload silencing routines to the passive drives in order
            ; to make sure the 2bit+ATN protocol can work alright,
            ; detection is done via the low-level serial bus routines,
            ; so non-serial bus devices won't respond
            ; (1551 on Plus/4 does respond, though, so a little extra
            ; treatment is done through the drive disturbance HAL macros)

            lda FA; active drive
            pha
            ldx #MIN_DEVICE_NO
checkbus:   stx FA
            pla
            pha
            cmp FA
            beq jmpnodrive

            lda #0
            sta STATUS
            PREPARE_DRIVE_DISTURBANCE_VALIDATION
            jsr drvlistn
            BRANCH_IF_DRIVE_DOES_NOT_DISTURB_SERIAL_BUS jmpnodrive
            jsr READSS
            bpl :+
jmpnodrive: jmp nodrive

            ; more than 1 drive on the bus or generic serial devices present
:           jsr UNLSN

            ; upload and execute silencing routine
.if ONLY_1541_AND_COMPATIBLE = 0
            jsr chkdrvcode
            beq mute

mutefail:   lda FA
            ldx #'0' - 1
            sec
:           inx
            tay
            sbc #10
            bcs :-
            stx mutedevice
            tya
            adc #'0'
            sta mutedevice + 1
            ldx #errormute - messages
            jsr message
            pla
            sta FA
            lda #diskio::status::TOO_MANY_DEVICES
            jmp nodrvcode

mute:       jsr getmodel
            tya
            bmi mutefail

            tya
            and #diskio::drivetype::DRIVES_MASK
            cmp #diskio::drivetype::DRIVES_1581_CMD
            beq mute81cmd

            pha
.endif; ONLY_1541_AND_COMPATIBLE = 0
            jsr drvlistn
            ldx #0
:           lda drvsilencc,x
            jsr CIOUT
            inx
            cpx #atnfallbck - drvsilencc
            bne :-
            jsr drvrelistn
            ldx #0
:           lda atnfallbck,x
            jsr CIOUT
            inx
            cpx #atnlo - atnfallbck
            bne :-
            jsr drvrelistn
            ldx #0
:           lda atnlo,x
            jsr CIOUT
            inx
            cpx #atnhi - atnlo
            bne :-
            jsr drvrelistn
            ldx #0
:           lda atnhi,x
            jsr CIOUT
            inx
            cpx #atnhiend - atnhi
            bne :-
.if ONLY_1541_AND_COMPATIBLE = 0
            jsr UNLSN
            pla
            cmp #diskio::drivetype::DRIVES_157X
            bne :++
            jsr drvlistn
            ldx #0
:           lda drvslnc71,x
            jsr CIOUT
            inx
            cpx #drvslnc71e - drvslnc71
            bne :-
            beq mutexecute; jmp
:           jsr drvlistn
.else; ONLY_1541_AND_COMPATIBLE = 0
            jsr drvrelistn
.endif; ONLY_1541_AND_COMPATIBLE = 0
            ldx #0
:           lda drvsilence,x
            jsr CIOUT
            inx
            cpx #drvsilnced - drvsilence
            bne :-

.if ONLY_1541_AND_COMPATIBLE = 0
            beq mutexecute; jmp

mute81cmd:  cpy #diskio::drivetype::DRIVE_1581
            bne mutecmd

            jsr drvlistn
            ldx #0
:           lda drvslnc81,x
            jsr CIOUT
            inx
            cpx #drvslnc81e - drvslnc81
            bne :-
            beq mutexecute; jmp

mutecmd:    cpy #diskio::drivetype::DRIVE_CMD_HD
            beq mutecmdhd

            jsr drvlistn
            ldx #0
:           lda drvslncfd,x
            jsr CIOUT
            inx
            cpx #drvslncfde - drvslncfd
            bne :-
            beq mutexecute; jmp

mutecmdhd:  jsr drvlistn
            ldx #0
:           lda drvslnchd,x
            jsr CIOUT
            inx
            cpx #drvslnchde - drvslnchd
            bne :-
.endif; ONLY_1541_AND_COMPATIBLE = 0

mutexecute: jsr drvrelistn
            ldx #0
:           lda drvmuteme,x
            jsr CIOUT
            inx
            cpx #drvmutemed - drvmuteme
            bne :-
            beq nodrive; jmp

nodrvcode:  pha; error code

.if LOAD_VIA_KERNAL_FALLBACK
            ; quicker head stepping
            jsr drvlistn
            ldx #6
:           lda drvfaststp,x
            jsr CIOUT
            dex
            bpl :-
            jsr UNLSN

            lda #.lobyte($e5c6)
            ldx #.hibyte($e5c6)
            jsr memreadbyt
            cpx #'1' | $80; 71
            bne :++
            jsr drvlistn
            ldx #4
:           lda twosided,x
            jsr CIOUT
            dex
            bpl :-
            jsr drvrelistn; make sure the drive is done
            jsr UNLSN     ; when leaving the init routine
:
.endif; LOAD_VIA_KERNAL_FALLBACK

            CHECK_AND_BRANCH_IF_DRIVE_PARALLEL drivepar

.if PLATFORM = diskio::platform::COMMODORE_128
            lda burstflag
            beq :+
            ldx #diskio::drivetype::DRIVE_GENERIC_BURST
            SKIPWORD
:
.endif
            ldx #diskio::drivetype::DRIVE_GENERIC_SERIAL
            SKIPWORD
drivepar:   ldx #diskio::drivetype::DRIVE_GENERIC_PARALLEL
            pla; error code
            plp; I flag restore
            ldy #loadaddrlo
.if LOAD_VIA_KERNAL_FALLBACK
            clc; this is not to be regarded as an error
.else
            sec
.endif
            rts

nodrive:    jsr UNLSN
            ldx FA
            inx
            cpx #MAX_DEVICE_NO + 1
            beq :+
            jmp checkbus
:           pla
            sta FA; active drive

            ; install drive-side loader code
.if PLATFORM = diskio::platform::COMMODORE_128
            lda #0
            sta SERIAL
.endif
            jsr drvlistn
            ldx #0
upload:     sec
            stx :+ + 1
dcodesel2 = * + 1
            lda #0
:           sbc #0
            cmp #35
            bcc :+
            lda #35
:           sta drvrutmw

            ldy #6
:           lda drvrutmw - 1,y
            jsr CIOUT
            dey
            bne :-

dcodesel0 = * + 1
dcodesel1 = * + 2
:           lda $c001,x
            jsr CIOUT
            inx
            cpx dcodesel2
            beq :+
            iny
            cpy #35
            bne :-
            jsr drvrelistn
            clc
            lda #35
            adc drvrutmw + 2
            sta drvrutmw + 2
            bcc upload
            inc drvrutmw + 1
            bne upload

:           jsr drvrelistn
            ldx #0
:           lda droutrun,x
            jsr CIOUT
            inx
            cpx #droutruned - droutrun
            bne :-
            jsr UNLSN

            INIT_CLEAR_ATN_OUT_CLEAR_CLK_OUT_CLEAR_DATA_OUT

:           SET_FLAGS_N_DATA_V_CLK
            bvs :-

            CLEAR

:           SET_FLAGS_N_DATA_V_CLK
            bvc :-

dcodesel3 = * + 1
            ldy #0
dcodesel4 = * + 2
fastinst:   lda $00,y
            SENDBYTE
            iny
            bne :+
            inc fastinst + 2
:           cpy dcodesel0
            bne fastinst
            lda fastinst + 2
            cmp dcodesel1
            bne fastinst

            INSTALL_IDLE

.if PLATFORM = diskio::platform::COMMODORE_128
burstflag = * + 1
            lda #0
    .if ONLY_1541_AND_COMPATIBLE = 0
            bne burst
    .endif
            DISABLE_BURST_MODE
burst:
.endif; PLATFORM = diskio::platform::COMMODORE_128

            ; if 1541U is detected, it runs on buggy firmware
            lda drivetype
            cmp #diskio::drivetype::DRIVE_1541U
            bne :+
            ldx #warnemubug - messages
            jsr message

:           plp; I flag restore

isinstalld: lda #diskio::status::OK
drivetype = * + 1
            ldx #0
            ldy #loadaddrlo
            clc
            rts

message:    lda BORDERCOLOUR
            pha
            lda BGCOLOUR
            pha
            lda #COLOUR_RED
            sta BORDERCOLOUR
            sta BGCOLOUR
.if PLATFORM = diskio::platform::COMMODORE_16
            lda TED_CTRL1
            pha
            lda #TEXT_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_3; $1b
            sta TED_CTRL1
            lda TED_CTRL2
            pha
            and #.lobyte(~MULTICOLOUR_MODE)
            ora #COLUMNS_40
            sta TED_CTRL2
            lda TED_BITMAP_ADDR
            pha
            ora #CHARSET_BITMAP_IN_ROM
            sta TED_BITMAP_ADDR
            lda TED_CHARGEN_ADDR
            pha
            and #.lobyte(~CHARGEN_ADDR_MASK)
            ora #MAKE_CHARGEN_ADDR(CHARSET_ADDR_UPPERLOWER)
            sta TED_CHARGEN_ADDR
            lda TED_SCREEN_ADDR
            pha
            and #.lobyte(~SCREEN_ADDR_MASK)
            ora #MAKE_SCREEN_ADDR($0c00)
            sta TED_SCREEN_ADDR
            lda PALETTE
            pha
            lda #PALETTE_DEFAULT
            sta PALETTE
.else; PLATFORM <> diskio::platform::COMMODORE_16
    .if PLATFORM = diskio::platform::COMMODORE_128
            lda #FG_BG
            sta VDC_CR
:           bit VDC_SR; wait until update ready
            bpl :-
            lda VDC_DR
            pha
            lda #RED
            sta VDC_DR
    .endif ; PLATFORM = diskio::platform::COMMODORE_128
            lda VIC2_CTRL1
            and #.lobyte(~RASTERLINE_BIT8)
            pha
            lda VIC2_CTRL2
            pha
            lda VIC2_ADDR
            pha
            lda CIA2_PRA
            and #VIC2_BANK
            pha
            lda #TEXT_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_3; $1b
            sta VIC2_CTRL1
            lda #SINGLECOLOUR_MODE | COLUMNS_40 | SCROLLX_0; $08
            sta VIC2_CTRL2
            lda #VIC2_MAKE_ADDR($0400, CHARSET_ADDR_UPPERLOWER)
            sta VIC2_ADDR
            lda #(VIC2_MAKE_BANK $0400) & VIC2_BANK
            sta CIA2_PRA
.endif; PLATFORM <> diskio::platform::COMMODORE_16
            lda DFLTO
            pha
            lda COLOR
            pha
            lda #DEVICE_SCREEN
            sta DFLTO
:           lda messages,x
            beq :+
            jsr BSOUT
    .if PLATFORM = diskio::platform::COMMODORE_16
            lda #BLINK
            ora COLOR
            sta COLOR
    .endif; PLATFORM = diskio::platform::COMMODORE_16
            inx
            bne :-
:           pla
            sta COLOR
            pla
            sta DFLTO
            lda #8
:           dex
            bne :-
            dey
            bne :-
            sbc #1
            bne :-
.if PLATFORM = diskio::platform::COMMODORE_16
            pla
            sta PALETTE
            pla
            sta TED_SCREEN_ADDR
            pla
            sta TED_CHARGEN_ADDR
            pla
            sta TED_BITMAP_ADDR
            pla
            sta TED_CTRL2
            pla
            sta TED_CTRL1
.else; PLATFORM <> diskio::platform::COMMODORE_16
            pla
            sta CIA2_PRA
            pla
    .if PLATFORM = diskio::platform::COMMODORE_128
            sta VM1
    .endif ; PLATFORM = diskio::platform::COMMODORE_128
            sta VIC2_ADDR
            pla
            sta VIC2_CTRL2
            pla
            sta VIC2_CTRL1
    .if PLATFORM = diskio::platform::COMMODORE_128
            lda #FG_BG
            sta VDC_CR
:           bit VDC_SR; wait until update ready
            bpl :-
            pla
            sta VDC_DR
    .endif ; PLATFORM = diskio::platform::COMMODORE_128
.endif; PLATFORM <> diskio::platform::COMMODORE_16
            pla
            sta BGCOLOUR
            pla
            sta BORDERCOLOUR
            rts

drvrelistn: jsr UNLSN
drvlistn:   lda FA
            jsr LISTN
.if PLATFORM = diskio::platform::COMMODORE_128
            lda SERIAL
            sta burstflag
.endif
            lda #SA_OPENCHANNEL | COMMAND_ERROR_CHANNEL
            jmp SECND

memreadbyt: sta drvchkmr + 3
            stx drvchkmr + 4
            lda #drvchkmred - drvchkmr
            ldx #.lobyte(drvchkmr)
            ldy #.hibyte(drvchkmr)
            jsr SETNAM
            lda #COMMAND_ERROR_CHANNEL
            ldx FA
            tay
            jsr SETLFS
            jsr OPEN
            bcc :+
            lda #0
            tax
            rts

:           ldx #COMMAND_ERROR_CHANNEL
            jsr CHKIN
            jsr BASIN
            pha
            jsr BASIN
            pha
            lda #COMMAND_ERROR_CHANNEL
            jsr CLOSE
            jsr CLRCH
            pla
            tax
            pla
            clc
            rts

drvchkmr:   .byte "m-r", $00, $00, 2
drvchkmred:

.if ONLY_1541_AND_COMPATIBLE = 0

getmodel:   ; check if running on a 1541/70/71 compatible drive
            lda #.lobyte($e5c6)
            ldx #.hibyte($e5c6)
            jsr memreadbyt
            cmp #'4'
            bne not1541

            ; find out if 1541, 1541-C or 1541-II
            lda #.lobyte($c002)
            ldx #.hibyte($c002)
            jsr memreadbyt
            cmp #'c'
            beq chk1541ii; branch if 'c' at $c002 (from 'COPYRIGHT' etc.)
            ; find out if 1541 or 1541-C
            lda #.lobyte($eaa3)
            ldx #.hibyte($eaa3)
            jsr memreadbyt
            ldy #diskio::drivetype::DRIVE_1541
            cmp #$ff
            beq check1541u
            ; 1541-C: no $ff at $eaa3 (but likely $fe, data direction for track 0 sensor bit)
            ldy #diskio::drivetype::DRIVE_1541_C
            beq check1541u
chk1541ii:  lda #.lobyte($e5b7)
            ldx #.hibyte($e5b7)
            jsr memreadbyt
            tax
            lda #$ff
            cpx #'c' | $80; 'CBM DOS' etc.
            bne :+; treat as 1541-II if no match, so as not to detect JiffyDOS, SpeedDOS etc. as 1541-C but 1541-II instead
            ; find out if 1541-C or 1541-II
            lda #.lobyte($eaa3)
            ldx #.hibyte($eaa3)
            jsr memreadbyt
:           ldy #diskio::drivetype::DRIVE_1541_C
            cmp #$ff
            bne check1541u; 1541-C: no $ff at $eaa3 (but likely $fe, data direction for track 0 sensor bit)
            iny; diskio::drivetype::DRIVE_1541_II: $ff at $eaa3
            ; check for discrete drive logics vs gate array
            sty model1541
            jsr drvlistn
            ldx #0
:           lda dchk1541ii,x
            jsr CIOUT
            inx
            cpx #dch1541iie - dchk1541ii
            bne :-
            jsr UNLSN
            lda #.lobyte($0300)
            ldx #.hibyte($0300)
            jsr memreadbyt
            beq :+; branch if 1541-II
            ldy #diskio::drivetype::DRIVE_1541
check1541u: sty model1541
:           jsr drvlistn
            ldx #0
:           lda drvch1541u,x
            jsr CIOUT
            inx
            cpx #drvchkued - drvch1541u
            bne :-
            jsr UNLSN
            lda #.lobyte($0300)
            ldx #.hibyte($0300)
            jsr memreadbyt
            bmi :+; branch if 1541U
model1541 = * + 1
            ldy #0
            SKIPWORD
:           ldy #diskio::drivetype::DRIVE_1541U
            rts

not1541:    cmp #'7'
            bne not157x

            ; find out if 1570 or 1571
            cpx #'1' | $80; 71
            ldy #diskio::drivetype::DRIVE_1570
            bcc is1570
            ; 1571 or 1571CR

            lda #.lobyte($e5c2)
            ldx #.hibyte($e5c2)
            jsr memreadbyt
            cmp #'1'; 3.1
            ldy #diskio::drivetype::DRIVE_1571
            bcc :+
            iny; diskio::drivetype::DRIVE_1571CR
:
is1570:     rts

not157x:    ; neither 1541 nor 157x

            ; try FD2000/FD4000
            lda #.lobyte(FD_F_HD_H)
            ldx #.hibyte(FD_F_HD_H)
            jsr memreadbyt
            cmp #'f'
            beq :+
            cmp #'h'
            bne check1581
            ldy #diskio::drivetype::DRIVE_CMD_HD
            rts

:           lda #.lobyte($fef0)
            ldx #.hibyte($fef0)
            jsr memreadbyt
            ldy #diskio::drivetype::DRIVE_CMD_FD_2000
            cmp #'4'
            bne isfd2000
            iny; diskio::drivetype::DRIVE_CMD_FD_4000
isfd2000:   rts

            ; check if 1581
check1581:  lda #.lobyte(CBM1581_8)
            ldx #.hibyte(CBM1581_8)
            jsr memreadbyt
            ldy #diskio::drivetype::DRIVE_1581
            cmp #'8'
            bne :+
            lda #diskio::status::DEVICE_INCOMPATIBLE
:           rts

dchk1541ii: .byte "m-e", .lobyte($0205), .hibyte($0205)
            sei
            lda $1c0c
            ldx #$ec; disable byte sync: clear SOE
            stx $1c0c
            ldy #$01
            bit $1c01
            ldx $1c01
:           cpx $1c01; with disabled byte sync, $1c01 does not change on a 1541-II
            bne :+
            iny
            bne :-
:           sty $0300; if not 0, not a 1541-II (discrete drive logics rather than gate array)
            sta $1c0c
            cli
            rts
dch1541iie:
            .assert (* - dchk1541ii) <= 41, error, "dchk1541ii too big"

.endif ; ONLY_1541_AND_COMPATIBLE = 0

            ; may be executed on 1570/71 with ONLY_1541_AND_COMPATIBLE
drvch1541u: .byte "m-e", .lobyte($0205), .hibyte($0205)
            sei
           ;ldy #0
            dey
            sty $0300
            sty $1803; set all port pins as outputs
            lda #$a4; bit 0 may be forced to GND (1541-II) or connected to track 0 sensor (1541-C, normally 0 = not on track 0)
            sta $1801
            cmp $1801
            bne is1541u
            anc #$8a; and #imm, but no asl/rol, bit 7 of result goes to carry
            beq is1541u
            bcc is1541u
            tya
            arr #$7f; bit 6 of result goes to carry
            ror $0300
is1541u:    lda #$66; 1570/71 data directions
            sta $1803
            ; no cli
            rts
drvchkued:
            .assert (* - drvch1541u) <= 41, error, "drvch1541u too big"

drvmuteme:  .byte "m-e", .lobyte($020b), .hibyte($020b), "krill."
            sei
            jmp $0300
drvmutemed:
drvsilence: .byte "m-w", .lobyte($0300), .hibyte($0300), drvsilnced - (* + 1)
            cli
            ldy #$7f
            sty $180e; no IRQs from VIA1
            sty $1c0e; no IRQs from VIA2
            sty $400d; no IRQs from CIA/MOS5710
            sei
            sty $1802; set only ATN_IN as input
            lda #$ff
            sta $1803; set all $1801 port pins as outputs
            ldx #.hibyte($0400); CLK_IN, ATNA_OUT cleared, CLK_OUT low, DATA_OUT low
            stx $1801
            ldy #$d0 ; JOBCODE_EXECUTE
            jmp $043b; waitactive
drvsilnced:
            .assert (* - drvsilence) <= 41, error, "drvsilence too big"

.if ONLY_1541_AND_COMPATIBLE = 0

drvslnc71:  .byte "m-w", .lobyte($0300), .hibyte($0300), drvslnc71e - (* + 1)
            cli
            ldy #$7f
            sty $180e; no IRQs from VIA1
            sty $1c0e; no IRQs from VIA2
            sty $400d; no IRQs from CIA/MOS5710
            sei
            sty $1802; set only ATN_IN as input
            lda #$20 ; 2 MHz mode
            ora $1801
            sta $1801
            lda #$ff
            ldx #.hibyte($0400); CLK_IN, ATNA_OUT cleared, CLK_OUT low, DATA_OUT low
            ldy #$d0 ; JOBCODE_EXECUTE
            jmp $043b; waitactive
drvslnc71e:
            .assert (* - drvslnc71) <= 41, error, "drvslnc71 too big"

.endif ; ONLY_1541_AND_COMPATIBLE = 0

drvsilencc: .byte "m-w", .lobyte($043b), .hibyte($043b), atnfallbck - (* + 1)
waitactive:;lda #$ff
            sta $1c06; VIA2 timer 1 latch lo
            jsr $0407; waitactpr
            ldy #$90 ; ATNA_OUT set, CLK_OUT low, DATA_OUT low
:          ;ldx #.hibyte($0400); CLK_IN, ATNA_OUT cleared, CLK_OUT low, DATA_OUT low
            stx $1800; clear ATNA_OUT, set CLK_IN
:           bit $1800
            bpl :-
           ;ldy #$90 ; ATNA_OUT set, CLK_OUT low, DATA_OUT low
            sty $1800; set ATNA_OUT, clear CLK_IN
           ;lda #$ff
            sta $1c05; timer 1 hi
:           bit $1800
            bpl :---
            bit $1c05; timer 1 hi
            bne :-
            cmp $1803

            .assert (* - drvsilencc) <= 41, error, "waitactive too big"

atnfallbck: .byte "m-w", .lobyte($043b + atnfallbck - waitactive), .hibyte($043b + atnfallbck - waitactive), atnlo - (* + 1)
            bne atnloop
            cpx $1801; check if fast silencing using jmp ($1800) is possible
            bne :+
            cpy $1800
            beq * + 32; silncentry: jmp ($1800)
            ; slower fallback silence routine, this is required on older 1541U firmware revisions at least, which do not implement VIA1 port A correctly,
            ; it may also be required for drives modded with a parallel connection,
            ; this is executed unconditionally on 1570/71/CR at 2 MHz
:           inc $1803; set all $1801 port pins to input
atnloop:    bit $1800
            bmi atnloop
            stx $1800; clear ATNA_OUT
           ;lda #$ff
            sta $1c05; timer 1 hi
            ENABLE_WATCHDOG
:           bit $1800
            bpl :-
            sty $1800; set ATNA_OUT

            .assert (* - atnfallbck) <= 41, error, "atnfallbck too big"

atnlo:      .byte "m-w", .lobyte($0400), .hibyte($0400), atnhi - (* + 1)
            jmp ($fffc)
            .byte 0
            jmp ($1800); $0404, $04 = CLK_IN, jump to $0404 or $0484
waitactpr: ;ldy #$d0 ; JOBCODE_EXECUTE
            sty $01  ; JOBCODE0400
            ldy #$c0 ; timer 1 IRQs from VIA2
            sty $1c0e
            bne :+; jmp
            ; $0410, $10 = ATNA_OUT
            ; ATN_IN is clear, but ATNA_OUT is set: clear ATNA_OUT and reset timer
            stx $1800; x = $04 = CLK_IN
            sta $1c05; timer 1 hi
            ENABLE_WATCHDOG
            jmp ($1800); jump to $0404 or $0484
:           ldy #1
            sty $3f; JOBN, required on 1571 so code in the correct buffer ($0400) is executed upon interrupt
            rts

            .assert (* - atnlo) <= 41, error, "atnlo too big"

atnhi:      .byte "m-w", .lobyte($0481), .hibyte($0481), atnhiend - (* + 1)
            sei
            bmi * - 21; jmp, atnloop
            ; $0484, $84 = ATN_IN | CLK_IN
            ; ATN_IN is set, but ATNA_OUT is cleared: set ATNA_OUT
            sty $1800; y = $90 = ATN_IN | ATNA_OUT
            sei
silncentry: jmp ($1800); jump to $0410 or $0490
            .byte 0, 0, 0, 0, 0
            jmp ($1800); $0490, $90 = ATN_IN | ATNA_OUT, jump to $0410 or $0490
atnhiend:
            .assert (* - atnhi) <= 41, error, "atnhi too big"

.if ONLY_1541_AND_COMPATIBLE = 0

drvslnc81:  .byte "m-w", .lobyte($0300), .hibyte($0300), drvslnc81e - drvmute81
drvmute81: ;ldy #0
            sty $4001
            dey
            sty $4007
            lda #$19
slnc81loop: sta $400f
:           bit $4001
slnc81sens: bpl slnc81loop; first, wait for a long period of ATN_IN set
            ldx $4007
            bne :-
            ldx #OPC_BMI
            cpx slnc81sens - drvmute81 + $0300
            stx slnc81sens - drvmute81 + $0300
    .if DISABLE_WATCHDOG
            jmp slnc81loop
    .else
            bne slnc81loop
            jmp ($fffc)
    .endif
drvslnc81e:
            .assert (* - drvslnc81) <= 41, error, "drvslnc81 too big"

drvslncfd:  .byte "m-w", .lobyte($0300), .hibyte($0300), drvslncfde - drvmutefd
drvmutefd:  ldx #0
            stx $4001
            dex
slncfdloop: stx $4005
:           bit $4001
slncfdsens: bpl slncfdloop
            lda $4005
            bne :-
            lda #OPC_BMI
            cmp slncfdsens - drvmutefd + $0300
            sta slncfdsens - drvmutefd + $0300
    .if DISABLE_WATCHDOG
            jmp slncfdloop
    .else
            bne slncfdloop
            jmp ($fffc)
     .endif
drvslncfde:
            .assert (* - drvslncfd) <= 41, error, "drvslncfd too big"

drvslnchd:  .byte "m-w", .lobyte($0300), .hibyte($0300), drvslnchde - drvmutehd
drvmutehd:  ldx #0
            stx $8000
            dex
slnchdloop: stx $8005
:           bit $8000
slnchdsens: bpl slnchdloop
            lda $8005
            bne :-
            lda #OPC_BMI
            cmp slnchdsens - drvmutehd + $0300
            sta slnchdsens - drvmutehd + $0300
    .if DISABLE_WATCHDOG
            jmp slnchdloop
    .else
            bne slnchdloop
            jmp ($fffc)
    .endif
drvslnchde:
            .assert (* - drvslnchd) <= 41, error, "drvslnchd too big"

dcodeselt0: .byte .lobyte(cbm1541::drvcodeend41 - cbm1541::drvcodebeg41 + cbm1541::drivecode41)
            .byte .lobyte(cbm1571::drvcodeend71 - cbm1571::drvcodebeg71 + cbm1571::drivecode71)
            .byte .lobyte(cbm1581::drvcodeend81 - cbm1581::drvcodebeg81 + cbm1581::drivecode81)
dcodeselt1: .byte .hibyte(cbm1541::drvcodeend41 - cbm1541::drvcodebeg41 + cbm1541::drivecode41)
            .byte .hibyte(cbm1571::drvcodeend71 - cbm1571::drvcodebeg71 + cbm1571::drivecode71)
            .byte .hibyte(cbm1581::drvcodeend81 - cbm1581::drvcodebeg81 + cbm1581::drivecode81)
dcodeselt2: .byte .lobyte(cbm1541::drvprgend41 - cbm1541::drvcodeend41 + cbm1541::TRAMPOLINEOFFSET)
            .byte .lobyte(cbm1571::drvprgend71 - cbm1571::drvcodeend71 + cbm1571::TRAMPOLINEOFFSET)
            .byte .lobyte(cbm1581::drvprgend81 - cbm1581::drvcodeend81)
dcodeselt3: .byte .lobyte(cbm1541::drivecode41)
            .byte .lobyte(cbm1571::drivecode71)
            .byte .lobyte(cbm1581::drivecode81)
dcodeselt4: .byte .hibyte(cbm1541::drivecode41)
            .byte .hibyte(cbm1571::drivecode71)
            .byte .hibyte(cbm1581::drivecode81)
dcodeselt5: .byte .hibyte(cbm1541::drvcodeend41 - cbm1541::TRAMPOLINEOFFSET)
            .byte .hibyte(cbm1571::drvcodeend71 - cbm1571::TRAMPOLINEOFFSET)
            .byte .hibyte(cbm1581::drvcodeend81)
dcodeselt6: .byte .lobyte(cbm1541::drvcodeend41 - cbm1541::TRAMPOLINEOFFSET)
            .byte .lobyte(cbm1571::drvcodeend71 - cbm1571::TRAMPOLINEOFFSET)
            .byte .lobyte(cbm1581::drvcodeend81)
dcodeselt7: .byte .hibyte(cbm1541::dinstall)
            .byte .hibyte(cbm1571::dinstall)
            .byte .hibyte(cbm1581::dinstall)
dcodeselt8: .byte .lobyte(cbm1541::dinstall)
            .byte .lobyte(cbm1571::dinstall)
            .byte .lobyte(cbm1581::dinstall)
dcodeselt9: .byte 41
            .byte 71
            .byte 81
dcodeselta: .byte DIRTRACK
            .byte DIRTRACK
            .byte DIRTRACK81

.endif; ONLY_1541_AND_COMPATIBLE = 0

            ; check if drive allows code upload and execution
chkdrvcode: lda #.lobyte($0300)
            ldx #.hibyte($0300)
            jsr memreadbyt
            bcc :+
            lda #$ff
            rts
:           eor #$ff
            sta drvchkval + 1
            jsr drvlistn
            ldx #0
:           lda drvchkme,x
            jsr CIOUT
            inx
            cpx #drvchkmed - drvchkme
            bne :-
            jsr UNLSN
            lda #.lobyte($0300)
            ldx #.hibyte($0300)
            jsr memreadbyt
drvchkval:  cmp #0
            rts

drvchkme:   .byte "m-e", .lobyte($020a), .hibyte($020a), "krill"
            lda #$ff
            eor $0300
            sta $0300
            rts
drvchkmed:
            .assert (* - drvchkme) <= 41, error, "drvchkme too big"

.if LOAD_VIA_KERNAL_FALLBACK
drvfaststp: .byte MINSTEPSPEED, $01, .hibyte($1c07), .lobyte($1c07), "w-m"; read backward
twosided:   .byte "1m>0u"; read backward, enable 1571 mode to read two-sided disks
.endif; LOAD_VIA_KERNAL_FALLBACK

dcodesel5 = * + 1
dcodesel6 = * + 2
drvrutmw:   .byte 35, 0, 0, "w-m"; read backward
droutrun:   .byte "m-e", .lobyte($0209), .hibyte($0209), "krill"
dcodesel7 = * + 1
dcodesel8 = *
            .byte $00, $00, .lobyte(REPOSITORY_VERSION), .hibyte(REPOSITORY_VERSION), PLATFORM
family:     .byte 41
dirtrack:   .byte DIRTRACK, FILENAME_MAXLENGTH, CONFIG_INTERNAL
droutruned:

messages:
.if ONLY_1541_AND_COMPATIBLE = 0
errormute:  .byte PETSCII_LO_UP_CASE
.if PLATFORM = diskio::platform::COMMODORE_128
            .byte PETSCII_BLINK
.endif
.if PLATFORM = diskio::platform::COMMODORE_16
            .byte PETSCII_ORANGE
.else
            .byte PETSCII_WHITE
.endif
            .byte "ERROR: Failed to mute device #"
mutedevice: .byte "00.", 0
.endif; ONLY_1541_AND_COMPATIBLE = 0

warnemubug: .byte PETSCII_LO_UP_CASE
.if PLATFORM = diskio::platform::COMMODORE_128
            .byte PETSCII_BLINK
.endif
.if PLATFORM = diskio::platform::COMMODORE_16
            .byte PETSCII_ORANGE
.else
            .byte PETSCII_WHITE
.endif
            .byte "WARNING: Buggy "
.if PLATFORM = diskio::platform::COMMODORE_64
            .byte "1541U firmware"
.else
            .byte "emulator"
.endif
            .byte " detected. Please update.", 0

version:    .byte "Krill's Loader, revision ", REPOSITORY_VERSION_STRING, PETSCII_RETURN, "cfg "
            itoa4 MIN_DEVICE_NO
            itoa8 MAX_DEVICE_NO
            itoa1 ONLY_1541_AND_COMPATIBLE
            .byte '.'
            itoa8 DIRTRACK
            itoa8 DIRTRACK81
            itoa8 FILENAME_MAXLENGTH
            .byte '.'
            itoa8 MINSTEPSPEED
            itoa8 MAXSTEPSPEED
            itoa4 STEPPERACC
            itoa4 SINGLESTEPSPEED
            .byte '.'
            itoa4 (2 * LOAD_COMPD_API) + LOAD_RAW_API
            itoa1 NTSC_COMPATIBILITY
            itoa1 PREFER_SPEED_OVER_SIZE
            itoa1 UNINSTALL_API
            itoa1 FILE_EXISTS_API
            itoa1 LOAD_UNDER_D000_DFFF
            itoa1 ALLOW_2_MHZ_ON_C128
            itoa4 (2 * MEM_DECOMP_TO_API) + MEM_DECOMP_API
            itoa1 (2 * LOAD_TO_API) + END_ADDRESS_API
            itoa1 LOAD_VIA_KERNAL_FALLBACK
            itoa1 CLOSE_FILE_API
            itoa8 CONFIG_INTERNAL
            .byte '.'
            itoa4 DECOMPRESSOR
            .byte 0

            CHECK_INSTALL_END_ADDRESS

.exportzp status_OK                       = diskio::status::OK
.exportzp status_DEVICE_INCOMPATIBLE      = diskio::status::DEVICE_INCOMPATIBLE
.exportzp status_TOO_MANY_DEVICES         = diskio::status::TOO_MANY_DEVICES
.exportzp status_GENERIC_KERNAL_ERROR     = diskio::status::GENERIC_KERNAL_ERROR
.exportzp status_DEVICE_NOT_PRESENT       = diskio::status::DEVICE_NOT_PRESENT
.exportzp status_FILE_NOT_FOUND           = diskio::status::FILE_NOT_FOUND

.if PLATFORM <> diskio::platform::COMMODORE_16
    .exportzp config_ALLOW_2_MHZ_ON_C128  = ALLOW_2_MHZ_ON_C128
.endif
.exportzp config_DECOMPRESSOR             = DECOMPRESSOR
.exportzp config_DIRTRACK                 = DIRTRACK
.exportzp config_DIRTRACK81               = DIRTRACK81
.exportzp config_END_ADDRESS_API          = END_ADDRESS_API
.exportzp config_FILENAME_MAXLENGTH       = FILENAME_MAXLENGTH
.exportzp config_FILE_EXISTS_API          = FILE_EXISTS_API
.exportzp config_INTERNAL                 = CONFIG_INTERNAL
.exportzp config_LOAD_COMPD_API           = LOAD_COMPD_API
.exportzp config_LOAD_RAW_API             = LOAD_RAW_API
.exportzp config_LOAD_TO_API              = LOAD_TO_API
.exportzp config_LOAD_UNDER_D000_DFFF     = LOAD_UNDER_D000_DFFF
.exportzp config_LOAD_VIA_KERNAL_FALLBACK = LOAD_VIA_KERNAL_FALLBACK
.exportzp config_MEM_DECOMP_API           = MEM_DECOMP_API
.exportzp config_MEM_DECOMP_TO_API        = MEM_DECOMP_TO_API
.exportzp config_NTSC_COMPATIBILITY       = NTSC_COMPATIBILITY
.exportzp config_ONLY_1541_AND_COMPATIBLE = ONLY_1541_AND_COMPATIBLE
.exportzp config_PREFER_SPEED_OVER_SIZE   = PREFER_SPEED_OVER_SIZE
.exportzp config_UNINSTALL_API            = UNINSTALL_API
