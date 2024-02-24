; MOS6526

.ifndef _VIA_INC_
.ifndef _CIA_INC_
_CIA_INC_ = 1


.if (::PLATFORM = 64) | (::PLATFORM = 128) ; cia.inc defines C-64 and 1581 symbols, so it might be included along with, e.g., ted.inc
; C-64 keyboard matrix positions
STOP_COLUMN                       = %01111111
STOP_ROW                          = %01111111
LEFT_SHIFT_COLUMN                 = %11111101
LEFT_SHIFT_ROW                    = %01111111
ALL_COLUMNS                       = %00000000
NO_ROWS                           = %11111111
.endif


; the two CIAs in the C-64

CIA1_BASE                         = $dc00

CIA_PIO0                          = %00000001
CIA_PIO1                          = %00000010
CIA_PIO2                          = %00000100
CIA_PIO3                          = %00001000
CIA_PIO4                          = %00010000
CIA_PIO5                          = %00100000
CIA_PIO6                          = %01000000
CIA_PIO7                          = %10000000

CIA1_PRA                          = CIA1_BASE + $00; Port register A
 KBD_COLUMN0                      = ~CIA_PIO0
 KBD_COLUMN1                      = ~CIA_PIO1
 KBD_COLUMN2                      = ~CIA_PIO2
 KBD_COLUMN3                      = ~CIA_PIO3
 KBD_COLUMN4                      = ~CIA_PIO4
 KBD_COLUMN5                      = ~CIA_PIO4
 KBD_COLUMN6                      = ~CIA_PIO5
 KBD_COLUMN7                      = ~CIA_PIO5

 JOY2_UP                          = ~CIA_PIO0
 JOY2_DOWN                        = ~CIA_PIO1
 JOY2_LEFT                        = ~CIA_PIO2
 JOY2_RIGHT                       = ~CIA_PIO3
 JOY2_FIRE                        = ~CIA_PIO4

 PADDLE_ENPORT1                   = CIA_PIO6
 PADDLE_ENPORT2                   = CIA_PIO7
 PADDLE_EN_MASK                   = CIA_PIO5 | CIA_PIO4 | CIA_PIO3 | CIA_PIO2 | CIA_PIO1 | CIA_PIO0

CIA1_PRB                          = CIA1_BASE + $01; Port register B
 KBD_ROW0                         = ~CIA_PIO0
 KBD_ROW1                         = ~CIA_PIO1
 KBD_ROW2                         = ~CIA_PIO2
 KBD_ROW3                         = ~CIA_PIO3
 KBD_ROW4                         = ~CIA_PIO4
 KBD_ROW5                         = ~CIA_PIO5
 KBD_ROW6                         = ~CIA_PIO6
 KBD_ROW7                         = ~CIA_PIO7

 JOY1_UP                          = ~CIA_PIO0
 JOY1_DOWN                        = ~CIA_PIO1
 JOY1_LEFT                        = ~CIA_PIO2
 JOY1_RIGHT                       = ~CIA_PIO3
 JOY1_FIRE                        = ~CIA_PIO4

CIA1_DDRA                         = CIA1_BASE + $02; Data direction register A
 CIA_PIO0_OUTPUT                  = CIA_PIO0
 CIA_PIO0_INPUT                   = %00000000
 CIA_PIO1_OUTPUT                  = CIA_PIO1
 CIA_PIO1_INPUT                   = %00000000
 CIA_PIO2_OUTPUT                  = CIA_PIO2
 CIA_PIO2_INPUT                   = %00000000
 CIA_PIO3_OUTPUT                  = CIA_PIO3
 CIA_PIO3_INPUT                   = %00000000
 CIA_PIO4_OUTPUT                  = CIA_PIO4
 CIA_PIO4_INPUT                   = %00000000
 CIA_PIO5_OUTPUT                  = CIA_PIO5
 CIA_PIO5_INPUT                   = %00000000
 CIA_PIO6_OUTPUT                  = CIA_PIO6
 CIA_PIO6_INPUT                   = %00000000
 CIA_PIO7_OUTPUT                  = CIA_PIO7
 CIA_PIO7_INPUT                   = %00000000

CIA1_DDRB                         = CIA1_BASE + $03; Data direction register B

