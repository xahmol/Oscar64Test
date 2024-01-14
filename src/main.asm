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
1c13 : 8e f3 41 STX $41f3 ; (spentry + 0)
1c16 : a9 72 __ LDA #$72
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 44 __ LDA #$44
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 44 __ LDA #$44
1c21 : e9 44 __ SBC #$44
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
1c35 : a9 d9 __ LDA #$d9
1c37 : e9 72 __ SBC #$72
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
1c50 : a9 91 __ LDA #$91
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
1c80 : a2 05 __ LDX #$05
1c82 : b5 53 __ LDA T0 + 0,x 
1c84 : 9d 93 bf STA $bf93,x ; (main@stack + 0)
1c87 : ca __ __ DEX
1c88 : 10 f8 __ BPL $1c82 ; (main.s1000 + 2)
1c8a : 38 __ __ SEC
1c8b : a5 23 __ LDA SP + 0 
1c8d : e9 0e __ SBC #$0e
1c8f : 85 23 __ STA SP + 0 
1c91 : b0 02 __ BCS $1c95 ; (main.s0 + 0)
1c93 : c6 24 __ DEC SP + 1 
.s0:
1c95 : a9 1a __ LDA #$1a
1c97 : 8d 00 d6 STA $d600 
.l7543:
1c9a : 2c 00 d6 BIT $d600 
1c9d : 10 fb __ BPL $1c9a ; (main.l7543 + 0)
.s9:
1c9f : ad 01 d6 LDA $d601 
1ca2 : 29 f0 __ AND #$f0
1ca4 : aa __ __ TAX
1ca5 : a9 1a __ LDA #$1a
1ca7 : 8d 00 d6 STA $d600 
.l7545:
1caa : 2c 00 d6 BIT $d600 
1cad : 10 fb __ BPL $1caa ; (main.l7545 + 0)
.s15:
1caf : 8e 01 d6 STX $d601 
1cb2 : 8d 00 d6 STA $d600 
.l7547:
1cb5 : 2c 00 d6 BIT $d600 
1cb8 : 10 fb __ BPL $1cb5 ; (main.l7547 + 0)
.s22:
1cba : ad 01 d6 LDA $d601 
1cbd : 29 0f __ AND #$0f
1cbf : 09 d0 __ ORA #$d0
1cc1 : aa __ __ TAX
1cc2 : a9 1a __ LDA #$1a
1cc4 : 8d 00 d6 STA $d600 
.l7549:
1cc7 : 2c 00 d6 BIT $d600 
1cca : 10 fb __ BPL $1cc7 ; (main.l7549 + 0)
.s28:
1ccc : 8e 01 d6 STX $d601 
1ccf : a9 8d __ LDA #$8d
1cd1 : 8d 79 44 STA $4479 ; (vdc_state + 7)
1cd4 : a9 1c __ LDA #$1c
1cd6 : 8d 00 d6 STA $d600 
.l7551:
1cd9 : 2c 00 d6 BIT $d600 
1cdc : 10 fb __ BPL $1cd9 ; (main.l7551 + 0)
.s34:
1cde : ad 01 d6 LDA $d601 
1ce1 : aa __ __ TAX
1ce2 : 09 10 __ ORA #$10
1ce4 : a8 __ __ TAY
1ce5 : a9 1c __ LDA #$1c
1ce7 : 8d 00 d6 STA $d600 
.l7553:
1cea : 2c 00 d6 BIT $d600 
1ced : 10 fb __ BPL $1cea ; (main.l7553 + 0)
.s41:
1cef : 8c 01 d6 STY $d601 
1cf2 : a9 12 __ LDA #$12
1cf4 : 8d 00 d6 STA $d600 
.l7555:
1cf7 : 2c 00 d6 BIT $d600 
1cfa : 10 fb __ BPL $1cf7 ; (main.l7555 + 0)
.s48:
1cfc : a9 1f __ LDA #$1f
1cfe : 8d 01 d6 STA $d601 
1d01 : a9 13 __ LDA #$13
1d03 : 8d 00 d6 STA $d600 
.l7557:
1d06 : 2c 00 d6 BIT $d600 
1d09 : 10 fb __ BPL $1d06 ; (main.l7557 + 0)
.s53:
1d0b : a9 ff __ LDA #$ff
1d0d : 8d 01 d6 STA $d601 
1d10 : a9 1f __ LDA #$1f
1d12 : 8d 00 d6 STA $d600 
.l7559:
1d15 : 2c 00 d6 BIT $d600 
1d18 : 10 fb __ BPL $1d15 ; (main.l7559 + 0)
.s57:
1d1a : a9 00 __ LDA #$00
1d1c : 8d 01 d6 STA $d601 
1d1f : a9 12 __ LDA #$12
1d21 : 8d 00 d6 STA $d600 
.l7561:
1d24 : 2c 00 d6 BIT $d600 
1d27 : 10 fb __ BPL $1d24 ; (main.l7561 + 0)
.s64:
1d29 : a9 9f __ LDA #$9f
1d2b : 8d 01 d6 STA $d601 
1d2e : a9 13 __ LDA #$13
1d30 : 8d 00 d6 STA $d600 
.l7563:
1d33 : 2c 00 d6 BIT $d600 
1d36 : 10 fb __ BPL $1d33 ; (main.l7563 + 0)
.s69:
1d38 : a9 ff __ LDA #$ff
1d3a : 8d 01 d6 STA $d601 
1d3d : a9 1f __ LDA #$1f
1d3f : 8d 00 d6 STA $d600 
.l7565:
1d42 : 2c 00 d6 BIT $d600 
1d45 : 10 fb __ BPL $1d42 ; (main.l7565 + 0)
.s73:
1d47 : a9 ff __ LDA #$ff
1d49 : 8d 01 d6 STA $d601 
1d4c : a9 12 __ LDA #$12
1d4e : 8d 00 d6 STA $d600 
.l7567:
1d51 : 2c 00 d6 BIT $d600 
1d54 : 10 fb __ BPL $1d51 ; (main.l7567 + 0)
.s80:
1d56 : a9 1f __ LDA #$1f
1d58 : 8d 01 d6 STA $d601 
1d5b : a9 13 __ LDA #$13
1d5d : 8d 00 d6 STA $d600 
.l7569:
1d60 : 2c 00 d6 BIT $d600 
1d63 : 10 fb __ BPL $1d60 ; (main.l7569 + 0)
.s85:
1d65 : a9 ff __ LDA #$ff
1d67 : 8d 01 d6 STA $d601 
1d6a : a9 1f __ LDA #$1f
1d6c : 8d 00 d6 STA $d600 
.l7571:
1d6f : 2c 00 d6 BIT $d600 
1d72 : 10 fb __ BPL $1d6f ; (main.l7571 + 0)
.s89:
1d74 : ad 01 d6 LDA $d601 
1d77 : f0 04 __ BEQ $1d7d ; (main.s1695 + 0)
.s1696:
1d79 : a9 10 __ LDA #$10
1d7b : d0 02 __ BNE $1d7f ; (main.s1697 + 0)
.s1695:
1d7d : a9 40 __ LDA #$40
.s1697:
1d7f : 8d 72 44 STA $4472 ; (vdc_state + 0)
1d82 : a9 1c __ LDA #$1c
1d84 : 8d 00 d6 STA $d600 
.l7574:
1d87 : 2c 00 d6 BIT $d600 
1d8a : 10 fb __ BPL $1d87 ; (main.l7574 + 0)
.s96:
1d8c : 8e 01 d6 STX $d601 
1d8f : a9 00 __ LDA #$00
1d91 : 85 53 __ STA T0 + 0 
1d93 : ad 75 44 LDA $4475 ; (vdc_state + 3)
1d96 : 85 54 __ STA T1 + 0 
1d98 : ad 77 44 LDA $4477 ; (vdc_state + 5)
1d9b : 85 43 __ STA T3 + 0 
.l99:
1d9d : a5 53 __ LDA T0 + 0 
1d9f : c5 43 __ CMP T3 + 0 
1da1 : b0 03 __ BCS $1da6 ; (main.s29 + 0)
1da3 : 4c 6d 31 JMP $316d ; (main.s100 + 0)
.s29:
1da6 : 24 d7 __ BIT $d7 
1da8 : 30 17 __ BMI $1dc1 ; (main.s7601 + 0)
.s177:
1daa : a9 aa __ LDA #$aa
1dac : a0 02 __ LDY #$02
1dae : 91 23 __ STA (SP + 0),y 
1db0 : a9 38 __ LDA #$38
1db2 : c8 __ __ INY
1db3 : 91 23 __ STA (SP + 0),y 
1db5 : 20 4d 32 JSR $324d ; (printf.s1000 + 0)
1db8 : 20 d5 38 JSR $38d5 ; (getch.s0 + 0)
1dbb : 20 14 39 JSR $3914 ; (clrscr.s0 + 0)
1dbe : 20 18 39 JSR $3918 ; (screen_setmode.s0 + 0)
.s7601:
1dc1 : a5 ba __ LDA $ba 
1dc3 : d0 02 __ BNE $1dc7 ; (main.s185 + 0)
.s183:
1dc5 : a9 08 __ LDA #$08
.s185:
1dc7 : 85 53 __ STA T0 + 0 
1dc9 : 85 f7 __ STA $f7 ; (bootdevice + 0)
1dcb : a9 20 __ LDA #$20
1dcd : a0 02 __ LDY #$02
1dcf : 91 23 __ STA (SP + 0),y 
1dd1 : a9 39 __ LDA #$39
1dd3 : c8 __ __ INY
1dd4 : 91 23 __ STA (SP + 0),y 
1dd6 : a5 53 __ LDA T0 + 0 
1dd8 : c8 __ __ INY
1dd9 : 91 23 __ STA (SP + 0),y 
1ddb : a9 00 __ LDA #$00
1ddd : c8 __ __ INY
1dde : 91 23 __ STA (SP + 0),y 
1de0 : 20 4d 32 JSR $324d ; (printf.s1000 + 0)
1de3 : a9 06 __ LDA #$06
1de5 : 8d 06 d5 STA $d506 
1de8 : a9 30 __ LDA #$30
1dea : a0 02 __ LDY #$02
1dec : 91 23 __ STA (SP + 0),y 
1dee : a9 39 __ LDA #$39
1df0 : c8 __ __ INY
1df1 : 91 23 __ STA (SP + 0),y 
1df3 : 20 4d 32 JSR $324d ; (printf.s1000 + 0)
1df6 : a9 00 __ LDA #$00
1df8 : 85 0d __ STA P0 
1dfa : 85 0e __ STA P1 
1dfc : 20 4f 39 JSR $394f ; (krnio_setbnk.s0 + 0)
1dff : a9 4a __ LDA #$4a
1e01 : 85 0d __ STA P0 
1e03 : a9 39 __ LDA #$39
1e05 : 85 0e __ STA P1 
1e07 : 20 57 39 JSR $3957 ; (krnio_setnam.s0 + 0)
1e0a : a9 01 __ LDA #$01
1e0c : 85 0d __ STA P0 
1e0e : 85 0f __ STA P2 
1e10 : a5 53 __ LDA T0 + 0 
1e12 : 85 0e __ STA P1 
1e14 : 20 6d 39 JSR $396d ; (krnio_load.s0 + 0)
1e17 : 09 00 __ ORA #$00
1e19 : d0 11 __ BNE $1e2c ; (main.s192 + 0)
.s188:
1e1b : a9 8a __ LDA #$8a
1e1d : a0 02 __ LDY #$02
1e1f : 91 23 __ STA (SP + 0),y 
1e21 : a9 39 __ LDA #$39
1e23 : c8 __ __ INY
1e24 : 91 23 __ STA (SP + 0),y 
1e26 : 20 4d 32 JSR $324d ; (printf.s1000 + 0)
1e29 : 20 a8 39 JSR $39a8 ; (exit@proxy + 0)
.s192:
1e2c : a9 01 __ LDA #$01
1e2e : 8d 30 d0 STA $d030 
1e31 : a9 00 __ LDA #$00
1e33 : 85 16 __ STA P9 
1e35 : ad 11 d0 LDA $d011 
1e38 : 29 6f __ AND #$6f
1e3a : 8d 11 d0 STA $d011 
1e3d : 20 c5 39 JSR $39c5 ; (vdc_set_mode.s1000 + 0)
1e40 : ad 72 44 LDA $4472 ; (vdc_state + 0)
1e43 : c9 40 __ CMP #$40
1e45 : f0 03 __ BEQ $1e4a ; (main.s198 + 0)
1e47 : 4c 61 1f JMP $1f61 ; (main.s380 + 0)
.s198:
1e4a : ad 73 44 LDA $4473 ; (vdc_state + 1)
1e4d : f0 03 __ BEQ $1e52 ; (main.s202 + 0)
1e4f : 4c 61 1f JMP $1f61 ; (main.s380 + 0)
.s202:
1e52 : a9 22 __ LDA #$22
1e54 : 8d 00 d6 STA $d600 
.l7991:
1e57 : 2c 00 d6 BIT $d600 
1e5a : 10 fb __ BPL $1e57 ; (main.l7991 + 0)
.s210:
1e5c : a9 80 __ LDA #$80
1e5e : 8d 01 d6 STA $d601 
1e61 : a2 00 __ LDX #$00
1e63 : a0 ff __ LDY #$ff
.l213:
1e65 : a9 12 __ LDA #$12
1e67 : 8d 00 d6 STA $d600 
.l7993:
1e6a : 2c 00 d6 BIT $d600 
1e6d : 10 fb __ BPL $1e6a ; (main.l7993 + 0)
.s222:
1e6f : 8e 01 d6 STX $d601 
1e72 : a9 13 __ LDA #$13
1e74 : 8d 00 d6 STA $d600 
.l7995:
1e77 : 2c 00 d6 BIT $d600 
1e7a : 10 fb __ BPL $1e77 ; (main.l7995 + 0)
.s227:
1e7c : a9 00 __ LDA #$00
1e7e : 8d 01 d6 STA $d601 
1e81 : a9 1f __ LDA #$1f
1e83 : 8d 00 d6 STA $d600 
.l7997:
1e86 : 2c 00 d6 BIT $d600 
1e89 : 10 fb __ BPL $1e86 ; (main.l7997 + 0)
.s231:
1e8b : a9 00 __ LDA #$00
1e8d : 8d 01 d6 STA $d601 
1e90 : a9 18 __ LDA #$18
1e92 : 8d 00 d6 STA $d600 
.l7999:
1e95 : 2c 00 d6 BIT $d600 
1e98 : 10 fb __ BPL $1e95 ; (main.l7999 + 0)
.s237:
1e9a : ad 01 d6 LDA $d601 
1e9d : 29 7f __ AND #$7f
1e9f : 85 43 __ STA T3 + 0 
1ea1 : a9 18 __ LDA #$18
1ea3 : 8d 00 d6 STA $d600 
.l8001:
1ea6 : 2c 00 d6 BIT $d600 
1ea9 : 10 fb __ BPL $1ea6 ; (main.l8001 + 0)
.s243:
1eab : a5 43 __ LDA T3 + 0 
1ead : 8d 01 d6 STA $d601 
1eb0 : a9 1e __ LDA #$1e
1eb2 : 8d 00 d6 STA $d600 
.l8003:
1eb5 : 2c 00 d6 BIT $d600 
1eb8 : 10 fb __ BPL $1eb5 ; (main.l8003 + 0)
.s248:
1eba : a9 ff __ LDA #$ff
1ebc : 8d 01 d6 STA $d601 
1ebf : e8 __ __ INX
1ec0 : 88 __ __ DEY
1ec1 : d0 a2 __ BNE $1e65 ; (main.l213 + 0)
.s215:
1ec3 : a9 12 __ LDA #$12
1ec5 : 8d 00 d6 STA $d600 
.l8006:
1ec8 : 2c 00 d6 BIT $d600 
1ecb : 10 fb __ BPL $1ec8 ; (main.l8006 + 0)
.s255:
1ecd : 8e 01 d6 STX $d601 
1ed0 : a9 13 __ LDA #$13
1ed2 : 8d 00 d6 STA $d600 
.l8008:
1ed5 : 2c 00 d6 BIT $d600 
1ed8 : 10 fb __ BPL $1ed5 ; (main.l8008 + 0)
.s260:
1eda : 8c 01 d6 STY $d601 
1edd : a9 1f __ LDA #$1f
1edf : 8d 00 d6 STA $d600 
.l8010:
1ee2 : 2c 00 d6 BIT $d600 
1ee5 : 10 fb __ BPL $1ee2 ; (main.l8010 + 0)
.s264:
1ee7 : 8c 01 d6 STY $d601 
1eea : a9 18 __ LDA #$18
1eec : 8d 00 d6 STA $d600 
.l8012:
1eef : 2c 00 d6 BIT $d600 
1ef2 : 10 fb __ BPL $1eef ; (main.l8012 + 0)
.s270:
1ef4 : ad 01 d6 LDA $d601 
1ef7 : 29 7f __ AND #$7f
1ef9 : aa __ __ TAX
1efa : a9 18 __ LDA #$18
1efc : 8d 00 d6 STA $d600 
.l8014:
1eff : 2c 00 d6 BIT $d600 
1f02 : 10 fb __ BPL $1eff ; (main.l8014 + 0)
.s276:
1f04 : 8e 01 d6 STX $d601 
1f07 : a9 1e __ LDA #$1e
1f09 : 8d 00 d6 STA $d600 
.l8016:
1f0c : 2c 00 d6 BIT $d600 
1f0f : 10 fb __ BPL $1f0c ; (main.l8016 + 0)
.s281:
1f11 : a9 ff __ LDA #$ff
1f13 : 8d 01 d6 STA $d601 
1f16 : a9 1c __ LDA #$1c
1f18 : 8d 00 d6 STA $d600 
.l8018:
1f1b : 2c 00 d6 BIT $d600 
1f1e : 10 fb __ BPL $1f1b ; (main.l8018 + 0)
.s287:
1f20 : ad 01 d6 LDA $d601 
1f23 : 09 10 __ ORA #$10
1f25 : aa __ __ TAX
1f26 : a9 1c __ LDA #$1c
1f28 : 8d 00 d6 STA $d600 
.l8020:
1f2b : 2c 00 d6 BIT $d600 
1f2e : 10 fb __ BPL $1f2b ; (main.l8020 + 0)
.s293:
1f30 : 8e 01 d6 STX $d601 
1f33 : 20 69 3e JSR $3e69 ; (vdc_restore_charsets.s0 + 0)
1f36 : a9 00 __ LDA #$00
1f38 : 85 53 __ STA T0 + 0 
1f3a : ad 75 44 LDA $4475 ; (vdc_state + 3)
1f3d : 85 54 __ STA T1 + 0 
1f3f : ad 77 44 LDA $4477 ; (vdc_state + 5)
1f42 : 85 43 __ STA T3 + 0 
.l296:
1f44 : a5 53 __ LDA T0 + 0 
1f46 : c5 43 __ CMP T3 + 0 
1f48 : b0 03 __ BCS $1f4d ; (main.s294 + 0)
1f4a : 4c 8d 30 JMP $308d ; (main.s297 + 0)
.s294:
1f4d : a9 22 __ LDA #$22
1f4f : 8d 00 d6 STA $d600 
.l8046:
1f52 : 2c 00 d6 BIT $d600 
1f55 : 10 fb __ BPL $1f52 ; (main.l8046 + 0)
.s374:
1f57 : a9 7d __ LDA #$7d
1f59 : 8d 01 d6 STA $d601 
1f5c : a9 01 __ LDA #$01
1f5e : 8d 73 44 STA $4473 ; (vdc_state + 1)
.s380:
1f61 : a2 00 __ LDX #$00
.l1663:
1f63 : bd 6e 3e LDA $3e6e,x 
1f66 : e8 __ __ INX
1f67 : 09 00 __ ORA #$00
1f69 : d0 f8 __ BNE $1f63 ; (main.l1663 + 0)
.s1664:
1f6b : 86 54 __ STX T1 + 0 
1f6d : ad 7b 44 LDA $447b ; (vdc_state + 9)
1f70 : 85 45 __ STA T4 + 0 
1f72 : a9 12 __ LDA #$12
1f74 : 8d 00 d6 STA $d600 
1f77 : ac 7a 44 LDY $447a ; (vdc_state + 8)
.l7606:
1f7a : 2c 00 d6 BIT $d600 
1f7d : 10 fb __ BPL $1f7a ; (main.l7606 + 0)
.s388:
1f7f : a5 45 __ LDA T4 + 0 
1f81 : 8d 01 d6 STA $d601 
1f84 : a9 13 __ LDA #$13
1f86 : 8d 00 d6 STA $d600 
.l7608:
1f89 : 2c 00 d6 BIT $d600 
1f8c : 10 fb __ BPL $1f89 ; (main.l7608 + 0)
.s393:
1f8e : 8c 01 d6 STY $d601 
1f91 : a9 1f __ LDA #$1f
1f93 : 8d 00 d6 STA $d600 
1f96 : 8a __ __ TXA
1f97 : f0 46 __ BEQ $1fdf ; (main.s398 + 0)
.s1918:
1f99 : a2 00 __ LDX #$00
.l396:
1f9b : bd 6d 3e LDA $3e6d,x 
1f9e : c9 20 __ CMP #$20
1fa0 : b0 04 __ BCS $1fa6 ; (main.s402 + 0)
.s401:
1fa2 : 09 80 __ ORA #$80
1fa4 : 90 2b __ BCC $1fd1 ; (main.s1679 + 0)
.s402:
1fa6 : a8 __ __ TAY
1fa7 : c9 40 __ CMP #$40
1fa9 : 90 04 __ BCC $1faf ; (main.s405 + 0)
.s407:
1fab : c9 60 __ CMP #$60
1fad : 90 11 __ BCC $1fc0 ; (main.s404 + 0)
.s405:
1faf : c9 60 __ CMP #$60
1fb1 : 90 05 __ BCC $1fb8 ; (main.s409 + 0)
.s408:
1fb3 : e9 20 __ SBC #$20
1fb5 : 4c d1 1f JMP $1fd1 ; (main.s1679 + 0)
.s409:
1fb8 : c9 a0 __ CMP #$a0
1fba : 90 0a __ BCC $1fc6 ; (main.s417 + 0)
.s419:
1fbc : c9 c0 __ CMP #$c0
1fbe : b0 06 __ BCS $1fc6 ; (main.s417 + 0)
.s404:
1fc0 : 38 __ __ SEC
1fc1 : e9 40 __ SBC #$40
1fc3 : 4c d1 1f JMP $1fd1 ; (main.s1679 + 0)
.s417:
1fc6 : c9 c0 __ CMP #$c0
1fc8 : 90 08 __ BCC $1fd2 ; (main.l7612 + 0)
.s423:
1fca : c9 ff __ CMP #$ff
1fcc : b0 04 __ BCS $1fd2 ; (main.l7612 + 0)
.s420:
1fce : 38 __ __ SEC
1fcf : e9 80 __ SBC #$80
.s1679:
1fd1 : a8 __ __ TAY
.l7612:
1fd2 : 2c 00 d6 BIT $d600 
1fd5 : 10 fb __ BPL $1fd2 ; (main.l7612 + 0)
.s429:
1fd7 : 8c 01 d6 STY $d601 
1fda : e8 __ __ INX
1fdb : e4 54 __ CPX T1 + 0 
1fdd : 90 bc __ BCC $1f9b ; (main.l396 + 0)
.s398:
1fdf : ad 7d 44 LDA $447d ; (vdc_state + 11)
1fe2 : 85 45 __ STA T4 + 0 
1fe4 : a9 12 __ LDA #$12
1fe6 : 8d 00 d6 STA $d600 
1fe9 : c6 54 __ DEC T1 + 0 
1feb : ae 79 44 LDX $4479 ; (vdc_state + 7)
1fee : ac 7c 44 LDY $447c ; (vdc_state + 10)
.l7615:
1ff1 : 2c 00 d6 BIT $d600 
1ff4 : 10 fb __ BPL $1ff1 ; (main.l7615 + 0)
.s436:
1ff6 : a5 45 __ LDA T4 + 0 
1ff8 : 8d 01 d6 STA $d601 
1ffb : a9 13 __ LDA #$13
1ffd : 8d 00 d6 STA $d600 
.l7617:
2000 : 2c 00 d6 BIT $d600 
2003 : 10 fb __ BPL $2000 ; (main.l7617 + 0)
.s441:
2005 : 8c 01 d6 STY $d601 
2008 : a9 1f __ LDA #$1f
200a : 8d 00 d6 STA $d600 
.l7619:
200d : 2c 00 d6 BIT $d600 
2010 : 10 fb __ BPL $200d ; (main.l7619 + 0)
.s445:
2012 : 8e 01 d6 STX $d601 
2015 : a9 18 __ LDA #$18
2017 : 8d 00 d6 STA $d600 
.l7621:
201a : 2c 00 d6 BIT $d600 
201d : 10 fb __ BPL $201a ; (main.l7621 + 0)
.s451:
201f : ad 01 d6 LDA $d601 
2022 : 29 7f __ AND #$7f
2024 : aa __ __ TAX
2025 : a9 18 __ LDA #$18
2027 : 8d 00 d6 STA $d600 
.l7623:
202a : 2c 00 d6 BIT $d600 
202d : 10 fb __ BPL $202a ; (main.l7623 + 0)
.s457:
202f : 8e 01 d6 STX $d601 
2032 : a9 1e __ LDA #$1e
2034 : 8d 00 d6 STA $d600 
.l7625:
2037 : 2c 00 d6 BIT $d600 
203a : 10 fb __ BPL $2037 ; (main.l7625 + 0)
.s462:
203c : a5 54 __ LDA T1 + 0 
203e : 8d 01 d6 STA $d601 
2041 : ad 75 44 LDA $4475 ; (vdc_state + 3)
2044 : 0a __ __ ASL
2045 : 85 54 __ STA T1 + 0 
2047 : ad 76 44 LDA $4476 ; (vdc_state + 4)
204a : 2a __ __ ROL
204b : 85 55 __ STA T1 + 1 
204d : a2 00 __ LDX #$00
.l1665:
204f : bd 89 3e LDA $3e89,x 
2052 : e8 __ __ INX
2053 : 09 00 __ ORA #$00
2055 : d0 f8 __ BNE $204f ; (main.l1665 + 0)
.s1666:
2057 : 86 43 __ STX T3 + 0 
2059 : ad 7a 44 LDA $447a ; (vdc_state + 8)
205c : 18 __ __ CLC
205d : 65 54 __ ADC T1 + 0 
205f : a8 __ __ TAY
2060 : a9 12 __ LDA #$12
2062 : 8d 00 d6 STA $d600 
2065 : ad 7b 44 LDA $447b ; (vdc_state + 9)
2068 : 65 55 __ ADC T1 + 1 
.l7628:
206a : 2c 00 d6 BIT $d600 
206d : 10 fb __ BPL $206a ; (main.l7628 + 0)
.s476:
206f : 8d 01 d6 STA $d601 
2072 : a9 13 __ LDA #$13
2074 : 8d 00 d6 STA $d600 
.l7630:
2077 : 2c 00 d6 BIT $d600 
207a : 10 fb __ BPL $2077 ; (main.l7630 + 0)
.s481:
207c : 8c 01 d6 STY $d601 
207f : a9 1f __ LDA #$1f
2081 : 8d 00 d6 STA $d600 
2084 : 8a __ __ TXA
2085 : f0 46 __ BEQ $20cd ; (main.s486 + 0)
.s1907:
2087 : a2 00 __ LDX #$00
.l484:
2089 : bd 88 3e LDA $3e88,x 
208c : c9 20 __ CMP #$20
208e : b0 04 __ BCS $2094 ; (main.s490 + 0)
.s489:
2090 : 09 80 __ ORA #$80
2092 : 90 2b __ BCC $20bf ; (main.s1680 + 0)
.s490:
2094 : a8 __ __ TAY
2095 : c9 40 __ CMP #$40
2097 : 90 04 __ BCC $209d ; (main.s493 + 0)
.s495:
2099 : c9 60 __ CMP #$60
209b : 90 11 __ BCC $20ae ; (main.s492 + 0)
.s493:
209d : c9 60 __ CMP #$60
209f : 90 05 __ BCC $20a6 ; (main.s497 + 0)
.s496:
20a1 : e9 20 __ SBC #$20
20a3 : 4c bf 20 JMP $20bf ; (main.s1680 + 0)
.s497:
20a6 : c9 a0 __ CMP #$a0
20a8 : 90 0a __ BCC $20b4 ; (main.s505 + 0)
.s507:
20aa : c9 c0 __ CMP #$c0
20ac : b0 06 __ BCS $20b4 ; (main.s505 + 0)
.s492:
20ae : 38 __ __ SEC
20af : e9 40 __ SBC #$40
20b1 : 4c bf 20 JMP $20bf ; (main.s1680 + 0)
.s505:
20b4 : c9 c0 __ CMP #$c0
20b6 : 90 08 __ BCC $20c0 ; (main.l7634 + 0)
.s511:
20b8 : c9 ff __ CMP #$ff
20ba : b0 04 __ BCS $20c0 ; (main.l7634 + 0)
.s508:
20bc : 38 __ __ SEC
20bd : e9 80 __ SBC #$80
.s1680:
20bf : a8 __ __ TAY
.l7634:
20c0 : 2c 00 d6 BIT $d600 
20c3 : 10 fb __ BPL $20c0 ; (main.l7634 + 0)
.s517:
20c5 : 8c 01 d6 STY $d601 
20c8 : e8 __ __ INX
20c9 : e4 43 __ CPX T3 + 0 
20cb : 90 bc __ BCC $2089 ; (main.l484 + 0)
.s486:
20cd : a9 12 __ LDA #$12
20cf : 8d 00 d6 STA $d600 
20d2 : c6 43 __ DEC T3 + 0 
20d4 : ad 7c 44 LDA $447c ; (vdc_state + 10)
20d7 : 18 __ __ CLC
20d8 : 65 54 __ ADC T1 + 0 
20da : a8 __ __ TAY
20db : ad 7d 44 LDA $447d ; (vdc_state + 11)
20de : 65 55 __ ADC T1 + 1 
20e0 : ae 79 44 LDX $4479 ; (vdc_state + 7)
.l7637:
20e3 : 2c 00 d6 BIT $d600 
20e6 : 10 fb __ BPL $20e3 ; (main.l7637 + 0)
.s524:
20e8 : 8d 01 d6 STA $d601 
20eb : a9 13 __ LDA #$13
20ed : 8d 00 d6 STA $d600 
.l7639:
20f0 : 2c 00 d6 BIT $d600 
20f3 : 10 fb __ BPL $20f0 ; (main.l7639 + 0)
.s529:
20f5 : 8c 01 d6 STY $d601 
20f8 : a9 1f __ LDA #$1f
20fa : 8d 00 d6 STA $d600 
.l7641:
20fd : 2c 00 d6 BIT $d600 
2100 : 10 fb __ BPL $20fd ; (main.l7641 + 0)
.s533:
2102 : 8e 01 d6 STX $d601 
2105 : a9 18 __ LDA #$18
2107 : 8d 00 d6 STA $d600 
.l7643:
210a : 2c 00 d6 BIT $d600 
210d : 10 fb __ BPL $210a ; (main.l7643 + 0)
.s539:
210f : ad 01 d6 LDA $d601 
2112 : 29 7f __ AND #$7f
2114 : aa __ __ TAX
2115 : a9 18 __ LDA #$18
2117 : 8d 00 d6 STA $d600 
.l7645:
211a : 2c 00 d6 BIT $d600 
211d : 10 fb __ BPL $211a ; (main.l7645 + 0)
.s545:
211f : 8e 01 d6 STX $d601 
2122 : a9 1e __ LDA #$1e
2124 : 8d 00 d6 STA $d600 
.l7647:
2127 : 2c 00 d6 BIT $d600 
212a : 10 fb __ BPL $2127 ; (main.l7647 + 0)
.s550:
212c : a5 43 __ LDA T3 + 0 
212e : 8d 01 d6 STA $d601 
2131 : ad 75 44 LDA $4475 ; (vdc_state + 3)
2134 : 0a __ __ ASL
2135 : a8 __ __ TAY
2136 : ad 76 44 LDA $4476 ; (vdc_state + 4)
2139 : 2a __ __ ROL
213a : aa __ __ TAX
213b : 98 __ __ TYA
213c : 18 __ __ CLC
213d : 6d 75 44 ADC $4475 ; (vdc_state + 3)
2140 : 85 54 __ STA T1 + 0 
2142 : 8a __ __ TXA
2143 : 6d 76 44 ADC $4476 ; (vdc_state + 4)
2146 : 85 55 __ STA T1 + 1 
2148 : a2 00 __ LDX #$00
.l1667:
214a : bd 99 3e LDA $3e99,x 
214d : e8 __ __ INX
214e : 09 00 __ ORA #$00
2150 : d0 f8 __ BNE $214a ; (main.l1667 + 0)
.s1668:
2152 : 86 43 __ STX T3 + 0 
2154 : ad 7a 44 LDA $447a ; (vdc_state + 8)
2157 : 18 __ __ CLC
2158 : 65 54 __ ADC T1 + 0 
215a : a8 __ __ TAY
215b : a9 12 __ LDA #$12
215d : 8d 00 d6 STA $d600 
2160 : ad 7b 44 LDA $447b ; (vdc_state + 9)
2163 : 65 55 __ ADC T1 + 1 
.l7650:
2165 : 2c 00 d6 BIT $d600 
2168 : 10 fb __ BPL $2165 ; (main.l7650 + 0)
.s564:
216a : 8d 01 d6 STA $d601 
216d : a9 13 __ LDA #$13
216f : 8d 00 d6 STA $d600 
.l7652:
2172 : 2c 00 d6 BIT $d600 
2175 : 10 fb __ BPL $2172 ; (main.l7652 + 0)
.s569:
2177 : 8c 01 d6 STY $d601 
217a : a9 1f __ LDA #$1f
217c : 8d 00 d6 STA $d600 
217f : 8a __ __ TXA
2180 : f0 39 __ BEQ $21bb ; (main.s574 + 0)
.s1896:
2182 : a2 00 __ LDX #$00
.l572:
2184 : bd 98 3e LDA $3e98,x 
2187 : c9 20 __ CMP #$20
2189 : b0 04 __ BCS $218f ; (main.s578 + 0)
.s577:
218b : 09 80 __ ORA #$80
218d : 90 1e __ BCC $21ad ; (main.s1681 + 0)
.s578:
218f : c9 40 __ CMP #$40
2191 : b0 09 __ BCS $219c ; (main.s583 + 0)
.s581:
2193 : a8 __ __ TAY
2194 : c9 a0 __ CMP #$a0
2196 : 90 0a __ BCC $21a2 ; (main.s593 + 0)
.s595:
2198 : c9 c0 __ CMP #$c0
219a : b0 06 __ BCS $21a2 ; (main.s593 + 0)
.s583:
219c : 38 __ __ SEC
219d : e9 40 __ SBC #$40
219f : 4c ad 21 JMP $21ad ; (main.s1681 + 0)
.s593:
21a2 : c9 c0 __ CMP #$c0
21a4 : 90 08 __ BCC $21ae ; (main.l7656 + 0)
.s599:
21a6 : c9 ff __ CMP #$ff
21a8 : b0 04 __ BCS $21ae ; (main.l7656 + 0)
.s596:
21aa : 38 __ __ SEC
21ab : e9 80 __ SBC #$80
.s1681:
21ad : a8 __ __ TAY
.l7656:
21ae : 2c 00 d6 BIT $d600 
21b1 : 10 fb __ BPL $21ae ; (main.l7656 + 0)
.s605:
21b3 : 8c 01 d6 STY $d601 
21b6 : e8 __ __ INX
21b7 : e4 43 __ CPX T3 + 0 
21b9 : 90 c9 __ BCC $2184 ; (main.l572 + 0)
.s574:
21bb : a9 12 __ LDA #$12
21bd : 8d 00 d6 STA $d600 
21c0 : c6 43 __ DEC T3 + 0 
21c2 : ad 7c 44 LDA $447c ; (vdc_state + 10)
21c5 : 18 __ __ CLC
21c6 : 65 54 __ ADC T1 + 0 
21c8 : a8 __ __ TAY
21c9 : ad 7d 44 LDA $447d ; (vdc_state + 11)
21cc : 65 55 __ ADC T1 + 1 
21ce : ae 79 44 LDX $4479 ; (vdc_state + 7)
.l7659:
21d1 : 2c 00 d6 BIT $d600 
21d4 : 10 fb __ BPL $21d1 ; (main.l7659 + 0)
.s612:
21d6 : 8d 01 d6 STA $d601 
21d9 : a9 13 __ LDA #$13
21db : 8d 00 d6 STA $d600 
.l7661:
21de : 2c 00 d6 BIT $d600 
21e1 : 10 fb __ BPL $21de ; (main.l7661 + 0)
.s617:
21e3 : 8c 01 d6 STY $d601 
21e6 : a9 1f __ LDA #$1f
21e8 : 8d 00 d6 STA $d600 
.l7663:
21eb : 2c 00 d6 BIT $d600 
21ee : 10 fb __ BPL $21eb ; (main.l7663 + 0)
.s621:
21f0 : 8e 01 d6 STX $d601 
21f3 : a9 18 __ LDA #$18
21f5 : 8d 00 d6 STA $d600 
.l7665:
21f8 : 2c 00 d6 BIT $d600 
21fb : 10 fb __ BPL $21f8 ; (main.l7665 + 0)
.s627:
21fd : ad 01 d6 LDA $d601 
2200 : 29 7f __ AND #$7f
2202 : aa __ __ TAX
2203 : a9 18 __ LDA #$18
2205 : 8d 00 d6 STA $d600 
.l7667:
2208 : 2c 00 d6 BIT $d600 
220b : 10 fb __ BPL $2208 ; (main.l7667 + 0)
.s633:
220d : 8e 01 d6 STX $d601 
2210 : a9 1e __ LDA #$1e
2212 : 8d 00 d6 STA $d600 
.l7669:
2215 : 2c 00 d6 BIT $d600 
2218 : 10 fb __ BPL $2215 ; (main.l7669 + 0)
.s638:
221a : a5 43 __ LDA T3 + 0 
221c : 8d 01 d6 STA $d601 
221f : a5 f7 __ LDA $f7 ; (bootdevice + 0)
2221 : 85 0f __ STA P2 
2223 : a9 00 __ LDA #$00
2225 : 85 10 __ STA P3 
2227 : a9 50 __ LDA #$50
2229 : 85 11 __ STA P4 
222b : 20 00 13 JSR $1300 ; (bnk_load.s0 + 0)
222e : a5 1b __ LDA ACCU + 0 
2230 : f0 03 __ BEQ $2235 ; (main.s639 + 0)
2232 : 4c 36 23 JMP $2336 ; (main.s641 + 0)
.s639:
2235 : ad 75 44 LDA $4475 ; (vdc_state + 3)
2238 : 0a __ __ ASL
2239 : a8 __ __ TAY
223a : ad 76 44 LDA $4476 ; (vdc_state + 4)
223d : 2a __ __ ROL
223e : aa __ __ TAX
223f : 98 __ __ TYA
2240 : 18 __ __ CLC
2241 : 6d 75 44 ADC $4475 ; (vdc_state + 3)
2244 : 85 54 __ STA T1 + 0 
2246 : 8a __ __ TXA
2247 : 6d 76 44 ADC $4476 ; (vdc_state + 4)
224a : 06 54 __ ASL T1 + 0 
224c : 2a __ __ ROL
224d : 85 55 __ STA T1 + 1 
224f : a2 00 __ LDX #$00
.l1677:
2251 : bd a9 3e LDA $3ea9,x 
2254 : e8 __ __ INX
2255 : 09 00 __ ORA #$00
2257 : d0 f8 __ BNE $2251 ; (main.l1677 + 0)
.s1678:
2259 : 86 43 __ STX T3 + 0 
225b : ad 7a 44 LDA $447a ; (vdc_state + 8)
225e : 18 __ __ CLC
225f : 65 54 __ ADC T1 + 0 
2261 : a8 __ __ TAY
2262 : a9 12 __ LDA #$12
2264 : 8d 00 d6 STA $d600 
2267 : ad 7b 44 LDA $447b ; (vdc_state + 9)
226a : 65 55 __ ADC T1 + 1 
.l7970:
226c : 2c 00 d6 BIT $d600 
226f : 10 fb __ BPL $226c ; (main.l7970 + 0)
.s655:
2271 : 8d 01 d6 STA $d601 
2274 : a9 13 __ LDA #$13
2276 : 8d 00 d6 STA $d600 
.l7972:
2279 : 2c 00 d6 BIT $d600 
227c : 10 fb __ BPL $2279 ; (main.l7972 + 0)
.s660:
227e : 8c 01 d6 STY $d601 
2281 : a9 1f __ LDA #$1f
2283 : 8d 00 d6 STA $d600 
2286 : 8a __ __ TXA
2287 : f0 46 __ BEQ $22cf ; (main.s665 + 0)
.s1885:
2289 : a2 00 __ LDX #$00
.l663:
228b : bd a8 3e LDA $3ea8,x 
228e : c9 20 __ CMP #$20
2290 : b0 04 __ BCS $2296 ; (main.s669 + 0)
.s668:
2292 : 09 80 __ ORA #$80
2294 : 90 2b __ BCC $22c1 ; (main.s1686 + 0)
.s669:
2296 : a8 __ __ TAY
2297 : c9 40 __ CMP #$40
2299 : 90 04 __ BCC $229f ; (main.s672 + 0)
.s674:
229b : c9 60 __ CMP #$60
229d : 90 11 __ BCC $22b0 ; (main.s671 + 0)
.s672:
229f : c9 60 __ CMP #$60
22a1 : 90 05 __ BCC $22a8 ; (main.s676 + 0)
.s675:
22a3 : e9 20 __ SBC #$20
22a5 : 4c c1 22 JMP $22c1 ; (main.s1686 + 0)
.s676:
22a8 : c9 a0 __ CMP #$a0
22aa : 90 0a __ BCC $22b6 ; (main.s684 + 0)
.s686:
22ac : c9 c0 __ CMP #$c0
22ae : b0 06 __ BCS $22b6 ; (main.s684 + 0)
.s671:
22b0 : 38 __ __ SEC
22b1 : e9 40 __ SBC #$40
22b3 : 4c c1 22 JMP $22c1 ; (main.s1686 + 0)
.s684:
22b6 : c9 c0 __ CMP #$c0
22b8 : 90 08 __ BCC $22c2 ; (main.l7976 + 0)
.s690:
22ba : c9 ff __ CMP #$ff
22bc : b0 04 __ BCS $22c2 ; (main.l7976 + 0)
.s687:
22be : 38 __ __ SEC
22bf : e9 80 __ SBC #$80
.s1686:
22c1 : a8 __ __ TAY
.l7976:
22c2 : 2c 00 d6 BIT $d600 
22c5 : 10 fb __ BPL $22c2 ; (main.l7976 + 0)
.s696:
22c7 : 8c 01 d6 STY $d601 
22ca : e8 __ __ INX
22cb : e4 43 __ CPX T3 + 0 
22cd : 90 bc __ BCC $228b ; (main.l663 + 0)
.s665:
22cf : a9 12 __ LDA #$12
22d1 : 8d 00 d6 STA $d600 
22d4 : c6 43 __ DEC T3 + 0 
22d6 : ad 7c 44 LDA $447c ; (vdc_state + 10)
22d9 : 18 __ __ CLC
22da : 65 54 __ ADC T1 + 0 
22dc : a8 __ __ TAY
22dd : ad 7d 44 LDA $447d ; (vdc_state + 11)
22e0 : 65 55 __ ADC T1 + 1 
22e2 : ae 79 44 LDX $4479 ; (vdc_state + 7)
.l7979:
22e5 : 2c 00 d6 BIT $d600 
22e8 : 10 fb __ BPL $22e5 ; (main.l7979 + 0)
.s703:
22ea : 8d 01 d6 STA $d601 
22ed : a9 13 __ LDA #$13
22ef : 8d 00 d6 STA $d600 
.l7981:
22f2 : 2c 00 d6 BIT $d600 
22f5 : 10 fb __ BPL $22f2 ; (main.l7981 + 0)
.s708:
22f7 : 8c 01 d6 STY $d601 
22fa : a9 1f __ LDA #$1f
22fc : 8d 00 d6 STA $d600 
.l7983:
22ff : 2c 00 d6 BIT $d600 
2302 : 10 fb __ BPL $22ff ; (main.l7983 + 0)
.s712:
2304 : 8e 01 d6 STX $d601 
2307 : a9 18 __ LDA #$18
2309 : 8d 00 d6 STA $d600 
.l7985:
230c : 2c 00 d6 BIT $d600 
230f : 10 fb __ BPL $230c ; (main.l7985 + 0)
.s718:
2311 : ad 01 d6 LDA $d601 
2314 : 29 7f __ AND #$7f
2316 : aa __ __ TAX
2317 : a9 18 __ LDA #$18
2319 : 8d 00 d6 STA $d600 
.l7987:
231c : 2c 00 d6 BIT $d600 
231f : 10 fb __ BPL $231c ; (main.l7987 + 0)
.s724:
2321 : 8e 01 d6 STX $d601 
2324 : a9 1e __ LDA #$1e
2326 : 8d 00 d6 STA $d600 
.l7989:
2329 : 2c 00 d6 BIT $d600 
232c : 10 fb __ BPL $2329 ; (main.l7989 + 0)
.s729:
232e : a5 43 __ LDA T3 + 0 
2330 : 8d 01 d6 STA $d601 
2333 : 20 a8 39 JSR $39a8 ; (exit@proxy + 0)
.s641:
2336 : a9 00 __ LDA #$00
2338 : 85 53 __ STA T0 + 0 
233a : ad 75 44 LDA $4475 ; (vdc_state + 3)
233d : 85 54 __ STA T1 + 0 
233f : ad 77 44 LDA $4477 ; (vdc_state + 5)
2342 : 85 43 __ STA T3 + 0 
.l732:
2344 : a5 53 __ LDA T0 + 0 
2346 : c5 43 __ CMP T3 + 0 
2348 : b0 03 __ BCS $234d ; (main.s730 + 0)
234a : 4c ad 2f JMP $2fad ; (main.s733 + 0)
.s730:
234d : a9 00 __ LDA #$00
234f : 85 53 __ STA T0 + 0 
.l811:
2351 : ad 7b 44 LDA $447b ; (vdc_state + 9)
2354 : 85 43 __ STA T3 + 0 
2356 : a9 12 __ LDA #$12
2358 : 8d 00 d6 STA $d600 
235b : a9 00 __ LDA #$00
235d : 85 56 __ STA T2 + 0 
235f : 85 57 __ STA T8 + 0 
2361 : ac 7a 44 LDY $447a ; (vdc_state + 8)
.l7696:
2364 : 2c 00 d6 BIT $d600 
2367 : 10 fb __ BPL $2364 ; (main.l7696 + 0)
.s821:
2369 : a5 43 __ LDA T3 + 0 
236b : 8d 01 d6 STA $d601 
236e : a9 13 __ LDA #$13
2370 : 8d 00 d6 STA $d600 
.l7698:
2373 : 2c 00 d6 BIT $d600 
2376 : 10 fb __ BPL $2373 ; (main.l7698 + 0)
.s826:
2378 : 8c 01 d6 STY $d601 
237b : a9 1f __ LDA #$1f
237d : 8d 00 d6 STA $d600 
.l7700:
2380 : 2c 00 d6 BIT $d600 
2383 : 10 fb __ BPL $2380 ; (main.l7700 + 0)
.s830:
2385 : a9 20 __ LDA #$20
2387 : 8d 01 d6 STA $d601 
238a : a9 18 __ LDA #$18
238c : 8d 00 d6 STA $d600 
.l7702:
238f : 2c 00 d6 BIT $d600 
2392 : 10 fb __ BPL $238f ; (main.l7702 + 0)
.s836:
2394 : ad 01 d6 LDA $d601 
2397 : 29 7f __ AND #$7f
2399 : aa __ __ TAX
239a : a9 18 __ LDA #$18
239c : 8d 00 d6 STA $d600 
.l7704:
239f : 2c 00 d6 BIT $d600 
23a2 : 10 fb __ BPL $239f ; (main.l7704 + 0)
.s842:
23a4 : 8e 01 d6 STX $d601 
23a7 : a9 1e __ LDA #$1e
23a9 : 8d 00 d6 STA $d600 
.l7706:
23ac : 2c 00 d6 BIT $d600 
23af : 10 fb __ BPL $23ac ; (main.l7706 + 0)
.s847:
23b1 : a9 4e __ LDA #$4e
23b3 : 8d 01 d6 STA $d601 
23b6 : ad 7d 44 LDA $447d ; (vdc_state + 11)
23b9 : 85 47 __ STA T5 + 0 
23bb : a9 12 __ LDA #$12
23bd : 8d 00 d6 STA $d600 
23c0 : ae 7c 44 LDX $447c ; (vdc_state + 10)
.l7708:
23c3 : 2c 00 d6 BIT $d600 
23c6 : 10 fb __ BPL $23c3 ; (main.l7708 + 0)
.s854:
23c8 : a5 47 __ LDA T5 + 0 
23ca : 8d 01 d6 STA $d601 
23cd : a9 13 __ LDA #$13
23cf : 8d 00 d6 STA $d600 
.l7710:
23d2 : 2c 00 d6 BIT $d600 
23d5 : 10 fb __ BPL $23d2 ; (main.l7710 + 0)
.s859:
23d7 : 8e 01 d6 STX $d601 
23da : a9 1f __ LDA #$1f
23dc : 8d 00 d6 STA $d600 
.l7712:
23df : 2c 00 d6 BIT $d600 
23e2 : 10 fb __ BPL $23df ; (main.l7712 + 0)
.s863:
23e4 : a9 c5 __ LDA #$c5
23e6 : 8d 01 d6 STA $d601 
23e9 : a9 18 __ LDA #$18
23eb : 8d 00 d6 STA $d600 
.l7714:
23ee : 2c 00 d6 BIT $d600 
23f1 : 10 fb __ BPL $23ee ; (main.l7714 + 0)
.s869:
23f3 : ad 01 d6 LDA $d601 
23f6 : 29 7f __ AND #$7f
23f8 : aa __ __ TAX
23f9 : a9 18 __ LDA #$18
23fb : 8d 00 d6 STA $d600 
.l7716:
23fe : 2c 00 d6 BIT $d600 
2401 : 10 fb __ BPL $23fe ; (main.l7716 + 0)
.s875:
2403 : 8e 01 d6 STX $d601 
2406 : a9 1e __ LDA #$1e
2408 : 8d 00 d6 STA $d600 
.l7718:
240b : 2c 00 d6 BIT $d600 
240e : 10 fb __ BPL $240b ; (main.l7718 + 0)
.s880:
2410 : a9 4e __ LDA #$4e
2412 : 8d 01 d6 STA $d601 
2415 : ad 79 44 LDA $4479 ; (vdc_state + 7)
2418 : 29 f0 __ AND #$f0
241a : 09 45 __ ORA #$45
241c : 8d 79 44 STA $4479 ; (vdc_state + 7)
241f : a2 00 __ LDX #$00
.l1669:
2421 : bd b5 3e LDA $3eb5,x 
2424 : e8 __ __ INX
2425 : 09 00 __ ORA #$00
2427 : d0 f8 __ BNE $2421 ; (main.l1669 + 0)
.s1670:
2429 : 86 45 __ STX T4 + 0 
242b : a9 12 __ LDA #$12
242d : 8d 00 d6 STA $d600 
.l7721:
2430 : 2c 00 d6 BIT $d600 
2433 : 10 fb __ BPL $2430 ; (main.l7721 + 0)
.s896:
2435 : a5 43 __ LDA T3 + 0 
2437 : 8d 01 d6 STA $d601 
243a : a9 13 __ LDA #$13
243c : 8d 00 d6 STA $d600 
.l7723:
243f : 2c 00 d6 BIT $d600 
2442 : 10 fb __ BPL $243f ; (main.l7723 + 0)
.s901:
2444 : 8c 01 d6 STY $d601 
2447 : a9 1f __ LDA #$1f
2449 : 8d 00 d6 STA $d600 
244c : 8a __ __ TXA
244d : f0 46 __ BEQ $2495 ; (main.s906 + 0)
.s1860:
244f : a2 00 __ LDX #$00
.l904:
2451 : bd b4 3e LDA $3eb4,x 
2454 : c9 20 __ CMP #$20
2456 : b0 04 __ BCS $245c ; (main.s910 + 0)
.s909:
2458 : 09 80 __ ORA #$80
245a : 90 2b __ BCC $2487 ; (main.s1682 + 0)
.s910:
245c : a8 __ __ TAY
245d : c9 40 __ CMP #$40
245f : 90 04 __ BCC $2465 ; (main.s913 + 0)
.s915:
2461 : c9 60 __ CMP #$60
2463 : 90 11 __ BCC $2476 ; (main.s912 + 0)
.s913:
2465 : c9 60 __ CMP #$60
2467 : 90 05 __ BCC $246e ; (main.s917 + 0)
.s916:
2469 : e9 20 __ SBC #$20
246b : 4c 87 24 JMP $2487 ; (main.s1682 + 0)
.s917:
246e : c9 a0 __ CMP #$a0
2470 : 90 0a __ BCC $247c ; (main.s925 + 0)
.s927:
2472 : c9 c0 __ CMP #$c0
2474 : b0 06 __ BCS $247c ; (main.s925 + 0)
.s912:
2476 : 38 __ __ SEC
2477 : e9 40 __ SBC #$40
2479 : 4c 87 24 JMP $2487 ; (main.s1682 + 0)
.s925:
247c : c9 c0 __ CMP #$c0
247e : 90 08 __ BCC $2488 ; (main.l7727 + 0)
.s931:
2480 : c9 ff __ CMP #$ff
2482 : b0 04 __ BCS $2488 ; (main.l7727 + 0)
.s928:
2484 : 38 __ __ SEC
2485 : e9 80 __ SBC #$80
.s1682:
2487 : a8 __ __ TAY
.l7727:
2488 : 2c 00 d6 BIT $d600 
248b : 10 fb __ BPL $2488 ; (main.l7727 + 0)
.s937:
248d : 8c 01 d6 STY $d601 
2490 : e8 __ __ INX
2491 : e4 45 __ CPX T4 + 0 
2493 : 90 bc __ BCC $2451 ; (main.l904 + 0)
.s906:
2495 : a9 12 __ LDA #$12
2497 : 8d 00 d6 STA $d600 
249a : a6 45 __ LDX T4 + 0 
249c : ca __ __ DEX
249d : 86 43 __ STX T3 + 0 
249f : ad 7d 44 LDA $447d ; (vdc_state + 11)
24a2 : ae 79 44 LDX $4479 ; (vdc_state + 7)
24a5 : ac 7c 44 LDY $447c ; (vdc_state + 10)
.l7730:
24a8 : 2c 00 d6 BIT $d600 
24ab : 10 fb __ BPL $24a8 ; (main.l7730 + 0)
.s944:
24ad : 8d 01 d6 STA $d601 
24b0 : a9 13 __ LDA #$13
24b2 : 8d 00 d6 STA $d600 
.l7732:
24b5 : 2c 00 d6 BIT $d600 
24b8 : 10 fb __ BPL $24b5 ; (main.l7732 + 0)
.s949:
24ba : 8c 01 d6 STY $d601 
24bd : a9 1f __ LDA #$1f
24bf : 8d 00 d6 STA $d600 
.l7734:
24c2 : 2c 00 d6 BIT $d600 
24c5 : 10 fb __ BPL $24c2 ; (main.l7734 + 0)
.s953:
24c7 : 8e 01 d6 STX $d601 
24ca : a9 18 __ LDA #$18
24cc : 8d 00 d6 STA $d600 
.l7736:
24cf : 2c 00 d6 BIT $d600 
24d2 : 10 fb __ BPL $24cf ; (main.l7736 + 0)
.s959:
24d4 : ad 01 d6 LDA $d601 
24d7 : 29 7f __ AND #$7f
24d9 : a8 __ __ TAY
24da : a9 18 __ LDA #$18
24dc : 8d 00 d6 STA $d600 
.l7738:
24df : 2c 00 d6 BIT $d600 
24e2 : 10 fb __ BPL $24df ; (main.l7738 + 0)
.s965:
24e4 : 8c 01 d6 STY $d601 
24e7 : a9 1e __ LDA #$1e
24e9 : 8d 00 d6 STA $d600 
.l7740:
24ec : 2c 00 d6 BIT $d600 
24ef : 10 fb __ BPL $24ec ; (main.l7740 + 0)
.s970:
24f1 : a5 43 __ LDA T3 + 0 
24f3 : 8d 01 d6 STA $d601 
24f6 : 8a __ __ TXA
24f7 : 29 b0 __ AND #$b0
24f9 : 09 0d __ ORA #$0d
24fb : 8d 79 44 STA $4479 ; (vdc_state + 7)
24fe : a9 88 __ LDA #$88
2500 : a0 02 __ LDY #$02
2502 : 91 23 __ STA (SP + 0),y 
2504 : a9 44 __ LDA #$44
2506 : c8 __ __ INY
2507 : 91 23 __ STA (SP + 0),y 
2509 : a9 00 __ LDA #$00
250b : c8 __ __ INY
250c : 91 23 __ STA (SP + 0),y 
250e : a9 42 __ LDA #$42
2510 : c8 __ __ INY
2511 : 91 23 __ STA (SP + 0),y 
2513 : ad 72 44 LDA $4472 ; (vdc_state + 0)
2516 : c8 __ __ INY
2517 : 91 23 __ STA (SP + 0),y 
2519 : a9 00 __ LDA #$00
251b : c8 __ __ INY
251c : 91 23 __ STA (SP + 0),y 
251e : ad 75 44 LDA $4475 ; (vdc_state + 3)
2521 : 85 54 __ STA T1 + 0 
2523 : c8 __ __ INY
2524 : 91 23 __ STA (SP + 0),y 
2526 : ad 76 44 LDA $4476 ; (vdc_state + 4)
2529 : 85 55 __ STA T1 + 1 
252b : c8 __ __ INY
252c : 91 23 __ STA (SP + 0),y 
252e : ad 77 44 LDA $4477 ; (vdc_state + 5)
2531 : c8 __ __ INY
2532 : 91 23 __ STA (SP + 0),y 
2534 : ad 78 44 LDA $4478 ; (vdc_state + 6)
2537 : c8 __ __ INY
2538 : 91 23 __ STA (SP + 0),y 
253a : ad 73 44 LDA $4473 ; (vdc_state + 1)
253d : d0 07 __ BNE $2546 ; (main.s4144 + 0)
.s4145:
253f : a9 41 __ LDA #$41
2541 : a2 ef __ LDX #$ef
2543 : 4c 4a 25 JMP $254a ; (main.s4146 + 0)
.s4144:
2546 : a9 41 __ LDA #$41
2548 : a2 eb __ LDX #$eb
.s4146:
254a : 85 44 __ STA T3 + 1 
254c : 8a __ __ TXA
254d : a0 0c __ LDY #$0c
254f : 91 23 __ STA (SP + 0),y 
2551 : a5 44 __ LDA T3 + 1 
2553 : c8 __ __ INY
2554 : 91 23 __ STA (SP + 0),y 
2556 : 20 c5 3e JSR $3ec5 ; (sprintf.s1000 + 0)
2559 : 06 54 __ ASL T1 + 0 
255b : 26 55 __ ROL T1 + 1 
255d : a9 00 __ LDA #$00
255f : 85 43 __ STA T3 + 0 
2561 : ad 88 44 LDA $4488 ; (linebuffer + 0)
2564 : f0 0c __ BEQ $2572 ; (main.s979 + 0)
.s978:
2566 : a2 00 __ LDX #$00
.l1671:
2568 : bd 89 44 LDA $4489,x ; (linebuffer + 1)
256b : e8 __ __ INX
256c : 09 00 __ ORA #$00
256e : d0 f8 __ BNE $2568 ; (main.l1671 + 0)
.s1672:
2570 : 86 43 __ STX T3 + 0 
.s979:
2572 : ad 7a 44 LDA $447a ; (vdc_state + 8)
2575 : 18 __ __ CLC
2576 : 65 54 __ ADC T1 + 0 
2578 : aa __ __ TAX
2579 : a9 12 __ LDA #$12
257b : 8d 00 d6 STA $d600 
257e : ad 7b 44 LDA $447b ; (vdc_state + 9)
2581 : 65 55 __ ADC T1 + 1 
.l7745:
2583 : 2c 00 d6 BIT $d600 
2586 : 10 fb __ BPL $2583 ; (main.l7745 + 0)
.s986:
2588 : 8d 01 d6 STA $d601 
258b : a9 13 __ LDA #$13
258d : 8d 00 d6 STA $d600 
.l7747:
2590 : 2c 00 d6 BIT $d600 
2593 : 10 fb __ BPL $2590 ; (main.l7747 + 0)
.s991:
2595 : 8e 01 d6 STX $d601 
2598 : a9 1f __ LDA #$1f
259a : 8d 00 d6 STA $d600 
259d : a5 43 __ LDA T3 + 0 
259f : f0 62 __ BEQ $2603 ; (main.s996 + 0)
.s1849:
25a1 : a2 00 __ LDX #$00
.l994:
25a3 : bd 88 44 LDA $4488,x ; (linebuffer + 0)
25a6 : c9 20 __ CMP #$20
25a8 : b0 05 __ BCS $25af ; (main.s1000 + 0)
.s999:
25aa : 69 80 __ ADC #$80
25ac : 4c f5 25 JMP $25f5 ; (main.s1683 + 0)
.s1000:
25af : a8 __ __ TAY
25b0 : c9 40 __ CMP #$40
25b2 : 90 04 __ BCC $25b8 ; (main.s1003 + 0)
.s1005:
25b4 : c9 60 __ CMP #$60
25b6 : 90 23 __ BCC $25db ; (main.s1002 + 0)
.s1003:
25b8 : c9 60 __ CMP #$60
25ba : 90 0a __ BCC $25c6 ; (main.s1007 + 0)
.s1009:
25bc : 09 00 __ ORA #$00
25be : 30 06 __ BMI $25c6 ; (main.s1007 + 0)
.s1006:
25c0 : 38 __ __ SEC
25c1 : e9 20 __ SBC #$20
25c3 : 4c f5 25 JMP $25f5 ; (main.s1683 + 0)
.s1007:
25c6 : c9 80 __ CMP #$80
25c8 : 90 09 __ BCC $25d3 ; (main.s1011 + 0)
.s1013:
25ca : c9 a0 __ CMP #$a0
25cc : b0 05 __ BCS $25d3 ; (main.s1011 + 0)
.s1010:
25ce : 69 40 __ ADC #$40
25d0 : 4c f5 25 JMP $25f5 ; (main.s1683 + 0)
.s1011:
25d3 : c9 a0 __ CMP #$a0
25d5 : 90 0a __ BCC $25e1 ; (main.s1015 + 0)
.s1017:
25d7 : c9 c0 __ CMP #$c0
25d9 : b0 06 __ BCS $25e1 ; (main.s1015 + 0)
.s1002:
25db : 38 __ __ SEC
25dc : e9 40 __ SBC #$40
25de : 4c f5 25 JMP $25f5 ; (main.s1683 + 0)
.s1015:
25e1 : c9 c0 __ CMP #$c0
25e3 : 90 0a __ BCC $25ef ; (main.s1019 + 0)
.s1021:
25e5 : c9 ff __ CMP #$ff
25e7 : b0 06 __ BCS $25ef ; (main.s1019 + 0)
.s1018:
25e9 : 38 __ __ SEC
25ea : e9 80 __ SBC #$80
25ec : 4c f5 25 JMP $25f5 ; (main.s1683 + 0)
.s1019:
25ef : c9 ff __ CMP #$ff
25f1 : d0 03 __ BNE $25f6 ; (main.l7751 + 0)
.s1022:
25f3 : a9 5e __ LDA #$5e
.s1683:
25f5 : a8 __ __ TAY
.l7751:
25f6 : 2c 00 d6 BIT $d600 
25f9 : 10 fb __ BPL $25f6 ; (main.l7751 + 0)
.s1027:
25fb : 8c 01 d6 STY $d601 
25fe : e8 __ __ INX
25ff : e4 43 __ CPX T3 + 0 
2601 : 90 a0 __ BCC $25a3 ; (main.l994 + 0)
.s996:
2603 : a9 12 __ LDA #$12
2605 : 8d 00 d6 STA $d600 
2608 : c6 43 __ DEC T3 + 0 
260a : ad 7c 44 LDA $447c ; (vdc_state + 10)
260d : 18 __ __ CLC
260e : 65 54 __ ADC T1 + 0 
2610 : a8 __ __ TAY
2611 : ad 7d 44 LDA $447d ; (vdc_state + 11)
2614 : 65 55 __ ADC T1 + 1 
2616 : ae 79 44 LDX $4479 ; (vdc_state + 7)
.l7754:
2619 : 2c 00 d6 BIT $d600 
261c : 10 fb __ BPL $2619 ; (main.l7754 + 0)
.s1034:
261e : 8d 01 d6 STA $d601 
2621 : a9 13 __ LDA #$13
2623 : 8d 00 d6 STA $d600 
.l7756:
2626 : 2c 00 d6 BIT $d600 
2629 : 10 fb __ BPL $2626 ; (main.l7756 + 0)
.s1039:
262b : 8c 01 d6 STY $d601 
262e : a9 1f __ LDA #$1f
2630 : 8d 00 d6 STA $d600 
.l7758:
2633 : 2c 00 d6 BIT $d600 
2636 : 10 fb __ BPL $2633 ; (main.l7758 + 0)
.s1043:
2638 : 8e 01 d6 STX $d601 
263b : a9 18 __ LDA #$18
263d : 8d 00 d6 STA $d600 
.l7760:
2640 : 2c 00 d6 BIT $d600 
2643 : 10 fb __ BPL $2640 ; (main.l7760 + 0)
.s1049:
2645 : ad 01 d6 LDA $d601 
2648 : 29 7f __ AND #$7f
264a : aa __ __ TAX
264b : a9 18 __ LDA #$18
264d : 8d 00 d6 STA $d600 
.l7762:
2650 : 2c 00 d6 BIT $d600 
2653 : 10 fb __ BPL $2650 ; (main.l7762 + 0)
.s1055:
2655 : 8e 01 d6 STX $d601 
2658 : a9 1e __ LDA #$1e
265a : 8d 00 d6 STA $d600 
.l7764:
265d : 2c 00 d6 BIT $d600 
2660 : 10 fb __ BPL $265d ; (main.l7764 + 0)
.s1060:
2662 : a5 43 __ LDA T3 + 0 
2664 : 8d 01 d6 STA $d601 
2667 : ad 75 44 LDA $4475 ; (vdc_state + 3)
266a : 0a __ __ ASL
266b : a8 __ __ TAY
266c : ad 76 44 LDA $4476 ; (vdc_state + 4)
266f : 2a __ __ ROL
2670 : aa __ __ TAX
2671 : 98 __ __ TYA
2672 : 18 __ __ CLC
2673 : 6d 75 44 ADC $4475 ; (vdc_state + 3)
2676 : 85 54 __ STA T1 + 0 
2678 : 8a __ __ TXA
2679 : 6d 76 44 ADC $4476 ; (vdc_state + 4)
267c : 85 55 __ STA T1 + 1 
267e : a2 00 __ LDX #$00
.l1673:
2680 : bd 3d 42 LDA $423d,x 
2683 : e8 __ __ INX
2684 : 09 00 __ ORA #$00
2686 : d0 f8 __ BNE $2680 ; (main.l1673 + 0)
.s1674:
2688 : 86 43 __ STX T3 + 0 
268a : ad 7a 44 LDA $447a ; (vdc_state + 8)
268d : 18 __ __ CLC
268e : 65 54 __ ADC T1 + 0 
2690 : a8 __ __ TAY
2691 : a9 12 __ LDA #$12
2693 : 8d 00 d6 STA $d600 
2696 : ad 7b 44 LDA $447b ; (vdc_state + 9)
2699 : 65 55 __ ADC T1 + 1 
.l7767:
269b : 2c 00 d6 BIT $d600 
269e : 10 fb __ BPL $269b ; (main.l7767 + 0)
.s1074:
26a0 : 8d 01 d6 STA $d601 
26a3 : a9 13 __ LDA #$13
26a5 : 8d 00 d6 STA $d600 
.l7769:
26a8 : 2c 00 d6 BIT $d600 
26ab : 10 fb __ BPL $26a8 ; (main.l7769 + 0)
.s1079:
26ad : 8c 01 d6 STY $d601 
26b0 : a9 1f __ LDA #$1f
26b2 : 8d 00 d6 STA $d600 
26b5 : 8a __ __ TXA
26b6 : f0 46 __ BEQ $26fe ; (main.s1084 + 0)
.s1838:
26b8 : a2 00 __ LDX #$00
.l1082:
26ba : bd 3c 42 LDA $423c,x 
26bd : c9 20 __ CMP #$20
26bf : b0 04 __ BCS $26c5 ; (main.s1088 + 0)
.s1087:
26c1 : 09 80 __ ORA #$80
26c3 : 90 2b __ BCC $26f0 ; (main.s1684 + 0)
.s1088:
26c5 : a8 __ __ TAY
26c6 : c9 40 __ CMP #$40
26c8 : 90 04 __ BCC $26ce ; (main.s1091 + 0)
.s1093:
26ca : c9 60 __ CMP #$60
26cc : 90 11 __ BCC $26df ; (main.s1090 + 0)
.s1091:
26ce : c9 60 __ CMP #$60
26d0 : 90 05 __ BCC $26d7 ; (main.s1095 + 0)
.s1094:
26d2 : e9 20 __ SBC #$20
26d4 : 4c f0 26 JMP $26f0 ; (main.s1684 + 0)
.s1095:
26d7 : c9 a0 __ CMP #$a0
26d9 : 90 0a __ BCC $26e5 ; (main.s1103 + 0)
.s1105:
26db : c9 c0 __ CMP #$c0
26dd : b0 06 __ BCS $26e5 ; (main.s1103 + 0)
.s1090:
26df : 38 __ __ SEC
26e0 : e9 40 __ SBC #$40
26e2 : 4c f0 26 JMP $26f0 ; (main.s1684 + 0)
.s1103:
26e5 : c9 c0 __ CMP #$c0
26e7 : 90 08 __ BCC $26f1 ; (main.l7773 + 0)
.s1109:
26e9 : c9 ff __ CMP #$ff
26eb : b0 04 __ BCS $26f1 ; (main.l7773 + 0)
.s1106:
26ed : 38 __ __ SEC
26ee : e9 80 __ SBC #$80
.s1684:
26f0 : a8 __ __ TAY
.l7773:
26f1 : 2c 00 d6 BIT $d600 
26f4 : 10 fb __ BPL $26f1 ; (main.l7773 + 0)
.s1115:
26f6 : 8c 01 d6 STY $d601 
26f9 : e8 __ __ INX
26fa : e4 43 __ CPX T3 + 0 
26fc : 90 bc __ BCC $26ba ; (main.l1082 + 0)
.s1084:
26fe : a9 12 __ LDA #$12
2700 : 8d 00 d6 STA $d600 
2703 : c6 43 __ DEC T3 + 0 
2705 : ad 7c 44 LDA $447c ; (vdc_state + 10)
2708 : 18 __ __ CLC
2709 : 65 54 __ ADC T1 + 0 
270b : a8 __ __ TAY
270c : ad 7d 44 LDA $447d ; (vdc_state + 11)
270f : 65 55 __ ADC T1 + 1 
2711 : ae 79 44 LDX $4479 ; (vdc_state + 7)
.l7776:
2714 : 2c 00 d6 BIT $d600 
2717 : 10 fb __ BPL $2714 ; (main.l7776 + 0)
.s1122:
2719 : 8d 01 d6 STA $d601 
271c : a9 13 __ LDA #$13
271e : 8d 00 d6 STA $d600 
.l7778:
2721 : 2c 00 d6 BIT $d600 
2724 : 10 fb __ BPL $2721 ; (main.l7778 + 0)
.s1127:
2726 : 8c 01 d6 STY $d601 
2729 : a9 1f __ LDA #$1f
272b : 8d 00 d6 STA $d600 
.l7780:
272e : 2c 00 d6 BIT $d600 
2731 : 10 fb __ BPL $272e ; (main.l7780 + 0)
.s1131:
2733 : 8e 01 d6 STX $d601 
2736 : a9 18 __ LDA #$18
2738 : 8d 00 d6 STA $d600 
.l7782:
273b : 2c 00 d6 BIT $d600 
273e : 10 fb __ BPL $273b ; (main.l7782 + 0)
.s1137:
2740 : ad 01 d6 LDA $d601 
2743 : 29 7f __ AND #$7f
2745 : aa __ __ TAX
2746 : a9 18 __ LDA #$18
2748 : 8d 00 d6 STA $d600 
.l7784:
274b : 2c 00 d6 BIT $d600 
274e : 10 fb __ BPL $274b ; (main.l7784 + 0)
.s1143:
2750 : 8e 01 d6 STX $d601 
2753 : a9 1e __ LDA #$1e
2755 : 8d 00 d6 STA $d600 
.l7786:
2758 : 2c 00 d6 BIT $d600 
275b : 10 fb __ BPL $2758 ; (main.l7786 + 0)
.s1148:
275d : a5 43 __ LDA T3 + 0 
275f : 8d 01 d6 STA $d601 
2762 : ad 75 44 LDA $4475 ; (vdc_state + 3)
2765 : 85 1b __ STA ACCU + 0 
2767 : ad 76 44 LDA $4476 ; (vdc_state + 4)
276a : 85 1c __ STA ACCU + 1 
276c : ad 77 44 LDA $4477 ; (vdc_state + 5)
276f : 38 __ __ SEC
2770 : e9 01 __ SBC #$01
2772 : 20 b5 42 JSR $42b5 ; (mul16by8 + 0)
2775 : a5 05 __ LDA WORK + 2 
2777 : 85 54 __ STA T1 + 0 
2779 : a5 06 __ LDA WORK + 3 
277b : 85 55 __ STA T1 + 1 
277d : a2 00 __ LDX #$00
.l1675:
277f : bd 72 42 LDA $4272,x 
2782 : e8 __ __ INX
2783 : 09 00 __ ORA #$00
2785 : d0 f8 __ BNE $277f ; (main.l1675 + 0)
.s1676:
2787 : 86 43 __ STX T3 + 0 
2789 : ad 7a 44 LDA $447a ; (vdc_state + 8)
278c : 18 __ __ CLC
278d : 65 05 __ ADC WORK + 2 
278f : a8 __ __ TAY
2790 : a9 12 __ LDA #$12
2792 : 8d 00 d6 STA $d600 
2795 : ad 7b 44 LDA $447b ; (vdc_state + 9)
2798 : 65 06 __ ADC WORK + 3 
.l7789:
279a : 2c 00 d6 BIT $d600 
279d : 10 fb __ BPL $279a ; (main.l7789 + 0)
.s1162:
279f : 8d 01 d6 STA $d601 
27a2 : a9 13 __ LDA #$13
27a4 : 8d 00 d6 STA $d600 
.l7791:
27a7 : 2c 00 d6 BIT $d600 
27aa : 10 fb __ BPL $27a7 ; (main.l7791 + 0)
.s1167:
27ac : 8c 01 d6 STY $d601 
27af : a9 1f __ LDA #$1f
27b1 : 8d 00 d6 STA $d600 
27b4 : 8a __ __ TXA
27b5 : f0 46 __ BEQ $27fd ; (main.s1172 + 0)
.s1827:
27b7 : a2 00 __ LDX #$00
.l1170:
27b9 : bd 71 42 LDA $4271,x 
27bc : c9 20 __ CMP #$20
27be : b0 04 __ BCS $27c4 ; (main.s1176 + 0)
.s1175:
27c0 : 09 80 __ ORA #$80
27c2 : 90 2b __ BCC $27ef ; (main.s1685 + 0)
.s1176:
27c4 : a8 __ __ TAY
27c5 : c9 40 __ CMP #$40
27c7 : 90 04 __ BCC $27cd ; (main.s1179 + 0)
.s1181:
27c9 : c9 60 __ CMP #$60
27cb : 90 11 __ BCC $27de ; (main.s1178 + 0)
.s1179:
27cd : c9 60 __ CMP #$60
27cf : 90 05 __ BCC $27d6 ; (main.s1183 + 0)
.s1182:
27d1 : e9 20 __ SBC #$20
27d3 : 4c ef 27 JMP $27ef ; (main.s1685 + 0)
.s1183:
27d6 : c9 a0 __ CMP #$a0
27d8 : 90 0a __ BCC $27e4 ; (main.s1191 + 0)
.s1193:
27da : c9 c0 __ CMP #$c0
27dc : b0 06 __ BCS $27e4 ; (main.s1191 + 0)
.s1178:
27de : 38 __ __ SEC
27df : e9 40 __ SBC #$40
27e1 : 4c ef 27 JMP $27ef ; (main.s1685 + 0)
.s1191:
27e4 : c9 c0 __ CMP #$c0
27e6 : 90 08 __ BCC $27f0 ; (main.l7795 + 0)
.s1197:
27e8 : c9 ff __ CMP #$ff
27ea : b0 04 __ BCS $27f0 ; (main.l7795 + 0)
.s1194:
27ec : 38 __ __ SEC
27ed : e9 80 __ SBC #$80
.s1685:
27ef : a8 __ __ TAY
.l7795:
27f0 : 2c 00 d6 BIT $d600 
27f3 : 10 fb __ BPL $27f0 ; (main.l7795 + 0)
.s1203:
27f5 : 8c 01 d6 STY $d601 
27f8 : e8 __ __ INX
27f9 : e4 43 __ CPX T3 + 0 
27fb : 90 bc __ BCC $27b9 ; (main.l1170 + 0)
.s1172:
27fd : a9 12 __ LDA #$12
27ff : 8d 00 d6 STA $d600 
2802 : c6 43 __ DEC T3 + 0 
2804 : 18 __ __ CLC
2805 : a5 54 __ LDA T1 + 0 
2807 : 6d 7c 44 ADC $447c ; (vdc_state + 10)
280a : a8 __ __ TAY
280b : a5 55 __ LDA T1 + 1 
280d : 6d 7d 44 ADC $447d ; (vdc_state + 11)
2810 : ae 79 44 LDX $4479 ; (vdc_state + 7)
.l7798:
2813 : 2c 00 d6 BIT $d600 
2816 : 10 fb __ BPL $2813 ; (main.l7798 + 0)
.s1210:
2818 : 8d 01 d6 STA $d601 
281b : a9 13 __ LDA #$13
281d : 8d 00 d6 STA $d600 
.l7800:
2820 : 2c 00 d6 BIT $d600 
2823 : 10 fb __ BPL $2820 ; (main.l7800 + 0)
.s1215:
2825 : 8c 01 d6 STY $d601 
2828 : a9 1f __ LDA #$1f
282a : 8d 00 d6 STA $d600 
.l7802:
282d : 2c 00 d6 BIT $d600 
2830 : 10 fb __ BPL $282d ; (main.l7802 + 0)
.s1219:
2832 : 8e 01 d6 STX $d601 
2835 : a9 18 __ LDA #$18
2837 : 8d 00 d6 STA $d600 
.l7804:
283a : 2c 00 d6 BIT $d600 
283d : 10 fb __ BPL $283a ; (main.l7804 + 0)
.s1225:
283f : ad 01 d6 LDA $d601 
2842 : 29 7f __ AND #$7f
2844 : aa __ __ TAX
2845 : a9 18 __ LDA #$18
2847 : 8d 00 d6 STA $d600 
.l7806:
284a : 2c 00 d6 BIT $d600 
284d : 10 fb __ BPL $284a ; (main.l7806 + 0)
.s1231:
284f : 8e 01 d6 STX $d601 
2852 : a9 1e __ LDA #$1e
2854 : 8d 00 d6 STA $d600 
.l7808:
2857 : 2c 00 d6 BIT $d600 
285a : 10 fb __ BPL $2857 ; (main.l7808 + 0)
.s1236:
285c : a5 43 __ LDA T3 + 0 
285e : 8d 01 d6 STA $d601 
2861 : ad 75 44 LDA $4475 ; (vdc_state + 3)
2864 : 0a __ __ ASL
2865 : 85 54 __ STA T1 + 0 
2867 : a9 12 __ LDA #$12
2869 : 8d 00 d6 STA $d600 
286c : ad 76 44 LDA $4476 ; (vdc_state + 4)
286f : 2a __ __ ROL
2870 : 06 54 __ ASL T1 + 0 
2872 : 2a __ __ ROL
2873 : aa __ __ TAX
2874 : 18 __ __ CLC
2875 : a5 54 __ LDA T1 + 0 
2877 : 69 04 __ ADC #$04
2879 : a8 __ __ TAY
287a : 8a __ __ TXA
287b : 69 00 __ ADC #$00
287d : 85 48 __ STA T5 + 1 
287f : 98 __ __ TYA
2880 : 18 __ __ CLC
2881 : 6d 7a 44 ADC $447a ; (vdc_state + 8)
2884 : 85 49 __ STA T6 + 0 
2886 : a5 48 __ LDA T5 + 1 
2888 : 6d 7b 44 ADC $447b ; (vdc_state + 9)
.l7810:
288b : 2c 00 d6 BIT $d600 
288e : 10 fb __ BPL $288b ; (main.l7810 + 0)
.s1246:
2890 : 8d 01 d6 STA $d601 
2893 : a9 13 __ LDA #$13
2895 : 8d 00 d6 STA $d600 
.l7812:
2898 : 2c 00 d6 BIT $d600 
289b : 10 fb __ BPL $2898 ; (main.l7812 + 0)
.s1251:
289d : a5 49 __ LDA T6 + 0 
289f : 8d 01 d6 STA $d601 
28a2 : a9 1f __ LDA #$1f
28a4 : 8d 00 d6 STA $d600 
.l7814:
28a7 : 2c 00 d6 BIT $d600 
28aa : 10 fb __ BPL $28a7 ; (main.l7814 + 0)
.s1255:
28ac : a9 6c __ LDA #$6c
28ae : 8d 01 d6 STA $d601 
28b1 : a9 12 __ LDA #$12
28b3 : 8d 00 d6 STA $d600 
28b6 : 98 __ __ TYA
28b7 : 18 __ __ CLC
28b8 : 6d 7c 44 ADC $447c ; (vdc_state + 10)
28bb : a8 __ __ TAY
28bc : a5 48 __ LDA T5 + 1 
28be : 6d 7d 44 ADC $447d ; (vdc_state + 11)
.l7816:
28c1 : 2c 00 d6 BIT $d600 
28c4 : 10 fb __ BPL $28c1 ; (main.l7816 + 0)
.s1262:
28c6 : 8d 01 d6 STA $d601 
28c9 : a9 13 __ LDA #$13
28cb : 8d 00 d6 STA $d600 
.l7818:
28ce : 2c 00 d6 BIT $d600 
28d1 : 10 fb __ BPL $28ce ; (main.l7818 + 0)
.s1267:
28d3 : 8c 01 d6 STY $d601 
28d6 : a9 1f __ LDA #$1f
28d8 : 8d 00 d6 STA $d600 
.l7820:
28db : 2c 00 d6 BIT $d600 
28de : 10 fb __ BPL $28db ; (main.l7820 + 0)
.s1271:
28e0 : a9 09 __ LDA #$09
28e2 : 8d 01 d6 STA $d601 
28e5 : a9 12 __ LDA #$12
28e7 : 8d 00 d6 STA $d600 
28ea : 18 __ __ CLC
28eb : a5 54 __ LDA T1 + 0 
28ed : 69 05 __ ADC #$05
28ef : a8 __ __ TAY
28f0 : 8a __ __ TXA
28f1 : 69 00 __ ADC #$00
28f3 : 85 48 __ STA T5 + 1 
28f5 : 98 __ __ TYA
28f6 : 18 __ __ CLC
28f7 : 6d 7a 44 ADC $447a ; (vdc_state + 8)
28fa : 85 49 __ STA T6 + 0 
28fc : a5 48 __ LDA T5 + 1 
28fe : 6d 7b 44 ADC $447b ; (vdc_state + 9)
.l7822:
2901 : 2c 00 d6 BIT $d600 
2904 : 10 fb __ BPL $2901 ; (main.l7822 + 0)
.s1281:
2906 : 8d 01 d6 STA $d601 
2909 : a9 13 __ LDA #$13
290b : 8d 00 d6 STA $d600 
.l7824:
290e : 2c 00 d6 BIT $d600 
2911 : 10 fb __ BPL $290e ; (main.l7824 + 0)
.s1286:
2913 : a5 49 __ LDA T6 + 0 
2915 : 8d 01 d6 STA $d601 
2918 : a9 1f __ LDA #$1f
291a : 8d 00 d6 STA $d600 
.l7826:
291d : 2c 00 d6 BIT $d600 
2920 : 10 fb __ BPL $291d ; (main.l7826 + 0)
.s1290:
2922 : a9 62 __ LDA #$62
2924 : 8d 01 d6 STA $d601 
2927 : a9 18 __ LDA #$18
2929 : 8d 00 d6 STA $d600 
.l7828:
292c : 2c 00 d6 BIT $d600 
292f : 10 fb __ BPL $292c ; (main.l7828 + 0)
.s1296:
2931 : ad 01 d6 LDA $d601 
2934 : 29 7f __ AND #$7f
2936 : 85 49 __ STA T6 + 0 
2938 : a9 18 __ LDA #$18
293a : 8d 00 d6 STA $d600 
.l7830:
293d : 2c 00 d6 BIT $d600 
2940 : 10 fb __ BPL $293d ; (main.l7830 + 0)
.s1302:
2942 : a5 49 __ LDA T6 + 0 
2944 : 8d 01 d6 STA $d601 
2947 : a9 1e __ LDA #$1e
2949 : 8d 00 d6 STA $d600 
.l7832:
294c : 2c 00 d6 BIT $d600 
294f : 10 fb __ BPL $294c ; (main.l7832 + 0)
.s1307:
2951 : a9 45 __ LDA #$45
2953 : 8d 01 d6 STA $d601 
2956 : a9 12 __ LDA #$12
2958 : 8d 00 d6 STA $d600 
295b : 98 __ __ TYA
295c : 18 __ __ CLC
295d : 6d 7c 44 ADC $447c ; (vdc_state + 10)
2960 : a8 __ __ TAY
2961 : a5 48 __ LDA T5 + 1 
2963 : 6d 7d 44 ADC $447d ; (vdc_state + 11)
.l7834:
2966 : 2c 00 d6 BIT $d600 
2969 : 10 fb __ BPL $2966 ; (main.l7834 + 0)
.s1314:
296b : 8d 01 d6 STA $d601 
296e : a9 13 __ LDA #$13
2970 : 8d 00 d6 STA $d600 
.l7836:
2973 : 2c 00 d6 BIT $d600 
2976 : 10 fb __ BPL $2973 ; (main.l7836 + 0)
.s1319:
2978 : 8c 01 d6 STY $d601 
297b : a9 1f __ LDA #$1f
297d : 8d 00 d6 STA $d600 
.l7838:
2980 : 2c 00 d6 BIT $d600 
2983 : 10 fb __ BPL $2980 ; (main.l7838 + 0)
.s1323:
2985 : a9 09 __ LDA #$09
2987 : 8d 01 d6 STA $d601 
298a : a9 18 __ LDA #$18
298c : 8d 00 d6 STA $d600 
.l7840:
298f : 2c 00 d6 BIT $d600 
2992 : 10 fb __ BPL $298f ; (main.l7840 + 0)
.s1329:
2994 : ad 01 d6 LDA $d601 
2997 : 29 7f __ AND #$7f
2999 : a8 __ __ TAY
299a : a9 18 __ LDA #$18
299c : 8d 00 d6 STA $d600 
.l7842:
299f : 2c 00 d6 BIT $d600 
29a2 : 10 fb __ BPL $299f ; (main.l7842 + 0)
.s1335:
29a4 : 8c 01 d6 STY $d601 
29a7 : a9 1e __ LDA #$1e
29a9 : 8d 00 d6 STA $d600 
.l7844:
29ac : 2c 00 d6 BIT $d600 
29af : 10 fb __ BPL $29ac ; (main.l7844 + 0)
.s1340:
29b1 : a9 45 __ LDA #$45
29b3 : 8d 01 d6 STA $d601 
29b6 : a9 12 __ LDA #$12
29b8 : 8d 00 d6 STA $d600 
29bb : 18 __ __ CLC
29bc : a5 54 __ LDA T1 + 0 
29be : 69 4b __ ADC #$4b
29c0 : a8 __ __ TAY
29c1 : 90 01 __ BCC $29c4 ; (main.s1699 + 0)
.s1698:
29c3 : e8 __ __ INX
.s1699:
29c4 : 18 __ __ CLC
29c5 : 6d 7a 44 ADC $447a ; (vdc_state + 8)
29c8 : 85 43 __ STA T3 + 0 
29ca : 8a __ __ TXA
29cb : 6d 7b 44 ADC $447b ; (vdc_state + 9)
.l7846:
29ce : 2c 00 d6 BIT $d600 
29d1 : 10 fb __ BPL $29ce ; (main.l7846 + 0)
.s1350:
29d3 : 8d 01 d6 STA $d601 
29d6 : a9 13 __ LDA #$13
29d8 : 8d 00 d6 STA $d600 
.l7848:
29db : 2c 00 d6 BIT $d600 
29de : 10 fb __ BPL $29db ; (main.l7848 + 0)
.s1355:
29e0 : a5 43 __ LDA T3 + 0 
29e2 : 8d 01 d6 STA $d601 
29e5 : a9 1f __ LDA #$1f
29e7 : 8d 00 d6 STA $d600 
.l7850:
29ea : 2c 00 d6 BIT $d600 
29ed : 10 fb __ BPL $29ea ; (main.l7850 + 0)
.s1359:
29ef : a9 7b __ LDA #$7b
29f1 : 8d 01 d6 STA $d601 
29f4 : a9 12 __ LDA #$12
29f6 : 8d 00 d6 STA $d600 
29f9 : 98 __ __ TYA
29fa : 18 __ __ CLC
29fb : 6d 7c 44 ADC $447c ; (vdc_state + 10)
29fe : a8 __ __ TAY
29ff : 8a __ __ TXA
2a00 : 6d 7d 44 ADC $447d ; (vdc_state + 11)
.l7852:
2a03 : 2c 00 d6 BIT $d600 
2a06 : 10 fb __ BPL $2a03 ; (main.l7852 + 0)
.s1366:
2a08 : 8d 01 d6 STA $d601 
2a0b : a9 13 __ LDA #$13
2a0d : 8d 00 d6 STA $d600 
.l7854:
2a10 : 2c 00 d6 BIT $d600 
2a13 : 10 fb __ BPL $2a10 ; (main.l7854 + 0)
.s1371:
2a15 : 8c 01 d6 STY $d601 
2a18 : a9 1f __ LDA #$1f
2a1a : 8d 00 d6 STA $d600 
.l7856:
2a1d : 2c 00 d6 BIT $d600 
2a20 : 10 fb __ BPL $2a1d ; (main.l7856 + 0)
.s1375:
2a22 : a9 09 __ LDA #$09
2a24 : 8d 01 d6 STA $d601 
2a27 : ad 77 44 LDA $4477 ; (vdc_state + 5)
2a2a : 38 __ __ SEC
2a2b : e9 07 __ SBC #$07
2a2d : 85 54 __ STA T1 + 0 
2a2f : a9 05 __ LDA #$05
2a31 : 85 58 __ STA T9 + 0 
.l1377:
2a33 : 18 __ __ CLC
2a34 : a5 54 __ LDA T1 + 0 
2a36 : 69 05 __ ADC #$05
2a38 : 90 03 __ BCC $2a3d ; (main.s1139 + 0)
2a3a : 4c 22 2f JMP $2f22 ; (main.s1378 + 0)
.s1139:
2a3d : c5 58 __ CMP T9 + 0 
2a3f : 90 05 __ BCC $2a46 ; (main.s1376 + 0)
.s1700:
2a41 : f0 03 __ BEQ $2a46 ; (main.s1376 + 0)
2a43 : 4c 22 2f JMP $2f22 ; (main.s1378 + 0)
.s1376:
2a46 : ad 77 44 LDA $4477 ; (vdc_state + 5)
2a49 : 38 __ __ SEC
2a4a : e9 07 __ SBC #$07
2a4c : 85 54 __ STA T1 + 0 
2a4e : a9 05 __ LDA #$05
2a50 : 85 58 __ STA T9 + 0 
.l1417:
2a52 : 18 __ __ CLC
2a53 : a5 54 __ LDA T1 + 0 
2a55 : 69 05 __ ADC #$05
2a57 : 85 47 __ STA T5 + 0 
2a59 : ad 7a 44 LDA $447a ; (vdc_state + 8)
2a5c : 85 45 __ STA T4 + 0 
2a5e : ad 7b 44 LDA $447b ; (vdc_state + 9)
2a61 : 85 46 __ STA T4 + 1 
2a63 : 90 03 __ BCC $2a68 ; (main.s1125 + 0)
2a65 : 4c 99 2e JMP $2e99 ; (main.s1418 + 0)
.s1125:
2a68 : a5 58 __ LDA T9 + 0 
2a6a : c5 47 __ CMP T5 + 0 
2a6c : b0 03 __ BCS $2a71 ; (main.s1416 + 0)
2a6e : 4c 99 2e JMP $2e99 ; (main.s1418 + 0)
.s1416:
2a71 : a9 12 __ LDA #$12
2a73 : 8d 00 d6 STA $d600 
2a76 : ad 75 44 LDA $4475 ; (vdc_state + 3)
2a79 : 85 1b __ STA ACCU + 0 
2a7b : ad 76 44 LDA $4476 ; (vdc_state + 4)
2a7e : 85 1c __ STA ACCU + 1 
2a80 : ad 77 44 LDA $4477 ; (vdc_state + 5)
2a83 : 85 54 __ STA T1 + 0 
2a85 : e9 02 __ SBC #$02
2a87 : 20 b5 42 JSR $42b5 ; (mul16by8 + 0)
2a8a : 18 __ __ CLC
2a8b : a5 05 __ LDA WORK + 2 
2a8d : 69 04 __ ADC #$04
2a8f : aa __ __ TAX
2a90 : a5 06 __ LDA WORK + 3 
2a92 : 69 00 __ ADC #$00
2a94 : a8 __ __ TAY
2a95 : 8a __ __ TXA
2a96 : 18 __ __ CLC
2a97 : 65 45 __ ADC T4 + 0 
2a99 : 85 49 __ STA T6 + 0 
2a9b : 98 __ __ TYA
2a9c : 65 46 __ ADC T4 + 1 
.l7884:
2a9e : 2c 00 d6 BIT $d600 
2aa1 : 10 fb __ BPL $2a9e ; (main.l7884 + 0)
.s1465:
2aa3 : 8d 01 d6 STA $d601 
2aa6 : a9 13 __ LDA #$13
2aa8 : 8d 00 d6 STA $d600 
.l7886:
2aab : 2c 00 d6 BIT $d600 
2aae : 10 fb __ BPL $2aab ; (main.l7886 + 0)
.s1470:
2ab0 : a5 49 __ LDA T6 + 0 
2ab2 : 8d 01 d6 STA $d601 
2ab5 : a9 1f __ LDA #$1f
2ab7 : 8d 00 d6 STA $d600 
.l7888:
2aba : 2c 00 d6 BIT $d600 
2abd : 10 fb __ BPL $2aba ; (main.l7888 + 0)
.s1474:
2abf : a9 7c __ LDA #$7c
2ac1 : 8d 01 d6 STA $d601 
2ac4 : a9 12 __ LDA #$12
2ac6 : 8d 00 d6 STA $d600 
2ac9 : 8a __ __ TXA
2aca : 18 __ __ CLC
2acb : 6d 7c 44 ADC $447c ; (vdc_state + 10)
2ace : aa __ __ TAX
2acf : 98 __ __ TYA
2ad0 : 6d 7d 44 ADC $447d ; (vdc_state + 11)
.l7890:
2ad3 : 2c 00 d6 BIT $d600 
2ad6 : 10 fb __ BPL $2ad3 ; (main.l7890 + 0)
.s1481:
2ad8 : 8d 01 d6 STA $d601 
2adb : a9 13 __ LDA #$13
2add : 8d 00 d6 STA $d600 
.l7892:
2ae0 : 2c 00 d6 BIT $d600 
2ae3 : 10 fb __ BPL $2ae0 ; (main.l7892 + 0)
.s1486:
2ae5 : 8e 01 d6 STX $d601 
2ae8 : a9 1f __ LDA #$1f
2aea : 8d 00 d6 STA $d600 
.l7894:
2aed : 2c 00 d6 BIT $d600 
2af0 : 10 fb __ BPL $2aed ; (main.l7894 + 0)
.s1490:
2af2 : a9 09 __ LDA #$09
2af4 : 8d 01 d6 STA $d601 
2af7 : a9 12 __ LDA #$12
2af9 : 8d 00 d6 STA $d600 
2afc : 18 __ __ CLC
2afd : a5 05 __ LDA WORK + 2 
2aff : 69 05 __ ADC #$05
2b01 : aa __ __ TAX
2b02 : a5 06 __ LDA WORK + 3 
2b04 : 69 00 __ ADC #$00
2b06 : a8 __ __ TAY
2b07 : 8a __ __ TXA
2b08 : 18 __ __ CLC
2b09 : 65 45 __ ADC T4 + 0 
2b0b : 85 4b __ STA T7 + 0 
2b0d : 98 __ __ TYA
2b0e : 65 46 __ ADC T4 + 1 
.l7896:
2b10 : 2c 00 d6 BIT $d600 
2b13 : 10 fb __ BPL $2b10 ; (main.l7896 + 0)
.s1500:
2b15 : 8d 01 d6 STA $d601 
2b18 : a9 13 __ LDA #$13
2b1a : 8d 00 d6 STA $d600 
.l7898:
2b1d : 2c 00 d6 BIT $d600 
2b20 : 10 fb __ BPL $2b1d ; (main.l7898 + 0)
.s1505:
2b22 : a5 4b __ LDA T7 + 0 
2b24 : 8d 01 d6 STA $d601 
2b27 : a9 1f __ LDA #$1f
2b29 : 8d 00 d6 STA $d600 
.l7900:
2b2c : 2c 00 d6 BIT $d600 
2b2f : 10 fb __ BPL $2b2c ; (main.l7900 + 0)
.s1509:
2b31 : a9 e2 __ LDA #$e2
2b33 : 8d 01 d6 STA $d601 
2b36 : a9 18 __ LDA #$18
2b38 : 8d 00 d6 STA $d600 
.l7902:
2b3b : 2c 00 d6 BIT $d600 
2b3e : 10 fb __ BPL $2b3b ; (main.l7902 + 0)
.s1515:
2b40 : ad 01 d6 LDA $d601 
2b43 : 29 7f __ AND #$7f
2b45 : 85 4b __ STA T7 + 0 
2b47 : a9 18 __ LDA #$18
2b49 : 8d 00 d6 STA $d600 
.l7904:
2b4c : 2c 00 d6 BIT $d600 
2b4f : 10 fb __ BPL $2b4c ; (main.l7904 + 0)
.s1521:
2b51 : a5 4b __ LDA T7 + 0 
2b53 : 8d 01 d6 STA $d601 
2b56 : a9 1e __ LDA #$1e
2b58 : 8d 00 d6 STA $d600 
.l7906:
2b5b : 2c 00 d6 BIT $d600 
2b5e : 10 fb __ BPL $2b5b ; (main.l7906 + 0)
.s1526:
2b60 : a9 45 __ LDA #$45
2b62 : 8d 01 d6 STA $d601 
2b65 : a9 12 __ LDA #$12
2b67 : 8d 00 d6 STA $d600 
2b6a : 8a __ __ TXA
2b6b : 18 __ __ CLC
2b6c : 6d 7c 44 ADC $447c ; (vdc_state + 10)
2b6f : aa __ __ TAX
2b70 : 98 __ __ TYA
2b71 : 6d 7d 44 ADC $447d ; (vdc_state + 11)
.l7908:
2b74 : 2c 00 d6 BIT $d600 
2b77 : 10 fb __ BPL $2b74 ; (main.l7908 + 0)
.s1533:
2b79 : 8d 01 d6 STA $d601 
2b7c : a9 13 __ LDA #$13
2b7e : 8d 00 d6 STA $d600 
.l7910:
2b81 : 2c 00 d6 BIT $d600 
2b84 : 10 fb __ BPL $2b81 ; (main.l7910 + 0)
.s1538:
2b86 : 8e 01 d6 STX $d601 
2b89 : a9 1f __ LDA #$1f
2b8b : 8d 00 d6 STA $d600 
.l7912:
2b8e : 2c 00 d6 BIT $d600 
2b91 : 10 fb __ BPL $2b8e ; (main.l7912 + 0)
.s1542:
2b93 : a9 09 __ LDA #$09
2b95 : 8d 01 d6 STA $d601 
2b98 : a9 18 __ LDA #$18
2b9a : 8d 00 d6 STA $d600 
.l7914:
2b9d : 2c 00 d6 BIT $d600 
2ba0 : 10 fb __ BPL $2b9d ; (main.l7914 + 0)
.s1548:
2ba2 : ad 01 d6 LDA $d601 
2ba5 : 29 7f __ AND #$7f
2ba7 : aa __ __ TAX
2ba8 : a9 18 __ LDA #$18
2baa : 8d 00 d6 STA $d600 
.l7916:
2bad : 2c 00 d6 BIT $d600 
2bb0 : 10 fb __ BPL $2bad ; (main.l7916 + 0)
.s1554:
2bb2 : 8e 01 d6 STX $d601 
2bb5 : a9 1e __ LDA #$1e
2bb7 : 8d 00 d6 STA $d600 
.l7918:
2bba : 2c 00 d6 BIT $d600 
2bbd : 10 fb __ BPL $2bba ; (main.l7918 + 0)
.s1559:
2bbf : a9 45 __ LDA #$45
2bc1 : 8d 01 d6 STA $d601 
2bc4 : a9 12 __ LDA #$12
2bc6 : 8d 00 d6 STA $d600 
2bc9 : 18 __ __ CLC
2bca : a5 05 __ LDA WORK + 2 
2bcc : 69 4b __ ADC #$4b
2bce : aa __ __ TAX
2bcf : a5 06 __ LDA WORK + 3 
2bd1 : 69 00 __ ADC #$00
2bd3 : a8 __ __ TAY
2bd4 : 8a __ __ TXA
2bd5 : 18 __ __ CLC
2bd6 : 65 45 __ ADC T4 + 0 
2bd8 : 85 45 __ STA T4 + 0 
2bda : 98 __ __ TYA
2bdb : 65 46 __ ADC T4 + 1 
.l7920:
2bdd : 2c 00 d6 BIT $d600 
2be0 : 10 fb __ BPL $2bdd ; (main.l7920 + 0)
.s1569:
2be2 : 8d 01 d6 STA $d601 
2be5 : a9 13 __ LDA #$13
2be7 : 8d 00 d6 STA $d600 
.l7922:
2bea : 2c 00 d6 BIT $d600 
2bed : 10 fb __ BPL $2bea ; (main.l7922 + 0)
.s1574:
2bef : a5 45 __ LDA T4 + 0 
2bf1 : 8d 01 d6 STA $d601 
2bf4 : a9 1f __ LDA #$1f
2bf6 : 8d 00 d6 STA $d600 
.l7924:
2bf9 : 2c 00 d6 BIT $d600 
2bfc : 10 fb __ BPL $2bf9 ; (main.l7924 + 0)
.s1578:
2bfe : a9 7e __ LDA #$7e
2c00 : 8d 01 d6 STA $d601 
2c03 : a9 12 __ LDA #$12
2c05 : 8d 00 d6 STA $d600 
2c08 : 8a __ __ TXA
2c09 : 18 __ __ CLC
2c0a : 6d 7c 44 ADC $447c ; (vdc_state + 10)
2c0d : aa __ __ TAX
2c0e : 98 __ __ TYA
2c0f : 6d 7d 44 ADC $447d ; (vdc_state + 11)
.l7926:
2c12 : 2c 00 d6 BIT $d600 
2c15 : 10 fb __ BPL $2c12 ; (main.l7926 + 0)
.s1585:
2c17 : 8d 01 d6 STA $d601 
2c1a : a9 13 __ LDA #$13
2c1c : 8d 00 d6 STA $d600 
.l7928:
2c1f : 2c 00 d6 BIT $d600 
2c22 : 10 fb __ BPL $2c1f ; (main.l7928 + 0)
.s1590:
2c24 : 8e 01 d6 STX $d601 
2c27 : a9 1f __ LDA #$1f
2c29 : 8d 00 d6 STA $d600 
.l7930:
2c2c : 2c 00 d6 BIT $d600 
2c2f : 10 fb __ BPL $2c2c ; (main.l7930 + 0)
.s1594:
2c31 : a9 09 __ LDA #$09
2c33 : 8d 01 d6 STA $d601 
2c36 : a9 7f __ LDA #$7f
2c38 : 85 14 __ STA P7 
2c3a : a9 50 __ LDA #$50
2c3c : 85 17 __ STA P10 
2c3e : a9 96 __ LDA #$96
2c40 : 8d ed bf STA $bfed ; (sstack + 0)
2c43 : a9 00 __ LDA #$00
2c45 : 85 18 __ STA P11 
2c47 : 8d ee bf STA $bfee ; (sstack + 1)
2c4a : 8d ef bf STA $bfef ; (sstack + 2)
2c4d : 8d f0 bf STA $bff0 ; (sstack + 3)
2c50 : 8d f1 bf STA $bff1 ; (sstack + 4)
2c53 : 8d f2 bf STA $bff2 ; (sstack + 5)
2c56 : a9 05 __ LDA #$05
2c58 : 8d f3 bf STA $bff3 ; (sstack + 6)
2c5b : 8d f4 bf STA $bff4 ; (sstack + 7)
2c5e : a9 46 __ LDA #$46
2c60 : 8d f5 bf STA $bff5 ; (sstack + 8)
2c63 : 38 __ __ SEC
2c64 : a5 54 __ LDA T1 + 0 
2c66 : e9 07 __ SBC #$07
2c68 : 8d f6 bf STA $bff6 ; (sstack + 9)
2c6b : 20 31 13 JSR $1331 ; (bnk_cpy_viewporttovdc.s0 + 0)
.l1595:
2c6e : 20 d5 38 JSR $38d5 ; (getch.s0 + 0)
2c71 : a9 00 __ LDA #$00
2c73 : 85 58 __ STA T9 + 0 
2c75 : a5 1b __ LDA ACCU + 0 
2c77 : 85 54 __ STA T1 + 0 
2c79 : c9 51 __ CMP #$51
2c7b : d0 06 __ BNE $2c83 ; (main.s1003 + 0)
.s1002:
2c7d : a9 01 __ LDA #$01
2c7f : 85 4d __ STA T10 + 0 
2c81 : d0 0e __ BNE $2c91 ; (main.s1600 + 0)
.s1003:
2c83 : a9 00 __ LDA #$00
2c85 : 85 4d __ STA T10 + 0 
2c87 : a5 1b __ LDA ACCU + 0 
2c89 : c9 57 __ CMP #$57
2c8b : f0 04 __ BEQ $2c91 ; (main.s1600 + 0)
.s1601:
2c8d : c9 45 __ CMP #$45
2c8f : d0 0d __ BNE $2c9e ; (main.s1599 + 0)
.s1600:
2c91 : a5 57 __ LDA T8 + 0 
2c93 : f0 09 __ BEQ $2c9e ; (main.s1599 + 0)
.s1597:
2c95 : a9 08 __ LDA #$08
2c97 : 85 58 __ STA T9 + 0 
2c99 : a5 1b __ LDA ACCU + 0 
2c9b : 4c a4 2c JMP $2ca4 ; (main.s1609 + 0)
.s1599:
2c9e : a5 1b __ LDA ACCU + 0 
2ca0 : c9 5a __ CMP #$5a
2ca2 : f0 0c __ BEQ $2cb0 ; (main.s1606 + 0)
.s1609:
2ca4 : c9 58 __ CMP #$58
2ca6 : f0 08 __ BEQ $2cb0 ; (main.s1606 + 0)
.s1608:
2ca8 : c9 43 __ CMP #$43
2caa : f0 04 __ BEQ $2cb0 ; (main.s1606 + 0)
.s1607:
2cac : c9 53 __ CMP #$53
2cae : d0 24 __ BNE $2cd4 ; (main.s1605 + 0)
.s1606:
2cb0 : 38 __ __ SEC
2cb1 : a9 96 __ LDA #$96
2cb3 : ed 77 44 SBC $4477 ; (vdc_state + 5)
2cb6 : a8 __ __ TAY
2cb7 : a9 00 __ LDA #$00
2cb9 : ed 78 44 SBC $4478 ; (vdc_state + 6)
2cbc : aa __ __ TAX
2cbd : 98 __ __ TYA
2cbe : 18 __ __ CLC
2cbf : 69 06 __ ADC #$06
2cc1 : 85 43 __ STA T3 + 0 
2cc3 : 8a __ __ TXA
2cc4 : 69 00 __ ADC #$00
2cc6 : d0 06 __ BNE $2cce ; (main.s1603 + 0)
.s1051:
2cc8 : a5 57 __ LDA T8 + 0 
2cca : c5 43 __ CMP T3 + 0 
2ccc : b0 06 __ BCS $2cd4 ; (main.s1605 + 0)
.s1603:
2cce : a5 58 __ LDA T9 + 0 
2cd0 : 09 04 __ ORA #$04
2cd2 : 85 58 __ STA T9 + 0 
.s1605:
2cd4 : a5 4d __ LDA T10 + 0 
2cd6 : d0 0a __ BNE $2ce2 ; (main.s1613 + 0)
.s1615:
2cd8 : a5 1b __ LDA ACCU + 0 
2cda : c9 41 __ CMP #$41
2cdc : f0 04 __ BEQ $2ce2 ; (main.s1613 + 0)
.s1614:
2cde : c9 5a __ CMP #$5a
2ce0 : d0 0a __ BNE $2cec ; (main.s1612 + 0)
.s1613:
2ce2 : a5 56 __ LDA T2 + 0 
2ce4 : f0 06 __ BEQ $2cec ; (main.s1612 + 0)
.s1610:
2ce6 : a5 58 __ LDA T9 + 0 
2ce8 : 09 01 __ ORA #$01
2cea : 85 58 __ STA T9 + 0 
.s1612:
2cec : a5 1b __ LDA ACCU + 0 
2cee : c9 45 __ CMP #$45
2cf0 : f0 08 __ BEQ $2cfa ; (main.s1619 + 0)
.s1621:
2cf2 : c9 44 __ CMP #$44
2cf4 : f0 04 __ BEQ $2cfa ; (main.s1619 + 0)
.s1620:
2cf6 : c9 43 __ CMP #$43
2cf8 : d0 0e __ BNE $2d08 ; (main.s1618 + 0)
.s1619:
2cfa : a5 56 __ LDA T2 + 0 
2cfc : c9 09 __ CMP #$09
2cfe : b0 08 __ BCS $2d08 ; (main.s1618 + 0)
.s1616:
2d00 : a5 58 __ LDA T9 + 0 
2d02 : 09 02 __ ORA #$02
2d04 : 85 58 __ STA T9 + 0 
2d06 : 90 04 __ BCC $2d0c ; (main.s1622 + 0)
.s1618:
2d08 : a5 58 __ LDA T9 + 0 
2d0a : f0 40 __ BEQ $2d4c ; (main.s1624 + 0)
.s1622:
2d0c : 8d ff bf STA $bfff ; (sstack + 18)
2d0f : a5 56 __ LDA T2 + 0 
2d11 : 8d f7 bf STA $bff7 ; (sstack + 10)
2d14 : a9 00 __ LDA #$00
2d16 : 8d f8 bf STA $bff8 ; (sstack + 11)
2d19 : 8d fa bf STA $bffa ; (sstack + 13)
2d1c : a5 57 __ LDA T8 + 0 
2d1e : 8d f9 bf STA $bff9 ; (sstack + 12)
2d21 : ad 77 44 LDA $4477 ; (vdc_state + 5)
2d24 : 38 __ __ SEC
2d25 : e9 07 __ SBC #$07
2d27 : 8d fe bf STA $bffe ; (sstack + 17)
2d2a : 20 bc 14 JSR $14bc ; (bnk_viewportscroll.s0 + 0)
2d2d : a5 58 __ LDA T9 + 0 
2d2f : 29 08 __ AND #$08
2d31 : f0 02 __ BEQ $2d35 ; (main.s7937 + 0)
.s1625:
2d33 : c6 57 __ DEC T8 + 0 
.s7937:
2d35 : a5 58 __ LDA T9 + 0 
2d37 : 29 04 __ AND #$04
2d39 : f0 02 __ BEQ $2d3d ; (main.s7938 + 0)
.s1628:
2d3b : e6 57 __ INC T8 + 0 
.s7938:
2d3d : a5 58 __ LDA T9 + 0 
2d3f : 4a __ __ LSR
2d40 : 90 02 __ BCC $2d44 ; (main.s7939 + 0)
.s1631:
2d42 : c6 56 __ DEC T2 + 0 
.s7939:
2d44 : a5 58 __ LDA T9 + 0 
2d46 : 29 02 __ AND #$02
2d48 : f0 02 __ BEQ $2d4c ; (main.s1624 + 0)
.s1634:
2d4a : e6 56 __ INC T2 + 0 
.s1624:
2d4c : a5 54 __ LDA T1 + 0 
2d4e : c9 1b __ CMP #$1b
2d50 : f0 07 __ BEQ $2d59 ; (main.s807 + 0)
.s1637:
2d52 : c9 03 __ CMP #$03
2d54 : f0 03 __ BEQ $2d59 ; (main.s807 + 0)
2d56 : 4c 6e 2c JMP $2c6e ; (main.l1595 + 0)
.s807:
2d59 : e6 53 __ INC T0 + 0 
2d5b : a5 53 __ LDA T0 + 0 
2d5d : c9 02 __ CMP #$02
2d5f : b0 0f __ BCS $2d70 ; (main.s808 + 0)
.s806:
2d61 : 09 00 __ ORA #$00
2d63 : d0 03 __ BNE $2d68 ; (main.s809 + 0)
2d65 : 4c 51 23 JMP $2351 ; (main.l811 + 0)
.s809:
2d68 : 85 16 __ STA P9 
2d6a : 20 c5 39 JSR $39c5 ; (vdc_set_mode.s1000 + 0)
2d6d : 4c 51 23 JMP $2351 ; (main.l811 + 0)
.s808:
2d70 : a9 00 __ LDA #$00
2d72 : 8d 30 d0 STA $d030 
2d75 : 85 16 __ STA P9 
2d77 : ad 11 d0 LDA $d011 
2d7a : 29 7f __ AND #$7f
2d7c : 09 10 __ ORA #$10
2d7e : 8d 11 d0 STA $d011 
2d81 : 20 c5 39 JSR $39c5 ; (vdc_set_mode.s1000 + 0)
2d84 : a9 00 __ LDA #$00
2d86 : 85 53 __ STA T0 + 0 
2d88 : ad 75 44 LDA $4475 ; (vdc_state + 3)
2d8b : 85 54 __ STA T1 + 0 
2d8d : ad 77 44 LDA $4477 ; (vdc_state + 5)
2d90 : 85 43 __ STA T3 + 0 
.l1645:
2d92 : a5 53 __ LDA T0 + 0 
2d94 : c5 43 __ CMP T3 + 0 
2d96 : 90 21 __ BCC $2db9 ; (main.s1646 + 0)
.s1643:
2d98 : a9 04 __ LDA #$04
2d9a : 8d 06 d5 STA $d506 
2d9d : a9 00 __ LDA #$00
2d9f : 85 1b __ STA ACCU + 0 
2da1 : 85 1c __ STA ACCU + 1 
.s1001:
2da3 : 18 __ __ CLC
2da4 : a5 23 __ LDA SP + 0 
2da6 : 69 0e __ ADC #$0e
2da8 : 85 23 __ STA SP + 0 
2daa : 90 02 __ BCC $2dae ; (main.s1001 + 11)
2dac : e6 24 __ INC SP + 1 
2dae : a2 05 __ LDX #$05
2db0 : bd 93 bf LDA $bf93,x ; (main@stack + 0)
2db3 : 95 53 __ STA T0 + 0,x 
2db5 : ca __ __ DEX
2db6 : 10 f8 __ BPL $2db0 ; (main.s1001 + 13)
2db8 : 60 __ __ RTS
.s1646:
2db9 : ad 75 44 LDA $4475 ; (vdc_state + 3)
2dbc : 85 1b __ STA ACCU + 0 
2dbe : ad 76 44 LDA $4476 ; (vdc_state + 4)
2dc1 : 85 1c __ STA ACCU + 1 
2dc3 : ad 79 44 LDA $4479 ; (vdc_state + 7)
2dc6 : 85 56 __ STA T2 + 0 
2dc8 : a9 12 __ LDA #$12
2dca : 8d 00 d6 STA $d600 
2dcd : a6 54 __ LDX T1 + 0 
2dcf : ca __ __ DEX
2dd0 : 86 49 __ STX T6 + 0 
2dd2 : a5 53 __ LDA T0 + 0 
2dd4 : 20 b5 42 JSR $42b5 ; (mul16by8 + 0)
2dd7 : 18 __ __ CLC
2dd8 : a5 05 __ LDA WORK + 2 
2dda : 6d 7a 44 ADC $447a ; (vdc_state + 8)
2ddd : aa __ __ TAX
2dde : a5 06 __ LDA WORK + 3 
2de0 : 6d 7b 44 ADC $447b ; (vdc_state + 9)
.l7942:
2de3 : 2c 00 d6 BIT $d600 
2de6 : 10 fb __ BPL $2de3 ; (main.l7942 + 0)
.s1658:
2de8 : 8d 01 d6 STA $d601 
2deb : a9 13 __ LDA #$13
2ded : 8d 00 d6 STA $d600 
.l7944:
2df0 : 2c 00 d6 BIT $d600 
2df3 : 10 fb __ BPL $2df0 ; (main.l7944 + 0)
.s1663:
2df5 : 8e 01 d6 STX $d601 
2df8 : a9 1f __ LDA #$1f
2dfa : 8d 00 d6 STA $d600 
.l7946:
2dfd : 2c 00 d6 BIT $d600 
2e00 : 10 fb __ BPL $2dfd ; (main.l7946 + 0)
.s1667:
2e02 : a9 20 __ LDA #$20
2e04 : 8d 01 d6 STA $d601 
2e07 : a9 18 __ LDA #$18
2e09 : 8d 00 d6 STA $d600 
.l7948:
2e0c : 2c 00 d6 BIT $d600 
2e0f : 10 fb __ BPL $2e0c ; (main.l7948 + 0)
.s1673:
2e11 : ad 01 d6 LDA $d601 
2e14 : 29 7f __ AND #$7f
2e16 : aa __ __ TAX
2e17 : a9 18 __ LDA #$18
2e19 : 8d 00 d6 STA $d600 
.l7950:
2e1c : 2c 00 d6 BIT $d600 
2e1f : 10 fb __ BPL $2e1c ; (main.l7950 + 0)
.s1679:
2e21 : 8e 01 d6 STX $d601 
2e24 : a9 1e __ LDA #$1e
2e26 : 8d 00 d6 STA $d600 
.l7952:
2e29 : 2c 00 d6 BIT $d600 
2e2c : 10 fb __ BPL $2e29 ; (main.l7952 + 0)
.s1684:
2e2e : a5 49 __ LDA T6 + 0 
2e30 : 8d 01 d6 STA $d601 
2e33 : ad 7c 44 LDA $447c ; (vdc_state + 10)
2e36 : 18 __ __ CLC
2e37 : 65 05 __ ADC WORK + 2 
2e39 : aa __ __ TAX
2e3a : a9 12 __ LDA #$12
2e3c : 8d 00 d6 STA $d600 
2e3f : ad 7d 44 LDA $447d ; (vdc_state + 11)
2e42 : 65 06 __ ADC WORK + 3 
.l7954:
2e44 : 2c 00 d6 BIT $d600 
2e47 : 10 fb __ BPL $2e44 ; (main.l7954 + 0)
.s1691:
2e49 : 8d 01 d6 STA $d601 
2e4c : a9 13 __ LDA #$13
2e4e : 8d 00 d6 STA $d600 
.l7956:
2e51 : 2c 00 d6 BIT $d600 
2e54 : 10 fb __ BPL $2e51 ; (main.l7956 + 0)
.s1696:
2e56 : 8e 01 d6 STX $d601 
2e59 : a9 1f __ LDA #$1f
2e5b : 8d 00 d6 STA $d600 
.l7958:
2e5e : 2c 00 d6 BIT $d600 
2e61 : 10 fb __ BPL $2e5e ; (main.l7958 + 0)
.s1700:
2e63 : a5 56 __ LDA T2 + 0 
2e65 : 8d 01 d6 STA $d601 
2e68 : a9 18 __ LDA #$18
2e6a : 8d 00 d6 STA $d600 
.l7960:
2e6d : 2c 00 d6 BIT $d600 
2e70 : 10 fb __ BPL $2e6d ; (main.l7960 + 0)
.s1706:
2e72 : ad 01 d6 LDA $d601 
2e75 : 29 7f __ AND #$7f
2e77 : aa __ __ TAX
2e78 : a9 18 __ LDA #$18
2e7a : 8d 00 d6 STA $d600 
.l7962:
2e7d : 2c 00 d6 BIT $d600 
2e80 : 10 fb __ BPL $2e7d ; (main.l7962 + 0)
.s1712:
2e82 : 8e 01 d6 STX $d601 
2e85 : a9 1e __ LDA #$1e
2e87 : 8d 00 d6 STA $d600 
.l7964:
2e8a : 2c 00 d6 BIT $d600 
2e8d : 10 fb __ BPL $2e8a ; (main.l7964 + 0)
.s1717:
2e8f : a5 49 __ LDA T6 + 0 
2e91 : 8d 01 d6 STA $d601 
2e94 : e6 53 __ INC T0 + 0 
2e96 : 4c 92 2d JMP $2d92 ; (main.l1645 + 0)
.s1418:
2e99 : a9 12 __ LDA #$12
2e9b : 8d 00 d6 STA $d600 
2e9e : ad 75 44 LDA $4475 ; (vdc_state + 3)
2ea1 : 85 1b __ STA ACCU + 0 
2ea3 : ad 76 44 LDA $4476 ; (vdc_state + 4)
2ea6 : 85 1c __ STA ACCU + 1 
2ea8 : a5 58 __ LDA T9 + 0 
2eaa : 20 b5 42 JSR $42b5 ; (mul16by8 + 0)
2ead : 18 __ __ CLC
2eae : a5 05 __ LDA WORK + 2 
2eb0 : 69 4b __ ADC #$4b
2eb2 : 85 43 __ STA T3 + 0 
2eb4 : a5 06 __ LDA WORK + 3 
2eb6 : 69 00 __ ADC #$00
2eb8 : 85 44 __ STA T3 + 1 
2eba : 18 __ __ CLC
2ebb : a5 43 __ LDA T3 + 0 
2ebd : 65 45 __ ADC T4 + 0 
2ebf : aa __ __ TAX
2ec0 : a5 44 __ LDA T3 + 1 
2ec2 : 65 46 __ ADC T4 + 1 
.l7872:
2ec4 : 2c 00 d6 BIT $d600 
2ec7 : 10 fb __ BPL $2ec4 ; (main.l7872 + 0)
.s1430:
2ec9 : 8d 01 d6 STA $d601 
2ecc : a9 13 __ LDA #$13
2ece : 8d 00 d6 STA $d600 
.l7874:
2ed1 : 2c 00 d6 BIT $d600 
2ed4 : 10 fb __ BPL $2ed1 ; (main.l7874 + 0)
.s1435:
2ed6 : 8e 01 d6 STX $d601 
2ed9 : a9 1f __ LDA #$1f
2edb : 8d 00 d6 STA $d600 
.l7876:
2ede : 2c 00 d6 BIT $d600 
2ee1 : 10 fb __ BPL $2ede ; (main.l7876 + 0)
.s1439:
2ee3 : a9 61 __ LDA #$61
2ee5 : 8d 01 d6 STA $d601 
2ee8 : ad 7c 44 LDA $447c ; (vdc_state + 10)
2eeb : 18 __ __ CLC
2eec : 65 43 __ ADC T3 + 0 
2eee : aa __ __ TAX
2eef : a9 12 __ LDA #$12
2ef1 : 8d 00 d6 STA $d600 
2ef4 : ad 7d 44 LDA $447d ; (vdc_state + 11)
2ef7 : 65 44 __ ADC T3 + 1 
.l7878:
2ef9 : 2c 00 d6 BIT $d600 
2efc : 10 fb __ BPL $2ef9 ; (main.l7878 + 0)
.s1446:
2efe : 8d 01 d6 STA $d601 
2f01 : a9 13 __ LDA #$13
2f03 : 8d 00 d6 STA $d600 
.l7880:
2f06 : 2c 00 d6 BIT $d600 
2f09 : 10 fb __ BPL $2f06 ; (main.l7880 + 0)
.s1451:
2f0b : 8e 01 d6 STX $d601 
2f0e : a9 1f __ LDA #$1f
2f10 : 8d 00 d6 STA $d600 
.l7882:
2f13 : 2c 00 d6 BIT $d600 
2f16 : 10 fb __ BPL $2f13 ; (main.l7882 + 0)
.s1455:
2f18 : a9 09 __ LDA #$09
2f1a : 8d 01 d6 STA $d601 
2f1d : e6 58 __ INC T9 + 0 
2f1f : 4c 52 2a JMP $2a52 ; (main.l1417 + 0)
.s1378:
2f22 : ad 75 44 LDA $4475 ; (vdc_state + 3)
2f25 : 85 1b __ STA ACCU + 0 
2f27 : ad 76 44 LDA $4476 ; (vdc_state + 4)
2f2a : 85 1c __ STA ACCU + 1 
2f2c : a9 12 __ LDA #$12
2f2e : 8d 00 d6 STA $d600 
2f31 : a5 58 __ LDA T9 + 0 
2f33 : 20 b5 42 JSR $42b5 ; (mul16by8 + 0)
2f36 : 18 __ __ CLC
2f37 : a5 05 __ LDA WORK + 2 
2f39 : 69 04 __ ADC #$04
2f3b : 85 43 __ STA T3 + 0 
2f3d : a5 06 __ LDA WORK + 3 
2f3f : 69 00 __ ADC #$00
2f41 : 85 44 __ STA T3 + 1 
2f43 : 18 __ __ CLC
2f44 : a5 43 __ LDA T3 + 0 
2f46 : 6d 7a 44 ADC $447a ; (vdc_state + 8)
2f49 : aa __ __ TAX
2f4a : a5 44 __ LDA T3 + 1 
2f4c : 6d 7b 44 ADC $447b ; (vdc_state + 9)
.l7859:
2f4f : 2c 00 d6 BIT $d600 
2f52 : 10 fb __ BPL $2f4f ; (main.l7859 + 0)
.s1390:
2f54 : 8d 01 d6 STA $d601 
2f57 : a9 13 __ LDA #$13
2f59 : 8d 00 d6 STA $d600 
.l7861:
2f5c : 2c 00 d6 BIT $d600 
2f5f : 10 fb __ BPL $2f5c ; (main.l7861 + 0)
.s1395:
2f61 : 8e 01 d6 STX $d601 
2f64 : a9 1f __ LDA #$1f
2f66 : 8d 00 d6 STA $d600 
.l7863:
2f69 : 2c 00 d6 BIT $d600 
2f6c : 10 fb __ BPL $2f69 ; (main.l7863 + 0)
.s1399:
2f6e : a9 e1 __ LDA #$e1
2f70 : 8d 01 d6 STA $d601 
2f73 : ad 7c 44 LDA $447c ; (vdc_state + 10)
2f76 : 18 __ __ CLC
2f77 : 65 43 __ ADC T3 + 0 
2f79 : aa __ __ TAX
2f7a : a9 12 __ LDA #$12
2f7c : 8d 00 d6 STA $d600 
2f7f : ad 7d 44 LDA $447d ; (vdc_state + 11)
2f82 : 65 44 __ ADC T3 + 1 
.l7865:
2f84 : 2c 00 d6 BIT $d600 
2f87 : 10 fb __ BPL $2f84 ; (main.l7865 + 0)
.s1406:
2f89 : 8d 01 d6 STA $d601 
2f8c : a9 13 __ LDA #$13
2f8e : 8d 00 d6 STA $d600 
.l7867:
2f91 : 2c 00 d6 BIT $d600 
2f94 : 10 fb __ BPL $2f91 ; (main.l7867 + 0)
.s1411:
2f96 : 8e 01 d6 STX $d601 
2f99 : a9 1f __ LDA #$1f
2f9b : 8d 00 d6 STA $d600 
.l7869:
2f9e : 2c 00 d6 BIT $d600 
2fa1 : 10 fb __ BPL $2f9e ; (main.l7869 + 0)
.s1415:
2fa3 : a9 09 __ LDA #$09
2fa5 : 8d 01 d6 STA $d601 
2fa8 : e6 58 __ INC T9 + 0 
2faa : 4c 33 2a JMP $2a33 ; (main.l1377 + 0)
.s733:
2fad : ad 75 44 LDA $4475 ; (vdc_state + 3)
2fb0 : 85 1b __ STA ACCU + 0 
2fb2 : ad 76 44 LDA $4476 ; (vdc_state + 4)
2fb5 : 85 1c __ STA ACCU + 1 
2fb7 : ad 79 44 LDA $4479 ; (vdc_state + 7)
2fba : 85 56 __ STA T2 + 0 
2fbc : a9 12 __ LDA #$12
2fbe : 8d 00 d6 STA $d600 
2fc1 : a6 54 __ LDX T1 + 0 
2fc3 : ca __ __ DEX
2fc4 : 86 49 __ STX T6 + 0 
2fc6 : a5 53 __ LDA T0 + 0 
2fc8 : 20 b5 42 JSR $42b5 ; (mul16by8 + 0)
2fcb : 18 __ __ CLC
2fcc : a5 05 __ LDA WORK + 2 
2fce : 6d 7a 44 ADC $447a ; (vdc_state + 8)
2fd1 : aa __ __ TAX
2fd2 : a5 06 __ LDA WORK + 3 
2fd4 : 6d 7b 44 ADC $447b ; (vdc_state + 9)
.l7672:
2fd7 : 2c 00 d6 BIT $d600 
2fda : 10 fb __ BPL $2fd7 ; (main.l7672 + 0)
.s745:
2fdc : 8d 01 d6 STA $d601 
2fdf : a9 13 __ LDA #$13
2fe1 : 8d 00 d6 STA $d600 
.l7674:
2fe4 : 2c 00 d6 BIT $d600 
2fe7 : 10 fb __ BPL $2fe4 ; (main.l7674 + 0)
.s750:
2fe9 : 8e 01 d6 STX $d601 
2fec : a9 1f __ LDA #$1f
2fee : 8d 00 d6 STA $d600 
.l7676:
2ff1 : 2c 00 d6 BIT $d600 
2ff4 : 10 fb __ BPL $2ff1 ; (main.l7676 + 0)
.s754:
2ff6 : a9 20 __ LDA #$20
2ff8 : 8d 01 d6 STA $d601 
2ffb : a9 18 __ LDA #$18
2ffd : 8d 00 d6 STA $d600 
.l7678:
3000 : 2c 00 d6 BIT $d600 
3003 : 10 fb __ BPL $3000 ; (main.l7678 + 0)
.s760:
3005 : ad 01 d6 LDA $d601 
3008 : 29 7f __ AND #$7f
300a : aa __ __ TAX
300b : a9 18 __ LDA #$18
300d : 8d 00 d6 STA $d600 
.l7680:
3010 : 2c 00 d6 BIT $d600 
3013 : 10 fb __ BPL $3010 ; (main.l7680 + 0)
.s766:
3015 : 8e 01 d6 STX $d601 
3018 : a9 1e __ LDA #$1e
301a : 8d 00 d6 STA $d600 
.l7682:
301d : 2c 00 d6 BIT $d600 
3020 : 10 fb __ BPL $301d ; (main.l7682 + 0)
.s771:
3022 : a5 49 __ LDA T6 + 0 
3024 : 8d 01 d6 STA $d601 
3027 : ad 7c 44 LDA $447c ; (vdc_state + 10)
302a : 18 __ __ CLC
302b : 65 05 __ ADC WORK + 2 
302d : aa __ __ TAX
302e : a9 12 __ LDA #$12
3030 : 8d 00 d6 STA $d600 
3033 : ad 7d 44 LDA $447d ; (vdc_state + 11)
3036 : 65 06 __ ADC WORK + 3 
.l7684:
3038 : 2c 00 d6 BIT $d600 
303b : 10 fb __ BPL $3038 ; (main.l7684 + 0)
.s778:
303d : 8d 01 d6 STA $d601 
3040 : a9 13 __ LDA #$13
3042 : 8d 00 d6 STA $d600 
.l7686:
3045 : 2c 00 d6 BIT $d600 
3048 : 10 fb __ BPL $3045 ; (main.l7686 + 0)
.s783:
304a : 8e 01 d6 STX $d601 
304d : a9 1f __ LDA #$1f
304f : 8d 00 d6 STA $d600 
.l7688:
3052 : 2c 00 d6 BIT $d600 
3055 : 10 fb __ BPL $3052 ; (main.l7688 + 0)
.s787:
3057 : a5 56 __ LDA T2 + 0 
3059 : 8d 01 d6 STA $d601 
305c : a9 18 __ LDA #$18
305e : 8d 00 d6 STA $d600 
.l7690:
3061 : 2c 00 d6 BIT $d600 
3064 : 10 fb __ BPL $3061 ; (main.l7690 + 0)
.s793:
3066 : ad 01 d6 LDA $d601 
3069 : 29 7f __ AND #$7f
306b : aa __ __ TAX
306c : a9 18 __ LDA #$18
306e : 8d 00 d6 STA $d600 
.l7692:
3071 : 2c 00 d6 BIT $d600 
3074 : 10 fb __ BPL $3071 ; (main.l7692 + 0)
.s799:
3076 : 8e 01 d6 STX $d601 
3079 : a9 1e __ LDA #$1e
307b : 8d 00 d6 STA $d600 
.l7694:
307e : 2c 00 d6 BIT $d600 
3081 : 10 fb __ BPL $307e ; (main.l7694 + 0)
.s804:
3083 : a5 49 __ LDA T6 + 0 
3085 : 8d 01 d6 STA $d601 
3088 : e6 53 __ INC T0 + 0 
308a : 4c 44 23 JMP $2344 ; (main.l732 + 0)
.s297:
308d : ad 75 44 LDA $4475 ; (vdc_state + 3)
3090 : 85 1b __ STA ACCU + 0 
3092 : ad 76 44 LDA $4476 ; (vdc_state + 4)
3095 : 85 1c __ STA ACCU + 1 
3097 : ad 79 44 LDA $4479 ; (vdc_state + 7)
309a : 85 56 __ STA T2 + 0 
309c : a9 12 __ LDA #$12
309e : 8d 00 d6 STA $d600 
30a1 : a6 54 __ LDX T1 + 0 
30a3 : ca __ __ DEX
30a4 : 86 49 __ STX T6 + 0 
30a6 : a5 53 __ LDA T0 + 0 
30a8 : 20 b5 42 JSR $42b5 ; (mul16by8 + 0)
30ab : 18 __ __ CLC
30ac : a5 05 __ LDA WORK + 2 
30ae : 6d 7a 44 ADC $447a ; (vdc_state + 8)
30b1 : aa __ __ TAX
30b2 : a5 06 __ LDA WORK + 3 
30b4 : 6d 7b 44 ADC $447b ; (vdc_state + 9)
.l8022:
30b7 : 2c 00 d6 BIT $d600 
30ba : 10 fb __ BPL $30b7 ; (main.l8022 + 0)
.s309:
30bc : 8d 01 d6 STA $d601 
30bf : a9 13 __ LDA #$13
30c1 : 8d 00 d6 STA $d600 
.l8024:
30c4 : 2c 00 d6 BIT $d600 
30c7 : 10 fb __ BPL $30c4 ; (main.l8024 + 0)
.s314:
30c9 : 8e 01 d6 STX $d601 
30cc : a9 1f __ LDA #$1f
30ce : 8d 00 d6 STA $d600 
.l8026:
30d1 : 2c 00 d6 BIT $d600 
30d4 : 10 fb __ BPL $30d1 ; (main.l8026 + 0)
.s318:
30d6 : a9 20 __ LDA #$20
30d8 : 8d 01 d6 STA $d601 
30db : a9 18 __ LDA #$18
30dd : 8d 00 d6 STA $d600 
.l8028:
30e0 : 2c 00 d6 BIT $d600 
30e3 : 10 fb __ BPL $30e0 ; (main.l8028 + 0)
.s324:
30e5 : ad 01 d6 LDA $d601 
30e8 : 29 7f __ AND #$7f
30ea : aa __ __ TAX
30eb : a9 18 __ LDA #$18
30ed : 8d 00 d6 STA $d600 
.l8030:
30f0 : 2c 00 d6 BIT $d600 
30f3 : 10 fb __ BPL $30f0 ; (main.l8030 + 0)
.s330:
30f5 : 8e 01 d6 STX $d601 
30f8 : a9 1e __ LDA #$1e
30fa : 8d 00 d6 STA $d600 
.l8032:
30fd : 2c 00 d6 BIT $d600 
3100 : 10 fb __ BPL $30fd ; (main.l8032 + 0)
.s335:
3102 : a5 49 __ LDA T6 + 0 
3104 : 8d 01 d6 STA $d601 
3107 : ad 7c 44 LDA $447c ; (vdc_state + 10)
310a : 18 __ __ CLC
310b : 65 05 __ ADC WORK + 2 
310d : aa __ __ TAX
310e : a9 12 __ LDA #$12
3110 : 8d 00 d6 STA $d600 
3113 : ad 7d 44 LDA $447d ; (vdc_state + 11)
3116 : 65 06 __ ADC WORK + 3 
.l8034:
3118 : 2c 00 d6 BIT $d600 
311b : 10 fb __ BPL $3118 ; (main.l8034 + 0)
.s342:
311d : 8d 01 d6 STA $d601 
3120 : a9 13 __ LDA #$13
3122 : 8d 00 d6 STA $d600 
.l8036:
3125 : 2c 00 d6 BIT $d600 
3128 : 10 fb __ BPL $3125 ; (main.l8036 + 0)
.s347:
312a : 8e 01 d6 STX $d601 
312d : a9 1f __ LDA #$1f
312f : 8d 00 d6 STA $d600 
.l8038:
3132 : 2c 00 d6 BIT $d600 
3135 : 10 fb __ BPL $3132 ; (main.l8038 + 0)
.s351:
3137 : a5 56 __ LDA T2 + 0 
3139 : 8d 01 d6 STA $d601 
313c : a9 18 __ LDA #$18
313e : 8d 00 d6 STA $d600 
.l8040:
3141 : 2c 00 d6 BIT $d600 
3144 : 10 fb __ BPL $3141 ; (main.l8040 + 0)
.s357:
3146 : ad 01 d6 LDA $d601 
3149 : 29 7f __ AND #$7f
314b : aa __ __ TAX
314c : a9 18 __ LDA #$18
314e : 8d 00 d6 STA $d600 
.l8042:
3151 : 2c 00 d6 BIT $d600 
3154 : 10 fb __ BPL $3151 ; (main.l8042 + 0)
.s363:
3156 : 8e 01 d6 STX $d601 
3159 : a9 1e __ LDA #$1e
315b : 8d 00 d6 STA $d600 
.l8044:
315e : 2c 00 d6 BIT $d600 
3161 : 10 fb __ BPL $315e ; (main.l8044 + 0)
.s368:
3163 : a5 49 __ LDA T6 + 0 
3165 : 8d 01 d6 STA $d601 
3168 : e6 53 __ INC T0 + 0 
316a : 4c 44 1f JMP $1f44 ; (main.l296 + 0)
.s100:
316d : ad 75 44 LDA $4475 ; (vdc_state + 3)
3170 : 85 1b __ STA ACCU + 0 
3172 : ad 76 44 LDA $4476 ; (vdc_state + 4)
3175 : 85 1c __ STA ACCU + 1 
3177 : ad 79 44 LDA $4479 ; (vdc_state + 7)
317a : 85 56 __ STA T2 + 0 
317c : a9 12 __ LDA #$12
317e : 8d 00 d6 STA $d600 
3181 : a6 54 __ LDX T1 + 0 
3183 : ca __ __ DEX
3184 : 86 49 __ STX T6 + 0 
3186 : a5 53 __ LDA T0 + 0 
3188 : 20 b5 42 JSR $42b5 ; (mul16by8 + 0)
318b : 18 __ __ CLC
318c : a5 05 __ LDA WORK + 2 
318e : 6d 7a 44 ADC $447a ; (vdc_state + 8)
3191 : aa __ __ TAX
3192 : a5 06 __ LDA WORK + 3 
3194 : 6d 7b 44 ADC $447b ; (vdc_state + 9)
.l7576:
3197 : 2c 00 d6 BIT $d600 
319a : 10 fb __ BPL $3197 ; (main.l7576 + 0)
.s112:
319c : 8d 01 d6 STA $d601 
319f : a9 13 __ LDA #$13
31a1 : 8d 00 d6 STA $d600 
.l7578:
31a4 : 2c 00 d6 BIT $d600 
31a7 : 10 fb __ BPL $31a4 ; (main.l7578 + 0)
.s117:
31a9 : 8e 01 d6 STX $d601 
31ac : a9 1f __ LDA #$1f
31ae : 8d 00 d6 STA $d600 
.l7580:
31b1 : 2c 00 d6 BIT $d600 
31b4 : 10 fb __ BPL $31b1 ; (main.l7580 + 0)
.s121:
31b6 : a9 20 __ LDA #$20
31b8 : 8d 01 d6 STA $d601 
31bb : a9 18 __ LDA #$18
31bd : 8d 00 d6 STA $d600 
.l7582:
31c0 : 2c 00 d6 BIT $d600 
31c3 : 10 fb __ BPL $31c0 ; (main.l7582 + 0)
.s127:
31c5 : ad 01 d6 LDA $d601 
31c8 : 29 7f __ AND #$7f
31ca : aa __ __ TAX
31cb : a9 18 __ LDA #$18
31cd : 8d 00 d6 STA $d600 
.l7584:
31d0 : 2c 00 d6 BIT $d600 
31d3 : 10 fb __ BPL $31d0 ; (main.l7584 + 0)
.s133:
31d5 : 8e 01 d6 STX $d601 
31d8 : a9 1e __ LDA #$1e
31da : 8d 00 d6 STA $d600 
.l7586:
31dd : 2c 00 d6 BIT $d600 
31e0 : 10 fb __ BPL $31dd ; (main.l7586 + 0)
.s138:
31e2 : a5 49 __ LDA T6 + 0 
31e4 : 8d 01 d6 STA $d601 
31e7 : ad 7c 44 LDA $447c ; (vdc_state + 10)
31ea : 18 __ __ CLC
31eb : 65 05 __ ADC WORK + 2 
31ed : aa __ __ TAX
31ee : a9 12 __ LDA #$12
31f0 : 8d 00 d6 STA $d600 
31f3 : ad 7d 44 LDA $447d ; (vdc_state + 11)
31f6 : 65 06 __ ADC WORK + 3 
.l7588:
31f8 : 2c 00 d6 BIT $d600 
31fb : 10 fb __ BPL $31f8 ; (main.l7588 + 0)
.s145:
31fd : 8d 01 d6 STA $d601 
3200 : a9 13 __ LDA #$13
3202 : 8d 00 d6 STA $d600 
.l7590:
3205 : 2c 00 d6 BIT $d600 
3208 : 10 fb __ BPL $3205 ; (main.l7590 + 0)
.s150:
320a : 8e 01 d6 STX $d601 
320d : a9 1f __ LDA #$1f
320f : 8d 00 d6 STA $d600 
.l7592:
3212 : 2c 00 d6 BIT $d600 
3215 : 10 fb __ BPL $3212 ; (main.l7592 + 0)
.s154:
3217 : a5 56 __ LDA T2 + 0 
3219 : 8d 01 d6 STA $d601 
321c : a9 18 __ LDA #$18
321e : 8d 00 d6 STA $d600 
.l7594:
3221 : 2c 00 d6 BIT $d600 
3224 : 10 fb __ BPL $3221 ; (main.l7594 + 0)
.s160:
3226 : ad 01 d6 LDA $d601 
3229 : 29 7f __ AND #$7f
322b : aa __ __ TAX
322c : a9 18 __ LDA #$18
322e : 8d 00 d6 STA $d600 
.l7596:
3231 : 2c 00 d6 BIT $d600 
3234 : 10 fb __ BPL $3231 ; (main.l7596 + 0)
.s166:
3236 : 8e 01 d6 STX $d601 
3239 : a9 1e __ LDA #$1e
323b : 8d 00 d6 STA $d600 
.l7598:
323e : 2c 00 d6 BIT $d600 
3241 : 10 fb __ BPL $323e ; (main.l7598 + 0)
.s171:
3243 : a5 49 __ LDA T6 + 0 
3245 : 8d 01 d6 STA $d601 
3248 : e6 53 __ INC T0 + 0 
324a : 4c 9d 1d JMP $1d9d ; (main.l99 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
324d : a2 03 __ LDX #$03
324f : b5 53 __ LDA T8 + 0,x 
3251 : 9d 9f bf STA $bf9f,x ; (printf@stack + 0)
3254 : ca __ __ DEX
3255 : 10 f8 __ BPL $324f ; (printf.s1000 + 2)
.s0:
3257 : 18 __ __ CLC
3258 : a5 23 __ LDA SP + 0 
325a : 69 04 __ ADC #$04
325c : 85 47 __ STA T0 + 0 
325e : a5 24 __ LDA SP + 1 
3260 : 69 00 __ ADC #$00
3262 : 85 48 __ STA T0 + 1 
3264 : a9 00 __ LDA #$00
3266 : 85 49 __ STA T2 + 0 
3268 : a0 02 __ LDY #$02
326a : b1 23 __ LDA (SP + 0),y 
326c : 85 4a __ STA T3 + 0 
326e : c8 __ __ INY
326f : b1 23 __ LDA (SP + 0),y 
3271 : 85 4b __ STA T3 + 1 
.l2:
3273 : a0 00 __ LDY #$00
3275 : b1 4a __ LDA (T3 + 0),y 
3277 : d0 1e __ BNE $3297 ; (printf.s3 + 0)
.s4:
3279 : a6 49 __ LDX T2 + 0 
327b : 9d ab bf STA $bfab,x ; (buff + 0)
327e : 8a __ __ TXA
327f : f0 0b __ BEQ $328c ; (printf.s1001 + 0)
.s117:
3281 : a9 ab __ LDA #$ab
3283 : 85 0d __ STA P0 ; (fmt + 0)
3285 : a9 bf __ LDA #$bf
3287 : 85 0e __ STA P1 ; (fmt + 1)
3289 : 20 9d 35 JSR $359d ; (puts.s0 + 0)
.s1001:
328c : a2 03 __ LDX #$03
328e : bd 9f bf LDA $bf9f,x ; (printf@stack + 0)
3291 : 95 53 __ STA T8 + 0,x 
3293 : ca __ __ DEX
3294 : 10 f8 __ BPL $328e ; (printf.s1001 + 2)
3296 : 60 __ __ RTS
.s3:
3297 : c9 25 __ CMP #$25
3299 : f0 28 __ BEQ $32c3 ; (printf.s5 + 0)
.s6:
329b : a6 49 __ LDX T2 + 0 
329d : 9d ab bf STA $bfab,x ; (buff + 0)
32a0 : e6 4a __ INC T3 + 0 
32a2 : d0 02 __ BNE $32a6 ; (printf.s1098 + 0)
.s1097:
32a4 : e6 4b __ INC T3 + 1 
.s1098:
32a6 : e8 __ __ INX
32a7 : 86 49 __ STX T2 + 0 
32a9 : e0 28 __ CPX #$28
32ab : 90 c6 __ BCC $3273 ; (printf.l2 + 0)
.s111:
32ad : a9 ab __ LDA #$ab
32af : 85 0d __ STA P0 ; (fmt + 0)
32b1 : a9 bf __ LDA #$bf
32b3 : 85 0e __ STA P1 ; (fmt + 1)
32b5 : 98 __ __ TYA
32b6 : 9d ab bf STA $bfab,x ; (buff + 0)
32b9 : 20 9d 35 JSR $359d ; (puts.s0 + 0)
32bc : a9 00 __ LDA #$00
.s1068:
32be : 85 49 __ STA T2 + 0 
32c0 : 4c 73 32 JMP $3273 ; (printf.l2 + 0)
.s5:
32c3 : a5 49 __ LDA T2 + 0 
32c5 : f0 15 __ BEQ $32dc ; (printf.s10 + 0)
.s8:
32c7 : a9 ab __ LDA #$ab
32c9 : 85 0d __ STA P0 ; (fmt + 0)
32cb : a9 bf __ LDA #$bf
32cd : 85 0e __ STA P1 ; (fmt + 1)
32cf : 98 __ __ TYA
32d0 : a6 49 __ LDX T2 + 0 
32d2 : 9d ab bf STA $bfab,x ; (buff + 0)
32d5 : 20 9d 35 JSR $359d ; (puts.s0 + 0)
32d8 : a9 00 __ LDA #$00
32da : 85 49 __ STA T2 + 0 
.s10:
32dc : a9 0a __ LDA #$0a
32de : 8d a6 bf STA $bfa6 ; (si + 3)
32e1 : a9 00 __ LDA #$00
32e3 : 8d a7 bf STA $bfa7 ; (si + 4)
32e6 : 8d a8 bf STA $bfa8 ; (si + 5)
32e9 : 8d a9 bf STA $bfa9 ; (si + 6)
32ec : 8d aa bf STA $bfaa ; (si + 7)
32ef : a0 01 __ LDY #$01
32f1 : b1 4a __ LDA (T3 + 0),y 
32f3 : aa __ __ TAX
32f4 : a9 20 __ LDA #$20
32f6 : 8d a3 bf STA $bfa3 ; (si + 0)
32f9 : a9 00 __ LDA #$00
32fb : 8d a4 bf STA $bfa4 ; (si + 1)
32fe : a9 ff __ LDA #$ff
3300 : 8d a5 bf STA $bfa5 ; (si + 2)
3303 : 18 __ __ CLC
3304 : a5 4a __ LDA T3 + 0 
3306 : 69 02 __ ADC #$02
.l15:
3308 : 85 4a __ STA T3 + 0 
330a : 90 02 __ BCC $330e ; (printf.s1080 + 0)
.s1079:
330c : e6 4b __ INC T3 + 1 
.s1080:
330e : 8a __ __ TXA
330f : e0 2b __ CPX #$2b
3311 : d0 08 __ BNE $331b ; (printf.s18 + 0)
.s17:
3313 : a9 01 __ LDA #$01
3315 : 8d a8 bf STA $bfa8 ; (si + 5)
3318 : 4c 90 35 JMP $3590 ; (printf.s246 + 0)
.s18:
331b : c9 30 __ CMP #$30
331d : d0 06 __ BNE $3325 ; (printf.s21 + 0)
.s20:
331f : 8d a3 bf STA $bfa3 ; (si + 0)
3322 : 4c 90 35 JMP $3590 ; (printf.s246 + 0)
.s21:
3325 : e0 23 __ CPX #$23
3327 : d0 08 __ BNE $3331 ; (printf.s24 + 0)
.s23:
3329 : a9 01 __ LDA #$01
332b : 8d aa bf STA $bfaa ; (si + 7)
332e : 4c 90 35 JMP $3590 ; (printf.s246 + 0)
.s24:
3331 : e0 2d __ CPX #$2d
3333 : d0 08 __ BNE $333d ; (printf.s16 + 0)
.s26:
3335 : a9 01 __ LDA #$01
3337 : 8d a9 bf STA $bfa9 ; (si + 6)
333a : 4c 90 35 JMP $3590 ; (printf.s246 + 0)
.s16:
333d : 85 4c __ STA T4 + 0 
333f : e0 30 __ CPX #$30
3341 : 90 53 __ BCC $3396 ; (printf.s32 + 0)
.s33:
3343 : e0 3a __ CPX #$3a
3345 : b0 4f __ BCS $3396 ; (printf.s32 + 0)
.s30:
3347 : a9 00 __ LDA #$00
3349 : 85 4d __ STA T6 + 0 
334b : 85 4e __ STA T6 + 1 
334d : e0 3a __ CPX #$3a
334f : b0 40 __ BCS $3391 ; (printf.s36 + 0)
.l35:
3351 : a5 4d __ LDA T6 + 0 
3353 : 0a __ __ ASL
3354 : 85 1b __ STA ACCU + 0 
3356 : a5 4e __ LDA T6 + 1 
3358 : 2a __ __ ROL
3359 : 06 1b __ ASL ACCU + 0 
335b : 2a __ __ ROL
335c : aa __ __ TAX
335d : 18 __ __ CLC
335e : a5 1b __ LDA ACCU + 0 
3360 : 65 4d __ ADC T6 + 0 
3362 : 85 4d __ STA T6 + 0 
3364 : 8a __ __ TXA
3365 : 65 4e __ ADC T6 + 1 
3367 : 06 4d __ ASL T6 + 0 
3369 : 2a __ __ ROL
336a : aa __ __ TAX
336b : 18 __ __ CLC
336c : a5 4d __ LDA T6 + 0 
336e : 65 4c __ ADC T4 + 0 
3370 : 90 01 __ BCC $3373 ; (printf.s1094 + 0)
.s1093:
3372 : e8 __ __ INX
.s1094:
3373 : 38 __ __ SEC
3374 : e9 30 __ SBC #$30
3376 : 85 4d __ STA T6 + 0 
3378 : 8a __ __ TXA
3379 : e9 00 __ SBC #$00
337b : 85 4e __ STA T6 + 1 
337d : a0 00 __ LDY #$00
337f : b1 4a __ LDA (T3 + 0),y 
3381 : 85 4c __ STA T4 + 0 
3383 : e6 4a __ INC T3 + 0 
3385 : d0 02 __ BNE $3389 ; (printf.s1096 + 0)
.s1095:
3387 : e6 4b __ INC T3 + 1 
.s1096:
3389 : c9 30 __ CMP #$30
338b : 90 04 __ BCC $3391 ; (printf.s36 + 0)
.s37:
338d : c9 3a __ CMP #$3a
338f : 90 c0 __ BCC $3351 ; (printf.l35 + 0)
.s36:
3391 : a5 4d __ LDA T6 + 0 
3393 : 8d a4 bf STA $bfa4 ; (si + 1)
.s32:
3396 : a5 4c __ LDA T4 + 0 
3398 : c9 2e __ CMP #$2e
339a : d0 51 __ BNE $33ed ; (printf.s40 + 0)
.s38:
339c : a9 00 __ LDA #$00
339e : 85 4d __ STA T6 + 0 
.l231:
33a0 : 85 4e __ STA T6 + 1 
33a2 : a0 00 __ LDY #$00
33a4 : b1 4a __ LDA (T3 + 0),y 
33a6 : 85 4c __ STA T4 + 0 
33a8 : e6 4a __ INC T3 + 0 
33aa : d0 02 __ BNE $33ae ; (printf.s1082 + 0)
.s1081:
33ac : e6 4b __ INC T3 + 1 
.s1082:
33ae : c9 30 __ CMP #$30
33b0 : 90 04 __ BCC $33b6 ; (printf.s43 + 0)
.s44:
33b2 : c9 3a __ CMP #$3a
33b4 : 90 0a __ BCC $33c0 ; (printf.s42 + 0)
.s43:
33b6 : a5 4d __ LDA T6 + 0 
33b8 : 8d a5 bf STA $bfa5 ; (si + 2)
33bb : a5 4c __ LDA T4 + 0 
33bd : 4c ed 33 JMP $33ed ; (printf.s40 + 0)
.s42:
33c0 : a5 4d __ LDA T6 + 0 
33c2 : 0a __ __ ASL
33c3 : 85 1b __ STA ACCU + 0 
33c5 : a5 4e __ LDA T6 + 1 
33c7 : 2a __ __ ROL
33c8 : 06 1b __ ASL ACCU + 0 
33ca : 2a __ __ ROL
33cb : aa __ __ TAX
33cc : 18 __ __ CLC
33cd : a5 1b __ LDA ACCU + 0 
33cf : 65 4d __ ADC T6 + 0 
33d1 : 85 4d __ STA T6 + 0 
33d3 : 8a __ __ TXA
33d4 : 65 4e __ ADC T6 + 1 
33d6 : 06 4d __ ASL T6 + 0 
33d8 : 2a __ __ ROL
33d9 : aa __ __ TAX
33da : 18 __ __ CLC
33db : a5 4d __ LDA T6 + 0 
33dd : 65 4c __ ADC T4 + 0 
33df : 90 01 __ BCC $33e2 ; (printf.s1092 + 0)
.s1091:
33e1 : e8 __ __ INX
.s1092:
33e2 : 38 __ __ SEC
33e3 : e9 30 __ SBC #$30
33e5 : 85 4d __ STA T6 + 0 
33e7 : 8a __ __ TXA
33e8 : e9 00 __ SBC #$00
33ea : 4c a0 33 JMP $33a0 ; (printf.l231 + 0)
.s40:
33ed : c9 64 __ CMP #$64
33ef : f0 04 __ BEQ $33f5 ; (printf.s45 + 0)
.s48:
33f1 : c9 44 __ CMP #$44
33f3 : d0 05 __ BNE $33fa ; (printf.s46 + 0)
.s45:
33f5 : a9 01 __ LDA #$01
33f7 : 4c 69 35 JMP $3569 ; (printf.s247 + 0)
.s46:
33fa : c9 75 __ CMP #$75
33fc : d0 03 __ BNE $3401 ; (printf.s52 + 0)
33fe : 4c 67 35 JMP $3567 ; (printf.s269 + 0)
.s52:
3401 : c9 55 __ CMP #$55
3403 : d0 03 __ BNE $3408 ; (printf.s50 + 0)
3405 : 4c 67 35 JMP $3567 ; (printf.s269 + 0)
.s50:
3408 : c9 78 __ CMP #$78
340a : f0 04 __ BEQ $3410 ; (printf.s53 + 0)
.s56:
340c : c9 58 __ CMP #$58
340e : d0 0d __ BNE $341d ; (printf.s54 + 0)
.s53:
3410 : a9 10 __ LDA #$10
3412 : 8d a6 bf STA $bfa6 ; (si + 3)
3415 : a9 00 __ LDA #$00
3417 : 8d a7 bf STA $bfa7 ; (si + 4)
341a : 4c 67 35 JMP $3567 ; (printf.s269 + 0)
.s54:
341d : c9 6c __ CMP #$6c
341f : d0 03 __ BNE $3424 ; (printf.s60 + 0)
3421 : 4c f9 34 JMP $34f9 ; (printf.s57 + 0)
.s60:
3424 : c9 4c __ CMP #$4c
3426 : d0 03 __ BNE $342b ; (printf.s58 + 0)
3428 : 4c f9 34 JMP $34f9 ; (printf.s57 + 0)
.s58:
342b : c9 73 __ CMP #$73
342d : f0 39 __ BEQ $3468 ; (printf.s73 + 0)
.s76:
342f : c9 53 __ CMP #$53
3431 : f0 35 __ BEQ $3468 ; (printf.s73 + 0)
.s74:
3433 : c9 63 __ CMP #$63
3435 : f0 15 __ BEQ $344c ; (printf.s104 + 0)
.s107:
3437 : c9 43 __ CMP #$43
3439 : f0 11 __ BEQ $344c ; (printf.s104 + 0)
.s105:
343b : 09 00 __ ORA #$00
343d : d0 03 __ BNE $3442 ; (printf.s108 + 0)
343f : 4c 73 32 JMP $3273 ; (printf.l2 + 0)
.s108:
3442 : a6 49 __ LDX T2 + 0 
3444 : 9d ab bf STA $bfab,x ; (buff + 0)
3447 : e6 49 __ INC T2 + 0 
3449 : 4c 73 32 JMP $3273 ; (printf.l2 + 0)
.s104:
344c : a0 00 __ LDY #$00
344e : b1 47 __ LDA (T0 + 0),y 
3450 : a6 49 __ LDX T2 + 0 
3452 : 9d ab bf STA $bfab,x ; (buff + 0)
3455 : e6 49 __ INC T2 + 0 
.s244:
3457 : 18 __ __ CLC
3458 : a5 47 __ LDA T0 + 0 
345a : 69 02 __ ADC #$02
345c : 85 47 __ STA T0 + 0 
345e : b0 03 __ BCS $3463 ; (printf.s1083 + 0)
3460 : 4c 73 32 JMP $3273 ; (printf.l2 + 0)
.s1083:
3463 : e6 48 __ INC T0 + 1 
3465 : 4c 73 32 JMP $3273 ; (printf.l2 + 0)
.s73:
3468 : a0 00 __ LDY #$00
346a : 84 4c __ STY T4 + 0 
346c : b1 47 __ LDA (T0 + 0),y 
346e : 85 4d __ STA T6 + 0 
3470 : c8 __ __ INY
3471 : b1 47 __ LDA (T0 + 0),y 
3473 : 85 4e __ STA T6 + 1 
3475 : 18 __ __ CLC
3476 : a5 47 __ LDA T0 + 0 
3478 : 69 02 __ ADC #$02
347a : 85 47 __ STA T0 + 0 
347c : 90 02 __ BCC $3480 ; (printf.s1090 + 0)
.s1089:
347e : e6 48 __ INC T0 + 1 
.s1090:
3480 : ad a4 bf LDA $bfa4 ; (si + 1)
3483 : f0 0d __ BEQ $3492 ; (printf.s79 + 0)
.s1071:
3485 : a0 00 __ LDY #$00
3487 : b1 4d __ LDA (T6 + 0),y 
3489 : f0 05 __ BEQ $3490 ; (printf.s1072 + 0)
.l81:
348b : c8 __ __ INY
348c : b1 4d __ LDA (T6 + 0),y 
348e : d0 fb __ BNE $348b ; (printf.l81 + 0)
.s1072:
3490 : 84 4c __ STY T4 + 0 
.s79:
3492 : ad a9 bf LDA $bfa9 ; (si + 6)
3495 : d0 1a __ BNE $34b1 ; (printf.s85 + 0)
.s1075:
3497 : a4 4c __ LDY T4 + 0 
3499 : cc a4 bf CPY $bfa4 ; (si + 1)
349c : a6 49 __ LDX T2 + 0 
349e : b0 0d __ BCS $34ad ; (printf.s1076 + 0)
.l87:
34a0 : ad a3 bf LDA $bfa3 ; (si + 0)
34a3 : 9d ab bf STA $bfab,x ; (buff + 0)
34a6 : c8 __ __ INY
34a7 : cc a4 bf CPY $bfa4 ; (si + 1)
34aa : e8 __ __ INX
34ab : 90 f3 __ BCC $34a0 ; (printf.l87 + 0)
.s1076:
34ad : 86 49 __ STX T2 + 0 
34af : 84 4c __ STY T4 + 0 
.s85:
34b1 : a5 49 __ LDA T2 + 0 
34b3 : f0 16 __ BEQ $34cb ; (printf.s238 + 0)
.s92:
34b5 : a9 ab __ LDA #$ab
34b7 : 85 0d __ STA P0 ; (fmt + 0)
34b9 : a9 bf __ LDA #$bf
34bb : 85 0e __ STA P1 ; (fmt + 1)
34bd : a9 00 __ LDA #$00
34bf : a6 49 __ LDX T2 + 0 
34c1 : 9d ab bf STA $bfab,x ; (buff + 0)
34c4 : 20 9d 35 JSR $359d ; (puts.s0 + 0)
34c7 : a9 00 __ LDA #$00
34c9 : 85 49 __ STA T2 + 0 
.s238:
34cb : a5 4d __ LDA T6 + 0 
34cd : 85 0d __ STA P0 ; (fmt + 0)
34cf : a5 4e __ LDA T6 + 1 
34d1 : 85 0e __ STA P1 ; (fmt + 1)
34d3 : 20 9d 35 JSR $359d ; (puts.s0 + 0)
34d6 : ad a9 bf LDA $bfa9 ; (si + 6)
34d9 : d0 03 __ BNE $34de ; (printf.s1073 + 0)
34db : 4c 73 32 JMP $3273 ; (printf.l2 + 0)
.s1073:
34de : a4 4c __ LDY T4 + 0 
34e0 : cc a4 bf CPY $bfa4 ; (si + 1)
34e3 : a2 00 __ LDX #$00
34e5 : b0 0d __ BCS $34f4 ; (printf.s1074 + 0)
.l102:
34e7 : ad a3 bf LDA $bfa3 ; (si + 0)
34ea : 9d ab bf STA $bfab,x ; (buff + 0)
34ed : c8 __ __ INY
34ee : cc a4 bf CPY $bfa4 ; (si + 1)
34f1 : e8 __ __ INX
34f2 : 90 f3 __ BCC $34e7 ; (printf.l102 + 0)
.s1074:
34f4 : 86 49 __ STX T2 + 0 
34f6 : 4c 73 32 JMP $3273 ; (printf.l2 + 0)
.s57:
34f9 : a0 00 __ LDY #$00
34fb : b1 47 __ LDA (T0 + 0),y 
34fd : 85 53 __ STA T8 + 0 
34ff : c8 __ __ INY
3500 : b1 47 __ LDA (T0 + 0),y 
3502 : 85 54 __ STA T8 + 1 
3504 : c8 __ __ INY
3505 : b1 47 __ LDA (T0 + 0),y 
3507 : 85 55 __ STA T8 + 2 
3509 : c8 __ __ INY
350a : b1 47 __ LDA (T0 + 0),y 
350c : 85 56 __ STA T8 + 3 
350e : 18 __ __ CLC
350f : a5 47 __ LDA T0 + 0 
3511 : 69 04 __ ADC #$04
3513 : 85 47 __ STA T0 + 0 
3515 : 90 02 __ BCC $3519 ; (printf.s1086 + 0)
.s1085:
3517 : e6 48 __ INC T0 + 1 
.s1086:
3519 : a0 00 __ LDY #$00
351b : b1 4a __ LDA (T3 + 0),y 
351d : aa __ __ TAX
351e : e6 4a __ INC T3 + 0 
3520 : d0 02 __ BNE $3524 ; (printf.s1088 + 0)
.s1087:
3522 : e6 4b __ INC T3 + 1 
.s1088:
3524 : 8a __ __ TXA
3525 : e0 64 __ CPX #$64
3527 : f0 04 __ BEQ $352d ; (printf.s61 + 0)
.s64:
3529 : c9 44 __ CMP #$44
352b : d0 04 __ BNE $3531 ; (printf.s62 + 0)
.s61:
352d : a9 01 __ LDA #$01
352f : d0 1c __ BNE $354d ; (printf.s245 + 0)
.s62:
3531 : c9 75 __ CMP #$75
3533 : f0 17 __ BEQ $354c ; (printf.s268 + 0)
.s68:
3535 : c9 55 __ CMP #$55
3537 : f0 13 __ BEQ $354c ; (printf.s268 + 0)
.s66:
3539 : c9 78 __ CMP #$78
353b : f0 07 __ BEQ $3544 ; (printf.s69 + 0)
.s72:
353d : c9 58 __ CMP #$58
353f : f0 03 __ BEQ $3544 ; (printf.s69 + 0)
3541 : 4c 73 32 JMP $3273 ; (printf.l2 + 0)
.s69:
3544 : 8c a7 bf STY $bfa7 ; (si + 4)
3547 : a9 10 __ LDA #$10
3549 : 8d a6 bf STA $bfa6 ; (si + 3)
.s268:
354c : 98 __ __ TYA
.s245:
354d : 85 15 __ STA P8 
354f : a9 ab __ LDA #$ab
3551 : 85 0f __ STA P2 ; (fmt + 2)
3553 : a9 bf __ LDA #$bf
3555 : 85 10 __ STA P3 ; (fmt + 3)
3557 : a9 a3 __ LDA #$a3
3559 : 85 0d __ STA P0 ; (fmt + 0)
355b : a9 bf __ LDA #$bf
355d : 85 0e __ STA P1 ; (fmt + 1)
355f : 20 27 37 JSR $3727 ; (nforml@proxy + 0)
3562 : a5 1b __ LDA ACCU + 0 
3564 : 4c be 32 JMP $32be ; (printf.s1068 + 0)
.s269:
3567 : a9 00 __ LDA #$00
.s247:
3569 : 85 13 __ STA P6 
356b : a9 ab __ LDA #$ab
356d : 85 0f __ STA P2 ; (fmt + 2)
356f : a9 bf __ LDA #$bf
3571 : 85 10 __ STA P3 ; (fmt + 3)
3573 : a0 00 __ LDY #$00
3575 : b1 47 __ LDA (T0 + 0),y 
3577 : 85 11 __ STA P4 
3579 : c8 __ __ INY
357a : b1 47 __ LDA (T0 + 0),y 
357c : 85 12 __ STA P5 
357e : a9 a3 __ LDA #$a3
3580 : 85 0d __ STA P0 ; (fmt + 0)
3582 : a9 bf __ LDA #$bf
3584 : 85 0e __ STA P1 ; (fmt + 1)
3586 : 20 f2 35 JSR $35f2 ; (nformi.s0 + 0)
3589 : a5 1b __ LDA ACCU + 0 
358b : 85 49 __ STA T2 + 0 
358d : 4c 57 34 JMP $3457 ; (printf.s244 + 0)
.s246:
3590 : a0 00 __ LDY #$00
3592 : b1 4a __ LDA (T3 + 0),y 
3594 : aa __ __ TAX
3595 : 18 __ __ CLC
3596 : a5 4a __ LDA T3 + 0 
3598 : 69 01 __ ADC #$01
359a : 4c 08 33 JMP $3308 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
359d : a0 00 __ LDY #$00
359f : b1 0d __ LDA (P0),y 
35a1 : f0 0b __ BEQ $35ae ; (puts.s1001 + 0)
35a3 : 20 af 35 JSR $35af ; (putpch + 0)
35a6 : e6 0d __ INC P0 
35a8 : d0 f3 __ BNE $359d ; (puts.s0 + 0)
35aa : e6 0e __ INC P1 
35ac : d0 ef __ BNE $359d ; (puts.s0 + 0)
.s1001:
35ae : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
35af : ae f4 41 LDX $41f4 ; (giocharmap + 0)
35b2 : e0 01 __ CPX #$01
35b4 : 90 26 __ BCC $35dc ; (putpch + 45)
35b6 : c9 0a __ CMP #$0a
35b8 : d0 02 __ BNE $35bc ; (putpch + 13)
35ba : a9 0d __ LDA #$0d
35bc : c9 09 __ CMP #$09
35be : f0 1f __ BEQ $35df ; (putpch + 48)
35c0 : e0 02 __ CPX #$02
35c2 : 90 18 __ BCC $35dc ; (putpch + 45)
35c4 : c9 41 __ CMP #$41
35c6 : 90 14 __ BCC $35dc ; (putpch + 45)
35c8 : c9 7b __ CMP #$7b
35ca : b0 10 __ BCS $35dc ; (putpch + 45)
35cc : c9 61 __ CMP #$61
35ce : b0 04 __ BCS $35d4 ; (putpch + 37)
35d0 : c9 5b __ CMP #$5b
35d2 : b0 08 __ BCS $35dc ; (putpch + 45)
35d4 : 49 20 __ EOR #$20
35d6 : e0 03 __ CPX #$03
35d8 : f0 02 __ BEQ $35dc ; (putpch + 45)
35da : 29 df __ AND #$df
35dc : 4c d2 ff JMP $ffd2 
35df : 38 __ __ SEC
35e0 : 20 f0 ff JSR $fff0 
35e3 : 98 __ __ TYA
35e4 : 29 03 __ AND #$03
35e6 : 49 03 __ EOR #$03
35e8 : aa __ __ TAX
35e9 : a9 20 __ LDA #$20
35eb : 20 d2 ff JSR $ffd2 
35ee : ca __ __ DEX
35ef : 10 fa __ BPL $35eb ; (putpch + 60)
35f1 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
35f2 : a9 00 __ LDA #$00
35f4 : 85 43 __ STA T0 + 0 
35f6 : a5 13 __ LDA P6 ; (s + 0)
35f8 : f0 13 __ BEQ $360d ; (nformi.s182 + 0)
.s4:
35fa : 24 12 __ BIT P5 ; (v + 1)
35fc : 10 0f __ BPL $360d ; (nformi.s182 + 0)
.s1:
35fe : 38 __ __ SEC
35ff : a9 00 __ LDA #$00
3601 : e5 11 __ SBC P4 ; (v + 0)
3603 : 85 11 __ STA P4 ; (v + 0)
3605 : a9 00 __ LDA #$00
3607 : e5 12 __ SBC P5 ; (v + 1)
3609 : 85 12 __ STA P5 ; (v + 1)
360b : e6 43 __ INC T0 + 0 
.s182:
360d : a9 10 __ LDA #$10
360f : 85 44 __ STA T2 + 0 
3611 : a5 11 __ LDA P4 ; (v + 0)
3613 : 05 12 __ ORA P5 ; (v + 1)
3615 : f0 46 __ BEQ $365d ; (nformi.s7 + 0)
.s42:
3617 : a0 03 __ LDY #$03
3619 : b1 0d __ LDA (P0),y ; (si + 0)
361b : 85 45 __ STA T4 + 0 
361d : c8 __ __ INY
361e : b1 0d __ LDA (P0),y ; (si + 0)
3620 : 85 46 __ STA T4 + 1 
.l6:
3622 : a5 11 __ LDA P4 ; (v + 0)
3624 : 85 1b __ STA ACCU + 0 
3626 : a5 12 __ LDA P5 ; (v + 1)
3628 : 85 1c __ STA ACCU + 1 
362a : a5 45 __ LDA T4 + 0 
362c : 85 03 __ STA WORK + 0 
362e : a5 46 __ LDA T4 + 1 
3630 : 85 04 __ STA WORK + 1 
3632 : 20 17 43 JSR $4317 ; (divmod + 0)
3635 : a5 06 __ LDA WORK + 3 
3637 : 30 08 __ BMI $3641 ; (nformi.s78 + 0)
.s1019:
3639 : d0 0a __ BNE $3645 ; (nformi.s77 + 0)
.s1018:
363b : a5 05 __ LDA WORK + 2 
363d : c9 0a __ CMP #$0a
363f : b0 04 __ BCS $3645 ; (nformi.s77 + 0)
.s78:
3641 : a9 30 __ LDA #$30
3643 : d0 02 __ BNE $3647 ; (nformi.s79 + 0)
.s77:
3645 : a9 37 __ LDA #$37
.s79:
3647 : 18 __ __ CLC
3648 : 65 05 __ ADC WORK + 2 
364a : c6 44 __ DEC T2 + 0 
364c : a6 44 __ LDX T2 + 0 
364e : 9d dd bf STA $bfdd,x ; (buffer + 0)
3651 : a5 1b __ LDA ACCU + 0 
3653 : 85 11 __ STA P4 ; (v + 0)
3655 : a5 1c __ LDA ACCU + 1 
3657 : 85 12 __ STA P5 ; (v + 1)
3659 : 05 11 __ ORA P4 ; (v + 0)
365b : d0 c5 __ BNE $3622 ; (nformi.l6 + 0)
.s7:
365d : a0 02 __ LDY #$02
365f : b1 0d __ LDA (P0),y ; (si + 0)
3661 : c9 ff __ CMP #$ff
3663 : d0 04 __ BNE $3669 ; (nformi.s80 + 0)
.s81:
3665 : a9 0f __ LDA #$0f
3667 : d0 05 __ BNE $366e ; (nformi.s1026 + 0)
.s80:
3669 : 38 __ __ SEC
366a : a9 10 __ LDA #$10
366c : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
366e : a8 __ __ TAY
366f : c4 44 __ CPY T2 + 0 
3671 : b0 0d __ BCS $3680 ; (nformi.s10 + 0)
.s9:
3673 : a9 30 __ LDA #$30
.l1027:
3675 : c6 44 __ DEC T2 + 0 
3677 : a6 44 __ LDX T2 + 0 
3679 : 9d dd bf STA $bfdd,x ; (buffer + 0)
367c : c4 44 __ CPY T2 + 0 
367e : 90 f5 __ BCC $3675 ; (nformi.l1027 + 0)
.s10:
3680 : a0 07 __ LDY #$07
3682 : b1 0d __ LDA (P0),y ; (si + 0)
3684 : f0 20 __ BEQ $36a6 ; (nformi.s13 + 0)
.s14:
3686 : a0 04 __ LDY #$04
3688 : b1 0d __ LDA (P0),y ; (si + 0)
368a : d0 1a __ BNE $36a6 ; (nformi.s13 + 0)
.s1013:
368c : 88 __ __ DEY
368d : b1 0d __ LDA (P0),y ; (si + 0)
368f : c9 10 __ CMP #$10
3691 : d0 13 __ BNE $36a6 ; (nformi.s13 + 0)
.s11:
3693 : a9 58 __ LDA #$58
3695 : a6 44 __ LDX T2 + 0 
3697 : 9d dc bf STA $bfdc,x ; (buff + 49)
369a : 8a __ __ TXA
369b : 18 __ __ CLC
369c : 69 fe __ ADC #$fe
369e : 85 44 __ STA T2 + 0 
36a0 : aa __ __ TAX
36a1 : a9 30 __ LDA #$30
36a3 : 9d dd bf STA $bfdd,x ; (buffer + 0)
.s13:
36a6 : a9 00 __ LDA #$00
36a8 : 85 1b __ STA ACCU + 0 
36aa : a5 43 __ LDA T0 + 0 
36ac : f0 06 __ BEQ $36b4 ; (nformi.s16 + 0)
.s15:
36ae : c6 44 __ DEC T2 + 0 
36b0 : a9 2d __ LDA #$2d
36b2 : d0 0a __ BNE $36be ; (nformi.s1025 + 0)
.s16:
36b4 : a0 05 __ LDY #$05
36b6 : b1 0d __ LDA (P0),y ; (si + 0)
36b8 : f0 09 __ BEQ $36c3 ; (nformi.s163 + 0)
.s18:
36ba : c6 44 __ DEC T2 + 0 
36bc : a9 2b __ LDA #$2b
.s1025:
36be : a6 44 __ LDX T2 + 0 
36c0 : 9d dd bf STA $bfdd,x ; (buffer + 0)
.s163:
36c3 : a0 06 __ LDY #$06
36c5 : b1 0d __ LDA (P0),y ; (si + 0)
36c7 : d0 33 __ BNE $36fc ; (nformi.s24 + 0)
.l30:
36c9 : a0 01 __ LDY #$01
36cb : b1 0d __ LDA (P0),y ; (si + 0)
36cd : 18 __ __ CLC
36ce : 65 44 __ ADC T2 + 0 
36d0 : b0 04 __ BCS $36d6 ; (nformi.s31 + 0)
.s1006:
36d2 : c9 11 __ CMP #$11
36d4 : 90 0d __ BCC $36e3 ; (nformi.s33 + 0)
.s31:
36d6 : c6 44 __ DEC T2 + 0 
36d8 : a0 00 __ LDY #$00
36da : b1 0d __ LDA (P0),y ; (si + 0)
36dc : a6 44 __ LDX T2 + 0 
36de : 9d dd bf STA $bfdd,x ; (buffer + 0)
36e1 : b0 e6 __ BCS $36c9 ; (nformi.l30 + 0)
.s33:
36e3 : a6 44 __ LDX T2 + 0 
36e5 : e0 10 __ CPX #$10
36e7 : b0 0e __ BCS $36f7 ; (nformi.s23 + 0)
.s34:
36e9 : 88 __ __ DEY
.l1022:
36ea : bd dd bf LDA $bfdd,x ; (buffer + 0)
36ed : 91 0f __ STA (P2),y ; (str + 0)
36ef : e8 __ __ INX
36f0 : e0 10 __ CPX #$10
36f2 : c8 __ __ INY
36f3 : 90 f5 __ BCC $36ea ; (nformi.l1022 + 0)
.s1023:
36f5 : 84 1b __ STY ACCU + 0 
.s23:
36f7 : a9 00 __ LDA #$00
36f9 : 85 1c __ STA ACCU + 1 
.s1001:
36fb : 60 __ __ RTS
.s24:
36fc : a6 44 __ LDX T2 + 0 
36fe : e0 10 __ CPX #$10
3700 : b0 1a __ BCS $371c ; (nformi.l27 + 0)
.s25:
3702 : a0 00 __ LDY #$00
.l1020:
3704 : bd dd bf LDA $bfdd,x ; (buffer + 0)
3707 : 91 0f __ STA (P2),y ; (str + 0)
3709 : e8 __ __ INX
370a : e0 10 __ CPX #$10
370c : c8 __ __ INY
370d : 90 f5 __ BCC $3704 ; (nformi.l1020 + 0)
.s1021:
370f : 84 1b __ STY ACCU + 0 
3711 : b0 09 __ BCS $371c ; (nformi.l27 + 0)
.s28:
3713 : 88 __ __ DEY
3714 : b1 0d __ LDA (P0),y ; (si + 0)
3716 : a4 1b __ LDY ACCU + 0 
3718 : 91 0f __ STA (P2),y ; (str + 0)
371a : e6 1b __ INC ACCU + 0 
.l27:
371c : a5 1b __ LDA ACCU + 0 
371e : a0 01 __ LDY #$01
3720 : d1 0d __ CMP (P0),y ; (si + 0)
3722 : 90 ef __ BCC $3713 ; (nformi.s28 + 0)
3724 : 4c f7 36 JMP $36f7 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml@proxy: ; nforml@proxy
3727 : a5 53 __ LDA $53 
3729 : 85 11 __ STA P4 
372b : a5 54 __ LDA $54 
372d : 85 12 __ STA P5 
372f : a5 55 __ LDA $55 
3731 : 85 13 __ STA P6 
3733 : a5 56 __ LDA $56 
3735 : 85 14 __ STA P7 
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
3737 : a9 00 __ LDA #$00
3739 : 85 43 __ STA T0 + 0 
373b : a5 15 __ LDA P8 ; (s + 0)
373d : f0 21 __ BEQ $3760 ; (nforml.s182 + 0)
.s4:
373f : a5 14 __ LDA P7 ; (v + 3)
3741 : f0 1d __ BEQ $3760 ; (nforml.s182 + 0)
.s1032:
3743 : 10 1b __ BPL $3760 ; (nforml.s182 + 0)
.s1:
3745 : 38 __ __ SEC
3746 : a9 00 __ LDA #$00
3748 : e5 11 __ SBC P4 ; (v + 0)
374a : 85 11 __ STA P4 ; (v + 0)
374c : a9 00 __ LDA #$00
374e : e5 12 __ SBC P5 ; (v + 1)
3750 : 85 12 __ STA P5 ; (v + 1)
3752 : a9 00 __ LDA #$00
3754 : e5 13 __ SBC P6 ; (v + 2)
3756 : 85 13 __ STA P6 ; (v + 2)
3758 : a9 00 __ LDA #$00
375a : e5 14 __ SBC P7 ; (v + 3)
375c : 85 14 __ STA P7 ; (v + 3)
375e : e6 43 __ INC T0 + 0 
.s182:
3760 : a9 10 __ LDA #$10
3762 : 85 44 __ STA T2 + 0 
3764 : a5 14 __ LDA P7 ; (v + 3)
3766 : d0 0c __ BNE $3774 ; (nforml.s42 + 0)
.s1024:
3768 : a5 13 __ LDA P6 ; (v + 2)
376a : d0 08 __ BNE $3774 ; (nforml.s42 + 0)
.s1025:
376c : a5 12 __ LDA P5 ; (v + 1)
376e : d0 04 __ BNE $3774 ; (nforml.s42 + 0)
.s1026:
3770 : c5 11 __ CMP P4 ; (v + 0)
3772 : b0 0e __ BCS $3782 ; (nforml.s7 + 0)
.s42:
3774 : a0 03 __ LDY #$03
3776 : b1 0d __ LDA (P0),y ; (si + 0)
3778 : 85 45 __ STA T5 + 0 
377a : c8 __ __ INY
377b : b1 0d __ LDA (P0),y ; (si + 0)
377d : 85 46 __ STA T5 + 1 
377f : 4c 4c 38 JMP $384c ; (nforml.l6 + 0)
.s7:
3782 : a0 02 __ LDY #$02
3784 : b1 0d __ LDA (P0),y ; (si + 0)
3786 : c9 ff __ CMP #$ff
3788 : d0 04 __ BNE $378e ; (nforml.s80 + 0)
.s81:
378a : a9 0f __ LDA #$0f
378c : d0 05 __ BNE $3793 ; (nforml.s1039 + 0)
.s80:
378e : 38 __ __ SEC
378f : a9 10 __ LDA #$10
3791 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
3793 : a8 __ __ TAY
3794 : c4 44 __ CPY T2 + 0 
3796 : b0 0d __ BCS $37a5 ; (nforml.s10 + 0)
.s9:
3798 : a9 30 __ LDA #$30
.l1040:
379a : c6 44 __ DEC T2 + 0 
379c : a6 44 __ LDX T2 + 0 
379e : 9d dd bf STA $bfdd,x ; (buffer + 0)
37a1 : c4 44 __ CPY T2 + 0 
37a3 : 90 f5 __ BCC $379a ; (nforml.l1040 + 0)
.s10:
37a5 : a0 07 __ LDY #$07
37a7 : b1 0d __ LDA (P0),y ; (si + 0)
37a9 : f0 20 __ BEQ $37cb ; (nforml.s13 + 0)
.s14:
37ab : a0 04 __ LDY #$04
37ad : b1 0d __ LDA (P0),y ; (si + 0)
37af : d0 1a __ BNE $37cb ; (nforml.s13 + 0)
.s1013:
37b1 : 88 __ __ DEY
37b2 : b1 0d __ LDA (P0),y ; (si + 0)
37b4 : c9 10 __ CMP #$10
37b6 : d0 13 __ BNE $37cb ; (nforml.s13 + 0)
.s11:
37b8 : a9 58 __ LDA #$58
37ba : a6 44 __ LDX T2 + 0 
37bc : 9d dc bf STA $bfdc,x ; (buff + 49)
37bf : 8a __ __ TXA
37c0 : 18 __ __ CLC
37c1 : 69 fe __ ADC #$fe
37c3 : 85 44 __ STA T2 + 0 
37c5 : aa __ __ TAX
37c6 : a9 30 __ LDA #$30
37c8 : 9d dd bf STA $bfdd,x ; (buffer + 0)
.s13:
37cb : a9 00 __ LDA #$00
37cd : 85 1b __ STA ACCU + 0 
37cf : a5 43 __ LDA T0 + 0 
37d1 : f0 06 __ BEQ $37d9 ; (nforml.s16 + 0)
.s15:
37d3 : c6 44 __ DEC T2 + 0 
37d5 : a9 2d __ LDA #$2d
37d7 : d0 0a __ BNE $37e3 ; (nforml.s1038 + 0)
.s16:
37d9 : a0 05 __ LDY #$05
37db : b1 0d __ LDA (P0),y ; (si + 0)
37dd : f0 09 __ BEQ $37e8 ; (nforml.s163 + 0)
.s18:
37df : c6 44 __ DEC T2 + 0 
37e1 : a9 2b __ LDA #$2b
.s1038:
37e3 : a6 44 __ LDX T2 + 0 
37e5 : 9d dd bf STA $bfdd,x ; (buffer + 0)
.s163:
37e8 : a0 06 __ LDY #$06
37ea : b1 0d __ LDA (P0),y ; (si + 0)
37ec : d0 33 __ BNE $3821 ; (nforml.s24 + 0)
.l30:
37ee : a0 01 __ LDY #$01
37f0 : b1 0d __ LDA (P0),y ; (si + 0)
37f2 : 18 __ __ CLC
37f3 : 65 44 __ ADC T2 + 0 
37f5 : b0 04 __ BCS $37fb ; (nforml.s31 + 0)
.s1006:
37f7 : c9 11 __ CMP #$11
37f9 : 90 0d __ BCC $3808 ; (nforml.s33 + 0)
.s31:
37fb : c6 44 __ DEC T2 + 0 
37fd : a0 00 __ LDY #$00
37ff : b1 0d __ LDA (P0),y ; (si + 0)
3801 : a6 44 __ LDX T2 + 0 
3803 : 9d dd bf STA $bfdd,x ; (buffer + 0)
3806 : b0 e6 __ BCS $37ee ; (nforml.l30 + 0)
.s33:
3808 : a6 44 __ LDX T2 + 0 
380a : e0 10 __ CPX #$10
380c : b0 0e __ BCS $381c ; (nforml.s23 + 0)
.s34:
380e : 88 __ __ DEY
.l1035:
380f : bd dd bf LDA $bfdd,x ; (buffer + 0)
3812 : 91 0f __ STA (P2),y ; (str + 0)
3814 : e8 __ __ INX
3815 : e0 10 __ CPX #$10
3817 : c8 __ __ INY
3818 : 90 f5 __ BCC $380f ; (nforml.l1035 + 0)
.s1036:
381a : 84 1b __ STY ACCU + 0 
.s23:
381c : a9 00 __ LDA #$00
381e : 85 1c __ STA ACCU + 1 
.s1001:
3820 : 60 __ __ RTS
.s24:
3821 : a6 44 __ LDX T2 + 0 
3823 : e0 10 __ CPX #$10
3825 : b0 1a __ BCS $3841 ; (nforml.l27 + 0)
.s25:
3827 : a0 00 __ LDY #$00
.l1033:
3829 : bd dd bf LDA $bfdd,x ; (buffer + 0)
382c : 91 0f __ STA (P2),y ; (str + 0)
382e : e8 __ __ INX
382f : e0 10 __ CPX #$10
3831 : c8 __ __ INY
3832 : 90 f5 __ BCC $3829 ; (nforml.l1033 + 0)
.s1034:
3834 : 84 1b __ STY ACCU + 0 
3836 : b0 09 __ BCS $3841 ; (nforml.l27 + 0)
.s28:
3838 : 88 __ __ DEY
3839 : b1 0d __ LDA (P0),y ; (si + 0)
383b : a4 1b __ LDY ACCU + 0 
383d : 91 0f __ STA (P2),y ; (str + 0)
383f : e6 1b __ INC ACCU + 0 
.l27:
3841 : a5 1b __ LDA ACCU + 0 
3843 : a0 01 __ LDY #$01
3845 : d1 0d __ CMP (P0),y ; (si + 0)
3847 : 90 ef __ BCC $3838 ; (nforml.s28 + 0)
3849 : 4c 1c 38 JMP $381c ; (nforml.s23 + 0)
.l6:
384c : a5 11 __ LDA P4 ; (v + 0)
384e : 85 1b __ STA ACCU + 0 
3850 : a5 12 __ LDA P5 ; (v + 1)
3852 : 85 1c __ STA ACCU + 1 
3854 : a5 13 __ LDA P6 ; (v + 2)
3856 : 85 1d __ STA ACCU + 2 
3858 : a5 14 __ LDA P7 ; (v + 3)
385a : 85 1e __ STA ACCU + 3 
385c : a5 45 __ LDA T5 + 0 
385e : 85 03 __ STA WORK + 0 
3860 : a5 46 __ LDA T5 + 1 
3862 : 85 04 __ STA WORK + 1 
3864 : a9 00 __ LDA #$00
3866 : 85 05 __ STA WORK + 2 
3868 : 85 06 __ STA WORK + 3 
386a : 20 9c 43 JSR $439c ; (divmod32 + 0)
386d : a5 08 __ LDA WORK + 5 
386f : 30 08 __ BMI $3879 ; (nforml.s78 + 0)
.s1023:
3871 : d0 0a __ BNE $387d ; (nforml.s77 + 0)
.s1022:
3873 : a5 07 __ LDA WORK + 4 
3875 : c9 0a __ CMP #$0a
3877 : b0 04 __ BCS $387d ; (nforml.s77 + 0)
.s78:
3879 : a9 30 __ LDA #$30
387b : d0 02 __ BNE $387f ; (nforml.s79 + 0)
.s77:
387d : a9 37 __ LDA #$37
.s79:
387f : 18 __ __ CLC
3880 : 65 07 __ ADC WORK + 4 
3882 : c6 44 __ DEC T2 + 0 
3884 : a6 44 __ LDX T2 + 0 
3886 : 9d dd bf STA $bfdd,x ; (buffer + 0)
3889 : a5 1b __ LDA ACCU + 0 
388b : 85 11 __ STA P4 ; (v + 0)
388d : a5 1c __ LDA ACCU + 1 
388f : 85 12 __ STA P5 ; (v + 1)
3891 : a5 1d __ LDA ACCU + 2 
3893 : 85 13 __ STA P6 ; (v + 2)
3895 : a5 1e __ LDA ACCU + 3 
3897 : 85 14 __ STA P7 ; (v + 3)
3899 : d0 b1 __ BNE $384c ; (nforml.l6 + 0)
.s1018:
389b : a5 13 __ LDA P6 ; (v + 2)
389d : d0 ad __ BNE $384c ; (nforml.l6 + 0)
.s1019:
389f : a5 12 __ LDA P5 ; (v + 1)
38a1 : d0 a9 __ BNE $384c ; (nforml.l6 + 0)
.s1020:
38a3 : c5 11 __ CMP P4 ; (v + 0)
38a5 : 90 a5 __ BCC $384c ; (nforml.l6 + 0)
38a7 : 4c 82 37 JMP $3782 ; (nforml.s7 + 0)
--------------------------------------------------------------------
38aa : __ __ __ BYT 73 77 69 74 63 68 20 74 6f 20 38 30 20 63 6f 6c : switch to 80 col
38ba : __ __ __ BYT 75 6d 6e 20 73 63 72 65 65 6e 0a 61 6e 64 20 70 : umn screen.and p
38ca : __ __ __ BYT 72 65 73 73 20 6b 65 79 2e 0a 00                : ress key...
--------------------------------------------------------------------
getch: ; getch()->i16
.s0:
38d5 : 20 e3 38 JSR $38e3 ; (getpch + 0)
38d8 : c9 00 __ CMP #$00
38da : f0 f9 __ BEQ $38d5 ; (getch.s0 + 0)
38dc : 85 1b __ STA ACCU + 0 
38de : a9 00 __ LDA #$00
38e0 : 85 1c __ STA ACCU + 1 
.s1001:
38e2 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
38e3 : 20 e4 ff JSR $ffe4 
38e6 : ae f4 41 LDX $41f4 ; (giocharmap + 0)
38e9 : e0 01 __ CPX #$01
38eb : 90 26 __ BCC $3913 ; (getpch + 48)
38ed : c9 0d __ CMP #$0d
38ef : d0 02 __ BNE $38f3 ; (getpch + 16)
38f1 : a9 0a __ LDA #$0a
38f3 : e0 02 __ CPX #$02
38f5 : 90 1c __ BCC $3913 ; (getpch + 48)
38f7 : c9 db __ CMP #$db
38f9 : b0 18 __ BCS $3913 ; (getpch + 48)
38fb : c9 41 __ CMP #$41
38fd : 90 14 __ BCC $3913 ; (getpch + 48)
38ff : c9 c1 __ CMP #$c1
3901 : 90 02 __ BCC $3905 ; (getpch + 34)
3903 : 49 a0 __ EOR #$a0
3905 : c9 7b __ CMP #$7b
3907 : b0 0a __ BCS $3913 ; (getpch + 48)
3909 : c9 61 __ CMP #$61
390b : b0 04 __ BCS $3911 ; (getpch + 46)
390d : c9 5b __ CMP #$5b
390f : b0 02 __ BCS $3913 ; (getpch + 48)
3911 : 49 20 __ EOR #$20
3913 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
3914 : 20 81 ff JSR $ff81 
.s1001:
3917 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
3918 : 24 d7 __ BIT $d7 
391a : 30 03 __ BMI $391f ; (screen_setmode.s1001 + 0)
.s6:
391c : 20 5f ff JSR $ff5f 
.s1001:
391f : 60 __ __ RTS
--------------------------------------------------------------------
3920 : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
3930 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
3940 : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
394a : __ __ __ BYT 4f 56 4c 31 00                                  : OVL1.
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
394f : a5 0d __ LDA P0 
3951 : a6 0e __ LDX P1 
3953 : 20 68 ff JSR $ff68 
.s1001:
3956 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
3957 : a5 0d __ LDA P0 
3959 : 05 0e __ ORA P1 
395b : f0 08 __ BEQ $3965 ; (krnio_setnam.s0 + 14)
395d : a0 ff __ LDY #$ff
395f : c8 __ __ INY
3960 : b1 0d __ LDA (P0),y 
3962 : d0 fb __ BNE $395f ; (krnio_setnam.s0 + 8)
3964 : 98 __ __ TYA
3965 : a6 0d __ LDX P0 
3967 : a4 0e __ LDY P1 
3969 : 20 bd ff JSR $ffbd 
.s1001:
396c : 60 __ __ RTS
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
396d : a5 0d __ LDA P0 
396f : a6 0e __ LDX P1 
3971 : a4 0f __ LDY P2 
3973 : 20 ba ff JSR $ffba 
3976 : a9 00 __ LDA #$00
3978 : a2 00 __ LDX #$00
397a : a0 00 __ LDY #$00
397c : 20 d5 ff JSR $ffd5 
397f : a9 00 __ LDA #$00
3981 : b0 02 __ BCS $3985 ; (krnio_load.s0 + 24)
3983 : a9 01 __ LDA #$01
3985 : 85 1b __ STA ACCU + 0 
.s1001:
3987 : a5 1b __ LDA ACCU + 0 
3989 : 60 __ __ RTS
--------------------------------------------------------------------
398a : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
399a : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
39a8 : a9 01 __ LDA #$01
39aa : 85 0d __ STA P0 
39ac : a9 00 __ LDA #$00
39ae : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
39b0 : a5 0d __ LDA P0 
39b2 : 85 1b __ STA ACCU + 0 
39b4 : a5 0e __ LDA P1 
39b6 : 85 1c __ STA ACCU + 1 
39b8 : ae f3 41 LDX $41f3 ; (spentry + 0)
39bb : 9a __ __ TXS
39bc : a9 4c __ LDA #$4c
39be : 85 54 __ STA $54 
39c0 : a9 00 __ LDA #$00
39c2 : 85 13 __ STA P6 
.s1001:
39c4 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
39c5 : a2 04 __ LDX #$04
39c7 : b5 53 __ LDA T3 + 0,x 
39c9 : 9d 99 bf STA $bf99,x ; (vdc_set_mode@stack + 0)
39cc : ca __ __ DEX
39cd : 10 f8 __ BPL $39c7 ; (vdc_set_mode.s1000 + 2)
39cf : 38 __ __ SEC
39d0 : a5 23 __ LDA SP + 0 
39d2 : e9 08 __ SBC #$08
39d4 : 85 23 __ STA SP + 0 
39d6 : b0 02 __ BCS $39da ; (vdc_set_mode.s0 + 0)
39d8 : c6 24 __ DEC SP + 1 
.s0:
39da : a9 00 __ LDA #$00
39dc : 85 4f __ STA T0 + 0 
39de : 38 __ __ SEC
39df : e5 16 __ SBC P9 ; (mode + 0)
39e1 : 29 20 __ AND #$20
39e3 : 85 50 __ STA T2 + 0 
39e5 : aa __ __ TAX
39e6 : 18 __ __ CLC
39e7 : 69 32 __ ADC #$32
39e9 : 85 53 __ STA T3 + 0 
39eb : a9 44 __ LDA #$44
39ed : 69 00 __ ADC #$00
39ef : 85 54 __ STA T3 + 1 
39f1 : bd 36 44 LDA $4436,x ; (vdc_modes + 4)
39f4 : f0 0a __ BEQ $3a00 ; (vdc_set_mode.s3 + 0)
.s4:
39f6 : ad 72 44 LDA $4472 ; (vdc_state + 0)
39f9 : c9 10 __ CMP #$10
39fb : d0 03 __ BNE $3a00 ; (vdc_set_mode.s3 + 0)
39fd : 4c 82 3c JMP $3c82 ; (vdc_set_mode.s1001 + 0)
.s3:
3a00 : a0 00 __ LDY #$00
3a02 : b1 53 __ LDA (T3 + 0),y 
3a04 : 8d 75 44 STA $4475 ; (vdc_state + 3)
3a07 : c8 __ __ INY
3a08 : b1 53 __ LDA (T3 + 0),y 
3a0a : 8d 76 44 STA $4476 ; (vdc_state + 4)
3a0d : c8 __ __ INY
3a0e : b1 53 __ LDA (T3 + 0),y 
3a10 : 8d 77 44 STA $4477 ; (vdc_state + 5)
3a13 : c8 __ __ INY
3a14 : b1 53 __ LDA (T3 + 0),y 
3a16 : 8d 78 44 STA $4478 ; (vdc_state + 6)
3a19 : a0 09 __ LDY #$09
3a1b : b1 53 __ LDA (T3 + 0),y 
3a1d : 8d 7e 44 STA $447e ; (vdc_state + 12)
3a20 : c8 __ __ INY
3a21 : b1 53 __ LDA (T3 + 0),y 
3a23 : 8d 7f 44 STA $447f ; (vdc_state + 13)
3a26 : c8 __ __ INY
3a27 : b1 53 __ LDA (T3 + 0),y 
3a29 : 8d 80 44 STA $4480 ; (vdc_state + 14)
3a2c : c8 __ __ INY
3a2d : b1 53 __ LDA (T3 + 0),y 
3a2f : 8d 81 44 STA $4481 ; (vdc_state + 15)
3a32 : c8 __ __ INY
3a33 : b1 53 __ LDA (T3 + 0),y 
3a35 : 8d 82 44 STA $4482 ; (vdc_state + 16)
3a38 : c8 __ __ INY
3a39 : b1 53 __ LDA (T3 + 0),y 
3a3b : 8d 83 44 STA $4483 ; (vdc_state + 17)
3a3e : c8 __ __ INY
3a3f : b1 53 __ LDA (T3 + 0),y 
3a41 : 8d 84 44 STA $4484 ; (vdc_state + 18)
3a44 : c8 __ __ INY
3a45 : b1 53 __ LDA (T3 + 0),y 
3a47 : 8d 85 44 STA $4485 ; (vdc_state + 19)
3a4a : c8 __ __ INY
3a4b : b1 53 __ LDA (T3 + 0),y 
3a4d : 8d 86 44 STA $4486 ; (vdc_state + 20)
3a50 : c8 __ __ INY
3a51 : b1 53 __ LDA (T3 + 0),y 
3a53 : 8d 87 44 STA $4487 ; (vdc_state + 21)
3a56 : a0 05 __ LDY #$05
3a58 : b1 53 __ LDA (T3 + 0),y 
3a5a : 85 55 __ STA T4 + 0 
3a5c : c8 __ __ INY
3a5d : b1 53 __ LDA (T3 + 0),y 
3a5f : 8d 7b 44 STA $447b ; (vdc_state + 9)
3a62 : 85 44 __ STA T6 + 0 
3a64 : a5 55 __ LDA T4 + 0 
3a66 : 8d 7a 44 STA $447a ; (vdc_state + 8)
3a69 : c8 __ __ INY
3a6a : b1 53 __ LDA (T3 + 0),y 
3a6c : 85 57 __ STA T5 + 0 
3a6e : c8 __ __ INY
3a6f : b1 53 __ LDA (T3 + 0),y 
3a71 : 8d 7d 44 STA $447d ; (vdc_state + 11)
3a74 : a8 __ __ TAY
3a75 : a5 57 __ LDA T5 + 0 
3a77 : 8d 7c 44 STA $447c ; (vdc_state + 10)
3a7a : a9 0c __ LDA #$0c
3a7c : 8d 00 d6 STA $d600 
.l1515:
3a7f : 2c 00 d6 BIT $d600 
3a82 : 10 fb __ BPL $3a7f ; (vdc_set_mode.l1515 + 0)
.s11:
3a84 : a5 44 __ LDA T6 + 0 
3a86 : 8d 01 d6 STA $d601 
3a89 : a9 0d __ LDA #$0d
3a8b : 8d 00 d6 STA $d600 
.l1517:
3a8e : 2c 00 d6 BIT $d600 
3a91 : 10 fb __ BPL $3a8e ; (vdc_set_mode.l1517 + 0)
.s16:
3a93 : a5 55 __ LDA T4 + 0 
3a95 : 8d 01 d6 STA $d601 
3a98 : a9 14 __ LDA #$14
3a9a : 8d 00 d6 STA $d600 
.l1519:
3a9d : 2c 00 d6 BIT $d600 
3aa0 : 10 fb __ BPL $3a9d ; (vdc_set_mode.l1519 + 0)
.s21:
3aa2 : 8c 01 d6 STY $d601 
3aa5 : a9 15 __ LDA #$15
3aa7 : 8d 00 d6 STA $d600 
.l1521:
3aaa : 2c 00 d6 BIT $d600 
3aad : 10 fb __ BPL $3aaa ; (vdc_set_mode.l1521 + 0)
.s26:
3aaf : a5 57 __ LDA T5 + 0 
3ab1 : 8d 01 d6 STA $d601 
3ab4 : bd 40 44 LDA $4440,x ; (vdc_modes + 14)
3ab7 : 85 56 __ STA T4 + 1 
3ab9 : a9 1c __ LDA #$1c
3abb : 8d 00 d6 STA $d600 
.l1523:
3abe : 2c 00 d6 BIT $d600 
3ac1 : 10 fb __ BPL $3abe ; (vdc_set_mode.l1523 + 0)
.s32:
3ac3 : ad 01 d6 LDA $d601 
3ac6 : 29 1f __ AND #$1f
3ac8 : 85 57 __ STA T5 + 0 
3aca : a9 61 __ LDA #$61
3acc : a0 02 __ LDY #$02
3ace : 91 23 __ STA (SP + 0),y 
3ad0 : a9 3e __ LDA #$3e
3ad2 : c8 __ __ INY
3ad3 : 91 23 __ STA (SP + 0),y 
3ad5 : a9 1c __ LDA #$1c
3ad7 : 8d 00 d6 STA $d600 
.l1525:
3ada : 2c 00 d6 BIT $d600 
3add : 10 fb __ BPL $3ada ; (vdc_set_mode.l1525 + 0)
.s39:
3adf : ad 01 d6 LDA $d601 
3ae2 : a0 04 __ LDY #$04
3ae4 : 91 23 __ STA (SP + 0),y 
3ae6 : a9 00 __ LDA #$00
3ae8 : c8 __ __ INY
3ae9 : 91 23 __ STA (SP + 0),y 
3aeb : a5 57 __ LDA T5 + 0 
3aed : c8 __ __ INY
3aee : 91 23 __ STA (SP + 0),y 
3af0 : a9 00 __ LDA #$00
3af2 : c8 __ __ INY
3af3 : 91 23 __ STA (SP + 0),y 
3af5 : 20 4d 32 JSR $324d ; (printf.s1000 + 0)
3af8 : a9 1c __ LDA #$1c
3afa : 8d 00 d6 STA $d600 
3afd : a5 56 __ LDA T4 + 1 
3aff : 29 e0 __ AND #$e0
3b01 : 18 __ __ CLC
3b02 : 65 57 __ ADC T5 + 0 
.l1527:
3b04 : 2c 00 d6 BIT $d600 
3b07 : 10 fb __ BPL $3b04 ; (vdc_set_mode.l1527 + 0)
.s46:
3b09 : 8d 01 d6 STA $d601 
3b0c : 18 __ __ CLC
3b0d : a9 45 __ LDA #$45
3b0f : 65 50 __ ADC T2 + 0 
3b11 : 85 50 __ STA T2 + 0 
3b13 : a9 44 __ LDA #$44
3b15 : 69 00 __ ADC #$00
3b17 : 85 51 __ STA T2 + 1 
.l47:
3b19 : a4 4f __ LDY T0 + 0 
3b1b : b1 50 __ LDA (T2 + 0),y 
3b1d : 85 46 __ STA T7 + 0 
3b1f : c8 __ __ INY
3b20 : b1 50 __ LDA (T2 + 0),y 
3b22 : aa __ __ TAX
3b23 : a5 46 __ LDA T7 + 0 
3b25 : 8d 00 d6 STA $d600 
3b28 : c8 __ __ INY
3b29 : 84 4f __ STY T0 + 0 
.l1529:
3b2b : 2c 00 d6 BIT $d600 
3b2e : 10 fb __ BPL $3b2b ; (vdc_set_mode.l1529 + 0)
.s53:
3b30 : 8e 01 d6 STX $d601 
3b33 : 18 __ __ CLC
3b34 : a5 53 __ LDA T3 + 0 
3b36 : 65 4f __ ADC T0 + 0 
3b38 : 85 55 __ STA T4 + 0 
3b3a : a5 54 __ LDA T3 + 1 
3b3c : 69 00 __ ADC #$00
3b3e : 85 56 __ STA T4 + 1 
3b40 : a0 13 __ LDY #$13
3b42 : b1 55 __ LDA (T4 + 0),y 
3b44 : c9 ff __ CMP #$ff
3b46 : d0 d1 __ BNE $3b19 ; (vdc_set_mode.l47 + 0)
.s48:
3b48 : a0 04 __ LDY #$04
3b4a : b1 53 __ LDA (T3 + 0),y 
3b4c : f0 05 __ BEQ $3b53 ; (vdc_set_mode.s55 + 0)
.s57:
3b4e : ad 73 44 LDA $4473 ; (vdc_state + 1)
3b51 : f0 11 __ BEQ $3b64 ; (vdc_set_mode.s54 + 0)
.s55:
3b53 : a9 00 __ LDA #$00
3b55 : 85 4f __ STA T0 + 0 
3b57 : ad 75 44 LDA $4475 ; (vdc_state + 3)
3b5a : 85 50 __ STA T2 + 0 
3b5c : ad 77 44 LDA $4477 ; (vdc_state + 5)
3b5f : 85 53 __ STA T3 + 0 
3b61 : 4c 78 3d JMP $3d78 ; (vdc_set_mode.l236 + 0)
.s54:
3b64 : ad 72 44 LDA $4472 ; (vdc_state + 0)
3b67 : c9 10 __ CMP #$10
3b69 : d0 03 __ BNE $3b6e ; (vdc_set_mode.s62 + 0)
3b6b : 4c 82 3c JMP $3c82 ; (vdc_set_mode.s1001 + 0)
.s62:
3b6e : ad 73 44 LDA $4473 ; (vdc_state + 1)
3b71 : f0 03 __ BEQ $3b76 ; (vdc_set_mode.s61 + 0)
3b73 : 4c 82 3c JMP $3c82 ; (vdc_set_mode.s1001 + 0)
.s61:
3b76 : a9 22 __ LDA #$22
3b78 : 8d 00 d6 STA $d600 
.l1559:
3b7b : 2c 00 d6 BIT $d600 
3b7e : 10 fb __ BPL $3b7b ; (vdc_set_mode.l1559 + 0)
.s69:
3b80 : a9 80 __ LDA #$80
3b82 : 8d 01 d6 STA $d601 
3b85 : a0 ff __ LDY #$ff
3b87 : a2 00 __ LDX #$00
.l72:
3b89 : a9 12 __ LDA #$12
3b8b : 8d 00 d6 STA $d600 
.l1561:
3b8e : 2c 00 d6 BIT $d600 
3b91 : 10 fb __ BPL $3b8e ; (vdc_set_mode.l1561 + 0)
.s81:
3b93 : 8e 01 d6 STX $d601 
3b96 : a9 13 __ LDA #$13
3b98 : 8d 00 d6 STA $d600 
.l1563:
3b9b : 2c 00 d6 BIT $d600 
3b9e : 10 fb __ BPL $3b9b ; (vdc_set_mode.l1563 + 0)
.s86:
3ba0 : a9 00 __ LDA #$00
3ba2 : 8d 01 d6 STA $d601 
3ba5 : a9 1f __ LDA #$1f
3ba7 : 8d 00 d6 STA $d600 
.l1565:
3baa : 2c 00 d6 BIT $d600 
3bad : 10 fb __ BPL $3baa ; (vdc_set_mode.l1565 + 0)
.s90:
3baf : a9 00 __ LDA #$00
3bb1 : 8d 01 d6 STA $d601 
3bb4 : a9 18 __ LDA #$18
3bb6 : 8d 00 d6 STA $d600 
.l1567:
3bb9 : 2c 00 d6 BIT $d600 
3bbc : 10 fb __ BPL $3bb9 ; (vdc_set_mode.l1567 + 0)
.s96:
3bbe : ad 01 d6 LDA $d601 
3bc1 : 29 7f __ AND #$7f
3bc3 : 85 53 __ STA T3 + 0 
3bc5 : a9 18 __ LDA #$18
3bc7 : 8d 00 d6 STA $d600 
.l1569:
3bca : 2c 00 d6 BIT $d600 
3bcd : 10 fb __ BPL $3bca ; (vdc_set_mode.l1569 + 0)
.s102:
3bcf : a5 53 __ LDA T3 + 0 
3bd1 : 8d 01 d6 STA $d601 
3bd4 : a9 1e __ LDA #$1e
3bd6 : 8d 00 d6 STA $d600 
.l1571:
3bd9 : 2c 00 d6 BIT $d600 
3bdc : 10 fb __ BPL $3bd9 ; (vdc_set_mode.l1571 + 0)
.s107:
3bde : a9 ff __ LDA #$ff
3be0 : 8d 01 d6 STA $d601 
3be3 : e8 __ __ INX
3be4 : 88 __ __ DEY
3be5 : d0 a2 __ BNE $3b89 ; (vdc_set_mode.l72 + 0)
.s74:
3be7 : a9 12 __ LDA #$12
3be9 : 8d 00 d6 STA $d600 
.l1574:
3bec : 2c 00 d6 BIT $d600 
3bef : 10 fb __ BPL $3bec ; (vdc_set_mode.l1574 + 0)
.s114:
3bf1 : 8e 01 d6 STX $d601 
3bf4 : a9 13 __ LDA #$13
3bf6 : 8d 00 d6 STA $d600 
.l1576:
3bf9 : 2c 00 d6 BIT $d600 
3bfc : 10 fb __ BPL $3bf9 ; (vdc_set_mode.l1576 + 0)
.s119:
3bfe : 8c 01 d6 STY $d601 
3c01 : a9 1f __ LDA #$1f
3c03 : 8d 00 d6 STA $d600 
.l1578:
3c06 : 2c 00 d6 BIT $d600 
3c09 : 10 fb __ BPL $3c06 ; (vdc_set_mode.l1578 + 0)
.s123:
3c0b : 8c 01 d6 STY $d601 
3c0e : a9 18 __ LDA #$18
3c10 : 8d 00 d6 STA $d600 
.l1580:
3c13 : 2c 00 d6 BIT $d600 
3c16 : 10 fb __ BPL $3c13 ; (vdc_set_mode.l1580 + 0)
.s129:
3c18 : ad 01 d6 LDA $d601 
3c1b : 29 7f __ AND #$7f
3c1d : aa __ __ TAX
3c1e : a9 18 __ LDA #$18
3c20 : 8d 00 d6 STA $d600 
.l1582:
3c23 : 2c 00 d6 BIT $d600 
3c26 : 10 fb __ BPL $3c23 ; (vdc_set_mode.l1582 + 0)
.s135:
3c28 : 8e 01 d6 STX $d601 
3c2b : a9 1e __ LDA #$1e
3c2d : 8d 00 d6 STA $d600 
.l1584:
3c30 : 2c 00 d6 BIT $d600 
3c33 : 10 fb __ BPL $3c30 ; (vdc_set_mode.l1584 + 0)
.s140:
3c35 : a9 ff __ LDA #$ff
3c37 : 8d 01 d6 STA $d601 
3c3a : a9 1c __ LDA #$1c
3c3c : 8d 00 d6 STA $d600 
.l1586:
3c3f : 2c 00 d6 BIT $d600 
3c42 : 10 fb __ BPL $3c3f ; (vdc_set_mode.l1586 + 0)
.s146:
3c44 : ad 01 d6 LDA $d601 
3c47 : 09 10 __ ORA #$10
3c49 : aa __ __ TAX
3c4a : a9 1c __ LDA #$1c
3c4c : 8d 00 d6 STA $d600 
.l1588:
3c4f : 2c 00 d6 BIT $d600 
3c52 : 10 fb __ BPL $3c4f ; (vdc_set_mode.l1588 + 0)
.s152:
3c54 : 8e 01 d6 STX $d601 
3c57 : 20 69 3e JSR $3e69 ; (vdc_restore_charsets.s0 + 0)
3c5a : a9 00 __ LDA #$00
3c5c : 85 4f __ STA T0 + 0 
3c5e : ad 75 44 LDA $4475 ; (vdc_state + 3)
3c61 : 85 50 __ STA T2 + 0 
3c63 : ad 77 44 LDA $4477 ; (vdc_state + 5)
3c66 : 85 53 __ STA T3 + 0 
.l155:
3c68 : a5 4f __ LDA T0 + 0 
3c6a : c5 53 __ CMP T3 + 0 
3c6c : 90 2a __ BCC $3c98 ; (vdc_set_mode.s156 + 0)
.s153:
3c6e : a9 22 __ LDA #$22
3c70 : 8d 00 d6 STA $d600 
.l1614:
3c73 : 2c 00 d6 BIT $d600 
3c76 : 10 fb __ BPL $3c73 ; (vdc_set_mode.l1614 + 0)
.s233:
3c78 : a9 7d __ LDA #$7d
3c7a : 8d 01 d6 STA $d601 
3c7d : a9 01 __ LDA #$01
3c7f : 8d 73 44 STA $4473 ; (vdc_state + 1)
.s1001:
3c82 : 18 __ __ CLC
3c83 : a5 23 __ LDA SP + 0 
3c85 : 69 08 __ ADC #$08
3c87 : 85 23 __ STA SP + 0 
3c89 : 90 02 __ BCC $3c8d ; (vdc_set_mode.s1001 + 11)
3c8b : e6 24 __ INC SP + 1 
3c8d : a2 04 __ LDX #$04
3c8f : bd 99 bf LDA $bf99,x ; (vdc_set_mode@stack + 0)
3c92 : 95 53 __ STA T3 + 0,x 
3c94 : ca __ __ DEX
3c95 : 10 f8 __ BPL $3c8f ; (vdc_set_mode.s1001 + 13)
3c97 : 60 __ __ RTS
.s156:
3c98 : ad 75 44 LDA $4475 ; (vdc_state + 3)
3c9b : 85 1b __ STA ACCU + 0 
3c9d : ad 76 44 LDA $4476 ; (vdc_state + 4)
3ca0 : 85 1c __ STA ACCU + 1 
3ca2 : ad 79 44 LDA $4479 ; (vdc_state + 7)
3ca5 : 85 43 __ STA T1 + 0 
3ca7 : a9 12 __ LDA #$12
3ca9 : 8d 00 d6 STA $d600 
3cac : a6 50 __ LDX T2 + 0 
3cae : ca __ __ DEX
3caf : 86 44 __ STX T6 + 0 
3cb1 : a5 4f __ LDA T0 + 0 
3cb3 : 20 b5 42 JSR $42b5 ; (mul16by8 + 0)
3cb6 : 18 __ __ CLC
3cb7 : a5 05 __ LDA WORK + 2 
3cb9 : 6d 7a 44 ADC $447a ; (vdc_state + 8)
3cbc : aa __ __ TAX
3cbd : a5 06 __ LDA WORK + 3 
3cbf : 6d 7b 44 ADC $447b ; (vdc_state + 9)
.l1590:
3cc2 : 2c 00 d6 BIT $d600 
3cc5 : 10 fb __ BPL $3cc2 ; (vdc_set_mode.l1590 + 0)
.s168:
3cc7 : 8d 01 d6 STA $d601 
3cca : a9 13 __ LDA #$13
3ccc : 8d 00 d6 STA $d600 
.l1592:
3ccf : 2c 00 d6 BIT $d600 
3cd2 : 10 fb __ BPL $3ccf ; (vdc_set_mode.l1592 + 0)
.s173:
3cd4 : 8e 01 d6 STX $d601 
3cd7 : a9 1f __ LDA #$1f
3cd9 : 8d 00 d6 STA $d600 
.l1594:
3cdc : 2c 00 d6 BIT $d600 
3cdf : 10 fb __ BPL $3cdc ; (vdc_set_mode.l1594 + 0)
.s177:
3ce1 : a9 20 __ LDA #$20
3ce3 : 8d 01 d6 STA $d601 
3ce6 : a9 18 __ LDA #$18
3ce8 : 8d 00 d6 STA $d600 
.l1596:
3ceb : 2c 00 d6 BIT $d600 
3cee : 10 fb __ BPL $3ceb ; (vdc_set_mode.l1596 + 0)
.s183:
3cf0 : ad 01 d6 LDA $d601 
3cf3 : 29 7f __ AND #$7f
3cf5 : aa __ __ TAX
3cf6 : a9 18 __ LDA #$18
3cf8 : 8d 00 d6 STA $d600 
.l1598:
3cfb : 2c 00 d6 BIT $d600 
3cfe : 10 fb __ BPL $3cfb ; (vdc_set_mode.l1598 + 0)
.s189:
3d00 : 8e 01 d6 STX $d601 
3d03 : a9 1e __ LDA #$1e
3d05 : 8d 00 d6 STA $d600 
.l1600:
3d08 : 2c 00 d6 BIT $d600 
3d0b : 10 fb __ BPL $3d08 ; (vdc_set_mode.l1600 + 0)
.s194:
3d0d : a5 44 __ LDA T6 + 0 
3d0f : 8d 01 d6 STA $d601 
3d12 : ad 7c 44 LDA $447c ; (vdc_state + 10)
3d15 : 18 __ __ CLC
3d16 : 65 05 __ ADC WORK + 2 
3d18 : aa __ __ TAX
3d19 : a9 12 __ LDA #$12
3d1b : 8d 00 d6 STA $d600 
3d1e : ad 7d 44 LDA $447d ; (vdc_state + 11)
3d21 : 65 06 __ ADC WORK + 3 
.l1602:
3d23 : 2c 00 d6 BIT $d600 
3d26 : 10 fb __ BPL $3d23 ; (vdc_set_mode.l1602 + 0)
.s201:
3d28 : 8d 01 d6 STA $d601 
3d2b : a9 13 __ LDA #$13
3d2d : 8d 00 d6 STA $d600 
.l1604:
3d30 : 2c 00 d6 BIT $d600 
3d33 : 10 fb __ BPL $3d30 ; (vdc_set_mode.l1604 + 0)
.s206:
3d35 : 8e 01 d6 STX $d601 
3d38 : a9 1f __ LDA #$1f
3d3a : 8d 00 d6 STA $d600 
.l1606:
3d3d : 2c 00 d6 BIT $d600 
3d40 : 10 fb __ BPL $3d3d ; (vdc_set_mode.l1606 + 0)
.s210:
3d42 : a5 43 __ LDA T1 + 0 
3d44 : 8d 01 d6 STA $d601 
3d47 : a9 18 __ LDA #$18
3d49 : 8d 00 d6 STA $d600 
.l1608:
3d4c : 2c 00 d6 BIT $d600 
3d4f : 10 fb __ BPL $3d4c ; (vdc_set_mode.l1608 + 0)
.s216:
3d51 : ad 01 d6 LDA $d601 
3d54 : 29 7f __ AND #$7f
3d56 : aa __ __ TAX
3d57 : a9 18 __ LDA #$18
3d59 : 8d 00 d6 STA $d600 
.l1610:
3d5c : 2c 00 d6 BIT $d600 
3d5f : 10 fb __ BPL $3d5c ; (vdc_set_mode.l1610 + 0)
.s222:
3d61 : 8e 01 d6 STX $d601 
3d64 : a9 1e __ LDA #$1e
3d66 : 8d 00 d6 STA $d600 
.l1612:
3d69 : 2c 00 d6 BIT $d600 
3d6c : 10 fb __ BPL $3d69 ; (vdc_set_mode.l1612 + 0)
.s227:
3d6e : a5 44 __ LDA T6 + 0 
3d70 : 8d 01 d6 STA $d601 
3d73 : e6 4f __ INC T0 + 0 
3d75 : 4c 68 3c JMP $3c68 ; (vdc_set_mode.l155 + 0)
.l236:
3d78 : a5 4f __ LDA T0 + 0 
3d7a : c5 53 __ CMP T3 + 0 
3d7c : 90 03 __ BCC $3d81 ; (vdc_set_mode.s237 + 0)
3d7e : 4c 82 3c JMP $3c82 ; (vdc_set_mode.s1001 + 0)
.s237:
3d81 : ad 75 44 LDA $4475 ; (vdc_state + 3)
3d84 : 85 1b __ STA ACCU + 0 
3d86 : ad 76 44 LDA $4476 ; (vdc_state + 4)
3d89 : 85 1c __ STA ACCU + 1 
3d8b : ad 79 44 LDA $4479 ; (vdc_state + 7)
3d8e : 85 43 __ STA T1 + 0 
3d90 : a9 12 __ LDA #$12
3d92 : 8d 00 d6 STA $d600 
3d95 : a6 50 __ LDX T2 + 0 
3d97 : ca __ __ DEX
3d98 : 86 44 __ STX T6 + 0 
3d9a : a5 4f __ LDA T0 + 0 
3d9c : 20 b5 42 JSR $42b5 ; (mul16by8 + 0)
3d9f : 18 __ __ CLC
3da0 : a5 05 __ LDA WORK + 2 
3da2 : 6d 7a 44 ADC $447a ; (vdc_state + 8)
3da5 : aa __ __ TAX
3da6 : a5 06 __ LDA WORK + 3 
3da8 : 6d 7b 44 ADC $447b ; (vdc_state + 9)
.l1534:
3dab : 2c 00 d6 BIT $d600 
3dae : 10 fb __ BPL $3dab ; (vdc_set_mode.l1534 + 0)
.s249:
3db0 : 8d 01 d6 STA $d601 
3db3 : a9 13 __ LDA #$13
3db5 : 8d 00 d6 STA $d600 
.l1536:
3db8 : 2c 00 d6 BIT $d600 
3dbb : 10 fb __ BPL $3db8 ; (vdc_set_mode.l1536 + 0)
.s254:
3dbd : 8e 01 d6 STX $d601 
3dc0 : a9 1f __ LDA #$1f
3dc2 : 8d 00 d6 STA $d600 
.l1538:
3dc5 : 2c 00 d6 BIT $d600 
3dc8 : 10 fb __ BPL $3dc5 ; (vdc_set_mode.l1538 + 0)
.s258:
3dca : a9 20 __ LDA #$20
3dcc : 8d 01 d6 STA $d601 
3dcf : a9 18 __ LDA #$18
3dd1 : 8d 00 d6 STA $d600 
.l1540:
3dd4 : 2c 00 d6 BIT $d600 
3dd7 : 10 fb __ BPL $3dd4 ; (vdc_set_mode.l1540 + 0)
.s264:
3dd9 : ad 01 d6 LDA $d601 
3ddc : 29 7f __ AND #$7f
3dde : aa __ __ TAX
3ddf : a9 18 __ LDA #$18
3de1 : 8d 00 d6 STA $d600 
.l1542:
3de4 : 2c 00 d6 BIT $d600 
3de7 : 10 fb __ BPL $3de4 ; (vdc_set_mode.l1542 + 0)
.s270:
3de9 : 8e 01 d6 STX $d601 
3dec : a9 1e __ LDA #$1e
3dee : 8d 00 d6 STA $d600 
.l1544:
3df1 : 2c 00 d6 BIT $d600 
3df4 : 10 fb __ BPL $3df1 ; (vdc_set_mode.l1544 + 0)
.s275:
3df6 : a5 44 __ LDA T6 + 0 
3df8 : 8d 01 d6 STA $d601 
3dfb : ad 7c 44 LDA $447c ; (vdc_state + 10)
3dfe : 18 __ __ CLC
3dff : 65 05 __ ADC WORK + 2 
3e01 : aa __ __ TAX
3e02 : a9 12 __ LDA #$12
3e04 : 8d 00 d6 STA $d600 
3e07 : ad 7d 44 LDA $447d ; (vdc_state + 11)
3e0a : 65 06 __ ADC WORK + 3 
.l1546:
3e0c : 2c 00 d6 BIT $d600 
3e0f : 10 fb __ BPL $3e0c ; (vdc_set_mode.l1546 + 0)
.s282:
3e11 : 8d 01 d6 STA $d601 
3e14 : a9 13 __ LDA #$13
3e16 : 8d 00 d6 STA $d600 
.l1548:
3e19 : 2c 00 d6 BIT $d600 
3e1c : 10 fb __ BPL $3e19 ; (vdc_set_mode.l1548 + 0)
.s287:
3e1e : 8e 01 d6 STX $d601 
3e21 : a9 1f __ LDA #$1f
3e23 : 8d 00 d6 STA $d600 
.l1550:
3e26 : 2c 00 d6 BIT $d600 
3e29 : 10 fb __ BPL $3e26 ; (vdc_set_mode.l1550 + 0)
.s291:
3e2b : a5 43 __ LDA T1 + 0 
3e2d : 8d 01 d6 STA $d601 
3e30 : a9 18 __ LDA #$18
3e32 : 8d 00 d6 STA $d600 
.l1552:
3e35 : 2c 00 d6 BIT $d600 
3e38 : 10 fb __ BPL $3e35 ; (vdc_set_mode.l1552 + 0)
.s297:
3e3a : ad 01 d6 LDA $d601 
3e3d : 29 7f __ AND #$7f
3e3f : aa __ __ TAX
3e40 : a9 18 __ LDA #$18
3e42 : 8d 00 d6 STA $d600 
.l1554:
3e45 : 2c 00 d6 BIT $d600 
3e48 : 10 fb __ BPL $3e45 ; (vdc_set_mode.l1554 + 0)
.s303:
3e4a : 8e 01 d6 STX $d601 
3e4d : a9 1e __ LDA #$1e
3e4f : 8d 00 d6 STA $d600 
.l1556:
3e52 : 2c 00 d6 BIT $d600 
3e55 : 10 fb __ BPL $3e52 ; (vdc_set_mode.l1556 + 0)
.s308:
3e57 : a5 44 __ LDA T6 + 0 
3e59 : 8d 01 d6 STA $d601 
3e5c : e6 4f __ INC T0 + 0 
3e5e : 4c 78 3d JMP $3d78 ; (vdc_set_mode.l236 + 0)
--------------------------------------------------------------------
3e61 : __ __ __ BYT 25 32 78 20 25 32 78 00                         : %2x %2x.
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
3e69 : 20 62 ff JSR $ff62 
.s1001:
3e6c : 60 __ __ RTS
--------------------------------------------------------------------
3e6d : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 6f 53 43 41 52 36 34 : sTARTING oSCAR64
3e7d : __ __ __ BYT 20 76 64 63 20 44 45 4d 4f 2e 00                :  vdc DEMO..
--------------------------------------------------------------------
3e88 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 3a 00 : lOADING ASSETS:.
--------------------------------------------------------------------
3e98 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 00                      : - SCREEN.
--------------------------------------------------------------------
3ea1 : __ __ __ BYT 53 43 52 45 45 4e 00                            : SCREEN.
--------------------------------------------------------------------
3ea8 : __ __ __ BYT 6c 4f 41 44 20 45 52 52 4f 52 2e 00             : lOAD ERROR..
--------------------------------------------------------------------
3eb4 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 44 45 4d 4f : oSCAR64 vdc DEMO
3ec4 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
3ec5 : a2 03 __ LDX #$03
3ec7 : b5 53 __ LDA T8 + 0,x 
3ec9 : 9d d1 bf STA $bfd1,x ; (buff + 38)
3ecc : ca __ __ DEX
3ecd : 10 f8 __ BPL $3ec7 ; (sprintf.s1000 + 2)
.s0:
3ecf : 18 __ __ CLC
3ed0 : a5 23 __ LDA SP + 0 
3ed2 : 69 06 __ ADC #$06
3ed4 : 85 47 __ STA T0 + 0 
3ed6 : a5 24 __ LDA SP + 1 
3ed8 : 69 00 __ ADC #$00
3eda : 85 48 __ STA T0 + 1 
3edc : a9 00 __ LDA #$00
3ede : 85 43 __ STA T1 + 0 
3ee0 : a0 04 __ LDY #$04
3ee2 : b1 23 __ LDA (SP + 0),y 
3ee4 : 85 49 __ STA T2 + 0 
3ee6 : c8 __ __ INY
3ee7 : b1 23 __ LDA (SP + 0),y 
3ee9 : 85 4a __ STA T2 + 1 
3eeb : a0 02 __ LDY #$02
3eed : b1 23 __ LDA (SP + 0),y 
3eef : 85 4b __ STA T3 + 0 
3ef1 : c8 __ __ INY
3ef2 : b1 23 __ LDA (SP + 0),y 
3ef4 : 85 4c __ STA T3 + 1 
.l2:
3ef6 : a0 00 __ LDY #$00
3ef8 : b1 49 __ LDA (T2 + 0),y 
3efa : d0 0f __ BNE $3f0b ; (sprintf.s3 + 0)
.s4:
3efc : a4 43 __ LDY T1 + 0 
3efe : 91 4b __ STA (T3 + 0),y 
.s1001:
3f00 : a2 03 __ LDX #$03
3f02 : bd d1 bf LDA $bfd1,x ; (buff + 38)
3f05 : 95 53 __ STA T8 + 0,x 
3f07 : ca __ __ DEX
3f08 : 10 f8 __ BPL $3f02 ; (sprintf.s1001 + 2)
3f0a : 60 __ __ RTS
.s3:
3f0b : c9 25 __ CMP #$25
3f0d : f0 22 __ BEQ $3f31 ; (sprintf.s5 + 0)
.s6:
3f0f : a4 43 __ LDY T1 + 0 
3f11 : 91 4b __ STA (T3 + 0),y 
3f13 : e6 49 __ INC T2 + 0 
3f15 : d0 02 __ BNE $3f19 ; (sprintf.s1102 + 0)
.s1101:
3f17 : e6 4a __ INC T2 + 1 
.s1102:
3f19 : c8 __ __ INY
3f1a : 84 43 __ STY T1 + 0 
3f1c : 98 __ __ TYA
3f1d : c0 28 __ CPY #$28
3f1f : 90 d5 __ BCC $3ef6 ; (sprintf.l2 + 0)
.s111:
3f21 : 18 __ __ CLC
3f22 : 65 4b __ ADC T3 + 0 
3f24 : 85 4b __ STA T3 + 0 
3f26 : 90 02 __ BCC $3f2a ; (sprintf.s1104 + 0)
.s1103:
3f28 : e6 4c __ INC T3 + 1 
.s1104:
3f2a : a9 00 __ LDA #$00
.s1068:
3f2c : 85 43 __ STA T1 + 0 
3f2e : 4c f6 3e JMP $3ef6 ; (sprintf.l2 + 0)
.s5:
3f31 : 8c d9 bf STY $bfd9 ; (buff + 46)
3f34 : 8c da bf STY $bfda ; (buff + 47)
3f37 : 8c db bf STY $bfdb ; (buff + 48)
3f3a : 8c dc bf STY $bfdc ; (buff + 49)
3f3d : a9 0a __ LDA #$0a
3f3f : 8d d8 bf STA $bfd8 ; (buff + 45)
3f42 : a5 43 __ LDA T1 + 0 
3f44 : f0 0b __ BEQ $3f51 ; (sprintf.s10 + 0)
.s8:
3f46 : 18 __ __ CLC
3f47 : 65 4b __ ADC T3 + 0 
3f49 : 85 4b __ STA T3 + 0 
3f4b : 90 02 __ BCC $3f4f ; (sprintf.s1080 + 0)
.s1079:
3f4d : e6 4c __ INC T3 + 1 
.s1080:
3f4f : 84 43 __ STY T1 + 0 
.s10:
3f51 : a0 01 __ LDY #$01
3f53 : b1 49 __ LDA (T2 + 0),y 
3f55 : aa __ __ TAX
3f56 : a9 20 __ LDA #$20
3f58 : 8d d5 bf STA $bfd5 ; (buff + 42)
3f5b : a9 00 __ LDA #$00
3f5d : 8d d6 bf STA $bfd6 ; (buff + 43)
3f60 : a9 ff __ LDA #$ff
3f62 : 8d d7 bf STA $bfd7 ; (buff + 44)
3f65 : 18 __ __ CLC
3f66 : a5 49 __ LDA T2 + 0 
3f68 : 69 02 __ ADC #$02
.l15:
3f6a : 85 49 __ STA T2 + 0 
3f6c : 90 02 __ BCC $3f70 ; (sprintf.s1082 + 0)
.s1081:
3f6e : e6 4a __ INC T2 + 1 
.s1082:
3f70 : 8a __ __ TXA
3f71 : e0 2b __ CPX #$2b
3f73 : d0 08 __ BNE $3f7d ; (sprintf.s18 + 0)
.s17:
3f75 : a9 01 __ LDA #$01
3f77 : 8d da bf STA $bfda ; (buff + 47)
3f7a : 4c de 41 JMP $41de ; (sprintf.s260 + 0)
.s18:
3f7d : c9 30 __ CMP #$30
3f7f : d0 06 __ BNE $3f87 ; (sprintf.s21 + 0)
.s20:
3f81 : 8d d5 bf STA $bfd5 ; (buff + 42)
3f84 : 4c de 41 JMP $41de ; (sprintf.s260 + 0)
.s21:
3f87 : e0 23 __ CPX #$23
3f89 : d0 08 __ BNE $3f93 ; (sprintf.s24 + 0)
.s23:
3f8b : a9 01 __ LDA #$01
3f8d : 8d dc bf STA $bfdc ; (buff + 49)
3f90 : 4c de 41 JMP $41de ; (sprintf.s260 + 0)
.s24:
3f93 : e0 2d __ CPX #$2d
3f95 : d0 08 __ BNE $3f9f ; (sprintf.s16 + 0)
.s26:
3f97 : a9 01 __ LDA #$01
3f99 : 8d db bf STA $bfdb ; (buff + 48)
3f9c : 4c de 41 JMP $41de ; (sprintf.s260 + 0)
.s16:
3f9f : 85 45 __ STA T4 + 0 
3fa1 : e0 30 __ CPX #$30
3fa3 : 90 53 __ BCC $3ff8 ; (sprintf.s32 + 0)
.s33:
3fa5 : e0 3a __ CPX #$3a
3fa7 : b0 4f __ BCS $3ff8 ; (sprintf.s32 + 0)
.s30:
3fa9 : a9 00 __ LDA #$00
3fab : 85 4d __ STA T6 + 0 
3fad : 85 4e __ STA T6 + 1 
3faf : e0 3a __ CPX #$3a
3fb1 : b0 40 __ BCS $3ff3 ; (sprintf.s36 + 0)
.l35:
3fb3 : a5 4d __ LDA T6 + 0 
3fb5 : 0a __ __ ASL
3fb6 : 85 1b __ STA ACCU + 0 
3fb8 : a5 4e __ LDA T6 + 1 
3fba : 2a __ __ ROL
3fbb : 06 1b __ ASL ACCU + 0 
3fbd : 2a __ __ ROL
3fbe : aa __ __ TAX
3fbf : 18 __ __ CLC
3fc0 : a5 1b __ LDA ACCU + 0 
3fc2 : 65 4d __ ADC T6 + 0 
3fc4 : 85 4d __ STA T6 + 0 
3fc6 : 8a __ __ TXA
3fc7 : 65 4e __ ADC T6 + 1 
3fc9 : 06 4d __ ASL T6 + 0 
3fcb : 2a __ __ ROL
3fcc : aa __ __ TAX
3fcd : 18 __ __ CLC
3fce : a5 4d __ LDA T6 + 0 
3fd0 : 65 45 __ ADC T4 + 0 
3fd2 : 90 01 __ BCC $3fd5 ; (sprintf.s1098 + 0)
.s1097:
3fd4 : e8 __ __ INX
.s1098:
3fd5 : 38 __ __ SEC
3fd6 : e9 30 __ SBC #$30
3fd8 : 85 4d __ STA T6 + 0 
3fda : 8a __ __ TXA
3fdb : e9 00 __ SBC #$00
3fdd : 85 4e __ STA T6 + 1 
3fdf : a0 00 __ LDY #$00
3fe1 : b1 49 __ LDA (T2 + 0),y 
3fe3 : 85 45 __ STA T4 + 0 
3fe5 : e6 49 __ INC T2 + 0 
3fe7 : d0 02 __ BNE $3feb ; (sprintf.s1100 + 0)
.s1099:
3fe9 : e6 4a __ INC T2 + 1 
.s1100:
3feb : c9 30 __ CMP #$30
3fed : 90 04 __ BCC $3ff3 ; (sprintf.s36 + 0)
.s37:
3fef : c9 3a __ CMP #$3a
3ff1 : 90 c0 __ BCC $3fb3 ; (sprintf.l35 + 0)
.s36:
3ff3 : a5 4d __ LDA T6 + 0 
3ff5 : 8d d6 bf STA $bfd6 ; (buff + 43)
.s32:
3ff8 : a5 45 __ LDA T4 + 0 
3ffa : c9 2e __ CMP #$2e
3ffc : d0 51 __ BNE $404f ; (sprintf.s40 + 0)
.s38:
3ffe : a9 00 __ LDA #$00
4000 : 85 4d __ STA T6 + 0 
.l245:
4002 : 85 4e __ STA T6 + 1 
4004 : a0 00 __ LDY #$00
4006 : b1 49 __ LDA (T2 + 0),y 
4008 : 85 45 __ STA T4 + 0 
400a : e6 49 __ INC T2 + 0 
400c : d0 02 __ BNE $4010 ; (sprintf.s1084 + 0)
.s1083:
400e : e6 4a __ INC T2 + 1 
.s1084:
4010 : c9 30 __ CMP #$30
4012 : 90 04 __ BCC $4018 ; (sprintf.s43 + 0)
.s44:
4014 : c9 3a __ CMP #$3a
4016 : 90 0a __ BCC $4022 ; (sprintf.s42 + 0)
.s43:
4018 : a5 4d __ LDA T6 + 0 
401a : 8d d7 bf STA $bfd7 ; (buff + 44)
401d : a5 45 __ LDA T4 + 0 
401f : 4c 4f 40 JMP $404f ; (sprintf.s40 + 0)
.s42:
4022 : a5 4d __ LDA T6 + 0 
4024 : 0a __ __ ASL
4025 : 85 1b __ STA ACCU + 0 
4027 : a5 4e __ LDA T6 + 1 
4029 : 2a __ __ ROL
402a : 06 1b __ ASL ACCU + 0 
402c : 2a __ __ ROL
402d : aa __ __ TAX
402e : 18 __ __ CLC
402f : a5 1b __ LDA ACCU + 0 
4031 : 65 4d __ ADC T6 + 0 
4033 : 85 4d __ STA T6 + 0 
4035 : 8a __ __ TXA
4036 : 65 4e __ ADC T6 + 1 
4038 : 06 4d __ ASL T6 + 0 
403a : 2a __ __ ROL
403b : aa __ __ TAX
403c : 18 __ __ CLC
403d : a5 4d __ LDA T6 + 0 
403f : 65 45 __ ADC T4 + 0 
4041 : 90 01 __ BCC $4044 ; (sprintf.s1096 + 0)
.s1095:
4043 : e8 __ __ INX
.s1096:
4044 : 38 __ __ SEC
4045 : e9 30 __ SBC #$30
4047 : 85 4d __ STA T6 + 0 
4049 : 8a __ __ TXA
404a : e9 00 __ SBC #$00
404c : 4c 02 40 JMP $4002 ; (sprintf.l245 + 0)
.s40:
404f : c9 64 __ CMP #$64
4051 : f0 04 __ BEQ $4057 ; (sprintf.s45 + 0)
.s48:
4053 : c9 44 __ CMP #$44
4055 : d0 05 __ BNE $405c ; (sprintf.s46 + 0)
.s45:
4057 : a9 01 __ LDA #$01
4059 : 4c b7 41 JMP $41b7 ; (sprintf.s261 + 0)
.s46:
405c : c9 75 __ CMP #$75
405e : d0 03 __ BNE $4063 ; (sprintf.s52 + 0)
4060 : 4c b5 41 JMP $41b5 ; (sprintf.s285 + 0)
.s52:
4063 : c9 55 __ CMP #$55
4065 : d0 03 __ BNE $406a ; (sprintf.s50 + 0)
4067 : 4c b5 41 JMP $41b5 ; (sprintf.s285 + 0)
.s50:
406a : c9 78 __ CMP #$78
406c : f0 04 __ BEQ $4072 ; (sprintf.s53 + 0)
.s56:
406e : c9 58 __ CMP #$58
4070 : d0 0d __ BNE $407f ; (sprintf.s54 + 0)
.s53:
4072 : a9 10 __ LDA #$10
4074 : 8d d8 bf STA $bfd8 ; (buff + 45)
4077 : a9 00 __ LDA #$00
4079 : 8d d9 bf STA $bfd9 ; (buff + 46)
407c : 4c b5 41 JMP $41b5 ; (sprintf.s285 + 0)
.s54:
407f : c9 6c __ CMP #$6c
4081 : d0 03 __ BNE $4086 ; (sprintf.s60 + 0)
4083 : 4c 47 41 JMP $4147 ; (sprintf.s57 + 0)
.s60:
4086 : c9 4c __ CMP #$4c
4088 : d0 03 __ BNE $408d ; (sprintf.s58 + 0)
408a : 4c 47 41 JMP $4147 ; (sprintf.s57 + 0)
.s58:
408d : c9 73 __ CMP #$73
408f : f0 37 __ BEQ $40c8 ; (sprintf.s73 + 0)
.s76:
4091 : c9 53 __ CMP #$53
4093 : f0 33 __ BEQ $40c8 ; (sprintf.s73 + 0)
.s74:
4095 : c9 63 __ CMP #$63
4097 : f0 14 __ BEQ $40ad ; (sprintf.s104 + 0)
.s107:
4099 : c9 43 __ CMP #$43
409b : f0 10 __ BEQ $40ad ; (sprintf.s104 + 0)
.s105:
409d : 09 00 __ ORA #$00
409f : d0 03 __ BNE $40a4 ; (sprintf.s108 + 0)
40a1 : 4c f6 3e JMP $3ef6 ; (sprintf.l2 + 0)
.s108:
40a4 : a4 43 __ LDY T1 + 0 
40a6 : 91 4b __ STA (T3 + 0),y 
40a8 : e6 43 __ INC T1 + 0 
40aa : 4c f6 3e JMP $3ef6 ; (sprintf.l2 + 0)
.s104:
40ad : a0 00 __ LDY #$00
40af : b1 47 __ LDA (T0 + 0),y 
40b1 : a4 43 __ LDY T1 + 0 
40b3 : 91 4b __ STA (T3 + 0),y 
40b5 : e6 43 __ INC T1 + 0 
.s258:
40b7 : 18 __ __ CLC
40b8 : a5 47 __ LDA T0 + 0 
40ba : 69 02 __ ADC #$02
40bc : 85 47 __ STA T0 + 0 
40be : b0 03 __ BCS $40c3 ; (sprintf.s1085 + 0)
40c0 : 4c f6 3e JMP $3ef6 ; (sprintf.l2 + 0)
.s1085:
40c3 : e6 48 __ INC T0 + 1 
40c5 : 4c f6 3e JMP $3ef6 ; (sprintf.l2 + 0)
.s73:
40c8 : a0 00 __ LDY #$00
40ca : 84 45 __ STY T4 + 0 
40cc : b1 47 __ LDA (T0 + 0),y 
40ce : 85 4d __ STA T6 + 0 
40d0 : c8 __ __ INY
40d1 : b1 47 __ LDA (T0 + 0),y 
40d3 : 85 4e __ STA T6 + 1 
40d5 : 18 __ __ CLC
40d6 : a5 47 __ LDA T0 + 0 
40d8 : 69 02 __ ADC #$02
40da : 85 47 __ STA T0 + 0 
40dc : 90 02 __ BCC $40e0 ; (sprintf.s1092 + 0)
.s1091:
40de : e6 48 __ INC T0 + 1 
.s1092:
40e0 : ad d6 bf LDA $bfd6 ; (buff + 43)
40e3 : f0 0d __ BEQ $40f2 ; (sprintf.s79 + 0)
.s1071:
40e5 : a0 00 __ LDY #$00
40e7 : b1 4d __ LDA (T6 + 0),y 
40e9 : f0 05 __ BEQ $40f0 ; (sprintf.s1072 + 0)
.l81:
40eb : c8 __ __ INY
40ec : b1 4d __ LDA (T6 + 0),y 
40ee : d0 fb __ BNE $40eb ; (sprintf.l81 + 0)
.s1072:
40f0 : 84 45 __ STY T4 + 0 
.s79:
40f2 : ad db bf LDA $bfdb ; (buff + 48)
40f5 : d0 19 __ BNE $4110 ; (sprintf.l95 + 0)
.s1075:
40f7 : a6 45 __ LDX T4 + 0 
40f9 : ec d6 bf CPX $bfd6 ; (buff + 43)
40fc : a4 43 __ LDY T1 + 0 
40fe : b0 0c __ BCS $410c ; (sprintf.s1076 + 0)
.l87:
4100 : ad d5 bf LDA $bfd5 ; (buff + 42)
4103 : 91 4b __ STA (T3 + 0),y 
4105 : e8 __ __ INX
4106 : ec d6 bf CPX $bfd6 ; (buff + 43)
4109 : c8 __ __ INY
410a : 90 f4 __ BCC $4100 ; (sprintf.l87 + 0)
.s1076:
410c : 86 45 __ STX T4 + 0 
410e : 84 43 __ STY T1 + 0 
.l95:
4110 : a0 00 __ LDY #$00
4112 : b1 4d __ LDA (T6 + 0),y 
4114 : f0 0f __ BEQ $4125 ; (sprintf.s91 + 0)
.s96:
4116 : a4 43 __ LDY T1 + 0 
4118 : 91 4b __ STA (T3 + 0),y 
411a : e6 43 __ INC T1 + 0 
411c : e6 4d __ INC T6 + 0 
411e : d0 f0 __ BNE $4110 ; (sprintf.l95 + 0)
.s1093:
4120 : e6 4e __ INC T6 + 1 
4122 : 4c 10 41 JMP $4110 ; (sprintf.l95 + 0)
.s91:
4125 : ad db bf LDA $bfdb ; (buff + 48)
4128 : d0 03 __ BNE $412d ; (sprintf.s1073 + 0)
412a : 4c f6 3e JMP $3ef6 ; (sprintf.l2 + 0)
.s1073:
412d : a6 45 __ LDX T4 + 0 
412f : ec d6 bf CPX $bfd6 ; (buff + 43)
4132 : a4 43 __ LDY T1 + 0 
4134 : b0 0c __ BCS $4142 ; (sprintf.s1074 + 0)
.l102:
4136 : ad d5 bf LDA $bfd5 ; (buff + 42)
4139 : 91 4b __ STA (T3 + 0),y 
413b : e8 __ __ INX
413c : ec d6 bf CPX $bfd6 ; (buff + 43)
413f : c8 __ __ INY
4140 : 90 f4 __ BCC $4136 ; (sprintf.l102 + 0)
.s1074:
4142 : 84 43 __ STY T1 + 0 
4144 : 4c f6 3e JMP $3ef6 ; (sprintf.l2 + 0)
.s57:
4147 : a0 00 __ LDY #$00
4149 : b1 47 __ LDA (T0 + 0),y 
414b : 85 53 __ STA T8 + 0 
414d : c8 __ __ INY
414e : b1 47 __ LDA (T0 + 0),y 
4150 : 85 54 __ STA T8 + 1 
4152 : c8 __ __ INY
4153 : b1 47 __ LDA (T0 + 0),y 
4155 : 85 55 __ STA T8 + 2 
4157 : c8 __ __ INY
4158 : b1 47 __ LDA (T0 + 0),y 
415a : 85 56 __ STA T8 + 3 
415c : 18 __ __ CLC
415d : a5 47 __ LDA T0 + 0 
415f : 69 04 __ ADC #$04
4161 : 85 47 __ STA T0 + 0 
4163 : 90 02 __ BCC $4167 ; (sprintf.s1088 + 0)
.s1087:
4165 : e6 48 __ INC T0 + 1 
.s1088:
4167 : a0 00 __ LDY #$00
4169 : b1 49 __ LDA (T2 + 0),y 
416b : aa __ __ TAX
416c : e6 49 __ INC T2 + 0 
416e : d0 02 __ BNE $4172 ; (sprintf.s1090 + 0)
.s1089:
4170 : e6 4a __ INC T2 + 1 
.s1090:
4172 : 8a __ __ TXA
4173 : e0 64 __ CPX #$64
4175 : f0 04 __ BEQ $417b ; (sprintf.s61 + 0)
.s64:
4177 : c9 44 __ CMP #$44
4179 : d0 04 __ BNE $417f ; (sprintf.s62 + 0)
.s61:
417b : a9 01 __ LDA #$01
417d : d0 1c __ BNE $419b ; (sprintf.s259 + 0)
.s62:
417f : c9 75 __ CMP #$75
4181 : f0 17 __ BEQ $419a ; (sprintf.s284 + 0)
.s68:
4183 : c9 55 __ CMP #$55
4185 : f0 13 __ BEQ $419a ; (sprintf.s284 + 0)
.s66:
4187 : c9 78 __ CMP #$78
4189 : f0 07 __ BEQ $4192 ; (sprintf.s69 + 0)
.s72:
418b : c9 58 __ CMP #$58
418d : f0 03 __ BEQ $4192 ; (sprintf.s69 + 0)
418f : 4c f6 3e JMP $3ef6 ; (sprintf.l2 + 0)
.s69:
4192 : 8c d9 bf STY $bfd9 ; (buff + 46)
4195 : a9 10 __ LDA #$10
4197 : 8d d8 bf STA $bfd8 ; (buff + 45)
.s284:
419a : 98 __ __ TYA
.s259:
419b : 85 15 __ STA P8 
419d : a5 4b __ LDA T3 + 0 
419f : 85 0f __ STA P2 ; (fmt + 0)
41a1 : a5 4c __ LDA T3 + 1 
41a3 : 85 10 __ STA P3 ; (fmt + 1)
41a5 : a9 d5 __ LDA #$d5
41a7 : 85 0d __ STA P0 ; (str + 0)
41a9 : a9 bf __ LDA #$bf
41ab : 85 0e __ STA P1 ; (str + 1)
41ad : 20 27 37 JSR $3727 ; (nforml@proxy + 0)
41b0 : a5 1b __ LDA ACCU + 0 
41b2 : 4c 2c 3f JMP $3f2c ; (sprintf.s1068 + 0)
.s285:
41b5 : a9 00 __ LDA #$00
.s261:
41b7 : 85 13 __ STA P6 
41b9 : a5 4b __ LDA T3 + 0 
41bb : 85 0f __ STA P2 ; (fmt + 0)
41bd : a5 4c __ LDA T3 + 1 
41bf : 85 10 __ STA P3 ; (fmt + 1)
41c1 : a0 00 __ LDY #$00
41c3 : b1 47 __ LDA (T0 + 0),y 
41c5 : 85 11 __ STA P4 ; (fmt + 2)
41c7 : c8 __ __ INY
41c8 : b1 47 __ LDA (T0 + 0),y 
41ca : 85 12 __ STA P5 ; (fmt + 3)
41cc : a9 d5 __ LDA #$d5
41ce : 85 0d __ STA P0 ; (str + 0)
41d0 : a9 bf __ LDA #$bf
41d2 : 85 0e __ STA P1 ; (str + 1)
41d4 : 20 f2 35 JSR $35f2 ; (nformi.s0 + 0)
41d7 : a5 1b __ LDA ACCU + 0 
41d9 : 85 43 __ STA T1 + 0 
41db : 4c b7 40 JMP $40b7 ; (sprintf.s258 + 0)
.s260:
41de : a0 00 __ LDY #$00
41e0 : b1 49 __ LDA (T2 + 0),y 
41e2 : aa __ __ TAX
41e3 : 18 __ __ CLC
41e4 : a5 49 __ LDA T2 + 0 
41e6 : 69 01 __ ADC #$01
41e8 : 4c 6a 3f JMP $3f6a ; (sprintf.l15 + 0)
--------------------------------------------------------------------
41eb : __ __ __ BYT 6f 4e 20 00                                     : oN .
--------------------------------------------------------------------
41ef : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
spentry:
41f3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
41f4 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
4200 : __ __ __ BYT 76 64 63 20 6d 45 4d 4f 52 59 20 64 45 54 45 43 : vdc mEMORY dETEC
4210 : __ __ __ BYT 54 45 44 3a 20 25 44 20 6b 62 2c 20 53 43 52 45 : TED: %D kb, SCRE
4220 : __ __ __ BYT 45 4e 20 53 49 5a 45 3a 20 25 44 58 25 44 2c 20 : EN SIZE: %DX%D, 
4230 : __ __ __ BYT 45 58 54 2e 4d 45 4d 3a 20 25 53 00             : EXT.MEM: %S.
--------------------------------------------------------------------
423c : __ __ __ BYT 6d 4f 56 45 20 42 59 20 71 2c 77 2c 65 2c 61 2c : mOVE BY q,w,e,a,
424c : __ __ __ BYT 73 2c 64 2c 7a 2c 78 2c 63 20 4b 45 59 53 2e 20 : s,d,z,x,c KEYS. 
425c : __ __ __ BYT 65 73 63 20 4f 52 20 73 74 6f 70 20 54 4f 20 45 : esc OR stop TO E
426c : __ __ __ BYT 58 49 54 2e 00                                  : XIT..
--------------------------------------------------------------------
4271 : __ __ __ BYT 70 45 54 53 43 49 49 20 41 52 54 20 43 52 45 44 : pETSCII ART CRED
4281 : __ __ __ BYT 49 54 3a 20 27 6c 4f 56 45 20 49 53 20 54 48 45 : IT: 'lOVE IS THE
4291 : __ __ __ BYT 20 44 52 55 47 27 20 61 54 4c 41 4e 54 49 53 2c :  DRUG' aTLANTIS,
42a1 : __ __ __ BYT 20 32 30 32 33 2c 20 61 52 54 20 42 59 20 6c 4f :  2023, aRT BY lO
42b1 : __ __ __ BYT 42 4f 2e 00                                     : BO..
--------------------------------------------------------------------
mul16by8: ; mul16by8
42b5 : a0 00 __ LDY #$00
42b7 : 84 06 __ STY WORK + 3 
42b9 : 4a __ __ LSR
42ba : 90 0d __ BCC $42c9 ; (mul16by8 + 20)
42bc : aa __ __ TAX
42bd : 18 __ __ CLC
42be : 98 __ __ TYA
42bf : 65 1b __ ADC ACCU + 0 
42c1 : a8 __ __ TAY
42c2 : a5 06 __ LDA WORK + 3 
42c4 : 65 1c __ ADC ACCU + 1 
42c6 : 85 06 __ STA WORK + 3 
42c8 : 8a __ __ TXA
42c9 : 06 1b __ ASL ACCU + 0 
42cb : 26 1c __ ROL ACCU + 1 
42cd : 4a __ __ LSR
42ce : b0 ec __ BCS $42bc ; (mul16by8 + 7)
42d0 : d0 f7 __ BNE $42c9 ; (mul16by8 + 20)
42d2 : 84 05 __ STY WORK + 2 
42d4 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
42d5 : a0 00 __ LDY #$00
42d7 : 84 06 __ STY WORK + 3 
42d9 : a5 03 __ LDA WORK + 0 
42db : a6 04 __ LDX WORK + 1 
42dd : f0 1c __ BEQ $42fb ; (mul16 + 38)
42df : 38 __ __ SEC
42e0 : 6a __ __ ROR
42e1 : 90 0d __ BCC $42f0 ; (mul16 + 27)
42e3 : aa __ __ TAX
42e4 : 18 __ __ CLC
42e5 : 98 __ __ TYA
42e6 : 65 1b __ ADC ACCU + 0 
42e8 : a8 __ __ TAY
42e9 : a5 06 __ LDA WORK + 3 
42eb : 65 1c __ ADC ACCU + 1 
42ed : 85 06 __ STA WORK + 3 
42ef : 8a __ __ TXA
42f0 : 06 1b __ ASL ACCU + 0 
42f2 : 26 1c __ ROL ACCU + 1 
42f4 : 4a __ __ LSR
42f5 : 90 f9 __ BCC $42f0 ; (mul16 + 27)
42f7 : d0 ea __ BNE $42e3 ; (mul16 + 14)
42f9 : a5 04 __ LDA WORK + 1 
42fb : 4a __ __ LSR
42fc : 90 0d __ BCC $430b ; (mul16 + 54)
42fe : aa __ __ TAX
42ff : 18 __ __ CLC
4300 : 98 __ __ TYA
4301 : 65 1b __ ADC ACCU + 0 
4303 : a8 __ __ TAY
4304 : a5 06 __ LDA WORK + 3 
4306 : 65 1c __ ADC ACCU + 1 
4308 : 85 06 __ STA WORK + 3 
430a : 8a __ __ TXA
430b : 06 1b __ ASL ACCU + 0 
430d : 26 1c __ ROL ACCU + 1 
430f : 4a __ __ LSR
4310 : b0 ec __ BCS $42fe ; (mul16 + 41)
4312 : d0 f7 __ BNE $430b ; (mul16 + 54)
4314 : 84 05 __ STY WORK + 2 
4316 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
4317 : a5 1c __ LDA ACCU + 1 
4319 : d0 31 __ BNE $434c ; (divmod + 53)
431b : a5 04 __ LDA WORK + 1 
431d : d0 1e __ BNE $433d ; (divmod + 38)
431f : 85 06 __ STA WORK + 3 
4321 : a2 04 __ LDX #$04
4323 : 06 1b __ ASL ACCU + 0 
4325 : 2a __ __ ROL
4326 : c5 03 __ CMP WORK + 0 
4328 : 90 02 __ BCC $432c ; (divmod + 21)
432a : e5 03 __ SBC WORK + 0 
432c : 26 1b __ ROL ACCU + 0 
432e : 2a __ __ ROL
432f : c5 03 __ CMP WORK + 0 
4331 : 90 02 __ BCC $4335 ; (divmod + 30)
4333 : e5 03 __ SBC WORK + 0 
4335 : 26 1b __ ROL ACCU + 0 
4337 : ca __ __ DEX
4338 : d0 eb __ BNE $4325 ; (divmod + 14)
433a : 85 05 __ STA WORK + 2 
433c : 60 __ __ RTS
433d : a5 1b __ LDA ACCU + 0 
433f : 85 05 __ STA WORK + 2 
4341 : a5 1c __ LDA ACCU + 1 
4343 : 85 06 __ STA WORK + 3 
4345 : a9 00 __ LDA #$00
4347 : 85 1b __ STA ACCU + 0 
4349 : 85 1c __ STA ACCU + 1 
434b : 60 __ __ RTS
434c : a5 04 __ LDA WORK + 1 
434e : d0 1f __ BNE $436f ; (divmod + 88)
4350 : a5 03 __ LDA WORK + 0 
4352 : 30 1b __ BMI $436f ; (divmod + 88)
4354 : a9 00 __ LDA #$00
4356 : 85 06 __ STA WORK + 3 
4358 : a2 10 __ LDX #$10
435a : 06 1b __ ASL ACCU + 0 
435c : 26 1c __ ROL ACCU + 1 
435e : 2a __ __ ROL
435f : c5 03 __ CMP WORK + 0 
4361 : 90 02 __ BCC $4365 ; (divmod + 78)
4363 : e5 03 __ SBC WORK + 0 
4365 : 26 1b __ ROL ACCU + 0 
4367 : 26 1c __ ROL ACCU + 1 
4369 : ca __ __ DEX
436a : d0 f2 __ BNE $435e ; (divmod + 71)
436c : 85 05 __ STA WORK + 2 
436e : 60 __ __ RTS
436f : a9 00 __ LDA #$00
4371 : 85 05 __ STA WORK + 2 
4373 : 85 06 __ STA WORK + 3 
4375 : 84 02 __ STY $02 
4377 : a0 10 __ LDY #$10
4379 : 18 __ __ CLC
437a : 26 1b __ ROL ACCU + 0 
437c : 26 1c __ ROL ACCU + 1 
437e : 26 05 __ ROL WORK + 2 
4380 : 26 06 __ ROL WORK + 3 
4382 : 38 __ __ SEC
4383 : a5 05 __ LDA WORK + 2 
4385 : e5 03 __ SBC WORK + 0 
4387 : aa __ __ TAX
4388 : a5 06 __ LDA WORK + 3 
438a : e5 04 __ SBC WORK + 1 
438c : 90 04 __ BCC $4392 ; (divmod + 123)
438e : 86 05 __ STX WORK + 2 
4390 : 85 06 __ STA WORK + 3 
4392 : 88 __ __ DEY
4393 : d0 e5 __ BNE $437a ; (divmod + 99)
4395 : 26 1b __ ROL ACCU + 0 
4397 : 26 1c __ ROL ACCU + 1 
4399 : a4 02 __ LDY $02 
439b : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
439c : 84 02 __ STY $02 
439e : a0 20 __ LDY #$20
43a0 : a9 00 __ LDA #$00
43a2 : 85 07 __ STA WORK + 4 
43a4 : 85 08 __ STA WORK + 5 
43a6 : 85 09 __ STA WORK + 6 
43a8 : 85 0a __ STA WORK + 7 
43aa : a5 05 __ LDA WORK + 2 
43ac : 05 06 __ ORA WORK + 3 
43ae : d0 39 __ BNE $43e9 ; (divmod32 + 77)
43b0 : 18 __ __ CLC
43b1 : 26 1b __ ROL ACCU + 0 
43b3 : 26 1c __ ROL ACCU + 1 
43b5 : 26 1d __ ROL ACCU + 2 
43b7 : 26 1e __ ROL ACCU + 3 
43b9 : 26 07 __ ROL WORK + 4 
43bb : 26 08 __ ROL WORK + 5 
43bd : 90 0c __ BCC $43cb ; (divmod32 + 47)
43bf : a5 07 __ LDA WORK + 4 
43c1 : e5 03 __ SBC WORK + 0 
43c3 : aa __ __ TAX
43c4 : a5 08 __ LDA WORK + 5 
43c6 : e5 04 __ SBC WORK + 1 
43c8 : 38 __ __ SEC
43c9 : b0 0c __ BCS $43d7 ; (divmod32 + 59)
43cb : 38 __ __ SEC
43cc : a5 07 __ LDA WORK + 4 
43ce : e5 03 __ SBC WORK + 0 
43d0 : aa __ __ TAX
43d1 : a5 08 __ LDA WORK + 5 
43d3 : e5 04 __ SBC WORK + 1 
43d5 : 90 04 __ BCC $43db ; (divmod32 + 63)
43d7 : 86 07 __ STX WORK + 4 
43d9 : 85 08 __ STA WORK + 5 
43db : 88 __ __ DEY
43dc : d0 d3 __ BNE $43b1 ; (divmod32 + 21)
43de : 26 1b __ ROL ACCU + 0 
43e0 : 26 1c __ ROL ACCU + 1 
43e2 : 26 1d __ ROL ACCU + 2 
43e4 : 26 1e __ ROL ACCU + 3 
43e6 : a4 02 __ LDY $02 
43e8 : 60 __ __ RTS
43e9 : 18 __ __ CLC
43ea : 26 1b __ ROL ACCU + 0 
43ec : 26 1c __ ROL ACCU + 1 
43ee : 26 1d __ ROL ACCU + 2 
43f0 : 26 1e __ ROL ACCU + 3 
43f2 : 26 07 __ ROL WORK + 4 
43f4 : 26 08 __ ROL WORK + 5 
43f6 : 26 09 __ ROL WORK + 6 
43f8 : 26 0a __ ROL WORK + 7 
43fa : a5 07 __ LDA WORK + 4 
43fc : c5 03 __ CMP WORK + 0 
43fe : a5 08 __ LDA WORK + 5 
4400 : e5 04 __ SBC WORK + 1 
4402 : a5 09 __ LDA WORK + 6 
4404 : e5 05 __ SBC WORK + 2 
4406 : a5 0a __ LDA WORK + 7 
4408 : e5 06 __ SBC WORK + 3 
440a : 90 18 __ BCC $4424 ; (divmod32 + 136)
440c : a5 07 __ LDA WORK + 4 
440e : e5 03 __ SBC WORK + 0 
4410 : 85 07 __ STA WORK + 4 
4412 : a5 08 __ LDA WORK + 5 
4414 : e5 04 __ SBC WORK + 1 
4416 : 85 08 __ STA WORK + 5 
4418 : a5 09 __ LDA WORK + 6 
441a : e5 05 __ SBC WORK + 2 
441c : 85 09 __ STA WORK + 6 
441e : a5 0a __ LDA WORK + 7 
4420 : e5 06 __ SBC WORK + 3 
4422 : 85 0a __ STA WORK + 7 
4424 : 88 __ __ DEY
4425 : d0 c3 __ BNE $43ea ; (divmod32 + 78)
4427 : 26 1b __ ROL ACCU + 0 
4429 : 26 1c __ ROL ACCU + 1 
442b : 26 1d __ ROL ACCU + 2 
442d : 26 1e __ ROL ACCU + 3 
442f : a4 02 __ LDY $02 
4431 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_modes:
4432 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
4442 : __ __ __ BYT 30 00 40 00 7f 04 26 06 19 07 20 08 fc 09 e7 ff : 0.@...&... .....
4452 : __ __ __ BYT 50 00 32 00 00 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
4462 : __ __ __ BYT 30 00 60 00 80 04 40 06 32 07 3a 08 03 09 07 ff : 0.`...@.2.:.....
--------------------------------------------------------------------
vdc_state:
4472 : __ __ __ BSS	22
--------------------------------------------------------------------
linebuffer:
4488 : __ __ __ BSS	81
--------------------------------------------------------------------
bnk_load: ; bnk_load(u8,u8,const u8*,const u8*)->bool
.s0:
01:1300 : a9 01 __ LDA #$01
01:1302 : 85 0d __ STA P0 
01:1304 : a9 00 __ LDA #$00
01:1306 : 85 0e __ STA P1 
01:1308 : 20 4f 39 JSR $394f ; (krnio_setbnk.s0 + 0)
01:130b : a9 a1 __ LDA #$a1
01:130d : 85 0d __ STA P0 
01:130f : a9 3e __ LDA #$3e
01:1311 : 85 0e __ STA P1 
01:1313 : 20 57 39 JSR $3957 ; (krnio_setnam.s0 + 0)
01:1316 : a9 01 __ LDA #$01
01:1318 : a6 0f __ LDX P2 
01:131a : a0 00 __ LDY #$00
01:131c : 20 ba ff JSR $ffba 
01:131f : a9 00 __ LDA #$00
01:1321 : a6 10 __ LDX P3 
01:1323 : a4 11 __ LDY P4 
01:1325 : 20 d5 ff JSR $ffd5 
01:1328 : a9 00 __ LDA #$00
01:132a : b0 02 __ BCS $132e ; (bnk_load.s0 + 46)
01:132c : a9 01 __ LDA #$01
01:132e : 85 1b __ STA ACCU + 0 
.s1001:
01:1330 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpy_viewporttovdc: ; bnk_cpy_viewporttovdc(u8,u8*,u16,u16,u16,u16,u8,u8,u8,u8)->void
.s0:
01:1331 : ad f6 bf LDA $bff6 ; (sstack + 9)
01:1334 : d0 01 __ BNE $1337 ; (bnk_cpy_viewporttovdc.s14 + 0)
.s1001:
01:1336 : 60 __ __ RTS
.s14:
01:1337 : 85 43 __ STA T0 + 0 
01:1339 : 85 44 __ STA T1 + 0 
01:133b : ad f1 bf LDA $bff1 ; (sstack + 4)
01:133e : 85 03 __ STA WORK + 0 
01:1340 : ad f2 bf LDA $bff2 ; (sstack + 5)
01:1343 : 85 04 __ STA WORK + 1 
01:1345 : a5 17 __ LDA P10 ; (sourcewidth + 0)
01:1347 : 85 1b __ STA ACCU + 0 ; (sourcexoffset + 0)
01:1349 : a5 18 __ LDA P11 ; (sourcewidth + 1)
01:134b : 85 1c __ STA ACCU + 1 ; (sourcexoffset + 1)
01:134d : 20 d5 42 JSR $42d5 ; (mul16 + 0)
01:1350 : ad ef bf LDA $bfef ; (sstack + 2)
01:1353 : 18 __ __ CLC
01:1354 : 65 05 __ ADC WORK + 2 
01:1356 : 85 45 __ STA T2 + 0 
01:1358 : 85 47 __ STA T4 + 0 
01:135a : ad f0 bf LDA $bff0 ; (sstack + 3)
01:135d : 65 06 __ ADC WORK + 3 
01:135f : 18 __ __ CLC
01:1360 : 69 50 __ ADC #$50
01:1362 : 85 46 __ STA T2 + 1 
01:1364 : 85 48 __ STA T4 + 1 
01:1366 : ad 75 44 LDA $4475 ; (vdc_state + 3)
01:1369 : 85 1b __ STA ACCU + 0 ; (sourcexoffset + 0)
01:136b : ad 76 44 LDA $4476 ; (vdc_state + 4)
01:136e : 85 1c __ STA ACCU + 1 ; (sourcexoffset + 1)
01:1370 : ad f4 bf LDA $bff4 ; (sstack + 7)
01:1373 : 85 49 __ STA T6 + 0 
01:1375 : 20 b5 42 JSR $42b5 ; (mul16by8 + 0)
01:1378 : ad f3 bf LDA $bff3 ; (sstack + 6)
01:137b : 85 4a __ STA T8 + 0 
01:137d : 18 __ __ CLC
01:137e : 65 05 __ ADC WORK + 2 
01:1380 : 85 1b __ STA ACCU + 0 ; (sourcexoffset + 0)
01:1382 : a9 00 __ LDA #$00
01:1384 : 65 06 __ ADC WORK + 3 
01:1386 : aa __ __ TAX
01:1387 : ad 7a 44 LDA $447a ; (vdc_state + 8)
01:138a : 18 __ __ CLC
01:138b : 65 1b __ ADC ACCU + 0 ; (sourcexoffset + 0)
01:138d : 85 0d __ STA P0 
01:138f : 8a __ __ TXA
01:1390 : 6d 7b 44 ADC $447b ; (vdc_state + 9)
01:1393 : 85 0e __ STA P1 
01:1395 : ad f5 bf LDA $bff5 ; (sstack + 8)
01:1398 : 85 4b __ STA T9 + 0 
01:139a : 85 12 __ STA P5 
01:139c : a5 14 __ LDA P7 ; (sourcebank + 0)
01:139e : 85 0f __ STA P2 
.l1002:
01:13a0 : a5 47 __ LDA T4 + 0 
01:13a2 : 85 10 __ STA P3 
01:13a4 : a5 48 __ LDA T4 + 1 
01:13a6 : 85 11 __ STA P4 
01:13a8 : 20 51 14 JSR $1451 ; (bnk_cpytovdc@proxy + 0)
01:13ab : 18 __ __ CLC
01:13ac : a5 47 __ LDA T4 + 0 
01:13ae : 6d 75 44 ADC $4475 ; (vdc_state + 3)
01:13b1 : 85 47 __ STA T4 + 0 
01:13b3 : a5 48 __ LDA T4 + 1 
01:13b5 : 6d 76 44 ADC $4476 ; (vdc_state + 4)
01:13b8 : 85 48 __ STA T4 + 1 
01:13ba : ad 75 44 LDA $4475 ; (vdc_state + 3)
01:13bd : 85 1b __ STA ACCU + 0 ; (sourcexoffset + 0)
01:13bf : 18 __ __ CLC
01:13c0 : 65 0d __ ADC P0 
01:13c2 : 85 0d __ STA P0 
01:13c4 : ad 76 44 LDA $4476 ; (vdc_state + 4)
01:13c7 : 85 1c __ STA ACCU + 1 ; (sourcexoffset + 1)
01:13c9 : 65 0e __ ADC P1 
01:13cb : 85 0e __ STA P1 
01:13cd : c6 44 __ DEC T1 + 0 
01:13cf : d0 cf __ BNE $13a0 ; (bnk_cpy_viewporttovdc.l1002 + 0)
.s1003:
01:13d1 : a5 49 __ LDA T6 + 0 
01:13d3 : 20 b5 42 JSR $42b5 ; (mul16by8 + 0)
01:13d6 : 18 __ __ CLC
01:13d7 : a5 05 __ LDA WORK + 2 
01:13d9 : 65 4a __ ADC T8 + 0 
01:13db : 85 47 __ STA T4 + 0 
01:13dd : a5 06 __ LDA WORK + 3 
01:13df : 69 00 __ ADC #$00
01:13e1 : aa __ __ TAX
01:13e2 : ad 7c 44 LDA $447c ; (vdc_state + 10)
01:13e5 : 18 __ __ CLC
01:13e6 : 65 47 __ ADC T4 + 0 
01:13e8 : 85 0d __ STA P0 
01:13ea : 8a __ __ TXA
01:13eb : 6d 7d 44 ADC $447d ; (vdc_state + 11)
01:13ee : 85 0e __ STA P1 
01:13f0 : ad ed bf LDA $bfed ; (sstack + 0)
01:13f3 : 85 1b __ STA ACCU + 0 ; (sourcexoffset + 0)
01:13f5 : ad ee bf LDA $bfee ; (sstack + 1)
01:13f8 : 85 1c __ STA ACCU + 1 ; (sourcexoffset + 1)
01:13fa : a5 17 __ LDA P10 ; (sourcewidth + 0)
01:13fc : 85 03 __ STA WORK + 0 
01:13fe : a5 18 __ LDA P11 ; (sourcewidth + 1)
01:1400 : 85 04 __ STA WORK + 1 
01:1402 : 20 d5 42 JSR $42d5 ; (mul16 + 0)
01:1405 : 18 __ __ CLC
01:1406 : a5 45 __ LDA T2 + 0 
01:1408 : 65 05 __ ADC WORK + 2 
01:140a : a8 __ __ TAY
01:140b : a5 46 __ LDA T2 + 1 
01:140d : 65 06 __ ADC WORK + 3 
01:140f : aa __ __ TAX
01:1410 : 98 __ __ TYA
01:1411 : 18 __ __ CLC
01:1412 : 69 30 __ ADC #$30
01:1414 : 85 45 __ STA T2 + 0 
01:1416 : 90 01 __ BCC $1419 ; (bnk_cpy_viewporttovdc.s1007 + 0)
.s1006:
01:1418 : e8 __ __ INX
.s1007:
01:1419 : 86 46 __ STX T2 + 1 
01:141b : a5 14 __ LDA P7 ; (sourcebank + 0)
01:141d : 85 0f __ STA P2 
01:141f : a5 4b __ LDA T9 + 0 
01:1421 : 85 12 __ STA P5 
.l1004:
01:1423 : a5 45 __ LDA T2 + 0 
01:1425 : 85 10 __ STA P3 
01:1427 : a5 46 __ LDA T2 + 1 
01:1429 : 85 11 __ STA P4 
01:142b : 20 51 14 JSR $1451 ; (bnk_cpytovdc@proxy + 0)
01:142e : ad 75 44 LDA $4475 ; (vdc_state + 3)
01:1431 : 18 __ __ CLC
01:1432 : 65 0d __ ADC P0 
01:1434 : 85 0d __ STA P0 
01:1436 : ad 76 44 LDA $4476 ; (vdc_state + 4)
01:1439 : 65 0e __ ADC P1 
01:143b : 85 0e __ STA P1 
01:143d : 18 __ __ CLC
01:143e : a5 45 __ LDA T2 + 0 
01:1440 : 6d 75 44 ADC $4475 ; (vdc_state + 3)
01:1443 : 85 45 __ STA T2 + 0 
01:1445 : a5 46 __ LDA T2 + 1 
01:1447 : 6d 76 44 ADC $4476 ; (vdc_state + 4)
01:144a : 85 46 __ STA T2 + 1 
01:144c : c6 43 __ DEC T0 + 0 
01:144e : d0 d3 __ BNE $1423 ; (bnk_cpy_viewporttovdc.l1004 + 0)
01:1450 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:1451 : a9 00 __ LDA #$00
01:1453 : 85 13 __ STA P6 
--------------------------------------------------------------------
bnk_cpytovdc: ; bnk_cpytovdc(u16,u8,u8*,u16)->void
.s0:
01:1455 : ad 00 ff LDA $ff00 
01:1458 : 85 1b __ STA ACCU + 0 
01:145a : a9 0e __ LDA #$0e
01:145c : 8d 00 ff STA $ff00 
01:145f : a9 12 __ LDA #$12
01:1461 : 8d 00 d6 STA $d600 
.l115:
01:1464 : 2c 00 d6 BIT $d600 
01:1467 : 10 fb __ BPL $1464 ; (bnk_cpytovdc.l115 + 0)
.s6:
01:1469 : a5 0e __ LDA P1 ; (vdcdest + 1)
01:146b : 8d 01 d6 STA $d601 
01:146e : a9 13 __ LDA #$13
01:1470 : 8d 00 d6 STA $d600 
.l117:
01:1473 : 2c 00 d6 BIT $d600 
01:1476 : 10 fb __ BPL $1473 ; (bnk_cpytovdc.l117 + 0)
.s11:
01:1478 : a5 0d __ LDA P0 ; (vdcdest + 0)
01:147a : 8d 01 d6 STA $d601 
01:147d : a9 1f __ LDA #$1f
01:147f : 8d 00 d6 STA $d600 
01:1482 : a5 12 __ LDA P5 ; (size + 0)
01:1484 : 05 13 __ ORA P6 ; (size + 1)
01:1486 : d0 06 __ BNE $148e ; (bnk_cpytovdc.s1012 + 0)
.s15:
01:1488 : a5 1b __ LDA ACCU + 0 
01:148a : 8d 00 ff STA $ff00 
.s1001:
01:148d : 60 __ __ RTS
.s1012:
01:148e : a6 12 __ LDX P5 ; (size + 0)
.l14:
01:1490 : a5 0f __ LDA P2 ; (scr + 0)
01:1492 : 8d 00 ff STA $ff00 
01:1495 : a0 00 __ LDY #$00
01:1497 : b1 10 __ LDA (P3),y ; (sp + 0)
01:1499 : a8 __ __ TAY
01:149a : e6 10 __ INC P3 ; (sp + 0)
01:149c : d0 02 __ BNE $14a0 ; (bnk_cpytovdc.s1014 + 0)
.s1013:
01:149e : e6 11 __ INC P4 ; (sp + 1)
.s1014:
01:14a0 : a9 0e __ LDA #$0e
01:14a2 : 8d 00 ff STA $ff00 
.l120:
01:14a5 : 2c 00 d6 BIT $d600 
01:14a8 : 10 fb __ BPL $14a5 ; (bnk_cpytovdc.l120 + 0)
.s18:
01:14aa : 8c 01 d6 STY $d601 
01:14ad : 8a __ __ TXA
01:14ae : d0 02 __ BNE $14b2 ; (bnk_cpytovdc.s1009 + 0)
.s1008:
01:14b0 : c6 13 __ DEC P6 ; (size + 1)
.s1009:
01:14b2 : ca __ __ DEX
01:14b3 : d0 db __ BNE $1490 ; (bnk_cpytovdc.l14 + 0)
.s1010:
01:14b5 : a5 13 __ LDA P6 ; (size + 1)
01:14b7 : d0 d7 __ BNE $1490 ; (bnk_cpytovdc.l14 + 0)
01:14b9 : 4c 88 14 JMP $1488 ; (bnk_cpytovdc.s15 + 0)
--------------------------------------------------------------------
bnk_viewportscroll: ; bnk_viewportscroll(u8,u8*,u16,u16,u16,u16,u8,u8,u8,u8,u8)->void
.s0:
01:14bc : ad 75 44 LDA $4475 ; (vdc_state + 3)
01:14bf : 0a __ __ ASL
01:14c0 : 85 07 __ STA WORK + 4 
01:14c2 : ad 76 44 LDA $4476 ; (vdc_state + 4)
01:14c5 : 2a __ __ ROL
01:14c6 : 06 07 __ ASL WORK + 4 
01:14c8 : 2a __ __ ROL
01:14c9 : a8 __ __ TAY
01:14ca : 18 __ __ CLC
01:14cb : a5 07 __ LDA WORK + 4 
01:14cd : 6d 75 44 ADC $4475 ; (vdc_state + 3)
01:14d0 : aa __ __ TAX
01:14d1 : 98 __ __ TYA
01:14d2 : 6d 76 44 ADC $4476 ; (vdc_state + 4)
01:14d5 : a8 __ __ TAY
01:14d6 : 8a __ __ TXA
01:14d7 : 18 __ __ CLC
01:14d8 : 69 05 __ ADC #$05
01:14da : 85 43 __ STA T0 + 0 
01:14dc : 90 01 __ BCC $14df ; (bnk_viewportscroll.s1082 + 0)
.s1081:
01:14de : c8 __ __ INY
.s1082:
01:14df : 84 44 __ STY T0 + 1 
01:14e1 : 18 __ __ CLC
01:14e2 : 6d 7e 44 ADC $447e ; (vdc_state + 12)
01:14e5 : 85 47 __ STA T2 + 0 
01:14e7 : ad 7f 44 LDA $447f ; (vdc_state + 13)
01:14ea : 65 44 __ ADC T0 + 1 
01:14ec : 85 48 __ STA T2 + 1 
01:14ee : ad 7a 44 LDA $447a ; (vdc_state + 8)
01:14f1 : 18 __ __ CLC
01:14f2 : 65 43 __ ADC T0 + 0 
01:14f4 : 85 43 __ STA T0 + 0 
01:14f6 : ad 7b 44 LDA $447b ; (vdc_state + 9)
01:14f9 : 65 44 __ ADC T0 + 1 
01:14fb : 85 44 __ STA T0 + 1 
01:14fd : ad 7c 44 LDA $447c ; (vdc_state + 10)
01:1500 : 38 __ __ SEC
01:1501 : ed 7a 44 SBC $447a ; (vdc_state + 8)
01:1504 : 85 49 __ STA T3 + 0 
01:1506 : ad 7d 44 LDA $447d ; (vdc_state + 11)
01:1509 : ed 7b 44 SBC $447b ; (vdc_state + 9)
01:150c : 85 4a __ STA T3 + 1 
01:150e : a9 46 __ LDA #$46
01:1510 : 85 4b __ STA T5 + 0 
01:1512 : a9 05 __ LDA #$05
01:1514 : 85 4c __ STA T4 + 0 
01:1516 : 85 4d __ STA T6 + 0 
01:1518 : ad 73 44 LDA $4473 ; (vdc_state + 1)
01:151b : d0 0f __ BNE $152c ; (bnk_viewportscroll.s7 + 0)
.s8:
01:151d : a9 3f __ LDA #$3f
01:151f : cd 7f 44 CMP $447f ; (vdc_state + 13)
01:1522 : d0 05 __ BNE $1529 ; (bnk_viewportscroll.s1078 + 0)
.s1077:
01:1524 : a9 ff __ LDA #$ff
01:1526 : cd 7e 44 CMP $447e ; (vdc_state + 12)
.s1078:
01:1529 : b0 01 __ BCS $152c ; (bnk_viewportscroll.s7 + 0)
01:152b : 60 __ __ RTS
.s7:
01:152c : ad fe bf LDA $bffe ; (sstack + 17)
01:152f : f0 11 __ BEQ $1542 ; (bnk_viewportscroll.s56 + 0)
.s258:
01:1531 : 85 4e __ STA T7 + 0 
01:1533 : a5 43 __ LDA T0 + 0 
01:1535 : 85 50 __ STA T9 + 0 
01:1537 : a5 44 __ LDA T0 + 1 
01:1539 : 85 51 __ STA T9 + 1 
01:153b : a6 48 __ LDX T2 + 1 
01:153d : a4 47 __ LDY T2 + 0 
01:153f : 4c 1a 18 JMP $181a ; (bnk_viewportscroll.l12 + 0)
.s56:
01:1542 : ad 75 44 LDA $4475 ; (vdc_state + 3)
01:1545 : 0a __ __ ASL
01:1546 : 85 1b __ STA ACCU + 0 
01:1548 : ad 76 44 LDA $4476 ; (vdc_state + 4)
01:154b : 2a __ __ ROL
01:154c : 06 1b __ ASL ACCU + 0 
01:154e : 2a __ __ ROL
01:154f : 85 1c __ STA ACCU + 1 
01:1551 : 18 __ __ CLC
01:1552 : a5 1b __ LDA ACCU + 0 
01:1554 : 6d 75 44 ADC $4475 ; (vdc_state + 3)
01:1557 : a8 __ __ TAY
01:1558 : a5 1c __ LDA ACCU + 1 
01:155a : 6d 76 44 ADC $4476 ; (vdc_state + 4)
01:155d : aa __ __ TAX
01:155e : 98 __ __ TYA
01:155f : 18 __ __ CLC
01:1560 : 69 05 __ ADC #$05
01:1562 : 85 45 __ STA T1 + 0 
01:1564 : 90 01 __ BCC $1567 ; (bnk_viewportscroll.s1084 + 0)
.s1083:
01:1566 : e8 __ __ INX
.s1084:
01:1567 : 86 46 __ STX T1 + 1 
01:1569 : 18 __ __ CLC
01:156a : 6d 7e 44 ADC $447e ; (vdc_state + 12)
01:156d : 85 47 __ STA T2 + 0 
01:156f : ad 7f 44 LDA $447f ; (vdc_state + 13)
01:1572 : 65 46 __ ADC T1 + 1 
01:1574 : 85 48 __ STA T2 + 1 
01:1576 : ad 7a 44 LDA $447a ; (vdc_state + 8)
01:1579 : 18 __ __ CLC
01:157a : 65 45 __ ADC T1 + 0 
01:157c : 85 45 __ STA T1 + 0 
01:157e : ad 7b 44 LDA $447b ; (vdc_state + 9)
01:1581 : 65 46 __ ADC T1 + 1 
01:1583 : 85 46 __ STA T1 + 1 
01:1585 : ad ff bf LDA $bfff ; (sstack + 18)
01:1588 : c9 01 __ CMP #$01
01:158a : d0 03 __ BNE $158f ; (bnk_viewportscroll.s1003 + 0)
01:158c : 4c 0b 18 JMP $180b ; (bnk_viewportscroll.s1004 + 0)
.s1003:
01:158f : a9 00 __ LDA #$00
01:1591 : 85 4f __ STA T8 + 0 
01:1593 : ad ff bf LDA $bfff ; (sstack + 18)
01:1596 : c9 02 __ CMP #$02
01:1598 : d0 03 __ BNE $159d ; (bnk_viewportscroll.s111 + 0)
01:159a : 4c fe 17 JMP $17fe ; (bnk_viewportscroll.s109 + 0)
.s111:
01:159d : ad ff bf LDA $bfff ; (sstack + 18)
01:15a0 : c9 04 __ CMP #$04
01:15a2 : d0 12 __ BNE $15b6 ; (bnk_viewportscroll.s114 + 0)
.s112:
01:15a4 : 18 __ __ CLC
01:15a5 : a5 47 __ LDA T2 + 0 
01:15a7 : 6d 75 44 ADC $4475 ; (vdc_state + 3)
01:15aa : 85 47 __ STA T2 + 0 
01:15ac : a5 48 __ LDA T2 + 1 
01:15ae : 6d 76 44 ADC $4476 ; (vdc_state + 4)
01:15b1 : 85 48 __ STA T2 + 1 
01:15b3 : 4c cc 15 JMP $15cc ; (bnk_viewportscroll.s1063 + 0)
.s114:
01:15b6 : ad ff bf LDA $bfff ; (sstack + 18)
01:15b9 : c9 08 __ CMP #$08
01:15bb : d0 12 __ BNE $15cf ; (bnk_viewportscroll.s117 + 0)
.s115:
01:15bd : 18 __ __ CLC
01:15be : a5 45 __ LDA T1 + 0 
01:15c0 : 6d 75 44 ADC $4475 ; (vdc_state + 3)
01:15c3 : 85 45 __ STA T1 + 0 
01:15c5 : a5 46 __ LDA T1 + 1 
01:15c7 : 6d 76 44 ADC $4476 ; (vdc_state + 4)
01:15ca : 85 46 __ STA T1 + 1 
.s1063:
01:15cc : ce fe bf DEC $bffe ; (sstack + 17)
.s117:
01:15cf : ad fe bf LDA $bffe ; (sstack + 17)
01:15d2 : f0 11 __ BEQ $15e5 ; (bnk_viewportscroll.s164 + 0)
.s242:
01:15d4 : 85 4e __ STA T7 + 0 
01:15d6 : a5 47 __ LDA T2 + 0 
01:15d8 : 85 50 __ STA T9 + 0 
01:15da : a5 48 __ LDA T2 + 1 
01:15dc : 85 51 __ STA T9 + 1 
01:15de : a6 46 __ LDX T1 + 1 
01:15e0 : a4 45 __ LDY T1 + 0 
01:15e2 : 4c b5 16 JMP $16b5 ; (bnk_viewportscroll.l120 + 0)
.s164:
01:15e5 : a9 7f __ LDA #$7f
01:15e7 : 85 14 __ STA P7 
01:15e9 : a9 50 __ LDA #$50
01:15eb : 85 17 __ STA P10 
01:15ed : a9 96 __ LDA #$96
01:15ef : 8d ed bf STA $bfed ; (sstack + 0)
01:15f2 : a9 00 __ LDA #$00
01:15f4 : 85 18 __ STA P11 
01:15f6 : 8d ee bf STA $bfee ; (sstack + 1)
01:15f9 : ad ff bf LDA $bfff ; (sstack + 18)
01:15fc : c9 04 __ CMP #$04
01:15fe : d0 2a __ BNE $162a ; (bnk_viewportscroll.s221 + 0)
.s217:
01:1600 : ad fe bf LDA $bffe ; (sstack + 17)
01:1603 : a8 __ __ TAY
01:1604 : 18 __ __ CLC
01:1605 : 69 01 __ ADC #$01
01:1607 : 85 45 __ STA T1 + 0 
01:1609 : a9 01 __ LDA #$01
01:160b : 8d fe bf STA $bffe ; (sstack + 17)
01:160e : a9 00 __ LDA #$00
01:1610 : 2a __ __ ROL
01:1611 : aa __ __ TAX
01:1612 : ad f9 bf LDA $bff9 ; (sstack + 12)
01:1615 : 65 45 __ ADC T1 + 0 
01:1617 : 8d f9 bf STA $bff9 ; (sstack + 12)
01:161a : 8a __ __ TXA
01:161b : 6d fa bf ADC $bffa ; (sstack + 13)
01:161e : 8d fa bf STA $bffa ; (sstack + 13)
01:1621 : 98 __ __ TYA
01:1622 : 18 __ __ CLC
01:1623 : 69 05 __ ADC #$05
01:1625 : 85 4c __ STA T4 + 0 
01:1627 : 4c 43 16 JMP $1643 ; (bnk_viewportscroll.s210 + 0)
.s221:
01:162a : 90 47 __ BCC $1673 ; (bnk_viewportscroll.s223 + 0)
.s222:
01:162c : c9 08 __ CMP #$08
01:162e : d0 13 __ BNE $1643 ; (bnk_viewportscroll.s210 + 0)
.s215:
01:1630 : a9 01 __ LDA #$01
01:1632 : 8d fe bf STA $bffe ; (sstack + 17)
01:1635 : ad f9 bf LDA $bff9 ; (sstack + 12)
01:1638 : 18 __ __ CLC
01:1639 : 69 ff __ ADC #$ff
01:163b : 8d f9 bf STA $bff9 ; (sstack + 12)
01:163e : b0 03 __ BCS $1643 ; (bnk_viewportscroll.s210 + 0)
.s1089:
01:1640 : ce fa bf DEC $bffa ; (sstack + 13)
.s210:
01:1643 : a5 4d __ LDA T6 + 0 
01:1645 : 8d f3 bf STA $bff3 ; (sstack + 6)
01:1648 : a5 4c __ LDA T4 + 0 
01:164a : 8d f4 bf STA $bff4 ; (sstack + 7)
01:164d : a5 4b __ LDA T5 + 0 
01:164f : 8d f5 bf STA $bff5 ; (sstack + 8)
01:1652 : ad f7 bf LDA $bff7 ; (sstack + 10)
01:1655 : 8d ef bf STA $bfef ; (sstack + 2)
01:1658 : ad f8 bf LDA $bff8 ; (sstack + 11)
01:165b : 8d f0 bf STA $bff0 ; (sstack + 3)
01:165e : ad f9 bf LDA $bff9 ; (sstack + 12)
01:1661 : 8d f1 bf STA $bff1 ; (sstack + 4)
01:1664 : ad fa bf LDA $bffa ; (sstack + 13)
01:1667 : 8d f2 bf STA $bff2 ; (sstack + 5)
01:166a : ad fe bf LDA $bffe ; (sstack + 17)
01:166d : 8d f6 bf STA $bff6 ; (sstack + 9)
01:1670 : 4c 31 13 JMP $1331 ; (bnk_cpy_viewporttovdc.s0 + 0)
.s223:
01:1673 : a5 4f __ LDA T8 + 0 
01:1675 : d0 2e __ BNE $16a5 ; (bnk_viewportscroll.s211 + 0)
.s224:
01:1677 : ad ff bf LDA $bfff ; (sstack + 18)
01:167a : c9 02 __ CMP #$02
01:167c : d0 c5 __ BNE $1643 ; (bnk_viewportscroll.s210 + 0)
.s213:
01:167e : 18 __ __ CLC
01:167f : a5 4b __ LDA T5 + 0 
01:1681 : 69 01 __ ADC #$01
01:1683 : 85 45 __ STA T1 + 0 
01:1685 : a9 00 __ LDA #$00
01:1687 : 2a __ __ ROL
01:1688 : aa __ __ TAX
01:1689 : ad f7 bf LDA $bff7 ; (sstack + 10)
01:168c : 65 45 __ ADC T1 + 0 
01:168e : 8d f7 bf STA $bff7 ; (sstack + 10)
01:1691 : 8a __ __ TXA
01:1692 : 6d f8 bf ADC $bff8 ; (sstack + 11)
01:1695 : 8d f8 bf STA $bff8 ; (sstack + 11)
01:1698 : 18 __ __ CLC
01:1699 : a5 4b __ LDA T5 + 0 
01:169b : 69 05 __ ADC #$05
01:169d : 85 4d __ STA T6 + 0 
.s1064:
01:169f : a9 01 __ LDA #$01
01:16a1 : 85 4b __ STA T5 + 0 
01:16a3 : d0 9e __ BNE $1643 ; (bnk_viewportscroll.s210 + 0)
.s211:
01:16a5 : ad f7 bf LDA $bff7 ; (sstack + 10)
01:16a8 : 18 __ __ CLC
01:16a9 : 69 ff __ ADC #$ff
01:16ab : 8d f7 bf STA $bff7 ; (sstack + 10)
01:16ae : b0 ef __ BCS $169f ; (bnk_viewportscroll.s1064 + 0)
.s1087:
01:16b0 : ce f8 bf DEC $bff8 ; (sstack + 11)
01:16b3 : 90 ea __ BCC $169f ; (bnk_viewportscroll.s1064 + 0)
.l120:
01:16b5 : a9 12 __ LDA #$12
01:16b7 : 8d 00 d6 STA $d600 
.l1030:
01:16ba : 2c 00 d6 BIT $d600 
01:16bd : 10 fb __ BPL $16ba ; (bnk_viewportscroll.l1030 + 0)
.s129:
01:16bf : 8e 01 d6 STX $d601 
01:16c2 : a9 13 __ LDA #$13
01:16c4 : 8d 00 d6 STA $d600 
.l1032:
01:16c7 : 2c 00 d6 BIT $d600 
01:16ca : 10 fb __ BPL $16c7 ; (bnk_viewportscroll.l1032 + 0)
.s134:
01:16cc : 8c 01 d6 STY $d601 
01:16cf : a9 1f __ LDA #$1f
01:16d1 : 8d 00 d6 STA $d600 
01:16d4 : a9 18 __ LDA #$18
01:16d6 : 8d 00 d6 STA $d600 
.l1034:
01:16d9 : 2c 00 d6 BIT $d600 
01:16dc : 10 fb __ BPL $16d9 ; (bnk_viewportscroll.l1034 + 0)
.s141:
01:16de : ad 01 d6 LDA $d601 
01:16e1 : 09 80 __ ORA #$80
01:16e3 : 85 52 __ STA T10 + 0 
01:16e5 : a9 18 __ LDA #$18
01:16e7 : 8d 00 d6 STA $d600 
.l1036:
01:16ea : 2c 00 d6 BIT $d600 
01:16ed : 10 fb __ BPL $16ea ; (bnk_viewportscroll.l1036 + 0)
.s147:
01:16ef : a5 52 __ LDA T10 + 0 
01:16f1 : 8d 01 d6 STA $d601 
01:16f4 : a9 20 __ LDA #$20
01:16f6 : 8d 00 d6 STA $d600 
.l1038:
01:16f9 : 2c 00 d6 BIT $d600 
01:16fc : 10 fb __ BPL $16f9 ; (bnk_viewportscroll.l1038 + 0)
.s152:
01:16fe : a5 51 __ LDA T9 + 1 
01:1700 : 8d 01 d6 STA $d601 
01:1703 : a9 21 __ LDA #$21
01:1705 : 8d 00 d6 STA $d600 
.l1040:
01:1708 : 2c 00 d6 BIT $d600 
01:170b : 10 fb __ BPL $1708 ; (bnk_viewportscroll.l1040 + 0)
.s157:
01:170d : a5 50 __ LDA T9 + 0 
01:170f : 8d 01 d6 STA $d601 
01:1712 : a9 1f __ LDA #$1f
01:1714 : 8d 00 d6 STA $d600 
01:1717 : a9 1e __ LDA #$1e
01:1719 : 8d 00 d6 STA $d600 
.l1042:
01:171c : 2c 00 d6 BIT $d600 
01:171f : 10 fb __ BPL $171c ; (bnk_viewportscroll.l1042 + 0)
.s163:
01:1721 : a5 4b __ LDA T5 + 0 
01:1723 : 8d 01 d6 STA $d601 
01:1726 : ad 75 44 LDA $4475 ; (vdc_state + 3)
01:1729 : 18 __ __ CLC
01:172a : 65 50 __ ADC T9 + 0 
01:172c : 85 50 __ STA T9 + 0 
01:172e : ad 76 44 LDA $4476 ; (vdc_state + 4)
01:1731 : 65 51 __ ADC T9 + 1 
01:1733 : 85 51 __ STA T9 + 1 
01:1735 : 98 __ __ TYA
01:1736 : 18 __ __ CLC
01:1737 : 6d 75 44 ADC $4475 ; (vdc_state + 3)
01:173a : a8 __ __ TAY
01:173b : 8a __ __ TXA
01:173c : 6d 76 44 ADC $4476 ; (vdc_state + 4)
01:173f : aa __ __ TAX
01:1740 : c6 4e __ DEC T7 + 0 
01:1742 : f0 03 __ BEQ $1747 ; (bnk_viewportscroll.s118 + 0)
01:1744 : 4c b5 16 JMP $16b5 ; (bnk_viewportscroll.l120 + 0)
.s118:
01:1747 : ad fe bf LDA $bffe ; (sstack + 17)
01:174a : d0 03 __ BNE $174f ; (bnk_viewportscroll.s234 + 0)
01:174c : 4c e5 15 JMP $15e5 ; (bnk_viewportscroll.s164 + 0)
.s234:
01:174f : 85 4e __ STA T7 + 0 
01:1751 : 18 __ __ CLC
01:1752 : a5 45 __ LDA T1 + 0 
01:1754 : 65 49 __ ADC T3 + 0 
01:1756 : a8 __ __ TAY
01:1757 : a5 46 __ LDA T1 + 1 
01:1759 : 65 4a __ ADC T3 + 1 
01:175b : aa __ __ TAX
01:175c : 18 __ __ CLC
01:175d : a5 47 __ LDA T2 + 0 
01:175f : 65 49 __ ADC T3 + 0 
01:1761 : 85 45 __ STA T1 + 0 
01:1763 : a5 48 __ LDA T2 + 1 
01:1765 : 65 4a __ ADC T3 + 1 
01:1767 : 85 46 __ STA T1 + 1 
.l166:
01:1769 : a9 12 __ LDA #$12
01:176b : 8d 00 d6 STA $d600 
.l1046:
01:176e : 2c 00 d6 BIT $d600 
01:1771 : 10 fb __ BPL $176e ; (bnk_viewportscroll.l1046 + 0)
.s175:
01:1773 : 8e 01 d6 STX $d601 
01:1776 : a9 13 __ LDA #$13
01:1778 : 8d 00 d6 STA $d600 
.l1048:
01:177b : 2c 00 d6 BIT $d600 
01:177e : 10 fb __ BPL $177b ; (bnk_viewportscroll.l1048 + 0)
.s180:
01:1780 : 8c 01 d6 STY $d601 
01:1783 : a9 1f __ LDA #$1f
01:1785 : 8d 00 d6 STA $d600 
01:1788 : a9 18 __ LDA #$18
01:178a : 8d 00 d6 STA $d600 
.l1050:
01:178d : 2c 00 d6 BIT $d600 
01:1790 : 10 fb __ BPL $178d ; (bnk_viewportscroll.l1050 + 0)
.s187:
01:1792 : ad 01 d6 LDA $d601 
01:1795 : 09 80 __ ORA #$80
01:1797 : 85 47 __ STA T2 + 0 
01:1799 : a9 18 __ LDA #$18
01:179b : 8d 00 d6 STA $d600 
.l1052:
01:179e : 2c 00 d6 BIT $d600 
01:17a1 : 10 fb __ BPL $179e ; (bnk_viewportscroll.l1052 + 0)
.s193:
01:17a3 : a5 47 __ LDA T2 + 0 
01:17a5 : 8d 01 d6 STA $d601 
01:17a8 : a9 20 __ LDA #$20
01:17aa : 8d 00 d6 STA $d600 
.l1054:
01:17ad : 2c 00 d6 BIT $d600 
01:17b0 : 10 fb __ BPL $17ad ; (bnk_viewportscroll.l1054 + 0)
.s198:
01:17b2 : a5 46 __ LDA T1 + 1 
01:17b4 : 8d 01 d6 STA $d601 
01:17b7 : a9 21 __ LDA #$21
01:17b9 : 8d 00 d6 STA $d600 
.l1056:
01:17bc : 2c 00 d6 BIT $d600 
01:17bf : 10 fb __ BPL $17bc ; (bnk_viewportscroll.l1056 + 0)
.s203:
01:17c1 : a5 45 __ LDA T1 + 0 
01:17c3 : 8d 01 d6 STA $d601 
01:17c6 : a9 1f __ LDA #$1f
01:17c8 : 8d 00 d6 STA $d600 
01:17cb : a9 1e __ LDA #$1e
01:17cd : 8d 00 d6 STA $d600 
.l1058:
01:17d0 : 2c 00 d6 BIT $d600 
01:17d3 : 10 fb __ BPL $17d0 ; (bnk_viewportscroll.l1058 + 0)
.s209:
01:17d5 : a5 4b __ LDA T5 + 0 
01:17d7 : 8d 01 d6 STA $d601 
01:17da : ad 75 44 LDA $4475 ; (vdc_state + 3)
01:17dd : 18 __ __ CLC
01:17de : 65 45 __ ADC T1 + 0 
01:17e0 : 85 45 __ STA T1 + 0 
01:17e2 : ad 76 44 LDA $4476 ; (vdc_state + 4)
01:17e5 : 65 46 __ ADC T1 + 1 
01:17e7 : 85 46 __ STA T1 + 1 
01:17e9 : 98 __ __ TYA
01:17ea : 18 __ __ CLC
01:17eb : 6d 75 44 ADC $4475 ; (vdc_state + 3)
01:17ee : a8 __ __ TAY
01:17ef : 8a __ __ TXA
01:17f0 : 6d 76 44 ADC $4476 ; (vdc_state + 4)
01:17f3 : aa __ __ TAX
01:17f4 : c6 4e __ DEC T7 + 0 
01:17f6 : f0 03 __ BEQ $17fb ; (bnk_viewportscroll.s209 + 38)
01:17f8 : 4c 69 17 JMP $1769 ; (bnk_viewportscroll.l166 + 0)
01:17fb : 4c e5 15 JMP $15e5 ; (bnk_viewportscroll.s164 + 0)
.s109:
01:17fe : e6 47 __ INC T2 + 0 
01:1800 : d0 02 __ BNE $1804 ; (bnk_viewportscroll.s1092 + 0)
.s1091:
01:1802 : e6 48 __ INC T2 + 1 
.s1092:
01:1804 : a9 45 __ LDA #$45
01:1806 : 85 4b __ STA T5 + 0 
01:1808 : 4c b6 15 JMP $15b6 ; (bnk_viewportscroll.s114 + 0)
.s1004:
01:180b : 85 4f __ STA T8 + 0 
01:180d : e6 45 __ INC T1 + 0 
01:180f : d0 02 __ BNE $1813 ; (bnk_viewportscroll.s1086 + 0)
.s1085:
01:1811 : e6 46 __ INC T1 + 1 
.s1086:
01:1813 : a9 45 __ LDA #$45
01:1815 : 85 4b __ STA T5 + 0 
01:1817 : 4c 9d 15 JMP $159d ; (bnk_viewportscroll.s111 + 0)
.l12:
01:181a : a9 12 __ LDA #$12
01:181c : 8d 00 d6 STA $d600 
.l997:
01:181f : 2c 00 d6 BIT $d600 
01:1822 : 10 fb __ BPL $181f ; (bnk_viewportscroll.l997 + 0)
.s21:
01:1824 : 8e 01 d6 STX $d601 
01:1827 : a9 13 __ LDA #$13
01:1829 : 8d 00 d6 STA $d600 
.l999:
01:182c : 2c 00 d6 BIT $d600 
01:182f : 10 fb __ BPL $182c ; (bnk_viewportscroll.l999 + 0)
.s26:
01:1831 : 8c 01 d6 STY $d601 
01:1834 : a9 1f __ LDA #$1f
01:1836 : 8d 00 d6 STA $d600 
01:1839 : a9 18 __ LDA #$18
01:183b : 8d 00 d6 STA $d600 
.l1001:
01:183e : 2c 00 d6 BIT $d600 
01:1841 : 10 fb __ BPL $183e ; (bnk_viewportscroll.l1001 + 0)
.s33:
01:1843 : ad 01 d6 LDA $d601 
01:1846 : 09 80 __ ORA #$80
01:1848 : 85 52 __ STA T10 + 0 
01:184a : a9 18 __ LDA #$18
01:184c : 8d 00 d6 STA $d600 
.l1003:
01:184f : 2c 00 d6 BIT $d600 
01:1852 : 10 fb __ BPL $184f ; (bnk_viewportscroll.l1003 + 0)
.s39:
01:1854 : a5 52 __ LDA T10 + 0 
01:1856 : 8d 01 d6 STA $d601 
01:1859 : a9 20 __ LDA #$20
01:185b : 8d 00 d6 STA $d600 
.l1005:
01:185e : 2c 00 d6 BIT $d600 
01:1861 : 10 fb __ BPL $185e ; (bnk_viewportscroll.l1005 + 0)
.s44:
01:1863 : a5 51 __ LDA T9 + 1 
01:1865 : 8d 01 d6 STA $d601 
01:1868 : a9 21 __ LDA #$21
01:186a : 8d 00 d6 STA $d600 
.l1007:
01:186d : 2c 00 d6 BIT $d600 
01:1870 : 10 fb __ BPL $186d ; (bnk_viewportscroll.l1007 + 0)
.s49:
01:1872 : a5 50 __ LDA T9 + 0 
01:1874 : 8d 01 d6 STA $d601 
01:1877 : a9 1f __ LDA #$1f
01:1879 : 8d 00 d6 STA $d600 
01:187c : a9 1e __ LDA #$1e
01:187e : 8d 00 d6 STA $d600 
.l1009:
01:1881 : 2c 00 d6 BIT $d600 
01:1884 : 10 fb __ BPL $1881 ; (bnk_viewportscroll.l1009 + 0)
.s55:
01:1886 : a9 46 __ LDA #$46
01:1888 : 8d 01 d6 STA $d601 
01:188b : ad 75 44 LDA $4475 ; (vdc_state + 3)
01:188e : 18 __ __ CLC
01:188f : 65 50 __ ADC T9 + 0 
01:1891 : 85 50 __ STA T9 + 0 
01:1893 : ad 76 44 LDA $4476 ; (vdc_state + 4)
01:1896 : 65 51 __ ADC T9 + 1 
01:1898 : 85 51 __ STA T9 + 1 
01:189a : 98 __ __ TYA
01:189b : 18 __ __ CLC
01:189c : 6d 75 44 ADC $4475 ; (vdc_state + 3)
01:189f : a8 __ __ TAY
01:18a0 : 8a __ __ TXA
01:18a1 : 6d 76 44 ADC $4476 ; (vdc_state + 4)
01:18a4 : aa __ __ TAX
01:18a5 : c6 4e __ DEC T7 + 0 
01:18a7 : f0 03 __ BEQ $18ac ; (bnk_viewportscroll.s10 + 0)
01:18a9 : 4c 1a 18 JMP $181a ; (bnk_viewportscroll.l12 + 0)
.s10:
01:18ac : ad fe bf LDA $bffe ; (sstack + 17)
01:18af : d0 03 __ BNE $18b4 ; (bnk_viewportscroll.s250 + 0)
01:18b1 : 4c 42 15 JMP $1542 ; (bnk_viewportscroll.s56 + 0)
.s250:
01:18b4 : 85 4e __ STA T7 + 0 
01:18b6 : 18 __ __ CLC
01:18b7 : a5 47 __ LDA T2 + 0 
01:18b9 : 65 49 __ ADC T3 + 0 
01:18bb : a8 __ __ TAY
01:18bc : a5 48 __ LDA T2 + 1 
01:18be : 65 4a __ ADC T3 + 1 
01:18c0 : aa __ __ TAX
01:18c1 : 18 __ __ CLC
01:18c2 : a5 43 __ LDA T0 + 0 
01:18c4 : 65 49 __ ADC T3 + 0 
01:18c6 : 85 43 __ STA T0 + 0 
01:18c8 : a5 44 __ LDA T0 + 1 
01:18ca : 65 4a __ ADC T3 + 1 
01:18cc : 85 44 __ STA T0 + 1 
.l58:
01:18ce : a9 12 __ LDA #$12
01:18d0 : 8d 00 d6 STA $d600 
.l1013:
01:18d3 : 2c 00 d6 BIT $d600 
01:18d6 : 10 fb __ BPL $18d3 ; (bnk_viewportscroll.l1013 + 0)
.s67:
01:18d8 : 8e 01 d6 STX $d601 
01:18db : a9 13 __ LDA #$13
01:18dd : 8d 00 d6 STA $d600 
.l1015:
01:18e0 : 2c 00 d6 BIT $d600 
01:18e3 : 10 fb __ BPL $18e0 ; (bnk_viewportscroll.l1015 + 0)
.s72:
01:18e5 : 8c 01 d6 STY $d601 
01:18e8 : a9 1f __ LDA #$1f
01:18ea : 8d 00 d6 STA $d600 
01:18ed : a9 18 __ LDA #$18
01:18ef : 8d 00 d6 STA $d600 
.l1017:
01:18f2 : 2c 00 d6 BIT $d600 
01:18f5 : 10 fb __ BPL $18f2 ; (bnk_viewportscroll.l1017 + 0)
.s79:
01:18f7 : ad 01 d6 LDA $d601 
01:18fa : 09 80 __ ORA #$80
01:18fc : 85 47 __ STA T2 + 0 
01:18fe : a9 18 __ LDA #$18
01:1900 : 8d 00 d6 STA $d600 
.l1019:
01:1903 : 2c 00 d6 BIT $d600 
01:1906 : 10 fb __ BPL $1903 ; (bnk_viewportscroll.l1019 + 0)
.s85:
01:1908 : a5 47 __ LDA T2 + 0 
01:190a : 8d 01 d6 STA $d601 
01:190d : a9 20 __ LDA #$20
01:190f : 8d 00 d6 STA $d600 
.l1021:
01:1912 : 2c 00 d6 BIT $d600 
01:1915 : 10 fb __ BPL $1912 ; (bnk_viewportscroll.l1021 + 0)
.s90:
01:1917 : a5 44 __ LDA T0 + 1 
01:1919 : 8d 01 d6 STA $d601 
01:191c : a9 21 __ LDA #$21
01:191e : 8d 00 d6 STA $d600 
.l1023:
01:1921 : 2c 00 d6 BIT $d600 
01:1924 : 10 fb __ BPL $1921 ; (bnk_viewportscroll.l1023 + 0)
.s95:
01:1926 : a5 43 __ LDA T0 + 0 
01:1928 : 8d 01 d6 STA $d601 
01:192b : a9 1f __ LDA #$1f
01:192d : 8d 00 d6 STA $d600 
01:1930 : a9 1e __ LDA #$1e
01:1932 : 8d 00 d6 STA $d600 
.l1025:
01:1935 : 2c 00 d6 BIT $d600 
01:1938 : 10 fb __ BPL $1935 ; (bnk_viewportscroll.l1025 + 0)
.s101:
01:193a : a9 46 __ LDA #$46
01:193c : 8d 01 d6 STA $d601 
01:193f : ad 75 44 LDA $4475 ; (vdc_state + 3)
01:1942 : 18 __ __ CLC
01:1943 : 65 43 __ ADC T0 + 0 
01:1945 : 85 43 __ STA T0 + 0 
01:1947 : ad 76 44 LDA $4476 ; (vdc_state + 4)
01:194a : 65 44 __ ADC T0 + 1 
01:194c : 85 44 __ STA T0 + 1 
01:194e : 98 __ __ TYA
01:194f : 18 __ __ CLC
01:1950 : 6d 75 44 ADC $4475 ; (vdc_state + 3)
01:1953 : a8 __ __ TAY
01:1954 : 8a __ __ TXA
01:1955 : 6d 76 44 ADC $4476 ; (vdc_state + 4)
01:1958 : aa __ __ TAX
01:1959 : c6 4e __ DEC T7 + 0 
01:195b : f0 03 __ BEQ $1960 ; (bnk_viewportscroll.s101 + 38)
01:195d : 4c ce 18 JMP $18ce ; (bnk_viewportscroll.l58 + 0)
01:1960 : 4c 42 15 JMP $1542 ; (bnk_viewportscroll.s56 + 0)
.s1001:
01:1963 : 60 __ __ RTS
