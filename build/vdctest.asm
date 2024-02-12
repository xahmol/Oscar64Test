; Compiled with 1.26.233
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
1c13 : 8e fe 5e STX $5efe ; (spentry + 0)
1c16 : a9 ee __ LDA #$ee
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 8a __ LDA #$8a
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 8c __ LDA #$8c
1c21 : e9 8a __ SBC #$8a
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
1c35 : a9 27 __ LDA #$27
1c37 : e9 ee __ SBC #$ee
1c39 : f0 08 __ BEQ $1c43 ; (startup + 66)
1c3b : a8 __ __ TAY
1c3c : a9 00 __ LDA #$00
1c3e : 88 __ __ DEY
1c3f : 91 19 __ STA (IP + 0),y 
1c41 : d0 fb __ BNE $1c3e ; (startup + 61)
1c43 : a2 80 __ LDX #$80
1c45 : e0 80 __ CPX #$80
1c47 : f0 07 __ BEQ $1c50 ; (startup + 79)
1c49 : 95 00 __ STA $00,x 
1c4b : e8 __ __ INX
1c4c : e0 80 __ CPX #$80
1c4e : d0 f9 __ BNE $1c49 ; (startup + 72)
1c50 : a9 b7 __ LDA #$b7
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
1c80 : a2 19 __ LDX #$19
1c82 : b5 53 __ LDA T0 + 0,x 
1c84 : 9d b9 be STA $beb9,x ; (main@stack + 0)
1c87 : ca __ __ DEX
1c88 : 10 f8 __ BPL $1c82 ; (main.s1000 + 2)
1c8a : 38 __ __ SEC
1c8b : a5 23 __ LDA SP + 0 
1c8d : e9 0a __ SBC #$0a
1c8f : 85 23 __ STA SP + 0 
1c91 : b0 02 __ BCS $1c95 ; (main.s0 + 0)
1c93 : c6 24 __ DEC SP + 1 
.s0:
1c95 : a9 7f __ LDA #$7f
1c97 : 8d 0d dc STA $dc0d 
1c9a : 8d 0d dd STA $dd0d 
1c9d : 8d 00 dc STA $dc00 
1ca0 : 8d ee 8a STA $8aee ; (winCfg + 0)
1ca3 : a9 08 __ LDA #$08
1ca5 : 8d 0e dc STA $dc0e 
1ca8 : 8d 0f dc STA $dc0f 
1cab : 8d 0e dd STA $dd0e 
1cae : 8d 0f dd STA $dd0f 
1cb1 : a9 00 __ LDA #$00
1cb3 : 8d 03 dc STA $dc03 
1cb6 : 8d 03 dd STA $dd03 
1cb9 : 8d f1 8a STA $8af1 ; (winCfg + 3)
1cbc : 8d f3 8a STA $8af3 ; (winCfg + 5)
1cbf : 8d ef 8a STA $8aef ; (winCfg + 1)
1cc2 : 8d f4 8a STA $8af4 ; (winCfg + 6)
1cc5 : a9 ff __ LDA #$ff
1cc7 : 8d 02 dc STA $dc02 
1cca : a9 07 __ LDA #$07
1ccc : 8d 01 dd STA $dd01 
1ccf : a9 3f __ LDA #$3f
1cd1 : 8d 02 dd STA $dd02 
1cd4 : a9 20 __ LDA #$20
1cd6 : 8d f2 8a STA $8af2 ; (winCfg + 4)
1cd9 : a9 e0 __ LDA #$e0
1cdb : 8d f0 8a STA $8af0 ; (winCfg + 2)
1cde : 8d f5 8a STA $8af5 ; (winCfg + 7)
1ce1 : a9 1a __ LDA #$1a
1ce3 : 8d 00 d6 STA $d600 
.l21978:
1ce6 : 2c 00 d6 BIT $d600 
1ce9 : 10 fb __ BPL $1ce6 ; (main.l21978 + 0)
.s11:
1ceb : ad 01 d6 LDA $d601 
1cee : 29 f0 __ AND #$f0
1cf0 : aa __ __ TAX
1cf1 : a9 1a __ LDA #$1a
1cf3 : 8d 00 d6 STA $d600 
.l21980:
1cf6 : 2c 00 d6 BIT $d600 
1cf9 : 10 fb __ BPL $1cf6 ; (main.l21980 + 0)
.s17:
1cfb : 8e 01 d6 STX $d601 
1cfe : 8d 00 d6 STA $d600 
.l21982:
1d01 : 2c 00 d6 BIT $d600 
1d04 : 10 fb __ BPL $1d01 ; (main.l21982 + 0)
.s24:
1d06 : ad 01 d6 LDA $d601 
1d09 : 29 0f __ AND #$0f
1d0b : 09 d0 __ ORA #$d0
1d0d : a2 1a __ LDX #$1a
1d0f : 8e 00 d6 STX $d600 
.l21984:
1d12 : 2c 00 d6 BIT $d600 
1d15 : 10 fb __ BPL $1d12 ; (main.l21984 + 0)
.s30:
1d17 : 8d 01 d6 STA $d601 
1d1a : a9 8d __ LDA #$8d
1d1c : 8d fd 8a STA $8afd ; (vdc_state + 7)
1d1f : a9 1c __ LDA #$1c
1d21 : 8d 00 d6 STA $d600 
.l21986:
1d24 : 2c 00 d6 BIT $d600 
1d27 : 10 fb __ BPL $1d24 ; (main.l21986 + 0)
.s36:
1d29 : ad 01 d6 LDA $d601 
1d2c : aa __ __ TAX
1d2d : 09 10 __ ORA #$10
1d2f : a0 1c __ LDY #$1c
1d31 : 8c 00 d6 STY $d600 
.l21988:
1d34 : 2c 00 d6 BIT $d600 
1d37 : 10 fb __ BPL $1d34 ; (main.l21988 + 0)
.s43:
1d39 : 8d 01 d6 STA $d601 
1d3c : a9 12 __ LDA #$12
1d3e : 8d 00 d6 STA $d600 
.l21990:
1d41 : 2c 00 d6 BIT $d600 
1d44 : 10 fb __ BPL $1d41 ; (main.l21990 + 0)
.s50:
1d46 : a9 1f __ LDA #$1f
1d48 : 8d 01 d6 STA $d601 
1d4b : a9 13 __ LDA #$13
1d4d : 8d 00 d6 STA $d600 
.l21992:
1d50 : 2c 00 d6 BIT $d600 
1d53 : 10 fb __ BPL $1d50 ; (main.l21992 + 0)
.s55:
1d55 : a9 ff __ LDA #$ff
1d57 : 8d 01 d6 STA $d601 
1d5a : a9 1f __ LDA #$1f
1d5c : 8d 00 d6 STA $d600 
.l21994:
1d5f : 2c 00 d6 BIT $d600 
1d62 : 10 fb __ BPL $1d5f ; (main.l21994 + 0)
.s59:
1d64 : a9 00 __ LDA #$00
1d66 : 8d 01 d6 STA $d601 
1d69 : a9 12 __ LDA #$12
1d6b : 8d 00 d6 STA $d600 
.l21996:
1d6e : 2c 00 d6 BIT $d600 
1d71 : 10 fb __ BPL $1d6e ; (main.l21996 + 0)
.s66:
1d73 : a9 9f __ LDA #$9f
1d75 : 8d 01 d6 STA $d601 
1d78 : a9 13 __ LDA #$13
1d7a : 8d 00 d6 STA $d600 
.l21998:
1d7d : 2c 00 d6 BIT $d600 
1d80 : 10 fb __ BPL $1d7d ; (main.l21998 + 0)
.s71:
1d82 : a9 ff __ LDA #$ff
1d84 : 8d 01 d6 STA $d601 
1d87 : a9 1f __ LDA #$1f
1d89 : 8d 00 d6 STA $d600 
.l22000:
1d8c : 2c 00 d6 BIT $d600 
1d8f : 10 fb __ BPL $1d8c ; (main.l22000 + 0)
.s75:
1d91 : a9 ff __ LDA #$ff
1d93 : 8d 01 d6 STA $d601 
1d96 : a9 12 __ LDA #$12
1d98 : 8d 00 d6 STA $d600 
.l22002:
1d9b : 2c 00 d6 BIT $d600 
1d9e : 10 fb __ BPL $1d9b ; (main.l22002 + 0)
.s82:
1da0 : a9 1f __ LDA #$1f
1da2 : 8d 01 d6 STA $d601 
1da5 : a9 13 __ LDA #$13
1da7 : 8d 00 d6 STA $d600 
.l22004:
1daa : 2c 00 d6 BIT $d600 
1dad : 10 fb __ BPL $1daa ; (main.l22004 + 0)
.s87:
1daf : a9 ff __ LDA #$ff
1db1 : 8d 01 d6 STA $d601 
1db4 : a9 1f __ LDA #$1f
1db6 : 8d 00 d6 STA $d600 
.l22006:
1db9 : 2c 00 d6 BIT $d600 
1dbc : 10 fb __ BPL $1db9 ; (main.l22006 + 0)
.s91:
1dbe : ad 01 d6 LDA $d601 
1dc1 : f0 04 __ BEQ $1dc7 ; (main.s2336 + 0)
.s2337:
1dc3 : a9 10 __ LDA #$10
1dc5 : d0 02 __ BNE $1dc9 ; (main.s2338 + 0)
.s2336:
1dc7 : a9 40 __ LDA #$40
.s2338:
1dc9 : 8d f6 8a STA $8af6 ; (vdc_state + 0)
1dcc : 8c 00 d6 STY $d600 
.l22009:
1dcf : 2c 00 d6 BIT $d600 
1dd2 : 10 fb __ BPL $1dcf ; (main.l22009 + 0)
.s98:
1dd4 : 8e 01 d6 STX $d601 
1dd7 : a9 00 __ LDA #$00
1dd9 : 85 55 __ STA T1 + 0 
1ddb : ad f9 8a LDA $8af9 ; (vdc_state + 3)
1dde : 85 53 __ STA T0 + 0 
1de0 : ad fb 8a LDA $8afb ; (vdc_state + 5)
1de3 : 85 57 __ STA T3 + 0 
.l101:
1de5 : a5 55 __ LDA T1 + 0 
1de7 : c5 57 __ CMP T3 + 0 
1de9 : b0 03 __ BCS $1dee ; (main.s31 + 0)
1deb : 4c a2 55 JMP $55a2 ; (main.s102 + 0)
.s31:
1dee : 20 8f 56 JSR $568f ; (screen_width.s0 + 0)
1df1 : c9 28 __ CMP #$28
1df3 : d0 17 __ BNE $1e0c ; (main.s174 + 0)
.s172:
1df5 : a9 c0 __ LDA #$c0
1df7 : a0 02 __ LDY #$02
1df9 : 91 23 __ STA (SP + 0),y 
1dfb : a9 5d __ LDA #$5d
1dfd : c8 __ __ INY
1dfe : 91 23 __ STA (SP + 0),y 
1e00 : 20 99 56 JSR $5699 ; (printf.s0 + 0)
1e03 : 20 eb 5d JSR $5deb ; (getch.s0 + 0)
1e06 : 20 81 ff JSR $ff81 
1e09 : 20 2b 5e JSR $5e2b ; (screen_setmode.s0 + 0)
.s174:
1e0c : 20 36 5e JSR $5e36 ; (bnk_init.s1000 + 0)
1e0f : a9 01 __ LDA #$01
1e11 : 20 b3 5f JSR $5fb3 ; (fastmode.s0 + 0)
1e14 : a9 00 __ LDA #$00
1e16 : 85 13 __ STA P6 
1e18 : 20 d2 5f JSR $5fd2 ; (vdc_set_mode.s0 + 0)
1e1b : ad f6 8a LDA $8af6 ; (vdc_state + 0)
1e1e : c9 40 __ CMP #$40
1e20 : f0 03 __ BEQ $1e25 ; (main.s178 + 0)
1e22 : 4c 38 1f JMP $1f38 ; (main.s4 + 0)
.s178:
1e25 : ad f7 8a LDA $8af7 ; (vdc_state + 1)
1e28 : f0 03 __ BEQ $1e2d ; (main.s182 + 0)
1e2a : 4c 38 1f JMP $1f38 ; (main.s4 + 0)
.s182:
1e2d : a9 22 __ LDA #$22
1e2f : 8d 00 d6 STA $d600 
.l23205:
1e32 : 2c 00 d6 BIT $d600 
1e35 : 10 fb __ BPL $1e32 ; (main.l23205 + 0)
.s190:
1e37 : a9 80 __ LDA #$80
1e39 : 8d 01 d6 STA $d601 
1e3c : a0 ff __ LDY #$ff
1e3e : a2 00 __ LDX #$00
.l193:
1e40 : a9 12 __ LDA #$12
1e42 : 8d 00 d6 STA $d600 
.l23207:
1e45 : 2c 00 d6 BIT $d600 
1e48 : 10 fb __ BPL $1e45 ; (main.l23207 + 0)
.s202:
1e4a : 8e 01 d6 STX $d601 
1e4d : a9 13 __ LDA #$13
1e4f : 8d 00 d6 STA $d600 
.l23209:
1e52 : 2c 00 d6 BIT $d600 
1e55 : 10 fb __ BPL $1e52 ; (main.l23209 + 0)
.s207:
1e57 : a9 00 __ LDA #$00
1e59 : 8d 01 d6 STA $d601 
1e5c : a9 1f __ LDA #$1f
1e5e : 8d 00 d6 STA $d600 
.l23211:
1e61 : 2c 00 d6 BIT $d600 
1e64 : 10 fb __ BPL $1e61 ; (main.l23211 + 0)
.s211:
1e66 : a9 00 __ LDA #$00
1e68 : 8d 01 d6 STA $d601 
1e6b : a9 18 __ LDA #$18
1e6d : 8d 00 d6 STA $d600 
.l23213:
1e70 : 2c 00 d6 BIT $d600 
1e73 : 10 fb __ BPL $1e70 ; (main.l23213 + 0)
.s217:
1e75 : ad 01 d6 LDA $d601 
1e78 : 29 7f __ AND #$7f
1e7a : 85 57 __ STA T3 + 0 
1e7c : a9 18 __ LDA #$18
1e7e : 8d 00 d6 STA $d600 
.l23215:
1e81 : 2c 00 d6 BIT $d600 
1e84 : 10 fb __ BPL $1e81 ; (main.l23215 + 0)
.s223:
1e86 : a5 57 __ LDA T3 + 0 
1e88 : 8d 01 d6 STA $d601 
1e8b : a9 1e __ LDA #$1e
1e8d : 8d 00 d6 STA $d600 
.l23217:
1e90 : 2c 00 d6 BIT $d600 
1e93 : 10 fb __ BPL $1e90 ; (main.l23217 + 0)
.s228:
1e95 : a9 ff __ LDA #$ff
1e97 : 8d 01 d6 STA $d601 
1e9a : e8 __ __ INX
1e9b : 88 __ __ DEY
1e9c : d0 a2 __ BNE $1e40 ; (main.l193 + 0)
.s195:
1e9e : a9 12 __ LDA #$12
1ea0 : 8d 00 d6 STA $d600 
.l23220:
1ea3 : 2c 00 d6 BIT $d600 
1ea6 : 10 fb __ BPL $1ea3 ; (main.l23220 + 0)
.s235:
1ea8 : 8e 01 d6 STX $d601 
1eab : a9 13 __ LDA #$13
1ead : 8d 00 d6 STA $d600 
.l23222:
1eb0 : 2c 00 d6 BIT $d600 
1eb3 : 10 fb __ BPL $1eb0 ; (main.l23222 + 0)
.s240:
1eb5 : 8c 01 d6 STY $d601 
1eb8 : a9 1f __ LDA #$1f
1eba : 8d 00 d6 STA $d600 
.l23224:
1ebd : 2c 00 d6 BIT $d600 
1ec0 : 10 fb __ BPL $1ebd ; (main.l23224 + 0)
.s244:
1ec2 : 8c 01 d6 STY $d601 
1ec5 : a9 18 __ LDA #$18
1ec7 : 8d 00 d6 STA $d600 
.l23226:
1eca : 2c 00 d6 BIT $d600 
1ecd : 10 fb __ BPL $1eca ; (main.l23226 + 0)
.s250:
1ecf : ad 01 d6 LDA $d601 
1ed2 : 29 7f __ AND #$7f
1ed4 : a2 18 __ LDX #$18
1ed6 : 8e 00 d6 STX $d600 
.l23228:
1ed9 : 2c 00 d6 BIT $d600 
1edc : 10 fb __ BPL $1ed9 ; (main.l23228 + 0)
.s256:
1ede : 8d 01 d6 STA $d601 
1ee1 : a9 1e __ LDA #$1e
1ee3 : 8d 00 d6 STA $d600 
.l23230:
1ee6 : 2c 00 d6 BIT $d600 
1ee9 : 10 fb __ BPL $1ee6 ; (main.l23230 + 0)
.s261:
1eeb : a9 ff __ LDA #$ff
1eed : 8d 01 d6 STA $d601 
1ef0 : a2 1c __ LDX #$1c
1ef2 : 8e 00 d6 STX $d600 
.l23232:
1ef5 : 2c 00 d6 BIT $d600 
1ef8 : 10 fb __ BPL $1ef5 ; (main.l23232 + 0)
.s267:
1efa : ad 01 d6 LDA $d601 
1efd : 09 10 __ ORA #$10
1eff : 8e 00 d6 STX $d600 
.l23234:
1f02 : 2c 00 d6 BIT $d600 
1f05 : 10 fb __ BPL $1f02 ; (main.l23234 + 0)
.s273:
1f07 : 8d 01 d6 STA $d601 
1f0a : 20 72 64 JSR $6472 ; (vdc_restore_charsets.s0 + 0)
1f0d : a9 00 __ LDA #$00
1f0f : 85 55 __ STA T1 + 0 
1f11 : ad f9 8a LDA $8af9 ; (vdc_state + 3)
1f14 : 85 53 __ STA T0 + 0 
1f16 : ad fb 8a LDA $8afb ; (vdc_state + 5)
1f19 : 85 57 __ STA T3 + 0 
.l276:
1f1b : a5 55 __ LDA T1 + 0 
1f1d : c5 57 __ CMP T3 + 0 
1f1f : b0 03 __ BCS $1f24 ; (main.s274 + 0)
1f21 : 4c ce 54 JMP $54ce ; (main.s277 + 0)
.s274:
1f24 : a9 22 __ LDA #$22
1f26 : 8d 00 d6 STA $d600 
.l23261:
1f29 : 2c 00 d6 BIT $d600 
1f2c : 10 fb __ BPL $1f29 ; (main.l23261 + 0)
.s352:
1f2e : a9 7d __ LDA #$7d
1f30 : 8d 01 d6 STA $d601 
1f33 : a9 01 __ LDA #$01
1f35 : 8d f7 8a STA $8af7 ; (vdc_state + 1)
.s4:
1f38 : a9 00 __ LDA #$00
1f3a : 85 0d __ STA P0 
1f3c : 85 0e __ STA P1 
1f3e : ad fd 8a LDA $8afd ; (vdc_state + 7)
1f41 : 85 55 __ STA T1 + 0 
1f43 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
1f46 : a5 1b __ LDA ACCU + 0 
1f48 : 85 53 __ STA T0 + 0 
1f4a : a5 1c __ LDA ACCU + 1 
1f4c : 85 54 __ STA T0 + 1 
1f4e : a9 7f __ LDA #$7f
1f50 : 85 0d __ STA P0 
1f52 : a9 64 __ LDA #$64
1f54 : 85 0e __ STA P1 
1f56 : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
1f59 : a5 1b __ LDA ACCU + 0 
1f5b : 85 57 __ STA T3 + 0 
1f5d : a9 12 __ LDA #$12
1f5f : 8d 00 d6 STA $d600 
1f62 : 18 __ __ CLC
1f63 : a5 53 __ LDA T0 + 0 
1f65 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
1f68 : aa __ __ TAX
1f69 : a5 54 __ LDA T0 + 1 
1f6b : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22039:
1f6e : 2c 00 d6 BIT $d600 
1f71 : 10 fb __ BPL $1f6e ; (main.l22039 + 0)
.s360:
1f73 : 8d 01 d6 STA $d601 
1f76 : a9 13 __ LDA #$13
1f78 : 8d 00 d6 STA $d600 
.l22041:
1f7b : 2c 00 d6 BIT $d600 
1f7e : 10 fb __ BPL $1f7b ; (main.l22041 + 0)
.s365:
1f80 : 8e 01 d6 STX $d601 
1f83 : a9 1f __ LDA #$1f
1f85 : 8d 00 d6 STA $d600 
1f88 : a5 1b __ LDA ACCU + 0 
1f8a : f0 19 __ BEQ $1fa5 ; (main.s370 + 0)
.s4846:
1f8c : a2 00 __ LDX #$00
.l368:
1f8e : 86 56 __ STX T2 + 0 
1f90 : bd 7f 64 LDA $647f,x 
1f93 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22044:
1f96 : 2c 00 d6 BIT $d600 
1f99 : 10 fb __ BPL $1f96 ; (main.l22044 + 0)
.s373:
1f9b : 8d 01 d6 STA $d601 
1f9e : a6 56 __ LDX T2 + 0 
1fa0 : e8 __ __ INX
1fa1 : e4 57 __ CPX T3 + 0 
1fa3 : 90 e9 __ BCC $1f8e ; (main.l368 + 0)
.s370:
1fa5 : a9 12 __ LDA #$12
1fa7 : 8d 00 d6 STA $d600 
1faa : c6 57 __ DEC T3 + 0 
1fac : ad 00 8b LDA $8b00 ; (vdc_state + 10)
1faf : 18 __ __ CLC
1fb0 : 65 53 __ ADC T0 + 0 
1fb2 : aa __ __ TAX
1fb3 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
1fb6 : 65 54 __ ADC T0 + 1 
.l22047:
1fb8 : 2c 00 d6 BIT $d600 
1fbb : 10 fb __ BPL $1fb8 ; (main.l22047 + 0)
.s380:
1fbd : 8d 01 d6 STA $d601 
1fc0 : a9 13 __ LDA #$13
1fc2 : 8d 00 d6 STA $d600 
.l22049:
1fc5 : 2c 00 d6 BIT $d600 
1fc8 : 10 fb __ BPL $1fc5 ; (main.l22049 + 0)
.s385:
1fca : 8e 01 d6 STX $d601 
1fcd : a9 1f __ LDA #$1f
1fcf : 8d 00 d6 STA $d600 
.l22051:
1fd2 : 2c 00 d6 BIT $d600 
1fd5 : 10 fb __ BPL $1fd2 ; (main.l22051 + 0)
.s389:
1fd7 : a5 55 __ LDA T1 + 0 
1fd9 : 8d 01 d6 STA $d601 
1fdc : a9 18 __ LDA #$18
1fde : 8d 00 d6 STA $d600 
.l22053:
1fe1 : 2c 00 d6 BIT $d600 
1fe4 : 10 fb __ BPL $1fe1 ; (main.l22053 + 0)
.s395:
1fe6 : ad 01 d6 LDA $d601 
1fe9 : 29 7f __ AND #$7f
1feb : a2 18 __ LDX #$18
1fed : 8e 00 d6 STX $d600 
.l22055:
1ff0 : 2c 00 d6 BIT $d600 
1ff3 : 10 fb __ BPL $1ff0 ; (main.l22055 + 0)
.s401:
1ff5 : 8d 01 d6 STA $d601 
1ff8 : a9 1e __ LDA #$1e
1ffa : 8d 00 d6 STA $d600 
.l22057:
1ffd : 2c 00 d6 BIT $d600 
2000 : 10 fb __ BPL $1ffd ; (main.l22057 + 0)
.s406:
2002 : a5 57 __ LDA T3 + 0 
2004 : 8d 01 d6 STA $d601 
2007 : a9 af __ LDA #$af
2009 : a0 02 __ LDY #$02
200b : 91 23 __ STA (SP + 0),y 
200d : a9 8b __ LDA #$8b
200f : c8 __ __ INY
2010 : 91 23 __ STA (SP + 0),y 
2012 : a9 2d __ LDA #$2d
2014 : c8 __ __ INY
2015 : 91 23 __ STA (SP + 0),y 
2017 : a9 65 __ LDA #$65
2019 : c8 __ __ INY
201a : 91 23 __ STA (SP + 0),y 
201c : ad f6 8a LDA $8af6 ; (vdc_state + 0)
201f : c8 __ __ INY
2020 : 91 23 __ STA (SP + 0),y 
2022 : a9 00 __ LDA #$00
2024 : c8 __ __ INY
2025 : 91 23 __ STA (SP + 0),y 
2027 : ad f7 8a LDA $8af7 ; (vdc_state + 1)
202a : d0 07 __ BNE $2033 ; (main.s10438 + 0)
.s10439:
202c : a9 65 __ LDA #$65
202e : a2 62 __ LDX #$62
2030 : 4c 37 20 JMP $2037 ; (main.s10440 + 0)
.s10438:
2033 : a9 5e __ LDA #$5e
2035 : a2 fa __ LDX #$fa
.s10440:
2037 : 85 58 __ STA T3 + 1 
2039 : 8a __ __ TXA
203a : a0 08 __ LDY #$08
203c : 91 23 __ STA (SP + 0),y 
203e : a5 58 __ LDA T3 + 1 
2040 : c8 __ __ INY
2041 : 91 23 __ STA (SP + 0),y 
2043 : 20 ff 64 JSR $64ff ; (sprintf.s0 + 0)
2046 : a9 00 __ LDA #$00
2048 : 85 0d __ STA P0 
204a : a9 02 __ LDA #$02
204c : 85 0e __ STA P1 
204e : ad fd 8a LDA $8afd ; (vdc_state + 7)
2051 : 85 55 __ STA T1 + 0 
2053 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
2056 : a5 1b __ LDA ACCU + 0 
2058 : 85 57 __ STA T3 + 0 
205a : a5 1c __ LDA ACCU + 1 
205c : 85 58 __ STA T3 + 1 
205e : 20 9a 64 JSR $649a ; (strlen@proxy + 0)
2061 : a5 1b __ LDA ACCU + 0 
2063 : 85 53 __ STA T0 + 0 
2065 : ad fe 8a LDA $8afe ; (vdc_state + 8)
2068 : 18 __ __ CLC
2069 : 65 57 __ ADC T3 + 0 
206b : a2 12 __ LDX #$12
206d : 8e 00 d6 STX $d600 
2070 : aa __ __ TAX
2071 : ad ff 8a LDA $8aff ; (vdc_state + 9)
2074 : 65 58 __ ADC T3 + 1 
.l22060:
2076 : 2c 00 d6 BIT $d600 
2079 : 10 fb __ BPL $2076 ; (main.l22060 + 0)
.s414:
207b : 8d 01 d6 STA $d601 
207e : a9 13 __ LDA #$13
2080 : 8d 00 d6 STA $d600 
.l22062:
2083 : 2c 00 d6 BIT $d600 
2086 : 10 fb __ BPL $2083 ; (main.l22062 + 0)
.s419:
2088 : 8e 01 d6 STX $d601 
208b : a9 1f __ LDA #$1f
208d : 8d 00 d6 STA $d600 
2090 : a5 1b __ LDA ACCU + 0 
2092 : f0 19 __ BEQ $20ad ; (main.s424 + 0)
.s4836:
2094 : a2 00 __ LDX #$00
.l422:
2096 : 86 56 __ STX T2 + 0 
2098 : bd af 8b LDA $8baf,x ; (linebuffer + 0)
209b : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22065:
209e : 2c 00 d6 BIT $d600 
20a1 : 10 fb __ BPL $209e ; (main.l22065 + 0)
.s427:
20a3 : 8d 01 d6 STA $d601 
20a6 : a6 56 __ LDX T2 + 0 
20a8 : e8 __ __ INX
20a9 : e4 53 __ CPX T0 + 0 
20ab : 90 e9 __ BCC $2096 ; (main.l422 + 0)
.s424:
20ad : a9 12 __ LDA #$12
20af : 8d 00 d6 STA $d600 
20b2 : c6 53 __ DEC T0 + 0 
20b4 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
20b7 : 18 __ __ CLC
20b8 : 65 57 __ ADC T3 + 0 
20ba : aa __ __ TAX
20bb : ad 01 8b LDA $8b01 ; (vdc_state + 11)
20be : 65 58 __ ADC T3 + 1 
.l22068:
20c0 : 2c 00 d6 BIT $d600 
20c3 : 10 fb __ BPL $20c0 ; (main.l22068 + 0)
.s434:
20c5 : 8d 01 d6 STA $d601 
20c8 : a9 13 __ LDA #$13
20ca : 8d 00 d6 STA $d600 
.l22070:
20cd : 2c 00 d6 BIT $d600 
20d0 : 10 fb __ BPL $20cd ; (main.l22070 + 0)
.s439:
20d2 : 8e 01 d6 STX $d601 
20d5 : a9 1f __ LDA #$1f
20d7 : 8d 00 d6 STA $d600 
.l22072:
20da : 2c 00 d6 BIT $d600 
20dd : 10 fb __ BPL $20da ; (main.l22072 + 0)
.s443:
20df : a5 55 __ LDA T1 + 0 
20e1 : 8d 01 d6 STA $d601 
20e4 : a9 18 __ LDA #$18
20e6 : 8d 00 d6 STA $d600 
.l22074:
20e9 : 2c 00 d6 BIT $d600 
20ec : 10 fb __ BPL $20e9 ; (main.l22074 + 0)
.s449:
20ee : ad 01 d6 LDA $d601 
20f1 : 29 7f __ AND #$7f
20f3 : a2 18 __ LDX #$18
20f5 : 8e 00 d6 STX $d600 
.l22076:
20f8 : 2c 00 d6 BIT $d600 
20fb : 10 fb __ BPL $20f8 ; (main.l22076 + 0)
.s455:
20fd : 8d 01 d6 STA $d601 
2100 : a9 1e __ LDA #$1e
2102 : 8d 00 d6 STA $d600 
.l22078:
2105 : 2c 00 d6 BIT $d600 
2108 : 10 fb __ BPL $2105 ; (main.l22078 + 0)
.s460:
210a : a5 53 __ LDA T0 + 0 
210c : 8d 01 d6 STA $d601 
210f : a9 00 __ LDA #$00
2111 : 85 0d __ STA P0 
2113 : a9 04 __ LDA #$04
2115 : 85 0e __ STA P1 
2117 : ad fd 8a LDA $8afd ; (vdc_state + 7)
211a : 85 55 __ STA T1 + 0 
211c : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
211f : a5 1b __ LDA ACCU + 0 
2121 : 85 53 __ STA T0 + 0 
2123 : a5 1c __ LDA ACCU + 1 
2125 : 85 54 __ STA T0 + 1 
2127 : a9 66 __ LDA #$66
2129 : 85 0d __ STA P0 
212b : a9 65 __ LDA #$65
212d : 85 0e __ STA P1 
212f : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
2132 : a5 1b __ LDA ACCU + 0 
2134 : 85 57 __ STA T3 + 0 
2136 : a9 12 __ LDA #$12
2138 : 8d 00 d6 STA $d600 
213b : 18 __ __ CLC
213c : a5 53 __ LDA T0 + 0 
213e : 6d fe 8a ADC $8afe ; (vdc_state + 8)
2141 : aa __ __ TAX
2142 : a5 54 __ LDA T0 + 1 
2144 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22080:
2147 : 2c 00 d6 BIT $d600 
214a : 10 fb __ BPL $2147 ; (main.l22080 + 0)
.s468:
214c : 8d 01 d6 STA $d601 
214f : a9 13 __ LDA #$13
2151 : 8d 00 d6 STA $d600 
.l22082:
2154 : 2c 00 d6 BIT $d600 
2157 : 10 fb __ BPL $2154 ; (main.l22082 + 0)
.s473:
2159 : 8e 01 d6 STX $d601 
215c : a9 1f __ LDA #$1f
215e : 8d 00 d6 STA $d600 
2161 : a5 1b __ LDA ACCU + 0 
2163 : f0 19 __ BEQ $217e ; (main.s478 + 0)
.s4826:
2165 : a2 00 __ LDX #$00
.l476:
2167 : 86 56 __ STX T2 + 0 
2169 : bd 66 65 LDA $6566,x 
216c : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22085:
216f : 2c 00 d6 BIT $d600 
2172 : 10 fb __ BPL $216f ; (main.l22085 + 0)
.s481:
2174 : 8d 01 d6 STA $d601 
2177 : a6 56 __ LDX T2 + 0 
2179 : e8 __ __ INX
217a : e4 57 __ CPX T3 + 0 
217c : 90 e9 __ BCC $2167 ; (main.l476 + 0)
.s478:
217e : a9 12 __ LDA #$12
2180 : 8d 00 d6 STA $d600 
2183 : c6 57 __ DEC T3 + 0 
2185 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
2188 : 18 __ __ CLC
2189 : 65 53 __ ADC T0 + 0 
218b : aa __ __ TAX
218c : ad 01 8b LDA $8b01 ; (vdc_state + 11)
218f : 65 54 __ ADC T0 + 1 
.l22088:
2191 : 2c 00 d6 BIT $d600 
2194 : 10 fb __ BPL $2191 ; (main.l22088 + 0)
.s488:
2196 : 8d 01 d6 STA $d601 
2199 : a9 13 __ LDA #$13
219b : 8d 00 d6 STA $d600 
.l22090:
219e : 2c 00 d6 BIT $d600 
21a1 : 10 fb __ BPL $219e ; (main.l22090 + 0)
.s493:
21a3 : 8e 01 d6 STX $d601 
21a6 : a9 1f __ LDA #$1f
21a8 : 8d 00 d6 STA $d600 
.l22092:
21ab : 2c 00 d6 BIT $d600 
21ae : 10 fb __ BPL $21ab ; (main.l22092 + 0)
.s497:
21b0 : a5 55 __ LDA T1 + 0 
21b2 : 8d 01 d6 STA $d601 
21b5 : a9 18 __ LDA #$18
21b7 : 8d 00 d6 STA $d600 
.l22094:
21ba : 2c 00 d6 BIT $d600 
21bd : 10 fb __ BPL $21ba ; (main.l22094 + 0)
.s503:
21bf : ad 01 d6 LDA $d601 
21c2 : 29 7f __ AND #$7f
21c4 : a2 18 __ LDX #$18
21c6 : 8e 00 d6 STX $d600 
.l22096:
21c9 : 2c 00 d6 BIT $d600 
21cc : 10 fb __ BPL $21c9 ; (main.l22096 + 0)
.s509:
21ce : 8d 01 d6 STA $d601 
21d1 : a9 1e __ LDA #$1e
21d3 : 8d 00 d6 STA $d600 
.l22098:
21d6 : 2c 00 d6 BIT $d600 
21d9 : 10 fb __ BPL $21d6 ; (main.l22098 + 0)
.s514:
21db : a5 57 __ LDA T3 + 0 
21dd : 8d 01 d6 STA $d601 
21e0 : a9 00 __ LDA #$00
21e2 : 85 0d __ STA P0 
21e4 : a9 05 __ LDA #$05
21e6 : 85 0e __ STA P1 
21e8 : ad fd 8a LDA $8afd ; (vdc_state + 7)
21eb : 85 55 __ STA T1 + 0 
21ed : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
21f0 : a5 1b __ LDA ACCU + 0 
21f2 : 85 53 __ STA T0 + 0 
21f4 : a5 1c __ LDA ACCU + 1 
21f6 : 85 54 __ STA T0 + 1 
21f8 : a9 76 __ LDA #$76
21fa : 85 0d __ STA P0 
21fc : a9 65 __ LDA #$65
21fe : 85 0e __ STA P1 
2200 : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
2203 : a5 1b __ LDA ACCU + 0 
2205 : 85 57 __ STA T3 + 0 
2207 : a9 12 __ LDA #$12
2209 : 8d 00 d6 STA $d600 
220c : 18 __ __ CLC
220d : a5 53 __ LDA T0 + 0 
220f : 6d fe 8a ADC $8afe ; (vdc_state + 8)
2212 : aa __ __ TAX
2213 : a5 54 __ LDA T0 + 1 
2215 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22100:
2218 : 2c 00 d6 BIT $d600 
221b : 10 fb __ BPL $2218 ; (main.l22100 + 0)
.s522:
221d : 8d 01 d6 STA $d601 
2220 : a9 13 __ LDA #$13
2222 : 8d 00 d6 STA $d600 
.l22102:
2225 : 2c 00 d6 BIT $d600 
2228 : 10 fb __ BPL $2225 ; (main.l22102 + 0)
.s527:
222a : 8e 01 d6 STX $d601 
222d : a9 1f __ LDA #$1f
222f : 8d 00 d6 STA $d600 
2232 : a5 1b __ LDA ACCU + 0 
2234 : f0 19 __ BEQ $224f ; (main.s532 + 0)
.s4816:
2236 : a2 00 __ LDX #$00
.l530:
2238 : 86 56 __ STX T2 + 0 
223a : bd 76 65 LDA $6576,x 
223d : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22105:
2240 : 2c 00 d6 BIT $d600 
2243 : 10 fb __ BPL $2240 ; (main.l22105 + 0)
.s535:
2245 : 8d 01 d6 STA $d601 
2248 : a6 56 __ LDX T2 + 0 
224a : e8 __ __ INX
224b : e4 57 __ CPX T3 + 0 
224d : 90 e9 __ BCC $2238 ; (main.l530 + 0)
.s532:
224f : a9 12 __ LDA #$12
2251 : 8d 00 d6 STA $d600 
2254 : c6 57 __ DEC T3 + 0 
2256 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
2259 : 18 __ __ CLC
225a : 65 53 __ ADC T0 + 0 
225c : aa __ __ TAX
225d : ad 01 8b LDA $8b01 ; (vdc_state + 11)
2260 : 65 54 __ ADC T0 + 1 
.l22108:
2262 : 2c 00 d6 BIT $d600 
2265 : 10 fb __ BPL $2262 ; (main.l22108 + 0)
.s542:
2267 : 8d 01 d6 STA $d601 
226a : a9 13 __ LDA #$13
226c : 8d 00 d6 STA $d600 
.l22110:
226f : 2c 00 d6 BIT $d600 
2272 : 10 fb __ BPL $226f ; (main.l22110 + 0)
.s547:
2274 : 8e 01 d6 STX $d601 
2277 : a9 1f __ LDA #$1f
2279 : 8d 00 d6 STA $d600 
.l22112:
227c : 2c 00 d6 BIT $d600 
227f : 10 fb __ BPL $227c ; (main.l22112 + 0)
.s551:
2281 : a5 55 __ LDA T1 + 0 
2283 : 8d 01 d6 STA $d601 
2286 : a9 18 __ LDA #$18
2288 : 8d 00 d6 STA $d600 
.l22114:
228b : 2c 00 d6 BIT $d600 
228e : 10 fb __ BPL $228b ; (main.l22114 + 0)
.s557:
2290 : ad 01 d6 LDA $d601 
2293 : 29 7f __ AND #$7f
2295 : a2 18 __ LDX #$18
2297 : 8e 00 d6 STX $d600 
.l22116:
229a : 2c 00 d6 BIT $d600 
229d : 10 fb __ BPL $229a ; (main.l22116 + 0)
.s563:
229f : 8d 01 d6 STA $d601 
22a2 : a9 1e __ LDA #$1e
22a4 : 8d 00 d6 STA $d600 
.l22118:
22a7 : 2c 00 d6 BIT $d600 
22aa : 10 fb __ BPL $22a7 ; (main.l22118 + 0)
.s568:
22ac : a5 57 __ LDA T3 + 0 
22ae : 8d 01 d6 STA $d601 
22b1 : a9 40 __ LDA #$40
22b3 : 85 11 __ STA P4 
22b5 : a9 91 __ LDA #$91
22b7 : 85 12 __ STA P5 
22b9 : a9 65 __ LDA #$65
22bb : 85 13 __ STA P6 
22bd : 20 80 13 JSR $1380 ; (bnk_load@proxy + 0)
22c0 : a5 1b __ LDA ACCU + 0 
22c2 : d0 06 __ BNE $22ca ; (main.s571 + 0)
.s569:
22c4 : 20 99 65 JSR $6599 ; (menu_fileerrormessage.s1000 + 0)
22c7 : 20 96 5f JSR $5f96 ; (exit@proxy + 0)
.s571:
22ca : a9 00 __ LDA #$00
22cc : 85 0d __ STA P0 
22ce : a9 06 __ LDA #$06
22d0 : 85 0e __ STA P1 
22d2 : ad fd 8a LDA $8afd ; (vdc_state + 7)
22d5 : 85 55 __ STA T1 + 0 
22d7 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
22da : a5 1b __ LDA ACCU + 0 
22dc : 85 53 __ STA T0 + 0 
22de : a5 1c __ LDA ACCU + 1 
22e0 : 85 54 __ STA T0 + 1 
22e2 : a9 b1 __ LDA #$b1
22e4 : 85 0d __ STA P0 
22e6 : a9 72 __ LDA #$72
22e8 : 85 0e __ STA P1 
22ea : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
22ed : a5 1b __ LDA ACCU + 0 
22ef : 85 57 __ STA T3 + 0 
22f1 : a9 12 __ LDA #$12
22f3 : 8d 00 d6 STA $d600 
22f6 : 18 __ __ CLC
22f7 : a5 53 __ LDA T0 + 0 
22f9 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
22fc : aa __ __ TAX
22fd : a5 54 __ LDA T0 + 1 
22ff : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22121:
2302 : 2c 00 d6 BIT $d600 
2305 : 10 fb __ BPL $2302 ; (main.l22121 + 0)
.s579:
2307 : 8d 01 d6 STA $d601 
230a : a9 13 __ LDA #$13
230c : 8d 00 d6 STA $d600 
.l22123:
230f : 2c 00 d6 BIT $d600 
2312 : 10 fb __ BPL $230f ; (main.l22123 + 0)
.s584:
2314 : 8e 01 d6 STX $d601 
2317 : a9 1f __ LDA #$1f
2319 : 8d 00 d6 STA $d600 
231c : a5 1b __ LDA ACCU + 0 
231e : f0 19 __ BEQ $2339 ; (main.s589 + 0)
.s4806:
2320 : a2 00 __ LDX #$00
.l587:
2322 : 86 56 __ STX T2 + 0 
2324 : bd b1 72 LDA $72b1,x 
2327 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22126:
232a : 2c 00 d6 BIT $d600 
232d : 10 fb __ BPL $232a ; (main.l22126 + 0)
.s592:
232f : 8d 01 d6 STA $d601 
2332 : a6 56 __ LDX T2 + 0 
2334 : e8 __ __ INX
2335 : e4 57 __ CPX T3 + 0 
2337 : 90 e9 __ BCC $2322 ; (main.l587 + 0)
.s589:
2339 : a9 12 __ LDA #$12
233b : 8d 00 d6 STA $d600 
233e : c6 57 __ DEC T3 + 0 
2340 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
2343 : 18 __ __ CLC
2344 : 65 53 __ ADC T0 + 0 
2346 : aa __ __ TAX
2347 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
234a : 65 54 __ ADC T0 + 1 
.l22129:
234c : 2c 00 d6 BIT $d600 
234f : 10 fb __ BPL $234c ; (main.l22129 + 0)
.s599:
2351 : 8d 01 d6 STA $d601 
2354 : a9 13 __ LDA #$13
2356 : 8d 00 d6 STA $d600 
.l22131:
2359 : 2c 00 d6 BIT $d600 
235c : 10 fb __ BPL $2359 ; (main.l22131 + 0)
.s604:
235e : 8e 01 d6 STX $d601 
2361 : a9 1f __ LDA #$1f
2363 : 8d 00 d6 STA $d600 
.l22133:
2366 : 2c 00 d6 BIT $d600 
2369 : 10 fb __ BPL $2366 ; (main.l22133 + 0)
.s608:
236b : a5 55 __ LDA T1 + 0 
236d : 8d 01 d6 STA $d601 
2370 : a9 18 __ LDA #$18
2372 : 8d 00 d6 STA $d600 
.l22135:
2375 : 2c 00 d6 BIT $d600 
2378 : 10 fb __ BPL $2375 ; (main.l22135 + 0)
.s614:
237a : ad 01 d6 LDA $d601 
237d : 29 7f __ AND #$7f
237f : a2 18 __ LDX #$18
2381 : 8e 00 d6 STX $d600 
.l22137:
2384 : 2c 00 d6 BIT $d600 
2387 : 10 fb __ BPL $2384 ; (main.l22137 + 0)
.s620:
2389 : 8d 01 d6 STA $d601 
238c : a9 1e __ LDA #$1e
238e : 8d 00 d6 STA $d600 
.l22139:
2391 : 2c 00 d6 BIT $d600 
2394 : 10 fb __ BPL $2391 ; (main.l22139 + 0)
.s625:
2396 : a5 57 __ LDA T3 + 0 
2398 : 8d 01 d6 STA $d601 
239b : a9 a0 __ LDA #$a0
239d : 85 11 __ STA P4 
239f : a9 ce __ LDA #$ce
23a1 : 85 12 __ STA P5 
23a3 : a9 72 __ LDA #$72
23a5 : 85 13 __ STA P6 
23a7 : 20 80 13 JSR $1380 ; (bnk_load@proxy + 0)
23aa : a5 1b __ LDA ACCU + 0 
23ac : d0 06 __ BNE $23b4 ; (main.s628 + 0)
.s626:
23ae : 20 99 65 JSR $6599 ; (menu_fileerrormessage.s1000 + 0)
23b1 : 20 96 5f JSR $5f96 ; (exit@proxy + 0)
.s628:
23b4 : a9 00 __ LDA #$00
23b6 : 85 0d __ STA P0 
23b8 : a9 07 __ LDA #$07
23ba : 85 0e __ STA P1 
23bc : ad fd 8a LDA $8afd ; (vdc_state + 7)
23bf : 85 55 __ STA T1 + 0 
23c1 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
23c4 : a5 1b __ LDA ACCU + 0 
23c6 : 85 53 __ STA T0 + 0 
23c8 : a5 1c __ LDA ACCU + 1 
23ca : 85 54 __ STA T0 + 1 
23cc : a9 00 __ LDA #$00
23ce : 85 0d __ STA P0 
23d0 : a9 73 __ LDA #$73
23d2 : 85 0e __ STA P1 
23d4 : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
23d7 : a5 1b __ LDA ACCU + 0 
23d9 : 85 57 __ STA T3 + 0 
23db : a9 12 __ LDA #$12
23dd : 8d 00 d6 STA $d600 
23e0 : 18 __ __ CLC
23e1 : a5 53 __ LDA T0 + 0 
23e3 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
23e6 : aa __ __ TAX
23e7 : a5 54 __ LDA T0 + 1 
23e9 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22142:
23ec : 2c 00 d6 BIT $d600 
23ef : 10 fb __ BPL $23ec ; (main.l22142 + 0)
.s636:
23f1 : 8d 01 d6 STA $d601 
23f4 : a9 13 __ LDA #$13
23f6 : 8d 00 d6 STA $d600 
.l22144:
23f9 : 2c 00 d6 BIT $d600 
23fc : 10 fb __ BPL $23f9 ; (main.l22144 + 0)
.s641:
23fe : 8e 01 d6 STX $d601 
2401 : a9 1f __ LDA #$1f
2403 : 8d 00 d6 STA $d600 
2406 : a5 1b __ LDA ACCU + 0 
2408 : f0 19 __ BEQ $2423 ; (main.s646 + 0)
.s4796:
240a : a2 00 __ LDX #$00
.l644:
240c : 86 56 __ STX T2 + 0 
240e : bd 00 73 LDA $7300,x 
2411 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22147:
2414 : 2c 00 d6 BIT $d600 
2417 : 10 fb __ BPL $2414 ; (main.l22147 + 0)
.s649:
2419 : 8d 01 d6 STA $d601 
241c : a6 56 __ LDX T2 + 0 
241e : e8 __ __ INX
241f : e4 57 __ CPX T3 + 0 
2421 : 90 e9 __ BCC $240c ; (main.l644 + 0)
.s646:
2423 : a9 12 __ LDA #$12
2425 : 8d 00 d6 STA $d600 
2428 : c6 57 __ DEC T3 + 0 
242a : ad 00 8b LDA $8b00 ; (vdc_state + 10)
242d : 18 __ __ CLC
242e : 65 53 __ ADC T0 + 0 
2430 : aa __ __ TAX
2431 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
2434 : 65 54 __ ADC T0 + 1 
.l22150:
2436 : 2c 00 d6 BIT $d600 
2439 : 10 fb __ BPL $2436 ; (main.l22150 + 0)
.s656:
243b : 8d 01 d6 STA $d601 
243e : a9 13 __ LDA #$13
2440 : 8d 00 d6 STA $d600 
.l22152:
2443 : 2c 00 d6 BIT $d600 
2446 : 10 fb __ BPL $2443 ; (main.l22152 + 0)
.s661:
2448 : 8e 01 d6 STX $d601 
244b : a9 1f __ LDA #$1f
244d : 8d 00 d6 STA $d600 
.l22154:
2450 : 2c 00 d6 BIT $d600 
2453 : 10 fb __ BPL $2450 ; (main.l22154 + 0)
.s665:
2455 : a5 55 __ LDA T1 + 0 
2457 : 8d 01 d6 STA $d601 
245a : a9 18 __ LDA #$18
245c : 8d 00 d6 STA $d600 
.l22156:
245f : 2c 00 d6 BIT $d600 
2462 : 10 fb __ BPL $245f ; (main.l22156 + 0)
.s671:
2464 : ad 01 d6 LDA $d601 
2467 : 29 7f __ AND #$7f
2469 : a2 18 __ LDX #$18
246b : 8e 00 d6 STX $d600 
.l22158:
246e : 2c 00 d6 BIT $d600 
2471 : 10 fb __ BPL $246e ; (main.l22158 + 0)
.s677:
2473 : 8d 01 d6 STA $d601 
2476 : a9 1e __ LDA #$1e
2478 : 8d 00 d6 STA $d600 
.l22160:
247b : 2c 00 d6 BIT $d600 
247e : 10 fb __ BPL $247b ; (main.l22160 + 0)
.s682:
2480 : a5 57 __ LDA T3 + 0 
2482 : 8d 01 d6 STA $d601 
2485 : a9 20 __ LDA #$20
2487 : 85 11 __ STA P4 
2489 : a9 d6 __ LDA #$d6
248b : 85 12 __ STA P5 
248d : a9 72 __ LDA #$72
248f : 85 13 __ STA P6 
2491 : 20 80 13 JSR $1380 ; (bnk_load@proxy + 0)
2494 : a5 1b __ LDA ACCU + 0 
2496 : d0 06 __ BNE $249e ; (main.s4788 + 0)
.s683:
2498 : 20 99 65 JSR $6599 ; (menu_fileerrormessage.s1000 + 0)
249b : 20 96 5f JSR $5f96 ; (exit@proxy + 0)
.s4788:
249e : 20 ba 14 JSR $14ba ; (sid_startmusic.s0 + 0)
.l686:
24a1 : ad f9 8a LDA $8af9 ; (vdc_state + 3)
24a4 : 85 53 __ STA T0 + 0 
24a6 : ad fb 8a LDA $8afb ; (vdc_state + 5)
24a9 : 85 57 __ STA T3 + 0 
24ab : a9 00 __ LDA #$00
24ad : 85 55 __ STA T1 + 0 
24af : 85 0d __ STA P0 
.l691:
24b1 : a5 55 __ LDA T1 + 0 
24b3 : c5 57 __ CMP T3 + 0 
24b5 : b0 03 __ BCS $24ba ; (main.s689 + 0)
24b7 : 4c 00 54 JMP $5400 ; (main.s692 + 0)
.s689:
24ba : a9 00 __ LDA #$00
24bc : 85 0e __ STA P1 
24be : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
24c1 : a9 12 __ LDA #$12
24c3 : 8d 00 d6 STA $d600 
24c6 : ad fe 8a LDA $8afe ; (vdc_state + 8)
24c9 : 85 57 __ STA T3 + 0 
24cb : 18 __ __ CLC
24cc : 65 1b __ ADC ACCU + 0 
24ce : aa __ __ TAX
24cf : ad ff 8a LDA $8aff ; (vdc_state + 9)
24d2 : 85 58 __ STA T3 + 1 
24d4 : 65 1c __ ADC ACCU + 1 
.l22188:
24d6 : 2c 00 d6 BIT $d600 
24d9 : 10 fb __ BPL $24d6 ; (main.l22188 + 0)
.s770:
24db : 8d 01 d6 STA $d601 
24de : a9 13 __ LDA #$13
24e0 : 8d 00 d6 STA $d600 
.l22190:
24e3 : 2c 00 d6 BIT $d600 
24e6 : 10 fb __ BPL $24e3 ; (main.l22190 + 0)
.s775:
24e8 : 8e 01 d6 STX $d601 
24eb : a9 1f __ LDA #$1f
24ed : 8d 00 d6 STA $d600 
.l22192:
24f0 : 2c 00 d6 BIT $d600 
24f3 : 10 fb __ BPL $24f0 ; (main.l22192 + 0)
.s779:
24f5 : a9 20 __ LDA #$20
24f7 : 8d 01 d6 STA $d601 
24fa : a9 18 __ LDA #$18
24fc : 8d 00 d6 STA $d600 
.l22194:
24ff : 2c 00 d6 BIT $d600 
2502 : 10 fb __ BPL $24ff ; (main.l22194 + 0)
.s785:
2504 : ad 01 d6 LDA $d601 
2507 : 29 7f __ AND #$7f
2509 : a2 18 __ LDX #$18
250b : 8e 00 d6 STX $d600 
.l22196:
250e : 2c 00 d6 BIT $d600 
2511 : 10 fb __ BPL $250e ; (main.l22196 + 0)
.s791:
2513 : 8d 01 d6 STA $d601 
2516 : a9 1e __ LDA #$1e
2518 : 8d 00 d6 STA $d600 
.l22198:
251b : 2c 00 d6 BIT $d600 
251e : 10 fb __ BPL $251b ; (main.l22198 + 0)
.s796:
2520 : a9 4f __ LDA #$4f
2522 : 8d 01 d6 STA $d601 
2525 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
2528 : 18 __ __ CLC
2529 : 65 1b __ ADC ACCU + 0 
252b : a2 12 __ LDX #$12
252d : 8e 00 d6 STX $d600 
2530 : aa __ __ TAX
2531 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
2534 : 65 1c __ ADC ACCU + 1 
.l22200:
2536 : 2c 00 d6 BIT $d600 
2539 : 10 fb __ BPL $2536 ; (main.l22200 + 0)
.s803:
253b : 8d 01 d6 STA $d601 
253e : a9 13 __ LDA #$13
2540 : 8d 00 d6 STA $d600 
.l22202:
2543 : 2c 00 d6 BIT $d600 
2546 : 10 fb __ BPL $2543 ; (main.l22202 + 0)
.s808:
2548 : 8e 01 d6 STX $d601 
254b : a9 1f __ LDA #$1f
254d : 8d 00 d6 STA $d600 
.l22204:
2550 : 2c 00 d6 BIT $d600 
2553 : 10 fb __ BPL $2550 ; (main.l22204 + 0)
.s812:
2555 : a9 c5 __ LDA #$c5
2557 : 8d 01 d6 STA $d601 
255a : a9 18 __ LDA #$18
255c : 8d 00 d6 STA $d600 
.l22206:
255f : 2c 00 d6 BIT $d600 
2562 : 10 fb __ BPL $255f ; (main.l22206 + 0)
.s818:
2564 : ad 01 d6 LDA $d601 
2567 : 29 7f __ AND #$7f
2569 : a2 18 __ LDX #$18
256b : 8e 00 d6 STX $d600 
.l22208:
256e : 2c 00 d6 BIT $d600 
2571 : 10 fb __ BPL $256e ; (main.l22208 + 0)
.s824:
2573 : 8d 01 d6 STA $d601 
2576 : a9 1e __ LDA #$1e
2578 : 8d 00 d6 STA $d600 
.l22210:
257b : 2c 00 d6 BIT $d600 
257e : 10 fb __ BPL $257b ; (main.l22210 + 0)
.s829:
2580 : a9 4f __ LDA #$4f
2582 : 8d 01 d6 STA $d601 
2585 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
2588 : a5 1b __ LDA ACCU + 0 
258a : 85 53 __ STA T0 + 0 
258c : a5 1c __ LDA ACCU + 1 
258e : 85 54 __ STA T0 + 1 
2590 : a9 dd __ LDA #$dd
2592 : 85 0d __ STA P0 
2594 : a9 72 __ LDA #$72
2596 : 85 0e __ STA P1 
2598 : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
259b : a5 1b __ LDA ACCU + 0 
259d : 85 59 __ STA T4 + 0 
259f : a9 12 __ LDA #$12
25a1 : 8d 00 d6 STA $d600 
25a4 : 18 __ __ CLC
25a5 : a5 53 __ LDA T0 + 0 
25a7 : 65 57 __ ADC T3 + 0 
25a9 : aa __ __ TAX
25aa : a5 54 __ LDA T0 + 1 
25ac : 65 58 __ ADC T3 + 1 
.l22212:
25ae : 2c 00 d6 BIT $d600 
25b1 : 10 fb __ BPL $25ae ; (main.l22212 + 0)
.s836:
25b3 : 8d 01 d6 STA $d601 
25b6 : a9 13 __ LDA #$13
25b8 : 8d 00 d6 STA $d600 
.l22214:
25bb : 2c 00 d6 BIT $d600 
25be : 10 fb __ BPL $25bb ; (main.l22214 + 0)
.s841:
25c0 : 8e 01 d6 STX $d601 
25c3 : a9 1f __ LDA #$1f
25c5 : 8d 00 d6 STA $d600 
25c8 : a5 1b __ LDA ACCU + 0 
25ca : f0 19 __ BEQ $25e5 ; (main.s846 + 0)
.s4772:
25cc : a2 00 __ LDX #$00
.l844:
25ce : 86 55 __ STX T1 + 0 
25d0 : bd dd 72 LDA $72dd,x 
25d3 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22217:
25d6 : 2c 00 d6 BIT $d600 
25d9 : 10 fb __ BPL $25d6 ; (main.l22217 + 0)
.s849:
25db : 8d 01 d6 STA $d601 
25de : a6 55 __ LDX T1 + 0 
25e0 : e8 __ __ INX
25e1 : e4 59 __ CPX T4 + 0 
25e3 : 90 e9 __ BCC $25ce ; (main.l844 + 0)
.s846:
25e5 : a9 12 __ LDA #$12
25e7 : 8d 00 d6 STA $d600 
25ea : c6 59 __ DEC T4 + 0 
25ec : ad 00 8b LDA $8b00 ; (vdc_state + 10)
25ef : 18 __ __ CLC
25f0 : 65 53 __ ADC T0 + 0 
25f2 : aa __ __ TAX
25f3 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
25f6 : 65 54 __ ADC T0 + 1 
.l22220:
25f8 : 2c 00 d6 BIT $d600 
25fb : 10 fb __ BPL $25f8 ; (main.l22220 + 0)
.s856:
25fd : 8d 01 d6 STA $d601 
2600 : a9 13 __ LDA #$13
2602 : 8d 00 d6 STA $d600 
.l22222:
2605 : 2c 00 d6 BIT $d600 
2608 : 10 fb __ BPL $2605 ; (main.l22222 + 0)
.s861:
260a : 8e 01 d6 STX $d601 
260d : a9 1f __ LDA #$1f
260f : 8d 00 d6 STA $d600 
.l22224:
2612 : 2c 00 d6 BIT $d600 
2615 : 10 fb __ BPL $2612 ; (main.l22224 + 0)
.s865:
2617 : a9 c5 __ LDA #$c5
2619 : 8d 01 d6 STA $d601 
261c : a9 18 __ LDA #$18
261e : 8d 00 d6 STA $d600 
.l22226:
2621 : 2c 00 d6 BIT $d600 
2624 : 10 fb __ BPL $2621 ; (main.l22226 + 0)
.s871:
2626 : ad 01 d6 LDA $d601 
2629 : 29 7f __ AND #$7f
262b : a2 18 __ LDX #$18
262d : 8e 00 d6 STX $d600 
.l22228:
2630 : 2c 00 d6 BIT $d600 
2633 : 10 fb __ BPL $2630 ; (main.l22228 + 0)
.s877:
2635 : 8d 01 d6 STA $d601 
2638 : a9 1e __ LDA #$1e
263a : 8d 00 d6 STA $d600 
.l22230:
263d : 2c 00 d6 BIT $d600 
2640 : 10 fb __ BPL $263d ; (main.l22230 + 0)
.s882:
2642 : a5 59 __ LDA T4 + 0 
2644 : 8d 01 d6 STA $d601 
2647 : a9 01 __ LDA #$01
2649 : 85 0f __ STA P2 
264b : 20 2c 73 JSR $732c ; (menu_placebar.s0 + 0)
264e : a9 7f __ LDA #$7f
2650 : 8d 2b bf STA $bf2b ; (vp_logo + 0)
2653 : a9 00 __ LDA #$00
2655 : 8d 2c bf STA $bf2c ; (vp_logo + 1)
2658 : 8d 2f bf STA $bf2f ; (vp_logo + 4)
265b : 8d 31 bf STA $bf31 ; (vp_logo + 6)
265e : 8d 32 bf STA $bf32 ; (vp_logo + 7)
2661 : 8d 33 bf STA $bf33 ; (vp_logo + 8)
2664 : 8d 34 bf STA $bf34 ; (vp_logo + 9)
2667 : 8d 35 bf STA $bf35 ; (vp_logo + 10)
266a : a9 4b __ LDA #$4b
266c : 8d 30 bf STA $bf30 ; (vp_logo + 5)
266f : a9 10 __ LDA #$10
2671 : 85 11 __ STA P4 
2673 : a9 30 __ LDA #$30
2675 : 85 13 __ STA P6 
2677 : a9 0c __ LDA #$0c
2679 : 85 14 __ STA P7 
267b : a9 a0 __ LDA #$a0
267d : 8d 2e bf STA $bf2e ; (vp_logo + 3)
2680 : 8d 2d bf STA $bf2d ; (vp_logo + 2)
2683 : a9 36 __ LDA #$36
2685 : 85 0f __ STA P2 
2687 : a9 bf __ LDA #$bf
2689 : 85 10 __ STA P3 
268b : ad fc 8a LDA $8afc ; (vdc_state + 6)
268e : 4a __ __ LSR
268f : ad fb 8a LDA $8afb ; (vdc_state + 5)
2692 : 6a __ __ ROR
2693 : 38 __ __ SEC
2694 : e9 06 __ SBC #$06
2696 : 85 12 __ STA P5 
2698 : 20 e7 70 JSR $70e7 ; (vdcwin_init.s0 + 0)
269b : a9 10 __ LDA #$10
269d : 8d 32 bf STA $bf32 ; (vp_logo + 7)
26a0 : a9 00 __ LDA #$00
26a2 : 8d 33 bf STA $bf33 ; (vp_logo + 8)
26a5 : 8d 35 bf STA $bf35 ; (vp_logo + 10)
26a8 : a9 af __ LDA #$af
26aa : a0 02 __ LDY #$02
26ac : 91 23 __ STA (SP + 0),y 
26ae : a9 8b __ LDA #$8b
26b0 : c8 __ __ INY
26b1 : 91 23 __ STA (SP + 0),y 
26b3 : a9 2d __ LDA #$2d
26b5 : c8 __ __ INY
26b6 : 91 23 __ STA (SP + 0),y 
26b8 : a9 65 __ LDA #$65
26ba : c8 __ __ INY
26bb : 91 23 __ STA (SP + 0),y 
26bd : ad f6 8a LDA $8af6 ; (vdc_state + 0)
26c0 : c8 __ __ INY
26c1 : 8c 34 bf STY $bf34 ; (vp_logo + 9)
26c4 : 91 23 __ STA (SP + 0),y 
26c6 : a9 00 __ LDA #$00
26c8 : c8 __ __ INY
26c9 : 91 23 __ STA (SP + 0),y 
26cb : ad f7 8a LDA $8af7 ; (vdc_state + 1)
26ce : d0 07 __ BNE $26d7 ; (main.s10441 + 0)
.s10442:
26d0 : a9 65 __ LDA #$65
26d2 : a2 62 __ LDX #$62
26d4 : 4c db 26 JMP $26db ; (main.s10443 + 0)
.s10441:
26d7 : a9 5e __ LDA #$5e
26d9 : a2 fa __ LDX #$fa
.s10443:
26db : 85 58 __ STA T3 + 1 
26dd : 8a __ __ TXA
26de : a0 08 __ LDY #$08
26e0 : 91 23 __ STA (SP + 0),y 
26e2 : a5 58 __ LDA T3 + 1 
26e4 : c8 __ __ INY
26e5 : 91 23 __ STA (SP + 0),y 
26e7 : 20 ff 64 JSR $64ff ; (sprintf.s0 + 0)
26ea : a9 00 __ LDA #$00
26ec : 85 0d __ STA P0 
26ee : a9 03 __ LDA #$03
26f0 : 85 0e __ STA P1 
26f2 : ad fd 8a LDA $8afd ; (vdc_state + 7)
26f5 : 85 55 __ STA T1 + 0 
26f7 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
26fa : a5 1b __ LDA ACCU + 0 
26fc : 85 57 __ STA T3 + 0 
26fe : a5 1c __ LDA ACCU + 1 
2700 : 85 58 __ STA T3 + 1 
2702 : 20 9a 64 JSR $649a ; (strlen@proxy + 0)
2705 : a5 1b __ LDA ACCU + 0 
2707 : 85 53 __ STA T0 + 0 
2709 : ad fe 8a LDA $8afe ; (vdc_state + 8)
270c : 18 __ __ CLC
270d : 65 57 __ ADC T3 + 0 
270f : a2 12 __ LDX #$12
2711 : 8e 00 d6 STX $d600 
2714 : aa __ __ TAX
2715 : ad ff 8a LDA $8aff ; (vdc_state + 9)
2718 : 65 58 __ ADC T3 + 1 
.l22233:
271a : 2c 00 d6 BIT $d600 
271d : 10 fb __ BPL $271a ; (main.l22233 + 0)
.s891:
271f : 8d 01 d6 STA $d601 
2722 : a9 13 __ LDA #$13
2724 : 8d 00 d6 STA $d600 
.l22235:
2727 : 2c 00 d6 BIT $d600 
272a : 10 fb __ BPL $2727 ; (main.l22235 + 0)
.s896:
272c : 8e 01 d6 STX $d601 
272f : a9 1f __ LDA #$1f
2731 : 8d 00 d6 STA $d600 
2734 : a5 1b __ LDA ACCU + 0 
2736 : f0 19 __ BEQ $2751 ; (main.s901 + 0)
.s4762:
2738 : a2 00 __ LDX #$00
.l899:
273a : 86 56 __ STX T2 + 0 
273c : bd af 8b LDA $8baf,x ; (linebuffer + 0)
273f : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22238:
2742 : 2c 00 d6 BIT $d600 
2745 : 10 fb __ BPL $2742 ; (main.l22238 + 0)
.s904:
2747 : 8d 01 d6 STA $d601 
274a : a6 56 __ LDX T2 + 0 
274c : e8 __ __ INX
274d : e4 53 __ CPX T0 + 0 
274f : 90 e9 __ BCC $273a ; (main.l899 + 0)
.s901:
2751 : a9 12 __ LDA #$12
2753 : 8d 00 d6 STA $d600 
2756 : c6 53 __ DEC T0 + 0 
2758 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
275b : 18 __ __ CLC
275c : 65 57 __ ADC T3 + 0 
275e : aa __ __ TAX
275f : ad 01 8b LDA $8b01 ; (vdc_state + 11)
2762 : 65 58 __ ADC T3 + 1 
.l22241:
2764 : 2c 00 d6 BIT $d600 
2767 : 10 fb __ BPL $2764 ; (main.l22241 + 0)
.s911:
2769 : 8d 01 d6 STA $d601 
276c : a9 13 __ LDA #$13
276e : 8d 00 d6 STA $d600 
.l22243:
2771 : 2c 00 d6 BIT $d600 
2774 : 10 fb __ BPL $2771 ; (main.l22243 + 0)
.s916:
2776 : 8e 01 d6 STX $d601 
2779 : a9 1f __ LDA #$1f
277b : 8d 00 d6 STA $d600 
.l22245:
277e : 2c 00 d6 BIT $d600 
2781 : 10 fb __ BPL $277e ; (main.l22245 + 0)
.s920:
2783 : a5 55 __ LDA T1 + 0 
2785 : 8d 01 d6 STA $d601 
2788 : a9 18 __ LDA #$18
278a : 8d 00 d6 STA $d600 
.l22247:
278d : 2c 00 d6 BIT $d600 
2790 : 10 fb __ BPL $278d ; (main.l22247 + 0)
.s926:
2792 : ad 01 d6 LDA $d601 
2795 : 29 7f __ AND #$7f
2797 : a2 18 __ LDX #$18
2799 : 8e 00 d6 STX $d600 
.l22249:
279c : 2c 00 d6 BIT $d600 
279f : 10 fb __ BPL $279c ; (main.l22249 + 0)
.s932:
27a1 : 8d 01 d6 STA $d601 
27a4 : a9 1e __ LDA #$1e
27a6 : 8d 00 d6 STA $d600 
.l22251:
27a9 : 2c 00 d6 BIT $d600 
27ac : 10 fb __ BPL $27a9 ; (main.l22251 + 0)
.s937:
27ae : a5 53 __ LDA T0 + 0 
27b0 : 8d 01 d6 STA $d601 
27b3 : a9 af __ LDA #$af
27b5 : a0 02 __ LDY #$02
27b7 : 91 23 __ STA (SP + 0),y 
27b9 : a9 8b __ LDA #$8b
27bb : c8 __ __ INY
27bc : 91 23 __ STA (SP + 0),y 
27be : a9 ef __ LDA #$ef
27c0 : c8 __ __ INY
27c1 : 91 23 __ STA (SP + 0),y 
27c3 : a9 72 __ LDA #$72
27c5 : c8 __ __ INY
27c6 : 91 23 __ STA (SP + 0),y 
27c8 : ad f8 8a LDA $8af8 ; (vdc_state + 2)
27cb : 85 1b __ STA ACCU + 0 
27cd : a9 00 __ LDA #$00
27cf : 85 1c __ STA ACCU + 1 
27d1 : a9 11 __ LDA #$11
27d3 : 20 b4 84 JSR $84b4 ; (mul16by8 + 0)
27d6 : 18 __ __ CLC
27d7 : a9 3c __ LDA #$3c
27d9 : 65 05 __ ADC WORK + 2 
27db : a0 06 __ LDY #$06
27dd : 91 23 __ STA (SP + 0),y 
27df : a9 8a __ LDA #$8a
27e1 : 65 06 __ ADC WORK + 3 
27e3 : c8 __ __ INY
27e4 : 91 23 __ STA (SP + 0),y 
27e6 : 20 ff 64 JSR $64ff ; (sprintf.s0 + 0)
27e9 : a9 00 __ LDA #$00
27eb : 85 0d __ STA P0 
27ed : a9 04 __ LDA #$04
27ef : 85 0e __ STA P1 
27f1 : ad fd 8a LDA $8afd ; (vdc_state + 7)
27f4 : 85 55 __ STA T1 + 0 
27f6 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
27f9 : a5 1b __ LDA ACCU + 0 
27fb : 85 57 __ STA T3 + 0 
27fd : a5 1c __ LDA ACCU + 1 
27ff : 85 58 __ STA T3 + 1 
2801 : 20 9a 64 JSR $649a ; (strlen@proxy + 0)
2804 : a5 1b __ LDA ACCU + 0 
2806 : 85 53 __ STA T0 + 0 
2808 : ad fe 8a LDA $8afe ; (vdc_state + 8)
280b : 18 __ __ CLC
280c : 65 57 __ ADC T3 + 0 
280e : a2 12 __ LDX #$12
2810 : 8e 00 d6 STX $d600 
2813 : aa __ __ TAX
2814 : ad ff 8a LDA $8aff ; (vdc_state + 9)
2817 : 65 58 __ ADC T3 + 1 
.l22253:
2819 : 2c 00 d6 BIT $d600 
281c : 10 fb __ BPL $2819 ; (main.l22253 + 0)
.s945:
281e : 8d 01 d6 STA $d601 
2821 : a9 13 __ LDA #$13
2823 : 8d 00 d6 STA $d600 
.l22255:
2826 : 2c 00 d6 BIT $d600 
2829 : 10 fb __ BPL $2826 ; (main.l22255 + 0)
.s950:
282b : 8e 01 d6 STX $d601 
282e : a9 1f __ LDA #$1f
2830 : 8d 00 d6 STA $d600 
2833 : a5 1b __ LDA ACCU + 0 
2835 : f0 19 __ BEQ $2850 ; (main.s955 + 0)
.s4752:
2837 : a2 00 __ LDX #$00
.l953:
2839 : 86 56 __ STX T2 + 0 
283b : bd af 8b LDA $8baf,x ; (linebuffer + 0)
283e : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22258:
2841 : 2c 00 d6 BIT $d600 
2844 : 10 fb __ BPL $2841 ; (main.l22258 + 0)
.s958:
2846 : 8d 01 d6 STA $d601 
2849 : a6 56 __ LDX T2 + 0 
284b : e8 __ __ INX
284c : e4 53 __ CPX T0 + 0 
284e : 90 e9 __ BCC $2839 ; (main.l953 + 0)
.s955:
2850 : a9 12 __ LDA #$12
2852 : 8d 00 d6 STA $d600 
2855 : c6 53 __ DEC T0 + 0 
2857 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
285a : 18 __ __ CLC
285b : 65 57 __ ADC T3 + 0 
285d : aa __ __ TAX
285e : ad 01 8b LDA $8b01 ; (vdc_state + 11)
2861 : 65 58 __ ADC T3 + 1 
.l22261:
2863 : 2c 00 d6 BIT $d600 
2866 : 10 fb __ BPL $2863 ; (main.l22261 + 0)
.s965:
2868 : 8d 01 d6 STA $d601 
286b : a9 13 __ LDA #$13
286d : 8d 00 d6 STA $d600 
.l22263:
2870 : 2c 00 d6 BIT $d600 
2873 : 10 fb __ BPL $2870 ; (main.l22263 + 0)
.s970:
2875 : 8e 01 d6 STX $d601 
2878 : a9 1f __ LDA #$1f
287a : 8d 00 d6 STA $d600 
.l22265:
287d : 2c 00 d6 BIT $d600 
2880 : 10 fb __ BPL $287d ; (main.l22265 + 0)
.s974:
2882 : a5 55 __ LDA T1 + 0 
2884 : 8d 01 d6 STA $d601 
2887 : a9 18 __ LDA #$18
2889 : 8d 00 d6 STA $d600 
.l22267:
288c : 2c 00 d6 BIT $d600 
288f : 10 fb __ BPL $288c ; (main.l22267 + 0)
.s980:
2891 : ad 01 d6 LDA $d601 
2894 : 29 7f __ AND #$7f
2896 : a2 18 __ LDX #$18
2898 : 8e 00 d6 STX $d600 
.l22269:
289b : 2c 00 d6 BIT $d600 
289e : 10 fb __ BPL $289b ; (main.l22269 + 0)
.s986:
28a0 : 8d 01 d6 STA $d601 
28a3 : a9 1e __ LDA #$1e
28a5 : 8d 00 d6 STA $d600 
.l22271:
28a8 : 2c 00 d6 BIT $d600 
28ab : 10 fb __ BPL $28a8 ; (main.l22271 + 0)
.s991:
28ad : a5 53 __ LDA T0 + 0 
28af : 8d 01 d6 STA $d601 
28b2 : a9 00 __ LDA #$00
28b4 : 85 0d __ STA P0 
28b6 : ad fb 8a LDA $8afb ; (vdc_state + 5)
28b9 : 38 __ __ SEC
28ba : e9 04 __ SBC #$04
28bc : 85 0e __ STA P1 
28be : ad fd 8a LDA $8afd ; (vdc_state + 7)
28c1 : 85 55 __ STA T1 + 0 
28c3 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
28c6 : a5 1b __ LDA ACCU + 0 
28c8 : 85 53 __ STA T0 + 0 
28ca : a5 1c __ LDA ACCU + 1 
28cc : 85 54 __ STA T0 + 1 
28ce : a9 2c __ LDA #$2c
28d0 : 85 0d __ STA P0 
28d2 : a9 75 __ LDA #$75
28d4 : 85 0e __ STA P1 
28d6 : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
28d9 : a5 1b __ LDA ACCU + 0 
28db : 85 57 __ STA T3 + 0 
28dd : a9 12 __ LDA #$12
28df : 8d 00 d6 STA $d600 
28e2 : 18 __ __ CLC
28e3 : a5 53 __ LDA T0 + 0 
28e5 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
28e8 : aa __ __ TAX
28e9 : a5 54 __ LDA T0 + 1 
28eb : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22273:
28ee : 2c 00 d6 BIT $d600 
28f1 : 10 fb __ BPL $28ee ; (main.l22273 + 0)
.s999:
28f3 : 8d 01 d6 STA $d601 
28f6 : a9 13 __ LDA #$13
28f8 : 8d 00 d6 STA $d600 
.l22275:
28fb : 2c 00 d6 BIT $d600 
28fe : 10 fb __ BPL $28fb ; (main.l22275 + 0)
.s1004:
2900 : 8e 01 d6 STX $d601 
2903 : a9 1f __ LDA #$1f
2905 : 8d 00 d6 STA $d600 
2908 : a5 1b __ LDA ACCU + 0 
290a : f0 19 __ BEQ $2925 ; (main.s1009 + 0)
.s4742:
290c : a2 00 __ LDX #$00
.l1007:
290e : 86 56 __ STX T2 + 0 
2910 : bd 2c 75 LDA $752c,x 
2913 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22278:
2916 : 2c 00 d6 BIT $d600 
2919 : 10 fb __ BPL $2916 ; (main.l22278 + 0)
.s1012:
291b : 8d 01 d6 STA $d601 
291e : a6 56 __ LDX T2 + 0 
2920 : e8 __ __ INX
2921 : e4 57 __ CPX T3 + 0 
2923 : 90 e9 __ BCC $290e ; (main.l1007 + 0)
.s1009:
2925 : a9 12 __ LDA #$12
2927 : 8d 00 d6 STA $d600 
292a : c6 57 __ DEC T3 + 0 
292c : ad 00 8b LDA $8b00 ; (vdc_state + 10)
292f : 18 __ __ CLC
2930 : 65 53 __ ADC T0 + 0 
2932 : aa __ __ TAX
2933 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
2936 : 65 54 __ ADC T0 + 1 
.l22281:
2938 : 2c 00 d6 BIT $d600 
293b : 10 fb __ BPL $2938 ; (main.l22281 + 0)
.s1019:
293d : 8d 01 d6 STA $d601 
2940 : a9 13 __ LDA #$13
2942 : 8d 00 d6 STA $d600 
.l22283:
2945 : 2c 00 d6 BIT $d600 
2948 : 10 fb __ BPL $2945 ; (main.l22283 + 0)
.s1024:
294a : 8e 01 d6 STX $d601 
294d : a9 1f __ LDA #$1f
294f : 8d 00 d6 STA $d600 
.l22285:
2952 : 2c 00 d6 BIT $d600 
2955 : 10 fb __ BPL $2952 ; (main.l22285 + 0)
.s1028:
2957 : a5 55 __ LDA T1 + 0 
2959 : 8d 01 d6 STA $d601 
295c : a9 18 __ LDA #$18
295e : 8d 00 d6 STA $d600 
.l22287:
2961 : 2c 00 d6 BIT $d600 
2964 : 10 fb __ BPL $2961 ; (main.l22287 + 0)
.s1034:
2966 : ad 01 d6 LDA $d601 
2969 : 29 7f __ AND #$7f
296b : a2 18 __ LDX #$18
296d : 8e 00 d6 STX $d600 
.l22289:
2970 : 2c 00 d6 BIT $d600 
2973 : 10 fb __ BPL $2970 ; (main.l22289 + 0)
.s1040:
2975 : 8d 01 d6 STA $d601 
2978 : a9 1e __ LDA #$1e
297a : 8d 00 d6 STA $d600 
.l22291:
297d : 2c 00 d6 BIT $d600 
2980 : 10 fb __ BPL $297d ; (main.l22291 + 0)
.s1045:
2982 : a5 57 __ LDA T3 + 0 
2984 : 8d 01 d6 STA $d601 
2987 : a9 00 __ LDA #$00
2989 : 85 0d __ STA P0 
298b : ad fb 8a LDA $8afb ; (vdc_state + 5)
298e : 38 __ __ SEC
298f : e9 03 __ SBC #$03
2991 : 85 0e __ STA P1 
2993 : ad fd 8a LDA $8afd ; (vdc_state + 7)
2996 : 85 55 __ STA T1 + 0 
2998 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
299b : a5 1b __ LDA ACCU + 0 
299d : 85 53 __ STA T0 + 0 
299f : a5 1c __ LDA ACCU + 1 
29a1 : 85 54 __ STA T0 + 1 
29a3 : a9 66 __ LDA #$66
29a5 : 85 0d __ STA P0 
29a7 : a9 75 __ LDA #$75
29a9 : 85 0e __ STA P1 
29ab : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
29ae : a5 1b __ LDA ACCU + 0 
29b0 : 85 57 __ STA T3 + 0 
29b2 : a9 12 __ LDA #$12
29b4 : 8d 00 d6 STA $d600 
29b7 : 18 __ __ CLC
29b8 : a5 53 __ LDA T0 + 0 
29ba : 6d fe 8a ADC $8afe ; (vdc_state + 8)
29bd : aa __ __ TAX
29be : a5 54 __ LDA T0 + 1 
29c0 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22293:
29c3 : 2c 00 d6 BIT $d600 
29c6 : 10 fb __ BPL $29c3 ; (main.l22293 + 0)
.s1053:
29c8 : 8d 01 d6 STA $d601 
29cb : a9 13 __ LDA #$13
29cd : 8d 00 d6 STA $d600 
.l22295:
29d0 : 2c 00 d6 BIT $d600 
29d3 : 10 fb __ BPL $29d0 ; (main.l22295 + 0)
.s1058:
29d5 : 8e 01 d6 STX $d601 
29d8 : a9 1f __ LDA #$1f
29da : 8d 00 d6 STA $d600 
29dd : a5 1b __ LDA ACCU + 0 
29df : f0 19 __ BEQ $29fa ; (main.s1063 + 0)
.s4732:
29e1 : a2 00 __ LDX #$00
.l1061:
29e3 : 86 56 __ STX T2 + 0 
29e5 : bd 66 75 LDA $7566,x 
29e8 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22298:
29eb : 2c 00 d6 BIT $d600 
29ee : 10 fb __ BPL $29eb ; (main.l22298 + 0)
.s1066:
29f0 : 8d 01 d6 STA $d601 
29f3 : a6 56 __ LDX T2 + 0 
29f5 : e8 __ __ INX
29f6 : e4 57 __ CPX T3 + 0 
29f8 : 90 e9 __ BCC $29e3 ; (main.l1061 + 0)
.s1063:
29fa : a9 12 __ LDA #$12
29fc : 8d 00 d6 STA $d600 
29ff : c6 57 __ DEC T3 + 0 
2a01 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
2a04 : 18 __ __ CLC
2a05 : 65 53 __ ADC T0 + 0 
2a07 : aa __ __ TAX
2a08 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
2a0b : 65 54 __ ADC T0 + 1 
.l22301:
2a0d : 2c 00 d6 BIT $d600 
2a10 : 10 fb __ BPL $2a0d ; (main.l22301 + 0)
.s1073:
2a12 : 8d 01 d6 STA $d601 
2a15 : a9 13 __ LDA #$13
2a17 : 8d 00 d6 STA $d600 
.l22303:
2a1a : 2c 00 d6 BIT $d600 
2a1d : 10 fb __ BPL $2a1a ; (main.l22303 + 0)
.s1078:
2a1f : 8e 01 d6 STX $d601 
2a22 : a9 1f __ LDA #$1f
2a24 : 8d 00 d6 STA $d600 
.l22305:
2a27 : 2c 00 d6 BIT $d600 
2a2a : 10 fb __ BPL $2a27 ; (main.l22305 + 0)
.s1082:
2a2c : a5 55 __ LDA T1 + 0 
2a2e : 8d 01 d6 STA $d601 
2a31 : a9 18 __ LDA #$18
2a33 : 8d 00 d6 STA $d600 
.l22307:
2a36 : 2c 00 d6 BIT $d600 
2a39 : 10 fb __ BPL $2a36 ; (main.l22307 + 0)
.s1088:
2a3b : ad 01 d6 LDA $d601 
2a3e : 29 7f __ AND #$7f
2a40 : a2 18 __ LDX #$18
2a42 : 8e 00 d6 STX $d600 
.l22309:
2a45 : 2c 00 d6 BIT $d600 
2a48 : 10 fb __ BPL $2a45 ; (main.l22309 + 0)
.s1094:
2a4a : 8d 01 d6 STA $d601 
2a4d : a9 1e __ LDA #$1e
2a4f : 8d 00 d6 STA $d600 
.l22311:
2a52 : 2c 00 d6 BIT $d600 
2a55 : 10 fb __ BPL $2a52 ; (main.l22311 + 0)
.s1099:
2a57 : a5 57 __ LDA T3 + 0 
2a59 : 8d 01 d6 STA $d601 
2a5c : a9 00 __ LDA #$00
2a5e : 85 0d __ STA P0 
2a60 : ae fb 8a LDX $8afb ; (vdc_state + 5)
2a63 : ca __ __ DEX
2a64 : ca __ __ DEX
2a65 : 86 0e __ STX P1 
2a67 : ad fd 8a LDA $8afd ; (vdc_state + 7)
2a6a : 85 55 __ STA T1 + 0 
2a6c : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
2a6f : a5 1b __ LDA ACCU + 0 
2a71 : 85 53 __ STA T0 + 0 
2a73 : a5 1c __ LDA ACCU + 1 
2a75 : 85 54 __ STA T0 + 1 
2a77 : a9 aa __ LDA #$aa
2a79 : 85 0d __ STA P0 
2a7b : a9 75 __ LDA #$75
2a7d : 85 0e __ STA P1 
2a7f : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
2a82 : a5 1b __ LDA ACCU + 0 
2a84 : 85 57 __ STA T3 + 0 
2a86 : a9 12 __ LDA #$12
2a88 : 8d 00 d6 STA $d600 
2a8b : 18 __ __ CLC
2a8c : a5 53 __ LDA T0 + 0 
2a8e : 6d fe 8a ADC $8afe ; (vdc_state + 8)
2a91 : aa __ __ TAX
2a92 : a5 54 __ LDA T0 + 1 
2a94 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22313:
2a97 : 2c 00 d6 BIT $d600 
2a9a : 10 fb __ BPL $2a97 ; (main.l22313 + 0)
.s1107:
2a9c : 8d 01 d6 STA $d601 
2a9f : a9 13 __ LDA #$13
2aa1 : 8d 00 d6 STA $d600 
.l22315:
2aa4 : 2c 00 d6 BIT $d600 
2aa7 : 10 fb __ BPL $2aa4 ; (main.l22315 + 0)
.s1112:
2aa9 : 8e 01 d6 STX $d601 
2aac : a9 1f __ LDA #$1f
2aae : 8d 00 d6 STA $d600 
2ab1 : a5 1b __ LDA ACCU + 0 
2ab3 : f0 19 __ BEQ $2ace ; (main.s1117 + 0)
.s4722:
2ab5 : a2 00 __ LDX #$00
.l1115:
2ab7 : 86 56 __ STX T2 + 0 
2ab9 : bd aa 75 LDA $75aa,x 
2abc : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22318:
2abf : 2c 00 d6 BIT $d600 
2ac2 : 10 fb __ BPL $2abf ; (main.l22318 + 0)
.s1120:
2ac4 : 8d 01 d6 STA $d601 
2ac7 : a6 56 __ LDX T2 + 0 
2ac9 : e8 __ __ INX
2aca : e4 57 __ CPX T3 + 0 
2acc : 90 e9 __ BCC $2ab7 ; (main.l1115 + 0)
.s1117:
2ace : a9 12 __ LDA #$12
2ad0 : 8d 00 d6 STA $d600 
2ad3 : c6 57 __ DEC T3 + 0 
2ad5 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
2ad8 : 18 __ __ CLC
2ad9 : 65 53 __ ADC T0 + 0 
2adb : aa __ __ TAX
2adc : ad 01 8b LDA $8b01 ; (vdc_state + 11)
2adf : 65 54 __ ADC T0 + 1 
.l22321:
2ae1 : 2c 00 d6 BIT $d600 
2ae4 : 10 fb __ BPL $2ae1 ; (main.l22321 + 0)
.s1127:
2ae6 : 8d 01 d6 STA $d601 
2ae9 : a9 13 __ LDA #$13
2aeb : 8d 00 d6 STA $d600 
.l22323:
2aee : 2c 00 d6 BIT $d600 
2af1 : 10 fb __ BPL $2aee ; (main.l22323 + 0)
.s1132:
2af3 : 8e 01 d6 STX $d601 
2af6 : a9 1f __ LDA #$1f
2af8 : 8d 00 d6 STA $d600 
.l22325:
2afb : 2c 00 d6 BIT $d600 
2afe : 10 fb __ BPL $2afb ; (main.l22325 + 0)
.s1136:
2b00 : a5 55 __ LDA T1 + 0 
2b02 : 8d 01 d6 STA $d601 
2b05 : a9 18 __ LDA #$18
2b07 : 8d 00 d6 STA $d600 
.l22327:
2b0a : 2c 00 d6 BIT $d600 
2b0d : 10 fb __ BPL $2b0a ; (main.l22327 + 0)
.s1142:
2b0f : ad 01 d6 LDA $d601 
2b12 : 29 7f __ AND #$7f
2b14 : a2 18 __ LDX #$18
2b16 : 8e 00 d6 STX $d600 
.l22329:
2b19 : 2c 00 d6 BIT $d600 
2b1c : 10 fb __ BPL $2b19 ; (main.l22329 + 0)
.s1148:
2b1e : 8d 01 d6 STA $d601 
2b21 : a9 1e __ LDA #$1e
2b23 : 8d 00 d6 STA $d600 
.l22331:
2b26 : 2c 00 d6 BIT $d600 
2b29 : 10 fb __ BPL $2b26 ; (main.l22331 + 0)
.s1153:
2b2b : a5 57 __ LDA T3 + 0 
2b2d : 8d 01 d6 STA $d601 
2b30 : a9 2b __ LDA #$2b
2b32 : 85 14 __ STA P7 
2b34 : a9 bf __ LDA #$bf
2b36 : 85 15 __ STA P8 
2b38 : 20 e1 75 JSR $75e1 ; (vdcwin_cpy_viewport.s0 + 0)
2b3b : ad a8 86 LDA $86a8 ; (menubar + 50)
2b3e : 85 0f __ STA P2 
2b40 : 20 2c 73 JSR $732c ; (menu_placebar.s0 + 0)
.l23263:
2b43 : a9 01 __ LDA #$01
2b45 : 85 55 __ STA T1 + 0 
.l1157:
2b47 : a6 55 __ LDX T1 + 0 
2b49 : bd a2 86 LDA $86a2,x ; (menubar + 44)
2b4c : 85 0d __ STA P0 
2b4e : 20 76 56 JSR $5676 ; (vdc_coords@proxy + 0)
2b51 : a5 1b __ LDA ACCU + 0 
2b53 : 85 57 __ STA T3 + 0 
2b55 : a5 1c __ LDA ACCU + 1 
2b57 : 85 58 __ STA T3 + 1 
2b59 : a6 55 __ LDX T1 + 0 
2b5b : bd 53 86 LDA $8653,x ; (__multab9L + 0)
2b5e : 18 __ __ CLC
2b5f : 69 6d __ ADC #$6d
2b61 : 85 53 __ STA T0 + 0 
2b63 : 85 0d __ STA P0 
2b65 : a9 86 __ LDA #$86
2b67 : 69 00 __ ADC #$00
2b69 : 85 54 __ STA T0 + 1 
2b6b : 85 0e __ STA P1 
2b6d : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
2b70 : a5 1b __ LDA ACCU + 0 
2b72 : 85 59 __ STA T4 + 0 
2b74 : ad fe 8a LDA $8afe ; (vdc_state + 8)
2b77 : 18 __ __ CLC
2b78 : 65 57 __ ADC T3 + 0 
2b7a : a2 12 __ LDX #$12
2b7c : 8e 00 d6 STX $d600 
2b7f : aa __ __ TAX
2b80 : ad ff 8a LDA $8aff ; (vdc_state + 9)
2b83 : 65 58 __ ADC T3 + 1 
.l22333:
2b85 : 2c 00 d6 BIT $d600 
2b88 : 10 fb __ BPL $2b85 ; (main.l22333 + 0)
.s1165:
2b8a : 8d 01 d6 STA $d601 
2b8d : a9 13 __ LDA #$13
2b8f : 8d 00 d6 STA $d600 
.l22335:
2b92 : 2c 00 d6 BIT $d600 
2b95 : 10 fb __ BPL $2b92 ; (main.l22335 + 0)
.s1170:
2b97 : 8e 01 d6 STX $d601 
2b9a : a9 1f __ LDA #$1f
2b9c : 8d 00 d6 STA $d600 
2b9f : a5 1b __ LDA ACCU + 0 
2ba1 : f0 18 __ BEQ $2bbb ; (main.s1175 + 0)
.s4711:
2ba3 : a0 00 __ LDY #$00
.l1173:
2ba5 : 84 56 __ STY T2 + 0 
2ba7 : b1 53 __ LDA (T0 + 0),y 
2ba9 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22338:
2bac : 2c 00 d6 BIT $d600 
2baf : 10 fb __ BPL $2bac ; (main.l22338 + 0)
.s1178:
2bb1 : 8d 01 d6 STA $d601 
2bb4 : a4 56 __ LDY T2 + 0 
2bb6 : c8 __ __ INY
2bb7 : c4 59 __ CPY T4 + 0 
2bb9 : 90 ea __ BCC $2ba5 ; (main.l1173 + 0)
.s1175:
2bbb : a9 12 __ LDA #$12
2bbd : 8d 00 d6 STA $d600 
2bc0 : c6 59 __ DEC T4 + 0 
2bc2 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
2bc5 : 18 __ __ CLC
2bc6 : 65 57 __ ADC T3 + 0 
2bc8 : aa __ __ TAX
2bc9 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
2bcc : 65 58 __ ADC T3 + 1 
.l22341:
2bce : 2c 00 d6 BIT $d600 
2bd1 : 10 fb __ BPL $2bce ; (main.l22341 + 0)
.s1185:
2bd3 : 8d 01 d6 STA $d601 
2bd6 : a9 13 __ LDA #$13
2bd8 : 8d 00 d6 STA $d600 
.l22343:
2bdb : 2c 00 d6 BIT $d600 
2bde : 10 fb __ BPL $2bdb ; (main.l22343 + 0)
.s1190:
2be0 : 8e 01 d6 STX $d601 
2be3 : a9 1f __ LDA #$1f
2be5 : 8d 00 d6 STA $d600 
.l22345:
2be8 : 2c 00 d6 BIT $d600 
2beb : 10 fb __ BPL $2be8 ; (main.l22345 + 0)
.s1194:
2bed : a9 cf __ LDA #$cf
2bef : 8d 01 d6 STA $d601 
2bf2 : a9 18 __ LDA #$18
2bf4 : 8d 00 d6 STA $d600 
.l22347:
2bf7 : 2c 00 d6 BIT $d600 
2bfa : 10 fb __ BPL $2bf7 ; (main.l22347 + 0)
.s1200:
2bfc : ad 01 d6 LDA $d601 
2bff : 29 7f __ AND #$7f
2c01 : a2 18 __ LDX #$18
2c03 : 8e 00 d6 STX $d600 
.l22349:
2c06 : 2c 00 d6 BIT $d600 
2c09 : 10 fb __ BPL $2c06 ; (main.l22349 + 0)
.s1206:
2c0b : 8d 01 d6 STA $d601 
2c0e : a9 1e __ LDA #$1e
2c10 : 8d 00 d6 STA $d600 
.l22351:
2c13 : 2c 00 d6 BIT $d600 
2c16 : 10 fb __ BPL $2c13 ; (main.l22351 + 0)
.s1211:
2c18 : a5 59 __ LDA T4 + 0 
2c1a : 8d 01 d6 STA $d601 
.l1212:
2c1d : 20 5e 71 JSR $715e ; (vdcwin_getch.s0 + 0)
2c20 : a5 1b __ LDA ACCU + 0 
2c22 : 85 53 __ STA T0 + 0 
2c24 : c9 0d __ CMP #$0d
2c26 : f0 10 __ BEQ $2c38 ; (main.s1213 + 0)
.s1217:
2c28 : c9 9d __ CMP #$9d
2c2a : f0 0c __ BEQ $2c38 ; (main.s1213 + 0)
.s1216:
2c2c : c9 1d __ CMP #$1d
2c2e : f0 08 __ BEQ $2c38 ; (main.s1213 + 0)
.s1215:
2c30 : c9 1b __ CMP #$1b
2c32 : f0 04 __ BEQ $2c38 ; (main.s1213 + 0)
.s1214:
2c34 : c9 03 __ CMP #$03
2c36 : d0 e5 __ BNE $2c1d ; (main.l1212 + 0)
.s1213:
2c38 : a6 55 __ LDX T1 + 0 
2c3a : bd a2 86 LDA $86a2,x ; (menubar + 44)
2c3d : 85 0d __ STA P0 
2c3f : 20 76 56 JSR $5676 ; (vdc_coords@proxy + 0)
2c42 : a5 1b __ LDA ACCU + 0 
2c44 : 85 59 __ STA T4 + 0 
2c46 : a5 1c __ LDA ACCU + 1 
2c48 : 85 5a __ STA T4 + 1 
2c4a : a6 55 __ LDX T1 + 0 
2c4c : bd 53 86 LDA $8653,x ; (__multab9L + 0)
2c4f : 18 __ __ CLC
2c50 : 69 6d __ ADC #$6d
2c52 : 85 57 __ STA T3 + 0 
2c54 : 85 0d __ STA P0 
2c56 : a9 86 __ LDA #$86
2c58 : 69 00 __ ADC #$00
2c5a : 85 58 __ STA T3 + 1 
2c5c : 85 0e __ STA P1 
2c5e : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
2c61 : a5 1b __ LDA ACCU + 0 
2c63 : 85 5b __ STA T5 + 0 
2c65 : ad fe 8a LDA $8afe ; (vdc_state + 8)
2c68 : 18 __ __ CLC
2c69 : 65 59 __ ADC T4 + 0 
2c6b : a2 12 __ LDX #$12
2c6d : 8e 00 d6 STX $d600 
2c70 : aa __ __ TAX
2c71 : ad ff 8a LDA $8aff ; (vdc_state + 9)
2c74 : 65 5a __ ADC T4 + 1 
.l22354:
2c76 : 2c 00 d6 BIT $d600 
2c79 : 10 fb __ BPL $2c76 ; (main.l22354 + 0)
.s1224:
2c7b : 8d 01 d6 STA $d601 
2c7e : a9 13 __ LDA #$13
2c80 : 8d 00 d6 STA $d600 
.l22356:
2c83 : 2c 00 d6 BIT $d600 
2c86 : 10 fb __ BPL $2c83 ; (main.l22356 + 0)
.s1229:
2c88 : 8e 01 d6 STX $d601 
2c8b : a9 1f __ LDA #$1f
2c8d : 8d 00 d6 STA $d600 
2c90 : a5 1b __ LDA ACCU + 0 
2c92 : f0 18 __ BEQ $2cac ; (main.s1234 + 0)
.s4700:
2c94 : a0 00 __ LDY #$00
.l1232:
2c96 : 84 56 __ STY T2 + 0 
2c98 : b1 57 __ LDA (T3 + 0),y 
2c9a : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22359:
2c9d : 2c 00 d6 BIT $d600 
2ca0 : 10 fb __ BPL $2c9d ; (main.l22359 + 0)
.s1237:
2ca2 : 8d 01 d6 STA $d601 
2ca5 : a4 56 __ LDY T2 + 0 
2ca7 : c8 __ __ INY
2ca8 : c4 5b __ CPY T5 + 0 
2caa : 90 ea __ BCC $2c96 ; (main.l1232 + 0)
.s1234:
2cac : a9 12 __ LDA #$12
2cae : 8d 00 d6 STA $d600 
2cb1 : c6 5b __ DEC T5 + 0 
2cb3 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
2cb6 : 18 __ __ CLC
2cb7 : 65 59 __ ADC T4 + 0 
2cb9 : aa __ __ TAX
2cba : ad 01 8b LDA $8b01 ; (vdc_state + 11)
2cbd : 65 5a __ ADC T4 + 1 
.l22362:
2cbf : 2c 00 d6 BIT $d600 
2cc2 : 10 fb __ BPL $2cbf ; (main.l22362 + 0)
.s1244:
2cc4 : 8d 01 d6 STA $d601 
2cc7 : a9 13 __ LDA #$13
2cc9 : 8d 00 d6 STA $d600 
.l22364:
2ccc : 2c 00 d6 BIT $d600 
2ccf : 10 fb __ BPL $2ccc ; (main.l22364 + 0)
.s1249:
2cd1 : 8e 01 d6 STX $d601 
2cd4 : a9 1f __ LDA #$1f
2cd6 : 8d 00 d6 STA $d600 
.l22366:
2cd9 : 2c 00 d6 BIT $d600 
2cdc : 10 fb __ BPL $2cd9 ; (main.l22366 + 0)
.s1253:
2cde : a9 c4 __ LDA #$c4
2ce0 : 8d 01 d6 STA $d601 
2ce3 : a9 18 __ LDA #$18
2ce5 : 8d 00 d6 STA $d600 
.l22368:
2ce8 : 2c 00 d6 BIT $d600 
2ceb : 10 fb __ BPL $2ce8 ; (main.l22368 + 0)
.s1259:
2ced : ad 01 d6 LDA $d601 
2cf0 : 29 7f __ AND #$7f
2cf2 : a2 18 __ LDX #$18
2cf4 : 8e 00 d6 STX $d600 
.l22370:
2cf7 : 2c 00 d6 BIT $d600 
2cfa : 10 fb __ BPL $2cf7 ; (main.l22370 + 0)
.s1265:
2cfc : 8d 01 d6 STA $d601 
2cff : a9 1e __ LDA #$1e
2d01 : 8d 00 d6 STA $d600 
.l22372:
2d04 : 2c 00 d6 BIT $d600 
2d07 : 10 fb __ BPL $2d04 ; (main.l22372 + 0)
.s1270:
2d09 : a5 5b __ LDA T5 + 0 
2d0b : 8d 01 d6 STA $d601 
2d0e : a5 53 __ LDA T0 + 0 
2d10 : c9 9d __ CMP #$9d
2d12 : d0 03 __ BNE $2d17 ; (main.s1272 + 0)
2d14 : 4c f5 53 JMP $53f5 ; (main.s1271 + 0)
.s1272:
2d17 : c9 1d __ CMP #$1d
2d19 : d0 0d __ BNE $2d28 ; (main.s1273 + 0)
.s1277:
2d1b : e6 55 __ INC T1 + 0 
2d1d : a5 55 __ LDA T1 + 0 
2d1f : c9 06 __ CMP #$06
2d21 : 90 05 __ BCC $2d28 ; (main.s1273 + 0)
.s1280:
2d23 : a9 01 __ LDA #$01
2d25 : 4c ee 53 JMP $53ee ; (main.s2330 + 0)
.s1273:
2d28 : a5 53 __ LDA T0 + 0 
2d2a : c9 0d __ CMP #$0d
2d2c : d0 03 __ BNE $2d31 ; (main.s1284 + 0)
2d2e : 4c a5 53 JMP $53a5 ; (main.s1158 + 0)
.s1284:
2d31 : c9 1b __ CMP #$1b
2d33 : f0 07 __ BEQ $2d3c ; (main.s1286 + 0)
.s1283:
2d35 : c9 03 __ CMP #$03
2d37 : f0 03 __ BEQ $2d3c ; (main.s1286 + 0)
2d39 : 4c 47 2b JMP $2b47 ; (main.l1157 + 0)
.s1286:
2d3c : a9 63 __ LDA #$63
2d3e : 85 56 __ STA T2 + 0 
.s1156:
2d40 : a5 55 __ LDA T1 + 0 
2d42 : 0a __ __ ASL
2d43 : 85 1b __ STA ACCU + 0 
2d45 : a9 00 __ LDA #$00
2d47 : 2a __ __ ROL
2d48 : 06 1b __ ASL ACCU + 0 
2d4a : 2a __ __ ROL
2d4b : 85 1c __ STA ACCU + 1 
2d4d : a5 1b __ LDA ACCU + 0 
2d4f : 65 55 __ ADC T1 + 0 
2d51 : 0a __ __ ASL
2d52 : 18 __ __ CLC
2d53 : 65 56 __ ADC T2 + 0 
2d55 : c9 15 __ CMP #$15
2d57 : d0 03 __ BNE $2d5c ; (main.s4098 + 0)
2d59 : 4c 88 50 JMP $5088 ; (main.s1798 + 0)
.s4098:
2d5c : 85 53 __ STA T0 + 0 
2d5e : c9 15 __ CMP #$15
2d60 : b0 03 __ BCS $2d65 ; (main.s4099 + 0)
2d62 : 4c 9a 48 JMP $489a ; (main.s4100 + 0)
.s4099:
2d65 : c9 1f __ CMP #$1f
2d67 : b0 03 __ BCS $2d6c ; (main.s4104 + 0)
2d69 : 4c 34 30 JMP $3034 ; (main.s1302 + 0)
.s4104:
2d6c : c9 21 __ CMP #$21
2d6e : 90 03 __ BCC $2d73 ; (main.s1909 + 0)
2d70 : 4c 45 41 JMP $4145 ; (main.s4103 + 0)
.s1909:
2d73 : 38 __ __ SEC
2d74 : e9 1f __ SBC #$1f
2d76 : 85 57 __ STA T3 + 0 
2d78 : ad fb 8a LDA $8afb ; (vdc_state + 5)
2d7b : 38 __ __ SEC
2d7c : e9 02 __ SBC #$02
2d7e : 18 __ __ CLC
2d7f : 69 02 __ ADC #$02
2d81 : 85 59 __ STA T4 + 0 
2d83 : a9 00 __ LDA #$00
2d85 : 85 0d __ STA P0 
2d87 : 2a __ __ ROL
2d88 : 85 5a __ STA T4 + 1 
2d8a : a9 02 __ LDA #$02
2d8c : 85 55 __ STA T1 + 0 
.l1912:
2d8e : ad fd 8a LDA $8afd ; (vdc_state + 7)
2d91 : 85 56 __ STA T2 + 0 
2d93 : a5 5a __ LDA T4 + 1 
2d95 : f0 05 __ BEQ $2d9c ; (main.s1618 + 0)
.s2335:
2d97 : a5 55 __ LDA T1 + 0 
2d99 : 4c 7b 40 JMP $407b ; (main.s1913 + 0)
.s1618:
2d9c : a5 55 __ LDA T1 + 0 
2d9e : c5 59 __ CMP T4 + 0 
2da0 : b0 03 __ BCS $2da5 ; (main.s1911 + 0)
2da2 : 4c 7b 40 JMP $407b ; (main.s1913 + 0)
.s1911:
2da5 : a9 03 __ LDA #$03
2da7 : 85 0e __ STA P1 
2da9 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
2dac : a5 1b __ LDA ACCU + 0 
2dae : 85 59 __ STA T4 + 0 
2db0 : a5 1c __ LDA ACCU + 1 
2db2 : 85 5a __ STA T4 + 1 
2db4 : a9 3b __ LDA #$3b
2db6 : 85 0d __ STA P0 
2db8 : a9 84 __ LDA #$84
2dba : 85 0e __ STA P1 
2dbc : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
2dbf : a5 1b __ LDA ACCU + 0 
2dc1 : 85 5b __ STA T5 + 0 
2dc3 : a9 12 __ LDA #$12
2dc5 : 8d 00 d6 STA $d600 
2dc8 : 18 __ __ CLC
2dc9 : a5 59 __ LDA T4 + 0 
2dcb : 6d fe 8a ADC $8afe ; (vdc_state + 8)
2dce : aa __ __ TAX
2dcf : a5 5a __ LDA T4 + 1 
2dd1 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22808:
2dd4 : 2c 00 d6 BIT $d600 
2dd7 : 10 fb __ BPL $2dd4 ; (main.l22808 + 0)
.s1990:
2dd9 : 8d 01 d6 STA $d601 
2ddc : a9 13 __ LDA #$13
2dde : 8d 00 d6 STA $d600 
.l22810:
2de1 : 2c 00 d6 BIT $d600 
2de4 : 10 fb __ BPL $2de1 ; (main.l22810 + 0)
.s1995:
2de6 : 8e 01 d6 STX $d601 
2de9 : a9 1f __ LDA #$1f
2deb : 8d 00 d6 STA $d600 
2dee : a5 1b __ LDA ACCU + 0 
2df0 : f0 19 __ BEQ $2e0b ; (main.s2000 + 0)
.s4689:
2df2 : a2 00 __ LDX #$00
.l1998:
2df4 : 86 55 __ STX T1 + 0 
2df6 : bd 3b 84 LDA $843b,x 
2df9 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22813:
2dfc : 2c 00 d6 BIT $d600 
2dff : 10 fb __ BPL $2dfc ; (main.l22813 + 0)
.s2003:
2e01 : 8d 01 d6 STA $d601 
2e04 : a6 55 __ LDX T1 + 0 
2e06 : e8 __ __ INX
2e07 : e4 5b __ CPX T5 + 0 
2e09 : 90 e9 __ BCC $2df4 ; (main.l1998 + 0)
.s2000:
2e0b : a9 12 __ LDA #$12
2e0d : 8d 00 d6 STA $d600 
2e10 : c6 5b __ DEC T5 + 0 
2e12 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
2e15 : 18 __ __ CLC
2e16 : 65 59 __ ADC T4 + 0 
2e18 : aa __ __ TAX
2e19 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
2e1c : 65 5a __ ADC T4 + 1 
.l22816:
2e1e : 2c 00 d6 BIT $d600 
2e21 : 10 fb __ BPL $2e1e ; (main.l22816 + 0)
.s2010:
2e23 : 8d 01 d6 STA $d601 
2e26 : a9 13 __ LDA #$13
2e28 : 8d 00 d6 STA $d600 
.l22818:
2e2b : 2c 00 d6 BIT $d600 
2e2e : 10 fb __ BPL $2e2b ; (main.l22818 + 0)
.s2015:
2e30 : 8e 01 d6 STX $d601 
2e33 : a9 1f __ LDA #$1f
2e35 : 8d 00 d6 STA $d600 
.l22820:
2e38 : 2c 00 d6 BIT $d600 
2e3b : 10 fb __ BPL $2e38 ; (main.l22820 + 0)
.s2019:
2e3d : a5 56 __ LDA T2 + 0 
2e3f : 8d 01 d6 STA $d601 
2e42 : a9 18 __ LDA #$18
2e44 : 8d 00 d6 STA $d600 
.l22822:
2e47 : 2c 00 d6 BIT $d600 
2e4a : 10 fb __ BPL $2e47 ; (main.l22822 + 0)
.s2025:
2e4c : ad 01 d6 LDA $d601 
2e4f : 29 7f __ AND #$7f
2e51 : a2 18 __ LDX #$18
2e53 : 8e 00 d6 STX $d600 
.l22824:
2e56 : 2c 00 d6 BIT $d600 
2e59 : 10 fb __ BPL $2e56 ; (main.l22824 + 0)
.s2031:
2e5b : 8d 01 d6 STA $d601 
2e5e : a9 1e __ LDA #$1e
2e60 : 8d 00 d6 STA $d600 
.l22826:
2e63 : 2c 00 d6 BIT $d600 
2e66 : 10 fb __ BPL $2e63 ; (main.l22826 + 0)
.s2036:
2e68 : a5 5b __ LDA T5 + 0 
2e6a : 8d 01 d6 STA $d601 
2e6d : a5 57 __ LDA T3 + 0 
2e6f : d0 03 __ BNE $2e74 ; (main.s2039 + 0)
2e71 : 4c a7 3f JMP $3fa7 ; (main.s2037 + 0)
.s2039:
2e74 : a9 05 __ LDA #$05
2e76 : 85 11 __ STA P4 
2e78 : 85 12 __ STA P5 
2e7a : a9 46 __ LDA #$46
2e7c : 85 13 __ STA P6 
2e7e : a9 21 __ LDA #$21
2e80 : 85 0f __ STA P2 
2e82 : a9 bf __ LDA #$bf
2e84 : 85 10 __ STA P3 
2e86 : ad fb 8a LDA $8afb ; (vdc_state + 5)
2e89 : 85 59 __ STA T4 + 0 
2e8b : 38 __ __ SEC
2e8c : e9 07 __ SBC #$07
2e8e : 85 14 __ STA P7 
2e90 : ad fc 8a LDA $8afc ; (vdc_state + 6)
2e93 : 85 5a __ STA T4 + 1 
2e95 : 20 e7 70 JSR $70e7 ; (vdcwin_init.s0 + 0)
2e98 : ad 64 86 LDA $8664 ; (winStyles + 0)
2e9b : 85 55 __ STA T1 + 0 
2e9d : ad 21 bf LDA $bf21 ; (win_vpdemo + 0)
2ea0 : 85 56 __ STA T2 + 0 
2ea2 : d0 04 __ BNE $2ea8 ; (main.s2097 + 0)
.s2095:
2ea4 : a9 b0 __ LDA #$b0
2ea6 : d0 02 __ BNE $2eaa ; (main.s2102 + 0)
.s2097:
2ea8 : a9 f0 __ LDA #$f0
.s2102:
2eaa : 85 61 __ STA T8 + 0 
2eac : ad 23 bf LDA $bf23 ; (win_vpdemo + 2)
2eaf : 85 5f __ STA T7 + 0 
2eb1 : 18 __ __ CLC
2eb2 : 65 56 __ ADC T2 + 0 
2eb4 : 85 64 __ STA T11 + 0 
2eb6 : a9 00 __ LDA #$00
2eb8 : 2a __ __ ROL
2eb9 : aa __ __ TAX
2eba : a5 64 __ LDA T11 + 0 
2ebc : 69 01 __ ADC #$01
2ebe : 85 66 __ STA T12 + 0 
2ec0 : 90 01 __ BCC $2ec3 ; (main.s2346 + 0)
.s2345:
2ec2 : e8 __ __ INX
.s2346:
2ec3 : 86 67 __ STX T12 + 1 
2ec5 : ad fa 8a LDA $8afa ; (vdc_state + 4)
2ec8 : c5 67 __ CMP T12 + 1 
2eca : d0 05 __ BNE $2ed1 ; (main.s1553 + 0)
.s1552:
2ecc : ad f9 8a LDA $8af9 ; (vdc_state + 3)
2ecf : c5 66 __ CMP T12 + 0 
.s1553:
2ed1 : b0 06 __ BCS $2ed9 ; (main.s2106 + 0)
.s2099:
2ed3 : a5 61 __ LDA T8 + 0 
2ed5 : 29 df __ AND #$df
2ed7 : 85 61 __ STA T8 + 0 
.s2106:
2ed9 : ad 22 bf LDA $bf22 ; (win_vpdemo + 1)
2edc : f0 03 __ BEQ $2ee1 ; (main.s22903 + 0)
2ede : 4c c8 3d JMP $3dc8 ; (main.s2103 + 0)
.s22903:
2ee1 : a5 61 __ LDA T8 + 0 
2ee3 : 29 10 __ AND #$10
2ee5 : f0 19 __ BEQ $2f00 ; (main.s4623 + 0)
.s2249:
2ee7 : ad 24 bf LDA $bf24 ; (win_vpdemo + 3)
2eea : 18 __ __ CLC
2eeb : 6d 22 bf ADC $bf22 ; (win_vpdemo + 1)
2eee : 85 5d __ STA T6 + 0 
2ef0 : a9 00 __ LDA #$00
2ef2 : 2a __ __ ROL
2ef3 : c5 5a __ CMP T4 + 1 
2ef5 : d0 04 __ BNE $2efb ; (main.s1503 + 0)
.s1502:
2ef7 : a5 5d __ LDA T6 + 0 
2ef9 : c5 59 __ CMP T4 + 0 
.s1503:
2efb : b0 03 __ BCS $2f00 ; (main.s4623 + 0)
2efd : 4c ee 3b JMP $3bee ; (main.s2246 + 0)
.s4623:
2f00 : a9 00 __ LDA #$00
2f02 : 85 56 __ STA T2 + 0 
2f04 : cd 24 bf CMP $bf24 ; (win_vpdemo + 3)
2f07 : b0 03 __ BCS $2f0c ; (main.s2094 + 0)
2f09 : 4c f0 39 JMP $39f0 ; (main.l2390 + 0)
.s2094:
2f0c : a9 7f __ LDA #$7f
2f0e : 8d 01 bf STA $bf01 ; (vp_vpdemo + 0)
2f11 : a9 00 __ LDA #$00
2f13 : 8d 08 bf STA $bf08 ; (vp_vpdemo + 7)
2f16 : 8d 09 bf STA $bf09 ; (vp_vpdemo + 8)
2f19 : 8d 0a bf STA $bf0a ; (vp_vpdemo + 9)
2f1c : 8d 0b bf STA $bf0b ; (vp_vpdemo + 10)
2f1f : a9 05 __ LDA #$05
2f21 : 85 11 __ STA P4 
2f23 : 85 12 __ STA P5 
2f25 : a9 46 __ LDA #$46
2f27 : 85 13 __ STA P6 
2f29 : a5 57 __ LDA T3 + 0 
2f2b : 0a __ __ ASL
2f2c : 0a __ __ ASL
2f2d : aa __ __ TAX
2f2e : bd e6 8a LDA $8ae6,x ; (screenset + 0)
2f31 : 8d 02 bf STA $bf02 ; (vp_vpdemo + 1)
2f34 : bd e7 8a LDA $8ae7,x ; (screenset + 1)
2f37 : 8d 03 bf STA $bf03 ; (vp_vpdemo + 2)
2f3a : bd e8 8a LDA $8ae8,x ; (screenset + 2)
2f3d : 8d 04 bf STA $bf04 ; (vp_vpdemo + 3)
2f40 : bd e9 8a LDA $8ae9,x ; (screenset + 3)
2f43 : 8d 06 bf STA $bf06 ; (vp_vpdemo + 5)
2f46 : a9 00 __ LDA #$00
2f48 : 8d 05 bf STA $bf05 ; (vp_vpdemo + 4)
2f4b : 8d 07 bf STA $bf07 ; (vp_vpdemo + 6)
2f4e : a9 0c __ LDA #$0c
2f50 : 85 0f __ STA P2 
2f52 : a9 bf __ LDA #$bf
2f54 : 85 10 __ STA P3 
2f56 : ad fb 8a LDA $8afb ; (vdc_state + 5)
2f59 : 38 __ __ SEC
2f5a : e9 07 __ SBC #$07
2f5c : 85 14 __ STA P7 
2f5e : 20 e7 70 JSR $70e7 ; (vdcwin_init.s0 + 0)
2f61 : a9 01 __ LDA #$01
2f63 : 85 14 __ STA P7 
2f65 : a9 bf __ LDA #$bf
2f67 : 85 15 __ STA P8 
2f69 : 20 e1 75 JSR $75e1 ; (vdcwin_cpy_viewport.s0 + 0)
.l2533:
2f6c : 20 eb 5d JSR $5deb ; (getch.s0 + 0)
2f6f : 85 55 __ STA T1 + 0 
2f71 : a9 00 __ LDA #$00
2f73 : 85 56 __ STA T2 + 0 
2f75 : a5 55 __ LDA T1 + 0 
2f77 : c9 57 __ CMP #$57
2f79 : f0 04 __ BEQ $2f7f ; (main.s2538 + 0)
.s2539:
2f7b : c9 91 __ CMP #$91
2f7d : d0 11 __ BNE $2f90 ; (main.s2537 + 0)
.s2538:
2f7f : ad 0a bf LDA $bf0a ; (vp_vpdemo + 9)
2f82 : 0d 0b bf ORA $bf0b ; (vp_vpdemo + 10)
2f85 : f0 09 __ BEQ $2f90 ; (main.s2537 + 0)
.s2535:
2f87 : a9 08 __ LDA #$08
2f89 : 85 56 __ STA T2 + 0 
2f8b : a5 55 __ LDA T1 + 0 
2f8d : 4c 96 2f JMP $2f96 ; (main.s2544 + 0)
.s2537:
2f90 : a5 55 __ LDA T1 + 0 
2f92 : c9 53 __ CMP #$53
2f94 : f0 04 __ BEQ $2f9a ; (main.s2543 + 0)
.s2544:
2f96 : c9 11 __ CMP #$11
2f98 : d0 3a __ BNE $2fd4 ; (main.s2542 + 0)
.s2543:
2f9a : ad fb 8a LDA $8afb ; (vdc_state + 5)
2f9d : 85 03 __ STA WORK + 0 
2f9f : ad fc 8a LDA $8afc ; (vdc_state + 6)
2fa2 : 85 04 __ STA WORK + 1 
2fa4 : a5 57 __ LDA T3 + 0 
2fa6 : 0a __ __ ASL
2fa7 : 0a __ __ ASL
2fa8 : aa __ __ TAX
2fa9 : bd e9 8a LDA $8ae9,x ; (screenset + 3)
2fac : 38 __ __ SEC
2fad : e5 03 __ SBC WORK + 0 
2faf : aa __ __ TAX
2fb0 : a9 00 __ LDA #$00
2fb2 : e5 04 __ SBC WORK + 1 
2fb4 : a8 __ __ TAY
2fb5 : 8a __ __ TXA
2fb6 : 18 __ __ CLC
2fb7 : 69 06 __ ADC #$06
2fb9 : 85 59 __ STA T4 + 0 
2fbb : 90 01 __ BCC $2fbe ; (main.s2348 + 0)
.s2347:
2fbd : c8 __ __ INY
.s2348:
2fbe : 84 5a __ STY T4 + 1 
2fc0 : ad 0b bf LDA $bf0b ; (vp_vpdemo + 10)
2fc3 : c5 5a __ CMP T4 + 1 
2fc5 : d0 05 __ BNE $2fcc ; (main.s1395 + 0)
.s1394:
2fc7 : ad 0a bf LDA $bf0a ; (vp_vpdemo + 9)
2fca : c5 59 __ CMP T4 + 0 
.s1395:
2fcc : b0 06 __ BCS $2fd4 ; (main.s2542 + 0)
.s2540:
2fce : a5 56 __ LDA T2 + 0 
2fd0 : 09 04 __ ORA #$04
2fd2 : 85 56 __ STA T2 + 0 
.s2542:
2fd4 : a5 55 __ LDA T1 + 0 
2fd6 : c9 41 __ CMP #$41
2fd8 : f0 04 __ BEQ $2fde ; (main.s2548 + 0)
.s2549:
2fda : c9 9d __ CMP #$9d
2fdc : d0 0e __ BNE $2fec ; (main.s2547 + 0)
.s2548:
2fde : ad 08 bf LDA $bf08 ; (vp_vpdemo + 7)
2fe1 : 0d 09 bf ORA $bf09 ; (vp_vpdemo + 8)
2fe4 : f0 06 __ BEQ $2fec ; (main.s2547 + 0)
.s2545:
2fe6 : a5 56 __ LDA T2 + 0 
2fe8 : 09 01 __ ORA #$01
2fea : 85 56 __ STA T2 + 0 
.s2547:
2fec : a5 55 __ LDA T1 + 0 
2fee : c9 44 __ CMP #$44
2ff0 : f0 04 __ BEQ $2ff6 ; (main.s2553 + 0)
.s2554:
2ff2 : c9 1d __ CMP #$1d
2ff4 : d0 2a __ BNE $3020 ; (main.s2552 + 0)
.s2553:
2ff6 : a5 57 __ LDA T3 + 0 
2ff8 : 0a __ __ ASL
2ff9 : 0a __ __ ASL
2ffa : aa __ __ TAX
2ffb : bd e8 8a LDA $8ae8,x ; (screenset + 2)
2ffe : 38 __ __ SEC
2fff : e9 47 __ SBC #$47
3001 : 85 59 __ STA T4 + 0 
3003 : a9 00 __ LDA #$00
3005 : e9 00 __ SBC #$00
3007 : 85 5a __ STA T4 + 1 
3009 : ad 09 bf LDA $bf09 ; (vp_vpdemo + 8)
300c : c5 5a __ CMP T4 + 1 
300e : d0 05 __ BNE $3015 ; (main.s1385 + 0)
.s1384:
3010 : ad 08 bf LDA $bf08 ; (vp_vpdemo + 7)
3013 : c5 59 __ CMP T4 + 0 
.s1385:
3015 : b0 09 __ BCS $3020 ; (main.s2552 + 0)
.s2550:
3017 : a5 56 __ LDA T2 + 0 
3019 : 09 02 __ ORA #$02
301b : 85 56 __ STA T2 + 0 
301d : 4c 53 31 JMP $3153 ; (main.s2555 + 0)
.s2552:
3020 : a5 56 __ LDA T2 + 0 
3022 : f0 03 __ BEQ $3027 ; (main.s2557 + 0)
3024 : 4c 53 31 JMP $3153 ; (main.s2555 + 0)
.s2557:
3027 : a5 55 __ LDA T1 + 0 
3029 : c9 1b __ CMP #$1b
302b : f0 07 __ BEQ $3034 ; (main.s1302 + 0)
.s3647:
302d : c9 03 __ CMP #$03
302f : f0 03 __ BEQ $3034 ; (main.s1302 + 0)
3031 : 4c 6c 2f JMP $2f6c ; (main.l2533 + 0)
.s1302:
3034 : a5 53 __ LDA T0 + 0 
3036 : c9 0d __ CMP #$0d
3038 : f0 03 __ BEQ $303d ; (main.s687 + 0)
303a : 4c a1 24 JMP $24a1 ; (main.l686 + 0)
.s687:
303d : 20 0f 15 JSR $150f ; (sid_stopmusic.s0 + 0)
3040 : a9 00 __ LDA #$00
3042 : 20 b3 5f JSR $5fb3 ; (fastmode.s0 + 0)
3045 : a9 00 __ LDA #$00
3047 : 85 55 __ STA T1 + 0 
3049 : 85 13 __ STA P6 
304b : 20 d2 5f JSR $5fd2 ; (vdc_set_mode.s0 + 0)
304e : ad f9 8a LDA $8af9 ; (vdc_state + 3)
3051 : 85 53 __ STA T0 + 0 
3053 : ad fb 8a LDA $8afb ; (vdc_state + 5)
3056 : 85 57 __ STA T3 + 0 
.l4110:
3058 : a5 55 __ LDA T1 + 0 
305a : c5 57 __ CMP T3 + 0 
305c : 90 21 __ BCC $307f ; (main.s4111 + 0)
.s4108:
305e : a9 04 __ LDA #$04
3060 : 8d 06 d5 STA $d506 
3063 : a9 00 __ LDA #$00
3065 : 85 1b __ STA ACCU + 0 
3067 : 85 1c __ STA ACCU + 1 
.s1001:
3069 : 18 __ __ CLC
306a : a5 23 __ LDA SP + 0 
306c : 69 0a __ ADC #$0a
306e : 85 23 __ STA SP + 0 
3070 : 90 02 __ BCC $3074 ; (main.s1001 + 11)
3072 : e6 24 __ INC SP + 1 
3074 : a2 19 __ LDX #$19
3076 : bd b9 be LDA $beb9,x ; (main@stack + 0)
3079 : 95 53 __ STA T0 + 0,x 
307b : ca __ __ DEX
307c : 10 f8 __ BPL $3076 ; (main.s1001 + 13)
307e : 60 __ __ RTS
.s4111:
307f : a9 00 __ LDA #$00
3081 : 85 0d __ STA P0 
3083 : a5 55 __ LDA T1 + 0 
3085 : 85 0e __ STA P1 
3087 : ad fd 8a LDA $8afd ; (vdc_state + 7)
308a : 85 56 __ STA T2 + 0 
308c : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
308f : a9 12 __ LDA #$12
3091 : 8d 00 d6 STA $d600 
3094 : 18 __ __ CLC
3095 : a5 1b __ LDA ACCU + 0 
3097 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
309a : a8 __ __ TAY
309b : a5 1c __ LDA ACCU + 1 
309d : 6d ff 8a ADC $8aff ; (vdc_state + 9)
30a0 : a6 53 __ LDX T0 + 0 
30a2 : ca __ __ DEX
.l22434:
30a3 : 2c 00 d6 BIT $d600 
30a6 : 10 fb __ BPL $30a3 ; (main.l22434 + 0)
.s4121:
30a8 : 8d 01 d6 STA $d601 
30ab : a9 13 __ LDA #$13
30ad : 8d 00 d6 STA $d600 
.l22436:
30b0 : 2c 00 d6 BIT $d600 
30b3 : 10 fb __ BPL $30b0 ; (main.l22436 + 0)
.s4126:
30b5 : 8c 01 d6 STY $d601 
30b8 : a9 1f __ LDA #$1f
30ba : 8d 00 d6 STA $d600 
.l22438:
30bd : 2c 00 d6 BIT $d600 
30c0 : 10 fb __ BPL $30bd ; (main.l22438 + 0)
.s4130:
30c2 : a9 20 __ LDA #$20
30c4 : 8d 01 d6 STA $d601 
30c7 : a9 18 __ LDA #$18
30c9 : 8d 00 d6 STA $d600 
.l22440:
30cc : 2c 00 d6 BIT $d600 
30cf : 10 fb __ BPL $30cc ; (main.l22440 + 0)
.s4136:
30d1 : ad 01 d6 LDA $d601 
30d4 : 29 7f __ AND #$7f
30d6 : a0 18 __ LDY #$18
30d8 : 8c 00 d6 STY $d600 
.l22442:
30db : 2c 00 d6 BIT $d600 
30de : 10 fb __ BPL $30db ; (main.l22442 + 0)
.s4142:
30e0 : 8d 01 d6 STA $d601 
30e3 : a9 1e __ LDA #$1e
30e5 : 8d 00 d6 STA $d600 
.l22444:
30e8 : 2c 00 d6 BIT $d600 
30eb : 10 fb __ BPL $30e8 ; (main.l22444 + 0)
.s4147:
30ed : 8e 01 d6 STX $d601 
30f0 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
30f3 : 18 __ __ CLC
30f4 : 65 1b __ ADC ACCU + 0 
30f6 : a0 12 __ LDY #$12
30f8 : 8c 00 d6 STY $d600 
30fb : a8 __ __ TAY
30fc : ad 01 8b LDA $8b01 ; (vdc_state + 11)
30ff : 65 1c __ ADC ACCU + 1 
.l22446:
3101 : 2c 00 d6 BIT $d600 
3104 : 10 fb __ BPL $3101 ; (main.l22446 + 0)
.s4154:
3106 : 8d 01 d6 STA $d601 
3109 : a9 13 __ LDA #$13
310b : 8d 00 d6 STA $d600 
.l22448:
310e : 2c 00 d6 BIT $d600 
3111 : 10 fb __ BPL $310e ; (main.l22448 + 0)
.s4159:
3113 : 8c 01 d6 STY $d601 
3116 : a9 1f __ LDA #$1f
3118 : 8d 00 d6 STA $d600 
.l22450:
311b : 2c 00 d6 BIT $d600 
311e : 10 fb __ BPL $311b ; (main.l22450 + 0)
.s4163:
3120 : a5 56 __ LDA T2 + 0 
3122 : 8d 01 d6 STA $d601 
3125 : a9 18 __ LDA #$18
3127 : 8d 00 d6 STA $d600 
.l22452:
312a : 2c 00 d6 BIT $d600 
312d : 10 fb __ BPL $312a ; (main.l22452 + 0)
.s4169:
312f : ad 01 d6 LDA $d601 
3132 : 29 7f __ AND #$7f
3134 : a0 18 __ LDY #$18
3136 : 8c 00 d6 STY $d600 
.l22454:
3139 : 2c 00 d6 BIT $d600 
313c : 10 fb __ BPL $3139 ; (main.l22454 + 0)
.s4175:
313e : 8d 01 d6 STA $d601 
3141 : a9 1e __ LDA #$1e
3143 : 8d 00 d6 STA $d600 
.l22456:
3146 : 2c 00 d6 BIT $d600 
3149 : 10 fb __ BPL $3146 ; (main.l22456 + 0)
.s4180:
314b : 8e 01 d6 STX $d601 
314e : e6 55 __ INC T1 + 0 
3150 : 4c 58 30 JMP $3058 ; (main.l4110 + 0)
.s2555:
3153 : a2 15 __ LDX #$15
.l1202:
3155 : bd 00 bf LDA $bf00,x ; (vp_fill + 31)
3158 : 9d e0 be STA $bee0,x ; (softscroll + 13)
315b : ca __ __ DEX
315c : d0 f7 __ BNE $3155 ; (main.l1202 + 0)
.s1203:
315e : a5 56 __ LDA T2 + 0 
3160 : 4a __ __ LSR
3161 : 90 4e __ BCC $31b1 ; (main.s23074 + 0)
.s2559:
3163 : 86 61 __ STX T8 + 0 
3165 : ae 0e bf LDX $bf0e ; (vp_vpdemo + 13)
3168 : ca __ __ DEX
3169 : 86 59 __ STX T4 + 0 
316b : ad 12 bf LDA $bf12 ; (vp_vpdemo + 17)
316e : 85 5b __ STA T5 + 0 
3170 : ad 13 bf LDA $bf13 ; (vp_vpdemo + 18)
3173 : 85 5c __ STA T5 + 1 
3175 : ad 14 bf LDA $bf14 ; (vp_vpdemo + 19)
3178 : 85 5d __ STA T6 + 0 
317a : ad 15 bf LDA $bf15 ; (vp_vpdemo + 20)
.l2563:
317d : 85 5e __ STA T6 + 1 
317f : a5 61 __ LDA T8 + 0 
3181 : cd 0f bf CMP $bf0f ; (vp_vpdemo + 14)
3184 : b0 03 __ BCS $3189 ; (main.s2562 + 0)
3186 : 4c a7 37 JMP $37a7 ; (main.s2564 + 0)
.s2562:
3189 : a9 01 __ LDA #$01
318b : 85 13 __ STA P6 
318d : ad 0f bf LDA $bf0f ; (vp_vpdemo + 14)
3190 : 85 14 __ STA P7 
3192 : ad e8 be LDA $bee8 ; (vp_fill + 7)
3195 : 18 __ __ CLC
3196 : 69 ff __ ADC #$ff
3198 : 8d e8 be STA $bee8 ; (vp_fill + 7)
319b : b0 03 __ BCS $31a0 ; (main.s2350 + 0)
.s2349:
319d : ce e9 be DEC $bee9 ; (vp_fill + 8)
.s2350:
31a0 : ad 08 bf LDA $bf08 ; (vp_vpdemo + 7)
31a3 : 18 __ __ CLC
31a4 : 69 ff __ ADC #$ff
31a6 : 8d 08 bf STA $bf08 ; (vp_vpdemo + 7)
31a9 : b0 03 __ BCS $31ae ; (main.s2352 + 0)
.s2351:
31ab : ce 09 bf DEC $bf09 ; (vp_vpdemo + 8)
.s2352:
31ae : 20 d5 70 JSR $70d5 ; (vdcwin_init@proxy + 0)
.s23074:
31b1 : a5 56 __ LDA T2 + 0 
31b3 : 29 02 __ AND #$02
31b5 : f0 64 __ BEQ $321b ; (main.s23134 + 0)
.s2920:
31b7 : ae 0e bf LDX $bf0e ; (vp_vpdemo + 13)
31ba : ca __ __ DEX
31bb : 86 59 __ STX T4 + 0 
31bd : a9 00 __ LDA #$00
31bf : 85 61 __ STA T8 + 0 
31c1 : ad 12 bf LDA $bf12 ; (vp_vpdemo + 17)
31c4 : 85 5b __ STA T5 + 0 
31c6 : ad 13 bf LDA $bf13 ; (vp_vpdemo + 18)
31c9 : 85 5c __ STA T5 + 1 
31cb : ad 14 bf LDA $bf14 ; (vp_vpdemo + 19)
31ce : 85 5d __ STA T6 + 0 
31d0 : ad 15 bf LDA $bf15 ; (vp_vpdemo + 20)
.l2924:
31d3 : 85 5e __ STA T6 + 1 
31d5 : a5 61 __ LDA T8 + 0 
31d7 : cd 0f bf CMP $bf0f ; (vp_vpdemo + 14)
31da : b0 03 __ BCS $31df ; (main.s2923 + 0)
31dc : 4c 68 35 JMP $3568 ; (main.s2925 + 0)
.s2923:
31df : a9 01 __ LDA #$01
31e1 : 85 13 __ STA P6 
31e3 : ad 0f bf LDA $bf0f ; (vp_vpdemo + 14)
31e6 : 85 14 __ STA P7 
31e8 : ad e8 be LDA $bee8 ; (vp_fill + 7)
31eb : 18 __ __ CLC
31ec : 6d 0e bf ADC $bf0e ; (vp_vpdemo + 13)
31ef : 8d e8 be STA $bee8 ; (vp_fill + 7)
31f2 : 90 03 __ BCC $31f7 ; (main.s2354 + 0)
.s2353:
31f4 : ee e9 be INC $bee9 ; (vp_fill + 8)
.s2354:
31f7 : ee 08 bf INC $bf08 ; (vp_vpdemo + 7)
31fa : d0 03 __ BNE $31ff ; (main.s2356 + 0)
.s2355:
31fc : ee 09 bf INC $bf09 ; (vp_vpdemo + 8)
.s2356:
31ff : a9 ec __ LDA #$ec
3201 : 85 0f __ STA P2 
3203 : a9 be __ LDA #$be
3205 : 85 10 __ STA P3 
3207 : ad 0c bf LDA $bf0c ; (vp_vpdemo + 11)
320a : 18 __ __ CLC
320b : 6d 0e bf ADC $bf0e ; (vp_vpdemo + 13)
320e : 38 __ __ SEC
320f : e9 01 __ SBC #$01
3211 : 85 11 __ STA P4 
3213 : ad 0d bf LDA $bf0d ; (vp_vpdemo + 12)
3216 : 85 12 __ STA P5 
3218 : 20 e7 70 JSR $70e7 ; (vdcwin_init.s0 + 0)
.s23134:
321b : a5 56 __ LDA T2 + 0 
321d : 29 08 __ AND #$08
321f : f0 03 __ BEQ $3224 ; (main.s23164 + 0)
3221 : 4c cc 33 JMP $33cc ; (main.s3281 + 0)
.s23164:
3224 : a5 56 __ LDA T2 + 0 
3226 : 29 04 __ AND #$04
3228 : d0 0e __ BNE $3238 ; (main.s3464 + 0)
.s23265:
322a : a9 e1 __ LDA #$e1
322c : 85 14 __ STA P7 
322e : a9 be __ LDA #$be
3230 : 85 15 __ STA P8 
3232 : 20 e1 75 JSR $75e1 ; (vdcwin_cpy_viewport.s0 + 0)
3235 : 4c 27 30 JMP $3027 ; (main.s2557 + 0)
.s3464:
3238 : ad 0f bf LDA $bf0f ; (vp_vpdemo + 14)
323b : 85 59 __ STA T4 + 0 
323d : 38 __ __ SEC
323e : e9 01 __ SBC #$01
3240 : 85 5b __ STA T5 + 0 
3242 : a9 00 __ LDA #$00
3244 : e9 00 __ SBC #$00
3246 : 85 5c __ STA T5 + 1 
3248 : ad f9 8a LDA $8af9 ; (vdc_state + 3)
324b : 85 5d __ STA T6 + 0 
324d : ad fa 8a LDA $8afa ; (vdc_state + 4)
3250 : 85 5e __ STA T6 + 1 
3252 : ad 0e bf LDA $bf0e ; (vp_vpdemo + 13)
3255 : 85 61 __ STA T8 + 0 
3257 : ad 12 bf LDA $bf12 ; (vp_vpdemo + 17)
325a : 85 5f __ STA T7 + 0 
325c : ad 13 bf LDA $bf13 ; (vp_vpdemo + 18)
325f : 85 60 __ STA T7 + 1 
3261 : ad 14 bf LDA $bf14 ; (vp_vpdemo + 19)
3264 : 85 64 __ STA T11 + 0 
3266 : ad 15 bf LDA $bf15 ; (vp_vpdemo + 20)
3269 : a2 00 __ LDX #$00
.l3468:
326b : 85 65 __ STA T11 + 1 
326d : a5 5c __ LDA T5 + 1 
326f : d0 41 __ BNE $32b2 ; (main.s3469 + 0)
.s1232:
3271 : e4 5b __ CPX T5 + 0 
3273 : 90 3d __ BCC $32b2 ; (main.s3469 + 0)
.s3467:
3275 : a9 01 __ LDA #$01
3277 : 85 14 __ STA P7 
3279 : ad ea be LDA $beea ; (vp_fill + 9)
327c : 18 __ __ CLC
327d : 65 59 __ ADC T4 + 0 
327f : 8d ea be STA $beea ; (vp_fill + 9)
3282 : 90 03 __ BCC $3287 ; (main.s2362 + 0)
.s2361:
3284 : ee eb be INC $beeb ; (vp_fill + 10)
.s2362:
3287 : ee 0a bf INC $bf0a ; (vp_vpdemo + 9)
328a : d0 03 __ BNE $328f ; (main.s2364 + 0)
.s2363:
328c : ee 0b bf INC $bf0b ; (vp_vpdemo + 10)
.s2364:
328f : a9 ec __ LDA #$ec
3291 : 85 0f __ STA P2 
3293 : a9 be __ LDA #$be
3295 : 85 10 __ STA P3 
3297 : ad 0c bf LDA $bf0c ; (vp_vpdemo + 11)
329a : 85 11 __ STA P4 
329c : ad 0d bf LDA $bf0d ; (vp_vpdemo + 12)
329f : 18 __ __ CLC
32a0 : 65 59 __ ADC T4 + 0 
32a2 : 38 __ __ SEC
32a3 : e9 01 __ SBC #$01
32a5 : 85 12 __ STA P5 
32a7 : ad 0e bf LDA $bf0e ; (vp_vpdemo + 13)
32aa : 85 13 __ STA P6 
32ac : 20 e7 70 JSR $70e7 ; (vdcwin_init.s0 + 0)
32af : 4c 2a 32 JMP $322a ; (main.s23265 + 0)
.s3469:
32b2 : a9 12 __ LDA #$12
32b4 : 8d 00 d6 STA $d600 
32b7 : 18 __ __ CLC
32b8 : a5 64 __ LDA T11 + 0 
32ba : 65 5d __ ADC T6 + 0 
32bc : 85 66 __ STA T12 + 0 
32be : a5 65 __ LDA T11 + 1 
32c0 : 65 5e __ ADC T6 + 1 
32c2 : 85 67 __ STA T12 + 1 
32c4 : 18 __ __ CLC
32c5 : a5 5f __ LDA T7 + 0 
32c7 : 65 5d __ ADC T6 + 0 
32c9 : 85 6b __ STA T15 + 0 
32cb : a5 60 __ LDA T7 + 1 
32cd : 65 5e __ ADC T6 + 1 
32cf : 85 6c __ STA T15 + 1 
.l23166:
32d1 : 2c 00 d6 BIT $d600 
32d4 : 10 fb __ BPL $32d1 ; (main.l23166 + 0)
.s3525:
32d6 : a5 60 __ LDA T7 + 1 
32d8 : 8d 01 d6 STA $d601 
32db : a9 13 __ LDA #$13
32dd : 8d 00 d6 STA $d600 
.l23168:
32e0 : 2c 00 d6 BIT $d600 
32e3 : 10 fb __ BPL $32e0 ; (main.l23168 + 0)
.s3530:
32e5 : a5 5f __ LDA T7 + 0 
32e7 : 8d 01 d6 STA $d601 
32ea : a9 1f __ LDA #$1f
32ec : 8d 00 d6 STA $d600 
32ef : a9 18 __ LDA #$18
32f1 : 8d 00 d6 STA $d600 
.l23170:
32f4 : 2c 00 d6 BIT $d600 
32f7 : 10 fb __ BPL $32f4 ; (main.l23170 + 0)
.s3537:
32f9 : ac 01 d6 LDY $d601 
32fc : 8d 00 d6 STA $d600 
32ff : 98 __ __ TYA
3300 : 09 80 __ ORA #$80
.l23172:
3302 : 2c 00 d6 BIT $d600 
3305 : 10 fb __ BPL $3302 ; (main.l23172 + 0)
.s3543:
3307 : 8d 01 d6 STA $d601 
330a : a9 20 __ LDA #$20
330c : 8d 00 d6 STA $d600 
.l23174:
330f : 2c 00 d6 BIT $d600 
3312 : 10 fb __ BPL $330f ; (main.l23174 + 0)
.s3548:
3314 : a5 6c __ LDA T15 + 1 
3316 : 8d 01 d6 STA $d601 
3319 : a9 21 __ LDA #$21
331b : 8d 00 d6 STA $d600 
.l23176:
331e : 2c 00 d6 BIT $d600 
3321 : 10 fb __ BPL $331e ; (main.l23176 + 0)
.s3553:
3323 : a5 6b __ LDA T15 + 0 
3325 : 8d 01 d6 STA $d601 
3328 : a9 1f __ LDA #$1f
332a : 8d 00 d6 STA $d600 
332d : a9 1e __ LDA #$1e
332f : 8d 00 d6 STA $d600 
.l23178:
3332 : 2c 00 d6 BIT $d600 
3335 : 10 fb __ BPL $3332 ; (main.l23178 + 0)
.s3559:
3337 : a5 61 __ LDA T8 + 0 
3339 : 8d 01 d6 STA $d601 
333c : a9 12 __ LDA #$12
333e : 8d 00 d6 STA $d600 
.l23180:
3341 : 2c 00 d6 BIT $d600 
3344 : 10 fb __ BPL $3341 ; (main.l23180 + 0)
.s3612:
3346 : a5 65 __ LDA T11 + 1 
3348 : 8d 01 d6 STA $d601 
334b : a9 13 __ LDA #$13
334d : 8d 00 d6 STA $d600 
.l23182:
3350 : 2c 00 d6 BIT $d600 
3353 : 10 fb __ BPL $3350 ; (main.l23182 + 0)
.s3617:
3355 : a5 64 __ LDA T11 + 0 
3357 : 8d 01 d6 STA $d601 
335a : a9 1f __ LDA #$1f
335c : 8d 00 d6 STA $d600 
335f : a9 18 __ LDA #$18
3361 : 8d 00 d6 STA $d600 
.l23184:
3364 : 2c 00 d6 BIT $d600 
3367 : 10 fb __ BPL $3364 ; (main.l23184 + 0)
.s3624:
3369 : ac 01 d6 LDY $d601 
336c : 8d 00 d6 STA $d600 
336f : 98 __ __ TYA
3370 : 09 80 __ ORA #$80
.l23186:
3372 : 2c 00 d6 BIT $d600 
3375 : 10 fb __ BPL $3372 ; (main.l23186 + 0)
.s3630:
3377 : 8d 01 d6 STA $d601 
337a : a9 20 __ LDA #$20
337c : 8d 00 d6 STA $d600 
.l23188:
337f : 2c 00 d6 BIT $d600 
3382 : 10 fb __ BPL $337f ; (main.l23188 + 0)
.s3635:
3384 : a5 67 __ LDA T12 + 1 
3386 : 8d 01 d6 STA $d601 
3389 : a9 21 __ LDA #$21
338b : 8d 00 d6 STA $d600 
.l23190:
338e : 2c 00 d6 BIT $d600 
3391 : 10 fb __ BPL $338e ; (main.l23190 + 0)
.s3640:
3393 : a5 66 __ LDA T12 + 0 
3395 : 8d 01 d6 STA $d601 
3398 : a9 1f __ LDA #$1f
339a : 8d 00 d6 STA $d600 
339d : a9 1e __ LDA #$1e
339f : 8d 00 d6 STA $d600 
.l23192:
33a2 : 2c 00 d6 BIT $d600 
33a5 : 10 fb __ BPL $33a2 ; (main.l23192 + 0)
.s3646:
33a7 : a5 61 __ LDA T8 + 0 
33a9 : 8d 01 d6 STA $d601 
33ac : ad f9 8a LDA $8af9 ; (vdc_state + 3)
33af : 18 __ __ CLC
33b0 : 65 5f __ ADC T7 + 0 
33b2 : 85 5f __ STA T7 + 0 
33b4 : ad fa 8a LDA $8afa ; (vdc_state + 4)
33b7 : 65 60 __ ADC T7 + 1 
33b9 : 85 60 __ STA T7 + 1 
33bb : 18 __ __ CLC
33bc : a5 64 __ LDA T11 + 0 
33be : 6d f9 8a ADC $8af9 ; (vdc_state + 3)
33c1 : 85 64 __ STA T11 + 0 
33c3 : a5 65 __ LDA T11 + 1 
33c5 : 6d fa 8a ADC $8afa ; (vdc_state + 4)
33c8 : e8 __ __ INX
33c9 : 4c 6b 32 JMP $326b ; (main.l3468 + 0)
.s3281:
33cc : ad f9 8a LDA $8af9 ; (vdc_state + 3)
33cf : 85 5b __ STA T5 + 0 
33d1 : 85 1b __ STA ACCU + 0 
33d3 : ad fa 8a LDA $8afa ; (vdc_state + 4)
33d6 : 85 5c __ STA T5 + 1 
33d8 : 85 1c __ STA ACCU + 1 
33da : ad 0f bf LDA $bf0f ; (vp_vpdemo + 14)
33dd : 20 b4 84 JSR $84b4 ; (mul16by8 + 0)
33e0 : ad 12 bf LDA $bf12 ; (vp_vpdemo + 17)
33e3 : 18 __ __ CLC
33e4 : 65 05 __ ADC WORK + 2 
33e6 : 85 5f __ STA T7 + 0 
33e8 : ad 13 bf LDA $bf13 ; (vp_vpdemo + 18)
33eb : 65 06 __ ADC WORK + 3 
33ed : 85 60 __ STA T7 + 1 
33ef : ad 14 bf LDA $bf14 ; (vp_vpdemo + 19)
33f2 : 18 __ __ CLC
33f3 : 65 05 __ ADC WORK + 2 
33f5 : aa __ __ TAX
33f6 : ad 15 bf LDA $bf15 ; (vp_vpdemo + 20)
33f9 : 65 06 __ ADC WORK + 3 
33fb : a8 __ __ TAY
33fc : ad 0f bf LDA $bf0f ; (vp_vpdemo + 14)
33ff : 38 __ __ SEC
3400 : e9 01 __ SBC #$01
3402 : 85 59 __ STA T4 + 0 
3404 : ad 0e bf LDA $bf0e ; (vp_vpdemo + 13)
3407 : 85 62 __ STA T9 + 0 
3409 : a9 00 __ LDA #$00
340b : 85 61 __ STA T8 + 0 
340d : e9 00 __ SBC #$00
340f : 85 5a __ STA T4 + 1 
3411 : d0 31 __ BNE $3444 ; (main.l3286 + 0)
.s1262:
3413 : a5 61 __ LDA T8 + 0 
3415 : c5 59 __ CMP T4 + 0 
3417 : 90 2b __ BCC $3444 ; (main.l3286 + 0)
.s3284:
3419 : a9 01 __ LDA #$01
341b : 85 14 __ STA P7 
341d : ad ea be LDA $beea ; (vp_fill + 9)
3420 : 18 __ __ CLC
3421 : 69 ff __ ADC #$ff
3423 : 8d ea be STA $beea ; (vp_fill + 9)
3426 : b0 03 __ BCS $342b ; (main.s2358 + 0)
.s2357:
3428 : ce eb be DEC $beeb ; (vp_fill + 10)
.s2358:
342b : ad 0a bf LDA $bf0a ; (vp_vpdemo + 9)
342e : 18 __ __ CLC
342f : 69 ff __ ADC #$ff
3431 : 8d 0a bf STA $bf0a ; (vp_vpdemo + 9)
3434 : b0 03 __ BCS $3439 ; (main.s2360 + 0)
.s2359:
3436 : ce 0b bf DEC $bf0b ; (vp_vpdemo + 10)
.s2360:
3439 : ad 0e bf LDA $bf0e ; (vp_vpdemo + 13)
343c : 85 13 __ STA P6 
343e : 20 d5 70 JSR $70d5 ; (vdcwin_init@proxy + 0)
3441 : 4c 24 32 JMP $3224 ; (main.s23164 + 0)
.l3286:
3444 : a9 12 __ LDA #$12
3446 : 8d 00 d6 STA $d600 
3449 : 8a __ __ TXA
344a : 38 __ __ SEC
344b : ed f9 8a SBC $8af9 ; (vdc_state + 3)
344e : aa __ __ TAX
344f : 98 __ __ TYA
3450 : ed fa 8a SBC $8afa ; (vdc_state + 4)
3453 : a8 __ __ TAY
3454 : 8a __ __ TXA
3455 : 38 __ __ SEC
3456 : e5 5b __ SBC T5 + 0 
3458 : 85 66 __ STA T12 + 0 
345a : 98 __ __ TYA
345b : e5 5c __ SBC T5 + 1 
345d : 85 67 __ STA T12 + 1 
345f : 38 __ __ SEC
3460 : a5 5f __ LDA T7 + 0 
3462 : ed f9 8a SBC $8af9 ; (vdc_state + 3)
3465 : 85 5f __ STA T7 + 0 
3467 : a5 60 __ LDA T7 + 1 
3469 : ed fa 8a SBC $8afa ; (vdc_state + 4)
346c : 85 60 __ STA T7 + 1 
346e : 38 __ __ SEC
346f : a5 5f __ LDA T7 + 0 
3471 : e5 5b __ SBC T5 + 0 
3473 : 85 64 __ STA T11 + 0 
3475 : a5 60 __ LDA T7 + 1 
3477 : e5 5c __ SBC T5 + 1 
3479 : 85 65 __ STA T11 + 1 
.l23136:
347b : 2c 00 d6 BIT $d600 
347e : 10 fb __ BPL $347b ; (main.l23136 + 0)
.s3342:
3480 : a5 60 __ LDA T7 + 1 
3482 : 8d 01 d6 STA $d601 
3485 : a9 13 __ LDA #$13
3487 : 8d 00 d6 STA $d600 
.l23138:
348a : 2c 00 d6 BIT $d600 
348d : 10 fb __ BPL $348a ; (main.l23138 + 0)
.s3347:
348f : a5 5f __ LDA T7 + 0 
3491 : 8d 01 d6 STA $d601 
3494 : a9 1f __ LDA #$1f
3496 : 8d 00 d6 STA $d600 
3499 : a9 18 __ LDA #$18
349b : 8d 00 d6 STA $d600 
.l23140:
349e : 2c 00 d6 BIT $d600 
34a1 : 10 fb __ BPL $349e ; (main.l23140 + 0)
.s3354:
34a3 : ad 01 d6 LDA $d601 
34a6 : 09 80 __ ORA #$80
34a8 : 85 6b __ STA T15 + 0 
34aa : a9 18 __ LDA #$18
34ac : 8d 00 d6 STA $d600 
.l23142:
34af : 2c 00 d6 BIT $d600 
34b2 : 10 fb __ BPL $34af ; (main.l23142 + 0)
.s3360:
34b4 : a5 6b __ LDA T15 + 0 
34b6 : 8d 01 d6 STA $d601 
34b9 : a9 20 __ LDA #$20
34bb : 8d 00 d6 STA $d600 
.l23144:
34be : 2c 00 d6 BIT $d600 
34c1 : 10 fb __ BPL $34be ; (main.l23144 + 0)
.s3365:
34c3 : a5 65 __ LDA T11 + 1 
34c5 : 8d 01 d6 STA $d601 
34c8 : a9 21 __ LDA #$21
34ca : 8d 00 d6 STA $d600 
.l23146:
34cd : 2c 00 d6 BIT $d600 
34d0 : 10 fb __ BPL $34cd ; (main.l23146 + 0)
.s3370:
34d2 : a5 64 __ LDA T11 + 0 
34d4 : 8d 01 d6 STA $d601 
34d7 : a9 1f __ LDA #$1f
34d9 : 8d 00 d6 STA $d600 
34dc : a9 1e __ LDA #$1e
34de : 8d 00 d6 STA $d600 
.l23148:
34e1 : 2c 00 d6 BIT $d600 
34e4 : 10 fb __ BPL $34e1 ; (main.l23148 + 0)
.s3376:
34e6 : a5 62 __ LDA T9 + 0 
34e8 : 8d 01 d6 STA $d601 
34eb : a9 12 __ LDA #$12
34ed : 8d 00 d6 STA $d600 
.l23150:
34f0 : 2c 00 d6 BIT $d600 
34f3 : 10 fb __ BPL $34f0 ; (main.l23150 + 0)
.s3429:
34f5 : 8c 01 d6 STY $d601 
34f8 : a9 13 __ LDA #$13
34fa : 8d 00 d6 STA $d600 
.l23152:
34fd : 2c 00 d6 BIT $d600 
3500 : 10 fb __ BPL $34fd ; (main.l23152 + 0)
.s3434:
3502 : 8e 01 d6 STX $d601 
3505 : a9 1f __ LDA #$1f
3507 : 8d 00 d6 STA $d600 
350a : a9 18 __ LDA #$18
350c : 8d 00 d6 STA $d600 
.l23154:
350f : 2c 00 d6 BIT $d600 
3512 : 10 fb __ BPL $350f ; (main.l23154 + 0)
.s3441:
3514 : ad 01 d6 LDA $d601 
3517 : 09 80 __ ORA #$80
3519 : 85 64 __ STA T11 + 0 
351b : a9 18 __ LDA #$18
351d : 8d 00 d6 STA $d600 
.l23156:
3520 : 2c 00 d6 BIT $d600 
3523 : 10 fb __ BPL $3520 ; (main.l23156 + 0)
.s3447:
3525 : a5 64 __ LDA T11 + 0 
3527 : 8d 01 d6 STA $d601 
352a : a9 20 __ LDA #$20
352c : 8d 00 d6 STA $d600 
.l23158:
352f : 2c 00 d6 BIT $d600 
3532 : 10 fb __ BPL $352f ; (main.l23158 + 0)
.s3452:
3534 : a5 67 __ LDA T12 + 1 
3536 : 8d 01 d6 STA $d601 
3539 : a9 21 __ LDA #$21
353b : 8d 00 d6 STA $d600 
.l23160:
353e : 2c 00 d6 BIT $d600 
3541 : 10 fb __ BPL $353e ; (main.l23160 + 0)
.s3457:
3543 : a5 66 __ LDA T12 + 0 
3545 : 8d 01 d6 STA $d601 
3548 : a9 1f __ LDA #$1f
354a : 8d 00 d6 STA $d600 
354d : a9 1e __ LDA #$1e
354f : 8d 00 d6 STA $d600 
.l23162:
3552 : 2c 00 d6 BIT $d600 
3555 : 10 fb __ BPL $3552 ; (main.l23162 + 0)
.s3463:
3557 : a5 62 __ LDA T9 + 0 
3559 : 8d 01 d6 STA $d601 
355c : e6 61 __ INC T8 + 0 
355e : a5 5a __ LDA T4 + 1 
3560 : f0 03 __ BEQ $3565 ; (main.s3463 + 14)
3562 : 4c 44 34 JMP $3444 ; (main.l3286 + 0)
3565 : 4c 13 34 JMP $3413 ; (main.s1262 + 0)
.s2925:
3568 : a5 5d __ LDA T6 + 0 
356a : 69 01 __ ADC #$01
356c : 85 5f __ STA T7 + 0 
356e : a5 5e __ LDA T6 + 1 
3570 : 69 00 __ ADC #$00
3572 : 85 60 __ STA T7 + 1 
3574 : 18 __ __ CLC
3575 : a5 5b __ LDA T5 + 0 
3577 : 69 01 __ ADC #$01
3579 : aa __ __ TAX
357a : a5 5c __ LDA T5 + 1 
357c : 69 00 __ ADC #$00
357e : a8 __ __ TAY
357f : ad f7 8a LDA $8af7 ; (vdc_state + 1)
3582 : d0 11 __ BNE $3595 ; (main.s2930 + 0)
.s2932:
3584 : a9 03 __ LDA #$03
3586 : cd 03 8b CMP $8b03 ; (vdc_state + 13)
3589 : d0 05 __ BNE $3590 ; (main.s1321 + 0)
.s1320:
358b : a9 ff __ LDA #$ff
358d : cd 02 8b CMP $8b02 ; (vdc_state + 12)
.s1321:
3590 : b0 03 __ BCS $3595 ; (main.s2930 + 0)
3592 : 4c 7c 37 JMP $377c ; (main.s2929 + 0)
.s2930:
3595 : ad 02 8b LDA $8b02 ; (vdc_state + 12)
3598 : 85 66 __ STA T12 + 0 
359a : ad 03 8b LDA $8b03 ; (vdc_state + 13)
359d : 85 6b __ STA T15 + 0 
359f : a9 12 __ LDA #$12
35a1 : 8d 00 d6 STA $d600 
.l23077:
35a4 : 2c 00 d6 BIT $d600 
35a7 : 10 fb __ BPL $35a4 ; (main.l23077 + 0)
.s2985:
35a9 : a5 6b __ LDA T15 + 0 
35ab : 8d 01 d6 STA $d601 
35ae : a9 13 __ LDA #$13
35b0 : 8d 00 d6 STA $d600 
.l23079:
35b3 : 2c 00 d6 BIT $d600 
35b6 : 10 fb __ BPL $35b3 ; (main.l23079 + 0)
.s2990:
35b8 : a5 66 __ LDA T12 + 0 
35ba : 8d 01 d6 STA $d601 
35bd : a9 1f __ LDA #$1f
35bf : 8d 00 d6 STA $d600 
35c2 : a9 18 __ LDA #$18
35c4 : 8d 00 d6 STA $d600 
.l23081:
35c7 : 2c 00 d6 BIT $d600 
35ca : 10 fb __ BPL $35c7 ; (main.l23081 + 0)
.s2997:
35cc : ad 01 d6 LDA $d601 
35cf : 09 80 __ ORA #$80
35d1 : 85 43 __ STA T16 + 0 
35d3 : a9 18 __ LDA #$18
35d5 : 8d 00 d6 STA $d600 
.l23083:
35d8 : 2c 00 d6 BIT $d600 
35db : 10 fb __ BPL $35d8 ; (main.l23083 + 0)
.s3003:
35dd : a5 43 __ LDA T16 + 0 
35df : 8d 01 d6 STA $d601 
35e2 : a9 20 __ LDA #$20
35e4 : 8d 00 d6 STA $d600 
.l23085:
35e7 : 2c 00 d6 BIT $d600 
35ea : 10 fb __ BPL $35e7 ; (main.l23085 + 0)
.s3008:
35ec : 8c 01 d6 STY $d601 
35ef : a9 21 __ LDA #$21
35f1 : 8d 00 d6 STA $d600 
.l23087:
35f4 : 2c 00 d6 BIT $d600 
35f7 : 10 fb __ BPL $35f4 ; (main.l23087 + 0)
.s3013:
35f9 : 8e 01 d6 STX $d601 
35fc : a9 1f __ LDA #$1f
35fe : 8d 00 d6 STA $d600 
3601 : a9 1e __ LDA #$1e
3603 : 8d 00 d6 STA $d600 
.l23089:
3606 : 2c 00 d6 BIT $d600 
3609 : 10 fb __ BPL $3606 ; (main.l23089 + 0)
.s3019:
360b : a5 59 __ LDA T4 + 0 
360d : 8d 01 d6 STA $d601 
3610 : a9 12 __ LDA #$12
3612 : 8d 00 d6 STA $d600 
.l23091:
3615 : 2c 00 d6 BIT $d600 
3618 : 10 fb __ BPL $3615 ; (main.l23091 + 0)
.s3072:
361a : a5 5c __ LDA T5 + 1 
361c : 8d 01 d6 STA $d601 
361f : a9 13 __ LDA #$13
3621 : 8d 00 d6 STA $d600 
.l23093:
3624 : 2c 00 d6 BIT $d600 
3627 : 10 fb __ BPL $3624 ; (main.l23093 + 0)
.s3077:
3629 : a5 5b __ LDA T5 + 0 
362b : 8d 01 d6 STA $d601 
362e : a9 1f __ LDA #$1f
3630 : 8d 00 d6 STA $d600 
3633 : a9 18 __ LDA #$18
3635 : 8d 00 d6 STA $d600 
.l23095:
3638 : 2c 00 d6 BIT $d600 
363b : 10 fb __ BPL $3638 ; (main.l23095 + 0)
.s3084:
363d : ad 01 d6 LDA $d601 
3640 : 09 80 __ ORA #$80
3642 : a2 18 __ LDX #$18
3644 : 8e 00 d6 STX $d600 
.l23097:
3647 : 2c 00 d6 BIT $d600 
364a : 10 fb __ BPL $3647 ; (main.l23097 + 0)
.s3090:
364c : 8d 01 d6 STA $d601 
364f : a9 20 __ LDA #$20
3651 : 8d 00 d6 STA $d600 
.l23099:
3654 : 2c 00 d6 BIT $d600 
3657 : 10 fb __ BPL $3654 ; (main.l23099 + 0)
.s3095:
3659 : a5 6b __ LDA T15 + 0 
365b : 8d 01 d6 STA $d601 
365e : a9 21 __ LDA #$21
3660 : 8d 00 d6 STA $d600 
.l23101:
3663 : 2c 00 d6 BIT $d600 
3666 : 10 fb __ BPL $3663 ; (main.l23101 + 0)
.s3100:
3668 : a5 66 __ LDA T12 + 0 
366a : 8d 01 d6 STA $d601 
366d : a9 1f __ LDA #$1f
366f : 8d 00 d6 STA $d600 
3672 : a9 1e __ LDA #$1e
3674 : 8d 00 d6 STA $d600 
.l23103:
3677 : 2c 00 d6 BIT $d600 
367a : 10 fb __ BPL $3677 ; (main.l23103 + 0)
.s3106:
367c : a5 59 __ LDA T4 + 0 
367e : 8d 01 d6 STA $d601 
3681 : a9 12 __ LDA #$12
3683 : 8d 00 d6 STA $d600 
.l23105:
3686 : 2c 00 d6 BIT $d600 
3689 : 10 fb __ BPL $3686 ; (main.l23105 + 0)
.s3159:
368b : a5 6b __ LDA T15 + 0 
368d : 8d 01 d6 STA $d601 
3690 : a9 13 __ LDA #$13
3692 : 8d 00 d6 STA $d600 
.l23107:
3695 : 2c 00 d6 BIT $d600 
3698 : 10 fb __ BPL $3695 ; (main.l23107 + 0)
.s3164:
369a : a5 66 __ LDA T12 + 0 
369c : 8d 01 d6 STA $d601 
369f : a9 1f __ LDA #$1f
36a1 : 8d 00 d6 STA $d600 
36a4 : 8e 00 d6 STX $d600 
.l23109:
36a7 : 2c 00 d6 BIT $d600 
36aa : 10 fb __ BPL $36a7 ; (main.l23109 + 0)
.s3171:
36ac : ad 01 d6 LDA $d601 
36af : 09 80 __ ORA #$80
36b1 : 8e 00 d6 STX $d600 
.l23111:
36b4 : 2c 00 d6 BIT $d600 
36b7 : 10 fb __ BPL $36b4 ; (main.l23111 + 0)
.s3177:
36b9 : 8d 01 d6 STA $d601 
36bc : a9 20 __ LDA #$20
36be : 8d 00 d6 STA $d600 
.l23113:
36c1 : 2c 00 d6 BIT $d600 
36c4 : 10 fb __ BPL $36c1 ; (main.l23113 + 0)
.s3182:
36c6 : a5 60 __ LDA T7 + 1 
36c8 : 8d 01 d6 STA $d601 
36cb : a9 21 __ LDA #$21
36cd : 8d 00 d6 STA $d600 
.l23115:
36d0 : 2c 00 d6 BIT $d600 
36d3 : 10 fb __ BPL $36d0 ; (main.l23115 + 0)
.s3187:
36d5 : a5 5f __ LDA T7 + 0 
36d7 : 8d 01 d6 STA $d601 
36da : a9 1f __ LDA #$1f
36dc : 8d 00 d6 STA $d600 
36df : a9 1e __ LDA #$1e
36e1 : 8d 00 d6 STA $d600 
.l23117:
36e4 : 2c 00 d6 BIT $d600 
36e7 : 10 fb __ BPL $36e4 ; (main.l23117 + 0)
.s3193:
36e9 : a5 59 __ LDA T4 + 0 
36eb : 8d 01 d6 STA $d601 
36ee : a9 12 __ LDA #$12
36f0 : 8d 00 d6 STA $d600 
.l23119:
36f3 : 2c 00 d6 BIT $d600 
36f6 : 10 fb __ BPL $36f3 ; (main.l23119 + 0)
.s3246:
36f8 : a5 5e __ LDA T6 + 1 
36fa : 8d 01 d6 STA $d601 
36fd : a9 13 __ LDA #$13
36ff : 8d 00 d6 STA $d600 
.l23121:
3702 : 2c 00 d6 BIT $d600 
3705 : 10 fb __ BPL $3702 ; (main.l23121 + 0)
.s3251:
3707 : a5 5d __ LDA T6 + 0 
3709 : 8d 01 d6 STA $d601 
370c : a9 1f __ LDA #$1f
370e : 8d 00 d6 STA $d600 
3711 : 8e 00 d6 STX $d600 
.l23123:
3714 : 2c 00 d6 BIT $d600 
3717 : 10 fb __ BPL $3714 ; (main.l23123 + 0)
.s3258:
3719 : ad 01 d6 LDA $d601 
371c : 09 80 __ ORA #$80
371e : 8e 00 d6 STX $d600 
.l23125:
3721 : 2c 00 d6 BIT $d600 
3724 : 10 fb __ BPL $3721 ; (main.l23125 + 0)
.s3264:
3726 : 8d 01 d6 STA $d601 
3729 : a9 20 __ LDA #$20
372b : 8d 00 d6 STA $d600 
.l23127:
372e : 2c 00 d6 BIT $d600 
3731 : 10 fb __ BPL $372e ; (main.l23127 + 0)
.s3269:
3733 : a5 6b __ LDA T15 + 0 
3735 : 8d 01 d6 STA $d601 
3738 : a9 21 __ LDA #$21
373a : 8d 00 d6 STA $d600 
.l23129:
373d : 2c 00 d6 BIT $d600 
3740 : 10 fb __ BPL $373d ; (main.l23129 + 0)
.s3274:
3742 : a5 66 __ LDA T12 + 0 
3744 : 8d 01 d6 STA $d601 
3747 : a9 1f __ LDA #$1f
3749 : 8d 00 d6 STA $d600 
374c : a9 1e __ LDA #$1e
374e : 8d 00 d6 STA $d600 
.l23131:
3751 : 2c 00 d6 BIT $d600 
3754 : 10 fb __ BPL $3751 ; (main.l23131 + 0)
.s3280:
3756 : a5 59 __ LDA T4 + 0 
3758 : 8d 01 d6 STA $d601 
.s2928:
375b : ad f9 8a LDA $8af9 ; (vdc_state + 3)
375e : 18 __ __ CLC
375f : 65 5b __ ADC T5 + 0 
3761 : 85 5b __ STA T5 + 0 
3763 : ad fa 8a LDA $8afa ; (vdc_state + 4)
3766 : 65 5c __ ADC T5 + 1 
3768 : 85 5c __ STA T5 + 1 
376a : 18 __ __ CLC
376b : a5 5d __ LDA T6 + 0 
376d : 6d f9 8a ADC $8af9 ; (vdc_state + 3)
3770 : 85 5d __ STA T6 + 0 
3772 : a5 5e __ LDA T6 + 1 
3774 : 6d fa 8a ADC $8afa ; (vdc_state + 4)
3777 : e6 61 __ INC T8 + 0 
3779 : 4c d3 31 JMP $31d3 ; (main.l2924 + 0)
.s2929:
377c : 86 10 __ STX P3 
377e : 84 11 __ STY P4 
3780 : 20 ba 13 JSR $13ba ; (bnk_cpyfromvdc@proxy + 0)
3783 : a5 5b __ LDA T5 + 0 
3785 : 85 0d __ STA P0 
3787 : a5 5c __ LDA T5 + 1 
3789 : 85 0e __ STA P1 
378b : 20 43 14 JSR $1443 ; (bnk_cpytovdc@proxy + 0)
378e : a5 5f __ LDA T7 + 0 
3790 : 85 10 __ STA P3 
3792 : a5 60 __ LDA T7 + 1 
3794 : 85 11 __ STA P4 
3796 : 20 52 15 JSR $1552 ; (bnk_cpyfromvdc@proxy + 0)
3799 : a5 5d __ LDA T6 + 0 
379b : 85 0d __ STA P0 
379d : a5 5e __ LDA T6 + 1 
379f : 85 0e __ STA P1 
37a1 : 20 43 14 JSR $1443 ; (bnk_cpytovdc@proxy + 0)
37a4 : 4c 5b 37 JMP $375b ; (main.s2928 + 0)
.s2564:
37a7 : a5 5b __ LDA T5 + 0 
37a9 : 69 01 __ ADC #$01
37ab : 85 5f __ STA T7 + 0 
37ad : a5 5c __ LDA T5 + 1 
37af : 69 00 __ ADC #$00
37b1 : 85 60 __ STA T7 + 1 
37b3 : 18 __ __ CLC
37b4 : a5 5d __ LDA T6 + 0 
37b6 : 69 01 __ ADC #$01
37b8 : 85 64 __ STA T11 + 0 
37ba : a5 5e __ LDA T6 + 1 
37bc : 69 00 __ ADC #$00
37be : 85 65 __ STA T11 + 1 
37c0 : ad f7 8a LDA $8af7 ; (vdc_state + 1)
37c3 : d0 11 __ BNE $37d6 ; (main.s2569 + 0)
.s2571:
37c5 : a9 03 __ LDA #$03
37c7 : cd 03 8b CMP $8b03 ; (vdc_state + 13)
37ca : d0 05 __ BNE $37d1 ; (main.s1381 + 0)
.s1380:
37cc : a9 ff __ LDA #$ff
37ce : cd 02 8b CMP $8b02 ; (vdc_state + 12)
.s1381:
37d1 : b0 03 __ BCS $37d6 ; (main.s2569 + 0)
37d3 : 4c c1 39 JMP $39c1 ; (main.s2568 + 0)
.s2569:
37d6 : a9 12 __ LDA #$12
37d8 : 8d 00 d6 STA $d600 
37db : ac 03 8b LDY $8b03 ; (vdc_state + 13)
37de : ae 02 8b LDX $8b02 ; (vdc_state + 12)
.l23017:
37e1 : 2c 00 d6 BIT $d600 
37e4 : 10 fb __ BPL $37e1 ; (main.l23017 + 0)
.s2624:
37e6 : 8c 01 d6 STY $d601 
37e9 : a9 13 __ LDA #$13
37eb : 8d 00 d6 STA $d600 
.l23019:
37ee : 2c 00 d6 BIT $d600 
37f1 : 10 fb __ BPL $37ee ; (main.l23019 + 0)
.s2629:
37f3 : 8e 01 d6 STX $d601 
37f6 : a9 1f __ LDA #$1f
37f8 : 8d 00 d6 STA $d600 
37fb : a9 18 __ LDA #$18
37fd : 8d 00 d6 STA $d600 
.l23021:
3800 : 2c 00 d6 BIT $d600 
3803 : 10 fb __ BPL $3800 ; (main.l23021 + 0)
.s2636:
3805 : ad 01 d6 LDA $d601 
3808 : 09 80 __ ORA #$80
380a : 85 43 __ STA T16 + 0 
380c : a9 18 __ LDA #$18
380e : 8d 00 d6 STA $d600 
.l23023:
3811 : 2c 00 d6 BIT $d600 
3814 : 10 fb __ BPL $3811 ; (main.l23023 + 0)
.s2642:
3816 : a5 43 __ LDA T16 + 0 
3818 : 8d 01 d6 STA $d601 
381b : a9 20 __ LDA #$20
381d : 8d 00 d6 STA $d600 
.l23025:
3820 : 2c 00 d6 BIT $d600 
3823 : 10 fb __ BPL $3820 ; (main.l23025 + 0)
.s2647:
3825 : a5 5c __ LDA T5 + 1 
3827 : 8d 01 d6 STA $d601 
382a : a9 21 __ LDA #$21
382c : 8d 00 d6 STA $d600 
.l23027:
382f : 2c 00 d6 BIT $d600 
3832 : 10 fb __ BPL $382f ; (main.l23027 + 0)
.s2652:
3834 : a5 5b __ LDA T5 + 0 
3836 : 8d 01 d6 STA $d601 
3839 : a9 1f __ LDA #$1f
383b : 8d 00 d6 STA $d600 
383e : a9 1e __ LDA #$1e
3840 : 8d 00 d6 STA $d600 
.l23029:
3843 : 2c 00 d6 BIT $d600 
3846 : 10 fb __ BPL $3843 ; (main.l23029 + 0)
.s2658:
3848 : a5 59 __ LDA T4 + 0 
384a : 8d 01 d6 STA $d601 
384d : a9 12 __ LDA #$12
384f : 8d 00 d6 STA $d600 
.l23031:
3852 : 2c 00 d6 BIT $d600 
3855 : 10 fb __ BPL $3852 ; (main.l23031 + 0)
.s2711:
3857 : a5 60 __ LDA T7 + 1 
3859 : 8d 01 d6 STA $d601 
385c : a9 13 __ LDA #$13
385e : 8d 00 d6 STA $d600 
.l23033:
3861 : 2c 00 d6 BIT $d600 
3864 : 10 fb __ BPL $3861 ; (main.l23033 + 0)
.s2716:
3866 : a5 5f __ LDA T7 + 0 
3868 : 8d 01 d6 STA $d601 
386b : a9 1f __ LDA #$1f
386d : 8d 00 d6 STA $d600 
3870 : a9 18 __ LDA #$18
3872 : 8d 00 d6 STA $d600 
.l23035:
3875 : 2c 00 d6 BIT $d600 
3878 : 10 fb __ BPL $3875 ; (main.l23035 + 0)
.s2723:
387a : ad 01 d6 LDA $d601 
387d : 09 80 __ ORA #$80
387f : 85 5f __ STA T7 + 0 
3881 : a9 18 __ LDA #$18
3883 : 8d 00 d6 STA $d600 
.l23037:
3886 : 2c 00 d6 BIT $d600 
3889 : 10 fb __ BPL $3886 ; (main.l23037 + 0)
.s2729:
388b : a5 5f __ LDA T7 + 0 
388d : 8d 01 d6 STA $d601 
3890 : a9 20 __ LDA #$20
3892 : 8d 00 d6 STA $d600 
.l23039:
3895 : 2c 00 d6 BIT $d600 
3898 : 10 fb __ BPL $3895 ; (main.l23039 + 0)
.s2734:
389a : 8c 01 d6 STY $d601 
389d : a9 21 __ LDA #$21
389f : 8d 00 d6 STA $d600 
.l23041:
38a2 : 2c 00 d6 BIT $d600 
38a5 : 10 fb __ BPL $38a2 ; (main.l23041 + 0)
.s2739:
38a7 : 8e 01 d6 STX $d601 
38aa : a9 1f __ LDA #$1f
38ac : 8d 00 d6 STA $d600 
38af : a9 1e __ LDA #$1e
38b1 : 8d 00 d6 STA $d600 
.l23043:
38b4 : 2c 00 d6 BIT $d600 
38b7 : 10 fb __ BPL $38b4 ; (main.l23043 + 0)
.s2745:
38b9 : a5 59 __ LDA T4 + 0 
38bb : 8d 01 d6 STA $d601 
38be : a9 12 __ LDA #$12
38c0 : 8d 00 d6 STA $d600 
.l23045:
38c3 : 2c 00 d6 BIT $d600 
38c6 : 10 fb __ BPL $38c3 ; (main.l23045 + 0)
.s2798:
38c8 : 8c 01 d6 STY $d601 
38cb : a9 13 __ LDA #$13
38cd : 8d 00 d6 STA $d600 
.l23047:
38d0 : 2c 00 d6 BIT $d600 
38d3 : 10 fb __ BPL $38d0 ; (main.l23047 + 0)
.s2803:
38d5 : 8e 01 d6 STX $d601 
38d8 : a9 1f __ LDA #$1f
38da : 8d 00 d6 STA $d600 
38dd : a9 18 __ LDA #$18
38df : 8d 00 d6 STA $d600 
.l23049:
38e2 : 2c 00 d6 BIT $d600 
38e5 : 10 fb __ BPL $38e2 ; (main.l23049 + 0)
.s2810:
38e7 : ad 01 d6 LDA $d601 
38ea : 09 80 __ ORA #$80
38ec : 85 5f __ STA T7 + 0 
38ee : a9 18 __ LDA #$18
38f0 : 8d 00 d6 STA $d600 
.l23051:
38f3 : 2c 00 d6 BIT $d600 
38f6 : 10 fb __ BPL $38f3 ; (main.l23051 + 0)
.s2816:
38f8 : a5 5f __ LDA T7 + 0 
38fa : 8d 01 d6 STA $d601 
38fd : a9 20 __ LDA #$20
38ff : 8d 00 d6 STA $d600 
.l23053:
3902 : 2c 00 d6 BIT $d600 
3905 : 10 fb __ BPL $3902 ; (main.l23053 + 0)
.s2821:
3907 : a5 5e __ LDA T6 + 1 
3909 : 8d 01 d6 STA $d601 
390c : a9 21 __ LDA #$21
390e : 8d 00 d6 STA $d600 
.l23055:
3911 : 2c 00 d6 BIT $d600 
3914 : 10 fb __ BPL $3911 ; (main.l23055 + 0)
.s2826:
3916 : a5 5d __ LDA T6 + 0 
3918 : 8d 01 d6 STA $d601 
391b : a9 1f __ LDA #$1f
391d : 8d 00 d6 STA $d600 
3920 : a9 1e __ LDA #$1e
3922 : 8d 00 d6 STA $d600 
.l23057:
3925 : 2c 00 d6 BIT $d600 
3928 : 10 fb __ BPL $3925 ; (main.l23057 + 0)
.s2832:
392a : a5 59 __ LDA T4 + 0 
392c : 8d 01 d6 STA $d601 
392f : a9 12 __ LDA #$12
3931 : 8d 00 d6 STA $d600 
.l23059:
3934 : 2c 00 d6 BIT $d600 
3937 : 10 fb __ BPL $3934 ; (main.l23059 + 0)
.s2885:
3939 : a5 65 __ LDA T11 + 1 
393b : 8d 01 d6 STA $d601 
393e : a9 13 __ LDA #$13
3940 : 8d 00 d6 STA $d600 
.l23061:
3943 : 2c 00 d6 BIT $d600 
3946 : 10 fb __ BPL $3943 ; (main.l23061 + 0)
.s2890:
3948 : a5 64 __ LDA T11 + 0 
394a : 8d 01 d6 STA $d601 
394d : a9 1f __ LDA #$1f
394f : 8d 00 d6 STA $d600 
3952 : a9 18 __ LDA #$18
3954 : 8d 00 d6 STA $d600 
.l23063:
3957 : 2c 00 d6 BIT $d600 
395a : 10 fb __ BPL $3957 ; (main.l23063 + 0)
.s2897:
395c : ad 01 d6 LDA $d601 
395f : 09 80 __ ORA #$80
3961 : 85 5f __ STA T7 + 0 
3963 : a9 18 __ LDA #$18
3965 : 8d 00 d6 STA $d600 
.l23065:
3968 : 2c 00 d6 BIT $d600 
396b : 10 fb __ BPL $3968 ; (main.l23065 + 0)
.s2903:
396d : a5 5f __ LDA T7 + 0 
396f : 8d 01 d6 STA $d601 
3972 : a9 20 __ LDA #$20
3974 : 8d 00 d6 STA $d600 
.l23067:
3977 : 2c 00 d6 BIT $d600 
397a : 10 fb __ BPL $3977 ; (main.l23067 + 0)
.s2908:
397c : 8c 01 d6 STY $d601 
397f : a9 21 __ LDA #$21
3981 : 8d 00 d6 STA $d600 
.l23069:
3984 : 2c 00 d6 BIT $d600 
3987 : 10 fb __ BPL $3984 ; (main.l23069 + 0)
.s2913:
3989 : 8e 01 d6 STX $d601 
398c : a9 1f __ LDA #$1f
398e : 8d 00 d6 STA $d600 
3991 : a9 1e __ LDA #$1e
3993 : 8d 00 d6 STA $d600 
.l23071:
3996 : 2c 00 d6 BIT $d600 
3999 : 10 fb __ BPL $3996 ; (main.l23071 + 0)
.s2919:
399b : a5 59 __ LDA T4 + 0 
399d : 8d 01 d6 STA $d601 
.s2567:
39a0 : ad f9 8a LDA $8af9 ; (vdc_state + 3)
39a3 : 18 __ __ CLC
39a4 : 65 5b __ ADC T5 + 0 
39a6 : 85 5b __ STA T5 + 0 
39a8 : ad fa 8a LDA $8afa ; (vdc_state + 4)
39ab : 65 5c __ ADC T5 + 1 
39ad : 85 5c __ STA T5 + 1 
39af : 18 __ __ CLC
39b0 : a5 5d __ LDA T6 + 0 
39b2 : 6d f9 8a ADC $8af9 ; (vdc_state + 3)
39b5 : 85 5d __ STA T6 + 0 
39b7 : a5 5e __ LDA T6 + 1 
39b9 : 6d fa 8a ADC $8afa ; (vdc_state + 4)
39bc : e6 61 __ INC T8 + 0 
39be : 4c 7d 31 JMP $317d ; (main.l2563 + 0)
.s2568:
39c1 : a5 5b __ LDA T5 + 0 
39c3 : 85 10 __ STA P3 
39c5 : a5 5c __ LDA T5 + 1 
39c7 : 85 11 __ STA P4 
39c9 : 20 ba 13 JSR $13ba ; (bnk_cpyfromvdc@proxy + 0)
39cc : a5 5f __ LDA T7 + 0 
39ce : 85 0d __ STA P0 
39d0 : a5 60 __ LDA T7 + 1 
39d2 : 85 0e __ STA P1 
39d4 : 20 43 14 JSR $1443 ; (bnk_cpytovdc@proxy + 0)
39d7 : a5 5d __ LDA T6 + 0 
39d9 : 85 10 __ STA P3 
39db : a5 5e __ LDA T6 + 1 
39dd : 85 11 __ STA P4 
39df : 20 52 15 JSR $1552 ; (bnk_cpyfromvdc@proxy + 0)
39e2 : a5 64 __ LDA T11 + 0 
39e4 : 85 0d __ STA P0 
39e6 : a5 65 __ LDA T11 + 1 
39e8 : 85 0e __ STA P1 
39ea : 20 43 14 JSR $1443 ; (bnk_cpytovdc@proxy + 0)
39ed : 4c a0 39 JMP $39a0 ; (main.s2567 + 0)
.l2390:
39f0 : a5 61 __ LDA T8 + 0 
39f2 : 0a __ __ ASL
39f3 : 10 03 __ BPL $39f8 ; (main.s2395 + 0)
39f5 : 4c 6a 3b JMP $3b6a ; (main.s2393 + 0)
.s2395:
39f8 : ad 21 bf LDA $bf21 ; (win_vpdemo + 0)
39fb : 85 62 __ STA T9 + 0 
39fd : 85 0d __ STA P0 
39ff : ad 22 bf LDA $bf22 ; (win_vpdemo + 1)
3a02 : 18 __ __ CLC
3a03 : 65 56 __ ADC T2 + 0 
3a05 : 85 0e __ STA P1 
3a07 : ad 23 bf LDA $bf23 ; (win_vpdemo + 2)
3a0a : 85 64 __ STA T11 + 0 
3a0c : 38 __ __ SEC
3a0d : e9 01 __ SBC #$01
3a0f : 85 66 __ STA T12 + 0 
3a11 : ad fd 8a LDA $8afd ; (vdc_state + 7)
3a14 : 85 6a __ STA T14 + 0 
3a16 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
3a19 : a9 12 __ LDA #$12
3a1b : 8d 00 d6 STA $d600 
3a1e : ad fe 8a LDA $8afe ; (vdc_state + 8)
3a21 : 85 5f __ STA T7 + 0 
3a23 : 18 __ __ CLC
3a24 : 65 1b __ ADC ACCU + 0 
3a26 : aa __ __ TAX
3a27 : ad ff 8a LDA $8aff ; (vdc_state + 9)
3a2a : 85 60 __ STA T7 + 1 
3a2c : 65 1c __ ADC ACCU + 1 
.l22969:
3a2e : 2c 00 d6 BIT $d600 
3a31 : 10 fb __ BPL $3a2e ; (main.l22969 + 0)
.s2436:
3a33 : 8d 01 d6 STA $d601 
3a36 : a9 13 __ LDA #$13
3a38 : 8d 00 d6 STA $d600 
.l22971:
3a3b : 2c 00 d6 BIT $d600 
3a3e : 10 fb __ BPL $3a3b ; (main.l22971 + 0)
.s2441:
3a40 : 8e 01 d6 STX $d601 
3a43 : a9 1f __ LDA #$1f
3a45 : 8d 00 d6 STA $d600 
.l22973:
3a48 : 2c 00 d6 BIT $d600 
3a4b : 10 fb __ BPL $3a48 ; (main.l22973 + 0)
.s2445:
3a4d : a9 20 __ LDA #$20
3a4f : 8d 01 d6 STA $d601 
3a52 : a9 18 __ LDA #$18
3a54 : 8d 00 d6 STA $d600 
.l22975:
3a57 : 2c 00 d6 BIT $d600 
3a5a : 10 fb __ BPL $3a57 ; (main.l22975 + 0)
.s2451:
3a5c : ad 01 d6 LDA $d601 
3a5f : 29 7f __ AND #$7f
3a61 : a0 18 __ LDY #$18
3a63 : 8c 00 d6 STY $d600 
.l22977:
3a66 : 2c 00 d6 BIT $d600 
3a69 : 10 fb __ BPL $3a66 ; (main.l22977 + 0)
.s2457:
3a6b : 8d 01 d6 STA $d601 
3a6e : a9 1e __ LDA #$1e
3a70 : 8d 00 d6 STA $d600 
.l22979:
3a73 : 2c 00 d6 BIT $d600 
3a76 : 10 fb __ BPL $3a73 ; (main.l22979 + 0)
.s2462:
3a78 : a5 66 __ LDA T12 + 0 
3a7a : 8d 01 d6 STA $d601 
3a7d : a9 12 __ LDA #$12
3a7f : 8d 00 d6 STA $d600 
3a82 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
3a85 : 85 68 __ STA T13 + 0 
3a87 : 18 __ __ CLC
3a88 : 65 1b __ ADC ACCU + 0 
3a8a : aa __ __ TAX
3a8b : ad 01 8b LDA $8b01 ; (vdc_state + 11)
3a8e : 85 69 __ STA T13 + 1 
3a90 : 65 1c __ ADC ACCU + 1 
.l22981:
3a92 : 2c 00 d6 BIT $d600 
3a95 : 10 fb __ BPL $3a92 ; (main.l22981 + 0)
.s2469:
3a97 : 8d 01 d6 STA $d601 
3a9a : a9 13 __ LDA #$13
3a9c : 8d 00 d6 STA $d600 
.l22983:
3a9f : 2c 00 d6 BIT $d600 
3aa2 : 10 fb __ BPL $3a9f ; (main.l22983 + 0)
.s2474:
3aa4 : 8e 01 d6 STX $d601 
3aa7 : a9 1f __ LDA #$1f
3aa9 : 8d 00 d6 STA $d600 
.l22985:
3aac : 2c 00 d6 BIT $d600 
3aaf : 10 fb __ BPL $3aac ; (main.l22985 + 0)
.s2478:
3ab1 : a5 6a __ LDA T14 + 0 
3ab3 : 8d 01 d6 STA $d601 
3ab6 : 8c 00 d6 STY $d600 
.l22987:
3ab9 : 2c 00 d6 BIT $d600 
3abc : 10 fb __ BPL $3ab9 ; (main.l22987 + 0)
.s2484:
3abe : ad 01 d6 LDA $d601 
3ac1 : 29 7f __ AND #$7f
3ac3 : 8c 00 d6 STY $d600 
.l22989:
3ac6 : 2c 00 d6 BIT $d600 
3ac9 : 10 fb __ BPL $3ac6 ; (main.l22989 + 0)
.s2490:
3acb : 8d 01 d6 STA $d601 
3ace : a9 1e __ LDA #$1e
3ad0 : 8d 00 d6 STA $d600 
.l22991:
3ad3 : 2c 00 d6 BIT $d600 
3ad6 : 10 fb __ BPL $3ad3 ; (main.l22991 + 0)
.s2495:
3ad8 : a5 66 __ LDA T12 + 0 
3ada : 8d 01 d6 STA $d601 
3add : a5 61 __ LDA T8 + 0 
3adf : 29 20 __ AND #$20
3ae1 : d0 0f __ BNE $3af2 ; (main.s2496 + 0)
.s23264:
3ae3 : e6 56 __ INC T2 + 0 
3ae5 : a5 56 __ LDA T2 + 0 
3ae7 : cd 24 bf CMP $bf24 ; (win_vpdemo + 3)
3aea : b0 03 __ BCS $3aef ; (main.s23264 + 12)
3aec : 4c f0 39 JMP $39f0 ; (main.l2390 + 0)
3aef : 4c 0c 2f JMP $2f0c ; (main.s2094 + 0)
.s2496:
3af2 : 18 __ __ CLC
3af3 : a5 62 __ LDA T9 + 0 
3af5 : 65 64 __ ADC T11 + 0 
3af7 : 85 0d __ STA P0 
3af9 : ad 6c 86 LDA $866c ; (winStyles + 8)
3afc : 85 62 __ STA T9 + 0 
3afe : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
3b01 : a9 12 __ LDA #$12
3b03 : 8d 00 d6 STA $d600 
3b06 : 18 __ __ CLC
3b07 : a5 1b __ LDA ACCU + 0 
3b09 : 65 5f __ ADC T7 + 0 
3b0b : aa __ __ TAX
3b0c : a5 1c __ LDA ACCU + 1 
3b0e : 65 60 __ ADC T7 + 1 
.l22994:
3b10 : 2c 00 d6 BIT $d600 
3b13 : 10 fb __ BPL $3b10 ; (main.l22994 + 0)
.s2506:
3b15 : 8d 01 d6 STA $d601 
3b18 : a9 13 __ LDA #$13
3b1a : 8d 00 d6 STA $d600 
.l22996:
3b1d : 2c 00 d6 BIT $d600 
3b20 : 10 fb __ BPL $3b1d ; (main.l22996 + 0)
.s2511:
3b22 : 8e 01 d6 STX $d601 
3b25 : a9 1f __ LDA #$1f
3b27 : 8d 00 d6 STA $d600 
.l22998:
3b2a : 2c 00 d6 BIT $d600 
3b2d : 10 fb __ BPL $3b2a ; (main.l22998 + 0)
.s2515:
3b2f : a5 62 __ LDA T9 + 0 
3b31 : 8d 01 d6 STA $d601 
3b34 : a9 12 __ LDA #$12
3b36 : 8d 00 d6 STA $d600 
3b39 : 18 __ __ CLC
3b3a : a5 1b __ LDA ACCU + 0 
3b3c : 65 68 __ ADC T13 + 0 
3b3e : aa __ __ TAX
3b3f : a5 1c __ LDA ACCU + 1 
3b41 : 65 69 __ ADC T13 + 1 
.l23000:
3b43 : 2c 00 d6 BIT $d600 
3b46 : 10 fb __ BPL $3b43 ; (main.l23000 + 0)
.s2522:
3b48 : 8d 01 d6 STA $d601 
3b4b : a9 13 __ LDA #$13
3b4d : 8d 00 d6 STA $d600 
.l23002:
3b50 : 2c 00 d6 BIT $d600 
3b53 : 10 fb __ BPL $3b50 ; (main.l23002 + 0)
.s2527:
3b55 : 8e 01 d6 STX $d601 
3b58 : a9 1f __ LDA #$1f
3b5a : 8d 00 d6 STA $d600 
.l23004:
3b5d : 2c 00 d6 BIT $d600 
3b60 : 10 fb __ BPL $3b5d ; (main.l23004 + 0)
.s2531:
3b62 : a5 55 __ LDA T1 + 0 
3b64 : 8d 01 d6 STA $d601 
3b67 : 4c e3 3a JMP $3ae3 ; (main.s23264 + 0)
.s2393:
3b6a : ad 21 bf LDA $bf21 ; (win_vpdemo + 0)
3b6d : 85 0d __ STA P0 
3b6f : c6 0d __ DEC P0 
3b71 : ad 22 bf LDA $bf22 ; (win_vpdemo + 1)
3b74 : 18 __ __ CLC
3b75 : 65 56 __ ADC T2 + 0 
3b77 : 85 0e __ STA P1 
3b79 : ad 6b 86 LDA $866b ; (winStyles + 7)
3b7c : 85 62 __ STA T9 + 0 
3b7e : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
3b81 : a9 12 __ LDA #$12
3b83 : 8d 00 d6 STA $d600 
3b86 : 18 __ __ CLC
3b87 : a5 1b __ LDA ACCU + 0 
3b89 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
3b8c : aa __ __ TAX
3b8d : a5 1c __ LDA ACCU + 1 
3b8f : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22957:
3b92 : 2c 00 d6 BIT $d600 
3b95 : 10 fb __ BPL $3b92 ; (main.l22957 + 0)
.s2403:
3b97 : 8d 01 d6 STA $d601 
3b9a : a9 13 __ LDA #$13
3b9c : 8d 00 d6 STA $d600 
.l22959:
3b9f : 2c 00 d6 BIT $d600 
3ba2 : 10 fb __ BPL $3b9f ; (main.l22959 + 0)
.s2408:
3ba4 : 8e 01 d6 STX $d601 
3ba7 : a9 1f __ LDA #$1f
3ba9 : 8d 00 d6 STA $d600 
.l22961:
3bac : 2c 00 d6 BIT $d600 
3baf : 10 fb __ BPL $3bac ; (main.l22961 + 0)
.s2412:
3bb1 : a5 62 __ LDA T9 + 0 
3bb3 : 8d 01 d6 STA $d601 
3bb6 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
3bb9 : 18 __ __ CLC
3bba : 65 1b __ ADC ACCU + 0 
3bbc : a2 12 __ LDX #$12
3bbe : 8e 00 d6 STX $d600 
3bc1 : aa __ __ TAX
3bc2 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
3bc5 : 65 1c __ ADC ACCU + 1 
.l22963:
3bc7 : 2c 00 d6 BIT $d600 
3bca : 10 fb __ BPL $3bc7 ; (main.l22963 + 0)
.s2419:
3bcc : 8d 01 d6 STA $d601 
3bcf : a9 13 __ LDA #$13
3bd1 : 8d 00 d6 STA $d600 
.l22965:
3bd4 : 2c 00 d6 BIT $d600 
3bd7 : 10 fb __ BPL $3bd4 ; (main.l22965 + 0)
.s2424:
3bd9 : 8e 01 d6 STX $d601 
3bdc : a9 1f __ LDA #$1f
3bde : 8d 00 d6 STA $d600 
.l22967:
3be1 : 2c 00 d6 BIT $d600 
3be4 : 10 fb __ BPL $3be1 ; (main.l22967 + 0)
.s2428:
3be6 : a5 55 __ LDA T1 + 0 
3be8 : 8d 01 d6 STA $d601 
3beb : 4c f8 39 JMP $39f8 ; (main.s2395 + 0)
.s2246:
3bee : a5 61 __ LDA T8 + 0 
3bf0 : 0a __ __ ASL
3bf1 : 10 03 __ BPL $3bf6 ; (main.s2252 + 0)
3bf3 : 4c 4a 3d JMP $3d4a ; (main.s2250 + 0)
.s2252:
3bf6 : a5 56 __ LDA T2 + 0 
3bf8 : 85 0d __ STA P0 
3bfa : a5 5d __ LDA T6 + 0 
3bfc : 85 0e __ STA P1 
3bfe : ad 6a 86 LDA $866a ; (winStyles + 6)
3c01 : 85 56 __ STA T2 + 0 
3c03 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
3c06 : a9 12 __ LDA #$12
3c08 : 8d 00 d6 STA $d600 
3c0b : c6 5f __ DEC T7 + 0 
3c0d : ad fe 8a LDA $8afe ; (vdc_state + 8)
3c10 : 85 66 __ STA T12 + 0 
3c12 : 18 __ __ CLC
3c13 : 65 1b __ ADC ACCU + 0 
3c15 : aa __ __ TAX
3c16 : ad ff 8a LDA $8aff ; (vdc_state + 9)
3c19 : 85 67 __ STA T12 + 1 
3c1b : 65 1c __ ADC ACCU + 1 
.l22918:
3c1d : 2c 00 d6 BIT $d600 
3c20 : 10 fb __ BPL $3c1d ; (main.l22918 + 0)
.s2293:
3c22 : 8d 01 d6 STA $d601 
3c25 : a9 13 __ LDA #$13
3c27 : 8d 00 d6 STA $d600 
.l22920:
3c2a : 2c 00 d6 BIT $d600 
3c2d : 10 fb __ BPL $3c2a ; (main.l22920 + 0)
.s2298:
3c2f : 8e 01 d6 STX $d601 
3c32 : a9 1f __ LDA #$1f
3c34 : 8d 00 d6 STA $d600 
.l22922:
3c37 : 2c 00 d6 BIT $d600 
3c3a : 10 fb __ BPL $3c37 ; (main.l22922 + 0)
.s2302:
3c3c : a5 56 __ LDA T2 + 0 
3c3e : 8d 01 d6 STA $d601 
3c41 : a9 18 __ LDA #$18
3c43 : 8d 00 d6 STA $d600 
.l22924:
3c46 : 2c 00 d6 BIT $d600 
3c49 : 10 fb __ BPL $3c46 ; (main.l22924 + 0)
.s2308:
3c4b : ad 01 d6 LDA $d601 
3c4e : 29 7f __ AND #$7f
3c50 : a0 18 __ LDY #$18
3c52 : 8c 00 d6 STY $d600 
.l22926:
3c55 : 2c 00 d6 BIT $d600 
3c58 : 10 fb __ BPL $3c55 ; (main.l22926 + 0)
.s2314:
3c5a : 8d 01 d6 STA $d601 
3c5d : a9 1e __ LDA #$1e
3c5f : 8d 00 d6 STA $d600 
.l22928:
3c62 : 2c 00 d6 BIT $d600 
3c65 : 10 fb __ BPL $3c62 ; (main.l22928 + 0)
.s2319:
3c67 : a5 5f __ LDA T7 + 0 
3c69 : 8d 01 d6 STA $d601 
3c6c : a9 12 __ LDA #$12
3c6e : 8d 00 d6 STA $d600 
3c71 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
3c74 : 85 68 __ STA T13 + 0 
3c76 : 18 __ __ CLC
3c77 : 65 1b __ ADC ACCU + 0 
3c79 : aa __ __ TAX
3c7a : ad 01 8b LDA $8b01 ; (vdc_state + 11)
3c7d : 85 69 __ STA T13 + 1 
3c7f : 65 1c __ ADC ACCU + 1 
.l22930:
3c81 : 2c 00 d6 BIT $d600 
3c84 : 10 fb __ BPL $3c81 ; (main.l22930 + 0)
.s2326:
3c86 : 8d 01 d6 STA $d601 
3c89 : a9 13 __ LDA #$13
3c8b : 8d 00 d6 STA $d600 
.l22932:
3c8e : 2c 00 d6 BIT $d600 
3c91 : 10 fb __ BPL $3c8e ; (main.l22932 + 0)
.s2331:
3c93 : 8e 01 d6 STX $d601 
3c96 : a9 1f __ LDA #$1f
3c98 : 8d 00 d6 STA $d600 
.l22934:
3c9b : 2c 00 d6 BIT $d600 
3c9e : 10 fb __ BPL $3c9b ; (main.l22934 + 0)
.s2335:
3ca0 : a5 55 __ LDA T1 + 0 
3ca2 : 8d 01 d6 STA $d601 
3ca5 : 8c 00 d6 STY $d600 
.l22936:
3ca8 : 2c 00 d6 BIT $d600 
3cab : 10 fb __ BPL $3ca8 ; (main.l22936 + 0)
.s2341:
3cad : ad 01 d6 LDA $d601 
3cb0 : 29 7f __ AND #$7f
3cb2 : 8c 00 d6 STY $d600 
.l22938:
3cb5 : 2c 00 d6 BIT $d600 
3cb8 : 10 fb __ BPL $3cb5 ; (main.l22938 + 0)
.s2347:
3cba : 8d 01 d6 STA $d601 
3cbd : a9 1e __ LDA #$1e
3cbf : 8d 00 d6 STA $d600 
.l22940:
3cc2 : 2c 00 d6 BIT $d600 
3cc5 : 10 fb __ BPL $3cc2 ; (main.l22940 + 0)
.s2352:
3cc7 : a5 5f __ LDA T7 + 0 
3cc9 : 8d 01 d6 STA $d601 
3ccc : a5 61 __ LDA T8 + 0 
3cce : 29 20 __ AND #$20
3cd0 : d0 03 __ BNE $3cd5 ; (main.s2353 + 0)
3cd2 : 4c 00 2f JMP $2f00 ; (main.s4623 + 0)
.s2353:
3cd5 : a5 64 __ LDA T11 + 0 
3cd7 : 85 0d __ STA P0 
3cd9 : ad 68 86 LDA $8668 ; (winStyles + 4)
3cdc : 85 56 __ STA T2 + 0 
3cde : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
3ce1 : a9 12 __ LDA #$12
3ce3 : 8d 00 d6 STA $d600 
3ce6 : 18 __ __ CLC
3ce7 : a5 1b __ LDA ACCU + 0 
3ce9 : 65 66 __ ADC T12 + 0 
3ceb : aa __ __ TAX
3cec : a5 1c __ LDA ACCU + 1 
3cee : 65 67 __ ADC T12 + 1 
.l22943:
3cf0 : 2c 00 d6 BIT $d600 
3cf3 : 10 fb __ BPL $3cf0 ; (main.l22943 + 0)
.s2363:
3cf5 : 8d 01 d6 STA $d601 
3cf8 : a9 13 __ LDA #$13
3cfa : 8d 00 d6 STA $d600 
.l22945:
3cfd : 2c 00 d6 BIT $d600 
3d00 : 10 fb __ BPL $3cfd ; (main.l22945 + 0)
.s2368:
3d02 : 8e 01 d6 STX $d601 
3d05 : a9 1f __ LDA #$1f
3d07 : 8d 00 d6 STA $d600 
.l22947:
3d0a : 2c 00 d6 BIT $d600 
3d0d : 10 fb __ BPL $3d0a ; (main.l22947 + 0)
.s2372:
3d0f : a5 56 __ LDA T2 + 0 
3d11 : 8d 01 d6 STA $d601 
3d14 : a9 12 __ LDA #$12
3d16 : 8d 00 d6 STA $d600 
3d19 : 18 __ __ CLC
3d1a : a5 1b __ LDA ACCU + 0 
3d1c : 65 68 __ ADC T13 + 0 
3d1e : aa __ __ TAX
3d1f : a5 1c __ LDA ACCU + 1 
3d21 : 65 69 __ ADC T13 + 1 
.l22949:
3d23 : 2c 00 d6 BIT $d600 
3d26 : 10 fb __ BPL $3d23 ; (main.l22949 + 0)
.s2379:
3d28 : 8d 01 d6 STA $d601 
3d2b : a9 13 __ LDA #$13
3d2d : 8d 00 d6 STA $d600 
.l22951:
3d30 : 2c 00 d6 BIT $d600 
3d33 : 10 fb __ BPL $3d30 ; (main.l22951 + 0)
.s2384:
3d35 : 8e 01 d6 STX $d601 
3d38 : a9 1f __ LDA #$1f
3d3a : 8d 00 d6 STA $d600 
.l22953:
3d3d : 2c 00 d6 BIT $d600 
3d40 : 10 fb __ BPL $3d3d ; (main.l22953 + 0)
.s2388:
3d42 : a5 55 __ LDA T1 + 0 
3d44 : 8d 01 d6 STA $d601 
3d47 : 4c 00 2f JMP $2f00 ; (main.s4623 + 0)
.s2250:
3d4a : a5 5d __ LDA T6 + 0 
3d4c : 85 0e __ STA P1 
3d4e : a6 56 __ LDX T2 + 0 
3d50 : ca __ __ DEX
3d51 : 86 0d __ STX P0 
3d53 : ad 67 86 LDA $8667 ; (winStyles + 3)
3d56 : 85 62 __ STA T9 + 0 
3d58 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
3d5b : a9 12 __ LDA #$12
3d5d : 8d 00 d6 STA $d600 
3d60 : 18 __ __ CLC
3d61 : a5 1b __ LDA ACCU + 0 
3d63 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
3d66 : aa __ __ TAX
3d67 : a5 1c __ LDA ACCU + 1 
3d69 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22906:
3d6c : 2c 00 d6 BIT $d600 
3d6f : 10 fb __ BPL $3d6c ; (main.l22906 + 0)
.s2260:
3d71 : 8d 01 d6 STA $d601 
3d74 : a9 13 __ LDA #$13
3d76 : 8d 00 d6 STA $d600 
.l22908:
3d79 : 2c 00 d6 BIT $d600 
3d7c : 10 fb __ BPL $3d79 ; (main.l22908 + 0)
.s2265:
3d7e : 8e 01 d6 STX $d601 
3d81 : a9 1f __ LDA #$1f
3d83 : 8d 00 d6 STA $d600 
.l22910:
3d86 : 2c 00 d6 BIT $d600 
3d89 : 10 fb __ BPL $3d86 ; (main.l22910 + 0)
.s2269:
3d8b : a5 62 __ LDA T9 + 0 
3d8d : 8d 01 d6 STA $d601 
3d90 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
3d93 : 18 __ __ CLC
3d94 : 65 1b __ ADC ACCU + 0 
3d96 : a2 12 __ LDX #$12
3d98 : 8e 00 d6 STX $d600 
3d9b : aa __ __ TAX
3d9c : ad 01 8b LDA $8b01 ; (vdc_state + 11)
3d9f : 65 1c __ ADC ACCU + 1 
.l22912:
3da1 : 2c 00 d6 BIT $d600 
3da4 : 10 fb __ BPL $3da1 ; (main.l22912 + 0)
.s2276:
3da6 : 8d 01 d6 STA $d601 
3da9 : a9 13 __ LDA #$13
3dab : 8d 00 d6 STA $d600 
.l22914:
3dae : 2c 00 d6 BIT $d600 
3db1 : 10 fb __ BPL $3dae ; (main.l22914 + 0)
.s2281:
3db3 : 8e 01 d6 STX $d601 
3db6 : a9 1f __ LDA #$1f
3db8 : 8d 00 d6 STA $d600 
.l22916:
3dbb : 2c 00 d6 BIT $d600 
3dbe : 10 fb __ BPL $3dbb ; (main.l22916 + 0)
.s2285:
3dc0 : a5 55 __ LDA T1 + 0 
3dc2 : 8d 01 d6 STA $d601 
3dc5 : 4c f6 3b JMP $3bf6 ; (main.s2252 + 0)
.s2103:
3dc8 : 85 62 __ STA T9 + 0 
3dca : a5 61 __ LDA T8 + 0 
3dcc : 0a __ __ ASL
3dcd : 10 03 __ BPL $3dd2 ; (main.s2109 + 0)
3dcf : 4c 28 3f JMP $3f28 ; (main.s2107 + 0)
.s2109:
3dd2 : a5 56 __ LDA T2 + 0 
3dd4 : 85 0d __ STA P0 
3dd6 : a6 62 __ LDX T9 + 0 
3dd8 : ca __ __ DEX
3dd9 : 86 0e __ STX P1 
3ddb : ad 69 86 LDA $8669 ; (winStyles + 5)
3dde : 85 63 __ STA T10 + 0 
3de0 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
3de3 : a9 12 __ LDA #$12
3de5 : 8d 00 d6 STA $d600 
3de8 : ad fe 8a LDA $8afe ; (vdc_state + 8)
3deb : 85 66 __ STA T12 + 0 
3ded : 18 __ __ CLC
3dee : 65 1b __ ADC ACCU + 0 
3df0 : a8 __ __ TAY
3df1 : ad ff 8a LDA $8aff ; (vdc_state + 9)
3df4 : 85 67 __ STA T12 + 1 
3df6 : 65 1c __ ADC ACCU + 1 
3df8 : a6 5f __ LDX T7 + 0 
3dfa : ca __ __ DEX
.l22866:
3dfb : 2c 00 d6 BIT $d600 
3dfe : 10 fb __ BPL $3dfb ; (main.l22866 + 0)
.s2150:
3e00 : 8d 01 d6 STA $d601 
3e03 : a9 13 __ LDA #$13
3e05 : 8d 00 d6 STA $d600 
.l22868:
3e08 : 2c 00 d6 BIT $d600 
3e0b : 10 fb __ BPL $3e08 ; (main.l22868 + 0)
.s2155:
3e0d : 8c 01 d6 STY $d601 
3e10 : a9 1f __ LDA #$1f
3e12 : 8d 00 d6 STA $d600 
.l22870:
3e15 : 2c 00 d6 BIT $d600 
3e18 : 10 fb __ BPL $3e15 ; (main.l22870 + 0)
.s2159:
3e1a : a5 63 __ LDA T10 + 0 
3e1c : 8d 01 d6 STA $d601 
3e1f : a9 18 __ LDA #$18
3e21 : 8d 00 d6 STA $d600 
.l22872:
3e24 : 2c 00 d6 BIT $d600 
3e27 : 10 fb __ BPL $3e24 ; (main.l22872 + 0)
.s2165:
3e29 : ad 01 d6 LDA $d601 
3e2c : 29 7f __ AND #$7f
3e2e : a0 18 __ LDY #$18
3e30 : 8c 00 d6 STY $d600 
.l22874:
3e33 : 2c 00 d6 BIT $d600 
3e36 : 10 fb __ BPL $3e33 ; (main.l22874 + 0)
.s2171:
3e38 : 8d 01 d6 STA $d601 
3e3b : a9 1e __ LDA #$1e
3e3d : 8d 00 d6 STA $d600 
.l22876:
3e40 : 2c 00 d6 BIT $d600 
3e43 : 10 fb __ BPL $3e40 ; (main.l22876 + 0)
.s2176:
3e45 : 8e 01 d6 STX $d601 
3e48 : a9 12 __ LDA #$12
3e4a : 8d 00 d6 STA $d600 
3e4d : ad 00 8b LDA $8b00 ; (vdc_state + 10)
3e50 : 85 6b __ STA T15 + 0 
3e52 : 18 __ __ CLC
3e53 : 65 1b __ ADC ACCU + 0 
3e55 : a8 __ __ TAY
3e56 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
3e59 : 85 6c __ STA T15 + 1 
3e5b : 65 1c __ ADC ACCU + 1 
.l22878:
3e5d : 2c 00 d6 BIT $d600 
3e60 : 10 fb __ BPL $3e5d ; (main.l22878 + 0)
.s2183:
3e62 : 8d 01 d6 STA $d601 
3e65 : a9 13 __ LDA #$13
3e67 : 8d 00 d6 STA $d600 
.l22880:
3e6a : 2c 00 d6 BIT $d600 
3e6d : 10 fb __ BPL $3e6a ; (main.l22880 + 0)
.s2188:
3e6f : 8c 01 d6 STY $d601 
3e72 : a9 1f __ LDA #$1f
3e74 : 8d 00 d6 STA $d600 
.l22882:
3e77 : 2c 00 d6 BIT $d600 
3e7a : 10 fb __ BPL $3e77 ; (main.l22882 + 0)
.s2192:
3e7c : a5 55 __ LDA T1 + 0 
3e7e : 8d 01 d6 STA $d601 
3e81 : a9 18 __ LDA #$18
3e83 : 8d 00 d6 STA $d600 
.l22884:
3e86 : 2c 00 d6 BIT $d600 
3e89 : 10 fb __ BPL $3e86 ; (main.l22884 + 0)
.s2198:
3e8b : ad 01 d6 LDA $d601 
3e8e : 29 7f __ AND #$7f
3e90 : a0 18 __ LDY #$18
3e92 : 8c 00 d6 STY $d600 
.l22886:
3e95 : 2c 00 d6 BIT $d600 
3e98 : 10 fb __ BPL $3e95 ; (main.l22886 + 0)
.s2204:
3e9a : 8d 01 d6 STA $d601 
3e9d : a9 1e __ LDA #$1e
3e9f : 8d 00 d6 STA $d600 
.l22888:
3ea2 : 2c 00 d6 BIT $d600 
3ea5 : 10 fb __ BPL $3ea2 ; (main.l22888 + 0)
.s2209:
3ea7 : 8e 01 d6 STX $d601 
3eaa : a5 61 __ LDA T8 + 0 
3eac : 29 20 __ AND #$20
3eae : d0 03 __ BNE $3eb3 ; (main.s2210 + 0)
3eb0 : 4c e1 2e JMP $2ee1 ; (main.s22903 + 0)
.s2210:
3eb3 : a5 64 __ LDA T11 + 0 
3eb5 : 85 0d __ STA P0 
3eb7 : ad 66 86 LDA $8666 ; (winStyles + 2)
3eba : 85 62 __ STA T9 + 0 
3ebc : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
3ebf : a9 12 __ LDA #$12
3ec1 : 8d 00 d6 STA $d600 
3ec4 : 18 __ __ CLC
3ec5 : a5 1b __ LDA ACCU + 0 
3ec7 : 65 66 __ ADC T12 + 0 
3ec9 : aa __ __ TAX
3eca : a5 1c __ LDA ACCU + 1 
3ecc : 65 67 __ ADC T12 + 1 
.l22891:
3ece : 2c 00 d6 BIT $d600 
3ed1 : 10 fb __ BPL $3ece ; (main.l22891 + 0)
.s2220:
3ed3 : 8d 01 d6 STA $d601 
3ed6 : a9 13 __ LDA #$13
3ed8 : 8d 00 d6 STA $d600 
.l22893:
3edb : 2c 00 d6 BIT $d600 
3ede : 10 fb __ BPL $3edb ; (main.l22893 + 0)
.s2225:
3ee0 : 8e 01 d6 STX $d601 
3ee3 : a9 1f __ LDA #$1f
3ee5 : 8d 00 d6 STA $d600 
.l22895:
3ee8 : 2c 00 d6 BIT $d600 
3eeb : 10 fb __ BPL $3ee8 ; (main.l22895 + 0)
.s2229:
3eed : a5 62 __ LDA T9 + 0 
3eef : 8d 01 d6 STA $d601 
3ef2 : a9 12 __ LDA #$12
3ef4 : 8d 00 d6 STA $d600 
3ef7 : 18 __ __ CLC
3ef8 : a5 1b __ LDA ACCU + 0 
3efa : 65 6b __ ADC T15 + 0 
3efc : aa __ __ TAX
3efd : a5 1c __ LDA ACCU + 1 
3eff : 65 6c __ ADC T15 + 1 
.l22897:
3f01 : 2c 00 d6 BIT $d600 
3f04 : 10 fb __ BPL $3f01 ; (main.l22897 + 0)
.s2236:
3f06 : 8d 01 d6 STA $d601 
3f09 : a9 13 __ LDA #$13
3f0b : 8d 00 d6 STA $d600 
.l22899:
3f0e : 2c 00 d6 BIT $d600 
3f11 : 10 fb __ BPL $3f0e ; (main.l22899 + 0)
.s2241:
3f13 : 8e 01 d6 STX $d601 
3f16 : a9 1f __ LDA #$1f
3f18 : 8d 00 d6 STA $d600 
.l22901:
3f1b : 2c 00 d6 BIT $d600 
3f1e : 10 fb __ BPL $3f1b ; (main.l22901 + 0)
.s2245:
3f20 : a5 55 __ LDA T1 + 0 
3f22 : 8d 01 d6 STA $d601 
3f25 : 4c e1 2e JMP $2ee1 ; (main.s22903 + 0)
.s2107:
3f28 : a6 56 __ LDX T2 + 0 
3f2a : ca __ __ DEX
3f2b : 86 0d __ STX P0 
3f2d : a6 62 __ LDX T9 + 0 
3f2f : ca __ __ DEX
3f30 : 86 0e __ STX P1 
3f32 : ad 65 86 LDA $8665 ; (winStyles + 1)
3f35 : 85 63 __ STA T10 + 0 
3f37 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
3f3a : a9 12 __ LDA #$12
3f3c : 8d 00 d6 STA $d600 
3f3f : 18 __ __ CLC
3f40 : a5 1b __ LDA ACCU + 0 
3f42 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
3f45 : aa __ __ TAX
3f46 : a5 1c __ LDA ACCU + 1 
3f48 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22854:
3f4b : 2c 00 d6 BIT $d600 
3f4e : 10 fb __ BPL $3f4b ; (main.l22854 + 0)
.s2117:
3f50 : 8d 01 d6 STA $d601 
3f53 : a9 13 __ LDA #$13
3f55 : 8d 00 d6 STA $d600 
.l22856:
3f58 : 2c 00 d6 BIT $d600 
3f5b : 10 fb __ BPL $3f58 ; (main.l22856 + 0)
.s2122:
3f5d : 8e 01 d6 STX $d601 
3f60 : a9 1f __ LDA #$1f
3f62 : 8d 00 d6 STA $d600 
.l22858:
3f65 : 2c 00 d6 BIT $d600 
3f68 : 10 fb __ BPL $3f65 ; (main.l22858 + 0)
.s2126:
3f6a : a5 63 __ LDA T10 + 0 
3f6c : 8d 01 d6 STA $d601 
3f6f : ad 00 8b LDA $8b00 ; (vdc_state + 10)
3f72 : 18 __ __ CLC
3f73 : 65 1b __ ADC ACCU + 0 
3f75 : a2 12 __ LDX #$12
3f77 : 8e 00 d6 STX $d600 
3f7a : aa __ __ TAX
3f7b : ad 01 8b LDA $8b01 ; (vdc_state + 11)
3f7e : 65 1c __ ADC ACCU + 1 
.l22860:
3f80 : 2c 00 d6 BIT $d600 
3f83 : 10 fb __ BPL $3f80 ; (main.l22860 + 0)
.s2133:
3f85 : 8d 01 d6 STA $d601 
3f88 : a9 13 __ LDA #$13
3f8a : 8d 00 d6 STA $d600 
.l22862:
3f8d : 2c 00 d6 BIT $d600 
3f90 : 10 fb __ BPL $3f8d ; (main.l22862 + 0)
.s2138:
3f92 : 8e 01 d6 STX $d601 
3f95 : a9 1f __ LDA #$1f
3f97 : 8d 00 d6 STA $d600 
.l22864:
3f9a : 2c 00 d6 BIT $d600 
3f9d : 10 fb __ BPL $3f9a ; (main.l22864 + 0)
.s2142:
3f9f : a5 55 __ LDA T1 + 0 
3fa1 : 8d 01 d6 STA $d601 
3fa4 : 4c d2 3d JMP $3dd2 ; (main.s2109 + 0)
.s2037:
3fa7 : 85 0d __ STA P0 
3fa9 : ae fb 8a LDX $8afb ; (vdc_state + 5)
3fac : ca __ __ DEX
3fad : 86 0e __ STX P1 
3faf : ad fd 8a LDA $8afd ; (vdc_state + 7)
3fb2 : 85 55 __ STA T1 + 0 
3fb4 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
3fb7 : a5 1b __ LDA ACCU + 0 
3fb9 : 85 59 __ STA T4 + 0 
3fbb : a5 1c __ LDA ACCU + 1 
3fbd : 85 5a __ STA T4 + 1 
3fbf : a9 70 __ LDA #$70
3fc1 : 85 0d __ STA P0 
3fc3 : a9 84 __ LDA #$84
3fc5 : 85 0e __ STA P1 
3fc7 : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
3fca : a5 1b __ LDA ACCU + 0 
3fcc : 85 5b __ STA T5 + 0 
3fce : a9 12 __ LDA #$12
3fd0 : 8d 00 d6 STA $d600 
3fd3 : 18 __ __ CLC
3fd4 : a5 59 __ LDA T4 + 0 
3fd6 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
3fd9 : aa __ __ TAX
3fda : a5 5a __ LDA T4 + 1 
3fdc : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22829:
3fdf : 2c 00 d6 BIT $d600 
3fe2 : 10 fb __ BPL $3fdf ; (main.l22829 + 0)
.s2047:
3fe4 : 8d 01 d6 STA $d601 
3fe7 : a9 13 __ LDA #$13
3fe9 : 8d 00 d6 STA $d600 
.l22831:
3fec : 2c 00 d6 BIT $d600 
3fef : 10 fb __ BPL $3fec ; (main.l22831 + 0)
.s2052:
3ff1 : 8e 01 d6 STX $d601 
3ff4 : a9 1f __ LDA #$1f
3ff6 : 8d 00 d6 STA $d600 
3ff9 : a5 1b __ LDA ACCU + 0 
3ffb : f0 19 __ BEQ $4016 ; (main.s2057 + 0)
.s4679:
3ffd : a2 00 __ LDX #$00
.l2055:
3fff : 86 56 __ STX T2 + 0 
4001 : bd 70 84 LDA $8470,x 
4004 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22834:
4007 : 2c 00 d6 BIT $d600 
400a : 10 fb __ BPL $4007 ; (main.l22834 + 0)
.s2060:
400c : 8d 01 d6 STA $d601 
400f : a6 56 __ LDX T2 + 0 
4011 : e8 __ __ INX
4012 : e4 5b __ CPX T5 + 0 
4014 : 90 e9 __ BCC $3fff ; (main.l2055 + 0)
.s2057:
4016 : a9 12 __ LDA #$12
4018 : 8d 00 d6 STA $d600 
401b : c6 5b __ DEC T5 + 0 
401d : ad 00 8b LDA $8b00 ; (vdc_state + 10)
4020 : 18 __ __ CLC
4021 : 65 59 __ ADC T4 + 0 
4023 : aa __ __ TAX
4024 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
4027 : 65 5a __ ADC T4 + 1 
.l22837:
4029 : 2c 00 d6 BIT $d600 
402c : 10 fb __ BPL $4029 ; (main.l22837 + 0)
.s2067:
402e : 8d 01 d6 STA $d601 
4031 : a9 13 __ LDA #$13
4033 : 8d 00 d6 STA $d600 
.l22839:
4036 : 2c 00 d6 BIT $d600 
4039 : 10 fb __ BPL $4036 ; (main.l22839 + 0)
.s2072:
403b : 8e 01 d6 STX $d601 
403e : a9 1f __ LDA #$1f
4040 : 8d 00 d6 STA $d600 
.l22841:
4043 : 2c 00 d6 BIT $d600 
4046 : 10 fb __ BPL $4043 ; (main.l22841 + 0)
.s2076:
4048 : a5 55 __ LDA T1 + 0 
404a : 8d 01 d6 STA $d601 
404d : a9 18 __ LDA #$18
404f : 8d 00 d6 STA $d600 
.l22843:
4052 : 2c 00 d6 BIT $d600 
4055 : 10 fb __ BPL $4052 ; (main.l22843 + 0)
.s2082:
4057 : ad 01 d6 LDA $d601 
405a : 29 7f __ AND #$7f
405c : a2 18 __ LDX #$18
405e : 8e 00 d6 STX $d600 
.l22845:
4061 : 2c 00 d6 BIT $d600 
4064 : 10 fb __ BPL $4061 ; (main.l22845 + 0)
.s2088:
4066 : 8d 01 d6 STA $d601 
4069 : a9 1e __ LDA #$1e
406b : 8d 00 d6 STA $d600 
.l22847:
406e : 2c 00 d6 BIT $d600 
4071 : 10 fb __ BPL $406e ; (main.l22847 + 0)
.s2093:
4073 : a5 5b __ LDA T5 + 0 
4075 : 8d 01 d6 STA $d601 
4078 : 4c 74 2e JMP $2e74 ; (main.s2039 + 0)
.s1913:
407b : 85 0e __ STA P1 
407d : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
4080 : a9 12 __ LDA #$12
4082 : 8d 00 d6 STA $d600 
4085 : 18 __ __ CLC
4086 : a5 1b __ LDA ACCU + 0 
4088 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
408b : aa __ __ TAX
408c : a5 1c __ LDA ACCU + 1 
408e : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22784:
4091 : 2c 00 d6 BIT $d600 
4094 : 10 fb __ BPL $4091 ; (main.l22784 + 0)
.s1923:
4096 : 8d 01 d6 STA $d601 
4099 : a9 13 __ LDA #$13
409b : 8d 00 d6 STA $d600 
.l22786:
409e : 2c 00 d6 BIT $d600 
40a1 : 10 fb __ BPL $409e ; (main.l22786 + 0)
.s1928:
40a3 : 8e 01 d6 STX $d601 
40a6 : a9 1f __ LDA #$1f
40a8 : 8d 00 d6 STA $d600 
.l22788:
40ab : 2c 00 d6 BIT $d600 
40ae : 10 fb __ BPL $40ab ; (main.l22788 + 0)
.s1932:
40b0 : a9 20 __ LDA #$20
40b2 : 8d 01 d6 STA $d601 
40b5 : a9 18 __ LDA #$18
40b7 : 8d 00 d6 STA $d600 
.l22790:
40ba : 2c 00 d6 BIT $d600 
40bd : 10 fb __ BPL $40ba ; (main.l22790 + 0)
.s1938:
40bf : ad 01 d6 LDA $d601 
40c2 : 29 7f __ AND #$7f
40c4 : a2 18 __ LDX #$18
40c6 : 8e 00 d6 STX $d600 
.l22792:
40c9 : 2c 00 d6 BIT $d600 
40cc : 10 fb __ BPL $40c9 ; (main.l22792 + 0)
.s1944:
40ce : 8d 01 d6 STA $d601 
40d1 : a9 1e __ LDA #$1e
40d3 : 8d 00 d6 STA $d600 
.l22794:
40d6 : 2c 00 d6 BIT $d600 
40d9 : 10 fb __ BPL $40d6 ; (main.l22794 + 0)
.s1949:
40db : a9 4f __ LDA #$4f
40dd : 8d 01 d6 STA $d601 
40e0 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
40e3 : 18 __ __ CLC
40e4 : 65 1b __ ADC ACCU + 0 
40e6 : a2 12 __ LDX #$12
40e8 : 8e 00 d6 STX $d600 
40eb : aa __ __ TAX
40ec : ad 01 8b LDA $8b01 ; (vdc_state + 11)
40ef : 65 1c __ ADC ACCU + 1 
.l22796:
40f1 : 2c 00 d6 BIT $d600 
40f4 : 10 fb __ BPL $40f1 ; (main.l22796 + 0)
.s1956:
40f6 : 8d 01 d6 STA $d601 
40f9 : a9 13 __ LDA #$13
40fb : 8d 00 d6 STA $d600 
.l22798:
40fe : 2c 00 d6 BIT $d600 
4101 : 10 fb __ BPL $40fe ; (main.l22798 + 0)
.s1961:
4103 : 8e 01 d6 STX $d601 
4106 : a9 1f __ LDA #$1f
4108 : 8d 00 d6 STA $d600 
.l22800:
410b : 2c 00 d6 BIT $d600 
410e : 10 fb __ BPL $410b ; (main.l22800 + 0)
.s1965:
4110 : a5 56 __ LDA T2 + 0 
4112 : 8d 01 d6 STA $d601 
4115 : a9 18 __ LDA #$18
4117 : 8d 00 d6 STA $d600 
.l22802:
411a : 2c 00 d6 BIT $d600 
411d : 10 fb __ BPL $411a ; (main.l22802 + 0)
.s1971:
411f : ad 01 d6 LDA $d601 
4122 : 29 7f __ AND #$7f
4124 : a2 18 __ LDX #$18
4126 : 8e 00 d6 STX $d600 
.l22804:
4129 : 2c 00 d6 BIT $d600 
412c : 10 fb __ BPL $4129 ; (main.l22804 + 0)
.s1977:
412e : 8d 01 d6 STA $d601 
4131 : a9 1e __ LDA #$1e
4133 : 8d 00 d6 STA $d600 
.l22806:
4136 : 2c 00 d6 BIT $d600 
4139 : 10 fb __ BPL $4136 ; (main.l22806 + 0)
.s1982:
413b : e6 55 __ INC T1 + 0 
413d : a9 4f __ LDA #$4f
413f : 8d 01 d6 STA $d601 
4142 : 4c 8e 2d JMP $2d8e ; (main.l1912 + 0)
.s4103:
4145 : c9 29 __ CMP #$29
4147 : b0 03 __ BCS $414c ; (main.s4106 + 0)
4149 : 4c 34 30 JMP $3034 ; (main.s1302 + 0)
.s4106:
414c : c9 2b __ CMP #$2b
414e : 90 03 __ BCC $4153 ; (main.s3648 + 0)
4150 : 4c 34 30 JMP $3034 ; (main.s1302 + 0)
.s3648:
4153 : a9 7f __ LDA #$7f
4155 : 8d d3 be STA $bed3 ; (softscroll + 0)
4158 : 38 __ __ SEC
4159 : a5 53 __ LDA T0 + 0 
415b : e9 29 __ SBC #$29
415d : 0a __ __ ASL
415e : 0a __ __ ASL
415f : aa __ __ TAX
4160 : bd e8 8a LDA $8ae8,x ; (screenset + 2)
4163 : 85 57 __ STA T3 + 0 
4165 : 8d d6 be STA $bed6 ; (softscroll + 3)
4168 : bd e6 8a LDA $8ae6,x ; (screenset + 0)
416b : 8d d4 be STA $bed4 ; (softscroll + 1)
416e : bd e7 8a LDA $8ae7,x ; (screenset + 1)
4171 : 8d d5 be STA $bed5 ; (softscroll + 2)
4174 : bd e9 8a LDA $8ae9,x ; (screenset + 3)
4177 : 85 1b __ STA ACCU + 0 
4179 : 8d d7 be STA $bed7 ; (softscroll + 4)
417c : a9 00 __ LDA #$00
417e : 85 1c __ STA ACCU + 1 
4180 : bd e8 8a LDA $8ae8,x ; (screenset + 2)
4183 : 20 b4 84 JSR $84b4 ; (mul16by8 + 0)
4186 : a5 05 __ LDA WORK + 2 
4188 : 85 59 __ STA T4 + 0 
418a : 0a __ __ ASL
418b : aa __ __ TAX
418c : a5 06 __ LDA WORK + 3 
418e : 85 5a __ STA T4 + 1 
4190 : 2a __ __ ROL
4191 : a8 __ __ TAY
4192 : 8a __ __ TXA
4193 : 18 __ __ CLC
4194 : 69 30 __ ADC #$30
4196 : 85 5b __ STA T5 + 0 
4198 : 90 01 __ BCC $419b ; (main.s2342 + 0)
.s2341:
419a : c8 __ __ INY
.s2342:
419b : 84 5c __ STY T5 + 1 
419d : a9 20 __ LDA #$20
419f : c5 5c __ CMP T5 + 1 
41a1 : d0 04 __ BNE $41a7 ; (main.s1193 + 0)
.s1192:
41a3 : a9 00 __ LDA #$00
41a5 : c5 5b __ CMP T5 + 0 
.s1193:
41a7 : b0 08 __ BCS $41b1 ; (main.s3657 + 0)
.s3658:
41a9 : ad f7 8a LDA $8af7 ; (vdc_state + 1)
41ac : d0 03 __ BNE $41b1 ; (main.s3657 + 0)
41ae : 4c 34 30 JMP $3034 ; (main.s1302 + 0)
.s3657:
41b1 : a9 e0 __ LDA #$e0
41b3 : c5 5c __ CMP T5 + 1 
41b5 : d0 04 __ BNE $41bb ; (main.s1191 + 0)
.s1190:
41b7 : a9 00 __ LDA #$00
41b9 : c5 5b __ CMP T5 + 0 
.s1191:
41bb : b0 03 __ BCS $41c0 ; (main.s3656 + 0)
41bd : 4c 34 30 JMP $3034 ; (main.s1302 + 0)
.s3656:
41c0 : ad f8 8a LDA $8af8 ; (vdc_state + 2)
41c3 : 85 13 __ STA P6 
41c5 : 20 d2 5f JSR $5fd2 ; (vdc_set_mode.s0 + 0)
41c8 : a9 00 __ LDA #$00
41ca : 85 55 __ STA T1 + 0 
41cc : 8d fe 8a STA $8afe ; (vdc_state + 8)
41cf : 8d 06 8b STA $8b06 ; (vdc_state + 16)
41d2 : 8d 07 8b STA $8b07 ; (vdc_state + 17)
41d5 : 8d 08 8b STA $8b08 ; (vdc_state + 18)
41d8 : a9 20 __ LDA #$20
41da : 8d ff 8a STA $8aff ; (vdc_state + 9)
41dd : a9 10 __ LDA #$10
41df : 8d 09 8b STA $8b09 ; (vdc_state + 19)
41e2 : 18 __ __ CLC
41e3 : a5 5a __ LDA T4 + 1 
41e5 : 69 20 __ ADC #$20
41e7 : 8d 01 8b STA $8b01 ; (vdc_state + 11)
41ea : a5 59 __ LDA T4 + 0 
41ec : 8d 00 8b STA $8b00 ; (vdc_state + 10)
41ef : ad f9 8a LDA $8af9 ; (vdc_state + 3)
41f2 : 85 5b __ STA T5 + 0 
41f4 : 49 ff __ EOR #$ff
41f6 : 38 __ __ SEC
41f7 : 65 57 __ ADC T3 + 0 
41f9 : 8d 0e 8b STA $8b0e ; (vdc_state + 24)
41fc : 20 17 64 JSR $6417 ; (vdc_set_multab.s0 + 0)
41ff : ad fb 8a LDA $8afb ; (vdc_state + 5)
4202 : 85 57 __ STA T3 + 0 
.l3662:
4204 : a5 55 __ LDA T1 + 0 
4206 : c5 57 __ CMP T3 + 0 
4208 : b0 03 __ BCS $420d ; (main.s3660 + 0)
420a : 4c c6 47 JMP $47c6 ; (main.s3663 + 0)
.s3660:
420d : a9 1c __ LDA #$1c
420f : 8d 00 d6 STA $d600 
.l22647:
4212 : 2c 00 d6 BIT $d600 
4215 : 10 fb __ BPL $4212 ; (main.l22647 + 0)
.s3739:
4217 : ad 01 d6 LDA $d601 
421a : 29 10 __ AND #$10
421c : 4d 07 8b EOR $8b07 ; (vdc_state + 17)
421f : 29 1f __ AND #$1f
4221 : 4d 07 8b EOR $8b07 ; (vdc_state + 17)
4224 : a2 1c __ LDX #$1c
4226 : 8e 00 d6 STX $d600 
.l22649:
4229 : 2c 00 d6 BIT $d600 
422c : 10 fb __ BPL $4229 ; (main.l22649 + 0)
.s3745:
422e : 8d 01 d6 STA $d601 
4231 : 20 72 64 JSR $6472 ; (vdc_restore_charsets.s0 + 0)
4234 : ad fe 8a LDA $8afe ; (vdc_state + 8)
4237 : 85 0d __ STA P0 
4239 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
423c : 85 5b __ STA T5 + 0 
423e : ad 01 8b LDA $8b01 ; (vdc_state + 11)
4241 : 85 5c __ STA T5 + 1 
4243 : a9 0c __ LDA #$0c
4245 : 8d 00 d6 STA $d600 
4248 : ae ff 8a LDX $8aff ; (vdc_state + 9)
424b : 86 0e __ STX P1 
.l22651:
424d : 2c 00 d6 BIT $d600 
4250 : 10 fb __ BPL $424d ; (main.l22651 + 0)
.s3751:
4252 : 8e 01 d6 STX $d601 
4255 : a9 0d __ LDA #$0d
4257 : 8d 00 d6 STA $d600 
.l22653:
425a : 2c 00 d6 BIT $d600 
425d : 10 fb __ BPL $425a ; (main.l22653 + 0)
.s3756:
425f : a5 0d __ LDA P0 
4261 : 8d 01 d6 STA $d601 
4264 : a9 14 __ LDA #$14
4266 : 8d 00 d6 STA $d600 
.l22655:
4269 : 2c 00 d6 BIT $d600 
426c : 10 fb __ BPL $4269 ; (main.l22655 + 0)
.s3761:
426e : a5 5c __ LDA T5 + 1 
4270 : 8d 01 d6 STA $d601 
4273 : a9 15 __ LDA #$15
4275 : 8d 00 d6 STA $d600 
.l22657:
4278 : 2c 00 d6 BIT $d600 
427b : 10 fb __ BPL $4278 ; (main.l22657 + 0)
.s3766:
427d : a5 5b __ LDA T5 + 0 
427f : 8d 01 d6 STA $d601 
4282 : a9 1b __ LDA #$1b
4284 : 8d 00 d6 STA $d600 
4287 : ae 0e 8b LDX $8b0e ; (vdc_state + 24)
.l22659:
428a : 2c 00 d6 BIT $d600 
428d : 10 fb __ BPL $428a ; (main.l22659 + 0)
.s3771:
428f : 8e 01 d6 STX $d601 
4292 : a5 59 __ LDA T4 + 0 
4294 : 85 12 __ STA P5 
4296 : a5 5a __ LDA T4 + 1 
4298 : 85 13 __ STA P6 
429a : ad d3 be LDA $bed3 ; (softscroll + 0)
429d : 85 0f __ STA P2 
429f : ad d4 be LDA $bed4 ; (softscroll + 1)
42a2 : 85 57 __ STA T3 + 0 
42a4 : 85 10 __ STA P3 
42a6 : ad d5 be LDA $bed5 ; (softscroll + 2)
42a9 : 85 58 __ STA T3 + 1 
42ab : 85 11 __ STA P4 
42ad : 20 53 14 JSR $1453 ; (bnk_cpytovdc.s0 + 0)
42b0 : a5 5b __ LDA T5 + 0 
42b2 : 85 0d __ STA P0 
42b4 : a5 5c __ LDA T5 + 1 
42b6 : 85 0e __ STA P1 
42b8 : 18 __ __ CLC
42b9 : a5 57 __ LDA T3 + 0 
42bb : 65 12 __ ADC P5 
42bd : aa __ __ TAX
42be : a5 5a __ LDA T4 + 1 
42c0 : 85 13 __ STA P6 
42c2 : 65 58 __ ADC T3 + 1 
42c4 : a8 __ __ TAY
42c5 : 8a __ __ TXA
42c6 : 18 __ __ CLC
42c7 : 69 30 __ ADC #$30
42c9 : 85 10 __ STA P3 
42cb : 90 01 __ BCC $42ce ; (main.s2344 + 0)
.s2343:
42cd : c8 __ __ INY
.s2344:
42ce : 84 11 __ STY P4 
42d0 : 20 53 14 JSR $1453 ; (bnk_cpytovdc.s0 + 0)
42d3 : a9 00 __ LDA #$00
42d5 : 8d d8 be STA $bed8 ; (softscroll + 5)
42d8 : 8d d9 be STA $bed9 ; (softscroll + 6)
42db : 8d da be STA $beda ; (softscroll + 7)
42de : 8d db be STA $bedb ; (softscroll + 8)
42e1 : a9 18 __ LDA #$18
42e3 : 8d 00 d6 STA $d600 
.l22661:
42e6 : 2c 00 d6 BIT $d600 
42e9 : 10 fb __ BPL $42e6 ; (main.l22661 + 0)
.s3776:
42eb : ad 01 d6 LDA $d601 
42ee : 29 f0 __ AND #$f0
42f0 : 8d dc be STA $bedc ; (softscroll + 9)
42f3 : a9 19 __ LDA #$19
42f5 : 8d 00 d6 STA $d600 
.l22663:
42f8 : 2c 00 d6 BIT $d600 
42fb : 10 fb __ BPL $42f8 ; (main.l22663 + 0)
.s3783:
42fd : ad 01 d6 LDA $d601 
4300 : 29 0f __ AND #$0f
4302 : 8d e0 be STA $bee0 ; (softscroll + 13)
4305 : a9 19 __ LDA #$19
4307 : 8d 00 d6 STA $d600 
.l22665:
430a : 2c 00 d6 BIT $d600 
430d : 10 fb __ BPL $430a ; (main.l22665 + 0)
.s3790:
430f : a9 00 __ LDA #$00
4311 : 8d de be STA $bede ; (softscroll + 11)
4314 : 8d df be STA $bedf ; (softscroll + 12)
4317 : ad 01 d6 LDA $d601 
431a : 29 f0 __ AND #$f0
431c : 8d dd be STA $bedd ; (softscroll + 10)
.l3794:
431f : 20 eb 5d JSR $5deb ; (getch.s0 + 0)
4322 : 85 55 __ STA T1 + 0 
4324 : c9 57 __ CMP #$57
4326 : f0 04 __ BEQ $432c ; (main.l3796 + 0)
.s3799:
4328 : c9 91 __ CMP #$91
432a : d0 20 __ BNE $434c ; (main.s3798 + 0)
.l3796:
432c : ad 00 d6 LDA $d600 
432f : 29 20 __ AND #$20
4331 : f0 f9 __ BEQ $432c ; (main.l3796 + 0)
.l3806:
4333 : ad 00 d6 LDA $d600 
4336 : 29 20 __ AND #$20
4338 : d0 f9 __ BNE $4333 ; (main.l3806 + 0)
.s3801:
433a : a9 01 __ LDA #$01
433c : cd da be CMP $beda ; (softscroll + 7)
433f : b0 03 __ BCS $4344 ; (main.s3809 + 0)
4341 : 4c ad 47 JMP $47ad ; (main.s3808 + 0)
.s3809:
4344 : ad df be LDA $bedf ; (softscroll + 12)
4347 : f0 03 __ BEQ $434c ; (main.s3798 + 0)
4349 : 4c 1f 47 JMP $471f ; (main.s3816 + 0)
.s3798:
434c : a5 55 __ LDA T1 + 0 
434e : c9 53 __ CMP #$53
4350 : f0 04 __ BEQ $4356 ; (main.l3848 + 0)
.s3851:
4352 : c9 11 __ CMP #$11
4354 : d0 33 __ BNE $4389 ; (main.s3850 + 0)
.l3848:
4356 : ad 00 d6 LDA $d600 
4359 : 29 20 __ AND #$20
435b : f0 f9 __ BEQ $4356 ; (main.l3848 + 0)
.l3858:
435d : ad 00 d6 LDA $d600 
4360 : 29 20 __ AND #$20
4362 : d0 f9 __ BNE $435d ; (main.l3858 + 0)
.s3853:
4364 : ad da be LDA $beda ; (softscroll + 7)
4367 : 85 56 __ STA T2 + 0 
4369 : 18 __ __ CLC
436a : 69 02 __ ADC #$02
436c : 8d da be STA $beda ; (softscroll + 7)
436f : c9 07 __ CMP #$07
4371 : 90 03 __ BCC $4376 ; (main.s3861 + 0)
4373 : 4c 79 46 JMP $4679 ; (main.s3860 + 0)
.s3861:
4376 : a9 18 __ LDA #$18
4378 : 8d 00 d6 STA $d600 
437b : ad dc be LDA $bedc ; (softscroll + 9)
437e : 6d da be ADC $beda ; (softscroll + 7)
.l22765:
4381 : 2c 00 d6 BIT $d600 
4384 : 10 fb __ BPL $4381 ; (main.l22765 + 0)
.s2332:
4386 : 8d 01 d6 STA $d601 
.s3850:
4389 : a5 55 __ LDA T1 + 0 
438b : c9 41 __ CMP #$41
438d : f0 04 __ BEQ $4393 ; (main.s3897 + 0)
.s3900:
438f : c9 9d __ CMP #$9d
4391 : d0 3e __ BNE $43d1 ; (main.s3899 + 0)
.s3897:
4393 : ad db be LDA $bedb ; (softscroll + 8)
4396 : 18 __ __ CLC
4397 : 69 02 __ ADC #$02
4399 : 8d db be STA $bedb ; (softscroll + 8)
439c : c9 07 __ CMP #$07
439e : b0 0e __ BCS $43ae ; (main.s3902 + 0)
.s3903:
43a0 : a9 19 __ LDA #$19
43a2 : 8d 00 d6 STA $d600 
43a5 : ad dd be LDA $bedd ; (softscroll + 10)
43a8 : 6d db be ADC $bedb ; (softscroll + 8)
43ab : 4c c8 43 JMP $43c8 ; (main.s2333 + 0)
.s3902:
43ae : ad de be LDA $bede ; (softscroll + 11)
43b1 : f0 03 __ BEQ $43b6 ; (main.s3906 + 0)
43b3 : 4c e9 45 JMP $45e9 ; (main.s3905 + 0)
.s3906:
43b6 : ad e0 be LDA $bee0 ; (softscroll + 13)
43b9 : 8d db be STA $bedb ; (softscroll + 8)
43bc : a9 19 __ LDA #$19
43be : 8d 00 d6 STA $d600 
43c1 : ad dd be LDA $bedd ; (softscroll + 10)
43c4 : 18 __ __ CLC
43c5 : 6d e0 be ADC $bee0 ; (softscroll + 13)
.s2333:
43c8 : aa __ __ TAX
.l22702:
43c9 : 2c 00 d6 BIT $d600 
43cc : 10 fb __ BPL $43c9 ; (main.l22702 + 0)
.s33995:
43ce : 8e 01 d6 STX $d601 
.s3899:
43d1 : a5 55 __ LDA T1 + 0 
43d3 : c9 44 __ CMP #$44
43d5 : f0 04 __ BEQ $43db ; (main.s3954 + 0)
.s3957:
43d7 : c9 1d __ CMP #$1d
43d9 : d0 2f __ BNE $440a ; (main.s3956 + 0)
.s3954:
43db : a9 01 __ LDA #$01
43dd : cd db be CMP $bedb ; (softscroll + 8)
43e0 : b0 03 __ BCS $43e5 ; (main.s3960 + 0)
43e2 : 4c dc 45 JMP $45dc ; (main.s3959 + 0)
.s3960:
43e5 : ad d6 be LDA $bed6 ; (softscroll + 3)
43e8 : ed f9 8a SBC $8af9 ; (vdc_state + 3)
43eb : aa __ __ TAX
43ec : a9 00 __ LDA #$00
43ee : ed fa 8a SBC $8afa ; (vdc_state + 4)
43f1 : a8 __ __ TAY
43f2 : 8a __ __ TXA
43f3 : 38 __ __ SEC
43f4 : e9 01 __ SBC #$01
43f6 : 85 57 __ STA T3 + 0 
43f8 : 98 __ __ TYA
43f9 : e9 00 __ SBC #$00
43fb : f0 03 __ BEQ $4400 ; (main.s1076 + 0)
43fd : 4c 41 45 JMP $4541 ; (main.s3970 + 0)
.s1076:
4400 : ad de be LDA $bede ; (softscroll + 11)
4403 : c5 57 __ CMP T3 + 0 
4405 : b0 03 __ BCS $440a ; (main.s3956 + 0)
4407 : 4c 41 45 JMP $4541 ; (main.s3970 + 0)
.s3956:
440a : a5 55 __ LDA T1 + 0 
440c : c9 1b __ CMP #$1b
440e : f0 07 __ BEQ $4417 ; (main.s3795 + 0)
.s4005:
4410 : c9 03 __ CMP #$03
4412 : f0 03 __ BEQ $4417 ; (main.s3795 + 0)
4414 : 4c 1f 43 JMP $431f ; (main.l3794 + 0)
.s3795:
4417 : a9 00 __ LDA #$00
4419 : 85 55 __ STA T1 + 0 
441b : ad f8 8a LDA $8af8 ; (vdc_state + 2)
441e : 85 56 __ STA T2 + 0 
4420 : ad f9 8a LDA $8af9 ; (vdc_state + 3)
4423 : 85 57 __ STA T3 + 0 
4425 : ad fb 8a LDA $8afb ; (vdc_state + 5)
4428 : 85 59 __ STA T4 + 0 
.l4009:
442a : a5 55 __ LDA T1 + 0 
442c : c5 59 __ CMP T4 + 0 
442e : 90 3d __ BCC $446d ; (main.s4010 + 0)
.s4007:
4430 : a9 1b __ LDA #$1b
4432 : 8d 00 d6 STA $d600 
.l22734:
4435 : 2c 00 d6 BIT $d600 
4438 : 10 fb __ BPL $4435 ; (main.l22734 + 0)
.s4084:
443a : a9 00 __ LDA #$00
443c : 8d 01 d6 STA $d601 
443f : a9 18 __ LDA #$18
4441 : 8d 00 d6 STA $d600 
4444 : ae dc be LDX $bedc ; (softscroll + 9)
.l22736:
4447 : 2c 00 d6 BIT $d600 
444a : 10 fb __ BPL $4447 ; (main.l22736 + 0)
.s4089:
444c : 8e 01 d6 STX $d601 
444f : a9 19 __ LDA #$19
4451 : 8d 00 d6 STA $d600 
4454 : ad e0 be LDA $bee0 ; (softscroll + 13)
4457 : 18 __ __ CLC
4458 : 6d dd be ADC $bedd ; (softscroll + 10)
.l22738:
445b : 2c 00 d6 BIT $d600 
445e : 10 fb __ BPL $445b ; (main.l22738 + 0)
.s4094:
4460 : 8d 01 d6 STA $d601 
4463 : a5 56 __ LDA T2 + 0 
4465 : 85 13 __ STA P6 
4467 : 20 d2 5f JSR $5fd2 ; (vdc_set_mode.s0 + 0)
446a : 4c 34 30 JMP $3034 ; (main.s1302 + 0)
.s4010:
446d : a9 00 __ LDA #$00
446f : 85 0d __ STA P0 
4471 : a5 55 __ LDA T1 + 0 
4473 : 85 0e __ STA P1 
4475 : ad fd 8a LDA $8afd ; (vdc_state + 7)
4478 : 85 61 __ STA T8 + 0 
447a : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
447d : a9 12 __ LDA #$12
447f : 8d 00 d6 STA $d600 
4482 : 18 __ __ CLC
4483 : a5 1b __ LDA ACCU + 0 
4485 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
4488 : a8 __ __ TAY
4489 : a5 1c __ LDA ACCU + 1 
448b : 6d ff 8a ADC $8aff ; (vdc_state + 9)
448e : a6 57 __ LDX T3 + 0 
4490 : ca __ __ DEX
.l22710:
4491 : 2c 00 d6 BIT $d600 
4494 : 10 fb __ BPL $4491 ; (main.l22710 + 0)
.s4020:
4496 : 8d 01 d6 STA $d601 
4499 : a9 13 __ LDA #$13
449b : 8d 00 d6 STA $d600 
.l22712:
449e : 2c 00 d6 BIT $d600 
44a1 : 10 fb __ BPL $449e ; (main.l22712 + 0)
.s4025:
44a3 : 8c 01 d6 STY $d601 
44a6 : a9 1f __ LDA #$1f
44a8 : 8d 00 d6 STA $d600 
.l22714:
44ab : 2c 00 d6 BIT $d600 
44ae : 10 fb __ BPL $44ab ; (main.l22714 + 0)
.s4029:
44b0 : a9 20 __ LDA #$20
44b2 : 8d 01 d6 STA $d601 
44b5 : a9 18 __ LDA #$18
44b7 : 8d 00 d6 STA $d600 
.l22716:
44ba : 2c 00 d6 BIT $d600 
44bd : 10 fb __ BPL $44ba ; (main.l22716 + 0)
.s4035:
44bf : ad 01 d6 LDA $d601 
44c2 : 29 7f __ AND #$7f
44c4 : a0 18 __ LDY #$18
44c6 : 8c 00 d6 STY $d600 
.l22718:
44c9 : 2c 00 d6 BIT $d600 
44cc : 10 fb __ BPL $44c9 ; (main.l22718 + 0)
.s4041:
44ce : 8d 01 d6 STA $d601 
44d1 : a9 1e __ LDA #$1e
44d3 : 8d 00 d6 STA $d600 
.l22720:
44d6 : 2c 00 d6 BIT $d600 
44d9 : 10 fb __ BPL $44d6 ; (main.l22720 + 0)
.s4046:
44db : 8e 01 d6 STX $d601 
44de : ad 00 8b LDA $8b00 ; (vdc_state + 10)
44e1 : 18 __ __ CLC
44e2 : 65 1b __ ADC ACCU + 0 
44e4 : a0 12 __ LDY #$12
44e6 : 8c 00 d6 STY $d600 
44e9 : a8 __ __ TAY
44ea : ad 01 8b LDA $8b01 ; (vdc_state + 11)
44ed : 65 1c __ ADC ACCU + 1 
.l22722:
44ef : 2c 00 d6 BIT $d600 
44f2 : 10 fb __ BPL $44ef ; (main.l22722 + 0)
.s4053:
44f4 : 8d 01 d6 STA $d601 
44f7 : a9 13 __ LDA #$13
44f9 : 8d 00 d6 STA $d600 
.l22724:
44fc : 2c 00 d6 BIT $d600 
44ff : 10 fb __ BPL $44fc ; (main.l22724 + 0)
.s4058:
4501 : 8c 01 d6 STY $d601 
4504 : a9 1f __ LDA #$1f
4506 : 8d 00 d6 STA $d600 
.l22726:
4509 : 2c 00 d6 BIT $d600 
450c : 10 fb __ BPL $4509 ; (main.l22726 + 0)
.s4062:
450e : a5 61 __ LDA T8 + 0 
4510 : 8d 01 d6 STA $d601 
4513 : a9 18 __ LDA #$18
4515 : 8d 00 d6 STA $d600 
.l22728:
4518 : 2c 00 d6 BIT $d600 
451b : 10 fb __ BPL $4518 ; (main.l22728 + 0)
.s4068:
451d : ad 01 d6 LDA $d601 
4520 : 29 7f __ AND #$7f
4522 : a0 18 __ LDY #$18
4524 : 8c 00 d6 STY $d600 
.l22730:
4527 : 2c 00 d6 BIT $d600 
452a : 10 fb __ BPL $4527 ; (main.l22730 + 0)
.s4074:
452c : 8d 01 d6 STA $d601 
452f : a9 1e __ LDA #$1e
4531 : 8d 00 d6 STA $d600 
.l22732:
4534 : 2c 00 d6 BIT $d600 
4537 : 10 fb __ BPL $4534 ; (main.l22732 + 0)
.s4079:
4539 : 8e 01 d6 STX $d601 
453c : e6 55 __ INC T1 + 0 
453e : 4c 2a 44 JMP $442a ; (main.l4009 + 0)
.s3970:
4541 : ad e0 be LDA $bee0 ; (softscroll + 13)
4544 : 29 01 __ AND #$01
4546 : 09 06 __ ORA #$06
4548 : 8d db be STA $bedb ; (softscroll + 8)
454b : ee de be INC $bede ; (softscroll + 11)
454e : aa __ __ TAX
454f : ad d8 be LDA $bed8 ; (softscroll + 5)
4552 : 18 __ __ CLC
4553 : 69 01 __ ADC #$01
4555 : 85 59 __ STA T4 + 0 
4557 : 8d d8 be STA $bed8 ; (softscroll + 5)
455a : ad d9 be LDA $bed9 ; (softscroll + 6)
455d : 69 00 __ ADC #$00
455f : 85 5a __ STA T4 + 1 
4561 : 8d d9 be STA $bed9 ; (softscroll + 6)
.l22743:
4564 : ad 00 d6 LDA $d600 
4567 : 29 20 __ AND #$20
4569 : d0 f9 __ BNE $4564 ; (main.l22743 + 0)
.s3973:
456b : ad 00 8b LDA $8b00 ; (vdc_state + 10)
456e : 18 __ __ CLC
456f : 65 59 __ ADC T4 + 0 
4571 : a8 __ __ TAY
4572 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
4575 : 65 5a __ ADC T4 + 1 
4577 : 85 5c __ STA T5 + 1 
4579 : ad fe 8a LDA $8afe ; (vdc_state + 8)
457c : 18 __ __ CLC
457d : 65 59 __ ADC T4 + 0 
457f : 85 59 __ STA T4 + 0 
4581 : a9 0c __ LDA #$0c
4583 : 8d 00 d6 STA $d600 
4586 : ad ff 8a LDA $8aff ; (vdc_state + 9)
4589 : 65 5a __ ADC T4 + 1 
.l22745:
458b : 2c 00 d6 BIT $d600 
458e : 10 fb __ BPL $458b ; (main.l22745 + 0)
.s3981:
4590 : 8d 01 d6 STA $d601 
4593 : a9 0d __ LDA #$0d
4595 : 8d 00 d6 STA $d600 
.l22747:
4598 : 2c 00 d6 BIT $d600 
459b : 10 fb __ BPL $4598 ; (main.l22747 + 0)
.s3986:
459d : a5 59 __ LDA T4 + 0 
459f : 8d 01 d6 STA $d601 
45a2 : a9 14 __ LDA #$14
45a4 : 8d 00 d6 STA $d600 
.l22749:
45a7 : 2c 00 d6 BIT $d600 
45aa : 10 fb __ BPL $45a7 ; (main.l22749 + 0)
.s3991:
45ac : a5 5c __ LDA T5 + 1 
45ae : 8d 01 d6 STA $d601 
45b1 : a9 15 __ LDA #$15
45b3 : 8d 00 d6 STA $d600 
.l22751:
45b6 : 2c 00 d6 BIT $d600 
45b9 : 10 fb __ BPL $45b6 ; (main.l22751 + 0)
.s3996:
45bb : 8c 01 d6 STY $d601 
.l22706:
45be : ad 00 d6 LDA $d600 
45c1 : 29 20 __ AND #$20
45c3 : f0 f9 __ BEQ $45be ; (main.l22706 + 0)
.s3962:
45c5 : a9 19 __ LDA #$19
45c7 : 8d 00 d6 STA $d600 
45ca : 8a __ __ TXA
45cb : 18 __ __ CLC
45cc : 6d dd be ADC $bedd ; (softscroll + 10)
.l22707:
45cf : 2c 00 d6 BIT $d600 
45d2 : 10 fb __ BPL $45cf ; (main.l22707 + 0)
.s33996:
45d4 : 8d 01 d6 STA $d601 
45d7 : a5 55 __ LDA T1 + 0 
45d9 : 4c 10 44 JMP $4410 ; (main.s4005 + 0)
.s3959:
45dc : ad db be LDA $bedb ; (softscroll + 8)
45df : 38 __ __ SEC
45e0 : e9 02 __ SBC #$02
45e2 : 8d db be STA $bedb ; (softscroll + 8)
45e5 : aa __ __ TAX
45e6 : 4c be 45 JMP $45be ; (main.l22706 + 0)
.s3905:
45e9 : ad e0 be LDA $bee0 ; (softscroll + 13)
45ec : 29 01 __ AND #$01
45ee : 8d db be STA $bedb ; (softscroll + 8)
45f1 : ce de be DEC $bede ; (softscroll + 11)
45f4 : ad d8 be LDA $bed8 ; (softscroll + 5)
45f7 : 18 __ __ CLC
45f8 : 69 ff __ ADC #$ff
45fa : 85 57 __ STA T3 + 0 
45fc : 8d d8 be STA $bed8 ; (softscroll + 5)
45ff : ad d9 be LDA $bed9 ; (softscroll + 6)
4602 : 69 ff __ ADC #$ff
4604 : 85 58 __ STA T3 + 1 
4606 : 8d d9 be STA $bed9 ; (softscroll + 6)
.l22690:
4609 : ad 00 d6 LDA $d600 
460c : 29 20 __ AND #$20
460e : d0 f9 __ BNE $4609 ; (main.l22690 + 0)
.s3908:
4610 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
4613 : 18 __ __ CLC
4614 : 65 57 __ ADC T3 + 0 
4616 : aa __ __ TAX
4617 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
461a : 65 58 __ ADC T3 + 1 
461c : a8 __ __ TAY
461d : ad fe 8a LDA $8afe ; (vdc_state + 8)
4620 : 18 __ __ CLC
4621 : 65 57 __ ADC T3 + 0 
4623 : 85 57 __ STA T3 + 0 
4625 : a9 0c __ LDA #$0c
4627 : 8d 00 d6 STA $d600 
462a : ad ff 8a LDA $8aff ; (vdc_state + 9)
462d : 65 58 __ ADC T3 + 1 
.l22692:
462f : 2c 00 d6 BIT $d600 
4632 : 10 fb __ BPL $462f ; (main.l22692 + 0)
.s3916:
4634 : 8d 01 d6 STA $d601 
4637 : a9 0d __ LDA #$0d
4639 : 8d 00 d6 STA $d600 
.l22694:
463c : 2c 00 d6 BIT $d600 
463f : 10 fb __ BPL $463c ; (main.l22694 + 0)
.s3921:
4641 : a5 57 __ LDA T3 + 0 
4643 : 8d 01 d6 STA $d601 
4646 : a9 14 __ LDA #$14
4648 : 8d 00 d6 STA $d600 
.l22696:
464b : 2c 00 d6 BIT $d600 
464e : 10 fb __ BPL $464b ; (main.l22696 + 0)
.s3926:
4650 : 8c 01 d6 STY $d601 
4653 : a9 15 __ LDA #$15
4655 : 8d 00 d6 STA $d600 
.l22698:
4658 : 2c 00 d6 BIT $d600 
465b : 10 fb __ BPL $4658 ; (main.l22698 + 0)
.s3931:
465d : 8e 01 d6 STX $d601 
.l22700:
4660 : ad 00 d6 LDA $d600 
4663 : 29 20 __ AND #$20
4665 : f0 f9 __ BEQ $4660 ; (main.l22700 + 0)
.l3937:
4667 : ad 00 d6 LDA $d600 
466a : 29 20 __ AND #$20
466c : d0 f9 __ BNE $4667 ; (main.l3937 + 0)
.s3932:
466e : a9 19 __ LDA #$19
4670 : 8d 00 d6 STA $d600 
4673 : ae dd be LDX $bedd ; (softscroll + 10)
4676 : 4c c9 43 JMP $43c9 ; (main.l22702 + 0)
.s3860:
4679 : ad d7 be LDA $bed7 ; (softscroll + 4)
467c : ed fb 8a SBC $8afb ; (vdc_state + 5)
467f : aa __ __ TAX
4680 : a9 00 __ LDA #$00
4682 : ed fc 8a SBC $8afc ; (vdc_state + 6)
4685 : a8 __ __ TAY
4686 : 8a __ __ TXA
4687 : 38 __ __ SEC
4688 : e9 01 __ SBC #$01
468a : 85 57 __ STA T3 + 0 
468c : 98 __ __ TYA
468d : e9 00 __ SBC #$00
468f : d0 0f __ BNE $46a0 ; (main.s3863 + 0)
.s1118:
4691 : ad df be LDA $bedf ; (softscroll + 12)
4694 : c5 57 __ CMP T3 + 0 
4696 : 90 08 __ BCC $46a0 ; (main.s3863 + 0)
.s3864:
4698 : a5 56 __ LDA T2 + 0 
469a : 8d da be STA $beda ; (softscroll + 7)
469d : 4c 89 43 JMP $4389 ; (main.s3850 + 0)
.s3863:
46a0 : a9 00 __ LDA #$00
46a2 : 8d da be STA $beda ; (softscroll + 7)
46a5 : ee df be INC $bedf ; (softscroll + 12)
46a8 : ad d8 be LDA $bed8 ; (softscroll + 5)
46ab : 18 __ __ CLC
46ac : 6d d6 be ADC $bed6 ; (softscroll + 3)
46af : 85 57 __ STA T3 + 0 
46b1 : 8d d8 be STA $bed8 ; (softscroll + 5)
46b4 : ad d9 be LDA $bed9 ; (softscroll + 6)
46b7 : 69 00 __ ADC #$00
46b9 : 85 58 __ STA T3 + 1 
46bb : 8d d9 be STA $bed9 ; (softscroll + 6)
46be : a9 18 __ LDA #$18
46c0 : 8d 00 d6 STA $d600 
46c3 : ae dc be LDX $bedc ; (softscroll + 9)
.l22677:
46c6 : 2c 00 d6 BIT $d600 
46c9 : 10 fb __ BPL $46c6 ; (main.l22677 + 0)
.s3870:
46cb : 8e 01 d6 STX $d601 
46ce : ad 00 8b LDA $8b00 ; (vdc_state + 10)
46d1 : 18 __ __ CLC
46d2 : 65 57 __ ADC T3 + 0 
46d4 : aa __ __ TAX
46d5 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
46d8 : 65 58 __ ADC T3 + 1 
46da : a8 __ __ TAY
46db : ad fe 8a LDA $8afe ; (vdc_state + 8)
46de : 18 __ __ CLC
46df : 65 57 __ ADC T3 + 0 
46e1 : 85 57 __ STA T3 + 0 
46e3 : a9 0c __ LDA #$0c
46e5 : 8d 00 d6 STA $d600 
46e8 : ad ff 8a LDA $8aff ; (vdc_state + 9)
46eb : 65 58 __ ADC T3 + 1 
.l22679:
46ed : 2c 00 d6 BIT $d600 
46f0 : 10 fb __ BPL $46ed ; (main.l22679 + 0)
.s3876:
46f2 : 8d 01 d6 STA $d601 
46f5 : a9 0d __ LDA #$0d
46f7 : 8d 00 d6 STA $d600 
.l22681:
46fa : 2c 00 d6 BIT $d600 
46fd : 10 fb __ BPL $46fa ; (main.l22681 + 0)
.s3881:
46ff : a5 57 __ LDA T3 + 0 
4701 : 8d 01 d6 STA $d601 
4704 : a9 14 __ LDA #$14
4706 : 8d 00 d6 STA $d600 
.l22683:
4709 : 2c 00 d6 BIT $d600 
470c : 10 fb __ BPL $4709 ; (main.l22683 + 0)
.s3886:
470e : 8c 01 d6 STY $d601 
4711 : a9 15 __ LDA #$15
4713 : 8d 00 d6 STA $d600 
.l22685:
4716 : 2c 00 d6 BIT $d600 
4719 : 10 fb __ BPL $4716 ; (main.l22685 + 0)
.s3891:
471b : 8a __ __ TXA
471c : 4c 86 43 JMP $4386 ; (main.s2332 + 0)
.s3816:
471f : a9 06 __ LDA #$06
4721 : 8d da be STA $beda ; (softscroll + 7)
4724 : ce df be DEC $bedf ; (softscroll + 12)
4727 : ad d8 be LDA $bed8 ; (softscroll + 5)
472a : 38 __ __ SEC
472b : ed d6 be SBC $bed6 ; (softscroll + 3)
472e : 85 57 __ STA T3 + 0 
4730 : 8d d8 be STA $bed8 ; (softscroll + 5)
4733 : ad d9 be LDA $bed9 ; (softscroll + 6)
4736 : e9 00 __ SBC #$00
4738 : 85 58 __ STA T3 + 1 
473a : 8d d9 be STA $bed9 ; (softscroll + 6)
.l22770:
473d : ad 00 d6 LDA $d600 
4740 : 29 20 __ AND #$20
4742 : d0 f9 __ BNE $473d ; (main.l22770 + 0)
.s3819:
4744 : a9 18 __ LDA #$18
4746 : 8d 00 d6 STA $d600 
4749 : ad dc be LDA $bedc ; (softscroll + 9)
474c : 18 __ __ CLC
474d : 69 06 __ ADC #$06
.l22772:
474f : 2c 00 d6 BIT $d600 
4752 : 10 fb __ BPL $474f ; (main.l22772 + 0)
.s3826:
4754 : 8d 01 d6 STA $d601 
4757 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
475a : 18 __ __ CLC
475b : 65 57 __ ADC T3 + 0 
475d : aa __ __ TAX
475e : ad 01 8b LDA $8b01 ; (vdc_state + 11)
4761 : 65 58 __ ADC T3 + 1 
4763 : a8 __ __ TAY
4764 : ad fe 8a LDA $8afe ; (vdc_state + 8)
4767 : 18 __ __ CLC
4768 : 65 57 __ ADC T3 + 0 
476a : 85 57 __ STA T3 + 0 
476c : a9 0c __ LDA #$0c
476e : 8d 00 d6 STA $d600 
4771 : ad ff 8a LDA $8aff ; (vdc_state + 9)
4774 : 65 58 __ ADC T3 + 1 
.l22774:
4776 : 2c 00 d6 BIT $d600 
4779 : 10 fb __ BPL $4776 ; (main.l22774 + 0)
.s3832:
477b : 8d 01 d6 STA $d601 
477e : a9 0d __ LDA #$0d
4780 : 8d 00 d6 STA $d600 
.l22776:
4783 : 2c 00 d6 BIT $d600 
4786 : 10 fb __ BPL $4783 ; (main.l22776 + 0)
.s3837:
4788 : a5 57 __ LDA T3 + 0 
478a : 8d 01 d6 STA $d601 
478d : a9 14 __ LDA #$14
478f : 8d 00 d6 STA $d600 
.l22778:
4792 : 2c 00 d6 BIT $d600 
4795 : 10 fb __ BPL $4792 ; (main.l22778 + 0)
.s3842:
4797 : 8c 01 d6 STY $d601 
479a : a9 15 __ LDA #$15
479c : 8d 00 d6 STA $d600 
.l22780:
479f : 2c 00 d6 BIT $d600 
47a2 : 10 fb __ BPL $479f ; (main.l22780 + 0)
.s3847:
47a4 : 8a __ __ TXA
.s2331:
47a5 : 8d 01 d6 STA $d601 
47a8 : a5 55 __ LDA T1 + 0 
47aa : 4c 52 43 JMP $4352 ; (main.s3851 + 0)
.s3808:
47ad : ce da be DEC $beda ; (softscroll + 7)
47b0 : ce da be DEC $beda ; (softscroll + 7)
47b3 : a9 18 __ LDA #$18
47b5 : 8d 00 d6 STA $d600 
47b8 : ad da be LDA $beda ; (softscroll + 7)
47bb : 6d dc be ADC $bedc ; (softscroll + 9)
.l22671:
47be : 2c 00 d6 BIT $d600 
47c1 : 10 fb __ BPL $47be ; (main.l22671 + 0)
47c3 : 4c a5 47 JMP $47a5 ; (main.s2331 + 0)
.s3663:
47c6 : a9 00 __ LDA #$00
47c8 : 85 0d __ STA P0 
47ca : a5 55 __ LDA T1 + 0 
47cc : 85 0e __ STA P1 
47ce : ad fd 8a LDA $8afd ; (vdc_state + 7)
47d1 : 85 56 __ STA T2 + 0 
47d3 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
47d6 : a9 12 __ LDA #$12
47d8 : 8d 00 d6 STA $d600 
47db : 18 __ __ CLC
47dc : a5 1b __ LDA ACCU + 0 
47de : 6d fe 8a ADC $8afe ; (vdc_state + 8)
47e1 : a8 __ __ TAY
47e2 : a5 1c __ LDA ACCU + 1 
47e4 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
47e7 : a6 5b __ LDX T5 + 0 
47e9 : ca __ __ DEX
.l22623:
47ea : 2c 00 d6 BIT $d600 
47ed : 10 fb __ BPL $47ea ; (main.l22623 + 0)
.s3673:
47ef : 8d 01 d6 STA $d601 
47f2 : a9 13 __ LDA #$13
47f4 : 8d 00 d6 STA $d600 
.l22625:
47f7 : 2c 00 d6 BIT $d600 
47fa : 10 fb __ BPL $47f7 ; (main.l22625 + 0)
.s3678:
47fc : 8c 01 d6 STY $d601 
47ff : a9 1f __ LDA #$1f
4801 : 8d 00 d6 STA $d600 
.l22627:
4804 : 2c 00 d6 BIT $d600 
4807 : 10 fb __ BPL $4804 ; (main.l22627 + 0)
.s3682:
4809 : a9 20 __ LDA #$20
480b : 8d 01 d6 STA $d601 
480e : a9 18 __ LDA #$18
4810 : 8d 00 d6 STA $d600 
.l22629:
4813 : 2c 00 d6 BIT $d600 
4816 : 10 fb __ BPL $4813 ; (main.l22629 + 0)
.s3688:
4818 : ad 01 d6 LDA $d601 
481b : 29 7f __ AND #$7f
481d : a0 18 __ LDY #$18
481f : 8c 00 d6 STY $d600 
.l22631:
4822 : 2c 00 d6 BIT $d600 
4825 : 10 fb __ BPL $4822 ; (main.l22631 + 0)
.s3694:
4827 : 8d 01 d6 STA $d601 
482a : a9 1e __ LDA #$1e
482c : 8d 00 d6 STA $d600 
.l22633:
482f : 2c 00 d6 BIT $d600 
4832 : 10 fb __ BPL $482f ; (main.l22633 + 0)
.s3699:
4834 : 8e 01 d6 STX $d601 
4837 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
483a : 18 __ __ CLC
483b : 65 1b __ ADC ACCU + 0 
483d : a0 12 __ LDY #$12
483f : 8c 00 d6 STY $d600 
4842 : a8 __ __ TAY
4843 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
4846 : 65 1c __ ADC ACCU + 1 
.l22635:
4848 : 2c 00 d6 BIT $d600 
484b : 10 fb __ BPL $4848 ; (main.l22635 + 0)
.s3706:
484d : 8d 01 d6 STA $d601 
4850 : a9 13 __ LDA #$13
4852 : 8d 00 d6 STA $d600 
.l22637:
4855 : 2c 00 d6 BIT $d600 
4858 : 10 fb __ BPL $4855 ; (main.l22637 + 0)
.s3711:
485a : 8c 01 d6 STY $d601 
485d : a9 1f __ LDA #$1f
485f : 8d 00 d6 STA $d600 
.l22639:
4862 : 2c 00 d6 BIT $d600 
4865 : 10 fb __ BPL $4862 ; (main.l22639 + 0)
.s3715:
4867 : a5 56 __ LDA T2 + 0 
4869 : 8d 01 d6 STA $d601 
486c : a9 18 __ LDA #$18
486e : 8d 00 d6 STA $d600 
.l22641:
4871 : 2c 00 d6 BIT $d600 
4874 : 10 fb __ BPL $4871 ; (main.l22641 + 0)
.s3721:
4876 : ad 01 d6 LDA $d601 
4879 : 29 7f __ AND #$7f
487b : a0 18 __ LDY #$18
487d : 8c 00 d6 STY $d600 
.l22643:
4880 : 2c 00 d6 BIT $d600 
4883 : 10 fb __ BPL $4880 ; (main.l22643 + 0)
.s3727:
4885 : 8d 01 d6 STA $d601 
4888 : a9 1e __ LDA #$1e
488a : 8d 00 d6 STA $d600 
.l22645:
488d : 2c 00 d6 BIT $d600 
4890 : 10 fb __ BPL $488d ; (main.l22645 + 0)
.s3732:
4892 : 8e 01 d6 STX $d601 
4895 : e6 55 __ INC T1 + 0 
4897 : 4c 04 42 JMP $4204 ; (main.l3662 + 0)
.s4100:
489a : c9 0b __ CMP #$0b
489c : d0 03 __ BNE $48a1 ; (main.s4101 + 0)
489e : 4c 7b 4f JMP $4f7b ; (main.s1303 + 0)
.s4101:
48a1 : c9 0c __ CMP #$0c
48a3 : f0 03 __ BEQ $48a8 ; (main.s1362 + 0)
48a5 : 4c 34 30 JMP $3034 ; (main.s1302 + 0)
.s1362:
48a8 : a9 f0 __ LDA #$f0
48aa : 85 15 __ STA P8 
48ac : a9 05 __ LDA #$05
48ae : 85 16 __ STA P9 
48b0 : 85 17 __ STA P10 
48b2 : a9 3c __ LDA #$3c
48b4 : 85 18 __ STA P11 
48b6 : a9 0f __ LDA #$0f
48b8 : 8d f8 bf STA $bff8 ; (sstack + 0)
48bb : ad fd 8a LDA $8afd ; (vdc_state + 7)
48be : 85 55 __ STA T1 + 0 
48c0 : a9 8d __ LDA #$8d
48c2 : 8d fd 8a STA $8afd ; (vdc_state + 7)
48c5 : 20 70 68 JSR $6870 ; (vdcwin_win_new.s1000 + 0)
48c8 : a9 06 __ LDA #$06
48ca : 85 0d __ STA P0 
48cc : 85 0e __ STA P1 
48ce : a9 ad __ LDA #$ad
48d0 : 8d fd 8a STA $8afd ; (vdc_state + 7)
48d3 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
48d6 : a5 1b __ LDA ACCU + 0 
48d8 : 85 53 __ STA T0 + 0 
48da : a5 1c __ LDA ACCU + 1 
48dc : 85 54 __ STA T0 + 1 
48de : a9 a3 __ LDA #$a3
48e0 : 85 0d __ STA P0 
48e2 : a9 7b __ LDA #$7b
48e4 : 85 0e __ STA P1 
48e6 : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
48e9 : a5 1b __ LDA ACCU + 0 
48eb : 85 57 __ STA T3 + 0 
48ed : a9 12 __ LDA #$12
48ef : 8d 00 d6 STA $d600 
48f2 : 18 __ __ CLC
48f3 : a5 53 __ LDA T0 + 0 
48f5 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
48f8 : aa __ __ TAX
48f9 : a5 54 __ LDA T0 + 1 
48fb : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22459:
48fe : 2c 00 d6 BIT $d600 
4901 : 10 fb __ BPL $48fe ; (main.l22459 + 0)
.s1372:
4903 : 8d 01 d6 STA $d601 
4906 : a9 13 __ LDA #$13
4908 : 8d 00 d6 STA $d600 
.l22461:
490b : 2c 00 d6 BIT $d600 
490e : 10 fb __ BPL $490b ; (main.l22461 + 0)
.s1377:
4910 : 8e 01 d6 STX $d601 
4913 : a9 1f __ LDA #$1f
4915 : 8d 00 d6 STA $d600 
4918 : a5 1b __ LDA ACCU + 0 
491a : f0 19 __ BEQ $4935 ; (main.s1382 + 0)
.s4323:
491c : a2 00 __ LDX #$00
.l1380:
491e : 86 61 __ STX T8 + 0 
4920 : bd a3 7b LDA $7ba3,x 
4923 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22464:
4926 : 2c 00 d6 BIT $d600 
4929 : 10 fb __ BPL $4926 ; (main.l22464 + 0)
.s1385:
492b : 8d 01 d6 STA $d601 
492e : a6 61 __ LDX T8 + 0 
4930 : e8 __ __ INX
4931 : e4 57 __ CPX T3 + 0 
4933 : 90 e9 __ BCC $491e ; (main.l1380 + 0)
.s1382:
4935 : a9 12 __ LDA #$12
4937 : 8d 00 d6 STA $d600 
493a : c6 57 __ DEC T3 + 0 
493c : ad 00 8b LDA $8b00 ; (vdc_state + 10)
493f : 18 __ __ CLC
4940 : 65 53 __ ADC T0 + 0 
4942 : aa __ __ TAX
4943 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
4946 : 65 54 __ ADC T0 + 1 
.l22467:
4948 : 2c 00 d6 BIT $d600 
494b : 10 fb __ BPL $4948 ; (main.l22467 + 0)
.s1392:
494d : 8d 01 d6 STA $d601 
4950 : a9 13 __ LDA #$13
4952 : 8d 00 d6 STA $d600 
.l22469:
4955 : 2c 00 d6 BIT $d600 
4958 : 10 fb __ BPL $4955 ; (main.l22469 + 0)
.s1397:
495a : 8e 01 d6 STX $d601 
495d : a9 1f __ LDA #$1f
495f : 8d 00 d6 STA $d600 
.l22471:
4962 : 2c 00 d6 BIT $d600 
4965 : 10 fb __ BPL $4962 ; (main.l22471 + 0)
.s1401:
4967 : a9 ad __ LDA #$ad
4969 : 8d 01 d6 STA $d601 
496c : a9 18 __ LDA #$18
496e : 8d 00 d6 STA $d600 
.l22473:
4971 : 2c 00 d6 BIT $d600 
4974 : 10 fb __ BPL $4971 ; (main.l22473 + 0)
.s1407:
4976 : ad 01 d6 LDA $d601 
4979 : 29 7f __ AND #$7f
497b : a2 18 __ LDX #$18
497d : 8e 00 d6 STX $d600 
.l22475:
4980 : 2c 00 d6 BIT $d600 
4983 : 10 fb __ BPL $4980 ; (main.l22475 + 0)
.s1413:
4985 : 8d 01 d6 STA $d601 
4988 : a9 1e __ LDA #$1e
498a : 8d 00 d6 STA $d600 
.l22477:
498d : 2c 00 d6 BIT $d600 
4990 : 10 fb __ BPL $498d ; (main.l22477 + 0)
.s1418:
4992 : a5 57 __ LDA T3 + 0 
4994 : 8d 01 d6 STA $d601 
4997 : a9 06 __ LDA #$06
4999 : 85 0d __ STA P0 
499b : a9 08 __ LDA #$08
499d : 85 0e __ STA P1 
499f : ad fd 8a LDA $8afd ; (vdc_state + 7)
49a2 : 29 df __ AND #$df
49a4 : 85 53 __ STA T0 + 0 
49a6 : 8d fd 8a STA $8afd ; (vdc_state + 7)
49a9 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
49ac : a5 1b __ LDA ACCU + 0 
49ae : 85 57 __ STA T3 + 0 
49b0 : a5 1c __ LDA ACCU + 1 
49b2 : 85 58 __ STA T3 + 1 
49b4 : a9 c3 __ LDA #$c3
49b6 : 85 0d __ STA P0 
49b8 : a9 7b __ LDA #$7b
49ba : 85 0e __ STA P1 
49bc : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
49bf : a5 1b __ LDA ACCU + 0 
49c1 : 85 59 __ STA T4 + 0 
49c3 : a9 12 __ LDA #$12
49c5 : 8d 00 d6 STA $d600 
49c8 : 18 __ __ CLC
49c9 : a5 57 __ LDA T3 + 0 
49cb : 6d fe 8a ADC $8afe ; (vdc_state + 8)
49ce : aa __ __ TAX
49cf : a5 58 __ LDA T3 + 1 
49d1 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22479:
49d4 : 2c 00 d6 BIT $d600 
49d7 : 10 fb __ BPL $49d4 ; (main.l22479 + 0)
.s1427:
49d9 : 8d 01 d6 STA $d601 
49dc : a9 13 __ LDA #$13
49de : 8d 00 d6 STA $d600 
.l22481:
49e1 : 2c 00 d6 BIT $d600 
49e4 : 10 fb __ BPL $49e1 ; (main.l22481 + 0)
.s1432:
49e6 : 8e 01 d6 STX $d601 
49e9 : a9 1f __ LDA #$1f
49eb : 8d 00 d6 STA $d600 
49ee : a5 1b __ LDA ACCU + 0 
49f0 : f0 19 __ BEQ $4a0b ; (main.s1437 + 0)
.s4313:
49f2 : a2 00 __ LDX #$00
.l1435:
49f4 : 86 56 __ STX T2 + 0 
49f6 : bd c3 7b LDA $7bc3,x 
49f9 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22484:
49fc : 2c 00 d6 BIT $d600 
49ff : 10 fb __ BPL $49fc ; (main.l22484 + 0)
.s1440:
4a01 : 8d 01 d6 STA $d601 
4a04 : a6 56 __ LDX T2 + 0 
4a06 : e8 __ __ INX
4a07 : e4 59 __ CPX T4 + 0 
4a09 : 90 e9 __ BCC $49f4 ; (main.l1435 + 0)
.s1437:
4a0b : a9 12 __ LDA #$12
4a0d : 8d 00 d6 STA $d600 
4a10 : c6 59 __ DEC T4 + 0 
4a12 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
4a15 : 18 __ __ CLC
4a16 : 65 57 __ ADC T3 + 0 
4a18 : aa __ __ TAX
4a19 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
4a1c : 65 58 __ ADC T3 + 1 
.l22487:
4a1e : 2c 00 d6 BIT $d600 
4a21 : 10 fb __ BPL $4a1e ; (main.l22487 + 0)
.s1447:
4a23 : 8d 01 d6 STA $d601 
4a26 : a9 13 __ LDA #$13
4a28 : 8d 00 d6 STA $d600 
.l22489:
4a2b : 2c 00 d6 BIT $d600 
4a2e : 10 fb __ BPL $4a2b ; (main.l22489 + 0)
.s1452:
4a30 : 8e 01 d6 STX $d601 
4a33 : a9 1f __ LDA #$1f
4a35 : 8d 00 d6 STA $d600 
.l22491:
4a38 : 2c 00 d6 BIT $d600 
4a3b : 10 fb __ BPL $4a38 ; (main.l22491 + 0)
.s1456:
4a3d : a5 53 __ LDA T0 + 0 
4a3f : 8d 01 d6 STA $d601 
4a42 : a9 18 __ LDA #$18
4a44 : 8d 00 d6 STA $d600 
.l22493:
4a47 : 2c 00 d6 BIT $d600 
4a4a : 10 fb __ BPL $4a47 ; (main.l22493 + 0)
.s1462:
4a4c : ad 01 d6 LDA $d601 
4a4f : 29 7f __ AND #$7f
4a51 : a2 18 __ LDX #$18
4a53 : 8e 00 d6 STX $d600 
.l22495:
4a56 : 2c 00 d6 BIT $d600 
4a59 : 10 fb __ BPL $4a56 ; (main.l22495 + 0)
.s1468:
4a5b : 8d 01 d6 STA $d601 
4a5e : a9 1e __ LDA #$1e
4a60 : 8d 00 d6 STA $d600 
.l22497:
4a63 : 2c 00 d6 BIT $d600 
4a66 : 10 fb __ BPL $4a63 ; (main.l22497 + 0)
.s1473:
4a68 : a5 59 __ LDA T4 + 0 
4a6a : 8d 01 d6 STA $d601 
4a6d : a9 06 __ LDA #$06
4a6f : 85 0d __ STA P0 
4a71 : a9 09 __ LDA #$09
4a73 : 85 0e __ STA P1 
4a75 : ad fd 8a LDA $8afd ; (vdc_state + 7)
4a78 : 85 56 __ STA T2 + 0 
4a7a : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
4a7d : a5 1b __ LDA ACCU + 0 
4a7f : 85 53 __ STA T0 + 0 
4a81 : a5 1c __ LDA ACCU + 1 
4a83 : 85 54 __ STA T0 + 1 
4a85 : a9 d4 __ LDA #$d4
4a87 : 85 0d __ STA P0 
4a89 : a9 7b __ LDA #$7b
4a8b : 85 0e __ STA P1 
4a8d : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
4a90 : a5 1b __ LDA ACCU + 0 
4a92 : 85 57 __ STA T3 + 0 
4a94 : a9 12 __ LDA #$12
4a96 : 8d 00 d6 STA $d600 
4a99 : 18 __ __ CLC
4a9a : a5 53 __ LDA T0 + 0 
4a9c : 6d fe 8a ADC $8afe ; (vdc_state + 8)
4a9f : aa __ __ TAX
4aa0 : a5 54 __ LDA T0 + 1 
4aa2 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22499:
4aa5 : 2c 00 d6 BIT $d600 
4aa8 : 10 fb __ BPL $4aa5 ; (main.l22499 + 0)
.s1481:
4aaa : 8d 01 d6 STA $d601 
4aad : a9 13 __ LDA #$13
4aaf : 8d 00 d6 STA $d600 
.l22501:
4ab2 : 2c 00 d6 BIT $d600 
4ab5 : 10 fb __ BPL $4ab2 ; (main.l22501 + 0)
.s1486:
4ab7 : 8e 01 d6 STX $d601 
4aba : a9 1f __ LDA #$1f
4abc : 8d 00 d6 STA $d600 
4abf : a5 1b __ LDA ACCU + 0 
4ac1 : f0 19 __ BEQ $4adc ; (main.s1491 + 0)
.s4303:
4ac3 : a2 00 __ LDX #$00
.l1489:
4ac5 : 86 61 __ STX T8 + 0 
4ac7 : bd d4 7b LDA $7bd4,x 
4aca : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22504:
4acd : 2c 00 d6 BIT $d600 
4ad0 : 10 fb __ BPL $4acd ; (main.l22504 + 0)
.s1494:
4ad2 : 8d 01 d6 STA $d601 
4ad5 : a6 61 __ LDX T8 + 0 
4ad7 : e8 __ __ INX
4ad8 : e4 57 __ CPX T3 + 0 
4ada : 90 e9 __ BCC $4ac5 ; (main.l1489 + 0)
.s1491:
4adc : a9 12 __ LDA #$12
4ade : 8d 00 d6 STA $d600 
4ae1 : c6 57 __ DEC T3 + 0 
4ae3 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
4ae6 : 18 __ __ CLC
4ae7 : 65 53 __ ADC T0 + 0 
4ae9 : aa __ __ TAX
4aea : ad 01 8b LDA $8b01 ; (vdc_state + 11)
4aed : 65 54 __ ADC T0 + 1 
.l22507:
4aef : 2c 00 d6 BIT $d600 
4af2 : 10 fb __ BPL $4aef ; (main.l22507 + 0)
.s1501:
4af4 : 8d 01 d6 STA $d601 
4af7 : a9 13 __ LDA #$13
4af9 : 8d 00 d6 STA $d600 
.l22509:
4afc : 2c 00 d6 BIT $d600 
4aff : 10 fb __ BPL $4afc ; (main.l22509 + 0)
.s1506:
4b01 : 8e 01 d6 STX $d601 
4b04 : a9 1f __ LDA #$1f
4b06 : 8d 00 d6 STA $d600 
.l22511:
4b09 : 2c 00 d6 BIT $d600 
4b0c : 10 fb __ BPL $4b09 ; (main.l22511 + 0)
.s1510:
4b0e : a5 56 __ LDA T2 + 0 
4b10 : 8d 01 d6 STA $d601 
4b13 : a9 18 __ LDA #$18
4b15 : 8d 00 d6 STA $d600 
.l22513:
4b18 : 2c 00 d6 BIT $d600 
4b1b : 10 fb __ BPL $4b18 ; (main.l22513 + 0)
.s1516:
4b1d : ad 01 d6 LDA $d601 
4b20 : 29 7f __ AND #$7f
4b22 : a2 18 __ LDX #$18
4b24 : 8e 00 d6 STX $d600 
.l22515:
4b27 : 2c 00 d6 BIT $d600 
4b2a : 10 fb __ BPL $4b27 ; (main.l22515 + 0)
.s1522:
4b2c : 8d 01 d6 STA $d601 
4b2f : a9 1e __ LDA #$1e
4b31 : 8d 00 d6 STA $d600 
.l22517:
4b34 : 2c 00 d6 BIT $d600 
4b37 : 10 fb __ BPL $4b34 ; (main.l22517 + 0)
.s1527:
4b39 : a5 57 __ LDA T3 + 0 
4b3b : 8d 01 d6 STA $d601 
4b3e : a9 af __ LDA #$af
4b40 : a0 02 __ LDY #$02
4b42 : 91 23 __ STA (SP + 0),y 
4b44 : a9 8b __ LDA #$8b
4b46 : c8 __ __ INY
4b47 : 91 23 __ STA (SP + 0),y 
4b49 : a9 f2 __ LDA #$f2
4b4b : c8 __ __ INY
4b4c : 91 23 __ STA (SP + 0),y 
4b4e : a9 7b __ LDA #$7b
4b50 : c8 __ __ INY
4b51 : 91 23 __ STA (SP + 0),y 
4b53 : a9 00 __ LDA #$00
4b55 : c8 __ __ INY
4b56 : 91 23 __ STA (SP + 0),y 
4b58 : a9 7c __ LDA #$7c
4b5a : c8 __ __ INY
4b5b : 91 23 __ STA (SP + 0),y 
4b5d : 20 ff 64 JSR $64ff ; (sprintf.s0 + 0)
4b60 : a9 06 __ LDA #$06
4b62 : 85 0d __ STA P0 
4b64 : a9 0b __ LDA #$0b
4b66 : 85 0e __ STA P1 
4b68 : ad fd 8a LDA $8afd ; (vdc_state + 7)
4b6b : 85 56 __ STA T2 + 0 
4b6d : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
4b70 : a5 1b __ LDA ACCU + 0 
4b72 : 85 57 __ STA T3 + 0 
4b74 : a5 1c __ LDA ACCU + 1 
4b76 : 85 58 __ STA T3 + 1 
4b78 : 20 9a 64 JSR $649a ; (strlen@proxy + 0)
4b7b : a5 1b __ LDA ACCU + 0 
4b7d : 85 53 __ STA T0 + 0 
4b7f : ad fe 8a LDA $8afe ; (vdc_state + 8)
4b82 : 18 __ __ CLC
4b83 : 65 57 __ ADC T3 + 0 
4b85 : a2 12 __ LDX #$12
4b87 : 8e 00 d6 STX $d600 
4b8a : aa __ __ TAX
4b8b : ad ff 8a LDA $8aff ; (vdc_state + 9)
4b8e : 65 58 __ ADC T3 + 1 
.l22519:
4b90 : 2c 00 d6 BIT $d600 
4b93 : 10 fb __ BPL $4b90 ; (main.l22519 + 0)
.s1535:
4b95 : 8d 01 d6 STA $d601 
4b98 : a9 13 __ LDA #$13
4b9a : 8d 00 d6 STA $d600 
.l22521:
4b9d : 2c 00 d6 BIT $d600 
4ba0 : 10 fb __ BPL $4b9d ; (main.l22521 + 0)
.s1540:
4ba2 : 8e 01 d6 STX $d601 
4ba5 : a9 1f __ LDA #$1f
4ba7 : 8d 00 d6 STA $d600 
4baa : a5 1b __ LDA ACCU + 0 
4bac : f0 19 __ BEQ $4bc7 ; (main.s1545 + 0)
.s4293:
4bae : a2 00 __ LDX #$00
.l1543:
4bb0 : 86 61 __ STX T8 + 0 
4bb2 : bd af 8b LDA $8baf,x ; (linebuffer + 0)
4bb5 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22524:
4bb8 : 2c 00 d6 BIT $d600 
4bbb : 10 fb __ BPL $4bb8 ; (main.l22524 + 0)
.s1548:
4bbd : 8d 01 d6 STA $d601 
4bc0 : a6 61 __ LDX T8 + 0 
4bc2 : e8 __ __ INX
4bc3 : e4 53 __ CPX T0 + 0 
4bc5 : 90 e9 __ BCC $4bb0 ; (main.l1543 + 0)
.s1545:
4bc7 : a9 12 __ LDA #$12
4bc9 : 8d 00 d6 STA $d600 
4bcc : c6 53 __ DEC T0 + 0 
4bce : ad 00 8b LDA $8b00 ; (vdc_state + 10)
4bd1 : 18 __ __ CLC
4bd2 : 65 57 __ ADC T3 + 0 
4bd4 : aa __ __ TAX
4bd5 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
4bd8 : 65 58 __ ADC T3 + 1 
.l22527:
4bda : 2c 00 d6 BIT $d600 
4bdd : 10 fb __ BPL $4bda ; (main.l22527 + 0)
.s1555:
4bdf : 8d 01 d6 STA $d601 
4be2 : a9 13 __ LDA #$13
4be4 : 8d 00 d6 STA $d600 
.l22529:
4be7 : 2c 00 d6 BIT $d600 
4bea : 10 fb __ BPL $4be7 ; (main.l22529 + 0)
.s1560:
4bec : 8e 01 d6 STX $d601 
4bef : a9 1f __ LDA #$1f
4bf1 : 8d 00 d6 STA $d600 
.l22531:
4bf4 : 2c 00 d6 BIT $d600 
4bf7 : 10 fb __ BPL $4bf4 ; (main.l22531 + 0)
.s1564:
4bf9 : a5 56 __ LDA T2 + 0 
4bfb : 8d 01 d6 STA $d601 
4bfe : a9 18 __ LDA #$18
4c00 : 8d 00 d6 STA $d600 
.l22533:
4c03 : 2c 00 d6 BIT $d600 
4c06 : 10 fb __ BPL $4c03 ; (main.l22533 + 0)
.s1570:
4c08 : ad 01 d6 LDA $d601 
4c0b : 29 7f __ AND #$7f
4c0d : a2 18 __ LDX #$18
4c0f : 8e 00 d6 STX $d600 
.l22535:
4c12 : 2c 00 d6 BIT $d600 
4c15 : 10 fb __ BPL $4c12 ; (main.l22535 + 0)
.s1576:
4c17 : 8d 01 d6 STA $d601 
4c1a : a9 1e __ LDA #$1e
4c1c : 8d 00 d6 STA $d600 
.l22537:
4c1f : 2c 00 d6 BIT $d600 
4c22 : 10 fb __ BPL $4c1f ; (main.l22537 + 0)
.s1581:
4c24 : a5 53 __ LDA T0 + 0 
4c26 : 8d 01 d6 STA $d601 
4c29 : a9 06 __ LDA #$06
4c2b : 85 0d __ STA P0 
4c2d : a9 0d __ LDA #$0d
4c2f : 85 0e __ STA P1 
4c31 : ad fd 8a LDA $8afd ; (vdc_state + 7)
4c34 : 85 56 __ STA T2 + 0 
4c36 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
4c39 : a5 1b __ LDA ACCU + 0 
4c3b : 85 53 __ STA T0 + 0 
4c3d : a5 1c __ LDA ACCU + 1 
4c3f : 85 54 __ STA T0 + 1 
4c41 : a9 12 __ LDA #$12
4c43 : 85 0d __ STA P0 
4c45 : a9 7c __ LDA #$7c
4c47 : 85 0e __ STA P1 
4c49 : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
4c4c : a5 1b __ LDA ACCU + 0 
4c4e : 85 57 __ STA T3 + 0 
4c50 : a9 12 __ LDA #$12
4c52 : 8d 00 d6 STA $d600 
4c55 : 18 __ __ CLC
4c56 : a5 53 __ LDA T0 + 0 
4c58 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
4c5b : aa __ __ TAX
4c5c : a5 54 __ LDA T0 + 1 
4c5e : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22539:
4c61 : 2c 00 d6 BIT $d600 
4c64 : 10 fb __ BPL $4c61 ; (main.l22539 + 0)
.s1589:
4c66 : 8d 01 d6 STA $d601 
4c69 : a9 13 __ LDA #$13
4c6b : 8d 00 d6 STA $d600 
.l22541:
4c6e : 2c 00 d6 BIT $d600 
4c71 : 10 fb __ BPL $4c6e ; (main.l22541 + 0)
.s1594:
4c73 : 8e 01 d6 STX $d601 
4c76 : a9 1f __ LDA #$1f
4c78 : 8d 00 d6 STA $d600 
4c7b : a5 1b __ LDA ACCU + 0 
4c7d : f0 19 __ BEQ $4c98 ; (main.s1599 + 0)
.s4283:
4c7f : a2 00 __ LDX #$00
.l1597:
4c81 : 86 61 __ STX T8 + 0 
4c83 : bd 12 7c LDA $7c12,x 
4c86 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22544:
4c89 : 2c 00 d6 BIT $d600 
4c8c : 10 fb __ BPL $4c89 ; (main.l22544 + 0)
.s1602:
4c8e : 8d 01 d6 STA $d601 
4c91 : a6 61 __ LDX T8 + 0 
4c93 : e8 __ __ INX
4c94 : e4 57 __ CPX T3 + 0 
4c96 : 90 e9 __ BCC $4c81 ; (main.l1597 + 0)
.s1599:
4c98 : a9 12 __ LDA #$12
4c9a : 8d 00 d6 STA $d600 
4c9d : c6 57 __ DEC T3 + 0 
4c9f : ad 00 8b LDA $8b00 ; (vdc_state + 10)
4ca2 : 18 __ __ CLC
4ca3 : 65 53 __ ADC T0 + 0 
4ca5 : aa __ __ TAX
4ca6 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
4ca9 : 65 54 __ ADC T0 + 1 
.l22547:
4cab : 2c 00 d6 BIT $d600 
4cae : 10 fb __ BPL $4cab ; (main.l22547 + 0)
.s1609:
4cb0 : 8d 01 d6 STA $d601 
4cb3 : a9 13 __ LDA #$13
4cb5 : 8d 00 d6 STA $d600 
.l22549:
4cb8 : 2c 00 d6 BIT $d600 
4cbb : 10 fb __ BPL $4cb8 ; (main.l22549 + 0)
.s1614:
4cbd : 8e 01 d6 STX $d601 
4cc0 : a9 1f __ LDA #$1f
4cc2 : 8d 00 d6 STA $d600 
.l22551:
4cc5 : 2c 00 d6 BIT $d600 
4cc8 : 10 fb __ BPL $4cc5 ; (main.l22551 + 0)
.s1618:
4cca : a5 56 __ LDA T2 + 0 
4ccc : 8d 01 d6 STA $d601 
4ccf : a9 18 __ LDA #$18
4cd1 : 8d 00 d6 STA $d600 
.l22553:
4cd4 : 2c 00 d6 BIT $d600 
4cd7 : 10 fb __ BPL $4cd4 ; (main.l22553 + 0)
.s1624:
4cd9 : ad 01 d6 LDA $d601 
4cdc : 29 7f __ AND #$7f
4cde : a2 18 __ LDX #$18
4ce0 : 8e 00 d6 STX $d600 
.l22555:
4ce3 : 2c 00 d6 BIT $d600 
4ce6 : 10 fb __ BPL $4ce3 ; (main.l22555 + 0)
.s1630:
4ce8 : 8d 01 d6 STA $d601 
4ceb : a9 1e __ LDA #$1e
4ced : 8d 00 d6 STA $d600 
.l22557:
4cf0 : 2c 00 d6 BIT $d600 
4cf3 : 10 fb __ BPL $4cf0 ; (main.l22557 + 0)
.s1635:
4cf5 : a5 57 __ LDA T3 + 0 
4cf7 : 8d 01 d6 STA $d601 
4cfa : a9 06 __ LDA #$06
4cfc : 85 0d __ STA P0 
4cfe : a9 0e __ LDA #$0e
4d00 : 85 0e __ STA P1 
4d02 : ad fd 8a LDA $8afd ; (vdc_state + 7)
4d05 : 85 56 __ STA T2 + 0 
4d07 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
4d0a : a5 1b __ LDA ACCU + 0 
4d0c : 85 53 __ STA T0 + 0 
4d0e : a5 1c __ LDA ACCU + 1 
4d10 : 85 54 __ STA T0 + 1 
4d12 : a9 42 __ LDA #$42
4d14 : 85 0d __ STA P0 
4d16 : a9 7c __ LDA #$7c
4d18 : 85 0e __ STA P1 
4d1a : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
4d1d : a5 1b __ LDA ACCU + 0 
4d1f : 85 57 __ STA T3 + 0 
4d21 : a9 12 __ LDA #$12
4d23 : 8d 00 d6 STA $d600 
4d26 : 18 __ __ CLC
4d27 : a5 53 __ LDA T0 + 0 
4d29 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
4d2c : aa __ __ TAX
4d2d : a5 54 __ LDA T0 + 1 
4d2f : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22559:
4d32 : 2c 00 d6 BIT $d600 
4d35 : 10 fb __ BPL $4d32 ; (main.l22559 + 0)
.s1643:
4d37 : 8d 01 d6 STA $d601 
4d3a : a9 13 __ LDA #$13
4d3c : 8d 00 d6 STA $d600 
.l22561:
4d3f : 2c 00 d6 BIT $d600 
4d42 : 10 fb __ BPL $4d3f ; (main.l22561 + 0)
.s1648:
4d44 : 8e 01 d6 STX $d601 
4d47 : a9 1f __ LDA #$1f
4d49 : 8d 00 d6 STA $d600 
4d4c : a5 1b __ LDA ACCU + 0 
4d4e : f0 19 __ BEQ $4d69 ; (main.s1653 + 0)
.s4273:
4d50 : a2 00 __ LDX #$00
.l1651:
4d52 : 86 61 __ STX T8 + 0 
4d54 : bd 42 7c LDA $7c42,x 
4d57 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22564:
4d5a : 2c 00 d6 BIT $d600 
4d5d : 10 fb __ BPL $4d5a ; (main.l22564 + 0)
.s1656:
4d5f : 8d 01 d6 STA $d601 
4d62 : a6 61 __ LDX T8 + 0 
4d64 : e8 __ __ INX
4d65 : e4 57 __ CPX T3 + 0 
4d67 : 90 e9 __ BCC $4d52 ; (main.l1651 + 0)
.s1653:
4d69 : a9 12 __ LDA #$12
4d6b : 8d 00 d6 STA $d600 
4d6e : c6 57 __ DEC T3 + 0 
4d70 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
4d73 : 18 __ __ CLC
4d74 : 65 53 __ ADC T0 + 0 
4d76 : aa __ __ TAX
4d77 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
4d7a : 65 54 __ ADC T0 + 1 
.l22567:
4d7c : 2c 00 d6 BIT $d600 
4d7f : 10 fb __ BPL $4d7c ; (main.l22567 + 0)
.s1663:
4d81 : 8d 01 d6 STA $d601 
4d84 : a9 13 __ LDA #$13
4d86 : 8d 00 d6 STA $d600 
.l22569:
4d89 : 2c 00 d6 BIT $d600 
4d8c : 10 fb __ BPL $4d89 ; (main.l22569 + 0)
.s1668:
4d8e : 8e 01 d6 STX $d601 
4d91 : a9 1f __ LDA #$1f
4d93 : 8d 00 d6 STA $d600 
.l22571:
4d96 : 2c 00 d6 BIT $d600 
4d99 : 10 fb __ BPL $4d96 ; (main.l22571 + 0)
.s1672:
4d9b : a5 56 __ LDA T2 + 0 
4d9d : 8d 01 d6 STA $d601 
4da0 : a9 18 __ LDA #$18
4da2 : 8d 00 d6 STA $d600 
.l22573:
4da5 : 2c 00 d6 BIT $d600 
4da8 : 10 fb __ BPL $4da5 ; (main.l22573 + 0)
.s1678:
4daa : ad 01 d6 LDA $d601 
4dad : 29 7f __ AND #$7f
4daf : a2 18 __ LDX #$18
4db1 : 8e 00 d6 STX $d600 
.l22575:
4db4 : 2c 00 d6 BIT $d600 
4db7 : 10 fb __ BPL $4db4 ; (main.l22575 + 0)
.s1684:
4db9 : 8d 01 d6 STA $d601 
4dbc : a9 1e __ LDA #$1e
4dbe : 8d 00 d6 STA $d600 
.l22577:
4dc1 : 2c 00 d6 BIT $d600 
4dc4 : 10 fb __ BPL $4dc1 ; (main.l22577 + 0)
.s1689:
4dc6 : a5 57 __ LDA T3 + 0 
4dc8 : 8d 01 d6 STA $d601 
4dcb : a9 06 __ LDA #$06
4dcd : 85 0d __ STA P0 
4dcf : a9 10 __ LDA #$10
4dd1 : 85 0e __ STA P1 
4dd3 : ad fd 8a LDA $8afd ; (vdc_state + 7)
4dd6 : 85 56 __ STA T2 + 0 
4dd8 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
4ddb : a5 1b __ LDA ACCU + 0 
4ddd : 85 53 __ STA T0 + 0 
4ddf : a5 1c __ LDA ACCU + 1 
4de1 : 85 54 __ STA T0 + 1 
4de3 : a9 69 __ LDA #$69
4de5 : 85 0d __ STA P0 
4de7 : a9 7c __ LDA #$7c
4de9 : 85 0e __ STA P1 
4deb : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
4dee : a5 1b __ LDA ACCU + 0 
4df0 : 85 57 __ STA T3 + 0 
4df2 : a9 12 __ LDA #$12
4df4 : 8d 00 d6 STA $d600 
4df7 : 18 __ __ CLC
4df8 : a5 53 __ LDA T0 + 0 
4dfa : 6d fe 8a ADC $8afe ; (vdc_state + 8)
4dfd : aa __ __ TAX
4dfe : a5 54 __ LDA T0 + 1 
4e00 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22579:
4e03 : 2c 00 d6 BIT $d600 
4e06 : 10 fb __ BPL $4e03 ; (main.l22579 + 0)
.s1697:
4e08 : 8d 01 d6 STA $d601 
4e0b : a9 13 __ LDA #$13
4e0d : 8d 00 d6 STA $d600 
.l22581:
4e10 : 2c 00 d6 BIT $d600 
4e13 : 10 fb __ BPL $4e10 ; (main.l22581 + 0)
.s1702:
4e15 : 8e 01 d6 STX $d601 
4e18 : a9 1f __ LDA #$1f
4e1a : 8d 00 d6 STA $d600 
4e1d : a5 1b __ LDA ACCU + 0 
4e1f : f0 19 __ BEQ $4e3a ; (main.s1707 + 0)
.s4263:
4e21 : a2 00 __ LDX #$00
.l1705:
4e23 : 86 61 __ STX T8 + 0 
4e25 : bd 69 7c LDA $7c69,x 
4e28 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22584:
4e2b : 2c 00 d6 BIT $d600 
4e2e : 10 fb __ BPL $4e2b ; (main.l22584 + 0)
.s1710:
4e30 : 8d 01 d6 STA $d601 
4e33 : a6 61 __ LDX T8 + 0 
4e35 : e8 __ __ INX
4e36 : e4 57 __ CPX T3 + 0 
4e38 : 90 e9 __ BCC $4e23 ; (main.l1705 + 0)
.s1707:
4e3a : a9 12 __ LDA #$12
4e3c : 8d 00 d6 STA $d600 
4e3f : c6 57 __ DEC T3 + 0 
4e41 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
4e44 : 18 __ __ CLC
4e45 : 65 53 __ ADC T0 + 0 
4e47 : aa __ __ TAX
4e48 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
4e4b : 65 54 __ ADC T0 + 1 
.l22587:
4e4d : 2c 00 d6 BIT $d600 
4e50 : 10 fb __ BPL $4e4d ; (main.l22587 + 0)
.s1717:
4e52 : 8d 01 d6 STA $d601 
4e55 : a9 13 __ LDA #$13
4e57 : 8d 00 d6 STA $d600 
.l22589:
4e5a : 2c 00 d6 BIT $d600 
4e5d : 10 fb __ BPL $4e5a ; (main.l22589 + 0)
.s1722:
4e5f : 8e 01 d6 STX $d601 
4e62 : a9 1f __ LDA #$1f
4e64 : 8d 00 d6 STA $d600 
.l22591:
4e67 : 2c 00 d6 BIT $d600 
4e6a : 10 fb __ BPL $4e67 ; (main.l22591 + 0)
.s1726:
4e6c : a5 56 __ LDA T2 + 0 
4e6e : 8d 01 d6 STA $d601 
4e71 : a9 18 __ LDA #$18
4e73 : 8d 00 d6 STA $d600 
.l22593:
4e76 : 2c 00 d6 BIT $d600 
4e79 : 10 fb __ BPL $4e76 ; (main.l22593 + 0)
.s1732:
4e7b : ad 01 d6 LDA $d601 
4e7e : 29 7f __ AND #$7f
4e80 : a2 18 __ LDX #$18
4e82 : 8e 00 d6 STX $d600 
.l22595:
4e85 : 2c 00 d6 BIT $d600 
4e88 : 10 fb __ BPL $4e85 ; (main.l22595 + 0)
.s1738:
4e8a : 8d 01 d6 STA $d601 
4e8d : a9 1e __ LDA #$1e
4e8f : 8d 00 d6 STA $d600 
.l22597:
4e92 : 2c 00 d6 BIT $d600 
4e95 : 10 fb __ BPL $4e92 ; (main.l22597 + 0)
.s1743:
4e97 : a5 57 __ LDA T3 + 0 
4e99 : 8d 01 d6 STA $d601 
4e9c : a9 06 __ LDA #$06
4e9e : 85 0d __ STA P0 
4ea0 : a9 12 __ LDA #$12
4ea2 : 85 0e __ STA P1 
4ea4 : ad fd 8a LDA $8afd ; (vdc_state + 7)
4ea7 : 85 56 __ STA T2 + 0 
4ea9 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
4eac : a5 1b __ LDA ACCU + 0 
4eae : 85 53 __ STA T0 + 0 
4eb0 : a5 1c __ LDA ACCU + 1 
4eb2 : 85 54 __ STA T0 + 1 
4eb4 : a9 86 __ LDA #$86
4eb6 : 85 0d __ STA P0 
4eb8 : a9 7c __ LDA #$7c
4eba : 85 0e __ STA P1 
4ebc : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
4ebf : a5 1b __ LDA ACCU + 0 
4ec1 : 85 57 __ STA T3 + 0 
4ec3 : a9 12 __ LDA #$12
4ec5 : 8d 00 d6 STA $d600 
4ec8 : 18 __ __ CLC
4ec9 : a5 53 __ LDA T0 + 0 
4ecb : 6d fe 8a ADC $8afe ; (vdc_state + 8)
4ece : aa __ __ TAX
4ecf : a5 54 __ LDA T0 + 1 
4ed1 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22599:
4ed4 : 2c 00 d6 BIT $d600 
4ed7 : 10 fb __ BPL $4ed4 ; (main.l22599 + 0)
.s1751:
4ed9 : 8d 01 d6 STA $d601 
4edc : a9 13 __ LDA #$13
4ede : 8d 00 d6 STA $d600 
.l22601:
4ee1 : 2c 00 d6 BIT $d600 
4ee4 : 10 fb __ BPL $4ee1 ; (main.l22601 + 0)
.s1756:
4ee6 : 8e 01 d6 STX $d601 
4ee9 : a9 1f __ LDA #$1f
4eeb : 8d 00 d6 STA $d600 
4eee : a5 1b __ LDA ACCU + 0 
4ef0 : f0 19 __ BEQ $4f0b ; (main.s1761 + 0)
.s4253:
4ef2 : a2 00 __ LDX #$00
.l1759:
4ef4 : 86 61 __ STX T8 + 0 
4ef6 : bd 86 7c LDA $7c86,x 
4ef9 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22604:
4efc : 2c 00 d6 BIT $d600 
4eff : 10 fb __ BPL $4efc ; (main.l22604 + 0)
.s1764:
4f01 : 8d 01 d6 STA $d601 
4f04 : a6 61 __ LDX T8 + 0 
4f06 : e8 __ __ INX
4f07 : e4 57 __ CPX T3 + 0 
4f09 : 90 e9 __ BCC $4ef4 ; (main.l1759 + 0)
.s1761:
4f0b : a9 12 __ LDA #$12
4f0d : 8d 00 d6 STA $d600 
4f10 : c6 57 __ DEC T3 + 0 
4f12 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
4f15 : 18 __ __ CLC
4f16 : 65 53 __ ADC T0 + 0 
4f18 : aa __ __ TAX
4f19 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
4f1c : 65 54 __ ADC T0 + 1 
.l22607:
4f1e : 2c 00 d6 BIT $d600 
4f21 : 10 fb __ BPL $4f1e ; (main.l22607 + 0)
.s1771:
4f23 : 8d 01 d6 STA $d601 
4f26 : a9 13 __ LDA #$13
4f28 : 8d 00 d6 STA $d600 
.l22609:
4f2b : 2c 00 d6 BIT $d600 
4f2e : 10 fb __ BPL $4f2b ; (main.l22609 + 0)
.s1776:
4f30 : 8e 01 d6 STX $d601 
4f33 : a9 1f __ LDA #$1f
4f35 : 8d 00 d6 STA $d600 
.l22611:
4f38 : 2c 00 d6 BIT $d600 
4f3b : 10 fb __ BPL $4f38 ; (main.l22611 + 0)
.s1780:
4f3d : a5 56 __ LDA T2 + 0 
4f3f : 8d 01 d6 STA $d601 
4f42 : a9 18 __ LDA #$18
4f44 : 8d 00 d6 STA $d600 
.l22613:
4f47 : 2c 00 d6 BIT $d600 
4f4a : 10 fb __ BPL $4f47 ; (main.l22613 + 0)
.s1786:
4f4c : ad 01 d6 LDA $d601 
4f4f : 29 7f __ AND #$7f
4f51 : a2 18 __ LDX #$18
4f53 : 8e 00 d6 STX $d600 
.l22615:
4f56 : 2c 00 d6 BIT $d600 
4f59 : 10 fb __ BPL $4f56 ; (main.l22615 + 0)
.s1792:
4f5b : 8d 01 d6 STA $d601 
4f5e : a9 1e __ LDA #$1e
4f60 : 8d 00 d6 STA $d600 
.l22617:
4f63 : 2c 00 d6 BIT $d600 
4f66 : 10 fb __ BPL $4f63 ; (main.l22617 + 0)
.s1797:
4f68 : a5 57 __ LDA T3 + 0 
4f6a : 8d 01 d6 STA $d601 
4f6d : 20 eb 5d JSR $5deb ; (getch.s0 + 0)
4f70 : 20 6c 71 JSR $716c ; (vdcwin_win_free.s0 + 0)
.s22432:
4f73 : a5 55 __ LDA T1 + 0 
4f75 : 8d fd 8a STA $8afd ; (vdc_state + 7)
4f78 : 4c a1 24 JMP $24a1 ; (main.l686 + 0)
.s1303:
4f7b : a9 f0 __ LDA #$f0
4f7d : 85 15 __ STA P8 
4f7f : a9 08 __ LDA #$08
4f81 : 85 16 __ STA P9 
4f83 : 85 17 __ STA P10 
4f85 : a9 1e __ LDA #$1e
4f87 : 85 18 __ STA P11 
4f89 : a9 0a __ LDA #$0a
4f8b : 8d f8 bf STA $bff8 ; (sstack + 0)
4f8e : ad fd 8a LDA $8afd ; (vdc_state + 7)
4f91 : 85 55 __ STA T1 + 0 
4f93 : a9 8d __ LDA #$8d
4f95 : 8d fd 8a STA $8afd ; (vdc_state + 7)
4f98 : 20 70 68 JSR $6870 ; (vdcwin_win_new.s1000 + 0)
4f9b : 20 59 86 JSR $8659 ; (vdc_coords@proxy + 0)
4f9e : a5 1b __ LDA ACCU + 0 
4fa0 : 85 53 __ STA T0 + 0 
4fa2 : a5 1c __ LDA ACCU + 1 
4fa4 : 85 54 __ STA T0 + 1 
4fa6 : a9 90 __ LDA #$90
4fa8 : 85 0d __ STA P0 
4faa : a9 7b __ LDA #$7b
4fac : 85 0e __ STA P1 
4fae : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
4fb1 : a5 1b __ LDA ACCU + 0 
4fb3 : 85 57 __ STA T3 + 0 
4fb5 : a9 12 __ LDA #$12
4fb7 : 8d 00 d6 STA $d600 
4fba : 18 __ __ CLC
4fbb : a5 53 __ LDA T0 + 0 
4fbd : 6d fe 8a ADC $8afe ; (vdc_state + 8)
4fc0 : aa __ __ TAX
4fc1 : a5 54 __ LDA T0 + 1 
4fc3 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22411:
4fc6 : 2c 00 d6 BIT $d600 
4fc9 : 10 fb __ BPL $4fc6 ; (main.l22411 + 0)
.s1312:
4fcb : 8d 01 d6 STA $d601 
4fce : a9 13 __ LDA #$13
4fd0 : 8d 00 d6 STA $d600 
.l22413:
4fd3 : 2c 00 d6 BIT $d600 
4fd6 : 10 fb __ BPL $4fd3 ; (main.l22413 + 0)
.s1317:
4fd8 : 8e 01 d6 STX $d601 
4fdb : a9 1f __ LDA #$1f
4fdd : 8d 00 d6 STA $d600 
4fe0 : a5 1b __ LDA ACCU + 0 
4fe2 : f0 19 __ BEQ $4ffd ; (main.s1322 + 0)
.s4243:
4fe4 : a2 00 __ LDX #$00
.l1320:
4fe6 : 86 56 __ STX T2 + 0 
4fe8 : bd 90 7b LDA $7b90,x 
4feb : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l22416:
4fee : 2c 00 d6 BIT $d600 
4ff1 : 10 fb __ BPL $4fee ; (main.l22416 + 0)
.s1325:
4ff3 : 8d 01 d6 STA $d601 
4ff6 : a6 56 __ LDX T2 + 0 
4ff8 : e8 __ __ INX
4ff9 : e4 57 __ CPX T3 + 0 
4ffb : 90 e9 __ BCC $4fe6 ; (main.l1320 + 0)
.s1322:
4ffd : a9 12 __ LDA #$12
4fff : 8d 00 d6 STA $d600 
5002 : c6 57 __ DEC T3 + 0 
5004 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
5007 : 18 __ __ CLC
5008 : 65 53 __ ADC T0 + 0 
500a : aa __ __ TAX
500b : ad 01 8b LDA $8b01 ; (vdc_state + 11)
500e : 65 54 __ ADC T0 + 1 
.l22419:
5010 : 2c 00 d6 BIT $d600 
5013 : 10 fb __ BPL $5010 ; (main.l22419 + 0)
.s1332:
5015 : 8d 01 d6 STA $d601 
5018 : a9 13 __ LDA #$13
501a : 8d 00 d6 STA $d600 
.l22421:
501d : 2c 00 d6 BIT $d600 
5020 : 10 fb __ BPL $501d ; (main.l22421 + 0)
.s1337:
5022 : 8e 01 d6 STX $d601 
5025 : a9 1f __ LDA #$1f
5027 : 8d 00 d6 STA $d600 
.l22423:
502a : 2c 00 d6 BIT $d600 
502d : 10 fb __ BPL $502a ; (main.l22423 + 0)
.s1341:
502f : a9 8d __ LDA #$8d
5031 : 8d 01 d6 STA $d601 
5034 : a9 18 __ LDA #$18
5036 : 8d 00 d6 STA $d600 
.l22425:
5039 : 2c 00 d6 BIT $d600 
503c : 10 fb __ BPL $5039 ; (main.l22425 + 0)
.s1347:
503e : ad 01 d6 LDA $d601 
5041 : 29 7f __ AND #$7f
5043 : a2 18 __ LDX #$18
5045 : 8e 00 d6 STX $d600 
.l22427:
5048 : 2c 00 d6 BIT $d600 
504b : 10 fb __ BPL $5048 ; (main.l22427 + 0)
.s1353:
504d : 8d 01 d6 STA $d601 
5050 : a9 1e __ LDA #$1e
5052 : 8d 00 d6 STA $d600 
.l22429:
5055 : 2c 00 d6 BIT $d600 
5058 : 10 fb __ BPL $5055 ; (main.l22429 + 0)
.s1358:
505a : a5 57 __ LDA T3 + 0 
505c : 8d 01 d6 STA $d601 
505f : a9 19 __ LDA #$19
5061 : 8d fd bf STA $bffd ; (sstack + 5)
5064 : a9 0b __ LDA #$0b
5066 : 8d fe bf STA $bffe ; (sstack + 6)
5069 : a9 06 __ LDA #$06
506b : 8d ff bf STA $bfff ; (sstack + 7)
506e : 20 2c 77 JSR $772c ; (menu_pulldown.s1000 + 0)
5071 : a5 1b __ LDA ACCU + 0 
5073 : 85 56 __ STA T2 + 0 
5075 : 20 6c 71 JSR $716c ; (vdcwin_win_free.s0 + 0)
5078 : a6 56 __ LDX T2 + 0 
507a : d0 03 __ BNE $507f ; (main.s1359 + 0)
507c : 4c 73 4f JMP $4f73 ; (main.s22432 + 0)
.s1359:
507f : ca __ __ DEX
5080 : 86 13 __ STX P6 
5082 : 20 d2 5f JSR $5fd2 ; (vdc_set_mode.s0 + 0)
5085 : 4c 73 4f JMP $4f73 ; (main.s22432 + 0)
.s1798:
5088 : ad 08 dc LDA $dc08 
508b : 18 __ __ CLC
508c : 6d 09 dc ADC $dc09 
508f : aa __ __ TAX
5090 : a9 00 __ LDA #$00
5092 : 85 55 __ STA T1 + 0 
5094 : 2a __ __ ROL
5095 : a8 __ __ TAY
5096 : 8a __ __ TXA
5097 : 69 01 __ ADC #$01
5099 : 8d fe 72 STA $72fe ; (seed + 0)
509c : 90 01 __ BCC $509f ; (main.s2340 + 0)
.s2339:
509e : c8 __ __ INY
.s2340:
509f : 8c ff 72 STY $72ff ; (seed + 1)
.l1801:
50a2 : a9 28 __ LDA #$28
50a4 : 85 18 __ STA P11 
50a6 : a5 55 __ LDA T1 + 0 
50a8 : 29 01 __ AND #$01
50aa : 09 f0 __ ORA #$f0
50ac : 85 15 __ STA P8 
50ae : a5 55 __ LDA T1 + 0 
50b0 : 0a __ __ ASL
50b1 : 0a __ __ ASL
50b2 : 18 __ __ CLC
50b3 : 65 55 __ ADC T1 + 0 
50b5 : 18 __ __ CLC
50b6 : 69 05 __ ADC #$05
50b8 : 85 16 __ STA P9 
50ba : a5 55 __ LDA T1 + 0 
50bc : 0a __ __ ASL
50bd : 18 __ __ CLC
50be : 65 55 __ ADC T1 + 0 
50c0 : 18 __ __ CLC
50c1 : 69 05 __ ADC #$05
50c3 : 85 17 __ STA P10 
50c5 : ad fb 8a LDA $8afb ; (vdc_state + 5)
50c8 : 85 1b __ STA ACCU + 0 
50ca : ad fc 8a LDA $8afc ; (vdc_state + 6)
50cd : 85 1c __ STA ACCU + 1 
50cf : a9 03 __ LDA #$03
50d1 : 85 03 __ STA WORK + 0 
50d3 : a9 00 __ LDA #$00
50d5 : 85 04 __ STA WORK + 1 
50d7 : 20 16 85 JSR $8516 ; (divmod + 0)
50da : a5 1b __ LDA ACCU + 0 
50dc : 8d f8 bf STA $bff8 ; (sstack + 0)
50df : 20 70 68 JSR $6870 ; (vdcwin_win_new.s1000 + 0)
50e2 : a9 64 __ LDA #$64
50e4 : 85 56 __ STA T2 + 0 
.l1804:
50e6 : 20 9f 7c JSR $7c9f ; (rand.s0 + 0)
50e9 : a9 af __ LDA #$af
50eb : 8d fd bf STA $bffd ; (sstack + 5)
50ee : a9 8b __ LDA #$8b
50f0 : 8d fe bf STA $bffe ; (sstack + 6)
50f3 : ad fd 8a LDA $8afd ; (vdc_state + 7)
50f6 : 29 f0 __ AND #$f0
50f8 : 85 59 __ STA T4 + 0 
50fa : a9 0f __ LDA #$0f
50fc : 85 03 __ STA WORK + 0 
50fe : a9 00 __ LDA #$00
5100 : 85 04 __ STA WORK + 1 
5102 : 20 16 85 JSR $8516 ; (divmod + 0)
5105 : a5 05 __ LDA WORK + 2 
5107 : 38 __ __ SEC
5108 : 65 59 __ ADC T4 + 0 
510a : 8d fd 8a STA $8afd ; (vdc_state + 7)
510d : 20 c6 7c JSR $7cc6 ; (generateSentence.s1000 + 0)
5110 : a9 af __ LDA #$af
5112 : 85 13 __ STA P6 
5114 : a9 8b __ LDA #$8b
5116 : 85 14 __ STA P7 
5118 : ad f3 8a LDA $8af3 ; (winCfg + 5)
511b : 85 1b __ STA ACCU + 0 
511d : a9 00 __ LDA #$00
511f : 85 1c __ STA ACCU + 1 
5121 : a9 0d __ LDA #$0d
5123 : 20 b4 84 JSR $84b4 ; (mul16by8 + 0)
5126 : 18 __ __ CLC
5127 : a9 f6 __ LDA #$f6
5129 : 65 05 __ ADC WORK + 2 
512b : 85 11 __ STA P4 
512d : a9 8b __ LDA #$8b
512f : 69 00 __ ADC #$00
5131 : 85 12 __ STA P5 
5133 : 20 00 7e JSR $7e00 ; (vdcwin_printwrap.s1000 + 0)
5136 : ac f3 8a LDY $8af3 ; (winCfg + 5)
5139 : be 37 86 LDX $8637,y ; (__multab13L + 0)
513c : bd fa 8b LDA $8bfa,x ; (linebuffer + 75)
513f : f0 03 __ BEQ $5144 ; (main.s15299 + 0)
5141 : 4c c4 52 JMP $52c4 ; (main.s1808 + 0)
.s15299:
5144 : c6 56 __ DEC T2 + 0 
5146 : d0 9e __ BNE $50e6 ; (main.l1804 + 0)
.s1806:
5148 : 20 eb 5d JSR $5deb ; (getch.s0 + 0)
514b : ad fd 8a LDA $8afd ; (vdc_state + 7)
514e : 29 f0 __ AND #$f0
5150 : 09 0d __ ORA #$0d
5152 : 8d fd 8a STA $8afd ; (vdc_state + 7)
5155 : e6 55 __ INC T1 + 0 
5157 : ad f3 8a LDA $8af3 ; (winCfg + 5)
515a : c9 03 __ CMP #$03
515c : b0 03 __ BCS $5161 ; (main.l1855 + 0)
515e : 4c a2 50 JMP $50a2 ; (main.l1801 + 0)
.l1855:
5161 : 20 6c 71 JSR $716c ; (vdcwin_win_free.s0 + 0)
5164 : a9 64 __ LDA #$64
5166 : 85 55 __ STA T1 + 0 
.l1858:
5168 : 20 9f 7c JSR $7c9f ; (rand.s0 + 0)
516b : a9 af __ LDA #$af
516d : 8d fd bf STA $bffd ; (sstack + 5)
5170 : a9 8b __ LDA #$8b
5172 : 8d fe bf STA $bffe ; (sstack + 6)
5175 : ad fd 8a LDA $8afd ; (vdc_state + 7)
5178 : 29 f0 __ AND #$f0
517a : 85 59 __ STA T4 + 0 
517c : a9 0f __ LDA #$0f
517e : 85 03 __ STA WORK + 0 
5180 : a9 00 __ LDA #$00
5182 : 85 04 __ STA WORK + 1 
5184 : 20 16 85 JSR $8516 ; (divmod + 0)
5187 : a5 05 __ LDA WORK + 2 
5189 : 38 __ __ SEC
518a : 65 59 __ ADC T4 + 0 
518c : 8d fd 8a STA $8afd ; (vdc_state + 7)
518f : 20 c6 7c JSR $7cc6 ; (generateSentence.s1000 + 0)
5192 : a9 af __ LDA #$af
5194 : 85 13 __ STA P6 
5196 : a9 8b __ LDA #$8b
5198 : 85 14 __ STA P7 
519a : ad f3 8a LDA $8af3 ; (winCfg + 5)
519d : 85 1b __ STA ACCU + 0 
519f : a9 00 __ LDA #$00
51a1 : 85 1c __ STA ACCU + 1 
51a3 : a9 0d __ LDA #$0d
51a5 : 20 b4 84 JSR $84b4 ; (mul16by8 + 0)
51a8 : 18 __ __ CLC
51a9 : a9 f6 __ LDA #$f6
51ab : 65 05 __ ADC WORK + 2 
51ad : 85 11 __ STA P4 
51af : a9 8b __ LDA #$8b
51b1 : 69 00 __ ADC #$00
51b3 : 85 12 __ STA P5 
51b5 : 20 00 7e JSR $7e00 ; (vdcwin_printwrap.s1000 + 0)
51b8 : ac f3 8a LDY $8af3 ; (winCfg + 5)
51bb : be 37 86 LDX $8637,y ; (__multab13L + 0)
51be : bd fa 8b LDA $8bfa,x ; (linebuffer + 75)
51c1 : d0 1e __ BNE $51e1 ; (main.s1862 + 0)
.s15300:
51c3 : c6 55 __ DEC T1 + 0 
51c5 : d0 a1 __ BNE $5168 ; (main.l1858 + 0)
.s1860:
51c7 : 20 eb 5d JSR $5deb ; (getch.s0 + 0)
51ca : ad fd 8a LDA $8afd ; (vdc_state + 7)
51cd : 29 f0 __ AND #$f0
51cf : 09 0d __ ORA #$0d
51d1 : 8d fd 8a STA $8afd ; (vdc_state + 7)
51d4 : a9 01 __ LDA #$01
51d6 : cd f3 8a CMP $8af3 ; (winCfg + 5)
51d9 : 90 86 __ BCC $5161 ; (main.l1855 + 0)
.s1856:
51db : 20 6c 71 JSR $716c ; (vdcwin_win_free.s0 + 0)
51de : 4c a1 24 JMP $24a1 ; (main.l686 + 0)
.s1862:
51e1 : 86 57 __ STX T3 + 0 
51e3 : 18 __ __ CLC
51e4 : 7d f6 8b ADC $8bf6,x ; (linebuffer + 71)
51e7 : 85 0d __ STA P0 
51e9 : bd f7 8b LDA $8bf7,x ; (linebuffer + 72)
51ec : 18 __ __ CLC
51ed : 7d fb 8b ADC $8bfb,x ; (linebuffer + 76)
51f0 : 85 0e __ STA P1 
51f2 : ad df 8a LDA $8adf ; (p2smap + 1)
51f5 : 49 20 __ EOR #$20
51f7 : 85 56 __ STA T2 + 0 
51f9 : ad fd 8a LDA $8afd ; (vdc_state + 7)
51fc : 85 61 __ STA T8 + 0 
51fe : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
5201 : a9 12 __ LDA #$12
5203 : 8d 00 d6 STA $d600 
5206 : 18 __ __ CLC
5207 : a9 f6 __ LDA #$f6
5209 : 65 57 __ ADC T3 + 0 
520b : 85 57 __ STA T3 + 0 
520d : a9 8b __ LDA #$8b
520f : 69 00 __ ADC #$00
5211 : 85 58 __ STA T3 + 1 
5213 : 18 __ __ CLC
5214 : a5 1b __ LDA ACCU + 0 
5216 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
5219 : aa __ __ TAX
521a : a5 1c __ LDA ACCU + 1 
521c : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22395:
521f : 2c 00 d6 BIT $d600 
5222 : 10 fb __ BPL $521f ; (main.l22395 + 0)
.s1876:
5224 : 8d 01 d6 STA $d601 
5227 : a9 13 __ LDA #$13
5229 : 8d 00 d6 STA $d600 
.l22397:
522c : 2c 00 d6 BIT $d600 
522f : 10 fb __ BPL $522c ; (main.l22397 + 0)
.s1881:
5231 : 8e 01 d6 STX $d601 
5234 : a9 1f __ LDA #$1f
5236 : 8d 00 d6 STA $d600 
.l22399:
5239 : 2c 00 d6 BIT $d600 
523c : 10 fb __ BPL $5239 ; (main.l22399 + 0)
.s1885:
523e : a5 56 __ LDA T2 + 0 
5240 : 8d 01 d6 STA $d601 
5243 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
5246 : 18 __ __ CLC
5247 : 65 1b __ ADC ACCU + 0 
5249 : a2 12 __ LDX #$12
524b : 8e 00 d6 STX $d600 
524e : aa __ __ TAX
524f : ad 01 8b LDA $8b01 ; (vdc_state + 11)
5252 : 65 1c __ ADC ACCU + 1 
.l22401:
5254 : 2c 00 d6 BIT $d600 
5257 : 10 fb __ BPL $5254 ; (main.l22401 + 0)
.s1892:
5259 : 8d 01 d6 STA $d601 
525c : a9 13 __ LDA #$13
525e : 8d 00 d6 STA $d600 
.l22403:
5261 : 2c 00 d6 BIT $d600 
5264 : 10 fb __ BPL $5261 ; (main.l22403 + 0)
.s1897:
5266 : 8e 01 d6 STX $d601 
5269 : a9 1f __ LDA #$1f
526b : 8d 00 d6 STA $d600 
.l22405:
526e : 2c 00 d6 BIT $d600 
5271 : 10 fb __ BPL $526e ; (main.l22405 + 0)
.s1901:
5273 : a5 61 __ LDA T8 + 0 
5275 : 8d 01 d6 STA $d601 
5278 : 18 __ __ CLC
5279 : a0 04 __ LDY #$04
527b : b1 57 __ LDA (T3 + 0),y 
527d : 69 01 __ ADC #$01
527f : 91 57 __ STA (T3 + 0),y 
5281 : a0 02 __ LDY #$02
5283 : d1 57 __ CMP (T3 + 0),y 
5285 : f0 03 __ BEQ $528a ; (main.s1902 + 0)
5287 : 4c c3 51 JMP $51c3 ; (main.s15300 + 0)
.s1902:
528a : a9 00 __ LDA #$00
528c : a0 04 __ LDY #$04
528e : 91 57 __ STA (T3 + 0),y 
5290 : c8 __ __ INY
5291 : b1 57 __ LDA (T3 + 0),y 
5293 : 85 56 __ STA T2 + 0 
5295 : 18 __ __ CLC
5296 : 69 01 __ ADC #$01
5298 : 91 57 __ STA (T3 + 0),y 
529a : a0 03 __ LDY #$03
529c : d1 57 __ CMP (T3 + 0),y 
529e : f0 03 __ BEQ $52a3 ; (main.s1905 + 0)
52a0 : 4c c3 51 JMP $51c3 ; (main.s15300 + 0)
.s1905:
52a3 : a5 56 __ LDA T2 + 0 
52a5 : a0 05 __ LDY #$05
52a7 : 91 57 __ STA (T3 + 0),y 
52a9 : a5 57 __ LDA T3 + 0 
52ab : a0 02 __ LDY #$02
52ad : 91 23 __ STA (SP + 0),y 
52af : a5 58 __ LDA T3 + 1 
52b1 : c8 __ __ INY
52b2 : 91 23 __ STA (SP + 0),y 
52b4 : a9 fd __ LDA #$fd
52b6 : c8 __ __ INY
52b7 : 91 23 __ STA (SP + 0),y 
52b9 : a9 5e __ LDA #$5e
52bb : c8 __ __ INY
52bc : 91 23 __ STA (SP + 0),y 
52be : 20 35 80 JSR $8035 ; (vdcwin_printline.s1000 + 0)
52c1 : 4c c3 51 JMP $51c3 ; (main.s15300 + 0)
.s1808:
52c4 : 86 57 __ STX T3 + 0 
52c6 : 18 __ __ CLC
52c7 : 7d f6 8b ADC $8bf6,x ; (linebuffer + 71)
52ca : 85 0d __ STA P0 
52cc : bd f7 8b LDA $8bf7,x ; (linebuffer + 72)
52cf : 18 __ __ CLC
52d0 : 7d fb 8b ADC $8bfb,x ; (linebuffer + 76)
52d3 : 85 0e __ STA P1 
52d5 : ad df 8a LDA $8adf ; (p2smap + 1)
52d8 : 49 20 __ EOR #$20
52da : 85 61 __ STA T8 + 0 
52dc : ad fd 8a LDA $8afd ; (vdc_state + 7)
52df : 85 62 __ STA T9 + 0 
52e1 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
52e4 : a9 12 __ LDA #$12
52e6 : 8d 00 d6 STA $d600 
52e9 : 18 __ __ CLC
52ea : a9 f6 __ LDA #$f6
52ec : 65 57 __ ADC T3 + 0 
52ee : 85 57 __ STA T3 + 0 
52f0 : a9 8b __ LDA #$8b
52f2 : 69 00 __ ADC #$00
52f4 : 85 58 __ STA T3 + 1 
52f6 : 18 __ __ CLC
52f7 : a5 1b __ LDA ACCU + 0 
52f9 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
52fc : aa __ __ TAX
52fd : a5 1c __ LDA ACCU + 1 
52ff : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l22378:
5302 : 2c 00 d6 BIT $d600 
5305 : 10 fb __ BPL $5302 ; (main.l22378 + 0)
.s1822:
5307 : 8d 01 d6 STA $d601 
530a : a9 13 __ LDA #$13
530c : 8d 00 d6 STA $d600 
.l22380:
530f : 2c 00 d6 BIT $d600 
5312 : 10 fb __ BPL $530f ; (main.l22380 + 0)
.s1827:
5314 : 8e 01 d6 STX $d601 
5317 : a9 1f __ LDA #$1f
5319 : 8d 00 d6 STA $d600 
.l22382:
531c : 2c 00 d6 BIT $d600 
531f : 10 fb __ BPL $531c ; (main.l22382 + 0)
.s1831:
5321 : a5 61 __ LDA T8 + 0 
5323 : 8d 01 d6 STA $d601 
5326 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
5329 : 18 __ __ CLC
532a : 65 1b __ ADC ACCU + 0 
532c : a2 12 __ LDX #$12
532e : 8e 00 d6 STX $d600 
5331 : aa __ __ TAX
5332 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
5335 : 65 1c __ ADC ACCU + 1 
.l22384:
5337 : 2c 00 d6 BIT $d600 
533a : 10 fb __ BPL $5337 ; (main.l22384 + 0)
.s1838:
533c : 8d 01 d6 STA $d601 
533f : a9 13 __ LDA #$13
5341 : 8d 00 d6 STA $d600 
.l22386:
5344 : 2c 00 d6 BIT $d600 
5347 : 10 fb __ BPL $5344 ; (main.l22386 + 0)
.s1843:
5349 : 8e 01 d6 STX $d601 
534c : a9 1f __ LDA #$1f
534e : 8d 00 d6 STA $d600 
.l22388:
5351 : 2c 00 d6 BIT $d600 
5354 : 10 fb __ BPL $5351 ; (main.l22388 + 0)
.s1847:
5356 : a5 62 __ LDA T9 + 0 
5358 : 8d 01 d6 STA $d601 
535b : 18 __ __ CLC
535c : a0 04 __ LDY #$04
535e : b1 57 __ LDA (T3 + 0),y 
5360 : 69 01 __ ADC #$01
5362 : 91 57 __ STA (T3 + 0),y 
5364 : a0 02 __ LDY #$02
5366 : d1 57 __ CMP (T3 + 0),y 
5368 : f0 03 __ BEQ $536d ; (main.s1848 + 0)
536a : 4c 44 51 JMP $5144 ; (main.s15299 + 0)
.s1848:
536d : a9 00 __ LDA #$00
536f : a0 04 __ LDY #$04
5371 : 91 57 __ STA (T3 + 0),y 
5373 : c8 __ __ INY
5374 : b1 57 __ LDA (T3 + 0),y 
5376 : aa __ __ TAX
5377 : 18 __ __ CLC
5378 : 69 01 __ ADC #$01
537a : 91 57 __ STA (T3 + 0),y 
537c : a0 03 __ LDY #$03
537e : d1 57 __ CMP (T3 + 0),y 
5380 : f0 03 __ BEQ $5385 ; (main.s1851 + 0)
5382 : 4c 44 51 JMP $5144 ; (main.s15299 + 0)
.s1851:
5385 : 8a __ __ TXA
5386 : a0 05 __ LDY #$05
5388 : 91 57 __ STA (T3 + 0),y 
538a : a5 57 __ LDA T3 + 0 
538c : a0 02 __ LDY #$02
538e : 91 23 __ STA (SP + 0),y 
5390 : a5 58 __ LDA T3 + 1 
5392 : c8 __ __ INY
5393 : 91 23 __ STA (SP + 0),y 
5395 : a9 fd __ LDA #$fd
5397 : c8 __ __ INY
5398 : 91 23 __ STA (SP + 0),y 
539a : a9 5e __ LDA #$5e
539c : c8 __ __ INY
539d : 91 23 __ STA (SP + 0),y 
539f : 20 35 80 JSR $8035 ; (vdcwin_printline.s1000 + 0)
53a2 : 4c 44 51 JMP $5144 ; (main.s15299 + 0)
.s1158:
53a5 : a6 55 __ LDX T1 + 0 
53a7 : ca __ __ DEX
53a8 : 8e ff bf STX $bfff ; (sstack + 7)
53ab : bd a3 86 LDA $86a3,x ; (menubar + 45)
53ae : 8d fd bf STA $bffd ; (sstack + 5)
53b1 : ae a8 86 LDX $86a8 ; (menubar + 50)
53b4 : e8 __ __ INX
53b5 : 8e fe bf STX $bffe ; (sstack + 6)
53b8 : 20 2c 77 JSR $772c ; (menu_pulldown.s1000 + 0)
53bb : a5 1b __ LDA ACCU + 0 
53bd : 85 56 __ STA T2 + 0 
53bf : c9 12 __ CMP #$12
53c1 : d0 0e __ BNE $53d1 ; (main.s1291 + 0)
.s1289:
53c3 : a9 00 __ LDA #$00
53c5 : 85 56 __ STA T2 + 0 
53c7 : c6 55 __ DEC T1 + 0 
53c9 : d0 06 __ BNE $53d1 ; (main.s1291 + 0)
.s1292:
53cb : a9 05 __ LDA #$05
53cd : 85 55 __ STA T1 + 0 
53cf : d0 13 __ BNE $53e4 ; (main.s1287 + 0)
.s1291:
53d1 : c9 13 __ CMP #$13
53d3 : d0 0f __ BNE $53e4 ; (main.s1287 + 0)
.s1295:
53d5 : e6 55 __ INC T1 + 0 
53d7 : a5 55 __ LDA T1 + 0 
53d9 : c9 06 __ CMP #$06
53db : 90 03 __ BCC $53e0 ; (main.s14086 + 0)
53dd : 4c 43 2b JMP $2b43 ; (main.l23263 + 0)
.s14086:
53e0 : a9 00 __ LDA #$00
53e2 : 85 56 __ STA T2 + 0 
.s1287:
53e4 : a5 56 __ LDA T2 + 0 
53e6 : f0 03 __ BEQ $53eb ; (main.s1287 + 7)
53e8 : 4c 40 2d JMP $2d40 ; (main.s1156 + 0)
53eb : 4c 47 2b JMP $2b47 ; (main.l1157 + 0)
.s2330:
53ee : 85 55 __ STA T1 + 0 
53f0 : a5 53 __ LDA T0 + 0 
53f2 : 4c 31 2d JMP $2d31 ; (main.s1284 + 0)
.s1271:
53f5 : c6 55 __ DEC T1 + 0 
53f7 : f0 03 __ BEQ $53fc ; (main.s1274 + 0)
53f9 : 4c 28 2d JMP $2d28 ; (main.s1273 + 0)
.s1274:
53fc : a9 05 __ LDA #$05
53fe : d0 ee __ BNE $53ee ; (main.s2330 + 0)
.s692:
5400 : 85 0e __ STA P1 
5402 : ad fd 8a LDA $8afd ; (vdc_state + 7)
5405 : 85 56 __ STA T2 + 0 
5407 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
540a : a9 12 __ LDA #$12
540c : 8d 00 d6 STA $d600 
540f : 18 __ __ CLC
5410 : a5 1b __ LDA ACCU + 0 
5412 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
5415 : a8 __ __ TAY
5416 : a5 1c __ LDA ACCU + 1 
5418 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
541b : a6 53 __ LDX T0 + 0 
541d : ca __ __ DEX
.l22164:
541e : 2c 00 d6 BIT $d600 
5421 : 10 fb __ BPL $541e ; (main.l22164 + 0)
.s702:
5423 : 8d 01 d6 STA $d601 
5426 : a9 13 __ LDA #$13
5428 : 8d 00 d6 STA $d600 
.l22166:
542b : 2c 00 d6 BIT $d600 
542e : 10 fb __ BPL $542b ; (main.l22166 + 0)
.s707:
5430 : 8c 01 d6 STY $d601 
5433 : a9 1f __ LDA #$1f
5435 : 8d 00 d6 STA $d600 
.l22168:
5438 : 2c 00 d6 BIT $d600 
543b : 10 fb __ BPL $5438 ; (main.l22168 + 0)
.s711:
543d : a9 20 __ LDA #$20
543f : 8d 01 d6 STA $d601 
5442 : a9 18 __ LDA #$18
5444 : 8d 00 d6 STA $d600 
.l22170:
5447 : 2c 00 d6 BIT $d600 
544a : 10 fb __ BPL $5447 ; (main.l22170 + 0)
.s717:
544c : ad 01 d6 LDA $d601 
544f : 29 7f __ AND #$7f
5451 : a0 18 __ LDY #$18
5453 : 8c 00 d6 STY $d600 
.l22172:
5456 : 2c 00 d6 BIT $d600 
5459 : 10 fb __ BPL $5456 ; (main.l22172 + 0)
.s723:
545b : 8d 01 d6 STA $d601 
545e : a9 1e __ LDA #$1e
5460 : 8d 00 d6 STA $d600 
.l22174:
5463 : 2c 00 d6 BIT $d600 
5466 : 10 fb __ BPL $5463 ; (main.l22174 + 0)
.s728:
5468 : 8e 01 d6 STX $d601 
546b : ad 00 8b LDA $8b00 ; (vdc_state + 10)
546e : 18 __ __ CLC
546f : 65 1b __ ADC ACCU + 0 
5471 : a0 12 __ LDY #$12
5473 : 8c 00 d6 STY $d600 
5476 : a8 __ __ TAY
5477 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
547a : 65 1c __ ADC ACCU + 1 
.l22176:
547c : 2c 00 d6 BIT $d600 
547f : 10 fb __ BPL $547c ; (main.l22176 + 0)
.s735:
5481 : 8d 01 d6 STA $d601 
5484 : a9 13 __ LDA #$13
5486 : 8d 00 d6 STA $d600 
.l22178:
5489 : 2c 00 d6 BIT $d600 
548c : 10 fb __ BPL $5489 ; (main.l22178 + 0)
.s740:
548e : 8c 01 d6 STY $d601 
5491 : a9 1f __ LDA #$1f
5493 : 8d 00 d6 STA $d600 
.l22180:
5496 : 2c 00 d6 BIT $d600 
5499 : 10 fb __ BPL $5496 ; (main.l22180 + 0)
.s744:
549b : a5 56 __ LDA T2 + 0 
549d : 8d 01 d6 STA $d601 
54a0 : a9 18 __ LDA #$18
54a2 : 8d 00 d6 STA $d600 
.l22182:
54a5 : 2c 00 d6 BIT $d600 
54a8 : 10 fb __ BPL $54a5 ; (main.l22182 + 0)
.s750:
54aa : ad 01 d6 LDA $d601 
54ad : 29 7f __ AND #$7f
54af : a0 18 __ LDY #$18
54b1 : 8c 00 d6 STY $d600 
.l22184:
54b4 : 2c 00 d6 BIT $d600 
54b7 : 10 fb __ BPL $54b4 ; (main.l22184 + 0)
.s756:
54b9 : 8d 01 d6 STA $d601 
54bc : a9 1e __ LDA #$1e
54be : 8d 00 d6 STA $d600 
.l22186:
54c1 : 2c 00 d6 BIT $d600 
54c4 : 10 fb __ BPL $54c1 ; (main.l22186 + 0)
.s761:
54c6 : 8e 01 d6 STX $d601 
54c9 : e6 55 __ INC T1 + 0 
54cb : 4c b1 24 JMP $24b1 ; (main.l691 + 0)
.s277:
54ce : a9 00 __ LDA #$00
54d0 : 85 0d __ STA P0 
54d2 : a5 55 __ LDA T1 + 0 
54d4 : 85 0e __ STA P1 
54d6 : ad fd 8a LDA $8afd ; (vdc_state + 7)
54d9 : 85 56 __ STA T2 + 0 
54db : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
54de : a9 12 __ LDA #$12
54e0 : 8d 00 d6 STA $d600 
54e3 : 18 __ __ CLC
54e4 : a5 1b __ LDA ACCU + 0 
54e6 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
54e9 : a8 __ __ TAY
54ea : a5 1c __ LDA ACCU + 1 
54ec : 6d ff 8a ADC $8aff ; (vdc_state + 9)
54ef : a6 53 __ LDX T0 + 0 
54f1 : ca __ __ DEX
.l23237:
54f2 : 2c 00 d6 BIT $d600 
54f5 : 10 fb __ BPL $54f2 ; (main.l23237 + 0)
.s287:
54f7 : 8d 01 d6 STA $d601 
54fa : a9 13 __ LDA #$13
54fc : 8d 00 d6 STA $d600 
.l23239:
54ff : 2c 00 d6 BIT $d600 
5502 : 10 fb __ BPL $54ff ; (main.l23239 + 0)
.s292:
5504 : 8c 01 d6 STY $d601 
5507 : a9 1f __ LDA #$1f
5509 : 8d 00 d6 STA $d600 
.l23241:
550c : 2c 00 d6 BIT $d600 
550f : 10 fb __ BPL $550c ; (main.l23241 + 0)
.s296:
5511 : a9 20 __ LDA #$20
5513 : 8d 01 d6 STA $d601 
5516 : a9 18 __ LDA #$18
5518 : 8d 00 d6 STA $d600 
.l23243:
551b : 2c 00 d6 BIT $d600 
551e : 10 fb __ BPL $551b ; (main.l23243 + 0)
.s302:
5520 : ad 01 d6 LDA $d601 
5523 : 29 7f __ AND #$7f
5525 : a0 18 __ LDY #$18
5527 : 8c 00 d6 STY $d600 
.l23245:
552a : 2c 00 d6 BIT $d600 
552d : 10 fb __ BPL $552a ; (main.l23245 + 0)
.s308:
552f : 8d 01 d6 STA $d601 
5532 : a9 1e __ LDA #$1e
5534 : 8d 00 d6 STA $d600 
.l23247:
5537 : 2c 00 d6 BIT $d600 
553a : 10 fb __ BPL $5537 ; (main.l23247 + 0)
.s313:
553c : 8e 01 d6 STX $d601 
553f : ad 00 8b LDA $8b00 ; (vdc_state + 10)
5542 : 18 __ __ CLC
5543 : 65 1b __ ADC ACCU + 0 
5545 : a0 12 __ LDY #$12
5547 : 8c 00 d6 STY $d600 
554a : a8 __ __ TAY
554b : ad 01 8b LDA $8b01 ; (vdc_state + 11)
554e : 65 1c __ ADC ACCU + 1 
.l23249:
5550 : 2c 00 d6 BIT $d600 
5553 : 10 fb __ BPL $5550 ; (main.l23249 + 0)
.s320:
5555 : 8d 01 d6 STA $d601 
5558 : a9 13 __ LDA #$13
555a : 8d 00 d6 STA $d600 
.l23251:
555d : 2c 00 d6 BIT $d600 
5560 : 10 fb __ BPL $555d ; (main.l23251 + 0)
.s325:
5562 : 8c 01 d6 STY $d601 
5565 : a9 1f __ LDA #$1f
5567 : 8d 00 d6 STA $d600 
.l23253:
556a : 2c 00 d6 BIT $d600 
556d : 10 fb __ BPL $556a ; (main.l23253 + 0)
.s329:
556f : a5 56 __ LDA T2 + 0 
5571 : 8d 01 d6 STA $d601 
5574 : a9 18 __ LDA #$18
5576 : 8d 00 d6 STA $d600 
.l23255:
5579 : 2c 00 d6 BIT $d600 
557c : 10 fb __ BPL $5579 ; (main.l23255 + 0)
.s335:
557e : ad 01 d6 LDA $d601 
5581 : 29 7f __ AND #$7f
5583 : a0 18 __ LDY #$18
5585 : 8c 00 d6 STY $d600 
.l23257:
5588 : 2c 00 d6 BIT $d600 
558b : 10 fb __ BPL $5588 ; (main.l23257 + 0)
.s341:
558d : 8d 01 d6 STA $d601 
5590 : a9 1e __ LDA #$1e
5592 : 8d 00 d6 STA $d600 
.l23259:
5595 : 2c 00 d6 BIT $d600 
5598 : 10 fb __ BPL $5595 ; (main.l23259 + 0)
.s346:
559a : 8e 01 d6 STX $d601 
559d : e6 55 __ INC T1 + 0 
559f : 4c 1b 1f JMP $1f1b ; (main.l276 + 0)
.s102:
55a2 : a9 00 __ LDA #$00
55a4 : 85 0d __ STA P0 
55a6 : a5 55 __ LDA T1 + 0 
55a8 : 85 0e __ STA P1 
55aa : ad fd 8a LDA $8afd ; (vdc_state + 7)
55ad : 85 56 __ STA T2 + 0 
55af : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
55b2 : a9 12 __ LDA #$12
55b4 : 8d 00 d6 STA $d600 
55b7 : 18 __ __ CLC
55b8 : a5 1b __ LDA ACCU + 0 
55ba : 6d fe 8a ADC $8afe ; (vdc_state + 8)
55bd : a8 __ __ TAY
55be : a5 1c __ LDA ACCU + 1 
55c0 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
55c3 : a6 53 __ LDX T0 + 0 
55c5 : ca __ __ DEX
.l22012:
55c6 : 2c 00 d6 BIT $d600 
55c9 : 10 fb __ BPL $55c6 ; (main.l22012 + 0)
.s112:
55cb : 8d 01 d6 STA $d601 
55ce : a9 13 __ LDA #$13
55d0 : 8d 00 d6 STA $d600 
.l22014:
55d3 : 2c 00 d6 BIT $d600 
55d6 : 10 fb __ BPL $55d3 ; (main.l22014 + 0)
.s117:
55d8 : 8c 01 d6 STY $d601 
55db : a9 1f __ LDA #$1f
55dd : 8d 00 d6 STA $d600 
.l22016:
55e0 : 2c 00 d6 BIT $d600 
55e3 : 10 fb __ BPL $55e0 ; (main.l22016 + 0)
.s121:
55e5 : a9 20 __ LDA #$20
55e7 : 8d 01 d6 STA $d601 
55ea : a9 18 __ LDA #$18
55ec : 8d 00 d6 STA $d600 
.l22018:
55ef : 2c 00 d6 BIT $d600 
55f2 : 10 fb __ BPL $55ef ; (main.l22018 + 0)
.s127:
55f4 : ad 01 d6 LDA $d601 
55f7 : 29 7f __ AND #$7f
55f9 : a0 18 __ LDY #$18
55fb : 8c 00 d6 STY $d600 
.l22020:
55fe : 2c 00 d6 BIT $d600 
5601 : 10 fb __ BPL $55fe ; (main.l22020 + 0)
.s133:
5603 : 8d 01 d6 STA $d601 
5606 : a9 1e __ LDA #$1e
5608 : 8d 00 d6 STA $d600 
.l22022:
560b : 2c 00 d6 BIT $d600 
560e : 10 fb __ BPL $560b ; (main.l22022 + 0)
.s138:
5610 : 8e 01 d6 STX $d601 
5613 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
5616 : 18 __ __ CLC
5617 : 65 1b __ ADC ACCU + 0 
5619 : a0 12 __ LDY #$12
561b : 8c 00 d6 STY $d600 
561e : a8 __ __ TAY
561f : ad 01 8b LDA $8b01 ; (vdc_state + 11)
5622 : 65 1c __ ADC ACCU + 1 
.l22024:
5624 : 2c 00 d6 BIT $d600 
5627 : 10 fb __ BPL $5624 ; (main.l22024 + 0)
.s145:
5629 : 8d 01 d6 STA $d601 
562c : a9 13 __ LDA #$13
562e : 8d 00 d6 STA $d600 
.l22026:
5631 : 2c 00 d6 BIT $d600 
5634 : 10 fb __ BPL $5631 ; (main.l22026 + 0)
.s150:
5636 : 8c 01 d6 STY $d601 
5639 : a9 1f __ LDA #$1f
563b : 8d 00 d6 STA $d600 
.l22028:
563e : 2c 00 d6 BIT $d600 
5641 : 10 fb __ BPL $563e ; (main.l22028 + 0)
.s154:
5643 : a5 56 __ LDA T2 + 0 
5645 : 8d 01 d6 STA $d601 
5648 : a9 18 __ LDA #$18
564a : 8d 00 d6 STA $d600 
.l22030:
564d : 2c 00 d6 BIT $d600 
5650 : 10 fb __ BPL $564d ; (main.l22030 + 0)
.s160:
5652 : ad 01 d6 LDA $d601 
5655 : 29 7f __ AND #$7f
5657 : a0 18 __ LDY #$18
5659 : 8c 00 d6 STY $d600 
.l22032:
565c : 2c 00 d6 BIT $d600 
565f : 10 fb __ BPL $565c ; (main.l22032 + 0)
.s166:
5661 : 8d 01 d6 STA $d601 
5664 : a9 1e __ LDA #$1e
5666 : 8d 00 d6 STA $d600 
.l22034:
5669 : 2c 00 d6 BIT $d600 
566c : 10 fb __ BPL $5669 ; (main.l22034 + 0)
.s171:
566e : 8e 01 d6 STX $d601 
5671 : e6 55 __ INC T1 + 0 
5673 : 4c e5 1d JMP $1de5 ; (main.l101 + 0)
--------------------------------------------------------------------
vdc_coords@proxy: ; vdc_coords@proxy
5676 : ad a8 86 LDA $86a8 ; (menubar + 50)
5679 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_coords: ; vdc_coords(u8,u8)->u16
.s0:
567b : a5 0e __ LDA P1 ; (y + 0)
567d : 0a __ __ ASL
567e : aa __ __ TAX
567f : bd 0f 8b LDA $8b0f,x ; (multab + 0)
5682 : 18 __ __ CLC
5683 : 65 0d __ ADC P0 ; (x + 0)
5685 : 85 1b __ STA ACCU + 0 
5687 : bd 10 8b LDA $8b10,x ; (multab + 1)
568a : 69 00 __ ADC #$00
568c : 85 1c __ STA ACCU + 1 
.s1001:
568e : 60 __ __ RTS
--------------------------------------------------------------------
screen_width: ; screen_width()->u8
.s0:
568f : 24 d7 __ BIT $d7 
5691 : 30 03 __ BMI $5696 ; (screen_width.s1 + 0)
.s2:
5693 : a9 28 __ LDA #$28
5695 : 60 __ __ RTS
.s1:
5696 : a9 50 __ LDA #$50
.s1001:
5698 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
5699 : a9 01 __ LDA #$01
569b : 8d fc bf STA $bffc ; (sstack + 4)
569e : a9 aa __ LDA #$aa
56a0 : 85 16 __ STA P9 
56a2 : a9 bf __ LDA #$bf
56a4 : 85 17 __ STA P10 
56a6 : a0 02 __ LDY #$02
56a8 : b1 23 __ LDA (SP + 0),y 
56aa : 8d f8 bf STA $bff8 ; (sstack + 0)
56ad : c8 __ __ INY
56ae : b1 23 __ LDA (SP + 0),y 
56b0 : 8d f9 bf STA $bff9 ; (sstack + 1)
56b3 : 18 __ __ CLC
56b4 : a5 23 __ LDA SP + 0 
56b6 : 69 04 __ ADC #$04
56b8 : 8d fa bf STA $bffa ; (sstack + 2)
56bb : a5 24 __ LDA SP + 1 
56bd : 69 00 __ ADC #$00
56bf : 8d fb bf STA $bffb ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s1000:
56c2 : a5 53 __ LDA T7 + 0 
56c4 : 8d dc bf STA $bfdc ; (wrapbuffer + 62)
56c7 : a5 54 __ LDA T7 + 1 
56c9 : 8d dd bf STA $bfdd ; (wrapbuffer + 63)
56cc : a5 55 __ LDA T7 + 2 
56ce : 8d de bf STA $bfde ; (wrapbuffer + 64)
.s0:
56d1 : a9 00 __ LDA #$00
56d3 : 85 47 __ STA T0 + 0 
56d5 : ad f8 bf LDA $bff8 ; (sstack + 0)
56d8 : 85 49 __ STA T1 + 0 
56da : ad f9 bf LDA $bff9 ; (sstack + 1)
56dd : 85 4a __ STA T1 + 1 
.l1:
56df : a0 00 __ LDY #$00
56e1 : b1 49 __ LDA (T1 + 0),y 
56e3 : d0 3c __ BNE $5721 ; (sformat.s2 + 0)
.s3:
56e5 : a4 47 __ LDY T0 + 0 
56e7 : 91 16 __ STA (P9),y ; (buff + 0)
56e9 : 98 __ __ TYA
56ea : f0 1d __ BEQ $5709 ; (sformat.s1070 + 0)
.s116:
56ec : ad fc bf LDA $bffc ; (sstack + 4)
56ef : d0 0d __ BNE $56fe ; (sformat.s119 + 0)
.s120:
56f1 : 18 __ __ CLC
56f2 : a5 16 __ LDA P9 ; (buff + 0)
56f4 : 65 47 __ ADC T0 + 0 
56f6 : aa __ __ TAX
56f7 : a5 17 __ LDA P10 ; (buff + 1)
56f9 : 69 00 __ ADC #$00
56fb : 4c 0d 57 JMP $570d ; (sformat.s1001 + 0)
.s119:
56fe : a5 16 __ LDA P9 ; (buff + 0)
5700 : 85 0d __ STA P0 
5702 : a5 17 __ LDA P10 ; (buff + 1)
5704 : 85 0e __ STA P1 
5706 : 20 c3 5a JSR $5ac3 ; (puts.s0 + 0)
.s1070:
5709 : a5 17 __ LDA P10 ; (buff + 1)
570b : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
570d : 86 1b __ STX ACCU + 0 ; (fps + 0)
570f : 85 1c __ STA ACCU + 1 ; (fps + 1)
5711 : ad dc bf LDA $bfdc ; (wrapbuffer + 62)
5714 : 85 53 __ STA T7 + 0 
5716 : ad dd bf LDA $bfdd ; (wrapbuffer + 63)
5719 : 85 54 __ STA T7 + 1 
571b : ad de bf LDA $bfde ; (wrapbuffer + 64)
571e : 85 55 __ STA T7 + 2 
5720 : 60 __ __ RTS
.s2:
5721 : c9 25 __ CMP #$25
5723 : f0 3f __ BEQ $5764 ; (sformat.s4 + 0)
.s5:
5725 : a4 47 __ LDY T0 + 0 
5727 : 91 16 __ STA (P9),y ; (buff + 0)
5729 : e6 49 __ INC T1 + 0 
572b : d0 02 __ BNE $572f ; (sformat.s1098 + 0)
.s1097:
572d : e6 4a __ INC T1 + 1 
.s1098:
572f : c8 __ __ INY
5730 : 84 47 __ STY T0 + 0 
5732 : 98 __ __ TYA
5733 : c0 28 __ CPY #$28
5735 : 90 a8 __ BCC $56df ; (sformat.l1 + 0)
.s110:
5737 : 85 4c __ STA T5 + 0 
5739 : a9 00 __ LDA #$00
573b : 85 47 __ STA T0 + 0 
573d : ad fc bf LDA $bffc ; (sstack + 4)
5740 : f0 14 __ BEQ $5756 ; (sformat.s114 + 0)
.s113:
5742 : a5 16 __ LDA P9 ; (buff + 0)
5744 : 85 0d __ STA P0 
5746 : a5 17 __ LDA P10 ; (buff + 1)
5748 : 85 0e __ STA P1 
574a : a9 00 __ LDA #$00
574c : a4 4c __ LDY T5 + 0 
574e : 91 16 __ STA (P9),y ; (buff + 0)
5750 : 20 c3 5a JSR $5ac3 ; (puts.s0 + 0)
5753 : 4c df 56 JMP $56df ; (sformat.l1 + 0)
.s114:
5756 : 18 __ __ CLC
5757 : a5 16 __ LDA P9 ; (buff + 0)
5759 : 65 4c __ ADC T5 + 0 
575b : 85 16 __ STA P9 ; (buff + 0)
575d : 90 80 __ BCC $56df ; (sformat.l1 + 0)
.s1099:
575f : e6 17 __ INC P10 ; (buff + 1)
5761 : 4c df 56 JMP $56df ; (sformat.l1 + 0)
.s4:
5764 : a5 47 __ LDA T0 + 0 
5766 : f0 27 __ BEQ $578f ; (sformat.s9 + 0)
.s7:
5768 : 84 47 __ STY T0 + 0 
576a : 85 4c __ STA T5 + 0 
576c : ad fc bf LDA $bffc ; (sstack + 4)
576f : f0 13 __ BEQ $5784 ; (sformat.s11 + 0)
.s10:
5771 : a5 16 __ LDA P9 ; (buff + 0)
5773 : 85 0d __ STA P0 
5775 : a5 17 __ LDA P10 ; (buff + 1)
5777 : 85 0e __ STA P1 
5779 : 98 __ __ TYA
577a : a4 4c __ LDY T5 + 0 
577c : 91 16 __ STA (P9),y ; (buff + 0)
577e : 20 c3 5a JSR $5ac3 ; (puts.s0 + 0)
5781 : 4c 8f 57 JMP $578f ; (sformat.s9 + 0)
.s11:
5784 : 18 __ __ CLC
5785 : a5 16 __ LDA P9 ; (buff + 0)
5787 : 65 4c __ ADC T5 + 0 
5789 : 85 16 __ STA P9 ; (buff + 0)
578b : 90 02 __ BCC $578f ; (sformat.s9 + 0)
.s1095:
578d : e6 17 __ INC P10 ; (buff + 1)
.s9:
578f : a9 0a __ LDA #$0a
5791 : 8d e3 bf STA $bfe3 ; (wrapbuffer + 69)
5794 : a9 00 __ LDA #$00
5796 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 70)
5799 : 8d e5 bf STA $bfe5 ; (wrapbuffer + 71)
579c : 8d e6 bf STA $bfe6 ; (wrapbuffer + 72)
579f : 8d e7 bf STA $bfe7 ; (wrapbuffer + 73)
57a2 : a0 01 __ LDY #$01
57a4 : b1 49 __ LDA (T1 + 0),y 
57a6 : a2 20 __ LDX #$20
57a8 : 8e e0 bf STX $bfe0 ; (wrapbuffer + 66)
57ab : a2 00 __ LDX #$00
57ad : 8e e1 bf STX $bfe1 ; (wrapbuffer + 67)
57b0 : ca __ __ DEX
57b1 : 8e e2 bf STX $bfe2 ; (wrapbuffer + 68)
57b4 : aa __ __ TAX
57b5 : 18 __ __ CLC
57b6 : a5 49 __ LDA T1 + 0 
57b8 : 69 02 __ ADC #$02
.l14:
57ba : 85 49 __ STA T1 + 0 
57bc : 90 02 __ BCC $57c0 ; (sformat.s1082 + 0)
.s1081:
57be : e6 4a __ INC T1 + 1 
.s1082:
57c0 : 8a __ __ TXA
57c1 : e0 2b __ CPX #$2b
57c3 : d0 08 __ BNE $57cd ; (sformat.s17 + 0)
.s16:
57c5 : a9 01 __ LDA #$01
57c7 : 8d e5 bf STA $bfe5 ; (wrapbuffer + 71)
57ca : 4c ae 5a JMP $5aae ; (sformat.s264 + 0)
.s17:
57cd : c9 30 __ CMP #$30
57cf : d0 06 __ BNE $57d7 ; (sformat.s20 + 0)
.s19:
57d1 : 8d e0 bf STA $bfe0 ; (wrapbuffer + 66)
57d4 : 4c ae 5a JMP $5aae ; (sformat.s264 + 0)
.s20:
57d7 : e0 23 __ CPX #$23
57d9 : d0 08 __ BNE $57e3 ; (sformat.s23 + 0)
.s22:
57db : a9 01 __ LDA #$01
57dd : 8d e7 bf STA $bfe7 ; (wrapbuffer + 73)
57e0 : 4c ae 5a JMP $5aae ; (sformat.s264 + 0)
.s23:
57e3 : e0 2d __ CPX #$2d
57e5 : d0 08 __ BNE $57ef ; (sformat.s15 + 0)
.s25:
57e7 : a9 01 __ LDA #$01
57e9 : 8d e6 bf STA $bfe6 ; (wrapbuffer + 72)
57ec : 4c ae 5a JMP $5aae ; (sformat.s264 + 0)
.s15:
57ef : 85 4c __ STA T5 + 0 
57f1 : e0 30 __ CPX #$30
57f3 : 90 53 __ BCC $5848 ; (sformat.s31 + 0)
.s32:
57f5 : e0 3a __ CPX #$3a
57f7 : b0 4f __ BCS $5848 ; (sformat.s31 + 0)
.s29:
57f9 : a9 00 __ LDA #$00
57fb : 85 44 __ STA T6 + 0 
57fd : 85 45 __ STA T6 + 1 
57ff : e0 3a __ CPX #$3a
5801 : b0 40 __ BCS $5843 ; (sformat.s35 + 0)
.l34:
5803 : a5 44 __ LDA T6 + 0 
5805 : 0a __ __ ASL
5806 : 85 1b __ STA ACCU + 0 ; (fps + 0)
5808 : a5 45 __ LDA T6 + 1 
580a : 2a __ __ ROL
580b : 06 1b __ ASL ACCU + 0 ; (fps + 0)
580d : 2a __ __ ROL
580e : aa __ __ TAX
580f : 18 __ __ CLC
5810 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
5812 : 65 44 __ ADC T6 + 0 
5814 : 85 44 __ STA T6 + 0 
5816 : 8a __ __ TXA
5817 : 65 45 __ ADC T6 + 1 
5819 : 06 44 __ ASL T6 + 0 
581b : 2a __ __ ROL
581c : aa __ __ TAX
581d : 18 __ __ CLC
581e : a5 44 __ LDA T6 + 0 
5820 : 65 4c __ ADC T5 + 0 
5822 : 90 01 __ BCC $5825 ; (sformat.s1092 + 0)
.s1091:
5824 : e8 __ __ INX
.s1092:
5825 : 38 __ __ SEC
5826 : e9 30 __ SBC #$30
5828 : 85 44 __ STA T6 + 0 
582a : 8a __ __ TXA
582b : e9 00 __ SBC #$00
582d : 85 45 __ STA T6 + 1 
582f : a0 00 __ LDY #$00
5831 : b1 49 __ LDA (T1 + 0),y 
5833 : 85 4c __ STA T5 + 0 
5835 : e6 49 __ INC T1 + 0 
5837 : d0 02 __ BNE $583b ; (sformat.s1094 + 0)
.s1093:
5839 : e6 4a __ INC T1 + 1 
.s1094:
583b : c9 30 __ CMP #$30
583d : 90 04 __ BCC $5843 ; (sformat.s35 + 0)
.s36:
583f : c9 3a __ CMP #$3a
5841 : 90 c0 __ BCC $5803 ; (sformat.l34 + 0)
.s35:
5843 : a5 44 __ LDA T6 + 0 
5845 : 8d e1 bf STA $bfe1 ; (wrapbuffer + 67)
.s31:
5848 : a5 4c __ LDA T5 + 0 
584a : c9 2e __ CMP #$2e
584c : d0 51 __ BNE $589f ; (sformat.s39 + 0)
.s37:
584e : a9 00 __ LDA #$00
5850 : 85 44 __ STA T6 + 0 
.l243:
5852 : 85 45 __ STA T6 + 1 
5854 : a0 00 __ LDY #$00
5856 : b1 49 __ LDA (T1 + 0),y 
5858 : 85 4c __ STA T5 + 0 
585a : e6 49 __ INC T1 + 0 
585c : d0 02 __ BNE $5860 ; (sformat.s1084 + 0)
.s1083:
585e : e6 4a __ INC T1 + 1 
.s1084:
5860 : c9 30 __ CMP #$30
5862 : 90 04 __ BCC $5868 ; (sformat.s42 + 0)
.s43:
5864 : c9 3a __ CMP #$3a
5866 : 90 0a __ BCC $5872 ; (sformat.s41 + 0)
.s42:
5868 : a5 44 __ LDA T6 + 0 
586a : 8d e2 bf STA $bfe2 ; (wrapbuffer + 68)
586d : a5 4c __ LDA T5 + 0 
586f : 4c 9f 58 JMP $589f ; (sformat.s39 + 0)
.s41:
5872 : a5 44 __ LDA T6 + 0 
5874 : 0a __ __ ASL
5875 : 85 1b __ STA ACCU + 0 ; (fps + 0)
5877 : a5 45 __ LDA T6 + 1 
5879 : 2a __ __ ROL
587a : 06 1b __ ASL ACCU + 0 ; (fps + 0)
587c : 2a __ __ ROL
587d : aa __ __ TAX
587e : 18 __ __ CLC
587f : a5 1b __ LDA ACCU + 0 ; (fps + 0)
5881 : 65 44 __ ADC T6 + 0 
5883 : 85 44 __ STA T6 + 0 
5885 : 8a __ __ TXA
5886 : 65 45 __ ADC T6 + 1 
5888 : 06 44 __ ASL T6 + 0 
588a : 2a __ __ ROL
588b : aa __ __ TAX
588c : 18 __ __ CLC
588d : a5 44 __ LDA T6 + 0 
588f : 65 4c __ ADC T5 + 0 
5891 : 90 01 __ BCC $5894 ; (sformat.s1090 + 0)
.s1089:
5893 : e8 __ __ INX
.s1090:
5894 : 38 __ __ SEC
5895 : e9 30 __ SBC #$30
5897 : 85 44 __ STA T6 + 0 
5899 : 8a __ __ TXA
589a : e9 00 __ SBC #$00
589c : 4c 52 58 JMP $5852 ; (sformat.l243 + 0)
.s39:
589f : c9 64 __ CMP #$64
58a1 : f0 04 __ BEQ $58a7 ; (sformat.s44 + 0)
.s47:
58a3 : c9 44 __ CMP #$44
58a5 : d0 05 __ BNE $58ac ; (sformat.s45 + 0)
.s44:
58a7 : a9 01 __ LDA #$01
58a9 : 4c 72 5a JMP $5a72 ; (sformat.s261 + 0)
.s45:
58ac : c9 75 __ CMP #$75
58ae : d0 03 __ BNE $58b3 ; (sformat.s51 + 0)
58b0 : 4c 70 5a JMP $5a70 ; (sformat.s291 + 0)
.s51:
58b3 : c9 55 __ CMP #$55
58b5 : d0 03 __ BNE $58ba ; (sformat.s49 + 0)
58b7 : 4c 70 5a JMP $5a70 ; (sformat.s291 + 0)
.s49:
58ba : c9 78 __ CMP #$78
58bc : f0 04 __ BEQ $58c2 ; (sformat.s52 + 0)
.s55:
58be : c9 58 __ CMP #$58
58c0 : d0 0d __ BNE $58cf ; (sformat.s53 + 0)
.s52:
58c2 : a9 10 __ LDA #$10
58c4 : 8d e3 bf STA $bfe3 ; (wrapbuffer + 69)
58c7 : a9 00 __ LDA #$00
58c9 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 70)
58cc : 4c 70 5a JMP $5a70 ; (sformat.s291 + 0)
.s53:
58cf : c9 6c __ CMP #$6c
58d1 : d0 03 __ BNE $58d6 ; (sformat.s59 + 0)
58d3 : 4c e7 59 JMP $59e7 ; (sformat.s56 + 0)
.s59:
58d6 : c9 4c __ CMP #$4c
58d8 : d0 03 __ BNE $58dd ; (sformat.s57 + 0)
58da : 4c e7 59 JMP $59e7 ; (sformat.s56 + 0)
.s57:
58dd : c9 73 __ CMP #$73
58df : f0 54 __ BEQ $5935 ; (sformat.s72 + 0)
.s75:
58e1 : c9 53 __ CMP #$53
58e3 : f0 50 __ BEQ $5935 ; (sformat.s72 + 0)
.s73:
58e5 : c9 63 __ CMP #$63
58e7 : f0 23 __ BEQ $590c ; (sformat.s103 + 0)
.s106:
58e9 : c9 43 __ CMP #$43
58eb : f0 1f __ BEQ $590c ; (sformat.s103 + 0)
.s104:
58ed : 09 00 __ ORA #$00
58ef : d0 03 __ BNE $58f4 ; (sformat.s107 + 0)
58f1 : 4c df 56 JMP $56df ; (sformat.l1 + 0)
.s107:
58f4 : 18 __ __ CLC
58f5 : a5 16 __ LDA P9 ; (buff + 0)
58f7 : 65 47 __ ADC T0 + 0 
58f9 : 85 44 __ STA T6 + 0 
58fb : a5 17 __ LDA P10 ; (buff + 1)
58fd : 69 00 __ ADC #$00
58ff : 85 45 __ STA T6 + 1 
5901 : a5 4c __ LDA T5 + 0 
.s1068:
5903 : a0 00 __ LDY #$00
5905 : 91 44 __ STA (T6 + 0),y 
5907 : e6 47 __ INC T0 + 0 
5909 : 4c df 56 JMP $56df ; (sformat.l1 + 0)
.s103:
590c : ad fa bf LDA $bffa ; (sstack + 2)
590f : 85 4c __ STA T5 + 0 
5911 : 18 __ __ CLC
5912 : 69 02 __ ADC #$02
5914 : 8d fa bf STA $bffa ; (sstack + 2)
5917 : ad fb bf LDA $bffb ; (sstack + 3)
591a : 85 4d __ STA T5 + 1 
591c : 69 00 __ ADC #$00
591e : 8d fb bf STA $bffb ; (sstack + 3)
5921 : 18 __ __ CLC
5922 : a5 16 __ LDA P9 ; (buff + 0)
5924 : 65 47 __ ADC T0 + 0 
5926 : 85 44 __ STA T6 + 0 
5928 : a5 17 __ LDA P10 ; (buff + 1)
592a : 69 00 __ ADC #$00
592c : 85 45 __ STA T6 + 1 
592e : a0 00 __ LDY #$00
5930 : b1 4c __ LDA (T5 + 0),y 
5932 : 4c 03 59 JMP $5903 ; (sformat.s1068 + 0)
.s72:
5935 : ad fa bf LDA $bffa ; (sstack + 2)
5938 : 85 4c __ STA T5 + 0 
593a : 18 __ __ CLC
593b : 69 02 __ ADC #$02
593d : 8d fa bf STA $bffa ; (sstack + 2)
5940 : ad fb bf LDA $bffb ; (sstack + 3)
5943 : 85 4d __ STA T5 + 1 
5945 : 69 00 __ ADC #$00
5947 : 8d fb bf STA $bffb ; (sstack + 3)
594a : a0 00 __ LDY #$00
594c : 84 4b __ STY T3 + 0 
594e : b1 4c __ LDA (T5 + 0),y 
5950 : aa __ __ TAX
5951 : c8 __ __ INY
5952 : b1 4c __ LDA (T5 + 0),y 
5954 : 86 4c __ STX T5 + 0 
5956 : 85 4d __ STA T5 + 1 
5958 : ad e1 bf LDA $bfe1 ; (wrapbuffer + 67)
595b : f0 0c __ BEQ $5969 ; (sformat.s78 + 0)
.s1073:
595d : 88 __ __ DEY
595e : b1 4c __ LDA (T5 + 0),y 
5960 : f0 05 __ BEQ $5967 ; (sformat.s1074 + 0)
.l80:
5962 : c8 __ __ INY
5963 : b1 4c __ LDA (T5 + 0),y 
5965 : d0 fb __ BNE $5962 ; (sformat.l80 + 0)
.s1074:
5967 : 84 4b __ STY T3 + 0 
.s78:
5969 : ad e6 bf LDA $bfe6 ; (wrapbuffer + 72)
596c : d0 19 __ BNE $5987 ; (sformat.s84 + 0)
.s1077:
596e : a6 4b __ LDX T3 + 0 
5970 : ec e1 bf CPX $bfe1 ; (wrapbuffer + 67)
5973 : a4 47 __ LDY T0 + 0 
5975 : b0 0c __ BCS $5983 ; (sformat.s1078 + 0)
.l86:
5977 : ad e0 bf LDA $bfe0 ; (wrapbuffer + 66)
597a : 91 16 __ STA (P9),y ; (buff + 0)
597c : e8 __ __ INX
597d : ec e1 bf CPX $bfe1 ; (wrapbuffer + 67)
5980 : c8 __ __ INY
5981 : 90 f4 __ BCC $5977 ; (sformat.l86 + 0)
.s1078:
5983 : 86 4b __ STX T3 + 0 
5985 : 84 47 __ STY T0 + 0 
.s84:
5987 : ad fc bf LDA $bffc ; (sstack + 4)
598a : d0 37 __ BNE $59c3 ; (sformat.s88 + 0)
.l94:
598c : a0 00 __ LDY #$00
598e : b1 4c __ LDA (T5 + 0),y 
5990 : f0 0f __ BEQ $59a1 ; (sformat.s251 + 0)
.s95:
5992 : a4 47 __ LDY T0 + 0 
5994 : 91 16 __ STA (P9),y ; (buff + 0)
5996 : e6 47 __ INC T0 + 0 
5998 : e6 4c __ INC T5 + 0 
599a : d0 f0 __ BNE $598c ; (sformat.l94 + 0)
.s1087:
599c : e6 4d __ INC T5 + 1 
599e : 4c 8c 59 JMP $598c ; (sformat.l94 + 0)
.s251:
59a1 : ad e6 bf LDA $bfe6 ; (wrapbuffer + 72)
59a4 : d0 03 __ BNE $59a9 ; (sformat.s1075 + 0)
59a6 : 4c df 56 JMP $56df ; (sformat.l1 + 0)
.s1075:
59a9 : a6 4b __ LDX T3 + 0 
59ab : ec e1 bf CPX $bfe1 ; (wrapbuffer + 67)
59ae : a4 47 __ LDY T0 + 0 
59b0 : b0 0c __ BCS $59be ; (sformat.s1076 + 0)
.l101:
59b2 : ad e0 bf LDA $bfe0 ; (wrapbuffer + 66)
59b5 : 91 16 __ STA (P9),y ; (buff + 0)
59b7 : e8 __ __ INX
59b8 : ec e1 bf CPX $bfe1 ; (wrapbuffer + 67)
59bb : c8 __ __ INY
59bc : 90 f4 __ BCC $59b2 ; (sformat.l101 + 0)
.s1076:
59be : 84 47 __ STY T0 + 0 
59c0 : 4c df 56 JMP $56df ; (sformat.l1 + 0)
.s88:
59c3 : a5 47 __ LDA T0 + 0 
59c5 : f0 1a __ BEQ $59e1 ; (sformat.s93 + 0)
.s91:
59c7 : a5 16 __ LDA P9 ; (buff + 0)
59c9 : 85 0d __ STA P0 
59cb : a5 17 __ LDA P10 ; (buff + 1)
59cd : 85 0e __ STA P1 
59cf : a9 00 __ LDA #$00
59d1 : a4 47 __ LDY T0 + 0 
59d3 : 91 16 __ STA (P9),y ; (buff + 0)
59d5 : 20 c3 5a JSR $5ac3 ; (puts.s0 + 0)
59d8 : 20 bb 5a JSR $5abb ; (puts@proxy + 0)
59db : a9 00 __ LDA #$00
59dd : 85 47 __ STA T0 + 0 
59df : f0 c0 __ BEQ $59a1 ; (sformat.s251 + 0)
.s93:
59e1 : 20 bb 5a JSR $5abb ; (puts@proxy + 0)
59e4 : 4c a1 59 JMP $59a1 ; (sformat.s251 + 0)
.s56:
59e7 : ad fa bf LDA $bffa ; (sstack + 2)
59ea : 85 4c __ STA T5 + 0 
59ec : 18 __ __ CLC
59ed : 69 04 __ ADC #$04
59ef : 8d fa bf STA $bffa ; (sstack + 2)
59f2 : ad fb bf LDA $bffb ; (sstack + 3)
59f5 : 85 4d __ STA T5 + 1 
59f7 : 69 00 __ ADC #$00
59f9 : 8d fb bf STA $bffb ; (sstack + 3)
59fc : a0 00 __ LDY #$00
59fe : b1 49 __ LDA (T1 + 0),y 
5a00 : aa __ __ TAX
5a01 : e6 49 __ INC T1 + 0 
5a03 : d0 02 __ BNE $5a07 ; (sformat.s1086 + 0)
.s1085:
5a05 : e6 4a __ INC T1 + 1 
.s1086:
5a07 : b1 4c __ LDA (T5 + 0),y 
5a09 : 85 53 __ STA T7 + 0 
5a0b : a0 01 __ LDY #$01
5a0d : b1 4c __ LDA (T5 + 0),y 
5a0f : 85 54 __ STA T7 + 1 
5a11 : c8 __ __ INY
5a12 : b1 4c __ LDA (T5 + 0),y 
5a14 : 85 55 __ STA T7 + 2 
5a16 : c8 __ __ INY
5a17 : b1 4c __ LDA (T5 + 0),y 
5a19 : a8 __ __ TAY
5a1a : 8a __ __ TXA
5a1b : e0 64 __ CPX #$64
5a1d : f0 04 __ BEQ $5a23 ; (sformat.s60 + 0)
.s63:
5a1f : c9 44 __ CMP #$44
5a21 : d0 04 __ BNE $5a27 ; (sformat.s61 + 0)
.s60:
5a23 : a9 01 __ LDA #$01
5a25 : d0 1f __ BNE $5a46 ; (sformat.s262 + 0)
.s61:
5a27 : c9 75 __ CMP #$75
5a29 : f0 19 __ BEQ $5a44 ; (sformat.s292 + 0)
.s67:
5a2b : c9 55 __ CMP #$55
5a2d : f0 15 __ BEQ $5a44 ; (sformat.s292 + 0)
.s65:
5a2f : c9 78 __ CMP #$78
5a31 : f0 07 __ BEQ $5a3a ; (sformat.s68 + 0)
.s71:
5a33 : c9 58 __ CMP #$58
5a35 : f0 03 __ BEQ $5a3a ; (sformat.s68 + 0)
5a37 : 4c df 56 JMP $56df ; (sformat.l1 + 0)
.s68:
5a3a : a9 10 __ LDA #$10
5a3c : 8d e3 bf STA $bfe3 ; (wrapbuffer + 69)
5a3f : a9 00 __ LDA #$00
5a41 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 70)
.s292:
5a44 : a9 00 __ LDA #$00
.s262:
5a46 : 84 14 __ STY P7 
5a48 : 85 15 __ STA P8 
5a4a : a5 16 __ LDA P9 ; (buff + 0)
5a4c : 85 0f __ STA P2 
5a4e : a5 17 __ LDA P10 ; (buff + 1)
5a50 : 85 10 __ STA P3 
5a52 : a5 53 __ LDA T7 + 0 
5a54 : 85 11 __ STA P4 
5a56 : a5 54 __ LDA T7 + 1 
5a58 : 85 12 __ STA P5 
5a5a : a5 55 __ LDA T7 + 2 
5a5c : 85 13 __ STA P6 
5a5e : a9 e0 __ LDA #$e0
5a60 : 85 0d __ STA P0 
5a62 : a9 bf __ LDA #$bf
5a64 : 85 0e __ STA P1 
5a66 : 20 4d 5c JSR $5c4d ; (nforml.s0 + 0)
.s1069:
5a69 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
5a6b : 85 47 __ STA T0 + 0 
5a6d : 4c df 56 JMP $56df ; (sformat.l1 + 0)
.s291:
5a70 : a9 00 __ LDA #$00
.s261:
5a72 : 85 13 __ STA P6 
5a74 : a5 16 __ LDA P9 ; (buff + 0)
5a76 : 85 0f __ STA P2 
5a78 : a5 17 __ LDA P10 ; (buff + 1)
5a7a : 85 10 __ STA P3 
5a7c : ad fa bf LDA $bffa ; (sstack + 2)
5a7f : 85 47 __ STA T0 + 0 
5a81 : ad fb bf LDA $bffb ; (sstack + 3)
5a84 : 85 48 __ STA T0 + 1 
5a86 : a0 00 __ LDY #$00
5a88 : b1 47 __ LDA (T0 + 0),y 
5a8a : 85 11 __ STA P4 
5a8c : c8 __ __ INY
5a8d : b1 47 __ LDA (T0 + 0),y 
5a8f : 85 12 __ STA P5 
5a91 : 18 __ __ CLC
5a92 : a5 47 __ LDA T0 + 0 
5a94 : 69 02 __ ADC #$02
5a96 : 8d fa bf STA $bffa ; (sstack + 2)
5a99 : a5 48 __ LDA T0 + 1 
5a9b : 69 00 __ ADC #$00
5a9d : 8d fb bf STA $bffb ; (sstack + 3)
5aa0 : a9 e0 __ LDA #$e0
5aa2 : 85 0d __ STA P0 
5aa4 : a9 bf __ LDA #$bf
5aa6 : 85 0e __ STA P1 
5aa8 : 20 18 5b JSR $5b18 ; (nformi.s0 + 0)
5aab : 4c 69 5a JMP $5a69 ; (sformat.s1069 + 0)
.s264:
5aae : a0 00 __ LDY #$00
5ab0 : b1 49 __ LDA (T1 + 0),y 
5ab2 : aa __ __ TAX
5ab3 : 18 __ __ CLC
5ab4 : a5 49 __ LDA T1 + 0 
5ab6 : 69 01 __ ADC #$01
5ab8 : 4c ba 57 JMP $57ba ; (sformat.l14 + 0)
--------------------------------------------------------------------
puts@proxy: ; puts@proxy
5abb : a5 4c __ LDA $4c 
5abd : 85 0d __ STA P0 
5abf : a5 4d __ LDA $4d 
5ac1 : 85 0e __ STA P1 
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
5ac3 : a0 00 __ LDY #$00
5ac5 : b1 0d __ LDA (P0),y 
5ac7 : f0 0b __ BEQ $5ad4 ; (puts.s1001 + 0)
5ac9 : 20 d5 5a JSR $5ad5 ; (putpch + 0)
5acc : e6 0d __ INC P0 
5ace : d0 f3 __ BNE $5ac3 ; (puts.s0 + 0)
5ad0 : e6 0e __ INC P1 
5ad2 : d0 ef __ BNE $5ac3 ; (puts.s0 + 0)
.s1001:
5ad4 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
5ad5 : ae ff 5e LDX $5eff ; (giocharmap + 0)
5ad8 : e0 01 __ CPX #$01
5ada : 90 26 __ BCC $5b02 ; (putpch + 45)
5adc : c9 0a __ CMP #$0a
5ade : d0 02 __ BNE $5ae2 ; (putpch + 13)
5ae0 : a9 0d __ LDA #$0d
5ae2 : c9 09 __ CMP #$09
5ae4 : f0 1f __ BEQ $5b05 ; (putpch + 48)
5ae6 : e0 02 __ CPX #$02
5ae8 : 90 18 __ BCC $5b02 ; (putpch + 45)
5aea : c9 41 __ CMP #$41
5aec : 90 14 __ BCC $5b02 ; (putpch + 45)
5aee : c9 7b __ CMP #$7b
5af0 : b0 10 __ BCS $5b02 ; (putpch + 45)
5af2 : c9 61 __ CMP #$61
5af4 : b0 04 __ BCS $5afa ; (putpch + 37)
5af6 : c9 5b __ CMP #$5b
5af8 : b0 08 __ BCS $5b02 ; (putpch + 45)
5afa : 49 20 __ EOR #$20
5afc : e0 03 __ CPX #$03
5afe : f0 02 __ BEQ $5b02 ; (putpch + 45)
5b00 : 29 df __ AND #$df
5b02 : 4c d2 ff JMP $ffd2 
5b05 : 38 __ __ SEC
5b06 : 20 f0 ff JSR $fff0 
5b09 : 98 __ __ TYA
5b0a : 29 03 __ AND #$03
5b0c : 49 03 __ EOR #$03
5b0e : aa __ __ TAX
5b0f : a9 20 __ LDA #$20
5b11 : 20 d2 ff JSR $ffd2 
5b14 : ca __ __ DEX
5b15 : 10 fa __ BPL $5b11 ; (putpch + 60)
5b17 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
5b18 : a9 00 __ LDA #$00
5b1a : 85 43 __ STA T0 + 0 
5b1c : a5 13 __ LDA P6 ; (s + 0)
5b1e : f0 13 __ BEQ $5b33 ; (nformi.s182 + 0)
.s4:
5b20 : 24 12 __ BIT P5 ; (v + 1)
5b22 : 10 0f __ BPL $5b33 ; (nformi.s182 + 0)
.s1:
5b24 : 38 __ __ SEC
5b25 : a9 00 __ LDA #$00
5b27 : e5 11 __ SBC P4 ; (v + 0)
5b29 : 85 11 __ STA P4 ; (v + 0)
5b2b : a9 00 __ LDA #$00
5b2d : e5 12 __ SBC P5 ; (v + 1)
5b2f : 85 12 __ STA P5 ; (v + 1)
5b31 : e6 43 __ INC T0 + 0 
.s182:
5b33 : a9 10 __ LDA #$10
5b35 : 85 44 __ STA T2 + 0 
5b37 : a5 11 __ LDA P4 ; (v + 0)
5b39 : 05 12 __ ORA P5 ; (v + 1)
5b3b : f0 46 __ BEQ $5b83 ; (nformi.s7 + 0)
.s42:
5b3d : a0 03 __ LDY #$03
5b3f : b1 0d __ LDA (P0),y ; (si + 0)
5b41 : 85 45 __ STA T4 + 0 
5b43 : c8 __ __ INY
5b44 : b1 0d __ LDA (P0),y ; (si + 0)
5b46 : 85 46 __ STA T4 + 1 
.l6:
5b48 : a5 11 __ LDA P4 ; (v + 0)
5b4a : 85 1b __ STA ACCU + 0 
5b4c : a5 12 __ LDA P5 ; (v + 1)
5b4e : 85 1c __ STA ACCU + 1 
5b50 : a5 45 __ LDA T4 + 0 
5b52 : 85 03 __ STA WORK + 0 
5b54 : a5 46 __ LDA T4 + 1 
5b56 : 85 04 __ STA WORK + 1 
5b58 : 20 16 85 JSR $8516 ; (divmod + 0)
5b5b : a5 06 __ LDA WORK + 3 
5b5d : 30 08 __ BMI $5b67 ; (nformi.s78 + 0)
.s1019:
5b5f : d0 0a __ BNE $5b6b ; (nformi.s77 + 0)
.s1018:
5b61 : a5 05 __ LDA WORK + 2 
5b63 : c9 0a __ CMP #$0a
5b65 : b0 04 __ BCS $5b6b ; (nformi.s77 + 0)
.s78:
5b67 : a9 30 __ LDA #$30
5b69 : d0 02 __ BNE $5b6d ; (nformi.s79 + 0)
.s77:
5b6b : a9 37 __ LDA #$37
.s79:
5b6d : 18 __ __ CLC
5b6e : 65 05 __ ADC WORK + 2 
5b70 : c6 44 __ DEC T2 + 0 
5b72 : a6 44 __ LDX T2 + 0 
5b74 : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
5b77 : a5 1b __ LDA ACCU + 0 
5b79 : 85 11 __ STA P4 ; (v + 0)
5b7b : a5 1c __ LDA ACCU + 1 
5b7d : 85 12 __ STA P5 ; (v + 1)
5b7f : 05 11 __ ORA P4 ; (v + 0)
5b81 : d0 c5 __ BNE $5b48 ; (nformi.l6 + 0)
.s7:
5b83 : a0 02 __ LDY #$02
5b85 : b1 0d __ LDA (P0),y ; (si + 0)
5b87 : c9 ff __ CMP #$ff
5b89 : d0 04 __ BNE $5b8f ; (nformi.s80 + 0)
.s81:
5b8b : a9 0f __ LDA #$0f
5b8d : d0 05 __ BNE $5b94 ; (nformi.s1026 + 0)
.s80:
5b8f : 38 __ __ SEC
5b90 : a9 10 __ LDA #$10
5b92 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
5b94 : a8 __ __ TAY
5b95 : c4 44 __ CPY T2 + 0 
5b97 : b0 0d __ BCS $5ba6 ; (nformi.s10 + 0)
.s9:
5b99 : a9 30 __ LDA #$30
.l1027:
5b9b : c6 44 __ DEC T2 + 0 
5b9d : a6 44 __ LDX T2 + 0 
5b9f : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
5ba2 : c4 44 __ CPY T2 + 0 
5ba4 : 90 f5 __ BCC $5b9b ; (nformi.l1027 + 0)
.s10:
5ba6 : a0 07 __ LDY #$07
5ba8 : b1 0d __ LDA (P0),y ; (si + 0)
5baa : f0 20 __ BEQ $5bcc ; (nformi.s13 + 0)
.s14:
5bac : a0 04 __ LDY #$04
5bae : b1 0d __ LDA (P0),y ; (si + 0)
5bb0 : d0 1a __ BNE $5bcc ; (nformi.s13 + 0)
.s1013:
5bb2 : 88 __ __ DEY
5bb3 : b1 0d __ LDA (P0),y ; (si + 0)
5bb5 : c9 10 __ CMP #$10
5bb7 : d0 13 __ BNE $5bcc ; (nformi.s13 + 0)
.s11:
5bb9 : a9 58 __ LDA #$58
5bbb : a6 44 __ LDX T2 + 0 
5bbd : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 73)
5bc0 : 8a __ __ TXA
5bc1 : 18 __ __ CLC
5bc2 : 69 fe __ ADC #$fe
5bc4 : 85 44 __ STA T2 + 0 
5bc6 : aa __ __ TAX
5bc7 : a9 30 __ LDA #$30
5bc9 : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
.s13:
5bcc : a9 00 __ LDA #$00
5bce : 85 1b __ STA ACCU + 0 
5bd0 : a5 43 __ LDA T0 + 0 
5bd2 : f0 06 __ BEQ $5bda ; (nformi.s16 + 0)
.s15:
5bd4 : c6 44 __ DEC T2 + 0 
5bd6 : a9 2d __ LDA #$2d
5bd8 : d0 0a __ BNE $5be4 ; (nformi.s1025 + 0)
.s16:
5bda : a0 05 __ LDY #$05
5bdc : b1 0d __ LDA (P0),y ; (si + 0)
5bde : f0 09 __ BEQ $5be9 ; (nformi.s163 + 0)
.s18:
5be0 : c6 44 __ DEC T2 + 0 
5be2 : a9 2b __ LDA #$2b
.s1025:
5be4 : a6 44 __ LDX T2 + 0 
5be6 : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
.s163:
5be9 : a0 06 __ LDY #$06
5beb : b1 0d __ LDA (P0),y ; (si + 0)
5bed : d0 33 __ BNE $5c22 ; (nformi.s24 + 0)
.l30:
5bef : a0 01 __ LDY #$01
5bf1 : b1 0d __ LDA (P0),y ; (si + 0)
5bf3 : 18 __ __ CLC
5bf4 : 65 44 __ ADC T2 + 0 
5bf6 : b0 04 __ BCS $5bfc ; (nformi.s31 + 0)
.s1006:
5bf8 : c9 11 __ CMP #$11
5bfa : 90 0d __ BCC $5c09 ; (nformi.s33 + 0)
.s31:
5bfc : c6 44 __ DEC T2 + 0 
5bfe : a0 00 __ LDY #$00
5c00 : b1 0d __ LDA (P0),y ; (si + 0)
5c02 : a6 44 __ LDX T2 + 0 
5c04 : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
5c07 : b0 e6 __ BCS $5bef ; (nformi.l30 + 0)
.s33:
5c09 : a6 44 __ LDX T2 + 0 
5c0b : e0 10 __ CPX #$10
5c0d : b0 0e __ BCS $5c1d ; (nformi.s23 + 0)
.s34:
5c0f : 88 __ __ DEY
.l1022:
5c10 : bd e8 bf LDA $bfe8,x ; (wrapbuffer + 74)
5c13 : 91 0f __ STA (P2),y ; (str + 0)
5c15 : e8 __ __ INX
5c16 : e0 10 __ CPX #$10
5c18 : c8 __ __ INY
5c19 : 90 f5 __ BCC $5c10 ; (nformi.l1022 + 0)
.s1023:
5c1b : 84 1b __ STY ACCU + 0 
.s23:
5c1d : a9 00 __ LDA #$00
5c1f : 85 1c __ STA ACCU + 1 
.s1001:
5c21 : 60 __ __ RTS
.s24:
5c22 : a6 44 __ LDX T2 + 0 
5c24 : e0 10 __ CPX #$10
5c26 : b0 1a __ BCS $5c42 ; (nformi.l27 + 0)
.s25:
5c28 : a0 00 __ LDY #$00
.l1020:
5c2a : bd e8 bf LDA $bfe8,x ; (wrapbuffer + 74)
5c2d : 91 0f __ STA (P2),y ; (str + 0)
5c2f : e8 __ __ INX
5c30 : e0 10 __ CPX #$10
5c32 : c8 __ __ INY
5c33 : 90 f5 __ BCC $5c2a ; (nformi.l1020 + 0)
.s1021:
5c35 : 84 1b __ STY ACCU + 0 
5c37 : b0 09 __ BCS $5c42 ; (nformi.l27 + 0)
.s28:
5c39 : 88 __ __ DEY
5c3a : b1 0d __ LDA (P0),y ; (si + 0)
5c3c : a4 1b __ LDY ACCU + 0 
5c3e : 91 0f __ STA (P2),y ; (str + 0)
5c40 : e6 1b __ INC ACCU + 0 
.l27:
5c42 : a5 1b __ LDA ACCU + 0 
5c44 : a0 01 __ LDY #$01
5c46 : d1 0d __ CMP (P0),y ; (si + 0)
5c48 : 90 ef __ BCC $5c39 ; (nformi.s28 + 0)
5c4a : 4c 1d 5c JMP $5c1d ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
5c4d : a9 00 __ LDA #$00
5c4f : 85 43 __ STA T0 + 0 
5c51 : a5 15 __ LDA P8 ; (s + 0)
5c53 : f0 21 __ BEQ $5c76 ; (nforml.s182 + 0)
.s4:
5c55 : a5 14 __ LDA P7 ; (v + 3)
5c57 : f0 1d __ BEQ $5c76 ; (nforml.s182 + 0)
.s1032:
5c59 : 10 1b __ BPL $5c76 ; (nforml.s182 + 0)
.s1:
5c5b : 38 __ __ SEC
5c5c : a9 00 __ LDA #$00
5c5e : e5 11 __ SBC P4 ; (v + 0)
5c60 : 85 11 __ STA P4 ; (v + 0)
5c62 : a9 00 __ LDA #$00
5c64 : e5 12 __ SBC P5 ; (v + 1)
5c66 : 85 12 __ STA P5 ; (v + 1)
5c68 : a9 00 __ LDA #$00
5c6a : e5 13 __ SBC P6 ; (v + 2)
5c6c : 85 13 __ STA P6 ; (v + 2)
5c6e : a9 00 __ LDA #$00
5c70 : e5 14 __ SBC P7 ; (v + 3)
5c72 : 85 14 __ STA P7 ; (v + 3)
5c74 : e6 43 __ INC T0 + 0 
.s182:
5c76 : a9 10 __ LDA #$10
5c78 : 85 44 __ STA T2 + 0 
5c7a : a5 14 __ LDA P7 ; (v + 3)
5c7c : d0 0c __ BNE $5c8a ; (nforml.s42 + 0)
.s1024:
5c7e : a5 13 __ LDA P6 ; (v + 2)
5c80 : d0 08 __ BNE $5c8a ; (nforml.s42 + 0)
.s1025:
5c82 : a5 12 __ LDA P5 ; (v + 1)
5c84 : d0 04 __ BNE $5c8a ; (nforml.s42 + 0)
.s1026:
5c86 : c5 11 __ CMP P4 ; (v + 0)
5c88 : b0 0e __ BCS $5c98 ; (nforml.s7 + 0)
.s42:
5c8a : a0 03 __ LDY #$03
5c8c : b1 0d __ LDA (P0),y ; (si + 0)
5c8e : 85 45 __ STA T5 + 0 
5c90 : c8 __ __ INY
5c91 : b1 0d __ LDA (P0),y ; (si + 0)
5c93 : 85 46 __ STA T5 + 1 
5c95 : 4c 62 5d JMP $5d62 ; (nforml.l6 + 0)
.s7:
5c98 : a0 02 __ LDY #$02
5c9a : b1 0d __ LDA (P0),y ; (si + 0)
5c9c : c9 ff __ CMP #$ff
5c9e : d0 04 __ BNE $5ca4 ; (nforml.s80 + 0)
.s81:
5ca0 : a9 0f __ LDA #$0f
5ca2 : d0 05 __ BNE $5ca9 ; (nforml.s1039 + 0)
.s80:
5ca4 : 38 __ __ SEC
5ca5 : a9 10 __ LDA #$10
5ca7 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
5ca9 : a8 __ __ TAY
5caa : c4 44 __ CPY T2 + 0 
5cac : b0 0d __ BCS $5cbb ; (nforml.s10 + 0)
.s9:
5cae : a9 30 __ LDA #$30
.l1040:
5cb0 : c6 44 __ DEC T2 + 0 
5cb2 : a6 44 __ LDX T2 + 0 
5cb4 : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
5cb7 : c4 44 __ CPY T2 + 0 
5cb9 : 90 f5 __ BCC $5cb0 ; (nforml.l1040 + 0)
.s10:
5cbb : a0 07 __ LDY #$07
5cbd : b1 0d __ LDA (P0),y ; (si + 0)
5cbf : f0 20 __ BEQ $5ce1 ; (nforml.s13 + 0)
.s14:
5cc1 : a0 04 __ LDY #$04
5cc3 : b1 0d __ LDA (P0),y ; (si + 0)
5cc5 : d0 1a __ BNE $5ce1 ; (nforml.s13 + 0)
.s1013:
5cc7 : 88 __ __ DEY
5cc8 : b1 0d __ LDA (P0),y ; (si + 0)
5cca : c9 10 __ CMP #$10
5ccc : d0 13 __ BNE $5ce1 ; (nforml.s13 + 0)
.s11:
5cce : a9 58 __ LDA #$58
5cd0 : a6 44 __ LDX T2 + 0 
5cd2 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 73)
5cd5 : 8a __ __ TXA
5cd6 : 18 __ __ CLC
5cd7 : 69 fe __ ADC #$fe
5cd9 : 85 44 __ STA T2 + 0 
5cdb : aa __ __ TAX
5cdc : a9 30 __ LDA #$30
5cde : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
.s13:
5ce1 : a9 00 __ LDA #$00
5ce3 : 85 1b __ STA ACCU + 0 
5ce5 : a5 43 __ LDA T0 + 0 
5ce7 : f0 06 __ BEQ $5cef ; (nforml.s16 + 0)
.s15:
5ce9 : c6 44 __ DEC T2 + 0 
5ceb : a9 2d __ LDA #$2d
5ced : d0 0a __ BNE $5cf9 ; (nforml.s1038 + 0)
.s16:
5cef : a0 05 __ LDY #$05
5cf1 : b1 0d __ LDA (P0),y ; (si + 0)
5cf3 : f0 09 __ BEQ $5cfe ; (nforml.s163 + 0)
.s18:
5cf5 : c6 44 __ DEC T2 + 0 
5cf7 : a9 2b __ LDA #$2b
.s1038:
5cf9 : a6 44 __ LDX T2 + 0 
5cfb : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
.s163:
5cfe : a0 06 __ LDY #$06
5d00 : b1 0d __ LDA (P0),y ; (si + 0)
5d02 : d0 33 __ BNE $5d37 ; (nforml.s24 + 0)
.l30:
5d04 : a0 01 __ LDY #$01
5d06 : b1 0d __ LDA (P0),y ; (si + 0)
5d08 : 18 __ __ CLC
5d09 : 65 44 __ ADC T2 + 0 
5d0b : b0 04 __ BCS $5d11 ; (nforml.s31 + 0)
.s1006:
5d0d : c9 11 __ CMP #$11
5d0f : 90 0d __ BCC $5d1e ; (nforml.s33 + 0)
.s31:
5d11 : c6 44 __ DEC T2 + 0 
5d13 : a0 00 __ LDY #$00
5d15 : b1 0d __ LDA (P0),y ; (si + 0)
5d17 : a6 44 __ LDX T2 + 0 
5d19 : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
5d1c : b0 e6 __ BCS $5d04 ; (nforml.l30 + 0)
.s33:
5d1e : a6 44 __ LDX T2 + 0 
5d20 : e0 10 __ CPX #$10
5d22 : b0 0e __ BCS $5d32 ; (nforml.s23 + 0)
.s34:
5d24 : 88 __ __ DEY
.l1035:
5d25 : bd e8 bf LDA $bfe8,x ; (wrapbuffer + 74)
5d28 : 91 0f __ STA (P2),y ; (str + 0)
5d2a : e8 __ __ INX
5d2b : e0 10 __ CPX #$10
5d2d : c8 __ __ INY
5d2e : 90 f5 __ BCC $5d25 ; (nforml.l1035 + 0)
.s1036:
5d30 : 84 1b __ STY ACCU + 0 
.s23:
5d32 : a9 00 __ LDA #$00
5d34 : 85 1c __ STA ACCU + 1 
.s1001:
5d36 : 60 __ __ RTS
.s24:
5d37 : a6 44 __ LDX T2 + 0 
5d39 : e0 10 __ CPX #$10
5d3b : b0 1a __ BCS $5d57 ; (nforml.l27 + 0)
.s25:
5d3d : a0 00 __ LDY #$00
.l1033:
5d3f : bd e8 bf LDA $bfe8,x ; (wrapbuffer + 74)
5d42 : 91 0f __ STA (P2),y ; (str + 0)
5d44 : e8 __ __ INX
5d45 : e0 10 __ CPX #$10
5d47 : c8 __ __ INY
5d48 : 90 f5 __ BCC $5d3f ; (nforml.l1033 + 0)
.s1034:
5d4a : 84 1b __ STY ACCU + 0 
5d4c : b0 09 __ BCS $5d57 ; (nforml.l27 + 0)
.s28:
5d4e : 88 __ __ DEY
5d4f : b1 0d __ LDA (P0),y ; (si + 0)
5d51 : a4 1b __ LDY ACCU + 0 
5d53 : 91 0f __ STA (P2),y ; (str + 0)
5d55 : e6 1b __ INC ACCU + 0 
.l27:
5d57 : a5 1b __ LDA ACCU + 0 
5d59 : a0 01 __ LDY #$01
5d5b : d1 0d __ CMP (P0),y ; (si + 0)
5d5d : 90 ef __ BCC $5d4e ; (nforml.s28 + 0)
5d5f : 4c 32 5d JMP $5d32 ; (nforml.s23 + 0)
.l6:
5d62 : a5 11 __ LDA P4 ; (v + 0)
5d64 : 85 1b __ STA ACCU + 0 
5d66 : a5 12 __ LDA P5 ; (v + 1)
5d68 : 85 1c __ STA ACCU + 1 
5d6a : a5 13 __ LDA P6 ; (v + 2)
5d6c : 85 1d __ STA ACCU + 2 
5d6e : a5 14 __ LDA P7 ; (v + 3)
5d70 : 85 1e __ STA ACCU + 3 
5d72 : a5 45 __ LDA T5 + 0 
5d74 : 85 03 __ STA WORK + 0 
5d76 : a5 46 __ LDA T5 + 1 
5d78 : 85 04 __ STA WORK + 1 
5d7a : a9 00 __ LDA #$00
5d7c : 85 05 __ STA WORK + 2 
5d7e : 85 06 __ STA WORK + 3 
5d80 : 20 9b 85 JSR $859b ; (divmod32 + 0)
5d83 : a5 08 __ LDA WORK + 5 
5d85 : 30 08 __ BMI $5d8f ; (nforml.s78 + 0)
.s1023:
5d87 : d0 0a __ BNE $5d93 ; (nforml.s77 + 0)
.s1022:
5d89 : a5 07 __ LDA WORK + 4 
5d8b : c9 0a __ CMP #$0a
5d8d : b0 04 __ BCS $5d93 ; (nforml.s77 + 0)
.s78:
5d8f : a9 30 __ LDA #$30
5d91 : d0 02 __ BNE $5d95 ; (nforml.s79 + 0)
.s77:
5d93 : a9 37 __ LDA #$37
.s79:
5d95 : 18 __ __ CLC
5d96 : 65 07 __ ADC WORK + 4 
5d98 : c6 44 __ DEC T2 + 0 
5d9a : a6 44 __ LDX T2 + 0 
5d9c : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
5d9f : a5 1b __ LDA ACCU + 0 
5da1 : 85 11 __ STA P4 ; (v + 0)
5da3 : a5 1c __ LDA ACCU + 1 
5da5 : 85 12 __ STA P5 ; (v + 1)
5da7 : a5 1d __ LDA ACCU + 2 
5da9 : 85 13 __ STA P6 ; (v + 2)
5dab : a5 1e __ LDA ACCU + 3 
5dad : 85 14 __ STA P7 ; (v + 3)
5daf : d0 b1 __ BNE $5d62 ; (nforml.l6 + 0)
.s1018:
5db1 : a5 13 __ LDA P6 ; (v + 2)
5db3 : d0 ad __ BNE $5d62 ; (nforml.l6 + 0)
.s1019:
5db5 : a5 12 __ LDA P5 ; (v + 1)
5db7 : d0 a9 __ BNE $5d62 ; (nforml.l6 + 0)
.s1020:
5db9 : c5 11 __ CMP P4 ; (v + 0)
5dbb : 90 a5 __ BCC $5d62 ; (nforml.l6 + 0)
5dbd : 4c 98 5c JMP $5c98 ; (nforml.s7 + 0)
--------------------------------------------------------------------
5dc0 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
5dd0 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
5de0 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->u8
.s0:
5deb : 20 f7 5d JSR $5df7 ; (getpch + 0)
5dee : c9 00 __ CMP #$00
5df0 : f0 f9 __ BEQ $5deb ; (getch.s0 + 0)
5df2 : 85 1b __ STA ACCU + 0 
.s1001:
5df4 : a5 1b __ LDA ACCU + 0 
5df6 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
5df7 : 20 e4 ff JSR $ffe4 
5dfa : ae ff 5e LDX $5eff ; (giocharmap + 0)
5dfd : e0 01 __ CPX #$01
5dff : 90 26 __ BCC $5e27 ; (getpch + 48)
5e01 : c9 0d __ CMP #$0d
5e03 : d0 02 __ BNE $5e07 ; (getpch + 16)
5e05 : a9 0a __ LDA #$0a
5e07 : e0 02 __ CPX #$02
5e09 : 90 1c __ BCC $5e27 ; (getpch + 48)
5e0b : c9 db __ CMP #$db
5e0d : b0 18 __ BCS $5e27 ; (getpch + 48)
5e0f : c9 41 __ CMP #$41
5e11 : 90 14 __ BCC $5e27 ; (getpch + 48)
5e13 : c9 c1 __ CMP #$c1
5e15 : 90 02 __ BCC $5e19 ; (getpch + 34)
5e17 : 49 a0 __ EOR #$a0
5e19 : c9 7b __ CMP #$7b
5e1b : b0 0a __ BCS $5e27 ; (getpch + 48)
5e1d : c9 61 __ CMP #$61
5e1f : b0 04 __ BCS $5e25 ; (getpch + 46)
5e21 : c9 5b __ CMP #$5b
5e23 : b0 02 __ BCS $5e27 ; (getpch + 48)
5e25 : 49 20 __ EOR #$20
5e27 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
5e28 : 4c 81 ff JMP $ff81 
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
5e2b : 20 8f 56 JSR $568f ; (screen_width.s0 + 0)
5e2e : c9 50 __ CMP #$50
5e30 : f0 03 __ BEQ $5e35 ; (screen_setmode.s1001 + 0)
.s1:
5e32 : 4c 5f ff JMP $ff5f 
.s1001:
5e35 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
5e36 : 38 __ __ SEC
5e37 : a5 23 __ LDA SP + 0 
5e39 : e9 06 __ SBC #$06
5e3b : 85 23 __ STA SP + 0 
5e3d : b0 02 __ BCS $5e41 ; (bnk_init.s0 + 0)
5e3f : c6 24 __ DEC SP + 1 
.s0:
5e41 : a9 ea __ LDA #$ea
5e43 : a0 02 __ LDY #$02
5e45 : 91 23 __ STA (SP + 0),y 
5e47 : a9 5e __ LDA #$5e
5e49 : c8 __ __ INY
5e4a : 91 23 __ STA (SP + 0),y 
5e4c : a5 ba __ LDA $ba 
5e4e : d0 02 __ BNE $5e52 ; (bnk_init.s4 + 0)
.s2:
5e50 : a9 08 __ LDA #$08
.s4:
5e52 : 85 4e __ STA T1 + 0 
5e54 : 8d fe 7b STA $7bfe ; (bootdevice + 0)
5e57 : a0 04 __ LDY #$04
5e59 : 91 23 __ STA (SP + 0),y 
5e5b : a9 00 __ LDA #$00
5e5d : c8 __ __ INY
5e5e : 91 23 __ STA (SP + 0),y 
5e60 : 20 99 56 JSR $5699 ; (printf.s0 + 0)
5e63 : a9 06 __ LDA #$06
5e65 : 8d 06 d5 STA $d506 
5e68 : a9 00 __ LDA #$00
5e6a : a0 02 __ LDY #$02
5e6c : 91 23 __ STA (SP + 0),y 
5e6e : a9 5f __ LDA #$5f
5e70 : c8 __ __ INY
5e71 : 91 23 __ STA (SP + 0),y 
5e73 : 20 99 56 JSR $5699 ; (printf.s0 + 0)
5e76 : a9 00 __ LDA #$00
5e78 : 85 0d __ STA P0 
5e7a : 85 0e __ STA P1 
5e7c : 20 25 5f JSR $5f25 ; (krnio_setbnk.s0 + 0)
5e7f : a9 1a __ LDA #$1a
5e81 : 85 0d __ STA P0 
5e83 : a9 5f __ LDA #$5f
5e85 : 85 0e __ STA P1 
5e87 : 20 2c 5f JSR $5f2c ; (krnio_setnam.s0 + 0)
5e8a : a9 1a __ LDA #$1a
5e8c : a0 04 __ LDY #$04
5e8e : 91 23 __ STA (SP + 0),y 
5e90 : a9 5f __ LDA #$5f
5e92 : c8 __ __ INY
5e93 : 91 23 __ STA (SP + 0),y 
5e95 : a9 42 __ LDA #$42
5e97 : a0 02 __ LDY #$02
5e99 : 91 23 __ STA (SP + 0),y 
5e9b : a9 5f __ LDA #$5f
5e9d : c8 __ __ INY
5e9e : 91 23 __ STA (SP + 0),y 
5ea0 : 20 99 56 JSR $5699 ; (printf.s0 + 0)
5ea3 : a9 01 __ LDA #$01
5ea5 : 85 0d __ STA P0 
5ea7 : 85 0f __ STA P2 
5ea9 : a5 4e __ LDA T1 + 0 
5eab : 85 0e __ STA P1 
5ead : 20 4f 5f JSR $5f4f ; (krnio_load.s0 + 0)
5eb0 : 09 00 __ ORA #$00
5eb2 : d0 2a __ BNE $5ede ; (bnk_init.s1001 + 0)
.s7:
5eb4 : a9 6c __ LDA #$6c
5eb6 : a0 02 __ LDY #$02
5eb8 : 91 23 __ STA (SP + 0),y 
5eba : a9 5f __ LDA #$5f
5ebc : c8 __ __ INY
5ebd : 91 23 __ STA (SP + 0),y 
5ebf : 20 99 56 JSR $5699 ; (printf.s0 + 0)
5ec2 : a9 8a __ LDA #$8a
5ec4 : a0 02 __ LDY #$02
5ec6 : 91 23 __ STA (SP + 0),y 
5ec8 : a9 5f __ LDA #$5f
5eca : c8 __ __ INY
5ecb : 91 23 __ STA (SP + 0),y 
5ecd : ad a0 8b LDA $8ba0 ; (krnio_pstatus + 1)
5ed0 : c8 __ __ INY
5ed1 : 91 23 __ STA (SP + 0),y 
5ed3 : a9 00 __ LDA #$00
5ed5 : c8 __ __ INY
5ed6 : 91 23 __ STA (SP + 0),y 
5ed8 : 20 99 56 JSR $5699 ; (printf.s0 + 0)
5edb : 20 96 5f JSR $5f96 ; (exit@proxy + 0)
.s1001:
5ede : 18 __ __ CLC
5edf : a5 23 __ LDA SP + 0 
5ee1 : 69 06 __ ADC #$06
5ee3 : 85 23 __ STA SP + 0 
5ee5 : 90 02 __ BCC $5ee9 ; (bnk_init.s1001 + 11)
5ee7 : e6 24 __ INC SP + 1 
5ee9 : 60 __ __ RTS
--------------------------------------------------------------------
5eea : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
5efa : __ __ __ BYT 65 4e 00                                        : eN.
--------------------------------------------------------------------
5efd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
spentry:
5efe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
5eff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
5f00 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
5f10 : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
5f1a : __ __ __ BYT 56 44 43 54 45 53 54 4c 4d 43 00                : VDCTESTLMC.
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
5f25 : a5 0d __ LDA P0 
5f27 : a6 0e __ LDX P1 
5f29 : 4c 68 ff JMP $ff68 
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
5f2c : a5 0d __ LDA P0 
5f2e : 05 0e __ ORA P1 
5f30 : f0 08 __ BEQ $5f3a ; (krnio_setnam.s0 + 14)
5f32 : a0 ff __ LDY #$ff
5f34 : c8 __ __ INY
5f35 : b1 0d __ LDA (P0),y 
5f37 : d0 fb __ BNE $5f34 ; (krnio_setnam.s0 + 8)
5f39 : 98 __ __ TYA
5f3a : a6 0d __ LDX P0 
5f3c : a4 0e __ LDY P1 
5f3e : 20 bd ff JSR $ffbd 
.s1001:
5f41 : 60 __ __ RTS
--------------------------------------------------------------------
5f42 : __ __ __ BYT 4c 4f 41 44 49 4e 47 3a 20 25 53 0a 00          : LOADING: %S..
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
5f4f : a5 0d __ LDA P0 
5f51 : a6 0e __ LDX P1 
5f53 : a4 0f __ LDY P2 
5f55 : 20 ba ff JSR $ffba 
5f58 : a9 00 __ LDA #$00
5f5a : a2 00 __ LDX #$00
5f5c : a0 00 __ LDY #$00
5f5e : 20 d5 ff JSR $ffd5 
5f61 : a9 00 __ LDA #$00
5f63 : b0 02 __ BCS $5f67 ; (krnio_load.s0 + 24)
5f65 : a9 01 __ LDA #$01
5f67 : 85 1b __ STA ACCU + 0 
.s1001:
5f69 : a5 1b __ LDA ACCU + 0 
5f6b : 60 __ __ RTS
--------------------------------------------------------------------
5f6c : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
5f7c : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
5f8a : __ __ __ BYT 53 54 41 54 55 53 3a 20 25 44 0a 00             : STATUS: %D..
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
5f96 : a9 01 __ LDA #$01
5f98 : 85 0d __ STA P0 
5f9a : a9 00 __ LDA #$00
5f9c : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
5f9e : a5 0d __ LDA P0 
5fa0 : 85 1b __ STA ACCU + 0 
5fa2 : a5 0e __ LDA P1 
5fa4 : 85 1c __ STA ACCU + 1 
5fa6 : ae fe 5e LDX $5efe ; (spentry + 0)
5fa9 : 9a __ __ TXS
5faa : a9 4c __ LDA #$4c
5fac : 85 54 __ STA $54 
5fae : a9 00 __ LDA #$00
5fb0 : 85 13 __ STA P6 
.s1001:
5fb2 : 60 __ __ RTS
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
5fb3 : 09 00 __ ORA #$00
5fb5 : d0 0d __ BNE $5fc4 ; (fastmode.s1 + 0)
.s2:
5fb7 : 8d 30 d0 STA $d030 
5fba : ad 11 d0 LDA $d011 
5fbd : 29 7f __ AND #$7f
5fbf : 09 10 __ ORA #$10
5fc1 : 4c ce 5f JMP $5fce ; (fastmode.s3 + 0)
.s1:
5fc4 : a9 01 __ LDA #$01
5fc6 : 8d 30 d0 STA $d030 
5fc9 : ad 11 d0 LDA $d011 
5fcc : 29 6f __ AND #$6f
.s3:
5fce : 8d 11 d0 STA $d011 
.s1001:
5fd1 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s0:
5fd2 : a4 13 __ LDY P6 ; (mode + 0)
5fd4 : be 31 86 LDX $8631,y ; (__multab36L + 0)
5fd7 : 86 4a __ STX T1 + 0 
5fd9 : 86 4c __ STX T2 + 0 
5fdb : bd 04 87 LDA $8704,x ; (vdc_modes + 4)
5fde : f0 08 __ BEQ $5fe8 ; (vdc_set_mode.s3 + 0)
.s4:
5fe0 : ad f6 8a LDA $8af6 ; (vdc_state + 0)
5fe3 : c9 10 __ CMP #$10
5fe5 : d0 01 __ BNE $5fe8 ; (vdc_set_mode.s3 + 0)
5fe7 : 60 __ __ RTS
.s3:
5fe8 : 8c f8 8a STY $8af8 ; (vdc_state + 2)
5feb : a9 00 __ LDA #$00
5fed : 8d 0c 8b STA $8b0c ; (vdc_state + 22)
5ff0 : 8d 0d 8b STA $8b0d ; (vdc_state + 23)
5ff3 : 8d 0e 8b STA $8b0e ; (vdc_state + 24)
5ff6 : bd 00 87 LDA $8700,x ; (vdc_modes + 0)
5ff9 : 8d f9 8a STA $8af9 ; (vdc_state + 3)
5ffc : bd 01 87 LDA $8701,x ; (vdc_modes + 1)
5fff : 8d fa 8a STA $8afa ; (vdc_state + 4)
6002 : bd 02 87 LDA $8702,x ; (vdc_modes + 2)
6005 : 8d fb 8a STA $8afb ; (vdc_state + 5)
6008 : bd 03 87 LDA $8703,x ; (vdc_modes + 3)
600b : 8d fc 8a STA $8afc ; (vdc_state + 6)
600e : bd 09 87 LDA $8709,x ; (vdc_modes + 9)
6011 : 8d 02 8b STA $8b02 ; (vdc_state + 12)
6014 : bd 0a 87 LDA $870a,x ; (vdc_modes + 10)
6017 : 8d 03 8b STA $8b03 ; (vdc_state + 13)
601a : bd 0b 87 LDA $870b,x ; (vdc_modes + 11)
601d : 8d 04 8b STA $8b04 ; (vdc_state + 14)
6020 : bd 0c 87 LDA $870c,x ; (vdc_modes + 12)
6023 : 8d 05 8b STA $8b05 ; (vdc_state + 15)
6026 : bd 0d 87 LDA $870d,x ; (vdc_modes + 13)
6029 : 8d 06 8b STA $8b06 ; (vdc_state + 16)
602c : bd 0e 87 LDA $870e,x ; (vdc_modes + 14)
602f : 8d 07 8b STA $8b07 ; (vdc_state + 17)
6032 : bd 0f 87 LDA $870f,x ; (vdc_modes + 15)
6035 : 8d 08 8b STA $8b08 ; (vdc_state + 18)
6038 : bd 10 87 LDA $8710,x ; (vdc_modes + 16)
603b : 8d 09 8b STA $8b09 ; (vdc_state + 19)
603e : bd 11 87 LDA $8711,x ; (vdc_modes + 17)
6041 : 8d 0a 8b STA $8b0a ; (vdc_state + 20)
6044 : bd 12 87 LDA $8712,x ; (vdc_modes + 18)
6047 : 8d 0b 8b STA $8b0b ; (vdc_state + 21)
604a : bd 05 87 LDA $8705,x ; (vdc_modes + 5)
604d : 85 4d __ STA T3 + 0 
604f : 8d fe 8a STA $8afe ; (vdc_state + 8)
6052 : bd 06 87 LDA $8706,x ; (vdc_modes + 6)
6055 : 85 4e __ STA T3 + 1 
6057 : 8d ff 8a STA $8aff ; (vdc_state + 9)
605a : bd 07 87 LDA $8707,x ; (vdc_modes + 7)
605d : 85 50 __ STA T5 + 0 
605f : 8d 00 8b STA $8b00 ; (vdc_state + 10)
6062 : bd 08 87 LDA $8708,x ; (vdc_modes + 8)
6065 : 85 51 __ STA T5 + 1 
6067 : 8d 01 8b STA $8b01 ; (vdc_state + 11)
606a : 20 17 64 JSR $6417 ; (vdc_set_multab.s0 + 0)
606d : a9 22 __ LDA #$22
606f : 8d 00 d6 STA $d600 
.l1540:
6072 : 2c 00 d6 BIT $d600 
6075 : 10 fb __ BPL $6072 ; (vdc_set_mode.l1540 + 0)
.s11:
6077 : a9 80 __ LDA #$80
6079 : 8d 01 d6 STA $d601 
607c : a9 0c __ LDA #$0c
607e : 8d 00 d6 STA $d600 
.l1542:
6081 : 2c 00 d6 BIT $d600 
6084 : 10 fb __ BPL $6081 ; (vdc_set_mode.l1542 + 0)
.s17:
6086 : a5 4e __ LDA T3 + 1 
6088 : 8d 01 d6 STA $d601 
608b : a9 0d __ LDA #$0d
608d : 8d 00 d6 STA $d600 
.l1544:
6090 : 2c 00 d6 BIT $d600 
6093 : 10 fb __ BPL $6090 ; (vdc_set_mode.l1544 + 0)
.s22:
6095 : a5 4d __ LDA T3 + 0 
6097 : 8d 01 d6 STA $d601 
609a : a9 14 __ LDA #$14
609c : 8d 00 d6 STA $d600 
.l1546:
609f : 2c 00 d6 BIT $d600 
60a2 : 10 fb __ BPL $609f ; (vdc_set_mode.l1546 + 0)
.s27:
60a4 : a5 51 __ LDA T5 + 1 
60a6 : 8d 01 d6 STA $d601 
60a9 : a9 15 __ LDA #$15
60ab : 8d 00 d6 STA $d600 
.l1548:
60ae : 2c 00 d6 BIT $d600 
60b1 : 10 fb __ BPL $60ae ; (vdc_set_mode.l1548 + 0)
.s32:
60b3 : a5 50 __ LDA T5 + 0 
60b5 : 8d 01 d6 STA $d601 
60b8 : a6 4a __ LDX T1 + 0 
60ba : bd 0e 87 LDA $870e,x ; (vdc_modes + 14)
60bd : 85 4e __ STA T3 + 1 
60bf : a9 1c __ LDA #$1c
60c1 : 8d 00 d6 STA $d600 
.l1550:
60c4 : 2c 00 d6 BIT $d600 
60c7 : 10 fb __ BPL $60c4 ; (vdc_set_mode.l1550 + 0)
.s39:
60c9 : ad 01 d6 LDA $d601 
60cc : 29 10 __ AND #$10
60ce : 45 4e __ EOR T3 + 1 
60d0 : 29 1f __ AND #$1f
60d2 : 45 4e __ EOR T3 + 1 
60d4 : a2 1c __ LDX #$1c
60d6 : 8e 00 d6 STX $d600 
.l1552:
60d9 : 2c 00 d6 BIT $d600 
60dc : 10 fb __ BPL $60d9 ; (vdc_set_mode.l1552 + 0)
.s45:
60de : 8d 01 d6 STA $d601 
60e1 : 20 72 64 JSR $6472 ; (vdc_restore_charsets.s0 + 0)
60e4 : 18 __ __ CLC
60e5 : a9 13 __ LDA #$13
60e7 : 65 4a __ ADC T1 + 0 
60e9 : 85 4a __ STA T1 + 0 
60eb : a9 87 __ LDA #$87
60ed : 69 00 __ ADC #$00
60ef : 85 4b __ STA T1 + 1 
60f1 : 18 __ __ CLC
60f2 : a5 4c __ LDA T2 + 0 
60f4 : 69 13 __ ADC #$13
60f6 : 85 4d __ STA T3 + 0 
60f8 : a9 00 __ LDA #$00
60fa : 85 49 __ STA T0 + 0 
60fc : 69 87 __ ADC #$87
60fe : 85 4e __ STA T3 + 1 
.l46:
6100 : a4 49 __ LDY T0 + 0 
6102 : b1 4a __ LDA (T1 + 0),y 
6104 : aa __ __ TAX
6105 : c8 __ __ INY
6106 : b1 4a __ LDA (T1 + 0),y 
6108 : 8e 00 d6 STX $d600 
610b : c8 __ __ INY
610c : 84 49 __ STY T0 + 0 
.l1554:
610e : 2c 00 d6 BIT $d600 
6111 : 10 fb __ BPL $610e ; (vdc_set_mode.l1554 + 0)
.s52:
6113 : 8d 01 d6 STA $d601 
6116 : b1 4d __ LDA (T3 + 0),y 
6118 : c9 ff __ CMP #$ff
611a : d0 e4 __ BNE $6100 ; (vdc_set_mode.l46 + 0)
.s47:
611c : a6 4c __ LDX T2 + 0 
611e : bd 04 87 LDA $8704,x ; (vdc_modes + 4)
6121 : d0 03 __ BNE $6126 ; (vdc_set_mode.s56 + 0)
6123 : 4c 4b 62 JMP $624b ; (vdc_set_mode.s55 + 0)
.s56:
6126 : ad f7 8a LDA $8af7 ; (vdc_state + 1)
6129 : f0 03 __ BEQ $612e ; (vdc_set_mode.s53 + 0)
612b : 4c 4b 62 JMP $624b ; (vdc_set_mode.s55 + 0)
.s53:
612e : ad f6 8a LDA $8af6 ; (vdc_state + 0)
6131 : c9 10 __ CMP #$10
6133 : d0 03 __ BNE $6138 ; (vdc_set_mode.s61 + 0)
6135 : 4c 4b 62 JMP $624b ; (vdc_set_mode.s55 + 0)
.s61:
6138 : ad f7 8a LDA $8af7 ; (vdc_state + 1)
613b : f0 03 __ BEQ $6140 ; (vdc_set_mode.s60 + 0)
613d : 4c 4b 62 JMP $624b ; (vdc_set_mode.s55 + 0)
.s60:
6140 : a9 22 __ LDA #$22
6142 : 8d 00 d6 STA $d600 
.l1587:
6145 : 2c 00 d6 BIT $d600 
6148 : 10 fb __ BPL $6145 ; (vdc_set_mode.l1587 + 0)
.s68:
614a : a9 80 __ LDA #$80
614c : 8d 01 d6 STA $d601 
614f : a2 00 __ LDX #$00
6151 : a0 ff __ LDY #$ff
.l71:
6153 : a9 12 __ LDA #$12
6155 : 8d 00 d6 STA $d600 
.l1589:
6158 : 2c 00 d6 BIT $d600 
615b : 10 fb __ BPL $6158 ; (vdc_set_mode.l1589 + 0)
.s80:
615d : 8e 01 d6 STX $d601 
6160 : a9 13 __ LDA #$13
6162 : 8d 00 d6 STA $d600 
.l1591:
6165 : 2c 00 d6 BIT $d600 
6168 : 10 fb __ BPL $6165 ; (vdc_set_mode.l1591 + 0)
.s85:
616a : a9 00 __ LDA #$00
616c : 8d 01 d6 STA $d601 
616f : a9 1f __ LDA #$1f
6171 : 8d 00 d6 STA $d600 
.l1593:
6174 : 2c 00 d6 BIT $d600 
6177 : 10 fb __ BPL $6174 ; (vdc_set_mode.l1593 + 0)
.s89:
6179 : a9 00 __ LDA #$00
617b : 8d 01 d6 STA $d601 
617e : a9 18 __ LDA #$18
6180 : 8d 00 d6 STA $d600 
.l1595:
6183 : 2c 00 d6 BIT $d600 
6186 : 10 fb __ BPL $6183 ; (vdc_set_mode.l1595 + 0)
.s95:
6188 : ad 01 d6 LDA $d601 
618b : 29 7f __ AND #$7f
618d : 85 4c __ STA T2 + 0 
618f : a9 18 __ LDA #$18
6191 : 8d 00 d6 STA $d600 
.l1597:
6194 : 2c 00 d6 BIT $d600 
6197 : 10 fb __ BPL $6194 ; (vdc_set_mode.l1597 + 0)
.s101:
6199 : a5 4c __ LDA T2 + 0 
619b : 8d 01 d6 STA $d601 
619e : a9 1e __ LDA #$1e
61a0 : 8d 00 d6 STA $d600 
.l1599:
61a3 : 2c 00 d6 BIT $d600 
61a6 : 10 fb __ BPL $61a3 ; (vdc_set_mode.l1599 + 0)
.s106:
61a8 : a9 ff __ LDA #$ff
61aa : 8d 01 d6 STA $d601 
61ad : e8 __ __ INX
61ae : 88 __ __ DEY
61af : d0 a2 __ BNE $6153 ; (vdc_set_mode.l71 + 0)
.s73:
61b1 : a9 12 __ LDA #$12
61b3 : 8d 00 d6 STA $d600 
.l1602:
61b6 : 2c 00 d6 BIT $d600 
61b9 : 10 fb __ BPL $61b6 ; (vdc_set_mode.l1602 + 0)
.s113:
61bb : 8e 01 d6 STX $d601 
61be : a9 13 __ LDA #$13
61c0 : 8d 00 d6 STA $d600 
.l1604:
61c3 : 2c 00 d6 BIT $d600 
61c6 : 10 fb __ BPL $61c3 ; (vdc_set_mode.l1604 + 0)
.s118:
61c8 : 8c 01 d6 STY $d601 
61cb : a9 1f __ LDA #$1f
61cd : 8d 00 d6 STA $d600 
.l1606:
61d0 : 2c 00 d6 BIT $d600 
61d3 : 10 fb __ BPL $61d0 ; (vdc_set_mode.l1606 + 0)
.s122:
61d5 : 8c 01 d6 STY $d601 
61d8 : a9 18 __ LDA #$18
61da : 8d 00 d6 STA $d600 
.l1608:
61dd : 2c 00 d6 BIT $d600 
61e0 : 10 fb __ BPL $61dd ; (vdc_set_mode.l1608 + 0)
.s128:
61e2 : ad 01 d6 LDA $d601 
61e5 : 29 7f __ AND #$7f
61e7 : a2 18 __ LDX #$18
61e9 : 8e 00 d6 STX $d600 
.l1610:
61ec : 2c 00 d6 BIT $d600 
61ef : 10 fb __ BPL $61ec ; (vdc_set_mode.l1610 + 0)
.s134:
61f1 : 8d 01 d6 STA $d601 
61f4 : a9 1e __ LDA #$1e
61f6 : 8d 00 d6 STA $d600 
.l1612:
61f9 : 2c 00 d6 BIT $d600 
61fc : 10 fb __ BPL $61f9 ; (vdc_set_mode.l1612 + 0)
.s139:
61fe : a9 ff __ LDA #$ff
6200 : 8d 01 d6 STA $d601 
6203 : a2 1c __ LDX #$1c
6205 : 8e 00 d6 STX $d600 
.l1614:
6208 : 2c 00 d6 BIT $d600 
620b : 10 fb __ BPL $6208 ; (vdc_set_mode.l1614 + 0)
.s145:
620d : ad 01 d6 LDA $d601 
6210 : 09 10 __ ORA #$10
6212 : 8e 00 d6 STX $d600 
.l1616:
6215 : 2c 00 d6 BIT $d600 
6218 : 10 fb __ BPL $6215 ; (vdc_set_mode.l1616 + 0)
.s151:
621a : 8d 01 d6 STA $d601 
621d : 20 72 64 JSR $6472 ; (vdc_restore_charsets.s0 + 0)
6220 : a9 00 __ LDA #$00
6222 : 85 49 __ STA T0 + 0 
6224 : ad f9 8a LDA $8af9 ; (vdc_state + 3)
6227 : 85 4a __ STA T1 + 0 
6229 : ad fb 8a LDA $8afb ; (vdc_state + 5)
622c : 85 4c __ STA T2 + 0 
.l154:
622e : a5 49 __ LDA T0 + 0 
6230 : c5 4c __ CMP T2 + 0 
6232 : b0 03 __ BCS $6237 ; (vdc_set_mode.s152 + 0)
6234 : 4c 43 63 JMP $6343 ; (vdc_set_mode.s155 + 0)
.s152:
6237 : a9 22 __ LDA #$22
6239 : 8d 00 d6 STA $d600 
.l1643:
623c : 2c 00 d6 BIT $d600 
623f : 10 fb __ BPL $623c ; (vdc_set_mode.l1643 + 0)
.s230:
6241 : a9 7d __ LDA #$7d
6243 : 8d 01 d6 STA $d601 
6246 : a9 01 __ LDA #$01
6248 : 8d f7 8a STA $8af7 ; (vdc_state + 1)
.s55:
624b : a9 00 __ LDA #$00
624d : 85 49 __ STA T0 + 0 
624f : ad f9 8a LDA $8af9 ; (vdc_state + 3)
6252 : 85 4a __ STA T1 + 0 
6254 : ad fb 8a LDA $8afb ; (vdc_state + 5)
6257 : 85 4c __ STA T2 + 0 
.l233:
6259 : a5 49 __ LDA T0 + 0 
625b : c5 4c __ CMP T2 + 0 
625d : 90 10 __ BCC $626f ; (vdc_set_mode.s234 + 0)
.s231:
625f : a9 22 __ LDA #$22
6261 : 8d 00 d6 STA $d600 
.l1584:
6264 : 2c 00 d6 BIT $d600 
6267 : 10 fb __ BPL $6264 ; (vdc_set_mode.l1584 + 0)
.s309:
6269 : a9 7d __ LDA #$7d
626b : 8d 01 d6 STA $d601 
.s1001:
626e : 60 __ __ RTS
.s234:
626f : a9 00 __ LDA #$00
6271 : 85 0d __ STA P0 
6273 : a5 49 __ LDA T0 + 0 
6275 : 85 0e __ STA P1 
6277 : ad fd 8a LDA $8afd ; (vdc_state + 7)
627a : 85 4f __ STA T4 + 0 
627c : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
627f : a9 12 __ LDA #$12
6281 : 8d 00 d6 STA $d600 
6284 : 18 __ __ CLC
6285 : a5 1b __ LDA ACCU + 0 
6287 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
628a : a8 __ __ TAY
628b : a5 1c __ LDA ACCU + 1 
628d : 6d ff 8a ADC $8aff ; (vdc_state + 9)
6290 : a6 4a __ LDX T1 + 0 
6292 : ca __ __ DEX
.l1560:
6293 : 2c 00 d6 BIT $d600 
6296 : 10 fb __ BPL $6293 ; (vdc_set_mode.l1560 + 0)
.s244:
6298 : 8d 01 d6 STA $d601 
629b : a9 13 __ LDA #$13
629d : 8d 00 d6 STA $d600 
.l1562:
62a0 : 2c 00 d6 BIT $d600 
62a3 : 10 fb __ BPL $62a0 ; (vdc_set_mode.l1562 + 0)
.s249:
62a5 : 8c 01 d6 STY $d601 
62a8 : a9 1f __ LDA #$1f
62aa : 8d 00 d6 STA $d600 
.l1564:
62ad : 2c 00 d6 BIT $d600 
62b0 : 10 fb __ BPL $62ad ; (vdc_set_mode.l1564 + 0)
.s253:
62b2 : a9 20 __ LDA #$20
62b4 : 8d 01 d6 STA $d601 
62b7 : a9 18 __ LDA #$18
62b9 : 8d 00 d6 STA $d600 
.l1566:
62bc : 2c 00 d6 BIT $d600 
62bf : 10 fb __ BPL $62bc ; (vdc_set_mode.l1566 + 0)
.s259:
62c1 : ad 01 d6 LDA $d601 
62c4 : 29 7f __ AND #$7f
62c6 : a0 18 __ LDY #$18
62c8 : 8c 00 d6 STY $d600 
.l1568:
62cb : 2c 00 d6 BIT $d600 
62ce : 10 fb __ BPL $62cb ; (vdc_set_mode.l1568 + 0)
.s265:
62d0 : 8d 01 d6 STA $d601 
62d3 : a9 1e __ LDA #$1e
62d5 : 8d 00 d6 STA $d600 
.l1570:
62d8 : 2c 00 d6 BIT $d600 
62db : 10 fb __ BPL $62d8 ; (vdc_set_mode.l1570 + 0)
.s270:
62dd : 8e 01 d6 STX $d601 
62e0 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
62e3 : 18 __ __ CLC
62e4 : 65 1b __ ADC ACCU + 0 
62e6 : a0 12 __ LDY #$12
62e8 : 8c 00 d6 STY $d600 
62eb : a8 __ __ TAY
62ec : ad 01 8b LDA $8b01 ; (vdc_state + 11)
62ef : 65 1c __ ADC ACCU + 1 
.l1572:
62f1 : 2c 00 d6 BIT $d600 
62f4 : 10 fb __ BPL $62f1 ; (vdc_set_mode.l1572 + 0)
.s277:
62f6 : 8d 01 d6 STA $d601 
62f9 : a9 13 __ LDA #$13
62fb : 8d 00 d6 STA $d600 
.l1574:
62fe : 2c 00 d6 BIT $d600 
6301 : 10 fb __ BPL $62fe ; (vdc_set_mode.l1574 + 0)
.s282:
6303 : 8c 01 d6 STY $d601 
6306 : a9 1f __ LDA #$1f
6308 : 8d 00 d6 STA $d600 
.l1576:
630b : 2c 00 d6 BIT $d600 
630e : 10 fb __ BPL $630b ; (vdc_set_mode.l1576 + 0)
.s286:
6310 : a5 4f __ LDA T4 + 0 
6312 : 8d 01 d6 STA $d601 
6315 : a9 18 __ LDA #$18
6317 : 8d 00 d6 STA $d600 
.l1578:
631a : 2c 00 d6 BIT $d600 
631d : 10 fb __ BPL $631a ; (vdc_set_mode.l1578 + 0)
.s292:
631f : ad 01 d6 LDA $d601 
6322 : 29 7f __ AND #$7f
6324 : a0 18 __ LDY #$18
6326 : 8c 00 d6 STY $d600 
.l1580:
6329 : 2c 00 d6 BIT $d600 
632c : 10 fb __ BPL $6329 ; (vdc_set_mode.l1580 + 0)
.s298:
632e : 8d 01 d6 STA $d601 
6331 : a9 1e __ LDA #$1e
6333 : 8d 00 d6 STA $d600 
.l1582:
6336 : 2c 00 d6 BIT $d600 
6339 : 10 fb __ BPL $6336 ; (vdc_set_mode.l1582 + 0)
.s303:
633b : 8e 01 d6 STX $d601 
633e : e6 49 __ INC T0 + 0 
6340 : 4c 59 62 JMP $6259 ; (vdc_set_mode.l233 + 0)
.s155:
6343 : a9 00 __ LDA #$00
6345 : 85 0d __ STA P0 
6347 : a5 49 __ LDA T0 + 0 
6349 : 85 0e __ STA P1 
634b : ad fd 8a LDA $8afd ; (vdc_state + 7)
634e : 85 4f __ STA T4 + 0 
6350 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
6353 : a9 12 __ LDA #$12
6355 : 8d 00 d6 STA $d600 
6358 : 18 __ __ CLC
6359 : a5 1b __ LDA ACCU + 0 
635b : 6d fe 8a ADC $8afe ; (vdc_state + 8)
635e : a8 __ __ TAY
635f : a5 1c __ LDA ACCU + 1 
6361 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
6364 : a6 4a __ LDX T1 + 0 
6366 : ca __ __ DEX
.l1619:
6367 : 2c 00 d6 BIT $d600 
636a : 10 fb __ BPL $6367 ; (vdc_set_mode.l1619 + 0)
.s165:
636c : 8d 01 d6 STA $d601 
636f : a9 13 __ LDA #$13
6371 : 8d 00 d6 STA $d600 
.l1621:
6374 : 2c 00 d6 BIT $d600 
6377 : 10 fb __ BPL $6374 ; (vdc_set_mode.l1621 + 0)
.s170:
6379 : 8c 01 d6 STY $d601 
637c : a9 1f __ LDA #$1f
637e : 8d 00 d6 STA $d600 
.l1623:
6381 : 2c 00 d6 BIT $d600 
6384 : 10 fb __ BPL $6381 ; (vdc_set_mode.l1623 + 0)
.s174:
6386 : a9 20 __ LDA #$20
6388 : 8d 01 d6 STA $d601 
638b : a9 18 __ LDA #$18
638d : 8d 00 d6 STA $d600 
.l1625:
6390 : 2c 00 d6 BIT $d600 
6393 : 10 fb __ BPL $6390 ; (vdc_set_mode.l1625 + 0)
.s180:
6395 : ad 01 d6 LDA $d601 
6398 : 29 7f __ AND #$7f
639a : a0 18 __ LDY #$18
639c : 8c 00 d6 STY $d600 
.l1627:
639f : 2c 00 d6 BIT $d600 
63a2 : 10 fb __ BPL $639f ; (vdc_set_mode.l1627 + 0)
.s186:
63a4 : 8d 01 d6 STA $d601 
63a7 : a9 1e __ LDA #$1e
63a9 : 8d 00 d6 STA $d600 
.l1629:
63ac : 2c 00 d6 BIT $d600 
63af : 10 fb __ BPL $63ac ; (vdc_set_mode.l1629 + 0)
.s191:
63b1 : 8e 01 d6 STX $d601 
63b4 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
63b7 : 18 __ __ CLC
63b8 : 65 1b __ ADC ACCU + 0 
63ba : a0 12 __ LDY #$12
63bc : 8c 00 d6 STY $d600 
63bf : a8 __ __ TAY
63c0 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
63c3 : 65 1c __ ADC ACCU + 1 
.l1631:
63c5 : 2c 00 d6 BIT $d600 
63c8 : 10 fb __ BPL $63c5 ; (vdc_set_mode.l1631 + 0)
.s198:
63ca : 8d 01 d6 STA $d601 
63cd : a9 13 __ LDA #$13
63cf : 8d 00 d6 STA $d600 
.l1633:
63d2 : 2c 00 d6 BIT $d600 
63d5 : 10 fb __ BPL $63d2 ; (vdc_set_mode.l1633 + 0)
.s203:
63d7 : 8c 01 d6 STY $d601 
63da : a9 1f __ LDA #$1f
63dc : 8d 00 d6 STA $d600 
.l1635:
63df : 2c 00 d6 BIT $d600 
63e2 : 10 fb __ BPL $63df ; (vdc_set_mode.l1635 + 0)
.s207:
63e4 : a5 4f __ LDA T4 + 0 
63e6 : 8d 01 d6 STA $d601 
63e9 : a9 18 __ LDA #$18
63eb : 8d 00 d6 STA $d600 
.l1637:
63ee : 2c 00 d6 BIT $d600 
63f1 : 10 fb __ BPL $63ee ; (vdc_set_mode.l1637 + 0)
.s213:
63f3 : ad 01 d6 LDA $d601 
63f6 : 29 7f __ AND #$7f
63f8 : a0 18 __ LDY #$18
63fa : 8c 00 d6 STY $d600 
.l1639:
63fd : 2c 00 d6 BIT $d600 
6400 : 10 fb __ BPL $63fd ; (vdc_set_mode.l1639 + 0)
.s219:
6402 : 8d 01 d6 STA $d601 
6405 : a9 1e __ LDA #$1e
6407 : 8d 00 d6 STA $d600 
.l1641:
640a : 2c 00 d6 BIT $d600 
640d : 10 fb __ BPL $640a ; (vdc_set_mode.l1641 + 0)
.s224:
640f : 8e 01 d6 STX $d601 
6412 : e6 49 __ INC T0 + 0 
6414 : 4c 2e 62 JMP $622e ; (vdc_set_mode.l154 + 0)
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
6417 : ad fc 8a LDA $8afc ; (vdc_state + 6)
641a : 85 1c __ STA ACCU + 1 
641c : ad fb 8a LDA $8afb ; (vdc_state + 5)
641f : 85 1b __ STA ACCU + 0 
6421 : 05 1c __ ORA ACCU + 1 
6423 : f0 4c __ BEQ $6471 ; (vdc_set_multab.s1001 + 0)
.s5:
6425 : ad f9 8a LDA $8af9 ; (vdc_state + 3)
6428 : 18 __ __ CLC
6429 : 6d 0e 8b ADC $8b0e ; (vdc_state + 24)
642c : 85 43 __ STA T2 + 0 
642e : ad fa 8a LDA $8afa ; (vdc_state + 4)
6431 : 69 00 __ ADC #$00
6433 : 85 44 __ STA T2 + 1 
6435 : a9 00 __ LDA #$00
6437 : 85 45 __ STA T3 + 0 
6439 : 85 46 __ STA T3 + 1 
643b : a9 0f __ LDA #$0f
643d : 85 47 __ STA T4 + 0 
643f : a9 8b __ LDA #$8b
6441 : 85 48 __ STA T4 + 1 
6443 : a2 00 __ LDX #$00
.l2:
6445 : a5 45 __ LDA T3 + 0 
6447 : a0 00 __ LDY #$00
6449 : 91 47 __ STA (T4 + 0),y 
644b : a5 46 __ LDA T3 + 1 
644d : c8 __ __ INY
644e : 91 47 __ STA (T4 + 0),y 
6450 : 18 __ __ CLC
6451 : a5 43 __ LDA T2 + 0 
6453 : 65 45 __ ADC T3 + 0 
6455 : 85 45 __ STA T3 + 0 
6457 : a5 44 __ LDA T2 + 1 
6459 : 65 46 __ ADC T3 + 1 
645b : 85 46 __ STA T3 + 1 
645d : 18 __ __ CLC
645e : a5 47 __ LDA T4 + 0 
6460 : 69 02 __ ADC #$02
6462 : 85 47 __ STA T4 + 0 
6464 : 90 02 __ BCC $6468 ; (vdc_set_multab.s1006 + 0)
.s1005:
6466 : e6 48 __ INC T4 + 1 
.s1006:
6468 : e8 __ __ INX
6469 : a5 1c __ LDA ACCU + 1 
646b : d0 d8 __ BNE $6445 ; (vdc_set_multab.l2 + 0)
.s1002:
646d : e4 1b __ CPX ACCU + 0 
646f : 90 d4 __ BCC $6445 ; (vdc_set_multab.l2 + 0)
.s1001:
6471 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
6472 : ad 06 8b LDA $8b06 ; (vdc_state + 16)
6475 : 85 0d __ STA P0 
6477 : ad 07 8b LDA $8b07 ; (vdc_state + 17)
647a : 85 0e __ STA P1 
647c : 4c 00 13 JMP $1300 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
647f : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 6f 53 43 41 52 36 34 : sTARTING oSCAR64
648f : __ __ __ BYT 20 76 64 63 20 44 45 4d 4f 2e 00                :  vdc DEMO..
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
649a : a9 af __ LDA #$af
649c : 85 0d __ STA P0 
649e : a9 8b __ LDA #$8b
64a0 : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
64a2 : a9 00 __ LDA #$00
64a4 : 85 1b __ STA ACCU + 0 
64a6 : 85 1c __ STA ACCU + 1 
64a8 : a8 __ __ TAY
64a9 : b1 0d __ LDA (P0),y ; (str + 0)
64ab : f0 18 __ BEQ $64c5 ; (strlen.s1001 + 0)
.s2:
64ad : a5 0d __ LDA P0 ; (str + 0)
64af : 85 1b __ STA ACCU + 0 
64b1 : a2 00 __ LDX #$00
.l1002:
64b3 : c8 __ __ INY
64b4 : d0 01 __ BNE $64b7 ; (strlen.s1005 + 0)
.s1004:
64b6 : e8 __ __ INX
.s1005:
64b7 : 8a __ __ TXA
64b8 : 18 __ __ CLC
64b9 : 65 0e __ ADC P1 ; (str + 1)
64bb : 85 1c __ STA ACCU + 1 
64bd : b1 1b __ LDA (ACCU + 0),y 
64bf : d0 f2 __ BNE $64b3 ; (strlen.l1002 + 0)
.s1003:
64c1 : 86 1c __ STX ACCU + 1 
64c3 : 84 1b __ STY ACCU + 0 
.s1001:
64c5 : 60 __ __ RTS
--------------------------------------------------------------------
pet2screen: ; pet2screen(u8)->u8
.s0:
64c6 : c9 20 __ CMP #$20
64c8 : b0 03 __ BCS $64cd ; (pet2screen.s2 + 0)
.s1:
64ca : 69 80 __ ADC #$80
64cc : 60 __ __ RTS
.s2:
64cd : c9 40 __ CMP #$40
64cf : 90 27 __ BCC $64f8 ; (pet2screen.s21 + 0)
.s7:
64d1 : c9 60 __ CMP #$60
64d3 : 90 17 __ BCC $64ec ; (pet2screen.s4 + 0)
.s11:
64d5 : 09 00 __ ORA #$00
64d7 : 30 04 __ BMI $64dd ; (pet2screen.s9 + 0)
.s8:
64d9 : 38 __ __ SEC
64da : e9 20 __ SBC #$20
64dc : 60 __ __ RTS
.s9:
64dd : c9 80 __ CMP #$80
64df : 90 17 __ BCC $64f8 ; (pet2screen.s21 + 0)
.s15:
64e1 : c9 a0 __ CMP #$a0
64e3 : b0 03 __ BCS $64e8 ; (pet2screen.s19 + 0)
.s12:
64e5 : 69 40 __ ADC #$40
64e7 : 60 __ __ RTS
.s19:
64e8 : c9 c0 __ CMP #$c0
64ea : b0 04 __ BCS $64f0 ; (pet2screen.s23 + 0)
.s4:
64ec : 38 __ __ SEC
64ed : e9 40 __ SBC #$40
64ef : 60 __ __ RTS
.s23:
64f0 : c9 ff __ CMP #$ff
64f2 : b0 04 __ BCS $64f8 ; (pet2screen.s21 + 0)
.s20:
64f4 : 38 __ __ SEC
64f5 : e9 80 __ SBC #$80
64f7 : 60 __ __ RTS
.s21:
64f8 : c9 ff __ CMP #$ff
64fa : d0 02 __ BNE $64fe ; (pet2screen.s1001 + 0)
.s24:
64fc : a9 5e __ LDA #$5e
.s1001:
64fe : 60 __ __ RTS
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s0:
64ff : a9 00 __ LDA #$00
6501 : 8d fc bf STA $bffc ; (sstack + 4)
6504 : a0 02 __ LDY #$02
6506 : b1 23 __ LDA (SP + 0),y 
6508 : 85 16 __ STA P9 
650a : c8 __ __ INY
650b : b1 23 __ LDA (SP + 0),y 
650d : 85 17 __ STA P10 
650f : c8 __ __ INY
6510 : b1 23 __ LDA (SP + 0),y 
6512 : 8d f8 bf STA $bff8 ; (sstack + 0)
6515 : c8 __ __ INY
6516 : b1 23 __ LDA (SP + 0),y 
6518 : 8d f9 bf STA $bff9 ; (sstack + 1)
651b : 18 __ __ CLC
651c : a5 23 __ LDA SP + 0 
651e : 69 06 __ ADC #$06
6520 : 8d fa bf STA $bffa ; (sstack + 2)
6523 : a5 24 __ LDA SP + 1 
6525 : 69 00 __ ADC #$00
6527 : 8d fb bf STA $bffb ; (sstack + 3)
652a : 4c c2 56 JMP $56c2 ; (sformat.s1000 + 0)
--------------------------------------------------------------------
652d : __ __ __ BYT 76 64 63 20 4d 45 4d 4f 52 59 20 44 45 54 45 43 : vdc MEMORY DETEC
653d : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 2c 20 45 58 54 45 : TED: %U kb, EXTE
654d : __ __ __ BYT 4e 44 45 44 20 4d 45 4d 4f 52 59 20 25 53 41 42 : NDED MEMORY %SAB
655d : __ __ __ BYT 4c 45 44 2e 00                                  : LED..
--------------------------------------------------------------------
6562 : __ __ __ BYT 64 49 53 00                                     : dIS.
--------------------------------------------------------------------
6566 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 3a 00 : lOADING ASSETS:.
--------------------------------------------------------------------
6576 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 20 31 3a 20 6c 4f 56 45 : - SCREEN 1: lOVE
6586 : __ __ __ BYT 20 49 53 20 41 20 64 52 55 47 00                :  IS A dRUG.
--------------------------------------------------------------------
6591 : __ __ __ BYT 53 43 52 45 45 4e 31 00                         : SCREEN1.
--------------------------------------------------------------------
menu_fileerrormessage: ; menu_fileerrormessage()->void
.s1000:
6599 : a2 06 __ LDX #$06
659b : b5 53 __ LDA T0 + 0,x 
659d : 9d d5 bf STA $bfd5,x ; (wrapbuffer + 55)
65a0 : ca __ __ DEX
65a1 : 10 f8 __ BPL $659b ; (menu_fileerrormessage.s1000 + 2)
65a3 : 38 __ __ SEC
65a4 : a5 23 __ LDA SP + 0 
65a6 : e9 08 __ SBC #$08
65a8 : 85 23 __ STA SP + 0 
65aa : b0 02 __ BCS $65ae ; (menu_fileerrormessage.s0 + 0)
65ac : c6 24 __ DEC SP + 1 
.s0:
65ae : a9 f0 __ LDA #$f0
65b0 : 85 15 __ STA P8 
65b2 : a9 08 __ LDA #$08
65b4 : 85 16 __ STA P9 
65b6 : 85 17 __ STA P10 
65b8 : a9 1e __ LDA #$1e
65ba : 85 18 __ STA P11 
65bc : a9 06 __ LDA #$06
65be : 8d f8 bf STA $bff8 ; (sstack + 0)
65c1 : ad fd 8a LDA $8afd ; (vdc_state + 7)
65c4 : 85 53 __ STA T0 + 0 
65c6 : a9 8d __ LDA #$8d
65c8 : 8d fd 8a STA $8afd ; (vdc_state + 7)
65cb : 20 70 68 JSR $6870 ; (vdcwin_win_new.s1000 + 0)
65ce : 20 59 86 JSR $8659 ; (vdc_coords@proxy + 0)
65d1 : a5 1b __ LDA ACCU + 0 
65d3 : 85 54 __ STA T1 + 0 
65d5 : a5 1c __ LDA ACCU + 1 
65d7 : 85 55 __ STA T1 + 1 
65d9 : a9 38 __ LDA #$38
65db : 85 0d __ STA P0 
65dd : a9 71 __ LDA #$71
65df : 85 0e __ STA P1 
65e1 : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
65e4 : a5 1b __ LDA ACCU + 0 
65e6 : 85 56 __ STA T2 + 0 
65e8 : a9 12 __ LDA #$12
65ea : 8d 00 d6 STA $d600 
65ed : 18 __ __ CLC
65ee : a5 54 __ LDA T1 + 0 
65f0 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
65f3 : aa __ __ TAX
65f4 : a5 55 __ LDA T1 + 1 
65f6 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l823:
65f9 : 2c 00 d6 BIT $d600 
65fc : 10 fb __ BPL $65f9 ; (menu_fileerrormessage.l823 + 0)
.s8:
65fe : 8d 01 d6 STA $d601 
6601 : a9 13 __ LDA #$13
6603 : 8d 00 d6 STA $d600 
.l825:
6606 : 2c 00 d6 BIT $d600 
6609 : 10 fb __ BPL $6606 ; (menu_fileerrormessage.l825 + 0)
.s13:
660b : 8e 01 d6 STX $d601 
660e : a9 1f __ LDA #$1f
6610 : 8d 00 d6 STA $d600 
6613 : a5 1b __ LDA ACCU + 0 
6615 : f0 19 __ BEQ $6630 ; (menu_fileerrormessage.s18 + 0)
.s190:
6617 : a2 00 __ LDX #$00
.l16:
6619 : 86 58 __ STX T5 + 0 
661b : bd 38 71 LDA $7138,x 
661e : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l828:
6621 : 2c 00 d6 BIT $d600 
6624 : 10 fb __ BPL $6621 ; (menu_fileerrormessage.l828 + 0)
.s21:
6626 : 8d 01 d6 STA $d601 
6629 : a6 58 __ LDX T5 + 0 
662b : e8 __ __ INX
662c : e4 56 __ CPX T2 + 0 
662e : 90 e9 __ BCC $6619 ; (menu_fileerrormessage.l16 + 0)
.s18:
6630 : a9 12 __ LDA #$12
6632 : 8d 00 d6 STA $d600 
6635 : c6 56 __ DEC T2 + 0 
6637 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
663a : 18 __ __ CLC
663b : 65 54 __ ADC T1 + 0 
663d : aa __ __ TAX
663e : ad 01 8b LDA $8b01 ; (vdc_state + 11)
6641 : 65 55 __ ADC T1 + 1 
.l831:
6643 : 2c 00 d6 BIT $d600 
6646 : 10 fb __ BPL $6643 ; (menu_fileerrormessage.l831 + 0)
.s28:
6648 : 8d 01 d6 STA $d601 
664b : a9 13 __ LDA #$13
664d : 8d 00 d6 STA $d600 
.l833:
6650 : 2c 00 d6 BIT $d600 
6653 : 10 fb __ BPL $6650 ; (menu_fileerrormessage.l833 + 0)
.s33:
6655 : 8e 01 d6 STX $d601 
6658 : a9 1f __ LDA #$1f
665a : 8d 00 d6 STA $d600 
.l835:
665d : 2c 00 d6 BIT $d600 
6660 : 10 fb __ BPL $665d ; (menu_fileerrormessage.l835 + 0)
.s37:
6662 : a9 8d __ LDA #$8d
6664 : 8d 01 d6 STA $d601 
6667 : a9 18 __ LDA #$18
6669 : 8d 00 d6 STA $d600 
.l837:
666c : 2c 00 d6 BIT $d600 
666f : 10 fb __ BPL $666c ; (menu_fileerrormessage.l837 + 0)
.s43:
6671 : ad 01 d6 LDA $d601 
6674 : 29 7f __ AND #$7f
6676 : a2 18 __ LDX #$18
6678 : 8e 00 d6 STX $d600 
.l839:
667b : 2c 00 d6 BIT $d600 
667e : 10 fb __ BPL $667b ; (menu_fileerrormessage.l839 + 0)
.s49:
6680 : 8d 01 d6 STA $d601 
6683 : a9 1e __ LDA #$1e
6685 : 8d 00 d6 STA $d600 
.l841:
6688 : 2c 00 d6 BIT $d600 
668b : 10 fb __ BPL $6688 ; (menu_fileerrormessage.l841 + 0)
.s54:
668d : a5 56 __ LDA T2 + 0 
668f : 8d 01 d6 STA $d601 
6692 : a9 af __ LDA #$af
6694 : a0 02 __ LDY #$02
6696 : 91 23 __ STA (SP + 0),y 
6698 : a9 8b __ LDA #$8b
669a : c8 __ __ INY
669b : 91 23 __ STA (SP + 0),y 
669d : a9 44 __ LDA #$44
669f : c8 __ __ INY
66a0 : 91 23 __ STA (SP + 0),y 
66a2 : a9 71 __ LDA #$71
66a4 : c8 __ __ INY
66a5 : 91 23 __ STA (SP + 0),y 
66a7 : ad a0 8b LDA $8ba0 ; (krnio_pstatus + 1)
66aa : c8 __ __ INY
66ab : 91 23 __ STA (SP + 0),y 
66ad : a9 00 __ LDA #$00
66af : c8 __ __ INY
66b0 : 91 23 __ STA (SP + 0),y 
66b2 : 20 ff 64 JSR $64ff ; (sprintf.s0 + 0)
66b5 : a9 0a __ LDA #$0a
66b7 : 85 0d __ STA P0 
66b9 : a9 0b __ LDA #$0b
66bb : 85 0e __ STA P1 
66bd : ad fd 8a LDA $8afd ; (vdc_state + 7)
66c0 : 85 58 __ STA T5 + 0 
66c2 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
66c5 : a5 1b __ LDA ACCU + 0 
66c7 : 85 56 __ STA T2 + 0 
66c9 : a5 1c __ LDA ACCU + 1 
66cb : 85 57 __ STA T2 + 1 
66cd : 20 9a 64 JSR $649a ; (strlen@proxy + 0)
66d0 : a5 1b __ LDA ACCU + 0 
66d2 : 85 54 __ STA T1 + 0 
66d4 : ad fe 8a LDA $8afe ; (vdc_state + 8)
66d7 : 18 __ __ CLC
66d8 : 65 56 __ ADC T2 + 0 
66da : a2 12 __ LDX #$12
66dc : 8e 00 d6 STX $d600 
66df : aa __ __ TAX
66e0 : ad ff 8a LDA $8aff ; (vdc_state + 9)
66e3 : 65 57 __ ADC T2 + 1 
.l843:
66e5 : 2c 00 d6 BIT $d600 
66e8 : 10 fb __ BPL $66e5 ; (menu_fileerrormessage.l843 + 0)
.s62:
66ea : 8d 01 d6 STA $d601 
66ed : a9 13 __ LDA #$13
66ef : 8d 00 d6 STA $d600 
.l845:
66f2 : 2c 00 d6 BIT $d600 
66f5 : 10 fb __ BPL $66f2 ; (menu_fileerrormessage.l845 + 0)
.s67:
66f7 : 8e 01 d6 STX $d601 
66fa : a9 1f __ LDA #$1f
66fc : 8d 00 d6 STA $d600 
66ff : a5 1b __ LDA ACCU + 0 
6701 : f0 19 __ BEQ $671c ; (menu_fileerrormessage.s72 + 0)
.s180:
6703 : a2 00 __ LDX #$00
.l70:
6705 : 86 59 __ STX T6 + 0 
6707 : bd af 8b LDA $8baf,x ; (linebuffer + 0)
670a : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l848:
670d : 2c 00 d6 BIT $d600 
6710 : 10 fb __ BPL $670d ; (menu_fileerrormessage.l848 + 0)
.s75:
6712 : 8d 01 d6 STA $d601 
6715 : a6 59 __ LDX T6 + 0 
6717 : e8 __ __ INX
6718 : e4 54 __ CPX T1 + 0 
671a : 90 e9 __ BCC $6705 ; (menu_fileerrormessage.l70 + 0)
.s72:
671c : a9 12 __ LDA #$12
671e : 8d 00 d6 STA $d600 
6721 : c6 54 __ DEC T1 + 0 
6723 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
6726 : 18 __ __ CLC
6727 : 65 56 __ ADC T2 + 0 
6729 : aa __ __ TAX
672a : ad 01 8b LDA $8b01 ; (vdc_state + 11)
672d : 65 57 __ ADC T2 + 1 
.l851:
672f : 2c 00 d6 BIT $d600 
6732 : 10 fb __ BPL $672f ; (menu_fileerrormessage.l851 + 0)
.s82:
6734 : 8d 01 d6 STA $d601 
6737 : a9 13 __ LDA #$13
6739 : 8d 00 d6 STA $d600 
.l853:
673c : 2c 00 d6 BIT $d600 
673f : 10 fb __ BPL $673c ; (menu_fileerrormessage.l853 + 0)
.s87:
6741 : 8e 01 d6 STX $d601 
6744 : a9 1f __ LDA #$1f
6746 : 8d 00 d6 STA $d600 
.l855:
6749 : 2c 00 d6 BIT $d600 
674c : 10 fb __ BPL $6749 ; (menu_fileerrormessage.l855 + 0)
.s91:
674e : a5 58 __ LDA T5 + 0 
6750 : 8d 01 d6 STA $d601 
6753 : a9 18 __ LDA #$18
6755 : 8d 00 d6 STA $d600 
.l857:
6758 : 2c 00 d6 BIT $d600 
675b : 10 fb __ BPL $6758 ; (menu_fileerrormessage.l857 + 0)
.s97:
675d : ad 01 d6 LDA $d601 
6760 : 29 7f __ AND #$7f
6762 : a2 18 __ LDX #$18
6764 : 8e 00 d6 STX $d600 
.l859:
6767 : 2c 00 d6 BIT $d600 
676a : 10 fb __ BPL $6767 ; (menu_fileerrormessage.l859 + 0)
.s103:
676c : 8d 01 d6 STA $d601 
676f : a9 1e __ LDA #$1e
6771 : 8d 00 d6 STA $d600 
.l861:
6774 : 2c 00 d6 BIT $d600 
6777 : 10 fb __ BPL $6774 ; (menu_fileerrormessage.l861 + 0)
.s108:
6779 : a5 54 __ LDA T1 + 0 
677b : 8d 01 d6 STA $d601 
677e : a9 0a __ LDA #$0a
6780 : 85 0d __ STA P0 
6782 : a9 0d __ LDA #$0d
6784 : 85 0e __ STA P1 
6786 : ad fd 8a LDA $8afd ; (vdc_state + 7)
6789 : 85 58 __ STA T5 + 0 
678b : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
678e : a5 1b __ LDA ACCU + 0 
6790 : 85 54 __ STA T1 + 0 
6792 : a5 1c __ LDA ACCU + 1 
6794 : 85 55 __ STA T1 + 1 
6796 : a9 53 __ LDA #$53
6798 : 85 0d __ STA P0 
679a : a9 71 __ LDA #$71
679c : 85 0e __ STA P1 
679e : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
67a1 : a5 1b __ LDA ACCU + 0 
67a3 : 85 56 __ STA T2 + 0 
67a5 : a9 12 __ LDA #$12
67a7 : 8d 00 d6 STA $d600 
67aa : 18 __ __ CLC
67ab : a5 54 __ LDA T1 + 0 
67ad : 6d fe 8a ADC $8afe ; (vdc_state + 8)
67b0 : aa __ __ TAX
67b1 : a5 55 __ LDA T1 + 1 
67b3 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l863:
67b6 : 2c 00 d6 BIT $d600 
67b9 : 10 fb __ BPL $67b6 ; (menu_fileerrormessage.l863 + 0)
.s116:
67bb : 8d 01 d6 STA $d601 
67be : a9 13 __ LDA #$13
67c0 : 8d 00 d6 STA $d600 
.l865:
67c3 : 2c 00 d6 BIT $d600 
67c6 : 10 fb __ BPL $67c3 ; (menu_fileerrormessage.l865 + 0)
.s121:
67c8 : 8e 01 d6 STX $d601 
67cb : a9 1f __ LDA #$1f
67cd : 8d 00 d6 STA $d600 
67d0 : a5 1b __ LDA ACCU + 0 
67d2 : f0 19 __ BEQ $67ed ; (menu_fileerrormessage.s126 + 0)
.s170:
67d4 : a2 00 __ LDX #$00
.l124:
67d6 : 86 59 __ STX T6 + 0 
67d8 : bd 53 71 LDA $7153,x 
67db : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l868:
67de : 2c 00 d6 BIT $d600 
67e1 : 10 fb __ BPL $67de ; (menu_fileerrormessage.l868 + 0)
.s129:
67e3 : 8d 01 d6 STA $d601 
67e6 : a6 59 __ LDX T6 + 0 
67e8 : e8 __ __ INX
67e9 : e4 56 __ CPX T2 + 0 
67eb : 90 e9 __ BCC $67d6 ; (menu_fileerrormessage.l124 + 0)
.s126:
67ed : a9 12 __ LDA #$12
67ef : 8d 00 d6 STA $d600 
67f2 : c6 56 __ DEC T2 + 0 
67f4 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
67f7 : 18 __ __ CLC
67f8 : 65 54 __ ADC T1 + 0 
67fa : aa __ __ TAX
67fb : ad 01 8b LDA $8b01 ; (vdc_state + 11)
67fe : 65 55 __ ADC T1 + 1 
.l871:
6800 : 2c 00 d6 BIT $d600 
6803 : 10 fb __ BPL $6800 ; (menu_fileerrormessage.l871 + 0)
.s136:
6805 : 8d 01 d6 STA $d601 
6808 : a9 13 __ LDA #$13
680a : 8d 00 d6 STA $d600 
.l873:
680d : 2c 00 d6 BIT $d600 
6810 : 10 fb __ BPL $680d ; (menu_fileerrormessage.l873 + 0)
.s141:
6812 : 8e 01 d6 STX $d601 
6815 : a9 1f __ LDA #$1f
6817 : 8d 00 d6 STA $d600 
.l875:
681a : 2c 00 d6 BIT $d600 
681d : 10 fb __ BPL $681a ; (menu_fileerrormessage.l875 + 0)
.s145:
681f : a5 58 __ LDA T5 + 0 
6821 : 8d 01 d6 STA $d601 
6824 : a9 18 __ LDA #$18
6826 : 8d 00 d6 STA $d600 
.l877:
6829 : 2c 00 d6 BIT $d600 
682c : 10 fb __ BPL $6829 ; (menu_fileerrormessage.l877 + 0)
.s151:
682e : ad 01 d6 LDA $d601 
6831 : 29 7f __ AND #$7f
6833 : a2 18 __ LDX #$18
6835 : 8e 00 d6 STX $d600 
.l879:
6838 : 2c 00 d6 BIT $d600 
683b : 10 fb __ BPL $6838 ; (menu_fileerrormessage.l879 + 0)
.s157:
683d : 8d 01 d6 STA $d601 
6840 : a9 1e __ LDA #$1e
6842 : 8d 00 d6 STA $d600 
.l881:
6845 : 2c 00 d6 BIT $d600 
6848 : 10 fb __ BPL $6845 ; (menu_fileerrormessage.l881 + 0)
.s162:
684a : a5 56 __ LDA T2 + 0 
684c : 8d 01 d6 STA $d601 
684f : 20 5e 71 JSR $715e ; (vdcwin_getch.s0 + 0)
6852 : 20 6c 71 JSR $716c ; (vdcwin_win_free.s0 + 0)
6855 : a5 53 __ LDA T0 + 0 
6857 : 8d fd 8a STA $8afd ; (vdc_state + 7)
.s1001:
685a : 18 __ __ CLC
685b : a5 23 __ LDA SP + 0 
685d : 69 08 __ ADC #$08
685f : 85 23 __ STA SP + 0 
6861 : 90 02 __ BCC $6865 ; (menu_fileerrormessage.s1001 + 11)
6863 : e6 24 __ INC SP + 1 
6865 : a2 06 __ LDX #$06
6867 : bd d5 bf LDA $bfd5,x ; (wrapbuffer + 55)
686a : 95 53 __ STA T0 + 0,x 
686c : ca __ __ DEX
686d : 10 f8 __ BPL $6867 ; (menu_fileerrormessage.s1001 + 13)
686f : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_new: ; vdcwin_win_new(u8,u8,u8,u8,u8)->void
.s1000:
6870 : a5 53 __ LDA T15 + 0 
6872 : 8d ed bf STA $bfed ; (wrapbuffer + 79)
6875 : a5 54 __ LDA T15 + 1 
6877 : 8d ee bf STA $bfee ; (wrapbuffer + 80)
.s0:
687a : a5 18 __ LDA P11 ; (width + 0)
687c : 85 44 __ STA T1 + 0 
687e : ad f8 bf LDA $bff8 ; (sstack + 0)
6881 : 85 45 __ STA T2 + 0 
6883 : 85 46 __ STA T3 + 0 
6885 : a5 16 __ LDA P9 ; (xpos + 0)
6887 : 85 0d __ STA P0 
6889 : a5 17 __ LDA P10 ; (ypos + 0)
688b : 85 0e __ STA P1 
688d : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
6890 : a5 1b __ LDA ACCU + 0 
6892 : 85 47 __ STA T6 + 0 
6894 : a5 1c __ LDA ACCU + 1 
6896 : 85 48 __ STA T6 + 1 
6898 : a5 15 __ LDA P8 ; (border + 0)
689a : 85 49 __ STA T8 + 0 
689c : 29 40 __ AND #$40
689e : 85 4a __ STA T9 + 0 
68a0 : f0 13 __ BEQ $68b5 ; (vdcwin_win_new.s2233 + 0)
.s4:
68a2 : a5 16 __ LDA P9 ; (xpos + 0)
68a4 : f0 0f __ BEQ $68b5 ; (vdcwin_win_new.s2233 + 0)
.s1:
68a6 : e6 44 __ INC T1 + 0 
68a8 : 18 __ __ CLC
68a9 : a5 1b __ LDA ACCU + 0 
68ab : 69 ff __ ADC #$ff
68ad : 85 47 __ STA T6 + 0 
68af : a5 1c __ LDA ACCU + 1 
68b1 : 69 ff __ ADC #$ff
68b3 : 85 48 __ STA T6 + 1 
.s2233:
68b5 : a5 15 __ LDA P8 ; (border + 0)
68b7 : 29 20 __ AND #$20
68b9 : 85 4b __ STA T10 + 0 
68bb : f0 15 __ BEQ $68d2 ; (vdcwin_win_new.s2235 + 0)
.s8:
68bd : 18 __ __ CLC
68be : a5 18 __ LDA P11 ; (width + 0)
68c0 : 65 16 __ ADC P9 ; (xpos + 0)
68c2 : a8 __ __ TAY
68c3 : a9 00 __ LDA #$00
68c5 : 2a __ __ ROL
68c6 : cd fa 8a CMP $8afa ; (vdc_state + 4)
68c9 : d0 03 __ BNE $68ce ; (vdcwin_win_new.s1159 + 0)
.s1158:
68cb : cc f9 8a CPY $8af9 ; (vdc_state + 3)
.s1159:
68ce : b0 02 __ BCS $68d2 ; (vdcwin_win_new.s2235 + 0)
.s5:
68d0 : e6 44 __ INC T1 + 0 
.s2235:
68d2 : 24 15 __ BIT P8 ; (border + 0)
68d4 : 10 1d __ BPL $68f3 ; (vdcwin_win_new.s2236 + 0)
.s12:
68d6 : a5 17 __ LDA P10 ; (ypos + 0)
68d8 : f0 19 __ BEQ $68f3 ; (vdcwin_win_new.s2236 + 0)
.s9:
68da : e6 46 __ INC T3 + 0 
68dc : ad f9 8a LDA $8af9 ; (vdc_state + 3)
68df : 85 03 __ STA WORK + 0 
68e1 : ad fa 8a LDA $8afa ; (vdc_state + 4)
68e4 : 85 04 __ STA WORK + 1 
68e6 : 38 __ __ SEC
68e7 : a5 47 __ LDA T6 + 0 
68e9 : e5 03 __ SBC WORK + 0 
68eb : 85 47 __ STA T6 + 0 
68ed : a5 48 __ LDA T6 + 1 
68ef : e5 04 __ SBC WORK + 1 
68f1 : 85 48 __ STA T6 + 1 
.s2236:
68f3 : a5 15 __ LDA P8 ; (border + 0)
68f5 : 29 10 __ AND #$10
68f7 : f0 15 __ BEQ $690e ; (vdcwin_win_new.s15 + 0)
.s16:
68f9 : 18 __ __ CLC
68fa : a5 45 __ LDA T2 + 0 
68fc : 65 17 __ ADC P10 ; (ypos + 0)
68fe : a8 __ __ TAY
68ff : a9 00 __ LDA #$00
6901 : 2a __ __ ROL
6902 : cd fc 8a CMP $8afc ; (vdc_state + 6)
6905 : d0 03 __ BNE $690a ; (vdcwin_win_new.s1157 + 0)
.s1156:
6907 : cc fb 8a CPY $8afb ; (vdc_state + 5)
.s1157:
690a : b0 02 __ BCS $690e ; (vdcwin_win_new.s15 + 0)
.s13:
690c : e6 46 __ INC T3 + 0 
.s15:
690e : a5 45 __ LDA T2 + 0 
6910 : 85 1b __ STA ACCU + 0 
6912 : a9 00 __ LDA #$00
6914 : 85 1c __ STA ACCU + 1 
6916 : a5 18 __ LDA P11 ; (width + 0)
6918 : 20 b4 84 JSR $84b4 ; (mul16by8 + 0)
691b : a5 05 __ LDA WORK + 2 
691d : 0a __ __ ASL
691e : 85 4d __ STA T11 + 0 
6920 : a5 06 __ LDA WORK + 3 
6922 : 2a __ __ ROL
6923 : 85 4e __ STA T11 + 1 
6925 : ad f4 8a LDA $8af4 ; (winCfg + 6)
6928 : 85 4f __ STA T12 + 0 
692a : 18 __ __ CLC
692b : 65 4d __ ADC T11 + 0 
692d : 85 4d __ STA T11 + 0 
692f : ad f5 8a LDA $8af5 ; (winCfg + 7)
6932 : 85 50 __ STA T12 + 1 
6934 : 65 4e __ ADC T11 + 1 
6936 : 85 4e __ STA T11 + 1 
6938 : ad ef 8a LDA $8aef ; (winCfg + 1)
693b : 18 __ __ CLC
693c : 6d f1 8a ADC $8af1 ; (winCfg + 3)
693f : a8 __ __ TAY
6940 : ad f0 8a LDA $8af0 ; (winCfg + 2)
6943 : 6d f2 8a ADC $8af2 ; (winCfg + 4)
6946 : aa __ __ TAX
6947 : 98 __ __ TYA
6948 : 18 __ __ CLC
6949 : 69 fe __ ADC #$fe
694b : a8 __ __ TAY
694c : 8a __ __ TXA
694d : 69 ff __ ADC #$ff
694f : c5 4e __ CMP T11 + 1 
6951 : d0 02 __ BNE $6955 ; (vdcwin_win_new.s1155 + 0)
.s1154:
6953 : c4 4d __ CPY T11 + 0 
.s1155:
6955 : b0 03 __ BCS $695a ; (vdcwin_win_new.s19 + 0)
6957 : 4c 3a 6a JMP $6a3a ; (vdcwin_win_new.s1001 + 0)
.s19:
695a : ad f3 8a LDA $8af3 ; (winCfg + 5)
695d : c9 03 __ CMP #$03
695f : d0 03 __ BNE $6964 ; (vdcwin_win_new.s23 + 0)
6961 : 4c 3a 6a JMP $6a3a ; (vdcwin_win_new.s1001 + 0)
.s23:
6964 : a5 16 __ LDA P9 ; (xpos + 0)
6966 : 85 11 __ STA P4 
6968 : a5 17 __ LDA P10 ; (ypos + 0)
696a : 85 12 __ STA P5 
696c : a5 18 __ LDA P11 ; (width + 0)
696e : 85 13 __ STA P6 
6970 : a5 45 __ LDA T2 + 0 
6972 : 85 14 __ STA P7 
6974 : ee f3 8a INC $8af3 ; (winCfg + 5)
6977 : ae f3 8a LDX $8af3 ; (winCfg + 5)
697a : bd 37 86 LDA $8637,x ; (__multab13L + 0)
697d : 85 4d __ STA T11 + 0 
697f : 18 __ __ CLC
6980 : 69 f6 __ ADC #$f6
6982 : 85 0f __ STA P2 
6984 : a9 8b __ LDA #$8b
6986 : 69 00 __ ADC #$00
6988 : 85 10 __ STA P3 
698a : 20 e7 70 JSR $70e7 ; (vdcwin_init.s0 + 0)
698d : a5 4f __ LDA T12 + 0 
698f : a6 4d __ LDX T11 + 0 
6991 : 9d f3 8b STA $8bf3,x ; (linebuffer + 68)
6994 : a5 50 __ LDA T12 + 1 
6996 : 9d f4 8b STA $8bf4,x ; (linebuffer + 69)
6999 : a5 15 __ LDA P8 ; (border + 0)
699b : 9d f5 8b STA $8bf5,x ; (linebuffer + 70)
699e : a5 46 __ LDA T3 + 0 
69a0 : f0 03 __ BEQ $69a5 ; (vdcwin_win_new.s28 + 0)
69a2 : 4c 54 70 JMP $7054 ; (vdcwin_win_new.s540 + 0)
.s28:
69a5 : a5 15 __ LDA P8 ; (border + 0)
69a7 : 85 43 __ STA T0 + 0 
69a9 : a5 4d __ LDA T11 + 0 
69ab : 85 47 __ STA T6 + 0 
69ad : a5 49 __ LDA T8 + 0 
69af : 29 0f __ AND #$0f
69b1 : 49 ff __ EOR #$ff
69b3 : 18 __ __ CLC
69b4 : 69 01 __ ADC #$01
69b6 : 29 09 __ AND #$09
69b8 : 85 49 __ STA T8 + 0 
69ba : aa __ __ TAX
69bb : bd 64 86 LDA $8664,x ; (winStyles + 0)
69be : 85 44 __ STA T1 + 0 
69c0 : a5 4a __ LDA T9 + 0 
69c2 : f0 0a __ BEQ $69ce ; (vdcwin_win_new.s32 + 0)
.s33:
69c4 : a6 4d __ LDX T11 + 0 
69c6 : bd f6 8b LDA $8bf6,x ; (linebuffer + 71)
69c9 : d0 03 __ BNE $69ce ; (vdcwin_win_new.s32 + 0)
69cb : 4c 44 70 JMP $7044 ; (vdcwin_win_new.s30 + 0)
.s32:
69ce : a5 4b __ LDA T10 + 0 
69d0 : f0 2c __ BEQ $69fe ; (vdcwin_win_new.s2246 + 0)
.s37:
69d2 : a6 4d __ LDX T11 + 0 
69d4 : bd f6 8b LDA $8bf6,x ; (linebuffer + 71)
69d7 : 18 __ __ CLC
69d8 : 7d f8 8b ADC $8bf8,x ; (linebuffer + 73)
69db : a0 00 __ LDY #$00
69dd : 90 01 __ BCC $69e0 ; (vdcwin_win_new.s1163 + 0)
.s1162:
69df : c8 __ __ INY
.s1163:
69e0 : 18 __ __ CLC
69e1 : 69 01 __ ADC #$01
69e3 : 85 4b __ STA T10 + 0 
69e5 : 90 01 __ BCC $69e8 ; (vdcwin_win_new.s1165 + 0)
.s1164:
69e7 : c8 __ __ INY
.s1165:
69e8 : 84 4c __ STY T10 + 1 
69ea : ad fa 8a LDA $8afa ; (vdc_state + 4)
69ed : c5 4c __ CMP T10 + 1 
69ef : d0 05 __ BNE $69f6 ; (vdcwin_win_new.s1151 + 0)
.s1150:
69f1 : ad f9 8a LDA $8af9 ; (vdc_state + 3)
69f4 : c5 4b __ CMP T10 + 0 
.s1151:
69f6 : b0 06 __ BCS $69fe ; (vdcwin_win_new.s2246 + 0)
.s34:
69f8 : a5 43 __ LDA T0 + 0 
69fa : 29 df __ AND #$df
69fc : 85 43 __ STA T0 + 0 
.s2246:
69fe : 24 43 __ BIT T0 + 0 
6a00 : 10 0a __ BPL $6a0c ; (vdcwin_win_new.s2298 + 0)
.s41:
6a02 : a6 4d __ LDX T11 + 0 
6a04 : bd f7 8b LDA $8bf7,x ; (linebuffer + 72)
6a07 : f0 03 __ BEQ $6a0c ; (vdcwin_win_new.s2298 + 0)
6a09 : 4c 43 6e JMP $6e43 ; (vdcwin_win_new.s38 + 0)
.s2298:
6a0c : a5 43 __ LDA T0 + 0 
6a0e : 29 10 __ AND #$10
6a10 : f0 1d __ BEQ $6a2f ; (vdcwin_win_new.s491 + 0)
.s184:
6a12 : a4 47 __ LDY T6 + 0 
6a14 : b9 f7 8b LDA $8bf7,y ; (linebuffer + 72)
6a17 : 18 __ __ CLC
6a18 : 79 f9 8b ADC $8bf9,y ; (linebuffer + 74)
6a1b : 85 0e __ STA P1 
6a1d : a9 00 __ LDA #$00
6a1f : 2a __ __ ROL
6a20 : cd fc 8a CMP $8afc ; (vdc_state + 6)
6a23 : d0 05 __ BNE $6a2a ; (vdcwin_win_new.s1101 + 0)
.s1100:
6a25 : a5 0e __ LDA P1 
6a27 : cd fb 8a CMP $8afb ; (vdc_state + 5)
.s1101:
6a2a : b0 03 __ BCS $6a2f ; (vdcwin_win_new.s491 + 0)
6a2c : 4c 48 6c JMP $6c48 ; (vdcwin_win_new.s181 + 0)
.s491:
6a2f : a9 00 __ LDA #$00
6a31 : 85 45 __ STA T2 + 0 
.l324:
6a33 : a4 47 __ LDY T6 + 0 
6a35 : d9 f9 8b CMP $8bf9,y ; (linebuffer + 74)
6a38 : 90 0b __ BCC $6a45 ; (vdcwin_win_new.s325 + 0)
.s1001:
6a3a : ad ed bf LDA $bfed ; (wrapbuffer + 79)
6a3d : 85 53 __ STA T15 + 0 
6a3f : ad ee bf LDA $bfee ; (wrapbuffer + 80)
6a42 : 85 54 __ STA T15 + 1 
6a44 : 60 __ __ RTS
.s325:
6a45 : a5 43 __ LDA T0 + 0 
6a47 : 0a __ __ ASL
6a48 : 10 03 __ BPL $6a4d ; (vdcwin_win_new.s330 + 0)
6a4a : 4c c3 6b JMP $6bc3 ; (vdcwin_win_new.s328 + 0)
.s330:
6a4d : a6 47 __ LDX T6 + 0 
6a4f : bd f6 8b LDA $8bf6,x ; (linebuffer + 71)
6a52 : 85 0d __ STA P0 
6a54 : bd f7 8b LDA $8bf7,x ; (linebuffer + 72)
6a57 : 18 __ __ CLC
6a58 : 65 45 __ ADC T2 + 0 
6a5a : 85 0e __ STA P1 
6a5c : ad fd 8a LDA $8afd ; (vdc_state + 7)
6a5f : 85 46 __ STA T3 + 0 
6a61 : bd f8 8b LDA $8bf8,x ; (linebuffer + 73)
6a64 : 38 __ __ SEC
6a65 : e9 01 __ SBC #$01
6a67 : 85 51 __ STA T14 + 0 
6a69 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
6a6c : a9 12 __ LDA #$12
6a6e : 8d 00 d6 STA $d600 
6a71 : ad fe 8a LDA $8afe ; (vdc_state + 8)
6a74 : 85 4f __ STA T12 + 0 
6a76 : 18 __ __ CLC
6a77 : 65 1b __ ADC ACCU + 0 
6a79 : a8 __ __ TAY
6a7a : ad ff 8a LDA $8aff ; (vdc_state + 9)
6a7d : 85 50 __ STA T12 + 1 
6a7f : 65 1c __ ADC ACCU + 1 
.l2364:
6a81 : 2c 00 d6 BIT $d600 
6a84 : 10 fb __ BPL $6a81 ; (vdcwin_win_new.l2364 + 0)
.s371:
6a86 : 8d 01 d6 STA $d601 
6a89 : a9 13 __ LDA #$13
6a8b : 8d 00 d6 STA $d600 
.l2366:
6a8e : 2c 00 d6 BIT $d600 
6a91 : 10 fb __ BPL $6a8e ; (vdcwin_win_new.l2366 + 0)
.s376:
6a93 : 8c 01 d6 STY $d601 
6a96 : a9 1f __ LDA #$1f
6a98 : 8d 00 d6 STA $d600 
.l2368:
6a9b : 2c 00 d6 BIT $d600 
6a9e : 10 fb __ BPL $6a9b ; (vdcwin_win_new.l2368 + 0)
.s380:
6aa0 : a9 20 __ LDA #$20
6aa2 : 8d 01 d6 STA $d601 
6aa5 : a9 18 __ LDA #$18
6aa7 : 8d 00 d6 STA $d600 
.l2370:
6aaa : 2c 00 d6 BIT $d600 
6aad : 10 fb __ BPL $6aaa ; (vdcwin_win_new.l2370 + 0)
.s386:
6aaf : ad 01 d6 LDA $d601 
6ab2 : 29 7f __ AND #$7f
6ab4 : a2 18 __ LDX #$18
6ab6 : 8e 00 d6 STX $d600 
.l2372:
6ab9 : 2c 00 d6 BIT $d600 
6abc : 10 fb __ BPL $6ab9 ; (vdcwin_win_new.l2372 + 0)
.s392:
6abe : 8d 01 d6 STA $d601 
6ac1 : a9 1e __ LDA #$1e
6ac3 : 8d 00 d6 STA $d600 
.l2374:
6ac6 : 2c 00 d6 BIT $d600 
6ac9 : 10 fb __ BPL $6ac6 ; (vdcwin_win_new.l2374 + 0)
.s397:
6acb : a5 51 __ LDA T14 + 0 
6acd : 8d 01 d6 STA $d601 
6ad0 : a9 12 __ LDA #$12
6ad2 : 8d 00 d6 STA $d600 
6ad5 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
6ad8 : 85 53 __ STA T15 + 0 
6ada : 18 __ __ CLC
6adb : 65 1b __ ADC ACCU + 0 
6add : a8 __ __ TAY
6ade : ad 01 8b LDA $8b01 ; (vdc_state + 11)
6ae1 : 85 54 __ STA T15 + 1 
6ae3 : 65 1c __ ADC ACCU + 1 
.l2376:
6ae5 : 2c 00 d6 BIT $d600 
6ae8 : 10 fb __ BPL $6ae5 ; (vdcwin_win_new.l2376 + 0)
.s404:
6aea : 8d 01 d6 STA $d601 
6aed : a9 13 __ LDA #$13
6aef : 8d 00 d6 STA $d600 
.l2378:
6af2 : 2c 00 d6 BIT $d600 
6af5 : 10 fb __ BPL $6af2 ; (vdcwin_win_new.l2378 + 0)
.s409:
6af7 : 8c 01 d6 STY $d601 
6afa : a9 1f __ LDA #$1f
6afc : 8d 00 d6 STA $d600 
.l2380:
6aff : 2c 00 d6 BIT $d600 
6b02 : 10 fb __ BPL $6aff ; (vdcwin_win_new.l2380 + 0)
.s413:
6b04 : a5 46 __ LDA T3 + 0 
6b06 : 8d 01 d6 STA $d601 
6b09 : 8e 00 d6 STX $d600 
.l2382:
6b0c : 2c 00 d6 BIT $d600 
6b0f : 10 fb __ BPL $6b0c ; (vdcwin_win_new.l2382 + 0)
.s419:
6b11 : ad 01 d6 LDA $d601 
6b14 : 29 7f __ AND #$7f
6b16 : 8e 00 d6 STX $d600 
.l2384:
6b19 : 2c 00 d6 BIT $d600 
6b1c : 10 fb __ BPL $6b19 ; (vdcwin_win_new.l2384 + 0)
.s425:
6b1e : 8d 01 d6 STA $d601 
6b21 : a9 1e __ LDA #$1e
6b23 : 8d 00 d6 STA $d600 
.l2386:
6b26 : 2c 00 d6 BIT $d600 
6b29 : 10 fb __ BPL $6b26 ; (vdcwin_win_new.l2386 + 0)
.s430:
6b2b : a5 51 __ LDA T14 + 0 
6b2d : 8d 01 d6 STA $d601 
6b30 : a5 43 __ LDA T0 + 0 
6b32 : 29 20 __ AND #$20
6b34 : d0 07 __ BNE $6b3d ; (vdcwin_win_new.s431 + 0)
.s2407:
6b36 : e6 45 __ INC T2 + 0 
6b38 : a5 45 __ LDA T2 + 0 
6b3a : 4c 33 6a JMP $6a33 ; (vdcwin_win_new.l324 + 0)
.s431:
6b3d : a6 47 __ LDX T6 + 0 
6b3f : bd f6 8b LDA $8bf6,x ; (linebuffer + 71)
6b42 : 18 __ __ CLC
6b43 : 7d f8 8b ADC $8bf8,x ; (linebuffer + 73)
6b46 : 85 0d __ STA P0 
6b48 : bd f7 8b LDA $8bf7,x ; (linebuffer + 72)
6b4b : 18 __ __ CLC
6b4c : 65 45 __ ADC T2 + 0 
6b4e : 85 0e __ STA P1 
6b50 : a6 49 __ LDX T8 + 0 
6b52 : bd 6c 86 LDA $866c,x ; (winStyles + 8)
6b55 : 85 46 __ STA T3 + 0 
6b57 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
6b5a : a9 12 __ LDA #$12
6b5c : 8d 00 d6 STA $d600 
6b5f : 18 __ __ CLC
6b60 : a5 1b __ LDA ACCU + 0 
6b62 : 65 4f __ ADC T12 + 0 
6b64 : a8 __ __ TAY
6b65 : a5 1c __ LDA ACCU + 1 
6b67 : 65 50 __ ADC T12 + 1 
.l2389:
6b69 : 2c 00 d6 BIT $d600 
6b6c : 10 fb __ BPL $6b69 ; (vdcwin_win_new.l2389 + 0)
.s441:
6b6e : 8d 01 d6 STA $d601 
6b71 : a9 13 __ LDA #$13
6b73 : 8d 00 d6 STA $d600 
.l2391:
6b76 : 2c 00 d6 BIT $d600 
6b79 : 10 fb __ BPL $6b76 ; (vdcwin_win_new.l2391 + 0)
.s446:
6b7b : 8c 01 d6 STY $d601 
6b7e : a9 1f __ LDA #$1f
6b80 : 8d 00 d6 STA $d600 
.l2393:
6b83 : 2c 00 d6 BIT $d600 
6b86 : 10 fb __ BPL $6b83 ; (vdcwin_win_new.l2393 + 0)
.s450:
6b88 : a5 46 __ LDA T3 + 0 
6b8a : 8d 01 d6 STA $d601 
6b8d : a9 12 __ LDA #$12
6b8f : 8d 00 d6 STA $d600 
6b92 : 18 __ __ CLC
6b93 : a5 1b __ LDA ACCU + 0 
6b95 : 65 53 __ ADC T15 + 0 
6b97 : a8 __ __ TAY
6b98 : a5 1c __ LDA ACCU + 1 
6b9a : 65 54 __ ADC T15 + 1 
.l2395:
6b9c : 2c 00 d6 BIT $d600 
6b9f : 10 fb __ BPL $6b9c ; (vdcwin_win_new.l2395 + 0)
.s457:
6ba1 : 8d 01 d6 STA $d601 
6ba4 : a9 13 __ LDA #$13
6ba6 : 8d 00 d6 STA $d600 
.l2397:
6ba9 : 2c 00 d6 BIT $d600 
6bac : 10 fb __ BPL $6ba9 ; (vdcwin_win_new.l2397 + 0)
.s462:
6bae : 8c 01 d6 STY $d601 
6bb1 : a9 1f __ LDA #$1f
6bb3 : 8d 00 d6 STA $d600 
.l2399:
6bb6 : 2c 00 d6 BIT $d600 
6bb9 : 10 fb __ BPL $6bb6 ; (vdcwin_win_new.l2399 + 0)
.s466:
6bbb : a5 44 __ LDA T1 + 0 
6bbd : 8d 01 d6 STA $d601 
6bc0 : 4c 36 6b JMP $6b36 ; (vdcwin_win_new.s2407 + 0)
.s328:
6bc3 : be f6 8b LDX $8bf6,y ; (linebuffer + 71)
6bc6 : ca __ __ DEX
6bc7 : 86 0d __ STX P0 
6bc9 : b9 f7 8b LDA $8bf7,y ; (linebuffer + 72)
6bcc : 18 __ __ CLC
6bcd : 65 45 __ ADC T2 + 0 
6bcf : 85 0e __ STA P1 
6bd1 : a6 49 __ LDX T8 + 0 
6bd3 : bd 6b 86 LDA $866b,x ; (winStyles + 7)
6bd6 : 85 46 __ STA T3 + 0 
6bd8 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
6bdb : a9 12 __ LDA #$12
6bdd : 8d 00 d6 STA $d600 
6be0 : 18 __ __ CLC
6be1 : a5 1b __ LDA ACCU + 0 
6be3 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
6be6 : a8 __ __ TAY
6be7 : a5 1c __ LDA ACCU + 1 
6be9 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l2352:
6bec : 2c 00 d6 BIT $d600 
6bef : 10 fb __ BPL $6bec ; (vdcwin_win_new.l2352 + 0)
.s338:
6bf1 : 8d 01 d6 STA $d601 
6bf4 : a9 13 __ LDA #$13
6bf6 : 8d 00 d6 STA $d600 
.l2354:
6bf9 : 2c 00 d6 BIT $d600 
6bfc : 10 fb __ BPL $6bf9 ; (vdcwin_win_new.l2354 + 0)
.s343:
6bfe : 8c 01 d6 STY $d601 
6c01 : a9 1f __ LDA #$1f
6c03 : 8d 00 d6 STA $d600 
.l2356:
6c06 : 2c 00 d6 BIT $d600 
6c09 : 10 fb __ BPL $6c06 ; (vdcwin_win_new.l2356 + 0)
.s347:
6c0b : a5 46 __ LDA T3 + 0 
6c0d : 8d 01 d6 STA $d601 
6c10 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
6c13 : 18 __ __ CLC
6c14 : 65 1b __ ADC ACCU + 0 
6c16 : a8 __ __ TAY
6c17 : a9 12 __ LDA #$12
6c19 : 8d 00 d6 STA $d600 
6c1c : ad 01 8b LDA $8b01 ; (vdc_state + 11)
6c1f : 65 1c __ ADC ACCU + 1 
.l2358:
6c21 : 2c 00 d6 BIT $d600 
6c24 : 10 fb __ BPL $6c21 ; (vdcwin_win_new.l2358 + 0)
.s354:
6c26 : 8d 01 d6 STA $d601 
6c29 : a9 13 __ LDA #$13
6c2b : 8d 00 d6 STA $d600 
.l2360:
6c2e : 2c 00 d6 BIT $d600 
6c31 : 10 fb __ BPL $6c2e ; (vdcwin_win_new.l2360 + 0)
.s359:
6c33 : 8c 01 d6 STY $d601 
6c36 : a9 1f __ LDA #$1f
6c38 : 8d 00 d6 STA $d600 
.l2362:
6c3b : 2c 00 d6 BIT $d600 
6c3e : 10 fb __ BPL $6c3b ; (vdcwin_win_new.l2362 + 0)
.s363:
6c40 : a5 44 __ LDA T1 + 0 
6c42 : 8d 01 d6 STA $d601 
6c45 : 4c 4d 6a JMP $6a4d ; (vdcwin_win_new.s330 + 0)
.s181:
6c48 : a5 43 __ LDA T0 + 0 
6c4a : 0a __ __ ASL
6c4b : 10 03 __ BPL $6c50 ; (vdcwin_win_new.s187 + 0)
6c4d : 4c c6 6d JMP $6dc6 ; (vdcwin_win_new.s185 + 0)
.s187:
6c50 : a6 47 __ LDX T6 + 0 
6c52 : bd f6 8b LDA $8bf6,x ; (linebuffer + 71)
6c55 : 85 0d __ STA P0 
6c57 : bd f7 8b LDA $8bf7,x ; (linebuffer + 72)
6c5a : 18 __ __ CLC
6c5b : 7d f9 8b ADC $8bf9,x ; (linebuffer + 74)
6c5e : 85 0e __ STA P1 
6c60 : a4 49 __ LDY T8 + 0 
6c62 : b9 6a 86 LDA $866a,y ; (winStyles + 6)
6c65 : 85 45 __ STA T2 + 0 
6c67 : bd f8 8b LDA $8bf8,x ; (linebuffer + 73)
6c6a : 38 __ __ SEC
6c6b : e9 01 __ SBC #$01
6c6d : 85 4f __ STA T12 + 0 
6c6f : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
6c72 : a9 12 __ LDA #$12
6c74 : 8d 00 d6 STA $d600 
6c77 : ad fe 8a LDA $8afe ; (vdc_state + 8)
6c7a : 85 4d __ STA T11 + 0 
6c7c : 18 __ __ CLC
6c7d : 65 1b __ ADC ACCU + 0 
6c7f : a8 __ __ TAY
6c80 : ad ff 8a LDA $8aff ; (vdc_state + 9)
6c83 : 85 4e __ STA T11 + 1 
6c85 : 65 1c __ ADC ACCU + 1 
.l2313:
6c87 : 2c 00 d6 BIT $d600 
6c8a : 10 fb __ BPL $6c87 ; (vdcwin_win_new.l2313 + 0)
.s228:
6c8c : 8d 01 d6 STA $d601 
6c8f : a9 13 __ LDA #$13
6c91 : 8d 00 d6 STA $d600 
.l2315:
6c94 : 2c 00 d6 BIT $d600 
6c97 : 10 fb __ BPL $6c94 ; (vdcwin_win_new.l2315 + 0)
.s233:
6c99 : 8c 01 d6 STY $d601 
6c9c : a9 1f __ LDA #$1f
6c9e : 8d 00 d6 STA $d600 
.l2317:
6ca1 : 2c 00 d6 BIT $d600 
6ca4 : 10 fb __ BPL $6ca1 ; (vdcwin_win_new.l2317 + 0)
.s237:
6ca6 : a5 45 __ LDA T2 + 0 
6ca8 : 8d 01 d6 STA $d601 
6cab : a9 18 __ LDA #$18
6cad : 8d 00 d6 STA $d600 
.l2319:
6cb0 : 2c 00 d6 BIT $d600 
6cb3 : 10 fb __ BPL $6cb0 ; (vdcwin_win_new.l2319 + 0)
.s243:
6cb5 : ad 01 d6 LDA $d601 
6cb8 : 29 7f __ AND #$7f
6cba : a2 18 __ LDX #$18
6cbc : 8e 00 d6 STX $d600 
.l2321:
6cbf : 2c 00 d6 BIT $d600 
6cc2 : 10 fb __ BPL $6cbf ; (vdcwin_win_new.l2321 + 0)
.s249:
6cc4 : 8d 01 d6 STA $d601 
6cc7 : a9 1e __ LDA #$1e
6cc9 : 8d 00 d6 STA $d600 
.l2323:
6ccc : 2c 00 d6 BIT $d600 
6ccf : 10 fb __ BPL $6ccc ; (vdcwin_win_new.l2323 + 0)
.s254:
6cd1 : a5 4f __ LDA T12 + 0 
6cd3 : 8d 01 d6 STA $d601 
6cd6 : a9 12 __ LDA #$12
6cd8 : 8d 00 d6 STA $d600 
6cdb : ad 00 8b LDA $8b00 ; (vdc_state + 10)
6cde : 85 51 __ STA T14 + 0 
6ce0 : 18 __ __ CLC
6ce1 : 65 1b __ ADC ACCU + 0 
6ce3 : a8 __ __ TAY
6ce4 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
6ce7 : 85 52 __ STA T14 + 1 
6ce9 : 65 1c __ ADC ACCU + 1 
.l2325:
6ceb : 2c 00 d6 BIT $d600 
6cee : 10 fb __ BPL $6ceb ; (vdcwin_win_new.l2325 + 0)
.s261:
6cf0 : 8d 01 d6 STA $d601 
6cf3 : a9 13 __ LDA #$13
6cf5 : 8d 00 d6 STA $d600 
.l2327:
6cf8 : 2c 00 d6 BIT $d600 
6cfb : 10 fb __ BPL $6cf8 ; (vdcwin_win_new.l2327 + 0)
.s266:
6cfd : 8c 01 d6 STY $d601 
6d00 : a9 1f __ LDA #$1f
6d02 : 8d 00 d6 STA $d600 
.l2329:
6d05 : 2c 00 d6 BIT $d600 
6d08 : 10 fb __ BPL $6d05 ; (vdcwin_win_new.l2329 + 0)
.s270:
6d0a : a5 44 __ LDA T1 + 0 
6d0c : 8d 01 d6 STA $d601 
6d0f : 8e 00 d6 STX $d600 
.l2331:
6d12 : 2c 00 d6 BIT $d600 
6d15 : 10 fb __ BPL $6d12 ; (vdcwin_win_new.l2331 + 0)
.s276:
6d17 : ad 01 d6 LDA $d601 
6d1a : 29 7f __ AND #$7f
6d1c : 8e 00 d6 STX $d600 
.l2333:
6d1f : 2c 00 d6 BIT $d600 
6d22 : 10 fb __ BPL $6d1f ; (vdcwin_win_new.l2333 + 0)
.s282:
6d24 : 8d 01 d6 STA $d601 
6d27 : a9 1e __ LDA #$1e
6d29 : 8d 00 d6 STA $d600 
.l2335:
6d2c : 2c 00 d6 BIT $d600 
6d2f : 10 fb __ BPL $6d2c ; (vdcwin_win_new.l2335 + 0)
.s287:
6d31 : a5 4f __ LDA T12 + 0 
6d33 : 8d 01 d6 STA $d601 
6d36 : a5 43 __ LDA T0 + 0 
6d38 : 29 20 __ AND #$20
6d3a : d0 03 __ BNE $6d3f ; (vdcwin_win_new.s288 + 0)
6d3c : 4c 2f 6a JMP $6a2f ; (vdcwin_win_new.s491 + 0)
.s288:
6d3f : a6 47 __ LDX T6 + 0 
6d41 : bd f6 8b LDA $8bf6,x ; (linebuffer + 71)
6d44 : 18 __ __ CLC
6d45 : 7d f8 8b ADC $8bf8,x ; (linebuffer + 73)
6d48 : 85 0d __ STA P0 
6d4a : bd f7 8b LDA $8bf7,x ; (linebuffer + 72)
6d4d : 18 __ __ CLC
6d4e : 7d f9 8b ADC $8bf9,x ; (linebuffer + 74)
6d51 : 85 0e __ STA P1 
6d53 : a6 49 __ LDX T8 + 0 
6d55 : bd 68 86 LDA $8668,x ; (winStyles + 4)
6d58 : 85 45 __ STA T2 + 0 
6d5a : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
6d5d : a9 12 __ LDA #$12
6d5f : 8d 00 d6 STA $d600 
6d62 : 18 __ __ CLC
6d63 : a5 1b __ LDA ACCU + 0 
6d65 : 65 4d __ ADC T11 + 0 
6d67 : a8 __ __ TAY
6d68 : a5 1c __ LDA ACCU + 1 
6d6a : 65 4e __ ADC T11 + 1 
.l2338:
6d6c : 2c 00 d6 BIT $d600 
6d6f : 10 fb __ BPL $6d6c ; (vdcwin_win_new.l2338 + 0)
.s298:
6d71 : 8d 01 d6 STA $d601 
6d74 : a9 13 __ LDA #$13
6d76 : 8d 00 d6 STA $d600 
.l2340:
6d79 : 2c 00 d6 BIT $d600 
6d7c : 10 fb __ BPL $6d79 ; (vdcwin_win_new.l2340 + 0)
.s303:
6d7e : 8c 01 d6 STY $d601 
6d81 : a9 1f __ LDA #$1f
6d83 : 8d 00 d6 STA $d600 
.l2342:
6d86 : 2c 00 d6 BIT $d600 
6d89 : 10 fb __ BPL $6d86 ; (vdcwin_win_new.l2342 + 0)
.s307:
6d8b : a5 45 __ LDA T2 + 0 
6d8d : 8d 01 d6 STA $d601 
6d90 : a9 12 __ LDA #$12
6d92 : 8d 00 d6 STA $d600 
6d95 : 18 __ __ CLC
6d96 : a5 1b __ LDA ACCU + 0 
6d98 : 65 51 __ ADC T14 + 0 
6d9a : a8 __ __ TAY
6d9b : a5 1c __ LDA ACCU + 1 
6d9d : 65 52 __ ADC T14 + 1 
.l2344:
6d9f : 2c 00 d6 BIT $d600 
6da2 : 10 fb __ BPL $6d9f ; (vdcwin_win_new.l2344 + 0)
.s314:
6da4 : 8d 01 d6 STA $d601 
6da7 : a9 13 __ LDA #$13
6da9 : 8d 00 d6 STA $d600 
.l2346:
6dac : 2c 00 d6 BIT $d600 
6daf : 10 fb __ BPL $6dac ; (vdcwin_win_new.l2346 + 0)
.s319:
6db1 : 8c 01 d6 STY $d601 
6db4 : a9 1f __ LDA #$1f
6db6 : 8d 00 d6 STA $d600 
.l2348:
6db9 : 2c 00 d6 BIT $d600 
6dbc : 10 fb __ BPL $6db9 ; (vdcwin_win_new.l2348 + 0)
.s323:
6dbe : a5 44 __ LDA T1 + 0 
6dc0 : 8d 01 d6 STA $d601 
6dc3 : 4c 2f 6a JMP $6a2f ; (vdcwin_win_new.s491 + 0)
.s185:
6dc6 : be f6 8b LDX $8bf6,y ; (linebuffer + 71)
6dc9 : ca __ __ DEX
6dca : 86 0d __ STX P0 
6dcc : a6 49 __ LDX T8 + 0 
6dce : bd 67 86 LDA $8667,x ; (winStyles + 3)
6dd1 : 85 45 __ STA T2 + 0 
6dd3 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
6dd6 : a9 12 __ LDA #$12
6dd8 : 8d 00 d6 STA $d600 
6ddb : 18 __ __ CLC
6ddc : a5 1b __ LDA ACCU + 0 
6dde : 6d fe 8a ADC $8afe ; (vdc_state + 8)
6de1 : a8 __ __ TAY
6de2 : a5 1c __ LDA ACCU + 1 
6de4 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l2301:
6de7 : 2c 00 d6 BIT $d600 
6dea : 10 fb __ BPL $6de7 ; (vdcwin_win_new.l2301 + 0)
.s195:
6dec : 8d 01 d6 STA $d601 
6def : a9 13 __ LDA #$13
6df1 : 8d 00 d6 STA $d600 
.l2303:
6df4 : 2c 00 d6 BIT $d600 
6df7 : 10 fb __ BPL $6df4 ; (vdcwin_win_new.l2303 + 0)
.s200:
6df9 : 8c 01 d6 STY $d601 
6dfc : a9 1f __ LDA #$1f
6dfe : 8d 00 d6 STA $d600 
.l2305:
6e01 : 2c 00 d6 BIT $d600 
6e04 : 10 fb __ BPL $6e01 ; (vdcwin_win_new.l2305 + 0)
.s204:
6e06 : a5 45 __ LDA T2 + 0 
6e08 : 8d 01 d6 STA $d601 
6e0b : ad 00 8b LDA $8b00 ; (vdc_state + 10)
6e0e : 18 __ __ CLC
6e0f : 65 1b __ ADC ACCU + 0 
6e11 : a8 __ __ TAY
6e12 : a9 12 __ LDA #$12
6e14 : 8d 00 d6 STA $d600 
6e17 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
6e1a : 65 1c __ ADC ACCU + 1 
.l2307:
6e1c : 2c 00 d6 BIT $d600 
6e1f : 10 fb __ BPL $6e1c ; (vdcwin_win_new.l2307 + 0)
.s211:
6e21 : 8d 01 d6 STA $d601 
6e24 : a9 13 __ LDA #$13
6e26 : 8d 00 d6 STA $d600 
.l2309:
6e29 : 2c 00 d6 BIT $d600 
6e2c : 10 fb __ BPL $6e29 ; (vdcwin_win_new.l2309 + 0)
.s216:
6e2e : 8c 01 d6 STY $d601 
6e31 : a9 1f __ LDA #$1f
6e33 : 8d 00 d6 STA $d600 
.l2311:
6e36 : 2c 00 d6 BIT $d600 
6e39 : 10 fb __ BPL $6e36 ; (vdcwin_win_new.l2311 + 0)
.s220:
6e3b : a5 44 __ LDA T1 + 0 
6e3d : 8d 01 d6 STA $d601 
6e40 : 4c 50 6c JMP $6c50 ; (vdcwin_win_new.s187 + 0)
.s38:
6e43 : a5 43 __ LDA T0 + 0 
6e45 : 0a __ __ ASL
6e46 : 10 03 __ BPL $6e4b ; (vdcwin_win_new.s44 + 0)
6e48 : 4c bf 6f JMP $6fbf ; (vdcwin_win_new.s42 + 0)
.s44:
6e4b : a6 4d __ LDX T11 + 0 
6e4d : bd f6 8b LDA $8bf6,x ; (linebuffer + 71)
6e50 : 85 0d __ STA P0 
6e52 : bd f7 8b LDA $8bf7,x ; (linebuffer + 72)
6e55 : 38 __ __ SEC
6e56 : e9 01 __ SBC #$01
6e58 : 85 0e __ STA P1 
6e5a : a4 49 __ LDY T8 + 0 
6e5c : b9 69 86 LDA $8669,y ; (winStyles + 5)
6e5f : 85 45 __ STA T2 + 0 
6e61 : bd f8 8b LDA $8bf8,x ; (linebuffer + 73)
6e64 : 38 __ __ SEC
6e65 : e9 01 __ SBC #$01
6e67 : 85 4f __ STA T12 + 0 
6e69 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
6e6c : a9 12 __ LDA #$12
6e6e : 8d 00 d6 STA $d600 
6e71 : ad fe 8a LDA $8afe ; (vdc_state + 8)
6e74 : 85 4d __ STA T11 + 0 
6e76 : 18 __ __ CLC
6e77 : 65 1b __ ADC ACCU + 0 
6e79 : a8 __ __ TAY
6e7a : ad ff 8a LDA $8aff ; (vdc_state + 9)
6e7d : 85 4e __ STA T11 + 1 
6e7f : 65 1c __ ADC ACCU + 1 
.l2261:
6e81 : 2c 00 d6 BIT $d600 
6e84 : 10 fb __ BPL $6e81 ; (vdcwin_win_new.l2261 + 0)
.s85:
6e86 : 8d 01 d6 STA $d601 
6e89 : a9 13 __ LDA #$13
6e8b : 8d 00 d6 STA $d600 
.l2263:
6e8e : 2c 00 d6 BIT $d600 
6e91 : 10 fb __ BPL $6e8e ; (vdcwin_win_new.l2263 + 0)
.s90:
6e93 : 8c 01 d6 STY $d601 
6e96 : a9 1f __ LDA #$1f
6e98 : 8d 00 d6 STA $d600 
.l2265:
6e9b : 2c 00 d6 BIT $d600 
6e9e : 10 fb __ BPL $6e9b ; (vdcwin_win_new.l2265 + 0)
.s94:
6ea0 : a5 45 __ LDA T2 + 0 
6ea2 : 8d 01 d6 STA $d601 
6ea5 : a9 18 __ LDA #$18
6ea7 : 8d 00 d6 STA $d600 
.l2267:
6eaa : 2c 00 d6 BIT $d600 
6ead : 10 fb __ BPL $6eaa ; (vdcwin_win_new.l2267 + 0)
.s100:
6eaf : ad 01 d6 LDA $d601 
6eb2 : 29 7f __ AND #$7f
6eb4 : a2 18 __ LDX #$18
6eb6 : 8e 00 d6 STX $d600 
.l2269:
6eb9 : 2c 00 d6 BIT $d600 
6ebc : 10 fb __ BPL $6eb9 ; (vdcwin_win_new.l2269 + 0)
.s106:
6ebe : 8d 01 d6 STA $d601 
6ec1 : a9 1e __ LDA #$1e
6ec3 : 8d 00 d6 STA $d600 
.l2271:
6ec6 : 2c 00 d6 BIT $d600 
6ec9 : 10 fb __ BPL $6ec6 ; (vdcwin_win_new.l2271 + 0)
.s111:
6ecb : a5 4f __ LDA T12 + 0 
6ecd : 8d 01 d6 STA $d601 
6ed0 : a9 12 __ LDA #$12
6ed2 : 8d 00 d6 STA $d600 
6ed5 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
6ed8 : 85 51 __ STA T14 + 0 
6eda : 18 __ __ CLC
6edb : 65 1b __ ADC ACCU + 0 
6edd : a8 __ __ TAY
6ede : ad 01 8b LDA $8b01 ; (vdc_state + 11)
6ee1 : 85 52 __ STA T14 + 1 
6ee3 : 65 1c __ ADC ACCU + 1 
.l2273:
6ee5 : 2c 00 d6 BIT $d600 
6ee8 : 10 fb __ BPL $6ee5 ; (vdcwin_win_new.l2273 + 0)
.s118:
6eea : 8d 01 d6 STA $d601 
6eed : a9 13 __ LDA #$13
6eef : 8d 00 d6 STA $d600 
.l2275:
6ef2 : 2c 00 d6 BIT $d600 
6ef5 : 10 fb __ BPL $6ef2 ; (vdcwin_win_new.l2275 + 0)
.s123:
6ef7 : 8c 01 d6 STY $d601 
6efa : a9 1f __ LDA #$1f
6efc : 8d 00 d6 STA $d600 
.l2277:
6eff : 2c 00 d6 BIT $d600 
6f02 : 10 fb __ BPL $6eff ; (vdcwin_win_new.l2277 + 0)
.s127:
6f04 : a5 44 __ LDA T1 + 0 
6f06 : 8d 01 d6 STA $d601 
6f09 : 8e 00 d6 STX $d600 
.l2279:
6f0c : 2c 00 d6 BIT $d600 
6f0f : 10 fb __ BPL $6f0c ; (vdcwin_win_new.l2279 + 0)
.s133:
6f11 : ad 01 d6 LDA $d601 
6f14 : 29 7f __ AND #$7f
6f16 : 8e 00 d6 STX $d600 
.l2281:
6f19 : 2c 00 d6 BIT $d600 
6f1c : 10 fb __ BPL $6f19 ; (vdcwin_win_new.l2281 + 0)
.s139:
6f1e : 8d 01 d6 STA $d601 
6f21 : a9 1e __ LDA #$1e
6f23 : 8d 00 d6 STA $d600 
.l2283:
6f26 : 2c 00 d6 BIT $d600 
6f29 : 10 fb __ BPL $6f26 ; (vdcwin_win_new.l2283 + 0)
.s144:
6f2b : a5 4f __ LDA T12 + 0 
6f2d : 8d 01 d6 STA $d601 
6f30 : a5 43 __ LDA T0 + 0 
6f32 : 29 20 __ AND #$20
6f34 : d0 03 __ BNE $6f39 ; (vdcwin_win_new.s145 + 0)
6f36 : 4c 0c 6a JMP $6a0c ; (vdcwin_win_new.s2298 + 0)
.s145:
6f39 : a6 47 __ LDX T6 + 0 
6f3b : bd f6 8b LDA $8bf6,x ; (linebuffer + 71)
6f3e : 18 __ __ CLC
6f3f : 7d f8 8b ADC $8bf8,x ; (linebuffer + 73)
6f42 : 85 0d __ STA P0 
6f44 : bd f7 8b LDA $8bf7,x ; (linebuffer + 72)
6f47 : 38 __ __ SEC
6f48 : e9 01 __ SBC #$01
6f4a : 85 0e __ STA P1 
6f4c : a6 49 __ LDX T8 + 0 
6f4e : bd 66 86 LDA $8666,x ; (winStyles + 2)
6f51 : 85 45 __ STA T2 + 0 
6f53 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
6f56 : a9 12 __ LDA #$12
6f58 : 8d 00 d6 STA $d600 
6f5b : 18 __ __ CLC
6f5c : a5 1b __ LDA ACCU + 0 
6f5e : 65 4d __ ADC T11 + 0 
6f60 : a8 __ __ TAY
6f61 : a5 1c __ LDA ACCU + 1 
6f63 : 65 4e __ ADC T11 + 1 
.l2286:
6f65 : 2c 00 d6 BIT $d600 
6f68 : 10 fb __ BPL $6f65 ; (vdcwin_win_new.l2286 + 0)
.s155:
6f6a : 8d 01 d6 STA $d601 
6f6d : a9 13 __ LDA #$13
6f6f : 8d 00 d6 STA $d600 
.l2288:
6f72 : 2c 00 d6 BIT $d600 
6f75 : 10 fb __ BPL $6f72 ; (vdcwin_win_new.l2288 + 0)
.s160:
6f77 : 8c 01 d6 STY $d601 
6f7a : a9 1f __ LDA #$1f
6f7c : 8d 00 d6 STA $d600 
.l2290:
6f7f : 2c 00 d6 BIT $d600 
6f82 : 10 fb __ BPL $6f7f ; (vdcwin_win_new.l2290 + 0)
.s164:
6f84 : a5 45 __ LDA T2 + 0 
6f86 : 8d 01 d6 STA $d601 
6f89 : a9 12 __ LDA #$12
6f8b : 8d 00 d6 STA $d600 
6f8e : 18 __ __ CLC
6f8f : a5 1b __ LDA ACCU + 0 
6f91 : 65 51 __ ADC T14 + 0 
6f93 : a8 __ __ TAY
6f94 : a5 1c __ LDA ACCU + 1 
6f96 : 65 52 __ ADC T14 + 1 
.l2292:
6f98 : 2c 00 d6 BIT $d600 
6f9b : 10 fb __ BPL $6f98 ; (vdcwin_win_new.l2292 + 0)
.s171:
6f9d : 8d 01 d6 STA $d601 
6fa0 : a9 13 __ LDA #$13
6fa2 : 8d 00 d6 STA $d600 
.l2294:
6fa5 : 2c 00 d6 BIT $d600 
6fa8 : 10 fb __ BPL $6fa5 ; (vdcwin_win_new.l2294 + 0)
.s176:
6faa : 8c 01 d6 STY $d601 
6fad : a9 1f __ LDA #$1f
6faf : 8d 00 d6 STA $d600 
.l2296:
6fb2 : 2c 00 d6 BIT $d600 
6fb5 : 10 fb __ BPL $6fb2 ; (vdcwin_win_new.l2296 + 0)
.s180:
6fb7 : a5 44 __ LDA T1 + 0 
6fb9 : 8d 01 d6 STA $d601 
6fbc : 4c 0c 6a JMP $6a0c ; (vdcwin_win_new.s2298 + 0)
.s42:
6fbf : bd f6 8b LDA $8bf6,x ; (linebuffer + 71)
6fc2 : 38 __ __ SEC
6fc3 : e9 01 __ SBC #$01
6fc5 : 85 0d __ STA P0 
6fc7 : bc f7 8b LDY $8bf7,x ; (linebuffer + 72)
6fca : 88 __ __ DEY
6fcb : 84 0e __ STY P1 
6fcd : a6 49 __ LDX T8 + 0 
6fcf : bd 65 86 LDA $8665,x ; (winStyles + 1)
6fd2 : 85 45 __ STA T2 + 0 
6fd4 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
6fd7 : a9 12 __ LDA #$12
6fd9 : 8d 00 d6 STA $d600 
6fdc : 18 __ __ CLC
6fdd : a5 1b __ LDA ACCU + 0 
6fdf : 6d fe 8a ADC $8afe ; (vdc_state + 8)
6fe2 : a8 __ __ TAY
6fe3 : a5 1c __ LDA ACCU + 1 
6fe5 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l2249:
6fe8 : 2c 00 d6 BIT $d600 
6feb : 10 fb __ BPL $6fe8 ; (vdcwin_win_new.l2249 + 0)
.s52:
6fed : 8d 01 d6 STA $d601 
6ff0 : a9 13 __ LDA #$13
6ff2 : 8d 00 d6 STA $d600 
.l2251:
6ff5 : 2c 00 d6 BIT $d600 
6ff8 : 10 fb __ BPL $6ff5 ; (vdcwin_win_new.l2251 + 0)
.s57:
6ffa : 8c 01 d6 STY $d601 
6ffd : a9 1f __ LDA #$1f
6fff : 8d 00 d6 STA $d600 
.l2253:
7002 : 2c 00 d6 BIT $d600 
7005 : 10 fb __ BPL $7002 ; (vdcwin_win_new.l2253 + 0)
.s61:
7007 : a5 45 __ LDA T2 + 0 
7009 : 8d 01 d6 STA $d601 
700c : ad 00 8b LDA $8b00 ; (vdc_state + 10)
700f : 18 __ __ CLC
7010 : 65 1b __ ADC ACCU + 0 
7012 : a8 __ __ TAY
7013 : a9 12 __ LDA #$12
7015 : 8d 00 d6 STA $d600 
7018 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
701b : 65 1c __ ADC ACCU + 1 
.l2255:
701d : 2c 00 d6 BIT $d600 
7020 : 10 fb __ BPL $701d ; (vdcwin_win_new.l2255 + 0)
.s68:
7022 : 8d 01 d6 STA $d601 
7025 : a9 13 __ LDA #$13
7027 : 8d 00 d6 STA $d600 
.l2257:
702a : 2c 00 d6 BIT $d600 
702d : 10 fb __ BPL $702a ; (vdcwin_win_new.l2257 + 0)
.s73:
702f : 8c 01 d6 STY $d601 
7032 : a9 1f __ LDA #$1f
7034 : 8d 00 d6 STA $d600 
.l2259:
7037 : 2c 00 d6 BIT $d600 
703a : 10 fb __ BPL $7037 ; (vdcwin_win_new.l2259 + 0)
.s77:
703c : a5 44 __ LDA T1 + 0 
703e : 8d 01 d6 STA $d601 
7041 : 4c 4b 6e JMP $6e4b ; (vdcwin_win_new.s44 + 0)
.s30:
7044 : a5 15 __ LDA P8 ; (border + 0)
7046 : 29 bf __ AND #$bf
7048 : 85 43 __ STA T0 + 0 
704a : 29 20 __ AND #$20
704c : d0 03 __ BNE $7051 ; (vdcwin_win_new.s30 + 13)
704e : 4c fe 69 JMP $69fe ; (vdcwin_win_new.s2246 + 0)
7051 : 4c d2 69 JMP $69d2 ; (vdcwin_win_new.s37 + 0)
.s540:
7054 : 85 43 __ STA T0 + 0 
7056 : a5 44 __ LDA T1 + 0 
7058 : 85 12 __ STA P5 
.l1160:
705a : a9 00 __ LDA #$00
705c : 85 13 __ STA P6 
705e : ad ee 8a LDA $8aee ; (winCfg + 0)
7061 : 85 0d __ STA P0 
7063 : ad f4 8a LDA $8af4 ; (winCfg + 6)
7066 : 85 4f __ STA T12 + 0 
7068 : 85 0e __ STA P1 
706a : ad f5 8a LDA $8af5 ; (winCfg + 7)
706d : 85 50 __ STA T12 + 1 
706f : 85 0f __ STA P2 
7071 : ad fe 8a LDA $8afe ; (vdc_state + 8)
7074 : 18 __ __ CLC
7075 : 65 47 __ ADC T6 + 0 
7077 : 85 10 __ STA P3 
7079 : ad ff 8a LDA $8aff ; (vdc_state + 9)
707c : 65 48 __ ADC T6 + 1 
707e : 85 11 __ STA P4 
7080 : 20 ce 13 JSR $13ce ; (bnk_cpyfromvdc.s0 + 0)
7083 : a9 00 __ LDA #$00
7085 : 85 13 __ STA P6 
7087 : 18 __ __ CLC
7088 : a5 4f __ LDA T12 + 0 
708a : 65 12 __ ADC P5 
708c : 85 4f __ STA T12 + 0 
708e : 85 0e __ STA P1 
7090 : 8d f4 8a STA $8af4 ; (winCfg + 6)
7093 : a5 50 __ LDA T12 + 1 
7095 : 69 00 __ ADC #$00
7097 : 85 50 __ STA T12 + 1 
7099 : 85 0f __ STA P2 
709b : 8d f5 8a STA $8af5 ; (winCfg + 7)
709e : ad 00 8b LDA $8b00 ; (vdc_state + 10)
70a1 : 18 __ __ CLC
70a2 : 65 47 __ ADC T6 + 0 
70a4 : 85 10 __ STA P3 
70a6 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
70a9 : 65 48 __ ADC T6 + 1 
70ab : 85 11 __ STA P4 
70ad : 20 ce 13 JSR $13ce ; (bnk_cpyfromvdc.s0 + 0)
70b0 : 18 __ __ CLC
70b1 : a5 4f __ LDA T12 + 0 
70b3 : 65 12 __ ADC P5 
70b5 : 8d f4 8a STA $8af4 ; (winCfg + 6)
70b8 : a5 50 __ LDA T12 + 1 
70ba : 69 00 __ ADC #$00
70bc : 8d f5 8a STA $8af5 ; (winCfg + 7)
70bf : ad f9 8a LDA $8af9 ; (vdc_state + 3)
70c2 : 18 __ __ CLC
70c3 : 65 47 __ ADC T6 + 0 
70c5 : 85 47 __ STA T6 + 0 
70c7 : ad fa 8a LDA $8afa ; (vdc_state + 4)
70ca : 65 48 __ ADC T6 + 1 
70cc : 85 48 __ STA T6 + 1 
70ce : c6 43 __ DEC T0 + 0 
70d0 : d0 88 __ BNE $705a ; (vdcwin_win_new.l1160 + 0)
70d2 : 4c a5 69 JMP $69a5 ; (vdcwin_win_new.s28 + 0)
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
70d5 : a9 ec __ LDA #$ec
70d7 : 85 0f __ STA P2 
70d9 : a9 be __ LDA #$be
70db : 85 10 __ STA P3 
70dd : ad 0c bf LDA $bf0c ; (vp_vpdemo + 11)
70e0 : 85 11 __ STA P4 
70e2 : ad 0d bf LDA $bf0d ; (vp_vpdemo + 12)
70e5 : 85 12 __ STA P5 
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
70e7 : a5 11 __ LDA P4 ; (sx + 0)
70e9 : 85 0d __ STA P0 
70eb : a0 00 __ LDY #$00
70ed : 91 0f __ STA (P2),y ; (win + 0)
70ef : 98 __ __ TYA
70f0 : a0 04 __ LDY #$04
70f2 : 91 0f __ STA (P2),y ; (win + 0)
70f4 : c8 __ __ INY
70f5 : 91 0f __ STA (P2),y ; (win + 0)
70f7 : a5 12 __ LDA P5 ; (sy + 0)
70f9 : a0 01 __ LDY #$01
70fb : 91 0f __ STA (P2),y ; (win + 0)
70fd : 85 0e __ STA P1 
70ff : a5 13 __ LDA P6 ; (wx + 0)
7101 : c8 __ __ INY
7102 : 91 0f __ STA (P2),y ; (win + 0)
7104 : a5 14 __ LDA P7 ; (wy + 0)
7106 : c8 __ __ INY
7107 : 91 0f __ STA (P2),y ; (win + 0)
7109 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
710c : ad fe 8a LDA $8afe ; (vdc_state + 8)
710f : 18 __ __ CLC
7110 : 65 1b __ ADC ACCU + 0 
7112 : aa __ __ TAX
7113 : ad ff 8a LDA $8aff ; (vdc_state + 9)
7116 : 65 1c __ ADC ACCU + 1 
7118 : a0 07 __ LDY #$07
711a : 91 0f __ STA (P2),y ; (win + 0)
711c : 8a __ __ TXA
711d : 88 __ __ DEY
711e : 91 0f __ STA (P2),y ; (win + 0)
7120 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
7123 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
7126 : 18 __ __ CLC
7127 : 65 1b __ ADC ACCU + 0 
7129 : aa __ __ TAX
712a : ad 01 8b LDA $8b01 ; (vdc_state + 11)
712d : 65 1c __ ADC ACCU + 1 
712f : a0 09 __ LDY #$09
7131 : 91 0f __ STA (P2),y ; (win + 0)
7133 : 8a __ __ TXA
7134 : 88 __ __ DEY
7135 : 91 0f __ STA (P2),y ; (win + 0)
.s1001:
7137 : 60 __ __ RTS
--------------------------------------------------------------------
7138 : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 00             : fILE ERROR!.
--------------------------------------------------------------------
7144 : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 00    : eRROR NR.: %2x.
--------------------------------------------------------------------
7153 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 2e 00                : pRESS KEY..
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
715e : 20 e4 ff JSR $ffe4 
7161 : c9 00 __ CMP #$00
7163 : f0 f9 __ BEQ $715e ; (vdcwin_getch.s0 + 0)
7165 : 85 1b __ STA ACCU + 0 
7167 : a9 00 __ LDA #$00
7169 : 85 1c __ STA ACCU + 1 
.s1001:
716b : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_free: ; vdcwin_win_free()->void
.s0:
716c : ad f3 8a LDA $8af3 ; (winCfg + 5)
716f : d0 01 __ BNE $7172 ; (vdcwin_win_free.s3 + 0)
7171 : 60 __ __ RTS
.s3:
7172 : 85 43 __ STA T0 + 0 
7174 : aa __ __ TAX
7175 : bd 37 86 LDA $8637,x ; (__multab13L + 0)
7178 : 85 44 __ STA T1 + 0 
717a : aa __ __ TAX
717b : bd f6 8b LDA $8bf6,x ; (linebuffer + 71)
717e : 85 0d __ STA P0 
7180 : bd f7 8b LDA $8bf7,x ; (linebuffer + 72)
7183 : 85 0e __ STA P1 
7185 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
7188 : a5 1b __ LDA ACCU + 0 
718a : 85 45 __ STA T2 + 0 
718c : a5 1c __ LDA ACCU + 1 
718e : 85 46 __ STA T2 + 1 
7190 : a4 44 __ LDY T1 + 0 
7192 : b9 f9 8b LDA $8bf9,y ; (linebuffer + 74)
7195 : 85 1d __ STA ACCU + 2 
7197 : b9 f3 8b LDA $8bf3,y ; (linebuffer + 68)
719a : 85 48 __ STA T5 + 0 
719c : 8d f4 8a STA $8af4 ; (winCfg + 6)
719f : b9 f4 8b LDA $8bf4,y ; (linebuffer + 69)
71a2 : 85 49 __ STA T5 + 1 
71a4 : 8d f5 8a STA $8af5 ; (winCfg + 7)
71a7 : b9 f5 8b LDA $8bf5,y ; (linebuffer + 70)
71aa : 85 44 __ STA T1 + 0 
71ac : be f8 8b LDX $8bf8,y ; (linebuffer + 73)
71af : 0a __ __ ASL
71b0 : 10 12 __ BPL $71c4 ; (vdcwin_win_free.s51 + 0)
.s8:
71b2 : a5 0d __ LDA P0 
71b4 : f0 0e __ BEQ $71c4 ; (vdcwin_win_free.s51 + 0)
.s5:
71b6 : 18 __ __ CLC
71b7 : a5 1b __ LDA ACCU + 0 
71b9 : 69 ff __ ADC #$ff
71bb : 85 45 __ STA T2 + 0 
71bd : a5 1c __ LDA ACCU + 1 
71bf : 69 ff __ ADC #$ff
71c1 : 85 46 __ STA T2 + 1 
71c3 : e8 __ __ INX
.s51:
71c4 : a5 44 __ LDA T1 + 0 
71c6 : 29 20 __ AND #$20
71c8 : f0 18 __ BEQ $71e2 ; (vdcwin_win_free.s53 + 0)
.s12:
71ca : b9 f8 8b LDA $8bf8,y ; (linebuffer + 73)
71cd : 18 __ __ CLC
71ce : 65 0d __ ADC P0 
71d0 : 85 4a __ STA T11 + 0 
71d2 : a9 00 __ LDA #$00
71d4 : 2a __ __ ROL
71d5 : cd fa 8a CMP $8afa ; (vdc_state + 4)
71d8 : d0 05 __ BNE $71df ; (vdcwin_win_free.s1005 + 0)
.s1004:
71da : a5 4a __ LDA T11 + 0 
71dc : cd f9 8a CMP $8af9 ; (vdc_state + 3)
.s1005:
71df : b0 01 __ BCS $71e2 ; (vdcwin_win_free.s53 + 0)
.s9:
71e1 : e8 __ __ INX
.s53:
71e2 : 24 44 __ BIT T1 + 0 
71e4 : 10 1b __ BPL $7201 ; (vdcwin_win_free.s54 + 0)
.s16:
71e6 : a5 0e __ LDA P1 
71e8 : f0 17 __ BEQ $7201 ; (vdcwin_win_free.s54 + 0)
.s13:
71ea : b9 f9 8b LDA $8bf9,y ; (linebuffer + 74)
71ed : 18 __ __ CLC
71ee : 69 01 __ ADC #$01
71f0 : 85 1d __ STA ACCU + 2 
71f2 : 38 __ __ SEC
71f3 : a5 45 __ LDA T2 + 0 
71f5 : ed f9 8a SBC $8af9 ; (vdc_state + 3)
71f8 : 85 45 __ STA T2 + 0 
71fa : a5 46 __ LDA T2 + 1 
71fc : ed fa 8a SBC $8afa ; (vdc_state + 4)
71ff : 85 46 __ STA T2 + 1 
.s54:
7201 : a5 44 __ LDA T1 + 0 
7203 : 29 10 __ AND #$10
7205 : f0 16 __ BEQ $721d ; (vdcwin_win_free.s19 + 0)
.s20:
7207 : b9 f9 8b LDA $8bf9,y ; (linebuffer + 74)
720a : 18 __ __ CLC
720b : 65 0e __ ADC P1 
720d : a8 __ __ TAY
720e : a9 00 __ LDA #$00
7210 : 2a __ __ ROL
7211 : cd fc 8a CMP $8afc ; (vdc_state + 6)
7214 : d0 03 __ BNE $7219 ; (vdcwin_win_free.s1003 + 0)
.s1002:
7216 : cc fb 8a CPY $8afb ; (vdc_state + 5)
.s1003:
7219 : b0 02 __ BCS $721d ; (vdcwin_win_free.s19 + 0)
.s17:
721b : e6 1d __ INC ACCU + 2 
.s19:
721d : a5 1d __ LDA ACCU + 2 
721f : d0 11 __ BNE $7232 ; (vdcwin_win_free.s25 + 0)
.s24:
7221 : a5 48 __ LDA T5 + 0 
7223 : 8d f4 8a STA $8af4 ; (winCfg + 6)
7226 : a5 49 __ LDA T5 + 1 
7228 : 8d f5 8a STA $8af5 ; (winCfg + 7)
722b : a6 43 __ LDX T0 + 0 
722d : ca __ __ DEX
722e : 8e f3 8a STX $8af3 ; (winCfg + 5)
.s1001:
7231 : 60 __ __ RTS
.s25:
7232 : 86 12 __ STX P5 
7234 : 85 47 __ STA T3 + 0 
.l1006:
7236 : a9 00 __ LDA #$00
7238 : 85 13 __ STA P6 
723a : ad fe 8a LDA $8afe ; (vdc_state + 8)
723d : 18 __ __ CLC
723e : 65 45 __ ADC T2 + 0 
7240 : 85 0d __ STA P0 
7242 : ad ff 8a LDA $8aff ; (vdc_state + 9)
7245 : 65 46 __ ADC T2 + 1 
7247 : 85 0e __ STA P1 
7249 : ad ee 8a LDA $8aee ; (winCfg + 0)
724c : 85 0f __ STA P2 
724e : ad f4 8a LDA $8af4 ; (winCfg + 6)
7251 : 85 4a __ STA T11 + 0 
7253 : 85 10 __ STA P3 
7255 : ad f5 8a LDA $8af5 ; (winCfg + 7)
7258 : 85 4b __ STA T11 + 1 
725a : 85 11 __ STA P4 
725c : 20 53 14 JSR $1453 ; (bnk_cpytovdc.s0 + 0)
725f : a9 00 __ LDA #$00
7261 : 85 13 __ STA P6 
7263 : 18 __ __ CLC
7264 : a5 4a __ LDA T11 + 0 
7266 : 65 12 __ ADC P5 
7268 : 85 4a __ STA T11 + 0 
726a : 85 10 __ STA P3 
726c : 8d f4 8a STA $8af4 ; (winCfg + 6)
726f : a5 4b __ LDA T11 + 1 
7271 : 69 00 __ ADC #$00
7273 : 85 4b __ STA T11 + 1 
7275 : 85 11 __ STA P4 
7277 : 8d f5 8a STA $8af5 ; (winCfg + 7)
727a : ad 00 8b LDA $8b00 ; (vdc_state + 10)
727d : 18 __ __ CLC
727e : 65 45 __ ADC T2 + 0 
7280 : 85 0d __ STA P0 
7282 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
7285 : 65 46 __ ADC T2 + 1 
7287 : 85 0e __ STA P1 
7289 : 20 53 14 JSR $1453 ; (bnk_cpytovdc.s0 + 0)
728c : 18 __ __ CLC
728d : a5 4a __ LDA T11 + 0 
728f : 65 12 __ ADC P5 
7291 : 8d f4 8a STA $8af4 ; (winCfg + 6)
7294 : a5 4b __ LDA T11 + 1 
7296 : 69 00 __ ADC #$00
7298 : 8d f5 8a STA $8af5 ; (winCfg + 7)
729b : ad f9 8a LDA $8af9 ; (vdc_state + 3)
729e : 18 __ __ CLC
729f : 65 45 __ ADC T2 + 0 
72a1 : 85 45 __ STA T2 + 0 
72a3 : ad fa 8a LDA $8afa ; (vdc_state + 4)
72a6 : 65 46 __ ADC T2 + 1 
72a8 : 85 46 __ STA T2 + 1 
72aa : c6 47 __ DEC T3 + 0 
72ac : d0 88 __ BNE $7236 ; (vdcwin_win_free.l1006 + 0)
72ae : 4c 21 72 JMP $7221 ; (vdcwin_win_free.s24 + 0)
--------------------------------------------------------------------
72b1 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 20 32 3a 20 6c 4f 47 4f : - SCREEN 2: lOGO
72c1 : __ __ __ BYT 20 54 45 53 54 20 53 43 52 45 45 4e 00          :  TEST SCREEN.
--------------------------------------------------------------------
72ce : __ __ __ BYT 53 43 52 45 45 4e 32 00                         : SCREEN2.
--------------------------------------------------------------------
72d6 : __ __ __ BYT 4d 55 53 49 43 31 00                            : MUSIC1.
--------------------------------------------------------------------
72dd : __ __ __ BYT 20 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d :  oSCAR64 vdc dEM
72ed : __ __ __ BYT 4f 00                                           : O.
--------------------------------------------------------------------
72ef : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 3a 20 25 53 00    : sCREENMODE: %S.
--------------------------------------------------------------------
seed:
72fe : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
7300 : __ __ __ BYT 2d 20 4d 55 53 49 43 3a 20 75 4c 54 49 4d 41 54 : - MUSIC: uLTIMAT
7310 : __ __ __ BYT 45 20 61 58 45 4c 20 66 20 46 52 4f 4d 20 6e 4f : E aXEL f FROM nO
7320 : __ __ __ BYT 52 44 49 53 43 48 53 4f 55 4e 44 00             : RDISCHSOUND.
--------------------------------------------------------------------
menu_placebar: ; menu_placebar(u8)->void
.s0:
732c : a9 00 __ LDA #$00
732e : 85 0d __ STA P0 
7330 : a5 0f __ LDA P2 ; (y + 0)
7332 : 8d a8 86 STA $86a8 ; (menubar + 50)
7335 : 85 0e __ STA P1 
7337 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
733a : a9 12 __ LDA #$12
733c : 8d 00 d6 STA $d600 
733f : 18 __ __ CLC
7340 : a5 1b __ LDA ACCU + 0 
7342 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
7345 : aa __ __ TAX
7346 : a5 1c __ LDA ACCU + 1 
7348 : 6d ff 8a ADC $8aff ; (vdc_state + 9)
734b : a8 __ __ TAY
734c : a9 01 __ LDA #$01
734e : 85 48 __ STA T4 + 0 
.l669:
7350 : 2c 00 d6 BIT $d600 
7353 : 10 fb __ BPL $7350 ; (menu_placebar.l669 + 0)
.s8:
7355 : 8c 01 d6 STY $d601 
7358 : a9 13 __ LDA #$13
735a : 8d 00 d6 STA $d600 
.l671:
735d : 2c 00 d6 BIT $d600 
7360 : 10 fb __ BPL $735d ; (menu_placebar.l671 + 0)
.s13:
7362 : 8e 01 d6 STX $d601 
7365 : a9 1f __ LDA #$1f
7367 : 8d 00 d6 STA $d600 
.l673:
736a : 2c 00 d6 BIT $d600 
736d : 10 fb __ BPL $736a ; (menu_placebar.l673 + 0)
.s17:
736f : a9 20 __ LDA #$20
7371 : 8d 01 d6 STA $d601 
7374 : a9 18 __ LDA #$18
7376 : 8d 00 d6 STA $d600 
.l675:
7379 : 2c 00 d6 BIT $d600 
737c : 10 fb __ BPL $7379 ; (menu_placebar.l675 + 0)
.s23:
737e : ad 01 d6 LDA $d601 
7381 : 29 7f __ AND #$7f
7383 : a2 18 __ LDX #$18
7385 : 8e 00 d6 STX $d600 
.l677:
7388 : 2c 00 d6 BIT $d600 
738b : 10 fb __ BPL $7388 ; (menu_placebar.l677 + 0)
.s29:
738d : 8d 01 d6 STA $d601 
7390 : a9 1e __ LDA #$1e
7392 : 8d 00 d6 STA $d600 
.l679:
7395 : 2c 00 d6 BIT $d600 
7398 : 10 fb __ BPL $7395 ; (menu_placebar.l679 + 0)
.s34:
739a : a9 4f __ LDA #$4f
739c : 8d 01 d6 STA $d601 
739f : ad 00 8b LDA $8b00 ; (vdc_state + 10)
73a2 : 18 __ __ CLC
73a3 : 65 1b __ ADC ACCU + 0 
73a5 : a2 12 __ LDX #$12
73a7 : 8e 00 d6 STX $d600 
73aa : aa __ __ TAX
73ab : ad 01 8b LDA $8b01 ; (vdc_state + 11)
73ae : 65 1c __ ADC ACCU + 1 
.l681:
73b0 : 2c 00 d6 BIT $d600 
73b3 : 10 fb __ BPL $73b0 ; (menu_placebar.l681 + 0)
.s41:
73b5 : 8d 01 d6 STA $d601 
73b8 : a9 13 __ LDA #$13
73ba : 8d 00 d6 STA $d600 
.l683:
73bd : 2c 00 d6 BIT $d600 
73c0 : 10 fb __ BPL $73bd ; (menu_placebar.l683 + 0)
.s46:
73c2 : 8e 01 d6 STX $d601 
73c5 : a9 1f __ LDA #$1f
73c7 : 8d 00 d6 STA $d600 
.l685:
73ca : 2c 00 d6 BIT $d600 
73cd : 10 fb __ BPL $73ca ; (menu_placebar.l685 + 0)
.s50:
73cf : a9 c4 __ LDA #$c4
73d1 : 8d 01 d6 STA $d601 
73d4 : a9 18 __ LDA #$18
73d6 : 8d 00 d6 STA $d600 
.l687:
73d9 : 2c 00 d6 BIT $d600 
73dc : 10 fb __ BPL $73d9 ; (menu_placebar.l687 + 0)
.s56:
73de : ad 01 d6 LDA $d601 
73e1 : 29 7f __ AND #$7f
73e3 : a2 18 __ LDX #$18
73e5 : 8e 00 d6 STX $d600 
.l689:
73e8 : 2c 00 d6 BIT $d600 
73eb : 10 fb __ BPL $73e8 ; (menu_placebar.l689 + 0)
.s62:
73ed : 8d 01 d6 STA $d601 
73f0 : a9 1e __ LDA #$1e
73f2 : 8d 00 d6 STA $d600 
.l691:
73f5 : 2c 00 d6 BIT $d600 
73f8 : 10 fb __ BPL $73f5 ; (menu_placebar.l691 + 0)
.s67:
73fa : a9 00 __ LDA #$00
73fc : 85 43 __ STA T0 + 0 
73fe : 85 44 __ STA T1 + 0 
7400 : a9 4f __ LDA #$4f
7402 : 8d 01 d6 STA $d601 
7405 : 18 __ __ CLC
.l69:
7406 : a9 76 __ LDA #$76
7408 : 65 44 __ ADC T1 + 0 
740a : 85 45 __ STA T2 + 0 
740c : 85 0d __ STA P0 
740e : a9 86 __ LDA #$86
7410 : 69 00 __ ADC #$00
7412 : 85 46 __ STA T2 + 1 
7414 : 85 0e __ STA P1 
7416 : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
7419 : a5 0f __ LDA P2 ; (y + 0)
741b : 85 0e __ STA P1 
741d : a5 1b __ LDA ACCU + 0 
741f : 85 47 __ STA T3 + 0 
7421 : 18 __ __ CLC
7422 : 65 48 __ ADC T4 + 0 
7424 : 85 4c __ STA T7 + 0 
7426 : a9 00 __ LDA #$00
7428 : 2a __ __ ROL
7429 : 85 4d __ STA T7 + 1 
742b : ad f9 8a LDA $8af9 ; (vdc_state + 3)
742e : 38 __ __ SEC
742f : e9 01 __ SBC #$01
7431 : aa __ __ TAX
7432 : ad fa 8a LDA $8afa ; (vdc_state + 4)
7435 : e9 00 __ SBC #$00
7437 : c5 4d __ CMP T7 + 1 
7439 : d0 02 __ BNE $743d ; (menu_placebar.s1025 + 0)
.s1024:
743b : e4 4c __ CPX T7 + 0 
.s1025:
743d : b0 06 __ BCS $7445 ; (menu_placebar.s74 + 0)
.s72:
743f : 8a __ __ TXA
7440 : 38 __ __ SEC
7441 : e5 1b __ SBC ACCU + 0 
7443 : 85 48 __ STA T4 + 0 
.s74:
7445 : a5 48 __ LDA T4 + 0 
7447 : 85 0d __ STA P0 
7449 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
744c : a5 1b __ LDA ACCU + 0 
744e : 85 4a __ STA T6 + 0 
7450 : a5 1c __ LDA ACCU + 1 
7452 : 85 4b __ STA T6 + 1 
7454 : a5 45 __ LDA T2 + 0 
7456 : 85 0d __ STA P0 
7458 : a5 46 __ LDA T2 + 1 
745a : 85 0e __ STA P1 
745c : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
745f : a5 1b __ LDA ACCU + 0 
7461 : 85 4c __ STA T7 + 0 
7463 : ad fe 8a LDA $8afe ; (vdc_state + 8)
7466 : 18 __ __ CLC
7467 : 65 4a __ ADC T6 + 0 
7469 : a2 12 __ LDX #$12
746b : 8e 00 d6 STX $d600 
746e : aa __ __ TAX
746f : ad ff 8a LDA $8aff ; (vdc_state + 9)
7472 : 65 4b __ ADC T6 + 1 
.l694:
7474 : 2c 00 d6 BIT $d600 
7477 : 10 fb __ BPL $7474 ; (menu_placebar.l694 + 0)
.s81:
7479 : 8d 01 d6 STA $d601 
747c : a9 13 __ LDA #$13
747e : 8d 00 d6 STA $d600 
.l696:
7481 : 2c 00 d6 BIT $d600 
7484 : 10 fb __ BPL $7481 ; (menu_placebar.l696 + 0)
.s86:
7486 : 8e 01 d6 STX $d601 
7489 : a9 1f __ LDA #$1f
748b : 8d 00 d6 STA $d600 
748e : a5 1b __ LDA ACCU + 0 
7490 : f0 18 __ BEQ $74aa ; (menu_placebar.s91 + 0)
.s135:
7492 : a0 00 __ LDY #$00
.l89:
7494 : 84 49 __ STY T5 + 0 
7496 : b1 45 __ LDA (T2 + 0),y 
7498 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l699:
749b : 2c 00 d6 BIT $d600 
749e : 10 fb __ BPL $749b ; (menu_placebar.l699 + 0)
.s94:
74a0 : 8d 01 d6 STA $d601 
74a3 : a4 49 __ LDY T5 + 0 
74a5 : c8 __ __ INY
74a6 : c4 4c __ CPY T7 + 0 
74a8 : 90 ea __ BCC $7494 ; (menu_placebar.l89 + 0)
.s91:
74aa : a9 12 __ LDA #$12
74ac : 8d 00 d6 STA $d600 
74af : c6 4c __ DEC T7 + 0 
74b1 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
74b4 : 18 __ __ CLC
74b5 : 65 4a __ ADC T6 + 0 
74b7 : aa __ __ TAX
74b8 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
74bb : 65 4b __ ADC T6 + 1 
.l702:
74bd : 2c 00 d6 BIT $d600 
74c0 : 10 fb __ BPL $74bd ; (menu_placebar.l702 + 0)
.s101:
74c2 : 8d 01 d6 STA $d601 
74c5 : a9 13 __ LDA #$13
74c7 : 8d 00 d6 STA $d600 
.l704:
74ca : 2c 00 d6 BIT $d600 
74cd : 10 fb __ BPL $74ca ; (menu_placebar.l704 + 0)
.s106:
74cf : 8e 01 d6 STX $d601 
74d2 : a9 1f __ LDA #$1f
74d4 : 8d 00 d6 STA $d600 
.l706:
74d7 : 2c 00 d6 BIT $d600 
74da : 10 fb __ BPL $74d7 ; (menu_placebar.l706 + 0)
.s110:
74dc : a9 c4 __ LDA #$c4
74de : 8d 01 d6 STA $d601 
74e1 : a9 18 __ LDA #$18
74e3 : 8d 00 d6 STA $d600 
.l708:
74e6 : 2c 00 d6 BIT $d600 
74e9 : 10 fb __ BPL $74e6 ; (menu_placebar.l708 + 0)
.s116:
74eb : ad 01 d6 LDA $d601 
74ee : 29 7f __ AND #$7f
74f0 : a2 18 __ LDX #$18
74f2 : 8e 00 d6 STX $d600 
.l710:
74f5 : 2c 00 d6 BIT $d600 
74f8 : 10 fb __ BPL $74f5 ; (menu_placebar.l710 + 0)
.s122:
74fa : 8d 01 d6 STA $d601 
74fd : a9 1e __ LDA #$1e
74ff : 8d 00 d6 STA $d600 
.l712:
7502 : 2c 00 d6 BIT $d600 
7505 : 10 fb __ BPL $7502 ; (menu_placebar.l712 + 0)
.s127:
7507 : a5 4c __ LDA T7 + 0 
7509 : 8d 01 d6 STA $d601 
750c : a5 48 __ LDA T4 + 0 
750e : a6 43 __ LDX T0 + 0 
7510 : e8 __ __ INX
7511 : 86 43 __ STX T0 + 0 
7513 : 9d a2 86 STA $86a2,x ; (menubar + 44)
7516 : a5 47 __ LDA T3 + 0 
7518 : 38 __ __ SEC
7519 : 65 48 __ ADC T4 + 0 
751b : 85 48 __ STA T4 + 0 
751d : 18 __ __ CLC
751e : a5 44 __ LDA T1 + 0 
7520 : 69 09 __ ADC #$09
7522 : 85 44 __ STA T1 + 0 
7524 : e0 05 __ CPX #$05
7526 : b0 03 __ BCS $752b ; (menu_placebar.s1001 + 0)
7528 : 4c 06 74 JMP $7406 ; (menu_placebar.l69 + 0)
.s1001:
752b : 60 __ __ RTS
--------------------------------------------------------------------
752c : __ __ __ BYT 73 45 4c 45 43 54 20 44 45 53 49 52 45 44 20 44 : sELECT DESIRED D
753c : __ __ __ BYT 45 4d 4f 20 55 53 49 4e 47 20 43 55 52 53 4f 52 : EMO USING CURSOR
754c : __ __ __ BYT 20 4b 45 59 53 20 41 4e 44 20 72 65 74 75 72 6e :  KEYS AND return
755c : __ __ __ BYT 20 49 4e 20 4d 45 4e 55 2e 00                   :  IN MENU..
--------------------------------------------------------------------
7566 : __ __ __ BYT 69 4e 20 53 43 52 4f 4c 4c 49 4e 47 20 44 45 4d : iN SCROLLING DEM
7576 : __ __ __ BYT 4f 53 2c 20 50 52 45 53 53 20 77 61 73 64 20 4f : OS, PRESS wasd O
7586 : __ __ __ BYT 52 20 43 55 52 53 4f 52 20 4b 45 59 53 20 54 4f : R CURSOR KEYS TO
7596 : __ __ __ BYT 20 4d 4f 56 45 2c 20 65 73 63 20 54 4f 20 45 58 :  MOVE, esc TO EX
75a6 : __ __ __ BYT 49 54 2e 00                                     : IT..
--------------------------------------------------------------------
75aa : __ __ __ BYT 69 4e 20 4f 54 48 45 52 20 44 45 4d 4f 53 2c 20 : iN OTHER DEMOS, 
75ba : __ __ __ BYT 50 52 45 53 53 20 41 20 4b 45 54 59 20 54 4f 20 : PRESS A KETY TO 
75ca : __ __ __ BYT 43 4f 4e 54 49 4e 55 45 20 54 4f 20 4e 45 58 54 : CONTINUE TO NEXT
75da : __ __ __ BYT 20 53 54 45 50 2e 00                            :  STEP..
--------------------------------------------------------------------
vdcwin_cpy_viewport: ; vdcwin_cpy_viewport(struct VDCViewport*)->void
.s0:
75e1 : a5 14 __ LDA P7 ; (viewport + 0)
75e3 : 85 43 __ STA T0 + 0 
75e5 : a5 15 __ LDA P8 ; (viewport + 1)
75e7 : 85 44 __ STA T0 + 1 
75e9 : a0 09 __ LDY #$09
75eb : b1 14 __ LDA (P7),y ; (viewport + 0)
75ed : 85 1b __ STA ACCU + 0 
75ef : c8 __ __ INY
75f0 : b1 14 __ LDA (P7),y ; (viewport + 0)
75f2 : 85 1c __ STA ACCU + 1 
75f4 : a0 03 __ LDY #$03
75f6 : b1 14 __ LDA (P7),y ; (viewport + 0)
75f8 : 85 03 __ STA WORK + 0 
75fa : c8 __ __ INY
75fb : b1 14 __ LDA (P7),y ; (viewport + 0)
75fd : 85 04 __ STA WORK + 1 
75ff : 20 d4 84 JSR $84d4 ; (mul16 + 0)
7602 : a0 01 __ LDY #$01
7604 : b1 14 __ LDA (P7),y ; (viewport + 0)
7606 : 18 __ __ CLC
7607 : 65 05 __ ADC WORK + 2 
7609 : aa __ __ TAX
760a : c8 __ __ INY
760b : b1 14 __ LDA (P7),y ; (viewport + 0)
760d : 65 06 __ ADC WORK + 3 
760f : 85 46 __ STA T1 + 1 
7611 : 8a __ __ TXA
7612 : 18 __ __ CLC
7613 : a0 07 __ LDY #$07
7615 : 71 14 __ ADC (P7),y ; (viewport + 0)
7617 : 85 45 __ STA T1 + 0 
7619 : a5 46 __ LDA T1 + 1 
761b : c8 __ __ INY
761c : 71 14 __ ADC (P7),y ; (viewport + 0)
761e : 85 46 __ STA T1 + 1 
7620 : a9 00 __ LDA #$00
7622 : 85 49 __ STA T3 + 0 
7624 : a0 11 __ LDY #$11
7626 : b1 14 __ LDA (P7),y ; (viewport + 0)
7628 : aa __ __ TAX
7629 : c8 __ __ INY
762a : b1 14 __ LDA (P7),y ; (viewport + 0)
762c : 4c 68 76 JMP $7668 ; (vdcwin_cpy_viewport.l1 + 0)
.s2:
762f : 86 0d __ STX P0 
7631 : a5 45 __ LDA T1 + 0 
7633 : 85 10 __ STA P3 
7635 : a5 46 __ LDA T1 + 1 
7637 : 85 11 __ STA P4 
7639 : a0 00 __ LDY #$00
763b : 84 13 __ STY P6 
763d : b1 43 __ LDA (T0 + 0),y 
763f : 85 0f __ STA P2 
7641 : a0 0d __ LDY #$0d
7643 : b1 43 __ LDA (T0 + 0),y 
7645 : 85 12 __ STA P5 
7647 : 20 53 14 JSR $1453 ; (bnk_cpytovdc.s0 + 0)
764a : a5 45 __ LDA T1 + 0 
764c : 18 __ __ CLC
764d : a0 03 __ LDY #$03
764f : 71 43 __ ADC (T0 + 0),y 
7651 : 85 45 __ STA T1 + 0 
7653 : a5 46 __ LDA T1 + 1 
7655 : c8 __ __ INY
7656 : 71 43 __ ADC (T0 + 0),y 
7658 : 85 46 __ STA T1 + 1 
765a : ad f9 8a LDA $8af9 ; (vdc_state + 3)
765d : 18 __ __ CLC
765e : 65 0d __ ADC P0 
7660 : aa __ __ TAX
7661 : ad fa 8a LDA $8afa ; (vdc_state + 4)
7664 : 65 0e __ ADC P1 
7666 : e6 49 __ INC T3 + 0 
.l1:
7668 : 85 0e __ STA P1 
766a : a5 49 __ LDA T3 + 0 
766c : a0 0e __ LDY #$0e
766e : d1 43 __ CMP (T0 + 0),y 
7670 : 90 bd __ BCC $762f ; (vdcwin_cpy_viewport.s2 + 0)
.s4:
7672 : a0 03 __ LDY #$03
7674 : b1 43 __ LDA (T0 + 0),y 
7676 : 85 45 __ STA T1 + 0 
7678 : 85 03 __ STA WORK + 0 
767a : c8 __ __ INY
767b : b1 43 __ LDA (T0 + 0),y 
767d : 85 46 __ STA T1 + 1 
767f : 85 04 __ STA WORK + 1 
7681 : a0 09 __ LDY #$09
7683 : b1 43 __ LDA (T0 + 0),y 
7685 : 85 1b __ STA ACCU + 0 
7687 : c8 __ __ INY
7688 : b1 43 __ LDA (T0 + 0),y 
768a : 85 1c __ STA ACCU + 1 
768c : 20 d4 84 JSR $84d4 ; (mul16 + 0)
768f : a0 01 __ LDY #$01
7691 : b1 43 __ LDA (T0 + 0),y 
7693 : 18 __ __ CLC
7694 : 65 05 __ ADC WORK + 2 
7696 : aa __ __ TAX
7697 : c8 __ __ INY
7698 : b1 43 __ LDA (T0 + 0),y 
769a : 65 06 __ ADC WORK + 3 
769c : 85 48 __ STA T2 + 1 
769e : 8a __ __ TXA
769f : 18 __ __ CLC
76a0 : a0 07 __ LDY #$07
76a2 : 71 43 __ ADC (T0 + 0),y 
76a4 : 85 47 __ STA T2 + 0 
76a6 : a5 48 __ LDA T2 + 1 
76a8 : c8 __ __ INY
76a9 : 71 43 __ ADC (T0 + 0),y 
76ab : 85 48 __ STA T2 + 1 
76ad : a0 05 __ LDY #$05
76af : b1 43 __ LDA (T0 + 0),y 
76b1 : 85 1b __ STA ACCU + 0 
76b3 : c8 __ __ INY
76b4 : b1 43 __ LDA (T0 + 0),y 
76b6 : 85 1c __ STA ACCU + 1 
76b8 : a5 45 __ LDA T1 + 0 
76ba : 85 03 __ STA WORK + 0 
76bc : a5 46 __ LDA T1 + 1 
76be : 85 04 __ STA WORK + 1 
76c0 : 20 d4 84 JSR $84d4 ; (mul16 + 0)
76c3 : 18 __ __ CLC
76c4 : a5 47 __ LDA T2 + 0 
76c6 : 65 05 __ ADC WORK + 2 
76c8 : aa __ __ TAX
76c9 : a5 48 __ LDA T2 + 1 
76cb : 65 06 __ ADC WORK + 3 
76cd : a8 __ __ TAY
76ce : 8a __ __ TXA
76cf : 18 __ __ CLC
76d0 : 69 30 __ ADC #$30
76d2 : 85 45 __ STA T1 + 0 
76d4 : 90 01 __ BCC $76d7 ; (vdcwin_cpy_viewport.s1007 + 0)
.s1006:
76d6 : c8 __ __ INY
.s1007:
76d7 : 84 46 __ STY T1 + 1 
76d9 : a9 00 __ LDA #$00
76db : 85 49 __ STA T3 + 0 
76dd : a0 13 __ LDY #$13
76df : b1 43 __ LDA (T0 + 0),y 
76e1 : aa __ __ TAX
76e2 : c8 __ __ INY
76e3 : b1 43 __ LDA (T0 + 0),y 
76e5 : 4c 21 77 JMP $7721 ; (vdcwin_cpy_viewport.l5 + 0)
.s6:
76e8 : 86 0d __ STX P0 
76ea : a5 45 __ LDA T1 + 0 
76ec : 85 10 __ STA P3 
76ee : a5 46 __ LDA T1 + 1 
76f0 : 85 11 __ STA P4 
76f2 : a0 00 __ LDY #$00
76f4 : 84 13 __ STY P6 
76f6 : b1 14 __ LDA (P7),y ; (viewport + 0)
76f8 : 85 0f __ STA P2 
76fa : a0 0d __ LDY #$0d
76fc : b1 14 __ LDA (P7),y ; (viewport + 0)
76fe : 85 12 __ STA P5 
7700 : 20 53 14 JSR $1453 ; (bnk_cpytovdc.s0 + 0)
7703 : a5 45 __ LDA T1 + 0 
7705 : 18 __ __ CLC
7706 : a0 03 __ LDY #$03
7708 : 71 14 __ ADC (P7),y ; (viewport + 0)
770a : 85 45 __ STA T1 + 0 
770c : a5 46 __ LDA T1 + 1 
770e : c8 __ __ INY
770f : 71 14 __ ADC (P7),y ; (viewport + 0)
7711 : 85 46 __ STA T1 + 1 
7713 : ad f9 8a LDA $8af9 ; (vdc_state + 3)
7716 : 18 __ __ CLC
7717 : 65 0d __ ADC P0 
7719 : aa __ __ TAX
771a : ad fa 8a LDA $8afa ; (vdc_state + 4)
771d : 65 0e __ ADC P1 
771f : e6 49 __ INC T3 + 0 
.l5:
7721 : 85 0e __ STA P1 
7723 : a5 49 __ LDA T3 + 0 
7725 : a0 0e __ LDY #$0e
7727 : d1 14 __ CMP (P7),y ; (viewport + 0)
7729 : 90 bd __ BCC $76e8 ; (vdcwin_cpy_viewport.s6 + 0)
.s1001:
772b : 60 __ __ RTS
--------------------------------------------------------------------
menu_pulldown: ; menu_pulldown(u8,u8,u8,u8)->u8
.s1000:
772c : a2 0c __ LDX #$0c
772e : b5 53 __ LDA T0 + 0,x 
7730 : 9d cc bf STA $bfcc,x ; (nouns + 67)
7733 : ca __ __ DEX
7734 : 10 f8 __ BPL $772e ; (menu_pulldown.s1000 + 2)
7736 : 38 __ __ SEC
7737 : a5 23 __ LDA SP + 0 
7739 : e9 0a __ SBC #$0a
773b : 85 23 __ STA SP + 0 
773d : b0 02 __ BCS $7741 ; (menu_pulldown.s0 + 0)
773f : c6 24 __ DEC SP + 1 
.s0:
7741 : a9 d8 __ LDA #$d8
7743 : ae ff bf LDX $bfff ; (sstack + 7)
7746 : 86 53 __ STX T0 + 0 
7748 : 18 __ __ CLC
7749 : 7d 3b 86 ADC $863b,x ; (__multab102L + 0)
774c : 85 55 __ STA T2 + 0 
774e : 85 0d __ STA P0 
7750 : a9 87 __ LDA #$87
7752 : 7d 42 86 ADC $8642,x ; (__multab102H + 0)
7755 : 85 56 __ STA T2 + 1 
7757 : 85 0e __ STA P1 
7759 : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
775c : a6 53 __ LDX T0 + 0 
775e : bd a9 86 LDA $86a9,x ; (pulldown_options + 0)
7761 : 85 58 __ STA T4 + 0 
7763 : 8d f8 bf STA $bff8 ; (sstack + 0)
7766 : e0 05 __ CPX #$05
7768 : 90 08 __ BCC $7772 ; (menu_pulldown.s541 + 0)
.s540:
776a : a9 00 __ LDA #$00
776c : 85 54 __ STA T1 + 0 
776e : a9 f0 __ LDA #$f0
7770 : b0 06 __ BCS $7778 ; (menu_pulldown.s545 + 0)
.s541:
7772 : a9 01 __ LDA #$01
7774 : 85 54 __ STA T1 + 0 
7776 : a9 70 __ LDA #$70
.s545:
7778 : 85 15 __ STA P8 
777a : ad fd bf LDA $bffd ; (sstack + 5)
777d : 85 16 __ STA P9 
777f : ad fe bf LDA $bffe ; (sstack + 6)
7782 : 85 17 __ STA P10 
7784 : 18 __ __ CLC
7785 : a5 1b __ LDA ACCU + 0 
7787 : 69 02 __ ADC #$02
7789 : 85 18 __ STA P11 
778b : 20 70 68 JSR $6870 ; (vdcwin_win_new.s1000 + 0)
778e : a9 01 __ LDA #$01
7790 : 85 53 __ STA T0 + 0 
7792 : a5 58 __ LDA T4 + 0 
7794 : f0 03 __ BEQ $7799 ; (menu_pulldown.l58 + 0)
7796 : 4c 75 7a JMP $7a75 ; (menu_pulldown.s247 + 0)
.l58:
7799 : a9 2d __ LDA #$2d
779b : a0 06 __ LDY #$06
779d : 91 23 __ STA (SP + 0),y 
779f : a9 00 __ LDA #$00
77a1 : 85 1c __ STA ACCU + 1 
77a3 : c8 __ __ INY
77a4 : 91 23 __ STA (SP + 0),y 
77a6 : a9 af __ LDA #$af
77a8 : a0 02 __ LDY #$02
77aa : 91 23 __ STA (SP + 0),y 
77ac : a9 8b __ LDA #$8b
77ae : c8 __ __ INY
77af : 91 23 __ STA (SP + 0),y 
77b1 : a9 8a __ LDA #$8a
77b3 : c8 __ __ INY
77b4 : 91 23 __ STA (SP + 0),y 
77b6 : a9 7b __ LDA #$7b
77b8 : c8 __ __ INY
77b9 : 91 23 __ STA (SP + 0),y 
77bb : a5 53 __ LDA T0 + 0 
77bd : 85 1b __ STA ACCU + 0 
77bf : a9 11 __ LDA #$11
77c1 : 20 b4 84 JSR $84b4 ; (mul16by8 + 0)
77c4 : 38 __ __ SEC
77c5 : a5 05 __ LDA WORK + 2 
77c7 : e9 11 __ SBC #$11
77c9 : aa __ __ TAX
77ca : a5 06 __ LDA WORK + 3 
77cc : e9 00 __ SBC #$00
77ce : 85 5d __ STA T7 + 1 
77d0 : 8a __ __ TXA
77d1 : 18 __ __ CLC
77d2 : 65 55 __ ADC T2 + 0 
77d4 : a0 08 __ LDY #$08
77d6 : 91 23 __ STA (SP + 0),y 
77d8 : a5 5d __ LDA T7 + 1 
77da : 65 56 __ ADC T2 + 1 
77dc : c8 __ __ INY
77dd : 91 23 __ STA (SP + 0),y 
77df : 20 ff 64 JSR $64ff ; (sprintf.s0 + 0)
77e2 : ad fd bf LDA $bffd ; (sstack + 5)
77e5 : 85 0d __ STA P0 
77e7 : ad fe bf LDA $bffe ; (sstack + 6)
77ea : 85 5c __ STA T7 + 0 
77ec : 18 __ __ CLC
77ed : 65 53 __ ADC T0 + 0 
77ef : 38 __ __ SEC
77f0 : e9 01 __ SBC #$01
77f2 : 85 0e __ STA P1 
77f4 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
77f7 : a5 1b __ LDA ACCU + 0 
77f9 : 85 5a __ STA T6 + 0 
77fb : a5 1c __ LDA ACCU + 1 
77fd : 85 5b __ STA T6 + 1 
77ff : 20 9a 64 JSR $649a ; (strlen@proxy + 0)
7802 : a5 1b __ LDA ACCU + 0 
7804 : 85 57 __ STA T3 + 0 
7806 : ad fe 8a LDA $8afe ; (vdc_state + 8)
7809 : 18 __ __ CLC
780a : 65 5a __ ADC T6 + 0 
780c : a2 12 __ LDX #$12
780e : 8e 00 d6 STX $d600 
7811 : aa __ __ TAX
7812 : ad ff 8a LDA $8aff ; (vdc_state + 9)
7815 : 65 5b __ ADC T6 + 1 
.l1025:
7817 : 2c 00 d6 BIT $d600 
781a : 10 fb __ BPL $7817 ; (menu_pulldown.l1025 + 0)
.s66:
781c : 8d 01 d6 STA $d601 
781f : a9 13 __ LDA #$13
7821 : 8d 00 d6 STA $d600 
.l1027:
7824 : 2c 00 d6 BIT $d600 
7827 : 10 fb __ BPL $7824 ; (menu_pulldown.l1027 + 0)
.s71:
7829 : 8e 01 d6 STX $d601 
782c : a9 1f __ LDA #$1f
782e : 8d 00 d6 STA $d600 
7831 : a5 1b __ LDA ACCU + 0 
7833 : f0 19 __ BEQ $784e ; (menu_pulldown.s76 + 0)
.s233:
7835 : a2 00 __ LDX #$00
.l74:
7837 : 86 59 __ STX T5 + 0 
7839 : bd af 8b LDA $8baf,x ; (linebuffer + 0)
783c : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l1030:
783f : 2c 00 d6 BIT $d600 
7842 : 10 fb __ BPL $783f ; (menu_pulldown.l1030 + 0)
.s79:
7844 : 8d 01 d6 STA $d601 
7847 : a6 59 __ LDX T5 + 0 
7849 : e8 __ __ INX
784a : e4 57 __ CPX T3 + 0 
784c : 90 e9 __ BCC $7837 ; (menu_pulldown.l74 + 0)
.s76:
784e : a9 12 __ LDA #$12
7850 : 8d 00 d6 STA $d600 
7853 : c6 57 __ DEC T3 + 0 
7855 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
7858 : 18 __ __ CLC
7859 : 65 5a __ ADC T6 + 0 
785b : aa __ __ TAX
785c : ad 01 8b LDA $8b01 ; (vdc_state + 11)
785f : 65 5b __ ADC T6 + 1 
.l1033:
7861 : 2c 00 d6 BIT $d600 
7864 : 10 fb __ BPL $7861 ; (menu_pulldown.l1033 + 0)
.s86:
7866 : 8d 01 d6 STA $d601 
7869 : a9 13 __ LDA #$13
786b : 8d 00 d6 STA $d600 
.l1035:
786e : 2c 00 d6 BIT $d600 
7871 : 10 fb __ BPL $786e ; (menu_pulldown.l1035 + 0)
.s91:
7873 : 8e 01 d6 STX $d601 
7876 : a9 1f __ LDA #$1f
7878 : 8d 00 d6 STA $d600 
.l1037:
787b : 2c 00 d6 BIT $d600 
787e : 10 fb __ BPL $787b ; (menu_pulldown.l1037 + 0)
.s95:
7880 : a9 cd __ LDA #$cd
7882 : 8d 01 d6 STA $d601 
7885 : a9 18 __ LDA #$18
7887 : 8d 00 d6 STA $d600 
.l1039:
788a : 2c 00 d6 BIT $d600 
788d : 10 fb __ BPL $788a ; (menu_pulldown.l1039 + 0)
.s101:
788f : ad 01 d6 LDA $d601 
7892 : 29 7f __ AND #$7f
7894 : a2 18 __ LDX #$18
7896 : 8e 00 d6 STX $d600 
.l1041:
7899 : 2c 00 d6 BIT $d600 
789c : 10 fb __ BPL $7899 ; (menu_pulldown.l1041 + 0)
.s107:
789e : 8d 01 d6 STA $d601 
78a1 : a9 1e __ LDA #$1e
78a3 : 8d 00 d6 STA $d600 
.l1043:
78a6 : 2c 00 d6 BIT $d600 
78a9 : 10 fb __ BPL $78a6 ; (menu_pulldown.l1043 + 0)
.s112:
78ab : a5 57 __ LDA T3 + 0 
78ad : 8d 01 d6 STA $d601 
.l113:
78b0 : 20 5e 71 JSR $715e ; (vdcwin_getch.s0 + 0)
78b3 : a5 1b __ LDA ACCU + 0 
78b5 : 85 57 __ STA T3 + 0 
78b7 : c9 0d __ CMP #$0d
78b9 : f0 18 __ BEQ $78d3 ; (menu_pulldown.s114 + 0)
.s120:
78bb : c9 9d __ CMP #$9d
78bd : f0 14 __ BEQ $78d3 ; (menu_pulldown.s114 + 0)
.s119:
78bf : c9 1d __ CMP #$1d
78c1 : f0 10 __ BEQ $78d3 ; (menu_pulldown.s114 + 0)
.s118:
78c3 : c9 91 __ CMP #$91
78c5 : f0 0c __ BEQ $78d3 ; (menu_pulldown.s114 + 0)
.s117:
78c7 : c9 11 __ CMP #$11
78c9 : f0 08 __ BEQ $78d3 ; (menu_pulldown.s114 + 0)
.s116:
78cb : c9 1b __ CMP #$1b
78cd : f0 04 __ BEQ $78d3 ; (menu_pulldown.s114 + 0)
.s115:
78cf : c9 03 __ CMP #$03
78d1 : d0 dd __ BNE $78b0 ; (menu_pulldown.l113 + 0)
.s114:
78d3 : a5 1b __ LDA ACCU + 0 
78d5 : c9 1b __ CMP #$1b
78d7 : d0 03 __ BNE $78dc ; (menu_pulldown.s201 + 0)
78d9 : 4c 66 7a JMP $7a66 ; (menu_pulldown.s122 + 0)
.s201:
78dc : b0 03 __ BCS $78e1 ; (menu_pulldown.s202 + 0)
78de : 4c 56 7a JMP $7a56 ; (menu_pulldown.s203 + 0)
.s202:
78e1 : c9 91 __ CMP #$91
78e3 : f0 43 __ BEQ $7928 ; (menu_pulldown.s135 + 0)
.s209:
78e5 : b0 2f __ BCS $7916 ; (menu_pulldown.s210 + 0)
.s211:
78e7 : c9 1d __ CMP #$1d
78e9 : f0 03 __ BEQ $78ee ; (menu_pulldown.s131 + 0)
78eb : 4c 99 77 JMP $7799 ; (menu_pulldown.l58 + 0)
.s131:
78ee : a5 54 __ LDA T1 + 0 
78f0 : d0 03 __ BNE $78f5 ; (menu_pulldown.s132 + 0)
78f2 : 4c 99 77 JMP $7799 ; (menu_pulldown.l58 + 0)
.s132:
78f5 : a9 13 __ LDA #$13
.s1107:
78f7 : 85 53 __ STA T0 + 0 
.s59:
78f9 : 20 6c 71 JSR $716c ; (vdcwin_win_free.s0 + 0)
78fc : a5 53 __ LDA T0 + 0 
78fe : 85 1b __ STA ACCU + 0 
.s1001:
7900 : 18 __ __ CLC
7901 : a5 23 __ LDA SP + 0 
7903 : 69 0a __ ADC #$0a
7905 : 85 23 __ STA SP + 0 
7907 : 90 02 __ BCC $790b ; (menu_pulldown.s1001 + 11)
7909 : e6 24 __ INC SP + 1 
790b : a2 0c __ LDX #$0c
790d : bd cc bf LDA $bfcc,x ; (nouns + 67)
7910 : 95 53 __ STA T0 + 0,x 
7912 : ca __ __ DEX
7913 : 10 f8 __ BPL $790d ; (menu_pulldown.s1001 + 13)
7915 : 60 __ __ RTS
.s210:
7916 : c9 9d __ CMP #$9d
7918 : f0 03 __ BEQ $791d ; (menu_pulldown.s127 + 0)
791a : 4c 99 77 JMP $7799 ; (menu_pulldown.l58 + 0)
.s127:
791d : a5 54 __ LDA T1 + 0 
791f : d0 03 __ BNE $7924 ; (menu_pulldown.s128 + 0)
7921 : 4c 99 77 JMP $7799 ; (menu_pulldown.l58 + 0)
.s128:
7924 : a9 12 __ LDA #$12
7926 : d0 cf __ BNE $78f7 ; (menu_pulldown.s1107 + 0)
.s135:
7928 : a9 af __ LDA #$af
792a : a0 02 __ LDY #$02
792c : 91 23 __ STA (SP + 0),y 
792e : a9 8b __ LDA #$8b
7930 : c8 __ __ INY
7931 : 91 23 __ STA (SP + 0),y 
7933 : a9 85 __ LDA #$85
7935 : c8 __ __ INY
7936 : 91 23 __ STA (SP + 0),y 
7938 : a9 7b __ LDA #$7b
793a : c8 __ __ INY
793b : 91 23 __ STA (SP + 0),y 
793d : a5 53 __ LDA T0 + 0 
793f : 85 1b __ STA ACCU + 0 
7941 : a9 00 __ LDA #$00
7943 : 85 1c __ STA ACCU + 1 
7945 : a9 11 __ LDA #$11
7947 : 20 b4 84 JSR $84b4 ; (mul16by8 + 0)
794a : 38 __ __ SEC
794b : a5 05 __ LDA WORK + 2 
794d : e9 11 __ SBC #$11
794f : aa __ __ TAX
7950 : a5 06 __ LDA WORK + 3 
7952 : e9 00 __ SBC #$00
7954 : 85 44 __ STA T10 + 1 
7956 : 8a __ __ TXA
7957 : 18 __ __ CLC
7958 : 65 55 __ ADC T2 + 0 
795a : a0 06 __ LDY #$06
795c : 91 23 __ STA (SP + 0),y 
795e : a5 44 __ LDA T10 + 1 
7960 : 65 56 __ ADC T2 + 1 
7962 : c8 __ __ INY
7963 : 91 23 __ STA (SP + 0),y 
7965 : 20 ff 64 JSR $64ff ; (sprintf.s0 + 0)
7968 : ad fd bf LDA $bffd ; (sstack + 5)
796b : 85 0d __ STA P0 
796d : 18 __ __ CLC
796e : a5 53 __ LDA T0 + 0 
7970 : 65 5c __ ADC T7 + 0 
7972 : 38 __ __ SEC
7973 : e9 01 __ SBC #$01
7975 : 85 0e __ STA P1 
7977 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
797a : a5 1b __ LDA ACCU + 0 
797c : 85 5c __ STA T7 + 0 
797e : a5 1c __ LDA ACCU + 1 
7980 : 85 5d __ STA T7 + 1 
7982 : 20 9a 64 JSR $649a ; (strlen@proxy + 0)
7985 : a5 1b __ LDA ACCU + 0 
7987 : 85 5a __ STA T6 + 0 
7989 : ad fe 8a LDA $8afe ; (vdc_state + 8)
798c : 18 __ __ CLC
798d : 65 5c __ ADC T7 + 0 
798f : a2 12 __ LDX #$12
7991 : 8e 00 d6 STX $d600 
7994 : aa __ __ TAX
7995 : ad ff 8a LDA $8aff ; (vdc_state + 9)
7998 : 65 5d __ ADC T7 + 1 
.l1046:
799a : 2c 00 d6 BIT $d600 
799d : 10 fb __ BPL $799a ; (menu_pulldown.l1046 + 0)
.s142:
799f : 8d 01 d6 STA $d601 
79a2 : a9 13 __ LDA #$13
79a4 : 8d 00 d6 STA $d600 
.l1048:
79a7 : 2c 00 d6 BIT $d600 
79aa : 10 fb __ BPL $79a7 ; (menu_pulldown.l1048 + 0)
.s147:
79ac : 8e 01 d6 STX $d601 
79af : a9 1f __ LDA #$1f
79b1 : 8d 00 d6 STA $d600 
79b4 : a5 1b __ LDA ACCU + 0 
79b6 : f0 19 __ BEQ $79d1 ; (menu_pulldown.s152 + 0)
.s222:
79b8 : a2 00 __ LDX #$00
.l150:
79ba : 86 59 __ STX T5 + 0 
79bc : bd af 8b LDA $8baf,x ; (linebuffer + 0)
79bf : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l1051:
79c2 : 2c 00 d6 BIT $d600 
79c5 : 10 fb __ BPL $79c2 ; (menu_pulldown.l1051 + 0)
.s155:
79c7 : 8d 01 d6 STA $d601 
79ca : a6 59 __ LDX T5 + 0 
79cc : e8 __ __ INX
79cd : e4 5a __ CPX T6 + 0 
79cf : 90 e9 __ BCC $79ba ; (menu_pulldown.l150 + 0)
.s152:
79d1 : a9 12 __ LDA #$12
79d3 : 8d 00 d6 STA $d600 
79d6 : c6 5a __ DEC T6 + 0 
79d8 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
79db : 18 __ __ CLC
79dc : 65 5c __ ADC T7 + 0 
79de : aa __ __ TAX
79df : ad 01 8b LDA $8b01 ; (vdc_state + 11)
79e2 : 65 5d __ ADC T7 + 1 
.l1054:
79e4 : 2c 00 d6 BIT $d600 
79e7 : 10 fb __ BPL $79e4 ; (menu_pulldown.l1054 + 0)
.s162:
79e9 : 8d 01 d6 STA $d601 
79ec : a9 13 __ LDA #$13
79ee : 8d 00 d6 STA $d600 
.l1056:
79f1 : 2c 00 d6 BIT $d600 
79f4 : 10 fb __ BPL $79f1 ; (menu_pulldown.l1056 + 0)
.s167:
79f6 : 8e 01 d6 STX $d601 
79f9 : a9 1f __ LDA #$1f
79fb : 8d 00 d6 STA $d600 
.l1058:
79fe : 2c 00 d6 BIT $d600 
7a01 : 10 fb __ BPL $79fe ; (menu_pulldown.l1058 + 0)
.s171:
7a03 : a9 c6 __ LDA #$c6
7a05 : 8d 01 d6 STA $d601 
7a08 : a9 18 __ LDA #$18
7a0a : 8d 00 d6 STA $d600 
.l1060:
7a0d : 2c 00 d6 BIT $d600 
7a10 : 10 fb __ BPL $7a0d ; (menu_pulldown.l1060 + 0)
.s177:
7a12 : ad 01 d6 LDA $d601 
7a15 : 29 7f __ AND #$7f
7a17 : a2 18 __ LDX #$18
7a19 : 8e 00 d6 STX $d600 
.l1062:
7a1c : 2c 00 d6 BIT $d600 
7a1f : 10 fb __ BPL $7a1c ; (menu_pulldown.l1062 + 0)
.s183:
7a21 : 8d 01 d6 STA $d601 
7a24 : a9 1e __ LDA #$1e
7a26 : 8d 00 d6 STA $d600 
.l1064:
7a29 : 2c 00 d6 BIT $d600 
7a2c : 10 fb __ BPL $7a29 ; (menu_pulldown.l1064 + 0)
.s188:
7a2e : a5 5a __ LDA T6 + 0 
7a30 : 8d 01 d6 STA $d601 
7a33 : a5 57 __ LDA T3 + 0 
7a35 : c9 91 __ CMP #$91
7a37 : d0 0e __ BNE $7a47 ; (menu_pulldown.s190 + 0)
.s189:
7a39 : c6 53 __ DEC T0 + 0 
7a3b : f0 03 __ BEQ $7a40 ; (menu_pulldown.s192 + 0)
7a3d : 4c 99 77 JMP $7799 ; (menu_pulldown.l58 + 0)
.s192:
7a40 : a5 58 __ LDA T4 + 0 
.s1106:
7a42 : 85 53 __ STA T0 + 0 
7a44 : 4c 99 77 JMP $7799 ; (menu_pulldown.l58 + 0)
.s190:
7a47 : e6 53 __ INC T0 + 0 
7a49 : a5 58 __ LDA T4 + 0 
7a4b : c5 53 __ CMP T0 + 0 
7a4d : 90 03 __ BCC $7a52 ; (menu_pulldown.s195 + 0)
7a4f : 4c 99 77 JMP $7799 ; (menu_pulldown.l58 + 0)
.s195:
7a52 : a9 01 __ LDA #$01
7a54 : 90 ec __ BCC $7a42 ; (menu_pulldown.s1106 + 0)
.s203:
7a56 : c9 0d __ CMP #$0d
7a58 : d0 03 __ BNE $7a5d ; (menu_pulldown.s204 + 0)
7a5a : 4c f9 78 JMP $78f9 ; (menu_pulldown.s59 + 0)
.s204:
7a5d : b0 0c __ BCS $7a6b ; (menu_pulldown.s205 + 0)
.s206:
7a5f : c9 03 __ CMP #$03
7a61 : f0 03 __ BEQ $7a66 ; (menu_pulldown.s122 + 0)
7a63 : 4c 99 77 JMP $7799 ; (menu_pulldown.l58 + 0)
.s122:
7a66 : a9 00 __ LDA #$00
7a68 : 4c f7 78 JMP $78f7 ; (menu_pulldown.s1107 + 0)
.s205:
7a6b : c9 11 __ CMP #$11
7a6d : d0 03 __ BNE $7a72 ; (menu_pulldown.s205 + 7)
7a6f : 4c 28 79 JMP $7928 ; (menu_pulldown.s135 + 0)
7a72 : 4c 99 77 JMP $7799 ; (menu_pulldown.l58 + 0)
.s247:
7a75 : a9 00 __ LDA #$00
7a77 : 85 59 __ STA T5 + 0 
.l2:
7a79 : a9 af __ LDA #$af
7a7b : a0 02 __ LDY #$02
7a7d : 91 23 __ STA (SP + 0),y 
7a7f : a9 8b __ LDA #$8b
7a81 : c8 __ __ INY
7a82 : 91 23 __ STA (SP + 0),y 
7a84 : a9 85 __ LDA #$85
7a86 : c8 __ __ INY
7a87 : 91 23 __ STA (SP + 0),y 
7a89 : a9 7b __ LDA #$7b
7a8b : c8 __ __ INY
7a8c : 91 23 __ STA (SP + 0),y 
7a8e : a5 59 __ LDA T5 + 0 
7a90 : 85 1b __ STA ACCU + 0 
7a92 : a9 00 __ LDA #$00
7a94 : 85 1c __ STA ACCU + 1 
7a96 : a9 11 __ LDA #$11
7a98 : 20 b4 84 JSR $84b4 ; (mul16by8 + 0)
7a9b : 18 __ __ CLC
7a9c : a5 55 __ LDA T2 + 0 
7a9e : 65 05 __ ADC WORK + 2 
7aa0 : a0 06 __ LDY #$06
7aa2 : 91 23 __ STA (SP + 0),y 
7aa4 : a5 56 __ LDA T2 + 1 
7aa6 : 65 06 __ ADC WORK + 3 
7aa8 : c8 __ __ INY
7aa9 : 91 23 __ STA (SP + 0),y 
7aab : 20 ff 64 JSR $64ff ; (sprintf.s0 + 0)
7aae : ad fd bf LDA $bffd ; (sstack + 5)
7ab1 : 85 0d __ STA P0 
7ab3 : ad fe bf LDA $bffe ; (sstack + 6)
7ab6 : 18 __ __ CLC
7ab7 : 65 59 __ ADC T5 + 0 
7ab9 : 85 0e __ STA P1 
7abb : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
7abe : a5 1b __ LDA ACCU + 0 
7ac0 : 85 5c __ STA T7 + 0 
7ac2 : a5 1c __ LDA ACCU + 1 
7ac4 : 85 5d __ STA T7 + 1 
7ac6 : 20 9a 64 JSR $649a ; (strlen@proxy + 0)
7ac9 : a5 1b __ LDA ACCU + 0 
7acb : 85 5e __ STA T8 + 0 
7acd : ad fe 8a LDA $8afe ; (vdc_state + 8)
7ad0 : 18 __ __ CLC
7ad1 : 65 5c __ ADC T7 + 0 
7ad3 : a2 12 __ LDX #$12
7ad5 : 8e 00 d6 STX $d600 
7ad8 : aa __ __ TAX
7ad9 : ad ff 8a LDA $8aff ; (vdc_state + 9)
7adc : 65 5d __ ADC T7 + 1 
.l1004:
7ade : 2c 00 d6 BIT $d600 
7ae1 : 10 fb __ BPL $7ade ; (menu_pulldown.l1004 + 0)
.s11:
7ae3 : 8d 01 d6 STA $d601 
7ae6 : a9 13 __ LDA #$13
7ae8 : 8d 00 d6 STA $d600 
.l1006:
7aeb : 2c 00 d6 BIT $d600 
7aee : 10 fb __ BPL $7aeb ; (menu_pulldown.l1006 + 0)
.s16:
7af0 : 8e 01 d6 STX $d601 
7af3 : a9 1f __ LDA #$1f
7af5 : 8d 00 d6 STA $d600 
7af8 : a5 1b __ LDA ACCU + 0 
7afa : f0 19 __ BEQ $7b15 ; (menu_pulldown.s21 + 0)
.s244:
7afc : a2 00 __ LDX #$00
.l19:
7afe : 86 5f __ STX T9 + 0 
7b00 : bd af 8b LDA $8baf,x ; (linebuffer + 0)
7b03 : 20 c6 64 JSR $64c6 ; (pet2screen.s0 + 0)
.l1009:
7b06 : 2c 00 d6 BIT $d600 
7b09 : 10 fb __ BPL $7b06 ; (menu_pulldown.l1009 + 0)
.s24:
7b0b : 8d 01 d6 STA $d601 
7b0e : a6 5f __ LDX T9 + 0 
7b10 : e8 __ __ INX
7b11 : e4 5e __ CPX T8 + 0 
7b13 : 90 e9 __ BCC $7afe ; (menu_pulldown.l19 + 0)
.s21:
7b15 : a9 12 __ LDA #$12
7b17 : 8d 00 d6 STA $d600 
7b1a : c6 5e __ DEC T8 + 0 
7b1c : ad 00 8b LDA $8b00 ; (vdc_state + 10)
7b1f : 18 __ __ CLC
7b20 : 65 5c __ ADC T7 + 0 
7b22 : aa __ __ TAX
7b23 : ad 01 8b LDA $8b01 ; (vdc_state + 11)
7b26 : 65 5d __ ADC T7 + 1 
.l1012:
7b28 : 2c 00 d6 BIT $d600 
7b2b : 10 fb __ BPL $7b28 ; (menu_pulldown.l1012 + 0)
.s31:
7b2d : 8d 01 d6 STA $d601 
7b30 : a9 13 __ LDA #$13
7b32 : 8d 00 d6 STA $d600 
.l1014:
7b35 : 2c 00 d6 BIT $d600 
7b38 : 10 fb __ BPL $7b35 ; (menu_pulldown.l1014 + 0)
.s36:
7b3a : 8e 01 d6 STX $d601 
7b3d : a9 1f __ LDA #$1f
7b3f : 8d 00 d6 STA $d600 
.l1016:
7b42 : 2c 00 d6 BIT $d600 
7b45 : 10 fb __ BPL $7b42 ; (menu_pulldown.l1016 + 0)
.s40:
7b47 : a9 c6 __ LDA #$c6
7b49 : 8d 01 d6 STA $d601 
7b4c : a9 18 __ LDA #$18
7b4e : 8d 00 d6 STA $d600 
.l1018:
7b51 : 2c 00 d6 BIT $d600 
7b54 : 10 fb __ BPL $7b51 ; (menu_pulldown.l1018 + 0)
.s46:
7b56 : ad 01 d6 LDA $d601 
7b59 : 29 7f __ AND #$7f
7b5b : a2 18 __ LDX #$18
7b5d : 8e 00 d6 STX $d600 
.l1020:
7b60 : 2c 00 d6 BIT $d600 
7b63 : 10 fb __ BPL $7b60 ; (menu_pulldown.l1020 + 0)
.s52:
7b65 : 8d 01 d6 STA $d601 
7b68 : a9 1e __ LDA #$1e
7b6a : 8d 00 d6 STA $d600 
.l1022:
7b6d : 2c 00 d6 BIT $d600 
7b70 : 10 fb __ BPL $7b6d ; (menu_pulldown.l1022 + 0)
.s57:
7b72 : a5 5e __ LDA T8 + 0 
7b74 : 8d 01 d6 STA $d601 
7b77 : e6 59 __ INC T5 + 0 
7b79 : a5 59 __ LDA T5 + 0 
7b7b : c5 58 __ CMP T4 + 0 
7b7d : b0 03 __ BCS $7b82 ; (menu_pulldown.s57 + 16)
7b7f : 4c 79 7a JMP $7a79 ; (menu_pulldown.l2 + 0)
7b82 : 4c 99 77 JMP $7799 ; (menu_pulldown.l58 + 0)
--------------------------------------------------------------------
7b85 : __ __ __ BYT 20 25 53 20 00                                  :  %S .
--------------------------------------------------------------------
7b8a : __ __ __ BYT 25 43 25 53 20 00                               : %C%S .
--------------------------------------------------------------------
7b90 : __ __ __ BYT 73 45 4c 45 43 54 20 53 43 52 45 45 4e 20 4d 4f : sELECT SCREEN MO
7ba0 : __ __ __ BYT 44 45 00                                        : DE.
--------------------------------------------------------------------
7ba3 : __ __ __ BYT 76 45 52 53 49 4f 4e 20 49 4e 46 4f 52 4d 41 54 : vERSION INFORMAT
7bb3 : __ __ __ BYT 49 4f 4e 20 41 4e 44 20 43 52 45 44 49 54 53 00 : ION AND CREDITS.
--------------------------------------------------------------------
7bc3 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d 4f : oSCAR64 vdc dEMO
7bd3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
7bd4 : __ __ __ BYT 77 52 49 54 54 45 4e 20 49 4e 20 32 30 32 34 20 : wRITTEN IN 2024 
7be4 : __ __ __ BYT 42 59 20 78 41 4e 44 45 52 20 6d 4f 4c 00       : BY xANDER mOL.
--------------------------------------------------------------------
7bf2 : __ __ __ BYT 76 45 52 53 49 4f 4e 3a 20 25 53 00             : vERSION: %S.
--------------------------------------------------------------------
bootdevice:
7bfe : __ __ __ BSS	1
--------------------------------------------------------------------
7c00 : __ __ __ BYT 56 30 31 2d 32 30 32 34 30 32 31 32 2d 31 37 34 : V01-20240212-174
7c10 : __ __ __ BYT 37 00                                           : 7.
--------------------------------------------------------------------
7c12 : __ __ __ BYT 66 55 4c 4c 20 53 4f 55 52 43 45 20 43 4f 44 45 : fULL SOURCE CODE
7c22 : __ __ __ BYT 2c 20 44 4f 43 55 4d 45 4e 54 41 54 49 4f 4e 20 : , DOCUMENTATION 
7c32 : __ __ __ BYT 41 4e 44 20 43 52 45 44 49 54 53 20 41 54 3a 00 : AND CREDITS AT:.
--------------------------------------------------------------------
7c42 : __ __ __ BYT 48 54 54 50 53 3a 2f 2f 47 49 54 48 55 42 2e 43 : HTTPS://GITHUB.C
7c52 : __ __ __ BYT 4f 4d 2f 58 41 48 4d 4f 4c 2f 6f 53 43 41 52 36 : OM/XAHMOL/oSCAR6
7c62 : __ __ __ BYT 34 74 45 53 54 2f 00                            : 4tEST/.
--------------------------------------------------------------------
7c69 : __ __ __ BYT 28 63 29 20 32 30 32 34 2c 20 69 64 52 45 41 4d : (c) 2024, idREAM
7c79 : __ __ __ BYT 54 69 4e 38 62 49 54 53 2e 43 4f 4d 00          : TiN8bITS.COM.
--------------------------------------------------------------------
7c86 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 54 4f 20 43 : pRESS A KEY TO C
7c96 : __ __ __ BYT 4f 4e 54 49 4e 55 45 2e 00                      : ONTINUE..
--------------------------------------------------------------------
rand: ; rand()->u16
.s0:
7c9f : ad ff 72 LDA $72ff ; (seed + 1)
7ca2 : 4a __ __ LSR
7ca3 : ad fe 72 LDA $72fe ; (seed + 0)
7ca6 : 6a __ __ ROR
7ca7 : aa __ __ TAX
7ca8 : a9 00 __ LDA #$00
7caa : 6a __ __ ROR
7cab : 4d fe 72 EOR $72fe ; (seed + 0)
7cae : 85 1b __ STA ACCU + 0 
7cb0 : 8a __ __ TXA
7cb1 : 4d ff 72 EOR $72ff ; (seed + 1)
7cb4 : 85 1c __ STA ACCU + 1 
7cb6 : 4a __ __ LSR
7cb7 : 45 1b __ EOR ACCU + 0 
7cb9 : 8d fe 72 STA $72fe ; (seed + 0)
7cbc : 85 1b __ STA ACCU + 0 
7cbe : 45 1c __ EOR ACCU + 1 
7cc0 : 8d ff 72 STA $72ff ; (seed + 1)
7cc3 : 85 1c __ STA ACCU + 1 
.s1001:
7cc5 : 60 __ __ RTS
--------------------------------------------------------------------
generateSentence: ; generateSentence(u8*)->void
.s1000:
7cc6 : a5 53 __ LDA T2 + 0 
7cc8 : 8d 4b bf STA $bf4b ; (generateSentence@stack + 0)
7ccb : a5 54 __ LDA T2 + 1 
7ccd : 8d 4c bf STA $bf4c ; (generateSentence@stack + 1)
7cd0 : 38 __ __ SEC
7cd1 : a5 23 __ LDA SP + 0 
7cd3 : e9 0e __ SBC #$0e
7cd5 : 85 23 __ STA SP + 0 
7cd7 : b0 02 __ BCS $7cdb ; (generateSentence.s0 + 0)
7cd9 : c6 24 __ DEC SP + 1 
.s0:
7cdb : a9 74 __ LDA #$74
7cdd : 8d d4 bf STA $bfd4 ; (wrapbuffer + 54)
7ce0 : a9 48 __ LDA #$48
7ce2 : 8d d5 bf STA $bfd5 ; (wrapbuffer + 55)
7ce5 : a9 45 __ LDA #$45
7ce7 : 8d d6 bf STA $bfd6 ; (wrapbuffer + 56)
7cea : a9 00 __ LDA #$00
7cec : 8d d7 bf STA $bfd7 ; (wrapbuffer + 57)
7cef : 8d d9 bf STA $bfd9 ; (wrapbuffer + 59)
7cf2 : 8d da bf STA $bfda ; (wrapbuffer + 60)
7cf5 : 8d db bf STA $bfdb ; (wrapbuffer + 61)
7cf8 : a9 61 __ LDA #$61
7cfa : 8d d8 bf STA $bfd8 ; (wrapbuffer + 58)
7cfd : a2 4b __ LDX #$4b
.l1002:
7cff : bd af 86 LDA $86af,x ; (pulldown_options + 6)
7d02 : 9d 88 bf STA $bf88,x ; (verbs + 29)
7d05 : ca __ __ DEX
7d06 : d0 f7 __ BNE $7cff ; (generateSentence.l1002 + 0)
.s1003:
7d08 : a2 1e __ LDX #$1e
.l1004:
7d0a : bd a1 8a LDA $8aa1,x ; (pulldown_titles + 713)
7d0d : 9d 6a bf STA $bf6a,x ; (adjectives + 29)
7d10 : ca __ __ DEX
7d11 : d0 f7 __ BNE $7d0a ; (generateSentence.l1004 + 0)
.s1005:
7d13 : a2 1e __ LDX #$1e
.l1006:
7d15 : bd bf 8a LDA $8abf,x 
7d18 : 9d 4c bf STA $bf4c,x ; (generateSentence@stack + 1)
7d1b : ca __ __ DEX
7d1c : d0 f7 __ BNE $7d15 ; (generateSentence.l1006 + 0)
.s1007:
7d1e : 20 9f 7c JSR $7c9f ; (rand.s0 + 0)
7d21 : a5 1b __ LDA ACCU + 0 
7d23 : 85 4e __ STA T0 + 0 
7d25 : 20 9f 7c JSR $7c9f ; (rand.s0 + 0)
7d28 : a5 1b __ LDA ACCU + 0 
7d2a : 85 4f __ STA T1 + 0 
7d2c : a5 1c __ LDA ACCU + 1 
7d2e : 85 50 __ STA T1 + 1 
7d30 : 20 9f 7c JSR $7c9f ; (rand.s0 + 0)
7d33 : a5 1b __ LDA ACCU + 0 
7d35 : 85 53 __ STA T2 + 0 
7d37 : a5 1c __ LDA ACCU + 1 
7d39 : 85 54 __ STA T2 + 1 
7d3b : 20 9f 7c JSR $7c9f ; (rand.s0 + 0)
7d3e : ad fd bf LDA $bffd ; (sstack + 5)
7d41 : 85 45 __ STA T4 + 0 
7d43 : ad fe bf LDA $bffe ; (sstack + 6)
7d46 : 85 46 __ STA T4 + 1 
7d48 : a9 00 __ LDA #$00
7d4a : 85 04 __ STA WORK + 1 
7d4c : a8 __ __ TAY
7d4d : 91 45 __ STA (T4 + 0),y 
7d4f : a5 45 __ LDA T4 + 0 
7d51 : a0 02 __ LDY #$02
7d53 : 91 23 __ STA (SP + 0),y 
7d55 : a5 46 __ LDA T4 + 1 
7d57 : c8 __ __ INY
7d58 : 91 23 __ STA (SP + 0),y 
7d5a : a9 f3 __ LDA #$f3
7d5c : c8 __ __ INY
7d5d : 91 23 __ STA (SP + 0),y 
7d5f : a9 7d __ LDA #$7d
7d61 : c8 __ __ INY
7d62 : 84 03 __ STY WORK + 0 
7d64 : 91 23 __ STA (SP + 0),y 
7d66 : a5 4e __ LDA T0 + 0 
7d68 : 29 01 __ AND #$01
7d6a : 0a __ __ ASL
7d6b : 0a __ __ ASL
7d6c : 69 d4 __ ADC #$d4
7d6e : c8 __ __ INY
7d6f : 91 23 __ STA (SP + 0),y 
7d71 : a9 bf __ LDA #$bf
7d73 : 69 00 __ ADC #$00
7d75 : c8 __ __ INY
7d76 : 91 23 __ STA (SP + 0),y 
7d78 : 20 16 85 JSR $8516 ; (divmod + 0)
7d7b : a6 05 __ LDX WORK + 2 
7d7d : bd 49 86 LDA $8649,x ; (__multab6L + 0)
7d80 : 18 __ __ CLC
7d81 : 69 4d __ ADC #$4d
7d83 : a0 08 __ LDY #$08
7d85 : 91 23 __ STA (SP + 0),y 
7d87 : a9 bf __ LDA #$bf
7d89 : 69 00 __ ADC #$00
7d8b : c8 __ __ INY
7d8c : 91 23 __ STA (SP + 0),y 
7d8e : a5 4f __ LDA T1 + 0 
7d90 : 85 1b __ STA ACCU + 0 
7d92 : a5 50 __ LDA T1 + 1 
7d94 : 85 1c __ STA ACCU + 1 
7d96 : a9 05 __ LDA #$05
7d98 : 85 03 __ STA WORK + 0 
7d9a : a9 00 __ LDA #$00
7d9c : 85 04 __ STA WORK + 1 
7d9e : 20 16 85 JSR $8516 ; (divmod + 0)
7da1 : a6 05 __ LDX WORK + 2 
7da3 : bd 4e 86 LDA $864e,x ; (__multab15L + 0)
7da6 : 18 __ __ CLC
7da7 : 69 89 __ ADC #$89
7da9 : a0 0a __ LDY #$0a
7dab : 91 23 __ STA (SP + 0),y 
7dad : a9 bf __ LDA #$bf
7daf : 69 00 __ ADC #$00
7db1 : c8 __ __ INY
7db2 : 91 23 __ STA (SP + 0),y 
7db4 : a5 53 __ LDA T2 + 0 
7db6 : 85 1b __ STA ACCU + 0 
7db8 : a5 54 __ LDA T2 + 1 
7dba : 85 1c __ STA ACCU + 1 
7dbc : a9 05 __ LDA #$05
7dbe : 85 03 __ STA WORK + 0 
7dc0 : a9 00 __ LDA #$00
7dc2 : 85 04 __ STA WORK + 1 
7dc4 : 20 16 85 JSR $8516 ; (divmod + 0)
7dc7 : a6 05 __ LDX WORK + 2 
7dc9 : bd 49 86 LDA $8649,x ; (__multab6L + 0)
7dcc : 18 __ __ CLC
7dcd : 69 6b __ ADC #$6b
7dcf : a0 0c __ LDY #$0c
7dd1 : 91 23 __ STA (SP + 0),y 
7dd3 : a9 bf __ LDA #$bf
7dd5 : 69 00 __ ADC #$00
7dd7 : c8 __ __ INY
7dd8 : 91 23 __ STA (SP + 0),y 
7dda : 20 ff 64 JSR $64ff ; (sprintf.s0 + 0)
.s1001:
7ddd : 18 __ __ CLC
7dde : a5 23 __ LDA SP + 0 
7de0 : 69 0e __ ADC #$0e
7de2 : 85 23 __ STA SP + 0 
7de4 : 90 02 __ BCC $7de8 ; (generateSentence.s1001 + 11)
7de6 : e6 24 __ INC SP + 1 
7de8 : ad 4b bf LDA $bf4b ; (generateSentence@stack + 0)
7deb : 85 53 __ STA T2 + 0 
7ded : ad 4c bf LDA $bf4c ; (generateSentence@stack + 1)
7df0 : 85 54 __ STA T2 + 1 
7df2 : 60 __ __ RTS
--------------------------------------------------------------------
7df3 : __ __ __ BYT 25 53 20 25 53 20 25 53 20 25 53 2e 00          : %S %S %S %S..
--------------------------------------------------------------------
vdcwin_printwrap: ; vdcwin_printwrap(struct VDCWin*,const u8*)->void
.s1000:
7e00 : a2 0c __ LDX #$0c
7e02 : b5 53 __ LDA T0 + 0,x 
7e04 : 9d 90 bf STA $bf90,x ; (nouns + 7)
7e07 : ca __ __ DEX
7e08 : 10 f8 __ BPL $7e02 ; (vdcwin_printwrap.s1000 + 2)
7e0a : 38 __ __ SEC
7e0b : a5 23 __ LDA SP + 0 
7e0d : e9 06 __ SBC #$06
7e0f : 85 23 __ STA SP + 0 
7e11 : b0 02 __ BCS $7e15 ; (vdcwin_printwrap.s0 + 0)
7e13 : c6 24 __ DEC SP + 1 
.s0:
7e15 : a5 13 __ LDA P6 ; (str + 0)
7e17 : 85 0d __ STA P0 
7e19 : a5 14 __ LDA P7 ; (str + 1)
7e1b : 85 0e __ STA P1 
7e1d : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
7e20 : a5 1b __ LDA ACCU + 0 
7e22 : f0 31 __ BEQ $7e55 ; (vdcwin_printwrap.s1001 + 0)
.s84:
7e24 : 85 53 __ STA T0 + 0 
7e26 : a9 00 __ LDA #$00
7e28 : 85 57 __ STA T3 + 0 
7e2a : 85 5c __ STA T6 + 0 
7e2c : a9 ff __ LDA #$ff
7e2e : 85 59 __ STA T4 + 1 
7e30 : 85 5b __ STA T5 + 1 
7e32 : a0 02 __ LDY #$02
7e34 : b1 11 __ LDA (P4),y ; (win + 0)
7e36 : 85 54 __ STA T1 + 0 
.l4:
7e38 : a5 57 __ LDA T3 + 0 
7e3a : c5 53 __ CMP T0 + 0 
7e3c : b0 0d __ BCS $7e4b ; (vdcwin_printwrap.s7 + 0)
.l9:
7e3e : 24 5b __ BIT T5 + 1 
7e40 : 10 09 __ BPL $7e4b ; (vdcwin_printwrap.s7 + 0)
.s8:
7e42 : a6 5c __ LDX T6 + 0 
7e44 : e0 50 __ CPX #$50
7e46 : b0 03 __ BCS $7e4b ; (vdcwin_printwrap.s7 + 0)
7e48 : 4c 15 80 JMP $8015 ; (vdcwin_printwrap.s6 + 0)
.s7:
7e4b : a6 5c __ LDX T6 + 0 
7e4d : d0 1c __ BNE $7e6b ; (vdcwin_printwrap.s19 + 0)
.s1:
7e4f : a5 57 __ LDA T3 + 0 
7e51 : c5 53 __ CMP T0 + 0 
7e53 : 90 e9 __ BCC $7e3e ; (vdcwin_printwrap.l9 + 0)
.s1001:
7e55 : 18 __ __ CLC
7e56 : a5 23 __ LDA SP + 0 
7e58 : 69 06 __ ADC #$06
7e5a : 85 23 __ STA SP + 0 
7e5c : 90 02 __ BCC $7e60 ; (vdcwin_printwrap.s1001 + 11)
7e5e : e6 24 __ INC SP + 1 
7e60 : a2 0c __ LDX #$0c
7e62 : bd 90 bf LDA $bf90,x ; (nouns + 7)
7e65 : 95 53 __ STA T0 + 0,x 
7e67 : ca __ __ DEX
7e68 : 10 f8 __ BPL $7e62 ; (vdcwin_printwrap.s1001 + 13)
7e6a : 60 __ __ RTS
.s19:
7e6b : a9 00 __ LDA #$00
7e6d : 9d 9e bf STA $bf9e,x ; (nouns + 21)
7e70 : a9 9e __ LDA #$9e
7e72 : 85 0d __ STA P0 
7e74 : a9 bf __ LDA #$bf
7e76 : 85 0e __ STA P1 
.l22:
7e78 : 20 a2 64 JSR $64a2 ; (strlen.s0 + 0)
7e7b : a0 02 __ LDY #$02
7e7d : b1 11 __ LDA (P4),y ; (win + 0)
7e7f : c5 1b __ CMP ACCU + 0 
7e81 : 90 52 __ BCC $7ed5 ; (vdcwin_printwrap.s23 + 0)
.s24:
7e83 : a0 04 __ LDY #$04
7e85 : b1 11 __ LDA (P4),y ; (win + 0)
7e87 : 18 __ __ CLC
7e88 : 65 1b __ ADC ACCU + 0 
7e8a : b0 06 __ BCS $7e92 ; (vdcwin_printwrap.s72 + 0)
.s1010:
7e8c : c5 54 __ CMP T1 + 0 
7e8e : 90 1a __ BCC $7eaa ; (vdcwin_printwrap.s74 + 0)
.s1036:
7e90 : f0 18 __ BEQ $7eaa ; (vdcwin_printwrap.s74 + 0)
.s72:
7e92 : a5 11 __ LDA P4 ; (win + 0)
7e94 : a0 02 __ LDY #$02
7e96 : 91 23 __ STA (SP + 0),y 
7e98 : a5 12 __ LDA P5 ; (win + 1)
7e9a : c8 __ __ INY
7e9b : 91 23 __ STA (SP + 0),y 
7e9d : a9 fd __ LDA #$fd
7e9f : c8 __ __ INY
7ea0 : 91 23 __ STA (SP + 0),y 
7ea2 : a9 5e __ LDA #$5e
7ea4 : c8 __ __ INY
7ea5 : 91 23 __ STA (SP + 0),y 
7ea7 : 20 35 80 JSR $8035 ; (vdcwin_printline.s1000 + 0)
.s74:
7eaa : a5 11 __ LDA P4 ; (win + 0)
7eac : a0 02 __ LDY #$02
7eae : 91 23 __ STA (SP + 0),y 
7eb0 : a5 12 __ LDA P5 ; (win + 1)
7eb2 : c8 __ __ INY
7eb3 : 91 23 __ STA (SP + 0),y 
7eb5 : a9 9e __ LDA #$9e
7eb7 : c8 __ __ INY
7eb8 : 91 23 __ STA (SP + 0),y 
7eba : a9 bf __ LDA #$bf
7ebc : c8 __ __ INY
7ebd : 91 23 __ STA (SP + 0),y 
7ebf : 20 06 83 JSR $8306 ; (vdcwin_put_string.s1000 + 0)
7ec2 : a5 57 __ LDA T3 + 0 
7ec4 : c5 53 __ CMP T0 + 0 
7ec6 : b0 8d __ BCS $7e55 ; (vdcwin_printwrap.s1001 + 0)
.s211:
7ec8 : a9 00 __ LDA #$00
7eca : 85 5c __ STA T6 + 0 
7ecc : a9 ff __ LDA #$ff
7ece : 85 5b __ STA T5 + 1 
7ed0 : 85 59 __ STA T4 + 1 
7ed2 : 4c 38 7e JMP $7e38 ; (vdcwin_printwrap.l4 + 0)
.s23:
7ed5 : a5 11 __ LDA P4 ; (win + 0)
7ed7 : 91 23 __ STA (SP + 0),y 
7ed9 : a5 12 __ LDA P5 ; (win + 1)
7edb : c8 __ __ INY
7edc : 91 23 __ STA (SP + 0),y 
7ede : a9 fd __ LDA #$fd
7ee0 : c8 __ __ INY
7ee1 : 91 23 __ STA (SP + 0),y 
7ee3 : a9 5e __ LDA #$5e
7ee5 : c8 __ __ INY
7ee6 : 91 23 __ STA (SP + 0),y 
7ee8 : 20 35 80 JSR $8035 ; (vdcwin_printline.s1000 + 0)
7eeb : a5 11 __ LDA P4 ; (win + 0)
7eed : 85 55 __ STA T2 + 0 
7eef : a5 12 __ LDA P5 ; (win + 1)
7ef1 : 85 56 __ STA T2 + 1 
7ef3 : a0 02 __ LDY #$02
7ef5 : b1 11 __ LDA (P4),y ; (win + 0)
7ef7 : 85 5c __ STA T6 + 0 
7ef9 : f0 14 __ BEQ $7f0f ; (vdcwin_printwrap.s26 + 0)
.s81:
7efb : a0 04 __ LDY #$04
7efd : b1 11 __ LDA (P4),y ; (win + 0)
7eff : 85 58 __ STA T4 + 0 
7f01 : c8 __ __ INY
7f02 : b1 11 __ LDA (P4),y ; (win + 0)
7f04 : 85 5a __ STA T5 + 0 
7f06 : ad fd 8a LDA $8afd ; (vdc_state + 7)
7f09 : 85 5e __ STA T10 + 0 
7f0b : a2 00 __ LDX #$00
7f0d : f0 65 __ BEQ $7f74 ; (vdcwin_printwrap.l28 + 0)
.s26:
7f0f : a5 5c __ LDA T6 + 0 
7f11 : 18 __ __ CLC
7f12 : a0 04 __ LDY #$04
7f14 : 71 55 __ ADC (T2 + 0),y 
7f16 : 91 55 __ STA (T2 + 0),y 
7f18 : a0 02 __ LDY #$02
7f1a : d1 55 __ CMP (T2 + 0),y 
7f1c : 90 32 __ BCC $7f50 ; (vdcwin_printwrap.s25 + 0)
.s66:
7f1e : a9 00 __ LDA #$00
7f20 : a0 04 __ LDY #$04
7f22 : 91 55 __ STA (T2 + 0),y 
7f24 : c8 __ __ INY
7f25 : b1 55 __ LDA (T2 + 0),y 
7f27 : aa __ __ TAX
7f28 : 18 __ __ CLC
7f29 : 69 01 __ ADC #$01
7f2b : 91 55 __ STA (T2 + 0),y 
7f2d : a0 03 __ LDY #$03
7f2f : d1 55 __ CMP (T2 + 0),y 
7f31 : d0 1d __ BNE $7f50 ; (vdcwin_printwrap.s25 + 0)
.s69:
7f33 : 8a __ __ TXA
7f34 : a0 05 __ LDY #$05
7f36 : 91 55 __ STA (T2 + 0),y 
7f38 : a5 55 __ LDA T2 + 0 
7f3a : a0 02 __ LDY #$02
7f3c : 91 23 __ STA (SP + 0),y 
7f3e : a5 56 __ LDA T2 + 1 
7f40 : c8 __ __ INY
7f41 : 91 23 __ STA (SP + 0),y 
7f43 : a9 fd __ LDA #$fd
7f45 : c8 __ __ INY
7f46 : 91 23 __ STA (SP + 0),y 
7f48 : a9 5e __ LDA #$5e
7f4a : c8 __ __ INY
7f4b : 91 23 __ STA (SP + 0),y 
7f4d : 20 35 80 JSR $8035 ; (vdcwin_printline.s1000 + 0)
.s25:
7f50 : a9 9e __ LDA #$9e
7f52 : 85 0d __ STA P0 
7f54 : a9 bf __ LDA #$bf
7f56 : 85 0e __ STA P1 
7f58 : a0 02 __ LDY #$02
7f5a : b1 11 __ LDA (P4),y ; (win + 0)
7f5c : 18 __ __ CLC
7f5d : 69 9e __ ADC #$9e
7f5f : 85 58 __ STA T4 + 0 
7f61 : a9 bf __ LDA #$bf
7f63 : 69 00 __ ADC #$00
7f65 : 85 59 __ STA T4 + 1 
7f67 : a0 ff __ LDY #$ff
.l1012:
7f69 : c8 __ __ INY
7f6a : b1 58 __ LDA (T4 + 0),y 
7f6c : 99 9e bf STA $bf9e,y ; (nouns + 21)
7f6f : d0 f8 __ BNE $7f69 ; (vdcwin_printwrap.l1012 + 0)
7f71 : 4c 78 7e JMP $7e78 ; (vdcwin_printwrap.l22 + 0)
.l28:
7f74 : 86 5d __ STX T7 + 0 
7f76 : bd 9e bf LDA $bf9e,x ; (nouns + 21)
7f79 : 4a __ __ LSR
7f7a : 4a __ __ LSR
7f7b : 4a __ __ LSR
7f7c : 4a __ __ LSR
7f7d : 4a __ __ LSR
7f7e : a8 __ __ TAY
7f7f : b9 de 8a LDA $8ade,y ; (p2smap + 0)
7f82 : 5d 9e bf EOR $bf9e,x ; (nouns + 21)
7f85 : 85 5f __ STA T11 + 0 
7f87 : a0 00 __ LDY #$00
7f89 : b1 55 __ LDA (T2 + 0),y 
7f8b : 18 __ __ CLC
7f8c : 65 58 __ ADC T4 + 0 
7f8e : 18 __ __ CLC
7f8f : 65 5d __ ADC T7 + 0 
7f91 : 85 0d __ STA P0 
7f93 : c8 __ __ INY
7f94 : b1 55 __ LDA (T2 + 0),y 
7f96 : 18 __ __ CLC
7f97 : 65 5a __ ADC T5 + 0 
7f99 : 85 0e __ STA P1 
7f9b : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
7f9e : a9 12 __ LDA #$12
7fa0 : 8d 00 d6 STA $d600 
7fa3 : 18 __ __ CLC
7fa4 : a5 1b __ LDA ACCU + 0 
7fa6 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
7fa9 : aa __ __ TAX
7faa : a5 1c __ LDA ACCU + 1 
7fac : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l300:
7faf : 2c 00 d6 BIT $d600 
7fb2 : 10 fb __ BPL $7faf ; (vdcwin_printwrap.l300 + 0)
.s40:
7fb4 : 8d 01 d6 STA $d601 
7fb7 : a9 13 __ LDA #$13
7fb9 : 8d 00 d6 STA $d600 
.l302:
7fbc : 2c 00 d6 BIT $d600 
7fbf : 10 fb __ BPL $7fbc ; (vdcwin_printwrap.l302 + 0)
.s45:
7fc1 : 8e 01 d6 STX $d601 
7fc4 : a9 1f __ LDA #$1f
7fc6 : 8d 00 d6 STA $d600 
.l304:
7fc9 : 2c 00 d6 BIT $d600 
7fcc : 10 fb __ BPL $7fc9 ; (vdcwin_printwrap.l304 + 0)
.s49:
7fce : a5 5f __ LDA T11 + 0 
7fd0 : 8d 01 d6 STA $d601 
7fd3 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
7fd6 : 18 __ __ CLC
7fd7 : 65 1b __ ADC ACCU + 0 
7fd9 : a2 12 __ LDX #$12
7fdb : 8e 00 d6 STX $d600 
7fde : aa __ __ TAX
7fdf : ad 01 8b LDA $8b01 ; (vdc_state + 11)
7fe2 : 65 1c __ ADC ACCU + 1 
.l306:
7fe4 : 2c 00 d6 BIT $d600 
7fe7 : 10 fb __ BPL $7fe4 ; (vdcwin_printwrap.l306 + 0)
.s56:
7fe9 : 8d 01 d6 STA $d601 
7fec : a9 13 __ LDA #$13
7fee : 8d 00 d6 STA $d600 
.l308:
7ff1 : 2c 00 d6 BIT $d600 
7ff4 : 10 fb __ BPL $7ff1 ; (vdcwin_printwrap.l308 + 0)
.s61:
7ff6 : 8e 01 d6 STX $d601 
7ff9 : a9 1f __ LDA #$1f
7ffb : 8d 00 d6 STA $d600 
.l310:
7ffe : 2c 00 d6 BIT $d600 
8001 : 10 fb __ BPL $7ffe ; (vdcwin_printwrap.l310 + 0)
.s65:
8003 : a5 5e __ LDA T10 + 0 
8005 : 8d 01 d6 STA $d601 
8008 : a6 5d __ LDX T7 + 0 
800a : e8 __ __ INX
800b : e4 5c __ CPX T6 + 0 
800d : b0 03 __ BCS $8012 ; (vdcwin_printwrap.s65 + 15)
800f : 4c 74 7f JMP $7f74 ; (vdcwin_printwrap.l28 + 0)
8012 : 4c 0f 7f JMP $7f0f ; (vdcwin_printwrap.s26 + 0)
.s6:
8015 : a4 57 __ LDY T3 + 0 
8017 : b1 13 __ LDA (P6),y ; (str + 0)
8019 : 9d 9e bf STA $bf9e,x ; (nouns + 21)
801c : c9 20 __ CMP #$20
801e : d0 06 __ BNE $8026 ; (vdcwin_printwrap.s10 + 0)
.s16:
8020 : a9 00 __ LDA #$00
8022 : 85 5b __ STA T5 + 1 
8024 : f0 08 __ BEQ $802e ; (vdcwin_printwrap.s229 + 0)
.s10:
8026 : 24 59 __ BIT T4 + 1 
8028 : 10 04 __ BPL $802e ; (vdcwin_printwrap.s229 + 0)
.s13:
802a : a9 00 __ LDA #$00
802c : 85 59 __ STA T4 + 1 
.s229:
802e : e6 57 __ INC T3 + 0 
8030 : e6 5c __ INC T6 + 0 
8032 : 4c 38 7e JMP $7e38 ; (vdcwin_printwrap.l4 + 0)
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
8035 : a2 08 __ LDX #$08
8037 : b5 53 __ LDA T0 + 0,x 
8039 : 9d ef bf STA $bfef,x ; (buffer + 7)
803c : ca __ __ DEX
803d : 10 f8 __ BPL $8037 ; (vdcwin_printline.s1000 + 2)
803f : 38 __ __ SEC
8040 : a5 23 __ LDA SP + 0 
8042 : e9 06 __ SBC #$06
8044 : 85 23 __ STA SP + 0 
8046 : b0 02 __ BCS $804a ; (vdcwin_printline.s0 + 0)
8048 : c6 24 __ DEC SP + 1 
.s0:
804a : a0 08 __ LDY #$08
804c : b1 23 __ LDA (SP + 0),y 
804e : 85 53 __ STA T0 + 0 
8050 : a0 02 __ LDY #$02
8052 : 91 23 __ STA (SP + 0),y 
8054 : a0 09 __ LDY #$09
8056 : b1 23 __ LDA (SP + 0),y 
8058 : 85 54 __ STA T0 + 1 
805a : a0 03 __ LDY #$03
805c : 91 23 __ STA (SP + 0),y 
805e : a0 0a __ LDY #$0a
8060 : b1 23 __ LDA (SP + 0),y 
8062 : a0 04 __ LDY #$04
8064 : 91 23 __ STA (SP + 0),y 
8066 : a0 0b __ LDY #$0b
8068 : b1 23 __ LDA (SP + 0),y 
806a : a0 05 __ LDY #$05
806c : 91 23 __ STA (SP + 0),y 
806e : 20 06 83 JSR $8306 ; (vdcwin_put_string.s1000 + 0)
8071 : a9 00 __ LDA #$00
8073 : a0 04 __ LDY #$04
8075 : 91 53 __ STA (T0 + 0),y 
8077 : 88 __ __ DEY
8078 : b1 53 __ LDA (T0 + 0),y 
807a : 38 __ __ SEC
807b : e9 01 __ SBC #$01
807d : 85 55 __ STA T1 + 0 
807f : a0 05 __ LDY #$05
8081 : b1 53 __ LDA (T0 + 0),y 
8083 : 90 0b __ BCC $8090 ; (vdcwin_printline.s2 + 0)
.s1058:
8085 : aa __ __ TAX
8086 : e4 55 __ CPX T1 + 0 
8088 : b0 06 __ BCS $8090 ; (vdcwin_printline.s2 + 0)
.s1:
808a : e8 __ __ INX
808b : 8a __ __ TXA
808c : 91 53 __ STA (T0 + 0),y 
808e : 90 68 __ BCC $80f8 ; (vdcwin_printline.s1001 + 0)
.s2:
8090 : a9 00 __ LDA #$00
8092 : 85 57 __ STA T2 + 0 
8094 : ad f9 8a LDA $8af9 ; (vdc_state + 3)
8097 : 85 55 __ STA T1 + 0 
8099 : ad fa 8a LDA $8afa ; (vdc_state + 4)
809c : 85 56 __ STA T1 + 1 
809e : a0 02 __ LDY #$02
80a0 : b1 53 __ LDA (T0 + 0),y 
80a2 : 85 5a __ STA T4 + 0 
80a4 : a0 06 __ LDY #$06
80a6 : b1 53 __ LDA (T0 + 0),y 
80a8 : 85 58 __ STA T3 + 0 
80aa : c8 __ __ INY
80ab : b1 53 __ LDA (T0 + 0),y 
80ad : 85 59 __ STA T3 + 1 
80af : c8 __ __ INY
80b0 : b1 53 __ LDA (T0 + 0),y 
80b2 : aa __ __ TAX
80b3 : c8 __ __ INY
80b4 : b1 53 __ LDA (T0 + 0),y 
.l5:
80b6 : 85 44 __ STA T5 + 1 
80b8 : a0 03 __ LDY #$03
80ba : b1 53 __ LDA (T0 + 0),y 
80bc : 85 45 __ STA T7 + 0 
80be : 38 __ __ SEC
80bf : e9 01 __ SBC #$01
80c1 : b0 03 __ BCS $80c6 ; (vdcwin_printline.s1056 + 0)
80c3 : 4c e9 81 JMP $81e9 ; (vdcwin_printline.s6 + 0)
.s1056:
80c6 : c5 57 __ CMP T2 + 0 
80c8 : 90 05 __ BCC $80cf ; (vdcwin_printline.s4 + 0)
.s1062:
80ca : f0 03 __ BEQ $80cf ; (vdcwin_printline.s4 + 0)
80cc : 4c e9 81 JMP $81e9 ; (vdcwin_printline.s6 + 0)
.s4:
80cf : a0 01 __ LDY #$01
80d1 : b1 53 __ LDA (T0 + 0),y 
80d3 : 18 __ __ CLC
80d4 : 65 45 __ ADC T7 + 0 
80d6 : 38 __ __ SEC
80d7 : e9 01 __ SBC #$01
80d9 : 85 55 __ STA T1 + 0 
80db : 18 __ __ CLC
80dc : 69 01 __ ADC #$01
80de : 85 58 __ STA T3 + 0 
80e0 : 88 __ __ DEY
80e1 : b1 53 __ LDA (T0 + 0),y 
80e3 : 85 57 __ STA T2 + 0 
80e5 : a0 02 __ LDY #$02
80e7 : b1 53 __ LDA (T0 + 0),y 
80e9 : 85 5a __ STA T4 + 0 
80eb : a9 00 __ LDA #$00
80ed : 2a __ __ ROL
80ee : 85 59 __ STA T3 + 1 
80f0 : d0 1c __ BNE $810e ; (vdcwin_printline.l186 + 0)
.s1026:
80f2 : a5 55 __ LDA T1 + 0 
80f4 : c5 58 __ CMP T3 + 0 
80f6 : 90 16 __ BCC $810e ; (vdcwin_printline.l186 + 0)
.s1001:
80f8 : 18 __ __ CLC
80f9 : a5 23 __ LDA SP + 0 
80fb : 69 06 __ ADC #$06
80fd : 85 23 __ STA SP + 0 
80ff : 90 02 __ BCC $8103 ; (vdcwin_printline.s1001 + 11)
8101 : e6 24 __ INC SP + 1 
8103 : a2 08 __ LDX #$08
8105 : bd ef bf LDA $bfef,x ; (buffer + 7)
8108 : 95 53 __ STA T0 + 0,x 
810a : ca __ __ DEX
810b : 10 f8 __ BPL $8105 ; (vdcwin_printline.s1001 + 13)
810d : 60 __ __ RTS
.l186:
810e : a5 57 __ LDA T2 + 0 
8110 : 85 0d __ STA P0 ; (win + 0)
8112 : a5 55 __ LDA T1 + 0 
8114 : 85 0e __ STA P1 ; (win + 1)
8116 : ad fd 8a LDA $8afd ; (vdc_state + 7)
8119 : 85 5b __ STA T6 + 0 
811b : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
811e : a9 12 __ LDA #$12
8120 : 8d 00 d6 STA $d600 
8123 : 18 __ __ CLC
8124 : a5 1b __ LDA ACCU + 0 
8126 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
8129 : a8 __ __ TAY
812a : a5 1c __ LDA ACCU + 1 
812c : 6d ff 8a ADC $8aff ; (vdc_state + 9)
812f : a6 5a __ LDX T4 + 0 
8131 : ca __ __ DEX
.l915:
8132 : 2c 00 d6 BIT $d600 
8135 : 10 fb __ BPL $8132 ; (vdcwin_printline.l915 + 0)
.s196:
8137 : 8d 01 d6 STA $d601 
813a : a9 13 __ LDA #$13
813c : 8d 00 d6 STA $d600 
.l917:
813f : 2c 00 d6 BIT $d600 
8142 : 10 fb __ BPL $813f ; (vdcwin_printline.l917 + 0)
.s201:
8144 : 8c 01 d6 STY $d601 
8147 : a9 1f __ LDA #$1f
8149 : 8d 00 d6 STA $d600 
.l919:
814c : 2c 00 d6 BIT $d600 
814f : 10 fb __ BPL $814c ; (vdcwin_printline.l919 + 0)
.s205:
8151 : a9 20 __ LDA #$20
8153 : 8d 01 d6 STA $d601 
8156 : a9 18 __ LDA #$18
8158 : 8d 00 d6 STA $d600 
.l921:
815b : 2c 00 d6 BIT $d600 
815e : 10 fb __ BPL $815b ; (vdcwin_printline.l921 + 0)
.s211:
8160 : ad 01 d6 LDA $d601 
8163 : 29 7f __ AND #$7f
8165 : a0 18 __ LDY #$18
8167 : 8c 00 d6 STY $d600 
.l923:
816a : 2c 00 d6 BIT $d600 
816d : 10 fb __ BPL $816a ; (vdcwin_printline.l923 + 0)
.s217:
816f : 8d 01 d6 STA $d601 
8172 : a9 1e __ LDA #$1e
8174 : 8d 00 d6 STA $d600 
.l925:
8177 : 2c 00 d6 BIT $d600 
817a : 10 fb __ BPL $8177 ; (vdcwin_printline.l925 + 0)
.s222:
817c : 8e 01 d6 STX $d601 
817f : ad 00 8b LDA $8b00 ; (vdc_state + 10)
8182 : 18 __ __ CLC
8183 : 65 1b __ ADC ACCU + 0 
8185 : a0 12 __ LDY #$12
8187 : 8c 00 d6 STY $d600 
818a : a8 __ __ TAY
818b : ad 01 8b LDA $8b01 ; (vdc_state + 11)
818e : 65 1c __ ADC ACCU + 1 
.l927:
8190 : 2c 00 d6 BIT $d600 
8193 : 10 fb __ BPL $8190 ; (vdcwin_printline.l927 + 0)
.s229:
8195 : 8d 01 d6 STA $d601 
8198 : a9 13 __ LDA #$13
819a : 8d 00 d6 STA $d600 
.l929:
819d : 2c 00 d6 BIT $d600 
81a0 : 10 fb __ BPL $819d ; (vdcwin_printline.l929 + 0)
.s234:
81a2 : 8c 01 d6 STY $d601 
81a5 : a9 1f __ LDA #$1f
81a7 : 8d 00 d6 STA $d600 
.l931:
81aa : 2c 00 d6 BIT $d600 
81ad : 10 fb __ BPL $81aa ; (vdcwin_printline.l931 + 0)
.s238:
81af : a5 5b __ LDA T6 + 0 
81b1 : 8d 01 d6 STA $d601 
81b4 : a9 18 __ LDA #$18
81b6 : 8d 00 d6 STA $d600 
.l933:
81b9 : 2c 00 d6 BIT $d600 
81bc : 10 fb __ BPL $81b9 ; (vdcwin_printline.l933 + 0)
.s244:
81be : ad 01 d6 LDA $d601 
81c1 : 29 7f __ AND #$7f
81c3 : a0 18 __ LDY #$18
81c5 : 8c 00 d6 STY $d600 
.l935:
81c8 : 2c 00 d6 BIT $d600 
81cb : 10 fb __ BPL $81c8 ; (vdcwin_printline.l935 + 0)
.s250:
81cd : 8d 01 d6 STA $d601 
81d0 : a9 1e __ LDA #$1e
81d2 : 8d 00 d6 STA $d600 
.l937:
81d5 : 2c 00 d6 BIT $d600 
81d8 : 10 fb __ BPL $81d5 ; (vdcwin_printline.l937 + 0)
.s255:
81da : 8e 01 d6 STX $d601 
81dd : e6 55 __ INC T1 + 0 
81df : a5 59 __ LDA T3 + 1 
81e1 : f0 03 __ BEQ $81e6 ; (vdcwin_printline.s255 + 12)
81e3 : 4c 0e 81 JMP $810e ; (vdcwin_printline.l186 + 0)
81e6 : 4c f2 80 JMP $80f2 ; (vdcwin_printline.s1026 + 0)
.s6:
81e9 : a9 12 __ LDA #$12
81eb : 8d 00 d6 STA $d600 
81ee : 8a __ __ TXA
81ef : 18 __ __ CLC
81f0 : 65 55 __ ADC T1 + 0 
81f2 : a8 __ __ TAY
81f3 : a5 44 __ LDA T5 + 1 
81f5 : 65 56 __ ADC T1 + 1 
81f7 : 85 46 __ STA T7 + 1 
81f9 : 18 __ __ CLC
81fa : a5 58 __ LDA T3 + 0 
81fc : 65 55 __ ADC T1 + 0 
81fe : 85 49 __ STA T9 + 0 
8200 : a5 59 __ LDA T3 + 1 
8202 : 65 56 __ ADC T1 + 1 
8204 : 85 4a __ STA T9 + 1 
.l886:
8206 : 2c 00 d6 BIT $d600 
8209 : 10 fb __ BPL $8206 ; (vdcwin_printline.l886 + 0)
.s62:
820b : a5 59 __ LDA T3 + 1 
820d : 8d 01 d6 STA $d601 
8210 : a9 13 __ LDA #$13
8212 : 8d 00 d6 STA $d600 
.l888:
8215 : 2c 00 d6 BIT $d600 
8218 : 10 fb __ BPL $8215 ; (vdcwin_printline.l888 + 0)
.s67:
821a : a5 58 __ LDA T3 + 0 
821c : 8d 01 d6 STA $d601 
821f : a9 1f __ LDA #$1f
8221 : 8d 00 d6 STA $d600 
8224 : a9 18 __ LDA #$18
8226 : 8d 00 d6 STA $d600 
.l890:
8229 : 2c 00 d6 BIT $d600 
822c : 10 fb __ BPL $8229 ; (vdcwin_printline.l890 + 0)
.s74:
822e : ad 01 d6 LDA $d601 
8231 : 09 80 __ ORA #$80
8233 : 85 4b __ STA T10 + 0 
8235 : a9 18 __ LDA #$18
8237 : 8d 00 d6 STA $d600 
.l892:
823a : 2c 00 d6 BIT $d600 
823d : 10 fb __ BPL $823a ; (vdcwin_printline.l892 + 0)
.s80:
823f : a5 4b __ LDA T10 + 0 
8241 : 8d 01 d6 STA $d601 
8244 : a9 20 __ LDA #$20
8246 : 8d 00 d6 STA $d600 
.l894:
8249 : 2c 00 d6 BIT $d600 
824c : 10 fb __ BPL $8249 ; (vdcwin_printline.l894 + 0)
.s85:
824e : a5 4a __ LDA T9 + 1 
8250 : 8d 01 d6 STA $d601 
8253 : a9 21 __ LDA #$21
8255 : 8d 00 d6 STA $d600 
.l896:
8258 : 2c 00 d6 BIT $d600 
825b : 10 fb __ BPL $8258 ; (vdcwin_printline.l896 + 0)
.s90:
825d : a5 49 __ LDA T9 + 0 
825f : 8d 01 d6 STA $d601 
8262 : a9 1f __ LDA #$1f
8264 : 8d 00 d6 STA $d600 
8267 : a9 1e __ LDA #$1e
8269 : 8d 00 d6 STA $d600 
.l898:
826c : 2c 00 d6 BIT $d600 
826f : 10 fb __ BPL $826c ; (vdcwin_printline.l898 + 0)
.s96:
8271 : a5 5a __ LDA T4 + 0 
8273 : 8d 01 d6 STA $d601 
8276 : a9 12 __ LDA #$12
8278 : 8d 00 d6 STA $d600 
.l900:
827b : 2c 00 d6 BIT $d600 
827e : 10 fb __ BPL $827b ; (vdcwin_printline.l900 + 0)
.s149:
8280 : a5 44 __ LDA T5 + 1 
8282 : 8d 01 d6 STA $d601 
8285 : a9 13 __ LDA #$13
8287 : 8d 00 d6 STA $d600 
.l902:
828a : 2c 00 d6 BIT $d600 
828d : 10 fb __ BPL $828a ; (vdcwin_printline.l902 + 0)
.s154:
828f : 8e 01 d6 STX $d601 
8292 : a9 1f __ LDA #$1f
8294 : 8d 00 d6 STA $d600 
8297 : a9 18 __ LDA #$18
8299 : 8d 00 d6 STA $d600 
.l904:
829c : 2c 00 d6 BIT $d600 
829f : 10 fb __ BPL $829c ; (vdcwin_printline.l904 + 0)
.s161:
82a1 : ad 01 d6 LDA $d601 
82a4 : 09 80 __ ORA #$80
82a6 : 85 49 __ STA T9 + 0 
82a8 : a9 18 __ LDA #$18
82aa : 8d 00 d6 STA $d600 
.l906:
82ad : 2c 00 d6 BIT $d600 
82b0 : 10 fb __ BPL $82ad ; (vdcwin_printline.l906 + 0)
.s167:
82b2 : a5 49 __ LDA T9 + 0 
82b4 : 8d 01 d6 STA $d601 
82b7 : a9 20 __ LDA #$20
82b9 : 8d 00 d6 STA $d600 
.l908:
82bc : 2c 00 d6 BIT $d600 
82bf : 10 fb __ BPL $82bc ; (vdcwin_printline.l908 + 0)
.s172:
82c1 : a5 46 __ LDA T7 + 1 
82c3 : 8d 01 d6 STA $d601 
82c6 : a9 21 __ LDA #$21
82c8 : 8d 00 d6 STA $d600 
.l910:
82cb : 2c 00 d6 BIT $d600 
82ce : 10 fb __ BPL $82cb ; (vdcwin_printline.l910 + 0)
.s177:
82d0 : 8c 01 d6 STY $d601 
82d3 : a9 1f __ LDA #$1f
82d5 : 8d 00 d6 STA $d600 
82d8 : a9 1e __ LDA #$1e
82da : 8d 00 d6 STA $d600 
.l912:
82dd : 2c 00 d6 BIT $d600 
82e0 : 10 fb __ BPL $82dd ; (vdcwin_printline.l912 + 0)
.s183:
82e2 : a5 5a __ LDA T4 + 0 
82e4 : 8d 01 d6 STA $d601 
82e7 : ad f9 8a LDA $8af9 ; (vdc_state + 3)
82ea : 18 __ __ CLC
82eb : 65 58 __ ADC T3 + 0 
82ed : 85 58 __ STA T3 + 0 
82ef : ad fa 8a LDA $8afa ; (vdc_state + 4)
82f2 : 65 59 __ ADC T3 + 1 
82f4 : 85 59 __ STA T3 + 1 
82f6 : 8a __ __ TXA
82f7 : 18 __ __ CLC
82f8 : 6d f9 8a ADC $8af9 ; (vdc_state + 3)
82fb : aa __ __ TAX
82fc : a5 44 __ LDA T5 + 1 
82fe : 6d fa 8a ADC $8afa ; (vdc_state + 4)
8301 : e6 57 __ INC T2 + 0 
8303 : 4c b6 80 JMP $80b6 ; (vdcwin_printline.l5 + 0)
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->void
.s1000:
8306 : 38 __ __ SEC
8307 : a5 23 __ LDA SP + 0 
8309 : e9 0f __ SBC #$0f
830b : 85 23 __ STA SP + 0 
830d : b0 02 __ BCS $8311 ; (vdcwin_put_string.s1000 + 11)
830f : c6 24 __ DEC SP + 1 
8311 : a0 0e __ LDY #$0e
8313 : a2 08 __ LDX #$08
8315 : b5 53 __ LDA T0 + 0,x 
8317 : 91 23 __ STA (SP + 0),y 
8319 : 88 __ __ DEY
831a : ca __ __ DEX
831b : 10 f8 __ BPL $8315 ; (vdcwin_put_string.s1000 + 15)
.s0:
831d : a9 00 __ LDA #$00
831f : 85 53 __ STA T0 + 0 
8321 : a0 11 __ LDY #$11
8323 : b1 23 __ LDA (SP + 0),y 
8325 : 85 54 __ STA T1 + 0 
8327 : c8 __ __ INY
8328 : b1 23 __ LDA (SP + 0),y 
832a : 85 55 __ STA T1 + 1 
832c : a0 04 __ LDY #$04
832e : b1 54 __ LDA (T1 + 0),y 
8330 : 85 56 __ STA T2 + 0 
8332 : c8 __ __ INY
8333 : b1 54 __ LDA (T1 + 0),y 
8335 : 85 57 __ STA T3 + 0 
8337 : a0 13 __ LDY #$13
8339 : b1 23 __ LDA (SP + 0),y 
833b : 85 58 __ STA T4 + 0 
833d : c8 __ __ INY
833e : b1 23 __ LDA (SP + 0),y 
8340 : 85 59 __ STA T4 + 1 
.l2:
8342 : a4 53 __ LDY T0 + 0 
8344 : b1 58 __ LDA (T4 + 0),y 
8346 : d0 5b __ BNE $83a3 ; (vdcwin_put_string.s3 + 0)
.s4:
8348 : a0 04 __ LDY #$04
834a : b1 54 __ LDA (T1 + 0),y 
834c : 18 __ __ CLC
834d : 65 53 __ ADC T0 + 0 
834f : 91 54 __ STA (T1 + 0),y 
8351 : a0 02 __ LDY #$02
8353 : d1 54 __ CMP (T1 + 0),y 
8355 : 90 34 __ BCC $838b ; (vdcwin_put_string.s1001 + 0)
.s41:
8357 : a9 00 __ LDA #$00
8359 : a0 04 __ LDY #$04
835b : 91 54 __ STA (T1 + 0),y 
835d : c8 __ __ INY
835e : b1 54 __ LDA (T1 + 0),y 
8360 : 85 53 __ STA T0 + 0 
8362 : 18 __ __ CLC
8363 : 69 01 __ ADC #$01
8365 : 91 54 __ STA (T1 + 0),y 
8367 : a0 03 __ LDY #$03
8369 : d1 54 __ CMP (T1 + 0),y 
836b : d0 1e __ BNE $838b ; (vdcwin_put_string.s1001 + 0)
.s44:
836d : a5 53 __ LDA T0 + 0 
836f : a0 05 __ LDY #$05
8371 : 91 54 __ STA (T1 + 0),y 
8373 : a5 54 __ LDA T1 + 0 
8375 : a0 02 __ LDY #$02
8377 : 91 23 __ STA (SP + 0),y 
8379 : a5 55 __ LDA T1 + 1 
837b : c8 __ __ INY
837c : 91 23 __ STA (SP + 0),y 
837e : a9 fd __ LDA #$fd
8380 : c8 __ __ INY
8381 : 91 23 __ STA (SP + 0),y 
8383 : a9 5e __ LDA #$5e
8385 : c8 __ __ INY
8386 : 91 23 __ STA (SP + 0),y 
8388 : 20 35 80 JSR $8035 ; (vdcwin_printline.s1000 + 0)
.s1001:
838b : a0 0e __ LDY #$0e
838d : a2 08 __ LDX #$08
838f : b1 23 __ LDA (SP + 0),y 
8391 : 95 53 __ STA T0 + 0,x 
8393 : 88 __ __ DEY
8394 : ca __ __ DEX
8395 : 10 f8 __ BPL $838f ; (vdcwin_put_string.s1001 + 4)
8397 : 18 __ __ CLC
8398 : a5 23 __ LDA SP + 0 
839a : 69 0f __ ADC #$0f
839c : 85 23 __ STA SP + 0 
839e : 90 02 __ BCC $83a2 ; (vdcwin_put_string.s1001 + 23)
83a0 : e6 24 __ INC SP + 1 
83a2 : 60 __ __ RTS
.s3:
83a3 : 4a __ __ LSR
83a4 : 4a __ __ LSR
83a5 : 4a __ __ LSR
83a6 : 4a __ __ LSR
83a7 : 4a __ __ LSR
83a8 : aa __ __ TAX
83a9 : bd de 8a LDA $8ade,x ; (p2smap + 0)
83ac : 51 58 __ EOR (T4 + 0),y 
83ae : 85 5a __ STA T7 + 0 
83b0 : a5 56 __ LDA T2 + 0 
83b2 : 18 __ __ CLC
83b3 : a0 00 __ LDY #$00
83b5 : 71 54 __ ADC (T1 + 0),y 
83b7 : 18 __ __ CLC
83b8 : 65 53 __ ADC T0 + 0 
83ba : 85 0d __ STA P0 ; (win + 0)
83bc : a5 57 __ LDA T3 + 0 
83be : 18 __ __ CLC
83bf : c8 __ __ INY
83c0 : 71 54 __ ADC (T1 + 0),y 
83c2 : 85 0e __ STA P1 ; (win + 1)
83c4 : ad fd 8a LDA $8afd ; (vdc_state + 7)
83c7 : 85 5b __ STA T8 + 0 
83c9 : 20 7b 56 JSR $567b ; (vdc_coords.s0 + 0)
83cc : a9 12 __ LDA #$12
83ce : 8d 00 d6 STA $d600 
83d1 : 18 __ __ CLC
83d2 : a5 1b __ LDA ACCU + 0 
83d4 : 6d fe 8a ADC $8afe ; (vdc_state + 8)
83d7 : aa __ __ TAX
83d8 : a5 1c __ LDA ACCU + 1 
83da : 6d ff 8a ADC $8aff ; (vdc_state + 9)
.l186:
83dd : 2c 00 d6 BIT $d600 
83e0 : 10 fb __ BPL $83dd ; (vdcwin_put_string.l186 + 0)
.s14:
83e2 : 8d 01 d6 STA $d601 
83e5 : a9 13 __ LDA #$13
83e7 : 8d 00 d6 STA $d600 
.l188:
83ea : 2c 00 d6 BIT $d600 
83ed : 10 fb __ BPL $83ea ; (vdcwin_put_string.l188 + 0)
.s19:
83ef : 8e 01 d6 STX $d601 
83f2 : a9 1f __ LDA #$1f
83f4 : 8d 00 d6 STA $d600 
.l190:
83f7 : 2c 00 d6 BIT $d600 
83fa : 10 fb __ BPL $83f7 ; (vdcwin_put_string.l190 + 0)
.s23:
83fc : a5 5a __ LDA T7 + 0 
83fe : 8d 01 d6 STA $d601 
8401 : ad 00 8b LDA $8b00 ; (vdc_state + 10)
8404 : 18 __ __ CLC
8405 : 65 1b __ ADC ACCU + 0 
8407 : a2 12 __ LDX #$12
8409 : 8e 00 d6 STX $d600 
840c : aa __ __ TAX
840d : ad 01 8b LDA $8b01 ; (vdc_state + 11)
8410 : 65 1c __ ADC ACCU + 1 
.l192:
8412 : 2c 00 d6 BIT $d600 
8415 : 10 fb __ BPL $8412 ; (vdcwin_put_string.l192 + 0)
.s30:
8417 : 8d 01 d6 STA $d601 
841a : a9 13 __ LDA #$13
841c : 8d 00 d6 STA $d600 
.l194:
841f : 2c 00 d6 BIT $d600 
8422 : 10 fb __ BPL $841f ; (vdcwin_put_string.l194 + 0)
.s35:
8424 : 8e 01 d6 STX $d601 
8427 : a9 1f __ LDA #$1f
8429 : 8d 00 d6 STA $d600 
.l196:
842c : 2c 00 d6 BIT $d600 
842f : 10 fb __ BPL $842c ; (vdcwin_put_string.l196 + 0)
.s39:
8431 : a5 5b __ LDA T8 + 0 
8433 : 8d 01 d6 STA $d601 
8436 : e6 53 __ INC T0 + 0 
8438 : 4c 42 83 JMP $8342 ; (vdcwin_put_string.l2 + 0)
--------------------------------------------------------------------
843b : __ __ __ BYT 6d 4f 56 45 20 42 59 20 77 2c 61 2c 73 2c 64 20 : mOVE BY w,a,s,d 
844b : __ __ __ BYT 4f 52 20 43 55 52 53 4f 52 20 4b 45 59 53 2e 20 : OR CURSOR KEYS. 
845b : __ __ __ BYT 65 73 63 20 4f 52 20 73 74 6f 70 20 54 4f 20 45 : esc OR stop TO E
846b : __ __ __ BYT 58 49 54 2e 00                                  : XIT..
--------------------------------------------------------------------
8470 : __ __ __ BYT 70 45 54 53 43 49 49 20 41 52 54 20 43 52 45 44 : pETSCII ART CRED
8480 : __ __ __ BYT 49 54 3a 20 27 6c 4f 56 45 20 49 53 20 54 48 45 : IT: 'lOVE IS THE
8490 : __ __ __ BYT 20 44 52 55 47 27 20 61 54 4c 41 4e 54 49 53 2c :  DRUG' aTLANTIS,
84a0 : __ __ __ BYT 20 32 30 32 33 2c 20 61 52 54 20 42 59 20 6c 4f :  2023, aRT BY lO
84b0 : __ __ __ BYT 42 4f 2e 00                                     : BO..
--------------------------------------------------------------------
mul16by8: ; mul16by8
84b4 : a0 00 __ LDY #$00
84b6 : 84 06 __ STY WORK + 3 
84b8 : 4a __ __ LSR
84b9 : 90 0d __ BCC $84c8 ; (mul16by8 + 20)
84bb : aa __ __ TAX
84bc : 18 __ __ CLC
84bd : 98 __ __ TYA
84be : 65 1b __ ADC ACCU + 0 
84c0 : a8 __ __ TAY
84c1 : a5 06 __ LDA WORK + 3 
84c3 : 65 1c __ ADC ACCU + 1 
84c5 : 85 06 __ STA WORK + 3 
84c7 : 8a __ __ TXA
84c8 : 06 1b __ ASL ACCU + 0 
84ca : 26 1c __ ROL ACCU + 1 
84cc : 4a __ __ LSR
84cd : b0 ec __ BCS $84bb ; (mul16by8 + 7)
84cf : d0 f7 __ BNE $84c8 ; (mul16by8 + 20)
84d1 : 84 05 __ STY WORK + 2 
84d3 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
84d4 : a0 00 __ LDY #$00
84d6 : 84 06 __ STY WORK + 3 
84d8 : a5 03 __ LDA WORK + 0 
84da : a6 04 __ LDX WORK + 1 
84dc : f0 1c __ BEQ $84fa ; (mul16 + 38)
84de : 38 __ __ SEC
84df : 6a __ __ ROR
84e0 : 90 0d __ BCC $84ef ; (mul16 + 27)
84e2 : aa __ __ TAX
84e3 : 18 __ __ CLC
84e4 : 98 __ __ TYA
84e5 : 65 1b __ ADC ACCU + 0 
84e7 : a8 __ __ TAY
84e8 : a5 06 __ LDA WORK + 3 
84ea : 65 1c __ ADC ACCU + 1 
84ec : 85 06 __ STA WORK + 3 
84ee : 8a __ __ TXA
84ef : 06 1b __ ASL ACCU + 0 
84f1 : 26 1c __ ROL ACCU + 1 
84f3 : 4a __ __ LSR
84f4 : 90 f9 __ BCC $84ef ; (mul16 + 27)
84f6 : d0 ea __ BNE $84e2 ; (mul16 + 14)
84f8 : a5 04 __ LDA WORK + 1 
84fa : 4a __ __ LSR
84fb : 90 0d __ BCC $850a ; (mul16 + 54)
84fd : aa __ __ TAX
84fe : 18 __ __ CLC
84ff : 98 __ __ TYA
8500 : 65 1b __ ADC ACCU + 0 
8502 : a8 __ __ TAY
8503 : a5 06 __ LDA WORK + 3 
8505 : 65 1c __ ADC ACCU + 1 
8507 : 85 06 __ STA WORK + 3 
8509 : 8a __ __ TXA
850a : 06 1b __ ASL ACCU + 0 
850c : 26 1c __ ROL ACCU + 1 
850e : 4a __ __ LSR
850f : b0 ec __ BCS $84fd ; (mul16 + 41)
8511 : d0 f7 __ BNE $850a ; (mul16 + 54)
8513 : 84 05 __ STY WORK + 2 
8515 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
8516 : a5 1c __ LDA ACCU + 1 
8518 : d0 31 __ BNE $854b ; (divmod + 53)
851a : a5 04 __ LDA WORK + 1 
851c : d0 1e __ BNE $853c ; (divmod + 38)
851e : 85 06 __ STA WORK + 3 
8520 : a2 04 __ LDX #$04
8522 : 06 1b __ ASL ACCU + 0 
8524 : 2a __ __ ROL
8525 : c5 03 __ CMP WORK + 0 
8527 : 90 02 __ BCC $852b ; (divmod + 21)
8529 : e5 03 __ SBC WORK + 0 
852b : 26 1b __ ROL ACCU + 0 
852d : 2a __ __ ROL
852e : c5 03 __ CMP WORK + 0 
8530 : 90 02 __ BCC $8534 ; (divmod + 30)
8532 : e5 03 __ SBC WORK + 0 
8534 : 26 1b __ ROL ACCU + 0 
8536 : ca __ __ DEX
8537 : d0 eb __ BNE $8524 ; (divmod + 14)
8539 : 85 05 __ STA WORK + 2 
853b : 60 __ __ RTS
853c : a5 1b __ LDA ACCU + 0 
853e : 85 05 __ STA WORK + 2 
8540 : a5 1c __ LDA ACCU + 1 
8542 : 85 06 __ STA WORK + 3 
8544 : a9 00 __ LDA #$00
8546 : 85 1b __ STA ACCU + 0 
8548 : 85 1c __ STA ACCU + 1 
854a : 60 __ __ RTS
854b : a5 04 __ LDA WORK + 1 
854d : d0 1f __ BNE $856e ; (divmod + 88)
854f : a5 03 __ LDA WORK + 0 
8551 : 30 1b __ BMI $856e ; (divmod + 88)
8553 : a9 00 __ LDA #$00
8555 : 85 06 __ STA WORK + 3 
8557 : a2 10 __ LDX #$10
8559 : 06 1b __ ASL ACCU + 0 
855b : 26 1c __ ROL ACCU + 1 
855d : 2a __ __ ROL
855e : c5 03 __ CMP WORK + 0 
8560 : 90 02 __ BCC $8564 ; (divmod + 78)
8562 : e5 03 __ SBC WORK + 0 
8564 : 26 1b __ ROL ACCU + 0 
8566 : 26 1c __ ROL ACCU + 1 
8568 : ca __ __ DEX
8569 : d0 f2 __ BNE $855d ; (divmod + 71)
856b : 85 05 __ STA WORK + 2 
856d : 60 __ __ RTS
856e : a9 00 __ LDA #$00
8570 : 85 05 __ STA WORK + 2 
8572 : 85 06 __ STA WORK + 3 
8574 : 84 02 __ STY $02 
8576 : a0 10 __ LDY #$10
8578 : 18 __ __ CLC
8579 : 26 1b __ ROL ACCU + 0 
857b : 26 1c __ ROL ACCU + 1 
857d : 26 05 __ ROL WORK + 2 
857f : 26 06 __ ROL WORK + 3 
8581 : 38 __ __ SEC
8582 : a5 05 __ LDA WORK + 2 
8584 : e5 03 __ SBC WORK + 0 
8586 : aa __ __ TAX
8587 : a5 06 __ LDA WORK + 3 
8589 : e5 04 __ SBC WORK + 1 
858b : 90 04 __ BCC $8591 ; (divmod + 123)
858d : 86 05 __ STX WORK + 2 
858f : 85 06 __ STA WORK + 3 
8591 : 88 __ __ DEY
8592 : d0 e5 __ BNE $8579 ; (divmod + 99)
8594 : 26 1b __ ROL ACCU + 0 
8596 : 26 1c __ ROL ACCU + 1 
8598 : a4 02 __ LDY $02 
859a : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
859b : 84 02 __ STY $02 
859d : a0 20 __ LDY #$20
859f : a9 00 __ LDA #$00
85a1 : 85 07 __ STA WORK + 4 
85a3 : 85 08 __ STA WORK + 5 
85a5 : 85 09 __ STA WORK + 6 
85a7 : 85 0a __ STA WORK + 7 
85a9 : a5 05 __ LDA WORK + 2 
85ab : 05 06 __ ORA WORK + 3 
85ad : d0 39 __ BNE $85e8 ; (divmod32 + 77)
85af : 18 __ __ CLC
85b0 : 26 1b __ ROL ACCU + 0 
85b2 : 26 1c __ ROL ACCU + 1 
85b4 : 26 1d __ ROL ACCU + 2 
85b6 : 26 1e __ ROL ACCU + 3 
85b8 : 26 07 __ ROL WORK + 4 
85ba : 26 08 __ ROL WORK + 5 
85bc : 90 0c __ BCC $85ca ; (divmod32 + 47)
85be : a5 07 __ LDA WORK + 4 
85c0 : e5 03 __ SBC WORK + 0 
85c2 : aa __ __ TAX
85c3 : a5 08 __ LDA WORK + 5 
85c5 : e5 04 __ SBC WORK + 1 
85c7 : 38 __ __ SEC
85c8 : b0 0c __ BCS $85d6 ; (divmod32 + 59)
85ca : 38 __ __ SEC
85cb : a5 07 __ LDA WORK + 4 
85cd : e5 03 __ SBC WORK + 0 
85cf : aa __ __ TAX
85d0 : a5 08 __ LDA WORK + 5 
85d2 : e5 04 __ SBC WORK + 1 
85d4 : 90 04 __ BCC $85da ; (divmod32 + 63)
85d6 : 86 07 __ STX WORK + 4 
85d8 : 85 08 __ STA WORK + 5 
85da : 88 __ __ DEY
85db : d0 d3 __ BNE $85b0 ; (divmod32 + 21)
85dd : 26 1b __ ROL ACCU + 0 
85df : 26 1c __ ROL ACCU + 1 
85e1 : 26 1d __ ROL ACCU + 2 
85e3 : 26 1e __ ROL ACCU + 3 
85e5 : a4 02 __ LDY $02 
85e7 : 60 __ __ RTS
85e8 : 18 __ __ CLC
85e9 : 26 1b __ ROL ACCU + 0 
85eb : 26 1c __ ROL ACCU + 1 
85ed : 26 1d __ ROL ACCU + 2 
85ef : 26 1e __ ROL ACCU + 3 
85f1 : 26 07 __ ROL WORK + 4 
85f3 : 26 08 __ ROL WORK + 5 
85f5 : 26 09 __ ROL WORK + 6 
85f7 : 26 0a __ ROL WORK + 7 
85f9 : a5 07 __ LDA WORK + 4 
85fb : c5 03 __ CMP WORK + 0 
85fd : a5 08 __ LDA WORK + 5 
85ff : e5 04 __ SBC WORK + 1 
8601 : a5 09 __ LDA WORK + 6 
8603 : e5 05 __ SBC WORK + 2 
8605 : a5 0a __ LDA WORK + 7 
8607 : e5 06 __ SBC WORK + 3 
8609 : 90 18 __ BCC $8623 ; (divmod32 + 136)
860b : a5 07 __ LDA WORK + 4 
860d : e5 03 __ SBC WORK + 0 
860f : 85 07 __ STA WORK + 4 
8611 : a5 08 __ LDA WORK + 5 
8613 : e5 04 __ SBC WORK + 1 
8615 : 85 08 __ STA WORK + 5 
8617 : a5 09 __ LDA WORK + 6 
8619 : e5 05 __ SBC WORK + 2 
861b : 85 09 __ STA WORK + 6 
861d : a5 0a __ LDA WORK + 7 
861f : e5 06 __ SBC WORK + 3 
8621 : 85 0a __ STA WORK + 7 
8623 : 88 __ __ DEY
8624 : d0 c3 __ BNE $85e9 ; (divmod32 + 78)
8626 : 26 1b __ ROL ACCU + 0 
8628 : 26 1c __ ROL ACCU + 1 
862a : 26 1d __ ROL ACCU + 2 
862c : 26 1e __ ROL ACCU + 3 
862e : a4 02 __ LDY $02 
8630 : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
8631 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
__multab13L:
8637 : __ __ __ BYT 00 0d 1a 27                                     : ...'
--------------------------------------------------------------------
__multab102L:
863b : __ __ __ BYT 00 66 cc 32 98 fe 64                            : .f.2..d
--------------------------------------------------------------------
__multab102H:
8642 : __ __ __ BYT 00 00 00 01 01 01 02                            : .......
--------------------------------------------------------------------
__multab6L:
8649 : __ __ __ BYT 00 06 0c 12 18                                  : .....
--------------------------------------------------------------------
__multab15L:
864e : __ __ __ BYT 00 0f 1e 2d 3c                                  : ...-<
--------------------------------------------------------------------
__multab9L:
8653 : __ __ __ BYT 00 09 12 1b 24 2d                               : ....$-
--------------------------------------------------------------------
vdc_coords@proxy: ; vdc_coords@proxy
8659 : a9 0a __ LDA #$0a
865b : 85 0d __ STA P0 
865d : a9 09 __ LDA #$09
865f : 85 0e __ STA P1 
8661 : 4c 7b 56 JMP $567b ; (vdc_coords.s0 + 0)
--------------------------------------------------------------------
winStyles:
8664 : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
8674 : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
menubar:
8676 : __ __ __ BYT 73 45 54 54 49 4e 47 53 00 77 49 4e 44 4f 57 53 : sETTINGS.wINDOWS
8686 : __ __ __ BYT 00 00 76 49 45 57 50 4f 52 54 00 73 43 52 4f 4c : ..vIEWPORT.sCROL
8696 : __ __ __ BYT 4c 00 00 00 63 48 41 52 53 45 54 00 00 00 00 00 : L...cHARSET.....
86a6 : __ __ __ BYT 00 00 01                                        : ...
--------------------------------------------------------------------
pulldown_options:
86a9 : __ __ __ BYT 03 02 02 02 01 02 06                            : .......
--------------------------------------------------------------------
86b0 : __ __ __ BYT 42 4c 55 45 20 4a 41 59 00 00 00 00 00 00 00 43 : BLUE JAY.......C
86c0 : __ __ __ BYT 41 52 44 49 4e 41 4c 00 00 00 00 00 00 00 45 41 : ARDINAL.......EA
86d0 : __ __ __ BYT 53 54 45 52 4e 20 50 48 4f 45 42 45 00 47 52 41 : STERN PHOEBE.GRA
86e0 : __ __ __ BYT 43 4b 4c 45 00 00 00 00 00 00 00 00 53 41 4e 44 : CKLE........SAND
86f0 : __ __ __ BYT 48 49 4c 4c 20 43 52 41 4e 45 00                : HILL CRANE.
--------------------------------------------------------------------
vdc_modes:
8700 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
8710 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
8720 : __ __ __ BYT e7 24 7e ff 50 00 32 00 00 00 00 00 10 00 40 00 : .$~.P.2.......@.
8730 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
8740 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
8750 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
8760 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
8770 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
8780 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
8790 : __ __ __ BYT 50 00 32 00 00 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
87a0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
87b0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
87c0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
87d0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
pulldown_titles:
87d8 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 00 00 00 00 00 00 : sCREENMODE......
87e8 : __ __ __ BYT 00 69 4e 46 4f 20 20 20 20 20 20 00 00 00 00 00 : .iNFO      .....
87f8 : __ __ __ BYT 00 00 65 58 49 54 20 20 20 20 20 20 00 00 00 00 : ..eXIT      ....
8808 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8818 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8828 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8838 : __ __ __ BYT 00 00 00 00 00 00 77 49 4e 44 4f 57 20 4f 4e 20 : ......wINDOW ON 
8848 : __ __ __ BYT 57 49 4e 44 4f 57 00 74 45 58 54 20 45 4e 54 52 : WINDOW.tEXT ENTR
8858 : __ __ __ BYT 59 20 20 20 20 20 20 00 00 00 00 00 00 00 00 00 : Y      .........
8868 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8878 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8888 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8898 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 73 43 52 45 : ............sCRE
88a8 : __ __ __ BYT 45 4e 20 31 00 00 00 00 00 00 00 00 00 73 43 52 : EN 1.........sCR
88b8 : __ __ __ BYT 45 45 4e 20 32 00 00 00 00 00 00 00 00 00 00 00 : EEN 2...........
88c8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
88d8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
88e8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
88f8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8908 : __ __ __ BYT 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 31 00 00 : ..fULLSCREEN 1..
8918 : __ __ __ BYT 00 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 32 00 : ...fULLSCREEN 2.
8928 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8938 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8948 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8958 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8968 : __ __ __ BYT 00 00 00 00 00 00 00 00 63 48 41 52 53 45 54 20 : ........cHARSET 
8978 : __ __ __ BYT 44 45 4d 4f 00 00 00 00 00 00 00 00 00 00 00 00 : DEMO............
8988 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8998 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
89a8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
89b8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
89c8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 79 45 : ..............yE
89d8 : __ __ __ BYT 53 00 00 00 00 00 00 00 00 00 00 00 00 00 00 6e : S..............n
89e8 : __ __ __ BYT 4f 20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : O ..............
89f8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8a08 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8a18 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8a28 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8a38 : __ __ __ BYT 00 00 00 00 70 61 6c 20 20 38 30 58 32 35 00 00 : ....pal  80X25..
8a48 : __ __ __ BYT 00 00 00 00 00 70 61 6c 20 20 38 30 58 35 30 00 : .....pal  80X50.
8a58 : __ __ __ BYT 00 00 00 00 00 00 70 61 6c 20 20 38 30 58 37 30 : ......pal  80X70
8a68 : __ __ __ BYT 00 00 00 00 00 00 00 6e 74 73 63 20 38 30 58 32 : .......ntsc 80X2
8a78 : __ __ __ BYT 35 00 00 00 00 00 00 00 6e 74 73 63 20 38 30 58 : 5.......ntsc 80X
8a88 : __ __ __ BYT 35 30 00 00 00 00 00 00 00 6e 74 73 63 20 38 30 : 50.......ntsc 80
8a98 : __ __ __ BYT 58 37 30 00 00 00 00 00 00 00                   : X70.......
--------------------------------------------------------------------
8aa2 : __ __ __ BYT 46 4c 49 45 53 00 4a 55 4d 50 53 00 53 4c 45 45 : FLIES.JUMPS.SLEE
8ab2 : __ __ __ BYT 50 53 45 41 54 53 00 00 57 41 4c 4b 53 00       : PSEATS..WALKS.
--------------------------------------------------------------------
8ac0 : __ __ __ BYT 42 49 47 00 00 00 53 4d 41 4c 4c 00 41 4e 47 52 : BIG...SMALL.ANGR
8ad0 : __ __ __ BYT 59 00 57 45 54 00 00 00 48 41 50 50 59 00       : Y.WET...HAPPY.
--------------------------------------------------------------------
p2smap:
8ade : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
screenset:
8ae6 : __ __ __ BYT 00 40 50 96 00 a0 a0 4b                         : .@P....K
--------------------------------------------------------------------
winCfg:
8aee : __ __ __ BSS	8
--------------------------------------------------------------------
vdc_state:
8af6 : __ __ __ BSS	25
--------------------------------------------------------------------
multab:
8b0f : __ __ __ BSS	144
--------------------------------------------------------------------
krnio_pstatus:
8b9f : __ __ __ BSS	16
--------------------------------------------------------------------
linebuffer:
8baf : __ __ __ BSS	81
--------------------------------------------------------------------
windows:
8c00 : __ __ __ BSS	39
--------------------------------------------------------------------
bnk_redef_charset: ; bnk_redef_charset(u16,u8,u8*,u16)->void
.s0:
01:1300 : ad 00 ff LDA $ff00 
01:1303 : 85 1b __ STA ACCU + 0 
01:1305 : a9 0e __ LDA #$0e
01:1307 : 8d 00 ff STA $ff00 
01:130a : a9 12 __ LDA #$12
01:130c : 8d 00 d6 STA $d600 
01:130f : a9 00 __ LDA #$00
01:1311 : 85 43 __ STA T3 + 0 
01:1313 : 85 45 __ STA T4 + 0 
01:1315 : a9 02 __ LDA #$02
01:1317 : 85 44 __ STA T3 + 1 
01:1319 : a9 d0 __ LDA #$d0
01:131b : 85 46 __ STA T4 + 1 
.l166:
01:131d : 2c 00 d6 BIT $d600 
01:1320 : 10 fb __ BPL $131d ; (bnk_redef_charset.l166 + 0)
.s6:
01:1322 : a5 0e __ LDA P1 ; (vdcdest + 1)
01:1324 : 8d 01 d6 STA $d601 
01:1327 : a9 13 __ LDA #$13
01:1329 : 8d 00 d6 STA $d600 
.l168:
01:132c : 2c 00 d6 BIT $d600 
01:132f : 10 fb __ BPL $132c ; (bnk_redef_charset.l168 + 0)
.s11:
01:1331 : a5 0d __ LDA P0 ; (vdcdest + 0)
01:1333 : 8d 01 d6 STA $d601 
01:1336 : a9 1f __ LDA #$1f
01:1338 : 8d 00 d6 STA $d600 
.l14:
01:133b : a2 08 __ LDX #$08
.l17:
01:133d : a9 01 __ LDA #$01
01:133f : 8d 00 ff STA $ff00 
01:1342 : a0 00 __ LDY #$00
01:1344 : b1 45 __ LDA (T4 + 0),y 
01:1346 : a0 0e __ LDY #$0e
01:1348 : 8c 00 ff STY $ff00 
01:134b : a8 __ __ TAY
01:134c : e6 45 __ INC T4 + 0 
01:134e : d0 02 __ BNE $1352 ; (bnk_redef_charset.l170 + 0)
.s1013:
01:1350 : e6 46 __ INC T4 + 1 
.l170:
01:1352 : 2c 00 d6 BIT $d600 
01:1355 : 10 fb __ BPL $1352 ; (bnk_redef_charset.l170 + 0)
.s22:
01:1357 : 8c 01 d6 STY $d601 
01:135a : ca __ __ DEX
01:135b : d0 e0 __ BNE $133d ; (bnk_redef_charset.l17 + 0)
.s19:
01:135d : a2 08 __ LDX #$08
.l24:
01:135f : 2c 00 d6 BIT $d600 
01:1362 : 10 fb __ BPL $135f ; (bnk_redef_charset.l24 + 0)
.s29:
01:1364 : a9 00 __ LDA #$00
01:1366 : 8d 01 d6 STA $d601 
01:1369 : ca __ __ DEX
01:136a : d0 f3 __ BNE $135f ; (bnk_redef_charset.l24 + 0)
.s26:
01:136c : a5 43 __ LDA T3 + 0 
01:136e : d0 02 __ BNE $1372 ; (bnk_redef_charset.s1011 + 0)
.s1010:
01:1370 : c6 44 __ DEC T3 + 1 
.s1011:
01:1372 : c6 43 __ DEC T3 + 0 
01:1374 : d0 c5 __ BNE $133b ; (bnk_redef_charset.l14 + 0)
.s1012:
01:1376 : a5 44 __ LDA T3 + 1 
01:1378 : d0 c1 __ BNE $133b ; (bnk_redef_charset.l14 + 0)
.s15:
01:137a : a5 1b __ LDA ACCU + 0 
01:137c : 8d 00 ff STA $ff00 
.s1001:
01:137f : 60 __ __ RTS
--------------------------------------------------------------------
bnk_load@proxy: ; bnk_load@proxy
01:1380 : ad fe 7b LDA $7bfe ; (bootdevice + 0)
01:1383 : 85 0f __ STA P2 
01:1385 : a9 00 __ LDA #$00
01:1387 : 85 10 __ STA P3 
--------------------------------------------------------------------
bnk_load: ; bnk_load(u8,u8,const u8*,const u8*)->bool
.s0:
01:1389 : a9 01 __ LDA #$01
01:138b : 85 0d __ STA P0 
01:138d : a9 00 __ LDA #$00
01:138f : 85 0e __ STA P1 
01:1391 : 20 25 5f JSR $5f25 ; (krnio_setbnk.s0 + 0)
01:1394 : a5 12 __ LDA P5 ; (fname + 0)
01:1396 : 85 0d __ STA P0 
01:1398 : a5 13 __ LDA P6 ; (fname + 1)
01:139a : 85 0e __ STA P1 
01:139c : 20 2c 5f JSR $5f2c ; (krnio_setnam.s0 + 0)
01:139f : a9 01 __ LDA #$01
01:13a1 : a6 0f __ LDX P2 
01:13a3 : a0 00 __ LDY #$00
01:13a5 : 20 ba ff JSR $ffba 
01:13a8 : a9 00 __ LDA #$00
01:13aa : a6 10 __ LDX P3 
01:13ac : a4 11 __ LDY P4 
01:13ae : 20 d5 ff JSR $ffd5 
01:13b1 : a9 00 __ LDA #$00
01:13b3 : b0 02 __ BCS $13b7 ; (bnk_load.s0 + 46)
01:13b5 : a9 01 __ LDA #$01
01:13b7 : 85 1b __ STA ACCU + 0 
.s1001:
01:13b9 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:13ba : a9 0e __ LDA #$0e
01:13bc : 85 0d __ STA P0 
01:13be : a9 af __ LDA #$af
01:13c0 : 85 0e __ STA P1 
01:13c2 : a9 8b __ LDA #$8b
01:13c4 : 85 0f __ STA P2 
01:13c6 : a5 59 __ LDA $59 
01:13c8 : 85 12 __ STA P5 
01:13ca : a9 00 __ LDA #$00
01:13cc : 85 13 __ STA P6 
--------------------------------------------------------------------
bnk_cpyfromvdc: ; bnk_cpyfromvdc(u8,u8*,u16,u16)->void
.s0:
01:13ce : ad 00 ff LDA $ff00 
01:13d1 : 85 1d __ STA ACCU + 2 
01:13d3 : a6 12 __ LDX P5 ; (size + 0)
.l110:
01:13d5 : 8a __ __ TXA
01:13d6 : 05 13 __ ORA P6 ; (size + 1)
01:13d8 : d0 06 __ BNE $13e0 ; (bnk_cpyfromvdc.s2 + 0)
.s3:
01:13da : a5 1d __ LDA ACCU + 2 
01:13dc : 8d 00 ff STA $ff00 
.s1001:
01:13df : 60 __ __ RTS
.s2:
01:13e0 : a9 0e __ LDA #$0e
01:13e2 : 8d 00 ff STA $ff00 
01:13e5 : a5 10 __ LDA P3 ; (vdcsrc + 0)
01:13e7 : a8 __ __ TAY
01:13e8 : 18 __ __ CLC
01:13e9 : 69 01 __ ADC #$01
01:13eb : 85 10 __ STA P3 ; (vdcsrc + 0)
01:13ed : a5 11 __ LDA P4 ; (vdcsrc + 1)
01:13ef : 85 1b __ STA ACCU + 0 
01:13f1 : 69 00 __ ADC #$00
01:13f3 : 85 11 __ STA P4 ; (vdcsrc + 1)
01:13f5 : a9 12 __ LDA #$12
01:13f7 : 8d 00 d6 STA $d600 
.l111:
01:13fa : 2c 00 d6 BIT $d600 
01:13fd : 10 fb __ BPL $13fa ; (bnk_cpyfromvdc.l111 + 0)
.s10:
01:13ff : a5 1b __ LDA ACCU + 0 
01:1401 : 8d 01 d6 STA $d601 
01:1404 : a9 13 __ LDA #$13
01:1406 : 8d 00 d6 STA $d600 
.l113:
01:1409 : 2c 00 d6 BIT $d600 
01:140c : 10 fb __ BPL $1409 ; (bnk_cpyfromvdc.l113 + 0)
.s15:
01:140e : 8c 01 d6 STY $d601 
01:1411 : a9 1f __ LDA #$1f
01:1413 : 8d 00 d6 STA $d600 
.l115:
01:1416 : 2c 00 d6 BIT $d600 
01:1419 : 10 fb __ BPL $1416 ; (bnk_cpyfromvdc.l115 + 0)
.s19:
01:141b : a5 0d __ LDA P0 ; (dcr + 0)
01:141d : ac 01 d6 LDY $d601 
01:1420 : 8d 00 ff STA $ff00 
01:1423 : a5 0e __ LDA P1 ; (dp + 0)
01:1425 : 85 1b __ STA ACCU + 0 
01:1427 : 18 __ __ CLC
01:1428 : 69 01 __ ADC #$01
01:142a : 85 0e __ STA P1 ; (dp + 0)
01:142c : a5 0f __ LDA P2 ; (dp + 1)
01:142e : 85 1c __ STA ACCU + 1 
01:1430 : 69 00 __ ADC #$00
01:1432 : 85 0f __ STA P2 ; (dp + 1)
01:1434 : 98 __ __ TYA
01:1435 : a0 00 __ LDY #$00
01:1437 : 91 1b __ STA (ACCU + 0),y 
01:1439 : ca __ __ DEX
01:143a : e0 ff __ CPX #$ff
01:143c : d0 97 __ BNE $13d5 ; (bnk_cpyfromvdc.l110 + 0)
.s1008:
01:143e : c6 13 __ DEC P6 ; (size + 1)
01:1440 : 4c d5 13 JMP $13d5 ; (bnk_cpyfromvdc.l110 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:1443 : a9 0e __ LDA #$0e
01:1445 : 85 0f __ STA P2 
01:1447 : a9 af __ LDA #$af
01:1449 : 85 10 __ STA P3 
01:144b : a9 8b __ LDA #$8b
01:144d : 85 11 __ STA P4 
01:144f : a9 00 __ LDA #$00
01:1451 : 85 13 __ STA P6 
--------------------------------------------------------------------
bnk_cpytovdc: ; bnk_cpytovdc(u16,u8,u8*,u16)->void
.s0:
01:1453 : ad 00 ff LDA $ff00 
01:1456 : 85 1b __ STA ACCU + 0 
01:1458 : a9 0e __ LDA #$0e
01:145a : 8d 00 ff STA $ff00 
01:145d : a9 12 __ LDA #$12
01:145f : 8d 00 d6 STA $d600 
.l107:
01:1462 : 2c 00 d6 BIT $d600 
01:1465 : 10 fb __ BPL $1462 ; (bnk_cpytovdc.l107 + 0)
.s6:
01:1467 : a5 0e __ LDA P1 ; (vdcdest + 1)
01:1469 : 8d 01 d6 STA $d601 
01:146c : a9 13 __ LDA #$13
01:146e : 8d 00 d6 STA $d600 
.l109:
01:1471 : 2c 00 d6 BIT $d600 
01:1474 : 10 fb __ BPL $1471 ; (bnk_cpytovdc.l109 + 0)
.s11:
01:1476 : a5 0d __ LDA P0 ; (vdcdest + 0)
01:1478 : 8d 01 d6 STA $d601 
01:147b : a9 1f __ LDA #$1f
01:147d : 8d 00 d6 STA $d600 
01:1480 : a5 12 __ LDA P5 ; (size + 0)
01:1482 : 05 13 __ ORA P6 ; (size + 1)
01:1484 : d0 06 __ BNE $148c ; (bnk_cpytovdc.s1012 + 0)
.s15:
01:1486 : a5 1b __ LDA ACCU + 0 
01:1488 : 8d 00 ff STA $ff00 
.s1001:
01:148b : 60 __ __ RTS
.s1012:
01:148c : a6 12 __ LDX P5 ; (size + 0)
.l14:
01:148e : a5 0f __ LDA P2 ; (scr + 0)
01:1490 : 8d 00 ff STA $ff00 
01:1493 : a0 00 __ LDY #$00
01:1495 : b1 10 __ LDA (P3),y ; (sp + 0)
01:1497 : a8 __ __ TAY
01:1498 : e6 10 __ INC P3 ; (sp + 0)
01:149a : d0 02 __ BNE $149e ; (bnk_cpytovdc.s1014 + 0)
.s1013:
01:149c : e6 11 __ INC P4 ; (sp + 1)
.s1014:
01:149e : a9 0e __ LDA #$0e
01:14a0 : 8d 00 ff STA $ff00 
.l112:
01:14a3 : 2c 00 d6 BIT $d600 
01:14a6 : 10 fb __ BPL $14a3 ; (bnk_cpytovdc.l112 + 0)
.s18:
01:14a8 : 8c 01 d6 STY $d601 
01:14ab : 8a __ __ TXA
01:14ac : d0 02 __ BNE $14b0 ; (bnk_cpytovdc.s1009 + 0)
.s1008:
01:14ae : c6 13 __ DEC P6 ; (size + 1)
.s1009:
01:14b0 : ca __ __ DEX
01:14b1 : d0 db __ BNE $148e ; (bnk_cpytovdc.l14 + 0)
.s1010:
01:14b3 : a5 13 __ LDA P6 ; (size + 1)
01:14b5 : d0 d7 __ BNE $148e ; (bnk_cpytovdc.l14 + 0)
01:14b7 : 4c 86 14 JMP $1486 ; (bnk_cpytovdc.s15 + 0)
--------------------------------------------------------------------
sid_startmusic: ; sid_startmusic()->void
.s0:
01:14ba : ad 00 ff LDA $ff00 
01:14bd : 85 43 __ STA T0 + 0 
01:14bf : a9 7e __ LDA #$7e
01:14c1 : 8d 00 ff STA $ff00 
01:14c4 : 78 __ __ SEI
01:14c5 : a9 7e __ LDA #$7e
01:14c7 : 8d 00 ff STA $ff00 
01:14ca : a9 00 __ LDA #$00
01:14cc : 20 00 20 JSR $2000 ; (main.l22057 + 3)
01:14cf : ad 14 03 LDA $0314 
01:14d2 : 8d 65 15 STA $1565 ; (sid_irq + 0)
01:14d5 : a9 ec __ LDA #$ec
01:14d7 : 8d 14 03 STA $0314 
01:14da : ad 15 03 LDA $0315 
01:14dd : 8d 66 15 STA $1566 ; (sid_irq + 1)
01:14e0 : a9 14 __ LDA #$14
01:14e2 : 8d 15 03 STA $0315 
01:14e5 : 58 __ __ CLI
01:14e6 : a5 43 __ LDA T0 + 0 
01:14e8 : 8d 00 ff STA $ff00 
.s1001:
01:14eb : 60 __ __ RTS
--------------------------------------------------------------------
sid_interrupt: ; sid_interrupt
01:14ec : ad 00 ff LDA $ff00 
01:14ef : 8d 67 15 STA $1567 ; (sid_oldcr + 0)
01:14f2 : a9 7e __ LDA #$7e
01:14f4 : 8d 00 ff STA $ff00 
01:14f7 : 20 03 20 JSR $2003 ; (main.s406 + 1)
01:14fa : ad 67 15 LDA $1567 ; (sid_oldcr + 0)
01:14fd : 8d 00 ff STA $ff00 
01:1500 : ad 65 15 LDA $1565 ; (sid_irq + 0)
01:1503 : 8d 0d 15 STA $150d ; (sid_interrupt + 33)
01:1506 : ad 66 15 LDA $1566 ; (sid_irq + 1)
01:1509 : 8d 0e 15 STA $150e ; (sid_interrupt + 34)
01:150c : 4c 65 fa JMP $fa65 
--------------------------------------------------------------------
sid_stopmusic: ; sid_stopmusic()->void
.s0:
01:150f : 78 __ __ SEI
01:1510 : ae 65 15 LDX $1565 ; (sid_irq + 0)
01:1513 : ac 66 15 LDY $1566 ; (sid_irq + 1)
01:1516 : 8e 14 03 STX $0314 
01:1519 : 8c 15 03 STY $0315 
01:151c : 58 __ __ CLI
01:151d : a2 18 __ LDX #$18
01:151f : a9 00 __ LDA #$00
01:1521 : 9d 00 d4 STA $d400,x 
01:1524 : ca __ __ DEX
01:1525 : 10 fa __ BPL $1521 ; (sid_stopmusic.s0 + 18)
01:1527 : a9 08 __ LDA #$08
01:1529 : 8d 04 d4 STA $d404 
01:152c : 8d 0b d4 STA $d40b 
01:152f : 8d 12 d4 STA $d412 
01:1532 : a2 03 __ LDX #$03
01:1534 : 2c 11 d0 BIT $d011 
01:1537 : 10 fb __ BPL $1534 ; (sid_stopmusic.s0 + 37)
01:1539 : 2c 11 d0 BIT $d011 
01:153c : 30 fb __ BMI $1539 ; (sid_stopmusic.s0 + 42)
01:153e : ca __ __ DEX
01:153f : 10 f3 __ BPL $1534 ; (sid_stopmusic.s0 + 37)
01:1541 : a9 00 __ LDA #$00
01:1543 : 8d 04 d4 STA $d404 
01:1546 : 8d 0b d4 STA $d40b 
01:1549 : 8d 12 d4 STA $d412 
01:154c : a9 00 __ LDA #$00
01:154e : 8d 18 d4 STA $d418 
.s1001:
01:1551 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:1552 : a9 0e __ LDA #$0e
01:1554 : 85 0d __ STA P0 
01:1556 : a9 af __ LDA #$af
01:1558 : 85 0e __ STA P1 
01:155a : a9 8b __ LDA #$8b
01:155c : 85 0f __ STA P2 
01:155e : a9 00 __ LDA #$00
01:1560 : 85 13 __ STA P6 
01:1562 : 4c ce 13 JMP $13ce ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
sid_irq:
01:1565 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
sid_oldcr:
01:1567 : __ __ __ BYT 00                                              : .
