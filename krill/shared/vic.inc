; MOS6567/MOS6569

.ifndef _VIC_INC_
_VIC_INC_ = 1


.include "cia.inc"


CYCLES_PER_LINE_PAL       = 63
CYCLES_PER_LINE_NTSC      = 64

DISPLAY_LINES_PAL         = 312
DISPLAY_LINES_NTSC        = 263

VSYNC_LINE_PAL            = 0
VSYNC_LINE_NTSC           = 20

SCREEN_COLUMNS            = 40
SCREEN_ROWS               = 25
SCREEN_SIZE               = SCREEN_COLUMNS * SCREEN_ROWS

BITMAP_BACKGROUND         = 0
BITMAP_SIZE               = SCREEN_SIZE * 8
.define MAKE_HIRES_COLOURS(one_bits, zero_bits) (((zero_bits) << 4) | (one_bits))

SPRITE_WIDTH              = 24
SPRITE_POINTERS           = $03f8
.define MAKE_SPRITE_POINTER(address) (.lobyte((address) >> 6))

VIC2_IDLE_PATTERN         = $3fff


VIC2_BASE                 = $d000

CHARSET_ADDR_UPPERGRAPHIC = $d000
CHARSET_ADDR_UPPERLOWER   = $d800

ROM_CHARSET_UPGFX         = CHARSET_ADDR_UPPERGRAPHIC
ROM_CHARSET_UPLOW         = CHARSET_ADDR_UPPERLOWER

VIC2_COLOURRAM            = $d800

COLOUR_BLACK              = $00
COLOUR_WHITE              = $01
COLOUR_RED                = $02
COLOUR_CYAN               = $03
COLOUR_VIOLET             = $04
COLOUR_PURPLE             = COLOUR_VIOLET
COLOUR_LILAC              = COLOUR_VIOLET
COLOUR_GREEN              = $05
COLOUR_BLUE               = $06
COLOUR_YELLOW             = $07
COLOUR_ORANGE             = $08
COLOUR_BROWN              = $09
COLOUR_LIGHTRED           = $0a
COLOUR_DARKGREY           = $0b
COLOUR_MEDIUMGREY         = $0c
COLOUR_LIGHTGREEN         = $0d
COLOUR_LIGHTBLUE          = $0e
COLOUR_LIGHTGREY          = $0f

SPRITE_0                  = %00000001
SPRITE_1                  = %00000010
SPRITE_2                  = %00000100
SPRITE_3                  = %00001000
SPRITE_4                  = %00010000
SPRITE_5                  = %00100000
SPRITE_6                  = %01000000
SPRITE_7                  = %10000000

SPRITE0_X                 = VIC2_BASE + $00; Sprite 0, x-coordinate bits 0-7
SPRITE0_Y                 = VIC2_BASE + $01; Sprite 0, y-coordinate
SPRITE1_X                 = VIC2_BASE + $02; Sprite 1, x-coordinate bits 0-7
SPRITE1_Y                 = VIC2_BASE + $03; Sprite 1, y-coordinate
SPRITE2_X                 = VIC2_BASE + $04; Sprite 2, x-coordinate bits 0-7
SPRITE2_Y                 = VIC2_BASE + $05; Sprite 2, y-coordinate
SPRITE3_X                 = VIC2_BASE + $06; Sprite 3, x-coordinate bits 0-7
SPRITE3_Y                 = VIC2_BASE + $07; Sprite 3, y-coordinate
SPRITE4_X                 = VIC2_BASE + $08; Sprite 4, x-coordinate bits 0-7
SPRITE4_Y                 = VIC2_BASE + $09; Sprite 4, y-coordinate
SPRITE5_X                 = VIC2_BASE + $0a; Sprite 5, x-coordinate bits 0-7
SPRITE5_Y                 = VIC2_BASE + $0b; Sprite 5, y-coordinate
SPRITE6_X                 = VIC2_BASE + $0c; Sprite 6, x-coordinate bits 0-7
SPRITE6_Y                 = VIC2_BASE + $0d; Sprite 6, y-coordinate
SPRITE7_X                 = VIC2_BASE + $0e; Sprite 7, x-coordinate bits 0-7
SPRITE7_Y                 = VIC2_BASE + $0f; Sprite 7, y-coordinate

