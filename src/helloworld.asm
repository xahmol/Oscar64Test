--------------------------------------------------------------------
startup: ; startup
1c01 : 0b __ __ INV
1c02 : 08 __ __ PHP
1c03 : 0a __ __ ASL
1c04 : 00 __ __ BRK
1c05 : 9e __ __ INV
1c06 : 37 __ __ INV
1c07 : 31 38 __ AND ($38),y 
1c09 : 31 00 __ AND ($00),y 
1c0b : 00 __ __ BRK
1c0c : 00 __ __ BRK
1c0d : a9 0e __ LDA #$0e
1c0f : 8d 00 ff STA $ff00 
1c12 : ba __ __ TSX
1c13 : 8e 30 24 STX $2430 ; (spentry + 0)
1c16 : a9 32 __ LDA #$32
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 24 __ LDA #$24
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 24 __ LDA #$24
1c21 : e9 24 __ SBC #$24
1c23 : f0 0f __ BEQ $1c34 ; (startup + 51)
1c25 : aa __ __ TAX
1c26 : a9 00 __ LDA #$00
1c28 : a0 00 __ LDY #$00
1c2a : 91 19 __ STA (IP + 0),y 
1c2c : c8 __ __ INY
1c2d : d0 fb __ BNE $1c2a ; (startup + 41)
1c2f : e6 1a __ INC IP + 1 
1c31 : ca __ __ DEX
1c32 : d0 f6 __ BNE $1c2a ; (startup + 41)
1c34 : 38 __ __ SEC
1c35 : a9 32 __ LDA #$32
1c37 : e9 32 __ SBC #$32
1c39 : f0 08 __ BEQ $1c43 ; (startup + 66)
1c3b : a8 __ __ TAY
1c3c : a9 00 __ LDA #$00
1c3e : 88 __ __ DEY
1c3f : 91 19 __ STA (IP + 0),y 
1c41 : d0 fb __ BNE $1c3e ; (startup + 61)
1c43 : a2 f7 __ LDX #$f7
1c45 : e0 f7 __ CPX #$f7
1c47 : f0 07 __ BEQ $1c50 ; (startup + 79)
1c49 : 95 00 __ STA $00,x 
1c4b : e8 __ __ INX
1c4c : e0 f7 __ CPX #$f7
1c4e : d0 f9 __ BNE $1c49 ; (startup + 72)
1c50 : a9 b0 __ LDA #$b0
1c52 : 85 23 __ STA SP + 0 
1c54 : a9 bf __ LDA #$bf
1c56 : 85 24 __ STA SP + 1 
1c58 : 20 80 1c JSR $1c80 ; (main.s1000 + 0)
1c5b : a9 4c __ LDA #$4c
1c5d : 85 54 __ STA $54 
1c5f : a9 00 __ LDA #$00
1c61 : 85 13 __ STA P6 
1c63 : 85 1a __ STA IP + 1 
1c65 : a9 19 __ LDA #$19
1c67 : 85 16 __ STA P9 
1c69 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
.s1000:
1c80 : 38 __ __ SEC
1c81 : a5 23 __ LDA SP + 0 
1c83 : e9 04 __ SBC #$04
1c85 : 85 23 __ STA SP + 0 
1c87 : b0 02 __ BCS $1c8b ; (main.s0 + 0)
1c89 : c6 24 __ DEC SP + 1 
.s0:
1c8b : a9 08 __ LDA #$08
1c8d : a0 02 __ LDY #$02
1c8f : 91 23 __ STA (SP + 0),y 
1c91 : a9 23 __ LDA #$23
1c93 : c8 __ __ INY
1c94 : 91 23 __ STA (SP + 0),y 
1c96 : 20 ab 1c JSR $1cab ; (printf.s1000 + 0)
1c99 : a9 00 __ LDA #$00
1c9b : 85 1b __ STA ACCU + 0 
1c9d : 85 1c __ STA ACCU + 1 
.s1001:
1c9f : 18 __ __ CLC
1ca0 : a5 23 __ LDA SP + 0 
1ca2 : 69 04 __ ADC #$04
1ca4 : 85 23 __ STA SP + 0 
1ca6 : 90 02 __ BCC $1caa ; (main.s1001 + 11)
1ca8 : e6 24 __ INC SP + 1 
1caa : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
1cab : a2 03 __ LDX #$03
1cad : b5 53 __ LDA T8 + 0,x 
1caf : 9d b2 bf STA $bfb2,x ; (printf@stack + 0)
1cb2 : ca __ __ DEX
1cb3 : 10 f8 __ BPL $1cad ; (printf.s1000 + 2)
.s0:
1cb5 : 18 __ __ CLC
1cb6 : a5 23 __ LDA SP + 0 
1cb8 : 69 04 __ ADC #$04
1cba : 85 47 __ STA T0 + 0 
1cbc : a5 24 __ LDA SP + 1 
1cbe : 69 00 __ ADC #$00
1cc0 : 85 48 __ STA T0 + 1 
1cc2 : a9 00 __ LDA #$00
1cc4 : 85 49 __ STA T2 + 0 
1cc6 : a0 02 __ LDY #$02
1cc8 : b1 23 __ LDA (SP + 0),y 
1cca : 85 4a __ STA T3 + 0 
1ccc : c8 __ __ INY
1ccd : b1 23 __ LDA (SP + 0),y 
1ccf : 85 4b __ STA T3 + 1 
.l2:
1cd1 : a0 00 __ LDY #$00
1cd3 : b1 4a __ LDA (T3 + 0),y 
1cd5 : d0 1e __ BNE $1cf5 ; (printf.s3 + 0)
.s4:
1cd7 : a6 49 __ LDX T2 + 0 
1cd9 : 9d be bf STA $bfbe,x ; (buff + 0)
1cdc : 8a __ __ TXA
1cdd : f0 0b __ BEQ $1cea ; (printf.s1001 + 0)
.s117:
1cdf : a9 be __ LDA #$be
1ce1 : 85 0d __ STA P0 ; (fmt + 0)
1ce3 : a9 bf __ LDA #$bf
1ce5 : 85 0e __ STA P1 ; (fmt + 1)
1ce7 : 20 0b 20 JSR $200b ; (puts.s0 + 0)
.s1001:
1cea : a2 03 __ LDX #$03
1cec : bd b2 bf LDA $bfb2,x ; (printf@stack + 0)
1cef : 95 53 __ STA T8 + 0,x 
1cf1 : ca __ __ DEX
1cf2 : 10 f8 __ BPL $1cec ; (printf.s1001 + 2)
1cf4 : 60 __ __ RTS
.s3:
1cf5 : c9 25 __ CMP #$25
1cf7 : f0 28 __ BEQ $1d21 ; (printf.s5 + 0)
.s6:
1cf9 : a6 49 __ LDX T2 + 0 
1cfb : 9d be bf STA $bfbe,x ; (buff + 0)
1cfe : e6 4a __ INC T3 + 0 
1d00 : d0 02 __ BNE $1d04 ; (printf.s1098 + 0)
.s1097:
1d02 : e6 4b __ INC T3 + 1 
.s1098:
1d04 : e8 __ __ INX
1d05 : 86 49 __ STX T2 + 0 
1d07 : e0 28 __ CPX #$28
1d09 : 90 c6 __ BCC $1cd1 ; (printf.l2 + 0)
.s111:
1d0b : a9 be __ LDA #$be
1d0d : 85 0d __ STA P0 ; (fmt + 0)
1d0f : a9 bf __ LDA #$bf
1d11 : 85 0e __ STA P1 ; (fmt + 1)
1d13 : 98 __ __ TYA
1d14 : 9d be bf STA $bfbe,x ; (buff + 0)
1d17 : 20 0b 20 JSR $200b ; (puts.s0 + 0)
1d1a : a9 00 __ LDA #$00
.s1068:
1d1c : 85 49 __ STA T2 + 0 
1d1e : 4c d1 1c JMP $1cd1 ; (printf.l2 + 0)
.s5:
1d21 : a5 49 __ LDA T2 + 0 
1d23 : f0 15 __ BEQ $1d3a ; (printf.s10 + 0)
.s8:
1d25 : a9 be __ LDA #$be
1d27 : 85 0d __ STA P0 ; (fmt + 0)
1d29 : a9 bf __ LDA #$bf
1d2b : 85 0e __ STA P1 ; (fmt + 1)
1d2d : 98 __ __ TYA
1d2e : a6 49 __ LDX T2 + 0 
1d30 : 9d be bf STA $bfbe,x ; (buff + 0)
1d33 : 20 0b 20 JSR $200b ; (puts.s0 + 0)
1d36 : a9 00 __ LDA #$00
1d38 : 85 49 __ STA T2 + 0 
.s10:
1d3a : a9 0a __ LDA #$0a
1d3c : 8d b9 bf STA $bfb9 ; (si + 3)
1d3f : a9 00 __ LDA #$00
1d41 : 8d ba bf STA $bfba ; (si + 4)
1d44 : 8d bb bf STA $bfbb ; (si + 5)
1d47 : 8d bc bf STA $bfbc ; (si + 6)
1d4a : 8d bd bf STA $bfbd ; (si + 7)
1d4d : a0 01 __ LDY #$01
1d4f : b1 4a __ LDA (T3 + 0),y 
1d51 : aa __ __ TAX
1d52 : a9 20 __ LDA #$20
1d54 : 8d b6 bf STA $bfb6 ; (si + 0)
1d57 : a9 00 __ LDA #$00
1d59 : 8d b7 bf STA $bfb7 ; (si + 1)
1d5c : a9 ff __ LDA #$ff
1d5e : 8d b8 bf STA $bfb8 ; (si + 2)
1d61 : 18 __ __ CLC
1d62 : a5 4a __ LDA T3 + 0 
1d64 : 69 02 __ ADC #$02
.l15:
1d66 : 85 4a __ STA T3 + 0 
1d68 : 90 02 __ BCC $1d6c ; (printf.s1080 + 0)
.s1079:
1d6a : e6 4b __ INC T3 + 1 
.s1080:
1d6c : 8a __ __ TXA
1d6d : e0 2b __ CPX #$2b
1d6f : d0 08 __ BNE $1d79 ; (printf.s18 + 0)
.s17:
1d71 : a9 01 __ LDA #$01
1d73 : 8d bb bf STA $bfbb ; (si + 5)
1d76 : 4c fe 1f JMP $1ffe ; (printf.s246 + 0)
.s18:
1d79 : c9 30 __ CMP #$30
1d7b : d0 06 __ BNE $1d83 ; (printf.s21 + 0)
.s20:
1d7d : 8d b6 bf STA $bfb6 ; (si + 0)
1d80 : 4c fe 1f JMP $1ffe ; (printf.s246 + 0)
.s21:
1d83 : e0 23 __ CPX #$23
1d85 : d0 08 __ BNE $1d8f ; (printf.s24 + 0)
.s23:
1d87 : a9 01 __ LDA #$01
1d89 : 8d bd bf STA $bfbd ; (si + 7)
1d8c : 4c fe 1f JMP $1ffe ; (printf.s246 + 0)
.s24:
1d8f : e0 2d __ CPX #$2d
1d91 : d0 08 __ BNE $1d9b ; (printf.s16 + 0)
.s26:
1d93 : a9 01 __ LDA #$01
1d95 : 8d bc bf STA $bfbc ; (si + 6)
1d98 : 4c fe 1f JMP $1ffe ; (printf.s246 + 0)
.s16:
1d9b : 85 4c __ STA T4 + 0 
1d9d : e0 30 __ CPX #$30
1d9f : 90 53 __ BCC $1df4 ; (printf.s32 + 0)
.s33:
1da1 : e0 3a __ CPX #$3a
1da3 : b0 4f __ BCS $1df4 ; (printf.s32 + 0)
.s30:
1da5 : a9 00 __ LDA #$00
1da7 : 85 4d __ STA T6 + 0 
1da9 : 85 4e __ STA T6 + 1 
1dab : e0 3a __ CPX #$3a
1dad : b0 40 __ BCS $1def ; (printf.s36 + 0)
.l35:
1daf : a5 4d __ LDA T6 + 0 
1db1 : 0a __ __ ASL
1db2 : 85 1b __ STA ACCU + 0 
1db4 : a5 4e __ LDA T6 + 1 
1db6 : 2a __ __ ROL
1db7 : 06 1b __ ASL ACCU + 0 
1db9 : 2a __ __ ROL
1dba : aa __ __ TAX
1dbb : 18 __ __ CLC
1dbc : a5 1b __ LDA ACCU + 0 
1dbe : 65 4d __ ADC T6 + 0 
1dc0 : 85 4d __ STA T6 + 0 
1dc2 : 8a __ __ TXA
1dc3 : 65 4e __ ADC T6 + 1 
1dc5 : 06 4d __ ASL T6 + 0 
1dc7 : 2a __ __ ROL
1dc8 : aa __ __ TAX
1dc9 : 18 __ __ CLC
1dca : a5 4d __ LDA T6 + 0 
1dcc : 65 4c __ ADC T4 + 0 
1dce : 90 01 __ BCC $1dd1 ; (printf.s1094 + 0)
.s1093:
1dd0 : e8 __ __ INX
.s1094:
1dd1 : 38 __ __ SEC
1dd2 : e9 30 __ SBC #$30
1dd4 : 85 4d __ STA T6 + 0 
1dd6 : 8a __ __ TXA
1dd7 : e9 00 __ SBC #$00
1dd9 : 85 4e __ STA T6 + 1 
1ddb : a0 00 __ LDY #$00
1ddd : b1 4a __ LDA (T3 + 0),y 
1ddf : 85 4c __ STA T4 + 0 
1de1 : e6 4a __ INC T3 + 0 
1de3 : d0 02 __ BNE $1de7 ; (printf.s1096 + 0)
.s1095:
1de5 : e6 4b __ INC T3 + 1 
.s1096:
1de7 : c9 30 __ CMP #$30
1de9 : 90 04 __ BCC $1def ; (printf.s36 + 0)
.s37:
1deb : c9 3a __ CMP #$3a
1ded : 90 c0 __ BCC $1daf ; (printf.l35 + 0)
.s36:
1def : a5 4d __ LDA T6 + 0 
1df1 : 8d b7 bf STA $bfb7 ; (si + 1)
.s32:
1df4 : a5 4c __ LDA T4 + 0 
1df6 : c9 2e __ CMP #$2e
1df8 : d0 51 __ BNE $1e4b ; (printf.s40 + 0)
.s38:
1dfa : a9 00 __ LDA #$00
1dfc : 85 4d __ STA T6 + 0 
.l231:
1dfe : 85 4e __ STA T6 + 1 
1e00 : a0 00 __ LDY #$00
1e02 : b1 4a __ LDA (T3 + 0),y 
1e04 : 85 4c __ STA T4 + 0 
1e06 : e6 4a __ INC T3 + 0 
1e08 : d0 02 __ BNE $1e0c ; (printf.s1082 + 0)
.s1081:
1e0a : e6 4b __ INC T3 + 1 
.s1082:
1e0c : c9 30 __ CMP #$30
1e0e : 90 04 __ BCC $1e14 ; (printf.s43 + 0)
.s44:
1e10 : c9 3a __ CMP #$3a
1e12 : 90 0a __ BCC $1e1e ; (printf.s42 + 0)
.s43:
1e14 : a5 4d __ LDA T6 + 0 
1e16 : 8d b8 bf STA $bfb8 ; (si + 2)
1e19 : a5 4c __ LDA T4 + 0 
1e1b : 4c 4b 1e JMP $1e4b ; (printf.s40 + 0)
.s42:
1e1e : a5 4d __ LDA T6 + 0 
1e20 : 0a __ __ ASL
1e21 : 85 1b __ STA ACCU + 0 
1e23 : a5 4e __ LDA T6 + 1 
1e25 : 2a __ __ ROL
1e26 : 06 1b __ ASL ACCU + 0 
1e28 : 2a __ __ ROL
1e29 : aa __ __ TAX
1e2a : 18 __ __ CLC
1e2b : a5 1b __ LDA ACCU + 0 
1e2d : 65 4d __ ADC T6 + 0 
1e2f : 85 4d __ STA T6 + 0 
1e31 : 8a __ __ TXA
1e32 : 65 4e __ ADC T6 + 1 
1e34 : 06 4d __ ASL T6 + 0 
1e36 : 2a __ __ ROL
1e37 : aa __ __ TAX
1e38 : 18 __ __ CLC
1e39 : a5 4d __ LDA T6 + 0 
1e3b : 65 4c __ ADC T4 + 0 
1e3d : 90 01 __ BCC $1e40 ; (printf.s1092 + 0)
.s1091:
1e3f : e8 __ __ INX
.s1092:
1e40 : 38 __ __ SEC
1e41 : e9 30 __ SBC #$30
1e43 : 85 4d __ STA T6 + 0 
1e45 : 8a __ __ TXA
1e46 : e9 00 __ SBC #$00
1e48 : 4c fe 1d JMP $1dfe ; (printf.l231 + 0)
.s40:
1e4b : c9 64 __ CMP #$64
1e4d : f0 04 __ BEQ $1e53 ; (printf.s45 + 0)
.s48:
1e4f : c9 44 __ CMP #$44
1e51 : d0 05 __ BNE $1e58 ; (printf.s46 + 0)
.s45:
1e53 : a9 01 __ LDA #$01
1e55 : 4c d7 1f JMP $1fd7 ; (printf.s247 + 0)
.s46:
1e58 : c9 75 __ CMP #$75
1e5a : d0 03 __ BNE $1e5f ; (printf.s52 + 0)
1e5c : 4c d5 1f JMP $1fd5 ; (printf.s269 + 0)
.s52:
1e5f : c9 55 __ CMP #$55
1e61 : d0 03 __ BNE $1e66 ; (printf.s50 + 0)
1e63 : 4c d5 1f JMP $1fd5 ; (printf.s269 + 0)
.s50:
1e66 : c9 78 __ CMP #$78
1e68 : f0 04 __ BEQ $1e6e ; (printf.s53 + 0)
.s56:
1e6a : c9 58 __ CMP #$58
1e6c : d0 0d __ BNE $1e7b ; (printf.s54 + 0)
.s53:
1e6e : a9 10 __ LDA #$10
1e70 : 8d b9 bf STA $bfb9 ; (si + 3)
1e73 : a9 00 __ LDA #$00
1e75 : 8d ba bf STA $bfba ; (si + 4)
1e78 : 4c d5 1f JMP $1fd5 ; (printf.s269 + 0)
.s54:
1e7b : c9 6c __ CMP #$6c
1e7d : d0 03 __ BNE $1e82 ; (printf.s60 + 0)
1e7f : 4c 57 1f JMP $1f57 ; (printf.s57 + 0)
.s60:
1e82 : c9 4c __ CMP #$4c
1e84 : d0 03 __ BNE $1e89 ; (printf.s58 + 0)
1e86 : 4c 57 1f JMP $1f57 ; (printf.s57 + 0)
.s58:
1e89 : c9 73 __ CMP #$73
1e8b : f0 39 __ BEQ $1ec6 ; (printf.s73 + 0)
.s76:
1e8d : c9 53 __ CMP #$53
1e8f : f0 35 __ BEQ $1ec6 ; (printf.s73 + 0)
.s74:
1e91 : c9 63 __ CMP #$63
1e93 : f0 15 __ BEQ $1eaa ; (printf.s104 + 0)
.s107:
1e95 : c9 43 __ CMP #$43
1e97 : f0 11 __ BEQ $1eaa ; (printf.s104 + 0)
.s105:
1e99 : 09 00 __ ORA #$00
1e9b : d0 03 __ BNE $1ea0 ; (printf.s108 + 0)
1e9d : 4c d1 1c JMP $1cd1 ; (printf.l2 + 0)
.s108:
1ea0 : a6 49 __ LDX T2 + 0 
1ea2 : 9d be bf STA $bfbe,x ; (buff + 0)
1ea5 : e6 49 __ INC T2 + 0 
1ea7 : 4c d1 1c JMP $1cd1 ; (printf.l2 + 0)
.s104:
1eaa : a0 00 __ LDY #$00
1eac : b1 47 __ LDA (T0 + 0),y 
1eae : a6 49 __ LDX T2 + 0 
1eb0 : 9d be bf STA $bfbe,x ; (buff + 0)
1eb3 : e6 49 __ INC T2 + 0 
.s244:
1eb5 : 18 __ __ CLC
1eb6 : a5 47 __ LDA T0 + 0 
1eb8 : 69 02 __ ADC #$02
1eba : 85 47 __ STA T0 + 0 
1ebc : b0 03 __ BCS $1ec1 ; (printf.s1083 + 0)
1ebe : 4c d1 1c JMP $1cd1 ; (printf.l2 + 0)
.s1083:
1ec1 : e6 48 __ INC T0 + 1 
1ec3 : 4c d1 1c JMP $1cd1 ; (printf.l2 + 0)
.s73:
1ec6 : a0 00 __ LDY #$00
1ec8 : 84 4c __ STY T4 + 0 
1eca : b1 47 __ LDA (T0 + 0),y 
1ecc : 85 4d __ STA T6 + 0 
1ece : c8 __ __ INY
1ecf : b1 47 __ LDA (T0 + 0),y 
1ed1 : 85 4e __ STA T6 + 1 
1ed3 : 18 __ __ CLC
1ed4 : a5 47 __ LDA T0 + 0 
1ed6 : 69 02 __ ADC #$02
1ed8 : 85 47 __ STA T0 + 0 
1eda : 90 02 __ BCC $1ede ; (printf.s1090 + 0)
.s1089:
1edc : e6 48 __ INC T0 + 1 
.s1090:
1ede : ad b7 bf LDA $bfb7 ; (si + 1)
1ee1 : f0 0d __ BEQ $1ef0 ; (printf.s79 + 0)
.s1071:
1ee3 : a0 00 __ LDY #$00
1ee5 : b1 4d __ LDA (T6 + 0),y 
1ee7 : f0 05 __ BEQ $1eee ; (printf.s1072 + 0)
.l81:
1ee9 : c8 __ __ INY
1eea : b1 4d __ LDA (T6 + 0),y 
1eec : d0 fb __ BNE $1ee9 ; (printf.l81 + 0)
.s1072:
1eee : 84 4c __ STY T4 + 0 
.s79:
1ef0 : ad bc bf LDA $bfbc ; (si + 6)
1ef3 : d0 1a __ BNE $1f0f ; (printf.s85 + 0)
.s1075:
1ef5 : a4 4c __ LDY T4 + 0 
1ef7 : cc b7 bf CPY $bfb7 ; (si + 1)
1efa : a6 49 __ LDX T2 + 0 
1efc : b0 0d __ BCS $1f0b ; (printf.s1076 + 0)
.l87:
1efe : ad b6 bf LDA $bfb6 ; (si + 0)
1f01 : 9d be bf STA $bfbe,x ; (buff + 0)
1f04 : c8 __ __ INY
1f05 : cc b7 bf CPY $bfb7 ; (si + 1)
1f08 : e8 __ __ INX
1f09 : 90 f3 __ BCC $1efe ; (printf.l87 + 0)
.s1076:
1f0b : 86 49 __ STX T2 + 0 
1f0d : 84 4c __ STY T4 + 0 
.s85:
1f0f : a5 49 __ LDA T2 + 0 
1f11 : f0 16 __ BEQ $1f29 ; (printf.s238 + 0)
.s92:
1f13 : a9 be __ LDA #$be
1f15 : 85 0d __ STA P0 ; (fmt + 0)
1f17 : a9 bf __ LDA #$bf
1f19 : 85 0e __ STA P1 ; (fmt + 1)
1f1b : a9 00 __ LDA #$00
1f1d : a6 49 __ LDX T2 + 0 
1f1f : 9d be bf STA $bfbe,x ; (buff + 0)
1f22 : 20 0b 20 JSR $200b ; (puts.s0 + 0)
1f25 : a9 00 __ LDA #$00
1f27 : 85 49 __ STA T2 + 0 
.s238:
1f29 : a5 4d __ LDA T6 + 0 
1f2b : 85 0d __ STA P0 ; (fmt + 0)
1f2d : a5 4e __ LDA T6 + 1 
1f2f : 85 0e __ STA P1 ; (fmt + 1)
1f31 : 20 0b 20 JSR $200b ; (puts.s0 + 0)
1f34 : ad bc bf LDA $bfbc ; (si + 6)
1f37 : d0 03 __ BNE $1f3c ; (printf.s1073 + 0)
1f39 : 4c d1 1c JMP $1cd1 ; (printf.l2 + 0)
.s1073:
1f3c : a4 4c __ LDY T4 + 0 
1f3e : cc b7 bf CPY $bfb7 ; (si + 1)
1f41 : a2 00 __ LDX #$00
1f43 : b0 0d __ BCS $1f52 ; (printf.s1074 + 0)
.l102:
1f45 : ad b6 bf LDA $bfb6 ; (si + 0)
1f48 : 9d be bf STA $bfbe,x ; (buff + 0)
1f4b : c8 __ __ INY
1f4c : cc b7 bf CPY $bfb7 ; (si + 1)
1f4f : e8 __ __ INX
1f50 : 90 f3 __ BCC $1f45 ; (printf.l102 + 0)
.s1074:
1f52 : 86 49 __ STX T2 + 0 
1f54 : 4c d1 1c JMP $1cd1 ; (printf.l2 + 0)
.s57:
1f57 : a0 00 __ LDY #$00
1f59 : b1 47 __ LDA (T0 + 0),y 
1f5b : 85 53 __ STA T8 + 0 
1f5d : c8 __ __ INY
1f5e : b1 47 __ LDA (T0 + 0),y 
1f60 : 85 54 __ STA T8 + 1 
1f62 : c8 __ __ INY
1f63 : b1 47 __ LDA (T0 + 0),y 
1f65 : 85 55 __ STA T8 + 2 
1f67 : c8 __ __ INY
1f68 : b1 47 __ LDA (T0 + 0),y 
1f6a : 85 56 __ STA T8 + 3 
1f6c : 18 __ __ CLC
1f6d : a5 47 __ LDA T0 + 0 
1f6f : 69 04 __ ADC #$04
1f71 : 85 47 __ STA T0 + 0 
1f73 : 90 02 __ BCC $1f77 ; (printf.s1086 + 0)
.s1085:
1f75 : e6 48 __ INC T0 + 1 
.s1086:
1f77 : a0 00 __ LDY #$00
1f79 : b1 4a __ LDA (T3 + 0),y 
1f7b : aa __ __ TAX
1f7c : e6 4a __ INC T3 + 0 
1f7e : d0 02 __ BNE $1f82 ; (printf.s1088 + 0)
.s1087:
1f80 : e6 4b __ INC T3 + 1 
.s1088:
1f82 : 8a __ __ TXA
1f83 : e0 64 __ CPX #$64
1f85 : f0 04 __ BEQ $1f8b ; (printf.s61 + 0)
.s64:
1f87 : c9 44 __ CMP #$44
1f89 : d0 04 __ BNE $1f8f ; (printf.s62 + 0)
.s61:
1f8b : a9 01 __ LDA #$01
1f8d : d0 1c __ BNE $1fab ; (printf.s245 + 0)
.s62:
1f8f : c9 75 __ CMP #$75
1f91 : f0 17 __ BEQ $1faa ; (printf.s268 + 0)
.s68:
1f93 : c9 55 __ CMP #$55
1f95 : f0 13 __ BEQ $1faa ; (printf.s268 + 0)
.s66:
1f97 : c9 78 __ CMP #$78
1f99 : f0 07 __ BEQ $1fa2 ; (printf.s69 + 0)
.s72:
1f9b : c9 58 __ CMP #$58
1f9d : f0 03 __ BEQ $1fa2 ; (printf.s69 + 0)
1f9f : 4c d1 1c JMP $1cd1 ; (printf.l2 + 0)
.s69:
1fa2 : 8c ba bf STY $bfba ; (si + 4)
1fa5 : a9 10 __ LDA #$10
1fa7 : 8d b9 bf STA $bfb9 ; (si + 3)
.s268:
1faa : 98 __ __ TYA
.s245:
1fab : 85 15 __ STA P8 
1fad : a9 be __ LDA #$be
1faf : 85 0f __ STA P2 ; (fmt + 2)
1fb1 : a9 bf __ LDA #$bf
1fb3 : 85 10 __ STA P3 ; (fmt + 3)
1fb5 : a5 53 __ LDA T8 + 0 
1fb7 : 85 11 __ STA P4 
1fb9 : a5 54 __ LDA T8 + 1 
1fbb : 85 12 __ STA P5 
1fbd : a5 55 __ LDA T8 + 2 
1fbf : 85 13 __ STA P6 
1fc1 : a5 56 __ LDA T8 + 3 
1fc3 : 85 14 __ STA P7 
1fc5 : a9 b6 __ LDA #$b6
1fc7 : 85 0d __ STA P0 ; (fmt + 0)
1fc9 : a9 bf __ LDA #$bf
1fcb : 85 0e __ STA P1 ; (fmt + 1)
1fcd : 20 95 21 JSR $2195 ; (nforml.s0 + 0)
1fd0 : a5 1b __ LDA ACCU + 0 
1fd2 : 4c 1c 1d JMP $1d1c ; (printf.s1068 + 0)
.s269:
1fd5 : a9 00 __ LDA #$00
.s247:
1fd7 : 85 13 __ STA P6 
1fd9 : a9 be __ LDA #$be
1fdb : 85 0f __ STA P2 ; (fmt + 2)
1fdd : a9 bf __ LDA #$bf
1fdf : 85 10 __ STA P3 ; (fmt + 3)
1fe1 : a0 00 __ LDY #$00
1fe3 : b1 47 __ LDA (T0 + 0),y 
1fe5 : 85 11 __ STA P4 
1fe7 : c8 __ __ INY
1fe8 : b1 47 __ LDA (T0 + 0),y 
1fea : 85 12 __ STA P5 
1fec : a9 b6 __ LDA #$b6
1fee : 85 0d __ STA P0 ; (fmt + 0)
1ff0 : a9 bf __ LDA #$bf
1ff2 : 85 0e __ STA P1 ; (fmt + 1)
1ff4 : 20 60 20 JSR $2060 ; (nformi.s0 + 0)
1ff7 : a5 1b __ LDA ACCU + 0 
1ff9 : 85 49 __ STA T2 + 0 
1ffb : 4c b5 1e JMP $1eb5 ; (printf.s244 + 0)
.s246:
1ffe : a0 00 __ LDY #$00
2000 : b1 4a __ LDA (T3 + 0),y 
2002 : aa __ __ TAX
2003 : 18 __ __ CLC
2004 : a5 4a __ LDA T3 + 0 
2006 : 69 01 __ ADC #$01
2008 : 4c 66 1d JMP $1d66 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
200b : a0 00 __ LDY #$00
200d : b1 0d __ LDA (P0),y 
200f : f0 0b __ BEQ $201c ; (puts.s1001 + 0)
2011 : 20 1d 20 JSR $201d ; (putpch + 0)
2014 : e6 0d __ INC P0 
2016 : d0 f3 __ BNE $200b ; (puts.s0 + 0)
2018 : e6 0e __ INC P1 
201a : d0 ef __ BNE $200b ; (puts.s0 + 0)
.s1001:
201c : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
201d : ae 31 24 LDX $2431 ; (giocharmap + 0)
2020 : e0 01 __ CPX #$01
2022 : 90 26 __ BCC $204a ; (putpch + 45)
2024 : c9 0a __ CMP #$0a
2026 : d0 02 __ BNE $202a ; (putpch + 13)
2028 : a9 0d __ LDA #$0d
202a : c9 09 __ CMP #$09
202c : f0 1f __ BEQ $204d ; (putpch + 48)
202e : e0 02 __ CPX #$02
2030 : 90 18 __ BCC $204a ; (putpch + 45)
2032 : c9 41 __ CMP #$41
2034 : 90 14 __ BCC $204a ; (putpch + 45)
2036 : c9 7b __ CMP #$7b
2038 : b0 10 __ BCS $204a ; (putpch + 45)
203a : c9 61 __ CMP #$61
203c : b0 04 __ BCS $2042 ; (putpch + 37)
203e : c9 5b __ CMP #$5b
2040 : b0 08 __ BCS $204a ; (putpch + 45)
2042 : 49 20 __ EOR #$20
2044 : e0 03 __ CPX #$03
2046 : f0 02 __ BEQ $204a ; (putpch + 45)
2048 : 29 df __ AND #$df
204a : 4c d2 ff JMP $ffd2 
204d : 38 __ __ SEC
204e : 20 f0 ff JSR $fff0 
2051 : 98 __ __ TYA
2052 : 29 03 __ AND #$03
2054 : 49 03 __ EOR #$03
2056 : aa __ __ TAX
2057 : a9 20 __ LDA #$20
2059 : 20 d2 ff JSR $ffd2 
205c : ca __ __ DEX
205d : 10 fa __ BPL $2059 ; (putpch + 60)
205f : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
2060 : a9 00 __ LDA #$00
2062 : 85 43 __ STA T0 + 0 
2064 : a5 13 __ LDA P6 ; (s + 0)
2066 : f0 13 __ BEQ $207b ; (nformi.s182 + 0)
.s4:
2068 : 24 12 __ BIT P5 ; (v + 1)
206a : 10 0f __ BPL $207b ; (nformi.s182 + 0)
.s1:
206c : 38 __ __ SEC
206d : a9 00 __ LDA #$00
206f : e5 11 __ SBC P4 ; (v + 0)
2071 : 85 11 __ STA P4 ; (v + 0)
2073 : a9 00 __ LDA #$00
2075 : e5 12 __ SBC P5 ; (v + 1)
2077 : 85 12 __ STA P5 ; (v + 1)
2079 : e6 43 __ INC T0 + 0 
.s182:
207b : a9 10 __ LDA #$10
207d : 85 44 __ STA T2 + 0 
207f : a5 11 __ LDA P4 ; (v + 0)
2081 : 05 12 __ ORA P5 ; (v + 1)
2083 : f0 46 __ BEQ $20cb ; (nformi.s7 + 0)
.s42:
2085 : a0 03 __ LDY #$03
2087 : b1 0d __ LDA (P0),y ; (si + 0)
2089 : 85 45 __ STA T4 + 0 
208b : c8 __ __ INY
208c : b1 0d __ LDA (P0),y ; (si + 0)
208e : 85 46 __ STA T4 + 1 
.l6:
2090 : a5 11 __ LDA P4 ; (v + 0)
2092 : 85 1b __ STA ACCU + 0 
2094 : a5 12 __ LDA P5 ; (v + 1)
2096 : 85 1c __ STA ACCU + 1 
2098 : a5 45 __ LDA T4 + 0 
209a : 85 03 __ STA WORK + 0 
209c : a5 46 __ LDA T4 + 1 
209e : 85 04 __ STA WORK + 1 
20a0 : 20 15 23 JSR $2315 ; (divmod + 0)
20a3 : a5 06 __ LDA WORK + 3 
20a5 : 30 08 __ BMI $20af ; (nformi.s78 + 0)
.s1019:
20a7 : d0 0a __ BNE $20b3 ; (nformi.s77 + 0)
.s1018:
20a9 : a5 05 __ LDA WORK + 2 
20ab : c9 0a __ CMP #$0a
20ad : b0 04 __ BCS $20b3 ; (nformi.s77 + 0)
.s78:
20af : a9 30 __ LDA #$30
20b1 : d0 02 __ BNE $20b5 ; (nformi.s79 + 0)
.s77:
20b3 : a9 37 __ LDA #$37
.s79:
20b5 : 18 __ __ CLC
20b6 : 65 05 __ ADC WORK + 2 
20b8 : c6 44 __ DEC T2 + 0 
20ba : a6 44 __ LDX T2 + 0 
20bc : 9d f0 bf STA $bff0,x ; (buffer + 0)
20bf : a5 1b __ LDA ACCU + 0 
20c1 : 85 11 __ STA P4 ; (v + 0)
20c3 : a5 1c __ LDA ACCU + 1 
20c5 : 85 12 __ STA P5 ; (v + 1)
20c7 : 05 11 __ ORA P4 ; (v + 0)
20c9 : d0 c5 __ BNE $2090 ; (nformi.l6 + 0)
.s7:
20cb : a0 02 __ LDY #$02
20cd : b1 0d __ LDA (P0),y ; (si + 0)
20cf : c9 ff __ CMP #$ff
20d1 : d0 04 __ BNE $20d7 ; (nformi.s80 + 0)
.s81:
20d3 : a9 0f __ LDA #$0f
20d5 : d0 05 __ BNE $20dc ; (nformi.s1026 + 0)
.s80:
20d7 : 38 __ __ SEC
20d8 : a9 10 __ LDA #$10
20da : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
20dc : a8 __ __ TAY
20dd : c4 44 __ CPY T2 + 0 
20df : b0 0d __ BCS $20ee ; (nformi.s10 + 0)
.s9:
20e1 : a9 30 __ LDA #$30
.l1027:
20e3 : c6 44 __ DEC T2 + 0 
20e5 : a6 44 __ LDX T2 + 0 
20e7 : 9d f0 bf STA $bff0,x ; (buffer + 0)
20ea : c4 44 __ CPY T2 + 0 
20ec : 90 f5 __ BCC $20e3 ; (nformi.l1027 + 0)
.s10:
20ee : a0 07 __ LDY #$07
20f0 : b1 0d __ LDA (P0),y ; (si + 0)
20f2 : f0 20 __ BEQ $2114 ; (nformi.s13 + 0)
.s14:
20f4 : a0 04 __ LDY #$04
20f6 : b1 0d __ LDA (P0),y ; (si + 0)
20f8 : d0 1a __ BNE $2114 ; (nformi.s13 + 0)
.s1013:
20fa : 88 __ __ DEY
20fb : b1 0d __ LDA (P0),y ; (si + 0)
20fd : c9 10 __ CMP #$10
20ff : d0 13 __ BNE $2114 ; (nformi.s13 + 0)
.s11:
2101 : a9 58 __ LDA #$58
2103 : a6 44 __ LDX T2 + 0 
2105 : 9d ef bf STA $bfef,x ; (buff + 49)
2108 : 8a __ __ TXA
2109 : 18 __ __ CLC
210a : 69 fe __ ADC #$fe
210c : 85 44 __ STA T2 + 0 
210e : aa __ __ TAX
210f : a9 30 __ LDA #$30
2111 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
2114 : a9 00 __ LDA #$00
2116 : 85 1b __ STA ACCU + 0 
2118 : a5 43 __ LDA T0 + 0 
211a : f0 06 __ BEQ $2122 ; (nformi.s16 + 0)
.s15:
211c : c6 44 __ DEC T2 + 0 
211e : a9 2d __ LDA #$2d
2120 : d0 0a __ BNE $212c ; (nformi.s1025 + 0)
.s16:
2122 : a0 05 __ LDY #$05
2124 : b1 0d __ LDA (P0),y ; (si + 0)
2126 : f0 09 __ BEQ $2131 ; (nformi.s163 + 0)
.s18:
2128 : c6 44 __ DEC T2 + 0 
212a : a9 2b __ LDA #$2b
.s1025:
212c : a6 44 __ LDX T2 + 0 
212e : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
2131 : a0 06 __ LDY #$06
2133 : b1 0d __ LDA (P0),y ; (si + 0)
2135 : d0 33 __ BNE $216a ; (nformi.s24 + 0)
.l30:
2137 : a0 01 __ LDY #$01
2139 : b1 0d __ LDA (P0),y ; (si + 0)
213b : 18 __ __ CLC
213c : 65 44 __ ADC T2 + 0 
213e : b0 04 __ BCS $2144 ; (nformi.s31 + 0)
.s1006:
2140 : c9 11 __ CMP #$11
2142 : 90 0d __ BCC $2151 ; (nformi.s33 + 0)
.s31:
2144 : c6 44 __ DEC T2 + 0 
2146 : a0 00 __ LDY #$00
2148 : b1 0d __ LDA (P0),y ; (si + 0)
214a : a6 44 __ LDX T2 + 0 
214c : 9d f0 bf STA $bff0,x ; (buffer + 0)
214f : b0 e6 __ BCS $2137 ; (nformi.l30 + 0)
.s33:
2151 : a6 44 __ LDX T2 + 0 
2153 : e0 10 __ CPX #$10
2155 : b0 0e __ BCS $2165 ; (nformi.s23 + 0)
.s34:
2157 : 88 __ __ DEY
.l1022:
2158 : bd f0 bf LDA $bff0,x ; (buffer + 0)
215b : 91 0f __ STA (P2),y ; (str + 0)
215d : e8 __ __ INX
215e : e0 10 __ CPX #$10
2160 : c8 __ __ INY
2161 : 90 f5 __ BCC $2158 ; (nformi.l1022 + 0)
.s1023:
2163 : 84 1b __ STY ACCU + 0 
.s23:
2165 : a9 00 __ LDA #$00
2167 : 85 1c __ STA ACCU + 1 
.s1001:
2169 : 60 __ __ RTS
.s24:
216a : a6 44 __ LDX T2 + 0 
216c : e0 10 __ CPX #$10
216e : b0 1a __ BCS $218a ; (nformi.l27 + 0)
.s25:
2170 : a0 00 __ LDY #$00
.l1020:
2172 : bd f0 bf LDA $bff0,x ; (buffer + 0)
2175 : 91 0f __ STA (P2),y ; (str + 0)
2177 : e8 __ __ INX
2178 : e0 10 __ CPX #$10
217a : c8 __ __ INY
217b : 90 f5 __ BCC $2172 ; (nformi.l1020 + 0)
.s1021:
217d : 84 1b __ STY ACCU + 0 
217f : b0 09 __ BCS $218a ; (nformi.l27 + 0)
.s28:
2181 : 88 __ __ DEY
2182 : b1 0d __ LDA (P0),y ; (si + 0)
2184 : a4 1b __ LDY ACCU + 0 
2186 : 91 0f __ STA (P2),y ; (str + 0)
2188 : e6 1b __ INC ACCU + 0 
.l27:
218a : a5 1b __ LDA ACCU + 0 
218c : a0 01 __ LDY #$01
218e : d1 0d __ CMP (P0),y ; (si + 0)
2190 : 90 ef __ BCC $2181 ; (nformi.s28 + 0)
2192 : 4c 65 21 JMP $2165 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
2195 : a9 00 __ LDA #$00
2197 : 85 43 __ STA T0 + 0 
2199 : a5 15 __ LDA P8 ; (s + 0)
219b : f0 21 __ BEQ $21be ; (nforml.s182 + 0)
.s4:
219d : a5 14 __ LDA P7 ; (v + 3)
219f : f0 1d __ BEQ $21be ; (nforml.s182 + 0)
.s1032:
21a1 : 10 1b __ BPL $21be ; (nforml.s182 + 0)
.s1:
21a3 : 38 __ __ SEC
21a4 : a9 00 __ LDA #$00
21a6 : e5 11 __ SBC P4 ; (v + 0)
21a8 : 85 11 __ STA P4 ; (v + 0)
21aa : a9 00 __ LDA #$00
21ac : e5 12 __ SBC P5 ; (v + 1)
21ae : 85 12 __ STA P5 ; (v + 1)
21b0 : a9 00 __ LDA #$00
21b2 : e5 13 __ SBC P6 ; (v + 2)
21b4 : 85 13 __ STA P6 ; (v + 2)
21b6 : a9 00 __ LDA #$00
21b8 : e5 14 __ SBC P7 ; (v + 3)
21ba : 85 14 __ STA P7 ; (v + 3)
21bc : e6 43 __ INC T0 + 0 
.s182:
21be : a9 10 __ LDA #$10
21c0 : 85 44 __ STA T2 + 0 
21c2 : a5 14 __ LDA P7 ; (v + 3)
21c4 : d0 0c __ BNE $21d2 ; (nforml.s42 + 0)
.s1024:
21c6 : a5 13 __ LDA P6 ; (v + 2)
21c8 : d0 08 __ BNE $21d2 ; (nforml.s42 + 0)
.s1025:
21ca : a5 12 __ LDA P5 ; (v + 1)
21cc : d0 04 __ BNE $21d2 ; (nforml.s42 + 0)
.s1026:
21ce : c5 11 __ CMP P4 ; (v + 0)
21d0 : b0 0e __ BCS $21e0 ; (nforml.s7 + 0)
.s42:
21d2 : a0 03 __ LDY #$03
21d4 : b1 0d __ LDA (P0),y ; (si + 0)
21d6 : 85 45 __ STA T5 + 0 
21d8 : c8 __ __ INY
21d9 : b1 0d __ LDA (P0),y ; (si + 0)
21db : 85 46 __ STA T5 + 1 
21dd : 4c aa 22 JMP $22aa ; (nforml.l6 + 0)
.s7:
21e0 : a0 02 __ LDY #$02
21e2 : b1 0d __ LDA (P0),y ; (si + 0)
21e4 : c9 ff __ CMP #$ff
21e6 : d0 04 __ BNE $21ec ; (nforml.s80 + 0)
.s81:
21e8 : a9 0f __ LDA #$0f
21ea : d0 05 __ BNE $21f1 ; (nforml.s1039 + 0)
.s80:
21ec : 38 __ __ SEC
21ed : a9 10 __ LDA #$10
21ef : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
21f1 : a8 __ __ TAY
21f2 : c4 44 __ CPY T2 + 0 
21f4 : b0 0d __ BCS $2203 ; (nforml.s10 + 0)
.s9:
21f6 : a9 30 __ LDA #$30
.l1040:
21f8 : c6 44 __ DEC T2 + 0 
21fa : a6 44 __ LDX T2 + 0 
21fc : 9d f0 bf STA $bff0,x ; (buffer + 0)
21ff : c4 44 __ CPY T2 + 0 
2201 : 90 f5 __ BCC $21f8 ; (nforml.l1040 + 0)
.s10:
2203 : a0 07 __ LDY #$07
2205 : b1 0d __ LDA (P0),y ; (si + 0)
2207 : f0 20 __ BEQ $2229 ; (nforml.s13 + 0)
.s14:
2209 : a0 04 __ LDY #$04
220b : b1 0d __ LDA (P0),y ; (si + 0)
220d : d0 1a __ BNE $2229 ; (nforml.s13 + 0)
.s1013:
220f : 88 __ __ DEY
2210 : b1 0d __ LDA (P0),y ; (si + 0)
2212 : c9 10 __ CMP #$10
2214 : d0 13 __ BNE $2229 ; (nforml.s13 + 0)
.s11:
2216 : a9 58 __ LDA #$58
2218 : a6 44 __ LDX T2 + 0 
221a : 9d ef bf STA $bfef,x ; (buff + 49)
221d : 8a __ __ TXA
221e : 18 __ __ CLC
221f : 69 fe __ ADC #$fe
2221 : 85 44 __ STA T2 + 0 
2223 : aa __ __ TAX
2224 : a9 30 __ LDA #$30
2226 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
2229 : a9 00 __ LDA #$00
222b : 85 1b __ STA ACCU + 0 
222d : a5 43 __ LDA T0 + 0 
222f : f0 06 __ BEQ $2237 ; (nforml.s16 + 0)
.s15:
2231 : c6 44 __ DEC T2 + 0 
2233 : a9 2d __ LDA #$2d
2235 : d0 0a __ BNE $2241 ; (nforml.s1038 + 0)
.s16:
2237 : a0 05 __ LDY #$05
2239 : b1 0d __ LDA (P0),y ; (si + 0)
223b : f0 09 __ BEQ $2246 ; (nforml.s163 + 0)
.s18:
223d : c6 44 __ DEC T2 + 0 
223f : a9 2b __ LDA #$2b
.s1038:
2241 : a6 44 __ LDX T2 + 0 
2243 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
2246 : a0 06 __ LDY #$06
2248 : b1 0d __ LDA (P0),y ; (si + 0)
224a : d0 33 __ BNE $227f ; (nforml.s24 + 0)
.l30:
224c : a0 01 __ LDY #$01
224e : b1 0d __ LDA (P0),y ; (si + 0)
2250 : 18 __ __ CLC
2251 : 65 44 __ ADC T2 + 0 
2253 : b0 04 __ BCS $2259 ; (nforml.s31 + 0)
.s1006:
2255 : c9 11 __ CMP #$11
2257 : 90 0d __ BCC $2266 ; (nforml.s33 + 0)
.s31:
2259 : c6 44 __ DEC T2 + 0 
225b : a0 00 __ LDY #$00
225d : b1 0d __ LDA (P0),y ; (si + 0)
225f : a6 44 __ LDX T2 + 0 
2261 : 9d f0 bf STA $bff0,x ; (buffer + 0)
2264 : b0 e6 __ BCS $224c ; (nforml.l30 + 0)
.s33:
2266 : a6 44 __ LDX T2 + 0 
2268 : e0 10 __ CPX #$10
226a : b0 0e __ BCS $227a ; (nforml.s23 + 0)
.s34:
226c : 88 __ __ DEY
.l1035:
226d : bd f0 bf LDA $bff0,x ; (buffer + 0)
2270 : 91 0f __ STA (P2),y ; (str + 0)
2272 : e8 __ __ INX
2273 : e0 10 __ CPX #$10
2275 : c8 __ __ INY
2276 : 90 f5 __ BCC $226d ; (nforml.l1035 + 0)
.s1036:
2278 : 84 1b __ STY ACCU + 0 
.s23:
227a : a9 00 __ LDA #$00
227c : 85 1c __ STA ACCU + 1 
.s1001:
227e : 60 __ __ RTS
.s24:
227f : a6 44 __ LDX T2 + 0 
2281 : e0 10 __ CPX #$10
2283 : b0 1a __ BCS $229f ; (nforml.l27 + 0)
.s25:
2285 : a0 00 __ LDY #$00
.l1033:
2287 : bd f0 bf LDA $bff0,x ; (buffer + 0)
228a : 91 0f __ STA (P2),y ; (str + 0)
228c : e8 __ __ INX
228d : e0 10 __ CPX #$10
228f : c8 __ __ INY
2290 : 90 f5 __ BCC $2287 ; (nforml.l1033 + 0)
.s1034:
2292 : 84 1b __ STY ACCU + 0 
2294 : b0 09 __ BCS $229f ; (nforml.l27 + 0)
.s28:
2296 : 88 __ __ DEY
2297 : b1 0d __ LDA (P0),y ; (si + 0)
2299 : a4 1b __ LDY ACCU + 0 
229b : 91 0f __ STA (P2),y ; (str + 0)
229d : e6 1b __ INC ACCU + 0 
.l27:
229f : a5 1b __ LDA ACCU + 0 
22a1 : a0 01 __ LDY #$01
22a3 : d1 0d __ CMP (P0),y ; (si + 0)
22a5 : 90 ef __ BCC $2296 ; (nforml.s28 + 0)
22a7 : 4c 7a 22 JMP $227a ; (nforml.s23 + 0)
.l6:
22aa : a5 11 __ LDA P4 ; (v + 0)
22ac : 85 1b __ STA ACCU + 0 
22ae : a5 12 __ LDA P5 ; (v + 1)
22b0 : 85 1c __ STA ACCU + 1 
22b2 : a5 13 __ LDA P6 ; (v + 2)
22b4 : 85 1d __ STA ACCU + 2 
22b6 : a5 14 __ LDA P7 ; (v + 3)
22b8 : 85 1e __ STA ACCU + 3 
22ba : a5 45 __ LDA T5 + 0 
22bc : 85 03 __ STA WORK + 0 
22be : a5 46 __ LDA T5 + 1 
22c0 : 85 04 __ STA WORK + 1 
22c2 : a9 00 __ LDA #$00
22c4 : 85 05 __ STA WORK + 2 
22c6 : 85 06 __ STA WORK + 3 
22c8 : 20 9a 23 JSR $239a ; (divmod32 + 0)
22cb : a5 08 __ LDA WORK + 5 
22cd : 30 08 __ BMI $22d7 ; (nforml.s78 + 0)
.s1023:
22cf : d0 0a __ BNE $22db ; (nforml.s77 + 0)
.s1022:
22d1 : a5 07 __ LDA WORK + 4 
22d3 : c9 0a __ CMP #$0a
22d5 : b0 04 __ BCS $22db ; (nforml.s77 + 0)
.s78:
22d7 : a9 30 __ LDA #$30
22d9 : d0 02 __ BNE $22dd ; (nforml.s79 + 0)
.s77:
22db : a9 37 __ LDA #$37
.s79:
22dd : 18 __ __ CLC
22de : 65 07 __ ADC WORK + 4 
22e0 : c6 44 __ DEC T2 + 0 
22e2 : a6 44 __ LDX T2 + 0 
22e4 : 9d f0 bf STA $bff0,x ; (buffer + 0)
22e7 : a5 1b __ LDA ACCU + 0 
22e9 : 85 11 __ STA P4 ; (v + 0)
22eb : a5 1c __ LDA ACCU + 1 
22ed : 85 12 __ STA P5 ; (v + 1)
22ef : a5 1d __ LDA ACCU + 2 
22f1 : 85 13 __ STA P6 ; (v + 2)
22f3 : a5 1e __ LDA ACCU + 3 
22f5 : 85 14 __ STA P7 ; (v + 3)
22f7 : d0 b1 __ BNE $22aa ; (nforml.l6 + 0)
.s1018:
22f9 : a5 13 __ LDA P6 ; (v + 2)
22fb : d0 ad __ BNE $22aa ; (nforml.l6 + 0)
.s1019:
22fd : a5 12 __ LDA P5 ; (v + 1)
22ff : d0 a9 __ BNE $22aa ; (nforml.l6 + 0)
.s1020:
2301 : c5 11 __ CMP P4 ; (v + 0)
2303 : 90 a5 __ BCC $22aa ; (nforml.l6 + 0)
2305 : 4c e0 21 JMP $21e0 ; (nforml.s7 + 0)
--------------------------------------------------------------------
2308 : __ __ __ BYT 48 45 4c 4c 4f 20 57 4f 52 4c 44 21 00          : HELLO WORLD!.
--------------------------------------------------------------------
divmod: ; divmod
2315 : a5 1c __ LDA ACCU + 1 
2317 : d0 31 __ BNE $234a ; (divmod + 53)
2319 : a5 04 __ LDA WORK + 1 
231b : d0 1e __ BNE $233b ; (divmod + 38)
231d : 85 06 __ STA WORK + 3 
231f : a2 04 __ LDX #$04
2321 : 06 1b __ ASL ACCU + 0 
2323 : 2a __ __ ROL
2324 : c5 03 __ CMP WORK + 0 
2326 : 90 02 __ BCC $232a ; (divmod + 21)
2328 : e5 03 __ SBC WORK + 0 
232a : 26 1b __ ROL ACCU + 0 
232c : 2a __ __ ROL
232d : c5 03 __ CMP WORK + 0 
232f : 90 02 __ BCC $2333 ; (divmod + 30)
2331 : e5 03 __ SBC WORK + 0 
2333 : 26 1b __ ROL ACCU + 0 
2335 : ca __ __ DEX
2336 : d0 eb __ BNE $2323 ; (divmod + 14)
2338 : 85 05 __ STA WORK + 2 
233a : 60 __ __ RTS
233b : a5 1b __ LDA ACCU + 0 
233d : 85 05 __ STA WORK + 2 
233f : a5 1c __ LDA ACCU + 1 
2341 : 85 06 __ STA WORK + 3 
2343 : a9 00 __ LDA #$00
2345 : 85 1b __ STA ACCU + 0 
2347 : 85 1c __ STA ACCU + 1 
2349 : 60 __ __ RTS
234a : a5 04 __ LDA WORK + 1 
234c : d0 1f __ BNE $236d ; (divmod + 88)
234e : a5 03 __ LDA WORK + 0 
2350 : 30 1b __ BMI $236d ; (divmod + 88)
2352 : a9 00 __ LDA #$00
2354 : 85 06 __ STA WORK + 3 
2356 : a2 10 __ LDX #$10
2358 : 06 1b __ ASL ACCU + 0 
235a : 26 1c __ ROL ACCU + 1 
235c : 2a __ __ ROL
235d : c5 03 __ CMP WORK + 0 
235f : 90 02 __ BCC $2363 ; (divmod + 78)
2361 : e5 03 __ SBC WORK + 0 
2363 : 26 1b __ ROL ACCU + 0 
2365 : 26 1c __ ROL ACCU + 1 
2367 : ca __ __ DEX
2368 : d0 f2 __ BNE $235c ; (divmod + 71)
236a : 85 05 __ STA WORK + 2 
236c : 60 __ __ RTS
236d : a9 00 __ LDA #$00
236f : 85 05 __ STA WORK + 2 
2371 : 85 06 __ STA WORK + 3 
2373 : 84 02 __ STY $02 
2375 : a0 10 __ LDY #$10
2377 : 18 __ __ CLC
2378 : 26 1b __ ROL ACCU + 0 
237a : 26 1c __ ROL ACCU + 1 
237c : 26 05 __ ROL WORK + 2 
237e : 26 06 __ ROL WORK + 3 
2380 : 38 __ __ SEC
2381 : a5 05 __ LDA WORK + 2 
2383 : e5 03 __ SBC WORK + 0 
2385 : aa __ __ TAX
2386 : a5 06 __ LDA WORK + 3 
2388 : e5 04 __ SBC WORK + 1 
238a : 90 04 __ BCC $2390 ; (divmod + 123)
238c : 86 05 __ STX WORK + 2 
238e : 85 06 __ STA WORK + 3 
2390 : 88 __ __ DEY
2391 : d0 e5 __ BNE $2378 ; (divmod + 99)
2393 : 26 1b __ ROL ACCU + 0 
2395 : 26 1c __ ROL ACCU + 1 
2397 : a4 02 __ LDY $02 
2399 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
239a : 84 02 __ STY $02 
239c : a0 20 __ LDY #$20
239e : a9 00 __ LDA #$00
23a0 : 85 07 __ STA WORK + 4 
23a2 : 85 08 __ STA WORK + 5 
23a4 : 85 09 __ STA WORK + 6 
23a6 : 85 0a __ STA WORK + 7 
23a8 : a5 05 __ LDA WORK + 2 
23aa : 05 06 __ ORA WORK + 3 
23ac : d0 39 __ BNE $23e7 ; (divmod32 + 77)
23ae : 18 __ __ CLC
23af : 26 1b __ ROL ACCU + 0 
23b1 : 26 1c __ ROL ACCU + 1 
23b3 : 26 1d __ ROL ACCU + 2 
23b5 : 26 1e __ ROL ACCU + 3 
23b7 : 26 07 __ ROL WORK + 4 
23b9 : 26 08 __ ROL WORK + 5 
23bb : 90 0c __ BCC $23c9 ; (divmod32 + 47)
23bd : a5 07 __ LDA WORK + 4 
23bf : e5 03 __ SBC WORK + 0 
23c1 : aa __ __ TAX
23c2 : a5 08 __ LDA WORK + 5 
23c4 : e5 04 __ SBC WORK + 1 
23c6 : 38 __ __ SEC
23c7 : b0 0c __ BCS $23d5 ; (divmod32 + 59)
23c9 : 38 __ __ SEC
23ca : a5 07 __ LDA WORK + 4 
23cc : e5 03 __ SBC WORK + 0 
23ce : aa __ __ TAX
23cf : a5 08 __ LDA WORK + 5 
23d1 : e5 04 __ SBC WORK + 1 
23d3 : 90 04 __ BCC $23d9 ; (divmod32 + 63)
23d5 : 86 07 __ STX WORK + 4 
23d7 : 85 08 __ STA WORK + 5 
23d9 : 88 __ __ DEY
23da : d0 d3 __ BNE $23af ; (divmod32 + 21)
23dc : 26 1b __ ROL ACCU + 0 
23de : 26 1c __ ROL ACCU + 1 
23e0 : 26 1d __ ROL ACCU + 2 
23e2 : 26 1e __ ROL ACCU + 3 
23e4 : a4 02 __ LDY $02 
23e6 : 60 __ __ RTS
23e7 : 18 __ __ CLC
23e8 : 26 1b __ ROL ACCU + 0 
23ea : 26 1c __ ROL ACCU + 1 
23ec : 26 1d __ ROL ACCU + 2 
23ee : 26 1e __ ROL ACCU + 3 
23f0 : 26 07 __ ROL WORK + 4 
23f2 : 26 08 __ ROL WORK + 5 
23f4 : 26 09 __ ROL WORK + 6 
23f6 : 26 0a __ ROL WORK + 7 
23f8 : a5 07 __ LDA WORK + 4 
23fa : c5 03 __ CMP WORK + 0 
23fc : a5 08 __ LDA WORK + 5 
23fe : e5 04 __ SBC WORK + 1 
2400 : a5 09 __ LDA WORK + 6 
2402 : e5 05 __ SBC WORK + 2 
2404 : a5 0a __ LDA WORK + 7 
2406 : e5 06 __ SBC WORK + 3 
2408 : 90 18 __ BCC $2422 ; (divmod32 + 136)
240a : a5 07 __ LDA WORK + 4 
240c : e5 03 __ SBC WORK + 0 
240e : 85 07 __ STA WORK + 4 
2410 : a5 08 __ LDA WORK + 5 
2412 : e5 04 __ SBC WORK + 1 
2414 : 85 08 __ STA WORK + 5 
2416 : a5 09 __ LDA WORK + 6 
2418 : e5 05 __ SBC WORK + 2 
241a : 85 09 __ STA WORK + 6 
241c : a5 0a __ LDA WORK + 7 
241e : e5 06 __ SBC WORK + 3 
2420 : 85 0a __ STA WORK + 7 
2422 : 88 __ __ DEY
2423 : d0 c3 __ BNE $23e8 ; (divmod32 + 78)
2425 : 26 1b __ ROL ACCU + 0 
2427 : 26 1c __ ROL ACCU + 1 
2429 : 26 1d __ ROL ACCU + 2 
242b : 26 1e __ ROL ACCU + 3 
242d : a4 02 __ LDY $02 
242f : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
2430 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
2431 : __ __ __ BYT 01                                              : .
