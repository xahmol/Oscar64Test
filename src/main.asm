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
1c13 : 8e fd 4e STX $4efd ; (spentry + 0)
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
1c97 : bd 57 57 LDA $5757,x ; (vdc_printc@proxy + 10)
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
1ddb : 4c a1 3c JMP $3ca1 ; (main.s101 + 0)
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
1ded : 20 7c 3d JSR $3d7c ; (printf.s1000 + 0)
1df0 : 20 d9 43 JSR $43d9 ; (getch.s0 + 0)
1df3 : 20 e7 43 JSR $43e7 ; (clrscr.s0 + 0)
1df6 : 20 eb 43 JSR $43eb ; (screen_setmode.s0 + 0)
.s10429:
1df9 : a5 ba __ LDA $ba 
1dfb : d0 02 __ BNE $1dff ; (main.s186 + 0)
.s184:
1dfd : a9 08 __ LDA #$08
.s186:
1dff : 85 53 __ STA T0 + 0 
1e01 : 85 f7 __ STA $f7 ; (bootdevice + 0)
1e03 : a9 5c __ LDA #$5c
1e05 : a0 02 __ LDY #$02
1e07 : 91 23 __ STA (SP + 0),y 
1e09 : a9 44 __ LDA #$44
1e0b : c8 __ __ INY
1e0c : 91 23 __ STA (SP + 0),y 
1e0e : a5 53 __ LDA T0 + 0 
1e10 : c8 __ __ INY
1e11 : 91 23 __ STA (SP + 0),y 
1e13 : a9 00 __ LDA #$00
1e15 : c8 __ __ INY
1e16 : 91 23 __ STA (SP + 0),y 
1e18 : 20 7c 3d JSR $3d7c ; (printf.s1000 + 0)
1e1b : a9 06 __ LDA #$06
1e1d : 8d 06 d5 STA $d506 
1e20 : a9 6c __ LDA #$6c
1e22 : a0 02 __ LDY #$02
1e24 : 91 23 __ STA (SP + 0),y 
1e26 : a9 44 __ LDA #$44
1e28 : c8 __ __ INY
1e29 : 91 23 __ STA (SP + 0),y 
1e2b : 20 7c 3d JSR $3d7c ; (printf.s1000 + 0)
1e2e : a9 00 __ LDA #$00
1e30 : 85 0d __ STA P0 
1e32 : 85 0e __ STA P1 
1e34 : 20 f8 43 JSR $43f8 ; (krnio_setbnk.s0 + 0)
1e37 : a9 f3 __ LDA #$f3
1e39 : 85 0d __ STA P0 
1e3b : a9 43 __ LDA #$43
1e3d : 85 0e __ STA P1 
1e3f : 20 86 44 JSR $4486 ; (krnio_setnam.s0 + 0)
1e42 : a9 01 __ LDA #$01
1e44 : 85 0d __ STA P0 
1e46 : 85 0f __ STA P2 
1e48 : a5 53 __ LDA T0 + 0 
1e4a : 85 0e __ STA P1 
1e4c : 20 9c 44 JSR $449c ; (krnio_load.s0 + 0)
1e4f : 09 00 __ ORA #$00
1e51 : d0 11 __ BNE $1e64 ; (main.s193 + 0)
.s189:
1e53 : a9 b9 __ LDA #$b9
1e55 : a0 02 __ LDY #$02
1e57 : 91 23 __ STA (SP + 0),y 
1e59 : a9 44 __ LDA #$44
1e5b : c8 __ __ INY
1e5c : 91 23 __ STA (SP + 0),y 
1e5e : 20 7c 3d JSR $3d7c ; (printf.s1000 + 0)
1e61 : 20 d7 44 JSR $44d7 ; (exit@proxy + 0)
.s193:
1e64 : a9 01 __ LDA #$01
1e66 : 8d 30 d0 STA $d030 
1e69 : a9 00 __ LDA #$00
1e6b : 85 13 __ STA P6 
1e6d : ad 11 d0 LDA $d011 
1e70 : 29 6f __ AND #$6f
1e72 : 8d 11 d0 STA $d011 
1e75 : 20 f4 44 JSR $44f4 ; (vdc_set_mode.s1000 + 0)
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
1f82 : 4c c6 3b JMP $3bc6 ; (main.s299 + 0)
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
1fa5 : 20 d3 49 JSR $49d3 ; (vdc_prints.s0 + 0)
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
1fcf : a2 f7 __ LDX #$f7
1fd1 : 4c d8 1f JMP $1fd8 ; (main.s5487 + 0)
.s5485:
1fd4 : a9 4a __ LDA #$4a
1fd6 : a2 f4 __ LDX #$f4
.s5487:
1fd8 : 85 58 __ STA T3 + 1 
1fda : 8a __ __ TXA
1fdb : a0 08 __ LDY #$08
1fdd : 91 23 __ STA (SP + 0),y 
1fdf : a5 58 __ LDA T3 + 1 
1fe1 : c8 __ __ INY
1fe2 : 91 23 __ STA (SP + 0),y 
1fe4 : 20 1b 4b JSR $4b1b ; (sprintf.s1000 + 0)
1fe7 : 20 3e 57 JSR $573e ; (vdc_prints@proxy + 0)
1fea : a9 04 __ LDA #$04
1fec : 85 0d __ STA P0 
1fee : a9 76 __ LDA #$76
1ff0 : 85 0e __ STA P1 
1ff2 : a9 4e __ LDA #$4e
1ff4 : 85 0f __ STA P2 
1ff6 : 20 d3 49 JSR $49d3 ; (vdc_prints.s0 + 0)
1ff9 : e6 0d __ INC P0 
1ffb : a9 86 __ LDA #$86
1ffd : 85 0e __ STA P1 
1fff : a9 4e __ LDA #$4e
2001 : 85 0f __ STA P2 
2003 : 20 d3 49 JSR $49d3 ; (vdc_prints.s0 + 0)
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
2027 : 20 cb 49 JSR $49cb ; (vdc_prints@proxy + 0)
202a : 20 d7 44 JSR $44d7 ; (exit@proxy + 0)
.s379:
202d : a9 06 __ LDA #$06
202f : 85 0d __ STA P0 
2031 : a9 b5 __ LDA #$b5
2033 : 85 0e __ STA P1 
2035 : a9 4e __ LDA #$4e
2037 : 85 0f __ STA P2 
2039 : 20 d3 49 JSR $49d3 ; (vdc_prints.s0 + 0)
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
205d : 20 cb 49 JSR $49cb ; (vdc_prints@proxy + 0)
2060 : 20 d7 44 JSR $44d7 ; (exit@proxy + 0)
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
20be : 20 f4 44 JSR $44f4 ; (vdc_set_mode.s1000 + 0)
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
2152 : 4c e2 3a JMP $3ae2 ; (main.l408 + 0)
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
2276 : 20 d9 43 JSR $43d9 ; (getch.s0 + 0)
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
2290 : 4c 19 3a JMP $3a19 ; (main.l548 + 0)
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
22bd : 4c 66 39 JMP $3966 ; (main.l600 + 0)
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
22d2 : ad 28 bf LDA $bf28 ; (softscroll + 13)
22d5 : 38 __ __ SEC
22d6 : e9 02 __ SBC #$02
22d8 : 8d 28 bf STA $bf28 ; (softscroll + 13)
22db : b0 03 __ BCS $22e0 ; (main.s1703 + 0)
.s1702:
22dd : ce 29 bf DEC $bf29 ; (softscroll + 14)
.s1703:
22e0 : ad 23 bf LDA $bf23 ; (softscroll + 8)
22e3 : 18 __ __ CLC
22e4 : 69 02 __ ADC #$02
22e6 : 8d 23 bf STA $bf23 ; (softscroll + 8)
22e9 : c9 07 __ CMP #$07
22eb : 90 03 __ BCC $22f0 ; (main.s654 + 0)
22ed : 4c d6 38 JMP $38d6 ; (main.s653 + 0)
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
232c : 4c 11 38 JMP $3811 ; (main.s701 + 0)
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
2350 : 4c 36 37 JMP $3736 ; (main.s753 + 0)
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
238a : 20 f4 44 JSR $44f4 ; (vdc_set_mode.s1000 + 0)
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
23a5 : 20 f4 44 JSR $44f4 ; (vdc_set_mode.s1000 + 0)
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
2493 : 20 d3 49 JSR $49d3 ; (vdc_prints.s0 + 0)
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
24e6 : a2 eb __ LDX #$eb
24e8 : 4c ef 24 JMP $24ef ; (main.s5496 + 0)
.s5494:
24eb : a9 4a __ LDA #$4a
24ed : a2 fb __ LDX #$fb
.s5496:
24ef : 85 60 __ STA T7 + 1 
24f1 : 8a __ __ TXA
24f2 : a0 0c __ LDY #$0c
24f4 : 91 23 __ STA (SP + 0),y 
24f6 : a5 60 __ LDA T7 + 1 
24f8 : c8 __ __ INY
24f9 : 91 23 __ STA (SP + 0),y 
24fb : 20 1b 4b JSR $4b1b ; (sprintf.s1000 + 0)
24fe : 20 3e 57 JSR $573e ; (vdc_prints@proxy + 0)
2501 : e6 0d __ INC P0 
2503 : a9 3c __ LDA #$3c
2505 : 85 0e __ STA P1 
2507 : a9 4f __ LDA #$4f
2509 : 85 0f __ STA P2 
250b : 20 d3 49 JSR $49d3 ; (vdc_prints.s0 + 0)
250e : a6 5d __ LDX T6 + 0 
2510 : ca __ __ DEX
2511 : 86 0d __ STX P0 
2513 : a9 71 __ LDA #$71
2515 : 85 0e __ STA P1 
2517 : a9 4f __ LDA #$4f
2519 : 85 0f __ STA P2 
251b : 20 d3 49 JSR $49d3 ; (vdc_prints.s0 + 0)
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
253a : ad 68 57 LDA $5768 ; (winStyles + 0)
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
257e : 4c 27 36 JMP $3627 ; (main.s926 + 0)
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
259d : 4c 21 35 JMP $3521 ; (main.s1005 + 0)
.s2666:
25a0 : a9 00 __ LDA #$00
25a2 : 85 61 __ STA T8 + 0 
25a4 : cd 4e bf CMP $bf4e ; (window + 3)
25a7 : b0 03 __ BCS $25ac ; (main.s917 + 0)
25a9 : 4c f2 33 JMP $33f2 ; (main.l1085 + 0)
.s917:
25ac : 20 d9 43 JSR $43d9 ; (getch.s0 + 0)
25af : ad 08 dc LDA $dc08 
25b2 : 18 __ __ CLC
25b3 : 6d 09 dc ADC $dc09 
25b6 : a2 00 __ LDX #$00
25b8 : 90 01 __ BCC $25bb ; (main.s1671 + 0)
.s1670:
25ba : e8 __ __ INX
.s1671:
25bb : 18 __ __ CLC
25bc : 69 01 __ ADC #$01
25be : 8d 7a 57 STA $577a ; (seed + 0)
25c1 : 90 01 __ BCC $25c4 ; (main.s1673 + 0)
.s1672:
25c3 : e8 __ __ INX
.s1673:
25c4 : 8e 7b 57 STX $577b ; (seed + 1)
25c7 : a9 c8 __ LDA #$c8
25c9 : 85 56 __ STA T2 + 0 
.l1165:
25cb : a9 9f __ LDA #$9f
25cd : 85 16 __ STA P9 
25cf : a9 59 __ LDA #$59
25d1 : 85 17 __ STA P10 
25d3 : ad 7b 57 LDA $577b ; (seed + 1)
25d6 : 4a __ __ LSR
25d7 : ad 7a 57 LDA $577a ; (seed + 0)
25da : 6a __ __ ROR
25db : aa __ __ TAX
25dc : a9 00 __ LDA #$00
25de : 85 04 __ STA WORK + 1 
25e0 : 6a __ __ ROR
25e1 : 4d 7a 57 EOR $577a ; (seed + 0)
25e4 : 85 59 __ STA T4 + 0 
25e6 : 8a __ __ TXA
25e7 : 4d 7b 57 EOR $577b ; (seed + 1)
25ea : 85 5a __ STA T4 + 1 
25ec : 4a __ __ LSR
25ed : 45 59 __ EOR T4 + 0 
25ef : 8d 7a 57 STA $577a ; (seed + 0)
25f2 : 85 1b __ STA ACCU + 0 
25f4 : 45 5a __ EOR T4 + 1 
25f6 : 8d 7b 57 STA $577b ; (seed + 1)
25f9 : 85 1c __ STA ACCU + 1 
25fb : ad fd 58 LDA $58fd ; (vdc_state + 7)
25fe : 29 f0 __ AND #$f0
2600 : 85 5b __ STA T5 + 0 
2602 : a9 0f __ LDA #$0f
2604 : 85 03 __ STA WORK + 0 
2606 : 20 19 56 JSR $5619 ; (divmod + 0)
2609 : a5 05 __ LDA WORK + 2 
260b : 38 __ __ SEC
260c : 65 5b __ ADC T5 + 0 
260e : 8d fd 58 STA $58fd ; (vdc_state + 7)
2611 : 20 ae 50 JSR $50ae ; (generateSentence.s1000 + 0)
2614 : a9 00 __ LDA #$00
2616 : 85 61 __ STA T8 + 0 
2618 : 85 59 __ STA T4 + 0 
261a : ad 9f 59 LDA $599f ; (linebuffer + 0)
261d : f0 0c __ BEQ $262b ; (main.s1175 + 0)
.s1174:
261f : a2 00 __ LDX #$00
.l1654:
2621 : bd a0 59 LDA $59a0,x ; (linebuffer + 1)
2624 : e8 __ __ INX
2625 : 09 00 __ ORA #$00
2627 : d0 f8 __ BNE $2621 ; (main.l1654 + 0)
.s1655:
2629 : 86 59 __ STX T4 + 0 
.s1175:
262b : a5 59 __ LDA T4 + 0 
262d : f0 2f __ BEQ $265e ; (main.s1171 + 0)
.s2663:
262f : a9 ff __ LDA #$ff
2631 : 85 5c __ STA T5 + 1 
2633 : 85 5e __ STA T6 + 1 
2635 : a9 00 __ LDA #$00
2637 : 85 62 __ STA T9 + 0 
2639 : ad 4d bf LDA $bf4d ; (window + 2)
263c : 85 63 __ STA T10 + 0 
.l1180:
263e : a5 61 __ LDA T8 + 0 
2640 : c5 59 __ CMP T4 + 0 
2642 : b0 0d __ BCS $2651 ; (main.s1183 + 0)
.l1185:
2644 : 24 5e __ BIT T6 + 1 
2646 : 10 09 __ BPL $2651 ; (main.s1183 + 0)
.s1184:
2648 : a5 62 __ LDA T9 + 0 
264a : c9 50 __ CMP #$50
264c : b0 03 __ BCS $2651 ; (main.s1183 + 0)
264e : 4c cf 33 JMP $33cf ; (main.s1182 + 0)
.s1183:
2651 : a6 62 __ LDX T9 + 0 
2653 : f0 03 __ BEQ $2658 ; (main.s1177 + 0)
2655 : 4c 69 33 JMP $3369 ; (main.s1195 + 0)
.s1177:
2658 : a5 61 __ LDA T8 + 0 
265a : c5 59 __ CMP T4 + 0 
265c : 90 e6 __ BCC $2644 ; (main.l1185 + 0)
.s1171:
265e : ad 4f bf LDA $bf4f ; (window + 4)
2661 : f0 57 __ BEQ $26ba ; (main.s7783 + 0)
.s1206:
2663 : 85 61 __ STA T8 + 0 
2665 : 18 __ __ CLC
2666 : 6d 4b bf ADC $bf4b ; (window + 0)
2669 : 85 0d __ STA P0 
266b : ad 50 bf LDA $bf50 ; (window + 5)
266e : 85 62 __ STA T9 + 0 
2670 : 18 __ __ CLC
2671 : 6d 4c bf ADC $bf4c ; (window + 1)
2674 : 85 0e __ STA P1 
2676 : ad e6 57 LDA $57e6 ; (p2smap + 1)
2679 : 49 20 __ EOR #$20
267b : 85 0f __ STA P2 
267d : 20 ef 4e JSR $4eef ; (vdc_printc@proxy + 0)
2680 : a6 61 __ LDX T8 + 0 
2682 : e8 __ __ INX
2683 : 8e 4f bf STX $bf4f ; (window + 4)
2686 : ec 4d bf CPX $bf4d ; (window + 2)
2689 : d0 2f __ BNE $26ba ; (main.s7783 + 0)
.s1213:
268b : a9 00 __ LDA #$00
268d : 8d 4f bf STA $bf4f ; (window + 4)
2690 : 18 __ __ CLC
2691 : a5 62 __ LDA T9 + 0 
2693 : 69 01 __ ADC #$01
2695 : 8d 50 bf STA $bf50 ; (window + 5)
2698 : cd 4e bf CMP $bf4e ; (window + 3)
269b : d0 1d __ BNE $26ba ; (main.s7783 + 0)
.s1216:
269d : a5 62 __ LDA T9 + 0 
269f : 8d 50 bf STA $bf50 ; (window + 5)
26a2 : a9 4b __ LDA #$4b
26a4 : a0 02 __ LDY #$02
26a6 : 91 23 __ STA (SP + 0),y 
26a8 : a9 bf __ LDA #$bf
26aa : c8 __ __ INY
26ab : 91 23 __ STA (SP + 0),y 
26ad : a9 ff __ LDA #$ff
26af : c8 __ __ INY
26b0 : 91 23 __ STA (SP + 0),y 
26b2 : a9 4a __ LDA #$4a
26b4 : c8 __ __ INY
26b5 : 91 23 __ STA (SP + 0),y 
26b7 : 20 18 52 JSR $5218 ; (vdcwin_printline.s1000 + 0)
.s7783:
26ba : c6 56 __ DEC T2 + 0 
26bc : f0 03 __ BEQ $26c1 ; (main.s1167 + 0)
26be : 4c cb 25 JMP $25cb ; (main.l1165 + 0)
.s1167:
26c1 : 20 d9 43 JSR $43d9 ; (getch.s0 + 0)
26c4 : a9 7f __ LDA #$7f
26c6 : 8d 2b bf STA $bf2b ; (viewport + 0)
26c9 : a9 50 __ LDA #$50
26cb : 8d 2e bf STA $bf2e ; (viewport + 3)
26ce : a9 00 __ LDA #$00
26d0 : 8d 2c bf STA $bf2c ; (viewport + 1)
26d3 : 8d 2f bf STA $bf2f ; (viewport + 4)
26d6 : 8d 31 bf STA $bf31 ; (viewport + 6)
26d9 : 8d 32 bf STA $bf32 ; (viewport + 7)
26dc : 8d 33 bf STA $bf33 ; (viewport + 8)
26df : 8d 34 bf STA $bf34 ; (viewport + 9)
26e2 : 8d 35 bf STA $bf35 ; (viewport + 10)
26e5 : a9 96 __ LDA #$96
26e7 : 8d 30 bf STA $bf30 ; (viewport + 5)
26ea : a9 05 __ LDA #$05
26ec : 85 0f __ STA P2 
26ee : 85 10 __ STA P3 
26f0 : a9 46 __ LDA #$46
26f2 : 85 11 __ STA P4 
26f4 : a9 20 __ LDA #$20
26f6 : 8d 2d bf STA $bf2d ; (viewport + 2)
26f9 : a9 36 __ LDA #$36
26fb : 85 0d __ STA P0 
26fd : a9 bf __ LDA #$bf
26ff : 85 0e __ STA P1 
2701 : ad fb 58 LDA $58fb ; (vdc_state + 5)
2704 : 38 __ __ SEC
2705 : e9 07 __ SBC #$07
2707 : 85 12 __ STA P5 
2709 : 20 c7 4f JSR $4fc7 ; (vdcwin_init.s0 + 0)
270c : ad 34 bf LDA $bf34 ; (viewport + 9)
270f : 85 1b __ STA ACCU + 0 
2711 : ad 35 bf LDA $bf35 ; (viewport + 10)
2714 : 85 1c __ STA ACCU + 1 
2716 : ad 2e bf LDA $bf2e ; (viewport + 3)
2719 : 85 03 __ STA WORK + 0 
271b : ad 2f bf LDA $bf2f ; (viewport + 4)
271e : 85 04 __ STA WORK + 1 
2720 : 20 d7 55 JSR $55d7 ; (mul16 + 0)
2723 : ad 2c bf LDA $bf2c ; (viewport + 1)
2726 : 18 __ __ CLC
2727 : 65 05 __ ADC WORK + 2 
2729 : a8 __ __ TAY
272a : ad 2d bf LDA $bf2d ; (viewport + 2)
272d : 65 06 __ ADC WORK + 3 
272f : aa __ __ TAX
2730 : 98 __ __ TYA
2731 : 18 __ __ CLC
2732 : 6d 32 bf ADC $bf32 ; (viewport + 7)
2735 : 85 54 __ STA T1 + 0 
2737 : 8a __ __ TXA
2738 : 6d 33 bf ADC $bf33 ; (viewport + 8)
273b : ac 3d bf LDY $bf3d ; (viewport + 18)
273e : ae 3c bf LDX $bf3c ; (viewport + 17)
2741 : 4c 67 27 JMP $2767 ; (main.l1221 + 0)
.s1222:
2744 : 86 0d __ STX P0 
2746 : 84 0e __ STY P1 
2748 : 20 bb 13 JSR $13bb ; (bnk_cpytovdc@proxy + 0)
274b : ad f9 58 LDA $58f9 ; (vdc_state + 3)
274e : 18 __ __ CLC
274f : 65 0d __ ADC P0 
2751 : aa __ __ TAX
2752 : ad fa 58 LDA $58fa ; (vdc_state + 4)
2755 : 65 0e __ ADC P1 
2757 : a8 __ __ TAY
2758 : 18 __ __ CLC
2759 : a5 54 __ LDA T1 + 0 
275b : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
275e : 85 54 __ STA T1 + 0 
2760 : a5 55 __ LDA T1 + 1 
2762 : 6d fa 58 ADC $58fa ; (vdc_state + 4)
2765 : e6 56 __ INC T2 + 0 
.l1221:
2767 : 85 55 __ STA T1 + 1 
2769 : a5 56 __ LDA T2 + 0 
276b : cd 39 bf CMP $bf39 ; (viewport + 14)
276e : 90 d4 __ BCC $2744 ; (main.s1222 + 0)
.s1224:
2770 : ad 2e bf LDA $bf2e ; (viewport + 3)
2773 : 85 03 __ STA WORK + 0 
2775 : ad 2f bf LDA $bf2f ; (viewport + 4)
2778 : 85 04 __ STA WORK + 1 
277a : ad 34 bf LDA $bf34 ; (viewport + 9)
277d : 85 1b __ STA ACCU + 0 
277f : ad 35 bf LDA $bf35 ; (viewport + 10)
2782 : 85 1c __ STA ACCU + 1 
2784 : 20 d7 55 JSR $55d7 ; (mul16 + 0)
2787 : ad 2c bf LDA $bf2c ; (viewport + 1)
278a : 18 __ __ CLC
278b : 65 05 __ ADC WORK + 2 
278d : a8 __ __ TAY
278e : ad 2d bf LDA $bf2d ; (viewport + 2)
2791 : 65 06 __ ADC WORK + 3 
2793 : aa __ __ TAX
2794 : 98 __ __ TYA
2795 : 18 __ __ CLC
2796 : 6d 32 bf ADC $bf32 ; (viewport + 7)
2799 : 85 57 __ STA T3 + 0 
279b : 8a __ __ TXA
279c : 6d 33 bf ADC $bf33 ; (viewport + 8)
279f : 85 58 __ STA T3 + 1 
27a1 : ad 30 bf LDA $bf30 ; (viewport + 5)
27a4 : 85 1b __ STA ACCU + 0 
27a6 : ad 31 bf LDA $bf31 ; (viewport + 6)
27a9 : 85 1c __ STA ACCU + 1 
27ab : ad 2e bf LDA $bf2e ; (viewport + 3)
27ae : 85 03 __ STA WORK + 0 
27b0 : ad 2f bf LDA $bf2f ; (viewport + 4)
27b3 : 85 04 __ STA WORK + 1 
27b5 : 20 d7 55 JSR $55d7 ; (mul16 + 0)
27b8 : 18 __ __ CLC
27b9 : a5 57 __ LDA T3 + 0 
27bb : 65 05 __ ADC WORK + 2 
27bd : aa __ __ TAX
27be : a5 58 __ LDA T3 + 1 
27c0 : 65 06 __ ADC WORK + 3 
27c2 : a8 __ __ TAY
27c3 : 8a __ __ TXA
27c4 : 18 __ __ CLC
27c5 : 69 30 __ ADC #$30
27c7 : 85 54 __ STA T1 + 0 
27c9 : 90 01 __ BCC $27cc ; (main.s1675 + 0)
.s1674:
27cb : c8 __ __ INY
.s1675:
27cc : 84 55 __ STY T1 + 1 
27ce : a9 00 __ LDA #$00
27d0 : 85 56 __ STA T2 + 0 
27d2 : ac 3f bf LDY $bf3f ; (viewport + 20)
27d5 : ae 3e bf LDX $bf3e ; (viewport + 19)
27d8 : 4c 02 28 JMP $2802 ; (main.l1225 + 0)
.s1226:
27db : 86 0d __ STX P0 
27dd : 84 0e __ STY P1 
27df : 20 bb 13 JSR $13bb ; (bnk_cpytovdc@proxy + 0)
27e2 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
27e5 : 18 __ __ CLC
27e6 : 65 0d __ ADC P0 
27e8 : aa __ __ TAX
27e9 : ad fa 58 LDA $58fa ; (vdc_state + 4)
27ec : 65 0e __ ADC P1 
27ee : a8 __ __ TAY
27ef : 18 __ __ CLC
27f0 : a5 54 __ LDA T1 + 0 
27f2 : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
27f5 : 85 54 __ STA T1 + 0 
27f7 : a5 55 __ LDA T1 + 1 
27f9 : 6d fa 58 ADC $58fa ; (vdc_state + 4)
27fc : 85 55 __ STA T1 + 1 
27fe : e6 56 __ INC T2 + 0 
2800 : a5 56 __ LDA T2 + 0 
.l1225:
2802 : cd 39 bf CMP $bf39 ; (viewport + 14)
2805 : 90 d4 __ BCC $27db ; (main.s1226 + 0)
.l1229:
2807 : 20 d9 43 JSR $43d9 ; (getch.s0 + 0)
280a : a9 00 __ LDA #$00
280c : 85 56 __ STA T2 + 0 
280e : a5 1b __ LDA ACCU + 0 
2810 : 85 54 __ STA T1 + 0 
2812 : c9 57 __ CMP #$57
2814 : f0 04 __ BEQ $281a ; (main.s1234 + 0)
.s1235:
2816 : c9 91 __ CMP #$91
2818 : d0 11 __ BNE $282b ; (main.s1233 + 0)
.s1234:
281a : ad 34 bf LDA $bf34 ; (viewport + 9)
281d : 0d 35 bf ORA $bf35 ; (viewport + 10)
2820 : f0 09 __ BEQ $282b ; (main.s1233 + 0)
.s1231:
2822 : a9 08 __ LDA #$08
2824 : 85 56 __ STA T2 + 0 
2826 : a5 1b __ LDA ACCU + 0 
2828 : 4c 31 28 JMP $2831 ; (main.s1240 + 0)
.s1233:
282b : a5 1b __ LDA ACCU + 0 
282d : c9 53 __ CMP #$53
282f : f0 04 __ BEQ $2835 ; (main.s1239 + 0)
.s1240:
2831 : c9 11 __ CMP #$11
2833 : d0 2c __ BNE $2861 ; (main.s1238 + 0)
.s1239:
2835 : 38 __ __ SEC
2836 : a9 96 __ LDA #$96
2838 : ed fb 58 SBC $58fb ; (vdc_state + 5)
283b : aa __ __ TAX
283c : a9 00 __ LDA #$00
283e : ed fc 58 SBC $58fc ; (vdc_state + 6)
2841 : a8 __ __ TAY
2842 : 8a __ __ TXA
2843 : 18 __ __ CLC
2844 : 69 06 __ ADC #$06
2846 : 85 57 __ STA T3 + 0 
2848 : 90 01 __ BCC $284b ; (main.s1677 + 0)
.s1676:
284a : c8 __ __ INY
.s1677:
284b : 84 58 __ STY T3 + 1 
284d : ad 35 bf LDA $bf35 ; (viewport + 10)
2850 : c5 58 __ CMP T3 + 1 
2852 : d0 05 __ BNE $2859 ; (main.s1237 + 0)
.s1236:
2854 : ad 34 bf LDA $bf34 ; (viewport + 9)
2857 : c5 57 __ CMP T3 + 0 
.s1237:
2859 : b0 06 __ BCS $2861 ; (main.s1238 + 0)
.s1236:
285b : a5 56 __ LDA T2 + 0 
285d : 09 04 __ ORA #$04
285f : 85 56 __ STA T2 + 0 
.s1238:
2861 : a5 1b __ LDA ACCU + 0 
2863 : c9 41 __ CMP #$41
2865 : f0 04 __ BEQ $286b ; (main.s1244 + 0)
.s1245:
2867 : c9 9d __ CMP #$9d
2869 : d0 0e __ BNE $2879 ; (main.s1243 + 0)
.s1244:
286b : ad 32 bf LDA $bf32 ; (viewport + 7)
286e : 0d 33 bf ORA $bf33 ; (viewport + 8)
2871 : f0 06 __ BEQ $2879 ; (main.s1243 + 0)
.s1241:
2873 : a5 56 __ LDA T2 + 0 
2875 : 09 01 __ ORA #$01
2877 : 85 56 __ STA T2 + 0 
.s1243:
2879 : a5 1b __ LDA ACCU + 0 
287b : c9 44 __ CMP #$44
287d : f0 04 __ BEQ $2883 ; (main.s1249 + 0)
.s1250:
287f : c9 1d __ CMP #$1d
2881 : d0 15 __ BNE $2898 ; (main.s1248 + 0)
.s1249:
2883 : ad 33 bf LDA $bf33 ; (viewport + 8)
2886 : d0 10 __ BNE $2898 ; (main.s1248 + 0)
.s1227:
2888 : ad 32 bf LDA $bf32 ; (viewport + 7)
288b : c9 09 __ CMP #$09
288d : b0 09 __ BCS $2898 ; (main.s1248 + 0)
.s1246:
288f : a5 56 __ LDA T2 + 0 
2891 : 09 02 __ ORA #$02
2893 : 85 56 __ STA T2 + 0 
2895 : 4c db 29 JMP $29db ; (main.s1251 + 0)
.s1248:
2898 : a5 56 __ LDA T2 + 0 
289a : f0 03 __ BEQ $289f ; (main.s1253 + 0)
289c : 4c db 29 JMP $29db ; (main.s1251 + 0)
.s1253:
289f : a5 54 __ LDA T1 + 0 
28a1 : c9 1b __ CMP #$1b
28a3 : f0 07 __ BEQ $28ac ; (main.s842 + 0)
.s2352:
28a5 : c9 03 __ CMP #$03
28a7 : f0 03 __ BEQ $28ac ; (main.s842 + 0)
28a9 : 4c 07 28 JMP $2807 ; (main.l1229 + 0)
.s842:
28ac : e6 53 __ INC T0 + 0 
28ae : a5 53 __ LDA T0 + 0 
28b0 : c9 03 __ CMP #$03
28b2 : b0 03 __ BCS $28b7 ; (main.s843 + 0)
28b4 : 4c a3 23 JMP $23a3 ; (main.l841 + 0)
.s843:
28b7 : a9 00 __ LDA #$00
28b9 : 8d 30 d0 STA $d030 
28bc : 85 13 __ STA P6 
28be : ad 11 d0 LDA $d011 
28c1 : 29 7f __ AND #$7f
28c3 : 09 10 __ ORA #$10
28c5 : 8d 11 d0 STA $d011 
28c8 : 20 f4 44 JSR $44f4 ; (vdc_set_mode.s1000 + 0)
28cb : a9 00 __ LDA #$00
28cd : 85 53 __ STA T0 + 0 
28cf : ad f9 58 LDA $58f9 ; (vdc_state + 3)
28d2 : 85 54 __ STA T1 + 0 
28d4 : ad fb 58 LDA $58fb ; (vdc_state + 5)
28d7 : 85 57 __ STA T3 + 0 
.l2360:
28d9 : a5 53 __ LDA T0 + 0 
28db : c5 57 __ CMP T3 + 0 
28dd : 90 21 __ BCC $2900 ; (main.s2361 + 0)
.s2358:
28df : a9 04 __ LDA #$04
28e1 : 8d 06 d5 STA $d506 
28e4 : a9 00 __ LDA #$00
28e6 : 85 1b __ STA ACCU + 0 
28e8 : 85 1c __ STA ACCU + 1 
.s1001:
28ea : 18 __ __ CLC
28eb : a5 23 __ LDA SP + 0 
28ed : 69 0e __ ADC #$0e
28ef : 85 23 __ STA SP + 0 
28f1 : 90 02 __ BCC $28f5 ; (main.s1001 + 11)
28f3 : e6 24 __ INC SP + 1 
28f5 : a2 14 __ LDX #$14
28f7 : bd 95 be LDA $be95,x ; (main@stack + 0)
28fa : 95 53 __ STA T0 + 0,x 
28fc : ca __ __ DEX
28fd : 10 f8 __ BPL $28f7 ; (main.s1001 + 13)
28ff : 60 __ __ RTS
.s2361:
2900 : 0a __ __ ASL
2901 : aa __ __ TAX
2902 : ad fd 58 LDA $58fd ; (vdc_state + 7)
2905 : 85 56 __ STA T2 + 0 
2907 : a9 12 __ LDA #$12
2909 : 8d 00 d6 STA $d600 
290c : a5 54 __ LDA T1 + 0 
290e : 38 __ __ SEC
290f : e9 01 __ SBC #$01
2911 : 85 5d __ STA T6 + 0 
2913 : bd 0f 59 LDA $590f,x ; (multab + 0)
2916 : 85 59 __ STA T4 + 0 
2918 : 18 __ __ CLC
2919 : 6d fe 58 ADC $58fe ; (vdc_state + 8)
291c : a8 __ __ TAY
291d : bd 10 59 LDA $5910,x ; (multab + 1)
2920 : 85 5a __ STA T4 + 1 
2922 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l10755:
2925 : 2c 00 d6 BIT $d600 
2928 : 10 fb __ BPL $2925 ; (main.l10755 + 0)
.s2373:
292a : 8d 01 d6 STA $d601 
292d : a9 13 __ LDA #$13
292f : 8d 00 d6 STA $d600 
.l10757:
2932 : 2c 00 d6 BIT $d600 
2935 : 10 fb __ BPL $2932 ; (main.l10757 + 0)
.s2378:
2937 : 8c 01 d6 STY $d601 
293a : a9 1f __ LDA #$1f
293c : 8d 00 d6 STA $d600 
.l10759:
293f : 2c 00 d6 BIT $d600 
2942 : 10 fb __ BPL $293f ; (main.l10759 + 0)
.s2382:
2944 : a9 20 __ LDA #$20
2946 : 8d 01 d6 STA $d601 
2949 : a9 18 __ LDA #$18
294b : 8d 00 d6 STA $d600 
.l10761:
294e : 2c 00 d6 BIT $d600 
2951 : 10 fb __ BPL $294e ; (main.l10761 + 0)
.s2388:
2953 : ad 01 d6 LDA $d601 
2956 : 29 7f __ AND #$7f
2958 : a8 __ __ TAY
2959 : a9 18 __ LDA #$18
295b : 8d 00 d6 STA $d600 
.l10763:
295e : 2c 00 d6 BIT $d600 
2961 : 10 fb __ BPL $295e ; (main.l10763 + 0)
.s2394:
2963 : 8c 01 d6 STY $d601 
2966 : a9 1e __ LDA #$1e
2968 : 8d 00 d6 STA $d600 
.l10765:
296b : 2c 00 d6 BIT $d600 
296e : 10 fb __ BPL $296b ; (main.l10765 + 0)
.s2399:
2970 : a5 5d __ LDA T6 + 0 
2972 : 8d 01 d6 STA $d601 
2975 : ad 00 59 LDA $5900 ; (vdc_state + 10)
2978 : 18 __ __ CLC
2979 : 65 59 __ ADC T4 + 0 
297b : aa __ __ TAX
297c : a9 12 __ LDA #$12
297e : 8d 00 d6 STA $d600 
2981 : ad 01 59 LDA $5901 ; (vdc_state + 11)
2984 : 65 5a __ ADC T4 + 1 
.l10767:
2986 : 2c 00 d6 BIT $d600 
2989 : 10 fb __ BPL $2986 ; (main.l10767 + 0)
.s2406:
298b : 8d 01 d6 STA $d601 
298e : a9 13 __ LDA #$13
2990 : 8d 00 d6 STA $d600 
.l10769:
2993 : 2c 00 d6 BIT $d600 
2996 : 10 fb __ BPL $2993 ; (main.l10769 + 0)
.s2411:
2998 : 8e 01 d6 STX $d601 
299b : a9 1f __ LDA #$1f
299d : 8d 00 d6 STA $d600 
.l10771:
29a0 : 2c 00 d6 BIT $d600 
29a3 : 10 fb __ BPL $29a0 ; (main.l10771 + 0)
.s2415:
29a5 : a5 56 __ LDA T2 + 0 
29a7 : 8d 01 d6 STA $d601 
29aa : a9 18 __ LDA #$18
29ac : 8d 00 d6 STA $d600 
.l10773:
29af : 2c 00 d6 BIT $d600 
29b2 : 10 fb __ BPL $29af ; (main.l10773 + 0)
.s2421:
29b4 : ad 01 d6 LDA $d601 
29b7 : 29 7f __ AND #$7f
29b9 : aa __ __ TAX
29ba : a9 18 __ LDA #$18
29bc : 8d 00 d6 STA $d600 
.l10775:
29bf : 2c 00 d6 BIT $d600 
29c2 : 10 fb __ BPL $29bf ; (main.l10775 + 0)
.s2427:
29c4 : 8e 01 d6 STX $d601 
29c7 : a9 1e __ LDA #$1e
29c9 : 8d 00 d6 STA $d600 
.l10777:
29cc : 2c 00 d6 BIT $d600 
29cf : 10 fb __ BPL $29cc ; (main.l10777 + 0)
.s2432:
29d1 : a5 5d __ LDA T6 + 0 
29d3 : 8d 01 d6 STA $d601 
29d6 : e6 53 __ INC T0 + 0 
29d8 : 4c d9 28 JMP $28d9 ; (main.l2360 + 0)
.s1251:
29db : a2 15 __ LDX #$15
.l1041:
29dd : bd 2a bf LDA $bf2a,x ; (softscroll + 15)
29e0 : 9d a9 be STA $bea9,x ; (main@stack + 20)
29e3 : ca __ __ DEX
29e4 : d0 f7 __ BNE $29dd ; (main.l1041 + 0)
.s1042:
29e6 : a5 56 __ LDA T2 + 0 
29e8 : 4a __ __ LSR
29e9 : 90 4e __ BCC $2a39 ; (main.s10631 + 0)
.s1255:
29eb : 86 61 __ STX T8 + 0 
29ed : ae 38 bf LDX $bf38 ; (viewport + 13)
29f0 : ca __ __ DEX
29f1 : 86 57 __ STX T3 + 0 
29f3 : ad 3c bf LDA $bf3c ; (viewport + 17)
29f6 : 85 59 __ STA T4 + 0 
29f8 : ad 3d bf LDA $bf3d ; (viewport + 18)
29fb : 85 5a __ STA T4 + 1 
29fd : ad 3e bf LDA $bf3e ; (viewport + 19)
2a00 : 85 5b __ STA T5 + 0 
2a02 : ad 3f bf LDA $bf3f ; (viewport + 20)
.l1259:
2a05 : 85 5c __ STA T5 + 1 
2a07 : a5 61 __ LDA T8 + 0 
2a09 : cd 39 bf CMP $bf39 ; (viewport + 14)
2a0c : b0 03 __ BCS $2a11 ; (main.s1258 + 0)
2a0e : 4c 20 31 JMP $3120 ; (main.s1260 + 0)
.s1258:
2a11 : a9 01 __ LDA #$01
2a13 : 85 11 __ STA P4 
2a15 : ad 39 bf LDA $bf39 ; (viewport + 14)
2a18 : 85 12 __ STA P5 
2a1a : ad b1 be LDA $beb1 ; (vp_fill + 7)
2a1d : 18 __ __ CLC
2a1e : 69 ff __ ADC #$ff
2a20 : 8d b1 be STA $beb1 ; (vp_fill + 7)
2a23 : b0 03 __ BCS $2a28 ; (main.s1679 + 0)
.s1678:
2a25 : ce b2 be DEC $beb2 ; (vp_fill + 8)
.s1679:
2a28 : ad 32 bf LDA $bf32 ; (viewport + 7)
2a2b : 18 __ __ CLC
2a2c : 69 ff __ ADC #$ff
2a2e : 8d 32 bf STA $bf32 ; (viewport + 7)
2a31 : b0 03 __ BCS $2a36 ; (main.s1681 + 0)
.s1680:
2a33 : ce 33 bf DEC $bf33 ; (viewport + 8)
.s1681:
2a36 : 20 b5 4f JSR $4fb5 ; (vdcwin_init@proxy + 0)
.s10631:
2a39 : a5 56 __ LDA T2 + 0 
2a3b : 29 02 __ AND #$02
2a3d : f0 64 __ BEQ $2aa3 ; (main.s10691 + 0)
.s1616:
2a3f : ae 38 bf LDX $bf38 ; (viewport + 13)
2a42 : ca __ __ DEX
2a43 : 86 57 __ STX T3 + 0 
2a45 : a9 00 __ LDA #$00
2a47 : 85 61 __ STA T8 + 0 
2a49 : ad 3c bf LDA $bf3c ; (viewport + 17)
2a4c : 85 59 __ STA T4 + 0 
2a4e : ad 3d bf LDA $bf3d ; (viewport + 18)
2a51 : 85 5a __ STA T4 + 1 
2a53 : ad 3e bf LDA $bf3e ; (viewport + 19)
2a56 : 85 5b __ STA T5 + 0 
2a58 : ad 3f bf LDA $bf3f ; (viewport + 20)
.l1620:
2a5b : 85 5c __ STA T5 + 1 
2a5d : a5 61 __ LDA T8 + 0 
2a5f : cd 39 bf CMP $bf39 ; (viewport + 14)
2a62 : b0 03 __ BCS $2a67 ; (main.s1619 + 0)
2a64 : 4c d6 2e JMP $2ed6 ; (main.s1621 + 0)
.s1619:
2a67 : a9 01 __ LDA #$01
2a69 : 85 11 __ STA P4 
2a6b : ad 39 bf LDA $bf39 ; (viewport + 14)
2a6e : 85 12 __ STA P5 
2a70 : ad b1 be LDA $beb1 ; (vp_fill + 7)
2a73 : 18 __ __ CLC
2a74 : 6d 38 bf ADC $bf38 ; (viewport + 13)
2a77 : 8d b1 be STA $beb1 ; (vp_fill + 7)
2a7a : 90 03 __ BCC $2a7f ; (main.s1683 + 0)
.s1682:
2a7c : ee b2 be INC $beb2 ; (vp_fill + 8)
.s1683:
2a7f : ee 32 bf INC $bf32 ; (viewport + 7)
2a82 : d0 03 __ BNE $2a87 ; (main.s1685 + 0)
.s1684:
2a84 : ee 33 bf INC $bf33 ; (viewport + 8)
.s1685:
2a87 : a9 b5 __ LDA #$b5
2a89 : 85 0d __ STA P0 
2a8b : a9 be __ LDA #$be
2a8d : 85 0e __ STA P1 
2a8f : ad 36 bf LDA $bf36 ; (viewport + 11)
2a92 : 18 __ __ CLC
2a93 : 6d 38 bf ADC $bf38 ; (viewport + 13)
2a96 : 38 __ __ SEC
2a97 : e9 01 __ SBC #$01
2a99 : 85 0f __ STA P2 
2a9b : ad 37 bf LDA $bf37 ; (viewport + 12)
2a9e : 85 10 __ STA P3 
2aa0 : 20 c7 4f JSR $4fc7 ; (vdcwin_init.s0 + 0)
.s10691:
2aa3 : a5 56 __ LDA T2 + 0 
2aa5 : 29 08 __ AND #$08
2aa7 : f0 75 __ BEQ $2b1e ; (main.s10721 + 0)
.s1977:
2aa9 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
2aac : 85 59 __ STA T4 + 0 
2aae : 85 1b __ STA ACCU + 0 
2ab0 : ad fa 58 LDA $58fa ; (vdc_state + 4)
2ab3 : 85 5a __ STA T4 + 1 
2ab5 : 85 1c __ STA ACCU + 1 
2ab7 : ad 39 bf LDA $bf39 ; (viewport + 14)
2aba : 20 b7 55 JSR $55b7 ; (mul16by8 + 0)
2abd : ad 3c bf LDA $bf3c ; (viewport + 17)
2ac0 : 18 __ __ CLC
2ac1 : 65 05 __ ADC WORK + 2 
2ac3 : 85 5b __ STA T5 + 0 
2ac5 : ad 3d bf LDA $bf3d ; (viewport + 18)
2ac8 : 65 06 __ ADC WORK + 3 
2aca : 85 5c __ STA T5 + 1 
2acc : ad 3e bf LDA $bf3e ; (viewport + 19)
2acf : 18 __ __ CLC
2ad0 : 65 05 __ ADC WORK + 2 
2ad2 : aa __ __ TAX
2ad3 : ad 3f bf LDA $bf3f ; (viewport + 20)
2ad6 : 65 06 __ ADC WORK + 3 
2ad8 : a8 __ __ TAY
2ad9 : a9 00 __ LDA #$00
2adb : 85 61 __ STA T8 + 0 
2add : ad 38 bf LDA $bf38 ; (viewport + 13)
2ae0 : 85 62 __ STA T9 + 0 
.l1981:
2ae2 : ad 39 bf LDA $bf39 ; (viewport + 14)
2ae5 : 38 __ __ SEC
2ae6 : e9 01 __ SBC #$01
2ae8 : b0 03 __ BCS $2aed ; (main.s1105 + 0)
2aea : 4c b9 2d JMP $2db9 ; (main.s1982 + 0)
.s1105:
2aed : c5 61 __ CMP T8 + 0 
2aef : 90 05 __ BCC $2af6 ; (main.s1980 + 0)
.s1686:
2af1 : f0 03 __ BEQ $2af6 ; (main.s1980 + 0)
2af3 : 4c b9 2d JMP $2db9 ; (main.s1982 + 0)
.s1980:
2af6 : a9 01 __ LDA #$01
2af8 : 85 12 __ STA P5 
2afa : ad b3 be LDA $beb3 ; (vp_fill + 9)
2afd : 18 __ __ CLC
2afe : 69 ff __ ADC #$ff
2b00 : 8d b3 be STA $beb3 ; (vp_fill + 9)
2b03 : b0 03 __ BCS $2b08 ; (main.s1688 + 0)
.s1687:
2b05 : ce b4 be DEC $beb4 ; (vp_fill + 10)
.s1688:
2b08 : ad 34 bf LDA $bf34 ; (viewport + 9)
2b0b : 18 __ __ CLC
2b0c : 69 ff __ ADC #$ff
2b0e : 8d 34 bf STA $bf34 ; (viewport + 9)
2b11 : b0 03 __ BCS $2b16 ; (main.s1690 + 0)
.s1689:
2b13 : ce 35 bf DEC $bf35 ; (viewport + 10)
.s1690:
2b16 : ad 38 bf LDA $bf38 ; (viewport + 13)
2b19 : 85 11 __ STA P4 
2b1b : 20 b5 4f JSR $4fb5 ; (vdcwin_init@proxy + 0)
.s10721:
2b1e : a5 56 __ LDA T2 + 0 
2b20 : 29 04 __ AND #$04
2b22 : f0 73 __ BEQ $2b97 ; (main.s2162 + 0)
.s2160:
2b24 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
2b27 : 85 57 __ STA T3 + 0 
2b29 : ad fa 58 LDA $58fa ; (vdc_state + 4)
2b2c : 85 58 __ STA T3 + 1 
2b2e : ad 38 bf LDA $bf38 ; (viewport + 13)
2b31 : 85 61 __ STA T8 + 0 
2b33 : ad 3c bf LDA $bf3c ; (viewport + 17)
2b36 : 85 59 __ STA T4 + 0 
2b38 : ad 3d bf LDA $bf3d ; (viewport + 18)
2b3b : 85 5a __ STA T4 + 1 
2b3d : ad 3f bf LDA $bf3f ; (viewport + 20)
2b40 : a2 00 __ LDX #$00
2b42 : ac 3e bf LDY $bf3e ; (viewport + 19)
.l2164:
2b45 : 85 5c __ STA T5 + 1 
2b47 : ad 39 bf LDA $bf39 ; (viewport + 14)
2b4a : 38 __ __ SEC
2b4b : e9 01 __ SBC #$01
2b4d : b0 03 __ BCS $2b52 ; (main.s1075 + 0)
2b4f : 4c 9b 2c JMP $2c9b ; (main.s2165 + 0)
.s1075:
2b52 : 85 5f __ STA T7 + 0 
2b54 : e4 5f __ CPX T7 + 0 
2b56 : b0 03 __ BCS $2b5b ; (main.s2163 + 0)
2b58 : 4c 9b 2c JMP $2c9b ; (main.s2165 + 0)
.s2163:
2b5b : a9 01 __ LDA #$01
2b5d : 85 12 __ STA P5 
2b5f : ad b3 be LDA $beb3 ; (vp_fill + 9)
2b62 : 18 __ __ CLC
2b63 : 6d 39 bf ADC $bf39 ; (viewport + 14)
2b66 : 8d b3 be STA $beb3 ; (vp_fill + 9)
2b69 : 90 03 __ BCC $2b6e ; (main.s1692 + 0)
.s1691:
2b6b : ee b4 be INC $beb4 ; (vp_fill + 10)
.s1692:
2b6e : ee 34 bf INC $bf34 ; (viewport + 9)
2b71 : d0 03 __ BNE $2b76 ; (main.s1694 + 0)
.s1693:
2b73 : ee 35 bf INC $bf35 ; (viewport + 10)
.s1694:
2b76 : a9 b5 __ LDA #$b5
2b78 : 85 0d __ STA P0 
2b7a : a9 be __ LDA #$be
2b7c : 85 0e __ STA P1 
2b7e : ad 36 bf LDA $bf36 ; (viewport + 11)
2b81 : 85 0f __ STA P2 
2b83 : ad 37 bf LDA $bf37 ; (viewport + 12)
2b86 : 18 __ __ CLC
2b87 : 6d 39 bf ADC $bf39 ; (viewport + 14)
2b8a : 38 __ __ SEC
2b8b : e9 01 __ SBC #$01
2b8d : 85 10 __ STA P3 
2b8f : ad 38 bf LDA $bf38 ; (viewport + 13)
2b92 : 85 11 __ STA P4 
2b94 : 20 c7 4f JSR $4fc7 ; (vdcwin_init.s0 + 0)
.s2162:
2b97 : ad b3 be LDA $beb3 ; (vp_fill + 9)
2b9a : 85 1b __ STA ACCU + 0 
2b9c : ad b4 be LDA $beb4 ; (vp_fill + 10)
2b9f : 85 1c __ STA ACCU + 1 
2ba1 : ad ad be LDA $bead ; (vp_fill + 3)
2ba4 : 85 03 __ STA WORK + 0 
2ba6 : ad ae be LDA $beae ; (vp_fill + 4)
2ba9 : 85 04 __ STA WORK + 1 
2bab : 20 d7 55 JSR $55d7 ; (mul16 + 0)
2bae : ad ab be LDA $beab ; (vp_fill + 1)
2bb1 : 18 __ __ CLC
2bb2 : 65 05 __ ADC WORK + 2 
2bb4 : a8 __ __ TAY
2bb5 : ad ac be LDA $beac ; (vp_fill + 2)
2bb8 : 65 06 __ ADC WORK + 3 
2bba : aa __ __ TAX
2bbb : 98 __ __ TYA
2bbc : 18 __ __ CLC
2bbd : 6d b1 be ADC $beb1 ; (vp_fill + 7)
2bc0 : 85 57 __ STA T3 + 0 
2bc2 : 8a __ __ TXA
2bc3 : 6d b2 be ADC $beb2 ; (vp_fill + 8)
2bc6 : 85 58 __ STA T3 + 1 
2bc8 : a9 00 __ LDA #$00
2bca : 85 56 __ STA T2 + 0 
2bcc : ac bc be LDY $bebc ; (vp_fill + 18)
2bcf : ae bb be LDX $bebb ; (vp_fill + 17)
2bd2 : 4c fc 2b JMP $2bfc ; (main.l2344 + 0)
.s2345:
2bd5 : 86 0d __ STX P0 
2bd7 : 84 0e __ STY P1 
2bd9 : 20 d0 14 JSR $14d0 ; (bnk_cpytovdc@proxy + 0)
2bdc : ad f9 58 LDA $58f9 ; (vdc_state + 3)
2bdf : 18 __ __ CLC
2be0 : 65 0d __ ADC P0 
2be2 : aa __ __ TAX
2be3 : ad fa 58 LDA $58fa ; (vdc_state + 4)
2be6 : 65 0e __ ADC P1 
2be8 : a8 __ __ TAY
2be9 : 18 __ __ CLC
2bea : a5 57 __ LDA T3 + 0 
2bec : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
2bef : 85 57 __ STA T3 + 0 
2bf1 : a5 58 __ LDA T3 + 1 
2bf3 : 6d fa 58 ADC $58fa ; (vdc_state + 4)
2bf6 : 85 58 __ STA T3 + 1 
2bf8 : e6 56 __ INC T2 + 0 
2bfa : a5 56 __ LDA T2 + 0 
.l2344:
2bfc : cd b8 be CMP $beb8 ; (vp_fill + 14)
2bff : 90 d4 __ BCC $2bd5 ; (main.s2345 + 0)
.s2347:
2c01 : ad ad be LDA $bead ; (vp_fill + 3)
2c04 : 85 03 __ STA WORK + 0 
2c06 : ad ae be LDA $beae ; (vp_fill + 4)
2c09 : 85 04 __ STA WORK + 1 
2c0b : ad b3 be LDA $beb3 ; (vp_fill + 9)
2c0e : 85 1b __ STA ACCU + 0 
2c10 : ad b4 be LDA $beb4 ; (vp_fill + 10)
2c13 : 85 1c __ STA ACCU + 1 
2c15 : 20 d7 55 JSR $55d7 ; (mul16 + 0)
2c18 : ad ab be LDA $beab ; (vp_fill + 1)
2c1b : 18 __ __ CLC
2c1c : 65 05 __ ADC WORK + 2 
2c1e : a8 __ __ TAY
2c1f : ad ac be LDA $beac ; (vp_fill + 2)
2c22 : 65 06 __ ADC WORK + 3 
2c24 : aa __ __ TAX
2c25 : 98 __ __ TYA
2c26 : 18 __ __ CLC
2c27 : 6d b1 be ADC $beb1 ; (vp_fill + 7)
2c2a : 85 59 __ STA T4 + 0 
2c2c : 8a __ __ TXA
2c2d : 6d b2 be ADC $beb2 ; (vp_fill + 8)
2c30 : 85 5a __ STA T4 + 1 
2c32 : ad af be LDA $beaf ; (vp_fill + 5)
2c35 : 85 1b __ STA ACCU + 0 
2c37 : ad b0 be LDA $beb0 ; (vp_fill + 6)
2c3a : 85 1c __ STA ACCU + 1 
2c3c : ad ad be LDA $bead ; (vp_fill + 3)
2c3f : 85 03 __ STA WORK + 0 
2c41 : ad ae be LDA $beae ; (vp_fill + 4)
2c44 : 85 04 __ STA WORK + 1 
2c46 : 20 d7 55 JSR $55d7 ; (mul16 + 0)
2c49 : 18 __ __ CLC
2c4a : a5 59 __ LDA T4 + 0 
2c4c : 65 05 __ ADC WORK + 2 
2c4e : aa __ __ TAX
2c4f : a5 5a __ LDA T4 + 1 
2c51 : 65 06 __ ADC WORK + 3 
2c53 : a8 __ __ TAY
2c54 : 8a __ __ TXA
2c55 : 18 __ __ CLC
2c56 : 69 30 __ ADC #$30
2c58 : 85 57 __ STA T3 + 0 
2c5a : 90 01 __ BCC $2c5d ; (main.s1696 + 0)
.s1695:
2c5c : c8 __ __ INY
.s1696:
2c5d : 84 58 __ STY T3 + 1 
2c5f : a9 00 __ LDA #$00
2c61 : 85 56 __ STA T2 + 0 
2c63 : ac be be LDY $bebe ; (vp_fill + 20)
2c66 : ae bd be LDX $bebd ; (vp_fill + 19)
2c69 : 4c 93 2c JMP $2c93 ; (main.l2348 + 0)
.s2349:
2c6c : 86 0d __ STX P0 
2c6e : 84 0e __ STY P1 
2c70 : 20 d0 14 JSR $14d0 ; (bnk_cpytovdc@proxy + 0)
2c73 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
2c76 : 18 __ __ CLC
2c77 : 65 0d __ ADC P0 
2c79 : aa __ __ TAX
2c7a : ad fa 58 LDA $58fa ; (vdc_state + 4)
2c7d : 65 0e __ ADC P1 
2c7f : a8 __ __ TAY
2c80 : 18 __ __ CLC
2c81 : a5 57 __ LDA T3 + 0 
2c83 : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
2c86 : 85 57 __ STA T3 + 0 
2c88 : a5 58 __ LDA T3 + 1 
2c8a : 6d fa 58 ADC $58fa ; (vdc_state + 4)
2c8d : 85 58 __ STA T3 + 1 
2c8f : e6 56 __ INC T2 + 0 
2c91 : a5 56 __ LDA T2 + 0 
.l2348:
2c93 : cd b8 be CMP $beb8 ; (vp_fill + 14)
2c96 : 90 d4 __ BCC $2c6c ; (main.s2349 + 0)
2c98 : 4c 9f 28 JMP $289f ; (main.s1253 + 0)
.s2165:
2c9b : a9 12 __ LDA #$12
2c9d : 8d 00 d6 STA $d600 
2ca0 : 98 __ __ TYA
2ca1 : 65 57 __ ADC T3 + 0 
2ca3 : 85 5d __ STA T6 + 0 
2ca5 : a5 5c __ LDA T5 + 1 
2ca7 : 65 58 __ ADC T3 + 1 
2ca9 : 85 5e __ STA T6 + 1 
2cab : 18 __ __ CLC
2cac : a5 59 __ LDA T4 + 0 
2cae : 65 57 __ ADC T3 + 0 
2cb0 : 85 64 __ STA T11 + 0 
2cb2 : a5 5a __ LDA T4 + 1 
2cb4 : 65 58 __ ADC T3 + 1 
2cb6 : 85 65 __ STA T11 + 1 
.l10723:
2cb8 : 2c 00 d6 BIT $d600 
2cbb : 10 fb __ BPL $2cb8 ; (main.l10723 + 0)
.s2221:
2cbd : a5 5a __ LDA T4 + 1 
2cbf : 8d 01 d6 STA $d601 
2cc2 : a9 13 __ LDA #$13
2cc4 : 8d 00 d6 STA $d600 
.l10725:
2cc7 : 2c 00 d6 BIT $d600 
2cca : 10 fb __ BPL $2cc7 ; (main.l10725 + 0)
.s2226:
2ccc : a5 59 __ LDA T4 + 0 
2cce : 8d 01 d6 STA $d601 
2cd1 : a9 1f __ LDA #$1f
2cd3 : 8d 00 d6 STA $d600 
2cd6 : a9 18 __ LDA #$18
2cd8 : 8d 00 d6 STA $d600 
.l10727:
2cdb : 2c 00 d6 BIT $d600 
2cde : 10 fb __ BPL $2cdb ; (main.l10727 + 0)
.s2233:
2ce0 : ad 01 d6 LDA $d601 
2ce3 : 09 80 __ ORA #$80
2ce5 : 85 66 __ STA T12 + 0 
2ce7 : a9 18 __ LDA #$18
2ce9 : 8d 00 d6 STA $d600 
.l10729:
2cec : 2c 00 d6 BIT $d600 
2cef : 10 fb __ BPL $2cec ; (main.l10729 + 0)
.s2239:
2cf1 : a5 66 __ LDA T12 + 0 
2cf3 : 8d 01 d6 STA $d601 
2cf6 : a9 20 __ LDA #$20
2cf8 : 8d 00 d6 STA $d600 
.l10731:
2cfb : 2c 00 d6 BIT $d600 
2cfe : 10 fb __ BPL $2cfb ; (main.l10731 + 0)
.s2244:
2d00 : a5 65 __ LDA T11 + 1 
2d02 : 8d 01 d6 STA $d601 
2d05 : a9 21 __ LDA #$21
2d07 : 8d 00 d6 STA $d600 
.l10733:
2d0a : 2c 00 d6 BIT $d600 
2d0d : 10 fb __ BPL $2d0a ; (main.l10733 + 0)
.s2249:
2d0f : a5 64 __ LDA T11 + 0 
2d11 : 8d 01 d6 STA $d601 
2d14 : a9 1f __ LDA #$1f
2d16 : 8d 00 d6 STA $d600 
2d19 : a9 1e __ LDA #$1e
2d1b : 8d 00 d6 STA $d600 
.l10735:
2d1e : 2c 00 d6 BIT $d600 
2d21 : 10 fb __ BPL $2d1e ; (main.l10735 + 0)
.s2255:
2d23 : a5 61 __ LDA T8 + 0 
2d25 : 8d 01 d6 STA $d601 
2d28 : a9 12 __ LDA #$12
2d2a : 8d 00 d6 STA $d600 
.l10737:
2d2d : 2c 00 d6 BIT $d600 
2d30 : 10 fb __ BPL $2d2d ; (main.l10737 + 0)
.s2308:
2d32 : a5 5c __ LDA T5 + 1 
2d34 : 8d 01 d6 STA $d601 
2d37 : a9 13 __ LDA #$13
2d39 : 8d 00 d6 STA $d600 
.l10739:
2d3c : 2c 00 d6 BIT $d600 
2d3f : 10 fb __ BPL $2d3c ; (main.l10739 + 0)
.s2313:
2d41 : 8c 01 d6 STY $d601 
2d44 : a9 1f __ LDA #$1f
2d46 : 8d 00 d6 STA $d600 
2d49 : a9 18 __ LDA #$18
2d4b : 8d 00 d6 STA $d600 
.l10741:
2d4e : 2c 00 d6 BIT $d600 
2d51 : 10 fb __ BPL $2d4e ; (main.l10741 + 0)
.s2320:
2d53 : ad 01 d6 LDA $d601 
2d56 : 09 80 __ ORA #$80
2d58 : 85 64 __ STA T11 + 0 
2d5a : a9 18 __ LDA #$18
2d5c : 8d 00 d6 STA $d600 
.l10743:
2d5f : 2c 00 d6 BIT $d600 
2d62 : 10 fb __ BPL $2d5f ; (main.l10743 + 0)
.s2326:
2d64 : a5 64 __ LDA T11 + 0 
2d66 : 8d 01 d6 STA $d601 
2d69 : a9 20 __ LDA #$20
2d6b : 8d 00 d6 STA $d600 
.l10745:
2d6e : 2c 00 d6 BIT $d600 
2d71 : 10 fb __ BPL $2d6e ; (main.l10745 + 0)
.s2331:
2d73 : a5 5e __ LDA T6 + 1 
2d75 : 8d 01 d6 STA $d601 
2d78 : a9 21 __ LDA #$21
2d7a : 8d 00 d6 STA $d600 
.l10747:
2d7d : 2c 00 d6 BIT $d600 
2d80 : 10 fb __ BPL $2d7d ; (main.l10747 + 0)
.s2336:
2d82 : a5 5d __ LDA T6 + 0 
2d84 : 8d 01 d6 STA $d601 
2d87 : a9 1f __ LDA #$1f
2d89 : 8d 00 d6 STA $d600 
2d8c : a9 1e __ LDA #$1e
2d8e : 8d 00 d6 STA $d600 
.l10749:
2d91 : 2c 00 d6 BIT $d600 
2d94 : 10 fb __ BPL $2d91 ; (main.l10749 + 0)
.s2342:
2d96 : a5 61 __ LDA T8 + 0 
2d98 : 8d 01 d6 STA $d601 
2d9b : ad f9 58 LDA $58f9 ; (vdc_state + 3)
2d9e : 18 __ __ CLC
2d9f : 65 59 __ ADC T4 + 0 
2da1 : 85 59 __ STA T4 + 0 
2da3 : ad fa 58 LDA $58fa ; (vdc_state + 4)
2da6 : 65 5a __ ADC T4 + 1 
2da8 : 85 5a __ STA T4 + 1 
2daa : 98 __ __ TYA
2dab : 18 __ __ CLC
2dac : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
2daf : a8 __ __ TAY
2db0 : a5 5c __ LDA T5 + 1 
2db2 : 6d fa 58 ADC $58fa ; (vdc_state + 4)
2db5 : e8 __ __ INX
2db6 : 4c 45 2b JMP $2b45 ; (main.l2164 + 0)
.s1982:
2db9 : a9 12 __ LDA #$12
2dbb : 8d 00 d6 STA $d600 
2dbe : 8a __ __ TXA
2dbf : 38 __ __ SEC
2dc0 : ed f9 58 SBC $58f9 ; (vdc_state + 3)
2dc3 : aa __ __ TAX
2dc4 : 98 __ __ TYA
2dc5 : ed fa 58 SBC $58fa ; (vdc_state + 4)
2dc8 : a8 __ __ TAY
2dc9 : 8a __ __ TXA
2dca : 38 __ __ SEC
2dcb : e5 59 __ SBC T4 + 0 
2dcd : 85 5f __ STA T7 + 0 
2dcf : 98 __ __ TYA
2dd0 : e5 5a __ SBC T4 + 1 
2dd2 : 85 60 __ STA T7 + 1 
2dd4 : 38 __ __ SEC
2dd5 : a5 5b __ LDA T5 + 0 
2dd7 : ed f9 58 SBC $58f9 ; (vdc_state + 3)
2dda : 85 5b __ STA T5 + 0 
2ddc : a5 5c __ LDA T5 + 1 
2dde : ed fa 58 SBC $58fa ; (vdc_state + 4)
2de1 : 85 5c __ STA T5 + 1 
2de3 : 38 __ __ SEC
2de4 : a5 5b __ LDA T5 + 0 
2de6 : e5 59 __ SBC T4 + 0 
2de8 : 85 5d __ STA T6 + 0 
2dea : a5 5c __ LDA T5 + 1 
2dec : e5 5a __ SBC T4 + 1 
2dee : 85 5e __ STA T6 + 1 
.l10693:
2df0 : 2c 00 d6 BIT $d600 
2df3 : 10 fb __ BPL $2df0 ; (main.l10693 + 0)
.s2038:
2df5 : a5 5c __ LDA T5 + 1 
2df7 : 8d 01 d6 STA $d601 
2dfa : a9 13 __ LDA #$13
2dfc : 8d 00 d6 STA $d600 
.l10695:
2dff : 2c 00 d6 BIT $d600 
2e02 : 10 fb __ BPL $2dff ; (main.l10695 + 0)
.s2043:
2e04 : a5 5b __ LDA T5 + 0 
2e06 : 8d 01 d6 STA $d601 
2e09 : a9 1f __ LDA #$1f
2e0b : 8d 00 d6 STA $d600 
2e0e : a9 18 __ LDA #$18
2e10 : 8d 00 d6 STA $d600 
.l10697:
2e13 : 2c 00 d6 BIT $d600 
2e16 : 10 fb __ BPL $2e13 ; (main.l10697 + 0)
.s2050:
2e18 : ad 01 d6 LDA $d601 
2e1b : 09 80 __ ORA #$80
2e1d : 85 66 __ STA T12 + 0 
2e1f : a9 18 __ LDA #$18
2e21 : 8d 00 d6 STA $d600 
.l10699:
2e24 : 2c 00 d6 BIT $d600 
2e27 : 10 fb __ BPL $2e24 ; (main.l10699 + 0)
.s2056:
2e29 : a5 66 __ LDA T12 + 0 
2e2b : 8d 01 d6 STA $d601 
2e2e : a9 20 __ LDA #$20
2e30 : 8d 00 d6 STA $d600 
.l10701:
2e33 : 2c 00 d6 BIT $d600 
2e36 : 10 fb __ BPL $2e33 ; (main.l10701 + 0)
.s2061:
2e38 : a5 5e __ LDA T6 + 1 
2e3a : 8d 01 d6 STA $d601 
2e3d : a9 21 __ LDA #$21
2e3f : 8d 00 d6 STA $d600 
.l10703:
2e42 : 2c 00 d6 BIT $d600 
2e45 : 10 fb __ BPL $2e42 ; (main.l10703 + 0)
.s2066:
2e47 : a5 5d __ LDA T6 + 0 
2e49 : 8d 01 d6 STA $d601 
2e4c : a9 1f __ LDA #$1f
2e4e : 8d 00 d6 STA $d600 
2e51 : a9 1e __ LDA #$1e
2e53 : 8d 00 d6 STA $d600 
.l10705:
2e56 : 2c 00 d6 BIT $d600 
2e59 : 10 fb __ BPL $2e56 ; (main.l10705 + 0)
.s2072:
2e5b : a5 62 __ LDA T9 + 0 
2e5d : 8d 01 d6 STA $d601 
2e60 : a9 12 __ LDA #$12
2e62 : 8d 00 d6 STA $d600 
.l10707:
2e65 : 2c 00 d6 BIT $d600 
2e68 : 10 fb __ BPL $2e65 ; (main.l10707 + 0)
.s2125:
2e6a : 8c 01 d6 STY $d601 
2e6d : a9 13 __ LDA #$13
2e6f : 8d 00 d6 STA $d600 
.l10709:
2e72 : 2c 00 d6 BIT $d600 
2e75 : 10 fb __ BPL $2e72 ; (main.l10709 + 0)
.s2130:
2e77 : 8e 01 d6 STX $d601 
2e7a : a9 1f __ LDA #$1f
2e7c : 8d 00 d6 STA $d600 
2e7f : a9 18 __ LDA #$18
2e81 : 8d 00 d6 STA $d600 
.l10711:
2e84 : 2c 00 d6 BIT $d600 
2e87 : 10 fb __ BPL $2e84 ; (main.l10711 + 0)
.s2137:
2e89 : ad 01 d6 LDA $d601 
2e8c : 09 80 __ ORA #$80
2e8e : 85 5d __ STA T6 + 0 
2e90 : a9 18 __ LDA #$18
2e92 : 8d 00 d6 STA $d600 
.l10713:
2e95 : 2c 00 d6 BIT $d600 
2e98 : 10 fb __ BPL $2e95 ; (main.l10713 + 0)
.s2143:
2e9a : a5 5d __ LDA T6 + 0 
2e9c : 8d 01 d6 STA $d601 
2e9f : a9 20 __ LDA #$20
2ea1 : 8d 00 d6 STA $d600 
.l10715:
2ea4 : 2c 00 d6 BIT $d600 
2ea7 : 10 fb __ BPL $2ea4 ; (main.l10715 + 0)
.s2148:
2ea9 : a5 60 __ LDA T7 + 1 
2eab : 8d 01 d6 STA $d601 
2eae : a9 21 __ LDA #$21
2eb0 : 8d 00 d6 STA $d600 
.l10717:
2eb3 : 2c 00 d6 BIT $d600 
2eb6 : 10 fb __ BPL $2eb3 ; (main.l10717 + 0)
.s2153:
2eb8 : a5 5f __ LDA T7 + 0 
2eba : 8d 01 d6 STA $d601 
2ebd : a9 1f __ LDA #$1f
2ebf : 8d 00 d6 STA $d600 
2ec2 : a9 1e __ LDA #$1e
2ec4 : 8d 00 d6 STA $d600 
.l10719:
2ec7 : 2c 00 d6 BIT $d600 
2eca : 10 fb __ BPL $2ec7 ; (main.l10719 + 0)
.s2159:
2ecc : a5 62 __ LDA T9 + 0 
2ece : 8d 01 d6 STA $d601 
2ed1 : e6 61 __ INC T8 + 0 
2ed3 : 4c e2 2a JMP $2ae2 ; (main.l1981 + 0)
.s1621:
2ed6 : a5 5b __ LDA T5 + 0 
2ed8 : 69 01 __ ADC #$01
2eda : 85 5d __ STA T6 + 0 
2edc : a5 5c __ LDA T5 + 1 
2ede : 69 00 __ ADC #$00
2ee0 : 85 5e __ STA T6 + 1 
2ee2 : 18 __ __ CLC
2ee3 : a5 59 __ LDA T4 + 0 
2ee5 : 69 01 __ ADC #$01
2ee7 : aa __ __ TAX
2ee8 : a5 5a __ LDA T4 + 1 
2eea : 69 00 __ ADC #$00
2eec : a8 __ __ TAY
2eed : ad f7 58 LDA $58f7 ; (vdc_state + 1)
2ef0 : d0 11 __ BNE $2f03 ; (main.s1626 + 0)
.s1628:
2ef2 : a9 03 __ LDA #$03
2ef4 : cd 03 59 CMP $5903 ; (vdc_state + 13)
2ef7 : d0 05 __ BNE $2efe ; (main.s1164 + 0)
.s1163:
2ef9 : a9 ff __ LDA #$ff
2efb : cd 02 59 CMP $5902 ; (vdc_state + 12)
.s1164:
2efe : b0 03 __ BCS $2f03 ; (main.s1626 + 0)
2f00 : 4c f5 30 JMP $30f5 ; (main.s1625 + 0)
.s1626:
2f03 : ad 02 59 LDA $5902 ; (vdc_state + 12)
2f06 : 85 64 __ STA T11 + 0 
2f08 : ad 03 59 LDA $5903 ; (vdc_state + 13)
2f0b : 85 44 __ STA T14 + 0 
2f0d : a9 12 __ LDA #$12
2f0f : 8d 00 d6 STA $d600 
.l10634:
2f12 : 2c 00 d6 BIT $d600 
2f15 : 10 fb __ BPL $2f12 ; (main.l10634 + 0)
.s1681:
2f17 : a5 44 __ LDA T14 + 0 
2f19 : 8d 01 d6 STA $d601 
2f1c : a9 13 __ LDA #$13
2f1e : 8d 00 d6 STA $d600 
.l10636:
2f21 : 2c 00 d6 BIT $d600 
2f24 : 10 fb __ BPL $2f21 ; (main.l10636 + 0)
.s1686:
2f26 : a5 64 __ LDA T11 + 0 
2f28 : 8d 01 d6 STA $d601 
2f2b : a9 1f __ LDA #$1f
2f2d : 8d 00 d6 STA $d600 
2f30 : a9 18 __ LDA #$18
2f32 : 8d 00 d6 STA $d600 
.l10638:
2f35 : 2c 00 d6 BIT $d600 
2f38 : 10 fb __ BPL $2f35 ; (main.l10638 + 0)
.s1693:
2f3a : ad 01 d6 LDA $d601 
2f3d : 09 80 __ ORA #$80
2f3f : 85 46 __ STA T15 + 0 
2f41 : a9 18 __ LDA #$18
2f43 : 8d 00 d6 STA $d600 
.l10640:
2f46 : 2c 00 d6 BIT $d600 
2f49 : 10 fb __ BPL $2f46 ; (main.l10640 + 0)
.s1699:
2f4b : a5 46 __ LDA T15 + 0 
2f4d : 8d 01 d6 STA $d601 
2f50 : a9 20 __ LDA #$20
2f52 : 8d 00 d6 STA $d600 
.l10642:
2f55 : 2c 00 d6 BIT $d600 
2f58 : 10 fb __ BPL $2f55 ; (main.l10642 + 0)
.s1704:
2f5a : 8c 01 d6 STY $d601 
2f5d : a9 21 __ LDA #$21
2f5f : 8d 00 d6 STA $d600 
.l10644:
2f62 : 2c 00 d6 BIT $d600 
2f65 : 10 fb __ BPL $2f62 ; (main.l10644 + 0)
.s1709:
2f67 : 8e 01 d6 STX $d601 
2f6a : a9 1f __ LDA #$1f
2f6c : 8d 00 d6 STA $d600 
2f6f : a9 1e __ LDA #$1e
2f71 : 8d 00 d6 STA $d600 
.l10646:
2f74 : 2c 00 d6 BIT $d600 
2f77 : 10 fb __ BPL $2f74 ; (main.l10646 + 0)
.s1715:
2f79 : a5 57 __ LDA T3 + 0 
2f7b : 8d 01 d6 STA $d601 
2f7e : a9 12 __ LDA #$12
2f80 : 8d 00 d6 STA $d600 
.l10648:
2f83 : 2c 00 d6 BIT $d600 
2f86 : 10 fb __ BPL $2f83 ; (main.l10648 + 0)
.s1768:
2f88 : a5 5a __ LDA T4 + 1 
2f8a : 8d 01 d6 STA $d601 
2f8d : a9 13 __ LDA #$13
2f8f : 8d 00 d6 STA $d600 
.l10650:
2f92 : 2c 00 d6 BIT $d600 
2f95 : 10 fb __ BPL $2f92 ; (main.l10650 + 0)
.s1773:
2f97 : a5 59 __ LDA T4 + 0 
2f99 : 8d 01 d6 STA $d601 
2f9c : a9 1f __ LDA #$1f
2f9e : 8d 00 d6 STA $d600 
2fa1 : a9 18 __ LDA #$18
2fa3 : 8d 00 d6 STA $d600 
.l10652:
2fa6 : 2c 00 d6 BIT $d600 
2fa9 : 10 fb __ BPL $2fa6 ; (main.l10652 + 0)
.s1780:
2fab : ad 01 d6 LDA $d601 
2fae : 09 80 __ ORA #$80
2fb0 : aa __ __ TAX
2fb1 : a9 18 __ LDA #$18
2fb3 : 8d 00 d6 STA $d600 
.l10654:
2fb6 : 2c 00 d6 BIT $d600 
2fb9 : 10 fb __ BPL $2fb6 ; (main.l10654 + 0)
.s1786:
2fbb : 8e 01 d6 STX $d601 
2fbe : a9 20 __ LDA #$20
2fc0 : 8d 00 d6 STA $d600 
.l10656:
2fc3 : 2c 00 d6 BIT $d600 
2fc6 : 10 fb __ BPL $2fc3 ; (main.l10656 + 0)
.s1791:
2fc8 : a5 44 __ LDA T14 + 0 
2fca : 8d 01 d6 STA $d601 
2fcd : a9 21 __ LDA #$21
2fcf : 8d 00 d6 STA $d600 
.l10658:
2fd2 : 2c 00 d6 BIT $d600 
2fd5 : 10 fb __ BPL $2fd2 ; (main.l10658 + 0)
.s1796:
2fd7 : a5 64 __ LDA T11 + 0 
2fd9 : 8d 01 d6 STA $d601 
2fdc : a9 1f __ LDA #$1f
2fde : 8d 00 d6 STA $d600 
2fe1 : a9 1e __ LDA #$1e
2fe3 : 8d 00 d6 STA $d600 
.l10660:
2fe6 : 2c 00 d6 BIT $d600 
2fe9 : 10 fb __ BPL $2fe6 ; (main.l10660 + 0)
.s1802:
2feb : a5 57 __ LDA T3 + 0 
2fed : 8d 01 d6 STA $d601 
2ff0 : a9 12 __ LDA #$12
2ff2 : 8d 00 d6 STA $d600 
.l10662:
2ff5 : 2c 00 d6 BIT $d600 
2ff8 : 10 fb __ BPL $2ff5 ; (main.l10662 + 0)
.s1855:
2ffa : a5 44 __ LDA T14 + 0 
2ffc : 8d 01 d6 STA $d601 
2fff : a9 13 __ LDA #$13
3001 : 8d 00 d6 STA $d600 
.l10664:
3004 : 2c 00 d6 BIT $d600 
3007 : 10 fb __ BPL $3004 ; (main.l10664 + 0)
.s1860:
3009 : a5 64 __ LDA T11 + 0 
300b : 8d 01 d6 STA $d601 
300e : a9 1f __ LDA #$1f
3010 : 8d 00 d6 STA $d600 
3013 : a9 18 __ LDA #$18
3015 : 8d 00 d6 STA $d600 
.l10666:
3018 : 2c 00 d6 BIT $d600 
301b : 10 fb __ BPL $3018 ; (main.l10666 + 0)
.s1867:
301d : ad 01 d6 LDA $d601 
3020 : 09 80 __ ORA #$80
3022 : aa __ __ TAX
3023 : a9 18 __ LDA #$18
3025 : 8d 00 d6 STA $d600 
.l10668:
3028 : 2c 00 d6 BIT $d600 
302b : 10 fb __ BPL $3028 ; (main.l10668 + 0)
.s1873:
302d : 8e 01 d6 STX $d601 
3030 : a9 20 __ LDA #$20
3032 : 8d 00 d6 STA $d600 
.l10670:
3035 : 2c 00 d6 BIT $d600 
3038 : 10 fb __ BPL $3035 ; (main.l10670 + 0)
.s1878:
303a : a5 5e __ LDA T6 + 1 
303c : 8d 01 d6 STA $d601 
303f : a9 21 __ LDA #$21
3041 : 8d 00 d6 STA $d600 
.l10672:
3044 : 2c 00 d6 BIT $d600 
3047 : 10 fb __ BPL $3044 ; (main.l10672 + 0)
.s1883:
3049 : a5 5d __ LDA T6 + 0 
304b : 8d 01 d6 STA $d601 
304e : a9 1f __ LDA #$1f
3050 : 8d 00 d6 STA $d600 
3053 : a9 1e __ LDA #$1e
3055 : 8d 00 d6 STA $d600 
.l10674:
3058 : 2c 00 d6 BIT $d600 
305b : 10 fb __ BPL $3058 ; (main.l10674 + 0)
.s1889:
305d : a5 57 __ LDA T3 + 0 
305f : 8d 01 d6 STA $d601 
3062 : a9 12 __ LDA #$12
3064 : 8d 00 d6 STA $d600 
.l10676:
3067 : 2c 00 d6 BIT $d600 
306a : 10 fb __ BPL $3067 ; (main.l10676 + 0)
.s1942:
306c : a5 5c __ LDA T5 + 1 
306e : 8d 01 d6 STA $d601 
3071 : a9 13 __ LDA #$13
3073 : 8d 00 d6 STA $d600 
.l10678:
3076 : 2c 00 d6 BIT $d600 
3079 : 10 fb __ BPL $3076 ; (main.l10678 + 0)
.s1947:
307b : a5 5b __ LDA T5 + 0 
307d : 8d 01 d6 STA $d601 
3080 : a9 1f __ LDA #$1f
3082 : 8d 00 d6 STA $d600 
3085 : a9 18 __ LDA #$18
3087 : 8d 00 d6 STA $d600 
.l10680:
308a : 2c 00 d6 BIT $d600 
308d : 10 fb __ BPL $308a ; (main.l10680 + 0)
.s1954:
308f : ad 01 d6 LDA $d601 
3092 : 09 80 __ ORA #$80
3094 : aa __ __ TAX
3095 : a9 18 __ LDA #$18
3097 : 8d 00 d6 STA $d600 
.l10682:
309a : 2c 00 d6 BIT $d600 
309d : 10 fb __ BPL $309a ; (main.l10682 + 0)
.s1960:
309f : 8e 01 d6 STX $d601 
30a2 : a9 20 __ LDA #$20
30a4 : 8d 00 d6 STA $d600 
.l10684:
30a7 : 2c 00 d6 BIT $d600 
30aa : 10 fb __ BPL $30a7 ; (main.l10684 + 0)
.s1965:
30ac : a5 44 __ LDA T14 + 0 
30ae : 8d 01 d6 STA $d601 
30b1 : a9 21 __ LDA #$21
30b3 : 8d 00 d6 STA $d600 
.l10686:
30b6 : 2c 00 d6 BIT $d600 
30b9 : 10 fb __ BPL $30b6 ; (main.l10686 + 0)
.s1970:
30bb : a5 64 __ LDA T11 + 0 
30bd : 8d 01 d6 STA $d601 
30c0 : a9 1f __ LDA #$1f
30c2 : 8d 00 d6 STA $d600 
30c5 : a9 1e __ LDA #$1e
30c7 : 8d 00 d6 STA $d600 
.l10688:
30ca : 2c 00 d6 BIT $d600 
30cd : 10 fb __ BPL $30ca ; (main.l10688 + 0)
.s1976:
30cf : a5 57 __ LDA T3 + 0 
30d1 : 8d 01 d6 STA $d601 
.s1624:
30d4 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
30d7 : 18 __ __ CLC
30d8 : 65 59 __ ADC T4 + 0 
30da : 85 59 __ STA T4 + 0 
30dc : ad fa 58 LDA $58fa ; (vdc_state + 4)
30df : 65 5a __ ADC T4 + 1 
30e1 : 85 5a __ STA T4 + 1 
30e3 : 18 __ __ CLC
30e4 : a5 5b __ LDA T5 + 0 
30e6 : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
30e9 : 85 5b __ STA T5 + 0 
30eb : a5 5c __ LDA T5 + 1 
30ed : 6d fa 58 ADC $58fa ; (vdc_state + 4)
30f0 : e6 61 __ INC T8 + 0 
30f2 : 4c 5b 2a JMP $2a5b ; (main.l1620 + 0)
.s1625:
30f5 : 86 0f __ STX P2 
30f7 : 84 10 __ STY P3 
30f9 : 20 38 14 JSR $1438 ; (bnk_cpyfromvdc@proxy + 0)
30fc : a5 59 __ LDA T4 + 0 
30fe : 85 0d __ STA P0 
3100 : a5 5a __ LDA T4 + 1 
3102 : 85 0e __ STA P1 
3104 : 20 e9 14 JSR $14e9 ; (bnk_cpytovdc@proxy + 0)
3107 : a5 5d __ LDA T6 + 0 
3109 : 85 0f __ STA P2 
310b : a5 5e __ LDA T6 + 1 
310d : 85 10 __ STA P3 
310f : 20 bd 14 JSR $14bd ; (bnk_cpyfromvdc@proxy + 0)
3112 : a5 5b __ LDA T5 + 0 
3114 : 85 0d __ STA P0 
3116 : a5 5c __ LDA T5 + 1 
3118 : 85 0e __ STA P1 
311a : 20 e9 14 JSR $14e9 ; (bnk_cpytovdc@proxy + 0)
311d : 4c d4 30 JMP $30d4 ; (main.s1624 + 0)
.s1260:
3120 : a5 59 __ LDA T4 + 0 
3122 : 69 01 __ ADC #$01
3124 : 85 5d __ STA T6 + 0 
3126 : a5 5a __ LDA T4 + 1 
3128 : 69 00 __ ADC #$00
312a : 85 5e __ STA T6 + 1 
312c : 18 __ __ CLC
312d : a5 5b __ LDA T5 + 0 
312f : 69 01 __ ADC #$01
3131 : 85 5f __ STA T7 + 0 
3133 : a5 5c __ LDA T5 + 1 
3135 : 69 00 __ ADC #$00
3137 : 85 60 __ STA T7 + 1 
3139 : ad f7 58 LDA $58f7 ; (vdc_state + 1)
313c : d0 11 __ BNE $314f ; (main.s1265 + 0)
.s1267:
313e : a9 03 __ LDA #$03
3140 : cd 03 59 CMP $5903 ; (vdc_state + 13)
3143 : d0 05 __ BNE $314a ; (main.s1224 + 0)
.s1223:
3145 : a9 ff __ LDA #$ff
3147 : cd 02 59 CMP $5902 ; (vdc_state + 12)
.s1224:
314a : b0 03 __ BCS $314f ; (main.s1265 + 0)
314c : 4c 3a 33 JMP $333a ; (main.s1264 + 0)
.s1265:
314f : a9 12 __ LDA #$12
3151 : 8d 00 d6 STA $d600 
3154 : ac 03 59 LDY $5903 ; (vdc_state + 13)
3157 : ae 02 59 LDX $5902 ; (vdc_state + 12)
.l10574:
315a : 2c 00 d6 BIT $d600 
315d : 10 fb __ BPL $315a ; (main.l10574 + 0)
.s1320:
315f : 8c 01 d6 STY $d601 
3162 : a9 13 __ LDA #$13
3164 : 8d 00 d6 STA $d600 
.l10576:
3167 : 2c 00 d6 BIT $d600 
316a : 10 fb __ BPL $3167 ; (main.l10576 + 0)
.s1325:
316c : 8e 01 d6 STX $d601 
316f : a9 1f __ LDA #$1f
3171 : 8d 00 d6 STA $d600 
3174 : a9 18 __ LDA #$18
3176 : 8d 00 d6 STA $d600 
.l10578:
3179 : 2c 00 d6 BIT $d600 
317c : 10 fb __ BPL $3179 ; (main.l10578 + 0)
.s1332:
317e : ad 01 d6 LDA $d601 
3181 : 09 80 __ ORA #$80
3183 : 85 46 __ STA T15 + 0 
3185 : a9 18 __ LDA #$18
3187 : 8d 00 d6 STA $d600 
.l10580:
318a : 2c 00 d6 BIT $d600 
318d : 10 fb __ BPL $318a ; (main.l10580 + 0)
.s1338:
318f : a5 46 __ LDA T15 + 0 
3191 : 8d 01 d6 STA $d601 
3194 : a9 20 __ LDA #$20
3196 : 8d 00 d6 STA $d600 
.l10582:
3199 : 2c 00 d6 BIT $d600 
319c : 10 fb __ BPL $3199 ; (main.l10582 + 0)
.s1343:
319e : a5 5a __ LDA T4 + 1 
31a0 : 8d 01 d6 STA $d601 
31a3 : a9 21 __ LDA #$21
31a5 : 8d 00 d6 STA $d600 
.l10584:
31a8 : 2c 00 d6 BIT $d600 
31ab : 10 fb __ BPL $31a8 ; (main.l10584 + 0)
.s1348:
31ad : a5 59 __ LDA T4 + 0 
31af : 8d 01 d6 STA $d601 
31b2 : a9 1f __ LDA #$1f
31b4 : 8d 00 d6 STA $d600 
31b7 : a9 1e __ LDA #$1e
31b9 : 8d 00 d6 STA $d600 
.l10586:
31bc : 2c 00 d6 BIT $d600 
31bf : 10 fb __ BPL $31bc ; (main.l10586 + 0)
.s1354:
31c1 : a5 57 __ LDA T3 + 0 
31c3 : 8d 01 d6 STA $d601 
31c6 : a9 12 __ LDA #$12
31c8 : 8d 00 d6 STA $d600 
.l10588:
31cb : 2c 00 d6 BIT $d600 
31ce : 10 fb __ BPL $31cb ; (main.l10588 + 0)
.s1407:
31d0 : a5 5e __ LDA T6 + 1 
31d2 : 8d 01 d6 STA $d601 
31d5 : a9 13 __ LDA #$13
31d7 : 8d 00 d6 STA $d600 
.l10590:
31da : 2c 00 d6 BIT $d600 
31dd : 10 fb __ BPL $31da ; (main.l10590 + 0)
.s1412:
31df : a5 5d __ LDA T6 + 0 
31e1 : 8d 01 d6 STA $d601 
31e4 : a9 1f __ LDA #$1f
31e6 : 8d 00 d6 STA $d600 
31e9 : a9 18 __ LDA #$18
31eb : 8d 00 d6 STA $d600 
.l10592:
31ee : 2c 00 d6 BIT $d600 
31f1 : 10 fb __ BPL $31ee ; (main.l10592 + 0)
.s1419:
31f3 : ad 01 d6 LDA $d601 
31f6 : 09 80 __ ORA #$80
31f8 : 85 5d __ STA T6 + 0 
31fa : a9 18 __ LDA #$18
31fc : 8d 00 d6 STA $d600 
.l10594:
31ff : 2c 00 d6 BIT $d600 
3202 : 10 fb __ BPL $31ff ; (main.l10594 + 0)
.s1425:
3204 : a5 5d __ LDA T6 + 0 
3206 : 8d 01 d6 STA $d601 
3209 : a9 20 __ LDA #$20
320b : 8d 00 d6 STA $d600 
.l10596:
320e : 2c 00 d6 BIT $d600 
3211 : 10 fb __ BPL $320e ; (main.l10596 + 0)
.s1430:
3213 : 8c 01 d6 STY $d601 
3216 : a9 21 __ LDA #$21
3218 : 8d 00 d6 STA $d600 
.l10598:
321b : 2c 00 d6 BIT $d600 
321e : 10 fb __ BPL $321b ; (main.l10598 + 0)
.s1435:
3220 : 8e 01 d6 STX $d601 
3223 : a9 1f __ LDA #$1f
3225 : 8d 00 d6 STA $d600 
3228 : a9 1e __ LDA #$1e
322a : 8d 00 d6 STA $d600 
.l10600:
322d : 2c 00 d6 BIT $d600 
3230 : 10 fb __ BPL $322d ; (main.l10600 + 0)
.s1441:
3232 : a5 57 __ LDA T3 + 0 
3234 : 8d 01 d6 STA $d601 
3237 : a9 12 __ LDA #$12
3239 : 8d 00 d6 STA $d600 
.l10602:
323c : 2c 00 d6 BIT $d600 
323f : 10 fb __ BPL $323c ; (main.l10602 + 0)
.s1494:
3241 : 8c 01 d6 STY $d601 
3244 : a9 13 __ LDA #$13
3246 : 8d 00 d6 STA $d600 
.l10604:
3249 : 2c 00 d6 BIT $d600 
324c : 10 fb __ BPL $3249 ; (main.l10604 + 0)
.s1499:
324e : 8e 01 d6 STX $d601 
3251 : a9 1f __ LDA #$1f
3253 : 8d 00 d6 STA $d600 
3256 : a9 18 __ LDA #$18
3258 : 8d 00 d6 STA $d600 
.l10606:
325b : 2c 00 d6 BIT $d600 
325e : 10 fb __ BPL $325b ; (main.l10606 + 0)
.s1506:
3260 : ad 01 d6 LDA $d601 
3263 : 09 80 __ ORA #$80
3265 : 85 5d __ STA T6 + 0 
3267 : a9 18 __ LDA #$18
3269 : 8d 00 d6 STA $d600 
.l10608:
326c : 2c 00 d6 BIT $d600 
326f : 10 fb __ BPL $326c ; (main.l10608 + 0)
.s1512:
3271 : a5 5d __ LDA T6 + 0 
3273 : 8d 01 d6 STA $d601 
3276 : a9 20 __ LDA #$20
3278 : 8d 00 d6 STA $d600 
.l10610:
327b : 2c 00 d6 BIT $d600 
327e : 10 fb __ BPL $327b ; (main.l10610 + 0)
.s1517:
3280 : a5 5c __ LDA T5 + 1 
3282 : 8d 01 d6 STA $d601 
3285 : a9 21 __ LDA #$21
3287 : 8d 00 d6 STA $d600 
.l10612:
328a : 2c 00 d6 BIT $d600 
328d : 10 fb __ BPL $328a ; (main.l10612 + 0)
.s1522:
328f : a5 5b __ LDA T5 + 0 
3291 : 8d 01 d6 STA $d601 
3294 : a9 1f __ LDA #$1f
3296 : 8d 00 d6 STA $d600 
3299 : a9 1e __ LDA #$1e
329b : 8d 00 d6 STA $d600 
.l10614:
329e : 2c 00 d6 BIT $d600 
32a1 : 10 fb __ BPL $329e ; (main.l10614 + 0)
.s1528:
32a3 : a5 57 __ LDA T3 + 0 
32a5 : 8d 01 d6 STA $d601 
32a8 : a9 12 __ LDA #$12
32aa : 8d 00 d6 STA $d600 
.l10616:
32ad : 2c 00 d6 BIT $d600 
32b0 : 10 fb __ BPL $32ad ; (main.l10616 + 0)
.s1581:
32b2 : a5 60 __ LDA T7 + 1 
32b4 : 8d 01 d6 STA $d601 
32b7 : a9 13 __ LDA #$13
32b9 : 8d 00 d6 STA $d600 
.l10618:
32bc : 2c 00 d6 BIT $d600 
32bf : 10 fb __ BPL $32bc ; (main.l10618 + 0)
.s1586:
32c1 : a5 5f __ LDA T7 + 0 
32c3 : 8d 01 d6 STA $d601 
32c6 : a9 1f __ LDA #$1f
32c8 : 8d 00 d6 STA $d600 
32cb : a9 18 __ LDA #$18
32cd : 8d 00 d6 STA $d600 
.l10620:
32d0 : 2c 00 d6 BIT $d600 
32d3 : 10 fb __ BPL $32d0 ; (main.l10620 + 0)
.s1593:
32d5 : ad 01 d6 LDA $d601 
32d8 : 09 80 __ ORA #$80
32da : 85 5d __ STA T6 + 0 
32dc : a9 18 __ LDA #$18
32de : 8d 00 d6 STA $d600 
.l10622:
32e1 : 2c 00 d6 BIT $d600 
32e4 : 10 fb __ BPL $32e1 ; (main.l10622 + 0)
.s1599:
32e6 : a5 5d __ LDA T6 + 0 
32e8 : 8d 01 d6 STA $d601 
32eb : a9 20 __ LDA #$20
32ed : 8d 00 d6 STA $d600 
.l10624:
32f0 : 2c 00 d6 BIT $d600 
32f3 : 10 fb __ BPL $32f0 ; (main.l10624 + 0)
.s1604:
32f5 : 8c 01 d6 STY $d601 
32f8 : a9 21 __ LDA #$21
32fa : 8d 00 d6 STA $d600 
.l10626:
32fd : 2c 00 d6 BIT $d600 
3300 : 10 fb __ BPL $32fd ; (main.l10626 + 0)
.s1609:
3302 : 8e 01 d6 STX $d601 
3305 : a9 1f __ LDA #$1f
3307 : 8d 00 d6 STA $d600 
330a : a9 1e __ LDA #$1e
330c : 8d 00 d6 STA $d600 
.l10628:
330f : 2c 00 d6 BIT $d600 
3312 : 10 fb __ BPL $330f ; (main.l10628 + 0)
.s1615:
3314 : a5 57 __ LDA T3 + 0 
3316 : 8d 01 d6 STA $d601 
.s1263:
3319 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
331c : 18 __ __ CLC
331d : 65 59 __ ADC T4 + 0 
331f : 85 59 __ STA T4 + 0 
3321 : ad fa 58 LDA $58fa ; (vdc_state + 4)
3324 : 65 5a __ ADC T4 + 1 
3326 : 85 5a __ STA T4 + 1 
3328 : 18 __ __ CLC
3329 : a5 5b __ LDA T5 + 0 
332b : 6d f9 58 ADC $58f9 ; (vdc_state + 3)
332e : 85 5b __ STA T5 + 0 
3330 : a5 5c __ LDA T5 + 1 
3332 : 6d fa 58 ADC $58fa ; (vdc_state + 4)
3335 : e6 61 __ INC T8 + 0 
3337 : 4c 05 2a JMP $2a05 ; (main.l1259 + 0)
.s1264:
333a : a5 59 __ LDA T4 + 0 
333c : 85 0f __ STA P2 
333e : a5 5a __ LDA T4 + 1 
3340 : 85 10 __ STA P3 
3342 : 20 38 14 JSR $1438 ; (bnk_cpyfromvdc@proxy + 0)
3345 : a5 5d __ LDA T6 + 0 
3347 : 85 0d __ STA P0 
3349 : a5 5e __ LDA T6 + 1 
334b : 85 0e __ STA P1 
334d : 20 e9 14 JSR $14e9 ; (bnk_cpytovdc@proxy + 0)
3350 : a5 5b __ LDA T5 + 0 
3352 : 85 0f __ STA P2 
3354 : a5 5c __ LDA T5 + 1 
3356 : 85 10 __ STA P3 
3358 : 20 bd 14 JSR $14bd ; (bnk_cpyfromvdc@proxy + 0)
335b : a5 5f __ LDA T7 + 0 
335d : 85 0d __ STA P0 
335f : a5 60 __ LDA T7 + 1 
3361 : 85 0e __ STA P1 
3363 : 20 e9 14 JSR $14e9 ; (bnk_cpytovdc@proxy + 0)
3366 : 4c 19 33 JMP $3319 ; (main.s1263 + 0)
.s1195:
3369 : a9 00 __ LDA #$00
336b : 9d ca be STA $beca,x ; (wrapbuffer + 0)
336e : aa __ __ TAX
336f : ad ca be LDA $beca ; (wrapbuffer + 0)
3372 : f0 08 __ BEQ $337c ; (main.s1201 + 0)
.l1656:
3374 : bd cb be LDA $becb,x ; (wrapbuffer + 1)
3377 : e8 __ __ INX
3378 : 09 00 __ ORA #$00
337a : d0 f8 __ BNE $3374 ; (main.l1656 + 0)
.s1201:
337c : 8a __ __ TXA
337d : 18 __ __ CLC
337e : 6d 4f bf ADC $bf4f ; (window + 4)
3381 : b0 06 __ BCS $3389 ; (main.s1203 + 0)
.s1262:
3383 : c5 63 __ CMP T10 + 0 
3385 : 90 1a __ BCC $33a1 ; (main.s1205 + 0)
.s1697:
3387 : f0 18 __ BEQ $33a1 ; (main.s1205 + 0)
.s1203:
3389 : a9 4b __ LDA #$4b
338b : a0 02 __ LDY #$02
338d : 91 23 __ STA (SP + 0),y 
338f : a9 bf __ LDA #$bf
3391 : c8 __ __ INY
3392 : 91 23 __ STA (SP + 0),y 
3394 : a9 ff __ LDA #$ff
3396 : c8 __ __ INY
3397 : 91 23 __ STA (SP + 0),y 
3399 : a9 4a __ LDA #$4a
339b : c8 __ __ INY
339c : 91 23 __ STA (SP + 0),y 
339e : 20 18 52 JSR $5218 ; (vdcwin_printline.s1000 + 0)
.s1205:
33a1 : a9 4b __ LDA #$4b
33a3 : a0 02 __ LDY #$02
33a5 : 91 23 __ STA (SP + 0),y 
33a7 : a9 bf __ LDA #$bf
33a9 : c8 __ __ INY
33aa : 91 23 __ STA (SP + 0),y 
33ac : a9 ca __ LDA #$ca
33ae : c8 __ __ INY
33af : 91 23 __ STA (SP + 0),y 
33b1 : a9 be __ LDA #$be
33b3 : c8 __ __ INY
33b4 : 91 23 __ STA (SP + 0),y 
33b6 : 20 f1 54 JSR $54f1 ; (vdcwin_put_string.s1000 + 0)
33b9 : a5 61 __ LDA T8 + 0 
33bb : c5 59 __ CMP T4 + 0 
33bd : 90 03 __ BCC $33c2 ; (main.s7210 + 0)
33bf : 4c 5e 26 JMP $265e ; (main.s1171 + 0)
.s7210:
33c2 : a9 00 __ LDA #$00
33c4 : 85 62 __ STA T9 + 0 
33c6 : a9 ff __ LDA #$ff
33c8 : 85 5e __ STA T6 + 1 
33ca : 85 5c __ STA T5 + 1 
33cc : 4c 3e 26 JMP $263e ; (main.l1180 + 0)
.s1182:
33cf : a6 61 __ LDX T8 + 0 
33d1 : bd 9f 59 LDA $599f,x ; (linebuffer + 0)
33d4 : a6 62 __ LDX T9 + 0 
33d6 : 9d ca be STA $beca,x ; (wrapbuffer + 0)
33d9 : c9 20 __ CMP #$20
33db : d0 06 __ BNE $33e3 ; (main.s1186 + 0)
.s1192:
33dd : a9 00 __ LDA #$00
33df : 85 5e __ STA T6 + 1 
33e1 : f0 08 __ BEQ $33eb ; (main.s7784 + 0)
.s1186:
33e3 : 24 5c __ BIT T5 + 1 
33e5 : 10 04 __ BPL $33eb ; (main.s7784 + 0)
.s1189:
33e7 : a9 00 __ LDA #$00
33e9 : 85 5c __ STA T5 + 1 
.s7784:
33eb : e6 61 __ INC T8 + 0 
33ed : e6 62 __ INC T9 + 0 
33ef : 4c 3e 26 JMP $263e ; (main.l1180 + 0)
.l1085:
33f2 : a5 62 __ LDA T9 + 0 
33f4 : 0a __ __ ASL
33f5 : 10 1a __ BPL $3411 ; (main.s1090 + 0)
.s1088:
33f7 : a5 56 __ LDA T2 + 0 
33f9 : 85 10 __ STA P3 
33fb : ae 4b bf LDX $bf4b ; (window + 0)
33fe : ca __ __ DEX
33ff : 86 0d __ STX P0 
3401 : ad 4c bf LDA $bf4c ; (window + 1)
3404 : 18 __ __ CLC
3405 : 65 61 __ ADC T8 + 0 
3407 : 85 0e __ STA P1 
3409 : ad 6f 57 LDA $576f ; (winStyles + 7)
340c : 85 0f __ STA P2 
340e : 20 30 50 JSR $5030 ; (vdc_printc.s0 + 0)
.s1090:
3411 : ad 4c bf LDA $bf4c ; (window + 1)
3414 : 18 __ __ CLC
3415 : 65 61 __ ADC T8 + 0 
3417 : 85 0e __ STA P1 
3419 : 0a __ __ ASL
341a : aa __ __ TAX
341b : a9 12 __ LDA #$12
341d : 8d 00 d6 STA $d600 
3420 : ad 4d bf LDA $bf4d ; (window + 2)
3423 : 38 __ __ SEC
3424 : e9 01 __ SBC #$01
3426 : 85 5f __ STA T7 + 0 
3428 : ad 4b bf LDA $bf4b ; (window + 0)
342b : 85 64 __ STA T11 + 0 
342d : 18 __ __ CLC
342e : 7d 0f 59 ADC $590f,x ; (multab + 0)
3431 : 85 59 __ STA T4 + 0 
3433 : a9 00 __ LDA #$00
3435 : 7d 10 59 ADC $5910,x ; (multab + 1)
3438 : 85 5a __ STA T4 + 1 
343a : 18 __ __ CLC
343b : a5 59 __ LDA T4 + 0 
343d : 6d fe 58 ADC $58fe ; (vdc_state + 8)
3440 : a8 __ __ TAY
3441 : a5 5a __ LDA T4 + 1 
3443 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
3446 : ae fd 58 LDX $58fd ; (vdc_state + 7)
.l10523:
3449 : 2c 00 d6 BIT $d600 
344c : 10 fb __ BPL $3449 ; (main.l10523 + 0)
.s1100:
344e : 8d 01 d6 STA $d601 
3451 : a9 13 __ LDA #$13
3453 : 8d 00 d6 STA $d600 
.l10525:
3456 : 2c 00 d6 BIT $d600 
3459 : 10 fb __ BPL $3456 ; (main.l10525 + 0)
.s1105:
345b : 8c 01 d6 STY $d601 
345e : a9 1f __ LDA #$1f
3460 : 8d 00 d6 STA $d600 
.l10527:
3463 : 2c 00 d6 BIT $d600 
3466 : 10 fb __ BPL $3463 ; (main.l10527 + 0)
.s1109:
3468 : a9 20 __ LDA #$20
346a : 8d 01 d6 STA $d601 
346d : a9 18 __ LDA #$18
346f : 8d 00 d6 STA $d600 
.l10529:
3472 : 2c 00 d6 BIT $d600 
3475 : 10 fb __ BPL $3472 ; (main.l10529 + 0)
.s1115:
3477 : ad 01 d6 LDA $d601 
347a : 29 7f __ AND #$7f
347c : a8 __ __ TAY
347d : a9 18 __ LDA #$18
347f : 8d 00 d6 STA $d600 
.l10531:
3482 : 2c 00 d6 BIT $d600 
3485 : 10 fb __ BPL $3482 ; (main.l10531 + 0)
.s1121:
3487 : 8c 01 d6 STY $d601 
348a : a9 1e __ LDA #$1e
348c : 8d 00 d6 STA $d600 
.l10533:
348f : 2c 00 d6 BIT $d600 
3492 : 10 fb __ BPL $348f ; (main.l10533 + 0)
.s1126:
3494 : a5 5f __ LDA T7 + 0 
3496 : 8d 01 d6 STA $d601 
3499 : ad 00 59 LDA $5900 ; (vdc_state + 10)
349c : 18 __ __ CLC
349d : 65 59 __ ADC T4 + 0 
349f : a8 __ __ TAY
34a0 : a9 12 __ LDA #$12
34a2 : 8d 00 d6 STA $d600 
34a5 : ad 01 59 LDA $5901 ; (vdc_state + 11)
34a8 : 65 5a __ ADC T4 + 1 
.l10535:
34aa : 2c 00 d6 BIT $d600 
34ad : 10 fb __ BPL $34aa ; (main.l10535 + 0)
.s1133:
34af : 8d 01 d6 STA $d601 
34b2 : a9 13 __ LDA #$13
34b4 : 8d 00 d6 STA $d600 
.l10537:
34b7 : 2c 00 d6 BIT $d600 
34ba : 10 fb __ BPL $34b7 ; (main.l10537 + 0)
.s1138:
34bc : 8c 01 d6 STY $d601 
34bf : a9 1f __ LDA #$1f
34c1 : 8d 00 d6 STA $d600 
.l10539:
34c4 : 2c 00 d6 BIT $d600 
34c7 : 10 fb __ BPL $34c4 ; (main.l10539 + 0)
.s1142:
34c9 : 8e 01 d6 STX $d601 
34cc : a9 18 __ LDA #$18
34ce : 8d 00 d6 STA $d600 
.l10541:
34d1 : 2c 00 d6 BIT $d600 
34d4 : 10 fb __ BPL $34d1 ; (main.l10541 + 0)
.s1148:
34d6 : ad 01 d6 LDA $d601 
34d9 : 29 7f __ AND #$7f
34db : aa __ __ TAX
34dc : a9 18 __ LDA #$18
34de : 8d 00 d6 STA $d600 
.l10543:
34e1 : 2c 00 d6 BIT $d600 
34e4 : 10 fb __ BPL $34e1 ; (main.l10543 + 0)
.s1154:
34e6 : 8e 01 d6 STX $d601 
34e9 : a9 1e __ LDA #$1e
34eb : 8d 00 d6 STA $d600 
.l10545:
34ee : 2c 00 d6 BIT $d600 
34f1 : 10 fb __ BPL $34ee ; (main.l10545 + 0)
.s1159:
34f3 : a5 5f __ LDA T7 + 0 
34f5 : 8d 01 d6 STA $d601 
34f8 : a5 62 __ LDA T9 + 0 
34fa : 29 20 __ AND #$20
34fc : f0 14 __ BEQ $3512 ; (main.s11002 + 0)
.s1160:
34fe : 18 __ __ CLC
34ff : a5 64 __ LDA T11 + 0 
3501 : 6d 4d bf ADC $bf4d ; (window + 2)
3504 : 85 0d __ STA P0 
3506 : a5 56 __ LDA T2 + 0 
3508 : 85 10 __ STA P3 
350a : ad 70 57 LDA $5770 ; (winStyles + 8)
350d : 85 0f __ STA P2 
350f : 20 30 50 JSR $5030 ; (vdc_printc.s0 + 0)
.s11002:
3512 : e6 61 __ INC T8 + 0 
3514 : a5 61 __ LDA T8 + 0 
3516 : cd 4e bf CMP $bf4e ; (window + 3)
3519 : b0 03 __ BCS $351e ; (main.s11002 + 12)
351b : 4c f2 33 JMP $33f2 ; (main.l1085 + 0)
351e : 4c ac 25 JMP $25ac ; (main.s917 + 0)
.s1005:
3521 : a5 62 __ LDA T9 + 0 
3523 : 0a __ __ ASL
3524 : 10 15 __ BPL $353b ; (main.s1011 + 0)
.s1009:
3526 : a5 66 __ LDA T12 + 0 
3528 : 85 0e __ STA P1 
352a : a5 56 __ LDA T2 + 0 
352c : 85 10 __ STA P3 
352e : a6 61 __ LDX T8 + 0 
3530 : ca __ __ DEX
3531 : 86 0d __ STX P0 
3533 : ad 6b 57 LDA $576b ; (winStyles + 3)
3536 : 85 0f __ STA P2 
3538 : 20 30 50 JSR $5030 ; (vdc_printc.s0 + 0)
.s1011:
353b : a5 66 __ LDA T12 + 0 
353d : 0a __ __ ASL
353e : aa __ __ TAX
353f : a9 12 __ LDA #$12
3541 : 8d 00 d6 STA $d600 
3544 : c6 5f __ DEC T7 + 0 
3546 : bd 0f 59 LDA $590f,x ; (multab + 0)
3549 : 18 __ __ CLC
354a : 65 61 __ ADC T8 + 0 
354c : 85 54 __ STA T1 + 0 
354e : bd 10 59 LDA $5910,x ; (multab + 1)
3551 : 69 00 __ ADC #$00
3553 : a8 __ __ TAY
3554 : 18 __ __ CLC
3555 : a5 54 __ LDA T1 + 0 
3557 : 65 57 __ ADC T3 + 0 
3559 : 85 57 __ STA T3 + 0 
355b : 98 __ __ TYA
355c : 65 58 __ ADC T3 + 1 
355e : ae 6e 57 LDX $576e ; (winStyles + 6)
.l10496:
3561 : 2c 00 d6 BIT $d600 
3564 : 10 fb __ BPL $3561 ; (main.l10496 + 0)
.s1021:
3566 : 8d 01 d6 STA $d601 
3569 : a9 13 __ LDA #$13
356b : 8d 00 d6 STA $d600 
.l10498:
356e : 2c 00 d6 BIT $d600 
3571 : 10 fb __ BPL $356e ; (main.l10498 + 0)
.s1026:
3573 : a5 57 __ LDA T3 + 0 
3575 : 8d 01 d6 STA $d601 
3578 : a9 1f __ LDA #$1f
357a : 8d 00 d6 STA $d600 
.l10500:
357d : 2c 00 d6 BIT $d600 
3580 : 10 fb __ BPL $357d ; (main.l10500 + 0)
.s1030:
3582 : 8e 01 d6 STX $d601 
3585 : a9 18 __ LDA #$18
3587 : 8d 00 d6 STA $d600 
.l10502:
358a : 2c 00 d6 BIT $d600 
358d : 10 fb __ BPL $358a ; (main.l10502 + 0)
.s1036:
358f : ad 01 d6 LDA $d601 
3592 : 29 7f __ AND #$7f
3594 : aa __ __ TAX
3595 : a9 18 __ LDA #$18
3597 : 8d 00 d6 STA $d600 
.l10504:
359a : 2c 00 d6 BIT $d600 
359d : 10 fb __ BPL $359a ; (main.l10504 + 0)
.s1042:
359f : 8e 01 d6 STX $d601 
35a2 : a9 1e __ LDA #$1e
35a4 : 8d 00 d6 STA $d600 
.l10506:
35a7 : 2c 00 d6 BIT $d600 
35aa : 10 fb __ BPL $35a7 ; (main.l10506 + 0)
.s1047:
35ac : a5 5f __ LDA T7 + 0 
35ae : 8d 01 d6 STA $d601 
35b1 : a9 12 __ LDA #$12
35b3 : 8d 00 d6 STA $d600 
35b6 : 18 __ __ CLC
35b7 : a5 54 __ LDA T1 + 0 
35b9 : 65 59 __ ADC T4 + 0 
35bb : aa __ __ TAX
35bc : 98 __ __ TYA
35bd : 65 5a __ ADC T4 + 1 
.l10508:
35bf : 2c 00 d6 BIT $d600 
35c2 : 10 fb __ BPL $35bf ; (main.l10508 + 0)
.s1054:
35c4 : 8d 01 d6 STA $d601 
35c7 : a9 13 __ LDA #$13
35c9 : 8d 00 d6 STA $d600 
.l10510:
35cc : 2c 00 d6 BIT $d600 
35cf : 10 fb __ BPL $35cc ; (main.l10510 + 0)
.s1059:
35d1 : 8e 01 d6 STX $d601 
35d4 : a9 1f __ LDA #$1f
35d6 : 8d 00 d6 STA $d600 
.l10512:
35d9 : 2c 00 d6 BIT $d600 
35dc : 10 fb __ BPL $35d9 ; (main.l10512 + 0)
.s1063:
35de : a5 56 __ LDA T2 + 0 
35e0 : 8d 01 d6 STA $d601 
35e3 : a9 18 __ LDA #$18
35e5 : 8d 00 d6 STA $d600 
.l10514:
35e8 : 2c 00 d6 BIT $d600 
35eb : 10 fb __ BPL $35e8 ; (main.l10514 + 0)
.s1069:
35ed : ad 01 d6 LDA $d601 
35f0 : 29 7f __ AND #$7f
35f2 : aa __ __ TAX
35f3 : a9 18 __ LDA #$18
35f5 : 8d 00 d6 STA $d600 
.l10516:
35f8 : 2c 00 d6 BIT $d600 
35fb : 10 fb __ BPL $35f8 ; (main.l10516 + 0)
.s1075:
35fd : 8e 01 d6 STX $d601 
3600 : a9 1e __ LDA #$1e
3602 : 8d 00 d6 STA $d600 
.l10518:
3605 : 2c 00 d6 BIT $d600 
3608 : 10 fb __ BPL $3605 ; (main.l10518 + 0)
.s1080:
360a : a5 5f __ LDA T7 + 0 
360c : 8d 01 d6 STA $d601 
360f : a5 62 __ LDA T9 + 0 
3611 : 29 20 __ AND #$20
3613 : d0 03 __ BNE $3618 ; (main.s1081 + 0)
3615 : 4c a0 25 JMP $25a0 ; (main.s2666 + 0)
.s1081:
3618 : a5 66 __ LDA T12 + 0 
361a : 85 0e __ STA P1 
361c : ad 6c 57 LDA $576c ; (winStyles + 4)
361f : 85 0f __ STA P2 
3621 : 20 4d 57 JSR $574d ; (vdc_printc@proxy + 0)
3624 : 4c a0 25 JMP $25a0 ; (main.s2666 + 0)
.s926:
3627 : 85 63 __ STA T10 + 0 
3629 : a5 62 __ LDA T9 + 0 
362b : 0a __ __ ASL
362c : 10 16 __ BPL $3644 ; (main.s932 + 0)
.s930:
362e : a5 56 __ LDA T2 + 0 
3630 : 85 10 __ STA P3 
3632 : a6 61 __ LDX T8 + 0 
3634 : ca __ __ DEX
3635 : 86 0d __ STX P0 
3637 : a6 63 __ LDX T10 + 0 
3639 : ca __ __ DEX
363a : 86 0e __ STX P1 
363c : ad 69 57 LDA $5769 ; (winStyles + 1)
363f : 85 0f __ STA P2 
3641 : 20 30 50 JSR $5030 ; (vdc_printc.s0 + 0)
.s932:
3644 : a5 63 __ LDA T10 + 0 
3646 : 38 __ __ SEC
3647 : e9 01 __ SBC #$01
3649 : 85 0e __ STA P1 
364b : 0a __ __ ASL
364c : aa __ __ TAX
364d : a9 12 __ LDA #$12
364f : 8d 00 d6 STA $d600 
3652 : 38 __ __ SEC
3653 : a5 5f __ LDA T7 + 0 
3655 : e9 01 __ SBC #$01
3657 : 85 46 __ STA T15 + 0 
3659 : 18 __ __ CLC
365a : a5 61 __ LDA T8 + 0 
365c : 7d 0f 59 ADC $590f,x ; (multab + 0)
365f : 85 44 __ STA T14 + 0 
3661 : a9 00 __ LDA #$00
3663 : 7d 10 59 ADC $5910,x ; (multab + 1)
3666 : a8 __ __ TAY
3667 : 18 __ __ CLC
3668 : a5 44 __ LDA T14 + 0 
366a : 65 57 __ ADC T3 + 0 
366c : 85 48 __ STA T16 + 0 
366e : 98 __ __ TYA
366f : 65 58 __ ADC T3 + 1 
3671 : ae 6d 57 LDX $576d ; (winStyles + 5)
.l10468:
3674 : 2c 00 d6 BIT $d600 
3677 : 10 fb __ BPL $3674 ; (main.l10468 + 0)
.s942:
3679 : 8d 01 d6 STA $d601 
367c : a9 13 __ LDA #$13
367e : 8d 00 d6 STA $d600 
.l10470:
3681 : 2c 00 d6 BIT $d600 
3684 : 10 fb __ BPL $3681 ; (main.l10470 + 0)
.s947:
3686 : a5 48 __ LDA T16 + 0 
3688 : 8d 01 d6 STA $d601 
368b : a9 1f __ LDA #$1f
368d : 8d 00 d6 STA $d600 
.l10472:
3690 : 2c 00 d6 BIT $d600 
3693 : 10 fb __ BPL $3690 ; (main.l10472 + 0)
.s951:
3695 : 8e 01 d6 STX $d601 
3698 : a9 18 __ LDA #$18
369a : 8d 00 d6 STA $d600 
.l10474:
369d : 2c 00 d6 BIT $d600 
36a0 : 10 fb __ BPL $369d ; (main.l10474 + 0)
.s957:
36a2 : ad 01 d6 LDA $d601 
36a5 : 29 7f __ AND #$7f
36a7 : aa __ __ TAX
36a8 : a9 18 __ LDA #$18
36aa : 8d 00 d6 STA $d600 
.l10476:
36ad : 2c 00 d6 BIT $d600 
36b0 : 10 fb __ BPL $36ad ; (main.l10476 + 0)
.s963:
36b2 : 8e 01 d6 STX $d601 
36b5 : a9 1e __ LDA #$1e
36b7 : 8d 00 d6 STA $d600 
.l10478:
36ba : 2c 00 d6 BIT $d600 
36bd : 10 fb __ BPL $36ba ; (main.l10478 + 0)
.s968:
36bf : a5 46 __ LDA T15 + 0 
36c1 : 8d 01 d6 STA $d601 
36c4 : a9 12 __ LDA #$12
36c6 : 8d 00 d6 STA $d600 
36c9 : 18 __ __ CLC
36ca : a5 44 __ LDA T14 + 0 
36cc : 65 59 __ ADC T4 + 0 
36ce : aa __ __ TAX
36cf : 98 __ __ TYA
36d0 : 65 5a __ ADC T4 + 1 
.l10480:
36d2 : 2c 00 d6 BIT $d600 
36d5 : 10 fb __ BPL $36d2 ; (main.l10480 + 0)
.s975:
36d7 : 8d 01 d6 STA $d601 
36da : a9 13 __ LDA #$13
36dc : 8d 00 d6 STA $d600 
.l10482:
36df : 2c 00 d6 BIT $d600 
36e2 : 10 fb __ BPL $36df ; (main.l10482 + 0)
.s980:
36e4 : 8e 01 d6 STX $d601 
36e7 : a9 1f __ LDA #$1f
36e9 : 8d 00 d6 STA $d600 
.l10484:
36ec : 2c 00 d6 BIT $d600 
36ef : 10 fb __ BPL $36ec ; (main.l10484 + 0)
.s984:
36f1 : a5 56 __ LDA T2 + 0 
36f3 : 8d 01 d6 STA $d601 
36f6 : a9 18 __ LDA #$18
36f8 : 8d 00 d6 STA $d600 
.l10486:
36fb : 2c 00 d6 BIT $d600 
36fe : 10 fb __ BPL $36fb ; (main.l10486 + 0)
.s990:
3700 : ad 01 d6 LDA $d601 
3703 : 29 7f __ AND #$7f
3705 : aa __ __ TAX
3706 : a9 18 __ LDA #$18
3708 : 8d 00 d6 STA $d600 
.l10488:
370b : 2c 00 d6 BIT $d600 
370e : 10 fb __ BPL $370b ; (main.l10488 + 0)
.s996:
3710 : 8e 01 d6 STX $d601 
3713 : a9 1e __ LDA #$1e
3715 : 8d 00 d6 STA $d600 
.l10490:
3718 : 2c 00 d6 BIT $d600 
371b : 10 fb __ BPL $3718 ; (main.l10490 + 0)
.s1001:
371d : a5 46 __ LDA T15 + 0 
371f : 8d 01 d6 STA $d601 
3722 : a5 62 __ LDA T9 + 0 
3724 : 29 20 __ AND #$20
3726 : d0 03 __ BNE $372b ; (main.s1002 + 0)
3728 : 4c 81 25 JMP $2581 ; (main.s10493 + 0)
.s1002:
372b : ad 6a 57 LDA $576a ; (winStyles + 2)
372e : 85 0f __ STA P2 
3730 : 20 4d 57 JSR $574d ; (vdc_printc@proxy + 0)
3733 : 4c 81 25 JMP $2581 ; (main.s10493 + 0)
.s753:
3736 : 0a __ __ ASL
3737 : aa __ __ TAX
3738 : ad fd 58 LDA $58fd ; (vdc_state + 7)
373b : 85 62 __ STA T9 + 0 
373d : a9 12 __ LDA #$12
373f : 8d 00 d6 STA $d600 
3742 : a5 5b __ LDA T5 + 0 
3744 : 38 __ __ SEC
3745 : e9 01 __ SBC #$01
3747 : 85 66 __ STA T12 + 0 
3749 : bd 0f 59 LDA $590f,x ; (multab + 0)
374c : 85 5f __ STA T7 + 0 
374e : 18 __ __ CLC
374f : 6d fe 58 ADC $58fe ; (vdc_state + 8)
3752 : a8 __ __ TAY
3753 : bd 10 59 LDA $5910,x ; (multab + 1)
3756 : 85 60 __ STA T7 + 1 
3758 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l10877:
375b : 2c 00 d6 BIT $d600 
375e : 10 fb __ BPL $375b ; (main.l10877 + 0)
.s765:
3760 : 8d 01 d6 STA $d601 
3763 : a9 13 __ LDA #$13
3765 : 8d 00 d6 STA $d600 
.l10879:
3768 : 2c 00 d6 BIT $d600 
376b : 10 fb __ BPL $3768 ; (main.l10879 + 0)
.s770:
376d : 8c 01 d6 STY $d601 
3770 : a9 1f __ LDA #$1f
3772 : 8d 00 d6 STA $d600 
.l10881:
3775 : 2c 00 d6 BIT $d600 
3778 : 10 fb __ BPL $3775 ; (main.l10881 + 0)
.s774:
377a : a9 20 __ LDA #$20
377c : 8d 01 d6 STA $d601 
377f : a9 18 __ LDA #$18
3781 : 8d 00 d6 STA $d600 
.l10883:
3784 : 2c 00 d6 BIT $d600 
3787 : 10 fb __ BPL $3784 ; (main.l10883 + 0)
.s780:
3789 : ad 01 d6 LDA $d601 
378c : 29 7f __ AND #$7f
378e : a8 __ __ TAY
378f : a9 18 __ LDA #$18
3791 : 8d 00 d6 STA $d600 
.l10885:
3794 : 2c 00 d6 BIT $d600 
3797 : 10 fb __ BPL $3794 ; (main.l10885 + 0)
.s786:
3799 : 8c 01 d6 STY $d601 
379c : a9 1e __ LDA #$1e
379e : 8d 00 d6 STA $d600 
.l10887:
37a1 : 2c 00 d6 BIT $d600 
37a4 : 10 fb __ BPL $37a1 ; (main.l10887 + 0)
.s791:
37a6 : a5 66 __ LDA T12 + 0 
37a8 : 8d 01 d6 STA $d601 
37ab : ad 00 59 LDA $5900 ; (vdc_state + 10)
37ae : 18 __ __ CLC
37af : 65 5f __ ADC T7 + 0 
37b1 : aa __ __ TAX
37b2 : a9 12 __ LDA #$12
37b4 : 8d 00 d6 STA $d600 
37b7 : ad 01 59 LDA $5901 ; (vdc_state + 11)
37ba : 65 60 __ ADC T7 + 1 
.l10889:
37bc : 2c 00 d6 BIT $d600 
37bf : 10 fb __ BPL $37bc ; (main.l10889 + 0)
.s798:
37c1 : 8d 01 d6 STA $d601 
37c4 : a9 13 __ LDA #$13
37c6 : 8d 00 d6 STA $d600 
.l10891:
37c9 : 2c 00 d6 BIT $d600 
37cc : 10 fb __ BPL $37c9 ; (main.l10891 + 0)
.s803:
37ce : 8e 01 d6 STX $d601 
37d1 : a9 1f __ LDA #$1f
37d3 : 8d 00 d6 STA $d600 
.l10893:
37d6 : 2c 00 d6 BIT $d600 
37d9 : 10 fb __ BPL $37d6 ; (main.l10893 + 0)
.s807:
37db : a5 62 __ LDA T9 + 0 
37dd : 8d 01 d6 STA $d601 
37e0 : a9 18 __ LDA #$18
37e2 : 8d 00 d6 STA $d600 
.l10895:
37e5 : 2c 00 d6 BIT $d600 
37e8 : 10 fb __ BPL $37e5 ; (main.l10895 + 0)
.s813:
37ea : ad 01 d6 LDA $d601 
37ed : 29 7f __ AND #$7f
37ef : aa __ __ TAX
37f0 : a9 18 __ LDA #$18
37f2 : 8d 00 d6 STA $d600 
.l10897:
37f5 : 2c 00 d6 BIT $d600 
37f8 : 10 fb __ BPL $37f5 ; (main.l10897 + 0)
.s819:
37fa : 8e 01 d6 STX $d601 
37fd : a9 1e __ LDA #$1e
37ff : 8d 00 d6 STA $d600 
.l10899:
3802 : 2c 00 d6 BIT $d600 
3805 : 10 fb __ BPL $3802 ; (main.l10899 + 0)
.s824:
3807 : a5 66 __ LDA T12 + 0 
3809 : 8d 01 d6 STA $d601 
380c : e6 61 __ INC T8 + 0 
380e : 4c 4a 23 JMP $234a ; (main.l752 + 0)
.s701:
3811 : ad 26 bf LDA $bf26 ; (softscroll + 11)
3814 : 69 02 __ ADC #$02
3816 : 8d 26 bf STA $bf26 ; (softscroll + 11)
3819 : 90 03 __ BCC $381e ; (main.s1705 + 0)
.s1704:
381b : ee 27 bf INC $bf27 ; (softscroll + 12)
.s1705:
381e : a9 01 __ LDA #$01
3820 : cd 23 bf CMP $bf23 ; (softscroll + 8)
3823 : b0 03 __ BCS $3828 ; (main.s706 + 0)
3825 : 4c b8 38 JMP $38b8 ; (main.s705 + 0)
.s706:
3828 : a9 06 __ LDA #$06
382a : 8d 23 bf STA $bf23 ; (softscroll + 8)
382d : ad 20 bf LDA $bf20 ; (softscroll + 5)
3830 : 18 __ __ CLC
3831 : 69 01 __ ADC #$01
3833 : 85 5d __ STA T6 + 0 
3835 : 8d 20 bf STA $bf20 ; (softscroll + 5)
3838 : ad 21 bf LDA $bf21 ; (softscroll + 6)
383b : 69 00 __ ADC #$00
383d : 85 5e __ STA T6 + 1 
383f : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l10908:
3842 : ad 00 d6 LDA $d600 
3845 : 29 20 __ AND #$20
3847 : d0 f9 __ BNE $3842 ; (main.l10908 + 0)
.s716:
3849 : ad 00 59 LDA $5900 ; (vdc_state + 10)
384c : 18 __ __ CLC
384d : 65 5d __ ADC T6 + 0 
384f : aa __ __ TAX
3850 : ad 01 59 LDA $5901 ; (vdc_state + 11)
3853 : 65 5e __ ADC T6 + 1 
3855 : a8 __ __ TAY
3856 : ad fe 58 LDA $58fe ; (vdc_state + 8)
3859 : 18 __ __ CLC
385a : 65 5d __ ADC T6 + 0 
385c : 85 5d __ STA T6 + 0 
385e : a9 0c __ LDA #$0c
3860 : 8d 00 d6 STA $d600 
3863 : ad ff 58 LDA $58ff ; (vdc_state + 9)
3866 : 65 5e __ ADC T6 + 1 
.l10910:
3868 : 2c 00 d6 BIT $d600 
386b : 10 fb __ BPL $3868 ; (main.l10910 + 0)
.s724:
386d : 8d 01 d6 STA $d601 
3870 : a9 0d __ LDA #$0d
3872 : 8d 00 d6 STA $d600 
.l10912:
3875 : 2c 00 d6 BIT $d600 
3878 : 10 fb __ BPL $3875 ; (main.l10912 + 0)
.s729:
387a : a5 5d __ LDA T6 + 0 
387c : 8d 01 d6 STA $d601 
387f : a9 14 __ LDA #$14
3881 : 8d 00 d6 STA $d600 
.l10914:
3884 : 2c 00 d6 BIT $d600 
3887 : 10 fb __ BPL $3884 ; (main.l10914 + 0)
.s734:
3889 : 8c 01 d6 STY $d601 
388c : a9 15 __ LDA #$15
388e : 8d 00 d6 STA $d600 
.l10916:
3891 : 2c 00 d6 BIT $d600 
3894 : 10 fb __ BPL $3891 ; (main.l10916 + 0)
.s739:
3896 : 8e 01 d6 STX $d601 
.l10918:
3899 : ad 00 d6 LDA $d600 
389c : 29 20 __ AND #$20
389e : f0 f9 __ BEQ $3899 ; (main.l10918 + 0)
.s740:
38a0 : a9 19 __ LDA #$19
38a2 : 8d 00 d6 STA $d600 
38a5 : ad 25 bf LDA $bf25 ; (softscroll + 10)
38a8 : 18 __ __ CLC
38a9 : 69 06 __ ADC #$06
.l10874:
38ab : 2c 00 d6 BIT $d600 
38ae : 10 fb __ BPL $38ab ; (main.l10874 + 0)
.s15835:
38b0 : 8d 01 d6 STA $d601 
38b3 : a5 1b __ LDA ACCU + 0 
38b5 : 4c 35 23 JMP $2335 ; (main.s748 + 0)
.s705:
38b8 : ad 23 bf LDA $bf23 ; (softscroll + 8)
38bb : 38 __ __ SEC
38bc : e9 02 __ SBC #$02
38be : 8d 23 bf STA $bf23 ; (softscroll + 8)
38c1 : aa __ __ TAX
.l10873:
38c2 : ad 00 d6 LDA $d600 
38c5 : 29 20 __ AND #$20
38c7 : f0 f9 __ BEQ $38c2 ; (main.l10873 + 0)
.s708:
38c9 : a9 19 __ LDA #$19
38cb : 8d 00 d6 STA $d600 
38ce : 8a __ __ TXA
38cf : 18 __ __ CLC
38d0 : 6d 25 bf ADC $bf25 ; (softscroll + 10)
38d3 : 4c ab 38 JMP $38ab ; (main.l10874 + 0)
.s653:
38d6 : a9 00 __ LDA #$00
38d8 : 8d 23 bf STA $bf23 ; (softscroll + 8)
38db : ad 20 bf LDA $bf20 ; (softscroll + 5)
38de : 18 __ __ CLC
38df : 69 ff __ ADC #$ff
38e1 : 85 5d __ STA T6 + 0 
38e3 : 8d 20 bf STA $bf20 ; (softscroll + 5)
38e6 : ad 21 bf LDA $bf21 ; (softscroll + 6)
38e9 : 69 ff __ ADC #$ff
38eb : 85 5e __ STA T6 + 1 
38ed : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l10856:
38f0 : ad 00 d6 LDA $d600 
38f3 : 29 20 __ AND #$20
38f5 : d0 f9 __ BNE $38f0 ; (main.l10856 + 0)
.s656:
38f7 : ad 00 59 LDA $5900 ; (vdc_state + 10)
38fa : 18 __ __ CLC
38fb : 65 5d __ ADC T6 + 0 
38fd : aa __ __ TAX
38fe : ad 01 59 LDA $5901 ; (vdc_state + 11)
3901 : 65 5e __ ADC T6 + 1 
3903 : a8 __ __ TAY
3904 : ad fe 58 LDA $58fe ; (vdc_state + 8)
3907 : 18 __ __ CLC
3908 : 65 5d __ ADC T6 + 0 
390a : 85 5d __ STA T6 + 0 
390c : a9 0c __ LDA #$0c
390e : 8d 00 d6 STA $d600 
3911 : ad ff 58 LDA $58ff ; (vdc_state + 9)
3914 : 65 5e __ ADC T6 + 1 
.l10858:
3916 : 2c 00 d6 BIT $d600 
3919 : 10 fb __ BPL $3916 ; (main.l10858 + 0)
.s664:
391b : 8d 01 d6 STA $d601 
391e : a9 0d __ LDA #$0d
3920 : 8d 00 d6 STA $d600 
.l10860:
3923 : 2c 00 d6 BIT $d600 
3926 : 10 fb __ BPL $3923 ; (main.l10860 + 0)
.s669:
3928 : a5 5d __ LDA T6 + 0 
392a : 8d 01 d6 STA $d601 
392d : a9 14 __ LDA #$14
392f : 8d 00 d6 STA $d600 
.l10862:
3932 : 2c 00 d6 BIT $d600 
3935 : 10 fb __ BPL $3932 ; (main.l10862 + 0)
.s674:
3937 : 8c 01 d6 STY $d601 
393a : a9 15 __ LDA #$15
393c : 8d 00 d6 STA $d600 
.l10864:
393f : 2c 00 d6 BIT $d600 
3942 : 10 fb __ BPL $393f ; (main.l10864 + 0)
.s679:
3944 : 8e 01 d6 STX $d601 
.l10866:
3947 : ad 00 d6 LDA $d600 
394a : 29 20 __ AND #$20
394c : f0 f9 __ BEQ $3947 ; (main.l10866 + 0)
.l685:
394e : ad 00 d6 LDA $d600 
3951 : 29 20 __ AND #$20
3953 : d0 f9 __ BNE $394e ; (main.l685 + 0)
.s680:
3955 : a9 19 __ LDA #$19
3957 : 8d 00 d6 STA $d600 
395a : ae 25 bf LDX $bf25 ; (softscroll + 10)
.l10868:
395d : 2c 00 d6 BIT $d600 
3960 : 10 fb __ BPL $395d ; (main.l10868 + 0)
.s691:
3962 : 8a __ __ TXA
3963 : 4c 00 23 JMP $2300 ; (main.s1660 + 0)
.l600:
3966 : ad 00 d6 LDA $d600 
3969 : 29 20 __ AND #$20
396b : f0 f9 __ BEQ $3966 ; (main.l600 + 0)
.l609:
396d : ad 00 d6 LDA $d600 
3970 : 29 20 __ AND #$20
3972 : d0 f9 __ BNE $396d ; (main.l609 + 0)
.s604:
3974 : 8a __ __ TXA
3975 : 18 __ __ CLC
3976 : 69 02 __ ADC #$02
3978 : 8d 28 bf STA $bf28 ; (softscroll + 13)
397b : 90 01 __ BCC $397e ; (main.s1707 + 0)
.s1706:
397d : c8 __ __ INY
.s1707:
397e : 8c 29 bf STY $bf29 ; (softscroll + 14)
3981 : ee 22 bf INC $bf22 ; (softscroll + 7)
3984 : ee 22 bf INC $bf22 ; (softscroll + 7)
3987 : a9 06 __ LDA #$06
3989 : cd 22 bf CMP $bf22 ; (softscroll + 7)
398c : a9 18 __ LDA #$18
398e : 8d 00 d6 STA $d600 
3991 : ae 24 bf LDX $bf24 ; (softscroll + 9)
3994 : 90 10 __ BCC $39a6 ; (main.s611 + 0)
.s612:
3996 : 8a __ __ TXA
3997 : 18 __ __ CLC
3998 : 6d 22 bf ADC $bf22 ; (softscroll + 7)
.l10926:
399b : 2c 00 d6 BIT $d600 
399e : 10 fb __ BPL $399b ; (main.l10926 + 0)
.s1659:
39a0 : 8d 01 d6 STA $d601 
39a3 : 4c c0 22 JMP $22c0 ; (main.s598 + 0)
.s611:
39a6 : a9 00 __ LDA #$00
39a8 : 8d 22 bf STA $bf22 ; (softscroll + 7)
39ab : ad 20 bf LDA $bf20 ; (softscroll + 5)
39ae : 6d 1e bf ADC $bf1e ; (softscroll + 3)
39b1 : 85 5d __ STA T6 + 0 
39b3 : 8d 20 bf STA $bf20 ; (softscroll + 5)
39b6 : ad 21 bf LDA $bf21 ; (softscroll + 6)
39b9 : 69 00 __ ADC #$00
39bb : 85 5e __ STA T6 + 1 
39bd : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l10843:
39c0 : 2c 00 d6 BIT $d600 
39c3 : 10 fb __ BPL $39c0 ; (main.l10843 + 0)
.s618:
39c5 : 8e 01 d6 STX $d601 
39c8 : ad 00 59 LDA $5900 ; (vdc_state + 10)
39cb : 18 __ __ CLC
39cc : 65 5d __ ADC T6 + 0 
39ce : aa __ __ TAX
39cf : ad 01 59 LDA $5901 ; (vdc_state + 11)
39d2 : 65 5e __ ADC T6 + 1 
39d4 : a8 __ __ TAY
39d5 : ad fe 58 LDA $58fe ; (vdc_state + 8)
39d8 : 18 __ __ CLC
39d9 : 65 5d __ ADC T6 + 0 
39db : 85 5d __ STA T6 + 0 
39dd : a9 0c __ LDA #$0c
39df : 8d 00 d6 STA $d600 
39e2 : ad ff 58 LDA $58ff ; (vdc_state + 9)
39e5 : 65 5e __ ADC T6 + 1 
.l10845:
39e7 : 2c 00 d6 BIT $d600 
39ea : 10 fb __ BPL $39e7 ; (main.l10845 + 0)
.s624:
39ec : 8d 01 d6 STA $d601 
39ef : a9 0d __ LDA #$0d
39f1 : 8d 00 d6 STA $d600 
.l10847:
39f4 : 2c 00 d6 BIT $d600 
39f7 : 10 fb __ BPL $39f4 ; (main.l10847 + 0)
.s629:
39f9 : a5 5d __ LDA T6 + 0 
39fb : 8d 01 d6 STA $d601 
39fe : a9 14 __ LDA #$14
3a00 : 8d 00 d6 STA $d600 
.l10849:
3a03 : 2c 00 d6 BIT $d600 
3a06 : 10 fb __ BPL $3a03 ; (main.l10849 + 0)
.s634:
3a08 : 8c 01 d6 STY $d601 
3a0b : a9 15 __ LDA #$15
3a0d : 8d 00 d6 STA $d600 
.l10851:
3a10 : 2c 00 d6 BIT $d600 
3a13 : 10 fb __ BPL $3a10 ; (main.l10851 + 0)
.s639:
3a15 : 8a __ __ TXA
3a16 : 4c a0 39 JMP $39a0 ; (main.s1659 + 0)
.l548:
3a19 : ad 00 d6 LDA $d600 
3a1c : 29 20 __ AND #$20
3a1e : f0 f9 __ BEQ $3a19 ; (main.l548 + 0)
.l557:
3a20 : ad 00 d6 LDA $d600 
3a23 : 29 20 __ AND #$20
3a25 : d0 f9 __ BNE $3a20 ; (main.l557 + 0)
.s552:
3a27 : 8a __ __ TXA
3a28 : 38 __ __ SEC
3a29 : e9 02 __ SBC #$02
3a2b : 8d 28 bf STA $bf28 ; (softscroll + 13)
3a2e : a5 5e __ LDA T6 + 1 
3a30 : e9 00 __ SBC #$00
3a32 : 8d 29 bf STA $bf29 ; (softscroll + 14)
3a35 : a9 01 __ LDA #$01
3a37 : cd 22 bf CMP $bf22 ; (softscroll + 7)
3a3a : b0 03 __ BCS $3a3f ; (main.s560 + 0)
3a3c : 4c c9 3a JMP $3ac9 ; (main.s559 + 0)
.s560:
3a3f : a9 06 __ LDA #$06
3a41 : 8d 22 bf STA $bf22 ; (softscroll + 7)
3a44 : ad 20 bf LDA $bf20 ; (softscroll + 5)
3a47 : ed 1e bf SBC $bf1e ; (softscroll + 3)
3a4a : 85 5d __ STA T6 + 0 
3a4c : 8d 20 bf STA $bf20 ; (softscroll + 5)
3a4f : ad 21 bf LDA $bf21 ; (softscroll + 6)
3a52 : e9 00 __ SBC #$00
3a54 : 85 5e __ STA T6 + 1 
3a56 : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l10930:
3a59 : ad 00 d6 LDA $d600 
3a5c : 29 20 __ AND #$20
3a5e : d0 f9 __ BNE $3a59 ; (main.l10930 + 0)
.s567:
3a60 : a9 18 __ LDA #$18
3a62 : 8d 00 d6 STA $d600 
3a65 : ad 24 bf LDA $bf24 ; (softscroll + 9)
3a68 : 18 __ __ CLC
3a69 : 69 06 __ ADC #$06
.l10932:
3a6b : 2c 00 d6 BIT $d600 
3a6e : 10 fb __ BPL $3a6b ; (main.l10932 + 0)
.s574:
3a70 : 8d 01 d6 STA $d601 
3a73 : ad 00 59 LDA $5900 ; (vdc_state + 10)
3a76 : 18 __ __ CLC
3a77 : 65 5d __ ADC T6 + 0 
3a79 : aa __ __ TAX
3a7a : ad 01 59 LDA $5901 ; (vdc_state + 11)
3a7d : 65 5e __ ADC T6 + 1 
3a7f : a8 __ __ TAY
3a80 : ad fe 58 LDA $58fe ; (vdc_state + 8)
3a83 : 18 __ __ CLC
3a84 : 65 5d __ ADC T6 + 0 
3a86 : 85 5d __ STA T6 + 0 
3a88 : a9 0c __ LDA #$0c
3a8a : 8d 00 d6 STA $d600 
3a8d : ad ff 58 LDA $58ff ; (vdc_state + 9)
3a90 : 65 5e __ ADC T6 + 1 
.l10934:
3a92 : 2c 00 d6 BIT $d600 
3a95 : 10 fb __ BPL $3a92 ; (main.l10934 + 0)
.s580:
3a97 : 8d 01 d6 STA $d601 
3a9a : a9 0d __ LDA #$0d
3a9c : 8d 00 d6 STA $d600 
.l10936:
3a9f : 2c 00 d6 BIT $d600 
3aa2 : 10 fb __ BPL $3a9f ; (main.l10936 + 0)
.s585:
3aa4 : a5 5d __ LDA T6 + 0 
3aa6 : 8d 01 d6 STA $d601 
3aa9 : a9 14 __ LDA #$14
3aab : 8d 00 d6 STA $d600 
.l10938:
3aae : 2c 00 d6 BIT $d600 
3ab1 : 10 fb __ BPL $3aae ; (main.l10938 + 0)
.s590:
3ab3 : 8c 01 d6 STY $d601 
3ab6 : a9 15 __ LDA #$15
3ab8 : 8d 00 d6 STA $d600 
.l10940:
3abb : 2c 00 d6 BIT $d600 
3abe : 10 fb __ BPL $3abb ; (main.l10940 + 0)
.s595:
3ac0 : 8a __ __ TXA
.s1658:
3ac1 : 8d 01 d6 STA $d601 
3ac4 : a5 1b __ LDA ACCU + 0 
3ac6 : 4c 99 22 JMP $2299 ; (main.s599 + 0)
.s559:
3ac9 : ce 22 bf DEC $bf22 ; (softscroll + 7)
3acc : ce 22 bf DEC $bf22 ; (softscroll + 7)
3acf : a9 18 __ LDA #$18
3ad1 : 8d 00 d6 STA $d600 
3ad4 : ad 22 bf LDA $bf22 ; (softscroll + 7)
3ad7 : 6d 24 bf ADC $bf24 ; (softscroll + 9)
.l10837:
3ada : 2c 00 d6 BIT $d600 
3add : 10 fb __ BPL $3ada ; (main.l10837 + 0)
3adf : 4c c1 3a JMP $3ac1 ; (main.s1658 + 0)
.l408:
3ae2 : 0a __ __ ASL
3ae3 : aa __ __ TAX
3ae4 : ad fd 58 LDA $58fd ; (vdc_state + 7)
3ae7 : 85 62 __ STA T9 + 0 
3ae9 : a9 12 __ LDA #$12
3aeb : 8d 00 d6 STA $d600 
3aee : a5 5b __ LDA T5 + 0 
3af0 : 38 __ __ SEC
3af1 : e9 01 __ SBC #$01
3af3 : 85 66 __ STA T12 + 0 
3af5 : bd 0f 59 LDA $590f,x ; (multab + 0)
3af8 : 85 5d __ STA T6 + 0 
3afa : 18 __ __ CLC
3afb : 6d fe 58 ADC $58fe ; (vdc_state + 8)
3afe : a8 __ __ TAY
3aff : bd 10 59 LDA $5910,x ; (multab + 1)
3b02 : 85 5e __ STA T6 + 1 
3b04 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l10788:
3b07 : 2c 00 d6 BIT $d600 
3b0a : 10 fb __ BPL $3b07 ; (main.l10788 + 0)
.s420:
3b0c : 8d 01 d6 STA $d601 
3b0f : a9 13 __ LDA #$13
3b11 : 8d 00 d6 STA $d600 
.l10790:
3b14 : 2c 00 d6 BIT $d600 
3b17 : 10 fb __ BPL $3b14 ; (main.l10790 + 0)
.s425:
3b19 : 8c 01 d6 STY $d601 
3b1c : a9 1f __ LDA #$1f
3b1e : 8d 00 d6 STA $d600 
.l10792:
3b21 : 2c 00 d6 BIT $d600 
3b24 : 10 fb __ BPL $3b21 ; (main.l10792 + 0)
.s429:
3b26 : a9 20 __ LDA #$20
3b28 : 8d 01 d6 STA $d601 
3b2b : a9 18 __ LDA #$18
3b2d : 8d 00 d6 STA $d600 
.l10794:
3b30 : 2c 00 d6 BIT $d600 
3b33 : 10 fb __ BPL $3b30 ; (main.l10794 + 0)
.s435:
3b35 : ad 01 d6 LDA $d601 
3b38 : 29 7f __ AND #$7f
3b3a : a8 __ __ TAY
3b3b : a9 18 __ LDA #$18
3b3d : 8d 00 d6 STA $d600 
.l10796:
3b40 : 2c 00 d6 BIT $d600 
3b43 : 10 fb __ BPL $3b40 ; (main.l10796 + 0)
.s441:
3b45 : 8c 01 d6 STY $d601 
3b48 : a9 1e __ LDA #$1e
3b4a : 8d 00 d6 STA $d600 
.l10798:
3b4d : 2c 00 d6 BIT $d600 
3b50 : 10 fb __ BPL $3b4d ; (main.l10798 + 0)
.s446:
3b52 : a5 66 __ LDA T12 + 0 
3b54 : 8d 01 d6 STA $d601 
3b57 : ad 00 59 LDA $5900 ; (vdc_state + 10)
3b5a : 18 __ __ CLC
3b5b : 65 5d __ ADC T6 + 0 
3b5d : aa __ __ TAX
3b5e : a9 12 __ LDA #$12
3b60 : 8d 00 d6 STA $d600 
3b63 : ad 01 59 LDA $5901 ; (vdc_state + 11)
3b66 : 65 5e __ ADC T6 + 1 
.l10800:
3b68 : 2c 00 d6 BIT $d600 
3b6b : 10 fb __ BPL $3b68 ; (main.l10800 + 0)
.s453:
3b6d : 8d 01 d6 STA $d601 
3b70 : a9 13 __ LDA #$13
3b72 : 8d 00 d6 STA $d600 
.l10802:
3b75 : 2c 00 d6 BIT $d600 
3b78 : 10 fb __ BPL $3b75 ; (main.l10802 + 0)
.s458:
3b7a : 8e 01 d6 STX $d601 
3b7d : a9 1f __ LDA #$1f
3b7f : 8d 00 d6 STA $d600 
.l10804:
3b82 : 2c 00 d6 BIT $d600 
3b85 : 10 fb __ BPL $3b82 ; (main.l10804 + 0)
.s462:
3b87 : a5 62 __ LDA T9 + 0 
3b89 : 8d 01 d6 STA $d601 
3b8c : a9 18 __ LDA #$18
3b8e : 8d 00 d6 STA $d600 
.l10806:
3b91 : 2c 00 d6 BIT $d600 
3b94 : 10 fb __ BPL $3b91 ; (main.l10806 + 0)
.s468:
3b96 : ad 01 d6 LDA $d601 
3b99 : 29 7f __ AND #$7f
3b9b : aa __ __ TAX
3b9c : a9 18 __ LDA #$18
3b9e : 8d 00 d6 STA $d600 
.l10808:
3ba1 : 2c 00 d6 BIT $d600 
3ba4 : 10 fb __ BPL $3ba1 ; (main.l10808 + 0)
.s474:
3ba6 : 8e 01 d6 STX $d601 
3ba9 : a9 1e __ LDA #$1e
3bab : 8d 00 d6 STA $d600 
.l10810:
3bae : 2c 00 d6 BIT $d600 
3bb1 : 10 fb __ BPL $3bae ; (main.l10810 + 0)
.s479:
3bb3 : a5 66 __ LDA T12 + 0 
3bb5 : 8d 01 d6 STA $d601 
3bb8 : e6 61 __ INC T8 + 0 
3bba : a5 61 __ LDA T8 + 0 
3bbc : c5 5f __ CMP T7 + 0 
3bbe : b0 03 __ BCS $3bc3 ; (main.s479 + 16)
3bc0 : 4c e2 3a JMP $3ae2 ; (main.l408 + 0)
3bc3 : 4c 55 21 JMP $2155 ; (main.s405 + 0)
.s299:
3bc6 : 0a __ __ ASL
3bc7 : aa __ __ TAX
3bc8 : ad fd 58 LDA $58fd ; (vdc_state + 7)
3bcb : 85 56 __ STA T2 + 0 
3bcd : a9 12 __ LDA #$12
3bcf : 8d 00 d6 STA $d600 
3bd2 : a5 54 __ LDA T1 + 0 
3bd4 : 38 __ __ SEC
3bd5 : e9 01 __ SBC #$01
3bd7 : 85 5d __ STA T6 + 0 
3bd9 : bd 0f 59 LDA $590f,x ; (multab + 0)
3bdc : 85 59 __ STA T4 + 0 
3bde : 18 __ __ CLC
3bdf : 6d fe 58 ADC $58fe ; (vdc_state + 8)
3be2 : a8 __ __ TAY
3be3 : bd 10 59 LDA $5910,x ; (multab + 1)
3be6 : 85 5a __ STA T4 + 1 
3be8 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l10975:
3beb : 2c 00 d6 BIT $d600 
3bee : 10 fb __ BPL $3beb ; (main.l10975 + 0)
.s311:
3bf0 : 8d 01 d6 STA $d601 
3bf3 : a9 13 __ LDA #$13
3bf5 : 8d 00 d6 STA $d600 
.l10977:
3bf8 : 2c 00 d6 BIT $d600 
3bfb : 10 fb __ BPL $3bf8 ; (main.l10977 + 0)
.s316:
3bfd : 8c 01 d6 STY $d601 
3c00 : a9 1f __ LDA #$1f
3c02 : 8d 00 d6 STA $d600 
.l10979:
3c05 : 2c 00 d6 BIT $d600 
3c08 : 10 fb __ BPL $3c05 ; (main.l10979 + 0)
.s320:
3c0a : a9 20 __ LDA #$20
3c0c : 8d 01 d6 STA $d601 
3c0f : a9 18 __ LDA #$18
3c11 : 8d 00 d6 STA $d600 
.l10981:
3c14 : 2c 00 d6 BIT $d600 
3c17 : 10 fb __ BPL $3c14 ; (main.l10981 + 0)
.s326:
3c19 : ad 01 d6 LDA $d601 
3c1c : 29 7f __ AND #$7f
3c1e : a8 __ __ TAY
3c1f : a9 18 __ LDA #$18
3c21 : 8d 00 d6 STA $d600 
.l10983:
3c24 : 2c 00 d6 BIT $d600 
3c27 : 10 fb __ BPL $3c24 ; (main.l10983 + 0)
.s332:
3c29 : 8c 01 d6 STY $d601 
3c2c : a9 1e __ LDA #$1e
3c2e : 8d 00 d6 STA $d600 
.l10985:
3c31 : 2c 00 d6 BIT $d600 
3c34 : 10 fb __ BPL $3c31 ; (main.l10985 + 0)
.s337:
3c36 : a5 5d __ LDA T6 + 0 
3c38 : 8d 01 d6 STA $d601 
3c3b : ad 00 59 LDA $5900 ; (vdc_state + 10)
3c3e : 18 __ __ CLC
3c3f : 65 59 __ ADC T4 + 0 
3c41 : aa __ __ TAX
3c42 : a9 12 __ LDA #$12
3c44 : 8d 00 d6 STA $d600 
3c47 : ad 01 59 LDA $5901 ; (vdc_state + 11)
3c4a : 65 5a __ ADC T4 + 1 
.l10987:
3c4c : 2c 00 d6 BIT $d600 
3c4f : 10 fb __ BPL $3c4c ; (main.l10987 + 0)
.s344:
3c51 : 8d 01 d6 STA $d601 
3c54 : a9 13 __ LDA #$13
3c56 : 8d 00 d6 STA $d600 
.l10989:
3c59 : 2c 00 d6 BIT $d600 
3c5c : 10 fb __ BPL $3c59 ; (main.l10989 + 0)
.s349:
3c5e : 8e 01 d6 STX $d601 
3c61 : a9 1f __ LDA #$1f
3c63 : 8d 00 d6 STA $d600 
.l10991:
3c66 : 2c 00 d6 BIT $d600 
3c69 : 10 fb __ BPL $3c66 ; (main.l10991 + 0)
.s353:
3c6b : a5 56 __ LDA T2 + 0 
3c6d : 8d 01 d6 STA $d601 
3c70 : a9 18 __ LDA #$18
3c72 : 8d 00 d6 STA $d600 
.l10993:
3c75 : 2c 00 d6 BIT $d600 
3c78 : 10 fb __ BPL $3c75 ; (main.l10993 + 0)
.s359:
3c7a : ad 01 d6 LDA $d601 
3c7d : 29 7f __ AND #$7f
3c7f : aa __ __ TAX
3c80 : a9 18 __ LDA #$18
3c82 : 8d 00 d6 STA $d600 
.l10995:
3c85 : 2c 00 d6 BIT $d600 
3c88 : 10 fb __ BPL $3c85 ; (main.l10995 + 0)
.s365:
3c8a : 8e 01 d6 STX $d601 
3c8d : a9 1e __ LDA #$1e
3c8f : 8d 00 d6 STA $d600 
.l10997:
3c92 : 2c 00 d6 BIT $d600 
3c95 : 10 fb __ BPL $3c92 ; (main.l10997 + 0)
.s370:
3c97 : a5 5d __ LDA T6 + 0 
3c99 : 8d 01 d6 STA $d601 
3c9c : e6 53 __ INC T0 + 0 
3c9e : 4c 7c 1f JMP $1f7c ; (main.l298 + 0)
.s101:
3ca1 : 0a __ __ ASL
3ca2 : aa __ __ TAX
3ca3 : ad fd 58 LDA $58fd ; (vdc_state + 7)
3ca6 : 85 56 __ STA T2 + 0 
3ca8 : a9 12 __ LDA #$12
3caa : 8d 00 d6 STA $d600 
3cad : a5 54 __ LDA T1 + 0 
3caf : 38 __ __ SEC
3cb0 : e9 01 __ SBC #$01
3cb2 : 85 5d __ STA T6 + 0 
3cb4 : bd 0f 59 LDA $590f,x ; (multab + 0)
3cb7 : 85 59 __ STA T4 + 0 
3cb9 : 18 __ __ CLC
3cba : 6d fe 58 ADC $58fe ; (vdc_state + 8)
3cbd : a8 __ __ TAY
3cbe : bd 10 59 LDA $5910,x ; (multab + 1)
3cc1 : 85 5a __ STA T4 + 1 
3cc3 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l10404:
3cc6 : 2c 00 d6 BIT $d600 
3cc9 : 10 fb __ BPL $3cc6 ; (main.l10404 + 0)
.s113:
3ccb : 8d 01 d6 STA $d601 
3cce : a9 13 __ LDA #$13
3cd0 : 8d 00 d6 STA $d600 
.l10406:
3cd3 : 2c 00 d6 BIT $d600 
3cd6 : 10 fb __ BPL $3cd3 ; (main.l10406 + 0)
.s118:
3cd8 : 8c 01 d6 STY $d601 
3cdb : a9 1f __ LDA #$1f
3cdd : 8d 00 d6 STA $d600 
.l10408:
3ce0 : 2c 00 d6 BIT $d600 
3ce3 : 10 fb __ BPL $3ce0 ; (main.l10408 + 0)
.s122:
3ce5 : a9 20 __ LDA #$20
3ce7 : 8d 01 d6 STA $d601 
3cea : a9 18 __ LDA #$18
3cec : 8d 00 d6 STA $d600 
.l10410:
3cef : 2c 00 d6 BIT $d600 
3cf2 : 10 fb __ BPL $3cef ; (main.l10410 + 0)
.s128:
3cf4 : ad 01 d6 LDA $d601 
3cf7 : 29 7f __ AND #$7f
3cf9 : a8 __ __ TAY
3cfa : a9 18 __ LDA #$18
3cfc : 8d 00 d6 STA $d600 
.l10412:
3cff : 2c 00 d6 BIT $d600 
3d02 : 10 fb __ BPL $3cff ; (main.l10412 + 0)
.s134:
3d04 : 8c 01 d6 STY $d601 
3d07 : a9 1e __ LDA #$1e
3d09 : 8d 00 d6 STA $d600 
.l10414:
3d0c : 2c 00 d6 BIT $d600 
3d0f : 10 fb __ BPL $3d0c ; (main.l10414 + 0)
.s139:
3d11 : a5 5d __ LDA T6 + 0 
3d13 : 8d 01 d6 STA $d601 
3d16 : ad 00 59 LDA $5900 ; (vdc_state + 10)
3d19 : 18 __ __ CLC
3d1a : 65 59 __ ADC T4 + 0 
3d1c : aa __ __ TAX
3d1d : a9 12 __ LDA #$12
3d1f : 8d 00 d6 STA $d600 
3d22 : ad 01 59 LDA $5901 ; (vdc_state + 11)
3d25 : 65 5a __ ADC T4 + 1 
.l10416:
3d27 : 2c 00 d6 BIT $d600 
3d2a : 10 fb __ BPL $3d27 ; (main.l10416 + 0)
.s146:
3d2c : 8d 01 d6 STA $d601 
3d2f : a9 13 __ LDA #$13
3d31 : 8d 00 d6 STA $d600 
.l10418:
3d34 : 2c 00 d6 BIT $d600 
3d37 : 10 fb __ BPL $3d34 ; (main.l10418 + 0)
.s151:
3d39 : 8e 01 d6 STX $d601 
3d3c : a9 1f __ LDA #$1f
3d3e : 8d 00 d6 STA $d600 
.l10420:
3d41 : 2c 00 d6 BIT $d600 
3d44 : 10 fb __ BPL $3d41 ; (main.l10420 + 0)
.s155:
3d46 : a5 56 __ LDA T2 + 0 
3d48 : 8d 01 d6 STA $d601 
3d4b : a9 18 __ LDA #$18
3d4d : 8d 00 d6 STA $d600 
.l10422:
3d50 : 2c 00 d6 BIT $d600 
3d53 : 10 fb __ BPL $3d50 ; (main.l10422 + 0)
.s161:
3d55 : ad 01 d6 LDA $d601 
3d58 : 29 7f __ AND #$7f
3d5a : aa __ __ TAX
3d5b : a9 18 __ LDA #$18
3d5d : 8d 00 d6 STA $d600 
.l10424:
3d60 : 2c 00 d6 BIT $d600 
3d63 : 10 fb __ BPL $3d60 ; (main.l10424 + 0)
.s167:
3d65 : 8e 01 d6 STX $d601 
3d68 : a9 1e __ LDA #$1e
3d6a : 8d 00 d6 STA $d600 
.l10426:
3d6d : 2c 00 d6 BIT $d600 
3d70 : 10 fb __ BPL $3d6d ; (main.l10426 + 0)
.s172:
3d72 : a5 5d __ LDA T6 + 0 
3d74 : 8d 01 d6 STA $d601 
3d77 : e6 53 __ INC T0 + 0 
3d79 : 4c d5 1d JMP $1dd5 ; (main.l100 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
3d7c : a2 03 __ LDX #$03
3d7e : b5 53 __ LDA T8 + 0,x 
3d80 : 9d b2 bf STA $bfb2,x ; (nouns + 33)
3d83 : ca __ __ DEX
3d84 : 10 f8 __ BPL $3d7e ; (printf.s1000 + 2)
.s0:
3d86 : 18 __ __ CLC
3d87 : a5 23 __ LDA SP + 0 
3d89 : 69 04 __ ADC #$04
3d8b : 85 47 __ STA T0 + 0 
3d8d : a5 24 __ LDA SP + 1 
3d8f : 69 00 __ ADC #$00
3d91 : 85 48 __ STA T0 + 1 
3d93 : a9 00 __ LDA #$00
3d95 : 85 49 __ STA T2 + 0 
3d97 : a0 02 __ LDY #$02
3d99 : b1 23 __ LDA (SP + 0),y 
3d9b : 85 4a __ STA T3 + 0 
3d9d : c8 __ __ INY
3d9e : b1 23 __ LDA (SP + 0),y 
3da0 : 85 4b __ STA T3 + 1 
.l2:
3da2 : a0 00 __ LDY #$00
3da4 : b1 4a __ LDA (T3 + 0),y 
3da6 : d0 1e __ BNE $3dc6 ; (printf.s3 + 0)
.s4:
3da8 : a6 49 __ LDX T2 + 0 
3daa : 9d be bf STA $bfbe,x ; (nouns + 45)
3dad : 8a __ __ TXA
3dae : f0 0b __ BEQ $3dbb ; (printf.s1001 + 0)
.s117:
3db0 : a9 be __ LDA #$be
3db2 : 85 0d __ STA P0 ; (fmt + 0)
3db4 : a9 bf __ LDA #$bf
3db6 : 85 0e __ STA P1 ; (fmt + 1)
3db8 : 20 cc 40 JSR $40cc ; (puts.s0 + 0)
.s1001:
3dbb : a2 03 __ LDX #$03
3dbd : bd b2 bf LDA $bfb2,x ; (nouns + 33)
3dc0 : 95 53 __ STA T8 + 0,x 
3dc2 : ca __ __ DEX
3dc3 : 10 f8 __ BPL $3dbd ; (printf.s1001 + 2)
3dc5 : 60 __ __ RTS
.s3:
3dc6 : c9 25 __ CMP #$25
3dc8 : f0 28 __ BEQ $3df2 ; (printf.s5 + 0)
.s6:
3dca : a6 49 __ LDX T2 + 0 
3dcc : 9d be bf STA $bfbe,x ; (nouns + 45)
3dcf : e6 4a __ INC T3 + 0 
3dd1 : d0 02 __ BNE $3dd5 ; (printf.s1098 + 0)
.s1097:
3dd3 : e6 4b __ INC T3 + 1 
.s1098:
3dd5 : e8 __ __ INX
3dd6 : 86 49 __ STX T2 + 0 
3dd8 : e0 28 __ CPX #$28
3dda : 90 c6 __ BCC $3da2 ; (printf.l2 + 0)
.s111:
3ddc : a9 be __ LDA #$be
3dde : 85 0d __ STA P0 ; (fmt + 0)
3de0 : a9 bf __ LDA #$bf
3de2 : 85 0e __ STA P1 ; (fmt + 1)
3de4 : 98 __ __ TYA
3de5 : 9d be bf STA $bfbe,x ; (nouns + 45)
3de8 : 20 cc 40 JSR $40cc ; (puts.s0 + 0)
3deb : a9 00 __ LDA #$00
.s1068:
3ded : 85 49 __ STA T2 + 0 
3def : 4c a2 3d JMP $3da2 ; (printf.l2 + 0)
.s5:
3df2 : a5 49 __ LDA T2 + 0 
3df4 : f0 15 __ BEQ $3e0b ; (printf.s10 + 0)
.s8:
3df6 : a9 be __ LDA #$be
3df8 : 85 0d __ STA P0 ; (fmt + 0)
3dfa : a9 bf __ LDA #$bf
3dfc : 85 0e __ STA P1 ; (fmt + 1)
3dfe : 98 __ __ TYA
3dff : a6 49 __ LDX T2 + 0 
3e01 : 9d be bf STA $bfbe,x ; (nouns + 45)
3e04 : 20 cc 40 JSR $40cc ; (puts.s0 + 0)
3e07 : a9 00 __ LDA #$00
3e09 : 85 49 __ STA T2 + 0 
.s10:
3e0b : a9 0a __ LDA #$0a
3e0d : 8d b9 bf STA $bfb9 ; (nouns + 40)
3e10 : a9 00 __ LDA #$00
3e12 : 8d ba bf STA $bfba ; (nouns + 41)
3e15 : 8d bb bf STA $bfbb ; (nouns + 42)
3e18 : 8d bc bf STA $bfbc ; (nouns + 43)
3e1b : 8d bd bf STA $bfbd ; (nouns + 44)
3e1e : a0 01 __ LDY #$01
3e20 : b1 4a __ LDA (T3 + 0),y 
3e22 : aa __ __ TAX
3e23 : a9 20 __ LDA #$20
3e25 : 8d b6 bf STA $bfb6 ; (nouns + 37)
3e28 : a9 00 __ LDA #$00
3e2a : 8d b7 bf STA $bfb7 ; (nouns + 38)
3e2d : a9 ff __ LDA #$ff
3e2f : 8d b8 bf STA $bfb8 ; (nouns + 39)
3e32 : 18 __ __ CLC
3e33 : a5 4a __ LDA T3 + 0 
3e35 : 69 02 __ ADC #$02
.l15:
3e37 : 85 4a __ STA T3 + 0 
3e39 : 90 02 __ BCC $3e3d ; (printf.s1080 + 0)
.s1079:
3e3b : e6 4b __ INC T3 + 1 
.s1080:
3e3d : 8a __ __ TXA
3e3e : e0 2b __ CPX #$2b
3e40 : d0 08 __ BNE $3e4a ; (printf.s18 + 0)
.s17:
3e42 : a9 01 __ LDA #$01
3e44 : 8d bb bf STA $bfbb ; (nouns + 42)
3e47 : 4c bf 40 JMP $40bf ; (printf.s246 + 0)
.s18:
3e4a : c9 30 __ CMP #$30
3e4c : d0 06 __ BNE $3e54 ; (printf.s21 + 0)
.s20:
3e4e : 8d b6 bf STA $bfb6 ; (nouns + 37)
3e51 : 4c bf 40 JMP $40bf ; (printf.s246 + 0)
.s21:
3e54 : e0 23 __ CPX #$23
3e56 : d0 08 __ BNE $3e60 ; (printf.s24 + 0)
.s23:
3e58 : a9 01 __ LDA #$01
3e5a : 8d bd bf STA $bfbd ; (nouns + 44)
3e5d : 4c bf 40 JMP $40bf ; (printf.s246 + 0)
.s24:
3e60 : e0 2d __ CPX #$2d
3e62 : d0 08 __ BNE $3e6c ; (printf.s16 + 0)
.s26:
3e64 : a9 01 __ LDA #$01
3e66 : 8d bc bf STA $bfbc ; (nouns + 43)
3e69 : 4c bf 40 JMP $40bf ; (printf.s246 + 0)
.s16:
3e6c : 85 4c __ STA T4 + 0 
3e6e : e0 30 __ CPX #$30
3e70 : 90 53 __ BCC $3ec5 ; (printf.s32 + 0)
.s33:
3e72 : e0 3a __ CPX #$3a
3e74 : b0 4f __ BCS $3ec5 ; (printf.s32 + 0)
.s30:
3e76 : a9 00 __ LDA #$00
3e78 : 85 4d __ STA T6 + 0 
3e7a : 85 4e __ STA T6 + 1 
3e7c : e0 3a __ CPX #$3a
3e7e : b0 40 __ BCS $3ec0 ; (printf.s36 + 0)
.l35:
3e80 : a5 4d __ LDA T6 + 0 
3e82 : 0a __ __ ASL
3e83 : 85 1b __ STA ACCU + 0 
3e85 : a5 4e __ LDA T6 + 1 
3e87 : 2a __ __ ROL
3e88 : 06 1b __ ASL ACCU + 0 
3e8a : 2a __ __ ROL
3e8b : aa __ __ TAX
3e8c : 18 __ __ CLC
3e8d : a5 1b __ LDA ACCU + 0 
3e8f : 65 4d __ ADC T6 + 0 
3e91 : 85 4d __ STA T6 + 0 
3e93 : 8a __ __ TXA
3e94 : 65 4e __ ADC T6 + 1 
3e96 : 06 4d __ ASL T6 + 0 
3e98 : 2a __ __ ROL
3e99 : aa __ __ TAX
3e9a : 18 __ __ CLC
3e9b : a5 4d __ LDA T6 + 0 
3e9d : 65 4c __ ADC T4 + 0 
3e9f : 90 01 __ BCC $3ea2 ; (printf.s1094 + 0)
.s1093:
3ea1 : e8 __ __ INX
.s1094:
3ea2 : 38 __ __ SEC
3ea3 : e9 30 __ SBC #$30
3ea5 : 85 4d __ STA T6 + 0 
3ea7 : 8a __ __ TXA
3ea8 : e9 00 __ SBC #$00
3eaa : 85 4e __ STA T6 + 1 
3eac : a0 00 __ LDY #$00
3eae : b1 4a __ LDA (T3 + 0),y 
3eb0 : 85 4c __ STA T4 + 0 
3eb2 : e6 4a __ INC T3 + 0 
3eb4 : d0 02 __ BNE $3eb8 ; (printf.s1096 + 0)
.s1095:
3eb6 : e6 4b __ INC T3 + 1 
.s1096:
3eb8 : c9 30 __ CMP #$30
3eba : 90 04 __ BCC $3ec0 ; (printf.s36 + 0)
.s37:
3ebc : c9 3a __ CMP #$3a
3ebe : 90 c0 __ BCC $3e80 ; (printf.l35 + 0)
.s36:
3ec0 : a5 4d __ LDA T6 + 0 
3ec2 : 8d b7 bf STA $bfb7 ; (nouns + 38)
.s32:
3ec5 : a5 4c __ LDA T4 + 0 
3ec7 : c9 2e __ CMP #$2e
3ec9 : d0 51 __ BNE $3f1c ; (printf.s40 + 0)
.s38:
3ecb : a9 00 __ LDA #$00
3ecd : 85 4d __ STA T6 + 0 
.l231:
3ecf : 85 4e __ STA T6 + 1 
3ed1 : a0 00 __ LDY #$00
3ed3 : b1 4a __ LDA (T3 + 0),y 
3ed5 : 85 4c __ STA T4 + 0 
3ed7 : e6 4a __ INC T3 + 0 
3ed9 : d0 02 __ BNE $3edd ; (printf.s1082 + 0)
.s1081:
3edb : e6 4b __ INC T3 + 1 
.s1082:
3edd : c9 30 __ CMP #$30
3edf : 90 04 __ BCC $3ee5 ; (printf.s43 + 0)
.s44:
3ee1 : c9 3a __ CMP #$3a
3ee3 : 90 0a __ BCC $3eef ; (printf.s42 + 0)
.s43:
3ee5 : a5 4d __ LDA T6 + 0 
3ee7 : 8d b8 bf STA $bfb8 ; (nouns + 39)
3eea : a5 4c __ LDA T4 + 0 
3eec : 4c 1c 3f JMP $3f1c ; (printf.s40 + 0)
.s42:
3eef : a5 4d __ LDA T6 + 0 
3ef1 : 0a __ __ ASL
3ef2 : 85 1b __ STA ACCU + 0 
3ef4 : a5 4e __ LDA T6 + 1 
3ef6 : 2a __ __ ROL
3ef7 : 06 1b __ ASL ACCU + 0 
3ef9 : 2a __ __ ROL
3efa : aa __ __ TAX
3efb : 18 __ __ CLC
3efc : a5 1b __ LDA ACCU + 0 
3efe : 65 4d __ ADC T6 + 0 
3f00 : 85 4d __ STA T6 + 0 
3f02 : 8a __ __ TXA
3f03 : 65 4e __ ADC T6 + 1 
3f05 : 06 4d __ ASL T6 + 0 
3f07 : 2a __ __ ROL
3f08 : aa __ __ TAX
3f09 : 18 __ __ CLC
3f0a : a5 4d __ LDA T6 + 0 
3f0c : 65 4c __ ADC T4 + 0 
3f0e : 90 01 __ BCC $3f11 ; (printf.s1092 + 0)
.s1091:
3f10 : e8 __ __ INX
.s1092:
3f11 : 38 __ __ SEC
3f12 : e9 30 __ SBC #$30
3f14 : 85 4d __ STA T6 + 0 
3f16 : 8a __ __ TXA
3f17 : e9 00 __ SBC #$00
3f19 : 4c cf 3e JMP $3ecf ; (printf.l231 + 0)
.s40:
3f1c : c9 64 __ CMP #$64
3f1e : f0 04 __ BEQ $3f24 ; (printf.s45 + 0)
.s48:
3f20 : c9 44 __ CMP #$44
3f22 : d0 05 __ BNE $3f29 ; (printf.s46 + 0)
.s45:
3f24 : a9 01 __ LDA #$01
3f26 : 4c 98 40 JMP $4098 ; (printf.s247 + 0)
.s46:
3f29 : c9 75 __ CMP #$75
3f2b : d0 03 __ BNE $3f30 ; (printf.s52 + 0)
3f2d : 4c 96 40 JMP $4096 ; (printf.s269 + 0)
.s52:
3f30 : c9 55 __ CMP #$55
3f32 : d0 03 __ BNE $3f37 ; (printf.s50 + 0)
3f34 : 4c 96 40 JMP $4096 ; (printf.s269 + 0)
.s50:
3f37 : c9 78 __ CMP #$78
3f39 : f0 04 __ BEQ $3f3f ; (printf.s53 + 0)
.s56:
3f3b : c9 58 __ CMP #$58
3f3d : d0 0d __ BNE $3f4c ; (printf.s54 + 0)
.s53:
3f3f : a9 10 __ LDA #$10
3f41 : 8d b9 bf STA $bfb9 ; (nouns + 40)
3f44 : a9 00 __ LDA #$00
3f46 : 8d ba bf STA $bfba ; (nouns + 41)
3f49 : 4c 96 40 JMP $4096 ; (printf.s269 + 0)
.s54:
3f4c : c9 6c __ CMP #$6c
3f4e : d0 03 __ BNE $3f53 ; (printf.s60 + 0)
3f50 : 4c 28 40 JMP $4028 ; (printf.s57 + 0)
.s60:
3f53 : c9 4c __ CMP #$4c
3f55 : d0 03 __ BNE $3f5a ; (printf.s58 + 0)
3f57 : 4c 28 40 JMP $4028 ; (printf.s57 + 0)
.s58:
3f5a : c9 73 __ CMP #$73
3f5c : f0 39 __ BEQ $3f97 ; (printf.s73 + 0)
.s76:
3f5e : c9 53 __ CMP #$53
3f60 : f0 35 __ BEQ $3f97 ; (printf.s73 + 0)
.s74:
3f62 : c9 63 __ CMP #$63
3f64 : f0 15 __ BEQ $3f7b ; (printf.s104 + 0)
.s107:
3f66 : c9 43 __ CMP #$43
3f68 : f0 11 __ BEQ $3f7b ; (printf.s104 + 0)
.s105:
3f6a : 09 00 __ ORA #$00
3f6c : d0 03 __ BNE $3f71 ; (printf.s108 + 0)
3f6e : 4c a2 3d JMP $3da2 ; (printf.l2 + 0)
.s108:
3f71 : a6 49 __ LDX T2 + 0 
3f73 : 9d be bf STA $bfbe,x ; (nouns + 45)
3f76 : e6 49 __ INC T2 + 0 
3f78 : 4c a2 3d JMP $3da2 ; (printf.l2 + 0)
.s104:
3f7b : a0 00 __ LDY #$00
3f7d : b1 47 __ LDA (T0 + 0),y 
3f7f : a6 49 __ LDX T2 + 0 
3f81 : 9d be bf STA $bfbe,x ; (nouns + 45)
3f84 : e6 49 __ INC T2 + 0 
.s244:
3f86 : 18 __ __ CLC
3f87 : a5 47 __ LDA T0 + 0 
3f89 : 69 02 __ ADC #$02
3f8b : 85 47 __ STA T0 + 0 
3f8d : b0 03 __ BCS $3f92 ; (printf.s1083 + 0)
3f8f : 4c a2 3d JMP $3da2 ; (printf.l2 + 0)
.s1083:
3f92 : e6 48 __ INC T0 + 1 
3f94 : 4c a2 3d JMP $3da2 ; (printf.l2 + 0)
.s73:
3f97 : a0 00 __ LDY #$00
3f99 : 84 4c __ STY T4 + 0 
3f9b : b1 47 __ LDA (T0 + 0),y 
3f9d : 85 4d __ STA T6 + 0 
3f9f : c8 __ __ INY
3fa0 : b1 47 __ LDA (T0 + 0),y 
3fa2 : 85 4e __ STA T6 + 1 
3fa4 : 18 __ __ CLC
3fa5 : a5 47 __ LDA T0 + 0 
3fa7 : 69 02 __ ADC #$02
3fa9 : 85 47 __ STA T0 + 0 
3fab : 90 02 __ BCC $3faf ; (printf.s1090 + 0)
.s1089:
3fad : e6 48 __ INC T0 + 1 
.s1090:
3faf : ad b7 bf LDA $bfb7 ; (nouns + 38)
3fb2 : f0 0d __ BEQ $3fc1 ; (printf.s79 + 0)
.s1071:
3fb4 : a0 00 __ LDY #$00
3fb6 : b1 4d __ LDA (T6 + 0),y 
3fb8 : f0 05 __ BEQ $3fbf ; (printf.s1072 + 0)
.l81:
3fba : c8 __ __ INY
3fbb : b1 4d __ LDA (T6 + 0),y 
3fbd : d0 fb __ BNE $3fba ; (printf.l81 + 0)
.s1072:
3fbf : 84 4c __ STY T4 + 0 
.s79:
3fc1 : ad bc bf LDA $bfbc ; (nouns + 43)
3fc4 : d0 1a __ BNE $3fe0 ; (printf.s85 + 0)
.s1075:
3fc6 : a4 4c __ LDY T4 + 0 
3fc8 : cc b7 bf CPY $bfb7 ; (nouns + 38)
3fcb : a6 49 __ LDX T2 + 0 
3fcd : b0 0d __ BCS $3fdc ; (printf.s1076 + 0)
.l87:
3fcf : ad b6 bf LDA $bfb6 ; (nouns + 37)
3fd2 : 9d be bf STA $bfbe,x ; (nouns + 45)
3fd5 : c8 __ __ INY
3fd6 : cc b7 bf CPY $bfb7 ; (nouns + 38)
3fd9 : e8 __ __ INX
3fda : 90 f3 __ BCC $3fcf ; (printf.l87 + 0)
.s1076:
3fdc : 86 49 __ STX T2 + 0 
3fde : 84 4c __ STY T4 + 0 
.s85:
3fe0 : a5 49 __ LDA T2 + 0 
3fe2 : f0 16 __ BEQ $3ffa ; (printf.s238 + 0)
.s92:
3fe4 : a9 be __ LDA #$be
3fe6 : 85 0d __ STA P0 ; (fmt + 0)
3fe8 : a9 bf __ LDA #$bf
3fea : 85 0e __ STA P1 ; (fmt + 1)
3fec : a9 00 __ LDA #$00
3fee : a6 49 __ LDX T2 + 0 
3ff0 : 9d be bf STA $bfbe,x ; (nouns + 45)
3ff3 : 20 cc 40 JSR $40cc ; (puts.s0 + 0)
3ff6 : a9 00 __ LDA #$00
3ff8 : 85 49 __ STA T2 + 0 
.s238:
3ffa : a5 4d __ LDA T6 + 0 
3ffc : 85 0d __ STA P0 ; (fmt + 0)
3ffe : a5 4e __ LDA T6 + 1 
4000 : 85 0e __ STA P1 ; (fmt + 1)
4002 : 20 cc 40 JSR $40cc ; (puts.s0 + 0)
4005 : ad bc bf LDA $bfbc ; (nouns + 43)
4008 : d0 03 __ BNE $400d ; (printf.s1073 + 0)
400a : 4c a2 3d JMP $3da2 ; (printf.l2 + 0)
.s1073:
400d : a4 4c __ LDY T4 + 0 
400f : cc b7 bf CPY $bfb7 ; (nouns + 38)
4012 : a2 00 __ LDX #$00
4014 : b0 0d __ BCS $4023 ; (printf.s1074 + 0)
.l102:
4016 : ad b6 bf LDA $bfb6 ; (nouns + 37)
4019 : 9d be bf STA $bfbe,x ; (nouns + 45)
401c : c8 __ __ INY
401d : cc b7 bf CPY $bfb7 ; (nouns + 38)
4020 : e8 __ __ INX
4021 : 90 f3 __ BCC $4016 ; (printf.l102 + 0)
.s1074:
4023 : 86 49 __ STX T2 + 0 
4025 : 4c a2 3d JMP $3da2 ; (printf.l2 + 0)
.s57:
4028 : a0 00 __ LDY #$00
402a : b1 47 __ LDA (T0 + 0),y 
402c : 85 53 __ STA T8 + 0 
402e : c8 __ __ INY
402f : b1 47 __ LDA (T0 + 0),y 
4031 : 85 54 __ STA T8 + 1 
4033 : c8 __ __ INY
4034 : b1 47 __ LDA (T0 + 0),y 
4036 : 85 55 __ STA T8 + 2 
4038 : c8 __ __ INY
4039 : b1 47 __ LDA (T0 + 0),y 
403b : 85 56 __ STA T8 + 3 
403d : 18 __ __ CLC
403e : a5 47 __ LDA T0 + 0 
4040 : 69 04 __ ADC #$04
4042 : 85 47 __ STA T0 + 0 
4044 : 90 02 __ BCC $4048 ; (printf.s1086 + 0)
.s1085:
4046 : e6 48 __ INC T0 + 1 
.s1086:
4048 : a0 00 __ LDY #$00
404a : b1 4a __ LDA (T3 + 0),y 
404c : aa __ __ TAX
404d : e6 4a __ INC T3 + 0 
404f : d0 02 __ BNE $4053 ; (printf.s1088 + 0)
.s1087:
4051 : e6 4b __ INC T3 + 1 
.s1088:
4053 : 8a __ __ TXA
4054 : e0 64 __ CPX #$64
4056 : f0 04 __ BEQ $405c ; (printf.s61 + 0)
.s64:
4058 : c9 44 __ CMP #$44
405a : d0 04 __ BNE $4060 ; (printf.s62 + 0)
.s61:
405c : a9 01 __ LDA #$01
405e : d0 1c __ BNE $407c ; (printf.s245 + 0)
.s62:
4060 : c9 75 __ CMP #$75
4062 : f0 17 __ BEQ $407b ; (printf.s268 + 0)
.s68:
4064 : c9 55 __ CMP #$55
4066 : f0 13 __ BEQ $407b ; (printf.s268 + 0)
.s66:
4068 : c9 78 __ CMP #$78
406a : f0 07 __ BEQ $4073 ; (printf.s69 + 0)
.s72:
406c : c9 58 __ CMP #$58
406e : f0 03 __ BEQ $4073 ; (printf.s69 + 0)
4070 : 4c a2 3d JMP $3da2 ; (printf.l2 + 0)
.s69:
4073 : 8c ba bf STY $bfba ; (nouns + 41)
4076 : a9 10 __ LDA #$10
4078 : 8d b9 bf STA $bfb9 ; (nouns + 40)
.s268:
407b : 98 __ __ TYA
.s245:
407c : 85 15 __ STA P8 
407e : a9 be __ LDA #$be
4080 : 85 0f __ STA P2 ; (fmt + 2)
4082 : a9 bf __ LDA #$bf
4084 : 85 10 __ STA P3 ; (fmt + 3)
4086 : a9 b6 __ LDA #$b6
4088 : 85 0d __ STA P0 ; (fmt + 0)
408a : a9 bf __ LDA #$bf
408c : 85 0e __ STA P1 ; (fmt + 1)
408e : 20 56 42 JSR $4256 ; (nforml@proxy + 0)
4091 : a5 1b __ LDA ACCU + 0 
4093 : 4c ed 3d JMP $3ded ; (printf.s1068 + 0)
.s269:
4096 : a9 00 __ LDA #$00
.s247:
4098 : 85 13 __ STA P6 
409a : a9 be __ LDA #$be
409c : 85 0f __ STA P2 ; (fmt + 2)
409e : a9 bf __ LDA #$bf
40a0 : 85 10 __ STA P3 ; (fmt + 3)
40a2 : a0 00 __ LDY #$00
40a4 : b1 47 __ LDA (T0 + 0),y 
40a6 : 85 11 __ STA P4 
40a8 : c8 __ __ INY
40a9 : b1 47 __ LDA (T0 + 0),y 
40ab : 85 12 __ STA P5 
40ad : a9 b6 __ LDA #$b6
40af : 85 0d __ STA P0 ; (fmt + 0)
40b1 : a9 bf __ LDA #$bf
40b3 : 85 0e __ STA P1 ; (fmt + 1)
40b5 : 20 21 41 JSR $4121 ; (nformi.s0 + 0)
40b8 : a5 1b __ LDA ACCU + 0 
40ba : 85 49 __ STA T2 + 0 
40bc : 4c 86 3f JMP $3f86 ; (printf.s244 + 0)
.s246:
40bf : a0 00 __ LDY #$00
40c1 : b1 4a __ LDA (T3 + 0),y 
40c3 : aa __ __ TAX
40c4 : 18 __ __ CLC
40c5 : a5 4a __ LDA T3 + 0 
40c7 : 69 01 __ ADC #$01
40c9 : 4c 37 3e JMP $3e37 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
40cc : a0 00 __ LDY #$00
40ce : b1 0d __ LDA (P0),y 
40d0 : f0 0b __ BEQ $40dd ; (puts.s1001 + 0)
40d2 : 20 de 40 JSR $40de ; (putpch + 0)
40d5 : e6 0d __ INC P0 
40d7 : d0 f3 __ BNE $40cc ; (puts.s0 + 0)
40d9 : e6 0e __ INC P1 
40db : d0 ef __ BNE $40cc ; (puts.s0 + 0)
.s1001:
40dd : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
40de : ae fe 4e LDX $4efe ; (giocharmap + 0)
40e1 : e0 01 __ CPX #$01
40e3 : 90 26 __ BCC $410b ; (putpch + 45)
40e5 : c9 0a __ CMP #$0a
40e7 : d0 02 __ BNE $40eb ; (putpch + 13)
40e9 : a9 0d __ LDA #$0d
40eb : c9 09 __ CMP #$09
40ed : f0 1f __ BEQ $410e ; (putpch + 48)
40ef : e0 02 __ CPX #$02
40f1 : 90 18 __ BCC $410b ; (putpch + 45)
40f3 : c9 41 __ CMP #$41
40f5 : 90 14 __ BCC $410b ; (putpch + 45)
40f7 : c9 7b __ CMP #$7b
40f9 : b0 10 __ BCS $410b ; (putpch + 45)
40fb : c9 61 __ CMP #$61
40fd : b0 04 __ BCS $4103 ; (putpch + 37)
40ff : c9 5b __ CMP #$5b
4101 : b0 08 __ BCS $410b ; (putpch + 45)
4103 : 49 20 __ EOR #$20
4105 : e0 03 __ CPX #$03
4107 : f0 02 __ BEQ $410b ; (putpch + 45)
4109 : 29 df __ AND #$df
410b : 4c d2 ff JMP $ffd2 
410e : 38 __ __ SEC
410f : 20 f0 ff JSR $fff0 
4112 : 98 __ __ TYA
4113 : 29 03 __ AND #$03
4115 : 49 03 __ EOR #$03
4117 : aa __ __ TAX
4118 : a9 20 __ LDA #$20
411a : 20 d2 ff JSR $ffd2 
411d : ca __ __ DEX
411e : 10 fa __ BPL $411a ; (putpch + 60)
4120 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
4121 : a9 00 __ LDA #$00
4123 : 85 43 __ STA T0 + 0 
4125 : a5 13 __ LDA P6 ; (s + 0)
4127 : f0 13 __ BEQ $413c ; (nformi.s182 + 0)
.s4:
4129 : 24 12 __ BIT P5 ; (v + 1)
412b : 10 0f __ BPL $413c ; (nformi.s182 + 0)
.s1:
412d : 38 __ __ SEC
412e : a9 00 __ LDA #$00
4130 : e5 11 __ SBC P4 ; (v + 0)
4132 : 85 11 __ STA P4 ; (v + 0)
4134 : a9 00 __ LDA #$00
4136 : e5 12 __ SBC P5 ; (v + 1)
4138 : 85 12 __ STA P5 ; (v + 1)
413a : e6 43 __ INC T0 + 0 
.s182:
413c : a9 10 __ LDA #$10
413e : 85 44 __ STA T2 + 0 
4140 : a5 11 __ LDA P4 ; (v + 0)
4142 : 05 12 __ ORA P5 ; (v + 1)
4144 : f0 46 __ BEQ $418c ; (nformi.s7 + 0)
.s42:
4146 : a0 03 __ LDY #$03
4148 : b1 0d __ LDA (P0),y ; (si + 0)
414a : 85 45 __ STA T4 + 0 
414c : c8 __ __ INY
414d : b1 0d __ LDA (P0),y ; (si + 0)
414f : 85 46 __ STA T4 + 1 
.l6:
4151 : a5 11 __ LDA P4 ; (v + 0)
4153 : 85 1b __ STA ACCU + 0 
4155 : a5 12 __ LDA P5 ; (v + 1)
4157 : 85 1c __ STA ACCU + 1 
4159 : a5 45 __ LDA T4 + 0 
415b : 85 03 __ STA WORK + 0 
415d : a5 46 __ LDA T4 + 1 
415f : 85 04 __ STA WORK + 1 
4161 : 20 19 56 JSR $5619 ; (divmod + 0)
4164 : a5 06 __ LDA WORK + 3 
4166 : 30 08 __ BMI $4170 ; (nformi.s78 + 0)
.s1019:
4168 : d0 0a __ BNE $4174 ; (nformi.s77 + 0)
.s1018:
416a : a5 05 __ LDA WORK + 2 
416c : c9 0a __ CMP #$0a
416e : b0 04 __ BCS $4174 ; (nformi.s77 + 0)
.s78:
4170 : a9 30 __ LDA #$30
4172 : d0 02 __ BNE $4176 ; (nformi.s79 + 0)
.s77:
4174 : a9 37 __ LDA #$37
.s79:
4176 : 18 __ __ CLC
4177 : 65 05 __ ADC WORK + 2 
4179 : c6 44 __ DEC T2 + 0 
417b : a6 44 __ LDX T2 + 0 
417d : 9d f0 bf STA $bff0,x ; (buffer + 0)
4180 : a5 1b __ LDA ACCU + 0 
4182 : 85 11 __ STA P4 ; (v + 0)
4184 : a5 1c __ LDA ACCU + 1 
4186 : 85 12 __ STA P5 ; (v + 1)
4188 : 05 11 __ ORA P4 ; (v + 0)
418a : d0 c5 __ BNE $4151 ; (nformi.l6 + 0)
.s7:
418c : a0 02 __ LDY #$02
418e : b1 0d __ LDA (P0),y ; (si + 0)
4190 : c9 ff __ CMP #$ff
4192 : d0 04 __ BNE $4198 ; (nformi.s80 + 0)
.s81:
4194 : a9 0f __ LDA #$0f
4196 : d0 05 __ BNE $419d ; (nformi.s1026 + 0)
.s80:
4198 : 38 __ __ SEC
4199 : a9 10 __ LDA #$10
419b : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
419d : a8 __ __ TAY
419e : c4 44 __ CPY T2 + 0 
41a0 : b0 0d __ BCS $41af ; (nformi.s10 + 0)
.s9:
41a2 : a9 30 __ LDA #$30
.l1027:
41a4 : c6 44 __ DEC T2 + 0 
41a6 : a6 44 __ LDX T2 + 0 
41a8 : 9d f0 bf STA $bff0,x ; (buffer + 0)
41ab : c4 44 __ CPY T2 + 0 
41ad : 90 f5 __ BCC $41a4 ; (nformi.l1027 + 0)
.s10:
41af : a0 07 __ LDY #$07
41b1 : b1 0d __ LDA (P0),y ; (si + 0)
41b3 : f0 20 __ BEQ $41d5 ; (nformi.s13 + 0)
.s14:
41b5 : a0 04 __ LDY #$04
41b7 : b1 0d __ LDA (P0),y ; (si + 0)
41b9 : d0 1a __ BNE $41d5 ; (nformi.s13 + 0)
.s1013:
41bb : 88 __ __ DEY
41bc : b1 0d __ LDA (P0),y ; (si + 0)
41be : c9 10 __ CMP #$10
41c0 : d0 13 __ BNE $41d5 ; (nformi.s13 + 0)
.s11:
41c2 : a9 58 __ LDA #$58
41c4 : a6 44 __ LDX T2 + 0 
41c6 : 9d ef bf STA $bfef,x ; (buff + 49)
41c9 : 8a __ __ TXA
41ca : 18 __ __ CLC
41cb : 69 fe __ ADC #$fe
41cd : 85 44 __ STA T2 + 0 
41cf : aa __ __ TAX
41d0 : a9 30 __ LDA #$30
41d2 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
41d5 : a9 00 __ LDA #$00
41d7 : 85 1b __ STA ACCU + 0 
41d9 : a5 43 __ LDA T0 + 0 
41db : f0 06 __ BEQ $41e3 ; (nformi.s16 + 0)
.s15:
41dd : c6 44 __ DEC T2 + 0 
41df : a9 2d __ LDA #$2d
41e1 : d0 0a __ BNE $41ed ; (nformi.s1025 + 0)
.s16:
41e3 : a0 05 __ LDY #$05
41e5 : b1 0d __ LDA (P0),y ; (si + 0)
41e7 : f0 09 __ BEQ $41f2 ; (nformi.s163 + 0)
.s18:
41e9 : c6 44 __ DEC T2 + 0 
41eb : a9 2b __ LDA #$2b
.s1025:
41ed : a6 44 __ LDX T2 + 0 
41ef : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
41f2 : a0 06 __ LDY #$06
41f4 : b1 0d __ LDA (P0),y ; (si + 0)
41f6 : d0 33 __ BNE $422b ; (nformi.s24 + 0)
.l30:
41f8 : a0 01 __ LDY #$01
41fa : b1 0d __ LDA (P0),y ; (si + 0)
41fc : 18 __ __ CLC
41fd : 65 44 __ ADC T2 + 0 
41ff : b0 04 __ BCS $4205 ; (nformi.s31 + 0)
.s1006:
4201 : c9 11 __ CMP #$11
4203 : 90 0d __ BCC $4212 ; (nformi.s33 + 0)
.s31:
4205 : c6 44 __ DEC T2 + 0 
4207 : a0 00 __ LDY #$00
4209 : b1 0d __ LDA (P0),y ; (si + 0)
420b : a6 44 __ LDX T2 + 0 
420d : 9d f0 bf STA $bff0,x ; (buffer + 0)
4210 : b0 e6 __ BCS $41f8 ; (nformi.l30 + 0)
.s33:
4212 : a6 44 __ LDX T2 + 0 
4214 : e0 10 __ CPX #$10
4216 : b0 0e __ BCS $4226 ; (nformi.s23 + 0)
.s34:
4218 : 88 __ __ DEY
.l1022:
4219 : bd f0 bf LDA $bff0,x ; (buffer + 0)
421c : 91 0f __ STA (P2),y ; (str + 0)
421e : e8 __ __ INX
421f : e0 10 __ CPX #$10
4221 : c8 __ __ INY
4222 : 90 f5 __ BCC $4219 ; (nformi.l1022 + 0)
.s1023:
4224 : 84 1b __ STY ACCU + 0 
.s23:
4226 : a9 00 __ LDA #$00
4228 : 85 1c __ STA ACCU + 1 
.s1001:
422a : 60 __ __ RTS
.s24:
422b : a6 44 __ LDX T2 + 0 
422d : e0 10 __ CPX #$10
422f : b0 1a __ BCS $424b ; (nformi.l27 + 0)
.s25:
4231 : a0 00 __ LDY #$00
.l1020:
4233 : bd f0 bf LDA $bff0,x ; (buffer + 0)
4236 : 91 0f __ STA (P2),y ; (str + 0)
4238 : e8 __ __ INX
4239 : e0 10 __ CPX #$10
423b : c8 __ __ INY
423c : 90 f5 __ BCC $4233 ; (nformi.l1020 + 0)
.s1021:
423e : 84 1b __ STY ACCU + 0 
4240 : b0 09 __ BCS $424b ; (nformi.l27 + 0)
.s28:
4242 : 88 __ __ DEY
4243 : b1 0d __ LDA (P0),y ; (si + 0)
4245 : a4 1b __ LDY ACCU + 0 
4247 : 91 0f __ STA (P2),y ; (str + 0)
4249 : e6 1b __ INC ACCU + 0 
.l27:
424b : a5 1b __ LDA ACCU + 0 
424d : a0 01 __ LDY #$01
424f : d1 0d __ CMP (P0),y ; (si + 0)
4251 : 90 ef __ BCC $4242 ; (nformi.s28 + 0)
4253 : 4c 26 42 JMP $4226 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml@proxy: ; nforml@proxy
4256 : a5 53 __ LDA $53 
4258 : 85 11 __ STA P4 
425a : a5 54 __ LDA $54 
425c : 85 12 __ STA P5 
425e : a5 55 __ LDA $55 
4260 : 85 13 __ STA P6 
4262 : a5 56 __ LDA $56 
4264 : 85 14 __ STA P7 
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
4266 : a9 00 __ LDA #$00
4268 : 85 43 __ STA T0 + 0 
426a : a5 15 __ LDA P8 ; (s + 0)
426c : f0 21 __ BEQ $428f ; (nforml.s182 + 0)
.s4:
426e : a5 14 __ LDA P7 ; (v + 3)
4270 : f0 1d __ BEQ $428f ; (nforml.s182 + 0)
.s1032:
4272 : 10 1b __ BPL $428f ; (nforml.s182 + 0)
.s1:
4274 : 38 __ __ SEC
4275 : a9 00 __ LDA #$00
4277 : e5 11 __ SBC P4 ; (v + 0)
4279 : 85 11 __ STA P4 ; (v + 0)
427b : a9 00 __ LDA #$00
427d : e5 12 __ SBC P5 ; (v + 1)
427f : 85 12 __ STA P5 ; (v + 1)
4281 : a9 00 __ LDA #$00
4283 : e5 13 __ SBC P6 ; (v + 2)
4285 : 85 13 __ STA P6 ; (v + 2)
4287 : a9 00 __ LDA #$00
4289 : e5 14 __ SBC P7 ; (v + 3)
428b : 85 14 __ STA P7 ; (v + 3)
428d : e6 43 __ INC T0 + 0 
.s182:
428f : a9 10 __ LDA #$10
4291 : 85 44 __ STA T2 + 0 
4293 : a5 14 __ LDA P7 ; (v + 3)
4295 : d0 0c __ BNE $42a3 ; (nforml.s42 + 0)
.s1024:
4297 : a5 13 __ LDA P6 ; (v + 2)
4299 : d0 08 __ BNE $42a3 ; (nforml.s42 + 0)
.s1025:
429b : a5 12 __ LDA P5 ; (v + 1)
429d : d0 04 __ BNE $42a3 ; (nforml.s42 + 0)
.s1026:
429f : c5 11 __ CMP P4 ; (v + 0)
42a1 : b0 0e __ BCS $42b1 ; (nforml.s7 + 0)
.s42:
42a3 : a0 03 __ LDY #$03
42a5 : b1 0d __ LDA (P0),y ; (si + 0)
42a7 : 85 45 __ STA T5 + 0 
42a9 : c8 __ __ INY
42aa : b1 0d __ LDA (P0),y ; (si + 0)
42ac : 85 46 __ STA T5 + 1 
42ae : 4c 7b 43 JMP $437b ; (nforml.l6 + 0)
.s7:
42b1 : a0 02 __ LDY #$02
42b3 : b1 0d __ LDA (P0),y ; (si + 0)
42b5 : c9 ff __ CMP #$ff
42b7 : d0 04 __ BNE $42bd ; (nforml.s80 + 0)
.s81:
42b9 : a9 0f __ LDA #$0f
42bb : d0 05 __ BNE $42c2 ; (nforml.s1039 + 0)
.s80:
42bd : 38 __ __ SEC
42be : a9 10 __ LDA #$10
42c0 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
42c2 : a8 __ __ TAY
42c3 : c4 44 __ CPY T2 + 0 
42c5 : b0 0d __ BCS $42d4 ; (nforml.s10 + 0)
.s9:
42c7 : a9 30 __ LDA #$30
.l1040:
42c9 : c6 44 __ DEC T2 + 0 
42cb : a6 44 __ LDX T2 + 0 
42cd : 9d f0 bf STA $bff0,x ; (buffer + 0)
42d0 : c4 44 __ CPY T2 + 0 
42d2 : 90 f5 __ BCC $42c9 ; (nforml.l1040 + 0)
.s10:
42d4 : a0 07 __ LDY #$07
42d6 : b1 0d __ LDA (P0),y ; (si + 0)
42d8 : f0 20 __ BEQ $42fa ; (nforml.s13 + 0)
.s14:
42da : a0 04 __ LDY #$04
42dc : b1 0d __ LDA (P0),y ; (si + 0)
42de : d0 1a __ BNE $42fa ; (nforml.s13 + 0)
.s1013:
42e0 : 88 __ __ DEY
42e1 : b1 0d __ LDA (P0),y ; (si + 0)
42e3 : c9 10 __ CMP #$10
42e5 : d0 13 __ BNE $42fa ; (nforml.s13 + 0)
.s11:
42e7 : a9 58 __ LDA #$58
42e9 : a6 44 __ LDX T2 + 0 
42eb : 9d ef bf STA $bfef,x ; (buff + 49)
42ee : 8a __ __ TXA
42ef : 18 __ __ CLC
42f0 : 69 fe __ ADC #$fe
42f2 : 85 44 __ STA T2 + 0 
42f4 : aa __ __ TAX
42f5 : a9 30 __ LDA #$30
42f7 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
42fa : a9 00 __ LDA #$00
42fc : 85 1b __ STA ACCU + 0 
42fe : a5 43 __ LDA T0 + 0 
4300 : f0 06 __ BEQ $4308 ; (nforml.s16 + 0)
.s15:
4302 : c6 44 __ DEC T2 + 0 
4304 : a9 2d __ LDA #$2d
4306 : d0 0a __ BNE $4312 ; (nforml.s1038 + 0)
.s16:
4308 : a0 05 __ LDY #$05
430a : b1 0d __ LDA (P0),y ; (si + 0)
430c : f0 09 __ BEQ $4317 ; (nforml.s163 + 0)
.s18:
430e : c6 44 __ DEC T2 + 0 
4310 : a9 2b __ LDA #$2b
.s1038:
4312 : a6 44 __ LDX T2 + 0 
4314 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
4317 : a0 06 __ LDY #$06
4319 : b1 0d __ LDA (P0),y ; (si + 0)
431b : d0 33 __ BNE $4350 ; (nforml.s24 + 0)
.l30:
431d : a0 01 __ LDY #$01
431f : b1 0d __ LDA (P0),y ; (si + 0)
4321 : 18 __ __ CLC
4322 : 65 44 __ ADC T2 + 0 
4324 : b0 04 __ BCS $432a ; (nforml.s31 + 0)
.s1006:
4326 : c9 11 __ CMP #$11
4328 : 90 0d __ BCC $4337 ; (nforml.s33 + 0)
.s31:
432a : c6 44 __ DEC T2 + 0 
432c : a0 00 __ LDY #$00
432e : b1 0d __ LDA (P0),y ; (si + 0)
4330 : a6 44 __ LDX T2 + 0 
4332 : 9d f0 bf STA $bff0,x ; (buffer + 0)
4335 : b0 e6 __ BCS $431d ; (nforml.l30 + 0)
.s33:
4337 : a6 44 __ LDX T2 + 0 
4339 : e0 10 __ CPX #$10
433b : b0 0e __ BCS $434b ; (nforml.s23 + 0)
.s34:
433d : 88 __ __ DEY
.l1035:
433e : bd f0 bf LDA $bff0,x ; (buffer + 0)
4341 : 91 0f __ STA (P2),y ; (str + 0)
4343 : e8 __ __ INX
4344 : e0 10 __ CPX #$10
4346 : c8 __ __ INY
4347 : 90 f5 __ BCC $433e ; (nforml.l1035 + 0)
.s1036:
4349 : 84 1b __ STY ACCU + 0 
.s23:
434b : a9 00 __ LDA #$00
434d : 85 1c __ STA ACCU + 1 
.s1001:
434f : 60 __ __ RTS
.s24:
4350 : a6 44 __ LDX T2 + 0 
4352 : e0 10 __ CPX #$10
4354 : b0 1a __ BCS $4370 ; (nforml.l27 + 0)
.s25:
4356 : a0 00 __ LDY #$00
.l1033:
4358 : bd f0 bf LDA $bff0,x ; (buffer + 0)
435b : 91 0f __ STA (P2),y ; (str + 0)
435d : e8 __ __ INX
435e : e0 10 __ CPX #$10
4360 : c8 __ __ INY
4361 : 90 f5 __ BCC $4358 ; (nforml.l1033 + 0)
.s1034:
4363 : 84 1b __ STY ACCU + 0 
4365 : b0 09 __ BCS $4370 ; (nforml.l27 + 0)
.s28:
4367 : 88 __ __ DEY
4368 : b1 0d __ LDA (P0),y ; (si + 0)
436a : a4 1b __ LDY ACCU + 0 
436c : 91 0f __ STA (P2),y ; (str + 0)
436e : e6 1b __ INC ACCU + 0 
.l27:
4370 : a5 1b __ LDA ACCU + 0 
4372 : a0 01 __ LDY #$01
4374 : d1 0d __ CMP (P0),y ; (si + 0)
4376 : 90 ef __ BCC $4367 ; (nforml.s28 + 0)
4378 : 4c 4b 43 JMP $434b ; (nforml.s23 + 0)
.l6:
437b : a5 11 __ LDA P4 ; (v + 0)
437d : 85 1b __ STA ACCU + 0 
437f : a5 12 __ LDA P5 ; (v + 1)
4381 : 85 1c __ STA ACCU + 1 
4383 : a5 13 __ LDA P6 ; (v + 2)
4385 : 85 1d __ STA ACCU + 2 
4387 : a5 14 __ LDA P7 ; (v + 3)
4389 : 85 1e __ STA ACCU + 3 
438b : a5 45 __ LDA T5 + 0 
438d : 85 03 __ STA WORK + 0 
438f : a5 46 __ LDA T5 + 1 
4391 : 85 04 __ STA WORK + 1 
4393 : a9 00 __ LDA #$00
4395 : 85 05 __ STA WORK + 2 
4397 : 85 06 __ STA WORK + 3 
4399 : 20 9e 56 JSR $569e ; (divmod32 + 0)
439c : a5 08 __ LDA WORK + 5 
439e : 30 08 __ BMI $43a8 ; (nforml.s78 + 0)
.s1023:
43a0 : d0 0a __ BNE $43ac ; (nforml.s77 + 0)
.s1022:
43a2 : a5 07 __ LDA WORK + 4 
43a4 : c9 0a __ CMP #$0a
43a6 : b0 04 __ BCS $43ac ; (nforml.s77 + 0)
.s78:
43a8 : a9 30 __ LDA #$30
43aa : d0 02 __ BNE $43ae ; (nforml.s79 + 0)
.s77:
43ac : a9 37 __ LDA #$37
.s79:
43ae : 18 __ __ CLC
43af : 65 07 __ ADC WORK + 4 
43b1 : c6 44 __ DEC T2 + 0 
43b3 : a6 44 __ LDX T2 + 0 
43b5 : 9d f0 bf STA $bff0,x ; (buffer + 0)
43b8 : a5 1b __ LDA ACCU + 0 
43ba : 85 11 __ STA P4 ; (v + 0)
43bc : a5 1c __ LDA ACCU + 1 
43be : 85 12 __ STA P5 ; (v + 1)
43c0 : a5 1d __ LDA ACCU + 2 
43c2 : 85 13 __ STA P6 ; (v + 2)
43c4 : a5 1e __ LDA ACCU + 3 
43c6 : 85 14 __ STA P7 ; (v + 3)
43c8 : d0 b1 __ BNE $437b ; (nforml.l6 + 0)
.s1018:
43ca : a5 13 __ LDA P6 ; (v + 2)
43cc : d0 ad __ BNE $437b ; (nforml.l6 + 0)
.s1019:
43ce : a5 12 __ LDA P5 ; (v + 1)
43d0 : d0 a9 __ BNE $437b ; (nforml.l6 + 0)
.s1020:
43d2 : c5 11 __ CMP P4 ; (v + 0)
43d4 : 90 a5 __ BCC $437b ; (nforml.l6 + 0)
43d6 : 4c b1 42 JMP $42b1 ; (nforml.s7 + 0)
--------------------------------------------------------------------
getch: ; getch()->i16
.s0:
43d9 : 20 2b 44 JSR $442b ; (getpch + 0)
43dc : c9 00 __ CMP #$00
43de : f0 f9 __ BEQ $43d9 ; (getch.s0 + 0)
43e0 : 85 1b __ STA ACCU + 0 
43e2 : a9 00 __ LDA #$00
43e4 : 85 1c __ STA ACCU + 1 
.s1001:
43e6 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
43e7 : 20 81 ff JSR $ff81 
.s1001:
43ea : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
43eb : 24 d7 __ BIT $d7 
43ed : 30 03 __ BMI $43f2 ; (screen_setmode.s1001 + 0)
.s6:
43ef : 20 5f ff JSR $ff5f 
.s1001:
43f2 : 60 __ __ RTS
--------------------------------------------------------------------
43f3 : __ __ __ BYT 4f 56 4c 31 00                                  : OVL1.
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
43f8 : a5 0d __ LDA P0 
43fa : a6 0e __ LDX P1 
43fc : 20 68 ff JSR $ff68 
.s1001:
43ff : 60 __ __ RTS
--------------------------------------------------------------------
4400 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
4410 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
4420 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getpch: ; getpch
442b : 20 e4 ff JSR $ffe4 
442e : ae fe 4e LDX $4efe ; (giocharmap + 0)
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
445c : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
446c : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
447c : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
4486 : a5 0d __ LDA P0 
4488 : 05 0e __ ORA P1 
448a : f0 08 __ BEQ $4494 ; (krnio_setnam.s0 + 14)
448c : a0 ff __ LDY #$ff
448e : c8 __ __ INY
448f : b1 0d __ LDA (P0),y 
4491 : d0 fb __ BNE $448e ; (krnio_setnam.s0 + 8)
4493 : 98 __ __ TYA
4494 : a6 0d __ LDX P0 
4496 : a4 0e __ LDY P1 
4498 : 20 bd ff JSR $ffbd 
.s1001:
449b : 60 __ __ RTS
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
449c : a5 0d __ LDA P0 
449e : a6 0e __ LDX P1 
44a0 : a4 0f __ LDY P2 
44a2 : 20 ba ff JSR $ffba 
44a5 : a9 00 __ LDA #$00
44a7 : a2 00 __ LDX #$00
44a9 : a0 00 __ LDY #$00
44ab : 20 d5 ff JSR $ffd5 
44ae : a9 00 __ LDA #$00
44b0 : b0 02 __ BCS $44b4 ; (krnio_load.s0 + 24)
44b2 : a9 01 __ LDA #$01
44b4 : 85 1b __ STA ACCU + 0 
.s1001:
44b6 : a5 1b __ LDA ACCU + 0 
44b8 : 60 __ __ RTS
--------------------------------------------------------------------
44b9 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
44c9 : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
44d7 : a9 01 __ LDA #$01
44d9 : 85 0d __ STA P0 
44db : a9 00 __ LDA #$00
44dd : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
44df : a5 0d __ LDA P0 
44e1 : 85 1b __ STA ACCU + 0 
44e3 : a5 0e __ LDA P1 
44e5 : 85 1c __ STA ACCU + 1 
44e7 : ae fd 4e LDX $4efd ; (spentry + 0)
44ea : 9a __ __ TXS
44eb : a9 4c __ LDA #$4c
44ed : 85 54 __ STA $54 
44ef : a9 00 __ LDA #$00
44f1 : 85 13 __ STA P6 
.s1001:
44f3 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
44f4 : a5 53 __ LDA T9 + 0 
44f6 : 8d f9 bf STA $bff9 ; (buffer + 9)
44f9 : a5 54 __ LDA T9 + 1 
44fb : 8d fa bf STA $bffa ; (buffer + 10)
.s0:
44fe : a6 13 __ LDX P6 ; (mode + 0)
4500 : bd f7 4e LDA $4ef7,x ; (__multab36L + 0)
4503 : 85 47 __ STA T1 + 0 
4505 : aa __ __ TAX
4506 : 18 __ __ CLC
4507 : 69 00 __ ADC #$00
4509 : 85 49 __ STA T2 + 0 
450b : a9 58 __ LDA #$58
450d : 69 00 __ ADC #$00
450f : 85 4a __ STA T2 + 1 
4511 : bd 04 58 LDA $5804,x ; (vdc_modes + 4)
4514 : f0 0a __ BEQ $4520 ; (vdc_set_mode.s3 + 0)
.s4:
4516 : ad f6 58 LDA $58f6 ; (vdc_state + 0)
4519 : c9 10 __ CMP #$10
451b : d0 03 __ BNE $4520 ; (vdc_set_mode.s3 + 0)
451d : 4c 00 48 JMP $4800 ; (vdc_set_mode.s1001 + 0)
.s3:
4520 : a9 00 __ LDA #$00
4522 : 8d 0c 59 STA $590c ; (vdc_state + 22)
4525 : 8d 0d 59 STA $590d ; (vdc_state + 23)
4528 : 8d 0e 59 STA $590e ; (vdc_state + 24)
452b : a0 09 __ LDY #$09
452d : b1 49 __ LDA (T2 + 0),y 
452f : 8d 02 59 STA $5902 ; (vdc_state + 12)
4532 : c8 __ __ INY
4533 : b1 49 __ LDA (T2 + 0),y 
4535 : 8d 03 59 STA $5903 ; (vdc_state + 13)
4538 : c8 __ __ INY
4539 : b1 49 __ LDA (T2 + 0),y 
453b : 8d 04 59 STA $5904 ; (vdc_state + 14)
453e : c8 __ __ INY
453f : b1 49 __ LDA (T2 + 0),y 
4541 : 8d 05 59 STA $5905 ; (vdc_state + 15)
4544 : a0 0f __ LDY #$0f
4546 : b1 49 __ LDA (T2 + 0),y 
4548 : 8d 08 59 STA $5908 ; (vdc_state + 18)
454b : c8 __ __ INY
454c : b1 49 __ LDA (T2 + 0),y 
454e : 8d 09 59 STA $5909 ; (vdc_state + 19)
4551 : c8 __ __ INY
4552 : b1 49 __ LDA (T2 + 0),y 
4554 : 8d 0a 59 STA $590a ; (vdc_state + 20)
4557 : c8 __ __ INY
4558 : b1 49 __ LDA (T2 + 0),y 
455a : 8d 0b 59 STA $590b ; (vdc_state + 21)
455d : a0 00 __ LDY #$00
455f : b1 49 __ LDA (T2 + 0),y 
4561 : 85 44 __ STA T3 + 0 
4563 : c8 __ __ INY
4564 : b1 49 __ LDA (T2 + 0),y 
4566 : 85 45 __ STA T3 + 1 
4568 : 8d fa 58 STA $58fa ; (vdc_state + 4)
456b : a5 44 __ LDA T3 + 0 
456d : 8d f9 58 STA $58f9 ; (vdc_state + 3)
4570 : c8 __ __ INY
4571 : b1 49 __ LDA (T2 + 0),y 
4573 : 85 1b __ STA ACCU + 0 
4575 : c8 __ __ INY
4576 : b1 49 __ LDA (T2 + 0),y 
4578 : 85 1c __ STA ACCU + 1 
457a : 8d fc 58 STA $58fc ; (vdc_state + 6)
457d : a5 1b __ LDA ACCU + 0 
457f : 8d fb 58 STA $58fb ; (vdc_state + 5)
4582 : a0 05 __ LDY #$05
4584 : b1 49 __ LDA (T2 + 0),y 
4586 : 85 4b __ STA T5 + 0 
4588 : c8 __ __ INY
4589 : b1 49 __ LDA (T2 + 0),y 
458b : 85 4c __ STA T5 + 1 
458d : 8d ff 58 STA $58ff ; (vdc_state + 9)
4590 : a5 4b __ LDA T5 + 0 
4592 : 8d fe 58 STA $58fe ; (vdc_state + 8)
4595 : c8 __ __ INY
4596 : b1 49 __ LDA (T2 + 0),y 
4598 : 85 4d __ STA T6 + 0 
459a : c8 __ __ INY
459b : b1 49 __ LDA (T2 + 0),y 
459d : 85 4e __ STA T6 + 1 
459f : 8d 01 59 STA $5901 ; (vdc_state + 11)
45a2 : a5 4d __ LDA T6 + 0 
45a4 : 8d 00 59 STA $5900 ; (vdc_state + 10)
45a7 : a0 0d __ LDY #$0d
45a9 : b1 49 __ LDA (T2 + 0),y 
45ab : 85 4f __ STA T7 + 0 
45ad : c8 __ __ INY
45ae : b1 49 __ LDA (T2 + 0),y 
45b0 : 85 50 __ STA T7 + 1 
45b2 : 8d 07 59 STA $5907 ; (vdc_state + 17)
45b5 : a5 4f __ LDA T7 + 0 
45b7 : 8d 06 59 STA $5906 ; (vdc_state + 16)
45ba : a5 1b __ LDA ACCU + 0 
45bc : 05 1c __ ORA ACCU + 1 
45be : f0 3c __ BEQ $45fc ; (vdc_set_mode.s6 + 0)
.s374:
45c0 : a9 00 __ LDA #$00
45c2 : 85 51 __ STA T8 + 0 
45c4 : 85 52 __ STA T8 + 1 
45c6 : a9 0f __ LDA #$0f
45c8 : 85 53 __ STA T9 + 0 
45ca : a9 59 __ LDA #$59
45cc : 85 54 __ STA T9 + 1 
45ce : a2 00 __ LDX #$00
.l8:
45d0 : a5 51 __ LDA T8 + 0 
45d2 : a0 00 __ LDY #$00
45d4 : 91 53 __ STA (T9 + 0),y 
45d6 : a5 52 __ LDA T8 + 1 
45d8 : c8 __ __ INY
45d9 : 91 53 __ STA (T9 + 0),y 
45db : 18 __ __ CLC
45dc : a5 44 __ LDA T3 + 0 
45de : 65 51 __ ADC T8 + 0 
45e0 : 85 51 __ STA T8 + 0 
45e2 : a5 45 __ LDA T3 + 1 
45e4 : 65 52 __ ADC T8 + 1 
45e6 : 85 52 __ STA T8 + 1 
45e8 : 18 __ __ CLC
45e9 : a5 53 __ LDA T9 + 0 
45eb : 69 02 __ ADC #$02
45ed : 85 53 __ STA T9 + 0 
45ef : 90 02 __ BCC $45f3 ; (vdc_set_mode.s1115 + 0)
.s1114:
45f1 : e6 54 __ INC T9 + 1 
.s1115:
45f3 : e8 __ __ INX
45f4 : a5 1c __ LDA ACCU + 1 
45f6 : d0 d8 __ BNE $45d0 ; (vdc_set_mode.l8 + 0)
.s1108:
45f8 : e4 1b __ CPX ACCU + 0 
45fa : 90 d4 __ BCC $45d0 ; (vdc_set_mode.l8 + 0)
.s6:
45fc : a9 22 __ LDA #$22
45fe : 8d 00 d6 STA $d600 
.l1577:
4601 : 2c 00 d6 BIT $d600 
4604 : 10 fb __ BPL $4601 ; (vdc_set_mode.l1577 + 0)
.s16:
4606 : a9 80 __ LDA #$80
4608 : 8d 01 d6 STA $d601 
460b : a9 0c __ LDA #$0c
460d : 8d 00 d6 STA $d600 
.l1579:
4610 : 2c 00 d6 BIT $d600 
4613 : 10 fb __ BPL $4610 ; (vdc_set_mode.l1579 + 0)
.s22:
4615 : a5 4c __ LDA T5 + 1 
4617 : 8d 01 d6 STA $d601 
461a : a9 0d __ LDA #$0d
461c : 8d 00 d6 STA $d600 
.l1581:
461f : 2c 00 d6 BIT $d600 
4622 : 10 fb __ BPL $461f ; (vdc_set_mode.l1581 + 0)
.s27:
4624 : a5 4b __ LDA T5 + 0 
4626 : 8d 01 d6 STA $d601 
4629 : a9 14 __ LDA #$14
462b : 8d 00 d6 STA $d600 
.l1583:
462e : 2c 00 d6 BIT $d600 
4631 : 10 fb __ BPL $462e ; (vdc_set_mode.l1583 + 0)
.s32:
4633 : a5 4e __ LDA T6 + 1 
4635 : 8d 01 d6 STA $d601 
4638 : a9 15 __ LDA #$15
463a : 8d 00 d6 STA $d600 
.l1585:
463d : 2c 00 d6 BIT $d600 
4640 : 10 fb __ BPL $463d ; (vdc_set_mode.l1585 + 0)
.s37:
4642 : a5 4d __ LDA T6 + 0 
4644 : 8d 01 d6 STA $d601 
4647 : a6 47 __ LDX T1 + 0 
4649 : bd 0e 58 LDA $580e,x ; (vdc_modes + 14)
464c : 85 45 __ STA T3 + 1 
464e : a9 1c __ LDA #$1c
4650 : 8d 00 d6 STA $d600 
.l1587:
4653 : 2c 00 d6 BIT $d600 
4656 : 10 fb __ BPL $4653 ; (vdc_set_mode.l1587 + 0)
.s44:
4658 : ad 01 d6 LDA $d601 
465b : 29 10 __ AND #$10
465d : 45 45 __ EOR T3 + 1 
465f : 29 1f __ AND #$1f
4661 : 45 45 __ EOR T3 + 1 
4663 : aa __ __ TAX
4664 : a9 1c __ LDA #$1c
4666 : 8d 00 d6 STA $d600 
.l1589:
4669 : 2c 00 d6 BIT $d600 
466c : 10 fb __ BPL $4669 ; (vdc_set_mode.l1589 + 0)
.s50:
466e : 8e 01 d6 STX $d601 
4671 : a5 4f __ LDA T7 + 0 
4673 : 85 0d __ STA P0 
4675 : a5 50 __ LDA T7 + 1 
4677 : 85 0e __ STA P1 
4679 : 20 0a 13 JSR $130a ; (bnk_redef_charset.s0 + 0)
467c : 18 __ __ CLC
467d : a9 13 __ LDA #$13
467f : 65 47 __ ADC T1 + 0 
4681 : 85 47 __ STA T1 + 0 
4683 : a9 58 __ LDA #$58
4685 : 69 00 __ ADC #$00
4687 : 85 48 __ STA T1 + 1 
4689 : a9 00 __ LDA #$00
468b : 85 43 __ STA T0 + 0 
.l52:
468d : a4 43 __ LDY T0 + 0 
468f : b1 47 __ LDA (T1 + 0),y 
4691 : 85 1b __ STA ACCU + 0 
4693 : c8 __ __ INY
4694 : b1 47 __ LDA (T1 + 0),y 
4696 : aa __ __ TAX
4697 : a5 1b __ LDA ACCU + 0 
4699 : 8d 00 d6 STA $d600 
469c : c8 __ __ INY
469d : 84 43 __ STY T0 + 0 
.l1591:
469f : 2c 00 d6 BIT $d600 
46a2 : 10 fb __ BPL $469f ; (vdc_set_mode.l1591 + 0)
.s58:
46a4 : 8e 01 d6 STX $d601 
46a7 : 18 __ __ CLC
46a8 : a5 49 __ LDA T2 + 0 
46aa : 65 43 __ ADC T0 + 0 
46ac : 85 44 __ STA T3 + 0 
46ae : a5 4a __ LDA T2 + 1 
46b0 : 69 00 __ ADC #$00
46b2 : 85 45 __ STA T3 + 1 
46b4 : a0 13 __ LDY #$13
46b6 : b1 44 __ LDA (T3 + 0),y 
46b8 : c9 ff __ CMP #$ff
46ba : d0 d1 __ BNE $468d ; (vdc_set_mode.l52 + 0)
.s53:
46bc : a0 04 __ LDY #$04
46be : b1 49 __ LDA (T2 + 0),y 
46c0 : f0 05 __ BEQ $46c7 ; (vdc_set_mode.s60 + 0)
.s62:
46c2 : ad f7 58 LDA $58f7 ; (vdc_state + 1)
46c5 : f0 0f __ BEQ $46d6 ; (vdc_set_mode.s59 + 0)
.s60:
46c7 : ad f9 58 LDA $58f9 ; (vdc_state + 3)
46ca : 85 47 __ STA T1 + 0 
46cc : ad fb 58 LDA $58fb ; (vdc_state + 5)
46cf : 85 49 __ STA T2 + 0 
46d1 : a2 00 __ LDX #$00
46d3 : 4c e7 48 JMP $48e7 ; (vdc_set_mode.l242 + 0)
.s59:
46d6 : ad f6 58 LDA $58f6 ; (vdc_state + 0)
46d9 : c9 10 __ CMP #$10
46db : d0 03 __ BNE $46e0 ; (vdc_set_mode.s67 + 0)
46dd : 4c f1 47 JMP $47f1 ; (vdc_set_mode.s61 + 0)
.s67:
46e0 : ad f7 58 LDA $58f7 ; (vdc_state + 1)
46e3 : f0 03 __ BEQ $46e8 ; (vdc_set_mode.s66 + 0)
46e5 : 4c f1 47 JMP $47f1 ; (vdc_set_mode.s61 + 0)
.s66:
46e8 : a9 22 __ LDA #$22
46ea : 8d 00 d6 STA $d600 
.l1624:
46ed : 2c 00 d6 BIT $d600 
46f0 : 10 fb __ BPL $46ed ; (vdc_set_mode.l1624 + 0)
.s74:
46f2 : a9 80 __ LDA #$80
46f4 : 8d 01 d6 STA $d601 
46f7 : a2 00 __ LDX #$00
46f9 : a0 ff __ LDY #$ff
.l77:
46fb : a9 12 __ LDA #$12
46fd : 8d 00 d6 STA $d600 
.l1626:
4700 : 2c 00 d6 BIT $d600 
4703 : 10 fb __ BPL $4700 ; (vdc_set_mode.l1626 + 0)
.s86:
4705 : 8e 01 d6 STX $d601 
4708 : a9 13 __ LDA #$13
470a : 8d 00 d6 STA $d600 
.l1628:
470d : 2c 00 d6 BIT $d600 
4710 : 10 fb __ BPL $470d ; (vdc_set_mode.l1628 + 0)
.s91:
4712 : a9 00 __ LDA #$00
4714 : 8d 01 d6 STA $d601 
4717 : a9 1f __ LDA #$1f
4719 : 8d 00 d6 STA $d600 
.l1630:
471c : 2c 00 d6 BIT $d600 
471f : 10 fb __ BPL $471c ; (vdc_set_mode.l1630 + 0)
.s95:
4721 : a9 00 __ LDA #$00
4723 : 8d 01 d6 STA $d601 
4726 : a9 18 __ LDA #$18
4728 : 8d 00 d6 STA $d600 
.l1632:
472b : 2c 00 d6 BIT $d600 
472e : 10 fb __ BPL $472b ; (vdc_set_mode.l1632 + 0)
.s101:
4730 : ad 01 d6 LDA $d601 
4733 : 29 7f __ AND #$7f
4735 : 85 49 __ STA T2 + 0 
4737 : a9 18 __ LDA #$18
4739 : 8d 00 d6 STA $d600 
.l1634:
473c : 2c 00 d6 BIT $d600 
473f : 10 fb __ BPL $473c ; (vdc_set_mode.l1634 + 0)
.s107:
4741 : a5 49 __ LDA T2 + 0 
4743 : 8d 01 d6 STA $d601 
4746 : a9 1e __ LDA #$1e
4748 : 8d 00 d6 STA $d600 
.l1636:
474b : 2c 00 d6 BIT $d600 
474e : 10 fb __ BPL $474b ; (vdc_set_mode.l1636 + 0)
.s112:
4750 : a9 ff __ LDA #$ff
4752 : 8d 01 d6 STA $d601 
4755 : e8 __ __ INX
4756 : 88 __ __ DEY
4757 : d0 a2 __ BNE $46fb ; (vdc_set_mode.l77 + 0)
.s79:
4759 : a9 12 __ LDA #$12
475b : 8d 00 d6 STA $d600 
.l1639:
475e : 2c 00 d6 BIT $d600 
4761 : 10 fb __ BPL $475e ; (vdc_set_mode.l1639 + 0)
.s119:
4763 : 8e 01 d6 STX $d601 
4766 : a9 13 __ LDA #$13
4768 : 8d 00 d6 STA $d600 
.l1641:
476b : 2c 00 d6 BIT $d600 
476e : 10 fb __ BPL $476b ; (vdc_set_mode.l1641 + 0)
.s124:
4770 : 8c 01 d6 STY $d601 
4773 : a9 1f __ LDA #$1f
4775 : 8d 00 d6 STA $d600 
.l1643:
4778 : 2c 00 d6 BIT $d600 
477b : 10 fb __ BPL $4778 ; (vdc_set_mode.l1643 + 0)
.s128:
477d : 8c 01 d6 STY $d601 
4780 : a9 18 __ LDA #$18
4782 : 8d 00 d6 STA $d600 
.l1645:
4785 : 2c 00 d6 BIT $d600 
4788 : 10 fb __ BPL $4785 ; (vdc_set_mode.l1645 + 0)
.s134:
478a : ad 01 d6 LDA $d601 
478d : 29 7f __ AND #$7f
478f : aa __ __ TAX
4790 : a9 18 __ LDA #$18
4792 : 8d 00 d6 STA $d600 
.l1647:
4795 : 2c 00 d6 BIT $d600 
4798 : 10 fb __ BPL $4795 ; (vdc_set_mode.l1647 + 0)
.s140:
479a : 8e 01 d6 STX $d601 
479d : a9 1e __ LDA #$1e
479f : 8d 00 d6 STA $d600 
.l1649:
47a2 : 2c 00 d6 BIT $d600 
47a5 : 10 fb __ BPL $47a2 ; (vdc_set_mode.l1649 + 0)
.s145:
47a7 : a9 ff __ LDA #$ff
47a9 : 8d 01 d6 STA $d601 
47ac : a9 1c __ LDA #$1c
47ae : 8d 00 d6 STA $d600 
.l1651:
47b1 : 2c 00 d6 BIT $d600 
47b4 : 10 fb __ BPL $47b1 ; (vdc_set_mode.l1651 + 0)
.s151:
47b6 : ad 01 d6 LDA $d601 
47b9 : 09 10 __ ORA #$10
47bb : aa __ __ TAX
47bc : a9 1c __ LDA #$1c
47be : 8d 00 d6 STA $d600 
.l1653:
47c1 : 2c 00 d6 BIT $d600 
47c4 : 10 fb __ BPL $47c1 ; (vdc_set_mode.l1653 + 0)
.s157:
47c6 : 8e 01 d6 STX $d601 
47c9 : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
47cc : ad f9 58 LDA $58f9 ; (vdc_state + 3)
47cf : 85 47 __ STA T1 + 0 
47d1 : ad fb 58 LDA $58fb ; (vdc_state + 5)
47d4 : 85 49 __ STA T2 + 0 
47d6 : a2 00 __ LDX #$00
.l161:
47d8 : 8a __ __ TXA
47d9 : e4 49 __ CPX T2 + 0 
47db : 90 2e __ BCC $480b ; (vdc_set_mode.s162 + 0)
.s159:
47dd : a9 22 __ LDA #$22
47df : 8d 00 d6 STA $d600 
.l1680:
47e2 : 2c 00 d6 BIT $d600 
47e5 : 10 fb __ BPL $47e2 ; (vdc_set_mode.l1680 + 0)
.s239:
47e7 : a9 7d __ LDA #$7d
47e9 : 8d 01 d6 STA $d601 
47ec : a9 01 __ LDA #$01
47ee : 8d f7 58 STA $58f7 ; (vdc_state + 1)
.s61:
47f1 : a9 22 __ LDA #$22
47f3 : 8d 00 d6 STA $d600 
.l1621:
47f6 : 2c 00 d6 BIT $d600 
47f9 : 10 fb __ BPL $47f6 ; (vdc_set_mode.l1621 + 0)
.s320:
47fb : a9 7d __ LDA #$7d
47fd : 8d 01 d6 STA $d601 
.s1001:
4800 : ad f9 bf LDA $bff9 ; (buffer + 9)
4803 : 85 53 __ STA T9 + 0 
4805 : ad fa bf LDA $bffa ; (buffer + 10)
4808 : 85 54 __ STA T9 + 1 
480a : 60 __ __ RTS
.s162:
480b : 0a __ __ ASL
480c : a8 __ __ TAY
480d : b9 10 59 LDA $5910,y ; (multab + 1)
4810 : 85 45 __ STA T3 + 1 
4812 : ad fd 58 LDA $58fd ; (vdc_state + 7)
4815 : 85 46 __ STA T11 + 0 
4817 : a9 12 __ LDA #$12
4819 : 8d 00 d6 STA $d600 
481c : a5 47 __ LDA T1 + 0 
481e : 38 __ __ SEC
481f : e9 01 __ SBC #$01
4821 : 85 4b __ STA T5 + 0 
4823 : b9 0f 59 LDA $590f,y ; (multab + 0)
4826 : 85 44 __ STA T3 + 0 
4828 : 18 __ __ CLC
4829 : 6d fe 58 ADC $58fe ; (vdc_state + 8)
482c : a8 __ __ TAY
482d : a5 45 __ LDA T3 + 1 
482f : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l1656:
4832 : 2c 00 d6 BIT $d600 
4835 : 10 fb __ BPL $4832 ; (vdc_set_mode.l1656 + 0)
.s174:
4837 : 8d 01 d6 STA $d601 
483a : a9 13 __ LDA #$13
483c : 8d 00 d6 STA $d600 
.l1658:
483f : 2c 00 d6 BIT $d600 
4842 : 10 fb __ BPL $483f ; (vdc_set_mode.l1658 + 0)
.s179:
4844 : 8c 01 d6 STY $d601 
4847 : a9 1f __ LDA #$1f
4849 : 8d 00 d6 STA $d600 
.l1660:
484c : 2c 00 d6 BIT $d600 
484f : 10 fb __ BPL $484c ; (vdc_set_mode.l1660 + 0)
.s183:
4851 : a9 20 __ LDA #$20
4853 : 8d 01 d6 STA $d601 
4856 : a9 18 __ LDA #$18
4858 : 8d 00 d6 STA $d600 
.l1662:
485b : 2c 00 d6 BIT $d600 
485e : 10 fb __ BPL $485b ; (vdc_set_mode.l1662 + 0)
.s189:
4860 : ad 01 d6 LDA $d601 
4863 : 29 7f __ AND #$7f
4865 : a8 __ __ TAY
4866 : a9 18 __ LDA #$18
4868 : 8d 00 d6 STA $d600 
.l1664:
486b : 2c 00 d6 BIT $d600 
486e : 10 fb __ BPL $486b ; (vdc_set_mode.l1664 + 0)
.s195:
4870 : 8c 01 d6 STY $d601 
4873 : a9 1e __ LDA #$1e
4875 : 8d 00 d6 STA $d600 
.l1666:
4878 : 2c 00 d6 BIT $d600 
487b : 10 fb __ BPL $4878 ; (vdc_set_mode.l1666 + 0)
.s200:
487d : a5 4b __ LDA T5 + 0 
487f : 8d 01 d6 STA $d601 
4882 : ad 00 59 LDA $5900 ; (vdc_state + 10)
4885 : 18 __ __ CLC
4886 : 65 44 __ ADC T3 + 0 
4888 : a8 __ __ TAY
4889 : a9 12 __ LDA #$12
488b : 8d 00 d6 STA $d600 
488e : ad 01 59 LDA $5901 ; (vdc_state + 11)
4891 : 65 45 __ ADC T3 + 1 
.l1668:
4893 : 2c 00 d6 BIT $d600 
4896 : 10 fb __ BPL $4893 ; (vdc_set_mode.l1668 + 0)
.s207:
4898 : 8d 01 d6 STA $d601 
489b : a9 13 __ LDA #$13
489d : 8d 00 d6 STA $d600 
.l1670:
48a0 : 2c 00 d6 BIT $d600 
48a3 : 10 fb __ BPL $48a0 ; (vdc_set_mode.l1670 + 0)
.s212:
48a5 : 8c 01 d6 STY $d601 
48a8 : a9 1f __ LDA #$1f
48aa : 8d 00 d6 STA $d600 
.l1672:
48ad : 2c 00 d6 BIT $d600 
48b0 : 10 fb __ BPL $48ad ; (vdc_set_mode.l1672 + 0)
.s216:
48b2 : a5 46 __ LDA T11 + 0 
48b4 : 8d 01 d6 STA $d601 
48b7 : a9 18 __ LDA #$18
48b9 : 8d 00 d6 STA $d600 
.l1674:
48bc : 2c 00 d6 BIT $d600 
48bf : 10 fb __ BPL $48bc ; (vdc_set_mode.l1674 + 0)
.s222:
48c1 : ad 01 d6 LDA $d601 
48c4 : 29 7f __ AND #$7f
48c6 : a8 __ __ TAY
48c7 : a9 18 __ LDA #$18
48c9 : 8d 00 d6 STA $d600 
.l1676:
48cc : 2c 00 d6 BIT $d600 
48cf : 10 fb __ BPL $48cc ; (vdc_set_mode.l1676 + 0)
.s228:
48d1 : 8c 01 d6 STY $d601 
48d4 : a9 1e __ LDA #$1e
48d6 : 8d 00 d6 STA $d600 
.l1678:
48d9 : 2c 00 d6 BIT $d600 
48dc : 10 fb __ BPL $48d9 ; (vdc_set_mode.l1678 + 0)
.s233:
48de : a5 4b __ LDA T5 + 0 
48e0 : 8d 01 d6 STA $d601 
48e3 : e8 __ __ INX
48e4 : 4c d8 47 JMP $47d8 ; (vdc_set_mode.l161 + 0)
.l242:
48e7 : 8a __ __ TXA
48e8 : e4 49 __ CPX T2 + 0 
48ea : 90 03 __ BCC $48ef ; (vdc_set_mode.s243 + 0)
48ec : 4c f1 47 JMP $47f1 ; (vdc_set_mode.s61 + 0)
.s243:
48ef : 0a __ __ ASL
48f0 : a8 __ __ TAY
48f1 : b9 10 59 LDA $5910,y ; (multab + 1)
48f4 : 85 45 __ STA T3 + 1 
48f6 : ad fd 58 LDA $58fd ; (vdc_state + 7)
48f9 : 85 46 __ STA T11 + 0 
48fb : a9 12 __ LDA #$12
48fd : 8d 00 d6 STA $d600 
4900 : a5 47 __ LDA T1 + 0 
4902 : 38 __ __ SEC
4903 : e9 01 __ SBC #$01
4905 : 85 4b __ STA T5 + 0 
4907 : b9 0f 59 LDA $590f,y ; (multab + 0)
490a : 85 44 __ STA T3 + 0 
490c : 18 __ __ CLC
490d : 6d fe 58 ADC $58fe ; (vdc_state + 8)
4910 : a8 __ __ TAY
4911 : a5 45 __ LDA T3 + 1 
4913 : 6d ff 58 ADC $58ff ; (vdc_state + 9)
.l1597:
4916 : 2c 00 d6 BIT $d600 
4919 : 10 fb __ BPL $4916 ; (vdc_set_mode.l1597 + 0)
.s255:
491b : 8d 01 d6 STA $d601 
491e : a9 13 __ LDA #$13
4920 : 8d 00 d6 STA $d600 
.l1599:
4923 : 2c 00 d6 BIT $d600 
4926 : 10 fb __ BPL $4923 ; (vdc_set_mode.l1599 + 0)
.s260:
4928 : 8c 01 d6 STY $d601 
492b : a9 1f __ LDA #$1f
492d : 8d 00 d6 STA $d600 
.l1601:
4930 : 2c 00 d6 BIT $d600 
4933 : 10 fb __ BPL $4930 ; (vdc_set_mode.l1601 + 0)
.s264:
4935 : a9 20 __ LDA #$20
4937 : 8d 01 d6 STA $d601 
493a : a9 18 __ LDA #$18
493c : 8d 00 d6 STA $d600 
.l1603:
493f : 2c 00 d6 BIT $d600 
4942 : 10 fb __ BPL $493f ; (vdc_set_mode.l1603 + 0)
.s270:
4944 : ad 01 d6 LDA $d601 
4947 : 29 7f __ AND #$7f
4949 : a8 __ __ TAY
494a : a9 18 __ LDA #$18
494c : 8d 00 d6 STA $d600 
.l1605:
494f : 2c 00 d6 BIT $d600 
4952 : 10 fb __ BPL $494f ; (vdc_set_mode.l1605 + 0)
.s276:
4954 : 8c 01 d6 STY $d601 
4957 : a9 1e __ LDA #$1e
4959 : 8d 00 d6 STA $d600 
.l1607:
495c : 2c 00 d6 BIT $d600 
495f : 10 fb __ BPL $495c ; (vdc_set_mode.l1607 + 0)
.s281:
4961 : a5 4b __ LDA T5 + 0 
4963 : 8d 01 d6 STA $d601 
4966 : ad 00 59 LDA $5900 ; (vdc_state + 10)
4969 : 18 __ __ CLC
496a : 65 44 __ ADC T3 + 0 
496c : a8 __ __ TAY
496d : a9 12 __ LDA #$12
496f : 8d 00 d6 STA $d600 
4972 : ad 01 59 LDA $5901 ; (vdc_state + 11)
4975 : 65 45 __ ADC T3 + 1 
.l1609:
4977 : 2c 00 d6 BIT $d600 
497a : 10 fb __ BPL $4977 ; (vdc_set_mode.l1609 + 0)
.s288:
497c : 8d 01 d6 STA $d601 
497f : a9 13 __ LDA #$13
4981 : 8d 00 d6 STA $d600 
.l1611:
4984 : 2c 00 d6 BIT $d600 
4987 : 10 fb __ BPL $4984 ; (vdc_set_mode.l1611 + 0)
.s293:
4989 : 8c 01 d6 STY $d601 
498c : a9 1f __ LDA #$1f
498e : 8d 00 d6 STA $d600 
.l1613:
4991 : 2c 00 d6 BIT $d600 
4994 : 10 fb __ BPL $4991 ; (vdc_set_mode.l1613 + 0)
.s297:
4996 : a5 46 __ LDA T11 + 0 
4998 : 8d 01 d6 STA $d601 
499b : a9 18 __ LDA #$18
499d : 8d 00 d6 STA $d600 
.l1615:
49a0 : 2c 00 d6 BIT $d600 
49a3 : 10 fb __ BPL $49a0 ; (vdc_set_mode.l1615 + 0)
.s303:
49a5 : ad 01 d6 LDA $d601 
49a8 : 29 7f __ AND #$7f
49aa : a8 __ __ TAY
49ab : a9 18 __ LDA #$18
49ad : 8d 00 d6 STA $d600 
.l1617:
49b0 : 2c 00 d6 BIT $d600 
49b3 : 10 fb __ BPL $49b0 ; (vdc_set_mode.l1617 + 0)
.s309:
49b5 : 8c 01 d6 STY $d601 
49b8 : a9 1e __ LDA #$1e
49ba : 8d 00 d6 STA $d600 
.l1619:
49bd : 2c 00 d6 BIT $d600 
49c0 : 10 fb __ BPL $49bd ; (vdc_set_mode.l1619 + 0)
.s314:
49c2 : a5 4b __ LDA T5 + 0 
49c4 : 8d 01 d6 STA $d601 
49c7 : e8 __ __ INX
49c8 : 4c e7 48 JMP $48e7 ; (vdc_set_mode.l242 + 0)
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
49cb : a9 a9 __ LDA #$a9
49cd : 85 0e __ STA P1 
49cf : a9 4e __ LDA #$4e
49d1 : 85 0f __ STA P2 
--------------------------------------------------------------------
vdc_prints: ; vdc_prints(u8,u8,const u8*)->void
.s0:
49d3 : a5 0d __ LDA P0 ; (y + 0)
49d5 : 0a __ __ ASL
49d6 : aa __ __ TAX
49d7 : bd 0f 59 LDA $590f,x ; (multab + 0)
49da : 85 43 __ STA T2 + 0 
49dc : bd 10 59 LDA $5910,x ; (multab + 1)
49df : 85 44 __ STA T2 + 1 
49e1 : a0 00 __ LDY #$00
49e3 : 84 1b __ STY ACCU + 0 
49e5 : b1 0e __ LDA (P1),y ; (string + 0)
49e7 : f0 16 __ BEQ $49ff ; (vdc_prints.s6 + 0)
.s5:
49e9 : a5 0e __ LDA P1 ; (string + 0)
49eb : 85 1b __ STA ACCU + 0 
49ed : a2 00 __ LDX #$00
.l1046:
49ef : c8 __ __ INY
49f0 : d0 01 __ BNE $49f3 ; (vdc_prints.s1051 + 0)
.s1050:
49f2 : e8 __ __ INX
.s1051:
49f3 : 8a __ __ TXA
49f4 : 18 __ __ CLC
49f5 : 65 0f __ ADC P2 ; (string + 1)
49f7 : 85 1c __ STA ACCU + 1 
49f9 : b1 1b __ LDA (ACCU + 0),y 
49fb : d0 f2 __ BNE $49ef ; (vdc_prints.l1046 + 0)
.s1047:
49fd : 84 1b __ STY ACCU + 0 
.s6:
49ff : ad fe 58 LDA $58fe ; (vdc_state + 8)
4a02 : 18 __ __ CLC
4a03 : 65 43 __ ADC T2 + 0 
4a05 : aa __ __ TAX
4a06 : a9 12 __ LDA #$12
4a08 : 8d 00 d6 STA $d600 
4a0b : ad ff 58 LDA $58ff ; (vdc_state + 9)
4a0e : 65 44 __ ADC T2 + 1 
.l354:
4a10 : 2c 00 d6 BIT $d600 
4a13 : 10 fb __ BPL $4a10 ; (vdc_prints.l354 + 0)
.s13:
4a15 : 8d 01 d6 STA $d601 
4a18 : a9 13 __ LDA #$13
4a1a : 8d 00 d6 STA $d600 
.l356:
4a1d : 2c 00 d6 BIT $d600 
4a20 : 10 fb __ BPL $4a1d ; (vdc_prints.l356 + 0)
.s18:
4a22 : 8e 01 d6 STX $d601 
4a25 : a9 1f __ LDA #$1f
4a27 : 8d 00 d6 STA $d600 
4a2a : a5 1b __ LDA ACCU + 0 
4a2c : f0 61 __ BEQ $4a8f ; (vdc_prints.s23 + 0)
.s95:
4a2e : a0 00 __ LDY #$00
.l21:
4a30 : b1 0e __ LDA (P1),y ; (string + 0)
4a32 : c9 20 __ CMP #$20
4a34 : b0 05 __ BCS $4a3b ; (vdc_prints.s27 + 0)
.s26:
4a36 : 69 80 __ ADC #$80
4a38 : 4c 81 4a JMP $4a81 ; (vdc_prints.s1048 + 0)
.s27:
4a3b : aa __ __ TAX
4a3c : c9 40 __ CMP #$40
4a3e : 90 04 __ BCC $4a44 ; (vdc_prints.s30 + 0)
.s32:
4a40 : c9 60 __ CMP #$60
4a42 : 90 23 __ BCC $4a67 ; (vdc_prints.s29 + 0)
.s30:
4a44 : c9 60 __ CMP #$60
4a46 : 90 0a __ BCC $4a52 ; (vdc_prints.s34 + 0)
.s36:
4a48 : 09 00 __ ORA #$00
4a4a : 30 06 __ BMI $4a52 ; (vdc_prints.s34 + 0)
.s33:
4a4c : 38 __ __ SEC
4a4d : e9 20 __ SBC #$20
4a4f : 4c 81 4a JMP $4a81 ; (vdc_prints.s1048 + 0)
.s34:
4a52 : c9 80 __ CMP #$80
4a54 : 90 09 __ BCC $4a5f ; (vdc_prints.s38 + 0)
.s40:
4a56 : c9 a0 __ CMP #$a0
4a58 : b0 05 __ BCS $4a5f ; (vdc_prints.s38 + 0)
.s37:
4a5a : 69 40 __ ADC #$40
4a5c : 4c 81 4a JMP $4a81 ; (vdc_prints.s1048 + 0)
.s38:
4a5f : c9 a0 __ CMP #$a0
4a61 : 90 0a __ BCC $4a6d ; (vdc_prints.s42 + 0)
.s44:
4a63 : c9 c0 __ CMP #$c0
4a65 : b0 06 __ BCS $4a6d ; (vdc_prints.s42 + 0)
.s29:
4a67 : 38 __ __ SEC
4a68 : e9 40 __ SBC #$40
4a6a : 4c 81 4a JMP $4a81 ; (vdc_prints.s1048 + 0)
.s42:
4a6d : c9 c0 __ CMP #$c0
4a6f : 90 0a __ BCC $4a7b ; (vdc_prints.s46 + 0)
.s48:
4a71 : c9 ff __ CMP #$ff
4a73 : b0 06 __ BCS $4a7b ; (vdc_prints.s46 + 0)
.s45:
4a75 : 38 __ __ SEC
4a76 : e9 80 __ SBC #$80
4a78 : 4c 81 4a JMP $4a81 ; (vdc_prints.s1048 + 0)
.s46:
4a7b : c9 ff __ CMP #$ff
4a7d : d0 03 __ BNE $4a82 ; (vdc_prints.l360 + 0)
.s49:
4a7f : a9 5e __ LDA #$5e
.s1048:
4a81 : aa __ __ TAX
.l360:
4a82 : 2c 00 d6 BIT $d600 
4a85 : 10 fb __ BPL $4a82 ; (vdc_prints.l360 + 0)
.s54:
4a87 : 8e 01 d6 STX $d601 
4a8a : c8 __ __ INY
4a8b : c4 1b __ CPY ACCU + 0 
4a8d : 90 a1 __ BCC $4a30 ; (vdc_prints.l21 + 0)
.s23:
4a8f : a9 12 __ LDA #$12
4a91 : 8d 00 d6 STA $d600 
4a94 : c6 1b __ DEC ACCU + 0 
4a96 : ad 00 59 LDA $5900 ; (vdc_state + 10)
4a99 : 18 __ __ CLC
4a9a : 65 43 __ ADC T2 + 0 
4a9c : a8 __ __ TAY
4a9d : ad 01 59 LDA $5901 ; (vdc_state + 11)
4aa0 : 65 44 __ ADC T2 + 1 
4aa2 : ae fd 58 LDX $58fd ; (vdc_state + 7)
.l363:
4aa5 : 2c 00 d6 BIT $d600 
4aa8 : 10 fb __ BPL $4aa5 ; (vdc_prints.l363 + 0)
.s61:
4aaa : 8d 01 d6 STA $d601 
4aad : a9 13 __ LDA #$13
4aaf : 8d 00 d6 STA $d600 
.l365:
4ab2 : 2c 00 d6 BIT $d600 
4ab5 : 10 fb __ BPL $4ab2 ; (vdc_prints.l365 + 0)
.s66:
4ab7 : 8c 01 d6 STY $d601 
4aba : a9 1f __ LDA #$1f
4abc : 8d 00 d6 STA $d600 
.l367:
4abf : 2c 00 d6 BIT $d600 
4ac2 : 10 fb __ BPL $4abf ; (vdc_prints.l367 + 0)
.s70:
4ac4 : 8e 01 d6 STX $d601 
4ac7 : a9 18 __ LDA #$18
4ac9 : 8d 00 d6 STA $d600 
.l369:
4acc : 2c 00 d6 BIT $d600 
4acf : 10 fb __ BPL $4acc ; (vdc_prints.l369 + 0)
.s76:
4ad1 : ad 01 d6 LDA $d601 
4ad4 : 29 7f __ AND #$7f
4ad6 : aa __ __ TAX
4ad7 : a9 18 __ LDA #$18
4ad9 : 8d 00 d6 STA $d600 
.l371:
4adc : 2c 00 d6 BIT $d600 
4adf : 10 fb __ BPL $4adc ; (vdc_prints.l371 + 0)
.s82:
4ae1 : 8e 01 d6 STX $d601 
4ae4 : a9 1e __ LDA #$1e
4ae6 : 8d 00 d6 STA $d600 
.l373:
4ae9 : 2c 00 d6 BIT $d600 
4aec : 10 fb __ BPL $4ae9 ; (vdc_prints.l373 + 0)
.s87:
4aee : a5 1b __ LDA ACCU + 0 
4af0 : 8d 01 d6 STA $d601 
.s1001:
4af3 : 60 __ __ RTS
--------------------------------------------------------------------
4af4 : __ __ __ BYT 65 4e 00                                        : eN.
--------------------------------------------------------------------
4af7 : __ __ __ BYT 64 49 53 00                                     : dIS.
--------------------------------------------------------------------
4afb : __ __ __ BYT 6f 4e 20 00                                     : oN .
--------------------------------------------------------------------
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
4e03 : 20 56 42 JSR $4256 ; (nforml@proxy + 0)
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
4e2a : 20 21 41 JSR $4121 ; (nformi.s0 + 0)
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
4eeb : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
4eef : ad fd 58 LDA $58fd ; (vdc_state + 7)
4ef2 : 85 10 __ STA P3 
4ef4 : 4c 30 50 JMP $5030 ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
__multab36L:
4ef7 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
spentry:
4efd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
4efe : __ __ __ BYT 01                                              : .
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
50dd : bd 7b 57 LDA $577b,x ; (seed + 1)
50e0 : 9d 90 bf STA $bf90,x ; (verbs + 29)
50e3 : ca __ __ DEX
50e4 : d0 f7 __ BNE $50dd ; (generateSentence.l1002 + 0)
.s1003:
50e6 : a2 1e __ LDX #$1e
.l1004:
50e8 : bd c6 57 LDA $57c6,x 
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
50fe : ad 7b 57 LDA $577b ; (seed + 1)
5101 : 4a __ __ LSR
5102 : ad 7a 57 LDA $577a ; (seed + 0)
5105 : 6a __ __ ROR
5106 : aa __ __ TAX
5107 : 98 __ __ TYA
5108 : 6a __ __ ROR
5109 : 4d 7a 57 EOR $577a ; (seed + 0)
510c : 85 43 __ STA T0 + 0 
510e : 8a __ __ TXA
510f : 4d 7b 57 EOR $577b ; (seed + 1)
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
5162 : 8d 7a 57 STA $577a ; (seed + 0)
5165 : 85 1b __ STA ACCU + 0 
5167 : 45 4a __ EOR T3 + 1 
5169 : 8d 7b 57 STA $577b ; (seed + 1)
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
519f : bd 34 57 LDA $5734,x ; (__multab6L + 0)
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
51c5 : bd 39 57 LDA $5739,x ; (__multab15L + 0)
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
51eb : bd 34 57 LDA $5734,x ; (__multab6L + 0)
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
5536 : bd e5 57 LDA $57e5,x ; (p2smap + 0)
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
5551 : 20 ef 4e JSR $4eef ; (vdc_printc@proxy + 0)
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
5592 : a9 ff __ LDA #$ff
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
__multab6L:
5734 : __ __ __ BYT 00 06 0c 12 18                                  : .....
--------------------------------------------------------------------
__multab15L:
5739 : __ __ __ BYT 00 0f 1e 2d 3c                                  : ...-<
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
573e : a9 02 __ LDA #$02
5740 : 85 0d __ STA P0 
5742 : a9 9f __ LDA #$9f
5744 : 85 0e __ STA P1 
5746 : a9 59 __ LDA #$59
5748 : 85 0f __ STA P2 
574a : 4c d3 49 JMP $49d3 ; (vdc_prints.s0 + 0)
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
574d : a5 64 __ LDA $64 
574f : 85 0d __ STA P0 
5751 : a5 56 __ LDA $56 
5753 : 85 10 __ STA P3 
5755 : 4c 30 50 JMP $5030 ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
5758 : __ __ __ BYT 7f 00 80 a0 4b 00 00 00 00 00 00 00 00 00 00 00 : ....K...........
--------------------------------------------------------------------
winStyles:
5768 : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
5778 : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
seed:
577a : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
577c : __ __ __ BYT 42 4c 55 45 20 4a 41 59 00 00 00 00 00 00 00 43 : BLUE JAY.......C
578c : __ __ __ BYT 41 52 44 49 4e 41 4c 00 00 00 00 00 00 00 45 41 : ARDINAL.......EA
579c : __ __ __ BYT 53 54 45 52 4e 20 50 48 4f 45 42 45 00 47 52 41 : STERN PHOEBE.GRA
57ac : __ __ __ BYT 43 4b 4c 45 00 00 00 00 00 00 00 00 53 41 4e 44 : CKLE........SAND
57bc : __ __ __ BYT 48 49 4c 4c 20 43 52 41 4e 45 00                : HILL CRANE.
--------------------------------------------------------------------
57c7 : __ __ __ BYT 46 4c 49 45 53 00 4a 55 4d 50 53 00 53 4c 45 45 : FLIES.JUMPS.SLEE
57d7 : __ __ __ BYT 50 53 45 41 54 53 00 00 57 41 4c 4b 53 00       : PSEATS..WALKS.
--------------------------------------------------------------------
p2smap:
57e5 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
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
01:1392 : 20 f8 43 JSR $43f8 ; (krnio_setbnk.s0 + 0)
01:1395 : a5 12 __ LDA P5 ; (fname + 0)
01:1397 : 85 0d __ STA P0 
01:1399 : a5 13 __ LDA P6 ; (fname + 1)
01:139b : 85 0e __ STA P1 
01:139d : 20 86 44 JSR $4486 ; (krnio_setnam.s0 + 0)
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