SPRITES_X_MSB             = VIC2_BASE + $10; Sprites 0-7, x-coordinates bit 8

VIC2_CTRL1                = VIC2_BASE + $11; Control register 1
 SCROLLY_0                = %00000000
 SCROLLY_1                = %00000001
 SCROLLY_2                = %00000010
 SCROLLY_3                = %00000011
 SCROLLY_4                = %00000100
 SCROLLY_5                = %00000101
 SCROLLY_6                = %00000110
 SCROLLY_7                = %00000111
 SCROLLY_MASK             = %00000111
 LINES_24                 = %00000000
 LINES_25                 = %00001000
 DISPLAY_ENABLE           = %00010000
 DISPLAY_DISABLE          = %00000000
 BITMAP_MODE              = %00100000
 TEXT_MODE                = %00000000
 EBCM_MODE                = %01000000
 RASTERLINE_BIT8          = %10000000
 RASTERLINE_BIT8_SHIFT    = 7
 RASTERLINE_MSB           = %10000000
 RASTERLINE_MSB_SHIFT     = 7

VIC2_RASTERLINE           = VIC2_BASE + $12; Current raster line, raster IRQ trigger line
 RASTERLINE               = VIC2_RASTERLINE
 MAX_RASTERLINE_PAL       = $0137
 MAX_RASTERLINE_NTSC      = $0105

VIC2_STROBE_X             = VIC2_BASE + $13; Light pen x-position
VIC2_STROBE_Y             = VIC2_BASE + $14; Light pen y-position

VIC2_SPR_ENABLE           = VIC2_BASE + $15; Enabled sprites

VIC2_CTRL2                = VIC2_BASE + $16; Control register 2
 SCROLLX_0                = %00000000
 SCROLLX_1                = %00000001
 SCROLLX_2                = %00000010
 SCROLLX_3                = %00000011
 SCROLLX_4                = %00000100
 SCROLLX_5                = %00000101
 SCROLLX_6                = %00000110
 SCROLLX_7                = %00000111
 SCROLLX_MASK             = %00000111
 COLUMNS_38               = %00000000
 COLUMNS_40               = %00001000
 SINGLECOLOUR_MODE        = %00000000
 MULTICOLOUR_MODE         = %00010000

VIC2_SPR_EXPANDY          = VIC2_BASE + $17; y-expanded sprites

VIC2_ADDR                 = VIC2_BASE + $18; Character set and bitmap locations
 SCREEN_MASK              = %11110000
 CHARSET_UPPERGRAPHIC     = %00000100; $d000
 CHARSET_UPPERLOWER       = %00000110; $d800
 CHARSET_MASK             = %00001110
 BITMAP_MASK              = %00001000
.define VIC2_MAKE_ADDR(screen, charset_or_bitmap) .lobyte(((screen & $3fff) >> 6) | ((charset_or_bitmap & $3fff) >> 10))

VIC2_IRR                  = VIC2_BASE + $19; Interrupt Request Register
 RASTER_IRQ               = %00000001
 SPR_BGR_COLL_IRQ         = %00000010
 SPR_SPR_COLL_IRQ         = %00000100
 LIGHTPEN_IRQ             = %00001000
 IRQ_FLAG                 = %10000000

VIC2_IMR                  = VIC2_BASE + $1a; Interrupt Mask Register
 NO_INTERRUPTS            = %00000000
;RASTER_IRQ               = %00000001
;SPR_BGR_COLL_IRQ         = %00000010
;SPR_SPR_COLL_IRQ         = %00000100
;LIGHTPEN_IRQ             = %00001000

