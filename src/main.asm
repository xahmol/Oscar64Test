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
1c16 : a9 4b __ LDA #$4b
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 55 __ LDA #$55
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 56 __ LDA #$56
1c21 : e9 55 __ SBC #$55
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
1c35 : a9 51 __ LDA #$51
1c37 : e9 4b __ SBC #$4b
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
1c50 : a9 95 __ LDA #$95
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
1c80 : a2 10 __ LDX #$10
1c82 : b5 53 __ LDA T0 + 0,x 
1c84 : 9d 97 be STA $be97,x ; (main@stack + 0)
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
1c97 : bd bd 53 LDA $53bd,x ; (vdc_prints@proxy + 14)
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
.l9335:
1cd3 : 2c 00 d6 BIT $d600 
1cd6 : 10 fb __ BPL $1cd3 ; (main.l9335 + 0)
.s10:
1cd8 : ad 01 d6 LDA $d601 
1cdb : 29 f0 __ AND #$f0
1cdd : a8 __ __ TAY
1cde : a9 1a __ LDA #$1a
1ce0 : 8d 00 d6 STA $d600 
.l9337:
1ce3 : 2c 00 d6 BIT $d600 
1ce6 : 10 fb __ BPL $1ce3 ; (main.l9337 + 0)
.s16:
1ce8 : 8c 01 d6 STY $d601 
1ceb : 8d 00 d6 STA $d600 
.l9339:
1cee : 2c 00 d6 BIT $d600 
1cf1 : 10 fb __ BPL $1cee ; (main.l9339 + 0)
.s23:
1cf3 : ad 01 d6 LDA $d601 
1cf6 : 29 0f __ AND #$0f
1cf8 : 09 d0 __ ORA #$d0
1cfa : a8 __ __ TAY
1cfb : a9 1a __ LDA #$1a
1cfd : 8d 00 d6 STA $d600 
.l9341:
1d00 : 2c 00 d6 BIT $d600 
1d03 : 10 fb __ BPL $1d00 ; (main.l9341 + 0)
.s29:
1d05 : 8c 01 d6 STY $d601 
1d08 : a9 8d __ LDA #$8d
1d0a : 8d 52 55 STA $5552 ; (vdc_state + 7)
1d0d : a9 1c __ LDA #$1c
1d0f : 8d 00 d6 STA $d600 
.l9343:
1d12 : 2c 00 d6 BIT $d600 
1d15 : 10 fb __ BPL $1d12 ; (main.l9343 + 0)
.s35:
1d17 : ad 01 d6 LDA $d601 
1d1a : a8 __ __ TAY
1d1b : 09 10 __ ORA #$10
1d1d : 85 54 __ STA T1 + 0 
1d1f : a9 1c __ LDA #$1c
1d21 : 8d 00 d6 STA $d600 
.l9345:
1d24 : 2c 00 d6 BIT $d600 
1d27 : 10 fb __ BPL $1d24 ; (main.l9345 + 0)
.s42:
1d29 : a5 54 __ LDA T1 + 0 
1d2b : 8d 01 d6 STA $d601 
1d2e : a9 12 __ LDA #$12
1d30 : 8d 00 d6 STA $d600 
.l9347:
1d33 : 2c 00 d6 BIT $d600 
1d36 : 10 fb __ BPL $1d33 ; (main.l9347 + 0)
.s49:
1d38 : a9 1f __ LDA #$1f
1d3a : 8d 01 d6 STA $d601 
1d3d : a9 13 __ LDA #$13
1d3f : 8d 00 d6 STA $d600 
.l9349:
1d42 : 2c 00 d6 BIT $d600 
1d45 : 10 fb __ BPL $1d42 ; (main.l9349 + 0)
.s54:
1d47 : a9 ff __ LDA #$ff
1d49 : 8d 01 d6 STA $d601 
1d4c : a9 1f __ LDA #$1f
1d4e : 8d 00 d6 STA $d600 
.l9351:
1d51 : 2c 00 d6 BIT $d600 
1d54 : 10 fb __ BPL $1d51 ; (main.l9351 + 0)
.s58:
1d56 : 8e 01 d6 STX $d601 
1d59 : a9 12 __ LDA #$12
1d5b : 8d 00 d6 STA $d600 
.l9353:
1d5e : 2c 00 d6 BIT $d600 
1d61 : 10 fb __ BPL $1d5e ; (main.l9353 + 0)
.s65:
1d63 : a9 9f __ LDA #$9f
1d65 : 8d 01 d6 STA $d601 
1d68 : a9 13 __ LDA #$13
1d6a : 8d 00 d6 STA $d600 
.l9355:
1d6d : 2c 00 d6 BIT $d600 
1d70 : 10 fb __ BPL $1d6d ; (main.l9355 + 0)
.s70:
1d72 : a9 ff __ LDA #$ff
1d74 : 8d 01 d6 STA $d601 
1d77 : a9 1f __ LDA #$1f
1d79 : 8d 00 d6 STA $d600 
.l9357:
1d7c : 2c 00 d6 BIT $d600 
1d7f : 10 fb __ BPL $1d7c ; (main.l9357 + 0)
.s74:
1d81 : a9 ff __ LDA #$ff
1d83 : 8d 01 d6 STA $d601 
1d86 : a9 12 __ LDA #$12
1d88 : 8d 00 d6 STA $d600 
.l9359:
1d8b : 2c 00 d6 BIT $d600 
1d8e : 10 fb __ BPL $1d8b ; (main.l9359 + 0)
.s81:
1d90 : a9 1f __ LDA #$1f
1d92 : 8d 01 d6 STA $d601 
1d95 : a9 13 __ LDA #$13
1d97 : 8d 00 d6 STA $d600 
.l9361:
1d9a : 2c 00 d6 BIT $d600 
1d9d : 10 fb __ BPL $1d9a ; (main.l9361 + 0)
.s86:
1d9f : a9 ff __ LDA #$ff
1da1 : 8d 01 d6 STA $d601 
1da4 : a9 1f __ LDA #$1f
1da6 : 8d 00 d6 STA $d600 
.l9363:
1da9 : 2c 00 d6 BIT $d600 
1dac : 10 fb __ BPL $1da9 ; (main.l9363 + 0)
.s90:
1dae : ad 01 d6 LDA $d601 
1db1 : f0 04 __ BEQ $1db7 ; (main.s1597 + 0)
.s1598:
1db3 : a9 10 __ LDA #$10
1db5 : d0 02 __ BNE $1db9 ; (main.s1599 + 0)
.s1597:
1db7 : a9 40 __ LDA #$40
.s1599:
1db9 : 8d 4b 55 STA $554b ; (vdc_state + 0)
1dbc : a9 1c __ LDA #$1c
1dbe : 8d 00 d6 STA $d600 
.l9366:
1dc1 : 2c 00 d6 BIT $d600 
1dc4 : 10 fb __ BPL $1dc1 ; (main.l9366 + 0)
.s97:
1dc6 : 86 53 __ STX T0 + 0 
1dc8 : 8c 01 d6 STY $d601 
1dcb : ad 4e 55 LDA $554e ; (vdc_state + 3)
1dce : 85 54 __ STA T1 + 0 
1dd0 : ad 50 55 LDA $5550 ; (vdc_state + 5)
1dd3 : 85 57 __ STA T3 + 0 
.l100:
1dd5 : a5 53 __ LDA T0 + 0 
1dd7 : c5 57 __ CMP T3 + 0 
1dd9 : b0 03 __ BCS $1dde ; (main.s30 + 0)
1ddb : 4c 3f 39 JMP $393f ; (main.s101 + 0)
.s30:
1dde : 24 d7 __ BIT $d7 
1de0 : 30 17 __ BMI $1df9 ; (main.s9394 + 0)
.s178:
1de2 : a9 77 __ LDA #$77
1de4 : a0 02 __ LDY #$02
1de6 : 91 23 __ STA (SP + 0),y 
1de8 : a9 40 __ LDA #$40
1dea : c8 __ __ INY
1deb : 91 23 __ STA (SP + 0),y 
1ded : 20 1a 3a JSR $3a1a ; (printf.s1000 + 0)
1df0 : 20 a2 40 JSR $40a2 ; (getch.s0 + 0)
1df3 : 20 e1 40 JSR $40e1 ; (clrscr.s0 + 0)
1df6 : 20 e5 40 JSR $40e5 ; (screen_setmode.s0 + 0)
.s9394:
1df9 : a5 ba __ LDA $ba 
1dfb : d0 02 __ BNE $1dff ; (main.s186 + 0)
.s184:
1dfd : a9 08 __ LDA #$08
.s186:
1dff : 85 53 __ STA T0 + 0 
1e01 : 85 f7 __ STA $f7 ; (bootdevice + 0)
1e03 : a9 ed __ LDA #$ed
1e05 : a0 02 __ LDY #$02
1e07 : 91 23 __ STA (SP + 0),y 
1e09 : a9 40 __ LDA #$40
1e0b : c8 __ __ INY
1e0c : 91 23 __ STA (SP + 0),y 
1e0e : a5 53 __ LDA T0 + 0 
1e10 : c8 __ __ INY
1e11 : 91 23 __ STA (SP + 0),y 
1e13 : a9 00 __ LDA #$00
1e15 : c8 __ __ INY
1e16 : 91 23 __ STA (SP + 0),y 
1e18 : 20 1a 3a JSR $3a1a ; (printf.s1000 + 0)
1e1b : a9 06 __ LDA #$06
1e1d : 8d 06 d5 STA $d506 
1e20 : a9 00 __ LDA #$00
1e22 : a0 02 __ LDY #$02
1e24 : 91 23 __ STA (SP + 0),y 
1e26 : a9 41 __ LDA #$41
1e28 : c8 __ __ INY
1e29 : 91 23 __ STA (SP + 0),y 
1e2b : 20 1a 3a JSR $3a1a ; (printf.s1000 + 0)
1e2e : a9 00 __ LDA #$00
1e30 : 85 0d __ STA P0 
1e32 : 85 0e __ STA P1 
1e34 : 20 1f 41 JSR $411f ; (krnio_setbnk.s0 + 0)
1e37 : a9 1a __ LDA #$1a
1e39 : 85 0d __ STA P0 
1e3b : a9 41 __ LDA #$41
1e3d : 85 0e __ STA P1 
1e3f : 20 27 41 JSR $4127 ; (krnio_setnam.s0 + 0)
1e42 : a9 01 __ LDA #$01
1e44 : 85 0d __ STA P0 
1e46 : 85 0f __ STA P2 
1e48 : a5 53 __ LDA T0 + 0 
1e4a : 85 0e __ STA P1 
1e4c : 20 3d 41 JSR $413d ; (krnio_load.s0 + 0)
1e4f : 09 00 __ ORA #$00
1e51 : d0 11 __ BNE $1e64 ; (main.s193 + 0)
.s189:
1e53 : a9 5a __ LDA #$5a
1e55 : a0 02 __ LDY #$02
1e57 : 91 23 __ STA (SP + 0),y 
1e59 : a9 41 __ LDA #$41
1e5b : c8 __ __ INY
1e5c : 91 23 __ STA (SP + 0),y 
1e5e : 20 1a 3a JSR $3a1a ; (printf.s1000 + 0)
1e61 : 20 78 41 JSR $4178 ; (exit@proxy + 0)
.s193:
1e64 : a9 01 __ LDA #$01
1e66 : 8d 30 d0 STA $d030 
1e69 : a9 00 __ LDA #$00
1e6b : 85 13 __ STA P6 
1e6d : ad 11 d0 LDA $d011 
1e70 : 29 6f __ AND #$6f
1e72 : 8d 11 d0 STA $d011 
1e75 : 20 95 41 JSR $4195 ; (vdc_set_mode.s1000 + 0)
1e78 : ad 4b 55 LDA $554b ; (vdc_state + 0)
1e7b : c9 40 __ CMP #$40
1e7d : f0 03 __ BEQ $1e82 ; (main.s199 + 0)
1e7f : 4c 99 1f JMP $1f99 ; (main.s3 + 0)
.s199:
1e82 : ad 4c 55 LDA $554c ; (vdc_state + 1)
1e85 : f0 03 __ BEQ $1e8a ; (main.s203 + 0)
1e87 : 4c 99 1f JMP $1f99 ; (main.s3 + 0)
.s203:
1e8a : a9 22 __ LDA #$22
1e8c : 8d 00 d6 STA $d600 
.l9833:
1e8f : 2c 00 d6 BIT $d600 
1e92 : 10 fb __ BPL $1e8f ; (main.l9833 + 0)
.s211:
1e94 : a9 80 __ LDA #$80
1e96 : 8d 01 d6 STA $d601 
1e99 : a2 00 __ LDX #$00
1e9b : a0 ff __ LDY #$ff
.l214:
1e9d : a9 12 __ LDA #$12
1e9f : 8d 00 d6 STA $d600 
.l9835:
1ea2 : 2c 00 d6 BIT $d600 
1ea5 : 10 fb __ BPL $1ea2 ; (main.l9835 + 0)
.s223:
1ea7 : 8e 01 d6 STX $d601 
1eaa : a9 13 __ LDA #$13
1eac : 8d 00 d6 STA $d600 
.l9837:
1eaf : 2c 00 d6 BIT $d600 
1eb2 : 10 fb __ BPL $1eaf ; (main.l9837 + 0)
.s228:
1eb4 : a9 00 __ LDA #$00
1eb6 : 8d 01 d6 STA $d601 
1eb9 : a9 1f __ LDA #$1f
1ebb : 8d 00 d6 STA $d600 
.l9839:
1ebe : 2c 00 d6 BIT $d600 
1ec1 : 10 fb __ BPL $1ebe ; (main.l9839 + 0)
.s232:
1ec3 : a9 00 __ LDA #$00
1ec5 : 8d 01 d6 STA $d601 
1ec8 : a9 18 __ LDA #$18
1eca : 8d 00 d6 STA $d600 
.l9841:
1ecd : 2c 00 d6 BIT $d600 
1ed0 : 10 fb __ BPL $1ecd ; (main.l9841 + 0)
.s238:
1ed2 : ad 01 d6 LDA $d601 
1ed5 : 29 7f __ AND #$7f
1ed7 : 85 57 __ STA T3 + 0 
1ed9 : a9 18 __ LDA #$18
1edb : 8d 00 d6 STA $d600 
.l9843:
1ede : 2c 00 d6 BIT $d600 
1ee1 : 10 fb __ BPL $1ede ; (main.l9843 + 0)
.s244:
1ee3 : a5 57 __ LDA T3 + 0 
1ee5 : 8d 01 d6 STA $d601 
1ee8 : a9 1e __ LDA #$1e
1eea : 8d 00 d6 STA $d600 
.l9845:
1eed : 2c 00 d6 BIT $d600 
1ef0 : 10 fb __ BPL $1eed ; (main.l9845 + 0)
.s249:
1ef2 : a9 ff __ LDA #$ff
1ef4 : 8d 01 d6 STA $d601 
1ef7 : e8 __ __ INX
1ef8 : 88 __ __ DEY
1ef9 : d0 a2 __ BNE $1e9d ; (main.l214 + 0)
.s216:
1efb : a9 12 __ LDA #$12
1efd : 8d 00 d6 STA $d600 
.l9848:
1f00 : 2c 00 d6 BIT $d600 
1f03 : 10 fb __ BPL $1f00 ; (main.l9848 + 0)
.s256:
1f05 : 8e 01 d6 STX $d601 
1f08 : a9 13 __ LDA #$13
1f0a : 8d 00 d6 STA $d600 
.l9850:
1f0d : 2c 00 d6 BIT $d600 
1f10 : 10 fb __ BPL $1f0d ; (main.l9850 + 0)
.s261:
1f12 : 8c 01 d6 STY $d601 
1f15 : a9 1f __ LDA #$1f
1f17 : 8d 00 d6 STA $d600 
.l9852:
1f1a : 2c 00 d6 BIT $d600 
1f1d : 10 fb __ BPL $1f1a ; (main.l9852 + 0)
.s265:
1f1f : 8c 01 d6 STY $d601 
1f22 : a9 18 __ LDA #$18
1f24 : 8d 00 d6 STA $d600 
.l9854:
1f27 : 2c 00 d6 BIT $d600 
1f2a : 10 fb __ BPL $1f27 ; (main.l9854 + 0)
.s271:
1f2c : ad 01 d6 LDA $d601 
1f2f : 29 7f __ AND #$7f
1f31 : aa __ __ TAX
1f32 : a9 18 __ LDA #$18
1f34 : 8d 00 d6 STA $d600 
.l9856:
1f37 : 2c 00 d6 BIT $d600 
1f3a : 10 fb __ BPL $1f37 ; (main.l9856 + 0)
.s277:
1f3c : 8e 01 d6 STX $d601 
1f3f : a9 1e __ LDA #$1e
1f41 : 8d 00 d6 STA $d600 
.l9858:
1f44 : 2c 00 d6 BIT $d600 
1f47 : 10 fb __ BPL $1f44 ; (main.l9858 + 0)
.s282:
1f49 : a9 ff __ LDA #$ff
1f4b : 8d 01 d6 STA $d601 
1f4e : a9 1c __ LDA #$1c
1f50 : 8d 00 d6 STA $d600 
.l9860:
1f53 : 2c 00 d6 BIT $d600 
1f56 : 10 fb __ BPL $1f53 ; (main.l9860 + 0)
.s288:
1f58 : ad 01 d6 LDA $d601 
1f5b : 09 10 __ ORA #$10
1f5d : aa __ __ TAX
1f5e : a9 1c __ LDA #$1c
1f60 : 8d 00 d6 STA $d600 
.l9862:
1f63 : 2c 00 d6 BIT $d600 
1f66 : 10 fb __ BPL $1f63 ; (main.l9862 + 0)
.s294:
1f68 : 8e 01 d6 STX $d601 
1f6b : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
1f6e : a9 00 __ LDA #$00
1f70 : 85 53 __ STA T0 + 0 
1f72 : ad 4e 55 LDA $554e ; (vdc_state + 3)
1f75 : 85 54 __ STA T1 + 0 
1f77 : ad 50 55 LDA $5550 ; (vdc_state + 5)
1f7a : 85 57 __ STA T3 + 0 
.l298:
1f7c : a5 53 __ LDA T0 + 0 
1f7e : c5 57 __ CMP T3 + 0 
1f80 : b0 03 __ BCS $1f85 ; (main.s296 + 0)
1f82 : 4c 64 38 JMP $3864 ; (main.s299 + 0)
.s296:
1f85 : a9 22 __ LDA #$22
1f87 : 8d 00 d6 STA $d600 
.l9889:
1f8a : 2c 00 d6 BIT $d600 
1f8d : 10 fb __ BPL $1f8a ; (main.l9889 + 0)
.s376:
1f8f : a9 7d __ LDA #$7d
1f91 : 8d 01 d6 STA $d601 
1f94 : a9 01 __ LDA #$01
1f96 : 8d 4c 55 STA $554c ; (vdc_state + 1)
.s3:
1f99 : a9 00 __ LDA #$00
1f9b : 85 0d __ STA P0 
1f9d : a9 95 __ LDA #$95
1f9f : 85 0e __ STA P1 
1fa1 : a9 47 __ LDA #$47
1fa3 : 85 0f __ STA P2 
1fa5 : 20 74 46 JSR $4674 ; (vdc_prints.s0 + 0)
1fa8 : a9 00 __ LDA #$00
1faa : a0 02 __ LDY #$02
1fac : 91 23 __ STA (SP + 0),y 
1fae : a9 56 __ LDA #$56
1fb0 : c8 __ __ INY
1fb1 : 91 23 __ STA (SP + 0),y 
1fb3 : a9 00 __ LDA #$00
1fb5 : c8 __ __ INY
1fb6 : 91 23 __ STA (SP + 0),y 
1fb8 : a9 4b __ LDA #$4b
1fba : c8 __ __ INY
1fbb : 91 23 __ STA (SP + 0),y 
1fbd : ad 4b 55 LDA $554b ; (vdc_state + 0)
1fc0 : c8 __ __ INY
1fc1 : 91 23 __ STA (SP + 0),y 
1fc3 : a9 00 __ LDA #$00
1fc5 : c8 __ __ INY
1fc6 : 91 23 __ STA (SP + 0),y 
1fc8 : ad 4c 55 LDA $554c ; (vdc_state + 1)
1fcb : d0 07 __ BNE $1fd4 ; (main.s4969 + 0)
.s4970:
1fcd : a9 4a __ LDA #$4a
1fcf : a2 d6 __ LDX #$d6
1fd1 : 4c d8 1f JMP $1fd8 ; (main.s4971 + 0)
.s4969:
1fd4 : a9 40 __ LDA #$40
1fd6 : a2 fd __ LDX #$fd
.s4971:
1fd8 : 85 58 __ STA T3 + 1 
1fda : 8a __ __ TXA
1fdb : a0 08 __ LDY #$08
1fdd : 91 23 __ STA (SP + 0),y 
1fdf : a5 58 __ LDA T3 + 1 
1fe1 : c8 __ __ INY
1fe2 : 91 23 __ STA (SP + 0),y 
1fe4 : 20 b0 47 JSR $47b0 ; (sprintf.s1000 + 0)
1fe7 : 20 af 53 JSR $53af ; (vdc_prints@proxy + 0)
1fea : a9 04 __ LDA #$04
1fec : 85 0d __ STA P0 
1fee : a9 da __ LDA #$da
1ff0 : 85 0e __ STA P1 
1ff2 : a9 4a __ LDA #$4a
1ff4 : 85 0f __ STA P2 
1ff6 : 20 74 46 JSR $4674 ; (vdc_prints.s0 + 0)
1ff9 : e6 0d __ INC P0 
1ffb : a9 35 __ LDA #$35
1ffd : 85 0e __ STA P1 
1fff : a9 4b __ LDA #$4b
2001 : 85 0f __ STA P2 
2003 : 20 74 46 JSR $4674 ; (vdc_prints.s0 + 0)
2006 : a5 f7 __ LDA $f7 ; (bootdevice + 0)
2008 : 85 53 __ STA T0 + 0 
200a : 85 0f __ STA P2 
200c : a9 00 __ LDA #$00
200e : 85 10 __ STA P3 
2010 : a9 20 __ LDA #$20
2012 : 85 11 __ STA P4 
2014 : a9 ea __ LDA #$ea
2016 : 85 12 __ STA P5 
2018 : a9 4a __ LDA #$4a
201a : 85 13 __ STA P6 
201c : 20 8a 13 JSR $138a ; (bnk_load.s0 + 0)
201f : a5 1b __ LDA ACCU + 0 
2021 : d0 0a __ BNE $202d ; (main.s379 + 0)
.s377:
2023 : a9 06 __ LDA #$06
2025 : 85 0d __ STA P0 
2027 : 20 6c 46 JSR $466c ; (vdc_prints@proxy + 0)
202a : 20 78 41 JSR $4178 ; (exit@proxy + 0)
.s379:
202d : a9 06 __ LDA #$06
202f : 85 0d __ STA P0 
2031 : a9 50 __ LDA #$50
2033 : 85 0e __ STA P1 
2035 : a9 4b __ LDA #$4b
2037 : 85 0f __ STA P2 
2039 : 20 74 46 JSR $4674 ; (vdc_prints.s0 + 0)
203c : a5 53 __ LDA T0 + 0 
203e : 85 0f __ STA P2 
2040 : a9 00 __ LDA #$00
2042 : 85 56 __ STA T2 + 0 
2044 : 85 10 __ STA P3 
2046 : a9 80 __ LDA #$80
2048 : 85 11 __ STA P4 
204a : a9 6d __ LDA #$6d
204c : 85 12 __ STA P5 
204e : a9 4b __ LDA #$4b
2050 : 85 13 __ STA P6 
2052 : 20 8a 13 JSR $138a ; (bnk_load.s0 + 0)
2055 : a5 1b __ LDA ACCU + 0 
2057 : d0 0a __ BNE $2063 ; (main.s7243 + 0)
.s380:
2059 : a9 07 __ LDA #$07
205b : 85 0d __ STA P0 
205d : 20 6c 46 JSR $466c ; (vdc_prints@proxy + 0)
2060 : 20 78 41 JSR $4178 ; (exit@proxy + 0)
.s7243:
2063 : ad 1f bf LDA $bf1f ; (softscroll + 4)
2066 : 85 1b __ STA ACCU + 0 
2068 : a9 00 __ LDA #$00
206a : 85 1c __ STA ACCU + 1 
206c : ad 1e bf LDA $bf1e ; (softscroll + 3)
206f : 85 54 __ STA T1 + 0 
2071 : 20 22 52 JSR $5222 ; (mul16by8 + 0)
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
2086 : 90 01 __ BCC $2089 ; (main.s1601 + 0)
.s1600:
2088 : c8 __ __ INY
.s1601:
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
209e : ad 4c 55 LDA $554c ; (vdc_state + 1)
20a1 : d0 03 __ BNE $20a6 ; (main.l394 + 0)
20a3 : 4c 8d 23 JMP $238d ; (main.s7022 + 0)
.l394:
20a6 : a9 e0 __ LDA #$e0
20a8 : c5 5a __ CMP T4 + 1 
20aa : d0 04 __ BNE $20b0 ; (main.s1467 + 0)
.s1466:
20ac : a9 00 __ LDA #$00
20ae : c5 59 __ CMP T4 + 0 
.s1467:
20b0 : b0 03 __ BCS $20b5 ; (main.s393 + 0)
20b2 : 4c 8d 23 JMP $238d ; (main.s7022 + 0)
.s393:
20b5 : a5 56 __ LDA T2 + 0 
20b7 : cd 4d 55 CMP $554d ; (vdc_state + 2)
20ba : f0 05 __ BEQ $20c1 ; (main.s399 + 0)
.s397:
20bc : 85 13 __ STA P6 
20be : 20 95 41 JSR $4195 ; (vdc_set_mode.s1000 + 0)
.s399:
20c1 : a9 00 __ LDA #$00
20c3 : 8d 53 55 STA $5553 ; (vdc_state + 8)
20c6 : 8d 5b 55 STA $555b ; (vdc_state + 16)
20c9 : 8d 5c 55 STA $555c ; (vdc_state + 17)
20cc : 8d 5d 55 STA $555d ; (vdc_state + 18)
20cf : a9 20 __ LDA #$20
20d1 : 8d 54 55 STA $5554 ; (vdc_state + 9)
20d4 : a9 10 __ LDA #$10
20d6 : 8d 5e 55 STA $555e ; (vdc_state + 19)
20d9 : 18 __ __ CLC
20da : a5 58 __ LDA T3 + 1 
20dc : 69 20 __ ADC #$20
20de : 8d 56 55 STA $5556 ; (vdc_state + 11)
20e1 : a5 57 __ LDA T3 + 0 
20e3 : 8d 55 55 STA $5555 ; (vdc_state + 10)
20e6 : ad 4e 55 LDA $554e ; (vdc_state + 3)
20e9 : 85 5b __ STA T5 + 0 
20eb : 49 ff __ EOR #$ff
20ed : 38 __ __ SEC
20ee : 65 54 __ ADC T1 + 0 
20f0 : 8d 63 55 STA $5563 ; (vdc_state + 24)
20f3 : ad 51 55 LDA $5551 ; (vdc_state + 6)
20f6 : 85 60 __ STA T7 + 1 
20f8 : ad 50 55 LDA $5550 ; (vdc_state + 5)
20fb : 85 5f __ STA T7 + 0 
20fd : 05 60 __ ORA T7 + 1 
20ff : f0 4b __ BEQ $214c ; (main.s400 + 0)
.s2537:
2101 : ad 63 55 LDA $5563 ; (vdc_state + 24)
2104 : 18 __ __ CLC
2105 : 65 5b __ ADC T5 + 0 
2107 : 85 5d __ STA T6 + 0 
2109 : a9 00 __ LDA #$00
210b : 6d 4f 55 ADC $554f ; (vdc_state + 4)
210e : 85 5e __ STA T6 + 1 
2110 : a9 00 __ LDA #$00
2112 : 85 1b __ STA ACCU + 0 
2114 : 85 1c __ STA ACCU + 1 
2116 : a9 64 __ LDA #$64
2118 : 85 62 __ STA T12 + 0 
211a : a9 55 __ LDA #$55
211c : 85 63 __ STA T12 + 1 
211e : a2 00 __ LDX #$00
.l402:
2120 : a5 1b __ LDA ACCU + 0 
2122 : a0 00 __ LDY #$00
2124 : 91 62 __ STA (T12 + 0),y 
2126 : a5 1c __ LDA ACCU + 1 
2128 : c8 __ __ INY
2129 : 91 62 __ STA (T12 + 0),y 
212b : 18 __ __ CLC
212c : a5 5d __ LDA T6 + 0 
212e : 65 1b __ ADC ACCU + 0 
2130 : 85 1b __ STA ACCU + 0 
2132 : a5 5e __ LDA T6 + 1 
2134 : 65 1c __ ADC ACCU + 1 
2136 : 85 1c __ STA ACCU + 1 
2138 : 18 __ __ CLC
2139 : a5 62 __ LDA T12 + 0 
213b : 69 02 __ ADC #$02
213d : 85 62 __ STA T12 + 0 
213f : 90 02 __ BCC $2143 ; (main.s1627 + 0)
.s1626:
2141 : e6 63 __ INC T12 + 1 
.s1627:
2143 : e8 __ __ INX
2144 : a5 60 __ LDA T7 + 1 
2146 : d0 d8 __ BNE $2120 ; (main.l402 + 0)
.s1462:
2148 : e4 5f __ CPX T7 + 0 
214a : 90 d4 __ BCC $2120 ; (main.l402 + 0)
.s400:
214c : 85 61 __ STA T8 + 0 
214e : c5 5f __ CMP T7 + 0 
2150 : b0 03 __ BCS $2155 ; (main.s405 + 0)
2152 : 4c 80 37 JMP $3780 ; (main.l408 + 0)
.s405:
2155 : ad 5b 55 LDA $555b ; (vdc_state + 16)
2158 : 85 0d __ STA P0 
215a : ad 5c 55 LDA $555c ; (vdc_state + 17)
215d : 85 0e __ STA P1 
215f : a9 1c __ LDA #$1c
2161 : 8d 00 d6 STA $d600 
.l9702:
2164 : 2c 00 d6 BIT $d600 
2167 : 10 fb __ BPL $2164 ; (main.l9702 + 0)
.s486:
2169 : ad 01 d6 LDA $d601 
216c : 29 10 __ AND #$10
216e : 45 0e __ EOR P1 
2170 : 29 1f __ AND #$1f
2172 : 45 0e __ EOR P1 
2174 : aa __ __ TAX
2175 : a9 1c __ LDA #$1c
2177 : 8d 00 d6 STA $d600 
.l9704:
217a : 2c 00 d6 BIT $d600 
217d : 10 fb __ BPL $217a ; (main.l9704 + 0)
.s492:
217f : 8e 01 d6 STX $d601 
2182 : 20 0a 13 JSR $130a ; (bnk_redef_charset.s0 + 0)
2185 : ad 53 55 LDA $5553 ; (vdc_state + 8)
2188 : 85 0d __ STA P0 
218a : ad 55 55 LDA $5555 ; (vdc_state + 10)
218d : 85 5d __ STA T6 + 0 
218f : ad 56 55 LDA $5556 ; (vdc_state + 11)
2192 : 85 5e __ STA T6 + 1 
2194 : a9 0c __ LDA #$0c
2196 : 8d 00 d6 STA $d600 
2199 : ae 54 55 LDX $5554 ; (vdc_state + 9)
219c : 86 0e __ STX P1 
.l9706:
219e : 2c 00 d6 BIT $d600 
21a1 : 10 fb __ BPL $219e ; (main.l9706 + 0)
.s499:
21a3 : 8e 01 d6 STX $d601 
21a6 : a9 0d __ LDA #$0d
21a8 : 8d 00 d6 STA $d600 
.l9708:
21ab : 2c 00 d6 BIT $d600 
21ae : 10 fb __ BPL $21ab ; (main.l9708 + 0)
.s504:
21b0 : a5 0d __ LDA P0 
21b2 : 8d 01 d6 STA $d601 
21b5 : a9 14 __ LDA #$14
21b7 : 8d 00 d6 STA $d600 
.l9710:
21ba : 2c 00 d6 BIT $d600 
21bd : 10 fb __ BPL $21ba ; (main.l9710 + 0)
.s509:
21bf : a5 5e __ LDA T6 + 1 
21c1 : 8d 01 d6 STA $d601 
21c4 : a9 15 __ LDA #$15
21c6 : 8d 00 d6 STA $d600 
.l9712:
21c9 : 2c 00 d6 BIT $d600 
21cc : 10 fb __ BPL $21c9 ; (main.l9712 + 0)
.s514:
21ce : a5 5d __ LDA T6 + 0 
21d0 : 8d 01 d6 STA $d601 
21d3 : a9 1b __ LDA #$1b
21d5 : 8d 00 d6 STA $d600 
21d8 : ae 63 55 LDX $5563 ; (vdc_state + 24)
.l9714:
21db : 2c 00 d6 BIT $d600 
21de : 10 fb __ BPL $21db ; (main.l9714 + 0)
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
221c : 90 01 __ BCC $221f ; (main.s1629 + 0)
.s1628:
221e : c8 __ __ INY
.s1629:
221f : 84 11 __ STY P4 
2221 : 20 d1 13 JSR $13d1 ; (bnk_cpytovdc.s0 + 0)
2224 : a9 00 __ LDA #$00
2226 : 8d 20 bf STA $bf20 ; (softscroll + 5)
2229 : 8d 21 bf STA $bf21 ; (softscroll + 6)
222c : 8d 22 bf STA $bf22 ; (softscroll + 7)
222f : 8d 23 bf STA $bf23 ; (softscroll + 8)
2232 : a9 18 __ LDA #$18
2234 : 8d 00 d6 STA $d600 
.l9716:
2237 : 2c 00 d6 BIT $d600 
223a : 10 fb __ BPL $2237 ; (main.l9716 + 0)
.s524:
223c : ad 01 d6 LDA $d601 
223f : 29 f0 __ AND #$f0
2241 : 8d 24 bf STA $bf24 ; (softscroll + 9)
2244 : a9 19 __ LDA #$19
2246 : 8d 00 d6 STA $d600 
.l9718:
2249 : 2c 00 d6 BIT $d600 
224c : 10 fb __ BPL $2249 ; (main.l9718 + 0)
.s531:
224e : ad 01 d6 LDA $d601 
2251 : 29 0f __ AND #$0f
2253 : 8d 2a bf STA $bf2a ; (softscroll + 15)
2256 : a9 19 __ LDA #$19
2258 : 8d 00 d6 STA $d600 
.l9720:
225b : 2c 00 d6 BIT $d600 
225e : 10 fb __ BPL $225b ; (main.l9720 + 0)
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
2276 : 20 a2 40 JSR $40a2 ; (getch.s0 + 0)
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
2290 : 4c b7 36 JMP $36b7 ; (main.l548 + 0)
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
22b7 : d0 02 __ BNE $22bb ; (main.s1393 + 0)
.s1392:
22b9 : e4 5d __ CPX T6 + 0 
.s1393:
22bb : b0 03 __ BCS $22c0 ; (main.s598 + 0)
22bd : 4c 04 36 JMP $3604 ; (main.l600 + 0)
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
22db : b0 03 __ BCS $22e0 ; (main.s1631 + 0)
.s1630:
22dd : ce 29 bf DEC $bf29 ; (softscroll + 14)
.s1631:
22e0 : ad 23 bf LDA $bf23 ; (softscroll + 8)
22e3 : 18 __ __ CLC
22e4 : 69 02 __ ADC #$02
22e6 : 8d 23 bf STA $bf23 ; (softscroll + 8)
22e9 : c9 07 __ CMP #$07
22eb : 90 03 __ BCC $22f0 ; (main.s654 + 0)
22ed : 4c 74 35 JMP $3574 ; (main.s653 + 0)
.s654:
22f0 : a9 19 __ LDA #$19
22f2 : 8d 00 d6 STA $d600 
22f5 : ad 25 bf LDA $bf25 ; (softscroll + 10)
22f8 : 6d 23 bf ADC $bf23 ; (softscroll + 8)
.l9813:
22fb : 2c 00 d6 BIT $d600 
22fe : 10 fb __ BPL $22fb ; (main.l9813 + 0)
.s1594:
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
2323 : d0 05 __ BNE $232a ; (main.s1355 + 0)
.s1354:
2325 : ad 26 bf LDA $bf26 ; (softscroll + 11)
2328 : c5 5d __ CMP T6 + 0 
.s1355:
232a : b0 03 __ BCS $232f ; (main.s699 + 0)
232c : 4c af 34 JMP $34af ; (main.s701 + 0)
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
2340 : ad 4e 55 LDA $554e ; (vdc_state + 3)
2343 : 85 5b __ STA T5 + 0 
2345 : ad 50 55 LDA $5550 ; (vdc_state + 5)
2348 : 85 5d __ STA T6 + 0 
.l752:
234a : a5 61 __ LDA T8 + 0 
234c : c5 5d __ CMP T6 + 0 
234e : b0 03 __ BCS $2353 ; (main.s750 + 0)
2350 : 4c d4 33 JMP $33d4 ; (main.s753 + 0)
.s750:
2353 : a9 1b __ LDA #$1b
2355 : 8d 00 d6 STA $d600 
.l9791:
2358 : 2c 00 d6 BIT $d600 
235b : 10 fb __ BPL $2358 ; (main.l9791 + 0)
.s829:
235d : a9 00 __ LDA #$00
235f : 8d 01 d6 STA $d601 
2362 : a9 18 __ LDA #$18
2364 : 8d 00 d6 STA $d600 
2367 : ae 24 bf LDX $bf24 ; (softscroll + 9)
.l9793:
236a : 2c 00 d6 BIT $d600 
236d : 10 fb __ BPL $236a ; (main.l9793 + 0)
.s834:
236f : 8e 01 d6 STX $d601 
2372 : a9 19 __ LDA #$19
2374 : 8d 00 d6 STA $d600 
2377 : ad 2a bf LDA $bf2a ; (softscroll + 15)
237a : 18 __ __ CLC
237b : 6d 25 bf ADC $bf25 ; (softscroll + 10)
.l9795:
237e : 2c 00 d6 BIT $d600 
2381 : 10 fb __ BPL $237e ; (main.l9795 + 0)
.s839:
2383 : 8d 01 d6 STA $d601 
2386 : a5 56 __ LDA T2 + 0 
2388 : 85 13 __ STA P6 
238a : 20 95 41 JSR $4195 ; (vdc_set_mode.s1000 + 0)
.s7022:
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
23a5 : 20 95 41 JSR $4195 ; (vdc_set_mode.s1000 + 0)
23a8 : a9 12 __ LDA #$12
23aa : 8d 00 d6 STA $d600 
23ad : ad 64 55 LDA $5564 ; (multab + 0)
23b0 : 18 __ __ CLC
23b1 : 6d 53 55 ADC $5553 ; (vdc_state + 8)
23b4 : aa __ __ TAX
23b5 : ad 65 55 LDA $5565 ; (multab + 1)
23b8 : 6d 54 55 ADC $5554 ; (vdc_state + 9)
.l9403:
23bb : 2c 00 d6 BIT $d600 
23be : 10 fb __ BPL $23bb ; (main.l9403 + 0)
.s853:
23c0 : 8d 01 d6 STA $d601 
23c3 : a9 13 __ LDA #$13
23c5 : 8d 00 d6 STA $d600 
.l9405:
23c8 : 2c 00 d6 BIT $d600 
23cb : 10 fb __ BPL $23c8 ; (main.l9405 + 0)
.s858:
23cd : 8e 01 d6 STX $d601 
23d0 : a9 1f __ LDA #$1f
23d2 : 8d 00 d6 STA $d600 
.l9407:
23d5 : 2c 00 d6 BIT $d600 
23d8 : 10 fb __ BPL $23d5 ; (main.l9407 + 0)
.s862:
23da : a9 20 __ LDA #$20
23dc : 8d 01 d6 STA $d601 
23df : a9 18 __ LDA #$18
23e1 : 8d 00 d6 STA $d600 
.l9409:
23e4 : 2c 00 d6 BIT $d600 
23e7 : 10 fb __ BPL $23e4 ; (main.l9409 + 0)
.s868:
23e9 : ad 01 d6 LDA $d601 
23ec : 29 7f __ AND #$7f
23ee : aa __ __ TAX
23ef : a9 18 __ LDA #$18
23f1 : 8d 00 d6 STA $d600 
.l9411:
23f4 : 2c 00 d6 BIT $d600 
23f7 : 10 fb __ BPL $23f4 ; (main.l9411 + 0)
.s874:
23f9 : 8e 01 d6 STX $d601 
23fc : a9 1e __ LDA #$1e
23fe : 8d 00 d6 STA $d600 
.l9413:
2401 : 2c 00 d6 BIT $d600 
2404 : 10 fb __ BPL $2401 ; (main.l9413 + 0)
.s879:
2406 : a9 4e __ LDA #$4e
2408 : 8d 01 d6 STA $d601 
240b : ad 55 55 LDA $5555 ; (vdc_state + 10)
240e : 18 __ __ CLC
240f : 6d 64 55 ADC $5564 ; (multab + 0)
2412 : aa __ __ TAX
2413 : a9 12 __ LDA #$12
2415 : 8d 00 d6 STA $d600 
2418 : ad 56 55 LDA $5556 ; (vdc_state + 11)
241b : 6d 65 55 ADC $5565 ; (multab + 1)
.l9415:
241e : 2c 00 d6 BIT $d600 
2421 : 10 fb __ BPL $241e ; (main.l9415 + 0)
.s886:
2423 : 8d 01 d6 STA $d601 
2426 : a9 13 __ LDA #$13
2428 : 8d 00 d6 STA $d600 
.l9417:
242b : 2c 00 d6 BIT $d600 
242e : 10 fb __ BPL $242b ; (main.l9417 + 0)
.s891:
2430 : 8e 01 d6 STX $d601 
2433 : a9 1f __ LDA #$1f
2435 : 8d 00 d6 STA $d600 
.l9419:
2438 : 2c 00 d6 BIT $d600 
243b : 10 fb __ BPL $2438 ; (main.l9419 + 0)
.s895:
243d : a9 c5 __ LDA #$c5
243f : 8d 01 d6 STA $d601 
2442 : a9 18 __ LDA #$18
2444 : 8d 00 d6 STA $d600 
.l9421:
2447 : 2c 00 d6 BIT $d600 
244a : 10 fb __ BPL $2447 ; (main.l9421 + 0)
.s901:
244c : ad 01 d6 LDA $d601 
244f : 29 7f __ AND #$7f
2451 : aa __ __ TAX
2452 : a9 18 __ LDA #$18
2454 : 8d 00 d6 STA $d600 
.l9423:
2457 : 2c 00 d6 BIT $d600 
245a : 10 fb __ BPL $2457 ; (main.l9423 + 0)
.s907:
245c : 8e 01 d6 STX $d601 
245f : a9 1e __ LDA #$1e
2461 : 8d 00 d6 STA $d600 
.l9425:
2464 : 2c 00 d6 BIT $d600 
2467 : 10 fb __ BPL $2464 ; (main.l9425 + 0)
.s912:
2469 : a9 4e __ LDA #$4e
246b : 8d 01 d6 STA $d601 
246e : a9 00 __ LDA #$00
2470 : 85 0d __ STA P0 
2472 : ad 52 55 LDA $5552 ; (vdc_state + 7)
2475 : 29 f0 __ AND #$f0
2477 : 09 45 __ ORA #$45
2479 : 85 54 __ STA T1 + 0 
247b : 8d 52 55 STA $5552 ; (vdc_state + 7)
247e : a9 75 __ LDA #$75
2480 : 85 0e __ STA P1 
2482 : a9 4b __ LDA #$4b
2484 : 85 0f __ STA P2 
2486 : 20 74 46 JSR $4674 ; (vdc_prints.s0 + 0)
2489 : a5 54 __ LDA T1 + 0 
248b : 29 b0 __ AND #$b0
248d : 09 0d __ ORA #$0d
248f : 8d 52 55 STA $5552 ; (vdc_state + 7)
2492 : a9 00 __ LDA #$00
2494 : a0 02 __ LDY #$02
2496 : 91 23 __ STA (SP + 0),y 
2498 : a9 56 __ LDA #$56
249a : c8 __ __ INY
249b : 91 23 __ STA (SP + 0),y 
249d : a9 86 __ LDA #$86
249f : c8 __ __ INY
24a0 : 91 23 __ STA (SP + 0),y 
24a2 : a9 4b __ LDA #$4b
24a4 : c8 __ __ INY
24a5 : 91 23 __ STA (SP + 0),y 
24a7 : ad 4b 55 LDA $554b ; (vdc_state + 0)
24aa : c8 __ __ INY
24ab : 91 23 __ STA (SP + 0),y 
24ad : a9 00 __ LDA #$00
24af : c8 __ __ INY
24b0 : 91 23 __ STA (SP + 0),y 
24b2 : ad 4e 55 LDA $554e ; (vdc_state + 3)
24b5 : c8 __ __ INY
24b6 : 91 23 __ STA (SP + 0),y 
24b8 : ad 4f 55 LDA $554f ; (vdc_state + 4)
24bb : c8 __ __ INY
24bc : 91 23 __ STA (SP + 0),y 
24be : ad 50 55 LDA $5550 ; (vdc_state + 5)
24c1 : 85 57 __ STA T3 + 0 
24c3 : c8 __ __ INY
24c4 : 91 23 __ STA (SP + 0),y 
24c6 : ad 51 55 LDA $5551 ; (vdc_state + 6)
24c9 : c8 __ __ INY
24ca : 91 23 __ STA (SP + 0),y 
24cc : ad 4c 55 LDA $554c ; (vdc_state + 1)
24cf : d0 07 __ BNE $24d8 ; (main.s4978 + 0)
.s4979:
24d1 : a9 4b __ LDA #$4b
24d3 : a2 c6 __ LDX #$c6
24d5 : 4c dc 24 JMP $24dc ; (main.s4980 + 0)
.s4978:
24d8 : a9 4b __ LDA #$4b
24da : a2 c2 __ LDX #$c2
.s4980:
24dc : 85 5a __ STA T4 + 1 
24de : 8a __ __ TXA
24df : a0 0c __ LDY #$0c
24e1 : 91 23 __ STA (SP + 0),y 
24e3 : a5 5a __ LDA T4 + 1 
24e5 : c8 __ __ INY
24e6 : 91 23 __ STA (SP + 0),y 
24e8 : 20 b0 47 JSR $47b0 ; (sprintf.s1000 + 0)
24eb : 20 af 53 JSR $53af ; (vdc_prints@proxy + 0)
24ee : e6 0d __ INC P0 
24f0 : a9 ca __ LDA #$ca
24f2 : 85 0e __ STA P1 
24f4 : a9 4b __ LDA #$4b
24f6 : 85 0f __ STA P2 
24f8 : 20 74 46 JSR $4674 ; (vdc_prints.s0 + 0)
24fb : a6 57 __ LDX T3 + 0 
24fd : ca __ __ DEX
24fe : 86 0d __ STX P0 
2500 : a9 00 __ LDA #$00
2502 : 85 0e __ STA P1 
2504 : a9 4c __ LDA #$4c
2506 : 85 0f __ STA P2 
2508 : 20 74 46 JSR $4674 ; (vdc_prints.s0 + 0)
250b : a9 05 __ LDA #$05
250d : 85 0f __ STA P2 
250f : 85 10 __ STA P3 
2511 : a9 46 __ LDA #$46
2513 : 85 11 __ STA P4 
2515 : a9 4b __ LDA #$4b
2517 : 85 0d __ STA P0 
2519 : a9 bf __ LDA #$bf
251b : 85 0e __ STA P1 
251d : 38 __ __ SEC
251e : a5 57 __ LDA T3 + 0 
2520 : e9 07 __ SBC #$07
2522 : 85 12 __ STA P5 
2524 : 20 56 4c JSR $4c56 ; (vdcwin_init.s0 + 0)
2527 : ad 08 dc LDA $dc08 
252a : 8d ce 53 STA $53ce ; (seed + 0)
252d : a9 00 __ LDA #$00
252f : 8d cf 53 STA $53cf ; (seed + 1)
2532 : a9 c8 __ LDA #$c8
2534 : 85 56 __ STA T2 + 0 
.l919:
2536 : a9 00 __ LDA #$00
2538 : 85 16 __ STA P9 
253a : a9 56 __ LDA #$56
253c : 85 17 __ STA P10 
253e : ad cf 53 LDA $53cf ; (seed + 1)
2541 : 4a __ __ LSR
2542 : ad ce 53 LDA $53ce ; (seed + 0)
2545 : 6a __ __ ROR
2546 : aa __ __ TAX
2547 : a9 00 __ LDA #$00
2549 : 85 04 __ STA WORK + 1 
254b : 6a __ __ ROR
254c : 4d ce 53 EOR $53ce ; (seed + 0)
254f : 85 59 __ STA T4 + 0 
2551 : 8a __ __ TXA
2552 : 4d cf 53 EOR $53cf ; (seed + 1)
2555 : 85 5a __ STA T4 + 1 
2557 : 4a __ __ LSR
2558 : 45 59 __ EOR T4 + 0 
255a : 8d ce 53 STA $53ce ; (seed + 0)
255d : 85 1b __ STA ACCU + 0 
255f : 45 5a __ EOR T4 + 1 
2561 : 8d cf 53 STA $53cf ; (seed + 1)
2564 : 85 1c __ STA ACCU + 1 
2566 : ad 52 55 LDA $5552 ; (vdc_state + 7)
2569 : 29 f0 __ AND #$f0
256b : 85 5b __ STA T5 + 0 
256d : a9 0f __ LDA #$0f
256f : 85 03 __ STA WORK + 0 
2571 : 20 84 52 JSR $5284 ; (divmod + 0)
2574 : a5 05 __ LDA WORK + 2 
2576 : 38 __ __ SEC
2577 : 65 5b __ ADC T5 + 0 
2579 : 8d 52 55 STA $5552 ; (vdc_state + 7)
257c : 20 bf 4c JSR $4cbf ; (generateSentence.s1000 + 0)
257f : a9 00 __ LDA #$00
2581 : 85 61 __ STA T8 + 0 
2583 : 85 59 __ STA T4 + 0 
2585 : ad 00 56 LDA $5600 ; (linebuffer + 0)
2588 : f0 0c __ BEQ $2596 ; (main.s929 + 0)
.s928:
258a : a2 00 __ LDX #$00
.l1588:
258c : bd 01 56 LDA $5601,x ; (linebuffer + 1)
258f : e8 __ __ INX
2590 : 09 00 __ ORA #$00
2592 : d0 f8 __ BNE $258c ; (main.l1588 + 0)
.s1589:
2594 : 86 59 __ STX T4 + 0 
.s929:
2596 : a5 59 __ LDA T4 + 0 
2598 : f0 30 __ BEQ $25ca ; (main.s925 + 0)
.s2446:
259a : ae 4d bf LDX $bf4d ; (window + 2)
259d : ca __ __ DEX
259e : 86 5b __ STX T5 + 0 
25a0 : a9 ff __ LDA #$ff
25a2 : 85 5e __ STA T6 + 1 
25a4 : 85 60 __ STA T7 + 1 
25a6 : a9 00 __ LDA #$00
25a8 : 85 43 __ STA T9 + 0 
.l934:
25aa : a5 61 __ LDA T8 + 0 
25ac : c5 59 __ CMP T4 + 0 
25ae : b0 0d __ BCS $25bd ; (main.s937 + 0)
.l939:
25b0 : 24 60 __ BIT T7 + 1 
25b2 : 10 09 __ BPL $25bd ; (main.s937 + 0)
.s938:
25b4 : a5 43 __ LDA T9 + 0 
25b6 : c9 50 __ CMP #$50
25b8 : b0 03 __ BCS $25bd ; (main.s937 + 0)
25ba : 4c b1 33 JMP $33b1 ; (main.s936 + 0)
.s937:
25bd : a6 43 __ LDX T9 + 0 
25bf : f0 03 __ BEQ $25c4 ; (main.s931 + 0)
25c1 : 4c 4b 33 JMP $334b ; (main.s949 + 0)
.s931:
25c4 : a5 61 __ LDA T8 + 0 
25c6 : c5 59 __ CMP T4 + 0 
25c8 : 90 e6 __ BCC $25b0 ; (main.l939 + 0)
.s925:
25ca : ad 4f bf LDA $bf4f ; (window + 4)
25cd : f0 03 __ BEQ $25d2 ; (main.s7023 + 0)
25cf : 4c 76 32 JMP $3276 ; (main.s960 + 0)
.s7023:
25d2 : c6 56 __ DEC T2 + 0 
25d4 : f0 03 __ BEQ $25d9 ; (main.s921 + 0)
25d6 : 4c 36 25 JMP $2536 ; (main.l919 + 0)
.s921:
25d9 : 20 a2 40 JSR $40a2 ; (getch.s0 + 0)
25dc : a9 7f __ LDA #$7f
25de : 8d 2b bf STA $bf2b ; (viewport + 0)
25e1 : a9 50 __ LDA #$50
25e3 : 8d 2e bf STA $bf2e ; (viewport + 3)
25e6 : a9 00 __ LDA #$00
25e8 : 8d 2c bf STA $bf2c ; (viewport + 1)
25eb : 8d 2f bf STA $bf2f ; (viewport + 4)
25ee : 8d 31 bf STA $bf31 ; (viewport + 6)
25f1 : 8d 32 bf STA $bf32 ; (viewport + 7)
25f4 : 8d 33 bf STA $bf33 ; (viewport + 8)
25f7 : 8d 34 bf STA $bf34 ; (viewport + 9)
25fa : 8d 35 bf STA $bf35 ; (viewport + 10)
25fd : a9 96 __ LDA #$96
25ff : 8d 30 bf STA $bf30 ; (viewport + 5)
2602 : a9 05 __ LDA #$05
2604 : 85 0f __ STA P2 
2606 : 85 10 __ STA P3 
2608 : a9 46 __ LDA #$46
260a : 85 11 __ STA P4 
260c : a9 20 __ LDA #$20
260e : 8d 2d bf STA $bf2d ; (viewport + 2)
2611 : a9 36 __ LDA #$36
2613 : 85 0d __ STA P0 
2615 : a9 bf __ LDA #$bf
2617 : 85 0e __ STA P1 
2619 : ad 50 55 LDA $5550 ; (vdc_state + 5)
261c : 38 __ __ SEC
261d : e9 07 __ SBC #$07
261f : 85 12 __ STA P5 
2621 : 20 56 4c JSR $4c56 ; (vdcwin_init.s0 + 0)
2624 : ad 34 bf LDA $bf34 ; (viewport + 9)
2627 : 85 1b __ STA ACCU + 0 
2629 : ad 35 bf LDA $bf35 ; (viewport + 10)
262c : 85 1c __ STA ACCU + 1 
262e : ad 2e bf LDA $bf2e ; (viewport + 3)
2631 : 85 03 __ STA WORK + 0 
2633 : ad 2f bf LDA $bf2f ; (viewport + 4)
2636 : 85 04 __ STA WORK + 1 
2638 : 20 42 52 JSR $5242 ; (mul16 + 0)
263b : ad 2c bf LDA $bf2c ; (viewport + 1)
263e : 18 __ __ CLC
263f : 65 05 __ ADC WORK + 2 
2641 : a8 __ __ TAY
2642 : ad 2d bf LDA $bf2d ; (viewport + 2)
2645 : 65 06 __ ADC WORK + 3 
2647 : aa __ __ TAX
2648 : 98 __ __ TYA
2649 : 18 __ __ CLC
264a : 6d 32 bf ADC $bf32 ; (viewport + 7)
264d : 85 54 __ STA T1 + 0 
264f : 8a __ __ TXA
2650 : 6d 33 bf ADC $bf33 ; (viewport + 8)
2653 : ac 3d bf LDY $bf3d ; (viewport + 18)
2656 : ae 3c bf LDX $bf3c ; (viewport + 17)
2659 : 4c 7f 26 JMP $267f ; (main.l1010 + 0)
.s1011:
265c : 86 0d __ STX P0 
265e : 84 0e __ STY P1 
2660 : 20 bb 13 JSR $13bb ; (bnk_cpytovdc@proxy + 0)
2663 : ad 4e 55 LDA $554e ; (vdc_state + 3)
2666 : 18 __ __ CLC
2667 : 65 0d __ ADC P0 
2669 : aa __ __ TAX
266a : ad 4f 55 LDA $554f ; (vdc_state + 4)
266d : 65 0e __ ADC P1 
266f : a8 __ __ TAY
2670 : 18 __ __ CLC
2671 : a5 54 __ LDA T1 + 0 
2673 : 6d 4e 55 ADC $554e ; (vdc_state + 3)
2676 : 85 54 __ STA T1 + 0 
2678 : a5 55 __ LDA T1 + 1 
267a : 6d 4f 55 ADC $554f ; (vdc_state + 4)
267d : e6 56 __ INC T2 + 0 
.l1010:
267f : 85 55 __ STA T1 + 1 
2681 : a5 56 __ LDA T2 + 0 
2683 : cd 39 bf CMP $bf39 ; (viewport + 14)
2686 : 90 d4 __ BCC $265c ; (main.s1011 + 0)
.s1013:
2688 : ad 2e bf LDA $bf2e ; (viewport + 3)
268b : 85 03 __ STA WORK + 0 
268d : ad 2f bf LDA $bf2f ; (viewport + 4)
2690 : 85 04 __ STA WORK + 1 
2692 : ad 34 bf LDA $bf34 ; (viewport + 9)
2695 : 85 1b __ STA ACCU + 0 
2697 : ad 35 bf LDA $bf35 ; (viewport + 10)
269a : 85 1c __ STA ACCU + 1 
269c : 20 42 52 JSR $5242 ; (mul16 + 0)
269f : ad 2c bf LDA $bf2c ; (viewport + 1)
26a2 : 18 __ __ CLC
26a3 : 65 05 __ ADC WORK + 2 
26a5 : a8 __ __ TAY
26a6 : ad 2d bf LDA $bf2d ; (viewport + 2)
26a9 : 65 06 __ ADC WORK + 3 
26ab : aa __ __ TAX
26ac : 98 __ __ TYA
26ad : 18 __ __ CLC
26ae : 6d 32 bf ADC $bf32 ; (viewport + 7)
26b1 : 85 57 __ STA T3 + 0 
26b3 : 8a __ __ TXA
26b4 : 6d 33 bf ADC $bf33 ; (viewport + 8)
26b7 : 85 58 __ STA T3 + 1 
26b9 : ad 30 bf LDA $bf30 ; (viewport + 5)
26bc : 85 1b __ STA ACCU + 0 
26be : ad 31 bf LDA $bf31 ; (viewport + 6)
26c1 : 85 1c __ STA ACCU + 1 
26c3 : ad 2e bf LDA $bf2e ; (viewport + 3)
26c6 : 85 03 __ STA WORK + 0 
26c8 : ad 2f bf LDA $bf2f ; (viewport + 4)
26cb : 85 04 __ STA WORK + 1 
26cd : 20 42 52 JSR $5242 ; (mul16 + 0)
26d0 : 18 __ __ CLC
26d1 : a5 57 __ LDA T3 + 0 
26d3 : 65 05 __ ADC WORK + 2 
26d5 : aa __ __ TAX
26d6 : a5 58 __ LDA T3 + 1 
26d8 : 65 06 __ ADC WORK + 3 
26da : a8 __ __ TAY
26db : 8a __ __ TXA
26dc : 18 __ __ CLC
26dd : 69 30 __ ADC #$30
26df : 85 54 __ STA T1 + 0 
26e1 : 90 01 __ BCC $26e4 ; (main.s1603 + 0)
.s1602:
26e3 : c8 __ __ INY
.s1603:
26e4 : 84 55 __ STY T1 + 1 
26e6 : a9 00 __ LDA #$00
26e8 : 85 56 __ STA T2 + 0 
26ea : ac 3f bf LDY $bf3f ; (viewport + 20)
26ed : ae 3e bf LDX $bf3e ; (viewport + 19)
26f0 : 4c 1a 27 JMP $271a ; (main.l1014 + 0)
.s1015:
26f3 : 86 0d __ STX P0 
26f5 : 84 0e __ STY P1 
26f7 : 20 bb 13 JSR $13bb ; (bnk_cpytovdc@proxy + 0)
26fa : ad 4e 55 LDA $554e ; (vdc_state + 3)
26fd : 18 __ __ CLC
26fe : 65 0d __ ADC P0 
2700 : aa __ __ TAX
2701 : ad 4f 55 LDA $554f ; (vdc_state + 4)
2704 : 65 0e __ ADC P1 
2706 : a8 __ __ TAY
2707 : 18 __ __ CLC
2708 : a5 54 __ LDA T1 + 0 
270a : 6d 4e 55 ADC $554e ; (vdc_state + 3)
270d : 85 54 __ STA T1 + 0 
270f : a5 55 __ LDA T1 + 1 
2711 : 6d 4f 55 ADC $554f ; (vdc_state + 4)
2714 : 85 55 __ STA T1 + 1 
2716 : e6 56 __ INC T2 + 0 
2718 : a5 56 __ LDA T2 + 0 
.l1014:
271a : cd 39 bf CMP $bf39 ; (viewport + 14)
271d : 90 d4 __ BCC $26f3 ; (main.s1015 + 0)
.l1018:
271f : 20 a2 40 JSR $40a2 ; (getch.s0 + 0)
2722 : a9 00 __ LDA #$00
2724 : 85 56 __ STA T2 + 0 
2726 : a5 1b __ LDA ACCU + 0 
2728 : 85 54 __ STA T1 + 0 
272a : c9 57 __ CMP #$57
272c : f0 04 __ BEQ $2732 ; (main.s1023 + 0)
.s1024:
272e : c9 91 __ CMP #$91
2730 : d0 11 __ BNE $2743 ; (main.s1022 + 0)
.s1023:
2732 : ad 34 bf LDA $bf34 ; (viewport + 9)
2735 : 0d 35 bf ORA $bf35 ; (viewport + 10)
2738 : f0 09 __ BEQ $2743 ; (main.s1022 + 0)
.s1020:
273a : a9 08 __ LDA #$08
273c : 85 56 __ STA T2 + 0 
273e : a5 1b __ LDA ACCU + 0 
2740 : 4c 49 27 JMP $2749 ; (main.s1029 + 0)
.s1022:
2743 : a5 1b __ LDA ACCU + 0 
2745 : c9 53 __ CMP #$53
2747 : f0 04 __ BEQ $274d ; (main.s1028 + 0)
.s1029:
2749 : c9 11 __ CMP #$11
274b : d0 2c __ BNE $2779 ; (main.s1027 + 0)
.s1028:
274d : 38 __ __ SEC
274e : a9 96 __ LDA #$96
2750 : ed 50 55 SBC $5550 ; (vdc_state + 5)
2753 : aa __ __ TAX
2754 : a9 00 __ LDA #$00
2756 : ed 51 55 SBC $5551 ; (vdc_state + 6)
2759 : a8 __ __ TAY
275a : 8a __ __ TXA
275b : 18 __ __ CLC
275c : 69 06 __ ADC #$06
275e : 85 57 __ STA T3 + 0 
2760 : 90 01 __ BCC $2763 ; (main.s1605 + 0)
.s1604:
2762 : c8 __ __ INY
.s1605:
2763 : 84 58 __ STY T3 + 1 
2765 : ad 35 bf LDA $bf35 ; (viewport + 10)
2768 : c5 58 __ CMP T3 + 1 
276a : d0 05 __ BNE $2771 ; (main.s1237 + 0)
.s1236:
276c : ad 34 bf LDA $bf34 ; (viewport + 9)
276f : c5 57 __ CMP T3 + 0 
.s1237:
2771 : b0 06 __ BCS $2779 ; (main.s1027 + 0)
.s1025:
2773 : a5 56 __ LDA T2 + 0 
2775 : 09 04 __ ORA #$04
2777 : 85 56 __ STA T2 + 0 
.s1027:
2779 : a5 1b __ LDA ACCU + 0 
277b : c9 41 __ CMP #$41
277d : f0 04 __ BEQ $2783 ; (main.s1033 + 0)
.s1034:
277f : c9 9d __ CMP #$9d
2781 : d0 0e __ BNE $2791 ; (main.s1032 + 0)
.s1033:
2783 : ad 32 bf LDA $bf32 ; (viewport + 7)
2786 : 0d 33 bf ORA $bf33 ; (viewport + 8)
2789 : f0 06 __ BEQ $2791 ; (main.s1032 + 0)
.s1030:
278b : a5 56 __ LDA T2 + 0 
278d : 09 01 __ ORA #$01
278f : 85 56 __ STA T2 + 0 
.s1032:
2791 : a5 1b __ LDA ACCU + 0 
2793 : c9 44 __ CMP #$44
2795 : f0 04 __ BEQ $279b ; (main.s1038 + 0)
.s1039:
2797 : c9 1d __ CMP #$1d
2799 : d0 15 __ BNE $27b0 ; (main.s1037 + 0)
.s1038:
279b : ad 33 bf LDA $bf33 ; (viewport + 8)
279e : d0 10 __ BNE $27b0 ; (main.s1037 + 0)
.s1227:
27a0 : ad 32 bf LDA $bf32 ; (viewport + 7)
27a3 : c9 09 __ CMP #$09
27a5 : b0 09 __ BCS $27b0 ; (main.s1037 + 0)
.s1035:
27a7 : a5 56 __ LDA T2 + 0 
27a9 : 09 02 __ ORA #$02
27ab : 85 56 __ STA T2 + 0 
27ad : 4c f3 28 JMP $28f3 ; (main.s1040 + 0)
.s1037:
27b0 : a5 56 __ LDA T2 + 0 
27b2 : f0 03 __ BEQ $27b7 ; (main.s1042 + 0)
27b4 : 4c f3 28 JMP $28f3 ; (main.s1040 + 0)
.s1042:
27b7 : a5 54 __ LDA T1 + 0 
27b9 : c9 1b __ CMP #$1b
27bb : f0 07 __ BEQ $27c4 ; (main.s842 + 0)
.s2141:
27bd : c9 03 __ CMP #$03
27bf : f0 03 __ BEQ $27c4 ; (main.s842 + 0)
27c1 : 4c 1f 27 JMP $271f ; (main.l1018 + 0)
.s842:
27c4 : e6 53 __ INC T0 + 0 
27c6 : a5 53 __ LDA T0 + 0 
27c8 : c9 03 __ CMP #$03
27ca : b0 03 __ BCS $27cf ; (main.s843 + 0)
27cc : 4c a3 23 JMP $23a3 ; (main.l841 + 0)
.s843:
27cf : a9 00 __ LDA #$00
27d1 : 8d 30 d0 STA $d030 
27d4 : 85 13 __ STA P6 
27d6 : ad 11 d0 LDA $d011 
27d9 : 29 7f __ AND #$7f
27db : 09 10 __ ORA #$10
27dd : 8d 11 d0 STA $d011 
27e0 : 20 95 41 JSR $4195 ; (vdc_set_mode.s1000 + 0)
27e3 : a9 00 __ LDA #$00
27e5 : 85 53 __ STA T0 + 0 
27e7 : ad 4e 55 LDA $554e ; (vdc_state + 3)
27ea : 85 54 __ STA T1 + 0 
27ec : ad 50 55 LDA $5550 ; (vdc_state + 5)
27ef : 85 57 __ STA T3 + 0 
.l2149:
27f1 : a5 53 __ LDA T0 + 0 
27f3 : c5 57 __ CMP T3 + 0 
27f5 : 90 21 __ BCC $2818 ; (main.s2150 + 0)
.s2147:
27f7 : a9 04 __ LDA #$04
27f9 : 8d 06 d5 STA $d506 
27fc : a9 00 __ LDA #$00
27fe : 85 1b __ STA ACCU + 0 
2800 : 85 1c __ STA ACCU + 1 
.s1001:
2802 : 18 __ __ CLC
2803 : a5 23 __ LDA SP + 0 
2805 : 69 0e __ ADC #$0e
2807 : 85 23 __ STA SP + 0 
2809 : 90 02 __ BCC $280d ; (main.s1001 + 11)
280b : e6 24 __ INC SP + 1 
280d : a2 10 __ LDX #$10
280f : bd 97 be LDA $be97,x ; (main@stack + 0)
2812 : 95 53 __ STA T0 + 0,x 
2814 : ca __ __ DEX
2815 : 10 f8 __ BPL $280f ; (main.s1001 + 13)
2817 : 60 __ __ RTS
.s2150:
2818 : 0a __ __ ASL
2819 : aa __ __ TAX
281a : ad 52 55 LDA $5552 ; (vdc_state + 7)
281d : 85 56 __ STA T2 + 0 
281f : a9 12 __ LDA #$12
2821 : 8d 00 d6 STA $d600 
2824 : a5 54 __ LDA T1 + 0 
2826 : 38 __ __ SEC
2827 : e9 01 __ SBC #$01
2829 : 85 5d __ STA T6 + 0 
282b : bd 64 55 LDA $5564,x ; (multab + 0)
282e : 85 59 __ STA T4 + 0 
2830 : 18 __ __ CLC
2831 : 6d 53 55 ADC $5553 ; (vdc_state + 8)
2834 : a8 __ __ TAY
2835 : bd 65 55 LDA $5565,x ; (multab + 1)
2838 : 85 5a __ STA T4 + 1 
283a : 6d 54 55 ADC $5554 ; (vdc_state + 9)
.l9647:
283d : 2c 00 d6 BIT $d600 
2840 : 10 fb __ BPL $283d ; (main.l9647 + 0)
.s2162:
2842 : 8d 01 d6 STA $d601 
2845 : a9 13 __ LDA #$13
2847 : 8d 00 d6 STA $d600 
.l9649:
284a : 2c 00 d6 BIT $d600 
284d : 10 fb __ BPL $284a ; (main.l9649 + 0)
.s2167:
284f : 8c 01 d6 STY $d601 
2852 : a9 1f __ LDA #$1f
2854 : 8d 00 d6 STA $d600 
.l9651:
2857 : 2c 00 d6 BIT $d600 
285a : 10 fb __ BPL $2857 ; (main.l9651 + 0)
.s2171:
285c : a9 20 __ LDA #$20
285e : 8d 01 d6 STA $d601 
2861 : a9 18 __ LDA #$18
2863 : 8d 00 d6 STA $d600 
.l9653:
2866 : 2c 00 d6 BIT $d600 
2869 : 10 fb __ BPL $2866 ; (main.l9653 + 0)
.s2177:
286b : ad 01 d6 LDA $d601 
286e : 29 7f __ AND #$7f
2870 : a8 __ __ TAY
2871 : a9 18 __ LDA #$18
2873 : 8d 00 d6 STA $d600 
.l9655:
2876 : 2c 00 d6 BIT $d600 
2879 : 10 fb __ BPL $2876 ; (main.l9655 + 0)
.s2183:
287b : 8c 01 d6 STY $d601 
287e : a9 1e __ LDA #$1e
2880 : 8d 00 d6 STA $d600 
.l9657:
2883 : 2c 00 d6 BIT $d600 
2886 : 10 fb __ BPL $2883 ; (main.l9657 + 0)
.s2188:
2888 : a5 5d __ LDA T6 + 0 
288a : 8d 01 d6 STA $d601 
288d : ad 55 55 LDA $5555 ; (vdc_state + 10)
2890 : 18 __ __ CLC
2891 : 65 59 __ ADC T4 + 0 
2893 : aa __ __ TAX
2894 : a9 12 __ LDA #$12
2896 : 8d 00 d6 STA $d600 
2899 : ad 56 55 LDA $5556 ; (vdc_state + 11)
289c : 65 5a __ ADC T4 + 1 
.l9659:
289e : 2c 00 d6 BIT $d600 
28a1 : 10 fb __ BPL $289e ; (main.l9659 + 0)
.s2195:
28a3 : 8d 01 d6 STA $d601 
28a6 : a9 13 __ LDA #$13
28a8 : 8d 00 d6 STA $d600 
.l9661:
28ab : 2c 00 d6 BIT $d600 
28ae : 10 fb __ BPL $28ab ; (main.l9661 + 0)
.s2200:
28b0 : 8e 01 d6 STX $d601 
28b3 : a9 1f __ LDA #$1f
28b5 : 8d 00 d6 STA $d600 
.l9663:
28b8 : 2c 00 d6 BIT $d600 
28bb : 10 fb __ BPL $28b8 ; (main.l9663 + 0)
.s2204:
28bd : a5 56 __ LDA T2 + 0 
28bf : 8d 01 d6 STA $d601 
28c2 : a9 18 __ LDA #$18
28c4 : 8d 00 d6 STA $d600 
.l9665:
28c7 : 2c 00 d6 BIT $d600 
28ca : 10 fb __ BPL $28c7 ; (main.l9665 + 0)
.s2210:
28cc : ad 01 d6 LDA $d601 
28cf : 29 7f __ AND #$7f
28d1 : aa __ __ TAX
28d2 : a9 18 __ LDA #$18
28d4 : 8d 00 d6 STA $d600 
.l9667:
28d7 : 2c 00 d6 BIT $d600 
28da : 10 fb __ BPL $28d7 ; (main.l9667 + 0)
.s2216:
28dc : 8e 01 d6 STX $d601 
28df : a9 1e __ LDA #$1e
28e1 : 8d 00 d6 STA $d600 
.l9669:
28e4 : 2c 00 d6 BIT $d600 
28e7 : 10 fb __ BPL $28e4 ; (main.l9669 + 0)
.s2221:
28e9 : a5 5d __ LDA T6 + 0 
28eb : 8d 01 d6 STA $d601 
28ee : e6 53 __ INC T0 + 0 
28f0 : 4c f1 27 JMP $27f1 ; (main.l2149 + 0)
.s1040:
28f3 : a2 15 __ LDX #$15
.l1041:
28f5 : bd 2a bf LDA $bf2a,x ; (softscroll + 15)
28f8 : 9d a9 be STA $bea9,x ; (main@stack + 18)
28fb : ca __ __ DEX
28fc : d0 f7 __ BNE $28f5 ; (main.l1041 + 0)
.s1042:
28fe : a5 56 __ LDA T2 + 0 
2900 : 4a __ __ LSR
2901 : 90 4e __ BCC $2951 ; (main.s9523 + 0)
.s1044:
2903 : 86 61 __ STX T8 + 0 
2905 : ae 38 bf LDX $bf38 ; (viewport + 13)
2908 : ca __ __ DEX
2909 : 86 57 __ STX T3 + 0 
290b : ad 3c bf LDA $bf3c ; (viewport + 17)
290e : 85 59 __ STA T4 + 0 
2910 : ad 3d bf LDA $bf3d ; (viewport + 18)
2913 : 85 5a __ STA T4 + 1 
2915 : ad 3e bf LDA $bf3e ; (viewport + 19)
2918 : 85 5b __ STA T5 + 0 
291a : ad 3f bf LDA $bf3f ; (viewport + 20)
.l1048:
291d : 85 5c __ STA T5 + 1 
291f : a5 61 __ LDA T8 + 0 
2921 : cd 39 bf CMP $bf39 ; (viewport + 14)
2924 : b0 03 __ BCS $2929 ; (main.s1047 + 0)
2926 : 4c 2d 30 JMP $302d ; (main.s1049 + 0)
.s1047:
2929 : a9 01 __ LDA #$01
292b : 85 11 __ STA P4 
292d : ad 39 bf LDA $bf39 ; (viewport + 14)
2930 : 85 12 __ STA P5 
2932 : ad b1 be LDA $beb1 ; (vp_fill + 7)
2935 : 18 __ __ CLC
2936 : 69 ff __ ADC #$ff
2938 : 8d b1 be STA $beb1 ; (vp_fill + 7)
293b : b0 03 __ BCS $2940 ; (main.s1607 + 0)
.s1606:
293d : ce b2 be DEC $beb2 ; (vp_fill + 8)
.s1607:
2940 : ad 32 bf LDA $bf32 ; (viewport + 7)
2943 : 18 __ __ CLC
2944 : 69 ff __ ADC #$ff
2946 : 8d 32 bf STA $bf32 ; (viewport + 7)
2949 : b0 03 __ BCS $294e ; (main.s1609 + 0)
.s1608:
294b : ce 33 bf DEC $bf33 ; (viewport + 8)
.s1609:
294e : 20 44 4c JSR $4c44 ; (vdcwin_init@proxy + 0)
.s9523:
2951 : a5 56 __ LDA T2 + 0 
2953 : 29 02 __ AND #$02
2955 : f0 64 __ BEQ $29bb ; (main.s9583 + 0)
.s1405:
2957 : ae 38 bf LDX $bf38 ; (viewport + 13)
295a : ca __ __ DEX
295b : 86 57 __ STX T3 + 0 
295d : a9 00 __ LDA #$00
295f : 85 61 __ STA T8 + 0 
2961 : ad 3c bf LDA $bf3c ; (viewport + 17)
2964 : 85 59 __ STA T4 + 0 
2966 : ad 3d bf LDA $bf3d ; (viewport + 18)
2969 : 85 5a __ STA T4 + 1 
296b : ad 3e bf LDA $bf3e ; (viewport + 19)
296e : 85 5b __ STA T5 + 0 
2970 : ad 3f bf LDA $bf3f ; (viewport + 20)
.l1409:
2973 : 85 5c __ STA T5 + 1 
2975 : a5 61 __ LDA T8 + 0 
2977 : cd 39 bf CMP $bf39 ; (viewport + 14)
297a : b0 03 __ BCS $297f ; (main.s1408 + 0)
297c : 4c e3 2d JMP $2de3 ; (main.s1410 + 0)
.s1408:
297f : a9 01 __ LDA #$01
2981 : 85 11 __ STA P4 
2983 : ad 39 bf LDA $bf39 ; (viewport + 14)
2986 : 85 12 __ STA P5 
2988 : ad b1 be LDA $beb1 ; (vp_fill + 7)
298b : 18 __ __ CLC
298c : 6d 38 bf ADC $bf38 ; (viewport + 13)
298f : 8d b1 be STA $beb1 ; (vp_fill + 7)
2992 : 90 03 __ BCC $2997 ; (main.s1611 + 0)
.s1610:
2994 : ee b2 be INC $beb2 ; (vp_fill + 8)
.s1611:
2997 : ee 32 bf INC $bf32 ; (viewport + 7)
299a : d0 03 __ BNE $299f ; (main.s1613 + 0)
.s1612:
299c : ee 33 bf INC $bf33 ; (viewport + 8)
.s1613:
299f : a9 b5 __ LDA #$b5
29a1 : 85 0d __ STA P0 
29a3 : a9 be __ LDA #$be
29a5 : 85 0e __ STA P1 
29a7 : ad 36 bf LDA $bf36 ; (viewport + 11)
29aa : 18 __ __ CLC
29ab : 6d 38 bf ADC $bf38 ; (viewport + 13)
29ae : 38 __ __ SEC
29af : e9 01 __ SBC #$01
29b1 : 85 0f __ STA P2 
29b3 : ad 37 bf LDA $bf37 ; (viewport + 12)
29b6 : 85 10 __ STA P3 
29b8 : 20 56 4c JSR $4c56 ; (vdcwin_init.s0 + 0)
.s9583:
29bb : a5 56 __ LDA T2 + 0 
29bd : 29 08 __ AND #$08
29bf : f0 76 __ BEQ $2a37 ; (main.s9613 + 0)
.s1766:
29c1 : ad 4e 55 LDA $554e ; (vdc_state + 3)
29c4 : 85 59 __ STA T4 + 0 
29c6 : 85 1b __ STA ACCU + 0 
29c8 : ad 4f 55 LDA $554f ; (vdc_state + 4)
29cb : 85 5a __ STA T4 + 1 
29cd : 85 1c __ STA ACCU + 1 
29cf : ad 39 bf LDA $bf39 ; (viewport + 14)
29d2 : 20 22 52 JSR $5222 ; (mul16by8 + 0)
29d5 : ad 3c bf LDA $bf3c ; (viewport + 17)
29d8 : 18 __ __ CLC
29d9 : 65 05 __ ADC WORK + 2 
29db : 85 5b __ STA T5 + 0 
29dd : ad 3d bf LDA $bf3d ; (viewport + 18)
29e0 : 65 06 __ ADC WORK + 3 
29e2 : 85 5c __ STA T5 + 1 
29e4 : ad 3e bf LDA $bf3e ; (viewport + 19)
29e7 : 18 __ __ CLC
29e8 : 65 05 __ ADC WORK + 2 
29ea : a8 __ __ TAY
29eb : ad 3f bf LDA $bf3f ; (viewport + 20)
29ee : 65 06 __ ADC WORK + 3 
29f0 : 85 58 __ STA T3 + 1 
29f2 : a9 00 __ LDA #$00
29f4 : 85 61 __ STA T8 + 0 
29f6 : ad 38 bf LDA $bf38 ; (viewport + 13)
29f9 : 85 43 __ STA T9 + 0 
.l1770:
29fb : ad 39 bf LDA $bf39 ; (viewport + 14)
29fe : 38 __ __ SEC
29ff : e9 01 __ SBC #$01
2a01 : b0 03 __ BCS $2a06 ; (main.s1105 + 0)
2a03 : 4c cd 2c JMP $2ccd ; (main.s1771 + 0)
.s1105:
2a06 : c5 61 __ CMP T8 + 0 
2a08 : 90 05 __ BCC $2a0f ; (main.s1769 + 0)
.s1614:
2a0a : f0 03 __ BEQ $2a0f ; (main.s1769 + 0)
2a0c : 4c cd 2c JMP $2ccd ; (main.s1771 + 0)
.s1769:
2a0f : a9 01 __ LDA #$01
2a11 : 85 12 __ STA P5 
2a13 : ad b3 be LDA $beb3 ; (vp_fill + 9)
2a16 : 18 __ __ CLC
2a17 : 69 ff __ ADC #$ff
2a19 : 8d b3 be STA $beb3 ; (vp_fill + 9)
2a1c : b0 03 __ BCS $2a21 ; (main.s1616 + 0)
.s1615:
2a1e : ce b4 be DEC $beb4 ; (vp_fill + 10)
.s1616:
2a21 : ad 34 bf LDA $bf34 ; (viewport + 9)
2a24 : 18 __ __ CLC
2a25 : 69 ff __ ADC #$ff
2a27 : 8d 34 bf STA $bf34 ; (viewport + 9)
2a2a : b0 03 __ BCS $2a2f ; (main.s1618 + 0)
.s1617:
2a2c : ce 35 bf DEC $bf35 ; (viewport + 10)
.s1618:
2a2f : ad 38 bf LDA $bf38 ; (viewport + 13)
2a32 : 85 11 __ STA P4 
2a34 : 20 44 4c JSR $4c44 ; (vdcwin_init@proxy + 0)
.s9613:
2a37 : a5 56 __ LDA T2 + 0 
2a39 : 29 04 __ AND #$04
2a3b : f0 75 __ BEQ $2ab2 ; (main.s1951 + 0)
.s1949:
2a3d : ad 4e 55 LDA $554e ; (vdc_state + 3)
2a40 : 85 57 __ STA T3 + 0 
2a42 : ad 4f 55 LDA $554f ; (vdc_state + 4)
2a45 : 85 58 __ STA T3 + 1 
2a47 : ad 38 bf LDA $bf38 ; (viewport + 13)
2a4a : 85 61 __ STA T8 + 0 
2a4c : ad 3c bf LDA $bf3c ; (viewport + 17)
2a4f : 85 59 __ STA T4 + 0 
2a51 : ad 3d bf LDA $bf3d ; (viewport + 18)
2a54 : 85 5a __ STA T4 + 1 
2a56 : ad 3e bf LDA $bf3e ; (viewport + 19)
2a59 : 85 5b __ STA T5 + 0 
2a5b : ad 3f bf LDA $bf3f ; (viewport + 20)
2a5e : a0 00 __ LDY #$00
.l1953:
2a60 : 85 5c __ STA T5 + 1 
2a62 : ad 39 bf LDA $bf39 ; (viewport + 14)
2a65 : 38 __ __ SEC
2a66 : e9 01 __ SBC #$01
2a68 : b0 03 __ BCS $2a6d ; (main.s1075 + 0)
2a6a : 4c b6 2b JMP $2bb6 ; (main.s1954 + 0)
.s1075:
2a6d : 85 5f __ STA T7 + 0 
2a6f : c4 5f __ CPY T7 + 0 
2a71 : b0 03 __ BCS $2a76 ; (main.s1952 + 0)
2a73 : 4c b6 2b JMP $2bb6 ; (main.s1954 + 0)
.s1952:
2a76 : a9 01 __ LDA #$01
2a78 : 85 12 __ STA P5 
2a7a : ad b3 be LDA $beb3 ; (vp_fill + 9)
2a7d : 18 __ __ CLC
2a7e : 6d 39 bf ADC $bf39 ; (viewport + 14)
2a81 : 8d b3 be STA $beb3 ; (vp_fill + 9)
2a84 : 90 03 __ BCC $2a89 ; (main.s1620 + 0)
.s1619:
2a86 : ee b4 be INC $beb4 ; (vp_fill + 10)
.s1620:
2a89 : ee 34 bf INC $bf34 ; (viewport + 9)
2a8c : d0 03 __ BNE $2a91 ; (main.s1622 + 0)
.s1621:
2a8e : ee 35 bf INC $bf35 ; (viewport + 10)
.s1622:
2a91 : a9 b5 __ LDA #$b5
2a93 : 85 0d __ STA P0 
2a95 : a9 be __ LDA #$be
2a97 : 85 0e __ STA P1 
2a99 : ad 36 bf LDA $bf36 ; (viewport + 11)
2a9c : 85 0f __ STA P2 
2a9e : ad 37 bf LDA $bf37 ; (viewport + 12)
2aa1 : 18 __ __ CLC
2aa2 : 6d 39 bf ADC $bf39 ; (viewport + 14)
2aa5 : 38 __ __ SEC
2aa6 : e9 01 __ SBC #$01
2aa8 : 85 10 __ STA P3 
2aaa : ad 38 bf LDA $bf38 ; (viewport + 13)
2aad : 85 11 __ STA P4 
2aaf : 20 56 4c JSR $4c56 ; (vdcwin_init.s0 + 0)
.s1951:
2ab2 : ad b3 be LDA $beb3 ; (vp_fill + 9)
2ab5 : 85 1b __ STA ACCU + 0 
2ab7 : ad b4 be LDA $beb4 ; (vp_fill + 10)
2aba : 85 1c __ STA ACCU + 1 
2abc : ad ad be LDA $bead ; (vp_fill + 3)
2abf : 85 03 __ STA WORK + 0 
2ac1 : ad ae be LDA $beae ; (vp_fill + 4)
2ac4 : 85 04 __ STA WORK + 1 
2ac6 : 20 42 52 JSR $5242 ; (mul16 + 0)
2ac9 : ad ab be LDA $beab ; (vp_fill + 1)
2acc : 18 __ __ CLC
2acd : 65 05 __ ADC WORK + 2 
2acf : a8 __ __ TAY
2ad0 : ad ac be LDA $beac ; (vp_fill + 2)
2ad3 : 65 06 __ ADC WORK + 3 
2ad5 : aa __ __ TAX
2ad6 : 98 __ __ TYA
2ad7 : 18 __ __ CLC
2ad8 : 6d b1 be ADC $beb1 ; (vp_fill + 7)
2adb : 85 57 __ STA T3 + 0 
2add : 8a __ __ TXA
2ade : 6d b2 be ADC $beb2 ; (vp_fill + 8)
2ae1 : 85 58 __ STA T3 + 1 
2ae3 : a9 00 __ LDA #$00
2ae5 : 85 56 __ STA T2 + 0 
2ae7 : ac bc be LDY $bebc ; (vp_fill + 18)
2aea : ae bb be LDX $bebb ; (vp_fill + 17)
2aed : 4c 17 2b JMP $2b17 ; (main.l2133 + 0)
.s2134:
2af0 : 86 0d __ STX P0 
2af2 : 84 0e __ STY P1 
2af4 : 20 d1 14 JSR $14d1 ; (bnk_cpytovdc@proxy + 0)
2af7 : ad 4e 55 LDA $554e ; (vdc_state + 3)
2afa : 18 __ __ CLC
2afb : 65 0d __ ADC P0 
2afd : aa __ __ TAX
2afe : ad 4f 55 LDA $554f ; (vdc_state + 4)
2b01 : 65 0e __ ADC P1 
2b03 : a8 __ __ TAY
2b04 : 18 __ __ CLC
2b05 : a5 57 __ LDA T3 + 0 
2b07 : 6d 4e 55 ADC $554e ; (vdc_state + 3)
2b0a : 85 57 __ STA T3 + 0 
2b0c : a5 58 __ LDA T3 + 1 
2b0e : 6d 4f 55 ADC $554f ; (vdc_state + 4)
2b11 : 85 58 __ STA T3 + 1 
2b13 : e6 56 __ INC T2 + 0 
2b15 : a5 56 __ LDA T2 + 0 
.l2133:
2b17 : cd b8 be CMP $beb8 ; (vp_fill + 14)
2b1a : 90 d4 __ BCC $2af0 ; (main.s2134 + 0)
.s2136:
2b1c : ad ad be LDA $bead ; (vp_fill + 3)
2b1f : 85 03 __ STA WORK + 0 
2b21 : ad ae be LDA $beae ; (vp_fill + 4)
2b24 : 85 04 __ STA WORK + 1 
2b26 : ad b3 be LDA $beb3 ; (vp_fill + 9)
2b29 : 85 1b __ STA ACCU + 0 
2b2b : ad b4 be LDA $beb4 ; (vp_fill + 10)
2b2e : 85 1c __ STA ACCU + 1 
2b30 : 20 42 52 JSR $5242 ; (mul16 + 0)
2b33 : ad ab be LDA $beab ; (vp_fill + 1)
2b36 : 18 __ __ CLC
2b37 : 65 05 __ ADC WORK + 2 
2b39 : a8 __ __ TAY
2b3a : ad ac be LDA $beac ; (vp_fill + 2)
2b3d : 65 06 __ ADC WORK + 3 
2b3f : aa __ __ TAX
2b40 : 98 __ __ TYA
2b41 : 18 __ __ CLC
2b42 : 6d b1 be ADC $beb1 ; (vp_fill + 7)
2b45 : 85 59 __ STA T4 + 0 
2b47 : 8a __ __ TXA
2b48 : 6d b2 be ADC $beb2 ; (vp_fill + 8)
2b4b : 85 5a __ STA T4 + 1 
2b4d : ad af be LDA $beaf ; (vp_fill + 5)
2b50 : 85 1b __ STA ACCU + 0 
2b52 : ad b0 be LDA $beb0 ; (vp_fill + 6)
2b55 : 85 1c __ STA ACCU + 1 
2b57 : ad ad be LDA $bead ; (vp_fill + 3)
2b5a : 85 03 __ STA WORK + 0 
2b5c : ad ae be LDA $beae ; (vp_fill + 4)
2b5f : 85 04 __ STA WORK + 1 
2b61 : 20 42 52 JSR $5242 ; (mul16 + 0)
2b64 : 18 __ __ CLC
2b65 : a5 59 __ LDA T4 + 0 
2b67 : 65 05 __ ADC WORK + 2 
2b69 : aa __ __ TAX
2b6a : a5 5a __ LDA T4 + 1 
2b6c : 65 06 __ ADC WORK + 3 
2b6e : a8 __ __ TAY
2b6f : 8a __ __ TXA
2b70 : 18 __ __ CLC
2b71 : 69 30 __ ADC #$30
2b73 : 85 57 __ STA T3 + 0 
2b75 : 90 01 __ BCC $2b78 ; (main.s1624 + 0)
.s1623:
2b77 : c8 __ __ INY
.s1624:
2b78 : 84 58 __ STY T3 + 1 
2b7a : a9 00 __ LDA #$00
2b7c : 85 56 __ STA T2 + 0 
2b7e : ac be be LDY $bebe ; (vp_fill + 20)
2b81 : ae bd be LDX $bebd ; (vp_fill + 19)
2b84 : 4c ae 2b JMP $2bae ; (main.l2137 + 0)
.s2138:
2b87 : 86 0d __ STX P0 
2b89 : 84 0e __ STY P1 
2b8b : 20 d1 14 JSR $14d1 ; (bnk_cpytovdc@proxy + 0)
2b8e : ad 4e 55 LDA $554e ; (vdc_state + 3)
2b91 : 18 __ __ CLC
2b92 : 65 0d __ ADC P0 
2b94 : aa __ __ TAX
2b95 : ad 4f 55 LDA $554f ; (vdc_state + 4)
2b98 : 65 0e __ ADC P1 
2b9a : a8 __ __ TAY
2b9b : 18 __ __ CLC
2b9c : a5 57 __ LDA T3 + 0 
2b9e : 6d 4e 55 ADC $554e ; (vdc_state + 3)
2ba1 : 85 57 __ STA T3 + 0 
2ba3 : a5 58 __ LDA T3 + 1 
2ba5 : 6d 4f 55 ADC $554f ; (vdc_state + 4)
2ba8 : 85 58 __ STA T3 + 1 
2baa : e6 56 __ INC T2 + 0 
2bac : a5 56 __ LDA T2 + 0 
.l2137:
2bae : cd b8 be CMP $beb8 ; (vp_fill + 14)
2bb1 : 90 d4 __ BCC $2b87 ; (main.s2138 + 0)
2bb3 : 4c b7 27 JMP $27b7 ; (main.s1042 + 0)
.s1954:
2bb6 : a9 12 __ LDA #$12
2bb8 : 8d 00 d6 STA $d600 
2bbb : a5 5b __ LDA T5 + 0 
2bbd : 65 57 __ ADC T3 + 0 
2bbf : 85 5d __ STA T6 + 0 
2bc1 : a5 5c __ LDA T5 + 1 
2bc3 : 65 58 __ ADC T3 + 1 
2bc5 : 85 5e __ STA T6 + 1 
2bc7 : 18 __ __ CLC
2bc8 : a5 59 __ LDA T4 + 0 
2bca : 65 57 __ ADC T3 + 0 
2bcc : 85 1b __ STA ACCU + 0 
2bce : a5 5a __ LDA T4 + 1 
2bd0 : 65 58 __ ADC T3 + 1 
2bd2 : 85 1c __ STA ACCU + 1 
.l9615:
2bd4 : 2c 00 d6 BIT $d600 
2bd7 : 10 fb __ BPL $2bd4 ; (main.l9615 + 0)
.s2010:
2bd9 : a5 5a __ LDA T4 + 1 
2bdb : 8d 01 d6 STA $d601 
2bde : a9 13 __ LDA #$13
2be0 : 8d 00 d6 STA $d600 
.l9617:
2be3 : 2c 00 d6 BIT $d600 
2be6 : 10 fb __ BPL $2be3 ; (main.l9617 + 0)
.s2015:
2be8 : a5 59 __ LDA T4 + 0 
2bea : 8d 01 d6 STA $d601 
2bed : a9 1f __ LDA #$1f
2bef : 8d 00 d6 STA $d600 
2bf2 : a9 18 __ LDA #$18
2bf4 : 8d 00 d6 STA $d600 
.l9619:
2bf7 : 2c 00 d6 BIT $d600 
2bfa : 10 fb __ BPL $2bf7 ; (main.l9619 + 0)
.s2022:
2bfc : ad 01 d6 LDA $d601 
2bff : a2 18 __ LDX #$18
2c01 : 8e 00 d6 STX $d600 
2c04 : 09 80 __ ORA #$80
.l9621:
2c06 : 2c 00 d6 BIT $d600 
2c09 : 10 fb __ BPL $2c06 ; (main.l9621 + 0)
.s2028:
2c0b : 8d 01 d6 STA $d601 
2c0e : a9 20 __ LDA #$20
2c10 : 8d 00 d6 STA $d600 
.l9623:
2c13 : 2c 00 d6 BIT $d600 
2c16 : 10 fb __ BPL $2c13 ; (main.l9623 + 0)
.s2033:
2c18 : a5 1c __ LDA ACCU + 1 
2c1a : 8d 01 d6 STA $d601 
2c1d : a9 21 __ LDA #$21
2c1f : 8d 00 d6 STA $d600 
.l9625:
2c22 : 2c 00 d6 BIT $d600 
2c25 : 10 fb __ BPL $2c22 ; (main.l9625 + 0)
.s2038:
2c27 : a5 1b __ LDA ACCU + 0 
2c29 : 8d 01 d6 STA $d601 
2c2c : a9 1f __ LDA #$1f
2c2e : 8d 00 d6 STA $d600 
2c31 : a9 1e __ LDA #$1e
2c33 : 8d 00 d6 STA $d600 
.l9627:
2c36 : 2c 00 d6 BIT $d600 
2c39 : 10 fb __ BPL $2c36 ; (main.l9627 + 0)
.s2044:
2c3b : a5 61 __ LDA T8 + 0 
2c3d : 8d 01 d6 STA $d601 
2c40 : a9 12 __ LDA #$12
2c42 : 8d 00 d6 STA $d600 
.l9629:
2c45 : 2c 00 d6 BIT $d600 
2c48 : 10 fb __ BPL $2c45 ; (main.l9629 + 0)
.s2097:
2c4a : a5 5c __ LDA T5 + 1 
2c4c : 8d 01 d6 STA $d601 
2c4f : a9 13 __ LDA #$13
2c51 : 8d 00 d6 STA $d600 
.l9631:
2c54 : 2c 00 d6 BIT $d600 
2c57 : 10 fb __ BPL $2c54 ; (main.l9631 + 0)
.s2102:
2c59 : a5 5b __ LDA T5 + 0 
2c5b : 8d 01 d6 STA $d601 
2c5e : a9 1f __ LDA #$1f
2c60 : 8d 00 d6 STA $d600 
2c63 : 8e 00 d6 STX $d600 
.l9633:
2c66 : 2c 00 d6 BIT $d600 
2c69 : 10 fb __ BPL $2c66 ; (main.l9633 + 0)
.s2109:
2c6b : ad 01 d6 LDA $d601 
2c6e : 8e 00 d6 STX $d600 
2c71 : 09 80 __ ORA #$80
.l9635:
2c73 : 2c 00 d6 BIT $d600 
2c76 : 10 fb __ BPL $2c73 ; (main.l9635 + 0)
.s2115:
2c78 : 8d 01 d6 STA $d601 
2c7b : a9 20 __ LDA #$20
2c7d : 8d 00 d6 STA $d600 
.l9637:
2c80 : 2c 00 d6 BIT $d600 
2c83 : 10 fb __ BPL $2c80 ; (main.l9637 + 0)
.s2120:
2c85 : a5 5e __ LDA T6 + 1 
2c87 : 8d 01 d6 STA $d601 
2c8a : a9 21 __ LDA #$21
2c8c : 8d 00 d6 STA $d600 
.l9639:
2c8f : 2c 00 d6 BIT $d600 
2c92 : 10 fb __ BPL $2c8f ; (main.l9639 + 0)
.s2125:
2c94 : a5 5d __ LDA T6 + 0 
2c96 : 8d 01 d6 STA $d601 
2c99 : a9 1f __ LDA #$1f
2c9b : 8d 00 d6 STA $d600 
2c9e : a9 1e __ LDA #$1e
2ca0 : 8d 00 d6 STA $d600 
.l9641:
2ca3 : 2c 00 d6 BIT $d600 
2ca6 : 10 fb __ BPL $2ca3 ; (main.l9641 + 0)
.s2131:
2ca8 : a5 61 __ LDA T8 + 0 
2caa : 8d 01 d6 STA $d601 
2cad : ad 4e 55 LDA $554e ; (vdc_state + 3)
2cb0 : 18 __ __ CLC
2cb1 : 65 59 __ ADC T4 + 0 
2cb3 : 85 59 __ STA T4 + 0 
2cb5 : ad 4f 55 LDA $554f ; (vdc_state + 4)
2cb8 : 65 5a __ ADC T4 + 1 
2cba : 85 5a __ STA T4 + 1 
2cbc : 18 __ __ CLC
2cbd : a5 5b __ LDA T5 + 0 
2cbf : 6d 4e 55 ADC $554e ; (vdc_state + 3)
2cc2 : 85 5b __ STA T5 + 0 
2cc4 : a5 5c __ LDA T5 + 1 
2cc6 : 6d 4f 55 ADC $554f ; (vdc_state + 4)
2cc9 : c8 __ __ INY
2cca : 4c 60 2a JMP $2a60 ; (main.l1953 + 0)
.s1771:
2ccd : a9 12 __ LDA #$12
2ccf : 8d 00 d6 STA $d600 
2cd2 : 98 __ __ TYA
2cd3 : 38 __ __ SEC
2cd4 : ed 4e 55 SBC $554e ; (vdc_state + 3)
2cd7 : a8 __ __ TAY
2cd8 : a5 58 __ LDA T3 + 1 
2cda : ed 4f 55 SBC $554f ; (vdc_state + 4)
2cdd : 85 58 __ STA T3 + 1 
2cdf : 98 __ __ TYA
2ce0 : 38 __ __ SEC
2ce1 : e5 59 __ SBC T4 + 0 
2ce3 : 85 5f __ STA T7 + 0 
2ce5 : a5 58 __ LDA T3 + 1 
2ce7 : e5 5a __ SBC T4 + 1 
2ce9 : 85 60 __ STA T7 + 1 
2ceb : 38 __ __ SEC
2cec : a5 5b __ LDA T5 + 0 
2cee : ed 4e 55 SBC $554e ; (vdc_state + 3)
2cf1 : 85 5b __ STA T5 + 0 
2cf3 : a5 5c __ LDA T5 + 1 
2cf5 : ed 4f 55 SBC $554f ; (vdc_state + 4)
2cf8 : 85 5c __ STA T5 + 1 
2cfa : 38 __ __ SEC
2cfb : a5 5b __ LDA T5 + 0 
2cfd : e5 59 __ SBC T4 + 0 
2cff : 85 5d __ STA T6 + 0 
2d01 : a5 5c __ LDA T5 + 1 
2d03 : e5 5a __ SBC T4 + 1 
2d05 : 85 5e __ STA T6 + 1 
.l9585:
2d07 : 2c 00 d6 BIT $d600 
2d0a : 10 fb __ BPL $2d07 ; (main.l9585 + 0)
.s1827:
2d0c : a5 5c __ LDA T5 + 1 
2d0e : 8d 01 d6 STA $d601 
2d11 : a9 13 __ LDA #$13
2d13 : 8d 00 d6 STA $d600 
.l9587:
2d16 : 2c 00 d6 BIT $d600 
2d19 : 10 fb __ BPL $2d16 ; (main.l9587 + 0)
.s1832:
2d1b : a5 5b __ LDA T5 + 0 
2d1d : 8d 01 d6 STA $d601 
2d20 : a9 1f __ LDA #$1f
2d22 : 8d 00 d6 STA $d600 
2d25 : a9 18 __ LDA #$18
2d27 : 8d 00 d6 STA $d600 
.l9589:
2d2a : 2c 00 d6 BIT $d600 
2d2d : 10 fb __ BPL $2d2a ; (main.l9589 + 0)
.s1839:
2d2f : ad 01 d6 LDA $d601 
2d32 : a2 18 __ LDX #$18
2d34 : 8e 00 d6 STX $d600 
2d37 : 09 80 __ ORA #$80
.l9591:
2d39 : 2c 00 d6 BIT $d600 
2d3c : 10 fb __ BPL $2d39 ; (main.l9591 + 0)
.s1845:
2d3e : 8d 01 d6 STA $d601 
2d41 : a9 20 __ LDA #$20
2d43 : 8d 00 d6 STA $d600 
.l9593:
2d46 : 2c 00 d6 BIT $d600 
2d49 : 10 fb __ BPL $2d46 ; (main.l9593 + 0)
.s1850:
2d4b : a5 5e __ LDA T6 + 1 
2d4d : 8d 01 d6 STA $d601 
2d50 : a9 21 __ LDA #$21
2d52 : 8d 00 d6 STA $d600 
.l9595:
2d55 : 2c 00 d6 BIT $d600 
2d58 : 10 fb __ BPL $2d55 ; (main.l9595 + 0)
.s1855:
2d5a : a5 5d __ LDA T6 + 0 
2d5c : 8d 01 d6 STA $d601 
2d5f : a9 1f __ LDA #$1f
2d61 : 8d 00 d6 STA $d600 
2d64 : a9 1e __ LDA #$1e
2d66 : 8d 00 d6 STA $d600 
.l9597:
2d69 : 2c 00 d6 BIT $d600 
2d6c : 10 fb __ BPL $2d69 ; (main.l9597 + 0)
.s1861:
2d6e : a5 43 __ LDA T9 + 0 
2d70 : 8d 01 d6 STA $d601 
2d73 : a9 12 __ LDA #$12
2d75 : 8d 00 d6 STA $d600 
.l9599:
2d78 : 2c 00 d6 BIT $d600 
2d7b : 10 fb __ BPL $2d78 ; (main.l9599 + 0)
.s1914:
2d7d : a5 58 __ LDA T3 + 1 
2d7f : 8d 01 d6 STA $d601 
2d82 : a9 13 __ LDA #$13
2d84 : 8d 00 d6 STA $d600 
.l9601:
2d87 : 2c 00 d6 BIT $d600 
2d8a : 10 fb __ BPL $2d87 ; (main.l9601 + 0)
.s1919:
2d8c : 8c 01 d6 STY $d601 
2d8f : a9 1f __ LDA #$1f
2d91 : 8d 00 d6 STA $d600 
2d94 : 8e 00 d6 STX $d600 
.l9603:
2d97 : 2c 00 d6 BIT $d600 
2d9a : 10 fb __ BPL $2d97 ; (main.l9603 + 0)
.s1926:
2d9c : ad 01 d6 LDA $d601 
2d9f : 8e 00 d6 STX $d600 
2da2 : 09 80 __ ORA #$80
.l9605:
2da4 : 2c 00 d6 BIT $d600 
2da7 : 10 fb __ BPL $2da4 ; (main.l9605 + 0)
.s1932:
2da9 : 8d 01 d6 STA $d601 
2dac : a9 20 __ LDA #$20
2dae : 8d 00 d6 STA $d600 
.l9607:
2db1 : 2c 00 d6 BIT $d600 
2db4 : 10 fb __ BPL $2db1 ; (main.l9607 + 0)
.s1937:
2db6 : a5 60 __ LDA T7 + 1 
2db8 : 8d 01 d6 STA $d601 
2dbb : a9 21 __ LDA #$21
2dbd : 8d 00 d6 STA $d600 
.l9609:
2dc0 : 2c 00 d6 BIT $d600 
2dc3 : 10 fb __ BPL $2dc0 ; (main.l9609 + 0)
.s1942:
2dc5 : a5 5f __ LDA T7 + 0 
2dc7 : 8d 01 d6 STA $d601 
2dca : a9 1f __ LDA #$1f
2dcc : 8d 00 d6 STA $d600 
2dcf : a9 1e __ LDA #$1e
2dd1 : 8d 00 d6 STA $d600 
.l9611:
2dd4 : 2c 00 d6 BIT $d600 
2dd7 : 10 fb __ BPL $2dd4 ; (main.l9611 + 0)
.s1948:
2dd9 : a5 43 __ LDA T9 + 0 
2ddb : 8d 01 d6 STA $d601 
2dde : e6 61 __ INC T8 + 0 
2de0 : 4c fb 29 JMP $29fb ; (main.l1770 + 0)
.s1410:
2de3 : a5 5b __ LDA T5 + 0 
2de5 : 69 01 __ ADC #$01
2de7 : 85 5d __ STA T6 + 0 
2de9 : a5 5c __ LDA T5 + 1 
2deb : 69 00 __ ADC #$00
2ded : 85 5e __ STA T6 + 1 
2def : 18 __ __ CLC
2df0 : a5 59 __ LDA T4 + 0 
2df2 : 69 01 __ ADC #$01
2df4 : aa __ __ TAX
2df5 : a5 5a __ LDA T4 + 1 
2df7 : 69 00 __ ADC #$00
2df9 : a8 __ __ TAY
2dfa : ad 4c 55 LDA $554c ; (vdc_state + 1)
2dfd : d0 11 __ BNE $2e10 ; (main.s1415 + 0)
.s1417:
2dff : a9 03 __ LDA #$03
2e01 : cd 58 55 CMP $5558 ; (vdc_state + 13)
2e04 : d0 05 __ BNE $2e0b ; (main.s1164 + 0)
.s1163:
2e06 : a9 ff __ LDA #$ff
2e08 : cd 57 55 CMP $5557 ; (vdc_state + 12)
.s1164:
2e0b : b0 03 __ BCS $2e10 ; (main.s1415 + 0)
2e0d : 4c 02 30 JMP $3002 ; (main.s1414 + 0)
.s1415:
2e10 : ad 57 55 LDA $5557 ; (vdc_state + 12)
2e13 : 85 1b __ STA ACCU + 0 
2e15 : ad 58 55 LDA $5558 ; (vdc_state + 13)
2e18 : 85 45 __ STA T13 + 0 
2e1a : a9 12 __ LDA #$12
2e1c : 8d 00 d6 STA $d600 
.l9526:
2e1f : 2c 00 d6 BIT $d600 
2e22 : 10 fb __ BPL $2e1f ; (main.l9526 + 0)
.s1470:
2e24 : a5 45 __ LDA T13 + 0 
2e26 : 8d 01 d6 STA $d601 
2e29 : a9 13 __ LDA #$13
2e2b : 8d 00 d6 STA $d600 
.l9528:
2e2e : 2c 00 d6 BIT $d600 
2e31 : 10 fb __ BPL $2e2e ; (main.l9528 + 0)
.s1475:
2e33 : a5 1b __ LDA ACCU + 0 
2e35 : 8d 01 d6 STA $d601 
2e38 : a9 1f __ LDA #$1f
2e3a : 8d 00 d6 STA $d600 
2e3d : a9 18 __ LDA #$18
2e3f : 8d 00 d6 STA $d600 
.l9530:
2e42 : 2c 00 d6 BIT $d600 
2e45 : 10 fb __ BPL $2e42 ; (main.l9530 + 0)
.s1482:
2e47 : ad 01 d6 LDA $d601 
2e4a : 09 80 __ ORA #$80
2e4c : 85 49 __ STA T16 + 0 
2e4e : a9 18 __ LDA #$18
2e50 : 8d 00 d6 STA $d600 
.l9532:
2e53 : 2c 00 d6 BIT $d600 
2e56 : 10 fb __ BPL $2e53 ; (main.l9532 + 0)
.s1488:
2e58 : a5 49 __ LDA T16 + 0 
2e5a : 8d 01 d6 STA $d601 
2e5d : a9 20 __ LDA #$20
2e5f : 8d 00 d6 STA $d600 
.l9534:
2e62 : 2c 00 d6 BIT $d600 
2e65 : 10 fb __ BPL $2e62 ; (main.l9534 + 0)
.s1493:
2e67 : 8c 01 d6 STY $d601 
2e6a : a9 21 __ LDA #$21
2e6c : 8d 00 d6 STA $d600 
.l9536:
2e6f : 2c 00 d6 BIT $d600 
2e72 : 10 fb __ BPL $2e6f ; (main.l9536 + 0)
.s1498:
2e74 : 8e 01 d6 STX $d601 
2e77 : a9 1f __ LDA #$1f
2e79 : 8d 00 d6 STA $d600 
2e7c : a9 1e __ LDA #$1e
2e7e : 8d 00 d6 STA $d600 
.l9538:
2e81 : 2c 00 d6 BIT $d600 
2e84 : 10 fb __ BPL $2e81 ; (main.l9538 + 0)
.s1504:
2e86 : a5 57 __ LDA T3 + 0 
2e88 : 8d 01 d6 STA $d601 
2e8b : a9 12 __ LDA #$12
2e8d : 8d 00 d6 STA $d600 
.l9540:
2e90 : 2c 00 d6 BIT $d600 
2e93 : 10 fb __ BPL $2e90 ; (main.l9540 + 0)
.s1557:
2e95 : a5 5a __ LDA T4 + 1 
2e97 : 8d 01 d6 STA $d601 
2e9a : a9 13 __ LDA #$13
2e9c : 8d 00 d6 STA $d600 
.l9542:
2e9f : 2c 00 d6 BIT $d600 
2ea2 : 10 fb __ BPL $2e9f ; (main.l9542 + 0)
.s1562:
2ea4 : a5 59 __ LDA T4 + 0 
2ea6 : 8d 01 d6 STA $d601 
2ea9 : a9 1f __ LDA #$1f
2eab : 8d 00 d6 STA $d600 
2eae : a9 18 __ LDA #$18
2eb0 : 8d 00 d6 STA $d600 
.l9544:
2eb3 : 2c 00 d6 BIT $d600 
2eb6 : 10 fb __ BPL $2eb3 ; (main.l9544 + 0)
.s1569:
2eb8 : ad 01 d6 LDA $d601 
2ebb : 09 80 __ ORA #$80
2ebd : aa __ __ TAX
2ebe : a9 18 __ LDA #$18
2ec0 : 8d 00 d6 STA $d600 
.l9546:
2ec3 : 2c 00 d6 BIT $d600 
2ec6 : 10 fb __ BPL $2ec3 ; (main.l9546 + 0)
.s1575:
2ec8 : 8e 01 d6 STX $d601 
2ecb : a9 20 __ LDA #$20
2ecd : 8d 00 d6 STA $d600 
.l9548:
2ed0 : 2c 00 d6 BIT $d600 
2ed3 : 10 fb __ BPL $2ed0 ; (main.l9548 + 0)
.s1580:
2ed5 : a5 45 __ LDA T13 + 0 
2ed7 : 8d 01 d6 STA $d601 
2eda : a9 21 __ LDA #$21
2edc : 8d 00 d6 STA $d600 
.l9550:
2edf : 2c 00 d6 BIT $d600 
2ee2 : 10 fb __ BPL $2edf ; (main.l9550 + 0)
.s1585:
2ee4 : a5 1b __ LDA ACCU + 0 
2ee6 : 8d 01 d6 STA $d601 
2ee9 : a9 1f __ LDA #$1f
2eeb : 8d 00 d6 STA $d600 
2eee : a9 1e __ LDA #$1e
2ef0 : 8d 00 d6 STA $d600 
.l9552:
2ef3 : 2c 00 d6 BIT $d600 
2ef6 : 10 fb __ BPL $2ef3 ; (main.l9552 + 0)
.s1591:
2ef8 : a5 57 __ LDA T3 + 0 
2efa : 8d 01 d6 STA $d601 
2efd : a9 12 __ LDA #$12
2eff : 8d 00 d6 STA $d600 
.l9554:
2f02 : 2c 00 d6 BIT $d600 
2f05 : 10 fb __ BPL $2f02 ; (main.l9554 + 0)
.s1644:
2f07 : a5 45 __ LDA T13 + 0 
2f09 : 8d 01 d6 STA $d601 
2f0c : a9 13 __ LDA #$13
2f0e : 8d 00 d6 STA $d600 
.l9556:
2f11 : 2c 00 d6 BIT $d600 
2f14 : 10 fb __ BPL $2f11 ; (main.l9556 + 0)
.s1649:
2f16 : a5 1b __ LDA ACCU + 0 
2f18 : 8d 01 d6 STA $d601 
2f1b : a9 1f __ LDA #$1f
2f1d : 8d 00 d6 STA $d600 
2f20 : a9 18 __ LDA #$18
2f22 : 8d 00 d6 STA $d600 
.l9558:
2f25 : 2c 00 d6 BIT $d600 
2f28 : 10 fb __ BPL $2f25 ; (main.l9558 + 0)
.s1656:
2f2a : ad 01 d6 LDA $d601 
2f2d : 09 80 __ ORA #$80
2f2f : aa __ __ TAX
2f30 : a9 18 __ LDA #$18
2f32 : 8d 00 d6 STA $d600 
.l9560:
2f35 : 2c 00 d6 BIT $d600 
2f38 : 10 fb __ BPL $2f35 ; (main.l9560 + 0)
.s1662:
2f3a : 8e 01 d6 STX $d601 
2f3d : a9 20 __ LDA #$20
2f3f : 8d 00 d6 STA $d600 
.l9562:
2f42 : 2c 00 d6 BIT $d600 
2f45 : 10 fb __ BPL $2f42 ; (main.l9562 + 0)
.s1667:
2f47 : a5 5e __ LDA T6 + 1 
2f49 : 8d 01 d6 STA $d601 
2f4c : a9 21 __ LDA #$21
2f4e : 8d 00 d6 STA $d600 
.l9564:
2f51 : 2c 00 d6 BIT $d600 
2f54 : 10 fb __ BPL $2f51 ; (main.l9564 + 0)
.s1672:
2f56 : a5 5d __ LDA T6 + 0 
2f58 : 8d 01 d6 STA $d601 
2f5b : a9 1f __ LDA #$1f
2f5d : 8d 00 d6 STA $d600 
2f60 : a9 1e __ LDA #$1e
2f62 : 8d 00 d6 STA $d600 
.l9566:
2f65 : 2c 00 d6 BIT $d600 
2f68 : 10 fb __ BPL $2f65 ; (main.l9566 + 0)
.s1678:
2f6a : a5 57 __ LDA T3 + 0 
2f6c : 8d 01 d6 STA $d601 
2f6f : a9 12 __ LDA #$12
2f71 : 8d 00 d6 STA $d600 
.l9568:
2f74 : 2c 00 d6 BIT $d600 
2f77 : 10 fb __ BPL $2f74 ; (main.l9568 + 0)
.s1731:
2f79 : a5 5c __ LDA T5 + 1 
2f7b : 8d 01 d6 STA $d601 
2f7e : a9 13 __ LDA #$13
2f80 : 8d 00 d6 STA $d600 
.l9570:
2f83 : 2c 00 d6 BIT $d600 
2f86 : 10 fb __ BPL $2f83 ; (main.l9570 + 0)
.s1736:
2f88 : a5 5b __ LDA T5 + 0 
2f8a : 8d 01 d6 STA $d601 
2f8d : a9 1f __ LDA #$1f
2f8f : 8d 00 d6 STA $d600 
2f92 : a9 18 __ LDA #$18
2f94 : 8d 00 d6 STA $d600 
.l9572:
2f97 : 2c 00 d6 BIT $d600 
2f9a : 10 fb __ BPL $2f97 ; (main.l9572 + 0)
.s1743:
2f9c : ad 01 d6 LDA $d601 
2f9f : 09 80 __ ORA #$80
2fa1 : aa __ __ TAX
2fa2 : a9 18 __ LDA #$18
2fa4 : 8d 00 d6 STA $d600 
.l9574:
2fa7 : 2c 00 d6 BIT $d600 
2faa : 10 fb __ BPL $2fa7 ; (main.l9574 + 0)
.s1749:
2fac : 8e 01 d6 STX $d601 
2faf : a9 20 __ LDA #$20
2fb1 : 8d 00 d6 STA $d600 
.l9576:
2fb4 : 2c 00 d6 BIT $d600 
2fb7 : 10 fb __ BPL $2fb4 ; (main.l9576 + 0)
.s1754:
2fb9 : a5 45 __ LDA T13 + 0 
2fbb : 8d 01 d6 STA $d601 
2fbe : a9 21 __ LDA #$21
2fc0 : 8d 00 d6 STA $d600 
.l9578:
2fc3 : 2c 00 d6 BIT $d600 
2fc6 : 10 fb __ BPL $2fc3 ; (main.l9578 + 0)
.s1759:
2fc8 : a5 1b __ LDA ACCU + 0 
2fca : 8d 01 d6 STA $d601 
2fcd : a9 1f __ LDA #$1f
2fcf : 8d 00 d6 STA $d600 
2fd2 : a9 1e __ LDA #$1e
2fd4 : 8d 00 d6 STA $d600 
.l9580:
2fd7 : 2c 00 d6 BIT $d600 
2fda : 10 fb __ BPL $2fd7 ; (main.l9580 + 0)
.s1765:
2fdc : a5 57 __ LDA T3 + 0 
2fde : 8d 01 d6 STA $d601 
.s1413:
2fe1 : ad 4e 55 LDA $554e ; (vdc_state + 3)
2fe4 : 18 __ __ CLC
2fe5 : 65 59 __ ADC T4 + 0 
2fe7 : 85 59 __ STA T4 + 0 
2fe9 : ad 4f 55 LDA $554f ; (vdc_state + 4)
2fec : 65 5a __ ADC T4 + 1 
2fee : 85 5a __ STA T4 + 1 
2ff0 : 18 __ __ CLC
2ff1 : a5 5b __ LDA T5 + 0 
2ff3 : 6d 4e 55 ADC $554e ; (vdc_state + 3)
2ff6 : 85 5b __ STA T5 + 0 
2ff8 : a5 5c __ LDA T5 + 1 
2ffa : 6d 4f 55 ADC $554f ; (vdc_state + 4)
2ffd : e6 61 __ INC T8 + 0 
2fff : 4c 73 29 JMP $2973 ; (main.l1409 + 0)
.s1414:
3002 : 86 0f __ STX P2 
3004 : 84 10 __ STY P3 
3006 : 20 38 14 JSR $1438 ; (bnk_cpyfromvdc@proxy + 0)
3009 : a5 59 __ LDA T4 + 0 
300b : 85 0d __ STA P0 
300d : a5 5a __ LDA T4 + 1 
300f : 85 0e __ STA P1 
3011 : 20 ea 14 JSR $14ea ; (bnk_cpytovdc@proxy + 0)
3014 : a5 5d __ LDA T6 + 0 
3016 : 85 0f __ STA P2 
3018 : a5 5e __ LDA T6 + 1 
301a : 85 10 __ STA P3 
301c : 20 be 14 JSR $14be ; (bnk_cpyfromvdc@proxy + 0)
301f : a5 5b __ LDA T5 + 0 
3021 : 85 0d __ STA P0 
3023 : a5 5c __ LDA T5 + 1 
3025 : 85 0e __ STA P1 
3027 : 20 ea 14 JSR $14ea ; (bnk_cpytovdc@proxy + 0)
302a : 4c e1 2f JMP $2fe1 ; (main.s1413 + 0)
.s1049:
302d : a5 59 __ LDA T4 + 0 
302f : 69 01 __ ADC #$01
3031 : 85 5d __ STA T6 + 0 
3033 : a5 5a __ LDA T4 + 1 
3035 : 69 00 __ ADC #$00
3037 : 85 5e __ STA T6 + 1 
3039 : 18 __ __ CLC
303a : a5 5b __ LDA T5 + 0 
303c : 69 01 __ ADC #$01
303e : 85 5f __ STA T7 + 0 
3040 : a5 5c __ LDA T5 + 1 
3042 : 69 00 __ ADC #$00
3044 : 85 60 __ STA T7 + 1 
3046 : ad 4c 55 LDA $554c ; (vdc_state + 1)
3049 : d0 11 __ BNE $305c ; (main.s1054 + 0)
.s1056:
304b : a9 03 __ LDA #$03
304d : cd 58 55 CMP $5558 ; (vdc_state + 13)
3050 : d0 05 __ BNE $3057 ; (main.s1224 + 0)
.s1223:
3052 : a9 ff __ LDA #$ff
3054 : cd 57 55 CMP $5557 ; (vdc_state + 12)
.s1224:
3057 : b0 03 __ BCS $305c ; (main.s1054 + 0)
3059 : 4c 47 32 JMP $3247 ; (main.s1053 + 0)
.s1054:
305c : a9 12 __ LDA #$12
305e : 8d 00 d6 STA $d600 
3061 : ac 58 55 LDY $5558 ; (vdc_state + 13)
3064 : ae 57 55 LDX $5557 ; (vdc_state + 12)
.l9466:
3067 : 2c 00 d6 BIT $d600 
306a : 10 fb __ BPL $3067 ; (main.l9466 + 0)
.s1109:
306c : 8c 01 d6 STY $d601 
306f : a9 13 __ LDA #$13
3071 : 8d 00 d6 STA $d600 
.l9468:
3074 : 2c 00 d6 BIT $d600 
3077 : 10 fb __ BPL $3074 ; (main.l9468 + 0)
.s1114:
3079 : 8e 01 d6 STX $d601 
307c : a9 1f __ LDA #$1f
307e : 8d 00 d6 STA $d600 
3081 : a9 18 __ LDA #$18
3083 : 8d 00 d6 STA $d600 
.l9470:
3086 : 2c 00 d6 BIT $d600 
3089 : 10 fb __ BPL $3086 ; (main.l9470 + 0)
.s1121:
308b : ad 01 d6 LDA $d601 
308e : 09 80 __ ORA #$80
3090 : 85 49 __ STA T16 + 0 
3092 : a9 18 __ LDA #$18
3094 : 8d 00 d6 STA $d600 
.l9472:
3097 : 2c 00 d6 BIT $d600 
309a : 10 fb __ BPL $3097 ; (main.l9472 + 0)
.s1127:
309c : a5 49 __ LDA T16 + 0 
309e : 8d 01 d6 STA $d601 
30a1 : a9 20 __ LDA #$20
30a3 : 8d 00 d6 STA $d600 
.l9474:
30a6 : 2c 00 d6 BIT $d600 
30a9 : 10 fb __ BPL $30a6 ; (main.l9474 + 0)
.s1132:
30ab : a5 5a __ LDA T4 + 1 
30ad : 8d 01 d6 STA $d601 
30b0 : a9 21 __ LDA #$21
30b2 : 8d 00 d6 STA $d600 
.l9476:
30b5 : 2c 00 d6 BIT $d600 
30b8 : 10 fb __ BPL $30b5 ; (main.l9476 + 0)
.s1137:
30ba : a5 59 __ LDA T4 + 0 
30bc : 8d 01 d6 STA $d601 
30bf : a9 1f __ LDA #$1f
30c1 : 8d 00 d6 STA $d600 
30c4 : a9 1e __ LDA #$1e
30c6 : 8d 00 d6 STA $d600 
.l9478:
30c9 : 2c 00 d6 BIT $d600 
30cc : 10 fb __ BPL $30c9 ; (main.l9478 + 0)
.s1143:
30ce : a5 57 __ LDA T3 + 0 
30d0 : 8d 01 d6 STA $d601 
30d3 : a9 12 __ LDA #$12
30d5 : 8d 00 d6 STA $d600 
.l9480:
30d8 : 2c 00 d6 BIT $d600 
30db : 10 fb __ BPL $30d8 ; (main.l9480 + 0)
.s1196:
30dd : a5 5e __ LDA T6 + 1 
30df : 8d 01 d6 STA $d601 
30e2 : a9 13 __ LDA #$13
30e4 : 8d 00 d6 STA $d600 
.l9482:
30e7 : 2c 00 d6 BIT $d600 
30ea : 10 fb __ BPL $30e7 ; (main.l9482 + 0)
.s1201:
30ec : a5 5d __ LDA T6 + 0 
30ee : 8d 01 d6 STA $d601 
30f1 : a9 1f __ LDA #$1f
30f3 : 8d 00 d6 STA $d600 
30f6 : a9 18 __ LDA #$18
30f8 : 8d 00 d6 STA $d600 
.l9484:
30fb : 2c 00 d6 BIT $d600 
30fe : 10 fb __ BPL $30fb ; (main.l9484 + 0)
.s1208:
3100 : ad 01 d6 LDA $d601 
3103 : 09 80 __ ORA #$80
3105 : 85 5d __ STA T6 + 0 
3107 : a9 18 __ LDA #$18
3109 : 8d 00 d6 STA $d600 
.l9486:
310c : 2c 00 d6 BIT $d600 
310f : 10 fb __ BPL $310c ; (main.l9486 + 0)
.s1214:
3111 : a5 5d __ LDA T6 + 0 
3113 : 8d 01 d6 STA $d601 
3116 : a9 20 __ LDA #$20
3118 : 8d 00 d6 STA $d600 
.l9488:
311b : 2c 00 d6 BIT $d600 
311e : 10 fb __ BPL $311b ; (main.l9488 + 0)
.s1219:
3120 : 8c 01 d6 STY $d601 
3123 : a9 21 __ LDA #$21
3125 : 8d 00 d6 STA $d600 
.l9490:
3128 : 2c 00 d6 BIT $d600 
312b : 10 fb __ BPL $3128 ; (main.l9490 + 0)
.s1224:
312d : 8e 01 d6 STX $d601 
3130 : a9 1f __ LDA #$1f
3132 : 8d 00 d6 STA $d600 
3135 : a9 1e __ LDA #$1e
3137 : 8d 00 d6 STA $d600 
.l9492:
313a : 2c 00 d6 BIT $d600 
313d : 10 fb __ BPL $313a ; (main.l9492 + 0)
.s1230:
313f : a5 57 __ LDA T3 + 0 
3141 : 8d 01 d6 STA $d601 
3144 : a9 12 __ LDA #$12
3146 : 8d 00 d6 STA $d600 
.l9494:
3149 : 2c 00 d6 BIT $d600 
314c : 10 fb __ BPL $3149 ; (main.l9494 + 0)
.s1283:
314e : 8c 01 d6 STY $d601 
3151 : a9 13 __ LDA #$13
3153 : 8d 00 d6 STA $d600 
.l9496:
3156 : 2c 00 d6 BIT $d600 
3159 : 10 fb __ BPL $3156 ; (main.l9496 + 0)
.s1288:
315b : 8e 01 d6 STX $d601 
315e : a9 1f __ LDA #$1f
3160 : 8d 00 d6 STA $d600 
3163 : a9 18 __ LDA #$18
3165 : 8d 00 d6 STA $d600 
.l9498:
3168 : 2c 00 d6 BIT $d600 
316b : 10 fb __ BPL $3168 ; (main.l9498 + 0)
.s1295:
316d : ad 01 d6 LDA $d601 
3170 : 09 80 __ ORA #$80
3172 : 85 5d __ STA T6 + 0 
3174 : a9 18 __ LDA #$18
3176 : 8d 00 d6 STA $d600 
.l9500:
3179 : 2c 00 d6 BIT $d600 
317c : 10 fb __ BPL $3179 ; (main.l9500 + 0)
.s1301:
317e : a5 5d __ LDA T6 + 0 
3180 : 8d 01 d6 STA $d601 
3183 : a9 20 __ LDA #$20
3185 : 8d 00 d6 STA $d600 
.l9502:
3188 : 2c 00 d6 BIT $d600 
318b : 10 fb __ BPL $3188 ; (main.l9502 + 0)
.s1306:
318d : a5 5c __ LDA T5 + 1 
318f : 8d 01 d6 STA $d601 
3192 : a9 21 __ LDA #$21
3194 : 8d 00 d6 STA $d600 
.l9504:
3197 : 2c 00 d6 BIT $d600 
319a : 10 fb __ BPL $3197 ; (main.l9504 + 0)
.s1311:
319c : a5 5b __ LDA T5 + 0 
319e : 8d 01 d6 STA $d601 
31a1 : a9 1f __ LDA #$1f
31a3 : 8d 00 d6 STA $d600 
31a6 : a9 1e __ LDA #$1e
31a8 : 8d 00 d6 STA $d600 
.l9506:
31ab : 2c 00 d6 BIT $d600 
31ae : 10 fb __ BPL $31ab ; (main.l9506 + 0)
.s1317:
31b0 : a5 57 __ LDA T3 + 0 
31b2 : 8d 01 d6 STA $d601 
31b5 : a9 12 __ LDA #$12
31b7 : 8d 00 d6 STA $d600 
.l9508:
31ba : 2c 00 d6 BIT $d600 
31bd : 10 fb __ BPL $31ba ; (main.l9508 + 0)
.s1370:
31bf : a5 60 __ LDA T7 + 1 
31c1 : 8d 01 d6 STA $d601 
31c4 : a9 13 __ LDA #$13
31c6 : 8d 00 d6 STA $d600 
.l9510:
31c9 : 2c 00 d6 BIT $d600 
31cc : 10 fb __ BPL $31c9 ; (main.l9510 + 0)
.s1375:
31ce : a5 5f __ LDA T7 + 0 
31d0 : 8d 01 d6 STA $d601 
31d3 : a9 1f __ LDA #$1f
31d5 : 8d 00 d6 STA $d600 
31d8 : a9 18 __ LDA #$18
31da : 8d 00 d6 STA $d600 
.l9512:
31dd : 2c 00 d6 BIT $d600 
31e0 : 10 fb __ BPL $31dd ; (main.l9512 + 0)
.s1382:
31e2 : ad 01 d6 LDA $d601 
31e5 : 09 80 __ ORA #$80
31e7 : 85 5d __ STA T6 + 0 
31e9 : a9 18 __ LDA #$18
31eb : 8d 00 d6 STA $d600 
.l9514:
31ee : 2c 00 d6 BIT $d600 
31f1 : 10 fb __ BPL $31ee ; (main.l9514 + 0)
.s1388:
31f3 : a5 5d __ LDA T6 + 0 
31f5 : 8d 01 d6 STA $d601 
31f8 : a9 20 __ LDA #$20
31fa : 8d 00 d6 STA $d600 
.l9516:
31fd : 2c 00 d6 BIT $d600 
3200 : 10 fb __ BPL $31fd ; (main.l9516 + 0)
.s1393:
3202 : 8c 01 d6 STY $d601 
3205 : a9 21 __ LDA #$21
3207 : 8d 00 d6 STA $d600 
.l9518:
320a : 2c 00 d6 BIT $d600 
320d : 10 fb __ BPL $320a ; (main.l9518 + 0)
.s1398:
320f : 8e 01 d6 STX $d601 
3212 : a9 1f __ LDA #$1f
3214 : 8d 00 d6 STA $d600 
3217 : a9 1e __ LDA #$1e
3219 : 8d 00 d6 STA $d600 
.l9520:
321c : 2c 00 d6 BIT $d600 
321f : 10 fb __ BPL $321c ; (main.l9520 + 0)
.s1404:
3221 : a5 57 __ LDA T3 + 0 
3223 : 8d 01 d6 STA $d601 
.s1052:
3226 : ad 4e 55 LDA $554e ; (vdc_state + 3)
3229 : 18 __ __ CLC
322a : 65 59 __ ADC T4 + 0 
322c : 85 59 __ STA T4 + 0 
322e : ad 4f 55 LDA $554f ; (vdc_state + 4)
3231 : 65 5a __ ADC T4 + 1 
3233 : 85 5a __ STA T4 + 1 
3235 : 18 __ __ CLC
3236 : a5 5b __ LDA T5 + 0 
3238 : 6d 4e 55 ADC $554e ; (vdc_state + 3)
323b : 85 5b __ STA T5 + 0 
323d : a5 5c __ LDA T5 + 1 
323f : 6d 4f 55 ADC $554f ; (vdc_state + 4)
3242 : e6 61 __ INC T8 + 0 
3244 : 4c 1d 29 JMP $291d ; (main.l1048 + 0)
.s1053:
3247 : a5 59 __ LDA T4 + 0 
3249 : 85 0f __ STA P2 
324b : a5 5a __ LDA T4 + 1 
324d : 85 10 __ STA P3 
324f : 20 38 14 JSR $1438 ; (bnk_cpyfromvdc@proxy + 0)
3252 : a5 5d __ LDA T6 + 0 
3254 : 85 0d __ STA P0 
3256 : a5 5e __ LDA T6 + 1 
3258 : 85 0e __ STA P1 
325a : 20 ea 14 JSR $14ea ; (bnk_cpytovdc@proxy + 0)
325d : a5 5b __ LDA T5 + 0 
325f : 85 0f __ STA P2 
3261 : a5 5c __ LDA T5 + 1 
3263 : 85 10 __ STA P3 
3265 : 20 be 14 JSR $14be ; (bnk_cpyfromvdc@proxy + 0)
3268 : a5 5f __ LDA T7 + 0 
326a : 85 0d __ STA P0 
326c : a5 60 __ LDA T7 + 1 
326e : 85 0e __ STA P1 
3270 : 20 ea 14 JSR $14ea ; (bnk_cpytovdc@proxy + 0)
3273 : 4c 26 32 JMP $3226 ; (main.s1052 + 0)
.s960:
3276 : 85 61 __ STA T8 + 0 
3278 : ad 50 bf LDA $bf50 ; (window + 5)
327b : 85 43 __ STA T9 + 0 
327d : 18 __ __ CLC
327e : 6d 4c bf ADC $bf4c ; (window + 1)
3281 : 0a __ __ ASL
3282 : aa __ __ TAX
3283 : a9 12 __ LDA #$12
3285 : 8d 00 d6 STA $d600 
3288 : ad ef 53 LDA $53ef ; (p2smap + 1)
328b : 49 20 __ EOR #$20
328d : 85 47 __ STA T14 + 0 
328f : 18 __ __ CLC
3290 : a5 61 __ LDA T8 + 0 
3292 : 6d 4b bf ADC $bf4b ; (window + 0)
3295 : 18 __ __ CLC
3296 : 7d 64 55 ADC $5564,x ; (multab + 0)
3299 : 85 59 __ STA T4 + 0 
329b : a9 00 __ LDA #$00
329d : 7d 65 55 ADC $5565,x ; (multab + 1)
32a0 : 85 5a __ STA T4 + 1 
32a2 : 18 __ __ CLC
32a3 : a5 59 __ LDA T4 + 0 
32a5 : 6d 53 55 ADC $5553 ; (vdc_state + 8)
32a8 : a8 __ __ TAY
32a9 : a5 5a __ LDA T4 + 1 
32ab : 6d 54 55 ADC $5554 ; (vdc_state + 9)
32ae : ae 52 55 LDX $5552 ; (vdc_state + 7)
.l9438:
32b1 : 2c 00 d6 BIT $d600 
32b4 : 10 fb __ BPL $32b1 ; (main.l9438 + 0)
.s976:
32b6 : 8d 01 d6 STA $d601 
32b9 : a9 13 __ LDA #$13
32bb : 8d 00 d6 STA $d600 
.l9440:
32be : 2c 00 d6 BIT $d600 
32c1 : 10 fb __ BPL $32be ; (main.l9440 + 0)
.s981:
32c3 : 8c 01 d6 STY $d601 
32c6 : a9 1f __ LDA #$1f
32c8 : 8d 00 d6 STA $d600 
.l9442:
32cb : 2c 00 d6 BIT $d600 
32ce : 10 fb __ BPL $32cb ; (main.l9442 + 0)
.s985:
32d0 : a5 47 __ LDA T14 + 0 
32d2 : 8d 01 d6 STA $d601 
32d5 : ad 55 55 LDA $5555 ; (vdc_state + 10)
32d8 : 18 __ __ CLC
32d9 : 65 59 __ ADC T4 + 0 
32db : a8 __ __ TAY
32dc : a9 12 __ LDA #$12
32de : 8d 00 d6 STA $d600 
32e1 : ad 56 55 LDA $5556 ; (vdc_state + 11)
32e4 : 65 5a __ ADC T4 + 1 
.l9444:
32e6 : 2c 00 d6 BIT $d600 
32e9 : 10 fb __ BPL $32e6 ; (main.l9444 + 0)
.s992:
32eb : 8d 01 d6 STA $d601 
32ee : a9 13 __ LDA #$13
32f0 : 8d 00 d6 STA $d600 
.l9446:
32f3 : 2c 00 d6 BIT $d600 
32f6 : 10 fb __ BPL $32f3 ; (main.l9446 + 0)
.s997:
32f8 : 8c 01 d6 STY $d601 
32fb : a9 1f __ LDA #$1f
32fd : 8d 00 d6 STA $d600 
.l9448:
3300 : 2c 00 d6 BIT $d600 
3303 : 10 fb __ BPL $3300 ; (main.l9448 + 0)
.s1001:
3305 : 8e 01 d6 STX $d601 
3308 : a6 61 __ LDX T8 + 0 
330a : e8 __ __ INX
330b : 8e 4f bf STX $bf4f ; (window + 4)
330e : ec 4d bf CPX $bf4d ; (window + 2)
3311 : f0 03 __ BEQ $3316 ; (main.s1002 + 0)
3313 : 4c d2 25 JMP $25d2 ; (main.s7023 + 0)
.s1002:
3316 : a9 00 __ LDA #$00
3318 : 8d 4f bf STA $bf4f ; (window + 4)
331b : 18 __ __ CLC
331c : a5 43 __ LDA T9 + 0 
331e : 69 01 __ ADC #$01
3320 : 8d 50 bf STA $bf50 ; (window + 5)
3323 : cd 4e bf CMP $bf4e ; (window + 3)
3326 : f0 03 __ BEQ $332b ; (main.s1005 + 0)
3328 : 4c d2 25 JMP $25d2 ; (main.s7023 + 0)
.s1005:
332b : a5 43 __ LDA T9 + 0 
332d : 8d 50 bf STA $bf50 ; (window + 5)
3330 : a9 4b __ LDA #$4b
3332 : a0 02 __ LDY #$02
3334 : 91 23 __ STA (SP + 0),y 
3336 : a9 bf __ LDA #$bf
3338 : c8 __ __ INY
3339 : 91 23 __ STA (SP + 0),y 
333b : a9 fe __ LDA #$fe
333d : c8 __ __ INY
333e : 91 23 __ STA (SP + 0),y 
3340 : a9 4a __ LDA #$4a
3342 : c8 __ __ INY
3343 : 91 23 __ STA (SP + 0),y 
3345 : 20 29 4e JSR $4e29 ; (vdcwin_printline.s1000 + 0)
3348 : 4c d2 25 JMP $25d2 ; (main.s7023 + 0)
.s949:
334b : a9 00 __ LDA #$00
334d : 9d ca be STA $beca,x ; (wrapbuffer + 0)
3350 : aa __ __ TAX
3351 : ad ca be LDA $beca ; (wrapbuffer + 0)
3354 : f0 08 __ BEQ $335e ; (main.s955 + 0)
.l1590:
3356 : bd cb be LDA $becb,x ; (wrapbuffer + 1)
3359 : e8 __ __ INX
335a : 09 00 __ ORA #$00
335c : d0 f8 __ BNE $3356 ; (main.l1590 + 0)
.s955:
335e : 8a __ __ TXA
335f : 18 __ __ CLC
3360 : 6d 4f bf ADC $bf4f ; (window + 4)
3363 : b0 06 __ BCS $336b ; (main.s957 + 0)
.s1274:
3365 : c5 5b __ CMP T5 + 0 
3367 : 90 1a __ BCC $3383 ; (main.s959 + 0)
.s1625:
3369 : f0 18 __ BEQ $3383 ; (main.s959 + 0)
.s957:
336b : a9 4b __ LDA #$4b
336d : a0 02 __ LDY #$02
336f : 91 23 __ STA (SP + 0),y 
3371 : a9 bf __ LDA #$bf
3373 : c8 __ __ INY
3374 : 91 23 __ STA (SP + 0),y 
3376 : a9 fe __ LDA #$fe
3378 : c8 __ __ INY
3379 : 91 23 __ STA (SP + 0),y 
337b : a9 4a __ LDA #$4a
337d : c8 __ __ INY
337e : 91 23 __ STA (SP + 0),y 
3380 : 20 29 4e JSR $4e29 ; (vdcwin_printline.s1000 + 0)
.s959:
3383 : a9 4b __ LDA #$4b
3385 : a0 02 __ LDY #$02
3387 : 91 23 __ STA (SP + 0),y 
3389 : a9 bf __ LDA #$bf
338b : c8 __ __ INY
338c : 91 23 __ STA (SP + 0),y 
338e : a9 ca __ LDA #$ca
3390 : c8 __ __ INY
3391 : 91 23 __ STA (SP + 0),y 
3393 : a9 be __ LDA #$be
3395 : c8 __ __ INY
3396 : 91 23 __ STA (SP + 0),y 
3398 : 20 02 51 JSR $5102 ; (vdcwin_put_string.s1000 + 0)
339b : a5 61 __ LDA T8 + 0 
339d : c5 59 __ CMP T4 + 0 
339f : 90 03 __ BCC $33a4 ; (main.s6511 + 0)
33a1 : 4c ca 25 JMP $25ca ; (main.s925 + 0)
.s6511:
33a4 : a9 00 __ LDA #$00
33a6 : 85 43 __ STA T9 + 0 
33a8 : a9 ff __ LDA #$ff
33aa : 85 60 __ STA T7 + 1 
33ac : 85 5e __ STA T6 + 1 
33ae : 4c aa 25 JMP $25aa ; (main.l934 + 0)
.s936:
33b1 : a6 61 __ LDX T8 + 0 
33b3 : bd 00 56 LDA $5600,x ; (linebuffer + 0)
33b6 : a6 43 __ LDX T9 + 0 
33b8 : 9d ca be STA $beca,x ; (wrapbuffer + 0)
33bb : c9 20 __ CMP #$20
33bd : d0 06 __ BNE $33c5 ; (main.s940 + 0)
.s946:
33bf : a9 00 __ LDA #$00
33c1 : 85 60 __ STA T7 + 1 
33c3 : f0 08 __ BEQ $33cd ; (main.s7024 + 0)
.s940:
33c5 : 24 5e __ BIT T6 + 1 
33c7 : 10 04 __ BPL $33cd ; (main.s7024 + 0)
.s943:
33c9 : a9 00 __ LDA #$00
33cb : 85 5e __ STA T6 + 1 
.s7024:
33cd : e6 61 __ INC T8 + 0 
33cf : e6 43 __ INC T9 + 0 
33d1 : 4c aa 25 JMP $25aa ; (main.l934 + 0)
.s753:
33d4 : 0a __ __ ASL
33d5 : aa __ __ TAX
33d6 : ad 52 55 LDA $5552 ; (vdc_state + 7)
33d9 : 85 43 __ STA T9 + 0 
33db : a9 12 __ LDA #$12
33dd : 8d 00 d6 STA $d600 
33e0 : a5 5b __ LDA T5 + 0 
33e2 : 38 __ __ SEC
33e3 : e9 01 __ SBC #$01
33e5 : 85 62 __ STA T12 + 0 
33e7 : bd 64 55 LDA $5564,x ; (multab + 0)
33ea : 85 5f __ STA T7 + 0 
33ec : 18 __ __ CLC
33ed : 6d 53 55 ADC $5553 ; (vdc_state + 8)
33f0 : a8 __ __ TAY
33f1 : bd 65 55 LDA $5565,x ; (multab + 1)
33f4 : 85 60 __ STA T7 + 1 
33f6 : 6d 54 55 ADC $5554 ; (vdc_state + 9)
.l9767:
33f9 : 2c 00 d6 BIT $d600 
33fc : 10 fb __ BPL $33f9 ; (main.l9767 + 0)
.s765:
33fe : 8d 01 d6 STA $d601 
3401 : a9 13 __ LDA #$13
3403 : 8d 00 d6 STA $d600 
.l9769:
3406 : 2c 00 d6 BIT $d600 
3409 : 10 fb __ BPL $3406 ; (main.l9769 + 0)
.s770:
340b : 8c 01 d6 STY $d601 
340e : a9 1f __ LDA #$1f
3410 : 8d 00 d6 STA $d600 
.l9771:
3413 : 2c 00 d6 BIT $d600 
3416 : 10 fb __ BPL $3413 ; (main.l9771 + 0)
.s774:
3418 : a9 20 __ LDA #$20
341a : 8d 01 d6 STA $d601 
341d : a9 18 __ LDA #$18
341f : 8d 00 d6 STA $d600 
.l9773:
3422 : 2c 00 d6 BIT $d600 
3425 : 10 fb __ BPL $3422 ; (main.l9773 + 0)
.s780:
3427 : ad 01 d6 LDA $d601 
342a : 29 7f __ AND #$7f
342c : a8 __ __ TAY
342d : a9 18 __ LDA #$18
342f : 8d 00 d6 STA $d600 
.l9775:
3432 : 2c 00 d6 BIT $d600 
3435 : 10 fb __ BPL $3432 ; (main.l9775 + 0)
.s786:
3437 : 8c 01 d6 STY $d601 
343a : a9 1e __ LDA #$1e
343c : 8d 00 d6 STA $d600 
.l9777:
343f : 2c 00 d6 BIT $d600 
3442 : 10 fb __ BPL $343f ; (main.l9777 + 0)
.s791:
3444 : a5 62 __ LDA T12 + 0 
3446 : 8d 01 d6 STA $d601 
3449 : ad 55 55 LDA $5555 ; (vdc_state + 10)
344c : 18 __ __ CLC
344d : 65 5f __ ADC T7 + 0 
344f : aa __ __ TAX
3450 : a9 12 __ LDA #$12
3452 : 8d 00 d6 STA $d600 
3455 : ad 56 55 LDA $5556 ; (vdc_state + 11)
3458 : 65 60 __ ADC T7 + 1 
.l9779:
345a : 2c 00 d6 BIT $d600 
345d : 10 fb __ BPL $345a ; (main.l9779 + 0)
.s798:
345f : 8d 01 d6 STA $d601 
3462 : a9 13 __ LDA #$13
3464 : 8d 00 d6 STA $d600 
.l9781:
3467 : 2c 00 d6 BIT $d600 
346a : 10 fb __ BPL $3467 ; (main.l9781 + 0)
.s803:
346c : 8e 01 d6 STX $d601 
346f : a9 1f __ LDA #$1f
3471 : 8d 00 d6 STA $d600 
.l9783:
3474 : 2c 00 d6 BIT $d600 
3477 : 10 fb __ BPL $3474 ; (main.l9783 + 0)
.s807:
3479 : a5 43 __ LDA T9 + 0 
347b : 8d 01 d6 STA $d601 
347e : a9 18 __ LDA #$18
3480 : 8d 00 d6 STA $d600 
.l9785:
3483 : 2c 00 d6 BIT $d600 
3486 : 10 fb __ BPL $3483 ; (main.l9785 + 0)
.s813:
3488 : ad 01 d6 LDA $d601 
348b : 29 7f __ AND #$7f
348d : aa __ __ TAX
348e : a9 18 __ LDA #$18
3490 : 8d 00 d6 STA $d600 
.l9787:
3493 : 2c 00 d6 BIT $d600 
3496 : 10 fb __ BPL $3493 ; (main.l9787 + 0)
.s819:
3498 : 8e 01 d6 STX $d601 
349b : a9 1e __ LDA #$1e
349d : 8d 00 d6 STA $d600 
.l9789:
34a0 : 2c 00 d6 BIT $d600 
34a3 : 10 fb __ BPL $34a0 ; (main.l9789 + 0)
.s824:
34a5 : a5 62 __ LDA T12 + 0 
34a7 : 8d 01 d6 STA $d601 
34aa : e6 61 __ INC T8 + 0 
34ac : 4c 4a 23 JMP $234a ; (main.l752 + 0)
.s701:
34af : ad 26 bf LDA $bf26 ; (softscroll + 11)
34b2 : 69 02 __ ADC #$02
34b4 : 8d 26 bf STA $bf26 ; (softscroll + 11)
34b7 : 90 03 __ BCC $34bc ; (main.s1633 + 0)
.s1632:
34b9 : ee 27 bf INC $bf27 ; (softscroll + 12)
.s1633:
34bc : a9 01 __ LDA #$01
34be : cd 23 bf CMP $bf23 ; (softscroll + 8)
34c1 : b0 03 __ BCS $34c6 ; (main.s706 + 0)
34c3 : 4c 56 35 JMP $3556 ; (main.s705 + 0)
.s706:
34c6 : a9 06 __ LDA #$06
34c8 : 8d 23 bf STA $bf23 ; (softscroll + 8)
34cb : ad 20 bf LDA $bf20 ; (softscroll + 5)
34ce : 18 __ __ CLC
34cf : 69 01 __ ADC #$01
34d1 : 85 5d __ STA T6 + 0 
34d3 : 8d 20 bf STA $bf20 ; (softscroll + 5)
34d6 : ad 21 bf LDA $bf21 ; (softscroll + 6)
34d9 : 69 00 __ ADC #$00
34db : 85 5e __ STA T6 + 1 
34dd : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l9798:
34e0 : ad 00 d6 LDA $d600 
34e3 : 29 20 __ AND #$20
34e5 : d0 f9 __ BNE $34e0 ; (main.l9798 + 0)
.s716:
34e7 : ad 55 55 LDA $5555 ; (vdc_state + 10)
34ea : 18 __ __ CLC
34eb : 65 5d __ ADC T6 + 0 
34ed : aa __ __ TAX
34ee : ad 56 55 LDA $5556 ; (vdc_state + 11)
34f1 : 65 5e __ ADC T6 + 1 
34f3 : a8 __ __ TAY
34f4 : ad 53 55 LDA $5553 ; (vdc_state + 8)
34f7 : 18 __ __ CLC
34f8 : 65 5d __ ADC T6 + 0 
34fa : 85 5d __ STA T6 + 0 
34fc : a9 0c __ LDA #$0c
34fe : 8d 00 d6 STA $d600 
3501 : ad 54 55 LDA $5554 ; (vdc_state + 9)
3504 : 65 5e __ ADC T6 + 1 
.l9800:
3506 : 2c 00 d6 BIT $d600 
3509 : 10 fb __ BPL $3506 ; (main.l9800 + 0)
.s724:
350b : 8d 01 d6 STA $d601 
350e : a9 0d __ LDA #$0d
3510 : 8d 00 d6 STA $d600 
.l9802:
3513 : 2c 00 d6 BIT $d600 
3516 : 10 fb __ BPL $3513 ; (main.l9802 + 0)
.s729:
3518 : a5 5d __ LDA T6 + 0 
351a : 8d 01 d6 STA $d601 
351d : a9 14 __ LDA #$14
351f : 8d 00 d6 STA $d600 
.l9804:
3522 : 2c 00 d6 BIT $d600 
3525 : 10 fb __ BPL $3522 ; (main.l9804 + 0)
.s734:
3527 : 8c 01 d6 STY $d601 
352a : a9 15 __ LDA #$15
352c : 8d 00 d6 STA $d600 
.l9806:
352f : 2c 00 d6 BIT $d600 
3532 : 10 fb __ BPL $352f ; (main.l9806 + 0)
.s739:
3534 : 8e 01 d6 STX $d601 
.l9808:
3537 : ad 00 d6 LDA $d600 
353a : 29 20 __ AND #$20
353c : f0 f9 __ BEQ $3537 ; (main.l9808 + 0)
.s740:
353e : a9 19 __ LDA #$19
3540 : 8d 00 d6 STA $d600 
3543 : ad 25 bf LDA $bf25 ; (softscroll + 10)
3546 : 18 __ __ CLC
3547 : 69 06 __ ADC #$06
.l9764:
3549 : 2c 00 d6 BIT $d600 
354c : 10 fb __ BPL $3549 ; (main.l9764 + 0)
.s14175:
354e : 8d 01 d6 STA $d601 
3551 : a5 1b __ LDA ACCU + 0 
3553 : 4c 35 23 JMP $2335 ; (main.s748 + 0)
.s705:
3556 : ad 23 bf LDA $bf23 ; (softscroll + 8)
3559 : 38 __ __ SEC
355a : e9 02 __ SBC #$02
355c : 8d 23 bf STA $bf23 ; (softscroll + 8)
355f : aa __ __ TAX
.l9763:
3560 : ad 00 d6 LDA $d600 
3563 : 29 20 __ AND #$20
3565 : f0 f9 __ BEQ $3560 ; (main.l9763 + 0)
.s708:
3567 : a9 19 __ LDA #$19
3569 : 8d 00 d6 STA $d600 
356c : 8a __ __ TXA
356d : 18 __ __ CLC
356e : 6d 25 bf ADC $bf25 ; (softscroll + 10)
3571 : 4c 49 35 JMP $3549 ; (main.l9764 + 0)
.s653:
3574 : a9 00 __ LDA #$00
3576 : 8d 23 bf STA $bf23 ; (softscroll + 8)
3579 : ad 20 bf LDA $bf20 ; (softscroll + 5)
357c : 18 __ __ CLC
357d : 69 ff __ ADC #$ff
357f : 85 5d __ STA T6 + 0 
3581 : 8d 20 bf STA $bf20 ; (softscroll + 5)
3584 : ad 21 bf LDA $bf21 ; (softscroll + 6)
3587 : 69 ff __ ADC #$ff
3589 : 85 5e __ STA T6 + 1 
358b : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l9746:
358e : ad 00 d6 LDA $d600 
3591 : 29 20 __ AND #$20
3593 : d0 f9 __ BNE $358e ; (main.l9746 + 0)
.s656:
3595 : ad 55 55 LDA $5555 ; (vdc_state + 10)
3598 : 18 __ __ CLC
3599 : 65 5d __ ADC T6 + 0 
359b : aa __ __ TAX
359c : ad 56 55 LDA $5556 ; (vdc_state + 11)
359f : 65 5e __ ADC T6 + 1 
35a1 : a8 __ __ TAY
35a2 : ad 53 55 LDA $5553 ; (vdc_state + 8)
35a5 : 18 __ __ CLC
35a6 : 65 5d __ ADC T6 + 0 
35a8 : 85 5d __ STA T6 + 0 
35aa : a9 0c __ LDA #$0c
35ac : 8d 00 d6 STA $d600 
35af : ad 54 55 LDA $5554 ; (vdc_state + 9)
35b2 : 65 5e __ ADC T6 + 1 
.l9748:
35b4 : 2c 00 d6 BIT $d600 
35b7 : 10 fb __ BPL $35b4 ; (main.l9748 + 0)
.s664:
35b9 : 8d 01 d6 STA $d601 
35bc : a9 0d __ LDA #$0d
35be : 8d 00 d6 STA $d600 
.l9750:
35c1 : 2c 00 d6 BIT $d600 
35c4 : 10 fb __ BPL $35c1 ; (main.l9750 + 0)
.s669:
35c6 : a5 5d __ LDA T6 + 0 
35c8 : 8d 01 d6 STA $d601 
35cb : a9 14 __ LDA #$14
35cd : 8d 00 d6 STA $d600 
.l9752:
35d0 : 2c 00 d6 BIT $d600 
35d3 : 10 fb __ BPL $35d0 ; (main.l9752 + 0)
.s674:
35d5 : 8c 01 d6 STY $d601 
35d8 : a9 15 __ LDA #$15
35da : 8d 00 d6 STA $d600 
.l9754:
35dd : 2c 00 d6 BIT $d600 
35e0 : 10 fb __ BPL $35dd ; (main.l9754 + 0)
.s679:
35e2 : 8e 01 d6 STX $d601 
.l9756:
35e5 : ad 00 d6 LDA $d600 
35e8 : 29 20 __ AND #$20
35ea : f0 f9 __ BEQ $35e5 ; (main.l9756 + 0)
.l685:
35ec : ad 00 d6 LDA $d600 
35ef : 29 20 __ AND #$20
35f1 : d0 f9 __ BNE $35ec ; (main.l685 + 0)
.s680:
35f3 : a9 19 __ LDA #$19
35f5 : 8d 00 d6 STA $d600 
35f8 : ae 25 bf LDX $bf25 ; (softscroll + 10)
.l9758:
35fb : 2c 00 d6 BIT $d600 
35fe : 10 fb __ BPL $35fb ; (main.l9758 + 0)
.s691:
3600 : 8a __ __ TXA
3601 : 4c 00 23 JMP $2300 ; (main.s1594 + 0)
.l600:
3604 : ad 00 d6 LDA $d600 
3607 : 29 20 __ AND #$20
3609 : f0 f9 __ BEQ $3604 ; (main.l600 + 0)
.l609:
360b : ad 00 d6 LDA $d600 
360e : 29 20 __ AND #$20
3610 : d0 f9 __ BNE $360b ; (main.l609 + 0)
.s604:
3612 : 8a __ __ TXA
3613 : 18 __ __ CLC
3614 : 69 02 __ ADC #$02
3616 : 8d 28 bf STA $bf28 ; (softscroll + 13)
3619 : 90 01 __ BCC $361c ; (main.s1635 + 0)
.s1634:
361b : c8 __ __ INY
.s1635:
361c : 8c 29 bf STY $bf29 ; (softscroll + 14)
361f : ee 22 bf INC $bf22 ; (softscroll + 7)
3622 : ee 22 bf INC $bf22 ; (softscroll + 7)
3625 : a9 06 __ LDA #$06
3627 : cd 22 bf CMP $bf22 ; (softscroll + 7)
362a : a9 18 __ LDA #$18
362c : 8d 00 d6 STA $d600 
362f : ae 24 bf LDX $bf24 ; (softscroll + 9)
3632 : 90 10 __ BCC $3644 ; (main.s611 + 0)
.s612:
3634 : 8a __ __ TXA
3635 : 18 __ __ CLC
3636 : 6d 22 bf ADC $bf22 ; (softscroll + 7)
.l9816:
3639 : 2c 00 d6 BIT $d600 
363c : 10 fb __ BPL $3639 ; (main.l9816 + 0)
.s1593:
363e : 8d 01 d6 STA $d601 
3641 : 4c c0 22 JMP $22c0 ; (main.s598 + 0)
.s611:
3644 : a9 00 __ LDA #$00
3646 : 8d 22 bf STA $bf22 ; (softscroll + 7)
3649 : ad 20 bf LDA $bf20 ; (softscroll + 5)
364c : 6d 1e bf ADC $bf1e ; (softscroll + 3)
364f : 85 5d __ STA T6 + 0 
3651 : 8d 20 bf STA $bf20 ; (softscroll + 5)
3654 : ad 21 bf LDA $bf21 ; (softscroll + 6)
3657 : 69 00 __ ADC #$00
3659 : 85 5e __ STA T6 + 1 
365b : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l9733:
365e : 2c 00 d6 BIT $d600 
3661 : 10 fb __ BPL $365e ; (main.l9733 + 0)
.s618:
3663 : 8e 01 d6 STX $d601 
3666 : ad 55 55 LDA $5555 ; (vdc_state + 10)
3669 : 18 __ __ CLC
366a : 65 5d __ ADC T6 + 0 
366c : aa __ __ TAX
366d : ad 56 55 LDA $5556 ; (vdc_state + 11)
3670 : 65 5e __ ADC T6 + 1 
3672 : a8 __ __ TAY
3673 : ad 53 55 LDA $5553 ; (vdc_state + 8)
3676 : 18 __ __ CLC
3677 : 65 5d __ ADC T6 + 0 
3679 : 85 5d __ STA T6 + 0 
367b : a9 0c __ LDA #$0c
367d : 8d 00 d6 STA $d600 
3680 : ad 54 55 LDA $5554 ; (vdc_state + 9)
3683 : 65 5e __ ADC T6 + 1 
.l9735:
3685 : 2c 00 d6 BIT $d600 
3688 : 10 fb __ BPL $3685 ; (main.l9735 + 0)
.s624:
368a : 8d 01 d6 STA $d601 
368d : a9 0d __ LDA #$0d
368f : 8d 00 d6 STA $d600 
.l9737:
3692 : 2c 00 d6 BIT $d600 
3695 : 10 fb __ BPL $3692 ; (main.l9737 + 0)
.s629:
3697 : a5 5d __ LDA T6 + 0 
3699 : 8d 01 d6 STA $d601 
369c : a9 14 __ LDA #$14
369e : 8d 00 d6 STA $d600 
.l9739:
36a1 : 2c 00 d6 BIT $d600 
36a4 : 10 fb __ BPL $36a1 ; (main.l9739 + 0)
.s634:
36a6 : 8c 01 d6 STY $d601 
36a9 : a9 15 __ LDA #$15
36ab : 8d 00 d6 STA $d600 
.l9741:
36ae : 2c 00 d6 BIT $d600 
36b1 : 10 fb __ BPL $36ae ; (main.l9741 + 0)
.s639:
36b3 : 8a __ __ TXA
36b4 : 4c 3e 36 JMP $363e ; (main.s1593 + 0)
.l548:
36b7 : ad 00 d6 LDA $d600 
36ba : 29 20 __ AND #$20
36bc : f0 f9 __ BEQ $36b7 ; (main.l548 + 0)
.l557:
36be : ad 00 d6 LDA $d600 
36c1 : 29 20 __ AND #$20
36c3 : d0 f9 __ BNE $36be ; (main.l557 + 0)
.s552:
36c5 : 8a __ __ TXA
36c6 : 38 __ __ SEC
36c7 : e9 02 __ SBC #$02
36c9 : 8d 28 bf STA $bf28 ; (softscroll + 13)
36cc : a5 5e __ LDA T6 + 1 
36ce : e9 00 __ SBC #$00
36d0 : 8d 29 bf STA $bf29 ; (softscroll + 14)
36d3 : a9 01 __ LDA #$01
36d5 : cd 22 bf CMP $bf22 ; (softscroll + 7)
36d8 : b0 03 __ BCS $36dd ; (main.s560 + 0)
36da : 4c 67 37 JMP $3767 ; (main.s559 + 0)
.s560:
36dd : a9 06 __ LDA #$06
36df : 8d 22 bf STA $bf22 ; (softscroll + 7)
36e2 : ad 20 bf LDA $bf20 ; (softscroll + 5)
36e5 : ed 1e bf SBC $bf1e ; (softscroll + 3)
36e8 : 85 5d __ STA T6 + 0 
36ea : 8d 20 bf STA $bf20 ; (softscroll + 5)
36ed : ad 21 bf LDA $bf21 ; (softscroll + 6)
36f0 : e9 00 __ SBC #$00
36f2 : 85 5e __ STA T6 + 1 
36f4 : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l9820:
36f7 : ad 00 d6 LDA $d600 
36fa : 29 20 __ AND #$20
36fc : d0 f9 __ BNE $36f7 ; (main.l9820 + 0)
.s567:
36fe : a9 18 __ LDA #$18
3700 : 8d 00 d6 STA $d600 
3703 : ad 24 bf LDA $bf24 ; (softscroll + 9)
3706 : 18 __ __ CLC
3707 : 69 06 __ ADC #$06
.l9822:
3709 : 2c 00 d6 BIT $d600 
370c : 10 fb __ BPL $3709 ; (main.l9822 + 0)
.s574:
370e : 8d 01 d6 STA $d601 
3711 : ad 55 55 LDA $5555 ; (vdc_state + 10)
3714 : 18 __ __ CLC
3715 : 65 5d __ ADC T6 + 0 
3717 : aa __ __ TAX
3718 : ad 56 55 LDA $5556 ; (vdc_state + 11)
371b : 65 5e __ ADC T6 + 1 
371d : a8 __ __ TAY
371e : ad 53 55 LDA $5553 ; (vdc_state + 8)
3721 : 18 __ __ CLC
3722 : 65 5d __ ADC T6 + 0 
3724 : 85 5d __ STA T6 + 0 
3726 : a9 0c __ LDA #$0c
3728 : 8d 00 d6 STA $d600 
372b : ad 54 55 LDA $5554 ; (vdc_state + 9)
372e : 65 5e __ ADC T6 + 1 
.l9824:
3730 : 2c 00 d6 BIT $d600 
3733 : 10 fb __ BPL $3730 ; (main.l9824 + 0)
.s580:
3735 : 8d 01 d6 STA $d601 
3738 : a9 0d __ LDA #$0d
373a : 8d 00 d6 STA $d600 
.l9826:
373d : 2c 00 d6 BIT $d600 
3740 : 10 fb __ BPL $373d ; (main.l9826 + 0)
.s585:
3742 : a5 5d __ LDA T6 + 0 
3744 : 8d 01 d6 STA $d601 
3747 : a9 14 __ LDA #$14
3749 : 8d 00 d6 STA $d600 
.l9828:
374c : 2c 00 d6 BIT $d600 
374f : 10 fb __ BPL $374c ; (main.l9828 + 0)
.s590:
3751 : 8c 01 d6 STY $d601 
3754 : a9 15 __ LDA #$15
3756 : 8d 00 d6 STA $d600 
.l9830:
3759 : 2c 00 d6 BIT $d600 
375c : 10 fb __ BPL $3759 ; (main.l9830 + 0)
.s595:
375e : 8a __ __ TXA
.s1592:
375f : 8d 01 d6 STA $d601 
3762 : a5 1b __ LDA ACCU + 0 
3764 : 4c 99 22 JMP $2299 ; (main.s599 + 0)
.s559:
3767 : ce 22 bf DEC $bf22 ; (softscroll + 7)
376a : ce 22 bf DEC $bf22 ; (softscroll + 7)
376d : a9 18 __ LDA #$18
376f : 8d 00 d6 STA $d600 
3772 : ad 22 bf LDA $bf22 ; (softscroll + 7)
3775 : 6d 24 bf ADC $bf24 ; (softscroll + 9)
.l9727:
3778 : 2c 00 d6 BIT $d600 
377b : 10 fb __ BPL $3778 ; (main.l9727 + 0)
377d : 4c 5f 37 JMP $375f ; (main.s1592 + 0)
.l408:
3780 : 0a __ __ ASL
3781 : aa __ __ TAX
3782 : ad 52 55 LDA $5552 ; (vdc_state + 7)
3785 : 85 43 __ STA T9 + 0 
3787 : a9 12 __ LDA #$12
3789 : 8d 00 d6 STA $d600 
378c : a5 5b __ LDA T5 + 0 
378e : 38 __ __ SEC
378f : e9 01 __ SBC #$01
3791 : 85 62 __ STA T12 + 0 
3793 : bd 64 55 LDA $5564,x ; (multab + 0)
3796 : 85 5d __ STA T6 + 0 
3798 : 18 __ __ CLC
3799 : 6d 53 55 ADC $5553 ; (vdc_state + 8)
379c : a8 __ __ TAY
379d : bd 65 55 LDA $5565,x ; (multab + 1)
37a0 : 85 5e __ STA T6 + 1 
37a2 : 6d 54 55 ADC $5554 ; (vdc_state + 9)
.l9678:
37a5 : 2c 00 d6 BIT $d600 
37a8 : 10 fb __ BPL $37a5 ; (main.l9678 + 0)
.s420:
37aa : 8d 01 d6 STA $d601 
37ad : a9 13 __ LDA #$13
37af : 8d 00 d6 STA $d600 
.l9680:
37b2 : 2c 00 d6 BIT $d600 
37b5 : 10 fb __ BPL $37b2 ; (main.l9680 + 0)
.s425:
37b7 : 8c 01 d6 STY $d601 
37ba : a9 1f __ LDA #$1f
37bc : 8d 00 d6 STA $d600 
.l9682:
37bf : 2c 00 d6 BIT $d600 
37c2 : 10 fb __ BPL $37bf ; (main.l9682 + 0)
.s429:
37c4 : a9 20 __ LDA #$20
37c6 : 8d 01 d6 STA $d601 
37c9 : a9 18 __ LDA #$18
37cb : 8d 00 d6 STA $d600 
.l9684:
37ce : 2c 00 d6 BIT $d600 
37d1 : 10 fb __ BPL $37ce ; (main.l9684 + 0)
.s435:
37d3 : ad 01 d6 LDA $d601 
37d6 : 29 7f __ AND #$7f
37d8 : a8 __ __ TAY
37d9 : a9 18 __ LDA #$18
37db : 8d 00 d6 STA $d600 
.l9686:
37de : 2c 00 d6 BIT $d600 
37e1 : 10 fb __ BPL $37de ; (main.l9686 + 0)
.s441:
37e3 : 8c 01 d6 STY $d601 
37e6 : a9 1e __ LDA #$1e
37e8 : 8d 00 d6 STA $d600 
.l9688:
37eb : 2c 00 d6 BIT $d600 
37ee : 10 fb __ BPL $37eb ; (main.l9688 + 0)
.s446:
37f0 : a5 62 __ LDA T12 + 0 
37f2 : 8d 01 d6 STA $d601 
37f5 : ad 55 55 LDA $5555 ; (vdc_state + 10)
37f8 : 18 __ __ CLC
37f9 : 65 5d __ ADC T6 + 0 
37fb : aa __ __ TAX
37fc : a9 12 __ LDA #$12
37fe : 8d 00 d6 STA $d600 
3801 : ad 56 55 LDA $5556 ; (vdc_state + 11)
3804 : 65 5e __ ADC T6 + 1 
.l9690:
3806 : 2c 00 d6 BIT $d600 
3809 : 10 fb __ BPL $3806 ; (main.l9690 + 0)
.s453:
380b : 8d 01 d6 STA $d601 
380e : a9 13 __ LDA #$13
3810 : 8d 00 d6 STA $d600 
.l9692:
3813 : 2c 00 d6 BIT $d600 
3816 : 10 fb __ BPL $3813 ; (main.l9692 + 0)
.s458:
3818 : 8e 01 d6 STX $d601 
381b : a9 1f __ LDA #$1f
381d : 8d 00 d6 STA $d600 
.l9694:
3820 : 2c 00 d6 BIT $d600 
3823 : 10 fb __ BPL $3820 ; (main.l9694 + 0)
.s462:
3825 : a5 43 __ LDA T9 + 0 
3827 : 8d 01 d6 STA $d601 
382a : a9 18 __ LDA #$18
382c : 8d 00 d6 STA $d600 
.l9696:
382f : 2c 00 d6 BIT $d600 
3832 : 10 fb __ BPL $382f ; (main.l9696 + 0)
.s468:
3834 : ad 01 d6 LDA $d601 
3837 : 29 7f __ AND #$7f
3839 : aa __ __ TAX
383a : a9 18 __ LDA #$18
383c : 8d 00 d6 STA $d600 
.l9698:
383f : 2c 00 d6 BIT $d600 
3842 : 10 fb __ BPL $383f ; (main.l9698 + 0)
.s474:
3844 : 8e 01 d6 STX $d601 
3847 : a9 1e __ LDA #$1e
3849 : 8d 00 d6 STA $d600 
.l9700:
384c : 2c 00 d6 BIT $d600 
384f : 10 fb __ BPL $384c ; (main.l9700 + 0)
.s479:
3851 : a5 62 __ LDA T12 + 0 
3853 : 8d 01 d6 STA $d601 
3856 : e6 61 __ INC T8 + 0 
3858 : a5 61 __ LDA T8 + 0 
385a : c5 5f __ CMP T7 + 0 
385c : b0 03 __ BCS $3861 ; (main.s479 + 16)
385e : 4c 80 37 JMP $3780 ; (main.l408 + 0)
3861 : 4c 55 21 JMP $2155 ; (main.s405 + 0)
.s299:
3864 : 0a __ __ ASL
3865 : aa __ __ TAX
3866 : ad 52 55 LDA $5552 ; (vdc_state + 7)
3869 : 85 56 __ STA T2 + 0 
386b : a9 12 __ LDA #$12
386d : 8d 00 d6 STA $d600 
3870 : a5 54 __ LDA T1 + 0 
3872 : 38 __ __ SEC
3873 : e9 01 __ SBC #$01
3875 : 85 5d __ STA T6 + 0 
3877 : bd 64 55 LDA $5564,x ; (multab + 0)
387a : 85 59 __ STA T4 + 0 
387c : 18 __ __ CLC
387d : 6d 53 55 ADC $5553 ; (vdc_state + 8)
3880 : a8 __ __ TAY
3881 : bd 65 55 LDA $5565,x ; (multab + 1)
3884 : 85 5a __ STA T4 + 1 
3886 : 6d 54 55 ADC $5554 ; (vdc_state + 9)
.l9865:
3889 : 2c 00 d6 BIT $d600 
388c : 10 fb __ BPL $3889 ; (main.l9865 + 0)
.s311:
388e : 8d 01 d6 STA $d601 
3891 : a9 13 __ LDA #$13
3893 : 8d 00 d6 STA $d600 
.l9867:
3896 : 2c 00 d6 BIT $d600 
3899 : 10 fb __ BPL $3896 ; (main.l9867 + 0)
.s316:
389b : 8c 01 d6 STY $d601 
389e : a9 1f __ LDA #$1f
38a0 : 8d 00 d6 STA $d600 
.l9869:
38a3 : 2c 00 d6 BIT $d600 
38a6 : 10 fb __ BPL $38a3 ; (main.l9869 + 0)
.s320:
38a8 : a9 20 __ LDA #$20
38aa : 8d 01 d6 STA $d601 
38ad : a9 18 __ LDA #$18
38af : 8d 00 d6 STA $d600 
.l9871:
38b2 : 2c 00 d6 BIT $d600 
38b5 : 10 fb __ BPL $38b2 ; (main.l9871 + 0)
.s326:
38b7 : ad 01 d6 LDA $d601 
38ba : 29 7f __ AND #$7f
38bc : a8 __ __ TAY
38bd : a9 18 __ LDA #$18
38bf : 8d 00 d6 STA $d600 
.l9873:
38c2 : 2c 00 d6 BIT $d600 
38c5 : 10 fb __ BPL $38c2 ; (main.l9873 + 0)
.s332:
38c7 : 8c 01 d6 STY $d601 
38ca : a9 1e __ LDA #$1e
38cc : 8d 00 d6 STA $d600 
.l9875:
38cf : 2c 00 d6 BIT $d600 
38d2 : 10 fb __ BPL $38cf ; (main.l9875 + 0)
.s337:
38d4 : a5 5d __ LDA T6 + 0 
38d6 : 8d 01 d6 STA $d601 
38d9 : ad 55 55 LDA $5555 ; (vdc_state + 10)
38dc : 18 __ __ CLC
38dd : 65 59 __ ADC T4 + 0 
38df : aa __ __ TAX
38e0 : a9 12 __ LDA #$12
38e2 : 8d 00 d6 STA $d600 
38e5 : ad 56 55 LDA $5556 ; (vdc_state + 11)
38e8 : 65 5a __ ADC T4 + 1 
.l9877:
38ea : 2c 00 d6 BIT $d600 
38ed : 10 fb __ BPL $38ea ; (main.l9877 + 0)
.s344:
38ef : 8d 01 d6 STA $d601 
38f2 : a9 13 __ LDA #$13
38f4 : 8d 00 d6 STA $d600 
.l9879:
38f7 : 2c 00 d6 BIT $d600 
38fa : 10 fb __ BPL $38f7 ; (main.l9879 + 0)
.s349:
38fc : 8e 01 d6 STX $d601 
38ff : a9 1f __ LDA #$1f
3901 : 8d 00 d6 STA $d600 
.l9881:
3904 : 2c 00 d6 BIT $d600 
3907 : 10 fb __ BPL $3904 ; (main.l9881 + 0)
.s353:
3909 : a5 56 __ LDA T2 + 0 
390b : 8d 01 d6 STA $d601 
390e : a9 18 __ LDA #$18
3910 : 8d 00 d6 STA $d600 
.l9883:
3913 : 2c 00 d6 BIT $d600 
3916 : 10 fb __ BPL $3913 ; (main.l9883 + 0)
.s359:
3918 : ad 01 d6 LDA $d601 
391b : 29 7f __ AND #$7f
391d : aa __ __ TAX
391e : a9 18 __ LDA #$18
3920 : 8d 00 d6 STA $d600 
.l9885:
3923 : 2c 00 d6 BIT $d600 
3926 : 10 fb __ BPL $3923 ; (main.l9885 + 0)
.s365:
3928 : 8e 01 d6 STX $d601 
392b : a9 1e __ LDA #$1e
392d : 8d 00 d6 STA $d600 
.l9887:
3930 : 2c 00 d6 BIT $d600 
3933 : 10 fb __ BPL $3930 ; (main.l9887 + 0)
.s370:
3935 : a5 5d __ LDA T6 + 0 
3937 : 8d 01 d6 STA $d601 
393a : e6 53 __ INC T0 + 0 
393c : 4c 7c 1f JMP $1f7c ; (main.l298 + 0)
.s101:
393f : 0a __ __ ASL
3940 : aa __ __ TAX
3941 : ad 52 55 LDA $5552 ; (vdc_state + 7)
3944 : 85 56 __ STA T2 + 0 
3946 : a9 12 __ LDA #$12
3948 : 8d 00 d6 STA $d600 
394b : a5 54 __ LDA T1 + 0 
394d : 38 __ __ SEC
394e : e9 01 __ SBC #$01
3950 : 85 5d __ STA T6 + 0 
3952 : bd 64 55 LDA $5564,x ; (multab + 0)
3955 : 85 59 __ STA T4 + 0 
3957 : 18 __ __ CLC
3958 : 6d 53 55 ADC $5553 ; (vdc_state + 8)
395b : a8 __ __ TAY
395c : bd 65 55 LDA $5565,x ; (multab + 1)
395f : 85 5a __ STA T4 + 1 
3961 : 6d 54 55 ADC $5554 ; (vdc_state + 9)
.l9369:
3964 : 2c 00 d6 BIT $d600 
3967 : 10 fb __ BPL $3964 ; (main.l9369 + 0)
.s113:
3969 : 8d 01 d6 STA $d601 
396c : a9 13 __ LDA #$13
396e : 8d 00 d6 STA $d600 
.l9371:
3971 : 2c 00 d6 BIT $d600 
3974 : 10 fb __ BPL $3971 ; (main.l9371 + 0)
.s118:
3976 : 8c 01 d6 STY $d601 
3979 : a9 1f __ LDA #$1f
397b : 8d 00 d6 STA $d600 
.l9373:
397e : 2c 00 d6 BIT $d600 
3981 : 10 fb __ BPL $397e ; (main.l9373 + 0)
.s122:
3983 : a9 20 __ LDA #$20
3985 : 8d 01 d6 STA $d601 
3988 : a9 18 __ LDA #$18
398a : 8d 00 d6 STA $d600 
.l9375:
398d : 2c 00 d6 BIT $d600 
3990 : 10 fb __ BPL $398d ; (main.l9375 + 0)
.s128:
3992 : ad 01 d6 LDA $d601 
3995 : 29 7f __ AND #$7f
3997 : a8 __ __ TAY
3998 : a9 18 __ LDA #$18
399a : 8d 00 d6 STA $d600 
.l9377:
399d : 2c 00 d6 BIT $d600 
39a0 : 10 fb __ BPL $399d ; (main.l9377 + 0)
.s134:
39a2 : 8c 01 d6 STY $d601 
39a5 : a9 1e __ LDA #$1e
39a7 : 8d 00 d6 STA $d600 
.l9379:
39aa : 2c 00 d6 BIT $d600 
39ad : 10 fb __ BPL $39aa ; (main.l9379 + 0)
.s139:
39af : a5 5d __ LDA T6 + 0 
39b1 : 8d 01 d6 STA $d601 
39b4 : ad 55 55 LDA $5555 ; (vdc_state + 10)
39b7 : 18 __ __ CLC
39b8 : 65 59 __ ADC T4 + 0 
39ba : aa __ __ TAX
39bb : a9 12 __ LDA #$12
39bd : 8d 00 d6 STA $d600 
39c0 : ad 56 55 LDA $5556 ; (vdc_state + 11)
39c3 : 65 5a __ ADC T4 + 1 
.l9381:
39c5 : 2c 00 d6 BIT $d600 
39c8 : 10 fb __ BPL $39c5 ; (main.l9381 + 0)
.s146:
39ca : 8d 01 d6 STA $d601 
39cd : a9 13 __ LDA #$13
39cf : 8d 00 d6 STA $d600 
.l9383:
39d2 : 2c 00 d6 BIT $d600 
39d5 : 10 fb __ BPL $39d2 ; (main.l9383 + 0)
.s151:
39d7 : 8e 01 d6 STX $d601 
39da : a9 1f __ LDA #$1f
39dc : 8d 00 d6 STA $d600 
.l9385:
39df : 2c 00 d6 BIT $d600 
39e2 : 10 fb __ BPL $39df ; (main.l9385 + 0)
.s155:
39e4 : a5 56 __ LDA T2 + 0 
39e6 : 8d 01 d6 STA $d601 
39e9 : a9 18 __ LDA #$18
39eb : 8d 00 d6 STA $d600 
.l9387:
39ee : 2c 00 d6 BIT $d600 
39f1 : 10 fb __ BPL $39ee ; (main.l9387 + 0)
.s161:
39f3 : ad 01 d6 LDA $d601 
39f6 : 29 7f __ AND #$7f
39f8 : aa __ __ TAX
39f9 : a9 18 __ LDA #$18
39fb : 8d 00 d6 STA $d600 
.l9389:
39fe : 2c 00 d6 BIT $d600 
3a01 : 10 fb __ BPL $39fe ; (main.l9389 + 0)
.s167:
3a03 : 8e 01 d6 STX $d601 
3a06 : a9 1e __ LDA #$1e
3a08 : 8d 00 d6 STA $d600 
.l9391:
3a0b : 2c 00 d6 BIT $d600 
3a0e : 10 fb __ BPL $3a0b ; (main.l9391 + 0)
.s172:
3a10 : a5 5d __ LDA T6 + 0 
3a12 : 8d 01 d6 STA $d601 
3a15 : e6 53 __ INC T0 + 0 
3a17 : 4c d5 1d JMP $1dd5 ; (main.l100 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
3a1a : a2 03 __ LDX #$03
3a1c : b5 53 __ LDA T8 + 0,x 
3a1e : 9d b2 bf STA $bfb2,x ; (nouns + 33)
3a21 : ca __ __ DEX
3a22 : 10 f8 __ BPL $3a1c ; (printf.s1000 + 2)
.s0:
3a24 : 18 __ __ CLC
3a25 : a5 23 __ LDA SP + 0 
3a27 : 69 04 __ ADC #$04
3a29 : 85 47 __ STA T0 + 0 
3a2b : a5 24 __ LDA SP + 1 
3a2d : 69 00 __ ADC #$00
3a2f : 85 48 __ STA T0 + 1 
3a31 : a9 00 __ LDA #$00
3a33 : 85 49 __ STA T2 + 0 
3a35 : a0 02 __ LDY #$02
3a37 : b1 23 __ LDA (SP + 0),y 
3a39 : 85 4a __ STA T3 + 0 
3a3b : c8 __ __ INY
3a3c : b1 23 __ LDA (SP + 0),y 
3a3e : 85 4b __ STA T3 + 1 
.l2:
3a40 : a0 00 __ LDY #$00
3a42 : b1 4a __ LDA (T3 + 0),y 
3a44 : d0 1e __ BNE $3a64 ; (printf.s3 + 0)
.s4:
3a46 : a6 49 __ LDX T2 + 0 
3a48 : 9d be bf STA $bfbe,x ; (nouns + 45)
3a4b : 8a __ __ TXA
3a4c : f0 0b __ BEQ $3a59 ; (printf.s1001 + 0)
.s117:
3a4e : a9 be __ LDA #$be
3a50 : 85 0d __ STA P0 ; (fmt + 0)
3a52 : a9 bf __ LDA #$bf
3a54 : 85 0e __ STA P1 ; (fmt + 1)
3a56 : 20 6a 3d JSR $3d6a ; (puts.s0 + 0)
.s1001:
3a59 : a2 03 __ LDX #$03
3a5b : bd b2 bf LDA $bfb2,x ; (nouns + 33)
3a5e : 95 53 __ STA T8 + 0,x 
3a60 : ca __ __ DEX
3a61 : 10 f8 __ BPL $3a5b ; (printf.s1001 + 2)
3a63 : 60 __ __ RTS
.s3:
3a64 : c9 25 __ CMP #$25
3a66 : f0 28 __ BEQ $3a90 ; (printf.s5 + 0)
.s6:
3a68 : a6 49 __ LDX T2 + 0 
3a6a : 9d be bf STA $bfbe,x ; (nouns + 45)
3a6d : e6 4a __ INC T3 + 0 
3a6f : d0 02 __ BNE $3a73 ; (printf.s1098 + 0)
.s1097:
3a71 : e6 4b __ INC T3 + 1 
.s1098:
3a73 : e8 __ __ INX
3a74 : 86 49 __ STX T2 + 0 
3a76 : e0 28 __ CPX #$28
3a78 : 90 c6 __ BCC $3a40 ; (printf.l2 + 0)
.s111:
3a7a : a9 be __ LDA #$be
3a7c : 85 0d __ STA P0 ; (fmt + 0)
3a7e : a9 bf __ LDA #$bf
3a80 : 85 0e __ STA P1 ; (fmt + 1)
3a82 : 98 __ __ TYA
3a83 : 9d be bf STA $bfbe,x ; (nouns + 45)
3a86 : 20 6a 3d JSR $3d6a ; (puts.s0 + 0)
3a89 : a9 00 __ LDA #$00
.s1068:
3a8b : 85 49 __ STA T2 + 0 
3a8d : 4c 40 3a JMP $3a40 ; (printf.l2 + 0)
.s5:
3a90 : a5 49 __ LDA T2 + 0 
3a92 : f0 15 __ BEQ $3aa9 ; (printf.s10 + 0)
.s8:
3a94 : a9 be __ LDA #$be
3a96 : 85 0d __ STA P0 ; (fmt + 0)
3a98 : a9 bf __ LDA #$bf
3a9a : 85 0e __ STA P1 ; (fmt + 1)
3a9c : 98 __ __ TYA
3a9d : a6 49 __ LDX T2 + 0 
3a9f : 9d be bf STA $bfbe,x ; (nouns + 45)
3aa2 : 20 6a 3d JSR $3d6a ; (puts.s0 + 0)
3aa5 : a9 00 __ LDA #$00
3aa7 : 85 49 __ STA T2 + 0 
.s10:
3aa9 : a9 0a __ LDA #$0a
3aab : 8d b9 bf STA $bfb9 ; (nouns + 40)
3aae : a9 00 __ LDA #$00
3ab0 : 8d ba bf STA $bfba ; (nouns + 41)
3ab3 : 8d bb bf STA $bfbb ; (nouns + 42)
3ab6 : 8d bc bf STA $bfbc ; (nouns + 43)
3ab9 : 8d bd bf STA $bfbd ; (nouns + 44)
3abc : a0 01 __ LDY #$01
3abe : b1 4a __ LDA (T3 + 0),y 
3ac0 : aa __ __ TAX
3ac1 : a9 20 __ LDA #$20
3ac3 : 8d b6 bf STA $bfb6 ; (nouns + 37)
3ac6 : a9 00 __ LDA #$00
3ac8 : 8d b7 bf STA $bfb7 ; (nouns + 38)
3acb : a9 ff __ LDA #$ff
3acd : 8d b8 bf STA $bfb8 ; (nouns + 39)
3ad0 : 18 __ __ CLC
3ad1 : a5 4a __ LDA T3 + 0 
3ad3 : 69 02 __ ADC #$02
.l15:
3ad5 : 85 4a __ STA T3 + 0 
3ad7 : 90 02 __ BCC $3adb ; (printf.s1080 + 0)
.s1079:
3ad9 : e6 4b __ INC T3 + 1 
.s1080:
3adb : 8a __ __ TXA
3adc : e0 2b __ CPX #$2b
3ade : d0 08 __ BNE $3ae8 ; (printf.s18 + 0)
.s17:
3ae0 : a9 01 __ LDA #$01
3ae2 : 8d bb bf STA $bfbb ; (nouns + 42)
3ae5 : 4c 5d 3d JMP $3d5d ; (printf.s246 + 0)
.s18:
3ae8 : c9 30 __ CMP #$30
3aea : d0 06 __ BNE $3af2 ; (printf.s21 + 0)
.s20:
3aec : 8d b6 bf STA $bfb6 ; (nouns + 37)
3aef : 4c 5d 3d JMP $3d5d ; (printf.s246 + 0)
.s21:
3af2 : e0 23 __ CPX #$23
3af4 : d0 08 __ BNE $3afe ; (printf.s24 + 0)
.s23:
3af6 : a9 01 __ LDA #$01
3af8 : 8d bd bf STA $bfbd ; (nouns + 44)
3afb : 4c 5d 3d JMP $3d5d ; (printf.s246 + 0)
.s24:
3afe : e0 2d __ CPX #$2d
3b00 : d0 08 __ BNE $3b0a ; (printf.s16 + 0)
.s26:
3b02 : a9 01 __ LDA #$01
3b04 : 8d bc bf STA $bfbc ; (nouns + 43)
3b07 : 4c 5d 3d JMP $3d5d ; (printf.s246 + 0)
.s16:
3b0a : 85 4c __ STA T4 + 0 
3b0c : e0 30 __ CPX #$30
3b0e : 90 53 __ BCC $3b63 ; (printf.s32 + 0)
.s33:
3b10 : e0 3a __ CPX #$3a
3b12 : b0 4f __ BCS $3b63 ; (printf.s32 + 0)
.s30:
3b14 : a9 00 __ LDA #$00
3b16 : 85 4d __ STA T6 + 0 
3b18 : 85 4e __ STA T6 + 1 
3b1a : e0 3a __ CPX #$3a
3b1c : b0 40 __ BCS $3b5e ; (printf.s36 + 0)
.l35:
3b1e : a5 4d __ LDA T6 + 0 
3b20 : 0a __ __ ASL
3b21 : 85 1b __ STA ACCU + 0 
3b23 : a5 4e __ LDA T6 + 1 
3b25 : 2a __ __ ROL
3b26 : 06 1b __ ASL ACCU + 0 
3b28 : 2a __ __ ROL
3b29 : aa __ __ TAX
3b2a : 18 __ __ CLC
3b2b : a5 1b __ LDA ACCU + 0 
3b2d : 65 4d __ ADC T6 + 0 
3b2f : 85 4d __ STA T6 + 0 
3b31 : 8a __ __ TXA
3b32 : 65 4e __ ADC T6 + 1 
3b34 : 06 4d __ ASL T6 + 0 
3b36 : 2a __ __ ROL
3b37 : aa __ __ TAX
3b38 : 18 __ __ CLC
3b39 : a5 4d __ LDA T6 + 0 
3b3b : 65 4c __ ADC T4 + 0 
3b3d : 90 01 __ BCC $3b40 ; (printf.s1094 + 0)
.s1093:
3b3f : e8 __ __ INX
.s1094:
3b40 : 38 __ __ SEC
3b41 : e9 30 __ SBC #$30
3b43 : 85 4d __ STA T6 + 0 
3b45 : 8a __ __ TXA
3b46 : e9 00 __ SBC #$00
3b48 : 85 4e __ STA T6 + 1 
3b4a : a0 00 __ LDY #$00
3b4c : b1 4a __ LDA (T3 + 0),y 
3b4e : 85 4c __ STA T4 + 0 
3b50 : e6 4a __ INC T3 + 0 
3b52 : d0 02 __ BNE $3b56 ; (printf.s1096 + 0)
.s1095:
3b54 : e6 4b __ INC T3 + 1 
.s1096:
3b56 : c9 30 __ CMP #$30
3b58 : 90 04 __ BCC $3b5e ; (printf.s36 + 0)
.s37:
3b5a : c9 3a __ CMP #$3a
3b5c : 90 c0 __ BCC $3b1e ; (printf.l35 + 0)
.s36:
3b5e : a5 4d __ LDA T6 + 0 
3b60 : 8d b7 bf STA $bfb7 ; (nouns + 38)
.s32:
3b63 : a5 4c __ LDA T4 + 0 
3b65 : c9 2e __ CMP #$2e
3b67 : d0 51 __ BNE $3bba ; (printf.s40 + 0)
.s38:
3b69 : a9 00 __ LDA #$00
3b6b : 85 4d __ STA T6 + 0 
.l231:
3b6d : 85 4e __ STA T6 + 1 
3b6f : a0 00 __ LDY #$00
3b71 : b1 4a __ LDA (T3 + 0),y 
3b73 : 85 4c __ STA T4 + 0 
3b75 : e6 4a __ INC T3 + 0 
3b77 : d0 02 __ BNE $3b7b ; (printf.s1082 + 0)
.s1081:
3b79 : e6 4b __ INC T3 + 1 
.s1082:
3b7b : c9 30 __ CMP #$30
3b7d : 90 04 __ BCC $3b83 ; (printf.s43 + 0)
.s44:
3b7f : c9 3a __ CMP #$3a
3b81 : 90 0a __ BCC $3b8d ; (printf.s42 + 0)
.s43:
3b83 : a5 4d __ LDA T6 + 0 
3b85 : 8d b8 bf STA $bfb8 ; (nouns + 39)
3b88 : a5 4c __ LDA T4 + 0 
3b8a : 4c ba 3b JMP $3bba ; (printf.s40 + 0)
.s42:
3b8d : a5 4d __ LDA T6 + 0 
3b8f : 0a __ __ ASL
3b90 : 85 1b __ STA ACCU + 0 
3b92 : a5 4e __ LDA T6 + 1 
3b94 : 2a __ __ ROL
3b95 : 06 1b __ ASL ACCU + 0 
3b97 : 2a __ __ ROL
3b98 : aa __ __ TAX
3b99 : 18 __ __ CLC
3b9a : a5 1b __ LDA ACCU + 0 
3b9c : 65 4d __ ADC T6 + 0 
3b9e : 85 4d __ STA T6 + 0 
3ba0 : 8a __ __ TXA
3ba1 : 65 4e __ ADC T6 + 1 
3ba3 : 06 4d __ ASL T6 + 0 
3ba5 : 2a __ __ ROL
3ba6 : aa __ __ TAX
3ba7 : 18 __ __ CLC
3ba8 : a5 4d __ LDA T6 + 0 
3baa : 65 4c __ ADC T4 + 0 
3bac : 90 01 __ BCC $3baf ; (printf.s1092 + 0)
.s1091:
3bae : e8 __ __ INX
.s1092:
3baf : 38 __ __ SEC
3bb0 : e9 30 __ SBC #$30
3bb2 : 85 4d __ STA T6 + 0 
3bb4 : 8a __ __ TXA
3bb5 : e9 00 __ SBC #$00
3bb7 : 4c 6d 3b JMP $3b6d ; (printf.l231 + 0)
.s40:
3bba : c9 64 __ CMP #$64
3bbc : f0 04 __ BEQ $3bc2 ; (printf.s45 + 0)
.s48:
3bbe : c9 44 __ CMP #$44
3bc0 : d0 05 __ BNE $3bc7 ; (printf.s46 + 0)
.s45:
3bc2 : a9 01 __ LDA #$01
3bc4 : 4c 36 3d JMP $3d36 ; (printf.s247 + 0)
.s46:
3bc7 : c9 75 __ CMP #$75
3bc9 : d0 03 __ BNE $3bce ; (printf.s52 + 0)
3bcb : 4c 34 3d JMP $3d34 ; (printf.s269 + 0)
.s52:
3bce : c9 55 __ CMP #$55
3bd0 : d0 03 __ BNE $3bd5 ; (printf.s50 + 0)
3bd2 : 4c 34 3d JMP $3d34 ; (printf.s269 + 0)
.s50:
3bd5 : c9 78 __ CMP #$78
3bd7 : f0 04 __ BEQ $3bdd ; (printf.s53 + 0)
.s56:
3bd9 : c9 58 __ CMP #$58
3bdb : d0 0d __ BNE $3bea ; (printf.s54 + 0)
.s53:
3bdd : a9 10 __ LDA #$10
3bdf : 8d b9 bf STA $bfb9 ; (nouns + 40)
3be2 : a9 00 __ LDA #$00
3be4 : 8d ba bf STA $bfba ; (nouns + 41)
3be7 : 4c 34 3d JMP $3d34 ; (printf.s269 + 0)
.s54:
3bea : c9 6c __ CMP #$6c
3bec : d0 03 __ BNE $3bf1 ; (printf.s60 + 0)
3bee : 4c c6 3c JMP $3cc6 ; (printf.s57 + 0)
.s60:
3bf1 : c9 4c __ CMP #$4c
3bf3 : d0 03 __ BNE $3bf8 ; (printf.s58 + 0)
3bf5 : 4c c6 3c JMP $3cc6 ; (printf.s57 + 0)
.s58:
3bf8 : c9 73 __ CMP #$73
3bfa : f0 39 __ BEQ $3c35 ; (printf.s73 + 0)
.s76:
3bfc : c9 53 __ CMP #$53
3bfe : f0 35 __ BEQ $3c35 ; (printf.s73 + 0)
.s74:
3c00 : c9 63 __ CMP #$63
3c02 : f0 15 __ BEQ $3c19 ; (printf.s104 + 0)
.s107:
3c04 : c9 43 __ CMP #$43
3c06 : f0 11 __ BEQ $3c19 ; (printf.s104 + 0)
.s105:
3c08 : 09 00 __ ORA #$00
3c0a : d0 03 __ BNE $3c0f ; (printf.s108 + 0)
3c0c : 4c 40 3a JMP $3a40 ; (printf.l2 + 0)
.s108:
3c0f : a6 49 __ LDX T2 + 0 
3c11 : 9d be bf STA $bfbe,x ; (nouns + 45)
3c14 : e6 49 __ INC T2 + 0 
3c16 : 4c 40 3a JMP $3a40 ; (printf.l2 + 0)
.s104:
3c19 : a0 00 __ LDY #$00
3c1b : b1 47 __ LDA (T0 + 0),y 
3c1d : a6 49 __ LDX T2 + 0 
3c1f : 9d be bf STA $bfbe,x ; (nouns + 45)
3c22 : e6 49 __ INC T2 + 0 
.s244:
3c24 : 18 __ __ CLC
3c25 : a5 47 __ LDA T0 + 0 
3c27 : 69 02 __ ADC #$02
3c29 : 85 47 __ STA T0 + 0 
3c2b : b0 03 __ BCS $3c30 ; (printf.s1083 + 0)
3c2d : 4c 40 3a JMP $3a40 ; (printf.l2 + 0)
.s1083:
3c30 : e6 48 __ INC T0 + 1 
3c32 : 4c 40 3a JMP $3a40 ; (printf.l2 + 0)
.s73:
3c35 : a0 00 __ LDY #$00
3c37 : 84 4c __ STY T4 + 0 
3c39 : b1 47 __ LDA (T0 + 0),y 
3c3b : 85 4d __ STA T6 + 0 
3c3d : c8 __ __ INY
3c3e : b1 47 __ LDA (T0 + 0),y 
3c40 : 85 4e __ STA T6 + 1 
3c42 : 18 __ __ CLC
3c43 : a5 47 __ LDA T0 + 0 
3c45 : 69 02 __ ADC #$02
3c47 : 85 47 __ STA T0 + 0 
3c49 : 90 02 __ BCC $3c4d ; (printf.s1090 + 0)
.s1089:
3c4b : e6 48 __ INC T0 + 1 
.s1090:
3c4d : ad b7 bf LDA $bfb7 ; (nouns + 38)
3c50 : f0 0d __ BEQ $3c5f ; (printf.s79 + 0)
.s1071:
3c52 : a0 00 __ LDY #$00
3c54 : b1 4d __ LDA (T6 + 0),y 
3c56 : f0 05 __ BEQ $3c5d ; (printf.s1072 + 0)
.l81:
3c58 : c8 __ __ INY
3c59 : b1 4d __ LDA (T6 + 0),y 
3c5b : d0 fb __ BNE $3c58 ; (printf.l81 + 0)
.s1072:
3c5d : 84 4c __ STY T4 + 0 
.s79:
3c5f : ad bc bf LDA $bfbc ; (nouns + 43)
3c62 : d0 1a __ BNE $3c7e ; (printf.s85 + 0)
.s1075:
3c64 : a4 4c __ LDY T4 + 0 
3c66 : cc b7 bf CPY $bfb7 ; (nouns + 38)
3c69 : a6 49 __ LDX T2 + 0 
3c6b : b0 0d __ BCS $3c7a ; (printf.s1076 + 0)
.l87:
3c6d : ad b6 bf LDA $bfb6 ; (nouns + 37)
3c70 : 9d be bf STA $bfbe,x ; (nouns + 45)
3c73 : c8 __ __ INY
3c74 : cc b7 bf CPY $bfb7 ; (nouns + 38)
3c77 : e8 __ __ INX
3c78 : 90 f3 __ BCC $3c6d ; (printf.l87 + 0)
.s1076:
3c7a : 86 49 __ STX T2 + 0 
3c7c : 84 4c __ STY T4 + 0 
.s85:
3c7e : a5 49 __ LDA T2 + 0 
3c80 : f0 16 __ BEQ $3c98 ; (printf.s238 + 0)
.s92:
3c82 : a9 be __ LDA #$be
3c84 : 85 0d __ STA P0 ; (fmt + 0)
3c86 : a9 bf __ LDA #$bf
3c88 : 85 0e __ STA P1 ; (fmt + 1)
3c8a : a9 00 __ LDA #$00
3c8c : a6 49 __ LDX T2 + 0 
3c8e : 9d be bf STA $bfbe,x ; (nouns + 45)
3c91 : 20 6a 3d JSR $3d6a ; (puts.s0 + 0)
3c94 : a9 00 __ LDA #$00
3c96 : 85 49 __ STA T2 + 0 
.s238:
3c98 : a5 4d __ LDA T6 + 0 
3c9a : 85 0d __ STA P0 ; (fmt + 0)
3c9c : a5 4e __ LDA T6 + 1 
3c9e : 85 0e __ STA P1 ; (fmt + 1)
3ca0 : 20 6a 3d JSR $3d6a ; (puts.s0 + 0)
3ca3 : ad bc bf LDA $bfbc ; (nouns + 43)
3ca6 : d0 03 __ BNE $3cab ; (printf.s1073 + 0)
3ca8 : 4c 40 3a JMP $3a40 ; (printf.l2 + 0)
.s1073:
3cab : a4 4c __ LDY T4 + 0 
3cad : cc b7 bf CPY $bfb7 ; (nouns + 38)
3cb0 : a2 00 __ LDX #$00
3cb2 : b0 0d __ BCS $3cc1 ; (printf.s1074 + 0)
.l102:
3cb4 : ad b6 bf LDA $bfb6 ; (nouns + 37)
3cb7 : 9d be bf STA $bfbe,x ; (nouns + 45)
3cba : c8 __ __ INY
3cbb : cc b7 bf CPY $bfb7 ; (nouns + 38)
3cbe : e8 __ __ INX
3cbf : 90 f3 __ BCC $3cb4 ; (printf.l102 + 0)
.s1074:
3cc1 : 86 49 __ STX T2 + 0 
3cc3 : 4c 40 3a JMP $3a40 ; (printf.l2 + 0)
.s57:
3cc6 : a0 00 __ LDY #$00
3cc8 : b1 47 __ LDA (T0 + 0),y 
3cca : 85 53 __ STA T8 + 0 
3ccc : c8 __ __ INY
3ccd : b1 47 __ LDA (T0 + 0),y 
3ccf : 85 54 __ STA T8 + 1 
3cd1 : c8 __ __ INY
3cd2 : b1 47 __ LDA (T0 + 0),y 
3cd4 : 85 55 __ STA T8 + 2 
3cd6 : c8 __ __ INY
3cd7 : b1 47 __ LDA (T0 + 0),y 
3cd9 : 85 56 __ STA T8 + 3 
3cdb : 18 __ __ CLC
3cdc : a5 47 __ LDA T0 + 0 
3cde : 69 04 __ ADC #$04
3ce0 : 85 47 __ STA T0 + 0 
3ce2 : 90 02 __ BCC $3ce6 ; (printf.s1086 + 0)
.s1085:
3ce4 : e6 48 __ INC T0 + 1 
.s1086:
3ce6 : a0 00 __ LDY #$00
3ce8 : b1 4a __ LDA (T3 + 0),y 
3cea : aa __ __ TAX
3ceb : e6 4a __ INC T3 + 0 
3ced : d0 02 __ BNE $3cf1 ; (printf.s1088 + 0)
.s1087:
3cef : e6 4b __ INC T3 + 1 
.s1088:
3cf1 : 8a __ __ TXA
3cf2 : e0 64 __ CPX #$64
3cf4 : f0 04 __ BEQ $3cfa ; (printf.s61 + 0)
.s64:
3cf6 : c9 44 __ CMP #$44
3cf8 : d0 04 __ BNE $3cfe ; (printf.s62 + 0)
.s61:
3cfa : a9 01 __ LDA #$01
3cfc : d0 1c __ BNE $3d1a ; (printf.s245 + 0)
.s62:
3cfe : c9 75 __ CMP #$75
3d00 : f0 17 __ BEQ $3d19 ; (printf.s268 + 0)
.s68:
3d02 : c9 55 __ CMP #$55
3d04 : f0 13 __ BEQ $3d19 ; (printf.s268 + 0)
.s66:
3d06 : c9 78 __ CMP #$78
3d08 : f0 07 __ BEQ $3d11 ; (printf.s69 + 0)
.s72:
3d0a : c9 58 __ CMP #$58
3d0c : f0 03 __ BEQ $3d11 ; (printf.s69 + 0)
3d0e : 4c 40 3a JMP $3a40 ; (printf.l2 + 0)
.s69:
3d11 : 8c ba bf STY $bfba ; (nouns + 41)
3d14 : a9 10 __ LDA #$10
3d16 : 8d b9 bf STA $bfb9 ; (nouns + 40)
.s268:
3d19 : 98 __ __ TYA
.s245:
3d1a : 85 15 __ STA P8 
3d1c : a9 be __ LDA #$be
3d1e : 85 0f __ STA P2 ; (fmt + 2)
3d20 : a9 bf __ LDA #$bf
3d22 : 85 10 __ STA P3 ; (fmt + 3)
3d24 : a9 b6 __ LDA #$b6
3d26 : 85 0d __ STA P0 ; (fmt + 0)
3d28 : a9 bf __ LDA #$bf
3d2a : 85 0e __ STA P1 ; (fmt + 1)
3d2c : 20 f4 3e JSR $3ef4 ; (nforml@proxy + 0)
3d2f : a5 1b __ LDA ACCU + 0 
3d31 : 4c 8b 3a JMP $3a8b ; (printf.s1068 + 0)
.s269:
3d34 : a9 00 __ LDA #$00
.s247:
3d36 : 85 13 __ STA P6 
3d38 : a9 be __ LDA #$be
3d3a : 85 0f __ STA P2 ; (fmt + 2)
3d3c : a9 bf __ LDA #$bf
3d3e : 85 10 __ STA P3 ; (fmt + 3)
3d40 : a0 00 __ LDY #$00
3d42 : b1 47 __ LDA (T0 + 0),y 
3d44 : 85 11 __ STA P4 
3d46 : c8 __ __ INY
3d47 : b1 47 __ LDA (T0 + 0),y 
3d49 : 85 12 __ STA P5 
3d4b : a9 b6 __ LDA #$b6
3d4d : 85 0d __ STA P0 ; (fmt + 0)
3d4f : a9 bf __ LDA #$bf
3d51 : 85 0e __ STA P1 ; (fmt + 1)
3d53 : 20 bf 3d JSR $3dbf ; (nformi.s0 + 0)
3d56 : a5 1b __ LDA ACCU + 0 
3d58 : 85 49 __ STA T2 + 0 
3d5a : 4c 24 3c JMP $3c24 ; (printf.s244 + 0)
.s246:
3d5d : a0 00 __ LDY #$00
3d5f : b1 4a __ LDA (T3 + 0),y 
3d61 : aa __ __ TAX
3d62 : 18 __ __ CLC
3d63 : a5 4a __ LDA T3 + 0 
3d65 : 69 01 __ ADC #$01
3d67 : 4c d5 3a JMP $3ad5 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
3d6a : a0 00 __ LDY #$00
3d6c : b1 0d __ LDA (P0),y 
3d6e : f0 0b __ BEQ $3d7b ; (puts.s1001 + 0)
3d70 : 20 7c 3d JSR $3d7c ; (putpch + 0)
3d73 : e6 0d __ INC P0 
3d75 : d0 f3 __ BNE $3d6a ; (puts.s0 + 0)
3d77 : e6 0e __ INC P1 
3d79 : d0 ef __ BNE $3d6a ; (puts.s0 + 0)
.s1001:
3d7b : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
3d7c : ae ff 4b LDX $4bff ; (giocharmap + 0)
3d7f : e0 01 __ CPX #$01
3d81 : 90 26 __ BCC $3da9 ; (putpch + 45)
3d83 : c9 0a __ CMP #$0a
3d85 : d0 02 __ BNE $3d89 ; (putpch + 13)
3d87 : a9 0d __ LDA #$0d
3d89 : c9 09 __ CMP #$09
3d8b : f0 1f __ BEQ $3dac ; (putpch + 48)
3d8d : e0 02 __ CPX #$02
3d8f : 90 18 __ BCC $3da9 ; (putpch + 45)
3d91 : c9 41 __ CMP #$41
3d93 : 90 14 __ BCC $3da9 ; (putpch + 45)
3d95 : c9 7b __ CMP #$7b
3d97 : b0 10 __ BCS $3da9 ; (putpch + 45)
3d99 : c9 61 __ CMP #$61
3d9b : b0 04 __ BCS $3da1 ; (putpch + 37)
3d9d : c9 5b __ CMP #$5b
3d9f : b0 08 __ BCS $3da9 ; (putpch + 45)
3da1 : 49 20 __ EOR #$20
3da3 : e0 03 __ CPX #$03
3da5 : f0 02 __ BEQ $3da9 ; (putpch + 45)
3da7 : 29 df __ AND #$df
3da9 : 4c d2 ff JMP $ffd2 
3dac : 38 __ __ SEC
3dad : 20 f0 ff JSR $fff0 
3db0 : 98 __ __ TYA
3db1 : 29 03 __ AND #$03
3db3 : 49 03 __ EOR #$03
3db5 : aa __ __ TAX
3db6 : a9 20 __ LDA #$20
3db8 : 20 d2 ff JSR $ffd2 
3dbb : ca __ __ DEX
3dbc : 10 fa __ BPL $3db8 ; (putpch + 60)
3dbe : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
3dbf : a9 00 __ LDA #$00
3dc1 : 85 43 __ STA T0 + 0 
3dc3 : a5 13 __ LDA P6 ; (s + 0)
3dc5 : f0 13 __ BEQ $3dda ; (nformi.s182 + 0)
.s4:
3dc7 : 24 12 __ BIT P5 ; (v + 1)
3dc9 : 10 0f __ BPL $3dda ; (nformi.s182 + 0)
.s1:
3dcb : 38 __ __ SEC
3dcc : a9 00 __ LDA #$00
3dce : e5 11 __ SBC P4 ; (v + 0)
3dd0 : 85 11 __ STA P4 ; (v + 0)
3dd2 : a9 00 __ LDA #$00
3dd4 : e5 12 __ SBC P5 ; (v + 1)
3dd6 : 85 12 __ STA P5 ; (v + 1)
3dd8 : e6 43 __ INC T0 + 0 
.s182:
3dda : a9 10 __ LDA #$10
3ddc : 85 44 __ STA T2 + 0 
3dde : a5 11 __ LDA P4 ; (v + 0)
3de0 : 05 12 __ ORA P5 ; (v + 1)
3de2 : f0 46 __ BEQ $3e2a ; (nformi.s7 + 0)
.s42:
3de4 : a0 03 __ LDY #$03
3de6 : b1 0d __ LDA (P0),y ; (si + 0)
3de8 : 85 45 __ STA T4 + 0 
3dea : c8 __ __ INY
3deb : b1 0d __ LDA (P0),y ; (si + 0)
3ded : 85 46 __ STA T4 + 1 
.l6:
3def : a5 11 __ LDA P4 ; (v + 0)
3df1 : 85 1b __ STA ACCU + 0 
3df3 : a5 12 __ LDA P5 ; (v + 1)
3df5 : 85 1c __ STA ACCU + 1 
3df7 : a5 45 __ LDA T4 + 0 
3df9 : 85 03 __ STA WORK + 0 
3dfb : a5 46 __ LDA T4 + 1 
3dfd : 85 04 __ STA WORK + 1 
3dff : 20 84 52 JSR $5284 ; (divmod + 0)
3e02 : a5 06 __ LDA WORK + 3 
3e04 : 30 08 __ BMI $3e0e ; (nformi.s78 + 0)
.s1019:
3e06 : d0 0a __ BNE $3e12 ; (nformi.s77 + 0)
.s1018:
3e08 : a5 05 __ LDA WORK + 2 
3e0a : c9 0a __ CMP #$0a
3e0c : b0 04 __ BCS $3e12 ; (nformi.s77 + 0)
.s78:
3e0e : a9 30 __ LDA #$30
3e10 : d0 02 __ BNE $3e14 ; (nformi.s79 + 0)
.s77:
3e12 : a9 37 __ LDA #$37
.s79:
3e14 : 18 __ __ CLC
3e15 : 65 05 __ ADC WORK + 2 
3e17 : c6 44 __ DEC T2 + 0 
3e19 : a6 44 __ LDX T2 + 0 
3e1b : 9d f0 bf STA $bff0,x ; (buffer + 0)
3e1e : a5 1b __ LDA ACCU + 0 
3e20 : 85 11 __ STA P4 ; (v + 0)
3e22 : a5 1c __ LDA ACCU + 1 
3e24 : 85 12 __ STA P5 ; (v + 1)
3e26 : 05 11 __ ORA P4 ; (v + 0)
3e28 : d0 c5 __ BNE $3def ; (nformi.l6 + 0)
.s7:
3e2a : a0 02 __ LDY #$02
3e2c : b1 0d __ LDA (P0),y ; (si + 0)
3e2e : c9 ff __ CMP #$ff
3e30 : d0 04 __ BNE $3e36 ; (nformi.s80 + 0)
.s81:
3e32 : a9 0f __ LDA #$0f
3e34 : d0 05 __ BNE $3e3b ; (nformi.s1026 + 0)
.s80:
3e36 : 38 __ __ SEC
3e37 : a9 10 __ LDA #$10
3e39 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
3e3b : a8 __ __ TAY
3e3c : c4 44 __ CPY T2 + 0 
3e3e : b0 0d __ BCS $3e4d ; (nformi.s10 + 0)
.s9:
3e40 : a9 30 __ LDA #$30
.l1027:
3e42 : c6 44 __ DEC T2 + 0 
3e44 : a6 44 __ LDX T2 + 0 
3e46 : 9d f0 bf STA $bff0,x ; (buffer + 0)
3e49 : c4 44 __ CPY T2 + 0 
3e4b : 90 f5 __ BCC $3e42 ; (nformi.l1027 + 0)
.s10:
3e4d : a0 07 __ LDY #$07
3e4f : b1 0d __ LDA (P0),y ; (si + 0)
3e51 : f0 20 __ BEQ $3e73 ; (nformi.s13 + 0)
.s14:
3e53 : a0 04 __ LDY #$04
3e55 : b1 0d __ LDA (P0),y ; (si + 0)
3e57 : d0 1a __ BNE $3e73 ; (nformi.s13 + 0)
.s1013:
3e59 : 88 __ __ DEY
3e5a : b1 0d __ LDA (P0),y ; (si + 0)
3e5c : c9 10 __ CMP #$10
3e5e : d0 13 __ BNE $3e73 ; (nformi.s13 + 0)
.s11:
3e60 : a9 58 __ LDA #$58
3e62 : a6 44 __ LDX T2 + 0 
3e64 : 9d ef bf STA $bfef,x ; (buff + 49)
3e67 : 8a __ __ TXA
3e68 : 18 __ __ CLC
3e69 : 69 fe __ ADC #$fe
3e6b : 85 44 __ STA T2 + 0 
3e6d : aa __ __ TAX
3e6e : a9 30 __ LDA #$30
3e70 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
3e73 : a9 00 __ LDA #$00
3e75 : 85 1b __ STA ACCU + 0 
3e77 : a5 43 __ LDA T0 + 0 
3e79 : f0 06 __ BEQ $3e81 ; (nformi.s16 + 0)
.s15:
3e7b : c6 44 __ DEC T2 + 0 
3e7d : a9 2d __ LDA #$2d
3e7f : d0 0a __ BNE $3e8b ; (nformi.s1025 + 0)
.s16:
3e81 : a0 05 __ LDY #$05
3e83 : b1 0d __ LDA (P0),y ; (si + 0)
3e85 : f0 09 __ BEQ $3e90 ; (nformi.s163 + 0)
.s18:
3e87 : c6 44 __ DEC T2 + 0 
3e89 : a9 2b __ LDA #$2b
.s1025:
3e8b : a6 44 __ LDX T2 + 0 
3e8d : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
3e90 : a0 06 __ LDY #$06
3e92 : b1 0d __ LDA (P0),y ; (si + 0)
3e94 : d0 33 __ BNE $3ec9 ; (nformi.s24 + 0)
.l30:
3e96 : a0 01 __ LDY #$01
3e98 : b1 0d __ LDA (P0),y ; (si + 0)
3e9a : 18 __ __ CLC
3e9b : 65 44 __ ADC T2 + 0 
3e9d : b0 04 __ BCS $3ea3 ; (nformi.s31 + 0)
.s1006:
3e9f : c9 11 __ CMP #$11
3ea1 : 90 0d __ BCC $3eb0 ; (nformi.s33 + 0)
.s31:
3ea3 : c6 44 __ DEC T2 + 0 
3ea5 : a0 00 __ LDY #$00
3ea7 : b1 0d __ LDA (P0),y ; (si + 0)
3ea9 : a6 44 __ LDX T2 + 0 
3eab : 9d f0 bf STA $bff0,x ; (buffer + 0)
3eae : b0 e6 __ BCS $3e96 ; (nformi.l30 + 0)
.s33:
3eb0 : a6 44 __ LDX T2 + 0 
3eb2 : e0 10 __ CPX #$10
3eb4 : b0 0e __ BCS $3ec4 ; (nformi.s23 + 0)
.s34:
3eb6 : 88 __ __ DEY
.l1022:
3eb7 : bd f0 bf LDA $bff0,x ; (buffer + 0)
3eba : 91 0f __ STA (P2),y ; (str + 0)
3ebc : e8 __ __ INX
3ebd : e0 10 __ CPX #$10
3ebf : c8 __ __ INY
3ec0 : 90 f5 __ BCC $3eb7 ; (nformi.l1022 + 0)
.s1023:
3ec2 : 84 1b __ STY ACCU + 0 
.s23:
3ec4 : a9 00 __ LDA #$00
3ec6 : 85 1c __ STA ACCU + 1 
.s1001:
3ec8 : 60 __ __ RTS
.s24:
3ec9 : a6 44 __ LDX T2 + 0 
3ecb : e0 10 __ CPX #$10
3ecd : b0 1a __ BCS $3ee9 ; (nformi.l27 + 0)
.s25:
3ecf : a0 00 __ LDY #$00
.l1020:
3ed1 : bd f0 bf LDA $bff0,x ; (buffer + 0)
3ed4 : 91 0f __ STA (P2),y ; (str + 0)
3ed6 : e8 __ __ INX
3ed7 : e0 10 __ CPX #$10
3ed9 : c8 __ __ INY
3eda : 90 f5 __ BCC $3ed1 ; (nformi.l1020 + 0)
.s1021:
3edc : 84 1b __ STY ACCU + 0 
3ede : b0 09 __ BCS $3ee9 ; (nformi.l27 + 0)
.s28:
3ee0 : 88 __ __ DEY
3ee1 : b1 0d __ LDA (P0),y ; (si + 0)
3ee3 : a4 1b __ LDY ACCU + 0 
3ee5 : 91 0f __ STA (P2),y ; (str + 0)
3ee7 : e6 1b __ INC ACCU + 0 
.l27:
3ee9 : a5 1b __ LDA ACCU + 0 
3eeb : a0 01 __ LDY #$01
3eed : d1 0d __ CMP (P0),y ; (si + 0)
3eef : 90 ef __ BCC $3ee0 ; (nformi.s28 + 0)
3ef1 : 4c c4 3e JMP $3ec4 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml@proxy: ; nforml@proxy
3ef4 : a5 53 __ LDA $53 
3ef6 : 85 11 __ STA P4 
3ef8 : a5 54 __ LDA $54 
3efa : 85 12 __ STA P5 
3efc : a5 55 __ LDA $55 
3efe : 85 13 __ STA P6 
3f00 : a5 56 __ LDA $56 
3f02 : 85 14 __ STA P7 
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
3f04 : a9 00 __ LDA #$00
3f06 : 85 43 __ STA T0 + 0 
3f08 : a5 15 __ LDA P8 ; (s + 0)
3f0a : f0 21 __ BEQ $3f2d ; (nforml.s182 + 0)
.s4:
3f0c : a5 14 __ LDA P7 ; (v + 3)
3f0e : f0 1d __ BEQ $3f2d ; (nforml.s182 + 0)
.s1032:
3f10 : 10 1b __ BPL $3f2d ; (nforml.s182 + 0)
.s1:
3f12 : 38 __ __ SEC
3f13 : a9 00 __ LDA #$00
3f15 : e5 11 __ SBC P4 ; (v + 0)
3f17 : 85 11 __ STA P4 ; (v + 0)
3f19 : a9 00 __ LDA #$00
3f1b : e5 12 __ SBC P5 ; (v + 1)
3f1d : 85 12 __ STA P5 ; (v + 1)
3f1f : a9 00 __ LDA #$00
3f21 : e5 13 __ SBC P6 ; (v + 2)
3f23 : 85 13 __ STA P6 ; (v + 2)
3f25 : a9 00 __ LDA #$00
3f27 : e5 14 __ SBC P7 ; (v + 3)
3f29 : 85 14 __ STA P7 ; (v + 3)
3f2b : e6 43 __ INC T0 + 0 
.s182:
3f2d : a9 10 __ LDA #$10
3f2f : 85 44 __ STA T2 + 0 
3f31 : a5 14 __ LDA P7 ; (v + 3)
3f33 : d0 0c __ BNE $3f41 ; (nforml.s42 + 0)
.s1024:
3f35 : a5 13 __ LDA P6 ; (v + 2)
3f37 : d0 08 __ BNE $3f41 ; (nforml.s42 + 0)
.s1025:
3f39 : a5 12 __ LDA P5 ; (v + 1)
3f3b : d0 04 __ BNE $3f41 ; (nforml.s42 + 0)
.s1026:
3f3d : c5 11 __ CMP P4 ; (v + 0)
3f3f : b0 0e __ BCS $3f4f ; (nforml.s7 + 0)
.s42:
3f41 : a0 03 __ LDY #$03
3f43 : b1 0d __ LDA (P0),y ; (si + 0)
3f45 : 85 45 __ STA T5 + 0 
3f47 : c8 __ __ INY
3f48 : b1 0d __ LDA (P0),y ; (si + 0)
3f4a : 85 46 __ STA T5 + 1 
3f4c : 4c 19 40 JMP $4019 ; (nforml.l6 + 0)
.s7:
3f4f : a0 02 __ LDY #$02
3f51 : b1 0d __ LDA (P0),y ; (si + 0)
3f53 : c9 ff __ CMP #$ff
3f55 : d0 04 __ BNE $3f5b ; (nforml.s80 + 0)
.s81:
3f57 : a9 0f __ LDA #$0f
3f59 : d0 05 __ BNE $3f60 ; (nforml.s1039 + 0)
.s80:
3f5b : 38 __ __ SEC
3f5c : a9 10 __ LDA #$10
3f5e : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
3f60 : a8 __ __ TAY
3f61 : c4 44 __ CPY T2 + 0 
3f63 : b0 0d __ BCS $3f72 ; (nforml.s10 + 0)
.s9:
3f65 : a9 30 __ LDA #$30
.l1040:
3f67 : c6 44 __ DEC T2 + 0 
3f69 : a6 44 __ LDX T2 + 0 
3f6b : 9d f0 bf STA $bff0,x ; (buffer + 0)
3f6e : c4 44 __ CPY T2 + 0 
3f70 : 90 f5 __ BCC $3f67 ; (nforml.l1040 + 0)
.s10:
3f72 : a0 07 __ LDY #$07
3f74 : b1 0d __ LDA (P0),y ; (si + 0)
3f76 : f0 20 __ BEQ $3f98 ; (nforml.s13 + 0)
.s14:
3f78 : a0 04 __ LDY #$04
3f7a : b1 0d __ LDA (P0),y ; (si + 0)
3f7c : d0 1a __ BNE $3f98 ; (nforml.s13 + 0)
.s1013:
3f7e : 88 __ __ DEY
3f7f : b1 0d __ LDA (P0),y ; (si + 0)
3f81 : c9 10 __ CMP #$10
3f83 : d0 13 __ BNE $3f98 ; (nforml.s13 + 0)
.s11:
3f85 : a9 58 __ LDA #$58
3f87 : a6 44 __ LDX T2 + 0 
3f89 : 9d ef bf STA $bfef,x ; (buff + 49)
3f8c : 8a __ __ TXA
3f8d : 18 __ __ CLC
3f8e : 69 fe __ ADC #$fe
3f90 : 85 44 __ STA T2 + 0 
3f92 : aa __ __ TAX
3f93 : a9 30 __ LDA #$30
3f95 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
3f98 : a9 00 __ LDA #$00
3f9a : 85 1b __ STA ACCU + 0 
3f9c : a5 43 __ LDA T0 + 0 
3f9e : f0 06 __ BEQ $3fa6 ; (nforml.s16 + 0)
.s15:
3fa0 : c6 44 __ DEC T2 + 0 
3fa2 : a9 2d __ LDA #$2d
3fa4 : d0 0a __ BNE $3fb0 ; (nforml.s1038 + 0)
.s16:
3fa6 : a0 05 __ LDY #$05
3fa8 : b1 0d __ LDA (P0),y ; (si + 0)
3faa : f0 09 __ BEQ $3fb5 ; (nforml.s163 + 0)
.s18:
3fac : c6 44 __ DEC T2 + 0 
3fae : a9 2b __ LDA #$2b
.s1038:
3fb0 : a6 44 __ LDX T2 + 0 
3fb2 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
3fb5 : a0 06 __ LDY #$06
3fb7 : b1 0d __ LDA (P0),y ; (si + 0)
3fb9 : d0 33 __ BNE $3fee ; (nforml.s24 + 0)
.l30:
3fbb : a0 01 __ LDY #$01
3fbd : b1 0d __ LDA (P0),y ; (si + 0)
3fbf : 18 __ __ CLC
3fc0 : 65 44 __ ADC T2 + 0 
3fc2 : b0 04 __ BCS $3fc8 ; (nforml.s31 + 0)
.s1006:
3fc4 : c9 11 __ CMP #$11
3fc6 : 90 0d __ BCC $3fd5 ; (nforml.s33 + 0)
.s31:
3fc8 : c6 44 __ DEC T2 + 0 
3fca : a0 00 __ LDY #$00
3fcc : b1 0d __ LDA (P0),y ; (si + 0)
3fce : a6 44 __ LDX T2 + 0 
3fd0 : 9d f0 bf STA $bff0,x ; (buffer + 0)
3fd3 : b0 e6 __ BCS $3fbb ; (nforml.l30 + 0)
.s33:
3fd5 : a6 44 __ LDX T2 + 0 
3fd7 : e0 10 __ CPX #$10
3fd9 : b0 0e __ BCS $3fe9 ; (nforml.s23 + 0)
.s34:
3fdb : 88 __ __ DEY
.l1035:
3fdc : bd f0 bf LDA $bff0,x ; (buffer + 0)
3fdf : 91 0f __ STA (P2),y ; (str + 0)
3fe1 : e8 __ __ INX
3fe2 : e0 10 __ CPX #$10
3fe4 : c8 __ __ INY
3fe5 : 90 f5 __ BCC $3fdc ; (nforml.l1035 + 0)
.s1036:
3fe7 : 84 1b __ STY ACCU + 0 
.s23:
3fe9 : a9 00 __ LDA #$00
3feb : 85 1c __ STA ACCU + 1 
.s1001:
3fed : 60 __ __ RTS
.s24:
3fee : a6 44 __ LDX T2 + 0 
3ff0 : e0 10 __ CPX #$10
3ff2 : b0 1a __ BCS $400e ; (nforml.l27 + 0)
.s25:
3ff4 : a0 00 __ LDY #$00
.l1033:
3ff6 : bd f0 bf LDA $bff0,x ; (buffer + 0)
3ff9 : 91 0f __ STA (P2),y ; (str + 0)
3ffb : e8 __ __ INX
3ffc : e0 10 __ CPX #$10
3ffe : c8 __ __ INY
3fff : 90 f5 __ BCC $3ff6 ; (nforml.l1033 + 0)
.s1034:
4001 : 84 1b __ STY ACCU + 0 
4003 : b0 09 __ BCS $400e ; (nforml.l27 + 0)
.s28:
4005 : 88 __ __ DEY
4006 : b1 0d __ LDA (P0),y ; (si + 0)
4008 : a4 1b __ LDY ACCU + 0 
400a : 91 0f __ STA (P2),y ; (str + 0)
400c : e6 1b __ INC ACCU + 0 
.l27:
400e : a5 1b __ LDA ACCU + 0 
4010 : a0 01 __ LDY #$01
4012 : d1 0d __ CMP (P0),y ; (si + 0)
4014 : 90 ef __ BCC $4005 ; (nforml.s28 + 0)
4016 : 4c e9 3f JMP $3fe9 ; (nforml.s23 + 0)
.l6:
4019 : a5 11 __ LDA P4 ; (v + 0)
401b : 85 1b __ STA ACCU + 0 
401d : a5 12 __ LDA P5 ; (v + 1)
401f : 85 1c __ STA ACCU + 1 
4021 : a5 13 __ LDA P6 ; (v + 2)
4023 : 85 1d __ STA ACCU + 2 
4025 : a5 14 __ LDA P7 ; (v + 3)
4027 : 85 1e __ STA ACCU + 3 
4029 : a5 45 __ LDA T5 + 0 
402b : 85 03 __ STA WORK + 0 
402d : a5 46 __ LDA T5 + 1 
402f : 85 04 __ STA WORK + 1 
4031 : a9 00 __ LDA #$00
4033 : 85 05 __ STA WORK + 2 
4035 : 85 06 __ STA WORK + 3 
4037 : 20 09 53 JSR $5309 ; (divmod32 + 0)
403a : a5 08 __ LDA WORK + 5 
403c : 30 08 __ BMI $4046 ; (nforml.s78 + 0)
.s1023:
403e : d0 0a __ BNE $404a ; (nforml.s77 + 0)
.s1022:
4040 : a5 07 __ LDA WORK + 4 
4042 : c9 0a __ CMP #$0a
4044 : b0 04 __ BCS $404a ; (nforml.s77 + 0)
.s78:
4046 : a9 30 __ LDA #$30
4048 : d0 02 __ BNE $404c ; (nforml.s79 + 0)
.s77:
404a : a9 37 __ LDA #$37
.s79:
404c : 18 __ __ CLC
404d : 65 07 __ ADC WORK + 4 
404f : c6 44 __ DEC T2 + 0 
4051 : a6 44 __ LDX T2 + 0 
4053 : 9d f0 bf STA $bff0,x ; (buffer + 0)
4056 : a5 1b __ LDA ACCU + 0 
4058 : 85 11 __ STA P4 ; (v + 0)
405a : a5 1c __ LDA ACCU + 1 
405c : 85 12 __ STA P5 ; (v + 1)
405e : a5 1d __ LDA ACCU + 2 
4060 : 85 13 __ STA P6 ; (v + 2)
4062 : a5 1e __ LDA ACCU + 3 
4064 : 85 14 __ STA P7 ; (v + 3)
4066 : d0 b1 __ BNE $4019 ; (nforml.l6 + 0)
.s1018:
4068 : a5 13 __ LDA P6 ; (v + 2)
406a : d0 ad __ BNE $4019 ; (nforml.l6 + 0)
.s1019:
406c : a5 12 __ LDA P5 ; (v + 1)
406e : d0 a9 __ BNE $4019 ; (nforml.l6 + 0)
.s1020:
4070 : c5 11 __ CMP P4 ; (v + 0)
4072 : 90 a5 __ BCC $4019 ; (nforml.l6 + 0)
4074 : 4c 4f 3f JMP $3f4f ; (nforml.s7 + 0)
--------------------------------------------------------------------
4077 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
4087 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
4097 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->i16
.s0:
40a2 : 20 b0 40 JSR $40b0 ; (getpch + 0)
40a5 : c9 00 __ CMP #$00
40a7 : f0 f9 __ BEQ $40a2 ; (getch.s0 + 0)
40a9 : 85 1b __ STA ACCU + 0 
40ab : a9 00 __ LDA #$00
40ad : 85 1c __ STA ACCU + 1 
.s1001:
40af : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
40b0 : 20 e4 ff JSR $ffe4 
40b3 : ae ff 4b LDX $4bff ; (giocharmap + 0)
40b6 : e0 01 __ CPX #$01
40b8 : 90 26 __ BCC $40e0 ; (getpch + 48)
40ba : c9 0d __ CMP #$0d
40bc : d0 02 __ BNE $40c0 ; (getpch + 16)
40be : a9 0a __ LDA #$0a
40c0 : e0 02 __ CPX #$02
40c2 : 90 1c __ BCC $40e0 ; (getpch + 48)
40c4 : c9 db __ CMP #$db
40c6 : b0 18 __ BCS $40e0 ; (getpch + 48)
40c8 : c9 41 __ CMP #$41
40ca : 90 14 __ BCC $40e0 ; (getpch + 48)
40cc : c9 c1 __ CMP #$c1
40ce : 90 02 __ BCC $40d2 ; (getpch + 34)
40d0 : 49 a0 __ EOR #$a0
40d2 : c9 7b __ CMP #$7b
40d4 : b0 0a __ BCS $40e0 ; (getpch + 48)
40d6 : c9 61 __ CMP #$61
40d8 : b0 04 __ BCS $40de ; (getpch + 46)
40da : c9 5b __ CMP #$5b
40dc : b0 02 __ BCS $40e0 ; (getpch + 48)
40de : 49 20 __ EOR #$20
40e0 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
40e1 : 20 81 ff JSR $ff81 
.s1001:
40e4 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
40e5 : 24 d7 __ BIT $d7 
40e7 : 30 03 __ BMI $40ec ; (screen_setmode.s1001 + 0)
.s6:
40e9 : 20 5f ff JSR $ff5f 
.s1001:
40ec : 60 __ __ RTS
--------------------------------------------------------------------
40ed : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
40fd : __ __ __ BYT 65 4e 00                                        : eN.
--------------------------------------------------------------------
4100 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
4110 : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
411a : __ __ __ BYT 4f 56 4c 31 00                                  : OVL1.
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
411f : a5 0d __ LDA P0 
4121 : a6 0e __ LDX P1 
4123 : 20 68 ff JSR $ff68 
.s1001:
4126 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
4127 : a5 0d __ LDA P0 
4129 : 05 0e __ ORA P1 
412b : f0 08 __ BEQ $4135 ; (krnio_setnam.s0 + 14)
412d : a0 ff __ LDY #$ff
412f : c8 __ __ INY
4130 : b1 0d __ LDA (P0),y 
4132 : d0 fb __ BNE $412f ; (krnio_setnam.s0 + 8)
4134 : 98 __ __ TYA
4135 : a6 0d __ LDX P0 
4137 : a4 0e __ LDY P1 
4139 : 20 bd ff JSR $ffbd 
.s1001:
413c : 60 __ __ RTS
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
413d : a5 0d __ LDA P0 
413f : a6 0e __ LDX P1 
4141 : a4 0f __ LDY P2 
4143 : 20 ba ff JSR $ffba 
4146 : a9 00 __ LDA #$00
4148 : a2 00 __ LDX #$00
414a : a0 00 __ LDY #$00
414c : 20 d5 ff JSR $ffd5 
414f : a9 00 __ LDA #$00
4151 : b0 02 __ BCS $4155 ; (krnio_load.s0 + 24)
4153 : a9 01 __ LDA #$01
4155 : 85 1b __ STA ACCU + 0 
.s1001:
4157 : a5 1b __ LDA ACCU + 0 
4159 : 60 __ __ RTS
--------------------------------------------------------------------
415a : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
416a : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
4178 : a9 01 __ LDA #$01
417a : 85 0d __ STA P0 
417c : a9 00 __ LDA #$00
417e : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
4180 : a5 0d __ LDA P0 
4182 : 85 1b __ STA ACCU + 0 
4184 : a5 0e __ LDA P1 
4186 : 85 1c __ STA ACCU + 1 
4188 : ae ff 4a LDX $4aff ; (spentry + 0)
418b : 9a __ __ TXS
418c : a9 4c __ LDA #$4c
418e : 85 54 __ STA $54 
4190 : a9 00 __ LDA #$00
4192 : 85 13 __ STA P6 
.s1001:
4194 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
4195 : a5 53 __ LDA T9 + 0 
4197 : 8d f9 bf STA $bff9 ; (buffer + 9)
419a : a5 54 __ LDA T9 + 1 
419c : 8d fa bf STA $bffa ; (buffer + 10)
.s0:
419f : a6 13 __ LDX P6 ; (mode + 0)
41a1 : bd 9f 53 LDA $539f,x ; (__multab36L + 0)
41a4 : 85 47 __ STA T1 + 0 
41a6 : aa __ __ TAX
41a7 : 18 __ __ CLC
41a8 : 69 00 __ ADC #$00
41aa : 85 49 __ STA T2 + 0 
41ac : a9 54 __ LDA #$54
41ae : 69 00 __ ADC #$00
41b0 : 85 4a __ STA T2 + 1 
41b2 : bd 04 54 LDA $5404,x ; (vdc_modes + 4)
41b5 : f0 0a __ BEQ $41c1 ; (vdc_set_mode.s3 + 0)
.s4:
41b7 : ad 4b 55 LDA $554b ; (vdc_state + 0)
41ba : c9 10 __ CMP #$10
41bc : d0 03 __ BNE $41c1 ; (vdc_set_mode.s3 + 0)
41be : 4c a1 44 JMP $44a1 ; (vdc_set_mode.s1001 + 0)
.s3:
41c1 : a9 00 __ LDA #$00
41c3 : 8d 61 55 STA $5561 ; (vdc_state + 22)
41c6 : 8d 62 55 STA $5562 ; (vdc_state + 23)
41c9 : 8d 63 55 STA $5563 ; (vdc_state + 24)
41cc : a0 09 __ LDY #$09
41ce : b1 49 __ LDA (T2 + 0),y 
41d0 : 8d 57 55 STA $5557 ; (vdc_state + 12)
41d3 : c8 __ __ INY
41d4 : b1 49 __ LDA (T2 + 0),y 
41d6 : 8d 58 55 STA $5558 ; (vdc_state + 13)
41d9 : c8 __ __ INY
41da : b1 49 __ LDA (T2 + 0),y 
41dc : 8d 59 55 STA $5559 ; (vdc_state + 14)
41df : c8 __ __ INY
41e0 : b1 49 __ LDA (T2 + 0),y 
41e2 : 8d 5a 55 STA $555a ; (vdc_state + 15)
41e5 : a0 0f __ LDY #$0f
41e7 : b1 49 __ LDA (T2 + 0),y 
41e9 : 8d 5d 55 STA $555d ; (vdc_state + 18)
41ec : c8 __ __ INY
41ed : b1 49 __ LDA (T2 + 0),y 
41ef : 8d 5e 55 STA $555e ; (vdc_state + 19)
41f2 : c8 __ __ INY
41f3 : b1 49 __ LDA (T2 + 0),y 
41f5 : 8d 5f 55 STA $555f ; (vdc_state + 20)
41f8 : c8 __ __ INY
41f9 : b1 49 __ LDA (T2 + 0),y 
41fb : 8d 60 55 STA $5560 ; (vdc_state + 21)
41fe : a0 00 __ LDY #$00
4200 : b1 49 __ LDA (T2 + 0),y 
4202 : 85 44 __ STA T3 + 0 
4204 : c8 __ __ INY
4205 : b1 49 __ LDA (T2 + 0),y 
4207 : 85 45 __ STA T3 + 1 
4209 : 8d 4f 55 STA $554f ; (vdc_state + 4)
420c : a5 44 __ LDA T3 + 0 
420e : 8d 4e 55 STA $554e ; (vdc_state + 3)
4211 : c8 __ __ INY
4212 : b1 49 __ LDA (T2 + 0),y 
4214 : 85 1b __ STA ACCU + 0 
4216 : c8 __ __ INY
4217 : b1 49 __ LDA (T2 + 0),y 
4219 : 85 1c __ STA ACCU + 1 
421b : 8d 51 55 STA $5551 ; (vdc_state + 6)
421e : a5 1b __ LDA ACCU + 0 
4220 : 8d 50 55 STA $5550 ; (vdc_state + 5)
4223 : a0 05 __ LDY #$05
4225 : b1 49 __ LDA (T2 + 0),y 
4227 : 85 4b __ STA T5 + 0 
4229 : c8 __ __ INY
422a : b1 49 __ LDA (T2 + 0),y 
422c : 85 4c __ STA T5 + 1 
422e : 8d 54 55 STA $5554 ; (vdc_state + 9)
4231 : a5 4b __ LDA T5 + 0 
4233 : 8d 53 55 STA $5553 ; (vdc_state + 8)
4236 : c8 __ __ INY
4237 : b1 49 __ LDA (T2 + 0),y 
4239 : 85 4d __ STA T6 + 0 
423b : c8 __ __ INY
423c : b1 49 __ LDA (T2 + 0),y 
423e : 85 4e __ STA T6 + 1 
4240 : 8d 56 55 STA $5556 ; (vdc_state + 11)
4243 : a5 4d __ LDA T6 + 0 
4245 : 8d 55 55 STA $5555 ; (vdc_state + 10)
4248 : a0 0d __ LDY #$0d
424a : b1 49 __ LDA (T2 + 0),y 
424c : 85 4f __ STA T7 + 0 
424e : c8 __ __ INY
424f : b1 49 __ LDA (T2 + 0),y 
4251 : 85 50 __ STA T7 + 1 
4253 : 8d 5c 55 STA $555c ; (vdc_state + 17)
4256 : a5 4f __ LDA T7 + 0 
4258 : 8d 5b 55 STA $555b ; (vdc_state + 16)
425b : a5 1b __ LDA ACCU + 0 
425d : 05 1c __ ORA ACCU + 1 
425f : f0 3c __ BEQ $429d ; (vdc_set_mode.s6 + 0)
.s374:
4261 : a9 00 __ LDA #$00
4263 : 85 51 __ STA T8 + 0 
4265 : 85 52 __ STA T8 + 1 
4267 : a9 64 __ LDA #$64
4269 : 85 53 __ STA T9 + 0 
426b : a9 55 __ LDA #$55
426d : 85 54 __ STA T9 + 1 
426f : a2 00 __ LDX #$00
.l8:
4271 : a5 51 __ LDA T8 + 0 
4273 : a0 00 __ LDY #$00
4275 : 91 53 __ STA (T9 + 0),y 
4277 : a5 52 __ LDA T8 + 1 
4279 : c8 __ __ INY
427a : 91 53 __ STA (T9 + 0),y 
427c : 18 __ __ CLC
427d : a5 44 __ LDA T3 + 0 
427f : 65 51 __ ADC T8 + 0 
4281 : 85 51 __ STA T8 + 0 
4283 : a5 45 __ LDA T3 + 1 
4285 : 65 52 __ ADC T8 + 1 
4287 : 85 52 __ STA T8 + 1 
4289 : 18 __ __ CLC
428a : a5 53 __ LDA T9 + 0 
428c : 69 02 __ ADC #$02
428e : 85 53 __ STA T9 + 0 
4290 : 90 02 __ BCC $4294 ; (vdc_set_mode.s1115 + 0)
.s1114:
4292 : e6 54 __ INC T9 + 1 
.s1115:
4294 : e8 __ __ INX
4295 : a5 1c __ LDA ACCU + 1 
4297 : d0 d8 __ BNE $4271 ; (vdc_set_mode.l8 + 0)
.s1108:
4299 : e4 1b __ CPX ACCU + 0 
429b : 90 d4 __ BCC $4271 ; (vdc_set_mode.l8 + 0)
.s6:
429d : a9 22 __ LDA #$22
429f : 8d 00 d6 STA $d600 
.l1577:
42a2 : 2c 00 d6 BIT $d600 
42a5 : 10 fb __ BPL $42a2 ; (vdc_set_mode.l1577 + 0)
.s16:
42a7 : a9 80 __ LDA #$80
42a9 : 8d 01 d6 STA $d601 
42ac : a9 0c __ LDA #$0c
42ae : 8d 00 d6 STA $d600 
.l1579:
42b1 : 2c 00 d6 BIT $d600 
42b4 : 10 fb __ BPL $42b1 ; (vdc_set_mode.l1579 + 0)
.s22:
42b6 : a5 4c __ LDA T5 + 1 
42b8 : 8d 01 d6 STA $d601 
42bb : a9 0d __ LDA #$0d
42bd : 8d 00 d6 STA $d600 
.l1581:
42c0 : 2c 00 d6 BIT $d600 
42c3 : 10 fb __ BPL $42c0 ; (vdc_set_mode.l1581 + 0)
.s27:
42c5 : a5 4b __ LDA T5 + 0 
42c7 : 8d 01 d6 STA $d601 
42ca : a9 14 __ LDA #$14
42cc : 8d 00 d6 STA $d600 
.l1583:
42cf : 2c 00 d6 BIT $d600 
42d2 : 10 fb __ BPL $42cf ; (vdc_set_mode.l1583 + 0)
.s32:
42d4 : a5 4e __ LDA T6 + 1 
42d6 : 8d 01 d6 STA $d601 
42d9 : a9 15 __ LDA #$15
42db : 8d 00 d6 STA $d600 
.l1585:
42de : 2c 00 d6 BIT $d600 
42e1 : 10 fb __ BPL $42de ; (vdc_set_mode.l1585 + 0)
.s37:
42e3 : a5 4d __ LDA T6 + 0 
42e5 : 8d 01 d6 STA $d601 
42e8 : a6 47 __ LDX T1 + 0 
42ea : bd 0e 54 LDA $540e,x ; (vdc_modes + 14)
42ed : 85 45 __ STA T3 + 1 
42ef : a9 1c __ LDA #$1c
42f1 : 8d 00 d6 STA $d600 
.l1587:
42f4 : 2c 00 d6 BIT $d600 
42f7 : 10 fb __ BPL $42f4 ; (vdc_set_mode.l1587 + 0)
.s44:
42f9 : ad 01 d6 LDA $d601 
42fc : 29 10 __ AND #$10
42fe : 45 45 __ EOR T3 + 1 
4300 : 29 1f __ AND #$1f
4302 : 45 45 __ EOR T3 + 1 
4304 : aa __ __ TAX
4305 : a9 1c __ LDA #$1c
4307 : 8d 00 d6 STA $d600 
.l1589:
430a : 2c 00 d6 BIT $d600 
430d : 10 fb __ BPL $430a ; (vdc_set_mode.l1589 + 0)
.s50:
430f : 8e 01 d6 STX $d601 
4312 : a5 4f __ LDA T7 + 0 
4314 : 85 0d __ STA P0 
4316 : a5 50 __ LDA T7 + 1 
4318 : 85 0e __ STA P1 
431a : 20 0a 13 JSR $130a ; (bnk_redef_charset.s0 + 0)
431d : 18 __ __ CLC
431e : a9 13 __ LDA #$13
4320 : 65 47 __ ADC T1 + 0 
4322 : 85 47 __ STA T1 + 0 
4324 : a9 54 __ LDA #$54
4326 : 69 00 __ ADC #$00
4328 : 85 48 __ STA T1 + 1 
432a : a9 00 __ LDA #$00
432c : 85 43 __ STA T0 + 0 
.l52:
432e : a4 43 __ LDY T0 + 0 
4330 : b1 47 __ LDA (T1 + 0),y 
4332 : 85 1b __ STA ACCU + 0 
4334 : c8 __ __ INY
4335 : b1 47 __ LDA (T1 + 0),y 
4337 : aa __ __ TAX
4338 : a5 1b __ LDA ACCU + 0 
433a : 8d 00 d6 STA $d600 
433d : c8 __ __ INY
433e : 84 43 __ STY T0 + 0 
.l1591:
4340 : 2c 00 d6 BIT $d600 
4343 : 10 fb __ BPL $4340 ; (vdc_set_mode.l1591 + 0)
.s58:
4345 : 8e 01 d6 STX $d601 
4348 : 18 __ __ CLC
4349 : a5 49 __ LDA T2 + 0 
434b : 65 43 __ ADC T0 + 0 
434d : 85 44 __ STA T3 + 0 
434f : a5 4a __ LDA T2 + 1 
4351 : 69 00 __ ADC #$00
4353 : 85 45 __ STA T3 + 1 
4355 : a0 13 __ LDY #$13
4357 : b1 44 __ LDA (T3 + 0),y 
4359 : c9 ff __ CMP #$ff
435b : d0 d1 __ BNE $432e ; (vdc_set_mode.l52 + 0)
.s53:
435d : a0 04 __ LDY #$04
435f : b1 49 __ LDA (T2 + 0),y 
4361 : f0 05 __ BEQ $4368 ; (vdc_set_mode.s60 + 0)
.s62:
4363 : ad 4c 55 LDA $554c ; (vdc_state + 1)
4366 : f0 0f __ BEQ $4377 ; (vdc_set_mode.s59 + 0)
.s60:
4368 : ad 4e 55 LDA $554e ; (vdc_state + 3)
436b : 85 47 __ STA T1 + 0 
436d : ad 50 55 LDA $5550 ; (vdc_state + 5)
4370 : 85 49 __ STA T2 + 0 
4372 : a2 00 __ LDX #$00
4374 : 4c 88 45 JMP $4588 ; (vdc_set_mode.l242 + 0)
.s59:
4377 : ad 4b 55 LDA $554b ; (vdc_state + 0)
437a : c9 10 __ CMP #$10
437c : d0 03 __ BNE $4381 ; (vdc_set_mode.s67 + 0)
437e : 4c 92 44 JMP $4492 ; (vdc_set_mode.s61 + 0)
.s67:
4381 : ad 4c 55 LDA $554c ; (vdc_state + 1)
4384 : f0 03 __ BEQ $4389 ; (vdc_set_mode.s66 + 0)
4386 : 4c 92 44 JMP $4492 ; (vdc_set_mode.s61 + 0)
.s66:
4389 : a9 22 __ LDA #$22
438b : 8d 00 d6 STA $d600 
.l1624:
438e : 2c 00 d6 BIT $d600 
4391 : 10 fb __ BPL $438e ; (vdc_set_mode.l1624 + 0)
.s74:
4393 : a9 80 __ LDA #$80
4395 : 8d 01 d6 STA $d601 
4398 : a2 00 __ LDX #$00
439a : a0 ff __ LDY #$ff
.l77:
439c : a9 12 __ LDA #$12
439e : 8d 00 d6 STA $d600 
.l1626:
43a1 : 2c 00 d6 BIT $d600 
43a4 : 10 fb __ BPL $43a1 ; (vdc_set_mode.l1626 + 0)
.s86:
43a6 : 8e 01 d6 STX $d601 
43a9 : a9 13 __ LDA #$13
43ab : 8d 00 d6 STA $d600 
.l1628:
43ae : 2c 00 d6 BIT $d600 
43b1 : 10 fb __ BPL $43ae ; (vdc_set_mode.l1628 + 0)
.s91:
43b3 : a9 00 __ LDA #$00
43b5 : 8d 01 d6 STA $d601 
43b8 : a9 1f __ LDA #$1f
43ba : 8d 00 d6 STA $d600 
.l1630:
43bd : 2c 00 d6 BIT $d600 
43c0 : 10 fb __ BPL $43bd ; (vdc_set_mode.l1630 + 0)
.s95:
43c2 : a9 00 __ LDA #$00
43c4 : 8d 01 d6 STA $d601 
43c7 : a9 18 __ LDA #$18
43c9 : 8d 00 d6 STA $d600 
.l1632:
43cc : 2c 00 d6 BIT $d600 
43cf : 10 fb __ BPL $43cc ; (vdc_set_mode.l1632 + 0)
.s101:
43d1 : ad 01 d6 LDA $d601 
43d4 : 29 7f __ AND #$7f
43d6 : 85 49 __ STA T2 + 0 
43d8 : a9 18 __ LDA #$18
43da : 8d 00 d6 STA $d600 
.l1634:
43dd : 2c 00 d6 BIT $d600 
43e0 : 10 fb __ BPL $43dd ; (vdc_set_mode.l1634 + 0)
.s107:
43e2 : a5 49 __ LDA T2 + 0 
43e4 : 8d 01 d6 STA $d601 
43e7 : a9 1e __ LDA #$1e
43e9 : 8d 00 d6 STA $d600 
.l1636:
43ec : 2c 00 d6 BIT $d600 
43ef : 10 fb __ BPL $43ec ; (vdc_set_mode.l1636 + 0)
.s112:
43f1 : a9 ff __ LDA #$ff
43f3 : 8d 01 d6 STA $d601 
43f6 : e8 __ __ INX
43f7 : 88 __ __ DEY
43f8 : d0 a2 __ BNE $439c ; (vdc_set_mode.l77 + 0)
.s79:
43fa : a9 12 __ LDA #$12
43fc : 8d 00 d6 STA $d600 
.l1639:
43ff : 2c 00 d6 BIT $d600 
4402 : 10 fb __ BPL $43ff ; (vdc_set_mode.l1639 + 0)
.s119:
4404 : 8e 01 d6 STX $d601 
4407 : a9 13 __ LDA #$13
4409 : 8d 00 d6 STA $d600 
.l1641:
440c : 2c 00 d6 BIT $d600 
440f : 10 fb __ BPL $440c ; (vdc_set_mode.l1641 + 0)
.s124:
4411 : 8c 01 d6 STY $d601 
4414 : a9 1f __ LDA #$1f
4416 : 8d 00 d6 STA $d600 
.l1643:
4419 : 2c 00 d6 BIT $d600 
441c : 10 fb __ BPL $4419 ; (vdc_set_mode.l1643 + 0)
.s128:
441e : 8c 01 d6 STY $d601 
4421 : a9 18 __ LDA #$18
4423 : 8d 00 d6 STA $d600 
.l1645:
4426 : 2c 00 d6 BIT $d600 
4429 : 10 fb __ BPL $4426 ; (vdc_set_mode.l1645 + 0)
.s134:
442b : ad 01 d6 LDA $d601 
442e : 29 7f __ AND #$7f
4430 : aa __ __ TAX
4431 : a9 18 __ LDA #$18
4433 : 8d 00 d6 STA $d600 
.l1647:
4436 : 2c 00 d6 BIT $d600 
4439 : 10 fb __ BPL $4436 ; (vdc_set_mode.l1647 + 0)
.s140:
443b : 8e 01 d6 STX $d601 
443e : a9 1e __ LDA #$1e
4440 : 8d 00 d6 STA $d600 
.l1649:
4443 : 2c 00 d6 BIT $d600 
4446 : 10 fb __ BPL $4443 ; (vdc_set_mode.l1649 + 0)
.s145:
4448 : a9 ff __ LDA #$ff
444a : 8d 01 d6 STA $d601 
444d : a9 1c __ LDA #$1c
444f : 8d 00 d6 STA $d600 
.l1651:
4452 : 2c 00 d6 BIT $d600 
4455 : 10 fb __ BPL $4452 ; (vdc_set_mode.l1651 + 0)
.s151:
4457 : ad 01 d6 LDA $d601 
445a : 09 10 __ ORA #$10
445c : aa __ __ TAX
445d : a9 1c __ LDA #$1c
445f : 8d 00 d6 STA $d600 
.l1653:
4462 : 2c 00 d6 BIT $d600 
4465 : 10 fb __ BPL $4462 ; (vdc_set_mode.l1653 + 0)
.s157:
4467 : 8e 01 d6 STX $d601 
446a : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
446d : ad 4e 55 LDA $554e ; (vdc_state + 3)
4470 : 85 47 __ STA T1 + 0 
4472 : ad 50 55 LDA $5550 ; (vdc_state + 5)
4475 : 85 49 __ STA T2 + 0 
4477 : a2 00 __ LDX #$00
.l161:
4479 : 8a __ __ TXA
447a : e4 49 __ CPX T2 + 0 
447c : 90 2e __ BCC $44ac ; (vdc_set_mode.s162 + 0)
.s159:
447e : a9 22 __ LDA #$22
4480 : 8d 00 d6 STA $d600 
.l1680:
4483 : 2c 00 d6 BIT $d600 
4486 : 10 fb __ BPL $4483 ; (vdc_set_mode.l1680 + 0)
.s239:
4488 : a9 7d __ LDA #$7d
448a : 8d 01 d6 STA $d601 
448d : a9 01 __ LDA #$01
448f : 8d 4c 55 STA $554c ; (vdc_state + 1)
.s61:
4492 : a9 22 __ LDA #$22
4494 : 8d 00 d6 STA $d600 
.l1621:
4497 : 2c 00 d6 BIT $d600 
449a : 10 fb __ BPL $4497 ; (vdc_set_mode.l1621 + 0)
.s320:
449c : a9 7d __ LDA #$7d
449e : 8d 01 d6 STA $d601 
.s1001:
44a1 : ad f9 bf LDA $bff9 ; (buffer + 9)
44a4 : 85 53 __ STA T9 + 0 
44a6 : ad fa bf LDA $bffa ; (buffer + 10)
44a9 : 85 54 __ STA T9 + 1 
44ab : 60 __ __ RTS
.s162:
44ac : 0a __ __ ASL
44ad : a8 __ __ TAY
44ae : b9 65 55 LDA $5565,y ; (multab + 1)
44b1 : 85 45 __ STA T3 + 1 
44b3 : ad 52 55 LDA $5552 ; (vdc_state + 7)
44b6 : 85 46 __ STA T11 + 0 
44b8 : a9 12 __ LDA #$12
44ba : 8d 00 d6 STA $d600 
44bd : a5 47 __ LDA T1 + 0 
44bf : 38 __ __ SEC
44c0 : e9 01 __ SBC #$01
44c2 : 85 4b __ STA T5 + 0 
44c4 : b9 64 55 LDA $5564,y ; (multab + 0)
44c7 : 85 44 __ STA T3 + 0 
44c9 : 18 __ __ CLC
44ca : 6d 53 55 ADC $5553 ; (vdc_state + 8)
44cd : a8 __ __ TAY
44ce : a5 45 __ LDA T3 + 1 
44d0 : 6d 54 55 ADC $5554 ; (vdc_state + 9)
.l1656:
44d3 : 2c 00 d6 BIT $d600 
44d6 : 10 fb __ BPL $44d3 ; (vdc_set_mode.l1656 + 0)
.s174:
44d8 : 8d 01 d6 STA $d601 
44db : a9 13 __ LDA #$13
44dd : 8d 00 d6 STA $d600 
.l1658:
44e0 : 2c 00 d6 BIT $d600 
44e3 : 10 fb __ BPL $44e0 ; (vdc_set_mode.l1658 + 0)
.s179:
44e5 : 8c 01 d6 STY $d601 
44e8 : a9 1f __ LDA #$1f
44ea : 8d 00 d6 STA $d600 
.l1660:
44ed : 2c 00 d6 BIT $d600 
44f0 : 10 fb __ BPL $44ed ; (vdc_set_mode.l1660 + 0)
.s183:
44f2 : a9 20 __ LDA #$20
44f4 : 8d 01 d6 STA $d601 
44f7 : a9 18 __ LDA #$18
44f9 : 8d 00 d6 STA $d600 
.l1662:
44fc : 2c 00 d6 BIT $d600 
44ff : 10 fb __ BPL $44fc ; (vdc_set_mode.l1662 + 0)
.s189:
4501 : ad 01 d6 LDA $d601 
4504 : 29 7f __ AND #$7f
4506 : a8 __ __ TAY
4507 : a9 18 __ LDA #$18
4509 : 8d 00 d6 STA $d600 
.l1664:
450c : 2c 00 d6 BIT $d600 
450f : 10 fb __ BPL $450c ; (vdc_set_mode.l1664 + 0)
.s195:
4511 : 8c 01 d6 STY $d601 
4514 : a9 1e __ LDA #$1e
4516 : 8d 00 d6 STA $d600 
.l1666:
4519 : 2c 00 d6 BIT $d600 
451c : 10 fb __ BPL $4519 ; (vdc_set_mode.l1666 + 0)
.s200:
451e : a5 4b __ LDA T5 + 0 
4520 : 8d 01 d6 STA $d601 
4523 : ad 55 55 LDA $5555 ; (vdc_state + 10)
4526 : 18 __ __ CLC
4527 : 65 44 __ ADC T3 + 0 
4529 : a8 __ __ TAY
452a : a9 12 __ LDA #$12
452c : 8d 00 d6 STA $d600 
452f : ad 56 55 LDA $5556 ; (vdc_state + 11)
4532 : 65 45 __ ADC T3 + 1 
.l1668:
4534 : 2c 00 d6 BIT $d600 
4537 : 10 fb __ BPL $4534 ; (vdc_set_mode.l1668 + 0)
.s207:
4539 : 8d 01 d6 STA $d601 
453c : a9 13 __ LDA #$13
453e : 8d 00 d6 STA $d600 
.l1670:
4541 : 2c 00 d6 BIT $d600 
4544 : 10 fb __ BPL $4541 ; (vdc_set_mode.l1670 + 0)
.s212:
4546 : 8c 01 d6 STY $d601 
4549 : a9 1f __ LDA #$1f
454b : 8d 00 d6 STA $d600 
.l1672:
454e : 2c 00 d6 BIT $d600 
4551 : 10 fb __ BPL $454e ; (vdc_set_mode.l1672 + 0)
.s216:
4553 : a5 46 __ LDA T11 + 0 
4555 : 8d 01 d6 STA $d601 
4558 : a9 18 __ LDA #$18
455a : 8d 00 d6 STA $d600 
.l1674:
455d : 2c 00 d6 BIT $d600 
4560 : 10 fb __ BPL $455d ; (vdc_set_mode.l1674 + 0)
.s222:
4562 : ad 01 d6 LDA $d601 
4565 : 29 7f __ AND #$7f
4567 : a8 __ __ TAY
4568 : a9 18 __ LDA #$18
456a : 8d 00 d6 STA $d600 
.l1676:
456d : 2c 00 d6 BIT $d600 
4570 : 10 fb __ BPL $456d ; (vdc_set_mode.l1676 + 0)
.s228:
4572 : 8c 01 d6 STY $d601 
4575 : a9 1e __ LDA #$1e
4577 : 8d 00 d6 STA $d600 
.l1678:
457a : 2c 00 d6 BIT $d600 
457d : 10 fb __ BPL $457a ; (vdc_set_mode.l1678 + 0)
.s233:
457f : a5 4b __ LDA T5 + 0 
4581 : 8d 01 d6 STA $d601 
4584 : e8 __ __ INX
4585 : 4c 79 44 JMP $4479 ; (vdc_set_mode.l161 + 0)
.l242:
4588 : 8a __ __ TXA
4589 : e4 49 __ CPX T2 + 0 
458b : 90 03 __ BCC $4590 ; (vdc_set_mode.s243 + 0)
458d : 4c 92 44 JMP $4492 ; (vdc_set_mode.s61 + 0)
.s243:
4590 : 0a __ __ ASL
4591 : a8 __ __ TAY
4592 : b9 65 55 LDA $5565,y ; (multab + 1)
4595 : 85 45 __ STA T3 + 1 
4597 : ad 52 55 LDA $5552 ; (vdc_state + 7)
459a : 85 46 __ STA T11 + 0 
459c : a9 12 __ LDA #$12
459e : 8d 00 d6 STA $d600 
45a1 : a5 47 __ LDA T1 + 0 
45a3 : 38 __ __ SEC
45a4 : e9 01 __ SBC #$01
45a6 : 85 4b __ STA T5 + 0 
45a8 : b9 64 55 LDA $5564,y ; (multab + 0)
45ab : 85 44 __ STA T3 + 0 
45ad : 18 __ __ CLC
45ae : 6d 53 55 ADC $5553 ; (vdc_state + 8)
45b1 : a8 __ __ TAY
45b2 : a5 45 __ LDA T3 + 1 
45b4 : 6d 54 55 ADC $5554 ; (vdc_state + 9)
.l1597:
45b7 : 2c 00 d6 BIT $d600 
45ba : 10 fb __ BPL $45b7 ; (vdc_set_mode.l1597 + 0)
.s255:
45bc : 8d 01 d6 STA $d601 
45bf : a9 13 __ LDA #$13
45c1 : 8d 00 d6 STA $d600 
.l1599:
45c4 : 2c 00 d6 BIT $d600 
45c7 : 10 fb __ BPL $45c4 ; (vdc_set_mode.l1599 + 0)
.s260:
45c9 : 8c 01 d6 STY $d601 
45cc : a9 1f __ LDA #$1f
45ce : 8d 00 d6 STA $d600 
.l1601:
45d1 : 2c 00 d6 BIT $d600 
45d4 : 10 fb __ BPL $45d1 ; (vdc_set_mode.l1601 + 0)
.s264:
45d6 : a9 20 __ LDA #$20
45d8 : 8d 01 d6 STA $d601 
45db : a9 18 __ LDA #$18
45dd : 8d 00 d6 STA $d600 
.l1603:
45e0 : 2c 00 d6 BIT $d600 
45e3 : 10 fb __ BPL $45e0 ; (vdc_set_mode.l1603 + 0)
.s270:
45e5 : ad 01 d6 LDA $d601 
45e8 : 29 7f __ AND #$7f
45ea : a8 __ __ TAY
45eb : a9 18 __ LDA #$18
45ed : 8d 00 d6 STA $d600 
.l1605:
45f0 : 2c 00 d6 BIT $d600 
45f3 : 10 fb __ BPL $45f0 ; (vdc_set_mode.l1605 + 0)
.s276:
45f5 : 8c 01 d6 STY $d601 
45f8 : a9 1e __ LDA #$1e
45fa : 8d 00 d6 STA $d600 
.l1607:
45fd : 2c 00 d6 BIT $d600 
4600 : 10 fb __ BPL $45fd ; (vdc_set_mode.l1607 + 0)
.s281:
4602 : a5 4b __ LDA T5 + 0 
4604 : 8d 01 d6 STA $d601 
4607 : ad 55 55 LDA $5555 ; (vdc_state + 10)
460a : 18 __ __ CLC
460b : 65 44 __ ADC T3 + 0 
460d : a8 __ __ TAY
460e : a9 12 __ LDA #$12
4610 : 8d 00 d6 STA $d600 
4613 : ad 56 55 LDA $5556 ; (vdc_state + 11)
4616 : 65 45 __ ADC T3 + 1 
.l1609:
4618 : 2c 00 d6 BIT $d600 
461b : 10 fb __ BPL $4618 ; (vdc_set_mode.l1609 + 0)
.s288:
461d : 8d 01 d6 STA $d601 
4620 : a9 13 __ LDA #$13
4622 : 8d 00 d6 STA $d600 
.l1611:
4625 : 2c 00 d6 BIT $d600 
4628 : 10 fb __ BPL $4625 ; (vdc_set_mode.l1611 + 0)
.s293:
462a : 8c 01 d6 STY $d601 
462d : a9 1f __ LDA #$1f
462f : 8d 00 d6 STA $d600 
.l1613:
4632 : 2c 00 d6 BIT $d600 
4635 : 10 fb __ BPL $4632 ; (vdc_set_mode.l1613 + 0)
.s297:
4637 : a5 46 __ LDA T11 + 0 
4639 : 8d 01 d6 STA $d601 
463c : a9 18 __ LDA #$18
463e : 8d 00 d6 STA $d600 
.l1615:
4641 : 2c 00 d6 BIT $d600 
4644 : 10 fb __ BPL $4641 ; (vdc_set_mode.l1615 + 0)
.s303:
4646 : ad 01 d6 LDA $d601 
4649 : 29 7f __ AND #$7f
464b : a8 __ __ TAY
464c : a9 18 __ LDA #$18
464e : 8d 00 d6 STA $d600 
.l1617:
4651 : 2c 00 d6 BIT $d600 
4654 : 10 fb __ BPL $4651 ; (vdc_set_mode.l1617 + 0)
.s309:
4656 : 8c 01 d6 STY $d601 
4659 : a9 1e __ LDA #$1e
465b : 8d 00 d6 STA $d600 
.l1619:
465e : 2c 00 d6 BIT $d600 
4661 : 10 fb __ BPL $465e ; (vdc_set_mode.l1619 + 0)
.s314:
4663 : a5 4b __ LDA T5 + 0 
4665 : 8d 01 d6 STA $d601 
4668 : e8 __ __ INX
4669 : 4c 88 45 JMP $4588 ; (vdc_set_mode.l242 + 0)
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
466c : a9 f2 __ LDA #$f2
466e : 85 0e __ STA P1 
4670 : a9 4a __ LDA #$4a
4672 : 85 0f __ STA P2 
--------------------------------------------------------------------
vdc_prints: ; vdc_prints(u8,u8,const u8*)->void
.s0:
4674 : a5 0d __ LDA P0 ; (y + 0)
4676 : 0a __ __ ASL
4677 : aa __ __ TAX
4678 : bd 64 55 LDA $5564,x ; (multab + 0)
467b : 85 43 __ STA T2 + 0 
467d : bd 65 55 LDA $5565,x ; (multab + 1)
4680 : 85 44 __ STA T2 + 1 
4682 : a0 00 __ LDY #$00
4684 : 84 1b __ STY ACCU + 0 
4686 : b1 0e __ LDA (P1),y ; (string + 0)
4688 : f0 16 __ BEQ $46a0 ; (vdc_prints.s6 + 0)
.s5:
468a : a5 0e __ LDA P1 ; (string + 0)
468c : 85 1b __ STA ACCU + 0 
468e : a2 00 __ LDX #$00
.l1046:
4690 : c8 __ __ INY
4691 : d0 01 __ BNE $4694 ; (vdc_prints.s1051 + 0)
.s1050:
4693 : e8 __ __ INX
.s1051:
4694 : 8a __ __ TXA
4695 : 18 __ __ CLC
4696 : 65 0f __ ADC P2 ; (string + 1)
4698 : 85 1c __ STA ACCU + 1 
469a : b1 1b __ LDA (ACCU + 0),y 
469c : d0 f2 __ BNE $4690 ; (vdc_prints.l1046 + 0)
.s1047:
469e : 84 1b __ STY ACCU + 0 
.s6:
46a0 : ad 53 55 LDA $5553 ; (vdc_state + 8)
46a3 : 18 __ __ CLC
46a4 : 65 43 __ ADC T2 + 0 
46a6 : aa __ __ TAX
46a7 : a9 12 __ LDA #$12
46a9 : 8d 00 d6 STA $d600 
46ac : ad 54 55 LDA $5554 ; (vdc_state + 9)
46af : 65 44 __ ADC T2 + 1 
.l354:
46b1 : 2c 00 d6 BIT $d600 
46b4 : 10 fb __ BPL $46b1 ; (vdc_prints.l354 + 0)
.s13:
46b6 : 8d 01 d6 STA $d601 
46b9 : a9 13 __ LDA #$13
46bb : 8d 00 d6 STA $d600 
.l356:
46be : 2c 00 d6 BIT $d600 
46c1 : 10 fb __ BPL $46be ; (vdc_prints.l356 + 0)
.s18:
46c3 : 8e 01 d6 STX $d601 
46c6 : a9 1f __ LDA #$1f
46c8 : 8d 00 d6 STA $d600 
46cb : a5 1b __ LDA ACCU + 0 
46cd : f0 61 __ BEQ $4730 ; (vdc_prints.s23 + 0)
.s95:
46cf : a0 00 __ LDY #$00
.l21:
46d1 : b1 0e __ LDA (P1),y ; (string + 0)
46d3 : c9 20 __ CMP #$20
46d5 : b0 05 __ BCS $46dc ; (vdc_prints.s27 + 0)
.s26:
46d7 : 69 80 __ ADC #$80
46d9 : 4c 22 47 JMP $4722 ; (vdc_prints.s1048 + 0)
.s27:
46dc : aa __ __ TAX
46dd : c9 40 __ CMP #$40
46df : 90 04 __ BCC $46e5 ; (vdc_prints.s30 + 0)
.s32:
46e1 : c9 60 __ CMP #$60
46e3 : 90 23 __ BCC $4708 ; (vdc_prints.s29 + 0)
.s30:
46e5 : c9 60 __ CMP #$60
46e7 : 90 0a __ BCC $46f3 ; (vdc_prints.s34 + 0)
.s36:
46e9 : 09 00 __ ORA #$00
46eb : 30 06 __ BMI $46f3 ; (vdc_prints.s34 + 0)
.s33:
46ed : 38 __ __ SEC
46ee : e9 20 __ SBC #$20
46f0 : 4c 22 47 JMP $4722 ; (vdc_prints.s1048 + 0)
.s34:
46f3 : c9 80 __ CMP #$80
46f5 : 90 09 __ BCC $4700 ; (vdc_prints.s38 + 0)
.s40:
46f7 : c9 a0 __ CMP #$a0
46f9 : b0 05 __ BCS $4700 ; (vdc_prints.s38 + 0)
.s37:
46fb : 69 40 __ ADC #$40
46fd : 4c 22 47 JMP $4722 ; (vdc_prints.s1048 + 0)
.s38:
4700 : c9 a0 __ CMP #$a0
4702 : 90 0a __ BCC $470e ; (vdc_prints.s42 + 0)
.s44:
4704 : c9 c0 __ CMP #$c0
4706 : b0 06 __ BCS $470e ; (vdc_prints.s42 + 0)
.s29:
4708 : 38 __ __ SEC
4709 : e9 40 __ SBC #$40
470b : 4c 22 47 JMP $4722 ; (vdc_prints.s1048 + 0)
.s42:
470e : c9 c0 __ CMP #$c0
4710 : 90 0a __ BCC $471c ; (vdc_prints.s46 + 0)
.s48:
4712 : c9 ff __ CMP #$ff
4714 : b0 06 __ BCS $471c ; (vdc_prints.s46 + 0)
.s45:
4716 : 38 __ __ SEC
4717 : e9 80 __ SBC #$80
4719 : 4c 22 47 JMP $4722 ; (vdc_prints.s1048 + 0)
.s46:
471c : c9 ff __ CMP #$ff
471e : d0 03 __ BNE $4723 ; (vdc_prints.l360 + 0)
.s49:
4720 : a9 5e __ LDA #$5e
.s1048:
4722 : aa __ __ TAX
.l360:
4723 : 2c 00 d6 BIT $d600 
4726 : 10 fb __ BPL $4723 ; (vdc_prints.l360 + 0)
.s54:
4728 : 8e 01 d6 STX $d601 
472b : c8 __ __ INY
472c : c4 1b __ CPY ACCU + 0 
472e : 90 a1 __ BCC $46d1 ; (vdc_prints.l21 + 0)
.s23:
4730 : a9 12 __ LDA #$12
4732 : 8d 00 d6 STA $d600 
4735 : c6 1b __ DEC ACCU + 0 
4737 : ad 55 55 LDA $5555 ; (vdc_state + 10)
473a : 18 __ __ CLC
473b : 65 43 __ ADC T2 + 0 
473d : a8 __ __ TAY
473e : ad 56 55 LDA $5556 ; (vdc_state + 11)
4741 : 65 44 __ ADC T2 + 1 
4743 : ae 52 55 LDX $5552 ; (vdc_state + 7)
.l363:
4746 : 2c 00 d6 BIT $d600 
4749 : 10 fb __ BPL $4746 ; (vdc_prints.l363 + 0)
.s61:
474b : 8d 01 d6 STA $d601 
474e : a9 13 __ LDA #$13
4750 : 8d 00 d6 STA $d600 
.l365:
4753 : 2c 00 d6 BIT $d600 
4756 : 10 fb __ BPL $4753 ; (vdc_prints.l365 + 0)
.s66:
4758 : 8c 01 d6 STY $d601 
475b : a9 1f __ LDA #$1f
475d : 8d 00 d6 STA $d600 
.l367:
4760 : 2c 00 d6 BIT $d600 
4763 : 10 fb __ BPL $4760 ; (vdc_prints.l367 + 0)
.s70:
4765 : 8e 01 d6 STX $d601 
4768 : a9 18 __ LDA #$18
476a : 8d 00 d6 STA $d600 
.l369:
476d : 2c 00 d6 BIT $d600 
4770 : 10 fb __ BPL $476d ; (vdc_prints.l369 + 0)
.s76:
4772 : ad 01 d6 LDA $d601 
4775 : 29 7f __ AND #$7f
4777 : aa __ __ TAX
4778 : a9 18 __ LDA #$18
477a : 8d 00 d6 STA $d600 
.l371:
477d : 2c 00 d6 BIT $d600 
4780 : 10 fb __ BPL $477d ; (vdc_prints.l371 + 0)
.s82:
4782 : 8e 01 d6 STX $d601 
4785 : a9 1e __ LDA #$1e
4787 : 8d 00 d6 STA $d600 
.l373:
478a : 2c 00 d6 BIT $d600 
478d : 10 fb __ BPL $478a ; (vdc_prints.l373 + 0)
.s87:
478f : a5 1b __ LDA ACCU + 0 
4791 : 8d 01 d6 STA $d601 
.s1001:
4794 : 60 __ __ RTS
--------------------------------------------------------------------
4795 : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 6f 53 43 41 52 36 34 : sTARTING oSCAR64
47a5 : __ __ __ BYT 20 76 64 63 20 44 45 4d 4f 2e 00                :  vdc DEMO..
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
47b0 : a2 03 __ LDX #$03
47b2 : b5 53 __ LDA T8 + 0,x 
47b4 : 9d e4 bf STA $bfe4,x ; (buff + 38)
47b7 : ca __ __ DEX
47b8 : 10 f8 __ BPL $47b2 ; (sprintf.s1000 + 2)
.s0:
47ba : 18 __ __ CLC
47bb : a5 23 __ LDA SP + 0 
47bd : 69 06 __ ADC #$06
47bf : 85 47 __ STA T0 + 0 
47c1 : a5 24 __ LDA SP + 1 
47c3 : 69 00 __ ADC #$00
47c5 : 85 48 __ STA T0 + 1 
47c7 : a9 00 __ LDA #$00
47c9 : 85 43 __ STA T1 + 0 
47cb : a0 04 __ LDY #$04
47cd : b1 23 __ LDA (SP + 0),y 
47cf : 85 49 __ STA T2 + 0 
47d1 : c8 __ __ INY
47d2 : b1 23 __ LDA (SP + 0),y 
47d4 : 85 4a __ STA T2 + 1 
47d6 : a0 02 __ LDY #$02
47d8 : b1 23 __ LDA (SP + 0),y 
47da : 85 4b __ STA T3 + 0 
47dc : c8 __ __ INY
47dd : b1 23 __ LDA (SP + 0),y 
47df : 85 4c __ STA T3 + 1 
.l2:
47e1 : a0 00 __ LDY #$00
47e3 : b1 49 __ LDA (T2 + 0),y 
47e5 : d0 0f __ BNE $47f6 ; (sprintf.s3 + 0)
.s4:
47e7 : a4 43 __ LDY T1 + 0 
47e9 : 91 4b __ STA (T3 + 0),y 
.s1001:
47eb : a2 03 __ LDX #$03
47ed : bd e4 bf LDA $bfe4,x ; (buff + 38)
47f0 : 95 53 __ STA T8 + 0,x 
47f2 : ca __ __ DEX
47f3 : 10 f8 __ BPL $47ed ; (sprintf.s1001 + 2)
47f5 : 60 __ __ RTS
.s3:
47f6 : c9 25 __ CMP #$25
47f8 : f0 22 __ BEQ $481c ; (sprintf.s5 + 0)
.s6:
47fa : a4 43 __ LDY T1 + 0 
47fc : 91 4b __ STA (T3 + 0),y 
47fe : e6 49 __ INC T2 + 0 
4800 : d0 02 __ BNE $4804 ; (sprintf.s1102 + 0)
.s1101:
4802 : e6 4a __ INC T2 + 1 
.s1102:
4804 : c8 __ __ INY
4805 : 84 43 __ STY T1 + 0 
4807 : 98 __ __ TYA
4808 : c0 28 __ CPY #$28
480a : 90 d5 __ BCC $47e1 ; (sprintf.l2 + 0)
.s111:
480c : 18 __ __ CLC
480d : 65 4b __ ADC T3 + 0 
480f : 85 4b __ STA T3 + 0 
4811 : 90 02 __ BCC $4815 ; (sprintf.s1104 + 0)
.s1103:
4813 : e6 4c __ INC T3 + 1 
.s1104:
4815 : a9 00 __ LDA #$00
.s1068:
4817 : 85 43 __ STA T1 + 0 
4819 : 4c e1 47 JMP $47e1 ; (sprintf.l2 + 0)
.s5:
481c : 8c ec bf STY $bfec ; (buff + 46)
481f : 8c ed bf STY $bfed ; (buff + 47)
4822 : 8c ee bf STY $bfee ; (buff + 48)
4825 : 8c ef bf STY $bfef ; (buff + 49)
4828 : a9 0a __ LDA #$0a
482a : 8d eb bf STA $bfeb ; (buff + 45)
482d : a5 43 __ LDA T1 + 0 
482f : f0 0b __ BEQ $483c ; (sprintf.s10 + 0)
.s8:
4831 : 18 __ __ CLC
4832 : 65 4b __ ADC T3 + 0 
4834 : 85 4b __ STA T3 + 0 
4836 : 90 02 __ BCC $483a ; (sprintf.s1080 + 0)
.s1079:
4838 : e6 4c __ INC T3 + 1 
.s1080:
483a : 84 43 __ STY T1 + 0 
.s10:
483c : a0 01 __ LDY #$01
483e : b1 49 __ LDA (T2 + 0),y 
4840 : aa __ __ TAX
4841 : a9 20 __ LDA #$20
4843 : 8d e8 bf STA $bfe8 ; (buff + 42)
4846 : a9 00 __ LDA #$00
4848 : 8d e9 bf STA $bfe9 ; (buff + 43)
484b : a9 ff __ LDA #$ff
484d : 8d ea bf STA $bfea ; (buff + 44)
4850 : 18 __ __ CLC
4851 : a5 49 __ LDA T2 + 0 
4853 : 69 02 __ ADC #$02
.l15:
4855 : 85 49 __ STA T2 + 0 
4857 : 90 02 __ BCC $485b ; (sprintf.s1082 + 0)
.s1081:
4859 : e6 4a __ INC T2 + 1 
.s1082:
485b : 8a __ __ TXA
485c : e0 2b __ CPX #$2b
485e : d0 08 __ BNE $4868 ; (sprintf.s18 + 0)
.s17:
4860 : a9 01 __ LDA #$01
4862 : 8d ed bf STA $bfed ; (buff + 47)
4865 : 4c c9 4a JMP $4ac9 ; (sprintf.s260 + 0)
.s18:
4868 : c9 30 __ CMP #$30
486a : d0 06 __ BNE $4872 ; (sprintf.s21 + 0)
.s20:
486c : 8d e8 bf STA $bfe8 ; (buff + 42)
486f : 4c c9 4a JMP $4ac9 ; (sprintf.s260 + 0)
.s21:
4872 : e0 23 __ CPX #$23
4874 : d0 08 __ BNE $487e ; (sprintf.s24 + 0)
.s23:
4876 : a9 01 __ LDA #$01
4878 : 8d ef bf STA $bfef ; (buff + 49)
487b : 4c c9 4a JMP $4ac9 ; (sprintf.s260 + 0)
.s24:
487e : e0 2d __ CPX #$2d
4880 : d0 08 __ BNE $488a ; (sprintf.s16 + 0)
.s26:
4882 : a9 01 __ LDA #$01
4884 : 8d ee bf STA $bfee ; (buff + 48)
4887 : 4c c9 4a JMP $4ac9 ; (sprintf.s260 + 0)
.s16:
488a : 85 45 __ STA T4 + 0 
488c : e0 30 __ CPX #$30
488e : 90 53 __ BCC $48e3 ; (sprintf.s32 + 0)
.s33:
4890 : e0 3a __ CPX #$3a
4892 : b0 4f __ BCS $48e3 ; (sprintf.s32 + 0)
.s30:
4894 : a9 00 __ LDA #$00
4896 : 85 4d __ STA T6 + 0 
4898 : 85 4e __ STA T6 + 1 
489a : e0 3a __ CPX #$3a
489c : b0 40 __ BCS $48de ; (sprintf.s36 + 0)
.l35:
489e : a5 4d __ LDA T6 + 0 
48a0 : 0a __ __ ASL
48a1 : 85 1b __ STA ACCU + 0 
48a3 : a5 4e __ LDA T6 + 1 
48a5 : 2a __ __ ROL
48a6 : 06 1b __ ASL ACCU + 0 
48a8 : 2a __ __ ROL
48a9 : aa __ __ TAX
48aa : 18 __ __ CLC
48ab : a5 1b __ LDA ACCU + 0 
48ad : 65 4d __ ADC T6 + 0 
48af : 85 4d __ STA T6 + 0 
48b1 : 8a __ __ TXA
48b2 : 65 4e __ ADC T6 + 1 
48b4 : 06 4d __ ASL T6 + 0 
48b6 : 2a __ __ ROL
48b7 : aa __ __ TAX
48b8 : 18 __ __ CLC
48b9 : a5 4d __ LDA T6 + 0 
48bb : 65 45 __ ADC T4 + 0 
48bd : 90 01 __ BCC $48c0 ; (sprintf.s1098 + 0)
.s1097:
48bf : e8 __ __ INX
.s1098:
48c0 : 38 __ __ SEC
48c1 : e9 30 __ SBC #$30
48c3 : 85 4d __ STA T6 + 0 
48c5 : 8a __ __ TXA
48c6 : e9 00 __ SBC #$00
48c8 : 85 4e __ STA T6 + 1 
48ca : a0 00 __ LDY #$00
48cc : b1 49 __ LDA (T2 + 0),y 
48ce : 85 45 __ STA T4 + 0 
48d0 : e6 49 __ INC T2 + 0 
48d2 : d0 02 __ BNE $48d6 ; (sprintf.s1100 + 0)
.s1099:
48d4 : e6 4a __ INC T2 + 1 
.s1100:
48d6 : c9 30 __ CMP #$30
48d8 : 90 04 __ BCC $48de ; (sprintf.s36 + 0)
.s37:
48da : c9 3a __ CMP #$3a
48dc : 90 c0 __ BCC $489e ; (sprintf.l35 + 0)
.s36:
48de : a5 4d __ LDA T6 + 0 
48e0 : 8d e9 bf STA $bfe9 ; (buff + 43)
.s32:
48e3 : a5 45 __ LDA T4 + 0 
48e5 : c9 2e __ CMP #$2e
48e7 : d0 51 __ BNE $493a ; (sprintf.s40 + 0)
.s38:
48e9 : a9 00 __ LDA #$00
48eb : 85 4d __ STA T6 + 0 
.l245:
48ed : 85 4e __ STA T6 + 1 
48ef : a0 00 __ LDY #$00
48f1 : b1 49 __ LDA (T2 + 0),y 
48f3 : 85 45 __ STA T4 + 0 
48f5 : e6 49 __ INC T2 + 0 
48f7 : d0 02 __ BNE $48fb ; (sprintf.s1084 + 0)
.s1083:
48f9 : e6 4a __ INC T2 + 1 
.s1084:
48fb : c9 30 __ CMP #$30
48fd : 90 04 __ BCC $4903 ; (sprintf.s43 + 0)
.s44:
48ff : c9 3a __ CMP #$3a
4901 : 90 0a __ BCC $490d ; (sprintf.s42 + 0)
.s43:
4903 : a5 4d __ LDA T6 + 0 
4905 : 8d ea bf STA $bfea ; (buff + 44)
4908 : a5 45 __ LDA T4 + 0 
490a : 4c 3a 49 JMP $493a ; (sprintf.s40 + 0)
.s42:
490d : a5 4d __ LDA T6 + 0 
490f : 0a __ __ ASL
4910 : 85 1b __ STA ACCU + 0 
4912 : a5 4e __ LDA T6 + 1 
4914 : 2a __ __ ROL
4915 : 06 1b __ ASL ACCU + 0 
4917 : 2a __ __ ROL
4918 : aa __ __ TAX
4919 : 18 __ __ CLC
491a : a5 1b __ LDA ACCU + 0 
491c : 65 4d __ ADC T6 + 0 
491e : 85 4d __ STA T6 + 0 
4920 : 8a __ __ TXA
4921 : 65 4e __ ADC T6 + 1 
4923 : 06 4d __ ASL T6 + 0 
4925 : 2a __ __ ROL
4926 : aa __ __ TAX
4927 : 18 __ __ CLC
4928 : a5 4d __ LDA T6 + 0 
492a : 65 45 __ ADC T4 + 0 
492c : 90 01 __ BCC $492f ; (sprintf.s1096 + 0)
.s1095:
492e : e8 __ __ INX
.s1096:
492f : 38 __ __ SEC
4930 : e9 30 __ SBC #$30
4932 : 85 4d __ STA T6 + 0 
4934 : 8a __ __ TXA
4935 : e9 00 __ SBC #$00
4937 : 4c ed 48 JMP $48ed ; (sprintf.l245 + 0)
.s40:
493a : c9 64 __ CMP #$64
493c : f0 04 __ BEQ $4942 ; (sprintf.s45 + 0)
.s48:
493e : c9 44 __ CMP #$44
4940 : d0 05 __ BNE $4947 ; (sprintf.s46 + 0)
.s45:
4942 : a9 01 __ LDA #$01
4944 : 4c a2 4a JMP $4aa2 ; (sprintf.s261 + 0)
.s46:
4947 : c9 75 __ CMP #$75
4949 : d0 03 __ BNE $494e ; (sprintf.s52 + 0)
494b : 4c a0 4a JMP $4aa0 ; (sprintf.s285 + 0)
.s52:
494e : c9 55 __ CMP #$55
4950 : d0 03 __ BNE $4955 ; (sprintf.s50 + 0)
4952 : 4c a0 4a JMP $4aa0 ; (sprintf.s285 + 0)
.s50:
4955 : c9 78 __ CMP #$78
4957 : f0 04 __ BEQ $495d ; (sprintf.s53 + 0)
.s56:
4959 : c9 58 __ CMP #$58
495b : d0 0d __ BNE $496a ; (sprintf.s54 + 0)
.s53:
495d : a9 10 __ LDA #$10
495f : 8d eb bf STA $bfeb ; (buff + 45)
4962 : a9 00 __ LDA #$00
4964 : 8d ec bf STA $bfec ; (buff + 46)
4967 : 4c a0 4a JMP $4aa0 ; (sprintf.s285 + 0)
.s54:
496a : c9 6c __ CMP #$6c
496c : d0 03 __ BNE $4971 ; (sprintf.s60 + 0)
496e : 4c 32 4a JMP $4a32 ; (sprintf.s57 + 0)
.s60:
4971 : c9 4c __ CMP #$4c
4973 : d0 03 __ BNE $4978 ; (sprintf.s58 + 0)
4975 : 4c 32 4a JMP $4a32 ; (sprintf.s57 + 0)
.s58:
4978 : c9 73 __ CMP #$73
497a : f0 37 __ BEQ $49b3 ; (sprintf.s73 + 0)
.s76:
497c : c9 53 __ CMP #$53
497e : f0 33 __ BEQ $49b3 ; (sprintf.s73 + 0)
.s74:
4980 : c9 63 __ CMP #$63
4982 : f0 14 __ BEQ $4998 ; (sprintf.s104 + 0)
.s107:
4984 : c9 43 __ CMP #$43
4986 : f0 10 __ BEQ $4998 ; (sprintf.s104 + 0)
.s105:
4988 : 09 00 __ ORA #$00
498a : d0 03 __ BNE $498f ; (sprintf.s108 + 0)
498c : 4c e1 47 JMP $47e1 ; (sprintf.l2 + 0)
.s108:
498f : a4 43 __ LDY T1 + 0 
4991 : 91 4b __ STA (T3 + 0),y 
4993 : e6 43 __ INC T1 + 0 
4995 : 4c e1 47 JMP $47e1 ; (sprintf.l2 + 0)
.s104:
4998 : a0 00 __ LDY #$00
499a : b1 47 __ LDA (T0 + 0),y 
499c : a4 43 __ LDY T1 + 0 
499e : 91 4b __ STA (T3 + 0),y 
49a0 : e6 43 __ INC T1 + 0 
.s258:
49a2 : 18 __ __ CLC
49a3 : a5 47 __ LDA T0 + 0 
49a5 : 69 02 __ ADC #$02
49a7 : 85 47 __ STA T0 + 0 
49a9 : b0 03 __ BCS $49ae ; (sprintf.s1085 + 0)
49ab : 4c e1 47 JMP $47e1 ; (sprintf.l2 + 0)
.s1085:
49ae : e6 48 __ INC T0 + 1 
49b0 : 4c e1 47 JMP $47e1 ; (sprintf.l2 + 0)
.s73:
49b3 : a0 00 __ LDY #$00
49b5 : 84 45 __ STY T4 + 0 
49b7 : b1 47 __ LDA (T0 + 0),y 
49b9 : 85 4d __ STA T6 + 0 
49bb : c8 __ __ INY
49bc : b1 47 __ LDA (T0 + 0),y 
49be : 85 4e __ STA T6 + 1 
49c0 : 18 __ __ CLC
49c1 : a5 47 __ LDA T0 + 0 
49c3 : 69 02 __ ADC #$02
49c5 : 85 47 __ STA T0 + 0 
49c7 : 90 02 __ BCC $49cb ; (sprintf.s1092 + 0)
.s1091:
49c9 : e6 48 __ INC T0 + 1 
.s1092:
49cb : ad e9 bf LDA $bfe9 ; (buff + 43)
49ce : f0 0d __ BEQ $49dd ; (sprintf.s79 + 0)
.s1071:
49d0 : a0 00 __ LDY #$00
49d2 : b1 4d __ LDA (T6 + 0),y 
49d4 : f0 05 __ BEQ $49db ; (sprintf.s1072 + 0)
.l81:
49d6 : c8 __ __ INY
49d7 : b1 4d __ LDA (T6 + 0),y 
49d9 : d0 fb __ BNE $49d6 ; (sprintf.l81 + 0)
.s1072:
49db : 84 45 __ STY T4 + 0 
.s79:
49dd : ad ee bf LDA $bfee ; (buff + 48)
49e0 : d0 19 __ BNE $49fb ; (sprintf.l95 + 0)
.s1075:
49e2 : a6 45 __ LDX T4 + 0 
49e4 : ec e9 bf CPX $bfe9 ; (buff + 43)
49e7 : a4 43 __ LDY T1 + 0 
49e9 : b0 0c __ BCS $49f7 ; (sprintf.s1076 + 0)
.l87:
49eb : ad e8 bf LDA $bfe8 ; (buff + 42)
49ee : 91 4b __ STA (T3 + 0),y 
49f0 : e8 __ __ INX
49f1 : ec e9 bf CPX $bfe9 ; (buff + 43)
49f4 : c8 __ __ INY
49f5 : 90 f4 __ BCC $49eb ; (sprintf.l87 + 0)
.s1076:
49f7 : 86 45 __ STX T4 + 0 
49f9 : 84 43 __ STY T1 + 0 
.l95:
49fb : a0 00 __ LDY #$00
49fd : b1 4d __ LDA (T6 + 0),y 
49ff : f0 0f __ BEQ $4a10 ; (sprintf.s91 + 0)
.s96:
4a01 : a4 43 __ LDY T1 + 0 
4a03 : 91 4b __ STA (T3 + 0),y 
4a05 : e6 43 __ INC T1 + 0 
4a07 : e6 4d __ INC T6 + 0 
4a09 : d0 f0 __ BNE $49fb ; (sprintf.l95 + 0)
.s1093:
4a0b : e6 4e __ INC T6 + 1 
4a0d : 4c fb 49 JMP $49fb ; (sprintf.l95 + 0)
.s91:
4a10 : ad ee bf LDA $bfee ; (buff + 48)
4a13 : d0 03 __ BNE $4a18 ; (sprintf.s1073 + 0)
4a15 : 4c e1 47 JMP $47e1 ; (sprintf.l2 + 0)
.s1073:
4a18 : a6 45 __ LDX T4 + 0 
4a1a : ec e9 bf CPX $bfe9 ; (buff + 43)
4a1d : a4 43 __ LDY T1 + 0 
4a1f : b0 0c __ BCS $4a2d ; (sprintf.s1074 + 0)
.l102:
4a21 : ad e8 bf LDA $bfe8 ; (buff + 42)
4a24 : 91 4b __ STA (T3 + 0),y 
4a26 : e8 __ __ INX
4a27 : ec e9 bf CPX $bfe9 ; (buff + 43)
4a2a : c8 __ __ INY
4a2b : 90 f4 __ BCC $4a21 ; (sprintf.l102 + 0)
.s1074:
4a2d : 84 43 __ STY T1 + 0 
4a2f : 4c e1 47 JMP $47e1 ; (sprintf.l2 + 0)
.s57:
4a32 : a0 00 __ LDY #$00
4a34 : b1 47 __ LDA (T0 + 0),y 
4a36 : 85 53 __ STA T8 + 0 
4a38 : c8 __ __ INY
4a39 : b1 47 __ LDA (T0 + 0),y 
4a3b : 85 54 __ STA T8 + 1 
4a3d : c8 __ __ INY
4a3e : b1 47 __ LDA (T0 + 0),y 
4a40 : 85 55 __ STA T8 + 2 
4a42 : c8 __ __ INY
4a43 : b1 47 __ LDA (T0 + 0),y 
4a45 : 85 56 __ STA T8 + 3 
4a47 : 18 __ __ CLC
4a48 : a5 47 __ LDA T0 + 0 
4a4a : 69 04 __ ADC #$04
4a4c : 85 47 __ STA T0 + 0 
4a4e : 90 02 __ BCC $4a52 ; (sprintf.s1088 + 0)
.s1087:
4a50 : e6 48 __ INC T0 + 1 
.s1088:
4a52 : a0 00 __ LDY #$00
4a54 : b1 49 __ LDA (T2 + 0),y 
4a56 : aa __ __ TAX
4a57 : e6 49 __ INC T2 + 0 
4a59 : d0 02 __ BNE $4a5d ; (sprintf.s1090 + 0)
.s1089:
4a5b : e6 4a __ INC T2 + 1 
.s1090:
4a5d : 8a __ __ TXA
4a5e : e0 64 __ CPX #$64
4a60 : f0 04 __ BEQ $4a66 ; (sprintf.s61 + 0)
.s64:
4a62 : c9 44 __ CMP #$44
4a64 : d0 04 __ BNE $4a6a ; (sprintf.s62 + 0)
.s61:
4a66 : a9 01 __ LDA #$01
4a68 : d0 1c __ BNE $4a86 ; (sprintf.s259 + 0)
.s62:
4a6a : c9 75 __ CMP #$75
4a6c : f0 17 __ BEQ $4a85 ; (sprintf.s284 + 0)
.s68:
4a6e : c9 55 __ CMP #$55
4a70 : f0 13 __ BEQ $4a85 ; (sprintf.s284 + 0)
.s66:
4a72 : c9 78 __ CMP #$78
4a74 : f0 07 __ BEQ $4a7d ; (sprintf.s69 + 0)
.s72:
4a76 : c9 58 __ CMP #$58
4a78 : f0 03 __ BEQ $4a7d ; (sprintf.s69 + 0)
4a7a : 4c e1 47 JMP $47e1 ; (sprintf.l2 + 0)
.s69:
4a7d : 8c ec bf STY $bfec ; (buff + 46)
4a80 : a9 10 __ LDA #$10
4a82 : 8d eb bf STA $bfeb ; (buff + 45)
.s284:
4a85 : 98 __ __ TYA
.s259:
4a86 : 85 15 __ STA P8 
4a88 : a5 4b __ LDA T3 + 0 
4a8a : 85 0f __ STA P2 ; (fmt + 0)
4a8c : a5 4c __ LDA T3 + 1 
4a8e : 85 10 __ STA P3 ; (fmt + 1)
4a90 : a9 e8 __ LDA #$e8
4a92 : 85 0d __ STA P0 ; (str + 0)
4a94 : a9 bf __ LDA #$bf
4a96 : 85 0e __ STA P1 ; (str + 1)
4a98 : 20 f4 3e JSR $3ef4 ; (nforml@proxy + 0)
4a9b : a5 1b __ LDA ACCU + 0 
4a9d : 4c 17 48 JMP $4817 ; (sprintf.s1068 + 0)
.s285:
4aa0 : a9 00 __ LDA #$00
.s261:
4aa2 : 85 13 __ STA P6 
4aa4 : a5 4b __ LDA T3 + 0 
4aa6 : 85 0f __ STA P2 ; (fmt + 0)
4aa8 : a5 4c __ LDA T3 + 1 
4aaa : 85 10 __ STA P3 ; (fmt + 1)
4aac : a0 00 __ LDY #$00
4aae : b1 47 __ LDA (T0 + 0),y 
4ab0 : 85 11 __ STA P4 ; (fmt + 2)
4ab2 : c8 __ __ INY
4ab3 : b1 47 __ LDA (T0 + 0),y 
4ab5 : 85 12 __ STA P5 ; (fmt + 3)
4ab7 : a9 e8 __ LDA #$e8
4ab9 : 85 0d __ STA P0 ; (str + 0)
4abb : a9 bf __ LDA #$bf
4abd : 85 0e __ STA P1 ; (str + 1)
4abf : 20 bf 3d JSR $3dbf ; (nformi.s0 + 0)
4ac2 : a5 1b __ LDA ACCU + 0 
4ac4 : 85 43 __ STA T1 + 0 
4ac6 : 4c a2 49 JMP $49a2 ; (sprintf.s258 + 0)
.s260:
4ac9 : a0 00 __ LDY #$00
4acb : b1 49 __ LDA (T2 + 0),y 
4acd : aa __ __ TAX
4ace : 18 __ __ CLC
4acf : a5 49 __ LDA T2 + 0 
4ad1 : 69 01 __ ADC #$01
4ad3 : 4c 55 48 JMP $4855 ; (sprintf.l15 + 0)
--------------------------------------------------------------------
4ad6 : __ __ __ BYT 64 49 53 00                                     : dIS.
--------------------------------------------------------------------
4ada : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 3a 00 : lOADING ASSETS:.
--------------------------------------------------------------------
4aea : __ __ __ BYT 53 43 52 45 45 4e 31 00                         : SCREEN1.
--------------------------------------------------------------------
4af2 : __ __ __ BYT 6c 4f 41 44 20 45 52 52 4f 52 2e 00             : lOAD ERROR..
--------------------------------------------------------------------
4afe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
spentry:
4aff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4b00 : __ __ __ BYT 76 64 63 20 4d 45 4d 4f 52 59 20 44 45 54 45 43 : vdc MEMORY DETEC
4b10 : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 2c 20 45 58 54 45 : TED: %U kb, EXTE
4b20 : __ __ __ BYT 4e 44 45 44 20 4d 45 4d 4f 52 59 20 25 53 41 42 : NDED MEMORY %SAB
4b30 : __ __ __ BYT 4c 45 44 2e 00                                  : LED..
--------------------------------------------------------------------
4b35 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 20 31 3a 20 6c 4f 56 45 : - SCREEN 1: lOVE
4b45 : __ __ __ BYT 20 49 53 20 41 20 64 52 55 47 00                :  IS A dRUG.
--------------------------------------------------------------------
4b50 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 20 32 3a 20 6c 4f 47 4f : - SCREEN 2: lOGO
4b60 : __ __ __ BYT 20 54 45 53 54 20 53 43 52 45 45 4e 00          :  TEST SCREEN.
--------------------------------------------------------------------
4b6d : __ __ __ BYT 53 43 52 45 45 4e 32 00                         : SCREEN2.
--------------------------------------------------------------------
4b75 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 44 45 4d 4f : oSCAR64 vdc DEMO
4b85 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4b86 : __ __ __ BYT 76 64 63 20 6d 45 4d 4f 52 59 20 64 45 54 45 43 : vdc mEMORY dETEC
4b96 : __ __ __ BYT 54 45 44 3a 20 25 44 20 6b 62 2c 20 53 43 52 45 : TED: %D kb, SCRE
4ba6 : __ __ __ BYT 45 4e 20 53 49 5a 45 3a 20 25 44 58 25 44 2c 20 : EN SIZE: %DX%D, 
4bb6 : __ __ __ BYT 45 58 54 2e 4d 45 4d 3a 20 25 53 00             : EXT.MEM: %S.
--------------------------------------------------------------------
4bc2 : __ __ __ BYT 6f 4e 20 00                                     : oN .
--------------------------------------------------------------------
4bc6 : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
4bca : __ __ __ BYT 6d 4f 56 45 20 42 59 20 77 2c 61 2c 73 2c 64 20 : mOVE BY w,a,s,d 
4bda : __ __ __ BYT 4f 52 20 43 55 52 53 4f 52 20 4b 45 59 53 2e 20 : OR CURSOR KEYS. 
4bea : __ __ __ BYT 65 73 63 20 4f 52 20 73 74 6f 70 20 54 4f 20 45 : esc OR stop TO E
4bfa : __ __ __ BYT 58 49 54 2e 00                                  : XIT..
--------------------------------------------------------------------
giocharmap:
4bff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
4c00 : __ __ __ BYT 70 45 54 53 43 49 49 20 41 52 54 20 43 52 45 44 : pETSCII ART CRED
4c10 : __ __ __ BYT 49 54 3a 20 27 6c 4f 56 45 20 49 53 20 54 48 45 : IT: 'lOVE IS THE
4c20 : __ __ __ BYT 20 44 52 55 47 27 20 61 54 4c 41 4e 54 49 53 2c :  DRUG' aTLANTIS,
4c30 : __ __ __ BYT 20 32 30 32 33 2c 20 61 52 54 20 42 59 20 6c 4f :  2023, aRT BY lO
4c40 : __ __ __ BYT 42 4f 2e 00                                     : BO..
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
4c44 : a9 b5 __ LDA #$b5
4c46 : 85 0d __ STA P0 
4c48 : a9 be __ LDA #$be
4c4a : 85 0e __ STA P1 
4c4c : ad 36 bf LDA $bf36 ; (viewport + 11)
4c4f : 85 0f __ STA P2 
4c51 : ad 37 bf LDA $bf37 ; (viewport + 12)
4c54 : 85 10 __ STA P3 
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
4c56 : a9 00 __ LDA #$00
4c58 : a0 04 __ LDY #$04
4c5a : 91 0d __ STA (P0),y ; (win + 0)
4c5c : c8 __ __ INY
4c5d : 91 0d __ STA (P0),y ; (win + 0)
4c5f : a5 0f __ LDA P2 ; (sx + 0)
4c61 : a0 00 __ LDY #$00
4c63 : 91 0d __ STA (P0),y ; (win + 0)
4c65 : a5 10 __ LDA P3 ; (sy + 0)
4c67 : c8 __ __ INY
4c68 : 91 0d __ STA (P0),y ; (win + 0)
4c6a : a5 11 __ LDA P4 ; (wx + 0)
4c6c : c8 __ __ INY
4c6d : 91 0d __ STA (P0),y ; (win + 0)
4c6f : a5 12 __ LDA P5 ; (wy + 0)
4c71 : c8 __ __ INY
4c72 : 91 0d __ STA (P0),y ; (win + 0)
4c74 : 06 10 __ ASL P3 ; (sy + 0)
4c76 : a6 10 __ LDX P3 ; (sy + 0)
4c78 : bd 64 55 LDA $5564,x ; (multab + 0)
4c7b : 18 __ __ CLC
4c7c : 65 0f __ ADC P2 ; (sx + 0)
4c7e : 85 1b __ STA ACCU + 0 
4c80 : bd 65 55 LDA $5565,x ; (multab + 1)
4c83 : 69 00 __ ADC #$00
4c85 : a8 __ __ TAY
4c86 : ad 53 55 LDA $5553 ; (vdc_state + 8)
4c89 : 18 __ __ CLC
4c8a : 65 1b __ ADC ACCU + 0 
4c8c : 85 1b __ STA ACCU + 0 
4c8e : 98 __ __ TYA
4c8f : 6d 54 55 ADC $5554 ; (vdc_state + 9)
4c92 : a0 07 __ LDY #$07
4c94 : 91 0d __ STA (P0),y ; (win + 0)
4c96 : a5 1b __ LDA ACCU + 0 
4c98 : 88 __ __ DEY
4c99 : 91 0d __ STA (P0),y ; (win + 0)
4c9b : bd 64 55 LDA $5564,x ; (multab + 0)
4c9e : 18 __ __ CLC
4c9f : 65 0f __ ADC P2 ; (sx + 0)
4ca1 : 85 1b __ STA ACCU + 0 
4ca3 : bd 65 55 LDA $5565,x ; (multab + 1)
4ca6 : 69 00 __ ADC #$00
4ca8 : aa __ __ TAX
4ca9 : ad 55 55 LDA $5555 ; (vdc_state + 10)
4cac : 18 __ __ CLC
4cad : 65 1b __ ADC ACCU + 0 
4caf : 85 1b __ STA ACCU + 0 
4cb1 : 8a __ __ TXA
4cb2 : 6d 56 55 ADC $5556 ; (vdc_state + 11)
4cb5 : a0 09 __ LDY #$09
4cb7 : 91 0d __ STA (P0),y ; (win + 0)
4cb9 : a5 1b __ LDA ACCU + 0 
4cbb : 88 __ __ DEY
4cbc : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
4cbe : 60 __ __ RTS
--------------------------------------------------------------------
generateSentence: ; generateSentence(u8*)->void
.s1000:
4cbf : 38 __ __ SEC
4cc0 : a5 23 __ LDA SP + 0 
4cc2 : e9 0e __ SBC #$0e
4cc4 : 85 23 __ STA SP + 0 
4cc6 : b0 02 __ BCS $4cca ; (generateSentence.s0 + 0)
4cc8 : c6 24 __ DEC SP + 1 
.s0:
4cca : a9 74 __ LDA #$74
4ccc : 8d dc bf STA $bfdc ; (buff + 30)
4ccf : a9 48 __ LDA #$48
4cd1 : 8d dd bf STA $bfdd ; (buff + 31)
4cd4 : a9 45 __ LDA #$45
4cd6 : 8d de bf STA $bfde ; (buff + 32)
4cd9 : a9 00 __ LDA #$00
4cdb : 8d df bf STA $bfdf ; (buff + 33)
4cde : 8d e1 bf STA $bfe1 ; (buff + 35)
4ce1 : 8d e2 bf STA $bfe2 ; (buff + 36)
4ce4 : 8d e3 bf STA $bfe3 ; (buff + 37)
4ce7 : a9 61 __ LDA #$61
4ce9 : 8d e0 bf STA $bfe0 ; (buff + 34)
4cec : a2 4b __ LDX #$4b
.l1002:
4cee : bd ff 54 LDA $54ff,x 
4cf1 : 9d 90 bf STA $bf90,x ; (verbs + 29)
4cf4 : ca __ __ DEX
4cf5 : d0 f7 __ BNE $4cee ; (generateSentence.l1002 + 0)
.s1003:
4cf7 : a2 1e __ LDX #$1e
.l1004:
4cf9 : bd cf 53 LDA $53cf,x ; (seed + 1)
4cfc : 9d 72 bf STA $bf72,x ; (adjectives + 29)
4cff : ca __ __ DEX
4d00 : d0 f7 __ BNE $4cf9 ; (generateSentence.l1004 + 0)
.s1005:
4d02 : a0 1e __ LDY #$1e
.l1006:
4d04 : b9 d7 54 LDA $54d7,y ; (vdc_modes + 215)
4d07 : 99 54 bf STA $bf54,y ; (window + 9)
4d0a : 88 __ __ DEY
4d0b : d0 f7 __ BNE $4d04 ; (generateSentence.l1006 + 0)
.s1007:
4d0d : 84 04 __ STY WORK + 1 
4d0f : ad cf 53 LDA $53cf ; (seed + 1)
4d12 : 4a __ __ LSR
4d13 : ad ce 53 LDA $53ce ; (seed + 0)
4d16 : 6a __ __ ROR
4d17 : aa __ __ TAX
4d18 : 98 __ __ TYA
4d19 : 6a __ __ ROR
4d1a : 4d ce 53 EOR $53ce ; (seed + 0)
4d1d : 85 43 __ STA T0 + 0 
4d1f : 8a __ __ TXA
4d20 : 4d cf 53 EOR $53cf ; (seed + 1)
4d23 : 85 44 __ STA T0 + 1 
4d25 : 4a __ __ LSR
4d26 : 45 43 __ EOR T0 + 0 
4d28 : 85 43 __ STA T0 + 0 
4d2a : 45 44 __ EOR T0 + 1 
4d2c : 85 44 __ STA T0 + 1 
4d2e : 4a __ __ LSR
4d2f : a5 43 __ LDA T0 + 0 
4d31 : 6a __ __ ROR
4d32 : aa __ __ TAX
4d33 : 98 __ __ TYA
4d34 : 6a __ __ ROR
4d35 : 45 43 __ EOR T0 + 0 
4d37 : 85 45 __ STA T1 + 0 
4d39 : 8a __ __ TXA
4d3a : 45 44 __ EOR T0 + 1 
4d3c : 85 46 __ STA T1 + 1 
4d3e : 4a __ __ LSR
4d3f : 45 45 __ EOR T1 + 0 
4d41 : 85 45 __ STA T1 + 0 
4d43 : 45 46 __ EOR T1 + 1 
4d45 : 85 46 __ STA T1 + 1 
4d47 : 4a __ __ LSR
4d48 : a5 45 __ LDA T1 + 0 
4d4a : 6a __ __ ROR
4d4b : aa __ __ TAX
4d4c : 98 __ __ TYA
4d4d : 6a __ __ ROR
4d4e : 45 45 __ EOR T1 + 0 
4d50 : 85 47 __ STA T2 + 0 
4d52 : 8a __ __ TXA
4d53 : 45 46 __ EOR T1 + 1 
4d55 : 85 48 __ STA T2 + 1 
4d57 : 4a __ __ LSR
4d58 : 45 47 __ EOR T2 + 0 
4d5a : 85 47 __ STA T2 + 0 
4d5c : 45 48 __ EOR T2 + 1 
4d5e : 85 48 __ STA T2 + 1 
4d60 : 4a __ __ LSR
4d61 : a5 47 __ LDA T2 + 0 
4d63 : 6a __ __ ROR
4d64 : aa __ __ TAX
4d65 : 98 __ __ TYA
4d66 : 6a __ __ ROR
4d67 : 45 47 __ EOR T2 + 0 
4d69 : 85 49 __ STA T3 + 0 
4d6b : 8a __ __ TXA
4d6c : 45 48 __ EOR T2 + 1 
4d6e : 85 4a __ STA T3 + 1 
4d70 : 4a __ __ LSR
4d71 : 45 49 __ EOR T3 + 0 
4d73 : 8d ce 53 STA $53ce ; (seed + 0)
4d76 : 85 1b __ STA ACCU + 0 
4d78 : 45 4a __ EOR T3 + 1 
4d7a : 8d cf 53 STA $53cf ; (seed + 1)
4d7d : 85 1c __ STA ACCU + 1 
4d7f : 98 __ __ TYA
4d80 : 91 16 __ STA (P9),y ; (sentence + 0)
4d82 : a5 16 __ LDA P9 ; (sentence + 0)
4d84 : a0 02 __ LDY #$02
4d86 : 91 23 __ STA (SP + 0),y 
4d88 : a5 17 __ LDA P10 ; (sentence + 1)
4d8a : c8 __ __ INY
4d8b : 91 23 __ STA (SP + 0),y 
4d8d : a9 1c __ LDA #$1c
4d8f : c8 __ __ INY
4d90 : 91 23 __ STA (SP + 0),y 
4d92 : a9 4e __ LDA #$4e
4d94 : c8 __ __ INY
4d95 : 84 03 __ STY WORK + 0 
4d97 : 91 23 __ STA (SP + 0),y 
4d99 : a5 43 __ LDA T0 + 0 
4d9b : 29 01 __ AND #$01
4d9d : 0a __ __ ASL
4d9e : 0a __ __ ASL
4d9f : 69 dc __ ADC #$dc
4da1 : c8 __ __ INY
4da2 : 91 23 __ STA (SP + 0),y 
4da4 : a9 bf __ LDA #$bf
4da6 : 69 00 __ ADC #$00
4da8 : c8 __ __ INY
4da9 : 91 23 __ STA (SP + 0),y 
4dab : 20 84 52 JSR $5284 ; (divmod + 0)
4dae : a6 05 __ LDX WORK + 2 
4db0 : bd a5 53 LDA $53a5,x ; (__multab6L + 0)
4db3 : 18 __ __ CLC
4db4 : 69 55 __ ADC #$55
4db6 : a0 08 __ LDY #$08
4db8 : 91 23 __ STA (SP + 0),y 
4dba : a9 bf __ LDA #$bf
4dbc : 69 00 __ ADC #$00
4dbe : c8 __ __ INY
4dbf : 91 23 __ STA (SP + 0),y 
4dc1 : a5 45 __ LDA T1 + 0 
4dc3 : 85 1b __ STA ACCU + 0 
4dc5 : a5 46 __ LDA T1 + 1 
4dc7 : 85 1c __ STA ACCU + 1 
4dc9 : a9 05 __ LDA #$05
4dcb : 85 03 __ STA WORK + 0 
4dcd : a9 00 __ LDA #$00
4dcf : 85 04 __ STA WORK + 1 
4dd1 : 20 84 52 JSR $5284 ; (divmod + 0)
4dd4 : a6 05 __ LDX WORK + 2 
4dd6 : bd aa 53 LDA $53aa,x ; (__multab15L + 0)
4dd9 : 18 __ __ CLC
4dda : 69 91 __ ADC #$91
4ddc : a0 0a __ LDY #$0a
4dde : 91 23 __ STA (SP + 0),y 
4de0 : a9 bf __ LDA #$bf
4de2 : 69 00 __ ADC #$00
4de4 : c8 __ __ INY
4de5 : 91 23 __ STA (SP + 0),y 
4de7 : a5 47 __ LDA T2 + 0 
4de9 : 85 1b __ STA ACCU + 0 
4deb : a5 48 __ LDA T2 + 1 
4ded : 85 1c __ STA ACCU + 1 
4def : a9 05 __ LDA #$05
4df1 : 85 03 __ STA WORK + 0 
4df3 : a9 00 __ LDA #$00
4df5 : 85 04 __ STA WORK + 1 
4df7 : 20 84 52 JSR $5284 ; (divmod + 0)
4dfa : a6 05 __ LDX WORK + 2 
4dfc : bd a5 53 LDA $53a5,x ; (__multab6L + 0)
4dff : 18 __ __ CLC
4e00 : 69 73 __ ADC #$73
4e02 : a0 0c __ LDY #$0c
4e04 : 91 23 __ STA (SP + 0),y 
4e06 : a9 bf __ LDA #$bf
4e08 : 69 00 __ ADC #$00
4e0a : c8 __ __ INY
4e0b : 91 23 __ STA (SP + 0),y 
4e0d : 20 b0 47 JSR $47b0 ; (sprintf.s1000 + 0)
.s1001:
4e10 : 18 __ __ CLC
4e11 : a5 23 __ LDA SP + 0 
4e13 : 69 0e __ ADC #$0e
4e15 : 85 23 __ STA SP + 0 
4e17 : 90 02 __ BCC $4e1b ; (generateSentence.s1001 + 11)
4e19 : e6 24 __ INC SP + 1 
4e1b : 60 __ __ RTS
--------------------------------------------------------------------
4e1c : __ __ __ BYT 25 53 20 25 53 20 25 53 20 25 53 2e 00          : %S %S %S %S..
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
4e29 : a5 53 __ LDA T0 + 0 
4e2b : 8d fb bf STA $bffb ; (buffer + 11)
4e2e : a5 54 __ LDA T0 + 1 
4e30 : 8d fc bf STA $bffc ; (buffer + 12)
4e33 : 38 __ __ SEC
4e34 : a5 23 __ LDA SP + 0 
4e36 : e9 06 __ SBC #$06
4e38 : 85 23 __ STA SP + 0 
4e3a : b0 02 __ BCS $4e3e ; (vdcwin_printline.s0 + 0)
4e3c : c6 24 __ DEC SP + 1 
.s0:
4e3e : a0 08 __ LDY #$08
4e40 : b1 23 __ LDA (SP + 0),y 
4e42 : 85 53 __ STA T0 + 0 
4e44 : a0 02 __ LDY #$02
4e46 : 91 23 __ STA (SP + 0),y 
4e48 : a0 09 __ LDY #$09
4e4a : b1 23 __ LDA (SP + 0),y 
4e4c : 85 54 __ STA T0 + 1 
4e4e : a0 03 __ LDY #$03
4e50 : 91 23 __ STA (SP + 0),y 
4e52 : a0 0a __ LDY #$0a
4e54 : b1 23 __ LDA (SP + 0),y 
4e56 : a0 04 __ LDY #$04
4e58 : 91 23 __ STA (SP + 0),y 
4e5a : a0 0b __ LDY #$0b
4e5c : b1 23 __ LDA (SP + 0),y 
4e5e : a0 05 __ LDY #$05
4e60 : 91 23 __ STA (SP + 0),y 
4e62 : 20 02 51 JSR $5102 ; (vdcwin_put_string.s1000 + 0)
4e65 : a9 00 __ LDA #$00
4e67 : a0 04 __ LDY #$04
4e69 : 91 53 __ STA (T0 + 0),y 
4e6b : 88 __ __ DEY
4e6c : b1 53 __ LDA (T0 + 0),y 
4e6e : 38 __ __ SEC
4e6f : e9 01 __ SBC #$01
4e71 : 85 43 __ STA T1 + 0 
4e73 : a0 05 __ LDY #$05
4e75 : b1 53 __ LDA (T0 + 0),y 
4e77 : 90 0b __ BCC $4e84 ; (vdcwin_printline.s2 + 0)
.s1058:
4e79 : aa __ __ TAX
4e7a : e4 43 __ CPX T1 + 0 
4e7c : b0 06 __ BCS $4e84 ; (vdcwin_printline.s2 + 0)
.s1:
4e7e : e8 __ __ INX
4e7f : 8a __ __ TXA
4e80 : 91 53 __ STA (T0 + 0),y 
4e82 : 90 62 __ BCC $4ee6 ; (vdcwin_printline.s1001 + 0)
.s2:
4e84 : ad 4e 55 LDA $554e ; (vdc_state + 3)
4e87 : 85 43 __ STA T1 + 0 
4e89 : ad 4f 55 LDA $554f ; (vdc_state + 4)
4e8c : 85 44 __ STA T1 + 1 
4e8e : a0 02 __ LDY #$02
4e90 : b1 53 __ LDA (T0 + 0),y 
4e92 : 85 48 __ STA T4 + 0 
4e94 : a0 06 __ LDY #$06
4e96 : b1 53 __ LDA (T0 + 0),y 
4e98 : 85 46 __ STA T3 + 0 
4e9a : c8 __ __ INY
4e9b : b1 53 __ LDA (T0 + 0),y 
4e9d : 85 47 __ STA T3 + 1 
4e9f : c8 __ __ INY
4ea0 : b1 53 __ LDA (T0 + 0),y 
4ea2 : 85 49 __ STA T5 + 0 
4ea4 : c8 __ __ INY
4ea5 : b1 53 __ LDA (T0 + 0),y 
4ea7 : a2 00 __ LDX #$00
.l5:
4ea9 : 85 4a __ STA T5 + 1 
4eab : a0 03 __ LDY #$03
4ead : b1 53 __ LDA (T0 + 0),y 
4eaf : 85 4c __ STA T7 + 0 
4eb1 : 38 __ __ SEC
4eb2 : e9 01 __ SBC #$01
4eb4 : b0 03 __ BCS $4eb9 ; (vdcwin_printline.s1056 + 0)
4eb6 : 4c e2 4f JMP $4fe2 ; (vdcwin_printline.s6 + 0)
.s1056:
4eb9 : 85 4e __ STA T8 + 0 
4ebb : e4 4e __ CPX T8 + 0 
4ebd : b0 03 __ BCS $4ec2 ; (vdcwin_printline.s4 + 0)
4ebf : 4c e2 4f JMP $4fe2 ; (vdcwin_printline.s6 + 0)
.s4:
4ec2 : a0 01 __ LDY #$01
4ec4 : b1 53 __ LDA (T0 + 0),y 
4ec6 : 18 __ __ CLC
4ec7 : 65 4c __ ADC T7 + 0 
4ec9 : 38 __ __ SEC
4eca : e9 01 __ SBC #$01
4ecc : 85 45 __ STA T2 + 0 
4ece : aa __ __ TAX
4ecf : 88 __ __ DEY
4ed0 : b1 53 __ LDA (T0 + 0),y 
4ed2 : 85 48 __ STA T4 + 0 
4ed4 : a0 02 __ LDY #$02
4ed6 : b1 53 __ LDA (T0 + 0),y 
4ed8 : 85 4b __ STA T6 + 0 
.l185:
4eda : 8a __ __ TXA
4edb : 18 __ __ CLC
4edc : 69 01 __ ADC #$01
4ede : b0 1c __ BCS $4efc ; (vdcwin_printline.s186 + 0)
.s1026:
4ee0 : c5 45 __ CMP T2 + 0 
4ee2 : 90 02 __ BCC $4ee6 ; (vdcwin_printline.s1001 + 0)
.s1063:
4ee4 : d0 16 __ BNE $4efc ; (vdcwin_printline.s186 + 0)
.s1001:
4ee6 : 18 __ __ CLC
4ee7 : a5 23 __ LDA SP + 0 
4ee9 : 69 06 __ ADC #$06
4eeb : 85 23 __ STA SP + 0 
4eed : 90 02 __ BCC $4ef1 ; (vdcwin_printline.s1001 + 11)
4eef : e6 24 __ INC SP + 1 
4ef1 : ad fb bf LDA $bffb ; (buffer + 11)
4ef4 : 85 53 __ STA T0 + 0 
4ef6 : ad fc bf LDA $bffc ; (buffer + 12)
4ef9 : 85 54 __ STA T0 + 1 
4efb : 60 __ __ RTS
.s186:
4efc : ad 52 55 LDA $5552 ; (vdc_state + 7)
4eff : 85 52 __ STA T11 + 0 
4f01 : a5 45 __ LDA T2 + 0 
4f03 : 0a __ __ ASL
4f04 : a8 __ __ TAY
4f05 : a9 12 __ LDA #$12
4f07 : 8d 00 d6 STA $d600 
4f0a : a5 4b __ LDA T6 + 0 
4f0c : 38 __ __ SEC
4f0d : e9 01 __ SBC #$01
4f0f : 85 49 __ STA T5 + 0 
4f11 : 18 __ __ CLC
4f12 : a5 48 __ LDA T4 + 0 
4f14 : 79 64 55 ADC $5564,y ; (multab + 0)
4f17 : 85 53 __ STA T0 + 0 
4f19 : a9 00 __ LDA #$00
4f1b : 79 65 55 ADC $5565,y ; (multab + 1)
4f1e : 85 54 __ STA T0 + 1 
4f20 : 18 __ __ CLC
4f21 : a5 53 __ LDA T0 + 0 
4f23 : 6d 53 55 ADC $5553 ; (vdc_state + 8)
4f26 : a8 __ __ TAY
4f27 : a5 54 __ LDA T0 + 1 
4f29 : 6d 54 55 ADC $5554 ; (vdc_state + 9)
.l917:
4f2c : 2c 00 d6 BIT $d600 
4f2f : 10 fb __ BPL $4f2c ; (vdcwin_printline.l917 + 0)
.s198:
4f31 : 8d 01 d6 STA $d601 
4f34 : a9 13 __ LDA #$13
4f36 : 8d 00 d6 STA $d600 
.l919:
4f39 : 2c 00 d6 BIT $d600 
4f3c : 10 fb __ BPL $4f39 ; (vdcwin_printline.l919 + 0)
.s203:
4f3e : 8c 01 d6 STY $d601 
4f41 : a9 1f __ LDA #$1f
4f43 : 8d 00 d6 STA $d600 
.l921:
4f46 : 2c 00 d6 BIT $d600 
4f49 : 10 fb __ BPL $4f46 ; (vdcwin_printline.l921 + 0)
.s207:
4f4b : a9 20 __ LDA #$20
4f4d : 8d 01 d6 STA $d601 
4f50 : a9 18 __ LDA #$18
4f52 : 8d 00 d6 STA $d600 
.l923:
4f55 : 2c 00 d6 BIT $d600 
4f58 : 10 fb __ BPL $4f55 ; (vdcwin_printline.l923 + 0)
.s213:
4f5a : ad 01 d6 LDA $d601 
4f5d : 29 7f __ AND #$7f
4f5f : a8 __ __ TAY
4f60 : a9 18 __ LDA #$18
4f62 : 8d 00 d6 STA $d600 
.l925:
4f65 : 2c 00 d6 BIT $d600 
4f68 : 10 fb __ BPL $4f65 ; (vdcwin_printline.l925 + 0)
.s219:
4f6a : 8c 01 d6 STY $d601 
4f6d : a9 1e __ LDA #$1e
4f6f : 8d 00 d6 STA $d600 
.l927:
4f72 : 2c 00 d6 BIT $d600 
4f75 : 10 fb __ BPL $4f72 ; (vdcwin_printline.l927 + 0)
.s224:
4f77 : a5 49 __ LDA T5 + 0 
4f79 : 8d 01 d6 STA $d601 
4f7c : ad 55 55 LDA $5555 ; (vdc_state + 10)
4f7f : 18 __ __ CLC
4f80 : 65 53 __ ADC T0 + 0 
4f82 : a8 __ __ TAY
4f83 : a9 12 __ LDA #$12
4f85 : 8d 00 d6 STA $d600 
4f88 : ad 56 55 LDA $5556 ; (vdc_state + 11)
4f8b : 65 54 __ ADC T0 + 1 
.l929:
4f8d : 2c 00 d6 BIT $d600 
4f90 : 10 fb __ BPL $4f8d ; (vdcwin_printline.l929 + 0)
.s231:
4f92 : 8d 01 d6 STA $d601 
4f95 : a9 13 __ LDA #$13
4f97 : 8d 00 d6 STA $d600 
.l931:
4f9a : 2c 00 d6 BIT $d600 
4f9d : 10 fb __ BPL $4f9a ; (vdcwin_printline.l931 + 0)
.s236:
4f9f : 8c 01 d6 STY $d601 
4fa2 : a9 1f __ LDA #$1f
4fa4 : 8d 00 d6 STA $d600 
.l933:
4fa7 : 2c 00 d6 BIT $d600 
4faa : 10 fb __ BPL $4fa7 ; (vdcwin_printline.l933 + 0)
.s240:
4fac : a5 52 __ LDA T11 + 0 
4fae : 8d 01 d6 STA $d601 
4fb1 : a9 18 __ LDA #$18
4fb3 : 8d 00 d6 STA $d600 
.l935:
4fb6 : 2c 00 d6 BIT $d600 
4fb9 : 10 fb __ BPL $4fb6 ; (vdcwin_printline.l935 + 0)
.s246:
4fbb : ad 01 d6 LDA $d601 
4fbe : 29 7f __ AND #$7f
4fc0 : a8 __ __ TAY
4fc1 : a9 18 __ LDA #$18
4fc3 : 8d 00 d6 STA $d600 
.l937:
4fc6 : 2c 00 d6 BIT $d600 
4fc9 : 10 fb __ BPL $4fc6 ; (vdcwin_printline.l937 + 0)
.s252:
4fcb : 8c 01 d6 STY $d601 
4fce : a9 1e __ LDA #$1e
4fd0 : 8d 00 d6 STA $d600 
.l939:
4fd3 : 2c 00 d6 BIT $d600 
4fd6 : 10 fb __ BPL $4fd3 ; (vdcwin_printline.l939 + 0)
.s257:
4fd8 : a5 49 __ LDA T5 + 0 
4fda : 8d 01 d6 STA $d601 
4fdd : e6 45 __ INC T2 + 0 
4fdf : 4c da 4e JMP $4eda ; (vdcwin_printline.l185 + 0)
.s6:
4fe2 : a9 12 __ LDA #$12
4fe4 : 8d 00 d6 STA $d600 
4fe7 : a5 49 __ LDA T5 + 0 
4fe9 : 65 43 __ ADC T1 + 0 
4feb : a8 __ __ TAY
4fec : a5 4a __ LDA T5 + 1 
4fee : 65 44 __ ADC T1 + 1 
4ff0 : 85 4d __ STA T7 + 1 
4ff2 : 18 __ __ CLC
4ff3 : a5 46 __ LDA T3 + 0 
4ff5 : 65 43 __ ADC T1 + 0 
4ff7 : 85 50 __ STA T9 + 0 
4ff9 : a5 47 __ LDA T3 + 1 
4ffb : 65 44 __ ADC T1 + 1 
4ffd : 85 51 __ STA T9 + 1 
.l888:
4fff : 2c 00 d6 BIT $d600 
5002 : 10 fb __ BPL $4fff ; (vdcwin_printline.l888 + 0)
.s62:
5004 : a5 47 __ LDA T3 + 1 
5006 : 8d 01 d6 STA $d601 
5009 : a9 13 __ LDA #$13
500b : 8d 00 d6 STA $d600 
.l890:
500e : 2c 00 d6 BIT $d600 
5011 : 10 fb __ BPL $500e ; (vdcwin_printline.l890 + 0)
.s67:
5013 : a5 46 __ LDA T3 + 0 
5015 : 8d 01 d6 STA $d601 
5018 : a9 1f __ LDA #$1f
501a : 8d 00 d6 STA $d600 
501d : a9 18 __ LDA #$18
501f : 8d 00 d6 STA $d600 
.l892:
5022 : 2c 00 d6 BIT $d600 
5025 : 10 fb __ BPL $5022 ; (vdcwin_printline.l892 + 0)
.s74:
5027 : ad 01 d6 LDA $d601 
502a : 09 80 __ ORA #$80
502c : 85 1b __ STA ACCU + 0 
502e : a9 18 __ LDA #$18
5030 : 8d 00 d6 STA $d600 
.l894:
5033 : 2c 00 d6 BIT $d600 
5036 : 10 fb __ BPL $5033 ; (vdcwin_printline.l894 + 0)
.s80:
5038 : a5 1b __ LDA ACCU + 0 
503a : 8d 01 d6 STA $d601 
503d : a9 20 __ LDA #$20
503f : 8d 00 d6 STA $d600 
.l896:
5042 : 2c 00 d6 BIT $d600 
5045 : 10 fb __ BPL $5042 ; (vdcwin_printline.l896 + 0)
.s85:
5047 : a5 51 __ LDA T9 + 1 
5049 : 8d 01 d6 STA $d601 
504c : a9 21 __ LDA #$21
504e : 8d 00 d6 STA $d600 
.l898:
5051 : 2c 00 d6 BIT $d600 
5054 : 10 fb __ BPL $5051 ; (vdcwin_printline.l898 + 0)
.s90:
5056 : a5 50 __ LDA T9 + 0 
5058 : 8d 01 d6 STA $d601 
505b : a9 1f __ LDA #$1f
505d : 8d 00 d6 STA $d600 
5060 : a9 1e __ LDA #$1e
5062 : 8d 00 d6 STA $d600 
.l900:
5065 : 2c 00 d6 BIT $d600 
5068 : 10 fb __ BPL $5065 ; (vdcwin_printline.l900 + 0)
.s96:
506a : a5 48 __ LDA T4 + 0 
506c : 8d 01 d6 STA $d601 
506f : a9 12 __ LDA #$12
5071 : 8d 00 d6 STA $d600 
.l902:
5074 : 2c 00 d6 BIT $d600 
5077 : 10 fb __ BPL $5074 ; (vdcwin_printline.l902 + 0)
.s149:
5079 : a5 4a __ LDA T5 + 1 
507b : 8d 01 d6 STA $d601 
507e : a9 13 __ LDA #$13
5080 : 8d 00 d6 STA $d600 
.l904:
5083 : 2c 00 d6 BIT $d600 
5086 : 10 fb __ BPL $5083 ; (vdcwin_printline.l904 + 0)
.s154:
5088 : a5 49 __ LDA T5 + 0 
508a : 8d 01 d6 STA $d601 
508d : a9 1f __ LDA #$1f
508f : 8d 00 d6 STA $d600 
5092 : a9 18 __ LDA #$18
5094 : 8d 00 d6 STA $d600 
.l906:
5097 : 2c 00 d6 BIT $d600 
509a : 10 fb __ BPL $5097 ; (vdcwin_printline.l906 + 0)
.s161:
509c : ad 01 d6 LDA $d601 
509f : 09 80 __ ORA #$80
50a1 : 85 50 __ STA T9 + 0 
50a3 : a9 18 __ LDA #$18
50a5 : 8d 00 d6 STA $d600 
.l908:
50a8 : 2c 00 d6 BIT $d600 
50ab : 10 fb __ BPL $50a8 ; (vdcwin_printline.l908 + 0)
.s167:
50ad : a5 50 __ LDA T9 + 0 
50af : 8d 01 d6 STA $d601 
50b2 : a9 20 __ LDA #$20
50b4 : 8d 00 d6 STA $d600 
.l910:
50b7 : 2c 00 d6 BIT $d600 
50ba : 10 fb __ BPL $50b7 ; (vdcwin_printline.l910 + 0)
.s172:
50bc : a5 4d __ LDA T7 + 1 
50be : 8d 01 d6 STA $d601 
50c1 : a9 21 __ LDA #$21
50c3 : 8d 00 d6 STA $d600 
.l912:
50c6 : 2c 00 d6 BIT $d600 
50c9 : 10 fb __ BPL $50c6 ; (vdcwin_printline.l912 + 0)
.s177:
50cb : 8c 01 d6 STY $d601 
50ce : a9 1f __ LDA #$1f
50d0 : 8d 00 d6 STA $d600 
50d3 : a9 1e __ LDA #$1e
50d5 : 8d 00 d6 STA $d600 
.l914:
50d8 : 2c 00 d6 BIT $d600 
50db : 10 fb __ BPL $50d8 ; (vdcwin_printline.l914 + 0)
.s183:
50dd : a5 48 __ LDA T4 + 0 
50df : 8d 01 d6 STA $d601 
50e2 : ad 4e 55 LDA $554e ; (vdc_state + 3)
50e5 : 18 __ __ CLC
50e6 : 65 46 __ ADC T3 + 0 
50e8 : 85 46 __ STA T3 + 0 
50ea : ad 4f 55 LDA $554f ; (vdc_state + 4)
50ed : 65 47 __ ADC T3 + 1 
50ef : 85 47 __ STA T3 + 1 
50f1 : 18 __ __ CLC
50f2 : a5 49 __ LDA T5 + 0 
50f4 : 6d 4e 55 ADC $554e ; (vdc_state + 3)
50f7 : 85 49 __ STA T5 + 0 
50f9 : a5 4a __ LDA T5 + 1 
50fb : 6d 4f 55 ADC $554f ; (vdc_state + 4)
50fe : e8 __ __ INX
50ff : 4c a9 4e JMP $4ea9 ; (vdcwin_printline.l5 + 0)
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->void
.s1000:
5102 : 38 __ __ SEC
5103 : a5 23 __ LDA SP + 0 
5105 : e9 0a __ SBC #$0a
5107 : 85 23 __ STA SP + 0 
5109 : b0 02 __ BCS $510d ; (vdcwin_put_string.s0 + 0)
510b : c6 24 __ DEC SP + 1 
.s0:
510d : a9 00 __ LDA #$00
510f : 85 43 __ STA T0 + 0 
5111 : a0 0c __ LDY #$0c
5113 : b1 23 __ LDA (SP + 0),y 
5115 : 85 44 __ STA T1 + 0 
5117 : c8 __ __ INY
5118 : b1 23 __ LDA (SP + 0),y 
511a : 85 45 __ STA T1 + 1 
511c : a0 04 __ LDY #$04
511e : b1 44 __ LDA (T1 + 0),y 
5120 : 85 46 __ STA T2 + 0 
5122 : c8 __ __ INY
5123 : b1 44 __ LDA (T1 + 0),y 
5125 : 85 47 __ STA T3 + 0 
5127 : a0 0e __ LDY #$0e
5129 : b1 23 __ LDA (SP + 0),y 
512b : 85 48 __ STA T4 + 0 
512d : c8 __ __ INY
512e : b1 23 __ LDA (SP + 0),y 
5130 : 85 49 __ STA T4 + 1 
.l2:
5132 : a4 43 __ LDY T0 + 0 
5134 : b1 48 __ LDA (T4 + 0),y 
5136 : d0 4f __ BNE $5187 ; (vdcwin_put_string.s3 + 0)
.s4:
5138 : a0 04 __ LDY #$04
513a : b1 44 __ LDA (T1 + 0),y 
513c : 18 __ __ CLC
513d : 65 43 __ ADC T0 + 0 
513f : 91 44 __ STA (T1 + 0),y 
5141 : a0 02 __ LDY #$02
5143 : d1 44 __ CMP (T1 + 0),y 
5145 : 90 34 __ BCC $517b ; (vdcwin_put_string.s1001 + 0)
.s43:
5147 : a9 00 __ LDA #$00
5149 : a0 04 __ LDY #$04
514b : 91 44 __ STA (T1 + 0),y 
514d : c8 __ __ INY
514e : b1 44 __ LDA (T1 + 0),y 
5150 : 85 43 __ STA T0 + 0 
5152 : 18 __ __ CLC
5153 : 69 01 __ ADC #$01
5155 : 91 44 __ STA (T1 + 0),y 
5157 : a0 03 __ LDY #$03
5159 : d1 44 __ CMP (T1 + 0),y 
515b : d0 1e __ BNE $517b ; (vdcwin_put_string.s1001 + 0)
.s46:
515d : a5 43 __ LDA T0 + 0 
515f : a0 05 __ LDY #$05
5161 : 91 44 __ STA (T1 + 0),y 
5163 : a5 44 __ LDA T1 + 0 
5165 : a0 02 __ LDY #$02
5167 : 91 23 __ STA (SP + 0),y 
5169 : a5 45 __ LDA T1 + 1 
516b : c8 __ __ INY
516c : 91 23 __ STA (SP + 0),y 
516e : a9 fe __ LDA #$fe
5170 : c8 __ __ INY
5171 : 91 23 __ STA (SP + 0),y 
5173 : a9 4a __ LDA #$4a
5175 : c8 __ __ INY
5176 : 91 23 __ STA (SP + 0),y 
5178 : 20 29 4e JSR $4e29 ; (vdcwin_printline.s1000 + 0)
.s1001:
517b : 18 __ __ CLC
517c : a5 23 __ LDA SP + 0 
517e : 69 0a __ ADC #$0a
5180 : 85 23 __ STA SP + 0 
5182 : 90 02 __ BCC $5186 ; (vdcwin_put_string.s1001 + 11)
5184 : e6 24 __ INC SP + 1 
5186 : 60 __ __ RTS
.s3:
5187 : 4a __ __ LSR
5188 : 4a __ __ LSR
5189 : 4a __ __ LSR
518a : 4a __ __ LSR
518b : 4a __ __ LSR
518c : aa __ __ TAX
518d : bd ee 53 LDA $53ee,x ; (p2smap + 0)
5190 : 51 48 __ EOR (T4 + 0),y 
5192 : 85 4e __ STA T7 + 0 
5194 : a5 47 __ LDA T3 + 0 
5196 : 18 __ __ CLC
5197 : a0 01 __ LDY #$01
5199 : 71 44 __ ADC (T1 + 0),y 
519b : 0a __ __ ASL
519c : aa __ __ TAX
519d : 18 __ __ CLC
519e : 88 __ __ DEY
519f : b1 44 __ LDA (T1 + 0),y 
51a1 : 65 46 __ ADC T2 + 0 
51a3 : 18 __ __ CLC
51a4 : 65 43 __ ADC T0 + 0 
51a6 : 18 __ __ CLC
51a7 : 7d 64 55 ADC $5564,x ; (multab + 0)
51aa : 85 4a __ STA T5 + 0 
51ac : 98 __ __ TYA
51ad : 7d 65 55 ADC $5565,x ; (multab + 1)
51b0 : 85 4b __ STA T5 + 1 
51b2 : a9 12 __ LDA #$12
51b4 : 8d 00 d6 STA $d600 
51b7 : 18 __ __ CLC
51b8 : a5 4a __ LDA T5 + 0 
51ba : 6d 53 55 ADC $5553 ; (vdc_state + 8)
51bd : a8 __ __ TAY
51be : a5 4b __ LDA T5 + 1 
51c0 : 6d 54 55 ADC $5554 ; (vdc_state + 9)
51c3 : ae 52 55 LDX $5552 ; (vdc_state + 7)
.l188:
51c6 : 2c 00 d6 BIT $d600 
51c9 : 10 fb __ BPL $51c6 ; (vdcwin_put_string.l188 + 0)
.s16:
51cb : 8d 01 d6 STA $d601 
51ce : a9 13 __ LDA #$13
51d0 : 8d 00 d6 STA $d600 
.l190:
51d3 : 2c 00 d6 BIT $d600 
51d6 : 10 fb __ BPL $51d3 ; (vdcwin_put_string.l190 + 0)
.s21:
51d8 : 8c 01 d6 STY $d601 
51db : a9 1f __ LDA #$1f
51dd : 8d 00 d6 STA $d600 
.l192:
51e0 : 2c 00 d6 BIT $d600 
51e3 : 10 fb __ BPL $51e0 ; (vdcwin_put_string.l192 + 0)
.s25:
51e5 : a5 4e __ LDA T7 + 0 
51e7 : 8d 01 d6 STA $d601 
51ea : ad 55 55 LDA $5555 ; (vdc_state + 10)
51ed : 18 __ __ CLC
51ee : 65 4a __ ADC T5 + 0 
51f0 : a8 __ __ TAY
51f1 : a9 12 __ LDA #$12
51f3 : 8d 00 d6 STA $d600 
51f6 : ad 56 55 LDA $5556 ; (vdc_state + 11)
51f9 : 65 4b __ ADC T5 + 1 
.l194:
51fb : 2c 00 d6 BIT $d600 
51fe : 10 fb __ BPL $51fb ; (vdcwin_put_string.l194 + 0)
.s32:
5200 : 8d 01 d6 STA $d601 
5203 : a9 13 __ LDA #$13
5205 : 8d 00 d6 STA $d600 
.l196:
5208 : 2c 00 d6 BIT $d600 
520b : 10 fb __ BPL $5208 ; (vdcwin_put_string.l196 + 0)
.s37:
520d : 8c 01 d6 STY $d601 
5210 : a9 1f __ LDA #$1f
5212 : 8d 00 d6 STA $d600 
.l198:
5215 : 2c 00 d6 BIT $d600 
5218 : 10 fb __ BPL $5215 ; (vdcwin_put_string.l198 + 0)
.s41:
521a : 8e 01 d6 STX $d601 
521d : e6 43 __ INC T0 + 0 
521f : 4c 32 51 JMP $5132 ; (vdcwin_put_string.l2 + 0)
--------------------------------------------------------------------
mul16by8: ; mul16by8
5222 : a0 00 __ LDY #$00
5224 : 84 06 __ STY WORK + 3 
5226 : 4a __ __ LSR
5227 : 90 0d __ BCC $5236 ; (mul16by8 + 20)
5229 : aa __ __ TAX
522a : 18 __ __ CLC
522b : 98 __ __ TYA
522c : 65 1b __ ADC ACCU + 0 
522e : a8 __ __ TAY
522f : a5 06 __ LDA WORK + 3 
5231 : 65 1c __ ADC ACCU + 1 
5233 : 85 06 __ STA WORK + 3 
5235 : 8a __ __ TXA
5236 : 06 1b __ ASL ACCU + 0 
5238 : 26 1c __ ROL ACCU + 1 
523a : 4a __ __ LSR
523b : b0 ec __ BCS $5229 ; (mul16by8 + 7)
523d : d0 f7 __ BNE $5236 ; (mul16by8 + 20)
523f : 84 05 __ STY WORK + 2 
5241 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
5242 : a0 00 __ LDY #$00
5244 : 84 06 __ STY WORK + 3 
5246 : a5 03 __ LDA WORK + 0 
5248 : a6 04 __ LDX WORK + 1 
524a : f0 1c __ BEQ $5268 ; (mul16 + 38)
524c : 38 __ __ SEC
524d : 6a __ __ ROR
524e : 90 0d __ BCC $525d ; (mul16 + 27)
5250 : aa __ __ TAX
5251 : 18 __ __ CLC
5252 : 98 __ __ TYA
5253 : 65 1b __ ADC ACCU + 0 
5255 : a8 __ __ TAY
5256 : a5 06 __ LDA WORK + 3 
5258 : 65 1c __ ADC ACCU + 1 
525a : 85 06 __ STA WORK + 3 
525c : 8a __ __ TXA
525d : 06 1b __ ASL ACCU + 0 
525f : 26 1c __ ROL ACCU + 1 
5261 : 4a __ __ LSR
5262 : 90 f9 __ BCC $525d ; (mul16 + 27)
5264 : d0 ea __ BNE $5250 ; (mul16 + 14)
5266 : a5 04 __ LDA WORK + 1 
5268 : 4a __ __ LSR
5269 : 90 0d __ BCC $5278 ; (mul16 + 54)
526b : aa __ __ TAX
526c : 18 __ __ CLC
526d : 98 __ __ TYA
526e : 65 1b __ ADC ACCU + 0 
5270 : a8 __ __ TAY
5271 : a5 06 __ LDA WORK + 3 
5273 : 65 1c __ ADC ACCU + 1 
5275 : 85 06 __ STA WORK + 3 
5277 : 8a __ __ TXA
5278 : 06 1b __ ASL ACCU + 0 
527a : 26 1c __ ROL ACCU + 1 
527c : 4a __ __ LSR
527d : b0 ec __ BCS $526b ; (mul16 + 41)
527f : d0 f7 __ BNE $5278 ; (mul16 + 54)
5281 : 84 05 __ STY WORK + 2 
5283 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
5284 : a5 1c __ LDA ACCU + 1 
5286 : d0 31 __ BNE $52b9 ; (divmod + 53)
5288 : a5 04 __ LDA WORK + 1 
528a : d0 1e __ BNE $52aa ; (divmod + 38)
528c : 85 06 __ STA WORK + 3 
528e : a2 04 __ LDX #$04
5290 : 06 1b __ ASL ACCU + 0 
5292 : 2a __ __ ROL
5293 : c5 03 __ CMP WORK + 0 
5295 : 90 02 __ BCC $5299 ; (divmod + 21)
5297 : e5 03 __ SBC WORK + 0 
5299 : 26 1b __ ROL ACCU + 0 
529b : 2a __ __ ROL
529c : c5 03 __ CMP WORK + 0 
529e : 90 02 __ BCC $52a2 ; (divmod + 30)
52a0 : e5 03 __ SBC WORK + 0 
52a2 : 26 1b __ ROL ACCU + 0 
52a4 : ca __ __ DEX
52a5 : d0 eb __ BNE $5292 ; (divmod + 14)
52a7 : 85 05 __ STA WORK + 2 
52a9 : 60 __ __ RTS
52aa : a5 1b __ LDA ACCU + 0 
52ac : 85 05 __ STA WORK + 2 
52ae : a5 1c __ LDA ACCU + 1 
52b0 : 85 06 __ STA WORK + 3 
52b2 : a9 00 __ LDA #$00
52b4 : 85 1b __ STA ACCU + 0 
52b6 : 85 1c __ STA ACCU + 1 
52b8 : 60 __ __ RTS
52b9 : a5 04 __ LDA WORK + 1 
52bb : d0 1f __ BNE $52dc ; (divmod + 88)
52bd : a5 03 __ LDA WORK + 0 
52bf : 30 1b __ BMI $52dc ; (divmod + 88)
52c1 : a9 00 __ LDA #$00
52c3 : 85 06 __ STA WORK + 3 
52c5 : a2 10 __ LDX #$10
52c7 : 06 1b __ ASL ACCU + 0 
52c9 : 26 1c __ ROL ACCU + 1 
52cb : 2a __ __ ROL
52cc : c5 03 __ CMP WORK + 0 
52ce : 90 02 __ BCC $52d2 ; (divmod + 78)
52d0 : e5 03 __ SBC WORK + 0 
52d2 : 26 1b __ ROL ACCU + 0 
52d4 : 26 1c __ ROL ACCU + 1 
52d6 : ca __ __ DEX
52d7 : d0 f2 __ BNE $52cb ; (divmod + 71)
52d9 : 85 05 __ STA WORK + 2 
52db : 60 __ __ RTS
52dc : a9 00 __ LDA #$00
52de : 85 05 __ STA WORK + 2 
52e0 : 85 06 __ STA WORK + 3 
52e2 : 84 02 __ STY $02 
52e4 : a0 10 __ LDY #$10
52e6 : 18 __ __ CLC
52e7 : 26 1b __ ROL ACCU + 0 
52e9 : 26 1c __ ROL ACCU + 1 
52eb : 26 05 __ ROL WORK + 2 
52ed : 26 06 __ ROL WORK + 3 
52ef : 38 __ __ SEC
52f0 : a5 05 __ LDA WORK + 2 
52f2 : e5 03 __ SBC WORK + 0 
52f4 : aa __ __ TAX
52f5 : a5 06 __ LDA WORK + 3 
52f7 : e5 04 __ SBC WORK + 1 
52f9 : 90 04 __ BCC $52ff ; (divmod + 123)
52fb : 86 05 __ STX WORK + 2 
52fd : 85 06 __ STA WORK + 3 
52ff : 88 __ __ DEY
5300 : d0 e5 __ BNE $52e7 ; (divmod + 99)
5302 : 26 1b __ ROL ACCU + 0 
5304 : 26 1c __ ROL ACCU + 1 
5306 : a4 02 __ LDY $02 
5308 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
5309 : 84 02 __ STY $02 
530b : a0 20 __ LDY #$20
530d : a9 00 __ LDA #$00
530f : 85 07 __ STA WORK + 4 
5311 : 85 08 __ STA WORK + 5 
5313 : 85 09 __ STA WORK + 6 
5315 : 85 0a __ STA WORK + 7 
5317 : a5 05 __ LDA WORK + 2 
5319 : 05 06 __ ORA WORK + 3 
531b : d0 39 __ BNE $5356 ; (divmod32 + 77)
531d : 18 __ __ CLC
531e : 26 1b __ ROL ACCU + 0 
5320 : 26 1c __ ROL ACCU + 1 
5322 : 26 1d __ ROL ACCU + 2 
5324 : 26 1e __ ROL ACCU + 3 
5326 : 26 07 __ ROL WORK + 4 
5328 : 26 08 __ ROL WORK + 5 
532a : 90 0c __ BCC $5338 ; (divmod32 + 47)
532c : a5 07 __ LDA WORK + 4 
532e : e5 03 __ SBC WORK + 0 
5330 : aa __ __ TAX
5331 : a5 08 __ LDA WORK + 5 
5333 : e5 04 __ SBC WORK + 1 
5335 : 38 __ __ SEC
5336 : b0 0c __ BCS $5344 ; (divmod32 + 59)
5338 : 38 __ __ SEC
5339 : a5 07 __ LDA WORK + 4 
533b : e5 03 __ SBC WORK + 0 
533d : aa __ __ TAX
533e : a5 08 __ LDA WORK + 5 
5340 : e5 04 __ SBC WORK + 1 
5342 : 90 04 __ BCC $5348 ; (divmod32 + 63)
5344 : 86 07 __ STX WORK + 4 
5346 : 85 08 __ STA WORK + 5 
5348 : 88 __ __ DEY
5349 : d0 d3 __ BNE $531e ; (divmod32 + 21)
534b : 26 1b __ ROL ACCU + 0 
534d : 26 1c __ ROL ACCU + 1 
534f : 26 1d __ ROL ACCU + 2 
5351 : 26 1e __ ROL ACCU + 3 
5353 : a4 02 __ LDY $02 
5355 : 60 __ __ RTS
5356 : 18 __ __ CLC
5357 : 26 1b __ ROL ACCU + 0 
5359 : 26 1c __ ROL ACCU + 1 
535b : 26 1d __ ROL ACCU + 2 
535d : 26 1e __ ROL ACCU + 3 
535f : 26 07 __ ROL WORK + 4 
5361 : 26 08 __ ROL WORK + 5 
5363 : 26 09 __ ROL WORK + 6 
5365 : 26 0a __ ROL WORK + 7 
5367 : a5 07 __ LDA WORK + 4 
5369 : c5 03 __ CMP WORK + 0 
536b : a5 08 __ LDA WORK + 5 
536d : e5 04 __ SBC WORK + 1 
536f : a5 09 __ LDA WORK + 6 
5371 : e5 05 __ SBC WORK + 2 
5373 : a5 0a __ LDA WORK + 7 
5375 : e5 06 __ SBC WORK + 3 
5377 : 90 18 __ BCC $5391 ; (divmod32 + 136)
5379 : a5 07 __ LDA WORK + 4 
537b : e5 03 __ SBC WORK + 0 
537d : 85 07 __ STA WORK + 4 
537f : a5 08 __ LDA WORK + 5 
5381 : e5 04 __ SBC WORK + 1 
5383 : 85 08 __ STA WORK + 5 
5385 : a5 09 __ LDA WORK + 6 
5387 : e5 05 __ SBC WORK + 2 
5389 : 85 09 __ STA WORK + 6 
538b : a5 0a __ LDA WORK + 7 
538d : e5 06 __ SBC WORK + 3 
538f : 85 0a __ STA WORK + 7 
5391 : 88 __ __ DEY
5392 : d0 c3 __ BNE $5357 ; (divmod32 + 78)
5394 : 26 1b __ ROL ACCU + 0 
5396 : 26 1c __ ROL ACCU + 1 
5398 : 26 1d __ ROL ACCU + 2 
539a : 26 1e __ ROL ACCU + 3 
539c : a4 02 __ LDY $02 
539e : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
539f : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
__multab6L:
53a5 : __ __ __ BYT 00 06 0c 12 18                                  : .....
--------------------------------------------------------------------
__multab15L:
53aa : __ __ __ BYT 00 0f 1e 2d 3c                                  : ...-<
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
53af : a9 02 __ LDA #$02
53b1 : 85 0d __ STA P0 
53b3 : a9 00 __ LDA #$00
53b5 : 85 0e __ STA P1 
53b7 : a9 56 __ LDA #$56
53b9 : 85 0f __ STA P2 
53bb : 4c 74 46 JMP $4674 ; (vdc_prints.s0 + 0)
--------------------------------------------------------------------
53be : __ __ __ BYT 7f 00 80 a0 4b 00 00 00 00 00 00 00 00 00 00 00 : ....K...........
--------------------------------------------------------------------
seed:
53ce : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
53d0 : __ __ __ BYT 46 4c 49 45 53 00 4a 55 4d 50 53 00 53 4c 45 45 : FLIES.JUMPS.SLEE
53e0 : __ __ __ BYT 50 53 45 41 54 53 00 00 57 41 4c 4b 53 00       : PSEATS..WALKS.
--------------------------------------------------------------------
p2smap:
53ee : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
vdc_modes:
5400 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
5410 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
5420 : __ __ __ BYT e7 24 7e ff 50 00 32 00 00 00 00 00 10 00 40 00 : .$~.P.2.......@.
5430 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
5440 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
5450 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
5460 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
5470 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
5480 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
5490 : __ __ __ BYT 50 00 32 00 00 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
54a0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
54b0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
54c0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
54d0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
54d8 : __ __ __ BYT 42 49 47 00 00 00 53 4d 41 4c 4c 00 41 4e 47 52 : BIG...SMALL.ANGR
54e8 : __ __ __ BYT 59 00 57 45 54 00 00 00 48 41 50 50 59 00       : Y.WET...HAPPY.
--------------------------------------------------------------------
5500 : __ __ __ BYT 42 4c 55 45 20 4a 41 59 00 00 00 00 00 00 00 43 : BLUE JAY.......C
5510 : __ __ __ BYT 41 52 44 49 4e 41 4c 00 00 00 00 00 00 00 45 41 : ARDINAL.......EA
5520 : __ __ __ BYT 53 54 45 52 4e 20 50 48 4f 45 42 45 00 47 52 41 : STERN PHOEBE.GRA
5530 : __ __ __ BYT 43 4b 4c 45 00 00 00 00 00 00 00 00 53 41 4e 44 : CKLE........SAND
5540 : __ __ __ BYT 48 49 4c 4c 20 43 52 41 4e 45 00                : HILL CRANE.
--------------------------------------------------------------------
vdc_state:
554b : __ __ __ BSS	25
--------------------------------------------------------------------
multab:
5564 : __ __ __ BSS	144
--------------------------------------------------------------------
linebuffer:
5600 : __ __ __ BSS	81
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1300 : ad 5b 55 LDA $555b ; (vdc_state + 16)
01:1303 : 85 0d __ STA P0 
01:1305 : ad 5c 55 LDA $555c ; (vdc_state + 17)
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
01:1392 : 20 1f 41 JSR $411f ; (krnio_setbnk.s0 + 0)
01:1395 : a5 12 __ LDA P5 ; (fname + 0)
01:1397 : 85 0d __ STA P0 
01:1399 : a5 13 __ LDA P6 ; (fname + 1)
01:139b : 85 0e __ STA P1 
01:139d : 20 27 41 JSR $4127 ; (krnio_setnam.s0 + 0)
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
01:1438 : a9 00 __ LDA #$00
01:143a : 85 0d __ STA P0 
01:143c : a9 56 __ LDA #$56
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
01:14be : a9 00 __ LDA #$00
01:14c0 : 85 0d __ STA P0 
01:14c2 : a9 56 __ LDA #$56
01:14c4 : 85 0e __ STA P1 
01:14c6 : a5 12 __ LDA P5 
01:14c8 : 85 11 __ STA P4 
01:14ca : a9 00 __ LDA #$00
01:14cc : 85 12 __ STA P5 
01:14ce : 4c 48 14 JMP $1448 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:14d1 : ad aa be LDA $beaa ; (vp_fill + 0)
01:14d4 : 85 0f __ STA P2 
01:14d6 : a5 57 __ LDA $57 
01:14d8 : 85 10 __ STA P3 
01:14da : a5 58 __ LDA $58 
01:14dc : 85 11 __ STA P4 
01:14de : ad b7 be LDA $beb7 ; (vp_fill + 13)
01:14e1 : 85 12 __ STA P5 
01:14e3 : a9 00 __ LDA #$00
01:14e5 : 85 13 __ STA P6 
01:14e7 : 4c d1 13 JMP $13d1 ; (bnk_cpytovdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:14ea : a9 0e __ LDA #$0e
01:14ec : 85 0f __ STA P2 
01:14ee : a9 00 __ LDA #$00
01:14f0 : 85 10 __ STA P3 
01:14f2 : a9 56 __ LDA #$56
01:14f4 : 85 11 __ STA P4 
01:14f6 : a5 57 __ LDA $57 
01:14f8 : 85 12 __ STA P5 
01:14fa : a9 00 __ LDA #$00
01:14fc : 85 13 __ STA P6 
01:14fe : 4c d1 13 JMP $13d1 ; (bnk_cpytovdc.s0 + 0)
