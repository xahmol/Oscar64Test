; MOS7360/8360

.ifndef _TED_INC_
_TED_INC_ = 1


CYCLES_PER_LINE_PAL          = 57; single clock
CYCLES_PER_LINE_NTSC         = 57; single clock

DISPLAY_LINES_PAL            = 312
DISPLAY_LINES_NTSC           = 262

VSYNC_LINE_PAL               = 257
VSYNC_LINE_NTSC              = 229

SCREEN_COLUMNS               = 40
SCREEN_ROWS                  = 25
SCREEN_SIZE                  = SCREEN_COLUMNS * SCREEN_ROWS

BITMAP_BACKGROUND            = 0
BITMAP_SIZE                  = SCREEN_SIZE * 8
.define MAKE_HIRES_COLOURS(one_bits, zero_bits) (((zero_bits) << 4) | ((one_bits) & $0f))
.define MAKE_HIRES_INTENSITIES(one_bits, zero_bits) (((one_bits) & $f0) | ((zero_bits) >> 4))


.if PLATFORM = 16 ; cia.inc defines C-64 and 1581 symbols, so it might be included along with, e.g., ted.inc
; keyboard matrix positions
STOP_COLUMN                  = %01111111
STOP_ROW                     = %01111111
LEFT_SHIFT_COLUMN            = %11111101
LEFT_SHIFT_ROW               = %01111111
ALL_COLUMNS                  = %00000000
NO_ROWS                      = %11111111
.endif


TED_ROM_BANK_BASE            = $fdd0
TED_ROM_BANK_0               = TED_ROM_BANK_BASE + 0
TED_ROM_BANK_1               = TED_ROM_BANK_BASE + 1
TED_ROM_BANK_2               = TED_ROM_BANK_BASE + 2
TED_ROM_BANK_3               = TED_ROM_BANK_BASE + 3
TED_ROM_BANK_4               = TED_ROM_BANK_BASE + 4
TED_ROM_BANK_5               = TED_ROM_BANK_BASE + 5
TED_ROM_BANK_6               = TED_ROM_BANK_BASE + 6
TED_ROM_BANK_7               = TED_ROM_BANK_BASE + 7
TED_ROM_BANK_8               = TED_ROM_BANK_BASE + 8
TED_ROM_BANK_9               = TED_ROM_BANK_BASE + 9
TED_ROM_BANK_10              = TED_ROM_BANK_BASE + 10
TED_ROM_BANK_11              = TED_ROM_BANK_BASE + 11
TED_ROM_BANK_12              = TED_ROM_BANK_BASE + 12
TED_ROM_BANK_13              = TED_ROM_BANK_BASE + 13
TED_ROM_BANK_14              = TED_ROM_BANK_BASE + 14
TED_ROM_BANK_15              = TED_ROM_BANK_BASE + 15


TED_BASE                     = $ff00

CHARSET_ADDR_UPPERGRAPHIC    = $d000
CHARSET_ADDR_UPPERLOWER      = $d400

ROM_CHARSET_UPGFX            = CHARSET_ADDR_UPPERGRAPHIC
ROM_CHARSET_UPLOW            = CHARSET_ADDR_UPPERLOWER

COLOUR_BLACK                 = $00
COLOUR_WHITE                 = $01
COLOUR_RED                   = $02
COLOUR_CYAN                  = $03
COLOUR_VIOLET                = $04
COLOUR_PURPLE                = COLOUR_VIOLET
COLOUR_LILAC                 = COLOUR_VIOLET
COLOUR_GREEN                 = $05
COLOUR_BLUE                  = $06
COLOUR_YELLOW                = $07
COLOUR_ORANGE                = $08
COLOUR_BROWN                 = $09
COLOUR_LIGHTRED              = $0a

INTENSITY_0                  = $00
INTENSITY_1                  = $10
INTENSITY_2                  = $20
INTENSITY_3                  = $30
INTENSITY_4                  = $40
INTENSITY_5                  = $50
INTENSITY_6                  = $60
INTENSITY_7                  = $70
BLINK                        = $80

COLOUR_DARKGREY              = COLOUR_WHITE | INTENSITY_3
COLOUR_MEDIUMGREY            = COLOUR_WHITE | INTENSITY_4