VIC2_BG_PRIORITY          = VIC2_BASE + $1b; Sprite-to-background priority

VIC2_SPR_MCOLOUR          = VIC2_BASE + $1c; Sprites multicolour enabled

VIC2_SPR_EXPANDX          = VIC2_BASE + $1d; Sprites x-expansion

VIC2_SPR_COLL             = VIC2_BASE + $1e; Sprite-to-sprite collision
VIC2_SPR_BG_COLL          = VIC2_BASE + $1f; Sprite-to-background collision

VIC2_BORDERCOLOUR         = VIC2_BASE + $20; Overscan colour
BORDERCOLOUR              = VIC2_BORDERCOLOUR

VIC2_BGCOLOUR             = VIC2_BASE + $21; Background colour
BGCOLOUR                  = VIC2_BGCOLOUR
VIC2_BGCOLOUR0            = VIC2_BGCOLOUR; Background colour 0
VIC2_BGCOLOUR1            = VIC2_BASE + $22; Background colour 1
VIC2_MULTICOLOUR0         = VIC2_BGCOLOUR1; Multicolour 1
VIC2_BGCOLOUR2            = VIC2_BASE + $23; Background colour 2
VIC2_MULTICOLOUR1         = VIC2_BGCOLOUR2; Multicolour 2
VIC2_BGCOLOUR3            = VIC2_BASE + $24; Background colour 3

VIC2_SPR_MCOLOUR0         = VIC2_BASE + $25; Sprite multicolour 0
VIC2_SPR_MCOLOUR1         = VIC2_BASE + $26; Sprite multicolour 1

VIC2_SPR0_COLOUR          = VIC2_BASE + $27; Sprite colour 0
VIC2_SPR1_COLOUR          = VIC2_BASE + $28; Sprite colour 1
VIC2_SPR2_COLOUR          = VIC2_BASE + $29; Sprite colour 2
VIC2_SPR3_COLOUR          = VIC2_BASE + $2a; Sprite colour 3
VIC2_SPR4_COLOUR          = VIC2_BASE + $2b; Sprite colour 4
VIC2_SPR5_COLOUR          = VIC2_BASE + $2c; Sprite colour 5
VIC2_SPR6_COLOUR          = VIC2_BASE + $2d; Sprite colour 6
VIC2_SPR7_COLOUR          = VIC2_BASE + $2e; Sprite colour 7

VIC2_C128_EXT_KB          = VIC2_BASE + $2f; Expanded keyboard matrix line
C128_EXT_KB               = VIC2_C128_EXT_KB
VIC2_C128_CLOCK           = VIC2_BASE + $30; Extended clock control
C128_CLOCK                = VIC2_C128_CLOCK
 C128_TWO_MHZ             = %00000001
 C128_INC_LINECNTR        = %00000010


; c = 0: NTSC, c = 1: PAL
.macro WAIT_VBL
    .scope
            .local loop

            lda #VSYNC_LINE_NTSC
            bcc loop
            lda #VSYNC_LINE_PAL
loop:       cmp VIC2_RASTERLINE
            bne loop
            bit VIC2_CTRL1
            bmi loop
            cmp VIC2_RASTERLINE
            bne loop
    .endscope
.endmacro

.macro DISPLAY_HIRES_BITMAP bitmap, screen
            WAIT_VBL
            lda #BITMAP_MODE | DISPLAY_ENABLE | LINES_25 | SCROLLY_3
            sta VIC2_CTRL1
            lda #SINGLECOLOUR_MODE | COLUMNS_40 | SCROLLX_0
            sta VIC2_CTRL2
            lda #VIC2_MAKE_ADDR(screen, bitmap)
            sta VIC2_ADDR
            lda CIA2_PRA
            and #.lobyte(~VIC2_BANK_MASK)
            ora #VIC2_MAKE_BANK(bitmap)
            sta CIA2_PRA
.endmacro

.endif; !_VIC_INC_