CIA1_TA_LO                        = CIA1_BASE + $04; Timer A, low byte
CIA1_TA_HI                        = CIA1_BASE + $05; Timer A, high byte
CIA1_TB_LO                        = CIA1_BASE + $06; Timer B, low byte
CIA1_TB_HI                        = CIA1_BASE + $07; Timer B, high byte

 CIA1_TOD_10S                     = CIA1_BASE + $08; Time of day, 1/10 seconds
 CIA1_TOD_SEC                     = CIA1_BASE + $09; Time of day, seconds
 CIA1_TOD_MIN                     = CIA1_BASE + $0a; Time of day, minutes
 CIA1_TOD_HRS                     = CIA1_BASE + $0b; Time of day, hours
 TOD_AMPM                         = %10000000
 TOD_AM                           = %00000000
 TOD_PM                           = %10000000
 TOD_HRS_MASK                     = %00011111

CIA1_SDR                          = CIA1_BASE + $0c; Serial data register

CIA1_ICR                          = CIA1_BASE + $0d; Interrupt control register
 TIMERA_IRQ                       = %00000001
 TIMERB_IRQ                       = %00000010
 TOD_IRQ                          = %00000100
 SERIAL_IRQ                       = %00001000
 FLAG1_IRQ                        = %00010000
 EVERY_IRQ                        = %01111111
 CIA_INTERRUPT                    = %10000000
 CIA_CLR_INTF                     = %00000000
 CIA_SET_INTF                     = %10000000

CIA1_CRA                          = CIA1_BASE + $0e; Control Register A
 TIMER_STOP                       = %00000000
 TIMER_START                      = %00000001
 OUTPUT_TO_PB6                    = %00000010
 OUTPUT_PULSE                     = %00000000
 OUTPUT_TOGGLE                    = %00000100
 CONTINUOUS                       = %00000000
 ONE_SHOT                         = %00001000
 FORCE_LOAD                       = %00010000
 COUNT_PHI2                       = %00000000
 COUNT_CNT                        = %00100000
 IOMODE_INPUT                     = %00000000
 IOMODE_OUTPUT                    = %01000000
 TOD_FREQ_60HZ                    = %00000000
 TOD_FREQ_50HZ                    = %10000000
 TOD_FREQ_MASK                    = TOD_FREQ_50HZ

CIA1_CRB                          = CIA1_BASE + $0f; Control Register B
;TIMER_STOP                       = %00000000
;TIMER_START                      = %00000001
 OUTPUT_TO_PB7                    = %00000010
;OUTPUT_PULSE                     = %00000000
;OUTPUT_TOGGLE                    = %00000100
;CONTINUOUS                       = %00000000
;ONE_SHOT                         = %00001000
;FORCE_LOAD                       = %00010000
;COUNT_PHI2                       = %00000000
 COUNT_CNT_POS                    = %00100000
 COUNT_TA_UNDF                    = %01000000
 COUNT_TA_UFCN                    = %01100000
 COUNT_CRB_MASK                   = COUNT_TA_UFCN
 TOD_SET_CLOCK                    = %00000000
 TOD_SET_ALARM                    = %10000000


CIA2_BASE                         = $dd00

;CIA_PIO0                         = %00000001
;CIA_PIO1                         = %00000010
;CIA_PIO2                         = %00000100
;CIA_PIO3                         = %00001000
;CIA_PIO4                         = %00010000
;CIA_PIO5                         = %00100000
;CIA_PIO6                         = %01000000
;CIA_PIO7                         = %10000000

CIA2_PRA                          = CIA2_BASE + $00; Port register A
 VIC2_BANK                        = %00000011
 VIC2_BANK0                       = %00000000
 VIC2_BANK1                       = CIA_PIO0
 VIC2_BANK2                       = CIA_PIO1
 VIC2_BANK3                       = CIA_PIO1 | CIA_PIO0
 VIC2_BANK_SHIFT                  = 0
 VIC2_BANK_MASK                   = VIC2_BANK
  .define VIC2_MAKE_BANK(address) .lobyte(((address & $c000) >> 14) ^ 3)
 RS232_TXD                        = CIA_PIO2
 SERIAL_ATN_OUT                   = CIA_PIO3
 SERIAL_CLK_OUT                   = CIA_PIO4
 SERIAL_DATA_OUT                  = CIA_PIO5
 SERIAL_CLK_IN                    = CIA_PIO6
 SERIAL_DATA_IN                   = CIA_PIO7

