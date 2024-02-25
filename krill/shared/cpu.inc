; MOS6502/6510/8500/8502

.ifndef _CPU_INC_
_CPU_INC_ = 1

.ifndef PLATFORM
PLATFORM = 64
.endif

.if PLATFORM = 16
CLOCK_PAL                       = 886723; Hz - single clock
.define CYCLES_PER_SECOND_PAL   .byte $c3, $87, $0d, $00; 886723 - single clock
CLOCK_NTSC                      = 894886; Hz - single clock
.define CYCLES_PER_SECOND_NTSC  .byte $a6, $a7, $0d, $00; 894886 - single clock
.else
CLOCK_PAL                       =  985248; Hz
.define CYCLES_PER_SECOND_PAL   .byte $a0, $08, $0f, $00;  985248
CLOCK_NTSC                      = 1022727; Hz
.define CYCLES_PER_SECOND_NTSC  .byte $07, $9b, $0f, $00; 1022727
.endif

OPC_BRK                         = $00
OPC_ORA_ZPXI                    = $01
OPC_JAM                         = $02; unofficial
OPC_SLO_ZPXI                    = $03; unofficial
;OPC_NOP                        = $04; unofficial
OPC_ORA_ZP                      = $05
OPC_ASL_ZP                      = $06
OPC_SLO_ZP                      = $07; unofficial
OPC_PHP                         = $08
OPC_ORA_IMM                     = $09
OPC_ASL                         = $0a
OPC_ANC_IMM                     = $0b; unofficial
OPC_NOP_ABS                     = $0c
OPC_ORA_ABS                     = $0d
OPC_ASL_ABS                     = $0e
OPC_SLO_ABS                     = $0f; unofficial
OPC_BPL                         = $10
OPC_ORA_ZPIY                    = $11
;OPC_JAM                        = $12; unofficial
OPC_SLO_ZPIY                    = $13; unofficial
OPC_NOP_ZPX                     = $14; unofficial
OPC_ORA_ZPX                     = $15
OPC_ASL_ZPX                     = $16
OPC_SLO_ZPX                     = $17; unofficial
OPC_CLC                         = $18
OPC_ORA_ABSY                    = $19
;OPC_NOP                        = $1a; unofficial
OPC_SLO_ABSY                    = $1b; unofficial
OPC_NOP_ABSX                    = $1c; unofficial
OPC_ORA_ABSX                    = $1d
OPC_ASL_ABSX                    = $1e
OPC_SLO_ABSX                    = $1f; unofficial
OPC_JSR_ABS                     = $20
OPC_AND_ZPXI                    = $21
;OPC_JAM                        = $22; unofficial
OPC_RLA_ZPXI                    = $23; unofficial
OPC_BIT_ZP                      = $24
OPC_AND_ZP                      = $25
OPC_ROL_ZP                      = $26
OPC_RLA_ZP                      = $27; unofficial
OPC_PLP                         = $28
OPC_AND_IMM                     = $29
OPC_ROL                         = $2a
;OPC_ANC_IMM                    = $2b; unofficial
OPC_BIT_ABS                     = $2c
OPC_AND_ABS                     = $2d
OPC_ROL_ABS                     = $2e
OPC_RLA_ABS                     = $2f; unofficial
OPC_BMI                         = $30
OPC_AND_ZPIY                    = $31
;OPC_JAM                        = $32; unofficial
OPC_RLA_ZPIY                    = $33; unofficial
;OPC_NOP_ZPX                    = $34
OPC_AND_ZPX                     = $35
OPC_ROL_ZPX                     = $36
OPC_RLA_ZPX                     = $37; unofficial
OPC_SEC                         = $38
OPC_AND_ABSY                    = $39
;OPC_NOP                        = $3a; unofficial
OPC_RLA_ABSY                    = $3b; unofficial
;OPC_NOP_ABSX                   = $3c
OPC_AND_ABSX                    = $3d
OPC_ROL_ABSX                    = $3e
OPC_RLA_ABSX                    = $3f; unofficial
OPC_RTI                         = $40
OPC_EOR_ZPXI                    = $41
;OPC_JAM                        = $42; unofficial
OPC_SRE_ZPXI                    = $43; unofficial
OPC_NOP_ZP                      = $44
OPC_EOR_ZP                      = $45
OPC_LSR_ZP                      = $46
OPC_SRE_ZP                      = $47; unofficial
OPC_PHA                         = $48
OPC_EOR_IMM                     = $49
OPC_LSR                         = $4a
OPC_ASL_IMM                     = $4b
OPC_JMP_ABS                     = $4c
OPC_EOR_ABS                     = $4d
OPC_LSR_ABS                     = $4e
OPC_SRE_ABS                     = $4f; unofficial
OPC_BVC                         = $50
OPC_EOR_ZPIY                    = $51
;OPC_JAM                        = $52; unofficial
OPC_SRE_ZPIY                    = $53; unofficial
;OPC_NOP_ZPX                    = $54; unofficial
OPC_EOR_ZPX                     = $55
OPC_LSR_ZPX                     = $56
OPC_SRE_ZPX                     = $57; unofficial
OPC_CLI                         = $58
OPC_EOR_ABSY                    = $59
;OPC_NOP                        = $5a
OPC_SRE_ABSY                    = $5b; unofficial
;OPC_NOP_ABSX                   = $5c
OPC_EOR_ABSX                    = $5d
OPC_LSR_ABSX                    = $5e
OPC_SRE_ABSX                    = $5f; unofficial
OPC_RTS                         = $60
OPC_ADC_ZPIX                    = $61
;OPC_JAM                        = $62; unofficial
OPC_RRA_ZPIX                    = $63; unofficial
;OPC_NOP_ZP                     = $64; unofficial
OPC_ADC_ZP                      = $65
OPC_ROR_ZP                      = $66
OPC_RRA_ZP                      = $67; unofficial
OPC_PLA                         = $68
OPC_ADC_IMM                     = $69
OPC_ROR                         = $6a
OPC_ARR_IMM                     = $6b; unofficial
OPC_JMP_ABSI                    = $6c
OPC_ADC_ABS                     = $6d
OPC_ROR_ABS                     = $6e
OPC_RRA_ABS                     = $6f; unofficial
OPC_BVS                         = $70
OPC_ADC_ZPIY                    = $71
;OPC_JAM                        = $72; unofficial
OPC_RRA_ZPIY                    = $73; unofficial
;OPC_NOP_ZPX                    = $74; unofficial
OPC_ADC_ZPX                     = $75
OPC_ROR_ZPX                     = $76
OPC_RRA_ZPX                     = $77; unofficial
OPC_SEI                         = $78
OPC_ADC_ABSY                    = $79
;OPC_NOP                        = $7a; unofficial
OPC_RRA_ABSY                    = $7b; unofficial
;OPC_NOP_ABSX                   = $7c; unofficial
OPC_ADC_ABSX                    = $7d
OPC_ROR_ABSX                    = $7e
OPC_RRA_ABSX                    = $7f; unofficial
OPC_NOP_IMM                     = $80; unofficial
OPC_STA_ZPXI                    = $81
;OPC_NOP_IMM                    = $82
OPC_SAX_ZPXI                    = $83; unofficial
OPC_STY_ZP                      = $84
OPC_STA_ZP                      = $85
OPC_STX_ZP                      = $86
OPC_SAX_ZP                      = $87; unofficial
OPC_DEY                         = $88
;OPC_NOP_IMM                    = $89; unofficial
OPC_TXA                         = $8a
OPC_XAA_IMM                     = $8b; unofficial
OPC_STY_ABS                     = $8c
OPC_STA_ABS                     = $8d
OPC_STX_ABS                     = $8e
OPC_SAX_ABS                     = $8f; unofficial
OPC_BCC                         = $90
OPC_STA_ZPIY                    = $91
;OPC_JAM                        = $92; unofficial
OPC_AHX_ZPIY                    = $93; unofficial
OPC_STY_ZPX                     = $94
OPC_STA_ZPX                     = $95
OPC_STY_ZPY                     = $96
OPC_SAX_ZPY                     = $97; unofficial
OPC_TYA                         = $98
OPC_STA_ABSY                    = $99
OPC_TXS                         = $9a
OPC_TAS_ABSY                    = $9b; unofficial
OPC_SHF_ABSX                    = $9c; unofficial
OPC_STA_ABSX                    = $9d
OPC_SHX_ABSY                    = $9e; unofficial
OPC_AHX_ABSY                    = $9f; unofficial
OPC_LDY_IMM                     = $a0
OPC_LDA_ZPXI                    = $a1
OPC_LDX_IMM                     = $a2
OPC_LAX_ZPXI                    = $a3; unofficial
OPC_LDY_ZP                      = $a4
OPC_LDA_ZP                      = $a5
OPC_LDX_ZP                      = $a6
OPC_LAX_ZP                      = $a7
OPC_TAY                         = $a8
OPC_LDA_IMM                     = $a9
OPC_TAX                         = $aa
OPC_LAX_IMM                     = $ab; unofficial
OPC_LDY_ABS                     = $ac
OPC_LDA_ABS                     = $ad
OPC_LDX_ABS                     = $ae
OPC_LAX_ABS                     = $af; unofficial
OPC_BCS                         = $b0
OPC_LDA_ZPIY                    = $b1
;OPC_JAM                        = $b2; unofficial
;OPC_LAX_ZPI                    = $b3; unofficial
OPC_LDY_ZPX                     = $b4
OPC_LDA_ZPX                     = $b5
OPC_LDX_ZPY                     = $b6
OPC_LAX_ZPY                     = $b7; unofficial
OPC_CLV                         = $b8
OPC_LDA_ABSY                    = $b9
OPC_TSX                         = $ba
OPC_LAS_ABSY                    = $bb
OPC_LDY_ABSX                    = $bc
OPC_LDA_ABSX                    = $bd
OPC_LDX_ABSY                    = $be
OPC_LAX_ABSY                    = $bf; unofficial
OPC_CPY_IMM                     = $c0
OPC_CMP_ZPXI                    = $c1
;OPC_NOP_IMM                    = $c2; unofficial
OPC_DCP_ZPXI                    = $c3; unofficial
OPC_CPY_ZP                      = $c4
OPC_CMP_ZP                      = $c5
OPC_DEC_ZP                      = $c6
OPC_DCP_ZP                      = $c7; unofficial
OPC_INY                         = $c8
OPC_CMP_IMM                     = $c9
OPC_DEX                         = $ca
OPC_SBX_IMM                     = $cb; unofficial
OPC_CPY_ABS                     = $cc
OPC_CMP_ABS                     = $cd
OPC_DEC_ABS                     = $ce
OPC_DCP_ABS                     = $cf; unofficial
OPC_BNE                         = $d0
OPC_CMP_ZPIY                    = $d1
;OPC_JAM                        = $d2; unofficial
OPC_DCP_ZPIY                    = $d3; unofficial
;OPC_NOP_ZPX                    = $d4; unofficial
OPC_CMP_ZPX                     = $d5
OPC_DEC_ZPX                     = $d6
OPC_DCP_ZPX                     = $d7; unofficial
OPC_CLD                         = $d8
OPC_CMP_ABSY                    = $d9
;OPC_NOP                        = $da; unofficial
OPC_DCP_ABSY                    = $db; unofficial
;OPC_NOP_ABSX                   = $dc; unofficial
OPC_CMP_ABSX                    = $dd
OPC_DEC_ABSX                    = $de
OPC_DCP_ABSX                    = $df; unofficial
OPC_CPX_IMM                     = $e0
OPC_SBC_ZPXI                    = $e1
;OPC_NOP_IMM                    = $e2; unofficial
OPC_ISC_ZPXI                    = $e3; unofficial
OPC_CPX_ZP                      = $e4
OPC_SBC_ZP                      = $e5
OPC_INC_ZP                      = $e6
OPC_ISC_ZP                      = $e7; unofficial
OPC_INX                         = $e8
OPC_SBC_IMM                     = $e9
OPC_NOP                         = $ea
;OPC_SBC_IMM                    = $eb
OPC_CPX_ABS                     = $ec
OPC_SBC_ABS                     = $ed
OPC_INC_ABS                     = $ee
OPC_ISC_ABS                     = $ef; unofficial
OPC_BEQ                         = $f0
OPC_SBC_ZPIY                    = $f1
;OPC_JAM                        = $f2; unofficial
OPC_ISC_ZPIY                    = $f3; unofficial
;OPC_NOP_ZPX                    = $f4; unofficial
OPC_SBC_ZPX                     = $f5
OPC_INC_ZPX                     = $f6
OPC_ISC_ZPX                     = $f7; unofficial
OPC_SED                         = $f8
OPC_SBC_ABSY                    = $f9
;OPC_NOP                        = $fa; unofficial
OPC_ISC_ABSY                    = $fb; unofficial
;OPC_NOP_ABSX                   = $fc; unofficial
OPC_SBC_ABSX                    = $fd
OPC_INC_ABSX                    = $fe
OPC_ISC_ABSX                    = $ff; unofficial

