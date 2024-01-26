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
1c13 : 8e ff 4a STX $4aff ; (spentry + 0)
1c16 : a9 f6 __ LDA #$f6
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 58 __ LDA #$58
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 59 __ LDA #$59
1c21 : e9 58 __ SBC #$58
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
1c35 : a9 f0 __ LDA #$f0
1c37 : e9 f6 __ SBC #$f6
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
1c50 : a9 93 __ LDA #$93
1c52 : 85 23 __ STA SP + 0 
1c54 : a9 be __ LDA #$be
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
1c80 : a2 14 __ LDX #$14
1c82 : b5 53 __ LDA T0 + 0,x 
1c84 : 9d 95 be STA $be95,x ; (main@stack + 0)
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
1c97 : bd 58 57 LDA $5758,x ; (vdc_printc@proxy + 10)
1c9a : 9d 1a bf STA $bf1a,x ; (wrapbuffer + 80)
1c9d : ca __ __ DEX
1c9e : d0 f7 __ BNE $1c97 ; (main.l1002 + 0)
.s1003:
1ca0 : a9 7f __ LDA #$7f
1ca2 : 8d 0d dc STA $dc0d 
1ca5 : 8d 0d dd STA $dd0d 
1ca8 : 8d 00 dc STA $dc00 
1cab : a9 08 __ LDA #$08
1cad : 8d 0e dc STA $dc0e 
1cb0 : 8d 0f dc STA $dc0f 
1cb3 : 8d 0e dd STA $dd0e 
1cb6 : 8d 0f dd STA $dd0f 
1cb9 : 8e 03 dc STX $dc03 
1cbc : 8e 03 dd STX $dd03 
1cbf : a9 ff __ LDA #$ff
1cc1 : 8d 02 dc STA $dc02 
1cc4 : a9 07 __ LDA #$07
1cc6 : 8d 01 dd STA $dd01 
1cc9 : a9 3f __ LDA #$3f
1ccb : 8d 02 dd STA $dd02 
1cce : a9 1a __ LDA #$1a
1cd0 : 8d 00 d6 STA $d600 
.l10370:
1cd3 : 2c 00 d6 BIT $d600 
1cd6 : 10 fb __ BPL $1cd3 ; (main.l10370 + 0)
.s10:
1cd8 : ad 01 d6 LDA $d601 
1cdb : 29 f0 __ AND #$f0
1cdd : a8 __ __ TAY
1cde : a9 1a __ LDA #$1a
1ce0 : 8d 00 d6 STA $d600 
.l10372:
1ce3 : 2c 00 d6 BIT $d600 
1ce6 : 10 fb __ BPL $1ce3 ; (main.l10372 + 0)
.s16:
1ce8 : 8c 01 d6 STY $d601 
1ceb : 8d 00 d6 STA $d600 
.l10374:
1cee : 2c 00 d6 BIT $d600 
1cf1 : 10 fb __ BPL $1cee ; (main.l10374 + 0)
.s23:
1cf3 : ad 01 d6 LDA $d601 
1cf6 : 29 0f __ AND #$0f
1cf8 : 09 d0 __ ORA #$d0
1cfa : a8 __ __ TAY
1cfb : a9 1a __ LDA #$1a
1cfd : 8d 00 d6 STA $d600 
.l10376:
1d00 : 2c 00 d6 BIT $d600 
1d03 : 10 fb __ BPL $1d00 ; (main.l10376 + 0)
.s29:
1d05 : 8c 01 d6 STY $d601 
1d08 : a9 8d __ LDA #$8d
1d0a : 8d fd 58 STA $58fd ; (vdc_state + 7)
1d0d : a9 1c __ LDA #$1c
1d0f : 8d 00 d6 STA $d600 
.l10378:
1d12 : 2c 00 d6 BIT $d600 
1d15 : 10 fb __ BPL $1d12 ; (main.l10378 + 0)
.s35:
1d17 : ad 01 d6 LDA $d601 
1d1a : a8 __ __ TAY
1d1b : 09 10 __ ORA #$10
1d1d : 85 54 __ STA T1 + 0 
1d1f : a9 1c __ LDA #$1c
1d21 : 8d 00 d6 STA $d600 
.l10380:
1d24 : 2c 00 d6 BIT $d600 
1d27 : 10 fb __ BPL $1d24 ; (main.l10380 + 0)
.s42:
1d29 : a5 54 __ LDA T1 + 0 
1d2b : 8d 01 d6 STA $d601 
1d2e : a9 12 __ LDA #$12
1d30 : 8d 00 d6 STA $d600 
.l10382:
1d33 : 2c 00 d6 BIT $d600 
1d36 : 10 fb __ BPL $1d33 ; (main.l10382 + 0)
.s49:
1d38 : a9 1f __ LDA #$1f
1d3a : 8d 01 d6 STA $d601 
1d3d : a9 13 __ LDA #$13
1d3f : 8d 00 d6 STA $d600 
.l10384:
1d42 : 2c 00 d6 BIT $d600 
1d45 : 10 fb __ BPL $1d42 ; (main.l10384 + 0)
.s54:
1d47 : a9 ff __ LDA #$ff
1d49 : 8d 01 d6 STA $d601 
1d4c : a9 1f __ LDA #$1f
1d4e : 8d 00 d6 STA $d600 
.l10386:
1d51 : 2c 00 d6 BIT $d600 
1d54 : 10 fb __ BPL $1d51 ; (main.l10386 + 0)
.s58:
1d56 : 8e 01 d6 STX $d601 
1d59 : a9 12 __ LDA #$12
1d5b : 8d 00 d6 STA $d600 
.l10388:
1d5e : 2c 00 d6 BIT $d600 
1d61 : 10 fb __ BPL $1d5e ; (main.l10388 + 0)
.s65:
1d63 : a9 9f __ LDA #$9f
1d65 : 8d 01 d6 STA $d601 
1d68 : a9 13 __ LDA #$13
1d6a : 8d 00 d6 STA $d600 
.l10390:
1d6d : 2c 00 d6 BIT $d600 
1d70 : 10 fb __ BPL $1d6d ; (main.l10390 + 0)
.s70:
1d72 : a9 ff __ LDA #$ff
1d74 : 8d 01 d6 STA $d601 
1d77 : a9 1f __ LDA #$1f
1d79 : 8d 00 d6 STA $d600 
.l10392:
1d7c : 2c 00 d6 BIT $d600 
1d7f : 10 fb __ BPL $1d7c ; (main.l10392 + 0)
.s74:
1d81 : a9 ff __ LDA #$ff
1d83 : 8d 01 d6 STA $d601 
1d86 : a9 12 __ LDA #$12
1d88 : 8d 00 d6 STA $d600 
.l10394:
1d8b : 2c 00 d6 BIT $d600 
1d8e : 10 fb __ BPL $1d8b ; (main.l10394 + 0)
.s81:
1d90 : a9 1f __ LDA #$1f
1d92 : 8d 01 d6 STA $d601 
1d95 : a9 13 __ LDA #$13
1d97 : 8d 00 d6 STA $d600 
.l10396:
1d9a : 2c 00 d6 BIT $d600 
1d9d : 10 fb __ BPL $1d9a ; (main.l10396 + 0)
.s86:
1d9f : a9 ff __ LDA #$ff
1da1 : 8d 01 d6 STA $d601 
1da4 : a9 1f __ LDA #$1f
1da6 : 8d 00 d6 STA $d600 
.l10398:
1da9 : 2c 00 d6 BIT $d600 
1dac : 10 fb __ BPL $1da9 ; (main.l10398 + 0)
.s90:
1dae : ad 01 d6 LDA $d601 
1db1 : f0 04 __ BEQ $1db7 ; (main.s1663 + 0)
.s1664:
1db3 : a9 10 __ LDA #$10
1db5 : d0 02 __ BNE $1db9 ; (main.s1665 + 0)
.s1663:
1db7 : a9 40 __ LDA #$40
.s1665:
1db9 : 8d f6 58 STA $58f6 ; (vdc_state + 0)
1dbc : a9 1c __ LDA #$1c
1dbe : 8d 00 d6 STA $d600 
.l10401:
1dc1 : 2c 00 d6 BIT $d600 
1dc4 : 10 fb __ BPL $1dc1 ; (main.l10401 + 0)
.s97:
1dc6 : 86 53 __ STX T0 + 0 
1dc8 : 8c 01 d6 STY $d601 
1dcb : ad f9 58 LDA $58f9 ; (vdc_state + 3)
1dce : 85 54 __ STA T1 + 0 
1dd0 : ad fb 58 LDA $58fb ; (vdc_state + 5)
1dd3 : 85 57 __ STA T3 + 0 
.l100:
1dd5 : a5 53 __ LDA T0 + 0 
1dd7 : c5 57 __ CMP T3 + 0 
1dd9 : b0 03 __ BCS $1dde ; (main.s30 + 0)
1ddb : 4c 9e 3c JMP $3c9e ; (main.s101 + 0)
.s30:
1dde : 24 d7 __ BIT $d7 
1de0 : 30 17 __ BMI $1df9 ; (main.s10429 + 0)
.s178:
1de2 : a9 00 __ LDA #$00
1de4 : a0 02 __ LDY #$02
1de6 : 91 23 __ STA (SP + 0),y 
1de8 : a9 44 __ LDA #$44
1dea : c8 __ __ INY
1deb : 91 23 __ STA (SP + 0),y 
1ded : 20 79 3d JSR $3d79 ; (printf.s1000 + 0)
1df0 : 20 d6 43 JSR $43d6 ; (getch.s0 + 0)
1df3 : 20 e4 43 JSR $43e4 ; (clrscr.s0 + 0)
1df6 : 20 e8 43 JSR $43e8 ; (screen_setmode.s0 + 0)
.s10429:
1df9 : a5 ba __ LDA $ba 
1dfb : d0 02 __ BNE $1dff ; (main.s186 + 0)
.s184:
1dfd : a9 08 __ LDA #$08
.s186:
1dff : 85 53 __ STA T0 + 0 
1e01 : 85 f7 __ STA $f7 ; (bootdevice + 0)
1e03 : a9 f0 __ LDA #$f0
1e05 : a0 02 __ LDY #$02
1e07 : 91 23 __ STA (SP + 0),y 
1e09 : a9 43 __ LDA #$43
1e0b : c8 __ __ INY
1e0c : 91 23 __ STA (SP + 0),y 
1e0e : a5 53 __ LDA T0 + 0 
1e10 : c8 __ __ INY
1e11 : 91 23 __ STA (SP + 0),y 
1e13 : a9 00 __ LDA #$00
1e15 : c8 __ __ INY
1e16 : 91 23 __ STA (SP + 0),y 
1e18 : 20 79 3d JSR $3d79 ; (printf.s1000 + 0)
1e1b : a9 06 __ LDA #$06
1e1d : 8d 06 d5 STA $d506 
1e20 : a9 5c __ LDA #$5c
1e22 : a0 02 __ LDY #$02
1e24 : 91 23 __ STA (SP + 0),y 
1e26 : a9 44 __ LDA #$44
1e28 : c8 __ __ INY
1e29 : 91 23 __ STA (SP + 0),y 
1e2b : 20 79 3d JSR $3d79 ; (printf.s1000 + 0)
1e2e : a9 00 __ LDA #$00
1e30 : 85 0d __ STA P0 
1e32 : 85 0e __ STA P1 
1e34 : 20 81 44 JSR $4481 ; (krnio_setbnk.s0 + 0)
1e37 : a9 76 __ LDA #$76
1e39 : 85 0d __ STA P0 
1e3b : a9 44 __ LDA #$44
1e3d : 85 0e __ STA P1 
1e3f : 20 89 44 JSR $4489 ; (krnio_setnam.s0 + 0)
1e42 : a9 01 __ LDA #$01
1e44 : 85 0d __ STA P0 
1e46 : 85 0f __ STA P2 
1e48 : a5 53 __ LDA T0 + 0 
1e4a : 85 0e __ STA P1 
1e4c : 20 9f 44 JSR $449f ; (krnio_load.s0 + 0)
1e4f : 09 00 __ ORA #$00
1e51 : d0 11 __ BNE $1e64 ; (main.s193 + 0)
.s189:
1e53 : a9 bc __ LDA #$bc
1e55 : a0 02 __ LDY #$02
1e57 : 91 23 __ STA (SP + 0),y 
1e59 : a9 44 __ LDA #$44
1e5b : c8 __ __ INY
1e5c : 91 23 __ STA (SP + 0),y 
1e5e : 20 79 3d JSR $3d79 ; (printf.s1000 + 0)
1e61 : 20 da 44 JSR $44da ; (exit@proxy + 0)
.s193:
1e64 : a9 01 __ LDA #$01
1e66 : 8d 30 d0 STA $d030 
1e69 : a9 00 __ LDA #$00
1e6b : 85 13 __ STA P6 
1e6d : ad 11 d0 LDA $d011 
1e70 : 29 6f __ AND #$6f
1e72 : 8d 11 d0 STA $d011 
1e75 : 20 f7 44 JSR $44f7 ; (vdc_set_mode.s1000 + 0)
1e78 : ad f6 58 LDA $58f6 ; (vdc_state + 0)
1e7b : c9 40 __ CMP #$40
1e7d : f0 03 __ BEQ $1e82 ; (main.s199 + 0)
1e7f : 4c 99 1f JMP $1f99 ; (main.s3 + 0)
.s199:
1e82 : ad f7 58 LDA $58f7 ; (vdc_state + 1)
1e85 : f0 03 __ BEQ $1e8a ; (main.s203 + 0)
1e87 : 4c 99 1f JMP $1f99 ; (main.s3 + 0)
.s203:
1e8a : a9 22 __ LDA #$22
1e8c : 8d 00 d6 STA $d600 
.l10943:
1e8f : 2c 00 d6 BIT $d600 
1e92 : 10 fb __ BPL $1e8f ; (main.l10943 + 0)
.s211:
1e94 : a9 80 __ LDA #$80
1e96 : 8d 01 d6 STA $d601 
1e99 : a0 ff __ LDY #$ff
1e9b : a2 00 __ LDX #$00
.l214:
1e9d : a9 12 __ LDA #$12
1e9f : 8d 00 d6 STA $d600 
.l10945:
1ea2 : 2c 00 d6 BIT $d600 
1ea5 : 10 fb __ BPL $1ea2 ; (main.l10945 + 0)
.s223:
1ea7 : 8e 01 d6 STX $d601 
1eaa : a9 13 __ LDA #$13
1eac : 8d 00 d6 STA $d600 
.l10947:
1eaf : 2c 00 d6 BIT $d600 
1eb2 : 10 fb __ BPL $1eaf ; (main.l10947 + 0)
.s228:
1eb4 : a9 00 __ LDA #$00
1eb6 : 8d 01 d6 STA $d601 
1eb9 : a9 1f __ LDA #$1f
1ebb : 8d 00 d6 STA $d600 
.l10949:
1ebe : 2c 00 d6 BIT $d600 
1ec1 : 10 fb __ BPL $1ebe ; (main.l10949 + 0)
.s232:
1ec3 : a9 00 __ LDA #$00
1ec5 : 8d 01 d6 STA $d601 
1ec8 : a9 18 __ LDA #$18
1eca : 8d 00 d6 STA $d600 
.l10951:
1ecd : 2c 00 d6 BIT $d600 
1ed0 : 10 fb __ BPL $1ecd ; (main.l10951 + 0)
.s238:
1ed2 : ad 01 d6 LDA $d601 
1ed5 : 29 7f __ AND #$7f
1ed7 : 85 57 __ STA T3 + 0 
1ed9 : a9 18 __ LDA #$18
1edb : 8d 00 d6 STA $d600 
.l10953:
1ede : 2c 00 d6 BIT $d600 
1ee1 : 10 fb __ BPL $1ede ; (main.l10953 + 0)
.s244:
1ee3 : a5 57 __ LDA T3 + 0 
1ee5 : 8d 01 d6 STA $d601 
1ee8 : a9 1e __ LDA #$1e
1eea : 8d 00 d6 STA $d600 
.l10955:
1eed : 2c 00 d6 BIT $d600 
1ef0 : 10 fb __ BPL $1eed ; (main.l10955 + 0)
.s249:
1ef2 : a9 ff __ LDA #$ff
1ef4 : 8d 01 d6 STA $d601 
1ef7 : e8 __ __ INX
1ef8 : 88 __ __ DEY
1ef9 : d0 a2 __ BNE $1e9d ; (main.l214 + 0)
.s216:
1efb : a9 12 __ LDA #$12
1efd : 8d 00 d6 STA $d600 
.l10958:
1f00 : 2c 00 d6 BIT $d600 
1f03 : 10 fb __ BPL $1f00 ; (main.l10958 + 0)
.s256:
1f05 : 8e 01 d6 STX $d601 
1f08 : a9 13 __ LDA #$13
1f0a : 8d 00 d6 STA $d600 
.l10960:
1f0d : 2c 00 d6 BIT $d600 
1f10 : 10 fb __ BPL $1f0d ; (main.l10960 + 0)
.s261:
1f12 : 8c 01 d6 STY $d601 
1f15 : a9 1f __ LDA #$1f
1f17 : 8d 00 d6 STA $d600 
.l10962:
1f1a : 2c 00 d6 BIT $d600 
1f1d : 10 fb __ BPL $1f1a ; (main.l10962 + 0)
.s265:
1f1f : 8c 01 d6 STY $d601 
1f22 : a9 18 __ LDA #$18
1f24 : 8d 00 d6 STA $d600 
.l10964:
1f27 : 2c 00 d6 BIT $d600 
1f2a : 10 fb __ BPL $1f27 ; (main.l10964 + 0)
.s271:
1f2c : ad 01 d6 LDA $d601 
1f2f : 29 7f __ AND #$7f
1f31 : aa __ __ TAX
1f32 : a9 18 __ LDA #$18
1f34 : 8d 00 d6 STA $d600 
.l10966:
1f37 : 2c 00 d6 BIT $d600 
1f3a : 10 fb __ BPL $1f37 ; (main.l10966 + 0)
.s277:
1f3c : 8e 01 d6 STX $d601 
1f3f : a9 1e __ LDA #$1e
1f41 : 8d 00 d6 STA $d600 
.l10968:
1f44 : 2c 00 d6 BIT $d600 
1f47 : 10 fb __ BPL $1f44 ; (main.l10968 + 0)
.s282:
1f49 : a9 ff __ LDA #$ff
1f4b : 8d 01 d6 STA $d601 
1f4e : a9 1c __ LDA #$1c
1f50 : 8d 00 d6 STA $d600 
.l10970:
1f53 : 2c 00 d6 BIT $d600 
1f56 : 10 fb __ BPL $1f53 ; (main.l10970 + 0)
.s288:
1f58 : ad 01 d6 LDA $d601 
1f5b : 09 10 __ ORA #$10
1f5d : aa __ __ TAX
1f5e : a9 1c __ LDA #$1c
1f60 : 8d 00 d6 STA $d600 
.l10972:
1f63 : 2c 00 d6 BIT $d600 
1f66 : 10 fb __ BPL $1f63 ; (main.l10972 + 0)
.s294:
1f68 : 8e 01 d6 STX $d601 
1f6b : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
1f6e : a9 00 __ LDA #$00
1f70 : 85 53 __ STA T0 + 0 
1f72 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
1f75 : 85 54 __ STA T1 + 0 
1f77 : ad fb 58 LDA $58fb ; (vdc_state + 5)
1f7a : 85 57 __ STA T3 + 0 
.l298:
1f7c : a5 53 __ LDA T0 + 0 
1f7e : c5 57 __ CMP T3 + 0 
1f80 : b0 03 __ BCS $1f85 ; (main.s296 + 0)
1f82 : 4c c3 3b JMP $3bc3 ; (main.s299 + 0)
.s296:
1f85 : a9 22 __ LDA #$22
1f87 : 8d 00 d6 STA $d600 
.l10999:
1f8a : 2c 00 d6 BIT $d600 
1f8d : 10 fb __ BPL $1f8a ; (main.l10999 + 0)
.s376:
1f8f : a9 7d __ LDA #$7d
1f91 : 8d 01 d6 STA $d601 
1f94 : a9 01 __ LDA #$01
1f96 : 8d f7 58 STA $58f7 ; (vdc_state + 1)
.s3:
1f99 : a9 00 __ LDA #$00
1f9b : 85 0d __ STA P0 
1f9d : a9 00 __ LDA #$00
1f9f : 85 0e __ STA P1 
1fa1 : a9 4b __ LDA #$4b
1fa3 : 85 0f __ STA P2 
1fa5 : 20 d6 49 JSR $49d6 ; (vdc_prints.s0 + 0)
1fa8 : a9 9f __ LDA #$9f
1faa : a0 02 __ LDY #$02
1fac : 91 23 __ STA (SP + 0),y 
1fae : a9 59 __ LDA #$59
1fb0 : c8 __ __ INY
1fb1 : 91 23 __ STA (SP + 0),y 
1fb3 : a9 41 __ LDA #$41
1fb5 : c8 __ __ INY
1fb6 : 91 23 __ STA (SP + 0),y 
1fb8 : a9 4e __ LDA #$4e
1fba : c8 __ __ INY
1fbb : 91 23 __ STA (SP + 0),y 
1fbd : ad f6 58 LDA $58f6 ; (vdc_state + 0)
1fc0 : c8 __ __ INY
1fc1 : 91 23 __ STA (SP + 0),y 
1fc3 : a9 00 __ LDA #$00
1fc5 : c8 __ __ INY
1fc6 : 91 23 __ STA (SP + 0),y 
1fc8 : ad f7 58 LDA $58f7 ; (vdc_state + 1)
1fcb : d0 07 __ BNE $1fd4 ; (main.s5485 + 0)
.s5486:
1fcd : a9 4a __ LDA #$4a
1fcf : a2 fa __ LDX #$fa
1fd1 : 4c d8 1f JMP $1fd8 ; (main.s5487 + 0)
.s5485:
1fd4 : a9 4a __ LDA #$4a
1fd6 : a2 f7 __ LDX #$f7
.s5487:
1fd8 : 85 58 __ STA T3 + 1 
1fda : 8a __ __ TXA
1fdb : a0 08 __ LDY #$08
1fdd : 91 23 __ STA (SP + 0),y 
1fdf : a5 58 __ LDA T3 + 1 
1fe1 : c8 __ __ INY
1fe2 : 91 23 __ STA (SP + 0),y 
1fe4 : 20 1b 4b JSR $4b1b ; (sprintf.s1000 + 0)
1fe7 : 20 3f 57 JSR $573f ; (vdc_prints@proxy + 0)
1fea : a9 04 __ LDA #$04
1fec : 85 0d __ STA P0 
1fee : a9 76 __ LDA #$76
1ff0 : 85 0e __ STA P1 
1ff2 : a9 4e __ LDA #$4e
1ff4 : 85 0f __ STA P2 
1ff6 : 20 d6 49 JSR $49d6 ; (vdc_prints.s0 + 0)
1ff9 : e6 0d __ INC P0 
1ffb : a9 86 __ LDA #$86
1ffd : 85 0e __ STA P1 
1fff : a9 4e __ LDA #$4e
2001 : 85 0f __ STA P2 
2003 : 20 d6 49 JSR $49d6 ; (vdc_prints.s0 + 0)
2006 : a5 f7 __ LDA $f7 ; (bootdevice + 0)
2008 : 85 53 __ STA T0 + 0 
200a : 85 0f __ STA P2 
200c : a9 00 __ LDA #$00
200e : 85 10 __ STA P3 
2010 : a9 20 __ LDA #$20
2012 : 85 11 __ STA P4 
2014 : a9 a1 __ LDA #$a1
2016 : 85 12 __ STA P5 
2018 : a9 4e __ LDA #$4e
201a : 85 13 __ STA P6 
201c : 20 8a 13 JSR $138a ; (bnk_load.s0 + 0)
201f : a5 1b __ LDA ACCU + 0 
2021 : d0 0a __ BNE $202d ; (main.s379 + 0)
.s377:
2023 : a9 06 __ LDA #$06
2025 : 85 0d __ STA P0 
2027 : 20 ce 49 JSR $49ce ; (vdc_prints@proxy + 0)
202a : 20 da 44 JSR $44da ; (exit@proxy + 0)
.s379:
202d : a9 06 __ LDA #$06
202f : 85 0d __ STA P0 
2031 : a9 b5 __ LDA #$b5
2033 : 85 0e __ STA P1 
2035 : a9 4e __ LDA #$4e
2037 : 85 0f __ STA P2 
2039 : 20 d6 49 JSR $49d6 ; (vdc_prints.s0 + 0)
203c : a5 53 __ LDA T0 + 0 
203e : 85 0f __ STA P2 
2040 : a9 00 __ LDA #$00
2042 : 85 56 __ STA T2 + 0 
2044 : 85 10 __ STA P3 
2046 : a9 80 __ LDA #$80
2048 : 85 11 __ STA P4 
204a : a9 d2 __ LDA #$d2
204c : 85 12 __ STA P5 
204e : a9 4e __ LDA #$4e
2050 : 85 13 __ STA P6 
2052 : 20 8a 13 JSR $138a ; (bnk_load.s0 + 0)
2055 : a5 1b __ LDA ACCU + 0 
2057 : d0 0a __ BNE $2063 ; (main.s8034 + 0)
.s380:
2059 : a9 07 __ LDA #$07
205b : 85 0d __ STA P0 
205d : 20 ce 49 JSR $49ce ; (vdc_prints@proxy + 0)
2060 : 20 da 44 JSR $44da ; (exit@proxy + 0)
.s8034:
2063 : ad 1f bf LDA $bf1f ; (softscroll + 4)
2066 : 85 1b __ STA ACCU + 0 
2068 : a9 00 __ LDA #$00
206a : 85 1c __ STA ACCU + 1 
206c : ad 1e bf LDA $bf1e ; (softscroll + 3)
206f : 85 54 __ STA T1 + 0 
2071 : 20 b7 55 JSR $55b7 ; (mul16by8 + 0)
2074 : a5 05 __ LDA WORK + 2 
2076 : 85 57 __ STA T3 + 0 
2078 : 0a __ __ ASL
2079 : aa __ __ TAX
207a : a5 06 __ LDA WORK + 3 
207c : 85 58 __ STA T3 + 1 
207e : 2a __ __ ROL
207f : a8 __ __ TAY
2080 : 8a __ __ TXA
2081 : 18 __ __ CLC
2082 : 69 30 __ ADC #$30
2084 : 85 59 __ STA T4 + 0 
2086 : 90 01 __ BCC $2089 ; (main.s1667 + 0)
.s1666:
2088 : c8 __ __ INY
.s1667:
2089 : 84 5a __ STY T4 + 1 
208b : a9 20 __ LDA #$20
208d : c5 5a __ CMP T4 + 1 
208f : d0 04 __ BNE $2095 ; (main.s1008 + 0)
.s1007:
2091 : a9 00 __ LDA #$00
2093 : c5 59 __ CMP T4 + 0 
.s1008:
2095 : a9 00 __ LDA #$00
2097 : 2a __ __ ROL
2098 : 49 01 __ EOR #$01
209a : 85 53 __ STA T0 + 0 
209c : f0 08 __ BEQ $20a6 ; (main.l394 + 0)
.l395:
209e : ad f7 58 LDA $58f7 ; (vdc_state + 1)
20a1 : d0 03 __ BNE $20a6 ; (main.l394 + 0)
20a3 : 4c 8d 23 JMP $238d ; (main.s7782 + 0)
.l394:
20a6 : a9 e0 __ LDA #$e0
20a8 : c5 5a __ CMP T4 + 1 
20aa : d0 04 __ BNE $20b0 ; (main.s1533 + 0)
.s1532:
20ac : a9 00 __ LDA #$00
20ae : c5 59 __ CMP T4 + 0 
.s1533:
20b0 : b0 03 __ BCS $20b5 ; (main.s393 + 0)
20b2 : 4c 8d 23 JMP $238d ; (main.s7782 + 0)
.s393:
20b5 : a5 56 __ LDA T2 + 0 
20b7 : cd f8 58 CMP $58f8 ; (vdc_state + 2)
20ba : f0 05 __ BEQ $20c1 ; (main.s399 + 0)
.s397:
20bc : 85 13 __ STA P6 
20be : 20 f7 44 JSR $44f7 ; (vdc_set_mode.s1000 + 0)
.s399:
20c1 : a9 00 __ LDA #$00
20c3 : 8d fe 58 STA $58fe ; (vdc_state + 8)
20c6 : 8d 06 59 STA $5906 ; (vdc_state + 16)
20c9 : 8d 07 59 STA $5907 ; (vdc_state + 17)
20cc : 8d 08 59 STA $5908 ; (vdc_state + 18)
20cf : a9 20 __ LDA #$20
20d1 : 8d ff 58 STA $58ff ; (vdc_state + 9)
20d4 : a9 10 __ LDA #$10
20d6 : 8d 09 59 STA $5909 ; (vdc_state + 19)
20d9 : 18 __ __ CLC
20da : a5 58 __ LDA T3 + 1 
20dc : 69 20 __ ADC #$20
20de : 8d 01 59 STA $5901 ; (vdc_state + 11)
20e1 : a5 57 __ LDA T3 + 0 
20e3 : 8d 00 59 STA $5900 ; (vdc_state + 10)
20e6 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
20e9 : 85 5b __ STA T5 + 0 
20eb : 49 ff __ EOR #$ff
20ed : 38 __ __ SEC
20ee : 65 54 __ ADC T1 + 0 
20f0 : 8d 0e 59 STA $590e ; (vdc_state + 24)
20f3 : ad fc 58 LDA $58fc ; (vdc_state + 6)
20f6 : 85 60 __ STA T7 + 1 
20f8 : ad fb 58 LDA $58fb ; (vdc_state + 5)
20fb : 85 5f __ STA T7 + 0 
20fd : 05 60 __ ORA T7 + 1 
20ff : f0 4b __ BEQ $214c ; (main.s400 + 0)
.s2779:
2101 : ad 0e 59 LDA $590e ; (vdc_state + 24)
2104 : 18 __ __ CLC
2105 : 65 5b __ ADC T5 + 0 
2107 : 85 5d __ STA T6 + 0 
2109 : a9 00 __ LDA #$00
210b : 6d fa 58 ADC $58fa ; (vdc_state + 4)
210e : 85 5e __ STA T6 + 1 
2110 : a9 00 __ LDA #$00
2112 : 85 64 __ STA T11 + 0 
2114 : 85 65 __ STA T11 + 1 
2116 : a9 0f __ LDA #$0f
2118 : 85 66 __ STA T12 + 0 
211a : a9 59 __ LDA #$59
211c : 85 67 __ STA T12 + 1 
211e : a2 00 __ LDX #$00
.l402:
2120 : a5 64 __ LDA T11 + 0 
2122 : a0 00 __ LDY #$00
2124 : 91 66 __ STA (T12 + 0),y 
2126 : a5 65 __ LDA T11 + 1 
2128 : c8 __ __ INY
2129 : 91 66 __ STA (T12 + 0),y 
212b : 18 __ __ CLC
212c : a5 5d __ LDA T6 + 0 
212e : 65 64 __ ADC T11 + 0 
2130 : 85 64 __ STA T11 + 0 
2132 : a5 5e __ LDA T6 + 1 
2134 : 65 65 __ ADC T11 + 1 
2136 : 85 65 __ STA T11 + 1 
2138 : 18 __ __ CLC
2139 : a5 66 __ LDA T12 + 0 
213b : 69 02 __ ADC #$02
213d : 85 66 __ STA T12 + 0 
213f : 90 02 __ BCC $2143 ; (main.s1699 + 0)
.s1698:
2141 : e6 67 __ INC T12 + 1 
.s1699:
2143 : e8 __ __ INX
2144 : a5 60 __ LDA T7 + 1 
2146 : d0 d8 __ BNE $2120 ; (main.l402 + 0)
.s1528:
2148 : e4 5f __ CPX T7 + 0 
214a : 90 d4 __ BCC $2120 ; (main.l402 + 0)
.s400:
214c : 85 61 __ STA T8 + 0 
214e : c5 5f __ CMP T7 + 0 
2150 : b0 03 __ BCS $2155 ; (main.s405 + 0)
2152 : 4c df 3a JMP $3adf ; (main.l408 + 0)
.s405:
2155 : ad 06 59 LDA $5906 ; (vdc_state + 16)
2158 : 85 0d __ STA P0 
215a : ad 07 59 LDA $5907 ; (vdc_state + 17)
215d : 85 0e __ STA P1 
215f : a9 1c __ LDA #$1c
2161 : 8d 00 d6 STA $d600 
.l10812:
2164 : 2c 00 d6 BIT $d600 
2167 : 10 fb __ BPL $2164 ; (main.l10812 + 0)
.s486:
2169 : ad 01 d6 LDA $d601 
216c : 29 10 __ AND #$10
216e : 45 0e __ EOR P1 
2170 : 29 1f __ AND #$1f
2172 : 45 0e __ EOR P1 
2174 : aa __ __ TAX
2175 : a9 1c __ LDA #$1c
2177 : 8d 00 d6 STA $d600 
.l10814:
217a : 2c 00 d6 BIT $d600 
217d : 10 fb __ BPL $217a ; (main.l10814 + 0)
.s492:
217f : 8e 01 d6 STX $d601 
2182 : 20 0a 13 JSR $130a ; (bnk_redef_charset.s0 + 0)
2185 : ad fe 58 LDA $58fe ; (vdc_state + 8)
2188 : 85 0d __ STA P0 
218a : ad 00 59 LDA $5900 ; (vdc_state + 10)
218d : 85 5d __ STA T6 + 0 
218f : ad 01 59 LDA $5901 ; (vdc_state + 11)
2192 : 85 5e __ STA T6 + 1 
2194 : a9 0c __ LDA #$0c
2196 : 8d 00 d6 STA $d600 
2199 : ae ff 58 LDX $58ff ; (vdc_state + 9)
219c : 86 0e __ STX P1 
.l10816:
219e : 2c 00 d6 BIT $d600 
21a1 : 10 fb __ BPL $219e ; (main.l10816 + 0)
.s499:
21a3 : 8e 01 d6 STX $d601 
21a6 : a9 0d __ LDA #$0d
21a8 : 8d 00 d6 STA $d600 
.l10818:
21ab : 2c 00 d6 BIT $d600 
21ae : 10 fb __ BPL $21ab ; (main.l10818 + 0)
.s504:
21b0 : a5 0d __ LDA P0 
21b2 : 8d 01 d6 STA $d601 
21b5 : a9 14 __ LDA #$14
21b7 : 8d 00 d6 STA $d600 
.l10820:
21ba : 2c 00 d6 BIT $d600 
21bd : 10 fb __ BPL $21ba ; (main.l10820 + 0)
.s509:
21bf : a5 5e __ LDA T6 + 1 
21c1 : 8d 01 d6 STA $d601 
21c4 : a9 15 __ LDA #$15
21c6 : 8d 00 d6 STA $d600 
.l10822:
21c9 : 2c 00 d6 BIT $d600 
21cc : 10 fb __ BPL $21c9 ; (main.l10822 + 0)
.s514:
21ce : a5 5d __ LDA T6 + 0 
21d0 : 8d 01 d6 STA $d601 
21d3 : a9 1b __ LDA #$1b
21d5 : 8d 00 d6 STA $d600 
21d8 : ae 0e 59 LDX $590e ; (vdc_state + 24)
.l10824:
21db : 2c 00 d6 BIT $d600 
21de : 10 fb __ BPL $21db ; (main.l10824 + 0)
.s519:
21e0 : 8e 01 d6 STX $d601 
21e3 : a5 57 __ LDA T3 + 0 
21e5 : 85 12 __ STA P5 
21e7 : a5 58 __ LDA T3 + 1 
21e9 : 85 13 __ STA P6 
21eb : ad 1b bf LDA $bf1b ; (softscroll + 0)
21ee : 85 0f __ STA P2 
21f0 : ad 1c bf LDA $bf1c ; (softscroll + 1)
21f3 : 85 5b __ STA T5 + 0 
21f5 : 85 10 __ STA P3 
21f7 : ad 1d bf LDA $bf1d ; (softscroll + 2)
21fa : 85 5c __ STA T5 + 1 
21fc : 85 11 __ STA P4 
21fe : 20 d1 13 JSR $13d1 ; (bnk_cpytovdc.s0 + 0)
2201 : a5 5d __ LDA T6 + 0 
2203 : 85 0d __ STA P0 
2205 : a5 5e __ LDA T6 + 1 
2207 : 85 0e __ STA P1 
2209 : 18 __ __ CLC
220a : a5 5b __ LDA T5 + 0 
220c : 65 12 __ ADC P5 
220e : aa __ __ TAX
220f : a5 58 __ LDA T3 + 1 
2211 : 85 13 __ STA P6 
2213 : 65 5c __ ADC T5 + 1 
2215 : a8 __ __ TAY
2216 : 8a __ __ TXA
2217 : 18 __ __ CLC
2218 : 69 30 __ ADC #$30
221a : 85 10 __ STA P3 
221c : 90 01 __ BCC $221f ; (main.s1701 + 0)
.s1700:
221e : c8 __ __ INY
.s1701:
221f : 84 11 __ STY P4 
2221 : 20 d1 13 JSR $13d1 ; (bnk_cpytovdc.s0 + 0)
2224 : a9 00 __ LDA #$00
2226 : 8d 20 bf STA $bf20 ; (softscroll + 5)
2229 : 8d 21 bf STA $bf21 ; (softscroll + 6)
222c : 8d 22 bf STA $bf22 ; (softscroll + 7)
222f : 8d 23 bf STA $bf23 ; (softscroll + 8)
2232 : a9 18 __ LDA #$18
2234 : 8d 00 d6 STA $d600 
.l10826:
2237 : 2c 00 d6 BIT $d600 
223a : 10 fb __ BPL $2237 ; (main.l10826 + 0)
.s524:
223c : ad 01 d6 LDA $d601 
223f : 29 f0 __ AND #$f0
2241 : 8d 24 bf STA $bf24 ; (softscroll + 9)
2244 : a9 19 __ LDA #$19
2246 : 8d 00 d6 STA $d600 
.l10828:
2249 : 2c 00 d6 BIT $d600 
224c : 10 fb __ BPL $2249 ; (main.l10828 + 0)
.s531:
224e : ad 01 d6 LDA $d601 
2251 : 29 0f __ AND #$0f
2253 : 8d 2a bf STA $bf2a ; (softscroll + 15)
2256 : a9 19 __ LDA #$19
2258 : 8d 00 d6 STA $d600 
.l10830:
225b : 2c 00 d6 BIT $d600 
225e : 10 fb __ BPL $225b ; (main.l10830 + 0)
.s538:
2260 : a9 00 __ LDA #$00
2262 : 8d 26 bf STA $bf26 ; (softscroll + 11)
2265 : 8d 27 bf STA $bf27 ; (softscroll + 12)
2268 : 8d 28 bf STA $bf28 ; (softscroll + 13)
226b : 8d 29 bf STA $bf29 ; (softscroll + 14)
226e : ad 01 d6 LDA $d601 
2271 : 29 f0 __ AND #$f0
2273 : 8d 25 bf STA $bf25 ; (softscroll + 10)
.l542:
2276 : 20 d6 43 JSR $43d6 ; (getch.s0 + 0)
2279 : a5 1b __ LDA ACCU + 0 
227b : c9 57 __ CMP #$57
227d : f0 04 __ BEQ $2283 ; (main.s544 + 0)
.s547:
227f : c9 91 __ CMP #$91
2281 : d0 10 __ BNE $2293 ; (main.s546 + 0)
.s544:
2283 : ad 29 bf LDA $bf29 ; (softscroll + 14)
2286 : 85 5e __ STA T6 + 1 
2288 : ad 28 bf LDA $bf28 ; (softscroll + 13)
228b : aa __ __ TAX
228c : 05 5e __ ORA T6 + 1 
228e : f0 03 __ BEQ $2293 ; (main.s546 + 0)
2290 : 4c 16 3a JMP $3a16 ; (main.l548 + 0)
.s546:
2293 : a5 1b __ LDA ACCU + 0 
2295 : c9 53 __ CMP #$53
2297 : f0 04 __ BEQ $229d ; (main.s596 + 0)
.s599:
2299 : c9 11 __ CMP #$11
229b : d0 23 __ BNE $22c0 ; (main.s598 + 0)
.s596:
229d : ad 1f bf LDA $bf1f ; (softscroll + 4)
22a0 : 0a __ __ ASL
22a1 : 85 5d __ STA T6 + 0 
22a3 : a9 00 __ LDA #$00
22a5 : 2a __ __ ROL
22a6 : 06 5d __ ASL T6 + 0 
22a8 : 2a __ __ ROL
22a9 : 06 5d __ ASL T6 + 0 
22ab : 2a __ __ ROL
22ac : 85 5e __ STA T6 + 1 
22ae : ad 29 bf LDA $bf29 ; (softscroll + 14)
22b1 : a8 __ __ TAY
22b2 : ae 28 bf LDX $bf28 ; (softscroll + 13)
22b5 : c5 5e __ CMP T6 + 1 
22b7 : d0 02 __ BNE $22bb ; (main.s1459 + 0)
.s1458:
22b9 : e4 5d __ CPX T6 + 0 
.s1459:
22bb : b0 03 __ BCS $22c0 ; (main.s598 + 0)
22bd : 4c 63 39 JMP $3963 ; (main.l600 + 0)
.s598:
22c0 : a5 1b __ LDA ACCU + 0 
22c2 : c9 41 __ CMP #$41
22c4 : f0 04 __ BEQ $22ca ; (main.s645 + 0)
.s648:
22c6 : c9 9d __ CMP #$9d
22c8 : d0 39 __ BNE $2303 ; (main.s647 + 0)
.s645:
22ca : ad 26 bf LDA $bf26 ; (softscroll + 11)
22cd : 0d 27 bf ORA $bf27 ; (softscroll + 12)
22d0 : f0 31 __ BEQ $2303 ; (main.s647 + 0)
.s649:
22d2 : ad 26 bf LDA $bf26 ; (softscroll + 11)
22d5 : 38 __ __ SEC
22d6 : e9 02 __ SBC #$02
22d8 : 8d 26 bf STA $bf26 ; (softscroll + 11)
22db : b0 03 __ BCS $22e0 ; (main.s1703 + 0)
.s1702:
22dd : ce 27 bf DEC $bf27 ; (softscroll + 12)
.s1703:
22e0 : ad 23 bf LDA $bf23 ; (softscroll + 8)
22e3 : 18 __ __ CLC
22e4 : 69 02 __ ADC #$02
22e6 : 8d 23 bf STA $bf23 ; (softscroll + 8)
22e9 : c9 07 __ CMP #$07
22eb : 90 03 __ BCC $22f0 ; (main.s654 + 0)
22ed : 4c d3 38 JMP $38d3 ; (main.s653 + 0)
.s654:
22f0 : a9 19 __ LDA #$19
22f2 : 8d 00 d6 STA $d600 
22f5 : ad 25 bf LDA $bf25 ; (softscroll + 10)
22f8 : 6d 23 bf ADC $bf23 ; (softscroll + 8)
.l10923:
22fb : 2c 00 d6 BIT $d600 
22fe : 10 fb __ BPL $22fb ; (main.l10923 + 0)
.s1660:
2300 : 8d 01 d6 STA $d601 
.s647:
2303 : a5 1b __ LDA ACCU + 0 
2305 : c9 44 __ CMP #$44
2307 : f0 04 __ BEQ $230d ; (main.s697 + 0)
.s700:
2309 : c9 1d __ CMP #$1d
230b : d0 22 __ BNE $232f ; (main.s699 + 0)
.s697:
230d : ad 1e bf LDA $bf1e ; (softscroll + 3)
2310 : 0a __ __ ASL
2311 : 85 5d __ STA T6 + 0 
2313 : a9 00 __ LDA #$00
2315 : 2a __ __ ROL
2316 : 06 5d __ ASL T6 + 0 
2318 : 2a __ __ ROL
2319 : 06 5d __ ASL T6 + 0 
231b : 2a __ __ ROL
231c : 85 5e __ STA T6 + 1 
231e : ad 27 bf LDA $bf27 ; (softscroll + 12)
2321 : c5 5e __ CMP T6 + 1 
2323 : d0 05 __ BNE $232a ; (main.s1421 + 0)
.s1420:
2325 : ad 26 bf LDA $bf26 ; (softscroll + 11)
2328 : c5 5d __ CMP T6 + 0 
.s1421:
232a : b0 03 __ BCS $232f ; (main.s699 + 0)
232c : 4c 0e 38 JMP $380e ; (main.s701 + 0)
.s699:
232f : a5 1b __ LDA ACCU + 0 
2331 : c9 1b __ CMP #$1b
2333 : f0 07 __ BEQ $233c ; (main.s543 + 0)
.s748:
2335 : c9 03 __ CMP #$03
2337 : f0 03 __ BEQ $233c ; (main.s543 + 0)
2339 : 4c 76 22 JMP $2276 ; (main.l542 + 0)
.s543:
233c : a9 00 __ LDA #$00
233e : 85 61 __ STA T8 + 0 
2340 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
2343 : 85 5b __ STA T5 + 0 
2345 : ad fb 58 LDA $58fb ; (vdc_state + 5)
2348 : 85 5d __ STA T6 + 0 
.l752:
234a : a5 61 __ LDA T8 + 0 
234c : c5 5d __ CMP T6 + 0 
234e : b0 03 __ BCS $2353 ; (main.s750 + 0)
2350 : 4c 33 37 JMP $3733 ; (main.s753 + 0)
.s750:
2353 : a9 1b __ LDA #$1b
2355 : 8d 00 d6 STA $d600 
.l10901:
2358 : 2c 00 d6 BIT $d600 
235b : 10 fb __ BPL $2358 ; (main.l10901 + 0)
.s829:
235d : a9 00 __ LDA #$00
235f : 8d 01 d6 STA $d601 
2362 : a9 18 __ LDA #$18
2364 : 8d 00 d6 STA $d600 
2367 : ae 24 bf LDX $bf24 ; (softscroll + 9)
.l10903:
236a : 2c 00 d6 BIT $d600 
236d : 10 fb __ BPL $236a ; (main.l10903 + 0)
.s834:
236f : 8e 01 d6 STX $d601 
2372 : a9 19 __ LDA #$19
2374 : 8d 00 d6 STA $d600 
2377 : ad 2a bf LDA $bf2a ; (softscroll + 15)
237a : 18 __ __ CLC
237b : 6d 25 bf ADC $bf25 ; (softscroll + 10)
.l10905:
237e : 2c 00 d6 BIT $d600 
2381 : 10 fb __ BPL $237e ; (main.l10905 + 0)
.s839:
2383 : 8d 01 d6 STA $d601 
2386 : a5 56 __ LDA T2 + 0 
2388 : 85 13 __ STA P6 
238a : 20 f7 44 JSR $44f7 ; (vdc_set_mode.s1000 + 0)
.s7782:
238d : e6 56 __ INC T2 + 0 
238f : a5 56 __ LDA T2 + 0 
2391 : c9 03 __ CMP #$03
2393 : b0 0a __ BCS $239f ; (main.s386 + 0)
.s384:
2395 : a5 53 __ LDA T0 + 0 
2397 : d0 03 __ BNE $239c ; (main.s384 + 7)
2399 : 4c a6 20 JMP $20a6 ; (main.l394 + 0)
239c : 4c 9e 20 JMP $209e ; (main.l395 + 0)
.s386:
239f : a9 00 __ LDA #$00
23a1 : 85 53 __ STA T0 + 0 
.l841:
23a3 : 85 13 __ STA P6 
23a5 : 20 f7 44 JSR $44f7 ; (vdc_set_mode.s1000 + 0)
23a8 : ad fe 58 LDA $58fe ; (vdc_state + 8)
23ab : 85 57 __ STA T3 + 0 
23ad : ad ff 58 LDA $58ff ; (vdc_state + 9)
23b0 : 85 58 __ STA T3 + 1 
23b2 : a9 12 __ LDA #$12
23b4 : 8d 00 d6 STA $d600 
23b7 : ad 0f 59 LDA $590f ; (multab + 0)
23ba : 18 __ __ CLC
23bb : 65 57 __ ADC T3 + 0 
23bd : aa __ __ TAX
23be : ad 10 59 LDA $5910 ; (multab + 1)
23c1 : a8 __ __ TAY
23c2 : 65 58 __ ADC T3 + 1 
.l10438:
23c4 : 2c 00 d6 BIT $d600 
23c7 : 10 fb __ BPL $23c4 ; (main.l10438 + 0)
.s853:
23c9 : 8d 01 d6 STA $d601 
23cc : a9 13 __ LDA #$13
23ce : 8d 00 d6 STA $d600 
.l10440:
23d1 : 2c 00 d6 BIT $d600 
23d4 : 10 fb __ BPL $23d1 ; (main.l10440 + 0)
.s858:
23d6 : 8e 01 d6 STX $d601 
23d9 : a9 1f __ LDA #$1f
23db : 8d 00 d6 STA $d600 
.l10442:
23de : 2c 00 d6 BIT $d600 
23e1 : 10 fb __ BPL $23de ; (main.l10442 + 0)
.s862:
23e3 : a9 20 __ LDA #$20
23e5 : 8d 01 d6 STA $d601 
23e8 : a9 18 __ LDA #$18
23ea : 8d 00 d6 STA $d600 
.l10444:
23ed : 2c 00 d6 BIT $d600 
23f0 : 10 fb __ BPL $23ed ; (main.l10444 + 0)
.s868:
23f2 : ad 01 d6 LDA $d601 
23f5 : 29 7f __ AND #$7f
23f7 : aa __ __ TAX
23f8 : a9 18 __ LDA #$18
23fa : 8d 00 d6 STA $d600 
.l10446:
23fd : 2c 00 d6 BIT $d600 
2400 : 10 fb __ BPL $23fd ; (main.l10446 + 0)
.s874:
2402 : 8e 01 d6 STX $d601 
2405 : a9 1e __ LDA #$1e
2407 : 8d 00 d6 STA $d600 
.l10448:
240a : 2c 00 d6 BIT $d600 
240d : 10 fb __ BPL $240a ; (main.l10448 + 0)
.s879:
240f : a9 4e __ LDA #$4e
2411 : 8d 01 d6 STA $d601 
2414 : ad 01 59 LDA $5901 ; (vdc_state + 11)
2417 : 85 5a __ STA T4 + 1 
2419 : a9 12 __ LDA #$12
241b : 8d 00 d6 STA $d600 
241e : ad 00 59 LDA $5900 ; (vdc_state + 10)
2421 : 85 59 __ STA T4 + 0 
2423 : 18 __ __ CLC
2424 : 6d 0f 59 ADC $590f ; (multab + 0)
2427 : aa __ __ TAX
2428 : 98 __ __ TYA
2429 : 65 5a __ ADC T4 + 1 
.l10450:
242b : 2c 00 d6 BIT $d600 
242e : 10 fb __ BPL $242b ; (main.l10450 + 0)
.s886:
2430 : 8d 01 d6 STA $d601 
2433 : a9 13 __ LDA #$13
2435 : 8d 00 d6 STA $d600 
.l10452:
2438 : 2c 00 d6 BIT $d600 
243b : 10 fb __ BPL $2438 ; (main.l10452 + 0)
.s891:
243d : 8e 01 d6 STX $d601 
2440 : a9 1f __ LDA #$1f
2442 : 8d 00 d6 STA $d600 
.l10454:
2445 : 2c 00 d6 BIT $d600 
2448 : 10 fb __ BPL $2445 ; (main.l10454 + 0)
.s895:
244a : a9 c5 __ LDA #$c5
244c : 8d 01 d6 STA $d601 
244f : a9 18 __ LDA #$18
2451 : 8d 00 d6 STA $d600 
.l10456:
2454 : 2c 00 d6 BIT $d600 
2457 : 10 fb __ BPL $2454 ; (main.l10456 + 0)
.s901:
2459 : ad 01 d6 LDA $d601 
245c : 29 7f __ AND #$7f
245e : aa __ __ TAX
245f : a9 18 __ LDA #$18
2461 : 8d 00 d6 STA $d600 
.l10458:
2464 : 2c 00 d6 BIT $d600 
2467 : 10 fb __ BPL $2464 ; (main.l10458 + 0)
.s907:
2469 : 8e 01 d6 STX $d601 
246c : a9 1e __ LDA #$1e
246e : 8d 00 d6 STA $d600 
.l10460:
2471 : 2c 00 d6 BIT $d600 
2474 : 10 fb __ BPL $2471 ; (main.l10460 + 0)
.s912:
2476 : a9 4e __ LDA #$4e
2478 : 8d 01 d6 STA $d601 
247b : a9 00 __ LDA #$00
247d : 85 0d __ STA P0 
247f : ad fd 58 LDA $58fd ; (vdc_state + 7)
2482 : 29 f0 __ AND #$f0
2484 : 09 45 __ ORA #$45
2486 : 85 54 __ STA T1 + 0 
2488 : 8d fd 58 STA $58fd ; (vdc_state + 7)
248b : a9 da __ LDA #$da
248d : 85 0e __ STA P1 
248f : a9 4e __ LDA #$4e
2491 : 85 0f __ STA P2 
2493 : 20 d6 49 JSR $49d6 ; (vdc_prints.s0 + 0)
2496 : a5 54 __ LDA T1 + 0 
2498 : 29 b0 __ AND #$b0
249a : 09 0d __ ORA #$0d
249c : 8d fd 58 STA $58fd ; (vdc_state + 7)
249f : a9 9f __ LDA #$9f
24a1 : a0 02 __ LDY #$02
24a3 : 91 23 __ STA (SP + 0),y 
24a5 : a9 59 __ LDA #$59
24a7 : c8 __ __ INY
24a8 : 91 23 __ STA (SP + 0),y 
24aa : a9 00 __ LDA #$00
24ac : c8 __ __ INY
24ad : 91 23 __ STA (SP + 0),y 
24af : a9 4f __ LDA #$4f
24b1 : c8 __ __ INY
24b2 : 91 23 __ STA (SP + 0),y 
24b4 : ad f6 58 LDA $58f6 ; (vdc_state + 0)
24b7 : c8 __ __ INY
24b8 : 91 23 __ STA (SP + 0),y 
24ba : a9 00 __ LDA #$00
24bc : c8 __ __ INY
24bd : 91 23 __ STA (SP + 0),y 
24bf : ad f9 58 LDA $58f9 ; (vdc_state + 3)
24c2 : 85 5b __ STA T5 + 0 
24c4 : c8 __ __ INY
24c5 : 91 23 __ STA (SP + 0),y 
24c7 : ad fa 58 LDA $58fa ; (vdc_state + 4)
24ca : 85 5c __ STA T5 + 1 
24cc : c8 __ __ INY
24cd : 91 23 __ STA (SP + 0),y 
24cf : ad fb 58 LDA $58fb ; (vdc_state + 5)
24d2 : 85 5d __ STA T6 + 0 
24d4 : c8 __ __ INY
24d5 : 91 23 __ STA (SP + 0),y 
24d7 : ad fc 58 LDA $58fc ; (vdc_state + 6)
24da : 85 5e __ STA T6 + 1 
24dc : c8 __ __ INY
24dd : 91 23 __ STA (SP + 0),y 
24df : ad f7 58 LDA $58f7 ; (vdc_state + 1)
24e2 : d0 07 __ BNE $24eb ; (main.s5494 + 0)
.s5495:
24e4 : a9 4e __ LDA #$4e
24e6 : a2 ef __ LDX #$ef
24e8 : 4c ef 24 JMP $24ef ; (main.s5496 + 0)
.s5494:
24eb : a9 4e __ LDA #$4e
24ed : a2 eb __ LDX #$eb
.s5496:
24ef : 85 60 __ STA T7 + 1 
24f1 : 8a __ __ TXA
24f2 : a0 0c __ LDY #$0c
24f4 : 91 23 __ STA (SP + 0),y 
24f6 : a5 60 __ LDA T7 + 1 
24f8 : c8 __ __ INY
24f9 : 91 23 __ STA (SP + 0),y 
24fb : 20 1b 4b JSR $4b1b ; (sprintf.s1000 + 0)
24fe : 20 3f 57 JSR $573f ; (vdc_prints@proxy + 0)
2501 : e6 0d __ INC P0 
2503 : a9 3c __ LDA #$3c
2505 : 85 0e __ STA P1 
2507 : a9 4f __ LDA #$4f
2509 : 85 0f __ STA P2 
250b : 20 d6 49 JSR $49d6 ; (vdc_prints.s0 + 0)
250e : a6 5d __ LDX T6 + 0 
2510 : ca __ __ DEX
2511 : 86 0d __ STX P0 
2513 : a9 71 __ LDA #$71
2515 : 85 0e __ STA P1 
2517 : a9 4f __ LDA #$4f
2519 : 85 0f __ STA P2 
251b : 20 d6 49 JSR $49d6 ; (vdc_prints.s0 + 0)
251e : a9 05 __ LDA #$05
2520 : 85 0f __ STA P2 
2522 : 85 10 __ STA P3 
2524 : a9 46 __ LDA #$46
2526 : 85 11 __ STA P4 
2528 : a9 4b __ LDA #$4b
252a : 85 0d __ STA P0 
252c : a9 bf __ LDA #$bf
252e : 85 0e __ STA P1 
2530 : 38 __ __ SEC
2531 : a5 5d __ LDA T6 + 0 
2533 : e9 07 __ SBC #$07
2535 : 85 12 __ STA P5 
2537 : 20 c7 4f JSR $4fc7 ; (vdcwin_init.s0 + 0)
253a : ad 6a 57 LDA $576a ; (winStyles + 0)
253d : 85 56 __ STA T2 + 0 
253f : ad 4b bf LDA $bf4b ; (window + 0)
2542 : 85 61 __ STA T8 + 0 
2544 : d0 04 __ BNE $254a ; (main.s920 + 0)
.s918:
2546 : a9 b0 __ LDA #$b0
2548 : d0 02 __ BNE $254c ; (main.s925 + 0)
.s920:
254a : a9 f0 __ LDA #$f0
.s925:
254c : 85 62 __ STA T9 + 0 
254e : ad 4d bf LDA $bf4d ; (window + 2)
2551 : 85 5f __ STA T7 + 0 
2553 : 18 __ __ CLC
2554 : 65 61 __ ADC T8 + 0 
2556 : 85 64 __ STA T11 + 0 
2558 : a9 00 __ LDA #$00
255a : 2a __ __ ROL
255b : aa __ __ TAX
255c : a5 64 __ LDA T11 + 0 
255e : 69 01 __ ADC #$01
2560 : 85 66 __ STA T12 + 0 
2562 : 90 01 __ BCC $2565 ; (main.s1669 + 0)
.s1668:
2564 : e8 __ __ INX
.s1669:
2565 : 86 67 __ STX T12 + 1 
2567 : a5 5c __ LDA T5 + 1 
2569 : c5 67 __ CMP T12 + 1 
256b : d0 04 __ BNE $2571 ; (main.s1343 + 0)
.s1342:
256d : a5 5b __ LDA T5 + 0 
256f : c5 66 __ CMP T12 + 0 
.s1343:
2571 : b0 06 __ BCS $2579 ; (main.s929 + 0)
.s922:
2573 : a5 62 __ LDA T9 + 0 
2575 : 29 df __ AND #$df
2577 : 85 62 __ STA T9 + 0 
.s929:
2579 : ad 4c bf LDA $bf4c ; (window + 1)
257c : f0 03 __ BEQ $2581 ; (main.s10493 + 0)
257e : 4c 24 36 JMP $3624 ; (main.s926 + 0)
.s10493:
2581 : a5 62 __ LDA T9 + 0 
2583 : 29 10 __ AND #$10
2585 : f0 19 __ BEQ $25a0 ; (main.s2666 + 0)
.s1008:
2587 : ad 4e bf LDA $bf4e ; (window + 3)
258a : 18 __ __ CLC
258b : 6d 4c bf ADC $bf4c ; (window + 1)
258e : 85 66 __ STA T12 + 0 
2590 : a9 00 __ LDA #$00
2592 : 2a __ __ ROL
2593 : c5 5e __ CMP T6 + 1 
2595 : d0 04 __ BNE $259b ; (main.s1317 + 0)
.s1316:
2597 : a5 66 __ LDA T12 + 0 
2599 : c5 5d __ CMP T6 + 0 
.s1317:
259b : b0 03 __ BCS $25a0 ; (main.s2666 + 0)
259d : 4c 1e 35 JMP $351e ; (main.s1005 + 0)
.s2666:
25a0 : a9 00 __ LDA #$00
25a2 : 85 61 __ STA T8 + 0 
25a4 : cd 4e bf CMP $bf4e ; (window + 3)
25a7 : b0 03 __ BCS $25ac ; (main.s917 + 0)
25a9 : 4c ef 33 JMP $33ef ; (main.l1085 + 0)
.s917:
25ac : ad 08 dc LDA $dc08 
25af : 18 __ __ CLC
25b0 : 6d 09 dc ADC $dc09 
25b3 : a2 00 __ LDX #$00
25b5 : 90 01 __ BCC $25b8 ; (main.s1671 + 0)
.s1670:
25b7 : e8 __ __ INX
.s1671:
25b8 : 18 __ __ CLC
25b9 : 69 01 __ ADC #$01
25bb : 8d 7c 57 STA $577c ; (seed + 0)
25be : 90 01 __ BCC $25c1 ; (main.s1673 + 0)
.s1672:
25c0 : e8 __ __ INX
.s1673:
25c1 : 8e 7d 57 STX $577d ; (seed + 1)
25c4 : a9 c8 __ LDA #$c8
25c6 : 85 56 __ STA T2 + 0 
.l1165:
25c8 : a9 9f __ LDA #$9f
25ca : 85 16 __ STA P9 
25cc : a9 59 __ LDA #$59
25ce : 85 17 __ STA P10 
25d0 : ad 7d 57 LDA $577d ; (seed + 1)
25d3 : 4a __ __ LSR
25d4 : ad 7c 57 LDA $577c ; (seed + 0)
25d7 : 6a __ __ ROR
25d8 : aa __ __ TAX
25d9 : a9 00 __ LDA #$00
25db : 85 04 __ STA WORK + 1 
25dd : 6a __ __ ROR
25de : 4d 7c 57 EOR $577c ; (seed + 0)
25e1 : 85 59 __ STA T4 + 0 
25e3 : 8a __ __ TXA
25e4 : 4d 7d 57 EOR $577d ; (seed + 1)
25e7 : 85 5a __ STA T4 + 1 
25e9 : 4a __ __ LSR
25ea : 45 59 __ EOR T4 + 0 
25ec : 8d 7c 57 STA $577c ; (seed + 0)
25ef : 85 1b __ STA ACCU + 0 
25f1 : 45 5a __ EOR T4 + 1 
25f3 : 8d 7d 57 STA $577d ; (seed + 1)
25f6 : 85 1c __ STA ACCU + 1 
25f8 : ad fd 58 LDA $58fd ; (vdc_state + 7)
25fb : 29 f0 __ AND #$f0
25fd : 85 5b __ STA T5 + 0 
25ff : a9 0f __ LDA #$0f
2601 : 85 03 __ STA WORK + 0 
2603 : 20 19 56 JSR $5619 ; (divmod + 0)
2606 : a5 05 __ LDA WORK + 2 
2608 : 38 __ __ SEC
2609 : 65 5b __ ADC T5 + 0 
260b : 8d fd 58 STA $58fd ; (vdc_state + 7)
260e : 20 ae 50 JSR $50ae ; (generateSentence.s1000 + 0)
2611 : a9 00 __ LDA #$00
2613 : 85 61 __ STA T8 + 0 
2615 : 85 59 __ STA T4 + 0 
2617 : ad 9f 59 LDA $599f ; (linebuffer + 0)
261a : f0 0c __ BEQ $2628 ; (main.s1175 + 0)
.s1174:
261c : a2 00 __ LDX #$00
.l1654:
261e : bd a0 59 LDA $59a0,x ; (linebuffer + 1)
2621 : e8 __ __ INX
2622 : 09 00 __ ORA #$00
2624 : d0 f8 __ BNE $261e ; (main.l1654 + 0)
.s1655:
2626 : 86 59 __ STX T4 + 0 
.s1175:
2628 : a5 59 __ LDA T4 + 0 
262a : f0 2f __ BEQ $265b ; (main.s1171 + 0)
.s2663:
262c : a9 ff __ LDA #$ff
262e : 85 5c __ STA T5 + 1 
2630 : 85 5e __ STA T6 + 1 
2632 : a9 00 __ LDA #$00
2634 : 85 62 __ STA T9 + 0 
2636 : ad 4d bf LDA $bf4d ; (window + 2)
2639 : 85 63 __ STA T10 + 0 
.l1180:
263b : a5 61 __ LDA T8 + 0 
263d : c5 59 __ CMP T4 + 0 
263f : b0 0d __ BCS $264e ; (main.s1183 + 0)
.l1185:
2641 : 24 5e __ BIT T6 + 1 
2643 : 10 09 __ BPL $264e ; (main.s1183 + 0)
.s1184:
2645 : a5 62 __ LDA T9 + 0 
2647 : c9 50 __ CMP #$50
2649 : b0 03 __ BCS $264e ; (main.s1183 + 0)
264b : 4c cc 33 JMP $33cc ; (main.s1182 + 0)
.s1183:
264e : a6 62 __ LDX T9 + 0 
2650 : f0 03 __ BEQ $2655 ; (main.s1177 + 0)
2652 : 4c 66 33 JMP $3366 ; (main.s1195 + 0)
.s1177:
2655 : a5 61 __ LDA T8 + 0 
2657 : c5 59 __ CMP T4 + 0 
2659 : 90 e6 __ BCC $2641 ; (main.l1185 + 0)
.s1171:
265b : ad 4f bf LDA $bf4f ; (window + 4)
265e : f0 57 __ BEQ $26b7 ; (main.s7783 + 0)
.s1206:
2660 : 85 61 __ STA T8 + 0 
2662 : 18 __ __ CLC
2663 : 6d 4b bf ADC $bf4b ; (window + 0)
2666 : 85 0d __ STA P0 
2668 : ad 50 bf LDA $bf50 ; (window + 5)
266b : 85 62 __ STA T9 + 0 
266d : 18 __ __ CLC
266e : 6d 4c bf ADC $bf4c ; (window + 1)
2671 : 85 0e __ STA P1 
2673 : ad e8 57 LDA $57e8 ; (p2smap + 1)
2676 : 49 20 __ EOR #$20
2678 : 85 0f __ STA P2 
267a : 20 f3 4e JSR $4ef3 ; (vdc_printc@proxy + 0)
267d : a6 61 __ LDX T8 + 0 
267f : e8 __ __ INX
2680 : 8e 4f bf STX $bf4f ; (window + 4)
2683 : ec 4d bf CPX $bf4d ; (window + 2)
2686 : d0 2f __ BNE $26b7 ; (main.s7783 + 0)
.s1213:
2688 : a9 00 __ LDA #$00
268a : 8d 4f bf STA $bf4f ; (window + 4)
268d : 18 __ __ CLC
268e : a5 62 __ LDA T9 + 0 
2690 : 69 01 __ ADC #$01
2692 : 8d 50 bf STA $bf50 ; (window + 5)
2695 : cd 4e bf CMP $bf4e ; (window + 3)
2698 : d0 1d __ BNE $26b7 ; (main.s7783 + 0)
.s1216:
269a : a5 62 __ LDA T9 + 0 
269c : 8d 50 bf STA $bf50 ; (window + 5)
269f : a9 4b __ LDA #$4b
26a1 : a0 02 __ LDY #$02
26a3 : 91 23 __ STA (SP + 0),y 
26a5 : a9 bf __ LDA #$bf
26a7 : c8 __ __ INY
26a8 : 91 23 __ STA (SP + 0),y 
26aa : a9 fe __ LDA #$fe
26ac : c8 __ __ INY
26ad : 91 23 __ STA (SP + 0),y 
26af : a9 4a __ LDA #$4a
26b1 : c8 __ __ INY
26b2 : 91 23 __ STA (SP + 0),y 
26b4 : 20 18 52 JSR $5218 ; (vdcwin_printline.s1000 + 0)
.s7783:
26b7 : c6 56 __ DEC T2 + 0 
26b9 : f0 03 __ BEQ $26be ; (main.s1167 + 0)
26bb : 4c c8 25 JMP $25c8 ; (main.l1165 + 0)
.s1167:
26be : 20 d6 43 JSR $43d6 ; (getch.s0 + 0)
26c1 : a9 7f __ LDA #$7f
26c3 : 8d 2b bf STA $bf2b ; (viewport + 0)
26c6 : a9 50 __ LDA #$50
26c8 : 8d 2e bf STA $bf2e ; (viewport + 3)
26cb : a9 00 __ LDA #$00
26cd : 8d 2c bf STA $bf2c ; (viewport + 1)
26d0 : 8d 2f bf STA $bf2f ; (viewport + 4)
26d3 : 8d 31 bf STA $bf31 ; (viewport + 6)
26d6 : 8d 32 bf STA $bf32 ; (viewport + 7)
26d9 : 8d 33 bf STA $bf33 ; (viewport + 8)
26dc : 8d 34 bf STA $bf34 ; (viewport + 9)
26df : 8d 35 bf STA $bf35 ; (viewport + 10)
26e2 : a9 96 __ LDA #$96
26e4 : 8d 30 bf STA $bf30 ; (viewport + 5)
26e7 : a9 05 __ LDA #$05
26e9 : 85 0f __ STA P2 
26eb : 85 10 __ STA P3 
26ed : a9 46 __ LDA #$46
26ef : 85 11 __ STA P4 
26f1 : a9 20 __ LDA #$20
26f3 : 8d 2d bf STA $bf2d ; (viewport + 2)
26f6 : a9 36 __ LDA #$36
26f8 : 85 0d __ STA P0 
26fa : a9 bf __ LDA #$bf
26fc : 85 0e __ STA P1 
26fe : ad fb 58 LDA $58fb ; (vdc_state + 5)
2701 : 38 __ __ SEC
2702 : e9 07 __ SBC #$07
2704 : 85 12 __ STA P5 
2706 : 20 c7 4f JSR $4fc7 ; (vdcwin_init.s0 + 0)
2709 : ad 34 bf LDA $bf34 ; (viewport + 9)
270c : 85 1b __ STA ACCU + 0 
270e : ad 35 bf LDA $bf35 ; (viewport + 10)
2711 : 85 1c __ STA ACCU + 1 
2713 : ad 2e bf LDA $bf2e ; (viewport + 3)
2716 : 85 03 __ STA WORK + 0 
2718 : ad 2f bf LDA $bf2f ; (viewport + 4)
271b : 85 04 __ STA WORK + 1 
271d : 20 d7 55 JSR $55d7 ; (mul16 + 0)
2720 : ad 2c bf LDA $bf2c ; (viewport + 1)
2723 : 18 __ __ CLC
2724 : 65 05 __ ADC WORK + 2 
2726 : a8 __ __ TAY
2727 : ad 2d bf LDA $bf2d ; (viewport + 2)
272a : 65 06 __ ADC WORK + 3 
272c : aa __ __ TAX
272d : 98 __ __ TYA
272e : 18 __ __ CLC
272f : 6d 32 bf ADC $bf32 ; (viewport + 7)
2732 : 85 54 __ STA T1 + 0 
2734 : 8a __ __ TXA
2735 : 6d 33 bf ADC $bf33 ; (viewport + 8)
2738 : ac 3d bf LDY $bf3d ; (viewport + 18)
273b : ae 3c bf LDX $bf3c ; (viewport + 17)
273e : 4c 64 27 JMP $2764 ; (main.l1221 + 0)
.s1222:
2741 : 86 0d __ STX P0 
2743 : 84 0e __ STY P1 
2745 : 20 bb 13 JSR $13bb ; (bnk_cpytovdc@proxy + 0)
2748 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
274b : 18 __ __ CLC
274c : 65 0d __ ADC P0 
274e : aa __ __ TAX
274f : ad fa 58 LDA $58fa ; (vdc_state + 4)
2752 : 65 0e __ ADC P1 
2754 : a8 __ __ TAY
2755 : 18 __ __ CLC
2756 : a5 54 __ LDA T1 + 0 
2758 : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
275b : 85 54 __ STA T1 + 0 
275d : a5 55 __ LDA T1 + 1 
275f : 6d fa 58 ADC $58fa ; (vdc_state + 4)
2762 : e6 56 __ INC T2 + 0 
.l1221:
2764 : 85 55 __ STA T1 + 1 
2766 : a5 56 __ LDA T2 + 0 
2768 : cd 39 bf CMP $bf39 ; (viewport + 14)
276b : 90 d4 __ BCC $2741 ; (main.s1222 + 0)
.s1224:
276d : ad 2e bf LDA $bf2e ; (viewport + 3)
2770 : 85 03 __ STA WORK + 0 
2772 : ad 2f bf LDA $bf2f ; (viewport + 4)
2775 : 85 04 __ STA WORK + 1 
2777 : ad 34 bf LDA $bf34 ; (viewport + 9)
277a : 85 1b __ STA ACCU + 0 
277c : ad 35 bf LDA $bf35 ; (viewport + 10)
277f : 85 1c __ STA ACCU + 1 
2781 : 20 d7 55 JSR $55d7 ; (mul16 + 0)
2784 : ad 2c bf LDA $bf2c ; (viewport + 1)
2787 : 18 __ __ CLC
2788 : 65 05 __ ADC WORK + 2 
278a : a8 __ __ TAY
278b : ad 2d bf LDA $bf2d ; (viewport + 2)
278e : 65 06 __ ADC WORK + 3 
2790 : aa __ __ TAX
2791 : 98 __ __ TYA
2792 : 18 __ __ CLC
2793 : 6d 32 bf ADC $bf32 ; (viewport + 7)
2796 : 85 57 __ STA T3 + 0 
2798 : 8a __ __ TXA
2799 : 6d 33 bf ADC $bf33 ; (viewport + 8)
279c : 85 58 __ STA T3 + 1 
279e : ad 30 bf LDA $bf30 ; (viewport + 5)
27a1 : 85 1b __ STA ACCU + 0 
27a3 : ad 31 bf LDA $bf31 ; (viewport + 6)
27a6 : 85 1c __ STA ACCU + 1 
27a8 : ad 2e bf LDA $bf2e ; (viewport + 3)
27ab : 85 03 __ STA WORK + 0 
27ad : ad 2f bf LDA $bf2f ; (viewport + 4)
27b0 : 85 04 __ STA WORK + 1 
27b2 : 20 d7 55 JSR $55d7 ; (mul16 + 0)
27b5 : 18 __ __ CLC
27b6 : a5 57 __ LDA T3 + 0 
27b8 : 65 05 __ ADC WORK + 2 
27ba : aa __ __ TAX
27bb : a5 58 __ LDA T3 + 1 
27bd : 65 06 __ ADC WORK + 3 
27bf : a8 __ __ TAY
27c0 : 8a __ __ TXA
27c1 : 18 __ __ CLC
27c2 : 69 30 __ ADC #$30
27c4 : 85 54 __ STA T1 + 0 
27c6 : 90 01 __ BCC $27c9 ; (main.s1675 + 0)
.s1674:
27c8 : c8 __ __ INY
.s1675:
27c9 : 84 55 __ STY T1 + 1 
27cb : a9 00 __ LDA #$00
27cd : 85 56 __ STA T2 + 0 
27cf : ac 3f bf LDY $bf3f ; (viewport + 20)
27d2 : ae 3e bf LDX $bf3e ; (viewport + 19)
27d5 : 4c ff 27 JMP $27ff ; (main.l1225 + 0)
.s1226:
27d8 : 86 0d __ STX P0 
27da : 84 0e __ STY P1 
27dc : 20 bb 13 JSR $13bb ; (bnk_cpytovdc@proxy + 0)
27df : ad f9 58 LDA $58f9 ; (vdc_state + 3)
27e2 : 18 __ __ CLC
27e3 : 65 0d __ ADC P0 
27e5 : aa __ __ TAX
27e6 : ad fa 58 LDA $58fa ; (vdc_state + 4)
27e9 : 65 0e __ ADC P1 
27eb : a8 __ __ TAY
27ec : 18 __ __ CLC
27ed : a5 54 __ LDA T1 + 0 
27ef : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
27f2 : 85 54 __ STA T1 + 0 
27f4 : a5 55 __ LDA T1 + 1 
27f6 : 6d fa 58 ADC $58fa ; (vdc_state + 4)
27f9 : 85 55 __ STA T1 + 1 
27fb : e6 56 __ INC T2 + 0 
27fd : a5 56 __ LDA T2 + 0 
.l1225:
27ff : cd 39 bf CMP $bf39 ; (viewport + 14)
2802 : 90 d4 __ BCC $27d8 ; (main.s1226 + 0)
.l1229:
2804 : 20 d6 43 JSR $43d6 ; (getch.s0 + 0)
2807 : a9 00 __ LDA #$00
2809 : 85 56 __ STA T2 + 0 
280b : a5 1b __ LDA ACCU + 0 
280d : 85 54 __ STA T1 + 0 
280f : c9 57 __ CMP #$57
2811 : f0 04 __ BEQ $2817 ; (main.s1234 + 0)
.s1235:
2813 : c9 91 __ CMP #$91
2815 : d0 11 __ BNE $2828 ; (main.s1233 + 0)
.s1234:
2817 : ad 34 bf LDA $bf34 ; (viewport + 9)
281a : 0d 35 bf ORA $bf35 ; (viewport + 10)
281d : f0 09 __ BEQ $2828 ; (main.s1233 + 0)
.s1231:
281f : a9 08 __ LDA #$08
2821 : 85 56 __ STA T2 + 0 
2823 : a5 1b __ LDA ACCU + 0 
2825 : 4c 2e 28 JMP $282e ; (main.s1240 + 0)
.s1233:
2828 : a5 1b __ LDA ACCU + 0 
282a : c9 53 __ CMP #$53
282c : f0 04 __ BEQ $2832 ; (main.s1239 + 0)
.s1240:
282e : c9 11 __ CMP #$11
2830 : d0 2c __ BNE $285e ; (main.s1238 + 0)
.s1239:
2832 : 38 __ __ SEC
2833 : a9 96 __ LDA #$96
2835 : ed fb 58 SBC $58fb ; (vdc_state + 5)
2838 : aa __ __ TAX
2839 : a9 00 __ LDA #$00
283b : ed fc 58 SBC $58fc ; (vdc_state + 6)
283e : a8 __ __ TAY
283f : 8a __ __ TXA
2840 : 18 __ __ CLC
2841 : 69 06 __ ADC #$06
2843 : 85 57 __ STA T3 + 0 
2845 : 90 01 __ BCC $2848 ; (main.s1677 + 0)
.s1676:
2847 : c8 __ __ INY
.s1677:
2848 : 84 58 __ STY T3 + 1 
284a : ad 35 bf LDA $bf35 ; (viewport + 10)
284d : c5 58 __ CMP T3 + 1 
284f : d0 05 __ BNE $2856 ; (main.s1237 + 0)
.s1236:
2851 : ad 34 bf LDA $bf34 ; (viewport + 9)
2854 : c5 57 __ CMP T3 + 0 
.s1237:
2856 : b0 06 __ BCS $285e ; (main.s1238 + 0)
.s1236:
2858 : a5 56 __ LDA T2 + 0 
285a : 09 04 __ ORA #$04
285c : 85 56 __ STA T2 + 0 
.s1238:
285e : a5 1b __ LDA ACCU + 0 
2860 : c9 41 __ CMP #$41
2862 : f0 04 __ BEQ $2868 ; (main.s1244 + 0)
.s1245:
2864 : c9 9d __ CMP #$9d
2866 : d0 0e __ BNE $2876 ; (main.s1243 + 0)
.s1244:
2868 : ad 32 bf LDA $bf32 ; (viewport + 7)
286b : 0d 33 bf ORA $bf33 ; (viewport + 8)
286e : f0 06 __ BEQ $2876 ; (main.s1243 + 0)
.s1241:
2870 : a5 56 __ LDA T2 + 0 
2872 : 09 01 __ ORA #$01
2874 : 85 56 __ STA T2 + 0 
.s1243:
2876 : a5 1b __ LDA ACCU + 0 
2878 : c9 44 __ CMP #$44
287a : f0 04 __ BEQ $2880 ; (main.s1249 + 0)
.s1250:
287c : c9 1d __ CMP #$1d
287e : d0 15 __ BNE $2895 ; (main.s1248 + 0)
.s1249:
2880 : ad 33 bf LDA $bf33 ; (viewport + 8)
2883 : d0 10 __ BNE $2895 ; (main.s1248 + 0)
.s1227:
2885 : ad 32 bf LDA $bf32 ; (viewport + 7)
2888 : c9 09 __ CMP #$09
288a : b0 09 __ BCS $2895 ; (main.s1248 + 0)
.s1246:
288c : a5 56 __ LDA T2 + 0 
288e : 09 02 __ ORA #$02
2890 : 85 56 __ STA T2 + 0 
2892 : 4c d8 29 JMP $29d8 ; (main.s1251 + 0)
.s1248:
2895 : a5 56 __ LDA T2 + 0 
2897 : f0 03 __ BEQ $289c ; (main.s1253 + 0)
2899 : 4c d8 29 JMP $29d8 ; (main.s1251 + 0)
.s1253:
289c : a5 54 __ LDA T1 + 0 
289e : c9 1b __ CMP #$1b
28a0 : f0 07 __ BEQ $28a9 ; (main.s842 + 0)
.s2352:
28a2 : c9 03 __ CMP #$03
28a4 : f0 03 __ BEQ $28a9 ; (main.s842 + 0)
28a6 : 4c 04 28 JMP $2804 ; (main.l1229 + 0)
.s842:
28a9 : e6 53 __ INC T0 + 0 
28ab : a5 53 __ LDA T0 + 0 
28ad : c9 03 __ CMP #$03
28af : b0 03 __ BCS $28b4 ; (main.s843 + 0)
28b1 : 4c a3 23 JMP $23a3 ; (main.l841 + 0)
.s843:
28b4 : a9 00 __ LDA #$00
28b6 : 8d 30 d0 STA $d030 
28b9 : 85 13 __ STA P6 
28bb : ad 11 d0 LDA $d011 
28be : 29 7f __ AND #$7f
28c0 : 09 10 __ ORA #$10
28c2 : 8d 11 d0 STA $d011 
28c5 : 20 f7 44 JSR $44f7 ; (vdc_set_mode.s1000 + 0)
28c8 : a9 00 __ LDA #$00
28ca : 85 53 __ STA T0 + 0 
28cc : ad f9 58 LDA $58f9 ; (vdc_state + 3)
28cf : 85 54 __ STA T1 + 0 
28d1 : ad fb 58 LDA $58fb ; (vdc_state + 5)
28d4 : 85 57 __ STA T3 + 0 
.l2360:
28d6 : a5 53 __ LDA T0 + 0 
28d8 : c5 57 __ CMP T3 + 0 
28da : 90 21 __ BCC $28fd ; (main.s2361 + 0)
.s2358:
28dc : a9 04 __ LDA #$04
28de : 8d 06 d5 STA $d506 
28e1 : a9 00 __ LDA #$00
28e3 : 85 1b __ STA ACCU + 0 
28e5 : 85 1c __ STA ACCU + 1 
.s1001:
28e7 : 18 __ __ CLC
28e8 : a5 23 __ LDA SP + 0 
28ea : 69 0e __ ADC #$0e
28ec : 85 23 __ STA SP + 0 
28ee : 90 02 __ BCC $28f2 ; (main.s1001 + 11)
28f0 : e6 24 __ INC SP + 1 
28f2 : a2 14 __ LDX #$14
28f4 : bd 95 be LDA $be95,x ; (main@stack + 0)
28f7 : 95 53 __ STA T0 + 0,x 
28f9 : ca __ __ DEX
28fa : 10 f8 __ BPL $28f4 ; (main.s1001 + 13)
28fc : 60 __ __ RTS
.s2361:
28fd : 0a __ __ ASL
28fe : aa __ __ TAX
28ff : ad fd 58 LDA $58fd ; (vdc_state + 7)
2902 : 85 56 __ STA T2 + 0 
2904 : a9 12 __ LDA #$12
2906 : 8d 00 d6 STA $d600 
2909 : a5 54 __ LDA T1 + 0 
290b : 38 __ __ SEC
290c : e9 01 __ SBC #$01
290e : 85 5d __ STA T6 + 0 
2910 : bd 0f 59 LDA $590f,x ; (multab + 0)
2913 : 85 59 __ STA T4 + 0 
2915 : 18 __ __ CLC
2916 : 6d fe 58 ADC $58fe ; (vdc_state + 8)
2919 : a8 __ __ TAY
291a : bd 10 59 LDA $5910,x ; (multab + 1)
291d : 85 5a __ STA T4 + 1 
291f : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l10755:
2922 : 2c 00 d6 BIT $d600 
2925 : 10 fb __ BPL $2922 ; (main.l10755 + 0)
.s2373:
2927 : 8d 01 d6 STA $d601 
292a : a9 13 __ LDA #$13
292c : 8d 00 d6 STA $d600 
.l10757:
292f : 2c 00 d6 BIT $d600 
2932 : 10 fb __ BPL $292f ; (main.l10757 + 0)
.s2378:
2934 : 8c 01 d6 STY $d601 
2937 : a9 1f __ LDA #$1f
2939 : 8d 00 d6 STA $d600 
.l10759:
293c : 2c 00 d6 BIT $d600 
293f : 10 fb __ BPL $293c ; (main.l10759 + 0)
.s2382:
2941 : a9 20 __ LDA #$20
2943 : 8d 01 d6 STA $d601 
2946 : a9 18 __ LDA #$18
2948 : 8d 00 d6 STA $d600 
.l10761:
294b : 2c 00 d6 BIT $d600 
294e : 10 fb __ BPL $294b ; (main.l10761 + 0)
.s2388:
2950 : ad 01 d6 LDA $d601 
2953 : 29 7f __ AND #$7f
2955 : a8 __ __ TAY
2956 : a9 18 __ LDA #$18
2958 : 8d 00 d6 STA $d600 
.l10763:
295b : 2c 00 d6 BIT $d600 
295e : 10 fb __ BPL $295b ; (main.l10763 + 0)
.s2394:
2960 : 8c 01 d6 STY $d601 
2963 : a9 1e __ LDA #$1e
2965 : 8d 00 d6 STA $d600 
.l10765:
2968 : 2c 00 d6 BIT $d600 
296b : 10 fb __ BPL $2968 ; (main.l10765 + 0)
.s2399:
296d : a5 5d __ LDA T6 + 0 
296f : 8d 01 d6 STA $d601 
2972 : ad 00 59 LDA $5900 ; (vdc_state + 10)
2975 : 18 __ __ CLC
2976 : 65 59 __ ADC T4 + 0 
2978 : aa __ __ TAX
2979 : a9 12 __ LDA #$12
297b : 8d 00 d6 STA $d600 
297e : ad 01 59 LDA $5901 ; (vdc_state + 11)
2981 : 65 5a __ ADC T4 + 1 
.l10767:
2983 : 2c 00 d6 BIT $d600 
2986 : 10 fb __ BPL $2983 ; (main.l10767 + 0)
.s2406:
2988 : 8d 01 d6 STA $d601 
298b : a9 13 __ LDA #$13
298d : 8d 00 d6 STA $d600 
.l10769:
2990 : 2c 00 d6 BIT $d600 
2993 : 10 fb __ BPL $2990 ; (main.l10769 + 0)
.s2411:
2995 : 8e 01 d6 STX $d601 
2998 : a9 1f __ LDA #$1f
299a : 8d 00 d6 STA $d600 
.l10771:
299d : 2c 00 d6 BIT $d600 
29a0 : 10 fb __ BPL $299d ; (main.l10771 + 0)
.s2415:
29a2 : a5 56 __ LDA T2 + 0 
29a4 : 8d 01 d6 STA $d601 
29a7 : a9 18 __ LDA #$18
29a9 : 8d 00 d6 STA $d600 
.l10773:
29ac : 2c 00 d6 BIT $d600 
29af : 10 fb __ BPL $29ac ; (main.l10773 + 0)
.s2421:
29b1 : ad 01 d6 LDA $d601 
29b4 : 29 7f __ AND #$7f
29b6 : aa __ __ TAX
29b7 : a9 18 __ LDA #$18
29b9 : 8d 00 d6 STA $d600 
.l10775:
29bc : 2c 00 d6 BIT $d600 
29bf : 10 fb __ BPL $29bc ; (main.l10775 + 0)
.s2427:
29c1 : 8e 01 d6 STX $d601 
29c4 : a9 1e __ LDA #$1e
29c6 : 8d 00 d6 STA $d600 
.l10777:
29c9 : 2c 00 d6 BIT $d600 
29cc : 10 fb __ BPL $29c9 ; (main.l10777 + 0)
.s2432:
29ce : a5 5d __ LDA T6 + 0 
29d0 : 8d 01 d6 STA $d601 
29d3 : e6 53 __ INC T0 + 0 
29d5 : 4c d6 28 JMP $28d6 ; (main.l2360 + 0)
.s1251:
29d8 : a2 15 __ LDX #$15
.l1041:
29da : bd 2a bf LDA $bf2a,x ; (softscroll + 15)
29dd : 9d a9 be STA $bea9,x ; (main@stack + 20)
29e0 : ca __ __ DEX
29e1 : d0 f7 __ BNE $29da ; (main.l1041 + 0)
.s1042:
29e3 : a5 56 __ LDA T2 + 0 
29e5 : 4a __ __ LSR
29e6 : 90 4e __ BCC $2a36 ; (main.s10631 + 0)
.s1255:
29e8 : 86 61 __ STX T8 + 0 
29ea : ae 38 bf LDX $bf38 ; (viewport + 13)
29ed : ca __ __ DEX
29ee : 86 57 __ STX T3 + 0 
29f0 : ad 3c bf LDA $bf3c ; (viewport + 17)
29f3 : 85 59 __ STA T4 + 0 
29f5 : ad 3d bf LDA $bf3d ; (viewport + 18)
29f8 : 85 5a __ STA T4 + 1 
29fa : ad 3e bf LDA $bf3e ; (viewport + 19)
29fd : 85 5b __ STA T5 + 0 
29ff : ad 3f bf LDA $bf3f ; (viewport + 20)
.l1259:
2a02 : 85 5c __ STA T5 + 1 
2a04 : a5 61 __ LDA T8 + 0 
2a06 : cd 39 bf CMP $bf39 ; (viewport + 14)
2a09 : b0 03 __ BCS $2a0e ; (main.s1258 + 0)
2a0b : 4c 1d 31 JMP $311d ; (main.s1260 + 0)
.s1258:
2a0e : a9 01 __ LDA #$01
2a10 : 85 11 __ STA P4 
2a12 : ad 39 bf LDA $bf39 ; (viewport + 14)
2a15 : 85 12 __ STA P5 
2a17 : ad b1 be LDA $beb1 ; (vp_fill + 7)
2a1a : 18 __ __ CLC
2a1b : 69 ff __ ADC #$ff
2a1d : 8d b1 be STA $beb1 ; (vp_fill + 7)
2a20 : b0 03 __ BCS $2a25 ; (main.s1679 + 0)
.s1678:
2a22 : ce b2 be DEC $beb2 ; (vp_fill + 8)
.s1679:
2a25 : ad 32 bf LDA $bf32 ; (viewport + 7)
2a28 : 18 __ __ CLC
2a29 : 69 ff __ ADC #$ff
2a2b : 8d 32 bf STA $bf32 ; (viewport + 7)
2a2e : b0 03 __ BCS $2a33 ; (main.s1681 + 0)
.s1680:
2a30 : ce 33 bf DEC $bf33 ; (viewport + 8)
.s1681:
2a33 : 20 b5 4f JSR $4fb5 ; (vdcwin_init@proxy + 0)
.s10631:
2a36 : a5 56 __ LDA T2 + 0 
2a38 : 29 02 __ AND #$02
2a3a : f0 64 __ BEQ $2aa0 ; (main.s10691 + 0)
.s1616:
2a3c : ae 38 bf LDX $bf38 ; (viewport + 13)
2a3f : ca __ __ DEX
2a40 : 86 57 __ STX T3 + 0 
2a42 : a9 00 __ LDA #$00
2a44 : 85 61 __ STA T8 + 0 
2a46 : ad 3c bf LDA $bf3c ; (viewport + 17)
2a49 : 85 59 __ STA T4 + 0 
2a4b : ad 3d bf LDA $bf3d ; (viewport + 18)
2a4e : 85 5a __ STA T4 + 1 
2a50 : ad 3e bf LDA $bf3e ; (viewport + 19)
2a53 : 85 5b __ STA T5 + 0 
2a55 : ad 3f bf LDA $bf3f ; (viewport + 20)
.l1620:
2a58 : 85 5c __ STA T5 + 1 
2a5a : a5 61 __ LDA T8 + 0 
2a5c : cd 39 bf CMP $bf39 ; (viewport + 14)
2a5f : b0 03 __ BCS $2a64 ; (main.s1619 + 0)
2a61 : 4c d3 2e JMP $2ed3 ; (main.s1621 + 0)
.s1619:
2a64 : a9 01 __ LDA #$01
2a66 : 85 11 __ STA P4 
2a68 : ad 39 bf LDA $bf39 ; (viewport + 14)
2a6b : 85 12 __ STA P5 
2a6d : ad b1 be LDA $beb1 ; (vp_fill + 7)
2a70 : 18 __ __ CLC
2a71 : 6d 38 bf ADC $bf38 ; (viewport + 13)
2a74 : 8d b1 be STA $beb1 ; (vp_fill + 7)
2a77 : 90 03 __ BCC $2a7c ; (main.s1683 + 0)
.s1682:
2a79 : ee b2 be INC $beb2 ; (vp_fill + 8)
.s1683:
2a7c : ee 32 bf INC $bf32 ; (viewport + 7)
2a7f : d0 03 __ BNE $2a84 ; (main.s1685 + 0)
.s1684:
2a81 : ee 33 bf INC $bf33 ; (viewport + 8)
.s1685:
2a84 : a9 b5 __ LDA #$b5
2a86 : 85 0d __ STA P0 
2a88 : a9 be __ LDA #$be
2a8a : 85 0e __ STA P1 
2a8c : ad 36 bf LDA $bf36 ; (viewport + 11)
2a8f : 18 __ __ CLC
2a90 : 6d 38 bf ADC $bf38 ; (viewport + 13)
2a93 : 38 __ __ SEC
2a94 : e9 01 __ SBC #$01
2a96 : 85 0f __ STA P2 
2a98 : ad 37 bf LDA $bf37 ; (viewport + 12)
2a9b : 85 10 __ STA P3 
2a9d : 20 c7 4f JSR $4fc7 ; (vdcwin_init.s0 + 0)
.s10691:
2aa0 : a5 56 __ LDA T2 + 0 
2aa2 : 29 08 __ AND #$08
2aa4 : f0 75 __ BEQ $2b1b ; (main.s10721 + 0)
.s1977:
2aa6 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
2aa9 : 85 59 __ STA T4 + 0 
2aab : 85 1b __ STA ACCU + 0 
2aad : ad fa 58 LDA $58fa ; (vdc_state + 4)
2ab0 : 85 5a __ STA T4 + 1 
2ab2 : 85 1c __ STA ACCU + 1 
2ab4 : ad 39 bf LDA $bf39 ; (viewport + 14)
2ab7 : 20 b7 55 JSR $55b7 ; (mul16by8 + 0)
2aba : ad 3c bf LDA $bf3c ; (viewport + 17)
2abd : 18 __ __ CLC
2abe : 65 05 __ ADC WORK + 2 
2ac0 : 85 5b __ STA T5 + 0 
2ac2 : ad 3d bf LDA $bf3d ; (viewport + 18)
2ac5 : 65 06 __ ADC WORK + 3 
2ac7 : 85 5c __ STA T5 + 1 
2ac9 : ad 3e bf LDA $bf3e ; (viewport + 19)
2acc : 18 __ __ CLC
2acd : 65 05 __ ADC WORK + 2 
2acf : aa __ __ TAX
2ad0 : ad 3f bf LDA $bf3f ; (viewport + 20)
2ad3 : 65 06 __ ADC WORK + 3 
2ad5 : a8 __ __ TAY
2ad6 : a9 00 __ LDA #$00
2ad8 : 85 61 __ STA T8 + 0 
2ada : ad 38 bf LDA $bf38 ; (viewport + 13)
2add : 85 62 __ STA T9 + 0 
.l1981:
2adf : ad 39 bf LDA $bf39 ; (viewport + 14)
2ae2 : 38 __ __ SEC
2ae3 : e9 01 __ SBC #$01
2ae5 : b0 03 __ BCS $2aea ; (main.s1105 + 0)
2ae7 : 4c b6 2d JMP $2db6 ; (main.s1982 + 0)
.s1105:
2aea : c5 61 __ CMP T8 + 0 
2aec : 90 05 __ BCC $2af3 ; (main.s1980 + 0)
.s1686:
2aee : f0 03 __ BEQ $2af3 ; (main.s1980 + 0)
2af0 : 4c b6 2d JMP $2db6 ; (main.s1982 + 0)
.s1980:
2af3 : a9 01 __ LDA #$01
2af5 : 85 12 __ STA P5 
2af7 : ad b3 be LDA $beb3 ; (vp_fill + 9)
2afa : 18 __ __ CLC
2afb : 69 ff __ ADC #$ff
2afd : 8d b3 be STA $beb3 ; (vp_fill + 9)
2b00 : b0 03 __ BCS $2b05 ; (main.s1688 + 0)
.s1687:
2b02 : ce b4 be DEC $beb4 ; (vp_fill + 10)
.s1688:
2b05 : ad 34 bf LDA $bf34 ; (viewport + 9)
2b08 : 18 __ __ CLC
2b09 : 69 ff __ ADC #$ff
2b0b : 8d 34 bf STA $bf34 ; (viewport + 9)
2b0e : b0 03 __ BCS $2b13 ; (main.s1690 + 0)
.s1689:
2b10 : ce 35 bf DEC $bf35 ; (viewport + 10)
.s1690:
2b13 : ad 38 bf LDA $bf38 ; (viewport + 13)
2b16 : 85 11 __ STA P4 
2b18 : 20 b5 4f JSR $4fb5 ; (vdcwin_init@proxy + 0)
.s10721:
2b1b : a5 56 __ LDA T2 + 0 
2b1d : 29 04 __ AND #$04
2b1f : f0 73 __ BEQ $2b94 ; (main.s2162 + 0)
.s2160:
2b21 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
2b24 : 85 57 __ STA T3 + 0 
2b26 : ad fa 58 LDA $58fa ; (vdc_state + 4)
2b29 : 85 58 __ STA T3 + 1 
2b2b : ad 38 bf LDA $bf38 ; (viewport + 13)
2b2e : 85 61 __ STA T8 + 0 
2b30 : ad 3c bf LDA $bf3c ; (viewport + 17)
2b33 : 85 59 __ STA T4 + 0 
2b35 : ad 3d bf LDA $bf3d ; (viewport + 18)
2b38 : 85 5a __ STA T4 + 1 
2b3a : ad 3f bf LDA $bf3f ; (viewport + 20)
2b3d : a2 00 __ LDX #$00
2b3f : ac 3e bf LDY $bf3e ; (viewport + 19)
.l2164:
2b42 : 85 5c __ STA T5 + 1 
2b44 : ad 39 bf LDA $bf39 ; (viewport + 14)
2b47 : 38 __ __ SEC
2b48 : e9 01 __ SBC #$01
2b4a : b0 03 __ BCS $2b4f ; (main.s1075 + 0)
2b4c : 4c 98 2c JMP $2c98 ; (main.s2165 + 0)
.s1075:
2b4f : 85 5f __ STA T7 + 0 
2b51 : e4 5f __ CPX T7 + 0 
2b53 : b0 03 __ BCS $2b58 ; (main.s2163 + 0)
2b55 : 4c 98 2c JMP $2c98 ; (main.s2165 + 0)
.s2163:
2b58 : a9 01 __ LDA #$01
2b5a : 85 12 __ STA P5 
2b5c : ad b3 be LDA $beb3 ; (vp_fill + 9)
2b5f : 18 __ __ CLC
2b60 : 6d 39 bf ADC $bf39 ; (viewport + 14)
2b63 : 8d b3 be STA $beb3 ; (vp_fill + 9)
2b66 : 90 03 __ BCC $2b6b ; (main.s1692 + 0)
.s1691:
2b68 : ee b4 be INC $beb4 ; (vp_fill + 10)
.s1692:
2b6b : ee 34 bf INC $bf34 ; (viewport + 9)
2b6e : d0 03 __ BNE $2b73 ; (main.s1694 + 0)
.s1693:
2b70 : ee 35 bf INC $bf35 ; (viewport + 10)
.s1694:
2b73 : a9 b5 __ LDA #$b5
2b75 : 85 0d __ STA P0 
2b77 : a9 be __ LDA #$be
2b79 : 85 0e __ STA P1 
2b7b : ad 36 bf LDA $bf36 ; (viewport + 11)
2b7e : 85 0f __ STA P2 
2b80 : ad 37 bf LDA $bf37 ; (viewport + 12)
2b83 : 18 __ __ CLC
2b84 : 6d 39 bf ADC $bf39 ; (viewport + 14)
2b87 : 38 __ __ SEC
2b88 : e9 01 __ SBC #$01
2b8a : 85 10 __ STA P3 
2b8c : ad 38 bf LDA $bf38 ; (viewport + 13)
2b8f : 85 11 __ STA P4 
2b91 : 20 c7 4f JSR $4fc7 ; (vdcwin_init.s0 + 0)
.s2162:
2b94 : ad b3 be LDA $beb3 ; (vp_fill + 9)
2b97 : 85 1b __ STA ACCU + 0 
2b99 : ad b4 be LDA $beb4 ; (vp_fill + 10)
2b9c : 85 1c __ STA ACCU + 1 
2b9e : ad ad be LDA $bead ; (vp_fill + 3)
2ba1 : 85 03 __ STA WORK + 0 
2ba3 : ad ae be LDA $beae ; (vp_fill + 4)
2ba6 : 85 04 __ STA WORK + 1 
2ba8 : 20 d7 55 JSR $55d7 ; (mul16 + 0)
2bab : ad ab be LDA $beab ; (vp_fill + 1)
2bae : 18 __ __ CLC
2baf : 65 05 __ ADC WORK + 2 
2bb1 : a8 __ __ TAY
2bb2 : ad ac be LDA $beac ; (vp_fill + 2)
2bb5 : 65 06 __ ADC WORK + 3 
2bb7 : aa __ __ TAX
2bb8 : 98 __ __ TYA
2bb9 : 18 __ __ CLC
2bba : 6d b1 be ADC $beb1 ; (vp_fill + 7)
2bbd : 85 57 __ STA T3 + 0 
2bbf : 8a __ __ TXA
2bc0 : 6d b2 be ADC $beb2 ; (vp_fill + 8)
2bc3 : 85 58 __ STA T3 + 1 
2bc5 : a9 00 __ LDA #$00
2bc7 : 85 56 __ STA T2 + 0 
2bc9 : ac bc be LDY $bebc ; (vp_fill + 18)
2bcc : ae bb be LDX $bebb ; (vp_fill + 17)
2bcf : 4c f9 2b JMP $2bf9 ; (main.l2344 + 0)
.s2345:
2bd2 : 86 0d __ STX P0 
2bd4 : 84 0e __ STY P1 
2bd6 : 20 d0 14 JSR $14d0 ; (bnk_cpytovdc@proxy + 0)
2bd9 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
2bdc : 18 __ __ CLC
2bdd : 65 0d __ ADC P0 
2bdf : aa __ __ TAX
2be0 : ad fa 58 LDA $58fa ; (vdc_state + 4)
2be3 : 65 0e __ ADC P1 
2be5 : a8 __ __ TAY
2be6 : 18 __ __ CLC
2be7 : a5 57 __ LDA T3 + 0 
2be9 : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
2bec : 85 57 __ STA T3 + 0 
2bee : a5 58 __ LDA T3 + 1 
2bf0 : 6d fa 58 ADC $58fa ; (vdc_state + 4)
2bf3 : 85 58 __ STA T3 + 1 
2bf5 : e6 56 __ INC T2 + 0 
2bf7 : a5 56 __ LDA T2 + 0 
.l2344:
2bf9 : cd b8 be CMP $beb8 ; (vp_fill + 14)
2bfc : 90 d4 __ BCC $2bd2 ; (main.s2345 + 0)
.s2347:
2bfe : ad ad be LDA $bead ; (vp_fill + 3)
2c01 : 85 03 __ STA WORK + 0 
2c03 : ad ae be LDA $beae ; (vp_fill + 4)
2c06 : 85 04 __ STA WORK + 1 
2c08 : ad b3 be LDA $beb3 ; (vp_fill + 9)
2c0b : 85 1b __ STA ACCU + 0 
2c0d : ad b4 be LDA $beb4 ; (vp_fill + 10)
2c10 : 85 1c __ STA ACCU + 1 
2c12 : 20 d7 55 JSR $55d7 ; (mul16 + 0)
2c15 : ad ab be LDA $beab ; (vp_fill + 1)
2c18 : 18 __ __ CLC
2c19 : 65 05 __ ADC WORK + 2 
2c1b : a8 __ __ TAY
2c1c : ad ac be LDA $beac ; (vp_fill + 2)
2c1f : 65 06 __ ADC WORK + 3 
2c21 : aa __ __ TAX
2c22 : 98 __ __ TYA
2c23 : 18 __ __ CLC
2c24 : 6d b1 be ADC $beb1 ; (vp_fill + 7)
2c27 : 85 59 __ STA T4 + 0 
2c29 : 8a __ __ TXA
2c2a : 6d b2 be ADC $beb2 ; (vp_fill + 8)
2c2d : 85 5a __ STA T4 + 1 
2c2f : ad af be LDA $beaf ; (vp_fill + 5)
2c32 : 85 1b __ STA ACCU + 0 
2c34 : ad b0 be LDA $beb0 ; (vp_fill + 6)
2c37 : 85 1c __ STA ACCU + 1 
2c39 : ad ad be LDA $bead ; (vp_fill + 3)
2c3c : 85 03 __ STA WORK + 0 
2c3e : ad ae be LDA $beae ; (vp_fill + 4)
2c41 : 85 04 __ STA WORK + 1 
2c43 : 20 d7 55 JSR $55d7 ; (mul16 + 0)
2c46 : 18 __ __ CLC
2c47 : a5 59 __ LDA T4 + 0 
2c49 : 65 05 __ ADC WORK + 2 
2c4b : aa __ __ TAX
2c4c : a5 5a __ LDA T4 + 1 
2c4e : 65 06 __ ADC WORK + 3 
2c50 : a8 __ __ TAY
2c51 : 8a __ __ TXA
2c52 : 18 __ __ CLC
2c53 : 69 30 __ ADC #$30
2c55 : 85 57 __ STA T3 + 0 
2c57 : 90 01 __ BCC $2c5a ; (main.s1696 + 0)
.s1695:
2c59 : c8 __ __ INY
.s1696:
2c5a : 84 58 __ STY T3 + 1 
2c5c : a9 00 __ LDA #$00
2c5e : 85 56 __ STA T2 + 0 
2c60 : ac be be LDY $bebe ; (vp_fill + 20)
2c63 : ae bd be LDX $bebd ; (vp_fill + 19)
2c66 : 4c 90 2c JMP $2c90 ; (main.l2348 + 0)
.s2349:
2c69 : 86 0d __ STX P0 
2c6b : 84 0e __ STY P1 
2c6d : 20 d0 14 JSR $14d0 ; (bnk_cpytovdc@proxy + 0)
2c70 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
2c73 : 18 __ __ CLC
2c74 : 65 0d __ ADC P0 
2c76 : aa __ __ TAX
2c77 : ad fa 58 LDA $58fa ; (vdc_state + 4)
2c7a : 65 0e __ ADC P1 
2c7c : a8 __ __ TAY
2c7d : 18 __ __ CLC
2c7e : a5 57 __ LDA T3 + 0 
2c80 : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
2c83 : 85 57 __ STA T3 + 0 
2c85 : a5 58 __ LDA T3 + 1 
2c87 : 6d fa 58 ADC $58fa ; (vdc_state + 4)
2c8a : 85 58 __ STA T3 + 1 
2c8c : e6 56 __ INC T2 + 0 
2c8e : a5 56 __ LDA T2 + 0 
.l2348:
2c90 : cd b8 be CMP $beb8 ; (vp_fill + 14)
2c93 : 90 d4 __ BCC $2c69 ; (main.s2349 + 0)
2c95 : 4c 9c 28 JMP $289c ; (main.s1253 + 0)
.s2165:
2c98 : a9 12 __ LDA #$12
2c9a : 8d 00 d6 STA $d600 
2c9d : 98 __ __ TYA
2c9e : 65 57 __ ADC T3 + 0 
2ca0 : 85 5d __ STA T6 + 0 
2ca2 : a5 5c __ LDA T5 + 1 
2ca4 : 65 58 __ ADC T3 + 1 
2ca6 : 85 5e __ STA T6 + 1 
2ca8 : 18 __ __ CLC
2ca9 : a5 59 __ LDA T4 + 0 
2cab : 65 57 __ ADC T3 + 0 
2cad : 85 64 __ STA T11 + 0 
2caf : a5 5a __ LDA T4 + 1 
2cb1 : 65 58 __ ADC T3 + 1 
2cb3 : 85 65 __ STA T11 + 1 
.l10723:
2cb5 : 2c 00 d6 BIT $d600 
2cb8 : 10 fb __ BPL $2cb5 ; (main.l10723 + 0)
.s2221:
2cba : a5 5a __ LDA T4 + 1 
2cbc : 8d 01 d6 STA $d601 
2cbf : a9 13 __ LDA #$13
2cc1 : 8d 00 d6 STA $d600 
.l10725:
2cc4 : 2c 00 d6 BIT $d600 
2cc7 : 10 fb __ BPL $2cc4 ; (main.l10725 + 0)
.s2226:
2cc9 : a5 59 __ LDA T4 + 0 
2ccb : 8d 01 d6 STA $d601 
2cce : a9 1f __ LDA #$1f
2cd0 : 8d 00 d6 STA $d600 
2cd3 : a9 18 __ LDA #$18
2cd5 : 8d 00 d6 STA $d600 
.l10727:
2cd8 : 2c 00 d6 BIT $d600 
2cdb : 10 fb __ BPL $2cd8 ; (main.l10727 + 0)
.s2233:
2cdd : ad 01 d6 LDA $d601 
2ce0 : 09 80 __ ORA #$80
2ce2 : 85 66 __ STA T12 + 0 
2ce4 : a9 18 __ LDA #$18
2ce6 : 8d 00 d6 STA $d600 
.l10729:
2ce9 : 2c 00 d6 BIT $d600 
2cec : 10 fb __ BPL $2ce9 ; (main.l10729 + 0)
.s2239:
2cee : a5 66 __ LDA T12 + 0 
2cf0 : 8d 01 d6 STA $d601 
2cf3 : a9 20 __ LDA #$20
2cf5 : 8d 00 d6 STA $d600 
.l10731:
2cf8 : 2c 00 d6 BIT $d600 
2cfb : 10 fb __ BPL $2cf8 ; (main.l10731 + 0)
.s2244:
2cfd : a5 65 __ LDA T11 + 1 
2cff : 8d 01 d6 STA $d601 
2d02 : a9 21 __ LDA #$21
2d04 : 8d 00 d6 STA $d600 
.l10733:
2d07 : 2c 00 d6 BIT $d600 
2d0a : 10 fb __ BPL $2d07 ; (main.l10733 + 0)
.s2249:
2d0c : a5 64 __ LDA T11 + 0 
2d0e : 8d 01 d6 STA $d601 
2d11 : a9 1f __ LDA #$1f
2d13 : 8d 00 d6 STA $d600 
2d16 : a9 1e __ LDA #$1e
2d18 : 8d 00 d6 STA $d600 
.l10735:
2d1b : 2c 00 d6 BIT $d600 
2d1e : 10 fb __ BPL $2d1b ; (main.l10735 + 0)
.s2255:
2d20 : a5 61 __ LDA T8 + 0 
2d22 : 8d 01 d6 STA $d601 
2d25 : a9 12 __ LDA #$12
2d27 : 8d 00 d6 STA $d600 
.l10737:
2d2a : 2c 00 d6 BIT $d600 
2d2d : 10 fb __ BPL $2d2a ; (main.l10737 + 0)
.s2308:
2d2f : a5 5c __ LDA T5 + 1 
2d31 : 8d 01 d6 STA $d601 
2d34 : a9 13 __ LDA #$13
2d36 : 8d 00 d6 STA $d600 
.l10739:
2d39 : 2c 00 d6 BIT $d600 
2d3c : 10 fb __ BPL $2d39 ; (main.l10739 + 0)
.s2313:
2d3e : 8c 01 d6 STY $d601 
2d41 : a9 1f __ LDA #$1f
2d43 : 8d 00 d6 STA $d600 
2d46 : a9 18 __ LDA #$18
2d48 : 8d 00 d6 STA $d600 
.l10741:
2d4b : 2c 00 d6 BIT $d600 
2d4e : 10 fb __ BPL $2d4b ; (main.l10741 + 0)
.s2320:
2d50 : ad 01 d6 LDA $d601 
2d53 : 09 80 __ ORA #$80
2d55 : 85 64 __ STA T11 + 0 
2d57 : a9 18 __ LDA #$18
2d59 : 8d 00 d6 STA $d600 
.l10743:
2d5c : 2c 00 d6 BIT $d600 
2d5f : 10 fb __ BPL $2d5c ; (main.l10743 + 0)
.s2326:
2d61 : a5 64 __ LDA T11 + 0 
2d63 : 8d 01 d6 STA $d601 
2d66 : a9 20 __ LDA #$20
2d68 : 8d 00 d6 STA $d600 
.l10745:
2d6b : 2c 00 d6 BIT $d600 
2d6e : 10 fb __ BPL $2d6b ; (main.l10745 + 0)
.s2331:
2d70 : a5 5e __ LDA T6 + 1 
2d72 : 8d 01 d6 STA $d601 
2d75 : a9 21 __ LDA #$21
2d77 : 8d 00 d6 STA $d600 
.l10747:
2d7a : 2c 00 d6 BIT $d600 
2d7d : 10 fb __ BPL $2d7a ; (main.l10747 + 0)
.s2336:
2d7f : a5 5d __ LDA T6 + 0 
2d81 : 8d 01 d6 STA $d601 
2d84 : a9 1f __ LDA #$1f
2d86 : 8d 00 d6 STA $d600 
2d89 : a9 1e __ LDA #$1e
2d8b : 8d 00 d6 STA $d600 
.l10749:
2d8e : 2c 00 d6 BIT $d600 
2d91 : 10 fb __ BPL $2d8e ; (main.l10749 + 0)
.s2342:
2d93 : a5 61 __ LDA T8 + 0 
2d95 : 8d 01 d6 STA $d601 
2d98 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
2d9b : 18 __ __ CLC
2d9c : 65 59 __ ADC T4 + 0 
2d9e : 85 59 __ STA T4 + 0 
2da0 : ad fa 58 LDA $58fa ; (vdc_state + 4)
2da3 : 65 5a __ ADC T4 + 1 
2da5 : 85 5a __ STA T4 + 1 
2da7 : 98 __ __ TYA
2da8 : 18 __ __ CLC
2da9 : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
2dac : a8 __ __ TAY
2dad : a5 5c __ LDA T5 + 1 
2daf : 6d fa 58 ADC $58fa ; (vdc_state + 4)
2db2 : e8 __ __ INX
2db3 : 4c 42 2b JMP $2b42 ; (main.l2164 + 0)
.s1982:
2db6 : a9 12 __ LDA #$12
2db8 : 8d 00 d6 STA $d600 
2dbb : 8a __ __ TXA
2dbc : 38 __ __ SEC
2dbd : ed f9 58 SBC $58f9 ; (vdc_state + 3)
2dc0 : aa __ __ TAX
2dc1 : 98 __ __ TYA
2dc2 : ed fa 58 SBC $58fa ; (vdc_state + 4)
2dc5 : a8 __ __ TAY
2dc6 : 8a __ __ TXA
2dc7 : 38 __ __ SEC
2dc8 : e5 59 __ SBC T4 + 0 
2dca : 85 5f __ STA T7 + 0 
2dcc : 98 __ __ TYA
2dcd : e5 5a __ SBC T4 + 1 
2dcf : 85 60 __ STA T7 + 1 
2dd1 : 38 __ __ SEC
2dd2 : a5 5b __ LDA T5 + 0 
2dd4 : ed f9 58 SBC $58f9 ; (vdc_state + 3)
2dd7 : 85 5b __ STA T5 + 0 
2dd9 : a5 5c __ LDA T5 + 1 
2ddb : ed fa 58 SBC $58fa ; (vdc_state + 4)
2dde : 85 5c __ STA T5 + 1 
2de0 : 38 __ __ SEC
2de1 : a5 5b __ LDA T5 + 0 
2de3 : e5 59 __ SBC T4 + 0 
2de5 : 85 5d __ STA T6 + 0 
2de7 : a5 5c __ LDA T5 + 1 
2de9 : e5 5a __ SBC T4 + 1 
2deb : 85 5e __ STA T6 + 1 
.l10693:
2ded : 2c 00 d6 BIT $d600 
2df0 : 10 fb __ BPL $2ded ; (main.l10693 + 0)
.s2038:
2df2 : a5 5c __ LDA T5 + 1 
2df4 : 8d 01 d6 STA $d601 
2df7 : a9 13 __ LDA #$13
2df9 : 8d 00 d6 STA $d600 
.l10695:
2dfc : 2c 00 d6 BIT $d600 
2dff : 10 fb __ BPL $2dfc ; (main.l10695 + 0)
.s2043:
2e01 : a5 5b __ LDA T5 + 0 
2e03 : 8d 01 d6 STA $d601 
2e06 : a9 1f __ LDA #$1f
2e08 : 8d 00 d6 STA $d600 
2e0b : a9 18 __ LDA #$18
2e0d : 8d 00 d6 STA $d600 
.l10697:
2e10 : 2c 00 d6 BIT $d600 
2e13 : 10 fb __ BPL $2e10 ; (main.l10697 + 0)
.s2050:
2e15 : ad 01 d6 LDA $d601 
2e18 : 09 80 __ ORA #$80
2e1a : 85 66 __ STA T12 + 0 
2e1c : a9 18 __ LDA #$18
2e1e : 8d 00 d6 STA $d600 
.l10699:
2e21 : 2c 00 d6 BIT $d600 
2e24 : 10 fb __ BPL $2e21 ; (main.l10699 + 0)
.s2056:
2e26 : a5 66 __ LDA T12 + 0 
2e28 : 8d 01 d6 STA $d601 
2e2b : a9 20 __ LDA #$20
2e2d : 8d 00 d6 STA $d600 
.l10701:
2e30 : 2c 00 d6 BIT $d600 
2e33 : 10 fb __ BPL $2e30 ; (main.l10701 + 0)
.s2061:
2e35 : a5 5e __ LDA T6 + 1 
2e37 : 8d 01 d6 STA $d601 
2e3a : a9 21 __ LDA #$21
2e3c : 8d 00 d6 STA $d600 
.l10703:
2e3f : 2c 00 d6 BIT $d600 
2e42 : 10 fb __ BPL $2e3f ; (main.l10703 + 0)
.s2066:
2e44 : a5 5d __ LDA T6 + 0 
2e46 : 8d 01 d6 STA $d601 
2e49 : a9 1f __ LDA #$1f
2e4b : 8d 00 d6 STA $d600 
2e4e : a9 1e __ LDA #$1e
2e50 : 8d 00 d6 STA $d600 
.l10705:
2e53 : 2c 00 d6 BIT $d600 
2e56 : 10 fb __ BPL $2e53 ; (main.l10705 + 0)
.s2072:
2e58 : a5 62 __ LDA T9 + 0 
2e5a : 8d 01 d6 STA $d601 
2e5d : a9 12 __ LDA #$12
2e5f : 8d 00 d6 STA $d600 
.l10707:
2e62 : 2c 00 d6 BIT $d600 
2e65 : 10 fb __ BPL $2e62 ; (main.l10707 + 0)
.s2125:
2e67 : 8c 01 d6 STY $d601 
2e6a : a9 13 __ LDA #$13
2e6c : 8d 00 d6 STA $d600 
.l10709:
2e6f : 2c 00 d6 BIT $d600 
2e72 : 10 fb __ BPL $2e6f ; (main.l10709 + 0)
.s2130:
2e74 : 8e 01 d6 STX $d601 
2e77 : a9 1f __ LDA #$1f
2e79 : 8d 00 d6 STA $d600 
2e7c : a9 18 __ LDA #$18
2e7e : 8d 00 d6 STA $d600 
.l10711:
2e81 : 2c 00 d6 BIT $d600 
2e84 : 10 fb __ BPL $2e81 ; (main.l10711 + 0)
.s2137:
2e86 : ad 01 d6 LDA $d601 
2e89 : 09 80 __ ORA #$80
2e8b : 85 5d __ STA T6 + 0 
2e8d : a9 18 __ LDA #$18
2e8f : 8d 00 d6 STA $d600 
.l10713:
2e92 : 2c 00 d6 BIT $d600 
2e95 : 10 fb __ BPL $2e92 ; (main.l10713 + 0)
.s2143:
2e97 : a5 5d __ LDA T6 + 0 
2e99 : 8d 01 d6 STA $d601 
2e9c : a9 20 __ LDA #$20
2e9e : 8d 00 d6 STA $d600 
.l10715:
2ea1 : 2c 00 d6 BIT $d600 
2ea4 : 10 fb __ BPL $2ea1 ; (main.l10715 + 0)
.s2148:
2ea6 : a5 60 __ LDA T7 + 1 
2ea8 : 8d 01 d6 STA $d601 
2eab : a9 21 __ LDA #$21
2ead : 8d 00 d6 STA $d600 
.l10717:
2eb0 : 2c 00 d6 BIT $d600 
2eb3 : 10 fb __ BPL $2eb0 ; (main.l10717 + 0)
.s2153:
2eb5 : a5 5f __ LDA T7 + 0 
2eb7 : 8d 01 d6 STA $d601 
2eba : a9 1f __ LDA #$1f
2ebc : 8d 00 d6 STA $d600 
2ebf : a9 1e __ LDA #$1e
2ec1 : 8d 00 d6 STA $d600 
.l10719:
2ec4 : 2c 00 d6 BIT $d600 
2ec7 : 10 fb __ BPL $2ec4 ; (main.l10719 + 0)
.s2159:
2ec9 : a5 62 __ LDA T9 + 0 
2ecb : 8d 01 d6 STA $d601 
2ece : e6 61 __ INC T8 + 0 
2ed0 : 4c df 2a JMP $2adf ; (main.l1981 + 0)
.s1621:
2ed3 : a5 5b __ LDA T5 + 0 
2ed5 : 69 01 __ ADC #$01
2ed7 : 85 5d __ STA T6 + 0 
2ed9 : a5 5c __ LDA T5 + 1 
2edb : 69 00 __ ADC #$00
2edd : 85 5e __ STA T6 + 1 
2edf : 18 __ __ CLC
2ee0 : a5 59 __ LDA T4 + 0 
2ee2 : 69 01 __ ADC #$01
2ee4 : aa __ __ TAX
2ee5 : a5 5a __ LDA T4 + 1 
2ee7 : 69 00 __ ADC #$00
2ee9 : a8 __ __ TAY
2eea : ad f7 58 LDA $58f7 ; (vdc_state + 1)
2eed : d0 11 __ BNE $2f00 ; (main.s1626 + 0)
.s1628:
2eef : a9 03 __ LDA #$03
2ef1 : cd 03 59 CMP $5903 ; (vdc_state + 13)
2ef4 : d0 05 __ BNE $2efb ; (main.s1164 + 0)
.s1163:
2ef6 : a9 ff __ LDA #$ff
2ef8 : cd 02 59 CMP $5902 ; (vdc_state + 12)
.s1164:
2efb : b0 03 __ BCS $2f00 ; (main.s1626 + 0)
2efd : 4c f2 30 JMP $30f2 ; (main.s1625 + 0)
.s1626:
2f00 : ad 02 59 LDA $5902 ; (vdc_state + 12)
2f03 : 85 64 __ STA T11 + 0 
2f05 : ad 03 59 LDA $5903 ; (vdc_state + 13)
2f08 : 85 44 __ STA T14 + 0 
2f0a : a9 12 __ LDA #$12
2f0c : 8d 00 d6 STA $d600 
.l10634:
2f0f : 2c 00 d6 BIT $d600 
2f12 : 10 fb __ BPL $2f0f ; (main.l10634 + 0)
.s1681:
2f14 : a5 44 __ LDA T14 + 0 
2f16 : 8d 01 d6 STA $d601 
2f19 : a9 13 __ LDA #$13
2f1b : 8d 00 d6 STA $d600 
.l10636:
2f1e : 2c 00 d6 BIT $d600 
2f21 : 10 fb __ BPL $2f1e ; (main.l10636 + 0)
.s1686:
2f23 : a5 64 __ LDA T11 + 0 
2f25 : 8d 01 d6 STA $d601 
2f28 : a9 1f __ LDA #$1f
2f2a : 8d 00 d6 STA $d600 
2f2d : a9 18 __ LDA #$18
2f2f : 8d 00 d6 STA $d600 
.l10638:
2f32 : 2c 00 d6 BIT $d600 
2f35 : 10 fb __ BPL $2f32 ; (main.l10638 + 0)
.s1693:
2f37 : ad 01 d6 LDA $d601 
2f3a : 09 80 __ ORA #$80
2f3c : 85 46 __ STA T15 + 0 
2f3e : a9 18 __ LDA #$18
2f40 : 8d 00 d6 STA $d600 
.l10640:
2f43 : 2c 00 d6 BIT $d600 
2f46 : 10 fb __ BPL $2f43 ; (main.l10640 + 0)
.s1699:
2f48 : a5 46 __ LDA T15 + 0 
2f4a : 8d 01 d6 STA $d601 
2f4d : a9 20 __ LDA #$20
2f4f : 8d 00 d6 STA $d600 
.l10642:
2f52 : 2c 00 d6 BIT $d600 
2f55 : 10 fb __ BPL $2f52 ; (main.l10642 + 0)
.s1704:
2f57 : 8c 01 d6 STY $d601 
2f5a : a9 21 __ LDA #$21
2f5c : 8d 00 d6 STA $d600 
.l10644:
2f5f : 2c 00 d6 BIT $d600 
2f62 : 10 fb __ BPL $2f5f ; (main.l10644 + 0)
.s1709:
2f64 : 8e 01 d6 STX $d601 
2f67 : a9 1f __ LDA #$1f
2f69 : 8d 00 d6 STA $d600 
2f6c : a9 1e __ LDA #$1e
2f6e : 8d 00 d6 STA $d600 
.l10646:
2f71 : 2c 00 d6 BIT $d600 
2f74 : 10 fb __ BPL $2f71 ; (main.l10646 + 0)
.s1715:
2f76 : a5 57 __ LDA T3 + 0 
2f78 : 8d 01 d6 STA $d601 
2f7b : a9 12 __ LDA #$12
2f7d : 8d 00 d6 STA $d600 
.l10648:
2f80 : 2c 00 d6 BIT $d600 
2f83 : 10 fb __ BPL $2f80 ; (main.l10648 + 0)
.s1768:
2f85 : a5 5a __ LDA T4 + 1 
2f87 : 8d 01 d6 STA $d601 
2f8a : a9 13 __ LDA #$13
2f8c : 8d 00 d6 STA $d600 
.l10650:
2f8f : 2c 00 d6 BIT $d600 
2f92 : 10 fb __ BPL $2f8f ; (main.l10650 + 0)
.s1773:
2f94 : a5 59 __ LDA T4 + 0 
2f96 : 8d 01 d6 STA $d601 
2f99 : a9 1f __ LDA #$1f
2f9b : 8d 00 d6 STA $d600 
2f9e : a9 18 __ LDA #$18
2fa0 : 8d 00 d6 STA $d600 
.l10652:
2fa3 : 2c 00 d6 BIT $d600 
2fa6 : 10 fb __ BPL $2fa3 ; (main.l10652 + 0)
.s1780:
2fa8 : ad 01 d6 LDA $d601 
2fab : 09 80 __ ORA #$80
2fad : aa __ __ TAX
2fae : a9 18 __ LDA #$18
2fb0 : 8d 00 d6 STA $d600 
.l10654:
2fb3 : 2c 00 d6 BIT $d600 
2fb6 : 10 fb __ BPL $2fb3 ; (main.l10654 + 0)
.s1786:
2fb8 : 8e 01 d6 STX $d601 
2fbb : a9 20 __ LDA #$20
2fbd : 8d 00 d6 STA $d600 
.l10656:
2fc0 : 2c 00 d6 BIT $d600 
2fc3 : 10 fb __ BPL $2fc0 ; (main.l10656 + 0)
.s1791:
2fc5 : a5 44 __ LDA T14 + 0 
2fc7 : 8d 01 d6 STA $d601 
2fca : a9 21 __ LDA #$21
2fcc : 8d 00 d6 STA $d600 
.l10658:
2fcf : 2c 00 d6 BIT $d600 
2fd2 : 10 fb __ BPL $2fcf ; (main.l10658 + 0)
.s1796:
2fd4 : a5 64 __ LDA T11 + 0 
2fd6 : 8d 01 d6 STA $d601 
2fd9 : a9 1f __ LDA #$1f
2fdb : 8d 00 d6 STA $d600 
2fde : a9 1e __ LDA #$1e
2fe0 : 8d 00 d6 STA $d600 
.l10660:
2fe3 : 2c 00 d6 BIT $d600 
2fe6 : 10 fb __ BPL $2fe3 ; (main.l10660 + 0)
.s1802:
2fe8 : a5 57 __ LDA T3 + 0 
2fea : 8d 01 d6 STA $d601 
2fed : a9 12 __ LDA #$12
2fef : 8d 00 d6 STA $d600 
.l10662:
2ff2 : 2c 00 d6 BIT $d600 
2ff5 : 10 fb __ BPL $2ff2 ; (main.l10662 + 0)
.s1855:
2ff7 : a5 44 __ LDA T14 + 0 
2ff9 : 8d 01 d6 STA $d601 
2ffc : a9 13 __ LDA #$13
2ffe : 8d 00 d6 STA $d600 
.l10664:
3001 : 2c 00 d6 BIT $d600 
3004 : 10 fb __ BPL $3001 ; (main.l10664 + 0)
.s1860:
3006 : a5 64 __ LDA T11 + 0 
3008 : 8d 01 d6 STA $d601 
300b : a9 1f __ LDA #$1f
300d : 8d 00 d6 STA $d600 
3010 : a9 18 __ LDA #$18
3012 : 8d 00 d6 STA $d600 
.l10666:
3015 : 2c 00 d6 BIT $d600 
3018 : 10 fb __ BPL $3015 ; (main.l10666 + 0)
.s1867:
301a : ad 01 d6 LDA $d601 
301d : 09 80 __ ORA #$80
301f : aa __ __ TAX
3020 : a9 18 __ LDA #$18
3022 : 8d 00 d6 STA $d600 
.l10668:
3025 : 2c 00 d6 BIT $d600 
3028 : 10 fb __ BPL $3025 ; (main.l10668 + 0)
.s1873:
302a : 8e 01 d6 STX $d601 
302d : a9 20 __ LDA #$20
302f : 8d 00 d6 STA $d600 
.l10670:
3032 : 2c 00 d6 BIT $d600 
3035 : 10 fb __ BPL $3032 ; (main.l10670 + 0)
.s1878:
3037 : a5 5e __ LDA T6 + 1 
3039 : 8d 01 d6 STA $d601 
303c : a9 21 __ LDA #$21
303e : 8d 00 d6 STA $d600 
.l10672:
3041 : 2c 00 d6 BIT $d600 
3044 : 10 fb __ BPL $3041 ; (main.l10672 + 0)
.s1883:
3046 : a5 5d __ LDA T6 + 0 
3048 : 8d 01 d6 STA $d601 
304b : a9 1f __ LDA #$1f
304d : 8d 00 d6 STA $d600 
3050 : a9 1e __ LDA #$1e
3052 : 8d 00 d6 STA $d600 
.l10674:
3055 : 2c 00 d6 BIT $d600 
3058 : 10 fb __ BPL $3055 ; (main.l10674 + 0)
.s1889:
305a : a5 57 __ LDA T3 + 0 
305c : 8d 01 d6 STA $d601 
305f : a9 12 __ LDA #$12
3061 : 8d 00 d6 STA $d600 
.l10676:
3064 : 2c 00 d6 BIT $d600 
3067 : 10 fb __ BPL $3064 ; (main.l10676 + 0)
.s1942:
3069 : a5 5c __ LDA T5 + 1 
306b : 8d 01 d6 STA $d601 
306e : a9 13 __ LDA #$13
3070 : 8d 00 d6 STA $d600 
.l10678:
3073 : 2c 00 d6 BIT $d600 
3076 : 10 fb __ BPL $3073 ; (main.l10678 + 0)
.s1947:
3078 : a5 5b __ LDA T5 + 0 
307a : 8d 01 d6 STA $d601 
307d : a9 1f __ LDA #$1f
307f : 8d 00 d6 STA $d600 
3082 : a9 18 __ LDA #$18
3084 : 8d 00 d6 STA $d600 
.l10680:
3087 : 2c 00 d6 BIT $d600 
308a : 10 fb __ BPL $3087 ; (main.l10680 + 0)
.s1954:
308c : ad 01 d6 LDA $d601 
308f : 09 80 __ ORA #$80
3091 : aa __ __ TAX
3092 : a9 18 __ LDA #$18
3094 : 8d 00 d6 STA $d600 
.l10682:
3097 : 2c 00 d6 BIT $d600 
309a : 10 fb __ BPL $3097 ; (main.l10682 + 0)
.s1960:
309c : 8e 01 d6 STX $d601 
309f : a9 20 __ LDA #$20
30a1 : 8d 00 d6 STA $d600 
.l10684:
30a4 : 2c 00 d6 BIT $d600 
30a7 : 10 fb __ BPL $30a4 ; (main.l10684 + 0)
.s1965:
30a9 : a5 44 __ LDA T14 + 0 
30ab : 8d 01 d6 STA $d601 
30ae : a9 21 __ LDA #$21
30b0 : 8d 00 d6 STA $d600 
.l10686:
30b3 : 2c 00 d6 BIT $d600 
30b6 : 10 fb __ BPL $30b3 ; (main.l10686 + 0)
.s1970:
30b8 : a5 64 __ LDA T11 + 0 
30ba : 8d 01 d6 STA $d601 
30bd : a9 1f __ LDA #$1f
30bf : 8d 00 d6 STA $d600 
30c2 : a9 1e __ LDA #$1e
30c4 : 8d 00 d6 STA $d600 
.l10688:
30c7 : 2c 00 d6 BIT $d600 
30ca : 10 fb __ BPL $30c7 ; (main.l10688 + 0)
.s1976:
30cc : a5 57 __ LDA T3 + 0 
30ce : 8d 01 d6 STA $d601 
.s1624:
30d1 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
30d4 : 18 __ __ CLC
30d5 : 65 59 __ ADC T4 + 0 
30d7 : 85 59 __ STA T4 + 0 
30d9 : ad fa 58 LDA $58fa ; (vdc_state + 4)
30dc : 65 5a __ ADC T4 + 1 
30de : 85 5a __ STA T4 + 1 
30e0 : 18 __ __ CLC
30e1 : a5 5b __ LDA T5 + 0 
30e3 : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
30e6 : 85 5b __ STA T5 + 0 
30e8 : a5 5c __ LDA T5 + 1 
30ea : 6d fa 58 ADC $58fa ; (vdc_state + 4)
30ed : e6 61 __ INC T8 + 0 
30ef : 4c 58 2a JMP $2a58 ; (main.l1620 + 0)
.s1625:
30f2 : 86 0f __ STX P2 
30f4 : 84 10 __ STY P3 
30f6 : 20 38 14 JSR $1438 ; (bnk_cpyfromvdc@proxy + 0)
30f9 : a5 59 __ LDA T4 + 0 
30fb : 85 0d __ STA P0 
30fd : a5 5a __ LDA T4 + 1 
30ff : 85 0e __ STA P1 
3101 : 20 e9 14 JSR $14e9 ; (bnk_cpytovdc@proxy + 0)
3104 : a5 5d __ LDA T6 + 0 
3106 : 85 0f __ STA P2 
3108 : a5 5e __ LDA T6 + 1 
310a : 85 10 __ STA P3 
310c : 20 bd 14 JSR $14bd ; (bnk_cpyfromvdc@proxy + 0)
310f : a5 5b __ LDA T5 + 0 
3111 : 85 0d __ STA P0 
3113 : a5 5c __ LDA T5 + 1 
3115 : 85 0e __ STA P1 
3117 : 20 e9 14 JSR $14e9 ; (bnk_cpytovdc@proxy + 0)
311a : 4c d1 30 JMP $30d1 ; (main.s1624 + 0)
.s1260:
311d : a5 59 __ LDA T4 + 0 
311f : 69 01 __ ADC #$01
3121 : 85 5d __ STA T6 + 0 
3123 : a5 5a __ LDA T4 + 1 
3125 : 69 00 __ ADC #$00
3127 : 85 5e __ STA T6 + 1 
3129 : 18 __ __ CLC
312a : a5 5b __ LDA T5 + 0 
312c : 69 01 __ ADC #$01
312e : 85 5f __ STA T7 + 0 
3130 : a5 5c __ LDA T5 + 1 
3132 : 69 00 __ ADC #$00
3134 : 85 60 __ STA T7 + 1 
3136 : ad f7 58 LDA $58f7 ; (vdc_state + 1)
3139 : d0 11 __ BNE $314c ; (main.s1265 + 0)
.s1267:
313b : a9 03 __ LDA #$03
313d : cd 03 59 CMP $5903 ; (vdc_state + 13)
3140 : d0 05 __ BNE $3147 ; (main.s1224 + 0)
.s1223:
3142 : a9 ff __ LDA #$ff
3144 : cd 02 59 CMP $5902 ; (vdc_state + 12)
.s1224:
3147 : b0 03 __ BCS $314c ; (main.s1265 + 0)
3149 : 4c 37 33 JMP $3337 ; (main.s1264 + 0)
.s1265:
314c : a9 12 __ LDA #$12
314e : 8d 00 d6 STA $d600 
3151 : ac 03 59 LDY $5903 ; (vdc_state + 13)
3154 : ae 02 59 LDX $5902 ; (vdc_state + 12)
.l10574:
3157 : 2c 00 d6 BIT $d600 
315a : 10 fb __ BPL $3157 ; (main.l10574 + 0)
.s1320:
315c : 8c 01 d6 STY $d601 
315f : a9 13 __ LDA #$13
3161 : 8d 00 d6 STA $d600 
.l10576:
3164 : 2c 00 d6 BIT $d600 
3167 : 10 fb __ BPL $3164 ; (main.l10576 + 0)
.s1325:
3169 : 8e 01 d6 STX $d601 
316c : a9 1f __ LDA #$1f
316e : 8d 00 d6 STA $d600 
3171 : a9 18 __ LDA #$18
3173 : 8d 00 d6 STA $d600 
.l10578:
3176 : 2c 00 d6 BIT $d600 
3179 : 10 fb __ BPL $3176 ; (main.l10578 + 0)
.s1332:
317b : ad 01 d6 LDA $d601 
317e : 09 80 __ ORA #$80
3180 : 85 46 __ STA T15 + 0 
3182 : a9 18 __ LDA #$18
3184 : 8d 00 d6 STA $d600 
.l10580:
3187 : 2c 00 d6 BIT $d600 
318a : 10 fb __ BPL $3187 ; (main.l10580 + 0)
.s1338:
318c : a5 46 __ LDA T15 + 0 
318e : 8d 01 d6 STA $d601 
3191 : a9 20 __ LDA #$20
3193 : 8d 00 d6 STA $d600 
.l10582:
3196 : 2c 00 d6 BIT $d600 
3199 : 10 fb __ BPL $3196 ; (main.l10582 + 0)
.s1343:
319b : a5 5a __ LDA T4 + 1 
319d : 8d 01 d6 STA $d601 
31a0 : a9 21 __ LDA #$21
31a2 : 8d 00 d6 STA $d600 
.l10584:
31a5 : 2c 00 d6 BIT $d600 
31a8 : 10 fb __ BPL $31a5 ; (main.l10584 + 0)
.s1348:
31aa : a5 59 __ LDA T4 + 0 
31ac : 8d 01 d6 STA $d601 
31af : a9 1f __ LDA #$1f
31b1 : 8d 00 d6 STA $d600 
31b4 : a9 1e __ LDA #$1e
31b6 : 8d 00 d6 STA $d600 
.l10586:
31b9 : 2c 00 d6 BIT $d600 
31bc : 10 fb __ BPL $31b9 ; (main.l10586 + 0)
.s1354:
31be : a5 57 __ LDA T3 + 0 
31c0 : 8d 01 d6 STA $d601 
31c3 : a9 12 __ LDA #$12
31c5 : 8d 00 d6 STA $d600 
.l10588:
31c8 : 2c 00 d6 BIT $d600 
31cb : 10 fb __ BPL $31c8 ; (main.l10588 + 0)
.s1407:
31cd : a5 5e __ LDA T6 + 1 
31cf : 8d 01 d6 STA $d601 
31d2 : a9 13 __ LDA #$13
31d4 : 8d 00 d6 STA $d600 
.l10590:
31d7 : 2c 00 d6 BIT $d600 
31da : 10 fb __ BPL $31d7 ; (main.l10590 + 0)
.s1412:
31dc : a5 5d __ LDA T6 + 0 
31de : 8d 01 d6 STA $d601 
31e1 : a9 1f __ LDA #$1f
31e3 : 8d 00 d6 STA $d600 
31e6 : a9 18 __ LDA #$18
31e8 : 8d 00 d6 STA $d600 
.l10592:
31eb : 2c 00 d6 BIT $d600 
31ee : 10 fb __ BPL $31eb ; (main.l10592 + 0)
.s1419:
31f0 : ad 01 d6 LDA $d601 
31f3 : 09 80 __ ORA #$80
31f5 : 85 5d __ STA T6 + 0 
31f7 : a9 18 __ LDA #$18
31f9 : 8d 00 d6 STA $d600 
.l10594:
31fc : 2c 00 d6 BIT $d600 
31ff : 10 fb __ BPL $31fc ; (main.l10594 + 0)
.s1425:
3201 : a5 5d __ LDA T6 + 0 
3203 : 8d 01 d6 STA $d601 
3206 : a9 20 __ LDA #$20
3208 : 8d 00 d6 STA $d600 
.l10596:
320b : 2c 00 d6 BIT $d600 
320e : 10 fb __ BPL $320b ; (main.l10596 + 0)
.s1430:
3210 : 8c 01 d6 STY $d601 
3213 : a9 21 __ LDA #$21
3215 : 8d 00 d6 STA $d600 
.l10598:
3218 : 2c 00 d6 BIT $d600 
321b : 10 fb __ BPL $3218 ; (main.l10598 + 0)
.s1435:
321d : 8e 01 d6 STX $d601 
3220 : a9 1f __ LDA #$1f
3222 : 8d 00 d6 STA $d600 
3225 : a9 1e __ LDA #$1e
3227 : 8d 00 d6 STA $d600 
.l10600:
322a : 2c 00 d6 BIT $d600 
322d : 10 fb __ BPL $322a ; (main.l10600 + 0)
.s1441:
322f : a5 57 __ LDA T3 + 0 
3231 : 8d 01 d6 STA $d601 
3234 : a9 12 __ LDA #$12
3236 : 8d 00 d6 STA $d600 
.l10602:
3239 : 2c 00 d6 BIT $d600 
323c : 10 fb __ BPL $3239 ; (main.l10602 + 0)
.s1494:
323e : 8c 01 d6 STY $d601 
3241 : a9 13 __ LDA #$13
3243 : 8d 00 d6 STA $d600 
.l10604:
3246 : 2c 00 d6 BIT $d600 
3249 : 10 fb __ BPL $3246 ; (main.l10604 + 0)
.s1499:
324b : 8e 01 d6 STX $d601 
324e : a9 1f __ LDA #$1f
3250 : 8d 00 d6 STA $d600 
3253 : a9 18 __ LDA #$18
3255 : 8d 00 d6 STA $d600 
.l10606:
3258 : 2c 00 d6 BIT $d600 
325b : 10 fb __ BPL $3258 ; (main.l10606 + 0)
.s1506:
325d : ad 01 d6 LDA $d601 
3260 : 09 80 __ ORA #$80
3262 : 85 5d __ STA T6 + 0 
3264 : a9 18 __ LDA #$18
3266 : 8d 00 d6 STA $d600 
.l10608:
3269 : 2c 00 d6 BIT $d600 
326c : 10 fb __ BPL $3269 ; (main.l10608 + 0)
.s1512:
326e : a5 5d __ LDA T6 + 0 
3270 : 8d 01 d6 STA $d601 
3273 : a9 20 __ LDA #$20
3275 : 8d 00 d6 STA $d600 
.l10610:
3278 : 2c 00 d6 BIT $d600 
327b : 10 fb __ BPL $3278 ; (main.l10610 + 0)
.s1517:
327d : a5 5c __ LDA T5 + 1 
327f : 8d 01 d6 STA $d601 
3282 : a9 21 __ LDA #$21
3284 : 8d 00 d6 STA $d600 
.l10612:
3287 : 2c 00 d6 BIT $d600 
328a : 10 fb __ BPL $3287 ; (main.l10612 + 0)
.s1522:
328c : a5 5b __ LDA T5 + 0 
328e : 8d 01 d6 STA $d601 
3291 : a9 1f __ LDA #$1f
3293 : 8d 00 d6 STA $d600 
3296 : a9 1e __ LDA #$1e
3298 : 8d 00 d6 STA $d600 
.l10614:
329b : 2c 00 d6 BIT $d600 
329e : 10 fb __ BPL $329b ; (main.l10614 + 0)
.s1528:
32a0 : a5 57 __ LDA T3 + 0 
32a2 : 8d 01 d6 STA $d601 
32a5 : a9 12 __ LDA #$12
32a7 : 8d 00 d6 STA $d600 
.l10616:
32aa : 2c 00 d6 BIT $d600 
32ad : 10 fb __ BPL $32aa ; (main.l10616 + 0)
.s1581:
32af : a5 60 __ LDA T7 + 1 
32b1 : 8d 01 d6 STA $d601 
32b4 : a9 13 __ LDA #$13
32b6 : 8d 00 d6 STA $d600 
.l10618:
32b9 : 2c 00 d6 BIT $d600 
32bc : 10 fb __ BPL $32b9 ; (main.l10618 + 0)
.s1586:
32be : a5 5f __ LDA T7 + 0 
32c0 : 8d 01 d6 STA $d601 
32c3 : a9 1f __ LDA #$1f
32c5 : 8d 00 d6 STA $d600 
32c8 : a9 18 __ LDA #$18
32ca : 8d 00 d6 STA $d600 
.l10620:
32cd : 2c 00 d6 BIT $d600 
32d0 : 10 fb __ BPL $32cd ; (main.l10620 + 0)
.s1593:
32d2 : ad 01 d6 LDA $d601 
32d5 : 09 80 __ ORA #$80
32d7 : 85 5d __ STA T6 + 0 
32d9 : a9 18 __ LDA #$18
32db : 8d 00 d6 STA $d600 
.l10622:
32de : 2c 00 d6 BIT $d600 
32e1 : 10 fb __ BPL $32de ; (main.l10622 + 0)
.s1599:
32e3 : a5 5d __ LDA T6 + 0 
32e5 : 8d 01 d6 STA $d601 
32e8 : a9 20 __ LDA #$20
32ea : 8d 00 d6 STA $d600 
.l10624:
32ed : 2c 00 d6 BIT $d600 
32f0 : 10 fb __ BPL $32ed ; (main.l10624 + 0)
.s1604:
32f2 : 8c 01 d6 STY $d601 
32f5 : a9 21 __ LDA #$21
32f7 : 8d 00 d6 STA $d600 
.l10626:
32fa : 2c 00 d6 BIT $d600 
32fd : 10 fb __ BPL $32fa ; (main.l10626 + 0)
.s1609:
32ff : 8e 01 d6 STX $d601 
3302 : a9 1f __ LDA #$1f
3304 : 8d 00 d6 STA $d600 
3307 : a9 1e __ LDA #$1e
3309 : 8d 00 d6 STA $d600 
.l10628:
330c : 2c 00 d6 BIT $d600 
330f : 10 fb __ BPL $330c ; (main.l10628 + 0)
.s1615:
3311 : a5 57 __ LDA T3 + 0 
3313 : 8d 01 d6 STA $d601 
.s1263:
3316 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
3319 : 18 __ __ CLC
331a : 65 59 __ ADC T4 + 0 
331c : 85 59 __ STA T4 + 0 
331e : ad fa 58 LDA $58fa ; (vdc_state + 4)
3321 : 65 5a __ ADC T4 + 1 
3323 : 85 5a __ STA T4 + 1 
3325 : 18 __ __ CLC
3326 : a5 5b __ LDA T5 + 0 
3328 : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
332b : 85 5b __ STA T5 + 0 
332d : a5 5c __ LDA T5 + 1 
332f : 6d fa 58 ADC $58fa ; (vdc_state + 4)
3332 : e6 61 __ INC T8 + 0 
3334 : 4c 02 2a JMP $2a02 ; (main.l1259 + 0)
.s1264:
3337 : a5 59 __ LDA T4 + 0 
3339 : 85 0f __ STA P2 
333b : a5 5a __ LDA T4 + 1 
333d : 85 10 __ STA P3 
333f : 20 38 14 JSR $1438 ; (bnk_cpyfromvdc@proxy + 0)
3342 : a5 5d __ LDA T6 + 0 
3344 : 85 0d __ STA P0 
3346 : a5 5e __ LDA T6 + 1 
3348 : 85 0e __ STA P1 
334a : 20 e9 14 JSR $14e9 ; (bnk_cpytovdc@proxy + 0)
334d : a5 5b __ LDA T5 + 0 
334f : 85 0f __ STA P2 
3351 : a5 5c __ LDA T5 + 1 
3353 : 85 10 __ STA P3 
3355 : 20 bd 14 JSR $14bd ; (bnk_cpyfromvdc@proxy + 0)
3358 : a5 5f __ LDA T7 + 0 
335a : 85 0d __ STA P0 
335c : a5 60 __ LDA T7 + 1 
335e : 85 0e __ STA P1 
3360 : 20 e9 14 JSR $14e9 ; (bnk_cpytovdc@proxy + 0)
3363 : 4c 16 33 JMP $3316 ; (main.s1263 + 0)
.s1195:
3366 : a9 00 __ LDA #$00
3368 : 9d ca be STA $beca,x ; (wrapbuffer + 0)
336b : aa __ __ TAX
336c : ad ca be LDA $beca ; (wrapbuffer + 0)
336f : f0 08 __ BEQ $3379 ; (main.s1201 + 0)
.l1656:
3371 : bd cb be LDA $becb,x ; (wrapbuffer + 1)
3374 : e8 __ __ INX
3375 : 09 00 __ ORA #$00
3377 : d0 f8 __ BNE $3371 ; (main.l1656 + 0)
.s1201:
3379 : 8a __ __ TXA
337a : 18 __ __ CLC
337b : 6d 4f bf ADC $bf4f ; (window + 4)
337e : b0 06 __ BCS $3386 ; (main.s1203 + 0)
.s1262:
3380 : c5 63 __ CMP T10 + 0 
3382 : 90 1a __ BCC $339e ; (main.s1205 + 0)
.s1697:
3384 : f0 18 __ BEQ $339e ; (main.s1205 + 0)
.s1203:
3386 : a9 4b __ LDA #$4b
3388 : a0 02 __ LDY #$02
338a : 91 23 __ STA (SP + 0),y 
338c : a9 bf __ LDA #$bf
338e : c8 __ __ INY
338f : 91 23 __ STA (SP + 0),y 
3391 : a9 fe __ LDA #$fe
3393 : c8 __ __ INY
3394 : 91 23 __ STA (SP + 0),y 
3396 : a9 4a __ LDA #$4a
3398 : c8 __ __ INY
3399 : 91 23 __ STA (SP + 0),y 
339b : 20 18 52 JSR $5218 ; (vdcwin_printline.s1000 + 0)
.s1205:
339e : a9 4b __ LDA #$4b
33a0 : a0 02 __ LDY #$02
33a2 : 91 23 __ STA (SP + 0),y 
33a4 : a9 bf __ LDA #$bf
33a6 : c8 __ __ INY
33a7 : 91 23 __ STA (SP + 0),y 
33a9 : a9 ca __ LDA #$ca
33ab : c8 __ __ INY
33ac : 91 23 __ STA (SP + 0),y 
33ae : a9 be __ LDA #$be
33b0 : c8 __ __ INY
33b1 : 91 23 __ STA (SP + 0),y 
33b3 : 20 f1 54 JSR $54f1 ; (vdcwin_put_string.s1000 + 0)
33b6 : a5 61 __ LDA T8 + 0 
33b8 : c5 59 __ CMP T4 + 0 
33ba : 90 03 __ BCC $33bf ; (main.s7210 + 0)
33bc : 4c 5b 26 JMP $265b ; (main.s1171 + 0)
.s7210:
33bf : a9 00 __ LDA #$00
33c1 : 85 62 __ STA T9 + 0 
33c3 : a9 ff __ LDA #$ff
33c5 : 85 5e __ STA T6 + 1 
33c7 : 85 5c __ STA T5 + 1 
33c9 : 4c 3b 26 JMP $263b ; (main.l1180 + 0)
.s1182:
33cc : a6 61 __ LDX T8 + 0 
33ce : bd 9f 59 LDA $599f,x ; (linebuffer + 0)
33d1 : a6 62 __ LDX T9 + 0 
33d3 : 9d ca be STA $beca,x ; (wrapbuffer + 0)
33d6 : c9 20 __ CMP #$20
33d8 : d0 06 __ BNE $33e0 ; (main.s1186 + 0)
.s1192:
33da : a9 00 __ LDA #$00
33dc : 85 5e __ STA T6 + 1 
33de : f0 08 __ BEQ $33e8 ; (main.s7784 + 0)
.s1186:
33e0 : 24 5c __ BIT T5 + 1 
33e2 : 10 04 __ BPL $33e8 ; (main.s7784 + 0)
.s1189:
33e4 : a9 00 __ LDA #$00
33e6 : 85 5c __ STA T5 + 1 
.s7784:
33e8 : e6 61 __ INC T8 + 0 
33ea : e6 62 __ INC T9 + 0 
33ec : 4c 3b 26 JMP $263b ; (main.l1180 + 0)
.l1085:
33ef : a5 62 __ LDA T9 + 0 
33f1 : 0a __ __ ASL
33f2 : 10 1a __ BPL $340e ; (main.s1090 + 0)
.s1088:
33f4 : a5 56 __ LDA T2 + 0 
33f6 : 85 10 __ STA P3 
33f8 : ae 4b bf LDX $bf4b ; (window + 0)
33fb : ca __ __ DEX
33fc : 86 0d __ STX P0 
33fe : ad 4c bf LDA $bf4c ; (window + 1)
3401 : 18 __ __ CLC
3402 : 65 61 __ ADC T8 + 0 
3404 : 85 0e __ STA P1 
3406 : ad 71 57 LDA $5771 ; (winStyles + 7)
3409 : 85 0f __ STA P2 
340b : 20 30 50 JSR $5030 ; (vdc_printc.s0 + 0)
.s1090:
340e : ad 4c bf LDA $bf4c ; (window + 1)
3411 : 18 __ __ CLC
3412 : 65 61 __ ADC T8 + 0 
3414 : 85 0e __ STA P1 
3416 : 0a __ __ ASL
3417 : aa __ __ TAX
3418 : a9 12 __ LDA #$12
341a : 8d 00 d6 STA $d600 
341d : ad 4d bf LDA $bf4d ; (window + 2)
3420 : 38 __ __ SEC
3421 : e9 01 __ SBC #$01
3423 : 85 5f __ STA T7 + 0 
3425 : ad 4b bf LDA $bf4b ; (window + 0)
3428 : 85 64 __ STA T11 + 0 
342a : 18 __ __ CLC
342b : 7d 0f 59 ADC $590f,x ; (multab + 0)
342e : 85 59 __ STA T4 + 0 
3430 : a9 00 __ LDA #$00
3432 : 7d 10 59 ADC $5910,x ; (multab + 1)
3435 : 85 5a __ STA T4 + 1 
3437 : 18 __ __ CLC
3438 : a5 59 __ LDA T4 + 0 
343a : 6d fe 58 ADC $58fe ; (vdc_state + 8)
343d : a8 __ __ TAY
343e : a5 5a __ LDA T4 + 1 
3440 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
3443 : ae fd 58 LDX $58fd ; (vdc_state + 7)
.l10523:
3446 : 2c 00 d6 BIT $d600 
3449 : 10 fb __ BPL $3446 ; (main.l10523 + 0)
.s1100:
344b : 8d 01 d6 STA $d601 
344e : a9 13 __ LDA #$13
3450 : 8d 00 d6 STA $d600 
.l10525:
3453 : 2c 00 d6 BIT $d600 
3456 : 10 fb __ BPL $3453 ; (main.l10525 + 0)
.s1105:
3458 : 8c 01 d6 STY $d601 
345b : a9 1f __ LDA #$1f
345d : 8d 00 d6 STA $d600 
.l10527:
3460 : 2c 00 d6 BIT $d600 
3463 : 10 fb __ BPL $3460 ; (main.l10527 + 0)
.s1109:
3465 : a9 20 __ LDA #$20
3467 : 8d 01 d6 STA $d601 
346a : a9 18 __ LDA #$18
346c : 8d 00 d6 STA $d600 
.l10529:
346f : 2c 00 d6 BIT $d600 
3472 : 10 fb __ BPL $346f ; (main.l10529 + 0)
.s1115:
3474 : ad 01 d6 LDA $d601 
3477 : 29 7f __ AND #$7f
3479 : a8 __ __ TAY
347a : a9 18 __ LDA #$18
347c : 8d 00 d6 STA $d600 
.l10531:
347f : 2c 00 d6 BIT $d600 
3482 : 10 fb __ BPL $347f ; (main.l10531 + 0)
.s1121:
3484 : 8c 01 d6 STY $d601 
3487 : a9 1e __ LDA #$1e
3489 : 8d 00 d6 STA $d600 
.l10533:
348c : 2c 00 d6 BIT $d600 
348f : 10 fb __ BPL $348c ; (main.l10533 + 0)
.s1126:
3491 : a5 5f __ LDA T7 + 0 
3493 : 8d 01 d6 STA $d601 
3496 : ad 00 59 LDA $5900 ; (vdc_state + 10)
3499 : 18 __ __ CLC
349a : 65 59 __ ADC T4 + 0 
349c : a8 __ __ TAY
349d : a9 12 __ LDA #$12
349f : 8d 00 d6 STA $d600 
34a2 : ad 01 59 LDA $5901 ; (vdc_state + 11)
34a5 : 65 5a __ ADC T4 + 1 
.l10535:
34a7 : 2c 00 d6 BIT $d600 
34aa : 10 fb __ BPL $34a7 ; (main.l10535 + 0)
.s1133:
34ac : 8d 01 d6 STA $d601 
34af : a9 13 __ LDA #$13
34b1 : 8d 00 d6 STA $d600 
.l10537:
34b4 : 2c 00 d6 BIT $d600 
34b7 : 10 fb __ BPL $34b4 ; (main.l10537 + 0)
.s1138:
34b9 : 8c 01 d6 STY $d601 
34bc : a9 1f __ LDA #$1f
34be : 8d 00 d6 STA $d600 
.l10539:
34c1 : 2c 00 d6 BIT $d600 
34c4 : 10 fb __ BPL $34c1 ; (main.l10539 + 0)
.s1142:
34c6 : 8e 01 d6 STX $d601 
34c9 : a9 18 __ LDA #$18
34cb : 8d 00 d6 STA $d600 
.l10541:
34ce : 2c 00 d6 BIT $d600 
34d1 : 10 fb __ BPL $34ce ; (main.l10541 + 0)
.s1148:
34d3 : ad 01 d6 LDA $d601 
34d6 : 29 7f __ AND #$7f
34d8 : aa __ __ TAX
34d9 : a9 18 __ LDA #$18
34db : 8d 00 d6 STA $d600 
.l10543:
34de : 2c 00 d6 BIT $d600 
34e1 : 10 fb __ BPL $34de ; (main.l10543 + 0)
.s1154:
34e3 : 8e 01 d6 STX $d601 
34e6 : a9 1e __ LDA #$1e
34e8 : 8d 00 d6 STA $d600 
.l10545:
34eb : 2c 00 d6 BIT $d600 
34ee : 10 fb __ BPL $34eb ; (main.l10545 + 0)
.s1159:
34f0 : a5 5f __ LDA T7 + 0 
34f2 : 8d 01 d6 STA $d601 
34f5 : a5 62 __ LDA T9 + 0 
34f7 : 29 20 __ AND #$20
34f9 : f0 14 __ BEQ $350f ; (main.s11002 + 0)
.s1160:
34fb : 18 __ __ CLC
34fc : a5 64 __ LDA T11 + 0 
34fe : 6d 4d bf ADC $bf4d ; (window + 2)
3501 : 85 0d __ STA P0 
3503 : a5 56 __ LDA T2 + 0 
3505 : 85 10 __ STA P3 
3507 : ad 72 57 LDA $5772 ; (winStyles + 8)
350a : 85 0f __ STA P2 
350c : 20 30 50 JSR $5030 ; (vdc_printc.s0 + 0)
.s11002:
350f : e6 61 __ INC T8 + 0 
3511 : a5 61 __ LDA T8 + 0 
3513 : cd 4e bf CMP $bf4e ; (window + 3)
3516 : b0 03 __ BCS $351b ; (main.s11002 + 12)
3518 : 4c ef 33 JMP $33ef ; (main.l1085 + 0)
351b : 4c ac 25 JMP $25ac ; (main.s917 + 0)
.s1005:
351e : a5 62 __ LDA T9 + 0 
3520 : 0a __ __ ASL
3521 : 10 15 __ BPL $3538 ; (main.s1011 + 0)
.s1009:
3523 : a5 66 __ LDA T12 + 0 
3525 : 85 0e __ STA P1 
3527 : a5 56 __ LDA T2 + 0 
3529 : 85 10 __ STA P3 
352b : a6 61 __ LDX T8 + 0 
352d : ca __ __ DEX
352e : 86 0d __ STX P0 
3530 : ad 6d 57 LDA $576d ; (winStyles + 3)
3533 : 85 0f __ STA P2 
3535 : 20 30 50 JSR $5030 ; (vdc_printc.s0 + 0)
.s1011:
3538 : a5 66 __ LDA T12 + 0 
353a : 0a __ __ ASL
353b : aa __ __ TAX
353c : a9 12 __ LDA #$12
353e : 8d 00 d6 STA $d600 
3541 : c6 5f __ DEC T7 + 0 
3543 : bd 0f 59 LDA $590f,x ; (multab + 0)
3546 : 18 __ __ CLC
3547 : 65 61 __ ADC T8 + 0 
3549 : 85 54 __ STA T1 + 0 
354b : bd 10 59 LDA $5910,x ; (multab + 1)
354e : 69 00 __ ADC #$00
3550 : a8 __ __ TAY
3551 : 18 __ __ CLC
3552 : a5 54 __ LDA T1 + 0 
3554 : 65 57 __ ADC T3 + 0 
3556 : 85 57 __ STA T3 + 0 
3558 : 98 __ __ TYA
3559 : 65 58 __ ADC T3 + 1 
355b : ae 70 57 LDX $5770 ; (winStyles + 6)
.l10496:
355e : 2c 00 d6 BIT $d600 
3561 : 10 fb __ BPL $355e ; (main.l10496 + 0)
.s1021:
3563 : 8d 01 d6 STA $d601 
3566 : a9 13 __ LDA #$13
3568 : 8d 00 d6 STA $d600 
.l10498:
356b : 2c 00 d6 BIT $d600 
356e : 10 fb __ BPL $356b ; (main.l10498 + 0)
.s1026:
3570 : a5 57 __ LDA T3 + 0 
3572 : 8d 01 d6 STA $d601 
3575 : a9 1f __ LDA #$1f
3577 : 8d 00 d6 STA $d600 
.l10500:
357a : 2c 00 d6 BIT $d600 
357d : 10 fb __ BPL $357a ; (main.l10500 + 0)
.s1030:
357f : 8e 01 d6 STX $d601 
3582 : a9 18 __ LDA #$18
3584 : 8d 00 d6 STA $d600 
.l10502:
3587 : 2c 00 d6 BIT $d600 
358a : 10 fb __ BPL $3587 ; (main.l10502 + 0)
.s1036:
358c : ad 01 d6 LDA $d601 
358f : 29 7f __ AND #$7f
3591 : aa __ __ TAX
3592 : a9 18 __ LDA #$18
3594 : 8d 00 d6 STA $d600 
.l10504:
3597 : 2c 00 d6 BIT $d600 
359a : 10 fb __ BPL $3597 ; (main.l10504 + 0)
.s1042:
359c : 8e 01 d6 STX $d601 
359f : a9 1e __ LDA #$1e
35a1 : 8d 00 d6 STA $d600 
.l10506:
35a4 : 2c 00 d6 BIT $d600 
35a7 : 10 fb __ BPL $35a4 ; (main.l10506 + 0)
.s1047:
35a9 : a5 5f __ LDA T7 + 0 
35ab : 8d 01 d6 STA $d601 
35ae : a9 12 __ LDA #$12
35b0 : 8d 00 d6 STA $d600 
35b3 : 18 __ __ CLC
35b4 : a5 54 __ LDA T1 + 0 
35b6 : 65 59 __ ADC T4 + 0 
35b8 : aa __ __ TAX
35b9 : 98 __ __ TYA
35ba : 65 5a __ ADC T4 + 1 
.l10508:
35bc : 2c 00 d6 BIT $d600 
35bf : 10 fb __ BPL $35bc ; (main.l10508 + 0)
.s1054:
35c1 : 8d 01 d6 STA $d601 
35c4 : a9 13 __ LDA #$13
35c6 : 8d 00 d6 STA $d600 
.l10510:
35c9 : 2c 00 d6 BIT $d600 
35cc : 10 fb __ BPL $35c9 ; (main.l10510 + 0)
.s1059:
35ce : 8e 01 d6 STX $d601 
35d1 : a9 1f __ LDA #$1f
35d3 : 8d 00 d6 STA $d600 
.l10512:
35d6 : 2c 00 d6 BIT $d600 
35d9 : 10 fb __ BPL $35d6 ; (main.l10512 + 0)
.s1063:
35db : a5 56 __ LDA T2 + 0 
35dd : 8d 01 d6 STA $d601 
35e0 : a9 18 __ LDA #$18
35e2 : 8d 00 d6 STA $d600 
.l10514:
35e5 : 2c 00 d6 BIT $d600 
35e8 : 10 fb __ BPL $35e5 ; (main.l10514 + 0)
.s1069:
35ea : ad 01 d6 LDA $d601 
35ed : 29 7f __ AND #$7f
35ef : aa __ __ TAX
35f0 : a9 18 __ LDA #$18
35f2 : 8d 00 d6 STA $d600 
.l10516:
35f5 : 2c 00 d6 BIT $d600 
35f8 : 10 fb __ BPL $35f5 ; (main.l10516 + 0)
.s1075:
35fa : 8e 01 d6 STX $d601 
35fd : a9 1e __ LDA #$1e
35ff : 8d 00 d6 STA $d600 
.l10518:
3602 : 2c 00 d6 BIT $d600 
3605 : 10 fb __ BPL $3602 ; (main.l10518 + 0)
.s1080:
3607 : a5 5f __ LDA T7 + 0 
3609 : 8d 01 d6 STA $d601 
360c : a5 62 __ LDA T9 + 0 
360e : 29 20 __ AND #$20
3610 : d0 03 __ BNE $3615 ; (main.s1081 + 0)
3612 : 4c a0 25 JMP $25a0 ; (main.s2666 + 0)
.s1081:
3615 : a5 66 __ LDA T12 + 0 
3617 : 85 0e __ STA P1 
3619 : ad 6e 57 LDA $576e ; (winStyles + 4)
361c : 85 0f __ STA P2 
361e : 20 4e 57 JSR $574e ; (vdc_printc@proxy + 0)
3621 : 4c a0 25 JMP $25a0 ; (main.s2666 + 0)
.s926:
3624 : 85 63 __ STA T10 + 0 
3626 : a5 62 __ LDA T9 + 0 
3628 : 0a __ __ ASL
3629 : 10 16 __ BPL $3641 ; (main.s932 + 0)
.s930:
362b : a5 56 __ LDA T2 + 0 
362d : 85 10 __ STA P3 
362f : a6 61 __ LDX T8 + 0 
3631 : ca __ __ DEX
3632 : 86 0d __ STX P0 
3634 : a6 63 __ LDX T10 + 0 
3636 : ca __ __ DEX
3637 : 86 0e __ STX P1 
3639 : ad 6b 57 LDA $576b ; (winStyles + 1)
363c : 85 0f __ STA P2 
363e : 20 30 50 JSR $5030 ; (vdc_printc.s0 + 0)
.s932:
3641 : a5 63 __ LDA T10 + 0 
3643 : 38 __ __ SEC
3644 : e9 01 __ SBC #$01
3646 : 85 0e __ STA P1 
3648 : 0a __ __ ASL
3649 : aa __ __ TAX
364a : a9 12 __ LDA #$12
364c : 8d 00 d6 STA $d600 
364f : 38 __ __ SEC
3650 : a5 5f __ LDA T7 + 0 
3652 : e9 01 __ SBC #$01
3654 : 85 46 __ STA T15 + 0 
3656 : 18 __ __ CLC
3657 : a5 61 __ LDA T8 + 0 
3659 : 7d 0f 59 ADC $590f,x ; (multab + 0)
365c : 85 44 __ STA T14 + 0 
365e : a9 00 __ LDA #$00
3660 : 7d 10 59 ADC $5910,x ; (multab + 1)
3663 : a8 __ __ TAY
3664 : 18 __ __ CLC
3665 : a5 44 __ LDA T14 + 0 
3667 : 65 57 __ ADC T3 + 0 
3669 : 85 48 __ STA T16 + 0 
366b : 98 __ __ TYA
366c : 65 58 __ ADC T3 + 1 
366e : ae 6f 57 LDX $576f ; (winStyles + 5)
.l10468:
3671 : 2c 00 d6 BIT $d600 
3674 : 10 fb __ BPL $3671 ; (main.l10468 + 0)
.s942:
3676 : 8d 01 d6 STA $d601 
3679 : a9 13 __ LDA #$13
367b : 8d 00 d6 STA $d600 
.l10470:
367e : 2c 00 d6 BIT $d600 
3681 : 10 fb __ BPL $367e ; (main.l10470 + 0)
.s947:
3683 : a5 48 __ LDA T16 + 0 
3685 : 8d 01 d6 STA $d601 
3688 : a9 1f __ LDA #$1f
368a : 8d 00 d6 STA $d600 
.l10472:
368d : 2c 00 d6 BIT $d600 
3690 : 10 fb __ BPL $368d ; (main.l10472 + 0)
.s951:
3692 : 8e 01 d6 STX $d601 
3695 : a9 18 __ LDA #$18
3697 : 8d 00 d6 STA $d600 
.l10474:
369a : 2c 00 d6 BIT $d600 
369d : 10 fb __ BPL $369a ; (main.l10474 + 0)
.s957:
369f : ad 01 d6 LDA $d601 
36a2 : 29 7f __ AND #$7f
36a4 : aa __ __ TAX
36a5 : a9 18 __ LDA #$18
36a7 : 8d 00 d6 STA $d600 
.l10476:
36aa : 2c 00 d6 BIT $d600 
36ad : 10 fb __ BPL $36aa ; (main.l10476 + 0)
.s963:
36af : 8e 01 d6 STX $d601 
36b2 : a9 1e __ LDA #$1e
36b4 : 8d 00 d6 STA $d600 
.l10478:
36b7 : 2c 00 d6 BIT $d600 
36ba : 10 fb __ BPL $36b7 ; (main.l10478 + 0)
.s968:
36bc : a5 46 __ LDA T15 + 0 
36be : 8d 01 d6 STA $d601 
36c1 : a9 12 __ LDA #$12
36c3 : 8d 00 d6 STA $d600 
36c6 : 18 __ __ CLC
36c7 : a5 44 __ LDA T14 + 0 
36c9 : 65 59 __ ADC T4 + 0 
36cb : aa __ __ TAX
36cc : 98 __ __ TYA
36cd : 65 5a __ ADC T4 + 1 
.l10480:
36cf : 2c 00 d6 BIT $d600 
36d2 : 10 fb __ BPL $36cf ; (main.l10480 + 0)
.s975:
36d4 : 8d 01 d6 STA $d601 
36d7 : a9 13 __ LDA #$13
36d9 : 8d 00 d6 STA $d600 
.l10482:
36dc : 2c 00 d6 BIT $d600 
36df : 10 fb __ BPL $36dc ; (main.l10482 + 0)
.s980:
36e1 : 8e 01 d6 STX $d601 
36e4 : a9 1f __ LDA #$1f
36e6 : 8d 00 d6 STA $d600 
.l10484:
36e9 : 2c 00 d6 BIT $d600 
36ec : 10 fb __ BPL $36e9 ; (main.l10484 + 0)
.s984:
36ee : a5 56 __ LDA T2 + 0 
36f0 : 8d 01 d6 STA $d601 
36f3 : a9 18 __ LDA #$18
36f5 : 8d 00 d6 STA $d600 
.l10486:
36f8 : 2c 00 d6 BIT $d600 
36fb : 10 fb __ BPL $36f8 ; (main.l10486 + 0)
.s990:
36fd : ad 01 d6 LDA $d601 
3700 : 29 7f __ AND #$7f
3702 : aa __ __ TAX
3703 : a9 18 __ LDA #$18
3705 : 8d 00 d6 STA $d600 
.l10488:
3708 : 2c 00 d6 BIT $d600 
370b : 10 fb __ BPL $3708 ; (main.l10488 + 0)
.s996:
370d : 8e 01 d6 STX $d601 
3710 : a9 1e __ LDA #$1e
3712 : 8d 00 d6 STA $d600 
.l10490:
3715 : 2c 00 d6 BIT $d600 
3718 : 10 fb __ BPL $3715 ; (main.l10490 + 0)
.s1001:
371a : a5 46 __ LDA T15 + 0 
371c : 8d 01 d6 STA $d601 
371f : a5 62 __ LDA T9 + 0 
3721 : 29 20 __ AND #$20
3723 : d0 03 __ BNE $3728 ; (main.s1002 + 0)
3725 : 4c 81 25 JMP $2581 ; (main.s10493 + 0)
.s1002:
3728 : ad 6c 57 LDA $576c ; (winStyles + 2)
372b : 85 0f __ STA P2 
372d : 20 4e 57 JSR $574e ; (vdc_printc@proxy + 0)
3730 : 4c 81 25 JMP $2581 ; (main.s10493 + 0)
.s753:
3733 : 0a __ __ ASL
3734 : aa __ __ TAX
3735 : ad fd 58 LDA $58fd ; (vdc_state + 7)
3738 : 85 62 __ STA T9 + 0 
373a : a9 12 __ LDA #$12
373c : 8d 00 d6 STA $d600 
373f : a5 5b __ LDA T5 + 0 
3741 : 38 __ __ SEC
3742 : e9 01 __ SBC #$01
3744 : 85 66 __ STA T12 + 0 
3746 : bd 0f 59 LDA $590f,x ; (multab + 0)
3749 : 85 5f __ STA T7 + 0 
374b : 18 __ __ CLC
374c : 6d fe 58 ADC $58fe ; (vdc_state + 8)
374f : a8 __ __ TAY
3750 : bd 10 59 LDA $5910,x ; (multab + 1)
3753 : 85 60 __ STA T7 + 1 
3755 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l10877:
3758 : 2c 00 d6 BIT $d600 
375b : 10 fb __ BPL $3758 ; (main.l10877 + 0)
.s765:
375d : 8d 01 d6 STA $d601 
3760 : a9 13 __ LDA #$13
3762 : 8d 00 d6 STA $d600 
.l10879:
3765 : 2c 00 d6 BIT $d600 
3768 : 10 fb __ BPL $3765 ; (main.l10879 + 0)
.s770:
376a : 8c 01 d6 STY $d601 
376d : a9 1f __ LDA #$1f
376f : 8d 00 d6 STA $d600 
.l10881:
3772 : 2c 00 d6 BIT $d600 
3775 : 10 fb __ BPL $3772 ; (main.l10881 + 0)
.s774:
3777 : a9 20 __ LDA #$20
3779 : 8d 01 d6 STA $d601 
377c : a9 18 __ LDA #$18
377e : 8d 00 d6 STA $d600 
.l10883:
3781 : 2c 00 d6 BIT $d600 
3784 : 10 fb __ BPL $3781 ; (main.l10883 + 0)
.s780:
3786 : ad 01 d6 LDA $d601 
3789 : 29 7f __ AND #$7f
378b : a8 __ __ TAY
378c : a9 18 __ LDA #$18
378e : 8d 00 d6 STA $d600 
.l10885:
3791 : 2c 00 d6 BIT $d600 
3794 : 10 fb __ BPL $3791 ; (main.l10885 + 0)
.s786:
3796 : 8c 01 d6 STY $d601 
3799 : a9 1e __ LDA #$1e
379b : 8d 00 d6 STA $d600 
.l10887:
379e : 2c 00 d6 BIT $d600 
37a1 : 10 fb __ BPL $379e ; (main.l10887 + 0)
.s791:
37a3 : a5 66 __ LDA T12 + 0 
37a5 : 8d 01 d6 STA $d601 
37a8 : ad 00 59 LDA $5900 ; (vdc_state + 10)
37ab : 18 __ __ CLC
37ac : 65 5f __ ADC T7 + 0 
37ae : aa __ __ TAX
37af : a9 12 __ LDA #$12
37b1 : 8d 00 d6 STA $d600 
37b4 : ad 01 59 LDA $5901 ; (vdc_state + 11)
37b7 : 65 60 __ ADC T7 + 1 
.l10889:
37b9 : 2c 00 d6 BIT $d600 
37bc : 10 fb __ BPL $37b9 ; (main.l10889 + 0)
.s798:
37be : 8d 01 d6 STA $d601 
37c1 : a9 13 __ LDA #$13
37c3 : 8d 00 d6 STA $d600 
.l10891:
37c6 : 2c 00 d6 BIT $d600 
37c9 : 10 fb __ BPL $37c6 ; (main.l10891 + 0)
.s803:
37cb : 8e 01 d6 STX $d601 
37ce : a9 1f __ LDA #$1f
37d0 : 8d 00 d6 STA $d600 
.l10893:
37d3 : 2c 00 d6 BIT $d600 
37d6 : 10 fb __ BPL $37d3 ; (main.l10893 + 0)
.s807:
37d8 : a5 62 __ LDA T9 + 0 
37da : 8d 01 d6 STA $d601 
37dd : a9 18 __ LDA #$18
37df : 8d 00 d6 STA $d600 
.l10895:
37e2 : 2c 00 d6 BIT $d600 
37e5 : 10 fb __ BPL $37e2 ; (main.l10895 + 0)
.s813:
37e7 : ad 01 d6 LDA $d601 
37ea : 29 7f __ AND #$7f
37ec : aa __ __ TAX
37ed : a9 18 __ LDA #$18
37ef : 8d 00 d6 STA $d600 
.l10897:
37f2 : 2c 00 d6 BIT $d600 
37f5 : 10 fb __ BPL $37f2 ; (main.l10897 + 0)
.s819:
37f7 : 8e 01 d6 STX $d601 
37fa : a9 1e __ LDA #$1e
37fc : 8d 00 d6 STA $d600 
.l10899:
37ff : 2c 00 d6 BIT $d600 
3802 : 10 fb __ BPL $37ff ; (main.l10899 + 0)
.s824:
3804 : a5 66 __ LDA T12 + 0 
3806 : 8d 01 d6 STA $d601 
3809 : e6 61 __ INC T8 + 0 
380b : 4c 4a 23 JMP $234a ; (main.l752 + 0)
.s701:
380e : ad 26 bf LDA $bf26 ; (softscroll + 11)
3811 : 69 02 __ ADC #$02
3813 : 8d 26 bf STA $bf26 ; (softscroll + 11)
3816 : 90 03 __ BCC $381b ; (main.s1705 + 0)
.s1704:
3818 : ee 27 bf INC $bf27 ; (softscroll + 12)
.s1705:
381b : a9 01 __ LDA #$01
381d : cd 23 bf CMP $bf23 ; (softscroll + 8)
3820 : b0 03 __ BCS $3825 ; (main.s706 + 0)
3822 : 4c b5 38 JMP $38b5 ; (main.s705 + 0)
.s706:
3825 : a9 06 __ LDA #$06
3827 : 8d 23 bf STA $bf23 ; (softscroll + 8)
382a : ad 20 bf LDA $bf20 ; (softscroll + 5)
382d : 18 __ __ CLC
382e : 69 01 __ ADC #$01
3830 : 85 5d __ STA T6 + 0 
3832 : 8d 20 bf STA $bf20 ; (softscroll + 5)
3835 : ad 21 bf LDA $bf21 ; (softscroll + 6)
3838 : 69 00 __ ADC #$00
383a : 85 5e __ STA T6 + 1 
383c : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l10908:
383f : ad 00 d6 LDA $d600 
3842 : 29 20 __ AND #$20
3844 : d0 f9 __ BNE $383f ; (main.l10908 + 0)
.s716:
3846 : ad 00 59 LDA $5900 ; (vdc_state + 10)
3849 : 18 __ __ CLC
384a : 65 5d __ ADC T6 + 0 
384c : aa __ __ TAX
384d : ad 01 59 LDA $5901 ; (vdc_state + 11)
3850 : 65 5e __ ADC T6 + 1 
3852 : a8 __ __ TAY
3853 : ad fe 58 LDA $58fe ; (vdc_state + 8)
3856 : 18 __ __ CLC
3857 : 65 5d __ ADC T6 + 0 
3859 : 85 5d __ STA T6 + 0 
385b : a9 0c __ LDA #$0c
385d : 8d 00 d6 STA $d600 
3860 : ad ff 58 LDA $58ff ; (vdc_state + 9)
3863 : 65 5e __ ADC T6 + 1 
.l10910:
3865 : 2c 00 d6 BIT $d600 
3868 : 10 fb __ BPL $3865 ; (main.l10910 + 0)
.s724:
386a : 8d 01 d6 STA $d601 
386d : a9 0d __ LDA #$0d
386f : 8d 00 d6 STA $d600 
.l10912:
3872 : 2c 00 d6 BIT $d600 
3875 : 10 fb __ BPL $3872 ; (main.l10912 + 0)
.s729:
3877 : a5 5d __ LDA T6 + 0 
3879 : 8d 01 d6 STA $d601 
387c : a9 14 __ LDA #$14
387e : 8d 00 d6 STA $d600 
.l10914:
3881 : 2c 00 d6 BIT $d600 
3884 : 10 fb __ BPL $3881 ; (main.l10914 + 0)
.s734:
3886 : 8c 01 d6 STY $d601 
3889 : a9 15 __ LDA #$15
388b : 8d 00 d6 STA $d600 
.l10916:
388e : 2c 00 d6 BIT $d600 
3891 : 10 fb __ BPL $388e ; (main.l10916 + 0)
.s739:
3893 : 8e 01 d6 STX $d601 
.l10918:
3896 : ad 00 d6 LDA $d600 
3899 : 29 20 __ AND #$20
389b : f0 f9 __ BEQ $3896 ; (main.l10918 + 0)
.s740:
389d : a9 19 __ LDA #$19
389f : 8d 00 d6 STA $d600 
38a2 : ad 25 bf LDA $bf25 ; (softscroll + 10)
38a5 : 18 __ __ CLC
38a6 : 69 06 __ ADC #$06
.l10874:
38a8 : 2c 00 d6 BIT $d600 
38ab : 10 fb __ BPL $38a8 ; (main.l10874 + 0)
.s15835:
38ad : 8d 01 d6 STA $d601 
38b0 : a5 1b __ LDA ACCU + 0 
38b2 : 4c 35 23 JMP $2335 ; (main.s748 + 0)
.s705:
38b5 : ad 23 bf LDA $bf23 ; (softscroll + 8)
38b8 : 38 __ __ SEC
38b9 : e9 02 __ SBC #$02
38bb : 8d 23 bf STA $bf23 ; (softscroll + 8)
38be : aa __ __ TAX
.l10873:
38bf : ad 00 d6 LDA $d600 
38c2 : 29 20 __ AND #$20
38c4 : f0 f9 __ BEQ $38bf ; (main.l10873 + 0)
.s708:
38c6 : a9 19 __ LDA #$19
38c8 : 8d 00 d6 STA $d600 
38cb : 8a __ __ TXA
38cc : 18 __ __ CLC
38cd : 6d 25 bf ADC $bf25 ; (softscroll + 10)
38d0 : 4c a8 38 JMP $38a8 ; (main.l10874 + 0)
.s653:
38d3 : a9 00 __ LDA #$00
38d5 : 8d 23 bf STA $bf23 ; (softscroll + 8)
38d8 : ad 20 bf LDA $bf20 ; (softscroll + 5)
38db : 18 __ __ CLC
38dc : 69 ff __ ADC #$ff
38de : 85 5d __ STA T6 + 0 
38e0 : 8d 20 bf STA $bf20 ; (softscroll + 5)
38e3 : ad 21 bf LDA $bf21 ; (softscroll + 6)
38e6 : 69 ff __ ADC #$ff
38e8 : 85 5e __ STA T6 + 1 
38ea : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l10856:
38ed : ad 00 d6 LDA $d600 
38f0 : 29 20 __ AND #$20
38f2 : d0 f9 __ BNE $38ed ; (main.l10856 + 0)
.s656:
38f4 : ad 00 59 LDA $5900 ; (vdc_state + 10)
38f7 : 18 __ __ CLC
38f8 : 65 5d __ ADC T6 + 0 
38fa : aa __ __ TAX
38fb : ad 01 59 LDA $5901 ; (vdc_state + 11)
38fe : 65 5e __ ADC T6 + 1 
3900 : a8 __ __ TAY
3901 : ad fe 58 LDA $58fe ; (vdc_state + 8)
3904 : 18 __ __ CLC
3905 : 65 5d __ ADC T6 + 0 
3907 : 85 5d __ STA T6 + 0 
3909 : a9 0c __ LDA #$0c
390b : 8d 00 d6 STA $d600 
390e : ad ff 58 LDA $58ff ; (vdc_state + 9)
3911 : 65 5e __ ADC T6 + 1 
.l10858:
3913 : 2c 00 d6 BIT $d600 
3916 : 10 fb __ BPL $3913 ; (main.l10858 + 0)
.s664:
3918 : 8d 01 d6 STA $d601 
391b : a9 0d __ LDA #$0d
391d : 8d 00 d6 STA $d600 
.l10860:
3920 : 2c 00 d6 BIT $d600 
3923 : 10 fb __ BPL $3920 ; (main.l10860 + 0)
.s669:
3925 : a5 5d __ LDA T6 + 0 
3927 : 8d 01 d6 STA $d601 
392a : a9 14 __ LDA #$14
392c : 8d 00 d6 STA $d600 
.l10862:
392f : 2c 00 d6 BIT $d600 
3932 : 10 fb __ BPL $392f ; (main.l10862 + 0)
.s674:
3934 : 8c 01 d6 STY $d601 
3937 : a9 15 __ LDA #$15
3939 : 8d 00 d6 STA $d600 
.l10864:
393c : 2c 00 d6 BIT $d600 
393f : 10 fb __ BPL $393c ; (main.l10864 + 0)
.s679:
3941 : 8e 01 d6 STX $d601 
.l10866:
3944 : ad 00 d6 LDA $d600 
3947 : 29 20 __ AND #$20
3949 : f0 f9 __ BEQ $3944 ; (main.l10866 + 0)
.l685:
394b : ad 00 d6 LDA $d600 
394e : 29 20 __ AND #$20
3950 : d0 f9 __ BNE $394b ; (main.l685 + 0)
.s680:
3952 : a9 19 __ LDA #$19
3954 : 8d 00 d6 STA $d600 
3957 : ae 25 bf LDX $bf25 ; (softscroll + 10)
.l10868:
395a : 2c 00 d6 BIT $d600 
395d : 10 fb __ BPL $395a ; (main.l10868 + 0)
.s691:
395f : 8a __ __ TXA
3960 : 4c 00 23 JMP $2300 ; (main.s1660 + 0)
.l600:
3963 : ad 00 d6 LDA $d600 
3966 : 29 20 __ AND #$20
3968 : f0 f9 __ BEQ $3963 ; (main.l600 + 0)
.l609:
396a : ad 00 d6 LDA $d600 
396d : 29 20 __ AND #$20
396f : d0 f9 __ BNE $396a ; (main.l609 + 0)
.s604:
3971 : 8a __ __ TXA
3972 : 18 __ __ CLC
3973 : 69 02 __ ADC #$02
3975 : 8d 28 bf STA $bf28 ; (softscroll + 13)
3978 : 90 01 __ BCC $397b ; (main.s1707 + 0)
.s1706:
397a : c8 __ __ INY
.s1707:
397b : 8c 29 bf STY $bf29 ; (softscroll + 14)
397e : ee 22 bf INC $bf22 ; (softscroll + 7)
3981 : ee 22 bf INC $bf22 ; (softscroll + 7)
3984 : a9 06 __ LDA #$06
3986 : cd 22 bf CMP $bf22 ; (softscroll + 7)
3989 : a9 18 __ LDA #$18
398b : 8d 00 d6 STA $d600 
398e : ae 24 bf LDX $bf24 ; (softscroll + 9)
3991 : 90 10 __ BCC $39a3 ; (main.s611 + 0)
.s612:
3993 : 8a __ __ TXA
3994 : 18 __ __ CLC
3995 : 6d 22 bf ADC $bf22 ; (softscroll + 7)
.l10926:
3998 : 2c 00 d6 BIT $d600 
399b : 10 fb __ BPL $3998 ; (main.l10926 + 0)
.s1659:
399d : 8d 01 d6 STA $d601 
39a0 : 4c c0 22 JMP $22c0 ; (main.s598 + 0)
.s611:
39a3 : a9 00 __ LDA #$00
39a5 : 8d 22 bf STA $bf22 ; (softscroll + 7)
39a8 : ad 20 bf LDA $bf20 ; (softscroll + 5)
39ab : 6d 1e bf ADC $bf1e ; (softscroll + 3)
39ae : 85 5d __ STA T6 + 0 
39b0 : 8d 20 bf STA $bf20 ; (softscroll + 5)
39b3 : ad 21 bf LDA $bf21 ; (softscroll + 6)
39b6 : 69 00 __ ADC #$00
39b8 : 85 5e __ STA T6 + 1 
39ba : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l10843:
39bd : 2c 00 d6 BIT $d600 
39c0 : 10 fb __ BPL $39bd ; (main.l10843 + 0)
.s618:
39c2 : 8e 01 d6 STX $d601 
39c5 : ad 00 59 LDA $5900 ; (vdc_state + 10)
39c8 : 18 __ __ CLC
39c9 : 65 5d __ ADC T6 + 0 
39cb : aa __ __ TAX
39cc : ad 01 59 LDA $5901 ; (vdc_state + 11)
39cf : 65 5e __ ADC T6 + 1 
39d1 : a8 __ __ TAY
39d2 : ad fe 58 LDA $58fe ; (vdc_state + 8)
39d5 : 18 __ __ CLC
39d6 : 65 5d __ ADC T6 + 0 
39d8 : 85 5d __ STA T6 + 0 
39da : a9 0c __ LDA #$0c
39dc : 8d 00 d6 STA $d600 
39df : ad ff 58 LDA $58ff ; (vdc_state + 9)
39e2 : 65 5e __ ADC T6 + 1 
.l10845:
39e4 : 2c 00 d6 BIT $d600 
39e7 : 10 fb __ BPL $39e4 ; (main.l10845 + 0)
.s624:
39e9 : 8d 01 d6 STA $d601 
39ec : a9 0d __ LDA #$0d
39ee : 8d 00 d6 STA $d600 
.l10847:
39f1 : 2c 00 d6 BIT $d600 
39f4 : 10 fb __ BPL $39f1 ; (main.l10847 + 0)
.s629:
39f6 : a5 5d __ LDA T6 + 0 
39f8 : 8d 01 d6 STA $d601 
39fb : a9 14 __ LDA #$14
39fd : 8d 00 d6 STA $d600 
.l10849:
3a00 : 2c 00 d6 BIT $d600 
3a03 : 10 fb __ BPL $3a00 ; (main.l10849 + 0)
.s634:
3a05 : 8c 01 d6 STY $d601 
3a08 : a9 15 __ LDA #$15
3a0a : 8d 00 d6 STA $d600 
.l10851:
3a0d : 2c 00 d6 BIT $d600 
3a10 : 10 fb __ BPL $3a0d ; (main.l10851 + 0)
.s639:
3a12 : 8a __ __ TXA
3a13 : 4c 9d 39 JMP $399d ; (main.s1659 + 0)
.l548:
3a16 : ad 00 d6 LDA $d600 
3a19 : 29 20 __ AND #$20
3a1b : f0 f9 __ BEQ $3a16 ; (main.l548 + 0)
.l557:
3a1d : ad 00 d6 LDA $d600 
3a20 : 29 20 __ AND #$20
3a22 : d0 f9 __ BNE $3a1d ; (main.l557 + 0)
.s552:
3a24 : 8a __ __ TXA
3a25 : 38 __ __ SEC
3a26 : e9 02 __ SBC #$02
3a28 : 8d 28 bf STA $bf28 ; (softscroll + 13)
3a2b : a5 5e __ LDA T6 + 1 
3a2d : e9 00 __ SBC #$00
3a2f : 8d 29 bf STA $bf29 ; (softscroll + 14)
3a32 : a9 01 __ LDA #$01
3a34 : cd 22 bf CMP $bf22 ; (softscroll + 7)
3a37 : b0 03 __ BCS $3a3c ; (main.s560 + 0)
3a39 : 4c c6 3a JMP $3ac6 ; (main.s559 + 0)
.s560:
3a3c : a9 06 __ LDA #$06
3a3e : 8d 22 bf STA $bf22 ; (softscroll + 7)
3a41 : ad 20 bf LDA $bf20 ; (softscroll + 5)
3a44 : ed 1e bf SBC $bf1e ; (softscroll + 3)
3a47 : 85 5d __ STA T6 + 0 
3a49 : 8d 20 bf STA $bf20 ; (softscroll + 5)
3a4c : ad 21 bf LDA $bf21 ; (softscroll + 6)
3a4f : e9 00 __ SBC #$00
3a51 : 85 5e __ STA T6 + 1 
3a53 : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l10930:
3a56 : ad 00 d6 LDA $d600 
3a59 : 29 20 __ AND #$20
3a5b : d0 f9 __ BNE $3a56 ; (main.l10930 + 0)
.s567:
3a5d : a9 18 __ LDA #$18
3a5f : 8d 00 d6 STA $d600 
3a62 : ad 24 bf LDA $bf24 ; (softscroll + 9)
3a65 : 18 __ __ CLC
3a66 : 69 06 __ ADC #$06
.l10932:
3a68 : 2c 00 d6 BIT $d600 
3a6b : 10 fb __ BPL $3a68 ; (main.l10932 + 0)
.s574:
3a6d : 8d 01 d6 STA $d601 
3a70 : ad 00 59 LDA $5900 ; (vdc_state + 10)
3a73 : 18 __ __ CLC
3a74 : 65 5d __ ADC T6 + 0 
3a76 : aa __ __ TAX
3a77 : ad 01 59 LDA $5901 ; (vdc_state + 11)
3a7a : 65 5e __ ADC T6 + 1 
3a7c : a8 __ __ TAY
3a7d : ad fe 58 LDA $58fe ; (vdc_state + 8)
3a80 : 18 __ __ CLC
3a81 : 65 5d __ ADC T6 + 0 
3a83 : 85 5d __ STA T6 + 0 
3a85 : a9 0c __ LDA #$0c
3a87 : 8d 00 d6 STA $d600 
3a8a : ad ff 58 LDA $58ff ; (vdc_state + 9)
3a8d : 65 5e __ ADC T6 + 1 
.l10934:
3a8f : 2c 00 d6 BIT $d600 
3a92 : 10 fb __ BPL $3a8f ; (main.l10934 + 0)
.s580:
3a94 : 8d 01 d6 STA $d601 
3a97 : a9 0d __ LDA #$0d
3a99 : 8d 00 d6 STA $d600 
.l10936:
3a9c : 2c 00 d6 BIT $d600 
3a9f : 10 fb __ BPL $3a9c ; (main.l10936 + 0)
.s585:
3aa1 : a5 5d __ LDA T6 + 0 
3aa3 : 8d 01 d6 STA $d601 
3aa6 : a9 14 __ LDA #$14
3aa8 : 8d 00 d6 STA $d600 
.l10938:
3aab : 2c 00 d6 BIT $d600 
3aae : 10 fb __ BPL $3aab ; (main.l10938 + 0)
.s590:
3ab0 : 8c 01 d6 STY $d601 
3ab3 : a9 15 __ LDA #$15
3ab5 : 8d 00 d6 STA $d600 
.l10940:
3ab8 : 2c 00 d6 BIT $d600 
3abb : 10 fb __ BPL $3ab8 ; (main.l10940 + 0)
.s595:
3abd : 8a __ __ TXA
.s1658:
3abe : 8d 01 d6 STA $d601 
3ac1 : a5 1b __ LDA ACCU + 0 
3ac3 : 4c 99 22 JMP $2299 ; (main.s599 + 0)
.s559:
3ac6 : ce 22 bf DEC $bf22 ; (softscroll + 7)
3ac9 : ce 22 bf DEC $bf22 ; (softscroll + 7)
3acc : a9 18 __ LDA #$18
3ace : 8d 00 d6 STA $d600 
3ad1 : ad 22 bf LDA $bf22 ; (softscroll + 7)
3ad4 : 6d 24 bf ADC $bf24 ; (softscroll + 9)
.l10837:
3ad7 : 2c 00 d6 BIT $d600 
3ada : 10 fb __ BPL $3ad7 ; (main.l10837 + 0)
3adc : 4c be 3a JMP $3abe ; (main.s1658 + 0)
.l408:
3adf : 0a __ __ ASL
3ae0 : aa __ __ TAX
3ae1 : ad fd 58 LDA $58fd ; (vdc_state + 7)
3ae4 : 85 62 __ STA T9 + 0 
3ae6 : a9 12 __ LDA #$12
3ae8 : 8d 00 d6 STA $d600 
3aeb : a5 5b __ LDA T5 + 0 
3aed : 38 __ __ SEC
3aee : e9 01 __ SBC #$01
3af0 : 85 66 __ STA T12 + 0 
3af2 : bd 0f 59 LDA $590f,x ; (multab + 0)
3af5 : 85 5d __ STA T6 + 0 
3af7 : 18 __ __ CLC
3af8 : 6d fe 58 ADC $58fe ; (vdc_state + 8)
3afb : a8 __ __ TAY
3afc : bd 10 59 LDA $5910,x ; (multab + 1)
3aff : 85 5e __ STA T6 + 1 
3b01 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l10788:
3b04 : 2c 00 d6 BIT $d600 
3b07 : 10 fb __ BPL $3b04 ; (main.l10788 + 0)
.s420:
3b09 : 8d 01 d6 STA $d601 
3b0c : a9 13 __ LDA #$13
3b0e : 8d 00 d6 STA $d600 
.l10790:
3b11 : 2c 00 d6 BIT $d600 
3b14 : 10 fb __ BPL $3b11 ; (main.l10790 + 0)
.s425:
3b16 : 8c 01 d6 STY $d601 
3b19 : a9 1f __ LDA #$1f
3b1b : 8d 00 d6 STA $d600 
.l10792:
3b1e : 2c 00 d6 BIT $d600 
3b21 : 10 fb __ BPL $3b1e ; (main.l10792 + 0)
.s429:
3b23 : a9 20 __ LDA #$20
3b25 : 8d 01 d6 STA $d601 
3b28 : a9 18 __ LDA #$18
3b2a : 8d 00 d6 STA $d600 
.l10794:
3b2d : 2c 00 d6 BIT $d600 
3b30 : 10 fb __ BPL $3b2d ; (main.l10794 + 0)
.s435:
3b32 : ad 01 d6 LDA $d601 
3b35 : 29 7f __ AND #$7f
3b37 : a8 __ __ TAY
3b38 : a9 18 __ LDA #$18
3b3a : 8d 00 d6 STA $d600 
.l10796:
3b3d : 2c 00 d6 BIT $d600 
3b40 : 10 fb __ BPL $3b3d ; (main.l10796 + 0)
.s441:
3b42 : 8c 01 d6 STY $d601 
3b45 : a9 1e __ LDA #$1e
3b47 : 8d 00 d6 STA $d600 
.l10798:
3b4a : 2c 00 d6 BIT $d600 
3b4d : 10 fb __ BPL $3b4a ; (main.l10798 + 0)
.s446:
3b4f : a5 66 __ LDA T12 + 0 
3b51 : 8d 01 d6 STA $d601 
3b54 : ad 00 59 LDA $5900 ; (vdc_state + 10)
3b57 : 18 __ __ CLC
3b58 : 65 5d __ ADC T6 + 0 
3b5a : aa __ __ TAX
3b5b : a9 12 __ LDA #$12
3b5d : 8d 00 d6 STA $d600 
3b60 : ad 01 59 LDA $5901 ; (vdc_state + 11)
3b63 : 65 5e __ ADC T6 + 1 
.l10800:
3b65 : 2c 00 d6 BIT $d600 
3b68 : 10 fb __ BPL $3b65 ; (main.l10800 + 0)
.s453:
3b6a : 8d 01 d6 STA $d601 
3b6d : a9 13 __ LDA #$13
3b6f : 8d 00 d6 STA $d600 
.l10802:
3b72 : 2c 00 d6 BIT $d600 
3b75 : 10 fb __ BPL $3b72 ; (main.l10802 + 0)
.s458:
3b77 : 8e 01 d6 STX $d601 
3b7a : a9 1f __ LDA #$1f
3b7c : 8d 00 d6 STA $d600 
.l10804:
3b7f : 2c 00 d6 BIT $d600 
3b82 : 10 fb __ BPL $3b7f ; (main.l10804 + 0)
.s462:
3b84 : a5 62 __ LDA T9 + 0 
3b86 : 8d 01 d6 STA $d601 
3b89 : a9 18 __ LDA #$18
3b8b : 8d 00 d6 STA $d600 
.l10806:
3b8e : 2c 00 d6 BIT $d600 
3b91 : 10 fb __ BPL $3b8e ; (main.l10806 + 0)
.s468:
3b93 : ad 01 d6 LDA $d601 
3b96 : 29 7f __ AND #$7f
3b98 : aa __ __ TAX
3b99 : a9 18 __ LDA #$18
3b9b : 8d 00 d6 STA $d600 
.l10808:
3b9e : 2c 00 d6 BIT $d600 
3ba1 : 10 fb __ BPL $3b9e ; (main.l10808 + 0)
.s474:
3ba3 : 8e 01 d6 STX $d601 
3ba6 : a9 1e __ LDA #$1e
3ba8 : 8d 00 d6 STA $d600 
.l10810:
3bab : 2c 00 d6 BIT $d600 
3bae : 10 fb __ BPL $3bab ; (main.l10810 + 0)
.s479:
3bb0 : a5 66 __ LDA T12 + 0 
3bb2 : 8d 01 d6 STA $d601 
3bb5 : e6 61 __ INC T8 + 0 
3bb7 : a5 61 __ LDA T8 + 0 
3bb9 : c5 5f __ CMP T7 + 0 
3bbb : b0 03 __ BCS $3bc0 ; (main.s479 + 16)
3bbd : 4c df 3a JMP $3adf ; (main.l408 + 0)
3bc0 : 4c 55 21 JMP $2155 ; (main.s405 + 0)
.s299:
3bc3 : 0a __ __ ASL
3bc4 : aa __ __ TAX
3bc5 : ad fd 58 LDA $58fd ; (vdc_state + 7)
3bc8 : 85 56 __ STA T2 + 0 
3bca : a9 12 __ LDA #$12
3bcc : 8d 00 d6 STA $d600 
3bcf : a5 54 __ LDA T1 + 0 
3bd1 : 38 __ __ SEC
3bd2 : e9 01 __ SBC #$01
3bd4 : 85 5d __ STA T6 + 0 
3bd6 : bd 0f 59 LDA $590f,x ; (multab + 0)
3bd9 : 85 59 __ STA T4 + 0 
3bdb : 18 __ __ CLC
3bdc : 6d fe 58 ADC $58fe ; (vdc_state + 8)
3bdf : a8 __ __ TAY
3be0 : bd 10 59 LDA $5910,x ; (multab + 1)
3be3 : 85 5a __ STA T4 + 1 
3be5 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l10975:
3be8 : 2c 00 d6 BIT $d600 
3beb : 10 fb __ BPL $3be8 ; (main.l10975 + 0)
.s311:
3bed : 8d 01 d6 STA $d601 
3bf0 : a9 13 __ LDA #$13
3bf2 : 8d 00 d6 STA $d600 
.l10977:
3bf5 : 2c 00 d6 BIT $d600 
3bf8 : 10 fb __ BPL $3bf5 ; (main.l10977 + 0)
.s316:
3bfa : 8c 01 d6 STY $d601 
3bfd : a9 1f __ LDA #$1f
3bff : 8d 00 d6 STA $d600 
.l10979:
3c02 : 2c 00 d6 BIT $d600 
3c05 : 10 fb __ BPL $3c02 ; (main.l10979 + 0)
.s320:
3c07 : a9 20 __ LDA #$20
3c09 : 8d 01 d6 STA $d601 
3c0c : a9 18 __ LDA #$18
3c0e : 8d 00 d6 STA $d600 
.l10981:
3c11 : 2c 00 d6 BIT $d600 
3c14 : 10 fb __ BPL $3c11 ; (main.l10981 + 0)
.s326:
3c16 : ad 01 d6 LDA $d601 
3c19 : 29 7f __ AND #$7f
3c1b : a8 __ __ TAY
3c1c : a9 18 __ LDA #$18
3c1e : 8d 00 d6 STA $d600 
.l10983:
3c21 : 2c 00 d6 BIT $d600 
3c24 : 10 fb __ BPL $3c21 ; (main.l10983 + 0)
.s332:
3c26 : 8c 01 d6 STY $d601 
3c29 : a9 1e __ LDA #$1e
3c2b : 8d 00 d6 STA $d600 
.l10985:
3c2e : 2c 00 d6 BIT $d600 
3c31 : 10 fb __ BPL $3c2e ; (main.l10985 + 0)
.s337:
3c33 : a5 5d __ LDA T6 + 0 
3c35 : 8d 01 d6 STA $d601 
3c38 : ad 00 59 LDA $5900 ; (vdc_state + 10)
3c3b : 18 __ __ CLC
3c3c : 65 59 __ ADC T4 + 0 
3c3e : aa __ __ TAX
3c3f : a9 12 __ LDA #$12
3c41 : 8d 00 d6 STA $d600 
3c44 : ad 01 59 LDA $5901 ; (vdc_state + 11)
3c47 : 65 5a __ ADC T4 + 1 
.l10987:
3c49 : 2c 00 d6 BIT $d600 
3c4c : 10 fb __ BPL $3c49 ; (main.l10987 + 0)
.s344:
3c4e : 8d 01 d6 STA $d601 
3c51 : a9 13 __ LDA #$13
3c53 : 8d 00 d6 STA $d600 
.l10989:
3c56 : 2c 00 d6 BIT $d600 
3c59 : 10 fb __ BPL $3c56 ; (main.l10989 + 0)
.s349:
3c5b : 8e 01 d6 STX $d601 
3c5e : a9 1f __ LDA #$1f
3c60 : 8d 00 d6 STA $d600 
.l10991:
3c63 : 2c 00 d6 BIT $d600 
3c66 : 10 fb __ BPL $3c63 ; (main.l10991 + 0)
.s353:
3c68 : a5 56 __ LDA T2 + 0 
3c6a : 8d 01 d6 STA $d601 
3c6d : a9 18 __ LDA #$18
3c6f : 8d 00 d6 STA $d600 
.l10993:
3c72 : 2c 00 d6 BIT $d600 
3c75 : 10 fb __ BPL $3c72 ; (main.l10993 + 0)
.s359:
3c77 : ad 01 d6 LDA $d601 
3c7a : 29 7f __ AND #$7f
3c7c : aa __ __ TAX
3c7d : a9 18 __ LDA #$18
3c7f : 8d 00 d6 STA $d600 
.l10995:
3c82 : 2c 00 d6 BIT $d600 
3c85 : 10 fb __ BPL $3c82 ; (main.l10995 + 0)
.s365:
3c87 : 8e 01 d6 STX $d601 
3c8a : a9 1e __ LDA #$1e
3c8c : 8d 00 d6 STA $d600 
.l10997:
3c8f : 2c 00 d6 BIT $d600 
3c92 : 10 fb __ BPL $3c8f ; (main.l10997 + 0)
.s370:
3c94 : a5 5d __ LDA T6 + 0 
3c96 : 8d 01 d6 STA $d601 
3c99 : e6 53 __ INC T0 + 0 
3c9b : 4c 7c 1f JMP $1f7c ; (main.l298 + 0)
.s101:
3c9e : 0a __ __ ASL
3c9f : aa __ __ TAX
3ca0 : ad fd 58 LDA $58fd ; (vdc_state + 7)
3ca3 : 85 56 __ STA T2 + 0 
3ca5 : a9 12 __ LDA #$12
3ca7 : 8d 00 d6 STA $d600 
3caa : a5 54 __ LDA T1 + 0 
3cac : 38 __ __ SEC
3cad : e9 01 __ SBC #$01
3caf : 85 5d __ STA T6 + 0 
3cb1 : bd 0f 59 LDA $590f,x ; (multab + 0)
3cb4 : 85 59 __ STA T4 + 0 
3cb6 : 18 __ __ CLC
3cb7 : 6d fe 58 ADC $58fe ; (vdc_state + 8)
3cba : a8 __ __ TAY
3cbb : bd 10 59 LDA $5910,x ; (multab + 1)
3cbe : 85 5a __ STA T4 + 1 
3cc0 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l10404:
3cc3 : 2c 00 d6 BIT $d600 
3cc6 : 10 fb __ BPL $3cc3 ; (main.l10404 + 0)
.s113:
3cc8 : 8d 01 d6 STA $d601 
3ccb : a9 13 __ LDA #$13
3ccd : 8d 00 d6 STA $d600 
.l10406:
3cd0 : 2c 00 d6 BIT $d600 
3cd3 : 10 fb __ BPL $3cd0 ; (main.l10406 + 0)
.s118:
3cd5 : 8c 01 d6 STY $d601 
3cd8 : a9 1f __ LDA #$1f
3cda : 8d 00 d6 STA $d600 
.l10408:
3cdd : 2c 00 d6 BIT $d600 
3ce0 : 10 fb __ BPL $3cdd ; (main.l10408 + 0)
.s122:
3ce2 : a9 20 __ LDA #$20
3ce4 : 8d 01 d6 STA $d601 
3ce7 : a9 18 __ LDA #$18
3ce9 : 8d 00 d6 STA $d600 
.l10410:
3cec : 2c 00 d6 BIT $d600 
3cef : 10 fb __ BPL $3cec ; (main.l10410 + 0)
.s128:
3cf1 : ad 01 d6 LDA $d601 
3cf4 : 29 7f __ AND #$7f
3cf6 : a8 __ __ TAY
3cf7 : a9 18 __ LDA #$18
3cf9 : 8d 00 d6 STA $d600 
.l10412:
3cfc : 2c 00 d6 BIT $d600 
3cff : 10 fb __ BPL $3cfc ; (main.l10412 + 0)
.s134:
3d01 : 8c 01 d6 STY $d601 
3d04 : a9 1e __ LDA #$1e
3d06 : 8d 00 d6 STA $d600 
.l10414:
3d09 : 2c 00 d6 BIT $d600 
3d0c : 10 fb __ BPL $3d09 ; (main.l10414 + 0)
.s139:
3d0e : a5 5d __ LDA T6 + 0 
3d10 : 8d 01 d6 STA $d601 
3d13 : ad 00 59 LDA $5900 ; (vdc_state + 10)
3d16 : 18 __ __ CLC
3d17 : 65 59 __ ADC T4 + 0 
3d19 : aa __ __ TAX
3d1a : a9 12 __ LDA #$12
3d1c : 8d 00 d6 STA $d600 
3d1f : ad 01 59 LDA $5901 ; (vdc_state + 11)
3d22 : 65 5a __ ADC T4 + 1 
.l10416:
3d24 : 2c 00 d6 BIT $d600 
3d27 : 10 fb __ BPL $3d24 ; (main.l10416 + 0)
.s146:
3d29 : 8d 01 d6 STA $d601 
3d2c : a9 13 __ LDA #$13
3d2e : 8d 00 d6 STA $d600 
.l10418:
3d31 : 2c 00 d6 BIT $d600 
3d34 : 10 fb __ BPL $3d31 ; (main.l10418 + 0)
.s151:
3d36 : 8e 01 d6 STX $d601 
3d39 : a9 1f __ LDA #$1f
3d3b : 8d 00 d6 STA $d600 
.l10420:
3d3e : 2c 00 d6 BIT $d600 
3d41 : 10 fb __ BPL $3d3e ; (main.l10420 + 0)
.s155:
3d43 : a5 56 __ LDA T2 + 0 
3d45 : 8d 01 d6 STA $d601 
3d48 : a9 18 __ LDA #$18
3d4a : 8d 00 d6 STA $d600 
.l10422:
3d4d : 2c 00 d6 BIT $d600 
3d50 : 10 fb __ BPL $3d4d ; (main.l10422 + 0)
.s161:
3d52 : ad 01 d6 LDA $d601 
3d55 : 29 7f __ AND #$7f
3d57 : aa __ __ TAX
3d58 : a9 18 __ LDA #$18
3d5a : 8d 00 d6 STA $d600 
.l10424:
3d5d : 2c 00 d6 BIT $d600 
3d60 : 10 fb __ BPL $3d5d ; (main.l10424 + 0)
.s167:
3d62 : 8e 01 d6 STX $d601 
3d65 : a9 1e __ LDA #$1e
3d67 : 8d 00 d6 STA $d600 
.l10426:
3d6a : 2c 00 d6 BIT $d600 
3d6d : 10 fb __ BPL $3d6a ; (main.l10426 + 0)
.s172:
3d6f : a5 5d __ LDA T6 + 0 
3d71 : 8d 01 d6 STA $d601 
3d74 : e6 53 __ INC T0 + 0 
3d76 : 4c d5 1d JMP $1dd5 ; (main.l100 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
3d79 : a2 03 __ LDX #$03
3d7b : b5 53 __ LDA T8 + 0,x 
3d7d : 9d b2 bf STA $bfb2,x ; (nouns + 33)
3d80 : ca __ __ DEX
3d81 : 10 f8 __ BPL $3d7b ; (printf.s1000 + 2)
.s0:
3d83 : 18 __ __ CLC
3d84 : a5 23 __ LDA SP + 0 
3d86 : 69 04 __ ADC #$04
3d88 : 85 47 __ STA T0 + 0 
3d8a : a5 24 __ LDA SP + 1 
3d8c : 69 00 __ ADC #$00
3d8e : 85 48 __ STA T0 + 1 
3d90 : a9 00 __ LDA #$00
3d92 : 85 49 __ STA T2 + 0 
3d94 : a0 02 __ LDY #$02
3d96 : b1 23 __ LDA (SP + 0),y 
3d98 : 85 4a __ STA T3 + 0 
3d9a : c8 __ __ INY
3d9b : b1 23 __ LDA (SP + 0),y 
3d9d : 85 4b __ STA T3 + 1 
.l2:
3d9f : a0 00 __ LDY #$00
3da1 : b1 4a __ LDA (T3 + 0),y 
3da3 : d0 1e __ BNE $3dc3 ; (printf.s3 + 0)
.s4:
3da5 : a6 49 __ LDX T2 + 0 
3da7 : 9d be bf STA $bfbe,x ; (nouns + 45)
3daa : 8a __ __ TXA
3dab : f0 0b __ BEQ $3db8 ; (printf.s1001 + 0)
.s117:
3dad : a9 be __ LDA #$be
3daf : 85 0d __ STA P0 ; (fmt + 0)
3db1 : a9 bf __ LDA #$bf
3db3 : 85 0e __ STA P1 ; (fmt + 1)
3db5 : 20 c9 40 JSR $40c9 ; (puts.s0 + 0)
.s1001:
3db8 : a2 03 __ LDX #$03
3dba : bd b2 bf LDA $bfb2,x ; (nouns + 33)
3dbd : 95 53 __ STA T8 + 0,x 
3dbf : ca __ __ DEX
3dc0 : 10 f8 __ BPL $3dba ; (printf.s1001 + 2)
3dc2 : 60 __ __ RTS
.s3:
3dc3 : c9 25 __ CMP #$25
3dc5 : f0 28 __ BEQ $3def ; (printf.s5 + 0)
.s6:
3dc7 : a6 49 __ LDX T2 + 0 
3dc9 : 9d be bf STA $bfbe,x ; (nouns + 45)
3dcc : e6 4a __ INC T3 + 0 
3dce : d0 02 __ BNE $3dd2 ; (printf.s1098 + 0)
.s1097:
3dd0 : e6 4b __ INC T3 + 1 
.s1098:
3dd2 : e8 __ __ INX
3dd3 : 86 49 __ STX T2 + 0 
3dd5 : e0 28 __ CPX #$28
3dd7 : 90 c6 __ BCC $3d9f ; (printf.l2 + 0)
.s111:
3dd9 : a9 be __ LDA #$be
3ddb : 85 0d __ STA P0 ; (fmt + 0)
3ddd : a9 bf __ LDA #$bf
3ddf : 85 0e __ STA P1 ; (fmt + 1)
3de1 : 98 __ __ TYA
3de2 : 9d be bf STA $bfbe,x ; (nouns + 45)
3de5 : 20 c9 40 JSR $40c9 ; (puts.s0 + 0)
3de8 : a9 00 __ LDA #$00
.s1068:
3dea : 85 49 __ STA T2 + 0 
3dec : 4c 9f 3d JMP $3d9f ; (printf.l2 + 0)
.s5:
3def : a5 49 __ LDA T2 + 0 
3df1 : f0 15 __ BEQ $3e08 ; (printf.s10 + 0)
.s8:
3df3 : a9 be __ LDA #$be
3df5 : 85 0d __ STA P0 ; (fmt + 0)
3df7 : a9 bf __ LDA #$bf
3df9 : 85 0e __ STA P1 ; (fmt + 1)
3dfb : 98 __ __ TYA
3dfc : a6 49 __ LDX T2 + 0 
3dfe : 9d be bf STA $bfbe,x ; (nouns + 45)
3e01 : 20 c9 40 JSR $40c9 ; (puts.s0 + 0)
3e04 : a9 00 __ LDA #$00
3e06 : 85 49 __ STA T2 + 0 
.s10:
3e08 : a9 0a __ LDA #$0a
3e0a : 8d b9 bf STA $bfb9 ; (nouns + 40)
3e0d : a9 00 __ LDA #$00
3e0f : 8d ba bf STA $bfba ; (nouns + 41)
3e12 : 8d bb bf STA $bfbb ; (nouns + 42)
3e15 : 8d bc bf STA $bfbc ; (nouns + 43)
3e18 : 8d bd bf STA $bfbd ; (nouns + 44)
3e1b : a0 01 __ LDY #$01
3e1d : b1 4a __ LDA (T3 + 0),y 
3e1f : aa __ __ TAX
3e20 : a9 20 __ LDA #$20
3e22 : 8d b6 bf STA $bfb6 ; (nouns + 37)
3e25 : a9 00 __ LDA #$00
3e27 : 8d b7 bf STA $bfb7 ; (nouns + 38)
3e2a : a9 ff __ LDA #$ff
3e2c : 8d b8 bf STA $bfb8 ; (nouns + 39)
3e2f : 18 __ __ CLC
3e30 : a5 4a __ LDA T3 + 0 
3e32 : 69 02 __ ADC #$02
.l15:
3e34 : 85 4a __ STA T3 + 0 
3e36 : 90 02 __ BCC $3e3a ; (printf.s1080 + 0)
.s1079:
3e38 : e6 4b __ INC T3 + 1 
.s1080:
3e3a : 8a __ __ TXA
3e3b : e0 2b __ CPX #$2b
3e3d : d0 08 __ BNE $3e47 ; (printf.s18 + 0)
.s17:
3e3f : a9 01 __ LDA #$01
3e41 : 8d bb bf STA $bfbb ; (nouns + 42)
3e44 : 4c bc 40 JMP $40bc ; (printf.s246 + 0)
.s18:
3e47 : c9 30 __ CMP #$30
3e49 : d0 06 __ BNE $3e51 ; (printf.s21 + 0)
.s20:
3e4b : 8d b6 bf STA $bfb6 ; (nouns + 37)
3e4e : 4c bc 40 JMP $40bc ; (printf.s246 + 0)
.s21:
3e51 : e0 23 __ CPX #$23
3e53 : d0 08 __ BNE $3e5d ; (printf.s24 + 0)
.s23:
3e55 : a9 01 __ LDA #$01
3e57 : 8d bd bf STA $bfbd ; (nouns + 44)
3e5a : 4c bc 40 JMP $40bc ; (printf.s246 + 0)
.s24:
3e5d : e0 2d __ CPX #$2d
3e5f : d0 08 __ BNE $3e69 ; (printf.s16 + 0)
.s26:
3e61 : a9 01 __ LDA #$01
3e63 : 8d bc bf STA $bfbc ; (nouns + 43)
3e66 : 4c bc 40 JMP $40bc ; (printf.s246 + 0)
.s16:
3e69 : 85 4c __ STA T4 + 0 
3e6b : e0 30 __ CPX #$30
3e6d : 90 53 __ BCC $3ec2 ; (printf.s32 + 0)
.s33:
3e6f : e0 3a __ CPX #$3a
3e71 : b0 4f __ BCS $3ec2 ; (printf.s32 + 0)
.s30:
3e73 : a9 00 __ LDA #$00
3e75 : 85 4d __ STA T6 + 0 
3e77 : 85 4e __ STA T6 + 1 
3e79 : e0 3a __ CPX #$3a
3e7b : b0 40 __ BCS $3ebd ; (printf.s36 + 0)
.l35:
3e7d : a5 4d __ LDA T6 + 0 
3e7f : 0a __ __ ASL
3e80 : 85 1b __ STA ACCU + 0 
3e82 : a5 4e __ LDA T6 + 1 
3e84 : 2a __ __ ROL
3e85 : 06 1b __ ASL ACCU + 0 
3e87 : 2a __ __ ROL
3e88 : aa __ __ TAX
3e89 : 18 __ __ CLC
3e8a : a5 1b __ LDA ACCU + 0 
3e8c : 65 4d __ ADC T6 + 0 
3e8e : 85 4d __ STA T6 + 0 
3e90 : 8a __ __ TXA
3e91 : 65 4e __ ADC T6 + 1 
3e93 : 06 4d __ ASL T6 + 0 
3e95 : 2a __ __ ROL
3e96 : aa __ __ TAX
3e97 : 18 __ __ CLC
3e98 : a5 4d __ LDA T6 + 0 
3e9a : 65 4c __ ADC T4 + 0 
3e9c : 90 01 __ BCC $3e9f ; (printf.s1094 + 0)
.s1093:
3e9e : e8 __ __ INX
.s1094:
3e9f : 38 __ __ SEC
3ea0 : e9 30 __ SBC #$30
3ea2 : 85 4d __ STA T6 + 0 
3ea4 : 8a __ __ TXA
3ea5 : e9 00 __ SBC #$00
3ea7 : 85 4e __ STA T6 + 1 
3ea9 : a0 00 __ LDY #$00
3eab : b1 4a __ LDA (T3 + 0),y 
3ead : 85 4c __ STA T4 + 0 
3eaf : e6 4a __ INC T3 + 0 
3eb1 : d0 02 __ BNE $3eb5 ; (printf.s1096 + 0)
.s1095:
3eb3 : e6 4b __ INC T3 + 1 
.s1096:
3eb5 : c9 30 __ CMP #$30
3eb7 : 90 04 __ BCC $3ebd ; (printf.s36 + 0)
.s37:
3eb9 : c9 3a __ CMP #$3a
3ebb : 90 c0 __ BCC $3e7d ; (printf.l35 + 0)
.s36:
3ebd : a5 4d __ LDA T6 + 0 
3ebf : 8d b7 bf STA $bfb7 ; (nouns + 38)
.s32:
3ec2 : a5 4c __ LDA T4 + 0 
3ec4 : c9 2e __ CMP #$2e
3ec6 : d0 51 __ BNE $3f19 ; (printf.s40 + 0)
.s38:
3ec8 : a9 00 __ LDA #$00
3eca : 85 4d __ STA T6 + 0 
.l231:
3ecc : 85 4e __ STA T6 + 1 
3ece : a0 00 __ LDY #$00
3ed0 : b1 4a __ LDA (T3 + 0),y 
3ed2 : 85 4c __ STA T4 + 0 
3ed4 : e6 4a __ INC T3 + 0 
3ed6 : d0 02 __ BNE $3eda ; (printf.s1082 + 0)
.s1081:
3ed8 : e6 4b __ INC T3 + 1 
.s1082:
3eda : c9 30 __ CMP #$30
3edc : 90 04 __ BCC $3ee2 ; (printf.s43 + 0)
.s44:
3ede : c9 3a __ CMP #$3a
3ee0 : 90 0a __ BCC $3eec ; (printf.s42 + 0)
.s43:
3ee2 : a5 4d __ LDA T6 + 0 
3ee4 : 8d b8 bf STA $bfb8 ; (nouns + 39)
3ee7 : a5 4c __ LDA T4 + 0 
3ee9 : 4c 19 3f JMP $3f19 ; (printf.s40 + 0)
.s42:
3eec : a5 4d __ LDA T6 + 0 
3eee : 0a __ __ ASL
3eef : 85 1b __ STA ACCU + 0 
3ef1 : a5 4e __ LDA T6 + 1 
3ef3 : 2a __ __ ROL
3ef4 : 06 1b __ ASL ACCU + 0 
3ef6 : 2a __ __ ROL
3ef7 : aa __ __ TAX
3ef8 : 18 __ __ CLC
3ef9 : a5 1b __ LDA ACCU + 0 
3efb : 65 4d __ ADC T6 + 0 
3efd : 85 4d __ STA T6 + 0 
3eff : 8a __ __ TXA
3f00 : 65 4e __ ADC T6 + 1 
3f02 : 06 4d __ ASL T6 + 0 
3f04 : 2a __ __ ROL
3f05 : aa __ __ TAX
3f06 : 18 __ __ CLC
3f07 : a5 4d __ LDA T6 + 0 
3f09 : 65 4c __ ADC T4 + 0 
3f0b : 90 01 __ BCC $3f0e ; (printf.s1092 + 0)
.s1091:
3f0d : e8 __ __ INX
.s1092:
3f0e : 38 __ __ SEC
3f0f : e9 30 __ SBC #$30
3f11 : 85 4d __ STA T6 + 0 
3f13 : 8a __ __ TXA
3f14 : e9 00 __ SBC #$00
3f16 : 4c cc 3e JMP $3ecc ; (printf.l231 + 0)
.s40:
3f19 : c9 64 __ CMP #$64
3f1b : f0 04 __ BEQ $3f21 ; (printf.s45 + 0)
.s48:
3f1d : c9 44 __ CMP #$44
3f1f : d0 05 __ BNE $3f26 ; (printf.s46 + 0)
.s45:
3f21 : a9 01 __ LDA #$01
3f23 : 4c 95 40 JMP $4095 ; (printf.s247 + 0)
.s46:
3f26 : c9 75 __ CMP #$75
3f28 : d0 03 __ BNE $3f2d ; (printf.s52 + 0)
3f2a : 4c 93 40 JMP $4093 ; (printf.s269 + 0)
.s52:
3f2d : c9 55 __ CMP #$55
3f2f : d0 03 __ BNE $3f34 ; (printf.s50 + 0)
3f31 : 4c 93 40 JMP $4093 ; (printf.s269 + 0)
.s50:
3f34 : c9 78 __ CMP #$78
3f36 : f0 04 __ BEQ $3f3c ; (printf.s53 + 0)
.s56:
3f38 : c9 58 __ CMP #$58
3f3a : d0 0d __ BNE $3f49 ; (printf.s54 + 0)
.s53:
3f3c : a9 10 __ LDA #$10
3f3e : 8d b9 bf STA $bfb9 ; (nouns + 40)
3f41 : a9 00 __ LDA #$00
3f43 : 8d ba bf STA $bfba ; (nouns + 41)
3f46 : 4c 93 40 JMP $4093 ; (printf.s269 + 0)
.s54:
3f49 : c9 6c __ CMP #$6c
3f4b : d0 03 __ BNE $3f50 ; (printf.s60 + 0)
3f4d : 4c 25 40 JMP $4025 ; (printf.s57 + 0)
.s60:
3f50 : c9 4c __ CMP #$4c
3f52 : d0 03 __ BNE $3f57 ; (printf.s58 + 0)
3f54 : 4c 25 40 JMP $4025 ; (printf.s57 + 0)
.s58:
3f57 : c9 73 __ CMP #$73
3f59 : f0 39 __ BEQ $3f94 ; (printf.s73 + 0)
.s76:
3f5b : c9 53 __ CMP #$53
3f5d : f0 35 __ BEQ $3f94 ; (printf.s73 + 0)
.s74:
3f5f : c9 63 __ CMP #$63
3f61 : f0 15 __ BEQ $3f78 ; (printf.s104 + 0)
.s107:
3f63 : c9 43 __ CMP #$43
3f65 : f0 11 __ BEQ $3f78 ; (printf.s104 + 0)
.s105:
3f67 : 09 00 __ ORA #$00
3f69 : d0 03 __ BNE $3f6e ; (printf.s108 + 0)
3f6b : 4c 9f 3d JMP $3d9f ; (printf.l2 + 0)
.s108:
3f6e : a6 49 __ LDX T2 + 0 
3f70 : 9d be bf STA $bfbe,x ; (nouns + 45)
3f73 : e6 49 __ INC T2 + 0 
3f75 : 4c 9f 3d JMP $3d9f ; (printf.l2 + 0)
.s104:
3f78 : a0 00 __ LDY #$00
3f7a : b1 47 __ LDA (T0 + 0),y 
3f7c : a6 49 __ LDX T2 + 0 
3f7e : 9d be bf STA $bfbe,x ; (nouns + 45)
3f81 : e6 49 __ INC T2 + 0 
.s244:
3f83 : 18 __ __ CLC
3f84 : a5 47 __ LDA T0 + 0 
3f86 : 69 02 __ ADC #$02
3f88 : 85 47 __ STA T0 + 0 
3f8a : b0 03 __ BCS $3f8f ; (printf.s1083 + 0)
3f8c : 4c 9f 3d JMP $3d9f ; (printf.l2 + 0)
.s1083:
3f8f : e6 48 __ INC T0 + 1 
3f91 : 4c 9f 3d JMP $3d9f ; (printf.l2 + 0)
.s73:
3f94 : a0 00 __ LDY #$00
3f96 : 84 4c __ STY T4 + 0 
3f98 : b1 47 __ LDA (T0 + 0),y 
3f9a : 85 4d __ STA T6 + 0 
3f9c : c8 __ __ INY
3f9d : b1 47 __ LDA (T0 + 0),y 
3f9f : 85 4e __ STA T6 + 1 
3fa1 : 18 __ __ CLC
3fa2 : a5 47 __ LDA T0 + 0 
3fa4 : 69 02 __ ADC #$02
3fa6 : 85 47 __ STA T0 + 0 
3fa8 : 90 02 __ BCC $3fac ; (printf.s1090 + 0)
.s1089:
3faa : e6 48 __ INC T0 + 1 
.s1090:
3fac : ad b7 bf LDA $bfb7 ; (nouns + 38)
3faf : f0 0d __ BEQ $3fbe ; (printf.s79 + 0)
.s1071:
3fb1 : a0 00 __ LDY #$00
3fb3 : b1 4d __ LDA (T6 + 0),y 
3fb5 : f0 05 __ BEQ $3fbc ; (printf.s1072 + 0)
.l81:
3fb7 : c8 __ __ INY
3fb8 : b1 4d __ LDA (T6 + 0),y 
3fba : d0 fb __ BNE $3fb7 ; (printf.l81 + 0)
.s1072:
3fbc : 84 4c __ STY T4 + 0 
.s79:
3fbe : ad bc bf LDA $bfbc ; (nouns + 43)
3fc1 : d0 1a __ BNE $3fdd ; (printf.s85 + 0)
.s1075:
3fc3 : a4 4c __ LDY T4 + 0 
3fc5 : cc b7 bf CPY $bfb7 ; (nouns + 38)
3fc8 : a6 49 __ LDX T2 + 0 
3fca : b0 0d __ BCS $3fd9 ; (printf.s1076 + 0)
.l87:
3fcc : ad b6 bf LDA $bfb6 ; (nouns + 37)
3fcf : 9d be bf STA $bfbe,x ; (nouns + 45)
3fd2 : c8 __ __ INY
3fd3 : cc b7 bf CPY $bfb7 ; (nouns + 38)
3fd6 : e8 __ __ INX
3fd7 : 90 f3 __ BCC $3fcc ; (printf.l87 + 0)
.s1076:
3fd9 : 86 49 __ STX T2 + 0 
3fdb : 84 4c __ STY T4 + 0 
.s85:
3fdd : a5 49 __ LDA T2 + 0 
3fdf : f0 16 __ BEQ $3ff7 ; (printf.s238 + 0)
.s92:
3fe1 : a9 be __ LDA #$be
3fe3 : 85 0d __ STA P0 ; (fmt + 0)
3fe5 : a9 bf __ LDA #$bf
3fe7 : 85 0e __ STA P1 ; (fmt + 1)
3fe9 : a9 00 __ LDA #$00
3feb : a6 49 __ LDX T2 + 0 
3fed : 9d be bf STA $bfbe,x ; (nouns + 45)
3ff0 : 20 c9 40 JSR $40c9 ; (puts.s0 + 0)
3ff3 : a9 00 __ LDA #$00
3ff5 : 85 49 __ STA T2 + 0 
.s238:
3ff7 : a5 4d __ LDA T6 + 0 
3ff9 : 85 0d __ STA P0 ; (fmt + 0)
3ffb : a5 4e __ LDA T6 + 1 
3ffd : 85 0e __ STA P1 ; (fmt + 1)
3fff : 20 c9 40 JSR $40c9 ; (puts.s0 + 0)
4002 : ad bc bf LDA $bfbc ; (nouns + 43)
4005 : d0 03 __ BNE $400a ; (printf.s1073 + 0)
4007 : 4c 9f 3d JMP $3d9f ; (printf.l2 + 0)
.s1073:
400a : a4 4c __ LDY T4 + 0 
400c : cc b7 bf CPY $bfb7 ; (nouns + 38)
400f : a2 00 __ LDX #$00
4011 : b0 0d __ BCS $4020 ; (printf.s1074 + 0)
.l102:
4013 : ad b6 bf LDA $bfb6 ; (nouns + 37)
4016 : 9d be bf STA $bfbe,x ; (nouns + 45)
4019 : c8 __ __ INY
401a : cc b7 bf CPY $bfb7 ; (nouns + 38)
401d : e8 __ __ INX
401e : 90 f3 __ BCC $4013 ; (printf.l102 + 0)
.s1074:
4020 : 86 49 __ STX T2 + 0 
4022 : 4c 9f 3d JMP $3d9f ; (printf.l2 + 0)
.s57:
4025 : a0 00 __ LDY #$00
4027 : b1 47 __ LDA (T0 + 0),y 
4029 : 85 53 __ STA T8 + 0 
402b : c8 __ __ INY
402c : b1 47 __ LDA (T0 + 0),y 
402e : 85 54 __ STA T8 + 1 
4030 : c8 __ __ INY
4031 : b1 47 __ LDA (T0 + 0),y 
4033 : 85 55 __ STA T8 + 2 
4035 : c8 __ __ INY
4036 : b1 47 __ LDA (T0 + 0),y 
4038 : 85 56 __ STA T8 + 3 
403a : 18 __ __ CLC
403b : a5 47 __ LDA T0 + 0 
403d : 69 04 __ ADC #$04
403f : 85 47 __ STA T0 + 0 
4041 : 90 02 __ BCC $4045 ; (printf.s1086 + 0)
.s1085:
4043 : e6 48 __ INC T0 + 1 
.s1086:
4045 : a0 00 __ LDY #$00
4047 : b1 4a __ LDA (T3 + 0),y 
4049 : aa __ __ TAX
404a : e6 4a __ INC T3 + 0 
404c : d0 02 __ BNE $4050 ; (printf.s1088 + 0)
.s1087:
404e : e6 4b __ INC T3 + 1 
.s1088:
4050 : 8a __ __ TXA
4051 : e0 64 __ CPX #$64
4053 : f0 04 __ BEQ $4059 ; (printf.s61 + 0)
.s64:
4055 : c9 44 __ CMP #$44
4057 : d0 04 __ BNE $405d ; (printf.s62 + 0)
.s61:
4059 : a9 01 __ LDA #$01
405b : d0 1c __ BNE $4079 ; (printf.s245 + 0)
.s62:
405d : c9 75 __ CMP #$75
405f : f0 17 __ BEQ $4078 ; (printf.s268 + 0)
.s68:
4061 : c9 55 __ CMP #$55
4063 : f0 13 __ BEQ $4078 ; (printf.s268 + 0)
.s66:
4065 : c9 78 __ CMP #$78
4067 : f0 07 __ BEQ $4070 ; (printf.s69 + 0)
.s72:
4069 : c9 58 __ CMP #$58
406b : f0 03 __ BEQ $4070 ; (printf.s69 + 0)
406d : 4c 9f 3d JMP $3d9f ; (printf.l2 + 0)
.s69:
4070 : 8c ba bf STY $bfba ; (nouns + 41)
4073 : a9 10 __ LDA #$10
4075 : 8d b9 bf STA $bfb9 ; (nouns + 40)
.s268:
4078 : 98 __ __ TYA
.s245:
4079 : 85 15 __ STA P8 
407b : a9 be __ LDA #$be
407d : 85 0f __ STA P2 ; (fmt + 2)
407f : a9 bf __ LDA #$bf
4081 : 85 10 __ STA P3 ; (fmt + 3)
4083 : a9 b6 __ LDA #$b6
4085 : 85 0d __ STA P0 ; (fmt + 0)
4087 : a9 bf __ LDA #$bf
4089 : 85 0e __ STA P1 ; (fmt + 1)
408b : 20 53 42 JSR $4253 ; (nforml@proxy + 0)
408e : a5 1b __ LDA ACCU + 0 
4090 : 4c ea 3d JMP $3dea ; (printf.s1068 + 0)
.s269:
4093 : a9 00 __ LDA #$00
.s247:
4095 : 85 13 __ STA P6 
4097 : a9 be __ LDA #$be
4099 : 85 0f __ STA P2 ; (fmt + 2)
409b : a9 bf __ LDA #$bf
409d : 85 10 __ STA P3 ; (fmt + 3)
409f : a0 00 __ LDY #$00
40a1 : b1 47 __ LDA (T0 + 0),y 
40a3 : 85 11 __ STA P4 
40a5 : c8 __ __ INY
40a6 : b1 47 __ LDA (T0 + 0),y 
40a8 : 85 12 __ STA P5 
40aa : a9 b6 __ LDA #$b6
40ac : 85 0d __ STA P0 ; (fmt + 0)
40ae : a9 bf __ LDA #$bf
40b0 : 85 0e __ STA P1 ; (fmt + 1)
40b2 : 20 1e 41 JSR $411e ; (nformi.s0 + 0)
40b5 : a5 1b __ LDA ACCU + 0 
40b7 : 85 49 __ STA T2 + 0 
40b9 : 4c 83 3f JMP $3f83 ; (printf.s244 + 0)
.s246:
40bc : a0 00 __ LDY #$00
40be : b1 4a __ LDA (T3 + 0),y 
40c0 : aa __ __ TAX
40c1 : 18 __ __ CLC
40c2 : a5 4a __ LDA T3 + 0 
40c4 : 69 01 __ ADC #$01
40c6 : 4c 34 3e JMP $3e34 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
40c9 : a0 00 __ LDY #$00
40cb : b1 0d __ LDA (P0),y 
40cd : f0 0b __ BEQ $40da ; (puts.s1001 + 0)
40cf : 20 db 40 JSR $40db ; (putpch + 0)
40d2 : e6 0d __ INC P0 
40d4 : d0 f3 __ BNE $40c9 ; (puts.s0 + 0)
40d6 : e6 0e __ INC P1 
40d8 : d0 ef __ BNE $40c9 ; (puts.s0 + 0)
.s1001:
40da : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
40db : ae 69 57 LDX $5769 ; (giocharmap + 0)
40de : e0 01 __ CPX #$01
40e0 : 90 26 __ BCC $4108 ; (putpch + 45)
40e2 : c9 0a __ CMP #$0a
40e4 : d0 02 __ BNE $40e8 ; (putpch + 13)
40e6 : a9 0d __ LDA #$0d
40e8 : c9 09 __ CMP #$09
40ea : f0 1f __ BEQ $410b ; (putpch + 48)
40ec : e0 02 __ CPX #$02
40ee : 90 18 __ BCC $4108 ; (putpch + 45)
40f0 : c9 41 __ CMP #$41
40f2 : 90 14 __ BCC $4108 ; (putpch + 45)
40f4 : c9 7b __ CMP #$7b
40f6 : b0 10 __ BCS $4108 ; (putpch + 45)
40f8 : c9 61 __ CMP #$61
40fa : b0 04 __ BCS $4100 ; (putpch + 37)
40fc : c9 5b __ CMP #$5b
40fe : b0 08 __ BCS $4108 ; (putpch + 45)
4100 : 49 20 __ EOR #$20
4102 : e0 03 __ CPX #$03
4104 : f0 02 __ BEQ $4108 ; (putpch + 45)
4106 : 29 df __ AND #$df
4108 : 4c d2 ff JMP $ffd2 
410b : 38 __ __ SEC
410c : 20 f0 ff JSR $fff0 
410f : 98 __ __ TYA
4110 : 29 03 __ AND #$03
4112 : 49 03 __ EOR #$03
4114 : aa __ __ TAX
4115 : a9 20 __ LDA #$20
4117 : 20 d2 ff JSR $ffd2 
411a : ca __ __ DEX
411b : 10 fa __ BPL $4117 ; (putpch + 60)
411d : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
411e : a9 00 __ LDA #$00
4120 : 85 43 __ STA T0 + 0 
4122 : a5 13 __ LDA P6 ; (s + 0)
4124 : f0 13 __ BEQ $4139 ; (nformi.s182 + 0)
.s4:
4126 : 24 12 __ BIT P5 ; (v + 1)
4128 : 10 0f __ BPL $4139 ; (nformi.s182 + 0)
.s1:
412a : 38 __ __ SEC
412b : a9 00 __ LDA #$00
412d : e5 11 __ SBC P4 ; (v + 0)
412f : 85 11 __ STA P4 ; (v + 0)
4131 : a9 00 __ LDA #$00
4133 : e5 12 __ SBC P5 ; (v + 1)
4135 : 85 12 __ STA P5 ; (v + 1)
4137 : e6 43 __ INC T0 + 0 
.s182:
4139 : a9 10 __ LDA #$10
413b : 85 44 __ STA T2 + 0 
413d : a5 11 __ LDA P4 ; (v + 0)
413f : 05 12 __ ORA P5 ; (v + 1)
4141 : f0 46 __ BEQ $4189 ; (nformi.s7 + 0)
.s42:
4143 : a0 03 __ LDY #$03
4145 : b1 0d __ LDA (P0),y ; (si + 0)
4147 : 85 45 __ STA T4 + 0 
4149 : c8 __ __ INY
414a : b1 0d __ LDA (P0),y ; (si + 0)
414c : 85 46 __ STA T4 + 1 
.l6:
414e : a5 11 __ LDA P4 ; (v + 0)
4150 : 85 1b __ STA ACCU + 0 
4152 : a5 12 __ LDA P5 ; (v + 1)
4154 : 85 1c __ STA ACCU + 1 
4156 : a5 45 __ LDA T4 + 0 
4158 : 85 03 __ STA WORK + 0 
415a : a5 46 __ LDA T4 + 1 
415c : 85 04 __ STA WORK + 1 
415e : 20 19 56 JSR $5619 ; (divmod + 0)
4161 : a5 06 __ LDA WORK + 3 
4163 : 30 08 __ BMI $416d ; (nformi.s78 + 0)
.s1019:
4165 : d0 0a __ BNE $4171 ; (nformi.s77 + 0)
.s1018:
4167 : a5 05 __ LDA WORK + 2 
4169 : c9 0a __ CMP #$0a
416b : b0 04 __ BCS $4171 ; (nformi.s77 + 0)
.s78:
416d : a9 30 __ LDA #$30
416f : d0 02 __ BNE $4173 ; (nformi.s79 + 0)
.s77:
4171 : a9 37 __ LDA #$37
.s79:
4173 : 18 __ __ CLC
4174 : 65 05 __ ADC WORK + 2 
4176 : c6 44 __ DEC T2 + 0 
4178 : a6 44 __ LDX T2 + 0 
417a : 9d f0 bf STA $bff0,x ; (buffer + 0)
417d : a5 1b __ LDA ACCU + 0 
417f : 85 11 __ STA P4 ; (v + 0)
4181 : a5 1c __ LDA ACCU + 1 
4183 : 85 12 __ STA P5 ; (v + 1)
4185 : 05 11 __ ORA P4 ; (v + 0)
4187 : d0 c5 __ BNE $414e ; (nformi.l6 + 0)
.s7:
4189 : a0 02 __ LDY #$02
418b : b1 0d __ LDA (P0),y ; (si + 0)
418d : c9 ff __ CMP #$ff
418f : d0 04 __ BNE $4195 ; (nformi.s80 + 0)
.s81:
4191 : a9 0f __ LDA #$0f
4193 : d0 05 __ BNE $419a ; (nformi.s1026 + 0)
.s80:
4195 : 38 __ __ SEC
4196 : a9 10 __ LDA #$10
4198 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
419a : a8 __ __ TAY
419b : c4 44 __ CPY T2 + 0 
419d : b0 0d __ BCS $41ac ; (nformi.s10 + 0)
.s9:
419f : a9 30 __ LDA #$30
.l1027:
41a1 : c6 44 __ DEC T2 + 0 
41a3 : a6 44 __ LDX T2 + 0 
41a5 : 9d f0 bf STA $bff0,x ; (buffer + 0)
41a8 : c4 44 __ CPY T2 + 0 
41aa : 90 f5 __ BCC $41a1 ; (nformi.l1027 + 0)
.s10:
41ac : a0 07 __ LDY #$07
41ae : b1 0d __ LDA (P0),y ; (si + 0)
41b0 : f0 20 __ BEQ $41d2 ; (nformi.s13 + 0)
.s14:
41b2 : a0 04 __ LDY #$04
41b4 : b1 0d __ LDA (P0),y ; (si + 0)
41b6 : d0 1a __ BNE $41d2 ; (nformi.s13 + 0)
.s1013:
41b8 : 88 __ __ DEY
41b9 : b1 0d __ LDA (P0),y ; (si + 0)
41bb : c9 10 __ CMP #$10
41bd : d0 13 __ BNE $41d2 ; (nformi.s13 + 0)
.s11:
41bf : a9 58 __ LDA #$58
41c1 : a6 44 __ LDX T2 + 0 
41c3 : 9d ef bf STA $bfef,x ; (buff + 49)
41c6 : 8a __ __ TXA
41c7 : 18 __ __ CLC
41c8 : 69 fe __ ADC #$fe
41ca : 85 44 __ STA T2 + 0 
41cc : aa __ __ TAX
41cd : a9 30 __ LDA #$30
41cf : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
41d2 : a9 00 __ LDA #$00
41d4 : 85 1b __ STA ACCU + 0 
41d6 : a5 43 __ LDA T0 + 0 
41d8 : f0 06 __ BEQ $41e0 ; (nformi.s16 + 0)
.s15:
41da : c6 44 __ DEC T2 + 0 
41dc : a9 2d __ LDA #$2d
41de : d0 0a __ BNE $41ea ; (nformi.s1025 + 0)
.s16:
41e0 : a0 05 __ LDY #$05
41e2 : b1 0d __ LDA (P0),y ; (si + 0)
41e4 : f0 09 __ BEQ $41ef ; (nformi.s163 + 0)
.s18:
41e6 : c6 44 __ DEC T2 + 0 
41e8 : a9 2b __ LDA #$2b
.s1025:
41ea : a6 44 __ LDX T2 + 0 
41ec : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
41ef : a0 06 __ LDY #$06
41f1 : b1 0d __ LDA (P0),y ; (si + 0)
41f3 : d0 33 __ BNE $4228 ; (nformi.s24 + 0)
.l30:
41f5 : a0 01 __ LDY #$01
41f7 : b1 0d __ LDA (P0),y ; (si + 0)
41f9 : 18 __ __ CLC
41fa : 65 44 __ ADC T2 + 0 
41fc : b0 04 __ BCS $4202 ; (nformi.s31 + 0)
.s1006:
41fe : c9 11 __ CMP #$11
4200 : 90 0d __ BCC $420f ; (nformi.s33 + 0)
.s31:
4202 : c6 44 __ DEC T2 + 0 
4204 : a0 00 __ LDY #$00
4206 : b1 0d __ LDA (P0),y ; (si + 0)
4208 : a6 44 __ LDX T2 + 0 
420a : 9d f0 bf STA $bff0,x ; (buffer + 0)
420d : b0 e6 __ BCS $41f5 ; (nformi.l30 + 0)
.s33:
420f : a6 44 __ LDX T2 + 0 
4211 : e0 10 __ CPX #$10
4213 : b0 0e __ BCS $4223 ; (nformi.s23 + 0)
.s34:
4215 : 88 __ __ DEY
.l1022:
4216 : bd f0 bf LDA $bff0,x ; (buffer + 0)
4219 : 91 0f __ STA (P2),y ; (str + 0)
421b : e8 __ __ INX
421c : e0 10 __ CPX #$10
421e : c8 __ __ INY
421f : 90 f5 __ BCC $4216 ; (nformi.l1022 + 0)
.s1023:
4221 : 84 1b __ STY ACCU + 0 
.s23:
4223 : a9 00 __ LDA #$00
4225 : 85 1c __ STA ACCU + 1 
.s1001:
4227 : 60 __ __ RTS
.s24:
4228 : a6 44 __ LDX T2 + 0 
422a : e0 10 __ CPX #$10
422c : b0 1a __ BCS $4248 ; (nformi.l27 + 0)
.s25:
422e : a0 00 __ LDY #$00
.l1020:
4230 : bd f0 bf LDA $bff0,x ; (buffer + 0)
4233 : 91 0f __ STA (P2),y ; (str + 0)
4235 : e8 __ __ INX
4236 : e0 10 __ CPX #$10
4238 : c8 __ __ INY
4239 : 90 f5 __ BCC $4230 ; (nformi.l1020 + 0)
.s1021:
423b : 84 1b __ STY ACCU + 0 
423d : b0 09 __ BCS $4248 ; (nformi.l27 + 0)
.s28:
423f : 88 __ __ DEY
4240 : b1 0d __ LDA (P0),y ; (si + 0)
4242 : a4 1b __ LDY ACCU + 0 
4244 : 91 0f __ STA (P2),y ; (str + 0)
4246 : e6 1b __ INC ACCU + 0 
.l27:
4248 : a5 1b __ LDA ACCU + 0 
424a : a0 01 __ LDY #$01
424c : d1 0d __ CMP (P0),y ; (si + 0)
424e : 90 ef __ BCC $423f ; (nformi.s28 + 0)
4250 : 4c 23 42 JMP $4223 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml@proxy: ; nforml@proxy
4253 : a5 53 __ LDA $53 
4255 : 85 11 __ STA P4 
4257 : a5 54 __ LDA $54 
4259 : 85 12 __ STA P5 
425b : a5 55 __ LDA $55 
425d : 85 13 __ STA P6 
425f : a5 56 __ LDA $56 
4261 : 85 14 __ STA P7 
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
4263 : a9 00 __ LDA #$00
4265 : 85 43 __ STA T0 + 0 
4267 : a5 15 __ LDA P8 ; (s + 0)
4269 : f0 21 __ BEQ $428c ; (nforml.s182 + 0)
.s4:
426b : a5 14 __ LDA P7 ; (v + 3)
426d : f0 1d __ BEQ $428c ; (nforml.s182 + 0)
.s1032:
426f : 10 1b __ BPL $428c ; (nforml.s182 + 0)
.s1:
4271 : 38 __ __ SEC
4272 : a9 00 __ LDA #$00
4274 : e5 11 __ SBC P4 ; (v + 0)
4276 : 85 11 __ STA P4 ; (v + 0)
4278 : a9 00 __ LDA #$00
427a : e5 12 __ SBC P5 ; (v + 1)
427c : 85 12 __ STA P5 ; (v + 1)
427e : a9 00 __ LDA #$00
4280 : e5 13 __ SBC P6 ; (v + 2)
4282 : 85 13 __ STA P6 ; (v + 2)
4284 : a9 00 __ LDA #$00
4286 : e5 14 __ SBC P7 ; (v + 3)
4288 : 85 14 __ STA P7 ; (v + 3)
428a : e6 43 __ INC T0 + 0 
.s182:
428c : a9 10 __ LDA #$10
428e : 85 44 __ STA T2 + 0 
4290 : a5 14 __ LDA P7 ; (v + 3)
4292 : d0 0c __ BNE $42a0 ; (nforml.s42 + 0)
.s1024:
4294 : a5 13 __ LDA P6 ; (v + 2)
4296 : d0 08 __ BNE $42a0 ; (nforml.s42 + 0)
.s1025:
4298 : a5 12 __ LDA P5 ; (v + 1)
429a : d0 04 __ BNE $42a0 ; (nforml.s42 + 0)
.s1026:
429c : c5 11 __ CMP P4 ; (v + 0)
429e : b0 0e __ BCS $42ae ; (nforml.s7 + 0)
.s42:
42a0 : a0 03 __ LDY #$03
42a2 : b1 0d __ LDA (P0),y ; (si + 0)
42a4 : 85 45 __ STA T5 + 0 
42a6 : c8 __ __ INY
42a7 : b1 0d __ LDA (P0),y ; (si + 0)
42a9 : 85 46 __ STA T5 + 1 
42ab : 4c 78 43 JMP $4378 ; (nforml.l6 + 0)
.s7:
42ae : a0 02 __ LDY #$02
42b0 : b1 0d __ LDA (P0),y ; (si + 0)
42b2 : c9 ff __ CMP #$ff
42b4 : d0 04 __ BNE $42ba ; (nforml.s80 + 0)
.s81:
42b6 : a9 0f __ LDA #$0f
42b8 : d0 05 __ BNE $42bf ; (nforml.s1039 + 0)
.s80:
42ba : 38 __ __ SEC
42bb : a9 10 __ LDA #$10
42bd : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
42bf : a8 __ __ TAY
42c0 : c4 44 __ CPY T2 + 0 
42c2 : b0 0d __ BCS $42d1 ; (nforml.s10 + 0)
.s9:
42c4 : a9 30 __ LDA #$30
.l1040:
42c6 : c6 44 __ DEC T2 + 0 
42c8 : a6 44 __ LDX T2 + 0 
42ca : 9d f0 bf STA $bff0,x ; (buffer + 0)
42cd : c4 44 __ CPY T2 + 0 
42cf : 90 f5 __ BCC $42c6 ; (nforml.l1040 + 0)
.s10:
42d1 : a0 07 __ LDY #$07
42d3 : b1 0d __ LDA (P0),y ; (si + 0)
42d5 : f0 20 __ BEQ $42f7 ; (nforml.s13 + 0)
.s14:
42d7 : a0 04 __ LDY #$04
42d9 : b1 0d __ LDA (P0),y ; (si + 0)
42db : d0 1a __ BNE $42f7 ; (nforml.s13 + 0)
.s1013:
42dd : 88 __ __ DEY
42de : b1 0d __ LDA (P0),y ; (si + 0)
42e0 : c9 10 __ CMP #$10
42e2 : d0 13 __ BNE $42f7 ; (nforml.s13 + 0)
.s11:
42e4 : a9 58 __ LDA #$58
42e6 : a6 44 __ LDX T2 + 0 
42e8 : 9d ef bf STA $bfef,x ; (buff + 49)
42eb : 8a __ __ TXA
42ec : 18 __ __ CLC
42ed : 69 fe __ ADC #$fe
42ef : 85 44 __ STA T2 + 0 
42f1 : aa __ __ TAX
42f2 : a9 30 __ LDA #$30
42f4 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
42f7 : a9 00 __ LDA #$00
42f9 : 85 1b __ STA ACCU + 0 
42fb : a5 43 __ LDA T0 + 0 
42fd : f0 06 __ BEQ $4305 ; (nforml.s16 + 0)
.s15:
42ff : c6 44 __ DEC T2 + 0 
4301 : a9 2d __ LDA #$2d
4303 : d0 0a __ BNE $430f ; (nforml.s1038 + 0)
.s16:
4305 : a0 05 __ LDY #$05
4307 : b1 0d __ LDA (P0),y ; (si + 0)
4309 : f0 09 __ BEQ $4314 ; (nforml.s163 + 0)
.s18:
430b : c6 44 __ DEC T2 + 0 
430d : a9 2b __ LDA #$2b
.s1038:
430f : a6 44 __ LDX T2 + 0 
4311 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
4314 : a0 06 __ LDY #$06
4316 : b1 0d __ LDA (P0),y ; (si + 0)
4318 : d0 33 __ BNE $434d ; (nforml.s24 + 0)
.l30:
431a : a0 01 __ LDY #$01
431c : b1 0d __ LDA (P0),y ; (si + 0)
431e : 18 __ __ CLC
431f : 65 44 __ ADC T2 + 0 
4321 : b0 04 __ BCS $4327 ; (nforml.s31 + 0)
.s1006:
4323 : c9 11 __ CMP #$11
4325 : 90 0d __ BCC $4334 ; (nforml.s33 + 0)
.s31:
4327 : c6 44 __ DEC T2 + 0 
4329 : a0 00 __ LDY #$00
432b : b1 0d __ LDA (P0),y ; (si + 0)
432d : a6 44 __ LDX T2 + 0 
432f : 9d f0 bf STA $bff0,x ; (buffer + 0)
4332 : b0 e6 __ BCS $431a ; (nforml.l30 + 0)
.s33:
4334 : a6 44 __ LDX T2 + 0 
4336 : e0 10 __ CPX #$10
4338 : b0 0e __ BCS $4348 ; (nforml.s23 + 0)
.s34:
433a : 88 __ __ DEY
.l1035:
433b : bd f0 bf LDA $bff0,x ; (buffer + 0)
433e : 91 0f __ STA (P2),y ; (str + 0)
4340 : e8 __ __ INX
4341 : e0 10 __ CPX #$10
4343 : c8 __ __ INY
4344 : 90 f5 __ BCC $433b ; (nforml.l1035 + 0)
.s1036:
4346 : 84 1b __ STY ACCU + 0 
.s23:
4348 : a9 00 __ LDA #$00
434a : 85 1c __ STA ACCU + 1 
.s1001:
434c : 60 __ __ RTS
.s24:
434d : a6 44 __ LDX T2 + 0 
434f : e0 10 __ CPX #$10
4351 : b0 1a __ BCS $436d ; (nforml.l27 + 0)
.s25:
4353 : a0 00 __ LDY #$00
.l1033:
4355 : bd f0 bf LDA $bff0,x ; (buffer + 0)
4358 : 91 0f __ STA (P2),y ; (str + 0)
435a : e8 __ __ INX
435b : e0 10 __ CPX #$10
435d : c8 __ __ INY
435e : 90 f5 __ BCC $4355 ; (nforml.l1033 + 0)
.s1034:
4360 : 84 1b __ STY ACCU + 0 
4362 : b0 09 __ BCS $436d ; (nforml.l27 + 0)
.s28:
4364 : 88 __ __ DEY
4365 : b1 0d __ LDA (P0),y ; (si + 0)
4367 : a4 1b __ LDY ACCU + 0 
4369 : 91 0f __ STA (P2),y ; (str + 0)
436b : e6 1b __ INC ACCU + 0 
.l27:
436d : a5 1b __ LDA ACCU + 0 
436f : a0 01 __ LDY #$01
4371 : d1 0d __ CMP (P0),y ; (si + 0)
4373 : 90 ef __ BCC $4364 ; (nforml.s28 + 0)
4375 : 4c 48 43 JMP $4348 ; (nforml.s23 + 0)
.l6:
4378 : a5 11 __ LDA P4 ; (v + 0)
437a : 85 1b __ STA ACCU + 0 
437c : a5 12 __ LDA P5 ; (v + 1)
437e : 85 1c __ STA ACCU + 1 
4380 : a5 13 __ LDA P6 ; (v + 2)
4382 : 85 1d __ STA ACCU + 2 
4384 : a5 14 __ LDA P7 ; (v + 3)
4386 : 85 1e __ STA ACCU + 3 
4388 : a5 45 __ LDA T5 + 0 
438a : 85 03 __ STA WORK + 0 
438c : a5 46 __ LDA T5 + 1 
438e : 85 04 __ STA WORK + 1 
4390 : a9 00 __ LDA #$00
4392 : 85 05 __ STA WORK + 2 
4394 : 85 06 __ STA WORK + 3 
4396 : 20 9e 56 JSR $569e ; (divmod32 + 0)
4399 : a5 08 __ LDA WORK + 5 
439b : 30 08 __ BMI $43a5 ; (nforml.s78 + 0)
.s1023:
439d : d0 0a __ BNE $43a9 ; (nforml.s77 + 0)
.s1022:
439f : a5 07 __ LDA WORK + 4 
43a1 : c9 0a __ CMP #$0a
43a3 : b0 04 __ BCS $43a9 ; (nforml.s77 + 0)
.s78:
43a5 : a9 30 __ LDA #$30
43a7 : d0 02 __ BNE $43ab ; (nforml.s79 + 0)
.s77:
43a9 : a9 37 __ LDA #$37
.s79:
43ab : 18 __ __ CLC
43ac : 65 07 __ ADC WORK + 4 
43ae : c6 44 __ DEC T2 + 0 
43b0 : a6 44 __ LDX T2 + 0 
43b2 : 9d f0 bf STA $bff0,x ; (buffer + 0)
43b5 : a5 1b __ LDA ACCU + 0 
43b7 : 85 11 __ STA P4 ; (v + 0)
43b9 : a5 1c __ LDA ACCU + 1 
43bb : 85 12 __ STA P5 ; (v + 1)
43bd : a5 1d __ LDA ACCU + 2 
43bf : 85 13 __ STA P6 ; (v + 2)
43c1 : a5 1e __ LDA ACCU + 3 
43c3 : 85 14 __ STA P7 ; (v + 3)
43c5 : d0 b1 __ BNE $4378 ; (nforml.l6 + 0)
.s1018:
43c7 : a5 13 __ LDA P6 ; (v + 2)
43c9 : d0 ad __ BNE $4378 ; (nforml.l6 + 0)
.s1019:
43cb : a5 12 __ LDA P5 ; (v + 1)
43cd : d0 a9 __ BNE $4378 ; (nforml.l6 + 0)
.s1020:
43cf : c5 11 __ CMP P4 ; (v + 0)
43d1 : 90 a5 __ BCC $4378 ; (nforml.l6 + 0)
43d3 : 4c ae 42 JMP $42ae ; (nforml.s7 + 0)
--------------------------------------------------------------------
getch: ; getch()->i16
.s0:
43d6 : 20 2b 44 JSR $442b ; (getpch + 0)
43d9 : c9 00 __ CMP #$00
43db : f0 f9 __ BEQ $43d6 ; (getch.s0 + 0)
43dd : 85 1b __ STA ACCU + 0 
43df : a9 00 __ LDA #$00
43e1 : 85 1c __ STA ACCU + 1 
.s1001:
43e3 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
43e4 : 20 81 ff JSR $ff81 
.s1001:
43e7 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
43e8 : 24 d7 __ BIT $d7 
43ea : 30 03 __ BMI $43ef ; (screen_setmode.s1001 + 0)
.s6:
43ec : 20 5f ff JSR $ff5f 
.s1001:
43ef : 60 __ __ RTS
--------------------------------------------------------------------
43f0 : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
4400 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
4410 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
4420 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getpch: ; getpch
442b : 20 e4 ff JSR $ffe4 
442e : ae 69 57 LDX $5769 ; (giocharmap + 0)
4431 : e0 01 __ CPX #$01
4433 : 90 26 __ BCC $445b ; (getpch + 48)
4435 : c9 0d __ CMP #$0d
4437 : d0 02 __ BNE $443b ; (getpch + 16)
4439 : a9 0a __ LDA #$0a
443b : e0 02 __ CPX #$02
443d : 90 1c __ BCC $445b ; (getpch + 48)
443f : c9 db __ CMP #$db
4441 : b0 18 __ BCS $445b ; (getpch + 48)
4443 : c9 41 __ CMP #$41
4445 : 90 14 __ BCC $445b ; (getpch + 48)
4447 : c9 c1 __ CMP #$c1
4449 : 90 02 __ BCC $444d ; (getpch + 34)
444b : 49 a0 __ EOR #$a0
444d : c9 7b __ CMP #$7b
444f : b0 0a __ BCS $445b ; (getpch + 48)
4451 : c9 61 __ CMP #$61
4453 : b0 04 __ BCS $4459 ; (getpch + 46)
4455 : c9 5b __ CMP #$5b
4457 : b0 02 __ BCS $445b ; (getpch + 48)
4459 : 49 20 __ EOR #$20
445b : 60 __ __ RTS
--------------------------------------------------------------------
445c : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
446c : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
4476 : __ __ __ BYT 56 44 43 54 45 53 54 4c 4d 43 00                : VDCTESTLMC.
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
4481 : a5 0d __ LDA P0 
4483 : a6 0e __ LDX P1 
4485 : 20 68 ff JSR $ff68 
.s1001:
4488 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
4489 : a5 0d __ LDA P0 
448b : 05 0e __ ORA P1 
448d : f0 08 __ BEQ $4497 ; (krnio_setnam.s0 + 14)
448f : a0 ff __ LDY #$ff
4491 : c8 __ __ INY
4492 : b1 0d __ LDA (P0),y 
4494 : d0 fb __ BNE $4491 ; (krnio_setnam.s0 + 8)
4496 : 98 __ __ TYA
4497 : a6 0d __ LDX P0 
4499 : a4 0e __ LDY P1 
449b : 20 bd ff JSR $ffbd 
.s1001:
449e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
449f : a5 0d __ LDA P0 
44a1 : a6 0e __ LDX P1 
44a3 : a4 0f __ LDY P2 
44a5 : 20 ba ff JSR $ffba 
44a8 : a9 00 __ LDA #$00
44aa : a2 00 __ LDX #$00
44ac : a0 00 __ LDY #$00
44ae : 20 d5 ff JSR $ffd5 
44b1 : a9 00 __ LDA #$00
44b3 : b0 02 __ BCS $44b7 ; (krnio_load.s0 + 24)
44b5 : a9 01 __ LDA #$01
44b7 : 85 1b __ STA ACCU + 0 
.s1001:
44b9 : a5 1b __ LDA ACCU + 0 
44bb : 60 __ __ RTS
--------------------------------------------------------------------
44bc : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
44cc : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
44da : a9 01 __ LDA #$01
44dc : 85 0d __ STA P0 
44de : a9 00 __ LDA #$00
44e0 : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
44e2 : a5 0d __ LDA P0 
44e4 : 85 1b __ STA ACCU + 0 
44e6 : a5 0e __ LDA P1 
44e8 : 85 1c __ STA ACCU + 1 
44ea : ae ff 4a LDX $4aff ; (spentry + 0)
44ed : 9a __ __ TXS
44ee : a9 4c __ LDA #$4c
44f0 : 85 54 __ STA $54 
44f2 : a9 00 __ LDA #$00
44f4 : 85 13 __ STA P6 
.s1001:
44f6 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
44f7 : a5 53 __ LDA T9 + 0 
44f9 : 8d f9 bf STA $bff9 ; (buffer + 9)
44fc : a5 54 __ LDA T9 + 1 
44fe : 8d fa bf STA $bffa ; (buffer + 10)
.s0:
4501 : a6 13 __ LDX P6 ; (mode + 0)
4503 : bd 34 57 LDA $5734,x ; (__multab36L + 0)
4506 : 85 47 __ STA T1 + 0 
4508 : aa __ __ TAX
4509 : 18 __ __ CLC
450a : 69 00 __ ADC #$00
450c : 85 49 __ STA T2 + 0 
450e : a9 58 __ LDA #$58
4510 : 69 00 __ ADC #$00
4512 : 85 4a __ STA T2 + 1 
4514 : bd 04 58 LDA $5804,x ; (vdc_modes + 4)
4517 : f0 0a __ BEQ $4523 ; (vdc_set_mode.s3 + 0)
.s4:
4519 : ad f6 58 LDA $58f6 ; (vdc_state + 0)
451c : c9 10 __ CMP #$10
451e : d0 03 __ BNE $4523 ; (vdc_set_mode.s3 + 0)
4520 : 4c 03 48 JMP $4803 ; (vdc_set_mode.s1001 + 0)
.s3:
4523 : a9 00 __ LDA #$00
4525 : 8d 0c 59 STA $590c ; (vdc_state + 22)
4528 : 8d 0d 59 STA $590d ; (vdc_state + 23)
452b : 8d 0e 59 STA $590e ; (vdc_state + 24)
452e : a0 09 __ LDY #$09
4530 : b1 49 __ LDA (T2 + 0),y 
4532 : 8d 02 59 STA $5902 ; (vdc_state + 12)
4535 : c8 __ __ INY
4536 : b1 49 __ LDA (T2 + 0),y 
4538 : 8d 03 59 STA $5903 ; (vdc_state + 13)
453b : c8 __ __ INY
453c : b1 49 __ LDA (T2 + 0),y 
453e : 8d 04 59 STA $5904 ; (vdc_state + 14)
4541 : c8 __ __ INY
4542 : b1 49 __ LDA (T2 + 0),y 
4544 : 8d 05 59 STA $5905 ; (vdc_state + 15)
4547 : a0 0f __ LDY #$0f
4549 : b1 49 __ LDA (T2 + 0),y 
454b : 8d 08 59 STA $5908 ; (vdc_state + 18)
454e : c8 __ __ INY
454f : b1 49 __ LDA (T2 + 0),y 
4551 : 8d 09 59 STA $5909 ; (vdc_state + 19)
4554 : c8 __ __ INY
4555 : b1 49 __ LDA (T2 + 0),y 
4557 : 8d 0a 59 STA $590a ; (vdc_state + 20)
455a : c8 __ __ INY
455b : b1 49 __ LDA (T2 + 0),y 
455d : 8d 0b 59 STA $590b ; (vdc_state + 21)
4560 : a0 00 __ LDY #$00
4562 : b1 49 __ LDA (T2 + 0),y 
4564 : 85 44 __ STA T3 + 0 
4566 : c8 __ __ INY
4567 : b1 49 __ LDA (T2 + 0),y 
4569 : 85 45 __ STA T3 + 1 
456b : 8d fa 58 STA $58fa ; (vdc_state + 4)
456e : a5 44 __ LDA T3 + 0 
4570 : 8d f9 58 STA $58f9 ; (vdc_state + 3)
4573 : c8 __ __ INY
4574 : b1 49 __ LDA (T2 + 0),y 
4576 : 85 1b __ STA ACCU + 0 
4578 : c8 __ __ INY
4579 : b1 49 __ LDA (T2 + 0),y 
457b : 85 1c __ STA ACCU + 1 
457d : 8d fc 58 STA $58fc ; (vdc_state + 6)
4580 : a5 1b __ LDA ACCU + 0 
4582 : 8d fb 58 STA $58fb ; (vdc_state + 5)
4585 : a0 05 __ LDY #$05
4587 : b1 49 __ LDA (T2 + 0),y 
4589 : 85 4b __ STA T5 + 0 
458b : c8 __ __ INY
458c : b1 49 __ LDA (T2 + 0),y 
458e : 85 4c __ STA T5 + 1 
4590 : 8d ff 58 STA $58ff ; (vdc_state + 9)
4593 : a5 4b __ LDA T5 + 0 
4595 : 8d fe 58 STA $58fe ; (vdc_state + 8)
4598 : c8 __ __ INY
4599 : b1 49 __ LDA (T2 + 0),y 
459b : 85 4d __ STA T6 + 0 
459d : c8 __ __ INY
459e : b1 49 __ LDA (T2 + 0),y 
45a0 : 85 4e __ STA T6 + 1 
45a2 : 8d 01 59 STA $5901 ; (vdc_state + 11)
45a5 : a5 4d __ LDA T6 + 0 
45a7 : 8d 00 59 STA $5900 ; (vdc_state + 10)
45aa : a0 0d __ LDY #$0d
45ac : b1 49 __ LDA (T2 + 0),y 
45ae : 85 4f __ STA T7 + 0 
45b0 : c8 __ __ INY
45b1 : b1 49 __ LDA (T2 + 0),y 
45b3 : 85 50 __ STA T7 + 1 
45b5 : 8d 07 59 STA $5907 ; (vdc_state + 17)
45b8 : a5 4f __ LDA T7 + 0 
45ba : 8d 06 59 STA $5906 ; (vdc_state + 16)
45bd : a5 1b __ LDA ACCU + 0 
45bf : 05 1c __ ORA ACCU + 1 
45c1 : f0 3c __ BEQ $45ff ; (vdc_set_mode.s6 + 0)
.s374:
45c3 : a9 00 __ LDA #$00
45c5 : 85 51 __ STA T8 + 0 
45c7 : 85 52 __ STA T8 + 1 
45c9 : a9 0f __ LDA #$0f
45cb : 85 53 __ STA T9 + 0 
45cd : a9 59 __ LDA #$59
45cf : 85 54 __ STA T9 + 1 
45d1 : a2 00 __ LDX #$00
.l8:
45d3 : a5 51 __ LDA T8 + 0 
45d5 : a0 00 __ LDY #$00
45d7 : 91 53 __ STA (T9 + 0),y 
45d9 : a5 52 __ LDA T8 + 1 
45db : c8 __ __ INY
45dc : 91 53 __ STA (T9 + 0),y 
45de : 18 __ __ CLC
45df : a5 44 __ LDA T3 + 0 
45e1 : 65 51 __ ADC T8 + 0 
45e3 : 85 51 __ STA T8 + 0 
45e5 : a5 45 __ LDA T3 + 1 
45e7 : 65 52 __ ADC T8 + 1 
45e9 : 85 52 __ STA T8 + 1 
45eb : 18 __ __ CLC
45ec : a5 53 __ LDA T9 + 0 
45ee : 69 02 __ ADC #$02
45f0 : 85 53 __ STA T9 + 0 
45f2 : 90 02 __ BCC $45f6 ; (vdc_set_mode.s1115 + 0)
.s1114:
45f4 : e6 54 __ INC T9 + 1 
.s1115:
45f6 : e8 __ __ INX
45f7 : a5 1c __ LDA ACCU + 1 
45f9 : d0 d8 __ BNE $45d3 ; (vdc_set_mode.l8 + 0)
.s1108:
45fb : e4 1b __ CPX ACCU + 0 
45fd : 90 d4 __ BCC $45d3 ; (vdc_set_mode.l8 + 0)
.s6:
45ff : a9 22 __ LDA #$22
4601 : 8d 00 d6 STA $d600 
.l1577:
4604 : 2c 00 d6 BIT $d600 
4607 : 10 fb __ BPL $4604 ; (vdc_set_mode.l1577 + 0)
.s16:
4609 : a9 80 __ LDA #$80
460b : 8d 01 d6 STA $d601 
460e : a9 0c __ LDA #$0c
4610 : 8d 00 d6 STA $d600 
.l1579:
4613 : 2c 00 d6 BIT $d600 
4616 : 10 fb __ BPL $4613 ; (vdc_set_mode.l1579 + 0)
.s22:
4618 : a5 4c __ LDA T5 + 1 
461a : 8d 01 d6 STA $d601 
461d : a9 0d __ LDA #$0d
461f : 8d 00 d6 STA $d600 
.l1581:
4622 : 2c 00 d6 BIT $d600 
4625 : 10 fb __ BPL $4622 ; (vdc_set_mode.l1581 + 0)
.s27:
4627 : a5 4b __ LDA T5 + 0 
4629 : 8d 01 d6 STA $d601 
462c : a9 14 __ LDA #$14
462e : 8d 00 d6 STA $d600 
.l1583:
4631 : 2c 00 d6 BIT $d600 
4634 : 10 fb __ BPL $4631 ; (vdc_set_mode.l1583 + 0)
.s32:
4636 : a5 4e __ LDA T6 + 1 
4638 : 8d 01 d6 STA $d601 
463b : a9 15 __ LDA #$15
463d : 8d 00 d6 STA $d600 
.l1585:
4640 : 2c 00 d6 BIT $d600 
4643 : 10 fb __ BPL $4640 ; (vdc_set_mode.l1585 + 0)
.s37:
4645 : a5 4d __ LDA T6 + 0 
4647 : 8d 01 d6 STA $d601 
464a : a6 47 __ LDX T1 + 0 
464c : bd 0e 58 LDA $580e,x ; (vdc_modes + 14)
464f : 85 45 __ STA T3 + 1 
4651 : a9 1c __ LDA #$1c
4653 : 8d 00 d6 STA $d600 
.l1587:
4656 : 2c 00 d6 BIT $d600 
4659 : 10 fb __ BPL $4656 ; (vdc_set_mode.l1587 + 0)
.s44:
465b : ad 01 d6 LDA $d601 
465e : 29 10 __ AND #$10
4660 : 45 45 __ EOR T3 + 1 
4662 : 29 1f __ AND #$1f
4664 : 45 45 __ EOR T3 + 1 
4666 : aa __ __ TAX
4667 : a9 1c __ LDA #$1c
4669 : 8d 00 d6 STA $d600 
.l1589:
466c : 2c 00 d6 BIT $d600 
466f : 10 fb __ BPL $466c ; (vdc_set_mode.l1589 + 0)
.s50:
4671 : 8e 01 d6 STX $d601 
4674 : a5 4f __ LDA T7 + 0 
4676 : 85 0d __ STA P0 
4678 : a5 50 __ LDA T7 + 1 
467a : 85 0e __ STA P1 
467c : 20 0a 13 JSR $130a ; (bnk_redef_charset.s0 + 0)
467f : 18 __ __ CLC
4680 : a9 13 __ LDA #$13
4682 : 65 47 __ ADC T1 + 0 
4684 : 85 47 __ STA T1 + 0 
4686 : a9 58 __ LDA #$58
4688 : 69 00 __ ADC #$00
468a : 85 48 __ STA T1 + 1 
468c : a9 00 __ LDA #$00
468e : 85 43 __ STA T0 + 0 
.l52:
4690 : a4 43 __ LDY T0 + 0 
4692 : b1 47 __ LDA (T1 + 0),y 
4694 : 85 1b __ STA ACCU + 0 
4696 : c8 __ __ INY
4697 : b1 47 __ LDA (T1 + 0),y 
4699 : aa __ __ TAX
469a : a5 1b __ LDA ACCU + 0 
469c : 8d 00 d6 STA $d600 
469f : c8 __ __ INY
46a0 : 84 43 __ STY T0 + 0 
.l1591:
46a2 : 2c 00 d6 BIT $d600 
46a5 : 10 fb __ BPL $46a2 ; (vdc_set_mode.l1591 + 0)
.s58:
46a7 : 8e 01 d6 STX $d601 
46aa : 18 __ __ CLC
46ab : a5 49 __ LDA T2 + 0 
46ad : 65 43 __ ADC T0 + 0 
46af : 85 44 __ STA T3 + 0 
46b1 : a5 4a __ LDA T2 + 1 
46b3 : 69 00 __ ADC #$00
46b5 : 85 45 __ STA T3 + 1 
46b7 : a0 13 __ LDY #$13
46b9 : b1 44 __ LDA (T3 + 0),y 
46bb : c9 ff __ CMP #$ff
46bd : d0 d1 __ BNE $4690 ; (vdc_set_mode.l52 + 0)
.s53:
46bf : a0 04 __ LDY #$04
46c1 : b1 49 __ LDA (T2 + 0),y 
46c3 : f0 05 __ BEQ $46ca ; (vdc_set_mode.s60 + 0)
.s62:
46c5 : ad f7 58 LDA $58f7 ; (vdc_state + 1)
46c8 : f0 0f __ BEQ $46d9 ; (vdc_set_mode.s59 + 0)
.s60:
46ca : ad f9 58 LDA $58f9 ; (vdc_state + 3)
46cd : 85 47 __ STA T1 + 0 
46cf : ad fb 58 LDA $58fb ; (vdc_state + 5)
46d2 : 85 49 __ STA T2 + 0 
46d4 : a2 00 __ LDX #$00
46d6 : 4c ea 48 JMP $48ea ; (vdc_set_mode.l242 + 0)
.s59:
46d9 : ad f6 58 LDA $58f6 ; (vdc_state + 0)
46dc : c9 10 __ CMP #$10
46de : d0 03 __ BNE $46e3 ; (vdc_set_mode.s67 + 0)
46e0 : 4c f4 47 JMP $47f4 ; (vdc_set_mode.s61 + 0)
.s67:
46e3 : ad f7 58 LDA $58f7 ; (vdc_state + 1)
46e6 : f0 03 __ BEQ $46eb ; (vdc_set_mode.s66 + 0)
46e8 : 4c f4 47 JMP $47f4 ; (vdc_set_mode.s61 + 0)
.s66:
46eb : a9 22 __ LDA #$22
46ed : 8d 00 d6 STA $d600 
.l1624:
46f0 : 2c 00 d6 BIT $d600 
46f3 : 10 fb __ BPL $46f0 ; (vdc_set_mode.l1624 + 0)
.s74:
46f5 : a9 80 __ LDA #$80
46f7 : 8d 01 d6 STA $d601 
46fa : a2 00 __ LDX #$00
46fc : a0 ff __ LDY #$ff
.l77:
46fe : a9 12 __ LDA #$12
4700 : 8d 00 d6 STA $d600 
.l1626:
4703 : 2c 00 d6 BIT $d600 
4706 : 10 fb __ BPL $4703 ; (vdc_set_mode.l1626 + 0)
.s86:
4708 : 8e 01 d6 STX $d601 
470b : a9 13 __ LDA #$13
470d : 8d 00 d6 STA $d600 
.l1628:
4710 : 2c 00 d6 BIT $d600 
4713 : 10 fb __ BPL $4710 ; (vdc_set_mode.l1628 + 0)
.s91:
4715 : a9 00 __ LDA #$00
4717 : 8d 01 d6 STA $d601 
471a : a9 1f __ LDA #$1f
471c : 8d 00 d6 STA $d600 
.l1630:
471f : 2c 00 d6 BIT $d600 
4722 : 10 fb __ BPL $471f ; (vdc_set_mode.l1630 + 0)
.s95:
4724 : a9 00 __ LDA #$00
4726 : 8d 01 d6 STA $d601 
4729 : a9 18 __ LDA #$18
472b : 8d 00 d6 STA $d600 
.l1632:
472e : 2c 00 d6 BIT $d600 
4731 : 10 fb __ BPL $472e ; (vdc_set_mode.l1632 + 0)
.s101:
4733 : ad 01 d6 LDA $d601 
4736 : 29 7f __ AND #$7f
4738 : 85 49 __ STA T2 + 0 
473a : a9 18 __ LDA #$18
473c : 8d 00 d6 STA $d600 
.l1634:
473f : 2c 00 d6 BIT $d600 
4742 : 10 fb __ BPL $473f ; (vdc_set_mode.l1634 + 0)
.s107:
4744 : a5 49 __ LDA T2 + 0 
4746 : 8d 01 d6 STA $d601 
4749 : a9 1e __ LDA #$1e
474b : 8d 00 d6 STA $d600 
.l1636:
474e : 2c 00 d6 BIT $d600 
4751 : 10 fb __ BPL $474e ; (vdc_set_mode.l1636 + 0)
.s112:
4753 : a9 ff __ LDA #$ff
4755 : 8d 01 d6 STA $d601 
4758 : e8 __ __ INX
4759 : 88 __ __ DEY
475a : d0 a2 __ BNE $46fe ; (vdc_set_mode.l77 + 0)
.s79:
475c : a9 12 __ LDA #$12
475e : 8d 00 d6 STA $d600 
.l1639:
4761 : 2c 00 d6 BIT $d600 
4764 : 10 fb __ BPL $4761 ; (vdc_set_mode.l1639 + 0)
.s119:
4766 : 8e 01 d6 STX $d601 
4769 : a9 13 __ LDA #$13
476b : 8d 00 d6 STA $d600 
.l1641:
476e : 2c 00 d6 BIT $d600 
4771 : 10 fb __ BPL $476e ; (vdc_set_mode.l1641 + 0)
.s124:
4773 : 8c 01 d6 STY $d601 
4776 : a9 1f __ LDA #$1f
4778 : 8d 00 d6 STA $d600 
.l1643:
477b : 2c 00 d6 BIT $d600 
477e : 10 fb __ BPL $477b ; (vdc_set_mode.l1643 + 0)
.s128:
4780 : 8c 01 d6 STY $d601 
4783 : a9 18 __ LDA #$18
4785 : 8d 00 d6 STA $d600 
.l1645:
4788 : 2c 00 d6 BIT $d600 
478b : 10 fb __ BPL $4788 ; (vdc_set_mode.l1645 + 0)
.s134:
478d : ad 01 d6 LDA $d601 
4790 : 29 7f __ AND #$7f
4792 : aa __ __ TAX
4793 : a9 18 __ LDA #$18
4795 : 8d 00 d6 STA $d600 
.l1647:
4798 : 2c 00 d6 BIT $d600 
479b : 10 fb __ BPL $4798 ; (vdc_set_mode.l1647 + 0)
.s140:
479d : 8e 01 d6 STX $d601 
47a0 : a9 1e __ LDA #$1e
47a2 : 8d 00 d6 STA $d600 
.l1649:
47a5 : 2c 00 d6 BIT $d600 
47a8 : 10 fb __ BPL $47a5 ; (vdc_set_mode.l1649 + 0)
.s145:
47aa : a9 ff __ LDA #$ff
47ac : 8d 01 d6 STA $d601 
47af : a9 1c __ LDA #$1c
47b1 : 8d 00 d6 STA $d600 
.l1651:
47b4 : 2c 00 d6 BIT $d600 
47b7 : 10 fb __ BPL $47b4 ; (vdc_set_mode.l1651 + 0)
.s151:
47b9 : ad 01 d6 LDA $d601 
47bc : 09 10 __ ORA #$10
47be : aa __ __ TAX
47bf : a9 1c __ LDA #$1c
47c1 : 8d 00 d6 STA $d600 
.l1653:
47c4 : 2c 00 d6 BIT $d600 
47c7 : 10 fb __ BPL $47c4 ; (vdc_set_mode.l1653 + 0)
.s157:
47c9 : 8e 01 d6 STX $d601 
47cc : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
47cf : ad f9 58 LDA $58f9 ; (vdc_state + 3)
47d2 : 85 47 __ STA T1 + 0 
47d4 : ad fb 58 LDA $58fb ; (vdc_state + 5)
47d7 : 85 49 __ STA T2 + 0 
47d9 : a2 00 __ LDX #$00
.l161:
47db : 8a __ __ TXA
47dc : e4 49 __ CPX T2 + 0 
47de : 90 2e __ BCC $480e ; (vdc_set_mode.s162 + 0)
.s159:
47e0 : a9 22 __ LDA #$22
47e2 : 8d 00 d6 STA $d600 
.l1680:
47e5 : 2c 00 d6 BIT $d600 
47e8 : 10 fb __ BPL $47e5 ; (vdc_set_mode.l1680 + 0)
.s239:
47ea : a9 7d __ LDA #$7d
47ec : 8d 01 d6 STA $d601 
47ef : a9 01 __ LDA #$01
47f1 : 8d f7 58 STA $58f7 ; (vdc_state + 1)
.s61:
47f4 : a9 22 __ LDA #$22
47f6 : 8d 00 d6 STA $d600 
.l1621:
47f9 : 2c 00 d6 BIT $d600 
47fc : 10 fb __ BPL $47f9 ; (vdc_set_mode.l1621 + 0)
.s320:
47fe : a9 7d __ LDA #$7d
4800 : 8d 01 d6 STA $d601 
.s1001:
4803 : ad f9 bf LDA $bff9 ; (buffer + 9)
4806 : 85 53 __ STA T9 + 0 
4808 : ad fa bf LDA $bffa ; (buffer + 10)
480b : 85 54 __ STA T9 + 1 
480d : 60 __ __ RTS
.s162:
480e : 0a __ __ ASL
480f : a8 __ __ TAY
4810 : b9 10 59 LDA $5910,y ; (multab + 1)
4813 : 85 45 __ STA T3 + 1 
4815 : ad fd 58 LDA $58fd ; (vdc_state + 7)
4818 : 85 46 __ STA T11 + 0 
481a : a9 12 __ LDA #$12
481c : 8d 00 d6 STA $d600 
481f : a5 47 __ LDA T1 + 0 
4821 : 38 __ __ SEC
4822 : e9 01 __ SBC #$01
4824 : 85 4b __ STA T5 + 0 
4826 : b9 0f 59 LDA $590f,y ; (multab + 0)
4829 : 85 44 __ STA T3 + 0 
482b : 18 __ __ CLC
482c : 6d fe 58 ADC $58fe ; (vdc_state + 8)
482f : a8 __ __ TAY
4830 : a5 45 __ LDA T3 + 1 
4832 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l1656:
4835 : 2c 00 d6 BIT $d600 
4838 : 10 fb __ BPL $4835 ; (vdc_set_mode.l1656 + 0)
.s174:
483a : 8d 01 d6 STA $d601 
483d : a9 13 __ LDA #$13
483f : 8d 00 d6 STA $d600 
.l1658:
4842 : 2c 00 d6 BIT $d600 
4845 : 10 fb __ BPL $4842 ; (vdc_set_mode.l1658 + 0)
.s179:
4847 : 8c 01 d6 STY $d601 
484a : a9 1f __ LDA #$1f
484c : 8d 00 d6 STA $d600 
.l1660:
484f : 2c 00 d6 BIT $d600 
4852 : 10 fb __ BPL $484f ; (vdc_set_mode.l1660 + 0)
.s183:
4854 : a9 20 __ LDA #$20
4856 : 8d 01 d6 STA $d601 
4859 : a9 18 __ LDA #$18
485b : 8d 00 d6 STA $d600 
.l1662:
485e : 2c 00 d6 BIT $d600 
4861 : 10 fb __ BPL $485e ; (vdc_set_mode.l1662 + 0)
.s189:
4863 : ad 01 d6 LDA $d601 
4866 : 29 7f __ AND #$7f
4868 : a8 __ __ TAY
4869 : a9 18 __ LDA #$18
486b : 8d 00 d6 STA $d600 
.l1664:
486e : 2c 00 d6 BIT $d600 
4871 : 10 fb __ BPL $486e ; (vdc_set_mode.l1664 + 0)
.s195:
4873 : 8c 01 d6 STY $d601 
4876 : a9 1e __ LDA #$1e
4878 : 8d 00 d6 STA $d600 
.l1666:
487b : 2c 00 d6 BIT $d600 
487e : 10 fb __ BPL $487b ; (vdc_set_mode.l1666 + 0)
.s200:
4880 : a5 4b __ LDA T5 + 0 
4882 : 8d 01 d6 STA $d601 
4885 : ad 00 59 LDA $5900 ; (vdc_state + 10)
4888 : 18 __ __ CLC
4889 : 65 44 __ ADC T3 + 0 
488b : a8 __ __ TAY
488c : a9 12 __ LDA #$12
488e : 8d 00 d6 STA $d600 
4891 : ad 01 59 LDA $5901 ; (vdc_state + 11)
4894 : 65 45 __ ADC T3 + 1 
.l1668:
4896 : 2c 00 d6 BIT $d600 
4899 : 10 fb __ BPL $4896 ; (vdc_set_mode.l1668 + 0)
.s207:
489b : 8d 01 d6 STA $d601 
489e : a9 13 __ LDA #$13
48a0 : 8d 00 d6 STA $d600 
.l1670:
48a3 : 2c 00 d6 BIT $d600 
48a6 : 10 fb __ BPL $48a3 ; (vdc_set_mode.l1670 + 0)
.s212:
48a8 : 8c 01 d6 STY $d601 
48ab : a9 1f __ LDA #$1f
48ad : 8d 00 d6 STA $d600 
.l1672:
48b0 : 2c 00 d6 BIT $d600 
48b3 : 10 fb __ BPL $48b0 ; (vdc_set_mode.l1672 + 0)
.s216:
48b5 : a5 46 __ LDA T11 + 0 
48b7 : 8d 01 d6 STA $d601 
48ba : a9 18 __ LDA #$18
48bc : 8d 00 d6 STA $d600 
.l1674:
48bf : 2c 00 d6 BIT $d600 
48c2 : 10 fb __ BPL $48bf ; (vdc_set_mode.l1674 + 0)
.s222:
48c4 : ad 01 d6 LDA $d601 
48c7 : 29 7f __ AND #$7f
48c9 : a8 __ __ TAY
48ca : a9 18 __ LDA #$18
48cc : 8d 00 d6 STA $d600 
.l1676:
48cf : 2c 00 d6 BIT $d600 
48d2 : 10 fb __ BPL $48cf ; (vdc_set_mode.l1676 + 0)
.s228:
48d4 : 8c 01 d6 STY $d601 
48d7 : a9 1e __ LDA #$1e
48d9 : 8d 00 d6 STA $d600 
.l1678:
48dc : 2c 00 d6 BIT $d600 
48df : 10 fb __ BPL $48dc ; (vdc_set_mode.l1678 + 0)
.s233:
48e1 : a5 4b __ LDA T5 + 0 
48e3 : 8d 01 d6 STA $d601 
48e6 : e8 __ __ INX
48e7 : 4c db 47 JMP $47db ; (vdc_set_mode.l161 + 0)
.l242:
48ea : 8a __ __ TXA
48eb : e4 49 __ CPX T2 + 0 
48ed : 90 03 __ BCC $48f2 ; (vdc_set_mode.s243 + 0)
48ef : 4c f4 47 JMP $47f4 ; (vdc_set_mode.s61 + 0)
.s243:
48f2 : 0a __ __ ASL
48f3 : a8 __ __ TAY
48f4 : b9 10 59 LDA $5910,y ; (multab + 1)
48f7 : 85 45 __ STA T3 + 1 
48f9 : ad fd 58 LDA $58fd ; (vdc_state + 7)
48fc : 85 46 __ STA T11 + 0 
48fe : a9 12 __ LDA #$12
4900 : 8d 00 d6 STA $d600 
4903 : a5 47 __ LDA T1 + 0 
4905 : 38 __ __ SEC
4906 : e9 01 __ SBC #$01
4908 : 85 4b __ STA T5 + 0 
490a : b9 0f 59 LDA $590f,y ; (multab + 0)
490d : 85 44 __ STA T3 + 0 
490f : 18 __ __ CLC
4910 : 6d fe 58 ADC $58fe ; (vdc_state + 8)
4913 : a8 __ __ TAY
4914 : a5 45 __ LDA T3 + 1 
4916 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l1597:
4919 : 2c 00 d6 BIT $d600 
491c : 10 fb __ BPL $4919 ; (vdc_set_mode.l1597 + 0)
.s255:
491e : 8d 01 d6 STA $d601 
4921 : a9 13 __ LDA #$13
4923 : 8d 00 d6 STA $d600 
.l1599:
4926 : 2c 00 d6 BIT $d600 
4929 : 10 fb __ BPL $4926 ; (vdc_set_mode.l1599 + 0)
.s260:
492b : 8c 01 d6 STY $d601 
492e : a9 1f __ LDA #$1f
4930 : 8d 00 d6 STA $d600 
.l1601:
4933 : 2c 00 d6 BIT $d600 
4936 : 10 fb __ BPL $4933 ; (vdc_set_mode.l1601 + 0)
.s264:
4938 : a9 20 __ LDA #$20
493a : 8d 01 d6 STA $d601 
493d : a9 18 __ LDA #$18
493f : 8d 00 d6 STA $d600 
.l1603:
4942 : 2c 00 d6 BIT $d600 
4945 : 10 fb __ BPL $4942 ; (vdc_set_mode.l1603 + 0)
.s270:
4947 : ad 01 d6 LDA $d601 
494a : 29 7f __ AND #$7f
494c : a8 __ __ TAY
494d : a9 18 __ LDA #$18
494f : 8d 00 d6 STA $d600 
.l1605:
4952 : 2c 00 d6 BIT $d600 
4955 : 10 fb __ BPL $4952 ; (vdc_set_mode.l1605 + 0)
.s276:
4957 : 8c 01 d6 STY $d601 
495a : a9 1e __ LDA #$1e
495c : 8d 00 d6 STA $d600 
.l1607:
495f : 2c 00 d6 BIT $d600 
4962 : 10 fb __ BPL $495f ; (vdc_set_mode.l1607 + 0)
.s281:
4964 : a5 4b __ LDA T5 + 0 
4966 : 8d 01 d6 STA $d601 
4969 : ad 00 59 LDA $5900 ; (vdc_state + 10)
496c : 18 __ __ CLC
496d : 65 44 __ ADC T3 + 0 
496f : a8 __ __ TAY
4970 : a9 12 __ LDA #$12
4972 : 8d 00 d6 STA $d600 
4975 : ad 01 59 LDA $5901 ; (vdc_state + 11)
4978 : 65 45 __ ADC T3 + 1 
.l1609:
497a : 2c 00 d6 BIT $d600 
497d : 10 fb __ BPL $497a ; (vdc_set_mode.l1609 + 0)
.s288:
497f : 8d 01 d6 STA $d601 
4982 : a9 13 __ LDA #$13
4984 : 8d 00 d6 STA $d600 
.l1611:
4987 : 2c 00 d6 BIT $d600 
498a : 10 fb __ BPL $4987 ; (vdc_set_mode.l1611 + 0)
.s293:
498c : 8c 01 d6 STY $d601 
498f : a9 1f __ LDA #$1f
4991 : 8d 00 d6 STA $d600 
.l1613:
4994 : 2c 00 d6 BIT $d600 
4997 : 10 fb __ BPL $4994 ; (vdc_set_mode.l1613 + 0)
.s297:
4999 : a5 46 __ LDA T11 + 0 
499b : 8d 01 d6 STA $d601 
499e : a9 18 __ LDA #$18
49a0 : 8d 00 d6 STA $d600 
.l1615:
49a3 : 2c 00 d6 BIT $d600 
49a6 : 10 fb __ BPL $49a3 ; (vdc_set_mode.l1615 + 0)
.s303:
49a8 : ad 01 d6 LDA $d601 
49ab : 29 7f __ AND #$7f
49ad : a8 __ __ TAY
49ae : a9 18 __ LDA #$18
49b0 : 8d 00 d6 STA $d600 
.l1617:
49b3 : 2c 00 d6 BIT $d600 
49b6 : 10 fb __ BPL $49b3 ; (vdc_set_mode.l1617 + 0)
.s309:
49b8 : 8c 01 d6 STY $d601 
49bb : a9 1e __ LDA #$1e
49bd : 8d 00 d6 STA $d600 
.l1619:
49c0 : 2c 00 d6 BIT $d600 
49c3 : 10 fb __ BPL $49c0 ; (vdc_set_mode.l1619 + 0)
.s314:
49c5 : a5 4b __ LDA T5 + 0 
49c7 : 8d 01 d6 STA $d601 
49ca : e8 __ __ INX
49cb : 4c ea 48 JMP $48ea ; (vdc_set_mode.l242 + 0)
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
49ce : a9 a9 __ LDA #$a9
49d0 : 85 0e __ STA P1 
49d2 : a9 4e __ LDA #$4e
49d4 : 85 0f __ STA P2 
--------------------------------------------------------------------
vdc_prints: ; vdc_prints(u8,u8,const u8*)->void
.s0:
49d6 : a5 0d __ LDA P0 ; (y + 0)
49d8 : 0a __ __ ASL
49d9 : aa __ __ TAX
49da : bd 0f 59 LDA $590f,x ; (multab + 0)
49dd : 85 43 __ STA T2 + 0 
49df : bd 10 59 LDA $5910,x ; (multab + 1)
49e2 : 85 44 __ STA T2 + 1 
49e4 : a0 00 __ LDY #$00
49e6 : 84 1b __ STY ACCU + 0 
49e8 : b1 0e __ LDA (P1),y ; (string + 0)
49ea : f0 16 __ BEQ $4a02 ; (vdc_prints.s6 + 0)
.s5:
49ec : a5 0e __ LDA P1 ; (string + 0)
49ee : 85 1b __ STA ACCU + 0 
49f0 : a2 00 __ LDX #$00
.l1046:
49f2 : c8 __ __ INY
49f3 : d0 01 __ BNE $49f6 ; (vdc_prints.s1051 + 0)
.s1050:
49f5 : e8 __ __ INX
.s1051:
49f6 : 8a __ __ TXA
49f7 : 18 __ __ CLC
49f8 : 65 0f __ ADC P2 ; (string + 1)
49fa : 85 1c __ STA ACCU + 1 
49fc : b1 1b __ LDA (ACCU + 0),y 
49fe : d0 f2 __ BNE $49f2 ; (vdc_prints.l1046 + 0)
.s1047:
4a00 : 84 1b __ STY ACCU + 0 
.s6:
4a02 : ad fe 58 LDA $58fe ; (vdc_state + 8)
4a05 : 18 __ __ CLC
4a06 : 65 43 __ ADC T2 + 0 
4a08 : aa __ __ TAX
4a09 : a9 12 __ LDA #$12
4a0b : 8d 00 d6 STA $d600 
4a0e : ad ff 58 LDA $58ff ; (vdc_state + 9)
4a11 : 65 44 __ ADC T2 + 1 
.l354:
4a13 : 2c 00 d6 BIT $d600 
4a16 : 10 fb __ BPL $4a13 ; (vdc_prints.l354 + 0)
.s13:
4a18 : 8d 01 d6 STA $d601 
4a1b : a9 13 __ LDA #$13
4a1d : 8d 00 d6 STA $d600 
.l356:
4a20 : 2c 00 d6 BIT $d600 
4a23 : 10 fb __ BPL $4a20 ; (vdc_prints.l356 + 0)
.s18:
4a25 : 8e 01 d6 STX $d601 
4a28 : a9 1f __ LDA #$1f
4a2a : 8d 00 d6 STA $d600 
4a2d : a5 1b __ LDA ACCU + 0 
4a2f : f0 61 __ BEQ $4a92 ; (vdc_prints.s23 + 0)
.s95:
4a31 : a0 00 __ LDY #$00
.l21:
4a33 : b1 0e __ LDA (P1),y ; (string + 0)
4a35 : c9 20 __ CMP #$20
4a37 : b0 05 __ BCS $4a3e ; (vdc_prints.s27 + 0)
.s26:
4a39 : 69 80 __ ADC #$80
4a3b : 4c 84 4a JMP $4a84 ; (vdc_prints.s1048 + 0)
.s27:
4a3e : aa __ __ TAX
4a3f : c9 40 __ CMP #$40
4a41 : 90 04 __ BCC $4a47 ; (vdc_prints.s30 + 0)
.s32:
4a43 : c9 60 __ CMP #$60
4a45 : 90 23 __ BCC $4a6a ; (vdc_prints.s29 + 0)
.s30:
4a47 : c9 60 __ CMP #$60
4a49 : 90 0a __ BCC $4a55 ; (vdc_prints.s34 + 0)
.s36:
4a4b : 09 00 __ ORA #$00
4a4d : 30 06 __ BMI $4a55 ; (vdc_prints.s34 + 0)
.s33:
4a4f : 38 __ __ SEC
4a50 : e9 20 __ SBC #$20
4a52 : 4c 84 4a JMP $4a84 ; (vdc_prints.s1048 + 0)
.s34:
4a55 : c9 80 __ CMP #$80
4a57 : 90 09 __ BCC $4a62 ; (vdc_prints.s38 + 0)
.s40:
4a59 : c9 a0 __ CMP #$a0
4a5b : b0 05 __ BCS $4a62 ; (vdc_prints.s38 + 0)
.s37:
4a5d : 69 40 __ ADC #$40
4a5f : 4c 84 4a JMP $4a84 ; (vdc_prints.s1048 + 0)
.s38:
4a62 : c9 a0 __ CMP #$a0
4a64 : 90 0a __ BCC $4a70 ; (vdc_prints.s42 + 0)
.s44:
4a66 : c9 c0 __ CMP #$c0
4a68 : b0 06 __ BCS $4a70 ; (vdc_prints.s42 + 0)
.s29:
4a6a : 38 __ __ SEC
4a6b : e9 40 __ SBC #$40
4a6d : 4c 84 4a JMP $4a84 ; (vdc_prints.s1048 + 0)
.s42:
4a70 : c9 c0 __ CMP #$c0
4a72 : 90 0a __ BCC $4a7e ; (vdc_prints.s46 + 0)
.s48:
4a74 : c9 ff __ CMP #$ff
4a76 : b0 06 __ BCS $4a7e ; (vdc_prints.s46 + 0)
.s45:
4a78 : 38 __ __ SEC
4a79 : e9 80 __ SBC #$80
4a7b : 4c 84 4a JMP $4a84 ; (vdc_prints.s1048 + 0)
.s46:
4a7e : c9 ff __ CMP #$ff
4a80 : d0 03 __ BNE $4a85 ; (vdc_prints.l360 + 0)
.s49:
4a82 : a9 5e __ LDA #$5e
.s1048:
4a84 : aa __ __ TAX
.l360:
4a85 : 2c 00 d6 BIT $d600 
4a88 : 10 fb __ BPL $4a85 ; (vdc_prints.l360 + 0)
.s54:
4a8a : 8e 01 d6 STX $d601 
4a8d : c8 __ __ INY
4a8e : c4 1b __ CPY ACCU + 0 
4a90 : 90 a1 __ BCC $4a33 ; (vdc_prints.l21 + 0)
.s23:
4a92 : a9 12 __ LDA #$12
4a94 : 8d 00 d6 STA $d600 
4a97 : c6 1b __ DEC ACCU + 0 
4a99 : ad 00 59 LDA $5900 ; (vdc_state + 10)
4a9c : 18 __ __ CLC
4a9d : 65 43 __ ADC T2 + 0 
4a9f : a8 __ __ TAY
4aa0 : ad 01 59 LDA $5901 ; (vdc_state + 11)
4aa3 : 65 44 __ ADC T2 + 1 
4aa5 : ae fd 58 LDX $58fd ; (vdc_state + 7)
.l363:
4aa8 : 2c 00 d6 BIT $d600 
4aab : 10 fb __ BPL $4aa8 ; (vdc_prints.l363 + 0)
.s61:
4aad : 8d 01 d6 STA $d601 
4ab0 : a9 13 __ LDA #$13
4ab2 : 8d 00 d6 STA $d600 
.l365:
4ab5 : 2c 00 d6 BIT $d600 
4ab8 : 10 fb __ BPL $4ab5 ; (vdc_prints.l365 + 0)
.s66:
4aba : 8c 01 d6 STY $d601 
4abd : a9 1f __ LDA #$1f
4abf : 8d 00 d6 STA $d600 
.l367:
4ac2 : 2c 00 d6 BIT $d600 
4ac5 : 10 fb __ BPL $4ac2 ; (vdc_prints.l367 + 0)
.s70:
4ac7 : 8e 01 d6 STX $d601 
4aca : a9 18 __ LDA #$18
4acc : 8d 00 d6 STA $d600 
.l369:
4acf : 2c 00 d6 BIT $d600 
4ad2 : 10 fb __ BPL $4acf ; (vdc_prints.l369 + 0)
.s76:
4ad4 : ad 01 d6 LDA $d601 
4ad7 : 29 7f __ AND #$7f
4ad9 : aa __ __ TAX
4ada : a9 18 __ LDA #$18
4adc : 8d 00 d6 STA $d600 
.l371:
4adf : 2c 00 d6 BIT $d600 
4ae2 : 10 fb __ BPL $4adf ; (vdc_prints.l371 + 0)
.s82:
4ae4 : 8e 01 d6 STX $d601 
4ae7 : a9 1e __ LDA #$1e
4ae9 : 8d 00 d6 STA $d600 
.l373:
4aec : 2c 00 d6 BIT $d600 
4aef : 10 fb __ BPL $4aec ; (vdc_prints.l373 + 0)
.s87:
4af1 : a5 1b __ LDA ACCU + 0 
4af3 : 8d 01 d6 STA $d601 
.s1001:
4af6 : 60 __ __ RTS
--------------------------------------------------------------------
4af7 : __ __ __ BYT 65 4e 00                                        : eN.
--------------------------------------------------------------------
4afa : __ __ __ BYT 64 49 53 00                                     : dIS.
--------------------------------------------------------------------
4afe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
spentry:
4aff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4b00 : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 6f 53 43 41 52 36 34 : sTARTING oSCAR64
4b10 : __ __ __ BYT 20 76 64 63 20 44 45 4d 4f 2e 00                :  vdc DEMO..
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
4b1b : a2 03 __ LDX #$03
4b1d : b5 53 __ LDA T8 + 0,x 
4b1f : 9d e4 bf STA $bfe4,x ; (buff + 38)
4b22 : ca __ __ DEX
4b23 : 10 f8 __ BPL $4b1d ; (sprintf.s1000 + 2)
.s0:
4b25 : 18 __ __ CLC
4b26 : a5 23 __ LDA SP + 0 
4b28 : 69 06 __ ADC #$06
4b2a : 85 47 __ STA T0 + 0 
4b2c : a5 24 __ LDA SP + 1 
4b2e : 69 00 __ ADC #$00
4b30 : 85 48 __ STA T0 + 1 
4b32 : a9 00 __ LDA #$00
4b34 : 85 43 __ STA T1 + 0 
4b36 : a0 04 __ LDY #$04
4b38 : b1 23 __ LDA (SP + 0),y 
4b3a : 85 49 __ STA T2 + 0 
4b3c : c8 __ __ INY
4b3d : b1 23 __ LDA (SP + 0),y 
4b3f : 85 4a __ STA T2 + 1 
4b41 : a0 02 __ LDY #$02
4b43 : b1 23 __ LDA (SP + 0),y 
4b45 : 85 4b __ STA T3 + 0 
4b47 : c8 __ __ INY
4b48 : b1 23 __ LDA (SP + 0),y 
4b4a : 85 4c __ STA T3 + 1 
.l2:
4b4c : a0 00 __ LDY #$00
4b4e : b1 49 __ LDA (T2 + 0),y 
4b50 : d0 0f __ BNE $4b61 ; (sprintf.s3 + 0)
.s4:
4b52 : a4 43 __ LDY T1 + 0 
4b54 : 91 4b __ STA (T3 + 0),y 
.s1001:
4b56 : a2 03 __ LDX #$03
4b58 : bd e4 bf LDA $bfe4,x ; (buff + 38)
4b5b : 95 53 __ STA T8 + 0,x 
4b5d : ca __ __ DEX
4b5e : 10 f8 __ BPL $4b58 ; (sprintf.s1001 + 2)
4b60 : 60 __ __ RTS
.s3:
4b61 : c9 25 __ CMP #$25
4b63 : f0 22 __ BEQ $4b87 ; (sprintf.s5 + 0)
.s6:
4b65 : a4 43 __ LDY T1 + 0 
4b67 : 91 4b __ STA (T3 + 0),y 
4b69 : e6 49 __ INC T2 + 0 
4b6b : d0 02 __ BNE $4b6f ; (sprintf.s1102 + 0)
.s1101:
4b6d : e6 4a __ INC T2 + 1 
.s1102:
4b6f : c8 __ __ INY
4b70 : 84 43 __ STY T1 + 0 
4b72 : 98 __ __ TYA
4b73 : c0 28 __ CPY #$28
4b75 : 90 d5 __ BCC $4b4c ; (sprintf.l2 + 0)
.s111:
4b77 : 18 __ __ CLC
4b78 : 65 4b __ ADC T3 + 0 
4b7a : 85 4b __ STA T3 + 0 
4b7c : 90 02 __ BCC $4b80 ; (sprintf.s1104 + 0)
.s1103:
4b7e : e6 4c __ INC T3 + 1 
.s1104:
4b80 : a9 00 __ LDA #$00
.s1068:
4b82 : 85 43 __ STA T1 + 0 
4b84 : 4c 4c 4b JMP $4b4c ; (sprintf.l2 + 0)
.s5:
4b87 : 8c ec bf STY $bfec ; (buff + 46)
4b8a : 8c ed bf STY $bfed ; (buff + 47)
4b8d : 8c ee bf STY $bfee ; (buff + 48)
4b90 : 8c ef bf STY $bfef ; (buff + 49)
4b93 : a9 0a __ LDA #$0a
4b95 : 8d eb bf STA $bfeb ; (buff + 45)
4b98 : a5 43 __ LDA T1 + 0 
4b9a : f0 0b __ BEQ $4ba7 ; (sprintf.s10 + 0)
.s8:
4b9c : 18 __ __ CLC
4b9d : 65 4b __ ADC T3 + 0 
4b9f : 85 4b __ STA T3 + 0 
4ba1 : 90 02 __ BCC $4ba5 ; (sprintf.s1080 + 0)
.s1079:
4ba3 : e6 4c __ INC T3 + 1 
.s1080:
4ba5 : 84 43 __ STY T1 + 0 
.s10:
4ba7 : a0 01 __ LDY #$01
4ba9 : b1 49 __ LDA (T2 + 0),y 
4bab : aa __ __ TAX
4bac : a9 20 __ LDA #$20
4bae : 8d e8 bf STA $bfe8 ; (buff + 42)
4bb1 : a9 00 __ LDA #$00
4bb3 : 8d e9 bf STA $bfe9 ; (buff + 43)
4bb6 : a9 ff __ LDA #$ff
4bb8 : 8d ea bf STA $bfea ; (buff + 44)
4bbb : 18 __ __ CLC
4bbc : a5 49 __ LDA T2 + 0 
4bbe : 69 02 __ ADC #$02
.l15:
4bc0 : 85 49 __ STA T2 + 0 
4bc2 : 90 02 __ BCC $4bc6 ; (sprintf.s1082 + 0)
.s1081:
4bc4 : e6 4a __ INC T2 + 1 
.s1082:
4bc6 : 8a __ __ TXA
4bc7 : e0 2b __ CPX #$2b
4bc9 : d0 08 __ BNE $4bd3 ; (sprintf.s18 + 0)
.s17:
4bcb : a9 01 __ LDA #$01
4bcd : 8d ed bf STA $bfed ; (buff + 47)
4bd0 : 4c 34 4e JMP $4e34 ; (sprintf.s260 + 0)
.s18:
4bd3 : c9 30 __ CMP #$30
4bd5 : d0 06 __ BNE $4bdd ; (sprintf.s21 + 0)
.s20:
4bd7 : 8d e8 bf STA $bfe8 ; (buff + 42)
4bda : 4c 34 4e JMP $4e34 ; (sprintf.s260 + 0)
.s21:
4bdd : e0 23 __ CPX #$23
4bdf : d0 08 __ BNE $4be9 ; (sprintf.s24 + 0)
.s23:
4be1 : a9 01 __ LDA #$01
4be3 : 8d ef bf STA $bfef ; (buff + 49)
4be6 : 4c 34 4e JMP $4e34 ; (sprintf.s260 + 0)
.s24:
4be9 : e0 2d __ CPX #$2d
4beb : d0 08 __ BNE $4bf5 ; (sprintf.s16 + 0)
.s26:
4bed : a9 01 __ LDA #$01
4bef : 8d ee bf STA $bfee ; (buff + 48)
4bf2 : 4c 34 4e JMP $4e34 ; (sprintf.s260 + 0)
.s16:
4bf5 : 85 45 __ STA T4 + 0 
4bf7 : e0 30 __ CPX #$30
4bf9 : 90 53 __ BCC $4c4e ; (sprintf.s32 + 0)
.s33:
4bfb : e0 3a __ CPX #$3a
4bfd : b0 4f __ BCS $4c4e ; (sprintf.s32 + 0)
.s30:
4bff : a9 00 __ LDA #$00
4c01 : 85 4d __ STA T6 + 0 
4c03 : 85 4e __ STA T6 + 1 
4c05 : e0 3a __ CPX #$3a
4c07 : b0 40 __ BCS $4c49 ; (sprintf.s36 + 0)
.l35:
4c09 : a5 4d __ LDA T6 + 0 
4c0b : 0a __ __ ASL
4c0c : 85 1b __ STA ACCU + 0 
4c0e : a5 4e __ LDA T6 + 1 
4c10 : 2a __ __ ROL
4c11 : 06 1b __ ASL ACCU + 0 
4c13 : 2a __ __ ROL
4c14 : aa __ __ TAX
4c15 : 18 __ __ CLC
4c16 : a5 1b __ LDA ACCU + 0 
4c18 : 65 4d __ ADC T6 + 0 
4c1a : 85 4d __ STA T6 + 0 
4c1c : 8a __ __ TXA
4c1d : 65 4e __ ADC T6 + 1 
4c1f : 06 4d __ ASL T6 + 0 
4c21 : 2a __ __ ROL
4c22 : aa __ __ TAX
4c23 : 18 __ __ CLC
4c24 : a5 4d __ LDA T6 + 0 
4c26 : 65 45 __ ADC T4 + 0 
4c28 : 90 01 __ BCC $4c2b ; (sprintf.s1098 + 0)
.s1097:
4c2a : e8 __ __ INX
.s1098:
4c2b : 38 __ __ SEC
4c2c : e9 30 __ SBC #$30
4c2e : 85 4d __ STA T6 + 0 
4c30 : 8a __ __ TXA
4c31 : e9 00 __ SBC #$00
4c33 : 85 4e __ STA T6 + 1 
4c35 : a0 00 __ LDY #$00
4c37 : b1 49 __ LDA (T2 + 0),y 
4c39 : 85 45 __ STA T4 + 0 
4c3b : e6 49 __ INC T2 + 0 
4c3d : d0 02 __ BNE $4c41 ; (sprintf.s1100 + 0)
.s1099:
4c3f : e6 4a __ INC T2 + 1 
.s1100:
4c41 : c9 30 __ CMP #$30
4c43 : 90 04 __ BCC $4c49 ; (sprintf.s36 + 0)
.s37:
4c45 : c9 3a __ CMP #$3a
4c47 : 90 c0 __ BCC $4c09 ; (sprintf.l35 + 0)
.s36:
4c49 : a5 4d __ LDA T6 + 0 
4c4b : 8d e9 bf STA $bfe9 ; (buff + 43)
.s32:
4c4e : a5 45 __ LDA T4 + 0 
4c50 : c9 2e __ CMP #$2e
4c52 : d0 51 __ BNE $4ca5 ; (sprintf.s40 + 0)
.s38:
4c54 : a9 00 __ LDA #$00
4c56 : 85 4d __ STA T6 + 0 
.l245:
4c58 : 85 4e __ STA T6 + 1 
4c5a : a0 00 __ LDY #$00
4c5c : b1 49 __ LDA (T2 + 0),y 
4c5e : 85 45 __ STA T4 + 0 
4c60 : e6 49 __ INC T2 + 0 
4c62 : d0 02 __ BNE $4c66 ; (sprintf.s1084 + 0)
.s1083:
4c64 : e6 4a __ INC T2 + 1 
.s1084:
4c66 : c9 30 __ CMP #$30
4c68 : 90 04 __ BCC $4c6e ; (sprintf.s43 + 0)
.s44:
4c6a : c9 3a __ CMP #$3a
4c6c : 90 0a __ BCC $4c78 ; (sprintf.s42 + 0)
.s43:
4c6e : a5 4d __ LDA T6 + 0 
4c70 : 8d ea bf STA $bfea ; (buff + 44)
4c73 : a5 45 __ LDA T4 + 0 
4c75 : 4c a5 4c JMP $4ca5 ; (sprintf.s40 + 0)
.s42:
4c78 : a5 4d __ LDA T6 + 0 
4c7a : 0a __ __ ASL
4c7b : 85 1b __ STA ACCU + 0 
4c7d : a5 4e __ LDA T6 + 1 
4c7f : 2a __ __ ROL
4c80 : 06 1b __ ASL ACCU + 0 
4c82 : 2a __ __ ROL
4c83 : aa __ __ TAX
4c84 : 18 __ __ CLC
4c85 : a5 1b __ LDA ACCU + 0 
4c87 : 65 4d __ ADC T6 + 0 
4c89 : 85 4d __ STA T6 + 0 
4c8b : 8a __ __ TXA
4c8c : 65 4e __ ADC T6 + 1 
4c8e : 06 4d __ ASL T6 + 0 
4c90 : 2a __ __ ROL
4c91 : aa __ __ TAX
4c92 : 18 __ __ CLC
4c93 : a5 4d __ LDA T6 + 0 
4c95 : 65 45 __ ADC T4 + 0 
4c97 : 90 01 __ BCC $4c9a ; (sprintf.s1096 + 0)
.s1095:
4c99 : e8 __ __ INX
.s1096:
4c9a : 38 __ __ SEC
4c9b : e9 30 __ SBC #$30
4c9d : 85 4d __ STA T6 + 0 
4c9f : 8a __ __ TXA
4ca0 : e9 00 __ SBC #$00
4ca2 : 4c 58 4c JMP $4c58 ; (sprintf.l245 + 0)
.s40:
4ca5 : c9 64 __ CMP #$64
4ca7 : f0 04 __ BEQ $4cad ; (sprintf.s45 + 0)
.s48:
4ca9 : c9 44 __ CMP #$44
4cab : d0 05 __ BNE $4cb2 ; (sprintf.s46 + 0)
.s45:
4cad : a9 01 __ LDA #$01
4caf : 4c 0d 4e JMP $4e0d ; (sprintf.s261 + 0)
.s46:
4cb2 : c9 75 __ CMP #$75
4cb4 : d0 03 __ BNE $4cb9 ; (sprintf.s52 + 0)
4cb6 : 4c 0b 4e JMP $4e0b ; (sprintf.s285 + 0)
.s52:
4cb9 : c9 55 __ CMP #$55
4cbb : d0 03 __ BNE $4cc0 ; (sprintf.s50 + 0)
4cbd : 4c 0b 4e JMP $4e0b ; (sprintf.s285 + 0)
.s50:
4cc0 : c9 78 __ CMP #$78
4cc2 : f0 04 __ BEQ $4cc8 ; (sprintf.s53 + 0)
.s56:
4cc4 : c9 58 __ CMP #$58
4cc6 : d0 0d __ BNE $4cd5 ; (sprintf.s54 + 0)
.s53:
4cc8 : a9 10 __ LDA #$10
4cca : 8d eb bf STA $bfeb ; (buff + 45)
4ccd : a9 00 __ LDA #$00
4ccf : 8d ec bf STA $bfec ; (buff + 46)
4cd2 : 4c 0b 4e JMP $4e0b ; (sprintf.s285 + 0)
.s54:
4cd5 : c9 6c __ CMP #$6c
4cd7 : d0 03 __ BNE $4cdc ; (sprintf.s60 + 0)
4cd9 : 4c 9d 4d JMP $4d9d ; (sprintf.s57 + 0)
.s60:
4cdc : c9 4c __ CMP #$4c
4cde : d0 03 __ BNE $4ce3 ; (sprintf.s58 + 0)
4ce0 : 4c 9d 4d JMP $4d9d ; (sprintf.s57 + 0)
.s58:
4ce3 : c9 73 __ CMP #$73
4ce5 : f0 37 __ BEQ $4d1e ; (sprintf.s73 + 0)
.s76:
4ce7 : c9 53 __ CMP #$53
4ce9 : f0 33 __ BEQ $4d1e ; (sprintf.s73 + 0)
.s74:
4ceb : c9 63 __ CMP #$63
4ced : f0 14 __ BEQ $4d03 ; (sprintf.s104 + 0)
.s107:
4cef : c9 43 __ CMP #$43
4cf1 : f0 10 __ BEQ $4d03 ; (sprintf.s104 + 0)
.s105:
4cf3 : 09 00 __ ORA #$00
4cf5 : d0 03 __ BNE $4cfa ; (sprintf.s108 + 0)
4cf7 : 4c 4c 4b JMP $4b4c ; (sprintf.l2 + 0)
.s108:
4cfa : a4 43 __ LDY T1 + 0 
4cfc : 91 4b __ STA (T3 + 0),y 
4cfe : e6 43 __ INC T1 + 0 
4d00 : 4c 4c 4b JMP $4b4c ; (sprintf.l2 + 0)
.s104:
4d03 : a0 00 __ LDY #$00
4d05 : b1 47 __ LDA (T0 + 0),y 
4d07 : a4 43 __ LDY T1 + 0 
4d09 : 91 4b __ STA (T3 + 0),y 
4d0b : e6 43 __ INC T1 + 0 
.s258:
4d0d : 18 __ __ CLC
4d0e : a5 47 __ LDA T0 + 0 
4d10 : 69 02 __ ADC #$02
4d12 : 85 47 __ STA T0 + 0 
4d14 : b0 03 __ BCS $4d19 ; (sprintf.s1085 + 0)
4d16 : 4c 4c 4b JMP $4b4c ; (sprintf.l2 + 0)
.s1085:
4d19 : e6 48 __ INC T0 + 1 
4d1b : 4c 4c 4b JMP $4b4c ; (sprintf.l2 + 0)
.s73:
4d1e : a0 00 __ LDY #$00
4d20 : 84 45 __ STY T4 + 0 
4d22 : b1 47 __ LDA (T0 + 0),y 
4d24 : 85 4d __ STA T6 + 0 
4d26 : c8 __ __ INY
4d27 : b1 47 __ LDA (T0 + 0),y 
4d29 : 85 4e __ STA T6 + 1 
4d2b : 18 __ __ CLC
4d2c : a5 47 __ LDA T0 + 0 
4d2e : 69 02 __ ADC #$02
4d30 : 85 47 __ STA T0 + 0 
4d32 : 90 02 __ BCC $4d36 ; (sprintf.s1092 + 0)
.s1091:
4d34 : e6 48 __ INC T0 + 1 
.s1092:
4d36 : ad e9 bf LDA $bfe9 ; (buff + 43)
4d39 : f0 0d __ BEQ $4d48 ; (sprintf.s79 + 0)
.s1071:
4d3b : a0 00 __ LDY #$00
4d3d : b1 4d __ LDA (T6 + 0),y 
4d3f : f0 05 __ BEQ $4d46 ; (sprintf.s1072 + 0)
.l81:
4d41 : c8 __ __ INY
4d42 : b1 4d __ LDA (T6 + 0),y 
4d44 : d0 fb __ BNE $4d41 ; (sprintf.l81 + 0)
.s1072:
4d46 : 84 45 __ STY T4 + 0 
.s79:
4d48 : ad ee bf LDA $bfee ; (buff + 48)
4d4b : d0 19 __ BNE $4d66 ; (sprintf.l95 + 0)
.s1075:
4d4d : a6 45 __ LDX T4 + 0 
4d4f : ec e9 bf CPX $bfe9 ; (buff + 43)
4d52 : a4 43 __ LDY T1 + 0 
4d54 : b0 0c __ BCS $4d62 ; (sprintf.s1076 + 0)
.l87:
4d56 : ad e8 bf LDA $bfe8 ; (buff + 42)
4d59 : 91 4b __ STA (T3 + 0),y 
4d5b : e8 __ __ INX
4d5c : ec e9 bf CPX $bfe9 ; (buff + 43)
4d5f : c8 __ __ INY
4d60 : 90 f4 __ BCC $4d56 ; (sprintf.l87 + 0)
.s1076:
4d62 : 86 45 __ STX T4 + 0 
4d64 : 84 43 __ STY T1 + 0 
.l95:
4d66 : a0 00 __ LDY #$00
4d68 : b1 4d __ LDA (T6 + 0),y 
4d6a : f0 0f __ BEQ $4d7b ; (sprintf.s91 + 0)
.s96:
4d6c : a4 43 __ LDY T1 + 0 
4d6e : 91 4b __ STA (T3 + 0),y 
4d70 : e6 43 __ INC T1 + 0 
4d72 : e6 4d __ INC T6 + 0 
4d74 : d0 f0 __ BNE $4d66 ; (sprintf.l95 + 0)
.s1093:
4d76 : e6 4e __ INC T6 + 1 
4d78 : 4c 66 4d JMP $4d66 ; (sprintf.l95 + 0)
.s91:
4d7b : ad ee bf LDA $bfee ; (buff + 48)
4d7e : d0 03 __ BNE $4d83 ; (sprintf.s1073 + 0)
4d80 : 4c 4c 4b JMP $4b4c ; (sprintf.l2 + 0)
.s1073:
4d83 : a6 45 __ LDX T4 + 0 
4d85 : ec e9 bf CPX $bfe9 ; (buff + 43)
4d88 : a4 43 __ LDY T1 + 0 
4d8a : b0 0c __ BCS $4d98 ; (sprintf.s1074 + 0)
.l102:
4d8c : ad e8 bf LDA $bfe8 ; (buff + 42)
4d8f : 91 4b __ STA (T3 + 0),y 
4d91 : e8 __ __ INX
4d92 : ec e9 bf CPX $bfe9 ; (buff + 43)
4d95 : c8 __ __ INY
4d96 : 90 f4 __ BCC $4d8c ; (sprintf.l102 + 0)
.s1074:
4d98 : 84 43 __ STY T1 + 0 
4d9a : 4c 4c 4b JMP $4b4c ; (sprintf.l2 + 0)
.s57:
4d9d : a0 00 __ LDY #$00
4d9f : b1 47 __ LDA (T0 + 0),y 
4da1 : 85 53 __ STA T8 + 0 
4da3 : c8 __ __ INY
4da4 : b1 47 __ LDA (T0 + 0),y 
4da6 : 85 54 __ STA T8 + 1 
4da8 : c8 __ __ INY
4da9 : b1 47 __ LDA (T0 + 0),y 
4dab : 85 55 __ STA T8 + 2 
4dad : c8 __ __ INY
4dae : b1 47 __ LDA (T0 + 0),y 
4db0 : 85 56 __ STA T8 + 3 
4db2 : 18 __ __ CLC
4db3 : a5 47 __ LDA T0 + 0 
4db5 : 69 04 __ ADC #$04
4db7 : 85 47 __ STA T0 + 0 
4db9 : 90 02 __ BCC $4dbd ; (sprintf.s1088 + 0)
.s1087:
4dbb : e6 48 __ INC T0 + 1 
.s1088:
4dbd : a0 00 __ LDY #$00
4dbf : b1 49 __ LDA (T2 + 0),y 
4dc1 : aa __ __ TAX
4dc2 : e6 49 __ INC T2 + 0 
4dc4 : d0 02 __ BNE $4dc8 ; (sprintf.s1090 + 0)
.s1089:
4dc6 : e6 4a __ INC T2 + 1 
.s1090:
4dc8 : 8a __ __ TXA
4dc9 : e0 64 __ CPX #$64
4dcb : f0 04 __ BEQ $4dd1 ; (sprintf.s61 + 0)
.s64:
4dcd : c9 44 __ CMP #$44
4dcf : d0 04 __ BNE $4dd5 ; (sprintf.s62 + 0)
.s61:
4dd1 : a9 01 __ LDA #$01
4dd3 : d0 1c __ BNE $4df1 ; (sprintf.s259 + 0)
.s62:
4dd5 : c9 75 __ CMP #$75
4dd7 : f0 17 __ BEQ $4df0 ; (sprintf.s284 + 0)
.s68:
4dd9 : c9 55 __ CMP #$55
4ddb : f0 13 __ BEQ $4df0 ; (sprintf.s284 + 0)
.s66:
4ddd : c9 78 __ CMP #$78
4ddf : f0 07 __ BEQ $4de8 ; (sprintf.s69 + 0)
.s72:
4de1 : c9 58 __ CMP #$58
4de3 : f0 03 __ BEQ $4de8 ; (sprintf.s69 + 0)
4de5 : 4c 4c 4b JMP $4b4c ; (sprintf.l2 + 0)
.s69:
4de8 : 8c ec bf STY $bfec ; (buff + 46)
4deb : a9 10 __ LDA #$10
4ded : 8d eb bf STA $bfeb ; (buff + 45)
.s284:
4df0 : 98 __ __ TYA
.s259:
4df1 : 85 15 __ STA P8 
4df3 : a5 4b __ LDA T3 + 0 
4df5 : 85 0f __ STA P2 ; (fmt + 0)
4df7 : a5 4c __ LDA T3 + 1 
4df9 : 85 10 __ STA P3 ; (fmt + 1)
4dfb : a9 e8 __ LDA #$e8
4dfd : 85 0d __ STA P0 ; (str + 0)
4dff : a9 bf __ LDA #$bf
4e01 : 85 0e __ STA P1 ; (str + 1)
4e03 : 20 53 42 JSR $4253 ; (nforml@proxy + 0)
4e06 : a5 1b __ LDA ACCU + 0 
4e08 : 4c 82 4b JMP $4b82 ; (sprintf.s1068 + 0)
.s285:
4e0b : a9 00 __ LDA #$00
.s261:
4e0d : 85 13 __ STA P6 
4e0f : a5 4b __ LDA T3 + 0 
4e11 : 85 0f __ STA P2 ; (fmt + 0)
4e13 : a5 4c __ LDA T3 + 1 
4e15 : 85 10 __ STA P3 ; (fmt + 1)
4e17 : a0 00 __ LDY #$00
4e19 : b1 47 __ LDA (T0 + 0),y 
4e1b : 85 11 __ STA P4 ; (fmt + 2)
4e1d : c8 __ __ INY
4e1e : b1 47 __ LDA (T0 + 0),y 
4e20 : 85 12 __ STA P5 ; (fmt + 3)
4e22 : a9 e8 __ LDA #$e8
4e24 : 85 0d __ STA P0 ; (str + 0)
4e26 : a9 bf __ LDA #$bf
4e28 : 85 0e __ STA P1 ; (str + 1)
4e2a : 20 1e 41 JSR $411e ; (nformi.s0 + 0)
4e2d : a5 1b __ LDA ACCU + 0 
4e2f : 85 43 __ STA T1 + 0 
4e31 : 4c 0d 4d JMP $4d0d ; (sprintf.s258 + 0)
.s260:
4e34 : a0 00 __ LDY #$00
4e36 : b1 49 __ LDA (T2 + 0),y 
4e38 : aa __ __ TAX
4e39 : 18 __ __ CLC
4e3a : a5 49 __ LDA T2 + 0 
4e3c : 69 01 __ ADC #$01
4e3e : 4c c0 4b JMP $4bc0 ; (sprintf.l15 + 0)
--------------------------------------------------------------------
4e41 : __ __ __ BYT 76 64 63 20 4d 45 4d 4f 52 59 20 44 45 54 45 43 : vdc MEMORY DETEC
4e51 : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 2c 20 45 58 54 45 : TED: %U kb, EXTE
4e61 : __ __ __ BYT 4e 44 45 44 20 4d 45 4d 4f 52 59 20 25 53 41 42 : NDED MEMORY %SAB
4e71 : __ __ __ BYT 4c 45 44 2e 00                                  : LED..
--------------------------------------------------------------------
4e76 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 3a 00 : lOADING ASSETS:.
--------------------------------------------------------------------
4e86 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 20 31 3a 20 6c 4f 56 45 : - SCREEN 1: lOVE
4e96 : __ __ __ BYT 20 49 53 20 41 20 64 52 55 47 00                :  IS A dRUG.
--------------------------------------------------------------------
4ea1 : __ __ __ BYT 53 43 52 45 45 4e 31 00                         : SCREEN1.
--------------------------------------------------------------------
4ea9 : __ __ __ BYT 6c 4f 41 44 20 45 52 52 4f 52 2e 00             : lOAD ERROR..
--------------------------------------------------------------------
4eb5 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 20 32 3a 20 6c 4f 47 4f : - SCREEN 2: lOGO
4ec5 : __ __ __ BYT 20 54 45 53 54 20 53 43 52 45 45 4e 00          :  TEST SCREEN.
--------------------------------------------------------------------
4ed2 : __ __ __ BYT 53 43 52 45 45 4e 32 00                         : SCREEN2.
--------------------------------------------------------------------
4eda : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 44 45 4d 4f : oSCAR64 vdc DEMO
4eea : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4eeb : __ __ __ BYT 6f 4e 20 00                                     : oN .
--------------------------------------------------------------------
4eef : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
4ef3 : ad fd 58 LDA $58fd ; (vdc_state + 7)
4ef6 : 85 10 __ STA P3 
4ef8 : 4c 30 50 JMP $5030 ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
__multab6L:
4efb : __ __ __ BYT 00 06 0c 12 18                                  : .....
--------------------------------------------------------------------
4f00 : __ __ __ BYT 76 64 63 20 6d 45 4d 4f 52 59 20 64 45 54 45 43 : vdc mEMORY dETEC
4f10 : __ __ __ BYT 54 45 44 3a 20 25 44 20 6b 62 2c 20 53 43 52 45 : TED: %D kb, SCRE
4f20 : __ __ __ BYT 45 4e 20 53 49 5a 45 3a 20 25 44 58 25 44 2c 20 : EN SIZE: %DX%D, 
4f30 : __ __ __ BYT 45 58 54 2e 4d 45 4d 3a 20 25 53 00             : EXT.MEM: %S.
--------------------------------------------------------------------
4f3c : __ __ __ BYT 6d 4f 56 45 20 42 59 20 77 2c 61 2c 73 2c 64 20 : mOVE BY w,a,s,d 
4f4c : __ __ __ BYT 4f 52 20 43 55 52 53 4f 52 20 4b 45 59 53 2e 20 : OR CURSOR KEYS. 
4f5c : __ __ __ BYT 65 73 63 20 4f 52 20 73 74 6f 70 20 54 4f 20 45 : esc OR stop TO E
4f6c : __ __ __ BYT 58 49 54 2e 00                                  : XIT..
--------------------------------------------------------------------
4f71 : __ __ __ BYT 70 45 54 53 43 49 49 20 41 52 54 20 43 52 45 44 : pETSCII ART CRED
4f81 : __ __ __ BYT 49 54 3a 20 27 6c 4f 56 45 20 49 53 20 54 48 45 : IT: 'lOVE IS THE
4f91 : __ __ __ BYT 20 44 52 55 47 27 20 61 54 4c 41 4e 54 49 53 2c :  DRUG' aTLANTIS,
4fa1 : __ __ __ BYT 20 32 30 32 33 2c 20 61 52 54 20 42 59 20 6c 4f :  2023, aRT BY lO
4fb1 : __ __ __ BYT 42 4f 2e 00                                     : BO..
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
4fb5 : a9 b5 __ LDA #$b5
4fb7 : 85 0d __ STA P0 
4fb9 : a9 be __ LDA #$be
4fbb : 85 0e __ STA P1 
4fbd : ad 36 bf LDA $bf36 ; (viewport + 11)
4fc0 : 85 0f __ STA P2 
4fc2 : ad 37 bf LDA $bf37 ; (viewport + 12)
4fc5 : 85 10 __ STA P3 
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
4fc7 : a9 00 __ LDA #$00
4fc9 : a0 04 __ LDY #$04
4fcb : 91 0d __ STA (P0),y ; (win + 0)
4fcd : c8 __ __ INY
4fce : 91 0d __ STA (P0),y ; (win + 0)
4fd0 : a5 0f __ LDA P2 ; (sx + 0)
4fd2 : a0 00 __ LDY #$00
4fd4 : 91 0d __ STA (P0),y ; (win + 0)
4fd6 : a5 10 __ LDA P3 ; (sy + 0)
4fd8 : c8 __ __ INY
4fd9 : 91 0d __ STA (P0),y ; (win + 0)
4fdb : a5 11 __ LDA P4 ; (wx + 0)
4fdd : c8 __ __ INY
4fde : 91 0d __ STA (P0),y ; (win + 0)
4fe0 : a5 12 __ LDA P5 ; (wy + 0)
4fe2 : c8 __ __ INY
4fe3 : 91 0d __ STA (P0),y ; (win + 0)
4fe5 : 06 10 __ ASL P3 ; (sy + 0)
4fe7 : a6 10 __ LDX P3 ; (sy + 0)
4fe9 : bd 0f 59 LDA $590f,x ; (multab + 0)
4fec : 18 __ __ CLC
4fed : 65 0f __ ADC P2 ; (sx + 0)
4fef : 85 1b __ STA ACCU + 0 
4ff1 : bd 10 59 LDA $5910,x ; (multab + 1)
4ff4 : 69 00 __ ADC #$00
4ff6 : a8 __ __ TAY
4ff7 : ad fe 58 LDA $58fe ; (vdc_state + 8)
4ffa : 18 __ __ CLC
4ffb : 65 1b __ ADC ACCU + 0 
4ffd : 85 1b __ STA ACCU + 0 
4fff : 98 __ __ TYA
5000 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
5003 : a0 07 __ LDY #$07
5005 : 91 0d __ STA (P0),y ; (win + 0)
5007 : a5 1b __ LDA ACCU + 0 
5009 : 88 __ __ DEY
500a : 91 0d __ STA (P0),y ; (win + 0)
500c : bd 0f 59 LDA $590f,x ; (multab + 0)
500f : 18 __ __ CLC
5010 : 65 0f __ ADC P2 ; (sx + 0)
5012 : 85 1b __ STA ACCU + 0 
5014 : bd 10 59 LDA $5910,x ; (multab + 1)
5017 : 69 00 __ ADC #$00
5019 : aa __ __ TAX
501a : ad 00 59 LDA $5900 ; (vdc_state + 10)
501d : 18 __ __ CLC
501e : 65 1b __ ADC ACCU + 0 
5020 : 85 1b __ STA ACCU + 0 
5022 : 8a __ __ TXA
5023 : 6d 01 59 ADC $5901 ; (vdc_state + 11)
5026 : a0 09 __ LDY #$09
5028 : 91 0d __ STA (P0),y ; (win + 0)
502a : a5 1b __ LDA ACCU + 0 
502c : 88 __ __ DEY
502d : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
502f : 60 __ __ RTS
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
5030 : a5 0e __ LDA P1 ; (y + 0)
5032 : 0a __ __ ASL
5033 : aa __ __ TAX
5034 : a9 12 __ LDA #$12
5036 : 8d 00 d6 STA $d600 
5039 : 18 __ __ CLC
503a : a5 0d __ LDA P0 ; (x + 0)
503c : 7d 0f 59 ADC $590f,x ; (multab + 0)
503f : 85 1b __ STA ACCU + 0 
5041 : a9 00 __ LDA #$00
5043 : 7d 10 59 ADC $5910,x ; (multab + 1)
5046 : 85 1c __ STA ACCU + 1 
5048 : 18 __ __ CLC
5049 : a5 1b __ LDA ACCU + 0 
504b : 6d fe 58 ADC $58fe ; (vdc_state + 8)
504e : aa __ __ TAX
504f : a5 1c __ LDA ACCU + 1 
5051 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l167:
5054 : 2c 00 d6 BIT $d600 
5057 : 10 fb __ BPL $5054 ; (vdc_printc.l167 + 0)
.s9:
5059 : 8d 01 d6 STA $d601 
505c : a9 13 __ LDA #$13
505e : 8d 00 d6 STA $d600 
.l169:
5061 : 2c 00 d6 BIT $d600 
5064 : 10 fb __ BPL $5061 ; (vdc_printc.l169 + 0)
.s14:
5066 : 8e 01 d6 STX $d601 
5069 : a9 1f __ LDA #$1f
506b : 8d 00 d6 STA $d600 
.l171:
506e : 2c 00 d6 BIT $d600 
5071 : 10 fb __ BPL $506e ; (vdc_printc.l171 + 0)
.s18:
5073 : a5 0f __ LDA P2 ; (val + 0)
5075 : 8d 01 d6 STA $d601 
5078 : ad 00 59 LDA $5900 ; (vdc_state + 10)
507b : 18 __ __ CLC
507c : 65 1b __ ADC ACCU + 0 
507e : a8 __ __ TAY
507f : a9 12 __ LDA #$12
5081 : 8d 00 d6 STA $d600 
5084 : ad 01 59 LDA $5901 ; (vdc_state + 11)
5087 : 65 1c __ ADC ACCU + 1 
.l173:
5089 : 2c 00 d6 BIT $d600 
508c : 10 fb __ BPL $5089 ; (vdc_printc.l173 + 0)
.s25:
508e : 8d 01 d6 STA $d601 
5091 : a9 13 __ LDA #$13
5093 : 8d 00 d6 STA $d600 
.l175:
5096 : 2c 00 d6 BIT $d600 
5099 : 10 fb __ BPL $5096 ; (vdc_printc.l175 + 0)
.s30:
509b : 8c 01 d6 STY $d601 
509e : a9 1f __ LDA #$1f
50a0 : 8d 00 d6 STA $d600 
.l177:
50a3 : 2c 00 d6 BIT $d600 
50a6 : 10 fb __ BPL $50a3 ; (vdc_printc.l177 + 0)
.s34:
50a8 : a5 10 __ LDA P3 ; (attr + 0)
50aa : 8d 01 d6 STA $d601 
.s1001:
50ad : 60 __ __ RTS
--------------------------------------------------------------------
generateSentence: ; generateSentence(u8*)->void
.s1000:
50ae : 38 __ __ SEC
50af : a5 23 __ LDA SP + 0 
50b1 : e9 0e __ SBC #$0e
50b3 : 85 23 __ STA SP + 0 
50b5 : b0 02 __ BCS $50b9 ; (generateSentence.s0 + 0)
50b7 : c6 24 __ DEC SP + 1 
.s0:
50b9 : a9 74 __ LDA #$74
50bb : 8d dc bf STA $bfdc ; (buff + 30)
50be : a9 48 __ LDA #$48
50c0 : 8d dd bf STA $bfdd ; (buff + 31)
50c3 : a9 45 __ LDA #$45
50c5 : 8d de bf STA $bfde ; (buff + 32)
50c8 : a9 00 __ LDA #$00
50ca : 8d df bf STA $bfdf ; (buff + 33)
50cd : 8d e1 bf STA $bfe1 ; (buff + 35)
50d0 : 8d e2 bf STA $bfe2 ; (buff + 36)
50d3 : 8d e3 bf STA $bfe3 ; (buff + 37)
50d6 : a9 61 __ LDA #$61
50d8 : 8d e0 bf STA $bfe0 ; (buff + 34)
50db : a2 4b __ LDX #$4b
.l1002:
50dd : bd 7d 57 LDA $577d,x ; (seed + 1)
50e0 : 9d 90 bf STA $bf90,x ; (verbs + 29)
50e3 : ca __ __ DEX
50e4 : d0 f7 __ BNE $50dd ; (generateSentence.l1002 + 0)
.s1003:
50e6 : a2 1e __ LDX #$1e
.l1004:
50e8 : bd c8 57 LDA $57c8,x 
50eb : 9d 72 bf STA $bf72,x ; (adjectives + 29)
50ee : ca __ __ DEX
50ef : d0 f7 __ BNE $50e8 ; (generateSentence.l1004 + 0)
.s1005:
50f1 : a0 1e __ LDY #$1e
.l1006:
50f3 : b9 d7 58 LDA $58d7,y ; (vdc_modes + 215)
50f6 : 99 54 bf STA $bf54,y ; (window + 9)
50f9 : 88 __ __ DEY
50fa : d0 f7 __ BNE $50f3 ; (generateSentence.l1006 + 0)
.s1007:
50fc : 84 04 __ STY WORK + 1 
50fe : ad 7d 57 LDA $577d ; (seed + 1)
5101 : 4a __ __ LSR
5102 : ad 7c 57 LDA $577c ; (seed + 0)
5105 : 6a __ __ ROR
5106 : aa __ __ TAX
5107 : 98 __ __ TYA
5108 : 6a __ __ ROR
5109 : 4d 7c 57 EOR $577c ; (seed + 0)
510c : 85 43 __ STA T0 + 0 
510e : 8a __ __ TXA
510f : 4d 7d 57 EOR $577d ; (seed + 1)
5112 : 85 44 __ STA T0 + 1 
5114 : 4a __ __ LSR
5115 : 45 43 __ EOR T0 + 0 
5117 : 85 43 __ STA T0 + 0 
5119 : 45 44 __ EOR T0 + 1 
511b : 85 44 __ STA T0 + 1 
511d : 4a __ __ LSR
511e : a5 43 __ LDA T0 + 0 
5120 : 6a __ __ ROR
5121 : aa __ __ TAX
5122 : 98 __ __ TYA
5123 : 6a __ __ ROR
5124 : 45 43 __ EOR T0 + 0 
5126 : 85 45 __ STA T1 + 0 
5128 : 8a __ __ TXA
5129 : 45 44 __ EOR T0 + 1 
512b : 85 46 __ STA T1 + 1 
512d : 4a __ __ LSR
512e : 45 45 __ EOR T1 + 0 
5130 : 85 45 __ STA T1 + 0 
5132 : 45 46 __ EOR T1 + 1 
5134 : 85 46 __ STA T1 + 1 
5136 : 4a __ __ LSR
5137 : a5 45 __ LDA T1 + 0 
5139 : 6a __ __ ROR
513a : aa __ __ TAX
513b : 98 __ __ TYA
513c : 6a __ __ ROR
513d : 45 45 __ EOR T1 + 0 
513f : 85 47 __ STA T2 + 0 
5141 : 8a __ __ TXA
5142 : 45 46 __ EOR T1 + 1 
5144 : 85 48 __ STA T2 + 1 
5146 : 4a __ __ LSR
5147 : 45 47 __ EOR T2 + 0 
5149 : 85 47 __ STA T2 + 0 
514b : 45 48 __ EOR T2 + 1 
514d : 85 48 __ STA T2 + 1 
514f : 4a __ __ LSR
5150 : a5 47 __ LDA T2 + 0 
5152 : 6a __ __ ROR
5153 : aa __ __ TAX
5154 : 98 __ __ TYA
5155 : 6a __ __ ROR
5156 : 45 47 __ EOR T2 + 0 
5158 : 85 49 __ STA T3 + 0 
515a : 8a __ __ TXA
515b : 45 48 __ EOR T2 + 1 
515d : 85 4a __ STA T3 + 1 
515f : 4a __ __ LSR
5160 : 45 49 __ EOR T3 + 0 
5162 : 8d 7c 57 STA $577c ; (seed + 0)
5165 : 85 1b __ STA ACCU + 0 
5167 : 45 4a __ EOR T3 + 1 
5169 : 8d 7d 57 STA $577d ; (seed + 1)
516c : 85 1c __ STA ACCU + 1 
516e : 98 __ __ TYA
516f : 91 16 __ STA (P9),y ; (sentence + 0)
5171 : a5 16 __ LDA P9 ; (sentence + 0)
5173 : a0 02 __ LDY #$02
5175 : 91 23 __ STA (SP + 0),y 
5177 : a5 17 __ LDA P10 ; (sentence + 1)
5179 : c8 __ __ INY
517a : 91 23 __ STA (SP + 0),y 
517c : a9 0b __ LDA #$0b
517e : c8 __ __ INY
517f : 91 23 __ STA (SP + 0),y 
5181 : a9 52 __ LDA #$52
5183 : c8 __ __ INY
5184 : 84 03 __ STY WORK + 0 
5186 : 91 23 __ STA (SP + 0),y 
5188 : a5 43 __ LDA T0 + 0 
518a : 29 01 __ AND #$01
518c : 0a __ __ ASL
518d : 0a __ __ ASL
518e : 69 dc __ ADC #$dc
5190 : c8 __ __ INY
5191 : 91 23 __ STA (SP + 0),y 
5193 : a9 bf __ LDA #$bf
5195 : 69 00 __ ADC #$00
5197 : c8 __ __ INY
5198 : 91 23 __ STA (SP + 0),y 
519a : 20 19 56 JSR $5619 ; (divmod + 0)
519d : a6 05 __ LDX WORK + 2 
519f : bd fb 4e LDA $4efb,x ; (__multab6L + 0)
51a2 : 18 __ __ CLC
51a3 : 69 55 __ ADC #$55
51a5 : a0 08 __ LDY #$08
51a7 : 91 23 __ STA (SP + 0),y 
51a9 : a9 bf __ LDA #$bf
51ab : 69 00 __ ADC #$00
51ad : c8 __ __ INY
51ae : 91 23 __ STA (SP + 0),y 
51b0 : a5 45 __ LDA T1 + 0 
51b2 : 85 1b __ STA ACCU + 0 
51b4 : a5 46 __ LDA T1 + 1 
51b6 : 85 1c __ STA ACCU + 1 
51b8 : a9 05 __ LDA #$05
51ba : 85 03 __ STA WORK + 0 
51bc : a9 00 __ LDA #$00
51be : 85 04 __ STA WORK + 1 
51c0 : 20 19 56 JSR $5619 ; (divmod + 0)
51c3 : a6 05 __ LDX WORK + 2 
51c5 : bd 3a 57 LDA $573a,x ; (__multab15L + 0)
51c8 : 18 __ __ CLC
51c9 : 69 91 __ ADC #$91
51cb : a0 0a __ LDY #$0a
51cd : 91 23 __ STA (SP + 0),y 
51cf : a9 bf __ LDA #$bf
51d1 : 69 00 __ ADC #$00
51d3 : c8 __ __ INY
51d4 : 91 23 __ STA (SP + 0),y 
51d6 : a5 47 __ LDA T2 + 0 
51d8 : 85 1b __ STA ACCU + 0 
51da : a5 48 __ LDA T2 + 1 
51dc : 85 1c __ STA ACCU + 1 
51de : a9 05 __ LDA #$05
51e0 : 85 03 __ STA WORK + 0 
51e2 : a9 00 __ LDA #$00
51e4 : 85 04 __ STA WORK + 1 
51e6 : 20 19 56 JSR $5619 ; (divmod + 0)
51e9 : a6 05 __ LDX WORK + 2 
51eb : bd fb 4e LDA $4efb,x ; (__multab6L + 0)
51ee : 18 __ __ CLC
51ef : 69 73 __ ADC #$73
51f1 : a0 0c __ LDY #$0c
51f3 : 91 23 __ STA (SP + 0),y 
51f5 : a9 bf __ LDA #$bf
51f7 : 69 00 __ ADC #$00
51f9 : c8 __ __ INY
51fa : 91 23 __ STA (SP + 0),y 
51fc : 20 1b 4b JSR $4b1b ; (sprintf.s1000 + 0)
.s1001:
51ff : 18 __ __ CLC
5200 : a5 23 __ LDA SP + 0 
5202 : 69 0e __ ADC #$0e
5204 : 85 23 __ STA SP + 0 
5206 : 90 02 __ BCC $520a ; (generateSentence.s1001 + 11)
5208 : e6 24 __ INC SP + 1 
520a : 60 __ __ RTS
--------------------------------------------------------------------
520b : __ __ __ BYT 25 53 20 25 53 20 25 53 20 25 53 2e 00          : %S %S %S %S..
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
5218 : a5 53 __ LDA T0 + 0 
521a : 8d fb bf STA $bffb ; (buffer + 11)
521d : a5 54 __ LDA T0 + 1 
521f : 8d fc bf STA $bffc ; (buffer + 12)
5222 : 38 __ __ SEC
5223 : a5 23 __ LDA SP + 0 
5225 : e9 06 __ SBC #$06
5227 : 85 23 __ STA SP + 0 
5229 : b0 02 __ BCS $522d ; (vdcwin_printline.s0 + 0)
522b : c6 24 __ DEC SP + 1 
.s0:
522d : a0 08 __ LDY #$08
522f : b1 23 __ LDA (SP + 0),y 
5231 : 85 53 __ STA T0 + 0 
5233 : a0 02 __ LDY #$02
5235 : 91 23 __ STA (SP + 0),y 
5237 : a0 09 __ LDY #$09
5239 : b1 23 __ LDA (SP + 0),y 
523b : 85 54 __ STA T0 + 1 
523d : a0 03 __ LDY #$03
523f : 91 23 __ STA (SP + 0),y 
5241 : a0 0a __ LDY #$0a
5243 : b1 23 __ LDA (SP + 0),y 
5245 : a0 04 __ LDY #$04
5247 : 91 23 __ STA (SP + 0),y 
5249 : a0 0b __ LDY #$0b
524b : b1 23 __ LDA (SP + 0),y 
524d : a0 05 __ LDY #$05
524f : 91 23 __ STA (SP + 0),y 
5251 : 20 f1 54 JSR $54f1 ; (vdcwin_put_string.s1000 + 0)
5254 : a9 00 __ LDA #$00
5256 : a0 04 __ LDY #$04
5258 : 91 53 __ STA (T0 + 0),y 
525a : 88 __ __ DEY
525b : b1 53 __ LDA (T0 + 0),y 
525d : 38 __ __ SEC
525e : e9 01 __ SBC #$01
5260 : 85 43 __ STA T1 + 0 
5262 : a0 05 __ LDY #$05
5264 : b1 53 __ LDA (T0 + 0),y 
5266 : 90 0b __ BCC $5273 ; (vdcwin_printline.s2 + 0)
.s1058:
5268 : aa __ __ TAX
5269 : e4 43 __ CPX T1 + 0 
526b : b0 06 __ BCS $5273 ; (vdcwin_printline.s2 + 0)
.s1:
526d : e8 __ __ INX
526e : 8a __ __ TXA
526f : 91 53 __ STA (T0 + 0),y 
5271 : 90 62 __ BCC $52d5 ; (vdcwin_printline.s1001 + 0)
.s2:
5273 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
5276 : 85 43 __ STA T1 + 0 
5278 : ad fa 58 LDA $58fa ; (vdc_state + 4)
527b : 85 44 __ STA T1 + 1 
527d : a0 02 __ LDY #$02
527f : b1 53 __ LDA (T0 + 0),y 
5281 : 85 48 __ STA T4 + 0 
5283 : a0 06 __ LDY #$06
5285 : b1 53 __ LDA (T0 + 0),y 
5287 : 85 46 __ STA T3 + 0 
5289 : c8 __ __ INY
528a : b1 53 __ LDA (T0 + 0),y 
528c : 85 47 __ STA T3 + 1 
528e : c8 __ __ INY
528f : b1 53 __ LDA (T0 + 0),y 
5291 : 85 49 __ STA T5 + 0 
5293 : c8 __ __ INY
5294 : b1 53 __ LDA (T0 + 0),y 
5296 : a2 00 __ LDX #$00
.l5:
5298 : 85 4a __ STA T5 + 1 
529a : a0 03 __ LDY #$03
529c : b1 53 __ LDA (T0 + 0),y 
529e : 85 4c __ STA T7 + 0 
52a0 : 38 __ __ SEC
52a1 : e9 01 __ SBC #$01
52a3 : b0 03 __ BCS $52a8 ; (vdcwin_printline.s1056 + 0)
52a5 : 4c d1 53 JMP $53d1 ; (vdcwin_printline.s6 + 0)
.s1056:
52a8 : 85 4e __ STA T8 + 0 
52aa : e4 4e __ CPX T8 + 0 
52ac : b0 03 __ BCS $52b1 ; (vdcwin_printline.s4 + 0)
52ae : 4c d1 53 JMP $53d1 ; (vdcwin_printline.s6 + 0)
.s4:
52b1 : a0 01 __ LDY #$01
52b3 : b1 53 __ LDA (T0 + 0),y 
52b5 : 18 __ __ CLC
52b6 : 65 4c __ ADC T7 + 0 
52b8 : 38 __ __ SEC
52b9 : e9 01 __ SBC #$01
52bb : 85 45 __ STA T2 + 0 
52bd : aa __ __ TAX
52be : 88 __ __ DEY
52bf : b1 53 __ LDA (T0 + 0),y 
52c1 : 85 48 __ STA T4 + 0 
52c3 : a0 02 __ LDY #$02
52c5 : b1 53 __ LDA (T0 + 0),y 
52c7 : 85 4b __ STA T6 + 0 
.l185:
52c9 : 8a __ __ TXA
52ca : 18 __ __ CLC
52cb : 69 01 __ ADC #$01
52cd : b0 1c __ BCS $52eb ; (vdcwin_printline.s186 + 0)
.s1026:
52cf : c5 45 __ CMP T2 + 0 
52d1 : 90 02 __ BCC $52d5 ; (vdcwin_printline.s1001 + 0)
.s1063:
52d3 : d0 16 __ BNE $52eb ; (vdcwin_printline.s186 + 0)
.s1001:
52d5 : 18 __ __ CLC
52d6 : a5 23 __ LDA SP + 0 
52d8 : 69 06 __ ADC #$06
52da : 85 23 __ STA SP + 0 
52dc : 90 02 __ BCC $52e0 ; (vdcwin_printline.s1001 + 11)
52de : e6 24 __ INC SP + 1 
52e0 : ad fb bf LDA $bffb ; (buffer + 11)
52e3 : 85 53 __ STA T0 + 0 
52e5 : ad fc bf LDA $bffc ; (buffer + 12)
52e8 : 85 54 __ STA T0 + 1 
52ea : 60 __ __ RTS
.s186:
52eb : ad fd 58 LDA $58fd ; (vdc_state + 7)
52ee : 85 52 __ STA T11 + 0 
52f0 : a5 45 __ LDA T2 + 0 
52f2 : 0a __ __ ASL
52f3 : a8 __ __ TAY
52f4 : a9 12 __ LDA #$12
52f6 : 8d 00 d6 STA $d600 
52f9 : a5 4b __ LDA T6 + 0 
52fb : 38 __ __ SEC
52fc : e9 01 __ SBC #$01
52fe : 85 49 __ STA T5 + 0 
5300 : 18 __ __ CLC
5301 : a5 48 __ LDA T4 + 0 
5303 : 79 0f 59 ADC $590f,y ; (multab + 0)
5306 : 85 53 __ STA T0 + 0 
5308 : a9 00 __ LDA #$00
530a : 79 10 59 ADC $5910,y ; (multab + 1)
530d : 85 54 __ STA T0 + 1 
530f : 18 __ __ CLC
5310 : a5 53 __ LDA T0 + 0 
5312 : 6d fe 58 ADC $58fe ; (vdc_state + 8)
5315 : a8 __ __ TAY
5316 : a5 54 __ LDA T0 + 1 
5318 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l917:
531b : 2c 00 d6 BIT $d600 
531e : 10 fb __ BPL $531b ; (vdcwin_printline.l917 + 0)
.s198:
5320 : 8d 01 d6 STA $d601 
5323 : a9 13 __ LDA #$13
5325 : 8d 00 d6 STA $d600 
.l919:
5328 : 2c 00 d6 BIT $d600 
532b : 10 fb __ BPL $5328 ; (vdcwin_printline.l919 + 0)
.s203:
532d : 8c 01 d6 STY $d601 
5330 : a9 1f __ LDA #$1f
5332 : 8d 00 d6 STA $d600 
.l921:
5335 : 2c 00 d6 BIT $d600 
5338 : 10 fb __ BPL $5335 ; (vdcwin_printline.l921 + 0)
.s207:
533a : a9 20 __ LDA #$20
533c : 8d 01 d6 STA $d601 
533f : a9 18 __ LDA #$18
5341 : 8d 00 d6 STA $d600 
.l923:
5344 : 2c 00 d6 BIT $d600 
5347 : 10 fb __ BPL $5344 ; (vdcwin_printline.l923 + 0)
.s213:
5349 : ad 01 d6 LDA $d601 
534c : 29 7f __ AND #$7f
534e : a8 __ __ TAY
534f : a9 18 __ LDA #$18
5351 : 8d 00 d6 STA $d600 
.l925:
5354 : 2c 00 d6 BIT $d600 
5357 : 10 fb __ BPL $5354 ; (vdcwin_printline.l925 + 0)
.s219:
5359 : 8c 01 d6 STY $d601 
535c : a9 1e __ LDA #$1e
535e : 8d 00 d6 STA $d600 
.l927:
5361 : 2c 00 d6 BIT $d600 
5364 : 10 fb __ BPL $5361 ; (vdcwin_printline.l927 + 0)
.s224:
5366 : a5 49 __ LDA T5 + 0 
5368 : 8d 01 d6 STA $d601 
536b : ad 00 59 LDA $5900 ; (vdc_state + 10)
536e : 18 __ __ CLC
536f : 65 53 __ ADC T0 + 0 
5371 : a8 __ __ TAY
5372 : a9 12 __ LDA #$12
5374 : 8d 00 d6 STA $d600 
5377 : ad 01 59 LDA $5901 ; (vdc_state + 11)
537a : 65 54 __ ADC T0 + 1 
.l929:
537c : 2c 00 d6 BIT $d600 
537f : 10 fb __ BPL $537c ; (vdcwin_printline.l929 + 0)
.s231:
5381 : 8d 01 d6 STA $d601 
5384 : a9 13 __ LDA #$13
5386 : 8d 00 d6 STA $d600 
.l931:
5389 : 2c 00 d6 BIT $d600 
538c : 10 fb __ BPL $5389 ; (vdcwin_printline.l931 + 0)
.s236:
538e : 8c 01 d6 STY $d601 
5391 : a9 1f __ LDA #$1f
5393 : 8d 00 d6 STA $d600 
.l933:
5396 : 2c 00 d6 BIT $d600 
5399 : 10 fb __ BPL $5396 ; (vdcwin_printline.l933 + 0)
.s240:
539b : a5 52 __ LDA T11 + 0 
539d : 8d 01 d6 STA $d601 
53a0 : a9 18 __ LDA #$18
53a2 : 8d 00 d6 STA $d600 
.l935:
53a5 : 2c 00 d6 BIT $d600 
53a8 : 10 fb __ BPL $53a5 ; (vdcwin_printline.l935 + 0)
.s246:
53aa : ad 01 d6 LDA $d601 
53ad : 29 7f __ AND #$7f
53af : a8 __ __ TAY
53b0 : a9 18 __ LDA #$18
53b2 : 8d 00 d6 STA $d600 
.l937:
53b5 : 2c 00 d6 BIT $d600 
53b8 : 10 fb __ BPL $53b5 ; (vdcwin_printline.l937 + 0)
.s252:
53ba : 8c 01 d6 STY $d601 
53bd : a9 1e __ LDA #$1e
53bf : 8d 00 d6 STA $d600 
.l939:
53c2 : 2c 00 d6 BIT $d600 
53c5 : 10 fb __ BPL $53c2 ; (vdcwin_printline.l939 + 0)
.s257:
53c7 : a5 49 __ LDA T5 + 0 
53c9 : 8d 01 d6 STA $d601 
53cc : e6 45 __ INC T2 + 0 
53ce : 4c c9 52 JMP $52c9 ; (vdcwin_printline.l185 + 0)
.s6:
53d1 : a9 12 __ LDA #$12
53d3 : 8d 00 d6 STA $d600 
53d6 : a5 49 __ LDA T5 + 0 
53d8 : 65 43 __ ADC T1 + 0 
53da : a8 __ __ TAY
53db : a5 4a __ LDA T5 + 1 
53dd : 65 44 __ ADC T1 + 1 
53df : 85 4d __ STA T7 + 1 
53e1 : 18 __ __ CLC
53e2 : a5 46 __ LDA T3 + 0 
53e4 : 65 43 __ ADC T1 + 0 
53e6 : 85 50 __ STA T9 + 0 
53e8 : a5 47 __ LDA T3 + 1 
53ea : 65 44 __ ADC T1 + 1 
53ec : 85 51 __ STA T9 + 1 
.l888:
53ee : 2c 00 d6 BIT $d600 
53f1 : 10 fb __ BPL $53ee ; (vdcwin_printline.l888 + 0)
.s62:
53f3 : a5 47 __ LDA T3 + 1 
53f5 : 8d 01 d6 STA $d601 
53f8 : a9 13 __ LDA #$13
53fa : 8d 00 d6 STA $d600 
.l890:
53fd : 2c 00 d6 BIT $d600 
5400 : 10 fb __ BPL $53fd ; (vdcwin_printline.l890 + 0)
.s67:
5402 : a5 46 __ LDA T3 + 0 
5404 : 8d 01 d6 STA $d601 
5407 : a9 1f __ LDA #$1f
5409 : 8d 00 d6 STA $d600 
540c : a9 18 __ LDA #$18
540e : 8d 00 d6 STA $d600 
.l892:
5411 : 2c 00 d6 BIT $d600 
5414 : 10 fb __ BPL $5411 ; (vdcwin_printline.l892 + 0)
.s74:
5416 : ad 01 d6 LDA $d601 
5419 : 09 80 __ ORA #$80
541b : 85 1b __ STA ACCU + 0 
541d : a9 18 __ LDA #$18
541f : 8d 00 d6 STA $d600 
.l894:
5422 : 2c 00 d6 BIT $d600 
5425 : 10 fb __ BPL $5422 ; (vdcwin_printline.l894 + 0)
.s80:
5427 : a5 1b __ LDA ACCU + 0 
5429 : 8d 01 d6 STA $d601 
542c : a9 20 __ LDA #$20
542e : 8d 00 d6 STA $d600 
.l896:
5431 : 2c 00 d6 BIT $d600 
5434 : 10 fb __ BPL $5431 ; (vdcwin_printline.l896 + 0)
.s85:
5436 : a5 51 __ LDA T9 + 1 
5438 : 8d 01 d6 STA $d601 
543b : a9 21 __ LDA #$21
543d : 8d 00 d6 STA $d600 
.l898:
5440 : 2c 00 d6 BIT $d600 
5443 : 10 fb __ BPL $5440 ; (vdcwin_printline.l898 + 0)
.s90:
5445 : a5 50 __ LDA T9 + 0 
5447 : 8d 01 d6 STA $d601 
544a : a9 1f __ LDA #$1f
544c : 8d 00 d6 STA $d600 
544f : a9 1e __ LDA #$1e
5451 : 8d 00 d6 STA $d600 
.l900:
5454 : 2c 00 d6 BIT $d600 
5457 : 10 fb __ BPL $5454 ; (vdcwin_printline.l900 + 0)
.s96:
5459 : a5 48 __ LDA T4 + 0 
545b : 8d 01 d6 STA $d601 
545e : a9 12 __ LDA #$12
5460 : 8d 00 d6 STA $d600 
.l902:
5463 : 2c 00 d6 BIT $d600 
5466 : 10 fb __ BPL $5463 ; (vdcwin_printline.l902 + 0)
.s149:
5468 : a5 4a __ LDA T5 + 1 
546a : 8d 01 d6 STA $d601 
546d : a9 13 __ LDA #$13
546f : 8d 00 d6 STA $d600 
.l904:
5472 : 2c 00 d6 BIT $d600 
5475 : 10 fb __ BPL $5472 ; (vdcwin_printline.l904 + 0)
.s154:
5477 : a5 49 __ LDA T5 + 0 
5479 : 8d 01 d6 STA $d601 
547c : a9 1f __ LDA #$1f
547e : 8d 00 d6 STA $d600 
5481 : a9 18 __ LDA #$18
5483 : 8d 00 d6 STA $d600 
.l906:
5486 : 2c 00 d6 BIT $d600 
5489 : 10 fb __ BPL $5486 ; (vdcwin_printline.l906 + 0)
.s161:
548b : ad 01 d6 LDA $d601 
548e : 09 80 __ ORA #$80
5490 : 85 50 __ STA T9 + 0 
5492 : a9 18 __ LDA #$18
5494 : 8d 00 d6 STA $d600 
.l908:
5497 : 2c 00 d6 BIT $d600 
549a : 10 fb __ BPL $5497 ; (vdcwin_printline.l908 + 0)
.s167:
549c : a5 50 __ LDA T9 + 0 
549e : 8d 01 d6 STA $d601 
54a1 : a9 20 __ LDA #$20
54a3 : 8d 00 d6 STA $d600 
.l910:
54a6 : 2c 00 d6 BIT $d600 
54a9 : 10 fb __ BPL $54a6 ; (vdcwin_printline.l910 + 0)
.s172:
54ab : a5 4d __ LDA T7 + 1 
54ad : 8d 01 d6 STA $d601 
54b0 : a9 21 __ LDA #$21
54b2 : 8d 00 d6 STA $d600 
.l912:
54b5 : 2c 00 d6 BIT $d600 
54b8 : 10 fb __ BPL $54b5 ; (vdcwin_printline.l912 + 0)
.s177:
54ba : 8c 01 d6 STY $d601 
54bd : a9 1f __ LDA #$1f
54bf : 8d 00 d6 STA $d600 
54c2 : a9 1e __ LDA #$1e
54c4 : 8d 00 d6 STA $d600 
.l914:
54c7 : 2c 00 d6 BIT $d600 
54ca : 10 fb __ BPL $54c7 ; (vdcwin_printline.l914 + 0)
.s183:
54cc : a5 48 __ LDA T4 + 0 
54ce : 8d 01 d6 STA $d601 
54d1 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
54d4 : 18 __ __ CLC
54d5 : 65 46 __ ADC T3 + 0 
54d7 : 85 46 __ STA T3 + 0 
54d9 : ad fa 58 LDA $58fa ; (vdc_state + 4)
54dc : 65 47 __ ADC T3 + 1 
54de : 85 47 __ STA T3 + 1 
54e0 : 18 __ __ CLC
54e1 : a5 49 __ LDA T5 + 0 
54e3 : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
54e6 : 85 49 __ STA T5 + 0 
54e8 : a5 4a __ LDA T5 + 1 
54ea : 6d fa 58 ADC $58fa ; (vdc_state + 4)
54ed : e8 __ __ INX
54ee : 4c 98 52 JMP $5298 ; (vdcwin_printline.l5 + 0)
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->void
.s1000:
54f1 : 38 __ __ SEC
54f2 : a5 23 __ LDA SP + 0 
54f4 : e9 0d __ SBC #$0d
54f6 : 85 23 __ STA SP + 0 
54f8 : b0 02 __ BCS $54fc ; (vdcwin_put_string.s1000 + 11)
54fa : c6 24 __ DEC SP + 1 
54fc : a0 0c __ LDY #$0c
54fe : a2 06 __ LDX #$06
5500 : b5 53 __ LDA T0 + 0,x 
5502 : 91 23 __ STA (SP + 0),y 
5504 : 88 __ __ DEY
5505 : ca __ __ DEX
5506 : 10 f8 __ BPL $5500 ; (vdcwin_put_string.s1000 + 15)
.s0:
5508 : a9 00 __ LDA #$00
550a : 85 53 __ STA T0 + 0 
550c : a0 0f __ LDY #$0f
550e : b1 23 __ LDA (SP + 0),y 
5510 : 85 54 __ STA T1 + 0 
5512 : c8 __ __ INY
5513 : b1 23 __ LDA (SP + 0),y 
5515 : 85 55 __ STA T1 + 1 
5517 : a0 04 __ LDY #$04
5519 : b1 54 __ LDA (T1 + 0),y 
551b : 85 56 __ STA T2 + 0 
551d : c8 __ __ INY
551e : b1 54 __ LDA (T1 + 0),y 
5520 : 85 57 __ STA T3 + 0 
5522 : a0 11 __ LDY #$11
5524 : b1 23 __ LDA (SP + 0),y 
5526 : 85 58 __ STA T4 + 0 
5528 : c8 __ __ INY
5529 : b1 23 __ LDA (SP + 0),y 
552b : 85 59 __ STA T4 + 1 
552d : 4c 56 55 JMP $5556 ; (vdcwin_put_string.l2 + 0)
.s3:
5530 : 4a __ __ LSR
5531 : 4a __ __ LSR
5532 : 4a __ __ LSR
5533 : 4a __ __ LSR
5534 : 4a __ __ LSR
5535 : aa __ __ TAX
5536 : bd e7 57 LDA $57e7,x ; (p2smap + 0)
5539 : 51 58 __ EOR (T4 + 0),y 
553b : 85 0f __ STA P2 ; (str + 0)
553d : a5 56 __ LDA T2 + 0 
553f : 18 __ __ CLC
5540 : a0 00 __ LDY #$00
5542 : 71 54 __ ADC (T1 + 0),y 
5544 : 18 __ __ CLC
5545 : 65 53 __ ADC T0 + 0 
5547 : 85 0d __ STA P0 ; (win + 0)
5549 : a5 57 __ LDA T3 + 0 
554b : 18 __ __ CLC
554c : c8 __ __ INY
554d : 71 54 __ ADC (T1 + 0),y 
554f : 85 0e __ STA P1 ; (win + 1)
5551 : 20 f3 4e JSR $4ef3 ; (vdc_printc@proxy + 0)
5554 : e6 53 __ INC T0 + 0 
.l2:
5556 : a4 53 __ LDY T0 + 0 
5558 : b1 58 __ LDA (T4 + 0),y 
555a : d0 d4 __ BNE $5530 ; (vdcwin_put_string.s3 + 0)
.s4:
555c : a0 04 __ LDY #$04
555e : b1 54 __ LDA (T1 + 0),y 
5560 : 18 __ __ CLC
5561 : 65 53 __ ADC T0 + 0 
5563 : 91 54 __ STA (T1 + 0),y 
5565 : a0 02 __ LDY #$02
5567 : d1 54 __ CMP (T1 + 0),y 
5569 : 90 34 __ BCC $559f ; (vdcwin_put_string.s1001 + 0)
.s8:
556b : a9 00 __ LDA #$00
556d : a0 04 __ LDY #$04
556f : 91 54 __ STA (T1 + 0),y 
5571 : c8 __ __ INY
5572 : b1 54 __ LDA (T1 + 0),y 
5574 : 85 53 __ STA T0 + 0 
5576 : 18 __ __ CLC
5577 : 69 01 __ ADC #$01
5579 : 91 54 __ STA (T1 + 0),y 
557b : a0 03 __ LDY #$03
557d : d1 54 __ CMP (T1 + 0),y 
557f : d0 1e __ BNE $559f ; (vdcwin_put_string.s1001 + 0)
.s11:
5581 : a5 53 __ LDA T0 + 0 
5583 : a0 05 __ LDY #$05
5585 : 91 54 __ STA (T1 + 0),y 
5587 : a5 54 __ LDA T1 + 0 
5589 : a0 02 __ LDY #$02
558b : 91 23 __ STA (SP + 0),y 
558d : a5 55 __ LDA T1 + 1 
558f : c8 __ __ INY
5590 : 91 23 __ STA (SP + 0),y 
5592 : a9 fe __ LDA #$fe
5594 : c8 __ __ INY
5595 : 91 23 __ STA (SP + 0),y 
5597 : a9 4a __ LDA #$4a
5599 : c8 __ __ INY
559a : 91 23 __ STA (SP + 0),y 
559c : 20 18 52 JSR $5218 ; (vdcwin_printline.s1000 + 0)
.s1001:
559f : a0 0c __ LDY #$0c
55a1 : a2 06 __ LDX #$06
55a3 : b1 23 __ LDA (SP + 0),y 
55a5 : 95 53 __ STA T0 + 0,x 
55a7 : 88 __ __ DEY
55a8 : ca __ __ DEX
55a9 : 10 f8 __ BPL $55a3 ; (vdcwin_put_string.s1001 + 4)
55ab : 18 __ __ CLC
55ac : a5 23 __ LDA SP + 0 
55ae : 69 0d __ ADC #$0d
55b0 : 85 23 __ STA SP + 0 
55b2 : 90 02 __ BCC $55b6 ; (vdcwin_put_string.s1001 + 23)
55b4 : e6 24 __ INC SP + 1 
55b6 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
55b7 : a0 00 __ LDY #$00
55b9 : 84 06 __ STY WORK + 3 
55bb : 4a __ __ LSR
55bc : 90 0d __ BCC $55cb ; (mul16by8 + 20)
55be : aa __ __ TAX
55bf : 18 __ __ CLC
55c0 : 98 __ __ TYA
55c1 : 65 1b __ ADC ACCU + 0 
55c3 : a8 __ __ TAY
55c4 : a5 06 __ LDA WORK + 3 
55c6 : 65 1c __ ADC ACCU + 1 
55c8 : 85 06 __ STA WORK + 3 
55ca : 8a __ __ TXA
55cb : 06 1b __ ASL ACCU + 0 
55cd : 26 1c __ ROL ACCU + 1 
55cf : 4a __ __ LSR
55d0 : b0 ec __ BCS $55be ; (mul16by8 + 7)
55d2 : d0 f7 __ BNE $55cb ; (mul16by8 + 20)
55d4 : 84 05 __ STY WORK + 2 
55d6 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
55d7 : a0 00 __ LDY #$00
55d9 : 84 06 __ STY WORK + 3 
55db : a5 03 __ LDA WORK + 0 
55dd : a6 04 __ LDX WORK + 1 
55df : f0 1c __ BEQ $55fd ; (mul16 + 38)
55e1 : 38 __ __ SEC
55e2 : 6a __ __ ROR
55e3 : 90 0d __ BCC $55f2 ; (mul16 + 27)
55e5 : aa __ __ TAX
55e6 : 18 __ __ CLC
55e7 : 98 __ __ TYA
55e8 : 65 1b __ ADC ACCU + 0 
55ea : a8 __ __ TAY
55eb : a5 06 __ LDA WORK + 3 
55ed : 65 1c __ ADC ACCU + 1 
55ef : 85 06 __ STA WORK + 3 
55f1 : 8a __ __ TXA
55f2 : 06 1b __ ASL ACCU + 0 
55f4 : 26 1c __ ROL ACCU + 1 
55f6 : 4a __ __ LSR
55f7 : 90 f9 __ BCC $55f2 ; (mul16 + 27)
55f9 : d0 ea __ BNE $55e5 ; (mul16 + 14)
55fb : a5 04 __ LDA WORK + 1 
55fd : 4a __ __ LSR
55fe : 90 0d __ BCC $560d ; (mul16 + 54)
5600 : aa __ __ TAX
5601 : 18 __ __ CLC
5602 : 98 __ __ TYA
5603 : 65 1b __ ADC ACCU + 0 
5605 : a8 __ __ TAY
5606 : a5 06 __ LDA WORK + 3 
5608 : 65 1c __ ADC ACCU + 1 
560a : 85 06 __ STA WORK + 3 
560c : 8a __ __ TXA
560d : 06 1b __ ASL ACCU + 0 
560f : 26 1c __ ROL ACCU + 1 
5611 : 4a __ __ LSR
5612 : b0 ec __ BCS $5600 ; (mul16 + 41)
5614 : d0 f7 __ BNE $560d ; (mul16 + 54)
5616 : 84 05 __ STY WORK + 2 
5618 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
5619 : a5 1c __ LDA ACCU + 1 
561b : d0 31 __ BNE $564e ; (divmod + 53)
561d : a5 04 __ LDA WORK + 1 
561f : d0 1e __ BNE $563f ; (divmod + 38)
5621 : 85 06 __ STA WORK + 3 
5623 : a2 04 __ LDX #$04
5625 : 06 1b __ ASL ACCU + 0 
5627 : 2a __ __ ROL
5628 : c5 03 __ CMP WORK + 0 
562a : 90 02 __ BCC $562e ; (divmod + 21)
562c : e5 03 __ SBC WORK + 0 
562e : 26 1b __ ROL ACCU + 0 
5630 : 2a __ __ ROL
5631 : c5 03 __ CMP WORK + 0 
5633 : 90 02 __ BCC $5637 ; (divmod + 30)
5635 : e5 03 __ SBC WORK + 0 
5637 : 26 1b __ ROL ACCU + 0 
5639 : ca __ __ DEX
563a : d0 eb __ BNE $5627 ; (divmod + 14)
563c : 85 05 __ STA WORK + 2 
563e : 60 __ __ RTS
563f : a5 1b __ LDA ACCU + 0 
5641 : 85 05 __ STA WORK + 2 
5643 : a5 1c __ LDA ACCU + 1 
5645 : 85 06 __ STA WORK + 3 
5647 : a9 00 __ LDA #$00
5649 : 85 1b __ STA ACCU + 0 
564b : 85 1c __ STA ACCU + 1 
564d : 60 __ __ RTS
564e : a5 04 __ LDA WORK + 1 
5650 : d0 1f __ BNE $5671 ; (divmod + 88)
5652 : a5 03 __ LDA WORK + 0 
5654 : 30 1b __ BMI $5671 ; (divmod + 88)
5656 : a9 00 __ LDA #$00
5658 : 85 06 __ STA WORK + 3 
565a : a2 10 __ LDX #$10
565c : 06 1b __ ASL ACCU + 0 
565e : 26 1c __ ROL ACCU + 1 
5660 : 2a __ __ ROL
5661 : c5 03 __ CMP WORK + 0 
5663 : 90 02 __ BCC $5667 ; (divmod + 78)
5665 : e5 03 __ SBC WORK + 0 
5667 : 26 1b __ ROL ACCU + 0 
5669 : 26 1c __ ROL ACCU + 1 
566b : ca __ __ DEX
566c : d0 f2 __ BNE $5660 ; (divmod + 71)
566e : 85 05 __ STA WORK + 2 
5670 : 60 __ __ RTS
5671 : a9 00 __ LDA #$00
5673 : 85 05 __ STA WORK + 2 
5675 : 85 06 __ STA WORK + 3 
5677 : 84 02 __ STY $02 
5679 : a0 10 __ LDY #$10
567b : 18 __ __ CLC
567c : 26 1b __ ROL ACCU + 0 
567e : 26 1c __ ROL ACCU + 1 
5680 : 26 05 __ ROL WORK + 2 
5682 : 26 06 __ ROL WORK + 3 
5684 : 38 __ __ SEC
5685 : a5 05 __ LDA WORK + 2 
5687 : e5 03 __ SBC WORK + 0 
5689 : aa __ __ TAX
568a : a5 06 __ LDA WORK + 3 
568c : e5 04 __ SBC WORK + 1 
568e : 90 04 __ BCC $5694 ; (divmod + 123)
5690 : 86 05 __ STX WORK + 2 
5692 : 85 06 __ STA WORK + 3 
5694 : 88 __ __ DEY
5695 : d0 e5 __ BNE $567c ; (divmod + 99)
5697 : 26 1b __ ROL ACCU + 0 
5699 : 26 1c __ ROL ACCU + 1 
569b : a4 02 __ LDY $02 
569d : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
569e : 84 02 __ STY $02 
56a0 : a0 20 __ LDY #$20
56a2 : a9 00 __ LDA #$00
56a4 : 85 07 __ STA WORK + 4 
56a6 : 85 08 __ STA WORK + 5 
56a8 : 85 09 __ STA WORK + 6 
56aa : 85 0a __ STA WORK + 7 
56ac : a5 05 __ LDA WORK + 2 
56ae : 05 06 __ ORA WORK + 3 
56b0 : d0 39 __ BNE $56eb ; (divmod32 + 77)
56b2 : 18 __ __ CLC
56b3 : 26 1b __ ROL ACCU + 0 
56b5 : 26 1c __ ROL ACCU + 1 
56b7 : 26 1d __ ROL ACCU + 2 
56b9 : 26 1e __ ROL ACCU + 3 
56bb : 26 07 __ ROL WORK + 4 
56bd : 26 08 __ ROL WORK + 5 
56bf : 90 0c __ BCC $56cd ; (divmod32 + 47)
56c1 : a5 07 __ LDA WORK + 4 
56c3 : e5 03 __ SBC WORK + 0 
56c5 : aa __ __ TAX
56c6 : a5 08 __ LDA WORK + 5 
56c8 : e5 04 __ SBC WORK + 1 
56ca : 38 __ __ SEC
56cb : b0 0c __ BCS $56d9 ; (divmod32 + 59)
56cd : 38 __ __ SEC
56ce : a5 07 __ LDA WORK + 4 
56d0 : e5 03 __ SBC WORK + 0 
56d2 : aa __ __ TAX
56d3 : a5 08 __ LDA WORK + 5 
56d5 : e5 04 __ SBC WORK + 1 
56d7 : 90 04 __ BCC $56dd ; (divmod32 + 63)
56d9 : 86 07 __ STX WORK + 4 
56db : 85 08 __ STA WORK + 5 
56dd : 88 __ __ DEY
56de : d0 d3 __ BNE $56b3 ; (divmod32 + 21)
56e0 : 26 1b __ ROL ACCU + 0 
56e2 : 26 1c __ ROL ACCU + 1 
56e4 : 26 1d __ ROL ACCU + 2 
56e6 : 26 1e __ ROL ACCU + 3 
56e8 : a4 02 __ LDY $02 
56ea : 60 __ __ RTS
56eb : 18 __ __ CLC
56ec : 26 1b __ ROL ACCU + 0 
56ee : 26 1c __ ROL ACCU + 1 
56f0 : 26 1d __ ROL ACCU + 2 
56f2 : 26 1e __ ROL ACCU + 3 
56f4 : 26 07 __ ROL WORK + 4 
56f6 : 26 08 __ ROL WORK + 5 
56f8 : 26 09 __ ROL WORK + 6 
56fa : 26 0a __ ROL WORK + 7 
56fc : a5 07 __ LDA WORK + 4 
56fe : c5 03 __ CMP WORK + 0 
5700 : a5 08 __ LDA WORK + 5 
5702 : e5 04 __ SBC WORK + 1 
5704 : a5 09 __ LDA WORK + 6 
5706 : e5 05 __ SBC WORK + 2 
5708 : a5 0a __ LDA WORK + 7 
570a : e5 06 __ SBC WORK + 3 
570c : 90 18 __ BCC $5726 ; (divmod32 + 136)
570e : a5 07 __ LDA WORK + 4 
5710 : e5 03 __ SBC WORK + 0 
5712 : 85 07 __ STA WORK + 4 
5714 : a5 08 __ LDA WORK + 5 
5716 : e5 04 __ SBC WORK + 1 
5718 : 85 08 __ STA WORK + 5 
571a : a5 09 __ LDA WORK + 6 
571c : e5 05 __ SBC WORK + 2 
571e : 85 09 __ STA WORK + 6 
5720 : a5 0a __ LDA WORK + 7 
5722 : e5 06 __ SBC WORK + 3 
5724 : 85 0a __ STA WORK + 7 
5726 : 88 __ __ DEY
5727 : d0 c3 __ BNE $56ec ; (divmod32 + 78)
5729 : 26 1b __ ROL ACCU + 0 
572b : 26 1c __ ROL ACCU + 1 
572d : 26 1d __ ROL ACCU + 2 
572f : 26 1e __ ROL ACCU + 3 
5731 : a4 02 __ LDY $02 
5733 : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
5734 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
__multab15L:
573a : __ __ __ BYT 00 0f 1e 2d 3c                                  : ...-<
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
573f : a9 02 __ LDA #$02
5741 : 85 0d __ STA P0 
5743 : a9 9f __ LDA #$9f
5745 : 85 0e __ STA P1 
5747 : a9 59 __ LDA #$59
5749 : 85 0f __ STA P2 
574b : 4c d6 49 JMP $49d6 ; (vdc_prints.s0 + 0)
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
574e : a5 64 __ LDA $64 
5750 : 85 0d __ STA P0 
5752 : a5 56 __ LDA $56 
5754 : 85 10 __ STA P3 
5756 : 4c 30 50 JMP $5030 ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
5759 : __ __ __ BYT 7f 00 80 a0 4b 00 00 00 00 00 00 00 00 00 00 00 : ....K...........
--------------------------------------------------------------------
giocharmap:
5769 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
winStyles:
576a : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
577a : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
seed:
577c : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
577e : __ __ __ BYT 42 4c 55 45 20 4a 41 59 00 00 00 00 00 00 00 43 : BLUE JAY.......C
578e : __ __ __ BYT 41 52 44 49 4e 41 4c 00 00 00 00 00 00 00 45 41 : ARDINAL.......EA
579e : __ __ __ BYT 53 54 45 52 4e 20 50 48 4f 45 42 45 00 47 52 41 : STERN PHOEBE.GRA
57ae : __ __ __ BYT 43 4b 4c 45 00 00 00 00 00 00 00 00 53 41 4e 44 : CKLE........SAND
57be : __ __ __ BYT 48 49 4c 4c 20 43 52 41 4e 45 00                : HILL CRANE.
--------------------------------------------------------------------
57c9 : __ __ __ BYT 46 4c 49 45 53 00 4a 55 4d 50 53 00 53 4c 45 45 : FLIES.JUMPS.SLEE
57d9 : __ __ __ BYT 50 53 45 41 54 53 00 00 57 41 4c 4b 53 00       : PSEATS..WALKS.
--------------------------------------------------------------------
p2smap:
57e7 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
vdc_modes:
5800 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
5810 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
5820 : __ __ __ BYT e7 24 7e ff 50 00 32 00 00 00 00 00 10 00 40 00 : .$~.P.2.......@.
5830 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
5840 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
5850 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
5860 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
5870 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
5880 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
5890 : __ __ __ BYT 50 00 32 00 00 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
58a0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
58b0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
58c0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
58d0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
58d8 : __ __ __ BYT 42 49 47 00 00 00 53 4d 41 4c 4c 00 41 4e 47 52 : BIG...SMALL.ANGR
58e8 : __ __ __ BYT 59 00 57 45 54 00 00 00 48 41 50 50 59 00       : Y.WET...HAPPY.
--------------------------------------------------------------------
vdc_state:
58f6 : __ __ __ BSS	25
--------------------------------------------------------------------
multab:
590f : __ __ __ BSS	144
--------------------------------------------------------------------
linebuffer:
599f : __ __ __ BSS	81
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1300 : ad 06 59 LDA $5906 ; (vdc_state + 16)
01:1303 : 85 0d __ STA P0 
01:1305 : ad 07 59 LDA $5907 ; (vdc_state + 17)
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
01:1392 : 20 81 44 JSR $4481 ; (krnio_setbnk.s0 + 0)
01:1395 : a5 12 __ LDA P5 ; (fname + 0)
01:1397 : 85 0d __ STA P0 
01:1399 : a5 13 __ LDA P6 ; (fname + 1)
01:139b : 85 0e __ STA P1 
01:139d : 20 89 44 JSR $4489 ; (krnio_setnam.s0 + 0)
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
01:13bb : ad 2b bf LDA $bf2b ; (viewport + 0)
01:13be : 85 0f __ STA P2 
01:13c0 : a5 54 __ LDA $54 
01:13c2 : 85 10 __ STA P3 
01:13c4 : a5 55 __ LDA $55 
01:13c6 : 85 11 __ STA P4 
01:13c8 : ad 38 bf LDA $bf38 ; (viewport + 13)
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
01:1438 : a9 9f __ LDA #$9f
01:143a : 85 0d __ STA P0 
01:143c : a9 59 __ LDA #$59
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
01:14b3 : ca __ __ DEX
01:14b4 : e0 ff __ CPX #$ff
01:14b6 : d0 97 __ BNE $144f ; (bnk_cpyfromvdc.l110 + 0)
.s1008:
01:14b8 : c6 12 __ DEC P5 ; (size + 1)
01:14ba : 4c 4f 14 JMP $144f ; (bnk_cpyfromvdc.l110 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:14bd : a9 9f __ LDA #$9f
01:14bf : 85 0d __ STA P0 
01:14c1 : a9 59 __ LDA #$59
01:14c3 : 85 0e __ STA P1 
01:14c5 : a5 12 __ LDA P5 
01:14c7 : 85 11 __ STA P4 
01:14c9 : a9 00 __ LDA #$00
01:14cb : 85 12 __ STA P5 
01:14cd : 4c 48 14 JMP $1448 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:14d0 : ad aa be LDA $beaa ; (vp_fill + 0)
01:14d3 : 85 0f __ STA P2 
01:14d5 : a5 57 __ LDA $57 
01:14d7 : 85 10 __ STA P3 
01:14d9 : a5 58 __ LDA $58 
01:14db : 85 11 __ STA P4 
01:14dd : ad b7 be LDA $beb7 ; (vp_fill + 13)
01:14e0 : 85 12 __ STA P5 
01:14e2 : a9 00 __ LDA #$00
01:14e4 : 85 13 __ STA P6 
01:14e6 : 4c d1 13 JMP $13d1 ; (bnk_cpytovdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:14e9 : a9 0e __ LDA #$0e
01:14eb : 85 0f __ STA P2 
01:14ed : a9 9f __ LDA #$9f
01:14ef : 85 10 __ STA P3 
01:14f1 : a9 59 __ LDA #$59
01:14f3 : 85 11 __ STA P4 
01:14f5 : a5 57 __ LDA $57 
01:14f7 : 85 12 __ STA P5 
01:14f9 : a9 00 __ LDA #$00
01:14fb : 85 13 __ STA P6 
01:14fd : 4c d1 13 JMP $13d1 ; (bnk_cpytovdc.s0 + 0)
