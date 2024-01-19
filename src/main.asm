--------------------------------------------------------------------
bootdevice:
00f7 : __ __ __ BYT 00                                              : .
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
1c13 : 8e ff 42 STX $42ff ; (spentry + 0)
1c16 : a9 d8 __ LDA #$d8
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 51 __ LDA #$51
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 52 __ LDA #$52
1c21 : e9 51 __ SBC #$51
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
1c35 : a9 e1 __ LDA #$e1
1c37 : e9 d8 __ SBC #$d8
1c39 : f0 08 __ BEQ $1c43 ; (startup + 66)
1c3b : a8 __ __ TAY
1c3c : a9 00 __ LDA #$00
1c3e : 88 __ __ DEY
1c3f : 91 19 __ STA (IP + 0),y 
1c41 : d0 fb __ BNE $1c3e ; (startup + 61)
1c43 : a2 f7 __ LDX #$f7
1c45 : e0 f8 __ CPX #$f8
1c47 : f0 07 __ BEQ $1c50 ; (startup + 79)
1c49 : 95 00 __ STA $00,x 
1c4b : e8 __ __ INX
1c4c : e0 f8 __ CPX #$f8
1c4e : d0 f9 __ BNE $1c49 ; (startup + 72)
1c50 : a9 4d __ LDA #$4d
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
1c80 : a2 10 __ LDX #$10
1c82 : b5 53 __ LDA T0 + 0,x 
1c84 : 9d 4f bf STA $bf4f,x ; (main@stack + 0)
1c87 : ca __ __ DEX
1c88 : 10 f8 __ BPL $1c82 ; (main.s1000 + 2)
1c8a : 38 __ __ SEC
1c8b : a5 23 __ LDA SP + 0 
1c8d : e9 0e __ SBC #$0e
1c8f : 85 23 __ STA SP + 0 
1c91 : b0 02 __ BCS $1c95 ; (main.s0 + 0)
1c93 : c6 24 __ DEC SP + 1 
.s0:
1c95 : a2 10 __ LDX #$10
.l1002:
1c97 : bd c1 50 LDA $50c1,x ; (vdc_prints@proxy + 14)
1c9a : 9d 81 bf STA $bf81,x ; (vp_fill + 31)
1c9d : ca __ __ DEX
1c9e : d0 f7 __ BNE $1c97 ; (main.l1002 + 0)
.s1003:
1ca0 : a9 1a __ LDA #$1a
1ca2 : 8d 00 d6 STA $d600 
.l10984:
1ca5 : 2c 00 d6 BIT $d600 
1ca8 : 10 fb __ BPL $1ca5 ; (main.l10984 + 0)
.s9:
1caa : ad 01 d6 LDA $d601 
1cad : 29 f0 __ AND #$f0
1caf : a8 __ __ TAY
1cb0 : a9 1a __ LDA #$1a
1cb2 : 8d 00 d6 STA $d600 
.l10986:
1cb5 : 2c 00 d6 BIT $d600 
1cb8 : 10 fb __ BPL $1cb5 ; (main.l10986 + 0)
.s15:
1cba : 8c 01 d6 STY $d601 
1cbd : 8d 00 d6 STA $d600 
.l10988:
1cc0 : 2c 00 d6 BIT $d600 
1cc3 : 10 fb __ BPL $1cc0 ; (main.l10988 + 0)
.s22:
1cc5 : ad 01 d6 LDA $d601 
1cc8 : 29 0f __ AND #$0f
1cca : 09 d0 __ ORA #$d0
1ccc : a8 __ __ TAY
1ccd : a9 1a __ LDA #$1a
1ccf : 8d 00 d6 STA $d600 
.l10990:
1cd2 : 2c 00 d6 BIT $d600 
1cd5 : 10 fb __ BPL $1cd2 ; (main.l10990 + 0)
.s28:
1cd7 : 8c 01 d6 STY $d601 
1cda : a9 8d __ LDA #$8d
1cdc : 8d da 50 STA $50da ; (vdc_state + 7)
1cdf : a9 1c __ LDA #$1c
1ce1 : 8d 00 d6 STA $d600 
.l10992:
1ce4 : 2c 00 d6 BIT $d600 
1ce7 : 10 fb __ BPL $1ce4 ; (main.l10992 + 0)
.s34:
1ce9 : ad 01 d6 LDA $d601 
1cec : a8 __ __ TAY
1ced : 09 10 __ ORA #$10
1cef : 85 54 __ STA T1 + 0 
1cf1 : a9 1c __ LDA #$1c
1cf3 : 8d 00 d6 STA $d600 
.l10994:
1cf6 : 2c 00 d6 BIT $d600 
1cf9 : 10 fb __ BPL $1cf6 ; (main.l10994 + 0)
.s41:
1cfb : a5 54 __ LDA T1 + 0 
1cfd : 8d 01 d6 STA $d601 
1d00 : a9 12 __ LDA #$12
1d02 : 8d 00 d6 STA $d600 
.l10996:
1d05 : 2c 00 d6 BIT $d600 
1d08 : 10 fb __ BPL $1d05 ; (main.l10996 + 0)
.s48:
1d0a : a9 1f __ LDA #$1f
1d0c : 8d 01 d6 STA $d601 
1d0f : a9 13 __ LDA #$13
1d11 : 8d 00 d6 STA $d600 
.l10998:
1d14 : 2c 00 d6 BIT $d600 
1d17 : 10 fb __ BPL $1d14 ; (main.l10998 + 0)
.s53:
1d19 : a9 ff __ LDA #$ff
1d1b : 8d 01 d6 STA $d601 
1d1e : a9 1f __ LDA #$1f
1d20 : 8d 00 d6 STA $d600 
.l11000:
1d23 : 2c 00 d6 BIT $d600 
1d26 : 10 fb __ BPL $1d23 ; (main.l11000 + 0)
.s57:
1d28 : 8e 01 d6 STX $d601 
1d2b : a9 12 __ LDA #$12
1d2d : 8d 00 d6 STA $d600 
.l11002:
1d30 : 2c 00 d6 BIT $d600 
1d33 : 10 fb __ BPL $1d30 ; (main.l11002 + 0)
.s64:
1d35 : a9 9f __ LDA #$9f
1d37 : 8d 01 d6 STA $d601 
1d3a : a9 13 __ LDA #$13
1d3c : 8d 00 d6 STA $d600 
.l11004:
1d3f : 2c 00 d6 BIT $d600 
1d42 : 10 fb __ BPL $1d3f ; (main.l11004 + 0)
.s69:
1d44 : a9 ff __ LDA #$ff
1d46 : 8d 01 d6 STA $d601 
1d49 : a9 1f __ LDA #$1f
1d4b : 8d 00 d6 STA $d600 
.l11006:
1d4e : 2c 00 d6 BIT $d600 
1d51 : 10 fb __ BPL $1d4e ; (main.l11006 + 0)
.s73:
1d53 : a9 ff __ LDA #$ff
1d55 : 8d 01 d6 STA $d601 
1d58 : a9 12 __ LDA #$12
1d5a : 8d 00 d6 STA $d600 
.l11008:
1d5d : 2c 00 d6 BIT $d600 
1d60 : 10 fb __ BPL $1d5d ; (main.l11008 + 0)
.s80:
1d62 : a9 1f __ LDA #$1f
1d64 : 8d 01 d6 STA $d601 
1d67 : a9 13 __ LDA #$13
1d69 : 8d 00 d6 STA $d600 
.l11010:
1d6c : 2c 00 d6 BIT $d600 
1d6f : 10 fb __ BPL $1d6c ; (main.l11010 + 0)
.s85:
1d71 : a9 ff __ LDA #$ff
1d73 : 8d 01 d6 STA $d601 
1d76 : a9 1f __ LDA #$1f
1d78 : 8d 00 d6 STA $d600 
.l11012:
1d7b : 2c 00 d6 BIT $d600 
1d7e : 10 fb __ BPL $1d7b ; (main.l11012 + 0)
.s89:
1d80 : ad 01 d6 LDA $d601 
1d83 : f0 04 __ BEQ $1d89 ; (main.s1689 + 0)
.s1690:
1d85 : a9 10 __ LDA #$10
1d87 : d0 02 __ BNE $1d8b ; (main.s1691 + 0)
.s1689:
1d89 : a9 40 __ LDA #$40
.s1691:
1d8b : 8d d3 50 STA $50d3 ; (vdc_state + 0)
1d8e : a9 1c __ LDA #$1c
1d90 : 8d 00 d6 STA $d600 
.l11015:
1d93 : 2c 00 d6 BIT $d600 
1d96 : 10 fb __ BPL $1d93 ; (main.l11015 + 0)
.s96:
1d98 : 86 53 __ STX T0 + 0 
1d9a : 8c 01 d6 STY $d601 
1d9d : ad d6 50 LDA $50d6 ; (vdc_state + 3)
1da0 : 85 54 __ STA T1 + 0 
1da2 : ad d8 50 LDA $50d8 ; (vdc_state + 5)
1da5 : 85 57 __ STA T3 + 0 
.l99:
1da7 : a5 53 __ LDA T0 + 0 
1da9 : c5 57 __ CMP T3 + 0 
1dab : b0 03 __ BCS $1db0 ; (main.s29 + 0)
1dad : 4c b2 3b JMP $3bb2 ; (main.s100 + 0)
.s29:
1db0 : 24 d7 __ BIT $d7 
1db2 : 30 17 __ BMI $1dcb ; (main.s11042 + 0)
.s177:
1db4 : a9 00 __ LDA #$00
1db6 : a0 02 __ LDY #$02
1db8 : 91 23 __ STA (SP + 0),y 
1dba : a9 43 __ LDA #$43
1dbc : c8 __ __ INY
1dbd : 91 23 __ STA (SP + 0),y 
1dbf : 20 8d 3c JSR $3c8d ; (printf.s1000 + 0)
1dc2 : 20 ea 42 JSR $42ea ; (getch.s0 + 0)
1dc5 : 20 f8 42 JSR $42f8 ; (clrscr.s0 + 0)
1dc8 : 20 5c 43 JSR $435c ; (screen_setmode.s0 + 0)
.s11042:
1dcb : a5 ba __ LDA $ba 
1dcd : d0 02 __ BNE $1dd1 ; (main.s185 + 0)
.s183:
1dcf : a9 08 __ LDA #$08
.s185:
1dd1 : 85 53 __ STA T0 + 0 
1dd3 : 85 f7 __ STA $f7 ; (bootdevice + 0)
1dd5 : a9 64 __ LDA #$64
1dd7 : a0 02 __ LDY #$02
1dd9 : 91 23 __ STA (SP + 0),y 
1ddb : a9 43 __ LDA #$43
1ddd : c8 __ __ INY
1dde : 91 23 __ STA (SP + 0),y 
1de0 : a5 53 __ LDA T0 + 0 
1de2 : c8 __ __ INY
1de3 : 91 23 __ STA (SP + 0),y 
1de5 : a9 00 __ LDA #$00
1de7 : c8 __ __ INY
1de8 : 91 23 __ STA (SP + 0),y 
1dea : 20 8d 3c JSR $3c8d ; (printf.s1000 + 0)
1ded : a9 06 __ LDA #$06
1def : 8d 06 d5 STA $d506 
1df2 : a9 74 __ LDA #$74
1df4 : a0 02 __ LDY #$02
1df6 : 91 23 __ STA (SP + 0),y 
1df8 : a9 43 __ LDA #$43
1dfa : c8 __ __ INY
1dfb : 91 23 __ STA (SP + 0),y 
1dfd : 20 8d 3c JSR $3c8d ; (printf.s1000 + 0)
1e00 : a9 00 __ LDA #$00
1e02 : 85 0d __ STA P0 
1e04 : 85 0e __ STA P1 
1e06 : 20 93 43 JSR $4393 ; (krnio_setbnk.s0 + 0)
1e09 : a9 8e __ LDA #$8e
1e0b : 85 0d __ STA P0 
1e0d : a9 43 __ LDA #$43
1e0f : 85 0e __ STA P1 
1e11 : 20 9b 43 JSR $439b ; (krnio_setnam.s0 + 0)
1e14 : a9 01 __ LDA #$01
1e16 : 85 0d __ STA P0 
1e18 : 85 0f __ STA P2 
1e1a : a5 53 __ LDA T0 + 0 
1e1c : 85 0e __ STA P1 
1e1e : 20 b1 43 JSR $43b1 ; (krnio_load.s0 + 0)
1e21 : 09 00 __ ORA #$00
1e23 : d0 11 __ BNE $1e36 ; (main.s192 + 0)
.s188:
1e25 : a9 ce __ LDA #$ce
1e27 : a0 02 __ LDY #$02
1e29 : 91 23 __ STA (SP + 0),y 
1e2b : a9 43 __ LDA #$43
1e2d : c8 __ __ INY
1e2e : 91 23 __ STA (SP + 0),y 
1e30 : 20 8d 3c JSR $3c8d ; (printf.s1000 + 0)
1e33 : 20 ec 43 JSR $43ec ; (exit@proxy + 0)
.s192:
1e36 : a9 01 __ LDA #$01
1e38 : 8d 30 d0 STA $d030 
1e3b : a9 00 __ LDA #$00
1e3d : 85 13 __ STA P6 
1e3f : ad 11 d0 LDA $d011 
1e42 : 29 6f __ AND #$6f
1e44 : 8d 11 d0 STA $d011 
1e47 : 20 09 44 JSR $4409 ; (vdc_set_mode.s1000 + 0)
1e4a : ad d3 50 LDA $50d3 ; (vdc_state + 0)
1e4d : c9 40 __ CMP #$40
1e4f : f0 03 __ BEQ $1e54 ; (main.s198 + 0)
1e51 : 4c 6b 1f JMP $1f6b ; (main.s2 + 0)
.s198:
1e54 : ad d4 50 LDA $50d4 ; (vdc_state + 1)
1e57 : f0 03 __ BEQ $1e5c ; (main.s202 + 0)
1e59 : 4c 6b 1f JMP $1f6b ; (main.s2 + 0)
.s202:
1e5c : a9 22 __ LDA #$22
1e5e : 8d 00 d6 STA $d600 
.l11575:
1e61 : 2c 00 d6 BIT $d600 
1e64 : 10 fb __ BPL $1e61 ; (main.l11575 + 0)
.s210:
1e66 : a9 80 __ LDA #$80
1e68 : 8d 01 d6 STA $d601 
1e6b : a2 00 __ LDX #$00
1e6d : a0 ff __ LDY #$ff
.l213:
1e6f : a9 12 __ LDA #$12
1e71 : 8d 00 d6 STA $d600 
.l11577:
1e74 : 2c 00 d6 BIT $d600 
1e77 : 10 fb __ BPL $1e74 ; (main.l11577 + 0)
.s222:
1e79 : 8e 01 d6 STX $d601 
1e7c : a9 13 __ LDA #$13
1e7e : 8d 00 d6 STA $d600 
.l11579:
1e81 : 2c 00 d6 BIT $d600 
1e84 : 10 fb __ BPL $1e81 ; (main.l11579 + 0)
.s227:
1e86 : a9 00 __ LDA #$00
1e88 : 8d 01 d6 STA $d601 
1e8b : a9 1f __ LDA #$1f
1e8d : 8d 00 d6 STA $d600 
.l11581:
1e90 : 2c 00 d6 BIT $d600 
1e93 : 10 fb __ BPL $1e90 ; (main.l11581 + 0)
.s231:
1e95 : a9 00 __ LDA #$00
1e97 : 8d 01 d6 STA $d601 
1e9a : a9 18 __ LDA #$18
1e9c : 8d 00 d6 STA $d600 
.l11583:
1e9f : 2c 00 d6 BIT $d600 
1ea2 : 10 fb __ BPL $1e9f ; (main.l11583 + 0)
.s237:
1ea4 : ad 01 d6 LDA $d601 
1ea7 : 29 7f __ AND #$7f
1ea9 : 85 57 __ STA T3 + 0 
1eab : a9 18 __ LDA #$18
1ead : 8d 00 d6 STA $d600 
.l11585:
1eb0 : 2c 00 d6 BIT $d600 
1eb3 : 10 fb __ BPL $1eb0 ; (main.l11585 + 0)
.s243:
1eb5 : a5 57 __ LDA T3 + 0 
1eb7 : 8d 01 d6 STA $d601 
1eba : a9 1e __ LDA #$1e
1ebc : 8d 00 d6 STA $d600 
.l11587:
1ebf : 2c 00 d6 BIT $d600 
1ec2 : 10 fb __ BPL $1ebf ; (main.l11587 + 0)
.s248:
1ec4 : a9 ff __ LDA #$ff
1ec6 : 8d 01 d6 STA $d601 
1ec9 : e8 __ __ INX
1eca : 88 __ __ DEY
1ecb : d0 a2 __ BNE $1e6f ; (main.l213 + 0)
.s215:
1ecd : a9 12 __ LDA #$12
1ecf : 8d 00 d6 STA $d600 
.l11590:
1ed2 : 2c 00 d6 BIT $d600 
1ed5 : 10 fb __ BPL $1ed2 ; (main.l11590 + 0)
.s255:
1ed7 : 8e 01 d6 STX $d601 
1eda : a9 13 __ LDA #$13
1edc : 8d 00 d6 STA $d600 
.l11592:
1edf : 2c 00 d6 BIT $d600 
1ee2 : 10 fb __ BPL $1edf ; (main.l11592 + 0)
.s260:
1ee4 : 8c 01 d6 STY $d601 
1ee7 : a9 1f __ LDA #$1f
1ee9 : 8d 00 d6 STA $d600 
.l11594:
1eec : 2c 00 d6 BIT $d600 
1eef : 10 fb __ BPL $1eec ; (main.l11594 + 0)
.s264:
1ef1 : 8c 01 d6 STY $d601 
1ef4 : a9 18 __ LDA #$18
1ef6 : 8d 00 d6 STA $d600 
.l11596:
1ef9 : 2c 00 d6 BIT $d600 
1efc : 10 fb __ BPL $1ef9 ; (main.l11596 + 0)
.s270:
1efe : ad 01 d6 LDA $d601 
1f01 : 29 7f __ AND #$7f
1f03 : aa __ __ TAX
1f04 : a9 18 __ LDA #$18
1f06 : 8d 00 d6 STA $d600 
.l11598:
1f09 : 2c 00 d6 BIT $d600 
1f0c : 10 fb __ BPL $1f09 ; (main.l11598 + 0)
.s276:
1f0e : 8e 01 d6 STX $d601 
1f11 : a9 1e __ LDA #$1e
1f13 : 8d 00 d6 STA $d600 
.l11600:
1f16 : 2c 00 d6 BIT $d600 
1f19 : 10 fb __ BPL $1f16 ; (main.l11600 + 0)
.s281:
1f1b : a9 ff __ LDA #$ff
1f1d : 8d 01 d6 STA $d601 
1f20 : a9 1c __ LDA #$1c
1f22 : 8d 00 d6 STA $d600 
.l11602:
1f25 : 2c 00 d6 BIT $d600 
1f28 : 10 fb __ BPL $1f25 ; (main.l11602 + 0)
.s287:
1f2a : ad 01 d6 LDA $d601 
1f2d : 09 10 __ ORA #$10
1f2f : aa __ __ TAX
1f30 : a9 1c __ LDA #$1c
1f32 : 8d 00 d6 STA $d600 
.l11604:
1f35 : 2c 00 d6 BIT $d600 
1f38 : 10 fb __ BPL $1f35 ; (main.l11604 + 0)
.s293:
1f3a : 8e 01 d6 STX $d601 
1f3d : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
1f40 : a9 00 __ LDA #$00
1f42 : 85 53 __ STA T0 + 0 
1f44 : ad d6 50 LDA $50d6 ; (vdc_state + 3)
1f47 : 85 54 __ STA T1 + 0 
1f49 : ad d8 50 LDA $50d8 ; (vdc_state + 5)
1f4c : 85 57 __ STA T3 + 0 
.l297:
1f4e : a5 53 __ LDA T0 + 0 
1f50 : c5 57 __ CMP T3 + 0 
1f52 : b0 03 __ BCS $1f57 ; (main.s295 + 0)
1f54 : 4c d7 3a JMP $3ad7 ; (main.s298 + 0)
.s295:
1f57 : a9 22 __ LDA #$22
1f59 : 8d 00 d6 STA $d600 
.l11630:
1f5c : 2c 00 d6 BIT $d600 
1f5f : 10 fb __ BPL $1f5c ; (main.l11630 + 0)
.s375:
1f61 : a9 7d __ LDA #$7d
1f63 : 8d 01 d6 STA $d601 
1f66 : a9 01 __ LDA #$01
1f68 : 8d d4 50 STA $50d4 ; (vdc_state + 1)
.s2:
1f6b : a9 00 __ LDA #$00
1f6d : 85 0d __ STA P0 
1f6f : a9 09 __ LDA #$09
1f71 : 85 0e __ STA P1 
1f73 : a9 4a __ LDA #$4a
1f75 : 85 0f __ STA P2 
1f77 : 20 e8 48 JSR $48e8 ; (vdc_prints.s0 + 0)
1f7a : a9 90 __ LDA #$90
1f7c : a0 02 __ LDY #$02
1f7e : 91 23 __ STA (SP + 0),y 
1f80 : a9 52 __ LDA #$52
1f82 : c8 __ __ INY
1f83 : 91 23 __ STA (SP + 0),y 
1f85 : a9 4a __ LDA #$4a
1f87 : c8 __ __ INY
1f88 : 91 23 __ STA (SP + 0),y 
1f8a : a9 4d __ LDA #$4d
1f8c : c8 __ __ INY
1f8d : 91 23 __ STA (SP + 0),y 
1f8f : ad d3 50 LDA $50d3 ; (vdc_state + 0)
1f92 : c8 __ __ INY
1f93 : 91 23 __ STA (SP + 0),y 
1f95 : a9 00 __ LDA #$00
1f97 : c8 __ __ INY
1f98 : 91 23 __ STA (SP + 0),y 
1f9a : ad d4 50 LDA $50d4 ; (vdc_state + 1)
1f9d : d0 07 __ BNE $1fa6 ; (main.s5750 + 0)
.s5751:
1f9f : a9 4d __ LDA #$4d
1fa1 : a2 7f __ LDX #$7f
1fa3 : 4c aa 1f JMP $1faa ; (main.s5752 + 0)
.s5750:
1fa6 : a9 42 __ LDA #$42
1fa8 : a2 fc __ LDX #$fc
.s5752:
1faa : 85 58 __ STA T3 + 1 
1fac : 8a __ __ TXA
1fad : a0 08 __ LDY #$08
1faf : 91 23 __ STA (SP + 0),y 
1fb1 : a5 58 __ LDA T3 + 1 
1fb3 : c8 __ __ INY
1fb4 : 91 23 __ STA (SP + 0),y 
1fb6 : 20 24 4a JSR $4a24 ; (sprintf.s1000 + 0)
1fb9 : 20 b3 50 JSR $50b3 ; (vdc_prints@proxy + 0)
1fbc : a9 04 __ LDA #$04
1fbe : 85 0d __ STA P0 
1fc0 : a9 83 __ LDA #$83
1fc2 : 85 0e __ STA P1 
1fc4 : a9 4d __ LDA #$4d
1fc6 : 85 0f __ STA P2 
1fc8 : 20 e8 48 JSR $48e8 ; (vdc_prints.s0 + 0)
1fcb : e6 0d __ INC P0 
1fcd : a9 93 __ LDA #$93
1fcf : 85 0e __ STA P1 
1fd1 : a9 4d __ LDA #$4d
1fd3 : 85 0f __ STA P2 
1fd5 : 20 e8 48 JSR $48e8 ; (vdc_prints.s0 + 0)
1fd8 : a5 f7 __ LDA $f7 ; (bootdevice + 0)
1fda : 85 53 __ STA T0 + 0 
1fdc : 85 0f __ STA P2 
1fde : a9 00 __ LDA #$00
1fe0 : 85 10 __ STA P3 
1fe2 : a9 20 __ LDA #$20
1fe4 : 85 11 __ STA P4 
1fe6 : a9 ae __ LDA #$ae
1fe8 : 85 12 __ STA P5 
1fea : a9 4d __ LDA #$4d
1fec : 85 13 __ STA P6 
1fee : 20 8a 13 JSR $138a ; (bnk_load.s0 + 0)
1ff1 : a5 1b __ LDA ACCU + 0 
1ff3 : d0 0a __ BNE $1fff ; (main.s378 + 0)
.s376:
1ff5 : a9 06 __ LDA #$06
1ff7 : 85 0d __ STA P0 
1ff9 : 20 e0 48 JSR $48e0 ; (vdc_prints@proxy + 0)
1ffc : 20 ec 43 JSR $43ec ; (exit@proxy + 0)
.s378:
1fff : a9 06 __ LDA #$06
2001 : 85 0d __ STA P0 
2003 : a9 c2 __ LDA #$c2
2005 : 85 0e __ STA P1 
2007 : a9 4d __ LDA #$4d
2009 : 85 0f __ STA P2 
200b : 20 e8 48 JSR $48e8 ; (vdc_prints.s0 + 0)
200e : a5 53 __ LDA T0 + 0 
2010 : 85 0f __ STA P2 
2012 : a9 00 __ LDA #$00
2014 : 85 56 __ STA T2 + 0 
2016 : 85 10 __ STA P3 
2018 : a9 80 __ LDA #$80
201a : 85 11 __ STA P4 
201c : a9 df __ LDA #$df
201e : 85 12 __ STA P5 
2020 : a9 4d __ LDA #$4d
2022 : 85 13 __ STA P6 
2024 : 20 8a 13 JSR $138a ; (bnk_load.s0 + 0)
2027 : a5 1b __ LDA ACCU + 0 
2029 : d0 0a __ BNE $2035 ; (main.s8484 + 0)
.s379:
202b : a9 07 __ LDA #$07
202d : 85 0d __ STA P0 
202f : 20 e0 48 JSR $48e0 ; (vdc_prints@proxy + 0)
2032 : 20 ec 43 JSR $43ec ; (exit@proxy + 0)
.s8484:
2035 : ad 86 bf LDA $bf86 ; (softscroll + 4)
2038 : 85 1b __ STA ACCU + 0 
203a : a9 00 __ LDA #$00
203c : 85 1c __ STA ACCU + 1 
203e : ad 85 bf LDA $bf85 ; (softscroll + 3)
2041 : 85 54 __ STA T1 + 0 
2043 : 20 30 4f JSR $4f30 ; (mul16by8 + 0)
2046 : a5 05 __ LDA WORK + 2 
2048 : 85 57 __ STA T3 + 0 
204a : 0a __ __ ASL
204b : aa __ __ TAX
204c : a5 06 __ LDA WORK + 3 
204e : 85 58 __ STA T3 + 1 
2050 : 2a __ __ ROL
2051 : a8 __ __ TAY
2052 : 8a __ __ TXA
2053 : 18 __ __ CLC
2054 : 69 30 __ ADC #$30
2056 : 85 59 __ STA T4 + 0 
2058 : 90 01 __ BCC $205b ; (main.s1693 + 0)
.s1692:
205a : c8 __ __ INY
.s1693:
205b : 84 5a __ STY T4 + 1 
205d : a9 20 __ LDA #$20
205f : c5 5a __ CMP T4 + 1 
2061 : d0 04 __ BNE $2067 ; (main.s1008 + 0)
.s1007:
2063 : a9 00 __ LDA #$00
2065 : c5 59 __ CMP T4 + 0 
.s1008:
2067 : a9 00 __ LDA #$00
2069 : 2a __ __ ROL
206a : 49 01 __ EOR #$01
206c : 85 53 __ STA T0 + 0 
206e : f0 08 __ BEQ $2078 ; (main.l393 + 0)
.l394:
2070 : ad d4 50 LDA $50d4 ; (vdc_state + 1)
2073 : d0 03 __ BNE $2078 ; (main.l393 + 0)
2075 : 4c 5f 23 JMP $235f ; (main.s8214 + 0)
.l393:
2078 : a9 e0 __ LDA #$e0
207a : c5 5a __ CMP T4 + 1 
207c : d0 04 __ BNE $2082 ; (main.s1563 + 0)
.s1562:
207e : a9 00 __ LDA #$00
2080 : c5 59 __ CMP T4 + 0 
.s1563:
2082 : b0 03 __ BCS $2087 ; (main.s392 + 0)
2084 : 4c 5f 23 JMP $235f ; (main.s8214 + 0)
.s392:
2087 : a5 56 __ LDA T2 + 0 
2089 : cd d5 50 CMP $50d5 ; (vdc_state + 2)
208c : f0 05 __ BEQ $2093 ; (main.s398 + 0)
.s396:
208e : 85 13 __ STA P6 
2090 : 20 09 44 JSR $4409 ; (vdc_set_mode.s1000 + 0)
.s398:
2093 : a9 00 __ LDA #$00
2095 : 8d db 50 STA $50db ; (vdc_state + 8)
2098 : 8d e3 50 STA $50e3 ; (vdc_state + 16)
209b : 8d e4 50 STA $50e4 ; (vdc_state + 17)
209e : 8d e5 50 STA $50e5 ; (vdc_state + 18)
20a1 : a9 20 __ LDA #$20
20a3 : 8d dc 50 STA $50dc ; (vdc_state + 9)
20a6 : a9 10 __ LDA #$10
20a8 : 8d e6 50 STA $50e6 ; (vdc_state + 19)
20ab : 18 __ __ CLC
20ac : a5 58 __ LDA T3 + 1 
20ae : 69 20 __ ADC #$20
20b0 : 8d de 50 STA $50de ; (vdc_state + 11)
20b3 : a5 57 __ LDA T3 + 0 
20b5 : 8d dd 50 STA $50dd ; (vdc_state + 10)
20b8 : ad d6 50 LDA $50d6 ; (vdc_state + 3)
20bb : 85 5b __ STA T5 + 0 
20bd : 49 ff __ EOR #$ff
20bf : 38 __ __ SEC
20c0 : 65 54 __ ADC T1 + 0 
20c2 : 8d eb 50 STA $50eb ; (vdc_state + 24)
20c5 : ad d9 50 LDA $50d9 ; (vdc_state + 6)
20c8 : 85 60 __ STA T7 + 1 
20ca : ad d8 50 LDA $50d8 ; (vdc_state + 5)
20cd : 85 5f __ STA T7 + 0 
20cf : 05 60 __ ORA T7 + 1 
20d1 : f0 4b __ BEQ $211e ; (main.s399 + 0)
.s2854:
20d3 : ad eb 50 LDA $50eb ; (vdc_state + 24)
20d6 : 18 __ __ CLC
20d7 : 65 5b __ ADC T5 + 0 
20d9 : 85 5d __ STA T6 + 0 
20db : a9 00 __ LDA #$00
20dd : 6d d7 50 ADC $50d7 ; (vdc_state + 4)
20e0 : 85 5e __ STA T6 + 1 
20e2 : a9 00 __ LDA #$00
20e4 : 85 1b __ STA ACCU + 0 
20e6 : 85 1c __ STA ACCU + 1 
20e8 : a9 00 __ LDA #$00
20ea : 85 62 __ STA T12 + 0 
20ec : a9 52 __ LDA #$52
20ee : 85 63 __ STA T12 + 1 
20f0 : a2 00 __ LDX #$00
.l401:
20f2 : a5 1b __ LDA ACCU + 0 
20f4 : a0 00 __ LDY #$00
20f6 : 91 62 __ STA (T12 + 0),y 
20f8 : a5 1c __ LDA ACCU + 1 
20fa : c8 __ __ INY
20fb : 91 62 __ STA (T12 + 0),y 
20fd : 18 __ __ CLC
20fe : a5 5d __ LDA T6 + 0 
2100 : 65 1b __ ADC ACCU + 0 
2102 : 85 1b __ STA ACCU + 0 
2104 : a5 5e __ LDA T6 + 1 
2106 : 65 1c __ ADC ACCU + 1 
2108 : 85 1c __ STA ACCU + 1 
210a : 18 __ __ CLC
210b : a5 62 __ LDA T12 + 0 
210d : 69 02 __ ADC #$02
210f : 85 62 __ STA T12 + 0 
2111 : 90 02 __ BCC $2115 ; (main.s1722 + 0)
.s1721:
2113 : e6 63 __ INC T12 + 1 
.s1722:
2115 : e8 __ __ INX
2116 : a5 60 __ LDA T7 + 1 
2118 : d0 d8 __ BNE $20f2 ; (main.l401 + 0)
.s1558:
211a : e4 5f __ CPX T7 + 0 
211c : 90 d4 __ BCC $20f2 ; (main.l401 + 0)
.s399:
211e : 85 61 __ STA T8 + 0 
2120 : c5 5f __ CMP T7 + 0 
2122 : b0 03 __ BCS $2127 ; (main.s404 + 0)
2124 : 4c f3 39 JMP $39f3 ; (main.l407 + 0)
.s404:
2127 : ad e3 50 LDA $50e3 ; (vdc_state + 16)
212a : 85 0d __ STA P0 
212c : ad e4 50 LDA $50e4 ; (vdc_state + 17)
212f : 85 0e __ STA P1 
2131 : a9 1c __ LDA #$1c
2133 : 8d 00 d6 STA $d600 
.l11445:
2136 : 2c 00 d6 BIT $d600 
2139 : 10 fb __ BPL $2136 ; (main.l11445 + 0)
.s485:
213b : ad 01 d6 LDA $d601 
213e : 29 10 __ AND #$10
2140 : 45 0e __ EOR P1 
2142 : 29 1f __ AND #$1f
2144 : 45 0e __ EOR P1 
2146 : aa __ __ TAX
2147 : a9 1c __ LDA #$1c
2149 : 8d 00 d6 STA $d600 
.l11447:
214c : 2c 00 d6 BIT $d600 
214f : 10 fb __ BPL $214c ; (main.l11447 + 0)
.s491:
2151 : 8e 01 d6 STX $d601 
2154 : 20 0a 13 JSR $130a ; (bnk_redef_charset.s0 + 0)
2157 : ad db 50 LDA $50db ; (vdc_state + 8)
215a : 85 0d __ STA P0 
215c : ad dd 50 LDA $50dd ; (vdc_state + 10)
215f : 85 5d __ STA T6 + 0 
2161 : ad de 50 LDA $50de ; (vdc_state + 11)
2164 : 85 5e __ STA T6 + 1 
2166 : a9 0c __ LDA #$0c
2168 : 8d 00 d6 STA $d600 
216b : ae dc 50 LDX $50dc ; (vdc_state + 9)
216e : 86 0e __ STX P1 
.l11449:
2170 : 2c 00 d6 BIT $d600 
2173 : 10 fb __ BPL $2170 ; (main.l11449 + 0)
.s498:
2175 : 8e 01 d6 STX $d601 
2178 : a9 0d __ LDA #$0d
217a : 8d 00 d6 STA $d600 
.l11451:
217d : 2c 00 d6 BIT $d600 
2180 : 10 fb __ BPL $217d ; (main.l11451 + 0)
.s503:
2182 : a5 0d __ LDA P0 
2184 : 8d 01 d6 STA $d601 
2187 : a9 14 __ LDA #$14
2189 : 8d 00 d6 STA $d600 
.l11453:
218c : 2c 00 d6 BIT $d600 
218f : 10 fb __ BPL $218c ; (main.l11453 + 0)
.s508:
2191 : a5 5e __ LDA T6 + 1 
2193 : 8d 01 d6 STA $d601 
2196 : a9 15 __ LDA #$15
2198 : 8d 00 d6 STA $d600 
.l11455:
219b : 2c 00 d6 BIT $d600 
219e : 10 fb __ BPL $219b ; (main.l11455 + 0)
.s513:
21a0 : a5 5d __ LDA T6 + 0 
21a2 : 8d 01 d6 STA $d601 
21a5 : a9 1b __ LDA #$1b
21a7 : 8d 00 d6 STA $d600 
21aa : ae eb 50 LDX $50eb ; (vdc_state + 24)
.l11457:
21ad : 2c 00 d6 BIT $d600 
21b0 : 10 fb __ BPL $21ad ; (main.l11457 + 0)
.s518:
21b2 : 8e 01 d6 STX $d601 
21b5 : a5 57 __ LDA T3 + 0 
21b7 : 85 12 __ STA P5 
21b9 : a5 58 __ LDA T3 + 1 
21bb : 85 13 __ STA P6 
21bd : ad 82 bf LDA $bf82 ; (softscroll + 0)
21c0 : 85 0f __ STA P2 
21c2 : ad 83 bf LDA $bf83 ; (softscroll + 1)
21c5 : 85 5b __ STA T5 + 0 
21c7 : 85 10 __ STA P3 
21c9 : ad 84 bf LDA $bf84 ; (softscroll + 2)
21cc : 85 5c __ STA T5 + 1 
21ce : 85 11 __ STA P4 
21d0 : 20 d1 13 JSR $13d1 ; (bnk_cpytovdc.s0 + 0)
21d3 : a5 5d __ LDA T6 + 0 
21d5 : 85 0d __ STA P0 
21d7 : a5 5e __ LDA T6 + 1 
21d9 : 85 0e __ STA P1 
21db : 18 __ __ CLC
21dc : a5 5b __ LDA T5 + 0 
21de : 65 12 __ ADC P5 
21e0 : aa __ __ TAX
21e1 : a5 58 __ LDA T3 + 1 
21e3 : 85 13 __ STA P6 
21e5 : 65 5c __ ADC T5 + 1 
21e7 : a8 __ __ TAY
21e8 : 8a __ __ TXA
21e9 : 18 __ __ CLC
21ea : 69 30 __ ADC #$30
21ec : 85 10 __ STA P3 
21ee : 90 01 __ BCC $21f1 ; (main.s1724 + 0)
.s1723:
21f0 : c8 __ __ INY
.s1724:
21f1 : 84 11 __ STY P4 
21f3 : 20 d1 13 JSR $13d1 ; (bnk_cpytovdc.s0 + 0)
21f6 : a9 00 __ LDA #$00
21f8 : 8d 87 bf STA $bf87 ; (softscroll + 5)
21fb : 8d 88 bf STA $bf88 ; (softscroll + 6)
21fe : 8d 89 bf STA $bf89 ; (softscroll + 7)
2201 : 8d 8a bf STA $bf8a ; (softscroll + 8)
2204 : a9 18 __ LDA #$18
2206 : 8d 00 d6 STA $d600 
.l11459:
2209 : 2c 00 d6 BIT $d600 
220c : 10 fb __ BPL $2209 ; (main.l11459 + 0)
.s523:
220e : ad 01 d6 LDA $d601 
2211 : 29 f0 __ AND #$f0
2213 : 8d 8b bf STA $bf8b ; (softscroll + 9)
2216 : a9 19 __ LDA #$19
2218 : 8d 00 d6 STA $d600 
.l11461:
221b : 2c 00 d6 BIT $d600 
221e : 10 fb __ BPL $221b ; (main.l11461 + 0)
.s530:
2220 : ad 01 d6 LDA $d601 
2223 : 29 0f __ AND #$0f
2225 : 8d 91 bf STA $bf91 ; (softscroll + 15)
2228 : a9 19 __ LDA #$19
222a : 8d 00 d6 STA $d600 
.l11463:
222d : 2c 00 d6 BIT $d600 
2230 : 10 fb __ BPL $222d ; (main.l11463 + 0)
.s537:
2232 : a9 00 __ LDA #$00
2234 : 8d 8d bf STA $bf8d ; (softscroll + 11)
2237 : 8d 8e bf STA $bf8e ; (softscroll + 12)
223a : 8d 8f bf STA $bf8f ; (softscroll + 13)
223d : 8d 90 bf STA $bf90 ; (softscroll + 14)
2240 : ad 01 d6 LDA $d601 
2243 : 29 f0 __ AND #$f0
2245 : 8d 8c bf STA $bf8c ; (softscroll + 10)
.l541:
2248 : 20 ea 42 JSR $42ea ; (getch.s0 + 0)
224b : a5 1b __ LDA ACCU + 0 
224d : c9 57 __ CMP #$57
224f : f0 04 __ BEQ $2255 ; (main.s543 + 0)
.s546:
2251 : c9 91 __ CMP #$91
2253 : d0 10 __ BNE $2265 ; (main.s545 + 0)
.s543:
2255 : ad 90 bf LDA $bf90 ; (softscroll + 14)
2258 : 85 5e __ STA T6 + 1 
225a : ad 8f bf LDA $bf8f ; (softscroll + 13)
225d : aa __ __ TAX
225e : 05 5e __ ORA T6 + 1 
2260 : f0 03 __ BEQ $2265 ; (main.s545 + 0)
2262 : 4c 2a 39 JMP $392a ; (main.l547 + 0)
.s545:
2265 : a5 1b __ LDA ACCU + 0 
2267 : c9 53 __ CMP #$53
2269 : f0 04 __ BEQ $226f ; (main.s595 + 0)
.s598:
226b : c9 11 __ CMP #$11
226d : d0 23 __ BNE $2292 ; (main.s597 + 0)
.s595:
226f : ad 86 bf LDA $bf86 ; (softscroll + 4)
2272 : 0a __ __ ASL
2273 : 85 5d __ STA T6 + 0 
2275 : a9 00 __ LDA #$00
2277 : 2a __ __ ROL
2278 : 06 5d __ ASL T6 + 0 
227a : 2a __ __ ROL
227b : 06 5d __ ASL T6 + 0 
227d : 2a __ __ ROL
227e : 85 5e __ STA T6 + 1 
2280 : ad 90 bf LDA $bf90 ; (softscroll + 14)
2283 : a8 __ __ TAY
2284 : ae 8f bf LDX $bf8f ; (softscroll + 13)
2287 : c5 5e __ CMP T6 + 1 
2289 : d0 02 __ BNE $228d ; (main.s1489 + 0)
.s1488:
228b : e4 5d __ CPX T6 + 0 
.s1489:
228d : b0 03 __ BCS $2292 ; (main.s597 + 0)
228f : 4c 77 38 JMP $3877 ; (main.l599 + 0)
.s597:
2292 : a5 1b __ LDA ACCU + 0 
2294 : c9 41 __ CMP #$41
2296 : f0 04 __ BEQ $229c ; (main.s644 + 0)
.s647:
2298 : c9 9d __ CMP #$9d
229a : d0 39 __ BNE $22d5 ; (main.s646 + 0)
.s644:
229c : ad 8d bf LDA $bf8d ; (softscroll + 11)
229f : 0d 8e bf ORA $bf8e ; (softscroll + 12)
22a2 : f0 31 __ BEQ $22d5 ; (main.s646 + 0)
.s648:
22a4 : ad 8f bf LDA $bf8f ; (softscroll + 13)
22a7 : 38 __ __ SEC
22a8 : e9 02 __ SBC #$02
22aa : 8d 8f bf STA $bf8f ; (softscroll + 13)
22ad : b0 03 __ BCS $22b2 ; (main.s1726 + 0)
.s1725:
22af : ce 90 bf DEC $bf90 ; (softscroll + 14)
.s1726:
22b2 : ad 8a bf LDA $bf8a ; (softscroll + 8)
22b5 : 18 __ __ CLC
22b6 : 69 02 __ ADC #$02
22b8 : 8d 8a bf STA $bf8a ; (softscroll + 8)
22bb : c9 07 __ CMP #$07
22bd : 90 03 __ BCC $22c2 ; (main.s653 + 0)
22bf : 4c e7 37 JMP $37e7 ; (main.s652 + 0)
.s653:
22c2 : a9 19 __ LDA #$19
22c4 : 8d 00 d6 STA $d600 
22c7 : ad 8c bf LDA $bf8c ; (softscroll + 10)
22ca : 6d 8a bf ADC $bf8a ; (softscroll + 8)
.l11555:
22cd : 2c 00 d6 BIT $d600 
22d0 : 10 fb __ BPL $22cd ; (main.l11555 + 0)
.s1686:
22d2 : 8d 01 d6 STA $d601 
.s646:
22d5 : a5 1b __ LDA ACCU + 0 
22d7 : c9 44 __ CMP #$44
22d9 : f0 04 __ BEQ $22df ; (main.s696 + 0)
.s699:
22db : c9 1d __ CMP #$1d
22dd : d0 22 __ BNE $2301 ; (main.s698 + 0)
.s696:
22df : ad 85 bf LDA $bf85 ; (softscroll + 3)
22e2 : 0a __ __ ASL
22e3 : 85 5d __ STA T6 + 0 
22e5 : a9 00 __ LDA #$00
22e7 : 2a __ __ ROL
22e8 : 06 5d __ ASL T6 + 0 
22ea : 2a __ __ ROL
22eb : 06 5d __ ASL T6 + 0 
22ed : 2a __ __ ROL
22ee : 85 5e __ STA T6 + 1 
22f0 : ad 8e bf LDA $bf8e ; (softscroll + 12)
22f3 : c5 5e __ CMP T6 + 1 
22f5 : d0 05 __ BNE $22fc ; (main.s1451 + 0)
.s1450:
22f7 : ad 8d bf LDA $bf8d ; (softscroll + 11)
22fa : c5 5d __ CMP T6 + 0 
.s1451:
22fc : b0 03 __ BCS $2301 ; (main.s698 + 0)
22fe : 4c 22 37 JMP $3722 ; (main.s700 + 0)
.s698:
2301 : a5 1b __ LDA ACCU + 0 
2303 : c9 1b __ CMP #$1b
2305 : f0 07 __ BEQ $230e ; (main.s542 + 0)
.s747:
2307 : c9 03 __ CMP #$03
2309 : f0 03 __ BEQ $230e ; (main.s542 + 0)
230b : 4c 48 22 JMP $2248 ; (main.l541 + 0)
.s542:
230e : a9 00 __ LDA #$00
2310 : 85 61 __ STA T8 + 0 
2312 : ad d6 50 LDA $50d6 ; (vdc_state + 3)
2315 : 85 5b __ STA T5 + 0 
2317 : ad d8 50 LDA $50d8 ; (vdc_state + 5)
231a : 85 5d __ STA T6 + 0 
.l751:
231c : a5 61 __ LDA T8 + 0 
231e : c5 5d __ CMP T6 + 0 
2320 : b0 03 __ BCS $2325 ; (main.s749 + 0)
2322 : 4c 47 36 JMP $3647 ; (main.s752 + 0)
.s749:
2325 : a9 1b __ LDA #$1b
2327 : 8d 00 d6 STA $d600 
.l11533:
232a : 2c 00 d6 BIT $d600 
232d : 10 fb __ BPL $232a ; (main.l11533 + 0)
.s828:
232f : a9 00 __ LDA #$00
2331 : 8d 01 d6 STA $d601 
2334 : a9 18 __ LDA #$18
2336 : 8d 00 d6 STA $d600 
2339 : ae 8b bf LDX $bf8b ; (softscroll + 9)
.l11535:
233c : 2c 00 d6 BIT $d600 
233f : 10 fb __ BPL $233c ; (main.l11535 + 0)
.s833:
2341 : 8e 01 d6 STX $d601 
2344 : a9 19 __ LDA #$19
2346 : 8d 00 d6 STA $d600 
2349 : ad 91 bf LDA $bf91 ; (softscroll + 15)
234c : 18 __ __ CLC
234d : 6d 8c bf ADC $bf8c ; (softscroll + 10)
.l11537:
2350 : 2c 00 d6 BIT $d600 
2353 : 10 fb __ BPL $2350 ; (main.l11537 + 0)
.s838:
2355 : 8d 01 d6 STA $d601 
2358 : a5 56 __ LDA T2 + 0 
235a : 85 13 __ STA P6 
235c : 20 09 44 JSR $4409 ; (vdc_set_mode.s1000 + 0)
.s8214:
235f : e6 56 __ INC T2 + 0 
2361 : a5 56 __ LDA T2 + 0 
2363 : c9 03 __ CMP #$03
2365 : b0 0a __ BCS $2371 ; (main.s385 + 0)
.s383:
2367 : a5 53 __ LDA T0 + 0 
2369 : d0 03 __ BNE $236e ; (main.s383 + 7)
236b : 4c 78 20 JMP $2078 ; (main.l393 + 0)
236e : 4c 70 20 JMP $2070 ; (main.l394 + 0)
.s385:
2371 : a9 00 __ LDA #$00
2373 : 85 53 __ STA T0 + 0 
.l840:
2375 : 85 13 __ STA P6 
2377 : 20 09 44 JSR $4409 ; (vdc_set_mode.s1000 + 0)
237a : ad db 50 LDA $50db ; (vdc_state + 8)
237d : 85 57 __ STA T3 + 0 
237f : ad dc 50 LDA $50dc ; (vdc_state + 9)
2382 : 85 58 __ STA T3 + 1 
2384 : a9 12 __ LDA #$12
2386 : 8d 00 d6 STA $d600 
2389 : ad 00 52 LDA $5200 ; (multab + 0)
238c : 18 __ __ CLC
238d : 65 57 __ ADC T3 + 0 
238f : aa __ __ TAX
2390 : ad 01 52 LDA $5201 ; (multab + 1)
2393 : a8 __ __ TAY
2394 : 65 58 __ ADC T3 + 1 
.l11051:
2396 : 2c 00 d6 BIT $d600 
2399 : 10 fb __ BPL $2396 ; (main.l11051 + 0)
.s852:
239b : 8d 01 d6 STA $d601 
239e : a9 13 __ LDA #$13
23a0 : 8d 00 d6 STA $d600 
.l11053:
23a3 : 2c 00 d6 BIT $d600 
23a6 : 10 fb __ BPL $23a3 ; (main.l11053 + 0)
.s857:
23a8 : 8e 01 d6 STX $d601 
23ab : a9 1f __ LDA #$1f
23ad : 8d 00 d6 STA $d600 
.l11055:
23b0 : 2c 00 d6 BIT $d600 
23b3 : 10 fb __ BPL $23b0 ; (main.l11055 + 0)
.s861:
23b5 : a9 20 __ LDA #$20
23b7 : 8d 01 d6 STA $d601 
23ba : a9 18 __ LDA #$18
23bc : 8d 00 d6 STA $d600 
.l11057:
23bf : 2c 00 d6 BIT $d600 
23c2 : 10 fb __ BPL $23bf ; (main.l11057 + 0)
.s867:
23c4 : ad 01 d6 LDA $d601 
23c7 : 29 7f __ AND #$7f
23c9 : aa __ __ TAX
23ca : a9 18 __ LDA #$18
23cc : 8d 00 d6 STA $d600 
.l11059:
23cf : 2c 00 d6 BIT $d600 
23d2 : 10 fb __ BPL $23cf ; (main.l11059 + 0)
.s873:
23d4 : 8e 01 d6 STX $d601 
23d7 : a9 1e __ LDA #$1e
23d9 : 8d 00 d6 STA $d600 
.l11061:
23dc : 2c 00 d6 BIT $d600 
23df : 10 fb __ BPL $23dc ; (main.l11061 + 0)
.s878:
23e1 : a9 4e __ LDA #$4e
23e3 : 8d 01 d6 STA $d601 
23e6 : ad de 50 LDA $50de ; (vdc_state + 11)
23e9 : 85 5a __ STA T4 + 1 
23eb : a9 12 __ LDA #$12
23ed : 8d 00 d6 STA $d600 
23f0 : ad dd 50 LDA $50dd ; (vdc_state + 10)
23f3 : 85 59 __ STA T4 + 0 
23f5 : 18 __ __ CLC
23f6 : 6d 00 52 ADC $5200 ; (multab + 0)
23f9 : aa __ __ TAX
23fa : 98 __ __ TYA
23fb : 65 5a __ ADC T4 + 1 
.l11063:
23fd : 2c 00 d6 BIT $d600 
2400 : 10 fb __ BPL $23fd ; (main.l11063 + 0)
.s885:
2402 : 8d 01 d6 STA $d601 
2405 : a9 13 __ LDA #$13
2407 : 8d 00 d6 STA $d600 
.l11065:
240a : 2c 00 d6 BIT $d600 
240d : 10 fb __ BPL $240a ; (main.l11065 + 0)
.s890:
240f : 8e 01 d6 STX $d601 
2412 : a9 1f __ LDA #$1f
2414 : 8d 00 d6 STA $d600 
.l11067:
2417 : 2c 00 d6 BIT $d600 
241a : 10 fb __ BPL $2417 ; (main.l11067 + 0)
.s894:
241c : a9 c5 __ LDA #$c5
241e : 8d 01 d6 STA $d601 
2421 : a9 18 __ LDA #$18
2423 : 8d 00 d6 STA $d600 
.l11069:
2426 : 2c 00 d6 BIT $d600 
2429 : 10 fb __ BPL $2426 ; (main.l11069 + 0)
.s900:
242b : ad 01 d6 LDA $d601 
242e : 29 7f __ AND #$7f
2430 : aa __ __ TAX
2431 : a9 18 __ LDA #$18
2433 : 8d 00 d6 STA $d600 
.l11071:
2436 : 2c 00 d6 BIT $d600 
2439 : 10 fb __ BPL $2436 ; (main.l11071 + 0)
.s906:
243b : 8e 01 d6 STX $d601 
243e : a9 1e __ LDA #$1e
2440 : 8d 00 d6 STA $d600 
.l11073:
2443 : 2c 00 d6 BIT $d600 
2446 : 10 fb __ BPL $2443 ; (main.l11073 + 0)
.s911:
2448 : a9 4e __ LDA #$4e
244a : 8d 01 d6 STA $d601 
244d : a9 00 __ LDA #$00
244f : 85 0d __ STA P0 
2451 : ad da 50 LDA $50da ; (vdc_state + 7)
2454 : 29 f0 __ AND #$f0
2456 : 09 45 __ ORA #$45
2458 : 85 54 __ STA T1 + 0 
245a : 8d da 50 STA $50da ; (vdc_state + 7)
245d : a9 e7 __ LDA #$e7
245f : 85 0e __ STA P1 
2461 : a9 4d __ LDA #$4d
2463 : 85 0f __ STA P2 
2465 : 20 e8 48 JSR $48e8 ; (vdc_prints.s0 + 0)
2468 : a5 54 __ LDA T1 + 0 
246a : 29 b0 __ AND #$b0
246c : 09 0d __ ORA #$0d
246e : 8d da 50 STA $50da ; (vdc_state + 7)
2471 : a9 90 __ LDA #$90
2473 : a0 02 __ LDY #$02
2475 : 91 23 __ STA (SP + 0),y 
2477 : a9 52 __ LDA #$52
2479 : c8 __ __ INY
247a : 91 23 __ STA (SP + 0),y 
247c : a9 00 __ LDA #$00
247e : c8 __ __ INY
247f : 91 23 __ STA (SP + 0),y 
2481 : a9 4e __ LDA #$4e
2483 : c8 __ __ INY
2484 : 91 23 __ STA (SP + 0),y 
2486 : ad d3 50 LDA $50d3 ; (vdc_state + 0)
2489 : c8 __ __ INY
248a : 91 23 __ STA (SP + 0),y 
248c : a9 00 __ LDA #$00
248e : c8 __ __ INY
248f : 91 23 __ STA (SP + 0),y 
2491 : ad d6 50 LDA $50d6 ; (vdc_state + 3)
2494 : c8 __ __ INY
2495 : 91 23 __ STA (SP + 0),y 
2497 : ad d7 50 LDA $50d7 ; (vdc_state + 4)
249a : c8 __ __ INY
249b : 91 23 __ STA (SP + 0),y 
249d : ad d8 50 LDA $50d8 ; (vdc_state + 5)
24a0 : 85 5b __ STA T5 + 0 
24a2 : c8 __ __ INY
24a3 : 91 23 __ STA (SP + 0),y 
24a5 : ad d9 50 LDA $50d9 ; (vdc_state + 6)
24a8 : c8 __ __ INY
24a9 : 91 23 __ STA (SP + 0),y 
24ab : ad d4 50 LDA $50d4 ; (vdc_state + 1)
24ae : d0 07 __ BNE $24b7 ; (main.s5759 + 0)
.s5760:
24b0 : a9 4d __ LDA #$4d
24b2 : a2 fc __ LDX #$fc
24b4 : 4c bb 24 JMP $24bb ; (main.s5761 + 0)
.s5759:
24b7 : a9 4d __ LDA #$4d
24b9 : a2 f8 __ LDX #$f8
.s5761:
24bb : 85 5e __ STA T6 + 1 
24bd : 8a __ __ TXA
24be : a0 0c __ LDY #$0c
24c0 : 91 23 __ STA (SP + 0),y 
24c2 : a5 5e __ LDA T6 + 1 
24c4 : c8 __ __ INY
24c5 : 91 23 __ STA (SP + 0),y 
24c7 : 20 24 4a JSR $4a24 ; (sprintf.s1000 + 0)
24ca : 20 b3 50 JSR $50b3 ; (vdc_prints@proxy + 0)
24cd : e6 0d __ INC P0 
24cf : a9 3c __ LDA #$3c
24d1 : 85 0e __ STA P1 
24d3 : a9 4e __ LDA #$4e
24d5 : 85 0f __ STA P2 
24d7 : 20 e8 48 JSR $48e8 ; (vdc_prints.s0 + 0)
24da : a6 5b __ LDX T5 + 0 
24dc : ca __ __ DEX
24dd : 86 0d __ STX P0 
24df : a9 71 __ LDA #$71
24e1 : 85 0e __ STA P1 
24e3 : a9 4e __ LDA #$4e
24e5 : 85 0f __ STA P2 
24e7 : 20 e8 48 JSR $48e8 ; (vdc_prints.s0 + 0)
24ea : ad 08 52 LDA $5208 ; (multab + 8)
24ed : aa __ __ TAX
24ee : 18 __ __ CLC
24ef : 69 04 __ ADC #$04
24f1 : a8 __ __ TAY
24f2 : a9 12 __ LDA #$12
24f4 : 8d 00 d6 STA $d600 
24f7 : ad 09 52 LDA $5209 ; (multab + 9)
24fa : 85 55 __ STA T1 + 1 
24fc : 69 00 __ ADC #$00
24fe : 85 5e __ STA T6 + 1 
2500 : 98 __ __ TYA
2501 : 18 __ __ CLC
2502 : 65 57 __ ADC T3 + 0 
2504 : 85 5f __ STA T7 + 0 
2506 : a5 5e __ LDA T6 + 1 
2508 : 65 58 __ ADC T3 + 1 
.l11076:
250a : 2c 00 d6 BIT $d600 
250d : 10 fb __ BPL $250a ; (main.l11076 + 0)
.s925:
250f : 8d 01 d6 STA $d601 
2512 : a9 13 __ LDA #$13
2514 : 8d 00 d6 STA $d600 
.l11078:
2517 : 2c 00 d6 BIT $d600 
251a : 10 fb __ BPL $2517 ; (main.l11078 + 0)
.s930:
251c : a5 5f __ LDA T7 + 0 
251e : 8d 01 d6 STA $d601 
2521 : a9 1f __ LDA #$1f
2523 : 8d 00 d6 STA $d600 
.l11080:
2526 : 2c 00 d6 BIT $d600 
2529 : 10 fb __ BPL $2526 ; (main.l11080 + 0)
.s934:
252b : a9 6c __ LDA #$6c
252d : 8d 01 d6 STA $d601 
2530 : a9 12 __ LDA #$12
2532 : 8d 00 d6 STA $d600 
2535 : 98 __ __ TYA
2536 : 18 __ __ CLC
2537 : 65 59 __ ADC T4 + 0 
2539 : a8 __ __ TAY
253a : a5 5e __ LDA T6 + 1 
253c : 65 5a __ ADC T4 + 1 
.l11082:
253e : 2c 00 d6 BIT $d600 
2541 : 10 fb __ BPL $253e ; (main.l11082 + 0)
.s941:
2543 : 8d 01 d6 STA $d601 
2546 : a9 13 __ LDA #$13
2548 : 8d 00 d6 STA $d600 
.l11084:
254b : 2c 00 d6 BIT $d600 
254e : 10 fb __ BPL $254b ; (main.l11084 + 0)
.s946:
2550 : 8c 01 d6 STY $d601 
2553 : a9 1f __ LDA #$1f
2555 : 8d 00 d6 STA $d600 
.l11086:
2558 : 2c 00 d6 BIT $d600 
255b : 10 fb __ BPL $2558 ; (main.l11086 + 0)
.s950:
255d : a9 09 __ LDA #$09
255f : 8d 01 d6 STA $d601 
2562 : a9 12 __ LDA #$12
2564 : 8d 00 d6 STA $d600 
2567 : 8a __ __ TXA
2568 : 18 __ __ CLC
2569 : 69 05 __ ADC #$05
256b : a8 __ __ TAY
256c : a5 55 __ LDA T1 + 1 
256e : 69 00 __ ADC #$00
2570 : 85 5e __ STA T6 + 1 
2572 : 98 __ __ TYA
2573 : 18 __ __ CLC
2574 : 65 57 __ ADC T3 + 0 
2576 : 85 5f __ STA T7 + 0 
2578 : a5 5e __ LDA T6 + 1 
257a : 65 58 __ ADC T3 + 1 
.l11088:
257c : 2c 00 d6 BIT $d600 
257f : 10 fb __ BPL $257c ; (main.l11088 + 0)
.s960:
2581 : 8d 01 d6 STA $d601 
2584 : a9 13 __ LDA #$13
2586 : 8d 00 d6 STA $d600 
.l11090:
2589 : 2c 00 d6 BIT $d600 
258c : 10 fb __ BPL $2589 ; (main.l11090 + 0)
.s965:
258e : a5 5f __ LDA T7 + 0 
2590 : 8d 01 d6 STA $d601 
2593 : a9 1f __ LDA #$1f
2595 : 8d 00 d6 STA $d600 
.l11092:
2598 : 2c 00 d6 BIT $d600 
259b : 10 fb __ BPL $2598 ; (main.l11092 + 0)
.s969:
259d : a9 62 __ LDA #$62
259f : 8d 01 d6 STA $d601 
25a2 : a9 18 __ LDA #$18
25a4 : 8d 00 d6 STA $d600 
.l11094:
25a7 : 2c 00 d6 BIT $d600 
25aa : 10 fb __ BPL $25a7 ; (main.l11094 + 0)
.s975:
25ac : ad 01 d6 LDA $d601 
25af : 29 7f __ AND #$7f
25b1 : 85 5f __ STA T7 + 0 
25b3 : a9 18 __ LDA #$18
25b5 : 8d 00 d6 STA $d600 
.l11096:
25b8 : 2c 00 d6 BIT $d600 
25bb : 10 fb __ BPL $25b8 ; (main.l11096 + 0)
.s981:
25bd : a5 5f __ LDA T7 + 0 
25bf : 8d 01 d6 STA $d601 
25c2 : a9 1e __ LDA #$1e
25c4 : 8d 00 d6 STA $d600 
.l11098:
25c7 : 2c 00 d6 BIT $d600 
25ca : 10 fb __ BPL $25c7 ; (main.l11098 + 0)
.s986:
25cc : a9 45 __ LDA #$45
25ce : 8d 01 d6 STA $d601 
25d1 : a9 12 __ LDA #$12
25d3 : 8d 00 d6 STA $d600 
25d6 : 98 __ __ TYA
25d7 : 18 __ __ CLC
25d8 : 65 59 __ ADC T4 + 0 
25da : a8 __ __ TAY
25db : a5 5e __ LDA T6 + 1 
25dd : 65 5a __ ADC T4 + 1 
.l11100:
25df : 2c 00 d6 BIT $d600 
25e2 : 10 fb __ BPL $25df ; (main.l11100 + 0)
.s993:
25e4 : 8d 01 d6 STA $d601 
25e7 : a9 13 __ LDA #$13
25e9 : 8d 00 d6 STA $d600 
.l11102:
25ec : 2c 00 d6 BIT $d600 
25ef : 10 fb __ BPL $25ec ; (main.l11102 + 0)
.s998:
25f1 : 8c 01 d6 STY $d601 
25f4 : a9 1f __ LDA #$1f
25f6 : 8d 00 d6 STA $d600 
.l11104:
25f9 : 2c 00 d6 BIT $d600 
25fc : 10 fb __ BPL $25f9 ; (main.l11104 + 0)
.s1002:
25fe : a9 09 __ LDA #$09
2600 : 8d 01 d6 STA $d601 
2603 : a9 18 __ LDA #$18
2605 : 8d 00 d6 STA $d600 
.l11106:
2608 : 2c 00 d6 BIT $d600 
260b : 10 fb __ BPL $2608 ; (main.l11106 + 0)
.s1008:
260d : ad 01 d6 LDA $d601 
2610 : 29 7f __ AND #$7f
2612 : a8 __ __ TAY
2613 : a9 18 __ LDA #$18
2615 : 8d 00 d6 STA $d600 
.l11108:
2618 : 2c 00 d6 BIT $d600 
261b : 10 fb __ BPL $2618 ; (main.l11108 + 0)
.s1014:
261d : 8c 01 d6 STY $d601 
2620 : a9 1e __ LDA #$1e
2622 : 8d 00 d6 STA $d600 
.l11110:
2625 : 2c 00 d6 BIT $d600 
2628 : 10 fb __ BPL $2625 ; (main.l11110 + 0)
.s1019:
262a : a9 45 __ LDA #$45
262c : 8d 01 d6 STA $d601 
262f : a9 12 __ LDA #$12
2631 : 8d 00 d6 STA $d600 
2634 : 8a __ __ TXA
2635 : 18 __ __ CLC
2636 : 69 4b __ ADC #$4b
2638 : aa __ __ TAX
2639 : 90 02 __ BCC $263d ; (main.s1695 + 0)
.s1694:
263b : e6 55 __ INC T1 + 1 
.s1695:
263d : 18 __ __ CLC
263e : 65 57 __ ADC T3 + 0 
2640 : a8 __ __ TAY
2641 : a5 55 __ LDA T1 + 1 
2643 : 65 58 __ ADC T3 + 1 
.l11112:
2645 : 2c 00 d6 BIT $d600 
2648 : 10 fb __ BPL $2645 ; (main.l11112 + 0)
.s1029:
264a : 8d 01 d6 STA $d601 
264d : a9 13 __ LDA #$13
264f : 8d 00 d6 STA $d600 
.l11114:
2652 : 2c 00 d6 BIT $d600 
2655 : 10 fb __ BPL $2652 ; (main.l11114 + 0)
.s1034:
2657 : 8c 01 d6 STY $d601 
265a : a9 1f __ LDA #$1f
265c : 8d 00 d6 STA $d600 
.l11116:
265f : 2c 00 d6 BIT $d600 
2662 : 10 fb __ BPL $265f ; (main.l11116 + 0)
.s1038:
2664 : a9 7b __ LDA #$7b
2666 : 8d 01 d6 STA $d601 
2669 : a9 12 __ LDA #$12
266b : 8d 00 d6 STA $d600 
266e : 8a __ __ TXA
266f : 18 __ __ CLC
2670 : 65 59 __ ADC T4 + 0 
2672 : aa __ __ TAX
2673 : a5 55 __ LDA T1 + 1 
2675 : 65 5a __ ADC T4 + 1 
.l11118:
2677 : 2c 00 d6 BIT $d600 
267a : 10 fb __ BPL $2677 ; (main.l11118 + 0)
.s1045:
267c : 8d 01 d6 STA $d601 
267f : a9 13 __ LDA #$13
2681 : 8d 00 d6 STA $d600 
.l11120:
2684 : 2c 00 d6 BIT $d600 
2687 : 10 fb __ BPL $2684 ; (main.l11120 + 0)
.s1050:
2689 : 8e 01 d6 STX $d601 
268c : a9 1f __ LDA #$1f
268e : 8d 00 d6 STA $d600 
.l11122:
2691 : 2c 00 d6 BIT $d600 
2694 : 10 fb __ BPL $2691 ; (main.l11122 + 0)
.s1054:
2696 : a9 09 __ LDA #$09
2698 : 8d 01 d6 STA $d601 
269b : 38 __ __ SEC
269c : a5 5b __ LDA T5 + 0 
269e : e9 07 __ SBC #$07
26a0 : 85 54 __ STA T1 + 0 
26a2 : a0 05 __ LDY #$05
.l1056:
26a4 : 18 __ __ CLC
26a5 : a5 54 __ LDA T1 + 0 
26a7 : 69 05 __ ADC #$05
26a9 : 90 03 __ BCC $26ae ; (main.s1324 + 0)
26ab : 4c c7 35 JMP $35c7 ; (main.s1057 + 0)
.s1324:
26ae : 85 57 __ STA T3 + 0 
26b0 : c4 57 __ CPY T3 + 0 
26b2 : b0 03 __ BCS $26b7 ; (main.s1055 + 0)
26b4 : 4c c7 35 JMP $35c7 ; (main.s1057 + 0)
.s1055:
26b7 : ad d8 50 LDA $50d8 ; (vdc_state + 5)
26ba : e9 07 __ SBC #$07
26bc : 85 54 __ STA T1 + 0 
26be : a0 05 __ LDY #$05
.l1096:
26c0 : 18 __ __ CLC
26c1 : a5 54 __ LDA T1 + 0 
26c3 : 69 05 __ ADC #$05
26c5 : 90 03 __ BCC $26ca ; (main.s1310 + 0)
26c7 : 4c 47 35 JMP $3547 ; (main.s1097 + 0)
.s1310:
26ca : 85 59 __ STA T4 + 0 
26cc : c4 59 __ CPY T4 + 0 
26ce : b0 03 __ BCS $26d3 ; (main.s1095 + 0)
26d0 : 4c 47 35 JMP $3547 ; (main.s1097 + 0)
.s1095:
26d3 : ad d8 50 LDA $50d8 ; (vdc_state + 5)
26d6 : aa __ __ TAX
26d7 : e9 02 __ SBC #$02
26d9 : 0a __ __ ASL
26da : a8 __ __ TAY
26db : b9 00 52 LDA $5200,y ; (multab + 0)
26de : 85 59 __ STA T4 + 0 
26e0 : 18 __ __ CLC
26e1 : 69 04 __ ADC #$04
26e3 : 85 5b __ STA T5 + 0 
26e5 : a9 12 __ LDA #$12
26e7 : 8d 00 d6 STA $d600 
26ea : b9 01 52 LDA $5201,y ; (multab + 1)
26ed : a8 __ __ TAY
26ee : 69 00 __ ADC #$00
26f0 : 85 5c __ STA T5 + 1 
26f2 : 18 __ __ CLC
26f3 : a5 5b __ LDA T5 + 0 
26f5 : 6d db 50 ADC $50db ; (vdc_state + 8)
26f8 : 85 5d __ STA T6 + 0 
26fa : a5 5c __ LDA T5 + 1 
26fc : 6d dc 50 ADC $50dc ; (vdc_state + 9)
.l11150:
26ff : 2c 00 d6 BIT $d600 
2702 : 10 fb __ BPL $26ff ; (main.l11150 + 0)
.s1144:
2704 : 8d 01 d6 STA $d601 
2707 : a9 13 __ LDA #$13
2709 : 8d 00 d6 STA $d600 
.l11152:
270c : 2c 00 d6 BIT $d600 
270f : 10 fb __ BPL $270c ; (main.l11152 + 0)
.s1149:
2711 : a5 5d __ LDA T6 + 0 
2713 : 8d 01 d6 STA $d601 
2716 : a9 1f __ LDA #$1f
2718 : 8d 00 d6 STA $d600 
.l11154:
271b : 2c 00 d6 BIT $d600 
271e : 10 fb __ BPL $271b ; (main.l11154 + 0)
.s1153:
2720 : a9 7c __ LDA #$7c
2722 : 8d 01 d6 STA $d601 
2725 : a9 12 __ LDA #$12
2727 : 8d 00 d6 STA $d600 
272a : 18 __ __ CLC
272b : a5 5b __ LDA T5 + 0 
272d : 6d dd 50 ADC $50dd ; (vdc_state + 10)
2730 : 85 5b __ STA T5 + 0 
2732 : a5 5c __ LDA T5 + 1 
2734 : 6d de 50 ADC $50de ; (vdc_state + 11)
.l11156:
2737 : 2c 00 d6 BIT $d600 
273a : 10 fb __ BPL $2737 ; (main.l11156 + 0)
.s1160:
273c : 8d 01 d6 STA $d601 
273f : a9 13 __ LDA #$13
2741 : 8d 00 d6 STA $d600 
.l11158:
2744 : 2c 00 d6 BIT $d600 
2747 : 10 fb __ BPL $2744 ; (main.l11158 + 0)
.s1165:
2749 : a5 5b __ LDA T5 + 0 
274b : 8d 01 d6 STA $d601 
274e : a9 1f __ LDA #$1f
2750 : 8d 00 d6 STA $d600 
.l11160:
2753 : 2c 00 d6 BIT $d600 
2756 : 10 fb __ BPL $2753 ; (main.l11160 + 0)
.s1169:
2758 : a9 09 __ LDA #$09
275a : 8d 01 d6 STA $d601 
275d : a9 12 __ LDA #$12
275f : 8d 00 d6 STA $d600 
2762 : 18 __ __ CLC
2763 : a5 59 __ LDA T4 + 0 
2765 : 69 05 __ ADC #$05
2767 : 85 5b __ STA T5 + 0 
2769 : 98 __ __ TYA
276a : 69 00 __ ADC #$00
276c : 85 5c __ STA T5 + 1 
276e : 18 __ __ CLC
276f : a5 5b __ LDA T5 + 0 
2771 : 6d db 50 ADC $50db ; (vdc_state + 8)
2774 : 85 5f __ STA T7 + 0 
2776 : a5 5c __ LDA T5 + 1 
2778 : 6d dc 50 ADC $50dc ; (vdc_state + 9)
.l11162:
277b : 2c 00 d6 BIT $d600 
277e : 10 fb __ BPL $277b ; (main.l11162 + 0)
.s1179:
2780 : 8d 01 d6 STA $d601 
2783 : a9 13 __ LDA #$13
2785 : 8d 00 d6 STA $d600 
.l11164:
2788 : 2c 00 d6 BIT $d600 
278b : 10 fb __ BPL $2788 ; (main.l11164 + 0)
.s1184:
278d : a5 5f __ LDA T7 + 0 
278f : 8d 01 d6 STA $d601 
2792 : a9 1f __ LDA #$1f
2794 : 8d 00 d6 STA $d600 
.l11166:
2797 : 2c 00 d6 BIT $d600 
279a : 10 fb __ BPL $2797 ; (main.l11166 + 0)
.s1188:
279c : a9 e2 __ LDA #$e2
279e : 8d 01 d6 STA $d601 
27a1 : a9 18 __ LDA #$18
27a3 : 8d 00 d6 STA $d600 
.l11168:
27a6 : 2c 00 d6 BIT $d600 
27a9 : 10 fb __ BPL $27a6 ; (main.l11168 + 0)
.s1194:
27ab : ad 01 d6 LDA $d601 
27ae : 29 7f __ AND #$7f
27b0 : 85 5f __ STA T7 + 0 
27b2 : a9 18 __ LDA #$18
27b4 : 8d 00 d6 STA $d600 
.l11170:
27b7 : 2c 00 d6 BIT $d600 
27ba : 10 fb __ BPL $27b7 ; (main.l11170 + 0)
.s1200:
27bc : a5 5f __ LDA T7 + 0 
27be : 8d 01 d6 STA $d601 
27c1 : a9 1e __ LDA #$1e
27c3 : 8d 00 d6 STA $d600 
.l11172:
27c6 : 2c 00 d6 BIT $d600 
27c9 : 10 fb __ BPL $27c6 ; (main.l11172 + 0)
.s1205:
27cb : a9 45 __ LDA #$45
27cd : 8d 01 d6 STA $d601 
27d0 : a9 12 __ LDA #$12
27d2 : 8d 00 d6 STA $d600 
27d5 : 18 __ __ CLC
27d6 : a5 5b __ LDA T5 + 0 
27d8 : 6d dd 50 ADC $50dd ; (vdc_state + 10)
27db : 85 5b __ STA T5 + 0 
27dd : a5 5c __ LDA T5 + 1 
27df : 6d de 50 ADC $50de ; (vdc_state + 11)
.l11174:
27e2 : 2c 00 d6 BIT $d600 
27e5 : 10 fb __ BPL $27e2 ; (main.l11174 + 0)
.s1212:
27e7 : 8d 01 d6 STA $d601 
27ea : a9 13 __ LDA #$13
27ec : 8d 00 d6 STA $d600 
.l11176:
27ef : 2c 00 d6 BIT $d600 
27f2 : 10 fb __ BPL $27ef ; (main.l11176 + 0)
.s1217:
27f4 : a5 5b __ LDA T5 + 0 
27f6 : 8d 01 d6 STA $d601 
27f9 : a9 1f __ LDA #$1f
27fb : 8d 00 d6 STA $d600 
.l11178:
27fe : 2c 00 d6 BIT $d600 
2801 : 10 fb __ BPL $27fe ; (main.l11178 + 0)
.s1221:
2803 : a9 09 __ LDA #$09
2805 : 8d 01 d6 STA $d601 
2808 : a9 18 __ LDA #$18
280a : 8d 00 d6 STA $d600 
.l11180:
280d : 2c 00 d6 BIT $d600 
2810 : 10 fb __ BPL $280d ; (main.l11180 + 0)
.s1227:
2812 : ad 01 d6 LDA $d601 
2815 : 29 7f __ AND #$7f
2817 : 85 5b __ STA T5 + 0 
2819 : a9 18 __ LDA #$18
281b : 8d 00 d6 STA $d600 
.l11182:
281e : 2c 00 d6 BIT $d600 
2821 : 10 fb __ BPL $281e ; (main.l11182 + 0)
.s1233:
2823 : a5 5b __ LDA T5 + 0 
2825 : 8d 01 d6 STA $d601 
2828 : a9 1e __ LDA #$1e
282a : 8d 00 d6 STA $d600 
.l11184:
282d : 2c 00 d6 BIT $d600 
2830 : 10 fb __ BPL $282d ; (main.l11184 + 0)
.s1238:
2832 : a9 45 __ LDA #$45
2834 : 8d 01 d6 STA $d601 
2837 : a9 12 __ LDA #$12
2839 : 8d 00 d6 STA $d600 
283c : 18 __ __ CLC
283d : a5 59 __ LDA T4 + 0 
283f : 69 4b __ ADC #$4b
2841 : 85 59 __ STA T4 + 0 
2843 : 90 01 __ BCC $2846 ; (main.s1697 + 0)
.s1696:
2845 : c8 __ __ INY
.s1697:
2846 : 18 __ __ CLC
2847 : 6d db 50 ADC $50db ; (vdc_state + 8)
284a : 85 57 __ STA T3 + 0 
284c : 98 __ __ TYA
284d : 6d dc 50 ADC $50dc ; (vdc_state + 9)
.l11186:
2850 : 2c 00 d6 BIT $d600 
2853 : 10 fb __ BPL $2850 ; (main.l11186 + 0)
.s1248:
2855 : 8d 01 d6 STA $d601 
2858 : a9 13 __ LDA #$13
285a : 8d 00 d6 STA $d600 
.l11188:
285d : 2c 00 d6 BIT $d600 
2860 : 10 fb __ BPL $285d ; (main.l11188 + 0)
.s1253:
2862 : a5 57 __ LDA T3 + 0 
2864 : 8d 01 d6 STA $d601 
2867 : a9 1f __ LDA #$1f
2869 : 8d 00 d6 STA $d600 
.l11190:
286c : 2c 00 d6 BIT $d600 
286f : 10 fb __ BPL $286c ; (main.l11190 + 0)
.s1257:
2871 : a9 7e __ LDA #$7e
2873 : 8d 01 d6 STA $d601 
2876 : a9 12 __ LDA #$12
2878 : 8d 00 d6 STA $d600 
287b : 18 __ __ CLC
287c : a5 59 __ LDA T4 + 0 
287e : 6d dd 50 ADC $50dd ; (vdc_state + 10)
2881 : 85 57 __ STA T3 + 0 
2883 : 98 __ __ TYA
2884 : 6d de 50 ADC $50de ; (vdc_state + 11)
.l11192:
2887 : 2c 00 d6 BIT $d600 
288a : 10 fb __ BPL $2887 ; (main.l11192 + 0)
.s1264:
288c : 8d 01 d6 STA $d601 
288f : a9 13 __ LDA #$13
2891 : 8d 00 d6 STA $d600 
.l11194:
2894 : 2c 00 d6 BIT $d600 
2897 : 10 fb __ BPL $2894 ; (main.l11194 + 0)
.s1269:
2899 : a5 57 __ LDA T3 + 0 
289b : 8d 01 d6 STA $d601 
289e : a9 1f __ LDA #$1f
28a0 : 8d 00 d6 STA $d600 
.l11196:
28a3 : 2c 00 d6 BIT $d600 
28a6 : 10 fb __ BPL $28a3 ; (main.l11196 + 0)
.s1273:
28a8 : a9 09 __ LDA #$09
28aa : 8d 01 d6 STA $d601 
28ad : a9 7f __ LDA #$7f
28af : 8d 92 bf STA $bf92 ; (viewport + 0)
28b2 : a9 50 __ LDA #$50
28b4 : 8d 95 bf STA $bf95 ; (viewport + 3)
28b7 : a9 00 __ LDA #$00
28b9 : 85 56 __ STA T2 + 0 
28bb : 8d 93 bf STA $bf93 ; (viewport + 1)
28be : 8d 96 bf STA $bf96 ; (viewport + 4)
28c1 : 8d 98 bf STA $bf98 ; (viewport + 6)
28c4 : 8d 99 bf STA $bf99 ; (viewport + 7)
28c7 : 8d 9a bf STA $bf9a ; (viewport + 8)
28ca : 8d 9b bf STA $bf9b ; (viewport + 9)
28cd : 8d 9c bf STA $bf9c ; (viewport + 10)
28d0 : a9 96 __ LDA #$96
28d2 : 8d 97 bf STA $bf97 ; (viewport + 5)
28d5 : a9 05 __ LDA #$05
28d7 : 85 0f __ STA P2 
28d9 : 85 10 __ STA P3 
28db : a9 46 __ LDA #$46
28dd : 85 11 __ STA P4 
28df : a9 20 __ LDA #$20
28e1 : 8d 94 bf STA $bf94 ; (viewport + 2)
28e4 : a9 9d __ LDA #$9d
28e6 : 85 0d __ STA P0 
28e8 : a9 bf __ LDA #$bf
28ea : 85 0e __ STA P1 
28ec : 8a __ __ TXA
28ed : 38 __ __ SEC
28ee : e9 07 __ SBC #$07
28f0 : 85 12 __ STA P5 
28f2 : 20 c7 4e JSR $4ec7 ; (vdcwin_init.s0 + 0)
28f5 : ad 9b bf LDA $bf9b ; (viewport + 9)
28f8 : 85 1b __ STA ACCU + 0 
28fa : ad 9c bf LDA $bf9c ; (viewport + 10)
28fd : 85 1c __ STA ACCU + 1 
28ff : ad 95 bf LDA $bf95 ; (viewport + 3)
2902 : 85 03 __ STA WORK + 0 
2904 : ad 96 bf LDA $bf96 ; (viewport + 4)
2907 : 85 04 __ STA WORK + 1 
2909 : 20 50 4f JSR $4f50 ; (mul16 + 0)
290c : ad 93 bf LDA $bf93 ; (viewport + 1)
290f : 18 __ __ CLC
2910 : 65 05 __ ADC WORK + 2 
2912 : a8 __ __ TAY
2913 : ad 94 bf LDA $bf94 ; (viewport + 2)
2916 : 65 06 __ ADC WORK + 3 
2918 : aa __ __ TAX
2919 : 98 __ __ TYA
291a : 18 __ __ CLC
291b : 6d 99 bf ADC $bf99 ; (viewport + 7)
291e : 85 54 __ STA T1 + 0 
2920 : 8a __ __ TXA
2921 : 6d 9a bf ADC $bf9a ; (viewport + 8)
2924 : ac a4 bf LDY $bfa4 ; (viewport + 18)
2927 : ae a3 bf LDX $bfa3 ; (viewport + 17)
292a : 4c 50 29 JMP $2950 ; (main.l1276 + 0)
.s1277:
292d : 86 0d __ STX P0 
292f : 84 0e __ STY P1 
2931 : 20 bb 13 JSR $13bb ; (bnk_cpytovdc@proxy + 0)
2934 : ad d6 50 LDA $50d6 ; (vdc_state + 3)
2937 : 18 __ __ CLC
2938 : 65 0d __ ADC P0 
293a : aa __ __ TAX
293b : ad d7 50 LDA $50d7 ; (vdc_state + 4)
293e : 65 0e __ ADC P1 
2940 : a8 __ __ TAY
2941 : 18 __ __ CLC
2942 : a5 54 __ LDA T1 + 0 
2944 : 6d d6 50 ADC $50d6 ; (vdc_state + 3)
2947 : 85 54 __ STA T1 + 0 
2949 : a5 55 __ LDA T1 + 1 
294b : 6d d7 50 ADC $50d7 ; (vdc_state + 4)
294e : e6 56 __ INC T2 + 0 
.l1276:
2950 : 85 55 __ STA T1 + 1 
2952 : a5 56 __ LDA T2 + 0 
2954 : cd a0 bf CMP $bfa0 ; (viewport + 14)
2957 : 90 d4 __ BCC $292d ; (main.s1277 + 0)
.s1279:
2959 : ad 95 bf LDA $bf95 ; (viewport + 3)
295c : 85 03 __ STA WORK + 0 
295e : ad 96 bf LDA $bf96 ; (viewport + 4)
2961 : 85 04 __ STA WORK + 1 
2963 : ad 9b bf LDA $bf9b ; (viewport + 9)
2966 : 85 1b __ STA ACCU + 0 
2968 : ad 9c bf LDA $bf9c ; (viewport + 10)
296b : 85 1c __ STA ACCU + 1 
296d : 20 50 4f JSR $4f50 ; (mul16 + 0)
2970 : ad 93 bf LDA $bf93 ; (viewport + 1)
2973 : 18 __ __ CLC
2974 : 65 05 __ ADC WORK + 2 
2976 : a8 __ __ TAY
2977 : ad 94 bf LDA $bf94 ; (viewport + 2)
297a : 65 06 __ ADC WORK + 3 
297c : aa __ __ TAX
297d : 98 __ __ TYA
297e : 18 __ __ CLC
297f : 6d 99 bf ADC $bf99 ; (viewport + 7)
2982 : 85 57 __ STA T3 + 0 
2984 : 8a __ __ TXA
2985 : 6d 9a bf ADC $bf9a ; (viewport + 8)
2988 : 85 58 __ STA T3 + 1 
298a : ad 97 bf LDA $bf97 ; (viewport + 5)
298d : 85 1b __ STA ACCU + 0 
298f : ad 98 bf LDA $bf98 ; (viewport + 6)
2992 : 85 1c __ STA ACCU + 1 
2994 : ad 95 bf LDA $bf95 ; (viewport + 3)
2997 : 85 03 __ STA WORK + 0 
2999 : ad 96 bf LDA $bf96 ; (viewport + 4)
299c : 85 04 __ STA WORK + 1 
299e : 20 50 4f JSR $4f50 ; (mul16 + 0)
29a1 : 18 __ __ CLC
29a2 : a5 57 __ LDA T3 + 0 
29a4 : 65 05 __ ADC WORK + 2 
29a6 : aa __ __ TAX
29a7 : a5 58 __ LDA T3 + 1 
29a9 : 65 06 __ ADC WORK + 3 
29ab : a8 __ __ TAY
29ac : 8a __ __ TXA
29ad : 18 __ __ CLC
29ae : 69 30 __ ADC #$30
29b0 : 85 54 __ STA T1 + 0 
29b2 : 90 01 __ BCC $29b5 ; (main.s1699 + 0)
.s1698:
29b4 : c8 __ __ INY
.s1699:
29b5 : 84 55 __ STY T1 + 1 
29b7 : a9 00 __ LDA #$00
29b9 : 85 56 __ STA T2 + 0 
29bb : ac a6 bf LDY $bfa6 ; (viewport + 20)
29be : ae a5 bf LDX $bfa5 ; (viewport + 19)
29c1 : 4c eb 29 JMP $29eb ; (main.l1280 + 0)
.s1281:
29c4 : 86 0d __ STX P0 
29c6 : 84 0e __ STY P1 
29c8 : 20 bb 13 JSR $13bb ; (bnk_cpytovdc@proxy + 0)
29cb : ad d6 50 LDA $50d6 ; (vdc_state + 3)
29ce : 18 __ __ CLC
29cf : 65 0d __ ADC P0 
29d1 : aa __ __ TAX
29d2 : ad d7 50 LDA $50d7 ; (vdc_state + 4)
29d5 : 65 0e __ ADC P1 
29d7 : a8 __ __ TAY
29d8 : 18 __ __ CLC
29d9 : a5 54 __ LDA T1 + 0 
29db : 6d d6 50 ADC $50d6 ; (vdc_state + 3)
29de : 85 54 __ STA T1 + 0 
29e0 : a5 55 __ LDA T1 + 1 
29e2 : 6d d7 50 ADC $50d7 ; (vdc_state + 4)
29e5 : 85 55 __ STA T1 + 1 
29e7 : e6 56 __ INC T2 + 0 
29e9 : a5 56 __ LDA T2 + 0 
.l1280:
29eb : cd a0 bf CMP $bfa0 ; (viewport + 14)
29ee : 90 d4 __ BCC $29c4 ; (main.s1281 + 0)
.l1284:
29f0 : 20 ea 42 JSR $42ea ; (getch.s0 + 0)
29f3 : a9 00 __ LDA #$00
29f5 : 85 56 __ STA T2 + 0 
29f7 : a5 1b __ LDA ACCU + 0 
29f9 : 85 54 __ STA T1 + 0 
29fb : c9 57 __ CMP #$57
29fd : f0 04 __ BEQ $2a03 ; (main.s1289 + 0)
.s1290:
29ff : c9 91 __ CMP #$91
2a01 : d0 11 __ BNE $2a14 ; (main.s1288 + 0)
.s1289:
2a03 : ad 9b bf LDA $bf9b ; (viewport + 9)
2a06 : 0d 9c bf ORA $bf9c ; (viewport + 10)
2a09 : f0 09 __ BEQ $2a14 ; (main.s1288 + 0)
.s1286:
2a0b : a9 08 __ LDA #$08
2a0d : 85 56 __ STA T2 + 0 
2a0f : a5 1b __ LDA ACCU + 0 
2a11 : 4c 1a 2a JMP $2a1a ; (main.s1295 + 0)
.s1288:
2a14 : a5 1b __ LDA ACCU + 0 
2a16 : c9 53 __ CMP #$53
2a18 : f0 04 __ BEQ $2a1e ; (main.s1294 + 0)
.s1295:
2a1a : c9 11 __ CMP #$11
2a1c : d0 2c __ BNE $2a4a ; (main.s1293 + 0)
.s1294:
2a1e : 38 __ __ SEC
2a1f : a9 96 __ LDA #$96
2a21 : ed d8 50 SBC $50d8 ; (vdc_state + 5)
2a24 : aa __ __ TAX
2a25 : a9 00 __ LDA #$00
2a27 : ed d9 50 SBC $50d9 ; (vdc_state + 6)
2a2a : a8 __ __ TAY
2a2b : 8a __ __ TXA
2a2c : 18 __ __ CLC
2a2d : 69 06 __ ADC #$06
2a2f : 85 57 __ STA T3 + 0 
2a31 : 90 01 __ BCC $2a34 ; (main.s1701 + 0)
.s1700:
2a33 : c8 __ __ INY
.s1701:
2a34 : 84 58 __ STY T3 + 1 
2a36 : ad 9c bf LDA $bf9c ; (viewport + 10)
2a39 : c5 58 __ CMP T3 + 1 
2a3b : d0 05 __ BNE $2a42 ; (main.s1237 + 0)
.s1236:
2a3d : ad 9b bf LDA $bf9b ; (viewport + 9)
2a40 : c5 57 __ CMP T3 + 0 
.s1237:
2a42 : b0 06 __ BCS $2a4a ; (main.s1293 + 0)
.s1291:
2a44 : a5 56 __ LDA T2 + 0 
2a46 : 09 04 __ ORA #$04
2a48 : 85 56 __ STA T2 + 0 
.s1293:
2a4a : a5 1b __ LDA ACCU + 0 
2a4c : c9 41 __ CMP #$41
2a4e : f0 04 __ BEQ $2a54 ; (main.s1299 + 0)
.s1300:
2a50 : c9 9d __ CMP #$9d
2a52 : d0 0e __ BNE $2a62 ; (main.s1298 + 0)
.s1299:
2a54 : ad 99 bf LDA $bf99 ; (viewport + 7)
2a57 : 0d 9a bf ORA $bf9a ; (viewport + 8)
2a5a : f0 06 __ BEQ $2a62 ; (main.s1298 + 0)
.s1296:
2a5c : a5 56 __ LDA T2 + 0 
2a5e : 09 01 __ ORA #$01
2a60 : 85 56 __ STA T2 + 0 
.s1298:
2a62 : a5 1b __ LDA ACCU + 0 
2a64 : c9 44 __ CMP #$44
2a66 : f0 04 __ BEQ $2a6c ; (main.s1304 + 0)
.s1305:
2a68 : c9 1d __ CMP #$1d
2a6a : d0 15 __ BNE $2a81 ; (main.s1303 + 0)
.s1304:
2a6c : ad 9a bf LDA $bf9a ; (viewport + 8)
2a6f : d0 10 __ BNE $2a81 ; (main.s1303 + 0)
.s1227:
2a71 : ad 99 bf LDA $bf99 ; (viewport + 7)
2a74 : c9 09 __ CMP #$09
2a76 : b0 09 __ BCS $2a81 ; (main.s1303 + 0)
.s1301:
2a78 : a5 56 __ LDA T2 + 0 
2a7a : 09 02 __ ORA #$02
2a7c : 85 56 __ STA T2 + 0 
2a7e : 4c c4 2b JMP $2bc4 ; (main.s1306 + 0)
.s1303:
2a81 : a5 56 __ LDA T2 + 0 
2a83 : f0 03 __ BEQ $2a88 ; (main.s1308 + 0)
2a85 : 4c c4 2b JMP $2bc4 ; (main.s1306 + 0)
.s1308:
2a88 : a5 54 __ LDA T1 + 0 
2a8a : c9 1b __ CMP #$1b
2a8c : f0 07 __ BEQ $2a95 ; (main.s841 + 0)
.s2407:
2a8e : c9 03 __ CMP #$03
2a90 : f0 03 __ BEQ $2a95 ; (main.s841 + 0)
2a92 : 4c f0 29 JMP $29f0 ; (main.l1284 + 0)
.s841:
2a95 : e6 53 __ INC T0 + 0 
2a97 : a5 53 __ LDA T0 + 0 
2a99 : c9 06 __ CMP #$06
2a9b : b0 03 __ BCS $2aa0 ; (main.s842 + 0)
2a9d : 4c 75 23 JMP $2375 ; (main.l840 + 0)
.s842:
2aa0 : a9 00 __ LDA #$00
2aa2 : 8d 30 d0 STA $d030 
2aa5 : 85 13 __ STA P6 
2aa7 : ad 11 d0 LDA $d011 
2aaa : 29 7f __ AND #$7f
2aac : 09 10 __ ORA #$10
2aae : 8d 11 d0 STA $d011 
2ab1 : 20 09 44 JSR $4409 ; (vdc_set_mode.s1000 + 0)
2ab4 : a9 00 __ LDA #$00
2ab6 : 85 53 __ STA T0 + 0 
2ab8 : ad d6 50 LDA $50d6 ; (vdc_state + 3)
2abb : 85 54 __ STA T1 + 0 
2abd : ad d8 50 LDA $50d8 ; (vdc_state + 5)
2ac0 : 85 57 __ STA T3 + 0 
.l2415:
2ac2 : a5 53 __ LDA T0 + 0 
2ac4 : c5 57 __ CMP T3 + 0 
2ac6 : 90 21 __ BCC $2ae9 ; (main.s2416 + 0)
.s2413:
2ac8 : a9 04 __ LDA #$04
2aca : 8d 06 d5 STA $d506 
2acd : a9 00 __ LDA #$00
2acf : 85 1b __ STA ACCU + 0 
2ad1 : 85 1c __ STA ACCU + 1 
.s1001:
2ad3 : 18 __ __ CLC
2ad4 : a5 23 __ LDA SP + 0 
2ad6 : 69 0e __ ADC #$0e
2ad8 : 85 23 __ STA SP + 0 
2ada : 90 02 __ BCC $2ade ; (main.s1001 + 11)
2adc : e6 24 __ INC SP + 1 
2ade : a2 10 __ LDX #$10
2ae0 : bd 4f bf LDA $bf4f,x ; (main@stack + 0)
2ae3 : 95 53 __ STA T0 + 0,x 
2ae5 : ca __ __ DEX
2ae6 : 10 f8 __ BPL $2ae0 ; (main.s1001 + 13)
2ae8 : 60 __ __ RTS
.s2416:
2ae9 : 0a __ __ ASL
2aea : aa __ __ TAX
2aeb : ad da 50 LDA $50da ; (vdc_state + 7)
2aee : 85 56 __ STA T2 + 0 
2af0 : a9 12 __ LDA #$12
2af2 : 8d 00 d6 STA $d600 
2af5 : a5 54 __ LDA T1 + 0 
2af7 : 38 __ __ SEC
2af8 : e9 01 __ SBC #$01
2afa : 85 5d __ STA T6 + 0 
2afc : bd 00 52 LDA $5200,x ; (multab + 0)
2aff : 85 59 __ STA T4 + 0 
2b01 : 18 __ __ CLC
2b02 : 6d db 50 ADC $50db ; (vdc_state + 8)
2b05 : a8 __ __ TAY
2b06 : bd 01 52 LDA $5201,x ; (multab + 1)
2b09 : 85 5a __ STA T4 + 1 
2b0b : 6d dc 50 ADC $50dc ; (vdc_state + 9)
.l11391:
2b0e : 2c 00 d6 BIT $d600 
2b11 : 10 fb __ BPL $2b0e ; (main.l11391 + 0)
.s2428:
2b13 : 8d 01 d6 STA $d601 
2b16 : a9 13 __ LDA #$13
2b18 : 8d 00 d6 STA $d600 
.l11393:
2b1b : 2c 00 d6 BIT $d600 
2b1e : 10 fb __ BPL $2b1b ; (main.l11393 + 0)
.s2433:
2b20 : 8c 01 d6 STY $d601 
2b23 : a9 1f __ LDA #$1f
2b25 : 8d 00 d6 STA $d600 
.l11395:
2b28 : 2c 00 d6 BIT $d600 
2b2b : 10 fb __ BPL $2b28 ; (main.l11395 + 0)
.s2437:
2b2d : a9 20 __ LDA #$20
2b2f : 8d 01 d6 STA $d601 
2b32 : a9 18 __ LDA #$18
2b34 : 8d 00 d6 STA $d600 
.l11397:
2b37 : 2c 00 d6 BIT $d600 
2b3a : 10 fb __ BPL $2b37 ; (main.l11397 + 0)
.s2443:
2b3c : ad 01 d6 LDA $d601 
2b3f : 29 7f __ AND #$7f
2b41 : a8 __ __ TAY
2b42 : a9 18 __ LDA #$18
2b44 : 8d 00 d6 STA $d600 
.l11399:
2b47 : 2c 00 d6 BIT $d600 
2b4a : 10 fb __ BPL $2b47 ; (main.l11399 + 0)
.s2449:
2b4c : 8c 01 d6 STY $d601 
2b4f : a9 1e __ LDA #$1e
2b51 : 8d 00 d6 STA $d600 
.l11401:
2b54 : 2c 00 d6 BIT $d600 
2b57 : 10 fb __ BPL $2b54 ; (main.l11401 + 0)
.s2454:
2b59 : a5 5d __ LDA T6 + 0 
2b5b : 8d 01 d6 STA $d601 
2b5e : ad dd 50 LDA $50dd ; (vdc_state + 10)
2b61 : 18 __ __ CLC
2b62 : 65 59 __ ADC T4 + 0 
2b64 : aa __ __ TAX
2b65 : a9 12 __ LDA #$12
2b67 : 8d 00 d6 STA $d600 
2b6a : ad de 50 LDA $50de ; (vdc_state + 11)
2b6d : 65 5a __ ADC T4 + 1 
.l11403:
2b6f : 2c 00 d6 BIT $d600 
2b72 : 10 fb __ BPL $2b6f ; (main.l11403 + 0)
.s2461:
2b74 : 8d 01 d6 STA $d601 
2b77 : a9 13 __ LDA #$13
2b79 : 8d 00 d6 STA $d600 
.l11405:
2b7c : 2c 00 d6 BIT $d600 
2b7f : 10 fb __ BPL $2b7c ; (main.l11405 + 0)
.s2466:
2b81 : 8e 01 d6 STX $d601 
2b84 : a9 1f __ LDA #$1f
2b86 : 8d 00 d6 STA $d600 
.l11407:
2b89 : 2c 00 d6 BIT $d600 
2b8c : 10 fb __ BPL $2b89 ; (main.l11407 + 0)
.s2470:
2b8e : a5 56 __ LDA T2 + 0 
2b90 : 8d 01 d6 STA $d601 
2b93 : a9 18 __ LDA #$18
2b95 : 8d 00 d6 STA $d600 
.l11409:
2b98 : 2c 00 d6 BIT $d600 
2b9b : 10 fb __ BPL $2b98 ; (main.l11409 + 0)
.s2476:
2b9d : ad 01 d6 LDA $d601 
2ba0 : 29 7f __ AND #$7f
2ba2 : aa __ __ TAX
2ba3 : a9 18 __ LDA #$18
2ba5 : 8d 00 d6 STA $d600 
.l11411:
2ba8 : 2c 00 d6 BIT $d600 
2bab : 10 fb __ BPL $2ba8 ; (main.l11411 + 0)
.s2482:
2bad : 8e 01 d6 STX $d601 
2bb0 : a9 1e __ LDA #$1e
2bb2 : 8d 00 d6 STA $d600 
.l11413:
2bb5 : 2c 00 d6 BIT $d600 
2bb8 : 10 fb __ BPL $2bb5 ; (main.l11413 + 0)
.s2487:
2bba : a5 5d __ LDA T6 + 0 
2bbc : 8d 01 d6 STA $d601 
2bbf : e6 53 __ INC T0 + 0 
2bc1 : 4c c2 2a JMP $2ac2 ; (main.l2415 + 0)
.s1306:
2bc4 : a2 15 __ LDX #$15
.l1041:
2bc6 : bd 91 bf LDA $bf91,x ; (softscroll + 15)
2bc9 : 9d 61 bf STA $bf61,x ; (main@stack + 18)
2bcc : ca __ __ DEX
2bcd : d0 f7 __ BNE $2bc6 ; (main.l1041 + 0)
.s1042:
2bcf : a5 56 __ LDA T2 + 0 
2bd1 : 4a __ __ LSR
2bd2 : 90 4e __ BCC $2c22 ; (main.s11268 + 0)
.s1310:
2bd4 : 86 61 __ STX T8 + 0 
2bd6 : ae 9f bf LDX $bf9f ; (viewport + 13)
2bd9 : ca __ __ DEX
2bda : 86 57 __ STX T3 + 0 
2bdc : ad a3 bf LDA $bfa3 ; (viewport + 17)
2bdf : 85 59 __ STA T4 + 0 
2be1 : ad a4 bf LDA $bfa4 ; (viewport + 18)
2be4 : 85 5a __ STA T4 + 1 
2be6 : ad a5 bf LDA $bfa5 ; (viewport + 19)
2be9 : 85 5b __ STA T5 + 0 
2beb : ad a6 bf LDA $bfa6 ; (viewport + 20)
.l1314:
2bee : 85 5c __ STA T5 + 1 
2bf0 : a5 61 __ LDA T8 + 0 
2bf2 : cd a0 bf CMP $bfa0 ; (viewport + 14)
2bf5 : b0 03 __ BCS $2bfa ; (main.s1313 + 0)
2bf7 : 4c fe 32 JMP $32fe ; (main.s1315 + 0)
.s1313:
2bfa : a9 01 __ LDA #$01
2bfc : 85 11 __ STA P4 
2bfe : ad a0 bf LDA $bfa0 ; (viewport + 14)
2c01 : 85 12 __ STA P5 
2c03 : ad 69 bf LDA $bf69 ; (vp_fill + 7)
2c06 : 18 __ __ CLC
2c07 : 69 ff __ ADC #$ff
2c09 : 8d 69 bf STA $bf69 ; (vp_fill + 7)
2c0c : b0 03 __ BCS $2c11 ; (main.s1703 + 0)
.s1702:
2c0e : ce 6a bf DEC $bf6a ; (vp_fill + 8)
.s1703:
2c11 : ad 99 bf LDA $bf99 ; (viewport + 7)
2c14 : 18 __ __ CLC
2c15 : 69 ff __ ADC #$ff
2c17 : 8d 99 bf STA $bf99 ; (viewport + 7)
2c1a : b0 03 __ BCS $2c1f ; (main.s1705 + 0)
.s1704:
2c1c : ce 9a bf DEC $bf9a ; (viewport + 8)
.s1705:
2c1f : 20 b5 4e JSR $4eb5 ; (vdcwin_init@proxy + 0)
.s11268:
2c22 : a5 56 __ LDA T2 + 0 
2c24 : 29 02 __ AND #$02
2c26 : f0 64 __ BEQ $2c8c ; (main.s11328 + 0)
.s1671:
2c28 : ae 9f bf LDX $bf9f ; (viewport + 13)
2c2b : ca __ __ DEX
2c2c : 86 57 __ STX T3 + 0 
2c2e : a9 00 __ LDA #$00
2c30 : 85 61 __ STA T8 + 0 
2c32 : ad a3 bf LDA $bfa3 ; (viewport + 17)
2c35 : 85 59 __ STA T4 + 0 
2c37 : ad a4 bf LDA $bfa4 ; (viewport + 18)
2c3a : 85 5a __ STA T4 + 1 
2c3c : ad a5 bf LDA $bfa5 ; (viewport + 19)
2c3f : 85 5b __ STA T5 + 0 
2c41 : ad a6 bf LDA $bfa6 ; (viewport + 20)
.l1675:
2c44 : 85 5c __ STA T5 + 1 
2c46 : a5 61 __ LDA T8 + 0 
2c48 : cd a0 bf CMP $bfa0 ; (viewport + 14)
2c4b : b0 03 __ BCS $2c50 ; (main.s1674 + 0)
2c4d : 4c b4 30 JMP $30b4 ; (main.s1676 + 0)
.s1674:
2c50 : a9 01 __ LDA #$01
2c52 : 85 11 __ STA P4 
2c54 : ad a0 bf LDA $bfa0 ; (viewport + 14)
2c57 : 85 12 __ STA P5 
2c59 : ad 69 bf LDA $bf69 ; (vp_fill + 7)
2c5c : 18 __ __ CLC
2c5d : 6d 9f bf ADC $bf9f ; (viewport + 13)
2c60 : 8d 69 bf STA $bf69 ; (vp_fill + 7)
2c63 : 90 03 __ BCC $2c68 ; (main.s1707 + 0)
.s1706:
2c65 : ee 6a bf INC $bf6a ; (vp_fill + 8)
.s1707:
2c68 : ee 99 bf INC $bf99 ; (viewport + 7)
2c6b : d0 03 __ BNE $2c70 ; (main.s1709 + 0)
.s1708:
2c6d : ee 9a bf INC $bf9a ; (viewport + 8)
.s1709:
2c70 : a9 6d __ LDA #$6d
2c72 : 85 0d __ STA P0 
2c74 : a9 bf __ LDA #$bf
2c76 : 85 0e __ STA P1 
2c78 : ad 9d bf LDA $bf9d ; (viewport + 11)
2c7b : 18 __ __ CLC
2c7c : 6d 9f bf ADC $bf9f ; (viewport + 13)
2c7f : 38 __ __ SEC
2c80 : e9 01 __ SBC #$01
2c82 : 85 0f __ STA P2 
2c84 : ad 9e bf LDA $bf9e ; (viewport + 12)
2c87 : 85 10 __ STA P3 
2c89 : 20 c7 4e JSR $4ec7 ; (vdcwin_init.s0 + 0)
.s11328:
2c8c : a5 56 __ LDA T2 + 0 
2c8e : 29 08 __ AND #$08
2c90 : f0 76 __ BEQ $2d08 ; (main.s11358 + 0)
.s2032:
2c92 : ad d6 50 LDA $50d6 ; (vdc_state + 3)
2c95 : 85 59 __ STA T4 + 0 
2c97 : 85 1b __ STA ACCU + 0 
2c99 : ad d7 50 LDA $50d7 ; (vdc_state + 4)
2c9c : 85 5a __ STA T4 + 1 
2c9e : 85 1c __ STA ACCU + 1 
2ca0 : ad a0 bf LDA $bfa0 ; (viewport + 14)
2ca3 : 20 30 4f JSR $4f30 ; (mul16by8 + 0)
2ca6 : ad a3 bf LDA $bfa3 ; (viewport + 17)
2ca9 : 18 __ __ CLC
2caa : 65 05 __ ADC WORK + 2 
2cac : 85 5b __ STA T5 + 0 
2cae : ad a4 bf LDA $bfa4 ; (viewport + 18)
2cb1 : 65 06 __ ADC WORK + 3 
2cb3 : 85 5c __ STA T5 + 1 
2cb5 : ad a5 bf LDA $bfa5 ; (viewport + 19)
2cb8 : 18 __ __ CLC
2cb9 : 65 05 __ ADC WORK + 2 
2cbb : a8 __ __ TAY
2cbc : ad a6 bf LDA $bfa6 ; (viewport + 20)
2cbf : 65 06 __ ADC WORK + 3 
2cc1 : 85 58 __ STA T3 + 1 
2cc3 : a9 00 __ LDA #$00
2cc5 : 85 61 __ STA T8 + 0 
2cc7 : ad 9f bf LDA $bf9f ; (viewport + 13)
2cca : 85 43 __ STA T10 + 0 
.l2036:
2ccc : ad a0 bf LDA $bfa0 ; (viewport + 14)
2ccf : 38 __ __ SEC
2cd0 : e9 01 __ SBC #$01
2cd2 : b0 03 __ BCS $2cd7 ; (main.s1105 + 0)
2cd4 : 4c 9e 2f JMP $2f9e ; (main.s2037 + 0)
.s1105:
2cd7 : c5 61 __ CMP T8 + 0 
2cd9 : 90 05 __ BCC $2ce0 ; (main.s2035 + 0)
.s1710:
2cdb : f0 03 __ BEQ $2ce0 ; (main.s2035 + 0)
2cdd : 4c 9e 2f JMP $2f9e ; (main.s2037 + 0)
.s2035:
2ce0 : a9 01 __ LDA #$01
2ce2 : 85 12 __ STA P5 
2ce4 : ad 6b bf LDA $bf6b ; (vp_fill + 9)
2ce7 : 18 __ __ CLC
2ce8 : 69 ff __ ADC #$ff
2cea : 8d 6b bf STA $bf6b ; (vp_fill + 9)
2ced : b0 03 __ BCS $2cf2 ; (main.s1712 + 0)
.s1711:
2cef : ce 6c bf DEC $bf6c ; (vp_fill + 10)
.s1712:
2cf2 : ad 9b bf LDA $bf9b ; (viewport + 9)
2cf5 : 18 __ __ CLC
2cf6 : 69 ff __ ADC #$ff
2cf8 : 8d 9b bf STA $bf9b ; (viewport + 9)
2cfb : b0 03 __ BCS $2d00 ; (main.s1714 + 0)
.s1713:
2cfd : ce 9c bf DEC $bf9c ; (viewport + 10)
.s1714:
2d00 : ad 9f bf LDA $bf9f ; (viewport + 13)
2d03 : 85 11 __ STA P4 
2d05 : 20 b5 4e JSR $4eb5 ; (vdcwin_init@proxy + 0)
.s11358:
2d08 : a5 56 __ LDA T2 + 0 
2d0a : 29 04 __ AND #$04
2d0c : f0 75 __ BEQ $2d83 ; (main.s2217 + 0)
.s2215:
2d0e : ad d6 50 LDA $50d6 ; (vdc_state + 3)
2d11 : 85 57 __ STA T3 + 0 
2d13 : ad d7 50 LDA $50d7 ; (vdc_state + 4)
2d16 : 85 58 __ STA T3 + 1 
2d18 : ad 9f bf LDA $bf9f ; (viewport + 13)
2d1b : 85 61 __ STA T8 + 0 
2d1d : ad a3 bf LDA $bfa3 ; (viewport + 17)
2d20 : 85 59 __ STA T4 + 0 
2d22 : ad a4 bf LDA $bfa4 ; (viewport + 18)
2d25 : 85 5a __ STA T4 + 1 
2d27 : ad a5 bf LDA $bfa5 ; (viewport + 19)
2d2a : 85 5b __ STA T5 + 0 
2d2c : ad a6 bf LDA $bfa6 ; (viewport + 20)
2d2f : a0 00 __ LDY #$00
.l2219:
2d31 : 85 5c __ STA T5 + 1 
2d33 : ad a0 bf LDA $bfa0 ; (viewport + 14)
2d36 : 38 __ __ SEC
2d37 : e9 01 __ SBC #$01
2d39 : b0 03 __ BCS $2d3e ; (main.s1075 + 0)
2d3b : 4c 87 2e JMP $2e87 ; (main.s2220 + 0)
.s1075:
2d3e : 85 5f __ STA T7 + 0 
2d40 : c4 5f __ CPY T7 + 0 
2d42 : b0 03 __ BCS $2d47 ; (main.s2218 + 0)
2d44 : 4c 87 2e JMP $2e87 ; (main.s2220 + 0)
.s2218:
2d47 : a9 01 __ LDA #$01
2d49 : 85 12 __ STA P5 
2d4b : ad 6b bf LDA $bf6b ; (vp_fill + 9)
2d4e : 18 __ __ CLC
2d4f : 6d a0 bf ADC $bfa0 ; (viewport + 14)
2d52 : 8d 6b bf STA $bf6b ; (vp_fill + 9)
2d55 : 90 03 __ BCC $2d5a ; (main.s1716 + 0)
.s1715:
2d57 : ee 6c bf INC $bf6c ; (vp_fill + 10)
.s1716:
2d5a : ee 9b bf INC $bf9b ; (viewport + 9)
2d5d : d0 03 __ BNE $2d62 ; (main.s1718 + 0)
.s1717:
2d5f : ee 9c bf INC $bf9c ; (viewport + 10)
.s1718:
2d62 : a9 6d __ LDA #$6d
2d64 : 85 0d __ STA P0 
2d66 : a9 bf __ LDA #$bf
2d68 : 85 0e __ STA P1 
2d6a : ad 9d bf LDA $bf9d ; (viewport + 11)
2d6d : 85 0f __ STA P2 
2d6f : ad 9e bf LDA $bf9e ; (viewport + 12)
2d72 : 18 __ __ CLC
2d73 : 6d a0 bf ADC $bfa0 ; (viewport + 14)
2d76 : 38 __ __ SEC
2d77 : e9 01 __ SBC #$01
2d79 : 85 10 __ STA P3 
2d7b : ad 9f bf LDA $bf9f ; (viewport + 13)
2d7e : 85 11 __ STA P4 
2d80 : 20 c7 4e JSR $4ec7 ; (vdcwin_init.s0 + 0)
.s2217:
2d83 : ad 6b bf LDA $bf6b ; (vp_fill + 9)
2d86 : 85 1b __ STA ACCU + 0 
2d88 : ad 6c bf LDA $bf6c ; (vp_fill + 10)
2d8b : 85 1c __ STA ACCU + 1 
2d8d : ad 65 bf LDA $bf65 ; (vp_fill + 3)
2d90 : 85 03 __ STA WORK + 0 
2d92 : ad 66 bf LDA $bf66 ; (vp_fill + 4)
2d95 : 85 04 __ STA WORK + 1 
2d97 : 20 50 4f JSR $4f50 ; (mul16 + 0)
2d9a : ad 63 bf LDA $bf63 ; (vp_fill + 1)
2d9d : 18 __ __ CLC
2d9e : 65 05 __ ADC WORK + 2 
2da0 : a8 __ __ TAY
2da1 : ad 64 bf LDA $bf64 ; (vp_fill + 2)
2da4 : 65 06 __ ADC WORK + 3 
2da6 : aa __ __ TAX
2da7 : 98 __ __ TYA
2da8 : 18 __ __ CLC
2da9 : 6d 69 bf ADC $bf69 ; (vp_fill + 7)
2dac : 85 57 __ STA T3 + 0 
2dae : 8a __ __ TXA
2daf : 6d 6a bf ADC $bf6a ; (vp_fill + 8)
2db2 : 85 58 __ STA T3 + 1 
2db4 : a9 00 __ LDA #$00
2db6 : 85 56 __ STA T2 + 0 
2db8 : ac 74 bf LDY $bf74 ; (vp_fill + 18)
2dbb : ae 73 bf LDX $bf73 ; (vp_fill + 17)
2dbe : 4c e8 2d JMP $2de8 ; (main.l2399 + 0)
.s2400:
2dc1 : 86 0d __ STX P0 
2dc3 : 84 0e __ STY P1 
2dc5 : 20 d1 14 JSR $14d1 ; (bnk_cpytovdc@proxy + 0)
2dc8 : ad d6 50 LDA $50d6 ; (vdc_state + 3)
2dcb : 18 __ __ CLC
2dcc : 65 0d __ ADC P0 
2dce : aa __ __ TAX
2dcf : ad d7 50 LDA $50d7 ; (vdc_state + 4)
2dd2 : 65 0e __ ADC P1 
2dd4 : a8 __ __ TAY
2dd5 : 18 __ __ CLC
2dd6 : a5 57 __ LDA T3 + 0 
2dd8 : 6d d6 50 ADC $50d6 ; (vdc_state + 3)
2ddb : 85 57 __ STA T3 + 0 
2ddd : a5 58 __ LDA T3 + 1 
2ddf : 6d d7 50 ADC $50d7 ; (vdc_state + 4)
2de2 : 85 58 __ STA T3 + 1 
2de4 : e6 56 __ INC T2 + 0 
2de6 : a5 56 __ LDA T2 + 0 
.l2399:
2de8 : cd 70 bf CMP $bf70 ; (vp_fill + 14)
2deb : 90 d4 __ BCC $2dc1 ; (main.s2400 + 0)
.s2402:
2ded : ad 65 bf LDA $bf65 ; (vp_fill + 3)
2df0 : 85 03 __ STA WORK + 0 
2df2 : ad 66 bf LDA $bf66 ; (vp_fill + 4)
2df5 : 85 04 __ STA WORK + 1 
2df7 : ad 6b bf LDA $bf6b ; (vp_fill + 9)
2dfa : 85 1b __ STA ACCU + 0 
2dfc : ad 6c bf LDA $bf6c ; (vp_fill + 10)
2dff : 85 1c __ STA ACCU + 1 
2e01 : 20 50 4f JSR $4f50 ; (mul16 + 0)
2e04 : ad 63 bf LDA $bf63 ; (vp_fill + 1)
2e07 : 18 __ __ CLC
2e08 : 65 05 __ ADC WORK + 2 
2e0a : a8 __ __ TAY
2e0b : ad 64 bf LDA $bf64 ; (vp_fill + 2)
2e0e : 65 06 __ ADC WORK + 3 
2e10 : aa __ __ TAX
2e11 : 98 __ __ TYA
2e12 : 18 __ __ CLC
2e13 : 6d 69 bf ADC $bf69 ; (vp_fill + 7)
2e16 : 85 59 __ STA T4 + 0 
2e18 : 8a __ __ TXA
2e19 : 6d 6a bf ADC $bf6a ; (vp_fill + 8)
2e1c : 85 5a __ STA T4 + 1 
2e1e : ad 67 bf LDA $bf67 ; (vp_fill + 5)
2e21 : 85 1b __ STA ACCU + 0 
2e23 : ad 68 bf LDA $bf68 ; (vp_fill + 6)
2e26 : 85 1c __ STA ACCU + 1 
2e28 : ad 65 bf LDA $bf65 ; (vp_fill + 3)
2e2b : 85 03 __ STA WORK + 0 
2e2d : ad 66 bf LDA $bf66 ; (vp_fill + 4)
2e30 : 85 04 __ STA WORK + 1 
2e32 : 20 50 4f JSR $4f50 ; (mul16 + 0)
2e35 : 18 __ __ CLC
2e36 : a5 59 __ LDA T4 + 0 
2e38 : 65 05 __ ADC WORK + 2 
2e3a : aa __ __ TAX
2e3b : a5 5a __ LDA T4 + 1 
2e3d : 65 06 __ ADC WORK + 3 
2e3f : a8 __ __ TAY
2e40 : 8a __ __ TXA
2e41 : 18 __ __ CLC
2e42 : 69 30 __ ADC #$30
2e44 : 85 57 __ STA T3 + 0 
2e46 : 90 01 __ BCC $2e49 ; (main.s1720 + 0)
.s1719:
2e48 : c8 __ __ INY
.s1720:
2e49 : 84 58 __ STY T3 + 1 
2e4b : a9 00 __ LDA #$00
2e4d : 85 56 __ STA T2 + 0 
2e4f : ac 76 bf LDY $bf76 ; (vp_fill + 20)
2e52 : ae 75 bf LDX $bf75 ; (vp_fill + 19)
2e55 : 4c 7f 2e JMP $2e7f ; (main.l2403 + 0)
.s2404:
2e58 : 86 0d __ STX P0 
2e5a : 84 0e __ STY P1 
2e5c : 20 d1 14 JSR $14d1 ; (bnk_cpytovdc@proxy + 0)
2e5f : ad d6 50 LDA $50d6 ; (vdc_state + 3)
2e62 : 18 __ __ CLC
2e63 : 65 0d __ ADC P0 
2e65 : aa __ __ TAX
2e66 : ad d7 50 LDA $50d7 ; (vdc_state + 4)
2e69 : 65 0e __ ADC P1 
2e6b : a8 __ __ TAY
2e6c : 18 __ __ CLC
2e6d : a5 57 __ LDA T3 + 0 
2e6f : 6d d6 50 ADC $50d6 ; (vdc_state + 3)
2e72 : 85 57 __ STA T3 + 0 
2e74 : a5 58 __ LDA T3 + 1 
2e76 : 6d d7 50 ADC $50d7 ; (vdc_state + 4)
2e79 : 85 58 __ STA T3 + 1 
2e7b : e6 56 __ INC T2 + 0 
2e7d : a5 56 __ LDA T2 + 0 
.l2403:
2e7f : cd 70 bf CMP $bf70 ; (vp_fill + 14)
2e82 : 90 d4 __ BCC $2e58 ; (main.s2404 + 0)
2e84 : 4c 88 2a JMP $2a88 ; (main.s1308 + 0)
.s2220:
2e87 : a9 12 __ LDA #$12
2e89 : 8d 00 d6 STA $d600 
2e8c : a5 5b __ LDA T5 + 0 
2e8e : 65 57 __ ADC T3 + 0 
2e90 : 85 5d __ STA T6 + 0 
2e92 : a5 5c __ LDA T5 + 1 
2e94 : 65 58 __ ADC T3 + 1 
2e96 : 85 5e __ STA T6 + 1 
2e98 : 18 __ __ CLC
2e99 : a5 59 __ LDA T4 + 0 
2e9b : 65 57 __ ADC T3 + 0 
2e9d : 85 1b __ STA ACCU + 0 
2e9f : a5 5a __ LDA T4 + 1 
2ea1 : 65 58 __ ADC T3 + 1 
2ea3 : 85 1c __ STA ACCU + 1 
.l11360:
2ea5 : 2c 00 d6 BIT $d600 
2ea8 : 10 fb __ BPL $2ea5 ; (main.l11360 + 0)
.s2276:
2eaa : a5 5a __ LDA T4 + 1 
2eac : 8d 01 d6 STA $d601 
2eaf : a9 13 __ LDA #$13
2eb1 : 8d 00 d6 STA $d600 
.l11362:
2eb4 : 2c 00 d6 BIT $d600 
2eb7 : 10 fb __ BPL $2eb4 ; (main.l11362 + 0)
.s2281:
2eb9 : a5 59 __ LDA T4 + 0 
2ebb : 8d 01 d6 STA $d601 
2ebe : a9 1f __ LDA #$1f
2ec0 : 8d 00 d6 STA $d600 
2ec3 : a9 18 __ LDA #$18
2ec5 : 8d 00 d6 STA $d600 
.l11364:
2ec8 : 2c 00 d6 BIT $d600 
2ecb : 10 fb __ BPL $2ec8 ; (main.l11364 + 0)
.s2288:
2ecd : ad 01 d6 LDA $d601 
2ed0 : a2 18 __ LDX #$18
2ed2 : 8e 00 d6 STX $d600 
2ed5 : 09 80 __ ORA #$80
.l11366:
2ed7 : 2c 00 d6 BIT $d600 
2eda : 10 fb __ BPL $2ed7 ; (main.l11366 + 0)
.s2294:
2edc : 8d 01 d6 STA $d601 
2edf : a9 20 __ LDA #$20
2ee1 : 8d 00 d6 STA $d600 
.l11368:
2ee4 : 2c 00 d6 BIT $d600 
2ee7 : 10 fb __ BPL $2ee4 ; (main.l11368 + 0)
.s2299:
2ee9 : a5 1c __ LDA ACCU + 1 
2eeb : 8d 01 d6 STA $d601 
2eee : a9 21 __ LDA #$21
2ef0 : 8d 00 d6 STA $d600 
.l11370:
2ef3 : 2c 00 d6 BIT $d600 
2ef6 : 10 fb __ BPL $2ef3 ; (main.l11370 + 0)
.s2304:
2ef8 : a5 1b __ LDA ACCU + 0 
2efa : 8d 01 d6 STA $d601 
2efd : a9 1f __ LDA #$1f
2eff : 8d 00 d6 STA $d600 
2f02 : a9 1e __ LDA #$1e
2f04 : 8d 00 d6 STA $d600 
.l11372:
2f07 : 2c 00 d6 BIT $d600 
2f0a : 10 fb __ BPL $2f07 ; (main.l11372 + 0)
.s2310:
2f0c : a5 61 __ LDA T8 + 0 
2f0e : 8d 01 d6 STA $d601 
2f11 : a9 12 __ LDA #$12
2f13 : 8d 00 d6 STA $d600 
.l11374:
2f16 : 2c 00 d6 BIT $d600 
2f19 : 10 fb __ BPL $2f16 ; (main.l11374 + 0)
.s2363:
2f1b : a5 5c __ LDA T5 + 1 
2f1d : 8d 01 d6 STA $d601 
2f20 : a9 13 __ LDA #$13
2f22 : 8d 00 d6 STA $d600 
.l11376:
2f25 : 2c 00 d6 BIT $d600 
2f28 : 10 fb __ BPL $2f25 ; (main.l11376 + 0)
.s2368:
2f2a : a5 5b __ LDA T5 + 0 
2f2c : 8d 01 d6 STA $d601 
2f2f : a9 1f __ LDA #$1f
2f31 : 8d 00 d6 STA $d600 
2f34 : 8e 00 d6 STX $d600 
.l11378:
2f37 : 2c 00 d6 BIT $d600 
2f3a : 10 fb __ BPL $2f37 ; (main.l11378 + 0)
.s2375:
2f3c : ad 01 d6 LDA $d601 
2f3f : 8e 00 d6 STX $d600 
2f42 : 09 80 __ ORA #$80
.l11380:
2f44 : 2c 00 d6 BIT $d600 
2f47 : 10 fb __ BPL $2f44 ; (main.l11380 + 0)
.s2381:
2f49 : 8d 01 d6 STA $d601 
2f4c : a9 20 __ LDA #$20
2f4e : 8d 00 d6 STA $d600 
.l11382:
2f51 : 2c 00 d6 BIT $d600 
2f54 : 10 fb __ BPL $2f51 ; (main.l11382 + 0)
.s2386:
2f56 : a5 5e __ LDA T6 + 1 
2f58 : 8d 01 d6 STA $d601 
2f5b : a9 21 __ LDA #$21
2f5d : 8d 00 d6 STA $d600 
.l11384:
2f60 : 2c 00 d6 BIT $d600 
2f63 : 10 fb __ BPL $2f60 ; (main.l11384 + 0)
.s2391:
2f65 : a5 5d __ LDA T6 + 0 
2f67 : 8d 01 d6 STA $d601 
2f6a : a9 1f __ LDA #$1f
2f6c : 8d 00 d6 STA $d600 
2f6f : a9 1e __ LDA #$1e
2f71 : 8d 00 d6 STA $d600 
.l11386:
2f74 : 2c 00 d6 BIT $d600 
2f77 : 10 fb __ BPL $2f74 ; (main.l11386 + 0)
.s2397:
2f79 : a5 61 __ LDA T8 + 0 
2f7b : 8d 01 d6 STA $d601 
2f7e : ad d6 50 LDA $50d6 ; (vdc_state + 3)
2f81 : 18 __ __ CLC
2f82 : 65 59 __ ADC T4 + 0 
2f84 : 85 59 __ STA T4 + 0 
2f86 : ad d7 50 LDA $50d7 ; (vdc_state + 4)
2f89 : 65 5a __ ADC T4 + 1 
2f8b : 85 5a __ STA T4 + 1 
2f8d : 18 __ __ CLC
2f8e : a5 5b __ LDA T5 + 0 
2f90 : 6d d6 50 ADC $50d6 ; (vdc_state + 3)
2f93 : 85 5b __ STA T5 + 0 
2f95 : a5 5c __ LDA T5 + 1 
2f97 : 6d d7 50 ADC $50d7 ; (vdc_state + 4)
2f9a : c8 __ __ INY
2f9b : 4c 31 2d JMP $2d31 ; (main.l2219 + 0)
.s2037:
2f9e : a9 12 __ LDA #$12
2fa0 : 8d 00 d6 STA $d600 
2fa3 : 98 __ __ TYA
2fa4 : 38 __ __ SEC
2fa5 : ed d6 50 SBC $50d6 ; (vdc_state + 3)
2fa8 : a8 __ __ TAY
2fa9 : a5 58 __ LDA T3 + 1 
2fab : ed d7 50 SBC $50d7 ; (vdc_state + 4)
2fae : 85 58 __ STA T3 + 1 
2fb0 : 98 __ __ TYA
2fb1 : 38 __ __ SEC
2fb2 : e5 59 __ SBC T4 + 0 
2fb4 : 85 5f __ STA T7 + 0 
2fb6 : a5 58 __ LDA T3 + 1 
2fb8 : e5 5a __ SBC T4 + 1 
2fba : 85 60 __ STA T7 + 1 
2fbc : 38 __ __ SEC
2fbd : a5 5b __ LDA T5 + 0 
2fbf : ed d6 50 SBC $50d6 ; (vdc_state + 3)
2fc2 : 85 5b __ STA T5 + 0 
2fc4 : a5 5c __ LDA T5 + 1 
2fc6 : ed d7 50 SBC $50d7 ; (vdc_state + 4)
2fc9 : 85 5c __ STA T5 + 1 
2fcb : 38 __ __ SEC
2fcc : a5 5b __ LDA T5 + 0 
2fce : e5 59 __ SBC T4 + 0 
2fd0 : 85 5d __ STA T6 + 0 
2fd2 : a5 5c __ LDA T5 + 1 
2fd4 : e5 5a __ SBC T4 + 1 
2fd6 : 85 5e __ STA T6 + 1 
.l11330:
2fd8 : 2c 00 d6 BIT $d600 
2fdb : 10 fb __ BPL $2fd8 ; (main.l11330 + 0)
.s2093:
2fdd : a5 5c __ LDA T5 + 1 
2fdf : 8d 01 d6 STA $d601 
2fe2 : a9 13 __ LDA #$13
2fe4 : 8d 00 d6 STA $d600 
.l11332:
2fe7 : 2c 00 d6 BIT $d600 
2fea : 10 fb __ BPL $2fe7 ; (main.l11332 + 0)
.s2098:
2fec : a5 5b __ LDA T5 + 0 
2fee : 8d 01 d6 STA $d601 
2ff1 : a9 1f __ LDA #$1f
2ff3 : 8d 00 d6 STA $d600 
2ff6 : a9 18 __ LDA #$18
2ff8 : 8d 00 d6 STA $d600 
.l11334:
2ffb : 2c 00 d6 BIT $d600 
2ffe : 10 fb __ BPL $2ffb ; (main.l11334 + 0)
.s2105:
3000 : ad 01 d6 LDA $d601 
3003 : a2 18 __ LDX #$18
3005 : 8e 00 d6 STX $d600 
3008 : 09 80 __ ORA #$80
.l11336:
300a : 2c 00 d6 BIT $d600 
300d : 10 fb __ BPL $300a ; (main.l11336 + 0)
.s2111:
300f : 8d 01 d6 STA $d601 
3012 : a9 20 __ LDA #$20
3014 : 8d 00 d6 STA $d600 
.l11338:
3017 : 2c 00 d6 BIT $d600 
301a : 10 fb __ BPL $3017 ; (main.l11338 + 0)
.s2116:
301c : a5 5e __ LDA T6 + 1 
301e : 8d 01 d6 STA $d601 
3021 : a9 21 __ LDA #$21
3023 : 8d 00 d6 STA $d600 
.l11340:
3026 : 2c 00 d6 BIT $d600 
3029 : 10 fb __ BPL $3026 ; (main.l11340 + 0)
.s2121:
302b : a5 5d __ LDA T6 + 0 
302d : 8d 01 d6 STA $d601 
3030 : a9 1f __ LDA #$1f
3032 : 8d 00 d6 STA $d600 
3035 : a9 1e __ LDA #$1e
3037 : 8d 00 d6 STA $d600 
.l11342:
303a : 2c 00 d6 BIT $d600 
303d : 10 fb __ BPL $303a ; (main.l11342 + 0)
.s2127:
303f : a5 43 __ LDA T10 + 0 
3041 : 8d 01 d6 STA $d601 
3044 : a9 12 __ LDA #$12
3046 : 8d 00 d6 STA $d600 
.l11344:
3049 : 2c 00 d6 BIT $d600 
304c : 10 fb __ BPL $3049 ; (main.l11344 + 0)
.s2180:
304e : a5 58 __ LDA T3 + 1 
3050 : 8d 01 d6 STA $d601 
3053 : a9 13 __ LDA #$13
3055 : 8d 00 d6 STA $d600 
.l11346:
3058 : 2c 00 d6 BIT $d600 
305b : 10 fb __ BPL $3058 ; (main.l11346 + 0)
.s2185:
305d : 8c 01 d6 STY $d601 
3060 : a9 1f __ LDA #$1f
3062 : 8d 00 d6 STA $d600 
3065 : 8e 00 d6 STX $d600 
.l11348:
3068 : 2c 00 d6 BIT $d600 
306b : 10 fb __ BPL $3068 ; (main.l11348 + 0)
.s2192:
306d : ad 01 d6 LDA $d601 
3070 : 8e 00 d6 STX $d600 
3073 : 09 80 __ ORA #$80
.l11350:
3075 : 2c 00 d6 BIT $d600 
3078 : 10 fb __ BPL $3075 ; (main.l11350 + 0)
.s2198:
307a : 8d 01 d6 STA $d601 
307d : a9 20 __ LDA #$20
307f : 8d 00 d6 STA $d600 
.l11352:
3082 : 2c 00 d6 BIT $d600 
3085 : 10 fb __ BPL $3082 ; (main.l11352 + 0)
.s2203:
3087 : a5 60 __ LDA T7 + 1 
3089 : 8d 01 d6 STA $d601 
308c : a9 21 __ LDA #$21
308e : 8d 00 d6 STA $d600 
.l11354:
3091 : 2c 00 d6 BIT $d600 
3094 : 10 fb __ BPL $3091 ; (main.l11354 + 0)
.s2208:
3096 : a5 5f __ LDA T7 + 0 
3098 : 8d 01 d6 STA $d601 
309b : a9 1f __ LDA #$1f
309d : 8d 00 d6 STA $d600 
30a0 : a9 1e __ LDA #$1e
30a2 : 8d 00 d6 STA $d600 
.l11356:
30a5 : 2c 00 d6 BIT $d600 
30a8 : 10 fb __ BPL $30a5 ; (main.l11356 + 0)
.s2214:
30aa : a5 43 __ LDA T10 + 0 
30ac : 8d 01 d6 STA $d601 
30af : e6 61 __ INC T8 + 0 
30b1 : 4c cc 2c JMP $2ccc ; (main.l2036 + 0)
.s1676:
30b4 : a5 5b __ LDA T5 + 0 
30b6 : 69 01 __ ADC #$01
30b8 : 85 5d __ STA T6 + 0 
30ba : a5 5c __ LDA T5 + 1 
30bc : 69 00 __ ADC #$00
30be : 85 5e __ STA T6 + 1 
30c0 : 18 __ __ CLC
30c1 : a5 59 __ LDA T4 + 0 
30c3 : 69 01 __ ADC #$01
30c5 : aa __ __ TAX
30c6 : a5 5a __ LDA T4 + 1 
30c8 : 69 00 __ ADC #$00
30ca : a8 __ __ TAY
30cb : ad d4 50 LDA $50d4 ; (vdc_state + 1)
30ce : d0 11 __ BNE $30e1 ; (main.s1681 + 0)
.s1683:
30d0 : a9 03 __ LDA #$03
30d2 : cd e0 50 CMP $50e0 ; (vdc_state + 13)
30d5 : d0 05 __ BNE $30dc ; (main.s1164 + 0)
.s1163:
30d7 : a9 ff __ LDA #$ff
30d9 : cd df 50 CMP $50df ; (vdc_state + 12)
.s1164:
30dc : b0 03 __ BCS $30e1 ; (main.s1681 + 0)
30de : 4c d3 32 JMP $32d3 ; (main.s1680 + 0)
.s1681:
30e1 : ad df 50 LDA $50df ; (vdc_state + 12)
30e4 : 85 1b __ STA ACCU + 0 
30e6 : ad e0 50 LDA $50e0 ; (vdc_state + 13)
30e9 : 85 45 __ STA T13 + 0 
30eb : a9 12 __ LDA #$12
30ed : 8d 00 d6 STA $d600 
.l11271:
30f0 : 2c 00 d6 BIT $d600 
30f3 : 10 fb __ BPL $30f0 ; (main.l11271 + 0)
.s1736:
30f5 : a5 45 __ LDA T13 + 0 
30f7 : 8d 01 d6 STA $d601 
30fa : a9 13 __ LDA #$13
30fc : 8d 00 d6 STA $d600 
.l11273:
30ff : 2c 00 d6 BIT $d600 
3102 : 10 fb __ BPL $30ff ; (main.l11273 + 0)
.s1741:
3104 : a5 1b __ LDA ACCU + 0 
3106 : 8d 01 d6 STA $d601 
3109 : a9 1f __ LDA #$1f
310b : 8d 00 d6 STA $d600 
310e : a9 18 __ LDA #$18
3110 : 8d 00 d6 STA $d600 
.l11275:
3113 : 2c 00 d6 BIT $d600 
3116 : 10 fb __ BPL $3113 ; (main.l11275 + 0)
.s1748:
3118 : ad 01 d6 LDA $d601 
311b : 09 80 __ ORA #$80
311d : 85 47 __ STA T14 + 0 
311f : a9 18 __ LDA #$18
3121 : 8d 00 d6 STA $d600 
.l11277:
3124 : 2c 00 d6 BIT $d600 
3127 : 10 fb __ BPL $3124 ; (main.l11277 + 0)
.s1754:
3129 : a5 47 __ LDA T14 + 0 
312b : 8d 01 d6 STA $d601 
312e : a9 20 __ LDA #$20
3130 : 8d 00 d6 STA $d600 
.l11279:
3133 : 2c 00 d6 BIT $d600 
3136 : 10 fb __ BPL $3133 ; (main.l11279 + 0)
.s1759:
3138 : 8c 01 d6 STY $d601 
313b : a9 21 __ LDA #$21
313d : 8d 00 d6 STA $d600 
.l11281:
3140 : 2c 00 d6 BIT $d600 
3143 : 10 fb __ BPL $3140 ; (main.l11281 + 0)
.s1764:
3145 : 8e 01 d6 STX $d601 
3148 : a9 1f __ LDA #$1f
314a : 8d 00 d6 STA $d600 
314d : a9 1e __ LDA #$1e
314f : 8d 00 d6 STA $d600 
.l11283:
3152 : 2c 00 d6 BIT $d600 
3155 : 10 fb __ BPL $3152 ; (main.l11283 + 0)
.s1770:
3157 : a5 57 __ LDA T3 + 0 
3159 : 8d 01 d6 STA $d601 
315c : a9 12 __ LDA #$12
315e : 8d 00 d6 STA $d600 
.l11285:
3161 : 2c 00 d6 BIT $d600 
3164 : 10 fb __ BPL $3161 ; (main.l11285 + 0)
.s1823:
3166 : a5 5a __ LDA T4 + 1 
3168 : 8d 01 d6 STA $d601 
316b : a9 13 __ LDA #$13
316d : 8d 00 d6 STA $d600 
.l11287:
3170 : 2c 00 d6 BIT $d600 
3173 : 10 fb __ BPL $3170 ; (main.l11287 + 0)
.s1828:
3175 : a5 59 __ LDA T4 + 0 
3177 : 8d 01 d6 STA $d601 
317a : a9 1f __ LDA #$1f
317c : 8d 00 d6 STA $d600 
317f : a9 18 __ LDA #$18
3181 : 8d 00 d6 STA $d600 
.l11289:
3184 : 2c 00 d6 BIT $d600 
3187 : 10 fb __ BPL $3184 ; (main.l11289 + 0)
.s1835:
3189 : ad 01 d6 LDA $d601 
318c : 09 80 __ ORA #$80
318e : aa __ __ TAX
318f : a9 18 __ LDA #$18
3191 : 8d 00 d6 STA $d600 
.l11291:
3194 : 2c 00 d6 BIT $d600 
3197 : 10 fb __ BPL $3194 ; (main.l11291 + 0)
.s1841:
3199 : 8e 01 d6 STX $d601 
319c : a9 20 __ LDA #$20
319e : 8d 00 d6 STA $d600 
.l11293:
31a1 : 2c 00 d6 BIT $d600 
31a4 : 10 fb __ BPL $31a1 ; (main.l11293 + 0)
.s1846:
31a6 : a5 45 __ LDA T13 + 0 
31a8 : 8d 01 d6 STA $d601 
31ab : a9 21 __ LDA #$21
31ad : 8d 00 d6 STA $d600 
.l11295:
31b0 : 2c 00 d6 BIT $d600 
31b3 : 10 fb __ BPL $31b0 ; (main.l11295 + 0)
.s1851:
31b5 : a5 1b __ LDA ACCU + 0 
31b7 : 8d 01 d6 STA $d601 
31ba : a9 1f __ LDA #$1f
31bc : 8d 00 d6 STA $d600 
31bf : a9 1e __ LDA #$1e
31c1 : 8d 00 d6 STA $d600 
.l11297:
31c4 : 2c 00 d6 BIT $d600 
31c7 : 10 fb __ BPL $31c4 ; (main.l11297 + 0)
.s1857:
31c9 : a5 57 __ LDA T3 + 0 
31cb : 8d 01 d6 STA $d601 
31ce : a9 12 __ LDA #$12
31d0 : 8d 00 d6 STA $d600 
.l11299:
31d3 : 2c 00 d6 BIT $d600 
31d6 : 10 fb __ BPL $31d3 ; (main.l11299 + 0)
.s1910:
31d8 : a5 45 __ LDA T13 + 0 
31da : 8d 01 d6 STA $d601 
31dd : a9 13 __ LDA #$13
31df : 8d 00 d6 STA $d600 
.l11301:
31e2 : 2c 00 d6 BIT $d600 
31e5 : 10 fb __ BPL $31e2 ; (main.l11301 + 0)
.s1915:
31e7 : a5 1b __ LDA ACCU + 0 
31e9 : 8d 01 d6 STA $d601 
31ec : a9 1f __ LDA #$1f
31ee : 8d 00 d6 STA $d600 
31f1 : a9 18 __ LDA #$18
31f3 : 8d 00 d6 STA $d600 
.l11303:
31f6 : 2c 00 d6 BIT $d600 
31f9 : 10 fb __ BPL $31f6 ; (main.l11303 + 0)
.s1922:
31fb : ad 01 d6 LDA $d601 
31fe : 09 80 __ ORA #$80
3200 : aa __ __ TAX
3201 : a9 18 __ LDA #$18
3203 : 8d 00 d6 STA $d600 
.l11305:
3206 : 2c 00 d6 BIT $d600 
3209 : 10 fb __ BPL $3206 ; (main.l11305 + 0)
.s1928:
320b : 8e 01 d6 STX $d601 
320e : a9 20 __ LDA #$20
3210 : 8d 00 d6 STA $d600 
.l11307:
3213 : 2c 00 d6 BIT $d600 
3216 : 10 fb __ BPL $3213 ; (main.l11307 + 0)
.s1933:
3218 : a5 5e __ LDA T6 + 1 
321a : 8d 01 d6 STA $d601 
321d : a9 21 __ LDA #$21
321f : 8d 00 d6 STA $d600 
.l11309:
3222 : 2c 00 d6 BIT $d600 
3225 : 10 fb __ BPL $3222 ; (main.l11309 + 0)
.s1938:
3227 : a5 5d __ LDA T6 + 0 
3229 : 8d 01 d6 STA $d601 
322c : a9 1f __ LDA #$1f
322e : 8d 00 d6 STA $d600 
3231 : a9 1e __ LDA #$1e
3233 : 8d 00 d6 STA $d600 
.l11311:
3236 : 2c 00 d6 BIT $d600 
3239 : 10 fb __ BPL $3236 ; (main.l11311 + 0)
.s1944:
323b : a5 57 __ LDA T3 + 0 
323d : 8d 01 d6 STA $d601 
3240 : a9 12 __ LDA #$12
3242 : 8d 00 d6 STA $d600 
.l11313:
3245 : 2c 00 d6 BIT $d600 
3248 : 10 fb __ BPL $3245 ; (main.l11313 + 0)
.s1997:
324a : a5 5c __ LDA T5 + 1 
324c : 8d 01 d6 STA $d601 
324f : a9 13 __ LDA #$13
3251 : 8d 00 d6 STA $d600 
.l11315:
3254 : 2c 00 d6 BIT $d600 
3257 : 10 fb __ BPL $3254 ; (main.l11315 + 0)
.s2002:
3259 : a5 5b __ LDA T5 + 0 
325b : 8d 01 d6 STA $d601 
325e : a9 1f __ LDA #$1f
3260 : 8d 00 d6 STA $d600 
3263 : a9 18 __ LDA #$18
3265 : 8d 00 d6 STA $d600 
.l11317:
3268 : 2c 00 d6 BIT $d600 
326b : 10 fb __ BPL $3268 ; (main.l11317 + 0)
.s2009:
326d : ad 01 d6 LDA $d601 
3270 : 09 80 __ ORA #$80
3272 : aa __ __ TAX
3273 : a9 18 __ LDA #$18
3275 : 8d 00 d6 STA $d600 
.l11319:
3278 : 2c 00 d6 BIT $d600 
327b : 10 fb __ BPL $3278 ; (main.l11319 + 0)
.s2015:
327d : 8e 01 d6 STX $d601 
3280 : a9 20 __ LDA #$20
3282 : 8d 00 d6 STA $d600 
.l11321:
3285 : 2c 00 d6 BIT $d600 
3288 : 10 fb __ BPL $3285 ; (main.l11321 + 0)
.s2020:
328a : a5 45 __ LDA T13 + 0 
328c : 8d 01 d6 STA $d601 
328f : a9 21 __ LDA #$21
3291 : 8d 00 d6 STA $d600 
.l11323:
3294 : 2c 00 d6 BIT $d600 
3297 : 10 fb __ BPL $3294 ; (main.l11323 + 0)
.s2025:
3299 : a5 1b __ LDA ACCU + 0 
329b : 8d 01 d6 STA $d601 
329e : a9 1f __ LDA #$1f
32a0 : 8d 00 d6 STA $d600 
32a3 : a9 1e __ LDA #$1e
32a5 : 8d 00 d6 STA $d600 
.l11325:
32a8 : 2c 00 d6 BIT $d600 
32ab : 10 fb __ BPL $32a8 ; (main.l11325 + 0)
.s2031:
32ad : a5 57 __ LDA T3 + 0 
32af : 8d 01 d6 STA $d601 
.s1679:
32b2 : ad d6 50 LDA $50d6 ; (vdc_state + 3)
32b5 : 18 __ __ CLC
32b6 : 65 59 __ ADC T4 + 0 
32b8 : 85 59 __ STA T4 + 0 
32ba : ad d7 50 LDA $50d7 ; (vdc_state + 4)
32bd : 65 5a __ ADC T4 + 1 
32bf : 85 5a __ STA T4 + 1 
32c1 : 18 __ __ CLC
32c2 : a5 5b __ LDA T5 + 0 
32c4 : 6d d6 50 ADC $50d6 ; (vdc_state + 3)
32c7 : 85 5b __ STA T5 + 0 
32c9 : a5 5c __ LDA T5 + 1 
32cb : 6d d7 50 ADC $50d7 ; (vdc_state + 4)
32ce : e6 61 __ INC T8 + 0 
32d0 : 4c 44 2c JMP $2c44 ; (main.l1675 + 0)
.s1680:
32d3 : 86 0f __ STX P2 
32d5 : 84 10 __ STY P3 
32d7 : 20 38 14 JSR $1438 ; (bnk_cpyfromvdc@proxy + 0)
32da : a5 59 __ LDA T4 + 0 
32dc : 85 0d __ STA P0 
32de : a5 5a __ LDA T4 + 1 
32e0 : 85 0e __ STA P1 
32e2 : 20 ea 14 JSR $14ea ; (bnk_cpytovdc@proxy + 0)
32e5 : a5 5d __ LDA T6 + 0 
32e7 : 85 0f __ STA P2 
32e9 : a5 5e __ LDA T6 + 1 
32eb : 85 10 __ STA P3 
32ed : 20 be 14 JSR $14be ; (bnk_cpyfromvdc@proxy + 0)
32f0 : a5 5b __ LDA T5 + 0 
32f2 : 85 0d __ STA P0 
32f4 : a5 5c __ LDA T5 + 1 
32f6 : 85 0e __ STA P1 
32f8 : 20 ea 14 JSR $14ea ; (bnk_cpytovdc@proxy + 0)
32fb : 4c b2 32 JMP $32b2 ; (main.s1679 + 0)
.s1315:
32fe : a5 59 __ LDA T4 + 0 
3300 : 69 01 __ ADC #$01
3302 : 85 5d __ STA T6 + 0 
3304 : a5 5a __ LDA T4 + 1 
3306 : 69 00 __ ADC #$00
3308 : 85 5e __ STA T6 + 1 
330a : 18 __ __ CLC
330b : a5 5b __ LDA T5 + 0 
330d : 69 01 __ ADC #$01
330f : 85 5f __ STA T7 + 0 
3311 : a5 5c __ LDA T5 + 1 
3313 : 69 00 __ ADC #$00
3315 : 85 60 __ STA T7 + 1 
3317 : ad d4 50 LDA $50d4 ; (vdc_state + 1)
331a : d0 11 __ BNE $332d ; (main.s1320 + 0)
.s1322:
331c : a9 03 __ LDA #$03
331e : cd e0 50 CMP $50e0 ; (vdc_state + 13)
3321 : d0 05 __ BNE $3328 ; (main.s1224 + 0)
.s1223:
3323 : a9 ff __ LDA #$ff
3325 : cd df 50 CMP $50df ; (vdc_state + 12)
.s1224:
3328 : b0 03 __ BCS $332d ; (main.s1320 + 0)
332a : 4c 18 35 JMP $3518 ; (main.s1319 + 0)
.s1320:
332d : a9 12 __ LDA #$12
332f : 8d 00 d6 STA $d600 
3332 : ac e0 50 LDY $50e0 ; (vdc_state + 13)
3335 : ae df 50 LDX $50df ; (vdc_state + 12)
.l11211:
3338 : 2c 00 d6 BIT $d600 
333b : 10 fb __ BPL $3338 ; (main.l11211 + 0)
.s1375:
333d : 8c 01 d6 STY $d601 
3340 : a9 13 __ LDA #$13
3342 : 8d 00 d6 STA $d600 
.l11213:
3345 : 2c 00 d6 BIT $d600 
3348 : 10 fb __ BPL $3345 ; (main.l11213 + 0)
.s1380:
334a : 8e 01 d6 STX $d601 
334d : a9 1f __ LDA #$1f
334f : 8d 00 d6 STA $d600 
3352 : a9 18 __ LDA #$18
3354 : 8d 00 d6 STA $d600 
.l11215:
3357 : 2c 00 d6 BIT $d600 
335a : 10 fb __ BPL $3357 ; (main.l11215 + 0)
.s1387:
335c : ad 01 d6 LDA $d601 
335f : 09 80 __ ORA #$80
3361 : 85 47 __ STA T14 + 0 
3363 : a9 18 __ LDA #$18
3365 : 8d 00 d6 STA $d600 
.l11217:
3368 : 2c 00 d6 BIT $d600 
336b : 10 fb __ BPL $3368 ; (main.l11217 + 0)
.s1393:
336d : a5 47 __ LDA T14 + 0 
336f : 8d 01 d6 STA $d601 
3372 : a9 20 __ LDA #$20
3374 : 8d 00 d6 STA $d600 
.l11219:
3377 : 2c 00 d6 BIT $d600 
337a : 10 fb __ BPL $3377 ; (main.l11219 + 0)
.s1398:
337c : a5 5a __ LDA T4 + 1 
337e : 8d 01 d6 STA $d601 
3381 : a9 21 __ LDA #$21
3383 : 8d 00 d6 STA $d600 
.l11221:
3386 : 2c 00 d6 BIT $d600 
3389 : 10 fb __ BPL $3386 ; (main.l11221 + 0)
.s1403:
338b : a5 59 __ LDA T4 + 0 
338d : 8d 01 d6 STA $d601 
3390 : a9 1f __ LDA #$1f
3392 : 8d 00 d6 STA $d600 
3395 : a9 1e __ LDA #$1e
3397 : 8d 00 d6 STA $d600 
.l11223:
339a : 2c 00 d6 BIT $d600 
339d : 10 fb __ BPL $339a ; (main.l11223 + 0)
.s1409:
339f : a5 57 __ LDA T3 + 0 
33a1 : 8d 01 d6 STA $d601 
33a4 : a9 12 __ LDA #$12
33a6 : 8d 00 d6 STA $d600 
.l11225:
33a9 : 2c 00 d6 BIT $d600 
33ac : 10 fb __ BPL $33a9 ; (main.l11225 + 0)
.s1462:
33ae : a5 5e __ LDA T6 + 1 
33b0 : 8d 01 d6 STA $d601 
33b3 : a9 13 __ LDA #$13
33b5 : 8d 00 d6 STA $d600 
.l11227:
33b8 : 2c 00 d6 BIT $d600 
33bb : 10 fb __ BPL $33b8 ; (main.l11227 + 0)
.s1467:
33bd : a5 5d __ LDA T6 + 0 
33bf : 8d 01 d6 STA $d601 
33c2 : a9 1f __ LDA #$1f
33c4 : 8d 00 d6 STA $d600 
33c7 : a9 18 __ LDA #$18
33c9 : 8d 00 d6 STA $d600 
.l11229:
33cc : 2c 00 d6 BIT $d600 
33cf : 10 fb __ BPL $33cc ; (main.l11229 + 0)
.s1474:
33d1 : ad 01 d6 LDA $d601 
33d4 : 09 80 __ ORA #$80
33d6 : 85 5d __ STA T6 + 0 
33d8 : a9 18 __ LDA #$18
33da : 8d 00 d6 STA $d600 
.l11231:
33dd : 2c 00 d6 BIT $d600 
33e0 : 10 fb __ BPL $33dd ; (main.l11231 + 0)
.s1480:
33e2 : a5 5d __ LDA T6 + 0 
33e4 : 8d 01 d6 STA $d601 
33e7 : a9 20 __ LDA #$20
33e9 : 8d 00 d6 STA $d600 
.l11233:
33ec : 2c 00 d6 BIT $d600 
33ef : 10 fb __ BPL $33ec ; (main.l11233 + 0)
.s1485:
33f1 : 8c 01 d6 STY $d601 
33f4 : a9 21 __ LDA #$21
33f6 : 8d 00 d6 STA $d600 
.l11235:
33f9 : 2c 00 d6 BIT $d600 
33fc : 10 fb __ BPL $33f9 ; (main.l11235 + 0)
.s1490:
33fe : 8e 01 d6 STX $d601 
3401 : a9 1f __ LDA #$1f
3403 : 8d 00 d6 STA $d600 
3406 : a9 1e __ LDA #$1e
3408 : 8d 00 d6 STA $d600 
.l11237:
340b : 2c 00 d6 BIT $d600 
340e : 10 fb __ BPL $340b ; (main.l11237 + 0)
.s1496:
3410 : a5 57 __ LDA T3 + 0 
3412 : 8d 01 d6 STA $d601 
3415 : a9 12 __ LDA #$12
3417 : 8d 00 d6 STA $d600 
.l11239:
341a : 2c 00 d6 BIT $d600 
341d : 10 fb __ BPL $341a ; (main.l11239 + 0)
.s1549:
341f : 8c 01 d6 STY $d601 
3422 : a9 13 __ LDA #$13
3424 : 8d 00 d6 STA $d600 
.l11241:
3427 : 2c 00 d6 BIT $d600 
342a : 10 fb __ BPL $3427 ; (main.l11241 + 0)
.s1554:
342c : 8e 01 d6 STX $d601 
342f : a9 1f __ LDA #$1f
3431 : 8d 00 d6 STA $d600 
3434 : a9 18 __ LDA #$18
3436 : 8d 00 d6 STA $d600 
.l11243:
3439 : 2c 00 d6 BIT $d600 
343c : 10 fb __ BPL $3439 ; (main.l11243 + 0)
.s1561:
343e : ad 01 d6 LDA $d601 
3441 : 09 80 __ ORA #$80
3443 : 85 5d __ STA T6 + 0 
3445 : a9 18 __ LDA #$18
3447 : 8d 00 d6 STA $d600 
.l11245:
344a : 2c 00 d6 BIT $d600 
344d : 10 fb __ BPL $344a ; (main.l11245 + 0)
.s1567:
344f : a5 5d __ LDA T6 + 0 
3451 : 8d 01 d6 STA $d601 
3454 : a9 20 __ LDA #$20
3456 : 8d 00 d6 STA $d600 
.l11247:
3459 : 2c 00 d6 BIT $d600 
345c : 10 fb __ BPL $3459 ; (main.l11247 + 0)
.s1572:
345e : a5 5c __ LDA T5 + 1 
3460 : 8d 01 d6 STA $d601 
3463 : a9 21 __ LDA #$21
3465 : 8d 00 d6 STA $d600 
.l11249:
3468 : 2c 00 d6 BIT $d600 
346b : 10 fb __ BPL $3468 ; (main.l11249 + 0)
.s1577:
346d : a5 5b __ LDA T5 + 0 
346f : 8d 01 d6 STA $d601 
3472 : a9 1f __ LDA #$1f
3474 : 8d 00 d6 STA $d600 
3477 : a9 1e __ LDA #$1e
3479 : 8d 00 d6 STA $d600 
.l11251:
347c : 2c 00 d6 BIT $d600 
347f : 10 fb __ BPL $347c ; (main.l11251 + 0)
.s1583:
3481 : a5 57 __ LDA T3 + 0 
3483 : 8d 01 d6 STA $d601 
3486 : a9 12 __ LDA #$12
3488 : 8d 00 d6 STA $d600 
.l11253:
348b : 2c 00 d6 BIT $d600 
348e : 10 fb __ BPL $348b ; (main.l11253 + 0)
.s1636:
3490 : a5 60 __ LDA T7 + 1 
3492 : 8d 01 d6 STA $d601 
3495 : a9 13 __ LDA #$13
3497 : 8d 00 d6 STA $d600 
.l11255:
349a : 2c 00 d6 BIT $d600 
349d : 10 fb __ BPL $349a ; (main.l11255 + 0)
.s1641:
349f : a5 5f __ LDA T7 + 0 
34a1 : 8d 01 d6 STA $d601 
34a4 : a9 1f __ LDA #$1f
34a6 : 8d 00 d6 STA $d600 
34a9 : a9 18 __ LDA #$18
34ab : 8d 00 d6 STA $d600 
.l11257:
34ae : 2c 00 d6 BIT $d600 
34b1 : 10 fb __ BPL $34ae ; (main.l11257 + 0)
.s1648:
34b3 : ad 01 d6 LDA $d601 
34b6 : 09 80 __ ORA #$80
34b8 : 85 5d __ STA T6 + 0 
34ba : a9 18 __ LDA #$18
34bc : 8d 00 d6 STA $d600 
.l11259:
34bf : 2c 00 d6 BIT $d600 
34c2 : 10 fb __ BPL $34bf ; (main.l11259 + 0)
.s1654:
34c4 : a5 5d __ LDA T6 + 0 
34c6 : 8d 01 d6 STA $d601 
34c9 : a9 20 __ LDA #$20
34cb : 8d 00 d6 STA $d600 
.l11261:
34ce : 2c 00 d6 BIT $d600 
34d1 : 10 fb __ BPL $34ce ; (main.l11261 + 0)
.s1659:
34d3 : 8c 01 d6 STY $d601 
34d6 : a9 21 __ LDA #$21
34d8 : 8d 00 d6 STA $d600 
.l11263:
34db : 2c 00 d6 BIT $d600 
34de : 10 fb __ BPL $34db ; (main.l11263 + 0)
.s1664:
34e0 : 8e 01 d6 STX $d601 
34e3 : a9 1f __ LDA #$1f
34e5 : 8d 00 d6 STA $d600 
34e8 : a9 1e __ LDA #$1e
34ea : 8d 00 d6 STA $d600 
.l11265:
34ed : 2c 00 d6 BIT $d600 
34f0 : 10 fb __ BPL $34ed ; (main.l11265 + 0)
.s1670:
34f2 : a5 57 __ LDA T3 + 0 
34f4 : 8d 01 d6 STA $d601 
.s1318:
34f7 : ad d6 50 LDA $50d6 ; (vdc_state + 3)
34fa : 18 __ __ CLC
34fb : 65 59 __ ADC T4 + 0 
34fd : 85 59 __ STA T4 + 0 
34ff : ad d7 50 LDA $50d7 ; (vdc_state + 4)
3502 : 65 5a __ ADC T4 + 1 
3504 : 85 5a __ STA T4 + 1 
3506 : 18 __ __ CLC
3507 : a5 5b __ LDA T5 + 0 
3509 : 6d d6 50 ADC $50d6 ; (vdc_state + 3)
350c : 85 5b __ STA T5 + 0 
350e : a5 5c __ LDA T5 + 1 
3510 : 6d d7 50 ADC $50d7 ; (vdc_state + 4)
3513 : e6 61 __ INC T8 + 0 
3515 : 4c ee 2b JMP $2bee ; (main.l1314 + 0)
.s1319:
3518 : a5 59 __ LDA T4 + 0 
351a : 85 0f __ STA P2 
351c : a5 5a __ LDA T4 + 1 
351e : 85 10 __ STA P3 
3520 : 20 38 14 JSR $1438 ; (bnk_cpyfromvdc@proxy + 0)
3523 : a5 5d __ LDA T6 + 0 
3525 : 85 0d __ STA P0 
3527 : a5 5e __ LDA T6 + 1 
3529 : 85 0e __ STA P1 
352b : 20 ea 14 JSR $14ea ; (bnk_cpytovdc@proxy + 0)
352e : a5 5b __ LDA T5 + 0 
3530 : 85 0f __ STA P2 
3532 : a5 5c __ LDA T5 + 1 
3534 : 85 10 __ STA P3 
3536 : 20 be 14 JSR $14be ; (bnk_cpyfromvdc@proxy + 0)
3539 : a5 5f __ LDA T7 + 0 
353b : 85 0d __ STA P0 
353d : a5 60 __ LDA T7 + 1 
353f : 85 0e __ STA P1 
3541 : 20 ea 14 JSR $14ea ; (bnk_cpytovdc@proxy + 0)
3544 : 4c f7 34 JMP $34f7 ; (main.s1318 + 0)
.s1097:
3547 : 98 __ __ TYA
3548 : 0a __ __ ASL
3549 : aa __ __ TAX
354a : bd 00 52 LDA $5200,x ; (multab + 0)
354d : 18 __ __ CLC
354e : 69 4b __ ADC #$4b
3550 : 85 59 __ STA T4 + 0 
3552 : a9 12 __ LDA #$12
3554 : 8d 00 d6 STA $d600 
3557 : bd 01 52 LDA $5201,x ; (multab + 1)
355a : 69 00 __ ADC #$00
355c : 85 5a __ STA T4 + 1 
355e : 18 __ __ CLC
355f : a5 59 __ LDA T4 + 0 
3561 : 6d db 50 ADC $50db ; (vdc_state + 8)
3564 : aa __ __ TAX
3565 : a5 5a __ LDA T4 + 1 
3567 : 6d dc 50 ADC $50dc ; (vdc_state + 9)
.l11138:
356a : 2c 00 d6 BIT $d600 
356d : 10 fb __ BPL $356a ; (main.l11138 + 0)
.s1109:
356f : 8d 01 d6 STA $d601 
3572 : a9 13 __ LDA #$13
3574 : 8d 00 d6 STA $d600 
.l11140:
3577 : 2c 00 d6 BIT $d600 
357a : 10 fb __ BPL $3577 ; (main.l11140 + 0)
.s1114:
357c : 8e 01 d6 STX $d601 
357f : a9 1f __ LDA #$1f
3581 : 8d 00 d6 STA $d600 
.l11142:
3584 : 2c 00 d6 BIT $d600 
3587 : 10 fb __ BPL $3584 ; (main.l11142 + 0)
.s1118:
3589 : a9 61 __ LDA #$61
358b : 8d 01 d6 STA $d601 
358e : ad dd 50 LDA $50dd ; (vdc_state + 10)
3591 : 18 __ __ CLC
3592 : 65 59 __ ADC T4 + 0 
3594 : aa __ __ TAX
3595 : a9 12 __ LDA #$12
3597 : 8d 00 d6 STA $d600 
359a : ad de 50 LDA $50de ; (vdc_state + 11)
359d : 65 5a __ ADC T4 + 1 
.l11144:
359f : 2c 00 d6 BIT $d600 
35a2 : 10 fb __ BPL $359f ; (main.l11144 + 0)
.s1125:
35a4 : 8d 01 d6 STA $d601 
35a7 : a9 13 __ LDA #$13
35a9 : 8d 00 d6 STA $d600 
.l11146:
35ac : 2c 00 d6 BIT $d600 
35af : 10 fb __ BPL $35ac ; (main.l11146 + 0)
.s1130:
35b1 : 8e 01 d6 STX $d601 
35b4 : a9 1f __ LDA #$1f
35b6 : 8d 00 d6 STA $d600 
.l11148:
35b9 : 2c 00 d6 BIT $d600 
35bc : 10 fb __ BPL $35b9 ; (main.l11148 + 0)
.s1134:
35be : a9 09 __ LDA #$09
35c0 : 8d 01 d6 STA $d601 
35c3 : c8 __ __ INY
35c4 : 4c c0 26 JMP $26c0 ; (main.l1096 + 0)
.s1057:
35c7 : 98 __ __ TYA
35c8 : 0a __ __ ASL
35c9 : aa __ __ TAX
35ca : bd 00 52 LDA $5200,x ; (multab + 0)
35cd : 18 __ __ CLC
35ce : 69 04 __ ADC #$04
35d0 : 85 57 __ STA T3 + 0 
35d2 : a9 12 __ LDA #$12
35d4 : 8d 00 d6 STA $d600 
35d7 : bd 01 52 LDA $5201,x ; (multab + 1)
35da : 69 00 __ ADC #$00
35dc : 85 58 __ STA T3 + 1 
35de : 18 __ __ CLC
35df : a5 57 __ LDA T3 + 0 
35e1 : 6d db 50 ADC $50db ; (vdc_state + 8)
35e4 : aa __ __ TAX
35e5 : a5 58 __ LDA T3 + 1 
35e7 : 6d dc 50 ADC $50dc ; (vdc_state + 9)
.l11125:
35ea : 2c 00 d6 BIT $d600 
35ed : 10 fb __ BPL $35ea ; (main.l11125 + 0)
.s1069:
35ef : 8d 01 d6 STA $d601 
35f2 : a9 13 __ LDA #$13
35f4 : 8d 00 d6 STA $d600 
.l11127:
35f7 : 2c 00 d6 BIT $d600 
35fa : 10 fb __ BPL $35f7 ; (main.l11127 + 0)
.s1074:
35fc : 8e 01 d6 STX $d601 
35ff : a9 1f __ LDA #$1f
3601 : 8d 00 d6 STA $d600 
.l11129:
3604 : 2c 00 d6 BIT $d600 
3607 : 10 fb __ BPL $3604 ; (main.l11129 + 0)
.s1078:
3609 : a9 e1 __ LDA #$e1
360b : 8d 01 d6 STA $d601 
360e : ad dd 50 LDA $50dd ; (vdc_state + 10)
3611 : 18 __ __ CLC
3612 : 65 57 __ ADC T3 + 0 
3614 : aa __ __ TAX
3615 : a9 12 __ LDA #$12
3617 : 8d 00 d6 STA $d600 
361a : ad de 50 LDA $50de ; (vdc_state + 11)
361d : 65 58 __ ADC T3 + 1 
.l11131:
361f : 2c 00 d6 BIT $d600 
3622 : 10 fb __ BPL $361f ; (main.l11131 + 0)
.s1085:
3624 : 8d 01 d6 STA $d601 
3627 : a9 13 __ LDA #$13
3629 : 8d 00 d6 STA $d600 
.l11133:
362c : 2c 00 d6 BIT $d600 
362f : 10 fb __ BPL $362c ; (main.l11133 + 0)
.s1090:
3631 : 8e 01 d6 STX $d601 
3634 : a9 1f __ LDA #$1f
3636 : 8d 00 d6 STA $d600 
.l11135:
3639 : 2c 00 d6 BIT $d600 
363c : 10 fb __ BPL $3639 ; (main.l11135 + 0)
.s1094:
363e : a9 09 __ LDA #$09
3640 : 8d 01 d6 STA $d601 
3643 : c8 __ __ INY
3644 : 4c a4 26 JMP $26a4 ; (main.l1056 + 0)
.s752:
3647 : 0a __ __ ASL
3648 : aa __ __ TAX
3649 : ad da 50 LDA $50da ; (vdc_state + 7)
364c : 85 43 __ STA T10 + 0 
364e : a9 12 __ LDA #$12
3650 : 8d 00 d6 STA $d600 
3653 : a5 5b __ LDA T5 + 0 
3655 : 38 __ __ SEC
3656 : e9 01 __ SBC #$01
3658 : 85 62 __ STA T12 + 0 
365a : bd 00 52 LDA $5200,x ; (multab + 0)
365d : 85 5f __ STA T7 + 0 
365f : 18 __ __ CLC
3660 : 6d db 50 ADC $50db ; (vdc_state + 8)
3663 : a8 __ __ TAY
3664 : bd 01 52 LDA $5201,x ; (multab + 1)
3667 : 85 60 __ STA T7 + 1 
3669 : 6d dc 50 ADC $50dc ; (vdc_state + 9)
.l11509:
366c : 2c 00 d6 BIT $d600 
366f : 10 fb __ BPL $366c ; (main.l11509 + 0)
.s764:
3671 : 8d 01 d6 STA $d601 
3674 : a9 13 __ LDA #$13
3676 : 8d 00 d6 STA $d600 
.l11511:
3679 : 2c 00 d6 BIT $d600 
367c : 10 fb __ BPL $3679 ; (main.l11511 + 0)
.s769:
367e : 8c 01 d6 STY $d601 
3681 : a9 1f __ LDA #$1f
3683 : 8d 00 d6 STA $d600 
.l11513:
3686 : 2c 00 d6 BIT $d600 
3689 : 10 fb __ BPL $3686 ; (main.l11513 + 0)
.s773:
368b : a9 20 __ LDA #$20
368d : 8d 01 d6 STA $d601 
3690 : a9 18 __ LDA #$18
3692 : 8d 00 d6 STA $d600 
.l11515:
3695 : 2c 00 d6 BIT $d600 
3698 : 10 fb __ BPL $3695 ; (main.l11515 + 0)
.s779:
369a : ad 01 d6 LDA $d601 
369d : 29 7f __ AND #$7f
369f : a8 __ __ TAY
36a0 : a9 18 __ LDA #$18
36a2 : 8d 00 d6 STA $d600 
.l11517:
36a5 : 2c 00 d6 BIT $d600 
36a8 : 10 fb __ BPL $36a5 ; (main.l11517 + 0)
.s785:
36aa : 8c 01 d6 STY $d601 
36ad : a9 1e __ LDA #$1e
36af : 8d 00 d6 STA $d600 
.l11519:
36b2 : 2c 00 d6 BIT $d600 
36b5 : 10 fb __ BPL $36b2 ; (main.l11519 + 0)
.s790:
36b7 : a5 62 __ LDA T12 + 0 
36b9 : 8d 01 d6 STA $d601 
36bc : ad dd 50 LDA $50dd ; (vdc_state + 10)
36bf : 18 __ __ CLC
36c0 : 65 5f __ ADC T7 + 0 
36c2 : aa __ __ TAX
36c3 : a9 12 __ LDA #$12
36c5 : 8d 00 d6 STA $d600 
36c8 : ad de 50 LDA $50de ; (vdc_state + 11)
36cb : 65 60 __ ADC T7 + 1 
.l11521:
36cd : 2c 00 d6 BIT $d600 
36d0 : 10 fb __ BPL $36cd ; (main.l11521 + 0)
.s797:
36d2 : 8d 01 d6 STA $d601 
36d5 : a9 13 __ LDA #$13
36d7 : 8d 00 d6 STA $d600 
.l11523:
36da : 2c 00 d6 BIT $d600 
36dd : 10 fb __ BPL $36da ; (main.l11523 + 0)
.s802:
36df : 8e 01 d6 STX $d601 
36e2 : a9 1f __ LDA #$1f
36e4 : 8d 00 d6 STA $d600 
.l11525:
36e7 : 2c 00 d6 BIT $d600 
36ea : 10 fb __ BPL $36e7 ; (main.l11525 + 0)
.s806:
36ec : a5 43 __ LDA T10 + 0 
36ee : 8d 01 d6 STA $d601 
36f1 : a9 18 __ LDA #$18
36f3 : 8d 00 d6 STA $d600 
.l11527:
36f6 : 2c 00 d6 BIT $d600 
36f9 : 10 fb __ BPL $36f6 ; (main.l11527 + 0)
.s812:
36fb : ad 01 d6 LDA $d601 
36fe : 29 7f __ AND #$7f
3700 : aa __ __ TAX
3701 : a9 18 __ LDA #$18
3703 : 8d 00 d6 STA $d600 
.l11529:
3706 : 2c 00 d6 BIT $d600 
3709 : 10 fb __ BPL $3706 ; (main.l11529 + 0)
.s818:
370b : 8e 01 d6 STX $d601 
370e : a9 1e __ LDA #$1e
3710 : 8d 00 d6 STA $d600 
.l11531:
3713 : 2c 00 d6 BIT $d600 
3716 : 10 fb __ BPL $3713 ; (main.l11531 + 0)
.s823:
3718 : a5 62 __ LDA T12 + 0 
371a : 8d 01 d6 STA $d601 
371d : e6 61 __ INC T8 + 0 
371f : 4c 1c 23 JMP $231c ; (main.l751 + 0)
.s700:
3722 : ad 8d bf LDA $bf8d ; (softscroll + 11)
3725 : 69 02 __ ADC #$02
3727 : 8d 8d bf STA $bf8d ; (softscroll + 11)
372a : 90 03 __ BCC $372f ; (main.s1728 + 0)
.s1727:
372c : ee 8e bf INC $bf8e ; (softscroll + 12)
.s1728:
372f : a9 01 __ LDA #$01
3731 : cd 8a bf CMP $bf8a ; (softscroll + 8)
3734 : b0 03 __ BCS $3739 ; (main.s705 + 0)
3736 : 4c c9 37 JMP $37c9 ; (main.s704 + 0)
.s705:
3739 : a9 06 __ LDA #$06
373b : 8d 8a bf STA $bf8a ; (softscroll + 8)
373e : ad 87 bf LDA $bf87 ; (softscroll + 5)
3741 : 18 __ __ CLC
3742 : 69 01 __ ADC #$01
3744 : 85 5d __ STA T6 + 0 
3746 : 8d 87 bf STA $bf87 ; (softscroll + 5)
3749 : ad 88 bf LDA $bf88 ; (softscroll + 6)
374c : 69 00 __ ADC #$00
374e : 85 5e __ STA T6 + 1 
3750 : 8d 88 bf STA $bf88 ; (softscroll + 6)
.l11540:
3753 : ad 00 d6 LDA $d600 
3756 : 29 20 __ AND #$20
3758 : d0 f9 __ BNE $3753 ; (main.l11540 + 0)
.s715:
375a : ad dd 50 LDA $50dd ; (vdc_state + 10)
375d : 18 __ __ CLC
375e : 65 5d __ ADC T6 + 0 
3760 : aa __ __ TAX
3761 : ad de 50 LDA $50de ; (vdc_state + 11)
3764 : 65 5e __ ADC T6 + 1 
3766 : a8 __ __ TAY
3767 : ad db 50 LDA $50db ; (vdc_state + 8)
376a : 18 __ __ CLC
376b : 65 5d __ ADC T6 + 0 
376d : 85 5d __ STA T6 + 0 
376f : a9 0c __ LDA #$0c
3771 : 8d 00 d6 STA $d600 
3774 : ad dc 50 LDA $50dc ; (vdc_state + 9)
3777 : 65 5e __ ADC T6 + 1 
.l11542:
3779 : 2c 00 d6 BIT $d600 
377c : 10 fb __ BPL $3779 ; (main.l11542 + 0)
.s723:
377e : 8d 01 d6 STA $d601 
3781 : a9 0d __ LDA #$0d
3783 : 8d 00 d6 STA $d600 
.l11544:
3786 : 2c 00 d6 BIT $d600 
3789 : 10 fb __ BPL $3786 ; (main.l11544 + 0)
.s728:
378b : a5 5d __ LDA T6 + 0 
378d : 8d 01 d6 STA $d601 
3790 : a9 14 __ LDA #$14
3792 : 8d 00 d6 STA $d600 
.l11546:
3795 : 2c 00 d6 BIT $d600 
3798 : 10 fb __ BPL $3795 ; (main.l11546 + 0)
.s733:
379a : 8c 01 d6 STY $d601 
379d : a9 15 __ LDA #$15
379f : 8d 00 d6 STA $d600 
.l11548:
37a2 : 2c 00 d6 BIT $d600 
37a5 : 10 fb __ BPL $37a2 ; (main.l11548 + 0)
.s738:
37a7 : 8e 01 d6 STX $d601 
.l11550:
37aa : ad 00 d6 LDA $d600 
37ad : 29 20 __ AND #$20
37af : f0 f9 __ BEQ $37aa ; (main.l11550 + 0)
.s739:
37b1 : a9 19 __ LDA #$19
37b3 : 8d 00 d6 STA $d600 
37b6 : ad 8c bf LDA $bf8c ; (softscroll + 10)
37b9 : 18 __ __ CLC
37ba : 69 06 __ ADC #$06
.l11507:
37bc : 2c 00 d6 BIT $d600 
37bf : 10 fb __ BPL $37bc ; (main.l11507 + 0)
.s16617:
37c1 : 8d 01 d6 STA $d601 
37c4 : a5 1b __ LDA ACCU + 0 
37c6 : 4c 07 23 JMP $2307 ; (main.s747 + 0)
.s704:
37c9 : ad 8a bf LDA $bf8a ; (softscroll + 8)
37cc : 38 __ __ SEC
37cd : e9 02 __ SBC #$02
37cf : 8d 8a bf STA $bf8a ; (softscroll + 8)
37d2 : aa __ __ TAX
.l11506:
37d3 : ad 00 d6 LDA $d600 
37d6 : 29 20 __ AND #$20
37d8 : f0 f9 __ BEQ $37d3 ; (main.l11506 + 0)
.s707:
37da : a9 19 __ LDA #$19
37dc : 8d 00 d6 STA $d600 
37df : 8a __ __ TXA
37e0 : 18 __ __ CLC
37e1 : 6d 8c bf ADC $bf8c ; (softscroll + 10)
37e4 : 4c bc 37 JMP $37bc ; (main.l11507 + 0)
.s652:
37e7 : a9 00 __ LDA #$00
37e9 : 8d 8a bf STA $bf8a ; (softscroll + 8)
37ec : ad 87 bf LDA $bf87 ; (softscroll + 5)
37ef : 18 __ __ CLC
37f0 : 69 ff __ ADC #$ff
37f2 : 85 5d __ STA T6 + 0 
37f4 : 8d 87 bf STA $bf87 ; (softscroll + 5)
37f7 : ad 88 bf LDA $bf88 ; (softscroll + 6)
37fa : 69 ff __ ADC #$ff
37fc : 85 5e __ STA T6 + 1 
37fe : 8d 88 bf STA $bf88 ; (softscroll + 6)
.l11489:
3801 : ad 00 d6 LDA $d600 
3804 : 29 20 __ AND #$20
3806 : d0 f9 __ BNE $3801 ; (main.l11489 + 0)
.s655:
3808 : ad dd 50 LDA $50dd ; (vdc_state + 10)
380b : 18 __ __ CLC
380c : 65 5d __ ADC T6 + 0 
380e : aa __ __ TAX
380f : ad de 50 LDA $50de ; (vdc_state + 11)
3812 : 65 5e __ ADC T6 + 1 
3814 : a8 __ __ TAY
3815 : ad db 50 LDA $50db ; (vdc_state + 8)
3818 : 18 __ __ CLC
3819 : 65 5d __ ADC T6 + 0 
381b : 85 5d __ STA T6 + 0 
381d : a9 0c __ LDA #$0c
381f : 8d 00 d6 STA $d600 
3822 : ad dc 50 LDA $50dc ; (vdc_state + 9)
3825 : 65 5e __ ADC T6 + 1 
.l11491:
3827 : 2c 00 d6 BIT $d600 
382a : 10 fb __ BPL $3827 ; (main.l11491 + 0)
.s663:
382c : 8d 01 d6 STA $d601 
382f : a9 0d __ LDA #$0d
3831 : 8d 00 d6 STA $d600 
.l11493:
3834 : 2c 00 d6 BIT $d600 
3837 : 10 fb __ BPL $3834 ; (main.l11493 + 0)
.s668:
3839 : a5 5d __ LDA T6 + 0 
383b : 8d 01 d6 STA $d601 
383e : a9 14 __ LDA #$14
3840 : 8d 00 d6 STA $d600 
.l11495:
3843 : 2c 00 d6 BIT $d600 
3846 : 10 fb __ BPL $3843 ; (main.l11495 + 0)
.s673:
3848 : 8c 01 d6 STY $d601 
384b : a9 15 __ LDA #$15
384d : 8d 00 d6 STA $d600 
.l11497:
3850 : 2c 00 d6 BIT $d600 
3853 : 10 fb __ BPL $3850 ; (main.l11497 + 0)
.s678:
3855 : 8e 01 d6 STX $d601 
.l11499:
3858 : ad 00 d6 LDA $d600 
385b : 29 20 __ AND #$20
385d : f0 f9 __ BEQ $3858 ; (main.l11499 + 0)
.l684:
385f : ad 00 d6 LDA $d600 
3862 : 29 20 __ AND #$20
3864 : d0 f9 __ BNE $385f ; (main.l684 + 0)
.s679:
3866 : a9 19 __ LDA #$19
3868 : 8d 00 d6 STA $d600 
386b : ae 8c bf LDX $bf8c ; (softscroll + 10)
.l11501:
386e : 2c 00 d6 BIT $d600 
3871 : 10 fb __ BPL $386e ; (main.l11501 + 0)
.s690:
3873 : 8a __ __ TXA
3874 : 4c d2 22 JMP $22d2 ; (main.s1686 + 0)
.l599:
3877 : ad 00 d6 LDA $d600 
387a : 29 20 __ AND #$20
387c : f0 f9 __ BEQ $3877 ; (main.l599 + 0)
.l608:
387e : ad 00 d6 LDA $d600 
3881 : 29 20 __ AND #$20
3883 : d0 f9 __ BNE $387e ; (main.l608 + 0)
.s603:
3885 : 8a __ __ TXA
3886 : 18 __ __ CLC
3887 : 69 02 __ ADC #$02
3889 : 8d 8f bf STA $bf8f ; (softscroll + 13)
388c : 90 01 __ BCC $388f ; (main.s1730 + 0)
.s1729:
388e : c8 __ __ INY
.s1730:
388f : 8c 90 bf STY $bf90 ; (softscroll + 14)
3892 : ee 89 bf INC $bf89 ; (softscroll + 7)
3895 : ee 89 bf INC $bf89 ; (softscroll + 7)
3898 : a9 06 __ LDA #$06
389a : cd 89 bf CMP $bf89 ; (softscroll + 7)
389d : a9 18 __ LDA #$18
389f : 8d 00 d6 STA $d600 
38a2 : ae 8b bf LDX $bf8b ; (softscroll + 9)
38a5 : 90 10 __ BCC $38b7 ; (main.s610 + 0)
.s611:
38a7 : 8a __ __ TXA
38a8 : 18 __ __ CLC
38a9 : 6d 89 bf ADC $bf89 ; (softscroll + 7)
.l11558:
38ac : 2c 00 d6 BIT $d600 
38af : 10 fb __ BPL $38ac ; (main.l11558 + 0)
.s1685:
38b1 : 8d 01 d6 STA $d601 
38b4 : 4c 92 22 JMP $2292 ; (main.s597 + 0)
.s610:
38b7 : a9 00 __ LDA #$00
38b9 : 8d 89 bf STA $bf89 ; (softscroll + 7)
38bc : ad 87 bf LDA $bf87 ; (softscroll + 5)
38bf : 6d 85 bf ADC $bf85 ; (softscroll + 3)
38c2 : 85 5d __ STA T6 + 0 
38c4 : 8d 87 bf STA $bf87 ; (softscroll + 5)
38c7 : ad 88 bf LDA $bf88 ; (softscroll + 6)
38ca : 69 00 __ ADC #$00
38cc : 85 5e __ STA T6 + 1 
38ce : 8d 88 bf STA $bf88 ; (softscroll + 6)
.l11476:
38d1 : 2c 00 d6 BIT $d600 
38d4 : 10 fb __ BPL $38d1 ; (main.l11476 + 0)
.s617:
38d6 : 8e 01 d6 STX $d601 
38d9 : ad dd 50 LDA $50dd ; (vdc_state + 10)
38dc : 18 __ __ CLC
38dd : 65 5d __ ADC T6 + 0 
38df : aa __ __ TAX
38e0 : ad de 50 LDA $50de ; (vdc_state + 11)
38e3 : 65 5e __ ADC T6 + 1 
38e5 : a8 __ __ TAY
38e6 : ad db 50 LDA $50db ; (vdc_state + 8)
38e9 : 18 __ __ CLC
38ea : 65 5d __ ADC T6 + 0 
38ec : 85 5d __ STA T6 + 0 
38ee : a9 0c __ LDA #$0c
38f0 : 8d 00 d6 STA $d600 
38f3 : ad dc 50 LDA $50dc ; (vdc_state + 9)
38f6 : 65 5e __ ADC T6 + 1 
.l11478:
38f8 : 2c 00 d6 BIT $d600 
38fb : 10 fb __ BPL $38f8 ; (main.l11478 + 0)
.s623:
38fd : 8d 01 d6 STA $d601 
3900 : a9 0d __ LDA #$0d
3902 : 8d 00 d6 STA $d600 
.l11480:
3905 : 2c 00 d6 BIT $d600 
3908 : 10 fb __ BPL $3905 ; (main.l11480 + 0)
.s628:
390a : a5 5d __ LDA T6 + 0 
390c : 8d 01 d6 STA $d601 
390f : a9 14 __ LDA #$14
3911 : 8d 00 d6 STA $d600 
.l11482:
3914 : 2c 00 d6 BIT $d600 
3917 : 10 fb __ BPL $3914 ; (main.l11482 + 0)
.s633:
3919 : 8c 01 d6 STY $d601 
391c : a9 15 __ LDA #$15
391e : 8d 00 d6 STA $d600 
.l11484:
3921 : 2c 00 d6 BIT $d600 
3924 : 10 fb __ BPL $3921 ; (main.l11484 + 0)
.s638:
3926 : 8a __ __ TXA
3927 : 4c b1 38 JMP $38b1 ; (main.s1685 + 0)
.l547:
392a : ad 00 d6 LDA $d600 
392d : 29 20 __ AND #$20
392f : f0 f9 __ BEQ $392a ; (main.l547 + 0)
.l556:
3931 : ad 00 d6 LDA $d600 
3934 : 29 20 __ AND #$20
3936 : d0 f9 __ BNE $3931 ; (main.l556 + 0)
.s551:
3938 : 8a __ __ TXA
3939 : 38 __ __ SEC
393a : e9 02 __ SBC #$02
393c : 8d 8f bf STA $bf8f ; (softscroll + 13)
393f : a5 5e __ LDA T6 + 1 
3941 : e9 00 __ SBC #$00
3943 : 8d 90 bf STA $bf90 ; (softscroll + 14)
3946 : a9 01 __ LDA #$01
3948 : cd 89 bf CMP $bf89 ; (softscroll + 7)
394b : b0 03 __ BCS $3950 ; (main.s559 + 0)
394d : 4c da 39 JMP $39da ; (main.s558 + 0)
.s559:
3950 : a9 06 __ LDA #$06
3952 : 8d 89 bf STA $bf89 ; (softscroll + 7)
3955 : ad 87 bf LDA $bf87 ; (softscroll + 5)
3958 : ed 85 bf SBC $bf85 ; (softscroll + 3)
395b : 85 5d __ STA T6 + 0 
395d : 8d 87 bf STA $bf87 ; (softscroll + 5)
3960 : ad 88 bf LDA $bf88 ; (softscroll + 6)
3963 : e9 00 __ SBC #$00
3965 : 85 5e __ STA T6 + 1 
3967 : 8d 88 bf STA $bf88 ; (softscroll + 6)
.l11562:
396a : ad 00 d6 LDA $d600 
396d : 29 20 __ AND #$20
396f : d0 f9 __ BNE $396a ; (main.l11562 + 0)
.s566:
3971 : a9 18 __ LDA #$18
3973 : 8d 00 d6 STA $d600 
3976 : ad 8b bf LDA $bf8b ; (softscroll + 9)
3979 : 18 __ __ CLC
397a : 69 06 __ ADC #$06
.l11564:
397c : 2c 00 d6 BIT $d600 
397f : 10 fb __ BPL $397c ; (main.l11564 + 0)
.s573:
3981 : 8d 01 d6 STA $d601 
3984 : ad dd 50 LDA $50dd ; (vdc_state + 10)
3987 : 18 __ __ CLC
3988 : 65 5d __ ADC T6 + 0 
398a : aa __ __ TAX
398b : ad de 50 LDA $50de ; (vdc_state + 11)
398e : 65 5e __ ADC T6 + 1 
3990 : a8 __ __ TAY
3991 : ad db 50 LDA $50db ; (vdc_state + 8)
3994 : 18 __ __ CLC
3995 : 65 5d __ ADC T6 + 0 
3997 : 85 5d __ STA T6 + 0 
3999 : a9 0c __ LDA #$0c
399b : 8d 00 d6 STA $d600 
399e : ad dc 50 LDA $50dc ; (vdc_state + 9)
39a1 : 65 5e __ ADC T6 + 1 
.l11566:
39a3 : 2c 00 d6 BIT $d600 
39a6 : 10 fb __ BPL $39a3 ; (main.l11566 + 0)
.s579:
39a8 : 8d 01 d6 STA $d601 
39ab : a9 0d __ LDA #$0d
39ad : 8d 00 d6 STA $d600 
.l11568:
39b0 : 2c 00 d6 BIT $d600 
39b3 : 10 fb __ BPL $39b0 ; (main.l11568 + 0)
.s584:
39b5 : a5 5d __ LDA T6 + 0 
39b7 : 8d 01 d6 STA $d601 
39ba : a9 14 __ LDA #$14
39bc : 8d 00 d6 STA $d600 
.l11570:
39bf : 2c 00 d6 BIT $d600 
39c2 : 10 fb __ BPL $39bf ; (main.l11570 + 0)
.s589:
39c4 : 8c 01 d6 STY $d601 
39c7 : a9 15 __ LDA #$15
39c9 : 8d 00 d6 STA $d600 
.l11572:
39cc : 2c 00 d6 BIT $d600 
39cf : 10 fb __ BPL $39cc ; (main.l11572 + 0)
.s594:
39d1 : 8a __ __ TXA
.s1684:
39d2 : 8d 01 d6 STA $d601 
39d5 : a5 1b __ LDA ACCU + 0 
39d7 : 4c 6b 22 JMP $226b ; (main.s598 + 0)
.s558:
39da : ce 89 bf DEC $bf89 ; (softscroll + 7)
39dd : ce 89 bf DEC $bf89 ; (softscroll + 7)
39e0 : a9 18 __ LDA #$18
39e2 : 8d 00 d6 STA $d600 
39e5 : ad 89 bf LDA $bf89 ; (softscroll + 7)
39e8 : 6d 8b bf ADC $bf8b ; (softscroll + 9)
.l11470:
39eb : 2c 00 d6 BIT $d600 
39ee : 10 fb __ BPL $39eb ; (main.l11470 + 0)
39f0 : 4c d2 39 JMP $39d2 ; (main.s1684 + 0)
.l407:
39f3 : 0a __ __ ASL
39f4 : aa __ __ TAX
39f5 : ad da 50 LDA $50da ; (vdc_state + 7)
39f8 : 85 43 __ STA T10 + 0 
39fa : a9 12 __ LDA #$12
39fc : 8d 00 d6 STA $d600 
39ff : a5 5b __ LDA T5 + 0 
3a01 : 38 __ __ SEC
3a02 : e9 01 __ SBC #$01
3a04 : 85 62 __ STA T12 + 0 
3a06 : bd 00 52 LDA $5200,x ; (multab + 0)
3a09 : 85 5d __ STA T6 + 0 
3a0b : 18 __ __ CLC
3a0c : 6d db 50 ADC $50db ; (vdc_state + 8)
3a0f : a8 __ __ TAY
3a10 : bd 01 52 LDA $5201,x ; (multab + 1)
3a13 : 85 5e __ STA T6 + 1 
3a15 : 6d dc 50 ADC $50dc ; (vdc_state + 9)
.l11421:
3a18 : 2c 00 d6 BIT $d600 
3a1b : 10 fb __ BPL $3a18 ; (main.l11421 + 0)
.s419:
3a1d : 8d 01 d6 STA $d601 
3a20 : a9 13 __ LDA #$13
3a22 : 8d 00 d6 STA $d600 
.l11423:
3a25 : 2c 00 d6 BIT $d600 
3a28 : 10 fb __ BPL $3a25 ; (main.l11423 + 0)
.s424:
3a2a : 8c 01 d6 STY $d601 
3a2d : a9 1f __ LDA #$1f
3a2f : 8d 00 d6 STA $d600 
.l11425:
3a32 : 2c 00 d6 BIT $d600 
3a35 : 10 fb __ BPL $3a32 ; (main.l11425 + 0)
.s428:
3a37 : a9 20 __ LDA #$20
3a39 : 8d 01 d6 STA $d601 
3a3c : a9 18 __ LDA #$18
3a3e : 8d 00 d6 STA $d600 
.l11427:
3a41 : 2c 00 d6 BIT $d600 
3a44 : 10 fb __ BPL $3a41 ; (main.l11427 + 0)
.s434:
3a46 : ad 01 d6 LDA $d601 
3a49 : 29 7f __ AND #$7f
3a4b : a8 __ __ TAY
3a4c : a9 18 __ LDA #$18
3a4e : 8d 00 d6 STA $d600 
.l11429:
3a51 : 2c 00 d6 BIT $d600 
3a54 : 10 fb __ BPL $3a51 ; (main.l11429 + 0)
.s440:
3a56 : 8c 01 d6 STY $d601 
3a59 : a9 1e __ LDA #$1e
3a5b : 8d 00 d6 STA $d600 
.l11431:
3a5e : 2c 00 d6 BIT $d600 
3a61 : 10 fb __ BPL $3a5e ; (main.l11431 + 0)
.s445:
3a63 : a5 62 __ LDA T12 + 0 
3a65 : 8d 01 d6 STA $d601 
3a68 : ad dd 50 LDA $50dd ; (vdc_state + 10)
3a6b : 18 __ __ CLC
3a6c : 65 5d __ ADC T6 + 0 
3a6e : aa __ __ TAX
3a6f : a9 12 __ LDA #$12
3a71 : 8d 00 d6 STA $d600 
3a74 : ad de 50 LDA $50de ; (vdc_state + 11)
3a77 : 65 5e __ ADC T6 + 1 
.l11433:
3a79 : 2c 00 d6 BIT $d600 
3a7c : 10 fb __ BPL $3a79 ; (main.l11433 + 0)
.s452:
3a7e : 8d 01 d6 STA $d601 
3a81 : a9 13 __ LDA #$13
3a83 : 8d 00 d6 STA $d600 
.l11435:
3a86 : 2c 00 d6 BIT $d600 
3a89 : 10 fb __ BPL $3a86 ; (main.l11435 + 0)
.s457:
3a8b : 8e 01 d6 STX $d601 
3a8e : a9 1f __ LDA #$1f
3a90 : 8d 00 d6 STA $d600 
.l11437:
3a93 : 2c 00 d6 BIT $d600 
3a96 : 10 fb __ BPL $3a93 ; (main.l11437 + 0)
.s461:
3a98 : a5 43 __ LDA T10 + 0 
3a9a : 8d 01 d6 STA $d601 
3a9d : a9 18 __ LDA #$18
3a9f : 8d 00 d6 STA $d600 
.l11439:
3aa2 : 2c 00 d6 BIT $d600 
3aa5 : 10 fb __ BPL $3aa2 ; (main.l11439 + 0)
.s467:
3aa7 : ad 01 d6 LDA $d601 
3aaa : 29 7f __ AND #$7f
3aac : aa __ __ TAX
3aad : a9 18 __ LDA #$18
3aaf : 8d 00 d6 STA $d600 
.l11441:
3ab2 : 2c 00 d6 BIT $d600 
3ab5 : 10 fb __ BPL $3ab2 ; (main.l11441 + 0)
.s473:
3ab7 : 8e 01 d6 STX $d601 
3aba : a9 1e __ LDA #$1e
3abc : 8d 00 d6 STA $d600 
.l11443:
3abf : 2c 00 d6 BIT $d600 
3ac2 : 10 fb __ BPL $3abf ; (main.l11443 + 0)
.s478:
3ac4 : a5 62 __ LDA T12 + 0 
3ac6 : 8d 01 d6 STA $d601 
3ac9 : e6 61 __ INC T8 + 0 
3acb : a5 61 __ LDA T8 + 0 
3acd : c5 5f __ CMP T7 + 0 
3acf : b0 03 __ BCS $3ad4 ; (main.s478 + 16)
3ad1 : 4c f3 39 JMP $39f3 ; (main.l407 + 0)
3ad4 : 4c 27 21 JMP $2127 ; (main.s404 + 0)
.s298:
3ad7 : 0a __ __ ASL
3ad8 : aa __ __ TAX
3ad9 : ad da 50 LDA $50da ; (vdc_state + 7)
3adc : 85 56 __ STA T2 + 0 
3ade : a9 12 __ LDA #$12
3ae0 : 8d 00 d6 STA $d600 
3ae3 : a5 54 __ LDA T1 + 0 
3ae5 : 38 __ __ SEC
3ae6 : e9 01 __ SBC #$01
3ae8 : 85 5d __ STA T6 + 0 
3aea : bd 00 52 LDA $5200,x ; (multab + 0)
3aed : 85 59 __ STA T4 + 0 
3aef : 18 __ __ CLC
3af0 : 6d db 50 ADC $50db ; (vdc_state + 8)
3af3 : a8 __ __ TAY
3af4 : bd 01 52 LDA $5201,x ; (multab + 1)
3af7 : 85 5a __ STA T4 + 1 
3af9 : 6d dc 50 ADC $50dc ; (vdc_state + 9)
.l11606:
3afc : 2c 00 d6 BIT $d600 
3aff : 10 fb __ BPL $3afc ; (main.l11606 + 0)
.s310:
3b01 : 8d 01 d6 STA $d601 
3b04 : a9 13 __ LDA #$13
3b06 : 8d 00 d6 STA $d600 
.l11608:
3b09 : 2c 00 d6 BIT $d600 
3b0c : 10 fb __ BPL $3b09 ; (main.l11608 + 0)
.s315:
3b0e : 8c 01 d6 STY $d601 
3b11 : a9 1f __ LDA #$1f
3b13 : 8d 00 d6 STA $d600 
.l11610:
3b16 : 2c 00 d6 BIT $d600 
3b19 : 10 fb __ BPL $3b16 ; (main.l11610 + 0)
.s319:
3b1b : a9 20 __ LDA #$20
3b1d : 8d 01 d6 STA $d601 
3b20 : a9 18 __ LDA #$18
3b22 : 8d 00 d6 STA $d600 
.l11612:
3b25 : 2c 00 d6 BIT $d600 
3b28 : 10 fb __ BPL $3b25 ; (main.l11612 + 0)
.s325:
3b2a : ad 01 d6 LDA $d601 
3b2d : 29 7f __ AND #$7f
3b2f : a8 __ __ TAY
3b30 : a9 18 __ LDA #$18
3b32 : 8d 00 d6 STA $d600 
.l11614:
3b35 : 2c 00 d6 BIT $d600 
3b38 : 10 fb __ BPL $3b35 ; (main.l11614 + 0)
.s331:
3b3a : 8c 01 d6 STY $d601 
3b3d : a9 1e __ LDA #$1e
3b3f : 8d 00 d6 STA $d600 
.l11616:
3b42 : 2c 00 d6 BIT $d600 
3b45 : 10 fb __ BPL $3b42 ; (main.l11616 + 0)
.s336:
3b47 : a5 5d __ LDA T6 + 0 
3b49 : 8d 01 d6 STA $d601 
3b4c : ad dd 50 LDA $50dd ; (vdc_state + 10)
3b4f : 18 __ __ CLC
3b50 : 65 59 __ ADC T4 + 0 
3b52 : aa __ __ TAX
3b53 : a9 12 __ LDA #$12
3b55 : 8d 00 d6 STA $d600 
3b58 : ad de 50 LDA $50de ; (vdc_state + 11)
3b5b : 65 5a __ ADC T4 + 1 
.l11618:
3b5d : 2c 00 d6 BIT $d600 
3b60 : 10 fb __ BPL $3b5d ; (main.l11618 + 0)
.s343:
3b62 : 8d 01 d6 STA $d601 
3b65 : a9 13 __ LDA #$13
3b67 : 8d 00 d6 STA $d600 
.l11620:
3b6a : 2c 00 d6 BIT $d600 
3b6d : 10 fb __ BPL $3b6a ; (main.l11620 + 0)
.s348:
3b6f : 8e 01 d6 STX $d601 
3b72 : a9 1f __ LDA #$1f
3b74 : 8d 00 d6 STA $d600 
.l11622:
3b77 : 2c 00 d6 BIT $d600 
3b7a : 10 fb __ BPL $3b77 ; (main.l11622 + 0)
.s352:
3b7c : a5 56 __ LDA T2 + 0 
3b7e : 8d 01 d6 STA $d601 
3b81 : a9 18 __ LDA #$18
3b83 : 8d 00 d6 STA $d600 
.l11624:
3b86 : 2c 00 d6 BIT $d600 
3b89 : 10 fb __ BPL $3b86 ; (main.l11624 + 0)
.s358:
3b8b : ad 01 d6 LDA $d601 
3b8e : 29 7f __ AND #$7f
3b90 : aa __ __ TAX
3b91 : a9 18 __ LDA #$18
3b93 : 8d 00 d6 STA $d600 
.l11626:
3b96 : 2c 00 d6 BIT $d600 
3b99 : 10 fb __ BPL $3b96 ; (main.l11626 + 0)
.s364:
3b9b : 8e 01 d6 STX $d601 
3b9e : a9 1e __ LDA #$1e
3ba0 : 8d 00 d6 STA $d600 
.l11628:
3ba3 : 2c 00 d6 BIT $d600 
3ba6 : 10 fb __ BPL $3ba3 ; (main.l11628 + 0)
.s369:
3ba8 : a5 5d __ LDA T6 + 0 
3baa : 8d 01 d6 STA $d601 
3bad : e6 53 __ INC T0 + 0 
3baf : 4c 4e 1f JMP $1f4e ; (main.l297 + 0)
.s100:
3bb2 : 0a __ __ ASL
3bb3 : aa __ __ TAX
3bb4 : ad da 50 LDA $50da ; (vdc_state + 7)
3bb7 : 85 56 __ STA T2 + 0 
3bb9 : a9 12 __ LDA #$12
3bbb : 8d 00 d6 STA $d600 
3bbe : a5 54 __ LDA T1 + 0 
3bc0 : 38 __ __ SEC
3bc1 : e9 01 __ SBC #$01
3bc3 : 85 5d __ STA T6 + 0 
3bc5 : bd 00 52 LDA $5200,x ; (multab + 0)
3bc8 : 85 59 __ STA T4 + 0 
3bca : 18 __ __ CLC
3bcb : 6d db 50 ADC $50db ; (vdc_state + 8)
3bce : a8 __ __ TAY
3bcf : bd 01 52 LDA $5201,x ; (multab + 1)
3bd2 : 85 5a __ STA T4 + 1 
3bd4 : 6d dc 50 ADC $50dc ; (vdc_state + 9)
.l11017:
3bd7 : 2c 00 d6 BIT $d600 
3bda : 10 fb __ BPL $3bd7 ; (main.l11017 + 0)
.s112:
3bdc : 8d 01 d6 STA $d601 
3bdf : a9 13 __ LDA #$13
3be1 : 8d 00 d6 STA $d600 
.l11019:
3be4 : 2c 00 d6 BIT $d600 
3be7 : 10 fb __ BPL $3be4 ; (main.l11019 + 0)
.s117:
3be9 : 8c 01 d6 STY $d601 
3bec : a9 1f __ LDA #$1f
3bee : 8d 00 d6 STA $d600 
.l11021:
3bf1 : 2c 00 d6 BIT $d600 
3bf4 : 10 fb __ BPL $3bf1 ; (main.l11021 + 0)
.s121:
3bf6 : a9 20 __ LDA #$20
3bf8 : 8d 01 d6 STA $d601 
3bfb : a9 18 __ LDA #$18
3bfd : 8d 00 d6 STA $d600 
.l11023:
3c00 : 2c 00 d6 BIT $d600 
3c03 : 10 fb __ BPL $3c00 ; (main.l11023 + 0)
.s127:
3c05 : ad 01 d6 LDA $d601 
3c08 : 29 7f __ AND #$7f
3c0a : a8 __ __ TAY
3c0b : a9 18 __ LDA #$18
3c0d : 8d 00 d6 STA $d600 
.l11025:
3c10 : 2c 00 d6 BIT $d600 
3c13 : 10 fb __ BPL $3c10 ; (main.l11025 + 0)
.s133:
3c15 : 8c 01 d6 STY $d601 
3c18 : a9 1e __ LDA #$1e
3c1a : 8d 00 d6 STA $d600 
.l11027:
3c1d : 2c 00 d6 BIT $d600 
3c20 : 10 fb __ BPL $3c1d ; (main.l11027 + 0)
.s138:
3c22 : a5 5d __ LDA T6 + 0 
3c24 : 8d 01 d6 STA $d601 
3c27 : ad dd 50 LDA $50dd ; (vdc_state + 10)
3c2a : 18 __ __ CLC
3c2b : 65 59 __ ADC T4 + 0 
3c2d : aa __ __ TAX
3c2e : a9 12 __ LDA #$12
3c30 : 8d 00 d6 STA $d600 
3c33 : ad de 50 LDA $50de ; (vdc_state + 11)
3c36 : 65 5a __ ADC T4 + 1 
.l11029:
3c38 : 2c 00 d6 BIT $d600 
3c3b : 10 fb __ BPL $3c38 ; (main.l11029 + 0)
.s145:
3c3d : 8d 01 d6 STA $d601 
3c40 : a9 13 __ LDA #$13
3c42 : 8d 00 d6 STA $d600 
.l11031:
3c45 : 2c 00 d6 BIT $d600 
3c48 : 10 fb __ BPL $3c45 ; (main.l11031 + 0)
.s150:
3c4a : 8e 01 d6 STX $d601 
3c4d : a9 1f __ LDA #$1f
3c4f : 8d 00 d6 STA $d600 
.l11033:
3c52 : 2c 00 d6 BIT $d600 
3c55 : 10 fb __ BPL $3c52 ; (main.l11033 + 0)
.s154:
3c57 : a5 56 __ LDA T2 + 0 
3c59 : 8d 01 d6 STA $d601 
3c5c : a9 18 __ LDA #$18
3c5e : 8d 00 d6 STA $d600 
.l11035:
3c61 : 2c 00 d6 BIT $d600 
3c64 : 10 fb __ BPL $3c61 ; (main.l11035 + 0)
.s160:
3c66 : ad 01 d6 LDA $d601 
3c69 : 29 7f __ AND #$7f
3c6b : aa __ __ TAX
3c6c : a9 18 __ LDA #$18
3c6e : 8d 00 d6 STA $d600 
.l11037:
3c71 : 2c 00 d6 BIT $d600 
3c74 : 10 fb __ BPL $3c71 ; (main.l11037 + 0)
.s166:
3c76 : 8e 01 d6 STX $d601 
3c79 : a9 1e __ LDA #$1e
3c7b : 8d 00 d6 STA $d600 
.l11039:
3c7e : 2c 00 d6 BIT $d600 
3c81 : 10 fb __ BPL $3c7e ; (main.l11039 + 0)
.s171:
3c83 : a5 5d __ LDA T6 + 0 
3c85 : 8d 01 d6 STA $d601 
3c88 : e6 53 __ INC T0 + 0 
3c8a : 4c a7 1d JMP $1da7 ; (main.l99 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
3c8d : a2 03 __ LDX #$03
3c8f : b5 53 __ LDA T8 + 0,x 
3c91 : 9d b2 bf STA $bfb2,x ; (printf@stack + 0)
3c94 : ca __ __ DEX
3c95 : 10 f8 __ BPL $3c8f ; (printf.s1000 + 2)
.s0:
3c97 : 18 __ __ CLC
3c98 : a5 23 __ LDA SP + 0 
3c9a : 69 04 __ ADC #$04
3c9c : 85 47 __ STA T0 + 0 
3c9e : a5 24 __ LDA SP + 1 
3ca0 : 69 00 __ ADC #$00
3ca2 : 85 48 __ STA T0 + 1 
3ca4 : a9 00 __ LDA #$00
3ca6 : 85 49 __ STA T2 + 0 
3ca8 : a0 02 __ LDY #$02
3caa : b1 23 __ LDA (SP + 0),y 
3cac : 85 4a __ STA T3 + 0 
3cae : c8 __ __ INY
3caf : b1 23 __ LDA (SP + 0),y 
3cb1 : 85 4b __ STA T3 + 1 
.l2:
3cb3 : a0 00 __ LDY #$00
3cb5 : b1 4a __ LDA (T3 + 0),y 
3cb7 : d0 1e __ BNE $3cd7 ; (printf.s3 + 0)
.s4:
3cb9 : a6 49 __ LDX T2 + 0 
3cbb : 9d be bf STA $bfbe,x ; (buff + 0)
3cbe : 8a __ __ TXA
3cbf : f0 0b __ BEQ $3ccc ; (printf.s1001 + 0)
.s117:
3cc1 : a9 be __ LDA #$be
3cc3 : 85 0d __ STA P0 ; (fmt + 0)
3cc5 : a9 bf __ LDA #$bf
3cc7 : 85 0e __ STA P1 ; (fmt + 1)
3cc9 : 20 dd 3f JSR $3fdd ; (puts.s0 + 0)
.s1001:
3ccc : a2 03 __ LDX #$03
3cce : bd b2 bf LDA $bfb2,x ; (printf@stack + 0)
3cd1 : 95 53 __ STA T8 + 0,x 
3cd3 : ca __ __ DEX
3cd4 : 10 f8 __ BPL $3cce ; (printf.s1001 + 2)
3cd6 : 60 __ __ RTS
.s3:
3cd7 : c9 25 __ CMP #$25
3cd9 : f0 28 __ BEQ $3d03 ; (printf.s5 + 0)
.s6:
3cdb : a6 49 __ LDX T2 + 0 
3cdd : 9d be bf STA $bfbe,x ; (buff + 0)
3ce0 : e6 4a __ INC T3 + 0 
3ce2 : d0 02 __ BNE $3ce6 ; (printf.s1098 + 0)
.s1097:
3ce4 : e6 4b __ INC T3 + 1 
.s1098:
3ce6 : e8 __ __ INX
3ce7 : 86 49 __ STX T2 + 0 
3ce9 : e0 28 __ CPX #$28
3ceb : 90 c6 __ BCC $3cb3 ; (printf.l2 + 0)
.s111:
3ced : a9 be __ LDA #$be
3cef : 85 0d __ STA P0 ; (fmt + 0)
3cf1 : a9 bf __ LDA #$bf
3cf3 : 85 0e __ STA P1 ; (fmt + 1)
3cf5 : 98 __ __ TYA
3cf6 : 9d be bf STA $bfbe,x ; (buff + 0)
3cf9 : 20 dd 3f JSR $3fdd ; (puts.s0 + 0)
3cfc : a9 00 __ LDA #$00
.s1068:
3cfe : 85 49 __ STA T2 + 0 
3d00 : 4c b3 3c JMP $3cb3 ; (printf.l2 + 0)
.s5:
3d03 : a5 49 __ LDA T2 + 0 
3d05 : f0 15 __ BEQ $3d1c ; (printf.s10 + 0)
.s8:
3d07 : a9 be __ LDA #$be
3d09 : 85 0d __ STA P0 ; (fmt + 0)
3d0b : a9 bf __ LDA #$bf
3d0d : 85 0e __ STA P1 ; (fmt + 1)
3d0f : 98 __ __ TYA
3d10 : a6 49 __ LDX T2 + 0 
3d12 : 9d be bf STA $bfbe,x ; (buff + 0)
3d15 : 20 dd 3f JSR $3fdd ; (puts.s0 + 0)
3d18 : a9 00 __ LDA #$00
3d1a : 85 49 __ STA T2 + 0 
.s10:
3d1c : a9 0a __ LDA #$0a
3d1e : 8d b9 bf STA $bfb9 ; (si + 3)
3d21 : a9 00 __ LDA #$00
3d23 : 8d ba bf STA $bfba ; (si + 4)
3d26 : 8d bb bf STA $bfbb ; (si + 5)
3d29 : 8d bc bf STA $bfbc ; (si + 6)
3d2c : 8d bd bf STA $bfbd ; (si + 7)
3d2f : a0 01 __ LDY #$01
3d31 : b1 4a __ LDA (T3 + 0),y 
3d33 : aa __ __ TAX
3d34 : a9 20 __ LDA #$20
3d36 : 8d b6 bf STA $bfb6 ; (si + 0)
3d39 : a9 00 __ LDA #$00
3d3b : 8d b7 bf STA $bfb7 ; (si + 1)
3d3e : a9 ff __ LDA #$ff
3d40 : 8d b8 bf STA $bfb8 ; (si + 2)
3d43 : 18 __ __ CLC
3d44 : a5 4a __ LDA T3 + 0 
3d46 : 69 02 __ ADC #$02
.l15:
3d48 : 85 4a __ STA T3 + 0 
3d4a : 90 02 __ BCC $3d4e ; (printf.s1080 + 0)
.s1079:
3d4c : e6 4b __ INC T3 + 1 
.s1080:
3d4e : 8a __ __ TXA
3d4f : e0 2b __ CPX #$2b
3d51 : d0 08 __ BNE $3d5b ; (printf.s18 + 0)
.s17:
3d53 : a9 01 __ LDA #$01
3d55 : 8d bb bf STA $bfbb ; (si + 5)
3d58 : 4c d0 3f JMP $3fd0 ; (printf.s246 + 0)
.s18:
3d5b : c9 30 __ CMP #$30
3d5d : d0 06 __ BNE $3d65 ; (printf.s21 + 0)
.s20:
3d5f : 8d b6 bf STA $bfb6 ; (si + 0)
3d62 : 4c d0 3f JMP $3fd0 ; (printf.s246 + 0)
.s21:
3d65 : e0 23 __ CPX #$23
3d67 : d0 08 __ BNE $3d71 ; (printf.s24 + 0)
.s23:
3d69 : a9 01 __ LDA #$01
3d6b : 8d bd bf STA $bfbd ; (si + 7)
3d6e : 4c d0 3f JMP $3fd0 ; (printf.s246 + 0)
.s24:
3d71 : e0 2d __ CPX #$2d
3d73 : d0 08 __ BNE $3d7d ; (printf.s16 + 0)
.s26:
3d75 : a9 01 __ LDA #$01
3d77 : 8d bc bf STA $bfbc ; (si + 6)
3d7a : 4c d0 3f JMP $3fd0 ; (printf.s246 + 0)
.s16:
3d7d : 85 4c __ STA T4 + 0 
3d7f : e0 30 __ CPX #$30
3d81 : 90 53 __ BCC $3dd6 ; (printf.s32 + 0)
.s33:
3d83 : e0 3a __ CPX #$3a
3d85 : b0 4f __ BCS $3dd6 ; (printf.s32 + 0)
.s30:
3d87 : a9 00 __ LDA #$00
3d89 : 85 4d __ STA T6 + 0 
3d8b : 85 4e __ STA T6 + 1 
3d8d : e0 3a __ CPX #$3a
3d8f : b0 40 __ BCS $3dd1 ; (printf.s36 + 0)
.l35:
3d91 : a5 4d __ LDA T6 + 0 
3d93 : 0a __ __ ASL
3d94 : 85 1b __ STA ACCU + 0 
3d96 : a5 4e __ LDA T6 + 1 
3d98 : 2a __ __ ROL
3d99 : 06 1b __ ASL ACCU + 0 
3d9b : 2a __ __ ROL
3d9c : aa __ __ TAX
3d9d : 18 __ __ CLC
3d9e : a5 1b __ LDA ACCU + 0 
3da0 : 65 4d __ ADC T6 + 0 
3da2 : 85 4d __ STA T6 + 0 
3da4 : 8a __ __ TXA
3da5 : 65 4e __ ADC T6 + 1 
3da7 : 06 4d __ ASL T6 + 0 
3da9 : 2a __ __ ROL
3daa : aa __ __ TAX
3dab : 18 __ __ CLC
3dac : a5 4d __ LDA T6 + 0 
3dae : 65 4c __ ADC T4 + 0 
3db0 : 90 01 __ BCC $3db3 ; (printf.s1094 + 0)
.s1093:
3db2 : e8 __ __ INX
.s1094:
3db3 : 38 __ __ SEC
3db4 : e9 30 __ SBC #$30
3db6 : 85 4d __ STA T6 + 0 
3db8 : 8a __ __ TXA
3db9 : e9 00 __ SBC #$00
3dbb : 85 4e __ STA T6 + 1 
3dbd : a0 00 __ LDY #$00
3dbf : b1 4a __ LDA (T3 + 0),y 
3dc1 : 85 4c __ STA T4 + 0 
3dc3 : e6 4a __ INC T3 + 0 
3dc5 : d0 02 __ BNE $3dc9 ; (printf.s1096 + 0)
.s1095:
3dc7 : e6 4b __ INC T3 + 1 
.s1096:
3dc9 : c9 30 __ CMP #$30
3dcb : 90 04 __ BCC $3dd1 ; (printf.s36 + 0)
.s37:
3dcd : c9 3a __ CMP #$3a
3dcf : 90 c0 __ BCC $3d91 ; (printf.l35 + 0)
.s36:
3dd1 : a5 4d __ LDA T6 + 0 
3dd3 : 8d b7 bf STA $bfb7 ; (si + 1)
.s32:
3dd6 : a5 4c __ LDA T4 + 0 
3dd8 : c9 2e __ CMP #$2e
3dda : d0 51 __ BNE $3e2d ; (printf.s40 + 0)
.s38:
3ddc : a9 00 __ LDA #$00
3dde : 85 4d __ STA T6 + 0 
.l231:
3de0 : 85 4e __ STA T6 + 1 
3de2 : a0 00 __ LDY #$00
3de4 : b1 4a __ LDA (T3 + 0),y 
3de6 : 85 4c __ STA T4 + 0 
3de8 : e6 4a __ INC T3 + 0 
3dea : d0 02 __ BNE $3dee ; (printf.s1082 + 0)
.s1081:
3dec : e6 4b __ INC T3 + 1 
.s1082:
3dee : c9 30 __ CMP #$30
3df0 : 90 04 __ BCC $3df6 ; (printf.s43 + 0)
.s44:
3df2 : c9 3a __ CMP #$3a
3df4 : 90 0a __ BCC $3e00 ; (printf.s42 + 0)
.s43:
3df6 : a5 4d __ LDA T6 + 0 
3df8 : 8d b8 bf STA $bfb8 ; (si + 2)
3dfb : a5 4c __ LDA T4 + 0 
3dfd : 4c 2d 3e JMP $3e2d ; (printf.s40 + 0)
.s42:
3e00 : a5 4d __ LDA T6 + 0 
3e02 : 0a __ __ ASL
3e03 : 85 1b __ STA ACCU + 0 
3e05 : a5 4e __ LDA T6 + 1 
3e07 : 2a __ __ ROL
3e08 : 06 1b __ ASL ACCU + 0 
3e0a : 2a __ __ ROL
3e0b : aa __ __ TAX
3e0c : 18 __ __ CLC
3e0d : a5 1b __ LDA ACCU + 0 
3e0f : 65 4d __ ADC T6 + 0 
3e11 : 85 4d __ STA T6 + 0 
3e13 : 8a __ __ TXA
3e14 : 65 4e __ ADC T6 + 1 
3e16 : 06 4d __ ASL T6 + 0 
3e18 : 2a __ __ ROL
3e19 : aa __ __ TAX
3e1a : 18 __ __ CLC
3e1b : a5 4d __ LDA T6 + 0 
3e1d : 65 4c __ ADC T4 + 0 
3e1f : 90 01 __ BCC $3e22 ; (printf.s1092 + 0)
.s1091:
3e21 : e8 __ __ INX
.s1092:
3e22 : 38 __ __ SEC
3e23 : e9 30 __ SBC #$30
3e25 : 85 4d __ STA T6 + 0 
3e27 : 8a __ __ TXA
3e28 : e9 00 __ SBC #$00
3e2a : 4c e0 3d JMP $3de0 ; (printf.l231 + 0)
.s40:
3e2d : c9 64 __ CMP #$64
3e2f : f0 04 __ BEQ $3e35 ; (printf.s45 + 0)
.s48:
3e31 : c9 44 __ CMP #$44
3e33 : d0 05 __ BNE $3e3a ; (printf.s46 + 0)
.s45:
3e35 : a9 01 __ LDA #$01
3e37 : 4c a9 3f JMP $3fa9 ; (printf.s247 + 0)
.s46:
3e3a : c9 75 __ CMP #$75
3e3c : d0 03 __ BNE $3e41 ; (printf.s52 + 0)
3e3e : 4c a7 3f JMP $3fa7 ; (printf.s269 + 0)
.s52:
3e41 : c9 55 __ CMP #$55
3e43 : d0 03 __ BNE $3e48 ; (printf.s50 + 0)
3e45 : 4c a7 3f JMP $3fa7 ; (printf.s269 + 0)
.s50:
3e48 : c9 78 __ CMP #$78
3e4a : f0 04 __ BEQ $3e50 ; (printf.s53 + 0)
.s56:
3e4c : c9 58 __ CMP #$58
3e4e : d0 0d __ BNE $3e5d ; (printf.s54 + 0)
.s53:
3e50 : a9 10 __ LDA #$10
3e52 : 8d b9 bf STA $bfb9 ; (si + 3)
3e55 : a9 00 __ LDA #$00
3e57 : 8d ba bf STA $bfba ; (si + 4)
3e5a : 4c a7 3f JMP $3fa7 ; (printf.s269 + 0)
.s54:
3e5d : c9 6c __ CMP #$6c
3e5f : d0 03 __ BNE $3e64 ; (printf.s60 + 0)
3e61 : 4c 39 3f JMP $3f39 ; (printf.s57 + 0)
.s60:
3e64 : c9 4c __ CMP #$4c
3e66 : d0 03 __ BNE $3e6b ; (printf.s58 + 0)
3e68 : 4c 39 3f JMP $3f39 ; (printf.s57 + 0)
.s58:
3e6b : c9 73 __ CMP #$73
3e6d : f0 39 __ BEQ $3ea8 ; (printf.s73 + 0)
.s76:
3e6f : c9 53 __ CMP #$53
3e71 : f0 35 __ BEQ $3ea8 ; (printf.s73 + 0)
.s74:
3e73 : c9 63 __ CMP #$63
3e75 : f0 15 __ BEQ $3e8c ; (printf.s104 + 0)
.s107:
3e77 : c9 43 __ CMP #$43
3e79 : f0 11 __ BEQ $3e8c ; (printf.s104 + 0)
.s105:
3e7b : 09 00 __ ORA #$00
3e7d : d0 03 __ BNE $3e82 ; (printf.s108 + 0)
3e7f : 4c b3 3c JMP $3cb3 ; (printf.l2 + 0)
.s108:
3e82 : a6 49 __ LDX T2 + 0 
3e84 : 9d be bf STA $bfbe,x ; (buff + 0)
3e87 : e6 49 __ INC T2 + 0 
3e89 : 4c b3 3c JMP $3cb3 ; (printf.l2 + 0)
.s104:
3e8c : a0 00 __ LDY #$00
3e8e : b1 47 __ LDA (T0 + 0),y 
3e90 : a6 49 __ LDX T2 + 0 
3e92 : 9d be bf STA $bfbe,x ; (buff + 0)
3e95 : e6 49 __ INC T2 + 0 
.s244:
3e97 : 18 __ __ CLC
3e98 : a5 47 __ LDA T0 + 0 
3e9a : 69 02 __ ADC #$02
3e9c : 85 47 __ STA T0 + 0 
3e9e : b0 03 __ BCS $3ea3 ; (printf.s1083 + 0)
3ea0 : 4c b3 3c JMP $3cb3 ; (printf.l2 + 0)
.s1083:
3ea3 : e6 48 __ INC T0 + 1 
3ea5 : 4c b3 3c JMP $3cb3 ; (printf.l2 + 0)
.s73:
3ea8 : a0 00 __ LDY #$00
3eaa : 84 4c __ STY T4 + 0 
3eac : b1 47 __ LDA (T0 + 0),y 
3eae : 85 4d __ STA T6 + 0 
3eb0 : c8 __ __ INY
3eb1 : b1 47 __ LDA (T0 + 0),y 
3eb3 : 85 4e __ STA T6 + 1 
3eb5 : 18 __ __ CLC
3eb6 : a5 47 __ LDA T0 + 0 
3eb8 : 69 02 __ ADC #$02
3eba : 85 47 __ STA T0 + 0 
3ebc : 90 02 __ BCC $3ec0 ; (printf.s1090 + 0)
.s1089:
3ebe : e6 48 __ INC T0 + 1 
.s1090:
3ec0 : ad b7 bf LDA $bfb7 ; (si + 1)
3ec3 : f0 0d __ BEQ $3ed2 ; (printf.s79 + 0)
.s1071:
3ec5 : a0 00 __ LDY #$00
3ec7 : b1 4d __ LDA (T6 + 0),y 
3ec9 : f0 05 __ BEQ $3ed0 ; (printf.s1072 + 0)
.l81:
3ecb : c8 __ __ INY
3ecc : b1 4d __ LDA (T6 + 0),y 
3ece : d0 fb __ BNE $3ecb ; (printf.l81 + 0)
.s1072:
3ed0 : 84 4c __ STY T4 + 0 
.s79:
3ed2 : ad bc bf LDA $bfbc ; (si + 6)
3ed5 : d0 1a __ BNE $3ef1 ; (printf.s85 + 0)
.s1075:
3ed7 : a4 4c __ LDY T4 + 0 
3ed9 : cc b7 bf CPY $bfb7 ; (si + 1)
3edc : a6 49 __ LDX T2 + 0 
3ede : b0 0d __ BCS $3eed ; (printf.s1076 + 0)
.l87:
3ee0 : ad b6 bf LDA $bfb6 ; (si + 0)
3ee3 : 9d be bf STA $bfbe,x ; (buff + 0)
3ee6 : c8 __ __ INY
3ee7 : cc b7 bf CPY $bfb7 ; (si + 1)
3eea : e8 __ __ INX
3eeb : 90 f3 __ BCC $3ee0 ; (printf.l87 + 0)
.s1076:
3eed : 86 49 __ STX T2 + 0 
3eef : 84 4c __ STY T4 + 0 
.s85:
3ef1 : a5 49 __ LDA T2 + 0 
3ef3 : f0 16 __ BEQ $3f0b ; (printf.s238 + 0)
.s92:
3ef5 : a9 be __ LDA #$be
3ef7 : 85 0d __ STA P0 ; (fmt + 0)
3ef9 : a9 bf __ LDA #$bf
3efb : 85 0e __ STA P1 ; (fmt + 1)
3efd : a9 00 __ LDA #$00
3eff : a6 49 __ LDX T2 + 0 
3f01 : 9d be bf STA $bfbe,x ; (buff + 0)
3f04 : 20 dd 3f JSR $3fdd ; (puts.s0 + 0)
3f07 : a9 00 __ LDA #$00
3f09 : 85 49 __ STA T2 + 0 
.s238:
3f0b : a5 4d __ LDA T6 + 0 
3f0d : 85 0d __ STA P0 ; (fmt + 0)
3f0f : a5 4e __ LDA T6 + 1 
3f11 : 85 0e __ STA P1 ; (fmt + 1)
3f13 : 20 dd 3f JSR $3fdd ; (puts.s0 + 0)
3f16 : ad bc bf LDA $bfbc ; (si + 6)
3f19 : d0 03 __ BNE $3f1e ; (printf.s1073 + 0)
3f1b : 4c b3 3c JMP $3cb3 ; (printf.l2 + 0)
.s1073:
3f1e : a4 4c __ LDY T4 + 0 
3f20 : cc b7 bf CPY $bfb7 ; (si + 1)
3f23 : a2 00 __ LDX #$00
3f25 : b0 0d __ BCS $3f34 ; (printf.s1074 + 0)
.l102:
3f27 : ad b6 bf LDA $bfb6 ; (si + 0)
3f2a : 9d be bf STA $bfbe,x ; (buff + 0)
3f2d : c8 __ __ INY
3f2e : cc b7 bf CPY $bfb7 ; (si + 1)
3f31 : e8 __ __ INX
3f32 : 90 f3 __ BCC $3f27 ; (printf.l102 + 0)
.s1074:
3f34 : 86 49 __ STX T2 + 0 
3f36 : 4c b3 3c JMP $3cb3 ; (printf.l2 + 0)
.s57:
3f39 : a0 00 __ LDY #$00
3f3b : b1 47 __ LDA (T0 + 0),y 
3f3d : 85 53 __ STA T8 + 0 
3f3f : c8 __ __ INY
3f40 : b1 47 __ LDA (T0 + 0),y 
3f42 : 85 54 __ STA T8 + 1 
3f44 : c8 __ __ INY
3f45 : b1 47 __ LDA (T0 + 0),y 
3f47 : 85 55 __ STA T8 + 2 
3f49 : c8 __ __ INY
3f4a : b1 47 __ LDA (T0 + 0),y 
3f4c : 85 56 __ STA T8 + 3 
3f4e : 18 __ __ CLC
3f4f : a5 47 __ LDA T0 + 0 
3f51 : 69 04 __ ADC #$04
3f53 : 85 47 __ STA T0 + 0 
3f55 : 90 02 __ BCC $3f59 ; (printf.s1086 + 0)
.s1085:
3f57 : e6 48 __ INC T0 + 1 
.s1086:
3f59 : a0 00 __ LDY #$00
3f5b : b1 4a __ LDA (T3 + 0),y 
3f5d : aa __ __ TAX
3f5e : e6 4a __ INC T3 + 0 
3f60 : d0 02 __ BNE $3f64 ; (printf.s1088 + 0)
.s1087:
3f62 : e6 4b __ INC T3 + 1 
.s1088:
3f64 : 8a __ __ TXA
3f65 : e0 64 __ CPX #$64
3f67 : f0 04 __ BEQ $3f6d ; (printf.s61 + 0)
.s64:
3f69 : c9 44 __ CMP #$44
3f6b : d0 04 __ BNE $3f71 ; (printf.s62 + 0)
.s61:
3f6d : a9 01 __ LDA #$01
3f6f : d0 1c __ BNE $3f8d ; (printf.s245 + 0)
.s62:
3f71 : c9 75 __ CMP #$75
3f73 : f0 17 __ BEQ $3f8c ; (printf.s268 + 0)
.s68:
3f75 : c9 55 __ CMP #$55
3f77 : f0 13 __ BEQ $3f8c ; (printf.s268 + 0)
.s66:
3f79 : c9 78 __ CMP #$78
3f7b : f0 07 __ BEQ $3f84 ; (printf.s69 + 0)
.s72:
3f7d : c9 58 __ CMP #$58
3f7f : f0 03 __ BEQ $3f84 ; (printf.s69 + 0)
3f81 : 4c b3 3c JMP $3cb3 ; (printf.l2 + 0)
.s69:
3f84 : 8c ba bf STY $bfba ; (si + 4)
3f87 : a9 10 __ LDA #$10
3f89 : 8d b9 bf STA $bfb9 ; (si + 3)
.s268:
3f8c : 98 __ __ TYA
.s245:
3f8d : 85 15 __ STA P8 
3f8f : a9 be __ LDA #$be
3f91 : 85 0f __ STA P2 ; (fmt + 2)
3f93 : a9 bf __ LDA #$bf
3f95 : 85 10 __ STA P3 ; (fmt + 3)
3f97 : a9 b6 __ LDA #$b6
3f99 : 85 0d __ STA P0 ; (fmt + 0)
3f9b : a9 bf __ LDA #$bf
3f9d : 85 0e __ STA P1 ; (fmt + 1)
3f9f : 20 67 41 JSR $4167 ; (nforml@proxy + 0)
3fa2 : a5 1b __ LDA ACCU + 0 
3fa4 : 4c fe 3c JMP $3cfe ; (printf.s1068 + 0)
.s269:
3fa7 : a9 00 __ LDA #$00
.s247:
3fa9 : 85 13 __ STA P6 
3fab : a9 be __ LDA #$be
3fad : 85 0f __ STA P2 ; (fmt + 2)
3faf : a9 bf __ LDA #$bf
3fb1 : 85 10 __ STA P3 ; (fmt + 3)
3fb3 : a0 00 __ LDY #$00
3fb5 : b1 47 __ LDA (T0 + 0),y 
3fb7 : 85 11 __ STA P4 
3fb9 : c8 __ __ INY
3fba : b1 47 __ LDA (T0 + 0),y 
3fbc : 85 12 __ STA P5 
3fbe : a9 b6 __ LDA #$b6
3fc0 : 85 0d __ STA P0 ; (fmt + 0)
3fc2 : a9 bf __ LDA #$bf
3fc4 : 85 0e __ STA P1 ; (fmt + 1)
3fc6 : 20 32 40 JSR $4032 ; (nformi.s0 + 0)
3fc9 : a5 1b __ LDA ACCU + 0 
3fcb : 85 49 __ STA T2 + 0 
3fcd : 4c 97 3e JMP $3e97 ; (printf.s244 + 0)
.s246:
3fd0 : a0 00 __ LDY #$00
3fd2 : b1 4a __ LDA (T3 + 0),y 
3fd4 : aa __ __ TAX
3fd5 : 18 __ __ CLC
3fd6 : a5 4a __ LDA T3 + 0 
3fd8 : 69 01 __ ADC #$01
3fda : 4c 48 3d JMP $3d48 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
3fdd : a0 00 __ LDY #$00
3fdf : b1 0d __ LDA (P0),y 
3fe1 : f0 0b __ BEQ $3fee ; (puts.s1001 + 0)
3fe3 : 20 ef 3f JSR $3fef ; (putpch + 0)
3fe6 : e6 0d __ INC P0 
3fe8 : d0 f3 __ BNE $3fdd ; (puts.s0 + 0)
3fea : e6 0e __ INC P1 
3fec : d0 ef __ BNE $3fdd ; (puts.s0 + 0)
.s1001:
3fee : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
3fef : ae d2 50 LDX $50d2 ; (giocharmap + 0)
3ff2 : e0 01 __ CPX #$01
3ff4 : 90 26 __ BCC $401c ; (putpch + 45)
3ff6 : c9 0a __ CMP #$0a
3ff8 : d0 02 __ BNE $3ffc ; (putpch + 13)
3ffa : a9 0d __ LDA #$0d
3ffc : c9 09 __ CMP #$09
3ffe : f0 1f __ BEQ $401f ; (putpch + 48)
4000 : e0 02 __ CPX #$02
4002 : 90 18 __ BCC $401c ; (putpch + 45)
4004 : c9 41 __ CMP #$41
4006 : 90 14 __ BCC $401c ; (putpch + 45)
4008 : c9 7b __ CMP #$7b
400a : b0 10 __ BCS $401c ; (putpch + 45)
400c : c9 61 __ CMP #$61
400e : b0 04 __ BCS $4014 ; (putpch + 37)
4010 : c9 5b __ CMP #$5b
4012 : b0 08 __ BCS $401c ; (putpch + 45)
4014 : 49 20 __ EOR #$20
4016 : e0 03 __ CPX #$03
4018 : f0 02 __ BEQ $401c ; (putpch + 45)
401a : 29 df __ AND #$df
401c : 4c d2 ff JMP $ffd2 
401f : 38 __ __ SEC
4020 : 20 f0 ff JSR $fff0 
4023 : 98 __ __ TYA
4024 : 29 03 __ AND #$03
4026 : 49 03 __ EOR #$03
4028 : aa __ __ TAX
4029 : a9 20 __ LDA #$20
402b : 20 d2 ff JSR $ffd2 
402e : ca __ __ DEX
402f : 10 fa __ BPL $402b ; (putpch + 60)
4031 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
4032 : a9 00 __ LDA #$00
4034 : 85 43 __ STA T0 + 0 
4036 : a5 13 __ LDA P6 ; (s + 0)
4038 : f0 13 __ BEQ $404d ; (nformi.s182 + 0)
.s4:
403a : 24 12 __ BIT P5 ; (v + 1)
403c : 10 0f __ BPL $404d ; (nformi.s182 + 0)
.s1:
403e : 38 __ __ SEC
403f : a9 00 __ LDA #$00
4041 : e5 11 __ SBC P4 ; (v + 0)
4043 : 85 11 __ STA P4 ; (v + 0)
4045 : a9 00 __ LDA #$00
4047 : e5 12 __ SBC P5 ; (v + 1)
4049 : 85 12 __ STA P5 ; (v + 1)
404b : e6 43 __ INC T0 + 0 
.s182:
404d : a9 10 __ LDA #$10
404f : 85 44 __ STA T2 + 0 
4051 : a5 11 __ LDA P4 ; (v + 0)
4053 : 05 12 __ ORA P5 ; (v + 1)
4055 : f0 46 __ BEQ $409d ; (nformi.s7 + 0)
.s42:
4057 : a0 03 __ LDY #$03
4059 : b1 0d __ LDA (P0),y ; (si + 0)
405b : 85 45 __ STA T4 + 0 
405d : c8 __ __ INY
405e : b1 0d __ LDA (P0),y ; (si + 0)
4060 : 85 46 __ STA T4 + 1 
.l6:
4062 : a5 11 __ LDA P4 ; (v + 0)
4064 : 85 1b __ STA ACCU + 0 
4066 : a5 12 __ LDA P5 ; (v + 1)
4068 : 85 1c __ STA ACCU + 1 
406a : a5 45 __ LDA T4 + 0 
406c : 85 03 __ STA WORK + 0 
406e : a5 46 __ LDA T4 + 1 
4070 : 85 04 __ STA WORK + 1 
4072 : 20 92 4f JSR $4f92 ; (divmod + 0)
4075 : a5 06 __ LDA WORK + 3 
4077 : 30 08 __ BMI $4081 ; (nformi.s78 + 0)
.s1019:
4079 : d0 0a __ BNE $4085 ; (nformi.s77 + 0)
.s1018:
407b : a5 05 __ LDA WORK + 2 
407d : c9 0a __ CMP #$0a
407f : b0 04 __ BCS $4085 ; (nformi.s77 + 0)
.s78:
4081 : a9 30 __ LDA #$30
4083 : d0 02 __ BNE $4087 ; (nformi.s79 + 0)
.s77:
4085 : a9 37 __ LDA #$37
.s79:
4087 : 18 __ __ CLC
4088 : 65 05 __ ADC WORK + 2 
408a : c6 44 __ DEC T2 + 0 
408c : a6 44 __ LDX T2 + 0 
408e : 9d f0 bf STA $bff0,x ; (buffer + 0)
4091 : a5 1b __ LDA ACCU + 0 
4093 : 85 11 __ STA P4 ; (v + 0)
4095 : a5 1c __ LDA ACCU + 1 
4097 : 85 12 __ STA P5 ; (v + 1)
4099 : 05 11 __ ORA P4 ; (v + 0)
409b : d0 c5 __ BNE $4062 ; (nformi.l6 + 0)
.s7:
409d : a0 02 __ LDY #$02
409f : b1 0d __ LDA (P0),y ; (si + 0)
40a1 : c9 ff __ CMP #$ff
40a3 : d0 04 __ BNE $40a9 ; (nformi.s80 + 0)
.s81:
40a5 : a9 0f __ LDA #$0f
40a7 : d0 05 __ BNE $40ae ; (nformi.s1026 + 0)
.s80:
40a9 : 38 __ __ SEC
40aa : a9 10 __ LDA #$10
40ac : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
40ae : a8 __ __ TAY
40af : c4 44 __ CPY T2 + 0 
40b1 : b0 0d __ BCS $40c0 ; (nformi.s10 + 0)
.s9:
40b3 : a9 30 __ LDA #$30
.l1027:
40b5 : c6 44 __ DEC T2 + 0 
40b7 : a6 44 __ LDX T2 + 0 
40b9 : 9d f0 bf STA $bff0,x ; (buffer + 0)
40bc : c4 44 __ CPY T2 + 0 
40be : 90 f5 __ BCC $40b5 ; (nformi.l1027 + 0)
.s10:
40c0 : a0 07 __ LDY #$07
40c2 : b1 0d __ LDA (P0),y ; (si + 0)
40c4 : f0 20 __ BEQ $40e6 ; (nformi.s13 + 0)
.s14:
40c6 : a0 04 __ LDY #$04
40c8 : b1 0d __ LDA (P0),y ; (si + 0)
40ca : d0 1a __ BNE $40e6 ; (nformi.s13 + 0)
.s1013:
40cc : 88 __ __ DEY
40cd : b1 0d __ LDA (P0),y ; (si + 0)
40cf : c9 10 __ CMP #$10
40d1 : d0 13 __ BNE $40e6 ; (nformi.s13 + 0)
.s11:
40d3 : a9 58 __ LDA #$58
40d5 : a6 44 __ LDX T2 + 0 
40d7 : 9d ef bf STA $bfef,x ; (buff + 49)
40da : 8a __ __ TXA
40db : 18 __ __ CLC
40dc : 69 fe __ ADC #$fe
40de : 85 44 __ STA T2 + 0 
40e0 : aa __ __ TAX
40e1 : a9 30 __ LDA #$30
40e3 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
40e6 : a9 00 __ LDA #$00
40e8 : 85 1b __ STA ACCU + 0 
40ea : a5 43 __ LDA T0 + 0 
40ec : f0 06 __ BEQ $40f4 ; (nformi.s16 + 0)
.s15:
40ee : c6 44 __ DEC T2 + 0 
40f0 : a9 2d __ LDA #$2d
40f2 : d0 0a __ BNE $40fe ; (nformi.s1025 + 0)
.s16:
40f4 : a0 05 __ LDY #$05
40f6 : b1 0d __ LDA (P0),y ; (si + 0)
40f8 : f0 09 __ BEQ $4103 ; (nformi.s163 + 0)
.s18:
40fa : c6 44 __ DEC T2 + 0 
40fc : a9 2b __ LDA #$2b
.s1025:
40fe : a6 44 __ LDX T2 + 0 
4100 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
4103 : a0 06 __ LDY #$06
4105 : b1 0d __ LDA (P0),y ; (si + 0)
4107 : d0 33 __ BNE $413c ; (nformi.s24 + 0)
.l30:
4109 : a0 01 __ LDY #$01
410b : b1 0d __ LDA (P0),y ; (si + 0)
410d : 18 __ __ CLC
410e : 65 44 __ ADC T2 + 0 
4110 : b0 04 __ BCS $4116 ; (nformi.s31 + 0)
.s1006:
4112 : c9 11 __ CMP #$11
4114 : 90 0d __ BCC $4123 ; (nformi.s33 + 0)
.s31:
4116 : c6 44 __ DEC T2 + 0 
4118 : a0 00 __ LDY #$00
411a : b1 0d __ LDA (P0),y ; (si + 0)
411c : a6 44 __ LDX T2 + 0 
411e : 9d f0 bf STA $bff0,x ; (buffer + 0)
4121 : b0 e6 __ BCS $4109 ; (nformi.l30 + 0)
.s33:
4123 : a6 44 __ LDX T2 + 0 
4125 : e0 10 __ CPX #$10
4127 : b0 0e __ BCS $4137 ; (nformi.s23 + 0)
.s34:
4129 : 88 __ __ DEY
.l1022:
412a : bd f0 bf LDA $bff0,x ; (buffer + 0)
412d : 91 0f __ STA (P2),y ; (str + 0)
412f : e8 __ __ INX
4130 : e0 10 __ CPX #$10
4132 : c8 __ __ INY
4133 : 90 f5 __ BCC $412a ; (nformi.l1022 + 0)
.s1023:
4135 : 84 1b __ STY ACCU + 0 
.s23:
4137 : a9 00 __ LDA #$00
4139 : 85 1c __ STA ACCU + 1 
.s1001:
413b : 60 __ __ RTS
.s24:
413c : a6 44 __ LDX T2 + 0 
413e : e0 10 __ CPX #$10
4140 : b0 1a __ BCS $415c ; (nformi.l27 + 0)
.s25:
4142 : a0 00 __ LDY #$00
.l1020:
4144 : bd f0 bf LDA $bff0,x ; (buffer + 0)
4147 : 91 0f __ STA (P2),y ; (str + 0)
4149 : e8 __ __ INX
414a : e0 10 __ CPX #$10
414c : c8 __ __ INY
414d : 90 f5 __ BCC $4144 ; (nformi.l1020 + 0)
.s1021:
414f : 84 1b __ STY ACCU + 0 
4151 : b0 09 __ BCS $415c ; (nformi.l27 + 0)
.s28:
4153 : 88 __ __ DEY
4154 : b1 0d __ LDA (P0),y ; (si + 0)
4156 : a4 1b __ LDY ACCU + 0 
4158 : 91 0f __ STA (P2),y ; (str + 0)
415a : e6 1b __ INC ACCU + 0 
.l27:
415c : a5 1b __ LDA ACCU + 0 
415e : a0 01 __ LDY #$01
4160 : d1 0d __ CMP (P0),y ; (si + 0)
4162 : 90 ef __ BCC $4153 ; (nformi.s28 + 0)
4164 : 4c 37 41 JMP $4137 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml@proxy: ; nforml@proxy
4167 : a5 53 __ LDA $53 
4169 : 85 11 __ STA P4 
416b : a5 54 __ LDA $54 
416d : 85 12 __ STA P5 
416f : a5 55 __ LDA $55 
4171 : 85 13 __ STA P6 
4173 : a5 56 __ LDA $56 
4175 : 85 14 __ STA P7 
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
4177 : a9 00 __ LDA #$00
4179 : 85 43 __ STA T0 + 0 
417b : a5 15 __ LDA P8 ; (s + 0)
417d : f0 21 __ BEQ $41a0 ; (nforml.s182 + 0)
.s4:
417f : a5 14 __ LDA P7 ; (v + 3)
4181 : f0 1d __ BEQ $41a0 ; (nforml.s182 + 0)
.s1032:
4183 : 10 1b __ BPL $41a0 ; (nforml.s182 + 0)
.s1:
4185 : 38 __ __ SEC
4186 : a9 00 __ LDA #$00
4188 : e5 11 __ SBC P4 ; (v + 0)
418a : 85 11 __ STA P4 ; (v + 0)
418c : a9 00 __ LDA #$00
418e : e5 12 __ SBC P5 ; (v + 1)
4190 : 85 12 __ STA P5 ; (v + 1)
4192 : a9 00 __ LDA #$00
4194 : e5 13 __ SBC P6 ; (v + 2)
4196 : 85 13 __ STA P6 ; (v + 2)
4198 : a9 00 __ LDA #$00
419a : e5 14 __ SBC P7 ; (v + 3)
419c : 85 14 __ STA P7 ; (v + 3)
419e : e6 43 __ INC T0 + 0 
.s182:
41a0 : a9 10 __ LDA #$10
41a2 : 85 44 __ STA T2 + 0 
41a4 : a5 14 __ LDA P7 ; (v + 3)
41a6 : d0 0c __ BNE $41b4 ; (nforml.s42 + 0)
.s1024:
41a8 : a5 13 __ LDA P6 ; (v + 2)
41aa : d0 08 __ BNE $41b4 ; (nforml.s42 + 0)
.s1025:
41ac : a5 12 __ LDA P5 ; (v + 1)
41ae : d0 04 __ BNE $41b4 ; (nforml.s42 + 0)
.s1026:
41b0 : c5 11 __ CMP P4 ; (v + 0)
41b2 : b0 0e __ BCS $41c2 ; (nforml.s7 + 0)
.s42:
41b4 : a0 03 __ LDY #$03
41b6 : b1 0d __ LDA (P0),y ; (si + 0)
41b8 : 85 45 __ STA T5 + 0 
41ba : c8 __ __ INY
41bb : b1 0d __ LDA (P0),y ; (si + 0)
41bd : 85 46 __ STA T5 + 1 
41bf : 4c 8c 42 JMP $428c ; (nforml.l6 + 0)
.s7:
41c2 : a0 02 __ LDY #$02
41c4 : b1 0d __ LDA (P0),y ; (si + 0)
41c6 : c9 ff __ CMP #$ff
41c8 : d0 04 __ BNE $41ce ; (nforml.s80 + 0)
.s81:
41ca : a9 0f __ LDA #$0f
41cc : d0 05 __ BNE $41d3 ; (nforml.s1039 + 0)
.s80:
41ce : 38 __ __ SEC
41cf : a9 10 __ LDA #$10
41d1 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
41d3 : a8 __ __ TAY
41d4 : c4 44 __ CPY T2 + 0 
41d6 : b0 0d __ BCS $41e5 ; (nforml.s10 + 0)
.s9:
41d8 : a9 30 __ LDA #$30
.l1040:
41da : c6 44 __ DEC T2 + 0 
41dc : a6 44 __ LDX T2 + 0 
41de : 9d f0 bf STA $bff0,x ; (buffer + 0)
41e1 : c4 44 __ CPY T2 + 0 
41e3 : 90 f5 __ BCC $41da ; (nforml.l1040 + 0)
.s10:
41e5 : a0 07 __ LDY #$07
41e7 : b1 0d __ LDA (P0),y ; (si + 0)
41e9 : f0 20 __ BEQ $420b ; (nforml.s13 + 0)
.s14:
41eb : a0 04 __ LDY #$04
41ed : b1 0d __ LDA (P0),y ; (si + 0)
41ef : d0 1a __ BNE $420b ; (nforml.s13 + 0)
.s1013:
41f1 : 88 __ __ DEY
41f2 : b1 0d __ LDA (P0),y ; (si + 0)
41f4 : c9 10 __ CMP #$10
41f6 : d0 13 __ BNE $420b ; (nforml.s13 + 0)
.s11:
41f8 : a9 58 __ LDA #$58
41fa : a6 44 __ LDX T2 + 0 
41fc : 9d ef bf STA $bfef,x ; (buff + 49)
41ff : 8a __ __ TXA
4200 : 18 __ __ CLC
4201 : 69 fe __ ADC #$fe
4203 : 85 44 __ STA T2 + 0 
4205 : aa __ __ TAX
4206 : a9 30 __ LDA #$30
4208 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
420b : a9 00 __ LDA #$00
420d : 85 1b __ STA ACCU + 0 
420f : a5 43 __ LDA T0 + 0 
4211 : f0 06 __ BEQ $4219 ; (nforml.s16 + 0)
.s15:
4213 : c6 44 __ DEC T2 + 0 
4215 : a9 2d __ LDA #$2d
4217 : d0 0a __ BNE $4223 ; (nforml.s1038 + 0)
.s16:
4219 : a0 05 __ LDY #$05
421b : b1 0d __ LDA (P0),y ; (si + 0)
421d : f0 09 __ BEQ $4228 ; (nforml.s163 + 0)
.s18:
421f : c6 44 __ DEC T2 + 0 
4221 : a9 2b __ LDA #$2b
.s1038:
4223 : a6 44 __ LDX T2 + 0 
4225 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
4228 : a0 06 __ LDY #$06
422a : b1 0d __ LDA (P0),y ; (si + 0)
422c : d0 33 __ BNE $4261 ; (nforml.s24 + 0)
.l30:
422e : a0 01 __ LDY #$01
4230 : b1 0d __ LDA (P0),y ; (si + 0)
4232 : 18 __ __ CLC
4233 : 65 44 __ ADC T2 + 0 
4235 : b0 04 __ BCS $423b ; (nforml.s31 + 0)
.s1006:
4237 : c9 11 __ CMP #$11
4239 : 90 0d __ BCC $4248 ; (nforml.s33 + 0)
.s31:
423b : c6 44 __ DEC T2 + 0 
423d : a0 00 __ LDY #$00
423f : b1 0d __ LDA (P0),y ; (si + 0)
4241 : a6 44 __ LDX T2 + 0 
4243 : 9d f0 bf STA $bff0,x ; (buffer + 0)
4246 : b0 e6 __ BCS $422e ; (nforml.l30 + 0)
.s33:
4248 : a6 44 __ LDX T2 + 0 
424a : e0 10 __ CPX #$10
424c : b0 0e __ BCS $425c ; (nforml.s23 + 0)
.s34:
424e : 88 __ __ DEY
.l1035:
424f : bd f0 bf LDA $bff0,x ; (buffer + 0)
4252 : 91 0f __ STA (P2),y ; (str + 0)
4254 : e8 __ __ INX
4255 : e0 10 __ CPX #$10
4257 : c8 __ __ INY
4258 : 90 f5 __ BCC $424f ; (nforml.l1035 + 0)
.s1036:
425a : 84 1b __ STY ACCU + 0 
.s23:
425c : a9 00 __ LDA #$00
425e : 85 1c __ STA ACCU + 1 
.s1001:
4260 : 60 __ __ RTS
.s24:
4261 : a6 44 __ LDX T2 + 0 
4263 : e0 10 __ CPX #$10
4265 : b0 1a __ BCS $4281 ; (nforml.l27 + 0)
.s25:
4267 : a0 00 __ LDY #$00
.l1033:
4269 : bd f0 bf LDA $bff0,x ; (buffer + 0)
426c : 91 0f __ STA (P2),y ; (str + 0)
426e : e8 __ __ INX
426f : e0 10 __ CPX #$10
4271 : c8 __ __ INY
4272 : 90 f5 __ BCC $4269 ; (nforml.l1033 + 0)
.s1034:
4274 : 84 1b __ STY ACCU + 0 
4276 : b0 09 __ BCS $4281 ; (nforml.l27 + 0)
.s28:
4278 : 88 __ __ DEY
4279 : b1 0d __ LDA (P0),y ; (si + 0)
427b : a4 1b __ LDY ACCU + 0 
427d : 91 0f __ STA (P2),y ; (str + 0)
427f : e6 1b __ INC ACCU + 0 
.l27:
4281 : a5 1b __ LDA ACCU + 0 
4283 : a0 01 __ LDY #$01
4285 : d1 0d __ CMP (P0),y ; (si + 0)
4287 : 90 ef __ BCC $4278 ; (nforml.s28 + 0)
4289 : 4c 5c 42 JMP $425c ; (nforml.s23 + 0)
.l6:
428c : a5 11 __ LDA P4 ; (v + 0)
428e : 85 1b __ STA ACCU + 0 
4290 : a5 12 __ LDA P5 ; (v + 1)
4292 : 85 1c __ STA ACCU + 1 
4294 : a5 13 __ LDA P6 ; (v + 2)
4296 : 85 1d __ STA ACCU + 2 
4298 : a5 14 __ LDA P7 ; (v + 3)
429a : 85 1e __ STA ACCU + 3 
429c : a5 45 __ LDA T5 + 0 
429e : 85 03 __ STA WORK + 0 
42a0 : a5 46 __ LDA T5 + 1 
42a2 : 85 04 __ STA WORK + 1 
42a4 : a9 00 __ LDA #$00
42a6 : 85 05 __ STA WORK + 2 
42a8 : 85 06 __ STA WORK + 3 
42aa : 20 17 50 JSR $5017 ; (divmod32 + 0)
42ad : a5 08 __ LDA WORK + 5 
42af : 30 08 __ BMI $42b9 ; (nforml.s78 + 0)
.s1023:
42b1 : d0 0a __ BNE $42bd ; (nforml.s77 + 0)
.s1022:
42b3 : a5 07 __ LDA WORK + 4 
42b5 : c9 0a __ CMP #$0a
42b7 : b0 04 __ BCS $42bd ; (nforml.s77 + 0)
.s78:
42b9 : a9 30 __ LDA #$30
42bb : d0 02 __ BNE $42bf ; (nforml.s79 + 0)
.s77:
42bd : a9 37 __ LDA #$37
.s79:
42bf : 18 __ __ CLC
42c0 : 65 07 __ ADC WORK + 4 
42c2 : c6 44 __ DEC T2 + 0 
42c4 : a6 44 __ LDX T2 + 0 
42c6 : 9d f0 bf STA $bff0,x ; (buffer + 0)
42c9 : a5 1b __ LDA ACCU + 0 
42cb : 85 11 __ STA P4 ; (v + 0)
42cd : a5 1c __ LDA ACCU + 1 
42cf : 85 12 __ STA P5 ; (v + 1)
42d1 : a5 1d __ LDA ACCU + 2 
42d3 : 85 13 __ STA P6 ; (v + 2)
42d5 : a5 1e __ LDA ACCU + 3 
42d7 : 85 14 __ STA P7 ; (v + 3)
42d9 : d0 b1 __ BNE $428c ; (nforml.l6 + 0)
.s1018:
42db : a5 13 __ LDA P6 ; (v + 2)
42dd : d0 ad __ BNE $428c ; (nforml.l6 + 0)
.s1019:
42df : a5 12 __ LDA P5 ; (v + 1)
42e1 : d0 a9 __ BNE $428c ; (nforml.l6 + 0)
.s1020:
42e3 : c5 11 __ CMP P4 ; (v + 0)
42e5 : 90 a5 __ BCC $428c ; (nforml.l6 + 0)
42e7 : 4c c2 41 JMP $41c2 ; (nforml.s7 + 0)
--------------------------------------------------------------------
getch: ; getch()->i16
.s0:
42ea : 20 2b 43 JSR $432b ; (getpch + 0)
42ed : c9 00 __ CMP #$00
42ef : f0 f9 __ BEQ $42ea ; (getch.s0 + 0)
42f1 : 85 1b __ STA ACCU + 0 
42f3 : a9 00 __ LDA #$00
42f5 : 85 1c __ STA ACCU + 1 
.s1001:
42f7 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
42f8 : 20 81 ff JSR $ff81 
.s1001:
42fb : 60 __ __ RTS
--------------------------------------------------------------------
42fc : __ __ __ BYT 65 4e 00                                        : eN.
--------------------------------------------------------------------
spentry:
42ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4300 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
4310 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
4320 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getpch: ; getpch
432b : 20 e4 ff JSR $ffe4 
432e : ae d2 50 LDX $50d2 ; (giocharmap + 0)
4331 : e0 01 __ CPX #$01
4333 : 90 26 __ BCC $435b ; (getpch + 48)
4335 : c9 0d __ CMP #$0d
4337 : d0 02 __ BNE $433b ; (getpch + 16)
4339 : a9 0a __ LDA #$0a
433b : e0 02 __ CPX #$02
433d : 90 1c __ BCC $435b ; (getpch + 48)
433f : c9 db __ CMP #$db
4341 : b0 18 __ BCS $435b ; (getpch + 48)
4343 : c9 41 __ CMP #$41
4345 : 90 14 __ BCC $435b ; (getpch + 48)
4347 : c9 c1 __ CMP #$c1
4349 : 90 02 __ BCC $434d ; (getpch + 34)
434b : 49 a0 __ EOR #$a0
434d : c9 7b __ CMP #$7b
434f : b0 0a __ BCS $435b ; (getpch + 48)
4351 : c9 61 __ CMP #$61
4353 : b0 04 __ BCS $4359 ; (getpch + 46)
4355 : c9 5b __ CMP #$5b
4357 : b0 02 __ BCS $435b ; (getpch + 48)
4359 : 49 20 __ EOR #$20
435b : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
435c : 24 d7 __ BIT $d7 
435e : 30 03 __ BMI $4363 ; (screen_setmode.s1001 + 0)
.s6:
4360 : 20 5f ff JSR $ff5f 
.s1001:
4363 : 60 __ __ RTS
--------------------------------------------------------------------
4364 : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
4374 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
4384 : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
438e : __ __ __ BYT 4f 56 4c 31 00                                  : OVL1.
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
4393 : a5 0d __ LDA P0 
4395 : a6 0e __ LDX P1 
4397 : 20 68 ff JSR $ff68 
.s1001:
439a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
439b : a5 0d __ LDA P0 
439d : 05 0e __ ORA P1 
439f : f0 08 __ BEQ $43a9 ; (krnio_setnam.s0 + 14)
43a1 : a0 ff __ LDY #$ff
43a3 : c8 __ __ INY
43a4 : b1 0d __ LDA (P0),y 
43a6 : d0 fb __ BNE $43a3 ; (krnio_setnam.s0 + 8)
43a8 : 98 __ __ TYA
43a9 : a6 0d __ LDX P0 
43ab : a4 0e __ LDY P1 
43ad : 20 bd ff JSR $ffbd 
.s1001:
43b0 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
43b1 : a5 0d __ LDA P0 
43b3 : a6 0e __ LDX P1 
43b5 : a4 0f __ LDY P2 
43b7 : 20 ba ff JSR $ffba 
43ba : a9 00 __ LDA #$00
43bc : a2 00 __ LDX #$00
43be : a0 00 __ LDY #$00
43c0 : 20 d5 ff JSR $ffd5 
43c3 : a9 00 __ LDA #$00
43c5 : b0 02 __ BCS $43c9 ; (krnio_load.s0 + 24)
43c7 : a9 01 __ LDA #$01
43c9 : 85 1b __ STA ACCU + 0 
.s1001:
43cb : a5 1b __ LDA ACCU + 0 
43cd : 60 __ __ RTS
--------------------------------------------------------------------
43ce : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
43de : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
43ec : a9 01 __ LDA #$01
43ee : 85 0d __ STA P0 
43f0 : a9 00 __ LDA #$00
43f2 : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
43f4 : a5 0d __ LDA P0 
43f6 : 85 1b __ STA ACCU + 0 
43f8 : a5 0e __ LDA P1 
43fa : 85 1c __ STA ACCU + 1 
43fc : ae ff 42 LDX $42ff ; (spentry + 0)
43ff : 9a __ __ TXS
4400 : a9 4c __ LDA #$4c
4402 : 85 54 __ STA $54 
4404 : a9 00 __ LDA #$00
4406 : 85 13 __ STA P6 
.s1001:
4408 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
4409 : a5 53 __ LDA T9 + 0 
440b : 8d f9 bf STA $bff9 ; (buffer + 9)
440e : a5 54 __ LDA T9 + 1 
4410 : 8d fa bf STA $bffa ; (buffer + 10)
.s0:
4413 : a6 13 __ LDX P6 ; (mode + 0)
4415 : bd ad 50 LDA $50ad,x ; (__multab36L + 0)
4418 : 85 47 __ STA T1 + 0 
441a : aa __ __ TAX
441b : 18 __ __ CLC
441c : 69 00 __ ADC #$00
441e : 85 49 __ STA T2 + 0 
4420 : a9 51 __ LDA #$51
4422 : 69 00 __ ADC #$00
4424 : 85 4a __ STA T2 + 1 
4426 : bd 04 51 LDA $5104,x ; (vdc_modes + 4)
4429 : f0 0a __ BEQ $4435 ; (vdc_set_mode.s3 + 0)
.s4:
442b : ad d3 50 LDA $50d3 ; (vdc_state + 0)
442e : c9 10 __ CMP #$10
4430 : d0 03 __ BNE $4435 ; (vdc_set_mode.s3 + 0)
4432 : 4c 15 47 JMP $4715 ; (vdc_set_mode.s1001 + 0)
.s3:
4435 : a9 00 __ LDA #$00
4437 : 8d e9 50 STA $50e9 ; (vdc_state + 22)
443a : 8d ea 50 STA $50ea ; (vdc_state + 23)
443d : 8d eb 50 STA $50eb ; (vdc_state + 24)
4440 : a0 09 __ LDY #$09
4442 : b1 49 __ LDA (T2 + 0),y 
4444 : 8d df 50 STA $50df ; (vdc_state + 12)
4447 : c8 __ __ INY
4448 : b1 49 __ LDA (T2 + 0),y 
444a : 8d e0 50 STA $50e0 ; (vdc_state + 13)
444d : c8 __ __ INY
444e : b1 49 __ LDA (T2 + 0),y 
4450 : 8d e1 50 STA $50e1 ; (vdc_state + 14)
4453 : c8 __ __ INY
4454 : b1 49 __ LDA (T2 + 0),y 
4456 : 8d e2 50 STA $50e2 ; (vdc_state + 15)
4459 : a0 0f __ LDY #$0f
445b : b1 49 __ LDA (T2 + 0),y 
445d : 8d e5 50 STA $50e5 ; (vdc_state + 18)
4460 : c8 __ __ INY
4461 : b1 49 __ LDA (T2 + 0),y 
4463 : 8d e6 50 STA $50e6 ; (vdc_state + 19)
4466 : c8 __ __ INY
4467 : b1 49 __ LDA (T2 + 0),y 
4469 : 8d e7 50 STA $50e7 ; (vdc_state + 20)
446c : c8 __ __ INY
446d : b1 49 __ LDA (T2 + 0),y 
446f : 8d e8 50 STA $50e8 ; (vdc_state + 21)
4472 : a0 00 __ LDY #$00
4474 : b1 49 __ LDA (T2 + 0),y 
4476 : 85 44 __ STA T3 + 0 
4478 : c8 __ __ INY
4479 : b1 49 __ LDA (T2 + 0),y 
447b : 85 45 __ STA T3 + 1 
447d : 8d d7 50 STA $50d7 ; (vdc_state + 4)
4480 : a5 44 __ LDA T3 + 0 
4482 : 8d d6 50 STA $50d6 ; (vdc_state + 3)
4485 : c8 __ __ INY
4486 : b1 49 __ LDA (T2 + 0),y 
4488 : 85 1b __ STA ACCU + 0 
448a : c8 __ __ INY
448b : b1 49 __ LDA (T2 + 0),y 
448d : 85 1c __ STA ACCU + 1 
448f : 8d d9 50 STA $50d9 ; (vdc_state + 6)
4492 : a5 1b __ LDA ACCU + 0 
4494 : 8d d8 50 STA $50d8 ; (vdc_state + 5)
4497 : a0 05 __ LDY #$05
4499 : b1 49 __ LDA (T2 + 0),y 
449b : 85 4b __ STA T5 + 0 
449d : c8 __ __ INY
449e : b1 49 __ LDA (T2 + 0),y 
44a0 : 85 4c __ STA T5 + 1 
44a2 : 8d dc 50 STA $50dc ; (vdc_state + 9)
44a5 : a5 4b __ LDA T5 + 0 
44a7 : 8d db 50 STA $50db ; (vdc_state + 8)
44aa : c8 __ __ INY
44ab : b1 49 __ LDA (T2 + 0),y 
44ad : 85 4d __ STA T6 + 0 
44af : c8 __ __ INY
44b0 : b1 49 __ LDA (T2 + 0),y 
44b2 : 85 4e __ STA T6 + 1 
44b4 : 8d de 50 STA $50de ; (vdc_state + 11)
44b7 : a5 4d __ LDA T6 + 0 
44b9 : 8d dd 50 STA $50dd ; (vdc_state + 10)
44bc : a0 0d __ LDY #$0d
44be : b1 49 __ LDA (T2 + 0),y 
44c0 : 85 4f __ STA T7 + 0 
44c2 : c8 __ __ INY
44c3 : b1 49 __ LDA (T2 + 0),y 
44c5 : 85 50 __ STA T7 + 1 
44c7 : 8d e4 50 STA $50e4 ; (vdc_state + 17)
44ca : a5 4f __ LDA T7 + 0 
44cc : 8d e3 50 STA $50e3 ; (vdc_state + 16)
44cf : a5 1b __ LDA ACCU + 0 
44d1 : 05 1c __ ORA ACCU + 1 
44d3 : f0 3c __ BEQ $4511 ; (vdc_set_mode.s6 + 0)
.s374:
44d5 : a9 00 __ LDA #$00
44d7 : 85 51 __ STA T8 + 0 
44d9 : 85 52 __ STA T8 + 1 
44db : a9 00 __ LDA #$00
44dd : 85 53 __ STA T9 + 0 
44df : a9 52 __ LDA #$52
44e1 : 85 54 __ STA T9 + 1 
44e3 : a2 00 __ LDX #$00
.l8:
44e5 : a5 51 __ LDA T8 + 0 
44e7 : a0 00 __ LDY #$00
44e9 : 91 53 __ STA (T9 + 0),y 
44eb : a5 52 __ LDA T8 + 1 
44ed : c8 __ __ INY
44ee : 91 53 __ STA (T9 + 0),y 
44f0 : 18 __ __ CLC
44f1 : a5 44 __ LDA T3 + 0 
44f3 : 65 51 __ ADC T8 + 0 
44f5 : 85 51 __ STA T8 + 0 
44f7 : a5 45 __ LDA T3 + 1 
44f9 : 65 52 __ ADC T8 + 1 
44fb : 85 52 __ STA T8 + 1 
44fd : 18 __ __ CLC
44fe : a5 53 __ LDA T9 + 0 
4500 : 69 02 __ ADC #$02
4502 : 85 53 __ STA T9 + 0 
4504 : 90 02 __ BCC $4508 ; (vdc_set_mode.s1115 + 0)
.s1114:
4506 : e6 54 __ INC T9 + 1 
.s1115:
4508 : e8 __ __ INX
4509 : a5 1c __ LDA ACCU + 1 
450b : d0 d8 __ BNE $44e5 ; (vdc_set_mode.l8 + 0)
.s1108:
450d : e4 1b __ CPX ACCU + 0 
450f : 90 d4 __ BCC $44e5 ; (vdc_set_mode.l8 + 0)
.s6:
4511 : a9 22 __ LDA #$22
4513 : 8d 00 d6 STA $d600 
.l1577:
4516 : 2c 00 d6 BIT $d600 
4519 : 10 fb __ BPL $4516 ; (vdc_set_mode.l1577 + 0)
.s16:
451b : a9 80 __ LDA #$80
451d : 8d 01 d6 STA $d601 
4520 : a9 0c __ LDA #$0c
4522 : 8d 00 d6 STA $d600 
.l1579:
4525 : 2c 00 d6 BIT $d600 
4528 : 10 fb __ BPL $4525 ; (vdc_set_mode.l1579 + 0)
.s22:
452a : a5 4c __ LDA T5 + 1 
452c : 8d 01 d6 STA $d601 
452f : a9 0d __ LDA #$0d
4531 : 8d 00 d6 STA $d600 
.l1581:
4534 : 2c 00 d6 BIT $d600 
4537 : 10 fb __ BPL $4534 ; (vdc_set_mode.l1581 + 0)
.s27:
4539 : a5 4b __ LDA T5 + 0 
453b : 8d 01 d6 STA $d601 
453e : a9 14 __ LDA #$14
4540 : 8d 00 d6 STA $d600 
.l1583:
4543 : 2c 00 d6 BIT $d600 
4546 : 10 fb __ BPL $4543 ; (vdc_set_mode.l1583 + 0)
.s32:
4548 : a5 4e __ LDA T6 + 1 
454a : 8d 01 d6 STA $d601 
454d : a9 15 __ LDA #$15
454f : 8d 00 d6 STA $d600 
.l1585:
4552 : 2c 00 d6 BIT $d600 
4555 : 10 fb __ BPL $4552 ; (vdc_set_mode.l1585 + 0)
.s37:
4557 : a5 4d __ LDA T6 + 0 
4559 : 8d 01 d6 STA $d601 
455c : a6 47 __ LDX T1 + 0 
455e : bd 0e 51 LDA $510e,x ; (vdc_modes + 14)
4561 : 85 45 __ STA T3 + 1 
4563 : a9 1c __ LDA #$1c
4565 : 8d 00 d6 STA $d600 
.l1587:
4568 : 2c 00 d6 BIT $d600 
456b : 10 fb __ BPL $4568 ; (vdc_set_mode.l1587 + 0)
.s44:
456d : ad 01 d6 LDA $d601 
4570 : 29 10 __ AND #$10
4572 : 45 45 __ EOR T3 + 1 
4574 : 29 1f __ AND #$1f
4576 : 45 45 __ EOR T3 + 1 
4578 : aa __ __ TAX
4579 : a9 1c __ LDA #$1c
457b : 8d 00 d6 STA $d600 
.l1589:
457e : 2c 00 d6 BIT $d600 
4581 : 10 fb __ BPL $457e ; (vdc_set_mode.l1589 + 0)
.s50:
4583 : 8e 01 d6 STX $d601 
4586 : a5 4f __ LDA T7 + 0 
4588 : 85 0d __ STA P0 
458a : a5 50 __ LDA T7 + 1 
458c : 85 0e __ STA P1 
458e : 20 0a 13 JSR $130a ; (bnk_redef_charset.s0 + 0)
4591 : 18 __ __ CLC
4592 : a9 13 __ LDA #$13
4594 : 65 47 __ ADC T1 + 0 
4596 : 85 47 __ STA T1 + 0 
4598 : a9 51 __ LDA #$51
459a : 69 00 __ ADC #$00
459c : 85 48 __ STA T1 + 1 
459e : a9 00 __ LDA #$00
45a0 : 85 43 __ STA T0 + 0 
.l52:
45a2 : a4 43 __ LDY T0 + 0 
45a4 : b1 47 __ LDA (T1 + 0),y 
45a6 : 85 1b __ STA ACCU + 0 
45a8 : c8 __ __ INY
45a9 : b1 47 __ LDA (T1 + 0),y 
45ab : aa __ __ TAX
45ac : a5 1b __ LDA ACCU + 0 
45ae : 8d 00 d6 STA $d600 
45b1 : c8 __ __ INY
45b2 : 84 43 __ STY T0 + 0 
.l1591:
45b4 : 2c 00 d6 BIT $d600 
45b7 : 10 fb __ BPL $45b4 ; (vdc_set_mode.l1591 + 0)
.s58:
45b9 : 8e 01 d6 STX $d601 
45bc : 18 __ __ CLC
45bd : a5 49 __ LDA T2 + 0 
45bf : 65 43 __ ADC T0 + 0 
45c1 : 85 44 __ STA T3 + 0 
45c3 : a5 4a __ LDA T2 + 1 
45c5 : 69 00 __ ADC #$00
45c7 : 85 45 __ STA T3 + 1 
45c9 : a0 13 __ LDY #$13
45cb : b1 44 __ LDA (T3 + 0),y 
45cd : c9 ff __ CMP #$ff
45cf : d0 d1 __ BNE $45a2 ; (vdc_set_mode.l52 + 0)
.s53:
45d1 : a0 04 __ LDY #$04
45d3 : b1 49 __ LDA (T2 + 0),y 
45d5 : f0 05 __ BEQ $45dc ; (vdc_set_mode.s60 + 0)
.s62:
45d7 : ad d4 50 LDA $50d4 ; (vdc_state + 1)
45da : f0 0f __ BEQ $45eb ; (vdc_set_mode.s59 + 0)
.s60:
45dc : ad d6 50 LDA $50d6 ; (vdc_state + 3)
45df : 85 47 __ STA T1 + 0 
45e1 : ad d8 50 LDA $50d8 ; (vdc_state + 5)
45e4 : 85 49 __ STA T2 + 0 
45e6 : a2 00 __ LDX #$00
45e8 : 4c fc 47 JMP $47fc ; (vdc_set_mode.l242 + 0)
.s59:
45eb : ad d3 50 LDA $50d3 ; (vdc_state + 0)
45ee : c9 10 __ CMP #$10
45f0 : d0 03 __ BNE $45f5 ; (vdc_set_mode.s67 + 0)
45f2 : 4c 06 47 JMP $4706 ; (vdc_set_mode.s61 + 0)
.s67:
45f5 : ad d4 50 LDA $50d4 ; (vdc_state + 1)
45f8 : f0 03 __ BEQ $45fd ; (vdc_set_mode.s66 + 0)
45fa : 4c 06 47 JMP $4706 ; (vdc_set_mode.s61 + 0)
.s66:
45fd : a9 22 __ LDA #$22
45ff : 8d 00 d6 STA $d600 
.l1623:
4602 : 2c 00 d6 BIT $d600 
4605 : 10 fb __ BPL $4602 ; (vdc_set_mode.l1623 + 0)
.s74:
4607 : a9 80 __ LDA #$80
4609 : 8d 01 d6 STA $d601 
460c : a2 00 __ LDX #$00
460e : a0 ff __ LDY #$ff
.l77:
4610 : a9 12 __ LDA #$12
4612 : 8d 00 d6 STA $d600 
.l1625:
4615 : 2c 00 d6 BIT $d600 
4618 : 10 fb __ BPL $4615 ; (vdc_set_mode.l1625 + 0)
.s86:
461a : 8e 01 d6 STX $d601 
461d : a9 13 __ LDA #$13
461f : 8d 00 d6 STA $d600 
.l1627:
4622 : 2c 00 d6 BIT $d600 
4625 : 10 fb __ BPL $4622 ; (vdc_set_mode.l1627 + 0)
.s91:
4627 : a9 00 __ LDA #$00
4629 : 8d 01 d6 STA $d601 
462c : a9 1f __ LDA #$1f
462e : 8d 00 d6 STA $d600 
.l1629:
4631 : 2c 00 d6 BIT $d600 
4634 : 10 fb __ BPL $4631 ; (vdc_set_mode.l1629 + 0)
.s95:
4636 : a9 00 __ LDA #$00
4638 : 8d 01 d6 STA $d601 
463b : a9 18 __ LDA #$18
463d : 8d 00 d6 STA $d600 
.l1631:
4640 : 2c 00 d6 BIT $d600 
4643 : 10 fb __ BPL $4640 ; (vdc_set_mode.l1631 + 0)
.s101:
4645 : ad 01 d6 LDA $d601 
4648 : 29 7f __ AND #$7f
464a : 85 49 __ STA T2 + 0 
464c : a9 18 __ LDA #$18
464e : 8d 00 d6 STA $d600 
.l1633:
4651 : 2c 00 d6 BIT $d600 
4654 : 10 fb __ BPL $4651 ; (vdc_set_mode.l1633 + 0)
.s107:
4656 : a5 49 __ LDA T2 + 0 
4658 : 8d 01 d6 STA $d601 
465b : a9 1e __ LDA #$1e
465d : 8d 00 d6 STA $d600 
.l1635:
4660 : 2c 00 d6 BIT $d600 
4663 : 10 fb __ BPL $4660 ; (vdc_set_mode.l1635 + 0)
.s112:
4665 : a9 ff __ LDA #$ff
4667 : 8d 01 d6 STA $d601 
466a : e8 __ __ INX
466b : 88 __ __ DEY
466c : d0 a2 __ BNE $4610 ; (vdc_set_mode.l77 + 0)
.s79:
466e : a9 12 __ LDA #$12
4670 : 8d 00 d6 STA $d600 
.l1638:
4673 : 2c 00 d6 BIT $d600 
4676 : 10 fb __ BPL $4673 ; (vdc_set_mode.l1638 + 0)
.s119:
4678 : 8e 01 d6 STX $d601 
467b : a9 13 __ LDA #$13
467d : 8d 00 d6 STA $d600 
.l1640:
4680 : 2c 00 d6 BIT $d600 
4683 : 10 fb __ BPL $4680 ; (vdc_set_mode.l1640 + 0)
.s124:
4685 : 8c 01 d6 STY $d601 
4688 : a9 1f __ LDA #$1f
468a : 8d 00 d6 STA $d600 
.l1642:
468d : 2c 00 d6 BIT $d600 
4690 : 10 fb __ BPL $468d ; (vdc_set_mode.l1642 + 0)
.s128:
4692 : 8c 01 d6 STY $d601 
4695 : a9 18 __ LDA #$18
4697 : 8d 00 d6 STA $d600 
.l1644:
469a : 2c 00 d6 BIT $d600 
469d : 10 fb __ BPL $469a ; (vdc_set_mode.l1644 + 0)
.s134:
469f : ad 01 d6 LDA $d601 
46a2 : 29 7f __ AND #$7f
46a4 : aa __ __ TAX
46a5 : a9 18 __ LDA #$18
46a7 : 8d 00 d6 STA $d600 
.l1646:
46aa : 2c 00 d6 BIT $d600 
46ad : 10 fb __ BPL $46aa ; (vdc_set_mode.l1646 + 0)
.s140:
46af : 8e 01 d6 STX $d601 
46b2 : a9 1e __ LDA #$1e
46b4 : 8d 00 d6 STA $d600 
.l1648:
46b7 : 2c 00 d6 BIT $d600 
46ba : 10 fb __ BPL $46b7 ; (vdc_set_mode.l1648 + 0)
.s145:
46bc : a9 ff __ LDA #$ff
46be : 8d 01 d6 STA $d601 
46c1 : a9 1c __ LDA #$1c
46c3 : 8d 00 d6 STA $d600 
.l1650:
46c6 : 2c 00 d6 BIT $d600 
46c9 : 10 fb __ BPL $46c6 ; (vdc_set_mode.l1650 + 0)
.s151:
46cb : ad 01 d6 LDA $d601 
46ce : 09 10 __ ORA #$10
46d0 : aa __ __ TAX
46d1 : a9 1c __ LDA #$1c
46d3 : 8d 00 d6 STA $d600 
.l1652:
46d6 : 2c 00 d6 BIT $d600 
46d9 : 10 fb __ BPL $46d6 ; (vdc_set_mode.l1652 + 0)
.s157:
46db : 8e 01 d6 STX $d601 
46de : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
46e1 : ad d6 50 LDA $50d6 ; (vdc_state + 3)
46e4 : 85 47 __ STA T1 + 0 
46e6 : ad d8 50 LDA $50d8 ; (vdc_state + 5)
46e9 : 85 49 __ STA T2 + 0 
46eb : a2 00 __ LDX #$00
.l161:
46ed : 8a __ __ TXA
46ee : e4 49 __ CPX T2 + 0 
46f0 : 90 2e __ BCC $4720 ; (vdc_set_mode.s162 + 0)
.s159:
46f2 : a9 22 __ LDA #$22
46f4 : 8d 00 d6 STA $d600 
.l1678:
46f7 : 2c 00 d6 BIT $d600 
46fa : 10 fb __ BPL $46f7 ; (vdc_set_mode.l1678 + 0)
.s239:
46fc : a9 7d __ LDA #$7d
46fe : 8d 01 d6 STA $d601 
4701 : a9 01 __ LDA #$01
4703 : 8d d4 50 STA $50d4 ; (vdc_state + 1)
.s61:
4706 : a9 22 __ LDA #$22
4708 : 8d 00 d6 STA $d600 
.l1620:
470b : 2c 00 d6 BIT $d600 
470e : 10 fb __ BPL $470b ; (vdc_set_mode.l1620 + 0)
.s320:
4710 : a9 7d __ LDA #$7d
4712 : 8d 01 d6 STA $d601 
.s1001:
4715 : ad f9 bf LDA $bff9 ; (buffer + 9)
4718 : 85 53 __ STA T9 + 0 
471a : ad fa bf LDA $bffa ; (buffer + 10)
471d : 85 54 __ STA T9 + 1 
471f : 60 __ __ RTS
.s162:
4720 : 0a __ __ ASL
4721 : a8 __ __ TAY
4722 : b9 01 52 LDA $5201,y ; (multab + 1)
4725 : 85 45 __ STA T3 + 1 
4727 : ad da 50 LDA $50da ; (vdc_state + 7)
472a : 85 46 __ STA T11 + 0 
472c : a9 12 __ LDA #$12
472e : 8d 00 d6 STA $d600 
4731 : a5 47 __ LDA T1 + 0 
4733 : 38 __ __ SEC
4734 : e9 01 __ SBC #$01
4736 : 85 4b __ STA T5 + 0 
4738 : b9 00 52 LDA $5200,y ; (multab + 0)
473b : 85 44 __ STA T3 + 0 
473d : 18 __ __ CLC
473e : 6d db 50 ADC $50db ; (vdc_state + 8)
4741 : a8 __ __ TAY
4742 : a5 45 __ LDA T3 + 1 
4744 : 6d dc 50 ADC $50dc ; (vdc_state + 9)
.l1654:
4747 : 2c 00 d6 BIT $d600 
474a : 10 fb __ BPL $4747 ; (vdc_set_mode.l1654 + 0)
.s174:
474c : 8d 01 d6 STA $d601 
474f : a9 13 __ LDA #$13
4751 : 8d 00 d6 STA $d600 
.l1656:
4754 : 2c 00 d6 BIT $d600 
4757 : 10 fb __ BPL $4754 ; (vdc_set_mode.l1656 + 0)
.s179:
4759 : 8c 01 d6 STY $d601 
475c : a9 1f __ LDA #$1f
475e : 8d 00 d6 STA $d600 
.l1658:
4761 : 2c 00 d6 BIT $d600 
4764 : 10 fb __ BPL $4761 ; (vdc_set_mode.l1658 + 0)
.s183:
4766 : a9 20 __ LDA #$20
4768 : 8d 01 d6 STA $d601 
476b : a9 18 __ LDA #$18
476d : 8d 00 d6 STA $d600 
.l1660:
4770 : 2c 00 d6 BIT $d600 
4773 : 10 fb __ BPL $4770 ; (vdc_set_mode.l1660 + 0)
.s189:
4775 : ad 01 d6 LDA $d601 
4778 : 29 7f __ AND #$7f
477a : a8 __ __ TAY
477b : a9 18 __ LDA #$18
477d : 8d 00 d6 STA $d600 
.l1662:
4780 : 2c 00 d6 BIT $d600 
4783 : 10 fb __ BPL $4780 ; (vdc_set_mode.l1662 + 0)
.s195:
4785 : 8c 01 d6 STY $d601 
4788 : a9 1e __ LDA #$1e
478a : 8d 00 d6 STA $d600 
.l1664:
478d : 2c 00 d6 BIT $d600 
4790 : 10 fb __ BPL $478d ; (vdc_set_mode.l1664 + 0)
.s200:
4792 : a5 4b __ LDA T5 + 0 
4794 : 8d 01 d6 STA $d601 
4797 : ad dd 50 LDA $50dd ; (vdc_state + 10)
479a : 18 __ __ CLC
479b : 65 44 __ ADC T3 + 0 
479d : a8 __ __ TAY
479e : a9 12 __ LDA #$12
47a0 : 8d 00 d6 STA $d600 
47a3 : ad de 50 LDA $50de ; (vdc_state + 11)
47a6 : 65 45 __ ADC T3 + 1 
.l1666:
47a8 : 2c 00 d6 BIT $d600 
47ab : 10 fb __ BPL $47a8 ; (vdc_set_mode.l1666 + 0)
.s207:
47ad : 8d 01 d6 STA $d601 
47b0 : a9 13 __ LDA #$13
47b2 : 8d 00 d6 STA $d600 
.l1668:
47b5 : 2c 00 d6 BIT $d600 
47b8 : 10 fb __ BPL $47b5 ; (vdc_set_mode.l1668 + 0)
.s212:
47ba : 8c 01 d6 STY $d601 
47bd : a9 1f __ LDA #$1f
47bf : 8d 00 d6 STA $d600 
.l1670:
47c2 : 2c 00 d6 BIT $d600 
47c5 : 10 fb __ BPL $47c2 ; (vdc_set_mode.l1670 + 0)
.s216:
47c7 : a5 46 __ LDA T11 + 0 
47c9 : 8d 01 d6 STA $d601 
47cc : a9 18 __ LDA #$18
47ce : 8d 00 d6 STA $d600 
.l1672:
47d1 : 2c 00 d6 BIT $d600 
47d4 : 10 fb __ BPL $47d1 ; (vdc_set_mode.l1672 + 0)
.s222:
47d6 : ad 01 d6 LDA $d601 
47d9 : 29 7f __ AND #$7f
47db : a8 __ __ TAY
47dc : a9 18 __ LDA #$18
47de : 8d 00 d6 STA $d600 
.l1674:
47e1 : 2c 00 d6 BIT $d600 
47e4 : 10 fb __ BPL $47e1 ; (vdc_set_mode.l1674 + 0)
.s228:
47e6 : 8c 01 d6 STY $d601 
47e9 : a9 1e __ LDA #$1e
47eb : 8d 00 d6 STA $d600 
.l1676:
47ee : 2c 00 d6 BIT $d600 
47f1 : 10 fb __ BPL $47ee ; (vdc_set_mode.l1676 + 0)
.s233:
47f3 : a5 4b __ LDA T5 + 0 
47f5 : 8d 01 d6 STA $d601 
47f8 : e8 __ __ INX
47f9 : 4c ed 46 JMP $46ed ; (vdc_set_mode.l161 + 0)
.l242:
47fc : 8a __ __ TXA
47fd : e4 49 __ CPX T2 + 0 
47ff : 90 03 __ BCC $4804 ; (vdc_set_mode.s243 + 0)
4801 : 4c 06 47 JMP $4706 ; (vdc_set_mode.s61 + 0)
.s243:
4804 : 0a __ __ ASL
4805 : a8 __ __ TAY
4806 : b9 01 52 LDA $5201,y ; (multab + 1)
4809 : 85 45 __ STA T3 + 1 
480b : ad da 50 LDA $50da ; (vdc_state + 7)
480e : 85 46 __ STA T11 + 0 
4810 : a9 12 __ LDA #$12
4812 : 8d 00 d6 STA $d600 
4815 : a5 47 __ LDA T1 + 0 
4817 : 38 __ __ SEC
4818 : e9 01 __ SBC #$01
481a : 85 4b __ STA T5 + 0 
481c : b9 00 52 LDA $5200,y ; (multab + 0)
481f : 85 44 __ STA T3 + 0 
4821 : 18 __ __ CLC
4822 : 6d db 50 ADC $50db ; (vdc_state + 8)
4825 : a8 __ __ TAY
4826 : a5 45 __ LDA T3 + 1 
4828 : 6d dc 50 ADC $50dc ; (vdc_state + 9)
.l1596:
482b : 2c 00 d6 BIT $d600 
482e : 10 fb __ BPL $482b ; (vdc_set_mode.l1596 + 0)
.s255:
4830 : 8d 01 d6 STA $d601 
4833 : a9 13 __ LDA #$13
4835 : 8d 00 d6 STA $d600 
.l1598:
4838 : 2c 00 d6 BIT $d600 
483b : 10 fb __ BPL $4838 ; (vdc_set_mode.l1598 + 0)
.s260:
483d : 8c 01 d6 STY $d601 
4840 : a9 1f __ LDA #$1f
4842 : 8d 00 d6 STA $d600 
.l1600:
4845 : 2c 00 d6 BIT $d600 
4848 : 10 fb __ BPL $4845 ; (vdc_set_mode.l1600 + 0)
.s264:
484a : a9 20 __ LDA #$20
484c : 8d 01 d6 STA $d601 
484f : a9 18 __ LDA #$18
4851 : 8d 00 d6 STA $d600 
.l1602:
4854 : 2c 00 d6 BIT $d600 
4857 : 10 fb __ BPL $4854 ; (vdc_set_mode.l1602 + 0)
.s270:
4859 : ad 01 d6 LDA $d601 
485c : 29 7f __ AND #$7f
485e : a8 __ __ TAY
485f : a9 18 __ LDA #$18
4861 : 8d 00 d6 STA $d600 
.l1604:
4864 : 2c 00 d6 BIT $d600 
4867 : 10 fb __ BPL $4864 ; (vdc_set_mode.l1604 + 0)
.s276:
4869 : 8c 01 d6 STY $d601 
486c : a9 1e __ LDA #$1e
486e : 8d 00 d6 STA $d600 
.l1606:
4871 : 2c 00 d6 BIT $d600 
4874 : 10 fb __ BPL $4871 ; (vdc_set_mode.l1606 + 0)
.s281:
4876 : a5 4b __ LDA T5 + 0 
4878 : 8d 01 d6 STA $d601 
487b : ad dd 50 LDA $50dd ; (vdc_state + 10)
487e : 18 __ __ CLC
487f : 65 44 __ ADC T3 + 0 
4881 : a8 __ __ TAY
4882 : a9 12 __ LDA #$12
4884 : 8d 00 d6 STA $d600 
4887 : ad de 50 LDA $50de ; (vdc_state + 11)
488a : 65 45 __ ADC T3 + 1 
.l1608:
488c : 2c 00 d6 BIT $d600 
488f : 10 fb __ BPL $488c ; (vdc_set_mode.l1608 + 0)
.s288:
4891 : 8d 01 d6 STA $d601 
4894 : a9 13 __ LDA #$13
4896 : 8d 00 d6 STA $d600 
.l1610:
4899 : 2c 00 d6 BIT $d600 
489c : 10 fb __ BPL $4899 ; (vdc_set_mode.l1610 + 0)
.s293:
489e : 8c 01 d6 STY $d601 
48a1 : a9 1f __ LDA #$1f
48a3 : 8d 00 d6 STA $d600 
.l1612:
48a6 : 2c 00 d6 BIT $d600 
48a9 : 10 fb __ BPL $48a6 ; (vdc_set_mode.l1612 + 0)
.s297:
48ab : a5 46 __ LDA T11 + 0 
48ad : 8d 01 d6 STA $d601 
48b0 : a9 18 __ LDA #$18
48b2 : 8d 00 d6 STA $d600 
.l1614:
48b5 : 2c 00 d6 BIT $d600 
48b8 : 10 fb __ BPL $48b5 ; (vdc_set_mode.l1614 + 0)
.s303:
48ba : ad 01 d6 LDA $d601 
48bd : 29 7f __ AND #$7f
48bf : a8 __ __ TAY
48c0 : a9 18 __ LDA #$18
48c2 : 8d 00 d6 STA $d600 
.l1616:
48c5 : 2c 00 d6 BIT $d600 
48c8 : 10 fb __ BPL $48c5 ; (vdc_set_mode.l1616 + 0)
.s309:
48ca : 8c 01 d6 STY $d601 
48cd : a9 1e __ LDA #$1e
48cf : 8d 00 d6 STA $d600 
.l1618:
48d2 : 2c 00 d6 BIT $d600 
48d5 : 10 fb __ BPL $48d2 ; (vdc_set_mode.l1618 + 0)
.s314:
48d7 : a5 4b __ LDA T5 + 0 
48d9 : 8d 01 d6 STA $d601 
48dc : e8 __ __ INX
48dd : 4c fc 47 JMP $47fc ; (vdc_set_mode.l242 + 0)
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
48e0 : a9 b6 __ LDA #$b6
48e2 : 85 0e __ STA P1 
48e4 : a9 4d __ LDA #$4d
48e6 : 85 0f __ STA P2 
--------------------------------------------------------------------
vdc_prints: ; vdc_prints(u8,u8,const u8*)->void
.s0:
48e8 : a5 0d __ LDA P0 ; (y + 0)
48ea : 0a __ __ ASL
48eb : aa __ __ TAX
48ec : bd 00 52 LDA $5200,x ; (multab + 0)
48ef : 85 43 __ STA T2 + 0 
48f1 : bd 01 52 LDA $5201,x ; (multab + 1)
48f4 : 85 44 __ STA T2 + 1 
48f6 : a0 00 __ LDY #$00
48f8 : 84 1b __ STY ACCU + 0 
48fa : b1 0e __ LDA (P1),y ; (string + 0)
48fc : f0 16 __ BEQ $4914 ; (vdc_prints.s6 + 0)
.s5:
48fe : a5 0e __ LDA P1 ; (string + 0)
4900 : 85 1b __ STA ACCU + 0 
4902 : a2 00 __ LDX #$00
.l1046:
4904 : c8 __ __ INY
4905 : d0 01 __ BNE $4908 ; (vdc_prints.s1051 + 0)
.s1050:
4907 : e8 __ __ INX
.s1051:
4908 : 8a __ __ TXA
4909 : 18 __ __ CLC
490a : 65 0f __ ADC P2 ; (string + 1)
490c : 85 1c __ STA ACCU + 1 
490e : b1 1b __ LDA (ACCU + 0),y 
4910 : d0 f2 __ BNE $4904 ; (vdc_prints.l1046 + 0)
.s1047:
4912 : 84 1b __ STY ACCU + 0 
.s6:
4914 : ad db 50 LDA $50db ; (vdc_state + 8)
4917 : 18 __ __ CLC
4918 : 65 43 __ ADC T2 + 0 
491a : aa __ __ TAX
491b : a9 12 __ LDA #$12
491d : 8d 00 d6 STA $d600 
4920 : ad dc 50 LDA $50dc ; (vdc_state + 9)
4923 : 65 44 __ ADC T2 + 1 
.l354:
4925 : 2c 00 d6 BIT $d600 
4928 : 10 fb __ BPL $4925 ; (vdc_prints.l354 + 0)
.s13:
492a : 8d 01 d6 STA $d601 
492d : a9 13 __ LDA #$13
492f : 8d 00 d6 STA $d600 
.l356:
4932 : 2c 00 d6 BIT $d600 
4935 : 10 fb __ BPL $4932 ; (vdc_prints.l356 + 0)
.s18:
4937 : 8e 01 d6 STX $d601 
493a : a9 1f __ LDA #$1f
493c : 8d 00 d6 STA $d600 
493f : a5 1b __ LDA ACCU + 0 
4941 : f0 61 __ BEQ $49a4 ; (vdc_prints.s23 + 0)
.s95:
4943 : a0 00 __ LDY #$00
.l21:
4945 : b1 0e __ LDA (P1),y ; (string + 0)
4947 : c9 20 __ CMP #$20
4949 : b0 05 __ BCS $4950 ; (vdc_prints.s27 + 0)
.s26:
494b : 69 80 __ ADC #$80
494d : 4c 96 49 JMP $4996 ; (vdc_prints.s1048 + 0)
.s27:
4950 : aa __ __ TAX
4951 : c9 40 __ CMP #$40
4953 : 90 04 __ BCC $4959 ; (vdc_prints.s30 + 0)
.s32:
4955 : c9 60 __ CMP #$60
4957 : 90 23 __ BCC $497c ; (vdc_prints.s29 + 0)
.s30:
4959 : c9 60 __ CMP #$60
495b : 90 0a __ BCC $4967 ; (vdc_prints.s34 + 0)
.s36:
495d : 09 00 __ ORA #$00
495f : 30 06 __ BMI $4967 ; (vdc_prints.s34 + 0)
.s33:
4961 : 38 __ __ SEC
4962 : e9 20 __ SBC #$20
4964 : 4c 96 49 JMP $4996 ; (vdc_prints.s1048 + 0)
.s34:
4967 : c9 80 __ CMP #$80
4969 : 90 09 __ BCC $4974 ; (vdc_prints.s38 + 0)
.s40:
496b : c9 a0 __ CMP #$a0
496d : b0 05 __ BCS $4974 ; (vdc_prints.s38 + 0)
.s37:
496f : 69 40 __ ADC #$40
4971 : 4c 96 49 JMP $4996 ; (vdc_prints.s1048 + 0)
.s38:
4974 : c9 a0 __ CMP #$a0
4976 : 90 0a __ BCC $4982 ; (vdc_prints.s42 + 0)
.s44:
4978 : c9 c0 __ CMP #$c0
497a : b0 06 __ BCS $4982 ; (vdc_prints.s42 + 0)
.s29:
497c : 38 __ __ SEC
497d : e9 40 __ SBC #$40
497f : 4c 96 49 JMP $4996 ; (vdc_prints.s1048 + 0)
.s42:
4982 : c9 c0 __ CMP #$c0
4984 : 90 0a __ BCC $4990 ; (vdc_prints.s46 + 0)
.s48:
4986 : c9 ff __ CMP #$ff
4988 : b0 06 __ BCS $4990 ; (vdc_prints.s46 + 0)
.s45:
498a : 38 __ __ SEC
498b : e9 80 __ SBC #$80
498d : 4c 96 49 JMP $4996 ; (vdc_prints.s1048 + 0)
.s46:
4990 : c9 ff __ CMP #$ff
4992 : d0 03 __ BNE $4997 ; (vdc_prints.l360 + 0)
.s49:
4994 : a9 5e __ LDA #$5e
.s1048:
4996 : aa __ __ TAX
.l360:
4997 : 2c 00 d6 BIT $d600 
499a : 10 fb __ BPL $4997 ; (vdc_prints.l360 + 0)
.s54:
499c : 8e 01 d6 STX $d601 
499f : c8 __ __ INY
49a0 : c4 1b __ CPY ACCU + 0 
49a2 : 90 a1 __ BCC $4945 ; (vdc_prints.l21 + 0)
.s23:
49a4 : a9 12 __ LDA #$12
49a6 : 8d 00 d6 STA $d600 
49a9 : c6 1b __ DEC ACCU + 0 
49ab : ad dd 50 LDA $50dd ; (vdc_state + 10)
49ae : 18 __ __ CLC
49af : 65 43 __ ADC T2 + 0 
49b1 : a8 __ __ TAY
49b2 : ad de 50 LDA $50de ; (vdc_state + 11)
49b5 : 65 44 __ ADC T2 + 1 
49b7 : ae da 50 LDX $50da ; (vdc_state + 7)
.l363:
49ba : 2c 00 d6 BIT $d600 
49bd : 10 fb __ BPL $49ba ; (vdc_prints.l363 + 0)
.s61:
49bf : 8d 01 d6 STA $d601 
49c2 : a9 13 __ LDA #$13
49c4 : 8d 00 d6 STA $d600 
.l365:
49c7 : 2c 00 d6 BIT $d600 
49ca : 10 fb __ BPL $49c7 ; (vdc_prints.l365 + 0)
.s66:
49cc : 8c 01 d6 STY $d601 
49cf : a9 1f __ LDA #$1f
49d1 : 8d 00 d6 STA $d600 
.l367:
49d4 : 2c 00 d6 BIT $d600 
49d7 : 10 fb __ BPL $49d4 ; (vdc_prints.l367 + 0)
.s70:
49d9 : 8e 01 d6 STX $d601 
49dc : a9 18 __ LDA #$18
49de : 8d 00 d6 STA $d600 
.l369:
49e1 : 2c 00 d6 BIT $d600 
49e4 : 10 fb __ BPL $49e1 ; (vdc_prints.l369 + 0)
.s76:
49e6 : ad 01 d6 LDA $d601 
49e9 : 29 7f __ AND #$7f
49eb : aa __ __ TAX
49ec : a9 18 __ LDA #$18
49ee : 8d 00 d6 STA $d600 
.l371:
49f1 : 2c 00 d6 BIT $d600 
49f4 : 10 fb __ BPL $49f1 ; (vdc_prints.l371 + 0)
.s82:
49f6 : 8e 01 d6 STX $d601 
49f9 : a9 1e __ LDA #$1e
49fb : 8d 00 d6 STA $d600 
.l373:
49fe : 2c 00 d6 BIT $d600 
4a01 : 10 fb __ BPL $49fe ; (vdc_prints.l373 + 0)
.s87:
4a03 : a5 1b __ LDA ACCU + 0 
4a05 : 8d 01 d6 STA $d601 
.s1001:
4a08 : 60 __ __ RTS
--------------------------------------------------------------------
4a09 : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 6f 53 43 41 52 36 34 : sTARTING oSCAR64
4a19 : __ __ __ BYT 20 76 64 63 20 44 45 4d 4f 2e 00                :  vdc DEMO..
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
4a24 : a2 03 __ LDX #$03
4a26 : b5 53 __ LDA T8 + 0,x 
4a28 : 9d e4 bf STA $bfe4,x ; (buff + 38)
4a2b : ca __ __ DEX
4a2c : 10 f8 __ BPL $4a26 ; (sprintf.s1000 + 2)
.s0:
4a2e : 18 __ __ CLC
4a2f : a5 23 __ LDA SP + 0 
4a31 : 69 06 __ ADC #$06
4a33 : 85 47 __ STA T0 + 0 
4a35 : a5 24 __ LDA SP + 1 
4a37 : 69 00 __ ADC #$00
4a39 : 85 48 __ STA T0 + 1 
4a3b : a9 00 __ LDA #$00
4a3d : 85 43 __ STA T1 + 0 
4a3f : a0 04 __ LDY #$04
4a41 : b1 23 __ LDA (SP + 0),y 
4a43 : 85 49 __ STA T2 + 0 
4a45 : c8 __ __ INY
4a46 : b1 23 __ LDA (SP + 0),y 
4a48 : 85 4a __ STA T2 + 1 
4a4a : a0 02 __ LDY #$02
4a4c : b1 23 __ LDA (SP + 0),y 
4a4e : 85 4b __ STA T3 + 0 
4a50 : c8 __ __ INY
4a51 : b1 23 __ LDA (SP + 0),y 
4a53 : 85 4c __ STA T3 + 1 
.l2:
4a55 : a0 00 __ LDY #$00
4a57 : b1 49 __ LDA (T2 + 0),y 
4a59 : d0 0f __ BNE $4a6a ; (sprintf.s3 + 0)
.s4:
4a5b : a4 43 __ LDY T1 + 0 
4a5d : 91 4b __ STA (T3 + 0),y 
.s1001:
4a5f : a2 03 __ LDX #$03
4a61 : bd e4 bf LDA $bfe4,x ; (buff + 38)
4a64 : 95 53 __ STA T8 + 0,x 
4a66 : ca __ __ DEX
4a67 : 10 f8 __ BPL $4a61 ; (sprintf.s1001 + 2)
4a69 : 60 __ __ RTS
.s3:
4a6a : c9 25 __ CMP #$25
4a6c : f0 22 __ BEQ $4a90 ; (sprintf.s5 + 0)
.s6:
4a6e : a4 43 __ LDY T1 + 0 
4a70 : 91 4b __ STA (T3 + 0),y 
4a72 : e6 49 __ INC T2 + 0 
4a74 : d0 02 __ BNE $4a78 ; (sprintf.s1102 + 0)
.s1101:
4a76 : e6 4a __ INC T2 + 1 
.s1102:
4a78 : c8 __ __ INY
4a79 : 84 43 __ STY T1 + 0 
4a7b : 98 __ __ TYA
4a7c : c0 28 __ CPY #$28
4a7e : 90 d5 __ BCC $4a55 ; (sprintf.l2 + 0)
.s111:
4a80 : 18 __ __ CLC
4a81 : 65 4b __ ADC T3 + 0 
4a83 : 85 4b __ STA T3 + 0 
4a85 : 90 02 __ BCC $4a89 ; (sprintf.s1104 + 0)
.s1103:
4a87 : e6 4c __ INC T3 + 1 
.s1104:
4a89 : a9 00 __ LDA #$00
.s1068:
4a8b : 85 43 __ STA T1 + 0 
4a8d : 4c 55 4a JMP $4a55 ; (sprintf.l2 + 0)
.s5:
4a90 : 8c ec bf STY $bfec ; (buff + 46)
4a93 : 8c ed bf STY $bfed ; (buff + 47)
4a96 : 8c ee bf STY $bfee ; (buff + 48)
4a99 : 8c ef bf STY $bfef ; (buff + 49)
4a9c : a9 0a __ LDA #$0a
4a9e : 8d eb bf STA $bfeb ; (buff + 45)
4aa1 : a5 43 __ LDA T1 + 0 
4aa3 : f0 0b __ BEQ $4ab0 ; (sprintf.s10 + 0)
.s8:
4aa5 : 18 __ __ CLC
4aa6 : 65 4b __ ADC T3 + 0 
4aa8 : 85 4b __ STA T3 + 0 
4aaa : 90 02 __ BCC $4aae ; (sprintf.s1080 + 0)
.s1079:
4aac : e6 4c __ INC T3 + 1 
.s1080:
4aae : 84 43 __ STY T1 + 0 
.s10:
4ab0 : a0 01 __ LDY #$01
4ab2 : b1 49 __ LDA (T2 + 0),y 
4ab4 : aa __ __ TAX
4ab5 : a9 20 __ LDA #$20
4ab7 : 8d e8 bf STA $bfe8 ; (buff + 42)
4aba : a9 00 __ LDA #$00
4abc : 8d e9 bf STA $bfe9 ; (buff + 43)
4abf : a9 ff __ LDA #$ff
4ac1 : 8d ea bf STA $bfea ; (buff + 44)
4ac4 : 18 __ __ CLC
4ac5 : a5 49 __ LDA T2 + 0 
4ac7 : 69 02 __ ADC #$02
.l15:
4ac9 : 85 49 __ STA T2 + 0 
4acb : 90 02 __ BCC $4acf ; (sprintf.s1082 + 0)
.s1081:
4acd : e6 4a __ INC T2 + 1 
.s1082:
4acf : 8a __ __ TXA
4ad0 : e0 2b __ CPX #$2b
4ad2 : d0 08 __ BNE $4adc ; (sprintf.s18 + 0)
.s17:
4ad4 : a9 01 __ LDA #$01
4ad6 : 8d ed bf STA $bfed ; (buff + 47)
4ad9 : 4c 3d 4d JMP $4d3d ; (sprintf.s260 + 0)
.s18:
4adc : c9 30 __ CMP #$30
4ade : d0 06 __ BNE $4ae6 ; (sprintf.s21 + 0)
.s20:
4ae0 : 8d e8 bf STA $bfe8 ; (buff + 42)
4ae3 : 4c 3d 4d JMP $4d3d ; (sprintf.s260 + 0)
.s21:
4ae6 : e0 23 __ CPX #$23
4ae8 : d0 08 __ BNE $4af2 ; (sprintf.s24 + 0)
.s23:
4aea : a9 01 __ LDA #$01
4aec : 8d ef bf STA $bfef ; (buff + 49)
4aef : 4c 3d 4d JMP $4d3d ; (sprintf.s260 + 0)
.s24:
4af2 : e0 2d __ CPX #$2d
4af4 : d0 08 __ BNE $4afe ; (sprintf.s16 + 0)
.s26:
4af6 : a9 01 __ LDA #$01
4af8 : 8d ee bf STA $bfee ; (buff + 48)
4afb : 4c 3d 4d JMP $4d3d ; (sprintf.s260 + 0)
.s16:
4afe : 85 45 __ STA T4 + 0 
4b00 : e0 30 __ CPX #$30
4b02 : 90 53 __ BCC $4b57 ; (sprintf.s32 + 0)
.s33:
4b04 : e0 3a __ CPX #$3a
4b06 : b0 4f __ BCS $4b57 ; (sprintf.s32 + 0)
.s30:
4b08 : a9 00 __ LDA #$00
4b0a : 85 4d __ STA T6 + 0 
4b0c : 85 4e __ STA T6 + 1 
4b0e : e0 3a __ CPX #$3a
4b10 : b0 40 __ BCS $4b52 ; (sprintf.s36 + 0)
.l35:
4b12 : a5 4d __ LDA T6 + 0 
4b14 : 0a __ __ ASL
4b15 : 85 1b __ STA ACCU + 0 
4b17 : a5 4e __ LDA T6 + 1 
4b19 : 2a __ __ ROL
4b1a : 06 1b __ ASL ACCU + 0 
4b1c : 2a __ __ ROL
4b1d : aa __ __ TAX
4b1e : 18 __ __ CLC
4b1f : a5 1b __ LDA ACCU + 0 
4b21 : 65 4d __ ADC T6 + 0 
4b23 : 85 4d __ STA T6 + 0 
4b25 : 8a __ __ TXA
4b26 : 65 4e __ ADC T6 + 1 
4b28 : 06 4d __ ASL T6 + 0 
4b2a : 2a __ __ ROL
4b2b : aa __ __ TAX
4b2c : 18 __ __ CLC
4b2d : a5 4d __ LDA T6 + 0 
4b2f : 65 45 __ ADC T4 + 0 
4b31 : 90 01 __ BCC $4b34 ; (sprintf.s1098 + 0)
.s1097:
4b33 : e8 __ __ INX
.s1098:
4b34 : 38 __ __ SEC
4b35 : e9 30 __ SBC #$30
4b37 : 85 4d __ STA T6 + 0 
4b39 : 8a __ __ TXA
4b3a : e9 00 __ SBC #$00
4b3c : 85 4e __ STA T6 + 1 
4b3e : a0 00 __ LDY #$00
4b40 : b1 49 __ LDA (T2 + 0),y 
4b42 : 85 45 __ STA T4 + 0 
4b44 : e6 49 __ INC T2 + 0 
4b46 : d0 02 __ BNE $4b4a ; (sprintf.s1100 + 0)
.s1099:
4b48 : e6 4a __ INC T2 + 1 
.s1100:
4b4a : c9 30 __ CMP #$30
4b4c : 90 04 __ BCC $4b52 ; (sprintf.s36 + 0)
.s37:
4b4e : c9 3a __ CMP #$3a
4b50 : 90 c0 __ BCC $4b12 ; (sprintf.l35 + 0)
.s36:
4b52 : a5 4d __ LDA T6 + 0 
4b54 : 8d e9 bf STA $bfe9 ; (buff + 43)
.s32:
4b57 : a5 45 __ LDA T4 + 0 
4b59 : c9 2e __ CMP #$2e
4b5b : d0 51 __ BNE $4bae ; (sprintf.s40 + 0)
.s38:
4b5d : a9 00 __ LDA #$00
4b5f : 85 4d __ STA T6 + 0 
.l245:
4b61 : 85 4e __ STA T6 + 1 
4b63 : a0 00 __ LDY #$00
4b65 : b1 49 __ LDA (T2 + 0),y 
4b67 : 85 45 __ STA T4 + 0 
4b69 : e6 49 __ INC T2 + 0 
4b6b : d0 02 __ BNE $4b6f ; (sprintf.s1084 + 0)
.s1083:
4b6d : e6 4a __ INC T2 + 1 
.s1084:
4b6f : c9 30 __ CMP #$30
4b71 : 90 04 __ BCC $4b77 ; (sprintf.s43 + 0)
.s44:
4b73 : c9 3a __ CMP #$3a
4b75 : 90 0a __ BCC $4b81 ; (sprintf.s42 + 0)
.s43:
4b77 : a5 4d __ LDA T6 + 0 
4b79 : 8d ea bf STA $bfea ; (buff + 44)
4b7c : a5 45 __ LDA T4 + 0 
4b7e : 4c ae 4b JMP $4bae ; (sprintf.s40 + 0)
.s42:
4b81 : a5 4d __ LDA T6 + 0 
4b83 : 0a __ __ ASL
4b84 : 85 1b __ STA ACCU + 0 
4b86 : a5 4e __ LDA T6 + 1 
4b88 : 2a __ __ ROL
4b89 : 06 1b __ ASL ACCU + 0 
4b8b : 2a __ __ ROL
4b8c : aa __ __ TAX
4b8d : 18 __ __ CLC
4b8e : a5 1b __ LDA ACCU + 0 
4b90 : 65 4d __ ADC T6 + 0 
4b92 : 85 4d __ STA T6 + 0 
4b94 : 8a __ __ TXA
4b95 : 65 4e __ ADC T6 + 1 
4b97 : 06 4d __ ASL T6 + 0 
4b99 : 2a __ __ ROL
4b9a : aa __ __ TAX
4b9b : 18 __ __ CLC
4b9c : a5 4d __ LDA T6 + 0 
4b9e : 65 45 __ ADC T4 + 0 
4ba0 : 90 01 __ BCC $4ba3 ; (sprintf.s1096 + 0)
.s1095:
4ba2 : e8 __ __ INX
.s1096:
4ba3 : 38 __ __ SEC
4ba4 : e9 30 __ SBC #$30
4ba6 : 85 4d __ STA T6 + 0 
4ba8 : 8a __ __ TXA
4ba9 : e9 00 __ SBC #$00
4bab : 4c 61 4b JMP $4b61 ; (sprintf.l245 + 0)
.s40:
4bae : c9 64 __ CMP #$64
4bb0 : f0 04 __ BEQ $4bb6 ; (sprintf.s45 + 0)
.s48:
4bb2 : c9 44 __ CMP #$44
4bb4 : d0 05 __ BNE $4bbb ; (sprintf.s46 + 0)
.s45:
4bb6 : a9 01 __ LDA #$01
4bb8 : 4c 16 4d JMP $4d16 ; (sprintf.s261 + 0)
.s46:
4bbb : c9 75 __ CMP #$75
4bbd : d0 03 __ BNE $4bc2 ; (sprintf.s52 + 0)
4bbf : 4c 14 4d JMP $4d14 ; (sprintf.s285 + 0)
.s52:
4bc2 : c9 55 __ CMP #$55
4bc4 : d0 03 __ BNE $4bc9 ; (sprintf.s50 + 0)
4bc6 : 4c 14 4d JMP $4d14 ; (sprintf.s285 + 0)
.s50:
4bc9 : c9 78 __ CMP #$78
4bcb : f0 04 __ BEQ $4bd1 ; (sprintf.s53 + 0)
.s56:
4bcd : c9 58 __ CMP #$58
4bcf : d0 0d __ BNE $4bde ; (sprintf.s54 + 0)
.s53:
4bd1 : a9 10 __ LDA #$10
4bd3 : 8d eb bf STA $bfeb ; (buff + 45)
4bd6 : a9 00 __ LDA #$00
4bd8 : 8d ec bf STA $bfec ; (buff + 46)
4bdb : 4c 14 4d JMP $4d14 ; (sprintf.s285 + 0)
.s54:
4bde : c9 6c __ CMP #$6c
4be0 : d0 03 __ BNE $4be5 ; (sprintf.s60 + 0)
4be2 : 4c a6 4c JMP $4ca6 ; (sprintf.s57 + 0)
.s60:
4be5 : c9 4c __ CMP #$4c
4be7 : d0 03 __ BNE $4bec ; (sprintf.s58 + 0)
4be9 : 4c a6 4c JMP $4ca6 ; (sprintf.s57 + 0)
.s58:
4bec : c9 73 __ CMP #$73
4bee : f0 37 __ BEQ $4c27 ; (sprintf.s73 + 0)
.s76:
4bf0 : c9 53 __ CMP #$53
4bf2 : f0 33 __ BEQ $4c27 ; (sprintf.s73 + 0)
.s74:
4bf4 : c9 63 __ CMP #$63
4bf6 : f0 14 __ BEQ $4c0c ; (sprintf.s104 + 0)
.s107:
4bf8 : c9 43 __ CMP #$43
4bfa : f0 10 __ BEQ $4c0c ; (sprintf.s104 + 0)
.s105:
4bfc : 09 00 __ ORA #$00
4bfe : d0 03 __ BNE $4c03 ; (sprintf.s108 + 0)
4c00 : 4c 55 4a JMP $4a55 ; (sprintf.l2 + 0)
.s108:
4c03 : a4 43 __ LDY T1 + 0 
4c05 : 91 4b __ STA (T3 + 0),y 
4c07 : e6 43 __ INC T1 + 0 
4c09 : 4c 55 4a JMP $4a55 ; (sprintf.l2 + 0)
.s104:
4c0c : a0 00 __ LDY #$00
4c0e : b1 47 __ LDA (T0 + 0),y 
4c10 : a4 43 __ LDY T1 + 0 
4c12 : 91 4b __ STA (T3 + 0),y 
4c14 : e6 43 __ INC T1 + 0 
.s258:
4c16 : 18 __ __ CLC
4c17 : a5 47 __ LDA T0 + 0 
4c19 : 69 02 __ ADC #$02
4c1b : 85 47 __ STA T0 + 0 
4c1d : b0 03 __ BCS $4c22 ; (sprintf.s1085 + 0)
4c1f : 4c 55 4a JMP $4a55 ; (sprintf.l2 + 0)
.s1085:
4c22 : e6 48 __ INC T0 + 1 
4c24 : 4c 55 4a JMP $4a55 ; (sprintf.l2 + 0)
.s73:
4c27 : a0 00 __ LDY #$00
4c29 : 84 45 __ STY T4 + 0 
4c2b : b1 47 __ LDA (T0 + 0),y 
4c2d : 85 4d __ STA T6 + 0 
4c2f : c8 __ __ INY
4c30 : b1 47 __ LDA (T0 + 0),y 
4c32 : 85 4e __ STA T6 + 1 
4c34 : 18 __ __ CLC
4c35 : a5 47 __ LDA T0 + 0 
4c37 : 69 02 __ ADC #$02
4c39 : 85 47 __ STA T0 + 0 
4c3b : 90 02 __ BCC $4c3f ; (sprintf.s1092 + 0)
.s1091:
4c3d : e6 48 __ INC T0 + 1 
.s1092:
4c3f : ad e9 bf LDA $bfe9 ; (buff + 43)
4c42 : f0 0d __ BEQ $4c51 ; (sprintf.s79 + 0)
.s1071:
4c44 : a0 00 __ LDY #$00
4c46 : b1 4d __ LDA (T6 + 0),y 
4c48 : f0 05 __ BEQ $4c4f ; (sprintf.s1072 + 0)
.l81:
4c4a : c8 __ __ INY
4c4b : b1 4d __ LDA (T6 + 0),y 
4c4d : d0 fb __ BNE $4c4a ; (sprintf.l81 + 0)
.s1072:
4c4f : 84 45 __ STY T4 + 0 
.s79:
4c51 : ad ee bf LDA $bfee ; (buff + 48)
4c54 : d0 19 __ BNE $4c6f ; (sprintf.l95 + 0)
.s1075:
4c56 : a6 45 __ LDX T4 + 0 
4c58 : ec e9 bf CPX $bfe9 ; (buff + 43)
4c5b : a4 43 __ LDY T1 + 0 
4c5d : b0 0c __ BCS $4c6b ; (sprintf.s1076 + 0)
.l87:
4c5f : ad e8 bf LDA $bfe8 ; (buff + 42)
4c62 : 91 4b __ STA (T3 + 0),y 
4c64 : e8 __ __ INX
4c65 : ec e9 bf CPX $bfe9 ; (buff + 43)
4c68 : c8 __ __ INY
4c69 : 90 f4 __ BCC $4c5f ; (sprintf.l87 + 0)
.s1076:
4c6b : 86 45 __ STX T4 + 0 
4c6d : 84 43 __ STY T1 + 0 
.l95:
4c6f : a0 00 __ LDY #$00
4c71 : b1 4d __ LDA (T6 + 0),y 
4c73 : f0 0f __ BEQ $4c84 ; (sprintf.s91 + 0)
.s96:
4c75 : a4 43 __ LDY T1 + 0 
4c77 : 91 4b __ STA (T3 + 0),y 
4c79 : e6 43 __ INC T1 + 0 
4c7b : e6 4d __ INC T6 + 0 
4c7d : d0 f0 __ BNE $4c6f ; (sprintf.l95 + 0)
.s1093:
4c7f : e6 4e __ INC T6 + 1 
4c81 : 4c 6f 4c JMP $4c6f ; (sprintf.l95 + 0)
.s91:
4c84 : ad ee bf LDA $bfee ; (buff + 48)
4c87 : d0 03 __ BNE $4c8c ; (sprintf.s1073 + 0)
4c89 : 4c 55 4a JMP $4a55 ; (sprintf.l2 + 0)
.s1073:
4c8c : a6 45 __ LDX T4 + 0 
4c8e : ec e9 bf CPX $bfe9 ; (buff + 43)
4c91 : a4 43 __ LDY T1 + 0 
4c93 : b0 0c __ BCS $4ca1 ; (sprintf.s1074 + 0)
.l102:
4c95 : ad e8 bf LDA $bfe8 ; (buff + 42)
4c98 : 91 4b __ STA (T3 + 0),y 
4c9a : e8 __ __ INX
4c9b : ec e9 bf CPX $bfe9 ; (buff + 43)
4c9e : c8 __ __ INY
4c9f : 90 f4 __ BCC $4c95 ; (sprintf.l102 + 0)
.s1074:
4ca1 : 84 43 __ STY T1 + 0 
4ca3 : 4c 55 4a JMP $4a55 ; (sprintf.l2 + 0)
.s57:
4ca6 : a0 00 __ LDY #$00
4ca8 : b1 47 __ LDA (T0 + 0),y 
4caa : 85 53 __ STA T8 + 0 
4cac : c8 __ __ INY
4cad : b1 47 __ LDA (T0 + 0),y 
4caf : 85 54 __ STA T8 + 1 
4cb1 : c8 __ __ INY
4cb2 : b1 47 __ LDA (T0 + 0),y 
4cb4 : 85 55 __ STA T8 + 2 
4cb6 : c8 __ __ INY
4cb7 : b1 47 __ LDA (T0 + 0),y 
4cb9 : 85 56 __ STA T8 + 3 
4cbb : 18 __ __ CLC
4cbc : a5 47 __ LDA T0 + 0 
4cbe : 69 04 __ ADC #$04
4cc0 : 85 47 __ STA T0 + 0 
4cc2 : 90 02 __ BCC $4cc6 ; (sprintf.s1088 + 0)
.s1087:
4cc4 : e6 48 __ INC T0 + 1 
.s1088:
4cc6 : a0 00 __ LDY #$00
4cc8 : b1 49 __ LDA (T2 + 0),y 
4cca : aa __ __ TAX
4ccb : e6 49 __ INC T2 + 0 
4ccd : d0 02 __ BNE $4cd1 ; (sprintf.s1090 + 0)
.s1089:
4ccf : e6 4a __ INC T2 + 1 
.s1090:
4cd1 : 8a __ __ TXA
4cd2 : e0 64 __ CPX #$64
4cd4 : f0 04 __ BEQ $4cda ; (sprintf.s61 + 0)
.s64:
4cd6 : c9 44 __ CMP #$44
4cd8 : d0 04 __ BNE $4cde ; (sprintf.s62 + 0)
.s61:
4cda : a9 01 __ LDA #$01
4cdc : d0 1c __ BNE $4cfa ; (sprintf.s259 + 0)
.s62:
4cde : c9 75 __ CMP #$75
4ce0 : f0 17 __ BEQ $4cf9 ; (sprintf.s284 + 0)
.s68:
4ce2 : c9 55 __ CMP #$55
4ce4 : f0 13 __ BEQ $4cf9 ; (sprintf.s284 + 0)
.s66:
4ce6 : c9 78 __ CMP #$78
4ce8 : f0 07 __ BEQ $4cf1 ; (sprintf.s69 + 0)
.s72:
4cea : c9 58 __ CMP #$58
4cec : f0 03 __ BEQ $4cf1 ; (sprintf.s69 + 0)
4cee : 4c 55 4a JMP $4a55 ; (sprintf.l2 + 0)
.s69:
4cf1 : 8c ec bf STY $bfec ; (buff + 46)
4cf4 : a9 10 __ LDA #$10
4cf6 : 8d eb bf STA $bfeb ; (buff + 45)
.s284:
4cf9 : 98 __ __ TYA
.s259:
4cfa : 85 15 __ STA P8 
4cfc : a5 4b __ LDA T3 + 0 
4cfe : 85 0f __ STA P2 ; (fmt + 0)
4d00 : a5 4c __ LDA T3 + 1 
4d02 : 85 10 __ STA P3 ; (fmt + 1)
4d04 : a9 e8 __ LDA #$e8
4d06 : 85 0d __ STA P0 ; (str + 0)
4d08 : a9 bf __ LDA #$bf
4d0a : 85 0e __ STA P1 ; (str + 1)
4d0c : 20 67 41 JSR $4167 ; (nforml@proxy + 0)
4d0f : a5 1b __ LDA ACCU + 0 
4d11 : 4c 8b 4a JMP $4a8b ; (sprintf.s1068 + 0)
.s285:
4d14 : a9 00 __ LDA #$00
.s261:
4d16 : 85 13 __ STA P6 
4d18 : a5 4b __ LDA T3 + 0 
4d1a : 85 0f __ STA P2 ; (fmt + 0)
4d1c : a5 4c __ LDA T3 + 1 
4d1e : 85 10 __ STA P3 ; (fmt + 1)
4d20 : a0 00 __ LDY #$00
4d22 : b1 47 __ LDA (T0 + 0),y 
4d24 : 85 11 __ STA P4 ; (fmt + 2)
4d26 : c8 __ __ INY
4d27 : b1 47 __ LDA (T0 + 0),y 
4d29 : 85 12 __ STA P5 ; (fmt + 3)
4d2b : a9 e8 __ LDA #$e8
4d2d : 85 0d __ STA P0 ; (str + 0)
4d2f : a9 bf __ LDA #$bf
4d31 : 85 0e __ STA P1 ; (str + 1)
4d33 : 20 32 40 JSR $4032 ; (nformi.s0 + 0)
4d36 : a5 1b __ LDA ACCU + 0 
4d38 : 85 43 __ STA T1 + 0 
4d3a : 4c 16 4c JMP $4c16 ; (sprintf.s258 + 0)
.s260:
4d3d : a0 00 __ LDY #$00
4d3f : b1 49 __ LDA (T2 + 0),y 
4d41 : aa __ __ TAX
4d42 : 18 __ __ CLC
4d43 : a5 49 __ LDA T2 + 0 
4d45 : 69 01 __ ADC #$01
4d47 : 4c c9 4a JMP $4ac9 ; (sprintf.l15 + 0)
--------------------------------------------------------------------
4d4a : __ __ __ BYT 76 64 63 20 4d 45 4d 4f 52 59 20 44 45 54 45 43 : vdc MEMORY DETEC
4d5a : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 2c 20 45 58 54 45 : TED: %U kb, EXTE
4d6a : __ __ __ BYT 4e 44 45 44 20 4d 45 4d 4f 52 59 20 25 53 41 42 : NDED MEMORY %SAB
4d7a : __ __ __ BYT 4c 45 44 2e 00                                  : LED..
--------------------------------------------------------------------
4d7f : __ __ __ BYT 64 49 53 00                                     : dIS.
--------------------------------------------------------------------
4d83 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 3a 00 : lOADING ASSETS:.
--------------------------------------------------------------------
4d93 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 20 31 3a 20 6c 4f 56 45 : - SCREEN 1: lOVE
4da3 : __ __ __ BYT 20 49 53 20 41 20 64 52 55 47 00                :  IS A dRUG.
--------------------------------------------------------------------
4dae : __ __ __ BYT 53 43 52 45 45 4e 31 00                         : SCREEN1.
--------------------------------------------------------------------
4db6 : __ __ __ BYT 6c 4f 41 44 20 45 52 52 4f 52 2e 00             : lOAD ERROR..
--------------------------------------------------------------------
4dc2 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 20 32 3a 20 6c 4f 47 4f : - SCREEN 2: lOGO
4dd2 : __ __ __ BYT 20 54 45 53 54 20 53 43 52 45 45 4e 00          :  TEST SCREEN.
--------------------------------------------------------------------
4ddf : __ __ __ BYT 53 43 52 45 45 4e 32 00                         : SCREEN2.
--------------------------------------------------------------------
4de7 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 44 45 4d 4f : oSCAR64 vdc DEMO
4df7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4df8 : __ __ __ BYT 6f 4e 20 00                                     : oN .
--------------------------------------------------------------------
4dfc : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
4e00 : __ __ __ BYT 76 64 63 20 6d 45 4d 4f 52 59 20 64 45 54 45 43 : vdc mEMORY dETEC
4e10 : __ __ __ BYT 54 45 44 3a 20 25 44 20 6b 62 2c 20 53 43 52 45 : TED: %D kb, SCRE
4e20 : __ __ __ BYT 45 4e 20 53 49 5a 45 3a 20 25 44 58 25 44 2c 20 : EN SIZE: %DX%D, 
4e30 : __ __ __ BYT 45 58 54 2e 4d 45 4d 3a 20 25 53 00             : EXT.MEM: %S.
--------------------------------------------------------------------
4e3c : __ __ __ BYT 6d 4f 56 45 20 42 59 20 77 2c 61 2c 73 2c 64 20 : mOVE BY w,a,s,d 
4e4c : __ __ __ BYT 4f 52 20 43 55 52 53 4f 52 20 4b 45 59 53 2e 20 : OR CURSOR KEYS. 
4e5c : __ __ __ BYT 65 73 63 20 4f 52 20 73 74 6f 70 20 54 4f 20 45 : esc OR stop TO E
4e6c : __ __ __ BYT 58 49 54 2e 00                                  : XIT..
--------------------------------------------------------------------
4e71 : __ __ __ BYT 70 45 54 53 43 49 49 20 41 52 54 20 43 52 45 44 : pETSCII ART CRED
4e81 : __ __ __ BYT 49 54 3a 20 27 6c 4f 56 45 20 49 53 20 54 48 45 : IT: 'lOVE IS THE
4e91 : __ __ __ BYT 20 44 52 55 47 27 20 61 54 4c 41 4e 54 49 53 2c :  DRUG' aTLANTIS,
4ea1 : __ __ __ BYT 20 32 30 32 33 2c 20 61 52 54 20 42 59 20 6c 4f :  2023, aRT BY lO
4eb1 : __ __ __ BYT 42 4f 2e 00                                     : BO..
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
4eb5 : a9 6d __ LDA #$6d
4eb7 : 85 0d __ STA P0 
4eb9 : a9 bf __ LDA #$bf
4ebb : 85 0e __ STA P1 
4ebd : ad 9d bf LDA $bf9d ; (viewport + 11)
4ec0 : 85 0f __ STA P2 
4ec2 : ad 9e bf LDA $bf9e ; (viewport + 12)
4ec5 : 85 10 __ STA P3 
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
4ec7 : a9 00 __ LDA #$00
4ec9 : a0 04 __ LDY #$04
4ecb : 91 0d __ STA (P0),y ; (win + 0)
4ecd : c8 __ __ INY
4ece : 91 0d __ STA (P0),y ; (win + 0)
4ed0 : a5 0f __ LDA P2 ; (sx + 0)
4ed2 : a0 00 __ LDY #$00
4ed4 : 91 0d __ STA (P0),y ; (win + 0)
4ed6 : a5 10 __ LDA P3 ; (sy + 0)
4ed8 : c8 __ __ INY
4ed9 : 91 0d __ STA (P0),y ; (win + 0)
4edb : a5 11 __ LDA P4 ; (wx + 0)
4edd : c8 __ __ INY
4ede : 91 0d __ STA (P0),y ; (win + 0)
4ee0 : a5 12 __ LDA P5 ; (wy + 0)
4ee2 : c8 __ __ INY
4ee3 : 91 0d __ STA (P0),y ; (win + 0)
4ee5 : 06 10 __ ASL P3 ; (sy + 0)
4ee7 : a6 10 __ LDX P3 ; (sy + 0)
4ee9 : bd 00 52 LDA $5200,x ; (multab + 0)
4eec : 18 __ __ CLC
4eed : 65 0f __ ADC P2 ; (sx + 0)
4eef : 85 1b __ STA ACCU + 0 
4ef1 : bd 01 52 LDA $5201,x ; (multab + 1)
4ef4 : 69 00 __ ADC #$00
4ef6 : a8 __ __ TAY
4ef7 : ad db 50 LDA $50db ; (vdc_state + 8)
4efa : 18 __ __ CLC
4efb : 65 1b __ ADC ACCU + 0 
4efd : 85 1b __ STA ACCU + 0 
4eff : 98 __ __ TYA
4f00 : 6d dc 50 ADC $50dc ; (vdc_state + 9)
4f03 : a0 07 __ LDY #$07
4f05 : 91 0d __ STA (P0),y ; (win + 0)
4f07 : a5 1b __ LDA ACCU + 0 
4f09 : 88 __ __ DEY
4f0a : 91 0d __ STA (P0),y ; (win + 0)
4f0c : bd 00 52 LDA $5200,x ; (multab + 0)
4f0f : 18 __ __ CLC
4f10 : 65 0f __ ADC P2 ; (sx + 0)
4f12 : 85 1b __ STA ACCU + 0 
4f14 : bd 01 52 LDA $5201,x ; (multab + 1)
4f17 : 69 00 __ ADC #$00
4f19 : aa __ __ TAX
4f1a : ad dd 50 LDA $50dd ; (vdc_state + 10)
4f1d : 18 __ __ CLC
4f1e : 65 1b __ ADC ACCU + 0 
4f20 : 85 1b __ STA ACCU + 0 
4f22 : 8a __ __ TXA
4f23 : 6d de 50 ADC $50de ; (vdc_state + 11)
4f26 : a0 09 __ LDY #$09
4f28 : 91 0d __ STA (P0),y ; (win + 0)
4f2a : a5 1b __ LDA ACCU + 0 
4f2c : 88 __ __ DEY
4f2d : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
4f2f : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
4f30 : a0 00 __ LDY #$00
4f32 : 84 06 __ STY WORK + 3 
4f34 : 4a __ __ LSR
4f35 : 90 0d __ BCC $4f44 ; (mul16by8 + 20)
4f37 : aa __ __ TAX
4f38 : 18 __ __ CLC
4f39 : 98 __ __ TYA
4f3a : 65 1b __ ADC ACCU + 0 
4f3c : a8 __ __ TAY
4f3d : a5 06 __ LDA WORK + 3 
4f3f : 65 1c __ ADC ACCU + 1 
4f41 : 85 06 __ STA WORK + 3 
4f43 : 8a __ __ TXA
4f44 : 06 1b __ ASL ACCU + 0 
4f46 : 26 1c __ ROL ACCU + 1 
4f48 : 4a __ __ LSR
4f49 : b0 ec __ BCS $4f37 ; (mul16by8 + 7)
4f4b : d0 f7 __ BNE $4f44 ; (mul16by8 + 20)
4f4d : 84 05 __ STY WORK + 2 
4f4f : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
4f50 : a0 00 __ LDY #$00
4f52 : 84 06 __ STY WORK + 3 
4f54 : a5 03 __ LDA WORK + 0 
4f56 : a6 04 __ LDX WORK + 1 
4f58 : f0 1c __ BEQ $4f76 ; (mul16 + 38)
4f5a : 38 __ __ SEC
4f5b : 6a __ __ ROR
4f5c : 90 0d __ BCC $4f6b ; (mul16 + 27)
4f5e : aa __ __ TAX
4f5f : 18 __ __ CLC
4f60 : 98 __ __ TYA
4f61 : 65 1b __ ADC ACCU + 0 
4f63 : a8 __ __ TAY
4f64 : a5 06 __ LDA WORK + 3 
4f66 : 65 1c __ ADC ACCU + 1 
4f68 : 85 06 __ STA WORK + 3 
4f6a : 8a __ __ TXA
4f6b : 06 1b __ ASL ACCU + 0 
4f6d : 26 1c __ ROL ACCU + 1 
4f6f : 4a __ __ LSR
4f70 : 90 f9 __ BCC $4f6b ; (mul16 + 27)
4f72 : d0 ea __ BNE $4f5e ; (mul16 + 14)
4f74 : a5 04 __ LDA WORK + 1 
4f76 : 4a __ __ LSR
4f77 : 90 0d __ BCC $4f86 ; (mul16 + 54)
4f79 : aa __ __ TAX
4f7a : 18 __ __ CLC
4f7b : 98 __ __ TYA
4f7c : 65 1b __ ADC ACCU + 0 
4f7e : a8 __ __ TAY
4f7f : a5 06 __ LDA WORK + 3 
4f81 : 65 1c __ ADC ACCU + 1 
4f83 : 85 06 __ STA WORK + 3 
4f85 : 8a __ __ TXA
4f86 : 06 1b __ ASL ACCU + 0 
4f88 : 26 1c __ ROL ACCU + 1 
4f8a : 4a __ __ LSR
4f8b : b0 ec __ BCS $4f79 ; (mul16 + 41)
4f8d : d0 f7 __ BNE $4f86 ; (mul16 + 54)
4f8f : 84 05 __ STY WORK + 2 
4f91 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
4f92 : a5 1c __ LDA ACCU + 1 
4f94 : d0 31 __ BNE $4fc7 ; (divmod + 53)
4f96 : a5 04 __ LDA WORK + 1 
4f98 : d0 1e __ BNE $4fb8 ; (divmod + 38)
4f9a : 85 06 __ STA WORK + 3 
4f9c : a2 04 __ LDX #$04
4f9e : 06 1b __ ASL ACCU + 0 
4fa0 : 2a __ __ ROL
4fa1 : c5 03 __ CMP WORK + 0 
4fa3 : 90 02 __ BCC $4fa7 ; (divmod + 21)
4fa5 : e5 03 __ SBC WORK + 0 
4fa7 : 26 1b __ ROL ACCU + 0 
4fa9 : 2a __ __ ROL
4faa : c5 03 __ CMP WORK + 0 
4fac : 90 02 __ BCC $4fb0 ; (divmod + 30)
4fae : e5 03 __ SBC WORK + 0 
4fb0 : 26 1b __ ROL ACCU + 0 
4fb2 : ca __ __ DEX
4fb3 : d0 eb __ BNE $4fa0 ; (divmod + 14)
4fb5 : 85 05 __ STA WORK + 2 
4fb7 : 60 __ __ RTS
4fb8 : a5 1b __ LDA ACCU + 0 
4fba : 85 05 __ STA WORK + 2 
4fbc : a5 1c __ LDA ACCU + 1 
4fbe : 85 06 __ STA WORK + 3 
4fc0 : a9 00 __ LDA #$00
4fc2 : 85 1b __ STA ACCU + 0 
4fc4 : 85 1c __ STA ACCU + 1 
4fc6 : 60 __ __ RTS
4fc7 : a5 04 __ LDA WORK + 1 
4fc9 : d0 1f __ BNE $4fea ; (divmod + 88)
4fcb : a5 03 __ LDA WORK + 0 
4fcd : 30 1b __ BMI $4fea ; (divmod + 88)
4fcf : a9 00 __ LDA #$00
4fd1 : 85 06 __ STA WORK + 3 
4fd3 : a2 10 __ LDX #$10
4fd5 : 06 1b __ ASL ACCU + 0 
4fd7 : 26 1c __ ROL ACCU + 1 
4fd9 : 2a __ __ ROL
4fda : c5 03 __ CMP WORK + 0 
4fdc : 90 02 __ BCC $4fe0 ; (divmod + 78)
4fde : e5 03 __ SBC WORK + 0 
4fe0 : 26 1b __ ROL ACCU + 0 
4fe2 : 26 1c __ ROL ACCU + 1 
4fe4 : ca __ __ DEX
4fe5 : d0 f2 __ BNE $4fd9 ; (divmod + 71)
4fe7 : 85 05 __ STA WORK + 2 
4fe9 : 60 __ __ RTS
4fea : a9 00 __ LDA #$00
4fec : 85 05 __ STA WORK + 2 
4fee : 85 06 __ STA WORK + 3 
4ff0 : 84 02 __ STY $02 
4ff2 : a0 10 __ LDY #$10
4ff4 : 18 __ __ CLC
4ff5 : 26 1b __ ROL ACCU + 0 
4ff7 : 26 1c __ ROL ACCU + 1 
4ff9 : 26 05 __ ROL WORK + 2 
4ffb : 26 06 __ ROL WORK + 3 
4ffd : 38 __ __ SEC
4ffe : a5 05 __ LDA WORK + 2 
5000 : e5 03 __ SBC WORK + 0 
5002 : aa __ __ TAX
5003 : a5 06 __ LDA WORK + 3 
5005 : e5 04 __ SBC WORK + 1 
5007 : 90 04 __ BCC $500d ; (divmod + 123)
5009 : 86 05 __ STX WORK + 2 
500b : 85 06 __ STA WORK + 3 
500d : 88 __ __ DEY
500e : d0 e5 __ BNE $4ff5 ; (divmod + 99)
5010 : 26 1b __ ROL ACCU + 0 
5012 : 26 1c __ ROL ACCU + 1 
5014 : a4 02 __ LDY $02 
5016 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
5017 : 84 02 __ STY $02 
5019 : a0 20 __ LDY #$20
501b : a9 00 __ LDA #$00
501d : 85 07 __ STA WORK + 4 
501f : 85 08 __ STA WORK + 5 
5021 : 85 09 __ STA WORK + 6 
5023 : 85 0a __ STA WORK + 7 
5025 : a5 05 __ LDA WORK + 2 
5027 : 05 06 __ ORA WORK + 3 
5029 : d0 39 __ BNE $5064 ; (divmod32 + 77)
502b : 18 __ __ CLC
502c : 26 1b __ ROL ACCU + 0 
502e : 26 1c __ ROL ACCU + 1 
5030 : 26 1d __ ROL ACCU + 2 
5032 : 26 1e __ ROL ACCU + 3 
5034 : 26 07 __ ROL WORK + 4 
5036 : 26 08 __ ROL WORK + 5 
5038 : 90 0c __ BCC $5046 ; (divmod32 + 47)
503a : a5 07 __ LDA WORK + 4 
503c : e5 03 __ SBC WORK + 0 
503e : aa __ __ TAX
503f : a5 08 __ LDA WORK + 5 
5041 : e5 04 __ SBC WORK + 1 
5043 : 38 __ __ SEC
5044 : b0 0c __ BCS $5052 ; (divmod32 + 59)
5046 : 38 __ __ SEC
5047 : a5 07 __ LDA WORK + 4 
5049 : e5 03 __ SBC WORK + 0 
504b : aa __ __ TAX
504c : a5 08 __ LDA WORK + 5 
504e : e5 04 __ SBC WORK + 1 
5050 : 90 04 __ BCC $5056 ; (divmod32 + 63)
5052 : 86 07 __ STX WORK + 4 
5054 : 85 08 __ STA WORK + 5 
5056 : 88 __ __ DEY
5057 : d0 d3 __ BNE $502c ; (divmod32 + 21)
5059 : 26 1b __ ROL ACCU + 0 
505b : 26 1c __ ROL ACCU + 1 
505d : 26 1d __ ROL ACCU + 2 
505f : 26 1e __ ROL ACCU + 3 
5061 : a4 02 __ LDY $02 
5063 : 60 __ __ RTS
5064 : 18 __ __ CLC
5065 : 26 1b __ ROL ACCU + 0 
5067 : 26 1c __ ROL ACCU + 1 
5069 : 26 1d __ ROL ACCU + 2 
506b : 26 1e __ ROL ACCU + 3 
506d : 26 07 __ ROL WORK + 4 
506f : 26 08 __ ROL WORK + 5 
5071 : 26 09 __ ROL WORK + 6 
5073 : 26 0a __ ROL WORK + 7 
5075 : a5 07 __ LDA WORK + 4 
5077 : c5 03 __ CMP WORK + 0 
5079 : a5 08 __ LDA WORK + 5 
507b : e5 04 __ SBC WORK + 1 
507d : a5 09 __ LDA WORK + 6 
507f : e5 05 __ SBC WORK + 2 
5081 : a5 0a __ LDA WORK + 7 
5083 : e5 06 __ SBC WORK + 3 
5085 : 90 18 __ BCC $509f ; (divmod32 + 136)
5087 : a5 07 __ LDA WORK + 4 
5089 : e5 03 __ SBC WORK + 0 
508b : 85 07 __ STA WORK + 4 
508d : a5 08 __ LDA WORK + 5 
508f : e5 04 __ SBC WORK + 1 
5091 : 85 08 __ STA WORK + 5 
5093 : a5 09 __ LDA WORK + 6 
5095 : e5 05 __ SBC WORK + 2 
5097 : 85 09 __ STA WORK + 6 
5099 : a5 0a __ LDA WORK + 7 
509b : e5 06 __ SBC WORK + 3 
509d : 85 0a __ STA WORK + 7 
509f : 88 __ __ DEY
50a0 : d0 c3 __ BNE $5065 ; (divmod32 + 78)
50a2 : 26 1b __ ROL ACCU + 0 
50a4 : 26 1c __ ROL ACCU + 1 
50a6 : 26 1d __ ROL ACCU + 2 
50a8 : 26 1e __ ROL ACCU + 3 
50aa : a4 02 __ LDY $02 
50ac : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
50ad : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
50b3 : a9 02 __ LDA #$02
50b5 : 85 0d __ STA P0 
50b7 : a9 90 __ LDA #$90
50b9 : 85 0e __ STA P1 
50bb : a9 52 __ LDA #$52
50bd : 85 0f __ STA P2 
50bf : 4c e8 48 JMP $48e8 ; (vdc_prints.s0 + 0)
--------------------------------------------------------------------
50c2 : __ __ __ BYT 7f 00 80 a0 4b 00 00 00 00 00 00 00 00 00 00 00 : ....K...........
--------------------------------------------------------------------
giocharmap:
50d2 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
vdc_state:
50d3 : __ __ __ BSS	25
--------------------------------------------------------------------
vdc_modes:
5100 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
5110 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
5120 : __ __ __ BYT e7 24 7e ff 50 00 32 00 00 00 00 00 10 00 40 00 : .$~.P.2.......@.
5130 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
5140 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
5150 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
5160 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
5170 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
5180 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
5190 : __ __ __ BYT 50 00 32 00 00 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
51a0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
51b0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
51c0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
51d0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
multab:
5200 : __ __ __ BSS	144
--------------------------------------------------------------------
linebuffer:
5290 : __ __ __ BSS	81
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1300 : ad e3 50 LDA $50e3 ; (vdc_state + 16)
01:1303 : 85 0d __ STA P0 
01:1305 : ad e4 50 LDA $50e4 ; (vdc_state + 17)
01:1308 : 85 0e __ STA P1 
--------------------------------------------------------------------
bnk_redef_charset: ; bnk_redef_charset(u16,u8,u8*,u16)->void
.s0:
01:130a : ad 00 ff LDA $ff00 
01:130d : 85 1b __ STA ACCU + 0 
01:130f : a9 0e __ LDA #$0e
01:1311 : 8d 00 ff STA $ff00 
01:1314 : a9 12 __ LDA #$12
01:1316 : 8d 00 d6 STA $d600 
01:1319 : a9 00 __ LDA #$00
01:131b : 85 43 __ STA T3 + 0 
01:131d : 85 45 __ STA T4 + 0 
01:131f : a9 02 __ LDA #$02
01:1321 : 85 44 __ STA T3 + 1 
01:1323 : a9 d0 __ LDA #$d0
01:1325 : 85 46 __ STA T4 + 1 
.l166:
01:1327 : 2c 00 d6 BIT $d600 
01:132a : 10 fb __ BPL $1327 ; (bnk_redef_charset.l166 + 0)
.s6:
01:132c : a5 0e __ LDA P1 ; (vdcdest + 1)
01:132e : 8d 01 d6 STA $d601 
01:1331 : a9 13 __ LDA #$13
01:1333 : 8d 00 d6 STA $d600 
.l168:
01:1336 : 2c 00 d6 BIT $d600 
01:1339 : 10 fb __ BPL $1336 ; (bnk_redef_charset.l168 + 0)
.s11:
01:133b : a5 0d __ LDA P0 ; (vdcdest + 0)
01:133d : 8d 01 d6 STA $d601 
01:1340 : a9 1f __ LDA #$1f
01:1342 : 8d 00 d6 STA $d600 
.l14:
01:1345 : a2 08 __ LDX #$08
.l17:
01:1347 : a9 01 __ LDA #$01
01:1349 : 8d 00 ff STA $ff00 
01:134c : a0 00 __ LDY #$00
01:134e : b1 45 __ LDA (T4 + 0),y 
01:1350 : a8 __ __ TAY
01:1351 : a9 0e __ LDA #$0e
01:1353 : 8d 00 ff STA $ff00 
01:1356 : e6 45 __ INC T4 + 0 
01:1358 : d0 02 __ BNE $135c ; (bnk_redef_charset.l170 + 0)
.s1013:
01:135a : e6 46 __ INC T4 + 1 
.l170:
01:135c : 2c 00 d6 BIT $d600 
01:135f : 10 fb __ BPL $135c ; (bnk_redef_charset.l170 + 0)
.s22:
01:1361 : 8c 01 d6 STY $d601 
01:1364 : ca __ __ DEX
01:1365 : d0 e0 __ BNE $1347 ; (bnk_redef_charset.l17 + 0)
.s19:
01:1367 : a2 08 __ LDX #$08
.l24:
01:1369 : 2c 00 d6 BIT $d600 
01:136c : 10 fb __ BPL $1369 ; (bnk_redef_charset.l24 + 0)
.s29:
01:136e : a9 00 __ LDA #$00
01:1370 : 8d 01 d6 STA $d601 
01:1373 : ca __ __ DEX
01:1374 : d0 f3 __ BNE $1369 ; (bnk_redef_charset.l24 + 0)
.s26:
01:1376 : a5 43 __ LDA T3 + 0 
01:1378 : d0 02 __ BNE $137c ; (bnk_redef_charset.s1011 + 0)
.s1010:
01:137a : c6 44 __ DEC T3 + 1 
.s1011:
01:137c : c6 43 __ DEC T3 + 0 
01:137e : d0 c5 __ BNE $1345 ; (bnk_redef_charset.l14 + 0)
.s1012:
01:1380 : a5 44 __ LDA T3 + 1 
01:1382 : d0 c1 __ BNE $1345 ; (bnk_redef_charset.l14 + 0)
.s15:
01:1384 : a5 1b __ LDA ACCU + 0 
01:1386 : 8d 00 ff STA $ff00 
.s1001:
01:1389 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_load: ; bnk_load(u8,u8,const u8*,const u8*)->bool
.s0:
01:138a : a9 01 __ LDA #$01
01:138c : 85 0d __ STA P0 
01:138e : a9 00 __ LDA #$00
01:1390 : 85 0e __ STA P1 
01:1392 : 20 93 43 JSR $4393 ; (krnio_setbnk.s0 + 0)
01:1395 : a5 12 __ LDA P5 ; (fname + 0)
01:1397 : 85 0d __ STA P0 
01:1399 : a5 13 __ LDA P6 ; (fname + 1)
01:139b : 85 0e __ STA P1 
01:139d : 20 9b 43 JSR $439b ; (krnio_setnam.s0 + 0)
01:13a0 : a9 01 __ LDA #$01
01:13a2 : a6 0f __ LDX P2 
01:13a4 : a0 00 __ LDY #$00
01:13a6 : 20 ba ff JSR $ffba 
01:13a9 : a9 00 __ LDA #$00
01:13ab : a6 10 __ LDX P3 
01:13ad : a4 11 __ LDY P4 
01:13af : 20 d5 ff JSR $ffd5 
01:13b2 : a9 00 __ LDA #$00
01:13b4 : b0 02 __ BCS $13b8 ; (bnk_load.s0 + 46)
01:13b6 : a9 01 __ LDA #$01
01:13b8 : 85 1b __ STA ACCU + 0 
.s1001:
01:13ba : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:13bb : ad 92 bf LDA $bf92 ; (viewport + 0)
01:13be : 85 0f __ STA P2 
01:13c0 : a5 54 __ LDA $54 
01:13c2 : 85 10 __ STA P3 
01:13c4 : a5 55 __ LDA $55 
01:13c6 : 85 11 __ STA P4 
01:13c8 : ad 9f bf LDA $bf9f ; (viewport + 13)
01:13cb : 85 12 __ STA P5 
01:13cd : a9 00 __ LDA #$00
01:13cf : 85 13 __ STA P6 
--------------------------------------------------------------------
bnk_cpytovdc: ; bnk_cpytovdc(u16,u8,u8*,u16)->void
.s0:
01:13d1 : ad 00 ff LDA $ff00 
01:13d4 : 85 1b __ STA ACCU + 0 
01:13d6 : a9 0e __ LDA #$0e
01:13d8 : 8d 00 ff STA $ff00 
01:13db : a9 12 __ LDA #$12
01:13dd : 8d 00 d6 STA $d600 
.l115:
01:13e0 : 2c 00 d6 BIT $d600 
01:13e3 : 10 fb __ BPL $13e0 ; (bnk_cpytovdc.l115 + 0)
.s6:
01:13e5 : a5 0e __ LDA P1 ; (vdcdest + 1)
01:13e7 : 8d 01 d6 STA $d601 
01:13ea : a9 13 __ LDA #$13
01:13ec : 8d 00 d6 STA $d600 
.l117:
01:13ef : 2c 00 d6 BIT $d600 
01:13f2 : 10 fb __ BPL $13ef ; (bnk_cpytovdc.l117 + 0)
.s11:
01:13f4 : a5 0d __ LDA P0 ; (vdcdest + 0)
01:13f6 : 8d 01 d6 STA $d601 
01:13f9 : a9 1f __ LDA #$1f
01:13fb : 8d 00 d6 STA $d600 
01:13fe : a5 12 __ LDA P5 ; (size + 0)
01:1400 : 05 13 __ ORA P6 ; (size + 1)
01:1402 : d0 06 __ BNE $140a ; (bnk_cpytovdc.s1012 + 0)
.s15:
01:1404 : a5 1b __ LDA ACCU + 0 
01:1406 : 8d 00 ff STA $ff00 
.s1001:
01:1409 : 60 __ __ RTS
.s1012:
01:140a : a6 12 __ LDX P5 ; (size + 0)
.l14:
01:140c : a5 0f __ LDA P2 ; (scr + 0)
01:140e : 8d 00 ff STA $ff00 
01:1411 : a0 00 __ LDY #$00
01:1413 : b1 10 __ LDA (P3),y ; (sp + 0)
01:1415 : a8 __ __ TAY
01:1416 : e6 10 __ INC P3 ; (sp + 0)
01:1418 : d0 02 __ BNE $141c ; (bnk_cpytovdc.s1014 + 0)
.s1013:
01:141a : e6 11 __ INC P4 ; (sp + 1)
.s1014:
01:141c : a9 0e __ LDA #$0e
01:141e : 8d 00 ff STA $ff00 
.l120:
01:1421 : 2c 00 d6 BIT $d600 
01:1424 : 10 fb __ BPL $1421 ; (bnk_cpytovdc.l120 + 0)
.s18:
01:1426 : 8c 01 d6 STY $d601 
01:1429 : 8a __ __ TXA
01:142a : d0 02 __ BNE $142e ; (bnk_cpytovdc.s1009 + 0)
.s1008:
01:142c : c6 13 __ DEC P6 ; (size + 1)
.s1009:
01:142e : ca __ __ DEX
01:142f : d0 db __ BNE $140c ; (bnk_cpytovdc.l14 + 0)
.s1010:
01:1431 : a5 13 __ LDA P6 ; (size + 1)
01:1433 : d0 d7 __ BNE $140c ; (bnk_cpytovdc.l14 + 0)
01:1435 : 4c 04 14 JMP $1404 ; (bnk_cpytovdc.s15 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:1438 : a9 90 __ LDA #$90
01:143a : 85 0d __ STA P0 
01:143c : a9 52 __ LDA #$52
01:143e : 85 0e __ STA P1 
01:1440 : a5 57 __ LDA $57 
01:1442 : 85 11 __ STA P4 
01:1444 : a9 00 __ LDA #$00
01:1446 : 85 12 __ STA P5 
--------------------------------------------------------------------
bnk_cpyfromvdc: ; bnk_cpyfromvdc(u8,u8*,u16,u16)->void
.s0:
01:1448 : ad 00 ff LDA $ff00 
01:144b : 85 1d __ STA ACCU + 2 
01:144d : a6 11 __ LDX P4 ; (size + 0)
.l110:
01:144f : 8a __ __ TXA
01:1450 : 05 12 __ ORA P5 ; (size + 1)
01:1452 : d0 06 __ BNE $145a ; (bnk_cpyfromvdc.s2 + 0)
.s3:
01:1454 : a5 1d __ LDA ACCU + 2 
01:1456 : 8d 00 ff STA $ff00 
.s1001:
01:1459 : 60 __ __ RTS
.s2:
01:145a : a9 0e __ LDA #$0e
01:145c : 8d 00 ff STA $ff00 
01:145f : a5 0f __ LDA P2 ; (vdcsrc + 0)
01:1461 : a8 __ __ TAY
01:1462 : 18 __ __ CLC
01:1463 : 69 01 __ ADC #$01
01:1465 : 85 0f __ STA P2 ; (vdcsrc + 0)
01:1467 : a5 10 __ LDA P3 ; (vdcsrc + 1)
01:1469 : 85 1b __ STA ACCU + 0 
01:146b : 69 00 __ ADC #$00
01:146d : 85 10 __ STA P3 ; (vdcsrc + 1)
01:146f : a9 12 __ LDA #$12
01:1471 : 8d 00 d6 STA $d600 
.l111:
01:1474 : 2c 00 d6 BIT $d600 
01:1477 : 10 fb __ BPL $1474 ; (bnk_cpyfromvdc.l111 + 0)
.s10:
01:1479 : a5 1b __ LDA ACCU + 0 
01:147b : 8d 01 d6 STA $d601 
01:147e : a9 13 __ LDA #$13
01:1480 : 8d 00 d6 STA $d600 
.l113:
01:1483 : 2c 00 d6 BIT $d600 
01:1486 : 10 fb __ BPL $1483 ; (bnk_cpyfromvdc.l113 + 0)
.s15:
01:1488 : 8c 01 d6 STY $d601 
01:148b : a9 1f __ LDA #$1f
01:148d : 8d 00 d6 STA $d600 
.l115:
01:1490 : 2c 00 d6 BIT $d600 
01:1493 : 10 fb __ BPL $1490 ; (bnk_cpyfromvdc.l115 + 0)
.s19:
01:1495 : a9 0e __ LDA #$0e
01:1497 : ac 01 d6 LDY $d601 
01:149a : 8d 00 ff STA $ff00 
01:149d : a5 0d __ LDA P0 ; (dp + 0)
01:149f : 85 1b __ STA ACCU + 0 
01:14a1 : 18 __ __ CLC
01:14a2 : 69 01 __ ADC #$01
01:14a4 : 85 0d __ STA P0 ; (dp + 0)
01:14a6 : a5 0e __ LDA P1 ; (dp + 1)
01:14a8 : 85 1c __ STA ACCU + 1 
01:14aa : 69 00 __ ADC #$00
01:14ac : 85 0e __ STA P1 ; (dp + 1)
01:14ae : 98 __ __ TYA
01:14af : a0 00 __ LDY #$00
01:14b1 : 91 1b __ STA (ACCU + 0),y 
01:14b3 : 8a __ __ TXA
01:14b4 : 18 __ __ CLC
01:14b5 : 69 ff __ ADC #$ff
01:14b7 : aa __ __ TAX
01:14b8 : b0 95 __ BCS $144f ; (bnk_cpyfromvdc.l110 + 0)
.s1008:
01:14ba : c6 12 __ DEC P5 ; (size + 1)
01:14bc : 90 91 __ BCC $144f ; (bnk_cpyfromvdc.l110 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:14be : a9 90 __ LDA #$90
01:14c0 : 85 0d __ STA P0 
01:14c2 : a9 52 __ LDA #$52
01:14c4 : 85 0e __ STA P1 
01:14c6 : a5 12 __ LDA P5 
01:14c8 : 85 11 __ STA P4 
01:14ca : a9 00 __ LDA #$00
01:14cc : 85 12 __ STA P5 
01:14ce : 4c 48 14 JMP $1448 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:14d1 : ad 62 bf LDA $bf62 ; (vp_fill + 0)
01:14d4 : 85 0f __ STA P2 
01:14d6 : a5 57 __ LDA $57 
01:14d8 : 85 10 __ STA P3 
01:14da : a5 58 __ LDA $58 
01:14dc : 85 11 __ STA P4 
01:14de : ad 6f bf LDA $bf6f ; (vp_fill + 13)
01:14e1 : 85 12 __ STA P5 
01:14e3 : a9 00 __ LDA #$00
01:14e5 : 85 13 __ STA P6 
01:14e7 : 4c d1 13 JMP $13d1 ; (bnk_cpytovdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:14ea : a9 0e __ LDA #$0e
01:14ec : 85 0f __ STA P2 
01:14ee : a9 90 __ LDA #$90
01:14f0 : 85 10 __ STA P3 
01:14f2 : a9 52 __ LDA #$52
01:14f4 : 85 11 __ STA P4 
01:14f6 : a5 57 __ LDA $57 
01:14f8 : 85 12 __ STA P5 
01:14fa : a9 00 __ LDA #$00
01:14fc : 85 13 __ STA P6 
01:14fe : 4c d1 13 JMP $13d1 ; (bnk_cpytovdc.s0 + 0)
