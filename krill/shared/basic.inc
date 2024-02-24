
.ifndef _BASIC_INC_
_BASIC_INC_ = 1

BASIC_ROM          = $a000
BASIC_ROM_SIZE     = $2000

LINNUM             = $14

FBUFFR             = $0100; floating point string buffer written by FOUT

TOKEN_SYS          = $9e

PETSCII_RETURN     = $0d
PETSCII_LO_UP_CASE = $0e
PETSCII_BLINK      = $0f; C128 80 columns
PETSCII_CLEAR      = $93

PETSCII_BLACK      = $90
PETSCII_WHITE      = $05
PETSCII_RED        = $1c
PETSCII_CYAN       = $9f
PETSCII_PURPLE     = $9c
PETSCII_GREEN      = $1e
PETSCII_BLUE       = $1f
PETSCII_YELLOW     = $9e
PETSCII_ORANGE     = $81
PETSCII_BROWN      = $95
PETSCII_LIGHTRED   = $96
PETSCII_DARKGREY   = $97
PETSCII_GREY       = $98
PETSCII_LIGHTGREEN = $99
PETSCII_LIGHTBLUE  = $9a
PETSCII_LIGHTGREY  = $9b

.if .defined(PLATFORM) & (PLATFORM = 16)

NEW                = $8a7b; Perform NEW
CLR                = $8a9a; PErform CLR
STROUT             = $9088; Output String
GIVAYF             = $9471; Convert Integer in (AC/YR) to FAC
NORMALIZE          = $952b; Normalize FAC#1
INT24TOMANTISSA    = $9534; Integer in (YR/XR/AR) to FAC mantissa MSBs
N32768             = $986c; Constant -32768 in floating point
FLPINT             = $9871; FAC#1 to Integer in A/Y
AYINT              = $9886; FAC#1 to Positive Integer
STRLIT             = $9b74; Set Up String
FADDH              = $a062; Add 0.5 to FAC#1
FADD               = $a066; Perform Addition
FSUB               = $a06c; Perform Subtraction
FMULT              = $a078; Perform Multiply of float in (AC/YR) with FAC
CONUPK             = $a0dc; Move floating point number from memory to FAC#2
MUL10              = $a162; Multiply FAC#1 by 10
TENC               = $a179; Constant 10 in floating point
DIV10              = $a183; Divide FAC#1 by 10
FDIVM              = $a18c; Divide FAC#2 by float in (AC/YR), result in FAC#1
FDIV               = $a194; Divide float in (AC/YR) by FAC#1, result in FAC#1
FDIVT              = $a197; Divide FAC#2 by FAC#1, result in FAC#1
MOVFM              = $a221; Move floating point number from memory to FAC#1
MOV2M              = $a259; Store FAC#1 in memory at (XR/YR)
MOVAF              = $a291; Copy FAC#1 to FAC#2
LINPRT             = $a45f; Print integer in A/X
FOUT               = $a46f; Convert FAC#1 to ASCII String

.elseif .defined(PLATFORM) & (PLATFORM = 128)

NEW                = $51d9; Perform NEW
CLR                = $51f8; Perform CLR
STROUT             = $55e2; Output String
NORMALIZE          = $7a14; Normalize FAC#1
INT24TOMANTISSA    = $7a1d; Integer in (YR/XR/AR) to FAC#1 mantissa MSBs
FLPINT             = $849f; FAC#1 to Integer in A/Y
GIVAYF             = $84c9; Convert Integer in (AC/YR) to FAC
STRLIT             = $869a; Set Up String
FADDH              = $8a0e; Add 0.5 to FAC#1
FMULT              = $8a08; Perform Multiply of float in (AC/YR) with FAC
FDIV               = $8a1e; Divide float in (AC/YR) by FAC#1, result in FAC#1
CONUPK             = $8a89; Move floating point number from memory to FAC#2
MUL10              = $8b17; Multiply FAC#1 by 10
DIV10              = $8b38; Divide FAC#1 by 10
FDIVM              = $8b3f; Divide FAC#2 by float in (AC/YR), result in FAC#1
FDIVT              = $8b4c; Divide FAC#2 by FAC#1, result in FAC#1
MOVFM              = $8bd4; Move floating point number from memory to FAC#1
MOV2M              = $8c00; Store FAC#1 in memory at (XR/YR)
MOVAF              = $8c38; Copy FAC#1 to FAC#2
LINPRT             = $8e32; Print integer in A/X
FOUT               = $8e42; Convert FAC#1 to ASCII String

.else

NEW                = $a644; Perform NEW
CLR                = $a660; Perform CLR
STROUT             = $ab1e; Output String
NORMALIZE          = $af7e; Normalize FAC#1
INT24TOMANTISSA    = $af87; GETTIM + 3, Integer in (YR/XR/AR) to FAC#1 mantissa MSBs
N32768             = $b1a5; Constant -32768 in floating point
FLPINT             = $b1aa; FAC#1 to Integer in A/Y
AYINT              = $b1bf; FAC#1 to Positive Integer
GIVAYF             = $b391; Convert Integer in (AC/YR) to FAC
STRLIT             = $b487; Set Up String
FADDH              = $b849; Add 0.5 to FAC#1
FSUB               = $b850; Perform Subtraction
FADD               = $b867; Perform Addition
FMULT              = $ba28; Perform Multiply of float in (AC/YR) with FAC
CONUPK             = $ba8c; Move floating point number from memory to FAC#2
MUL10              = $bae2; Multiply FAC#1 by 10
TENC               = $baf9; Constant 10 in floating point
DIV10              = $bafe; Divide FAC#1 by 10
FDIVM              = $bb05; Divide FAC#2 by float in (AC/YR), result in FAC#1
FDIV               = $bb0f; Divide float in (AC/YR) by FAC#1, result in FAC#1
FDIVT              = $bb12; Divide FAC#2 by FAC#1, result in FAC#1
MOVFM              = $bba2; Move floating point number from memory to FAC#1
MOV2M              = $bbd4; Store FAC#1 in memory at (XR/YR)
MOVAF              = $bc0c; Copy FAC#1 to FAC#2
LINPRT             = $bdcd; Print integer in A/X
FOUT               = $bddd; Convert FAC#1 to ASCII String

PIVAL              = $aea8; Constant PI in floating point
GETADR             = $b7f7; Convert FAC to Integer in LINNUM
FONE               = $b9bc; Floating point constant: 1
.endif

.macro LOAD_ADDRESS
                .word * + $02
.endmacro; LOAD_ADDRESS

.macro BASIC_STARTLINE linenumber
                .assert * = $0801, warning, "***** PC is not $0801 *****"
                .word $080d, linenumber
                .byte TOKEN_SYS, "2061", $00, $00, $00
.endmacro; BASIC_STARTLINE

.endif; !_BASIC_INC_