CIA2_PRB                          = CIA2_BASE + $01; Port register B
 RS232_RXD                        = CIA_PIO0
 RS232_RTS                        = CIA_PIO1
 RS232_DTR                        = CIA_PIO2
 RS232_RING                       = CIA_PIO3
 RS232_CARRIER                    = CIA_PIO4
 USERPORT_PB5                     = CIA_PIO5
 RS232_CTS                        = CIA_PIO6
 RS232_DSR                        = CIA_PIO7

CIA2_DDRA                         = CIA2_BASE + $02; Data direction register A
;CIA_PIO0_OUTPUT                  = CIA_PIO0
;CIA_PIO0_INPUT                   = %00000000
;CIA_PIO1_OUTPUT                  = CIA_PIO1
;CIA_PIO1_INPUT                   = %00000000
 CIA_VIC2_BANK_OUTPUT             = CIA_PIO0 | CIA_PIO1
 CIA_VIC2_BANK_INPUT              = %00000000
;CIA_PIO2_OUTPUT                  = CIA_PIO2
;CIA_PIO2_INPUT                   = %00000000
 CIA_RS232_TXD_OUTPUT             = CIA_PIO2
 CIA_RS232_TXD_INPUT              = %00000000
;CIA_PIO3_OUTPUT                  = CIA_PIO3
;CIA_PIO3_INPUT                   = %00000000
 CIA_SERIAL_ATN_OUT_OUTPUT        = CIA_PIO3
 CIA_SERIAL_ATN_OUT_INPUT         = %00000000
;CIA_PIO4_OUTPUT                  = CIA_PIO4
;CIA_PIO4_INPUT                   = %00000000
 CIA_SERIAL_CLK_OUT_OUTPUT        = CIA_PIO4
 CIA_SERIAL_CLK_OUT_INPUT         = %00000000
;CIA_PIO5_OUTPUT                  = CIA_PIO5
;CIA_PIO5_INPUT                   = %00000000
 CIA_SERIAL_DATA_OUT_OUTPUT       = CIA_PIO5
 CIA_SERIAL_DATA_OUT_INPUT        = %00000000
;CIA_PIO6_OUTPUT                  = CIA_PIO6
;CIA_PIO6_INPUT                   = %00000000
 CIA_SERIAL_CLK_IN_OUTPUT         = CIA_PIO6
 CIA_SERIAL_CLK_IN_INPUT          = %00000000
;CIA_PIO7_OUTPUT                  = CIA_PIO7
;CIA_PIO7_INPUT                   = %00000000
 CIA_SERIAL_DATA_IN_OUTPUT        = CIA_PIO7
 CIA_SERIAL_DATA_IN_INPUT         = %00000000


CIA2_DDRB                         = CIA2_BASE + $03; Data direction register B

CIA2_TA_LO                        = CIA2_BASE + $04; Timer A, low byte
CIA2_TA_HI                        = CIA2_BASE + $05; Timer A, high byte
CIA2_TB_LO                        = CIA2_BASE + $06; Timer B, low byte
CIA2_TB_HI                        = CIA2_BASE + $07; Timer B, high byte

CIA2_TOD_10S                      = CIA2_BASE + $08; Time of day, 1/10 seconds
CIA2_TOD_SEC                      = CIA2_BASE + $09; Time of day, seconds
CIA2_TOD_MIN                      = CIA2_BASE + $0a; Time of day, minutes
CIA2_TOD_HRS                      = CIA2_BASE + $0b; Time of day, hours
;TOD_AMPM                         = %10000000
;TOD_AM                           = %00000000
;TOD_PM                           = %10000000
;TOD_HRS_MASK                     = %00011111

CIA2_SDR                          = CIA2_BASE + $0c; Serial data register

CIA2_ICR                          = CIA2_BASE + $0d; Interrupt control register
TIMERA_NMI                        = %00000001
TIMERB_NMI                        = %00000010
TOD_NMI                           = %00000100
SERIAL_NMI                        = %00001000
FLAG1_NMI                         = %00010000
EVERY_NMI                         = %01111111
;CIA_INTERRUPT                    = %10000000
;CIA_CLR_INTF                     = %00000000
;CIA_SET_INTF                     = %10000000

CIA2_CRA                          = CIA2_BASE + $0e; Control Register A
;TIMER_STOP                       = %00000000
;TIMER_START                      = %00000001
;OUTPUT_TO_PB6                    = %00000010
;OUTPUT_PULSE                     = %00000000
;OUTPUT_TOGGLE                    = %00000100
;CONTINUOUS                       = %00000000
;ONE_SHOT                         = %00001000
;FORCE_LOAD                       = %00010000
;COUNT_PHI2                       = %00000000
;COUNT_CNT                        = %00100000
 SERIAL_INPUT                     = %00000000
 SERIAL_OUTPUT                    = %01000000