NEGATIVE                        = $80; N flag
OVERFLOW                        = $40; V flag
BREAK                           = $10; B flag
DECIMAL                         = $08; D flag
INTERRUPT                       = $04; I flag
ZERO                            = $02; Z flag
CARRY                           = $01; C flag

FLAG_N                          = $80; N flag
FLAG_V                          = $40; V flag
FLAG_B                          = $10; B flag
FLAG_D                          = $08; D flag
FLAG_I                          = $04; I flag
FLAG_Z                          = $02; Z flag
FLAG_C                          = $01; C flag

IO_PORT_DIRECTION               = $00
.if PLATFORM = 16
 IO_PORT_SERIAL_DATA_OUT_OUTPUT = %00000001
 IO_PORT_SERIAL_DATA_OUT_INPUT  = %00000000
 IO_PORT_SERIAL_CLK_OUT_OUTPUT  = %00000010
 IO_PORT_SERIAL_CLK_OUT_INPUT   = %00000000
 IO_PORT_SERIAL_ATN_OUT_OUTPUT  = %00000100
 IO_PORT_SERIAL_ATN_OUT_INPUT   = %00000000
 IO_PORT_CST_MTR_OUTPUT         = %00001000
 IO_PORT_CST_MTR_INPUT          = %00000000
 IO_PORT_CST_RD_OUTPUT          = %00010000
 IO_PORT_CST_RD_INPUT           = %00000000
 IO_PORT_SERIAL_CLK_IN_OUTPUT   = %01000000
 IO_PORT_SERIAL_CLK_IN_INPUT    = %00000000
 IO_PORT_CST_WRT_INPUT          = IO_PORT_SERIAL_CLK_IN_INPUT
 IO_PORT_CST_WRT_OUTPUT         = IO_PORT_SERIAL_CLK_IN_OUTPUT
 IO_PORT_SERIAL_DATA_IN_OUTPUT  = %10000000
 IO_PORT_SERIAL_DATA_IN_INPUT   = %00000000
 IO_PORT_CST_SENSE_INPUT        = IO_PORT_SERIAL_DATA_IN_INPUT
 IO_PORT_CST_SENSE_OUTPUT       = IO_PORT_SERIAL_DATA_IN_OUTPUT
