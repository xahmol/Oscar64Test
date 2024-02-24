; MOS6522

.ifndef _VIA_INC_
_VIA_INC_ = 1

.ifdef CX500
; The Century Planning Corp. CX-500/Tecmate NPH-501C drive is not a 1541 clone, as the
; VIAs are located at $3800 and $5c00 due to simplified address decoding logics, and the ROM
; including the position of the GCR encoding and decoding tables is entirely different as well.
VIA1_BASE                         = $3800
.else
VIA1_BASE                         = $1800
.endif

 VIA_PIO0                         = %00000001
 VIA_PIO1                         = %00000010
 VIA_PIO2                         = %00000100
 VIA_PIO3                         = %00001000
 VIA_PIO4                         = %00010000
 VIA_PIO5                         = %00100000
 VIA_PIO6                         = %01000000
 VIA_PIO7                         = %10000000

VIA1_PRB                          = VIA1_BASE + $00; Port register B
VIA1_ORB                          = VIA1_PRB; Output Register B
VIA1_IRB                          = VIA1_PRB; Input Register B
 DATA_IN                          = VIA_PIO0
 DATA_OUT                         = VIA_PIO1
 CLK_IN                           = VIA_PIO2
 CLK_OUT                          = VIA_PIO3
 ATNA_OUT                         = VIA_PIO4
 DEVICE_NUMBER                    = VIA_PIO5 | VIA_PIO6
 DEVICE_NUMBER_8                  = %00000000
 DEVICE_NUMBER_9                  = VIA_PIO5
 DEVICE_NUMBER_10                 = VIA_PIO6
 DEVICE_NUMBER_11                 = VIA_PIO5 | VIA_PIO6
 DEVICE_NUMBER_SHIFT              = 5
 DEVICE_NUMBER_MASK               = DEVICE_NUMBER
 ATN_IN                           = VIA_PIO7

; works only on 1571(CR)
VIA1_PRA                          = VIA1_BASE + $01; Port register A
VIA1_ORA                          = VIA1_PRA; Output Register A
VIA1_IRA                          = VIA1_PRA; Input Register A
 TRACK_0                          = %00000001
 FAST_SERIAL_DIR                  = %00000010
  FAST_SERIAL_INPUT               = %00000000
  FAST_SERIAL_OUTPUT              = FAST_SERIAL_DIR
 SIDE_SELECT                      = %00000100
 SIDE_A                           = %00000000
 SIDE_B                           = SIDE_SELECT
 TWO_MHZ                          = %00100000
 BYTE_READY                       = %10000000

VIA1_DDRB                         = VIA1_BASE + $02; Data direction register B
 VIA_PIO0_OUTPUT                  = VIA_PIO0
 VIA_PIO0_INPUT                   = %00000000
 VIA_DATA_IN_OUTPUT               = VIA_PIO0
 VIA_DATA_IN_INPUT                = %00000000
 VIA_PIO1_OUTPUT                  = VIA_PIO1
 VIA_PIO1_INPUT                   = %00000000
 VIA_DATA_OUT_OUTPUT              = VIA_PIO1
 VIA_DATA_OUT_INPUT               = %00000000
 VIA_PIO2_OUTPUT                  = VIA_PIO2
 VIA_PIO2_INPUT                   = %00000000
 VIA_CLK_IN_OUTPUT                = VIA_PIO2
 VIA_CLK_IN_INPUT                 = %00000000
 VIA_PIO3_OUTPUT                  = VIA_PIO3
 VIA_PIO3_INPUT                   = %00000000
 VIA_CLK_OUT_OUTPUT               = VIA_PIO3
 VIA_CLK_OUT_INPUT                = %00000000
 VIA_PIO4_OUTPUT                  = VIA_PIO4
 VIA_PIO4_INPUT                   = %00000000
 VIA_ATNA_OUT_OUTPUT              = VIA_PIO4
 VIA_ATNA_OUT_INPUT               = %00000000
 VIA_PIO5_OUTPUT                  = VIA_PIO5
 VIA_PIO5_INPUT                   = %00000000
 VIA_PIO6_OUTPUT                  = VIA_PIO6
 VIA_PIO6_INPUT                   = %00000000
 VIA_DEVICE_NUMBER_OUTPUT         = VIA_PIO5 | VIA_PIO6
 VIA_DEVICE_NUMBER_INPUT          = %00000000
 VIA_PIO7_OUTPUT                  = VIA_PIO7
 VIA_PIO7_INPUT                   = %00000000
 VIA_ATN_IN_OUTPUT                = VIA_PIO7
 VIA_ATN_IN_INPUT                 = %00000000