TED_COUNTER1_LO              = TED_BASE + $00
TED_COUNTER1_HI              = TED_BASE + $01

TED_COUNTER2_LO              = TED_BASE + $02
TED_COUNTER2_HI              = TED_BASE + $03

TED_COUNTER3_LO              = TED_BASE + $04
TED_COUNTER3_HI              = TED_BASE + $05

TED_CTRL1                    = TED_BASE + $06; Control register 1
 SCROLLY_0                   = %00000000
 SCROLLY_1                   = %00000001
 SCROLLY_2                   = %00000010
 SCROLLY_3                   = %00000011
 SCROLLY_4                   = %00000100
 SCROLLY_5                   = %00000101
 SCROLLY_6                   = %00000110
 SCROLLY_7                   = %00000111
 SCROLLY_MASK                = %00000111
 LINES_24                    = %00000000
 LINES_25                    = %00001000
 DISPLAY_ENABLE              = %00010000
 DISPLAY_DISABLE             = %00000000
 TEXT_MODE                   = %00000000
 BITMAP_MODE                 = %00100000
 EBCM_MODE                   = %01000000
 INVALID_MODE                = %01100000

TED_CTRL2                    = TED_BASE + $07; Control register 2
 SCROLLX_0                   = %00000000
 SCROLLX_1                   = %00000001
 SCROLLX_2                   = %00000010
 SCROLLX_3                   = %00000011
 SCROLLX_4                   = %00000100
 SCROLLX_5                   = %00000101
 SCROLLX_6                   = %00000110
 SCROLLX_7                   = %00000111
 SCROLLX_MASK                = %00000111
 COLUMNS_38                  = %00000000
 COLUMNS_40                  = %00001000
 SINGLECOLOUR_MODE           = %00000000
 MULTICOLOUR_MODE            = %00010000
 FREEZE                      = %00100000
 PAL_NTSC_MASK               = %01000000
 NTSC                        = PAL_NTSC_MASK
 PAL                         = %00000000

TED_KEYBOARD_LATCH           = TED_BASE + $08

TED_IRR                      = TED_BASE + $09
 RASTER_IRQ                  = %00000010
 LIGHTPEN_IRQ                = %00000100
 COUNTER_1_IRQ               = %00001000
 COUNTER_2_IRQ               = %00010000
 COUNTER_3_IRQ               = %01000000

TED_IMR                      = TED_BASE + $0a
 IRQ_RASTERLINE_MSB          = %00000001
;RASTER_IRQ                  = %00000010
;LIGHTPEN_IRQ                = %00000100
;COUNTER_1_IRQ               = %00001000
;COUNTER_2_IRQ               = %00010000
;COUNTER_3_IRQ               = %01000000

TED_IRQ_RASTERLINE           = TED_BASE + $0b

TED_CURSOR_HI                = TED_BASE + $0c
TED_CURSOR_LO                = TED_BASE + $0d

TED_BITMAP_ADDR              = TED_BASE + $12
 CHARSET_BITMAP_IN_ROM_MASK  = %00000100
 CHARSET_BITMAP_IN_ROM       = CHARSET_BITMAP_IN_ROM_MASK
 CHARSET_BITMAP_IN_RAM       = %00000000
 BITMAP_ADDR_MASK            = %00111000
 BITMAP_ADDR_SHIFT           = 3
 BITMAP_ADDR_RSHIFT          = 10
 .define MAKE_BITMAP_ADDR(address) .lobyte(.lobyte((address) >> BITMAP_ADDR_RSHIFT) & BITMAP_ADDR_MASK)

TED_CHARGEN_ADDR             = TED_BASE + $13
 ROM_IS_ENABLED              = %00000001
 FORCE_SINGLE_CLOCK          = %00000010
 ALLOW_DOUBLE_CLOCK          = %00000000
 CHARGEN_ADDR_MASK           = %11111100
 CHARGEN_ADDR_RSHIFT         = 8
 .define MAKE_CHARGEN_ADDR(address) .lobyte(.lobyte((address) >> CHARGEN_ADDR_RSHIFT) & CHARGEN_ADDR_MASK)

