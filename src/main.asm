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
1c13 : 8e ff 4f STX $4fff ; (spentry + 0)
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
1ddb : 4c 0e 3e JMP $3e0e ; (main.s101 + 0)
.s30:
1dde : 24 d7 __ BIT $d7 
1de0 : 30 17 __ BMI $1df9 ; (main.s11400 + 0)
.s178:
1de2 : a9 46 __ LDA #$46
1de4 : a0 02 __ LDY #$02
1de6 : 91 23 __ STA (SP + 0),y 
1de8 : a9 45 __ LDA #$45
1dea : c8 __ __ INY
1deb : 91 23 __ STA (SP + 0),y 
1ded : 20 e9 3e JSR $3ee9 ; (printf.s1000 + 0)
1df0 : 20 71 45 JSR $4571 ; (getch.s0 + 0)
1df3 : 20 b0 45 JSR $45b0 ; (clrscr.s0 + 0)
1df6 : 20 b4 45 JSR $45b4 ; (screen_setmode.s0 + 0)
.s11400:
1df9 : a5 ba __ LDA $ba 
1dfb : d0 02 __ BNE $1dff ; (main.s186 + 0)
.s184:
1dfd : a9 08 __ LDA #$08
.s186:
1dff : 85 53 __ STA T0 + 0 
1e01 : 85 f7 __ STA $f7 ; (bootdevice + 0)
1e03 : a9 bc __ LDA #$bc
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
1e18 : 20 e9 3e JSR $3ee9 ; (printf.s1000 + 0)
1e1b : a9 06 __ LDA #$06
1e1d : 8d 06 d5 STA $d506 
1e20 : a9 cc __ LDA #$cc
1e22 : a0 02 __ LDY #$02
1e24 : 91 23 __ STA (SP + 0),y 
1e26 : a9 45 __ LDA #$45
1e28 : c8 __ __ INY
1e29 : 91 23 __ STA (SP + 0),y 
1e2b : 20 e9 3e JSR $3ee9 ; (printf.s1000 + 0)
1e2e : a9 00 __ LDA #$00
1e30 : 85 0d __ STA P0 
1e32 : 85 0e __ STA P1 
1e34 : 20 eb 45 JSR $45eb ; (krnio_setbnk.s0 + 0)
1e37 : a9 e6 __ LDA #$e6
1e39 : 85 0d __ STA P0 
1e3b : a9 45 __ LDA #$45
1e3d : 85 0e __ STA P1 
1e3f : 20 f3 45 JSR $45f3 ; (krnio_setnam.s0 + 0)
1e42 : a9 01 __ LDA #$01
1e44 : 85 0d __ STA P0 
1e46 : 85 0f __ STA P2 
1e48 : a5 53 __ LDA T0 + 0 
1e4a : 85 0e __ STA P1 
1e4c : 20 09 46 JSR $4609 ; (krnio_load.s0 + 0)
1e4f : 09 00 __ ORA #$00
1e51 : d0 11 __ BNE $1e64 ; (main.s193 + 0)
.s189:
1e53 : a9 26 __ LDA #$26
1e55 : a0 02 __ LDY #$02
1e57 : 91 23 __ STA (SP + 0),y 
1e59 : a9 46 __ LDA #$46
1e5b : c8 __ __ INY
1e5c : 91 23 __ STA (SP + 0),y 
1e5e : 20 e9 3e JSR $3ee9 ; (printf.s1000 + 0)
1e61 : 20 44 46 JSR $4644 ; (exit@proxy + 0)
.s193:
1e64 : a9 01 __ LDA #$01
1e66 : 8d 30 d0 STA $d030 
1e69 : a9 00 __ LDA #$00
1e6b : 85 13 __ STA P6 
1e6d : ad 11 d0 LDA $d011 
1e70 : 29 6f __ AND #$6f
1e72 : 8d 11 d0 STA $d011 
1e75 : 20 61 46 JSR $4661 ; (vdc_set_mode.s1000 + 0)
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
1f82 : 4c 33 3d JMP $3d33 ; (main.s299 + 0)
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
1f9d : a9 61 __ LDA #$61
1f9f : 85 0e __ STA P1 
1fa1 : a9 4c __ LDA #$4c
1fa3 : 85 0f __ STA P2 
1fa5 : 20 40 4b JSR $4b40 ; (vdc_prints.s0 + 0)
1fa8 : a9 00 __ LDA #$00
1faa : a0 02 __ LDY #$02
1fac : 91 23 __ STA (SP + 0),y 
1fae : a9 5b __ LDA #$5b
1fb0 : c8 __ __ INY
1fb1 : 91 23 __ STA (SP + 0),y 
1fb3 : a9 a2 __ LDA #$a2
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
1fcf : a2 da __ LDX #$da
1fd1 : 4c d8 1f JMP $1fd8 ; (main.s5939 + 0)
.s5937:
1fd4 : a9 4f __ LDA #$4f
1fd6 : a2 d7 __ LDX #$d7
.s5939:
1fd8 : 85 58 __ STA T3 + 1 
1fda : 8a __ __ TXA
1fdb : a0 08 __ LDY #$08
1fdd : 91 23 __ STA (SP + 0),y 
1fdf : a5 58 __ LDA T3 + 1 
1fe1 : c8 __ __ INY
1fe2 : 91 23 __ STA (SP + 0),y 
1fe4 : 20 7c 4c JSR $4c7c ; (sprintf.s1000 + 0)
1fe7 : 20 80 58 JSR $5880 ; (vdc_prints@proxy + 0)
1fea : a9 04 __ LDA #$04
1fec : 85 0d __ STA P0 
1fee : a9 de __ LDA #$de
1ff0 : 85 0e __ STA P1 
1ff2 : a9 4f __ LDA #$4f
1ff4 : 85 0f __ STA P2 
1ff6 : 20 40 4b JSR $4b40 ; (vdc_prints.s0 + 0)
1ff9 : e6 0d __ INC P0 
1ffb : a9 00 __ LDA #$00
1ffd : 85 0e __ STA P1 
1fff : a9 50 __ LDA #$50
2001 : 85 0f __ STA P2 
2003 : 20 40 4b JSR $4b40 ; (vdc_prints.s0 + 0)
2006 : a5 f7 __ LDA $f7 ; (bootdevice + 0)
2008 : 85 53 __ STA T0 + 0 
200a : 85 0f __ STA P2 
200c : a9 00 __ LDA #$00
200e : 85 10 __ STA P3 
2010 : a9 20 __ LDA #$20
2012 : 85 11 __ STA P4 
2014 : a9 ee __ LDA #$ee
2016 : 85 12 __ STA P5 
2018 : a9 4f __ LDA #$4f
201a : 85 13 __ STA P6 
201c : 20 8a 13 JSR $138a ; (bnk_load.s0 + 0)
201f : a5 1b __ LDA ACCU + 0 
2021 : d0 0a __ BNE $202d ; (main.s379 + 0)
.s377:
2023 : a9 06 __ LDA #$06
2025 : 85 0d __ STA P0 
2027 : 20 38 4b JSR $4b38 ; (vdc_prints@proxy + 0)
202a : 20 44 46 JSR $4644 ; (exit@proxy + 0)
.s379:
202d : a9 06 __ LDA #$06
202f : 85 0d __ STA P0 
2031 : a9 27 __ LDA #$27
2033 : 85 0e __ STA P1 
2035 : a9 50 __ LDA #$50
2037 : 85 0f __ STA P2 
2039 : 20 40 4b JSR $4b40 ; (vdc_prints.s0 + 0)
203c : a5 53 __ LDA T0 + 0 
203e : 85 0f __ STA P2 
2040 : a9 00 __ LDA #$00
2042 : 85 56 __ STA T2 + 0 
2044 : 85 10 __ STA P3 
2046 : a9 80 __ LDA #$80
2048 : 85 11 __ STA P4 
204a : a9 f6 __ LDA #$f6
204c : 85 12 __ STA P5 
204e : a9 4f __ LDA #$4f
2050 : 85 13 __ STA P6 
2052 : 20 8a 13 JSR $138a ; (bnk_load.s0 + 0)
2055 : a5 1b __ LDA ACCU + 0 
2057 : d0 0a __ BNE $2063 ; (main.s8761 + 0)
.s380:
2059 : a9 07 __ LDA #$07
205b : 85 0d __ STA P0 
205d : 20 38 4b JSR $4b38 ; (vdc_prints@proxy + 0)
2060 : 20 44 46 JSR $4644 ; (exit@proxy + 0)
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
20be : 20 61 46 JSR $4661 ; (vdc_set_mode.s1000 + 0)
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
2152 : 4c 4f 3c JMP $3c4f ; (main.l408 + 0)
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
2276 : 20 71 45 JSR $4571 ; (getch.s0 + 0)
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
2290 : 4c 86 3b JMP $3b86 ; (main.l548 + 0)
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
22bd : 4c d3 3a JMP $3ad3 ; (main.l600 + 0)
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
22ed : 4c 43 3a JMP $3a43 ; (main.s653 + 0)
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
232c : 4c 7e 39 JMP $397e ; (main.s701 + 0)
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
2350 : 4c a3 38 JMP $38a3 ; (main.s753 + 0)
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
238a : 20 61 46 JSR $4661 ; (vdc_set_mode.s1000 + 0)
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
23a5 : 20 61 46 JSR $4661 ; (vdc_set_mode.s1000 + 0)
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
248b : a9 44 __ LDA #$44
248d : 85 0e __ STA P1 
248f : a9 50 __ LDA #$50
2491 : 85 0f __ STA P2 
2493 : 20 40 4b JSR $4b40 ; (vdc_prints.s0 + 0)
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
24aa : a9 55 __ LDA #$55
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
24e0 : a2 95 __ LDX #$95
24e2 : 4c e9 24 JMP $24e9 ; (main.s5948 + 0)
.s5946:
24e5 : a9 50 __ LDA #$50
24e7 : a2 91 __ LDX #$91
.s5948:
24e9 : 85 5e __ STA T6 + 1 
24eb : 8a __ __ TXA
24ec : a0 0c __ LDY #$0c
24ee : 91 23 __ STA (SP + 0),y 
24f0 : a5 5e __ LDA T6 + 1 
24f2 : c8 __ __ INY
24f3 : 91 23 __ STA (SP + 0),y 
24f5 : 20 7c 4c JSR $4c7c ; (sprintf.s1000 + 0)
24f8 : 20 80 58 JSR $5880 ; (vdc_prints@proxy + 0)
24fb : e6 0d __ INC P0 
24fd : a9 99 __ LDA #$99
24ff : 85 0e __ STA P1 
2501 : a9 50 __ LDA #$50
2503 : 85 0f __ STA P2 
2505 : 20 40 4b JSR $4b40 ; (vdc_prints.s0 + 0)
2508 : a6 5b __ LDX T5 + 0 
250a : ca __ __ DEX
250b : 86 0d __ STX P0 
250d : a9 00 __ LDA #$00
250f : 85 0e __ STA P1 
2511 : a9 51 __ LDA #$51
2513 : 85 0f __ STA P2 
2515 : 20 40 4b JSR $4b40 ; (vdc_prints.s0 + 0)
2518 : ad 3f 5a LDA $5a3f ; (multab + 8)
251b : aa __ __ TAX
251c : 18 __ __ CLC
251d : 69 04 __ ADC #$04
251f : a8 __ __ TAY
2520 : a9 12 __ LDA #$12
2522 : 8d 00 d6 STA $d600 
2525 : ad 40 5a LDA $5a40 ; (multab + 9)
2528 : 85 55 __ STA T1 + 1 
252a : 69 00 __ ADC #$00
252c : 85 5e __ STA T6 + 1 
252e : 98 __ __ TYA
252f : 18 __ __ CLC
2530 : 65 57 __ ADC T3 + 0 
2532 : 85 5f __ STA T7 + 0 
2534 : a5 5e __ LDA T6 + 1 
2536 : 65 58 __ ADC T3 + 1 
.l11434:
2538 : 2c 00 d6 BIT $d600 
253b : 10 fb __ BPL $2538 ; (main.l11434 + 0)
.s926:
253d : 8d 01 d6 STA $d601 
2540 : a9 13 __ LDA #$13
2542 : 8d 00 d6 STA $d600 
.l11436:
2545 : 2c 00 d6 BIT $d600 
2548 : 10 fb __ BPL $2545 ; (main.l11436 + 0)
.s931:
254a : a5 5f __ LDA T7 + 0 
254c : 8d 01 d6 STA $d601 
254f : a9 1f __ LDA #$1f
2551 : 8d 00 d6 STA $d600 
.l11438:
2554 : 2c 00 d6 BIT $d600 
2557 : 10 fb __ BPL $2554 ; (main.l11438 + 0)
.s935:
2559 : a9 6c __ LDA #$6c
255b : 8d 01 d6 STA $d601 
255e : a9 12 __ LDA #$12
2560 : 8d 00 d6 STA $d600 
2563 : 98 __ __ TYA
2564 : 18 __ __ CLC
2565 : 65 59 __ ADC T4 + 0 
2567 : a8 __ __ TAY
2568 : a5 5e __ LDA T6 + 1 
256a : 65 5a __ ADC T4 + 1 
.l11440:
256c : 2c 00 d6 BIT $d600 
256f : 10 fb __ BPL $256c ; (main.l11440 + 0)
.s942:
2571 : 8d 01 d6 STA $d601 
2574 : a9 13 __ LDA #$13
2576 : 8d 00 d6 STA $d600 
.l11442:
2579 : 2c 00 d6 BIT $d600 
257c : 10 fb __ BPL $2579 ; (main.l11442 + 0)
.s947:
257e : 8c 01 d6 STY $d601 
2581 : a9 1f __ LDA #$1f
2583 : 8d 00 d6 STA $d600 
.l11444:
2586 : 2c 00 d6 BIT $d600 
2589 : 10 fb __ BPL $2586 ; (main.l11444 + 0)
.s951:
258b : a9 09 __ LDA #$09
258d : 8d 01 d6 STA $d601 
2590 : a9 12 __ LDA #$12
2592 : 8d 00 d6 STA $d600 
2595 : 8a __ __ TXA
2596 : 18 __ __ CLC
2597 : 69 05 __ ADC #$05
2599 : a8 __ __ TAY
259a : a5 55 __ LDA T1 + 1 
259c : 69 00 __ ADC #$00
259e : 85 5e __ STA T6 + 1 
25a0 : 98 __ __ TYA
25a1 : 18 __ __ CLC
25a2 : 65 57 __ ADC T3 + 0 
25a4 : 85 5f __ STA T7 + 0 
25a6 : a5 5e __ LDA T6 + 1 
25a8 : 65 58 __ ADC T3 + 1 
.l11446:
25aa : 2c 00 d6 BIT $d600 
25ad : 10 fb __ BPL $25aa ; (main.l11446 + 0)
.s961:
25af : 8d 01 d6 STA $d601 
25b2 : a9 13 __ LDA #$13
25b4 : 8d 00 d6 STA $d600 
.l11448:
25b7 : 2c 00 d6 BIT $d600 
25ba : 10 fb __ BPL $25b7 ; (main.l11448 + 0)
.s966:
25bc : a5 5f __ LDA T7 + 0 
25be : 8d 01 d6 STA $d601 
25c1 : a9 1f __ LDA #$1f
25c3 : 8d 00 d6 STA $d600 
.l11450:
25c6 : 2c 00 d6 BIT $d600 
25c9 : 10 fb __ BPL $25c6 ; (main.l11450 + 0)
.s970:
25cb : a9 62 __ LDA #$62
25cd : 8d 01 d6 STA $d601 
25d0 : a9 18 __ LDA #$18
25d2 : 8d 00 d6 STA $d600 
.l11452:
25d5 : 2c 00 d6 BIT $d600 
25d8 : 10 fb __ BPL $25d5 ; (main.l11452 + 0)
.s976:
25da : ad 01 d6 LDA $d601 
25dd : 29 7f __ AND #$7f
25df : 85 5f __ STA T7 + 0 
25e1 : a9 18 __ LDA #$18
25e3 : 8d 00 d6 STA $d600 
.l11454:
25e6 : 2c 00 d6 BIT $d600 
25e9 : 10 fb __ BPL $25e6 ; (main.l11454 + 0)
.s982:
25eb : a5 5f __ LDA T7 + 0 
25ed : 8d 01 d6 STA $d601 
25f0 : a9 1e __ LDA #$1e
25f2 : 8d 00 d6 STA $d600 
.l11456:
25f5 : 2c 00 d6 BIT $d600 
25f8 : 10 fb __ BPL $25f5 ; (main.l11456 + 0)
.s987:
25fa : a9 45 __ LDA #$45
25fc : 8d 01 d6 STA $d601 
25ff : a9 12 __ LDA #$12
2601 : 8d 00 d6 STA $d600 
2604 : 98 __ __ TYA
2605 : 18 __ __ CLC
2606 : 65 59 __ ADC T4 + 0 
2608 : a8 __ __ TAY
2609 : a5 5e __ LDA T6 + 1 
260b : 65 5a __ ADC T4 + 1 
.l11458:
260d : 2c 00 d6 BIT $d600 
2610 : 10 fb __ BPL $260d ; (main.l11458 + 0)
.s994:
2612 : 8d 01 d6 STA $d601 
2615 : a9 13 __ LDA #$13
2617 : 8d 00 d6 STA $d600 
.l11460:
261a : 2c 00 d6 BIT $d600 
261d : 10 fb __ BPL $261a ; (main.l11460 + 0)
.s999:
261f : 8c 01 d6 STY $d601 
2622 : a9 1f __ LDA #$1f
2624 : 8d 00 d6 STA $d600 
.l11462:
2627 : 2c 00 d6 BIT $d600 
262a : 10 fb __ BPL $2627 ; (main.l11462 + 0)
.s1003:
262c : a9 09 __ LDA #$09
262e : 8d 01 d6 STA $d601 
2631 : a9 18 __ LDA #$18
2633 : 8d 00 d6 STA $d600 
.l11464:
2636 : 2c 00 d6 BIT $d600 
2639 : 10 fb __ BPL $2636 ; (main.l11464 + 0)
.s1009:
263b : ad 01 d6 LDA $d601 
263e : 29 7f __ AND #$7f
2640 : a8 __ __ TAY
2641 : a9 18 __ LDA #$18
2643 : 8d 00 d6 STA $d600 
.l11466:
2646 : 2c 00 d6 BIT $d600 
2649 : 10 fb __ BPL $2646 ; (main.l11466 + 0)
.s1015:
264b : 8c 01 d6 STY $d601 
264e : a9 1e __ LDA #$1e
2650 : 8d 00 d6 STA $d600 
.l11468:
2653 : 2c 00 d6 BIT $d600 
2656 : 10 fb __ BPL $2653 ; (main.l11468 + 0)
.s1020:
2658 : a9 45 __ LDA #$45
265a : 8d 01 d6 STA $d601 
265d : a9 12 __ LDA #$12
265f : 8d 00 d6 STA $d600 
2662 : 8a __ __ TXA
2663 : 18 __ __ CLC
2664 : 69 4b __ ADC #$4b
2666 : aa __ __ TAX
2667 : 90 02 __ BCC $266b ; (main.s1727 + 0)
.s1726:
2669 : e6 55 __ INC T1 + 1 
.s1727:
266b : 18 __ __ CLC
266c : 65 57 __ ADC T3 + 0 
266e : a8 __ __ TAY
266f : a5 55 __ LDA T1 + 1 
2671 : 65 58 __ ADC T3 + 1 
.l11470:
2673 : 2c 00 d6 BIT $d600 
2676 : 10 fb __ BPL $2673 ; (main.l11470 + 0)
.s1030:
2678 : 8d 01 d6 STA $d601 
267b : a9 13 __ LDA #$13
267d : 8d 00 d6 STA $d600 
.l11472:
2680 : 2c 00 d6 BIT $d600 
2683 : 10 fb __ BPL $2680 ; (main.l11472 + 0)
.s1035:
2685 : 8c 01 d6 STY $d601 
2688 : a9 1f __ LDA #$1f
268a : 8d 00 d6 STA $d600 
.l11474:
268d : 2c 00 d6 BIT $d600 
2690 : 10 fb __ BPL $268d ; (main.l11474 + 0)
.s1039:
2692 : a9 7b __ LDA #$7b
2694 : 8d 01 d6 STA $d601 
2697 : a9 12 __ LDA #$12
2699 : 8d 00 d6 STA $d600 
269c : 8a __ __ TXA
269d : 18 __ __ CLC
269e : 65 59 __ ADC T4 + 0 
26a0 : aa __ __ TAX
26a1 : a5 55 __ LDA T1 + 1 
26a3 : 65 5a __ ADC T4 + 1 
.l11476:
26a5 : 2c 00 d6 BIT $d600 
26a8 : 10 fb __ BPL $26a5 ; (main.l11476 + 0)
.s1046:
26aa : 8d 01 d6 STA $d601 
26ad : a9 13 __ LDA #$13
26af : 8d 00 d6 STA $d600 
.l11478:
26b2 : 2c 00 d6 BIT $d600 
26b5 : 10 fb __ BPL $26b2 ; (main.l11478 + 0)
.s1051:
26b7 : 8e 01 d6 STX $d601 
26ba : a9 1f __ LDA #$1f
26bc : 8d 00 d6 STA $d600 
.l11480:
26bf : 2c 00 d6 BIT $d600 
26c2 : 10 fb __ BPL $26bf ; (main.l11480 + 0)
.s1055:
26c4 : a9 09 __ LDA #$09
26c6 : 8d 01 d6 STA $d601 
26c9 : 38 __ __ SEC
26ca : a5 5b __ LDA T5 + 0 
26cc : e9 07 __ SBC #$07
26ce : 85 54 __ STA T1 + 0 
26d0 : a0 05 __ LDY #$05
.l1057:
26d2 : 18 __ __ CLC
26d3 : a5 54 __ LDA T1 + 0 
26d5 : 69 05 __ ADC #$05
26d7 : 90 03 __ BCC $26dc ; (main.s1352 + 0)
26d9 : 4c 23 38 JMP $3823 ; (main.s1058 + 0)
.s1352:
26dc : 85 57 __ STA T3 + 0 
26de : c4 57 __ CPY T3 + 0 
26e0 : b0 03 __ BCS $26e5 ; (main.s1056 + 0)
26e2 : 4c 23 38 JMP $3823 ; (main.s1058 + 0)
.s1056:
26e5 : ad 23 5a LDA $5a23 ; (vdc_state + 5)
26e8 : e9 07 __ SBC #$07
26ea : 85 54 __ STA T1 + 0 
26ec : a0 05 __ LDY #$05
.l1097:
26ee : 18 __ __ CLC
26ef : a5 54 __ LDA T1 + 0 
26f1 : 69 05 __ ADC #$05
26f3 : 90 03 __ BCC $26f8 ; (main.s1338 + 0)
26f5 : 4c a3 37 JMP $37a3 ; (main.s1098 + 0)
.s1338:
26f8 : 85 59 __ STA T4 + 0 
26fa : c4 59 __ CPY T4 + 0 
26fc : b0 03 __ BCS $2701 ; (main.s1096 + 0)
26fe : 4c a3 37 JMP $37a3 ; (main.s1098 + 0)
.s1096:
2701 : ad 23 5a LDA $5a23 ; (vdc_state + 5)
2704 : aa __ __ TAX
2705 : e9 02 __ SBC #$02
2707 : 0a __ __ ASL
2708 : a8 __ __ TAY
2709 : b9 37 5a LDA $5a37,y ; (multab + 0)
270c : 85 59 __ STA T4 + 0 
270e : 18 __ __ CLC
270f : 69 04 __ ADC #$04
2711 : 85 5b __ STA T5 + 0 
2713 : a9 12 __ LDA #$12
2715 : 8d 00 d6 STA $d600 
2718 : b9 38 5a LDA $5a38,y ; (multab + 1)
271b : a8 __ __ TAY
271c : 69 00 __ ADC #$00
271e : 85 5c __ STA T5 + 1 
2720 : 18 __ __ CLC
2721 : a5 5b __ LDA T5 + 0 
2723 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
2726 : 85 5d __ STA T6 + 0 
2728 : a5 5c __ LDA T5 + 1 
272a : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11508:
272d : 2c 00 d6 BIT $d600 
2730 : 10 fb __ BPL $272d ; (main.l11508 + 0)
.s1145:
2732 : 8d 01 d6 STA $d601 
2735 : a9 13 __ LDA #$13
2737 : 8d 00 d6 STA $d600 
.l11510:
273a : 2c 00 d6 BIT $d600 
273d : 10 fb __ BPL $273a ; (main.l11510 + 0)
.s1150:
273f : a5 5d __ LDA T6 + 0 
2741 : 8d 01 d6 STA $d601 
2744 : a9 1f __ LDA #$1f
2746 : 8d 00 d6 STA $d600 
.l11512:
2749 : 2c 00 d6 BIT $d600 
274c : 10 fb __ BPL $2749 ; (main.l11512 + 0)
.s1154:
274e : a9 7c __ LDA #$7c
2750 : 8d 01 d6 STA $d601 
2753 : a9 12 __ LDA #$12
2755 : 8d 00 d6 STA $d600 
2758 : 18 __ __ CLC
2759 : a5 5b __ LDA T5 + 0 
275b : 6d 28 5a ADC $5a28 ; (vdc_state + 10)
275e : 85 5b __ STA T5 + 0 
2760 : a5 5c __ LDA T5 + 1 
2762 : 6d 29 5a ADC $5a29 ; (vdc_state + 11)
.l11514:
2765 : 2c 00 d6 BIT $d600 
2768 : 10 fb __ BPL $2765 ; (main.l11514 + 0)
.s1161:
276a : 8d 01 d6 STA $d601 
276d : a9 13 __ LDA #$13
276f : 8d 00 d6 STA $d600 
.l11516:
2772 : 2c 00 d6 BIT $d600 
2775 : 10 fb __ BPL $2772 ; (main.l11516 + 0)
.s1166:
2777 : a5 5b __ LDA T5 + 0 
2779 : 8d 01 d6 STA $d601 
277c : a9 1f __ LDA #$1f
277e : 8d 00 d6 STA $d600 
.l11518:
2781 : 2c 00 d6 BIT $d600 
2784 : 10 fb __ BPL $2781 ; (main.l11518 + 0)
.s1170:
2786 : a9 09 __ LDA #$09
2788 : 8d 01 d6 STA $d601 
278b : a9 12 __ LDA #$12
278d : 8d 00 d6 STA $d600 
2790 : 18 __ __ CLC
2791 : a5 59 __ LDA T4 + 0 
2793 : 69 05 __ ADC #$05
2795 : 85 5b __ STA T5 + 0 
2797 : 98 __ __ TYA
2798 : 69 00 __ ADC #$00
279a : 85 5c __ STA T5 + 1 
279c : 18 __ __ CLC
279d : a5 5b __ LDA T5 + 0 
279f : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
27a2 : 85 5f __ STA T7 + 0 
27a4 : a5 5c __ LDA T5 + 1 
27a6 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11520:
27a9 : 2c 00 d6 BIT $d600 
27ac : 10 fb __ BPL $27a9 ; (main.l11520 + 0)
.s1180:
27ae : 8d 01 d6 STA $d601 
27b1 : a9 13 __ LDA #$13
27b3 : 8d 00 d6 STA $d600 
.l11522:
27b6 : 2c 00 d6 BIT $d600 
27b9 : 10 fb __ BPL $27b6 ; (main.l11522 + 0)
.s1185:
27bb : a5 5f __ LDA T7 + 0 
27bd : 8d 01 d6 STA $d601 
27c0 : a9 1f __ LDA #$1f
27c2 : 8d 00 d6 STA $d600 
.l11524:
27c5 : 2c 00 d6 BIT $d600 
27c8 : 10 fb __ BPL $27c5 ; (main.l11524 + 0)
.s1189:
27ca : a9 e2 __ LDA #$e2
27cc : 8d 01 d6 STA $d601 
27cf : a9 18 __ LDA #$18
27d1 : 8d 00 d6 STA $d600 
.l11526:
27d4 : 2c 00 d6 BIT $d600 
27d7 : 10 fb __ BPL $27d4 ; (main.l11526 + 0)
.s1195:
27d9 : ad 01 d6 LDA $d601 
27dc : 29 7f __ AND #$7f
27de : 85 5f __ STA T7 + 0 
27e0 : a9 18 __ LDA #$18
27e2 : 8d 00 d6 STA $d600 
.l11528:
27e5 : 2c 00 d6 BIT $d600 
27e8 : 10 fb __ BPL $27e5 ; (main.l11528 + 0)
.s1201:
27ea : a5 5f __ LDA T7 + 0 
27ec : 8d 01 d6 STA $d601 
27ef : a9 1e __ LDA #$1e
27f1 : 8d 00 d6 STA $d600 
.l11530:
27f4 : 2c 00 d6 BIT $d600 
27f7 : 10 fb __ BPL $27f4 ; (main.l11530 + 0)
.s1206:
27f9 : a9 45 __ LDA #$45
27fb : 8d 01 d6 STA $d601 
27fe : a9 12 __ LDA #$12
2800 : 8d 00 d6 STA $d600 
2803 : 18 __ __ CLC
2804 : a5 5b __ LDA T5 + 0 
2806 : 6d 28 5a ADC $5a28 ; (vdc_state + 10)
2809 : 85 5b __ STA T5 + 0 
280b : a5 5c __ LDA T5 + 1 
280d : 6d 29 5a ADC $5a29 ; (vdc_state + 11)
.l11532:
2810 : 2c 00 d6 BIT $d600 
2813 : 10 fb __ BPL $2810 ; (main.l11532 + 0)
.s1213:
2815 : 8d 01 d6 STA $d601 
2818 : a9 13 __ LDA #$13
281a : 8d 00 d6 STA $d600 
.l11534:
281d : 2c 00 d6 BIT $d600 
2820 : 10 fb __ BPL $281d ; (main.l11534 + 0)
.s1218:
2822 : a5 5b __ LDA T5 + 0 
2824 : 8d 01 d6 STA $d601 
2827 : a9 1f __ LDA #$1f
2829 : 8d 00 d6 STA $d600 
.l11536:
282c : 2c 00 d6 BIT $d600 
282f : 10 fb __ BPL $282c ; (main.l11536 + 0)
.s1222:
2831 : a9 09 __ LDA #$09
2833 : 8d 01 d6 STA $d601 
2836 : a9 18 __ LDA #$18
2838 : 8d 00 d6 STA $d600 
.l11538:
283b : 2c 00 d6 BIT $d600 
283e : 10 fb __ BPL $283b ; (main.l11538 + 0)
.s1228:
2840 : ad 01 d6 LDA $d601 
2843 : 29 7f __ AND #$7f
2845 : 85 5b __ STA T5 + 0 
2847 : a9 18 __ LDA #$18
2849 : 8d 00 d6 STA $d600 
.l11540:
284c : 2c 00 d6 BIT $d600 
284f : 10 fb __ BPL $284c ; (main.l11540 + 0)
.s1234:
2851 : a5 5b __ LDA T5 + 0 
2853 : 8d 01 d6 STA $d601 
2856 : a9 1e __ LDA #$1e
2858 : 8d 00 d6 STA $d600 
.l11542:
285b : 2c 00 d6 BIT $d600 
285e : 10 fb __ BPL $285b ; (main.l11542 + 0)
.s1239:
2860 : a9 45 __ LDA #$45
2862 : 8d 01 d6 STA $d601 
2865 : a9 12 __ LDA #$12
2867 : 8d 00 d6 STA $d600 
286a : 18 __ __ CLC
286b : a5 59 __ LDA T4 + 0 
286d : 69 4b __ ADC #$4b
286f : 85 59 __ STA T4 + 0 
2871 : 90 01 __ BCC $2874 ; (main.s1729 + 0)
.s1728:
2873 : c8 __ __ INY
.s1729:
2874 : 18 __ __ CLC
2875 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
2878 : 85 57 __ STA T3 + 0 
287a : 98 __ __ TYA
287b : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11544:
287e : 2c 00 d6 BIT $d600 
2881 : 10 fb __ BPL $287e ; (main.l11544 + 0)
.s1249:
2883 : 8d 01 d6 STA $d601 
2886 : a9 13 __ LDA #$13
2888 : 8d 00 d6 STA $d600 
.l11546:
288b : 2c 00 d6 BIT $d600 
288e : 10 fb __ BPL $288b ; (main.l11546 + 0)
.s1254:
2890 : a5 57 __ LDA T3 + 0 
2892 : 8d 01 d6 STA $d601 
2895 : a9 1f __ LDA #$1f
2897 : 8d 00 d6 STA $d600 
.l11548:
289a : 2c 00 d6 BIT $d600 
289d : 10 fb __ BPL $289a ; (main.l11548 + 0)
.s1258:
289f : a9 7e __ LDA #$7e
28a1 : 8d 01 d6 STA $d601 
28a4 : a9 12 __ LDA #$12
28a6 : 8d 00 d6 STA $d600 
28a9 : 18 __ __ CLC
28aa : a5 59 __ LDA T4 + 0 
28ac : 6d 28 5a ADC $5a28 ; (vdc_state + 10)
28af : 85 57 __ STA T3 + 0 
28b1 : 98 __ __ TYA
28b2 : 6d 29 5a ADC $5a29 ; (vdc_state + 11)
.l11550:
28b5 : 2c 00 d6 BIT $d600 
28b8 : 10 fb __ BPL $28b5 ; (main.l11550 + 0)
.s1265:
28ba : 8d 01 d6 STA $d601 
28bd : a9 13 __ LDA #$13
28bf : 8d 00 d6 STA $d600 
.l11552:
28c2 : 2c 00 d6 BIT $d600 
28c5 : 10 fb __ BPL $28c2 ; (main.l11552 + 0)
.s1270:
28c7 : a5 57 __ LDA T3 + 0 
28c9 : 8d 01 d6 STA $d601 
28cc : a9 1f __ LDA #$1f
28ce : 8d 00 d6 STA $d600 
.l11554:
28d1 : 2c 00 d6 BIT $d600 
28d4 : 10 fb __ BPL $28d1 ; (main.l11554 + 0)
.s1274:
28d6 : a9 09 __ LDA #$09
28d8 : 8d 01 d6 STA $d601 
28db : ad 08 dc LDA $dc08 
28de : 8d a0 58 STA $58a0 ; (seed + 0)
28e1 : a9 05 __ LDA #$05
28e3 : 85 0f __ STA P2 
28e5 : 85 10 __ STA P3 
28e7 : a9 46 __ LDA #$46
28e9 : 85 11 __ STA P4 
28eb : a9 00 __ LDA #$00
28ed : 8d a1 58 STA $58a1 ; (seed + 1)
28f0 : a9 4b __ LDA #$4b
28f2 : 85 0d __ STA P0 
28f4 : a9 bf __ LDA #$bf
28f6 : 85 0e __ STA P1 
28f8 : 8a __ __ TXA
28f9 : 38 __ __ SEC
28fa : e9 07 __ SBC #$07
28fc : 85 12 __ STA P5 
28fe : 20 44 51 JSR $5144 ; (vdcwin_init.s0 + 0)
2901 : a9 c8 __ LDA #$c8
2903 : 85 56 __ STA T2 + 0 
.l1277:
2905 : a9 00 __ LDA #$00
2907 : 85 16 __ STA P9 
2909 : a9 5b __ LDA #$5b
290b : 85 17 __ STA P10 
290d : ad a1 58 LDA $58a1 ; (seed + 1)
2910 : 4a __ __ LSR
2911 : ad a0 58 LDA $58a0 ; (seed + 0)
2914 : 6a __ __ ROR
2915 : aa __ __ TAX
2916 : a9 00 __ LDA #$00
2918 : 85 04 __ STA WORK + 1 
291a : 6a __ __ ROR
291b : 4d a0 58 EOR $58a0 ; (seed + 0)
291e : 85 59 __ STA T4 + 0 
2920 : 8a __ __ TXA
2921 : 4d a1 58 EOR $58a1 ; (seed + 1)
2924 : 85 5a __ STA T4 + 1 
2926 : 4a __ __ LSR
2927 : 45 59 __ EOR T4 + 0 
2929 : 8d a0 58 STA $58a0 ; (seed + 0)
292c : 85 1b __ STA ACCU + 0 
292e : 45 5a __ EOR T4 + 1 
2930 : 8d a1 58 STA $58a1 ; (seed + 1)
2933 : 85 1c __ STA ACCU + 1 
2935 : ad 25 5a LDA $5a25 ; (vdc_state + 7)
2938 : 29 f0 __ AND #$f0
293a : 85 5b __ STA T5 + 0 
293c : a9 0f __ LDA #$0f
293e : 85 03 __ STA WORK + 0 
2940 : 20 65 57 JSR $5765 ; (divmod + 0)
2943 : a5 05 __ LDA WORK + 2 
2945 : 38 __ __ SEC
2946 : 65 5b __ ADC T5 + 0 
2948 : 8d 25 5a STA $5a25 ; (vdc_state + 7)
294b : 20 ad 51 JSR $51ad ; (generateSentence.s1000 + 0)
294e : a9 00 __ LDA #$00
2950 : 85 61 __ STA T8 + 0 
2952 : 85 59 __ STA T4 + 0 
2954 : ad 00 5b LDA $5b00 ; (linebuffer + 0)
2957 : f0 0c __ BEQ $2965 ; (main.s1287 + 0)
.s1286:
2959 : a2 00 __ LDX #$00
.l1712:
295b : bd 01 5b LDA $5b01,x ; (linebuffer + 1)
295e : e8 __ __ INX
295f : 09 00 __ ORA #$00
2961 : d0 f8 __ BNE $295b ; (main.l1712 + 0)
.s1713:
2963 : 86 59 __ STX T4 + 0 
.s1287:
2965 : a5 59 __ LDA T4 + 0 
2967 : f0 30 __ BEQ $2999 ; (main.s1283 + 0)
.s2816:
2969 : ae 4d bf LDX $bf4d ; (window + 2)
296c : ca __ __ DEX
296d : 86 5b __ STX T5 + 0 
296f : a9 ff __ LDA #$ff
2971 : 85 5e __ STA T6 + 1 
2973 : 85 60 __ STA T7 + 1 
2975 : a9 00 __ LDA #$00
2977 : 85 43 __ STA T10 + 0 
.l1292:
2979 : a5 61 __ LDA T8 + 0 
297b : c5 59 __ CMP T4 + 0 
297d : b0 0d __ BCS $298c ; (main.s1295 + 0)
.l1297:
297f : 24 60 __ BIT T7 + 1 
2981 : 10 09 __ BPL $298c ; (main.s1295 + 0)
.s1296:
2983 : a5 43 __ LDA T10 + 0 
2985 : c9 50 __ CMP #$50
2987 : b0 03 __ BCS $298c ; (main.s1295 + 0)
2989 : 4c 80 37 JMP $3780 ; (main.s1294 + 0)
.s1295:
298c : a6 43 __ LDX T10 + 0 
298e : f0 03 __ BEQ $2993 ; (main.s1289 + 0)
2990 : 4c 1a 37 JMP $371a ; (main.s1307 + 0)
.s1289:
2993 : a5 61 __ LDA T8 + 0 
2995 : c5 59 __ CMP T4 + 0 
2997 : 90 e6 __ BCC $297f ; (main.l1297 + 0)
.s1283:
2999 : ad 4f bf LDA $bf4f ; (window + 4)
299c : f0 03 __ BEQ $29a1 ; (main.s8479 + 0)
299e : 4c 45 36 JMP $3645 ; (main.s1318 + 0)
.s8479:
29a1 : c6 56 __ DEC T2 + 0 
29a3 : f0 03 __ BEQ $29a8 ; (main.s1279 + 0)
29a5 : 4c 05 29 JMP $2905 ; (main.l1277 + 0)
.s1279:
29a8 : 20 71 45 JSR $4571 ; (getch.s0 + 0)
29ab : a9 7f __ LDA #$7f
29ad : 8d 2b bf STA $bf2b ; (viewport + 0)
29b0 : a9 50 __ LDA #$50
29b2 : 8d 2e bf STA $bf2e ; (viewport + 3)
29b5 : a9 00 __ LDA #$00
29b7 : 8d 2c bf STA $bf2c ; (viewport + 1)
29ba : 8d 2f bf STA $bf2f ; (viewport + 4)
29bd : 8d 31 bf STA $bf31 ; (viewport + 6)
29c0 : 8d 32 bf STA $bf32 ; (viewport + 7)
29c3 : 8d 33 bf STA $bf33 ; (viewport + 8)
29c6 : 8d 34 bf STA $bf34 ; (viewport + 9)
29c9 : 8d 35 bf STA $bf35 ; (viewport + 10)
29cc : a9 96 __ LDA #$96
29ce : 8d 30 bf STA $bf30 ; (viewport + 5)
29d1 : a9 05 __ LDA #$05
29d3 : 85 0f __ STA P2 
29d5 : 85 10 __ STA P3 
29d7 : a9 46 __ LDA #$46
29d9 : 85 11 __ STA P4 
29db : a9 20 __ LDA #$20
29dd : 8d 2d bf STA $bf2d ; (viewport + 2)
29e0 : a9 36 __ LDA #$36
29e2 : 85 0d __ STA P0 
29e4 : a9 bf __ LDA #$bf
29e6 : 85 0e __ STA P1 
29e8 : ad 23 5a LDA $5a23 ; (vdc_state + 5)
29eb : 38 __ __ SEC
29ec : e9 07 __ SBC #$07
29ee : 85 12 __ STA P5 
29f0 : 20 44 51 JSR $5144 ; (vdcwin_init.s0 + 0)
29f3 : ad 34 bf LDA $bf34 ; (viewport + 9)
29f6 : 85 1b __ STA ACCU + 0 
29f8 : ad 35 bf LDA $bf35 ; (viewport + 10)
29fb : 85 1c __ STA ACCU + 1 
29fd : ad 2e bf LDA $bf2e ; (viewport + 3)
2a00 : 85 03 __ STA WORK + 0 
2a02 : ad 2f bf LDA $bf2f ; (viewport + 4)
2a05 : 85 04 __ STA WORK + 1 
2a07 : 20 23 57 JSR $5723 ; (mul16 + 0)
2a0a : ad 2c bf LDA $bf2c ; (viewport + 1)
2a0d : 18 __ __ CLC
2a0e : 65 05 __ ADC WORK + 2 
2a10 : a8 __ __ TAY
2a11 : ad 2d bf LDA $bf2d ; (viewport + 2)
2a14 : 65 06 __ ADC WORK + 3 
2a16 : aa __ __ TAX
2a17 : 98 __ __ TYA
2a18 : 18 __ __ CLC
2a19 : 6d 32 bf ADC $bf32 ; (viewport + 7)
2a1c : 85 54 __ STA T1 + 0 
2a1e : 8a __ __ TXA
2a1f : 6d 33 bf ADC $bf33 ; (viewport + 8)
2a22 : ac 3d bf LDY $bf3d ; (viewport + 18)
2a25 : ae 3c bf LDX $bf3c ; (viewport + 17)
2a28 : 4c 4e 2a JMP $2a4e ; (main.l1368 + 0)
.s1369:
2a2b : 86 0d __ STX P0 
2a2d : 84 0e __ STY P1 
2a2f : 20 bb 13 JSR $13bb ; (bnk_cpytovdc@proxy + 0)
2a32 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2a35 : 18 __ __ CLC
2a36 : 65 0d __ ADC P0 
2a38 : aa __ __ TAX
2a39 : ad 22 5a LDA $5a22 ; (vdc_state + 4)
2a3c : 65 0e __ ADC P1 
2a3e : a8 __ __ TAY
2a3f : 18 __ __ CLC
2a40 : a5 54 __ LDA T1 + 0 
2a42 : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
2a45 : 85 54 __ STA T1 + 0 
2a47 : a5 55 __ LDA T1 + 1 
2a49 : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
2a4c : e6 56 __ INC T2 + 0 
.l1368:
2a4e : 85 55 __ STA T1 + 1 
2a50 : a5 56 __ LDA T2 + 0 
2a52 : cd 39 bf CMP $bf39 ; (viewport + 14)
2a55 : 90 d4 __ BCC $2a2b ; (main.s1369 + 0)
.s1371:
2a57 : ad 2e bf LDA $bf2e ; (viewport + 3)
2a5a : 85 03 __ STA WORK + 0 
2a5c : ad 2f bf LDA $bf2f ; (viewport + 4)
2a5f : 85 04 __ STA WORK + 1 
2a61 : ad 34 bf LDA $bf34 ; (viewport + 9)
2a64 : 85 1b __ STA ACCU + 0 
2a66 : ad 35 bf LDA $bf35 ; (viewport + 10)
2a69 : 85 1c __ STA ACCU + 1 
2a6b : 20 23 57 JSR $5723 ; (mul16 + 0)
2a6e : ad 2c bf LDA $bf2c ; (viewport + 1)
2a71 : 18 __ __ CLC
2a72 : 65 05 __ ADC WORK + 2 
2a74 : a8 __ __ TAY
2a75 : ad 2d bf LDA $bf2d ; (viewport + 2)
2a78 : 65 06 __ ADC WORK + 3 
2a7a : aa __ __ TAX
2a7b : 98 __ __ TYA
2a7c : 18 __ __ CLC
2a7d : 6d 32 bf ADC $bf32 ; (viewport + 7)
2a80 : 85 57 __ STA T3 + 0 
2a82 : 8a __ __ TXA
2a83 : 6d 33 bf ADC $bf33 ; (viewport + 8)
2a86 : 85 58 __ STA T3 + 1 
2a88 : ad 30 bf LDA $bf30 ; (viewport + 5)
2a8b : 85 1b __ STA ACCU + 0 
2a8d : ad 31 bf LDA $bf31 ; (viewport + 6)
2a90 : 85 1c __ STA ACCU + 1 
2a92 : ad 2e bf LDA $bf2e ; (viewport + 3)
2a95 : 85 03 __ STA WORK + 0 
2a97 : ad 2f bf LDA $bf2f ; (viewport + 4)
2a9a : 85 04 __ STA WORK + 1 
2a9c : 20 23 57 JSR $5723 ; (mul16 + 0)
2a9f : 18 __ __ CLC
2aa0 : a5 57 __ LDA T3 + 0 
2aa2 : 65 05 __ ADC WORK + 2 
2aa4 : aa __ __ TAX
2aa5 : a5 58 __ LDA T3 + 1 
2aa7 : 65 06 __ ADC WORK + 3 
2aa9 : a8 __ __ TAY
2aaa : 8a __ __ TXA
2aab : 18 __ __ CLC
2aac : 69 30 __ ADC #$30
2aae : 85 54 __ STA T1 + 0 
2ab0 : 90 01 __ BCC $2ab3 ; (main.s1731 + 0)
.s1730:
2ab2 : c8 __ __ INY
.s1731:
2ab3 : 84 55 __ STY T1 + 1 
2ab5 : a9 00 __ LDA #$00
2ab7 : 85 56 __ STA T2 + 0 
2ab9 : ac 3f bf LDY $bf3f ; (viewport + 20)
2abc : ae 3e bf LDX $bf3e ; (viewport + 19)
2abf : 4c e9 2a JMP $2ae9 ; (main.l1372 + 0)
.s1373:
2ac2 : 86 0d __ STX P0 
2ac4 : 84 0e __ STY P1 
2ac6 : 20 bb 13 JSR $13bb ; (bnk_cpytovdc@proxy + 0)
2ac9 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2acc : 18 __ __ CLC
2acd : 65 0d __ ADC P0 
2acf : aa __ __ TAX
2ad0 : ad 22 5a LDA $5a22 ; (vdc_state + 4)
2ad3 : 65 0e __ ADC P1 
2ad5 : a8 __ __ TAY
2ad6 : 18 __ __ CLC
2ad7 : a5 54 __ LDA T1 + 0 
2ad9 : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
2adc : 85 54 __ STA T1 + 0 
2ade : a5 55 __ LDA T1 + 1 
2ae0 : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
2ae3 : 85 55 __ STA T1 + 1 
2ae5 : e6 56 __ INC T2 + 0 
2ae7 : a5 56 __ LDA T2 + 0 
.l1372:
2ae9 : cd 39 bf CMP $bf39 ; (viewport + 14)
2aec : 90 d4 __ BCC $2ac2 ; (main.s1373 + 0)
.l1376:
2aee : 20 71 45 JSR $4571 ; (getch.s0 + 0)
2af1 : a9 00 __ LDA #$00
2af3 : 85 56 __ STA T2 + 0 
2af5 : a5 1b __ LDA ACCU + 0 
2af7 : 85 54 __ STA T1 + 0 
2af9 : c9 57 __ CMP #$57
2afb : f0 04 __ BEQ $2b01 ; (main.s1381 + 0)
.s1382:
2afd : c9 91 __ CMP #$91
2aff : d0 11 __ BNE $2b12 ; (main.s1380 + 0)
.s1381:
2b01 : ad 34 bf LDA $bf34 ; (viewport + 9)
2b04 : 0d 35 bf ORA $bf35 ; (viewport + 10)
2b07 : f0 09 __ BEQ $2b12 ; (main.s1380 + 0)
.s1378:
2b09 : a9 08 __ LDA #$08
2b0b : 85 56 __ STA T2 + 0 
2b0d : a5 1b __ LDA ACCU + 0 
2b0f : 4c 18 2b JMP $2b18 ; (main.s1387 + 0)
.s1380:
2b12 : a5 1b __ LDA ACCU + 0 
2b14 : c9 53 __ CMP #$53
2b16 : f0 04 __ BEQ $2b1c ; (main.s1386 + 0)
.s1387:
2b18 : c9 11 __ CMP #$11
2b1a : d0 2c __ BNE $2b48 ; (main.s1385 + 0)
.s1386:
2b1c : 38 __ __ SEC
2b1d : a9 96 __ LDA #$96
2b1f : ed 23 5a SBC $5a23 ; (vdc_state + 5)
2b22 : aa __ __ TAX
2b23 : a9 00 __ LDA #$00
2b25 : ed 24 5a SBC $5a24 ; (vdc_state + 6)
2b28 : a8 __ __ TAY
2b29 : 8a __ __ TXA
2b2a : 18 __ __ CLC
2b2b : 69 06 __ ADC #$06
2b2d : 85 57 __ STA T3 + 0 
2b2f : 90 01 __ BCC $2b32 ; (main.s1733 + 0)
.s1732:
2b31 : c8 __ __ INY
.s1733:
2b32 : 84 58 __ STY T3 + 1 
2b34 : ad 35 bf LDA $bf35 ; (viewport + 10)
2b37 : c5 58 __ CMP T3 + 1 
2b39 : d0 05 __ BNE $2b40 ; (main.s1237 + 0)
.s1236:
2b3b : ad 34 bf LDA $bf34 ; (viewport + 9)
2b3e : c5 57 __ CMP T3 + 0 
.s1237:
2b40 : b0 06 __ BCS $2b48 ; (main.s1385 + 0)
.s1383:
2b42 : a5 56 __ LDA T2 + 0 
2b44 : 09 04 __ ORA #$04
2b46 : 85 56 __ STA T2 + 0 
.s1385:
2b48 : a5 1b __ LDA ACCU + 0 
2b4a : c9 41 __ CMP #$41
2b4c : f0 04 __ BEQ $2b52 ; (main.s1391 + 0)
.s1392:
2b4e : c9 9d __ CMP #$9d
2b50 : d0 0e __ BNE $2b60 ; (main.s1390 + 0)
.s1391:
2b52 : ad 32 bf LDA $bf32 ; (viewport + 7)
2b55 : 0d 33 bf ORA $bf33 ; (viewport + 8)
2b58 : f0 06 __ BEQ $2b60 ; (main.s1390 + 0)
.s1388:
2b5a : a5 56 __ LDA T2 + 0 
2b5c : 09 01 __ ORA #$01
2b5e : 85 56 __ STA T2 + 0 
.s1390:
2b60 : a5 1b __ LDA ACCU + 0 
2b62 : c9 44 __ CMP #$44
2b64 : f0 04 __ BEQ $2b6a ; (main.s1396 + 0)
.s1397:
2b66 : c9 1d __ CMP #$1d
2b68 : d0 15 __ BNE $2b7f ; (main.s1395 + 0)
.s1396:
2b6a : ad 33 bf LDA $bf33 ; (viewport + 8)
2b6d : d0 10 __ BNE $2b7f ; (main.s1395 + 0)
.s1227:
2b6f : ad 32 bf LDA $bf32 ; (viewport + 7)
2b72 : c9 09 __ CMP #$09
2b74 : b0 09 __ BCS $2b7f ; (main.s1395 + 0)
.s1393:
2b76 : a5 56 __ LDA T2 + 0 
2b78 : 09 02 __ ORA #$02
2b7a : 85 56 __ STA T2 + 0 
2b7c : 4c c2 2c JMP $2cc2 ; (main.s1398 + 0)
.s1395:
2b7f : a5 56 __ LDA T2 + 0 
2b81 : f0 03 __ BEQ $2b86 ; (main.s1400 + 0)
2b83 : 4c c2 2c JMP $2cc2 ; (main.s1398 + 0)
.s1400:
2b86 : a5 54 __ LDA T1 + 0 
2b88 : c9 1b __ CMP #$1b
2b8a : f0 07 __ BEQ $2b93 ; (main.s842 + 0)
.s2499:
2b8c : c9 03 __ CMP #$03
2b8e : f0 03 __ BEQ $2b93 ; (main.s842 + 0)
2b90 : 4c ee 2a JMP $2aee ; (main.l1376 + 0)
.s842:
2b93 : e6 53 __ INC T0 + 0 
2b95 : a5 53 __ LDA T0 + 0 
2b97 : c9 03 __ CMP #$03
2b99 : b0 03 __ BCS $2b9e ; (main.s843 + 0)
2b9b : 4c a3 23 JMP $23a3 ; (main.l841 + 0)
.s843:
2b9e : a9 00 __ LDA #$00
2ba0 : 8d 30 d0 STA $d030 
2ba3 : 85 13 __ STA P6 
2ba5 : ad 11 d0 LDA $d011 
2ba8 : 29 7f __ AND #$7f
2baa : 09 10 __ ORA #$10
2bac : 8d 11 d0 STA $d011 
2baf : 20 61 46 JSR $4661 ; (vdc_set_mode.s1000 + 0)
2bb2 : a9 00 __ LDA #$00
2bb4 : 85 53 __ STA T0 + 0 
2bb6 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2bb9 : 85 54 __ STA T1 + 0 
2bbb : ad 23 5a LDA $5a23 ; (vdc_state + 5)
2bbe : 85 57 __ STA T3 + 0 
.l2507:
2bc0 : a5 53 __ LDA T0 + 0 
2bc2 : c5 57 __ CMP T3 + 0 
2bc4 : 90 21 __ BCC $2be7 ; (main.s2508 + 0)
.s2505:
2bc6 : a9 04 __ LDA #$04
2bc8 : 8d 06 d5 STA $d506 
2bcb : a9 00 __ LDA #$00
2bcd : 85 1b __ STA ACCU + 0 
2bcf : 85 1c __ STA ACCU + 1 
.s1001:
2bd1 : 18 __ __ CLC
2bd2 : a5 23 __ LDA SP + 0 
2bd4 : 69 0e __ ADC #$0e
2bd6 : 85 23 __ STA SP + 0 
2bd8 : 90 02 __ BCC $2bdc ; (main.s1001 + 11)
2bda : e6 24 __ INC SP + 1 
2bdc : a2 10 __ LDX #$10
2bde : bd 97 be LDA $be97,x ; (main@stack + 0)
2be1 : 95 53 __ STA T0 + 0,x 
2be3 : ca __ __ DEX
2be4 : 10 f8 __ BPL $2bde ; (main.s1001 + 13)
2be6 : 60 __ __ RTS
.s2508:
2be7 : 0a __ __ ASL
2be8 : aa __ __ TAX
2be9 : ad 25 5a LDA $5a25 ; (vdc_state + 7)
2bec : 85 56 __ STA T2 + 0 
2bee : a9 12 __ LDA #$12
2bf0 : 8d 00 d6 STA $d600 
2bf3 : a5 54 __ LDA T1 + 0 
2bf5 : 38 __ __ SEC
2bf6 : e9 01 __ SBC #$01
2bf8 : 85 5d __ STA T6 + 0 
2bfa : bd 37 5a LDA $5a37,x ; (multab + 0)
2bfd : 85 59 __ STA T4 + 0 
2bff : 18 __ __ CLC
2c00 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
2c03 : a8 __ __ TAY
2c04 : bd 38 5a LDA $5a38,x ; (multab + 1)
2c07 : 85 5a __ STA T4 + 1 
2c09 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11775:
2c0c : 2c 00 d6 BIT $d600 
2c0f : 10 fb __ BPL $2c0c ; (main.l11775 + 0)
.s2520:
2c11 : 8d 01 d6 STA $d601 
2c14 : a9 13 __ LDA #$13
2c16 : 8d 00 d6 STA $d600 
.l11777:
2c19 : 2c 00 d6 BIT $d600 
2c1c : 10 fb __ BPL $2c19 ; (main.l11777 + 0)
.s2525:
2c1e : 8c 01 d6 STY $d601 
2c21 : a9 1f __ LDA #$1f
2c23 : 8d 00 d6 STA $d600 
.l11779:
2c26 : 2c 00 d6 BIT $d600 
2c29 : 10 fb __ BPL $2c26 ; (main.l11779 + 0)
.s2529:
2c2b : a9 20 __ LDA #$20
2c2d : 8d 01 d6 STA $d601 
2c30 : a9 18 __ LDA #$18
2c32 : 8d 00 d6 STA $d600 
.l11781:
2c35 : 2c 00 d6 BIT $d600 
2c38 : 10 fb __ BPL $2c35 ; (main.l11781 + 0)
.s2535:
2c3a : ad 01 d6 LDA $d601 
2c3d : 29 7f __ AND #$7f
2c3f : a8 __ __ TAY
2c40 : a9 18 __ LDA #$18
2c42 : 8d 00 d6 STA $d600 
.l11783:
2c45 : 2c 00 d6 BIT $d600 
2c48 : 10 fb __ BPL $2c45 ; (main.l11783 + 0)
.s2541:
2c4a : 8c 01 d6 STY $d601 
2c4d : a9 1e __ LDA #$1e
2c4f : 8d 00 d6 STA $d600 
.l11785:
2c52 : 2c 00 d6 BIT $d600 
2c55 : 10 fb __ BPL $2c52 ; (main.l11785 + 0)
.s2546:
2c57 : a5 5d __ LDA T6 + 0 
2c59 : 8d 01 d6 STA $d601 
2c5c : ad 28 5a LDA $5a28 ; (vdc_state + 10)
2c5f : 18 __ __ CLC
2c60 : 65 59 __ ADC T4 + 0 
2c62 : aa __ __ TAX
2c63 : a9 12 __ LDA #$12
2c65 : 8d 00 d6 STA $d600 
2c68 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
2c6b : 65 5a __ ADC T4 + 1 
.l11787:
2c6d : 2c 00 d6 BIT $d600 
2c70 : 10 fb __ BPL $2c6d ; (main.l11787 + 0)
.s2553:
2c72 : 8d 01 d6 STA $d601 
2c75 : a9 13 __ LDA #$13
2c77 : 8d 00 d6 STA $d600 
.l11789:
2c7a : 2c 00 d6 BIT $d600 
2c7d : 10 fb __ BPL $2c7a ; (main.l11789 + 0)
.s2558:
2c7f : 8e 01 d6 STX $d601 
2c82 : a9 1f __ LDA #$1f
2c84 : 8d 00 d6 STA $d600 
.l11791:
2c87 : 2c 00 d6 BIT $d600 
2c8a : 10 fb __ BPL $2c87 ; (main.l11791 + 0)
.s2562:
2c8c : a5 56 __ LDA T2 + 0 
2c8e : 8d 01 d6 STA $d601 
2c91 : a9 18 __ LDA #$18
2c93 : 8d 00 d6 STA $d600 
.l11793:
2c96 : 2c 00 d6 BIT $d600 
2c99 : 10 fb __ BPL $2c96 ; (main.l11793 + 0)
.s2568:
2c9b : ad 01 d6 LDA $d601 
2c9e : 29 7f __ AND #$7f
2ca0 : aa __ __ TAX
2ca1 : a9 18 __ LDA #$18
2ca3 : 8d 00 d6 STA $d600 
.l11795:
2ca6 : 2c 00 d6 BIT $d600 
2ca9 : 10 fb __ BPL $2ca6 ; (main.l11795 + 0)
.s2574:
2cab : 8e 01 d6 STX $d601 
2cae : a9 1e __ LDA #$1e
2cb0 : 8d 00 d6 STA $d600 
.l11797:
2cb3 : 2c 00 d6 BIT $d600 
2cb6 : 10 fb __ BPL $2cb3 ; (main.l11797 + 0)
.s2579:
2cb8 : a5 5d __ LDA T6 + 0 
2cba : 8d 01 d6 STA $d601 
2cbd : e6 53 __ INC T0 + 0 
2cbf : 4c c0 2b JMP $2bc0 ; (main.l2507 + 0)
.s1398:
2cc2 : a2 15 __ LDX #$15
.l1041:
2cc4 : bd 2a bf LDA $bf2a,x ; (softscroll + 15)
2cc7 : 9d a9 be STA $bea9,x ; (main@stack + 18)
2cca : ca __ __ DEX
2ccb : d0 f7 __ BNE $2cc4 ; (main.l1041 + 0)
.s1042:
2ccd : a5 56 __ LDA T2 + 0 
2ccf : 4a __ __ LSR
2cd0 : 90 4e __ BCC $2d20 ; (main.s11651 + 0)
.s1402:
2cd2 : 86 61 __ STX T8 + 0 
2cd4 : ae 38 bf LDX $bf38 ; (viewport + 13)
2cd7 : ca __ __ DEX
2cd8 : 86 57 __ STX T3 + 0 
2cda : ad 3c bf LDA $bf3c ; (viewport + 17)
2cdd : 85 59 __ STA T4 + 0 
2cdf : ad 3d bf LDA $bf3d ; (viewport + 18)
2ce2 : 85 5a __ STA T4 + 1 
2ce4 : ad 3e bf LDA $bf3e ; (viewport + 19)
2ce7 : 85 5b __ STA T5 + 0 
2ce9 : ad 3f bf LDA $bf3f ; (viewport + 20)
.l1406:
2cec : 85 5c __ STA T5 + 1 
2cee : a5 61 __ LDA T8 + 0 
2cf0 : cd 39 bf CMP $bf39 ; (viewport + 14)
2cf3 : b0 03 __ BCS $2cf8 ; (main.s1405 + 0)
2cf5 : 4c fc 33 JMP $33fc ; (main.s1407 + 0)
.s1405:
2cf8 : a9 01 __ LDA #$01
2cfa : 85 11 __ STA P4 
2cfc : ad 39 bf LDA $bf39 ; (viewport + 14)
2cff : 85 12 __ STA P5 
2d01 : ad b1 be LDA $beb1 ; (vp_fill + 7)
2d04 : 18 __ __ CLC
2d05 : 69 ff __ ADC #$ff
2d07 : 8d b1 be STA $beb1 ; (vp_fill + 7)
2d0a : b0 03 __ BCS $2d0f ; (main.s1735 + 0)
.s1734:
2d0c : ce b2 be DEC $beb2 ; (vp_fill + 8)
.s1735:
2d0f : ad 32 bf LDA $bf32 ; (viewport + 7)
2d12 : 18 __ __ CLC
2d13 : 69 ff __ ADC #$ff
2d15 : 8d 32 bf STA $bf32 ; (viewport + 7)
2d18 : b0 03 __ BCS $2d1d ; (main.s1737 + 0)
.s1736:
2d1a : ce 33 bf DEC $bf33 ; (viewport + 8)
.s1737:
2d1d : 20 ce 50 JSR $50ce ; (vdcwin_init@proxy + 0)
.s11651:
2d20 : a5 56 __ LDA T2 + 0 
2d22 : 29 02 __ AND #$02
2d24 : f0 64 __ BEQ $2d8a ; (main.s11711 + 0)
.s1763:
2d26 : ae 38 bf LDX $bf38 ; (viewport + 13)
2d29 : ca __ __ DEX
2d2a : 86 57 __ STX T3 + 0 
2d2c : a9 00 __ LDA #$00
2d2e : 85 61 __ STA T8 + 0 
2d30 : ad 3c bf LDA $bf3c ; (viewport + 17)
2d33 : 85 59 __ STA T4 + 0 
2d35 : ad 3d bf LDA $bf3d ; (viewport + 18)
2d38 : 85 5a __ STA T4 + 1 
2d3a : ad 3e bf LDA $bf3e ; (viewport + 19)
2d3d : 85 5b __ STA T5 + 0 
2d3f : ad 3f bf LDA $bf3f ; (viewport + 20)
.l1767:
2d42 : 85 5c __ STA T5 + 1 
2d44 : a5 61 __ LDA T8 + 0 
2d46 : cd 39 bf CMP $bf39 ; (viewport + 14)
2d49 : b0 03 __ BCS $2d4e ; (main.s1766 + 0)
2d4b : 4c b2 31 JMP $31b2 ; (main.s1768 + 0)
.s1766:
2d4e : a9 01 __ LDA #$01
2d50 : 85 11 __ STA P4 
2d52 : ad 39 bf LDA $bf39 ; (viewport + 14)
2d55 : 85 12 __ STA P5 
2d57 : ad b1 be LDA $beb1 ; (vp_fill + 7)
2d5a : 18 __ __ CLC
2d5b : 6d 38 bf ADC $bf38 ; (viewport + 13)
2d5e : 8d b1 be STA $beb1 ; (vp_fill + 7)
2d61 : 90 03 __ BCC $2d66 ; (main.s1739 + 0)
.s1738:
2d63 : ee b2 be INC $beb2 ; (vp_fill + 8)
.s1739:
2d66 : ee 32 bf INC $bf32 ; (viewport + 7)
2d69 : d0 03 __ BNE $2d6e ; (main.s1741 + 0)
.s1740:
2d6b : ee 33 bf INC $bf33 ; (viewport + 8)
.s1741:
2d6e : a9 b5 __ LDA #$b5
2d70 : 85 0d __ STA P0 
2d72 : a9 be __ LDA #$be
2d74 : 85 0e __ STA P1 
2d76 : ad 36 bf LDA $bf36 ; (viewport + 11)
2d79 : 18 __ __ CLC
2d7a : 6d 38 bf ADC $bf38 ; (viewport + 13)
2d7d : 38 __ __ SEC
2d7e : e9 01 __ SBC #$01
2d80 : 85 0f __ STA P2 
2d82 : ad 37 bf LDA $bf37 ; (viewport + 12)
2d85 : 85 10 __ STA P3 
2d87 : 20 44 51 JSR $5144 ; (vdcwin_init.s0 + 0)
.s11711:
2d8a : a5 56 __ LDA T2 + 0 
2d8c : 29 08 __ AND #$08
2d8e : f0 76 __ BEQ $2e06 ; (main.s11741 + 0)
.s2124:
2d90 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2d93 : 85 59 __ STA T4 + 0 
2d95 : 85 1b __ STA ACCU + 0 
2d97 : ad 22 5a LDA $5a22 ; (vdc_state + 4)
2d9a : 85 5a __ STA T4 + 1 
2d9c : 85 1c __ STA ACCU + 1 
2d9e : ad 39 bf LDA $bf39 ; (viewport + 14)
2da1 : 20 03 57 JSR $5703 ; (mul16by8 + 0)
2da4 : ad 3c bf LDA $bf3c ; (viewport + 17)
2da7 : 18 __ __ CLC
2da8 : 65 05 __ ADC WORK + 2 
2daa : 85 5b __ STA T5 + 0 
2dac : ad 3d bf LDA $bf3d ; (viewport + 18)
2daf : 65 06 __ ADC WORK + 3 
2db1 : 85 5c __ STA T5 + 1 
2db3 : ad 3e bf LDA $bf3e ; (viewport + 19)
2db6 : 18 __ __ CLC
2db7 : 65 05 __ ADC WORK + 2 
2db9 : a8 __ __ TAY
2dba : ad 3f bf LDA $bf3f ; (viewport + 20)
2dbd : 65 06 __ ADC WORK + 3 
2dbf : 85 58 __ STA T3 + 1 
2dc1 : a9 00 __ LDA #$00
2dc3 : 85 61 __ STA T8 + 0 
2dc5 : ad 38 bf LDA $bf38 ; (viewport + 13)
2dc8 : 85 43 __ STA T10 + 0 
.l2128:
2dca : ad 39 bf LDA $bf39 ; (viewport + 14)
2dcd : 38 __ __ SEC
2dce : e9 01 __ SBC #$01
2dd0 : b0 03 __ BCS $2dd5 ; (main.s1105 + 0)
2dd2 : 4c 9c 30 JMP $309c ; (main.s2129 + 0)
.s1105:
2dd5 : c5 61 __ CMP T8 + 0 
2dd7 : 90 05 __ BCC $2dde ; (main.s2127 + 0)
.s1742:
2dd9 : f0 03 __ BEQ $2dde ; (main.s2127 + 0)
2ddb : 4c 9c 30 JMP $309c ; (main.s2129 + 0)
.s2127:
2dde : a9 01 __ LDA #$01
2de0 : 85 12 __ STA P5 
2de2 : ad b3 be LDA $beb3 ; (vp_fill + 9)
2de5 : 18 __ __ CLC
2de6 : 69 ff __ ADC #$ff
2de8 : 8d b3 be STA $beb3 ; (vp_fill + 9)
2deb : b0 03 __ BCS $2df0 ; (main.s1744 + 0)
.s1743:
2ded : ce b4 be DEC $beb4 ; (vp_fill + 10)
.s1744:
2df0 : ad 34 bf LDA $bf34 ; (viewport + 9)
2df3 : 18 __ __ CLC
2df4 : 69 ff __ ADC #$ff
2df6 : 8d 34 bf STA $bf34 ; (viewport + 9)
2df9 : b0 03 __ BCS $2dfe ; (main.s1746 + 0)
.s1745:
2dfb : ce 35 bf DEC $bf35 ; (viewport + 10)
.s1746:
2dfe : ad 38 bf LDA $bf38 ; (viewport + 13)
2e01 : 85 11 __ STA P4 
2e03 : 20 ce 50 JSR $50ce ; (vdcwin_init@proxy + 0)
.s11741:
2e06 : a5 56 __ LDA T2 + 0 
2e08 : 29 04 __ AND #$04
2e0a : f0 75 __ BEQ $2e81 ; (main.s2309 + 0)
.s2307:
2e0c : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2e0f : 85 57 __ STA T3 + 0 
2e11 : ad 22 5a LDA $5a22 ; (vdc_state + 4)
2e14 : 85 58 __ STA T3 + 1 
2e16 : ad 38 bf LDA $bf38 ; (viewport + 13)
2e19 : 85 61 __ STA T8 + 0 
2e1b : ad 3c bf LDA $bf3c ; (viewport + 17)
2e1e : 85 59 __ STA T4 + 0 
2e20 : ad 3d bf LDA $bf3d ; (viewport + 18)
2e23 : 85 5a __ STA T4 + 1 
2e25 : ad 3e bf LDA $bf3e ; (viewport + 19)
2e28 : 85 5b __ STA T5 + 0 
2e2a : ad 3f bf LDA $bf3f ; (viewport + 20)
2e2d : a0 00 __ LDY #$00
.l2311:
2e2f : 85 5c __ STA T5 + 1 
2e31 : ad 39 bf LDA $bf39 ; (viewport + 14)
2e34 : 38 __ __ SEC
2e35 : e9 01 __ SBC #$01
2e37 : b0 03 __ BCS $2e3c ; (main.s1075 + 0)
2e39 : 4c 85 2f JMP $2f85 ; (main.s2312 + 0)
.s1075:
2e3c : 85 5f __ STA T7 + 0 
2e3e : c4 5f __ CPY T7 + 0 
2e40 : b0 03 __ BCS $2e45 ; (main.s2310 + 0)
2e42 : 4c 85 2f JMP $2f85 ; (main.s2312 + 0)
.s2310:
2e45 : a9 01 __ LDA #$01
2e47 : 85 12 __ STA P5 
2e49 : ad b3 be LDA $beb3 ; (vp_fill + 9)
2e4c : 18 __ __ CLC
2e4d : 6d 39 bf ADC $bf39 ; (viewport + 14)
2e50 : 8d b3 be STA $beb3 ; (vp_fill + 9)
2e53 : 90 03 __ BCC $2e58 ; (main.s1748 + 0)
.s1747:
2e55 : ee b4 be INC $beb4 ; (vp_fill + 10)
.s1748:
2e58 : ee 34 bf INC $bf34 ; (viewport + 9)
2e5b : d0 03 __ BNE $2e60 ; (main.s1750 + 0)
.s1749:
2e5d : ee 35 bf INC $bf35 ; (viewport + 10)
.s1750:
2e60 : a9 b5 __ LDA #$b5
2e62 : 85 0d __ STA P0 
2e64 : a9 be __ LDA #$be
2e66 : 85 0e __ STA P1 
2e68 : ad 36 bf LDA $bf36 ; (viewport + 11)
2e6b : 85 0f __ STA P2 
2e6d : ad 37 bf LDA $bf37 ; (viewport + 12)
2e70 : 18 __ __ CLC
2e71 : 6d 39 bf ADC $bf39 ; (viewport + 14)
2e74 : 38 __ __ SEC
2e75 : e9 01 __ SBC #$01
2e77 : 85 10 __ STA P3 
2e79 : ad 38 bf LDA $bf38 ; (viewport + 13)
2e7c : 85 11 __ STA P4 
2e7e : 20 44 51 JSR $5144 ; (vdcwin_init.s0 + 0)
.s2309:
2e81 : ad b3 be LDA $beb3 ; (vp_fill + 9)
2e84 : 85 1b __ STA ACCU + 0 
2e86 : ad b4 be LDA $beb4 ; (vp_fill + 10)
2e89 : 85 1c __ STA ACCU + 1 
2e8b : ad ad be LDA $bead ; (vp_fill + 3)
2e8e : 85 03 __ STA WORK + 0 
2e90 : ad ae be LDA $beae ; (vp_fill + 4)
2e93 : 85 04 __ STA WORK + 1 
2e95 : 20 23 57 JSR $5723 ; (mul16 + 0)
2e98 : ad ab be LDA $beab ; (vp_fill + 1)
2e9b : 18 __ __ CLC
2e9c : 65 05 __ ADC WORK + 2 
2e9e : a8 __ __ TAY
2e9f : ad ac be LDA $beac ; (vp_fill + 2)
2ea2 : 65 06 __ ADC WORK + 3 
2ea4 : aa __ __ TAX
2ea5 : 98 __ __ TYA
2ea6 : 18 __ __ CLC
2ea7 : 6d b1 be ADC $beb1 ; (vp_fill + 7)
2eaa : 85 57 __ STA T3 + 0 
2eac : 8a __ __ TXA
2ead : 6d b2 be ADC $beb2 ; (vp_fill + 8)
2eb0 : 85 58 __ STA T3 + 1 
2eb2 : a9 00 __ LDA #$00
2eb4 : 85 56 __ STA T2 + 0 
2eb6 : ac bc be LDY $bebc ; (vp_fill + 18)
2eb9 : ae bb be LDX $bebb ; (vp_fill + 17)
2ebc : 4c e6 2e JMP $2ee6 ; (main.l2491 + 0)
.s2492:
2ebf : 86 0d __ STX P0 
2ec1 : 84 0e __ STY P1 
2ec3 : 20 d1 14 JSR $14d1 ; (bnk_cpytovdc@proxy + 0)
2ec6 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2ec9 : 18 __ __ CLC
2eca : 65 0d __ ADC P0 
2ecc : aa __ __ TAX
2ecd : ad 22 5a LDA $5a22 ; (vdc_state + 4)
2ed0 : 65 0e __ ADC P1 
2ed2 : a8 __ __ TAY
2ed3 : 18 __ __ CLC
2ed4 : a5 57 __ LDA T3 + 0 
2ed6 : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
2ed9 : 85 57 __ STA T3 + 0 
2edb : a5 58 __ LDA T3 + 1 
2edd : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
2ee0 : 85 58 __ STA T3 + 1 
2ee2 : e6 56 __ INC T2 + 0 
2ee4 : a5 56 __ LDA T2 + 0 
.l2491:
2ee6 : cd b8 be CMP $beb8 ; (vp_fill + 14)
2ee9 : 90 d4 __ BCC $2ebf ; (main.s2492 + 0)
.s2494:
2eeb : ad ad be LDA $bead ; (vp_fill + 3)
2eee : 85 03 __ STA WORK + 0 
2ef0 : ad ae be LDA $beae ; (vp_fill + 4)
2ef3 : 85 04 __ STA WORK + 1 
2ef5 : ad b3 be LDA $beb3 ; (vp_fill + 9)
2ef8 : 85 1b __ STA ACCU + 0 
2efa : ad b4 be LDA $beb4 ; (vp_fill + 10)
2efd : 85 1c __ STA ACCU + 1 
2eff : 20 23 57 JSR $5723 ; (mul16 + 0)
2f02 : ad ab be LDA $beab ; (vp_fill + 1)
2f05 : 18 __ __ CLC
2f06 : 65 05 __ ADC WORK + 2 
2f08 : a8 __ __ TAY
2f09 : ad ac be LDA $beac ; (vp_fill + 2)
2f0c : 65 06 __ ADC WORK + 3 
2f0e : aa __ __ TAX
2f0f : 98 __ __ TYA
2f10 : 18 __ __ CLC
2f11 : 6d b1 be ADC $beb1 ; (vp_fill + 7)
2f14 : 85 59 __ STA T4 + 0 
2f16 : 8a __ __ TXA
2f17 : 6d b2 be ADC $beb2 ; (vp_fill + 8)
2f1a : 85 5a __ STA T4 + 1 
2f1c : ad af be LDA $beaf ; (vp_fill + 5)
2f1f : 85 1b __ STA ACCU + 0 
2f21 : ad b0 be LDA $beb0 ; (vp_fill + 6)
2f24 : 85 1c __ STA ACCU + 1 
2f26 : ad ad be LDA $bead ; (vp_fill + 3)
2f29 : 85 03 __ STA WORK + 0 
2f2b : ad ae be LDA $beae ; (vp_fill + 4)
2f2e : 85 04 __ STA WORK + 1 
2f30 : 20 23 57 JSR $5723 ; (mul16 + 0)
2f33 : 18 __ __ CLC
2f34 : a5 59 __ LDA T4 + 0 
2f36 : 65 05 __ ADC WORK + 2 
2f38 : aa __ __ TAX
2f39 : a5 5a __ LDA T4 + 1 
2f3b : 65 06 __ ADC WORK + 3 
2f3d : a8 __ __ TAY
2f3e : 8a __ __ TXA
2f3f : 18 __ __ CLC
2f40 : 69 30 __ ADC #$30
2f42 : 85 57 __ STA T3 + 0 
2f44 : 90 01 __ BCC $2f47 ; (main.s1752 + 0)
.s1751:
2f46 : c8 __ __ INY
.s1752:
2f47 : 84 58 __ STY T3 + 1 
2f49 : a9 00 __ LDA #$00
2f4b : 85 56 __ STA T2 + 0 
2f4d : ac be be LDY $bebe ; (vp_fill + 20)
2f50 : ae bd be LDX $bebd ; (vp_fill + 19)
2f53 : 4c 7d 2f JMP $2f7d ; (main.l2495 + 0)
.s2496:
2f56 : 86 0d __ STX P0 
2f58 : 84 0e __ STY P1 
2f5a : 20 d1 14 JSR $14d1 ; (bnk_cpytovdc@proxy + 0)
2f5d : ad 21 5a LDA $5a21 ; (vdc_state + 3)
2f60 : 18 __ __ CLC
2f61 : 65 0d __ ADC P0 
2f63 : aa __ __ TAX
2f64 : ad 22 5a LDA $5a22 ; (vdc_state + 4)
2f67 : 65 0e __ ADC P1 
2f69 : a8 __ __ TAY
2f6a : 18 __ __ CLC
2f6b : a5 57 __ LDA T3 + 0 
2f6d : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
2f70 : 85 57 __ STA T3 + 0 
2f72 : a5 58 __ LDA T3 + 1 
2f74 : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
2f77 : 85 58 __ STA T3 + 1 
2f79 : e6 56 __ INC T2 + 0 
2f7b : a5 56 __ LDA T2 + 0 
.l2495:
2f7d : cd b8 be CMP $beb8 ; (vp_fill + 14)
2f80 : 90 d4 __ BCC $2f56 ; (main.s2496 + 0)
2f82 : 4c 86 2b JMP $2b86 ; (main.s1400 + 0)
.s2312:
2f85 : a9 12 __ LDA #$12
2f87 : 8d 00 d6 STA $d600 
2f8a : a5 5b __ LDA T5 + 0 
2f8c : 65 57 __ ADC T3 + 0 
2f8e : 85 5d __ STA T6 + 0 
2f90 : a5 5c __ LDA T5 + 1 
2f92 : 65 58 __ ADC T3 + 1 
2f94 : 85 5e __ STA T6 + 1 
2f96 : 18 __ __ CLC
2f97 : a5 59 __ LDA T4 + 0 
2f99 : 65 57 __ ADC T3 + 0 
2f9b : 85 1b __ STA ACCU + 0 
2f9d : a5 5a __ LDA T4 + 1 
2f9f : 65 58 __ ADC T3 + 1 
2fa1 : 85 1c __ STA ACCU + 1 
.l11743:
2fa3 : 2c 00 d6 BIT $d600 
2fa6 : 10 fb __ BPL $2fa3 ; (main.l11743 + 0)
.s2368:
2fa8 : a5 5a __ LDA T4 + 1 
2faa : 8d 01 d6 STA $d601 
2fad : a9 13 __ LDA #$13
2faf : 8d 00 d6 STA $d600 
.l11745:
2fb2 : 2c 00 d6 BIT $d600 
2fb5 : 10 fb __ BPL $2fb2 ; (main.l11745 + 0)
.s2373:
2fb7 : a5 59 __ LDA T4 + 0 
2fb9 : 8d 01 d6 STA $d601 
2fbc : a9 1f __ LDA #$1f
2fbe : 8d 00 d6 STA $d600 
2fc1 : a9 18 __ LDA #$18
2fc3 : 8d 00 d6 STA $d600 
.l11747:
2fc6 : 2c 00 d6 BIT $d600 
2fc9 : 10 fb __ BPL $2fc6 ; (main.l11747 + 0)
.s2380:
2fcb : ad 01 d6 LDA $d601 
2fce : a2 18 __ LDX #$18
2fd0 : 8e 00 d6 STX $d600 
2fd3 : 09 80 __ ORA #$80
.l11749:
2fd5 : 2c 00 d6 BIT $d600 
2fd8 : 10 fb __ BPL $2fd5 ; (main.l11749 + 0)
.s2386:
2fda : 8d 01 d6 STA $d601 
2fdd : a9 20 __ LDA #$20
2fdf : 8d 00 d6 STA $d600 
.l11751:
2fe2 : 2c 00 d6 BIT $d600 
2fe5 : 10 fb __ BPL $2fe2 ; (main.l11751 + 0)
.s2391:
2fe7 : a5 1c __ LDA ACCU + 1 
2fe9 : 8d 01 d6 STA $d601 
2fec : a9 21 __ LDA #$21
2fee : 8d 00 d6 STA $d600 
.l11753:
2ff1 : 2c 00 d6 BIT $d600 
2ff4 : 10 fb __ BPL $2ff1 ; (main.l11753 + 0)
.s2396:
2ff6 : a5 1b __ LDA ACCU + 0 
2ff8 : 8d 01 d6 STA $d601 
2ffb : a9 1f __ LDA #$1f
2ffd : 8d 00 d6 STA $d600 
3000 : a9 1e __ LDA #$1e
3002 : 8d 00 d6 STA $d600 
.l11755:
3005 : 2c 00 d6 BIT $d600 
3008 : 10 fb __ BPL $3005 ; (main.l11755 + 0)
.s2402:
300a : a5 61 __ LDA T8 + 0 
300c : 8d 01 d6 STA $d601 
300f : a9 12 __ LDA #$12
3011 : 8d 00 d6 STA $d600 
.l11757:
3014 : 2c 00 d6 BIT $d600 
3017 : 10 fb __ BPL $3014 ; (main.l11757 + 0)
.s2455:
3019 : a5 5c __ LDA T5 + 1 
301b : 8d 01 d6 STA $d601 
301e : a9 13 __ LDA #$13
3020 : 8d 00 d6 STA $d600 
.l11759:
3023 : 2c 00 d6 BIT $d600 
3026 : 10 fb __ BPL $3023 ; (main.l11759 + 0)
.s2460:
3028 : a5 5b __ LDA T5 + 0 
302a : 8d 01 d6 STA $d601 
302d : a9 1f __ LDA #$1f
302f : 8d 00 d6 STA $d600 
3032 : 8e 00 d6 STX $d600 
.l11761:
3035 : 2c 00 d6 BIT $d600 
3038 : 10 fb __ BPL $3035 ; (main.l11761 + 0)
.s2467:
303a : ad 01 d6 LDA $d601 
303d : 8e 00 d6 STX $d600 
3040 : 09 80 __ ORA #$80
.l11763:
3042 : 2c 00 d6 BIT $d600 
3045 : 10 fb __ BPL $3042 ; (main.l11763 + 0)
.s2473:
3047 : 8d 01 d6 STA $d601 
304a : a9 20 __ LDA #$20
304c : 8d 00 d6 STA $d600 
.l11765:
304f : 2c 00 d6 BIT $d600 
3052 : 10 fb __ BPL $304f ; (main.l11765 + 0)
.s2478:
3054 : a5 5e __ LDA T6 + 1 
3056 : 8d 01 d6 STA $d601 
3059 : a9 21 __ LDA #$21
305b : 8d 00 d6 STA $d600 
.l11767:
305e : 2c 00 d6 BIT $d600 
3061 : 10 fb __ BPL $305e ; (main.l11767 + 0)
.s2483:
3063 : a5 5d __ LDA T6 + 0 
3065 : 8d 01 d6 STA $d601 
3068 : a9 1f __ LDA #$1f
306a : 8d 00 d6 STA $d600 
306d : a9 1e __ LDA #$1e
306f : 8d 00 d6 STA $d600 
.l11769:
3072 : 2c 00 d6 BIT $d600 
3075 : 10 fb __ BPL $3072 ; (main.l11769 + 0)
.s2489:
3077 : a5 61 __ LDA T8 + 0 
3079 : 8d 01 d6 STA $d601 
307c : ad 21 5a LDA $5a21 ; (vdc_state + 3)
307f : 18 __ __ CLC
3080 : 65 59 __ ADC T4 + 0 
3082 : 85 59 __ STA T4 + 0 
3084 : ad 22 5a LDA $5a22 ; (vdc_state + 4)
3087 : 65 5a __ ADC T4 + 1 
3089 : 85 5a __ STA T4 + 1 
308b : 18 __ __ CLC
308c : a5 5b __ LDA T5 + 0 
308e : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
3091 : 85 5b __ STA T5 + 0 
3093 : a5 5c __ LDA T5 + 1 
3095 : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
3098 : c8 __ __ INY
3099 : 4c 2f 2e JMP $2e2f ; (main.l2311 + 0)
.s2129:
309c : a9 12 __ LDA #$12
309e : 8d 00 d6 STA $d600 
30a1 : 98 __ __ TYA
30a2 : 38 __ __ SEC
30a3 : ed 21 5a SBC $5a21 ; (vdc_state + 3)
30a6 : a8 __ __ TAY
30a7 : a5 58 __ LDA T3 + 1 
30a9 : ed 22 5a SBC $5a22 ; (vdc_state + 4)
30ac : 85 58 __ STA T3 + 1 
30ae : 98 __ __ TYA
30af : 38 __ __ SEC
30b0 : e5 59 __ SBC T4 + 0 
30b2 : 85 5f __ STA T7 + 0 
30b4 : a5 58 __ LDA T3 + 1 
30b6 : e5 5a __ SBC T4 + 1 
30b8 : 85 60 __ STA T7 + 1 
30ba : 38 __ __ SEC
30bb : a5 5b __ LDA T5 + 0 
30bd : ed 21 5a SBC $5a21 ; (vdc_state + 3)
30c0 : 85 5b __ STA T5 + 0 
30c2 : a5 5c __ LDA T5 + 1 
30c4 : ed 22 5a SBC $5a22 ; (vdc_state + 4)
30c7 : 85 5c __ STA T5 + 1 
30c9 : 38 __ __ SEC
30ca : a5 5b __ LDA T5 + 0 
30cc : e5 59 __ SBC T4 + 0 
30ce : 85 5d __ STA T6 + 0 
30d0 : a5 5c __ LDA T5 + 1 
30d2 : e5 5a __ SBC T4 + 1 
30d4 : 85 5e __ STA T6 + 1 
.l11713:
30d6 : 2c 00 d6 BIT $d600 
30d9 : 10 fb __ BPL $30d6 ; (main.l11713 + 0)
.s2185:
30db : a5 5c __ LDA T5 + 1 
30dd : 8d 01 d6 STA $d601 
30e0 : a9 13 __ LDA #$13
30e2 : 8d 00 d6 STA $d600 
.l11715:
30e5 : 2c 00 d6 BIT $d600 
30e8 : 10 fb __ BPL $30e5 ; (main.l11715 + 0)
.s2190:
30ea : a5 5b __ LDA T5 + 0 
30ec : 8d 01 d6 STA $d601 
30ef : a9 1f __ LDA #$1f
30f1 : 8d 00 d6 STA $d600 
30f4 : a9 18 __ LDA #$18
30f6 : 8d 00 d6 STA $d600 
.l11717:
30f9 : 2c 00 d6 BIT $d600 
30fc : 10 fb __ BPL $30f9 ; (main.l11717 + 0)
.s2197:
30fe : ad 01 d6 LDA $d601 
3101 : a2 18 __ LDX #$18
3103 : 8e 00 d6 STX $d600 
3106 : 09 80 __ ORA #$80
.l11719:
3108 : 2c 00 d6 BIT $d600 
310b : 10 fb __ BPL $3108 ; (main.l11719 + 0)
.s2203:
310d : 8d 01 d6 STA $d601 
3110 : a9 20 __ LDA #$20
3112 : 8d 00 d6 STA $d600 
.l11721:
3115 : 2c 00 d6 BIT $d600 
3118 : 10 fb __ BPL $3115 ; (main.l11721 + 0)
.s2208:
311a : a5 5e __ LDA T6 + 1 
311c : 8d 01 d6 STA $d601 
311f : a9 21 __ LDA #$21
3121 : 8d 00 d6 STA $d600 
.l11723:
3124 : 2c 00 d6 BIT $d600 
3127 : 10 fb __ BPL $3124 ; (main.l11723 + 0)
.s2213:
3129 : a5 5d __ LDA T6 + 0 
312b : 8d 01 d6 STA $d601 
312e : a9 1f __ LDA #$1f
3130 : 8d 00 d6 STA $d600 
3133 : a9 1e __ LDA #$1e
3135 : 8d 00 d6 STA $d600 
.l11725:
3138 : 2c 00 d6 BIT $d600 
313b : 10 fb __ BPL $3138 ; (main.l11725 + 0)
.s2219:
313d : a5 43 __ LDA T10 + 0 
313f : 8d 01 d6 STA $d601 
3142 : a9 12 __ LDA #$12
3144 : 8d 00 d6 STA $d600 
.l11727:
3147 : 2c 00 d6 BIT $d600 
314a : 10 fb __ BPL $3147 ; (main.l11727 + 0)
.s2272:
314c : a5 58 __ LDA T3 + 1 
314e : 8d 01 d6 STA $d601 
3151 : a9 13 __ LDA #$13
3153 : 8d 00 d6 STA $d600 
.l11729:
3156 : 2c 00 d6 BIT $d600 
3159 : 10 fb __ BPL $3156 ; (main.l11729 + 0)
.s2277:
315b : 8c 01 d6 STY $d601 
315e : a9 1f __ LDA #$1f
3160 : 8d 00 d6 STA $d600 
3163 : 8e 00 d6 STX $d600 
.l11731:
3166 : 2c 00 d6 BIT $d600 
3169 : 10 fb __ BPL $3166 ; (main.l11731 + 0)
.s2284:
316b : ad 01 d6 LDA $d601 
316e : 8e 00 d6 STX $d600 
3171 : 09 80 __ ORA #$80
.l11733:
3173 : 2c 00 d6 BIT $d600 
3176 : 10 fb __ BPL $3173 ; (main.l11733 + 0)
.s2290:
3178 : 8d 01 d6 STA $d601 
317b : a9 20 __ LDA #$20
317d : 8d 00 d6 STA $d600 
.l11735:
3180 : 2c 00 d6 BIT $d600 
3183 : 10 fb __ BPL $3180 ; (main.l11735 + 0)
.s2295:
3185 : a5 60 __ LDA T7 + 1 
3187 : 8d 01 d6 STA $d601 
318a : a9 21 __ LDA #$21
318c : 8d 00 d6 STA $d600 
.l11737:
318f : 2c 00 d6 BIT $d600 
3192 : 10 fb __ BPL $318f ; (main.l11737 + 0)
.s2300:
3194 : a5 5f __ LDA T7 + 0 
3196 : 8d 01 d6 STA $d601 
3199 : a9 1f __ LDA #$1f
319b : 8d 00 d6 STA $d600 
319e : a9 1e __ LDA #$1e
31a0 : 8d 00 d6 STA $d600 
.l11739:
31a3 : 2c 00 d6 BIT $d600 
31a6 : 10 fb __ BPL $31a3 ; (main.l11739 + 0)
.s2306:
31a8 : a5 43 __ LDA T10 + 0 
31aa : 8d 01 d6 STA $d601 
31ad : e6 61 __ INC T8 + 0 
31af : 4c ca 2d JMP $2dca ; (main.l2128 + 0)
.s1768:
31b2 : a5 5b __ LDA T5 + 0 
31b4 : 69 01 __ ADC #$01
31b6 : 85 5d __ STA T6 + 0 
31b8 : a5 5c __ LDA T5 + 1 
31ba : 69 00 __ ADC #$00
31bc : 85 5e __ STA T6 + 1 
31be : 18 __ __ CLC
31bf : a5 59 __ LDA T4 + 0 
31c1 : 69 01 __ ADC #$01
31c3 : aa __ __ TAX
31c4 : a5 5a __ LDA T4 + 1 
31c6 : 69 00 __ ADC #$00
31c8 : a8 __ __ TAY
31c9 : ad 1f 5a LDA $5a1f ; (vdc_state + 1)
31cc : d0 11 __ BNE $31df ; (main.s1773 + 0)
.s1775:
31ce : a9 03 __ LDA #$03
31d0 : cd 2b 5a CMP $5a2b ; (vdc_state + 13)
31d3 : d0 05 __ BNE $31da ; (main.s1164 + 0)
.s1163:
31d5 : a9 ff __ LDA #$ff
31d7 : cd 2a 5a CMP $5a2a ; (vdc_state + 12)
.s1164:
31da : b0 03 __ BCS $31df ; (main.s1773 + 0)
31dc : 4c d1 33 JMP $33d1 ; (main.s1772 + 0)
.s1773:
31df : ad 2a 5a LDA $5a2a ; (vdc_state + 12)
31e2 : 85 1b __ STA ACCU + 0 
31e4 : ad 2b 5a LDA $5a2b ; (vdc_state + 13)
31e7 : 85 45 __ STA T13 + 0 
31e9 : a9 12 __ LDA #$12
31eb : 8d 00 d6 STA $d600 
.l11654:
31ee : 2c 00 d6 BIT $d600 
31f1 : 10 fb __ BPL $31ee ; (main.l11654 + 0)
.s1828:
31f3 : a5 45 __ LDA T13 + 0 
31f5 : 8d 01 d6 STA $d601 
31f8 : a9 13 __ LDA #$13
31fa : 8d 00 d6 STA $d600 
.l11656:
31fd : 2c 00 d6 BIT $d600 
3200 : 10 fb __ BPL $31fd ; (main.l11656 + 0)
.s1833:
3202 : a5 1b __ LDA ACCU + 0 
3204 : 8d 01 d6 STA $d601 
3207 : a9 1f __ LDA #$1f
3209 : 8d 00 d6 STA $d600 
320c : a9 18 __ LDA #$18
320e : 8d 00 d6 STA $d600 
.l11658:
3211 : 2c 00 d6 BIT $d600 
3214 : 10 fb __ BPL $3211 ; (main.l11658 + 0)
.s1840:
3216 : ad 01 d6 LDA $d601 
3219 : 09 80 __ ORA #$80
321b : 85 49 __ STA T16 + 0 
321d : a9 18 __ LDA #$18
321f : 8d 00 d6 STA $d600 
.l11660:
3222 : 2c 00 d6 BIT $d600 
3225 : 10 fb __ BPL $3222 ; (main.l11660 + 0)
.s1846:
3227 : a5 49 __ LDA T16 + 0 
3229 : 8d 01 d6 STA $d601 
322c : a9 20 __ LDA #$20
322e : 8d 00 d6 STA $d600 
.l11662:
3231 : 2c 00 d6 BIT $d600 
3234 : 10 fb __ BPL $3231 ; (main.l11662 + 0)
.s1851:
3236 : 8c 01 d6 STY $d601 
3239 : a9 21 __ LDA #$21
323b : 8d 00 d6 STA $d600 
.l11664:
323e : 2c 00 d6 BIT $d600 
3241 : 10 fb __ BPL $323e ; (main.l11664 + 0)
.s1856:
3243 : 8e 01 d6 STX $d601 
3246 : a9 1f __ LDA #$1f
3248 : 8d 00 d6 STA $d600 
324b : a9 1e __ LDA #$1e
324d : 8d 00 d6 STA $d600 
.l11666:
3250 : 2c 00 d6 BIT $d600 
3253 : 10 fb __ BPL $3250 ; (main.l11666 + 0)
.s1862:
3255 : a5 57 __ LDA T3 + 0 
3257 : 8d 01 d6 STA $d601 
325a : a9 12 __ LDA #$12
325c : 8d 00 d6 STA $d600 
.l11668:
325f : 2c 00 d6 BIT $d600 
3262 : 10 fb __ BPL $325f ; (main.l11668 + 0)
.s1915:
3264 : a5 5a __ LDA T4 + 1 
3266 : 8d 01 d6 STA $d601 
3269 : a9 13 __ LDA #$13
326b : 8d 00 d6 STA $d600 
.l11670:
326e : 2c 00 d6 BIT $d600 
3271 : 10 fb __ BPL $326e ; (main.l11670 + 0)
.s1920:
3273 : a5 59 __ LDA T4 + 0 
3275 : 8d 01 d6 STA $d601 
3278 : a9 1f __ LDA #$1f
327a : 8d 00 d6 STA $d600 
327d : a9 18 __ LDA #$18
327f : 8d 00 d6 STA $d600 
.l11672:
3282 : 2c 00 d6 BIT $d600 
3285 : 10 fb __ BPL $3282 ; (main.l11672 + 0)
.s1927:
3287 : ad 01 d6 LDA $d601 
328a : 09 80 __ ORA #$80
328c : aa __ __ TAX
328d : a9 18 __ LDA #$18
328f : 8d 00 d6 STA $d600 
.l11674:
3292 : 2c 00 d6 BIT $d600 
3295 : 10 fb __ BPL $3292 ; (main.l11674 + 0)
.s1933:
3297 : 8e 01 d6 STX $d601 
329a : a9 20 __ LDA #$20
329c : 8d 00 d6 STA $d600 
.l11676:
329f : 2c 00 d6 BIT $d600 
32a2 : 10 fb __ BPL $329f ; (main.l11676 + 0)
.s1938:
32a4 : a5 45 __ LDA T13 + 0 
32a6 : 8d 01 d6 STA $d601 
32a9 : a9 21 __ LDA #$21
32ab : 8d 00 d6 STA $d600 
.l11678:
32ae : 2c 00 d6 BIT $d600 
32b1 : 10 fb __ BPL $32ae ; (main.l11678 + 0)
.s1943:
32b3 : a5 1b __ LDA ACCU + 0 
32b5 : 8d 01 d6 STA $d601 
32b8 : a9 1f __ LDA #$1f
32ba : 8d 00 d6 STA $d600 
32bd : a9 1e __ LDA #$1e
32bf : 8d 00 d6 STA $d600 
.l11680:
32c2 : 2c 00 d6 BIT $d600 
32c5 : 10 fb __ BPL $32c2 ; (main.l11680 + 0)
.s1949:
32c7 : a5 57 __ LDA T3 + 0 
32c9 : 8d 01 d6 STA $d601 
32cc : a9 12 __ LDA #$12
32ce : 8d 00 d6 STA $d600 
.l11682:
32d1 : 2c 00 d6 BIT $d600 
32d4 : 10 fb __ BPL $32d1 ; (main.l11682 + 0)
.s2002:
32d6 : a5 45 __ LDA T13 + 0 
32d8 : 8d 01 d6 STA $d601 
32db : a9 13 __ LDA #$13
32dd : 8d 00 d6 STA $d600 
.l11684:
32e0 : 2c 00 d6 BIT $d600 
32e3 : 10 fb __ BPL $32e0 ; (main.l11684 + 0)
.s2007:
32e5 : a5 1b __ LDA ACCU + 0 
32e7 : 8d 01 d6 STA $d601 
32ea : a9 1f __ LDA #$1f
32ec : 8d 00 d6 STA $d600 
32ef : a9 18 __ LDA #$18
32f1 : 8d 00 d6 STA $d600 
.l11686:
32f4 : 2c 00 d6 BIT $d600 
32f7 : 10 fb __ BPL $32f4 ; (main.l11686 + 0)
.s2014:
32f9 : ad 01 d6 LDA $d601 
32fc : 09 80 __ ORA #$80
32fe : aa __ __ TAX
32ff : a9 18 __ LDA #$18
3301 : 8d 00 d6 STA $d600 
.l11688:
3304 : 2c 00 d6 BIT $d600 
3307 : 10 fb __ BPL $3304 ; (main.l11688 + 0)
.s2020:
3309 : 8e 01 d6 STX $d601 
330c : a9 20 __ LDA #$20
330e : 8d 00 d6 STA $d600 
.l11690:
3311 : 2c 00 d6 BIT $d600 
3314 : 10 fb __ BPL $3311 ; (main.l11690 + 0)
.s2025:
3316 : a5 5e __ LDA T6 + 1 
3318 : 8d 01 d6 STA $d601 
331b : a9 21 __ LDA #$21
331d : 8d 00 d6 STA $d600 
.l11692:
3320 : 2c 00 d6 BIT $d600 
3323 : 10 fb __ BPL $3320 ; (main.l11692 + 0)
.s2030:
3325 : a5 5d __ LDA T6 + 0 
3327 : 8d 01 d6 STA $d601 
332a : a9 1f __ LDA #$1f
332c : 8d 00 d6 STA $d600 
332f : a9 1e __ LDA #$1e
3331 : 8d 00 d6 STA $d600 
.l11694:
3334 : 2c 00 d6 BIT $d600 
3337 : 10 fb __ BPL $3334 ; (main.l11694 + 0)
.s2036:
3339 : a5 57 __ LDA T3 + 0 
333b : 8d 01 d6 STA $d601 
333e : a9 12 __ LDA #$12
3340 : 8d 00 d6 STA $d600 
.l11696:
3343 : 2c 00 d6 BIT $d600 
3346 : 10 fb __ BPL $3343 ; (main.l11696 + 0)
.s2089:
3348 : a5 5c __ LDA T5 + 1 
334a : 8d 01 d6 STA $d601 
334d : a9 13 __ LDA #$13
334f : 8d 00 d6 STA $d600 
.l11698:
3352 : 2c 00 d6 BIT $d600 
3355 : 10 fb __ BPL $3352 ; (main.l11698 + 0)
.s2094:
3357 : a5 5b __ LDA T5 + 0 
3359 : 8d 01 d6 STA $d601 
335c : a9 1f __ LDA #$1f
335e : 8d 00 d6 STA $d600 
3361 : a9 18 __ LDA #$18
3363 : 8d 00 d6 STA $d600 
.l11700:
3366 : 2c 00 d6 BIT $d600 
3369 : 10 fb __ BPL $3366 ; (main.l11700 + 0)
.s2101:
336b : ad 01 d6 LDA $d601 
336e : 09 80 __ ORA #$80
3370 : aa __ __ TAX
3371 : a9 18 __ LDA #$18
3373 : 8d 00 d6 STA $d600 
.l11702:
3376 : 2c 00 d6 BIT $d600 
3379 : 10 fb __ BPL $3376 ; (main.l11702 + 0)
.s2107:
337b : 8e 01 d6 STX $d601 
337e : a9 20 __ LDA #$20
3380 : 8d 00 d6 STA $d600 
.l11704:
3383 : 2c 00 d6 BIT $d600 
3386 : 10 fb __ BPL $3383 ; (main.l11704 + 0)
.s2112:
3388 : a5 45 __ LDA T13 + 0 
338a : 8d 01 d6 STA $d601 
338d : a9 21 __ LDA #$21
338f : 8d 00 d6 STA $d600 
.l11706:
3392 : 2c 00 d6 BIT $d600 
3395 : 10 fb __ BPL $3392 ; (main.l11706 + 0)
.s2117:
3397 : a5 1b __ LDA ACCU + 0 
3399 : 8d 01 d6 STA $d601 
339c : a9 1f __ LDA #$1f
339e : 8d 00 d6 STA $d600 
33a1 : a9 1e __ LDA #$1e
33a3 : 8d 00 d6 STA $d600 
.l11708:
33a6 : 2c 00 d6 BIT $d600 
33a9 : 10 fb __ BPL $33a6 ; (main.l11708 + 0)
.s2123:
33ab : a5 57 __ LDA T3 + 0 
33ad : 8d 01 d6 STA $d601 
.s1771:
33b0 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
33b3 : 18 __ __ CLC
33b4 : 65 59 __ ADC T4 + 0 
33b6 : 85 59 __ STA T4 + 0 
33b8 : ad 22 5a LDA $5a22 ; (vdc_state + 4)
33bb : 65 5a __ ADC T4 + 1 
33bd : 85 5a __ STA T4 + 1 
33bf : 18 __ __ CLC
33c0 : a5 5b __ LDA T5 + 0 
33c2 : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
33c5 : 85 5b __ STA T5 + 0 
33c7 : a5 5c __ LDA T5 + 1 
33c9 : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
33cc : e6 61 __ INC T8 + 0 
33ce : 4c 42 2d JMP $2d42 ; (main.l1767 + 0)
.s1772:
33d1 : 86 0f __ STX P2 
33d3 : 84 10 __ STY P3 
33d5 : 20 38 14 JSR $1438 ; (bnk_cpyfromvdc@proxy + 0)
33d8 : a5 59 __ LDA T4 + 0 
33da : 85 0d __ STA P0 
33dc : a5 5a __ LDA T4 + 1 
33de : 85 0e __ STA P1 
33e0 : 20 ea 14 JSR $14ea ; (bnk_cpytovdc@proxy + 0)
33e3 : a5 5d __ LDA T6 + 0 
33e5 : 85 0f __ STA P2 
33e7 : a5 5e __ LDA T6 + 1 
33e9 : 85 10 __ STA P3 
33eb : 20 be 14 JSR $14be ; (bnk_cpyfromvdc@proxy + 0)
33ee : a5 5b __ LDA T5 + 0 
33f0 : 85 0d __ STA P0 
33f2 : a5 5c __ LDA T5 + 1 
33f4 : 85 0e __ STA P1 
33f6 : 20 ea 14 JSR $14ea ; (bnk_cpytovdc@proxy + 0)
33f9 : 4c b0 33 JMP $33b0 ; (main.s1771 + 0)
.s1407:
33fc : a5 59 __ LDA T4 + 0 
33fe : 69 01 __ ADC #$01
3400 : 85 5d __ STA T6 + 0 
3402 : a5 5a __ LDA T4 + 1 
3404 : 69 00 __ ADC #$00
3406 : 85 5e __ STA T6 + 1 
3408 : 18 __ __ CLC
3409 : a5 5b __ LDA T5 + 0 
340b : 69 01 __ ADC #$01
340d : 85 5f __ STA T7 + 0 
340f : a5 5c __ LDA T5 + 1 
3411 : 69 00 __ ADC #$00
3413 : 85 60 __ STA T7 + 1 
3415 : ad 1f 5a LDA $5a1f ; (vdc_state + 1)
3418 : d0 11 __ BNE $342b ; (main.s1412 + 0)
.s1414:
341a : a9 03 __ LDA #$03
341c : cd 2b 5a CMP $5a2b ; (vdc_state + 13)
341f : d0 05 __ BNE $3426 ; (main.s1224 + 0)
.s1223:
3421 : a9 ff __ LDA #$ff
3423 : cd 2a 5a CMP $5a2a ; (vdc_state + 12)
.s1224:
3426 : b0 03 __ BCS $342b ; (main.s1412 + 0)
3428 : 4c 16 36 JMP $3616 ; (main.s1411 + 0)
.s1412:
342b : a9 12 __ LDA #$12
342d : 8d 00 d6 STA $d600 
3430 : ac 2b 5a LDY $5a2b ; (vdc_state + 13)
3433 : ae 2a 5a LDX $5a2a ; (vdc_state + 12)
.l11594:
3436 : 2c 00 d6 BIT $d600 
3439 : 10 fb __ BPL $3436 ; (main.l11594 + 0)
.s1467:
343b : 8c 01 d6 STY $d601 
343e : a9 13 __ LDA #$13
3440 : 8d 00 d6 STA $d600 
.l11596:
3443 : 2c 00 d6 BIT $d600 
3446 : 10 fb __ BPL $3443 ; (main.l11596 + 0)
.s1472:
3448 : 8e 01 d6 STX $d601 
344b : a9 1f __ LDA #$1f
344d : 8d 00 d6 STA $d600 
3450 : a9 18 __ LDA #$18
3452 : 8d 00 d6 STA $d600 
.l11598:
3455 : 2c 00 d6 BIT $d600 
3458 : 10 fb __ BPL $3455 ; (main.l11598 + 0)
.s1479:
345a : ad 01 d6 LDA $d601 
345d : 09 80 __ ORA #$80
345f : 85 49 __ STA T16 + 0 
3461 : a9 18 __ LDA #$18
3463 : 8d 00 d6 STA $d600 
.l11600:
3466 : 2c 00 d6 BIT $d600 
3469 : 10 fb __ BPL $3466 ; (main.l11600 + 0)
.s1485:
346b : a5 49 __ LDA T16 + 0 
346d : 8d 01 d6 STA $d601 
3470 : a9 20 __ LDA #$20
3472 : 8d 00 d6 STA $d600 
.l11602:
3475 : 2c 00 d6 BIT $d600 
3478 : 10 fb __ BPL $3475 ; (main.l11602 + 0)
.s1490:
347a : a5 5a __ LDA T4 + 1 
347c : 8d 01 d6 STA $d601 
347f : a9 21 __ LDA #$21
3481 : 8d 00 d6 STA $d600 
.l11604:
3484 : 2c 00 d6 BIT $d600 
3487 : 10 fb __ BPL $3484 ; (main.l11604 + 0)
.s1495:
3489 : a5 59 __ LDA T4 + 0 
348b : 8d 01 d6 STA $d601 
348e : a9 1f __ LDA #$1f
3490 : 8d 00 d6 STA $d600 
3493 : a9 1e __ LDA #$1e
3495 : 8d 00 d6 STA $d600 
.l11606:
3498 : 2c 00 d6 BIT $d600 
349b : 10 fb __ BPL $3498 ; (main.l11606 + 0)
.s1501:
349d : a5 57 __ LDA T3 + 0 
349f : 8d 01 d6 STA $d601 
34a2 : a9 12 __ LDA #$12
34a4 : 8d 00 d6 STA $d600 
.l11608:
34a7 : 2c 00 d6 BIT $d600 
34aa : 10 fb __ BPL $34a7 ; (main.l11608 + 0)
.s1554:
34ac : a5 5e __ LDA T6 + 1 
34ae : 8d 01 d6 STA $d601 
34b1 : a9 13 __ LDA #$13
34b3 : 8d 00 d6 STA $d600 
.l11610:
34b6 : 2c 00 d6 BIT $d600 
34b9 : 10 fb __ BPL $34b6 ; (main.l11610 + 0)
.s1559:
34bb : a5 5d __ LDA T6 + 0 
34bd : 8d 01 d6 STA $d601 
34c0 : a9 1f __ LDA #$1f
34c2 : 8d 00 d6 STA $d600 
34c5 : a9 18 __ LDA #$18
34c7 : 8d 00 d6 STA $d600 
.l11612:
34ca : 2c 00 d6 BIT $d600 
34cd : 10 fb __ BPL $34ca ; (main.l11612 + 0)
.s1566:
34cf : ad 01 d6 LDA $d601 
34d2 : 09 80 __ ORA #$80
34d4 : 85 5d __ STA T6 + 0 
34d6 : a9 18 __ LDA #$18
34d8 : 8d 00 d6 STA $d600 
.l11614:
34db : 2c 00 d6 BIT $d600 
34de : 10 fb __ BPL $34db ; (main.l11614 + 0)
.s1572:
34e0 : a5 5d __ LDA T6 + 0 
34e2 : 8d 01 d6 STA $d601 
34e5 : a9 20 __ LDA #$20
34e7 : 8d 00 d6 STA $d600 
.l11616:
34ea : 2c 00 d6 BIT $d600 
34ed : 10 fb __ BPL $34ea ; (main.l11616 + 0)
.s1577:
34ef : 8c 01 d6 STY $d601 
34f2 : a9 21 __ LDA #$21
34f4 : 8d 00 d6 STA $d600 
.l11618:
34f7 : 2c 00 d6 BIT $d600 
34fa : 10 fb __ BPL $34f7 ; (main.l11618 + 0)
.s1582:
34fc : 8e 01 d6 STX $d601 
34ff : a9 1f __ LDA #$1f
3501 : 8d 00 d6 STA $d600 
3504 : a9 1e __ LDA #$1e
3506 : 8d 00 d6 STA $d600 
.l11620:
3509 : 2c 00 d6 BIT $d600 
350c : 10 fb __ BPL $3509 ; (main.l11620 + 0)
.s1588:
350e : a5 57 __ LDA T3 + 0 
3510 : 8d 01 d6 STA $d601 
3513 : a9 12 __ LDA #$12
3515 : 8d 00 d6 STA $d600 
.l11622:
3518 : 2c 00 d6 BIT $d600 
351b : 10 fb __ BPL $3518 ; (main.l11622 + 0)
.s1641:
351d : 8c 01 d6 STY $d601 
3520 : a9 13 __ LDA #$13
3522 : 8d 00 d6 STA $d600 
.l11624:
3525 : 2c 00 d6 BIT $d600 
3528 : 10 fb __ BPL $3525 ; (main.l11624 + 0)
.s1646:
352a : 8e 01 d6 STX $d601 
352d : a9 1f __ LDA #$1f
352f : 8d 00 d6 STA $d600 
3532 : a9 18 __ LDA #$18
3534 : 8d 00 d6 STA $d600 
.l11626:
3537 : 2c 00 d6 BIT $d600 
353a : 10 fb __ BPL $3537 ; (main.l11626 + 0)
.s1653:
353c : ad 01 d6 LDA $d601 
353f : 09 80 __ ORA #$80
3541 : 85 5d __ STA T6 + 0 
3543 : a9 18 __ LDA #$18
3545 : 8d 00 d6 STA $d600 
.l11628:
3548 : 2c 00 d6 BIT $d600 
354b : 10 fb __ BPL $3548 ; (main.l11628 + 0)
.s1659:
354d : a5 5d __ LDA T6 + 0 
354f : 8d 01 d6 STA $d601 
3552 : a9 20 __ LDA #$20
3554 : 8d 00 d6 STA $d600 
.l11630:
3557 : 2c 00 d6 BIT $d600 
355a : 10 fb __ BPL $3557 ; (main.l11630 + 0)
.s1664:
355c : a5 5c __ LDA T5 + 1 
355e : 8d 01 d6 STA $d601 
3561 : a9 21 __ LDA #$21
3563 : 8d 00 d6 STA $d600 
.l11632:
3566 : 2c 00 d6 BIT $d600 
3569 : 10 fb __ BPL $3566 ; (main.l11632 + 0)
.s1669:
356b : a5 5b __ LDA T5 + 0 
356d : 8d 01 d6 STA $d601 
3570 : a9 1f __ LDA #$1f
3572 : 8d 00 d6 STA $d600 
3575 : a9 1e __ LDA #$1e
3577 : 8d 00 d6 STA $d600 
.l11634:
357a : 2c 00 d6 BIT $d600 
357d : 10 fb __ BPL $357a ; (main.l11634 + 0)
.s1675:
357f : a5 57 __ LDA T3 + 0 
3581 : 8d 01 d6 STA $d601 
3584 : a9 12 __ LDA #$12
3586 : 8d 00 d6 STA $d600 
.l11636:
3589 : 2c 00 d6 BIT $d600 
358c : 10 fb __ BPL $3589 ; (main.l11636 + 0)
.s1728:
358e : a5 60 __ LDA T7 + 1 
3590 : 8d 01 d6 STA $d601 
3593 : a9 13 __ LDA #$13
3595 : 8d 00 d6 STA $d600 
.l11638:
3598 : 2c 00 d6 BIT $d600 
359b : 10 fb __ BPL $3598 ; (main.l11638 + 0)
.s1733:
359d : a5 5f __ LDA T7 + 0 
359f : 8d 01 d6 STA $d601 
35a2 : a9 1f __ LDA #$1f
35a4 : 8d 00 d6 STA $d600 
35a7 : a9 18 __ LDA #$18
35a9 : 8d 00 d6 STA $d600 
.l11640:
35ac : 2c 00 d6 BIT $d600 
35af : 10 fb __ BPL $35ac ; (main.l11640 + 0)
.s1740:
35b1 : ad 01 d6 LDA $d601 
35b4 : 09 80 __ ORA #$80
35b6 : 85 5d __ STA T6 + 0 
35b8 : a9 18 __ LDA #$18
35ba : 8d 00 d6 STA $d600 
.l11642:
35bd : 2c 00 d6 BIT $d600 
35c0 : 10 fb __ BPL $35bd ; (main.l11642 + 0)
.s1746:
35c2 : a5 5d __ LDA T6 + 0 
35c4 : 8d 01 d6 STA $d601 
35c7 : a9 20 __ LDA #$20
35c9 : 8d 00 d6 STA $d600 
.l11644:
35cc : 2c 00 d6 BIT $d600 
35cf : 10 fb __ BPL $35cc ; (main.l11644 + 0)
.s1751:
35d1 : 8c 01 d6 STY $d601 
35d4 : a9 21 __ LDA #$21
35d6 : 8d 00 d6 STA $d600 
.l11646:
35d9 : 2c 00 d6 BIT $d600 
35dc : 10 fb __ BPL $35d9 ; (main.l11646 + 0)
.s1756:
35de : 8e 01 d6 STX $d601 
35e1 : a9 1f __ LDA #$1f
35e3 : 8d 00 d6 STA $d600 
35e6 : a9 1e __ LDA #$1e
35e8 : 8d 00 d6 STA $d600 
.l11648:
35eb : 2c 00 d6 BIT $d600 
35ee : 10 fb __ BPL $35eb ; (main.l11648 + 0)
.s1762:
35f0 : a5 57 __ LDA T3 + 0 
35f2 : 8d 01 d6 STA $d601 
.s1410:
35f5 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
35f8 : 18 __ __ CLC
35f9 : 65 59 __ ADC T4 + 0 
35fb : 85 59 __ STA T4 + 0 
35fd : ad 22 5a LDA $5a22 ; (vdc_state + 4)
3600 : 65 5a __ ADC T4 + 1 
3602 : 85 5a __ STA T4 + 1 
3604 : 18 __ __ CLC
3605 : a5 5b __ LDA T5 + 0 
3607 : 6d 21 5a ADC $5a21 ; (vdc_state + 3)
360a : 85 5b __ STA T5 + 0 
360c : a5 5c __ LDA T5 + 1 
360e : 6d 22 5a ADC $5a22 ; (vdc_state + 4)
3611 : e6 61 __ INC T8 + 0 
3613 : 4c ec 2c JMP $2cec ; (main.l1406 + 0)
.s1411:
3616 : a5 59 __ LDA T4 + 0 
3618 : 85 0f __ STA P2 
361a : a5 5a __ LDA T4 + 1 
361c : 85 10 __ STA P3 
361e : 20 38 14 JSR $1438 ; (bnk_cpyfromvdc@proxy + 0)
3621 : a5 5d __ LDA T6 + 0 
3623 : 85 0d __ STA P0 
3625 : a5 5e __ LDA T6 + 1 
3627 : 85 0e __ STA P1 
3629 : 20 ea 14 JSR $14ea ; (bnk_cpytovdc@proxy + 0)
362c : a5 5b __ LDA T5 + 0 
362e : 85 0f __ STA P2 
3630 : a5 5c __ LDA T5 + 1 
3632 : 85 10 __ STA P3 
3634 : 20 be 14 JSR $14be ; (bnk_cpyfromvdc@proxy + 0)
3637 : a5 5f __ LDA T7 + 0 
3639 : 85 0d __ STA P0 
363b : a5 60 __ LDA T7 + 1 
363d : 85 0e __ STA P1 
363f : 20 ea 14 JSR $14ea ; (bnk_cpytovdc@proxy + 0)
3642 : 4c f5 35 JMP $35f5 ; (main.s1410 + 0)
.s1318:
3645 : 85 61 __ STA T8 + 0 
3647 : ad 50 bf LDA $bf50 ; (window + 5)
364a : 85 43 __ STA T10 + 0 
364c : 18 __ __ CLC
364d : 6d 4c bf ADC $bf4c ; (window + 1)
3650 : 0a __ __ ASL
3651 : aa __ __ TAX
3652 : a9 12 __ LDA #$12
3654 : 8d 00 d6 STA $d600 
3657 : ad ee 58 LDA $58ee ; (p2smap + 1)
365a : 49 20 __ EOR #$20
365c : 85 47 __ STA T14 + 0 
365e : 18 __ __ CLC
365f : a5 61 __ LDA T8 + 0 
3661 : 6d 4b bf ADC $bf4b ; (window + 0)
3664 : 18 __ __ CLC
3665 : 7d 37 5a ADC $5a37,x ; (multab + 0)
3668 : 85 59 __ STA T4 + 0 
366a : a9 00 __ LDA #$00
366c : 7d 38 5a ADC $5a38,x ; (multab + 1)
366f : 85 5a __ STA T4 + 1 
3671 : 18 __ __ CLC
3672 : a5 59 __ LDA T4 + 0 
3674 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
3677 : a8 __ __ TAY
3678 : a5 5a __ LDA T4 + 1 
367a : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
367d : ae 25 5a LDX $5a25 ; (vdc_state + 7)
.l11566:
3680 : 2c 00 d6 BIT $d600 
3683 : 10 fb __ BPL $3680 ; (main.l11566 + 0)
.s1334:
3685 : 8d 01 d6 STA $d601 
3688 : a9 13 __ LDA #$13
368a : 8d 00 d6 STA $d600 
.l11568:
368d : 2c 00 d6 BIT $d600 
3690 : 10 fb __ BPL $368d ; (main.l11568 + 0)
.s1339:
3692 : 8c 01 d6 STY $d601 
3695 : a9 1f __ LDA #$1f
3697 : 8d 00 d6 STA $d600 
.l11570:
369a : 2c 00 d6 BIT $d600 
369d : 10 fb __ BPL $369a ; (main.l11570 + 0)
.s1343:
369f : a5 47 __ LDA T14 + 0 
36a1 : 8d 01 d6 STA $d601 
36a4 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
36a7 : 18 __ __ CLC
36a8 : 65 59 __ ADC T4 + 0 
36aa : a8 __ __ TAY
36ab : a9 12 __ LDA #$12
36ad : 8d 00 d6 STA $d600 
36b0 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
36b3 : 65 5a __ ADC T4 + 1 
.l11572:
36b5 : 2c 00 d6 BIT $d600 
36b8 : 10 fb __ BPL $36b5 ; (main.l11572 + 0)
.s1350:
36ba : 8d 01 d6 STA $d601 
36bd : a9 13 __ LDA #$13
36bf : 8d 00 d6 STA $d600 
.l11574:
36c2 : 2c 00 d6 BIT $d600 
36c5 : 10 fb __ BPL $36c2 ; (main.l11574 + 0)
.s1355:
36c7 : 8c 01 d6 STY $d601 
36ca : a9 1f __ LDA #$1f
36cc : 8d 00 d6 STA $d600 
.l11576:
36cf : 2c 00 d6 BIT $d600 
36d2 : 10 fb __ BPL $36cf ; (main.l11576 + 0)
.s1359:
36d4 : 8e 01 d6 STX $d601 
36d7 : a6 61 __ LDX T8 + 0 
36d9 : e8 __ __ INX
36da : 8e 4f bf STX $bf4f ; (window + 4)
36dd : ec 4d bf CPX $bf4d ; (window + 2)
36e0 : f0 03 __ BEQ $36e5 ; (main.s1360 + 0)
36e2 : 4c a1 29 JMP $29a1 ; (main.s8479 + 0)
.s1360:
36e5 : a9 00 __ LDA #$00
36e7 : 8d 4f bf STA $bf4f ; (window + 4)
36ea : 18 __ __ CLC
36eb : a5 43 __ LDA T10 + 0 
36ed : 69 01 __ ADC #$01
36ef : 8d 50 bf STA $bf50 ; (window + 5)
36f2 : cd 4e bf CMP $bf4e ; (window + 3)
36f5 : f0 03 __ BEQ $36fa ; (main.s1363 + 0)
36f7 : 4c a1 29 JMP $29a1 ; (main.s8479 + 0)
.s1363:
36fa : a5 43 __ LDA T10 + 0 
36fc : 8d 50 bf STA $bf50 ; (window + 5)
36ff : a9 4b __ LDA #$4b
3701 : a0 02 __ LDY #$02
3703 : 91 23 __ STA (SP + 0),y 
3705 : a9 bf __ LDA #$bf
3707 : c8 __ __ INY
3708 : 91 23 __ STA (SP + 0),y 
370a : a9 fe __ LDA #$fe
370c : c8 __ __ INY
370d : 91 23 __ STA (SP + 0),y 
370f : a9 4f __ LDA #$4f
3711 : c8 __ __ INY
3712 : 91 23 __ STA (SP + 0),y 
3714 : 20 0a 53 JSR $530a ; (vdcwin_printline.s1000 + 0)
3717 : 4c a1 29 JMP $29a1 ; (main.s8479 + 0)
.s1307:
371a : a9 00 __ LDA #$00
371c : 9d ca be STA $beca,x ; (wrapbuffer + 0)
371f : aa __ __ TAX
3720 : ad ca be LDA $beca ; (wrapbuffer + 0)
3723 : f0 08 __ BEQ $372d ; (main.s1313 + 0)
.l1714:
3725 : bd cb be LDA $becb,x ; (wrapbuffer + 1)
3728 : e8 __ __ INX
3729 : 09 00 __ ORA #$00
372b : d0 f8 __ BNE $3725 ; (main.l1714 + 0)
.s1313:
372d : 8a __ __ TXA
372e : 18 __ __ CLC
372f : 6d 4f bf ADC $bf4f ; (window + 4)
3732 : b0 06 __ BCS $373a ; (main.s1315 + 0)
.s1274:
3734 : c5 5b __ CMP T5 + 0 
3736 : 90 1a __ BCC $3752 ; (main.s1317 + 0)
.s1753:
3738 : f0 18 __ BEQ $3752 ; (main.s1317 + 0)
.s1315:
373a : a9 4b __ LDA #$4b
373c : a0 02 __ LDY #$02
373e : 91 23 __ STA (SP + 0),y 
3740 : a9 bf __ LDA #$bf
3742 : c8 __ __ INY
3743 : 91 23 __ STA (SP + 0),y 
3745 : a9 fe __ LDA #$fe
3747 : c8 __ __ INY
3748 : 91 23 __ STA (SP + 0),y 
374a : a9 4f __ LDA #$4f
374c : c8 __ __ INY
374d : 91 23 __ STA (SP + 0),y 
374f : 20 0a 53 JSR $530a ; (vdcwin_printline.s1000 + 0)
.s1317:
3752 : a9 4b __ LDA #$4b
3754 : a0 02 __ LDY #$02
3756 : 91 23 __ STA (SP + 0),y 
3758 : a9 bf __ LDA #$bf
375a : c8 __ __ INY
375b : 91 23 __ STA (SP + 0),y 
375d : a9 ca __ LDA #$ca
375f : c8 __ __ INY
3760 : 91 23 __ STA (SP + 0),y 
3762 : a9 be __ LDA #$be
3764 : c8 __ __ INY
3765 : 91 23 __ STA (SP + 0),y 
3767 : 20 e3 55 JSR $55e3 ; (vdcwin_put_string.s1000 + 0)
376a : a5 61 __ LDA T8 + 0 
376c : c5 59 __ CMP T4 + 0 
376e : 90 03 __ BCC $3773 ; (main.s7845 + 0)
3770 : 4c 99 29 JMP $2999 ; (main.s1283 + 0)
.s7845:
3773 : a9 00 __ LDA #$00
3775 : 85 43 __ STA T10 + 0 
3777 : a9 ff __ LDA #$ff
3779 : 85 60 __ STA T7 + 1 
377b : 85 5e __ STA T6 + 1 
377d : 4c 79 29 JMP $2979 ; (main.l1292 + 0)
.s1294:
3780 : a6 61 __ LDX T8 + 0 
3782 : bd 00 5b LDA $5b00,x ; (linebuffer + 0)
3785 : a6 43 __ LDX T10 + 0 
3787 : 9d ca be STA $beca,x ; (wrapbuffer + 0)
378a : c9 20 __ CMP #$20
378c : d0 06 __ BNE $3794 ; (main.s1298 + 0)
.s1304:
378e : a9 00 __ LDA #$00
3790 : 85 60 __ STA T7 + 1 
3792 : f0 08 __ BEQ $379c ; (main.s8480 + 0)
.s1298:
3794 : 24 5e __ BIT T6 + 1 
3796 : 10 04 __ BPL $379c ; (main.s8480 + 0)
.s1301:
3798 : a9 00 __ LDA #$00
379a : 85 5e __ STA T6 + 1 
.s8480:
379c : e6 61 __ INC T8 + 0 
379e : e6 43 __ INC T10 + 0 
37a0 : 4c 79 29 JMP $2979 ; (main.l1292 + 0)
.s1098:
37a3 : 98 __ __ TYA
37a4 : 0a __ __ ASL
37a5 : aa __ __ TAX
37a6 : bd 37 5a LDA $5a37,x ; (multab + 0)
37a9 : 18 __ __ CLC
37aa : 69 4b __ ADC #$4b
37ac : 85 59 __ STA T4 + 0 
37ae : a9 12 __ LDA #$12
37b0 : 8d 00 d6 STA $d600 
37b3 : bd 38 5a LDA $5a38,x ; (multab + 1)
37b6 : 69 00 __ ADC #$00
37b8 : 85 5a __ STA T4 + 1 
37ba : 18 __ __ CLC
37bb : a5 59 __ LDA T4 + 0 
37bd : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
37c0 : aa __ __ TAX
37c1 : a5 5a __ LDA T4 + 1 
37c3 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11496:
37c6 : 2c 00 d6 BIT $d600 
37c9 : 10 fb __ BPL $37c6 ; (main.l11496 + 0)
.s1110:
37cb : 8d 01 d6 STA $d601 
37ce : a9 13 __ LDA #$13
37d0 : 8d 00 d6 STA $d600 
.l11498:
37d3 : 2c 00 d6 BIT $d600 
37d6 : 10 fb __ BPL $37d3 ; (main.l11498 + 0)
.s1115:
37d8 : 8e 01 d6 STX $d601 
37db : a9 1f __ LDA #$1f
37dd : 8d 00 d6 STA $d600 
.l11500:
37e0 : 2c 00 d6 BIT $d600 
37e3 : 10 fb __ BPL $37e0 ; (main.l11500 + 0)
.s1119:
37e5 : a9 61 __ LDA #$61
37e7 : 8d 01 d6 STA $d601 
37ea : ad 28 5a LDA $5a28 ; (vdc_state + 10)
37ed : 18 __ __ CLC
37ee : 65 59 __ ADC T4 + 0 
37f0 : aa __ __ TAX
37f1 : a9 12 __ LDA #$12
37f3 : 8d 00 d6 STA $d600 
37f6 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
37f9 : 65 5a __ ADC T4 + 1 
.l11502:
37fb : 2c 00 d6 BIT $d600 
37fe : 10 fb __ BPL $37fb ; (main.l11502 + 0)
.s1126:
3800 : 8d 01 d6 STA $d601 
3803 : a9 13 __ LDA #$13
3805 : 8d 00 d6 STA $d600 
.l11504:
3808 : 2c 00 d6 BIT $d600 
380b : 10 fb __ BPL $3808 ; (main.l11504 + 0)
.s1131:
380d : 8e 01 d6 STX $d601 
3810 : a9 1f __ LDA #$1f
3812 : 8d 00 d6 STA $d600 
.l11506:
3815 : 2c 00 d6 BIT $d600 
3818 : 10 fb __ BPL $3815 ; (main.l11506 + 0)
.s1135:
381a : a9 09 __ LDA #$09
381c : 8d 01 d6 STA $d601 
381f : c8 __ __ INY
3820 : 4c ee 26 JMP $26ee ; (main.l1097 + 0)
.s1058:
3823 : 98 __ __ TYA
3824 : 0a __ __ ASL
3825 : aa __ __ TAX
3826 : bd 37 5a LDA $5a37,x ; (multab + 0)
3829 : 18 __ __ CLC
382a : 69 04 __ ADC #$04
382c : 85 57 __ STA T3 + 0 
382e : a9 12 __ LDA #$12
3830 : 8d 00 d6 STA $d600 
3833 : bd 38 5a LDA $5a38,x ; (multab + 1)
3836 : 69 00 __ ADC #$00
3838 : 85 58 __ STA T3 + 1 
383a : 18 __ __ CLC
383b : a5 57 __ LDA T3 + 0 
383d : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
3840 : aa __ __ TAX
3841 : a5 58 __ LDA T3 + 1 
3843 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11483:
3846 : 2c 00 d6 BIT $d600 
3849 : 10 fb __ BPL $3846 ; (main.l11483 + 0)
.s1070:
384b : 8d 01 d6 STA $d601 
384e : a9 13 __ LDA #$13
3850 : 8d 00 d6 STA $d600 
.l11485:
3853 : 2c 00 d6 BIT $d600 
3856 : 10 fb __ BPL $3853 ; (main.l11485 + 0)
.s1075:
3858 : 8e 01 d6 STX $d601 
385b : a9 1f __ LDA #$1f
385d : 8d 00 d6 STA $d600 
.l11487:
3860 : 2c 00 d6 BIT $d600 
3863 : 10 fb __ BPL $3860 ; (main.l11487 + 0)
.s1079:
3865 : a9 e1 __ LDA #$e1
3867 : 8d 01 d6 STA $d601 
386a : ad 28 5a LDA $5a28 ; (vdc_state + 10)
386d : 18 __ __ CLC
386e : 65 57 __ ADC T3 + 0 
3870 : aa __ __ TAX
3871 : a9 12 __ LDA #$12
3873 : 8d 00 d6 STA $d600 
3876 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
3879 : 65 58 __ ADC T3 + 1 
.l11489:
387b : 2c 00 d6 BIT $d600 
387e : 10 fb __ BPL $387b ; (main.l11489 + 0)
.s1086:
3880 : 8d 01 d6 STA $d601 
3883 : a9 13 __ LDA #$13
3885 : 8d 00 d6 STA $d600 
.l11491:
3888 : 2c 00 d6 BIT $d600 
388b : 10 fb __ BPL $3888 ; (main.l11491 + 0)
.s1091:
388d : 8e 01 d6 STX $d601 
3890 : a9 1f __ LDA #$1f
3892 : 8d 00 d6 STA $d600 
.l11493:
3895 : 2c 00 d6 BIT $d600 
3898 : 10 fb __ BPL $3895 ; (main.l11493 + 0)
.s1095:
389a : a9 09 __ LDA #$09
389c : 8d 01 d6 STA $d601 
389f : c8 __ __ INY
38a0 : 4c d2 26 JMP $26d2 ; (main.l1057 + 0)
.s753:
38a3 : 0a __ __ ASL
38a4 : aa __ __ TAX
38a5 : ad 25 5a LDA $5a25 ; (vdc_state + 7)
38a8 : 85 43 __ STA T10 + 0 
38aa : a9 12 __ LDA #$12
38ac : 8d 00 d6 STA $d600 
38af : a5 5b __ LDA T5 + 0 
38b1 : 38 __ __ SEC
38b2 : e9 01 __ SBC #$01
38b4 : 85 62 __ STA T12 + 0 
38b6 : bd 37 5a LDA $5a37,x ; (multab + 0)
38b9 : 85 5f __ STA T7 + 0 
38bb : 18 __ __ CLC
38bc : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
38bf : a8 __ __ TAY
38c0 : bd 38 5a LDA $5a38,x ; (multab + 1)
38c3 : 85 60 __ STA T7 + 1 
38c5 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11895:
38c8 : 2c 00 d6 BIT $d600 
38cb : 10 fb __ BPL $38c8 ; (main.l11895 + 0)
.s765:
38cd : 8d 01 d6 STA $d601 
38d0 : a9 13 __ LDA #$13
38d2 : 8d 00 d6 STA $d600 
.l11897:
38d5 : 2c 00 d6 BIT $d600 
38d8 : 10 fb __ BPL $38d5 ; (main.l11897 + 0)
.s770:
38da : 8c 01 d6 STY $d601 
38dd : a9 1f __ LDA #$1f
38df : 8d 00 d6 STA $d600 
.l11899:
38e2 : 2c 00 d6 BIT $d600 
38e5 : 10 fb __ BPL $38e2 ; (main.l11899 + 0)
.s774:
38e7 : a9 20 __ LDA #$20
38e9 : 8d 01 d6 STA $d601 
38ec : a9 18 __ LDA #$18
38ee : 8d 00 d6 STA $d600 
.l11901:
38f1 : 2c 00 d6 BIT $d600 
38f4 : 10 fb __ BPL $38f1 ; (main.l11901 + 0)
.s780:
38f6 : ad 01 d6 LDA $d601 
38f9 : 29 7f __ AND #$7f
38fb : a8 __ __ TAY
38fc : a9 18 __ LDA #$18
38fe : 8d 00 d6 STA $d600 
.l11903:
3901 : 2c 00 d6 BIT $d600 
3904 : 10 fb __ BPL $3901 ; (main.l11903 + 0)
.s786:
3906 : 8c 01 d6 STY $d601 
3909 : a9 1e __ LDA #$1e
390b : 8d 00 d6 STA $d600 
.l11905:
390e : 2c 00 d6 BIT $d600 
3911 : 10 fb __ BPL $390e ; (main.l11905 + 0)
.s791:
3913 : a5 62 __ LDA T12 + 0 
3915 : 8d 01 d6 STA $d601 
3918 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
391b : 18 __ __ CLC
391c : 65 5f __ ADC T7 + 0 
391e : aa __ __ TAX
391f : a9 12 __ LDA #$12
3921 : 8d 00 d6 STA $d600 
3924 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
3927 : 65 60 __ ADC T7 + 1 
.l11907:
3929 : 2c 00 d6 BIT $d600 
392c : 10 fb __ BPL $3929 ; (main.l11907 + 0)
.s798:
392e : 8d 01 d6 STA $d601 
3931 : a9 13 __ LDA #$13
3933 : 8d 00 d6 STA $d600 
.l11909:
3936 : 2c 00 d6 BIT $d600 
3939 : 10 fb __ BPL $3936 ; (main.l11909 + 0)
.s803:
393b : 8e 01 d6 STX $d601 
393e : a9 1f __ LDA #$1f
3940 : 8d 00 d6 STA $d600 
.l11911:
3943 : 2c 00 d6 BIT $d600 
3946 : 10 fb __ BPL $3943 ; (main.l11911 + 0)
.s807:
3948 : a5 43 __ LDA T10 + 0 
394a : 8d 01 d6 STA $d601 
394d : a9 18 __ LDA #$18
394f : 8d 00 d6 STA $d600 
.l11913:
3952 : 2c 00 d6 BIT $d600 
3955 : 10 fb __ BPL $3952 ; (main.l11913 + 0)
.s813:
3957 : ad 01 d6 LDA $d601 
395a : 29 7f __ AND #$7f
395c : aa __ __ TAX
395d : a9 18 __ LDA #$18
395f : 8d 00 d6 STA $d600 
.l11915:
3962 : 2c 00 d6 BIT $d600 
3965 : 10 fb __ BPL $3962 ; (main.l11915 + 0)
.s819:
3967 : 8e 01 d6 STX $d601 
396a : a9 1e __ LDA #$1e
396c : 8d 00 d6 STA $d600 
.l11917:
396f : 2c 00 d6 BIT $d600 
3972 : 10 fb __ BPL $396f ; (main.l11917 + 0)
.s824:
3974 : a5 62 __ LDA T12 + 0 
3976 : 8d 01 d6 STA $d601 
3979 : e6 61 __ INC T8 + 0 
397b : 4c 4a 23 JMP $234a ; (main.l752 + 0)
.s701:
397e : ad 26 bf LDA $bf26 ; (softscroll + 11)
3981 : 69 02 __ ADC #$02
3983 : 8d 26 bf STA $bf26 ; (softscroll + 11)
3986 : 90 03 __ BCC $398b ; (main.s1761 + 0)
.s1760:
3988 : ee 27 bf INC $bf27 ; (softscroll + 12)
.s1761:
398b : a9 01 __ LDA #$01
398d : cd 23 bf CMP $bf23 ; (softscroll + 8)
3990 : b0 03 __ BCS $3995 ; (main.s706 + 0)
3992 : 4c 25 3a JMP $3a25 ; (main.s705 + 0)
.s706:
3995 : a9 06 __ LDA #$06
3997 : 8d 23 bf STA $bf23 ; (softscroll + 8)
399a : ad 20 bf LDA $bf20 ; (softscroll + 5)
399d : 18 __ __ CLC
399e : 69 01 __ ADC #$01
39a0 : 85 5d __ STA T6 + 0 
39a2 : 8d 20 bf STA $bf20 ; (softscroll + 5)
39a5 : ad 21 bf LDA $bf21 ; (softscroll + 6)
39a8 : 69 00 __ ADC #$00
39aa : 85 5e __ STA T6 + 1 
39ac : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l11926:
39af : ad 00 d6 LDA $d600 
39b2 : 29 20 __ AND #$20
39b4 : d0 f9 __ BNE $39af ; (main.l11926 + 0)
.s716:
39b6 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
39b9 : 18 __ __ CLC
39ba : 65 5d __ ADC T6 + 0 
39bc : aa __ __ TAX
39bd : ad 29 5a LDA $5a29 ; (vdc_state + 11)
39c0 : 65 5e __ ADC T6 + 1 
39c2 : a8 __ __ TAY
39c3 : ad 26 5a LDA $5a26 ; (vdc_state + 8)
39c6 : 18 __ __ CLC
39c7 : 65 5d __ ADC T6 + 0 
39c9 : 85 5d __ STA T6 + 0 
39cb : a9 0c __ LDA #$0c
39cd : 8d 00 d6 STA $d600 
39d0 : ad 27 5a LDA $5a27 ; (vdc_state + 9)
39d3 : 65 5e __ ADC T6 + 1 
.l11928:
39d5 : 2c 00 d6 BIT $d600 
39d8 : 10 fb __ BPL $39d5 ; (main.l11928 + 0)
.s724:
39da : 8d 01 d6 STA $d601 
39dd : a9 0d __ LDA #$0d
39df : 8d 00 d6 STA $d600 
.l11930:
39e2 : 2c 00 d6 BIT $d600 
39e5 : 10 fb __ BPL $39e2 ; (main.l11930 + 0)
.s729:
39e7 : a5 5d __ LDA T6 + 0 
39e9 : 8d 01 d6 STA $d601 
39ec : a9 14 __ LDA #$14
39ee : 8d 00 d6 STA $d600 
.l11932:
39f1 : 2c 00 d6 BIT $d600 
39f4 : 10 fb __ BPL $39f1 ; (main.l11932 + 0)
.s734:
39f6 : 8c 01 d6 STY $d601 
39f9 : a9 15 __ LDA #$15
39fb : 8d 00 d6 STA $d600 
.l11934:
39fe : 2c 00 d6 BIT $d600 
3a01 : 10 fb __ BPL $39fe ; (main.l11934 + 0)
.s739:
3a03 : 8e 01 d6 STX $d601 
.l11936:
3a06 : ad 00 d6 LDA $d600 
3a09 : 29 20 __ AND #$20
3a0b : f0 f9 __ BEQ $3a06 ; (main.l11936 + 0)
.s740:
3a0d : a9 19 __ LDA #$19
3a0f : 8d 00 d6 STA $d600 
3a12 : ad 25 bf LDA $bf25 ; (softscroll + 10)
3a15 : 18 __ __ CLC
3a16 : 69 06 __ ADC #$06
.l11892:
3a18 : 2c 00 d6 BIT $d600 
3a1b : 10 fb __ BPL $3a18 ; (main.l11892 + 0)
.s17233:
3a1d : 8d 01 d6 STA $d601 
3a20 : a5 1b __ LDA ACCU + 0 
3a22 : 4c 35 23 JMP $2335 ; (main.s748 + 0)
.s705:
3a25 : ad 23 bf LDA $bf23 ; (softscroll + 8)
3a28 : 38 __ __ SEC
3a29 : e9 02 __ SBC #$02
3a2b : 8d 23 bf STA $bf23 ; (softscroll + 8)
3a2e : aa __ __ TAX
.l11891:
3a2f : ad 00 d6 LDA $d600 
3a32 : 29 20 __ AND #$20
3a34 : f0 f9 __ BEQ $3a2f ; (main.l11891 + 0)
.s708:
3a36 : a9 19 __ LDA #$19
3a38 : 8d 00 d6 STA $d600 
3a3b : 8a __ __ TXA
3a3c : 18 __ __ CLC
3a3d : 6d 25 bf ADC $bf25 ; (softscroll + 10)
3a40 : 4c 18 3a JMP $3a18 ; (main.l11892 + 0)
.s653:
3a43 : a9 00 __ LDA #$00
3a45 : 8d 23 bf STA $bf23 ; (softscroll + 8)
3a48 : ad 20 bf LDA $bf20 ; (softscroll + 5)
3a4b : 18 __ __ CLC
3a4c : 69 ff __ ADC #$ff
3a4e : 85 5d __ STA T6 + 0 
3a50 : 8d 20 bf STA $bf20 ; (softscroll + 5)
3a53 : ad 21 bf LDA $bf21 ; (softscroll + 6)
3a56 : 69 ff __ ADC #$ff
3a58 : 85 5e __ STA T6 + 1 
3a5a : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l11874:
3a5d : ad 00 d6 LDA $d600 
3a60 : 29 20 __ AND #$20
3a62 : d0 f9 __ BNE $3a5d ; (main.l11874 + 0)
.s656:
3a64 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
3a67 : 18 __ __ CLC
3a68 : 65 5d __ ADC T6 + 0 
3a6a : aa __ __ TAX
3a6b : ad 29 5a LDA $5a29 ; (vdc_state + 11)
3a6e : 65 5e __ ADC T6 + 1 
3a70 : a8 __ __ TAY
3a71 : ad 26 5a LDA $5a26 ; (vdc_state + 8)
3a74 : 18 __ __ CLC
3a75 : 65 5d __ ADC T6 + 0 
3a77 : 85 5d __ STA T6 + 0 
3a79 : a9 0c __ LDA #$0c
3a7b : 8d 00 d6 STA $d600 
3a7e : ad 27 5a LDA $5a27 ; (vdc_state + 9)
3a81 : 65 5e __ ADC T6 + 1 
.l11876:
3a83 : 2c 00 d6 BIT $d600 
3a86 : 10 fb __ BPL $3a83 ; (main.l11876 + 0)
.s664:
3a88 : 8d 01 d6 STA $d601 
3a8b : a9 0d __ LDA #$0d
3a8d : 8d 00 d6 STA $d600 
.l11878:
3a90 : 2c 00 d6 BIT $d600 
3a93 : 10 fb __ BPL $3a90 ; (main.l11878 + 0)
.s669:
3a95 : a5 5d __ LDA T6 + 0 
3a97 : 8d 01 d6 STA $d601 
3a9a : a9 14 __ LDA #$14
3a9c : 8d 00 d6 STA $d600 
.l11880:
3a9f : 2c 00 d6 BIT $d600 
3aa2 : 10 fb __ BPL $3a9f ; (main.l11880 + 0)
.s674:
3aa4 : 8c 01 d6 STY $d601 
3aa7 : a9 15 __ LDA #$15
3aa9 : 8d 00 d6 STA $d600 
.l11882:
3aac : 2c 00 d6 BIT $d600 
3aaf : 10 fb __ BPL $3aac ; (main.l11882 + 0)
.s679:
3ab1 : 8e 01 d6 STX $d601 
.l11884:
3ab4 : ad 00 d6 LDA $d600 
3ab7 : 29 20 __ AND #$20
3ab9 : f0 f9 __ BEQ $3ab4 ; (main.l11884 + 0)
.l685:
3abb : ad 00 d6 LDA $d600 
3abe : 29 20 __ AND #$20
3ac0 : d0 f9 __ BNE $3abb ; (main.l685 + 0)
.s680:
3ac2 : a9 19 __ LDA #$19
3ac4 : 8d 00 d6 STA $d600 
3ac7 : ae 25 bf LDX $bf25 ; (softscroll + 10)
.l11886:
3aca : 2c 00 d6 BIT $d600 
3acd : 10 fb __ BPL $3aca ; (main.l11886 + 0)
.s691:
3acf : 8a __ __ TXA
3ad0 : 4c 00 23 JMP $2300 ; (main.s1718 + 0)
.l600:
3ad3 : ad 00 d6 LDA $d600 
3ad6 : 29 20 __ AND #$20
3ad8 : f0 f9 __ BEQ $3ad3 ; (main.l600 + 0)
.l609:
3ada : ad 00 d6 LDA $d600 
3add : 29 20 __ AND #$20
3adf : d0 f9 __ BNE $3ada ; (main.l609 + 0)
.s604:
3ae1 : 8a __ __ TXA
3ae2 : 18 __ __ CLC
3ae3 : 69 02 __ ADC #$02
3ae5 : 8d 28 bf STA $bf28 ; (softscroll + 13)
3ae8 : 90 01 __ BCC $3aeb ; (main.s1763 + 0)
.s1762:
3aea : c8 __ __ INY
.s1763:
3aeb : 8c 29 bf STY $bf29 ; (softscroll + 14)
3aee : ee 22 bf INC $bf22 ; (softscroll + 7)
3af1 : ee 22 bf INC $bf22 ; (softscroll + 7)
3af4 : a9 06 __ LDA #$06
3af6 : cd 22 bf CMP $bf22 ; (softscroll + 7)
3af9 : a9 18 __ LDA #$18
3afb : 8d 00 d6 STA $d600 
3afe : ae 24 bf LDX $bf24 ; (softscroll + 9)
3b01 : 90 10 __ BCC $3b13 ; (main.s611 + 0)
.s612:
3b03 : 8a __ __ TXA
3b04 : 18 __ __ CLC
3b05 : 6d 22 bf ADC $bf22 ; (softscroll + 7)
.l11944:
3b08 : 2c 00 d6 BIT $d600 
3b0b : 10 fb __ BPL $3b08 ; (main.l11944 + 0)
.s1717:
3b0d : 8d 01 d6 STA $d601 
3b10 : 4c c0 22 JMP $22c0 ; (main.s598 + 0)
.s611:
3b13 : a9 00 __ LDA #$00
3b15 : 8d 22 bf STA $bf22 ; (softscroll + 7)
3b18 : ad 20 bf LDA $bf20 ; (softscroll + 5)
3b1b : 6d 1e bf ADC $bf1e ; (softscroll + 3)
3b1e : 85 5d __ STA T6 + 0 
3b20 : 8d 20 bf STA $bf20 ; (softscroll + 5)
3b23 : ad 21 bf LDA $bf21 ; (softscroll + 6)
3b26 : 69 00 __ ADC #$00
3b28 : 85 5e __ STA T6 + 1 
3b2a : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l11861:
3b2d : 2c 00 d6 BIT $d600 
3b30 : 10 fb __ BPL $3b2d ; (main.l11861 + 0)
.s618:
3b32 : 8e 01 d6 STX $d601 
3b35 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
3b38 : 18 __ __ CLC
3b39 : 65 5d __ ADC T6 + 0 
3b3b : aa __ __ TAX
3b3c : ad 29 5a LDA $5a29 ; (vdc_state + 11)
3b3f : 65 5e __ ADC T6 + 1 
3b41 : a8 __ __ TAY
3b42 : ad 26 5a LDA $5a26 ; (vdc_state + 8)
3b45 : 18 __ __ CLC
3b46 : 65 5d __ ADC T6 + 0 
3b48 : 85 5d __ STA T6 + 0 
3b4a : a9 0c __ LDA #$0c
3b4c : 8d 00 d6 STA $d600 
3b4f : ad 27 5a LDA $5a27 ; (vdc_state + 9)
3b52 : 65 5e __ ADC T6 + 1 
.l11863:
3b54 : 2c 00 d6 BIT $d600 
3b57 : 10 fb __ BPL $3b54 ; (main.l11863 + 0)
.s624:
3b59 : 8d 01 d6 STA $d601 
3b5c : a9 0d __ LDA #$0d
3b5e : 8d 00 d6 STA $d600 
.l11865:
3b61 : 2c 00 d6 BIT $d600 
3b64 : 10 fb __ BPL $3b61 ; (main.l11865 + 0)
.s629:
3b66 : a5 5d __ LDA T6 + 0 
3b68 : 8d 01 d6 STA $d601 
3b6b : a9 14 __ LDA #$14
3b6d : 8d 00 d6 STA $d600 
.l11867:
3b70 : 2c 00 d6 BIT $d600 
3b73 : 10 fb __ BPL $3b70 ; (main.l11867 + 0)
.s634:
3b75 : 8c 01 d6 STY $d601 
3b78 : a9 15 __ LDA #$15
3b7a : 8d 00 d6 STA $d600 
.l11869:
3b7d : 2c 00 d6 BIT $d600 
3b80 : 10 fb __ BPL $3b7d ; (main.l11869 + 0)
.s639:
3b82 : 8a __ __ TXA
3b83 : 4c 0d 3b JMP $3b0d ; (main.s1717 + 0)
.l548:
3b86 : ad 00 d6 LDA $d600 
3b89 : 29 20 __ AND #$20
3b8b : f0 f9 __ BEQ $3b86 ; (main.l548 + 0)
.l557:
3b8d : ad 00 d6 LDA $d600 
3b90 : 29 20 __ AND #$20
3b92 : d0 f9 __ BNE $3b8d ; (main.l557 + 0)
.s552:
3b94 : 8a __ __ TXA
3b95 : 38 __ __ SEC
3b96 : e9 02 __ SBC #$02
3b98 : 8d 28 bf STA $bf28 ; (softscroll + 13)
3b9b : a5 5e __ LDA T6 + 1 
3b9d : e9 00 __ SBC #$00
3b9f : 8d 29 bf STA $bf29 ; (softscroll + 14)
3ba2 : a9 01 __ LDA #$01
3ba4 : cd 22 bf CMP $bf22 ; (softscroll + 7)
3ba7 : b0 03 __ BCS $3bac ; (main.s560 + 0)
3ba9 : 4c 36 3c JMP $3c36 ; (main.s559 + 0)
.s560:
3bac : a9 06 __ LDA #$06
3bae : 8d 22 bf STA $bf22 ; (softscroll + 7)
3bb1 : ad 20 bf LDA $bf20 ; (softscroll + 5)
3bb4 : ed 1e bf SBC $bf1e ; (softscroll + 3)
3bb7 : 85 5d __ STA T6 + 0 
3bb9 : 8d 20 bf STA $bf20 ; (softscroll + 5)
3bbc : ad 21 bf LDA $bf21 ; (softscroll + 6)
3bbf : e9 00 __ SBC #$00
3bc1 : 85 5e __ STA T6 + 1 
3bc3 : 8d 21 bf STA $bf21 ; (softscroll + 6)
.l11948:
3bc6 : ad 00 d6 LDA $d600 
3bc9 : 29 20 __ AND #$20
3bcb : d0 f9 __ BNE $3bc6 ; (main.l11948 + 0)
.s567:
3bcd : a9 18 __ LDA #$18
3bcf : 8d 00 d6 STA $d600 
3bd2 : ad 24 bf LDA $bf24 ; (softscroll + 9)
3bd5 : 18 __ __ CLC
3bd6 : 69 06 __ ADC #$06
.l11950:
3bd8 : 2c 00 d6 BIT $d600 
3bdb : 10 fb __ BPL $3bd8 ; (main.l11950 + 0)
.s574:
3bdd : 8d 01 d6 STA $d601 
3be0 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
3be3 : 18 __ __ CLC
3be4 : 65 5d __ ADC T6 + 0 
3be6 : aa __ __ TAX
3be7 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
3bea : 65 5e __ ADC T6 + 1 
3bec : a8 __ __ TAY
3bed : ad 26 5a LDA $5a26 ; (vdc_state + 8)
3bf0 : 18 __ __ CLC
3bf1 : 65 5d __ ADC T6 + 0 
3bf3 : 85 5d __ STA T6 + 0 
3bf5 : a9 0c __ LDA #$0c
3bf7 : 8d 00 d6 STA $d600 
3bfa : ad 27 5a LDA $5a27 ; (vdc_state + 9)
3bfd : 65 5e __ ADC T6 + 1 
.l11952:
3bff : 2c 00 d6 BIT $d600 
3c02 : 10 fb __ BPL $3bff ; (main.l11952 + 0)
.s580:
3c04 : 8d 01 d6 STA $d601 
3c07 : a9 0d __ LDA #$0d
3c09 : 8d 00 d6 STA $d600 
.l11954:
3c0c : 2c 00 d6 BIT $d600 
3c0f : 10 fb __ BPL $3c0c ; (main.l11954 + 0)
.s585:
3c11 : a5 5d __ LDA T6 + 0 
3c13 : 8d 01 d6 STA $d601 
3c16 : a9 14 __ LDA #$14
3c18 : 8d 00 d6 STA $d600 
.l11956:
3c1b : 2c 00 d6 BIT $d600 
3c1e : 10 fb __ BPL $3c1b ; (main.l11956 + 0)
.s590:
3c20 : 8c 01 d6 STY $d601 
3c23 : a9 15 __ LDA #$15
3c25 : 8d 00 d6 STA $d600 
.l11958:
3c28 : 2c 00 d6 BIT $d600 
3c2b : 10 fb __ BPL $3c28 ; (main.l11958 + 0)
.s595:
3c2d : 8a __ __ TXA
.s1716:
3c2e : 8d 01 d6 STA $d601 
3c31 : a5 1b __ LDA ACCU + 0 
3c33 : 4c 99 22 JMP $2299 ; (main.s599 + 0)
.s559:
3c36 : ce 22 bf DEC $bf22 ; (softscroll + 7)
3c39 : ce 22 bf DEC $bf22 ; (softscroll + 7)
3c3c : a9 18 __ LDA #$18
3c3e : 8d 00 d6 STA $d600 
3c41 : ad 22 bf LDA $bf22 ; (softscroll + 7)
3c44 : 6d 24 bf ADC $bf24 ; (softscroll + 9)
.l11855:
3c47 : 2c 00 d6 BIT $d600 
3c4a : 10 fb __ BPL $3c47 ; (main.l11855 + 0)
3c4c : 4c 2e 3c JMP $3c2e ; (main.s1716 + 0)
.l408:
3c4f : 0a __ __ ASL
3c50 : aa __ __ TAX
3c51 : ad 25 5a LDA $5a25 ; (vdc_state + 7)
3c54 : 85 43 __ STA T10 + 0 
3c56 : a9 12 __ LDA #$12
3c58 : 8d 00 d6 STA $d600 
3c5b : a5 5b __ LDA T5 + 0 
3c5d : 38 __ __ SEC
3c5e : e9 01 __ SBC #$01
3c60 : 85 62 __ STA T12 + 0 
3c62 : bd 37 5a LDA $5a37,x ; (multab + 0)
3c65 : 85 5d __ STA T6 + 0 
3c67 : 18 __ __ CLC
3c68 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
3c6b : a8 __ __ TAY
3c6c : bd 38 5a LDA $5a38,x ; (multab + 1)
3c6f : 85 5e __ STA T6 + 1 
3c71 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11806:
3c74 : 2c 00 d6 BIT $d600 
3c77 : 10 fb __ BPL $3c74 ; (main.l11806 + 0)
.s420:
3c79 : 8d 01 d6 STA $d601 
3c7c : a9 13 __ LDA #$13
3c7e : 8d 00 d6 STA $d600 
.l11808:
3c81 : 2c 00 d6 BIT $d600 
3c84 : 10 fb __ BPL $3c81 ; (main.l11808 + 0)
.s425:
3c86 : 8c 01 d6 STY $d601 
3c89 : a9 1f __ LDA #$1f
3c8b : 8d 00 d6 STA $d600 
.l11810:
3c8e : 2c 00 d6 BIT $d600 
3c91 : 10 fb __ BPL $3c8e ; (main.l11810 + 0)
.s429:
3c93 : a9 20 __ LDA #$20
3c95 : 8d 01 d6 STA $d601 
3c98 : a9 18 __ LDA #$18
3c9a : 8d 00 d6 STA $d600 
.l11812:
3c9d : 2c 00 d6 BIT $d600 
3ca0 : 10 fb __ BPL $3c9d ; (main.l11812 + 0)
.s435:
3ca2 : ad 01 d6 LDA $d601 
3ca5 : 29 7f __ AND #$7f
3ca7 : a8 __ __ TAY
3ca8 : a9 18 __ LDA #$18
3caa : 8d 00 d6 STA $d600 
.l11814:
3cad : 2c 00 d6 BIT $d600 
3cb0 : 10 fb __ BPL $3cad ; (main.l11814 + 0)
.s441:
3cb2 : 8c 01 d6 STY $d601 
3cb5 : a9 1e __ LDA #$1e
3cb7 : 8d 00 d6 STA $d600 
.l11816:
3cba : 2c 00 d6 BIT $d600 
3cbd : 10 fb __ BPL $3cba ; (main.l11816 + 0)
.s446:
3cbf : a5 62 __ LDA T12 + 0 
3cc1 : 8d 01 d6 STA $d601 
3cc4 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
3cc7 : 18 __ __ CLC
3cc8 : 65 5d __ ADC T6 + 0 
3cca : aa __ __ TAX
3ccb : a9 12 __ LDA #$12
3ccd : 8d 00 d6 STA $d600 
3cd0 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
3cd3 : 65 5e __ ADC T6 + 1 
.l11818:
3cd5 : 2c 00 d6 BIT $d600 
3cd8 : 10 fb __ BPL $3cd5 ; (main.l11818 + 0)
.s453:
3cda : 8d 01 d6 STA $d601 
3cdd : a9 13 __ LDA #$13
3cdf : 8d 00 d6 STA $d600 
.l11820:
3ce2 : 2c 00 d6 BIT $d600 
3ce5 : 10 fb __ BPL $3ce2 ; (main.l11820 + 0)
.s458:
3ce7 : 8e 01 d6 STX $d601 
3cea : a9 1f __ LDA #$1f
3cec : 8d 00 d6 STA $d600 
.l11822:
3cef : 2c 00 d6 BIT $d600 
3cf2 : 10 fb __ BPL $3cef ; (main.l11822 + 0)
.s462:
3cf4 : a5 43 __ LDA T10 + 0 
3cf6 : 8d 01 d6 STA $d601 
3cf9 : a9 18 __ LDA #$18
3cfb : 8d 00 d6 STA $d600 
.l11824:
3cfe : 2c 00 d6 BIT $d600 
3d01 : 10 fb __ BPL $3cfe ; (main.l11824 + 0)
.s468:
3d03 : ad 01 d6 LDA $d601 
3d06 : 29 7f __ AND #$7f
3d08 : aa __ __ TAX
3d09 : a9 18 __ LDA #$18
3d0b : 8d 00 d6 STA $d600 
.l11826:
3d0e : 2c 00 d6 BIT $d600 
3d11 : 10 fb __ BPL $3d0e ; (main.l11826 + 0)
.s474:
3d13 : 8e 01 d6 STX $d601 
3d16 : a9 1e __ LDA #$1e
3d18 : 8d 00 d6 STA $d600 
.l11828:
3d1b : 2c 00 d6 BIT $d600 
3d1e : 10 fb __ BPL $3d1b ; (main.l11828 + 0)
.s479:
3d20 : a5 62 __ LDA T12 + 0 
3d22 : 8d 01 d6 STA $d601 
3d25 : e6 61 __ INC T8 + 0 
3d27 : a5 61 __ LDA T8 + 0 
3d29 : c5 5f __ CMP T7 + 0 
3d2b : b0 03 __ BCS $3d30 ; (main.s479 + 16)
3d2d : 4c 4f 3c JMP $3c4f ; (main.l408 + 0)
3d30 : 4c 55 21 JMP $2155 ; (main.s405 + 0)
.s299:
3d33 : 0a __ __ ASL
3d34 : aa __ __ TAX
3d35 : ad 25 5a LDA $5a25 ; (vdc_state + 7)
3d38 : 85 56 __ STA T2 + 0 
3d3a : a9 12 __ LDA #$12
3d3c : 8d 00 d6 STA $d600 
3d3f : a5 54 __ LDA T1 + 0 
3d41 : 38 __ __ SEC
3d42 : e9 01 __ SBC #$01
3d44 : 85 5d __ STA T6 + 0 
3d46 : bd 37 5a LDA $5a37,x ; (multab + 0)
3d49 : 85 59 __ STA T4 + 0 
3d4b : 18 __ __ CLC
3d4c : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
3d4f : a8 __ __ TAY
3d50 : bd 38 5a LDA $5a38,x ; (multab + 1)
3d53 : 85 5a __ STA T4 + 1 
3d55 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11993:
3d58 : 2c 00 d6 BIT $d600 
3d5b : 10 fb __ BPL $3d58 ; (main.l11993 + 0)
.s311:
3d5d : 8d 01 d6 STA $d601 
3d60 : a9 13 __ LDA #$13
3d62 : 8d 00 d6 STA $d600 
.l11995:
3d65 : 2c 00 d6 BIT $d600 
3d68 : 10 fb __ BPL $3d65 ; (main.l11995 + 0)
.s316:
3d6a : 8c 01 d6 STY $d601 
3d6d : a9 1f __ LDA #$1f
3d6f : 8d 00 d6 STA $d600 
.l11997:
3d72 : 2c 00 d6 BIT $d600 
3d75 : 10 fb __ BPL $3d72 ; (main.l11997 + 0)
.s320:
3d77 : a9 20 __ LDA #$20
3d79 : 8d 01 d6 STA $d601 
3d7c : a9 18 __ LDA #$18
3d7e : 8d 00 d6 STA $d600 
.l11999:
3d81 : 2c 00 d6 BIT $d600 
3d84 : 10 fb __ BPL $3d81 ; (main.l11999 + 0)
.s326:
3d86 : ad 01 d6 LDA $d601 
3d89 : 29 7f __ AND #$7f
3d8b : a8 __ __ TAY
3d8c : a9 18 __ LDA #$18
3d8e : 8d 00 d6 STA $d600 
.l12001:
3d91 : 2c 00 d6 BIT $d600 
3d94 : 10 fb __ BPL $3d91 ; (main.l12001 + 0)
.s332:
3d96 : 8c 01 d6 STY $d601 
3d99 : a9 1e __ LDA #$1e
3d9b : 8d 00 d6 STA $d600 
.l12003:
3d9e : 2c 00 d6 BIT $d600 
3da1 : 10 fb __ BPL $3d9e ; (main.l12003 + 0)
.s337:
3da3 : a5 5d __ LDA T6 + 0 
3da5 : 8d 01 d6 STA $d601 
3da8 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
3dab : 18 __ __ CLC
3dac : 65 59 __ ADC T4 + 0 
3dae : aa __ __ TAX
3daf : a9 12 __ LDA #$12
3db1 : 8d 00 d6 STA $d600 
3db4 : ad 29 5a LDA $5a29 ; (vdc_state + 11)
3db7 : 65 5a __ ADC T4 + 1 
.l12005:
3db9 : 2c 00 d6 BIT $d600 
3dbc : 10 fb __ BPL $3db9 ; (main.l12005 + 0)
.s344:
3dbe : 8d 01 d6 STA $d601 
3dc1 : a9 13 __ LDA #$13
3dc3 : 8d 00 d6 STA $d600 
.l12007:
3dc6 : 2c 00 d6 BIT $d600 
3dc9 : 10 fb __ BPL $3dc6 ; (main.l12007 + 0)
.s349:
3dcb : 8e 01 d6 STX $d601 
3dce : a9 1f __ LDA #$1f
3dd0 : 8d 00 d6 STA $d600 
.l12009:
3dd3 : 2c 00 d6 BIT $d600 
3dd6 : 10 fb __ BPL $3dd3 ; (main.l12009 + 0)
.s353:
3dd8 : a5 56 __ LDA T2 + 0 
3dda : 8d 01 d6 STA $d601 
3ddd : a9 18 __ LDA #$18
3ddf : 8d 00 d6 STA $d600 
.l12011:
3de2 : 2c 00 d6 BIT $d600 
3de5 : 10 fb __ BPL $3de2 ; (main.l12011 + 0)
.s359:
3de7 : ad 01 d6 LDA $d601 
3dea : 29 7f __ AND #$7f
3dec : aa __ __ TAX
3ded : a9 18 __ LDA #$18
3def : 8d 00 d6 STA $d600 
.l12013:
3df2 : 2c 00 d6 BIT $d600 
3df5 : 10 fb __ BPL $3df2 ; (main.l12013 + 0)
.s365:
3df7 : 8e 01 d6 STX $d601 
3dfa : a9 1e __ LDA #$1e
3dfc : 8d 00 d6 STA $d600 
.l12015:
3dff : 2c 00 d6 BIT $d600 
3e02 : 10 fb __ BPL $3dff ; (main.l12015 + 0)
.s370:
3e04 : a5 5d __ LDA T6 + 0 
3e06 : 8d 01 d6 STA $d601 
3e09 : e6 53 __ INC T0 + 0 
3e0b : 4c 7c 1f JMP $1f7c ; (main.l298 + 0)
.s101:
3e0e : 0a __ __ ASL
3e0f : aa __ __ TAX
3e10 : ad 25 5a LDA $5a25 ; (vdc_state + 7)
3e13 : 85 56 __ STA T2 + 0 
3e15 : a9 12 __ LDA #$12
3e17 : 8d 00 d6 STA $d600 
3e1a : a5 54 __ LDA T1 + 0 
3e1c : 38 __ __ SEC
3e1d : e9 01 __ SBC #$01
3e1f : 85 5d __ STA T6 + 0 
3e21 : bd 37 5a LDA $5a37,x ; (multab + 0)
3e24 : 85 59 __ STA T4 + 0 
3e26 : 18 __ __ CLC
3e27 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
3e2a : a8 __ __ TAY
3e2b : bd 38 5a LDA $5a38,x ; (multab + 1)
3e2e : 85 5a __ STA T4 + 1 
3e30 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l11375:
3e33 : 2c 00 d6 BIT $d600 
3e36 : 10 fb __ BPL $3e33 ; (main.l11375 + 0)
.s113:
3e38 : 8d 01 d6 STA $d601 
3e3b : a9 13 __ LDA #$13
3e3d : 8d 00 d6 STA $d600 
.l11377:
3e40 : 2c 00 d6 BIT $d600 
3e43 : 10 fb __ BPL $3e40 ; (main.l11377 + 0)
.s118:
3e45 : 8c 01 d6 STY $d601 
3e48 : a9 1f __ LDA #$1f
3e4a : 8d 00 d6 STA $d600 
.l11379:
3e4d : 2c 00 d6 BIT $d600 
3e50 : 10 fb __ BPL $3e4d ; (main.l11379 + 0)
.s122:
3e52 : a9 20 __ LDA #$20
3e54 : 8d 01 d6 STA $d601 
3e57 : a9 18 __ LDA #$18
3e59 : 8d 00 d6 STA $d600 
.l11381:
3e5c : 2c 00 d6 BIT $d600 
3e5f : 10 fb __ BPL $3e5c ; (main.l11381 + 0)
.s128:
3e61 : ad 01 d6 LDA $d601 
3e64 : 29 7f __ AND #$7f
3e66 : a8 __ __ TAY
3e67 : a9 18 __ LDA #$18
3e69 : 8d 00 d6 STA $d600 
.l11383:
3e6c : 2c 00 d6 BIT $d600 
3e6f : 10 fb __ BPL $3e6c ; (main.l11383 + 0)
.s134:
3e71 : 8c 01 d6 STY $d601 
3e74 : a9 1e __ LDA #$1e
3e76 : 8d 00 d6 STA $d600 
.l11385:
3e79 : 2c 00 d6 BIT $d600 
3e7c : 10 fb __ BPL $3e79 ; (main.l11385 + 0)
.s139:
3e7e : a5 5d __ LDA T6 + 0 
3e80 : 8d 01 d6 STA $d601 
3e83 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
3e86 : 18 __ __ CLC
3e87 : 65 59 __ ADC T4 + 0 
3e89 : aa __ __ TAX
3e8a : a9 12 __ LDA #$12
3e8c : 8d 00 d6 STA $d600 
3e8f : ad 29 5a LDA $5a29 ; (vdc_state + 11)
3e92 : 65 5a __ ADC T4 + 1 
.l11387:
3e94 : 2c 00 d6 BIT $d600 
3e97 : 10 fb __ BPL $3e94 ; (main.l11387 + 0)
.s146:
3e99 : 8d 01 d6 STA $d601 
3e9c : a9 13 __ LDA #$13
3e9e : 8d 00 d6 STA $d600 
.l11389:
3ea1 : 2c 00 d6 BIT $d600 
3ea4 : 10 fb __ BPL $3ea1 ; (main.l11389 + 0)
.s151:
3ea6 : 8e 01 d6 STX $d601 
3ea9 : a9 1f __ LDA #$1f
3eab : 8d 00 d6 STA $d600 
.l11391:
3eae : 2c 00 d6 BIT $d600 
3eb1 : 10 fb __ BPL $3eae ; (main.l11391 + 0)
.s155:
3eb3 : a5 56 __ LDA T2 + 0 
3eb5 : 8d 01 d6 STA $d601 
3eb8 : a9 18 __ LDA #$18
3eba : 8d 00 d6 STA $d600 
.l11393:
3ebd : 2c 00 d6 BIT $d600 
3ec0 : 10 fb __ BPL $3ebd ; (main.l11393 + 0)
.s161:
3ec2 : ad 01 d6 LDA $d601 
3ec5 : 29 7f __ AND #$7f
3ec7 : aa __ __ TAX
3ec8 : a9 18 __ LDA #$18
3eca : 8d 00 d6 STA $d600 
.l11395:
3ecd : 2c 00 d6 BIT $d600 
3ed0 : 10 fb __ BPL $3ecd ; (main.l11395 + 0)
.s167:
3ed2 : 8e 01 d6 STX $d601 
3ed5 : a9 1e __ LDA #$1e
3ed7 : 8d 00 d6 STA $d600 
.l11397:
3eda : 2c 00 d6 BIT $d600 
3edd : 10 fb __ BPL $3eda ; (main.l11397 + 0)
.s172:
3edf : a5 5d __ LDA T6 + 0 
3ee1 : 8d 01 d6 STA $d601 
3ee4 : e6 53 __ INC T0 + 0 
3ee6 : 4c d5 1d JMP $1dd5 ; (main.l100 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
3ee9 : a2 03 __ LDX #$03
3eeb : b5 53 __ LDA T8 + 0,x 
3eed : 9d b2 bf STA $bfb2,x ; (nouns + 33)
3ef0 : ca __ __ DEX
3ef1 : 10 f8 __ BPL $3eeb ; (printf.s1000 + 2)
.s0:
3ef3 : 18 __ __ CLC
3ef4 : a5 23 __ LDA SP + 0 
3ef6 : 69 04 __ ADC #$04
3ef8 : 85 47 __ STA T0 + 0 
3efa : a5 24 __ LDA SP + 1 
3efc : 69 00 __ ADC #$00
3efe : 85 48 __ STA T0 + 1 
3f00 : a9 00 __ LDA #$00
3f02 : 85 49 __ STA T2 + 0 
3f04 : a0 02 __ LDY #$02
3f06 : b1 23 __ LDA (SP + 0),y 
3f08 : 85 4a __ STA T3 + 0 
3f0a : c8 __ __ INY
3f0b : b1 23 __ LDA (SP + 0),y 
3f0d : 85 4b __ STA T3 + 1 
.l2:
3f0f : a0 00 __ LDY #$00
3f11 : b1 4a __ LDA (T3 + 0),y 
3f13 : d0 1e __ BNE $3f33 ; (printf.s3 + 0)
.s4:
3f15 : a6 49 __ LDX T2 + 0 
3f17 : 9d be bf STA $bfbe,x ; (nouns + 45)
3f1a : 8a __ __ TXA
3f1b : f0 0b __ BEQ $3f28 ; (printf.s1001 + 0)
.s117:
3f1d : a9 be __ LDA #$be
3f1f : 85 0d __ STA P0 ; (fmt + 0)
3f21 : a9 bf __ LDA #$bf
3f23 : 85 0e __ STA P1 ; (fmt + 1)
3f25 : 20 39 42 JSR $4239 ; (puts.s0 + 0)
.s1001:
3f28 : a2 03 __ LDX #$03
3f2a : bd b2 bf LDA $bfb2,x ; (nouns + 33)
3f2d : 95 53 __ STA T8 + 0,x 
3f2f : ca __ __ DEX
3f30 : 10 f8 __ BPL $3f2a ; (printf.s1001 + 2)
3f32 : 60 __ __ RTS
.s3:
3f33 : c9 25 __ CMP #$25
3f35 : f0 28 __ BEQ $3f5f ; (printf.s5 + 0)
.s6:
3f37 : a6 49 __ LDX T2 + 0 
3f39 : 9d be bf STA $bfbe,x ; (nouns + 45)
3f3c : e6 4a __ INC T3 + 0 
3f3e : d0 02 __ BNE $3f42 ; (printf.s1098 + 0)
.s1097:
3f40 : e6 4b __ INC T3 + 1 
.s1098:
3f42 : e8 __ __ INX
3f43 : 86 49 __ STX T2 + 0 
3f45 : e0 28 __ CPX #$28
3f47 : 90 c6 __ BCC $3f0f ; (printf.l2 + 0)
.s111:
3f49 : a9 be __ LDA #$be
3f4b : 85 0d __ STA P0 ; (fmt + 0)
3f4d : a9 bf __ LDA #$bf
3f4f : 85 0e __ STA P1 ; (fmt + 1)
3f51 : 98 __ __ TYA
3f52 : 9d be bf STA $bfbe,x ; (nouns + 45)
3f55 : 20 39 42 JSR $4239 ; (puts.s0 + 0)
3f58 : a9 00 __ LDA #$00
.s1068:
3f5a : 85 49 __ STA T2 + 0 
3f5c : 4c 0f 3f JMP $3f0f ; (printf.l2 + 0)
.s5:
3f5f : a5 49 __ LDA T2 + 0 
3f61 : f0 15 __ BEQ $3f78 ; (printf.s10 + 0)
.s8:
3f63 : a9 be __ LDA #$be
3f65 : 85 0d __ STA P0 ; (fmt + 0)
3f67 : a9 bf __ LDA #$bf
3f69 : 85 0e __ STA P1 ; (fmt + 1)
3f6b : 98 __ __ TYA
3f6c : a6 49 __ LDX T2 + 0 
3f6e : 9d be bf STA $bfbe,x ; (nouns + 45)
3f71 : 20 39 42 JSR $4239 ; (puts.s0 + 0)
3f74 : a9 00 __ LDA #$00
3f76 : 85 49 __ STA T2 + 0 
.s10:
3f78 : a9 0a __ LDA #$0a
3f7a : 8d b9 bf STA $bfb9 ; (nouns + 40)
3f7d : a9 00 __ LDA #$00
3f7f : 8d ba bf STA $bfba ; (nouns + 41)
3f82 : 8d bb bf STA $bfbb ; (nouns + 42)
3f85 : 8d bc bf STA $bfbc ; (nouns + 43)
3f88 : 8d bd bf STA $bfbd ; (nouns + 44)
3f8b : a0 01 __ LDY #$01
3f8d : b1 4a __ LDA (T3 + 0),y 
3f8f : aa __ __ TAX
3f90 : a9 20 __ LDA #$20
3f92 : 8d b6 bf STA $bfb6 ; (nouns + 37)
3f95 : a9 00 __ LDA #$00
3f97 : 8d b7 bf STA $bfb7 ; (nouns + 38)
3f9a : a9 ff __ LDA #$ff
3f9c : 8d b8 bf STA $bfb8 ; (nouns + 39)
3f9f : 18 __ __ CLC
3fa0 : a5 4a __ LDA T3 + 0 
3fa2 : 69 02 __ ADC #$02
.l15:
3fa4 : 85 4a __ STA T3 + 0 
3fa6 : 90 02 __ BCC $3faa ; (printf.s1080 + 0)
.s1079:
3fa8 : e6 4b __ INC T3 + 1 
.s1080:
3faa : 8a __ __ TXA
3fab : e0 2b __ CPX #$2b
3fad : d0 08 __ BNE $3fb7 ; (printf.s18 + 0)
.s17:
3faf : a9 01 __ LDA #$01
3fb1 : 8d bb bf STA $bfbb ; (nouns + 42)
3fb4 : 4c 2c 42 JMP $422c ; (printf.s246 + 0)
.s18:
3fb7 : c9 30 __ CMP #$30
3fb9 : d0 06 __ BNE $3fc1 ; (printf.s21 + 0)
.s20:
3fbb : 8d b6 bf STA $bfb6 ; (nouns + 37)
3fbe : 4c 2c 42 JMP $422c ; (printf.s246 + 0)
.s21:
3fc1 : e0 23 __ CPX #$23
3fc3 : d0 08 __ BNE $3fcd ; (printf.s24 + 0)
.s23:
3fc5 : a9 01 __ LDA #$01
3fc7 : 8d bd bf STA $bfbd ; (nouns + 44)
3fca : 4c 2c 42 JMP $422c ; (printf.s246 + 0)
.s24:
3fcd : e0 2d __ CPX #$2d
3fcf : d0 08 __ BNE $3fd9 ; (printf.s16 + 0)
.s26:
3fd1 : a9 01 __ LDA #$01
3fd3 : 8d bc bf STA $bfbc ; (nouns + 43)
3fd6 : 4c 2c 42 JMP $422c ; (printf.s246 + 0)
.s16:
3fd9 : 85 4c __ STA T4 + 0 
3fdb : e0 30 __ CPX #$30
3fdd : 90 53 __ BCC $4032 ; (printf.s32 + 0)
.s33:
3fdf : e0 3a __ CPX #$3a
3fe1 : b0 4f __ BCS $4032 ; (printf.s32 + 0)
.s30:
3fe3 : a9 00 __ LDA #$00
3fe5 : 85 4d __ STA T6 + 0 
3fe7 : 85 4e __ STA T6 + 1 
3fe9 : e0 3a __ CPX #$3a
3feb : b0 40 __ BCS $402d ; (printf.s36 + 0)
.l35:
3fed : a5 4d __ LDA T6 + 0 
3fef : 0a __ __ ASL
3ff0 : 85 1b __ STA ACCU + 0 
3ff2 : a5 4e __ LDA T6 + 1 
3ff4 : 2a __ __ ROL
3ff5 : 06 1b __ ASL ACCU + 0 
3ff7 : 2a __ __ ROL
3ff8 : aa __ __ TAX
3ff9 : 18 __ __ CLC
3ffa : a5 1b __ LDA ACCU + 0 
3ffc : 65 4d __ ADC T6 + 0 
3ffe : 85 4d __ STA T6 + 0 
4000 : 8a __ __ TXA
4001 : 65 4e __ ADC T6 + 1 
4003 : 06 4d __ ASL T6 + 0 
4005 : 2a __ __ ROL
4006 : aa __ __ TAX
4007 : 18 __ __ CLC
4008 : a5 4d __ LDA T6 + 0 
400a : 65 4c __ ADC T4 + 0 
400c : 90 01 __ BCC $400f ; (printf.s1094 + 0)
.s1093:
400e : e8 __ __ INX
.s1094:
400f : 38 __ __ SEC
4010 : e9 30 __ SBC #$30
4012 : 85 4d __ STA T6 + 0 
4014 : 8a __ __ TXA
4015 : e9 00 __ SBC #$00
4017 : 85 4e __ STA T6 + 1 
4019 : a0 00 __ LDY #$00
401b : b1 4a __ LDA (T3 + 0),y 
401d : 85 4c __ STA T4 + 0 
401f : e6 4a __ INC T3 + 0 
4021 : d0 02 __ BNE $4025 ; (printf.s1096 + 0)
.s1095:
4023 : e6 4b __ INC T3 + 1 
.s1096:
4025 : c9 30 __ CMP #$30
4027 : 90 04 __ BCC $402d ; (printf.s36 + 0)
.s37:
4029 : c9 3a __ CMP #$3a
402b : 90 c0 __ BCC $3fed ; (printf.l35 + 0)
.s36:
402d : a5 4d __ LDA T6 + 0 
402f : 8d b7 bf STA $bfb7 ; (nouns + 38)
.s32:
4032 : a5 4c __ LDA T4 + 0 
4034 : c9 2e __ CMP #$2e
4036 : d0 51 __ BNE $4089 ; (printf.s40 + 0)
.s38:
4038 : a9 00 __ LDA #$00
403a : 85 4d __ STA T6 + 0 
.l231:
403c : 85 4e __ STA T6 + 1 
403e : a0 00 __ LDY #$00
4040 : b1 4a __ LDA (T3 + 0),y 
4042 : 85 4c __ STA T4 + 0 
4044 : e6 4a __ INC T3 + 0 
4046 : d0 02 __ BNE $404a ; (printf.s1082 + 0)
.s1081:
4048 : e6 4b __ INC T3 + 1 
.s1082:
404a : c9 30 __ CMP #$30
404c : 90 04 __ BCC $4052 ; (printf.s43 + 0)
.s44:
404e : c9 3a __ CMP #$3a
4050 : 90 0a __ BCC $405c ; (printf.s42 + 0)
.s43:
4052 : a5 4d __ LDA T6 + 0 
4054 : 8d b8 bf STA $bfb8 ; (nouns + 39)
4057 : a5 4c __ LDA T4 + 0 
4059 : 4c 89 40 JMP $4089 ; (printf.s40 + 0)
.s42:
405c : a5 4d __ LDA T6 + 0 
405e : 0a __ __ ASL
405f : 85 1b __ STA ACCU + 0 
4061 : a5 4e __ LDA T6 + 1 
4063 : 2a __ __ ROL
4064 : 06 1b __ ASL ACCU + 0 
4066 : 2a __ __ ROL
4067 : aa __ __ TAX
4068 : 18 __ __ CLC
4069 : a5 1b __ LDA ACCU + 0 
406b : 65 4d __ ADC T6 + 0 
406d : 85 4d __ STA T6 + 0 
406f : 8a __ __ TXA
4070 : 65 4e __ ADC T6 + 1 
4072 : 06 4d __ ASL T6 + 0 
4074 : 2a __ __ ROL
4075 : aa __ __ TAX
4076 : 18 __ __ CLC
4077 : a5 4d __ LDA T6 + 0 
4079 : 65 4c __ ADC T4 + 0 
407b : 90 01 __ BCC $407e ; (printf.s1092 + 0)
.s1091:
407d : e8 __ __ INX
.s1092:
407e : 38 __ __ SEC
407f : e9 30 __ SBC #$30
4081 : 85 4d __ STA T6 + 0 
4083 : 8a __ __ TXA
4084 : e9 00 __ SBC #$00
4086 : 4c 3c 40 JMP $403c ; (printf.l231 + 0)
.s40:
4089 : c9 64 __ CMP #$64
408b : f0 04 __ BEQ $4091 ; (printf.s45 + 0)
.s48:
408d : c9 44 __ CMP #$44
408f : d0 05 __ BNE $4096 ; (printf.s46 + 0)
.s45:
4091 : a9 01 __ LDA #$01
4093 : 4c 05 42 JMP $4205 ; (printf.s247 + 0)
.s46:
4096 : c9 75 __ CMP #$75
4098 : d0 03 __ BNE $409d ; (printf.s52 + 0)
409a : 4c 03 42 JMP $4203 ; (printf.s269 + 0)
.s52:
409d : c9 55 __ CMP #$55
409f : d0 03 __ BNE $40a4 ; (printf.s50 + 0)
40a1 : 4c 03 42 JMP $4203 ; (printf.s269 + 0)
.s50:
40a4 : c9 78 __ CMP #$78
40a6 : f0 04 __ BEQ $40ac ; (printf.s53 + 0)
.s56:
40a8 : c9 58 __ CMP #$58
40aa : d0 0d __ BNE $40b9 ; (printf.s54 + 0)
.s53:
40ac : a9 10 __ LDA #$10
40ae : 8d b9 bf STA $bfb9 ; (nouns + 40)
40b1 : a9 00 __ LDA #$00
40b3 : 8d ba bf STA $bfba ; (nouns + 41)
40b6 : 4c 03 42 JMP $4203 ; (printf.s269 + 0)
.s54:
40b9 : c9 6c __ CMP #$6c
40bb : d0 03 __ BNE $40c0 ; (printf.s60 + 0)
40bd : 4c 95 41 JMP $4195 ; (printf.s57 + 0)
.s60:
40c0 : c9 4c __ CMP #$4c
40c2 : d0 03 __ BNE $40c7 ; (printf.s58 + 0)
40c4 : 4c 95 41 JMP $4195 ; (printf.s57 + 0)
.s58:
40c7 : c9 73 __ CMP #$73
40c9 : f0 39 __ BEQ $4104 ; (printf.s73 + 0)
.s76:
40cb : c9 53 __ CMP #$53
40cd : f0 35 __ BEQ $4104 ; (printf.s73 + 0)
.s74:
40cf : c9 63 __ CMP #$63
40d1 : f0 15 __ BEQ $40e8 ; (printf.s104 + 0)
.s107:
40d3 : c9 43 __ CMP #$43
40d5 : f0 11 __ BEQ $40e8 ; (printf.s104 + 0)
.s105:
40d7 : 09 00 __ ORA #$00
40d9 : d0 03 __ BNE $40de ; (printf.s108 + 0)
40db : 4c 0f 3f JMP $3f0f ; (printf.l2 + 0)
.s108:
40de : a6 49 __ LDX T2 + 0 
40e0 : 9d be bf STA $bfbe,x ; (nouns + 45)
40e3 : e6 49 __ INC T2 + 0 
40e5 : 4c 0f 3f JMP $3f0f ; (printf.l2 + 0)
.s104:
40e8 : a0 00 __ LDY #$00
40ea : b1 47 __ LDA (T0 + 0),y 
40ec : a6 49 __ LDX T2 + 0 
40ee : 9d be bf STA $bfbe,x ; (nouns + 45)
40f1 : e6 49 __ INC T2 + 0 
.s244:
40f3 : 18 __ __ CLC
40f4 : a5 47 __ LDA T0 + 0 
40f6 : 69 02 __ ADC #$02
40f8 : 85 47 __ STA T0 + 0 
40fa : b0 03 __ BCS $40ff ; (printf.s1083 + 0)
40fc : 4c 0f 3f JMP $3f0f ; (printf.l2 + 0)
.s1083:
40ff : e6 48 __ INC T0 + 1 
4101 : 4c 0f 3f JMP $3f0f ; (printf.l2 + 0)
.s73:
4104 : a0 00 __ LDY #$00
4106 : 84 4c __ STY T4 + 0 
4108 : b1 47 __ LDA (T0 + 0),y 
410a : 85 4d __ STA T6 + 0 
410c : c8 __ __ INY
410d : b1 47 __ LDA (T0 + 0),y 
410f : 85 4e __ STA T6 + 1 
4111 : 18 __ __ CLC
4112 : a5 47 __ LDA T0 + 0 
4114 : 69 02 __ ADC #$02
4116 : 85 47 __ STA T0 + 0 
4118 : 90 02 __ BCC $411c ; (printf.s1090 + 0)
.s1089:
411a : e6 48 __ INC T0 + 1 
.s1090:
411c : ad b7 bf LDA $bfb7 ; (nouns + 38)
411f : f0 0d __ BEQ $412e ; (printf.s79 + 0)
.s1071:
4121 : a0 00 __ LDY #$00
4123 : b1 4d __ LDA (T6 + 0),y 
4125 : f0 05 __ BEQ $412c ; (printf.s1072 + 0)
.l81:
4127 : c8 __ __ INY
4128 : b1 4d __ LDA (T6 + 0),y 
412a : d0 fb __ BNE $4127 ; (printf.l81 + 0)
.s1072:
412c : 84 4c __ STY T4 + 0 
.s79:
412e : ad bc bf LDA $bfbc ; (nouns + 43)
4131 : d0 1a __ BNE $414d ; (printf.s85 + 0)
.s1075:
4133 : a4 4c __ LDY T4 + 0 
4135 : cc b7 bf CPY $bfb7 ; (nouns + 38)
4138 : a6 49 __ LDX T2 + 0 
413a : b0 0d __ BCS $4149 ; (printf.s1076 + 0)
.l87:
413c : ad b6 bf LDA $bfb6 ; (nouns + 37)
413f : 9d be bf STA $bfbe,x ; (nouns + 45)
4142 : c8 __ __ INY
4143 : cc b7 bf CPY $bfb7 ; (nouns + 38)
4146 : e8 __ __ INX
4147 : 90 f3 __ BCC $413c ; (printf.l87 + 0)
.s1076:
4149 : 86 49 __ STX T2 + 0 
414b : 84 4c __ STY T4 + 0 
.s85:
414d : a5 49 __ LDA T2 + 0 
414f : f0 16 __ BEQ $4167 ; (printf.s238 + 0)
.s92:
4151 : a9 be __ LDA #$be
4153 : 85 0d __ STA P0 ; (fmt + 0)
4155 : a9 bf __ LDA #$bf
4157 : 85 0e __ STA P1 ; (fmt + 1)
4159 : a9 00 __ LDA #$00
415b : a6 49 __ LDX T2 + 0 
415d : 9d be bf STA $bfbe,x ; (nouns + 45)
4160 : 20 39 42 JSR $4239 ; (puts.s0 + 0)
4163 : a9 00 __ LDA #$00
4165 : 85 49 __ STA T2 + 0 
.s238:
4167 : a5 4d __ LDA T6 + 0 
4169 : 85 0d __ STA P0 ; (fmt + 0)
416b : a5 4e __ LDA T6 + 1 
416d : 85 0e __ STA P1 ; (fmt + 1)
416f : 20 39 42 JSR $4239 ; (puts.s0 + 0)
4172 : ad bc bf LDA $bfbc ; (nouns + 43)
4175 : d0 03 __ BNE $417a ; (printf.s1073 + 0)
4177 : 4c 0f 3f JMP $3f0f ; (printf.l2 + 0)
.s1073:
417a : a4 4c __ LDY T4 + 0 
417c : cc b7 bf CPY $bfb7 ; (nouns + 38)
417f : a2 00 __ LDX #$00
4181 : b0 0d __ BCS $4190 ; (printf.s1074 + 0)
.l102:
4183 : ad b6 bf LDA $bfb6 ; (nouns + 37)
4186 : 9d be bf STA $bfbe,x ; (nouns + 45)
4189 : c8 __ __ INY
418a : cc b7 bf CPY $bfb7 ; (nouns + 38)
418d : e8 __ __ INX
418e : 90 f3 __ BCC $4183 ; (printf.l102 + 0)
.s1074:
4190 : 86 49 __ STX T2 + 0 
4192 : 4c 0f 3f JMP $3f0f ; (printf.l2 + 0)
.s57:
4195 : a0 00 __ LDY #$00
4197 : b1 47 __ LDA (T0 + 0),y 
4199 : 85 53 __ STA T8 + 0 
419b : c8 __ __ INY
419c : b1 47 __ LDA (T0 + 0),y 
419e : 85 54 __ STA T8 + 1 
41a0 : c8 __ __ INY
41a1 : b1 47 __ LDA (T0 + 0),y 
41a3 : 85 55 __ STA T8 + 2 
41a5 : c8 __ __ INY
41a6 : b1 47 __ LDA (T0 + 0),y 
41a8 : 85 56 __ STA T8 + 3 
41aa : 18 __ __ CLC
41ab : a5 47 __ LDA T0 + 0 
41ad : 69 04 __ ADC #$04
41af : 85 47 __ STA T0 + 0 
41b1 : 90 02 __ BCC $41b5 ; (printf.s1086 + 0)
.s1085:
41b3 : e6 48 __ INC T0 + 1 
.s1086:
41b5 : a0 00 __ LDY #$00
41b7 : b1 4a __ LDA (T3 + 0),y 
41b9 : aa __ __ TAX
41ba : e6 4a __ INC T3 + 0 
41bc : d0 02 __ BNE $41c0 ; (printf.s1088 + 0)
.s1087:
41be : e6 4b __ INC T3 + 1 
.s1088:
41c0 : 8a __ __ TXA
41c1 : e0 64 __ CPX #$64
41c3 : f0 04 __ BEQ $41c9 ; (printf.s61 + 0)
.s64:
41c5 : c9 44 __ CMP #$44
41c7 : d0 04 __ BNE $41cd ; (printf.s62 + 0)
.s61:
41c9 : a9 01 __ LDA #$01
41cb : d0 1c __ BNE $41e9 ; (printf.s245 + 0)
.s62:
41cd : c9 75 __ CMP #$75
41cf : f0 17 __ BEQ $41e8 ; (printf.s268 + 0)
.s68:
41d1 : c9 55 __ CMP #$55
41d3 : f0 13 __ BEQ $41e8 ; (printf.s268 + 0)
.s66:
41d5 : c9 78 __ CMP #$78
41d7 : f0 07 __ BEQ $41e0 ; (printf.s69 + 0)
.s72:
41d9 : c9 58 __ CMP #$58
41db : f0 03 __ BEQ $41e0 ; (printf.s69 + 0)
41dd : 4c 0f 3f JMP $3f0f ; (printf.l2 + 0)
.s69:
41e0 : 8c ba bf STY $bfba ; (nouns + 41)
41e3 : a9 10 __ LDA #$10
41e5 : 8d b9 bf STA $bfb9 ; (nouns + 40)
.s268:
41e8 : 98 __ __ TYA
.s245:
41e9 : 85 15 __ STA P8 
41eb : a9 be __ LDA #$be
41ed : 85 0f __ STA P2 ; (fmt + 2)
41ef : a9 bf __ LDA #$bf
41f1 : 85 10 __ STA P3 ; (fmt + 3)
41f3 : a9 b6 __ LDA #$b6
41f5 : 85 0d __ STA P0 ; (fmt + 0)
41f7 : a9 bf __ LDA #$bf
41f9 : 85 0e __ STA P1 ; (fmt + 1)
41fb : 20 c3 43 JSR $43c3 ; (nforml@proxy + 0)
41fe : a5 1b __ LDA ACCU + 0 
4200 : 4c 5a 3f JMP $3f5a ; (printf.s1068 + 0)
.s269:
4203 : a9 00 __ LDA #$00
.s247:
4205 : 85 13 __ STA P6 
4207 : a9 be __ LDA #$be
4209 : 85 0f __ STA P2 ; (fmt + 2)
420b : a9 bf __ LDA #$bf
420d : 85 10 __ STA P3 ; (fmt + 3)
420f : a0 00 __ LDY #$00
4211 : b1 47 __ LDA (T0 + 0),y 
4213 : 85 11 __ STA P4 
4215 : c8 __ __ INY
4216 : b1 47 __ LDA (T0 + 0),y 
4218 : 85 12 __ STA P5 
421a : a9 b6 __ LDA #$b6
421c : 85 0d __ STA P0 ; (fmt + 0)
421e : a9 bf __ LDA #$bf
4220 : 85 0e __ STA P1 ; (fmt + 1)
4222 : 20 8e 42 JSR $428e ; (nformi.s0 + 0)
4225 : a5 1b __ LDA ACCU + 0 
4227 : 85 49 __ STA T2 + 0 
4229 : 4c f3 40 JMP $40f3 ; (printf.s244 + 0)
.s246:
422c : a0 00 __ LDY #$00
422e : b1 4a __ LDA (T3 + 0),y 
4230 : aa __ __ TAX
4231 : 18 __ __ CLC
4232 : a5 4a __ LDA T3 + 0 
4234 : 69 01 __ ADC #$01
4236 : 4c a4 3f JMP $3fa4 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
4239 : a0 00 __ LDY #$00
423b : b1 0d __ LDA (P0),y 
423d : f0 0b __ BEQ $424a ; (puts.s1001 + 0)
423f : 20 4b 42 JSR $424b ; (putpch + 0)
4242 : e6 0d __ INC P0 
4244 : d0 f3 __ BNE $4239 ; (puts.s0 + 0)
4246 : e6 0e __ INC P1 
4248 : d0 ef __ BNE $4239 ; (puts.s0 + 0)
.s1001:
424a : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
424b : ae 9f 58 LDX $589f ; (giocharmap + 0)
424e : e0 01 __ CPX #$01
4250 : 90 26 __ BCC $4278 ; (putpch + 45)
4252 : c9 0a __ CMP #$0a
4254 : d0 02 __ BNE $4258 ; (putpch + 13)
4256 : a9 0d __ LDA #$0d
4258 : c9 09 __ CMP #$09
425a : f0 1f __ BEQ $427b ; (putpch + 48)
425c : e0 02 __ CPX #$02
425e : 90 18 __ BCC $4278 ; (putpch + 45)
4260 : c9 41 __ CMP #$41
4262 : 90 14 __ BCC $4278 ; (putpch + 45)
4264 : c9 7b __ CMP #$7b
4266 : b0 10 __ BCS $4278 ; (putpch + 45)
4268 : c9 61 __ CMP #$61
426a : b0 04 __ BCS $4270 ; (putpch + 37)
426c : c9 5b __ CMP #$5b
426e : b0 08 __ BCS $4278 ; (putpch + 45)
4270 : 49 20 __ EOR #$20
4272 : e0 03 __ CPX #$03
4274 : f0 02 __ BEQ $4278 ; (putpch + 45)
4276 : 29 df __ AND #$df
4278 : 4c d2 ff JMP $ffd2 
427b : 38 __ __ SEC
427c : 20 f0 ff JSR $fff0 
427f : 98 __ __ TYA
4280 : 29 03 __ AND #$03
4282 : 49 03 __ EOR #$03
4284 : aa __ __ TAX
4285 : a9 20 __ LDA #$20
4287 : 20 d2 ff JSR $ffd2 
428a : ca __ __ DEX
428b : 10 fa __ BPL $4287 ; (putpch + 60)
428d : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
428e : a9 00 __ LDA #$00
4290 : 85 43 __ STA T0 + 0 
4292 : a5 13 __ LDA P6 ; (s + 0)
4294 : f0 13 __ BEQ $42a9 ; (nformi.s182 + 0)
.s4:
4296 : 24 12 __ BIT P5 ; (v + 1)
4298 : 10 0f __ BPL $42a9 ; (nformi.s182 + 0)
.s1:
429a : 38 __ __ SEC
429b : a9 00 __ LDA #$00
429d : e5 11 __ SBC P4 ; (v + 0)
429f : 85 11 __ STA P4 ; (v + 0)
42a1 : a9 00 __ LDA #$00
42a3 : e5 12 __ SBC P5 ; (v + 1)
42a5 : 85 12 __ STA P5 ; (v + 1)
42a7 : e6 43 __ INC T0 + 0 
.s182:
42a9 : a9 10 __ LDA #$10
42ab : 85 44 __ STA T2 + 0 
42ad : a5 11 __ LDA P4 ; (v + 0)
42af : 05 12 __ ORA P5 ; (v + 1)
42b1 : f0 46 __ BEQ $42f9 ; (nformi.s7 + 0)
.s42:
42b3 : a0 03 __ LDY #$03
42b5 : b1 0d __ LDA (P0),y ; (si + 0)
42b7 : 85 45 __ STA T4 + 0 
42b9 : c8 __ __ INY
42ba : b1 0d __ LDA (P0),y ; (si + 0)
42bc : 85 46 __ STA T4 + 1 
.l6:
42be : a5 11 __ LDA P4 ; (v + 0)
42c0 : 85 1b __ STA ACCU + 0 
42c2 : a5 12 __ LDA P5 ; (v + 1)
42c4 : 85 1c __ STA ACCU + 1 
42c6 : a5 45 __ LDA T4 + 0 
42c8 : 85 03 __ STA WORK + 0 
42ca : a5 46 __ LDA T4 + 1 
42cc : 85 04 __ STA WORK + 1 
42ce : 20 65 57 JSR $5765 ; (divmod + 0)
42d1 : a5 06 __ LDA WORK + 3 
42d3 : 30 08 __ BMI $42dd ; (nformi.s78 + 0)
.s1019:
42d5 : d0 0a __ BNE $42e1 ; (nformi.s77 + 0)
.s1018:
42d7 : a5 05 __ LDA WORK + 2 
42d9 : c9 0a __ CMP #$0a
42db : b0 04 __ BCS $42e1 ; (nformi.s77 + 0)
.s78:
42dd : a9 30 __ LDA #$30
42df : d0 02 __ BNE $42e3 ; (nformi.s79 + 0)
.s77:
42e1 : a9 37 __ LDA #$37
.s79:
42e3 : 18 __ __ CLC
42e4 : 65 05 __ ADC WORK + 2 
42e6 : c6 44 __ DEC T2 + 0 
42e8 : a6 44 __ LDX T2 + 0 
42ea : 9d f0 bf STA $bff0,x ; (buffer + 0)
42ed : a5 1b __ LDA ACCU + 0 
42ef : 85 11 __ STA P4 ; (v + 0)
42f1 : a5 1c __ LDA ACCU + 1 
42f3 : 85 12 __ STA P5 ; (v + 1)
42f5 : 05 11 __ ORA P4 ; (v + 0)
42f7 : d0 c5 __ BNE $42be ; (nformi.l6 + 0)
.s7:
42f9 : a0 02 __ LDY #$02
42fb : b1 0d __ LDA (P0),y ; (si + 0)
42fd : c9 ff __ CMP #$ff
42ff : d0 04 __ BNE $4305 ; (nformi.s80 + 0)
.s81:
4301 : a9 0f __ LDA #$0f
4303 : d0 05 __ BNE $430a ; (nformi.s1026 + 0)
.s80:
4305 : 38 __ __ SEC
4306 : a9 10 __ LDA #$10
4308 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
430a : a8 __ __ TAY
430b : c4 44 __ CPY T2 + 0 
430d : b0 0d __ BCS $431c ; (nformi.s10 + 0)
.s9:
430f : a9 30 __ LDA #$30
.l1027:
4311 : c6 44 __ DEC T2 + 0 
4313 : a6 44 __ LDX T2 + 0 
4315 : 9d f0 bf STA $bff0,x ; (buffer + 0)
4318 : c4 44 __ CPY T2 + 0 
431a : 90 f5 __ BCC $4311 ; (nformi.l1027 + 0)
.s10:
431c : a0 07 __ LDY #$07
431e : b1 0d __ LDA (P0),y ; (si + 0)
4320 : f0 20 __ BEQ $4342 ; (nformi.s13 + 0)
.s14:
4322 : a0 04 __ LDY #$04
4324 : b1 0d __ LDA (P0),y ; (si + 0)
4326 : d0 1a __ BNE $4342 ; (nformi.s13 + 0)
.s1013:
4328 : 88 __ __ DEY
4329 : b1 0d __ LDA (P0),y ; (si + 0)
432b : c9 10 __ CMP #$10
432d : d0 13 __ BNE $4342 ; (nformi.s13 + 0)
.s11:
432f : a9 58 __ LDA #$58
4331 : a6 44 __ LDX T2 + 0 
4333 : 9d ef bf STA $bfef,x ; (buff + 49)
4336 : 8a __ __ TXA
4337 : 18 __ __ CLC
4338 : 69 fe __ ADC #$fe
433a : 85 44 __ STA T2 + 0 
433c : aa __ __ TAX
433d : a9 30 __ LDA #$30
433f : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
4342 : a9 00 __ LDA #$00
4344 : 85 1b __ STA ACCU + 0 
4346 : a5 43 __ LDA T0 + 0 
4348 : f0 06 __ BEQ $4350 ; (nformi.s16 + 0)
.s15:
434a : c6 44 __ DEC T2 + 0 
434c : a9 2d __ LDA #$2d
434e : d0 0a __ BNE $435a ; (nformi.s1025 + 0)
.s16:
4350 : a0 05 __ LDY #$05
4352 : b1 0d __ LDA (P0),y ; (si + 0)
4354 : f0 09 __ BEQ $435f ; (nformi.s163 + 0)
.s18:
4356 : c6 44 __ DEC T2 + 0 
4358 : a9 2b __ LDA #$2b
.s1025:
435a : a6 44 __ LDX T2 + 0 
435c : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
435f : a0 06 __ LDY #$06
4361 : b1 0d __ LDA (P0),y ; (si + 0)
4363 : d0 33 __ BNE $4398 ; (nformi.s24 + 0)
.l30:
4365 : a0 01 __ LDY #$01
4367 : b1 0d __ LDA (P0),y ; (si + 0)
4369 : 18 __ __ CLC
436a : 65 44 __ ADC T2 + 0 
436c : b0 04 __ BCS $4372 ; (nformi.s31 + 0)
.s1006:
436e : c9 11 __ CMP #$11
4370 : 90 0d __ BCC $437f ; (nformi.s33 + 0)
.s31:
4372 : c6 44 __ DEC T2 + 0 
4374 : a0 00 __ LDY #$00
4376 : b1 0d __ LDA (P0),y ; (si + 0)
4378 : a6 44 __ LDX T2 + 0 
437a : 9d f0 bf STA $bff0,x ; (buffer + 0)
437d : b0 e6 __ BCS $4365 ; (nformi.l30 + 0)
.s33:
437f : a6 44 __ LDX T2 + 0 
4381 : e0 10 __ CPX #$10
4383 : b0 0e __ BCS $4393 ; (nformi.s23 + 0)
.s34:
4385 : 88 __ __ DEY
.l1022:
4386 : bd f0 bf LDA $bff0,x ; (buffer + 0)
4389 : 91 0f __ STA (P2),y ; (str + 0)
438b : e8 __ __ INX
438c : e0 10 __ CPX #$10
438e : c8 __ __ INY
438f : 90 f5 __ BCC $4386 ; (nformi.l1022 + 0)
.s1023:
4391 : 84 1b __ STY ACCU + 0 
.s23:
4393 : a9 00 __ LDA #$00
4395 : 85 1c __ STA ACCU + 1 
.s1001:
4397 : 60 __ __ RTS
.s24:
4398 : a6 44 __ LDX T2 + 0 
439a : e0 10 __ CPX #$10
439c : b0 1a __ BCS $43b8 ; (nformi.l27 + 0)
.s25:
439e : a0 00 __ LDY #$00
.l1020:
43a0 : bd f0 bf LDA $bff0,x ; (buffer + 0)
43a3 : 91 0f __ STA (P2),y ; (str + 0)
43a5 : e8 __ __ INX
43a6 : e0 10 __ CPX #$10
43a8 : c8 __ __ INY
43a9 : 90 f5 __ BCC $43a0 ; (nformi.l1020 + 0)
.s1021:
43ab : 84 1b __ STY ACCU + 0 
43ad : b0 09 __ BCS $43b8 ; (nformi.l27 + 0)
.s28:
43af : 88 __ __ DEY
43b0 : b1 0d __ LDA (P0),y ; (si + 0)
43b2 : a4 1b __ LDY ACCU + 0 
43b4 : 91 0f __ STA (P2),y ; (str + 0)
43b6 : e6 1b __ INC ACCU + 0 
.l27:
43b8 : a5 1b __ LDA ACCU + 0 
43ba : a0 01 __ LDY #$01
43bc : d1 0d __ CMP (P0),y ; (si + 0)
43be : 90 ef __ BCC $43af ; (nformi.s28 + 0)
43c0 : 4c 93 43 JMP $4393 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml@proxy: ; nforml@proxy
43c3 : a5 53 __ LDA $53 
43c5 : 85 11 __ STA P4 
43c7 : a5 54 __ LDA $54 
43c9 : 85 12 __ STA P5 
43cb : a5 55 __ LDA $55 
43cd : 85 13 __ STA P6 
43cf : a5 56 __ LDA $56 
43d1 : 85 14 __ STA P7 
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
43d3 : a9 00 __ LDA #$00
43d5 : 85 43 __ STA T0 + 0 
43d7 : a5 15 __ LDA P8 ; (s + 0)
43d9 : f0 21 __ BEQ $43fc ; (nforml.s182 + 0)
.s4:
43db : a5 14 __ LDA P7 ; (v + 3)
43dd : f0 1d __ BEQ $43fc ; (nforml.s182 + 0)
.s1032:
43df : 10 1b __ BPL $43fc ; (nforml.s182 + 0)
.s1:
43e1 : 38 __ __ SEC
43e2 : a9 00 __ LDA #$00
43e4 : e5 11 __ SBC P4 ; (v + 0)
43e6 : 85 11 __ STA P4 ; (v + 0)
43e8 : a9 00 __ LDA #$00
43ea : e5 12 __ SBC P5 ; (v + 1)
43ec : 85 12 __ STA P5 ; (v + 1)
43ee : a9 00 __ LDA #$00
43f0 : e5 13 __ SBC P6 ; (v + 2)
43f2 : 85 13 __ STA P6 ; (v + 2)
43f4 : a9 00 __ LDA #$00
43f6 : e5 14 __ SBC P7 ; (v + 3)
43f8 : 85 14 __ STA P7 ; (v + 3)
43fa : e6 43 __ INC T0 + 0 
.s182:
43fc : a9 10 __ LDA #$10
43fe : 85 44 __ STA T2 + 0 
4400 : a5 14 __ LDA P7 ; (v + 3)
4402 : d0 0c __ BNE $4410 ; (nforml.s42 + 0)
.s1024:
4404 : a5 13 __ LDA P6 ; (v + 2)
4406 : d0 08 __ BNE $4410 ; (nforml.s42 + 0)
.s1025:
4408 : a5 12 __ LDA P5 ; (v + 1)
440a : d0 04 __ BNE $4410 ; (nforml.s42 + 0)
.s1026:
440c : c5 11 __ CMP P4 ; (v + 0)
440e : b0 0e __ BCS $441e ; (nforml.s7 + 0)
.s42:
4410 : a0 03 __ LDY #$03
4412 : b1 0d __ LDA (P0),y ; (si + 0)
4414 : 85 45 __ STA T5 + 0 
4416 : c8 __ __ INY
4417 : b1 0d __ LDA (P0),y ; (si + 0)
4419 : 85 46 __ STA T5 + 1 
441b : 4c e8 44 JMP $44e8 ; (nforml.l6 + 0)
.s7:
441e : a0 02 __ LDY #$02
4420 : b1 0d __ LDA (P0),y ; (si + 0)
4422 : c9 ff __ CMP #$ff
4424 : d0 04 __ BNE $442a ; (nforml.s80 + 0)
.s81:
4426 : a9 0f __ LDA #$0f
4428 : d0 05 __ BNE $442f ; (nforml.s1039 + 0)
.s80:
442a : 38 __ __ SEC
442b : a9 10 __ LDA #$10
442d : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
442f : a8 __ __ TAY
4430 : c4 44 __ CPY T2 + 0 
4432 : b0 0d __ BCS $4441 ; (nforml.s10 + 0)
.s9:
4434 : a9 30 __ LDA #$30
.l1040:
4436 : c6 44 __ DEC T2 + 0 
4438 : a6 44 __ LDX T2 + 0 
443a : 9d f0 bf STA $bff0,x ; (buffer + 0)
443d : c4 44 __ CPY T2 + 0 
443f : 90 f5 __ BCC $4436 ; (nforml.l1040 + 0)
.s10:
4441 : a0 07 __ LDY #$07
4443 : b1 0d __ LDA (P0),y ; (si + 0)
4445 : f0 20 __ BEQ $4467 ; (nforml.s13 + 0)
.s14:
4447 : a0 04 __ LDY #$04
4449 : b1 0d __ LDA (P0),y ; (si + 0)
444b : d0 1a __ BNE $4467 ; (nforml.s13 + 0)
.s1013:
444d : 88 __ __ DEY
444e : b1 0d __ LDA (P0),y ; (si + 0)
4450 : c9 10 __ CMP #$10
4452 : d0 13 __ BNE $4467 ; (nforml.s13 + 0)
.s11:
4454 : a9 58 __ LDA #$58
4456 : a6 44 __ LDX T2 + 0 
4458 : 9d ef bf STA $bfef,x ; (buff + 49)
445b : 8a __ __ TXA
445c : 18 __ __ CLC
445d : 69 fe __ ADC #$fe
445f : 85 44 __ STA T2 + 0 
4461 : aa __ __ TAX
4462 : a9 30 __ LDA #$30
4464 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
4467 : a9 00 __ LDA #$00
4469 : 85 1b __ STA ACCU + 0 
446b : a5 43 __ LDA T0 + 0 
446d : f0 06 __ BEQ $4475 ; (nforml.s16 + 0)
.s15:
446f : c6 44 __ DEC T2 + 0 
4471 : a9 2d __ LDA #$2d
4473 : d0 0a __ BNE $447f ; (nforml.s1038 + 0)
.s16:
4475 : a0 05 __ LDY #$05
4477 : b1 0d __ LDA (P0),y ; (si + 0)
4479 : f0 09 __ BEQ $4484 ; (nforml.s163 + 0)
.s18:
447b : c6 44 __ DEC T2 + 0 
447d : a9 2b __ LDA #$2b
.s1038:
447f : a6 44 __ LDX T2 + 0 
4481 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
4484 : a0 06 __ LDY #$06
4486 : b1 0d __ LDA (P0),y ; (si + 0)
4488 : d0 33 __ BNE $44bd ; (nforml.s24 + 0)
.l30:
448a : a0 01 __ LDY #$01
448c : b1 0d __ LDA (P0),y ; (si + 0)
448e : 18 __ __ CLC
448f : 65 44 __ ADC T2 + 0 
4491 : b0 04 __ BCS $4497 ; (nforml.s31 + 0)
.s1006:
4493 : c9 11 __ CMP #$11
4495 : 90 0d __ BCC $44a4 ; (nforml.s33 + 0)
.s31:
4497 : c6 44 __ DEC T2 + 0 
4499 : a0 00 __ LDY #$00
449b : b1 0d __ LDA (P0),y ; (si + 0)
449d : a6 44 __ LDX T2 + 0 
449f : 9d f0 bf STA $bff0,x ; (buffer + 0)
44a2 : b0 e6 __ BCS $448a ; (nforml.l30 + 0)
.s33:
44a4 : a6 44 __ LDX T2 + 0 
44a6 : e0 10 __ CPX #$10
44a8 : b0 0e __ BCS $44b8 ; (nforml.s23 + 0)
.s34:
44aa : 88 __ __ DEY
.l1035:
44ab : bd f0 bf LDA $bff0,x ; (buffer + 0)
44ae : 91 0f __ STA (P2),y ; (str + 0)
44b0 : e8 __ __ INX
44b1 : e0 10 __ CPX #$10
44b3 : c8 __ __ INY
44b4 : 90 f5 __ BCC $44ab ; (nforml.l1035 + 0)
.s1036:
44b6 : 84 1b __ STY ACCU + 0 
.s23:
44b8 : a9 00 __ LDA #$00
44ba : 85 1c __ STA ACCU + 1 
.s1001:
44bc : 60 __ __ RTS
.s24:
44bd : a6 44 __ LDX T2 + 0 
44bf : e0 10 __ CPX #$10
44c1 : b0 1a __ BCS $44dd ; (nforml.l27 + 0)
.s25:
44c3 : a0 00 __ LDY #$00
.l1033:
44c5 : bd f0 bf LDA $bff0,x ; (buffer + 0)
44c8 : 91 0f __ STA (P2),y ; (str + 0)
44ca : e8 __ __ INX
44cb : e0 10 __ CPX #$10
44cd : c8 __ __ INY
44ce : 90 f5 __ BCC $44c5 ; (nforml.l1033 + 0)
.s1034:
44d0 : 84 1b __ STY ACCU + 0 
44d2 : b0 09 __ BCS $44dd ; (nforml.l27 + 0)
.s28:
44d4 : 88 __ __ DEY
44d5 : b1 0d __ LDA (P0),y ; (si + 0)
44d7 : a4 1b __ LDY ACCU + 0 
44d9 : 91 0f __ STA (P2),y ; (str + 0)
44db : e6 1b __ INC ACCU + 0 
.l27:
44dd : a5 1b __ LDA ACCU + 0 
44df : a0 01 __ LDY #$01
44e1 : d1 0d __ CMP (P0),y ; (si + 0)
44e3 : 90 ef __ BCC $44d4 ; (nforml.s28 + 0)
44e5 : 4c b8 44 JMP $44b8 ; (nforml.s23 + 0)
.l6:
44e8 : a5 11 __ LDA P4 ; (v + 0)
44ea : 85 1b __ STA ACCU + 0 
44ec : a5 12 __ LDA P5 ; (v + 1)
44ee : 85 1c __ STA ACCU + 1 
44f0 : a5 13 __ LDA P6 ; (v + 2)
44f2 : 85 1d __ STA ACCU + 2 
44f4 : a5 14 __ LDA P7 ; (v + 3)
44f6 : 85 1e __ STA ACCU + 3 
44f8 : a5 45 __ LDA T5 + 0 
44fa : 85 03 __ STA WORK + 0 
44fc : a5 46 __ LDA T5 + 1 
44fe : 85 04 __ STA WORK + 1 
4500 : a9 00 __ LDA #$00
4502 : 85 05 __ STA WORK + 2 
4504 : 85 06 __ STA WORK + 3 
4506 : 20 ea 57 JSR $57ea ; (divmod32 + 0)
4509 : a5 08 __ LDA WORK + 5 
450b : 30 08 __ BMI $4515 ; (nforml.s78 + 0)
.s1023:
450d : d0 0a __ BNE $4519 ; (nforml.s77 + 0)
.s1022:
450f : a5 07 __ LDA WORK + 4 
4511 : c9 0a __ CMP #$0a
4513 : b0 04 __ BCS $4519 ; (nforml.s77 + 0)
.s78:
4515 : a9 30 __ LDA #$30
4517 : d0 02 __ BNE $451b ; (nforml.s79 + 0)
.s77:
4519 : a9 37 __ LDA #$37
.s79:
451b : 18 __ __ CLC
451c : 65 07 __ ADC WORK + 4 
451e : c6 44 __ DEC T2 + 0 
4520 : a6 44 __ LDX T2 + 0 
4522 : 9d f0 bf STA $bff0,x ; (buffer + 0)
4525 : a5 1b __ LDA ACCU + 0 
4527 : 85 11 __ STA P4 ; (v + 0)
4529 : a5 1c __ LDA ACCU + 1 
452b : 85 12 __ STA P5 ; (v + 1)
452d : a5 1d __ LDA ACCU + 2 
452f : 85 13 __ STA P6 ; (v + 2)
4531 : a5 1e __ LDA ACCU + 3 
4533 : 85 14 __ STA P7 ; (v + 3)
4535 : d0 b1 __ BNE $44e8 ; (nforml.l6 + 0)
.s1018:
4537 : a5 13 __ LDA P6 ; (v + 2)
4539 : d0 ad __ BNE $44e8 ; (nforml.l6 + 0)
.s1019:
453b : a5 12 __ LDA P5 ; (v + 1)
453d : d0 a9 __ BNE $44e8 ; (nforml.l6 + 0)
.s1020:
453f : c5 11 __ CMP P4 ; (v + 0)
4541 : 90 a5 __ BCC $44e8 ; (nforml.l6 + 0)
4543 : 4c 1e 44 JMP $441e ; (nforml.s7 + 0)
--------------------------------------------------------------------
4546 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
4556 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
4566 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->i16
.s0:
4571 : 20 7f 45 JSR $457f ; (getpch + 0)
4574 : c9 00 __ CMP #$00
4576 : f0 f9 __ BEQ $4571 ; (getch.s0 + 0)
4578 : 85 1b __ STA ACCU + 0 
457a : a9 00 __ LDA #$00
457c : 85 1c __ STA ACCU + 1 
.s1001:
457e : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
457f : 20 e4 ff JSR $ffe4 
4582 : ae 9f 58 LDX $589f ; (giocharmap + 0)
4585 : e0 01 __ CPX #$01
4587 : 90 26 __ BCC $45af ; (getpch + 48)
4589 : c9 0d __ CMP #$0d
458b : d0 02 __ BNE $458f ; (getpch + 16)
458d : a9 0a __ LDA #$0a
458f : e0 02 __ CPX #$02
4591 : 90 1c __ BCC $45af ; (getpch + 48)
4593 : c9 db __ CMP #$db
4595 : b0 18 __ BCS $45af ; (getpch + 48)
4597 : c9 41 __ CMP #$41
4599 : 90 14 __ BCC $45af ; (getpch + 48)
459b : c9 c1 __ CMP #$c1
459d : 90 02 __ BCC $45a1 ; (getpch + 34)
459f : 49 a0 __ EOR #$a0
45a1 : c9 7b __ CMP #$7b
45a3 : b0 0a __ BCS $45af ; (getpch + 48)
45a5 : c9 61 __ CMP #$61
45a7 : b0 04 __ BCS $45ad ; (getpch + 46)
45a9 : c9 5b __ CMP #$5b
45ab : b0 02 __ BCS $45af ; (getpch + 48)
45ad : 49 20 __ EOR #$20
45af : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
45b0 : 20 81 ff JSR $ff81 
.s1001:
45b3 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
45b4 : 24 d7 __ BIT $d7 
45b6 : 30 03 __ BMI $45bb ; (screen_setmode.s1001 + 0)
.s6:
45b8 : 20 5f ff JSR $ff5f 
.s1001:
45bb : 60 __ __ RTS
--------------------------------------------------------------------
45bc : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
45cc : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
45dc : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
45e6 : __ __ __ BYT 4f 56 4c 31 00                                  : OVL1.
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
45eb : a5 0d __ LDA P0 
45ed : a6 0e __ LDX P1 
45ef : 20 68 ff JSR $ff68 
.s1001:
45f2 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
45f3 : a5 0d __ LDA P0 
45f5 : 05 0e __ ORA P1 
45f7 : f0 08 __ BEQ $4601 ; (krnio_setnam.s0 + 14)
45f9 : a0 ff __ LDY #$ff
45fb : c8 __ __ INY
45fc : b1 0d __ LDA (P0),y 
45fe : d0 fb __ BNE $45fb ; (krnio_setnam.s0 + 8)
4600 : 98 __ __ TYA
4601 : a6 0d __ LDX P0 
4603 : a4 0e __ LDY P1 
4605 : 20 bd ff JSR $ffbd 
.s1001:
4608 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
4609 : a5 0d __ LDA P0 
460b : a6 0e __ LDX P1 
460d : a4 0f __ LDY P2 
460f : 20 ba ff JSR $ffba 
4612 : a9 00 __ LDA #$00
4614 : a2 00 __ LDX #$00
4616 : a0 00 __ LDY #$00
4618 : 20 d5 ff JSR $ffd5 
461b : a9 00 __ LDA #$00
461d : b0 02 __ BCS $4621 ; (krnio_load.s0 + 24)
461f : a9 01 __ LDA #$01
4621 : 85 1b __ STA ACCU + 0 
.s1001:
4623 : a5 1b __ LDA ACCU + 0 
4625 : 60 __ __ RTS
--------------------------------------------------------------------
4626 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
4636 : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
4644 : a9 01 __ LDA #$01
4646 : 85 0d __ STA P0 
4648 : a9 00 __ LDA #$00
464a : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
464c : a5 0d __ LDA P0 
464e : 85 1b __ STA ACCU + 0 
4650 : a5 0e __ LDA P1 
4652 : 85 1c __ STA ACCU + 1 
4654 : ae ff 4f LDX $4fff ; (spentry + 0)
4657 : 9a __ __ TXS
4658 : a9 4c __ LDA #$4c
465a : 85 54 __ STA $54 
465c : a9 00 __ LDA #$00
465e : 85 13 __ STA P6 
.s1001:
4660 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
4661 : a5 53 __ LDA T9 + 0 
4663 : 8d f9 bf STA $bff9 ; (buffer + 9)
4666 : a5 54 __ LDA T9 + 1 
4668 : 8d fa bf STA $bffa ; (buffer + 10)
.s0:
466b : a6 13 __ LDX P6 ; (mode + 0)
466d : bd f0 50 LDA $50f0,x ; (__multab36L + 0)
4670 : 85 47 __ STA T1 + 0 
4672 : aa __ __ TAX
4673 : 18 __ __ CLC
4674 : 69 00 __ ADC #$00
4676 : 85 49 __ STA T2 + 0 
4678 : a9 59 __ LDA #$59
467a : 69 00 __ ADC #$00
467c : 85 4a __ STA T2 + 1 
467e : bd 04 59 LDA $5904,x ; (vdc_modes + 4)
4681 : f0 0a __ BEQ $468d ; (vdc_set_mode.s3 + 0)
.s4:
4683 : ad 1e 5a LDA $5a1e ; (vdc_state + 0)
4686 : c9 10 __ CMP #$10
4688 : d0 03 __ BNE $468d ; (vdc_set_mode.s3 + 0)
468a : 4c 6d 49 JMP $496d ; (vdc_set_mode.s1001 + 0)
.s3:
468d : a9 00 __ LDA #$00
468f : 8d 34 5a STA $5a34 ; (vdc_state + 22)
4692 : 8d 35 5a STA $5a35 ; (vdc_state + 23)
4695 : 8d 36 5a STA $5a36 ; (vdc_state + 24)
4698 : a0 09 __ LDY #$09
469a : b1 49 __ LDA (T2 + 0),y 
469c : 8d 2a 5a STA $5a2a ; (vdc_state + 12)
469f : c8 __ __ INY
46a0 : b1 49 __ LDA (T2 + 0),y 
46a2 : 8d 2b 5a STA $5a2b ; (vdc_state + 13)
46a5 : c8 __ __ INY
46a6 : b1 49 __ LDA (T2 + 0),y 
46a8 : 8d 2c 5a STA $5a2c ; (vdc_state + 14)
46ab : c8 __ __ INY
46ac : b1 49 __ LDA (T2 + 0),y 
46ae : 8d 2d 5a STA $5a2d ; (vdc_state + 15)
46b1 : a0 0f __ LDY #$0f
46b3 : b1 49 __ LDA (T2 + 0),y 
46b5 : 8d 30 5a STA $5a30 ; (vdc_state + 18)
46b8 : c8 __ __ INY
46b9 : b1 49 __ LDA (T2 + 0),y 
46bb : 8d 31 5a STA $5a31 ; (vdc_state + 19)
46be : c8 __ __ INY
46bf : b1 49 __ LDA (T2 + 0),y 
46c1 : 8d 32 5a STA $5a32 ; (vdc_state + 20)
46c4 : c8 __ __ INY
46c5 : b1 49 __ LDA (T2 + 0),y 
46c7 : 8d 33 5a STA $5a33 ; (vdc_state + 21)
46ca : a0 00 __ LDY #$00
46cc : b1 49 __ LDA (T2 + 0),y 
46ce : 85 44 __ STA T3 + 0 
46d0 : c8 __ __ INY
46d1 : b1 49 __ LDA (T2 + 0),y 
46d3 : 85 45 __ STA T3 + 1 
46d5 : 8d 22 5a STA $5a22 ; (vdc_state + 4)
46d8 : a5 44 __ LDA T3 + 0 
46da : 8d 21 5a STA $5a21 ; (vdc_state + 3)
46dd : c8 __ __ INY
46de : b1 49 __ LDA (T2 + 0),y 
46e0 : 85 1b __ STA ACCU + 0 
46e2 : c8 __ __ INY
46e3 : b1 49 __ LDA (T2 + 0),y 
46e5 : 85 1c __ STA ACCU + 1 
46e7 : 8d 24 5a STA $5a24 ; (vdc_state + 6)
46ea : a5 1b __ LDA ACCU + 0 
46ec : 8d 23 5a STA $5a23 ; (vdc_state + 5)
46ef : a0 05 __ LDY #$05
46f1 : b1 49 __ LDA (T2 + 0),y 
46f3 : 85 4b __ STA T5 + 0 
46f5 : c8 __ __ INY
46f6 : b1 49 __ LDA (T2 + 0),y 
46f8 : 85 4c __ STA T5 + 1 
46fa : 8d 27 5a STA $5a27 ; (vdc_state + 9)
46fd : a5 4b __ LDA T5 + 0 
46ff : 8d 26 5a STA $5a26 ; (vdc_state + 8)
4702 : c8 __ __ INY
4703 : b1 49 __ LDA (T2 + 0),y 
4705 : 85 4d __ STA T6 + 0 
4707 : c8 __ __ INY
4708 : b1 49 __ LDA (T2 + 0),y 
470a : 85 4e __ STA T6 + 1 
470c : 8d 29 5a STA $5a29 ; (vdc_state + 11)
470f : a5 4d __ LDA T6 + 0 
4711 : 8d 28 5a STA $5a28 ; (vdc_state + 10)
4714 : a0 0d __ LDY #$0d
4716 : b1 49 __ LDA (T2 + 0),y 
4718 : 85 4f __ STA T7 + 0 
471a : c8 __ __ INY
471b : b1 49 __ LDA (T2 + 0),y 
471d : 85 50 __ STA T7 + 1 
471f : 8d 2f 5a STA $5a2f ; (vdc_state + 17)
4722 : a5 4f __ LDA T7 + 0 
4724 : 8d 2e 5a STA $5a2e ; (vdc_state + 16)
4727 : a5 1b __ LDA ACCU + 0 
4729 : 05 1c __ ORA ACCU + 1 
472b : f0 3c __ BEQ $4769 ; (vdc_set_mode.s6 + 0)
.s374:
472d : a9 00 __ LDA #$00
472f : 85 51 __ STA T8 + 0 
4731 : 85 52 __ STA T8 + 1 
4733 : a9 37 __ LDA #$37
4735 : 85 53 __ STA T9 + 0 
4737 : a9 5a __ LDA #$5a
4739 : 85 54 __ STA T9 + 1 
473b : a2 00 __ LDX #$00
.l8:
473d : a5 51 __ LDA T8 + 0 
473f : a0 00 __ LDY #$00
4741 : 91 53 __ STA (T9 + 0),y 
4743 : a5 52 __ LDA T8 + 1 
4745 : c8 __ __ INY
4746 : 91 53 __ STA (T9 + 0),y 
4748 : 18 __ __ CLC
4749 : a5 44 __ LDA T3 + 0 
474b : 65 51 __ ADC T8 + 0 
474d : 85 51 __ STA T8 + 0 
474f : a5 45 __ LDA T3 + 1 
4751 : 65 52 __ ADC T8 + 1 
4753 : 85 52 __ STA T8 + 1 
4755 : 18 __ __ CLC
4756 : a5 53 __ LDA T9 + 0 
4758 : 69 02 __ ADC #$02
475a : 85 53 __ STA T9 + 0 
475c : 90 02 __ BCC $4760 ; (vdc_set_mode.s1115 + 0)
.s1114:
475e : e6 54 __ INC T9 + 1 
.s1115:
4760 : e8 __ __ INX
4761 : a5 1c __ LDA ACCU + 1 
4763 : d0 d8 __ BNE $473d ; (vdc_set_mode.l8 + 0)
.s1108:
4765 : e4 1b __ CPX ACCU + 0 
4767 : 90 d4 __ BCC $473d ; (vdc_set_mode.l8 + 0)
.s6:
4769 : a9 22 __ LDA #$22
476b : 8d 00 d6 STA $d600 
.l1577:
476e : 2c 00 d6 BIT $d600 
4771 : 10 fb __ BPL $476e ; (vdc_set_mode.l1577 + 0)
.s16:
4773 : a9 80 __ LDA #$80
4775 : 8d 01 d6 STA $d601 
4778 : a9 0c __ LDA #$0c
477a : 8d 00 d6 STA $d600 
.l1579:
477d : 2c 00 d6 BIT $d600 
4780 : 10 fb __ BPL $477d ; (vdc_set_mode.l1579 + 0)
.s22:
4782 : a5 4c __ LDA T5 + 1 
4784 : 8d 01 d6 STA $d601 
4787 : a9 0d __ LDA #$0d
4789 : 8d 00 d6 STA $d600 
.l1581:
478c : 2c 00 d6 BIT $d600 
478f : 10 fb __ BPL $478c ; (vdc_set_mode.l1581 + 0)
.s27:
4791 : a5 4b __ LDA T5 + 0 
4793 : 8d 01 d6 STA $d601 
4796 : a9 14 __ LDA #$14
4798 : 8d 00 d6 STA $d600 
.l1583:
479b : 2c 00 d6 BIT $d600 
479e : 10 fb __ BPL $479b ; (vdc_set_mode.l1583 + 0)
.s32:
47a0 : a5 4e __ LDA T6 + 1 
47a2 : 8d 01 d6 STA $d601 
47a5 : a9 15 __ LDA #$15
47a7 : 8d 00 d6 STA $d600 
.l1585:
47aa : 2c 00 d6 BIT $d600 
47ad : 10 fb __ BPL $47aa ; (vdc_set_mode.l1585 + 0)
.s37:
47af : a5 4d __ LDA T6 + 0 
47b1 : 8d 01 d6 STA $d601 
47b4 : a6 47 __ LDX T1 + 0 
47b6 : bd 0e 59 LDA $590e,x ; (vdc_modes + 14)
47b9 : 85 45 __ STA T3 + 1 
47bb : a9 1c __ LDA #$1c
47bd : 8d 00 d6 STA $d600 
.l1587:
47c0 : 2c 00 d6 BIT $d600 
47c3 : 10 fb __ BPL $47c0 ; (vdc_set_mode.l1587 + 0)
.s44:
47c5 : ad 01 d6 LDA $d601 
47c8 : 29 10 __ AND #$10
47ca : 45 45 __ EOR T3 + 1 
47cc : 29 1f __ AND #$1f
47ce : 45 45 __ EOR T3 + 1 
47d0 : aa __ __ TAX
47d1 : a9 1c __ LDA #$1c
47d3 : 8d 00 d6 STA $d600 
.l1589:
47d6 : 2c 00 d6 BIT $d600 
47d9 : 10 fb __ BPL $47d6 ; (vdc_set_mode.l1589 + 0)
.s50:
47db : 8e 01 d6 STX $d601 
47de : a5 4f __ LDA T7 + 0 
47e0 : 85 0d __ STA P0 
47e2 : a5 50 __ LDA T7 + 1 
47e4 : 85 0e __ STA P1 
47e6 : 20 0a 13 JSR $130a ; (bnk_redef_charset.s0 + 0)
47e9 : 18 __ __ CLC
47ea : a9 13 __ LDA #$13
47ec : 65 47 __ ADC T1 + 0 
47ee : 85 47 __ STA T1 + 0 
47f0 : a9 59 __ LDA #$59
47f2 : 69 00 __ ADC #$00
47f4 : 85 48 __ STA T1 + 1 
47f6 : a9 00 __ LDA #$00
47f8 : 85 43 __ STA T0 + 0 
.l52:
47fa : a4 43 __ LDY T0 + 0 
47fc : b1 47 __ LDA (T1 + 0),y 
47fe : 85 1b __ STA ACCU + 0 
4800 : c8 __ __ INY
4801 : b1 47 __ LDA (T1 + 0),y 
4803 : aa __ __ TAX
4804 : a5 1b __ LDA ACCU + 0 
4806 : 8d 00 d6 STA $d600 
4809 : c8 __ __ INY
480a : 84 43 __ STY T0 + 0 
.l1591:
480c : 2c 00 d6 BIT $d600 
480f : 10 fb __ BPL $480c ; (vdc_set_mode.l1591 + 0)
.s58:
4811 : 8e 01 d6 STX $d601 
4814 : 18 __ __ CLC
4815 : a5 49 __ LDA T2 + 0 
4817 : 65 43 __ ADC T0 + 0 
4819 : 85 44 __ STA T3 + 0 
481b : a5 4a __ LDA T2 + 1 
481d : 69 00 __ ADC #$00
481f : 85 45 __ STA T3 + 1 
4821 : a0 13 __ LDY #$13
4823 : b1 44 __ LDA (T3 + 0),y 
4825 : c9 ff __ CMP #$ff
4827 : d0 d1 __ BNE $47fa ; (vdc_set_mode.l52 + 0)
.s53:
4829 : a0 04 __ LDY #$04
482b : b1 49 __ LDA (T2 + 0),y 
482d : f0 05 __ BEQ $4834 ; (vdc_set_mode.s60 + 0)
.s62:
482f : ad 1f 5a LDA $5a1f ; (vdc_state + 1)
4832 : f0 0f __ BEQ $4843 ; (vdc_set_mode.s59 + 0)
.s60:
4834 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
4837 : 85 47 __ STA T1 + 0 
4839 : ad 23 5a LDA $5a23 ; (vdc_state + 5)
483c : 85 49 __ STA T2 + 0 
483e : a2 00 __ LDX #$00
4840 : 4c 54 4a JMP $4a54 ; (vdc_set_mode.l242 + 0)
.s59:
4843 : ad 1e 5a LDA $5a1e ; (vdc_state + 0)
4846 : c9 10 __ CMP #$10
4848 : d0 03 __ BNE $484d ; (vdc_set_mode.s67 + 0)
484a : 4c 5e 49 JMP $495e ; (vdc_set_mode.s61 + 0)
.s67:
484d : ad 1f 5a LDA $5a1f ; (vdc_state + 1)
4850 : f0 03 __ BEQ $4855 ; (vdc_set_mode.s66 + 0)
4852 : 4c 5e 49 JMP $495e ; (vdc_set_mode.s61 + 0)
.s66:
4855 : a9 22 __ LDA #$22
4857 : 8d 00 d6 STA $d600 
.l1624:
485a : 2c 00 d6 BIT $d600 
485d : 10 fb __ BPL $485a ; (vdc_set_mode.l1624 + 0)
.s74:
485f : a9 80 __ LDA #$80
4861 : 8d 01 d6 STA $d601 
4864 : a2 00 __ LDX #$00
4866 : a0 ff __ LDY #$ff
.l77:
4868 : a9 12 __ LDA #$12
486a : 8d 00 d6 STA $d600 
.l1626:
486d : 2c 00 d6 BIT $d600 
4870 : 10 fb __ BPL $486d ; (vdc_set_mode.l1626 + 0)
.s86:
4872 : 8e 01 d6 STX $d601 
4875 : a9 13 __ LDA #$13
4877 : 8d 00 d6 STA $d600 
.l1628:
487a : 2c 00 d6 BIT $d600 
487d : 10 fb __ BPL $487a ; (vdc_set_mode.l1628 + 0)
.s91:
487f : a9 00 __ LDA #$00
4881 : 8d 01 d6 STA $d601 
4884 : a9 1f __ LDA #$1f
4886 : 8d 00 d6 STA $d600 
.l1630:
4889 : 2c 00 d6 BIT $d600 
488c : 10 fb __ BPL $4889 ; (vdc_set_mode.l1630 + 0)
.s95:
488e : a9 00 __ LDA #$00
4890 : 8d 01 d6 STA $d601 
4893 : a9 18 __ LDA #$18
4895 : 8d 00 d6 STA $d600 
.l1632:
4898 : 2c 00 d6 BIT $d600 
489b : 10 fb __ BPL $4898 ; (vdc_set_mode.l1632 + 0)
.s101:
489d : ad 01 d6 LDA $d601 
48a0 : 29 7f __ AND #$7f
48a2 : 85 49 __ STA T2 + 0 
48a4 : a9 18 __ LDA #$18
48a6 : 8d 00 d6 STA $d600 
.l1634:
48a9 : 2c 00 d6 BIT $d600 
48ac : 10 fb __ BPL $48a9 ; (vdc_set_mode.l1634 + 0)
.s107:
48ae : a5 49 __ LDA T2 + 0 
48b0 : 8d 01 d6 STA $d601 
48b3 : a9 1e __ LDA #$1e
48b5 : 8d 00 d6 STA $d600 
.l1636:
48b8 : 2c 00 d6 BIT $d600 
48bb : 10 fb __ BPL $48b8 ; (vdc_set_mode.l1636 + 0)
.s112:
48bd : a9 ff __ LDA #$ff
48bf : 8d 01 d6 STA $d601 
48c2 : e8 __ __ INX
48c3 : 88 __ __ DEY
48c4 : d0 a2 __ BNE $4868 ; (vdc_set_mode.l77 + 0)
.s79:
48c6 : a9 12 __ LDA #$12
48c8 : 8d 00 d6 STA $d600 
.l1639:
48cb : 2c 00 d6 BIT $d600 
48ce : 10 fb __ BPL $48cb ; (vdc_set_mode.l1639 + 0)
.s119:
48d0 : 8e 01 d6 STX $d601 
48d3 : a9 13 __ LDA #$13
48d5 : 8d 00 d6 STA $d600 
.l1641:
48d8 : 2c 00 d6 BIT $d600 
48db : 10 fb __ BPL $48d8 ; (vdc_set_mode.l1641 + 0)
.s124:
48dd : 8c 01 d6 STY $d601 
48e0 : a9 1f __ LDA #$1f
48e2 : 8d 00 d6 STA $d600 
.l1643:
48e5 : 2c 00 d6 BIT $d600 
48e8 : 10 fb __ BPL $48e5 ; (vdc_set_mode.l1643 + 0)
.s128:
48ea : 8c 01 d6 STY $d601 
48ed : a9 18 __ LDA #$18
48ef : 8d 00 d6 STA $d600 
.l1645:
48f2 : 2c 00 d6 BIT $d600 
48f5 : 10 fb __ BPL $48f2 ; (vdc_set_mode.l1645 + 0)
.s134:
48f7 : ad 01 d6 LDA $d601 
48fa : 29 7f __ AND #$7f
48fc : aa __ __ TAX
48fd : a9 18 __ LDA #$18
48ff : 8d 00 d6 STA $d600 
.l1647:
4902 : 2c 00 d6 BIT $d600 
4905 : 10 fb __ BPL $4902 ; (vdc_set_mode.l1647 + 0)
.s140:
4907 : 8e 01 d6 STX $d601 
490a : a9 1e __ LDA #$1e
490c : 8d 00 d6 STA $d600 
.l1649:
490f : 2c 00 d6 BIT $d600 
4912 : 10 fb __ BPL $490f ; (vdc_set_mode.l1649 + 0)
.s145:
4914 : a9 ff __ LDA #$ff
4916 : 8d 01 d6 STA $d601 
4919 : a9 1c __ LDA #$1c
491b : 8d 00 d6 STA $d600 
.l1651:
491e : 2c 00 d6 BIT $d600 
4921 : 10 fb __ BPL $491e ; (vdc_set_mode.l1651 + 0)
.s151:
4923 : ad 01 d6 LDA $d601 
4926 : 09 10 __ ORA #$10
4928 : aa __ __ TAX
4929 : a9 1c __ LDA #$1c
492b : 8d 00 d6 STA $d600 
.l1653:
492e : 2c 00 d6 BIT $d600 
4931 : 10 fb __ BPL $492e ; (vdc_set_mode.l1653 + 0)
.s157:
4933 : 8e 01 d6 STX $d601 
4936 : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
4939 : ad 21 5a LDA $5a21 ; (vdc_state + 3)
493c : 85 47 __ STA T1 + 0 
493e : ad 23 5a LDA $5a23 ; (vdc_state + 5)
4941 : 85 49 __ STA T2 + 0 
4943 : a2 00 __ LDX #$00
.l161:
4945 : 8a __ __ TXA
4946 : e4 49 __ CPX T2 + 0 
4948 : 90 2e __ BCC $4978 ; (vdc_set_mode.s162 + 0)
.s159:
494a : a9 22 __ LDA #$22
494c : 8d 00 d6 STA $d600 
.l1680:
494f : 2c 00 d6 BIT $d600 
4952 : 10 fb __ BPL $494f ; (vdc_set_mode.l1680 + 0)
.s239:
4954 : a9 7d __ LDA #$7d
4956 : 8d 01 d6 STA $d601 
4959 : a9 01 __ LDA #$01
495b : 8d 1f 5a STA $5a1f ; (vdc_state + 1)
.s61:
495e : a9 22 __ LDA #$22
4960 : 8d 00 d6 STA $d600 
.l1621:
4963 : 2c 00 d6 BIT $d600 
4966 : 10 fb __ BPL $4963 ; (vdc_set_mode.l1621 + 0)
.s320:
4968 : a9 7d __ LDA #$7d
496a : 8d 01 d6 STA $d601 
.s1001:
496d : ad f9 bf LDA $bff9 ; (buffer + 9)
4970 : 85 53 __ STA T9 + 0 
4972 : ad fa bf LDA $bffa ; (buffer + 10)
4975 : 85 54 __ STA T9 + 1 
4977 : 60 __ __ RTS
.s162:
4978 : 0a __ __ ASL
4979 : a8 __ __ TAY
497a : b9 38 5a LDA $5a38,y ; (multab + 1)
497d : 85 45 __ STA T3 + 1 
497f : ad 25 5a LDA $5a25 ; (vdc_state + 7)
4982 : 85 46 __ STA T11 + 0 
4984 : a9 12 __ LDA #$12
4986 : 8d 00 d6 STA $d600 
4989 : a5 47 __ LDA T1 + 0 
498b : 38 __ __ SEC
498c : e9 01 __ SBC #$01
498e : 85 4b __ STA T5 + 0 
4990 : b9 37 5a LDA $5a37,y ; (multab + 0)
4993 : 85 44 __ STA T3 + 0 
4995 : 18 __ __ CLC
4996 : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
4999 : a8 __ __ TAY
499a : a5 45 __ LDA T3 + 1 
499c : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l1656:
499f : 2c 00 d6 BIT $d600 
49a2 : 10 fb __ BPL $499f ; (vdc_set_mode.l1656 + 0)
.s174:
49a4 : 8d 01 d6 STA $d601 
49a7 : a9 13 __ LDA #$13
49a9 : 8d 00 d6 STA $d600 
.l1658:
49ac : 2c 00 d6 BIT $d600 
49af : 10 fb __ BPL $49ac ; (vdc_set_mode.l1658 + 0)
.s179:
49b1 : 8c 01 d6 STY $d601 
49b4 : a9 1f __ LDA #$1f
49b6 : 8d 00 d6 STA $d600 
.l1660:
49b9 : 2c 00 d6 BIT $d600 
49bc : 10 fb __ BPL $49b9 ; (vdc_set_mode.l1660 + 0)
.s183:
49be : a9 20 __ LDA #$20
49c0 : 8d 01 d6 STA $d601 
49c3 : a9 18 __ LDA #$18
49c5 : 8d 00 d6 STA $d600 
.l1662:
49c8 : 2c 00 d6 BIT $d600 
49cb : 10 fb __ BPL $49c8 ; (vdc_set_mode.l1662 + 0)
.s189:
49cd : ad 01 d6 LDA $d601 
49d0 : 29 7f __ AND #$7f
49d2 : a8 __ __ TAY
49d3 : a9 18 __ LDA #$18
49d5 : 8d 00 d6 STA $d600 
.l1664:
49d8 : 2c 00 d6 BIT $d600 
49db : 10 fb __ BPL $49d8 ; (vdc_set_mode.l1664 + 0)
.s195:
49dd : 8c 01 d6 STY $d601 
49e0 : a9 1e __ LDA #$1e
49e2 : 8d 00 d6 STA $d600 
.l1666:
49e5 : 2c 00 d6 BIT $d600 
49e8 : 10 fb __ BPL $49e5 ; (vdc_set_mode.l1666 + 0)
.s200:
49ea : a5 4b __ LDA T5 + 0 
49ec : 8d 01 d6 STA $d601 
49ef : ad 28 5a LDA $5a28 ; (vdc_state + 10)
49f2 : 18 __ __ CLC
49f3 : 65 44 __ ADC T3 + 0 
49f5 : a8 __ __ TAY
49f6 : a9 12 __ LDA #$12
49f8 : 8d 00 d6 STA $d600 
49fb : ad 29 5a LDA $5a29 ; (vdc_state + 11)
49fe : 65 45 __ ADC T3 + 1 
.l1668:
4a00 : 2c 00 d6 BIT $d600 
4a03 : 10 fb __ BPL $4a00 ; (vdc_set_mode.l1668 + 0)
.s207:
4a05 : 8d 01 d6 STA $d601 
4a08 : a9 13 __ LDA #$13
4a0a : 8d 00 d6 STA $d600 
.l1670:
4a0d : 2c 00 d6 BIT $d600 
4a10 : 10 fb __ BPL $4a0d ; (vdc_set_mode.l1670 + 0)
.s212:
4a12 : 8c 01 d6 STY $d601 
4a15 : a9 1f __ LDA #$1f
4a17 : 8d 00 d6 STA $d600 
.l1672:
4a1a : 2c 00 d6 BIT $d600 
4a1d : 10 fb __ BPL $4a1a ; (vdc_set_mode.l1672 + 0)
.s216:
4a1f : a5 46 __ LDA T11 + 0 
4a21 : 8d 01 d6 STA $d601 
4a24 : a9 18 __ LDA #$18
4a26 : 8d 00 d6 STA $d600 
.l1674:
4a29 : 2c 00 d6 BIT $d600 
4a2c : 10 fb __ BPL $4a29 ; (vdc_set_mode.l1674 + 0)
.s222:
4a2e : ad 01 d6 LDA $d601 
4a31 : 29 7f __ AND #$7f
4a33 : a8 __ __ TAY
4a34 : a9 18 __ LDA #$18
4a36 : 8d 00 d6 STA $d600 
.l1676:
4a39 : 2c 00 d6 BIT $d600 
4a3c : 10 fb __ BPL $4a39 ; (vdc_set_mode.l1676 + 0)
.s228:
4a3e : 8c 01 d6 STY $d601 
4a41 : a9 1e __ LDA #$1e
4a43 : 8d 00 d6 STA $d600 
.l1678:
4a46 : 2c 00 d6 BIT $d600 
4a49 : 10 fb __ BPL $4a46 ; (vdc_set_mode.l1678 + 0)
.s233:
4a4b : a5 4b __ LDA T5 + 0 
4a4d : 8d 01 d6 STA $d601 
4a50 : e8 __ __ INX
4a51 : 4c 45 49 JMP $4945 ; (vdc_set_mode.l161 + 0)
.l242:
4a54 : 8a __ __ TXA
4a55 : e4 49 __ CPX T2 + 0 
4a57 : 90 03 __ BCC $4a5c ; (vdc_set_mode.s243 + 0)
4a59 : 4c 5e 49 JMP $495e ; (vdc_set_mode.s61 + 0)
.s243:
4a5c : 0a __ __ ASL
4a5d : a8 __ __ TAY
4a5e : b9 38 5a LDA $5a38,y ; (multab + 1)
4a61 : 85 45 __ STA T3 + 1 
4a63 : ad 25 5a LDA $5a25 ; (vdc_state + 7)
4a66 : 85 46 __ STA T11 + 0 
4a68 : a9 12 __ LDA #$12
4a6a : 8d 00 d6 STA $d600 
4a6d : a5 47 __ LDA T1 + 0 
4a6f : 38 __ __ SEC
4a70 : e9 01 __ SBC #$01
4a72 : 85 4b __ STA T5 + 0 
4a74 : b9 37 5a LDA $5a37,y ; (multab + 0)
4a77 : 85 44 __ STA T3 + 0 
4a79 : 18 __ __ CLC
4a7a : 6d 26 5a ADC $5a26 ; (vdc_state + 8)
4a7d : a8 __ __ TAY
4a7e : a5 45 __ LDA T3 + 1 
4a80 : 6d 27 5a ADC $5a27 ; (vdc_state + 9)
.l1597:
4a83 : 2c 00 d6 BIT $d600 
4a86 : 10 fb __ BPL $4a83 ; (vdc_set_mode.l1597 + 0)
.s255:
4a88 : 8d 01 d6 STA $d601 
4a8b : a9 13 __ LDA #$13
4a8d : 8d 00 d6 STA $d600 
.l1599:
4a90 : 2c 00 d6 BIT $d600 
4a93 : 10 fb __ BPL $4a90 ; (vdc_set_mode.l1599 + 0)
.s260:
4a95 : 8c 01 d6 STY $d601 
4a98 : a9 1f __ LDA #$1f
4a9a : 8d 00 d6 STA $d600 
.l1601:
4a9d : 2c 00 d6 BIT $d600 
4aa0 : 10 fb __ BPL $4a9d ; (vdc_set_mode.l1601 + 0)
.s264:
4aa2 : a9 20 __ LDA #$20
4aa4 : 8d 01 d6 STA $d601 
4aa7 : a9 18 __ LDA #$18
4aa9 : 8d 00 d6 STA $d600 
.l1603:
4aac : 2c 00 d6 BIT $d600 
4aaf : 10 fb __ BPL $4aac ; (vdc_set_mode.l1603 + 0)
.s270:
4ab1 : ad 01 d6 LDA $d601 
4ab4 : 29 7f __ AND #$7f
4ab6 : a8 __ __ TAY
4ab7 : a9 18 __ LDA #$18
4ab9 : 8d 00 d6 STA $d600 
.l1605:
4abc : 2c 00 d6 BIT $d600 
4abf : 10 fb __ BPL $4abc ; (vdc_set_mode.l1605 + 0)
.s276:
4ac1 : 8c 01 d6 STY $d601 
4ac4 : a9 1e __ LDA #$1e
4ac6 : 8d 00 d6 STA $d600 
.l1607:
4ac9 : 2c 00 d6 BIT $d600 
4acc : 10 fb __ BPL $4ac9 ; (vdc_set_mode.l1607 + 0)
.s281:
4ace : a5 4b __ LDA T5 + 0 
4ad0 : 8d 01 d6 STA $d601 
4ad3 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
4ad6 : 18 __ __ CLC
4ad7 : 65 44 __ ADC T3 + 0 
4ad9 : a8 __ __ TAY
4ada : a9 12 __ LDA #$12
4adc : 8d 00 d6 STA $d600 
4adf : ad 29 5a LDA $5a29 ; (vdc_state + 11)
4ae2 : 65 45 __ ADC T3 + 1 
.l1609:
4ae4 : 2c 00 d6 BIT $d600 
4ae7 : 10 fb __ BPL $4ae4 ; (vdc_set_mode.l1609 + 0)
.s288:
4ae9 : 8d 01 d6 STA $d601 
4aec : a9 13 __ LDA #$13
4aee : 8d 00 d6 STA $d600 
.l1611:
4af1 : 2c 00 d6 BIT $d600 
4af4 : 10 fb __ BPL $4af1 ; (vdc_set_mode.l1611 + 0)
.s293:
4af6 : 8c 01 d6 STY $d601 
4af9 : a9 1f __ LDA #$1f
4afb : 8d 00 d6 STA $d600 
.l1613:
4afe : 2c 00 d6 BIT $d600 
4b01 : 10 fb __ BPL $4afe ; (vdc_set_mode.l1613 + 0)
.s297:
4b03 : a5 46 __ LDA T11 + 0 
4b05 : 8d 01 d6 STA $d601 
4b08 : a9 18 __ LDA #$18
4b0a : 8d 00 d6 STA $d600 
.l1615:
4b0d : 2c 00 d6 BIT $d600 
4b10 : 10 fb __ BPL $4b0d ; (vdc_set_mode.l1615 + 0)
.s303:
4b12 : ad 01 d6 LDA $d601 
4b15 : 29 7f __ AND #$7f
4b17 : a8 __ __ TAY
4b18 : a9 18 __ LDA #$18
4b1a : 8d 00 d6 STA $d600 
.l1617:
4b1d : 2c 00 d6 BIT $d600 
4b20 : 10 fb __ BPL $4b1d ; (vdc_set_mode.l1617 + 0)
.s309:
4b22 : 8c 01 d6 STY $d601 
4b25 : a9 1e __ LDA #$1e
4b27 : 8d 00 d6 STA $d600 
.l1619:
4b2a : 2c 00 d6 BIT $d600 
4b2d : 10 fb __ BPL $4b2a ; (vdc_set_mode.l1619 + 0)
.s314:
4b2f : a5 4b __ LDA T5 + 0 
4b31 : 8d 01 d6 STA $d601 
4b34 : e8 __ __ INX
4b35 : 4c 54 4a JMP $4a54 ; (vdc_set_mode.l242 + 0)
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
4b38 : a9 1b __ LDA #$1b
4b3a : 85 0e __ STA P1 
4b3c : a9 50 __ LDA #$50
4b3e : 85 0f __ STA P2 
--------------------------------------------------------------------
vdc_prints: ; vdc_prints(u8,u8,const u8*)->void
.s0:
4b40 : a5 0d __ LDA P0 ; (y + 0)
4b42 : 0a __ __ ASL
4b43 : aa __ __ TAX
4b44 : bd 37 5a LDA $5a37,x ; (multab + 0)
4b47 : 85 43 __ STA T2 + 0 
4b49 : bd 38 5a LDA $5a38,x ; (multab + 1)
4b4c : 85 44 __ STA T2 + 1 
4b4e : a0 00 __ LDY #$00
4b50 : 84 1b __ STY ACCU + 0 
4b52 : b1 0e __ LDA (P1),y ; (string + 0)
4b54 : f0 16 __ BEQ $4b6c ; (vdc_prints.s6 + 0)
.s5:
4b56 : a5 0e __ LDA P1 ; (string + 0)
4b58 : 85 1b __ STA ACCU + 0 
4b5a : a2 00 __ LDX #$00
.l1046:
4b5c : c8 __ __ INY
4b5d : d0 01 __ BNE $4b60 ; (vdc_prints.s1051 + 0)
.s1050:
4b5f : e8 __ __ INX
.s1051:
4b60 : 8a __ __ TXA
4b61 : 18 __ __ CLC
4b62 : 65 0f __ ADC P2 ; (string + 1)
4b64 : 85 1c __ STA ACCU + 1 
4b66 : b1 1b __ LDA (ACCU + 0),y 
4b68 : d0 f2 __ BNE $4b5c ; (vdc_prints.l1046 + 0)
.s1047:
4b6a : 84 1b __ STY ACCU + 0 
.s6:
4b6c : ad 26 5a LDA $5a26 ; (vdc_state + 8)
4b6f : 18 __ __ CLC
4b70 : 65 43 __ ADC T2 + 0 
4b72 : aa __ __ TAX
4b73 : a9 12 __ LDA #$12
4b75 : 8d 00 d6 STA $d600 
4b78 : ad 27 5a LDA $5a27 ; (vdc_state + 9)
4b7b : 65 44 __ ADC T2 + 1 
.l354:
4b7d : 2c 00 d6 BIT $d600 
4b80 : 10 fb __ BPL $4b7d ; (vdc_prints.l354 + 0)
.s13:
4b82 : 8d 01 d6 STA $d601 
4b85 : a9 13 __ LDA #$13
4b87 : 8d 00 d6 STA $d600 
.l356:
4b8a : 2c 00 d6 BIT $d600 
4b8d : 10 fb __ BPL $4b8a ; (vdc_prints.l356 + 0)
.s18:
4b8f : 8e 01 d6 STX $d601 
4b92 : a9 1f __ LDA #$1f
4b94 : 8d 00 d6 STA $d600 
4b97 : a5 1b __ LDA ACCU + 0 
4b99 : f0 61 __ BEQ $4bfc ; (vdc_prints.s23 + 0)
.s95:
4b9b : a0 00 __ LDY #$00
.l21:
4b9d : b1 0e __ LDA (P1),y ; (string + 0)
4b9f : c9 20 __ CMP #$20
4ba1 : b0 05 __ BCS $4ba8 ; (vdc_prints.s27 + 0)
.s26:
4ba3 : 69 80 __ ADC #$80
4ba5 : 4c ee 4b JMP $4bee ; (vdc_prints.s1048 + 0)
.s27:
4ba8 : aa __ __ TAX
4ba9 : c9 40 __ CMP #$40
4bab : 90 04 __ BCC $4bb1 ; (vdc_prints.s30 + 0)
.s32:
4bad : c9 60 __ CMP #$60
4baf : 90 23 __ BCC $4bd4 ; (vdc_prints.s29 + 0)
.s30:
4bb1 : c9 60 __ CMP #$60
4bb3 : 90 0a __ BCC $4bbf ; (vdc_prints.s34 + 0)
.s36:
4bb5 : 09 00 __ ORA #$00
4bb7 : 30 06 __ BMI $4bbf ; (vdc_prints.s34 + 0)
.s33:
4bb9 : 38 __ __ SEC
4bba : e9 20 __ SBC #$20
4bbc : 4c ee 4b JMP $4bee ; (vdc_prints.s1048 + 0)
.s34:
4bbf : c9 80 __ CMP #$80
4bc1 : 90 09 __ BCC $4bcc ; (vdc_prints.s38 + 0)
.s40:
4bc3 : c9 a0 __ CMP #$a0
4bc5 : b0 05 __ BCS $4bcc ; (vdc_prints.s38 + 0)
.s37:
4bc7 : 69 40 __ ADC #$40
4bc9 : 4c ee 4b JMP $4bee ; (vdc_prints.s1048 + 0)
.s38:
4bcc : c9 a0 __ CMP #$a0
4bce : 90 0a __ BCC $4bda ; (vdc_prints.s42 + 0)
.s44:
4bd0 : c9 c0 __ CMP #$c0
4bd2 : b0 06 __ BCS $4bda ; (vdc_prints.s42 + 0)
.s29:
4bd4 : 38 __ __ SEC
4bd5 : e9 40 __ SBC #$40
4bd7 : 4c ee 4b JMP $4bee ; (vdc_prints.s1048 + 0)
.s42:
4bda : c9 c0 __ CMP #$c0
4bdc : 90 0a __ BCC $4be8 ; (vdc_prints.s46 + 0)
.s48:
4bde : c9 ff __ CMP #$ff
4be0 : b0 06 __ BCS $4be8 ; (vdc_prints.s46 + 0)
.s45:
4be2 : 38 __ __ SEC
4be3 : e9 80 __ SBC #$80
4be5 : 4c ee 4b JMP $4bee ; (vdc_prints.s1048 + 0)
.s46:
4be8 : c9 ff __ CMP #$ff
4bea : d0 03 __ BNE $4bef ; (vdc_prints.l360 + 0)
.s49:
4bec : a9 5e __ LDA #$5e
.s1048:
4bee : aa __ __ TAX
.l360:
4bef : 2c 00 d6 BIT $d600 
4bf2 : 10 fb __ BPL $4bef ; (vdc_prints.l360 + 0)
.s54:
4bf4 : 8e 01 d6 STX $d601 
4bf7 : c8 __ __ INY
4bf8 : c4 1b __ CPY ACCU + 0 
4bfa : 90 a1 __ BCC $4b9d ; (vdc_prints.l21 + 0)
.s23:
4bfc : a9 12 __ LDA #$12
4bfe : 8d 00 d6 STA $d600 
4c01 : c6 1b __ DEC ACCU + 0 
4c03 : ad 28 5a LDA $5a28 ; (vdc_state + 10)
4c06 : 18 __ __ CLC
4c07 : 65 43 __ ADC T2 + 0 
4c09 : a8 __ __ TAY
4c0a : ad 29 5a LDA $5a29 ; (vdc_state + 11)
4c0d : 65 44 __ ADC T2 + 1 
4c0f : ae 25 5a LDX $5a25 ; (vdc_state + 7)
.l363:
4c12 : 2c 00 d6 BIT $d600 
4c15 : 10 fb __ BPL $4c12 ; (vdc_prints.l363 + 0)
.s61:
4c17 : 8d 01 d6 STA $d601 
4c1a : a9 13 __ LDA #$13
4c1c : 8d 00 d6 STA $d600 
.l365:
4c1f : 2c 00 d6 BIT $d600 
4c22 : 10 fb __ BPL $4c1f ; (vdc_prints.l365 + 0)
.s66:
4c24 : 8c 01 d6 STY $d601 
4c27 : a9 1f __ LDA #$1f
4c29 : 8d 00 d6 STA $d600 
.l367:
4c2c : 2c 00 d6 BIT $d600 
4c2f : 10 fb __ BPL $4c2c ; (vdc_prints.l367 + 0)
.s70:
4c31 : 8e 01 d6 STX $d601 
4c34 : a9 18 __ LDA #$18
4c36 : 8d 00 d6 STA $d600 
.l369:
4c39 : 2c 00 d6 BIT $d600 
4c3c : 10 fb __ BPL $4c39 ; (vdc_prints.l369 + 0)
.s76:
4c3e : ad 01 d6 LDA $d601 
4c41 : 29 7f __ AND #$7f
4c43 : aa __ __ TAX
4c44 : a9 18 __ LDA #$18
4c46 : 8d 00 d6 STA $d600 
.l371:
4c49 : 2c 00 d6 BIT $d600 
4c4c : 10 fb __ BPL $4c49 ; (vdc_prints.l371 + 0)
.s82:
4c4e : 8e 01 d6 STX $d601 
4c51 : a9 1e __ LDA #$1e
4c53 : 8d 00 d6 STA $d600 
.l373:
4c56 : 2c 00 d6 BIT $d600 
4c59 : 10 fb __ BPL $4c56 ; (vdc_prints.l373 + 0)
.s87:
4c5b : a5 1b __ LDA ACCU + 0 
4c5d : 8d 01 d6 STA $d601 
.s1001:
4c60 : 60 __ __ RTS
--------------------------------------------------------------------
4c61 : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 6f 53 43 41 52 36 34 : sTARTING oSCAR64
4c71 : __ __ __ BYT 20 76 64 63 20 44 45 4d 4f 2e 00                :  vdc DEMO..
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
4c7c : a2 03 __ LDX #$03
4c7e : b5 53 __ LDA T8 + 0,x 
4c80 : 9d e4 bf STA $bfe4,x ; (buff + 38)
4c83 : ca __ __ DEX
4c84 : 10 f8 __ BPL $4c7e ; (sprintf.s1000 + 2)
.s0:
4c86 : 18 __ __ CLC
4c87 : a5 23 __ LDA SP + 0 
4c89 : 69 06 __ ADC #$06
4c8b : 85 47 __ STA T0 + 0 
4c8d : a5 24 __ LDA SP + 1 
4c8f : 69 00 __ ADC #$00
4c91 : 85 48 __ STA T0 + 1 
4c93 : a9 00 __ LDA #$00
4c95 : 85 43 __ STA T1 + 0 
4c97 : a0 04 __ LDY #$04
4c99 : b1 23 __ LDA (SP + 0),y 
4c9b : 85 49 __ STA T2 + 0 
4c9d : c8 __ __ INY
4c9e : b1 23 __ LDA (SP + 0),y 
4ca0 : 85 4a __ STA T2 + 1 
4ca2 : a0 02 __ LDY #$02
4ca4 : b1 23 __ LDA (SP + 0),y 
4ca6 : 85 4b __ STA T3 + 0 
4ca8 : c8 __ __ INY
4ca9 : b1 23 __ LDA (SP + 0),y 
4cab : 85 4c __ STA T3 + 1 
.l2:
4cad : a0 00 __ LDY #$00
4caf : b1 49 __ LDA (T2 + 0),y 
4cb1 : d0 0f __ BNE $4cc2 ; (sprintf.s3 + 0)
.s4:
4cb3 : a4 43 __ LDY T1 + 0 
4cb5 : 91 4b __ STA (T3 + 0),y 
.s1001:
4cb7 : a2 03 __ LDX #$03
4cb9 : bd e4 bf LDA $bfe4,x ; (buff + 38)
4cbc : 95 53 __ STA T8 + 0,x 
4cbe : ca __ __ DEX
4cbf : 10 f8 __ BPL $4cb9 ; (sprintf.s1001 + 2)
4cc1 : 60 __ __ RTS
.s3:
4cc2 : c9 25 __ CMP #$25
4cc4 : f0 22 __ BEQ $4ce8 ; (sprintf.s5 + 0)
.s6:
4cc6 : a4 43 __ LDY T1 + 0 
4cc8 : 91 4b __ STA (T3 + 0),y 
4cca : e6 49 __ INC T2 + 0 
4ccc : d0 02 __ BNE $4cd0 ; (sprintf.s1102 + 0)
.s1101:
4cce : e6 4a __ INC T2 + 1 
.s1102:
4cd0 : c8 __ __ INY
4cd1 : 84 43 __ STY T1 + 0 
4cd3 : 98 __ __ TYA
4cd4 : c0 28 __ CPY #$28
4cd6 : 90 d5 __ BCC $4cad ; (sprintf.l2 + 0)
.s111:
4cd8 : 18 __ __ CLC
4cd9 : 65 4b __ ADC T3 + 0 
4cdb : 85 4b __ STA T3 + 0 
4cdd : 90 02 __ BCC $4ce1 ; (sprintf.s1104 + 0)
.s1103:
4cdf : e6 4c __ INC T3 + 1 
.s1104:
4ce1 : a9 00 __ LDA #$00
.s1068:
4ce3 : 85 43 __ STA T1 + 0 
4ce5 : 4c ad 4c JMP $4cad ; (sprintf.l2 + 0)
.s5:
4ce8 : 8c ec bf STY $bfec ; (buff + 46)
4ceb : 8c ed bf STY $bfed ; (buff + 47)
4cee : 8c ee bf STY $bfee ; (buff + 48)
4cf1 : 8c ef bf STY $bfef ; (buff + 49)
4cf4 : a9 0a __ LDA #$0a
4cf6 : 8d eb bf STA $bfeb ; (buff + 45)
4cf9 : a5 43 __ LDA T1 + 0 
4cfb : f0 0b __ BEQ $4d08 ; (sprintf.s10 + 0)
.s8:
4cfd : 18 __ __ CLC
4cfe : 65 4b __ ADC T3 + 0 
4d00 : 85 4b __ STA T3 + 0 
4d02 : 90 02 __ BCC $4d06 ; (sprintf.s1080 + 0)
.s1079:
4d04 : e6 4c __ INC T3 + 1 
.s1080:
4d06 : 84 43 __ STY T1 + 0 
.s10:
4d08 : a0 01 __ LDY #$01
4d0a : b1 49 __ LDA (T2 + 0),y 
4d0c : aa __ __ TAX
4d0d : a9 20 __ LDA #$20
4d0f : 8d e8 bf STA $bfe8 ; (buff + 42)
4d12 : a9 00 __ LDA #$00
4d14 : 8d e9 bf STA $bfe9 ; (buff + 43)
4d17 : a9 ff __ LDA #$ff
4d19 : 8d ea bf STA $bfea ; (buff + 44)
4d1c : 18 __ __ CLC
4d1d : a5 49 __ LDA T2 + 0 
4d1f : 69 02 __ ADC #$02
.l15:
4d21 : 85 49 __ STA T2 + 0 
4d23 : 90 02 __ BCC $4d27 ; (sprintf.s1082 + 0)
.s1081:
4d25 : e6 4a __ INC T2 + 1 
.s1082:
4d27 : 8a __ __ TXA
4d28 : e0 2b __ CPX #$2b
4d2a : d0 08 __ BNE $4d34 ; (sprintf.s18 + 0)
.s17:
4d2c : a9 01 __ LDA #$01
4d2e : 8d ed bf STA $bfed ; (buff + 47)
4d31 : 4c 95 4f JMP $4f95 ; (sprintf.s260 + 0)
.s18:
4d34 : c9 30 __ CMP #$30
4d36 : d0 06 __ BNE $4d3e ; (sprintf.s21 + 0)
.s20:
4d38 : 8d e8 bf STA $bfe8 ; (buff + 42)
4d3b : 4c 95 4f JMP $4f95 ; (sprintf.s260 + 0)
.s21:
4d3e : e0 23 __ CPX #$23
4d40 : d0 08 __ BNE $4d4a ; (sprintf.s24 + 0)
.s23:
4d42 : a9 01 __ LDA #$01
4d44 : 8d ef bf STA $bfef ; (buff + 49)
4d47 : 4c 95 4f JMP $4f95 ; (sprintf.s260 + 0)
.s24:
4d4a : e0 2d __ CPX #$2d
4d4c : d0 08 __ BNE $4d56 ; (sprintf.s16 + 0)
.s26:
4d4e : a9 01 __ LDA #$01
4d50 : 8d ee bf STA $bfee ; (buff + 48)
4d53 : 4c 95 4f JMP $4f95 ; (sprintf.s260 + 0)
.s16:
4d56 : 85 45 __ STA T4 + 0 
4d58 : e0 30 __ CPX #$30
4d5a : 90 53 __ BCC $4daf ; (sprintf.s32 + 0)
.s33:
4d5c : e0 3a __ CPX #$3a
4d5e : b0 4f __ BCS $4daf ; (sprintf.s32 + 0)
.s30:
4d60 : a9 00 __ LDA #$00
4d62 : 85 4d __ STA T6 + 0 
4d64 : 85 4e __ STA T6 + 1 
4d66 : e0 3a __ CPX #$3a
4d68 : b0 40 __ BCS $4daa ; (sprintf.s36 + 0)
.l35:
4d6a : a5 4d __ LDA T6 + 0 
4d6c : 0a __ __ ASL
4d6d : 85 1b __ STA ACCU + 0 
4d6f : a5 4e __ LDA T6 + 1 
4d71 : 2a __ __ ROL
4d72 : 06 1b __ ASL ACCU + 0 
4d74 : 2a __ __ ROL
4d75 : aa __ __ TAX
4d76 : 18 __ __ CLC
4d77 : a5 1b __ LDA ACCU + 0 
4d79 : 65 4d __ ADC T6 + 0 
4d7b : 85 4d __ STA T6 + 0 
4d7d : 8a __ __ TXA
4d7e : 65 4e __ ADC T6 + 1 
4d80 : 06 4d __ ASL T6 + 0 
4d82 : 2a __ __ ROL
4d83 : aa __ __ TAX
4d84 : 18 __ __ CLC
4d85 : a5 4d __ LDA T6 + 0 
4d87 : 65 45 __ ADC T4 + 0 
4d89 : 90 01 __ BCC $4d8c ; (sprintf.s1098 + 0)
.s1097:
4d8b : e8 __ __ INX
.s1098:
4d8c : 38 __ __ SEC
4d8d : e9 30 __ SBC #$30
4d8f : 85 4d __ STA T6 + 0 
4d91 : 8a __ __ TXA
4d92 : e9 00 __ SBC #$00
4d94 : 85 4e __ STA T6 + 1 
4d96 : a0 00 __ LDY #$00
4d98 : b1 49 __ LDA (T2 + 0),y 
4d9a : 85 45 __ STA T4 + 0 
4d9c : e6 49 __ INC T2 + 0 
4d9e : d0 02 __ BNE $4da2 ; (sprintf.s1100 + 0)
.s1099:
4da0 : e6 4a __ INC T2 + 1 
.s1100:
4da2 : c9 30 __ CMP #$30
4da4 : 90 04 __ BCC $4daa ; (sprintf.s36 + 0)
.s37:
4da6 : c9 3a __ CMP #$3a
4da8 : 90 c0 __ BCC $4d6a ; (sprintf.l35 + 0)
.s36:
4daa : a5 4d __ LDA T6 + 0 
4dac : 8d e9 bf STA $bfe9 ; (buff + 43)
.s32:
4daf : a5 45 __ LDA T4 + 0 
4db1 : c9 2e __ CMP #$2e
4db3 : d0 51 __ BNE $4e06 ; (sprintf.s40 + 0)
.s38:
4db5 : a9 00 __ LDA #$00
4db7 : 85 4d __ STA T6 + 0 
.l245:
4db9 : 85 4e __ STA T6 + 1 
4dbb : a0 00 __ LDY #$00
4dbd : b1 49 __ LDA (T2 + 0),y 
4dbf : 85 45 __ STA T4 + 0 
4dc1 : e6 49 __ INC T2 + 0 
4dc3 : d0 02 __ BNE $4dc7 ; (sprintf.s1084 + 0)
.s1083:
4dc5 : e6 4a __ INC T2 + 1 
.s1084:
4dc7 : c9 30 __ CMP #$30
4dc9 : 90 04 __ BCC $4dcf ; (sprintf.s43 + 0)
.s44:
4dcb : c9 3a __ CMP #$3a
4dcd : 90 0a __ BCC $4dd9 ; (sprintf.s42 + 0)
.s43:
4dcf : a5 4d __ LDA T6 + 0 
4dd1 : 8d ea bf STA $bfea ; (buff + 44)
4dd4 : a5 45 __ LDA T4 + 0 
4dd6 : 4c 06 4e JMP $4e06 ; (sprintf.s40 + 0)
.s42:
4dd9 : a5 4d __ LDA T6 + 0 
4ddb : 0a __ __ ASL
4ddc : 85 1b __ STA ACCU + 0 
4dde : a5 4e __ LDA T6 + 1 
4de0 : 2a __ __ ROL
4de1 : 06 1b __ ASL ACCU + 0 
4de3 : 2a __ __ ROL
4de4 : aa __ __ TAX
4de5 : 18 __ __ CLC
4de6 : a5 1b __ LDA ACCU + 0 
4de8 : 65 4d __ ADC T6 + 0 
4dea : 85 4d __ STA T6 + 0 
4dec : 8a __ __ TXA
4ded : 65 4e __ ADC T6 + 1 
4def : 06 4d __ ASL T6 + 0 
4df1 : 2a __ __ ROL
4df2 : aa __ __ TAX
4df3 : 18 __ __ CLC
4df4 : a5 4d __ LDA T6 + 0 
4df6 : 65 45 __ ADC T4 + 0 
4df8 : 90 01 __ BCC $4dfb ; (sprintf.s1096 + 0)
.s1095:
4dfa : e8 __ __ INX
.s1096:
4dfb : 38 __ __ SEC
4dfc : e9 30 __ SBC #$30
4dfe : 85 4d __ STA T6 + 0 
4e00 : 8a __ __ TXA
4e01 : e9 00 __ SBC #$00
4e03 : 4c b9 4d JMP $4db9 ; (sprintf.l245 + 0)
.s40:
4e06 : c9 64 __ CMP #$64
4e08 : f0 04 __ BEQ $4e0e ; (sprintf.s45 + 0)
.s48:
4e0a : c9 44 __ CMP #$44
4e0c : d0 05 __ BNE $4e13 ; (sprintf.s46 + 0)
.s45:
4e0e : a9 01 __ LDA #$01
4e10 : 4c 6e 4f JMP $4f6e ; (sprintf.s261 + 0)
.s46:
4e13 : c9 75 __ CMP #$75
4e15 : d0 03 __ BNE $4e1a ; (sprintf.s52 + 0)
4e17 : 4c 6c 4f JMP $4f6c ; (sprintf.s285 + 0)
.s52:
4e1a : c9 55 __ CMP #$55
4e1c : d0 03 __ BNE $4e21 ; (sprintf.s50 + 0)
4e1e : 4c 6c 4f JMP $4f6c ; (sprintf.s285 + 0)
.s50:
4e21 : c9 78 __ CMP #$78
4e23 : f0 04 __ BEQ $4e29 ; (sprintf.s53 + 0)
.s56:
4e25 : c9 58 __ CMP #$58
4e27 : d0 0d __ BNE $4e36 ; (sprintf.s54 + 0)
.s53:
4e29 : a9 10 __ LDA #$10
4e2b : 8d eb bf STA $bfeb ; (buff + 45)
4e2e : a9 00 __ LDA #$00
4e30 : 8d ec bf STA $bfec ; (buff + 46)
4e33 : 4c 6c 4f JMP $4f6c ; (sprintf.s285 + 0)
.s54:
4e36 : c9 6c __ CMP #$6c
4e38 : d0 03 __ BNE $4e3d ; (sprintf.s60 + 0)
4e3a : 4c fe 4e JMP $4efe ; (sprintf.s57 + 0)
.s60:
4e3d : c9 4c __ CMP #$4c
4e3f : d0 03 __ BNE $4e44 ; (sprintf.s58 + 0)
4e41 : 4c fe 4e JMP $4efe ; (sprintf.s57 + 0)
.s58:
4e44 : c9 73 __ CMP #$73
4e46 : f0 37 __ BEQ $4e7f ; (sprintf.s73 + 0)
.s76:
4e48 : c9 53 __ CMP #$53
4e4a : f0 33 __ BEQ $4e7f ; (sprintf.s73 + 0)
.s74:
4e4c : c9 63 __ CMP #$63
4e4e : f0 14 __ BEQ $4e64 ; (sprintf.s104 + 0)
.s107:
4e50 : c9 43 __ CMP #$43
4e52 : f0 10 __ BEQ $4e64 ; (sprintf.s104 + 0)
.s105:
4e54 : 09 00 __ ORA #$00
4e56 : d0 03 __ BNE $4e5b ; (sprintf.s108 + 0)
4e58 : 4c ad 4c JMP $4cad ; (sprintf.l2 + 0)
.s108:
4e5b : a4 43 __ LDY T1 + 0 
4e5d : 91 4b __ STA (T3 + 0),y 
4e5f : e6 43 __ INC T1 + 0 
4e61 : 4c ad 4c JMP $4cad ; (sprintf.l2 + 0)
.s104:
4e64 : a0 00 __ LDY #$00
4e66 : b1 47 __ LDA (T0 + 0),y 
4e68 : a4 43 __ LDY T1 + 0 
4e6a : 91 4b __ STA (T3 + 0),y 
4e6c : e6 43 __ INC T1 + 0 
.s258:
4e6e : 18 __ __ CLC
4e6f : a5 47 __ LDA T0 + 0 
4e71 : 69 02 __ ADC #$02
4e73 : 85 47 __ STA T0 + 0 
4e75 : b0 03 __ BCS $4e7a ; (sprintf.s1085 + 0)
4e77 : 4c ad 4c JMP $4cad ; (sprintf.l2 + 0)
.s1085:
4e7a : e6 48 __ INC T0 + 1 
4e7c : 4c ad 4c JMP $4cad ; (sprintf.l2 + 0)
.s73:
4e7f : a0 00 __ LDY #$00
4e81 : 84 45 __ STY T4 + 0 
4e83 : b1 47 __ LDA (T0 + 0),y 
4e85 : 85 4d __ STA T6 + 0 
4e87 : c8 __ __ INY
4e88 : b1 47 __ LDA (T0 + 0),y 
4e8a : 85 4e __ STA T6 + 1 
4e8c : 18 __ __ CLC
4e8d : a5 47 __ LDA T0 + 0 
4e8f : 69 02 __ ADC #$02
4e91 : 85 47 __ STA T0 + 0 
4e93 : 90 02 __ BCC $4e97 ; (sprintf.s1092 + 0)
.s1091:
4e95 : e6 48 __ INC T0 + 1 
.s1092:
4e97 : ad e9 bf LDA $bfe9 ; (buff + 43)
4e9a : f0 0d __ BEQ $4ea9 ; (sprintf.s79 + 0)
.s1071:
4e9c : a0 00 __ LDY #$00
4e9e : b1 4d __ LDA (T6 + 0),y 
4ea0 : f0 05 __ BEQ $4ea7 ; (sprintf.s1072 + 0)
.l81:
4ea2 : c8 __ __ INY
4ea3 : b1 4d __ LDA (T6 + 0),y 
4ea5 : d0 fb __ BNE $4ea2 ; (sprintf.l81 + 0)
.s1072:
4ea7 : 84 45 __ STY T4 + 0 
.s79:
4ea9 : ad ee bf LDA $bfee ; (buff + 48)
4eac : d0 19 __ BNE $4ec7 ; (sprintf.l95 + 0)
.s1075:
4eae : a6 45 __ LDX T4 + 0 
4eb0 : ec e9 bf CPX $bfe9 ; (buff + 43)
4eb3 : a4 43 __ LDY T1 + 0 
4eb5 : b0 0c __ BCS $4ec3 ; (sprintf.s1076 + 0)
.l87:
4eb7 : ad e8 bf LDA $bfe8 ; (buff + 42)
4eba : 91 4b __ STA (T3 + 0),y 
4ebc : e8 __ __ INX
4ebd : ec e9 bf CPX $bfe9 ; (buff + 43)
4ec0 : c8 __ __ INY
4ec1 : 90 f4 __ BCC $4eb7 ; (sprintf.l87 + 0)
.s1076:
4ec3 : 86 45 __ STX T4 + 0 
4ec5 : 84 43 __ STY T1 + 0 
.l95:
4ec7 : a0 00 __ LDY #$00
4ec9 : b1 4d __ LDA (T6 + 0),y 
4ecb : f0 0f __ BEQ $4edc ; (sprintf.s91 + 0)
.s96:
4ecd : a4 43 __ LDY T1 + 0 
4ecf : 91 4b __ STA (T3 + 0),y 
4ed1 : e6 43 __ INC T1 + 0 
4ed3 : e6 4d __ INC T6 + 0 
4ed5 : d0 f0 __ BNE $4ec7 ; (sprintf.l95 + 0)
.s1093:
4ed7 : e6 4e __ INC T6 + 1 
4ed9 : 4c c7 4e JMP $4ec7 ; (sprintf.l95 + 0)
.s91:
4edc : ad ee bf LDA $bfee ; (buff + 48)
4edf : d0 03 __ BNE $4ee4 ; (sprintf.s1073 + 0)
4ee1 : 4c ad 4c JMP $4cad ; (sprintf.l2 + 0)
.s1073:
4ee4 : a6 45 __ LDX T4 + 0 
4ee6 : ec e9 bf CPX $bfe9 ; (buff + 43)
4ee9 : a4 43 __ LDY T1 + 0 
4eeb : b0 0c __ BCS $4ef9 ; (sprintf.s1074 + 0)
.l102:
4eed : ad e8 bf LDA $bfe8 ; (buff + 42)
4ef0 : 91 4b __ STA (T3 + 0),y 
4ef2 : e8 __ __ INX
4ef3 : ec e9 bf CPX $bfe9 ; (buff + 43)
4ef6 : c8 __ __ INY
4ef7 : 90 f4 __ BCC $4eed ; (sprintf.l102 + 0)
.s1074:
4ef9 : 84 43 __ STY T1 + 0 
4efb : 4c ad 4c JMP $4cad ; (sprintf.l2 + 0)
.s57:
4efe : a0 00 __ LDY #$00
4f00 : b1 47 __ LDA (T0 + 0),y 
4f02 : 85 53 __ STA T8 + 0 
4f04 : c8 __ __ INY
4f05 : b1 47 __ LDA (T0 + 0),y 
4f07 : 85 54 __ STA T8 + 1 
4f09 : c8 __ __ INY
4f0a : b1 47 __ LDA (T0 + 0),y 
4f0c : 85 55 __ STA T8 + 2 
4f0e : c8 __ __ INY
4f0f : b1 47 __ LDA (T0 + 0),y 
4f11 : 85 56 __ STA T8 + 3 
4f13 : 18 __ __ CLC
4f14 : a5 47 __ LDA T0 + 0 
4f16 : 69 04 __ ADC #$04
4f18 : 85 47 __ STA T0 + 0 
4f1a : 90 02 __ BCC $4f1e ; (sprintf.s1088 + 0)
.s1087:
4f1c : e6 48 __ INC T0 + 1 
.s1088:
4f1e : a0 00 __ LDY #$00
4f20 : b1 49 __ LDA (T2 + 0),y 
4f22 : aa __ __ TAX
4f23 : e6 49 __ INC T2 + 0 
4f25 : d0 02 __ BNE $4f29 ; (sprintf.s1090 + 0)
.s1089:
4f27 : e6 4a __ INC T2 + 1 
.s1090:
4f29 : 8a __ __ TXA
4f2a : e0 64 __ CPX #$64
4f2c : f0 04 __ BEQ $4f32 ; (sprintf.s61 + 0)
.s64:
4f2e : c9 44 __ CMP #$44
4f30 : d0 04 __ BNE $4f36 ; (sprintf.s62 + 0)
.s61:
4f32 : a9 01 __ LDA #$01
4f34 : d0 1c __ BNE $4f52 ; (sprintf.s259 + 0)
.s62:
4f36 : c9 75 __ CMP #$75
4f38 : f0 17 __ BEQ $4f51 ; (sprintf.s284 + 0)
.s68:
4f3a : c9 55 __ CMP #$55
4f3c : f0 13 __ BEQ $4f51 ; (sprintf.s284 + 0)
.s66:
4f3e : c9 78 __ CMP #$78
4f40 : f0 07 __ BEQ $4f49 ; (sprintf.s69 + 0)
.s72:
4f42 : c9 58 __ CMP #$58
4f44 : f0 03 __ BEQ $4f49 ; (sprintf.s69 + 0)
4f46 : 4c ad 4c JMP $4cad ; (sprintf.l2 + 0)
.s69:
4f49 : 8c ec bf STY $bfec ; (buff + 46)
4f4c : a9 10 __ LDA #$10
4f4e : 8d eb bf STA $bfeb ; (buff + 45)
.s284:
4f51 : 98 __ __ TYA
.s259:
4f52 : 85 15 __ STA P8 
4f54 : a5 4b __ LDA T3 + 0 
4f56 : 85 0f __ STA P2 ; (fmt + 0)
4f58 : a5 4c __ LDA T3 + 1 
4f5a : 85 10 __ STA P3 ; (fmt + 1)
4f5c : a9 e8 __ LDA #$e8
4f5e : 85 0d __ STA P0 ; (str + 0)
4f60 : a9 bf __ LDA #$bf
4f62 : 85 0e __ STA P1 ; (str + 1)
4f64 : 20 c3 43 JSR $43c3 ; (nforml@proxy + 0)
4f67 : a5 1b __ LDA ACCU + 0 
4f69 : 4c e3 4c JMP $4ce3 ; (sprintf.s1068 + 0)
.s285:
4f6c : a9 00 __ LDA #$00
.s261:
4f6e : 85 13 __ STA P6 
4f70 : a5 4b __ LDA T3 + 0 
4f72 : 85 0f __ STA P2 ; (fmt + 0)
4f74 : a5 4c __ LDA T3 + 1 
4f76 : 85 10 __ STA P3 ; (fmt + 1)
4f78 : a0 00 __ LDY #$00
4f7a : b1 47 __ LDA (T0 + 0),y 
4f7c : 85 11 __ STA P4 ; (fmt + 2)
4f7e : c8 __ __ INY
4f7f : b1 47 __ LDA (T0 + 0),y 
4f81 : 85 12 __ STA P5 ; (fmt + 3)
4f83 : a9 e8 __ LDA #$e8
4f85 : 85 0d __ STA P0 ; (str + 0)
4f87 : a9 bf __ LDA #$bf
4f89 : 85 0e __ STA P1 ; (str + 1)
4f8b : 20 8e 42 JSR $428e ; (nformi.s0 + 0)
4f8e : a5 1b __ LDA ACCU + 0 
4f90 : 85 43 __ STA T1 + 0 
4f92 : 4c 6e 4e JMP $4e6e ; (sprintf.s258 + 0)
.s260:
4f95 : a0 00 __ LDY #$00
4f97 : b1 49 __ LDA (T2 + 0),y 
4f99 : aa __ __ TAX
4f9a : 18 __ __ CLC
4f9b : a5 49 __ LDA T2 + 0 
4f9d : 69 01 __ ADC #$01
4f9f : 4c 21 4d JMP $4d21 ; (sprintf.l15 + 0)
--------------------------------------------------------------------
4fa2 : __ __ __ BYT 76 64 63 20 4d 45 4d 4f 52 59 20 44 45 54 45 43 : vdc MEMORY DETEC
4fb2 : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 2c 20 45 58 54 45 : TED: %U kb, EXTE
4fc2 : __ __ __ BYT 4e 44 45 44 20 4d 45 4d 4f 52 59 20 25 53 41 42 : NDED MEMORY %SAB
4fd2 : __ __ __ BYT 4c 45 44 2e 00                                  : LED..
--------------------------------------------------------------------
4fd7 : __ __ __ BYT 65 4e 00                                        : eN.
--------------------------------------------------------------------
4fda : __ __ __ BYT 64 49 53 00                                     : dIS.
--------------------------------------------------------------------
4fde : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 3a 00 : lOADING ASSETS:.
--------------------------------------------------------------------
4fee : __ __ __ BYT 53 43 52 45 45 4e 31 00                         : SCREEN1.
--------------------------------------------------------------------
4ff6 : __ __ __ BYT 53 43 52 45 45 4e 32 00                         : SCREEN2.
--------------------------------------------------------------------
4ffe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
spentry:
4fff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
5000 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 20 31 3a 20 6c 4f 56 45 : - SCREEN 1: lOVE
5010 : __ __ __ BYT 20 49 53 20 41 20 64 52 55 47 00                :  IS A dRUG.
--------------------------------------------------------------------
501b : __ __ __ BYT 6c 4f 41 44 20 45 52 52 4f 52 2e 00             : lOAD ERROR..
--------------------------------------------------------------------
5027 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 20 32 3a 20 6c 4f 47 4f : - SCREEN 2: lOGO
5037 : __ __ __ BYT 20 54 45 53 54 20 53 43 52 45 45 4e 00          :  TEST SCREEN.
--------------------------------------------------------------------
5044 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 44 45 4d 4f : oSCAR64 vdc DEMO
5054 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
5055 : __ __ __ BYT 76 64 63 20 6d 45 4d 4f 52 59 20 64 45 54 45 43 : vdc mEMORY dETEC
5065 : __ __ __ BYT 54 45 44 3a 20 25 44 20 6b 62 2c 20 53 43 52 45 : TED: %D kb, SCRE
5075 : __ __ __ BYT 45 4e 20 53 49 5a 45 3a 20 25 44 58 25 44 2c 20 : EN SIZE: %DX%D, 
5085 : __ __ __ BYT 45 58 54 2e 4d 45 4d 3a 20 25 53 00             : EXT.MEM: %S.
--------------------------------------------------------------------
5091 : __ __ __ BYT 6f 4e 20 00                                     : oN .
--------------------------------------------------------------------
5095 : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
5099 : __ __ __ BYT 6d 4f 56 45 20 42 59 20 77 2c 61 2c 73 2c 64 20 : mOVE BY w,a,s,d 
50a9 : __ __ __ BYT 4f 52 20 43 55 52 53 4f 52 20 4b 45 59 53 2e 20 : OR CURSOR KEYS. 
50b9 : __ __ __ BYT 65 73 63 20 4f 52 20 73 74 6f 70 20 54 4f 20 45 : esc OR stop TO E
50c9 : __ __ __ BYT 58 49 54 2e 00                                  : XIT..
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
50ce : a9 b5 __ LDA #$b5
50d0 : 85 0d __ STA P0 
50d2 : a9 be __ LDA #$be
50d4 : 85 0e __ STA P1 
50d6 : ad 36 bf LDA $bf36 ; (viewport + 11)
50d9 : 85 0f __ STA P2 
50db : ad 37 bf LDA $bf37 ; (viewport + 12)
50de : 85 10 __ STA P3 
50e0 : 4c 44 51 JMP $5144 ; (vdcwin_init.s0 + 0)
--------------------------------------------------------------------
50e3 : __ __ __ BYT 25 53 20 25 53 20 25 53 20 25 53 2e 00          : %S %S %S %S..
--------------------------------------------------------------------
__multab36L:
50f0 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
__multab6L:
50f6 : __ __ __ BYT 00 06 0c 12 18                                  : .....
--------------------------------------------------------------------
__multab15L:
50fb : __ __ __ BYT 00 0f 1e 2d 3c                                  : ...-<
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
51dc : bd a1 58 LDA $58a1,x ; (seed + 1)
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
51fd : ad a1 58 LDA $58a1 ; (seed + 1)
5200 : 4a __ __ LSR
5201 : ad a0 58 LDA $58a0 ; (seed + 0)
5204 : 6a __ __ ROR
5205 : aa __ __ TAX
5206 : 98 __ __ TYA
5207 : 6a __ __ ROR
5208 : 4d a0 58 EOR $58a0 ; (seed + 0)
520b : 85 43 __ STA T0 + 0 
520d : 8a __ __ TXA
520e : 4d a1 58 EOR $58a1 ; (seed + 1)
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
5261 : 8d a0 58 STA $58a0 ; (seed + 0)
5264 : 85 1b __ STA ACCU + 0 
5266 : 45 4a __ EOR T3 + 1 
5268 : 8d a1 58 STA $58a1 ; (seed + 1)
526b : 85 1c __ STA ACCU + 1 
526d : 98 __ __ TYA
526e : 91 16 __ STA (P9),y ; (sentence + 0)
5270 : a5 16 __ LDA P9 ; (sentence + 0)
5272 : a0 02 __ LDY #$02
5274 : 91 23 __ STA (SP + 0),y 
5276 : a5 17 __ LDA P10 ; (sentence + 1)
5278 : c8 __ __ INY
5279 : 91 23 __ STA (SP + 0),y 
527b : a9 e3 __ LDA #$e3
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
529e : bd f6 50 LDA $50f6,x ; (__multab6L + 0)
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
52c4 : bd fb 50 LDA $50fb,x ; (__multab15L + 0)
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
52ea : bd f6 50 LDA $50f6,x ; (__multab6L + 0)
52ed : 18 __ __ CLC
52ee : 69 73 __ ADC #$73
52f0 : a0 0c __ LDY #$0c
52f2 : 91 23 __ STA (SP + 0),y 
52f4 : a9 bf __ LDA #$bf
52f6 : 69 00 __ ADC #$00
52f8 : c8 __ __ INY
52f9 : 91 23 __ STA (SP + 0),y 
52fb : 20 7c 4c JSR $4c7c ; (sprintf.s1000 + 0)
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
564f : a9 fe __ LDA #$fe
5651 : c8 __ __ INY
5652 : 91 23 __ STA (SP + 0),y 
5654 : a9 4f __ LDA #$4f
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
566e : bd ed 58 LDA $58ed,x ; (p2smap + 0)
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
588c : 4c 40 4b JMP $4b40 ; (vdc_prints.s0 + 0)
--------------------------------------------------------------------
588f : __ __ __ BYT 7f 00 80 a0 4b 00 00 00 00 00 00 00 00 00 00 00 : ....K...........
--------------------------------------------------------------------
giocharmap:
589f : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
seed:
58a0 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
58a2 : __ __ __ BYT 42 4c 55 45 20 4a 41 59 00 00 00 00 00 00 00 43 : BLUE JAY.......C
58b2 : __ __ __ BYT 41 52 44 49 4e 41 4c 00 00 00 00 00 00 00 45 41 : ARDINAL.......EA
58c2 : __ __ __ BYT 53 54 45 52 4e 20 50 48 4f 45 42 45 00 47 52 41 : STERN PHOEBE.GRA
58d2 : __ __ __ BYT 43 4b 4c 45 00 00 00 00 00 00 00 00 53 41 4e 44 : CKLE........SAND
58e2 : __ __ __ BYT 48 49 4c 4c 20 43 52 41 4e 45 00                : HILL CRANE.
--------------------------------------------------------------------
p2smap:
58ed : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
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
01:1392 : 20 eb 45 JSR $45eb ; (krnio_setbnk.s0 + 0)
01:1395 : a5 12 __ LDA P5 ; (fname + 0)
01:1397 : 85 0d __ STA P0 
01:1399 : a5 13 __ LDA P6 ; (fname + 1)
01:139b : 85 0e __ STA P1 
01:139d : 20 f3 45 JSR $45f3 ; (krnio_setnam.s0 + 0)
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
01:14c2 : a9 5b __ LDA #$5b
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
01:14f2 : a9 5b __ LDA #$5b
01:14f4 : 85 11 __ STA P4 
01:14f6 : a5 57 __ LDA $57 
01:14f8 : 85 12 __ STA P5 
01:14fa : a9 00 __ LDA #$00
01:14fc : 85 13 __ STA P6 
01:14fe : 4c d1 13 JMP $13d1 ; (bnk_cpytovdc.s0 + 0)