.else
 LORAM_OUTPUT                   = %00000001
 LORAM_INPUT                    = %00000000
 HIRAM_OUTPUT                   = %00000010
 HIRAM_INPUT                    = %00000000
 CHAREN_OUTPUT                  = %00000100
 CHAREN_INPUT                   = %00000000
 CASSETTE_WRITE_OUTPUT          = %00001000
 CASSETTE_WRITE_INPUT           = %00000000
 CASSETTE_SENSE_OUTPUT          = %00010000
 CASSETTE_SENSE_INPUT           = %00000000
 CASSETTE_MOTOR_OUTPUT          = %00100000
 CASSETTE_MOTOR_INPUT           = %00000000

 IO_PORT_DIRECTION_DEFAULT      = CASSETTE_MOTOR_OUTPUT | CASSETTE_SENSE_OUTPUT | CASSETTE_WRITE_OUTPUT | CHAREN_OUTPUT | HIRAM_OUTPUT | LORAM_OUTPUT
.endif

IO_PORT                         = $01
.if PLATFORM = 16
 IO_PORT_SERIAL_DATA_OUT        = %00000001
 IO_PORT_CST_SENSE_OUT          = %00000001
 IO_PORT_SERIAL_CLK_OUT         = %00000010
 IO_PORT_CST_WRT_OUT            = %00000010
 IO_PORT_SERIAL_ATN_OUT         = %00000100
 IO_PORT_CST_MTR                = %00001000
  IO_PORT_CST_MTR_OFF           = IO_PORT_CST_MTR
  IO_PORT_CST_MTR_ON            = %00000000
 IO_PORT_CST_RD                 = %00010000
 IO_PORT_SERIAL_CLK_IN          = %01000000
 IO_PORT_CST_WRT_IN             = %01000000
 IO_PORT_SERIAL_DATA_IN         = %10000000
 IO_PORT_CST_SENSE_IN           = %10000000