TED_SCREEN_ADDR              = TED_BASE + $14
 SCREEN_ADDR_MASK            = %11111000
 SCREEN_ADDR_SHIFT           = 3
 SCREEN_ADDR_RSHIFT          = 8
 .define MAKE_SCREEN_ADDR(address) .lobyte(((address) >> SCREEN_ADDR_RSHIFT) & SCREEN_ADDR_MASK)

TED_BGCOLOUR                 = TED_BASE + $15; Background colour
BGCOLOUR                     = TED_BGCOLOUR
TED_BGCOLOUR0                = TED_BGCOLOUR; Background colour 0
TED_BGCOLOUR1                = TED_BASE + $16; Background colour 1
TED_MULTICOLOUR0             = TED_BGCOLOUR1; Multicolour 1
TED_BGCOLOUR2                = TED_BASE + $17; Background colour 2
TED_MULTICOLOUR1             = TED_BGCOLOUR2; Multicolour 2
TED_BGCOLOUR3                = TED_BASE + $18; Background colour 3

TED_BORDERCOLOUR             = TED_BASE + $19; Overscan colour
BORDERCOLOUR                 = TED_BORDERCOLOUR

TED_RASTERLINE_MSB           = TED_BASE + $1c
 TED_RASTERLINE_MSB_MASK     = %00000001

TED_RASTERLINE               = TED_BASE + $1d
 RASTERLINE                  = TED_RASTERLINE
TED_RASTERCOLUMN             = TED_BASE + $1e

TED_VERTSUBCOUNT             = TED_BASE + $1f
 VERTSUBCOUNT_MASK           = %00000111
 VERTSUBCOUNT_0              = %00000000
 VERTSUBCOUNT_1              = %00000001
 VERTSUBCOUNT_2              = %00000010
 VERTSUBCOUNT_3              = %00000011
 VERTSUBCOUNT_4              = %00000100
 VERTSUBCOUNT_5              = %00000101
 VERTSUBCOUNT_6              = %00000110
 VERTSUBCOUNT_7              = %00000111

TED_ROM_ENABLE               = TED_BASE + $3e; the RAM/ROM state also determines where TED fetches screen chars,
TED_RAM_ENABLE               = TED_BASE + $3f; but not bitmap data (always RAM) and chargen (register $12, bit 2)


.macro WAIT_VBL
    .scope
            .local loop
            .local pal
            .local done

loop:       lda TED_RASTERLINE
            ldx TED_RASTERLINE_MSB
            cmp TED_RASTERLINE
            bne loop
            bit TED_CTRL2
            bvc pal
            cmp #.lobyte(VSYNC_LINE_NTSC)
            bne loop
            txa
            and #%00000001
            cmp #.hibyte(VSYNC_LINE_NTSC)
            bne loop
            beq done
pal:        cmp #.lobyte(VSYNC_LINE_PAL)
            bne loop
            txa
            and #%00000001
            cmp #.hibyte(VSYNC_LINE_PAL)
            bne loop
done:
    .endscope
.endmacro

.macro DISPLAY_HIRES_BITMAP bitmap, screen
            WAIT_VBL
            lda #BITMAP_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_3
            sta TED_CTRL1
            lda TED_BITMAP_ADDR
            and #.lobyte(~(BITMAP_ADDR_MASK | CHARSET_BITMAP_IN_ROM))
            ora #MAKE_BITMAP_ADDR(bitmap)
            sta TED_BITMAP_ADDR
            lda TED_SCREEN_ADDR
            and #.lobyte(~SCREEN_ADDR_MASK)
            ora #MAKE_SCREEN_ADDR(screen)
            sta TED_SCREEN_ADDR
.endmacro

; requires forced slow clock
.macro STABILIZE_RASTER
            .local delay
            .local delays

            lda TED_RASTERCOLUMN
            lsr
            lsr
            and #%00000111
            sta delay
delay = * + $01
            bpl delays
delays:     lda #OPC_LDA_IMM
            lda #OPC_LDA_IMM
            lda #OPC_LDA_IMM
            lda OPC_NOP
.endmacro

.endif; !_TED_INC_