VIA1_DDRA                         = VIA1_BASE + $03; Data direction register A

VIA1_T1C_L                        = VIA1_BASE + $04; Timer 1 Lo
VIA1_T1_LO                        = VIA1_T1C_L

VIA1_T1C_H                        = VIA1_BASE + $05; Timer 1 Hi
VIA1_T1_HI                        = VIA1_T1C_H

VIA1_T1L_L                        = VIA1_BASE + $06; Timer 1 Latch Lo
VIA1_T1_LATCH_LO                  = VIA1_T1L_L

VIA1_T1L_H                        = VIA1_BASE + $07; Timer 1 Latch Hi
VIA1_T1_LATCH_HI                  = VIA1_T1L_H

VIA1_T2C_L                        = VIA1_BASE + $08; Timer 2 Lo
VIA1_T2_LO                        = VIA1_T2C_L

VIA1_T2C_H                        = VIA1_BASE + $09; Timer 2 Hi
VIA1_T2_HI                        = VIA1_T2C_H

VIA1_SR                           = VIA1_BASE + $0a; Shift Register

VIA1_ACR                          = VIA1_BASE + $0b; Auxiliary Control Register
 PA_LATCHING_ENABLE               = %00000001
 PA_LATCHING_ENABLED              = PA_LATCHING_ENABLE
 PA_LATCHING_DISABLE              = %00000000
 PA_LATCHING_DISABLED             = PA_LATCHING_DISABLE
 PB_LATCHING_ENABLE               = %00000010
 PB_LATCHING_ENABLED              = PB_LATCHING_ENABLE
 PB_LATCHING_DISABLE              = %00000000
 PB_LATCHING_DISABLED             = PB_LATCHING_DISABLE
 SHIFT_REG_CONTROL                = %00011100
 SHIFT_DISABLE                    = %00000000
 SHIFT_DISABLED                   = SHIFT_DISABLE
 SHIFT_IN_T2                      = %00000100
 SHIFT_IN_02                      = %00001000
 SHIFT_IN_EXTCLK                  = %00001100
 SHIFT_OUT_FREERUN_T2             = %00010000
 SHIFT_OUT_T2                     = %00010100
 SHIFT_OUT_02                     = %00011000
 SHIFT_OUT_EXTCLK                 = %00011100
 SHIFT_REG_CONTROL_SHIFT          = 2
 SHIFT_REG_CONTROL_MASK           = SHIFT_REG_CONTROL
 T2_CONTROL                       = %00100000
 T2_TIMED_INTERRUPT               = %00000000
 T2_COUNTDOWN_PULSE_PB6           = T2_CONTROL
 T1_CONTROL                       = %11000000
 T1_ONE_SHOT                      = %00000000
 T1_FREE_RUNNING                  = %01000000
 T1_ONE_SHOT_PB7_OUT              = %10000000
 T1_FREE_RUNNING_INVERT_PB7_OUT   = %11000000
 T1_CONTROL_SHIFT                 = 6
 T1_CONTROL_MASK                  = T1_CONTROL

VIA1_PCR                          = VIA1_BASE + $0c; Peripheral Control Register
 CA1_INTERRUPT_CONTROL            = %00000001
 CA1_IRQ_ON_POS_ACTIVE_EDGE       = CA1_INTERRUPT_CONTROL
 CA1_IRQ_ON_NEG_ACTIVE_EDGE       = %00000000
 ATN_IN_IRQ_ON_POS_ACTIVE_EDGE    = CA1_IRQ_ON_POS_ACTIVE_EDGE
 ATN_IN_IRQ_ON_NEG_ACTIVE_EDGE    = CA1_IRQ_ON_NEG_ACTIVE_EDGE
 CA2_INTERRUPT_CONTROL            = %00001110
 CA2_INPUT_IRQ_NEG_ACT_EDGE       = %00000000
 CA2_INPUT_IND_IRQ_NEG_EDGE       = %00000010
 CA2_INPUT_IRQ_POS_ACT_EDGE       = %00000100
 CA2_INPUT_IND_IRQ_POS_EDGE       = %00000110
 CA2_OUTPUT_HANDSHAKE             = %00001000
 CA2_OUTPUT_PULSE                 = %00001010
 CA2_OUTPUT_LOW                   = %00001100
 CA2_OUTPUT_HIGH                  = %00001110
 CA2_INTERRUPT_CONTROL_SHIFT      = 1
 CA2_INTERRUPT_CONTROL_MASK       = CB2_INTERRUPT_CONTROL
 CB1_INTERRUPT_CONTROL            = %00010000
 CB1_IRQ_ON_POS_ACTIVE_EDGE       = CB1_INTERRUPT_CONTROL
 CB1_IRQ_ON_NEG_ACTIVE_EDGE       = %00000000
 CB2_INTERRUPT_CONTROL            = %11100000
 CB2_INPUT_IRQ_NEG_ACT_EDGE       = %00000000
 CB2_INPUT_IND_IRQ_NEG_EDGE       = %00100000
 CB2_INPUT_IRQ_POS_ACT_EDGE       = %01000000
 CB2_INPUT_IND_IRQ_POS_EDGE       = %01100000
 CB2_OUTPUT_HANDSHAKE             = %10000000
 CB2_OUTPUT_PULSE                 = %10100000
 CB2_OUTPUT_LOW                   = %11000000
 CB2_OUTPUT_HIGH                  = %11100000
 CB2_INTERRUPT_CONTROL_SHIFT      = 5
 CB2_INTERRUPT_CONTROL_MASK       = CB2_INTERRUPT_CONTROL