;TOD_FREQ_60HZ                    = %00000000
;TOD_FREQ_50HZ                    = %10000000

CIA2_CRB                          = CIA2_BASE + $0f; Control Register B
;TIMER_STOP                       = %00000000
;TIMER_START                      = %00000001
;OUTPUT_TO_PB7                    = %00000010
;OUTPUT_PULSE                     = %00000000
;OUTPUT_TOGGLE                    = %00000100
;CONTINUOUS                       = %00000000
;ONE_SHOT                         = %00001000
;FORCE_LOAD                       = %00010000
;COUNT_PHI2                       = %00000000
;COUNT_CNT_POS                    = %00100000
;COUNT_TA_UNDF                    = %01000000
;COUNT_TA_UFCN                    = %01100000
;COUNT_CRB_MASK                   = COUNT_TA_UFCN
;TOD_SET_CLOCK                    = %00000000
;TOD_SET_ALARM                    = %10000000


; the CIA in the 1571 (not CR) and 1581
; on 1571, only the fast serial interface is connected
; on 1571CR, only the fast serial interface is implemented (MOS5710)

CIA_BASE                          = $4000

;CIA_PIO0                         = %00000001
;CIA_PIO1                         = %00000010
;CIA_PIO2                         = %00000100
;CIA_PIO3                         = %00001000
;CIA_PIO4                         = %00010000
;CIA_PIO5                         = %00100000
;CIA_PIO6                         = %01000000
;CIA_PIO7                         = %10000000

CIA_PRA                           = CIA_BASE + $00; Port register A
 SIDE_SELECT                      = CIA_PIO0
 DISK_INSERTED                    = CIA_PIO1
  DISK_IS_INSERTED                = %00000000
  NO_DISK_IS_INSERTED             = DISK_INSERTED
 MOTOR                            = CIA_PIO2
  MOTOR_ON                        = %00000000
  MOTOR_OFF                       = MOTOR
 DEVICE_NUMBER                    = CIA_PIO3 | CIA_PIO4
 DEVICE_NUMBER_8                  = %00000000
 DEVICE_NUMBER_9                  = CIA_PIO3
 DEVICE_NUMBER_10                 = CIA_PIO4
 DEVICE_NUMBER_11                 = CIA_PIO3 | CIA_PIO4
 DEVICE_NUMBER_SHIFT              = 3
 DEVICE_NUMBER_MASK               = DEVICE_NUMBER
 POWER_LED                        = CIA_PIO5
 DRIVE_LED                        = CIA_PIO6
 DISK_CHANGE                      = CIA_PIO7
  DISK_CHANGED                    = %00000000
  NO_DISK_CHANGED                 = DISK_CHANGE

CIA_PRB                           = CIA_BASE + $01; Port register B
 DATA_IN                          = CIA_PIO0
 DATA_OUT                         = CIA_PIO1
 CLK_IN                           = CIA_PIO2
 CLK_OUT                          = CIA_PIO3
 ATNA_ENABLE_OUT                  = CIA_PIO4
 FSM_BUS_DRIVER_DIRECTION         = CIA_PIO5
  FSM_BUS_DRIVER_INPUT            = %00000000
  FSM_BUS_DRIVER_OUTPUT           = FSM_BUS_DRIVER_DIRECTION
 WRITE_PROTECT                    = CIA_PIO6
 ATN_IN                           = CIA_PIO7

CIA_DDRA                          = CIA_BASE + $02; Data direction register A
;CIA_PIO0_OUTPUT                  = CIA_PIO0
;CIA_PIO0_INPUT                   = %00000000
;CIA_PIO1_OUTPUT                  = CIA_PIO1
;CIA_PIO1_INPUT                   = %00000000
;CIA_PIO2_OUTPUT                  = CIA_PIO2
;CIA_PIO2_INPUT                   = %00000000
;CIA_PIO3_OUTPUT                  = CIA_PIO3
;CIA_PIO3_INPUT                   = %00000000
;CIA_PIO4_OUTPUT                  = CIA_PIO4
;CIA_PIO4_INPUT                   = %00000000
;CIA_PIO5_OUTPUT                  = CIA_PIO5
;CIA_PIO5_INPUT                   = %00000000
;CIA_PIO6_OUTPUT                  = CIA_PIO6
;CIA_PIO6_INPUT                   = %00000000
;CIA_PIO7_OUTPUT                  = CIA_PIO7
;CIA_PIO7_INPUT                   = %00000000

