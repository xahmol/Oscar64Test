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
1c13 : 8e f2 50 STX $50f2 ; (spentry + 0)
1c16 : a9 1e __ LDA #$1e
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 5a __ LDA #$5a
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 5b __ LDA #$5b
1c21 : e9 5a __ SBC #$5a
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
1c37 : e9 1e __ SBC #$1e
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
1c97 : bd 8e 58 LDA $588e,x ; (vdc_prints@proxy + 14)
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
.l11341:
1cd3 : 2c 00 d6 BIT $d600 
1cd6 : 10 fb __ BPL $1cd3 ; (main.l11341 + 0)
.s10:
1cd8 : ad 01 d6 LDA $d601 
1cdb : 29 f0 __ AND #$f0
1cdd : a8 __ __ TAY
1cde : a9 1a __ LDA #$1a
1ce0 : 8d 00 d6 STA $d600 
.l11343:
1ce3 : 2c 00 d6 BIT $d600 
1ce6 : 10 fb __ BPL $1ce3 ; (main.l11343 + 0)
.s16:
1ce8 : 8c 01 d6 STY $d601 
1ceb : 8d 00 d6 STA $d600 
.l11345:
1cee : 2c 00 d6 BIT $d600 
1cf1 : 10 fb __ BPL $1cee ; (main.l11345 + 0)
.s23:
1cf3 : ad 01 d6 LDA $d601 
1cf6 : 29 0f __ AND #$0f
1cf8 : 09 d0 __ ORA #$d0
1cfa : a8 __ __ TAY
1cfb : a9 1a __ LDA #$1a
1cfd : 8d 00 d6 STA $d600 
.l11347:
1d00 : 2c 00 d6 BIT $d600 
1d03 : 10 fb __ BPL $1d00 ; (main.l11347 + 0)
.s29:
1d05 : 8c 01 d6 STY $d601 
1d08 : a9 8d __ LDA #$8d
1d0a : 8d 25 5a STA $5a25 ; (vdc_state + 7)
1d0d : a9 1c __ LDA #$1c
1d0f : 8d 00 d6 STA $d600 
.l11349:
1d12 : 2c 00 d6 BIT $d600 
1d15 : 10 fb __ BPL $1d12 ; (main.l11349 + 0)
.s35:
1d17 : ad 01 d6 LDA $d601 
1d1a : a8 __ __ TAY
1d1b : 09 10 __ ORA #$10
1d1d : 85 54 __ STA T1 + 0 
1d1f : a9 1c __ LDA #$1c
1d21 : 8d 00 d6 STA $d600 
.l11351:
1d24 : 2c 00 d6 BIT $d600 
1d27 : 10 fb __ BPL $1d24 ; (main.l11351 + 0)
.s42:
1d29 : a5 54 __ LDA T1 + 0 
1d2b : 8d 01 d6 STA $d601 
1d2e : a9 12 __ LDA #$12
1d30 : 8d 00 d6 STA $d600 
.l11353:
1d33 : 2c 00 d6 BIT $d600 
1d36 : 10 fb __ BPL $1d33 ; (main.l11353 + 0)
.s49:
1d38 : a9 1f __ LDA #$1f
1d3a : 8d 01 d6 STA $d601 
1d3d : a9 13 __ LDA #$13
1d3f : 8d 00 d6 STA $d600 
.l11355:
1d42 : 2c 00 d6 BIT $d600 
1d45 : 10 fb __ BPL $1d42 ; (main.l11355 + 0)
.s54:
1d47 : a9 ff __ LDA #$ff
1d49 : 8d 01 d6 STA $d601 
1d4c : a9 1f __ LDA #$1f
1d4e : 8d 00 d6 STA $d600 
.l11357:
1d51 : 2c 00 d6 BIT $d600 
1d54 : 10 fb __ BPL $1d51 ; (main.l11357 + 0)
.s58:
1d56 : 8e 01 d6 STX $d601 
1d59 : a9 12 __ LDA #$12
1d5b : 8d 00 d6 STA $d600 
.l11359:
1d5e : 2c 00 d6 BIT $d600 
1d61 : 10 fb __ BPL $1d5e ; (main.l11359 + 0)
.s65:
1d63 : a9 9f __ LDA #$9f
1d65 : 8d 01 d6 STA $d601 
1d68 : a9 13 __ LDA #$13
1d6a : 8d 00 d6 STA $d600 
.l11361:
1d6d : 2c 00 d6 BIT $d600 
1d70 : 10 fb __ BPL $1d6d ; (main.l11361 + 0)
.s70:
1d72 : a9 ff __ LDA #$ff
1d74 : 8d 01 d6 STA $d601 
1d77 : a9 1f __ LDA #$1f
1d79 : 8d 00 d6 STA $d600 
.l11363:
1d7c : 2c 00 d6 BIT $d600 
1d7f : 10 fb __ BPL $1d7c ; (main.l11363 + 0)
.s74:
1d81 : a9 ff __ LDA #$ff
1d83 : 8d 01 d6 STA $d601 
1d86 : a9 12 __ LDA #$12
1d88 : 8d 00 d6 STA $d600 
.l11365:
1d8b : 2c 00 d6 BIT $d600 
1d8e : 10 fb __ BPL $1d8b ; (main.l11365 + 0)
.s81:
1d90 : a9 1f __ LDA #$1f
1d92 : 8d 01 d6 STA $d601 
1d95 : a9 13 __ LDA #$13
1d97 : 8d 00 d6 STA $d600 
.l11367:
1d9a : 2c 00 d6 BIT $d600 
1d9d : 10 fb __ BPL $1d9a ; (main.l11367 + 0)
.s86:
1d9f : a9 ff __ LDA #$ff
1da1 : 8d 01 d6 STA $d601 
1da4 : a9 1f __ LDA #$1f
1da6 : 8d 00 d6 STA $d600 
.l11369:
1da9 : 2c 00 d6 BIT $d600 
1dac : 10 fb __ BPL $1da9 ; (main.l11369 + 0)
.s90:
1dae : ad 01 d6 LDA $d601 
1db1 : f0 04 __ BEQ $1db7 ; (main.s1721 + 0)
.s1722:
1db3 : a9 10 __ LDA #$10
1db5 : d0 02 __ BNE $1db9 ; (main.s1723 + 0)
.s1721:
1db7 : a9 40 __ LDA #$40
.s1723:
1db9 : 8d 1e 5a STA $5a1e ; (vdc_state + 0)
1dbc : a9 1c __ LDA #$1c
1dbe : 8d 00 d6 STA $d600 
.l11372:
1dc1 : 2c 00 d6 BIT $d600 
1dc4 : 10 fb __ BPL $1dc1 ; (main.l11372 + 0)
.s97:
1dc6 : 86 53 __ STX T0 + 0 
1dc8 : 8c 01 d6 STY $d601 
1dcb : ad 21 5a LDA $5a21 ; (vdc_state + 3)
1dce : 85 54 __ STA T1 + 0 
1dd0 : ad 23 5a LDA $5a23 ; (vdc_state + 5)
1dd3 : 85 57 __ STA T3 + 0 
.l100:
1dd5 : a5 53 __ LDA T0 + 0 
1dd7 : c5 57 __ CMP T3 + 0 
1dd9 : b0 03 __ BCS $1dde ; (main.s30 + 0)
1ddb : 4c 01 3e JMP $3e01 ; (main.s101 + 0)
.s30:
1dde : 24 d7 __ BIT $d7 
1de0 : 30 17 __ BMI $1df9 ; (main.s11400 + 0)
.s178:
1de2 : a9 39 __ LDA #$39
1de4 : a0 02 __ LDY #$02
1de6 : 91 23 __ STA (SP + 0),y 
1de8 : a9 45 __ LDA #$45
1dea : c8 __ __ INY
1deb : 91 23 __ STA (SP + 0),y 
1ded : 20 dc 3e JSR $3edc ; (printf.s1000 + 0)
1df0 : 20 64 45 JSR $4564 ; (getch.s0 + 0)
1df3 : 20 a3 45 JSR $45a3 ; (clrscr.s0 + 0)
1df6 : 20 a7 45 JSR $45a7 ; (screen_setmode.s0 + 0)
.s11400:
1df9 : a5 ba __ LDA $ba 
1dfb : d0 02 __ BNE $1dff ; (main.s186 + 0)
.s184:
1dfd : a9 08 __ LDA #$08
.s186:
1dff : 85 53 __ STA T0 + 0 
1e01 : 85 f7 __ STA $f7 ; (bootdevice + 0)
1e03 : a9 af __ LDA #$af
1e05 : a0 02 __ LDY #$02
1e07 : 91 23 __ STA (SP + 0),y 
1e09 : a9 45 __ LDA #$45
1e0b : c8 __ __ INY
1e0c : 91 23 __ STA (SP + 0),y 
1e0e : a5 53 __ LDA T0 + 0 
1e10 : c8 __ __ INY
1e11 : 91 23 __ STA (SP + 0),y 
1e13 : a9 00 __ LDA #$00
1e15 : c8 __ __ INY
1e16 : 91 23 __ STA (SP + 0),y 
1e18 : 20 dc 3e JSR $3edc ; (printf.s1000 + 0)
1e1b : a9 06 __ LDA #$06
1e1d : 8d 06 d5 STA $d506 
1e20 : a9 bf __ LDA #$bf
1e22 : a0 02 __ LDY #$02
1e24 : 91 23 __ STA (SP + 0),y 
1e26 : a9 45 __ LDA #$45
1e28 : c8 __ __ INY
1e29 : 91 23 __ STA (SP + 0),y 
1e2b : 20 dc 3e JSR $3edc ; (printf.s1000 + 0)
1e2e : a9 00 __ LDA #$00
1e30 : 85 0d __ STA P0 
1e32 : 85 0e __ STA P1 
1e34 : 20 de 45 JSR $45de ; (krnio_setbnk.s0 + 0)
1e37 : a9 d9 __ LDA #$d9
1e39 : 85 0d __ STA P0 
1e3b : a9 45 __ LDA #$45
1e3d : 85 0e __ STA P1 
1e3f : 20 e6 45 JSR $45e6 ; (krnio_setnam.s0 + 0)
1e42 : a9 01 __ LDA #$01
1e44 : 85 0d __ STA P0 
1e46 : 85 0f __ STA P2 
1e48 : a5 53 __ LDA T0 + 0 
1e4a : 85 0e __ STA P1 
1e4c : 20 fc 45 JSR $45fc ; (krnio_load.s0 + 0)
1e4f : 09 00 __ ORA #$00
1e51 : d0 11 __ BNE $1e64 ; (main.s193 + 0)
.s189:
1e53 : a9 19 __ LDA #$19
1e55 : a0 02 __ LDY #$02
1e57 : 91 23 __ STA (SP + 0),y 
1e59 : a9 46 __ LDA #$46
1e5b : c8 __ __ INY
1e5c : 91 23 __ STA (SP + 0),y 
1e5e : 20 dc 3e JSR $3edc ; (printf.s1000 + 0)
1e61 : 20 37 46 JSR $4637 ; (exit@proxy + 0)
.s193:
1e64 : a9 01 __ LDA #$01
1e66 : 8d 30 d0 STA $d030 
1e69 : a9 00 __ LDA #$00
1e6b : 85 13 __ STA P6 
1e6d : ad 11 d0 LDA $d011 
1e70 : 29 6f __ AND #$6f
1e72 : 8d 11 d0 STA $d011 
1e75 : 20 54 46 JSR $4654 ; (vdc_set_mode.s1000 + 0)
1e78 : ad 1e 5a LDA $5a1e ; (vdc_state + 0)
1e7b : c9 40 __ CMP #$40
1e7d : f0 03 __ BEQ $1e82 ; (main.s199 + 0)
1e7f : 4c 99 1f JMP $1f99 ; (main.s3 + 0)
.s199:
1e82 : ad 1f 5a LDA $5a1f ; (vdc_state + 1)
1e85 : f0 03 __ BEQ $1e8a ; (main.s203 + 0)
1e87 : 4c 99 1f JMP $1f99 ; (main.s3 + 0)
.s203:
1e8a : a9 22 __ LDA #$22
1e8c : 8d 00 d6 STA $d600 
.l11961:
1e8f : 2c 00 d6 BIT $d600 
1e92 : 10 fb __ BPL $1e8f ; (main.l11961 + 0)
.s211:
1e94 : a9 80 __ LDA #$80
1e96 : 8d 01 d6 STA $d601 
1e99 : a2 00 __ LDX #$00
1e9b : a0 ff __ LDY #$ff
.l214:
1e9d : a9 12 __ LDA #$12
1e9f : 8d 00 d6 STA $d600 
.l11963:
1ea2 : 2c 00 d6 BIT $d600 
1ea5 : 10 fb __ BPL $1ea2 ; (main.l11963 + 0)
.s223:
1ea7 : 8e 01 d6 STX $d601 
1eaa : a9 13 __ LDA #$13
1eac : 8d 00 d6 STA $d600 
.l11965:
1eaf : 2c 00 d6 BIT $d600 
1eb2 : 10 fb __ BPL $1eaf ; (main.l11965 + 0)
.s228:
1eb4 : a9 00 __ LDA #$00
1eb6 : 8d 01 d6 STA $d601 
1eb9 : a9 1f __ LDA #$1f
1ebb : 8d 00 d6 STA $d600 
.l11967:
1ebe : 2c 00 d6 BIT $d600 
1ec1 : 10 fb __ BPL $1ebe ; (main.l11967 + 0)
.s232:
1ec3 : a9 00 __ LDA #$00
1ec5 : 8d 01 d6 STA $d601 
1ec8 : a9 18 __ LDA #$18
1eca : 8d 00 d6 STA $d600 
.l11969:
1ecd : 2c 00 d6 BIT $d600 
1ed0 : 10 fb __ BPL $1ecd ; (main.l11969 + 0)
.s238:
1ed2 : ad 01 d6 LDA $d601 
1ed5 : 29 7f __ AND #$7f
1ed7 : 85 57 __ STA T3 + 0 
1ed9 : a9 18 __ LDA #$18
1edb : 8d 00 d6 STA $d600 
.l11971:
1ede : 2c 00 d6 BIT $d600 
1ee1 : 10 fb __ BPL $1ede ; (main.l11971 + 0)
.s244:
1ee3 : a5 57 __ LDA T3 + 0 
1ee5 : 8d 01 d6 STA $d601 
1ee8 : a9 1e __ LDA #$1e
1eea : 8d 00 d6 STA $d600 
.l11973:
1eed : 2c 00 d6 BIT $d600 
1ef0 : 10 fb __ BPL $1eed ; (main.l11973 + 0)
.s249:
1ef2 : a9 ff __ LDA #$ff
1ef4 : 8d 01 d6 STA $d601 
1ef7 : e8 __ __ INX
1ef8 : 88 __ __ DEY
1ef9 : d0 a2 __ BNE $1e9d ; (main.l214 + 0)
.s216:
1efb : a9 12 __ LDA #$12
1efd : 8d 00 d6 STA $d600 
.l11976:
1f00 : 2c 00 d6 BIT $d600 
1f03 : 10 fb __ BPL $1f00 ; (main.l11976 + 0)
.s256:
1f05 : 8e 01 d6 STX $d601 
1f08 : a9 13 __ LDA #$13
1f0a : 8d 00 d6 STA $d600 
.l11978:
1f0d : 2c 00 d6 BIT $d600 
1f10 : 10 fb __ BPL $1f0d ; (main.l11978 + 0)
.s261:
1f12 : 8c 01 d6 STY $d601 
1f15 : a9 1f __ LDA #$1f
1f17 : 8d 00 d6 STA $d600 
.l11980:
1f1a : 2c 00 d6 BIT $d600 
1f1d : 10 fb __ BPL $1f1a ; (main.l11980 + 0)
.s265:
1f1f : 8c 01 d6 STY $d601 
1f22 : a9 18 __ LDA #$18
1f24 : 8d 00 d6 STA $d600 
.l11982:
1f27 : 2c 00 d6 BIT $d600 
1f2a : 10 fb __ BPL $1f27 ; (main.l11982 + 0)
.s271:
1f2c : ad 01 d6 LDA $d601 
1f2f : 29 7f __ AND #$7f
1f31 : aa __ __ TAX
1f32 : a9 18 __ LDA #$18
1f34 : 8d 00 d6 STA $d600 
.l11984:
1f37 : 2c 00 d6 BIT $d600 
1f3a : 10 fb __ BPL $1f37 ; (main.l11984 + 0)
.s277:
1f3c : 8e 01 d6 STX $d601 
1f3f : a9 1e __ LDA #$1e
1f41 : 8d 00 d6 STA $d600 
.l11986:
1f44 : 2c 00 d6 BIT $d600 
1f47 : 10 fb __ BPL $1f44 ; (main.l11986 + 0)
.s282:
1f49 : a9 ff __ LDA #$ff
1f4b : 8d 01 d6 STA $d601 
1f4e : a9 1c __ LDA #$1c
1f50 : 8d 00 d6 STA $d600 
.l11988:
1f53 : 2c 00 d6 BIT $d600 
1f56 : 10 fb __ BPL $1f53 ; (main.l11988 + 0)
.s288:
1f58 : ad 01 d6 LDA $d601 
1f5b : 09 10 __ ORA #$10
1f5d : aa __ __ TAX
1f5e : a9 1c __ LDA #$1c
1f60 : 8d 00 d6 STA $d600 
.l11990:
1f63 : 2c 00 d6 BIT $d600 
1f66 : 10 fb __ BPL $1f63 ; (main.l11990 + 0)
.s294:
1f68 : 8e 01 d6 STX $d601 
1f6b : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
1f6e : a9 00 __ LDA #$00
1f70 : 85 53 __ STA T0 + 0 
1f72 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
1f75 : 85 54 __ STA T1 + 0 
1f77 : ad 23 5a LDA $5a23 ; (vdc_state + 5)
1f7a : 85 57 __ STA T3 + 0 
.l298:
1f7c : a5 53 __ LDA T0 + 0 
1f7e : c5 57 __ CMP T3 + 0 
1f80 : b0 03 __ BCS $1f85 ; (main.s296 + 0)
1f82 : 4c 26 3d JMP $3d26 ; (main.s299 + 0)
.s296:
1f85 : a9 22 __ LDA #$22
1f87 : 8d 00 d6 STA $d600 
.l12017:
1f8a : 2c 00 d6 BIT $d600 
1f8d : 10 fb __ BPL $1f8a ; (main.l12017 + 0)
.s376:
1f8f : a9 7d __ LDA #$7d
1f91 : 8d 01 d6 STA $d601 
1f94 : a9 01 __ LDA #$01
1f96 : 8d 1f 5a STA $5a1f ; (vdc_state + 1)
.s3:
1f99 : a9 00 __ LDA #$00
1f9b : 85 0d __ STA P0 
1f9d : a9 54 __ LDA #$54
1f9f : 85 0e __ STA P1 
1fa1 : a9 4c __ LDA #$4c
1fa3 : 85 0f __ STA P2 
1fa5 : 20 33 4b JSR $4b33 ; (vdc_prints.s0 + 0)
1fa8 : a9 00 __ LDA #$00
1faa : a0 02 __ LDY #$02
1fac : 91 23 __ STA (SP + 0),y 
1fae : a9 5b __ LDA #$5b
1fb0 : c8 __ __ INY
1fb1 : 91 23 __ STA (SP + 0),y 
1fb3 : a9 95 __ LDA #$95
1fb5 : c8 __ __ INY
1fb6 : 91 23 __ STA (SP + 0),y 
1fb8 : a9 4f __ LDA #$4f
1fba : c8 __ __ INY
1fbb : 91 23 __ STA (SP + 0),y 
1fbd : ad 1e 5a LDA $5a1e ; (vdc_state + 0)
1fc0 : c8 __ __ INY
1fc1 : 91 23 __ STA (SP + 0),y 
1fc3 : a9 00 __ LDA #$00
1fc5 : c8 __ __ INY
1fc6 : 91 23 __ STA (SP + 0),y 
1fc8 : ad 1f 5a LDA $5a1f ; (vdc_state + 1)
1fcb : d0 07 __ BNE $1fd4 ; (main.s5937 + 0)
.s5938:
1fcd : a9 4f __ LDA #$4f
1fcf : a2 cd __ LDX #$cd
1fd1 : 4c d8 1f JMP $1fd8 ; (main.s5939 + 0)
.s5937:
1fd4 : a9 4f __ LDA #$4f
1fd6 : a2 ca __ LDX #$ca
.s5939:
1fd8 : 85 58 __ STA T3 + 1 
1fda : 8a __ __ TXA
1fdb : a0 08 __ LDY #$08
1fdd : 91 23 __ STA (SP + 0),y 
1fdf : a5 58 __ LDA T3 + 1 
1fe1 : c8 __ __ INY
1fe2 : 91 23 __ STA (SP + 0),y 
1fe4 : 20 6f 4c JSR $4c6f ; (sprintf.s1000 + 0)
1fe7 : 20 80 58 JSR $5880 ; (vdc_prints@proxy + 0)
1fea : a9 04 __ LDA #$04
1fec : 85 0d __ STA P0 
1fee : a9 d1 __ LDA #$d1
1ff0 : 85 0e __ STA P1 
1ff2 : a9 4f __ LDA #$4f
1ff4 : 85 0f __ STA P2 
1ff6 : 20 33 4b JSR $4b33 ; (vdc_prints.s0 + 0)
1ff9 : e6 0d __ INC P0 
1ffb : a9 e1 __ LDA #$e1
1ffd : 85 0e __ STA P1 
1fff : a9 4f __ LDA #$4f
2001 : 85 0f __ STA P2 
2003 : 20 33 4b JSR $4b33 ; (vdc_prints.s0 + 0)
2006 : a5 f7 __ LDA $f7 ; (bootdevice + 0)
2008 : 85 53 __ STA T0 + 0 
200a : 85 0f __ STA P2 
200c : a9 00 __ LDA #$00
200e : 85 10 __ STA P3 
2010 : a9 20 __ LDA #$20
2012 : 85 11 __ STA P4 
2014 : a9 00 __ LDA #$00
2016 : 85 12 __ STA P5 
2018 : a9 50 __ LDA #$50
201a : 85 13 __ STA P6 
201c : 20 8a 13 JSR $138a ; (bnk_load.s0 + 0)
201f : a5 1b __ LDA ACCU + 0 
2021 : d0 0a __ BNE $202d ; (main.s379 + 0)
.s377:
2023 : a9 06 __ LDA #$06
2025 : 85 0d __ STA P0 
2027 : 20 2b 4b JSR $4b2b ; (vdc_prints@proxy + 0)
202a : 20 37 46 JSR $4637 ; (exit@proxy + 0)
.s379:
202d : a9 06 __ LDA #$06
202f : 85 0d __ STA P0 
2031 : a9 14 __ LDA #$14
2033 : 85 0e __ STA P1 
2035 : a9 50 __ LDA #$50
2037 : 85 0f __ STA P2 
2039 : 20 33 4b JSR $4b33 ; (vdc_prints.s0 + 0)
203c : a5 53 __ LDA T0 + 0 
203e : 85 0f __ STA P2 
2040 : a9 00 __ LDA #$00
2042 : 85 56 __ STA T2 + 0 
2044 : 85 10 __ STA P3 
2046 : a9 80 __ LDA #$80
2048 : 85 11 __ STA P4 
204a : a9 31 __ LDA #$31
204c : 85 12 __ STA P5 
204e : a9 50 __ LDA #$50
2050 : 85 13 __ STA P6 
2052 : 20 8a 13 JSR $138a ; (bnk_load.s0 + 0)
2055 : a5 1b __ LDA ACCU + 0 
2057 : d0 0a __ BNE $2063 ; (main.s8761 + 0)
.s380:
2059 : a9 07 __ LDA #$07
205b : 85 0d __ STA P0 
205d : 20 2b 4b JSR $4b2b ; (vdc_prints@proxy + 0)
2060 : 20 37 46 JSR $4637 ; (exit@proxy + 0)
.s8761:
2063 : ad 1f bf LDA $bf1f ; (softscroll + 4)
2066 : 85 1b __ STA ACCU + 0 
2068 : a9 00 __ LDA #$00
206a : 85 1c __ STA ACCU + 1 
206c : ad 1e bf LDA $bf1e ; (softscroll + 3)
206f : 85 54 __ STA T1 + 0 
2071 : 20 03 57 JSR $5703 ; (mul16by8 + 0)
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
2086 : 90 01 __ BCC $2089 ; (main.s1725 + 0)
.s1724:
2088 : c8 __ __ INY
.s1725:
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
209e : ad 1f 5a LDA $5a1f ; (vdc_state + 1)
20a1 : d0 03 __ BNE $20a6 ; (main.l394 + 0)
20a3 : 4c 8d 23 JMP $238d ; (main.s8478 + 0)
.l394:
20a6 : a9 e0 __ LDA #$e0
20a8 : c5 5a __ CMP T4 + 1 
20aa : d0 04 __ BNE $20b0 ; (main.s1591 + 0)
.s1590:
20ac : a9 00 __ LDA #$00
20ae : c5 59 __ CMP T4 + 0 
.s1591:
20b0 : b0 03 __ BCS $20b5 ; (main.s393 + 0)
20b2 : 4c 8d 23 JMP $238d ; (main.s8478 + 0)
.s393:
20b5 : a5 56 __ LDA T2 + 0 
20b7 : cd 20 5a CMP $5a20 ; (vdc_state + 2)
20ba : f0 05 __ BEQ $20c1 ; (main.s399 + 0)
.s397:
20bc : 85 13 __ STA P6 
20be : 20 54 46 JSR $4654 ; (vdc_set_mode.s1000 + 0)
.s399:
20c1 : a9 00 __ LDA #$00
20c3 : 8d 26 5a STA $5a26 ; (vdc_state + 8)
20c6 : 8d 2e 5a STA $5a2e ; (vdc_state + 16)
20c9 : 8d 2f 5a STA $5a2f ; (vdc_state + 17)
20cc : 8d 30 5a STA $5a30 ; (vdc_state + 18)
20cf : a9 20 __ LDA #$20
20d1 : 8d 27 5a STA $5a27 ; (vdc_state + 9)
20d4 : a9 10 __ LDA #$10
20d6 : 8d 31 5a STA $5a31 ; (vdc_state + 19)
20d9 : 18 __ __ CLC
20da : a5 58 __ LDA T3 + 1 
20dc : 69 20 __ ADC #$20
20de : 8d 29 5a STA $5a29 ; (vdc_state + 11)
20e1 : a5 57 __ LDA T3 + 0 
20e3 : 8d 28 5a STA $5a28 ; (vdc_state + 10)
20e6 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
20e9 : 85 5b __ STA T5 + 0 
20eb : 49 ff __ EOR #$ff
20ed : 38 __ __ SEC
20ee : 65 54 __ ADC T1 + 0 
20f0 : 8d 36 5a STA $5a36 ; (vdc_state + 24)
20f3 : ad 24 5a LDA $5a24 ; (vdc_state + 6)
20f6 : 85 60 __ STA T7 + 1 
20f8 : ad 23 5a LDA $5a23 ; (vdc_state + 5)
20fb : 85 5f __ STA T7 + 0 
20fd : 05 60 __ ORA T7 + 1 
20ff : f0 4b __ BEQ $214c ; (main.s400 + 0)
.s2957:
2101 : ad 36 5a LDA $5a36 ; (vdc_state + 24)
2104 : 18 __ __ CLC
2105 : 65 5b __ ADC T5 + 0 
2107 : 85 5d __ STA T6 + 0 
2109 : a9 00 __ LDA #$00
210b : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
210e : 85 5e __ STA T6 + 1 
2110 : a9 00 __ LDA #$00
2112 : 85 1b __ STA ACCU + 0 
2114 : 85 1c __ STA ACCU + 1 
2116 : a9 37 __ LDA #$37
2118 : 85 62 __ STA T12 + 0 
211a : a9 5a __ LDA #$5a
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
213f : 90 02 __ BCC $2143 ; (main.s1755 + 0)
.s1754:
2141 : e6 63 __ INC T12 + 1 
.s1755:
2143 : e8 __ __ INX
2144 : a5 60 __ LDA T7 + 1 
2146 : d0 d8 __ BNE $2120 ; (main.l402 + 0)
.s1586:
2148 : e4 5f __ CPX T7 + 0 
214a : 90 d4 __ BCC $2120 ; (main.l402 + 0)
.s400:
214c : 85 61 __ STA T8 + 0 
214e : c5 5f __ CMP T7 + 0 
2150 : b0 03 __ BCS $2155 ; (main.s405 + 0)
2152 : 4c 42 3c JMP $3c42 ; (main.l408 + 0)
.s405:
2155 : ad 2e 5a LDA $5a2e ; (vdc_state + 16)
2158 : 85 0d __ STA P0 
215a : ad 2f 5a LDA $5a2f ; (vdc_state + 17)
215d : 85 0e __ STA P1 
215f : a9 1c __ LDA #$1c
2161 : 8d 00 d6 STA $d600 
.l11830:
2164 : 2c 00 d6 BIT $d600 
2167 : 10 fb __ BPL $2164 ; (main.l11830 + 0)
.s486:
2169 : ad 01 d6 LDA $d601 
216c : 29 10 __ AND #$10
216e : 45 0e __ EOR P1 
2170 : 29 1f __ AND #$1f
2172 : 45 0e __ EOR P1 
2174 : aa __ __ TAX
2175 : a9 1c __ LDA #$1c
2177 : 8d 00 d6 STA $d600 
.l11832:
217a : 2c 00 d6 BIT $d600 
217d : 10 fb __ BPL $217a ; (main.l11832 + 0)
.s492:
217f : 8e 01 d6 STX $d601 
2182 : 20 0a 13 JSR $130a ; (bnk_redef_charset.s0 + 0)
2185 : ad 26 5a LDA $5a26 ; (vdc_state + 8)
2188 : 85 0d __ STA P0 
218a : ad 28 5a LDA $5a28 ; (vdc_state + 10)
218d : 85 5d __ STA T6 + 0 
218f : ad 29 5a LDA $5a29 ; (vdc_state + 11)
2192 : 85 5e __ STA T6 + 1 
2194 : a9 0c __ LDA #$0c
2196 : 8d 00 d6 STA $d600 
2199 : ae 27 5a LDX $5a27 ; (vdc_state + 9)
219c : 86 0e __ STX P1 
.l11834:
219e : 2c 00 d6 BIT $d600 
21a1 : 10 fb __ BPL $219e ; (main.l11834 + 0)
.s499:
21a3 : 8e 01 d6 STX $d601 
21a6 : a9 0d __ LDA #$0d
21a8 : 8d 00 d6 STA $d600 
.l11836:
21ab : 2c 00 d6 BIT $d600 
21ae : 10 fb __ BPL $21ab ; (main.l11836 + 0)
.s504:
21b0 : a5 0d __ LDA P0 
21b2 : 8d 01 d6 STA $d601 
21b5 : a9 14 __ LDA #$14
21b7 : 8d 00 d6 STA $d600 
.l11838:
21ba : 2c 00 d6 BIT $d600 
21bd : 10 fb __ BPL $21ba ; (main.l11838 + 0)
.s509:
21bf : a5 5e __ LDA T6 + 1 
21c1 : 8d 01 d6 STA $d601 
21c4 : a9 15 __ LDA #$15
21c6 : 8d 00 d6 STA $d600 
.l11840:
21c9 : 2c 00 d6 BIT $d600 
21cc : 10 fb __ BPL $21c9 ; (main.l11840 + 0)
.s514:
21ce : a5 5d __ LDA T6 + 0 
21d0 : 8d 01 d6 STA $d601 
21d3 : a9 1b __ LDA #$1b
21d5 : 8d 00 d6 STA $d600 
21d8 : ae 36 5a LDX $5a36 ; (vdc_state + 24)
.l11842:
21db : 2c 00 d6 BIT $d600 
21de : 10 fb __ BPL $21db ; (main.l11842 + 0)
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
221c : 90 01 __ BCC $221f ; (main.s1757 + 0)
.s1756:
221e : c8 __ __ INY
.s1757:
221f : 84 11 __ STY P4 
2221 : 20 d1 13 JSR $13d1 ; (bnk_cpytovdc.s0 + 0)
2224 : a9 00 __ LDA #$00
2226 : 8d 20 bf STA $bf20 ; (softscroll + 5)
2229 : 8d 21 bf STA $bf21 ; (softscroll + 6)
222c : 8d 22 bf STA $bf22 ; (softscroll + 7)
222f : 8d 23 bf STA $bf23 ; (softscroll + 8)
2232 : a9 18 __ LDA #$18
2234 : 8d 00 d6 STA $d600 
.l11844:
2237 : 2c 00 d6 BIT $d600 
223a : 10 fb __ BPL $2237 ; (main.l11844 + 0)
.s524:
223c : ad 01 d6 LDA $d601 
223f : 29 f0 __ AND #$f0
2241 : 8d 24 bf STA $bf24 ; (softscroll + 9)
2244 : a9 19 __ LDA #$19
2246 : 8d 00 d6 STA $d600 
.l11846:
2249 : 2c 00 d6 BIT $d600 
224c : 10 fb __ BPL $2249 ; (main.l11846 + 0)
.s531:
224e : ad 01 d6 LDA $d601 
2251 : 29 0f __ AND #$0f
2253 : 8d 2a bf STA $bf2a ; (softscroll + 15)
2256 : a9 19 __ LDA #$19
2258 : 8d 00 d6 STA $d600 
.l11848:
225b : 2c 00 d6 BIT $d600 
225e : 10 fb __ BPL $225b ; (main.l11848 + 0)
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
2276 : 20 64 45 JSR $4564 ; (getch.s0 + 0)
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
2290 : 4c 79 3b JMP $3b79 ; (main.l548 + 0)
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
22b7 : d0 02 __ BNE $22bb ; (main.s1517 + 0)
.s1516:
22b9 : e4 5d __ CPX T6 + 0 
.s1517:
22bb : b0 03 __ BCS $22c0 ; (main.s598 + 0)
22bd : 4c c6 3a JMP $3ac6 ; (main.l600 + 0)
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
22db : b0 03 __ BCS $22e0 ; (main.s1759 + 0)
.s1758:
22dd : ce 29 bf DEC $bf29 ; (softscroll + 14)
.s1759:
22e0 : ad 23 bf LDA $bf23 ; (softscroll + 8)
22e3 : 18 __ __ CLC
22e4 : 69 02 __ ADC #$02
22e6 : 8d 23 bf STA $bf23 ; (softscroll + 8)
22e9 : c9 07 __ CMP #$07
22eb : 90 03 __ BCC $22f0 ; (main.s654 + 0)
22ed : 4c 36 3a JMP $3a36 ; (main.s653 + 0)
.s654:
22f0 : a9 19 __ LDA #$19
22f2 : 8d 00 d6 STA $d600 
22f5 : ad 25 bf LDA $bf25 ; (softscroll + 10)
22f8 : 6d 23 bf ADC $bf23 ; (softscroll + 8)
.l11941:
22fb : 2c 00 d6 BIT $d600 
22fe : 10 fb __ BPL $22fb ; (main.l11941 + 0)
.s1718:
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
2323 : d0 05 __ BNE $232a ; (main.s1479 + 0)
.s1478:
2325 : ad 26 bf LDA $bf26 ; (softscroll + 11)
2328 : c5 5d __ CMP T6 + 0 
.s1479:
232a : b0 03 __ BCS $232f ; (main.s699 + 0)
232c : 4c 71 39 JMP $3971 ; (main.s701 + 0)
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
2340 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2343 : 85 5b __ STA T5 + 0 
2345 : ad 23 5a LDA $5a23 ; (vdc_state + 5)
2348 : 85 5d __ STA T6 + 0 
.l752:
234a : a5 61 __ LDA T8 + 0 
234c : c5 5d __ CMP T6 + 0 
234e : b0 03 __ BCS $2353 ; (main.s750 + 0)
2350 : 4c 96 38 JMP $3896 ; (main.s753 + 0)
.s750:
2353 : a9 1b __ LDA #$1b
2355 : 8d 00 d6 STA $d600 
.l11919:
2358 : 2c 00 d6 BIT $d600 
235b : 10 fb __ BPL $2358 ; (main.l11919 + 0)
.s829:
235d : a9 00 __ LDA #$00
235f : 8d 01 d6 STA $d601 
2362 : a9 18 __ LDA #$18
2364 : 8d 00 d6 STA $d600 
2367 : ae 24 bf LDX $bf24 ; (softscroll + 9)
.l11921:
236a : 2c 00 d6 BIT $d600 
236d : 10 fb __ BPL $236a ; (main.l11921 + 0)
.s834:
236f : 8e 01 d6 STX $d601 
2372 : a9 19 __ LDA #$19
2374 : 8d 00 d6 STA $d600 
2377 : ad 2a bf LDA $bf2a ; (softscroll + 15)
237a : 18 __ __ CLC
237b : 6d 25 bf ADC $bf25 ; (softscroll + 10)
.l11923:
237e : 2c 00 d6 BIT $d600 
2381 : 10 fb __ BPL $237e ; (main.l11923 + 0)
.s839:
2383 : 8d 01 d6 STA $d601 
2386 : a5 56 __ LDA T2 + 0 
2388 : 85 13 __ STA P6 
238a : 20 54 46 JSR $4654 ; (vdc_set_mode.s1000 + 0)
.s8478:
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
23a5 : 20 54 46 JSR $4654 ; (vdc_set_mode.s1000 + 0)
23a8 : ad 26 5a LDA $5a26 ; (vdc_state + 8)
23ab : 85 57 __ STA T3 + 0 
23ad : ad 27 5a LDA $5a27 ; (vdc_state + 9)
23b0 : 85 58 __ STA T3 + 1 
23b2 : a9 12 __ LDA #$12
23b4 : 8d 00 d6 STA $d600 
23b7 : ad 37 5a LDA $5a37 ; (multab + 0)
23ba : 18 __ __ CLC
23bb : 65 57 __ ADC T3 + 0 
23bd : aa __ __ TAX
23be : ad 38 5a LDA $5a38 ; (multab + 1)
23c1 : a8 __ __ TAY
23c2 : 65 58 __ ADC T3 + 1 
.l11409:
23c4 : 2c 00 d6 BIT $d600 
23c7 : 10 fb __ BPL $23c4 ; (main.l11409 + 0)
.s853:
23c9 : 8d 01 d6 STA $d601 
23cc : a9 13 __ LDA #$13
23ce : 8d 00 d6 STA $d600 
.l11411:
23d1 : 2c 00 d6 BIT $d600 
23d4 : 10 fb __ BPL $23d1 ; (main.l11411 + 0)
.s858:
23d6 : 8e 01 d6 STX $d601 
23d9 : a9 1f __ LDA #$1f
23db : 8d 00 d6 STA $d600 
.l11413:
23de : 2c 00 d6 BIT $d600 
23e1 : 10 fb __ BPL $23de ; (main.l11413 + 0)
.s862:
23e3 : a9 20 __ LDA #$20
23e5 : 8d 01 d6 STA $d601 
23e8 : a9 18 __ LDA #$18
23ea : 8d 00 d6 STA $d600 
.l11415:
23ed : 2c 00 d6 BIT $d600 
23f0 : 10 fb __ BPL $23ed ; (main.l11415 + 0)
.s868:
23f2 : ad 01 d6 LDA $d601 
23f5 : 29 7f __ AND #$7f
23f7 : aa __ __ TAX
23f8 : a9 18 __ LDA #$18
23fa : 8d 00 d6 STA $d600 
.l11417:
23fd : 2c 00 d6 BIT $d600 
2400 : 10 fb __ BPL $23fd ; (main.l11417 + 0)
.s874:
2402 : 8e 01 d6 STX $d601 
2405 : a9 1e __ LDA #$1e
2407 : 8d 00 d6 STA $d600 
.l11419:
240a : 2c 00 d6 BIT $d600 
240d : 10 fb __ BPL $240a ; (main.l11419 + 0)
.s879:
240f : a9 4e __ LDA #$4e
2411 : 8d 01 d6 STA $d601 
2414 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
2417 : 85 5a __ STA T4 + 1 
2419 : a9 12 __ LDA #$12
241b : 8d 00 d6 STA $d600 
241e : ad 28 5a LDA $5a28 ; (vdc_state + 10)
2421 : 85 59 __ STA T4 + 0 
2423 : 18 __ __ CLC
2424 : 6d 37 5a ADC $5a37 ; (multab + 0)
2427 : aa __ __ TAX
2428 : 98 __ __ TYA
2429 : 65 5a __ ADC T4 + 1 
.l11421:
242b : 2c 00 d6 BIT $d600 
242e : 10 fb __ BPL $242b ; (main.l11421 + 0)
.s886:
2430 : 8d 01 d6 STA $d601 
2433 : a9 13 __ LDA #$13
2435 : 8d 00 d6 STA $d600 
.l11423:
2438 : 2c 00 d6 BIT $d600 
243b : 10 fb __ BPL $2438 ; (main.l11423 + 0)
.s891:
243d : 8e 01 d6 STX $d601 
2440 : a9 1f __ LDA #$1f
2442 : 8d 00 d6 STA $d600 
.l11425:
2445 : 2c 00 d6 BIT $d600 
2448 : 10 fb __ BPL $2445 ; (main.l11425 + 0)
.s895:
244a : a9 c5 __ LDA #$c5
244c : 8d 01 d6 STA $d601 
244f : a9 18 __ LDA #$18
2451 : 8d 00 d6 STA $d600 
.l11427:
2454 : 2c 00 d6 BIT $d600 
2457 : 10 fb __ BPL $2454 ; (main.l11427 + 0)
.s901:
2459 : ad 01 d6 LDA $d601 
245c : 29 7f __ AND #$7f
245e : aa __ __ TAX
245f : a9 18 __ LDA #$18
2461 : 8d 00 d6 STA $d600 
.l11429:
2464 : 2c 00 d6 BIT $d600 
2467 : 10 fb __ BPL $2464 ; (main.l11429 + 0)
.s907:
2469 : 8e 01 d6 STX $d601 
246c : a9 1e __ LDA #$1e
246e : 8d 00 d6 STA $d600 
.l11431:
2471 : 2c 00 d6 BIT $d600 
2474 : 10 fb __ BPL $2471 ; (main.l11431 + 0)
.s912:
2476 : a9 4e __ LDA #$4e
2478 : 8d 01 d6 STA $d601 
247b : a9 00 __ LDA #$00
247d : 85 0d __ STA P0 
247f : ad 25 5a LDA $5a25 ; (vdc_state + 7)
2482 : 29 f0 __ AND #$f0
2484 : 09 45 __ ORA #$45
2486 : 85 54 __ STA T1 + 0 
2488 : 8d 25 5a STA $5a25 ; (vdc_state + 7)
248b : a9 39 __ LDA #$39
248d : 85 0e __ STA P1 
248f : a9 50 __ LDA #$50
2491 : 85 0f __ STA P2 
2493 : 20 33 4b JSR $4b33 ; (vdc_prints.s0 + 0)
2496 : a5 54 __ LDA T1 + 0 
2498 : 29 b0 __ AND #$b0
249a : 09 0d __ ORA #$0d
249c : 8d 25 5a STA $5a25 ; (vdc_state + 7)
249f : a9 00 __ LDA #$00
24a1 : a0 02 __ LDY #$02
24a3 : 91 23 __ STA (SP + 0),y 
24a5 : a9 5b __ LDA #$5b
24a7 : c8 __ __ INY
24a8 : 91 23 __ STA (SP + 0),y 
24aa : a9 4a __ LDA #$4a
24ac : c8 __ __ INY
24ad : 91 23 __ STA (SP + 0),y 
24af : a9 50 __ LDA #$50
24b1 : c8 __ __ INY
24b2 : 91 23 __ STA (SP + 0),y 
24b4 : ad 1e 5a LDA $5a1e ; (vdc_state + 0)
24b7 : c8 __ __ INY
24b8 : 91 23 __ STA (SP + 0),y 
24ba : a9 00 __ LDA #$00
24bc : c8 __ __ INY
24bd : 91 23 __ STA (SP + 0),y 
24bf : ad 21 5a LDA $5a21 ; (vdc_state + 3)
24c2 : c8 __ __ INY
24c3 : 91 23 __ STA (SP + 0),y 
24c5 : ad 22 5a LDA $5a22 ; (vdc_state + 4)
24c8 : c8 __ __ INY
24c9 : 91 23 __ STA (SP + 0),y 
24cb : ad 23 5a LDA $5a23 ; (vdc_state + 5)
24ce : 85 5b __ STA T5 + 0 
24d0 : c8 __ __ INY
24d1 : 91 23 __ STA (SP + 0),y 
24d3 : ad 24 5a LDA $5a24 ; (vdc_state + 6)
24d6 : c8 __ __ INY
24d7 : 91 23 __ STA (SP + 0),y 
24d9 : ad 1f 5a LDA $5a1f ; (vdc_state + 1)
24dc : d0 07 __ BNE $24e5 ; (main.s5946 + 0)
.s5947:
24de : a9 50 __ LDA #$50
24e0 : a2 86 __ LDX #$86
24e2 : 4c e9 24 JMP $24e9 ; (main.s5948 + 0)
.s5946:
24e5 : a9 4f __ LDA #$4f
24e7 : a2 fc __ LDX #$fc
.s5948:
24e9 : 85 5e __ STA T6 + 1 
24eb : 8a __ __ TXA
24ec : a0 0c __ LDY #$0c
24ee : 91 23 __ STA (SP + 0),y 
24f0 : a5 5e __ LDA T6 + 1 
24f2 : c8 __ __ INY
24f3 : 91 23 __ STA (SP + 0),y 
24f5 : 20 6f 4c JSR $4c6f ; (sprintf.s1000 + 0)
24f8 : 20 80 58 JSR $5880 ; (vdc_prints@proxy + 0)
24fb : e6 0d __ INC P0 
24fd : a9 8a __ LDA #$8a
24ff : 85 0e __ STA P1 
2501 : a9 50 __ LDA #$50
2503 : 85 0f __ STA P2 
2505 : 20 33 4b JSR $4b33 ; (vdc_prints.s0 + 0)
2508 : a6 5b __ LDX T5 + 0 
250a : ca __ __ DEX
250b : 86 0d __ STX P0 
250d : a9 00 __ LDA #$00
250f : 85 0e __ STA P1 
2511 : a9 51 __ LDA #$51
2513 : 85 0f __ STA P2 
2515 : 20 33 4b JSR $4b33 ; (vdc_prints.s0 + 0)
2518 : a9 05 __ LDA #$05
251a : 85 0f __ STA P2 
251c : 85 10 __ STA P3 
251e : a9 46 __ LDA #$46
2520 : 85 11 __ STA P4 
2522 : a9 4b __ LDA #$4b
2524 : 85 0d __ STA P0 
2526 : a9 bf __ LDA #$bf
2528 : 85 0e __ STA P1 
252a : 38 __ __ SEC
252b : a5 5b __ LDA T5 + 0 
252d : e9 07 __ SBC #$07
252f : 85 54 __ STA T1 + 0 
2531 : 85 12 __ STA P5 
2533 : 20 44 51 JSR $5144 ; (vdcwin_init.s0 + 0)
2536 : ad 3f 5a LDA $5a3f ; (multab + 8)
2539 : aa __ __ TAX
253a : 18 __ __ CLC
253b : 69 04 __ ADC #$04
253d : a8 __ __ TAY
253e : a9 12 __ LDA #$12
2540 : 8d 00 d6 STA $d600 
2543 : ad 40 5a LDA $5a40 ; (multab + 9)
2546 : 85 5c __ STA T5 + 1 
2548 : 69 00 __ ADC #$00
254a : 85 5e __ STA T6 + 1 
254c : 98 __ __ TYA
254d : 18 __ __ CLC
254e : 65 57 __ ADC T3 + 0 
2550 : 85 5f __ STA T7 + 0 
2552 : a5 5e __ LDA T6 + 1 
2554 : 65 58 __ ADC T3 + 1 
.l11434:
2556 : 2c 00 d6 BIT $d600 
2559 : 10 fb __ BPL $2556 ; (main.l11434 + 0)
.s926:
255b : 8d 01 d6 STA $d601 
255e : a9 13 __ LDA #$13
2560 : 8d 00 d6 STA $d600 
.l11436:
2563 : 2c 00 d6 BIT $d600 
2566 : 10 fb __ BPL $2563 ; (main.l11436 + 0)
.s931:
2568 : a5 5f __ LDA T7 + 0 
256a : 8d 01 d6 STA $d601 
256d : a9 1f __ LDA #$1f
256f : 8d 00 d6 STA $d600 
.l11438:
2572 : 2c 00 d6 BIT $d600 
2575 : 10 fb __ BPL $2572 ; (main.l11438 + 0)
.s935:
2577 : a9 6c __ LDA #$6c
2579 : 8d 01 d6 STA $d601 
257c : a9 12 __ LDA #$12
257e : 8d 00 d6 STA $d600 
2581 : 98 __ __ TYA
2582 : 18 __ __ CLC
2583 : 65 59 __ ADC T4 + 0 
2585 : a8 __ __ TAY
2586 : a5 5e __ LDA T6 + 1 
2588 : 65 5a __ ADC T4 + 1 
.l11440:
258a : 2c 00 d6 BIT $d600 
258d : 10 fb __ BPL $258a ; (main.l11440 + 0)
.s942:
258f : 8d 01 d6 STA $d601 
2592 : a9 13 __ LDA #$13
2594 : 8d 00 d6 STA $d600 
.l11442:
2597 : 2c 00 d6 BIT $d600 
259a : 10 fb __ BPL $2597 ; (main.l11442 + 0)
.s947:
259c : 8c 01 d6 STY $d601 
259f : a9 1f __ LDA #$1f
25a1 : 8d 00 d6 STA $d600 
.l11444:
25a4 : 2c 00 d6 BIT $d600 
25a7 : 10 fb __ BPL $25a4 ; (main.l11444 + 0)
.s951:
25a9 : a9 09 __ LDA #$09
25ab : 8d 01 d6 STA $d601 
25ae : a9 12 __ LDA #$12
25b0 : 8d 00 d6 STA $d600 
25b3 : 8a __ __ TXA
25b4 : 18 __ __ CLC
25b5 : 69 05 __ ADC #$05
25b7 : a8 __ __ TAY
25b8 : a5 5c __ LDA T5 + 1 
25ba : 69 00 __ ADC #$00
25bc : 85 5e __ STA T6 + 1 
25be : 98 __ __ TYA
25bf : 18 __ __ CLC
25c0 : 65 57 __ ADC T3 + 0 
25c2 : 85 5f __ STA T7 + 0 
25c4 : a5 5e __ LDA T6 + 1 
25c6 : 65 58 __ ADC T3 + 1 
.l11446:
25c8 : 2c 00 d6 BIT $d600 
25cb : 10 fb __ BPL $25c8 ; (main.l11446 + 0)
.s961:
25cd : 8d 01 d6 STA $d601 
25d0 : a9 13 __ LDA #$13
25d2 : 8d 00 d6 STA $d600 
.l11448:
25d5 : 2c 00 d6 BIT $d600 
25d8 : 10 fb __ BPL $25d5 ; (main.l11448 + 0)
.s966:
25da : a5 5f __ LDA T7 + 0 
25dc : 8d 01 d6 STA $d601 
25df : a9 1f __ LDA #$1f
25e1 : 8d 00 d6 STA $d600 
.l11450:
25e4 : 2c 00 d6 BIT $d600 
25e7 : 10 fb __ BPL $25e4 ; (main.l11450 + 0)
.s970:
25e9 : a9 62 __ LDA #$62
25eb : 8d 01 d6 STA $d601 
25ee : a9 18 __ LDA #$18
25f0 : 8d 00 d6 STA $d600 
.l11452:
25f3 : 2c 00 d6 BIT $d600 
25f6 : 10 fb __ BPL $25f3 ; (main.l11452 + 0)
.s976:
25f8 : ad 01 d6 LDA $d601 
25fb : 29 7f __ AND #$7f
25fd : 85 5f __ STA T7 + 0 
25ff : a9 18 __ LDA #$18
2601 : 8d 00 d6 STA $d600 
.l11454:
2604 : 2c 00 d6 BIT $d600 
2607 : 10 fb __ BPL $2604 ; (main.l11454 + 0)
.s982:
2609 : a5 5f __ LDA T7 + 0 
260b : 8d 01 d6 STA $d601 
260e : a9 1e __ LDA #$1e
2610 : 8d 00 d6 STA $d600 
.l11456:
2613 : 2c 00 d6 BIT $d600 
2616 : 10 fb __ BPL $2613 ; (main.l11456 + 0)
.s987:
2618 : a9 45 __ LDA #$45
261a : 8d 01 d6 STA $d601 
261d : a9 12 __ LDA #$12
261f : 8d 00 d6 STA $d600 
2622 : 98 __ __ TYA
2623 : 18 __ __ CLC
2624 : 65 59 __ ADC T4 + 0 
2626 : a8 __ __ TAY
2627 : a5 5e __ LDA T6 + 1 
2629 : 65 5a __ ADC T4 + 1 
.l11458:
262b : 2c 00 d6 BIT $d600 
262e : 10 fb __ BPL $262b ; (main.l11458 + 0)
.s994:
2630 : 8d 01 d6 STA $d601 
2633 : a9 13 __ LDA #$13
2635 : 8d 00 d6 STA $d600 
.l11460:
2638 : 2c 00 d6 BIT $d600 
263b : 10 fb __ BPL $2638 ; (main.l11460 + 0)
.s999:
263d : 8c 01 d6 STY $d601 
2640 : a9 1f __ LDA #$1f
2642 : 8d 00 d6 STA $d600 
.l11462:
2645 : 2c 00 d6 BIT $d600 
2648 : 10 fb __ BPL $2645 ; (main.l11462 + 0)
.s1003:
264a : a9 09 __ LDA #$09
264c : 8d 01 d6 STA $d601 
264f : a9 18 __ LDA #$18
2651 : 8d 00 d6 STA $d600 
.l11464:
2654 : 2c 00 d6 BIT $d600 
2657 : 10 fb __ BPL $2654 ; (main.l11464 + 0)
.s1009:
2659 : ad 01 d6 LDA $d601 
265c : 29 7f __ AND #$7f
265e : a8 __ __ TAY
265f : a9 18 __ LDA #$18
2661 : 8d 00 d6 STA $d600 
.l11466:
2664 : 2c 00 d6 BIT $d600 
2667 : 10 fb __ BPL $2664 ; (main.l11466 + 0)
.s1015:
2669 : 8c 01 d6 STY $d601 
266c : a9 1e __ LDA #$1e
266e : 8d 00 d6 STA $d600 
.l11468:
2671 : 2c 00 d6 BIT $d600 
2674 : 10 fb __ BPL $2671 ; (main.l11468 + 0)
.s1020:
2676 : a9 45 __ LDA #$45
2678 : 8d 01 d6 STA $d601 
267b : a9 12 __ LDA #$12
267d : 8d 00 d6 STA $d600 
2680 : 8a __ __ TXA
2681 : 18 __ __ CLC
2682 : 69 4b __ ADC #$4b
2684 : aa __ __ TAX
2685 : 90 02 __ BCC $2689 ; (main.s1727 + 0)
.s1726:
2687 : e6 5c __ INC T5 + 1 
.s1727:
2689 : 18 __ __ CLC
268a : 65 57 __ ADC T3 + 0 
268c : a8 __ __ TAY
268d : a5 5c __ LDA T5 + 1 
268f : 65 58 __ ADC T3 + 1 
.l11470:
2691 : 2c 00 d6 BIT $d600 
2694 : 10 fb __ BPL $2691 ; (main.l11470 + 0)
.s1030:
2696 : 8d 01 d6 STA $d601 
2699 : a9 13 __ LDA #$13
269b : 8d 00 d6 STA $d600 
.l11472:
269e : 2c 00 d6 BIT $d600 
26a1 : 10 fb __ BPL $269e ; (main.l11472 + 0)
.s1035:
26a3 : 8c 01 d6 STY $d601 
26a6 : a9 1f __ LDA #$1f
26a8 : 8d 00 d6 STA $d600 
.l11474:
26ab : 2c 00 d6 BIT $d600 
26ae : 10 fb __ BPL $26ab ; (main.l11474 + 0)
.s1039:
26b0 : a9 7b __ LDA #$7b
26b2 : 8d 01 d6 STA $d601 
26b5 : a9 12 __ LDA #$12
26b7 : 8d 00 d6 STA $d600 
26ba : 8a __ __ TXA
26bb : 18 __ __ CLC
26bc : 65 59 __ ADC T4 + 0 
26be : aa __ __ TAX
26bf : a5 5c __ LDA T5 + 1 
26c1 : 65 5a __ ADC T4 + 1 
.l11476:
26c3 : 2c 00 d6 BIT $d600 
26c6 : 10 fb __ BPL $26c3 ; (main.l11476 + 0)
.s1046:
26c8 : 8d 01 d6 STA $d601 
26cb : a9 13 __ LDA #$13
26cd : 8d 00 d6 STA $d600 
.l11478:
26d0 : 2c 00 d6 BIT $d600 
26d3 : 10 fb __ BPL $26d0 ; (main.l11478 + 0)
.s1051:
26d5 : 8e 01 d6 STX $d601 
26d8 : a9 1f __ LDA #$1f
26da : 8d 00 d6 STA $d600 
.l11480:
26dd : 2c 00 d6 BIT $d600 
26e0 : 10 fb __ BPL $26dd ; (main.l11480 + 0)
.s1055:
26e2 : a9 09 __ LDA #$09
26e4 : 8d 01 d6 STA $d601 
26e7 : a0 05 __ LDY #$05
.l1057:
26e9 : 18 __ __ CLC
26ea : a5 54 __ LDA T1 + 0 
26ec : 69 05 __ ADC #$05
26ee : 90 03 __ BCC $26f3 ; (main.s1352 + 0)
26f0 : 4c 16 38 JMP $3816 ; (main.s1058 + 0)
.s1352:
26f3 : 85 57 __ STA T3 + 0 
26f5 : c4 57 __ CPY T3 + 0 
26f7 : b0 03 __ BCS $26fc ; (main.s1056 + 0)
26f9 : 4c 16 38 JMP $3816 ; (main.s1058 + 0)
.s1056:
26fc : ad 23 5a LDA $5a23 ; (vdc_state + 5)
26ff : e9 07 __ SBC #$07
2701 : 85 54 __ STA T1 + 0 
2703 : a0 05 __ LDY #$05
.l1097:
2705 : 18 __ __ CLC
2706 : a5 54 __ LDA T1 + 0 
2708 : 69 05 __ ADC #$05
270a : 90 03 __ BCC $270f ; (main.s1338 + 0)
270c : 4c 96 37 JMP $3796 ; (main.s1098 + 0)
.s1338:
270f : 85 59 __ STA T4 + 0 
2711 : c4 59 __ CPY T4 + 0 
2713 : b0 03 __ BCS $2718 ; (main.s1096 + 0)
2715 : 4c 96 37 JMP $3796 ; (main.s1098 + 0)
.s1096:
2718 : ad 23 5a LDA $5a23 ; (vdc_state + 5)
271b : e9 02 __ SBC #$02
271d : 0a __ __ ASL
271e : a8 __ __ TAY
271f : b9 37 5a LDA $5a37,y ; (multab + 0)
2722 : aa __ __ TAX
2723 : 18 __ __ CLC
2724 : 69 04 __ ADC #$04
2726 : 85 59 __ STA T4 + 0 
2728 : a9 12 __ LDA #$12
272a : 8d 00 d6 STA $d600 
272d : b9 38 5a LDA $5a38,y ; (multab + 1)
2730 : a8 __ __ TAY
2731 : 69 00 __ ADC #$00
2733 : 85 5a __ STA T4 + 1 
2735 : 18 __ __ CLC
2736 : a5 59 __ LDA T4 + 0 
2738 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
273b : 85 5b __ STA T5 + 0 
273d : a5 5a __ LDA T4 + 1 
273f : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11508:
2742 : 2c 00 d6 BIT $d600 
2745 : 10 fb __ BPL $2742 ; (main.l11508 + 0)
.s1145:
2747 : 8d 01 d6 STA $d601 
274a : a9 13 __ LDA #$13
274c : 8d 00 d6 STA $d600 
.l11510:
274f : 2c 00 d6 BIT $d600 
2752 : 10 fb __ BPL $274f ; (main.l11510 + 0)
.s1150:
2754 : a5 5b __ LDA T5 + 0 
2756 : 8d 01 d6 STA $d601 
2759 : a9 1f __ LDA #$1f
275b : 8d 00 d6 STA $d600 
.l11512:
275e : 2c 00 d6 BIT $d600 
2761 : 10 fb __ BPL $275e ; (main.l11512 + 0)
.s1154:
2763 : a9 7c __ LDA #$7c
2765 : 8d 01 d6 STA $d601 
2768 : a9 12 __ LDA #$12
276a : 8d 00 d6 STA $d600 
276d : 18 __ __ CLC
276e : a5 59 __ LDA T4 + 0 
2770 : 6d 28 5a ADC $5a28 ; (vdc_state + 10)
2773 : 85 59 __ STA T4 + 0 
2775 : a5 5a __ LDA T4 + 1 
2777 : 6d 29 5a ADC $5a29 ; (vdc_state + 11)
.l11514:
277a : 2c 00 d6 BIT $d600 
277d : 10 fb __ BPL $277a ; (main.l11514 + 0)
.s1161:
277f : 8d 01 d6 STA $d601 
2782 : a9 13 __ LDA #$13
2784 : 8d 00 d6 STA $d600 
.l11516:
2787 : 2c 00 d6 BIT $d600 
278a : 10 fb __ BPL $2787 ; (main.l11516 + 0)
.s1166:
278c : a5 59 __ LDA T4 + 0 
278e : 8d 01 d6 STA $d601 
2791 : a9 1f __ LDA #$1f
2793 : 8d 00 d6 STA $d600 
.l11518:
2796 : 2c 00 d6 BIT $d600 
2799 : 10 fb __ BPL $2796 ; (main.l11518 + 0)
.s1170:
279b : a9 09 __ LDA #$09
279d : 8d 01 d6 STA $d601 
27a0 : a9 12 __ LDA #$12
27a2 : 8d 00 d6 STA $d600 
27a5 : 8a __ __ TXA
27a6 : 18 __ __ CLC
27a7 : 69 05 __ ADC #$05
27a9 : 85 59 __ STA T4 + 0 
27ab : 98 __ __ TYA
27ac : 69 00 __ ADC #$00
27ae : 85 5a __ STA T4 + 1 
27b0 : 18 __ __ CLC
27b1 : a5 59 __ LDA T4 + 0 
27b3 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
27b6 : 85 5d __ STA T6 + 0 
27b8 : a5 5a __ LDA T4 + 1 
27ba : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11520:
27bd : 2c 00 d6 BIT $d600 
27c0 : 10 fb __ BPL $27bd ; (main.l11520 + 0)
.s1180:
27c2 : 8d 01 d6 STA $d601 
27c5 : a9 13 __ LDA #$13
27c7 : 8d 00 d6 STA $d600 
.l11522:
27ca : 2c 00 d6 BIT $d600 
27cd : 10 fb __ BPL $27ca ; (main.l11522 + 0)
.s1185:
27cf : a5 5d __ LDA T6 + 0 
27d1 : 8d 01 d6 STA $d601 
27d4 : a9 1f __ LDA #$1f
27d6 : 8d 00 d6 STA $d600 
.l11524:
27d9 : 2c 00 d6 BIT $d600 
27dc : 10 fb __ BPL $27d9 ; (main.l11524 + 0)
.s1189:
27de : a9 e2 __ LDA #$e2
27e0 : 8d 01 d6 STA $d601 
27e3 : a9 18 __ LDA #$18
27e5 : 8d 00 d6 STA $d600 
.l11526:
27e8 : 2c 00 d6 BIT $d600 
27eb : 10 fb __ BPL $27e8 ; (main.l11526 + 0)
.s1195:
27ed : ad 01 d6 LDA $d601 
27f0 : 29 7f __ AND #$7f
27f2 : 85 5d __ STA T6 + 0 
27f4 : a9 18 __ LDA #$18
27f6 : 8d 00 d6 STA $d600 
.l11528:
27f9 : 2c 00 d6 BIT $d600 
27fc : 10 fb __ BPL $27f9 ; (main.l11528 + 0)
.s1201:
27fe : a5 5d __ LDA T6 + 0 
2800 : 8d 01 d6 STA $d601 
2803 : a9 1e __ LDA #$1e
2805 : 8d 00 d6 STA $d600 
.l11530:
2808 : 2c 00 d6 BIT $d600 
280b : 10 fb __ BPL $2808 ; (main.l11530 + 0)
.s1206:
280d : a9 45 __ LDA #$45
280f : 8d 01 d6 STA $d601 
2812 : a9 12 __ LDA #$12
2814 : 8d 00 d6 STA $d600 
2817 : 18 __ __ CLC
2818 : a5 59 __ LDA T4 + 0 
281a : 6d 28 5a ADC $5a28 ; (vdc_state + 10)
281d : 85 59 __ STA T4 + 0 
281f : a5 5a __ LDA T4 + 1 
2821 : 6d 29 5a ADC $5a29 ; (vdc_state + 11)
.l11532:
2824 : 2c 00 d6 BIT $d600 
2827 : 10 fb __ BPL $2824 ; (main.l11532 + 0)
.s1213:
2829 : 8d 01 d6 STA $d601 
282c : a9 13 __ LDA #$13
282e : 8d 00 d6 STA $d600 
.l11534:
2831 : 2c 00 d6 BIT $d600 
2834 : 10 fb __ BPL $2831 ; (main.l11534 + 0)
.s1218:
2836 : a5 59 __ LDA T4 + 0 
2838 : 8d 01 d6 STA $d601 
283b : a9 1f __ LDA #$1f
283d : 8d 00 d6 STA $d600 
.l11536:
2840 : 2c 00 d6 BIT $d600 
2843 : 10 fb __ BPL $2840 ; (main.l11536 + 0)
.s1222:
2845 : a9 09 __ LDA #$09
2847 : 8d 01 d6 STA $d601 
284a : a9 18 __ LDA #$18
284c : 8d 00 d6 STA $d600 
.l11538:
284f : 2c 00 d6 BIT $d600 
2852 : 10 fb __ BPL $284f ; (main.l11538 + 0)
.s1228:
2854 : ad 01 d6 LDA $d601 
2857 : 29 7f __ AND #$7f
2859 : 85 59 __ STA T4 + 0 
285b : a9 18 __ LDA #$18
285d : 8d 00 d6 STA $d600 
.l11540:
2860 : 2c 00 d6 BIT $d600 
2863 : 10 fb __ BPL $2860 ; (main.l11540 + 0)
.s1234:
2865 : a5 59 __ LDA T4 + 0 
2867 : 8d 01 d6 STA $d601 
286a : a9 1e __ LDA #$1e
286c : 8d 00 d6 STA $d600 
.l11542:
286f : 2c 00 d6 BIT $d600 
2872 : 10 fb __ BPL $286f ; (main.l11542 + 0)
.s1239:
2874 : a9 45 __ LDA #$45
2876 : 8d 01 d6 STA $d601 
2879 : a9 12 __ LDA #$12
287b : 8d 00 d6 STA $d600 
287e : 8a __ __ TXA
287f : 18 __ __ CLC
2880 : 69 4b __ ADC #$4b
2882 : aa __ __ TAX
2883 : 90 01 __ BCC $2886 ; (main.s1729 + 0)
.s1728:
2885 : c8 __ __ INY
.s1729:
2886 : 18 __ __ CLC
2887 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
288a : 85 57 __ STA T3 + 0 
288c : 98 __ __ TYA
288d : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11544:
2890 : 2c 00 d6 BIT $d600 
2893 : 10 fb __ BPL $2890 ; (main.l11544 + 0)
.s1249:
2895 : 8d 01 d6 STA $d601 
2898 : a9 13 __ LDA #$13
289a : 8d 00 d6 STA $d600 
.l11546:
289d : 2c 00 d6 BIT $d600 
28a0 : 10 fb __ BPL $289d ; (main.l11546 + 0)
.s1254:
28a2 : a5 57 __ LDA T3 + 0 
28a4 : 8d 01 d6 STA $d601 
28a7 : a9 1f __ LDA #$1f
28a9 : 8d 00 d6 STA $d600 
.l11548:
28ac : 2c 00 d6 BIT $d600 
28af : 10 fb __ BPL $28ac ; (main.l11548 + 0)
.s1258:
28b1 : a9 7e __ LDA #$7e
28b3 : 8d 01 d6 STA $d601 
28b6 : a9 12 __ LDA #$12
28b8 : 8d 00 d6 STA $d600 
28bb : 8a __ __ TXA
28bc : 18 __ __ CLC
28bd : 6d 28 5a ADC $5a28 ; (vdc_state + 10)
28c0 : aa __ __ TAX
28c1 : 98 __ __ TYA
28c2 : 6d 29 5a ADC $5a29 ; (vdc_state + 11)
.l11550:
28c5 : 2c 00 d6 BIT $d600 
28c8 : 10 fb __ BPL $28c5 ; (main.l11550 + 0)
.s1265:
28ca : 8d 01 d6 STA $d601 
28cd : a9 13 __ LDA #$13
28cf : 8d 00 d6 STA $d600 
.l11552:
28d2 : 2c 00 d6 BIT $d600 
28d5 : 10 fb __ BPL $28d2 ; (main.l11552 + 0)
.s1270:
28d7 : 8e 01 d6 STX $d601 
28da : a9 1f __ LDA #$1f
28dc : 8d 00 d6 STA $d600 
.l11554:
28df : 2c 00 d6 BIT $d600 
28e2 : 10 fb __ BPL $28df ; (main.l11554 + 0)
.s1274:
28e4 : a9 09 __ LDA #$09
28e6 : 8d 01 d6 STA $d601 
28e9 : ad 08 dc LDA $dc08 
28ec : 8d f4 50 STA $50f4 ; (seed + 0)
28ef : a9 00 __ LDA #$00
28f1 : 8d f5 50 STA $50f5 ; (seed + 1)
28f4 : a9 c8 __ LDA #$c8
28f6 : 85 56 __ STA T2 + 0 
.l1277:
28f8 : a9 00 __ LDA #$00
28fa : 85 16 __ STA P9 
28fc : a9 5b __ LDA #$5b
28fe : 85 17 __ STA P10 
2900 : ad f5 50 LDA $50f5 ; (seed + 1)
2903 : 4a __ __ LSR
2904 : ad f4 50 LDA $50f4 ; (seed + 0)
2907 : 6a __ __ ROR
2908 : aa __ __ TAX
2909 : a9 00 __ LDA #$00
290b : 85 04 __ STA WORK + 1 
290d : 6a __ __ ROR
290e : 4d f4 50 EOR $50f4 ; (seed + 0)
2911 : 85 59 __ STA T4 + 0 
2913 : 8a __ __ TXA
2914 : 4d f5 50 EOR $50f5 ; (seed + 1)
2917 : 85 5a __ STA T4 + 1 
2919 : 4a __ __ LSR
291a : 45 59 __ EOR T4 + 0 
291c : 8d f4 50 STA $50f4 ; (seed + 0)
291f : 85 1b __ STA ACCU + 0 
2921 : 45 5a __ EOR T4 + 1 
2923 : 8d f5 50 STA $50f5 ; (seed + 1)
2926 : 85 1c __ STA ACCU + 1 
2928 : ad 25 5a LDA $5a25 ; (vdc_state + 7)
292b : 29 f0 __ AND #$f0
292d : 85 5b __ STA T5 + 0 
292f : a9 0f __ LDA #$0f
2931 : 85 03 __ STA WORK + 0 
2933 : 20 65 57 JSR $5765 ; (divmod + 0)
2936 : a5 05 __ LDA WORK + 2 
2938 : 38 __ __ SEC
2939 : 65 5b __ ADC T5 + 0 
293b : 8d 25 5a STA $5a25 ; (vdc_state + 7)
293e : 20 ad 51 JSR $51ad ; (generateSentence.s1000 + 0)
2941 : a9 00 __ LDA #$00
2943 : 85 61 __ STA T8 + 0 
2945 : 85 59 __ STA T4 + 0 
2947 : ad 00 5b LDA $5b00 ; (linebuffer + 0)
294a : f0 0c __ BEQ $2958 ; (main.s1287 + 0)
.s1286:
294c : a2 00 __ LDX #$00
.l1712:
294e : bd 01 5b LDA $5b01,x ; (linebuffer + 1)
2951 : e8 __ __ INX
2952 : 09 00 __ ORA #$00
2954 : d0 f8 __ BNE $294e ; (main.l1712 + 0)
.s1713:
2956 : 86 59 __ STX T4 + 0 
.s1287:
2958 : a5 59 __ LDA T4 + 0 
295a : f0 30 __ BEQ $298c ; (main.s1283 + 0)
.s2816:
295c : ae 4d bf LDX $bf4d ; (window + 2)
295f : ca __ __ DEX
2960 : 86 5b __ STX T5 + 0 
2962 : a9 ff __ LDA #$ff
2964 : 85 5e __ STA T6 + 1 
2966 : 85 60 __ STA T7 + 1 
2968 : a9 00 __ LDA #$00
296a : 85 43 __ STA T10 + 0 
.l1292:
296c : a5 61 __ LDA T8 + 0 
296e : c5 59 __ CMP T4 + 0 
2970 : b0 0d __ BCS $297f ; (main.s1295 + 0)
.l1297:
2972 : 24 60 __ BIT T7 + 1 
2974 : 10 09 __ BPL $297f ; (main.s1295 + 0)
.s1296:
2976 : a5 43 __ LDA T10 + 0 
2978 : c9 50 __ CMP #$50
297a : b0 03 __ BCS $297f ; (main.s1295 + 0)
297c : 4c 73 37 JMP $3773 ; (main.s1294 + 0)
.s1295:
297f : a6 43 __ LDX T10 + 0 
2981 : f0 03 __ BEQ $2986 ; (main.s1289 + 0)
2983 : 4c 0d 37 JMP $370d ; (main.s1307 + 0)
.s1289:
2986 : a5 61 __ LDA T8 + 0 
2988 : c5 59 __ CMP T4 + 0 
298a : 90 e6 __ BCC $2972 ; (main.l1297 + 0)
.s1283:
298c : ad 4f bf LDA $bf4f ; (window + 4)
298f : f0 03 __ BEQ $2994 ; (main.s8479 + 0)
2991 : 4c 38 36 JMP $3638 ; (main.s1318 + 0)
.s8479:
2994 : c6 56 __ DEC T2 + 0 
2996 : f0 03 __ BEQ $299b ; (main.s1279 + 0)
2998 : 4c f8 28 JMP $28f8 ; (main.l1277 + 0)
.s1279:
299b : 20 64 45 JSR $4564 ; (getch.s0 + 0)
299e : a9 7f __ LDA #$7f
29a0 : 8d 2b bf STA $bf2b ; (viewport + 0)
29a3 : a9 50 __ LDA #$50
29a5 : 8d 2e bf STA $bf2e ; (viewport + 3)
29a8 : a9 00 __ LDA #$00
29aa : 8d 2c bf STA $bf2c ; (viewport + 1)
29ad : 8d 2f bf STA $bf2f ; (viewport + 4)
29b0 : 8d 31 bf STA $bf31 ; (viewport + 6)
29b3 : 8d 32 bf STA $bf32 ; (viewport + 7)
29b6 : 8d 33 bf STA $bf33 ; (viewport + 8)
29b9 : 8d 34 bf STA $bf34 ; (viewport + 9)
29bc : 8d 35 bf STA $bf35 ; (viewport + 10)
29bf : a9 96 __ LDA #$96
29c1 : 8d 30 bf STA $bf30 ; (viewport + 5)
29c4 : a9 05 __ LDA #$05
29c6 : 85 0f __ STA P2 
29c8 : 85 10 __ STA P3 
29ca : a9 46 __ LDA #$46
29cc : 85 11 __ STA P4 
29ce : a9 20 __ LDA #$20
29d0 : 8d 2d bf STA $bf2d ; (viewport + 2)
29d3 : a9 36 __ LDA #$36
29d5 : 85 0d __ STA P0 
29d7 : a9 bf __ LDA #$bf
29d9 : 85 0e __ STA P1 
29db : ad 23 5a LDA $5a23 ; (vdc_state + 5)
29de : 38 __ __ SEC
29df : e9 07 __ SBC #$07
29e1 : 85 12 __ STA P5 
29e3 : 20 44 51 JSR $5144 ; (vdcwin_init.s0 + 0)
29e6 : ad 34 bf LDA $bf34 ; (viewport + 9)
29e9 : 85 1b __ STA ACCU + 0 
29eb : ad 35 bf LDA $bf35 ; (viewport + 10)
29ee : 85 1c __ STA ACCU + 1 
29f0 : ad 2e bf LDA $bf2e ; (viewport + 3)
29f3 : 85 03 __ STA WORK + 0 
29f5 : ad 2f bf LDA $bf2f ; (viewport + 4)
29f8 : 85 04 __ STA WORK + 1 
29fa : 20 23 57 JSR $5723 ; (mul16 + 0)
29fd : ad 2c bf LDA $bf2c ; (viewport + 1)
2a00 : 18 __ __ CLC
2a01 : 65 05 __ ADC WORK + 2 
2a03 : a8 __ __ TAY
2a04 : ad 2d bf LDA $bf2d ; (viewport + 2)
2a07 : 65 06 __ ADC WORK + 3 
2a09 : aa __ __ TAX
2a0a : 98 __ __ TYA
2a0b : 18 __ __ CLC
2a0c : 6d 32 bf ADC $bf32 ; (viewport + 7)
2a0f : 85 54 __ STA T1 + 0 
2a11 : 8a __ __ TXA
2a12 : 6d 33 bf ADC $bf33 ; (viewport + 8)
2a15 : ac 3d bf LDY $bf3d ; (viewport + 18)
2a18 : ae 3c bf LDX $bf3c ; (viewport + 17)
2a1b : 4c 41 2a JMP $2a41 ; (main.l1368 + 0)
.s1369:
2a1e : 86 0d __ STX P0 
2a20 : 84 0e __ STY P1 
2a22 : 20 bb 13 JSR $13bb ; (bnk_cpytovdc@proxy + 0)
2a25 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2a28 : 18 __ __ CLC
2a29 : 65 0d __ ADC P0 
2a2b : aa __ __ TAX
2a2c : ad 22 5a LDA $5a22 ; (vdc_state + 4)
2a2f : 65 0e __ ADC P1 
2a31 : a8 __ __ TAY
2a32 : 18 __ __ CLC
2a33 : a5 54 __ LDA T1 + 0 
2a35 : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
2a38 : 85 54 __ STA T1 + 0 
2a3a : a5 55 __ LDA T1 + 1 
2a3c : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
2a3f : e6 56 __ INC T2 + 0 
.l1368:
2a41 : 85 55 __ STA T1 + 1 
2a43 : a5 56 __ LDA T2 + 0 
2a45 : cd 39 bf CMP $bf39 ; (viewport + 14)
2a48 : 90 d4 __ BCC $2a1e ; (main.s1369 + 0)
.s1371:
2a4a : ad 2e bf LDA $bf2e ; (viewport + 3)
2a4d : 85 03 __ STA WORK + 0 
2a4f : ad 2f bf LDA $bf2f ; (viewport + 4)
2a52 : 85 04 __ STA WORK + 1 
2a54 : ad 34 bf LDA $bf34 ; (viewport + 9)
2a57 : 85 1b __ STA ACCU + 0 
2a59 : ad 35 bf LDA $bf35 ; (viewport + 10)
2a5c : 85 1c __ STA ACCU + 1 
2a5e : 20 23 57 JSR $5723 ; (mul16 + 0)
2a61 : ad 2c bf LDA $bf2c ; (viewport + 1)
2a64 : 18 __ __ CLC
2a65 : 65 05 __ ADC WORK + 2 
2a67 : a8 __ __ TAY
2a68 : ad 2d bf LDA $bf2d ; (viewport + 2)
2a6b : 65 06 __ ADC WORK + 3 
2a6d : aa __ __ TAX
2a6e : 98 __ __ TYA
2a6f : 18 __ __ CLC
2a70 : 6d 32 bf ADC $bf32 ; (viewport + 7)
2a73 : 85 57 __ STA T3 + 0 
2a75 : 8a __ __ TXA
2a76 : 6d 33 bf ADC $bf33 ; (viewport + 8)
2a79 : 85 58 __ STA T3 + 1 
2a7b : ad 30 bf LDA $bf30 ; (viewport + 5)
2a7e : 85 1b __ STA ACCU + 0 
2a80 : ad 31 bf LDA $bf31 ; (viewport + 6)
2a83 : 85 1c __ STA ACCU + 1 
2a85 : ad 2e bf LDA $bf2e ; (viewport + 3)
2a88 : 85 03 __ STA WORK + 0 
2a8a : ad 2f bf LDA $bf2f ; (viewport + 4)
2a8d : 85 04 __ STA WORK + 1 
2a8f : 20 23 57 JSR $5723 ; (mul16 + 0)
2a92 : 18 __ __ CLC
2a93 : a5 57 __ LDA T3 + 0 
2a95 : 65 05 __ ADC WORK + 2 
2a97 : aa __ __ TAX
2a98 : a5 58 __ LDA T3 + 1 
2a9a : 65 06 __ ADC WORK + 3 
2a9c : a8 __ __ TAY
2a9d : 8a __ __ TXA
2a9e : 18 __ __ CLC
2a9f : 69 30 __ ADC #$30
2aa1 : 85 54 __ STA T1 + 0 
2aa3 : 90 01 __ BCC $2aa6 ; (main.s1731 + 0)
.s1730:
2aa5 : c8 __ __ INY
.s1731:
2aa6 : 84 55 __ STY T1 + 1 
2aa8 : a9 00 __ LDA #$00
2aaa : 85 56 __ STA T2 + 0 
2aac : ac 3f bf LDY $bf3f ; (viewport + 20)
2aaf : ae 3e bf LDX $bf3e ; (viewport + 19)
2ab2 : 4c dc 2a JMP $2adc ; (main.l1372 + 0)
.s1373:
2ab5 : 86 0d __ STX P0 
2ab7 : 84 0e __ STY P1 
2ab9 : 20 bb 13 JSR $13bb ; (bnk_cpytovdc@proxy + 0)
2abc : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2abf : 18 __ __ CLC
2ac0 : 65 0d __ ADC P0 
2ac2 : aa __ __ TAX
2ac3 : ad 22 5a LDA $5a22 ; (vdc_state + 4)
2ac6 : 65 0e __ ADC P1 
2ac8 : a8 __ __ TAY
2ac9 : 18 __ __ CLC
2aca : a5 54 __ LDA T1 + 0 
2acc : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
2acf : 85 54 __ STA T1 + 0 
2ad1 : a5 55 __ LDA T1 + 1 
2ad3 : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
2ad6 : 85 55 __ STA T1 + 1 
2ad8 : e6 56 __ INC T2 + 0 
2ada : a5 56 __ LDA T2 + 0 
.l1372:
2adc : cd 39 bf CMP $bf39 ; (viewport + 14)
2adf : 90 d4 __ BCC $2ab5 ; (main.s1373 + 0)
.l1376:
2ae1 : 20 64 45 JSR $4564 ; (getch.s0 + 0)
2ae4 : a9 00 __ LDA #$00
2ae6 : 85 56 __ STA T2 + 0 
2ae8 : a5 1b __ LDA ACCU + 0 
2aea : 85 54 __ STA T1 + 0 
2aec : c9 57 __ CMP #$57
2aee : f0 04 __ BEQ $2af4 ; (main.s1381 + 0)
.s1382:
2af0 : c9 91 __ CMP #$91
2af2 : d0 11 __ BNE $2b05 ; (main.s1380 + 0)
.s1381:
2af4 : ad 34 bf LDA $bf34 ; (viewport + 9)
2af7 : 0d 35 bf ORA $bf35 ; (viewport + 10)
2afa : f0 09 __ BEQ $2b05 ; (main.s1380 + 0)
.s1378:
2afc : a9 08 __ LDA #$08
2afe : 85 56 __ STA T2 + 0 
2b00 : a5 1b __ LDA ACCU + 0 
2b02 : 4c 0b 2b JMP $2b0b ; (main.s1387 + 0)
.s1380:
2b05 : a5 1b __ LDA ACCU + 0 
2b07 : c9 53 __ CMP #$53
2b09 : f0 04 __ BEQ $2b0f ; (main.s1386 + 0)
.s1387:
2b0b : c9 11 __ CMP #$11
2b0d : d0 2c __ BNE $2b3b ; (main.s1385 + 0)
.s1386:
2b0f : 38 __ __ SEC
2b10 : a9 96 __ LDA #$96
2b12 : ed 23 5a SBC $5a23 ; (vdc_state + 5)
2b15 : aa __ __ TAX
2b16 : a9 00 __ LDA #$00
2b18 : ed 24 5a SBC $5a24 ; (vdc_state + 6)
2b1b : a8 __ __ TAY
2b1c : 8a __ __ TXA
2b1d : 18 __ __ CLC
2b1e : 69 06 __ ADC #$06
2b20 : 85 57 __ STA T3 + 0 
2b22 : 90 01 __ BCC $2b25 ; (main.s1733 + 0)
.s1732:
2b24 : c8 __ __ INY
.s1733:
2b25 : 84 58 __ STY T3 + 1 
2b27 : ad 35 bf LDA $bf35 ; (viewport + 10)
2b2a : c5 58 __ CMP T3 + 1 
2b2c : d0 05 __ BNE $2b33 ; (main.s1237 + 0)
.s1236:
2b2e : ad 34 bf LDA $bf34 ; (viewport + 9)
2b31 : c5 57 __ CMP T3 + 0 
.s1237:
2b33 : b0 06 __ BCS $2b3b ; (main.s1385 + 0)
.s1383:
2b35 : a5 56 __ LDA T2 + 0 
2b37 : 09 04 __ ORA #$04
2b39 : 85 56 __ STA T2 + 0 
.s1385:
2b3b : a5 1b __ LDA ACCU + 0 
2b3d : c9 41 __ CMP #$41
2b3f : f0 04 __ BEQ $2b45 ; (main.s1391 + 0)
.s1392:
2b41 : c9 9d __ CMP #$9d
2b43 : d0 0e __ BNE $2b53 ; (main.s1390 + 0)
.s1391:
2b45 : ad 32 bf LDA $bf32 ; (viewport + 7)
2b48 : 0d 33 bf ORA $bf33 ; (viewport + 8)
2b4b : f0 06 __ BEQ $2b53 ; (main.s1390 + 0)
.s1388:
2b4d : a5 56 __ LDA T2 + 0 
2b4f : 09 01 __ ORA #$01
2b51 : 85 56 __ STA T2 + 0 
.s1390:
2b53 : a5 1b __ LDA ACCU + 0 
2b55 : c9 44 __ CMP #$44
2b57 : f0 04 __ BEQ $2b5d ; (main.s1396 + 0)
.s1397:
2b59 : c9 1d __ CMP #$1d
2b5b : d0 15 __ BNE $2b72 ; (main.s1395 + 0)
.s1396:
2b5d : ad 33 bf LDA $bf33 ; (viewport + 8)
2b60 : d0 10 __ BNE $2b72 ; (main.s1395 + 0)
.s1227:
2b62 : ad 32 bf LDA $bf32 ; (viewport + 7)
2b65 : c9 09 __ CMP #$09
2b67 : b0 09 __ BCS $2b72 ; (main.s1395 + 0)
.s1393:
2b69 : a5 56 __ LDA T2 + 0 
2b6b : 09 02 __ ORA #$02
2b6d : 85 56 __ STA T2 + 0 
2b6f : 4c b5 2c JMP $2cb5 ; (main.s1398 + 0)
.s1395:
2b72 : a5 56 __ LDA T2 + 0 
2b74 : f0 03 __ BEQ $2b79 ; (main.s1400 + 0)
2b76 : 4c b5 2c JMP $2cb5 ; (main.s1398 + 0)
.s1400:
2b79 : a5 54 __ LDA T1 + 0 
2b7b : c9 1b __ CMP #$1b
2b7d : f0 07 __ BEQ $2b86 ; (main.s842 + 0)
.s2499:
2b7f : c9 03 __ CMP #$03
2b81 : f0 03 __ BEQ $2b86 ; (main.s842 + 0)
2b83 : 4c e1 2a JMP $2ae1 ; (main.l1376 + 0)
.s842:
2b86 : e6 53 __ INC T0 + 0 
2b88 : a5 53 __ LDA T0 + 0 
2b8a : c9 03 __ CMP #$03
2b8c : b0 03 __ BCS $2b91 ; (main.s843 + 0)
2b8e : 4c a3 23 JMP $23a3 ; (main.l841 + 0)
.s843:
2b91 : a9 00 __ LDA #$00
2b93 : 8d 30 d0 STA $d030 
2b96 : 85 13 __ STA P6 
2b98 : ad 11 d0 LDA $d011 
2b9b : 29 7f __ AND #$7f
2b9d : 09 10 __ ORA #$10
2b9f : 8d 11 d0 STA $d011 
2ba2 : 20 54 46 JSR $4654 ; (vdc_set_mode.s1000 + 0)
2ba5 : a9 00 __ LDA #$00
2ba7 : 85 53 __ STA T0 + 0 
2ba9 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2bac : 85 54 __ STA T1 + 0 
2bae : ad 23 5a LDA $5a23 ; (vdc_state + 5)
2bb1 : 85 57 __ STA T3 + 0 
.l2507:
2bb3 : a5 53 __ LDA T0 + 0 
2bb5 : c5 57 __ CMP T3 + 0 
2bb7 : 90 21 __ BCC $2bda ; (main.s2508 + 0)
.s2505:
2bb9 : a9 04 __ LDA #$04
2bbb : 8d 06 d5 STA $d506 
2bbe : a9 00 __ LDA #$00
2bc0 : 85 1b __ STA ACCU + 0 
2bc2 : 85 1c __ STA ACCU + 1 
.s1001:
2bc4 : 18 __ __ CLC
2bc5 : a5 23 __ LDA SP + 0 
2bc7 : 69 0e __ ADC #$0e
2bc9 : 85 23 __ STA SP + 0 
2bcb : 90 02 __ BCC $2bcf ; (main.s1001 + 11)
2bcd : e6 24 __ INC SP + 1 
2bcf : a2 10 __ LDX #$10
2bd1 : bd 97 be LDA $be97,x ; (main@stack + 0)
2bd4 : 95 53 __ STA T0 + 0,x 
2bd6 : ca __ __ DEX
2bd7 : 10 f8 __ BPL $2bd1 ; (main.s1001 + 13)
2bd9 : 60 __ __ RTS
.s2508:
2bda : 0a __ __ ASL
2bdb : aa __ __ TAX
2bdc : ad 25 5a LDA $5a25 ; (vdc_state + 7)
2bdf : 85 56 __ STA T2 + 0 
2be1 : a9 12 __ LDA #$12
2be3 : 8d 00 d6 STA $d600 
2be6 : a5 54 __ LDA T1 + 0 
2be8 : 38 __ __ SEC
2be9 : e9 01 __ SBC #$01
2beb : 85 5d __ STA T6 + 0 
2bed : bd 37 5a LDA $5a37,x ; (multab + 0)
2bf0 : 85 59 __ STA T4 + 0 
2bf2 : 18 __ __ CLC
2bf3 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
2bf6 : a8 __ __ TAY
2bf7 : bd 38 5a LDA $5a38,x ; (multab + 1)
2bfa : 85 5a __ STA T4 + 1 
2bfc : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11775:
2bff : 2c 00 d6 BIT $d600 
2c02 : 10 fb __ BPL $2bff ; (main.l11775 + 0)
.s2520:
2c04 : 8d 01 d6 STA $d601 
2c07 : a9 13 __ LDA #$13
2c09 : 8d 00 d6 STA $d600 
.l11777:
2c0c : 2c 00 d6 BIT $d600 
2c0f : 10 fb __ BPL $2c0c ; (main.l11777 + 0)
.s2525:
2c11 : 8c 01 d6 STY $d601 
2c14 : a9 1f __ LDA #$1f
2c16 : 8d 00 d6 STA $d600 
.l11779:
2c19 : 2c 00 d6 BIT $d600 
2c1c : 10 fb __ BPL $2c19 ; (main.l11779 + 0)
.s2529:
2c1e : a9 20 __ LDA #$20
2c20 : 8d 01 d6 STA $d601 
2c23 : a9 18 __ LDA #$18
2c25 : 8d 00 d6 STA $d600 
.l11781:
2c28 : 2c 00 d6 BIT $d600 
2c2b : 10 fb __ BPL $2c28 ; (main.l11781 + 0)
.s2535:
2c2d : ad 01 d6 LDA $d601 
2c30 : 29 7f __ AND #$7f
2c32 : a8 __ __ TAY
2c33 : a9 18 __ LDA #$18
2c35 : 8d 00 d6 STA $d600 
.l11783:
2c38 : 2c 00 d6 BIT $d600 
2c3b : 10 fb __ BPL $2c38 ; (main.l11783 + 0)
.s2541:
2c3d : 8c 01 d6 STY $d601 
2c40 : a9 1e __ LDA #$1e
2c42 : 8d 00 d6 STA $d600 
.l11785:
2c45 : 2c 00 d6 BIT $d600 
2c48 : 10 fb __ BPL $2c45 ; (main.l11785 + 0)
.s2546:
2c4a : a5 5d __ LDA T6 + 0 
2c4c : 8d 01 d6 STA $d601 
2c4f : ad 28 5a LDA $5a28 ; (vdc_state + 10)
2c52 : 18 __ __ CLC
2c53 : 65 59 __ ADC T4 + 0 
2c55 : aa __ __ TAX
2c56 : a9 12 __ LDA #$12
2c58 : 8d 00 d6 STA $d600 
2c5b : ad 29 5a LDA $5a29 ; (vdc_state + 11)
2c5e : 65 5a __ ADC T4 + 1 
.l11787:
2c60 : 2c 00 d6 BIT $d600 
2c63 : 10 fb __ BPL $2c60 ; (main.l11787 + 0)
.s2553:
2c65 : 8d 01 d6 STA $d601 
2c68 : a9 13 __ LDA #$13
2c6a : 8d 00 d6 STA $d600 
.l11789:
2c6d : 2c 00 d6 BIT $d600 
2c70 : 10 fb __ BPL $2c6d ; (main.l11789 + 0)
.s2558:
2c72 : 8e 01 d6 STX $d601 
2c75 : a9 1f __ LDA #$1f
2c77 : 8d 00 d6 STA $d600 
.l11791:
2c7a : 2c 00 d6 BIT $d600 
2c7d : 10 fb __ BPL $2c7a ; (main.l11791 + 0)
.s2562:
2c7f : a5 56 __ LDA T2 + 0 
2c81 : 8d 01 d6 STA $d601 
2c84 : a9 18 __ LDA #$18
2c86 : 8d 00 d6 STA $d600 
.l11793:
2c89 : 2c 00 d6 BIT $d600 
2c8c : 10 fb __ BPL $2c89 ; (main.l11793 + 0)
.s2568:
2c8e : ad 01 d6 LDA $d601 
2c91 : 29 7f __ AND #$7f
2c93 : aa __ __ TAX
2c94 : a9 18 __ LDA #$18
2c96 : 8d 00 d6 STA $d600 
.l11795:
2c99 : 2c 00 d6 BIT $d600 
2c9c : 10 fb __ BPL $2c99 ; (main.l11795 + 0)
.s2574:
2c9e : 8e 01 d6 STX $d601 
2ca1 : a9 1e __ LDA #$1e
2ca3 : 8d 00 d6 STA $d600 
.l11797:
2ca6 : 2c 00 d6 BIT $d600 
2ca9 : 10 fb __ BPL $2ca6 ; (main.l11797 + 0)
.s2579:
2cab : a5 5d __ LDA T6 + 0 
2cad : 8d 01 d6 STA $d601 
2cb0 : e6 53 __ INC T0 + 0 
2cb2 : 4c b3 2b JMP $2bb3 ; (main.l2507 + 0)
.s1398:
2cb5 : a2 15 __ LDX #$15
.l1041:
2cb7 : bd 2a bf LDA $bf2a,x ; (softscroll + 15)
2cba : 9d a9 be STA $bea9,x ; (main@stack + 18)
2cbd : ca __ __ DEX
2cbe : d0 f7 __ BNE $2cb7 ; (main.l1041 + 0)
.s1042:
2cc0 : a5 56 __ LDA T2 + 0 
2cc2 : 4a __ __ LSR
2cc3 : 90 4e __ BCC $2d13 ; (main.s11651 + 0)
.s1402:
2cc5 : 86 61 __ STX T8 + 0 
2cc7 : ae 38 bf LDX $bf38 ; (viewport + 13)
2cca : ca __ __ DEX
2ccb : 86 57 __ STX T3 + 0 
2ccd : ad 3c bf LDA $bf3c ; (viewport + 17)
2cd0 : 85 59 __ STA T4 + 0 
2cd2 : ad 3d bf LDA $bf3d ; (viewport + 18)
2cd5 : 85 5a __ STA T4 + 1 
2cd7 : ad 3e bf LDA $bf3e ; (viewport + 19)
2cda : 85 5b __ STA T5 + 0 
2cdc : ad 3f bf LDA $bf3f ; (viewport + 20)
.l1406:
2cdf : 85 5c __ STA T5 + 1 
2ce1 : a5 61 __ LDA T8 + 0 
2ce3 : cd 39 bf CMP $bf39 ; (viewport + 14)
2ce6 : b0 03 __ BCS $2ceb ; (main.s1405 + 0)
2ce8 : 4c ef 33 JMP $33ef ; (main.s1407 + 0)
.s1405:
2ceb : a9 01 __ LDA #$01
2ced : 85 11 __ STA P4 
2cef : ad 39 bf LDA $bf39 ; (viewport + 14)
2cf2 : 85 12 __ STA P5 
2cf4 : ad b1 be LDA $beb1 ; (vp_fill + 7)
2cf7 : 18 __ __ CLC
2cf8 : 69 ff __ ADC #$ff
2cfa : 8d b1 be STA $beb1 ; (vp_fill + 7)
2cfd : b0 03 __ BCS $2d02 ; (main.s1735 + 0)
.s1734:
2cff : ce b2 be DEC $beb2 ; (vp_fill + 8)
.s1735:
2d02 : ad 32 bf LDA $bf32 ; (viewport + 7)
2d05 : 18 __ __ CLC
2d06 : 69 ff __ ADC #$ff
2d08 : 8d 32 bf STA $bf32 ; (viewport + 7)
2d0b : b0 03 __ BCS $2d10 ; (main.s1737 + 0)
.s1736:
2d0d : ce 33 bf DEC $bf33 ; (viewport + 8)
.s1737:
2d10 : 20 bf 50 JSR $50bf ; (vdcwin_init@proxy + 0)
.s11651:
2d13 : a5 56 __ LDA T2 + 0 
2d15 : 29 02 __ AND #$02
2d17 : f0 64 __ BEQ $2d7d ; (main.s11711 + 0)
.s1763:
2d19 : ae 38 bf LDX $bf38 ; (viewport + 13)
2d1c : ca __ __ DEX
2d1d : 86 57 __ STX T3 + 0 
2d1f : a9 00 __ LDA #$00
2d21 : 85 61 __ STA T8 + 0 
2d23 : ad 3c bf LDA $bf3c ; (viewport + 17)
2d26 : 85 59 __ STA T4 + 0 
2d28 : ad 3d bf LDA $bf3d ; (viewport + 18)
2d2b : 85 5a __ STA T4 + 1 
2d2d : ad 3e bf LDA $bf3e ; (viewport + 19)
2d30 : 85 5b __ STA T5 + 0 
2d32 : ad 3f bf LDA $bf3f ; (viewport + 20)
.l1767:
2d35 : 85 5c __ STA T5 + 1 
2d37 : a5 61 __ LDA T8 + 0 
2d39 : cd 39 bf CMP $bf39 ; (viewport + 14)
2d3c : b0 03 __ BCS $2d41 ; (main.s1766 + 0)
2d3e : 4c a5 31 JMP $31a5 ; (main.s1768 + 0)
.s1766:
2d41 : a9 01 __ LDA #$01
2d43 : 85 11 __ STA P4 
2d45 : ad 39 bf LDA $bf39 ; (viewport + 14)
2d48 : 85 12 __ STA P5 
2d4a : ad b1 be LDA $beb1 ; (vp_fill + 7)
2d4d : 18 __ __ CLC
2d4e : 6d 38 bf ADC $bf38 ; (viewport + 13)
2d51 : 8d b1 be STA $beb1 ; (vp_fill + 7)
2d54 : 90 03 __ BCC $2d59 ; (main.s1739 + 0)
.s1738:
2d56 : ee b2 be INC $beb2 ; (vp_fill + 8)
.s1739:
2d59 : ee 32 bf INC $bf32 ; (viewport + 7)
2d5c : d0 03 __ BNE $2d61 ; (main.s1741 + 0)
.s1740:
2d5e : ee 33 bf INC $bf33 ; (viewport + 8)
.s1741:
2d61 : a9 b5 __ LDA #$b5
2d63 : 85 0d __ STA P0 
2d65 : a9 be __ LDA #$be
2d67 : 85 0e __ STA P1 
2d69 : ad 36 bf LDA $bf36 ; (viewport + 11)
2d6c : 18 __ __ CLC
2d6d : 6d 38 bf ADC $bf38 ; (viewport + 13)
2d70 : 38 __ __ SEC
2d71 : e9 01 __ SBC #$01
2d73 : 85 0f __ STA P2 
2d75 : ad 37 bf LDA $bf37 ; (viewport + 12)
2d78 : 85 10 __ STA P3 
2d7a : 20 44 51 JSR $5144 ; (vdcwin_init.s0 + 0)
.s11711:
2d7d : a5 56 __ LDA T2 + 0 
2d7f : 29 08 __ AND #$08
2d81 : f0 76 __ BEQ $2df9 ; (main.s11741 + 0)
.s2124:
2d83 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2d86 : 85 59 __ STA T4 + 0 
2d88 : 85 1b __ STA ACCU + 0 
2d8a : ad 22 5a LDA $5a22 ; (vdc_state + 4)
2d8d : 85 5a __ STA T4 + 1 
2d8f : 85 1c __ STA ACCU + 1 
2d91 : ad 39 bf LDA $bf39 ; (viewport + 14)
2d94 : 20 03 57 JSR $5703 ; (mul16by8 + 0)
2d97 : ad 3c bf LDA $bf3c ; (viewport + 17)
2d9a : 18 __ __ CLC
2d9b : 65 05 __ ADC WORK + 2 
2d9d : 85 5b __ STA T5 + 0 
2d9f : ad 3d bf LDA $bf3d ; (viewport + 18)
2da2 : 65 06 __ ADC WORK + 3 
2da4 : 85 5c __ STA T5 + 1 
2da6 : ad 3e bf LDA $bf3e ; (viewport + 19)
2da9 : 18 __ __ CLC
2daa : 65 05 __ ADC WORK + 2 
2dac : a8 __ __ TAY
2dad : ad 3f bf LDA $bf3f ; (viewport + 20)
2db0 : 65 06 __ ADC WORK + 3 
2db2 : 85 58 __ STA T3 + 1 
2db4 : a9 00 __ LDA #$00
2db6 : 85 61 __ STA T8 + 0 
2db8 : ad 38 bf LDA $bf38 ; (viewport + 13)
2dbb : 85 43 __ STA T10 + 0 
.l2128:
2dbd : ad 39 bf LDA $bf39 ; (viewport + 14)
2dc0 : 38 __ __ SEC
2dc1 : e9 01 __ SBC #$01
2dc3 : b0 03 __ BCS $2dc8 ; (main.s1105 + 0)
2dc5 : 4c 8f 30 JMP $308f ; (main.s2129 + 0)
.s1105:
2dc8 : c5 61 __ CMP T8 + 0 
2dca : 90 05 __ BCC $2dd1 ; (main.s2127 + 0)
.s1742:
2dcc : f0 03 __ BEQ $2dd1 ; (main.s2127 + 0)
2dce : 4c 8f 30 JMP $308f ; (main.s2129 + 0)
.s2127:
2dd1 : a9 01 __ LDA #$01
2dd3 : 85 12 __ STA P5 
2dd5 : ad b3 be LDA $beb3 ; (vp_fill + 9)
2dd8 : 18 __ __ CLC
2dd9 : 69 ff __ ADC #$ff
2ddb : 8d b3 be STA $beb3 ; (vp_fill + 9)
2dde : b0 03 __ BCS $2de3 ; (main.s1744 + 0)
.s1743:
2de0 : ce b4 be DEC $beb4 ; (vp_fill + 10)
.s1744:
2de3 : ad 34 bf LDA $bf34 ; (viewport + 9)
2de6 : 18 __ __ CLC
2de7 : 69 ff __ ADC #$ff
2de9 : 8d 34 bf STA $bf34 ; (viewport + 9)
2dec : b0 03 __ BCS $2df1 ; (main.s1746 + 0)
.s1745:
2dee : ce 35 bf DEC $bf35 ; (viewport + 10)
.s1746:
2df1 : ad 38 bf LDA $bf38 ; (viewport + 13)
2df4 : 85 11 __ STA P4 
2df6 : 20 bf 50 JSR $50bf ; (vdcwin_init@proxy + 0)
.s11741:
2df9 : a5 56 __ LDA T2 + 0 
2dfb : 29 04 __ AND #$04
2dfd : f0 75 __ BEQ $2e74 ; (main.s2309 + 0)
.s2307:
2dff : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2e02 : 85 57 __ STA T3 + 0 
2e04 : ad 22 5a LDA $5a22 ; (vdc_state + 4)
2e07 : 85 58 __ STA T3 + 1 
2e09 : ad 38 bf LDA $bf38 ; (viewport + 13)
2e0c : 85 61 __ STA T8 + 0 
2e0e : ad 3c bf LDA $bf3c ; (viewport + 17)
2e11 : 85 59 __ STA T4 + 0 
2e13 : ad 3d bf LDA $bf3d ; (viewport + 18)
2e16 : 85 5a __ STA T4 + 1 
2e18 : ad 3e bf LDA $bf3e ; (viewport + 19)
2e1b : 85 5b __ STA T5 + 0 
2e1d : ad 3f bf LDA $bf3f ; (viewport + 20)
2e20 : a0 00 __ LDY #$00
.l2311:
2e22 : 85 5c __ STA T5 + 1 
2e24 : ad 39 bf LDA $bf39 ; (viewport + 14)
2e27 : 38 __ __ SEC
2e28 : e9 01 __ SBC #$01
2e2a : b0 03 __ BCS $2e2f ; (main.s1075 + 0)
2e2c : 4c 78 2f JMP $2f78 ; (main.s2312 + 0)
.s1075:
2e2f : 85 5f __ STA T7 + 0 
2e31 : c4 5f __ CPY T7 + 0 
2e33 : b0 03 __ BCS $2e38 ; (main.s2310 + 0)
2e35 : 4c 78 2f JMP $2f78 ; (main.s2312 + 0)
.s2310:
2e38 : a9 01 __ LDA #$01
2e3a : 85 12 __ STA P5 
2e3c : ad b3 be LDA $beb3 ; (vp_fill + 9)
2e3f : 18 __ __ CLC
2e40 : 6d 39 bf ADC $bf39 ; (viewport + 14)
2e43 : 8d b3 be STA $beb3 ; (vp_fill + 9)
2e46 : 90 03 __ BCC $2e4b ; (main.s1748 + 0)
.s1747:
2e48 : ee b4 be INC $beb4 ; (vp_fill + 10)
.s1748:
2e4b : ee 34 bf INC $bf34 ; (viewport + 9)
2e4e : d0 03 __ BNE $2e53 ; (main.s1750 + 0)
.s1749:
2e50 : ee 35 bf INC $bf35 ; (viewport + 10)
.s1750:
2e53 : a9 b5 __ LDA #$b5
2e55 : 85 0d __ STA P0 
2e57 : a9 be __ LDA #$be
2e59 : 85 0e __ STA P1 
2e5b : ad 36 bf LDA $bf36 ; (viewport + 11)
2e5e : 85 0f __ STA P2 
2e60 : ad 37 bf LDA $bf37 ; (viewport + 12)
2e63 : 18 __ __ CLC
2e64 : 6d 39 bf ADC $bf39 ; (viewport + 14)
2e67 : 38 __ __ SEC
2e68 : e9 01 __ SBC #$01
2e6a : 85 10 __ STA P3 
2e6c : ad 38 bf LDA $bf38 ; (viewport + 13)
2e6f : 85 11 __ STA P4 
2e71 : 20 44 51 JSR $5144 ; (vdcwin_init.s0 + 0)
.s2309:
2e74 : ad b3 be LDA $beb3 ; (vp_fill + 9)
2e77 : 85 1b __ STA ACCU + 0 
2e79 : ad b4 be LDA $beb4 ; (vp_fill + 10)
2e7c : 85 1c __ STA ACCU + 1 
2e7e : ad ad be LDA $bead ; (vp_fill + 3)
2e81 : 85 03 __ STA WORK + 0 
2e83 : ad ae be LDA $beae ; (vp_fill + 4)
2e86 : 85 04 __ STA WORK + 1 
2e88 : 20 23 57 JSR $5723 ; (mul16 + 0)
2e8b : ad ab be LDA $beab ; (vp_fill + 1)
2e8e : 18 __ __ CLC
2e8f : 65 05 __ ADC WORK + 2 
2e91 : a8 __ __ TAY
2e92 : ad ac be LDA $beac ; (vp_fill + 2)
2e95 : 65 06 __ ADC WORK + 3 
2e97 : aa __ __ TAX
2e98 : 98 __ __ TYA
2e99 : 18 __ __ CLC
2e9a : 6d b1 be ADC $beb1 ; (vp_fill + 7)
2e9d : 85 57 __ STA T3 + 0 
2e9f : 8a __ __ TXA
2ea0 : 6d b2 be ADC $beb2 ; (vp_fill + 8)
2ea3 : 85 58 __ STA T3 + 1 
2ea5 : a9 00 __ LDA #$00
2ea7 : 85 56 __ STA T2 + 0 
2ea9 : ac bc be LDY $bebc ; (vp_fill + 18)
2eac : ae bb be LDX $bebb ; (vp_fill + 17)
2eaf : 4c d9 2e JMP $2ed9 ; (main.l2491 + 0)
.s2492:
2eb2 : 86 0d __ STX P0 
2eb4 : 84 0e __ STY P1 
2eb6 : 20 d0 14 JSR $14d0 ; (bnk_cpytovdc@proxy + 0)
2eb9 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2ebc : 18 __ __ CLC
2ebd : 65 0d __ ADC P0 
2ebf : aa __ __ TAX
2ec0 : ad 22 5a LDA $5a22 ; (vdc_state + 4)
2ec3 : 65 0e __ ADC P1 
2ec5 : a8 __ __ TAY
2ec6 : 18 __ __ CLC
2ec7 : a5 57 __ LDA T3 + 0 
2ec9 : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
2ecc : 85 57 __ STA T3 + 0 
2ece : a5 58 __ LDA T3 + 1 
2ed0 : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
2ed3 : 85 58 __ STA T3 + 1 
2ed5 : e6 56 __ INC T2 + 0 
2ed7 : a5 56 __ LDA T2 + 0 
.l2491:
2ed9 : cd b8 be CMP $beb8 ; (vp_fill + 14)
2edc : 90 d4 __ BCC $2eb2 ; (main.s2492 + 0)
.s2494:
2ede : ad ad be LDA $bead ; (vp_fill + 3)
2ee1 : 85 03 __ STA WORK + 0 
2ee3 : ad ae be LDA $beae ; (vp_fill + 4)
2ee6 : 85 04 __ STA WORK + 1 
2ee8 : ad b3 be LDA $beb3 ; (vp_fill + 9)
2eeb : 85 1b __ STA ACCU + 0 
2eed : ad b4 be LDA $beb4 ; (vp_fill + 10)
2ef0 : 85 1c __ STA ACCU + 1 
2ef2 : 20 23 57 JSR $5723 ; (mul16 + 0)
2ef5 : ad ab be LDA $beab ; (vp_fill + 1)
2ef8 : 18 __ __ CLC
2ef9 : 65 05 __ ADC WORK + 2 
2efb : a8 __ __ TAY
2efc : ad ac be LDA $beac ; (vp_fill + 2)
2eff : 65 06 __ ADC WORK + 3 
2f01 : aa __ __ TAX
2f02 : 98 __ __ TYA
2f03 : 18 __ __ CLC
2f04 : 6d b1 be ADC $beb1 ; (vp_fill + 7)
2f07 : 85 59 __ STA T4 + 0 
2f09 : 8a __ __ TXA
2f0a : 6d b2 be ADC $beb2 ; (vp_fill + 8)
2f0d : 85 5a __ STA T4 + 1 
2f0f : ad af be LDA $beaf ; (vp_fill + 5)
2f12 : 85 1b __ STA ACCU + 0 
2f14 : ad b0 be LDA $beb0 ; (vp_fill + 6)
2f17 : 85 1c __ STA ACCU + 1 
2f19 : ad ad be LDA $bead ; (vp_fill + 3)
2f1c : 85 03 __ STA WORK + 0 
2f1e : ad ae be LDA $beae ; (vp_fill + 4)
2f21 : 85 04 __ STA WORK + 1 
2f23 : 20 23 57 JSR $5723 ; (mul16 + 0)
2f26 : 18 __ __ CLC
2f27 : a5 59 __ LDA T4 + 0 
2f29 : 65 05 __ ADC WORK + 2 
2f2b : aa __ __ TAX
2f2c : a5 5a __ LDA T4 + 1 
2f2e : 65 06 __ ADC WORK + 3 
2f30 : a8 __ __ TAY
2f31 : 8a __ __ TXA
2f32 : 18 __ __ CLC
2f33 : 69 30 __ ADC #$30
2f35 : 85 57 __ STA T3 + 0 
2f37 : 90 01 __ BCC $2f3a ; (main.s1752 + 0)
.s1751:
2f39 : c8 __ __ INY
.s1752:
2f3a : 84 58 __ STY T3 + 1 
2f3c : a9 00 __ LDA #$00
2f3e : 85 56 __ STA T2 + 0 
2f40 : ac be be LDY $bebe ; (vp_fill + 20)
2f43 : ae bd be LDX $bebd ; (vp_fill + 19)
2f46 : 4c 70 2f JMP $2f70 ; (main.l2495 + 0)
.s2496:
2f49 : 86 0d __ STX P0 
2f4b : 84 0e __ STY P1 
2f4d : 20 d0 14 JSR $14d0 ; (bnk_cpytovdc@proxy + 0)
2f50 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2f53 : 18 __ __ CLC
2f54 : 65 0d __ ADC P0 
2f56 : aa __ __ TAX
2f57 : ad 22 5a LDA $5a22 ; (vdc_state + 4)
2f5a : 65 0e __ ADC P1 
2f5c : a8 __ __ TAY
2f5d : 18 __ __ CLC
2f5e : a5 57 __ LDA T3 + 0 
2f60 : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
2f63 : 85 57 __ STA T3 + 0 
2f65 : a5 58 __ LDA T3 + 1 
2f67 : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
2f6a : 85 58 __ STA T3 + 1 
2f6c : e6 56 __ INC T2 + 0 
2f6e : a5 56 __ LDA T2 + 0 
.l2495:
2f70 : cd b8 be CMP $beb8 ; (vp_fill + 14)
2f73 : 90 d4 __ BCC $2f49 ; (main.s2496 + 0)
2f75 : 4c 79 2b JMP $2b79 ; (main.s1400 + 0)
.s2312:
2f78 : a9 12 __ LDA #$12
2f7a : 8d 00 d6 STA $d600 
2f7d : a5 5b __ LDA T5 + 0 
2f7f : 65 57 __ ADC T3 + 0 
2f81 : 85 5d __ STA T6 + 0 
2f83 : a5 5c __ LDA T5 + 1 
2f85 : 65 58 __ ADC T3 + 1 
2f87 : 85 5e __ STA T6 + 1 
2f89 : 18 __ __ CLC
2f8a : a5 59 __ LDA T4 + 0 
2f8c : 65 57 __ ADC T3 + 0 
2f8e : 85 1b __ STA ACCU + 0 
2f90 : a5 5a __ LDA T4 + 1 
2f92 : 65 58 __ ADC T3 + 1 
2f94 : 85 1c __ STA ACCU + 1 
.l11743:
2f96 : 2c 00 d6 BIT $d600 
2f99 : 10 fb __ BPL $2f96 ; (main.l11743 + 0)
.s2368:
2f9b : a5 5a __ LDA T4 + 1 
2f9d : 8d 01 d6 STA $d601 
2fa0 : a9 13 __ LDA #$13
2fa2 : 8d 00 d6 STA $d600 
.l11745:
2fa5 : 2c 00 d6 BIT $d600 
2fa8 : 10 fb __ BPL $2fa5 ; (main.l11745 + 0)
.s2373:
2faa : a5 59 __ LDA T4 + 0 
2fac : 8d 01 d6 STA $d601 
2faf : a9 1f __ LDA #$1f
2fb1 : 8d 00 d6 STA $d600 
2fb4 : a9 18 __ LDA #$18
2fb6 : 8d 00 d6 STA $d600 
.l11747:
2fb9 : 2c 00 d6 BIT $d600 
2fbc : 10 fb __ BPL $2fb9 ; (main.l11747 + 0)
.s2380:
2fbe : ad 01 d6 LDA $d601 
2fc1 : a2 18 __ LDX #$18
2fc3 : 8e 00 d6 STX $d600 
2fc6 : 09 80 __ ORA #$80
.l11749:
2fc8 : 2c 00 d6 BIT $d600 
2fcb : 10 fb __ BPL $2fc8 ; (main.l11749 + 0)
.s2386:
2fcd : 8d 01 d6 STA $d601 
2fd0 : a9 20 __ LDA #$20
2fd2 : 8d 00 d6 STA $d600 
.l11751:
2fd5 : 2c 00 d6 BIT $d600 
2fd8 : 10 fb __ BPL $2fd5 ; (main.l11751 + 0)
.s2391:
2fda : a5 1c __ LDA ACCU + 1 
2fdc : 8d 01 d6 STA $d601 
2fdf : a9 21 __ LDA #$21
2fe1 : 8d 00 d6 STA $d600 
.l11753:
2fe4 : 2c 00 d6 BIT $d600 
2fe7 : 10 fb __ BPL $2fe4 ; (main.l11753 + 0)
.s2396:
2fe9 : a5 1b __ LDA ACCU + 0 
2feb : 8d 01 d6 STA $d601 
2fee : a9 1f __ LDA #$1f
2ff0 : 8d 00 d6 STA $d600 
2ff3 : a9 1e __ LDA #$1e
2ff5 : 8d 00 d6 STA $d600 
.l11755:
2ff8 : 2c 00 d6 BIT $d600 
2ffb : 10 fb __ BPL $2ff8 ; (main.l11755 + 0)
.s2402:
2ffd : a5 61 __ LDA T8 + 0 
2fff : 8d 01 d6 STA $d601 
3002 : a9 12 __ LDA #$12
3004 : 8d 00 d6 STA $d600 
.l11757:
3007 : 2c 00 d6 BIT $d600 
300a : 10 fb __ BPL $3007 ; (main.l11757 + 0)
.s2455:
300c : a5 5c __ LDA T5 + 1 
300e : 8d 01 d6 STA $d601 
3011 : a9 13 __ LDA #$13
3013 : 8d 00 d6 STA $d600 
.l11759:
3016 : 2c 00 d6 BIT $d600 
3019 : 10 fb __ BPL $3016 ; (main.l11759 + 0)
.s2460:
301b : a5 5b __ LDA T5 + 0 
301d : 8d 01 d6 STA $d601 
3020 : a9 1f __ LDA #$1f
3022 : 8d 00 d6 STA $d600 
3025 : 8e 00 d6 STX $d600 
.l11761:
3028 : 2c 00 d6 BIT $d600 
302b : 10 fb __ BPL $3028 ; (main.l11761 + 0)
.s2467:
302d : ad 01 d6 LDA $d601 
3030 : 8e 00 d6 STX $d600 
3033 : 09 80 __ ORA #$80
.l11763:
3035 : 2c 00 d6 BIT $d600 
3038 : 10 fb __ BPL $3035 ; (main.l11763 + 0)
.s2473:
303a : 8d 01 d6 STA $d601 
303d : a9 20 __ LDA #$20
303f : 8d 00 d6 STA $d600 
.l11765:
3042 : 2c 00 d6 BIT $d600 
3045 : 10 fb __ BPL $3042 ; (main.l11765 + 0)
.s2478:
3047 : a5 5e __ LDA T6 + 1 
3049 : 8d 01 d6 STA $d601 
304c : a9 21 __ LDA #$21
304e : 8d 00 d6 STA $d600 
.l11767:
3051 : 2c 00 d6 BIT $d600 
3054 : 10 fb __ BPL $3051 ; (main.l11767 + 0)
.s2483:
3056 : a5 5d __ LDA T6 + 0 
3058 : 8d 01 d6 STA $d601 
305b : a9 1f __ LDA #$1f
305d : 8d 00 d6 STA $d600 
3060 : a9 1e __ LDA #$1e
3062 : 8d 00 d6 STA $d600 
.l11769:
3065 : 2c 00 d6 BIT $d600 
3068 : 10 fb __ BPL $3065 ; (main.l11769 + 0)
.s2489:
306a : a5 61 __ LDA T8 + 0 
306c : 8d 01 d6 STA $d601 
306f : ad 21 5a LDA $5a21 ; (vdc_state + 3)
3072 : 18 __ __ CLC
3073 : 65 59 __ ADC T4 + 0 
3075 : 85 59 __ STA T4 + 0 
3077 : ad 22 5a LDA $5a22 ; (vdc_state + 4)
307a : 65 5a __ ADC T4 + 1 
307c : 85 5a __ STA T4 + 1 
307e : 18 __ __ CLC
307f : a5 5b __ LDA T5 + 0 
3081 : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
3084 : 85 5b __ STA T5 + 0 
3086 : a5 5c __ LDA T5 + 1 
3088 : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
308b : c8 __ __ INY
308c : 4c 22 2e JMP $2e22 ; (main.l2311 + 0)
.s2129:
308f : a9 12 __ LDA #$12
3091 : 8d 00 d6 STA $d600 
3094 : 98 __ __ TYA
3095 : 38 __ __ SEC
3096 : ed 21 5a SBC $5a21 ; (vdc_state + 3)
3099 : a8 __ __ TAY
309a : a5 58 __ LDA T3 + 1 
309c : ed 22 5a SBC $5a22 ; (vdc_state + 4)
309f : 85 58 __ STA T3 + 1 
30a1 : 98 __ __ TYA
30a2 : 38 __ __ SEC
30a3 : e5 59 __ SBC T4 + 0 
30a5 : 85 5f __ STA T7 + 0 
30a7 : a5 58 __ LDA T3 + 1 
30a9 : e5 5a __ SBC T4 + 1 
30ab : 85 60 __ STA T7 + 1 
30ad : 38 __ __ SEC
30ae : a5 5b __ LDA T5 + 0 
30b0 : ed 21 5a SBC $5a21 ; (vdc_state + 3)
30b3 : 85 5b __ STA T5 + 0 
30b5 : a5 5c __ LDA T5 + 1 
30b7 : ed 22 5a SBC $5a22 ; (vdc_state + 4)
30ba : 85 5c __ STA T5 + 1 
30bc : 38 __ __ SEC
30bd : a5 5b __ LDA T5 + 0 
30bf : e5 59 __ SBC T4 + 0 
30c1 : 85 5d __ STA T6 + 0 
30c3 : a5 5c __ LDA T5 + 1 
30c5 : e5 5a __ SBC T4 + 1 
30c7 : 85 5e __ STA T6 + 1 
.l11713:
30c9 : 2c 00 d6 BIT $d600 
30cc : 10 fb __ BPL $30c9 ; (main.l11713 + 0)
.s2185:
30ce : a5 5c __ LDA T5 + 1 
30d0 : 8d 01 d6 STA $d601 
30d3 : a9 13 __ LDA #$13
30d5 : 8d 00 d6 STA $d600 
.l11715:
30d8 : 2c 00 d6 BIT $d600 
30db : 10 fb __ BPL $30d8 ; (main.l11715 + 0)
.s2190:
30dd : a5 5b __ LDA T5 + 0 
30df : 8d 01 d6 STA $d601 
30e2 : a9 1f __ LDA #$1f
30e4 : 8d 00 d6 STA $d600 
30e7 : a9 18 __ LDA #$18
30e9 : 8d 00 d6 STA $d600 
.l11717:
30ec : 2c 00 d6 BIT $d600 
30ef : 10 fb __ BPL $30ec ; (main.l11717 + 0)
.s2197:
30f1 : ad 01 d6 LDA $d601 
30f4 : a2 18 __ LDX #$18
30f6 : 8e 00 d6 STX $d600 
30f9 : 09 80 __ ORA #$80
.l11719:
30fb : 2c 00 d6 BIT $d600 
30fe : 10 fb __ BPL $30fb ; (main.l11719 + 0)
.s2203:
3100 : 8d 01 d6 STA $d601 
3103 : a9 20 __ LDA #$20
3105 : 8d 00 d6 STA $d600 
.l11721:
3108 : 2c 00 d6 BIT $d600 
310b : 10 fb __ BPL $3108 ; (main.l11721 + 0)
.s2208:
310d : a5 5e __ LDA T6 + 1 
310f : 8d 01 d6 STA $d601 
3112 : a9 21 __ LDA #$21
3114 : 8d 00 d6 STA $d600 
.l11723:
3117 : 2c 00 d6 BIT $d600 
311a : 10 fb __ BPL $3117 ; (main.l11723 + 0)
.s2213:
311c : a5 5d __ LDA T6 + 0 
311e : 8d 01 d6 STA $d601 
3121 : a9 1f __ LDA #$1f
3123 : 8d 00 d6 STA $d600 
3126 : a9 1e __ LDA #$1e
3128 : 8d 00 d6 STA $d600 
.l11725:
312b : 2c 00 d6 BIT $d600 
312e : 10 fb __ BPL $312b ; (main.l11725 + 0)
.s2219:
3130 : a5 43 __ LDA T10 + 0 
3132 : 8d 01 d6 STA $d601 
3135 : a9 12 __ LDA #$12
3137 : 8d 00 d6 STA $d600 
.l11727:
313a : 2c 00 d6 BIT $d600 
313d : 10 fb __ BPL $313a ; (main.l11727 + 0)
.s2272:
313f : a5 58 __ LDA T3 + 1 
3141 : 8d 01 d6 STA $d601 
3144 : a9 13 __ LDA #$13
3146 : 8d 00 d6 STA $d600 
.l11729:
3149 : 2c 00 d6 BIT $d600 
314c : 10 fb __ BPL $3149 ; (main.l11729 + 0)
.s2277:
314e : 8c 01 d6 STY $d601 
3151 : a9 1f __ LDA #$1f
3153 : 8d 00 d6 STA $d600 
3156 : 8e 00 d6 STX $d600 
.l11731:
3159 : 2c 00 d6 BIT $d600 
315c : 10 fb __ BPL $3159 ; (main.l11731 + 0)
.s2284:
315e : ad 01 d6 LDA $d601 
3161 : 8e 00 d6 STX $d600 
3164 : 09 80 __ ORA #$80
.l11733:
3166 : 2c 00 d6 BIT $d600 
3169 : 10 fb __ BPL $3166 ; (main.l11733 + 0)
.s2290:
316b : 8d 01 d6 STA $d601 
316e : a9 20 __ LDA #$20
3170 : 8d 00 d6 STA $d600 
.l11735:
3173 : 2c 00 d6 BIT $d600 
3176 : 10 fb __ BPL $3173 ; (main.l11735 + 0)
.s2295:
3178 : a5 60 __ LDA T7 + 1 
317a : 8d 01 d6 STA $d601 
317d : a9 21 __ LDA #$21
317f : 8d 00 d6 STA $d600 
.l11737:
3182 : 2c 00 d6 BIT $d600 
3185 : 10 fb __ BPL $3182 ; (main.l11737 + 0)
.s2300:
3187 : a5 5f __ LDA T7 + 0 
3189 : 8d 01 d6 STA $d601 
318c : a9 1f __ LDA #$1f
318e : 8d 00 d6 STA $d600 
3191 : a9 1e __ LDA #$1e
3193 : 8d 00 d6 STA $d600 
.l11739:
3196 : 2c 00 d6 BIT $d600 
3199 : 10 fb __ BPL $3196 ; (main.l11739 + 0)
.s2306:
319b : a5 43 __ LDA T10 + 0 
319d : 8d 01 d6 STA $d601 
31a0 : e6 61 __ INC T8 + 0 
31a2 : 4c bd 2d JMP $2dbd ; (main.l2128 + 0)
.s1768:
31a5 : a5 5b __ LDA T5 + 0 
31a7 : 69 01 __ ADC #$01
31a9 : 85 5d __ STA T6 + 0 
31ab : a5 5c __ LDA T5 + 1 
31ad : 69 00 __ ADC #$00
31af : 85 5e __ STA T6 + 1 
31b1 : 18 __ __ CLC
31b2 : a5 59 __ LDA T4 + 0 
31b4 : 69 01 __ ADC #$01
31b6 : aa __ __ TAX
31b7 : a5 5a __ LDA T4 + 1 
31b9 : 69 00 __ ADC #$00
31bb : a8 __ __ TAY
31bc : ad 1f 5a LDA $5a1f ; (vdc_state + 1)
31bf : d0 11 __ BNE $31d2 ; (main.s1773 + 0)
.s1775:
31c1 : a9 03 __ LDA #$03
31c3 : cd 2b 5a CMP $5a2b ; (vdc_state + 13)
31c6 : d0 05 __ BNE $31cd ; (main.s1164 + 0)
.s1163:
31c8 : a9 ff __ LDA #$ff
31ca : cd 2a 5a CMP $5a2a ; (vdc_state + 12)
.s1164:
31cd : b0 03 __ BCS $31d2 ; (main.s1773 + 0)
31cf : 4c c4 33 JMP $33c4 ; (main.s1772 + 0)
.s1773:
31d2 : ad 2a 5a LDA $5a2a ; (vdc_state + 12)
31d5 : 85 1b __ STA ACCU + 0 
31d7 : ad 2b 5a LDA $5a2b ; (vdc_state + 13)
31da : 85 45 __ STA T13 + 0 
31dc : a9 12 __ LDA #$12
31de : 8d 00 d6 STA $d600 
.l11654:
31e1 : 2c 00 d6 BIT $d600 
31e4 : 10 fb __ BPL $31e1 ; (main.l11654 + 0)
.s1828:
31e6 : a5 45 __ LDA T13 + 0 
31e8 : 8d 01 d6 STA $d601 
31eb : a9 13 __ LDA #$13
31ed : 8d 00 d6 STA $d600 
.l11656:
31f0 : 2c 00 d6 BIT $d600 
31f3 : 10 fb __ BPL $31f0 ; (main.l11656 + 0)
.s1833:
31f5 : a5 1b __ LDA ACCU + 0 
31f7 : 8d 01 d6 STA $d601 
31fa : a9 1f __ LDA #$1f
31fc : 8d 00 d6 STA $d600 
31ff : a9 18 __ LDA #$18
3201 : 8d 00 d6 STA $d600 
.l11658:
3204 : 2c 00 d6 BIT $d600 
3207 : 10 fb __ BPL $3204 ; (main.l11658 + 0)
.s1840:
3209 : ad 01 d6 LDA $d601 
320c : 09 80 __ ORA #$80
320e : 85 49 __ STA T16 + 0 
3210 : a9 18 __ LDA #$18
3212 : 8d 00 d6 STA $d600 
.l11660:
3215 : 2c 00 d6 BIT $d600 
3218 : 10 fb __ BPL $3215 ; (main.l11660 + 0)
.s1846:
321a : a5 49 __ LDA T16 + 0 
321c : 8d 01 d6 STA $d601 
321f : a9 20 __ LDA #$20
3221 : 8d 00 d6 STA $d600 
.l11662:
3224 : 2c 00 d6 BIT $d600 
3227 : 10 fb __ BPL $3224 ; (main.l11662 + 0)
.s1851:
3229 : 8c 01 d6 STY $d601 
322c : a9 21 __ LDA #$21
322e : 8d 00 d6 STA $d600 
.l11664:
3231 : 2c 00 d6 BIT $d600 
3234 : 10 fb __ BPL $3231 ; (main.l11664 + 0)
.s1856:
3236 : 8e 01 d6 STX $d601 
3239 : a9 1f __ LDA #$1f
323b : 8d 00 d6 STA $d600 
323e : a9 1e __ LDA #$1e
3240 : 8d 00 d6 STA $d600 
.l11666:
3243 : 2c 00 d6 BIT $d600 
3246 : 10 fb __ BPL $3243 ; (main.l11666 + 0)
.s1862:
3248 : a5 57 __ LDA T3 + 0 
324a : 8d 01 d6 STA $d601 
324d : a9 12 __ LDA #$12
324f : 8d 00 d6 STA $d600 
.l11668:
3252 : 2c 00 d6 BIT $d600 
3255 : 10 fb __ BPL $3252 ; (main.l11668 + 0)
.s1915:
3257 : a5 5a __ LDA T4 + 1 
3259 : 8d 01 d6 STA $d601 
325c : a9 13 __ LDA #$13
325e : 8d 00 d6 STA $d600 
.l11670:
3261 : 2c 00 d6 BIT $d600 
3264 : 10 fb __ BPL $3261 ; (main.l11670 + 0)
.s1920:
3266 : a5 59 __ LDA T4 + 0 
3268 : 8d 01 d6 STA $d601 
326b : a9 1f __ LDA #$1f
326d : 8d 00 d6 STA $d600 
3270 : a9 18 __ LDA #$18
3272 : 8d 00 d6 STA $d600 
.l11672:
3275 : 2c 00 d6 BIT $d600 
3278 : 10 fb __ BPL $3275 ; (main.l11672 + 0)
.s1927:
327a : ad 01 d6 LDA $d601 
327d : 09 80 __ ORA #$80
327f : aa __ __ TAX
3280 : a9 18 __ LDA #$18
3282 : 8d 00 d6 STA $d600 
.l11674:
3285 : 2c 00 d6 BIT $d600 
3288 : 10 fb __ BPL $3285 ; (main.l11674 + 0)
.s1933:
328a : 8e 01 d6 STX $d601 
328d : a9 20 __ LDA #$20
328f : 8d 00 d6 STA $d600 
.l11676:
3292 : 2c 00 d6 BIT $d600 
3295 : 10 fb __ BPL $3292 ; (main.l11676 + 0)
.s1938:
3297 : a5 45 __ LDA T13 + 0 
3299 : 8d 01 d6 STA $d601 
329c : a9 21 __ LDA #$21
329e : 8d 00 d6 STA $d600 
.l11678:
32a1 : 2c 00 d6 BIT $d600 
32a4 : 10 fb __ BPL $32a1 ; (main.l11678 + 0)
.s1943:
32a6 : a5 1b __ LDA ACCU + 0 
32a8 : 8d 01 d6 STA $d601 
32ab : a9 1f __ LDA #$1f
32ad : 8d 00 d6 STA $d600 
32b0 : a9 1e __ LDA #$1e
32b2 : 8d 00 d6 STA $d600 
.l11680:
32b5 : 2c 00 d6 BIT $d600 
32b8 : 10 fb __ BPL $32b5 ; (main.l11680 + 0)
.s1949:
32ba : a5 57 __ LDA T3 + 0 
32bc : 8d 01 d6 STA $d601 
32bf : a9 12 __ LDA #$12
32c1 : 8d 00 d6 STA $d600 
.l11682:
32c4 : 2c 00 d6 BIT $d600 
32c7 : 10 fb __ BPL $32c4 ; (main.l11682 + 0)
.s2002:
32c9 : a5 45 __ LDA T13 + 0 
32cb : 8d 01 d6 STA $d601 
32ce : a9 13 __ LDA #$13
32d0 : 8d 00 d6 STA $d600 
.l11684:
32d3 : 2c 00 d6 BIT $d600 
32d6 : 10 fb __ BPL $32d3 ; (main.l11684 + 0)
.s2007:
32d8 : a5 1b __ LDA ACCU + 0 
32da : 8d 01 d6 STA $d601 
32dd : a9 1f __ LDA #$1f
32df : 8d 00 d6 STA $d600 
32e2 : a9 18 __ LDA #$18
32e4 : 8d 00 d6 STA $d600 
.l11686:
32e7 : 2c 00 d6 BIT $d600 
32ea : 10 fb __ BPL $32e7 ; (main.l11686 + 0)
.s2014:
32ec : ad 01 d6 LDA $d601 
32ef : 09 80 __ ORA #$80
32f1 : aa __ __ TAX
32f2 : a9 18 __ LDA #$18
32f4 : 8d 00 d6 STA $d600 
.l11688:
32f7 : 2c 00 d6 BIT $d600 
32fa : 10 fb __ BPL $32f7 ; (main.l11688 + 0)
.s2020:
32fc : 8e 01 d6 STX $d601 
32ff : a9 20 __ LDA #$20
3301 : 8d 00 d6 STA $d600 
.l11690:
3304 : 2c 00 d6 BIT $d600 
3307 : 10 fb __ BPL $3304 ; (main.l11690 + 0)
.s2025:
3309 : a5 5e __ LDA T6 + 1 
330b : 8d 01 d6 STA $d601 
330e : a9 21 __ LDA #$21
3310 : 8d 00 d6 STA $d600 
.l11692:
3313 : 2c 00 d6 BIT $d600 
3316 : 10 fb __ BPL $3313 ; (main.l11692 + 0)
.s2030:
3318 : a5 5d __ LDA T6 + 0 
331a : 8d 01 d6 STA $d601 
331d : a9 1f __ LDA #$1f
331f : 8d 00 d6 STA $d600 
3322 : a9 1e __ LDA #$1e
3324 : 8d 00 d6 STA $d600 
.l11694:
3327 : 2c 00 d6 BIT $d600 
332a : 10 fb __ BPL $3327 ; (main.l11694 + 0)
.s2036:
332c : a5 57 __ LDA T3 + 0 
332e : 8d 01 d6 STA $d601 
3331 : a9 12 __ LDA #$12
3333 : 8d 00 d6 STA $d600 
.l11696:
3336 : 2c 00 d6 BIT $d600 
3339 : 10 fb __ BPL $3336 ; (main.l11696 + 0)
.s2089:
333b : a5 5c __ LDA T5 + 1 
333d : 8d 01 d6 STA $d601 
3340 : a9 13 __ LDA #$13
3342 : 8d 00 d6 STA $d600 
.l11698:
3345 : 2c 00 d6 BIT $d600 
3348 : 10 fb __ BPL $3345 ; (main.l11698 + 0)
.s2094:
334a : a5 5b __ LDA T5 + 0 
334c : 8d 01 d6 STA $d601 
334f : a9 1f __ LDA #$1f
3351 : 8d 00 d6 STA $d600 
3354 : a9 18 __ LDA #$18
3356 : 8d 00 d6 STA $d600 
.l11700:
3359 : 2c 00 d6 BIT $d600 
335c : 10 fb __ BPL $3359 ; (main.l11700 + 0)
.s2101:
335e : ad 01 d6 LDA $d601 
3361 : 09 80 __ ORA #$80
3363 : aa __ __ TAX
3364 : a9 18 __ LDA #$18
3366 : 8d 00 d6 STA $d600 
.l11702:
3369 : 2c 00 d6 BIT $d600 
336c : 10 fb __ BPL $3369 ; (main.l11702 + 0)
.s2107:
336e : 8e 01 d6 STX $d601 
3371 : a9 20 __ LDA #$20
3373 : 8d 00 d6 STA $d600 
.l11704:
3376 : 2c 00 d6 BIT $d600 
3379 : 10 fb __ BPL $3376 ; (main.l11704 + 0)
.s2112:
337b : a5 45 __ LDA T13 + 0 
337d : 8d 01 d6 STA $d601 
3380 : a9 21 __ LDA #$21
3382 : 8d 00 d6 STA $d600 
.l11706:
3385 : 2c 00 d6 BIT $d600 
3388 : 10 fb __ BPL $3385 ; (main.l11706 + 0)
.s2117:
338a : a5 1b __ LDA ACCU + 0 
338c : 8d 01 d6 STA $d601 
338f : a9 1f __ LDA #$1f
3391 : 8d 00 d6 STA $d600 
3394 : a9 1e __ LDA #$1e
3396 : 8d 00 d6 STA $d600 
.l11708:
3399 : 2c 00 d6 BIT $d600 
339c : 10 fb __ BPL $3399 ; (main.l11708 + 0)
.s2123:
339e : a5 57 __ LDA T3 + 0 
33a0 : 8d 01 d6 STA $d601 
.s1771:
33a3 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
33a6 : 18 __ __ CLC
33a7 : 65 59 __ ADC T4 + 0 
33a9 : 85 59 __ STA T4 + 0 
33ab : ad 22 5a LDA $5a22 ; (vdc_state + 4)
33ae : 65 5a __ ADC T4 + 1 
33b0 : 85 5a __ STA T4 + 1 
33b2 : 18 __ __ CLC
33b3 : a5 5b __ LDA T5 + 0 
33b5 : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
33b8 : 85 5b __ STA T5 + 0 
33ba : a5 5c __ LDA T5 + 1 
33bc : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
33bf : e6 61 __ INC T8 + 0 
33c1 : 4c 35 2d JMP $2d35 ; (main.l1767 + 0)
.s1772:
33c4 : 86 0f __ STX P2 
33c6 : 84 10 __ STY P3 
33c8 : 20 38 14 JSR $1438 ; (bnk_cpyfromvdc@proxy + 0)
33cb : a5 59 __ LDA T4 + 0 
33cd : 85 0d __ STA P0 
33cf : a5 5a __ LDA T4 + 1 
33d1 : 85 0e __ STA P1 
33d3 : 20 e9 14 JSR $14e9 ; (bnk_cpytovdc@proxy + 0)
33d6 : a5 5d __ LDA T6 + 0 
33d8 : 85 0f __ STA P2 
33da : a5 5e __ LDA T6 + 1 
33dc : 85 10 __ STA P3 
33de : 20 bd 14 JSR $14bd ; (bnk_cpyfromvdc@proxy + 0)
33e1 : a5 5b __ LDA T5 + 0 
33e3 : 85 0d __ STA P0 
33e5 : a5 5c __ LDA T5 + 1 
33e7 : 85 0e __ STA P1 
33e9 : 20 e9 14 JSR $14e9 ; (bnk_cpytovdc@proxy + 0)
33ec : 4c a3 33 JMP $33a3 ; (main.s1771 + 0)
.s1407:
33ef : a5 59 __ LDA T4 + 0 
33f1 : 69 01 __ ADC #$01
33f3 : 85 5d __ STA T6 + 0 
33f5 : a5 5a __ LDA T4 + 1 
33f7 : 69 00 __ ADC #$00
33f9 : 85 5e __ STA T6 + 1 
33fb : 18 __ __ CLC
33fc : a5 5b __ LDA T5 + 0 
33fe : 69 01 __ ADC #$01
3400 : 85 5f __ STA T7 + 0 
3402 : a5 5c __ LDA T5 + 1 
3404 : 69 00 __ ADC #$00
3406 : 85 60 __ STA T7 + 1 
3408 : ad 1f 5a LDA $5a1f ; (vdc_state + 1)
340b : d0 11 __ BNE $341e ; (main.s1412 + 0)
.s1414:
340d : a9 03 __ LDA #$03
340f : cd 2b 5a CMP $5a2b ; (vdc_state + 13)
3412 : d0 05 __ BNE $3419 ; (main.s1224 + 0)
.s1223:
3414 : a9 ff __ LDA #$ff
3416 : cd 2a 5a CMP $5a2a ; (vdc_state + 12)
.s1224:
3419 : b0 03 __ BCS $341e ; (main.s1412 + 0)
341b : 4c 09 36 JMP $3609 ; (main.s1411 + 0)
.s1412:
341e : a9 12 __ LDA #$12
3420 : 8d 00 d6 STA $d600 
3423 : ac 2b 5a LDY $5a2b ; (vdc_state + 13)
3426 : ae 2a 5a LDX $5a2a ; (vdc_state + 12)
.l11594:
3429 : 2c 00 d6 BIT $d600 
342c : 10 fb __ BPL $3429 ; (main.l11594 + 0)
.s1467:
342e : 8c 01 d6 STY $d601 
3431 : a9 13 __ LDA #$13
3433 : 8d 00 d6 STA $d600 
.l11596:
3436 : 2c 00 d6 BIT $d600 
3439 : 10 fb __ BPL $3436 ; (main.l11596 + 0)
.s1472:
343b : 8e 01 d6 STX $d601 
343e : a9 1f __ LDA #$1f
3440 : 8d 00 d6 STA $d600 
3443 : a9 18 __ LDA #$18
3445 : 8d 00 d6 STA $d600 
.l11598:
3448 : 2c 00 d6 BIT $d600 
344b : 10 fb __ BPL $3448 ; (main.l11598 + 0)
.s1479:
344d : ad 01 d6 LDA $d601 
3450 : 09 80 __ ORA #$80
3452 : 85 49 __ STA T16 + 0 
3454 : a9 18 __ LDA #$18
3456 : 8d 00 d6 STA $d600 
.l11600:
3459 : 2c 00 d6 BIT $d600 
345c : 10 fb __ BPL $3459 ; (main.l11600 + 0)
.s1485:
345e : a5 49 __ LDA T16 + 0 
3460 : 8d 01 d6 STA $d601 
3463 : a9 20 __ LDA #$20
3465 : 8d 00 d6 STA $d600 
.l11602:
3468 : 2c 00 d6 BIT $d600 
346b : 10 fb __ BPL $3468 ; (main.l11602 + 0)
.s1490:
346d : a5 5a __ LDA T4 + 1 
346f : 8d 01 d6 STA $d601 
3472 : a9 21 __ LDA #$21
3474 : 8d 00 d6 STA $d600 
.l11604:
3477 : 2c 00 d6 BIT $d600 
347a : 10 fb __ BPL $3477 ; (main.l11604 + 0)
.s1495:
347c : a5 59 __ LDA T4 + 0 
347e : 8d 01 d6 STA $d601 
3481 : a9 1f __ LDA #$1f
3483 : 8d 00 d6 STA $d600 
3486 : a9 1e __ LDA #$1e
3488 : 8d 00 d6 STA $d600 
.l11606:
348b : 2c 00 d6 BIT $d600 
348e : 10 fb __ BPL $348b ; (main.l11606 + 0)
.s1501:
3490 : a5 57 __ LDA T3 + 0 
3492 : 8d 01 d6 STA $d601 
3495 : a9 12 __ LDA #$12
3497 : 8d 00 d6 STA $d600 
.l11608:
349a : 2c 00 d6 BIT $d600 
349d : 10 fb __ BPL $349a ; (main.l11608 + 0)
.s1554:
349f : a5 5e __ LDA T6 + 1 
34a1 : 8d 01 d6 STA $d601 
34a4 : a9 13 __ LDA #$13
34a6 : 8d 00 d6 STA $d600 
.l11610:
34a9 : 2c 00 d6 BIT $d600 
34ac : 10 fb __ BPL $34a9 ; (main.l11610 + 0)
.s1559:
34ae : a5 5d __ LDA T6 + 0 
34b0 : 8d 01 d6 STA $d601 
34b3 : a9 1f __ LDA #$1f
34b5 : 8d 00 d6 STA $d600 
34b8 : a9 18 __ LDA #$18
34ba : 8d 00 d6 STA $d600 
.l11612:
34bd : 2c 00 d6 BIT $d600 
34c0 : 10 fb __ BPL $34bd ; (main.l11612 + 0)
.s1566:
34c2 : ad 01 d6 LDA $d601 
34c5 : 09 80 __ ORA #$80
34c7 : 85 5d __ STA T6 + 0 
34c9 : a9 18 __ LDA #$18
34cb : 8d 00 d6 STA $d600 
.l11614:
34ce : 2c 00 d6 BIT $d600 
34d1 : 10 fb __ BPL $34ce ; (main.l11614 + 0)
.s1572:
34d3 : a5 5d __ LDA T6 + 0 
34d5 : 8d 01 d6 STA $d601 
34d8 : a9 20 __ LDA #$20
34da : 8d 00 d6 STA $d600 
.l11616:
34dd : 2c 00 d6 BIT $d600 
34e0 : 10 fb __ BPL $34dd ; (main.l11616 + 0)
.s1577:
34e2 : 8c 01 d6 STY $d601 
34e5 : a9 21 __ LDA #$21
34e7 : 8d 00 d6 STA $d600 
.l11618:
34ea : 2c 00 d6 BIT $d600 
34ed : 10 fb __ BPL $34ea ; (main.l11618 + 0)
.s1582:
34ef : 8e 01 d6 STX $d601 
34f2 : a9 1f __ LDA #$1f
34f4 : 8d 00 d6 STA $d600 
34f7 : a9 1e __ LDA #$1e
34f9 : 8d 00 d6 STA $d600 
.l11620:
34fc : 2c 00 d6 BIT $d600 
34ff : 10 fb __ BPL $34fc ; (main.l11620 + 0)
.s1588:
3501 : a5 57 __ LDA T3 + 0 
3503 : 8d 01 d6 STA $d601 
3506 : a9 12 __ LDA #$12
3508 : 8d 00 d6 STA $d600 
.l11622:
350b : 2c 00 d6 BIT $d600 
350e : 10 fb __ BPL $350b ; (main.l11622 + 0)
.s1641:
3510 : 8c 01 d6 STY $d601 
3513 : a9 13 __ LDA #$13
3515 : 8d 00 d6 STA $d600 
.l11624:
3518 : 2c 00 d6 BIT $d600 
351b : 10 fb __ BPL $3518 ; (main.l11624 + 0)
.s1646:
351d : 8e 01 d6 STX $d601 
3520 : a9 1f __ LDA #$1f
3522 : 8d 00 d6 STA $d600 
3525 : a9 18 __ LDA #$18
3527 : 8d 00 d6 STA $d600 
.l11626:
352a : 2c 00 d6 BIT $d600 
352d : 10 fb __ BPL $352a ; (main.l11626 + 0)
.s1653:
352f : ad 01 d6 LDA $d601 
3532 : 09 80 __ ORA #$80
3534 : 85 5d __ STA T6 + 0 
3536 : a9 18 __ LDA #$18
3538 : 8d 00 d6 STA $d600 
.l11628:
353b : 2c 00 d6 BIT $d600 
353e : 10 fb __ BPL $353b ; (main.l11628 + 0)
.s1659:
3540 : a5 5d __ LDA T6 + 0 
3542 : 8d 01 d6 STA $d601 
3545 : a9 20 __ LDA #$20
3547 : 8d 00 d6 STA $d600 
.l11630:
354a : 2c 00 d6 BIT $d600 
354d : 10 fb __ BPL $354a ; (main.l11630 + 0)
.s1664:
354f : a5 5c __ LDA T5 + 1 
3551 : 8d 01 d6 STA $d601 
3554 : a9 21 __ LDA #$21
3556 : 8d 00 d6 STA $d600 
.l11632:
3559 : 2c 00 d6 BIT $d600 
355c : 10 fb __ BPL $3559 ; (main.l11632 + 0)
.s1669:
355e : a5 5b __ LDA T5 + 0 
3560 : 8d 01 d6 STA $d601 
3563 : a9 1f __ LDA #$1f
3565 : 8d 00 d6 STA $d600 
3568 : a9 1e __ LDA #$1e
356a : 8d 00 d6 STA $d600 
.l11634:
356d : 2c 00 d6 BIT $d600 
3570 : 10 fb __ BPL $356d ; (main.l11634 + 0)
.s1675:
3572 : a5 57 __ LDA T3 + 0 
3574 : 8d 01 d6 STA $d601 
3577 : a9 12 __ LDA #$12
3579 : 8d 00 d6 STA $d600 
.l11636:
357c : 2c 00 d6 BIT $d600 
357f : 10 fb __ BPL $357c ; (main.l11636 + 0)
.s1728:
3581 : a5 60 __ LDA T7 + 1 
3583 : 8d 01 d6 STA $d601 
3586 : a9 13 __ LDA #$13
3588 : 8d 00 d6 STA $d600 
.l11638:
358b : 2c 00 d6 BIT $d600 
358e : 10 fb __ BPL $358b ; (main.l11638 + 0)
.s1733:
3590 : a5 5f __ LDA T7 + 0 
3592 : 8d 01 d6 STA $d601 
3595 : a9 1f __ LDA #$1f
3597 : 8d 00 d6 STA $d600 
359a : a9 18 __ LDA #$18
359c : 8d 00 d6 STA $d600 
.l11640:
359f : 2c 00 d6 BIT $d600 
35a2 : 10 fb __ BPL $359f ; (main.l11640 + 0)
.s1740:
35a4 : ad 01 d6 LDA $d601 
35a7 : 09 80 __ ORA #$80
35a9 : 85 5d __ STA T6 + 0 
35ab : a9 18 __ LDA #$18
35ad : 8d 00 d6 STA $d600 
.l11642:
35b0 : 2c 00 d6 BIT $d600 
35b3 : 10 fb __ BPL $35b0 ; (main.l11642 + 0)
.s1746:
35b5 : a5 5d __ LDA T6 + 0 
35b7 : 8d 01 d6 STA $d601 
35ba : a9 20 __ LDA #$20
35bc : 8d 00 d6 STA $d600 
.l11644:
35bf : 2c 00 d6 BIT $d600 
35c2 : 10 fb __ BPL $35bf ; (main.l11644 + 0)
.s1751:
35c4 : 8c 01 d6 STY $d601 
35c7 : a9 21 __ LDA #$21
35c9 : 8d 00 d6 STA $d600 
.l11646:
35cc : 2c 00 d6 BIT $d600 
35cf : 10 fb __ BPL $35cc ; (main.l11646 + 0)
.s1756:
35d1 : 8e 01 d6 STX $d601 
35d4 : a9 1f __ LDA #$1f
35d6 : 8d 00 d6 STA $d600 
35d9 : a9 1e __ LDA #$1e
35db : 8d 00 d6 STA $d600 
.l11648:
35de : 2c 00 d6 BIT $d600 
35e1 : 10 fb __ BPL $35de ; (main.l11648 + 0)
.s1762:
35e3 : a5 57 __ LDA T3 + 0 
35e5 : 8d 01 d6 STA $d601 
.s1410:
35e8 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
35eb : 18 __ __ CLC
35ec : 65 59 __ ADC T4 + 0 
35ee : 85 59 __ STA T4 + 0 
35f0 : ad 22 5a LDA $5a22 ; (vdc_state + 4)
35f3 : 65 5a __ ADC T4 + 1 
35f5 : 85 5a __ STA T4 + 1 
35f7 : 18 __ __ CLC
35f8 : a5 5b __ LDA T5 + 0 
35fa : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
35fd : 85 5b __ STA T5 + 0 
35ff : a5 5c __ LDA T5 + 1 
3601 : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
3604 : e6 61 __ INC T8 + 0 
3606 : 4c df 2c JMP $2cdf ; (main.l1406 + 0)
.s1411:
3609 : a5 59 __ LDA T4 + 0 
360b : 85 0f __ STA P2 
360d : a5 5a __ LDA T4 + 1 
360f : 85 10 __ STA P3 
3611 : 20 38 14 JSR $1438 ; (bnk_cpyfromvdc@proxy + 0)
3614 : a5 5d __ LDA T6 + 0 
3616 : 85 0d __ STA P0 
3618 : a5 5e __ LDA T6 + 1 
361a : 85 0e __ STA P1 
361c : 20 e9 14 JSR $14e9 ; (bnk_cpytovdc@proxy + 0)
361f : a5 5b __ LDA T5 + 0 
3621 : 85 0f __ STA P2 
3623 : a5 5c __ LDA T5 + 1 
3625 : 85 10 __ STA P3 
3627 : 20 bd 14 JSR $14bd ; (bnk_cpyfromvdc@proxy + 0)
362a : a5 5f __ LDA T7 + 0 
362c : 85 0d __ STA P0 
362e : a5 60 __ LDA T7 + 1 
3630 : 85 0e __ STA P1 
3632 : 20 e9 14 JSR $14e9 ; (bnk_cpytovdc@proxy + 0)
3635 : 4c e8 35 JMP $35e8 ; (main.s1410 + 0)
.s1318:
3638 : 85 61 __ STA T8 + 0 
363a : ad 50 bf LDA $bf50 ; (window + 5)
363d : 85 43 __ STA T10 + 0 
363f : 18 __ __ CLC
3640 : 6d 4c bf ADC $bf4c ; (window + 1)
3643 : 0a __ __ ASL
3644 : aa __ __ TAX
3645 : a9 12 __ LDA #$12
3647 : 8d 00 d6 STA $d600 
364a : ad f7 50 LDA $50f7 ; (p2smap + 1)
364d : 49 20 __ EOR #$20
364f : 85 47 __ STA T14 + 0 
3651 : 18 __ __ CLC
3652 : a5 61 __ LDA T8 + 0 
3654 : 6d 4b bf ADC $bf4b ; (window + 0)
3657 : 18 __ __ CLC
3658 : 7d 37 5a ADC $5a37,x ; (multab + 0)
365b : 85 59 __ STA T4 + 0 
365d : a9 00 __ LDA #$00
365f : 7d 38 5a ADC $5a38,x ; (multab + 1)
3662 : 85 5a __ STA T4 + 1 
3664 : 18 __ __ CLC
3665 : a5 59 __ LDA T4 + 0 
3667 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
366a : a8 __ __ TAY
366b : a5 5a __ LDA T4 + 1 
366d : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
3670 : ae 25 5a LDX $5a25 ; (vdc_state + 7)
.l11566:
3673 : 2c 00 d6 BIT $d600 
3676 : 10 fb __ BPL $3673 ; (main.l11566 + 0)
.s1334:
3678 : 8d 01 d6 STA $d601 
367b : a9 13 __ LDA #$13
367d : 8d 00 d6 STA $d600 
.l11568:
3680 : 2c 00 d6 BIT $d600 
3683 : 10 fb __ BPL $3680 ; (main.l11568 + 0)
.s1339:
3685 : 8c 01 d6 STY $d601 
3688 : a9 1f __ LDA #$1f
368a : 8d 00 d6 STA $d600 
.l11570:
368d : 2c 00 d6 BIT $d600 
3690 : 10 fb __ BPL $368d ; (main.l11570 + 0)
.s1343:
3692 : a5 47 __ LDA T14 + 0 
3694 : 8d 01 d6 STA $d601 
3697 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
369a : 18 __ __ CLC
369b : 65 59 __ ADC T4 + 0 
369d : a8 __ __ TAY
369e : a9 12 __ LDA #$12
36a0 : 8d 00 d6 STA $d600 
36a3 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
36a6 : 65 5a __ ADC T4 + 1 
.l11572:
36a8 : 2c 00 d6 BIT $d600 
36ab : 10 fb __ BPL $36a8 ; (main.l11572 + 0)
.s1350:
36ad : 8d 01 d6 STA $d601 
36b0 : a9 13 __ LDA #$13
36b2 : 8d 00 d6 STA $d600 
.l11574:
36b5 : 2c 00 d6 BIT $d600 
36b8 : 10 fb __ BPL $36b5 ; (main.l11574 + 0)
.s1355:
36ba : 8c 01 d6 STY $d601 
36bd : a9 1f __ LDA #$1f
36bf : 8d 00 d6 STA $d600 
.l11576:
36c2 : 2c 00 d6 BIT $d600 
36c5 : 10 fb __ BPL $36c2 ; (main.l11576 + 0)
.s1359:
36c7 : 8e 01 d6 STX $d601 
36ca : a6 61 __ LDX T8 + 0 
36cc : e8 __ __ INX
36cd : 8e 4f bf STX $bf4f ; (window + 4)
36d0 : ec 4d bf CPX $bf4d ; (window + 2)
36d3 : f0 03 __ BEQ $36d8 ; (main.s1360 + 0)
36d5 : 4c 94 29 JMP $2994 ; (main.s8479 + 0)
.s1360:
36d8 : a9 00 __ LDA #$00
36da : 8d 4f bf STA $bf4f ; (window + 4)
36dd : 18 __ __ CLC
36de : a5 43 __ LDA T10 + 0 
36e0 : 69 01 __ ADC #$01
36e2 : 8d 50 bf STA $bf50 ; (window + 5)
36e5 : cd 4e bf CMP $bf4e ; (window + 3)
36e8 : f0 03 __ BEQ $36ed ; (main.s1363 + 0)
36ea : 4c 94 29 JMP $2994 ; (main.s8479 + 0)
.s1363:
36ed : a5 43 __ LDA T10 + 0 
36ef : 8d 50 bf STA $bf50 ; (window + 5)
36f2 : a9 4b __ LDA #$4b
36f4 : a0 02 __ LDY #$02
36f6 : 91 23 __ STA (SP + 0),y 
36f8 : a9 bf __ LDA #$bf
36fa : c8 __ __ INY
36fb : 91 23 __ STA (SP + 0),y 
36fd : a9 e1 __ LDA #$e1
36ff : c8 __ __ INY
3700 : 91 23 __ STA (SP + 0),y 
3702 : a9 50 __ LDA #$50
3704 : c8 __ __ INY
3705 : 91 23 __ STA (SP + 0),y 
3707 : 20 0a 53 JSR $530a ; (vdcwin_printline.s1000 + 0)
370a : 4c 94 29 JMP $2994 ; (main.s8479 + 0)
.s1307:
370d : a9 00 __ LDA #$00
370f : 9d ca be STA $beca,x ; (wrapbuffer + 0)
3712 : aa __ __ TAX
3713 : ad ca be LDA $beca ; (wrapbuffer + 0)
3716 : f0 08 __ BEQ $3720 ; (main.s1313 + 0)
.l1714:
3718 : bd cb be LDA $becb,x ; (wrapbuffer + 1)
371b : e8 __ __ INX
371c : 09 00 __ ORA #$00
371e : d0 f8 __ BNE $3718 ; (main.l1714 + 0)
.s1313:
3720 : 8a __ __ TXA
3721 : 18 __ __ CLC
3722 : 6d 4f bf ADC $bf4f ; (window + 4)
3725 : b0 06 __ BCS $372d ; (main.s1315 + 0)
.s1274:
3727 : c5 5b __ CMP T5 + 0 
3729 : 90 1a __ BCC $3745 ; (main.s1317 + 0)
.s1753:
372b : f0 18 __ BEQ $3745 ; (main.s1317 + 0)
.s1315:
372d : a9 4b __ LDA #$4b
372f : a0 02 __ LDY #$02
3731 : 91 23 __ STA (SP + 0),y 
3733 : a9 bf __ LDA #$bf
3735 : c8 __ __ INY
3736 : 91 23 __ STA (SP + 0),y 
3738 : a9 e1 __ LDA #$e1
373a : c8 __ __ INY
373b : 91 23 __ STA (SP + 0),y 
373d : a9 50 __ LDA #$50
373f : c8 __ __ INY
3740 : 91 23 __ STA (SP + 0),y 
3742 : 20 0a 53 JSR $530a ; (vdcwin_printline.s1000 + 0)
.s1317:
3745 : a9 4b __ LDA #$4b
3747 : a0 02 __ LDY #$02
3749 : 91 23 __ STA (SP + 0),y 
374b : a9 bf __ LDA #$bf
374d : c8 __ __ INY
374e : 91 23 __ STA (SP + 0),y 
3750 : a9 ca __ LDA #$ca
3752 : c8 __ __ INY
3753 : 91 23 __ STA (SP + 0),y 
3755 : a9 be __ LDA #$be
3757 : c8 __ __ INY
3758 : 91 23 __ STA (SP + 0),y 
375a : 20 e3 55 JSR $55e3 ; (vdcwin_put_string.s1000 + 0)
375d : a5 61 __ LDA T8 + 0 
375f : c5 59 __ CMP T4 + 0 
3761 : 90 03 __ BCC $3766 ; (main.s7845 + 0)
3763 : 4c 8c 29 JMP $298c ; (main.s1283 + 0)
.s7845:
3766 : a9 00 __ LDA #$00
3768 : 85 43 __ STA T10 + 0 
376a : a9 ff __ LDA #$ff
376c : 85 60 __ STA T7 + 1 
376e : 85 5e __ STA T6 + 1 
3770 : 4c 6c 29 JMP $296c ; (main.l1292 + 0)
.s1294:
3773 : a6 61 __ LDX T8 + 0 
3775 : bd 00 5b LDA $5b00,x ; (linebuffer + 0)
3778 : a6 43 __ LDX T10 + 0 
377a : 9d ca be STA $beca,x ; (wrapbuffer + 0)
377d : c9 20 __ CMP #$20
377f : d0 06 __ BNE $3787 ; (main.s1298 + 0)
.s1304:
3781 : a9 00 __ LDA #$00
3783 : 85 60 __ STA T7 + 1 
3785 : f0 08 __ BEQ $378f ; (main.s8480 + 0)
.s1298:
3787 : 24 5e __ BIT T6 + 1 
3789 : 10 04 __ BPL $378f ; (main.s8480 + 0)
.s1301:
378b : a9 00 __ LDA #$00
378d : 85 5e __ STA T6 + 1 
.s8480:
378f : e6 61 __ INC T8 + 0 
3791 : e6 43 __ INC T10 + 0 
3793 : 4c 6c 29 JMP $296c ; (main.l1292 + 0)
.s1098:
3796 : 98 __ __ TYA
3797 : 0a __ __ ASL
3798 : aa __ __ TAX
3799 : bd 37 5a LDA $5a37,x ; (multab + 0)
379c : 18 __ __ CLC
379d : 69 4b __ ADC #$4b
379f : 85 59 __ STA T4 + 0 
37a1 : a9 12 __ LDA #$12
37a3 : 8d 00 d6 STA $d600 
37a6 : bd 38 5a LDA $5a38,x ; (multab + 1)
37a9 : 69 00 __ ADC #$00
37ab : 85 5a __ STA T4 + 1 
37ad : 18 __ __ CLC
37ae : a5 59 __ LDA T4 + 0 
37b0 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
37b3 : aa __ __ TAX
37b4 : a5 5a __ LDA T4 + 1 
37b6 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11496:
37b9 : 2c 00 d6 BIT $d600 
37bc : 10 fb __ BPL $37b9 ; (main.l11496 + 0)
.s1110:
37be : 8d 01 d6 STA $d601 
37c1 : a9 13 __ LDA #$13
37c3 : 8d 00 d6 STA $d600 
.l11498:
37c6 : 2c 00 d6 BIT $d600 
37c9 : 10 fb __ BPL $37c6 ; (main.l11498 + 0)
.s1115:
37cb : 8e 01 d6 STX $d601 
37ce : a9 1f __ LDA #$1f
37d0 : 8d 00 d6 STA $d600 
.l11500:
37d3 : 2c 00 d6 BIT $d600 
37d6 : 10 fb __ BPL $37d3 ; (main.l11500 + 0)
.s1119:
37d8 : a9 61 __ LDA #$61
37da : 8d 01 d6 STA $d601 
37dd : ad 28 5a LDA $5a28 ; (vdc_state + 10)
37e0 : 18 __ __ CLC
37e1 : 65 59 __ ADC T4 + 0 
37e3 : aa __ __ TAX
37e4 : a9 12 __ LDA #$12
37e6 : 8d 00 d6 STA $d600 
37e9 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
37ec : 65 5a __ ADC T4 + 1 
.l11502:
37ee : 2c 00 d6 BIT $d600 
37f1 : 10 fb __ BPL $37ee ; (main.l11502 + 0)
.s1126:
37f3 : 8d 01 d6 STA $d601 
37f6 : a9 13 __ LDA #$13
37f8 : 8d 00 d6 STA $d600 
.l11504:
37fb : 2c 00 d6 BIT $d600 
37fe : 10 fb __ BPL $37fb ; (main.l11504 + 0)
.s1131:
3800 : 8e 01 d6 STX $d601 
3803 : a9 1f __ LDA #$1f
3805 : 8d 00 d6 STA $d600 
.l11506:
3808 : 2c 00 d6 BIT $d600 
380b : 10 fb __ BPL $3808 ; (main.l11506 + 0)
.s1135:
380d : a9 09 __ LDA #$09
380f : 8d 01 d6 STA $d601 
3812 : c8 __ __ INY
3813 : 4c 05 27 JMP $2705 ; (main.l1097 + 0)
.s1058:
3816 : 98 __ __ TYA
3817 : 0a __ __ ASL
3818 : aa __ __ TAX
3819 : bd 37 5a LDA $5a37,x ; (multab + 0)
381c : 18 __ __ CLC
381d : 69 04 __ ADC #$04
381f : 85 57 __ STA T3 + 0 
3821 : a9 12 __ LDA #$12
3823 : 8d 00 d6 STA $d600 
3826 : bd 38 5a LDA $5a38,x ; (multab + 1)
3829 : 69 00 __ ADC #$00
382b : 85 58 __ STA T3 + 1 
382d : 18 __ __ CLC
382e : a5 57 __ LDA T3 + 0 
3830 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
3833 : aa __ __ TAX
3834 : a5 58 __ LDA T3 + 1 
3836 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11483:
3839 : 2c 00 d6 BIT $d600 
383c : 10 fb __ BPL $3839 ; (main.l11483 + 0)
.s1070:
383e : 8d 01 d6 STA $d601 
3841 : a9 13 __ LDA #$13
3843 : 8d 00 d6 STA $d600 
.l11485:
3846 : 2c 00 d6 BIT $d600 
3849 : 10 fb __ BPL $3846 ; (main.l11485 + 0)
.s1075:
384b : 8e 01 d6 STX $d601 
384e : a9 1f __ LDA #$1f
3850 : 8d 00 d6 STA $d600 
.l11487:
3853 : 2c 00 d6 BIT $d600 
3856 : 10 fb __ BPL $3853 ; (main.l11487 + 0)
.s1079:
3858 : a9 e1 __ LDA #$e1
385a : 8d 01 d6 STA $d601 
385d : ad 28 5a LDA $5a28 ; (vdc_state + 10)
3860 : 18 __ __ CLC
3861 : 65 57 __ ADC T3 + 0 
3863 : aa __ __ TAX
3864 : a9 12 __ LDA #$12
3866 : 8d 00 d6 STA $d600 
3869 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
386c : 65 58 __ ADC T3 + 1 
.l11489:
386e : 2c 00 d6 BIT $d600 
3871 : 10 fb __ BPL $386e ; (main.l11489 + 0)
.s1086:
3873 : 8d 01 d6 STA $d601 
3876 : a9 13 __ LDA #$13
3878 : 8d 00 d6 STA $d600 
.l11491:
387b : 2c 00 d6 BIT $d600 
387e : 10 fb __ BPL $387b ; (main.l11491 + 0)
.s1091:
3880 : 8e 01 d6 STX $d601 
3883 : a9 1f __ LDA #$1f
3885 : 8d 00 d6 STA $d600 
.l11493:
3888 : 2c 00 d6 BIT $d600 
388b : 10 fb __ BPL $3888 ; (main.l11493 + 0)
.s1095:
388d : a9 09 __ LDA #$09
388f : 8d 01 d6 STA $d601 
3892 : c8 __ __ INY
3893 : 4c e9 26 JMP $26e9 ; (main.l1057 + 0)
.s753:
3896 : 0a __ __ ASL
3897 : aa __ __ TAX
3898 : ad 25 5a LDA $5a25 ; (vdc_state + 7)
389b : 85 43 __ STA T10 + 0 
389d : a9 12 __ LDA #$12
389f : 8d 00 d6 STA $d600 
38a2 : a5 5b __ LDA T5 + 0 
38a4 : 38 __ __ SEC
38a5 : e9 01 __ SBC #$01
38a7 : 85 62 __ STA T12 + 0 
38a9 : bd 37 5a LDA $5a37,x ; (multab + 0)
38ac : 85 5f __ STA T7 + 0 
38ae : 18 __ __ CLC
38af : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
38b2 : a8 __ __ TAY
38b3 : bd 38 5a LDA $5a38,x ; (multab + 1)
38b6 : 85 60 __ STA T7 + 1 
38b8 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11895:
38bb : 2c 00 d6 BIT $d600 
38be : 10 fb __ BPL $38bb ; (main.l11895 + 0)
.s765:
38c0 : 8d 01 d6 STA $d601 
38c3 : a9 13 __ LDA #$13
38c5 : 8d 00 d6 STA $d600 
.l11897:
38c8 : 2c 00 d6 BIT $d600 
38cb : 10 fb __ BPL $38c8 ; (main.l11897 + 0)
.s770:
38cd : 8c 01 d6 STY $d601 
38d0 : a9 1f __ LDA #$1f
38d2 : 8d 00 d6 STA $d600 
.l11899:
38d5 : 2c 00 d6 BIT $d600 
38d8 : 10 fb __ BPL $38d5 ; (main.l11899 + 0)
.s774:
38da : a9 20 __ LDA #$20
38dc : 8d 01 d6 STA $d601 
38df : a9 18 __ LDA #$18
38e1 : 8d 00 d6 STA $d600 
.l11901:
38e4 : 2c 00 d6 BIT $d600 
38e7 : 10 fb __ BPL $38e4 ; (main.l11901 + 0)
.s780:
38e9 : ad 01 d6 LDA $d601 
38ec : 29 7f __ AND #$7f
38ee : a8 __ __ TAY
38ef : a9 18 __ LDA #$18
38f1 : 8d 00 d6 STA $d600 
.l11903:
38f4 : 2c 00 d6 BIT $d600 
38f7 : 10 fb __ BPL $38f4 ; (main.l11903 + 0)
.s786:
38f9 : 8c 01 d6 STY $d601 
38fc : a9 1e __ LDA #$1e
38fe : 8d 00 d6 STA $d600 
.l11905:
3901 : 2c 00 d6 BIT $d600 
3904 : 10 fb __ BPL $3901 ; (main.l11905 + 0)
.s791:
3906 : a5 62 __ LDA T12 + 0 
3908 : 8d 01 d6 STA $d601 
390b : ad 28 5a LDA $5a28 ; (vdc_state + 10)
390e : 18 __ __ CLC
390f : 65 5f __ ADC T7 + 0 
3911 : aa __ __ TAX
3912 : a9 12 __ LDA #$12
3914 : 8d 00 d6 STA $d600 
3917 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
391a : 65 60 __ ADC T7 + 1 
.l11907:
391c : 2c 00 d6 BIT $d600 
391f : 10 fb __ BPL $391c ; (main.l11907 + 0)
.s798:
3921 : 8d 01 d6 STA $d601 
3924 : a9 13 __ LDA #$13
3926 : 8d 00 d6 STA $d600 
.l11909:
3929 : 2c 00 d6 BIT $d600 
392c : 10 fb __ BPL $3929 ; (main.l11909 + 0)
.s803:
392e : 8e 01 d6 STX $d601 
3931 : a9 1f __ LDA #$1f
3933 : 8d 00 d6 STA $d600 
.l11911:
3936 : 2c 00 d6 BIT $d600 
3939 : 10 fb __ BPL $3936 ; (main.l11911 + 0)
.s807:
393b : a5 43 __ LDA T10 + 0 
393d : 8d 01 d6 STA $d601 
3940 : a9 18 __ LDA #$18
3942 : 8d 00 d6 STA $d600 
.l11913:
3945 : 2c 00 d6 BIT $d600 
3948 : 10 fb __ BPL $3945 ; (main.l11913 + 0)
.s813:
394a : ad 01 d6 LDA $d601 
394d : 29 7f __ AND #$7f
394f : aa __ __ TAX
3950 : a9 18 __ LDA #$18
3952 : 8d 00 d6 STA $d600 
.l11915:
3955 : 2c 00 d6 BIT $d600 
3958 : 10 fb __ BPL $3955 ; (main.l11915 + 0)
.s819:
395a : 8e 01 d6 STX $d601 
395d : a9 1e __ LDA #$1e
395f : 8d 00 d6 STA $d600 
.l11917:
3962 : 2c 00 d6 BIT $d600 
3965 : 10 fb __ BPL $3962 ; (main.l11917 + 0)
.s824:
3967 : a5 62 __ LDA T12 + 0 
3969 : 8d 01 d6 STA $d601 
396c : e6 61 __ INC T8 + 0 
396e : 4c 4a 23 JMP $234a ; (main.l752 + 0)
.s701:
3971 : ad 26 bf LDA $bf26 ; (softscroll + 11)
3974 : 69 02 __ ADC #$02
3976 : 8d 26 bf STA $bf26 ; (softscroll + 11)
3979 : 90 03 __ BCC $397e ; (main.s1761 + 0)
.s1760:
397b : ee 27 bf INC $bf27 ; (softscroll + 12)
.s1761:
397e : a9 01 __ LDA #$01
3980 : cd 23 bf CMP $bf23 ; (softscroll + 8)
3983 : b0 03 __ BCS $3988 ; (main.s706 + 0)
3985 : 4c 18 3a JMP $3a18 ; (main.s705 + 0)
.s706:
3988 : a9 06 __ LDA #$06
398a : 8d 23 bf STA $bf23 ; (softscroll + 8)
398d : ad 20 bf LDA $bf20 ; (softscroll + 5)
3990 : 18 __ __ CLC
3991 : 69 01 __ ADC #$01
3993 : 85 5d __ STA T6 + 0 
3995 : 8d 20 bf STA $bf20 ; (softscroll + 5)
3998 : ad 21 bf LDA $bf21 ; (softscroll + 6)
399b : 69 00 __ ADC #$00
399d : 85 5e __ STA T6 + 1 
399f : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l11926:
39a2 : ad 00 d6 LDA $d600 
39a5 : 29 20 __ AND #$20
39a7 : d0 f9 __ BNE $39a2 ; (main.l11926 + 0)
.s716:
39a9 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
39ac : 18 __ __ CLC
39ad : 65 5d __ ADC T6 + 0 
39af : aa __ __ TAX
39b0 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
39b3 : 65 5e __ ADC T6 + 1 
39b5 : a8 __ __ TAY
39b6 : ad 26 5a LDA $5a26 ; (vdc_state + 8)
39b9 : 18 __ __ CLC
39ba : 65 5d __ ADC T6 + 0 
39bc : 85 5d __ STA T6 + 0 
39be : a9 0c __ LDA #$0c
39c0 : 8d 00 d6 STA $d600 
39c3 : ad 27 5a LDA $5a27 ; (vdc_state + 9)
39c6 : 65 5e __ ADC T6 + 1 
.l11928:
39c8 : 2c 00 d6 BIT $d600 
39cb : 10 fb __ BPL $39c8 ; (main.l11928 + 0)
.s724:
39cd : 8d 01 d6 STA $d601 
39d0 : a9 0d __ LDA #$0d
39d2 : 8d 00 d6 STA $d600 
.l11930:
39d5 : 2c 00 d6 BIT $d600 
39d8 : 10 fb __ BPL $39d5 ; (main.l11930 + 0)
.s729:
39da : a5 5d __ LDA T6 + 0 
39dc : 8d 01 d6 STA $d601 
39df : a9 14 __ LDA #$14
39e1 : 8d 00 d6 STA $d600 
.l11932:
39e4 : 2c 00 d6 BIT $d600 
39e7 : 10 fb __ BPL $39e4 ; (main.l11932 + 0)
.s734:
39e9 : 8c 01 d6 STY $d601 
39ec : a9 15 __ LDA #$15
39ee : 8d 00 d6 STA $d600 
.l11934:
39f1 : 2c 00 d6 BIT $d600 
39f4 : 10 fb __ BPL $39f1 ; (main.l11934 + 0)
.s739:
39f6 : 8e 01 d6 STX $d601 
.l11936:
39f9 : ad 00 d6 LDA $d600 
39fc : 29 20 __ AND #$20
39fe : f0 f9 __ BEQ $39f9 ; (main.l11936 + 0)
.s740:
3a00 : a9 19 __ LDA #$19
3a02 : 8d 00 d6 STA $d600 
3a05 : ad 25 bf LDA $bf25 ; (softscroll + 10)
3a08 : 18 __ __ CLC
3a09 : 69 06 __ ADC #$06
.l11892:
3a0b : 2c 00 d6 BIT $d600 
3a0e : 10 fb __ BPL $3a0b ; (main.l11892 + 0)
.s17233:
3a10 : 8d 01 d6 STA $d601 
3a13 : a5 1b __ LDA ACCU + 0 
3a15 : 4c 35 23 JMP $2335 ; (main.s748 + 0)
.s705:
3a18 : ad 23 bf LDA $bf23 ; (softscroll + 8)
3a1b : 38 __ __ SEC
3a1c : e9 02 __ SBC #$02
3a1e : 8d 23 bf STA $bf23 ; (softscroll + 8)
3a21 : aa __ __ TAX
.l11891:
3a22 : ad 00 d6 LDA $d600 
3a25 : 29 20 __ AND #$20
3a27 : f0 f9 __ BEQ $3a22 ; (main.l11891 + 0)
.s708:
3a29 : a9 19 __ LDA #$19
3a2b : 8d 00 d6 STA $d600 
3a2e : 8a __ __ TXA
3a2f : 18 __ __ CLC
3a30 : 6d 25 bf ADC $bf25 ; (softscroll + 10)
3a33 : 4c 0b 3a JMP $3a0b ; (main.l11892 + 0)
.s653:
3a36 : a9 00 __ LDA #$00
3a38 : 8d 23 bf STA $bf23 ; (softscroll + 8)
3a3b : ad 20 bf LDA $bf20 ; (softscroll + 5)
3a3e : 18 __ __ CLC
3a3f : 69 ff __ ADC #$ff
3a41 : 85 5d __ STA T6 + 0 
3a43 : 8d 20 bf STA $bf20 ; (softscroll + 5)
3a46 : ad 21 bf LDA $bf21 ; (softscroll + 6)
3a49 : 69 ff __ ADC #$ff
3a4b : 85 5e __ STA T6 + 1 
3a4d : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l11874:
3a50 : ad 00 d6 LDA $d600 
3a53 : 29 20 __ AND #$20
3a55 : d0 f9 __ BNE $3a50 ; (main.l11874 + 0)
.s656:
3a57 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
3a5a : 18 __ __ CLC
3a5b : 65 5d __ ADC T6 + 0 
3a5d : aa __ __ TAX
3a5e : ad 29 5a LDA $5a29 ; (vdc_state + 11)
3a61 : 65 5e __ ADC T6 + 1 
3a63 : a8 __ __ TAY
3a64 : ad 26 5a LDA $5a26 ; (vdc_state + 8)
3a67 : 18 __ __ CLC
3a68 : 65 5d __ ADC T6 + 0 
3a6a : 85 5d __ STA T6 + 0 
3a6c : a9 0c __ LDA #$0c
3a6e : 8d 00 d6 STA $d600 
3a71 : ad 27 5a LDA $5a27 ; (vdc_state + 9)
3a74 : 65 5e __ ADC T6 + 1 
.l11876:
3a76 : 2c 00 d6 BIT $d600 
3a79 : 10 fb __ BPL $3a76 ; (main.l11876 + 0)
.s664:
3a7b : 8d 01 d6 STA $d601 
3a7e : a9 0d __ LDA #$0d
3a80 : 8d 00 d6 STA $d600 
.l11878:
3a83 : 2c 00 d6 BIT $d600 
3a86 : 10 fb __ BPL $3a83 ; (main.l11878 + 0)
.s669:
3a88 : a5 5d __ LDA T6 + 0 
3a8a : 8d 01 d6 STA $d601 
3a8d : a9 14 __ LDA #$14
3a8f : 8d 00 d6 STA $d600 
.l11880:
3a92 : 2c 00 d6 BIT $d600 
3a95 : 10 fb __ BPL $3a92 ; (main.l11880 + 0)
.s674:
3a97 : 8c 01 d6 STY $d601 
3a9a : a9 15 __ LDA #$15
3a9c : 8d 00 d6 STA $d600 
.l11882:
3a9f : 2c 00 d6 BIT $d600 
3aa2 : 10 fb __ BPL $3a9f ; (main.l11882 + 0)
.s679:
3aa4 : 8e 01 d6 STX $d601 
.l11884:
3aa7 : ad 00 d6 LDA $d600 
3aaa : 29 20 __ AND #$20
3aac : f0 f9 __ BEQ $3aa7 ; (main.l11884 + 0)
.l685:
3aae : ad 00 d6 LDA $d600 
3ab1 : 29 20 __ AND #$20
3ab3 : d0 f9 __ BNE $3aae ; (main.l685 + 0)
.s680:
3ab5 : a9 19 __ LDA #$19
3ab7 : 8d 00 d6 STA $d600 
3aba : ae 25 bf LDX $bf25 ; (softscroll + 10)
.l11886:
3abd : 2c 00 d6 BIT $d600 
3ac0 : 10 fb __ BPL $3abd ; (main.l11886 + 0)
.s691:
3ac2 : 8a __ __ TXA
3ac3 : 4c 00 23 JMP $2300 ; (main.s1718 + 0)
.l600:
3ac6 : ad 00 d6 LDA $d600 
3ac9 : 29 20 __ AND #$20
3acb : f0 f9 __ BEQ $3ac6 ; (main.l600 + 0)
.l609:
3acd : ad 00 d6 LDA $d600 
3ad0 : 29 20 __ AND #$20
3ad2 : d0 f9 __ BNE $3acd ; (main.l609 + 0)
.s604:
3ad4 : 8a __ __ TXA
3ad5 : 18 __ __ CLC
3ad6 : 69 02 __ ADC #$02
3ad8 : 8d 28 bf STA $bf28 ; (softscroll + 13)
3adb : 90 01 __ BCC $3ade ; (main.s1763 + 0)
.s1762:
3add : c8 __ __ INY
.s1763:
3ade : 8c 29 bf STY $bf29 ; (softscroll + 14)
3ae1 : ee 22 bf INC $bf22 ; (softscroll + 7)
3ae4 : ee 22 bf INC $bf22 ; (softscroll + 7)
3ae7 : a9 06 __ LDA #$06
3ae9 : cd 22 bf CMP $bf22 ; (softscroll + 7)
3aec : a9 18 __ LDA #$18
3aee : 8d 00 d6 STA $d600 
3af1 : ae 24 bf LDX $bf24 ; (softscroll + 9)
3af4 : 90 10 __ BCC $3b06 ; (main.s611 + 0)
.s612:
3af6 : 8a __ __ TXA
3af7 : 18 __ __ CLC
3af8 : 6d 22 bf ADC $bf22 ; (softscroll + 7)
.l11944:
3afb : 2c 00 d6 BIT $d600 
3afe : 10 fb __ BPL $3afb ; (main.l11944 + 0)
.s1717:
3b00 : 8d 01 d6 STA $d601 
3b03 : 4c c0 22 JMP $22c0 ; (main.s598 + 0)
.s611:
3b06 : a9 00 __ LDA #$00
3b08 : 8d 22 bf STA $bf22 ; (softscroll + 7)
3b0b : ad 20 bf LDA $bf20 ; (softscroll + 5)
3b0e : 6d 1e bf ADC $bf1e ; (softscroll + 3)
3b11 : 85 5d __ STA T6 + 0 
3b13 : 8d 20 bf STA $bf20 ; (softscroll + 5)
3b16 : ad 21 bf LDA $bf21 ; (softscroll + 6)
3b19 : 69 00 __ ADC #$00
3b1b : 85 5e __ STA T6 + 1 
3b1d : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l11861:
3b20 : 2c 00 d6 BIT $d600 
3b23 : 10 fb __ BPL $3b20 ; (main.l11861 + 0)
.s618:
3b25 : 8e 01 d6 STX $d601 
3b28 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
3b2b : 18 __ __ CLC
3b2c : 65 5d __ ADC T6 + 0 
3b2e : aa __ __ TAX
3b2f : ad 29 5a LDA $5a29 ; (vdc_state + 11)
3b32 : 65 5e __ ADC T6 + 1 
3b34 : a8 __ __ TAY
3b35 : ad 26 5a LDA $5a26 ; (vdc_state + 8)
3b38 : 18 __ __ CLC
3b39 : 65 5d __ ADC T6 + 0 
3b3b : 85 5d __ STA T6 + 0 
3b3d : a9 0c __ LDA #$0c
3b3f : 8d 00 d6 STA $d600 
3b42 : ad 27 5a LDA $5a27 ; (vdc_state + 9)
3b45 : 65 5e __ ADC T6 + 1 
.l11863:
3b47 : 2c 00 d6 BIT $d600 
3b4a : 10 fb __ BPL $3b47 ; (main.l11863 + 0)
.s624:
3b4c : 8d 01 d6 STA $d601 
3b4f : a9 0d __ LDA #$0d
3b51 : 8d 00 d6 STA $d600 
.l11865:
3b54 : 2c 00 d6 BIT $d600 
3b57 : 10 fb __ BPL $3b54 ; (main.l11865 + 0)
.s629:
3b59 : a5 5d __ LDA T6 + 0 
3b5b : 8d 01 d6 STA $d601 
3b5e : a9 14 __ LDA #$14
3b60 : 8d 00 d6 STA $d600 
.l11867:
3b63 : 2c 00 d6 BIT $d600 
3b66 : 10 fb __ BPL $3b63 ; (main.l11867 + 0)
.s634:
3b68 : 8c 01 d6 STY $d601 
3b6b : a9 15 __ LDA #$15
3b6d : 8d 00 d6 STA $d600 
.l11869:
3b70 : 2c 00 d6 BIT $d600 
3b73 : 10 fb __ BPL $3b70 ; (main.l11869 + 0)
.s639:
3b75 : 8a __ __ TXA
3b76 : 4c 00 3b JMP $3b00 ; (main.s1717 + 0)
.l548:
3b79 : ad 00 d6 LDA $d600 
3b7c : 29 20 __ AND #$20
3b7e : f0 f9 __ BEQ $3b79 ; (main.l548 + 0)
.l557:
3b80 : ad 00 d6 LDA $d600 
3b83 : 29 20 __ AND #$20
3b85 : d0 f9 __ BNE $3b80 ; (main.l557 + 0)
.s552:
3b87 : 8a __ __ TXA
3b88 : 38 __ __ SEC
3b89 : e9 02 __ SBC #$02
3b8b : 8d 28 bf STA $bf28 ; (softscroll + 13)
3b8e : a5 5e __ LDA T6 + 1 
3b90 : e9 00 __ SBC #$00
3b92 : 8d 29 bf STA $bf29 ; (softscroll + 14)
3b95 : a9 01 __ LDA #$01
3b97 : cd 22 bf CMP $bf22 ; (softscroll + 7)
3b9a : b0 03 __ BCS $3b9f ; (main.s560 + 0)
3b9c : 4c 29 3c JMP $3c29 ; (main.s559 + 0)
.s560:
3b9f : a9 06 __ LDA #$06
3ba1 : 8d 22 bf STA $bf22 ; (softscroll + 7)
3ba4 : ad 20 bf LDA $bf20 ; (softscroll + 5)
3ba7 : ed 1e bf SBC $bf1e ; (softscroll + 3)
3baa : 85 5d __ STA T6 + 0 
3bac : 8d 20 bf STA $bf20 ; (softscroll + 5)
3baf : ad 21 bf LDA $bf21 ; (softscroll + 6)
3bb2 : e9 00 __ SBC #$00
3bb4 : 85 5e __ STA T6 + 1 
3bb6 : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l11948:
3bb9 : ad 00 d6 LDA $d600 
3bbc : 29 20 __ AND #$20
3bbe : d0 f9 __ BNE $3bb9 ; (main.l11948 + 0)
.s567:
3bc0 : a9 18 __ LDA #$18
3bc2 : 8d 00 d6 STA $d600 
3bc5 : ad 24 bf LDA $bf24 ; (softscroll + 9)
3bc8 : 18 __ __ CLC
3bc9 : 69 06 __ ADC #$06
.l11950:
3bcb : 2c 00 d6 BIT $d600 
3bce : 10 fb __ BPL $3bcb ; (main.l11950 + 0)
.s574:
3bd0 : 8d 01 d6 STA $d601 
3bd3 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
3bd6 : 18 __ __ CLC
3bd7 : 65 5d __ ADC T6 + 0 
3bd9 : aa __ __ TAX
3bda : ad 29 5a LDA $5a29 ; (vdc_state + 11)
3bdd : 65 5e __ ADC T6 + 1 
3bdf : a8 __ __ TAY
3be0 : ad 26 5a LDA $5a26 ; (vdc_state + 8)
3be3 : 18 __ __ CLC
3be4 : 65 5d __ ADC T6 + 0 
3be6 : 85 5d __ STA T6 + 0 
3be8 : a9 0c __ LDA #$0c
3bea : 8d 00 d6 STA $d600 
3bed : ad 27 5a LDA $5a27 ; (vdc_state + 9)
3bf0 : 65 5e __ ADC T6 + 1 
.l11952:
3bf2 : 2c 00 d6 BIT $d600 
3bf5 : 10 fb __ BPL $3bf2 ; (main.l11952 + 0)
.s580:
3bf7 : 8d 01 d6 STA $d601 
3bfa : a9 0d __ LDA #$0d
3bfc : 8d 00 d6 STA $d600 
.l11954:
3bff : 2c 00 d6 BIT $d600 
3c02 : 10 fb __ BPL $3bff ; (main.l11954 + 0)
.s585:
3c04 : a5 5d __ LDA T6 + 0 
3c06 : 8d 01 d6 STA $d601 
3c09 : a9 14 __ LDA #$14
3c0b : 8d 00 d6 STA $d600 
.l11956:
3c0e : 2c 00 d6 BIT $d600 
3c11 : 10 fb __ BPL $3c0e ; (main.l11956 + 0)
.s590:
3c13 : 8c 01 d6 STY $d601 
3c16 : a9 15 __ LDA #$15
3c18 : 8d 00 d6 STA $d600 
.l11958:
3c1b : 2c 00 d6 BIT $d600 
3c1e : 10 fb __ BPL $3c1b ; (main.l11958 + 0)
.s595:
3c20 : 8a __ __ TXA
.s1716:
3c21 : 8d 01 d6 STA $d601 
3c24 : a5 1b __ LDA ACCU + 0 
3c26 : 4c 99 22 JMP $2299 ; (main.s599 + 0)
.s559:
3c29 : ce 22 bf DEC $bf22 ; (softscroll + 7)
3c2c : ce 22 bf DEC $bf22 ; (softscroll + 7)
3c2f : a9 18 __ LDA #$18
3c31 : 8d 00 d6 STA $d600 
3c34 : ad 22 bf LDA $bf22 ; (softscroll + 7)
3c37 : 6d 24 bf ADC $bf24 ; (softscroll + 9)
.l11855:
3c3a : 2c 00 d6 BIT $d600 
3c3d : 10 fb __ BPL $3c3a ; (main.l11855 + 0)
3c3f : 4c 21 3c JMP $3c21 ; (main.s1716 + 0)
.l408:
3c42 : 0a __ __ ASL
3c43 : aa __ __ TAX
3c44 : ad 25 5a LDA $5a25 ; (vdc_state + 7)
3c47 : 85 43 __ STA T10 + 0 
3c49 : a9 12 __ LDA #$12
3c4b : 8d 00 d6 STA $d600 
3c4e : a5 5b __ LDA T5 + 0 
3c50 : 38 __ __ SEC
3c51 : e9 01 __ SBC #$01
3c53 : 85 62 __ STA T12 + 0 
3c55 : bd 37 5a LDA $5a37,x ; (multab + 0)
3c58 : 85 5d __ STA T6 + 0 
3c5a : 18 __ __ CLC
3c5b : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
3c5e : a8 __ __ TAY
3c5f : bd 38 5a LDA $5a38,x ; (multab + 1)
3c62 : 85 5e __ STA T6 + 1 
3c64 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11806:
3c67 : 2c 00 d6 BIT $d600 
3c6a : 10 fb __ BPL $3c67 ; (main.l11806 + 0)
.s420:
3c6c : 8d 01 d6 STA $d601 
3c6f : a9 13 __ LDA #$13
3c71 : 8d 00 d6 STA $d600 
.l11808:
3c74 : 2c 00 d6 BIT $d600 
3c77 : 10 fb __ BPL $3c74 ; (main.l11808 + 0)
.s425:
3c79 : 8c 01 d6 STY $d601 
3c7c : a9 1f __ LDA #$1f
3c7e : 8d 00 d6 STA $d600 
.l11810:
3c81 : 2c 00 d6 BIT $d600 
3c84 : 10 fb __ BPL $3c81 ; (main.l11810 + 0)
.s429:
3c86 : a9 20 __ LDA #$20
3c88 : 8d 01 d6 STA $d601 
3c8b : a9 18 __ LDA #$18
3c8d : 8d 00 d6 STA $d600 
.l11812:
3c90 : 2c 00 d6 BIT $d600 
3c93 : 10 fb __ BPL $3c90 ; (main.l11812 + 0)
.s435:
3c95 : ad 01 d6 LDA $d601 
3c98 : 29 7f __ AND #$7f
3c9a : a8 __ __ TAY
3c9b : a9 18 __ LDA #$18
3c9d : 8d 00 d6 STA $d600 
.l11814:
3ca0 : 2c 00 d6 BIT $d600 
3ca3 : 10 fb __ BPL $3ca0 ; (main.l11814 + 0)
.s441:
3ca5 : 8c 01 d6 STY $d601 
3ca8 : a9 1e __ LDA #$1e
3caa : 8d 00 d6 STA $d600 
.l11816:
3cad : 2c 00 d6 BIT $d600 
3cb0 : 10 fb __ BPL $3cad ; (main.l11816 + 0)
.s446:
3cb2 : a5 62 __ LDA T12 + 0 
3cb4 : 8d 01 d6 STA $d601 
3cb7 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
3cba : 18 __ __ CLC
3cbb : 65 5d __ ADC T6 + 0 
3cbd : aa __ __ TAX
3cbe : a9 12 __ LDA #$12
3cc0 : 8d 00 d6 STA $d600 
3cc3 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
3cc6 : 65 5e __ ADC T6 + 1 
.l11818:
3cc8 : 2c 00 d6 BIT $d600 
3ccb : 10 fb __ BPL $3cc8 ; (main.l11818 + 0)
.s453:
3ccd : 8d 01 d6 STA $d601 
3cd0 : a9 13 __ LDA #$13
3cd2 : 8d 00 d6 STA $d600 
.l11820:
3cd5 : 2c 00 d6 BIT $d600 
3cd8 : 10 fb __ BPL $3cd5 ; (main.l11820 + 0)
.s458:
3cda : 8e 01 d6 STX $d601 
3cdd : a9 1f __ LDA #$1f
3cdf : 8d 00 d6 STA $d600 
.l11822:
3ce2 : 2c 00 d6 BIT $d600 
3ce5 : 10 fb __ BPL $3ce2 ; (main.l11822 + 0)
.s462:
3ce7 : a5 43 __ LDA T10 + 0 
3ce9 : 8d 01 d6 STA $d601 
3cec : a9 18 __ LDA #$18
3cee : 8d 00 d6 STA $d600 
.l11824:
3cf1 : 2c 00 d6 BIT $d600 
3cf4 : 10 fb __ BPL $3cf1 ; (main.l11824 + 0)
.s468:
3cf6 : ad 01 d6 LDA $d601 
3cf9 : 29 7f __ AND #$7f
3cfb : aa __ __ TAX
3cfc : a9 18 __ LDA #$18
3cfe : 8d 00 d6 STA $d600 
.l11826:
3d01 : 2c 00 d6 BIT $d600 
3d04 : 10 fb __ BPL $3d01 ; (main.l11826 + 0)
.s474:
3d06 : 8e 01 d6 STX $d601 
3d09 : a9 1e __ LDA #$1e
3d0b : 8d 00 d6 STA $d600 
.l11828:
3d0e : 2c 00 d6 BIT $d600 
3d11 : 10 fb __ BPL $3d0e ; (main.l11828 + 0)
.s479:
3d13 : a5 62 __ LDA T12 + 0 
3d15 : 8d 01 d6 STA $d601 
3d18 : e6 61 __ INC T8 + 0 
3d1a : a5 61 __ LDA T8 + 0 
3d1c : c5 5f __ CMP T7 + 0 
3d1e : b0 03 __ BCS $3d23 ; (main.s479 + 16)
3d20 : 4c 42 3c JMP $3c42 ; (main.l408 + 0)
3d23 : 4c 55 21 JMP $2155 ; (main.s405 + 0)
.s299:
3d26 : 0a __ __ ASL
3d27 : aa __ __ TAX
3d28 : ad 25 5a LDA $5a25 ; (vdc_state + 7)
3d2b : 85 56 __ STA T2 + 0 
3d2d : a9 12 __ LDA #$12
3d2f : 8d 00 d6 STA $d600 
3d32 : a5 54 __ LDA T1 + 0 
3d34 : 38 __ __ SEC
3d35 : e9 01 __ SBC #$01
3d37 : 85 5d __ STA T6 + 0 
3d39 : bd 37 5a LDA $5a37,x ; (multab + 0)
3d3c : 85 59 __ STA T4 + 0 
3d3e : 18 __ __ CLC
3d3f : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
3d42 : a8 __ __ TAY
3d43 : bd 38 5a LDA $5a38,x ; (multab + 1)
3d46 : 85 5a __ STA T4 + 1 
3d48 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11993:
3d4b : 2c 00 d6 BIT $d600 
3d4e : 10 fb __ BPL $3d4b ; (main.l11993 + 0)
.s311:
3d50 : 8d 01 d6 STA $d601 
3d53 : a9 13 __ LDA #$13
3d55 : 8d 00 d6 STA $d600 
.l11995:
3d58 : 2c 00 d6 BIT $d600 
3d5b : 10 fb __ BPL $3d58 ; (main.l11995 + 0)
.s316:
3d5d : 8c 01 d6 STY $d601 
3d60 : a9 1f __ LDA #$1f
3d62 : 8d 00 d6 STA $d600 
.l11997:
3d65 : 2c 00 d6 BIT $d600 
3d68 : 10 fb __ BPL $3d65 ; (main.l11997 + 0)
.s320:
3d6a : a9 20 __ LDA #$20
3d6c : 8d 01 d6 STA $d601 
3d6f : a9 18 __ LDA #$18
3d71 : 8d 00 d6 STA $d600 
.l11999:
3d74 : 2c 00 d6 BIT $d600 
3d77 : 10 fb __ BPL $3d74 ; (main.l11999 + 0)
.s326:
3d79 : ad 01 d6 LDA $d601 
3d7c : 29 7f __ AND #$7f
3d7e : a8 __ __ TAY
3d7f : a9 18 __ LDA #$18
3d81 : 8d 00 d6 STA $d600 
.l12001:
3d84 : 2c 00 d6 BIT $d600 
3d87 : 10 fb __ BPL $3d84 ; (main.l12001 + 0)
.s332:
3d89 : 8c 01 d6 STY $d601 
3d8c : a9 1e __ LDA #$1e
3d8e : 8d 00 d6 STA $d600 
.l12003:
3d91 : 2c 00 d6 BIT $d600 
3d94 : 10 fb __ BPL $3d91 ; (main.l12003 + 0)
.s337:
3d96 : a5 5d __ LDA T6 + 0 
3d98 : 8d 01 d6 STA $d601 
3d9b : ad 28 5a LDA $5a28 ; (vdc_state + 10)
3d9e : 18 __ __ CLC
3d9f : 65 59 __ ADC T4 + 0 
3da1 : aa __ __ TAX
3da2 : a9 12 __ LDA #$12
3da4 : 8d 00 d6 STA $d600 
3da7 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
3daa : 65 5a __ ADC T4 + 1 
.l12005:
3dac : 2c 00 d6 BIT $d600 
3daf : 10 fb __ BPL $3dac ; (main.l12005 + 0)
.s344:
3db1 : 8d 01 d6 STA $d601 
3db4 : a9 13 __ LDA #$13
3db6 : 8d 00 d6 STA $d600 
.l12007:
3db9 : 2c 00 d6 BIT $d600 
3dbc : 10 fb __ BPL $3db9 ; (main.l12007 + 0)
.s349:
3dbe : 8e 01 d6 STX $d601 
3dc1 : a9 1f __ LDA #$1f
3dc3 : 8d 00 d6 STA $d600 
.l12009:
3dc6 : 2c 00 d6 BIT $d600 
3dc9 : 10 fb __ BPL $3dc6 ; (main.l12009 + 0)
.s353:
3dcb : a5 56 __ LDA T2 + 0 
3dcd : 8d 01 d6 STA $d601 
3dd0 : a9 18 __ LDA #$18
3dd2 : 8d 00 d6 STA $d600 
.l12011:
3dd5 : 2c 00 d6 BIT $d600 
3dd8 : 10 fb __ BPL $3dd5 ; (main.l12011 + 0)
.s359:
3dda : ad 01 d6 LDA $d601 
3ddd : 29 7f __ AND #$7f
3ddf : aa __ __ TAX
3de0 : a9 18 __ LDA #$18
3de2 : 8d 00 d6 STA $d600 
.l12013:
3de5 : 2c 00 d6 BIT $d600 
3de8 : 10 fb __ BPL $3de5 ; (main.l12013 + 0)
.s365:
3dea : 8e 01 d6 STX $d601 
3ded : a9 1e __ LDA #$1e
3def : 8d 00 d6 STA $d600 
.l12015:
3df2 : 2c 00 d6 BIT $d600 
3df5 : 10 fb __ BPL $3df2 ; (main.l12015 + 0)
.s370:
3df7 : a5 5d __ LDA T6 + 0 
3df9 : 8d 01 d6 STA $d601 
3dfc : e6 53 __ INC T0 + 0 
3dfe : 4c 7c 1f JMP $1f7c ; (main.l298 + 0)
.s101:
3e01 : 0a __ __ ASL
3e02 : aa __ __ TAX
3e03 : ad 25 5a LDA $5a25 ; (vdc_state + 7)
3e06 : 85 56 __ STA T2 + 0 
3e08 : a9 12 __ LDA #$12
3e0a : 8d 00 d6 STA $d600 
3e0d : a5 54 __ LDA T1 + 0 
3e0f : 38 __ __ SEC
3e10 : e9 01 __ SBC #$01
3e12 : 85 5d __ STA T6 + 0 
3e14 : bd 37 5a LDA $5a37,x ; (multab + 0)
3e17 : 85 59 __ STA T4 + 0 
3e19 : 18 __ __ CLC
3e1a : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
3e1d : a8 __ __ TAY
3e1e : bd 38 5a LDA $5a38,x ; (multab + 1)
3e21 : 85 5a __ STA T4 + 1 
3e23 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11375:
3e26 : 2c 00 d6 BIT $d600 
3e29 : 10 fb __ BPL $3e26 ; (main.l11375 + 0)
.s113:
3e2b : 8d 01 d6 STA $d601 
3e2e : a9 13 __ LDA #$13
3e30 : 8d 00 d6 STA $d600 
.l11377:
3e33 : 2c 00 d6 BIT $d600 
3e36 : 10 fb __ BPL $3e33 ; (main.l11377 + 0)
.s118:
3e38 : 8c 01 d6 STY $d601 
3e3b : a9 1f __ LDA #$1f
3e3d : 8d 00 d6 STA $d600 
.l11379:
3e40 : 2c 00 d6 BIT $d600 
3e43 : 10 fb __ BPL $3e40 ; (main.l11379 + 0)
.s122:
3e45 : a9 20 __ LDA #$20
3e47 : 8d 01 d6 STA $d601 
3e4a : a9 18 __ LDA #$18
3e4c : 8d 00 d6 STA $d600 
.l11381:
3e4f : 2c 00 d6 BIT $d600 
3e52 : 10 fb __ BPL $3e4f ; (main.l11381 + 0)
.s128:
3e54 : ad 01 d6 LDA $d601 
3e57 : 29 7f __ AND #$7f
3e59 : a8 __ __ TAY
3e5a : a9 18 __ LDA #$18
3e5c : 8d 00 d6 STA $d600 
.l11383:
3e5f : 2c 00 d6 BIT $d600 
3e62 : 10 fb __ BPL $3e5f ; (main.l11383 + 0)
.s134:
3e64 : 8c 01 d6 STY $d601 
3e67 : a9 1e __ LDA #$1e
3e69 : 8d 00 d6 STA $d600 
.l11385:
3e6c : 2c 00 d6 BIT $d600 
3e6f : 10 fb __ BPL $3e6c ; (main.l11385 + 0)
.s139:
3e71 : a5 5d __ LDA T6 + 0 
3e73 : 8d 01 d6 STA $d601 
3e76 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
3e79 : 18 __ __ CLC
3e7a : 65 59 __ ADC T4 + 0 
3e7c : aa __ __ TAX
3e7d : a9 12 __ LDA #$12
3e7f : 8d 00 d6 STA $d600 
3e82 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
3e85 : 65 5a __ ADC T4 + 1 
.l11387:
3e87 : 2c 00 d6 BIT $d600 
3e8a : 10 fb __ BPL $3e87 ; (main.l11387 + 0)
.s146:
3e8c : 8d 01 d6 STA $d601 
3e8f : a9 13 __ LDA #$13
3e91 : 8d 00 d6 STA $d600 
.l11389:
3e94 : 2c 00 d6 BIT $d600 
3e97 : 10 fb __ BPL $3e94 ; (main.l11389 + 0)
.s151:
3e99 : 8e 01 d6 STX $d601 
3e9c : a9 1f __ LDA #$1f
3e9e : 8d 00 d6 STA $d600 
.l11391:
3ea1 : 2c 00 d6 BIT $d600 
3ea4 : 10 fb __ BPL $3ea1 ; (main.l11391 + 0)
.s155:
3ea6 : a5 56 __ LDA T2 + 0 
3ea8 : 8d 01 d6 STA $d601 
3eab : a9 18 __ LDA #$18
3ead : 8d 00 d6 STA $d600 
.l11393:
3eb0 : 2c 00 d6 BIT $d600 
3eb3 : 10 fb __ BPL $3eb0 ; (main.l11393 + 0)
.s161:
3eb5 : ad 01 d6 LDA $d601 
3eb8 : 29 7f __ AND #$7f
3eba : aa __ __ TAX
3ebb : a9 18 __ LDA #$18
3ebd : 8d 00 d6 STA $d600 
.l11395:
3ec0 : 2c 00 d6 BIT $d600 
3ec3 : 10 fb __ BPL $3ec0 ; (main.l11395 + 0)
.s167:
3ec5 : 8e 01 d6 STX $d601 
3ec8 : a9 1e __ LDA #$1e
3eca : 8d 00 d6 STA $d600 
.l11397:
3ecd : 2c 00 d6 BIT $d600 
3ed0 : 10 fb __ BPL $3ecd ; (main.l11397 + 0)
.s172:
3ed2 : a5 5d __ LDA T6 + 0 
3ed4 : 8d 01 d6 STA $d601 
3ed7 : e6 53 __ INC T0 + 0 
3ed9 : 4c d5 1d JMP $1dd5 ; (main.l100 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
3edc : a2 03 __ LDX #$03
3ede : b5 53 __ LDA T8 + 0,x 
3ee0 : 9d b2 bf STA $bfb2,x ; (nouns + 33)
3ee3 : ca __ __ DEX
3ee4 : 10 f8 __ BPL $3ede ; (printf.s1000 + 2)
.s0:
3ee6 : 18 __ __ CLC
3ee7 : a5 23 __ LDA SP + 0 
3ee9 : 69 04 __ ADC #$04
3eeb : 85 47 __ STA T0 + 0 
3eed : a5 24 __ LDA SP + 1 
3eef : 69 00 __ ADC #$00
3ef1 : 85 48 __ STA T0 + 1 
3ef3 : a9 00 __ LDA #$00
3ef5 : 85 49 __ STA T2 + 0 
3ef7 : a0 02 __ LDY #$02
3ef9 : b1 23 __ LDA (SP + 0),y 
3efb : 85 4a __ STA T3 + 0 
3efd : c8 __ __ INY
3efe : b1 23 __ LDA (SP + 0),y 
3f00 : 85 4b __ STA T3 + 1 
.l2:
3f02 : a0 00 __ LDY #$00
3f04 : b1 4a __ LDA (T3 + 0),y 
3f06 : d0 1e __ BNE $3f26 ; (printf.s3 + 0)
.s4:
3f08 : a6 49 __ LDX T2 + 0 
3f0a : 9d be bf STA $bfbe,x ; (nouns + 45)
3f0d : 8a __ __ TXA
3f0e : f0 0b __ BEQ $3f1b ; (printf.s1001 + 0)
.s117:
3f10 : a9 be __ LDA #$be
3f12 : 85 0d __ STA P0 ; (fmt + 0)
3f14 : a9 bf __ LDA #$bf
3f16 : 85 0e __ STA P1 ; (fmt + 1)
3f18 : 20 2c 42 JSR $422c ; (puts.s0 + 0)
.s1001:
3f1b : a2 03 __ LDX #$03
3f1d : bd b2 bf LDA $bfb2,x ; (nouns + 33)
3f20 : 95 53 __ STA T8 + 0,x 
3f22 : ca __ __ DEX
3f23 : 10 f8 __ BPL $3f1d ; (printf.s1001 + 2)
3f25 : 60 __ __ RTS
.s3:
3f26 : c9 25 __ CMP #$25
3f28 : f0 28 __ BEQ $3f52 ; (printf.s5 + 0)
.s6:
3f2a : a6 49 __ LDX T2 + 0 
3f2c : 9d be bf STA $bfbe,x ; (nouns + 45)
3f2f : e6 4a __ INC T3 + 0 
3f31 : d0 02 __ BNE $3f35 ; (printf.s1098 + 0)
.s1097:
3f33 : e6 4b __ INC T3 + 1 
.s1098:
3f35 : e8 __ __ INX
3f36 : 86 49 __ STX T2 + 0 
3f38 : e0 28 __ CPX #$28
3f3a : 90 c6 __ BCC $3f02 ; (printf.l2 + 0)
.s111:
3f3c : a9 be __ LDA #$be
3f3e : 85 0d __ STA P0 ; (fmt + 0)
3f40 : a9 bf __ LDA #$bf
3f42 : 85 0e __ STA P1 ; (fmt + 1)
3f44 : 98 __ __ TYA
3f45 : 9d be bf STA $bfbe,x ; (nouns + 45)
3f48 : 20 2c 42 JSR $422c ; (puts.s0 + 0)
3f4b : a9 00 __ LDA #$00
.s1068:
3f4d : 85 49 __ STA T2 + 0 
3f4f : 4c 02 3f JMP $3f02 ; (printf.l2 + 0)
.s5:
3f52 : a5 49 __ LDA T2 + 0 
3f54 : f0 15 __ BEQ $3f6b ; (printf.s10 + 0)
.s8:
3f56 : a9 be __ LDA #$be
3f58 : 85 0d __ STA P0 ; (fmt + 0)
3f5a : a9 bf __ LDA #$bf
3f5c : 85 0e __ STA P1 ; (fmt + 1)
3f5e : 98 __ __ TYA
3f5f : a6 49 __ LDX T2 + 0 
3f61 : 9d be bf STA $bfbe,x ; (nouns + 45)
3f64 : 20 2c 42 JSR $422c ; (puts.s0 + 0)
3f67 : a9 00 __ LDA #$00
3f69 : 85 49 __ STA T2 + 0 
.s10:
3f6b : a9 0a __ LDA #$0a
3f6d : 8d b9 bf STA $bfb9 ; (nouns + 40)
3f70 : a9 00 __ LDA #$00
3f72 : 8d ba bf STA $bfba ; (nouns + 41)
3f75 : 8d bb bf STA $bfbb ; (nouns + 42)
3f78 : 8d bc bf STA $bfbc ; (nouns + 43)
3f7b : 8d bd bf STA $bfbd ; (nouns + 44)
3f7e : a0 01 __ LDY #$01
3f80 : b1 4a __ LDA (T3 + 0),y 
3f82 : aa __ __ TAX
3f83 : a9 20 __ LDA #$20
3f85 : 8d b6 bf STA $bfb6 ; (nouns + 37)
3f88 : a9 00 __ LDA #$00
3f8a : 8d b7 bf STA $bfb7 ; (nouns + 38)
3f8d : a9 ff __ LDA #$ff
3f8f : 8d b8 bf STA $bfb8 ; (nouns + 39)
3f92 : 18 __ __ CLC
3f93 : a5 4a __ LDA T3 + 0 
3f95 : 69 02 __ ADC #$02
.l15:
3f97 : 85 4a __ STA T3 + 0 
3f99 : 90 02 __ BCC $3f9d ; (printf.s1080 + 0)
.s1079:
3f9b : e6 4b __ INC T3 + 1 
.s1080:
3f9d : 8a __ __ TXA
3f9e : e0 2b __ CPX #$2b
3fa0 : d0 08 __ BNE $3faa ; (printf.s18 + 0)
.s17:
3fa2 : a9 01 __ LDA #$01
3fa4 : 8d bb bf STA $bfbb ; (nouns + 42)
3fa7 : 4c 1f 42 JMP $421f ; (printf.s246 + 0)
.s18:
3faa : c9 30 __ CMP #$30
3fac : d0 06 __ BNE $3fb4 ; (printf.s21 + 0)
.s20:
3fae : 8d b6 bf STA $bfb6 ; (nouns + 37)
3fb1 : 4c 1f 42 JMP $421f ; (printf.s246 + 0)
.s21:
3fb4 : e0 23 __ CPX #$23
3fb6 : d0 08 __ BNE $3fc0 ; (printf.s24 + 0)
.s23:
3fb8 : a9 01 __ LDA #$01
3fba : 8d bd bf STA $bfbd ; (nouns + 44)
3fbd : 4c 1f 42 JMP $421f ; (printf.s246 + 0)
.s24:
3fc0 : e0 2d __ CPX #$2d
3fc2 : d0 08 __ BNE $3fcc ; (printf.s16 + 0)
.s26:
3fc4 : a9 01 __ LDA #$01
3fc6 : 8d bc bf STA $bfbc ; (nouns + 43)
3fc9 : 4c 1f 42 JMP $421f ; (printf.s246 + 0)
.s16:
3fcc : 85 4c __ STA T4 + 0 
3fce : e0 30 __ CPX #$30
3fd0 : 90 53 __ BCC $4025 ; (printf.s32 + 0)
.s33:
3fd2 : e0 3a __ CPX #$3a
3fd4 : b0 4f __ BCS $4025 ; (printf.s32 + 0)
.s30:
3fd6 : a9 00 __ LDA #$00
3fd8 : 85 4d __ STA T6 + 0 
3fda : 85 4e __ STA T6 + 1 
3fdc : e0 3a __ CPX #$3a
3fde : b0 40 __ BCS $4020 ; (printf.s36 + 0)
.l35:
3fe0 : a5 4d __ LDA T6 + 0 
3fe2 : 0a __ __ ASL
3fe3 : 85 1b __ STA ACCU + 0 
3fe5 : a5 4e __ LDA T6 + 1 
3fe7 : 2a __ __ ROL
3fe8 : 06 1b __ ASL ACCU + 0 
3fea : 2a __ __ ROL
3feb : aa __ __ TAX
3fec : 18 __ __ CLC
3fed : a5 1b __ LDA ACCU + 0 
3fef : 65 4d __ ADC T6 + 0 
3ff1 : 85 4d __ STA T6 + 0 
3ff3 : 8a __ __ TXA
3ff4 : 65 4e __ ADC T6 + 1 
3ff6 : 06 4d __ ASL T6 + 0 
3ff8 : 2a __ __ ROL
3ff9 : aa __ __ TAX
3ffa : 18 __ __ CLC
3ffb : a5 4d __ LDA T6 + 0 
3ffd : 65 4c __ ADC T4 + 0 
3fff : 90 01 __ BCC $4002 ; (printf.s1094 + 0)
.s1093:
4001 : e8 __ __ INX
.s1094:
4002 : 38 __ __ SEC
4003 : e9 30 __ SBC #$30
4005 : 85 4d __ STA T6 + 0 
4007 : 8a __ __ TXA
4008 : e9 00 __ SBC #$00
400a : 85 4e __ STA T6 + 1 
400c : a0 00 __ LDY #$00
400e : b1 4a __ LDA (T3 + 0),y 
4010 : 85 4c __ STA T4 + 0 
4012 : e6 4a __ INC T3 + 0 
4014 : d0 02 __ BNE $4018 ; (printf.s1096 + 0)
.s1095:
4016 : e6 4b __ INC T3 + 1 
.s1096:
4018 : c9 30 __ CMP #$30
401a : 90 04 __ BCC $4020 ; (printf.s36 + 0)
.s37:
401c : c9 3a __ CMP #$3a
401e : 90 c0 __ BCC $3fe0 ; (printf.l35 + 0)
.s36:
4020 : a5 4d __ LDA T6 + 0 
4022 : 8d b7 bf STA $bfb7 ; (nouns + 38)
.s32:
4025 : a5 4c __ LDA T4 + 0 
4027 : c9 2e __ CMP #$2e
4029 : d0 51 __ BNE $407c ; (printf.s40 + 0)
.s38:
402b : a9 00 __ LDA #$00
402d : 85 4d __ STA T6 + 0 
.l231:
402f : 85 4e __ STA T6 + 1 
4031 : a0 00 __ LDY #$00
4033 : b1 4a __ LDA (T3 + 0),y 
4035 : 85 4c __ STA T4 + 0 
4037 : e6 4a __ INC T3 + 0 
4039 : d0 02 __ BNE $403d ; (printf.s1082 + 0)
.s1081:
403b : e6 4b __ INC T3 + 1 
.s1082:
403d : c9 30 __ CMP #$30
403f : 90 04 __ BCC $4045 ; (printf.s43 + 0)
.s44:
4041 : c9 3a __ CMP #$3a
4043 : 90 0a __ BCC $404f ; (printf.s42 + 0)
.s43:
4045 : a5 4d __ LDA T6 + 0 
4047 : 8d b8 bf STA $bfb8 ; (nouns + 39)
404a : a5 4c __ LDA T4 + 0 
404c : 4c 7c 40 JMP $407c ; (printf.s40 + 0)
.s42:
404f : a5 4d __ LDA T6 + 0 
4051 : 0a __ __ ASL
4052 : 85 1b __ STA ACCU + 0 
4054 : a5 4e __ LDA T6 + 1 
4056 : 2a __ __ ROL
4057 : 06 1b __ ASL ACCU + 0 
4059 : 2a __ __ ROL
405a : aa __ __ TAX
405b : 18 __ __ CLC
405c : a5 1b __ LDA ACCU + 0 
405e : 65 4d __ ADC T6 + 0 
4060 : 85 4d __ STA T6 + 0 
4062 : 8a __ __ TXA
4063 : 65 4e __ ADC T6 + 1 
4065 : 06 4d __ ASL T6 + 0 
4067 : 2a __ __ ROL
4068 : aa __ __ TAX
4069 : 18 __ __ CLC
406a : a5 4d __ LDA T6 + 0 
406c : 65 4c __ ADC T4 + 0 
406e : 90 01 __ BCC $4071 ; (printf.s1092 + 0)
.s1091:
4070 : e8 __ __ INX
.s1092:
4071 : 38 __ __ SEC
4072 : e9 30 __ SBC #$30
4074 : 85 4d __ STA T6 + 0 
4076 : 8a __ __ TXA
4077 : e9 00 __ SBC #$00
4079 : 4c 2f 40 JMP $402f ; (printf.l231 + 0)
.s40:
407c : c9 64 __ CMP #$64
407e : f0 04 __ BEQ $4084 ; (printf.s45 + 0)
.s48:
4080 : c9 44 __ CMP #$44
4082 : d0 05 __ BNE $4089 ; (printf.s46 + 0)
.s45:
4084 : a9 01 __ LDA #$01
4086 : 4c f8 41 JMP $41f8 ; (printf.s247 + 0)
.s46:
4089 : c9 75 __ CMP #$75
408b : d0 03 __ BNE $4090 ; (printf.s52 + 0)
408d : 4c f6 41 JMP $41f6 ; (printf.s269 + 0)
.s52:
4090 : c9 55 __ CMP #$55
4092 : d0 03 __ BNE $4097 ; (printf.s50 + 0)
4094 : 4c f6 41 JMP $41f6 ; (printf.s269 + 0)
.s50:
4097 : c9 78 __ CMP #$78
4099 : f0 04 __ BEQ $409f ; (printf.s53 + 0)
.s56:
409b : c9 58 __ CMP #$58
409d : d0 0d __ BNE $40ac ; (printf.s54 + 0)
.s53:
409f : a9 10 __ LDA #$10
40a1 : 8d b9 bf STA $bfb9 ; (nouns + 40)
40a4 : a9 00 __ LDA #$00
40a6 : 8d ba bf STA $bfba ; (nouns + 41)
40a9 : 4c f6 41 JMP $41f6 ; (printf.s269 + 0)
.s54:
40ac : c9 6c __ CMP #$6c
40ae : d0 03 __ BNE $40b3 ; (printf.s60 + 0)
40b0 : 4c 88 41 JMP $4188 ; (printf.s57 + 0)
.s60:
40b3 : c9 4c __ CMP #$4c
40b5 : d0 03 __ BNE $40ba ; (printf.s58 + 0)
40b7 : 4c 88 41 JMP $4188 ; (printf.s57 + 0)
.s58:
40ba : c9 73 __ CMP #$73
40bc : f0 39 __ BEQ $40f7 ; (printf.s73 + 0)
.s76:
40be : c9 53 __ CMP #$53
40c0 : f0 35 __ BEQ $40f7 ; (printf.s73 + 0)
.s74:
40c2 : c9 63 __ CMP #$63
40c4 : f0 15 __ BEQ $40db ; (printf.s104 + 0)
.s107:
40c6 : c9 43 __ CMP #$43
40c8 : f0 11 __ BEQ $40db ; (printf.s104 + 0)
.s105:
40ca : 09 00 __ ORA #$00
40cc : d0 03 __ BNE $40d1 ; (printf.s108 + 0)
40ce : 4c 02 3f JMP $3f02 ; (printf.l2 + 0)
.s108:
40d1 : a6 49 __ LDX T2 + 0 
40d3 : 9d be bf STA $bfbe,x ; (nouns + 45)
40d6 : e6 49 __ INC T2 + 0 
40d8 : 4c 02 3f JMP $3f02 ; (printf.l2 + 0)
.s104:
40db : a0 00 __ LDY #$00
40dd : b1 47 __ LDA (T0 + 0),y 
40df : a6 49 __ LDX T2 + 0 
40e1 : 9d be bf STA $bfbe,x ; (nouns + 45)
40e4 : e6 49 __ INC T2 + 0 
.s244:
40e6 : 18 __ __ CLC
40e7 : a5 47 __ LDA T0 + 0 
40e9 : 69 02 __ ADC #$02
40eb : 85 47 __ STA T0 + 0 
40ed : b0 03 __ BCS $40f2 ; (printf.s1083 + 0)
40ef : 4c 02 3f JMP $3f02 ; (printf.l2 + 0)
.s1083:
40f2 : e6 48 __ INC T0 + 1 
40f4 : 4c 02 3f JMP $3f02 ; (printf.l2 + 0)
.s73:
40f7 : a0 00 __ LDY #$00
40f9 : 84 4c __ STY T4 + 0 
40fb : b1 47 __ LDA (T0 + 0),y 
40fd : 85 4d __ STA T6 + 0 
40ff : c8 __ __ INY
4100 : b1 47 __ LDA (T0 + 0),y 
4102 : 85 4e __ STA T6 + 1 
4104 : 18 __ __ CLC
4105 : a5 47 __ LDA T0 + 0 
4107 : 69 02 __ ADC #$02
4109 : 85 47 __ STA T0 + 0 
410b : 90 02 __ BCC $410f ; (printf.s1090 + 0)
.s1089:
410d : e6 48 __ INC T0 + 1 
.s1090:
410f : ad b7 bf LDA $bfb7 ; (nouns + 38)
4112 : f0 0d __ BEQ $4121 ; (printf.s79 + 0)
.s1071:
4114 : a0 00 __ LDY #$00
4116 : b1 4d __ LDA (T6 + 0),y 
4118 : f0 05 __ BEQ $411f ; (printf.s1072 + 0)
.l81:
411a : c8 __ __ INY
411b : b1 4d __ LDA (T6 + 0),y 
411d : d0 fb __ BNE $411a ; (printf.l81 + 0)
.s1072:
411f : 84 4c __ STY T4 + 0 
.s79:
4121 : ad bc bf LDA $bfbc ; (nouns + 43)
4124 : d0 1a __ BNE $4140 ; (printf.s85 + 0)
.s1075:
4126 : a4 4c __ LDY T4 + 0 
4128 : cc b7 bf CPY $bfb7 ; (nouns + 38)
412b : a6 49 __ LDX T2 + 0 
412d : b0 0d __ BCS $413c ; (printf.s1076 + 0)
.l87:
412f : ad b6 bf LDA $bfb6 ; (nouns + 37)
4132 : 9d be bf STA $bfbe,x ; (nouns + 45)
4135 : c8 __ __ INY
4136 : cc b7 bf CPY $bfb7 ; (nouns + 38)
4139 : e8 __ __ INX
413a : 90 f3 __ BCC $412f ; (printf.l87 + 0)
.s1076:
413c : 86 49 __ STX T2 + 0 
413e : 84 4c __ STY T4 + 0 
.s85:
4140 : a5 49 __ LDA T2 + 0 
4142 : f0 16 __ BEQ $415a ; (printf.s238 + 0)
.s92:
4144 : a9 be __ LDA #$be
4146 : 85 0d __ STA P0 ; (fmt + 0)
4148 : a9 bf __ LDA #$bf
414a : 85 0e __ STA P1 ; (fmt + 1)
414c : a9 00 __ LDA #$00
414e : a6 49 __ LDX T2 + 0 
4150 : 9d be bf STA $bfbe,x ; (nouns + 45)
4153 : 20 2c 42 JSR $422c ; (puts.s0 + 0)
4156 : a9 00 __ LDA #$00
4158 : 85 49 __ STA T2 + 0 
.s238:
415a : a5 4d __ LDA T6 + 0 
415c : 85 0d __ STA P0 ; (fmt + 0)
415e : a5 4e __ LDA T6 + 1 
4160 : 85 0e __ STA P1 ; (fmt + 1)
4162 : 20 2c 42 JSR $422c ; (puts.s0 + 0)
4165 : ad bc bf LDA $bfbc ; (nouns + 43)
4168 : d0 03 __ BNE $416d ; (printf.s1073 + 0)
416a : 4c 02 3f JMP $3f02 ; (printf.l2 + 0)
.s1073:
416d : a4 4c __ LDY T4 + 0 
416f : cc b7 bf CPY $bfb7 ; (nouns + 38)
4172 : a2 00 __ LDX #$00
4174 : b0 0d __ BCS $4183 ; (printf.s1074 + 0)
.l102:
4176 : ad b6 bf LDA $bfb6 ; (nouns + 37)
4179 : 9d be bf STA $bfbe,x ; (nouns + 45)
417c : c8 __ __ INY
417d : cc b7 bf CPY $bfb7 ; (nouns + 38)
4180 : e8 __ __ INX
4181 : 90 f3 __ BCC $4176 ; (printf.l102 + 0)
.s1074:
4183 : 86 49 __ STX T2 + 0 
4185 : 4c 02 3f JMP $3f02 ; (printf.l2 + 0)
.s57:
4188 : a0 00 __ LDY #$00
418a : b1 47 __ LDA (T0 + 0),y 
418c : 85 53 __ STA T8 + 0 
418e : c8 __ __ INY
418f : b1 47 __ LDA (T0 + 0),y 
4191 : 85 54 __ STA T8 + 1 
4193 : c8 __ __ INY
4194 : b1 47 __ LDA (T0 + 0),y 
4196 : 85 55 __ STA T8 + 2 
4198 : c8 __ __ INY
4199 : b1 47 __ LDA (T0 + 0),y 
419b : 85 56 __ STA T8 + 3 
419d : 18 __ __ CLC
419e : a5 47 __ LDA T0 + 0 
41a0 : 69 04 __ ADC #$04
41a2 : 85 47 __ STA T0 + 0 
41a4 : 90 02 __ BCC $41a8 ; (printf.s1086 + 0)
.s1085:
41a6 : e6 48 __ INC T0 + 1 
.s1086:
41a8 : a0 00 __ LDY #$00
41aa : b1 4a __ LDA (T3 + 0),y 
41ac : aa __ __ TAX
41ad : e6 4a __ INC T3 + 0 
41af : d0 02 __ BNE $41b3 ; (printf.s1088 + 0)
.s1087:
41b1 : e6 4b __ INC T3 + 1 
.s1088:
41b3 : 8a __ __ TXA
41b4 : e0 64 __ CPX #$64
41b6 : f0 04 __ BEQ $41bc ; (printf.s61 + 0)
.s64:
41b8 : c9 44 __ CMP #$44
41ba : d0 04 __ BNE $41c0 ; (printf.s62 + 0)
.s61:
41bc : a9 01 __ LDA #$01
41be : d0 1c __ BNE $41dc ; (printf.s245 + 0)
.s62:
41c0 : c9 75 __ CMP #$75
41c2 : f0 17 __ BEQ $41db ; (printf.s268 + 0)
.s68:
41c4 : c9 55 __ CMP #$55
41c6 : f0 13 __ BEQ $41db ; (printf.s268 + 0)
.s66:
41c8 : c9 78 __ CMP #$78
41ca : f0 07 __ BEQ $41d3 ; (printf.s69 + 0)
.s72:
41cc : c9 58 __ CMP #$58
41ce : f0 03 __ BEQ $41d3 ; (printf.s69 + 0)
41d0 : 4c 02 3f JMP $3f02 ; (printf.l2 + 0)
.s69:
41d3 : 8c ba bf STY $bfba ; (nouns + 41)
41d6 : a9 10 __ LDA #$10
41d8 : 8d b9 bf STA $bfb9 ; (nouns + 40)
.s268:
41db : 98 __ __ TYA
.s245:
41dc : 85 15 __ STA P8 
41de : a9 be __ LDA #$be
41e0 : 85 0f __ STA P2 ; (fmt + 2)
41e2 : a9 bf __ LDA #$bf
41e4 : 85 10 __ STA P3 ; (fmt + 3)
41e6 : a9 b6 __ LDA #$b6
41e8 : 85 0d __ STA P0 ; (fmt + 0)
41ea : a9 bf __ LDA #$bf
41ec : 85 0e __ STA P1 ; (fmt + 1)
41ee : 20 b6 43 JSR $43b6 ; (nforml@proxy + 0)
41f1 : a5 1b __ LDA ACCU + 0 
41f3 : 4c 4d 3f JMP $3f4d ; (printf.s1068 + 0)
.s269:
41f6 : a9 00 __ LDA #$00
.s247:
41f8 : 85 13 __ STA P6 
41fa : a9 be __ LDA #$be
41fc : 85 0f __ STA P2 ; (fmt + 2)
41fe : a9 bf __ LDA #$bf
4200 : 85 10 __ STA P3 ; (fmt + 3)
4202 : a0 00 __ LDY #$00
4204 : b1 47 __ LDA (T0 + 0),y 
4206 : 85 11 __ STA P4 
4208 : c8 __ __ INY
4209 : b1 47 __ LDA (T0 + 0),y 
420b : 85 12 __ STA P5 
420d : a9 b6 __ LDA #$b6
420f : 85 0d __ STA P0 ; (fmt + 0)
4211 : a9 bf __ LDA #$bf
4213 : 85 0e __ STA P1 ; (fmt + 1)
4215 : 20 81 42 JSR $4281 ; (nformi.s0 + 0)
4218 : a5 1b __ LDA ACCU + 0 
421a : 85 49 __ STA T2 + 0 
421c : 4c e6 40 JMP $40e6 ; (printf.s244 + 0)
.s246:
421f : a0 00 __ LDY #$00
4221 : b1 4a __ LDA (T3 + 0),y 
4223 : aa __ __ TAX
4224 : 18 __ __ CLC
4225 : a5 4a __ LDA T3 + 0 
4227 : 69 01 __ ADC #$01
4229 : 4c 97 3f JMP $3f97 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
422c : a0 00 __ LDY #$00
422e : b1 0d __ LDA (P0),y 
4230 : f0 0b __ BEQ $423d ; (puts.s1001 + 0)
4232 : 20 3e 42 JSR $423e ; (putpch + 0)
4235 : e6 0d __ INC P0 
4237 : d0 f3 __ BNE $422c ; (puts.s0 + 0)
4239 : e6 0e __ INC P1 
423b : d0 ef __ BNE $422c ; (puts.s0 + 0)
.s1001:
423d : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
423e : ae f3 50 LDX $50f3 ; (giocharmap + 0)
4241 : e0 01 __ CPX #$01
4243 : 90 26 __ BCC $426b ; (putpch + 45)
4245 : c9 0a __ CMP #$0a
4247 : d0 02 __ BNE $424b ; (putpch + 13)
4249 : a9 0d __ LDA #$0d
424b : c9 09 __ CMP #$09
424d : f0 1f __ BEQ $426e ; (putpch + 48)
424f : e0 02 __ CPX #$02
4251 : 90 18 __ BCC $426b ; (putpch + 45)
4253 : c9 41 __ CMP #$41
4255 : 90 14 __ BCC $426b ; (putpch + 45)
4257 : c9 7b __ CMP #$7b
4259 : b0 10 __ BCS $426b ; (putpch + 45)
425b : c9 61 __ CMP #$61
425d : b0 04 __ BCS $4263 ; (putpch + 37)
425f : c9 5b __ CMP #$5b
4261 : b0 08 __ BCS $426b ; (putpch + 45)
4263 : 49 20 __ EOR #$20
4265 : e0 03 __ CPX #$03
4267 : f0 02 __ BEQ $426b ; (putpch + 45)
4269 : 29 df __ AND #$df
426b : 4c d2 ff JMP $ffd2 
426e : 38 __ __ SEC
426f : 20 f0 ff JSR $fff0 
4272 : 98 __ __ TYA
4273 : 29 03 __ AND #$03
4275 : 49 03 __ EOR #$03
4277 : aa __ __ TAX
4278 : a9 20 __ LDA #$20
427a : 20 d2 ff JSR $ffd2 
427d : ca __ __ DEX
427e : 10 fa __ BPL $427a ; (putpch + 60)
4280 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
4281 : a9 00 __ LDA #$00
4283 : 85 43 __ STA T0 + 0 
4285 : a5 13 __ LDA P6 ; (s + 0)
4287 : f0 13 __ BEQ $429c ; (nformi.s182 + 0)
.s4:
4289 : 24 12 __ BIT P5 ; (v + 1)
428b : 10 0f __ BPL $429c ; (nformi.s182 + 0)
.s1:
428d : 38 __ __ SEC
428e : a9 00 __ LDA #$00
4290 : e5 11 __ SBC P4 ; (v + 0)
4292 : 85 11 __ STA P4 ; (v + 0)
4294 : a9 00 __ LDA #$00
4296 : e5 12 __ SBC P5 ; (v + 1)
4298 : 85 12 __ STA P5 ; (v + 1)
429a : e6 43 __ INC T0 + 0 
.s182:
429c : a9 10 __ LDA #$10
429e : 85 44 __ STA T2 + 0 
42a0 : a5 11 __ LDA P4 ; (v + 0)
42a2 : 05 12 __ ORA P5 ; (v + 1)
42a4 : f0 46 __ BEQ $42ec ; (nformi.s7 + 0)
.s42:
42a6 : a0 03 __ LDY #$03
42a8 : b1 0d __ LDA (P0),y ; (si + 0)
42aa : 85 45 __ STA T4 + 0 
42ac : c8 __ __ INY
42ad : b1 0d __ LDA (P0),y ; (si + 0)
42af : 85 46 __ STA T4 + 1 
.l6:
42b1 : a5 11 __ LDA P4 ; (v + 0)
42b3 : 85 1b __ STA ACCU + 0 
42b5 : a5 12 __ LDA P5 ; (v + 1)
42b7 : 85 1c __ STA ACCU + 1 
42b9 : a5 45 __ LDA T4 + 0 
42bb : 85 03 __ STA WORK + 0 
42bd : a5 46 __ LDA T4 + 1 
42bf : 85 04 __ STA WORK + 1 
42c1 : 20 65 57 JSR $5765 ; (divmod + 0)
42c4 : a5 06 __ LDA WORK + 3 
42c6 : 30 08 __ BMI $42d0 ; (nformi.s78 + 0)
.s1019:
42c8 : d0 0a __ BNE $42d4 ; (nformi.s77 + 0)
.s1018:
42ca : a5 05 __ LDA WORK + 2 
42cc : c9 0a __ CMP #$0a
42ce : b0 04 __ BCS $42d4 ; (nformi.s77 + 0)
.s78:
42d0 : a9 30 __ LDA #$30
42d2 : d0 02 __ BNE $42d6 ; (nformi.s79 + 0)
.s77:
42d4 : a9 37 __ LDA #$37
.s79:
42d6 : 18 __ __ CLC
42d7 : 65 05 __ ADC WORK + 2 
42d9 : c6 44 __ DEC T2 + 0 
42db : a6 44 __ LDX T2 + 0 
42dd : 9d f0 bf STA $bff0,x ; (buffer + 0)
42e0 : a5 1b __ LDA ACCU + 0 
42e2 : 85 11 __ STA P4 ; (v + 0)
42e4 : a5 1c __ LDA ACCU + 1 
42e6 : 85 12 __ STA P5 ; (v + 1)
42e8 : 05 11 __ ORA P4 ; (v + 0)
42ea : d0 c5 __ BNE $42b1 ; (nformi.l6 + 0)
.s7:
42ec : a0 02 __ LDY #$02
42ee : b1 0d __ LDA (P0),y ; (si + 0)
42f0 : c9 ff __ CMP #$ff
42f2 : d0 04 __ BNE $42f8 ; (nformi.s80 + 0)
.s81:
42f4 : a9 0f __ LDA #$0f
42f6 : d0 05 __ BNE $42fd ; (nformi.s1026 + 0)
.s80:
42f8 : 38 __ __ SEC
42f9 : a9 10 __ LDA #$10
42fb : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
42fd : a8 __ __ TAY
42fe : c4 44 __ CPY T2 + 0 
4300 : b0 0d __ BCS $430f ; (nformi.s10 + 0)
.s9:
4302 : a9 30 __ LDA #$30
.l1027:
4304 : c6 44 __ DEC T2 + 0 
4306 : a6 44 __ LDX T2 + 0 
4308 : 9d f0 bf STA $bff0,x ; (buffer + 0)
430b : c4 44 __ CPY T2 + 0 
430d : 90 f5 __ BCC $4304 ; (nformi.l1027 + 0)
.s10:
430f : a0 07 __ LDY #$07
4311 : b1 0d __ LDA (P0),y ; (si + 0)
4313 : f0 20 __ BEQ $4335 ; (nformi.s13 + 0)
.s14:
4315 : a0 04 __ LDY #$04
4317 : b1 0d __ LDA (P0),y ; (si + 0)
4319 : d0 1a __ BNE $4335 ; (nformi.s13 + 0)
.s1013:
431b : 88 __ __ DEY
431c : b1 0d __ LDA (P0),y ; (si + 0)
431e : c9 10 __ CMP #$10
4320 : d0 13 __ BNE $4335 ; (nformi.s13 + 0)
.s11:
4322 : a9 58 __ LDA #$58
4324 : a6 44 __ LDX T2 + 0 
4326 : 9d ef bf STA $bfef,x ; (buff + 49)
4329 : 8a __ __ TXA
432a : 18 __ __ CLC
432b : 69 fe __ ADC #$fe
432d : 85 44 __ STA T2 + 0 
432f : aa __ __ TAX
4330 : a9 30 __ LDA #$30
4332 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
4335 : a9 00 __ LDA #$00
4337 : 85 1b __ STA ACCU + 0 
4339 : a5 43 __ LDA T0 + 0 
433b : f0 06 __ BEQ $4343 ; (nformi.s16 + 0)
.s15:
433d : c6 44 __ DEC T2 + 0 
433f : a9 2d __ LDA #$2d
4341 : d0 0a __ BNE $434d ; (nformi.s1025 + 0)
.s16:
4343 : a0 05 __ LDY #$05
4345 : b1 0d __ LDA (P0),y ; (si + 0)
4347 : f0 09 __ BEQ $4352 ; (nformi.s163 + 0)
.s18:
4349 : c6 44 __ DEC T2 + 0 
434b : a9 2b __ LDA #$2b
.s1025:
434d : a6 44 __ LDX T2 + 0 
434f : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
4352 : a0 06 __ LDY #$06
4354 : b1 0d __ LDA (P0),y ; (si + 0)
4356 : d0 33 __ BNE $438b ; (nformi.s24 + 0)
.l30:
4358 : a0 01 __ LDY #$01
435a : b1 0d __ LDA (P0),y ; (si + 0)
435c : 18 __ __ CLC
435d : 65 44 __ ADC T2 + 0 
435f : b0 04 __ BCS $4365 ; (nformi.s31 + 0)
.s1006:
4361 : c9 11 __ CMP #$11
4363 : 90 0d __ BCC $4372 ; (nformi.s33 + 0)
.s31:
4365 : c6 44 __ DEC T2 + 0 
4367 : a0 00 __ LDY #$00
4369 : b1 0d __ LDA (P0),y ; (si + 0)
436b : a6 44 __ LDX T2 + 0 
436d : 9d f0 bf STA $bff0,x ; (buffer + 0)
4370 : b0 e6 __ BCS $4358 ; (nformi.l30 + 0)
.s33:
4372 : a6 44 __ LDX T2 + 0 
4374 : e0 10 __ CPX #$10
4376 : b0 0e __ BCS $4386 ; (nformi.s23 + 0)
.s34:
4378 : 88 __ __ DEY
.l1022:
4379 : bd f0 bf LDA $bff0,x ; (buffer + 0)
437c : 91 0f __ STA (P2),y ; (str + 0)
437e : e8 __ __ INX
437f : e0 10 __ CPX #$10
4381 : c8 __ __ INY
4382 : 90 f5 __ BCC $4379 ; (nformi.l1022 + 0)
.s1023:
4384 : 84 1b __ STY ACCU + 0 
.s23:
4386 : a9 00 __ LDA #$00
4388 : 85 1c __ STA ACCU + 1 
.s1001:
438a : 60 __ __ RTS
.s24:
438b : a6 44 __ LDX T2 + 0 
438d : e0 10 __ CPX #$10
438f : b0 1a __ BCS $43ab ; (nformi.l27 + 0)
.s25:
4391 : a0 00 __ LDY #$00
.l1020:
4393 : bd f0 bf LDA $bff0,x ; (buffer + 0)
4396 : 91 0f __ STA (P2),y ; (str + 0)
4398 : e8 __ __ INX
4399 : e0 10 __ CPX #$10
439b : c8 __ __ INY
439c : 90 f5 __ BCC $4393 ; (nformi.l1020 + 0)
.s1021:
439e : 84 1b __ STY ACCU + 0 
43a0 : b0 09 __ BCS $43ab ; (nformi.l27 + 0)
.s28:
43a2 : 88 __ __ DEY
43a3 : b1 0d __ LDA (P0),y ; (si + 0)
43a5 : a4 1b __ LDY ACCU + 0 
43a7 : 91 0f __ STA (P2),y ; (str + 0)
43a9 : e6 1b __ INC ACCU + 0 
.l27:
43ab : a5 1b __ LDA ACCU + 0 
43ad : a0 01 __ LDY #$01
43af : d1 0d __ CMP (P0),y ; (si + 0)
43b1 : 90 ef __ BCC $43a2 ; (nformi.s28 + 0)
43b3 : 4c 86 43 JMP $4386 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml@proxy: ; nforml@proxy
43b6 : a5 53 __ LDA $53 
43b8 : 85 11 __ STA P4 
43ba : a5 54 __ LDA $54 
43bc : 85 12 __ STA P5 
43be : a5 55 __ LDA $55 
43c0 : 85 13 __ STA P6 
43c2 : a5 56 __ LDA $56 
43c4 : 85 14 __ STA P7 
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
43c6 : a9 00 __ LDA #$00
43c8 : 85 43 __ STA T0 + 0 
43ca : a5 15 __ LDA P8 ; (s + 0)
43cc : f0 21 __ BEQ $43ef ; (nforml.s182 + 0)
.s4:
43ce : a5 14 __ LDA P7 ; (v + 3)
43d0 : f0 1d __ BEQ $43ef ; (nforml.s182 + 0)
.s1032:
43d2 : 10 1b __ BPL $43ef ; (nforml.s182 + 0)
.s1:
43d4 : 38 __ __ SEC
43d5 : a9 00 __ LDA #$00
43d7 : e5 11 __ SBC P4 ; (v + 0)
43d9 : 85 11 __ STA P4 ; (v + 0)
43db : a9 00 __ LDA #$00
43dd : e5 12 __ SBC P5 ; (v + 1)
43df : 85 12 __ STA P5 ; (v + 1)
43e1 : a9 00 __ LDA #$00
43e3 : e5 13 __ SBC P6 ; (v + 2)
43e5 : 85 13 __ STA P6 ; (v + 2)
43e7 : a9 00 __ LDA #$00
43e9 : e5 14 __ SBC P7 ; (v + 3)
43eb : 85 14 __ STA P7 ; (v + 3)
43ed : e6 43 __ INC T0 + 0 
.s182:
43ef : a9 10 __ LDA #$10
43f1 : 85 44 __ STA T2 + 0 
43f3 : a5 14 __ LDA P7 ; (v + 3)
43f5 : d0 0c __ BNE $4403 ; (nforml.s42 + 0)
.s1024:
43f7 : a5 13 __ LDA P6 ; (v + 2)
43f9 : d0 08 __ BNE $4403 ; (nforml.s42 + 0)
.s1025:
43fb : a5 12 __ LDA P5 ; (v + 1)
43fd : d0 04 __ BNE $4403 ; (nforml.s42 + 0)
.s1026:
43ff : c5 11 __ CMP P4 ; (v + 0)
4401 : b0 0e __ BCS $4411 ; (nforml.s7 + 0)
.s42:
4403 : a0 03 __ LDY #$03
4405 : b1 0d __ LDA (P0),y ; (si + 0)
4407 : 85 45 __ STA T5 + 0 
4409 : c8 __ __ INY
440a : b1 0d __ LDA (P0),y ; (si + 0)
440c : 85 46 __ STA T5 + 1 
440e : 4c db 44 JMP $44db ; (nforml.l6 + 0)
.s7:
4411 : a0 02 __ LDY #$02
4413 : b1 0d __ LDA (P0),y ; (si + 0)
4415 : c9 ff __ CMP #$ff
4417 : d0 04 __ BNE $441d ; (nforml.s80 + 0)
.s81:
4419 : a9 0f __ LDA #$0f
441b : d0 05 __ BNE $4422 ; (nforml.s1039 + 0)
.s80:
441d : 38 __ __ SEC
441e : a9 10 __ LDA #$10
4420 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
4422 : a8 __ __ TAY
4423 : c4 44 __ CPY T2 + 0 
4425 : b0 0d __ BCS $4434 ; (nforml.s10 + 0)
.s9:
4427 : a9 30 __ LDA #$30
.l1040:
4429 : c6 44 __ DEC T2 + 0 
442b : a6 44 __ LDX T2 + 0 
442d : 9d f0 bf STA $bff0,x ; (buffer + 0)
4430 : c4 44 __ CPY T2 + 0 
4432 : 90 f5 __ BCC $4429 ; (nforml.l1040 + 0)
.s10:
4434 : a0 07 __ LDY #$07
4436 : b1 0d __ LDA (P0),y ; (si + 0)
4438 : f0 20 __ BEQ $445a ; (nforml.s13 + 0)
.s14:
443a : a0 04 __ LDY #$04
443c : b1 0d __ LDA (P0),y ; (si + 0)
443e : d0 1a __ BNE $445a ; (nforml.s13 + 0)
.s1013:
4440 : 88 __ __ DEY
4441 : b1 0d __ LDA (P0),y ; (si + 0)
4443 : c9 10 __ CMP #$10
4445 : d0 13 __ BNE $445a ; (nforml.s13 + 0)
.s11:
4447 : a9 58 __ LDA #$58
4449 : a6 44 __ LDX T2 + 0 
444b : 9d ef bf STA $bfef,x ; (buff + 49)
444e : 8a __ __ TXA
444f : 18 __ __ CLC
4450 : 69 fe __ ADC #$fe
4452 : 85 44 __ STA T2 + 0 
4454 : aa __ __ TAX
4455 : a9 30 __ LDA #$30
4457 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
445a : a9 00 __ LDA #$00
445c : 85 1b __ STA ACCU + 0 
445e : a5 43 __ LDA T0 + 0 
4460 : f0 06 __ BEQ $4468 ; (nforml.s16 + 0)
.s15:
4462 : c6 44 __ DEC T2 + 0 
4464 : a9 2d __ LDA #$2d
4466 : d0 0a __ BNE $4472 ; (nforml.s1038 + 0)
.s16:
4468 : a0 05 __ LDY #$05
446a : b1 0d __ LDA (P0),y ; (si + 0)
446c : f0 09 __ BEQ $4477 ; (nforml.s163 + 0)
.s18:
446e : c6 44 __ DEC T2 + 0 
4470 : a9 2b __ LDA #$2b
.s1038:
4472 : a6 44 __ LDX T2 + 0 
4474 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
4477 : a0 06 __ LDY #$06
4479 : b1 0d __ LDA (P0),y ; (si + 0)
447b : d0 33 __ BNE $44b0 ; (nforml.s24 + 0)
.l30:
447d : a0 01 __ LDY #$01
447f : b1 0d __ LDA (P0),y ; (si + 0)
4481 : 18 __ __ CLC
4482 : 65 44 __ ADC T2 + 0 
4484 : b0 04 __ BCS $448a ; (nforml.s31 + 0)
.s1006:
4486 : c9 11 __ CMP #$11
4488 : 90 0d __ BCC $4497 ; (nforml.s33 + 0)
.s31:
448a : c6 44 __ DEC T2 + 0 
448c : a0 00 __ LDY #$00
448e : b1 0d __ LDA (P0),y ; (si + 0)
4490 : a6 44 __ LDX T2 + 0 
4492 : 9d f0 bf STA $bff0,x ; (buffer + 0)
4495 : b0 e6 __ BCS $447d ; (nforml.l30 + 0)
.s33:
4497 : a6 44 __ LDX T2 + 0 
4499 : e0 10 __ CPX #$10
449b : b0 0e __ BCS $44ab ; (nforml.s23 + 0)
.s34:
449d : 88 __ __ DEY
.l1035:
449e : bd f0 bf LDA $bff0,x ; (buffer + 0)
44a1 : 91 0f __ STA (P2),y ; (str + 0)
44a3 : e8 __ __ INX
44a4 : e0 10 __ CPX #$10
44a6 : c8 __ __ INY
44a7 : 90 f5 __ BCC $449e ; (nforml.l1035 + 0)
.s1036:
44a9 : 84 1b __ STY ACCU + 0 
.s23:
44ab : a9 00 __ LDA #$00
44ad : 85 1c __ STA ACCU + 1 
.s1001:
44af : 60 __ __ RTS
.s24:
44b0 : a6 44 __ LDX T2 + 0 
44b2 : e0 10 __ CPX #$10
44b4 : b0 1a __ BCS $44d0 ; (nforml.l27 + 0)
.s25:
44b6 : a0 00 __ LDY #$00
.l1033:
44b8 : bd f0 bf LDA $bff0,x ; (buffer + 0)
44bb : 91 0f __ STA (P2),y ; (str + 0)
44bd : e8 __ __ INX
44be : e0 10 __ CPX #$10
44c0 : c8 __ __ INY
44c1 : 90 f5 __ BCC $44b8 ; (nforml.l1033 + 0)
.s1034:
44c3 : 84 1b __ STY ACCU + 0 
44c5 : b0 09 __ BCS $44d0 ; (nforml.l27 + 0)
.s28:
44c7 : 88 __ __ DEY
44c8 : b1 0d __ LDA (P0),y ; (si + 0)
44ca : a4 1b __ LDY ACCU + 0 
44cc : 91 0f __ STA (P2),y ; (str + 0)
44ce : e6 1b __ INC ACCU + 0 
.l27:
44d0 : a5 1b __ LDA ACCU + 0 
44d2 : a0 01 __ LDY #$01
44d4 : d1 0d __ CMP (P0),y ; (si + 0)
44d6 : 90 ef __ BCC $44c7 ; (nforml.s28 + 0)
44d8 : 4c ab 44 JMP $44ab ; (nforml.s23 + 0)
.l6:
44db : a5 11 __ LDA P4 ; (v + 0)
44dd : 85 1b __ STA ACCU + 0 
44df : a5 12 __ LDA P5 ; (v + 1)
44e1 : 85 1c __ STA ACCU + 1 
44e3 : a5 13 __ LDA P6 ; (v + 2)
44e5 : 85 1d __ STA ACCU + 2 
44e7 : a5 14 __ LDA P7 ; (v + 3)
44e9 : 85 1e __ STA ACCU + 3 
44eb : a5 45 __ LDA T5 + 0 
44ed : 85 03 __ STA WORK + 0 
44ef : a5 46 __ LDA T5 + 1 
44f1 : 85 04 __ STA WORK + 1 
44f3 : a9 00 __ LDA #$00
44f5 : 85 05 __ STA WORK + 2 
44f7 : 85 06 __ STA WORK + 3 
44f9 : 20 ea 57 JSR $57ea ; (divmod32 + 0)
44fc : a5 08 __ LDA WORK + 5 
44fe : 30 08 __ BMI $4508 ; (nforml.s78 + 0)
.s1023:
4500 : d0 0a __ BNE $450c ; (nforml.s77 + 0)
.s1022:
4502 : a5 07 __ LDA WORK + 4 
4504 : c9 0a __ CMP #$0a
4506 : b0 04 __ BCS $450c ; (nforml.s77 + 0)
.s78:
4508 : a9 30 __ LDA #$30
450a : d0 02 __ BNE $450e ; (nforml.s79 + 0)
.s77:
450c : a9 37 __ LDA #$37
.s79:
450e : 18 __ __ CLC
450f : 65 07 __ ADC WORK + 4 
4511 : c6 44 __ DEC T2 + 0 
4513 : a6 44 __ LDX T2 + 0 
4515 : 9d f0 bf STA $bff0,x ; (buffer + 0)
4518 : a5 1b __ LDA ACCU + 0 
451a : 85 11 __ STA P4 ; (v + 0)
451c : a5 1c __ LDA ACCU + 1 
451e : 85 12 __ STA P5 ; (v + 1)
4520 : a5 1d __ LDA ACCU + 2 
4522 : 85 13 __ STA P6 ; (v + 2)
4524 : a5 1e __ LDA ACCU + 3 
4526 : 85 14 __ STA P7 ; (v + 3)
4528 : d0 b1 __ BNE $44db ; (nforml.l6 + 0)
.s1018:
452a : a5 13 __ LDA P6 ; (v + 2)
452c : d0 ad __ BNE $44db ; (nforml.l6 + 0)
.s1019:
452e : a5 12 __ LDA P5 ; (v + 1)
4530 : d0 a9 __ BNE $44db ; (nforml.l6 + 0)
.s1020:
4532 : c5 11 __ CMP P4 ; (v + 0)
4534 : 90 a5 __ BCC $44db ; (nforml.l6 + 0)
4536 : 4c 11 44 JMP $4411 ; (nforml.s7 + 0)
--------------------------------------------------------------------
4539 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
4549 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
4559 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->i16
.s0:
4564 : 20 72 45 JSR $4572 ; (getpch + 0)
4567 : c9 00 __ CMP #$00
4569 : f0 f9 __ BEQ $4564 ; (getch.s0 + 0)
456b : 85 1b __ STA ACCU + 0 
456d : a9 00 __ LDA #$00
456f : 85 1c __ STA ACCU + 1 
.s1001:
4571 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
4572 : 20 e4 ff JSR $ffe4 
4575 : ae f3 50 LDX $50f3 ; (giocharmap + 0)
4578 : e0 01 __ CPX #$01
457a : 90 26 __ BCC $45a2 ; (getpch + 48)
457c : c9 0d __ CMP #$0d
457e : d0 02 __ BNE $4582 ; (getpch + 16)
4580 : a9 0a __ LDA #$0a
4582 : e0 02 __ CPX #$02
4584 : 90 1c __ BCC $45a2 ; (getpch + 48)
4586 : c9 db __ CMP #$db
4588 : b0 18 __ BCS $45a2 ; (getpch + 48)
458a : c9 41 __ CMP #$41
458c : 90 14 __ BCC $45a2 ; (getpch + 48)
458e : c9 c1 __ CMP #$c1
4590 : 90 02 __ BCC $4594 ; (getpch + 34)
4592 : 49 a0 __ EOR #$a0
4594 : c9 7b __ CMP #$7b
4596 : b0 0a __ BCS $45a2 ; (getpch + 48)
4598 : c9 61 __ CMP #$61
459a : b0 04 __ BCS $45a0 ; (getpch + 46)
459c : c9 5b __ CMP #$5b
459e : b0 02 __ BCS $45a2 ; (getpch + 48)
45a0 : 49 20 __ EOR #$20
45a2 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
45a3 : 20 81 ff JSR $ff81 
.s1001:
45a6 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
45a7 : 24 d7 __ BIT $d7 
45a9 : 30 03 __ BMI $45ae ; (screen_setmode.s1001 + 0)
.s6:
45ab : 20 5f ff JSR $ff5f 
.s1001:
45ae : 60 __ __ RTS
--------------------------------------------------------------------
45af : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
45bf : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
45cf : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
45d9 : __ __ __ BYT 4f 56 4c 31 00                                  : OVL1.
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
45de : a5 0d __ LDA P0 
45e0 : a6 0e __ LDX P1 
45e2 : 20 68 ff JSR $ff68 
.s1001:
45e5 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
45e6 : a5 0d __ LDA P0 
45e8 : 05 0e __ ORA P1 
45ea : f0 08 __ BEQ $45f4 ; (krnio_setnam.s0 + 14)
45ec : a0 ff __ LDY #$ff
45ee : c8 __ __ INY
45ef : b1 0d __ LDA (P0),y 
45f1 : d0 fb __ BNE $45ee ; (krnio_setnam.s0 + 8)
45f3 : 98 __ __ TYA
45f4 : a6 0d __ LDX P0 
45f6 : a4 0e __ LDY P1 
45f8 : 20 bd ff JSR $ffbd 
.s1001:
45fb : 60 __ __ RTS
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
45fc : a5 0d __ LDA P0 
45fe : a6 0e __ LDX P1 
4600 : a4 0f __ LDY P2 
4602 : 20 ba ff JSR $ffba 
4605 : a9 00 __ LDA #$00
4607 : a2 00 __ LDX #$00
4609 : a0 00 __ LDY #$00
460b : 20 d5 ff JSR $ffd5 
460e : a9 00 __ LDA #$00
4610 : b0 02 __ BCS $4614 ; (krnio_load.s0 + 24)
4612 : a9 01 __ LDA #$01
4614 : 85 1b __ STA ACCU + 0 
.s1001:
4616 : a5 1b __ LDA ACCU + 0 
4618 : 60 __ __ RTS
--------------------------------------------------------------------
4619 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
4629 : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
4637 : a9 01 __ LDA #$01
4639 : 85 0d __ STA P0 
463b : a9 00 __ LDA #$00
463d : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
463f : a5 0d __ LDA P0 
4641 : 85 1b __ STA ACCU + 0 
4643 : a5 0e __ LDA P1 
4645 : 85 1c __ STA ACCU + 1 
4647 : ae f2 50 LDX $50f2 ; (spentry + 0)
464a : 9a __ __ TXS
464b : a9 4c __ LDA #$4c
464d : 85 54 __ STA $54 
464f : a9 00 __ LDA #$00
4651 : 85 13 __ STA P6 
.s1001:
4653 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
4654 : a5 53 __ LDA T9 + 0 
4656 : 8d f9 bf STA $bff9 ; (buffer + 9)
4659 : a5 54 __ LDA T9 + 1 
465b : 8d fa bf STA $bffa ; (buffer + 10)
.s0:
465e : a6 13 __ LDX P6 ; (mode + 0)
4660 : bd e2 50 LDA $50e2,x ; (__multab36L + 0)
4663 : 85 47 __ STA T1 + 0 
4665 : aa __ __ TAX
4666 : 18 __ __ CLC
4667 : 69 00 __ ADC #$00
4669 : 85 49 __ STA T2 + 0 
466b : a9 59 __ LDA #$59
466d : 69 00 __ ADC #$00
466f : 85 4a __ STA T2 + 1 
4671 : bd 04 59 LDA $5904,x ; (vdc_modes + 4)
4674 : f0 0a __ BEQ $4680 ; (vdc_set_mode.s3 + 0)
.s4:
4676 : ad 1e 5a LDA $5a1e ; (vdc_state + 0)
4679 : c9 10 __ CMP #$10
467b : d0 03 __ BNE $4680 ; (vdc_set_mode.s3 + 0)
467d : 4c 60 49 JMP $4960 ; (vdc_set_mode.s1001 + 0)
.s3:
4680 : a9 00 __ LDA #$00
4682 : 8d 34 5a STA $5a34 ; (vdc_state + 22)
4685 : 8d 35 5a STA $5a35 ; (vdc_state + 23)
4688 : 8d 36 5a STA $5a36 ; (vdc_state + 24)
468b : a0 09 __ LDY #$09
468d : b1 49 __ LDA (T2 + 0),y 
468f : 8d 2a 5a STA $5a2a ; (vdc_state + 12)
4692 : c8 __ __ INY
4693 : b1 49 __ LDA (T2 + 0),y 
4695 : 8d 2b 5a STA $5a2b ; (vdc_state + 13)
4698 : c8 __ __ INY
4699 : b1 49 __ LDA (T2 + 0),y 
469b : 8d 2c 5a STA $5a2c ; (vdc_state + 14)
469e : c8 __ __ INY
469f : b1 49 __ LDA (T2 + 0),y 
46a1 : 8d 2d 5a STA $5a2d ; (vdc_state + 15)
46a4 : a0 0f __ LDY #$0f
46a6 : b1 49 __ LDA (T2 + 0),y 
46a8 : 8d 30 5a STA $5a30 ; (vdc_state + 18)
46ab : c8 __ __ INY
46ac : b1 49 __ LDA (T2 + 0),y 
46ae : 8d 31 5a STA $5a31 ; (vdc_state + 19)
46b1 : c8 __ __ INY
46b2 : b1 49 __ LDA (T2 + 0),y 
46b4 : 8d 32 5a STA $5a32 ; (vdc_state + 20)
46b7 : c8 __ __ INY
46b8 : b1 49 __ LDA (T2 + 0),y 
46ba : 8d 33 5a STA $5a33 ; (vdc_state + 21)
46bd : a0 00 __ LDY #$00
46bf : b1 49 __ LDA (T2 + 0),y 
46c1 : 85 44 __ STA T3 + 0 
46c3 : c8 __ __ INY
46c4 : b1 49 __ LDA (T2 + 0),y 
46c6 : 85 45 __ STA T3 + 1 
46c8 : 8d 22 5a STA $5a22 ; (vdc_state + 4)
46cb : a5 44 __ LDA T3 + 0 
46cd : 8d 21 5a STA $5a21 ; (vdc_state + 3)
46d0 : c8 __ __ INY
46d1 : b1 49 __ LDA (T2 + 0),y 
46d3 : 85 1b __ STA ACCU + 0 
46d5 : c8 __ __ INY
46d6 : b1 49 __ LDA (T2 + 0),y 
46d8 : 85 1c __ STA ACCU + 1 
46da : 8d 24 5a STA $5a24 ; (vdc_state + 6)
46dd : a5 1b __ LDA ACCU + 0 
46df : 8d 23 5a STA $5a23 ; (vdc_state + 5)
46e2 : a0 05 __ LDY #$05
46e4 : b1 49 __ LDA (T2 + 0),y 
46e6 : 85 4b __ STA T5 + 0 
46e8 : c8 __ __ INY
46e9 : b1 49 __ LDA (T2 + 0),y 
46eb : 85 4c __ STA T5 + 1 
46ed : 8d 27 5a STA $5a27 ; (vdc_state + 9)
46f0 : a5 4b __ LDA T5 + 0 
46f2 : 8d 26 5a STA $5a26 ; (vdc_state + 8)
46f5 : c8 __ __ INY
46f6 : b1 49 __ LDA (T2 + 0),y 
46f8 : 85 4d __ STA T6 + 0 
46fa : c8 __ __ INY
46fb : b1 49 __ LDA (T2 + 0),y 
46fd : 85 4e __ STA T6 + 1 
46ff : 8d 29 5a STA $5a29 ; (vdc_state + 11)
4702 : a5 4d __ LDA T6 + 0 
4704 : 8d 28 5a STA $5a28 ; (vdc_state + 10)
4707 : a0 0d __ LDY #$0d
4709 : b1 49 __ LDA (T2 + 0),y 
470b : 85 4f __ STA T7 + 0 
470d : c8 __ __ INY
470e : b1 49 __ LDA (T2 + 0),y 
4710 : 85 50 __ STA T7 + 1 
4712 : 8d 2f 5a STA $5a2f ; (vdc_state + 17)
4715 : a5 4f __ LDA T7 + 0 
4717 : 8d 2e 5a STA $5a2e ; (vdc_state + 16)
471a : a5 1b __ LDA ACCU + 0 
471c : 05 1c __ ORA ACCU + 1 
471e : f0 3c __ BEQ $475c ; (vdc_set_mode.s6 + 0)
.s374:
4720 : a9 00 __ LDA #$00
4722 : 85 51 __ STA T8 + 0 
4724 : 85 52 __ STA T8 + 1 
4726 : a9 37 __ LDA #$37
4728 : 85 53 __ STA T9 + 0 
472a : a9 5a __ LDA #$5a
472c : 85 54 __ STA T9 + 1 
472e : a2 00 __ LDX #$00
.l8:
4730 : a5 51 __ LDA T8 + 0 
4732 : a0 00 __ LDY #$00
4734 : 91 53 __ STA (T9 + 0),y 
4736 : a5 52 __ LDA T8 + 1 
4738 : c8 __ __ INY
4739 : 91 53 __ STA (T9 + 0),y 
473b : 18 __ __ CLC
473c : a5 44 __ LDA T3 + 0 
473e : 65 51 __ ADC T8 + 0 
4740 : 85 51 __ STA T8 + 0 
4742 : a5 45 __ LDA T3 + 1 
4744 : 65 52 __ ADC T8 + 1 
4746 : 85 52 __ STA T8 + 1 
4748 : 18 __ __ CLC
4749 : a5 53 __ LDA T9 + 0 
474b : 69 02 __ ADC #$02
474d : 85 53 __ STA T9 + 0 
474f : 90 02 __ BCC $4753 ; (vdc_set_mode.s1115 + 0)
.s1114:
4751 : e6 54 __ INC T9 + 1 
.s1115:
4753 : e8 __ __ INX
4754 : a5 1c __ LDA ACCU + 1 
4756 : d0 d8 __ BNE $4730 ; (vdc_set_mode.l8 + 0)
.s1108:
4758 : e4 1b __ CPX ACCU + 0 
475a : 90 d4 __ BCC $4730 ; (vdc_set_mode.l8 + 0)
.s6:
475c : a9 22 __ LDA #$22
475e : 8d 00 d6 STA $d600 
.l1577:
4761 : 2c 00 d6 BIT $d600 
4764 : 10 fb __ BPL $4761 ; (vdc_set_mode.l1577 + 0)
.s16:
4766 : a9 80 __ LDA #$80
4768 : 8d 01 d6 STA $d601 
476b : a9 0c __ LDA #$0c
476d : 8d 00 d6 STA $d600 
.l1579:
4770 : 2c 00 d6 BIT $d600 
4773 : 10 fb __ BPL $4770 ; (vdc_set_mode.l1579 + 0)
.s22:
4775 : a5 4c __ LDA T5 + 1 
4777 : 8d 01 d6 STA $d601 
477a : a9 0d __ LDA #$0d
477c : 8d 00 d6 STA $d600 
.l1581:
477f : 2c 00 d6 BIT $d600 
4782 : 10 fb __ BPL $477f ; (vdc_set_mode.l1581 + 0)
.s27:
4784 : a5 4b __ LDA T5 + 0 
4786 : 8d 01 d6 STA $d601 
4789 : a9 14 __ LDA #$14
478b : 8d 00 d6 STA $d600 
.l1583:
478e : 2c 00 d6 BIT $d600 
4791 : 10 fb __ BPL $478e ; (vdc_set_mode.l1583 + 0)
.s32:
4793 : a5 4e __ LDA T6 + 1 
4795 : 8d 01 d6 STA $d601 
4798 : a9 15 __ LDA #$15
479a : 8d 00 d6 STA $d600 
.l1585:
479d : 2c 00 d6 BIT $d600 
47a0 : 10 fb __ BPL $479d ; (vdc_set_mode.l1585 + 0)
.s37:
47a2 : a5 4d __ LDA T6 + 0 
47a4 : 8d 01 d6 STA $d601 
47a7 : a6 47 __ LDX T1 + 0 
47a9 : bd 0e 59 LDA $590e,x ; (vdc_modes + 14)
47ac : 85 45 __ STA T3 + 1 
47ae : a9 1c __ LDA #$1c
47b0 : 8d 00 d6 STA $d600 
.l1587:
47b3 : 2c 00 d6 BIT $d600 
47b6 : 10 fb __ BPL $47b3 ; (vdc_set_mode.l1587 + 0)
.s44:
47b8 : ad 01 d6 LDA $d601 
47bb : 29 10 __ AND #$10
47bd : 45 45 __ EOR T3 + 1 
47bf : 29 1f __ AND #$1f
47c1 : 45 45 __ EOR T3 + 1 
47c3 : aa __ __ TAX
47c4 : a9 1c __ LDA #$1c
47c6 : 8d 00 d6 STA $d600 
.l1589:
47c9 : 2c 00 d6 BIT $d600 
47cc : 10 fb __ BPL $47c9 ; (vdc_set_mode.l1589 + 0)
.s50:
47ce : 8e 01 d6 STX $d601 
47d1 : a5 4f __ LDA T7 + 0 
47d3 : 85 0d __ STA P0 
47d5 : a5 50 __ LDA T7 + 1 
47d7 : 85 0e __ STA P1 
47d9 : 20 0a 13 JSR $130a ; (bnk_redef_charset.s0 + 0)
47dc : 18 __ __ CLC
47dd : a9 13 __ LDA #$13
47df : 65 47 __ ADC T1 + 0 
47e1 : 85 47 __ STA T1 + 0 
47e3 : a9 59 __ LDA #$59
47e5 : 69 00 __ ADC #$00
47e7 : 85 48 __ STA T1 + 1 
47e9 : a9 00 __ LDA #$00
47eb : 85 43 __ STA T0 + 0 
.l52:
47ed : a4 43 __ LDY T0 + 0 
47ef : b1 47 __ LDA (T1 + 0),y 
47f1 : 85 1b __ STA ACCU + 0 
47f3 : c8 __ __ INY
47f4 : b1 47 __ LDA (T1 + 0),y 
47f6 : aa __ __ TAX
47f7 : a5 1b __ LDA ACCU + 0 
47f9 : 8d 00 d6 STA $d600 
47fc : c8 __ __ INY
47fd : 84 43 __ STY T0 + 0 
.l1591:
47ff : 2c 00 d6 BIT $d600 
4802 : 10 fb __ BPL $47ff ; (vdc_set_mode.l1591 + 0)
.s58:
4804 : 8e 01 d6 STX $d601 
4807 : 18 __ __ CLC
4808 : a5 49 __ LDA T2 + 0 
480a : 65 43 __ ADC T0 + 0 
480c : 85 44 __ STA T3 + 0 
480e : a5 4a __ LDA T2 + 1 
4810 : 69 00 __ ADC #$00
4812 : 85 45 __ STA T3 + 1 
4814 : a0 13 __ LDY #$13
4816 : b1 44 __ LDA (T3 + 0),y 
4818 : c9 ff __ CMP #$ff
481a : d0 d1 __ BNE $47ed ; (vdc_set_mode.l52 + 0)
.s53:
481c : a0 04 __ LDY #$04
481e : b1 49 __ LDA (T2 + 0),y 
4820 : f0 05 __ BEQ $4827 ; (vdc_set_mode.s60 + 0)
.s62:
4822 : ad 1f 5a LDA $5a1f ; (vdc_state + 1)
4825 : f0 0f __ BEQ $4836 ; (vdc_set_mode.s59 + 0)
.s60:
4827 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
482a : 85 47 __ STA T1 + 0 
482c : ad 23 5a LDA $5a23 ; (vdc_state + 5)
482f : 85 49 __ STA T2 + 0 
4831 : a2 00 __ LDX #$00
4833 : 4c 47 4a JMP $4a47 ; (vdc_set_mode.l242 + 0)
.s59:
4836 : ad 1e 5a LDA $5a1e ; (vdc_state + 0)
4839 : c9 10 __ CMP #$10
483b : d0 03 __ BNE $4840 ; (vdc_set_mode.s67 + 0)
483d : 4c 51 49 JMP $4951 ; (vdc_set_mode.s61 + 0)
.s67:
4840 : ad 1f 5a LDA $5a1f ; (vdc_state + 1)
4843 : f0 03 __ BEQ $4848 ; (vdc_set_mode.s66 + 0)
4845 : 4c 51 49 JMP $4951 ; (vdc_set_mode.s61 + 0)
.s66:
4848 : a9 22 __ LDA #$22
484a : 8d 00 d6 STA $d600 
.l1624:
484d : 2c 00 d6 BIT $d600 
4850 : 10 fb __ BPL $484d ; (vdc_set_mode.l1624 + 0)
.s74:
4852 : a9 80 __ LDA #$80
4854 : 8d 01 d6 STA $d601 
4857 : a2 00 __ LDX #$00
4859 : a0 ff __ LDY #$ff
.l77:
485b : a9 12 __ LDA #$12
485d : 8d 00 d6 STA $d600 
.l1626:
4860 : 2c 00 d6 BIT $d600 
4863 : 10 fb __ BPL $4860 ; (vdc_set_mode.l1626 + 0)
.s86:
4865 : 8e 01 d6 STX $d601 
4868 : a9 13 __ LDA #$13
486a : 8d 00 d6 STA $d600 
.l1628:
486d : 2c 00 d6 BIT $d600 
4870 : 10 fb __ BPL $486d ; (vdc_set_mode.l1628 + 0)
.s91:
4872 : a9 00 __ LDA #$00
4874 : 8d 01 d6 STA $d601 
4877 : a9 1f __ LDA #$1f
4879 : 8d 00 d6 STA $d600 
.l1630:
487c : 2c 00 d6 BIT $d600 
487f : 10 fb __ BPL $487c ; (vdc_set_mode.l1630 + 0)
.s95:
4881 : a9 00 __ LDA #$00
4883 : 8d 01 d6 STA $d601 
4886 : a9 18 __ LDA #$18
4888 : 8d 00 d6 STA $d600 
.l1632:
488b : 2c 00 d6 BIT $d600 
488e : 10 fb __ BPL $488b ; (vdc_set_mode.l1632 + 0)
.s101:
4890 : ad 01 d6 LDA $d601 
4893 : 29 7f __ AND #$7f
4895 : 85 49 __ STA T2 + 0 
4897 : a9 18 __ LDA #$18
4899 : 8d 00 d6 STA $d600 
.l1634:
489c : 2c 00 d6 BIT $d600 
489f : 10 fb __ BPL $489c ; (vdc_set_mode.l1634 + 0)
.s107:
48a1 : a5 49 __ LDA T2 + 0 
48a3 : 8d 01 d6 STA $d601 
48a6 : a9 1e __ LDA #$1e
48a8 : 8d 00 d6 STA $d600 
.l1636:
48ab : 2c 00 d6 BIT $d600 
48ae : 10 fb __ BPL $48ab ; (vdc_set_mode.l1636 + 0)
.s112:
48b0 : a9 ff __ LDA #$ff
48b2 : 8d 01 d6 STA $d601 
48b5 : e8 __ __ INX
48b6 : 88 __ __ DEY
48b7 : d0 a2 __ BNE $485b ; (vdc_set_mode.l77 + 0)
.s79:
48b9 : a9 12 __ LDA #$12
48bb : 8d 00 d6 STA $d600 
.l1639:
48be : 2c 00 d6 BIT $d600 
48c1 : 10 fb __ BPL $48be ; (vdc_set_mode.l1639 + 0)
.s119:
48c3 : 8e 01 d6 STX $d601 
48c6 : a9 13 __ LDA #$13
48c8 : 8d 00 d6 STA $d600 
.l1641:
48cb : 2c 00 d6 BIT $d600 
48ce : 10 fb __ BPL $48cb ; (vdc_set_mode.l1641 + 0)
.s124:
48d0 : 8c 01 d6 STY $d601 
48d3 : a9 1f __ LDA #$1f
48d5 : 8d 00 d6 STA $d600 
.l1643:
48d8 : 2c 00 d6 BIT $d600 
48db : 10 fb __ BPL $48d8 ; (vdc_set_mode.l1643 + 0)
.s128:
48dd : 8c 01 d6 STY $d601 
48e0 : a9 18 __ LDA #$18
48e2 : 8d 00 d6 STA $d600 
.l1645:
48e5 : 2c 00 d6 BIT $d600 
48e8 : 10 fb __ BPL $48e5 ; (vdc_set_mode.l1645 + 0)
.s134:
48ea : ad 01 d6 LDA $d601 
48ed : 29 7f __ AND #$7f
48ef : aa __ __ TAX
48f0 : a9 18 __ LDA #$18
48f2 : 8d 00 d6 STA $d600 
.l1647:
48f5 : 2c 00 d6 BIT $d600 
48f8 : 10 fb __ BPL $48f5 ; (vdc_set_mode.l1647 + 0)
.s140:
48fa : 8e 01 d6 STX $d601 
48fd : a9 1e __ LDA #$1e
48ff : 8d 00 d6 STA $d600 
.l1649:
4902 : 2c 00 d6 BIT $d600 
4905 : 10 fb __ BPL $4902 ; (vdc_set_mode.l1649 + 0)
.s145:
4907 : a9 ff __ LDA #$ff
4909 : 8d 01 d6 STA $d601 
490c : a9 1c __ LDA #$1c
490e : 8d 00 d6 STA $d600 
.l1651:
4911 : 2c 00 d6 BIT $d600 
4914 : 10 fb __ BPL $4911 ; (vdc_set_mode.l1651 + 0)
.s151:
4916 : ad 01 d6 LDA $d601 
4919 : 09 10 __ ORA #$10
491b : aa __ __ TAX
491c : a9 1c __ LDA #$1c
491e : 8d 00 d6 STA $d600 
.l1653:
4921 : 2c 00 d6 BIT $d600 
4924 : 10 fb __ BPL $4921 ; (vdc_set_mode.l1653 + 0)
.s157:
4926 : 8e 01 d6 STX $d601 
4929 : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
492c : ad 21 5a LDA $5a21 ; (vdc_state + 3)
492f : 85 47 __ STA T1 + 0 
4931 : ad 23 5a LDA $5a23 ; (vdc_state + 5)
4934 : 85 49 __ STA T2 + 0 
4936 : a2 00 __ LDX #$00
.l161:
4938 : 8a __ __ TXA
4939 : e4 49 __ CPX T2 + 0 
493b : 90 2e __ BCC $496b ; (vdc_set_mode.s162 + 0)
.s159:
493d : a9 22 __ LDA #$22
493f : 8d 00 d6 STA $d600 
.l1680:
4942 : 2c 00 d6 BIT $d600 
4945 : 10 fb __ BPL $4942 ; (vdc_set_mode.l1680 + 0)
.s239:
4947 : a9 7d __ LDA #$7d
4949 : 8d 01 d6 STA $d601 
494c : a9 01 __ LDA #$01
494e : 8d 1f 5a STA $5a1f ; (vdc_state + 1)
.s61:
4951 : a9 22 __ LDA #$22
4953 : 8d 00 d6 STA $d600 
.l1621:
4956 : 2c 00 d6 BIT $d600 
4959 : 10 fb __ BPL $4956 ; (vdc_set_mode.l1621 + 0)
.s320:
495b : a9 7d __ LDA #$7d
495d : 8d 01 d6 STA $d601 
.s1001:
4960 : ad f9 bf LDA $bff9 ; (buffer + 9)
4963 : 85 53 __ STA T9 + 0 
4965 : ad fa bf LDA $bffa ; (buffer + 10)
4968 : 85 54 __ STA T9 + 1 
496a : 60 __ __ RTS
.s162:
496b : 0a __ __ ASL
496c : a8 __ __ TAY
496d : b9 38 5a LDA $5a38,y ; (multab + 1)
4970 : 85 45 __ STA T3 + 1 
4972 : ad 25 5a LDA $5a25 ; (vdc_state + 7)
4975 : 85 46 __ STA T11 + 0 
4977 : a9 12 __ LDA #$12
4979 : 8d 00 d6 STA $d600 
497c : a5 47 __ LDA T1 + 0 
497e : 38 __ __ SEC
497f : e9 01 __ SBC #$01
4981 : 85 4b __ STA T5 + 0 
4983 : b9 37 5a LDA $5a37,y ; (multab + 0)
4986 : 85 44 __ STA T3 + 0 
4988 : 18 __ __ CLC
4989 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
498c : a8 __ __ TAY
498d : a5 45 __ LDA T3 + 1 
498f : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l1656:
4992 : 2c 00 d6 BIT $d600 
4995 : 10 fb __ BPL $4992 ; (vdc_set_mode.l1656 + 0)
.s174:
4997 : 8d 01 d6 STA $d601 
499a : a9 13 __ LDA #$13
499c : 8d 00 d6 STA $d600 
.l1658:
499f : 2c 00 d6 BIT $d600 
49a2 : 10 fb __ BPL $499f ; (vdc_set_mode.l1658 + 0)
.s179:
49a4 : 8c 01 d6 STY $d601 
49a7 : a9 1f __ LDA #$1f
49a9 : 8d 00 d6 STA $d600 
.l1660:
49ac : 2c 00 d6 BIT $d600 
49af : 10 fb __ BPL $49ac ; (vdc_set_mode.l1660 + 0)
.s183:
49b1 : a9 20 __ LDA #$20
49b3 : 8d 01 d6 STA $d601 
49b6 : a9 18 __ LDA #$18
49b8 : 8d 00 d6 STA $d600 
.l1662:
49bb : 2c 00 d6 BIT $d600 
49be : 10 fb __ BPL $49bb ; (vdc_set_mode.l1662 + 0)
.s189:
49c0 : ad 01 d6 LDA $d601 
49c3 : 29 7f __ AND #$7f
49c5 : a8 __ __ TAY
49c6 : a9 18 __ LDA #$18
49c8 : 8d 00 d6 STA $d600 
.l1664:
49cb : 2c 00 d6 BIT $d600 
49ce : 10 fb __ BPL $49cb ; (vdc_set_mode.l1664 + 0)
.s195:
49d0 : 8c 01 d6 STY $d601 
49d3 : a9 1e __ LDA #$1e
49d5 : 8d 00 d6 STA $d600 
.l1666:
49d8 : 2c 00 d6 BIT $d600 
49db : 10 fb __ BPL $49d8 ; (vdc_set_mode.l1666 + 0)
.s200:
49dd : a5 4b __ LDA T5 + 0 
49df : 8d 01 d6 STA $d601 
49e2 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
49e5 : 18 __ __ CLC
49e6 : 65 44 __ ADC T3 + 0 
49e8 : a8 __ __ TAY
49e9 : a9 12 __ LDA #$12
49eb : 8d 00 d6 STA $d600 
49ee : ad 29 5a LDA $5a29 ; (vdc_state + 11)
49f1 : 65 45 __ ADC T3 + 1 
.l1668:
49f3 : 2c 00 d6 BIT $d600 
49f6 : 10 fb __ BPL $49f3 ; (vdc_set_mode.l1668 + 0)
.s207:
49f8 : 8d 01 d6 STA $d601 
49fb : a9 13 __ LDA #$13
49fd : 8d 00 d6 STA $d600 
.l1670:
4a00 : 2c 00 d6 BIT $d600 
4a03 : 10 fb __ BPL $4a00 ; (vdc_set_mode.l1670 + 0)
.s212:
4a05 : 8c 01 d6 STY $d601 
4a08 : a9 1f __ LDA #$1f
4a0a : 8d 00 d6 STA $d600 
.l1672:
4a0d : 2c 00 d6 BIT $d600 
4a10 : 10 fb __ BPL $4a0d ; (vdc_set_mode.l1672 + 0)
.s216:
4a12 : a5 46 __ LDA T11 + 0 
4a14 : 8d 01 d6 STA $d601 
4a17 : a9 18 __ LDA #$18
4a19 : 8d 00 d6 STA $d600 
.l1674:
4a1c : 2c 00 d6 BIT $d600 
4a1f : 10 fb __ BPL $4a1c ; (vdc_set_mode.l1674 + 0)
.s222:
4a21 : ad 01 d6 LDA $d601 
4a24 : 29 7f __ AND #$7f
4a26 : a8 __ __ TAY
4a27 : a9 18 __ LDA #$18
4a29 : 8d 00 d6 STA $d600 
.l1676:
4a2c : 2c 00 d6 BIT $d600 
4a2f : 10 fb __ BPL $4a2c ; (vdc_set_mode.l1676 + 0)
.s228:
4a31 : 8c 01 d6 STY $d601 
4a34 : a9 1e __ LDA #$1e
4a36 : 8d 00 d6 STA $d600 
.l1678:
4a39 : 2c 00 d6 BIT $d600 
4a3c : 10 fb __ BPL $4a39 ; (vdc_set_mode.l1678 + 0)
.s233:
4a3e : a5 4b __ LDA T5 + 0 
4a40 : 8d 01 d6 STA $d601 
4a43 : e8 __ __ INX
4a44 : 4c 38 49 JMP $4938 ; (vdc_set_mode.l161 + 0)
.l242:
4a47 : 8a __ __ TXA
4a48 : e4 49 __ CPX T2 + 0 
4a4a : 90 03 __ BCC $4a4f ; (vdc_set_mode.s243 + 0)
4a4c : 4c 51 49 JMP $4951 ; (vdc_set_mode.s61 + 0)
.s243:
4a4f : 0a __ __ ASL
4a50 : a8 __ __ TAY
4a51 : b9 38 5a LDA $5a38,y ; (multab + 1)
4a54 : 85 45 __ STA T3 + 1 
4a56 : ad 25 5a LDA $5a25 ; (vdc_state + 7)
4a59 : 85 46 __ STA T11 + 0 
4a5b : a9 12 __ LDA #$12
4a5d : 8d 00 d6 STA $d600 
4a60 : a5 47 __ LDA T1 + 0 
4a62 : 38 __ __ SEC
4a63 : e9 01 __ SBC #$01
4a65 : 85 4b __ STA T5 + 0 
4a67 : b9 37 5a LDA $5a37,y ; (multab + 0)
4a6a : 85 44 __ STA T3 + 0 
4a6c : 18 __ __ CLC
4a6d : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
4a70 : a8 __ __ TAY
4a71 : a5 45 __ LDA T3 + 1 
4a73 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l1597:
4a76 : 2c 00 d6 BIT $d600 
4a79 : 10 fb __ BPL $4a76 ; (vdc_set_mode.l1597 + 0)
.s255:
4a7b : 8d 01 d6 STA $d601 
4a7e : a9 13 __ LDA #$13
4a80 : 8d 00 d6 STA $d600 
.l1599:
4a83 : 2c 00 d6 BIT $d600 
4a86 : 10 fb __ BPL $4a83 ; (vdc_set_mode.l1599 + 0)
.s260:
4a88 : 8c 01 d6 STY $d601 
4a8b : a9 1f __ LDA #$1f
4a8d : 8d 00 d6 STA $d600 
.l1601:
4a90 : 2c 00 d6 BIT $d600 
4a93 : 10 fb __ BPL $4a90 ; (vdc_set_mode.l1601 + 0)
.s264:
4a95 : a9 20 __ LDA #$20
4a97 : 8d 01 d6 STA $d601 
4a9a : a9 18 __ LDA #$18
4a9c : 8d 00 d6 STA $d600 
.l1603:
4a9f : 2c 00 d6 BIT $d600 
4aa2 : 10 fb __ BPL $4a9f ; (vdc_set_mode.l1603 + 0)
.s270:
4aa4 : ad 01 d6 LDA $d601 
4aa7 : 29 7f __ AND #$7f
4aa9 : a8 __ __ TAY
4aaa : a9 18 __ LDA #$18
4aac : 8d 00 d6 STA $d600 
.l1605:
4aaf : 2c 00 d6 BIT $d600 
4ab2 : 10 fb __ BPL $4aaf ; (vdc_set_mode.l1605 + 0)
.s276:
4ab4 : 8c 01 d6 STY $d601 
4ab7 : a9 1e __ LDA #$1e
4ab9 : 8d 00 d6 STA $d600 
.l1607:
4abc : 2c 00 d6 BIT $d600 
4abf : 10 fb __ BPL $4abc ; (vdc_set_mode.l1607 + 0)
.s281:
4ac1 : a5 4b __ LDA T5 + 0 
4ac3 : 8d 01 d6 STA $d601 
4ac6 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
4ac9 : 18 __ __ CLC
4aca : 65 44 __ ADC T3 + 0 
4acc : a8 __ __ TAY
4acd : a9 12 __ LDA #$12
4acf : 8d 00 d6 STA $d600 
4ad2 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
4ad5 : 65 45 __ ADC T3 + 1 
.l1609:
4ad7 : 2c 00 d6 BIT $d600 
4ada : 10 fb __ BPL $4ad7 ; (vdc_set_mode.l1609 + 0)
.s288:
4adc : 8d 01 d6 STA $d601 
4adf : a9 13 __ LDA #$13
4ae1 : 8d 00 d6 STA $d600 
.l1611:
4ae4 : 2c 00 d6 BIT $d600 
4ae7 : 10 fb __ BPL $4ae4 ; (vdc_set_mode.l1611 + 0)
.s293:
4ae9 : 8c 01 d6 STY $d601 
4aec : a9 1f __ LDA #$1f
4aee : 8d 00 d6 STA $d600 
.l1613:
4af1 : 2c 00 d6 BIT $d600 
4af4 : 10 fb __ BPL $4af1 ; (vdc_set_mode.l1613 + 0)
.s297:
4af6 : a5 46 __ LDA T11 + 0 
4af8 : 8d 01 d6 STA $d601 
4afb : a9 18 __ LDA #$18
4afd : 8d 00 d6 STA $d600 
.l1615:
4b00 : 2c 00 d6 BIT $d600 
4b03 : 10 fb __ BPL $4b00 ; (vdc_set_mode.l1615 + 0)
.s303:
4b05 : ad 01 d6 LDA $d601 
4b08 : 29 7f __ AND #$7f
4b0a : a8 __ __ TAY
4b0b : a9 18 __ LDA #$18
4b0d : 8d 00 d6 STA $d600 
.l1617:
4b10 : 2c 00 d6 BIT $d600 
4b13 : 10 fb __ BPL $4b10 ; (vdc_set_mode.l1617 + 0)
.s309:
4b15 : 8c 01 d6 STY $d601 
4b18 : a9 1e __ LDA #$1e
4b1a : 8d 00 d6 STA $d600 
.l1619:
4b1d : 2c 00 d6 BIT $d600 
4b20 : 10 fb __ BPL $4b1d ; (vdc_set_mode.l1619 + 0)
.s314:
4b22 : a5 4b __ LDA T5 + 0 
4b24 : 8d 01 d6 STA $d601 
4b27 : e8 __ __ INX
4b28 : 4c 47 4a JMP $4a47 ; (vdc_set_mode.l242 + 0)
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
4b2b : a9 08 __ LDA #$08
4b2d : 85 0e __ STA P1 
4b2f : a9 50 __ LDA #$50
4b31 : 85 0f __ STA P2 
--------------------------------------------------------------------
vdc_prints: ; vdc_prints(u8,u8,const u8*)->void
.s0:
4b33 : a5 0d __ LDA P0 ; (y + 0)
4b35 : 0a __ __ ASL
4b36 : aa __ __ TAX
4b37 : bd 37 5a LDA $5a37,x ; (multab + 0)
4b3a : 85 43 __ STA T2 + 0 
4b3c : bd 38 5a LDA $5a38,x ; (multab + 1)
4b3f : 85 44 __ STA T2 + 1 
4b41 : a0 00 __ LDY #$00
4b43 : 84 1b __ STY ACCU + 0 
4b45 : b1 0e __ LDA (P1),y ; (string + 0)
4b47 : f0 16 __ BEQ $4b5f ; (vdc_prints.s6 + 0)
.s5:
4b49 : a5 0e __ LDA P1 ; (string + 0)
4b4b : 85 1b __ STA ACCU + 0 
4b4d : a2 00 __ LDX #$00
.l1046:
4b4f : c8 __ __ INY
4b50 : d0 01 __ BNE $4b53 ; (vdc_prints.s1051 + 0)
.s1050:
4b52 : e8 __ __ INX
.s1051:
4b53 : 8a __ __ TXA
4b54 : 18 __ __ CLC
4b55 : 65 0f __ ADC P2 ; (string + 1)
4b57 : 85 1c __ STA ACCU + 1 
4b59 : b1 1b __ LDA (ACCU + 0),y 
4b5b : d0 f2 __ BNE $4b4f ; (vdc_prints.l1046 + 0)
.s1047:
4b5d : 84 1b __ STY ACCU + 0 
.s6:
4b5f : ad 26 5a LDA $5a26 ; (vdc_state + 8)
4b62 : 18 __ __ CLC
4b63 : 65 43 __ ADC T2 + 0 
4b65 : aa __ __ TAX
4b66 : a9 12 __ LDA #$12
4b68 : 8d 00 d6 STA $d600 
4b6b : ad 27 5a LDA $5a27 ; (vdc_state + 9)
4b6e : 65 44 __ ADC T2 + 1 
.l354:
4b70 : 2c 00 d6 BIT $d600 
4b73 : 10 fb __ BPL $4b70 ; (vdc_prints.l354 + 0)
.s13:
4b75 : 8d 01 d6 STA $d601 
4b78 : a9 13 __ LDA #$13
4b7a : 8d 00 d6 STA $d600 
.l356:
4b7d : 2c 00 d6 BIT $d600 
4b80 : 10 fb __ BPL $4b7d ; (vdc_prints.l356 + 0)
.s18:
4b82 : 8e 01 d6 STX $d601 
4b85 : a9 1f __ LDA #$1f
4b87 : 8d 00 d6 STA $d600 
4b8a : a5 1b __ LDA ACCU + 0 
4b8c : f0 61 __ BEQ $4bef ; (vdc_prints.s23 + 0)
.s95:
4b8e : a0 00 __ LDY #$00
.l21:
4b90 : b1 0e __ LDA (P1),y ; (string + 0)
4b92 : c9 20 __ CMP #$20
4b94 : b0 05 __ BCS $4b9b ; (vdc_prints.s27 + 0)
.s26:
4b96 : 69 80 __ ADC #$80
4b98 : 4c e1 4b JMP $4be1 ; (vdc_prints.s1048 + 0)
.s27:
4b9b : aa __ __ TAX
4b9c : c9 40 __ CMP #$40
4b9e : 90 04 __ BCC $4ba4 ; (vdc_prints.s30 + 0)
.s32:
4ba0 : c9 60 __ CMP #$60
4ba2 : 90 23 __ BCC $4bc7 ; (vdc_prints.s29 + 0)
.s30:
4ba4 : c9 60 __ CMP #$60
4ba6 : 90 0a __ BCC $4bb2 ; (vdc_prints.s34 + 0)
.s36:
4ba8 : 09 00 __ ORA #$00
4baa : 30 06 __ BMI $4bb2 ; (vdc_prints.s34 + 0)
.s33:
4bac : 38 __ __ SEC
4bad : e9 20 __ SBC #$20
4baf : 4c e1 4b JMP $4be1 ; (vdc_prints.s1048 + 0)
.s34:
4bb2 : c9 80 __ CMP #$80
4bb4 : 90 09 __ BCC $4bbf ; (vdc_prints.s38 + 0)
.s40:
4bb6 : c9 a0 __ CMP #$a0
4bb8 : b0 05 __ BCS $4bbf ; (vdc_prints.s38 + 0)
.s37:
4bba : 69 40 __ ADC #$40
4bbc : 4c e1 4b JMP $4be1 ; (vdc_prints.s1048 + 0)
.s38:
4bbf : c9 a0 __ CMP #$a0
4bc1 : 90 0a __ BCC $4bcd ; (vdc_prints.s42 + 0)
.s44:
4bc3 : c9 c0 __ CMP #$c0
4bc5 : b0 06 __ BCS $4bcd ; (vdc_prints.s42 + 0)
.s29:
4bc7 : 38 __ __ SEC
4bc8 : e9 40 __ SBC #$40
4bca : 4c e1 4b JMP $4be1 ; (vdc_prints.s1048 + 0)
.s42:
4bcd : c9 c0 __ CMP #$c0
4bcf : 90 0a __ BCC $4bdb ; (vdc_prints.s46 + 0)
.s48:
4bd1 : c9 ff __ CMP #$ff
4bd3 : b0 06 __ BCS $4bdb ; (vdc_prints.s46 + 0)
.s45:
4bd5 : 38 __ __ SEC
4bd6 : e9 80 __ SBC #$80
4bd8 : 4c e1 4b JMP $4be1 ; (vdc_prints.s1048 + 0)
.s46:
4bdb : c9 ff __ CMP #$ff
4bdd : d0 03 __ BNE $4be2 ; (vdc_prints.l360 + 0)
.s49:
4bdf : a9 5e __ LDA #$5e
.s1048:
4be1 : aa __ __ TAX
.l360:
4be2 : 2c 00 d6 BIT $d600 
4be5 : 10 fb __ BPL $4be2 ; (vdc_prints.l360 + 0)
.s54:
4be7 : 8e 01 d6 STX $d601 
4bea : c8 __ __ INY
4beb : c4 1b __ CPY ACCU + 0 
4bed : 90 a1 __ BCC $4b90 ; (vdc_prints.l21 + 0)
.s23:
4bef : a9 12 __ LDA #$12
4bf1 : 8d 00 d6 STA $d600 
4bf4 : c6 1b __ DEC ACCU + 0 
4bf6 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
4bf9 : 18 __ __ CLC
4bfa : 65 43 __ ADC T2 + 0 
4bfc : a8 __ __ TAY
4bfd : ad 29 5a LDA $5a29 ; (vdc_state + 11)
4c00 : 65 44 __ ADC T2 + 1 
4c02 : ae 25 5a LDX $5a25 ; (vdc_state + 7)
.l363:
4c05 : 2c 00 d6 BIT $d600 
4c08 : 10 fb __ BPL $4c05 ; (vdc_prints.l363 + 0)
.s61:
4c0a : 8d 01 d6 STA $d601 
4c0d : a9 13 __ LDA #$13
4c0f : 8d 00 d6 STA $d600 
.l365:
4c12 : 2c 00 d6 BIT $d600 
4c15 : 10 fb __ BPL $4c12 ; (vdc_prints.l365 + 0)
.s66:
4c17 : 8c 01 d6 STY $d601 
4c1a : a9 1f __ LDA #$1f
4c1c : 8d 00 d6 STA $d600 
.l367:
4c1f : 2c 00 d6 BIT $d600 
4c22 : 10 fb __ BPL $4c1f ; (vdc_prints.l367 + 0)
.s70:
4c24 : 8e 01 d6 STX $d601 
4c27 : a9 18 __ LDA #$18
4c29 : 8d 00 d6 STA $d600 
.l369:
4c2c : 2c 00 d6 BIT $d600 
4c2f : 10 fb __ BPL $4c2c ; (vdc_prints.l369 + 0)
.s76:
4c31 : ad 01 d6 LDA $d601 
4c34 : 29 7f __ AND #$7f
4c36 : aa __ __ TAX
4c37 : a9 18 __ LDA #$18
4c39 : 8d 00 d6 STA $d600 
.l371:
4c3c : 2c 00 d6 BIT $d600 
4c3f : 10 fb __ BPL $4c3c ; (vdc_prints.l371 + 0)
.s82:
4c41 : 8e 01 d6 STX $d601 
4c44 : a9 1e __ LDA #$1e
4c46 : 8d 00 d6 STA $d600 
.l373:
4c49 : 2c 00 d6 BIT $d600 
4c4c : 10 fb __ BPL $4c49 ; (vdc_prints.l373 + 0)
.s87:
4c4e : a5 1b __ LDA ACCU + 0 
4c50 : 8d 01 d6 STA $d601 
.s1001:
4c53 : 60 __ __ RTS
--------------------------------------------------------------------
4c54 : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 6f 53 43 41 52 36 34 : sTARTING oSCAR64
4c64 : __ __ __ BYT 20 76 64 63 20 44 45 4d 4f 2e 00                :  vdc DEMO..
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
4c6f : a2 03 __ LDX #$03
4c71 : b5 53 __ LDA T8 + 0,x 
4c73 : 9d e4 bf STA $bfe4,x ; (buff + 38)
4c76 : ca __ __ DEX
4c77 : 10 f8 __ BPL $4c71 ; (sprintf.s1000 + 2)
.s0:
4c79 : 18 __ __ CLC
4c7a : a5 23 __ LDA SP + 0 
4c7c : 69 06 __ ADC #$06
4c7e : 85 47 __ STA T0 + 0 
4c80 : a5 24 __ LDA SP + 1 
4c82 : 69 00 __ ADC #$00
4c84 : 85 48 __ STA T0 + 1 
4c86 : a9 00 __ LDA #$00
4c88 : 85 43 __ STA T1 + 0 
4c8a : a0 04 __ LDY #$04
4c8c : b1 23 __ LDA (SP + 0),y 
4c8e : 85 49 __ STA T2 + 0 
4c90 : c8 __ __ INY
4c91 : b1 23 __ LDA (SP + 0),y 
4c93 : 85 4a __ STA T2 + 1 
4c95 : a0 02 __ LDY #$02
4c97 : b1 23 __ LDA (SP + 0),y 
4c99 : 85 4b __ STA T3 + 0 
4c9b : c8 __ __ INY
4c9c : b1 23 __ LDA (SP + 0),y 
4c9e : 85 4c __ STA T3 + 1 
.l2:
4ca0 : a0 00 __ LDY #$00
4ca2 : b1 49 __ LDA (T2 + 0),y 
4ca4 : d0 0f __ BNE $4cb5 ; (sprintf.s3 + 0)
.s4:
4ca6 : a4 43 __ LDY T1 + 0 
4ca8 : 91 4b __ STA (T3 + 0),y 
.s1001:
4caa : a2 03 __ LDX #$03
4cac : bd e4 bf LDA $bfe4,x ; (buff + 38)
4caf : 95 53 __ STA T8 + 0,x 
4cb1 : ca __ __ DEX
4cb2 : 10 f8 __ BPL $4cac ; (sprintf.s1001 + 2)
4cb4 : 60 __ __ RTS
.s3:
4cb5 : c9 25 __ CMP #$25
4cb7 : f0 22 __ BEQ $4cdb ; (sprintf.s5 + 0)
.s6:
4cb9 : a4 43 __ LDY T1 + 0 
4cbb : 91 4b __ STA (T3 + 0),y 
4cbd : e6 49 __ INC T2 + 0 
4cbf : d0 02 __ BNE $4cc3 ; (sprintf.s1102 + 0)
.s1101:
4cc1 : e6 4a __ INC T2 + 1 
.s1102:
4cc3 : c8 __ __ INY
4cc4 : 84 43 __ STY T1 + 0 
4cc6 : 98 __ __ TYA
4cc7 : c0 28 __ CPY #$28
4cc9 : 90 d5 __ BCC $4ca0 ; (sprintf.l2 + 0)
.s111:
4ccb : 18 __ __ CLC
4ccc : 65 4b __ ADC T3 + 0 
4cce : 85 4b __ STA T3 + 0 
4cd0 : 90 02 __ BCC $4cd4 ; (sprintf.s1104 + 0)
.s1103:
4cd2 : e6 4c __ INC T3 + 1 
.s1104:
4cd4 : a9 00 __ LDA #$00
.s1068:
4cd6 : 85 43 __ STA T1 + 0 
4cd8 : 4c a0 4c JMP $4ca0 ; (sprintf.l2 + 0)
.s5:
4cdb : 8c ec bf STY $bfec ; (buff + 46)
4cde : 8c ed bf STY $bfed ; (buff + 47)
4ce1 : 8c ee bf STY $bfee ; (buff + 48)
4ce4 : 8c ef bf STY $bfef ; (buff + 49)
4ce7 : a9 0a __ LDA #$0a
4ce9 : 8d eb bf STA $bfeb ; (buff + 45)
4cec : a5 43 __ LDA T1 + 0 
4cee : f0 0b __ BEQ $4cfb ; (sprintf.s10 + 0)
.s8:
4cf0 : 18 __ __ CLC
4cf1 : 65 4b __ ADC T3 + 0 
4cf3 : 85 4b __ STA T3 + 0 
4cf5 : 90 02 __ BCC $4cf9 ; (sprintf.s1080 + 0)
.s1079:
4cf7 : e6 4c __ INC T3 + 1 
.s1080:
4cf9 : 84 43 __ STY T1 + 0 
.s10:
4cfb : a0 01 __ LDY #$01
4cfd : b1 49 __ LDA (T2 + 0),y 
4cff : aa __ __ TAX
4d00 : a9 20 __ LDA #$20
4d02 : 8d e8 bf STA $bfe8 ; (buff + 42)
4d05 : a9 00 __ LDA #$00
4d07 : 8d e9 bf STA $bfe9 ; (buff + 43)
4d0a : a9 ff __ LDA #$ff
4d0c : 8d ea bf STA $bfea ; (buff + 44)
4d0f : 18 __ __ CLC
4d10 : a5 49 __ LDA T2 + 0 
4d12 : 69 02 __ ADC #$02
.l15:
4d14 : 85 49 __ STA T2 + 0 
4d16 : 90 02 __ BCC $4d1a ; (sprintf.s1082 + 0)
.s1081:
4d18 : e6 4a __ INC T2 + 1 
.s1082:
4d1a : 8a __ __ TXA
4d1b : e0 2b __ CPX #$2b
4d1d : d0 08 __ BNE $4d27 ; (sprintf.s18 + 0)
.s17:
4d1f : a9 01 __ LDA #$01
4d21 : 8d ed bf STA $bfed ; (buff + 47)
4d24 : 4c 88 4f JMP $4f88 ; (sprintf.s260 + 0)
.s18:
4d27 : c9 30 __ CMP #$30
4d29 : d0 06 __ BNE $4d31 ; (sprintf.s21 + 0)
.s20:
4d2b : 8d e8 bf STA $bfe8 ; (buff + 42)
4d2e : 4c 88 4f JMP $4f88 ; (sprintf.s260 + 0)
.s21:
4d31 : e0 23 __ CPX #$23
4d33 : d0 08 __ BNE $4d3d ; (sprintf.s24 + 0)
.s23:
4d35 : a9 01 __ LDA #$01
4d37 : 8d ef bf STA $bfef ; (buff + 49)
4d3a : 4c 88 4f JMP $4f88 ; (sprintf.s260 + 0)
.s24:
4d3d : e0 2d __ CPX #$2d
4d3f : d0 08 __ BNE $4d49 ; (sprintf.s16 + 0)
.s26:
4d41 : a9 01 __ LDA #$01
4d43 : 8d ee bf STA $bfee ; (buff + 48)
4d46 : 4c 88 4f JMP $4f88 ; (sprintf.s260 + 0)
.s16:
4d49 : 85 45 __ STA T4 + 0 
4d4b : e0 30 __ CPX #$30
4d4d : 90 53 __ BCC $4da2 ; (sprintf.s32 + 0)
.s33:
4d4f : e0 3a __ CPX #$3a
4d51 : b0 4f __ BCS $4da2 ; (sprintf.s32 + 0)
.s30:
4d53 : a9 00 __ LDA #$00
4d55 : 85 4d __ STA T6 + 0 
4d57 : 85 4e __ STA T6 + 1 
4d59 : e0 3a __ CPX #$3a
4d5b : b0 40 __ BCS $4d9d ; (sprintf.s36 + 0)
.l35:
4d5d : a5 4d __ LDA T6 + 0 
4d5f : 0a __ __ ASL
4d60 : 85 1b __ STA ACCU + 0 
4d62 : a5 4e __ LDA T6 + 1 
4d64 : 2a __ __ ROL
4d65 : 06 1b __ ASL ACCU + 0 
4d67 : 2a __ __ ROL
4d68 : aa __ __ TAX
4d69 : 18 __ __ CLC
4d6a : a5 1b __ LDA ACCU + 0 
4d6c : 65 4d __ ADC T6 + 0 
4d6e : 85 4d __ STA T6 + 0 
4d70 : 8a __ __ TXA
4d71 : 65 4e __ ADC T6 + 1 
4d73 : 06 4d __ ASL T6 + 0 
4d75 : 2a __ __ ROL
4d76 : aa __ __ TAX
4d77 : 18 __ __ CLC
4d78 : a5 4d __ LDA T6 + 0 
4d7a : 65 45 __ ADC T4 + 0 
4d7c : 90 01 __ BCC $4d7f ; (sprintf.s1098 + 0)
.s1097:
4d7e : e8 __ __ INX
.s1098:
4d7f : 38 __ __ SEC
4d80 : e9 30 __ SBC #$30
4d82 : 85 4d __ STA T6 + 0 
4d84 : 8a __ __ TXA
4d85 : e9 00 __ SBC #$00
4d87 : 85 4e __ STA T6 + 1 
4d89 : a0 00 __ LDY #$00
4d8b : b1 49 __ LDA (T2 + 0),y 
4d8d : 85 45 __ STA T4 + 0 
4d8f : e6 49 __ INC T2 + 0 
4d91 : d0 02 __ BNE $4d95 ; (sprintf.s1100 + 0)
.s1099:
4d93 : e6 4a __ INC T2 + 1 
.s1100:
4d95 : c9 30 __ CMP #$30
4d97 : 90 04 __ BCC $4d9d ; (sprintf.s36 + 0)
.s37:
4d99 : c9 3a __ CMP #$3a
4d9b : 90 c0 __ BCC $4d5d ; (sprintf.l35 + 0)
.s36:
4d9d : a5 4d __ LDA T6 + 0 
4d9f : 8d e9 bf STA $bfe9 ; (buff + 43)
.s32:
4da2 : a5 45 __ LDA T4 + 0 
4da4 : c9 2e __ CMP #$2e
4da6 : d0 51 __ BNE $4df9 ; (sprintf.s40 + 0)
.s38:
4da8 : a9 00 __ LDA #$00
4daa : 85 4d __ STA T6 + 0 
.l245:
4dac : 85 4e __ STA T6 + 1 
4dae : a0 00 __ LDY #$00
4db0 : b1 49 __ LDA (T2 + 0),y 
4db2 : 85 45 __ STA T4 + 0 
4db4 : e6 49 __ INC T2 + 0 
4db6 : d0 02 __ BNE $4dba ; (sprintf.s1084 + 0)
.s1083:
4db8 : e6 4a __ INC T2 + 1 
.s1084:
4dba : c9 30 __ CMP #$30
4dbc : 90 04 __ BCC $4dc2 ; (sprintf.s43 + 0)
.s44:
4dbe : c9 3a __ CMP #$3a
4dc0 : 90 0a __ BCC $4dcc ; (sprintf.s42 + 0)
.s43:
4dc2 : a5 4d __ LDA T6 + 0 
4dc4 : 8d ea bf STA $bfea ; (buff + 44)
4dc7 : a5 45 __ LDA T4 + 0 
4dc9 : 4c f9 4d JMP $4df9 ; (sprintf.s40 + 0)
.s42:
4dcc : a5 4d __ LDA T6 + 0 
4dce : 0a __ __ ASL
4dcf : 85 1b __ STA ACCU + 0 
4dd1 : a5 4e __ LDA T6 + 1 
4dd3 : 2a __ __ ROL
4dd4 : 06 1b __ ASL ACCU + 0 
4dd6 : 2a __ __ ROL
4dd7 : aa __ __ TAX
4dd8 : 18 __ __ CLC
4dd9 : a5 1b __ LDA ACCU + 0 
4ddb : 65 4d __ ADC T6 + 0 
4ddd : 85 4d __ STA T6 + 0 
4ddf : 8a __ __ TXA
4de0 : 65 4e __ ADC T6 + 1 
4de2 : 06 4d __ ASL T6 + 0 
4de4 : 2a __ __ ROL
4de5 : aa __ __ TAX
4de6 : 18 __ __ CLC
4de7 : a5 4d __ LDA T6 + 0 
4de9 : 65 45 __ ADC T4 + 0 
4deb : 90 01 __ BCC $4dee ; (sprintf.s1096 + 0)
.s1095:
4ded : e8 __ __ INX
.s1096:
4dee : 38 __ __ SEC
4def : e9 30 __ SBC #$30
4df1 : 85 4d __ STA T6 + 0 
4df3 : 8a __ __ TXA
4df4 : e9 00 __ SBC #$00
4df6 : 4c ac 4d JMP $4dac ; (sprintf.l245 + 0)
.s40:
4df9 : c9 64 __ CMP #$64
4dfb : f0 04 __ BEQ $4e01 ; (sprintf.s45 + 0)
.s48:
4dfd : c9 44 __ CMP #$44
4dff : d0 05 __ BNE $4e06 ; (sprintf.s46 + 0)
.s45:
4e01 : a9 01 __ LDA #$01
4e03 : 4c 61 4f JMP $4f61 ; (sprintf.s261 + 0)
.s46:
4e06 : c9 75 __ CMP #$75
4e08 : d0 03 __ BNE $4e0d ; (sprintf.s52 + 0)
4e0a : 4c 5f 4f JMP $4f5f ; (sprintf.s285 + 0)
.s52:
4e0d : c9 55 __ CMP #$55
4e0f : d0 03 __ BNE $4e14 ; (sprintf.s50 + 0)
4e11 : 4c 5f 4f JMP $4f5f ; (sprintf.s285 + 0)
.s50:
4e14 : c9 78 __ CMP #$78
4e16 : f0 04 __ BEQ $4e1c ; (sprintf.s53 + 0)
.s56:
4e18 : c9 58 __ CMP #$58
4e1a : d0 0d __ BNE $4e29 ; (sprintf.s54 + 0)
.s53:
4e1c : a9 10 __ LDA #$10
4e1e : 8d eb bf STA $bfeb ; (buff + 45)
4e21 : a9 00 __ LDA #$00
4e23 : 8d ec bf STA $bfec ; (buff + 46)
4e26 : 4c 5f 4f JMP $4f5f ; (sprintf.s285 + 0)
.s54:
4e29 : c9 6c __ CMP #$6c
4e2b : d0 03 __ BNE $4e30 ; (sprintf.s60 + 0)
4e2d : 4c f1 4e JMP $4ef1 ; (sprintf.s57 + 0)
.s60:
4e30 : c9 4c __ CMP #$4c
4e32 : d0 03 __ BNE $4e37 ; (sprintf.s58 + 0)
4e34 : 4c f1 4e JMP $4ef1 ; (sprintf.s57 + 0)
.s58:
4e37 : c9 73 __ CMP #$73
4e39 : f0 37 __ BEQ $4e72 ; (sprintf.s73 + 0)
.s76:
4e3b : c9 53 __ CMP #$53
4e3d : f0 33 __ BEQ $4e72 ; (sprintf.s73 + 0)
.s74:
4e3f : c9 63 __ CMP #$63
4e41 : f0 14 __ BEQ $4e57 ; (sprintf.s104 + 0)
.s107:
4e43 : c9 43 __ CMP #$43
4e45 : f0 10 __ BEQ $4e57 ; (sprintf.s104 + 0)
.s105:
4e47 : 09 00 __ ORA #$00
4e49 : d0 03 __ BNE $4e4e ; (sprintf.s108 + 0)
4e4b : 4c a0 4c JMP $4ca0 ; (sprintf.l2 + 0)
.s108:
4e4e : a4 43 __ LDY T1 + 0 
4e50 : 91 4b __ STA (T3 + 0),y 
4e52 : e6 43 __ INC T1 + 0 
4e54 : 4c a0 4c JMP $4ca0 ; (sprintf.l2 + 0)
.s104:
4e57 : a0 00 __ LDY #$00
4e59 : b1 47 __ LDA (T0 + 0),y 
4e5b : a4 43 __ LDY T1 + 0 
4e5d : 91 4b __ STA (T3 + 0),y 
4e5f : e6 43 __ INC T1 + 0 
.s258:
4e61 : 18 __ __ CLC
4e62 : a5 47 __ LDA T0 + 0 
4e64 : 69 02 __ ADC #$02
4e66 : 85 47 __ STA T0 + 0 
4e68 : b0 03 __ BCS $4e6d ; (sprintf.s1085 + 0)
4e6a : 4c a0 4c JMP $4ca0 ; (sprintf.l2 + 0)
.s1085:
4e6d : e6 48 __ INC T0 + 1 
4e6f : 4c a0 4c JMP $4ca0 ; (sprintf.l2 + 0)
.s73:
4e72 : a0 00 __ LDY #$00
4e74 : 84 45 __ STY T4 + 0 
4e76 : b1 47 __ LDA (T0 + 0),y 
4e78 : 85 4d __ STA T6 + 0 
4e7a : c8 __ __ INY
4e7b : b1 47 __ LDA (T0 + 0),y 
4e7d : 85 4e __ STA T6 + 1 
4e7f : 18 __ __ CLC
4e80 : a5 47 __ LDA T0 + 0 
4e82 : 69 02 __ ADC #$02
4e84 : 85 47 __ STA T0 + 0 
4e86 : 90 02 __ BCC $4e8a ; (sprintf.s1092 + 0)
.s1091:
4e88 : e6 48 __ INC T0 + 1 
.s1092:
4e8a : ad e9 bf LDA $bfe9 ; (buff + 43)
4e8d : f0 0d __ BEQ $4e9c ; (sprintf.s79 + 0)
.s1071:
4e8f : a0 00 __ LDY #$00
4e91 : b1 4d __ LDA (T6 + 0),y 
4e93 : f0 05 __ BEQ $4e9a ; (sprintf.s1072 + 0)
.l81:
4e95 : c8 __ __ INY
4e96 : b1 4d __ LDA (T6 + 0),y 
4e98 : d0 fb __ BNE $4e95 ; (sprintf.l81 + 0)
.s1072:
4e9a : 84 45 __ STY T4 + 0 
.s79:
4e9c : ad ee bf LDA $bfee ; (buff + 48)
4e9f : d0 19 __ BNE $4eba ; (sprintf.l95 + 0)
.s1075:
4ea1 : a6 45 __ LDX T4 + 0 
4ea3 : ec e9 bf CPX $bfe9 ; (buff + 43)
4ea6 : a4 43 __ LDY T1 + 0 
4ea8 : b0 0c __ BCS $4eb6 ; (sprintf.s1076 + 0)
.l87:
4eaa : ad e8 bf LDA $bfe8 ; (buff + 42)
4ead : 91 4b __ STA (T3 + 0),y 
4eaf : e8 __ __ INX
4eb0 : ec e9 bf CPX $bfe9 ; (buff + 43)
4eb3 : c8 __ __ INY
4eb4 : 90 f4 __ BCC $4eaa ; (sprintf.l87 + 0)
.s1076:
4eb6 : 86 45 __ STX T4 + 0 
4eb8 : 84 43 __ STY T1 + 0 
.l95:
4eba : a0 00 __ LDY #$00
4ebc : b1 4d __ LDA (T6 + 0),y 
4ebe : f0 0f __ BEQ $4ecf ; (sprintf.s91 + 0)
.s96:
4ec0 : a4 43 __ LDY T1 + 0 
4ec2 : 91 4b __ STA (T3 + 0),y 
4ec4 : e6 43 __ INC T1 + 0 
4ec6 : e6 4d __ INC T6 + 0 
4ec8 : d0 f0 __ BNE $4eba ; (sprintf.l95 + 0)
.s1093:
4eca : e6 4e __ INC T6 + 1 
4ecc : 4c ba 4e JMP $4eba ; (sprintf.l95 + 0)
.s91:
4ecf : ad ee bf LDA $bfee ; (buff + 48)
4ed2 : d0 03 __ BNE $4ed7 ; (sprintf.s1073 + 0)
4ed4 : 4c a0 4c JMP $4ca0 ; (sprintf.l2 + 0)
.s1073:
4ed7 : a6 45 __ LDX T4 + 0 
4ed9 : ec e9 bf CPX $bfe9 ; (buff + 43)
4edc : a4 43 __ LDY T1 + 0 
4ede : b0 0c __ BCS $4eec ; (sprintf.s1074 + 0)
.l102:
4ee0 : ad e8 bf LDA $bfe8 ; (buff + 42)
4ee3 : 91 4b __ STA (T3 + 0),y 
4ee5 : e8 __ __ INX
4ee6 : ec e9 bf CPX $bfe9 ; (buff + 43)
4ee9 : c8 __ __ INY
4eea : 90 f4 __ BCC $4ee0 ; (sprintf.l102 + 0)
.s1074:
4eec : 84 43 __ STY T1 + 0 
4eee : 4c a0 4c JMP $4ca0 ; (sprintf.l2 + 0)
.s57:
4ef1 : a0 00 __ LDY #$00
4ef3 : b1 47 __ LDA (T0 + 0),y 
4ef5 : 85 53 __ STA T8 + 0 
4ef7 : c8 __ __ INY
4ef8 : b1 47 __ LDA (T0 + 0),y 
4efa : 85 54 __ STA T8 + 1 
4efc : c8 __ __ INY
4efd : b1 47 __ LDA (T0 + 0),y 
4eff : 85 55 __ STA T8 + 2 
4f01 : c8 __ __ INY
4f02 : b1 47 __ LDA (T0 + 0),y 
4f04 : 85 56 __ STA T8 + 3 
4f06 : 18 __ __ CLC
4f07 : a5 47 __ LDA T0 + 0 
4f09 : 69 04 __ ADC #$04
4f0b : 85 47 __ STA T0 + 0 
4f0d : 90 02 __ BCC $4f11 ; (sprintf.s1088 + 0)
.s1087:
4f0f : e6 48 __ INC T0 + 1 
.s1088:
4f11 : a0 00 __ LDY #$00
4f13 : b1 49 __ LDA (T2 + 0),y 
4f15 : aa __ __ TAX
4f16 : e6 49 __ INC T2 + 0 
4f18 : d0 02 __ BNE $4f1c ; (sprintf.s1090 + 0)
.s1089:
4f1a : e6 4a __ INC T2 + 1 
.s1090:
4f1c : 8a __ __ TXA
4f1d : e0 64 __ CPX #$64
4f1f : f0 04 __ BEQ $4f25 ; (sprintf.s61 + 0)
.s64:
4f21 : c9 44 __ CMP #$44
4f23 : d0 04 __ BNE $4f29 ; (sprintf.s62 + 0)
.s61:
4f25 : a9 01 __ LDA #$01
4f27 : d0 1c __ BNE $4f45 ; (sprintf.s259 + 0)
.s62:
4f29 : c9 75 __ CMP #$75
4f2b : f0 17 __ BEQ $4f44 ; (sprintf.s284 + 0)
.s68:
4f2d : c9 55 __ CMP #$55
4f2f : f0 13 __ BEQ $4f44 ; (sprintf.s284 + 0)
.s66:
4f31 : c9 78 __ CMP #$78
4f33 : f0 07 __ BEQ $4f3c ; (sprintf.s69 + 0)
.s72:
4f35 : c9 58 __ CMP #$58
4f37 : f0 03 __ BEQ $4f3c ; (sprintf.s69 + 0)
4f39 : 4c a0 4c JMP $4ca0 ; (sprintf.l2 + 0)
.s69:
4f3c : 8c ec bf STY $bfec ; (buff + 46)
4f3f : a9 10 __ LDA #$10
4f41 : 8d eb bf STA $bfeb ; (buff + 45)
.s284:
4f44 : 98 __ __ TYA
.s259:
4f45 : 85 15 __ STA P8 
4f47 : a5 4b __ LDA T3 + 0 
4f49 : 85 0f __ STA P2 ; (fmt + 0)
4f4b : a5 4c __ LDA T3 + 1 
4f4d : 85 10 __ STA P3 ; (fmt + 1)
4f4f : a9 e8 __ LDA #$e8
4f51 : 85 0d __ STA P0 ; (str + 0)
4f53 : a9 bf __ LDA #$bf
4f55 : 85 0e __ STA P1 ; (str + 1)
4f57 : 20 b6 43 JSR $43b6 ; (nforml@proxy + 0)
4f5a : a5 1b __ LDA ACCU + 0 
4f5c : 4c d6 4c JMP $4cd6 ; (sprintf.s1068 + 0)
.s285:
4f5f : a9 00 __ LDA #$00
.s261:
4f61 : 85 13 __ STA P6 
4f63 : a5 4b __ LDA T3 + 0 
4f65 : 85 0f __ STA P2 ; (fmt + 0)
4f67 : a5 4c __ LDA T3 + 1 
4f69 : 85 10 __ STA P3 ; (fmt + 1)
4f6b : a0 00 __ LDY #$00
4f6d : b1 47 __ LDA (T0 + 0),y 
4f6f : 85 11 __ STA P4 ; (fmt + 2)
4f71 : c8 __ __ INY
4f72 : b1 47 __ LDA (T0 + 0),y 
4f74 : 85 12 __ STA P5 ; (fmt + 3)
4f76 : a9 e8 __ LDA #$e8
4f78 : 85 0d __ STA P0 ; (str + 0)
4f7a : a9 bf __ LDA #$bf
4f7c : 85 0e __ STA P1 ; (str + 1)
4f7e : 20 81 42 JSR $4281 ; (nformi.s0 + 0)
4f81 : a5 1b __ LDA ACCU + 0 
4f83 : 85 43 __ STA T1 + 0 
4f85 : 4c 61 4e JMP $4e61 ; (sprintf.s258 + 0)
.s260:
4f88 : a0 00 __ LDY #$00
4f8a : b1 49 __ LDA (T2 + 0),y 
4f8c : aa __ __ TAX
4f8d : 18 __ __ CLC
4f8e : a5 49 __ LDA T2 + 0 
4f90 : 69 01 __ ADC #$01
4f92 : 4c 14 4d JMP $4d14 ; (sprintf.l15 + 0)
--------------------------------------------------------------------
4f95 : __ __ __ BYT 76 64 63 20 4d 45 4d 4f 52 59 20 44 45 54 45 43 : vdc MEMORY DETEC
4fa5 : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 2c 20 45 58 54 45 : TED: %U kb, EXTE
4fb5 : __ __ __ BYT 4e 44 45 44 20 4d 45 4d 4f 52 59 20 25 53 41 42 : NDED MEMORY %SAB
4fc5 : __ __ __ BYT 4c 45 44 2e 00                                  : LED..
--------------------------------------------------------------------
4fca : __ __ __ BYT 65 4e 00                                        : eN.
--------------------------------------------------------------------
4fcd : __ __ __ BYT 64 49 53 00                                     : dIS.
--------------------------------------------------------------------
4fd1 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 3a 00 : lOADING ASSETS:.
--------------------------------------------------------------------
4fe1 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 20 31 3a 20 6c 4f 56 45 : - SCREEN 1: lOVE
4ff1 : __ __ __ BYT 20 49 53 20 41 20 64 52 55 47 00                :  IS A dRUG.
--------------------------------------------------------------------
4ffc : __ __ __ BYT 6f 4e 20 00                                     : oN .
--------------------------------------------------------------------
5000 : __ __ __ BYT 53 43 52 45 45 4e 31 00                         : SCREEN1.
--------------------------------------------------------------------
5008 : __ __ __ BYT 6c 4f 41 44 20 45 52 52 4f 52 2e 00             : lOAD ERROR..
--------------------------------------------------------------------
5014 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 20 32 3a 20 6c 4f 47 4f : - SCREEN 2: lOGO
5024 : __ __ __ BYT 20 54 45 53 54 20 53 43 52 45 45 4e 00          :  TEST SCREEN.
--------------------------------------------------------------------
5031 : __ __ __ BYT 53 43 52 45 45 4e 32 00                         : SCREEN2.
--------------------------------------------------------------------
5039 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 44 45 4d 4f : oSCAR64 vdc DEMO
5049 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
504a : __ __ __ BYT 76 64 63 20 6d 45 4d 4f 52 59 20 64 45 54 45 43 : vdc mEMORY dETEC
505a : __ __ __ BYT 54 45 44 3a 20 25 44 20 6b 62 2c 20 53 43 52 45 : TED: %D kb, SCRE
506a : __ __ __ BYT 45 4e 20 53 49 5a 45 3a 20 25 44 58 25 44 2c 20 : EN SIZE: %DX%D, 
507a : __ __ __ BYT 45 58 54 2e 4d 45 4d 3a 20 25 53 00             : EXT.MEM: %S.
--------------------------------------------------------------------
5086 : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
508a : __ __ __ BYT 6d 4f 56 45 20 42 59 20 77 2c 61 2c 73 2c 64 20 : mOVE BY w,a,s,d 
509a : __ __ __ BYT 4f 52 20 43 55 52 53 4f 52 20 4b 45 59 53 2e 20 : OR CURSOR KEYS. 
50aa : __ __ __ BYT 65 73 63 20 4f 52 20 73 74 6f 70 20 54 4f 20 45 : esc OR stop TO E
50ba : __ __ __ BYT 58 49 54 2e 00                                  : XIT..
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
50bf : a9 b5 __ LDA #$b5
50c1 : 85 0d __ STA P0 
50c3 : a9 be __ LDA #$be
50c5 : 85 0e __ STA P1 
50c7 : ad 36 bf LDA $bf36 ; (viewport + 11)
50ca : 85 0f __ STA P2 
50cc : ad 37 bf LDA $bf37 ; (viewport + 12)
50cf : 85 10 __ STA P3 
50d1 : 4c 44 51 JMP $5144 ; (vdcwin_init.s0 + 0)
--------------------------------------------------------------------
50d4 : __ __ __ BYT 25 53 20 25 53 20 25 53 20 25 53 2e 00          : %S %S %S %S..
--------------------------------------------------------------------
50e1 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
__multab36L:
50e2 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
__multab6L:
50e8 : __ __ __ BYT 00 06 0c 12 18                                  : .....
--------------------------------------------------------------------
__multab15L:
50ed : __ __ __ BYT 00 0f 1e 2d 3c                                  : ...-<
--------------------------------------------------------------------
spentry:
50f2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
50f3 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
seed:
50f4 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
p2smap:
50f6 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
5100 : __ __ __ BYT 70 45 54 53 43 49 49 20 41 52 54 20 43 52 45 44 : pETSCII ART CRED
5110 : __ __ __ BYT 49 54 3a 20 27 6c 4f 56 45 20 49 53 20 54 48 45 : IT: 'lOVE IS THE
5120 : __ __ __ BYT 20 44 52 55 47 27 20 61 54 4c 41 4e 54 49 53 2c :  DRUG' aTLANTIS,
5130 : __ __ __ BYT 20 32 30 32 33 2c 20 61 52 54 20 42 59 20 6c 4f :  2023, aRT BY lO
5140 : __ __ __ BYT 42 4f 2e 00                                     : BO..
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
5144 : a9 00 __ LDA #$00
5146 : a0 04 __ LDY #$04
5148 : 91 0d __ STA (P0),y ; (win + 0)
514a : c8 __ __ INY
514b : 91 0d __ STA (P0),y ; (win + 0)
514d : a5 0f __ LDA P2 ; (sx + 0)
514f : a0 00 __ LDY #$00
5151 : 91 0d __ STA (P0),y ; (win + 0)
5153 : a5 10 __ LDA P3 ; (sy + 0)
5155 : c8 __ __ INY
5156 : 91 0d __ STA (P0),y ; (win + 0)
5158 : a5 11 __ LDA P4 ; (wx + 0)
515a : c8 __ __ INY
515b : 91 0d __ STA (P0),y ; (win + 0)
515d : a5 12 __ LDA P5 ; (wy + 0)
515f : c8 __ __ INY
5160 : 91 0d __ STA (P0),y ; (win + 0)
5162 : 06 10 __ ASL P3 ; (sy + 0)
5164 : a6 10 __ LDX P3 ; (sy + 0)
5166 : bd 37 5a LDA $5a37,x ; (multab + 0)
5169 : 18 __ __ CLC
516a : 65 0f __ ADC P2 ; (sx + 0)
516c : 85 1b __ STA ACCU + 0 
516e : bd 38 5a LDA $5a38,x ; (multab + 1)
5171 : 69 00 __ ADC #$00
5173 : a8 __ __ TAY
5174 : ad 26 5a LDA $5a26 ; (vdc_state + 8)
5177 : 18 __ __ CLC
5178 : 65 1b __ ADC ACCU + 0 
517a : 85 1b __ STA ACCU + 0 
517c : 98 __ __ TYA
517d : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
5180 : a0 07 __ LDY #$07
5182 : 91 0d __ STA (P0),y ; (win + 0)
5184 : a5 1b __ LDA ACCU + 0 
5186 : 88 __ __ DEY
5187 : 91 0d __ STA (P0),y ; (win + 0)
5189 : bd 37 5a LDA $5a37,x ; (multab + 0)
518c : 18 __ __ CLC
518d : 65 0f __ ADC P2 ; (sx + 0)
518f : 85 1b __ STA ACCU + 0 
5191 : bd 38 5a LDA $5a38,x ; (multab + 1)
5194 : 69 00 __ ADC #$00
5196 : aa __ __ TAX
5197 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
519a : 18 __ __ CLC
519b : 65 1b __ ADC ACCU + 0 
519d : 85 1b __ STA ACCU + 0 
519f : 8a __ __ TXA
51a0 : 6d 29 5a ADC $5a29 ; (vdc_state + 11)
51a3 : a0 09 __ LDY #$09
51a5 : 91 0d __ STA (P0),y ; (win + 0)
51a7 : a5 1b __ LDA ACCU + 0 
51a9 : 88 __ __ DEY
51aa : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
51ac : 60 __ __ RTS
--------------------------------------------------------------------
generateSentence: ; generateSentence(u8*)->void
.s1000:
51ad : 38 __ __ SEC
51ae : a5 23 __ LDA SP + 0 
51b0 : e9 0e __ SBC #$0e
51b2 : 85 23 __ STA SP + 0 
51b4 : b0 02 __ BCS $51b8 ; (generateSentence.s0 + 0)
51b6 : c6 24 __ DEC SP + 1 
.s0:
51b8 : a9 74 __ LDA #$74
51ba : 8d dc bf STA $bfdc ; (buff + 30)
51bd : a9 48 __ LDA #$48
51bf : 8d dd bf STA $bfdd ; (buff + 31)
51c2 : a9 45 __ LDA #$45
51c4 : 8d de bf STA $bfde ; (buff + 32)
51c7 : a9 00 __ LDA #$00
51c9 : 8d df bf STA $bfdf ; (buff + 33)
51cc : 8d e1 bf STA $bfe1 ; (buff + 35)
51cf : 8d e2 bf STA $bfe2 ; (buff + 36)
51d2 : 8d e3 bf STA $bfe3 ; (buff + 37)
51d5 : a9 61 __ LDA #$61
51d7 : 8d e0 bf STA $bfe0 ; (buff + 34)
51da : a2 4b __ LDX #$4b
.l1002:
51dc : bd 9e 58 LDA $589e,x 
51df : 9d 90 bf STA $bf90,x ; (verbs + 29)
51e2 : ca __ __ DEX
51e3 : d0 f7 __ BNE $51dc ; (generateSentence.l1002 + 0)
.s1003:
51e5 : a2 1e __ LDX #$1e
.l1004:
51e7 : bd d7 59 LDA $59d7,x ; (vdc_modes + 215)
51ea : 9d 72 bf STA $bf72,x ; (adjectives + 29)
51ed : ca __ __ DEX
51ee : d0 f7 __ BNE $51e7 ; (generateSentence.l1004 + 0)
.s1005:
51f0 : a0 1e __ LDY #$1e
.l1006:
51f2 : b9 ff 59 LDA $59ff,y 
51f5 : 99 54 bf STA $bf54,y ; (window + 9)
51f8 : 88 __ __ DEY
51f9 : d0 f7 __ BNE $51f2 ; (generateSentence.l1006 + 0)
.s1007:
51fb : 84 04 __ STY WORK + 1 
51fd : ad f5 50 LDA $50f5 ; (seed + 1)
5200 : 4a __ __ LSR
5201 : ad f4 50 LDA $50f4 ; (seed + 0)
5204 : 6a __ __ ROR
5205 : aa __ __ TAX
5206 : 98 __ __ TYA
5207 : 6a __ __ ROR
5208 : 4d f4 50 EOR $50f4 ; (seed + 0)
520b : 85 43 __ STA T0 + 0 
520d : 8a __ __ TXA
520e : 4d f5 50 EOR $50f5 ; (seed + 1)
5211 : 85 44 __ STA T0 + 1 
5213 : 4a __ __ LSR
5214 : 45 43 __ EOR T0 + 0 
5216 : 85 43 __ STA T0 + 0 
5218 : 45 44 __ EOR T0 + 1 
521a : 85 44 __ STA T0 + 1 
521c : 4a __ __ LSR
521d : a5 43 __ LDA T0 + 0 
521f : 6a __ __ ROR
5220 : aa __ __ TAX
5221 : 98 __ __ TYA
5222 : 6a __ __ ROR
5223 : 45 43 __ EOR T0 + 0 
5225 : 85 45 __ STA T1 + 0 
5227 : 8a __ __ TXA
5228 : 45 44 __ EOR T0 + 1 
522a : 85 46 __ STA T1 + 1 
522c : 4a __ __ LSR
522d : 45 45 __ EOR T1 + 0 
522f : 85 45 __ STA T1 + 0 
5231 : 45 46 __ EOR T1 + 1 
5233 : 85 46 __ STA T1 + 1 
5235 : 4a __ __ LSR
5236 : a5 45 __ LDA T1 + 0 
5238 : 6a __ __ ROR
5239 : aa __ __ TAX
523a : 98 __ __ TYA
523b : 6a __ __ ROR
523c : 45 45 __ EOR T1 + 0 
523e : 85 47 __ STA T2 + 0 
5240 : 8a __ __ TXA
5241 : 45 46 __ EOR T1 + 1 
5243 : 85 48 __ STA T2 + 1 
5245 : 4a __ __ LSR
5246 : 45 47 __ EOR T2 + 0 
5248 : 85 47 __ STA T2 + 0 
524a : 45 48 __ EOR T2 + 1 
524c : 85 48 __ STA T2 + 1 
524e : 4a __ __ LSR
524f : a5 47 __ LDA T2 + 0 
5251 : 6a __ __ ROR
5252 : aa __ __ TAX
5253 : 98 __ __ TYA
5254 : 6a __ __ ROR
5255 : 45 47 __ EOR T2 + 0 
5257 : 85 49 __ STA T3 + 0 
5259 : 8a __ __ TXA
525a : 45 48 __ EOR T2 + 1 
525c : 85 4a __ STA T3 + 1 
525e : 4a __ __ LSR
525f : 45 49 __ EOR T3 + 0 
5261 : 8d f4 50 STA $50f4 ; (seed + 0)
5264 : 85 1b __ STA ACCU + 0 
5266 : 45 4a __ EOR T3 + 1 
5268 : 8d f5 50 STA $50f5 ; (seed + 1)
526b : 85 1c __ STA ACCU + 1 
526d : 98 __ __ TYA
526e : 91 16 __ STA (P9),y ; (sentence + 0)
5270 : a5 16 __ LDA P9 ; (sentence + 0)
5272 : a0 02 __ LDY #$02
5274 : 91 23 __ STA (SP + 0),y 
5276 : a5 17 __ LDA P10 ; (sentence + 1)
5278 : c8 __ __ INY
5279 : 91 23 __ STA (SP + 0),y 
527b : a9 d4 __ LDA #$d4
527d : c8 __ __ INY
527e : 91 23 __ STA (SP + 0),y 
5280 : a9 50 __ LDA #$50
5282 : c8 __ __ INY
5283 : 84 03 __ STY WORK + 0 
5285 : 91 23 __ STA (SP + 0),y 
5287 : a5 43 __ LDA T0 + 0 
5289 : 29 01 __ AND #$01
528b : 0a __ __ ASL
528c : 0a __ __ ASL
528d : 69 dc __ ADC #$dc
528f : c8 __ __ INY
5290 : 91 23 __ STA (SP + 0),y 
5292 : a9 bf __ LDA #$bf
5294 : 69 00 __ ADC #$00
5296 : c8 __ __ INY
5297 : 91 23 __ STA (SP + 0),y 
5299 : 20 65 57 JSR $5765 ; (divmod + 0)
529c : a6 05 __ LDX WORK + 2 
529e : bd e8 50 LDA $50e8,x ; (__multab6L + 0)
52a1 : 18 __ __ CLC
52a2 : 69 55 __ ADC #$55
52a4 : a0 08 __ LDY #$08
52a6 : 91 23 __ STA (SP + 0),y 
52a8 : a9 bf __ LDA #$bf
52aa : 69 00 __ ADC #$00
52ac : c8 __ __ INY
52ad : 91 23 __ STA (SP + 0),y 
52af : a5 45 __ LDA T1 + 0 
52b1 : 85 1b __ STA ACCU + 0 
52b3 : a5 46 __ LDA T1 + 1 
52b5 : 85 1c __ STA ACCU + 1 
52b7 : a9 05 __ LDA #$05
52b9 : 85 03 __ STA WORK + 0 
52bb : a9 00 __ LDA #$00
52bd : 85 04 __ STA WORK + 1 
52bf : 20 65 57 JSR $5765 ; (divmod + 0)
52c2 : a6 05 __ LDX WORK + 2 
52c4 : bd ed 50 LDA $50ed,x ; (__multab15L + 0)
52c7 : 18 __ __ CLC
52c8 : 69 91 __ ADC #$91
52ca : a0 0a __ LDY #$0a
52cc : 91 23 __ STA (SP + 0),y 
52ce : a9 bf __ LDA #$bf
52d0 : 69 00 __ ADC #$00
52d2 : c8 __ __ INY
52d3 : 91 23 __ STA (SP + 0),y 
52d5 : a5 47 __ LDA T2 + 0 
52d7 : 85 1b __ STA ACCU + 0 
52d9 : a5 48 __ LDA T2 + 1 
52db : 85 1c __ STA ACCU + 1 
52dd : a9 05 __ LDA #$05
52df : 85 03 __ STA WORK + 0 
52e1 : a9 00 __ LDA #$00
52e3 : 85 04 __ STA WORK + 1 
52e5 : 20 65 57 JSR $5765 ; (divmod + 0)
52e8 : a6 05 __ LDX WORK + 2 
52ea : bd e8 50 LDA $50e8,x ; (__multab6L + 0)
52ed : 18 __ __ CLC
52ee : 69 73 __ ADC #$73
52f0 : a0 0c __ LDY #$0c
52f2 : 91 23 __ STA (SP + 0),y 
52f4 : a9 bf __ LDA #$bf
52f6 : 69 00 __ ADC #$00
52f8 : c8 __ __ INY
52f9 : 91 23 __ STA (SP + 0),y 
52fb : 20 6f 4c JSR $4c6f ; (sprintf.s1000 + 0)
.s1001:
52fe : 18 __ __ CLC
52ff : a5 23 __ LDA SP + 0 
5301 : 69 0e __ ADC #$0e
5303 : 85 23 __ STA SP + 0 
5305 : 90 02 __ BCC $5309 ; (generateSentence.s1001 + 11)
5307 : e6 24 __ INC SP + 1 
5309 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
530a : a5 53 __ LDA T0 + 0 
530c : 8d fb bf STA $bffb ; (buffer + 11)
530f : a5 54 __ LDA T0 + 1 
5311 : 8d fc bf STA $bffc ; (buffer + 12)
5314 : 38 __ __ SEC
5315 : a5 23 __ LDA SP + 0 
5317 : e9 06 __ SBC #$06
5319 : 85 23 __ STA SP + 0 
531b : b0 02 __ BCS $531f ; (vdcwin_printline.s0 + 0)
531d : c6 24 __ DEC SP + 1 
.s0:
531f : a0 08 __ LDY #$08
5321 : b1 23 __ LDA (SP + 0),y 
5323 : 85 53 __ STA T0 + 0 
5325 : a0 02 __ LDY #$02
5327 : 91 23 __ STA (SP + 0),y 
5329 : a0 09 __ LDY #$09
532b : b1 23 __ LDA (SP + 0),y 
532d : 85 54 __ STA T0 + 1 
532f : a0 03 __ LDY #$03
5331 : 91 23 __ STA (SP + 0),y 
5333 : a0 0a __ LDY #$0a
5335 : b1 23 __ LDA (SP + 0),y 
5337 : a0 04 __ LDY #$04
5339 : 91 23 __ STA (SP + 0),y 
533b : a0 0b __ LDY #$0b
533d : b1 23 __ LDA (SP + 0),y 
533f : a0 05 __ LDY #$05
5341 : 91 23 __ STA (SP + 0),y 
5343 : 20 e3 55 JSR $55e3 ; (vdcwin_put_string.s1000 + 0)
5346 : a9 00 __ LDA #$00
5348 : a0 04 __ LDY #$04
534a : 91 53 __ STA (T0 + 0),y 
534c : 88 __ __ DEY
534d : b1 53 __ LDA (T0 + 0),y 
534f : 38 __ __ SEC
5350 : e9 01 __ SBC #$01
5352 : 85 43 __ STA T1 + 0 
5354 : a0 05 __ LDY #$05
5356 : b1 53 __ LDA (T0 + 0),y 
5358 : 90 0b __ BCC $5365 ; (vdcwin_printline.s2 + 0)
.s1058:
535a : aa __ __ TAX
535b : e4 43 __ CPX T1 + 0 
535d : b0 06 __ BCS $5365 ; (vdcwin_printline.s2 + 0)
.s1:
535f : e8 __ __ INX
5360 : 8a __ __ TXA
5361 : 91 53 __ STA (T0 + 0),y 
5363 : 90 62 __ BCC $53c7 ; (vdcwin_printline.s1001 + 0)
.s2:
5365 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
5368 : 85 43 __ STA T1 + 0 
536a : ad 22 5a LDA $5a22 ; (vdc_state + 4)
536d : 85 44 __ STA T1 + 1 
536f : a0 02 __ LDY #$02
5371 : b1 53 __ LDA (T0 + 0),y 
5373 : 85 48 __ STA T4 + 0 
5375 : a0 06 __ LDY #$06
5377 : b1 53 __ LDA (T0 + 0),y 
5379 : 85 46 __ STA T3 + 0 
537b : c8 __ __ INY
537c : b1 53 __ LDA (T0 + 0),y 
537e : 85 47 __ STA T3 + 1 
5380 : c8 __ __ INY
5381 : b1 53 __ LDA (T0 + 0),y 
5383 : 85 49 __ STA T5 + 0 
5385 : c8 __ __ INY
5386 : b1 53 __ LDA (T0 + 0),y 
5388 : a2 00 __ LDX #$00
.l5:
538a : 85 4a __ STA T5 + 1 
538c : a0 03 __ LDY #$03
538e : b1 53 __ LDA (T0 + 0),y 
5390 : 85 4c __ STA T7 + 0 
5392 : 38 __ __ SEC
5393 : e9 01 __ SBC #$01
5395 : b0 03 __ BCS $539a ; (vdcwin_printline.s1056 + 0)
5397 : 4c c3 54 JMP $54c3 ; (vdcwin_printline.s6 + 0)
.s1056:
539a : 85 4e __ STA T8 + 0 
539c : e4 4e __ CPX T8 + 0 
539e : b0 03 __ BCS $53a3 ; (vdcwin_printline.s4 + 0)
53a0 : 4c c3 54 JMP $54c3 ; (vdcwin_printline.s6 + 0)
.s4:
53a3 : a0 01 __ LDY #$01
53a5 : b1 53 __ LDA (T0 + 0),y 
53a7 : 18 __ __ CLC
53a8 : 65 4c __ ADC T7 + 0 
53aa : 38 __ __ SEC
53ab : e9 01 __ SBC #$01
53ad : 85 45 __ STA T2 + 0 
53af : aa __ __ TAX
53b0 : 88 __ __ DEY
53b1 : b1 53 __ LDA (T0 + 0),y 
53b3 : 85 48 __ STA T4 + 0 
53b5 : a0 02 __ LDY #$02
53b7 : b1 53 __ LDA (T0 + 0),y 
53b9 : 85 4b __ STA T6 + 0 
.l185:
53bb : 8a __ __ TXA
53bc : 18 __ __ CLC
53bd : 69 01 __ ADC #$01
53bf : b0 1c __ BCS $53dd ; (vdcwin_printline.s186 + 0)
.s1026:
53c1 : c5 45 __ CMP T2 + 0 
53c3 : 90 02 __ BCC $53c7 ; (vdcwin_printline.s1001 + 0)
.s1063:
53c5 : d0 16 __ BNE $53dd ; (vdcwin_printline.s186 + 0)
.s1001:
53c7 : 18 __ __ CLC
53c8 : a5 23 __ LDA SP + 0 
53ca : 69 06 __ ADC #$06
53cc : 85 23 __ STA SP + 0 
53ce : 90 02 __ BCC $53d2 ; (vdcwin_printline.s1001 + 11)
53d0 : e6 24 __ INC SP + 1 
53d2 : ad fb bf LDA $bffb ; (buffer + 11)
53d5 : 85 53 __ STA T0 + 0 
53d7 : ad fc bf LDA $bffc ; (buffer + 12)
53da : 85 54 __ STA T0 + 1 
53dc : 60 __ __ RTS
.s186:
53dd : ad 25 5a LDA $5a25 ; (vdc_state + 7)
53e0 : 85 52 __ STA T11 + 0 
53e2 : a5 45 __ LDA T2 + 0 
53e4 : 0a __ __ ASL
53e5 : a8 __ __ TAY
53e6 : a9 12 __ LDA #$12
53e8 : 8d 00 d6 STA $d600 
53eb : a5 4b __ LDA T6 + 0 
53ed : 38 __ __ SEC
53ee : e9 01 __ SBC #$01
53f0 : 85 49 __ STA T5 + 0 
53f2 : 18 __ __ CLC
53f3 : a5 48 __ LDA T4 + 0 
53f5 : 79 37 5a ADC $5a37,y ; (multab + 0)
53f8 : 85 53 __ STA T0 + 0 
53fa : a9 00 __ LDA #$00
53fc : 79 38 5a ADC $5a38,y ; (multab + 1)
53ff : 85 54 __ STA T0 + 1 
5401 : 18 __ __ CLC
5402 : a5 53 __ LDA T0 + 0 
5404 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
5407 : a8 __ __ TAY
5408 : a5 54 __ LDA T0 + 1 
540a : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l917:
540d : 2c 00 d6 BIT $d600 
5410 : 10 fb __ BPL $540d ; (vdcwin_printline.l917 + 0)
.s198:
5412 : 8d 01 d6 STA $d601 
5415 : a9 13 __ LDA #$13
5417 : 8d 00 d6 STA $d600 
.l919:
541a : 2c 00 d6 BIT $d600 
541d : 10 fb __ BPL $541a ; (vdcwin_printline.l919 + 0)
.s203:
541f : 8c 01 d6 STY $d601 
5422 : a9 1f __ LDA #$1f
5424 : 8d 00 d6 STA $d600 
.l921:
5427 : 2c 00 d6 BIT $d600 
542a : 10 fb __ BPL $5427 ; (vdcwin_printline.l921 + 0)
.s207:
542c : a9 20 __ LDA #$20
542e : 8d 01 d6 STA $d601 
5431 : a9 18 __ LDA #$18
5433 : 8d 00 d6 STA $d600 
.l923:
5436 : 2c 00 d6 BIT $d600 
5439 : 10 fb __ BPL $5436 ; (vdcwin_printline.l923 + 0)
.s213:
543b : ad 01 d6 LDA $d601 
543e : 29 7f __ AND #$7f
5440 : a8 __ __ TAY
5441 : a9 18 __ LDA #$18
5443 : 8d 00 d6 STA $d600 
.l925:
5446 : 2c 00 d6 BIT $d600 
5449 : 10 fb __ BPL $5446 ; (vdcwin_printline.l925 + 0)
.s219:
544b : 8c 01 d6 STY $d601 
544e : a9 1e __ LDA #$1e
5450 : 8d 00 d6 STA $d600 
.l927:
5453 : 2c 00 d6 BIT $d600 
5456 : 10 fb __ BPL $5453 ; (vdcwin_printline.l927 + 0)
.s224:
5458 : a5 49 __ LDA T5 + 0 
545a : 8d 01 d6 STA $d601 
545d : ad 28 5a LDA $5a28 ; (vdc_state + 10)
5460 : 18 __ __ CLC
5461 : 65 53 __ ADC T0 + 0 
5463 : a8 __ __ TAY
5464 : a9 12 __ LDA #$12
5466 : 8d 00 d6 STA $d600 
5469 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
546c : 65 54 __ ADC T0 + 1 
.l929:
546e : 2c 00 d6 BIT $d600 
5471 : 10 fb __ BPL $546e ; (vdcwin_printline.l929 + 0)
.s231:
5473 : 8d 01 d6 STA $d601 
5476 : a9 13 __ LDA #$13
5478 : 8d 00 d6 STA $d600 
.l931:
547b : 2c 00 d6 BIT $d600 
547e : 10 fb __ BPL $547b ; (vdcwin_printline.l931 + 0)
.s236:
5480 : 8c 01 d6 STY $d601 
5483 : a9 1f __ LDA #$1f
5485 : 8d 00 d6 STA $d600 
.l933:
5488 : 2c 00 d6 BIT $d600 
548b : 10 fb __ BPL $5488 ; (vdcwin_printline.l933 + 0)
.s240:
548d : a5 52 __ LDA T11 + 0 
548f : 8d 01 d6 STA $d601 
5492 : a9 18 __ LDA #$18
5494 : 8d 00 d6 STA $d600 
.l935:
5497 : 2c 00 d6 BIT $d600 
549a : 10 fb __ BPL $5497 ; (vdcwin_printline.l935 + 0)
.s246:
549c : ad 01 d6 LDA $d601 
549f : 29 7f __ AND #$7f
54a1 : a8 __ __ TAY
54a2 : a9 18 __ LDA #$18
54a4 : 8d 00 d6 STA $d600 
.l937:
54a7 : 2c 00 d6 BIT $d600 
54aa : 10 fb __ BPL $54a7 ; (vdcwin_printline.l937 + 0)
.s252:
54ac : 8c 01 d6 STY $d601 
54af : a9 1e __ LDA #$1e
54b1 : 8d 00 d6 STA $d600 
.l939:
54b4 : 2c 00 d6 BIT $d600 
54b7 : 10 fb __ BPL $54b4 ; (vdcwin_printline.l939 + 0)
.s257:
54b9 : a5 49 __ LDA T5 + 0 
54bb : 8d 01 d6 STA $d601 
54be : e6 45 __ INC T2 + 0 
54c0 : 4c bb 53 JMP $53bb ; (vdcwin_printline.l185 + 0)
.s6:
54c3 : a9 12 __ LDA #$12
54c5 : 8d 00 d6 STA $d600 
54c8 : a5 49 __ LDA T5 + 0 
54ca : 65 43 __ ADC T1 + 0 
54cc : a8 __ __ TAY
54cd : a5 4a __ LDA T5 + 1 
54cf : 65 44 __ ADC T1 + 1 
54d1 : 85 4d __ STA T7 + 1 
54d3 : 18 __ __ CLC
54d4 : a5 46 __ LDA T3 + 0 
54d6 : 65 43 __ ADC T1 + 0 
54d8 : 85 50 __ STA T9 + 0 
54da : a5 47 __ LDA T3 + 1 
54dc : 65 44 __ ADC T1 + 1 
54de : 85 51 __ STA T9 + 1 
.l888:
54e0 : 2c 00 d6 BIT $d600 
54e3 : 10 fb __ BPL $54e0 ; (vdcwin_printline.l888 + 0)
.s62:
54e5 : a5 47 __ LDA T3 + 1 
54e7 : 8d 01 d6 STA $d601 
54ea : a9 13 __ LDA #$13
54ec : 8d 00 d6 STA $d600 
.l890:
54ef : 2c 00 d6 BIT $d600 
54f2 : 10 fb __ BPL $54ef ; (vdcwin_printline.l890 + 0)
.s67:
54f4 : a5 46 __ LDA T3 + 0 
54f6 : 8d 01 d6 STA $d601 
54f9 : a9 1f __ LDA #$1f
54fb : 8d 00 d6 STA $d600 
54fe : a9 18 __ LDA #$18
5500 : 8d 00 d6 STA $d600 
.l892:
5503 : 2c 00 d6 BIT $d600 
5506 : 10 fb __ BPL $5503 ; (vdcwin_printline.l892 + 0)
.s74:
5508 : ad 01 d6 LDA $d601 
550b : 09 80 __ ORA #$80
550d : 85 1b __ STA ACCU + 0 
550f : a9 18 __ LDA #$18
5511 : 8d 00 d6 STA $d600 
.l894:
5514 : 2c 00 d6 BIT $d600 
5517 : 10 fb __ BPL $5514 ; (vdcwin_printline.l894 + 0)
.s80:
5519 : a5 1b __ LDA ACCU + 0 
551b : 8d 01 d6 STA $d601 
551e : a9 20 __ LDA #$20
5520 : 8d 00 d6 STA $d600 
.l896:
5523 : 2c 00 d6 BIT $d600 
5526 : 10 fb __ BPL $5523 ; (vdcwin_printline.l896 + 0)
.s85:
5528 : a5 51 __ LDA T9 + 1 
552a : 8d 01 d6 STA $d601 
552d : a9 21 __ LDA #$21
552f : 8d 00 d6 STA $d600 
.l898:
5532 : 2c 00 d6 BIT $d600 
5535 : 10 fb __ BPL $5532 ; (vdcwin_printline.l898 + 0)
.s90:
5537 : a5 50 __ LDA T9 + 0 
5539 : 8d 01 d6 STA $d601 
553c : a9 1f __ LDA #$1f
553e : 8d 00 d6 STA $d600 
5541 : a9 1e __ LDA #$1e
5543 : 8d 00 d6 STA $d600 
.l900:
5546 : 2c 00 d6 BIT $d600 
5549 : 10 fb __ BPL $5546 ; (vdcwin_printline.l900 + 0)
.s96:
554b : a5 48 __ LDA T4 + 0 
554d : 8d 01 d6 STA $d601 
5550 : a9 12 __ LDA #$12
5552 : 8d 00 d6 STA $d600 
.l902:
5555 : 2c 00 d6 BIT $d600 
5558 : 10 fb __ BPL $5555 ; (vdcwin_printline.l902 + 0)
.s149:
555a : a5 4a __ LDA T5 + 1 
555c : 8d 01 d6 STA $d601 
555f : a9 13 __ LDA #$13
5561 : 8d 00 d6 STA $d600 
.l904:
5564 : 2c 00 d6 BIT $d600 
5567 : 10 fb __ BPL $5564 ; (vdcwin_printline.l904 + 0)
.s154:
5569 : a5 49 __ LDA T5 + 0 
556b : 8d 01 d6 STA $d601 
556e : a9 1f __ LDA #$1f
5570 : 8d 00 d6 STA $d600 
5573 : a9 18 __ LDA #$18
5575 : 8d 00 d6 STA $d600 
.l906:
5578 : 2c 00 d6 BIT $d600 
557b : 10 fb __ BPL $5578 ; (vdcwin_printline.l906 + 0)
.s161:
557d : ad 01 d6 LDA $d601 
5580 : 09 80 __ ORA #$80
5582 : 85 50 __ STA T9 + 0 
5584 : a9 18 __ LDA #$18
5586 : 8d 00 d6 STA $d600 
.l908:
5589 : 2c 00 d6 BIT $d600 
558c : 10 fb __ BPL $5589 ; (vdcwin_printline.l908 + 0)
.s167:
558e : a5 50 __ LDA T9 + 0 
5590 : 8d 01 d6 STA $d601 
5593 : a9 20 __ LDA #$20
5595 : 8d 00 d6 STA $d600 
.l910:
5598 : 2c 00 d6 BIT $d600 
559b : 10 fb __ BPL $5598 ; (vdcwin_printline.l910 + 0)
.s172:
559d : a5 4d __ LDA T7 + 1 
559f : 8d 01 d6 STA $d601 
55a2 : a9 21 __ LDA #$21
55a4 : 8d 00 d6 STA $d600 
.l912:
55a7 : 2c 00 d6 BIT $d600 
55aa : 10 fb __ BPL $55a7 ; (vdcwin_printline.l912 + 0)
.s177:
55ac : 8c 01 d6 STY $d601 
55af : a9 1f __ LDA #$1f
55b1 : 8d 00 d6 STA $d600 
55b4 : a9 1e __ LDA #$1e
55b6 : 8d 00 d6 STA $d600 
.l914:
55b9 : 2c 00 d6 BIT $d600 
55bc : 10 fb __ BPL $55b9 ; (vdcwin_printline.l914 + 0)
.s183:
55be : a5 48 __ LDA T4 + 0 
55c0 : 8d 01 d6 STA $d601 
55c3 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
55c6 : 18 __ __ CLC
55c7 : 65 46 __ ADC T3 + 0 
55c9 : 85 46 __ STA T3 + 0 
55cb : ad 22 5a LDA $5a22 ; (vdc_state + 4)
55ce : 65 47 __ ADC T3 + 1 
55d0 : 85 47 __ STA T3 + 1 
55d2 : 18 __ __ CLC
55d3 : a5 49 __ LDA T5 + 0 
55d5 : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
55d8 : 85 49 __ STA T5 + 0 
55da : a5 4a __ LDA T5 + 1 
55dc : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
55df : e8 __ __ INX
55e0 : 4c 8a 53 JMP $538a ; (vdcwin_printline.l5 + 0)
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->void
.s1000:
55e3 : 38 __ __ SEC
55e4 : a5 23 __ LDA SP + 0 
55e6 : e9 0a __ SBC #$0a
55e8 : 85 23 __ STA SP + 0 
55ea : b0 02 __ BCS $55ee ; (vdcwin_put_string.s0 + 0)
55ec : c6 24 __ DEC SP + 1 
.s0:
55ee : a9 00 __ LDA #$00
55f0 : 85 43 __ STA T0 + 0 
55f2 : a0 0c __ LDY #$0c
55f4 : b1 23 __ LDA (SP + 0),y 
55f6 : 85 44 __ STA T1 + 0 
55f8 : c8 __ __ INY
55f9 : b1 23 __ LDA (SP + 0),y 
55fb : 85 45 __ STA T1 + 1 
55fd : a0 04 __ LDY #$04
55ff : b1 44 __ LDA (T1 + 0),y 
5601 : 85 46 __ STA T2 + 0 
5603 : c8 __ __ INY
5604 : b1 44 __ LDA (T1 + 0),y 
5606 : 85 47 __ STA T3 + 0 
5608 : a0 0e __ LDY #$0e
560a : b1 23 __ LDA (SP + 0),y 
560c : 85 48 __ STA T4 + 0 
560e : c8 __ __ INY
560f : b1 23 __ LDA (SP + 0),y 
5611 : 85 49 __ STA T4 + 1 
.l2:
5613 : a4 43 __ LDY T0 + 0 
5615 : b1 48 __ LDA (T4 + 0),y 
5617 : d0 4f __ BNE $5668 ; (vdcwin_put_string.s3 + 0)
.s4:
5619 : a0 04 __ LDY #$04
561b : b1 44 __ LDA (T1 + 0),y 
561d : 18 __ __ CLC
561e : 65 43 __ ADC T0 + 0 
5620 : 91 44 __ STA (T1 + 0),y 
5622 : a0 02 __ LDY #$02
5624 : d1 44 __ CMP (T1 + 0),y 
5626 : 90 34 __ BCC $565c ; (vdcwin_put_string.s1001 + 0)
.s43:
5628 : a9 00 __ LDA #$00
562a : a0 04 __ LDY #$04
562c : 91 44 __ STA (T1 + 0),y 
562e : c8 __ __ INY
562f : b1 44 __ LDA (T1 + 0),y 
5631 : 85 43 __ STA T0 + 0 
5633 : 18 __ __ CLC
5634 : 69 01 __ ADC #$01
5636 : 91 44 __ STA (T1 + 0),y 
5638 : a0 03 __ LDY #$03
563a : d1 44 __ CMP (T1 + 0),y 
563c : d0 1e __ BNE $565c ; (vdcwin_put_string.s1001 + 0)
.s46:
563e : a5 43 __ LDA T0 + 0 
5640 : a0 05 __ LDY #$05
5642 : 91 44 __ STA (T1 + 0),y 
5644 : a5 44 __ LDA T1 + 0 
5646 : a0 02 __ LDY #$02
5648 : 91 23 __ STA (SP + 0),y 
564a : a5 45 __ LDA T1 + 1 
564c : c8 __ __ INY
564d : 91 23 __ STA (SP + 0),y 
564f : a9 e1 __ LDA #$e1
5651 : c8 __ __ INY
5652 : 91 23 __ STA (SP + 0),y 
5654 : a9 50 __ LDA #$50
5656 : c8 __ __ INY
5657 : 91 23 __ STA (SP + 0),y 
5659 : 20 0a 53 JSR $530a ; (vdcwin_printline.s1000 + 0)
.s1001:
565c : 18 __ __ CLC
565d : a5 23 __ LDA SP + 0 
565f : 69 0a __ ADC #$0a
5661 : 85 23 __ STA SP + 0 
5663 : 90 02 __ BCC $5667 ; (vdcwin_put_string.s1001 + 11)
5665 : e6 24 __ INC SP + 1 
5667 : 60 __ __ RTS
.s3:
5668 : 4a __ __ LSR
5669 : 4a __ __ LSR
566a : 4a __ __ LSR
566b : 4a __ __ LSR
566c : 4a __ __ LSR
566d : aa __ __ TAX
566e : bd f6 50 LDA $50f6,x ; (p2smap + 0)
5671 : 51 48 __ EOR (T4 + 0),y 
5673 : 85 4e __ STA T7 + 0 
5675 : a5 47 __ LDA T3 + 0 
5677 : 18 __ __ CLC
5678 : a0 01 __ LDY #$01
567a : 71 44 __ ADC (T1 + 0),y 
567c : 0a __ __ ASL
567d : aa __ __ TAX
567e : 18 __ __ CLC
567f : 88 __ __ DEY
5680 : b1 44 __ LDA (T1 + 0),y 
5682 : 65 46 __ ADC T2 + 0 
5684 : 18 __ __ CLC
5685 : 65 43 __ ADC T0 + 0 
5687 : 18 __ __ CLC
5688 : 7d 37 5a ADC $5a37,x ; (multab + 0)
568b : 85 4a __ STA T5 + 0 
568d : 98 __ __ TYA
568e : 7d 38 5a ADC $5a38,x ; (multab + 1)
5691 : 85 4b __ STA T5 + 1 
5693 : a9 12 __ LDA #$12
5695 : 8d 00 d6 STA $d600 
5698 : 18 __ __ CLC
5699 : a5 4a __ LDA T5 + 0 
569b : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
569e : a8 __ __ TAY
569f : a5 4b __ LDA T5 + 1 
56a1 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
56a4 : ae 25 5a LDX $5a25 ; (vdc_state + 7)
.l188:
56a7 : 2c 00 d6 BIT $d600 
56aa : 10 fb __ BPL $56a7 ; (vdcwin_put_string.l188 + 0)
.s16:
56ac : 8d 01 d6 STA $d601 
56af : a9 13 __ LDA #$13
56b1 : 8d 00 d6 STA $d600 
.l190:
56b4 : 2c 00 d6 BIT $d600 
56b7 : 10 fb __ BPL $56b4 ; (vdcwin_put_string.l190 + 0)
.s21:
56b9 : 8c 01 d6 STY $d601 
56bc : a9 1f __ LDA #$1f
56be : 8d 00 d6 STA $d600 
.l192:
56c1 : 2c 00 d6 BIT $d600 
56c4 : 10 fb __ BPL $56c1 ; (vdcwin_put_string.l192 + 0)
.s25:
56c6 : a5 4e __ LDA T7 + 0 
56c8 : 8d 01 d6 STA $d601 
56cb : ad 28 5a LDA $5a28 ; (vdc_state + 10)
56ce : 18 __ __ CLC
56cf : 65 4a __ ADC T5 + 0 
56d1 : a8 __ __ TAY
56d2 : a9 12 __ LDA #$12
56d4 : 8d 00 d6 STA $d600 
56d7 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
56da : 65 4b __ ADC T5 + 1 
.l194:
56dc : 2c 00 d6 BIT $d600 
56df : 10 fb __ BPL $56dc ; (vdcwin_put_string.l194 + 0)
.s32:
56e1 : 8d 01 d6 STA $d601 
56e4 : a9 13 __ LDA #$13
56e6 : 8d 00 d6 STA $d600 
.l196:
56e9 : 2c 00 d6 BIT $d600 
56ec : 10 fb __ BPL $56e9 ; (vdcwin_put_string.l196 + 0)
.s37:
56ee : 8c 01 d6 STY $d601 
56f1 : a9 1f __ LDA #$1f
56f3 : 8d 00 d6 STA $d600 
.l198:
56f6 : 2c 00 d6 BIT $d600 
56f9 : 10 fb __ BPL $56f6 ; (vdcwin_put_string.l198 + 0)
.s41:
56fb : 8e 01 d6 STX $d601 
56fe : e6 43 __ INC T0 + 0 
5700 : 4c 13 56 JMP $5613 ; (vdcwin_put_string.l2 + 0)
--------------------------------------------------------------------
mul16by8: ; mul16by8
5703 : a0 00 __ LDY #$00
5705 : 84 06 __ STY WORK + 3 
5707 : 4a __ __ LSR
5708 : 90 0d __ BCC $5717 ; (mul16by8 + 20)
570a : aa __ __ TAX
570b : 18 __ __ CLC
570c : 98 __ __ TYA
570d : 65 1b __ ADC ACCU + 0 
570f : a8 __ __ TAY
5710 : a5 06 __ LDA WORK + 3 
5712 : 65 1c __ ADC ACCU + 1 
5714 : 85 06 __ STA WORK + 3 
5716 : 8a __ __ TXA
5717 : 06 1b __ ASL ACCU + 0 
5719 : 26 1c __ ROL ACCU + 1 
571b : 4a __ __ LSR
571c : b0 ec __ BCS $570a ; (mul16by8 + 7)
571e : d0 f7 __ BNE $5717 ; (mul16by8 + 20)
5720 : 84 05 __ STY WORK + 2 
5722 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
5723 : a0 00 __ LDY #$00
5725 : 84 06 __ STY WORK + 3 
5727 : a5 03 __ LDA WORK + 0 
5729 : a6 04 __ LDX WORK + 1 
572b : f0 1c __ BEQ $5749 ; (mul16 + 38)
572d : 38 __ __ SEC
572e : 6a __ __ ROR
572f : 90 0d __ BCC $573e ; (mul16 + 27)
5731 : aa __ __ TAX
5732 : 18 __ __ CLC
5733 : 98 __ __ TYA
5734 : 65 1b __ ADC ACCU + 0 
5736 : a8 __ __ TAY
5737 : a5 06 __ LDA WORK + 3 
5739 : 65 1c __ ADC ACCU + 1 
573b : 85 06 __ STA WORK + 3 
573d : 8a __ __ TXA
573e : 06 1b __ ASL ACCU + 0 
5740 : 26 1c __ ROL ACCU + 1 
5742 : 4a __ __ LSR
5743 : 90 f9 __ BCC $573e ; (mul16 + 27)
5745 : d0 ea __ BNE $5731 ; (mul16 + 14)
5747 : a5 04 __ LDA WORK + 1 
5749 : 4a __ __ LSR
574a : 90 0d __ BCC $5759 ; (mul16 + 54)
574c : aa __ __ TAX
574d : 18 __ __ CLC
574e : 98 __ __ TYA
574f : 65 1b __ ADC ACCU + 0 
5751 : a8 __ __ TAY
5752 : a5 06 __ LDA WORK + 3 
5754 : 65 1c __ ADC ACCU + 1 
5756 : 85 06 __ STA WORK + 3 
5758 : 8a __ __ TXA
5759 : 06 1b __ ASL ACCU + 0 
575b : 26 1c __ ROL ACCU + 1 
575d : 4a __ __ LSR
575e : b0 ec __ BCS $574c ; (mul16 + 41)
5760 : d0 f7 __ BNE $5759 ; (mul16 + 54)
5762 : 84 05 __ STY WORK + 2 
5764 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
5765 : a5 1c __ LDA ACCU + 1 
5767 : d0 31 __ BNE $579a ; (divmod + 53)
5769 : a5 04 __ LDA WORK + 1 
576b : d0 1e __ BNE $578b ; (divmod + 38)
576d : 85 06 __ STA WORK + 3 
576f : a2 04 __ LDX #$04
5771 : 06 1b __ ASL ACCU + 0 
5773 : 2a __ __ ROL
5774 : c5 03 __ CMP WORK + 0 
5776 : 90 02 __ BCC $577a ; (divmod + 21)
5778 : e5 03 __ SBC WORK + 0 
577a : 26 1b __ ROL ACCU + 0 
577c : 2a __ __ ROL
577d : c5 03 __ CMP WORK + 0 
577f : 90 02 __ BCC $5783 ; (divmod + 30)
5781 : e5 03 __ SBC WORK + 0 
5783 : 26 1b __ ROL ACCU + 0 
5785 : ca __ __ DEX
5786 : d0 eb __ BNE $5773 ; (divmod + 14)
5788 : 85 05 __ STA WORK + 2 
578a : 60 __ __ RTS
578b : a5 1b __ LDA ACCU + 0 
578d : 85 05 __ STA WORK + 2 
578f : a5 1c __ LDA ACCU + 1 
5791 : 85 06 __ STA WORK + 3 
5793 : a9 00 __ LDA #$00
5795 : 85 1b __ STA ACCU + 0 
5797 : 85 1c __ STA ACCU + 1 
5799 : 60 __ __ RTS
579a : a5 04 __ LDA WORK + 1 
579c : d0 1f __ BNE $57bd ; (divmod + 88)
579e : a5 03 __ LDA WORK + 0 
57a0 : 30 1b __ BMI $57bd ; (divmod + 88)
57a2 : a9 00 __ LDA #$00
57a4 : 85 06 __ STA WORK + 3 
57a6 : a2 10 __ LDX #$10
57a8 : 06 1b __ ASL ACCU + 0 
57aa : 26 1c __ ROL ACCU + 1 
57ac : 2a __ __ ROL
57ad : c5 03 __ CMP WORK + 0 
57af : 90 02 __ BCC $57b3 ; (divmod + 78)
57b1 : e5 03 __ SBC WORK + 0 
57b3 : 26 1b __ ROL ACCU + 0 
57b5 : 26 1c __ ROL ACCU + 1 
57b7 : ca __ __ DEX
57b8 : d0 f2 __ BNE $57ac ; (divmod + 71)
57ba : 85 05 __ STA WORK + 2 
57bc : 60 __ __ RTS
57bd : a9 00 __ LDA #$00
57bf : 85 05 __ STA WORK + 2 
57c1 : 85 06 __ STA WORK + 3 
57c3 : 84 02 __ STY $02 
57c5 : a0 10 __ LDY #$10
57c7 : 18 __ __ CLC
57c8 : 26 1b __ ROL ACCU + 0 
57ca : 26 1c __ ROL ACCU + 1 
57cc : 26 05 __ ROL WORK + 2 
57ce : 26 06 __ ROL WORK + 3 
57d0 : 38 __ __ SEC
57d1 : a5 05 __ LDA WORK + 2 
57d3 : e5 03 __ SBC WORK + 0 
57d5 : aa __ __ TAX
57d6 : a5 06 __ LDA WORK + 3 
57d8 : e5 04 __ SBC WORK + 1 
57da : 90 04 __ BCC $57e0 ; (divmod + 123)
57dc : 86 05 __ STX WORK + 2 
57de : 85 06 __ STA WORK + 3 
57e0 : 88 __ __ DEY
57e1 : d0 e5 __ BNE $57c8 ; (divmod + 99)
57e3 : 26 1b __ ROL ACCU + 0 
57e5 : 26 1c __ ROL ACCU + 1 
57e7 : a4 02 __ LDY $02 
57e9 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
57ea : 84 02 __ STY $02 
57ec : a0 20 __ LDY #$20
57ee : a9 00 __ LDA #$00
57f0 : 85 07 __ STA WORK + 4 
57f2 : 85 08 __ STA WORK + 5 
57f4 : 85 09 __ STA WORK + 6 
57f6 : 85 0a __ STA WORK + 7 
57f8 : a5 05 __ LDA WORK + 2 
57fa : 05 06 __ ORA WORK + 3 
57fc : d0 39 __ BNE $5837 ; (divmod32 + 77)
57fe : 18 __ __ CLC
57ff : 26 1b __ ROL ACCU + 0 
5801 : 26 1c __ ROL ACCU + 1 
5803 : 26 1d __ ROL ACCU + 2 
5805 : 26 1e __ ROL ACCU + 3 
5807 : 26 07 __ ROL WORK + 4 
5809 : 26 08 __ ROL WORK + 5 
580b : 90 0c __ BCC $5819 ; (divmod32 + 47)
580d : a5 07 __ LDA WORK + 4 
580f : e5 03 __ SBC WORK + 0 
5811 : aa __ __ TAX
5812 : a5 08 __ LDA WORK + 5 
5814 : e5 04 __ SBC WORK + 1 
5816 : 38 __ __ SEC
5817 : b0 0c __ BCS $5825 ; (divmod32 + 59)
5819 : 38 __ __ SEC
581a : a5 07 __ LDA WORK + 4 
581c : e5 03 __ SBC WORK + 0 
581e : aa __ __ TAX
581f : a5 08 __ LDA WORK + 5 
5821 : e5 04 __ SBC WORK + 1 
5823 : 90 04 __ BCC $5829 ; (divmod32 + 63)
5825 : 86 07 __ STX WORK + 4 
5827 : 85 08 __ STA WORK + 5 
5829 : 88 __ __ DEY
582a : d0 d3 __ BNE $57ff ; (divmod32 + 21)
582c : 26 1b __ ROL ACCU + 0 
582e : 26 1c __ ROL ACCU + 1 
5830 : 26 1d __ ROL ACCU + 2 
5832 : 26 1e __ ROL ACCU + 3 
5834 : a4 02 __ LDY $02 
5836 : 60 __ __ RTS
5837 : 18 __ __ CLC
5838 : 26 1b __ ROL ACCU + 0 
583a : 26 1c __ ROL ACCU + 1 
583c : 26 1d __ ROL ACCU + 2 
583e : 26 1e __ ROL ACCU + 3 
5840 : 26 07 __ ROL WORK + 4 
5842 : 26 08 __ ROL WORK + 5 
5844 : 26 09 __ ROL WORK + 6 
5846 : 26 0a __ ROL WORK + 7 
5848 : a5 07 __ LDA WORK + 4 
584a : c5 03 __ CMP WORK + 0 
584c : a5 08 __ LDA WORK + 5 
584e : e5 04 __ SBC WORK + 1 
5850 : a5 09 __ LDA WORK + 6 
5852 : e5 05 __ SBC WORK + 2 
5854 : a5 0a __ LDA WORK + 7 
5856 : e5 06 __ SBC WORK + 3 
5858 : 90 18 __ BCC $5872 ; (divmod32 + 136)
585a : a5 07 __ LDA WORK + 4 
585c : e5 03 __ SBC WORK + 0 
585e : 85 07 __ STA WORK + 4 
5860 : a5 08 __ LDA WORK + 5 
5862 : e5 04 __ SBC WORK + 1 
5864 : 85 08 __ STA WORK + 5 
5866 : a5 09 __ LDA WORK + 6 
5868 : e5 05 __ SBC WORK + 2 
586a : 85 09 __ STA WORK + 6 
586c : a5 0a __ LDA WORK + 7 
586e : e5 06 __ SBC WORK + 3 
5870 : 85 0a __ STA WORK + 7 
5872 : 88 __ __ DEY
5873 : d0 c3 __ BNE $5838 ; (divmod32 + 78)
5875 : 26 1b __ ROL ACCU + 0 
5877 : 26 1c __ ROL ACCU + 1 
5879 : 26 1d __ ROL ACCU + 2 
587b : 26 1e __ ROL ACCU + 3 
587d : a4 02 __ LDY $02 
587f : 60 __ __ RTS
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
5880 : a9 02 __ LDA #$02
5882 : 85 0d __ STA P0 
5884 : a9 00 __ LDA #$00
5886 : 85 0e __ STA P1 
5888 : a9 5b __ LDA #$5b
588a : 85 0f __ STA P2 
588c : 4c 33 4b JMP $4b33 ; (vdc_prints.s0 + 0)
--------------------------------------------------------------------
588f : __ __ __ BYT 7f 00 80 a0 4b 00 00 00 00 00 00 00 00 00 00 00 : ....K...........
--------------------------------------------------------------------
589f : __ __ __ BYT 42 4c 55 45 20 4a 41 59 00 00 00 00 00 00 00 43 : BLUE JAY.......C
58af : __ __ __ BYT 41 52 44 49 4e 41 4c 00 00 00 00 00 00 00 45 41 : ARDINAL.......EA
58bf : __ __ __ BYT 53 54 45 52 4e 20 50 48 4f 45 42 45 00 47 52 41 : STERN PHOEBE.GRA
58cf : __ __ __ BYT 43 4b 4c 45 00 00 00 00 00 00 00 00 53 41 4e 44 : CKLE........SAND
58df : __ __ __ BYT 48 49 4c 4c 20 43 52 41 4e 45 00                : HILL CRANE.
--------------------------------------------------------------------
vdc_modes:
5900 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
5910 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
5920 : __ __ __ BYT e7 24 7e ff 50 00 32 00 00 00 00 00 10 00 40 00 : .$~.P.2.......@.
5930 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
5940 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
5950 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
5960 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
5970 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
5980 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
5990 : __ __ __ BYT 50 00 32 00 00 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
59a0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
59b0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
59c0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
59d0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
59d8 : __ __ __ BYT 46 4c 49 45 53 00 4a 55 4d 50 53 00 53 4c 45 45 : FLIES.JUMPS.SLEE
59e8 : __ __ __ BYT 50 53 45 41 54 53 00 00 57 41 4c 4b 53 00       : PSEATS..WALKS.
--------------------------------------------------------------------
5a00 : __ __ __ BYT 42 49 47 00 00 00 53 4d 41 4c 4c 00 41 4e 47 52 : BIG...SMALL.ANGR
5a10 : __ __ __ BYT 59 00 57 45 54 00 00 00 48 41 50 50 59 00       : Y.WET...HAPPY.
--------------------------------------------------------------------
vdc_state:
5a1e : __ __ __ BSS	25
--------------------------------------------------------------------
multab:
5a37 : __ __ __ BSS	144
--------------------------------------------------------------------
linebuffer:
5b00 : __ __ __ BSS	81
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1300 : ad 2e 5a LDA $5a2e ; (vdc_state + 16)
01:1303 : 85 0d __ STA P0 
01:1305 : ad 2f 5a LDA $5a2f ; (vdc_state + 17)
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
01:1392 : 20 de 45 JSR $45de ; (krnio_setbnk.s0 + 0)
01:1395 : a5 12 __ LDA P5 ; (fname + 0)
01:1397 : 85 0d __ STA P0 
01:1399 : a5 13 __ LDA P6 ; (fname + 1)
01:139b : 85 0e __ STA P1 
01:139d : 20 e6 45 JSR $45e6 ; (krnio_setnam.s0 + 0)
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
01:143c : a9 5b __ LDA #$5b
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
01:14bd : a9 00 __ LDA #$00
01:14bf : 85 0d __ STA P0 
01:14c1 : a9 5b __ LDA #$5b
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
01:14ed : a9 00 __ LDA #$00
01:14ef : 85 10 __ STA P3 
01:14f1 : a9 5b __ LDA #$5b
01:14f3 : 85 11 __ STA P4 
01:14f5 : a5 57 __ LDA $57 
01:14f7 : 85 12 __ STA P5 
01:14f9 : a9 00 __ LDA #$00
01:14fb : 85 13 __ STA P6 
01:14fd : 4c d1 13 JMP $13d1 ; (bnk_cpytovdc.s0 + 0)