VIA1_IFR                          = VIA1_BASE + $0d; Interrupt Flag Register
 IRQ_CA2_ACTIVE_EDGE              = %00000001
 IRQ_CA1_ACTIVE_EDGE              = %00000010
 IRQ_ATN_ASSERTED                 = IRQ_CA1_ACTIVE_EDGE
 IRQ_SHIFT_REG                    = %00000100
 IRQ_CB2_ACTIVE_EDGE              = %00001000
 IRQ_CB1_ACTIVE_EDGE              = %00010000
 IRQ_TIMER_2                      = %00100000
 IRQ_TIMER_1                      = %01000000
 IRQS_PENDING                     = %10000000

VIA1_IER                          = VIA1_BASE + $0e; Interrupt Enable Register
;IRQ_CA2_ACTIVE_EDGE              = %00000001
;IRQ_CA1_ACTIVE_EDGE              = %00000010
;IRQ_SHIFT_REG                    = %00000100
;IRQ_CB2_ACTIVE_EDGE              = %00001000
;IRQ_CB1_ACTIVE_EDGE              = %00010000
;IRQ_TIMER_2                      = %00100000
;IRQ_TIMER_1                      = %01000000
 IRQ_ALL_FLAGS                    = %01111111
 IRQ_SET_FLAGS                    = %10000000
 IRQ_CLEAR_FLAGS                  = %00000000

VIA1_PRA_NO_HANDSHAKE             = VIA1_BASE + $0f; Port register A without Handshake
VIA1_ORA_NO_HANDSHAKE             = VIA1_PRA_NO_HANDSHAKE; Output Register A without Handshake
VIA1_IRA_NO_HANDSHAKE             = VIA1_PRA_NO_HANDSHAKE; Input Register A without Handshake


.ifdef CX500
VIA2_BASE                         = $5c00
.else
VIA2_BASE                         = $1c00
.endif

VIA2_PRB                          = VIA2_BASE + $00; Port register B
VIA2_ORB                          = VIA2_PRB; Output Register B
VIA2_IRB                          = VIA2_PRB; Input Register B
 TRACK_STEP                       = VIA_PIO0 | VIA_PIO1
 TRACK_STEP_SHIFT                 = 0
 TRACK_STEP_MASK                  = TRACK_STEP
 MOTOR                            = VIA_PIO2
 BUSY_LED                         = VIA_PIO3
 WRITE_PROTECT                    = VIA_PIO4
 BITRATE                          = VIA_PIO5 | VIA_PIO6
 BITRATE_SHIFT                    = 5
 BITRATE_MASK                     = BITRATE
 SYNC_MARK                        = VIA_PIO7

VIA2_PRA                          = VIA2_BASE + $01; Port register A
VIA2_ORA                          = VIA2_PRA; Output Register A
VIA2_IRA                          = VIA2_PRA; Input Register A

VIA2_DDRB                         = VIA2_BASE + $02; Data direction register B
;VIA_PIO0_OUTPUT                  = VIA_PIO0
;VIA_PIO0_INPUT                   = %00000000
;VIA_PIO1_OUTPUT                  = VIA_PIO1
;VIA_PIO1_INPUT                   = %00000000
 VIA_TRACK_STEP_OUTPUT            = VIA_PIO0 | VIA_PIO1
 VIA_TRACK_STEP_INPUT             = %00000000
;VIA_PIO2_OUTPUT                  = VIA_PIO2
;VIA_PIO2_INPUT                   = %00000000
 VIA_MOTOR_OUTPUT                 = VIA_PIO2
 VIA_MOTOR_INPUT                  = %00000000