.else
 CASSETTE_WRITE                 = %00001000
 CASSETTE_SENSE                 = %00010000
 CASSETTE_MOTOR                 = %00100000
    .if PLATFORM = 128
 CPU_D800_BANK_0                = %00000000
 CPU_D800_BANK_1                = %00000001
 VIC_D800_BANK_0                = %00000000
 VIC_D800_BANK_1                = %00000010
 CHARGEN_ENABLED                = %00000000
 CHARGEN_DISABLED               = %00000100
 CAPS_LOCK_OFF                  = %01000000; ASCII for German C-128
 CAPS_LOCK_ON                   = %00000000; DIN for German C-128

 IO_PORT_CHARGEN_ENABLED        = CAPS_LOCK_OFF | CASSETTE_SENSE | CASSETTE_MOTOR | CHARGEN_ENABLED  | VIC_D800_BANK_1 | CPU_D800_BANK_1; $77
 IO_PORT_CHARGEN_DISABLED       = CAPS_LOCK_OFF | CASSETTE_SENSE | CASSETTE_MOTOR | CHARGEN_DISABLED | VIC_D800_BANK_1 | CPU_D800_BANK_1; $73

    .else
 LORAM                          = %00000001
 HIRAM                          = %00000010
 CHAREN                         = %00000100

 MEMCONFIG_IO_KERNAL_BASIC      = CASSETTE_SENSE | CASSETTE_MOTOR | CHAREN | HIRAM | LORAM; $37
 MEMCONFIG_IO_KERNAL            = CASSETTE_SENSE | CASSETTE_MOTOR | CHAREN | HIRAM |   0  ; $36
 MEMCONFIG_IO                   = CASSETTE_SENSE | CASSETTE_MOTOR | CHAREN |   0   | LORAM; $35
 MEMCONFIG_ALL_RAM_2            = CASSETTE_SENSE | CASSETTE_MOTOR | CHAREN |   0   |   0  ; $34
 MEMCONFIG_CHARGEN_KERNAL_BASIC = CASSETTE_SENSE | CASSETTE_MOTOR |    0   | HIRAM | LORAM; $33
 MEMCONFIG_CHARGEN_KERNAL       = CASSETTE_SENSE | CASSETTE_MOTOR |    0   | HIRAM |   0  ; $32
 MEMCONFIG_CHARGEN              = CASSETTE_SENSE | CASSETTE_MOTOR |    0   |   0   | LORAM; $31
 MEMCONFIG_ALL_RAM              = CASSETTE_SENSE | CASSETTE_MOTOR |    0   |   0   |   0  ; $30
    .endif
.endif

STACK                           = $0100

NMI_VECTOR                      = $fffa
NMI_VECTORLO                    = $fffa
NMI_VECTORHI                    = $fffb

RESET_VECTOR                    = $fffc
RESET_VECTORLO                  = $fffc
RESET_VECTORHI                  = $fffd

IRQ_VECTOR                      = $fffe
IRQ_VECTORLO                    = $fffe
IRQ_VECTORHI                    = $ffff

.macro SKIPBYTE
    .byte OPC_BIT_ZP
.endmacro

.macro SKIPBYTE_NOP
    .byte OPC_NOP_IMM
.endmacro

.macro SKIPWORD
    .byte OPC_BIT_ABS
.endmacro

.macro SKIPWORD_NOP
    .byte OPC_NOP_ABS
.endmacro

.endif; !_CPU_INC_