CIA_DDRB                          = CIA_BASE + $03; Data direction register B
 DATA_IN_OUTPUT                   = CIA_PIO0
 DATA_IN_INPUT                    = %00000000
 DATA_OUT_OUTPUT                  = CIA_PIO1
 DATA_OUT_INPUT                   = %00000000
 CLK_IN_OUTPUT                    = CIA_PIO2
 CLK_IN_INPUT                     = %00000000
 CLK_OUT_OUTPUT                   = CIA_PIO3
 CLK_OUT_INPUT                    = %00000000
 ATNA_ENABLE_OUT_OUTPUT           = CIA_PIO4
 ATNA_ENABLE_OUT_INPUT            = %00000000
 FSM_BUS_DRIVER_DIRECTION_OUTPUT  = CIA_PIO5
 FSM_BUS_DRIVER_DIRECTION_INPUT   = %00000000
 WRITE_PROTECT_OUTPUT             = CIA_PIO6
 WRITE_PROTECT_INPUT              = %00000000
 CIA_ATN_IN_OUTPUT                = CIA_PIO7
 CIA_ATN_IN_INPUT                 = %00000000

CIA_TA_LO                         = CIA_BASE + $04; Timer A, low byte
CIA_TA_HI                         = CIA_BASE + $05; Timer A, high byte
CIA_TB_LO                         = CIA_BASE + $06; Timer B, low byte
CIA_TB_HI                         = CIA_BASE + $07; Timer B, high byte

CIA_TOD_10S                       = CIA_BASE + $08; Time of day, 1/10 seconds
CIA_TOD_SEC                       = CIA_BASE + $09; Time of day, seconds
CIA_TOD_MIN                       = CIA_BASE + $0a; Time of day, minutes
CIA_TOD_HRS                       = CIA_BASE + $0b; Time of day, hours
;TOD_AMPM                         = %10000000
;TOD_AM                           = %00000000
;TOD_PM                           = %10000000
;TOD_HRS_MASK                     = %00011111

CIA_SDR                           = CIA_BASE + $0c; Serial data register

CIA_ICR                           = CIA_BASE + $0d; Interrupt control register
;TIMERA_IRQ                       = %00000001
;TIMERB_IRQ                       = %00000010
;TOD_IRQ                          = %00000100
;SERIAL_IRQ                       = %00001000
;FLAG1_IRQ                        = %00010000
;EVERY_IRQ                        = %01111111
;CIA_INTERRUPT                    = %10000000
;CIA_CLR_INTF                     = %00000000
;CIA_SET_INTF                     = %10000000

CIA_CRA                           = CIA_BASE + $0e; Control Register A
;TIMER_STOP                       = %00000000
;TIMER_START                      = %00000001
;OUTPUT_TO_PB6                    = %00000010
;OUTPUT_PULSE                     = %00000000
;OUTPUT_TOGGLE                    = %00000100
;CONTINUOUS                       = %00000000
;ONE_SHOT                         = %00001000
;FORCE_LOAD                       = %00010000
;COUNT_PHI2                       = %00000000
;COUNT_CNT                        = %00100000
;IOMODE_INPUT                     = %00000000
;IOMODE_OUTPUT                    = %01000000
;TOD_FREQ_60HZ                    = %00000000
;TOD_FREQ_50HZ                    = %10000000
;TOD_FREQ_MASK                    = TOD_FREQ_50HZ

CIA_CRB                           = CIA_BASE + $0f; Control Register B
;TIMER_STOP                       = %00000000
;TIMER_START                      = %00000001
;OUTPUT_TO_PB7                    = %00000010
;OUTPUT_PULSE                     = %00000000
;OUTPUT_TOGGLE                    = %00000100
;CONTINUOUS                       = %00000000
;ONE_SHOT                         = %00001000
;FORCE_LOAD                       = %00010000
;COUNT_PHI2                       = %00000000
;COUNT_CNT_POS                    = %00100000
;COUNT_TA_UNDF                    = %01000000
;COUNT_TA_UFCN                    = %01100000
;COUNT_CRB_MASK                   = COUNT_TA_UFCN
;TOD_SET_CLOCK                    = %00000000
;TOD_SET_ALARM                    = %10000000

.endif; !_CIA_INC_
.endif; !_VIA_INC_