;VIA_PIO3_OUTPUT                  = VIA_PIO3
;VIA_PIO3_INPUT                   = %00000000
 VIA_BUSY_LED_OUTPUT              = VIA_PIO3
 VIA_BUSY_LED_INPUT               = %00000000
;VIA_PIO4_OUTPUT                  = VIA_PIO4
;VIA_PIO4_INPUT                   = %00000000
 VIA_WRITE_PROTECT_OUTPUT         = VIA_PIO4
 VIA_WRITE_PROTECT_INPUT          = %00000000
;VIA_PIO5_OUTPUT                  = VIA_PIO5
;VIA_PIO5_INPUT                   = %00000000
;VIA_PIO6_OUTPUT                  = VIA_PIO6
;VIA_PIO6_INPUT                   = %00000000
 VIA_BITRATE_OUTPUT               = VIA_PIO5 | VIA_PIO6
 VIA_BITRATE_INPUT                = %00000000
;VIA_PIO7_OUTPUT                  = VIA_PIO7
;VIA_PIO7_INPUT                   = %00000000
 VIA_SYNC_MARK_OUTPUT             = VIA_PIO7
 VIA_SYNC_MARK_INPUT              = %00000000

VIA2_DDRA                         = VIA2_BASE + $03; Data direction register A

VIA2_T1C_L                        = VIA2_BASE + $04; Timer 1 Lo
VIA2_T1_LO                        = VIA2_T1C_L

VIA2_T1C_H                        = VIA2_BASE + $05; Timer 1 Hi
VIA2_T1_HI                        = VIA2_T1C_H

VIA2_T1L_L                        = VIA2_BASE + $06; Timer 1 Latch Lo
VIA2_T1_LATCH_LO                  = VIA2_T1L_L

VIA2_T1L_H                        = VIA2_BASE + $07; Timer 1 Latch Hi
VIA2_T1_LATCH_HI                  = VIA2_T1L_H

VIA2_T2C_L                        = VIA2_BASE + $08; Timer 2 Lo
VIA2_T2_LO                        = VIA2_T2C_L

VIA2_T2C_H                        = VIA2_BASE + $09; Timer 2 Hi
VIA2_T2_HI                        = VIA2_T2C_H

VIA2_SR                           = VIA2_BASE + $0a; Shift Register

VIA2_ACR                          = VIA2_BASE + $0b; Auxiliary Control Register
;PA_LATCHING_ENABLE               = %00000001
;PA_LATCHING_ENABLED              = PA_LATCHING_ENABLE
;PA_LATCHING_DISABLED             = %00000000
;PB_LATCHING_ENABLE               = %00000010
;PB_LATCHING_ENABLED              = PB_LATCHING_ENABLE
;PB_LATCHING_DISABLED             = %00000000
;SHIFT_REG_CONTROL                = %00011100
;SHIFT_DISABLED                   = %00000000
;SHIFT_IN_T2                      = %00000100
;SHIFT_IN_02                      = %00001000
;SHIFT_IN_EXTCLK                  = %00001100
;SHIFT_OUT_FREERUN_T2             = %00010000
;SHIFT_OUT_T2                     = %00010100
;SHIFT_OUT_02                     = %00011000
;SHIFT_OUT_EXTCLK                 = %00011100
;SHIFT_REG_CONTROL_SHIFT          = 2
;SHIFT_REG_CONTROL_MASK           = SHIFT_REG_CONTROL
;T2_CONTROL                       = %00100000
;T2_TIMED_INTERRUPT               = %00000000
;T2_COUNTDOWN_PULSE_PB6           = T2_CONTROL
;T1_CONTROL                       = %11000000
;T1_ONE_SHOT                      = %00000000
;T1_FREE_RUNNING                  = %01000000
;T1_ONE_SHOT_PB7_OUT              = %10000000
;T1_FREE_RUNNING_INVERT_PB7_OUT   = %11000000
;T1_CONTROL_SHIFT                 = 6
;T1_CONTROL_MASK                  = T1_CONTROL

VIA2_PCR                          = VIA2_BASE + $0c; Peripheral Control Register
;CA1_INTERRUPT_CONTROL            = %00000001
;CA1_IRQ_ON_POS_ACTIVE_EDGE       = CA1_INTERRUPT_CONTROL
;CA1_IRQ_ON_NEG_ACTIVE_EDGE       = %00000000
BYTE_READY_IRQ_ON_POS_ACTIVE_EDGE = CA1_IRQ_ON_POS_ACTIVE_EDGE
BYTE_READY_IRQ_ON_NEG_ACTIVE_EDGE = CA1_IRQ_ON_NEG_ACTIVE_EDGE
;CA2_INTERRUPT_CONTROL            = %00001110
;CA2_INPUT_IRQ_NEG_ACT_EDGE       = %00000000
;CA2_INPUT_IND_IRQ_NEG_EDGE       = %00000010
;CA2_INPUT_IRQ_POS_ACT_EDGE       = %00000100
;CA2_INPUT_IND_IRQ_POS_EDGE       = %00000110
;CA2_OUTPUT_HANDSHAKE             = %00001000
;CA2_OUTPUT_PULSE                 = %00001010
;CA2_OUTPUT_LOW                   = %00001100
;CA2_OUTPUT_HIGH                  = %00001110
BYTE_SYNC_DISABLE                 = CA2_OUTPUT_LOW
BYTE_SYNC_DISABLED                = BYTE_SYNC_DISABLE
BYTE_SYNC_ENABLE                  = CA2_OUTPUT_HIGH
BYTE_SYNC_ENABLED                 = BYTE_SYNC_ENABLE
;CA2_INTERRUPT_CONTROL_SHIFT      = 1
;CA2_INTERRUPT_CONTROL_MASK       = CB2_INTERRUPT_CONTROL
;CB1_INTERRUPT_CONTROL            = %00010000
;CB1_IRQ_ON_POS_ACTIVE_EDGE       = CB1_INTERRUPT_CONTROL
;CB1_IRQ_ON_NEG_ACTIVE_EDGE       = %00000000
;CB2_INTERRUPT_CONTROL            = %11100000
;CB2_INPUT_IRQ_NEG_ACT_EDGE       = %00000000
;CB2_INPUT_IND_IRQ_NEG_EDGE       = %00100000
;CB2_INPUT_IRQ_POS_ACT_EDGE       = %01000000
;CB2_INPUT_IND_IRQ_POS_EDGE       = %01100000
;CB2_OUTPUT_HANDSHAKE             = %10000000
;CB2_OUTPUT_PULSE                 = %10100000
;CB2_OUTPUT_LOW                   = %11000000
;CB2_OUTPUT_HIGH                  = %11100000
WRITE_MODE                        = CB2_OUTPUT_LOW
READ_MODE                         = CB2_OUTPUT_HIGH
;CB2_INTERRUPT_CONTROL_SHIFT      = 5
;CB2_INTERRUPT_CONTROL_MASK       = CB2_INTERRUPT_CONTROL

VIA2_IFR                          = VIA2_BASE + $0d; Interrupt Flag Register
;IRQ_CA2_ACTIVE_EDGE              = %00000001
;IRQ_CA1_ACTIVE_EDGE              = %00000010
;IRQ_SHIFT_REG                    = %00000100
;IRQ_CB2_ACTIVE_EDGE              = %00001000
;IRQ_CB1_ACTIVE_EDGE              = %00010000
;IRQ_TIMER_2                      = %00100000
;IRQ_TIMER_1                      = %01000000
;IRQS_PENDING                     = %10000000

VIA2_IER                          = VIA2_BASE + $0e; Interrupt Enable Register
;IRQ_CA2_ACTIVE_EDGE              = %00000001
;IRQ_CA1_ACTIVE_EDGE              = %00000010
;IRQ_SHIFT_REG                    = %00000100
;IRQ_CB2_ACTIVE_EDGE              = %00001000
;IRQ_CB1_ACTIVE_EDGE              = %00010000
;IRQ_TIMER_2                      = %00100000
;IRQ_TIMER_1                      = %01000000
;IRQ_ALL_FLAGS                    = %01111111
;IRQ_SET_FLAGS                    = %10000000
;IRQ_CLEAR_FLAGS                  = %00000000

VIA2_PRA_NO_HANDSHAKE             = VIA2_BASE + $0f; Port register A without Handshake
VIA2_ORA_NO_HANDSHAKE             = VIA2_PRA_NO_HANDSHAKE; Output Register A without Handshake
VIA2_IRA_NO_HANDSHAKE             = VIA2_PRA_NO_HANDSHAKE; Input Register A without Handshake


; the VIA in the CMD FD

VIA_BASE                          = $4000

VIA_PRA                           = VIA_BASE + $01; Port register A

VIA_T1C_L                         = VIA_BASE + $04; Timer 1 Lo
VIA_T1C_H                         = VIA_BASE + $05; Timer 1 Hi

VIA_T2C_H                         = VIA_BASE + $09; Timer 2 Hi
VIA_SR                            = VIA_BASE + $0a; Shift Register
VIA_ACR                           = VIA_BASE + $0b; Auxiliary Control Register

VIA_IER                           = VIA_BASE + $0e; Interrupt Enable Register

.endif; !_VIA_INC_
