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
1c13 : 8e fd 6e STX $6efd ; (spentry + 0)
1c16 : a9 1e __ LDA #$1e
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 83 __ LDA #$83
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 84 __ LDA #$84
1c21 : e9 83 __ SBC #$83
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
1c35 : a9 78 __ LDA #$78
1c37 : e9 1e __ SBC #$1e
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
1c8d : e9 12 __ SBC #$12
1c8f : 85 23 __ STA SP + 0 
1c91 : b0 02 __ BCS $1c95 ; (main.s0 + 0)
1c93 : c6 24 __ DEC SP + 1 
.s0:
1c95 : a9 7f __ LDA #$7f
1c97 : 8d 0d dc STA $dc0d 
1c9a : 8d 0d dd STA $dd0d 
1c9d : 8d 00 dc STA $dc00 
1ca0 : 8d 1e 83 STA $831e ; (winCfg + 0)
1ca3 : a9 08 __ LDA #$08
1ca5 : 8d 0e dc STA $dc0e 
1ca8 : 8d 0f dc STA $dc0f 
1cab : 8d 0e dd STA $dd0e 
1cae : 8d 0f dd STA $dd0f 
1cb1 : a9 00 __ LDA #$00
1cb3 : 8d 03 dc STA $dc03 
1cb6 : 8d 03 dd STA $dd03 
1cb9 : 8d 21 83 STA $8321 ; (winCfg + 3)
1cbc : 8d 23 83 STA $8323 ; (winCfg + 5)
1cbf : 8d 1f 83 STA $831f ; (winCfg + 1)
1cc2 : 8d 24 83 STA $8324 ; (winCfg + 6)
1cc5 : a9 ff __ LDA #$ff
1cc7 : 8d 02 dc STA $dc02 
1cca : a9 07 __ LDA #$07
1ccc : 8d 01 dd STA $dd01 
1ccf : a9 3f __ LDA #$3f
1cd1 : 8d 02 dd STA $dd02 
1cd4 : a9 20 __ LDA #$20
1cd6 : 8d 22 83 STA $8322 ; (winCfg + 4)
1cd9 : 8d 20 83 STA $8320 ; (winCfg + 2)
1cdc : 8d 25 83 STA $8325 ; (winCfg + 7)
1cdf : a9 1a __ LDA #$1a
1ce1 : 8d 00 d6 STA $d600 
.l19211:
1ce4 : 2c 00 d6 BIT $d600 
1ce7 : 10 fb __ BPL $1ce4 ; (main.l19211 + 0)
.s11:
1ce9 : ad 01 d6 LDA $d601 
1cec : 29 f0 __ AND #$f0
1cee : aa __ __ TAX
1cef : a9 1a __ LDA #$1a
1cf1 : 8d 00 d6 STA $d600 
.l19213:
1cf4 : 2c 00 d6 BIT $d600 
1cf7 : 10 fb __ BPL $1cf4 ; (main.l19213 + 0)
.s17:
1cf9 : 8e 01 d6 STX $d601 
1cfc : 8d 00 d6 STA $d600 
.l19215:
1cff : 2c 00 d6 BIT $d600 
1d02 : 10 fb __ BPL $1cff ; (main.l19215 + 0)
.s24:
1d04 : ad 01 d6 LDA $d601 
1d07 : 29 0f __ AND #$0f
1d09 : 09 d0 __ ORA #$d0
1d0b : a2 1a __ LDX #$1a
1d0d : 8e 00 d6 STX $d600 
.l19217:
1d10 : 2c 00 d6 BIT $d600 
1d13 : 10 fb __ BPL $1d10 ; (main.l19217 + 0)
.s30:
1d15 : 8d 01 d6 STA $d601 
1d18 : a9 8d __ LDA #$8d
1d1a : 8d 2d 83 STA $832d ; (vdc_state + 7)
1d1d : a9 1c __ LDA #$1c
1d1f : 8d 00 d6 STA $d600 
.l19219:
1d22 : 2c 00 d6 BIT $d600 
1d25 : 10 fb __ BPL $1d22 ; (main.l19219 + 0)
.s36:
1d27 : ad 01 d6 LDA $d601 
1d2a : aa __ __ TAX
1d2b : 09 10 __ ORA #$10
1d2d : a0 1c __ LDY #$1c
1d2f : 8c 00 d6 STY $d600 
.l19221:
1d32 : 2c 00 d6 BIT $d600 
1d35 : 10 fb __ BPL $1d32 ; (main.l19221 + 0)
.s43:
1d37 : 8d 01 d6 STA $d601 
1d3a : a9 12 __ LDA #$12
1d3c : 8d 00 d6 STA $d600 
.l19223:
1d3f : 2c 00 d6 BIT $d600 
1d42 : 10 fb __ BPL $1d3f ; (main.l19223 + 0)
.s50:
1d44 : a9 1f __ LDA #$1f
1d46 : 8d 01 d6 STA $d601 
1d49 : a9 13 __ LDA #$13
1d4b : 8d 00 d6 STA $d600 
.l19225:
1d4e : 2c 00 d6 BIT $d600 
1d51 : 10 fb __ BPL $1d4e ; (main.l19225 + 0)
.s55:
1d53 : a9 ff __ LDA #$ff
1d55 : 8d 01 d6 STA $d601 
1d58 : a9 1f __ LDA #$1f
1d5a : 8d 00 d6 STA $d600 
.l19227:
1d5d : 2c 00 d6 BIT $d600 
1d60 : 10 fb __ BPL $1d5d ; (main.l19227 + 0)
.s59:
1d62 : a9 00 __ LDA #$00
1d64 : 8d 01 d6 STA $d601 
1d67 : a9 12 __ LDA #$12
1d69 : 8d 00 d6 STA $d600 
.l19229:
1d6c : 2c 00 d6 BIT $d600 
1d6f : 10 fb __ BPL $1d6c ; (main.l19229 + 0)
.s66:
1d71 : a9 9f __ LDA #$9f
1d73 : 8d 01 d6 STA $d601 
1d76 : a9 13 __ LDA #$13
1d78 : 8d 00 d6 STA $d600 
.l19231:
1d7b : 2c 00 d6 BIT $d600 
1d7e : 10 fb __ BPL $1d7b ; (main.l19231 + 0)
.s71:
1d80 : a9 ff __ LDA #$ff
1d82 : 8d 01 d6 STA $d601 
1d85 : a9 1f __ LDA #$1f
1d87 : 8d 00 d6 STA $d600 
.l19233:
1d8a : 2c 00 d6 BIT $d600 
1d8d : 10 fb __ BPL $1d8a ; (main.l19233 + 0)
.s75:
1d8f : a9 ff __ LDA #$ff
1d91 : 8d 01 d6 STA $d601 
1d94 : a9 12 __ LDA #$12
1d96 : 8d 00 d6 STA $d600 
.l19235:
1d99 : 2c 00 d6 BIT $d600 
1d9c : 10 fb __ BPL $1d99 ; (main.l19235 + 0)
.s82:
1d9e : a9 1f __ LDA #$1f
1da0 : 8d 01 d6 STA $d601 
1da3 : a9 13 __ LDA #$13
1da5 : 8d 00 d6 STA $d600 
.l19237:
1da8 : 2c 00 d6 BIT $d600 
1dab : 10 fb __ BPL $1da8 ; (main.l19237 + 0)
.s87:
1dad : a9 ff __ LDA #$ff
1daf : 8d 01 d6 STA $d601 
1db2 : a9 1f __ LDA #$1f
1db4 : 8d 00 d6 STA $d600 
.l19239:
1db7 : 2c 00 d6 BIT $d600 
1dba : 10 fb __ BPL $1db7 ; (main.l19239 + 0)
.s91:
1dbc : ad 01 d6 LDA $d601 
1dbf : f0 04 __ BEQ $1dc5 ; (main.s2171 + 0)
.s2172:
1dc1 : a9 10 __ LDA #$10
1dc3 : d0 02 __ BNE $1dc7 ; (main.s2173 + 0)
.s2171:
1dc5 : a9 40 __ LDA #$40
.s2173:
1dc7 : 8d 26 83 STA $8326 ; (vdc_state + 0)
1dca : 8c 00 d6 STY $d600 
.l19242:
1dcd : 2c 00 d6 BIT $d600 
1dd0 : 10 fb __ BPL $1dcd ; (main.l19242 + 0)
.s98:
1dd2 : 8e 01 d6 STX $d601 
1dd5 : a9 00 __ LDA #$00
1dd7 : 85 55 __ STA T1 + 0 
1dd9 : ad 29 83 LDA $8329 ; (vdc_state + 3)
1ddc : 85 53 __ STA T0 + 0 
1dde : ad 2b 83 LDA $832b ; (vdc_state + 5)
1de1 : 85 57 __ STA T3 + 0 
.l101:
1de3 : a5 55 __ LDA T1 + 0 
1de5 : c5 57 __ CMP T3 + 0 
1de7 : b0 03 __ BCS $1dec ; (main.s31 + 0)
1de9 : 4c d2 4e JMP $4ed2 ; (main.s102 + 0)
.s31:
1dec : 20 bf 4f JSR $4fbf ; (screen_width.s0 + 0)
1def : c9 28 __ CMP #$28
1df1 : d0 17 __ BNE $1e0a ; (main.s174 + 0)
.s172:
1df3 : a9 00 __ LDA #$00
1df5 : a0 02 __ LDY #$02
1df7 : 91 23 __ STA (SP + 0),y 
1df9 : a9 57 __ LDA #$57
1dfb : c8 __ __ INY
1dfc : 91 23 __ STA (SP + 0),y 
1dfe : 20 c9 4f JSR $4fc9 ; (printf.s0 + 0)
1e01 : 20 f0 56 JSR $56f0 ; (getch.s0 + 0)
1e04 : 20 81 ff JSR $ff81 
1e07 : 20 5c 57 JSR $575c ; (screen_setmode.s0 + 0)
.s174:
1e0a : 20 67 57 JSR $5767 ; (bnk_init.s1000 + 0)
1e0d : a9 01 __ LDA #$01
1e0f : 20 de 58 JSR $58de ; (fastmode.s0 + 0)
1e12 : a9 00 __ LDA #$00
1e14 : 85 13 __ STA P6 
1e16 : 20 fd 58 JSR $58fd ; (vdc_set_mode.s0 + 0)
1e19 : ad 26 83 LDA $8326 ; (vdc_state + 0)
1e1c : c9 40 __ CMP #$40
1e1e : f0 03 __ BEQ $1e23 ; (main.s178 + 0)
1e20 : 4c 36 1f JMP $1f36 ; (main.s4 + 0)
.s178:
1e23 : ad 27 83 LDA $8327 ; (vdc_state + 1)
1e26 : f0 03 __ BEQ $1e2b ; (main.s182 + 0)
1e28 : 4c 36 1f JMP $1f36 ; (main.s4 + 0)
.s182:
1e2b : a9 22 __ LDA #$22
1e2d : 8d 00 d6 STA $d600 
.l20276:
1e30 : 2c 00 d6 BIT $d600 
1e33 : 10 fb __ BPL $1e30 ; (main.l20276 + 0)
.s190:
1e35 : a9 80 __ LDA #$80
1e37 : 8d 01 d6 STA $d601 
1e3a : a0 ff __ LDY #$ff
1e3c : a2 00 __ LDX #$00
.l193:
1e3e : a9 12 __ LDA #$12
1e40 : 8d 00 d6 STA $d600 
.l20278:
1e43 : 2c 00 d6 BIT $d600 
1e46 : 10 fb __ BPL $1e43 ; (main.l20278 + 0)
.s202:
1e48 : 8e 01 d6 STX $d601 
1e4b : a9 13 __ LDA #$13
1e4d : 8d 00 d6 STA $d600 
.l20280:
1e50 : 2c 00 d6 BIT $d600 
1e53 : 10 fb __ BPL $1e50 ; (main.l20280 + 0)
.s207:
1e55 : a9 00 __ LDA #$00
1e57 : 8d 01 d6 STA $d601 
1e5a : a9 1f __ LDA #$1f
1e5c : 8d 00 d6 STA $d600 
.l20282:
1e5f : 2c 00 d6 BIT $d600 
1e62 : 10 fb __ BPL $1e5f ; (main.l20282 + 0)
.s211:
1e64 : a9 00 __ LDA #$00
1e66 : 8d 01 d6 STA $d601 
1e69 : a9 18 __ LDA #$18
1e6b : 8d 00 d6 STA $d600 
.l20284:
1e6e : 2c 00 d6 BIT $d600 
1e71 : 10 fb __ BPL $1e6e ; (main.l20284 + 0)
.s217:
1e73 : ad 01 d6 LDA $d601 
1e76 : 29 7f __ AND #$7f
1e78 : 85 57 __ STA T3 + 0 
1e7a : a9 18 __ LDA #$18
1e7c : 8d 00 d6 STA $d600 
.l20286:
1e7f : 2c 00 d6 BIT $d600 
1e82 : 10 fb __ BPL $1e7f ; (main.l20286 + 0)
.s223:
1e84 : a5 57 __ LDA T3 + 0 
1e86 : 8d 01 d6 STA $d601 
1e89 : a9 1e __ LDA #$1e
1e8b : 8d 00 d6 STA $d600 
.l20288:
1e8e : 2c 00 d6 BIT $d600 
1e91 : 10 fb __ BPL $1e8e ; (main.l20288 + 0)
.s228:
1e93 : a9 ff __ LDA #$ff
1e95 : 8d 01 d6 STA $d601 
1e98 : e8 __ __ INX
1e99 : 88 __ __ DEY
1e9a : d0 a2 __ BNE $1e3e ; (main.l193 + 0)
.s195:
1e9c : a9 12 __ LDA #$12
1e9e : 8d 00 d6 STA $d600 
.l20291:
1ea1 : 2c 00 d6 BIT $d600 
1ea4 : 10 fb __ BPL $1ea1 ; (main.l20291 + 0)
.s235:
1ea6 : 8e 01 d6 STX $d601 
1ea9 : a9 13 __ LDA #$13
1eab : 8d 00 d6 STA $d600 
.l20293:
1eae : 2c 00 d6 BIT $d600 
1eb1 : 10 fb __ BPL $1eae ; (main.l20293 + 0)
.s240:
1eb3 : 8c 01 d6 STY $d601 
1eb6 : a9 1f __ LDA #$1f
1eb8 : 8d 00 d6 STA $d600 
.l20295:
1ebb : 2c 00 d6 BIT $d600 
1ebe : 10 fb __ BPL $1ebb ; (main.l20295 + 0)
.s244:
1ec0 : 8c 01 d6 STY $d601 
1ec3 : a9 18 __ LDA #$18
1ec5 : 8d 00 d6 STA $d600 
.l20297:
1ec8 : 2c 00 d6 BIT $d600 
1ecb : 10 fb __ BPL $1ec8 ; (main.l20297 + 0)
.s250:
1ecd : ad 01 d6 LDA $d601 
1ed0 : 29 7f __ AND #$7f
1ed2 : a2 18 __ LDX #$18
1ed4 : 8e 00 d6 STX $d600 
.l20299:
1ed7 : 2c 00 d6 BIT $d600 
1eda : 10 fb __ BPL $1ed7 ; (main.l20299 + 0)
.s256:
1edc : 8d 01 d6 STA $d601 
1edf : a9 1e __ LDA #$1e
1ee1 : 8d 00 d6 STA $d600 
.l20301:
1ee4 : 2c 00 d6 BIT $d600 
1ee7 : 10 fb __ BPL $1ee4 ; (main.l20301 + 0)
.s261:
1ee9 : a9 ff __ LDA #$ff
1eeb : 8d 01 d6 STA $d601 
1eee : a2 1c __ LDX #$1c
1ef0 : 8e 00 d6 STX $d600 
.l20303:
1ef3 : 2c 00 d6 BIT $d600 
1ef6 : 10 fb __ BPL $1ef3 ; (main.l20303 + 0)
.s267:
1ef8 : ad 01 d6 LDA $d601 
1efb : 09 10 __ ORA #$10
1efd : 8e 00 d6 STX $d600 
.l20305:
1f00 : 2c 00 d6 BIT $d600 
1f03 : 10 fb __ BPL $1f00 ; (main.l20305 + 0)
.s273:
1f05 : 8d 01 d6 STA $d601 
1f08 : 20 9d 5d JSR $5d9d ; (vdc_restore_charsets.s0 + 0)
1f0b : a9 00 __ LDA #$00
1f0d : 85 55 __ STA T1 + 0 
1f0f : ad 29 83 LDA $8329 ; (vdc_state + 3)
1f12 : 85 53 __ STA T0 + 0 
1f14 : ad 2b 83 LDA $832b ; (vdc_state + 5)
1f17 : 85 57 __ STA T3 + 0 
.l276:
1f19 : a5 55 __ LDA T1 + 0 
1f1b : c5 57 __ CMP T3 + 0 
1f1d : b0 03 __ BCS $1f22 ; (main.s274 + 0)
1f1f : 4c fe 4d JMP $4dfe ; (main.s277 + 0)
.s274:
1f22 : a9 22 __ LDA #$22
1f24 : 8d 00 d6 STA $d600 
.l20332:
1f27 : 2c 00 d6 BIT $d600 
1f2a : 10 fb __ BPL $1f27 ; (main.l20332 + 0)
.s352:
1f2c : a9 7d __ LDA #$7d
1f2e : 8d 01 d6 STA $d601 
1f31 : a9 01 __ LDA #$01
1f33 : 8d 27 83 STA $8327 ; (vdc_state + 1)
.s4:
1f36 : a9 00 __ LDA #$00
1f38 : 85 0d __ STA P0 
1f3a : 85 0e __ STA P1 
1f3c : ad 2d 83 LDA $832d ; (vdc_state + 7)
1f3f : 85 55 __ STA T1 + 0 
1f41 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
1f44 : a5 1b __ LDA ACCU + 0 
1f46 : 85 53 __ STA T0 + 0 
1f48 : a5 1c __ LDA ACCU + 1 
1f4a : 85 54 __ STA T0 + 1 
1f4c : a9 aa __ LDA #$aa
1f4e : 85 0d __ STA P0 
1f50 : a9 5d __ LDA #$5d
1f52 : 85 0e __ STA P1 
1f54 : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
1f57 : a5 1b __ LDA ACCU + 0 
1f59 : 85 57 __ STA T3 + 0 
1f5b : a9 12 __ LDA #$12
1f5d : 8d 00 d6 STA $d600 
1f60 : 18 __ __ CLC
1f61 : a5 53 __ LDA T0 + 0 
1f63 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
1f66 : aa __ __ TAX
1f67 : a5 54 __ LDA T0 + 1 
1f69 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19272:
1f6c : 2c 00 d6 BIT $d600 
1f6f : 10 fb __ BPL $1f6c ; (main.l19272 + 0)
.s360:
1f71 : 8d 01 d6 STA $d601 
1f74 : a9 13 __ LDA #$13
1f76 : 8d 00 d6 STA $d600 
.l19274:
1f79 : 2c 00 d6 BIT $d600 
1f7c : 10 fb __ BPL $1f79 ; (main.l19274 + 0)
.s365:
1f7e : 8e 01 d6 STX $d601 
1f81 : a9 1f __ LDA #$1f
1f83 : 8d 00 d6 STA $d600 
1f86 : a5 1b __ LDA ACCU + 0 
1f88 : f0 19 __ BEQ $1fa3 ; (main.s370 + 0)
.s4325:
1f8a : a2 00 __ LDX #$00
.l368:
1f8c : 86 56 __ STX T2 + 0 
1f8e : bd aa 5d LDA $5daa,x 
1f91 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19277:
1f94 : 2c 00 d6 BIT $d600 
1f97 : 10 fb __ BPL $1f94 ; (main.l19277 + 0)
.s373:
1f99 : 8d 01 d6 STA $d601 
1f9c : a6 56 __ LDX T2 + 0 
1f9e : e8 __ __ INX
1f9f : e4 57 __ CPX T3 + 0 
1fa1 : 90 e9 __ BCC $1f8c ; (main.l368 + 0)
.s370:
1fa3 : a9 12 __ LDA #$12
1fa5 : 8d 00 d6 STA $d600 
1fa8 : c6 57 __ DEC T3 + 0 
1faa : ad 30 83 LDA $8330 ; (vdc_state + 10)
1fad : 18 __ __ CLC
1fae : 65 53 __ ADC T0 + 0 
1fb0 : aa __ __ TAX
1fb1 : ad 31 83 LDA $8331 ; (vdc_state + 11)
1fb4 : 65 54 __ ADC T0 + 1 
.l19280:
1fb6 : 2c 00 d6 BIT $d600 
1fb9 : 10 fb __ BPL $1fb6 ; (main.l19280 + 0)
.s380:
1fbb : 8d 01 d6 STA $d601 
1fbe : a9 13 __ LDA #$13
1fc0 : 8d 00 d6 STA $d600 
.l19282:
1fc3 : 2c 00 d6 BIT $d600 
1fc6 : 10 fb __ BPL $1fc3 ; (main.l19282 + 0)
.s385:
1fc8 : 8e 01 d6 STX $d601 
1fcb : a9 1f __ LDA #$1f
1fcd : 8d 00 d6 STA $d600 
.l19284:
1fd0 : 2c 00 d6 BIT $d600 
1fd3 : 10 fb __ BPL $1fd0 ; (main.l19284 + 0)
.s389:
1fd5 : a5 55 __ LDA T1 + 0 
1fd7 : 8d 01 d6 STA $d601 
1fda : a9 18 __ LDA #$18
1fdc : 8d 00 d6 STA $d600 
.l19286:
1fdf : 2c 00 d6 BIT $d600 
1fe2 : 10 fb __ BPL $1fdf ; (main.l19286 + 0)
.s395:
1fe4 : ad 01 d6 LDA $d601 
1fe7 : 29 7f __ AND #$7f
1fe9 : a2 18 __ LDX #$18
1feb : 8e 00 d6 STX $d600 
.l19288:
1fee : 2c 00 d6 BIT $d600 
1ff1 : 10 fb __ BPL $1fee ; (main.l19288 + 0)
.s401:
1ff3 : 8d 01 d6 STA $d601 
1ff6 : a9 1e __ LDA #$1e
1ff8 : 8d 00 d6 STA $d600 
.l19290:
1ffb : 2c 00 d6 BIT $d600 
1ffe : 10 fb __ BPL $1ffb ; (main.l19290 + 0)
.s406:
2000 : a5 57 __ LDA T3 + 0 
2002 : 8d 01 d6 STA $d601 
2005 : a9 00 __ LDA #$00
2007 : a0 02 __ LDY #$02
2009 : 91 23 __ STA (SP + 0),y 
200b : a9 84 __ LDA #$84
200d : c8 __ __ INY
200e : 91 23 __ STA (SP + 0),y 
2010 : a9 58 __ LDA #$58
2012 : c8 __ __ INY
2013 : 91 23 __ STA (SP + 0),y 
2015 : a9 5e __ LDA #$5e
2017 : c8 __ __ INY
2018 : 91 23 __ STA (SP + 0),y 
201a : ad 26 83 LDA $8326 ; (vdc_state + 0)
201d : c8 __ __ INY
201e : 91 23 __ STA (SP + 0),y 
2020 : a9 00 __ LDA #$00
2022 : c8 __ __ INY
2023 : 91 23 __ STA (SP + 0),y 
2025 : ad 27 83 LDA $8327 ; (vdc_state + 1)
2028 : d0 07 __ BNE $2031 ; (main.s9197 + 0)
.s9198:
202a : a9 5e __ LDA #$5e
202c : a2 90 __ LDX #$90
202e : 4c 35 20 JMP $2035 ; (main.s9199 + 0)
.s9197:
2031 : a9 5e __ LDA #$5e
2033 : a2 8d __ LDX #$8d
.s9199:
2035 : 85 58 __ STA T3 + 1 
2037 : 8a __ __ TXA
2038 : a0 08 __ LDY #$08
203a : 91 23 __ STA (SP + 0),y 
203c : a5 58 __ LDA T3 + 1 
203e : c8 __ __ INY
203f : 91 23 __ STA (SP + 0),y 
2041 : 20 2a 5e JSR $5e2a ; (sprintf.s0 + 0)
2044 : a9 00 __ LDA #$00
2046 : 85 0d __ STA P0 
2048 : a9 02 __ LDA #$02
204a : 85 0e __ STA P1 
204c : ad 2d 83 LDA $832d ; (vdc_state + 7)
204f : 85 55 __ STA T1 + 0 
2051 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
2054 : a5 1b __ LDA ACCU + 0 
2056 : 85 57 __ STA T3 + 0 
2058 : a5 1c __ LDA ACCU + 1 
205a : 85 58 __ STA T3 + 1 
205c : 20 c5 5d JSR $5dc5 ; (strlen@proxy + 0)
205f : a5 1b __ LDA ACCU + 0 
2061 : 85 53 __ STA T0 + 0 
2063 : ad 2e 83 LDA $832e ; (vdc_state + 8)
2066 : 18 __ __ CLC
2067 : 65 57 __ ADC T3 + 0 
2069 : a2 12 __ LDX #$12
206b : 8e 00 d6 STX $d600 
206e : aa __ __ TAX
206f : ad 2f 83 LDA $832f ; (vdc_state + 9)
2072 : 65 58 __ ADC T3 + 1 
.l19293:
2074 : 2c 00 d6 BIT $d600 
2077 : 10 fb __ BPL $2074 ; (main.l19293 + 0)
.s414:
2079 : 8d 01 d6 STA $d601 
207c : a9 13 __ LDA #$13
207e : 8d 00 d6 STA $d600 
.l19295:
2081 : 2c 00 d6 BIT $d600 
2084 : 10 fb __ BPL $2081 ; (main.l19295 + 0)
.s419:
2086 : 8e 01 d6 STX $d601 
2089 : a9 1f __ LDA #$1f
208b : 8d 00 d6 STA $d600 
208e : a5 1b __ LDA ACCU + 0 
2090 : f0 19 __ BEQ $20ab ; (main.s424 + 0)
.s4315:
2092 : a2 00 __ LDX #$00
.l422:
2094 : 86 56 __ STX T2 + 0 
2096 : bd 00 84 LDA $8400,x ; (linebuffer + 0)
2099 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19298:
209c : 2c 00 d6 BIT $d600 
209f : 10 fb __ BPL $209c ; (main.l19298 + 0)
.s427:
20a1 : 8d 01 d6 STA $d601 
20a4 : a6 56 __ LDX T2 + 0 
20a6 : e8 __ __ INX
20a7 : e4 53 __ CPX T0 + 0 
20a9 : 90 e9 __ BCC $2094 ; (main.l422 + 0)
.s424:
20ab : a9 12 __ LDA #$12
20ad : 8d 00 d6 STA $d600 
20b0 : c6 53 __ DEC T0 + 0 
20b2 : ad 30 83 LDA $8330 ; (vdc_state + 10)
20b5 : 18 __ __ CLC
20b6 : 65 57 __ ADC T3 + 0 
20b8 : aa __ __ TAX
20b9 : ad 31 83 LDA $8331 ; (vdc_state + 11)
20bc : 65 58 __ ADC T3 + 1 
.l19301:
20be : 2c 00 d6 BIT $d600 
20c1 : 10 fb __ BPL $20be ; (main.l19301 + 0)
.s434:
20c3 : 8d 01 d6 STA $d601 
20c6 : a9 13 __ LDA #$13
20c8 : 8d 00 d6 STA $d600 
.l19303:
20cb : 2c 00 d6 BIT $d600 
20ce : 10 fb __ BPL $20cb ; (main.l19303 + 0)
.s439:
20d0 : 8e 01 d6 STX $d601 
20d3 : a9 1f __ LDA #$1f
20d5 : 8d 00 d6 STA $d600 
.l19305:
20d8 : 2c 00 d6 BIT $d600 
20db : 10 fb __ BPL $20d8 ; (main.l19305 + 0)
.s443:
20dd : a5 55 __ LDA T1 + 0 
20df : 8d 01 d6 STA $d601 
20e2 : a9 18 __ LDA #$18
20e4 : 8d 00 d6 STA $d600 
.l19307:
20e7 : 2c 00 d6 BIT $d600 
20ea : 10 fb __ BPL $20e7 ; (main.l19307 + 0)
.s449:
20ec : ad 01 d6 LDA $d601 
20ef : 29 7f __ AND #$7f
20f1 : a2 18 __ LDX #$18
20f3 : 8e 00 d6 STX $d600 
.l19309:
20f6 : 2c 00 d6 BIT $d600 
20f9 : 10 fb __ BPL $20f6 ; (main.l19309 + 0)
.s455:
20fb : 8d 01 d6 STA $d601 
20fe : a9 1e __ LDA #$1e
2100 : 8d 00 d6 STA $d600 
.l19311:
2103 : 2c 00 d6 BIT $d600 
2106 : 10 fb __ BPL $2103 ; (main.l19311 + 0)
.s460:
2108 : a5 53 __ LDA T0 + 0 
210a : 8d 01 d6 STA $d601 
210d : a9 00 __ LDA #$00
210f : 85 0d __ STA P0 
2111 : a9 04 __ LDA #$04
2113 : 85 0e __ STA P1 
2115 : ad 2d 83 LDA $832d ; (vdc_state + 7)
2118 : 85 55 __ STA T1 + 0 
211a : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
211d : a5 1b __ LDA ACCU + 0 
211f : 85 53 __ STA T0 + 0 
2121 : a5 1c __ LDA ACCU + 1 
2123 : 85 54 __ STA T0 + 1 
2125 : a9 94 __ LDA #$94
2127 : 85 0d __ STA P0 
2129 : a9 5e __ LDA #$5e
212b : 85 0e __ STA P1 
212d : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
2130 : a5 1b __ LDA ACCU + 0 
2132 : 85 57 __ STA T3 + 0 
2134 : a9 12 __ LDA #$12
2136 : 8d 00 d6 STA $d600 
2139 : 18 __ __ CLC
213a : a5 53 __ LDA T0 + 0 
213c : 6d 2e 83 ADC $832e ; (vdc_state + 8)
213f : aa __ __ TAX
2140 : a5 54 __ LDA T0 + 1 
2142 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19313:
2145 : 2c 00 d6 BIT $d600 
2148 : 10 fb __ BPL $2145 ; (main.l19313 + 0)
.s468:
214a : 8d 01 d6 STA $d601 
214d : a9 13 __ LDA #$13
214f : 8d 00 d6 STA $d600 
.l19315:
2152 : 2c 00 d6 BIT $d600 
2155 : 10 fb __ BPL $2152 ; (main.l19315 + 0)
.s473:
2157 : 8e 01 d6 STX $d601 
215a : a9 1f __ LDA #$1f
215c : 8d 00 d6 STA $d600 
215f : a5 1b __ LDA ACCU + 0 
2161 : f0 19 __ BEQ $217c ; (main.s478 + 0)
.s4305:
2163 : a2 00 __ LDX #$00
.l476:
2165 : 86 56 __ STX T2 + 0 
2167 : bd 94 5e LDA $5e94,x 
216a : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19318:
216d : 2c 00 d6 BIT $d600 
2170 : 10 fb __ BPL $216d ; (main.l19318 + 0)
.s481:
2172 : 8d 01 d6 STA $d601 
2175 : a6 56 __ LDX T2 + 0 
2177 : e8 __ __ INX
2178 : e4 57 __ CPX T3 + 0 
217a : 90 e9 __ BCC $2165 ; (main.l476 + 0)
.s478:
217c : a9 12 __ LDA #$12
217e : 8d 00 d6 STA $d600 
2181 : c6 57 __ DEC T3 + 0 
2183 : ad 30 83 LDA $8330 ; (vdc_state + 10)
2186 : 18 __ __ CLC
2187 : 65 53 __ ADC T0 + 0 
2189 : aa __ __ TAX
218a : ad 31 83 LDA $8331 ; (vdc_state + 11)
218d : 65 54 __ ADC T0 + 1 
.l19321:
218f : 2c 00 d6 BIT $d600 
2192 : 10 fb __ BPL $218f ; (main.l19321 + 0)
.s488:
2194 : 8d 01 d6 STA $d601 
2197 : a9 13 __ LDA #$13
2199 : 8d 00 d6 STA $d600 
.l19323:
219c : 2c 00 d6 BIT $d600 
219f : 10 fb __ BPL $219c ; (main.l19323 + 0)
.s493:
21a1 : 8e 01 d6 STX $d601 
21a4 : a9 1f __ LDA #$1f
21a6 : 8d 00 d6 STA $d600 
.l19325:
21a9 : 2c 00 d6 BIT $d600 
21ac : 10 fb __ BPL $21a9 ; (main.l19325 + 0)
.s497:
21ae : a5 55 __ LDA T1 + 0 
21b0 : 8d 01 d6 STA $d601 
21b3 : a9 18 __ LDA #$18
21b5 : 8d 00 d6 STA $d600 
.l19327:
21b8 : 2c 00 d6 BIT $d600 
21bb : 10 fb __ BPL $21b8 ; (main.l19327 + 0)
.s503:
21bd : ad 01 d6 LDA $d601 
21c0 : 29 7f __ AND #$7f
21c2 : a2 18 __ LDX #$18
21c4 : 8e 00 d6 STX $d600 
.l19329:
21c7 : 2c 00 d6 BIT $d600 
21ca : 10 fb __ BPL $21c7 ; (main.l19329 + 0)
.s509:
21cc : 8d 01 d6 STA $d601 
21cf : a9 1e __ LDA #$1e
21d1 : 8d 00 d6 STA $d600 
.l19331:
21d4 : 2c 00 d6 BIT $d600 
21d7 : 10 fb __ BPL $21d4 ; (main.l19331 + 0)
.s514:
21d9 : a5 57 __ LDA T3 + 0 
21db : 8d 01 d6 STA $d601 
21de : a9 00 __ LDA #$00
21e0 : 85 0d __ STA P0 
21e2 : a9 05 __ LDA #$05
21e4 : 85 0e __ STA P1 
21e6 : ad 2d 83 LDA $832d ; (vdc_state + 7)
21e9 : 85 55 __ STA T1 + 0 
21eb : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
21ee : a5 1b __ LDA ACCU + 0 
21f0 : 85 53 __ STA T0 + 0 
21f2 : a5 1c __ LDA ACCU + 1 
21f4 : 85 54 __ STA T0 + 1 
21f6 : a9 a4 __ LDA #$a4
21f8 : 85 0d __ STA P0 
21fa : a9 5e __ LDA #$5e
21fc : 85 0e __ STA P1 
21fe : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
2201 : a5 1b __ LDA ACCU + 0 
2203 : 85 57 __ STA T3 + 0 
2205 : a9 12 __ LDA #$12
2207 : 8d 00 d6 STA $d600 
220a : 18 __ __ CLC
220b : a5 53 __ LDA T0 + 0 
220d : 6d 2e 83 ADC $832e ; (vdc_state + 8)
2210 : aa __ __ TAX
2211 : a5 54 __ LDA T0 + 1 
2213 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19333:
2216 : 2c 00 d6 BIT $d600 
2219 : 10 fb __ BPL $2216 ; (main.l19333 + 0)
.s522:
221b : 8d 01 d6 STA $d601 
221e : a9 13 __ LDA #$13
2220 : 8d 00 d6 STA $d600 
.l19335:
2223 : 2c 00 d6 BIT $d600 
2226 : 10 fb __ BPL $2223 ; (main.l19335 + 0)
.s527:
2228 : 8e 01 d6 STX $d601 
222b : a9 1f __ LDA #$1f
222d : 8d 00 d6 STA $d600 
2230 : a5 1b __ LDA ACCU + 0 
2232 : f0 19 __ BEQ $224d ; (main.s532 + 0)
.s4295:
2234 : a2 00 __ LDX #$00
.l530:
2236 : 86 56 __ STX T2 + 0 
2238 : bd a4 5e LDA $5ea4,x 
223b : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19338:
223e : 2c 00 d6 BIT $d600 
2241 : 10 fb __ BPL $223e ; (main.l19338 + 0)
.s535:
2243 : 8d 01 d6 STA $d601 
2246 : a6 56 __ LDX T2 + 0 
2248 : e8 __ __ INX
2249 : e4 57 __ CPX T3 + 0 
224b : 90 e9 __ BCC $2236 ; (main.l530 + 0)
.s532:
224d : a9 12 __ LDA #$12
224f : 8d 00 d6 STA $d600 
2252 : c6 57 __ DEC T3 + 0 
2254 : ad 30 83 LDA $8330 ; (vdc_state + 10)
2257 : 18 __ __ CLC
2258 : 65 53 __ ADC T0 + 0 
225a : aa __ __ TAX
225b : ad 31 83 LDA $8331 ; (vdc_state + 11)
225e : 65 54 __ ADC T0 + 1 
.l19341:
2260 : 2c 00 d6 BIT $d600 
2263 : 10 fb __ BPL $2260 ; (main.l19341 + 0)
.s542:
2265 : 8d 01 d6 STA $d601 
2268 : a9 13 __ LDA #$13
226a : 8d 00 d6 STA $d600 
.l19343:
226d : 2c 00 d6 BIT $d600 
2270 : 10 fb __ BPL $226d ; (main.l19343 + 0)
.s547:
2272 : 8e 01 d6 STX $d601 
2275 : a9 1f __ LDA #$1f
2277 : 8d 00 d6 STA $d600 
.l19345:
227a : 2c 00 d6 BIT $d600 
227d : 10 fb __ BPL $227a ; (main.l19345 + 0)
.s551:
227f : a5 55 __ LDA T1 + 0 
2281 : 8d 01 d6 STA $d601 
2284 : a9 18 __ LDA #$18
2286 : 8d 00 d6 STA $d600 
.l19347:
2289 : 2c 00 d6 BIT $d600 
228c : 10 fb __ BPL $2289 ; (main.l19347 + 0)
.s557:
228e : ad 01 d6 LDA $d601 
2291 : 29 7f __ AND #$7f
2293 : a2 18 __ LDX #$18
2295 : 8e 00 d6 STX $d600 
.l19349:
2298 : 2c 00 d6 BIT $d600 
229b : 10 fb __ BPL $2298 ; (main.l19349 + 0)
.s563:
229d : 8d 01 d6 STA $d601 
22a0 : a9 1e __ LDA #$1e
22a2 : 8d 00 d6 STA $d600 
.l19351:
22a5 : 2c 00 d6 BIT $d600 
22a8 : 10 fb __ BPL $22a5 ; (main.l19351 + 0)
.s568:
22aa : a5 57 __ LDA T3 + 0 
22ac : 8d 01 d6 STA $d601 
22af : a9 40 __ LDA #$40
22b1 : 85 11 __ STA P4 
22b3 : a9 bf __ LDA #$bf
22b5 : 85 12 __ STA P5 
22b7 : a9 5e __ LDA #$5e
22b9 : 85 13 __ STA P6 
22bb : 20 80 13 JSR $1380 ; (bnk_load@proxy + 0)
22be : a5 1b __ LDA ACCU + 0 
22c0 : d0 06 __ BNE $22c8 ; (main.s571 + 0)
.s569:
22c2 : 20 c7 5e JSR $5ec7 ; (menu_fileerrormessage.s1000 + 0)
22c5 : 20 c1 58 JSR $58c1 ; (exit@proxy + 0)
.s571:
22c8 : a9 00 __ LDA #$00
22ca : 85 0d __ STA P0 
22cc : a9 06 __ LDA #$06
22ce : 85 0e __ STA P1 
22d0 : ad 2d 83 LDA $832d ; (vdc_state + 7)
22d3 : 85 55 __ STA T1 + 0 
22d5 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
22d8 : a5 1b __ LDA ACCU + 0 
22da : 85 53 __ STA T0 + 0 
22dc : a5 1c __ LDA ACCU + 1 
22de : 85 54 __ STA T0 + 1 
22e0 : a9 df __ LDA #$df
22e2 : 85 0d __ STA P0 
22e4 : a9 6b __ LDA #$6b
22e6 : 85 0e __ STA P1 
22e8 : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
22eb : a5 1b __ LDA ACCU + 0 
22ed : 85 57 __ STA T3 + 0 
22ef : a9 12 __ LDA #$12
22f1 : 8d 00 d6 STA $d600 
22f4 : 18 __ __ CLC
22f5 : a5 53 __ LDA T0 + 0 
22f7 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
22fa : aa __ __ TAX
22fb : a5 54 __ LDA T0 + 1 
22fd : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19354:
2300 : 2c 00 d6 BIT $d600 
2303 : 10 fb __ BPL $2300 ; (main.l19354 + 0)
.s579:
2305 : 8d 01 d6 STA $d601 
2308 : a9 13 __ LDA #$13
230a : 8d 00 d6 STA $d600 
.l19356:
230d : 2c 00 d6 BIT $d600 
2310 : 10 fb __ BPL $230d ; (main.l19356 + 0)
.s584:
2312 : 8e 01 d6 STX $d601 
2315 : a9 1f __ LDA #$1f
2317 : 8d 00 d6 STA $d600 
231a : a5 1b __ LDA ACCU + 0 
231c : f0 19 __ BEQ $2337 ; (main.s589 + 0)
.s4285:
231e : a2 00 __ LDX #$00
.l587:
2320 : 86 56 __ STX T2 + 0 
2322 : bd df 6b LDA $6bdf,x 
2325 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19359:
2328 : 2c 00 d6 BIT $d600 
232b : 10 fb __ BPL $2328 ; (main.l19359 + 0)
.s592:
232d : 8d 01 d6 STA $d601 
2330 : a6 56 __ LDX T2 + 0 
2332 : e8 __ __ INX
2333 : e4 57 __ CPX T3 + 0 
2335 : 90 e9 __ BCC $2320 ; (main.l587 + 0)
.s589:
2337 : a9 12 __ LDA #$12
2339 : 8d 00 d6 STA $d600 
233c : c6 57 __ DEC T3 + 0 
233e : ad 30 83 LDA $8330 ; (vdc_state + 10)
2341 : 18 __ __ CLC
2342 : 65 53 __ ADC T0 + 0 
2344 : aa __ __ TAX
2345 : ad 31 83 LDA $8331 ; (vdc_state + 11)
2348 : 65 54 __ ADC T0 + 1 
.l19362:
234a : 2c 00 d6 BIT $d600 
234d : 10 fb __ BPL $234a ; (main.l19362 + 0)
.s599:
234f : 8d 01 d6 STA $d601 
2352 : a9 13 __ LDA #$13
2354 : 8d 00 d6 STA $d600 
.l19364:
2357 : 2c 00 d6 BIT $d600 
235a : 10 fb __ BPL $2357 ; (main.l19364 + 0)
.s604:
235c : 8e 01 d6 STX $d601 
235f : a9 1f __ LDA #$1f
2361 : 8d 00 d6 STA $d600 
.l19366:
2364 : 2c 00 d6 BIT $d600 
2367 : 10 fb __ BPL $2364 ; (main.l19366 + 0)
.s608:
2369 : a5 55 __ LDA T1 + 0 
236b : 8d 01 d6 STA $d601 
236e : a9 18 __ LDA #$18
2370 : 8d 00 d6 STA $d600 
.l19368:
2373 : 2c 00 d6 BIT $d600 
2376 : 10 fb __ BPL $2373 ; (main.l19368 + 0)
.s614:
2378 : ad 01 d6 LDA $d601 
237b : 29 7f __ AND #$7f
237d : a2 18 __ LDX #$18
237f : 8e 00 d6 STX $d600 
.l19370:
2382 : 2c 00 d6 BIT $d600 
2385 : 10 fb __ BPL $2382 ; (main.l19370 + 0)
.s620:
2387 : 8d 01 d6 STA $d601 
238a : a9 1e __ LDA #$1e
238c : 8d 00 d6 STA $d600 
.l19372:
238f : 2c 00 d6 BIT $d600 
2392 : 10 fb __ BPL $238f ; (main.l19372 + 0)
.s625:
2394 : a5 57 __ LDA T3 + 0 
2396 : 8d 01 d6 STA $d601 
2399 : a9 a0 __ LDA #$a0
239b : 85 11 __ STA P4 
239d : a9 00 __ LDA #$00
239f : 85 12 __ STA P5 
23a1 : a9 6c __ LDA #$6c
23a3 : 85 13 __ STA P6 
23a5 : 20 80 13 JSR $1380 ; (bnk_load@proxy + 0)
23a8 : a5 1b __ LDA ACCU + 0 
23aa : d0 06 __ BNE $23b2 ; (main.s628 + 0)
.s626:
23ac : 20 c7 5e JSR $5ec7 ; (menu_fileerrormessage.s1000 + 0)
23af : 20 c1 58 JSR $58c1 ; (exit@proxy + 0)
.s628:
23b2 : a9 7f __ LDA #$7f
23b4 : 8d 2b bf STA $bf2b ; (logo + 0)
23b7 : a9 00 __ LDA #$00
23b9 : 8d 2c bf STA $bf2c ; (logo + 1)
23bc : 8d 2f bf STA $bf2f ; (logo + 4)
23bf : 8d 31 bf STA $bf31 ; (logo + 6)
23c2 : 8d 32 bf STA $bf32 ; (logo + 7)
23c5 : 8d 33 bf STA $bf33 ; (logo + 8)
23c8 : 8d 34 bf STA $bf34 ; (logo + 9)
23cb : 8d 35 bf STA $bf35 ; (logo + 10)
23ce : a9 a0 __ LDA #$a0
23d0 : 8d 2d bf STA $bf2d ; (logo + 2)
23d3 : 8d 2e bf STA $bf2e ; (logo + 3)
23d6 : a9 4b __ LDA #$4b
23d8 : 8d 30 bf STA $bf30 ; (logo + 5)
23db : a9 10 __ LDA #$10
23dd : 85 11 __ STA P4 
23df : a9 06 __ LDA #$06
23e1 : 85 12 __ STA P5 
23e3 : a9 30 __ LDA #$30
23e5 : 85 13 __ STA P6 
23e7 : a9 0c __ LDA #$0c
23e9 : 85 14 __ STA P7 
23eb : a9 36 __ LDA #$36
23ed : 85 0f __ STA P2 
23ef : a9 bf __ LDA #$bf
23f1 : 85 10 __ STA P3 
23f3 : 20 15 6a JSR $6a15 ; (vdcwin_init.s0 + 0)
23f6 : a9 10 __ LDA #$10
23f8 : 8d 32 bf STA $bf32 ; (logo + 7)
23fb : a9 00 __ LDA #$00
23fd : 8d 33 bf STA $bf33 ; (logo + 8)
2400 : 8d 35 bf STA $bf35 ; (logo + 10)
2403 : a9 06 __ LDA #$06
2405 : 8d 34 bf STA $bf34 ; (logo + 9)
.l630:
2408 : ad 29 83 LDA $8329 ; (vdc_state + 3)
240b : 85 53 __ STA T0 + 0 
240d : ad 2b 83 LDA $832b ; (vdc_state + 5)
2410 : 85 57 __ STA T3 + 0 
2412 : a9 00 __ LDA #$00
2414 : 85 55 __ STA T1 + 0 
2416 : 85 0d __ STA P0 
.l635:
2418 : a5 55 __ LDA T1 + 0 
241a : c5 57 __ CMP T3 + 0 
241c : b0 03 __ BCS $2421 ; (main.s633 + 0)
241e : 4c 30 4d JMP $4d30 ; (main.s636 + 0)
.s633:
2421 : a9 00 __ LDA #$00
2423 : 85 0e __ STA P1 
2425 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
2428 : a9 12 __ LDA #$12
242a : 8d 00 d6 STA $d600 
242d : ad 2e 83 LDA $832e ; (vdc_state + 8)
2430 : 85 57 __ STA T3 + 0 
2432 : 18 __ __ CLC
2433 : 65 1b __ ADC ACCU + 0 
2435 : aa __ __ TAX
2436 : ad 2f 83 LDA $832f ; (vdc_state + 9)
2439 : 85 58 __ STA T3 + 1 
243b : 65 1c __ ADC ACCU + 1 
.l19400:
243d : 2c 00 d6 BIT $d600 
2440 : 10 fb __ BPL $243d ; (main.l19400 + 0)
.s714:
2442 : 8d 01 d6 STA $d601 
2445 : a9 13 __ LDA #$13
2447 : 8d 00 d6 STA $d600 
.l19402:
244a : 2c 00 d6 BIT $d600 
244d : 10 fb __ BPL $244a ; (main.l19402 + 0)
.s719:
244f : 8e 01 d6 STX $d601 
2452 : a9 1f __ LDA #$1f
2454 : 8d 00 d6 STA $d600 
.l19404:
2457 : 2c 00 d6 BIT $d600 
245a : 10 fb __ BPL $2457 ; (main.l19404 + 0)
.s723:
245c : a9 20 __ LDA #$20
245e : 8d 01 d6 STA $d601 
2461 : a9 18 __ LDA #$18
2463 : 8d 00 d6 STA $d600 
.l19406:
2466 : 2c 00 d6 BIT $d600 
2469 : 10 fb __ BPL $2466 ; (main.l19406 + 0)
.s729:
246b : ad 01 d6 LDA $d601 
246e : 29 7f __ AND #$7f
2470 : a2 18 __ LDX #$18
2472 : 8e 00 d6 STX $d600 
.l19408:
2475 : 2c 00 d6 BIT $d600 
2478 : 10 fb __ BPL $2475 ; (main.l19408 + 0)
.s735:
247a : 8d 01 d6 STA $d601 
247d : a9 1e __ LDA #$1e
247f : 8d 00 d6 STA $d600 
.l19410:
2482 : 2c 00 d6 BIT $d600 
2485 : 10 fb __ BPL $2482 ; (main.l19410 + 0)
.s740:
2487 : a9 4f __ LDA #$4f
2489 : 8d 01 d6 STA $d601 
248c : ad 30 83 LDA $8330 ; (vdc_state + 10)
248f : 18 __ __ CLC
2490 : 65 1b __ ADC ACCU + 0 
2492 : a2 12 __ LDX #$12
2494 : 8e 00 d6 STX $d600 
2497 : aa __ __ TAX
2498 : ad 31 83 LDA $8331 ; (vdc_state + 11)
249b : 65 1c __ ADC ACCU + 1 
.l19412:
249d : 2c 00 d6 BIT $d600 
24a0 : 10 fb __ BPL $249d ; (main.l19412 + 0)
.s747:
24a2 : 8d 01 d6 STA $d601 
24a5 : a9 13 __ LDA #$13
24a7 : 8d 00 d6 STA $d600 
.l19414:
24aa : 2c 00 d6 BIT $d600 
24ad : 10 fb __ BPL $24aa ; (main.l19414 + 0)
.s752:
24af : 8e 01 d6 STX $d601 
24b2 : a9 1f __ LDA #$1f
24b4 : 8d 00 d6 STA $d600 
.l19416:
24b7 : 2c 00 d6 BIT $d600 
24ba : 10 fb __ BPL $24b7 ; (main.l19416 + 0)
.s756:
24bc : a9 c5 __ LDA #$c5
24be : 8d 01 d6 STA $d601 
24c1 : a9 18 __ LDA #$18
24c3 : 8d 00 d6 STA $d600 
.l19418:
24c6 : 2c 00 d6 BIT $d600 
24c9 : 10 fb __ BPL $24c6 ; (main.l19418 + 0)
.s762:
24cb : ad 01 d6 LDA $d601 
24ce : 29 7f __ AND #$7f
24d0 : a2 18 __ LDX #$18
24d2 : 8e 00 d6 STX $d600 
.l19420:
24d5 : 2c 00 d6 BIT $d600 
24d8 : 10 fb __ BPL $24d5 ; (main.l19420 + 0)
.s768:
24da : 8d 01 d6 STA $d601 
24dd : a9 1e __ LDA #$1e
24df : 8d 00 d6 STA $d600 
.l19422:
24e2 : 2c 00 d6 BIT $d600 
24e5 : 10 fb __ BPL $24e2 ; (main.l19422 + 0)
.s773:
24e7 : a9 4f __ LDA #$4f
24e9 : 8d 01 d6 STA $d601 
24ec : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
24ef : a5 1b __ LDA ACCU + 0 
24f1 : 85 53 __ STA T0 + 0 
24f3 : a5 1c __ LDA ACCU + 1 
24f5 : 85 54 __ STA T0 + 1 
24f7 : a9 08 __ LDA #$08
24f9 : 85 0d __ STA P0 
24fb : a9 6c __ LDA #$6c
24fd : 85 0e __ STA P1 
24ff : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
2502 : a5 1b __ LDA ACCU + 0 
2504 : 85 59 __ STA T4 + 0 
2506 : a9 12 __ LDA #$12
2508 : 8d 00 d6 STA $d600 
250b : 18 __ __ CLC
250c : a5 53 __ LDA T0 + 0 
250e : 65 57 __ ADC T3 + 0 
2510 : aa __ __ TAX
2511 : a5 54 __ LDA T0 + 1 
2513 : 65 58 __ ADC T3 + 1 
.l19424:
2515 : 2c 00 d6 BIT $d600 
2518 : 10 fb __ BPL $2515 ; (main.l19424 + 0)
.s780:
251a : 8d 01 d6 STA $d601 
251d : a9 13 __ LDA #$13
251f : 8d 00 d6 STA $d600 
.l19426:
2522 : 2c 00 d6 BIT $d600 
2525 : 10 fb __ BPL $2522 ; (main.l19426 + 0)
.s785:
2527 : 8e 01 d6 STX $d601 
252a : a9 1f __ LDA #$1f
252c : 8d 00 d6 STA $d600 
252f : a5 1b __ LDA ACCU + 0 
2531 : f0 19 __ BEQ $254c ; (main.s790 + 0)
.s4261:
2533 : a2 00 __ LDX #$00
.l788:
2535 : 86 55 __ STX T1 + 0 
2537 : bd 08 6c LDA $6c08,x 
253a : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19429:
253d : 2c 00 d6 BIT $d600 
2540 : 10 fb __ BPL $253d ; (main.l19429 + 0)
.s793:
2542 : 8d 01 d6 STA $d601 
2545 : a6 55 __ LDX T1 + 0 
2547 : e8 __ __ INX
2548 : e4 59 __ CPX T4 + 0 
254a : 90 e9 __ BCC $2535 ; (main.l788 + 0)
.s790:
254c : a9 12 __ LDA #$12
254e : 8d 00 d6 STA $d600 
2551 : c6 59 __ DEC T4 + 0 
2553 : ad 30 83 LDA $8330 ; (vdc_state + 10)
2556 : 85 57 __ STA T3 + 0 
2558 : 18 __ __ CLC
2559 : 65 53 __ ADC T0 + 0 
255b : aa __ __ TAX
255c : ad 31 83 LDA $8331 ; (vdc_state + 11)
255f : 85 58 __ STA T3 + 1 
2561 : 65 54 __ ADC T0 + 1 
.l19432:
2563 : 2c 00 d6 BIT $d600 
2566 : 10 fb __ BPL $2563 ; (main.l19432 + 0)
.s800:
2568 : 8d 01 d6 STA $d601 
256b : a9 13 __ LDA #$13
256d : 8d 00 d6 STA $d600 
.l19434:
2570 : 2c 00 d6 BIT $d600 
2573 : 10 fb __ BPL $2570 ; (main.l19434 + 0)
.s805:
2575 : 8e 01 d6 STX $d601 
2578 : a9 1f __ LDA #$1f
257a : 8d 00 d6 STA $d600 
.l19436:
257d : 2c 00 d6 BIT $d600 
2580 : 10 fb __ BPL $257d ; (main.l19436 + 0)
.s809:
2582 : a9 c5 __ LDA #$c5
2584 : 8d 01 d6 STA $d601 
2587 : a9 18 __ LDA #$18
2589 : 8d 00 d6 STA $d600 
.l19438:
258c : 2c 00 d6 BIT $d600 
258f : 10 fb __ BPL $258c ; (main.l19438 + 0)
.s815:
2591 : ad 01 d6 LDA $d601 
2594 : 29 7f __ AND #$7f
2596 : a2 18 __ LDX #$18
2598 : 8e 00 d6 STX $d600 
.l19440:
259b : 2c 00 d6 BIT $d600 
259e : 10 fb __ BPL $259b ; (main.l19440 + 0)
.s821:
25a0 : 8d 01 d6 STA $d601 
25a3 : a9 1e __ LDA #$1e
25a5 : 8d 00 d6 STA $d600 
.l19442:
25a8 : 2c 00 d6 BIT $d600 
25ab : 10 fb __ BPL $25a8 ; (main.l19442 + 0)
.s826:
25ad : a5 59 __ LDA T4 + 0 
25af : 8d 01 d6 STA $d601 
25b2 : a9 01 __ LDA #$01
25b4 : 85 0f __ STA P2 
25b6 : 20 1a 6c JSR $6c1a ; (menu_placebar.s0 + 0)
25b9 : a5 57 __ LDA T3 + 0 
25bb : a0 0a __ LDY #$0a
25bd : 91 23 __ STA (SP + 0),y 
25bf : a5 58 __ LDA T3 + 1 
25c1 : c8 __ __ INY
25c2 : 91 23 __ STA (SP + 0),y 
25c4 : a9 00 __ LDA #$00
25c6 : a0 02 __ LDY #$02
25c8 : 91 23 __ STA (SP + 0),y 
25ca : a9 84 __ LDA #$84
25cc : c8 __ __ INY
25cd : 91 23 __ STA (SP + 0),y 
25cf : a9 1a __ LDA #$1a
25d1 : c8 __ __ INY
25d2 : 91 23 __ STA (SP + 0),y 
25d4 : a9 6e __ LDA #$6e
25d6 : c8 __ __ INY
25d7 : 91 23 __ STA (SP + 0),y 
25d9 : ad 28 83 LDA $8328 ; (vdc_state + 2)
25dc : c8 __ __ INY
25dd : 91 23 __ STA (SP + 0),y 
25df : a9 00 __ LDA #$00
25e1 : c8 __ __ INY
25e2 : 91 23 __ STA (SP + 0),y 
25e4 : ad 2e 83 LDA $832e ; (vdc_state + 8)
25e7 : 85 57 __ STA T3 + 0 
25e9 : c8 __ __ INY
25ea : 91 23 __ STA (SP + 0),y 
25ec : ad 2f 83 LDA $832f ; (vdc_state + 9)
25ef : 85 58 __ STA T3 + 1 
25f1 : c8 __ __ INY
25f2 : 91 23 __ STA (SP + 0),y 
25f4 : ad 29 83 LDA $8329 ; (vdc_state + 3)
25f7 : a0 0c __ LDY #$0c
25f9 : 91 23 __ STA (SP + 0),y 
25fb : ad 2a 83 LDA $832a ; (vdc_state + 4)
25fe : c8 __ __ INY
25ff : 91 23 __ STA (SP + 0),y 
2601 : ad 2b 83 LDA $832b ; (vdc_state + 5)
2604 : c8 __ __ INY
2605 : 91 23 __ STA (SP + 0),y 
2607 : ad 2c 83 LDA $832c ; (vdc_state + 6)
260a : c8 __ __ INY
260b : 91 23 __ STA (SP + 0),y 
260d : ad 2d 83 LDA $832d ; (vdc_state + 7)
2610 : 85 55 __ STA T1 + 0 
2612 : c8 __ __ INY
2613 : 91 23 __ STA (SP + 0),y 
2615 : a9 00 __ LDA #$00
2617 : c8 __ __ INY
2618 : 91 23 __ STA (SP + 0),y 
261a : 20 2a 5e JSR $5e2a ; (sprintf.s0 + 0)
261d : a9 00 __ LDA #$00
261f : 85 0d __ STA P0 
2621 : a9 02 __ LDA #$02
2623 : 85 0e __ STA P1 
2625 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
2628 : a5 1b __ LDA ACCU + 0 
262a : 85 59 __ STA T4 + 0 
262c : a5 1c __ LDA ACCU + 1 
262e : 85 5a __ STA T4 + 1 
2630 : 20 c5 5d JSR $5dc5 ; (strlen@proxy + 0)
2633 : a5 1b __ LDA ACCU + 0 
2635 : 85 53 __ STA T0 + 0 
2637 : a9 12 __ LDA #$12
2639 : 8d 00 d6 STA $d600 
263c : 18 __ __ CLC
263d : a5 59 __ LDA T4 + 0 
263f : 65 57 __ ADC T3 + 0 
2641 : aa __ __ TAX
2642 : a5 5a __ LDA T4 + 1 
2644 : 65 58 __ ADC T3 + 1 
.l19444:
2646 : 2c 00 d6 BIT $d600 
2649 : 10 fb __ BPL $2646 ; (main.l19444 + 0)
.s834:
264b : 8d 01 d6 STA $d601 
264e : a9 13 __ LDA #$13
2650 : 8d 00 d6 STA $d600 
.l19446:
2653 : 2c 00 d6 BIT $d600 
2656 : 10 fb __ BPL $2653 ; (main.l19446 + 0)
.s839:
2658 : 8e 01 d6 STX $d601 
265b : a9 1f __ LDA #$1f
265d : 8d 00 d6 STA $d600 
2660 : a5 1b __ LDA ACCU + 0 
2662 : f0 19 __ BEQ $267d ; (main.s844 + 0)
.s4251:
2664 : a2 00 __ LDX #$00
.l842:
2666 : 86 56 __ STX T2 + 0 
2668 : bd 00 84 LDA $8400,x ; (linebuffer + 0)
266b : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19449:
266e : 2c 00 d6 BIT $d600 
2671 : 10 fb __ BPL $266e ; (main.l19449 + 0)
.s847:
2673 : 8d 01 d6 STA $d601 
2676 : a6 56 __ LDX T2 + 0 
2678 : e8 __ __ INX
2679 : e4 53 __ CPX T0 + 0 
267b : 90 e9 __ BCC $2666 ; (main.l842 + 0)
.s844:
267d : a9 12 __ LDA #$12
267f : 8d 00 d6 STA $d600 
2682 : c6 53 __ DEC T0 + 0 
2684 : ad 30 83 LDA $8330 ; (vdc_state + 10)
2687 : 18 __ __ CLC
2688 : 65 59 __ ADC T4 + 0 
268a : aa __ __ TAX
268b : ad 31 83 LDA $8331 ; (vdc_state + 11)
268e : 65 5a __ ADC T4 + 1 
.l19452:
2690 : 2c 00 d6 BIT $d600 
2693 : 10 fb __ BPL $2690 ; (main.l19452 + 0)
.s854:
2695 : 8d 01 d6 STA $d601 
2698 : a9 13 __ LDA #$13
269a : 8d 00 d6 STA $d600 
.l19454:
269d : 2c 00 d6 BIT $d600 
26a0 : 10 fb __ BPL $269d ; (main.l19454 + 0)
.s859:
26a2 : 8e 01 d6 STX $d601 
26a5 : a9 1f __ LDA #$1f
26a7 : 8d 00 d6 STA $d600 
.l19456:
26aa : 2c 00 d6 BIT $d600 
26ad : 10 fb __ BPL $26aa ; (main.l19456 + 0)
.s863:
26af : a5 55 __ LDA T1 + 0 
26b1 : 8d 01 d6 STA $d601 
26b4 : a9 18 __ LDA #$18
26b6 : 8d 00 d6 STA $d600 
.l19458:
26b9 : 2c 00 d6 BIT $d600 
26bc : 10 fb __ BPL $26b9 ; (main.l19458 + 0)
.s869:
26be : ad 01 d6 LDA $d601 
26c1 : 29 7f __ AND #$7f
26c3 : a2 18 __ LDX #$18
26c5 : 8e 00 d6 STX $d600 
.l19460:
26c8 : 2c 00 d6 BIT $d600 
26cb : 10 fb __ BPL $26c8 ; (main.l19460 + 0)
.s875:
26cd : 8d 01 d6 STA $d601 
26d0 : a9 1e __ LDA #$1e
26d2 : 8d 00 d6 STA $d600 
.l19462:
26d5 : 2c 00 d6 BIT $d600 
26d8 : 10 fb __ BPL $26d5 ; (main.l19462 + 0)
.s880:
26da : a5 53 __ LDA T0 + 0 
26dc : 8d 01 d6 STA $d601 
26df : a9 00 __ LDA #$00
26e1 : a0 02 __ LDY #$02
26e3 : 91 23 __ STA (SP + 0),y 
26e5 : a9 84 __ LDA #$84
26e7 : c8 __ __ INY
26e8 : 91 23 __ STA (SP + 0),y 
26ea : a9 58 __ LDA #$58
26ec : c8 __ __ INY
26ed : 91 23 __ STA (SP + 0),y 
26ef : a9 5e __ LDA #$5e
26f1 : c8 __ __ INY
26f2 : 91 23 __ STA (SP + 0),y 
26f4 : ad 26 83 LDA $8326 ; (vdc_state + 0)
26f7 : c8 __ __ INY
26f8 : 91 23 __ STA (SP + 0),y 
26fa : a9 00 __ LDA #$00
26fc : c8 __ __ INY
26fd : 91 23 __ STA (SP + 0),y 
26ff : ad 27 83 LDA $8327 ; (vdc_state + 1)
2702 : d0 07 __ BNE $270b ; (main.s9200 + 0)
.s9201:
2704 : a9 5e __ LDA #$5e
2706 : a2 90 __ LDX #$90
2708 : 4c 0f 27 JMP $270f ; (main.s9202 + 0)
.s9200:
270b : a9 5e __ LDA #$5e
270d : a2 8d __ LDX #$8d
.s9202:
270f : 85 58 __ STA T3 + 1 
2711 : 8a __ __ TXA
2712 : a0 08 __ LDY #$08
2714 : 91 23 __ STA (SP + 0),y 
2716 : a5 58 __ LDA T3 + 1 
2718 : c8 __ __ INY
2719 : 91 23 __ STA (SP + 0),y 
271b : 20 2a 5e JSR $5e2a ; (sprintf.s0 + 0)
271e : a9 00 __ LDA #$00
2720 : 85 0d __ STA P0 
2722 : a9 03 __ LDA #$03
2724 : 85 0e __ STA P1 
2726 : ad 2d 83 LDA $832d ; (vdc_state + 7)
2729 : 85 55 __ STA T1 + 0 
272b : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
272e : a5 1b __ LDA ACCU + 0 
2730 : 85 57 __ STA T3 + 0 
2732 : a5 1c __ LDA ACCU + 1 
2734 : 85 58 __ STA T3 + 1 
2736 : 20 c5 5d JSR $5dc5 ; (strlen@proxy + 0)
2739 : a5 1b __ LDA ACCU + 0 
273b : 85 53 __ STA T0 + 0 
273d : ad 2e 83 LDA $832e ; (vdc_state + 8)
2740 : 18 __ __ CLC
2741 : 65 57 __ ADC T3 + 0 
2743 : a2 12 __ LDX #$12
2745 : 8e 00 d6 STX $d600 
2748 : aa __ __ TAX
2749 : ad 2f 83 LDA $832f ; (vdc_state + 9)
274c : 65 58 __ ADC T3 + 1 
.l19465:
274e : 2c 00 d6 BIT $d600 
2751 : 10 fb __ BPL $274e ; (main.l19465 + 0)
.s888:
2753 : 8d 01 d6 STA $d601 
2756 : a9 13 __ LDA #$13
2758 : 8d 00 d6 STA $d600 
.l19467:
275b : 2c 00 d6 BIT $d600 
275e : 10 fb __ BPL $275b ; (main.l19467 + 0)
.s893:
2760 : 8e 01 d6 STX $d601 
2763 : a9 1f __ LDA #$1f
2765 : 8d 00 d6 STA $d600 
2768 : a5 1b __ LDA ACCU + 0 
276a : f0 19 __ BEQ $2785 ; (main.s898 + 0)
.s4241:
276c : a2 00 __ LDX #$00
.l896:
276e : 86 56 __ STX T2 + 0 
2770 : bd 00 84 LDA $8400,x ; (linebuffer + 0)
2773 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19470:
2776 : 2c 00 d6 BIT $d600 
2779 : 10 fb __ BPL $2776 ; (main.l19470 + 0)
.s901:
277b : 8d 01 d6 STA $d601 
277e : a6 56 __ LDX T2 + 0 
2780 : e8 __ __ INX
2781 : e4 53 __ CPX T0 + 0 
2783 : 90 e9 __ BCC $276e ; (main.l896 + 0)
.s898:
2785 : a9 12 __ LDA #$12
2787 : 8d 00 d6 STA $d600 
278a : c6 53 __ DEC T0 + 0 
278c : ad 30 83 LDA $8330 ; (vdc_state + 10)
278f : 18 __ __ CLC
2790 : 65 57 __ ADC T3 + 0 
2792 : aa __ __ TAX
2793 : ad 31 83 LDA $8331 ; (vdc_state + 11)
2796 : 65 58 __ ADC T3 + 1 
.l19473:
2798 : 2c 00 d6 BIT $d600 
279b : 10 fb __ BPL $2798 ; (main.l19473 + 0)
.s908:
279d : 8d 01 d6 STA $d601 
27a0 : a9 13 __ LDA #$13
27a2 : 8d 00 d6 STA $d600 
.l19475:
27a5 : 2c 00 d6 BIT $d600 
27a8 : 10 fb __ BPL $27a5 ; (main.l19475 + 0)
.s913:
27aa : 8e 01 d6 STX $d601 
27ad : a9 1f __ LDA #$1f
27af : 8d 00 d6 STA $d600 
.l19477:
27b2 : 2c 00 d6 BIT $d600 
27b5 : 10 fb __ BPL $27b2 ; (main.l19477 + 0)
.s917:
27b7 : a5 55 __ LDA T1 + 0 
27b9 : 8d 01 d6 STA $d601 
27bc : a9 18 __ LDA #$18
27be : 8d 00 d6 STA $d600 
.l19479:
27c1 : 2c 00 d6 BIT $d600 
27c4 : 10 fb __ BPL $27c1 ; (main.l19479 + 0)
.s923:
27c6 : ad 01 d6 LDA $d601 
27c9 : 29 7f __ AND #$7f
27cb : a2 18 __ LDX #$18
27cd : 8e 00 d6 STX $d600 
.l19481:
27d0 : 2c 00 d6 BIT $d600 
27d3 : 10 fb __ BPL $27d0 ; (main.l19481 + 0)
.s929:
27d5 : 8d 01 d6 STA $d601 
27d8 : a9 1e __ LDA #$1e
27da : 8d 00 d6 STA $d600 
.l19483:
27dd : 2c 00 d6 BIT $d600 
27e0 : 10 fb __ BPL $27dd ; (main.l19483 + 0)
.s934:
27e2 : a5 53 __ LDA T0 + 0 
27e4 : 8d 01 d6 STA $d601 
27e7 : a9 00 __ LDA #$00
27e9 : a0 02 __ LDY #$02
27eb : 91 23 __ STA (SP + 0),y 
27ed : a9 84 __ LDA #$84
27ef : c8 __ __ INY
27f0 : 91 23 __ STA (SP + 0),y 
27f2 : a9 45 __ LDA #$45
27f4 : c8 __ __ INY
27f5 : 91 23 __ STA (SP + 0),y 
27f7 : a9 6e __ LDA #$6e
27f9 : c8 __ __ INY
27fa : 91 23 __ STA (SP + 0),y 
27fc : ad 28 83 LDA $8328 ; (vdc_state + 2)
27ff : 85 1b __ STA ACCU + 0 
2801 : a9 00 __ LDA #$00
2803 : 85 1c __ STA ACCU + 1 
2805 : a9 11 __ LDA #$11
2807 : 20 e3 7c JSR $7ce3 ; (mul16by8 + 0)
280a : 18 __ __ CLC
280b : a9 3c __ LDA #$3c
280d : 65 05 __ ADC WORK + 2 
280f : a0 06 __ LDY #$06
2811 : 91 23 __ STA (SP + 0),y 
2813 : a9 82 __ LDA #$82
2815 : 65 06 __ ADC WORK + 3 
2817 : c8 __ __ INY
2818 : 91 23 __ STA (SP + 0),y 
281a : 20 2a 5e JSR $5e2a ; (sprintf.s0 + 0)
281d : a9 00 __ LDA #$00
281f : 85 0d __ STA P0 
2821 : a9 04 __ LDA #$04
2823 : 85 0e __ STA P1 
2825 : ad 2d 83 LDA $832d ; (vdc_state + 7)
2828 : 85 55 __ STA T1 + 0 
282a : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
282d : a5 1b __ LDA ACCU + 0 
282f : 85 57 __ STA T3 + 0 
2831 : a5 1c __ LDA ACCU + 1 
2833 : 85 58 __ STA T3 + 1 
2835 : 20 c5 5d JSR $5dc5 ; (strlen@proxy + 0)
2838 : a5 1b __ LDA ACCU + 0 
283a : 85 53 __ STA T0 + 0 
283c : ad 2e 83 LDA $832e ; (vdc_state + 8)
283f : 18 __ __ CLC
2840 : 65 57 __ ADC T3 + 0 
2842 : a2 12 __ LDX #$12
2844 : 8e 00 d6 STX $d600 
2847 : aa __ __ TAX
2848 : ad 2f 83 LDA $832f ; (vdc_state + 9)
284b : 65 58 __ ADC T3 + 1 
.l19485:
284d : 2c 00 d6 BIT $d600 
2850 : 10 fb __ BPL $284d ; (main.l19485 + 0)
.s942:
2852 : 8d 01 d6 STA $d601 
2855 : a9 13 __ LDA #$13
2857 : 8d 00 d6 STA $d600 
.l19487:
285a : 2c 00 d6 BIT $d600 
285d : 10 fb __ BPL $285a ; (main.l19487 + 0)
.s947:
285f : 8e 01 d6 STX $d601 
2862 : a9 1f __ LDA #$1f
2864 : 8d 00 d6 STA $d600 
2867 : a5 1b __ LDA ACCU + 0 
2869 : f0 19 __ BEQ $2884 ; (main.s952 + 0)
.s4231:
286b : a2 00 __ LDX #$00
.l950:
286d : 86 56 __ STX T2 + 0 
286f : bd 00 84 LDA $8400,x ; (linebuffer + 0)
2872 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19490:
2875 : 2c 00 d6 BIT $d600 
2878 : 10 fb __ BPL $2875 ; (main.l19490 + 0)
.s955:
287a : 8d 01 d6 STA $d601 
287d : a6 56 __ LDX T2 + 0 
287f : e8 __ __ INX
2880 : e4 53 __ CPX T0 + 0 
2882 : 90 e9 __ BCC $286d ; (main.l950 + 0)
.s952:
2884 : a9 12 __ LDA #$12
2886 : 8d 00 d6 STA $d600 
2889 : c6 53 __ DEC T0 + 0 
288b : ad 30 83 LDA $8330 ; (vdc_state + 10)
288e : 18 __ __ CLC
288f : 65 57 __ ADC T3 + 0 
2891 : aa __ __ TAX
2892 : ad 31 83 LDA $8331 ; (vdc_state + 11)
2895 : 65 58 __ ADC T3 + 1 
.l19493:
2897 : 2c 00 d6 BIT $d600 
289a : 10 fb __ BPL $2897 ; (main.l19493 + 0)
.s962:
289c : 8d 01 d6 STA $d601 
289f : a9 13 __ LDA #$13
28a1 : 8d 00 d6 STA $d600 
.l19495:
28a4 : 2c 00 d6 BIT $d600 
28a7 : 10 fb __ BPL $28a4 ; (main.l19495 + 0)
.s967:
28a9 : 8e 01 d6 STX $d601 
28ac : a9 1f __ LDA #$1f
28ae : 8d 00 d6 STA $d600 
.l19497:
28b1 : 2c 00 d6 BIT $d600 
28b4 : 10 fb __ BPL $28b1 ; (main.l19497 + 0)
.s971:
28b6 : a5 55 __ LDA T1 + 0 
28b8 : 8d 01 d6 STA $d601 
28bb : a9 18 __ LDA #$18
28bd : 8d 00 d6 STA $d600 
.l19499:
28c0 : 2c 00 d6 BIT $d600 
28c3 : 10 fb __ BPL $28c0 ; (main.l19499 + 0)
.s977:
28c5 : ad 01 d6 LDA $d601 
28c8 : 29 7f __ AND #$7f
28ca : a2 18 __ LDX #$18
28cc : 8e 00 d6 STX $d600 
.l19501:
28cf : 2c 00 d6 BIT $d600 
28d2 : 10 fb __ BPL $28cf ; (main.l19501 + 0)
.s983:
28d4 : 8d 01 d6 STA $d601 
28d7 : a9 1e __ LDA #$1e
28d9 : 8d 00 d6 STA $d600 
.l19503:
28dc : 2c 00 d6 BIT $d600 
28df : 10 fb __ BPL $28dc ; (main.l19503 + 0)
.s988:
28e1 : a5 53 __ LDA T0 + 0 
28e3 : 8d 01 d6 STA $d601 
28e6 : a9 00 __ LDA #$00
28e8 : 85 0d __ STA P0 
28ea : a9 13 __ LDA #$13
28ec : 85 0e __ STA P1 
28ee : ad 2d 83 LDA $832d ; (vdc_state + 7)
28f1 : 85 55 __ STA T1 + 0 
28f3 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
28f6 : a5 1b __ LDA ACCU + 0 
28f8 : 85 53 __ STA T0 + 0 
28fa : a5 1c __ LDA ACCU + 1 
28fc : 85 54 __ STA T0 + 1 
28fe : a9 54 __ LDA #$54
2900 : 85 0d __ STA P0 
2902 : a9 6e __ LDA #$6e
2904 : 85 0e __ STA P1 
2906 : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
2909 : a5 1b __ LDA ACCU + 0 
290b : 85 57 __ STA T3 + 0 
290d : a9 12 __ LDA #$12
290f : 8d 00 d6 STA $d600 
2912 : 18 __ __ CLC
2913 : a5 53 __ LDA T0 + 0 
2915 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
2918 : aa __ __ TAX
2919 : a5 54 __ LDA T0 + 1 
291b : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19505:
291e : 2c 00 d6 BIT $d600 
2921 : 10 fb __ BPL $291e ; (main.l19505 + 0)
.s996:
2923 : 8d 01 d6 STA $d601 
2926 : a9 13 __ LDA #$13
2928 : 8d 00 d6 STA $d600 
.l19507:
292b : 2c 00 d6 BIT $d600 
292e : 10 fb __ BPL $292b ; (main.l19507 + 0)
.s1001:
2930 : 8e 01 d6 STX $d601 
2933 : a9 1f __ LDA #$1f
2935 : 8d 00 d6 STA $d600 
2938 : a5 1b __ LDA ACCU + 0 
293a : f0 19 __ BEQ $2955 ; (main.s1006 + 0)
.s4221:
293c : a2 00 __ LDX #$00
.l1004:
293e : 86 56 __ STX T2 + 0 
2940 : bd 54 6e LDA $6e54,x 
2943 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19510:
2946 : 2c 00 d6 BIT $d600 
2949 : 10 fb __ BPL $2946 ; (main.l19510 + 0)
.s1009:
294b : 8d 01 d6 STA $d601 
294e : a6 56 __ LDX T2 + 0 
2950 : e8 __ __ INX
2951 : e4 57 __ CPX T3 + 0 
2953 : 90 e9 __ BCC $293e ; (main.l1004 + 0)
.s1006:
2955 : a9 12 __ LDA #$12
2957 : 8d 00 d6 STA $d600 
295a : c6 57 __ DEC T3 + 0 
295c : ad 30 83 LDA $8330 ; (vdc_state + 10)
295f : 18 __ __ CLC
2960 : 65 53 __ ADC T0 + 0 
2962 : aa __ __ TAX
2963 : ad 31 83 LDA $8331 ; (vdc_state + 11)
2966 : 65 54 __ ADC T0 + 1 
.l19513:
2968 : 2c 00 d6 BIT $d600 
296b : 10 fb __ BPL $2968 ; (main.l19513 + 0)
.s1016:
296d : 8d 01 d6 STA $d601 
2970 : a9 13 __ LDA #$13
2972 : 8d 00 d6 STA $d600 
.l19515:
2975 : 2c 00 d6 BIT $d600 
2978 : 10 fb __ BPL $2975 ; (main.l19515 + 0)
.s1021:
297a : 8e 01 d6 STX $d601 
297d : a9 1f __ LDA #$1f
297f : 8d 00 d6 STA $d600 
.l19517:
2982 : 2c 00 d6 BIT $d600 
2985 : 10 fb __ BPL $2982 ; (main.l19517 + 0)
.s1025:
2987 : a5 55 __ LDA T1 + 0 
2989 : 8d 01 d6 STA $d601 
298c : a9 18 __ LDA #$18
298e : 8d 00 d6 STA $d600 
.l19519:
2991 : 2c 00 d6 BIT $d600 
2994 : 10 fb __ BPL $2991 ; (main.l19519 + 0)
.s1031:
2996 : ad 01 d6 LDA $d601 
2999 : 29 7f __ AND #$7f
299b : a2 18 __ LDX #$18
299d : 8e 00 d6 STX $d600 
.l19521:
29a0 : 2c 00 d6 BIT $d600 
29a3 : 10 fb __ BPL $29a0 ; (main.l19521 + 0)
.s1037:
29a5 : 8d 01 d6 STA $d601 
29a8 : a9 1e __ LDA #$1e
29aa : 8d 00 d6 STA $d600 
.l19523:
29ad : 2c 00 d6 BIT $d600 
29b0 : 10 fb __ BPL $29ad ; (main.l19523 + 0)
.s1042:
29b2 : a5 57 __ LDA T3 + 0 
29b4 : 8d 01 d6 STA $d601 
29b7 : a9 00 __ LDA #$00
29b9 : 85 0d __ STA P0 
29bb : a9 14 __ LDA #$14
29bd : 85 0e __ STA P1 
29bf : ad 2d 83 LDA $832d ; (vdc_state + 7)
29c2 : 85 55 __ STA T1 + 0 
29c4 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
29c7 : a5 1b __ LDA ACCU + 0 
29c9 : 85 53 __ STA T0 + 0 
29cb : a5 1c __ LDA ACCU + 1 
29cd : 85 54 __ STA T0 + 1 
29cf : a9 8e __ LDA #$8e
29d1 : 85 0d __ STA P0 
29d3 : a9 6e __ LDA #$6e
29d5 : 85 0e __ STA P1 
29d7 : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
29da : a5 1b __ LDA ACCU + 0 
29dc : 85 57 __ STA T3 + 0 
29de : a9 12 __ LDA #$12
29e0 : 8d 00 d6 STA $d600 
29e3 : 18 __ __ CLC
29e4 : a5 53 __ LDA T0 + 0 
29e6 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
29e9 : aa __ __ TAX
29ea : a5 54 __ LDA T0 + 1 
29ec : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19525:
29ef : 2c 00 d6 BIT $d600 
29f2 : 10 fb __ BPL $29ef ; (main.l19525 + 0)
.s1050:
29f4 : 8d 01 d6 STA $d601 
29f7 : a9 13 __ LDA #$13
29f9 : 8d 00 d6 STA $d600 
.l19527:
29fc : 2c 00 d6 BIT $d600 
29ff : 10 fb __ BPL $29fc ; (main.l19527 + 0)
.s1055:
2a01 : 8e 01 d6 STX $d601 
2a04 : a9 1f __ LDA #$1f
2a06 : 8d 00 d6 STA $d600 
2a09 : a5 1b __ LDA ACCU + 0 
2a0b : f0 19 __ BEQ $2a26 ; (main.s1060 + 0)
.s4211:
2a0d : a2 00 __ LDX #$00
.l1058:
2a0f : 86 56 __ STX T2 + 0 
2a11 : bd 8e 6e LDA $6e8e,x 
2a14 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19530:
2a17 : 2c 00 d6 BIT $d600 
2a1a : 10 fb __ BPL $2a17 ; (main.l19530 + 0)
.s1063:
2a1c : 8d 01 d6 STA $d601 
2a1f : a6 56 __ LDX T2 + 0 
2a21 : e8 __ __ INX
2a22 : e4 57 __ CPX T3 + 0 
2a24 : 90 e9 __ BCC $2a0f ; (main.l1058 + 0)
.s1060:
2a26 : a9 12 __ LDA #$12
2a28 : 8d 00 d6 STA $d600 
2a2b : c6 57 __ DEC T3 + 0 
2a2d : ad 30 83 LDA $8330 ; (vdc_state + 10)
2a30 : 18 __ __ CLC
2a31 : 65 53 __ ADC T0 + 0 
2a33 : aa __ __ TAX
2a34 : ad 31 83 LDA $8331 ; (vdc_state + 11)
2a37 : 65 54 __ ADC T0 + 1 
.l19533:
2a39 : 2c 00 d6 BIT $d600 
2a3c : 10 fb __ BPL $2a39 ; (main.l19533 + 0)
.s1070:
2a3e : 8d 01 d6 STA $d601 
2a41 : a9 13 __ LDA #$13
2a43 : 8d 00 d6 STA $d600 
.l19535:
2a46 : 2c 00 d6 BIT $d600 
2a49 : 10 fb __ BPL $2a46 ; (main.l19535 + 0)
.s1075:
2a4b : 8e 01 d6 STX $d601 
2a4e : a9 1f __ LDA #$1f
2a50 : 8d 00 d6 STA $d600 
.l19537:
2a53 : 2c 00 d6 BIT $d600 
2a56 : 10 fb __ BPL $2a53 ; (main.l19537 + 0)
.s1079:
2a58 : a5 55 __ LDA T1 + 0 
2a5a : 8d 01 d6 STA $d601 
2a5d : a9 18 __ LDA #$18
2a5f : 8d 00 d6 STA $d600 
.l19539:
2a62 : 2c 00 d6 BIT $d600 
2a65 : 10 fb __ BPL $2a62 ; (main.l19539 + 0)
.s1085:
2a67 : ad 01 d6 LDA $d601 
2a6a : 29 7f __ AND #$7f
2a6c : a2 18 __ LDX #$18
2a6e : 8e 00 d6 STX $d600 
.l19541:
2a71 : 2c 00 d6 BIT $d600 
2a74 : 10 fb __ BPL $2a71 ; (main.l19541 + 0)
.s1091:
2a76 : 8d 01 d6 STA $d601 
2a79 : a9 1e __ LDA #$1e
2a7b : 8d 00 d6 STA $d600 
.l19543:
2a7e : 2c 00 d6 BIT $d600 
2a81 : 10 fb __ BPL $2a7e ; (main.l19543 + 0)
.s1096:
2a83 : a5 57 __ LDA T3 + 0 
2a85 : 8d 01 d6 STA $d601 
2a88 : a9 00 __ LDA #$00
2a8a : 85 0d __ STA P0 
2a8c : a9 15 __ LDA #$15
2a8e : 85 0e __ STA P1 
2a90 : ad 2d 83 LDA $832d ; (vdc_state + 7)
2a93 : 85 55 __ STA T1 + 0 
2a95 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
2a98 : a5 1b __ LDA ACCU + 0 
2a9a : 85 53 __ STA T0 + 0 
2a9c : a5 1c __ LDA ACCU + 1 
2a9e : 85 54 __ STA T0 + 1 
2aa0 : a9 00 __ LDA #$00
2aa2 : 85 0d __ STA P0 
2aa4 : a9 6f __ LDA #$6f
2aa6 : 85 0e __ STA P1 
2aa8 : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
2aab : a5 1b __ LDA ACCU + 0 
2aad : 85 57 __ STA T3 + 0 
2aaf : a9 12 __ LDA #$12
2ab1 : 8d 00 d6 STA $d600 
2ab4 : 18 __ __ CLC
2ab5 : a5 53 __ LDA T0 + 0 
2ab7 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
2aba : aa __ __ TAX
2abb : a5 54 __ LDA T0 + 1 
2abd : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19545:
2ac0 : 2c 00 d6 BIT $d600 
2ac3 : 10 fb __ BPL $2ac0 ; (main.l19545 + 0)
.s1104:
2ac5 : 8d 01 d6 STA $d601 
2ac8 : a9 13 __ LDA #$13
2aca : 8d 00 d6 STA $d600 
.l19547:
2acd : 2c 00 d6 BIT $d600 
2ad0 : 10 fb __ BPL $2acd ; (main.l19547 + 0)
.s1109:
2ad2 : 8e 01 d6 STX $d601 
2ad5 : a9 1f __ LDA #$1f
2ad7 : 8d 00 d6 STA $d600 
2ada : a5 1b __ LDA ACCU + 0 
2adc : f0 19 __ BEQ $2af7 ; (main.s1114 + 0)
.s4201:
2ade : a2 00 __ LDX #$00
.l1112:
2ae0 : 86 56 __ STX T2 + 0 
2ae2 : bd 00 6f LDA $6f00,x 
2ae5 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19550:
2ae8 : 2c 00 d6 BIT $d600 
2aeb : 10 fb __ BPL $2ae8 ; (main.l19550 + 0)
.s1117:
2aed : 8d 01 d6 STA $d601 
2af0 : a6 56 __ LDX T2 + 0 
2af2 : e8 __ __ INX
2af3 : e4 57 __ CPX T3 + 0 
2af5 : 90 e9 __ BCC $2ae0 ; (main.l1112 + 0)
.s1114:
2af7 : a9 12 __ LDA #$12
2af9 : 8d 00 d6 STA $d600 
2afc : c6 57 __ DEC T3 + 0 
2afe : ad 30 83 LDA $8330 ; (vdc_state + 10)
2b01 : 18 __ __ CLC
2b02 : 65 53 __ ADC T0 + 0 
2b04 : aa __ __ TAX
2b05 : ad 31 83 LDA $8331 ; (vdc_state + 11)
2b08 : 65 54 __ ADC T0 + 1 
.l19553:
2b0a : 2c 00 d6 BIT $d600 
2b0d : 10 fb __ BPL $2b0a ; (main.l19553 + 0)
.s1124:
2b0f : 8d 01 d6 STA $d601 
2b12 : a9 13 __ LDA #$13
2b14 : 8d 00 d6 STA $d600 
.l19555:
2b17 : 2c 00 d6 BIT $d600 
2b1a : 10 fb __ BPL $2b17 ; (main.l19555 + 0)
.s1129:
2b1c : 8e 01 d6 STX $d601 
2b1f : a9 1f __ LDA #$1f
2b21 : 8d 00 d6 STA $d600 
.l19557:
2b24 : 2c 00 d6 BIT $d600 
2b27 : 10 fb __ BPL $2b24 ; (main.l19557 + 0)
.s1133:
2b29 : a5 55 __ LDA T1 + 0 
2b2b : 8d 01 d6 STA $d601 
2b2e : a9 18 __ LDA #$18
2b30 : 8d 00 d6 STA $d600 
.l19559:
2b33 : 2c 00 d6 BIT $d600 
2b36 : 10 fb __ BPL $2b33 ; (main.l19559 + 0)
.s1139:
2b38 : ad 01 d6 LDA $d601 
2b3b : 29 7f __ AND #$7f
2b3d : a2 18 __ LDX #$18
2b3f : 8e 00 d6 STX $d600 
.l19561:
2b42 : 2c 00 d6 BIT $d600 
2b45 : 10 fb __ BPL $2b42 ; (main.l19561 + 0)
.s1145:
2b47 : 8d 01 d6 STA $d601 
2b4a : a9 1e __ LDA #$1e
2b4c : 8d 00 d6 STA $d600 
.l19563:
2b4f : 2c 00 d6 BIT $d600 
2b52 : 10 fb __ BPL $2b4f ; (main.l19563 + 0)
.s1150:
2b54 : a5 57 __ LDA T3 + 0 
2b56 : 8d 01 d6 STA $d601 
2b59 : a9 2b __ LDA #$2b
2b5b : 85 14 __ STA P7 
2b5d : a9 bf __ LDA #$bf
2b5f : 85 15 __ STA P8 
2b61 : 20 37 6f JSR $6f37 ; (vdcwin_cpy_viewport.s0 + 0)
2b64 : ad d3 7e LDA $7ed3 ; (menubar + 50)
2b67 : 85 0f __ STA P2 
2b69 : 20 1a 6c JSR $6c1a ; (menu_placebar.s0 + 0)
.l20334:
2b6c : a9 01 __ LDA #$01
2b6e : 85 55 __ STA T1 + 0 
.l1154:
2b70 : a6 55 __ LDX T1 + 0 
2b72 : bd cd 7e LDA $7ecd,x ; (menubar + 44)
2b75 : 85 0d __ STA P0 
2b77 : 20 a6 4f JSR $4fa6 ; (vdc_coords@proxy + 0)
2b7a : a5 1b __ LDA ACCU + 0 
2b7c : 85 57 __ STA T3 + 0 
2b7e : a5 1c __ LDA ACCU + 1 
2b80 : 85 58 __ STA T3 + 1 
2b82 : a6 55 __ LDX T1 + 0 
2b84 : bd 7e 7e LDA $7e7e,x ; (__multab9L + 0)
2b87 : 18 __ __ CLC
2b88 : 69 98 __ ADC #$98
2b8a : 85 53 __ STA T0 + 0 
2b8c : 85 0d __ STA P0 
2b8e : a9 7e __ LDA #$7e
2b90 : 69 00 __ ADC #$00
2b92 : 85 54 __ STA T0 + 1 
2b94 : 85 0e __ STA P1 
2b96 : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
2b99 : a5 1b __ LDA ACCU + 0 
2b9b : 85 59 __ STA T4 + 0 
2b9d : ad 2e 83 LDA $832e ; (vdc_state + 8)
2ba0 : 18 __ __ CLC
2ba1 : 65 57 __ ADC T3 + 0 
2ba3 : a2 12 __ LDX #$12
2ba5 : 8e 00 d6 STX $d600 
2ba8 : aa __ __ TAX
2ba9 : ad 2f 83 LDA $832f ; (vdc_state + 9)
2bac : 65 58 __ ADC T3 + 1 
.l19565:
2bae : 2c 00 d6 BIT $d600 
2bb1 : 10 fb __ BPL $2bae ; (main.l19565 + 0)
.s1162:
2bb3 : 8d 01 d6 STA $d601 
2bb6 : a9 13 __ LDA #$13
2bb8 : 8d 00 d6 STA $d600 
.l19567:
2bbb : 2c 00 d6 BIT $d600 
2bbe : 10 fb __ BPL $2bbb ; (main.l19567 + 0)
.s1167:
2bc0 : 8e 01 d6 STX $d601 
2bc3 : a9 1f __ LDA #$1f
2bc5 : 8d 00 d6 STA $d600 
2bc8 : a5 1b __ LDA ACCU + 0 
2bca : f0 18 __ BEQ $2be4 ; (main.s1172 + 0)
.s4190:
2bcc : a0 00 __ LDY #$00
.l1170:
2bce : 84 56 __ STY T2 + 0 
2bd0 : b1 53 __ LDA (T0 + 0),y 
2bd2 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19570:
2bd5 : 2c 00 d6 BIT $d600 
2bd8 : 10 fb __ BPL $2bd5 ; (main.l19570 + 0)
.s1175:
2bda : 8d 01 d6 STA $d601 
2bdd : a4 56 __ LDY T2 + 0 
2bdf : c8 __ __ INY
2be0 : c4 59 __ CPY T4 + 0 
2be2 : 90 ea __ BCC $2bce ; (main.l1170 + 0)
.s1172:
2be4 : a9 12 __ LDA #$12
2be6 : 8d 00 d6 STA $d600 
2be9 : c6 59 __ DEC T4 + 0 
2beb : ad 30 83 LDA $8330 ; (vdc_state + 10)
2bee : 18 __ __ CLC
2bef : 65 57 __ ADC T3 + 0 
2bf1 : aa __ __ TAX
2bf2 : ad 31 83 LDA $8331 ; (vdc_state + 11)
2bf5 : 65 58 __ ADC T3 + 1 
.l19573:
2bf7 : 2c 00 d6 BIT $d600 
2bfa : 10 fb __ BPL $2bf7 ; (main.l19573 + 0)
.s1182:
2bfc : 8d 01 d6 STA $d601 
2bff : a9 13 __ LDA #$13
2c01 : 8d 00 d6 STA $d600 
.l19575:
2c04 : 2c 00 d6 BIT $d600 
2c07 : 10 fb __ BPL $2c04 ; (main.l19575 + 0)
.s1187:
2c09 : 8e 01 d6 STX $d601 
2c0c : a9 1f __ LDA #$1f
2c0e : 8d 00 d6 STA $d600 
.l19577:
2c11 : 2c 00 d6 BIT $d600 
2c14 : 10 fb __ BPL $2c11 ; (main.l19577 + 0)
.s1191:
2c16 : a9 cf __ LDA #$cf
2c18 : 8d 01 d6 STA $d601 
2c1b : a9 18 __ LDA #$18
2c1d : 8d 00 d6 STA $d600 
.l19579:
2c20 : 2c 00 d6 BIT $d600 
2c23 : 10 fb __ BPL $2c20 ; (main.l19579 + 0)
.s1197:
2c25 : ad 01 d6 LDA $d601 
2c28 : 29 7f __ AND #$7f
2c2a : a2 18 __ LDX #$18
2c2c : 8e 00 d6 STX $d600 
.l19581:
2c2f : 2c 00 d6 BIT $d600 
2c32 : 10 fb __ BPL $2c2f ; (main.l19581 + 0)
.s1203:
2c34 : 8d 01 d6 STA $d601 
2c37 : a9 1e __ LDA #$1e
2c39 : 8d 00 d6 STA $d600 
.l19583:
2c3c : 2c 00 d6 BIT $d600 
2c3f : 10 fb __ BPL $2c3c ; (main.l19583 + 0)
.s1208:
2c41 : a5 59 __ LDA T4 + 0 
2c43 : 8d 01 d6 STA $d601 
.l1209:
2c46 : 20 8c 6a JSR $6a8c ; (vdcwin_getch.s0 + 0)
2c49 : a5 1b __ LDA ACCU + 0 
2c4b : 85 53 __ STA T0 + 0 
2c4d : c9 0d __ CMP #$0d
2c4f : f0 10 __ BEQ $2c61 ; (main.s1210 + 0)
.s1214:
2c51 : c9 9d __ CMP #$9d
2c53 : f0 0c __ BEQ $2c61 ; (main.s1210 + 0)
.s1213:
2c55 : c9 1d __ CMP #$1d
2c57 : f0 08 __ BEQ $2c61 ; (main.s1210 + 0)
.s1212:
2c59 : c9 1b __ CMP #$1b
2c5b : f0 04 __ BEQ $2c61 ; (main.s1210 + 0)
.s1211:
2c5d : c9 03 __ CMP #$03
2c5f : d0 e5 __ BNE $2c46 ; (main.l1209 + 0)
.s1210:
2c61 : a6 55 __ LDX T1 + 0 
2c63 : bd cd 7e LDA $7ecd,x ; (menubar + 44)
2c66 : 85 0d __ STA P0 
2c68 : 20 a6 4f JSR $4fa6 ; (vdc_coords@proxy + 0)
2c6b : a5 1b __ LDA ACCU + 0 
2c6d : 85 59 __ STA T4 + 0 
2c6f : a5 1c __ LDA ACCU + 1 
2c71 : 85 5a __ STA T4 + 1 
2c73 : a6 55 __ LDX T1 + 0 
2c75 : bd 7e 7e LDA $7e7e,x ; (__multab9L + 0)
2c78 : 18 __ __ CLC
2c79 : 69 98 __ ADC #$98
2c7b : 85 57 __ STA T3 + 0 
2c7d : 85 0d __ STA P0 
2c7f : a9 7e __ LDA #$7e
2c81 : 69 00 __ ADC #$00
2c83 : 85 58 __ STA T3 + 1 
2c85 : 85 0e __ STA P1 
2c87 : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
2c8a : a5 1b __ LDA ACCU + 0 
2c8c : 85 5b __ STA T5 + 0 
2c8e : ad 2e 83 LDA $832e ; (vdc_state + 8)
2c91 : 18 __ __ CLC
2c92 : 65 59 __ ADC T4 + 0 
2c94 : a2 12 __ LDX #$12
2c96 : 8e 00 d6 STX $d600 
2c99 : aa __ __ TAX
2c9a : ad 2f 83 LDA $832f ; (vdc_state + 9)
2c9d : 65 5a __ ADC T4 + 1 
.l19586:
2c9f : 2c 00 d6 BIT $d600 
2ca2 : 10 fb __ BPL $2c9f ; (main.l19586 + 0)
.s1221:
2ca4 : 8d 01 d6 STA $d601 
2ca7 : a9 13 __ LDA #$13
2ca9 : 8d 00 d6 STA $d600 
.l19588:
2cac : 2c 00 d6 BIT $d600 
2caf : 10 fb __ BPL $2cac ; (main.l19588 + 0)
.s1226:
2cb1 : 8e 01 d6 STX $d601 
2cb4 : a9 1f __ LDA #$1f
2cb6 : 8d 00 d6 STA $d600 
2cb9 : a5 1b __ LDA ACCU + 0 
2cbb : f0 18 __ BEQ $2cd5 ; (main.s1231 + 0)
.s4179:
2cbd : a0 00 __ LDY #$00
.l1229:
2cbf : 84 56 __ STY T2 + 0 
2cc1 : b1 57 __ LDA (T3 + 0),y 
2cc3 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19591:
2cc6 : 2c 00 d6 BIT $d600 
2cc9 : 10 fb __ BPL $2cc6 ; (main.l19591 + 0)
.s1234:
2ccb : 8d 01 d6 STA $d601 
2cce : a4 56 __ LDY T2 + 0 
2cd0 : c8 __ __ INY
2cd1 : c4 5b __ CPY T5 + 0 
2cd3 : 90 ea __ BCC $2cbf ; (main.l1229 + 0)
.s1231:
2cd5 : a9 12 __ LDA #$12
2cd7 : 8d 00 d6 STA $d600 
2cda : c6 5b __ DEC T5 + 0 
2cdc : ad 30 83 LDA $8330 ; (vdc_state + 10)
2cdf : 18 __ __ CLC
2ce0 : 65 59 __ ADC T4 + 0 
2ce2 : aa __ __ TAX
2ce3 : ad 31 83 LDA $8331 ; (vdc_state + 11)
2ce6 : 65 5a __ ADC T4 + 1 
.l19594:
2ce8 : 2c 00 d6 BIT $d600 
2ceb : 10 fb __ BPL $2ce8 ; (main.l19594 + 0)
.s1241:
2ced : 8d 01 d6 STA $d601 
2cf0 : a9 13 __ LDA #$13
2cf2 : 8d 00 d6 STA $d600 
.l19596:
2cf5 : 2c 00 d6 BIT $d600 
2cf8 : 10 fb __ BPL $2cf5 ; (main.l19596 + 0)
.s1246:
2cfa : 8e 01 d6 STX $d601 
2cfd : a9 1f __ LDA #$1f
2cff : 8d 00 d6 STA $d600 
.l19598:
2d02 : 2c 00 d6 BIT $d600 
2d05 : 10 fb __ BPL $2d02 ; (main.l19598 + 0)
.s1250:
2d07 : a9 c4 __ LDA #$c4
2d09 : 8d 01 d6 STA $d601 
2d0c : a9 18 __ LDA #$18
2d0e : 8d 00 d6 STA $d600 
.l19600:
2d11 : 2c 00 d6 BIT $d600 
2d14 : 10 fb __ BPL $2d11 ; (main.l19600 + 0)
.s1256:
2d16 : ad 01 d6 LDA $d601 
2d19 : 29 7f __ AND #$7f
2d1b : a2 18 __ LDX #$18
2d1d : 8e 00 d6 STX $d600 
.l19602:
2d20 : 2c 00 d6 BIT $d600 
2d23 : 10 fb __ BPL $2d20 ; (main.l19602 + 0)
.s1262:
2d25 : 8d 01 d6 STA $d601 
2d28 : a9 1e __ LDA #$1e
2d2a : 8d 00 d6 STA $d600 
.l19604:
2d2d : 2c 00 d6 BIT $d600 
2d30 : 10 fb __ BPL $2d2d ; (main.l19604 + 0)
.s1267:
2d32 : a5 5b __ LDA T5 + 0 
2d34 : 8d 01 d6 STA $d601 
2d37 : a5 53 __ LDA T0 + 0 
2d39 : c9 9d __ CMP #$9d
2d3b : d0 03 __ BNE $2d40 ; (main.s1269 + 0)
2d3d : 4c 25 4d JMP $4d25 ; (main.s1268 + 0)
.s1269:
2d40 : c9 1d __ CMP #$1d
2d42 : d0 0d __ BNE $2d51 ; (main.s1270 + 0)
.s1274:
2d44 : e6 55 __ INC T1 + 0 
2d46 : a5 55 __ LDA T1 + 0 
2d48 : c9 06 __ CMP #$06
2d4a : 90 05 __ BCC $2d51 ; (main.s1270 + 0)
.s1277:
2d4c : a9 01 __ LDA #$01
2d4e : 4c 1e 4d JMP $4d1e ; (main.s2166 + 0)
.s1270:
2d51 : a5 53 __ LDA T0 + 0 
2d53 : c9 0d __ CMP #$0d
2d55 : d0 03 __ BNE $2d5a ; (main.s1281 + 0)
2d57 : 4c d5 4c JMP $4cd5 ; (main.s1155 + 0)
.s1281:
2d5a : c9 1b __ CMP #$1b
2d5c : f0 07 __ BEQ $2d65 ; (main.s1283 + 0)
.s1280:
2d5e : c9 03 __ CMP #$03
2d60 : f0 03 __ BEQ $2d65 ; (main.s1283 + 0)
2d62 : 4c 70 2b JMP $2b70 ; (main.l1154 + 0)
.s1283:
2d65 : a9 63 __ LDA #$63
2d67 : 85 56 __ STA T2 + 0 
.s1153:
2d69 : a5 55 __ LDA T1 + 0 
2d6b : 0a __ __ ASL
2d6c : 85 1b __ STA ACCU + 0 
2d6e : a9 00 __ LDA #$00
2d70 : 2a __ __ ROL
2d71 : 06 1b __ ASL ACCU + 0 
2d73 : 2a __ __ ROL
2d74 : 85 1c __ STA ACCU + 1 
2d76 : a5 1b __ LDA ACCU + 0 
2d78 : 65 55 __ ADC T1 + 0 
2d7a : 0a __ __ ASL
2d7b : 18 __ __ CLC
2d7c : 65 56 __ ADC T2 + 0 
2d7e : 85 53 __ STA T0 + 0 
2d80 : c9 1f __ CMP #$1f
2d82 : b0 03 __ BCS $2d87 ; (main.s3659 + 0)
2d84 : 4c 9b 48 JMP $489b ; (main.s3661 + 0)
.s3659:
2d87 : c9 21 __ CMP #$21
2d89 : 90 03 __ BCC $2d8e ; (main.s1470 + 0)
2d8b : 4c 46 41 JMP $4146 ; (main.s3660 + 0)
.s1470:
2d8e : 38 __ __ SEC
2d8f : e9 1f __ SBC #$1f
2d91 : 85 57 __ STA T3 + 0 
2d93 : a9 02 __ LDA #$02
2d95 : 85 55 __ STA T1 + 0 
2d97 : a9 00 __ LDA #$00
2d99 : 85 0d __ STA P0 
.l1473:
2d9b : ad 2d 83 LDA $832d ; (vdc_state + 7)
2d9e : 85 56 __ STA T2 + 0 
2da0 : a5 55 __ LDA T1 + 0 
2da2 : c9 19 __ CMP #$19
2da4 : b0 03 __ BCS $2da9 ; (main.s1472 + 0)
2da6 : 4c 7c 40 JMP $407c ; (main.s1474 + 0)
.s1472:
2da9 : a9 03 __ LDA #$03
2dab : 85 0e __ STA P1 
2dad : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
2db0 : a5 1b __ LDA ACCU + 0 
2db2 : 85 59 __ STA T4 + 0 
2db4 : a5 1c __ LDA ACCU + 1 
2db6 : 85 5a __ STA T4 + 1 
2db8 : a9 6a __ LDA #$6a
2dba : 85 0d __ STA P0 
2dbc : a9 7c __ LDA #$7c
2dbe : 85 0e __ STA P1 
2dc0 : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
2dc3 : a5 1b __ LDA ACCU + 0 
2dc5 : 85 5b __ STA T5 + 0 
2dc7 : a9 12 __ LDA #$12
2dc9 : 8d 00 d6 STA $d600 
2dcc : 18 __ __ CLC
2dcd : a5 59 __ LDA T4 + 0 
2dcf : 6d 2e 83 ADC $832e ; (vdc_state + 8)
2dd2 : aa __ __ TAX
2dd3 : a5 5a __ LDA T4 + 1 
2dd5 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19717:
2dd8 : 2c 00 d6 BIT $d600 
2ddb : 10 fb __ BPL $2dd8 ; (main.l19717 + 0)
.s1551:
2ddd : 8d 01 d6 STA $d601 
2de0 : a9 13 __ LDA #$13
2de2 : 8d 00 d6 STA $d600 
.l19719:
2de5 : 2c 00 d6 BIT $d600 
2de8 : 10 fb __ BPL $2de5 ; (main.l19719 + 0)
.s1556:
2dea : 8e 01 d6 STX $d601 
2ded : a9 1f __ LDA #$1f
2def : 8d 00 d6 STA $d600 
2df2 : a5 1b __ LDA ACCU + 0 
2df4 : f0 19 __ BEQ $2e0f ; (main.s1561 + 0)
.s4092:
2df6 : a2 00 __ LDX #$00
.l1559:
2df8 : 86 55 __ STX T1 + 0 
2dfa : bd 6a 7c LDA $7c6a,x 
2dfd : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19722:
2e00 : 2c 00 d6 BIT $d600 
2e03 : 10 fb __ BPL $2e00 ; (main.l19722 + 0)
.s1564:
2e05 : 8d 01 d6 STA $d601 
2e08 : a6 55 __ LDX T1 + 0 
2e0a : e8 __ __ INX
2e0b : e4 5b __ CPX T5 + 0 
2e0d : 90 e9 __ BCC $2df8 ; (main.l1559 + 0)
.s1561:
2e0f : a9 12 __ LDA #$12
2e11 : 8d 00 d6 STA $d600 
2e14 : c6 5b __ DEC T5 + 0 
2e16 : ad 30 83 LDA $8330 ; (vdc_state + 10)
2e19 : 18 __ __ CLC
2e1a : 65 59 __ ADC T4 + 0 
2e1c : aa __ __ TAX
2e1d : ad 31 83 LDA $8331 ; (vdc_state + 11)
2e20 : 65 5a __ ADC T4 + 1 
.l19725:
2e22 : 2c 00 d6 BIT $d600 
2e25 : 10 fb __ BPL $2e22 ; (main.l19725 + 0)
.s1571:
2e27 : 8d 01 d6 STA $d601 
2e2a : a9 13 __ LDA #$13
2e2c : 8d 00 d6 STA $d600 
.l19727:
2e2f : 2c 00 d6 BIT $d600 
2e32 : 10 fb __ BPL $2e2f ; (main.l19727 + 0)
.s1576:
2e34 : 8e 01 d6 STX $d601 
2e37 : a9 1f __ LDA #$1f
2e39 : 8d 00 d6 STA $d600 
.l19729:
2e3c : 2c 00 d6 BIT $d600 
2e3f : 10 fb __ BPL $2e3c ; (main.l19729 + 0)
.s1580:
2e41 : a5 56 __ LDA T2 + 0 
2e43 : 8d 01 d6 STA $d601 
2e46 : a9 18 __ LDA #$18
2e48 : 8d 00 d6 STA $d600 
.l19731:
2e4b : 2c 00 d6 BIT $d600 
2e4e : 10 fb __ BPL $2e4b ; (main.l19731 + 0)
.s1586:
2e50 : ad 01 d6 LDA $d601 
2e53 : 29 7f __ AND #$7f
2e55 : a2 18 __ LDX #$18
2e57 : 8e 00 d6 STX $d600 
.l19733:
2e5a : 2c 00 d6 BIT $d600 
2e5d : 10 fb __ BPL $2e5a ; (main.l19733 + 0)
.s1592:
2e5f : 8d 01 d6 STA $d601 
2e62 : a9 1e __ LDA #$1e
2e64 : 8d 00 d6 STA $d600 
.l19735:
2e67 : 2c 00 d6 BIT $d600 
2e6a : 10 fb __ BPL $2e67 ; (main.l19735 + 0)
.s1597:
2e6c : a5 5b __ LDA T5 + 0 
2e6e : 8d 01 d6 STA $d601 
2e71 : a5 57 __ LDA T3 + 0 
2e73 : d0 03 __ BNE $2e78 ; (main.s1600 + 0)
2e75 : 4c a8 3f JMP $3fa8 ; (main.s1598 + 0)
.s1600:
2e78 : a9 05 __ LDA #$05
2e7a : 85 11 __ STA P4 
2e7c : 85 12 __ STA P5 
2e7e : a9 46 __ LDA #$46
2e80 : 85 13 __ STA P6 
2e82 : a9 21 __ LDA #$21
2e84 : 85 0f __ STA P2 
2e86 : a9 bf __ LDA #$bf
2e88 : 85 10 __ STA P3 
2e8a : ad 2b 83 LDA $832b ; (vdc_state + 5)
2e8d : 85 59 __ STA T4 + 0 
2e8f : 38 __ __ SEC
2e90 : e9 07 __ SBC #$07
2e92 : 85 14 __ STA P7 
2e94 : ad 2c 83 LDA $832c ; (vdc_state + 6)
2e97 : 85 5a __ STA T4 + 1 
2e99 : 20 15 6a JSR $6a15 ; (vdcwin_init.s0 + 0)
2e9c : ad 8f 7e LDA $7e8f ; (winStyles + 0)
2e9f : 85 55 __ STA T1 + 0 
2ea1 : ad 21 bf LDA $bf21 ; (window + 0)
2ea4 : 85 56 __ STA T2 + 0 
2ea6 : d0 04 __ BNE $2eac ; (main.s1658 + 0)
.s1656:
2ea8 : a9 b0 __ LDA #$b0
2eaa : d0 02 __ BNE $2eae ; (main.s1663 + 0)
.s1658:
2eac : a9 f0 __ LDA #$f0
.s1663:
2eae : 85 61 __ STA T8 + 0 
2eb0 : ad 23 bf LDA $bf23 ; (window + 2)
2eb3 : 85 5f __ STA T7 + 0 
2eb5 : 18 __ __ CLC
2eb6 : 65 56 __ ADC T2 + 0 
2eb8 : 85 64 __ STA T11 + 0 
2eba : a9 00 __ LDA #$00
2ebc : 2a __ __ ROL
2ebd : aa __ __ TAX
2ebe : a5 64 __ LDA T11 + 0 
2ec0 : 69 01 __ ADC #$01
2ec2 : 85 66 __ STA T12 + 0 
2ec4 : 90 01 __ BCC $2ec7 ; (main.s2181 + 0)
.s2180:
2ec6 : e8 __ __ INX
.s2181:
2ec7 : 86 67 __ STX T12 + 1 
2ec9 : ad 2a 83 LDA $832a ; (vdc_state + 4)
2ecc : c5 67 __ CMP T12 + 1 
2ece : d0 05 __ BNE $2ed5 ; (main.s1553 + 0)
.s1552:
2ed0 : ad 29 83 LDA $8329 ; (vdc_state + 3)
2ed3 : c5 66 __ CMP T12 + 0 
.s1553:
2ed5 : b0 06 __ BCS $2edd ; (main.s1667 + 0)
.s1660:
2ed7 : a5 61 __ LDA T8 + 0 
2ed9 : 29 df __ AND #$df
2edb : 85 61 __ STA T8 + 0 
.s1667:
2edd : ad 22 bf LDA $bf22 ; (window + 1)
2ee0 : f0 03 __ BEQ $2ee5 ; (main.s19812 + 0)
2ee2 : 4c c9 3d JMP $3dc9 ; (main.s1664 + 0)
.s19812:
2ee5 : a5 61 __ LDA T8 + 0 
2ee7 : 29 10 __ AND #$10
2ee9 : f0 19 __ BEQ $2f04 ; (main.s4026 + 0)
.s1810:
2eeb : ad 24 bf LDA $bf24 ; (window + 3)
2eee : 18 __ __ CLC
2eef : 6d 22 bf ADC $bf22 ; (window + 1)
2ef2 : 85 5d __ STA T6 + 0 
2ef4 : a9 00 __ LDA #$00
2ef6 : 2a __ __ ROL
2ef7 : c5 5a __ CMP T4 + 1 
2ef9 : d0 04 __ BNE $2eff ; (main.s1503 + 0)
.s1502:
2efb : a5 5d __ LDA T6 + 0 
2efd : c5 59 __ CMP T4 + 0 
.s1503:
2eff : b0 03 __ BCS $2f04 ; (main.s4026 + 0)
2f01 : 4c ef 3b JMP $3bef ; (main.s1807 + 0)
.s4026:
2f04 : a9 00 __ LDA #$00
2f06 : 85 56 __ STA T2 + 0 
2f08 : cd 24 bf CMP $bf24 ; (window + 3)
2f0b : b0 03 __ BCS $2f10 ; (main.s1655 + 0)
2f0d : 4c f1 39 JMP $39f1 ; (main.l1951 + 0)
.s1655:
2f10 : a9 7f __ LDA #$7f
2f12 : 8d 01 bf STA $bf01 ; (viewport + 0)
2f15 : a9 00 __ LDA #$00
2f17 : 8d 08 bf STA $bf08 ; (viewport + 7)
2f1a : 8d 09 bf STA $bf09 ; (viewport + 8)
2f1d : 8d 0a bf STA $bf0a ; (viewport + 9)
2f20 : 8d 0b bf STA $bf0b ; (viewport + 10)
2f23 : a9 05 __ LDA #$05
2f25 : 85 11 __ STA P4 
2f27 : 85 12 __ STA P5 
2f29 : a9 46 __ LDA #$46
2f2b : 85 13 __ STA P6 
2f2d : a5 57 __ LDA T3 + 0 
2f2f : 0a __ __ ASL
2f30 : 0a __ __ ASL
2f31 : aa __ __ TAX
2f32 : bd f5 82 LDA $82f5,x ; (screenset + 0)
2f35 : 8d 02 bf STA $bf02 ; (viewport + 1)
2f38 : bd f6 82 LDA $82f6,x ; (screenset + 1)
2f3b : 8d 03 bf STA $bf03 ; (viewport + 2)
2f3e : bd f7 82 LDA $82f7,x ; (screenset + 2)
2f41 : 8d 04 bf STA $bf04 ; (viewport + 3)
2f44 : bd f8 82 LDA $82f8,x ; (screenset + 3)
2f47 : 8d 06 bf STA $bf06 ; (viewport + 5)
2f4a : a9 00 __ LDA #$00
2f4c : 8d 05 bf STA $bf05 ; (viewport + 4)
2f4f : 8d 07 bf STA $bf07 ; (viewport + 6)
2f52 : a9 0c __ LDA #$0c
2f54 : 85 0f __ STA P2 
2f56 : a9 bf __ LDA #$bf
2f58 : 85 10 __ STA P3 
2f5a : ad 2b 83 LDA $832b ; (vdc_state + 5)
2f5d : 38 __ __ SEC
2f5e : e9 07 __ SBC #$07
2f60 : 85 14 __ STA P7 
2f62 : 20 15 6a JSR $6a15 ; (vdcwin_init.s0 + 0)
2f65 : a9 01 __ LDA #$01
2f67 : 85 14 __ STA P7 
2f69 : a9 bf __ LDA #$bf
2f6b : 85 15 __ STA P8 
2f6d : 20 37 6f JSR $6f37 ; (vdcwin_cpy_viewport.s0 + 0)
.l2094:
2f70 : 20 f0 56 JSR $56f0 ; (getch.s0 + 0)
2f73 : 85 55 __ STA T1 + 0 
2f75 : a9 00 __ LDA #$00
2f77 : 85 56 __ STA T2 + 0 
2f79 : a5 55 __ LDA T1 + 0 
2f7b : c9 57 __ CMP #$57
2f7d : f0 04 __ BEQ $2f83 ; (main.s2099 + 0)
.s2100:
2f7f : c9 91 __ CMP #$91
2f81 : d0 11 __ BNE $2f94 ; (main.s2098 + 0)
.s2099:
2f83 : ad 0a bf LDA $bf0a ; (viewport + 9)
2f86 : 0d 0b bf ORA $bf0b ; (viewport + 10)
2f89 : f0 09 __ BEQ $2f94 ; (main.s2098 + 0)
.s2096:
2f8b : a9 08 __ LDA #$08
2f8d : 85 56 __ STA T2 + 0 
2f8f : a5 55 __ LDA T1 + 0 
2f91 : 4c 9a 2f JMP $2f9a ; (main.s2105 + 0)
.s2098:
2f94 : a5 55 __ LDA T1 + 0 
2f96 : c9 53 __ CMP #$53
2f98 : f0 04 __ BEQ $2f9e ; (main.s2104 + 0)
.s2105:
2f9a : c9 11 __ CMP #$11
2f9c : d0 3a __ BNE $2fd8 ; (main.s2103 + 0)
.s2104:
2f9e : ad 2b 83 LDA $832b ; (vdc_state + 5)
2fa1 : 85 03 __ STA WORK + 0 
2fa3 : ad 2c 83 LDA $832c ; (vdc_state + 6)
2fa6 : 85 04 __ STA WORK + 1 
2fa8 : a5 57 __ LDA T3 + 0 
2faa : 0a __ __ ASL
2fab : 0a __ __ ASL
2fac : aa __ __ TAX
2fad : bd f8 82 LDA $82f8,x ; (screenset + 3)
2fb0 : 38 __ __ SEC
2fb1 : e5 03 __ SBC WORK + 0 
2fb3 : aa __ __ TAX
2fb4 : a9 00 __ LDA #$00
2fb6 : e5 04 __ SBC WORK + 1 
2fb8 : a8 __ __ TAY
2fb9 : 8a __ __ TXA
2fba : 18 __ __ CLC
2fbb : 69 06 __ ADC #$06
2fbd : 85 59 __ STA T4 + 0 
2fbf : 90 01 __ BCC $2fc2 ; (main.s2183 + 0)
.s2182:
2fc1 : c8 __ __ INY
.s2183:
2fc2 : 84 5a __ STY T4 + 1 
2fc4 : ad 0b bf LDA $bf0b ; (viewport + 10)
2fc7 : c5 5a __ CMP T4 + 1 
2fc9 : d0 05 __ BNE $2fd0 ; (main.s1395 + 0)
.s1394:
2fcb : ad 0a bf LDA $bf0a ; (viewport + 9)
2fce : c5 59 __ CMP T4 + 0 
.s1395:
2fd0 : b0 06 __ BCS $2fd8 ; (main.s2103 + 0)
.s2101:
2fd2 : a5 56 __ LDA T2 + 0 
2fd4 : 09 04 __ ORA #$04
2fd6 : 85 56 __ STA T2 + 0 
.s2103:
2fd8 : a5 55 __ LDA T1 + 0 
2fda : c9 41 __ CMP #$41
2fdc : f0 04 __ BEQ $2fe2 ; (main.s2109 + 0)
.s2110:
2fde : c9 9d __ CMP #$9d
2fe0 : d0 0e __ BNE $2ff0 ; (main.s2108 + 0)
.s2109:
2fe2 : ad 08 bf LDA $bf08 ; (viewport + 7)
2fe5 : 0d 09 bf ORA $bf09 ; (viewport + 8)
2fe8 : f0 06 __ BEQ $2ff0 ; (main.s2108 + 0)
.s2106:
2fea : a5 56 __ LDA T2 + 0 
2fec : 09 01 __ ORA #$01
2fee : 85 56 __ STA T2 + 0 
.s2108:
2ff0 : a5 55 __ LDA T1 + 0 
2ff2 : c9 44 __ CMP #$44
2ff4 : f0 04 __ BEQ $2ffa ; (main.s2114 + 0)
.s2115:
2ff6 : c9 1d __ CMP #$1d
2ff8 : d0 2a __ BNE $3024 ; (main.s2113 + 0)
.s2114:
2ffa : a5 57 __ LDA T3 + 0 
2ffc : 0a __ __ ASL
2ffd : 0a __ __ ASL
2ffe : aa __ __ TAX
2fff : bd f7 82 LDA $82f7,x ; (screenset + 2)
3002 : 38 __ __ SEC
3003 : e9 47 __ SBC #$47
3005 : 85 59 __ STA T4 + 0 
3007 : a9 00 __ LDA #$00
3009 : e9 00 __ SBC #$00
300b : 85 5a __ STA T4 + 1 
300d : ad 09 bf LDA $bf09 ; (viewport + 8)
3010 : c5 5a __ CMP T4 + 1 
3012 : d0 05 __ BNE $3019 ; (main.s1385 + 0)
.s1384:
3014 : ad 08 bf LDA $bf08 ; (viewport + 7)
3017 : c5 59 __ CMP T4 + 0 
.s1385:
3019 : b0 09 __ BCS $3024 ; (main.s2113 + 0)
.s2111:
301b : a5 56 __ LDA T2 + 0 
301d : 09 02 __ ORA #$02
301f : 85 56 __ STA T2 + 0 
3021 : 4c 54 31 JMP $3154 ; (main.s2116 + 0)
.s2113:
3024 : a5 56 __ LDA T2 + 0 
3026 : f0 03 __ BEQ $302b ; (main.s2118 + 0)
3028 : 4c 54 31 JMP $3154 ; (main.s2116 + 0)
.s2118:
302b : a5 55 __ LDA T1 + 0 
302d : c9 1b __ CMP #$1b
302f : f0 07 __ BEQ $3038 ; (main.s1299 + 0)
.s3208:
3031 : c9 03 __ CMP #$03
3033 : f0 03 __ BEQ $3038 ; (main.s1299 + 0)
3035 : 4c 70 2f JMP $2f70 ; (main.l2094 + 0)
.s1299:
3038 : a5 53 __ LDA T0 + 0 
303a : c9 0d __ CMP #$0d
303c : f0 03 __ BEQ $3041 ; (main.s631 + 0)
303e : 4c 08 24 JMP $2408 ; (main.l630 + 0)
.s631:
3041 : a9 00 __ LDA #$00
3043 : 20 de 58 JSR $58de ; (fastmode.s0 + 0)
3046 : a9 00 __ LDA #$00
3048 : 85 55 __ STA T1 + 0 
304a : 85 13 __ STA P6 
304c : 20 fd 58 JSR $58fd ; (vdc_set_mode.s0 + 0)
304f : ad 29 83 LDA $8329 ; (vdc_state + 3)
3052 : 85 53 __ STA T0 + 0 
3054 : ad 2b 83 LDA $832b ; (vdc_state + 5)
3057 : 85 57 __ STA T3 + 0 
.l3669:
3059 : a5 55 __ LDA T1 + 0 
305b : c5 57 __ CMP T3 + 0 
305d : 90 21 __ BCC $3080 ; (main.s3670 + 0)
.s3667:
305f : a9 04 __ LDA #$04
3061 : 8d 06 d5 STA $d506 
3064 : a9 00 __ LDA #$00
3066 : 85 1b __ STA ACCU + 0 
3068 : 85 1c __ STA ACCU + 1 
.s1001:
306a : 18 __ __ CLC
306b : a5 23 __ LDA SP + 0 
306d : 69 12 __ ADC #$12
306f : 85 23 __ STA SP + 0 
3071 : 90 02 __ BCC $3075 ; (main.s1001 + 11)
3073 : e6 24 __ INC SP + 1 
3075 : a2 19 __ LDX #$19
3077 : bd b9 be LDA $beb9,x ; (main@stack + 0)
307a : 95 53 __ STA T0 + 0,x 
307c : ca __ __ DEX
307d : 10 f8 __ BPL $3077 ; (main.s1001 + 13)
307f : 60 __ __ RTS
.s3670:
3080 : a9 00 __ LDA #$00
3082 : 85 0d __ STA P0 
3084 : a5 55 __ LDA T1 + 0 
3086 : 85 0e __ STA P1 
3088 : ad 2d 83 LDA $832d ; (vdc_state + 7)
308b : 85 56 __ STA T2 + 0 
308d : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
3090 : a9 12 __ LDA #$12
3092 : 8d 00 d6 STA $d600 
3095 : 18 __ __ CLC
3096 : a5 1b __ LDA ACCU + 0 
3098 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
309b : a8 __ __ TAY
309c : a5 1c __ LDA ACCU + 1 
309e : 6d 2f 83 ADC $832f ; (vdc_state + 9)
30a1 : a6 53 __ LDX T0 + 0 
30a3 : ca __ __ DEX
.l19632:
30a4 : 2c 00 d6 BIT $d600 
30a7 : 10 fb __ BPL $30a4 ; (main.l19632 + 0)
.s3680:
30a9 : 8d 01 d6 STA $d601 
30ac : a9 13 __ LDA #$13
30ae : 8d 00 d6 STA $d600 
.l19634:
30b1 : 2c 00 d6 BIT $d600 
30b4 : 10 fb __ BPL $30b1 ; (main.l19634 + 0)
.s3685:
30b6 : 8c 01 d6 STY $d601 
30b9 : a9 1f __ LDA #$1f
30bb : 8d 00 d6 STA $d600 
.l19636:
30be : 2c 00 d6 BIT $d600 
30c1 : 10 fb __ BPL $30be ; (main.l19636 + 0)
.s3689:
30c3 : a9 20 __ LDA #$20
30c5 : 8d 01 d6 STA $d601 
30c8 : a9 18 __ LDA #$18
30ca : 8d 00 d6 STA $d600 
.l19638:
30cd : 2c 00 d6 BIT $d600 
30d0 : 10 fb __ BPL $30cd ; (main.l19638 + 0)
.s3695:
30d2 : ad 01 d6 LDA $d601 
30d5 : 29 7f __ AND #$7f
30d7 : a0 18 __ LDY #$18
30d9 : 8c 00 d6 STY $d600 
.l19640:
30dc : 2c 00 d6 BIT $d600 
30df : 10 fb __ BPL $30dc ; (main.l19640 + 0)
.s3701:
30e1 : 8d 01 d6 STA $d601 
30e4 : a9 1e __ LDA #$1e
30e6 : 8d 00 d6 STA $d600 
.l19642:
30e9 : 2c 00 d6 BIT $d600 
30ec : 10 fb __ BPL $30e9 ; (main.l19642 + 0)
.s3706:
30ee : 8e 01 d6 STX $d601 
30f1 : ad 30 83 LDA $8330 ; (vdc_state + 10)
30f4 : 18 __ __ CLC
30f5 : 65 1b __ ADC ACCU + 0 
30f7 : a0 12 __ LDY #$12
30f9 : 8c 00 d6 STY $d600 
30fc : a8 __ __ TAY
30fd : ad 31 83 LDA $8331 ; (vdc_state + 11)
3100 : 65 1c __ ADC ACCU + 1 
.l19644:
3102 : 2c 00 d6 BIT $d600 
3105 : 10 fb __ BPL $3102 ; (main.l19644 + 0)
.s3713:
3107 : 8d 01 d6 STA $d601 
310a : a9 13 __ LDA #$13
310c : 8d 00 d6 STA $d600 
.l19646:
310f : 2c 00 d6 BIT $d600 
3112 : 10 fb __ BPL $310f ; (main.l19646 + 0)
.s3718:
3114 : 8c 01 d6 STY $d601 
3117 : a9 1f __ LDA #$1f
3119 : 8d 00 d6 STA $d600 
.l19648:
311c : 2c 00 d6 BIT $d600 
311f : 10 fb __ BPL $311c ; (main.l19648 + 0)
.s3722:
3121 : a5 56 __ LDA T2 + 0 
3123 : 8d 01 d6 STA $d601 
3126 : a9 18 __ LDA #$18
3128 : 8d 00 d6 STA $d600 
.l19650:
312b : 2c 00 d6 BIT $d600 
312e : 10 fb __ BPL $312b ; (main.l19650 + 0)
.s3728:
3130 : ad 01 d6 LDA $d601 
3133 : 29 7f __ AND #$7f
3135 : a0 18 __ LDY #$18
3137 : 8c 00 d6 STY $d600 
.l19652:
313a : 2c 00 d6 BIT $d600 
313d : 10 fb __ BPL $313a ; (main.l19652 + 0)
.s3734:
313f : 8d 01 d6 STA $d601 
3142 : a9 1e __ LDA #$1e
3144 : 8d 00 d6 STA $d600 
.l19654:
3147 : 2c 00 d6 BIT $d600 
314a : 10 fb __ BPL $3147 ; (main.l19654 + 0)
.s3739:
314c : 8e 01 d6 STX $d601 
314f : e6 55 __ INC T1 + 0 
3151 : 4c 59 30 JMP $3059 ; (main.l3669 + 0)
.s2116:
3154 : a2 15 __ LDX #$15
.l1202:
3156 : bd 00 bf LDA $bf00,x ; (vp_fill + 31)
3159 : 9d e0 be STA $bee0,x ; (softscroll + 13)
315c : ca __ __ DEX
315d : d0 f7 __ BNE $3156 ; (main.l1202 + 0)
.s1203:
315f : a5 56 __ LDA T2 + 0 
3161 : 4a __ __ LSR
3162 : 90 4e __ BCC $31b2 ; (main.s19983 + 0)
.s2120:
3164 : 86 61 __ STX T8 + 0 
3166 : ae 0e bf LDX $bf0e ; (viewport + 13)
3169 : ca __ __ DEX
316a : 86 59 __ STX T4 + 0 
316c : ad 12 bf LDA $bf12 ; (viewport + 17)
316f : 85 5b __ STA T5 + 0 
3171 : ad 13 bf LDA $bf13 ; (viewport + 18)
3174 : 85 5c __ STA T5 + 1 
3176 : ad 14 bf LDA $bf14 ; (viewport + 19)
3179 : 85 5d __ STA T6 + 0 
317b : ad 15 bf LDA $bf15 ; (viewport + 20)
.l2124:
317e : 85 5e __ STA T6 + 1 
3180 : a5 61 __ LDA T8 + 0 
3182 : cd 0f bf CMP $bf0f ; (viewport + 14)
3185 : b0 03 __ BCS $318a ; (main.s2123 + 0)
3187 : 4c a8 37 JMP $37a8 ; (main.s2125 + 0)
.s2123:
318a : a9 01 __ LDA #$01
318c : 85 13 __ STA P6 
318e : ad 0f bf LDA $bf0f ; (viewport + 14)
3191 : 85 14 __ STA P7 
3193 : ad e8 be LDA $bee8 ; (vp_fill + 7)
3196 : 18 __ __ CLC
3197 : 69 ff __ ADC #$ff
3199 : 8d e8 be STA $bee8 ; (vp_fill + 7)
319c : b0 03 __ BCS $31a1 ; (main.s2185 + 0)
.s2184:
319e : ce e9 be DEC $bee9 ; (vp_fill + 8)
.s2185:
31a1 : ad 08 bf LDA $bf08 ; (viewport + 7)
31a4 : 18 __ __ CLC
31a5 : 69 ff __ ADC #$ff
31a7 : 8d 08 bf STA $bf08 ; (viewport + 7)
31aa : b0 03 __ BCS $31af ; (main.s2187 + 0)
.s2186:
31ac : ce 09 bf DEC $bf09 ; (viewport + 8)
.s2187:
31af : 20 03 6a JSR $6a03 ; (vdcwin_init@proxy + 0)
.s19983:
31b2 : a5 56 __ LDA T2 + 0 
31b4 : 29 02 __ AND #$02
31b6 : f0 64 __ BEQ $321c ; (main.s20043 + 0)
.s2481:
31b8 : ae 0e bf LDX $bf0e ; (viewport + 13)
31bb : ca __ __ DEX
31bc : 86 59 __ STX T4 + 0 
31be : a9 00 __ LDA #$00
31c0 : 85 61 __ STA T8 + 0 
31c2 : ad 12 bf LDA $bf12 ; (viewport + 17)
31c5 : 85 5b __ STA T5 + 0 
31c7 : ad 13 bf LDA $bf13 ; (viewport + 18)
31ca : 85 5c __ STA T5 + 1 
31cc : ad 14 bf LDA $bf14 ; (viewport + 19)
31cf : 85 5d __ STA T6 + 0 
31d1 : ad 15 bf LDA $bf15 ; (viewport + 20)
.l2485:
31d4 : 85 5e __ STA T6 + 1 
31d6 : a5 61 __ LDA T8 + 0 
31d8 : cd 0f bf CMP $bf0f ; (viewport + 14)
31db : b0 03 __ BCS $31e0 ; (main.s2484 + 0)
31dd : 4c 69 35 JMP $3569 ; (main.s2486 + 0)
.s2484:
31e0 : a9 01 __ LDA #$01
31e2 : 85 13 __ STA P6 
31e4 : ad 0f bf LDA $bf0f ; (viewport + 14)
31e7 : 85 14 __ STA P7 
31e9 : ad e8 be LDA $bee8 ; (vp_fill + 7)
31ec : 18 __ __ CLC
31ed : 6d 0e bf ADC $bf0e ; (viewport + 13)
31f0 : 8d e8 be STA $bee8 ; (vp_fill + 7)
31f3 : 90 03 __ BCC $31f8 ; (main.s2189 + 0)
.s2188:
31f5 : ee e9 be INC $bee9 ; (vp_fill + 8)
.s2189:
31f8 : ee 08 bf INC $bf08 ; (viewport + 7)
31fb : d0 03 __ BNE $3200 ; (main.s2191 + 0)
.s2190:
31fd : ee 09 bf INC $bf09 ; (viewport + 8)
.s2191:
3200 : a9 ec __ LDA #$ec
3202 : 85 0f __ STA P2 
3204 : a9 be __ LDA #$be
3206 : 85 10 __ STA P3 
3208 : ad 0c bf LDA $bf0c ; (viewport + 11)
320b : 18 __ __ CLC
320c : 6d 0e bf ADC $bf0e ; (viewport + 13)
320f : 38 __ __ SEC
3210 : e9 01 __ SBC #$01
3212 : 85 11 __ STA P4 
3214 : ad 0d bf LDA $bf0d ; (viewport + 12)
3217 : 85 12 __ STA P5 
3219 : 20 15 6a JSR $6a15 ; (vdcwin_init.s0 + 0)
.s20043:
321c : a5 56 __ LDA T2 + 0 
321e : 29 08 __ AND #$08
3220 : f0 03 __ BEQ $3225 ; (main.s20073 + 0)
3222 : 4c cd 33 JMP $33cd ; (main.s2842 + 0)
.s20073:
3225 : a5 56 __ LDA T2 + 0 
3227 : 29 04 __ AND #$04
3229 : d0 0e __ BNE $3239 ; (main.s3025 + 0)
.s20336:
322b : a9 e1 __ LDA #$e1
322d : 85 14 __ STA P7 
322f : a9 be __ LDA #$be
3231 : 85 15 __ STA P8 
3233 : 20 37 6f JSR $6f37 ; (vdcwin_cpy_viewport.s0 + 0)
3236 : 4c 2b 30 JMP $302b ; (main.s2118 + 0)
.s3025:
3239 : ad 0f bf LDA $bf0f ; (viewport + 14)
323c : 85 59 __ STA T4 + 0 
323e : 38 __ __ SEC
323f : e9 01 __ SBC #$01
3241 : 85 5b __ STA T5 + 0 
3243 : a9 00 __ LDA #$00
3245 : e9 00 __ SBC #$00
3247 : 85 5c __ STA T5 + 1 
3249 : ad 29 83 LDA $8329 ; (vdc_state + 3)
324c : 85 5d __ STA T6 + 0 
324e : ad 2a 83 LDA $832a ; (vdc_state + 4)
3251 : 85 5e __ STA T6 + 1 
3253 : ad 0e bf LDA $bf0e ; (viewport + 13)
3256 : 85 61 __ STA T8 + 0 
3258 : ad 12 bf LDA $bf12 ; (viewport + 17)
325b : 85 5f __ STA T7 + 0 
325d : ad 13 bf LDA $bf13 ; (viewport + 18)
3260 : 85 60 __ STA T7 + 1 
3262 : ad 14 bf LDA $bf14 ; (viewport + 19)
3265 : 85 64 __ STA T11 + 0 
3267 : ad 15 bf LDA $bf15 ; (viewport + 20)
326a : a2 00 __ LDX #$00
.l3029:
326c : 85 65 __ STA T11 + 1 
326e : a5 5c __ LDA T5 + 1 
3270 : d0 41 __ BNE $32b3 ; (main.s3030 + 0)
.s1232:
3272 : e4 5b __ CPX T5 + 0 
3274 : 90 3d __ BCC $32b3 ; (main.s3030 + 0)
.s3028:
3276 : a9 01 __ LDA #$01
3278 : 85 14 __ STA P7 
327a : ad ea be LDA $beea ; (vp_fill + 9)
327d : 18 __ __ CLC
327e : 65 59 __ ADC T4 + 0 
3280 : 8d ea be STA $beea ; (vp_fill + 9)
3283 : 90 03 __ BCC $3288 ; (main.s2197 + 0)
.s2196:
3285 : ee eb be INC $beeb ; (vp_fill + 10)
.s2197:
3288 : ee 0a bf INC $bf0a ; (viewport + 9)
328b : d0 03 __ BNE $3290 ; (main.s2199 + 0)
.s2198:
328d : ee 0b bf INC $bf0b ; (viewport + 10)
.s2199:
3290 : a9 ec __ LDA #$ec
3292 : 85 0f __ STA P2 
3294 : a9 be __ LDA #$be
3296 : 85 10 __ STA P3 
3298 : ad 0c bf LDA $bf0c ; (viewport + 11)
329b : 85 11 __ STA P4 
329d : ad 0d bf LDA $bf0d ; (viewport + 12)
32a0 : 18 __ __ CLC
32a1 : 65 59 __ ADC T4 + 0 
32a3 : 38 __ __ SEC
32a4 : e9 01 __ SBC #$01
32a6 : 85 12 __ STA P5 
32a8 : ad 0e bf LDA $bf0e ; (viewport + 13)
32ab : 85 13 __ STA P6 
32ad : 20 15 6a JSR $6a15 ; (vdcwin_init.s0 + 0)
32b0 : 4c 2b 32 JMP $322b ; (main.s20336 + 0)
.s3030:
32b3 : a9 12 __ LDA #$12
32b5 : 8d 00 d6 STA $d600 
32b8 : 18 __ __ CLC
32b9 : a5 64 __ LDA T11 + 0 
32bb : 65 5d __ ADC T6 + 0 
32bd : 85 66 __ STA T12 + 0 
32bf : a5 65 __ LDA T11 + 1 
32c1 : 65 5e __ ADC T6 + 1 
32c3 : 85 67 __ STA T12 + 1 
32c5 : 18 __ __ CLC
32c6 : a5 5f __ LDA T7 + 0 
32c8 : 65 5d __ ADC T6 + 0 
32ca : 85 6b __ STA T15 + 0 
32cc : a5 60 __ LDA T7 + 1 
32ce : 65 5e __ ADC T6 + 1 
32d0 : 85 6c __ STA T15 + 1 
.l20075:
32d2 : 2c 00 d6 BIT $d600 
32d5 : 10 fb __ BPL $32d2 ; (main.l20075 + 0)
.s3086:
32d7 : a5 60 __ LDA T7 + 1 
32d9 : 8d 01 d6 STA $d601 
32dc : a9 13 __ LDA #$13
32de : 8d 00 d6 STA $d600 
.l20077:
32e1 : 2c 00 d6 BIT $d600 
32e4 : 10 fb __ BPL $32e1 ; (main.l20077 + 0)
.s3091:
32e6 : a5 5f __ LDA T7 + 0 
32e8 : 8d 01 d6 STA $d601 
32eb : a9 1f __ LDA #$1f
32ed : 8d 00 d6 STA $d600 
32f0 : a9 18 __ LDA #$18
32f2 : 8d 00 d6 STA $d600 
.l20079:
32f5 : 2c 00 d6 BIT $d600 
32f8 : 10 fb __ BPL $32f5 ; (main.l20079 + 0)
.s3098:
32fa : ac 01 d6 LDY $d601 
32fd : 8d 00 d6 STA $d600 
3300 : 98 __ __ TYA
3301 : 09 80 __ ORA #$80
.l20081:
3303 : 2c 00 d6 BIT $d600 
3306 : 10 fb __ BPL $3303 ; (main.l20081 + 0)
.s3104:
3308 : 8d 01 d6 STA $d601 
330b : a9 20 __ LDA #$20
330d : 8d 00 d6 STA $d600 
.l20083:
3310 : 2c 00 d6 BIT $d600 
3313 : 10 fb __ BPL $3310 ; (main.l20083 + 0)
.s3109:
3315 : a5 6c __ LDA T15 + 1 
3317 : 8d 01 d6 STA $d601 
331a : a9 21 __ LDA #$21
331c : 8d 00 d6 STA $d600 
.l20085:
331f : 2c 00 d6 BIT $d600 
3322 : 10 fb __ BPL $331f ; (main.l20085 + 0)
.s3114:
3324 : a5 6b __ LDA T15 + 0 
3326 : 8d 01 d6 STA $d601 
3329 : a9 1f __ LDA #$1f
332b : 8d 00 d6 STA $d600 
332e : a9 1e __ LDA #$1e
3330 : 8d 00 d6 STA $d600 
.l20087:
3333 : 2c 00 d6 BIT $d600 
3336 : 10 fb __ BPL $3333 ; (main.l20087 + 0)
.s3120:
3338 : a5 61 __ LDA T8 + 0 
333a : 8d 01 d6 STA $d601 
333d : a9 12 __ LDA #$12
333f : 8d 00 d6 STA $d600 
.l20089:
3342 : 2c 00 d6 BIT $d600 
3345 : 10 fb __ BPL $3342 ; (main.l20089 + 0)
.s3173:
3347 : a5 65 __ LDA T11 + 1 
3349 : 8d 01 d6 STA $d601 
334c : a9 13 __ LDA #$13
334e : 8d 00 d6 STA $d600 
.l20091:
3351 : 2c 00 d6 BIT $d600 
3354 : 10 fb __ BPL $3351 ; (main.l20091 + 0)
.s3178:
3356 : a5 64 __ LDA T11 + 0 
3358 : 8d 01 d6 STA $d601 
335b : a9 1f __ LDA #$1f
335d : 8d 00 d6 STA $d600 
3360 : a9 18 __ LDA #$18
3362 : 8d 00 d6 STA $d600 
.l20093:
3365 : 2c 00 d6 BIT $d600 
3368 : 10 fb __ BPL $3365 ; (main.l20093 + 0)
.s3185:
336a : ac 01 d6 LDY $d601 
336d : 8d 00 d6 STA $d600 
3370 : 98 __ __ TYA
3371 : 09 80 __ ORA #$80
.l20095:
3373 : 2c 00 d6 BIT $d600 
3376 : 10 fb __ BPL $3373 ; (main.l20095 + 0)
.s3191:
3378 : 8d 01 d6 STA $d601 
337b : a9 20 __ LDA #$20
337d : 8d 00 d6 STA $d600 
.l20097:
3380 : 2c 00 d6 BIT $d600 
3383 : 10 fb __ BPL $3380 ; (main.l20097 + 0)
.s3196:
3385 : a5 67 __ LDA T12 + 1 
3387 : 8d 01 d6 STA $d601 
338a : a9 21 __ LDA #$21
338c : 8d 00 d6 STA $d600 
.l20099:
338f : 2c 00 d6 BIT $d600 
3392 : 10 fb __ BPL $338f ; (main.l20099 + 0)
.s3201:
3394 : a5 66 __ LDA T12 + 0 
3396 : 8d 01 d6 STA $d601 
3399 : a9 1f __ LDA #$1f
339b : 8d 00 d6 STA $d600 
339e : a9 1e __ LDA #$1e
33a0 : 8d 00 d6 STA $d600 
.l20101:
33a3 : 2c 00 d6 BIT $d600 
33a6 : 10 fb __ BPL $33a3 ; (main.l20101 + 0)
.s3207:
33a8 : a5 61 __ LDA T8 + 0 
33aa : 8d 01 d6 STA $d601 
33ad : ad 29 83 LDA $8329 ; (vdc_state + 3)
33b0 : 18 __ __ CLC
33b1 : 65 5f __ ADC T7 + 0 
33b3 : 85 5f __ STA T7 + 0 
33b5 : ad 2a 83 LDA $832a ; (vdc_state + 4)
33b8 : 65 60 __ ADC T7 + 1 
33ba : 85 60 __ STA T7 + 1 
33bc : 18 __ __ CLC
33bd : a5 64 __ LDA T11 + 0 
33bf : 6d 29 83 ADC $8329 ; (vdc_state + 3)
33c2 : 85 64 __ STA T11 + 0 
33c4 : a5 65 __ LDA T11 + 1 
33c6 : 6d 2a 83 ADC $832a ; (vdc_state + 4)
33c9 : e8 __ __ INX
33ca : 4c 6c 32 JMP $326c ; (main.l3029 + 0)
.s2842:
33cd : ad 29 83 LDA $8329 ; (vdc_state + 3)
33d0 : 85 5b __ STA T5 + 0 
33d2 : 85 1b __ STA ACCU + 0 
33d4 : ad 2a 83 LDA $832a ; (vdc_state + 4)
33d7 : 85 5c __ STA T5 + 1 
33d9 : 85 1c __ STA ACCU + 1 
33db : ad 0f bf LDA $bf0f ; (viewport + 14)
33de : 20 e3 7c JSR $7ce3 ; (mul16by8 + 0)
33e1 : ad 12 bf LDA $bf12 ; (viewport + 17)
33e4 : 18 __ __ CLC
33e5 : 65 05 __ ADC WORK + 2 
33e7 : 85 5f __ STA T7 + 0 
33e9 : ad 13 bf LDA $bf13 ; (viewport + 18)
33ec : 65 06 __ ADC WORK + 3 
33ee : 85 60 __ STA T7 + 1 
33f0 : ad 14 bf LDA $bf14 ; (viewport + 19)
33f3 : 18 __ __ CLC
33f4 : 65 05 __ ADC WORK + 2 
33f6 : aa __ __ TAX
33f7 : ad 15 bf LDA $bf15 ; (viewport + 20)
33fa : 65 06 __ ADC WORK + 3 
33fc : a8 __ __ TAY
33fd : ad 0f bf LDA $bf0f ; (viewport + 14)
3400 : 38 __ __ SEC
3401 : e9 01 __ SBC #$01
3403 : 85 59 __ STA T4 + 0 
3405 : ad 0e bf LDA $bf0e ; (viewport + 13)
3408 : 85 62 __ STA T9 + 0 
340a : a9 00 __ LDA #$00
340c : 85 61 __ STA T8 + 0 
340e : e9 00 __ SBC #$00
3410 : 85 5a __ STA T4 + 1 
3412 : d0 31 __ BNE $3445 ; (main.l2847 + 0)
.s1262:
3414 : a5 61 __ LDA T8 + 0 
3416 : c5 59 __ CMP T4 + 0 
3418 : 90 2b __ BCC $3445 ; (main.l2847 + 0)
.s2845:
341a : a9 01 __ LDA #$01
341c : 85 14 __ STA P7 
341e : ad ea be LDA $beea ; (vp_fill + 9)
3421 : 18 __ __ CLC
3422 : 69 ff __ ADC #$ff
3424 : 8d ea be STA $beea ; (vp_fill + 9)
3427 : b0 03 __ BCS $342c ; (main.s2193 + 0)
.s2192:
3429 : ce eb be DEC $beeb ; (vp_fill + 10)
.s2193:
342c : ad 0a bf LDA $bf0a ; (viewport + 9)
342f : 18 __ __ CLC
3430 : 69 ff __ ADC #$ff
3432 : 8d 0a bf STA $bf0a ; (viewport + 9)
3435 : b0 03 __ BCS $343a ; (main.s2195 + 0)
.s2194:
3437 : ce 0b bf DEC $bf0b ; (viewport + 10)
.s2195:
343a : ad 0e bf LDA $bf0e ; (viewport + 13)
343d : 85 13 __ STA P6 
343f : 20 03 6a JSR $6a03 ; (vdcwin_init@proxy + 0)
3442 : 4c 25 32 JMP $3225 ; (main.s20073 + 0)
.l2847:
3445 : a9 12 __ LDA #$12
3447 : 8d 00 d6 STA $d600 
344a : 8a __ __ TXA
344b : 38 __ __ SEC
344c : ed 29 83 SBC $8329 ; (vdc_state + 3)
344f : aa __ __ TAX
3450 : 98 __ __ TYA
3451 : ed 2a 83 SBC $832a ; (vdc_state + 4)
3454 : a8 __ __ TAY
3455 : 8a __ __ TXA
3456 : 38 __ __ SEC
3457 : e5 5b __ SBC T5 + 0 
3459 : 85 66 __ STA T12 + 0 
345b : 98 __ __ TYA
345c : e5 5c __ SBC T5 + 1 
345e : 85 67 __ STA T12 + 1 
3460 : 38 __ __ SEC
3461 : a5 5f __ LDA T7 + 0 
3463 : ed 29 83 SBC $8329 ; (vdc_state + 3)
3466 : 85 5f __ STA T7 + 0 
3468 : a5 60 __ LDA T7 + 1 
346a : ed 2a 83 SBC $832a ; (vdc_state + 4)
346d : 85 60 __ STA T7 + 1 
346f : 38 __ __ SEC
3470 : a5 5f __ LDA T7 + 0 
3472 : e5 5b __ SBC T5 + 0 
3474 : 85 64 __ STA T11 + 0 
3476 : a5 60 __ LDA T7 + 1 
3478 : e5 5c __ SBC T5 + 1 
347a : 85 65 __ STA T11 + 1 
.l20045:
347c : 2c 00 d6 BIT $d600 
347f : 10 fb __ BPL $347c ; (main.l20045 + 0)
.s2903:
3481 : a5 60 __ LDA T7 + 1 
3483 : 8d 01 d6 STA $d601 
3486 : a9 13 __ LDA #$13
3488 : 8d 00 d6 STA $d600 
.l20047:
348b : 2c 00 d6 BIT $d600 
348e : 10 fb __ BPL $348b ; (main.l20047 + 0)
.s2908:
3490 : a5 5f __ LDA T7 + 0 
3492 : 8d 01 d6 STA $d601 
3495 : a9 1f __ LDA #$1f
3497 : 8d 00 d6 STA $d600 
349a : a9 18 __ LDA #$18
349c : 8d 00 d6 STA $d600 
.l20049:
349f : 2c 00 d6 BIT $d600 
34a2 : 10 fb __ BPL $349f ; (main.l20049 + 0)
.s2915:
34a4 : ad 01 d6 LDA $d601 
34a7 : 09 80 __ ORA #$80
34a9 : 85 6b __ STA T15 + 0 
34ab : a9 18 __ LDA #$18
34ad : 8d 00 d6 STA $d600 
.l20051:
34b0 : 2c 00 d6 BIT $d600 
34b3 : 10 fb __ BPL $34b0 ; (main.l20051 + 0)
.s2921:
34b5 : a5 6b __ LDA T15 + 0 
34b7 : 8d 01 d6 STA $d601 
34ba : a9 20 __ LDA #$20
34bc : 8d 00 d6 STA $d600 
.l20053:
34bf : 2c 00 d6 BIT $d600 
34c2 : 10 fb __ BPL $34bf ; (main.l20053 + 0)
.s2926:
34c4 : a5 65 __ LDA T11 + 1 
34c6 : 8d 01 d6 STA $d601 
34c9 : a9 21 __ LDA #$21
34cb : 8d 00 d6 STA $d600 
.l20055:
34ce : 2c 00 d6 BIT $d600 
34d1 : 10 fb __ BPL $34ce ; (main.l20055 + 0)
.s2931:
34d3 : a5 64 __ LDA T11 + 0 
34d5 : 8d 01 d6 STA $d601 
34d8 : a9 1f __ LDA #$1f
34da : 8d 00 d6 STA $d600 
34dd : a9 1e __ LDA #$1e
34df : 8d 00 d6 STA $d600 
.l20057:
34e2 : 2c 00 d6 BIT $d600 
34e5 : 10 fb __ BPL $34e2 ; (main.l20057 + 0)
.s2937:
34e7 : a5 62 __ LDA T9 + 0 
34e9 : 8d 01 d6 STA $d601 
34ec : a9 12 __ LDA #$12
34ee : 8d 00 d6 STA $d600 
.l20059:
34f1 : 2c 00 d6 BIT $d600 
34f4 : 10 fb __ BPL $34f1 ; (main.l20059 + 0)
.s2990:
34f6 : 8c 01 d6 STY $d601 
34f9 : a9 13 __ LDA #$13
34fb : 8d 00 d6 STA $d600 
.l20061:
34fe : 2c 00 d6 BIT $d600 
3501 : 10 fb __ BPL $34fe ; (main.l20061 + 0)
.s2995:
3503 : 8e 01 d6 STX $d601 
3506 : a9 1f __ LDA #$1f
3508 : 8d 00 d6 STA $d600 
350b : a9 18 __ LDA #$18
350d : 8d 00 d6 STA $d600 
.l20063:
3510 : 2c 00 d6 BIT $d600 
3513 : 10 fb __ BPL $3510 ; (main.l20063 + 0)
.s3002:
3515 : ad 01 d6 LDA $d601 
3518 : 09 80 __ ORA #$80
351a : 85 64 __ STA T11 + 0 
351c : a9 18 __ LDA #$18
351e : 8d 00 d6 STA $d600 
.l20065:
3521 : 2c 00 d6 BIT $d600 
3524 : 10 fb __ BPL $3521 ; (main.l20065 + 0)
.s3008:
3526 : a5 64 __ LDA T11 + 0 
3528 : 8d 01 d6 STA $d601 
352b : a9 20 __ LDA #$20
352d : 8d 00 d6 STA $d600 
.l20067:
3530 : 2c 00 d6 BIT $d600 
3533 : 10 fb __ BPL $3530 ; (main.l20067 + 0)
.s3013:
3535 : a5 67 __ LDA T12 + 1 
3537 : 8d 01 d6 STA $d601 
353a : a9 21 __ LDA #$21
353c : 8d 00 d6 STA $d600 
.l20069:
353f : 2c 00 d6 BIT $d600 
3542 : 10 fb __ BPL $353f ; (main.l20069 + 0)
.s3018:
3544 : a5 66 __ LDA T12 + 0 
3546 : 8d 01 d6 STA $d601 
3549 : a9 1f __ LDA #$1f
354b : 8d 00 d6 STA $d600 
354e : a9 1e __ LDA #$1e
3550 : 8d 00 d6 STA $d600 
.l20071:
3553 : 2c 00 d6 BIT $d600 
3556 : 10 fb __ BPL $3553 ; (main.l20071 + 0)
.s3024:
3558 : a5 62 __ LDA T9 + 0 
355a : 8d 01 d6 STA $d601 
355d : e6 61 __ INC T8 + 0 
355f : a5 5a __ LDA T4 + 1 
3561 : f0 03 __ BEQ $3566 ; (main.s3024 + 14)
3563 : 4c 45 34 JMP $3445 ; (main.l2847 + 0)
3566 : 4c 14 34 JMP $3414 ; (main.s1262 + 0)
.s2486:
3569 : a5 5d __ LDA T6 + 0 
356b : 69 01 __ ADC #$01
356d : 85 5f __ STA T7 + 0 
356f : a5 5e __ LDA T6 + 1 
3571 : 69 00 __ ADC #$00
3573 : 85 60 __ STA T7 + 1 
3575 : 18 __ __ CLC
3576 : a5 5b __ LDA T5 + 0 
3578 : 69 01 __ ADC #$01
357a : aa __ __ TAX
357b : a5 5c __ LDA T5 + 1 
357d : 69 00 __ ADC #$00
357f : a8 __ __ TAY
3580 : ad 27 83 LDA $8327 ; (vdc_state + 1)
3583 : d0 11 __ BNE $3596 ; (main.s2491 + 0)
.s2493:
3585 : a9 03 __ LDA #$03
3587 : cd 33 83 CMP $8333 ; (vdc_state + 13)
358a : d0 05 __ BNE $3591 ; (main.s1321 + 0)
.s1320:
358c : a9 ff __ LDA #$ff
358e : cd 32 83 CMP $8332 ; (vdc_state + 12)
.s1321:
3591 : b0 03 __ BCS $3596 ; (main.s2491 + 0)
3593 : 4c 7d 37 JMP $377d ; (main.s2490 + 0)
.s2491:
3596 : ad 32 83 LDA $8332 ; (vdc_state + 12)
3599 : 85 66 __ STA T12 + 0 
359b : ad 33 83 LDA $8333 ; (vdc_state + 13)
359e : 85 6b __ STA T15 + 0 
35a0 : a9 12 __ LDA #$12
35a2 : 8d 00 d6 STA $d600 
.l19986:
35a5 : 2c 00 d6 BIT $d600 
35a8 : 10 fb __ BPL $35a5 ; (main.l19986 + 0)
.s2546:
35aa : a5 6b __ LDA T15 + 0 
35ac : 8d 01 d6 STA $d601 
35af : a9 13 __ LDA #$13
35b1 : 8d 00 d6 STA $d600 
.l19988:
35b4 : 2c 00 d6 BIT $d600 
35b7 : 10 fb __ BPL $35b4 ; (main.l19988 + 0)
.s2551:
35b9 : a5 66 __ LDA T12 + 0 
35bb : 8d 01 d6 STA $d601 
35be : a9 1f __ LDA #$1f
35c0 : 8d 00 d6 STA $d600 
35c3 : a9 18 __ LDA #$18
35c5 : 8d 00 d6 STA $d600 
.l19990:
35c8 : 2c 00 d6 BIT $d600 
35cb : 10 fb __ BPL $35c8 ; (main.l19990 + 0)
.s2558:
35cd : ad 01 d6 LDA $d601 
35d0 : 09 80 __ ORA #$80
35d2 : 85 43 __ STA T16 + 0 
35d4 : a9 18 __ LDA #$18
35d6 : 8d 00 d6 STA $d600 
.l19992:
35d9 : 2c 00 d6 BIT $d600 
35dc : 10 fb __ BPL $35d9 ; (main.l19992 + 0)
.s2564:
35de : a5 43 __ LDA T16 + 0 
35e0 : 8d 01 d6 STA $d601 
35e3 : a9 20 __ LDA #$20
35e5 : 8d 00 d6 STA $d600 
.l19994:
35e8 : 2c 00 d6 BIT $d600 
35eb : 10 fb __ BPL $35e8 ; (main.l19994 + 0)
.s2569:
35ed : 8c 01 d6 STY $d601 
35f0 : a9 21 __ LDA #$21
35f2 : 8d 00 d6 STA $d600 
.l19996:
35f5 : 2c 00 d6 BIT $d600 
35f8 : 10 fb __ BPL $35f5 ; (main.l19996 + 0)
.s2574:
35fa : 8e 01 d6 STX $d601 
35fd : a9 1f __ LDA #$1f
35ff : 8d 00 d6 STA $d600 
3602 : a9 1e __ LDA #$1e
3604 : 8d 00 d6 STA $d600 
.l19998:
3607 : 2c 00 d6 BIT $d600 
360a : 10 fb __ BPL $3607 ; (main.l19998 + 0)
.s2580:
360c : a5 59 __ LDA T4 + 0 
360e : 8d 01 d6 STA $d601 
3611 : a9 12 __ LDA #$12
3613 : 8d 00 d6 STA $d600 
.l20000:
3616 : 2c 00 d6 BIT $d600 
3619 : 10 fb __ BPL $3616 ; (main.l20000 + 0)
.s2633:
361b : a5 5c __ LDA T5 + 1 
361d : 8d 01 d6 STA $d601 
3620 : a9 13 __ LDA #$13
3622 : 8d 00 d6 STA $d600 
.l20002:
3625 : 2c 00 d6 BIT $d600 
3628 : 10 fb __ BPL $3625 ; (main.l20002 + 0)
.s2638:
362a : a5 5b __ LDA T5 + 0 
362c : 8d 01 d6 STA $d601 
362f : a9 1f __ LDA #$1f
3631 : 8d 00 d6 STA $d600 
3634 : a9 18 __ LDA #$18
3636 : 8d 00 d6 STA $d600 
.l20004:
3639 : 2c 00 d6 BIT $d600 
363c : 10 fb __ BPL $3639 ; (main.l20004 + 0)
.s2645:
363e : ad 01 d6 LDA $d601 
3641 : 09 80 __ ORA #$80
3643 : a2 18 __ LDX #$18
3645 : 8e 00 d6 STX $d600 
.l20006:
3648 : 2c 00 d6 BIT $d600 
364b : 10 fb __ BPL $3648 ; (main.l20006 + 0)
.s2651:
364d : 8d 01 d6 STA $d601 
3650 : a9 20 __ LDA #$20
3652 : 8d 00 d6 STA $d600 
.l20008:
3655 : 2c 00 d6 BIT $d600 
3658 : 10 fb __ BPL $3655 ; (main.l20008 + 0)
.s2656:
365a : a5 6b __ LDA T15 + 0 
365c : 8d 01 d6 STA $d601 
365f : a9 21 __ LDA #$21
3661 : 8d 00 d6 STA $d600 
.l20010:
3664 : 2c 00 d6 BIT $d600 
3667 : 10 fb __ BPL $3664 ; (main.l20010 + 0)
.s2661:
3669 : a5 66 __ LDA T12 + 0 
366b : 8d 01 d6 STA $d601 
366e : a9 1f __ LDA #$1f
3670 : 8d 00 d6 STA $d600 
3673 : a9 1e __ LDA #$1e
3675 : 8d 00 d6 STA $d600 
.l20012:
3678 : 2c 00 d6 BIT $d600 
367b : 10 fb __ BPL $3678 ; (main.l20012 + 0)
.s2667:
367d : a5 59 __ LDA T4 + 0 
367f : 8d 01 d6 STA $d601 
3682 : a9 12 __ LDA #$12
3684 : 8d 00 d6 STA $d600 
.l20014:
3687 : 2c 00 d6 BIT $d600 
368a : 10 fb __ BPL $3687 ; (main.l20014 + 0)
.s2720:
368c : a5 6b __ LDA T15 + 0 
368e : 8d 01 d6 STA $d601 
3691 : a9 13 __ LDA #$13
3693 : 8d 00 d6 STA $d600 
.l20016:
3696 : 2c 00 d6 BIT $d600 
3699 : 10 fb __ BPL $3696 ; (main.l20016 + 0)
.s2725:
369b : a5 66 __ LDA T12 + 0 
369d : 8d 01 d6 STA $d601 
36a0 : a9 1f __ LDA #$1f
36a2 : 8d 00 d6 STA $d600 
36a5 : 8e 00 d6 STX $d600 
.l20018:
36a8 : 2c 00 d6 BIT $d600 
36ab : 10 fb __ BPL $36a8 ; (main.l20018 + 0)
.s2732:
36ad : ad 01 d6 LDA $d601 
36b0 : 09 80 __ ORA #$80
36b2 : 8e 00 d6 STX $d600 
.l20020:
36b5 : 2c 00 d6 BIT $d600 
36b8 : 10 fb __ BPL $36b5 ; (main.l20020 + 0)
.s2738:
36ba : 8d 01 d6 STA $d601 
36bd : a9 20 __ LDA #$20
36bf : 8d 00 d6 STA $d600 
.l20022:
36c2 : 2c 00 d6 BIT $d600 
36c5 : 10 fb __ BPL $36c2 ; (main.l20022 + 0)
.s2743:
36c7 : a5 60 __ LDA T7 + 1 
36c9 : 8d 01 d6 STA $d601 
36cc : a9 21 __ LDA #$21
36ce : 8d 00 d6 STA $d600 
.l20024:
36d1 : 2c 00 d6 BIT $d600 
36d4 : 10 fb __ BPL $36d1 ; (main.l20024 + 0)
.s2748:
36d6 : a5 5f __ LDA T7 + 0 
36d8 : 8d 01 d6 STA $d601 
36db : a9 1f __ LDA #$1f
36dd : 8d 00 d6 STA $d600 
36e0 : a9 1e __ LDA #$1e
36e2 : 8d 00 d6 STA $d600 
.l20026:
36e5 : 2c 00 d6 BIT $d600 
36e8 : 10 fb __ BPL $36e5 ; (main.l20026 + 0)
.s2754:
36ea : a5 59 __ LDA T4 + 0 
36ec : 8d 01 d6 STA $d601 
36ef : a9 12 __ LDA #$12
36f1 : 8d 00 d6 STA $d600 
.l20028:
36f4 : 2c 00 d6 BIT $d600 
36f7 : 10 fb __ BPL $36f4 ; (main.l20028 + 0)
.s2807:
36f9 : a5 5e __ LDA T6 + 1 
36fb : 8d 01 d6 STA $d601 
36fe : a9 13 __ LDA #$13
3700 : 8d 00 d6 STA $d600 
.l20030:
3703 : 2c 00 d6 BIT $d600 
3706 : 10 fb __ BPL $3703 ; (main.l20030 + 0)
.s2812:
3708 : a5 5d __ LDA T6 + 0 
370a : 8d 01 d6 STA $d601 
370d : a9 1f __ LDA #$1f
370f : 8d 00 d6 STA $d600 
3712 : 8e 00 d6 STX $d600 
.l20032:
3715 : 2c 00 d6 BIT $d600 
3718 : 10 fb __ BPL $3715 ; (main.l20032 + 0)
.s2819:
371a : ad 01 d6 LDA $d601 
371d : 09 80 __ ORA #$80
371f : 8e 00 d6 STX $d600 
.l20034:
3722 : 2c 00 d6 BIT $d600 
3725 : 10 fb __ BPL $3722 ; (main.l20034 + 0)
.s2825:
3727 : 8d 01 d6 STA $d601 
372a : a9 20 __ LDA #$20
372c : 8d 00 d6 STA $d600 
.l20036:
372f : 2c 00 d6 BIT $d600 
3732 : 10 fb __ BPL $372f ; (main.l20036 + 0)
.s2830:
3734 : a5 6b __ LDA T15 + 0 
3736 : 8d 01 d6 STA $d601 
3739 : a9 21 __ LDA #$21
373b : 8d 00 d6 STA $d600 
.l20038:
373e : 2c 00 d6 BIT $d600 
3741 : 10 fb __ BPL $373e ; (main.l20038 + 0)
.s2835:
3743 : a5 66 __ LDA T12 + 0 
3745 : 8d 01 d6 STA $d601 
3748 : a9 1f __ LDA #$1f
374a : 8d 00 d6 STA $d600 
374d : a9 1e __ LDA #$1e
374f : 8d 00 d6 STA $d600 
.l20040:
3752 : 2c 00 d6 BIT $d600 
3755 : 10 fb __ BPL $3752 ; (main.l20040 + 0)
.s2841:
3757 : a5 59 __ LDA T4 + 0 
3759 : 8d 01 d6 STA $d601 
.s2489:
375c : ad 29 83 LDA $8329 ; (vdc_state + 3)
375f : 18 __ __ CLC
3760 : 65 5b __ ADC T5 + 0 
3762 : 85 5b __ STA T5 + 0 
3764 : ad 2a 83 LDA $832a ; (vdc_state + 4)
3767 : 65 5c __ ADC T5 + 1 
3769 : 85 5c __ STA T5 + 1 
376b : 18 __ __ CLC
376c : a5 5d __ LDA T6 + 0 
376e : 6d 29 83 ADC $8329 ; (vdc_state + 3)
3771 : 85 5d __ STA T6 + 0 
3773 : a5 5e __ LDA T6 + 1 
3775 : 6d 2a 83 ADC $832a ; (vdc_state + 4)
3778 : e6 61 __ INC T8 + 0 
377a : 4c d4 31 JMP $31d4 ; (main.l2485 + 0)
.s2490:
377d : 86 10 __ STX P3 
377f : 84 11 __ STY P4 
3781 : 20 ba 13 JSR $13ba ; (bnk_cpyfromvdc@proxy + 0)
3784 : a5 5b __ LDA T5 + 0 
3786 : 85 0d __ STA P0 
3788 : a5 5c __ LDA T5 + 1 
378a : 85 0e __ STA P1 
378c : 20 43 14 JSR $1443 ; (bnk_cpytovdc@proxy + 0)
378f : a5 5f __ LDA T7 + 0 
3791 : 85 10 __ STA P3 
3793 : a5 60 __ LDA T7 + 1 
3795 : 85 11 __ STA P4 
3797 : 20 ba 14 JSR $14ba ; (bnk_cpyfromvdc@proxy + 0)
379a : a5 5d __ LDA T6 + 0 
379c : 85 0d __ STA P0 
379e : a5 5e __ LDA T6 + 1 
37a0 : 85 0e __ STA P1 
37a2 : 20 43 14 JSR $1443 ; (bnk_cpytovdc@proxy + 0)
37a5 : 4c 5c 37 JMP $375c ; (main.s2489 + 0)
.s2125:
37a8 : a5 5b __ LDA T5 + 0 
37aa : 69 01 __ ADC #$01
37ac : 85 5f __ STA T7 + 0 
37ae : a5 5c __ LDA T5 + 1 
37b0 : 69 00 __ ADC #$00
37b2 : 85 60 __ STA T7 + 1 
37b4 : 18 __ __ CLC
37b5 : a5 5d __ LDA T6 + 0 
37b7 : 69 01 __ ADC #$01
37b9 : 85 64 __ STA T11 + 0 
37bb : a5 5e __ LDA T6 + 1 
37bd : 69 00 __ ADC #$00
37bf : 85 65 __ STA T11 + 1 
37c1 : ad 27 83 LDA $8327 ; (vdc_state + 1)
37c4 : d0 11 __ BNE $37d7 ; (main.s2130 + 0)
.s2132:
37c6 : a9 03 __ LDA #$03
37c8 : cd 33 83 CMP $8333 ; (vdc_state + 13)
37cb : d0 05 __ BNE $37d2 ; (main.s1381 + 0)
.s1380:
37cd : a9 ff __ LDA #$ff
37cf : cd 32 83 CMP $8332 ; (vdc_state + 12)
.s1381:
37d2 : b0 03 __ BCS $37d7 ; (main.s2130 + 0)
37d4 : 4c c2 39 JMP $39c2 ; (main.s2129 + 0)
.s2130:
37d7 : a9 12 __ LDA #$12
37d9 : 8d 00 d6 STA $d600 
37dc : ac 33 83 LDY $8333 ; (vdc_state + 13)
37df : ae 32 83 LDX $8332 ; (vdc_state + 12)
.l19926:
37e2 : 2c 00 d6 BIT $d600 
37e5 : 10 fb __ BPL $37e2 ; (main.l19926 + 0)
.s2185:
37e7 : 8c 01 d6 STY $d601 
37ea : a9 13 __ LDA #$13
37ec : 8d 00 d6 STA $d600 
.l19928:
37ef : 2c 00 d6 BIT $d600 
37f2 : 10 fb __ BPL $37ef ; (main.l19928 + 0)
.s2190:
37f4 : 8e 01 d6 STX $d601 
37f7 : a9 1f __ LDA #$1f
37f9 : 8d 00 d6 STA $d600 
37fc : a9 18 __ LDA #$18
37fe : 8d 00 d6 STA $d600 
.l19930:
3801 : 2c 00 d6 BIT $d600 
3804 : 10 fb __ BPL $3801 ; (main.l19930 + 0)
.s2197:
3806 : ad 01 d6 LDA $d601 
3809 : 09 80 __ ORA #$80
380b : 85 43 __ STA T16 + 0 
380d : a9 18 __ LDA #$18
380f : 8d 00 d6 STA $d600 
.l19932:
3812 : 2c 00 d6 BIT $d600 
3815 : 10 fb __ BPL $3812 ; (main.l19932 + 0)
.s2203:
3817 : a5 43 __ LDA T16 + 0 
3819 : 8d 01 d6 STA $d601 
381c : a9 20 __ LDA #$20
381e : 8d 00 d6 STA $d600 
.l19934:
3821 : 2c 00 d6 BIT $d600 
3824 : 10 fb __ BPL $3821 ; (main.l19934 + 0)
.s2208:
3826 : a5 5c __ LDA T5 + 1 
3828 : 8d 01 d6 STA $d601 
382b : a9 21 __ LDA #$21
382d : 8d 00 d6 STA $d600 
.l19936:
3830 : 2c 00 d6 BIT $d600 
3833 : 10 fb __ BPL $3830 ; (main.l19936 + 0)
.s2213:
3835 : a5 5b __ LDA T5 + 0 
3837 : 8d 01 d6 STA $d601 
383a : a9 1f __ LDA #$1f
383c : 8d 00 d6 STA $d600 
383f : a9 1e __ LDA #$1e
3841 : 8d 00 d6 STA $d600 
.l19938:
3844 : 2c 00 d6 BIT $d600 
3847 : 10 fb __ BPL $3844 ; (main.l19938 + 0)
.s2219:
3849 : a5 59 __ LDA T4 + 0 
384b : 8d 01 d6 STA $d601 
384e : a9 12 __ LDA #$12
3850 : 8d 00 d6 STA $d600 
.l19940:
3853 : 2c 00 d6 BIT $d600 
3856 : 10 fb __ BPL $3853 ; (main.l19940 + 0)
.s2272:
3858 : a5 60 __ LDA T7 + 1 
385a : 8d 01 d6 STA $d601 
385d : a9 13 __ LDA #$13
385f : 8d 00 d6 STA $d600 
.l19942:
3862 : 2c 00 d6 BIT $d600 
3865 : 10 fb __ BPL $3862 ; (main.l19942 + 0)
.s2277:
3867 : a5 5f __ LDA T7 + 0 
3869 : 8d 01 d6 STA $d601 
386c : a9 1f __ LDA #$1f
386e : 8d 00 d6 STA $d600 
3871 : a9 18 __ LDA #$18
3873 : 8d 00 d6 STA $d600 
.l19944:
3876 : 2c 00 d6 BIT $d600 
3879 : 10 fb __ BPL $3876 ; (main.l19944 + 0)
.s2284:
387b : ad 01 d6 LDA $d601 
387e : 09 80 __ ORA #$80
3880 : 85 5f __ STA T7 + 0 
3882 : a9 18 __ LDA #$18
3884 : 8d 00 d6 STA $d600 
.l19946:
3887 : 2c 00 d6 BIT $d600 
388a : 10 fb __ BPL $3887 ; (main.l19946 + 0)
.s2290:
388c : a5 5f __ LDA T7 + 0 
388e : 8d 01 d6 STA $d601 
3891 : a9 20 __ LDA #$20
3893 : 8d 00 d6 STA $d600 
.l19948:
3896 : 2c 00 d6 BIT $d600 
3899 : 10 fb __ BPL $3896 ; (main.l19948 + 0)
.s2295:
389b : 8c 01 d6 STY $d601 
389e : a9 21 __ LDA #$21
38a0 : 8d 00 d6 STA $d600 
.l19950:
38a3 : 2c 00 d6 BIT $d600 
38a6 : 10 fb __ BPL $38a3 ; (main.l19950 + 0)
.s2300:
38a8 : 8e 01 d6 STX $d601 
38ab : a9 1f __ LDA #$1f
38ad : 8d 00 d6 STA $d600 
38b0 : a9 1e __ LDA #$1e
38b2 : 8d 00 d6 STA $d600 
.l19952:
38b5 : 2c 00 d6 BIT $d600 
38b8 : 10 fb __ BPL $38b5 ; (main.l19952 + 0)
.s2306:
38ba : a5 59 __ LDA T4 + 0 
38bc : 8d 01 d6 STA $d601 
38bf : a9 12 __ LDA #$12
38c1 : 8d 00 d6 STA $d600 
.l19954:
38c4 : 2c 00 d6 BIT $d600 
38c7 : 10 fb __ BPL $38c4 ; (main.l19954 + 0)
.s2359:
38c9 : 8c 01 d6 STY $d601 
38cc : a9 13 __ LDA #$13
38ce : 8d 00 d6 STA $d600 
.l19956:
38d1 : 2c 00 d6 BIT $d600 
38d4 : 10 fb __ BPL $38d1 ; (main.l19956 + 0)
.s2364:
38d6 : 8e 01 d6 STX $d601 
38d9 : a9 1f __ LDA #$1f
38db : 8d 00 d6 STA $d600 
38de : a9 18 __ LDA #$18
38e0 : 8d 00 d6 STA $d600 
.l19958:
38e3 : 2c 00 d6 BIT $d600 
38e6 : 10 fb __ BPL $38e3 ; (main.l19958 + 0)
.s2371:
38e8 : ad 01 d6 LDA $d601 
38eb : 09 80 __ ORA #$80
38ed : 85 5f __ STA T7 + 0 
38ef : a9 18 __ LDA #$18
38f1 : 8d 00 d6 STA $d600 
.l19960:
38f4 : 2c 00 d6 BIT $d600 
38f7 : 10 fb __ BPL $38f4 ; (main.l19960 + 0)
.s2377:
38f9 : a5 5f __ LDA T7 + 0 
38fb : 8d 01 d6 STA $d601 
38fe : a9 20 __ LDA #$20
3900 : 8d 00 d6 STA $d600 
.l19962:
3903 : 2c 00 d6 BIT $d600 
3906 : 10 fb __ BPL $3903 ; (main.l19962 + 0)
.s2382:
3908 : a5 5e __ LDA T6 + 1 
390a : 8d 01 d6 STA $d601 
390d : a9 21 __ LDA #$21
390f : 8d 00 d6 STA $d600 
.l19964:
3912 : 2c 00 d6 BIT $d600 
3915 : 10 fb __ BPL $3912 ; (main.l19964 + 0)
.s2387:
3917 : a5 5d __ LDA T6 + 0 
3919 : 8d 01 d6 STA $d601 
391c : a9 1f __ LDA #$1f
391e : 8d 00 d6 STA $d600 
3921 : a9 1e __ LDA #$1e
3923 : 8d 00 d6 STA $d600 
.l19966:
3926 : 2c 00 d6 BIT $d600 
3929 : 10 fb __ BPL $3926 ; (main.l19966 + 0)
.s2393:
392b : a5 59 __ LDA T4 + 0 
392d : 8d 01 d6 STA $d601 
3930 : a9 12 __ LDA #$12
3932 : 8d 00 d6 STA $d600 
.l19968:
3935 : 2c 00 d6 BIT $d600 
3938 : 10 fb __ BPL $3935 ; (main.l19968 + 0)
.s2446:
393a : a5 65 __ LDA T11 + 1 
393c : 8d 01 d6 STA $d601 
393f : a9 13 __ LDA #$13
3941 : 8d 00 d6 STA $d600 
.l19970:
3944 : 2c 00 d6 BIT $d600 
3947 : 10 fb __ BPL $3944 ; (main.l19970 + 0)
.s2451:
3949 : a5 64 __ LDA T11 + 0 
394b : 8d 01 d6 STA $d601 
394e : a9 1f __ LDA #$1f
3950 : 8d 00 d6 STA $d600 
3953 : a9 18 __ LDA #$18
3955 : 8d 00 d6 STA $d600 
.l19972:
3958 : 2c 00 d6 BIT $d600 
395b : 10 fb __ BPL $3958 ; (main.l19972 + 0)
.s2458:
395d : ad 01 d6 LDA $d601 
3960 : 09 80 __ ORA #$80
3962 : 85 5f __ STA T7 + 0 
3964 : a9 18 __ LDA #$18
3966 : 8d 00 d6 STA $d600 
.l19974:
3969 : 2c 00 d6 BIT $d600 
396c : 10 fb __ BPL $3969 ; (main.l19974 + 0)
.s2464:
396e : a5 5f __ LDA T7 + 0 
3970 : 8d 01 d6 STA $d601 
3973 : a9 20 __ LDA #$20
3975 : 8d 00 d6 STA $d600 
.l19976:
3978 : 2c 00 d6 BIT $d600 
397b : 10 fb __ BPL $3978 ; (main.l19976 + 0)
.s2469:
397d : 8c 01 d6 STY $d601 
3980 : a9 21 __ LDA #$21
3982 : 8d 00 d6 STA $d600 
.l19978:
3985 : 2c 00 d6 BIT $d600 
3988 : 10 fb __ BPL $3985 ; (main.l19978 + 0)
.s2474:
398a : 8e 01 d6 STX $d601 
398d : a9 1f __ LDA #$1f
398f : 8d 00 d6 STA $d600 
3992 : a9 1e __ LDA #$1e
3994 : 8d 00 d6 STA $d600 
.l19980:
3997 : 2c 00 d6 BIT $d600 
399a : 10 fb __ BPL $3997 ; (main.l19980 + 0)
.s2480:
399c : a5 59 __ LDA T4 + 0 
399e : 8d 01 d6 STA $d601 
.s2128:
39a1 : ad 29 83 LDA $8329 ; (vdc_state + 3)
39a4 : 18 __ __ CLC
39a5 : 65 5b __ ADC T5 + 0 
39a7 : 85 5b __ STA T5 + 0 
39a9 : ad 2a 83 LDA $832a ; (vdc_state + 4)
39ac : 65 5c __ ADC T5 + 1 
39ae : 85 5c __ STA T5 + 1 
39b0 : 18 __ __ CLC
39b1 : a5 5d __ LDA T6 + 0 
39b3 : 6d 29 83 ADC $8329 ; (vdc_state + 3)
39b6 : 85 5d __ STA T6 + 0 
39b8 : a5 5e __ LDA T6 + 1 
39ba : 6d 2a 83 ADC $832a ; (vdc_state + 4)
39bd : e6 61 __ INC T8 + 0 
39bf : 4c 7e 31 JMP $317e ; (main.l2124 + 0)
.s2129:
39c2 : a5 5b __ LDA T5 + 0 
39c4 : 85 10 __ STA P3 
39c6 : a5 5c __ LDA T5 + 1 
39c8 : 85 11 __ STA P4 
39ca : 20 ba 13 JSR $13ba ; (bnk_cpyfromvdc@proxy + 0)
39cd : a5 5f __ LDA T7 + 0 
39cf : 85 0d __ STA P0 
39d1 : a5 60 __ LDA T7 + 1 
39d3 : 85 0e __ STA P1 
39d5 : 20 43 14 JSR $1443 ; (bnk_cpytovdc@proxy + 0)
39d8 : a5 5d __ LDA T6 + 0 
39da : 85 10 __ STA P3 
39dc : a5 5e __ LDA T6 + 1 
39de : 85 11 __ STA P4 
39e0 : 20 ba 14 JSR $14ba ; (bnk_cpyfromvdc@proxy + 0)
39e3 : a5 64 __ LDA T11 + 0 
39e5 : 85 0d __ STA P0 
39e7 : a5 65 __ LDA T11 + 1 
39e9 : 85 0e __ STA P1 
39eb : 20 43 14 JSR $1443 ; (bnk_cpytovdc@proxy + 0)
39ee : 4c a1 39 JMP $39a1 ; (main.s2128 + 0)
.l1951:
39f1 : a5 61 __ LDA T8 + 0 
39f3 : 0a __ __ ASL
39f4 : 10 03 __ BPL $39f9 ; (main.s1956 + 0)
39f6 : 4c 6b 3b JMP $3b6b ; (main.s1954 + 0)
.s1956:
39f9 : ad 21 bf LDA $bf21 ; (window + 0)
39fc : 85 62 __ STA T9 + 0 
39fe : 85 0d __ STA P0 
3a00 : ad 22 bf LDA $bf22 ; (window + 1)
3a03 : 18 __ __ CLC
3a04 : 65 56 __ ADC T2 + 0 
3a06 : 85 0e __ STA P1 
3a08 : ad 23 bf LDA $bf23 ; (window + 2)
3a0b : 85 64 __ STA T11 + 0 
3a0d : 38 __ __ SEC
3a0e : e9 01 __ SBC #$01
3a10 : 85 66 __ STA T12 + 0 
3a12 : ad 2d 83 LDA $832d ; (vdc_state + 7)
3a15 : 85 6a __ STA T14 + 0 
3a17 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
3a1a : a9 12 __ LDA #$12
3a1c : 8d 00 d6 STA $d600 
3a1f : ad 2e 83 LDA $832e ; (vdc_state + 8)
3a22 : 85 5f __ STA T7 + 0 
3a24 : 18 __ __ CLC
3a25 : 65 1b __ ADC ACCU + 0 
3a27 : aa __ __ TAX
3a28 : ad 2f 83 LDA $832f ; (vdc_state + 9)
3a2b : 85 60 __ STA T7 + 1 
3a2d : 65 1c __ ADC ACCU + 1 
.l19878:
3a2f : 2c 00 d6 BIT $d600 
3a32 : 10 fb __ BPL $3a2f ; (main.l19878 + 0)
.s1997:
3a34 : 8d 01 d6 STA $d601 
3a37 : a9 13 __ LDA #$13
3a39 : 8d 00 d6 STA $d600 
.l19880:
3a3c : 2c 00 d6 BIT $d600 
3a3f : 10 fb __ BPL $3a3c ; (main.l19880 + 0)
.s2002:
3a41 : 8e 01 d6 STX $d601 
3a44 : a9 1f __ LDA #$1f
3a46 : 8d 00 d6 STA $d600 
.l19882:
3a49 : 2c 00 d6 BIT $d600 
3a4c : 10 fb __ BPL $3a49 ; (main.l19882 + 0)
.s2006:
3a4e : a9 20 __ LDA #$20
3a50 : 8d 01 d6 STA $d601 
3a53 : a9 18 __ LDA #$18
3a55 : 8d 00 d6 STA $d600 
.l19884:
3a58 : 2c 00 d6 BIT $d600 
3a5b : 10 fb __ BPL $3a58 ; (main.l19884 + 0)
.s2012:
3a5d : ad 01 d6 LDA $d601 
3a60 : 29 7f __ AND #$7f
3a62 : a0 18 __ LDY #$18
3a64 : 8c 00 d6 STY $d600 
.l19886:
3a67 : 2c 00 d6 BIT $d600 
3a6a : 10 fb __ BPL $3a67 ; (main.l19886 + 0)
.s2018:
3a6c : 8d 01 d6 STA $d601 
3a6f : a9 1e __ LDA #$1e
3a71 : 8d 00 d6 STA $d600 
.l19888:
3a74 : 2c 00 d6 BIT $d600 
3a77 : 10 fb __ BPL $3a74 ; (main.l19888 + 0)
.s2023:
3a79 : a5 66 __ LDA T12 + 0 
3a7b : 8d 01 d6 STA $d601 
3a7e : a9 12 __ LDA #$12
3a80 : 8d 00 d6 STA $d600 
3a83 : ad 30 83 LDA $8330 ; (vdc_state + 10)
3a86 : 85 68 __ STA T13 + 0 
3a88 : 18 __ __ CLC
3a89 : 65 1b __ ADC ACCU + 0 
3a8b : aa __ __ TAX
3a8c : ad 31 83 LDA $8331 ; (vdc_state + 11)
3a8f : 85 69 __ STA T13 + 1 
3a91 : 65 1c __ ADC ACCU + 1 
.l19890:
3a93 : 2c 00 d6 BIT $d600 
3a96 : 10 fb __ BPL $3a93 ; (main.l19890 + 0)
.s2030:
3a98 : 8d 01 d6 STA $d601 
3a9b : a9 13 __ LDA #$13
3a9d : 8d 00 d6 STA $d600 
.l19892:
3aa0 : 2c 00 d6 BIT $d600 
3aa3 : 10 fb __ BPL $3aa0 ; (main.l19892 + 0)
.s2035:
3aa5 : 8e 01 d6 STX $d601 
3aa8 : a9 1f __ LDA #$1f
3aaa : 8d 00 d6 STA $d600 
.l19894:
3aad : 2c 00 d6 BIT $d600 
3ab0 : 10 fb __ BPL $3aad ; (main.l19894 + 0)
.s2039:
3ab2 : a5 6a __ LDA T14 + 0 
3ab4 : 8d 01 d6 STA $d601 
3ab7 : 8c 00 d6 STY $d600 
.l19896:
3aba : 2c 00 d6 BIT $d600 
3abd : 10 fb __ BPL $3aba ; (main.l19896 + 0)
.s2045:
3abf : ad 01 d6 LDA $d601 
3ac2 : 29 7f __ AND #$7f
3ac4 : 8c 00 d6 STY $d600 
.l19898:
3ac7 : 2c 00 d6 BIT $d600 
3aca : 10 fb __ BPL $3ac7 ; (main.l19898 + 0)
.s2051:
3acc : 8d 01 d6 STA $d601 
3acf : a9 1e __ LDA #$1e
3ad1 : 8d 00 d6 STA $d600 
.l19900:
3ad4 : 2c 00 d6 BIT $d600 
3ad7 : 10 fb __ BPL $3ad4 ; (main.l19900 + 0)
.s2056:
3ad9 : a5 66 __ LDA T12 + 0 
3adb : 8d 01 d6 STA $d601 
3ade : a5 61 __ LDA T8 + 0 
3ae0 : 29 20 __ AND #$20
3ae2 : d0 0f __ BNE $3af3 ; (main.s2057 + 0)
.s20335:
3ae4 : e6 56 __ INC T2 + 0 
3ae6 : a5 56 __ LDA T2 + 0 
3ae8 : cd 24 bf CMP $bf24 ; (window + 3)
3aeb : b0 03 __ BCS $3af0 ; (main.s20335 + 12)
3aed : 4c f1 39 JMP $39f1 ; (main.l1951 + 0)
3af0 : 4c 10 2f JMP $2f10 ; (main.s1655 + 0)
.s2057:
3af3 : 18 __ __ CLC
3af4 : a5 62 __ LDA T9 + 0 
3af6 : 65 64 __ ADC T11 + 0 
3af8 : 85 0d __ STA P0 
3afa : ad 97 7e LDA $7e97 ; (winStyles + 8)
3afd : 85 62 __ STA T9 + 0 
3aff : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
3b02 : a9 12 __ LDA #$12
3b04 : 8d 00 d6 STA $d600 
3b07 : 18 __ __ CLC
3b08 : a5 1b __ LDA ACCU + 0 
3b0a : 65 5f __ ADC T7 + 0 
3b0c : aa __ __ TAX
3b0d : a5 1c __ LDA ACCU + 1 
3b0f : 65 60 __ ADC T7 + 1 
.l19903:
3b11 : 2c 00 d6 BIT $d600 
3b14 : 10 fb __ BPL $3b11 ; (main.l19903 + 0)
.s2067:
3b16 : 8d 01 d6 STA $d601 
3b19 : a9 13 __ LDA #$13
3b1b : 8d 00 d6 STA $d600 
.l19905:
3b1e : 2c 00 d6 BIT $d600 
3b21 : 10 fb __ BPL $3b1e ; (main.l19905 + 0)
.s2072:
3b23 : 8e 01 d6 STX $d601 
3b26 : a9 1f __ LDA #$1f
3b28 : 8d 00 d6 STA $d600 
.l19907:
3b2b : 2c 00 d6 BIT $d600 
3b2e : 10 fb __ BPL $3b2b ; (main.l19907 + 0)
.s2076:
3b30 : a5 62 __ LDA T9 + 0 
3b32 : 8d 01 d6 STA $d601 
3b35 : a9 12 __ LDA #$12
3b37 : 8d 00 d6 STA $d600 
3b3a : 18 __ __ CLC
3b3b : a5 1b __ LDA ACCU + 0 
3b3d : 65 68 __ ADC T13 + 0 
3b3f : aa __ __ TAX
3b40 : a5 1c __ LDA ACCU + 1 
3b42 : 65 69 __ ADC T13 + 1 
.l19909:
3b44 : 2c 00 d6 BIT $d600 
3b47 : 10 fb __ BPL $3b44 ; (main.l19909 + 0)
.s2083:
3b49 : 8d 01 d6 STA $d601 
3b4c : a9 13 __ LDA #$13
3b4e : 8d 00 d6 STA $d600 
.l19911:
3b51 : 2c 00 d6 BIT $d600 
3b54 : 10 fb __ BPL $3b51 ; (main.l19911 + 0)
.s2088:
3b56 : 8e 01 d6 STX $d601 
3b59 : a9 1f __ LDA #$1f
3b5b : 8d 00 d6 STA $d600 
.l19913:
3b5e : 2c 00 d6 BIT $d600 
3b61 : 10 fb __ BPL $3b5e ; (main.l19913 + 0)
.s2092:
3b63 : a5 55 __ LDA T1 + 0 
3b65 : 8d 01 d6 STA $d601 
3b68 : 4c e4 3a JMP $3ae4 ; (main.s20335 + 0)
.s1954:
3b6b : ad 21 bf LDA $bf21 ; (window + 0)
3b6e : 85 0d __ STA P0 
3b70 : c6 0d __ DEC P0 
3b72 : ad 22 bf LDA $bf22 ; (window + 1)
3b75 : 18 __ __ CLC
3b76 : 65 56 __ ADC T2 + 0 
3b78 : 85 0e __ STA P1 
3b7a : ad 96 7e LDA $7e96 ; (winStyles + 7)
3b7d : 85 62 __ STA T9 + 0 
3b7f : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
3b82 : a9 12 __ LDA #$12
3b84 : 8d 00 d6 STA $d600 
3b87 : 18 __ __ CLC
3b88 : a5 1b __ LDA ACCU + 0 
3b8a : 6d 2e 83 ADC $832e ; (vdc_state + 8)
3b8d : aa __ __ TAX
3b8e : a5 1c __ LDA ACCU + 1 
3b90 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19866:
3b93 : 2c 00 d6 BIT $d600 
3b96 : 10 fb __ BPL $3b93 ; (main.l19866 + 0)
.s1964:
3b98 : 8d 01 d6 STA $d601 
3b9b : a9 13 __ LDA #$13
3b9d : 8d 00 d6 STA $d600 
.l19868:
3ba0 : 2c 00 d6 BIT $d600 
3ba3 : 10 fb __ BPL $3ba0 ; (main.l19868 + 0)
.s1969:
3ba5 : 8e 01 d6 STX $d601 
3ba8 : a9 1f __ LDA #$1f
3baa : 8d 00 d6 STA $d600 
.l19870:
3bad : 2c 00 d6 BIT $d600 
3bb0 : 10 fb __ BPL $3bad ; (main.l19870 + 0)
.s1973:
3bb2 : a5 62 __ LDA T9 + 0 
3bb4 : 8d 01 d6 STA $d601 
3bb7 : ad 30 83 LDA $8330 ; (vdc_state + 10)
3bba : 18 __ __ CLC
3bbb : 65 1b __ ADC ACCU + 0 
3bbd : a2 12 __ LDX #$12
3bbf : 8e 00 d6 STX $d600 
3bc2 : aa __ __ TAX
3bc3 : ad 31 83 LDA $8331 ; (vdc_state + 11)
3bc6 : 65 1c __ ADC ACCU + 1 
.l19872:
3bc8 : 2c 00 d6 BIT $d600 
3bcb : 10 fb __ BPL $3bc8 ; (main.l19872 + 0)
.s1980:
3bcd : 8d 01 d6 STA $d601 
3bd0 : a9 13 __ LDA #$13
3bd2 : 8d 00 d6 STA $d600 
.l19874:
3bd5 : 2c 00 d6 BIT $d600 
3bd8 : 10 fb __ BPL $3bd5 ; (main.l19874 + 0)
.s1985:
3bda : 8e 01 d6 STX $d601 
3bdd : a9 1f __ LDA #$1f
3bdf : 8d 00 d6 STA $d600 
.l19876:
3be2 : 2c 00 d6 BIT $d600 
3be5 : 10 fb __ BPL $3be2 ; (main.l19876 + 0)
.s1989:
3be7 : a5 55 __ LDA T1 + 0 
3be9 : 8d 01 d6 STA $d601 
3bec : 4c f9 39 JMP $39f9 ; (main.s1956 + 0)
.s1807:
3bef : a5 61 __ LDA T8 + 0 
3bf1 : 0a __ __ ASL
3bf2 : 10 03 __ BPL $3bf7 ; (main.s1813 + 0)
3bf4 : 4c 4b 3d JMP $3d4b ; (main.s1811 + 0)
.s1813:
3bf7 : a5 56 __ LDA T2 + 0 
3bf9 : 85 0d __ STA P0 
3bfb : a5 5d __ LDA T6 + 0 
3bfd : 85 0e __ STA P1 
3bff : ad 95 7e LDA $7e95 ; (winStyles + 6)
3c02 : 85 56 __ STA T2 + 0 
3c04 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
3c07 : a9 12 __ LDA #$12
3c09 : 8d 00 d6 STA $d600 
3c0c : c6 5f __ DEC T7 + 0 
3c0e : ad 2e 83 LDA $832e ; (vdc_state + 8)
3c11 : 85 66 __ STA T12 + 0 
3c13 : 18 __ __ CLC
3c14 : 65 1b __ ADC ACCU + 0 
3c16 : aa __ __ TAX
3c17 : ad 2f 83 LDA $832f ; (vdc_state + 9)
3c1a : 85 67 __ STA T12 + 1 
3c1c : 65 1c __ ADC ACCU + 1 
.l19827:
3c1e : 2c 00 d6 BIT $d600 
3c21 : 10 fb __ BPL $3c1e ; (main.l19827 + 0)
.s1854:
3c23 : 8d 01 d6 STA $d601 
3c26 : a9 13 __ LDA #$13
3c28 : 8d 00 d6 STA $d600 
.l19829:
3c2b : 2c 00 d6 BIT $d600 
3c2e : 10 fb __ BPL $3c2b ; (main.l19829 + 0)
.s1859:
3c30 : 8e 01 d6 STX $d601 
3c33 : a9 1f __ LDA #$1f
3c35 : 8d 00 d6 STA $d600 
.l19831:
3c38 : 2c 00 d6 BIT $d600 
3c3b : 10 fb __ BPL $3c38 ; (main.l19831 + 0)
.s1863:
3c3d : a5 56 __ LDA T2 + 0 
3c3f : 8d 01 d6 STA $d601 
3c42 : a9 18 __ LDA #$18
3c44 : 8d 00 d6 STA $d600 
.l19833:
3c47 : 2c 00 d6 BIT $d600 
3c4a : 10 fb __ BPL $3c47 ; (main.l19833 + 0)
.s1869:
3c4c : ad 01 d6 LDA $d601 
3c4f : 29 7f __ AND #$7f
3c51 : a0 18 __ LDY #$18
3c53 : 8c 00 d6 STY $d600 
.l19835:
3c56 : 2c 00 d6 BIT $d600 
3c59 : 10 fb __ BPL $3c56 ; (main.l19835 + 0)
.s1875:
3c5b : 8d 01 d6 STA $d601 
3c5e : a9 1e __ LDA #$1e
3c60 : 8d 00 d6 STA $d600 
.l19837:
3c63 : 2c 00 d6 BIT $d600 
3c66 : 10 fb __ BPL $3c63 ; (main.l19837 + 0)
.s1880:
3c68 : a5 5f __ LDA T7 + 0 
3c6a : 8d 01 d6 STA $d601 
3c6d : a9 12 __ LDA #$12
3c6f : 8d 00 d6 STA $d600 
3c72 : ad 30 83 LDA $8330 ; (vdc_state + 10)
3c75 : 85 68 __ STA T13 + 0 
3c77 : 18 __ __ CLC
3c78 : 65 1b __ ADC ACCU + 0 
3c7a : aa __ __ TAX
3c7b : ad 31 83 LDA $8331 ; (vdc_state + 11)
3c7e : 85 69 __ STA T13 + 1 
3c80 : 65 1c __ ADC ACCU + 1 
.l19839:
3c82 : 2c 00 d6 BIT $d600 
3c85 : 10 fb __ BPL $3c82 ; (main.l19839 + 0)
.s1887:
3c87 : 8d 01 d6 STA $d601 
3c8a : a9 13 __ LDA #$13
3c8c : 8d 00 d6 STA $d600 
.l19841:
3c8f : 2c 00 d6 BIT $d600 
3c92 : 10 fb __ BPL $3c8f ; (main.l19841 + 0)
.s1892:
3c94 : 8e 01 d6 STX $d601 
3c97 : a9 1f __ LDA #$1f
3c99 : 8d 00 d6 STA $d600 
.l19843:
3c9c : 2c 00 d6 BIT $d600 
3c9f : 10 fb __ BPL $3c9c ; (main.l19843 + 0)
.s1896:
3ca1 : a5 55 __ LDA T1 + 0 
3ca3 : 8d 01 d6 STA $d601 
3ca6 : 8c 00 d6 STY $d600 
.l19845:
3ca9 : 2c 00 d6 BIT $d600 
3cac : 10 fb __ BPL $3ca9 ; (main.l19845 + 0)
.s1902:
3cae : ad 01 d6 LDA $d601 
3cb1 : 29 7f __ AND #$7f
3cb3 : 8c 00 d6 STY $d600 
.l19847:
3cb6 : 2c 00 d6 BIT $d600 
3cb9 : 10 fb __ BPL $3cb6 ; (main.l19847 + 0)
.s1908:
3cbb : 8d 01 d6 STA $d601 
3cbe : a9 1e __ LDA #$1e
3cc0 : 8d 00 d6 STA $d600 
.l19849:
3cc3 : 2c 00 d6 BIT $d600 
3cc6 : 10 fb __ BPL $3cc3 ; (main.l19849 + 0)
.s1913:
3cc8 : a5 5f __ LDA T7 + 0 
3cca : 8d 01 d6 STA $d601 
3ccd : a5 61 __ LDA T8 + 0 
3ccf : 29 20 __ AND #$20
3cd1 : d0 03 __ BNE $3cd6 ; (main.s1914 + 0)
3cd3 : 4c 04 2f JMP $2f04 ; (main.s4026 + 0)
.s1914:
3cd6 : a5 64 __ LDA T11 + 0 
3cd8 : 85 0d __ STA P0 
3cda : ad 93 7e LDA $7e93 ; (winStyles + 4)
3cdd : 85 56 __ STA T2 + 0 
3cdf : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
3ce2 : a9 12 __ LDA #$12
3ce4 : 8d 00 d6 STA $d600 
3ce7 : 18 __ __ CLC
3ce8 : a5 1b __ LDA ACCU + 0 
3cea : 65 66 __ ADC T12 + 0 
3cec : aa __ __ TAX
3ced : a5 1c __ LDA ACCU + 1 
3cef : 65 67 __ ADC T12 + 1 
.l19852:
3cf1 : 2c 00 d6 BIT $d600 
3cf4 : 10 fb __ BPL $3cf1 ; (main.l19852 + 0)
.s1924:
3cf6 : 8d 01 d6 STA $d601 
3cf9 : a9 13 __ LDA #$13
3cfb : 8d 00 d6 STA $d600 
.l19854:
3cfe : 2c 00 d6 BIT $d600 
3d01 : 10 fb __ BPL $3cfe ; (main.l19854 + 0)
.s1929:
3d03 : 8e 01 d6 STX $d601 
3d06 : a9 1f __ LDA #$1f
3d08 : 8d 00 d6 STA $d600 
.l19856:
3d0b : 2c 00 d6 BIT $d600 
3d0e : 10 fb __ BPL $3d0b ; (main.l19856 + 0)
.s1933:
3d10 : a5 56 __ LDA T2 + 0 
3d12 : 8d 01 d6 STA $d601 
3d15 : a9 12 __ LDA #$12
3d17 : 8d 00 d6 STA $d600 
3d1a : 18 __ __ CLC
3d1b : a5 1b __ LDA ACCU + 0 
3d1d : 65 68 __ ADC T13 + 0 
3d1f : aa __ __ TAX
3d20 : a5 1c __ LDA ACCU + 1 
3d22 : 65 69 __ ADC T13 + 1 
.l19858:
3d24 : 2c 00 d6 BIT $d600 
3d27 : 10 fb __ BPL $3d24 ; (main.l19858 + 0)
.s1940:
3d29 : 8d 01 d6 STA $d601 
3d2c : a9 13 __ LDA #$13
3d2e : 8d 00 d6 STA $d600 
.l19860:
3d31 : 2c 00 d6 BIT $d600 
3d34 : 10 fb __ BPL $3d31 ; (main.l19860 + 0)
.s1945:
3d36 : 8e 01 d6 STX $d601 
3d39 : a9 1f __ LDA #$1f
3d3b : 8d 00 d6 STA $d600 
.l19862:
3d3e : 2c 00 d6 BIT $d600 
3d41 : 10 fb __ BPL $3d3e ; (main.l19862 + 0)
.s1949:
3d43 : a5 55 __ LDA T1 + 0 
3d45 : 8d 01 d6 STA $d601 
3d48 : 4c 04 2f JMP $2f04 ; (main.s4026 + 0)
.s1811:
3d4b : a5 5d __ LDA T6 + 0 
3d4d : 85 0e __ STA P1 
3d4f : a6 56 __ LDX T2 + 0 
3d51 : ca __ __ DEX
3d52 : 86 0d __ STX P0 
3d54 : ad 92 7e LDA $7e92 ; (winStyles + 3)
3d57 : 85 62 __ STA T9 + 0 
3d59 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
3d5c : a9 12 __ LDA #$12
3d5e : 8d 00 d6 STA $d600 
3d61 : 18 __ __ CLC
3d62 : a5 1b __ LDA ACCU + 0 
3d64 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
3d67 : aa __ __ TAX
3d68 : a5 1c __ LDA ACCU + 1 
3d6a : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19815:
3d6d : 2c 00 d6 BIT $d600 
3d70 : 10 fb __ BPL $3d6d ; (main.l19815 + 0)
.s1821:
3d72 : 8d 01 d6 STA $d601 
3d75 : a9 13 __ LDA #$13
3d77 : 8d 00 d6 STA $d600 
.l19817:
3d7a : 2c 00 d6 BIT $d600 
3d7d : 10 fb __ BPL $3d7a ; (main.l19817 + 0)
.s1826:
3d7f : 8e 01 d6 STX $d601 
3d82 : a9 1f __ LDA #$1f
3d84 : 8d 00 d6 STA $d600 
.l19819:
3d87 : 2c 00 d6 BIT $d600 
3d8a : 10 fb __ BPL $3d87 ; (main.l19819 + 0)
.s1830:
3d8c : a5 62 __ LDA T9 + 0 
3d8e : 8d 01 d6 STA $d601 
3d91 : ad 30 83 LDA $8330 ; (vdc_state + 10)
3d94 : 18 __ __ CLC
3d95 : 65 1b __ ADC ACCU + 0 
3d97 : a2 12 __ LDX #$12
3d99 : 8e 00 d6 STX $d600 
3d9c : aa __ __ TAX
3d9d : ad 31 83 LDA $8331 ; (vdc_state + 11)
3da0 : 65 1c __ ADC ACCU + 1 
.l19821:
3da2 : 2c 00 d6 BIT $d600 
3da5 : 10 fb __ BPL $3da2 ; (main.l19821 + 0)
.s1837:
3da7 : 8d 01 d6 STA $d601 
3daa : a9 13 __ LDA #$13
3dac : 8d 00 d6 STA $d600 
.l19823:
3daf : 2c 00 d6 BIT $d600 
3db2 : 10 fb __ BPL $3daf ; (main.l19823 + 0)
.s1842:
3db4 : 8e 01 d6 STX $d601 
3db7 : a9 1f __ LDA #$1f
3db9 : 8d 00 d6 STA $d600 
.l19825:
3dbc : 2c 00 d6 BIT $d600 
3dbf : 10 fb __ BPL $3dbc ; (main.l19825 + 0)
.s1846:
3dc1 : a5 55 __ LDA T1 + 0 
3dc3 : 8d 01 d6 STA $d601 
3dc6 : 4c f7 3b JMP $3bf7 ; (main.s1813 + 0)
.s1664:
3dc9 : 85 62 __ STA T9 + 0 
3dcb : a5 61 __ LDA T8 + 0 
3dcd : 0a __ __ ASL
3dce : 10 03 __ BPL $3dd3 ; (main.s1670 + 0)
3dd0 : 4c 29 3f JMP $3f29 ; (main.s1668 + 0)
.s1670:
3dd3 : a5 56 __ LDA T2 + 0 
3dd5 : 85 0d __ STA P0 
3dd7 : a6 62 __ LDX T9 + 0 
3dd9 : ca __ __ DEX
3dda : 86 0e __ STX P1 
3ddc : ad 94 7e LDA $7e94 ; (winStyles + 5)
3ddf : 85 63 __ STA T10 + 0 
3de1 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
3de4 : a9 12 __ LDA #$12
3de6 : 8d 00 d6 STA $d600 
3de9 : ad 2e 83 LDA $832e ; (vdc_state + 8)
3dec : 85 66 __ STA T12 + 0 
3dee : 18 __ __ CLC
3def : 65 1b __ ADC ACCU + 0 
3df1 : a8 __ __ TAY
3df2 : ad 2f 83 LDA $832f ; (vdc_state + 9)
3df5 : 85 67 __ STA T12 + 1 
3df7 : 65 1c __ ADC ACCU + 1 
3df9 : a6 5f __ LDX T7 + 0 
3dfb : ca __ __ DEX
.l19775:
3dfc : 2c 00 d6 BIT $d600 
3dff : 10 fb __ BPL $3dfc ; (main.l19775 + 0)
.s1711:
3e01 : 8d 01 d6 STA $d601 
3e04 : a9 13 __ LDA #$13
3e06 : 8d 00 d6 STA $d600 
.l19777:
3e09 : 2c 00 d6 BIT $d600 
3e0c : 10 fb __ BPL $3e09 ; (main.l19777 + 0)
.s1716:
3e0e : 8c 01 d6 STY $d601 
3e11 : a9 1f __ LDA #$1f
3e13 : 8d 00 d6 STA $d600 
.l19779:
3e16 : 2c 00 d6 BIT $d600 
3e19 : 10 fb __ BPL $3e16 ; (main.l19779 + 0)
.s1720:
3e1b : a5 63 __ LDA T10 + 0 
3e1d : 8d 01 d6 STA $d601 
3e20 : a9 18 __ LDA #$18
3e22 : 8d 00 d6 STA $d600 
.l19781:
3e25 : 2c 00 d6 BIT $d600 
3e28 : 10 fb __ BPL $3e25 ; (main.l19781 + 0)
.s1726:
3e2a : ad 01 d6 LDA $d601 
3e2d : 29 7f __ AND #$7f
3e2f : a0 18 __ LDY #$18
3e31 : 8c 00 d6 STY $d600 
.l19783:
3e34 : 2c 00 d6 BIT $d600 
3e37 : 10 fb __ BPL $3e34 ; (main.l19783 + 0)
.s1732:
3e39 : 8d 01 d6 STA $d601 
3e3c : a9 1e __ LDA #$1e
3e3e : 8d 00 d6 STA $d600 
.l19785:
3e41 : 2c 00 d6 BIT $d600 
3e44 : 10 fb __ BPL $3e41 ; (main.l19785 + 0)
.s1737:
3e46 : 8e 01 d6 STX $d601 
3e49 : a9 12 __ LDA #$12
3e4b : 8d 00 d6 STA $d600 
3e4e : ad 30 83 LDA $8330 ; (vdc_state + 10)
3e51 : 85 6b __ STA T15 + 0 
3e53 : 18 __ __ CLC
3e54 : 65 1b __ ADC ACCU + 0 
3e56 : a8 __ __ TAY
3e57 : ad 31 83 LDA $8331 ; (vdc_state + 11)
3e5a : 85 6c __ STA T15 + 1 
3e5c : 65 1c __ ADC ACCU + 1 
.l19787:
3e5e : 2c 00 d6 BIT $d600 
3e61 : 10 fb __ BPL $3e5e ; (main.l19787 + 0)
.s1744:
3e63 : 8d 01 d6 STA $d601 
3e66 : a9 13 __ LDA #$13
3e68 : 8d 00 d6 STA $d600 
.l19789:
3e6b : 2c 00 d6 BIT $d600 
3e6e : 10 fb __ BPL $3e6b ; (main.l19789 + 0)
.s1749:
3e70 : 8c 01 d6 STY $d601 
3e73 : a9 1f __ LDA #$1f
3e75 : 8d 00 d6 STA $d600 
.l19791:
3e78 : 2c 00 d6 BIT $d600 
3e7b : 10 fb __ BPL $3e78 ; (main.l19791 + 0)
.s1753:
3e7d : a5 55 __ LDA T1 + 0 
3e7f : 8d 01 d6 STA $d601 
3e82 : a9 18 __ LDA #$18
3e84 : 8d 00 d6 STA $d600 
.l19793:
3e87 : 2c 00 d6 BIT $d600 
3e8a : 10 fb __ BPL $3e87 ; (main.l19793 + 0)
.s1759:
3e8c : ad 01 d6 LDA $d601 
3e8f : 29 7f __ AND #$7f
3e91 : a0 18 __ LDY #$18
3e93 : 8c 00 d6 STY $d600 
.l19795:
3e96 : 2c 00 d6 BIT $d600 
3e99 : 10 fb __ BPL $3e96 ; (main.l19795 + 0)
.s1765:
3e9b : 8d 01 d6 STA $d601 
3e9e : a9 1e __ LDA #$1e
3ea0 : 8d 00 d6 STA $d600 
.l19797:
3ea3 : 2c 00 d6 BIT $d600 
3ea6 : 10 fb __ BPL $3ea3 ; (main.l19797 + 0)
.s1770:
3ea8 : 8e 01 d6 STX $d601 
3eab : a5 61 __ LDA T8 + 0 
3ead : 29 20 __ AND #$20
3eaf : d0 03 __ BNE $3eb4 ; (main.s1771 + 0)
3eb1 : 4c e5 2e JMP $2ee5 ; (main.s19812 + 0)
.s1771:
3eb4 : a5 64 __ LDA T11 + 0 
3eb6 : 85 0d __ STA P0 
3eb8 : ad 91 7e LDA $7e91 ; (winStyles + 2)
3ebb : 85 62 __ STA T9 + 0 
3ebd : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
3ec0 : a9 12 __ LDA #$12
3ec2 : 8d 00 d6 STA $d600 
3ec5 : 18 __ __ CLC
3ec6 : a5 1b __ LDA ACCU + 0 
3ec8 : 65 66 __ ADC T12 + 0 
3eca : aa __ __ TAX
3ecb : a5 1c __ LDA ACCU + 1 
3ecd : 65 67 __ ADC T12 + 1 
.l19800:
3ecf : 2c 00 d6 BIT $d600 
3ed2 : 10 fb __ BPL $3ecf ; (main.l19800 + 0)
.s1781:
3ed4 : 8d 01 d6 STA $d601 
3ed7 : a9 13 __ LDA #$13
3ed9 : 8d 00 d6 STA $d600 
.l19802:
3edc : 2c 00 d6 BIT $d600 
3edf : 10 fb __ BPL $3edc ; (main.l19802 + 0)
.s1786:
3ee1 : 8e 01 d6 STX $d601 
3ee4 : a9 1f __ LDA #$1f
3ee6 : 8d 00 d6 STA $d600 
.l19804:
3ee9 : 2c 00 d6 BIT $d600 
3eec : 10 fb __ BPL $3ee9 ; (main.l19804 + 0)
.s1790:
3eee : a5 62 __ LDA T9 + 0 
3ef0 : 8d 01 d6 STA $d601 
3ef3 : a9 12 __ LDA #$12
3ef5 : 8d 00 d6 STA $d600 
3ef8 : 18 __ __ CLC
3ef9 : a5 1b __ LDA ACCU + 0 
3efb : 65 6b __ ADC T15 + 0 
3efd : aa __ __ TAX
3efe : a5 1c __ LDA ACCU + 1 
3f00 : 65 6c __ ADC T15 + 1 
.l19806:
3f02 : 2c 00 d6 BIT $d600 
3f05 : 10 fb __ BPL $3f02 ; (main.l19806 + 0)
.s1797:
3f07 : 8d 01 d6 STA $d601 
3f0a : a9 13 __ LDA #$13
3f0c : 8d 00 d6 STA $d600 
.l19808:
3f0f : 2c 00 d6 BIT $d600 
3f12 : 10 fb __ BPL $3f0f ; (main.l19808 + 0)
.s1802:
3f14 : 8e 01 d6 STX $d601 
3f17 : a9 1f __ LDA #$1f
3f19 : 8d 00 d6 STA $d600 
.l19810:
3f1c : 2c 00 d6 BIT $d600 
3f1f : 10 fb __ BPL $3f1c ; (main.l19810 + 0)
.s1806:
3f21 : a5 55 __ LDA T1 + 0 
3f23 : 8d 01 d6 STA $d601 
3f26 : 4c e5 2e JMP $2ee5 ; (main.s19812 + 0)
.s1668:
3f29 : a6 56 __ LDX T2 + 0 
3f2b : ca __ __ DEX
3f2c : 86 0d __ STX P0 
3f2e : a6 62 __ LDX T9 + 0 
3f30 : ca __ __ DEX
3f31 : 86 0e __ STX P1 
3f33 : ad 90 7e LDA $7e90 ; (winStyles + 1)
3f36 : 85 63 __ STA T10 + 0 
3f38 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
3f3b : a9 12 __ LDA #$12
3f3d : 8d 00 d6 STA $d600 
3f40 : 18 __ __ CLC
3f41 : a5 1b __ LDA ACCU + 0 
3f43 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
3f46 : aa __ __ TAX
3f47 : a5 1c __ LDA ACCU + 1 
3f49 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19763:
3f4c : 2c 00 d6 BIT $d600 
3f4f : 10 fb __ BPL $3f4c ; (main.l19763 + 0)
.s1678:
3f51 : 8d 01 d6 STA $d601 
3f54 : a9 13 __ LDA #$13
3f56 : 8d 00 d6 STA $d600 
.l19765:
3f59 : 2c 00 d6 BIT $d600 
3f5c : 10 fb __ BPL $3f59 ; (main.l19765 + 0)
.s1683:
3f5e : 8e 01 d6 STX $d601 
3f61 : a9 1f __ LDA #$1f
3f63 : 8d 00 d6 STA $d600 
.l19767:
3f66 : 2c 00 d6 BIT $d600 
3f69 : 10 fb __ BPL $3f66 ; (main.l19767 + 0)
.s1687:
3f6b : a5 63 __ LDA T10 + 0 
3f6d : 8d 01 d6 STA $d601 
3f70 : ad 30 83 LDA $8330 ; (vdc_state + 10)
3f73 : 18 __ __ CLC
3f74 : 65 1b __ ADC ACCU + 0 
3f76 : a2 12 __ LDX #$12
3f78 : 8e 00 d6 STX $d600 
3f7b : aa __ __ TAX
3f7c : ad 31 83 LDA $8331 ; (vdc_state + 11)
3f7f : 65 1c __ ADC ACCU + 1 
.l19769:
3f81 : 2c 00 d6 BIT $d600 
3f84 : 10 fb __ BPL $3f81 ; (main.l19769 + 0)
.s1694:
3f86 : 8d 01 d6 STA $d601 
3f89 : a9 13 __ LDA #$13
3f8b : 8d 00 d6 STA $d600 
.l19771:
3f8e : 2c 00 d6 BIT $d600 
3f91 : 10 fb __ BPL $3f8e ; (main.l19771 + 0)
.s1699:
3f93 : 8e 01 d6 STX $d601 
3f96 : a9 1f __ LDA #$1f
3f98 : 8d 00 d6 STA $d600 
.l19773:
3f9b : 2c 00 d6 BIT $d600 
3f9e : 10 fb __ BPL $3f9b ; (main.l19773 + 0)
.s1703:
3fa0 : a5 55 __ LDA T1 + 0 
3fa2 : 8d 01 d6 STA $d601 
3fa5 : 4c d3 3d JMP $3dd3 ; (main.s1670 + 0)
.s1598:
3fa8 : 85 0d __ STA P0 
3faa : ae 2b 83 LDX $832b ; (vdc_state + 5)
3fad : ca __ __ DEX
3fae : 86 0e __ STX P1 
3fb0 : ad 2d 83 LDA $832d ; (vdc_state + 7)
3fb3 : 85 55 __ STA T1 + 0 
3fb5 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
3fb8 : a5 1b __ LDA ACCU + 0 
3fba : 85 59 __ STA T4 + 0 
3fbc : a5 1c __ LDA ACCU + 1 
3fbe : 85 5a __ STA T4 + 1 
3fc0 : a9 9f __ LDA #$9f
3fc2 : 85 0d __ STA P0 
3fc4 : a9 7c __ LDA #$7c
3fc6 : 85 0e __ STA P1 
3fc8 : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
3fcb : a5 1b __ LDA ACCU + 0 
3fcd : 85 5b __ STA T5 + 0 
3fcf : a9 12 __ LDA #$12
3fd1 : 8d 00 d6 STA $d600 
3fd4 : 18 __ __ CLC
3fd5 : a5 59 __ LDA T4 + 0 
3fd7 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
3fda : aa __ __ TAX
3fdb : a5 5a __ LDA T4 + 1 
3fdd : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19738:
3fe0 : 2c 00 d6 BIT $d600 
3fe3 : 10 fb __ BPL $3fe0 ; (main.l19738 + 0)
.s1608:
3fe5 : 8d 01 d6 STA $d601 
3fe8 : a9 13 __ LDA #$13
3fea : 8d 00 d6 STA $d600 
.l19740:
3fed : 2c 00 d6 BIT $d600 
3ff0 : 10 fb __ BPL $3fed ; (main.l19740 + 0)
.s1613:
3ff2 : 8e 01 d6 STX $d601 
3ff5 : a9 1f __ LDA #$1f
3ff7 : 8d 00 d6 STA $d600 
3ffa : a5 1b __ LDA ACCU + 0 
3ffc : f0 19 __ BEQ $4017 ; (main.s1618 + 0)
.s4082:
3ffe : a2 00 __ LDX #$00
.l1616:
4000 : 86 56 __ STX T2 + 0 
4002 : bd 9f 7c LDA $7c9f,x 
4005 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19743:
4008 : 2c 00 d6 BIT $d600 
400b : 10 fb __ BPL $4008 ; (main.l19743 + 0)
.s1621:
400d : 8d 01 d6 STA $d601 
4010 : a6 56 __ LDX T2 + 0 
4012 : e8 __ __ INX
4013 : e4 5b __ CPX T5 + 0 
4015 : 90 e9 __ BCC $4000 ; (main.l1616 + 0)
.s1618:
4017 : a9 12 __ LDA #$12
4019 : 8d 00 d6 STA $d600 
401c : c6 5b __ DEC T5 + 0 
401e : ad 30 83 LDA $8330 ; (vdc_state + 10)
4021 : 18 __ __ CLC
4022 : 65 59 __ ADC T4 + 0 
4024 : aa __ __ TAX
4025 : ad 31 83 LDA $8331 ; (vdc_state + 11)
4028 : 65 5a __ ADC T4 + 1 
.l19746:
402a : 2c 00 d6 BIT $d600 
402d : 10 fb __ BPL $402a ; (main.l19746 + 0)
.s1628:
402f : 8d 01 d6 STA $d601 
4032 : a9 13 __ LDA #$13
4034 : 8d 00 d6 STA $d600 
.l19748:
4037 : 2c 00 d6 BIT $d600 
403a : 10 fb __ BPL $4037 ; (main.l19748 + 0)
.s1633:
403c : 8e 01 d6 STX $d601 
403f : a9 1f __ LDA #$1f
4041 : 8d 00 d6 STA $d600 
.l19750:
4044 : 2c 00 d6 BIT $d600 
4047 : 10 fb __ BPL $4044 ; (main.l19750 + 0)
.s1637:
4049 : a5 55 __ LDA T1 + 0 
404b : 8d 01 d6 STA $d601 
404e : a9 18 __ LDA #$18
4050 : 8d 00 d6 STA $d600 
.l19752:
4053 : 2c 00 d6 BIT $d600 
4056 : 10 fb __ BPL $4053 ; (main.l19752 + 0)
.s1643:
4058 : ad 01 d6 LDA $d601 
405b : 29 7f __ AND #$7f
405d : a2 18 __ LDX #$18
405f : 8e 00 d6 STX $d600 
.l19754:
4062 : 2c 00 d6 BIT $d600 
4065 : 10 fb __ BPL $4062 ; (main.l19754 + 0)
.s1649:
4067 : 8d 01 d6 STA $d601 
406a : a9 1e __ LDA #$1e
406c : 8d 00 d6 STA $d600 
.l19756:
406f : 2c 00 d6 BIT $d600 
4072 : 10 fb __ BPL $406f ; (main.l19756 + 0)
.s1654:
4074 : a5 5b __ LDA T5 + 0 
4076 : 8d 01 d6 STA $d601 
4079 : 4c 78 2e JMP $2e78 ; (main.s1600 + 0)
.s1474:
407c : 85 0e __ STA P1 
407e : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
4081 : a9 12 __ LDA #$12
4083 : 8d 00 d6 STA $d600 
4086 : 18 __ __ CLC
4087 : a5 1b __ LDA ACCU + 0 
4089 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
408c : aa __ __ TAX
408d : a5 1c __ LDA ACCU + 1 
408f : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19693:
4092 : 2c 00 d6 BIT $d600 
4095 : 10 fb __ BPL $4092 ; (main.l19693 + 0)
.s1484:
4097 : 8d 01 d6 STA $d601 
409a : a9 13 __ LDA #$13
409c : 8d 00 d6 STA $d600 
.l19695:
409f : 2c 00 d6 BIT $d600 
40a2 : 10 fb __ BPL $409f ; (main.l19695 + 0)
.s1489:
40a4 : 8e 01 d6 STX $d601 
40a7 : a9 1f __ LDA #$1f
40a9 : 8d 00 d6 STA $d600 
.l19697:
40ac : 2c 00 d6 BIT $d600 
40af : 10 fb __ BPL $40ac ; (main.l19697 + 0)
.s1493:
40b1 : a9 20 __ LDA #$20
40b3 : 8d 01 d6 STA $d601 
40b6 : a9 18 __ LDA #$18
40b8 : 8d 00 d6 STA $d600 
.l19699:
40bb : 2c 00 d6 BIT $d600 
40be : 10 fb __ BPL $40bb ; (main.l19699 + 0)
.s1499:
40c0 : ad 01 d6 LDA $d601 
40c3 : 29 7f __ AND #$7f
40c5 : a2 18 __ LDX #$18
40c7 : 8e 00 d6 STX $d600 
.l19701:
40ca : 2c 00 d6 BIT $d600 
40cd : 10 fb __ BPL $40ca ; (main.l19701 + 0)
.s1505:
40cf : 8d 01 d6 STA $d601 
40d2 : a9 1e __ LDA #$1e
40d4 : 8d 00 d6 STA $d600 
.l19703:
40d7 : 2c 00 d6 BIT $d600 
40da : 10 fb __ BPL $40d7 ; (main.l19703 + 0)
.s1510:
40dc : a9 4f __ LDA #$4f
40de : 8d 01 d6 STA $d601 
40e1 : ad 30 83 LDA $8330 ; (vdc_state + 10)
40e4 : 18 __ __ CLC
40e5 : 65 1b __ ADC ACCU + 0 
40e7 : a2 12 __ LDX #$12
40e9 : 8e 00 d6 STX $d600 
40ec : aa __ __ TAX
40ed : ad 31 83 LDA $8331 ; (vdc_state + 11)
40f0 : 65 1c __ ADC ACCU + 1 
.l19705:
40f2 : 2c 00 d6 BIT $d600 
40f5 : 10 fb __ BPL $40f2 ; (main.l19705 + 0)
.s1517:
40f7 : 8d 01 d6 STA $d601 
40fa : a9 13 __ LDA #$13
40fc : 8d 00 d6 STA $d600 
.l19707:
40ff : 2c 00 d6 BIT $d600 
4102 : 10 fb __ BPL $40ff ; (main.l19707 + 0)
.s1522:
4104 : 8e 01 d6 STX $d601 
4107 : a9 1f __ LDA #$1f
4109 : 8d 00 d6 STA $d600 
.l19709:
410c : 2c 00 d6 BIT $d600 
410f : 10 fb __ BPL $410c ; (main.l19709 + 0)
.s1526:
4111 : a5 56 __ LDA T2 + 0 
4113 : 8d 01 d6 STA $d601 
4116 : a9 18 __ LDA #$18
4118 : 8d 00 d6 STA $d600 
.l19711:
411b : 2c 00 d6 BIT $d600 
411e : 10 fb __ BPL $411b ; (main.l19711 + 0)
.s1532:
4120 : ad 01 d6 LDA $d601 
4123 : 29 7f __ AND #$7f
4125 : a2 18 __ LDX #$18
4127 : 8e 00 d6 STX $d600 
.l19713:
412a : 2c 00 d6 BIT $d600 
412d : 10 fb __ BPL $412a ; (main.l19713 + 0)
.s1538:
412f : 8d 01 d6 STA $d601 
4132 : a9 1e __ LDA #$1e
4134 : 8d 00 d6 STA $d600 
.l19715:
4137 : 2c 00 d6 BIT $d600 
413a : 10 fb __ BPL $4137 ; (main.l19715 + 0)
.s1543:
413c : e6 55 __ INC T1 + 0 
413e : a9 4f __ LDA #$4f
4140 : 8d 01 d6 STA $d601 
4143 : 4c 9b 2d JMP $2d9b ; (main.l1473 + 0)
.s3660:
4146 : c9 29 __ CMP #$29
4148 : b0 03 __ BCS $414d ; (main.s3665 + 0)
414a : 4c 38 30 JMP $3038 ; (main.s1299 + 0)
.s3665:
414d : c9 2b __ CMP #$2b
414f : 90 03 __ BCC $4154 ; (main.s3209 + 0)
4151 : 4c 38 30 JMP $3038 ; (main.s1299 + 0)
.s3209:
4154 : a9 7f __ LDA #$7f
4156 : 8d d3 be STA $bed3 ; (softscroll + 0)
4159 : 38 __ __ SEC
415a : a5 53 __ LDA T0 + 0 
415c : e9 29 __ SBC #$29
415e : 0a __ __ ASL
415f : 0a __ __ ASL
4160 : aa __ __ TAX
4161 : bd f7 82 LDA $82f7,x ; (screenset + 2)
4164 : 85 57 __ STA T3 + 0 
4166 : 8d d6 be STA $bed6 ; (softscroll + 3)
4169 : bd f5 82 LDA $82f5,x ; (screenset + 0)
416c : 8d d4 be STA $bed4 ; (softscroll + 1)
416f : bd f6 82 LDA $82f6,x ; (screenset + 1)
4172 : 8d d5 be STA $bed5 ; (softscroll + 2)
4175 : bd f8 82 LDA $82f8,x ; (screenset + 3)
4178 : 85 1b __ STA ACCU + 0 
417a : 8d d7 be STA $bed7 ; (softscroll + 4)
417d : a9 00 __ LDA #$00
417f : 85 1c __ STA ACCU + 1 
4181 : bd f7 82 LDA $82f7,x ; (screenset + 2)
4184 : 20 e3 7c JSR $7ce3 ; (mul16by8 + 0)
4187 : a5 05 __ LDA WORK + 2 
4189 : 85 59 __ STA T4 + 0 
418b : 0a __ __ ASL
418c : aa __ __ TAX
418d : a5 06 __ LDA WORK + 3 
418f : 85 5a __ STA T4 + 1 
4191 : 2a __ __ ROL
4192 : a8 __ __ TAY
4193 : 8a __ __ TXA
4194 : 18 __ __ CLC
4195 : 69 30 __ ADC #$30
4197 : 85 5b __ STA T5 + 0 
4199 : 90 01 __ BCC $419c ; (main.s2177 + 0)
.s2176:
419b : c8 __ __ INY
.s2177:
419c : 84 5c __ STY T5 + 1 
419e : a9 20 __ LDA #$20
41a0 : c5 5c __ CMP T5 + 1 
41a2 : d0 04 __ BNE $41a8 ; (main.s1193 + 0)
.s1192:
41a4 : a9 00 __ LDA #$00
41a6 : c5 5b __ CMP T5 + 0 
.s1193:
41a8 : b0 08 __ BCS $41b2 ; (main.s3218 + 0)
.s3219:
41aa : ad 27 83 LDA $8327 ; (vdc_state + 1)
41ad : d0 03 __ BNE $41b2 ; (main.s3218 + 0)
41af : 4c 38 30 JMP $3038 ; (main.s1299 + 0)
.s3218:
41b2 : a9 e0 __ LDA #$e0
41b4 : c5 5c __ CMP T5 + 1 
41b6 : d0 04 __ BNE $41bc ; (main.s1191 + 0)
.s1190:
41b8 : a9 00 __ LDA #$00
41ba : c5 5b __ CMP T5 + 0 
.s1191:
41bc : b0 03 __ BCS $41c1 ; (main.s3217 + 0)
41be : 4c 38 30 JMP $3038 ; (main.s1299 + 0)
.s3217:
41c1 : ad 28 83 LDA $8328 ; (vdc_state + 2)
41c4 : 85 13 __ STA P6 
41c6 : 20 fd 58 JSR $58fd ; (vdc_set_mode.s0 + 0)
41c9 : a9 00 __ LDA #$00
41cb : 85 55 __ STA T1 + 0 
41cd : 8d 2e 83 STA $832e ; (vdc_state + 8)
41d0 : 8d 36 83 STA $8336 ; (vdc_state + 16)
41d3 : 8d 37 83 STA $8337 ; (vdc_state + 17)
41d6 : 8d 38 83 STA $8338 ; (vdc_state + 18)
41d9 : a9 20 __ LDA #$20
41db : 8d 2f 83 STA $832f ; (vdc_state + 9)
41de : a9 10 __ LDA #$10
41e0 : 8d 39 83 STA $8339 ; (vdc_state + 19)
41e3 : 18 __ __ CLC
41e4 : a5 5a __ LDA T4 + 1 
41e6 : 69 20 __ ADC #$20
41e8 : 8d 31 83 STA $8331 ; (vdc_state + 11)
41eb : a5 59 __ LDA T4 + 0 
41ed : 8d 30 83 STA $8330 ; (vdc_state + 10)
41f0 : ad 29 83 LDA $8329 ; (vdc_state + 3)
41f3 : 85 53 __ STA T0 + 0 
41f5 : 49 ff __ EOR #$ff
41f7 : 38 __ __ SEC
41f8 : 65 57 __ ADC T3 + 0 
41fa : 8d 3e 83 STA $833e ; (vdc_state + 24)
41fd : 20 42 5d JSR $5d42 ; (vdc_set_multab.s0 + 0)
4200 : ad 2b 83 LDA $832b ; (vdc_state + 5)
4203 : 85 57 __ STA T3 + 0 
.l3223:
4205 : a5 55 __ LDA T1 + 0 
4207 : c5 57 __ CMP T3 + 0 
4209 : b0 03 __ BCS $420e ; (main.s3221 + 0)
420b : 4c c7 47 JMP $47c7 ; (main.s3224 + 0)
.s3221:
420e : a9 1c __ LDA #$1c
4210 : 8d 00 d6 STA $d600 
.l20137:
4213 : 2c 00 d6 BIT $d600 
4216 : 10 fb __ BPL $4213 ; (main.l20137 + 0)
.s3300:
4218 : ad 01 d6 LDA $d601 
421b : 29 10 __ AND #$10
421d : 4d 37 83 EOR $8337 ; (vdc_state + 17)
4220 : 29 1f __ AND #$1f
4222 : 4d 37 83 EOR $8337 ; (vdc_state + 17)
4225 : a2 1c __ LDX #$1c
4227 : 8e 00 d6 STX $d600 
.l20139:
422a : 2c 00 d6 BIT $d600 
422d : 10 fb __ BPL $422a ; (main.l20139 + 0)
.s3306:
422f : 8d 01 d6 STA $d601 
4232 : 20 9d 5d JSR $5d9d ; (vdc_restore_charsets.s0 + 0)
4235 : ad 2e 83 LDA $832e ; (vdc_state + 8)
4238 : 85 0d __ STA P0 
423a : ad 30 83 LDA $8330 ; (vdc_state + 10)
423d : 85 57 __ STA T3 + 0 
423f : ad 31 83 LDA $8331 ; (vdc_state + 11)
4242 : 85 58 __ STA T3 + 1 
4244 : a9 0c __ LDA #$0c
4246 : 8d 00 d6 STA $d600 
4249 : ae 2f 83 LDX $832f ; (vdc_state + 9)
424c : 86 0e __ STX P1 
.l20141:
424e : 2c 00 d6 BIT $d600 
4251 : 10 fb __ BPL $424e ; (main.l20141 + 0)
.s3312:
4253 : 8e 01 d6 STX $d601 
4256 : a9 0d __ LDA #$0d
4258 : 8d 00 d6 STA $d600 
.l20143:
425b : 2c 00 d6 BIT $d600 
425e : 10 fb __ BPL $425b ; (main.l20143 + 0)
.s3317:
4260 : a5 0d __ LDA P0 
4262 : 8d 01 d6 STA $d601 
4265 : a9 14 __ LDA #$14
4267 : 8d 00 d6 STA $d600 
.l20145:
426a : 2c 00 d6 BIT $d600 
426d : 10 fb __ BPL $426a ; (main.l20145 + 0)
.s3322:
426f : a5 58 __ LDA T3 + 1 
4271 : 8d 01 d6 STA $d601 
4274 : a9 15 __ LDA #$15
4276 : 8d 00 d6 STA $d600 
.l20147:
4279 : 2c 00 d6 BIT $d600 
427c : 10 fb __ BPL $4279 ; (main.l20147 + 0)
.s3327:
427e : a5 57 __ LDA T3 + 0 
4280 : 8d 01 d6 STA $d601 
4283 : a9 1b __ LDA #$1b
4285 : 8d 00 d6 STA $d600 
4288 : ae 3e 83 LDX $833e ; (vdc_state + 24)
.l20149:
428b : 2c 00 d6 BIT $d600 
428e : 10 fb __ BPL $428b ; (main.l20149 + 0)
.s3332:
4290 : 8e 01 d6 STX $d601 
4293 : a5 59 __ LDA T4 + 0 
4295 : 85 12 __ STA P5 
4297 : a5 5a __ LDA T4 + 1 
4299 : 85 13 __ STA P6 
429b : ad d3 be LDA $bed3 ; (softscroll + 0)
429e : 85 0f __ STA P2 
42a0 : ad d4 be LDA $bed4 ; (softscroll + 1)
42a3 : 85 53 __ STA T0 + 0 
42a5 : 85 10 __ STA P3 
42a7 : ad d5 be LDA $bed5 ; (softscroll + 2)
42aa : 85 54 __ STA T0 + 1 
42ac : 85 11 __ STA P4 
42ae : 20 53 14 JSR $1453 ; (bnk_cpytovdc.s0 + 0)
42b1 : a5 57 __ LDA T3 + 0 
42b3 : 85 0d __ STA P0 
42b5 : a5 58 __ LDA T3 + 1 
42b7 : 85 0e __ STA P1 
42b9 : 18 __ __ CLC
42ba : a5 53 __ LDA T0 + 0 
42bc : 65 12 __ ADC P5 
42be : aa __ __ TAX
42bf : a5 5a __ LDA T4 + 1 
42c1 : 85 13 __ STA P6 
42c3 : 65 54 __ ADC T0 + 1 
42c5 : a8 __ __ TAY
42c6 : 8a __ __ TXA
42c7 : 18 __ __ CLC
42c8 : 69 30 __ ADC #$30
42ca : 85 10 __ STA P3 
42cc : 90 01 __ BCC $42cf ; (main.s2179 + 0)
.s2178:
42ce : c8 __ __ INY
.s2179:
42cf : 84 11 __ STY P4 
42d1 : 20 53 14 JSR $1453 ; (bnk_cpytovdc.s0 + 0)
42d4 : a9 00 __ LDA #$00
42d6 : 8d d8 be STA $bed8 ; (softscroll + 5)
42d9 : 8d d9 be STA $bed9 ; (softscroll + 6)
42dc : 8d da be STA $beda ; (softscroll + 7)
42df : 8d db be STA $bedb ; (softscroll + 8)
42e2 : a9 18 __ LDA #$18
42e4 : 8d 00 d6 STA $d600 
.l20151:
42e7 : 2c 00 d6 BIT $d600 
42ea : 10 fb __ BPL $42e7 ; (main.l20151 + 0)
.s3337:
42ec : ad 01 d6 LDA $d601 
42ef : 29 f0 __ AND #$f0
42f1 : 8d dc be STA $bedc ; (softscroll + 9)
42f4 : a9 19 __ LDA #$19
42f6 : 8d 00 d6 STA $d600 
.l20153:
42f9 : 2c 00 d6 BIT $d600 
42fc : 10 fb __ BPL $42f9 ; (main.l20153 + 0)
.s3344:
42fe : ad 01 d6 LDA $d601 
4301 : 29 0f __ AND #$0f
4303 : 8d e0 be STA $bee0 ; (softscroll + 13)
4306 : a9 19 __ LDA #$19
4308 : 8d 00 d6 STA $d600 
.l20155:
430b : 2c 00 d6 BIT $d600 
430e : 10 fb __ BPL $430b ; (main.l20155 + 0)
.s3351:
4310 : a9 00 __ LDA #$00
4312 : 8d de be STA $bede ; (softscroll + 11)
4315 : 8d df be STA $bedf ; (softscroll + 12)
4318 : ad 01 d6 LDA $d601 
431b : 29 f0 __ AND #$f0
431d : 8d dd be STA $bedd ; (softscroll + 10)
.l3355:
4320 : 20 f0 56 JSR $56f0 ; (getch.s0 + 0)
4323 : 85 55 __ STA T1 + 0 
4325 : c9 57 __ CMP #$57
4327 : f0 04 __ BEQ $432d ; (main.l3357 + 0)
.s3360:
4329 : c9 91 __ CMP #$91
432b : d0 20 __ BNE $434d ; (main.s3359 + 0)
.l3357:
432d : ad 00 d6 LDA $d600 
4330 : 29 20 __ AND #$20
4332 : f0 f9 __ BEQ $432d ; (main.l3357 + 0)
.l3367:
4334 : ad 00 d6 LDA $d600 
4337 : 29 20 __ AND #$20
4339 : d0 f9 __ BNE $4334 ; (main.l3367 + 0)
.s3362:
433b : a9 01 __ LDA #$01
433d : cd da be CMP $beda ; (softscroll + 7)
4340 : b0 03 __ BCS $4345 ; (main.s3370 + 0)
4342 : 4c ae 47 JMP $47ae ; (main.s3369 + 0)
.s3370:
4345 : ad df be LDA $bedf ; (softscroll + 12)
4348 : f0 03 __ BEQ $434d ; (main.s3359 + 0)
434a : 4c 20 47 JMP $4720 ; (main.s3377 + 0)
.s3359:
434d : a5 55 __ LDA T1 + 0 
434f : c9 53 __ CMP #$53
4351 : f0 04 __ BEQ $4357 ; (main.l3409 + 0)
.s3412:
4353 : c9 11 __ CMP #$11
4355 : d0 33 __ BNE $438a ; (main.s3411 + 0)
.l3409:
4357 : ad 00 d6 LDA $d600 
435a : 29 20 __ AND #$20
435c : f0 f9 __ BEQ $4357 ; (main.l3409 + 0)
.l3419:
435e : ad 00 d6 LDA $d600 
4361 : 29 20 __ AND #$20
4363 : d0 f9 __ BNE $435e ; (main.l3419 + 0)
.s3414:
4365 : ad da be LDA $beda ; (softscroll + 7)
4368 : 85 56 __ STA T2 + 0 
436a : 18 __ __ CLC
436b : 69 02 __ ADC #$02
436d : 8d da be STA $beda ; (softscroll + 7)
4370 : c9 07 __ CMP #$07
4372 : 90 03 __ BCC $4377 ; (main.s3422 + 0)
4374 : 4c 7a 46 JMP $467a ; (main.s3421 + 0)
.s3422:
4377 : a9 18 __ LDA #$18
4379 : 8d 00 d6 STA $d600 
437c : ad dc be LDA $bedc ; (softscroll + 9)
437f : 6d da be ADC $beda ; (softscroll + 7)
.l20254:
4382 : 2c 00 d6 BIT $d600 
4385 : 10 fb __ BPL $4382 ; (main.l20254 + 0)
.s2168:
4387 : 8d 01 d6 STA $d601 
.s3411:
438a : a5 55 __ LDA T1 + 0 
438c : c9 41 __ CMP #$41
438e : f0 04 __ BEQ $4394 ; (main.s3458 + 0)
.s3461:
4390 : c9 9d __ CMP #$9d
4392 : d0 3e __ BNE $43d2 ; (main.s3460 + 0)
.s3458:
4394 : ad db be LDA $bedb ; (softscroll + 8)
4397 : 18 __ __ CLC
4398 : 69 02 __ ADC #$02
439a : 8d db be STA $bedb ; (softscroll + 8)
439d : c9 07 __ CMP #$07
439f : b0 0e __ BCS $43af ; (main.s3463 + 0)
.s3464:
43a1 : a9 19 __ LDA #$19
43a3 : 8d 00 d6 STA $d600 
43a6 : ad dd be LDA $bedd ; (softscroll + 10)
43a9 : 6d db be ADC $bedb ; (softscroll + 8)
43ac : 4c c9 43 JMP $43c9 ; (main.s2169 + 0)
.s3463:
43af : ad de be LDA $bede ; (softscroll + 11)
43b2 : f0 03 __ BEQ $43b7 ; (main.s3467 + 0)
43b4 : 4c ea 45 JMP $45ea ; (main.s3466 + 0)
.s3467:
43b7 : ad e0 be LDA $bee0 ; (softscroll + 13)
43ba : 8d db be STA $bedb ; (softscroll + 8)
43bd : a9 19 __ LDA #$19
43bf : 8d 00 d6 STA $d600 
43c2 : ad dd be LDA $bedd ; (softscroll + 10)
43c5 : 18 __ __ CLC
43c6 : 6d e0 be ADC $bee0 ; (softscroll + 13)
.s2169:
43c9 : aa __ __ TAX
.l20192:
43ca : 2c 00 d6 BIT $d600 
43cd : 10 fb __ BPL $43ca ; (main.l20192 + 0)
.s29655:
43cf : 8e 01 d6 STX $d601 
.s3460:
43d2 : a5 55 __ LDA T1 + 0 
43d4 : c9 44 __ CMP #$44
43d6 : f0 04 __ BEQ $43dc ; (main.s3515 + 0)
.s3518:
43d8 : c9 1d __ CMP #$1d
43da : d0 2f __ BNE $440b ; (main.s3517 + 0)
.s3515:
43dc : a9 01 __ LDA #$01
43de : cd db be CMP $bedb ; (softscroll + 8)
43e1 : b0 03 __ BCS $43e6 ; (main.s3521 + 0)
43e3 : 4c dd 45 JMP $45dd ; (main.s3520 + 0)
.s3521:
43e6 : ad d6 be LDA $bed6 ; (softscroll + 3)
43e9 : ed 29 83 SBC $8329 ; (vdc_state + 3)
43ec : aa __ __ TAX
43ed : a9 00 __ LDA #$00
43ef : ed 2a 83 SBC $832a ; (vdc_state + 4)
43f2 : a8 __ __ TAY
43f3 : 8a __ __ TXA
43f4 : 38 __ __ SEC
43f5 : e9 01 __ SBC #$01
43f7 : 85 53 __ STA T0 + 0 
43f9 : 98 __ __ TYA
43fa : e9 00 __ SBC #$00
43fc : f0 03 __ BEQ $4401 ; (main.s1076 + 0)
43fe : 4c 42 45 JMP $4542 ; (main.s3531 + 0)
.s1076:
4401 : ad de be LDA $bede ; (softscroll + 11)
4404 : c5 53 __ CMP T0 + 0 
4406 : b0 03 __ BCS $440b ; (main.s3517 + 0)
4408 : 4c 42 45 JMP $4542 ; (main.s3531 + 0)
.s3517:
440b : a5 55 __ LDA T1 + 0 
440d : c9 1b __ CMP #$1b
440f : f0 07 __ BEQ $4418 ; (main.s3356 + 0)
.s3566:
4411 : c9 03 __ CMP #$03
4413 : f0 03 __ BEQ $4418 ; (main.s3356 + 0)
4415 : 4c 20 43 JMP $4320 ; (main.l3355 + 0)
.s3356:
4418 : a9 00 __ LDA #$00
441a : 85 55 __ STA T1 + 0 
441c : ad 28 83 LDA $8328 ; (vdc_state + 2)
441f : 85 56 __ STA T2 + 0 
4421 : ad 29 83 LDA $8329 ; (vdc_state + 3)
4424 : 85 53 __ STA T0 + 0 
4426 : ad 2b 83 LDA $832b ; (vdc_state + 5)
4429 : 85 57 __ STA T3 + 0 
.l3570:
442b : a5 55 __ LDA T1 + 0 
442d : c5 57 __ CMP T3 + 0 
442f : 90 3d __ BCC $446e ; (main.s3571 + 0)
.s3568:
4431 : a9 1b __ LDA #$1b
4433 : 8d 00 d6 STA $d600 
.l20224:
4436 : 2c 00 d6 BIT $d600 
4439 : 10 fb __ BPL $4436 ; (main.l20224 + 0)
.s3645:
443b : a9 00 __ LDA #$00
443d : 8d 01 d6 STA $d601 
4440 : a9 18 __ LDA #$18
4442 : 8d 00 d6 STA $d600 
4445 : ae dc be LDX $bedc ; (softscroll + 9)
.l20226:
4448 : 2c 00 d6 BIT $d600 
444b : 10 fb __ BPL $4448 ; (main.l20226 + 0)
.s3650:
444d : 8e 01 d6 STX $d601 
4450 : a9 19 __ LDA #$19
4452 : 8d 00 d6 STA $d600 
4455 : ad e0 be LDA $bee0 ; (softscroll + 13)
4458 : 18 __ __ CLC
4459 : 6d dd be ADC $bedd ; (softscroll + 10)
.l20228:
445c : 2c 00 d6 BIT $d600 
445f : 10 fb __ BPL $445c ; (main.l20228 + 0)
.s3655:
4461 : 8d 01 d6 STA $d601 
4464 : a5 56 __ LDA T2 + 0 
4466 : 85 13 __ STA P6 
4468 : 20 fd 58 JSR $58fd ; (vdc_set_mode.s0 + 0)
446b : 4c 08 24 JMP $2408 ; (main.l630 + 0)
.s3571:
446e : a9 00 __ LDA #$00
4470 : 85 0d __ STA P0 
4472 : a5 55 __ LDA T1 + 0 
4474 : 85 0e __ STA P1 
4476 : ad 2d 83 LDA $832d ; (vdc_state + 7)
4479 : 85 61 __ STA T8 + 0 
447b : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
447e : a9 12 __ LDA #$12
4480 : 8d 00 d6 STA $d600 
4483 : 18 __ __ CLC
4484 : a5 1b __ LDA ACCU + 0 
4486 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
4489 : a8 __ __ TAY
448a : a5 1c __ LDA ACCU + 1 
448c : 6d 2f 83 ADC $832f ; (vdc_state + 9)
448f : a6 53 __ LDX T0 + 0 
4491 : ca __ __ DEX
.l20200:
4492 : 2c 00 d6 BIT $d600 
4495 : 10 fb __ BPL $4492 ; (main.l20200 + 0)
.s3581:
4497 : 8d 01 d6 STA $d601 
449a : a9 13 __ LDA #$13
449c : 8d 00 d6 STA $d600 
.l20202:
449f : 2c 00 d6 BIT $d600 
44a2 : 10 fb __ BPL $449f ; (main.l20202 + 0)
.s3586:
44a4 : 8c 01 d6 STY $d601 
44a7 : a9 1f __ LDA #$1f
44a9 : 8d 00 d6 STA $d600 
.l20204:
44ac : 2c 00 d6 BIT $d600 
44af : 10 fb __ BPL $44ac ; (main.l20204 + 0)
.s3590:
44b1 : a9 20 __ LDA #$20
44b3 : 8d 01 d6 STA $d601 
44b6 : a9 18 __ LDA #$18
44b8 : 8d 00 d6 STA $d600 
.l20206:
44bb : 2c 00 d6 BIT $d600 
44be : 10 fb __ BPL $44bb ; (main.l20206 + 0)
.s3596:
44c0 : ad 01 d6 LDA $d601 
44c3 : 29 7f __ AND #$7f
44c5 : a0 18 __ LDY #$18
44c7 : 8c 00 d6 STY $d600 
.l20208:
44ca : 2c 00 d6 BIT $d600 
44cd : 10 fb __ BPL $44ca ; (main.l20208 + 0)
.s3602:
44cf : 8d 01 d6 STA $d601 
44d2 : a9 1e __ LDA #$1e
44d4 : 8d 00 d6 STA $d600 
.l20210:
44d7 : 2c 00 d6 BIT $d600 
44da : 10 fb __ BPL $44d7 ; (main.l20210 + 0)
.s3607:
44dc : 8e 01 d6 STX $d601 
44df : ad 30 83 LDA $8330 ; (vdc_state + 10)
44e2 : 18 __ __ CLC
44e3 : 65 1b __ ADC ACCU + 0 
44e5 : a0 12 __ LDY #$12
44e7 : 8c 00 d6 STY $d600 
44ea : a8 __ __ TAY
44eb : ad 31 83 LDA $8331 ; (vdc_state + 11)
44ee : 65 1c __ ADC ACCU + 1 
.l20212:
44f0 : 2c 00 d6 BIT $d600 
44f3 : 10 fb __ BPL $44f0 ; (main.l20212 + 0)
.s3614:
44f5 : 8d 01 d6 STA $d601 
44f8 : a9 13 __ LDA #$13
44fa : 8d 00 d6 STA $d600 
.l20214:
44fd : 2c 00 d6 BIT $d600 
4500 : 10 fb __ BPL $44fd ; (main.l20214 + 0)
.s3619:
4502 : 8c 01 d6 STY $d601 
4505 : a9 1f __ LDA #$1f
4507 : 8d 00 d6 STA $d600 
.l20216:
450a : 2c 00 d6 BIT $d600 
450d : 10 fb __ BPL $450a ; (main.l20216 + 0)
.s3623:
450f : a5 61 __ LDA T8 + 0 
4511 : 8d 01 d6 STA $d601 
4514 : a9 18 __ LDA #$18
4516 : 8d 00 d6 STA $d600 
.l20218:
4519 : 2c 00 d6 BIT $d600 
451c : 10 fb __ BPL $4519 ; (main.l20218 + 0)
.s3629:
451e : ad 01 d6 LDA $d601 
4521 : 29 7f __ AND #$7f
4523 : a0 18 __ LDY #$18
4525 : 8c 00 d6 STY $d600 
.l20220:
4528 : 2c 00 d6 BIT $d600 
452b : 10 fb __ BPL $4528 ; (main.l20220 + 0)
.s3635:
452d : 8d 01 d6 STA $d601 
4530 : a9 1e __ LDA #$1e
4532 : 8d 00 d6 STA $d600 
.l20222:
4535 : 2c 00 d6 BIT $d600 
4538 : 10 fb __ BPL $4535 ; (main.l20222 + 0)
.s3640:
453a : 8e 01 d6 STX $d601 
453d : e6 55 __ INC T1 + 0 
453f : 4c 2b 44 JMP $442b ; (main.l3570 + 0)
.s3531:
4542 : ad e0 be LDA $bee0 ; (softscroll + 13)
4545 : 29 01 __ AND #$01
4547 : 09 06 __ ORA #$06
4549 : 8d db be STA $bedb ; (softscroll + 8)
454c : ee de be INC $bede ; (softscroll + 11)
454f : aa __ __ TAX
4550 : ad d8 be LDA $bed8 ; (softscroll + 5)
4553 : 18 __ __ CLC
4554 : 69 01 __ ADC #$01
4556 : 85 57 __ STA T3 + 0 
4558 : 8d d8 be STA $bed8 ; (softscroll + 5)
455b : ad d9 be LDA $bed9 ; (softscroll + 6)
455e : 69 00 __ ADC #$00
4560 : 85 58 __ STA T3 + 1 
4562 : 8d d9 be STA $bed9 ; (softscroll + 6)
.l20232:
4565 : ad 00 d6 LDA $d600 
4568 : 29 20 __ AND #$20
456a : d0 f9 __ BNE $4565 ; (main.l20232 + 0)
.s3534:
456c : ad 30 83 LDA $8330 ; (vdc_state + 10)
456f : 18 __ __ CLC
4570 : 65 57 __ ADC T3 + 0 
4572 : a8 __ __ TAY
4573 : ad 31 83 LDA $8331 ; (vdc_state + 11)
4576 : 65 58 __ ADC T3 + 1 
4578 : 85 5a __ STA T4 + 1 
457a : ad 2e 83 LDA $832e ; (vdc_state + 8)
457d : 18 __ __ CLC
457e : 65 57 __ ADC T3 + 0 
4580 : 85 57 __ STA T3 + 0 
4582 : a9 0c __ LDA #$0c
4584 : 8d 00 d6 STA $d600 
4587 : ad 2f 83 LDA $832f ; (vdc_state + 9)
458a : 65 58 __ ADC T3 + 1 
.l20234:
458c : 2c 00 d6 BIT $d600 
458f : 10 fb __ BPL $458c ; (main.l20234 + 0)
.s3542:
4591 : 8d 01 d6 STA $d601 
4594 : a9 0d __ LDA #$0d
4596 : 8d 00 d6 STA $d600 
.l20236:
4599 : 2c 00 d6 BIT $d600 
459c : 10 fb __ BPL $4599 ; (main.l20236 + 0)
.s3547:
459e : a5 57 __ LDA T3 + 0 
45a0 : 8d 01 d6 STA $d601 
45a3 : a9 14 __ LDA #$14
45a5 : 8d 00 d6 STA $d600 
.l20238:
45a8 : 2c 00 d6 BIT $d600 
45ab : 10 fb __ BPL $45a8 ; (main.l20238 + 0)
.s3552:
45ad : a5 5a __ LDA T4 + 1 
45af : 8d 01 d6 STA $d601 
45b2 : a9 15 __ LDA #$15
45b4 : 8d 00 d6 STA $d600 
.l20240:
45b7 : 2c 00 d6 BIT $d600 
45ba : 10 fb __ BPL $45b7 ; (main.l20240 + 0)
.s3557:
45bc : 8c 01 d6 STY $d601 
.l20196:
45bf : ad 00 d6 LDA $d600 
45c2 : 29 20 __ AND #$20
45c4 : f0 f9 __ BEQ $45bf ; (main.l20196 + 0)
.s3523:
45c6 : a9 19 __ LDA #$19
45c8 : 8d 00 d6 STA $d600 
45cb : 8a __ __ TXA
45cc : 18 __ __ CLC
45cd : 6d dd be ADC $bedd ; (softscroll + 10)
.l20197:
45d0 : 2c 00 d6 BIT $d600 
45d3 : 10 fb __ BPL $45d0 ; (main.l20197 + 0)
.s29656:
45d5 : 8d 01 d6 STA $d601 
45d8 : a5 55 __ LDA T1 + 0 
45da : 4c 11 44 JMP $4411 ; (main.s3566 + 0)
.s3520:
45dd : ad db be LDA $bedb ; (softscroll + 8)
45e0 : 38 __ __ SEC
45e1 : e9 02 __ SBC #$02
45e3 : 8d db be STA $bedb ; (softscroll + 8)
45e6 : aa __ __ TAX
45e7 : 4c bf 45 JMP $45bf ; (main.l20196 + 0)
.s3466:
45ea : ad e0 be LDA $bee0 ; (softscroll + 13)
45ed : 29 01 __ AND #$01
45ef : 8d db be STA $bedb ; (softscroll + 8)
45f2 : ce de be DEC $bede ; (softscroll + 11)
45f5 : ad d8 be LDA $bed8 ; (softscroll + 5)
45f8 : 18 __ __ CLC
45f9 : 69 ff __ ADC #$ff
45fb : 85 53 __ STA T0 + 0 
45fd : 8d d8 be STA $bed8 ; (softscroll + 5)
4600 : ad d9 be LDA $bed9 ; (softscroll + 6)
4603 : 69 ff __ ADC #$ff
4605 : 85 54 __ STA T0 + 1 
4607 : 8d d9 be STA $bed9 ; (softscroll + 6)
.l20180:
460a : ad 00 d6 LDA $d600 
460d : 29 20 __ AND #$20
460f : d0 f9 __ BNE $460a ; (main.l20180 + 0)
.s3469:
4611 : ad 30 83 LDA $8330 ; (vdc_state + 10)
4614 : 18 __ __ CLC
4615 : 65 53 __ ADC T0 + 0 
4617 : aa __ __ TAX
4618 : ad 31 83 LDA $8331 ; (vdc_state + 11)
461b : 65 54 __ ADC T0 + 1 
461d : a8 __ __ TAY
461e : ad 2e 83 LDA $832e ; (vdc_state + 8)
4621 : 18 __ __ CLC
4622 : 65 53 __ ADC T0 + 0 
4624 : 85 53 __ STA T0 + 0 
4626 : a9 0c __ LDA #$0c
4628 : 8d 00 d6 STA $d600 
462b : ad 2f 83 LDA $832f ; (vdc_state + 9)
462e : 65 54 __ ADC T0 + 1 
.l20182:
4630 : 2c 00 d6 BIT $d600 
4633 : 10 fb __ BPL $4630 ; (main.l20182 + 0)
.s3477:
4635 : 8d 01 d6 STA $d601 
4638 : a9 0d __ LDA #$0d
463a : 8d 00 d6 STA $d600 
.l20184:
463d : 2c 00 d6 BIT $d600 
4640 : 10 fb __ BPL $463d ; (main.l20184 + 0)
.s3482:
4642 : a5 53 __ LDA T0 + 0 
4644 : 8d 01 d6 STA $d601 
4647 : a9 14 __ LDA #$14
4649 : 8d 00 d6 STA $d600 
.l20186:
464c : 2c 00 d6 BIT $d600 
464f : 10 fb __ BPL $464c ; (main.l20186 + 0)
.s3487:
4651 : 8c 01 d6 STY $d601 
4654 : a9 15 __ LDA #$15
4656 : 8d 00 d6 STA $d600 
.l20188:
4659 : 2c 00 d6 BIT $d600 
465c : 10 fb __ BPL $4659 ; (main.l20188 + 0)
.s3492:
465e : 8e 01 d6 STX $d601 
.l20190:
4661 : ad 00 d6 LDA $d600 
4664 : 29 20 __ AND #$20
4666 : f0 f9 __ BEQ $4661 ; (main.l20190 + 0)
.l3498:
4668 : ad 00 d6 LDA $d600 
466b : 29 20 __ AND #$20
466d : d0 f9 __ BNE $4668 ; (main.l3498 + 0)
.s3493:
466f : a9 19 __ LDA #$19
4671 : 8d 00 d6 STA $d600 
4674 : ae dd be LDX $bedd ; (softscroll + 10)
4677 : 4c ca 43 JMP $43ca ; (main.l20192 + 0)
.s3421:
467a : ad d7 be LDA $bed7 ; (softscroll + 4)
467d : ed 2b 83 SBC $832b ; (vdc_state + 5)
4680 : aa __ __ TAX
4681 : a9 00 __ LDA #$00
4683 : ed 2c 83 SBC $832c ; (vdc_state + 6)
4686 : a8 __ __ TAY
4687 : 8a __ __ TXA
4688 : 38 __ __ SEC
4689 : e9 01 __ SBC #$01
468b : 85 53 __ STA T0 + 0 
468d : 98 __ __ TYA
468e : e9 00 __ SBC #$00
4690 : d0 0f __ BNE $46a1 ; (main.s3424 + 0)
.s1118:
4692 : ad df be LDA $bedf ; (softscroll + 12)
4695 : c5 53 __ CMP T0 + 0 
4697 : 90 08 __ BCC $46a1 ; (main.s3424 + 0)
.s3425:
4699 : a5 56 __ LDA T2 + 0 
469b : 8d da be STA $beda ; (softscroll + 7)
469e : 4c 8a 43 JMP $438a ; (main.s3411 + 0)
.s3424:
46a1 : a9 00 __ LDA #$00
46a3 : 8d da be STA $beda ; (softscroll + 7)
46a6 : ee df be INC $bedf ; (softscroll + 12)
46a9 : ad d8 be LDA $bed8 ; (softscroll + 5)
46ac : 18 __ __ CLC
46ad : 6d d6 be ADC $bed6 ; (softscroll + 3)
46b0 : 85 53 __ STA T0 + 0 
46b2 : 8d d8 be STA $bed8 ; (softscroll + 5)
46b5 : ad d9 be LDA $bed9 ; (softscroll + 6)
46b8 : 69 00 __ ADC #$00
46ba : 85 54 __ STA T0 + 1 
46bc : 8d d9 be STA $bed9 ; (softscroll + 6)
46bf : a9 18 __ LDA #$18
46c1 : 8d 00 d6 STA $d600 
46c4 : ae dc be LDX $bedc ; (softscroll + 9)
.l20167:
46c7 : 2c 00 d6 BIT $d600 
46ca : 10 fb __ BPL $46c7 ; (main.l20167 + 0)
.s3431:
46cc : 8e 01 d6 STX $d601 
46cf : ad 30 83 LDA $8330 ; (vdc_state + 10)
46d2 : 18 __ __ CLC
46d3 : 65 53 __ ADC T0 + 0 
46d5 : aa __ __ TAX
46d6 : ad 31 83 LDA $8331 ; (vdc_state + 11)
46d9 : 65 54 __ ADC T0 + 1 
46db : a8 __ __ TAY
46dc : ad 2e 83 LDA $832e ; (vdc_state + 8)
46df : 18 __ __ CLC
46e0 : 65 53 __ ADC T0 + 0 
46e2 : 85 53 __ STA T0 + 0 
46e4 : a9 0c __ LDA #$0c
46e6 : 8d 00 d6 STA $d600 
46e9 : ad 2f 83 LDA $832f ; (vdc_state + 9)
46ec : 65 54 __ ADC T0 + 1 
.l20169:
46ee : 2c 00 d6 BIT $d600 
46f1 : 10 fb __ BPL $46ee ; (main.l20169 + 0)
.s3437:
46f3 : 8d 01 d6 STA $d601 
46f6 : a9 0d __ LDA #$0d
46f8 : 8d 00 d6 STA $d600 
.l20171:
46fb : 2c 00 d6 BIT $d600 
46fe : 10 fb __ BPL $46fb ; (main.l20171 + 0)
.s3442:
4700 : a5 53 __ LDA T0 + 0 
4702 : 8d 01 d6 STA $d601 
4705 : a9 14 __ LDA #$14
4707 : 8d 00 d6 STA $d600 
.l20173:
470a : 2c 00 d6 BIT $d600 
470d : 10 fb __ BPL $470a ; (main.l20173 + 0)
.s3447:
470f : 8c 01 d6 STY $d601 
4712 : a9 15 __ LDA #$15
4714 : 8d 00 d6 STA $d600 
.l20175:
4717 : 2c 00 d6 BIT $d600 
471a : 10 fb __ BPL $4717 ; (main.l20175 + 0)
.s3452:
471c : 8a __ __ TXA
471d : 4c 87 43 JMP $4387 ; (main.s2168 + 0)
.s3377:
4720 : a9 06 __ LDA #$06
4722 : 8d da be STA $beda ; (softscroll + 7)
4725 : ce df be DEC $bedf ; (softscroll + 12)
4728 : ad d8 be LDA $bed8 ; (softscroll + 5)
472b : 38 __ __ SEC
472c : ed d6 be SBC $bed6 ; (softscroll + 3)
472f : 85 53 __ STA T0 + 0 
4731 : 8d d8 be STA $bed8 ; (softscroll + 5)
4734 : ad d9 be LDA $bed9 ; (softscroll + 6)
4737 : e9 00 __ SBC #$00
4739 : 85 54 __ STA T0 + 1 
473b : 8d d9 be STA $bed9 ; (softscroll + 6)
.l20259:
473e : ad 00 d6 LDA $d600 
4741 : 29 20 __ AND #$20
4743 : d0 f9 __ BNE $473e ; (main.l20259 + 0)
.s3380:
4745 : a9 18 __ LDA #$18
4747 : 8d 00 d6 STA $d600 
474a : ad dc be LDA $bedc ; (softscroll + 9)
474d : 18 __ __ CLC
474e : 69 06 __ ADC #$06
.l20261:
4750 : 2c 00 d6 BIT $d600 
4753 : 10 fb __ BPL $4750 ; (main.l20261 + 0)
.s3387:
4755 : 8d 01 d6 STA $d601 
4758 : ad 30 83 LDA $8330 ; (vdc_state + 10)
475b : 18 __ __ CLC
475c : 65 53 __ ADC T0 + 0 
475e : aa __ __ TAX
475f : ad 31 83 LDA $8331 ; (vdc_state + 11)
4762 : 65 54 __ ADC T0 + 1 
4764 : a8 __ __ TAY
4765 : ad 2e 83 LDA $832e ; (vdc_state + 8)
4768 : 18 __ __ CLC
4769 : 65 53 __ ADC T0 + 0 
476b : 85 53 __ STA T0 + 0 
476d : a9 0c __ LDA #$0c
476f : 8d 00 d6 STA $d600 
4772 : ad 2f 83 LDA $832f ; (vdc_state + 9)
4775 : 65 54 __ ADC T0 + 1 
.l20263:
4777 : 2c 00 d6 BIT $d600 
477a : 10 fb __ BPL $4777 ; (main.l20263 + 0)
.s3393:
477c : 8d 01 d6 STA $d601 
477f : a9 0d __ LDA #$0d
4781 : 8d 00 d6 STA $d600 
.l20265:
4784 : 2c 00 d6 BIT $d600 
4787 : 10 fb __ BPL $4784 ; (main.l20265 + 0)
.s3398:
4789 : a5 53 __ LDA T0 + 0 
478b : 8d 01 d6 STA $d601 
478e : a9 14 __ LDA #$14
4790 : 8d 00 d6 STA $d600 
.l20267:
4793 : 2c 00 d6 BIT $d600 
4796 : 10 fb __ BPL $4793 ; (main.l20267 + 0)
.s3403:
4798 : 8c 01 d6 STY $d601 
479b : a9 15 __ LDA #$15
479d : 8d 00 d6 STA $d600 
.l20269:
47a0 : 2c 00 d6 BIT $d600 
47a3 : 10 fb __ BPL $47a0 ; (main.l20269 + 0)
.s3408:
47a5 : 8a __ __ TXA
.s2167:
47a6 : 8d 01 d6 STA $d601 
47a9 : a5 55 __ LDA T1 + 0 
47ab : 4c 53 43 JMP $4353 ; (main.s3412 + 0)
.s3369:
47ae : ce da be DEC $beda ; (softscroll + 7)
47b1 : ce da be DEC $beda ; (softscroll + 7)
47b4 : a9 18 __ LDA #$18
47b6 : 8d 00 d6 STA $d600 
47b9 : ad da be LDA $beda ; (softscroll + 7)
47bc : 6d dc be ADC $bedc ; (softscroll + 9)
.l20161:
47bf : 2c 00 d6 BIT $d600 
47c2 : 10 fb __ BPL $47bf ; (main.l20161 + 0)
47c4 : 4c a6 47 JMP $47a6 ; (main.s2167 + 0)
.s3224:
47c7 : a9 00 __ LDA #$00
47c9 : 85 0d __ STA P0 
47cb : a5 55 __ LDA T1 + 0 
47cd : 85 0e __ STA P1 
47cf : ad 2d 83 LDA $832d ; (vdc_state + 7)
47d2 : 85 56 __ STA T2 + 0 
47d4 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
47d7 : a9 12 __ LDA #$12
47d9 : 8d 00 d6 STA $d600 
47dc : 18 __ __ CLC
47dd : a5 1b __ LDA ACCU + 0 
47df : 6d 2e 83 ADC $832e ; (vdc_state + 8)
47e2 : a8 __ __ TAY
47e3 : a5 1c __ LDA ACCU + 1 
47e5 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
47e8 : a6 53 __ LDX T0 + 0 
47ea : ca __ __ DEX
.l20113:
47eb : 2c 00 d6 BIT $d600 
47ee : 10 fb __ BPL $47eb ; (main.l20113 + 0)
.s3234:
47f0 : 8d 01 d6 STA $d601 
47f3 : a9 13 __ LDA #$13
47f5 : 8d 00 d6 STA $d600 
.l20115:
47f8 : 2c 00 d6 BIT $d600 
47fb : 10 fb __ BPL $47f8 ; (main.l20115 + 0)
.s3239:
47fd : 8c 01 d6 STY $d601 
4800 : a9 1f __ LDA #$1f
4802 : 8d 00 d6 STA $d600 
.l20117:
4805 : 2c 00 d6 BIT $d600 
4808 : 10 fb __ BPL $4805 ; (main.l20117 + 0)
.s3243:
480a : a9 20 __ LDA #$20
480c : 8d 01 d6 STA $d601 
480f : a9 18 __ LDA #$18
4811 : 8d 00 d6 STA $d600 
.l20119:
4814 : 2c 00 d6 BIT $d600 
4817 : 10 fb __ BPL $4814 ; (main.l20119 + 0)
.s3249:
4819 : ad 01 d6 LDA $d601 
481c : 29 7f __ AND #$7f
481e : a0 18 __ LDY #$18
4820 : 8c 00 d6 STY $d600 
.l20121:
4823 : 2c 00 d6 BIT $d600 
4826 : 10 fb __ BPL $4823 ; (main.l20121 + 0)
.s3255:
4828 : 8d 01 d6 STA $d601 
482b : a9 1e __ LDA #$1e
482d : 8d 00 d6 STA $d600 
.l20123:
4830 : 2c 00 d6 BIT $d600 
4833 : 10 fb __ BPL $4830 ; (main.l20123 + 0)
.s3260:
4835 : 8e 01 d6 STX $d601 
4838 : ad 30 83 LDA $8330 ; (vdc_state + 10)
483b : 18 __ __ CLC
483c : 65 1b __ ADC ACCU + 0 
483e : a0 12 __ LDY #$12
4840 : 8c 00 d6 STY $d600 
4843 : a8 __ __ TAY
4844 : ad 31 83 LDA $8331 ; (vdc_state + 11)
4847 : 65 1c __ ADC ACCU + 1 
.l20125:
4849 : 2c 00 d6 BIT $d600 
484c : 10 fb __ BPL $4849 ; (main.l20125 + 0)
.s3267:
484e : 8d 01 d6 STA $d601 
4851 : a9 13 __ LDA #$13
4853 : 8d 00 d6 STA $d600 
.l20127:
4856 : 2c 00 d6 BIT $d600 
4859 : 10 fb __ BPL $4856 ; (main.l20127 + 0)
.s3272:
485b : 8c 01 d6 STY $d601 
485e : a9 1f __ LDA #$1f
4860 : 8d 00 d6 STA $d600 
.l20129:
4863 : 2c 00 d6 BIT $d600 
4866 : 10 fb __ BPL $4863 ; (main.l20129 + 0)
.s3276:
4868 : a5 56 __ LDA T2 + 0 
486a : 8d 01 d6 STA $d601 
486d : a9 18 __ LDA #$18
486f : 8d 00 d6 STA $d600 
.l20131:
4872 : 2c 00 d6 BIT $d600 
4875 : 10 fb __ BPL $4872 ; (main.l20131 + 0)
.s3282:
4877 : ad 01 d6 LDA $d601 
487a : 29 7f __ AND #$7f
487c : a0 18 __ LDY #$18
487e : 8c 00 d6 STY $d600 
.l20133:
4881 : 2c 00 d6 BIT $d600 
4884 : 10 fb __ BPL $4881 ; (main.l20133 + 0)
.s3288:
4886 : 8d 01 d6 STA $d601 
4889 : a9 1e __ LDA #$1e
488b : 8d 00 d6 STA $d600 
.l20135:
488e : 2c 00 d6 BIT $d600 
4891 : 10 fb __ BPL $488e ; (main.l20135 + 0)
.s3293:
4893 : 8e 01 d6 STX $d601 
4896 : e6 55 __ INC T1 + 0 
4898 : 4c 05 42 JMP $4205 ; (main.l3223 + 0)
.s3661:
489b : c9 0b __ CMP #$0b
489d : d0 03 __ BNE $48a2 ; (main.s3662 + 0)
489f : 4c c6 4b JMP $4bc6 ; (main.s1300 + 0)
.s3662:
48a2 : c9 15 __ CMP #$15
48a4 : f0 03 __ BEQ $48a9 ; (main.s1359 + 0)
48a6 : 4c 38 30 JMP $3038 ; (main.s1299 + 0)
.s1359:
48a9 : ad 08 dc LDA $dc08 
48ac : 18 __ __ CLC
48ad : 6d 09 dc ADC $dc09 
48b0 : aa __ __ TAX
48b1 : a9 00 __ LDA #$00
48b3 : 85 55 __ STA T1 + 0 
48b5 : 2a __ __ ROL
48b6 : a8 __ __ TAY
48b7 : 8a __ __ TXA
48b8 : 69 01 __ ADC #$01
48ba : 8d db 7e STA $7edb ; (seed + 0)
48bd : 90 01 __ BCC $48c0 ; (main.s2175 + 0)
.s2174:
48bf : c8 __ __ INY
.s2175:
48c0 : 8c dc 7e STY $7edc ; (seed + 1)
.l1362:
48c3 : a9 28 __ LDA #$28
48c5 : 85 18 __ STA P11 
48c7 : a5 55 __ LDA T1 + 0 
48c9 : 29 01 __ AND #$01
48cb : 09 f0 __ ORA #$f0
48cd : 85 15 __ STA P8 
48cf : a5 55 __ LDA T1 + 0 
48d1 : 0a __ __ ASL
48d2 : 0a __ __ ASL
48d3 : 18 __ __ CLC
48d4 : 65 55 __ ADC T1 + 0 
48d6 : 18 __ __ CLC
48d7 : 69 05 __ ADC #$05
48d9 : 85 16 __ STA P9 
48db : a5 55 __ LDA T1 + 0 
48dd : 0a __ __ ASL
48de : 18 __ __ CLC
48df : 65 55 __ ADC T1 + 0 
48e1 : 18 __ __ CLC
48e2 : 69 05 __ ADC #$05
48e4 : 85 17 __ STA P10 
48e6 : ad 2b 83 LDA $832b ; (vdc_state + 5)
48e9 : 85 1b __ STA ACCU + 0 
48eb : ad 2c 83 LDA $832c ; (vdc_state + 6)
48ee : 85 1c __ STA ACCU + 1 
48f0 : a9 03 __ LDA #$03
48f2 : 85 03 __ STA WORK + 0 
48f4 : a9 00 __ LDA #$00
48f6 : 85 04 __ STA WORK + 1 
48f8 : 20 45 7d JSR $7d45 ; (divmod + 0)
48fb : a5 1b __ LDA ACCU + 0 
48fd : 8d f8 bf STA $bff8 ; (sstack + 0)
4900 : 20 9e 61 JSR $619e ; (vdcwin_win_new.s1000 + 0)
4903 : a9 64 __ LDA #$64
4905 : 85 56 __ STA T2 + 0 
.l1365:
4907 : 20 db 74 JSR $74db ; (rand.s0 + 0)
490a : a9 00 __ LDA #$00
490c : 8d fd bf STA $bffd ; (sstack + 5)
490f : a9 84 __ LDA #$84
4911 : 8d fe bf STA $bffe ; (sstack + 6)
4914 : ad 2d 83 LDA $832d ; (vdc_state + 7)
4917 : 29 f0 __ AND #$f0
4919 : 85 59 __ STA T4 + 0 
491b : a9 0f __ LDA #$0f
491d : 85 03 __ STA WORK + 0 
491f : a9 00 __ LDA #$00
4921 : 85 04 __ STA WORK + 1 
4923 : 20 45 7d JSR $7d45 ; (divmod + 0)
4926 : a5 05 __ LDA WORK + 2 
4928 : 38 __ __ SEC
4929 : 65 59 __ ADC T4 + 0 
492b : 8d 2d 83 STA $832d ; (vdc_state + 7)
492e : 20 02 75 JSR $7502 ; (generateSentence.s1000 + 0)
4931 : a9 00 __ LDA #$00
4933 : 85 13 __ STA P6 
4935 : a9 84 __ LDA #$84
4937 : 85 14 __ STA P7 
4939 : ad 23 83 LDA $8323 ; (winCfg + 5)
493c : 85 1b __ STA ACCU + 0 
493e : a9 00 __ LDA #$00
4940 : 85 1c __ STA ACCU + 1 
4942 : a9 0d __ LDA #$0d
4944 : 20 e3 7c JSR $7ce3 ; (mul16by8 + 0)
4947 : 18 __ __ CLC
4948 : a9 47 __ LDA #$47
494a : 65 05 __ ADC WORK + 2 
494c : 85 11 __ STA P4 
494e : a9 84 __ LDA #$84
4950 : 69 00 __ ADC #$00
4952 : 85 12 __ STA P5 
4954 : 20 2f 76 JSR $762f ; (vdcwin_printwrap.s1000 + 0)
4957 : ac 23 83 LDY $8323 ; (winCfg + 5)
495a : be fc 6b LDX $6bfc,y ; (__multab13L + 0)
495d : bd 4b 84 LDA $844b,x ; (linebuffer + 75)
4960 : f0 03 __ BEQ $4965 ; (main.s13412 + 0)
4962 : 4c e5 4a JMP $4ae5 ; (main.s1369 + 0)
.s13412:
4965 : c6 56 __ DEC T2 + 0 
4967 : d0 9e __ BNE $4907 ; (main.l1365 + 0)
.s1367:
4969 : 20 f0 56 JSR $56f0 ; (getch.s0 + 0)
496c : ad 2d 83 LDA $832d ; (vdc_state + 7)
496f : 29 f0 __ AND #$f0
4971 : 09 0d __ ORA #$0d
4973 : 8d 2d 83 STA $832d ; (vdc_state + 7)
4976 : e6 55 __ INC T1 + 0 
4978 : ad 23 83 LDA $8323 ; (winCfg + 5)
497b : c9 03 __ CMP #$03
497d : b0 03 __ BCS $4982 ; (main.l1416 + 0)
497f : 4c c3 48 JMP $48c3 ; (main.l1362 + 0)
.l1416:
4982 : 20 9a 6a JSR $6a9a ; (vdcwin_win_free.s0 + 0)
4985 : a9 64 __ LDA #$64
4987 : 85 55 __ STA T1 + 0 
.l1419:
4989 : 20 db 74 JSR $74db ; (rand.s0 + 0)
498c : a9 00 __ LDA #$00
498e : 8d fd bf STA $bffd ; (sstack + 5)
4991 : a9 84 __ LDA #$84
4993 : 8d fe bf STA $bffe ; (sstack + 6)
4996 : ad 2d 83 LDA $832d ; (vdc_state + 7)
4999 : 29 f0 __ AND #$f0
499b : 85 59 __ STA T4 + 0 
499d : a9 0f __ LDA #$0f
499f : 85 03 __ STA WORK + 0 
49a1 : a9 00 __ LDA #$00
49a3 : 85 04 __ STA WORK + 1 
49a5 : 20 45 7d JSR $7d45 ; (divmod + 0)
49a8 : a5 05 __ LDA WORK + 2 
49aa : 38 __ __ SEC
49ab : 65 59 __ ADC T4 + 0 
49ad : 8d 2d 83 STA $832d ; (vdc_state + 7)
49b0 : 20 02 75 JSR $7502 ; (generateSentence.s1000 + 0)
49b3 : a9 00 __ LDA #$00
49b5 : 85 13 __ STA P6 
49b7 : a9 84 __ LDA #$84
49b9 : 85 14 __ STA P7 
49bb : ad 23 83 LDA $8323 ; (winCfg + 5)
49be : 85 1b __ STA ACCU + 0 
49c0 : a9 00 __ LDA #$00
49c2 : 85 1c __ STA ACCU + 1 
49c4 : a9 0d __ LDA #$0d
49c6 : 20 e3 7c JSR $7ce3 ; (mul16by8 + 0)
49c9 : 18 __ __ CLC
49ca : a9 47 __ LDA #$47
49cc : 65 05 __ ADC WORK + 2 
49ce : 85 11 __ STA P4 
49d0 : a9 84 __ LDA #$84
49d2 : 69 00 __ ADC #$00
49d4 : 85 12 __ STA P5 
49d6 : 20 2f 76 JSR $762f ; (vdcwin_printwrap.s1000 + 0)
49d9 : ac 23 83 LDY $8323 ; (winCfg + 5)
49dc : be fc 6b LDX $6bfc,y ; (__multab13L + 0)
49df : bd 4b 84 LDA $844b,x ; (linebuffer + 75)
49e2 : d0 1e __ BNE $4a02 ; (main.s1423 + 0)
.s13413:
49e4 : c6 55 __ DEC T1 + 0 
49e6 : d0 a1 __ BNE $4989 ; (main.l1419 + 0)
.s1421:
49e8 : 20 f0 56 JSR $56f0 ; (getch.s0 + 0)
49eb : ad 2d 83 LDA $832d ; (vdc_state + 7)
49ee : 29 f0 __ AND #$f0
49f0 : 09 0d __ ORA #$0d
49f2 : 8d 2d 83 STA $832d ; (vdc_state + 7)
49f5 : a9 01 __ LDA #$01
49f7 : cd 23 83 CMP $8323 ; (winCfg + 5)
49fa : 90 86 __ BCC $4982 ; (main.l1416 + 0)
.s1417:
49fc : 20 9a 6a JSR $6a9a ; (vdcwin_win_free.s0 + 0)
49ff : 4c 08 24 JMP $2408 ; (main.l630 + 0)
.s1423:
4a02 : 86 57 __ STX T3 + 0 
4a04 : 18 __ __ CLC
4a05 : 7d 47 84 ADC $8447,x ; (linebuffer + 71)
4a08 : 85 0d __ STA P0 
4a0a : bd 48 84 LDA $8448,x ; (linebuffer + 72)
4a0d : 18 __ __ CLC
4a0e : 7d 4c 84 ADC $844c,x ; (linebuffer + 76)
4a11 : 85 0e __ STA P1 
4a13 : ad ee 82 LDA $82ee ; (p2smap + 1)
4a16 : 49 20 __ EOR #$20
4a18 : 85 56 __ STA T2 + 0 
4a1a : ad 2d 83 LDA $832d ; (vdc_state + 7)
4a1d : 85 61 __ STA T8 + 0 
4a1f : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
4a22 : a9 12 __ LDA #$12
4a24 : 8d 00 d6 STA $d600 
4a27 : 18 __ __ CLC
4a28 : a9 47 __ LDA #$47
4a2a : 65 57 __ ADC T3 + 0 
4a2c : 85 57 __ STA T3 + 0 
4a2e : a9 84 __ LDA #$84
4a30 : 69 00 __ ADC #$00
4a32 : 85 58 __ STA T3 + 1 
4a34 : 18 __ __ CLC
4a35 : a5 1b __ LDA ACCU + 0 
4a37 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
4a3a : aa __ __ TAX
4a3b : a5 1c __ LDA ACCU + 1 
4a3d : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19675:
4a40 : 2c 00 d6 BIT $d600 
4a43 : 10 fb __ BPL $4a40 ; (main.l19675 + 0)
.s1437:
4a45 : 8d 01 d6 STA $d601 
4a48 : a9 13 __ LDA #$13
4a4a : 8d 00 d6 STA $d600 
.l19677:
4a4d : 2c 00 d6 BIT $d600 
4a50 : 10 fb __ BPL $4a4d ; (main.l19677 + 0)
.s1442:
4a52 : 8e 01 d6 STX $d601 
4a55 : a9 1f __ LDA #$1f
4a57 : 8d 00 d6 STA $d600 
.l19679:
4a5a : 2c 00 d6 BIT $d600 
4a5d : 10 fb __ BPL $4a5a ; (main.l19679 + 0)
.s1446:
4a5f : a5 56 __ LDA T2 + 0 
4a61 : 8d 01 d6 STA $d601 
4a64 : ad 30 83 LDA $8330 ; (vdc_state + 10)
4a67 : 18 __ __ CLC
4a68 : 65 1b __ ADC ACCU + 0 
4a6a : a2 12 __ LDX #$12
4a6c : 8e 00 d6 STX $d600 
4a6f : aa __ __ TAX
4a70 : ad 31 83 LDA $8331 ; (vdc_state + 11)
4a73 : 65 1c __ ADC ACCU + 1 
.l19681:
4a75 : 2c 00 d6 BIT $d600 
4a78 : 10 fb __ BPL $4a75 ; (main.l19681 + 0)
.s1453:
4a7a : 8d 01 d6 STA $d601 
4a7d : a9 13 __ LDA #$13
4a7f : 8d 00 d6 STA $d600 
.l19683:
4a82 : 2c 00 d6 BIT $d600 
4a85 : 10 fb __ BPL $4a82 ; (main.l19683 + 0)
.s1458:
4a87 : 8e 01 d6 STX $d601 
4a8a : a9 1f __ LDA #$1f
4a8c : 8d 00 d6 STA $d600 
.l19685:
4a8f : 2c 00 d6 BIT $d600 
4a92 : 10 fb __ BPL $4a8f ; (main.l19685 + 0)
.s1462:
4a94 : a5 61 __ LDA T8 + 0 
4a96 : 8d 01 d6 STA $d601 
4a99 : 18 __ __ CLC
4a9a : a0 04 __ LDY #$04
4a9c : b1 57 __ LDA (T3 + 0),y 
4a9e : 69 01 __ ADC #$01
4aa0 : 91 57 __ STA (T3 + 0),y 
4aa2 : a0 02 __ LDY #$02
4aa4 : d1 57 __ CMP (T3 + 0),y 
4aa6 : f0 03 __ BEQ $4aab ; (main.s1463 + 0)
4aa8 : 4c e4 49 JMP $49e4 ; (main.s13413 + 0)
.s1463:
4aab : a9 00 __ LDA #$00
4aad : a0 04 __ LDY #$04
4aaf : 91 57 __ STA (T3 + 0),y 
4ab1 : c8 __ __ INY
4ab2 : b1 57 __ LDA (T3 + 0),y 
4ab4 : 85 56 __ STA T2 + 0 
4ab6 : 18 __ __ CLC
4ab7 : 69 01 __ ADC #$01
4ab9 : 91 57 __ STA (T3 + 0),y 
4abb : a0 03 __ LDY #$03
4abd : d1 57 __ CMP (T3 + 0),y 
4abf : f0 03 __ BEQ $4ac4 ; (main.s1466 + 0)
4ac1 : 4c e4 49 JMP $49e4 ; (main.s13413 + 0)
.s1466:
4ac4 : a5 56 __ LDA T2 + 0 
4ac6 : a0 05 __ LDY #$05
4ac8 : 91 57 __ STA (T3 + 0),y 
4aca : a5 57 __ LDA T3 + 0 
4acc : a0 02 __ LDY #$02
4ace : 91 23 __ STA (SP + 0),y 
4ad0 : a5 58 __ LDA T3 + 1 
4ad2 : c8 __ __ INY
4ad3 : 91 23 __ STA (SP + 0),y 
4ad5 : a9 ff __ LDA #$ff
4ad7 : c8 __ __ INY
4ad8 : 91 23 __ STA (SP + 0),y 
4ada : a9 56 __ LDA #$56
4adc : c8 __ __ INY
4add : 91 23 __ STA (SP + 0),y 
4adf : 20 64 78 JSR $7864 ; (vdcwin_printline.s1000 + 0)
4ae2 : 4c e4 49 JMP $49e4 ; (main.s13413 + 0)
.s1369:
4ae5 : 86 57 __ STX T3 + 0 
4ae7 : 18 __ __ CLC
4ae8 : 7d 47 84 ADC $8447,x ; (linebuffer + 71)
4aeb : 85 0d __ STA P0 
4aed : bd 48 84 LDA $8448,x ; (linebuffer + 72)
4af0 : 18 __ __ CLC
4af1 : 7d 4c 84 ADC $844c,x ; (linebuffer + 76)
4af4 : 85 0e __ STA P1 
4af6 : ad ee 82 LDA $82ee ; (p2smap + 1)
4af9 : 49 20 __ EOR #$20
4afb : 85 61 __ STA T8 + 0 
4afd : ad 2d 83 LDA $832d ; (vdc_state + 7)
4b00 : 85 62 __ STA T9 + 0 
4b02 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
4b05 : a9 12 __ LDA #$12
4b07 : 8d 00 d6 STA $d600 
4b0a : 18 __ __ CLC
4b0b : a9 47 __ LDA #$47
4b0d : 65 57 __ ADC T3 + 0 
4b0f : 85 57 __ STA T3 + 0 
4b11 : a9 84 __ LDA #$84
4b13 : 69 00 __ ADC #$00
4b15 : 85 58 __ STA T3 + 1 
4b17 : 18 __ __ CLC
4b18 : a5 1b __ LDA ACCU + 0 
4b1a : 6d 2e 83 ADC $832e ; (vdc_state + 8)
4b1d : aa __ __ TAX
4b1e : a5 1c __ LDA ACCU + 1 
4b20 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19658:
4b23 : 2c 00 d6 BIT $d600 
4b26 : 10 fb __ BPL $4b23 ; (main.l19658 + 0)
.s1383:
4b28 : 8d 01 d6 STA $d601 
4b2b : a9 13 __ LDA #$13
4b2d : 8d 00 d6 STA $d600 
.l19660:
4b30 : 2c 00 d6 BIT $d600 
4b33 : 10 fb __ BPL $4b30 ; (main.l19660 + 0)
.s1388:
4b35 : 8e 01 d6 STX $d601 
4b38 : a9 1f __ LDA #$1f
4b3a : 8d 00 d6 STA $d600 
.l19662:
4b3d : 2c 00 d6 BIT $d600 
4b40 : 10 fb __ BPL $4b3d ; (main.l19662 + 0)
.s1392:
4b42 : a5 61 __ LDA T8 + 0 
4b44 : 8d 01 d6 STA $d601 
4b47 : ad 30 83 LDA $8330 ; (vdc_state + 10)
4b4a : 18 __ __ CLC
4b4b : 65 1b __ ADC ACCU + 0 
4b4d : a2 12 __ LDX #$12
4b4f : 8e 00 d6 STX $d600 
4b52 : aa __ __ TAX
4b53 : ad 31 83 LDA $8331 ; (vdc_state + 11)
4b56 : 65 1c __ ADC ACCU + 1 
.l19664:
4b58 : 2c 00 d6 BIT $d600 
4b5b : 10 fb __ BPL $4b58 ; (main.l19664 + 0)
.s1399:
4b5d : 8d 01 d6 STA $d601 
4b60 : a9 13 __ LDA #$13
4b62 : 8d 00 d6 STA $d600 
.l19666:
4b65 : 2c 00 d6 BIT $d600 
4b68 : 10 fb __ BPL $4b65 ; (main.l19666 + 0)
.s1404:
4b6a : 8e 01 d6 STX $d601 
4b6d : a9 1f __ LDA #$1f
4b6f : 8d 00 d6 STA $d600 
.l19668:
4b72 : 2c 00 d6 BIT $d600 
4b75 : 10 fb __ BPL $4b72 ; (main.l19668 + 0)
.s1408:
4b77 : a5 62 __ LDA T9 + 0 
4b79 : 8d 01 d6 STA $d601 
4b7c : 18 __ __ CLC
4b7d : a0 04 __ LDY #$04
4b7f : b1 57 __ LDA (T3 + 0),y 
4b81 : 69 01 __ ADC #$01
4b83 : 91 57 __ STA (T3 + 0),y 
4b85 : a0 02 __ LDY #$02
4b87 : d1 57 __ CMP (T3 + 0),y 
4b89 : f0 03 __ BEQ $4b8e ; (main.s1409 + 0)
4b8b : 4c 65 49 JMP $4965 ; (main.s13412 + 0)
.s1409:
4b8e : a9 00 __ LDA #$00
4b90 : a0 04 __ LDY #$04
4b92 : 91 57 __ STA (T3 + 0),y 
4b94 : c8 __ __ INY
4b95 : b1 57 __ LDA (T3 + 0),y 
4b97 : aa __ __ TAX
4b98 : 18 __ __ CLC
4b99 : 69 01 __ ADC #$01
4b9b : 91 57 __ STA (T3 + 0),y 
4b9d : a0 03 __ LDY #$03
4b9f : d1 57 __ CMP (T3 + 0),y 
4ba1 : f0 03 __ BEQ $4ba6 ; (main.s1412 + 0)
4ba3 : 4c 65 49 JMP $4965 ; (main.s13412 + 0)
.s1412:
4ba6 : 8a __ __ TXA
4ba7 : a0 05 __ LDY #$05
4ba9 : 91 57 __ STA (T3 + 0),y 
4bab : a5 57 __ LDA T3 + 0 
4bad : a0 02 __ LDY #$02
4baf : 91 23 __ STA (SP + 0),y 
4bb1 : a5 58 __ LDA T3 + 1 
4bb3 : c8 __ __ INY
4bb4 : 91 23 __ STA (SP + 0),y 
4bb6 : a9 ff __ LDA #$ff
4bb8 : c8 __ __ INY
4bb9 : 91 23 __ STA (SP + 0),y 
4bbb : a9 56 __ LDA #$56
4bbd : c8 __ __ INY
4bbe : 91 23 __ STA (SP + 0),y 
4bc0 : 20 64 78 JSR $7864 ; (vdcwin_printline.s1000 + 0)
4bc3 : 4c 65 49 JMP $4965 ; (main.s13412 + 0)
.s1300:
4bc6 : a9 f0 __ LDA #$f0
4bc8 : 85 15 __ STA P8 
4bca : a9 08 __ LDA #$08
4bcc : 85 16 __ STA P9 
4bce : 85 17 __ STA P10 
4bd0 : a9 1e __ LDA #$1e
4bd2 : 85 18 __ STA P11 
4bd4 : a9 0a __ LDA #$0a
4bd6 : 8d f8 bf STA $bff8 ; (sstack + 0)
4bd9 : ad 2d 83 LDA $832d ; (vdc_state + 7)
4bdc : 85 55 __ STA T1 + 0 
4bde : a9 8d __ LDA #$8d
4be0 : 8d 2d 83 STA $832d ; (vdc_state + 7)
4be3 : 20 9e 61 JSR $619e ; (vdcwin_win_new.s1000 + 0)
4be6 : 20 84 7e JSR $7e84 ; (vdc_coords@proxy + 0)
4be9 : a5 1b __ LDA ACCU + 0 
4beb : 85 53 __ STA T0 + 0 
4bed : a5 1c __ LDA ACCU + 1 
4bef : 85 54 __ STA T0 + 1 
4bf1 : a9 dd __ LDA #$dd
4bf3 : 85 0d __ STA P0 
4bf5 : a9 6e __ LDA #$6e
4bf7 : 85 0e __ STA P1 
4bf9 : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
4bfc : a5 1b __ LDA ACCU + 0 
4bfe : 85 57 __ STA T3 + 0 
4c00 : a9 12 __ LDA #$12
4c02 : 8d 00 d6 STA $d600 
4c05 : 18 __ __ CLC
4c06 : a5 53 __ LDA T0 + 0 
4c08 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
4c0b : aa __ __ TAX
4c0c : a5 54 __ LDA T0 + 1 
4c0e : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l19609:
4c11 : 2c 00 d6 BIT $d600 
4c14 : 10 fb __ BPL $4c11 ; (main.l19609 + 0)
.s1309:
4c16 : 8d 01 d6 STA $d601 
4c19 : a9 13 __ LDA #$13
4c1b : 8d 00 d6 STA $d600 
.l19611:
4c1e : 2c 00 d6 BIT $d600 
4c21 : 10 fb __ BPL $4c1e ; (main.l19611 + 0)
.s1314:
4c23 : 8e 01 d6 STX $d601 
4c26 : a9 1f __ LDA #$1f
4c28 : 8d 00 d6 STA $d600 
4c2b : a5 1b __ LDA ACCU + 0 
4c2d : f0 19 __ BEQ $4c48 ; (main.s1319 + 0)
.s3786:
4c2f : a2 00 __ LDX #$00
.l1317:
4c31 : 86 56 __ STX T2 + 0 
4c33 : bd dd 6e LDA $6edd,x 
4c36 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l19614:
4c39 : 2c 00 d6 BIT $d600 
4c3c : 10 fb __ BPL $4c39 ; (main.l19614 + 0)
.s1322:
4c3e : 8d 01 d6 STA $d601 
4c41 : a6 56 __ LDX T2 + 0 
4c43 : e8 __ __ INX
4c44 : e4 57 __ CPX T3 + 0 
4c46 : 90 e9 __ BCC $4c31 ; (main.l1317 + 0)
.s1319:
4c48 : a9 12 __ LDA #$12
4c4a : 8d 00 d6 STA $d600 
4c4d : c6 57 __ DEC T3 + 0 
4c4f : ad 30 83 LDA $8330 ; (vdc_state + 10)
4c52 : 18 __ __ CLC
4c53 : 65 53 __ ADC T0 + 0 
4c55 : aa __ __ TAX
4c56 : ad 31 83 LDA $8331 ; (vdc_state + 11)
4c59 : 65 54 __ ADC T0 + 1 
.l19617:
4c5b : 2c 00 d6 BIT $d600 
4c5e : 10 fb __ BPL $4c5b ; (main.l19617 + 0)
.s1329:
4c60 : 8d 01 d6 STA $d601 
4c63 : a9 13 __ LDA #$13
4c65 : 8d 00 d6 STA $d600 
.l19619:
4c68 : 2c 00 d6 BIT $d600 
4c6b : 10 fb __ BPL $4c68 ; (main.l19619 + 0)
.s1334:
4c6d : 8e 01 d6 STX $d601 
4c70 : a9 1f __ LDA #$1f
4c72 : 8d 00 d6 STA $d600 
.l19621:
4c75 : 2c 00 d6 BIT $d600 
4c78 : 10 fb __ BPL $4c75 ; (main.l19621 + 0)
.s1338:
4c7a : a9 8d __ LDA #$8d
4c7c : 8d 01 d6 STA $d601 
4c7f : a9 18 __ LDA #$18
4c81 : 8d 00 d6 STA $d600 
.l19623:
4c84 : 2c 00 d6 BIT $d600 
4c87 : 10 fb __ BPL $4c84 ; (main.l19623 + 0)
.s1344:
4c89 : ad 01 d6 LDA $d601 
4c8c : 29 7f __ AND #$7f
4c8e : a2 18 __ LDX #$18
4c90 : 8e 00 d6 STX $d600 
.l19625:
4c93 : 2c 00 d6 BIT $d600 
4c96 : 10 fb __ BPL $4c93 ; (main.l19625 + 0)
.s1350:
4c98 : 8d 01 d6 STA $d601 
4c9b : a9 1e __ LDA #$1e
4c9d : 8d 00 d6 STA $d600 
.l19627:
4ca0 : 2c 00 d6 BIT $d600 
4ca3 : 10 fb __ BPL $4ca0 ; (main.l19627 + 0)
.s1355:
4ca5 : a5 57 __ LDA T3 + 0 
4ca7 : 8d 01 d6 STA $d601 
4caa : a9 19 __ LDA #$19
4cac : 8d fd bf STA $bffd ; (sstack + 5)
4caf : a9 0b __ LDA #$0b
4cb1 : 8d fe bf STA $bffe ; (sstack + 6)
4cb4 : a9 06 __ LDA #$06
4cb6 : 8d ff bf STA $bfff ; (sstack + 7)
4cb9 : 20 82 70 JSR $7082 ; (menu_pulldown.s1000 + 0)
4cbc : a5 1b __ LDA ACCU + 0 
4cbe : 85 56 __ STA T2 + 0 
4cc0 : 20 9a 6a JSR $6a9a ; (vdcwin_win_free.s0 + 0)
4cc3 : a6 56 __ LDX T2 + 0 
4cc5 : f0 06 __ BEQ $4ccd ; (main.s20338 + 0)
.s1356:
4cc7 : ca __ __ DEX
4cc8 : 86 13 __ STX P6 
4cca : 20 fd 58 JSR $58fd ; (vdc_set_mode.s0 + 0)
.s20338:
4ccd : a5 55 __ LDA T1 + 0 
4ccf : 8d 2d 83 STA $832d ; (vdc_state + 7)
4cd2 : 4c 08 24 JMP $2408 ; (main.l630 + 0)
.s1155:
4cd5 : a6 55 __ LDX T1 + 0 
4cd7 : ca __ __ DEX
4cd8 : 8e ff bf STX $bfff ; (sstack + 7)
4cdb : bd ce 7e LDA $7ece,x ; (menubar + 45)
4cde : 8d fd bf STA $bffd ; (sstack + 5)
4ce1 : ae d3 7e LDX $7ed3 ; (menubar + 50)
4ce4 : e8 __ __ INX
4ce5 : 8e fe bf STX $bffe ; (sstack + 6)
4ce8 : 20 82 70 JSR $7082 ; (menu_pulldown.s1000 + 0)
4ceb : a5 1b __ LDA ACCU + 0 
4ced : 85 56 __ STA T2 + 0 
4cef : c9 12 __ CMP #$12
4cf1 : d0 0e __ BNE $4d01 ; (main.s1288 + 0)
.s1286:
4cf3 : a9 00 __ LDA #$00
4cf5 : 85 56 __ STA T2 + 0 
4cf7 : c6 55 __ DEC T1 + 0 
4cf9 : d0 06 __ BNE $4d01 ; (main.s1288 + 0)
.s1289:
4cfb : a9 05 __ LDA #$05
4cfd : 85 55 __ STA T1 + 0 
4cff : d0 13 __ BNE $4d14 ; (main.s1284 + 0)
.s1288:
4d01 : c9 13 __ CMP #$13
4d03 : d0 0f __ BNE $4d14 ; (main.s1284 + 0)
.s1292:
4d05 : e6 55 __ INC T1 + 0 
4d07 : a5 55 __ LDA T1 + 0 
4d09 : c9 06 __ CMP #$06
4d0b : 90 03 __ BCC $4d10 ; (main.s12359 + 0)
4d0d : 4c 6c 2b JMP $2b6c ; (main.l20334 + 0)
.s12359:
4d10 : a9 00 __ LDA #$00
4d12 : 85 56 __ STA T2 + 0 
.s1284:
4d14 : a5 56 __ LDA T2 + 0 
4d16 : f0 03 __ BEQ $4d1b ; (main.s1284 + 7)
4d18 : 4c 69 2d JMP $2d69 ; (main.s1153 + 0)
4d1b : 4c 70 2b JMP $2b70 ; (main.l1154 + 0)
.s2166:
4d1e : 85 55 __ STA T1 + 0 
4d20 : a5 53 __ LDA T0 + 0 
4d22 : 4c 5a 2d JMP $2d5a ; (main.s1281 + 0)
.s1268:
4d25 : c6 55 __ DEC T1 + 0 
4d27 : f0 03 __ BEQ $4d2c ; (main.s1271 + 0)
4d29 : 4c 51 2d JMP $2d51 ; (main.s1270 + 0)
.s1271:
4d2c : a9 05 __ LDA #$05
4d2e : d0 ee __ BNE $4d1e ; (main.s2166 + 0)
.s636:
4d30 : 85 0e __ STA P1 
4d32 : ad 2d 83 LDA $832d ; (vdc_state + 7)
4d35 : 85 56 __ STA T2 + 0 
4d37 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
4d3a : a9 12 __ LDA #$12
4d3c : 8d 00 d6 STA $d600 
4d3f : 18 __ __ CLC
4d40 : a5 1b __ LDA ACCU + 0 
4d42 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
4d45 : a8 __ __ TAY
4d46 : a5 1c __ LDA ACCU + 1 
4d48 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
4d4b : a6 53 __ LDX T0 + 0 
4d4d : ca __ __ DEX
.l19376:
4d4e : 2c 00 d6 BIT $d600 
4d51 : 10 fb __ BPL $4d4e ; (main.l19376 + 0)
.s646:
4d53 : 8d 01 d6 STA $d601 
4d56 : a9 13 __ LDA #$13
4d58 : 8d 00 d6 STA $d600 
.l19378:
4d5b : 2c 00 d6 BIT $d600 
4d5e : 10 fb __ BPL $4d5b ; (main.l19378 + 0)
.s651:
4d60 : 8c 01 d6 STY $d601 
4d63 : a9 1f __ LDA #$1f
4d65 : 8d 00 d6 STA $d600 
.l19380:
4d68 : 2c 00 d6 BIT $d600 
4d6b : 10 fb __ BPL $4d68 ; (main.l19380 + 0)
.s655:
4d6d : a9 20 __ LDA #$20
4d6f : 8d 01 d6 STA $d601 
4d72 : a9 18 __ LDA #$18
4d74 : 8d 00 d6 STA $d600 
.l19382:
4d77 : 2c 00 d6 BIT $d600 
4d7a : 10 fb __ BPL $4d77 ; (main.l19382 + 0)
.s661:
4d7c : ad 01 d6 LDA $d601 
4d7f : 29 7f __ AND #$7f
4d81 : a0 18 __ LDY #$18
4d83 : 8c 00 d6 STY $d600 
.l19384:
4d86 : 2c 00 d6 BIT $d600 
4d89 : 10 fb __ BPL $4d86 ; (main.l19384 + 0)
.s667:
4d8b : 8d 01 d6 STA $d601 
4d8e : a9 1e __ LDA #$1e
4d90 : 8d 00 d6 STA $d600 
.l19386:
4d93 : 2c 00 d6 BIT $d600 
4d96 : 10 fb __ BPL $4d93 ; (main.l19386 + 0)
.s672:
4d98 : 8e 01 d6 STX $d601 
4d9b : ad 30 83 LDA $8330 ; (vdc_state + 10)
4d9e : 18 __ __ CLC
4d9f : 65 1b __ ADC ACCU + 0 
4da1 : a0 12 __ LDY #$12
4da3 : 8c 00 d6 STY $d600 
4da6 : a8 __ __ TAY
4da7 : ad 31 83 LDA $8331 ; (vdc_state + 11)
4daa : 65 1c __ ADC ACCU + 1 
.l19388:
4dac : 2c 00 d6 BIT $d600 
4daf : 10 fb __ BPL $4dac ; (main.l19388 + 0)
.s679:
4db1 : 8d 01 d6 STA $d601 
4db4 : a9 13 __ LDA #$13
4db6 : 8d 00 d6 STA $d600 
.l19390:
4db9 : 2c 00 d6 BIT $d600 
4dbc : 10 fb __ BPL $4db9 ; (main.l19390 + 0)
.s684:
4dbe : 8c 01 d6 STY $d601 
4dc1 : a9 1f __ LDA #$1f
4dc3 : 8d 00 d6 STA $d600 
.l19392:
4dc6 : 2c 00 d6 BIT $d600 
4dc9 : 10 fb __ BPL $4dc6 ; (main.l19392 + 0)
.s688:
4dcb : a5 56 __ LDA T2 + 0 
4dcd : 8d 01 d6 STA $d601 
4dd0 : a9 18 __ LDA #$18
4dd2 : 8d 00 d6 STA $d600 
.l19394:
4dd5 : 2c 00 d6 BIT $d600 
4dd8 : 10 fb __ BPL $4dd5 ; (main.l19394 + 0)
.s694:
4dda : ad 01 d6 LDA $d601 
4ddd : 29 7f __ AND #$7f
4ddf : a0 18 __ LDY #$18
4de1 : 8c 00 d6 STY $d600 
.l19396:
4de4 : 2c 00 d6 BIT $d600 
4de7 : 10 fb __ BPL $4de4 ; (main.l19396 + 0)
.s700:
4de9 : 8d 01 d6 STA $d601 
4dec : a9 1e __ LDA #$1e
4dee : 8d 00 d6 STA $d600 
.l19398:
4df1 : 2c 00 d6 BIT $d600 
4df4 : 10 fb __ BPL $4df1 ; (main.l19398 + 0)
.s705:
4df6 : 8e 01 d6 STX $d601 
4df9 : e6 55 __ INC T1 + 0 
4dfb : 4c 18 24 JMP $2418 ; (main.l635 + 0)
.s277:
4dfe : a9 00 __ LDA #$00
4e00 : 85 0d __ STA P0 
4e02 : a5 55 __ LDA T1 + 0 
4e04 : 85 0e __ STA P1 
4e06 : ad 2d 83 LDA $832d ; (vdc_state + 7)
4e09 : 85 56 __ STA T2 + 0 
4e0b : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
4e0e : a9 12 __ LDA #$12
4e10 : 8d 00 d6 STA $d600 
4e13 : 18 __ __ CLC
4e14 : a5 1b __ LDA ACCU + 0 
4e16 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
4e19 : a8 __ __ TAY
4e1a : a5 1c __ LDA ACCU + 1 
4e1c : 6d 2f 83 ADC $832f ; (vdc_state + 9)
4e1f : a6 53 __ LDX T0 + 0 
4e21 : ca __ __ DEX
.l20308:
4e22 : 2c 00 d6 BIT $d600 
4e25 : 10 fb __ BPL $4e22 ; (main.l20308 + 0)
.s287:
4e27 : 8d 01 d6 STA $d601 
4e2a : a9 13 __ LDA #$13
4e2c : 8d 00 d6 STA $d600 
.l20310:
4e2f : 2c 00 d6 BIT $d600 
4e32 : 10 fb __ BPL $4e2f ; (main.l20310 + 0)
.s292:
4e34 : 8c 01 d6 STY $d601 
4e37 : a9 1f __ LDA #$1f
4e39 : 8d 00 d6 STA $d600 
.l20312:
4e3c : 2c 00 d6 BIT $d600 
4e3f : 10 fb __ BPL $4e3c ; (main.l20312 + 0)
.s296:
4e41 : a9 20 __ LDA #$20
4e43 : 8d 01 d6 STA $d601 
4e46 : a9 18 __ LDA #$18
4e48 : 8d 00 d6 STA $d600 
.l20314:
4e4b : 2c 00 d6 BIT $d600 
4e4e : 10 fb __ BPL $4e4b ; (main.l20314 + 0)
.s302:
4e50 : ad 01 d6 LDA $d601 
4e53 : 29 7f __ AND #$7f
4e55 : a0 18 __ LDY #$18
4e57 : 8c 00 d6 STY $d600 
.l20316:
4e5a : 2c 00 d6 BIT $d600 
4e5d : 10 fb __ BPL $4e5a ; (main.l20316 + 0)
.s308:
4e5f : 8d 01 d6 STA $d601 
4e62 : a9 1e __ LDA #$1e
4e64 : 8d 00 d6 STA $d600 
.l20318:
4e67 : 2c 00 d6 BIT $d600 
4e6a : 10 fb __ BPL $4e67 ; (main.l20318 + 0)
.s313:
4e6c : 8e 01 d6 STX $d601 
4e6f : ad 30 83 LDA $8330 ; (vdc_state + 10)
4e72 : 18 __ __ CLC
4e73 : 65 1b __ ADC ACCU + 0 
4e75 : a0 12 __ LDY #$12
4e77 : 8c 00 d6 STY $d600 
4e7a : a8 __ __ TAY
4e7b : ad 31 83 LDA $8331 ; (vdc_state + 11)
4e7e : 65 1c __ ADC ACCU + 1 
.l20320:
4e80 : 2c 00 d6 BIT $d600 
4e83 : 10 fb __ BPL $4e80 ; (main.l20320 + 0)
.s320:
4e85 : 8d 01 d6 STA $d601 
4e88 : a9 13 __ LDA #$13
4e8a : 8d 00 d6 STA $d600 
.l20322:
4e8d : 2c 00 d6 BIT $d600 
4e90 : 10 fb __ BPL $4e8d ; (main.l20322 + 0)
.s325:
4e92 : 8c 01 d6 STY $d601 
4e95 : a9 1f __ LDA #$1f
4e97 : 8d 00 d6 STA $d600 
.l20324:
4e9a : 2c 00 d6 BIT $d600 
4e9d : 10 fb __ BPL $4e9a ; (main.l20324 + 0)
.s329:
4e9f : a5 56 __ LDA T2 + 0 
4ea1 : 8d 01 d6 STA $d601 
4ea4 : a9 18 __ LDA #$18
4ea6 : 8d 00 d6 STA $d600 
.l20326:
4ea9 : 2c 00 d6 BIT $d600 
4eac : 10 fb __ BPL $4ea9 ; (main.l20326 + 0)
.s335:
4eae : ad 01 d6 LDA $d601 
4eb1 : 29 7f __ AND #$7f
4eb3 : a0 18 __ LDY #$18
4eb5 : 8c 00 d6 STY $d600 
.l20328:
4eb8 : 2c 00 d6 BIT $d600 
4ebb : 10 fb __ BPL $4eb8 ; (main.l20328 + 0)
.s341:
4ebd : 8d 01 d6 STA $d601 
4ec0 : a9 1e __ LDA #$1e
4ec2 : 8d 00 d6 STA $d600 
.l20330:
4ec5 : 2c 00 d6 BIT $d600 
4ec8 : 10 fb __ BPL $4ec5 ; (main.l20330 + 0)
.s346:
4eca : 8e 01 d6 STX $d601 
4ecd : e6 55 __ INC T1 + 0 
4ecf : 4c 19 1f JMP $1f19 ; (main.l276 + 0)
.s102:
4ed2 : a9 00 __ LDA #$00
4ed4 : 85 0d __ STA P0 
4ed6 : a5 55 __ LDA T1 + 0 
4ed8 : 85 0e __ STA P1 
4eda : ad 2d 83 LDA $832d ; (vdc_state + 7)
4edd : 85 56 __ STA T2 + 0 
4edf : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
4ee2 : a9 12 __ LDA #$12
4ee4 : 8d 00 d6 STA $d600 
4ee7 : 18 __ __ CLC
4ee8 : a5 1b __ LDA ACCU + 0 
4eea : 6d 2e 83 ADC $832e ; (vdc_state + 8)
4eed : a8 __ __ TAY
4eee : a5 1c __ LDA ACCU + 1 
4ef0 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
4ef3 : a6 53 __ LDX T0 + 0 
4ef5 : ca __ __ DEX
.l19245:
4ef6 : 2c 00 d6 BIT $d600 
4ef9 : 10 fb __ BPL $4ef6 ; (main.l19245 + 0)
.s112:
4efb : 8d 01 d6 STA $d601 
4efe : a9 13 __ LDA #$13
4f00 : 8d 00 d6 STA $d600 
.l19247:
4f03 : 2c 00 d6 BIT $d600 
4f06 : 10 fb __ BPL $4f03 ; (main.l19247 + 0)
.s117:
4f08 : 8c 01 d6 STY $d601 
4f0b : a9 1f __ LDA #$1f
4f0d : 8d 00 d6 STA $d600 
.l19249:
4f10 : 2c 00 d6 BIT $d600 
4f13 : 10 fb __ BPL $4f10 ; (main.l19249 + 0)
.s121:
4f15 : a9 20 __ LDA #$20
4f17 : 8d 01 d6 STA $d601 
4f1a : a9 18 __ LDA #$18
4f1c : 8d 00 d6 STA $d600 
.l19251:
4f1f : 2c 00 d6 BIT $d600 
4f22 : 10 fb __ BPL $4f1f ; (main.l19251 + 0)
.s127:
4f24 : ad 01 d6 LDA $d601 
4f27 : 29 7f __ AND #$7f
4f29 : a0 18 __ LDY #$18
4f2b : 8c 00 d6 STY $d600 
.l19253:
4f2e : 2c 00 d6 BIT $d600 
4f31 : 10 fb __ BPL $4f2e ; (main.l19253 + 0)
.s133:
4f33 : 8d 01 d6 STA $d601 
4f36 : a9 1e __ LDA #$1e
4f38 : 8d 00 d6 STA $d600 
.l19255:
4f3b : 2c 00 d6 BIT $d600 
4f3e : 10 fb __ BPL $4f3b ; (main.l19255 + 0)
.s138:
4f40 : 8e 01 d6 STX $d601 
4f43 : ad 30 83 LDA $8330 ; (vdc_state + 10)
4f46 : 18 __ __ CLC
4f47 : 65 1b __ ADC ACCU + 0 
4f49 : a0 12 __ LDY #$12
4f4b : 8c 00 d6 STY $d600 
4f4e : a8 __ __ TAY
4f4f : ad 31 83 LDA $8331 ; (vdc_state + 11)
4f52 : 65 1c __ ADC ACCU + 1 
.l19257:
4f54 : 2c 00 d6 BIT $d600 
4f57 : 10 fb __ BPL $4f54 ; (main.l19257 + 0)
.s145:
4f59 : 8d 01 d6 STA $d601 
4f5c : a9 13 __ LDA #$13
4f5e : 8d 00 d6 STA $d600 
.l19259:
4f61 : 2c 00 d6 BIT $d600 
4f64 : 10 fb __ BPL $4f61 ; (main.l19259 + 0)
.s150:
4f66 : 8c 01 d6 STY $d601 
4f69 : a9 1f __ LDA #$1f
4f6b : 8d 00 d6 STA $d600 
.l19261:
4f6e : 2c 00 d6 BIT $d600 
4f71 : 10 fb __ BPL $4f6e ; (main.l19261 + 0)
.s154:
4f73 : a5 56 __ LDA T2 + 0 
4f75 : 8d 01 d6 STA $d601 
4f78 : a9 18 __ LDA #$18
4f7a : 8d 00 d6 STA $d600 
.l19263:
4f7d : 2c 00 d6 BIT $d600 
4f80 : 10 fb __ BPL $4f7d ; (main.l19263 + 0)
.s160:
4f82 : ad 01 d6 LDA $d601 
4f85 : 29 7f __ AND #$7f
4f87 : a0 18 __ LDY #$18
4f89 : 8c 00 d6 STY $d600 
.l19265:
4f8c : 2c 00 d6 BIT $d600 
4f8f : 10 fb __ BPL $4f8c ; (main.l19265 + 0)
.s166:
4f91 : 8d 01 d6 STA $d601 
4f94 : a9 1e __ LDA #$1e
4f96 : 8d 00 d6 STA $d600 
.l19267:
4f99 : 2c 00 d6 BIT $d600 
4f9c : 10 fb __ BPL $4f99 ; (main.l19267 + 0)
.s171:
4f9e : 8e 01 d6 STX $d601 
4fa1 : e6 55 __ INC T1 + 0 
4fa3 : 4c e3 1d JMP $1de3 ; (main.l101 + 0)
--------------------------------------------------------------------
vdc_coords@proxy: ; vdc_coords@proxy
4fa6 : ad d3 7e LDA $7ed3 ; (menubar + 50)
4fa9 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_coords: ; vdc_coords(u8,u8)->u16
.s0:
4fab : a5 0e __ LDA P1 ; (y + 0)
4fad : 0a __ __ ASL
4fae : aa __ __ TAX
4faf : bd 3f 83 LDA $833f,x ; (multab + 0)
4fb2 : 18 __ __ CLC
4fb3 : 65 0d __ ADC P0 ; (x + 0)
4fb5 : 85 1b __ STA ACCU + 0 
4fb7 : bd 40 83 LDA $8340,x ; (multab + 1)
4fba : 69 00 __ ADC #$00
4fbc : 85 1c __ STA ACCU + 1 
.s1001:
4fbe : 60 __ __ RTS
--------------------------------------------------------------------
screen_width: ; screen_width()->u8
.s0:
4fbf : 24 d7 __ BIT $d7 
4fc1 : 30 03 __ BMI $4fc6 ; (screen_width.s1 + 0)
.s2:
4fc3 : a9 28 __ LDA #$28
4fc5 : 60 __ __ RTS
.s1:
4fc6 : a9 50 __ LDA #$50
.s1001:
4fc8 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
4fc9 : a9 01 __ LDA #$01
4fcb : 8d fc bf STA $bffc ; (sstack + 4)
4fce : a9 aa __ LDA #$aa
4fd0 : 85 16 __ STA P9 
4fd2 : a9 bf __ LDA #$bf
4fd4 : 85 17 __ STA P10 
4fd6 : a0 02 __ LDY #$02
4fd8 : b1 23 __ LDA (SP + 0),y 
4fda : 8d f8 bf STA $bff8 ; (sstack + 0)
4fdd : c8 __ __ INY
4fde : b1 23 __ LDA (SP + 0),y 
4fe0 : 8d f9 bf STA $bff9 ; (sstack + 1)
4fe3 : 18 __ __ CLC
4fe4 : a5 23 __ LDA SP + 0 
4fe6 : 69 04 __ ADC #$04
4fe8 : 8d fa bf STA $bffa ; (sstack + 2)
4feb : a5 24 __ LDA SP + 1 
4fed : 69 00 __ ADC #$00
4fef : 8d fb bf STA $bffb ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s1000:
4ff2 : a5 53 __ LDA T7 + 0 
4ff4 : 8d dc bf STA $bfdc ; (wrapbuffer + 62)
4ff7 : a5 54 __ LDA T7 + 1 
4ff9 : 8d dd bf STA $bfdd ; (wrapbuffer + 63)
4ffc : a5 55 __ LDA T7 + 2 
4ffe : 8d de bf STA $bfde ; (wrapbuffer + 64)
.s0:
5001 : a9 00 __ LDA #$00
5003 : 85 47 __ STA T0 + 0 
5005 : ad f8 bf LDA $bff8 ; (sstack + 0)
5008 : 85 49 __ STA T1 + 0 
500a : ad f9 bf LDA $bff9 ; (sstack + 1)
500d : 85 4a __ STA T1 + 1 
.l1:
500f : a0 00 __ LDY #$00
5011 : b1 49 __ LDA (T1 + 0),y 
5013 : d0 3c __ BNE $5051 ; (sformat.s2 + 0)
.s3:
5015 : a4 47 __ LDY T0 + 0 
5017 : 91 16 __ STA (P9),y ; (buff + 0)
5019 : 98 __ __ TYA
501a : f0 1d __ BEQ $5039 ; (sformat.s1070 + 0)
.s116:
501c : ad fc bf LDA $bffc ; (sstack + 4)
501f : d0 0d __ BNE $502e ; (sformat.s119 + 0)
.s120:
5021 : 18 __ __ CLC
5022 : a5 16 __ LDA P9 ; (buff + 0)
5024 : 65 47 __ ADC T0 + 0 
5026 : aa __ __ TAX
5027 : a5 17 __ LDA P10 ; (buff + 1)
5029 : 69 00 __ ADC #$00
502b : 4c 3d 50 JMP $503d ; (sformat.s1001 + 0)
.s119:
502e : a5 16 __ LDA P9 ; (buff + 0)
5030 : 85 0d __ STA P0 
5032 : a5 17 __ LDA P10 ; (buff + 1)
5034 : 85 0e __ STA P1 
5036 : 20 f3 53 JSR $53f3 ; (puts.s0 + 0)
.s1070:
5039 : a5 17 __ LDA P10 ; (buff + 1)
503b : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
503d : 86 1b __ STX ACCU + 0 ; (fps + 0)
503f : 85 1c __ STA ACCU + 1 ; (fps + 1)
5041 : ad dc bf LDA $bfdc ; (wrapbuffer + 62)
5044 : 85 53 __ STA T7 + 0 
5046 : ad dd bf LDA $bfdd ; (wrapbuffer + 63)
5049 : 85 54 __ STA T7 + 1 
504b : ad de bf LDA $bfde ; (wrapbuffer + 64)
504e : 85 55 __ STA T7 + 2 
5050 : 60 __ __ RTS
.s2:
5051 : c9 25 __ CMP #$25
5053 : f0 3f __ BEQ $5094 ; (sformat.s4 + 0)
.s5:
5055 : a4 47 __ LDY T0 + 0 
5057 : 91 16 __ STA (P9),y ; (buff + 0)
5059 : e6 49 __ INC T1 + 0 
505b : d0 02 __ BNE $505f ; (sformat.s1098 + 0)
.s1097:
505d : e6 4a __ INC T1 + 1 
.s1098:
505f : c8 __ __ INY
5060 : 84 47 __ STY T0 + 0 
5062 : 98 __ __ TYA
5063 : c0 28 __ CPY #$28
5065 : 90 a8 __ BCC $500f ; (sformat.l1 + 0)
.s110:
5067 : 85 4c __ STA T5 + 0 
5069 : a9 00 __ LDA #$00
506b : 85 47 __ STA T0 + 0 
506d : ad fc bf LDA $bffc ; (sstack + 4)
5070 : f0 14 __ BEQ $5086 ; (sformat.s114 + 0)
.s113:
5072 : a5 16 __ LDA P9 ; (buff + 0)
5074 : 85 0d __ STA P0 
5076 : a5 17 __ LDA P10 ; (buff + 1)
5078 : 85 0e __ STA P1 
507a : a9 00 __ LDA #$00
507c : a4 4c __ LDY T5 + 0 
507e : 91 16 __ STA (P9),y ; (buff + 0)
5080 : 20 f3 53 JSR $53f3 ; (puts.s0 + 0)
5083 : 4c 0f 50 JMP $500f ; (sformat.l1 + 0)
.s114:
5086 : 18 __ __ CLC
5087 : a5 16 __ LDA P9 ; (buff + 0)
5089 : 65 4c __ ADC T5 + 0 
508b : 85 16 __ STA P9 ; (buff + 0)
508d : 90 80 __ BCC $500f ; (sformat.l1 + 0)
.s1099:
508f : e6 17 __ INC P10 ; (buff + 1)
5091 : 4c 0f 50 JMP $500f ; (sformat.l1 + 0)
.s4:
5094 : a5 47 __ LDA T0 + 0 
5096 : f0 27 __ BEQ $50bf ; (sformat.s9 + 0)
.s7:
5098 : 84 47 __ STY T0 + 0 
509a : 85 4c __ STA T5 + 0 
509c : ad fc bf LDA $bffc ; (sstack + 4)
509f : f0 13 __ BEQ $50b4 ; (sformat.s11 + 0)
.s10:
50a1 : a5 16 __ LDA P9 ; (buff + 0)
50a3 : 85 0d __ STA P0 
50a5 : a5 17 __ LDA P10 ; (buff + 1)
50a7 : 85 0e __ STA P1 
50a9 : 98 __ __ TYA
50aa : a4 4c __ LDY T5 + 0 
50ac : 91 16 __ STA (P9),y ; (buff + 0)
50ae : 20 f3 53 JSR $53f3 ; (puts.s0 + 0)
50b1 : 4c bf 50 JMP $50bf ; (sformat.s9 + 0)
.s11:
50b4 : 18 __ __ CLC
50b5 : a5 16 __ LDA P9 ; (buff + 0)
50b7 : 65 4c __ ADC T5 + 0 
50b9 : 85 16 __ STA P9 ; (buff + 0)
50bb : 90 02 __ BCC $50bf ; (sformat.s9 + 0)
.s1095:
50bd : e6 17 __ INC P10 ; (buff + 1)
.s9:
50bf : a9 0a __ LDA #$0a
50c1 : 8d e3 bf STA $bfe3 ; (wrapbuffer + 69)
50c4 : a9 00 __ LDA #$00
50c6 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 70)
50c9 : 8d e5 bf STA $bfe5 ; (wrapbuffer + 71)
50cc : 8d e6 bf STA $bfe6 ; (wrapbuffer + 72)
50cf : 8d e7 bf STA $bfe7 ; (wrapbuffer + 73)
50d2 : a0 01 __ LDY #$01
50d4 : b1 49 __ LDA (T1 + 0),y 
50d6 : a2 20 __ LDX #$20
50d8 : 8e e0 bf STX $bfe0 ; (wrapbuffer + 66)
50db : a2 00 __ LDX #$00
50dd : 8e e1 bf STX $bfe1 ; (wrapbuffer + 67)
50e0 : ca __ __ DEX
50e1 : 8e e2 bf STX $bfe2 ; (wrapbuffer + 68)
50e4 : aa __ __ TAX
50e5 : 18 __ __ CLC
50e6 : a5 49 __ LDA T1 + 0 
50e8 : 69 02 __ ADC #$02
.l14:
50ea : 85 49 __ STA T1 + 0 
50ec : 90 02 __ BCC $50f0 ; (sformat.s1082 + 0)
.s1081:
50ee : e6 4a __ INC T1 + 1 
.s1082:
50f0 : 8a __ __ TXA
50f1 : e0 2b __ CPX #$2b
50f3 : d0 08 __ BNE $50fd ; (sformat.s17 + 0)
.s16:
50f5 : a9 01 __ LDA #$01
50f7 : 8d e5 bf STA $bfe5 ; (wrapbuffer + 71)
50fa : 4c de 53 JMP $53de ; (sformat.s264 + 0)
.s17:
50fd : c9 30 __ CMP #$30
50ff : d0 06 __ BNE $5107 ; (sformat.s20 + 0)
.s19:
5101 : 8d e0 bf STA $bfe0 ; (wrapbuffer + 66)
5104 : 4c de 53 JMP $53de ; (sformat.s264 + 0)
.s20:
5107 : e0 23 __ CPX #$23
5109 : d0 08 __ BNE $5113 ; (sformat.s23 + 0)
.s22:
510b : a9 01 __ LDA #$01
510d : 8d e7 bf STA $bfe7 ; (wrapbuffer + 73)
5110 : 4c de 53 JMP $53de ; (sformat.s264 + 0)
.s23:
5113 : e0 2d __ CPX #$2d
5115 : d0 08 __ BNE $511f ; (sformat.s15 + 0)
.s25:
5117 : a9 01 __ LDA #$01
5119 : 8d e6 bf STA $bfe6 ; (wrapbuffer + 72)
511c : 4c de 53 JMP $53de ; (sformat.s264 + 0)
.s15:
511f : 85 4c __ STA T5 + 0 
5121 : e0 30 __ CPX #$30
5123 : 90 53 __ BCC $5178 ; (sformat.s31 + 0)
.s32:
5125 : e0 3a __ CPX #$3a
5127 : b0 4f __ BCS $5178 ; (sformat.s31 + 0)
.s29:
5129 : a9 00 __ LDA #$00
512b : 85 44 __ STA T6 + 0 
512d : 85 45 __ STA T6 + 1 
512f : e0 3a __ CPX #$3a
5131 : b0 40 __ BCS $5173 ; (sformat.s35 + 0)
.l34:
5133 : a5 44 __ LDA T6 + 0 
5135 : 0a __ __ ASL
5136 : 85 1b __ STA ACCU + 0 ; (fps + 0)
5138 : a5 45 __ LDA T6 + 1 
513a : 2a __ __ ROL
513b : 06 1b __ ASL ACCU + 0 ; (fps + 0)
513d : 2a __ __ ROL
513e : aa __ __ TAX
513f : 18 __ __ CLC
5140 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
5142 : 65 44 __ ADC T6 + 0 
5144 : 85 44 __ STA T6 + 0 
5146 : 8a __ __ TXA
5147 : 65 45 __ ADC T6 + 1 
5149 : 06 44 __ ASL T6 + 0 
514b : 2a __ __ ROL
514c : aa __ __ TAX
514d : 18 __ __ CLC
514e : a5 44 __ LDA T6 + 0 
5150 : 65 4c __ ADC T5 + 0 
5152 : 90 01 __ BCC $5155 ; (sformat.s1092 + 0)
.s1091:
5154 : e8 __ __ INX
.s1092:
5155 : 38 __ __ SEC
5156 : e9 30 __ SBC #$30
5158 : 85 44 __ STA T6 + 0 
515a : 8a __ __ TXA
515b : e9 00 __ SBC #$00
515d : 85 45 __ STA T6 + 1 
515f : a0 00 __ LDY #$00
5161 : b1 49 __ LDA (T1 + 0),y 
5163 : 85 4c __ STA T5 + 0 
5165 : e6 49 __ INC T1 + 0 
5167 : d0 02 __ BNE $516b ; (sformat.s1094 + 0)
.s1093:
5169 : e6 4a __ INC T1 + 1 
.s1094:
516b : c9 30 __ CMP #$30
516d : 90 04 __ BCC $5173 ; (sformat.s35 + 0)
.s36:
516f : c9 3a __ CMP #$3a
5171 : 90 c0 __ BCC $5133 ; (sformat.l34 + 0)
.s35:
5173 : a5 44 __ LDA T6 + 0 
5175 : 8d e1 bf STA $bfe1 ; (wrapbuffer + 67)
.s31:
5178 : a5 4c __ LDA T5 + 0 
517a : c9 2e __ CMP #$2e
517c : d0 51 __ BNE $51cf ; (sformat.s39 + 0)
.s37:
517e : a9 00 __ LDA #$00
5180 : 85 44 __ STA T6 + 0 
.l243:
5182 : 85 45 __ STA T6 + 1 
5184 : a0 00 __ LDY #$00
5186 : b1 49 __ LDA (T1 + 0),y 
5188 : 85 4c __ STA T5 + 0 
518a : e6 49 __ INC T1 + 0 
518c : d0 02 __ BNE $5190 ; (sformat.s1084 + 0)
.s1083:
518e : e6 4a __ INC T1 + 1 
.s1084:
5190 : c9 30 __ CMP #$30
5192 : 90 04 __ BCC $5198 ; (sformat.s42 + 0)
.s43:
5194 : c9 3a __ CMP #$3a
5196 : 90 0a __ BCC $51a2 ; (sformat.s41 + 0)
.s42:
5198 : a5 44 __ LDA T6 + 0 
519a : 8d e2 bf STA $bfe2 ; (wrapbuffer + 68)
519d : a5 4c __ LDA T5 + 0 
519f : 4c cf 51 JMP $51cf ; (sformat.s39 + 0)
.s41:
51a2 : a5 44 __ LDA T6 + 0 
51a4 : 0a __ __ ASL
51a5 : 85 1b __ STA ACCU + 0 ; (fps + 0)
51a7 : a5 45 __ LDA T6 + 1 
51a9 : 2a __ __ ROL
51aa : 06 1b __ ASL ACCU + 0 ; (fps + 0)
51ac : 2a __ __ ROL
51ad : aa __ __ TAX
51ae : 18 __ __ CLC
51af : a5 1b __ LDA ACCU + 0 ; (fps + 0)
51b1 : 65 44 __ ADC T6 + 0 
51b3 : 85 44 __ STA T6 + 0 
51b5 : 8a __ __ TXA
51b6 : 65 45 __ ADC T6 + 1 
51b8 : 06 44 __ ASL T6 + 0 
51ba : 2a __ __ ROL
51bb : aa __ __ TAX
51bc : 18 __ __ CLC
51bd : a5 44 __ LDA T6 + 0 
51bf : 65 4c __ ADC T5 + 0 
51c1 : 90 01 __ BCC $51c4 ; (sformat.s1090 + 0)
.s1089:
51c3 : e8 __ __ INX
.s1090:
51c4 : 38 __ __ SEC
51c5 : e9 30 __ SBC #$30
51c7 : 85 44 __ STA T6 + 0 
51c9 : 8a __ __ TXA
51ca : e9 00 __ SBC #$00
51cc : 4c 82 51 JMP $5182 ; (sformat.l243 + 0)
.s39:
51cf : c9 64 __ CMP #$64
51d1 : f0 04 __ BEQ $51d7 ; (sformat.s44 + 0)
.s47:
51d3 : c9 44 __ CMP #$44
51d5 : d0 05 __ BNE $51dc ; (sformat.s45 + 0)
.s44:
51d7 : a9 01 __ LDA #$01
51d9 : 4c a2 53 JMP $53a2 ; (sformat.s261 + 0)
.s45:
51dc : c9 75 __ CMP #$75
51de : d0 03 __ BNE $51e3 ; (sformat.s51 + 0)
51e0 : 4c a0 53 JMP $53a0 ; (sformat.s291 + 0)
.s51:
51e3 : c9 55 __ CMP #$55
51e5 : d0 03 __ BNE $51ea ; (sformat.s49 + 0)
51e7 : 4c a0 53 JMP $53a0 ; (sformat.s291 + 0)
.s49:
51ea : c9 78 __ CMP #$78
51ec : f0 04 __ BEQ $51f2 ; (sformat.s52 + 0)
.s55:
51ee : c9 58 __ CMP #$58
51f0 : d0 0d __ BNE $51ff ; (sformat.s53 + 0)
.s52:
51f2 : a9 10 __ LDA #$10
51f4 : 8d e3 bf STA $bfe3 ; (wrapbuffer + 69)
51f7 : a9 00 __ LDA #$00
51f9 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 70)
51fc : 4c a0 53 JMP $53a0 ; (sformat.s291 + 0)
.s53:
51ff : c9 6c __ CMP #$6c
5201 : d0 03 __ BNE $5206 ; (sformat.s59 + 0)
5203 : 4c 17 53 JMP $5317 ; (sformat.s56 + 0)
.s59:
5206 : c9 4c __ CMP #$4c
5208 : d0 03 __ BNE $520d ; (sformat.s57 + 0)
520a : 4c 17 53 JMP $5317 ; (sformat.s56 + 0)
.s57:
520d : c9 73 __ CMP #$73
520f : f0 54 __ BEQ $5265 ; (sformat.s72 + 0)
.s75:
5211 : c9 53 __ CMP #$53
5213 : f0 50 __ BEQ $5265 ; (sformat.s72 + 0)
.s73:
5215 : c9 63 __ CMP #$63
5217 : f0 23 __ BEQ $523c ; (sformat.s103 + 0)
.s106:
5219 : c9 43 __ CMP #$43
521b : f0 1f __ BEQ $523c ; (sformat.s103 + 0)
.s104:
521d : 09 00 __ ORA #$00
521f : d0 03 __ BNE $5224 ; (sformat.s107 + 0)
5221 : 4c 0f 50 JMP $500f ; (sformat.l1 + 0)
.s107:
5224 : 18 __ __ CLC
5225 : a5 16 __ LDA P9 ; (buff + 0)
5227 : 65 47 __ ADC T0 + 0 
5229 : 85 44 __ STA T6 + 0 
522b : a5 17 __ LDA P10 ; (buff + 1)
522d : 69 00 __ ADC #$00
522f : 85 45 __ STA T6 + 1 
5231 : a5 4c __ LDA T5 + 0 
.s1068:
5233 : a0 00 __ LDY #$00
5235 : 91 44 __ STA (T6 + 0),y 
5237 : e6 47 __ INC T0 + 0 
5239 : 4c 0f 50 JMP $500f ; (sformat.l1 + 0)
.s103:
523c : ad fa bf LDA $bffa ; (sstack + 2)
523f : 85 4c __ STA T5 + 0 
5241 : 18 __ __ CLC
5242 : 69 02 __ ADC #$02
5244 : 8d fa bf STA $bffa ; (sstack + 2)
5247 : ad fb bf LDA $bffb ; (sstack + 3)
524a : 85 4d __ STA T5 + 1 
524c : 69 00 __ ADC #$00
524e : 8d fb bf STA $bffb ; (sstack + 3)
5251 : 18 __ __ CLC
5252 : a5 16 __ LDA P9 ; (buff + 0)
5254 : 65 47 __ ADC T0 + 0 
5256 : 85 44 __ STA T6 + 0 
5258 : a5 17 __ LDA P10 ; (buff + 1)
525a : 69 00 __ ADC #$00
525c : 85 45 __ STA T6 + 1 
525e : a0 00 __ LDY #$00
5260 : b1 4c __ LDA (T5 + 0),y 
5262 : 4c 33 52 JMP $5233 ; (sformat.s1068 + 0)
.s72:
5265 : ad fa bf LDA $bffa ; (sstack + 2)
5268 : 85 4c __ STA T5 + 0 
526a : 18 __ __ CLC
526b : 69 02 __ ADC #$02
526d : 8d fa bf STA $bffa ; (sstack + 2)
5270 : ad fb bf LDA $bffb ; (sstack + 3)
5273 : 85 4d __ STA T5 + 1 
5275 : 69 00 __ ADC #$00
5277 : 8d fb bf STA $bffb ; (sstack + 3)
527a : a0 00 __ LDY #$00
527c : 84 4b __ STY T3 + 0 
527e : b1 4c __ LDA (T5 + 0),y 
5280 : aa __ __ TAX
5281 : c8 __ __ INY
5282 : b1 4c __ LDA (T5 + 0),y 
5284 : 86 4c __ STX T5 + 0 
5286 : 85 4d __ STA T5 + 1 
5288 : ad e1 bf LDA $bfe1 ; (wrapbuffer + 67)
528b : f0 0c __ BEQ $5299 ; (sformat.s78 + 0)
.s1073:
528d : 88 __ __ DEY
528e : b1 4c __ LDA (T5 + 0),y 
5290 : f0 05 __ BEQ $5297 ; (sformat.s1074 + 0)
.l80:
5292 : c8 __ __ INY
5293 : b1 4c __ LDA (T5 + 0),y 
5295 : d0 fb __ BNE $5292 ; (sformat.l80 + 0)
.s1074:
5297 : 84 4b __ STY T3 + 0 
.s78:
5299 : ad e6 bf LDA $bfe6 ; (wrapbuffer + 72)
529c : d0 19 __ BNE $52b7 ; (sformat.s84 + 0)
.s1077:
529e : a6 4b __ LDX T3 + 0 
52a0 : ec e1 bf CPX $bfe1 ; (wrapbuffer + 67)
52a3 : a4 47 __ LDY T0 + 0 
52a5 : b0 0c __ BCS $52b3 ; (sformat.s1078 + 0)
.l86:
52a7 : ad e0 bf LDA $bfe0 ; (wrapbuffer + 66)
52aa : 91 16 __ STA (P9),y ; (buff + 0)
52ac : e8 __ __ INX
52ad : ec e1 bf CPX $bfe1 ; (wrapbuffer + 67)
52b0 : c8 __ __ INY
52b1 : 90 f4 __ BCC $52a7 ; (sformat.l86 + 0)
.s1078:
52b3 : 86 4b __ STX T3 + 0 
52b5 : 84 47 __ STY T0 + 0 
.s84:
52b7 : ad fc bf LDA $bffc ; (sstack + 4)
52ba : d0 37 __ BNE $52f3 ; (sformat.s88 + 0)
.l94:
52bc : a0 00 __ LDY #$00
52be : b1 4c __ LDA (T5 + 0),y 
52c0 : f0 0f __ BEQ $52d1 ; (sformat.s251 + 0)
.s95:
52c2 : a4 47 __ LDY T0 + 0 
52c4 : 91 16 __ STA (P9),y ; (buff + 0)
52c6 : e6 47 __ INC T0 + 0 
52c8 : e6 4c __ INC T5 + 0 
52ca : d0 f0 __ BNE $52bc ; (sformat.l94 + 0)
.s1087:
52cc : e6 4d __ INC T5 + 1 
52ce : 4c bc 52 JMP $52bc ; (sformat.l94 + 0)
.s251:
52d1 : ad e6 bf LDA $bfe6 ; (wrapbuffer + 72)
52d4 : d0 03 __ BNE $52d9 ; (sformat.s1075 + 0)
52d6 : 4c 0f 50 JMP $500f ; (sformat.l1 + 0)
.s1075:
52d9 : a6 4b __ LDX T3 + 0 
52db : ec e1 bf CPX $bfe1 ; (wrapbuffer + 67)
52de : a4 47 __ LDY T0 + 0 
52e0 : b0 0c __ BCS $52ee ; (sformat.s1076 + 0)
.l101:
52e2 : ad e0 bf LDA $bfe0 ; (wrapbuffer + 66)
52e5 : 91 16 __ STA (P9),y ; (buff + 0)
52e7 : e8 __ __ INX
52e8 : ec e1 bf CPX $bfe1 ; (wrapbuffer + 67)
52eb : c8 __ __ INY
52ec : 90 f4 __ BCC $52e2 ; (sformat.l101 + 0)
.s1076:
52ee : 84 47 __ STY T0 + 0 
52f0 : 4c 0f 50 JMP $500f ; (sformat.l1 + 0)
.s88:
52f3 : a5 47 __ LDA T0 + 0 
52f5 : f0 1a __ BEQ $5311 ; (sformat.s93 + 0)
.s91:
52f7 : a5 16 __ LDA P9 ; (buff + 0)
52f9 : 85 0d __ STA P0 
52fb : a5 17 __ LDA P10 ; (buff + 1)
52fd : 85 0e __ STA P1 
52ff : a9 00 __ LDA #$00
5301 : a4 47 __ LDY T0 + 0 
5303 : 91 16 __ STA (P9),y ; (buff + 0)
5305 : 20 f3 53 JSR $53f3 ; (puts.s0 + 0)
5308 : 20 eb 53 JSR $53eb ; (puts@proxy + 0)
530b : a9 00 __ LDA #$00
530d : 85 47 __ STA T0 + 0 
530f : f0 c0 __ BEQ $52d1 ; (sformat.s251 + 0)
.s93:
5311 : 20 eb 53 JSR $53eb ; (puts@proxy + 0)
5314 : 4c d1 52 JMP $52d1 ; (sformat.s251 + 0)
.s56:
5317 : ad fa bf LDA $bffa ; (sstack + 2)
531a : 85 4c __ STA T5 + 0 
531c : 18 __ __ CLC
531d : 69 04 __ ADC #$04
531f : 8d fa bf STA $bffa ; (sstack + 2)
5322 : ad fb bf LDA $bffb ; (sstack + 3)
5325 : 85 4d __ STA T5 + 1 
5327 : 69 00 __ ADC #$00
5329 : 8d fb bf STA $bffb ; (sstack + 3)
532c : a0 00 __ LDY #$00
532e : b1 49 __ LDA (T1 + 0),y 
5330 : aa __ __ TAX
5331 : e6 49 __ INC T1 + 0 
5333 : d0 02 __ BNE $5337 ; (sformat.s1086 + 0)
.s1085:
5335 : e6 4a __ INC T1 + 1 
.s1086:
5337 : b1 4c __ LDA (T5 + 0),y 
5339 : 85 53 __ STA T7 + 0 
533b : a0 01 __ LDY #$01
533d : b1 4c __ LDA (T5 + 0),y 
533f : 85 54 __ STA T7 + 1 
5341 : c8 __ __ INY
5342 : b1 4c __ LDA (T5 + 0),y 
5344 : 85 55 __ STA T7 + 2 
5346 : c8 __ __ INY
5347 : b1 4c __ LDA (T5 + 0),y 
5349 : a8 __ __ TAY
534a : 8a __ __ TXA
534b : e0 64 __ CPX #$64
534d : f0 04 __ BEQ $5353 ; (sformat.s60 + 0)
.s63:
534f : c9 44 __ CMP #$44
5351 : d0 04 __ BNE $5357 ; (sformat.s61 + 0)
.s60:
5353 : a9 01 __ LDA #$01
5355 : d0 1f __ BNE $5376 ; (sformat.s262 + 0)
.s61:
5357 : c9 75 __ CMP #$75
5359 : f0 19 __ BEQ $5374 ; (sformat.s292 + 0)
.s67:
535b : c9 55 __ CMP #$55
535d : f0 15 __ BEQ $5374 ; (sformat.s292 + 0)
.s65:
535f : c9 78 __ CMP #$78
5361 : f0 07 __ BEQ $536a ; (sformat.s68 + 0)
.s71:
5363 : c9 58 __ CMP #$58
5365 : f0 03 __ BEQ $536a ; (sformat.s68 + 0)
5367 : 4c 0f 50 JMP $500f ; (sformat.l1 + 0)
.s68:
536a : a9 10 __ LDA #$10
536c : 8d e3 bf STA $bfe3 ; (wrapbuffer + 69)
536f : a9 00 __ LDA #$00
5371 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 70)
.s292:
5374 : a9 00 __ LDA #$00
.s262:
5376 : 84 14 __ STY P7 
5378 : 85 15 __ STA P8 
537a : a5 16 __ LDA P9 ; (buff + 0)
537c : 85 0f __ STA P2 
537e : a5 17 __ LDA P10 ; (buff + 1)
5380 : 85 10 __ STA P3 
5382 : a5 53 __ LDA T7 + 0 
5384 : 85 11 __ STA P4 
5386 : a5 54 __ LDA T7 + 1 
5388 : 85 12 __ STA P5 
538a : a5 55 __ LDA T7 + 2 
538c : 85 13 __ STA P6 
538e : a9 e0 __ LDA #$e0
5390 : 85 0d __ STA P0 
5392 : a9 bf __ LDA #$bf
5394 : 85 0e __ STA P1 
5396 : 20 7d 55 JSR $557d ; (nforml.s0 + 0)
.s1069:
5399 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
539b : 85 47 __ STA T0 + 0 
539d : 4c 0f 50 JMP $500f ; (sformat.l1 + 0)
.s291:
53a0 : a9 00 __ LDA #$00
.s261:
53a2 : 85 13 __ STA P6 
53a4 : a5 16 __ LDA P9 ; (buff + 0)
53a6 : 85 0f __ STA P2 
53a8 : a5 17 __ LDA P10 ; (buff + 1)
53aa : 85 10 __ STA P3 
53ac : ad fa bf LDA $bffa ; (sstack + 2)
53af : 85 47 __ STA T0 + 0 
53b1 : ad fb bf LDA $bffb ; (sstack + 3)
53b4 : 85 48 __ STA T0 + 1 
53b6 : a0 00 __ LDY #$00
53b8 : b1 47 __ LDA (T0 + 0),y 
53ba : 85 11 __ STA P4 
53bc : c8 __ __ INY
53bd : b1 47 __ LDA (T0 + 0),y 
53bf : 85 12 __ STA P5 
53c1 : 18 __ __ CLC
53c2 : a5 47 __ LDA T0 + 0 
53c4 : 69 02 __ ADC #$02
53c6 : 8d fa bf STA $bffa ; (sstack + 2)
53c9 : a5 48 __ LDA T0 + 1 
53cb : 69 00 __ ADC #$00
53cd : 8d fb bf STA $bffb ; (sstack + 3)
53d0 : a9 e0 __ LDA #$e0
53d2 : 85 0d __ STA P0 
53d4 : a9 bf __ LDA #$bf
53d6 : 85 0e __ STA P1 
53d8 : 20 48 54 JSR $5448 ; (nformi.s0 + 0)
53db : 4c 99 53 JMP $5399 ; (sformat.s1069 + 0)
.s264:
53de : a0 00 __ LDY #$00
53e0 : b1 49 __ LDA (T1 + 0),y 
53e2 : aa __ __ TAX
53e3 : 18 __ __ CLC
53e4 : a5 49 __ LDA T1 + 0 
53e6 : 69 01 __ ADC #$01
53e8 : 4c ea 50 JMP $50ea ; (sformat.l14 + 0)
--------------------------------------------------------------------
puts@proxy: ; puts@proxy
53eb : a5 4c __ LDA $4c 
53ed : 85 0d __ STA P0 
53ef : a5 4d __ LDA $4d 
53f1 : 85 0e __ STA P1 
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
53f3 : a0 00 __ LDY #$00
53f5 : b1 0d __ LDA (P0),y 
53f7 : f0 0b __ BEQ $5404 ; (puts.s1001 + 0)
53f9 : 20 05 54 JSR $5405 ; (putpch + 0)
53fc : e6 0d __ INC P0 
53fe : d0 f3 __ BNE $53f3 ; (puts.s0 + 0)
5400 : e6 0e __ INC P1 
5402 : d0 ef __ BNE $53f3 ; (puts.s0 + 0)
.s1001:
5404 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
5405 : ae fe 6e LDX $6efe ; (giocharmap + 0)
5408 : e0 01 __ CPX #$01
540a : 90 26 __ BCC $5432 ; (putpch + 45)
540c : c9 0a __ CMP #$0a
540e : d0 02 __ BNE $5412 ; (putpch + 13)
5410 : a9 0d __ LDA #$0d
5412 : c9 09 __ CMP #$09
5414 : f0 1f __ BEQ $5435 ; (putpch + 48)
5416 : e0 02 __ CPX #$02
5418 : 90 18 __ BCC $5432 ; (putpch + 45)
541a : c9 41 __ CMP #$41
541c : 90 14 __ BCC $5432 ; (putpch + 45)
541e : c9 7b __ CMP #$7b
5420 : b0 10 __ BCS $5432 ; (putpch + 45)
5422 : c9 61 __ CMP #$61
5424 : b0 04 __ BCS $542a ; (putpch + 37)
5426 : c9 5b __ CMP #$5b
5428 : b0 08 __ BCS $5432 ; (putpch + 45)
542a : 49 20 __ EOR #$20
542c : e0 03 __ CPX #$03
542e : f0 02 __ BEQ $5432 ; (putpch + 45)
5430 : 29 df __ AND #$df
5432 : 4c d2 ff JMP $ffd2 
5435 : 38 __ __ SEC
5436 : 20 f0 ff JSR $fff0 
5439 : 98 __ __ TYA
543a : 29 03 __ AND #$03
543c : 49 03 __ EOR #$03
543e : aa __ __ TAX
543f : a9 20 __ LDA #$20
5441 : 20 d2 ff JSR $ffd2 
5444 : ca __ __ DEX
5445 : 10 fa __ BPL $5441 ; (putpch + 60)
5447 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
5448 : a9 00 __ LDA #$00
544a : 85 43 __ STA T0 + 0 
544c : a5 13 __ LDA P6 ; (s + 0)
544e : f0 13 __ BEQ $5463 ; (nformi.s182 + 0)
.s4:
5450 : 24 12 __ BIT P5 ; (v + 1)
5452 : 10 0f __ BPL $5463 ; (nformi.s182 + 0)
.s1:
5454 : 38 __ __ SEC
5455 : a9 00 __ LDA #$00
5457 : e5 11 __ SBC P4 ; (v + 0)
5459 : 85 11 __ STA P4 ; (v + 0)
545b : a9 00 __ LDA #$00
545d : e5 12 __ SBC P5 ; (v + 1)
545f : 85 12 __ STA P5 ; (v + 1)
5461 : e6 43 __ INC T0 + 0 
.s182:
5463 : a9 10 __ LDA #$10
5465 : 85 44 __ STA T2 + 0 
5467 : a5 11 __ LDA P4 ; (v + 0)
5469 : 05 12 __ ORA P5 ; (v + 1)
546b : f0 46 __ BEQ $54b3 ; (nformi.s7 + 0)
.s42:
546d : a0 03 __ LDY #$03
546f : b1 0d __ LDA (P0),y ; (si + 0)
5471 : 85 45 __ STA T4 + 0 
5473 : c8 __ __ INY
5474 : b1 0d __ LDA (P0),y ; (si + 0)
5476 : 85 46 __ STA T4 + 1 
.l6:
5478 : a5 11 __ LDA P4 ; (v + 0)
547a : 85 1b __ STA ACCU + 0 
547c : a5 12 __ LDA P5 ; (v + 1)
547e : 85 1c __ STA ACCU + 1 
5480 : a5 45 __ LDA T4 + 0 
5482 : 85 03 __ STA WORK + 0 
5484 : a5 46 __ LDA T4 + 1 
5486 : 85 04 __ STA WORK + 1 
5488 : 20 45 7d JSR $7d45 ; (divmod + 0)
548b : a5 06 __ LDA WORK + 3 
548d : 30 08 __ BMI $5497 ; (nformi.s78 + 0)
.s1019:
548f : d0 0a __ BNE $549b ; (nformi.s77 + 0)
.s1018:
5491 : a5 05 __ LDA WORK + 2 
5493 : c9 0a __ CMP #$0a
5495 : b0 04 __ BCS $549b ; (nformi.s77 + 0)
.s78:
5497 : a9 30 __ LDA #$30
5499 : d0 02 __ BNE $549d ; (nformi.s79 + 0)
.s77:
549b : a9 37 __ LDA #$37
.s79:
549d : 18 __ __ CLC
549e : 65 05 __ ADC WORK + 2 
54a0 : c6 44 __ DEC T2 + 0 
54a2 : a6 44 __ LDX T2 + 0 
54a4 : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
54a7 : a5 1b __ LDA ACCU + 0 
54a9 : 85 11 __ STA P4 ; (v + 0)
54ab : a5 1c __ LDA ACCU + 1 
54ad : 85 12 __ STA P5 ; (v + 1)
54af : 05 11 __ ORA P4 ; (v + 0)
54b1 : d0 c5 __ BNE $5478 ; (nformi.l6 + 0)
.s7:
54b3 : a0 02 __ LDY #$02
54b5 : b1 0d __ LDA (P0),y ; (si + 0)
54b7 : c9 ff __ CMP #$ff
54b9 : d0 04 __ BNE $54bf ; (nformi.s80 + 0)
.s81:
54bb : a9 0f __ LDA #$0f
54bd : d0 05 __ BNE $54c4 ; (nformi.s1026 + 0)
.s80:
54bf : 38 __ __ SEC
54c0 : a9 10 __ LDA #$10
54c2 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
54c4 : a8 __ __ TAY
54c5 : c4 44 __ CPY T2 + 0 
54c7 : b0 0d __ BCS $54d6 ; (nformi.s10 + 0)
.s9:
54c9 : a9 30 __ LDA #$30
.l1027:
54cb : c6 44 __ DEC T2 + 0 
54cd : a6 44 __ LDX T2 + 0 
54cf : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
54d2 : c4 44 __ CPY T2 + 0 
54d4 : 90 f5 __ BCC $54cb ; (nformi.l1027 + 0)
.s10:
54d6 : a0 07 __ LDY #$07
54d8 : b1 0d __ LDA (P0),y ; (si + 0)
54da : f0 20 __ BEQ $54fc ; (nformi.s13 + 0)
.s14:
54dc : a0 04 __ LDY #$04
54de : b1 0d __ LDA (P0),y ; (si + 0)
54e0 : d0 1a __ BNE $54fc ; (nformi.s13 + 0)
.s1013:
54e2 : 88 __ __ DEY
54e3 : b1 0d __ LDA (P0),y ; (si + 0)
54e5 : c9 10 __ CMP #$10
54e7 : d0 13 __ BNE $54fc ; (nformi.s13 + 0)
.s11:
54e9 : a9 58 __ LDA #$58
54eb : a6 44 __ LDX T2 + 0 
54ed : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 73)
54f0 : 8a __ __ TXA
54f1 : 18 __ __ CLC
54f2 : 69 fe __ ADC #$fe
54f4 : 85 44 __ STA T2 + 0 
54f6 : aa __ __ TAX
54f7 : a9 30 __ LDA #$30
54f9 : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
.s13:
54fc : a9 00 __ LDA #$00
54fe : 85 1b __ STA ACCU + 0 
5500 : a5 43 __ LDA T0 + 0 
5502 : f0 06 __ BEQ $550a ; (nformi.s16 + 0)
.s15:
5504 : c6 44 __ DEC T2 + 0 
5506 : a9 2d __ LDA #$2d
5508 : d0 0a __ BNE $5514 ; (nformi.s1025 + 0)
.s16:
550a : a0 05 __ LDY #$05
550c : b1 0d __ LDA (P0),y ; (si + 0)
550e : f0 09 __ BEQ $5519 ; (nformi.s163 + 0)
.s18:
5510 : c6 44 __ DEC T2 + 0 
5512 : a9 2b __ LDA #$2b
.s1025:
5514 : a6 44 __ LDX T2 + 0 
5516 : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
.s163:
5519 : a0 06 __ LDY #$06
551b : b1 0d __ LDA (P0),y ; (si + 0)
551d : d0 33 __ BNE $5552 ; (nformi.s24 + 0)
.l30:
551f : a0 01 __ LDY #$01
5521 : b1 0d __ LDA (P0),y ; (si + 0)
5523 : 18 __ __ CLC
5524 : 65 44 __ ADC T2 + 0 
5526 : b0 04 __ BCS $552c ; (nformi.s31 + 0)
.s1006:
5528 : c9 11 __ CMP #$11
552a : 90 0d __ BCC $5539 ; (nformi.s33 + 0)
.s31:
552c : c6 44 __ DEC T2 + 0 
552e : a0 00 __ LDY #$00
5530 : b1 0d __ LDA (P0),y ; (si + 0)
5532 : a6 44 __ LDX T2 + 0 
5534 : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
5537 : b0 e6 __ BCS $551f ; (nformi.l30 + 0)
.s33:
5539 : a6 44 __ LDX T2 + 0 
553b : e0 10 __ CPX #$10
553d : b0 0e __ BCS $554d ; (nformi.s23 + 0)
.s34:
553f : 88 __ __ DEY
.l1022:
5540 : bd e8 bf LDA $bfe8,x ; (wrapbuffer + 74)
5543 : 91 0f __ STA (P2),y ; (str + 0)
5545 : e8 __ __ INX
5546 : e0 10 __ CPX #$10
5548 : c8 __ __ INY
5549 : 90 f5 __ BCC $5540 ; (nformi.l1022 + 0)
.s1023:
554b : 84 1b __ STY ACCU + 0 
.s23:
554d : a9 00 __ LDA #$00
554f : 85 1c __ STA ACCU + 1 
.s1001:
5551 : 60 __ __ RTS
.s24:
5552 : a6 44 __ LDX T2 + 0 
5554 : e0 10 __ CPX #$10
5556 : b0 1a __ BCS $5572 ; (nformi.l27 + 0)
.s25:
5558 : a0 00 __ LDY #$00
.l1020:
555a : bd e8 bf LDA $bfe8,x ; (wrapbuffer + 74)
555d : 91 0f __ STA (P2),y ; (str + 0)
555f : e8 __ __ INX
5560 : e0 10 __ CPX #$10
5562 : c8 __ __ INY
5563 : 90 f5 __ BCC $555a ; (nformi.l1020 + 0)
.s1021:
5565 : 84 1b __ STY ACCU + 0 
5567 : b0 09 __ BCS $5572 ; (nformi.l27 + 0)
.s28:
5569 : 88 __ __ DEY
556a : b1 0d __ LDA (P0),y ; (si + 0)
556c : a4 1b __ LDY ACCU + 0 
556e : 91 0f __ STA (P2),y ; (str + 0)
5570 : e6 1b __ INC ACCU + 0 
.l27:
5572 : a5 1b __ LDA ACCU + 0 
5574 : a0 01 __ LDY #$01
5576 : d1 0d __ CMP (P0),y ; (si + 0)
5578 : 90 ef __ BCC $5569 ; (nformi.s28 + 0)
557a : 4c 4d 55 JMP $554d ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
557d : a9 00 __ LDA #$00
557f : 85 43 __ STA T0 + 0 
5581 : a5 15 __ LDA P8 ; (s + 0)
5583 : f0 21 __ BEQ $55a6 ; (nforml.s182 + 0)
.s4:
5585 : a5 14 __ LDA P7 ; (v + 3)
5587 : f0 1d __ BEQ $55a6 ; (nforml.s182 + 0)
.s1032:
5589 : 10 1b __ BPL $55a6 ; (nforml.s182 + 0)
.s1:
558b : 38 __ __ SEC
558c : a9 00 __ LDA #$00
558e : e5 11 __ SBC P4 ; (v + 0)
5590 : 85 11 __ STA P4 ; (v + 0)
5592 : a9 00 __ LDA #$00
5594 : e5 12 __ SBC P5 ; (v + 1)
5596 : 85 12 __ STA P5 ; (v + 1)
5598 : a9 00 __ LDA #$00
559a : e5 13 __ SBC P6 ; (v + 2)
559c : 85 13 __ STA P6 ; (v + 2)
559e : a9 00 __ LDA #$00
55a0 : e5 14 __ SBC P7 ; (v + 3)
55a2 : 85 14 __ STA P7 ; (v + 3)
55a4 : e6 43 __ INC T0 + 0 
.s182:
55a6 : a9 10 __ LDA #$10
55a8 : 85 44 __ STA T2 + 0 
55aa : a5 14 __ LDA P7 ; (v + 3)
55ac : d0 0c __ BNE $55ba ; (nforml.s42 + 0)
.s1024:
55ae : a5 13 __ LDA P6 ; (v + 2)
55b0 : d0 08 __ BNE $55ba ; (nforml.s42 + 0)
.s1025:
55b2 : a5 12 __ LDA P5 ; (v + 1)
55b4 : d0 04 __ BNE $55ba ; (nforml.s42 + 0)
.s1026:
55b6 : c5 11 __ CMP P4 ; (v + 0)
55b8 : b0 0e __ BCS $55c8 ; (nforml.s7 + 0)
.s42:
55ba : a0 03 __ LDY #$03
55bc : b1 0d __ LDA (P0),y ; (si + 0)
55be : 85 45 __ STA T5 + 0 
55c0 : c8 __ __ INY
55c1 : b1 0d __ LDA (P0),y ; (si + 0)
55c3 : 85 46 __ STA T5 + 1 
55c5 : 4c 92 56 JMP $5692 ; (nforml.l6 + 0)
.s7:
55c8 : a0 02 __ LDY #$02
55ca : b1 0d __ LDA (P0),y ; (si + 0)
55cc : c9 ff __ CMP #$ff
55ce : d0 04 __ BNE $55d4 ; (nforml.s80 + 0)
.s81:
55d0 : a9 0f __ LDA #$0f
55d2 : d0 05 __ BNE $55d9 ; (nforml.s1039 + 0)
.s80:
55d4 : 38 __ __ SEC
55d5 : a9 10 __ LDA #$10
55d7 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
55d9 : a8 __ __ TAY
55da : c4 44 __ CPY T2 + 0 
55dc : b0 0d __ BCS $55eb ; (nforml.s10 + 0)
.s9:
55de : a9 30 __ LDA #$30
.l1040:
55e0 : c6 44 __ DEC T2 + 0 
55e2 : a6 44 __ LDX T2 + 0 
55e4 : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
55e7 : c4 44 __ CPY T2 + 0 
55e9 : 90 f5 __ BCC $55e0 ; (nforml.l1040 + 0)
.s10:
55eb : a0 07 __ LDY #$07
55ed : b1 0d __ LDA (P0),y ; (si + 0)
55ef : f0 20 __ BEQ $5611 ; (nforml.s13 + 0)
.s14:
55f1 : a0 04 __ LDY #$04
55f3 : b1 0d __ LDA (P0),y ; (si + 0)
55f5 : d0 1a __ BNE $5611 ; (nforml.s13 + 0)
.s1013:
55f7 : 88 __ __ DEY
55f8 : b1 0d __ LDA (P0),y ; (si + 0)
55fa : c9 10 __ CMP #$10
55fc : d0 13 __ BNE $5611 ; (nforml.s13 + 0)
.s11:
55fe : a9 58 __ LDA #$58
5600 : a6 44 __ LDX T2 + 0 
5602 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 73)
5605 : 8a __ __ TXA
5606 : 18 __ __ CLC
5607 : 69 fe __ ADC #$fe
5609 : 85 44 __ STA T2 + 0 
560b : aa __ __ TAX
560c : a9 30 __ LDA #$30
560e : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
.s13:
5611 : a9 00 __ LDA #$00
5613 : 85 1b __ STA ACCU + 0 
5615 : a5 43 __ LDA T0 + 0 
5617 : f0 06 __ BEQ $561f ; (nforml.s16 + 0)
.s15:
5619 : c6 44 __ DEC T2 + 0 
561b : a9 2d __ LDA #$2d
561d : d0 0a __ BNE $5629 ; (nforml.s1038 + 0)
.s16:
561f : a0 05 __ LDY #$05
5621 : b1 0d __ LDA (P0),y ; (si + 0)
5623 : f0 09 __ BEQ $562e ; (nforml.s163 + 0)
.s18:
5625 : c6 44 __ DEC T2 + 0 
5627 : a9 2b __ LDA #$2b
.s1038:
5629 : a6 44 __ LDX T2 + 0 
562b : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
.s163:
562e : a0 06 __ LDY #$06
5630 : b1 0d __ LDA (P0),y ; (si + 0)
5632 : d0 33 __ BNE $5667 ; (nforml.s24 + 0)
.l30:
5634 : a0 01 __ LDY #$01
5636 : b1 0d __ LDA (P0),y ; (si + 0)
5638 : 18 __ __ CLC
5639 : 65 44 __ ADC T2 + 0 
563b : b0 04 __ BCS $5641 ; (nforml.s31 + 0)
.s1006:
563d : c9 11 __ CMP #$11
563f : 90 0d __ BCC $564e ; (nforml.s33 + 0)
.s31:
5641 : c6 44 __ DEC T2 + 0 
5643 : a0 00 __ LDY #$00
5645 : b1 0d __ LDA (P0),y ; (si + 0)
5647 : a6 44 __ LDX T2 + 0 
5649 : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
564c : b0 e6 __ BCS $5634 ; (nforml.l30 + 0)
.s33:
564e : a6 44 __ LDX T2 + 0 
5650 : e0 10 __ CPX #$10
5652 : b0 0e __ BCS $5662 ; (nforml.s23 + 0)
.s34:
5654 : 88 __ __ DEY
.l1035:
5655 : bd e8 bf LDA $bfe8,x ; (wrapbuffer + 74)
5658 : 91 0f __ STA (P2),y ; (str + 0)
565a : e8 __ __ INX
565b : e0 10 __ CPX #$10
565d : c8 __ __ INY
565e : 90 f5 __ BCC $5655 ; (nforml.l1035 + 0)
.s1036:
5660 : 84 1b __ STY ACCU + 0 
.s23:
5662 : a9 00 __ LDA #$00
5664 : 85 1c __ STA ACCU + 1 
.s1001:
5666 : 60 __ __ RTS
.s24:
5667 : a6 44 __ LDX T2 + 0 
5669 : e0 10 __ CPX #$10
566b : b0 1a __ BCS $5687 ; (nforml.l27 + 0)
.s25:
566d : a0 00 __ LDY #$00
.l1033:
566f : bd e8 bf LDA $bfe8,x ; (wrapbuffer + 74)
5672 : 91 0f __ STA (P2),y ; (str + 0)
5674 : e8 __ __ INX
5675 : e0 10 __ CPX #$10
5677 : c8 __ __ INY
5678 : 90 f5 __ BCC $566f ; (nforml.l1033 + 0)
.s1034:
567a : 84 1b __ STY ACCU + 0 
567c : b0 09 __ BCS $5687 ; (nforml.l27 + 0)
.s28:
567e : 88 __ __ DEY
567f : b1 0d __ LDA (P0),y ; (si + 0)
5681 : a4 1b __ LDY ACCU + 0 
5683 : 91 0f __ STA (P2),y ; (str + 0)
5685 : e6 1b __ INC ACCU + 0 
.l27:
5687 : a5 1b __ LDA ACCU + 0 
5689 : a0 01 __ LDY #$01
568b : d1 0d __ CMP (P0),y ; (si + 0)
568d : 90 ef __ BCC $567e ; (nforml.s28 + 0)
568f : 4c 62 56 JMP $5662 ; (nforml.s23 + 0)
.l6:
5692 : a5 11 __ LDA P4 ; (v + 0)
5694 : 85 1b __ STA ACCU + 0 
5696 : a5 12 __ LDA P5 ; (v + 1)
5698 : 85 1c __ STA ACCU + 1 
569a : a5 13 __ LDA P6 ; (v + 2)
569c : 85 1d __ STA ACCU + 2 
569e : a5 14 __ LDA P7 ; (v + 3)
56a0 : 85 1e __ STA ACCU + 3 
56a2 : a5 45 __ LDA T5 + 0 
56a4 : 85 03 __ STA WORK + 0 
56a6 : a5 46 __ LDA T5 + 1 
56a8 : 85 04 __ STA WORK + 1 
56aa : a9 00 __ LDA #$00
56ac : 85 05 __ STA WORK + 2 
56ae : 85 06 __ STA WORK + 3 
56b0 : 20 ca 7d JSR $7dca ; (divmod32 + 0)
56b3 : a5 08 __ LDA WORK + 5 
56b5 : 30 08 __ BMI $56bf ; (nforml.s78 + 0)
.s1023:
56b7 : d0 0a __ BNE $56c3 ; (nforml.s77 + 0)
.s1022:
56b9 : a5 07 __ LDA WORK + 4 
56bb : c9 0a __ CMP #$0a
56bd : b0 04 __ BCS $56c3 ; (nforml.s77 + 0)
.s78:
56bf : a9 30 __ LDA #$30
56c1 : d0 02 __ BNE $56c5 ; (nforml.s79 + 0)
.s77:
56c3 : a9 37 __ LDA #$37
.s79:
56c5 : 18 __ __ CLC
56c6 : 65 07 __ ADC WORK + 4 
56c8 : c6 44 __ DEC T2 + 0 
56ca : a6 44 __ LDX T2 + 0 
56cc : 9d e8 bf STA $bfe8,x ; (wrapbuffer + 74)
56cf : a5 1b __ LDA ACCU + 0 
56d1 : 85 11 __ STA P4 ; (v + 0)
56d3 : a5 1c __ LDA ACCU + 1 
56d5 : 85 12 __ STA P5 ; (v + 1)
56d7 : a5 1d __ LDA ACCU + 2 
56d9 : 85 13 __ STA P6 ; (v + 2)
56db : a5 1e __ LDA ACCU + 3 
56dd : 85 14 __ STA P7 ; (v + 3)
56df : d0 b1 __ BNE $5692 ; (nforml.l6 + 0)
.s1018:
56e1 : a5 13 __ LDA P6 ; (v + 2)
56e3 : d0 ad __ BNE $5692 ; (nforml.l6 + 0)
.s1019:
56e5 : a5 12 __ LDA P5 ; (v + 1)
56e7 : d0 a9 __ BNE $5692 ; (nforml.l6 + 0)
.s1020:
56e9 : c5 11 __ CMP P4 ; (v + 0)
56eb : 90 a5 __ BCC $5692 ; (nforml.l6 + 0)
56ed : 4c c8 55 JMP $55c8 ; (nforml.s7 + 0)
--------------------------------------------------------------------
getch: ; getch()->u8
.s0:
56f0 : 20 2b 57 JSR $572b ; (getpch + 0)
56f3 : c9 00 __ CMP #$00
56f5 : f0 f9 __ BEQ $56f0 ; (getch.s0 + 0)
56f7 : 85 1b __ STA ACCU + 0 
.s1001:
56f9 : a5 1b __ LDA ACCU + 0 
56fb : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
56fc : 4c 81 ff JMP $ff81 
--------------------------------------------------------------------
56ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
5700 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
5710 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
5720 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getpch: ; getpch
572b : 20 e4 ff JSR $ffe4 
572e : ae fe 6e LDX $6efe ; (giocharmap + 0)
5731 : e0 01 __ CPX #$01
5733 : 90 26 __ BCC $575b ; (getpch + 48)
5735 : c9 0d __ CMP #$0d
5737 : d0 02 __ BNE $573b ; (getpch + 16)
5739 : a9 0a __ LDA #$0a
573b : e0 02 __ CPX #$02
573d : 90 1c __ BCC $575b ; (getpch + 48)
573f : c9 db __ CMP #$db
5741 : b0 18 __ BCS $575b ; (getpch + 48)
5743 : c9 41 __ CMP #$41
5745 : 90 14 __ BCC $575b ; (getpch + 48)
5747 : c9 c1 __ CMP #$c1
5749 : 90 02 __ BCC $574d ; (getpch + 34)
574b : 49 a0 __ EOR #$a0
574d : c9 7b __ CMP #$7b
574f : b0 0a __ BCS $575b ; (getpch + 48)
5751 : c9 61 __ CMP #$61
5753 : b0 04 __ BCS $5759 ; (getpch + 46)
5755 : c9 5b __ CMP #$5b
5757 : b0 02 __ BCS $575b ; (getpch + 48)
5759 : 49 20 __ EOR #$20
575b : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
575c : 20 bf 4f JSR $4fbf ; (screen_width.s0 + 0)
575f : c9 50 __ CMP #$50
5761 : f0 03 __ BEQ $5766 ; (screen_setmode.s1001 + 0)
.s1:
5763 : 4c 5f ff JMP $ff5f 
.s1001:
5766 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
5767 : 38 __ __ SEC
5768 : a5 23 __ LDA SP + 0 
576a : e9 06 __ SBC #$06
576c : 85 23 __ STA SP + 0 
576e : b0 02 __ BCS $5772 ; (bnk_init.s0 + 0)
5770 : c6 24 __ DEC SP + 1 
.s0:
5772 : a9 1b __ LDA #$1b
5774 : a0 02 __ LDY #$02
5776 : 91 23 __ STA (SP + 0),y 
5778 : a9 58 __ LDA #$58
577a : c8 __ __ INY
577b : 91 23 __ STA (SP + 0),y 
577d : a5 ba __ LDA $ba 
577f : d0 02 __ BNE $5783 ; (bnk_init.s4 + 0)
.s2:
5781 : a9 08 __ LDA #$08
.s4:
5783 : 85 4e __ STA T1 + 0 
5785 : 8d ff 6e STA $6eff ; (bootdevice + 0)
5788 : a0 04 __ LDY #$04
578a : 91 23 __ STA (SP + 0),y 
578c : a9 00 __ LDA #$00
578e : c8 __ __ INY
578f : 91 23 __ STA (SP + 0),y 
5791 : 20 c9 4f JSR $4fc9 ; (printf.s0 + 0)
5794 : a9 06 __ LDA #$06
5796 : 8d 06 d5 STA $d506 
5799 : a9 2b __ LDA #$2b
579b : a0 02 __ LDY #$02
579d : 91 23 __ STA (SP + 0),y 
579f : a9 58 __ LDA #$58
57a1 : c8 __ __ INY
57a2 : 91 23 __ STA (SP + 0),y 
57a4 : 20 c9 4f JSR $4fc9 ; (printf.s0 + 0)
57a7 : a9 00 __ LDA #$00
57a9 : 85 0d __ STA P0 
57ab : 85 0e __ STA P1 
57ad : 20 50 58 JSR $5850 ; (krnio_setbnk.s0 + 0)
57b0 : a9 45 __ LDA #$45
57b2 : 85 0d __ STA P0 
57b4 : a9 58 __ LDA #$58
57b6 : 85 0e __ STA P1 
57b8 : 20 57 58 JSR $5857 ; (krnio_setnam.s0 + 0)
57bb : a9 45 __ LDA #$45
57bd : a0 04 __ LDY #$04
57bf : 91 23 __ STA (SP + 0),y 
57c1 : a9 58 __ LDA #$58
57c3 : c8 __ __ INY
57c4 : 91 23 __ STA (SP + 0),y 
57c6 : a9 6d __ LDA #$6d
57c8 : a0 02 __ LDY #$02
57ca : 91 23 __ STA (SP + 0),y 
57cc : a9 58 __ LDA #$58
57ce : c8 __ __ INY
57cf : 91 23 __ STA (SP + 0),y 
57d1 : 20 c9 4f JSR $4fc9 ; (printf.s0 + 0)
57d4 : a9 01 __ LDA #$01
57d6 : 85 0d __ STA P0 
57d8 : 85 0f __ STA P2 
57da : a5 4e __ LDA T1 + 0 
57dc : 85 0e __ STA P1 
57de : 20 7a 58 JSR $587a ; (krnio_load.s0 + 0)
57e1 : 09 00 __ ORA #$00
57e3 : d0 2a __ BNE $580f ; (bnk_init.s1001 + 0)
.s7:
57e5 : a9 97 __ LDA #$97
57e7 : a0 02 __ LDY #$02
57e9 : 91 23 __ STA (SP + 0),y 
57eb : a9 58 __ LDA #$58
57ed : c8 __ __ INY
57ee : 91 23 __ STA (SP + 0),y 
57f0 : 20 c9 4f JSR $4fc9 ; (printf.s0 + 0)
57f3 : a9 b5 __ LDA #$b5
57f5 : a0 02 __ LDY #$02
57f7 : 91 23 __ STA (SP + 0),y 
57f9 : a9 58 __ LDA #$58
57fb : c8 __ __ INY
57fc : 91 23 __ STA (SP + 0),y 
57fe : ad d0 83 LDA $83d0 ; (krnio_pstatus + 1)
5801 : c8 __ __ INY
5802 : 91 23 __ STA (SP + 0),y 
5804 : a9 00 __ LDA #$00
5806 : c8 __ __ INY
5807 : 91 23 __ STA (SP + 0),y 
5809 : 20 c9 4f JSR $4fc9 ; (printf.s0 + 0)
580c : 20 c1 58 JSR $58c1 ; (exit@proxy + 0)
.s1001:
580f : 18 __ __ CLC
5810 : a5 23 __ LDA SP + 0 
5812 : 69 06 __ ADC #$06
5814 : 85 23 __ STA SP + 0 
5816 : 90 02 __ BCC $581a ; (bnk_init.s1001 + 11)
5818 : e6 24 __ INC SP + 1 
581a : 60 __ __ RTS
--------------------------------------------------------------------
581b : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
582b : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
583b : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
5845 : __ __ __ BYT 56 44 43 54 45 53 54 4c 4d 43 00                : VDCTESTLMC.
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
5850 : a5 0d __ LDA P0 
5852 : a6 0e __ LDX P1 
5854 : 4c 68 ff JMP $ff68 
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
5857 : a5 0d __ LDA P0 
5859 : 05 0e __ ORA P1 
585b : f0 08 __ BEQ $5865 ; (krnio_setnam.s0 + 14)
585d : a0 ff __ LDY #$ff
585f : c8 __ __ INY
5860 : b1 0d __ LDA (P0),y 
5862 : d0 fb __ BNE $585f ; (krnio_setnam.s0 + 8)
5864 : 98 __ __ TYA
5865 : a6 0d __ LDX P0 
5867 : a4 0e __ LDY P1 
5869 : 20 bd ff JSR $ffbd 
.s1001:
586c : 60 __ __ RTS
--------------------------------------------------------------------
586d : __ __ __ BYT 4c 4f 41 44 49 4e 47 3a 20 25 53 0a 00          : LOADING: %S..
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
587a : a5 0d __ LDA P0 
587c : a6 0e __ LDX P1 
587e : a4 0f __ LDY P2 
5880 : 20 ba ff JSR $ffba 
5883 : a9 00 __ LDA #$00
5885 : a2 00 __ LDX #$00
5887 : a0 00 __ LDY #$00
5889 : 20 d5 ff JSR $ffd5 
588c : a9 00 __ LDA #$00
588e : b0 02 __ BCS $5892 ; (krnio_load.s0 + 24)
5890 : a9 01 __ LDA #$01
5892 : 85 1b __ STA ACCU + 0 
.s1001:
5894 : a5 1b __ LDA ACCU + 0 
5896 : 60 __ __ RTS
--------------------------------------------------------------------
5897 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
58a7 : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
58b5 : __ __ __ BYT 53 54 41 54 55 53 3a 20 25 44 0a 00             : STATUS: %D..
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
58c1 : a9 01 __ LDA #$01
58c3 : 85 0d __ STA P0 
58c5 : a9 00 __ LDA #$00
58c7 : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
58c9 : a5 0d __ LDA P0 
58cb : 85 1b __ STA ACCU + 0 
58cd : a5 0e __ LDA P1 
58cf : 85 1c __ STA ACCU + 1 
58d1 : ae fd 6e LDX $6efd ; (spentry + 0)
58d4 : 9a __ __ TXS
58d5 : a9 4c __ LDA #$4c
58d7 : 85 54 __ STA $54 
58d9 : a9 00 __ LDA #$00
58db : 85 13 __ STA P6 
.s1001:
58dd : 60 __ __ RTS
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
58de : 09 00 __ ORA #$00
58e0 : d0 0d __ BNE $58ef ; (fastmode.s1 + 0)
.s2:
58e2 : 8d 30 d0 STA $d030 
58e5 : ad 11 d0 LDA $d011 
58e8 : 29 7f __ AND #$7f
58ea : 09 10 __ ORA #$10
58ec : 4c f9 58 JMP $58f9 ; (fastmode.s3 + 0)
.s1:
58ef : a9 01 __ LDA #$01
58f1 : 8d 30 d0 STA $d030 
58f4 : ad 11 d0 LDA $d011 
58f7 : 29 6f __ AND #$6f
.s3:
58f9 : 8d 11 d0 STA $d011 
.s1001:
58fc : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s0:
58fd : a4 13 __ LDY P6 ; (mode + 0)
58ff : be 60 7e LDX $7e60,y ; (__multab36L + 0)
5902 : 86 4a __ STX T1 + 0 
5904 : 86 4c __ STX T2 + 0 
5906 : bd 04 7f LDA $7f04,x ; (vdc_modes + 4)
5909 : f0 08 __ BEQ $5913 ; (vdc_set_mode.s3 + 0)
.s4:
590b : ad 26 83 LDA $8326 ; (vdc_state + 0)
590e : c9 10 __ CMP #$10
5910 : d0 01 __ BNE $5913 ; (vdc_set_mode.s3 + 0)
5912 : 60 __ __ RTS
.s3:
5913 : 8c 28 83 STY $8328 ; (vdc_state + 2)
5916 : a9 00 __ LDA #$00
5918 : 8d 3c 83 STA $833c ; (vdc_state + 22)
591b : 8d 3d 83 STA $833d ; (vdc_state + 23)
591e : 8d 3e 83 STA $833e ; (vdc_state + 24)
5921 : bd 00 7f LDA $7f00,x ; (vdc_modes + 0)
5924 : 8d 29 83 STA $8329 ; (vdc_state + 3)
5927 : bd 01 7f LDA $7f01,x ; (vdc_modes + 1)
592a : 8d 2a 83 STA $832a ; (vdc_state + 4)
592d : bd 02 7f LDA $7f02,x ; (vdc_modes + 2)
5930 : 8d 2b 83 STA $832b ; (vdc_state + 5)
5933 : bd 03 7f LDA $7f03,x ; (vdc_modes + 3)
5936 : 8d 2c 83 STA $832c ; (vdc_state + 6)
5939 : bd 09 7f LDA $7f09,x ; (vdc_modes + 9)
593c : 8d 32 83 STA $8332 ; (vdc_state + 12)
593f : bd 0a 7f LDA $7f0a,x ; (vdc_modes + 10)
5942 : 8d 33 83 STA $8333 ; (vdc_state + 13)
5945 : bd 0b 7f LDA $7f0b,x ; (vdc_modes + 11)
5948 : 8d 34 83 STA $8334 ; (vdc_state + 14)
594b : bd 0c 7f LDA $7f0c,x ; (vdc_modes + 12)
594e : 8d 35 83 STA $8335 ; (vdc_state + 15)
5951 : bd 0d 7f LDA $7f0d,x ; (vdc_modes + 13)
5954 : 8d 36 83 STA $8336 ; (vdc_state + 16)
5957 : bd 0e 7f LDA $7f0e,x ; (vdc_modes + 14)
595a : 8d 37 83 STA $8337 ; (vdc_state + 17)
595d : bd 0f 7f LDA $7f0f,x ; (vdc_modes + 15)
5960 : 8d 38 83 STA $8338 ; (vdc_state + 18)
5963 : bd 10 7f LDA $7f10,x ; (vdc_modes + 16)
5966 : 8d 39 83 STA $8339 ; (vdc_state + 19)
5969 : bd 11 7f LDA $7f11,x ; (vdc_modes + 17)
596c : 8d 3a 83 STA $833a ; (vdc_state + 20)
596f : bd 12 7f LDA $7f12,x ; (vdc_modes + 18)
5972 : 8d 3b 83 STA $833b ; (vdc_state + 21)
5975 : bd 05 7f LDA $7f05,x ; (vdc_modes + 5)
5978 : 85 4d __ STA T3 + 0 
597a : 8d 2e 83 STA $832e ; (vdc_state + 8)
597d : bd 06 7f LDA $7f06,x ; (vdc_modes + 6)
5980 : 85 4e __ STA T3 + 1 
5982 : 8d 2f 83 STA $832f ; (vdc_state + 9)
5985 : bd 07 7f LDA $7f07,x ; (vdc_modes + 7)
5988 : 85 50 __ STA T5 + 0 
598a : 8d 30 83 STA $8330 ; (vdc_state + 10)
598d : bd 08 7f LDA $7f08,x ; (vdc_modes + 8)
5990 : 85 51 __ STA T5 + 1 
5992 : 8d 31 83 STA $8331 ; (vdc_state + 11)
5995 : 20 42 5d JSR $5d42 ; (vdc_set_multab.s0 + 0)
5998 : a9 22 __ LDA #$22
599a : 8d 00 d6 STA $d600 
.l1540:
599d : 2c 00 d6 BIT $d600 
59a0 : 10 fb __ BPL $599d ; (vdc_set_mode.l1540 + 0)
.s11:
59a2 : a9 80 __ LDA #$80
59a4 : 8d 01 d6 STA $d601 
59a7 : a9 0c __ LDA #$0c
59a9 : 8d 00 d6 STA $d600 
.l1542:
59ac : 2c 00 d6 BIT $d600 
59af : 10 fb __ BPL $59ac ; (vdc_set_mode.l1542 + 0)
.s17:
59b1 : a5 4e __ LDA T3 + 1 
59b3 : 8d 01 d6 STA $d601 
59b6 : a9 0d __ LDA #$0d
59b8 : 8d 00 d6 STA $d600 
.l1544:
59bb : 2c 00 d6 BIT $d600 
59be : 10 fb __ BPL $59bb ; (vdc_set_mode.l1544 + 0)
.s22:
59c0 : a5 4d __ LDA T3 + 0 
59c2 : 8d 01 d6 STA $d601 
59c5 : a9 14 __ LDA #$14
59c7 : 8d 00 d6 STA $d600 
.l1546:
59ca : 2c 00 d6 BIT $d600 
59cd : 10 fb __ BPL $59ca ; (vdc_set_mode.l1546 + 0)
.s27:
59cf : a5 51 __ LDA T5 + 1 
59d1 : 8d 01 d6 STA $d601 
59d4 : a9 15 __ LDA #$15
59d6 : 8d 00 d6 STA $d600 
.l1548:
59d9 : 2c 00 d6 BIT $d600 
59dc : 10 fb __ BPL $59d9 ; (vdc_set_mode.l1548 + 0)
.s32:
59de : a5 50 __ LDA T5 + 0 
59e0 : 8d 01 d6 STA $d601 
59e3 : a6 4a __ LDX T1 + 0 
59e5 : bd 0e 7f LDA $7f0e,x ; (vdc_modes + 14)
59e8 : 85 4e __ STA T3 + 1 
59ea : a9 1c __ LDA #$1c
59ec : 8d 00 d6 STA $d600 
.l1550:
59ef : 2c 00 d6 BIT $d600 
59f2 : 10 fb __ BPL $59ef ; (vdc_set_mode.l1550 + 0)
.s39:
59f4 : ad 01 d6 LDA $d601 
59f7 : 29 10 __ AND #$10
59f9 : 45 4e __ EOR T3 + 1 
59fb : 29 1f __ AND #$1f
59fd : 45 4e __ EOR T3 + 1 
59ff : a2 1c __ LDX #$1c
5a01 : 8e 00 d6 STX $d600 
.l1552:
5a04 : 2c 00 d6 BIT $d600 
5a07 : 10 fb __ BPL $5a04 ; (vdc_set_mode.l1552 + 0)
.s45:
5a09 : 8d 01 d6 STA $d601 
5a0c : 20 9d 5d JSR $5d9d ; (vdc_restore_charsets.s0 + 0)
5a0f : 18 __ __ CLC
5a10 : a9 13 __ LDA #$13
5a12 : 65 4a __ ADC T1 + 0 
5a14 : 85 4a __ STA T1 + 0 
5a16 : a9 7f __ LDA #$7f
5a18 : 69 00 __ ADC #$00
5a1a : 85 4b __ STA T1 + 1 
5a1c : 18 __ __ CLC
5a1d : a5 4c __ LDA T2 + 0 
5a1f : 69 13 __ ADC #$13
5a21 : 85 4d __ STA T3 + 0 
5a23 : a9 00 __ LDA #$00
5a25 : 85 49 __ STA T0 + 0 
5a27 : 69 7f __ ADC #$7f
5a29 : 85 4e __ STA T3 + 1 
.l46:
5a2b : a4 49 __ LDY T0 + 0 
5a2d : b1 4a __ LDA (T1 + 0),y 
5a2f : aa __ __ TAX
5a30 : c8 __ __ INY
5a31 : b1 4a __ LDA (T1 + 0),y 
5a33 : 8e 00 d6 STX $d600 
5a36 : c8 __ __ INY
5a37 : 84 49 __ STY T0 + 0 
.l1554:
5a39 : 2c 00 d6 BIT $d600 
5a3c : 10 fb __ BPL $5a39 ; (vdc_set_mode.l1554 + 0)
.s52:
5a3e : 8d 01 d6 STA $d601 
5a41 : b1 4d __ LDA (T3 + 0),y 
5a43 : c9 ff __ CMP #$ff
5a45 : d0 e4 __ BNE $5a2b ; (vdc_set_mode.l46 + 0)
.s47:
5a47 : a6 4c __ LDX T2 + 0 
5a49 : bd 04 7f LDA $7f04,x ; (vdc_modes + 4)
5a4c : d0 03 __ BNE $5a51 ; (vdc_set_mode.s56 + 0)
5a4e : 4c 76 5b JMP $5b76 ; (vdc_set_mode.s55 + 0)
.s56:
5a51 : ad 27 83 LDA $8327 ; (vdc_state + 1)
5a54 : f0 03 __ BEQ $5a59 ; (vdc_set_mode.s53 + 0)
5a56 : 4c 76 5b JMP $5b76 ; (vdc_set_mode.s55 + 0)
.s53:
5a59 : ad 26 83 LDA $8326 ; (vdc_state + 0)
5a5c : c9 10 __ CMP #$10
5a5e : d0 03 __ BNE $5a63 ; (vdc_set_mode.s61 + 0)
5a60 : 4c 76 5b JMP $5b76 ; (vdc_set_mode.s55 + 0)
.s61:
5a63 : ad 27 83 LDA $8327 ; (vdc_state + 1)
5a66 : f0 03 __ BEQ $5a6b ; (vdc_set_mode.s60 + 0)
5a68 : 4c 76 5b JMP $5b76 ; (vdc_set_mode.s55 + 0)
.s60:
5a6b : a9 22 __ LDA #$22
5a6d : 8d 00 d6 STA $d600 
.l1587:
5a70 : 2c 00 d6 BIT $d600 
5a73 : 10 fb __ BPL $5a70 ; (vdc_set_mode.l1587 + 0)
.s68:
5a75 : a9 80 __ LDA #$80
5a77 : 8d 01 d6 STA $d601 
5a7a : a2 00 __ LDX #$00
5a7c : a0 ff __ LDY #$ff
.l71:
5a7e : a9 12 __ LDA #$12
5a80 : 8d 00 d6 STA $d600 
.l1589:
5a83 : 2c 00 d6 BIT $d600 
5a86 : 10 fb __ BPL $5a83 ; (vdc_set_mode.l1589 + 0)
.s80:
5a88 : 8e 01 d6 STX $d601 
5a8b : a9 13 __ LDA #$13
5a8d : 8d 00 d6 STA $d600 
.l1591:
5a90 : 2c 00 d6 BIT $d600 
5a93 : 10 fb __ BPL $5a90 ; (vdc_set_mode.l1591 + 0)
.s85:
5a95 : a9 00 __ LDA #$00
5a97 : 8d 01 d6 STA $d601 
5a9a : a9 1f __ LDA #$1f
5a9c : 8d 00 d6 STA $d600 
.l1593:
5a9f : 2c 00 d6 BIT $d600 
5aa2 : 10 fb __ BPL $5a9f ; (vdc_set_mode.l1593 + 0)
.s89:
5aa4 : a9 00 __ LDA #$00
5aa6 : 8d 01 d6 STA $d601 
5aa9 : a9 18 __ LDA #$18
5aab : 8d 00 d6 STA $d600 
.l1595:
5aae : 2c 00 d6 BIT $d600 
5ab1 : 10 fb __ BPL $5aae ; (vdc_set_mode.l1595 + 0)
.s95:
5ab3 : ad 01 d6 LDA $d601 
5ab6 : 29 7f __ AND #$7f
5ab8 : 85 4c __ STA T2 + 0 
5aba : a9 18 __ LDA #$18
5abc : 8d 00 d6 STA $d600 
.l1597:
5abf : 2c 00 d6 BIT $d600 
5ac2 : 10 fb __ BPL $5abf ; (vdc_set_mode.l1597 + 0)
.s101:
5ac4 : a5 4c __ LDA T2 + 0 
5ac6 : 8d 01 d6 STA $d601 
5ac9 : a9 1e __ LDA #$1e
5acb : 8d 00 d6 STA $d600 
.l1599:
5ace : 2c 00 d6 BIT $d600 
5ad1 : 10 fb __ BPL $5ace ; (vdc_set_mode.l1599 + 0)
.s106:
5ad3 : a9 ff __ LDA #$ff
5ad5 : 8d 01 d6 STA $d601 
5ad8 : e8 __ __ INX
5ad9 : 88 __ __ DEY
5ada : d0 a2 __ BNE $5a7e ; (vdc_set_mode.l71 + 0)
.s73:
5adc : a9 12 __ LDA #$12
5ade : 8d 00 d6 STA $d600 
.l1602:
5ae1 : 2c 00 d6 BIT $d600 
5ae4 : 10 fb __ BPL $5ae1 ; (vdc_set_mode.l1602 + 0)
.s113:
5ae6 : 8e 01 d6 STX $d601 
5ae9 : a9 13 __ LDA #$13
5aeb : 8d 00 d6 STA $d600 
.l1604:
5aee : 2c 00 d6 BIT $d600 
5af1 : 10 fb __ BPL $5aee ; (vdc_set_mode.l1604 + 0)
.s118:
5af3 : 8c 01 d6 STY $d601 
5af6 : a9 1f __ LDA #$1f
5af8 : 8d 00 d6 STA $d600 
.l1606:
5afb : 2c 00 d6 BIT $d600 
5afe : 10 fb __ BPL $5afb ; (vdc_set_mode.l1606 + 0)
.s122:
5b00 : 8c 01 d6 STY $d601 
5b03 : a9 18 __ LDA #$18
5b05 : 8d 00 d6 STA $d600 
.l1608:
5b08 : 2c 00 d6 BIT $d600 
5b0b : 10 fb __ BPL $5b08 ; (vdc_set_mode.l1608 + 0)
.s128:
5b0d : ad 01 d6 LDA $d601 
5b10 : 29 7f __ AND #$7f
5b12 : a2 18 __ LDX #$18
5b14 : 8e 00 d6 STX $d600 
.l1610:
5b17 : 2c 00 d6 BIT $d600 
5b1a : 10 fb __ BPL $5b17 ; (vdc_set_mode.l1610 + 0)
.s134:
5b1c : 8d 01 d6 STA $d601 
5b1f : a9 1e __ LDA #$1e
5b21 : 8d 00 d6 STA $d600 
.l1612:
5b24 : 2c 00 d6 BIT $d600 
5b27 : 10 fb __ BPL $5b24 ; (vdc_set_mode.l1612 + 0)
.s139:
5b29 : a9 ff __ LDA #$ff
5b2b : 8d 01 d6 STA $d601 
5b2e : a2 1c __ LDX #$1c
5b30 : 8e 00 d6 STX $d600 
.l1614:
5b33 : 2c 00 d6 BIT $d600 
5b36 : 10 fb __ BPL $5b33 ; (vdc_set_mode.l1614 + 0)
.s145:
5b38 : ad 01 d6 LDA $d601 
5b3b : 09 10 __ ORA #$10
5b3d : 8e 00 d6 STX $d600 
.l1616:
5b40 : 2c 00 d6 BIT $d600 
5b43 : 10 fb __ BPL $5b40 ; (vdc_set_mode.l1616 + 0)
.s151:
5b45 : 8d 01 d6 STA $d601 
5b48 : 20 9d 5d JSR $5d9d ; (vdc_restore_charsets.s0 + 0)
5b4b : a9 00 __ LDA #$00
5b4d : 85 49 __ STA T0 + 0 
5b4f : ad 29 83 LDA $8329 ; (vdc_state + 3)
5b52 : 85 4a __ STA T1 + 0 
5b54 : ad 2b 83 LDA $832b ; (vdc_state + 5)
5b57 : 85 4c __ STA T2 + 0 
.l154:
5b59 : a5 49 __ LDA T0 + 0 
5b5b : c5 4c __ CMP T2 + 0 
5b5d : b0 03 __ BCS $5b62 ; (vdc_set_mode.s152 + 0)
5b5f : 4c 6e 5c JMP $5c6e ; (vdc_set_mode.s155 + 0)
.s152:
5b62 : a9 22 __ LDA #$22
5b64 : 8d 00 d6 STA $d600 
.l1643:
5b67 : 2c 00 d6 BIT $d600 
5b6a : 10 fb __ BPL $5b67 ; (vdc_set_mode.l1643 + 0)
.s230:
5b6c : a9 7d __ LDA #$7d
5b6e : 8d 01 d6 STA $d601 
5b71 : a9 01 __ LDA #$01
5b73 : 8d 27 83 STA $8327 ; (vdc_state + 1)
.s55:
5b76 : a9 00 __ LDA #$00
5b78 : 85 49 __ STA T0 + 0 
5b7a : ad 29 83 LDA $8329 ; (vdc_state + 3)
5b7d : 85 4a __ STA T1 + 0 
5b7f : ad 2b 83 LDA $832b ; (vdc_state + 5)
5b82 : 85 4c __ STA T2 + 0 
.l233:
5b84 : a5 49 __ LDA T0 + 0 
5b86 : c5 4c __ CMP T2 + 0 
5b88 : 90 10 __ BCC $5b9a ; (vdc_set_mode.s234 + 0)
.s231:
5b8a : a9 22 __ LDA #$22
5b8c : 8d 00 d6 STA $d600 
.l1584:
5b8f : 2c 00 d6 BIT $d600 
5b92 : 10 fb __ BPL $5b8f ; (vdc_set_mode.l1584 + 0)
.s309:
5b94 : a9 7d __ LDA #$7d
5b96 : 8d 01 d6 STA $d601 
.s1001:
5b99 : 60 __ __ RTS
.s234:
5b9a : a9 00 __ LDA #$00
5b9c : 85 0d __ STA P0 
5b9e : a5 49 __ LDA T0 + 0 
5ba0 : 85 0e __ STA P1 
5ba2 : ad 2d 83 LDA $832d ; (vdc_state + 7)
5ba5 : 85 4f __ STA T4 + 0 
5ba7 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
5baa : a9 12 __ LDA #$12
5bac : 8d 00 d6 STA $d600 
5baf : 18 __ __ CLC
5bb0 : a5 1b __ LDA ACCU + 0 
5bb2 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
5bb5 : a8 __ __ TAY
5bb6 : a5 1c __ LDA ACCU + 1 
5bb8 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
5bbb : a6 4a __ LDX T1 + 0 
5bbd : ca __ __ DEX
.l1560:
5bbe : 2c 00 d6 BIT $d600 
5bc1 : 10 fb __ BPL $5bbe ; (vdc_set_mode.l1560 + 0)
.s244:
5bc3 : 8d 01 d6 STA $d601 
5bc6 : a9 13 __ LDA #$13
5bc8 : 8d 00 d6 STA $d600 
.l1562:
5bcb : 2c 00 d6 BIT $d600 
5bce : 10 fb __ BPL $5bcb ; (vdc_set_mode.l1562 + 0)
.s249:
5bd0 : 8c 01 d6 STY $d601 
5bd3 : a9 1f __ LDA #$1f
5bd5 : 8d 00 d6 STA $d600 
.l1564:
5bd8 : 2c 00 d6 BIT $d600 
5bdb : 10 fb __ BPL $5bd8 ; (vdc_set_mode.l1564 + 0)
.s253:
5bdd : a9 20 __ LDA #$20
5bdf : 8d 01 d6 STA $d601 
5be2 : a9 18 __ LDA #$18
5be4 : 8d 00 d6 STA $d600 
.l1566:
5be7 : 2c 00 d6 BIT $d600 
5bea : 10 fb __ BPL $5be7 ; (vdc_set_mode.l1566 + 0)
.s259:
5bec : ad 01 d6 LDA $d601 
5bef : 29 7f __ AND #$7f
5bf1 : a0 18 __ LDY #$18
5bf3 : 8c 00 d6 STY $d600 
.l1568:
5bf6 : 2c 00 d6 BIT $d600 
5bf9 : 10 fb __ BPL $5bf6 ; (vdc_set_mode.l1568 + 0)
.s265:
5bfb : 8d 01 d6 STA $d601 
5bfe : a9 1e __ LDA #$1e
5c00 : 8d 00 d6 STA $d600 
.l1570:
5c03 : 2c 00 d6 BIT $d600 
5c06 : 10 fb __ BPL $5c03 ; (vdc_set_mode.l1570 + 0)
.s270:
5c08 : 8e 01 d6 STX $d601 
5c0b : ad 30 83 LDA $8330 ; (vdc_state + 10)
5c0e : 18 __ __ CLC
5c0f : 65 1b __ ADC ACCU + 0 
5c11 : a0 12 __ LDY #$12
5c13 : 8c 00 d6 STY $d600 
5c16 : a8 __ __ TAY
5c17 : ad 31 83 LDA $8331 ; (vdc_state + 11)
5c1a : 65 1c __ ADC ACCU + 1 
.l1572:
5c1c : 2c 00 d6 BIT $d600 
5c1f : 10 fb __ BPL $5c1c ; (vdc_set_mode.l1572 + 0)
.s277:
5c21 : 8d 01 d6 STA $d601 
5c24 : a9 13 __ LDA #$13
5c26 : 8d 00 d6 STA $d600 
.l1574:
5c29 : 2c 00 d6 BIT $d600 
5c2c : 10 fb __ BPL $5c29 ; (vdc_set_mode.l1574 + 0)
.s282:
5c2e : 8c 01 d6 STY $d601 
5c31 : a9 1f __ LDA #$1f
5c33 : 8d 00 d6 STA $d600 
.l1576:
5c36 : 2c 00 d6 BIT $d600 
5c39 : 10 fb __ BPL $5c36 ; (vdc_set_mode.l1576 + 0)
.s286:
5c3b : a5 4f __ LDA T4 + 0 
5c3d : 8d 01 d6 STA $d601 
5c40 : a9 18 __ LDA #$18
5c42 : 8d 00 d6 STA $d600 
.l1578:
5c45 : 2c 00 d6 BIT $d600 
5c48 : 10 fb __ BPL $5c45 ; (vdc_set_mode.l1578 + 0)
.s292:
5c4a : ad 01 d6 LDA $d601 
5c4d : 29 7f __ AND #$7f
5c4f : a0 18 __ LDY #$18
5c51 : 8c 00 d6 STY $d600 
.l1580:
5c54 : 2c 00 d6 BIT $d600 
5c57 : 10 fb __ BPL $5c54 ; (vdc_set_mode.l1580 + 0)
.s298:
5c59 : 8d 01 d6 STA $d601 
5c5c : a9 1e __ LDA #$1e
5c5e : 8d 00 d6 STA $d600 
.l1582:
5c61 : 2c 00 d6 BIT $d600 
5c64 : 10 fb __ BPL $5c61 ; (vdc_set_mode.l1582 + 0)
.s303:
5c66 : 8e 01 d6 STX $d601 
5c69 : e6 49 __ INC T0 + 0 
5c6b : 4c 84 5b JMP $5b84 ; (vdc_set_mode.l233 + 0)
.s155:
5c6e : a9 00 __ LDA #$00
5c70 : 85 0d __ STA P0 
5c72 : a5 49 __ LDA T0 + 0 
5c74 : 85 0e __ STA P1 
5c76 : ad 2d 83 LDA $832d ; (vdc_state + 7)
5c79 : 85 4f __ STA T4 + 0 
5c7b : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
5c7e : a9 12 __ LDA #$12
5c80 : 8d 00 d6 STA $d600 
5c83 : 18 __ __ CLC
5c84 : a5 1b __ LDA ACCU + 0 
5c86 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
5c89 : a8 __ __ TAY
5c8a : a5 1c __ LDA ACCU + 1 
5c8c : 6d 2f 83 ADC $832f ; (vdc_state + 9)
5c8f : a6 4a __ LDX T1 + 0 
5c91 : ca __ __ DEX
.l1619:
5c92 : 2c 00 d6 BIT $d600 
5c95 : 10 fb __ BPL $5c92 ; (vdc_set_mode.l1619 + 0)
.s165:
5c97 : 8d 01 d6 STA $d601 
5c9a : a9 13 __ LDA #$13
5c9c : 8d 00 d6 STA $d600 
.l1621:
5c9f : 2c 00 d6 BIT $d600 
5ca2 : 10 fb __ BPL $5c9f ; (vdc_set_mode.l1621 + 0)
.s170:
5ca4 : 8c 01 d6 STY $d601 
5ca7 : a9 1f __ LDA #$1f
5ca9 : 8d 00 d6 STA $d600 
.l1623:
5cac : 2c 00 d6 BIT $d600 
5caf : 10 fb __ BPL $5cac ; (vdc_set_mode.l1623 + 0)
.s174:
5cb1 : a9 20 __ LDA #$20
5cb3 : 8d 01 d6 STA $d601 
5cb6 : a9 18 __ LDA #$18
5cb8 : 8d 00 d6 STA $d600 
.l1625:
5cbb : 2c 00 d6 BIT $d600 
5cbe : 10 fb __ BPL $5cbb ; (vdc_set_mode.l1625 + 0)
.s180:
5cc0 : ad 01 d6 LDA $d601 
5cc3 : 29 7f __ AND #$7f
5cc5 : a0 18 __ LDY #$18
5cc7 : 8c 00 d6 STY $d600 
.l1627:
5cca : 2c 00 d6 BIT $d600 
5ccd : 10 fb __ BPL $5cca ; (vdc_set_mode.l1627 + 0)
.s186:
5ccf : 8d 01 d6 STA $d601 
5cd2 : a9 1e __ LDA #$1e
5cd4 : 8d 00 d6 STA $d600 
.l1629:
5cd7 : 2c 00 d6 BIT $d600 
5cda : 10 fb __ BPL $5cd7 ; (vdc_set_mode.l1629 + 0)
.s191:
5cdc : 8e 01 d6 STX $d601 
5cdf : ad 30 83 LDA $8330 ; (vdc_state + 10)
5ce2 : 18 __ __ CLC
5ce3 : 65 1b __ ADC ACCU + 0 
5ce5 : a0 12 __ LDY #$12
5ce7 : 8c 00 d6 STY $d600 
5cea : a8 __ __ TAY
5ceb : ad 31 83 LDA $8331 ; (vdc_state + 11)
5cee : 65 1c __ ADC ACCU + 1 
.l1631:
5cf0 : 2c 00 d6 BIT $d600 
5cf3 : 10 fb __ BPL $5cf0 ; (vdc_set_mode.l1631 + 0)
.s198:
5cf5 : 8d 01 d6 STA $d601 
5cf8 : a9 13 __ LDA #$13
5cfa : 8d 00 d6 STA $d600 
.l1633:
5cfd : 2c 00 d6 BIT $d600 
5d00 : 10 fb __ BPL $5cfd ; (vdc_set_mode.l1633 + 0)
.s203:
5d02 : 8c 01 d6 STY $d601 
5d05 : a9 1f __ LDA #$1f
5d07 : 8d 00 d6 STA $d600 
.l1635:
5d0a : 2c 00 d6 BIT $d600 
5d0d : 10 fb __ BPL $5d0a ; (vdc_set_mode.l1635 + 0)
.s207:
5d0f : a5 4f __ LDA T4 + 0 
5d11 : 8d 01 d6 STA $d601 
5d14 : a9 18 __ LDA #$18
5d16 : 8d 00 d6 STA $d600 
.l1637:
5d19 : 2c 00 d6 BIT $d600 
5d1c : 10 fb __ BPL $5d19 ; (vdc_set_mode.l1637 + 0)
.s213:
5d1e : ad 01 d6 LDA $d601 
5d21 : 29 7f __ AND #$7f
5d23 : a0 18 __ LDY #$18
5d25 : 8c 00 d6 STY $d600 
.l1639:
5d28 : 2c 00 d6 BIT $d600 
5d2b : 10 fb __ BPL $5d28 ; (vdc_set_mode.l1639 + 0)
.s219:
5d2d : 8d 01 d6 STA $d601 
5d30 : a9 1e __ LDA #$1e
5d32 : 8d 00 d6 STA $d600 
.l1641:
5d35 : 2c 00 d6 BIT $d600 
5d38 : 10 fb __ BPL $5d35 ; (vdc_set_mode.l1641 + 0)
.s224:
5d3a : 8e 01 d6 STX $d601 
5d3d : e6 49 __ INC T0 + 0 
5d3f : 4c 59 5b JMP $5b59 ; (vdc_set_mode.l154 + 0)
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
5d42 : ad 2c 83 LDA $832c ; (vdc_state + 6)
5d45 : 85 1c __ STA ACCU + 1 
5d47 : ad 2b 83 LDA $832b ; (vdc_state + 5)
5d4a : 85 1b __ STA ACCU + 0 
5d4c : 05 1c __ ORA ACCU + 1 
5d4e : f0 4c __ BEQ $5d9c ; (vdc_set_multab.s1001 + 0)
.s5:
5d50 : ad 29 83 LDA $8329 ; (vdc_state + 3)
5d53 : 18 __ __ CLC
5d54 : 6d 3e 83 ADC $833e ; (vdc_state + 24)
5d57 : 85 43 __ STA T2 + 0 
5d59 : ad 2a 83 LDA $832a ; (vdc_state + 4)
5d5c : 69 00 __ ADC #$00
5d5e : 85 44 __ STA T2 + 1 
5d60 : a9 00 __ LDA #$00
5d62 : 85 45 __ STA T3 + 0 
5d64 : 85 46 __ STA T3 + 1 
5d66 : a9 3f __ LDA #$3f
5d68 : 85 47 __ STA T4 + 0 
5d6a : a9 83 __ LDA #$83
5d6c : 85 48 __ STA T4 + 1 
5d6e : a2 00 __ LDX #$00
.l2:
5d70 : a5 45 __ LDA T3 + 0 
5d72 : a0 00 __ LDY #$00
5d74 : 91 47 __ STA (T4 + 0),y 
5d76 : a5 46 __ LDA T3 + 1 
5d78 : c8 __ __ INY
5d79 : 91 47 __ STA (T4 + 0),y 
5d7b : 18 __ __ CLC
5d7c : a5 43 __ LDA T2 + 0 
5d7e : 65 45 __ ADC T3 + 0 
5d80 : 85 45 __ STA T3 + 0 
5d82 : a5 44 __ LDA T2 + 1 
5d84 : 65 46 __ ADC T3 + 1 
5d86 : 85 46 __ STA T3 + 1 
5d88 : 18 __ __ CLC
5d89 : a5 47 __ LDA T4 + 0 
5d8b : 69 02 __ ADC #$02
5d8d : 85 47 __ STA T4 + 0 
5d8f : 90 02 __ BCC $5d93 ; (vdc_set_multab.s1006 + 0)
.s1005:
5d91 : e6 48 __ INC T4 + 1 
.s1006:
5d93 : e8 __ __ INX
5d94 : a5 1c __ LDA ACCU + 1 
5d96 : d0 d8 __ BNE $5d70 ; (vdc_set_multab.l2 + 0)
.s1002:
5d98 : e4 1b __ CPX ACCU + 0 
5d9a : 90 d4 __ BCC $5d70 ; (vdc_set_multab.l2 + 0)
.s1001:
5d9c : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
5d9d : ad 36 83 LDA $8336 ; (vdc_state + 16)
5da0 : 85 0d __ STA P0 
5da2 : ad 37 83 LDA $8337 ; (vdc_state + 17)
5da5 : 85 0e __ STA P1 
5da7 : 4c 00 13 JMP $1300 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
5daa : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 6f 53 43 41 52 36 34 : sTARTING oSCAR64
5dba : __ __ __ BYT 20 76 64 63 20 44 45 4d 4f 2e 00                :  vdc DEMO..
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
5dc5 : a9 00 __ LDA #$00
5dc7 : 85 0d __ STA P0 
5dc9 : a9 84 __ LDA #$84
5dcb : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
5dcd : a9 00 __ LDA #$00
5dcf : 85 1b __ STA ACCU + 0 
5dd1 : 85 1c __ STA ACCU + 1 
5dd3 : a8 __ __ TAY
5dd4 : b1 0d __ LDA (P0),y ; (str + 0)
5dd6 : f0 18 __ BEQ $5df0 ; (strlen.s1001 + 0)
.s2:
5dd8 : a5 0d __ LDA P0 ; (str + 0)
5dda : 85 1b __ STA ACCU + 0 
5ddc : a2 00 __ LDX #$00
.l1002:
5dde : c8 __ __ INY
5ddf : d0 01 __ BNE $5de2 ; (strlen.s1005 + 0)
.s1004:
5de1 : e8 __ __ INX
.s1005:
5de2 : 8a __ __ TXA
5de3 : 18 __ __ CLC
5de4 : 65 0e __ ADC P1 ; (str + 1)
5de6 : 85 1c __ STA ACCU + 1 
5de8 : b1 1b __ LDA (ACCU + 0),y 
5dea : d0 f2 __ BNE $5dde ; (strlen.l1002 + 0)
.s1003:
5dec : 86 1c __ STX ACCU + 1 
5dee : 84 1b __ STY ACCU + 0 
.s1001:
5df0 : 60 __ __ RTS
--------------------------------------------------------------------
pet2screen: ; pet2screen(u8)->u8
.s0:
5df1 : c9 20 __ CMP #$20
5df3 : b0 03 __ BCS $5df8 ; (pet2screen.s2 + 0)
.s1:
5df5 : 69 80 __ ADC #$80
5df7 : 60 __ __ RTS
.s2:
5df8 : c9 40 __ CMP #$40
5dfa : 90 27 __ BCC $5e23 ; (pet2screen.s21 + 0)
.s7:
5dfc : c9 60 __ CMP #$60
5dfe : 90 17 __ BCC $5e17 ; (pet2screen.s4 + 0)
.s11:
5e00 : 09 00 __ ORA #$00
5e02 : 30 04 __ BMI $5e08 ; (pet2screen.s9 + 0)
.s8:
5e04 : 38 __ __ SEC
5e05 : e9 20 __ SBC #$20
5e07 : 60 __ __ RTS
.s9:
5e08 : c9 80 __ CMP #$80
5e0a : 90 17 __ BCC $5e23 ; (pet2screen.s21 + 0)
.s15:
5e0c : c9 a0 __ CMP #$a0
5e0e : b0 03 __ BCS $5e13 ; (pet2screen.s19 + 0)
.s12:
5e10 : 69 40 __ ADC #$40
5e12 : 60 __ __ RTS
.s19:
5e13 : c9 c0 __ CMP #$c0
5e15 : b0 04 __ BCS $5e1b ; (pet2screen.s23 + 0)
.s4:
5e17 : 38 __ __ SEC
5e18 : e9 40 __ SBC #$40
5e1a : 60 __ __ RTS
.s23:
5e1b : c9 ff __ CMP #$ff
5e1d : b0 04 __ BCS $5e23 ; (pet2screen.s21 + 0)
.s20:
5e1f : 38 __ __ SEC
5e20 : e9 80 __ SBC #$80
5e22 : 60 __ __ RTS
.s21:
5e23 : c9 ff __ CMP #$ff
5e25 : d0 02 __ BNE $5e29 ; (pet2screen.s1001 + 0)
.s24:
5e27 : a9 5e __ LDA #$5e
.s1001:
5e29 : 60 __ __ RTS
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s0:
5e2a : a9 00 __ LDA #$00
5e2c : 8d fc bf STA $bffc ; (sstack + 4)
5e2f : a0 02 __ LDY #$02
5e31 : b1 23 __ LDA (SP + 0),y 
5e33 : 85 16 __ STA P9 
5e35 : c8 __ __ INY
5e36 : b1 23 __ LDA (SP + 0),y 
5e38 : 85 17 __ STA P10 
5e3a : c8 __ __ INY
5e3b : b1 23 __ LDA (SP + 0),y 
5e3d : 8d f8 bf STA $bff8 ; (sstack + 0)
5e40 : c8 __ __ INY
5e41 : b1 23 __ LDA (SP + 0),y 
5e43 : 8d f9 bf STA $bff9 ; (sstack + 1)
5e46 : 18 __ __ CLC
5e47 : a5 23 __ LDA SP + 0 
5e49 : 69 06 __ ADC #$06
5e4b : 8d fa bf STA $bffa ; (sstack + 2)
5e4e : a5 24 __ LDA SP + 1 
5e50 : 69 00 __ ADC #$00
5e52 : 8d fb bf STA $bffb ; (sstack + 3)
5e55 : 4c f2 4f JMP $4ff2 ; (sformat.s1000 + 0)
--------------------------------------------------------------------
5e58 : __ __ __ BYT 76 64 63 20 4d 45 4d 4f 52 59 20 44 45 54 45 43 : vdc MEMORY DETEC
5e68 : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 2c 20 45 58 54 45 : TED: %U kb, EXTE
5e78 : __ __ __ BYT 4e 44 45 44 20 4d 45 4d 4f 52 59 20 25 53 41 42 : NDED MEMORY %SAB
5e88 : __ __ __ BYT 4c 45 44 2e 00                                  : LED..
--------------------------------------------------------------------
5e8d : __ __ __ BYT 65 4e 00                                        : eN.
--------------------------------------------------------------------
5e90 : __ __ __ BYT 64 49 53 00                                     : dIS.
--------------------------------------------------------------------
5e94 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 3a 00 : lOADING ASSETS:.
--------------------------------------------------------------------
5ea4 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 20 31 3a 20 6c 4f 56 45 : - SCREEN 1: lOVE
5eb4 : __ __ __ BYT 20 49 53 20 41 20 64 52 55 47 00                :  IS A dRUG.
--------------------------------------------------------------------
5ebf : __ __ __ BYT 53 43 52 45 45 4e 31 00                         : SCREEN1.
--------------------------------------------------------------------
menu_fileerrormessage: ; menu_fileerrormessage()->void
.s1000:
5ec7 : a2 06 __ LDX #$06
5ec9 : b5 53 __ LDA T0 + 0,x 
5ecb : 9d d5 bf STA $bfd5,x ; (wrapbuffer + 55)
5ece : ca __ __ DEX
5ecf : 10 f8 __ BPL $5ec9 ; (menu_fileerrormessage.s1000 + 2)
5ed1 : 38 __ __ SEC
5ed2 : a5 23 __ LDA SP + 0 
5ed4 : e9 08 __ SBC #$08
5ed6 : 85 23 __ STA SP + 0 
5ed8 : b0 02 __ BCS $5edc ; (menu_fileerrormessage.s0 + 0)
5eda : c6 24 __ DEC SP + 1 
.s0:
5edc : a9 f0 __ LDA #$f0
5ede : 85 15 __ STA P8 
5ee0 : a9 08 __ LDA #$08
5ee2 : 85 16 __ STA P9 
5ee4 : 85 17 __ STA P10 
5ee6 : a9 1e __ LDA #$1e
5ee8 : 85 18 __ STA P11 
5eea : a9 06 __ LDA #$06
5eec : 8d f8 bf STA $bff8 ; (sstack + 0)
5eef : ad 2d 83 LDA $832d ; (vdc_state + 7)
5ef2 : 85 53 __ STA T0 + 0 
5ef4 : a9 8d __ LDA #$8d
5ef6 : 8d 2d 83 STA $832d ; (vdc_state + 7)
5ef9 : 20 9e 61 JSR $619e ; (vdcwin_win_new.s1000 + 0)
5efc : 20 84 7e JSR $7e84 ; (vdc_coords@proxy + 0)
5eff : a5 1b __ LDA ACCU + 0 
5f01 : 85 54 __ STA T1 + 0 
5f03 : a5 1c __ LDA ACCU + 1 
5f05 : 85 55 __ STA T1 + 1 
5f07 : a9 66 __ LDA #$66
5f09 : 85 0d __ STA P0 
5f0b : a9 6a __ LDA #$6a
5f0d : 85 0e __ STA P1 
5f0f : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
5f12 : a5 1b __ LDA ACCU + 0 
5f14 : 85 56 __ STA T2 + 0 
5f16 : a9 12 __ LDA #$12
5f18 : 8d 00 d6 STA $d600 
5f1b : 18 __ __ CLC
5f1c : a5 54 __ LDA T1 + 0 
5f1e : 6d 2e 83 ADC $832e ; (vdc_state + 8)
5f21 : aa __ __ TAX
5f22 : a5 55 __ LDA T1 + 1 
5f24 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l823:
5f27 : 2c 00 d6 BIT $d600 
5f2a : 10 fb __ BPL $5f27 ; (menu_fileerrormessage.l823 + 0)
.s8:
5f2c : 8d 01 d6 STA $d601 
5f2f : a9 13 __ LDA #$13
5f31 : 8d 00 d6 STA $d600 
.l825:
5f34 : 2c 00 d6 BIT $d600 
5f37 : 10 fb __ BPL $5f34 ; (menu_fileerrormessage.l825 + 0)
.s13:
5f39 : 8e 01 d6 STX $d601 
5f3c : a9 1f __ LDA #$1f
5f3e : 8d 00 d6 STA $d600 
5f41 : a5 1b __ LDA ACCU + 0 
5f43 : f0 19 __ BEQ $5f5e ; (menu_fileerrormessage.s18 + 0)
.s190:
5f45 : a2 00 __ LDX #$00
.l16:
5f47 : 86 58 __ STX T5 + 0 
5f49 : bd 66 6a LDA $6a66,x 
5f4c : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l828:
5f4f : 2c 00 d6 BIT $d600 
5f52 : 10 fb __ BPL $5f4f ; (menu_fileerrormessage.l828 + 0)
.s21:
5f54 : 8d 01 d6 STA $d601 
5f57 : a6 58 __ LDX T5 + 0 
5f59 : e8 __ __ INX
5f5a : e4 56 __ CPX T2 + 0 
5f5c : 90 e9 __ BCC $5f47 ; (menu_fileerrormessage.l16 + 0)
.s18:
5f5e : a9 12 __ LDA #$12
5f60 : 8d 00 d6 STA $d600 
5f63 : c6 56 __ DEC T2 + 0 
5f65 : ad 30 83 LDA $8330 ; (vdc_state + 10)
5f68 : 18 __ __ CLC
5f69 : 65 54 __ ADC T1 + 0 
5f6b : aa __ __ TAX
5f6c : ad 31 83 LDA $8331 ; (vdc_state + 11)
5f6f : 65 55 __ ADC T1 + 1 
.l831:
5f71 : 2c 00 d6 BIT $d600 
5f74 : 10 fb __ BPL $5f71 ; (menu_fileerrormessage.l831 + 0)
.s28:
5f76 : 8d 01 d6 STA $d601 
5f79 : a9 13 __ LDA #$13
5f7b : 8d 00 d6 STA $d600 
.l833:
5f7e : 2c 00 d6 BIT $d600 
5f81 : 10 fb __ BPL $5f7e ; (menu_fileerrormessage.l833 + 0)
.s33:
5f83 : 8e 01 d6 STX $d601 
5f86 : a9 1f __ LDA #$1f
5f88 : 8d 00 d6 STA $d600 
.l835:
5f8b : 2c 00 d6 BIT $d600 
5f8e : 10 fb __ BPL $5f8b ; (menu_fileerrormessage.l835 + 0)
.s37:
5f90 : a9 8d __ LDA #$8d
5f92 : 8d 01 d6 STA $d601 
5f95 : a9 18 __ LDA #$18
5f97 : 8d 00 d6 STA $d600 
.l837:
5f9a : 2c 00 d6 BIT $d600 
5f9d : 10 fb __ BPL $5f9a ; (menu_fileerrormessage.l837 + 0)
.s43:
5f9f : ad 01 d6 LDA $d601 
5fa2 : 29 7f __ AND #$7f
5fa4 : a2 18 __ LDX #$18
5fa6 : 8e 00 d6 STX $d600 
.l839:
5fa9 : 2c 00 d6 BIT $d600 
5fac : 10 fb __ BPL $5fa9 ; (menu_fileerrormessage.l839 + 0)
.s49:
5fae : 8d 01 d6 STA $d601 
5fb1 : a9 1e __ LDA #$1e
5fb3 : 8d 00 d6 STA $d600 
.l841:
5fb6 : 2c 00 d6 BIT $d600 
5fb9 : 10 fb __ BPL $5fb6 ; (menu_fileerrormessage.l841 + 0)
.s54:
5fbb : a5 56 __ LDA T2 + 0 
5fbd : 8d 01 d6 STA $d601 
5fc0 : a9 00 __ LDA #$00
5fc2 : a0 02 __ LDY #$02
5fc4 : 91 23 __ STA (SP + 0),y 
5fc6 : a9 84 __ LDA #$84
5fc8 : c8 __ __ INY
5fc9 : 91 23 __ STA (SP + 0),y 
5fcb : a9 72 __ LDA #$72
5fcd : c8 __ __ INY
5fce : 91 23 __ STA (SP + 0),y 
5fd0 : a9 6a __ LDA #$6a
5fd2 : c8 __ __ INY
5fd3 : 91 23 __ STA (SP + 0),y 
5fd5 : ad d0 83 LDA $83d0 ; (krnio_pstatus + 1)
5fd8 : c8 __ __ INY
5fd9 : 91 23 __ STA (SP + 0),y 
5fdb : a9 00 __ LDA #$00
5fdd : c8 __ __ INY
5fde : 91 23 __ STA (SP + 0),y 
5fe0 : 20 2a 5e JSR $5e2a ; (sprintf.s0 + 0)
5fe3 : a9 0a __ LDA #$0a
5fe5 : 85 0d __ STA P0 
5fe7 : a9 0b __ LDA #$0b
5fe9 : 85 0e __ STA P1 
5feb : ad 2d 83 LDA $832d ; (vdc_state + 7)
5fee : 85 58 __ STA T5 + 0 
5ff0 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
5ff3 : a5 1b __ LDA ACCU + 0 
5ff5 : 85 56 __ STA T2 + 0 
5ff7 : a5 1c __ LDA ACCU + 1 
5ff9 : 85 57 __ STA T2 + 1 
5ffb : 20 c5 5d JSR $5dc5 ; (strlen@proxy + 0)
5ffe : a5 1b __ LDA ACCU + 0 
6000 : 85 54 __ STA T1 + 0 
6002 : ad 2e 83 LDA $832e ; (vdc_state + 8)
6005 : 18 __ __ CLC
6006 : 65 56 __ ADC T2 + 0 
6008 : a2 12 __ LDX #$12
600a : 8e 00 d6 STX $d600 
600d : aa __ __ TAX
600e : ad 2f 83 LDA $832f ; (vdc_state + 9)
6011 : 65 57 __ ADC T2 + 1 
.l843:
6013 : 2c 00 d6 BIT $d600 
6016 : 10 fb __ BPL $6013 ; (menu_fileerrormessage.l843 + 0)
.s62:
6018 : 8d 01 d6 STA $d601 
601b : a9 13 __ LDA #$13
601d : 8d 00 d6 STA $d600 
.l845:
6020 : 2c 00 d6 BIT $d600 
6023 : 10 fb __ BPL $6020 ; (menu_fileerrormessage.l845 + 0)
.s67:
6025 : 8e 01 d6 STX $d601 
6028 : a9 1f __ LDA #$1f
602a : 8d 00 d6 STA $d600 
602d : a5 1b __ LDA ACCU + 0 
602f : f0 19 __ BEQ $604a ; (menu_fileerrormessage.s72 + 0)
.s180:
6031 : a2 00 __ LDX #$00
.l70:
6033 : 86 59 __ STX T6 + 0 
6035 : bd 00 84 LDA $8400,x ; (linebuffer + 0)
6038 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l848:
603b : 2c 00 d6 BIT $d600 
603e : 10 fb __ BPL $603b ; (menu_fileerrormessage.l848 + 0)
.s75:
6040 : 8d 01 d6 STA $d601 
6043 : a6 59 __ LDX T6 + 0 
6045 : e8 __ __ INX
6046 : e4 54 __ CPX T1 + 0 
6048 : 90 e9 __ BCC $6033 ; (menu_fileerrormessage.l70 + 0)
.s72:
604a : a9 12 __ LDA #$12
604c : 8d 00 d6 STA $d600 
604f : c6 54 __ DEC T1 + 0 
6051 : ad 30 83 LDA $8330 ; (vdc_state + 10)
6054 : 18 __ __ CLC
6055 : 65 56 __ ADC T2 + 0 
6057 : aa __ __ TAX
6058 : ad 31 83 LDA $8331 ; (vdc_state + 11)
605b : 65 57 __ ADC T2 + 1 
.l851:
605d : 2c 00 d6 BIT $d600 
6060 : 10 fb __ BPL $605d ; (menu_fileerrormessage.l851 + 0)
.s82:
6062 : 8d 01 d6 STA $d601 
6065 : a9 13 __ LDA #$13
6067 : 8d 00 d6 STA $d600 
.l853:
606a : 2c 00 d6 BIT $d600 
606d : 10 fb __ BPL $606a ; (menu_fileerrormessage.l853 + 0)
.s87:
606f : 8e 01 d6 STX $d601 
6072 : a9 1f __ LDA #$1f
6074 : 8d 00 d6 STA $d600 
.l855:
6077 : 2c 00 d6 BIT $d600 
607a : 10 fb __ BPL $6077 ; (menu_fileerrormessage.l855 + 0)
.s91:
607c : a5 58 __ LDA T5 + 0 
607e : 8d 01 d6 STA $d601 
6081 : a9 18 __ LDA #$18
6083 : 8d 00 d6 STA $d600 
.l857:
6086 : 2c 00 d6 BIT $d600 
6089 : 10 fb __ BPL $6086 ; (menu_fileerrormessage.l857 + 0)
.s97:
608b : ad 01 d6 LDA $d601 
608e : 29 7f __ AND #$7f
6090 : a2 18 __ LDX #$18
6092 : 8e 00 d6 STX $d600 
.l859:
6095 : 2c 00 d6 BIT $d600 
6098 : 10 fb __ BPL $6095 ; (menu_fileerrormessage.l859 + 0)
.s103:
609a : 8d 01 d6 STA $d601 
609d : a9 1e __ LDA #$1e
609f : 8d 00 d6 STA $d600 
.l861:
60a2 : 2c 00 d6 BIT $d600 
60a5 : 10 fb __ BPL $60a2 ; (menu_fileerrormessage.l861 + 0)
.s108:
60a7 : a5 54 __ LDA T1 + 0 
60a9 : 8d 01 d6 STA $d601 
60ac : a9 0a __ LDA #$0a
60ae : 85 0d __ STA P0 
60b0 : a9 0d __ LDA #$0d
60b2 : 85 0e __ STA P1 
60b4 : ad 2d 83 LDA $832d ; (vdc_state + 7)
60b7 : 85 58 __ STA T5 + 0 
60b9 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
60bc : a5 1b __ LDA ACCU + 0 
60be : 85 54 __ STA T1 + 0 
60c0 : a5 1c __ LDA ACCU + 1 
60c2 : 85 55 __ STA T1 + 1 
60c4 : a9 81 __ LDA #$81
60c6 : 85 0d __ STA P0 
60c8 : a9 6a __ LDA #$6a
60ca : 85 0e __ STA P1 
60cc : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
60cf : a5 1b __ LDA ACCU + 0 
60d1 : 85 56 __ STA T2 + 0 
60d3 : a9 12 __ LDA #$12
60d5 : 8d 00 d6 STA $d600 
60d8 : 18 __ __ CLC
60d9 : a5 54 __ LDA T1 + 0 
60db : 6d 2e 83 ADC $832e ; (vdc_state + 8)
60de : aa __ __ TAX
60df : a5 55 __ LDA T1 + 1 
60e1 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l863:
60e4 : 2c 00 d6 BIT $d600 
60e7 : 10 fb __ BPL $60e4 ; (menu_fileerrormessage.l863 + 0)
.s116:
60e9 : 8d 01 d6 STA $d601 
60ec : a9 13 __ LDA #$13
60ee : 8d 00 d6 STA $d600 
.l865:
60f1 : 2c 00 d6 BIT $d600 
60f4 : 10 fb __ BPL $60f1 ; (menu_fileerrormessage.l865 + 0)
.s121:
60f6 : 8e 01 d6 STX $d601 
60f9 : a9 1f __ LDA #$1f
60fb : 8d 00 d6 STA $d600 
60fe : a5 1b __ LDA ACCU + 0 
6100 : f0 19 __ BEQ $611b ; (menu_fileerrormessage.s126 + 0)
.s170:
6102 : a2 00 __ LDX #$00
.l124:
6104 : 86 59 __ STX T6 + 0 
6106 : bd 81 6a LDA $6a81,x 
6109 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l868:
610c : 2c 00 d6 BIT $d600 
610f : 10 fb __ BPL $610c ; (menu_fileerrormessage.l868 + 0)
.s129:
6111 : 8d 01 d6 STA $d601 
6114 : a6 59 __ LDX T6 + 0 
6116 : e8 __ __ INX
6117 : e4 56 __ CPX T2 + 0 
6119 : 90 e9 __ BCC $6104 ; (menu_fileerrormessage.l124 + 0)
.s126:
611b : a9 12 __ LDA #$12
611d : 8d 00 d6 STA $d600 
6120 : c6 56 __ DEC T2 + 0 
6122 : ad 30 83 LDA $8330 ; (vdc_state + 10)
6125 : 18 __ __ CLC
6126 : 65 54 __ ADC T1 + 0 
6128 : aa __ __ TAX
6129 : ad 31 83 LDA $8331 ; (vdc_state + 11)
612c : 65 55 __ ADC T1 + 1 
.l871:
612e : 2c 00 d6 BIT $d600 
6131 : 10 fb __ BPL $612e ; (menu_fileerrormessage.l871 + 0)
.s136:
6133 : 8d 01 d6 STA $d601 
6136 : a9 13 __ LDA #$13
6138 : 8d 00 d6 STA $d600 
.l873:
613b : 2c 00 d6 BIT $d600 
613e : 10 fb __ BPL $613b ; (menu_fileerrormessage.l873 + 0)
.s141:
6140 : 8e 01 d6 STX $d601 
6143 : a9 1f __ LDA #$1f
6145 : 8d 00 d6 STA $d600 
.l875:
6148 : 2c 00 d6 BIT $d600 
614b : 10 fb __ BPL $6148 ; (menu_fileerrormessage.l875 + 0)
.s145:
614d : a5 58 __ LDA T5 + 0 
614f : 8d 01 d6 STA $d601 
6152 : a9 18 __ LDA #$18
6154 : 8d 00 d6 STA $d600 
.l877:
6157 : 2c 00 d6 BIT $d600 
615a : 10 fb __ BPL $6157 ; (menu_fileerrormessage.l877 + 0)
.s151:
615c : ad 01 d6 LDA $d601 
615f : 29 7f __ AND #$7f
6161 : a2 18 __ LDX #$18
6163 : 8e 00 d6 STX $d600 
.l879:
6166 : 2c 00 d6 BIT $d600 
6169 : 10 fb __ BPL $6166 ; (menu_fileerrormessage.l879 + 0)
.s157:
616b : 8d 01 d6 STA $d601 
616e : a9 1e __ LDA #$1e
6170 : 8d 00 d6 STA $d600 
.l881:
6173 : 2c 00 d6 BIT $d600 
6176 : 10 fb __ BPL $6173 ; (menu_fileerrormessage.l881 + 0)
.s162:
6178 : a5 56 __ LDA T2 + 0 
617a : 8d 01 d6 STA $d601 
617d : 20 8c 6a JSR $6a8c ; (vdcwin_getch.s0 + 0)
6180 : 20 9a 6a JSR $6a9a ; (vdcwin_win_free.s0 + 0)
6183 : a5 53 __ LDA T0 + 0 
6185 : 8d 2d 83 STA $832d ; (vdc_state + 7)
.s1001:
6188 : 18 __ __ CLC
6189 : a5 23 __ LDA SP + 0 
618b : 69 08 __ ADC #$08
618d : 85 23 __ STA SP + 0 
618f : 90 02 __ BCC $6193 ; (menu_fileerrormessage.s1001 + 11)
6191 : e6 24 __ INC SP + 1 
6193 : a2 06 __ LDX #$06
6195 : bd d5 bf LDA $bfd5,x ; (wrapbuffer + 55)
6198 : 95 53 __ STA T0 + 0,x 
619a : ca __ __ DEX
619b : 10 f8 __ BPL $6195 ; (menu_fileerrormessage.s1001 + 13)
619d : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_new: ; vdcwin_win_new(u8,u8,u8,u8,u8)->void
.s1000:
619e : a5 53 __ LDA T15 + 0 
61a0 : 8d ed bf STA $bfed ; (wrapbuffer + 79)
61a3 : a5 54 __ LDA T15 + 1 
61a5 : 8d ee bf STA $bfee ; (wrapbuffer + 80)
.s0:
61a8 : a5 18 __ LDA P11 ; (width + 0)
61aa : 85 44 __ STA T1 + 0 
61ac : ad f8 bf LDA $bff8 ; (sstack + 0)
61af : 85 45 __ STA T2 + 0 
61b1 : 85 46 __ STA T3 + 0 
61b3 : a5 16 __ LDA P9 ; (xpos + 0)
61b5 : 85 0d __ STA P0 
61b7 : a5 17 __ LDA P10 ; (ypos + 0)
61b9 : 85 0e __ STA P1 
61bb : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
61be : a5 1b __ LDA ACCU + 0 
61c0 : 85 47 __ STA T6 + 0 
61c2 : a5 1c __ LDA ACCU + 1 
61c4 : 85 48 __ STA T6 + 1 
61c6 : a5 15 __ LDA P8 ; (border + 0)
61c8 : 85 49 __ STA T8 + 0 
61ca : 29 40 __ AND #$40
61cc : 85 4a __ STA T9 + 0 
61ce : f0 13 __ BEQ $61e3 ; (vdcwin_win_new.s2233 + 0)
.s4:
61d0 : a5 16 __ LDA P9 ; (xpos + 0)
61d2 : f0 0f __ BEQ $61e3 ; (vdcwin_win_new.s2233 + 0)
.s1:
61d4 : e6 44 __ INC T1 + 0 
61d6 : 18 __ __ CLC
61d7 : a5 1b __ LDA ACCU + 0 
61d9 : 69 ff __ ADC #$ff
61db : 85 47 __ STA T6 + 0 
61dd : a5 1c __ LDA ACCU + 1 
61df : 69 ff __ ADC #$ff
61e1 : 85 48 __ STA T6 + 1 
.s2233:
61e3 : a5 15 __ LDA P8 ; (border + 0)
61e5 : 29 20 __ AND #$20
61e7 : 85 4b __ STA T10 + 0 
61e9 : f0 15 __ BEQ $6200 ; (vdcwin_win_new.s2235 + 0)
.s8:
61eb : 18 __ __ CLC
61ec : a5 18 __ LDA P11 ; (width + 0)
61ee : 65 16 __ ADC P9 ; (xpos + 0)
61f0 : a8 __ __ TAY
61f1 : a9 00 __ LDA #$00
61f3 : 2a __ __ ROL
61f4 : cd 2a 83 CMP $832a ; (vdc_state + 4)
61f7 : d0 03 __ BNE $61fc ; (vdcwin_win_new.s1159 + 0)
.s1158:
61f9 : cc 29 83 CPY $8329 ; (vdc_state + 3)
.s1159:
61fc : b0 02 __ BCS $6200 ; (vdcwin_win_new.s2235 + 0)
.s5:
61fe : e6 44 __ INC T1 + 0 
.s2235:
6200 : 24 15 __ BIT P8 ; (border + 0)
6202 : 10 1d __ BPL $6221 ; (vdcwin_win_new.s2236 + 0)
.s12:
6204 : a5 17 __ LDA P10 ; (ypos + 0)
6206 : f0 19 __ BEQ $6221 ; (vdcwin_win_new.s2236 + 0)
.s9:
6208 : e6 46 __ INC T3 + 0 
620a : ad 29 83 LDA $8329 ; (vdc_state + 3)
620d : 85 03 __ STA WORK + 0 
620f : ad 2a 83 LDA $832a ; (vdc_state + 4)
6212 : 85 04 __ STA WORK + 1 
6214 : 38 __ __ SEC
6215 : a5 47 __ LDA T6 + 0 
6217 : e5 03 __ SBC WORK + 0 
6219 : 85 47 __ STA T6 + 0 
621b : a5 48 __ LDA T6 + 1 
621d : e5 04 __ SBC WORK + 1 
621f : 85 48 __ STA T6 + 1 
.s2236:
6221 : a5 15 __ LDA P8 ; (border + 0)
6223 : 29 10 __ AND #$10
6225 : f0 15 __ BEQ $623c ; (vdcwin_win_new.s15 + 0)
.s16:
6227 : 18 __ __ CLC
6228 : a5 45 __ LDA T2 + 0 
622a : 65 17 __ ADC P10 ; (ypos + 0)
622c : a8 __ __ TAY
622d : a9 00 __ LDA #$00
622f : 2a __ __ ROL
6230 : cd 2c 83 CMP $832c ; (vdc_state + 6)
6233 : d0 03 __ BNE $6238 ; (vdcwin_win_new.s1157 + 0)
.s1156:
6235 : cc 2b 83 CPY $832b ; (vdc_state + 5)
.s1157:
6238 : b0 02 __ BCS $623c ; (vdcwin_win_new.s15 + 0)
.s13:
623a : e6 46 __ INC T3 + 0 
.s15:
623c : a5 45 __ LDA T2 + 0 
623e : 85 1b __ STA ACCU + 0 
6240 : a9 00 __ LDA #$00
6242 : 85 1c __ STA ACCU + 1 
6244 : a5 18 __ LDA P11 ; (width + 0)
6246 : 20 e3 7c JSR $7ce3 ; (mul16by8 + 0)
6249 : a5 05 __ LDA WORK + 2 
624b : 0a __ __ ASL
624c : 85 4d __ STA T11 + 0 
624e : a5 06 __ LDA WORK + 3 
6250 : 2a __ __ ROL
6251 : 85 4e __ STA T11 + 1 
6253 : ad 24 83 LDA $8324 ; (winCfg + 6)
6256 : 85 4f __ STA T12 + 0 
6258 : 18 __ __ CLC
6259 : 65 4d __ ADC T11 + 0 
625b : 85 4d __ STA T11 + 0 
625d : ad 25 83 LDA $8325 ; (winCfg + 7)
6260 : 85 50 __ STA T12 + 1 
6262 : 65 4e __ ADC T11 + 1 
6264 : 85 4e __ STA T11 + 1 
6266 : ad 1f 83 LDA $831f ; (winCfg + 1)
6269 : 18 __ __ CLC
626a : 6d 21 83 ADC $8321 ; (winCfg + 3)
626d : a8 __ __ TAY
626e : ad 20 83 LDA $8320 ; (winCfg + 2)
6271 : 6d 22 83 ADC $8322 ; (winCfg + 4)
6274 : aa __ __ TAX
6275 : 98 __ __ TYA
6276 : 18 __ __ CLC
6277 : 69 fe __ ADC #$fe
6279 : a8 __ __ TAY
627a : 8a __ __ TXA
627b : 69 ff __ ADC #$ff
627d : c5 4e __ CMP T11 + 1 
627f : d0 02 __ BNE $6283 ; (vdcwin_win_new.s1155 + 0)
.s1154:
6281 : c4 4d __ CPY T11 + 0 
.s1155:
6283 : b0 03 __ BCS $6288 ; (vdcwin_win_new.s19 + 0)
6285 : 4c 68 63 JMP $6368 ; (vdcwin_win_new.s1001 + 0)
.s19:
6288 : ad 23 83 LDA $8323 ; (winCfg + 5)
628b : c9 03 __ CMP #$03
628d : d0 03 __ BNE $6292 ; (vdcwin_win_new.s23 + 0)
628f : 4c 68 63 JMP $6368 ; (vdcwin_win_new.s1001 + 0)
.s23:
6292 : a5 16 __ LDA P9 ; (xpos + 0)
6294 : 85 11 __ STA P4 
6296 : a5 17 __ LDA P10 ; (ypos + 0)
6298 : 85 12 __ STA P5 
629a : a5 18 __ LDA P11 ; (width + 0)
629c : 85 13 __ STA P6 
629e : a5 45 __ LDA T2 + 0 
62a0 : 85 14 __ STA P7 
62a2 : ee 23 83 INC $8323 ; (winCfg + 5)
62a5 : ae 23 83 LDX $8323 ; (winCfg + 5)
62a8 : bd fc 6b LDA $6bfc,x ; (__multab13L + 0)
62ab : 85 4d __ STA T11 + 0 
62ad : 18 __ __ CLC
62ae : 69 47 __ ADC #$47
62b0 : 85 0f __ STA P2 
62b2 : a9 84 __ LDA #$84
62b4 : 69 00 __ ADC #$00
62b6 : 85 10 __ STA P3 
62b8 : 20 15 6a JSR $6a15 ; (vdcwin_init.s0 + 0)
62bb : a5 4f __ LDA T12 + 0 
62bd : a6 4d __ LDX T11 + 0 
62bf : 9d 44 84 STA $8444,x ; (linebuffer + 68)
62c2 : a5 50 __ LDA T12 + 1 
62c4 : 9d 45 84 STA $8445,x ; (linebuffer + 69)
62c7 : a5 15 __ LDA P8 ; (border + 0)
62c9 : 9d 46 84 STA $8446,x ; (linebuffer + 70)
62cc : a5 46 __ LDA T3 + 0 
62ce : f0 03 __ BEQ $62d3 ; (vdcwin_win_new.s28 + 0)
62d0 : 4c 82 69 JMP $6982 ; (vdcwin_win_new.s540 + 0)
.s28:
62d3 : a5 15 __ LDA P8 ; (border + 0)
62d5 : 85 43 __ STA T0 + 0 
62d7 : a5 4d __ LDA T11 + 0 
62d9 : 85 47 __ STA T6 + 0 
62db : a5 49 __ LDA T8 + 0 
62dd : 29 0f __ AND #$0f
62df : 49 ff __ EOR #$ff
62e1 : 18 __ __ CLC
62e2 : 69 01 __ ADC #$01
62e4 : 29 09 __ AND #$09
62e6 : 85 49 __ STA T8 + 0 
62e8 : aa __ __ TAX
62e9 : bd 8f 7e LDA $7e8f,x ; (winStyles + 0)
62ec : 85 44 __ STA T1 + 0 
62ee : a5 4a __ LDA T9 + 0 
62f0 : f0 0a __ BEQ $62fc ; (vdcwin_win_new.s32 + 0)
.s33:
62f2 : a6 4d __ LDX T11 + 0 
62f4 : bd 47 84 LDA $8447,x ; (linebuffer + 71)
62f7 : d0 03 __ BNE $62fc ; (vdcwin_win_new.s32 + 0)
62f9 : 4c 72 69 JMP $6972 ; (vdcwin_win_new.s30 + 0)
.s32:
62fc : a5 4b __ LDA T10 + 0 
62fe : f0 2c __ BEQ $632c ; (vdcwin_win_new.s2246 + 0)
.s37:
6300 : a6 4d __ LDX T11 + 0 
6302 : bd 47 84 LDA $8447,x ; (linebuffer + 71)
6305 : 18 __ __ CLC
6306 : 7d 49 84 ADC $8449,x ; (linebuffer + 73)
6309 : a0 00 __ LDY #$00
630b : 90 01 __ BCC $630e ; (vdcwin_win_new.s1163 + 0)
.s1162:
630d : c8 __ __ INY
.s1163:
630e : 18 __ __ CLC
630f : 69 01 __ ADC #$01
6311 : 85 4b __ STA T10 + 0 
6313 : 90 01 __ BCC $6316 ; (vdcwin_win_new.s1165 + 0)
.s1164:
6315 : c8 __ __ INY
.s1165:
6316 : 84 4c __ STY T10 + 1 
6318 : ad 2a 83 LDA $832a ; (vdc_state + 4)
631b : c5 4c __ CMP T10 + 1 
631d : d0 05 __ BNE $6324 ; (vdcwin_win_new.s1151 + 0)
.s1150:
631f : ad 29 83 LDA $8329 ; (vdc_state + 3)
6322 : c5 4b __ CMP T10 + 0 
.s1151:
6324 : b0 06 __ BCS $632c ; (vdcwin_win_new.s2246 + 0)
.s34:
6326 : a5 43 __ LDA T0 + 0 
6328 : 29 df __ AND #$df
632a : 85 43 __ STA T0 + 0 
.s2246:
632c : 24 43 __ BIT T0 + 0 
632e : 10 0a __ BPL $633a ; (vdcwin_win_new.s2298 + 0)
.s41:
6330 : a6 4d __ LDX T11 + 0 
6332 : bd 48 84 LDA $8448,x ; (linebuffer + 72)
6335 : f0 03 __ BEQ $633a ; (vdcwin_win_new.s2298 + 0)
6337 : 4c 71 67 JMP $6771 ; (vdcwin_win_new.s38 + 0)
.s2298:
633a : a5 43 __ LDA T0 + 0 
633c : 29 10 __ AND #$10
633e : f0 1d __ BEQ $635d ; (vdcwin_win_new.s491 + 0)
.s184:
6340 : a4 47 __ LDY T6 + 0 
6342 : b9 48 84 LDA $8448,y ; (linebuffer + 72)
6345 : 18 __ __ CLC
6346 : 79 4a 84 ADC $844a,y ; (linebuffer + 74)
6349 : 85 0e __ STA P1 
634b : a9 00 __ LDA #$00
634d : 2a __ __ ROL
634e : cd 2c 83 CMP $832c ; (vdc_state + 6)
6351 : d0 05 __ BNE $6358 ; (vdcwin_win_new.s1101 + 0)
.s1100:
6353 : a5 0e __ LDA P1 
6355 : cd 2b 83 CMP $832b ; (vdc_state + 5)
.s1101:
6358 : b0 03 __ BCS $635d ; (vdcwin_win_new.s491 + 0)
635a : 4c 76 65 JMP $6576 ; (vdcwin_win_new.s181 + 0)
.s491:
635d : a9 00 __ LDA #$00
635f : 85 45 __ STA T2 + 0 
.l324:
6361 : a4 47 __ LDY T6 + 0 
6363 : d9 4a 84 CMP $844a,y ; (linebuffer + 74)
6366 : 90 0b __ BCC $6373 ; (vdcwin_win_new.s325 + 0)
.s1001:
6368 : ad ed bf LDA $bfed ; (wrapbuffer + 79)
636b : 85 53 __ STA T15 + 0 
636d : ad ee bf LDA $bfee ; (wrapbuffer + 80)
6370 : 85 54 __ STA T15 + 1 
6372 : 60 __ __ RTS
.s325:
6373 : a5 43 __ LDA T0 + 0 
6375 : 0a __ __ ASL
6376 : 10 03 __ BPL $637b ; (vdcwin_win_new.s330 + 0)
6378 : 4c f1 64 JMP $64f1 ; (vdcwin_win_new.s328 + 0)
.s330:
637b : a6 47 __ LDX T6 + 0 
637d : bd 47 84 LDA $8447,x ; (linebuffer + 71)
6380 : 85 0d __ STA P0 
6382 : bd 48 84 LDA $8448,x ; (linebuffer + 72)
6385 : 18 __ __ CLC
6386 : 65 45 __ ADC T2 + 0 
6388 : 85 0e __ STA P1 
638a : ad 2d 83 LDA $832d ; (vdc_state + 7)
638d : 85 46 __ STA T3 + 0 
638f : bd 49 84 LDA $8449,x ; (linebuffer + 73)
6392 : 38 __ __ SEC
6393 : e9 01 __ SBC #$01
6395 : 85 51 __ STA T14 + 0 
6397 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
639a : a9 12 __ LDA #$12
639c : 8d 00 d6 STA $d600 
639f : ad 2e 83 LDA $832e ; (vdc_state + 8)
63a2 : 85 4f __ STA T12 + 0 
63a4 : 18 __ __ CLC
63a5 : 65 1b __ ADC ACCU + 0 
63a7 : a8 __ __ TAY
63a8 : ad 2f 83 LDA $832f ; (vdc_state + 9)
63ab : 85 50 __ STA T12 + 1 
63ad : 65 1c __ ADC ACCU + 1 
.l2364:
63af : 2c 00 d6 BIT $d600 
63b2 : 10 fb __ BPL $63af ; (vdcwin_win_new.l2364 + 0)
.s371:
63b4 : 8d 01 d6 STA $d601 
63b7 : a9 13 __ LDA #$13
63b9 : 8d 00 d6 STA $d600 
.l2366:
63bc : 2c 00 d6 BIT $d600 
63bf : 10 fb __ BPL $63bc ; (vdcwin_win_new.l2366 + 0)
.s376:
63c1 : 8c 01 d6 STY $d601 
63c4 : a9 1f __ LDA #$1f
63c6 : 8d 00 d6 STA $d600 
.l2368:
63c9 : 2c 00 d6 BIT $d600 
63cc : 10 fb __ BPL $63c9 ; (vdcwin_win_new.l2368 + 0)
.s380:
63ce : a9 20 __ LDA #$20
63d0 : 8d 01 d6 STA $d601 
63d3 : a9 18 __ LDA #$18
63d5 : 8d 00 d6 STA $d600 
.l2370:
63d8 : 2c 00 d6 BIT $d600 
63db : 10 fb __ BPL $63d8 ; (vdcwin_win_new.l2370 + 0)
.s386:
63dd : ad 01 d6 LDA $d601 
63e0 : 29 7f __ AND #$7f
63e2 : a2 18 __ LDX #$18
63e4 : 8e 00 d6 STX $d600 
.l2372:
63e7 : 2c 00 d6 BIT $d600 
63ea : 10 fb __ BPL $63e7 ; (vdcwin_win_new.l2372 + 0)
.s392:
63ec : 8d 01 d6 STA $d601 
63ef : a9 1e __ LDA #$1e
63f1 : 8d 00 d6 STA $d600 
.l2374:
63f4 : 2c 00 d6 BIT $d600 
63f7 : 10 fb __ BPL $63f4 ; (vdcwin_win_new.l2374 + 0)
.s397:
63f9 : a5 51 __ LDA T14 + 0 
63fb : 8d 01 d6 STA $d601 
63fe : a9 12 __ LDA #$12
6400 : 8d 00 d6 STA $d600 
6403 : ad 30 83 LDA $8330 ; (vdc_state + 10)
6406 : 85 53 __ STA T15 + 0 
6408 : 18 __ __ CLC
6409 : 65 1b __ ADC ACCU + 0 
640b : a8 __ __ TAY
640c : ad 31 83 LDA $8331 ; (vdc_state + 11)
640f : 85 54 __ STA T15 + 1 
6411 : 65 1c __ ADC ACCU + 1 
.l2376:
6413 : 2c 00 d6 BIT $d600 
6416 : 10 fb __ BPL $6413 ; (vdcwin_win_new.l2376 + 0)
.s404:
6418 : 8d 01 d6 STA $d601 
641b : a9 13 __ LDA #$13
641d : 8d 00 d6 STA $d600 
.l2378:
6420 : 2c 00 d6 BIT $d600 
6423 : 10 fb __ BPL $6420 ; (vdcwin_win_new.l2378 + 0)
.s409:
6425 : 8c 01 d6 STY $d601 
6428 : a9 1f __ LDA #$1f
642a : 8d 00 d6 STA $d600 
.l2380:
642d : 2c 00 d6 BIT $d600 
6430 : 10 fb __ BPL $642d ; (vdcwin_win_new.l2380 + 0)
.s413:
6432 : a5 46 __ LDA T3 + 0 
6434 : 8d 01 d6 STA $d601 
6437 : 8e 00 d6 STX $d600 
.l2382:
643a : 2c 00 d6 BIT $d600 
643d : 10 fb __ BPL $643a ; (vdcwin_win_new.l2382 + 0)
.s419:
643f : ad 01 d6 LDA $d601 
6442 : 29 7f __ AND #$7f
6444 : 8e 00 d6 STX $d600 
.l2384:
6447 : 2c 00 d6 BIT $d600 
644a : 10 fb __ BPL $6447 ; (vdcwin_win_new.l2384 + 0)
.s425:
644c : 8d 01 d6 STA $d601 
644f : a9 1e __ LDA #$1e
6451 : 8d 00 d6 STA $d600 
.l2386:
6454 : 2c 00 d6 BIT $d600 
6457 : 10 fb __ BPL $6454 ; (vdcwin_win_new.l2386 + 0)
.s430:
6459 : a5 51 __ LDA T14 + 0 
645b : 8d 01 d6 STA $d601 
645e : a5 43 __ LDA T0 + 0 
6460 : 29 20 __ AND #$20
6462 : d0 07 __ BNE $646b ; (vdcwin_win_new.s431 + 0)
.s2407:
6464 : e6 45 __ INC T2 + 0 
6466 : a5 45 __ LDA T2 + 0 
6468 : 4c 61 63 JMP $6361 ; (vdcwin_win_new.l324 + 0)
.s431:
646b : a6 47 __ LDX T6 + 0 
646d : bd 47 84 LDA $8447,x ; (linebuffer + 71)
6470 : 18 __ __ CLC
6471 : 7d 49 84 ADC $8449,x ; (linebuffer + 73)
6474 : 85 0d __ STA P0 
6476 : bd 48 84 LDA $8448,x ; (linebuffer + 72)
6479 : 18 __ __ CLC
647a : 65 45 __ ADC T2 + 0 
647c : 85 0e __ STA P1 
647e : a6 49 __ LDX T8 + 0 
6480 : bd 97 7e LDA $7e97,x ; (winStyles + 8)
6483 : 85 46 __ STA T3 + 0 
6485 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
6488 : a9 12 __ LDA #$12
648a : 8d 00 d6 STA $d600 
648d : 18 __ __ CLC
648e : a5 1b __ LDA ACCU + 0 
6490 : 65 4f __ ADC T12 + 0 
6492 : a8 __ __ TAY
6493 : a5 1c __ LDA ACCU + 1 
6495 : 65 50 __ ADC T12 + 1 
.l2389:
6497 : 2c 00 d6 BIT $d600 
649a : 10 fb __ BPL $6497 ; (vdcwin_win_new.l2389 + 0)
.s441:
649c : 8d 01 d6 STA $d601 
649f : a9 13 __ LDA #$13
64a1 : 8d 00 d6 STA $d600 
.l2391:
64a4 : 2c 00 d6 BIT $d600 
64a7 : 10 fb __ BPL $64a4 ; (vdcwin_win_new.l2391 + 0)
.s446:
64a9 : 8c 01 d6 STY $d601 
64ac : a9 1f __ LDA #$1f
64ae : 8d 00 d6 STA $d600 
.l2393:
64b1 : 2c 00 d6 BIT $d600 
64b4 : 10 fb __ BPL $64b1 ; (vdcwin_win_new.l2393 + 0)
.s450:
64b6 : a5 46 __ LDA T3 + 0 
64b8 : 8d 01 d6 STA $d601 
64bb : a9 12 __ LDA #$12
64bd : 8d 00 d6 STA $d600 
64c0 : 18 __ __ CLC
64c1 : a5 1b __ LDA ACCU + 0 
64c3 : 65 53 __ ADC T15 + 0 
64c5 : a8 __ __ TAY
64c6 : a5 1c __ LDA ACCU + 1 
64c8 : 65 54 __ ADC T15 + 1 
.l2395:
64ca : 2c 00 d6 BIT $d600 
64cd : 10 fb __ BPL $64ca ; (vdcwin_win_new.l2395 + 0)
.s457:
64cf : 8d 01 d6 STA $d601 
64d2 : a9 13 __ LDA #$13
64d4 : 8d 00 d6 STA $d600 
.l2397:
64d7 : 2c 00 d6 BIT $d600 
64da : 10 fb __ BPL $64d7 ; (vdcwin_win_new.l2397 + 0)
.s462:
64dc : 8c 01 d6 STY $d601 
64df : a9 1f __ LDA #$1f
64e1 : 8d 00 d6 STA $d600 
.l2399:
64e4 : 2c 00 d6 BIT $d600 
64e7 : 10 fb __ BPL $64e4 ; (vdcwin_win_new.l2399 + 0)
.s466:
64e9 : a5 44 __ LDA T1 + 0 
64eb : 8d 01 d6 STA $d601 
64ee : 4c 64 64 JMP $6464 ; (vdcwin_win_new.s2407 + 0)
.s328:
64f1 : be 47 84 LDX $8447,y ; (linebuffer + 71)
64f4 : ca __ __ DEX
64f5 : 86 0d __ STX P0 
64f7 : b9 48 84 LDA $8448,y ; (linebuffer + 72)
64fa : 18 __ __ CLC
64fb : 65 45 __ ADC T2 + 0 
64fd : 85 0e __ STA P1 
64ff : a6 49 __ LDX T8 + 0 
6501 : bd 96 7e LDA $7e96,x ; (winStyles + 7)
6504 : 85 46 __ STA T3 + 0 
6506 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
6509 : a9 12 __ LDA #$12
650b : 8d 00 d6 STA $d600 
650e : 18 __ __ CLC
650f : a5 1b __ LDA ACCU + 0 
6511 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
6514 : a8 __ __ TAY
6515 : a5 1c __ LDA ACCU + 1 
6517 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l2352:
651a : 2c 00 d6 BIT $d600 
651d : 10 fb __ BPL $651a ; (vdcwin_win_new.l2352 + 0)
.s338:
651f : 8d 01 d6 STA $d601 
6522 : a9 13 __ LDA #$13
6524 : 8d 00 d6 STA $d600 
.l2354:
6527 : 2c 00 d6 BIT $d600 
652a : 10 fb __ BPL $6527 ; (vdcwin_win_new.l2354 + 0)
.s343:
652c : 8c 01 d6 STY $d601 
652f : a9 1f __ LDA #$1f
6531 : 8d 00 d6 STA $d600 
.l2356:
6534 : 2c 00 d6 BIT $d600 
6537 : 10 fb __ BPL $6534 ; (vdcwin_win_new.l2356 + 0)
.s347:
6539 : a5 46 __ LDA T3 + 0 
653b : 8d 01 d6 STA $d601 
653e : ad 30 83 LDA $8330 ; (vdc_state + 10)
6541 : 18 __ __ CLC
6542 : 65 1b __ ADC ACCU + 0 
6544 : a8 __ __ TAY
6545 : a9 12 __ LDA #$12
6547 : 8d 00 d6 STA $d600 
654a : ad 31 83 LDA $8331 ; (vdc_state + 11)
654d : 65 1c __ ADC ACCU + 1 
.l2358:
654f : 2c 00 d6 BIT $d600 
6552 : 10 fb __ BPL $654f ; (vdcwin_win_new.l2358 + 0)
.s354:
6554 : 8d 01 d6 STA $d601 
6557 : a9 13 __ LDA #$13
6559 : 8d 00 d6 STA $d600 
.l2360:
655c : 2c 00 d6 BIT $d600 
655f : 10 fb __ BPL $655c ; (vdcwin_win_new.l2360 + 0)
.s359:
6561 : 8c 01 d6 STY $d601 
6564 : a9 1f __ LDA #$1f
6566 : 8d 00 d6 STA $d600 
.l2362:
6569 : 2c 00 d6 BIT $d600 
656c : 10 fb __ BPL $6569 ; (vdcwin_win_new.l2362 + 0)
.s363:
656e : a5 44 __ LDA T1 + 0 
6570 : 8d 01 d6 STA $d601 
6573 : 4c 7b 63 JMP $637b ; (vdcwin_win_new.s330 + 0)
.s181:
6576 : a5 43 __ LDA T0 + 0 
6578 : 0a __ __ ASL
6579 : 10 03 __ BPL $657e ; (vdcwin_win_new.s187 + 0)
657b : 4c f4 66 JMP $66f4 ; (vdcwin_win_new.s185 + 0)
.s187:
657e : a6 47 __ LDX T6 + 0 
6580 : bd 47 84 LDA $8447,x ; (linebuffer + 71)
6583 : 85 0d __ STA P0 
6585 : bd 48 84 LDA $8448,x ; (linebuffer + 72)
6588 : 18 __ __ CLC
6589 : 7d 4a 84 ADC $844a,x ; (linebuffer + 74)
658c : 85 0e __ STA P1 
658e : a4 49 __ LDY T8 + 0 
6590 : b9 95 7e LDA $7e95,y ; (winStyles + 6)
6593 : 85 45 __ STA T2 + 0 
6595 : bd 49 84 LDA $8449,x ; (linebuffer + 73)
6598 : 38 __ __ SEC
6599 : e9 01 __ SBC #$01
659b : 85 4f __ STA T12 + 0 
659d : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
65a0 : a9 12 __ LDA #$12
65a2 : 8d 00 d6 STA $d600 
65a5 : ad 2e 83 LDA $832e ; (vdc_state + 8)
65a8 : 85 4d __ STA T11 + 0 
65aa : 18 __ __ CLC
65ab : 65 1b __ ADC ACCU + 0 
65ad : a8 __ __ TAY
65ae : ad 2f 83 LDA $832f ; (vdc_state + 9)
65b1 : 85 4e __ STA T11 + 1 
65b3 : 65 1c __ ADC ACCU + 1 
.l2313:
65b5 : 2c 00 d6 BIT $d600 
65b8 : 10 fb __ BPL $65b5 ; (vdcwin_win_new.l2313 + 0)
.s228:
65ba : 8d 01 d6 STA $d601 
65bd : a9 13 __ LDA #$13
65bf : 8d 00 d6 STA $d600 
.l2315:
65c2 : 2c 00 d6 BIT $d600 
65c5 : 10 fb __ BPL $65c2 ; (vdcwin_win_new.l2315 + 0)
.s233:
65c7 : 8c 01 d6 STY $d601 
65ca : a9 1f __ LDA #$1f
65cc : 8d 00 d6 STA $d600 
.l2317:
65cf : 2c 00 d6 BIT $d600 
65d2 : 10 fb __ BPL $65cf ; (vdcwin_win_new.l2317 + 0)
.s237:
65d4 : a5 45 __ LDA T2 + 0 
65d6 : 8d 01 d6 STA $d601 
65d9 : a9 18 __ LDA #$18
65db : 8d 00 d6 STA $d600 
.l2319:
65de : 2c 00 d6 BIT $d600 
65e1 : 10 fb __ BPL $65de ; (vdcwin_win_new.l2319 + 0)
.s243:
65e3 : ad 01 d6 LDA $d601 
65e6 : 29 7f __ AND #$7f
65e8 : a2 18 __ LDX #$18
65ea : 8e 00 d6 STX $d600 
.l2321:
65ed : 2c 00 d6 BIT $d600 
65f0 : 10 fb __ BPL $65ed ; (vdcwin_win_new.l2321 + 0)
.s249:
65f2 : 8d 01 d6 STA $d601 
65f5 : a9 1e __ LDA #$1e
65f7 : 8d 00 d6 STA $d600 
.l2323:
65fa : 2c 00 d6 BIT $d600 
65fd : 10 fb __ BPL $65fa ; (vdcwin_win_new.l2323 + 0)
.s254:
65ff : a5 4f __ LDA T12 + 0 
6601 : 8d 01 d6 STA $d601 
6604 : a9 12 __ LDA #$12
6606 : 8d 00 d6 STA $d600 
6609 : ad 30 83 LDA $8330 ; (vdc_state + 10)
660c : 85 51 __ STA T14 + 0 
660e : 18 __ __ CLC
660f : 65 1b __ ADC ACCU + 0 
6611 : a8 __ __ TAY
6612 : ad 31 83 LDA $8331 ; (vdc_state + 11)
6615 : 85 52 __ STA T14 + 1 
6617 : 65 1c __ ADC ACCU + 1 
.l2325:
6619 : 2c 00 d6 BIT $d600 
661c : 10 fb __ BPL $6619 ; (vdcwin_win_new.l2325 + 0)
.s261:
661e : 8d 01 d6 STA $d601 
6621 : a9 13 __ LDA #$13
6623 : 8d 00 d6 STA $d600 
.l2327:
6626 : 2c 00 d6 BIT $d600 
6629 : 10 fb __ BPL $6626 ; (vdcwin_win_new.l2327 + 0)
.s266:
662b : 8c 01 d6 STY $d601 
662e : a9 1f __ LDA #$1f
6630 : 8d 00 d6 STA $d600 
.l2329:
6633 : 2c 00 d6 BIT $d600 
6636 : 10 fb __ BPL $6633 ; (vdcwin_win_new.l2329 + 0)
.s270:
6638 : a5 44 __ LDA T1 + 0 
663a : 8d 01 d6 STA $d601 
663d : 8e 00 d6 STX $d600 
.l2331:
6640 : 2c 00 d6 BIT $d600 
6643 : 10 fb __ BPL $6640 ; (vdcwin_win_new.l2331 + 0)
.s276:
6645 : ad 01 d6 LDA $d601 
6648 : 29 7f __ AND #$7f
664a : 8e 00 d6 STX $d600 
.l2333:
664d : 2c 00 d6 BIT $d600 
6650 : 10 fb __ BPL $664d ; (vdcwin_win_new.l2333 + 0)
.s282:
6652 : 8d 01 d6 STA $d601 
6655 : a9 1e __ LDA #$1e
6657 : 8d 00 d6 STA $d600 
.l2335:
665a : 2c 00 d6 BIT $d600 
665d : 10 fb __ BPL $665a ; (vdcwin_win_new.l2335 + 0)
.s287:
665f : a5 4f __ LDA T12 + 0 
6661 : 8d 01 d6 STA $d601 
6664 : a5 43 __ LDA T0 + 0 
6666 : 29 20 __ AND #$20
6668 : d0 03 __ BNE $666d ; (vdcwin_win_new.s288 + 0)
666a : 4c 5d 63 JMP $635d ; (vdcwin_win_new.s491 + 0)
.s288:
666d : a6 47 __ LDX T6 + 0 
666f : bd 47 84 LDA $8447,x ; (linebuffer + 71)
6672 : 18 __ __ CLC
6673 : 7d 49 84 ADC $8449,x ; (linebuffer + 73)
6676 : 85 0d __ STA P0 
6678 : bd 48 84 LDA $8448,x ; (linebuffer + 72)
667b : 18 __ __ CLC
667c : 7d 4a 84 ADC $844a,x ; (linebuffer + 74)
667f : 85 0e __ STA P1 
6681 : a6 49 __ LDX T8 + 0 
6683 : bd 93 7e LDA $7e93,x ; (winStyles + 4)
6686 : 85 45 __ STA T2 + 0 
6688 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
668b : a9 12 __ LDA #$12
668d : 8d 00 d6 STA $d600 
6690 : 18 __ __ CLC
6691 : a5 1b __ LDA ACCU + 0 
6693 : 65 4d __ ADC T11 + 0 
6695 : a8 __ __ TAY
6696 : a5 1c __ LDA ACCU + 1 
6698 : 65 4e __ ADC T11 + 1 
.l2338:
669a : 2c 00 d6 BIT $d600 
669d : 10 fb __ BPL $669a ; (vdcwin_win_new.l2338 + 0)
.s298:
669f : 8d 01 d6 STA $d601 
66a2 : a9 13 __ LDA #$13
66a4 : 8d 00 d6 STA $d600 
.l2340:
66a7 : 2c 00 d6 BIT $d600 
66aa : 10 fb __ BPL $66a7 ; (vdcwin_win_new.l2340 + 0)
.s303:
66ac : 8c 01 d6 STY $d601 
66af : a9 1f __ LDA #$1f
66b1 : 8d 00 d6 STA $d600 
.l2342:
66b4 : 2c 00 d6 BIT $d600 
66b7 : 10 fb __ BPL $66b4 ; (vdcwin_win_new.l2342 + 0)
.s307:
66b9 : a5 45 __ LDA T2 + 0 
66bb : 8d 01 d6 STA $d601 
66be : a9 12 __ LDA #$12
66c0 : 8d 00 d6 STA $d600 
66c3 : 18 __ __ CLC
66c4 : a5 1b __ LDA ACCU + 0 
66c6 : 65 51 __ ADC T14 + 0 
66c8 : a8 __ __ TAY
66c9 : a5 1c __ LDA ACCU + 1 
66cb : 65 52 __ ADC T14 + 1 
.l2344:
66cd : 2c 00 d6 BIT $d600 
66d0 : 10 fb __ BPL $66cd ; (vdcwin_win_new.l2344 + 0)
.s314:
66d2 : 8d 01 d6 STA $d601 
66d5 : a9 13 __ LDA #$13
66d7 : 8d 00 d6 STA $d600 
.l2346:
66da : 2c 00 d6 BIT $d600 
66dd : 10 fb __ BPL $66da ; (vdcwin_win_new.l2346 + 0)
.s319:
66df : 8c 01 d6 STY $d601 
66e2 : a9 1f __ LDA #$1f
66e4 : 8d 00 d6 STA $d600 
.l2348:
66e7 : 2c 00 d6 BIT $d600 
66ea : 10 fb __ BPL $66e7 ; (vdcwin_win_new.l2348 + 0)
.s323:
66ec : a5 44 __ LDA T1 + 0 
66ee : 8d 01 d6 STA $d601 
66f1 : 4c 5d 63 JMP $635d ; (vdcwin_win_new.s491 + 0)
.s185:
66f4 : be 47 84 LDX $8447,y ; (linebuffer + 71)
66f7 : ca __ __ DEX
66f8 : 86 0d __ STX P0 
66fa : a6 49 __ LDX T8 + 0 
66fc : bd 92 7e LDA $7e92,x ; (winStyles + 3)
66ff : 85 45 __ STA T2 + 0 
6701 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
6704 : a9 12 __ LDA #$12
6706 : 8d 00 d6 STA $d600 
6709 : 18 __ __ CLC
670a : a5 1b __ LDA ACCU + 0 
670c : 6d 2e 83 ADC $832e ; (vdc_state + 8)
670f : a8 __ __ TAY
6710 : a5 1c __ LDA ACCU + 1 
6712 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l2301:
6715 : 2c 00 d6 BIT $d600 
6718 : 10 fb __ BPL $6715 ; (vdcwin_win_new.l2301 + 0)
.s195:
671a : 8d 01 d6 STA $d601 
671d : a9 13 __ LDA #$13
671f : 8d 00 d6 STA $d600 
.l2303:
6722 : 2c 00 d6 BIT $d600 
6725 : 10 fb __ BPL $6722 ; (vdcwin_win_new.l2303 + 0)
.s200:
6727 : 8c 01 d6 STY $d601 
672a : a9 1f __ LDA #$1f
672c : 8d 00 d6 STA $d600 
.l2305:
672f : 2c 00 d6 BIT $d600 
6732 : 10 fb __ BPL $672f ; (vdcwin_win_new.l2305 + 0)
.s204:
6734 : a5 45 __ LDA T2 + 0 
6736 : 8d 01 d6 STA $d601 
6739 : ad 30 83 LDA $8330 ; (vdc_state + 10)
673c : 18 __ __ CLC
673d : 65 1b __ ADC ACCU + 0 
673f : a8 __ __ TAY
6740 : a9 12 __ LDA #$12
6742 : 8d 00 d6 STA $d600 
6745 : ad 31 83 LDA $8331 ; (vdc_state + 11)
6748 : 65 1c __ ADC ACCU + 1 
.l2307:
674a : 2c 00 d6 BIT $d600 
674d : 10 fb __ BPL $674a ; (vdcwin_win_new.l2307 + 0)
.s211:
674f : 8d 01 d6 STA $d601 
6752 : a9 13 __ LDA #$13
6754 : 8d 00 d6 STA $d600 
.l2309:
6757 : 2c 00 d6 BIT $d600 
675a : 10 fb __ BPL $6757 ; (vdcwin_win_new.l2309 + 0)
.s216:
675c : 8c 01 d6 STY $d601 
675f : a9 1f __ LDA #$1f
6761 : 8d 00 d6 STA $d600 
.l2311:
6764 : 2c 00 d6 BIT $d600 
6767 : 10 fb __ BPL $6764 ; (vdcwin_win_new.l2311 + 0)
.s220:
6769 : a5 44 __ LDA T1 + 0 
676b : 8d 01 d6 STA $d601 
676e : 4c 7e 65 JMP $657e ; (vdcwin_win_new.s187 + 0)
.s38:
6771 : a5 43 __ LDA T0 + 0 
6773 : 0a __ __ ASL
6774 : 10 03 __ BPL $6779 ; (vdcwin_win_new.s44 + 0)
6776 : 4c ed 68 JMP $68ed ; (vdcwin_win_new.s42 + 0)
.s44:
6779 : a6 4d __ LDX T11 + 0 
677b : bd 47 84 LDA $8447,x ; (linebuffer + 71)
677e : 85 0d __ STA P0 
6780 : bd 48 84 LDA $8448,x ; (linebuffer + 72)
6783 : 38 __ __ SEC
6784 : e9 01 __ SBC #$01
6786 : 85 0e __ STA P1 
6788 : a4 49 __ LDY T8 + 0 
678a : b9 94 7e LDA $7e94,y ; (winStyles + 5)
678d : 85 45 __ STA T2 + 0 
678f : bd 49 84 LDA $8449,x ; (linebuffer + 73)
6792 : 38 __ __ SEC
6793 : e9 01 __ SBC #$01
6795 : 85 4f __ STA T12 + 0 
6797 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
679a : a9 12 __ LDA #$12
679c : 8d 00 d6 STA $d600 
679f : ad 2e 83 LDA $832e ; (vdc_state + 8)
67a2 : 85 4d __ STA T11 + 0 
67a4 : 18 __ __ CLC
67a5 : 65 1b __ ADC ACCU + 0 
67a7 : a8 __ __ TAY
67a8 : ad 2f 83 LDA $832f ; (vdc_state + 9)
67ab : 85 4e __ STA T11 + 1 
67ad : 65 1c __ ADC ACCU + 1 
.l2261:
67af : 2c 00 d6 BIT $d600 
67b2 : 10 fb __ BPL $67af ; (vdcwin_win_new.l2261 + 0)
.s85:
67b4 : 8d 01 d6 STA $d601 
67b7 : a9 13 __ LDA #$13
67b9 : 8d 00 d6 STA $d600 
.l2263:
67bc : 2c 00 d6 BIT $d600 
67bf : 10 fb __ BPL $67bc ; (vdcwin_win_new.l2263 + 0)
.s90:
67c1 : 8c 01 d6 STY $d601 
67c4 : a9 1f __ LDA #$1f
67c6 : 8d 00 d6 STA $d600 
.l2265:
67c9 : 2c 00 d6 BIT $d600 
67cc : 10 fb __ BPL $67c9 ; (vdcwin_win_new.l2265 + 0)
.s94:
67ce : a5 45 __ LDA T2 + 0 
67d0 : 8d 01 d6 STA $d601 
67d3 : a9 18 __ LDA #$18
67d5 : 8d 00 d6 STA $d600 
.l2267:
67d8 : 2c 00 d6 BIT $d600 
67db : 10 fb __ BPL $67d8 ; (vdcwin_win_new.l2267 + 0)
.s100:
67dd : ad 01 d6 LDA $d601 
67e0 : 29 7f __ AND #$7f
67e2 : a2 18 __ LDX #$18
67e4 : 8e 00 d6 STX $d600 
.l2269:
67e7 : 2c 00 d6 BIT $d600 
67ea : 10 fb __ BPL $67e7 ; (vdcwin_win_new.l2269 + 0)
.s106:
67ec : 8d 01 d6 STA $d601 
67ef : a9 1e __ LDA #$1e
67f1 : 8d 00 d6 STA $d600 
.l2271:
67f4 : 2c 00 d6 BIT $d600 
67f7 : 10 fb __ BPL $67f4 ; (vdcwin_win_new.l2271 + 0)
.s111:
67f9 : a5 4f __ LDA T12 + 0 
67fb : 8d 01 d6 STA $d601 
67fe : a9 12 __ LDA #$12
6800 : 8d 00 d6 STA $d600 
6803 : ad 30 83 LDA $8330 ; (vdc_state + 10)
6806 : 85 51 __ STA T14 + 0 
6808 : 18 __ __ CLC
6809 : 65 1b __ ADC ACCU + 0 
680b : a8 __ __ TAY
680c : ad 31 83 LDA $8331 ; (vdc_state + 11)
680f : 85 52 __ STA T14 + 1 
6811 : 65 1c __ ADC ACCU + 1 
.l2273:
6813 : 2c 00 d6 BIT $d600 
6816 : 10 fb __ BPL $6813 ; (vdcwin_win_new.l2273 + 0)
.s118:
6818 : 8d 01 d6 STA $d601 
681b : a9 13 __ LDA #$13
681d : 8d 00 d6 STA $d600 
.l2275:
6820 : 2c 00 d6 BIT $d600 
6823 : 10 fb __ BPL $6820 ; (vdcwin_win_new.l2275 + 0)
.s123:
6825 : 8c 01 d6 STY $d601 
6828 : a9 1f __ LDA #$1f
682a : 8d 00 d6 STA $d600 
.l2277:
682d : 2c 00 d6 BIT $d600 
6830 : 10 fb __ BPL $682d ; (vdcwin_win_new.l2277 + 0)
.s127:
6832 : a5 44 __ LDA T1 + 0 
6834 : 8d 01 d6 STA $d601 
6837 : 8e 00 d6 STX $d600 
.l2279:
683a : 2c 00 d6 BIT $d600 
683d : 10 fb __ BPL $683a ; (vdcwin_win_new.l2279 + 0)
.s133:
683f : ad 01 d6 LDA $d601 
6842 : 29 7f __ AND #$7f
6844 : 8e 00 d6 STX $d600 
.l2281:
6847 : 2c 00 d6 BIT $d600 
684a : 10 fb __ BPL $6847 ; (vdcwin_win_new.l2281 + 0)
.s139:
684c : 8d 01 d6 STA $d601 
684f : a9 1e __ LDA #$1e
6851 : 8d 00 d6 STA $d600 
.l2283:
6854 : 2c 00 d6 BIT $d600 
6857 : 10 fb __ BPL $6854 ; (vdcwin_win_new.l2283 + 0)
.s144:
6859 : a5 4f __ LDA T12 + 0 
685b : 8d 01 d6 STA $d601 
685e : a5 43 __ LDA T0 + 0 
6860 : 29 20 __ AND #$20
6862 : d0 03 __ BNE $6867 ; (vdcwin_win_new.s145 + 0)
6864 : 4c 3a 63 JMP $633a ; (vdcwin_win_new.s2298 + 0)
.s145:
6867 : a6 47 __ LDX T6 + 0 
6869 : bd 47 84 LDA $8447,x ; (linebuffer + 71)
686c : 18 __ __ CLC
686d : 7d 49 84 ADC $8449,x ; (linebuffer + 73)
6870 : 85 0d __ STA P0 
6872 : bd 48 84 LDA $8448,x ; (linebuffer + 72)
6875 : 38 __ __ SEC
6876 : e9 01 __ SBC #$01
6878 : 85 0e __ STA P1 
687a : a6 49 __ LDX T8 + 0 
687c : bd 91 7e LDA $7e91,x ; (winStyles + 2)
687f : 85 45 __ STA T2 + 0 
6881 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
6884 : a9 12 __ LDA #$12
6886 : 8d 00 d6 STA $d600 
6889 : 18 __ __ CLC
688a : a5 1b __ LDA ACCU + 0 
688c : 65 4d __ ADC T11 + 0 
688e : a8 __ __ TAY
688f : a5 1c __ LDA ACCU + 1 
6891 : 65 4e __ ADC T11 + 1 
.l2286:
6893 : 2c 00 d6 BIT $d600 
6896 : 10 fb __ BPL $6893 ; (vdcwin_win_new.l2286 + 0)
.s155:
6898 : 8d 01 d6 STA $d601 
689b : a9 13 __ LDA #$13
689d : 8d 00 d6 STA $d600 
.l2288:
68a0 : 2c 00 d6 BIT $d600 
68a3 : 10 fb __ BPL $68a0 ; (vdcwin_win_new.l2288 + 0)
.s160:
68a5 : 8c 01 d6 STY $d601 
68a8 : a9 1f __ LDA #$1f
68aa : 8d 00 d6 STA $d600 
.l2290:
68ad : 2c 00 d6 BIT $d600 
68b0 : 10 fb __ BPL $68ad ; (vdcwin_win_new.l2290 + 0)
.s164:
68b2 : a5 45 __ LDA T2 + 0 
68b4 : 8d 01 d6 STA $d601 
68b7 : a9 12 __ LDA #$12
68b9 : 8d 00 d6 STA $d600 
68bc : 18 __ __ CLC
68bd : a5 1b __ LDA ACCU + 0 
68bf : 65 51 __ ADC T14 + 0 
68c1 : a8 __ __ TAY
68c2 : a5 1c __ LDA ACCU + 1 
68c4 : 65 52 __ ADC T14 + 1 
.l2292:
68c6 : 2c 00 d6 BIT $d600 
68c9 : 10 fb __ BPL $68c6 ; (vdcwin_win_new.l2292 + 0)
.s171:
68cb : 8d 01 d6 STA $d601 
68ce : a9 13 __ LDA #$13
68d0 : 8d 00 d6 STA $d600 
.l2294:
68d3 : 2c 00 d6 BIT $d600 
68d6 : 10 fb __ BPL $68d3 ; (vdcwin_win_new.l2294 + 0)
.s176:
68d8 : 8c 01 d6 STY $d601 
68db : a9 1f __ LDA #$1f
68dd : 8d 00 d6 STA $d600 
.l2296:
68e0 : 2c 00 d6 BIT $d600 
68e3 : 10 fb __ BPL $68e0 ; (vdcwin_win_new.l2296 + 0)
.s180:
68e5 : a5 44 __ LDA T1 + 0 
68e7 : 8d 01 d6 STA $d601 
68ea : 4c 3a 63 JMP $633a ; (vdcwin_win_new.s2298 + 0)
.s42:
68ed : bd 47 84 LDA $8447,x ; (linebuffer + 71)
68f0 : 38 __ __ SEC
68f1 : e9 01 __ SBC #$01
68f3 : 85 0d __ STA P0 
68f5 : bc 48 84 LDY $8448,x ; (linebuffer + 72)
68f8 : 88 __ __ DEY
68f9 : 84 0e __ STY P1 
68fb : a6 49 __ LDX T8 + 0 
68fd : bd 90 7e LDA $7e90,x ; (winStyles + 1)
6900 : 85 45 __ STA T2 + 0 
6902 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
6905 : a9 12 __ LDA #$12
6907 : 8d 00 d6 STA $d600 
690a : 18 __ __ CLC
690b : a5 1b __ LDA ACCU + 0 
690d : 6d 2e 83 ADC $832e ; (vdc_state + 8)
6910 : a8 __ __ TAY
6911 : a5 1c __ LDA ACCU + 1 
6913 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l2249:
6916 : 2c 00 d6 BIT $d600 
6919 : 10 fb __ BPL $6916 ; (vdcwin_win_new.l2249 + 0)
.s52:
691b : 8d 01 d6 STA $d601 
691e : a9 13 __ LDA #$13
6920 : 8d 00 d6 STA $d600 
.l2251:
6923 : 2c 00 d6 BIT $d600 
6926 : 10 fb __ BPL $6923 ; (vdcwin_win_new.l2251 + 0)
.s57:
6928 : 8c 01 d6 STY $d601 
692b : a9 1f __ LDA #$1f
692d : 8d 00 d6 STA $d600 
.l2253:
6930 : 2c 00 d6 BIT $d600 
6933 : 10 fb __ BPL $6930 ; (vdcwin_win_new.l2253 + 0)
.s61:
6935 : a5 45 __ LDA T2 + 0 
6937 : 8d 01 d6 STA $d601 
693a : ad 30 83 LDA $8330 ; (vdc_state + 10)
693d : 18 __ __ CLC
693e : 65 1b __ ADC ACCU + 0 
6940 : a8 __ __ TAY
6941 : a9 12 __ LDA #$12
6943 : 8d 00 d6 STA $d600 
6946 : ad 31 83 LDA $8331 ; (vdc_state + 11)
6949 : 65 1c __ ADC ACCU + 1 
.l2255:
694b : 2c 00 d6 BIT $d600 
694e : 10 fb __ BPL $694b ; (vdcwin_win_new.l2255 + 0)
.s68:
6950 : 8d 01 d6 STA $d601 
6953 : a9 13 __ LDA #$13
6955 : 8d 00 d6 STA $d600 
.l2257:
6958 : 2c 00 d6 BIT $d600 
695b : 10 fb __ BPL $6958 ; (vdcwin_win_new.l2257 + 0)
.s73:
695d : 8c 01 d6 STY $d601 
6960 : a9 1f __ LDA #$1f
6962 : 8d 00 d6 STA $d600 
.l2259:
6965 : 2c 00 d6 BIT $d600 
6968 : 10 fb __ BPL $6965 ; (vdcwin_win_new.l2259 + 0)
.s77:
696a : a5 44 __ LDA T1 + 0 
696c : 8d 01 d6 STA $d601 
696f : 4c 79 67 JMP $6779 ; (vdcwin_win_new.s44 + 0)
.s30:
6972 : a5 15 __ LDA P8 ; (border + 0)
6974 : 29 bf __ AND #$bf
6976 : 85 43 __ STA T0 + 0 
6978 : 29 20 __ AND #$20
697a : d0 03 __ BNE $697f ; (vdcwin_win_new.s30 + 13)
697c : 4c 2c 63 JMP $632c ; (vdcwin_win_new.s2246 + 0)
697f : 4c 00 63 JMP $6300 ; (vdcwin_win_new.s37 + 0)
.s540:
6982 : 85 43 __ STA T0 + 0 
6984 : a5 44 __ LDA T1 + 0 
6986 : 85 12 __ STA P5 
.l1160:
6988 : a9 00 __ LDA #$00
698a : 85 13 __ STA P6 
698c : ad 1e 83 LDA $831e ; (winCfg + 0)
698f : 85 0d __ STA P0 
6991 : ad 24 83 LDA $8324 ; (winCfg + 6)
6994 : 85 4f __ STA T12 + 0 
6996 : 85 0e __ STA P1 
6998 : ad 25 83 LDA $8325 ; (winCfg + 7)
699b : 85 50 __ STA T12 + 1 
699d : 85 0f __ STA P2 
699f : ad 2e 83 LDA $832e ; (vdc_state + 8)
69a2 : 18 __ __ CLC
69a3 : 65 47 __ ADC T6 + 0 
69a5 : 85 10 __ STA P3 
69a7 : ad 2f 83 LDA $832f ; (vdc_state + 9)
69aa : 65 48 __ ADC T6 + 1 
69ac : 85 11 __ STA P4 
69ae : 20 ce 13 JSR $13ce ; (bnk_cpyfromvdc.s0 + 0)
69b1 : a9 00 __ LDA #$00
69b3 : 85 13 __ STA P6 
69b5 : 18 __ __ CLC
69b6 : a5 4f __ LDA T12 + 0 
69b8 : 65 12 __ ADC P5 
69ba : 85 4f __ STA T12 + 0 
69bc : 85 0e __ STA P1 
69be : 8d 24 83 STA $8324 ; (winCfg + 6)
69c1 : a5 50 __ LDA T12 + 1 
69c3 : 69 00 __ ADC #$00
69c5 : 85 50 __ STA T12 + 1 
69c7 : 85 0f __ STA P2 
69c9 : 8d 25 83 STA $8325 ; (winCfg + 7)
69cc : ad 30 83 LDA $8330 ; (vdc_state + 10)
69cf : 18 __ __ CLC
69d0 : 65 47 __ ADC T6 + 0 
69d2 : 85 10 __ STA P3 
69d4 : ad 31 83 LDA $8331 ; (vdc_state + 11)
69d7 : 65 48 __ ADC T6 + 1 
69d9 : 85 11 __ STA P4 
69db : 20 ce 13 JSR $13ce ; (bnk_cpyfromvdc.s0 + 0)
69de : 18 __ __ CLC
69df : a5 4f __ LDA T12 + 0 
69e1 : 65 12 __ ADC P5 
69e3 : 8d 24 83 STA $8324 ; (winCfg + 6)
69e6 : a5 50 __ LDA T12 + 1 
69e8 : 69 00 __ ADC #$00
69ea : 8d 25 83 STA $8325 ; (winCfg + 7)
69ed : ad 29 83 LDA $8329 ; (vdc_state + 3)
69f0 : 18 __ __ CLC
69f1 : 65 47 __ ADC T6 + 0 
69f3 : 85 47 __ STA T6 + 0 
69f5 : ad 2a 83 LDA $832a ; (vdc_state + 4)
69f8 : 65 48 __ ADC T6 + 1 
69fa : 85 48 __ STA T6 + 1 
69fc : c6 43 __ DEC T0 + 0 
69fe : d0 88 __ BNE $6988 ; (vdcwin_win_new.l1160 + 0)
6a00 : 4c d3 62 JMP $62d3 ; (vdcwin_win_new.s28 + 0)
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
6a03 : a9 ec __ LDA #$ec
6a05 : 85 0f __ STA P2 
6a07 : a9 be __ LDA #$be
6a09 : 85 10 __ STA P3 
6a0b : ad 0c bf LDA $bf0c ; (viewport + 11)
6a0e : 85 11 __ STA P4 
6a10 : ad 0d bf LDA $bf0d ; (viewport + 12)
6a13 : 85 12 __ STA P5 
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
6a15 : a5 11 __ LDA P4 ; (sx + 0)
6a17 : 85 0d __ STA P0 
6a19 : a0 00 __ LDY #$00
6a1b : 91 0f __ STA (P2),y ; (win + 0)
6a1d : 98 __ __ TYA
6a1e : a0 04 __ LDY #$04
6a20 : 91 0f __ STA (P2),y ; (win + 0)
6a22 : c8 __ __ INY
6a23 : 91 0f __ STA (P2),y ; (win + 0)
6a25 : a5 12 __ LDA P5 ; (sy + 0)
6a27 : a0 01 __ LDY #$01
6a29 : 91 0f __ STA (P2),y ; (win + 0)
6a2b : 85 0e __ STA P1 
6a2d : a5 13 __ LDA P6 ; (wx + 0)
6a2f : c8 __ __ INY
6a30 : 91 0f __ STA (P2),y ; (win + 0)
6a32 : a5 14 __ LDA P7 ; (wy + 0)
6a34 : c8 __ __ INY
6a35 : 91 0f __ STA (P2),y ; (win + 0)
6a37 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
6a3a : ad 2e 83 LDA $832e ; (vdc_state + 8)
6a3d : 18 __ __ CLC
6a3e : 65 1b __ ADC ACCU + 0 
6a40 : aa __ __ TAX
6a41 : ad 2f 83 LDA $832f ; (vdc_state + 9)
6a44 : 65 1c __ ADC ACCU + 1 
6a46 : a0 07 __ LDY #$07
6a48 : 91 0f __ STA (P2),y ; (win + 0)
6a4a : 8a __ __ TXA
6a4b : 88 __ __ DEY
6a4c : 91 0f __ STA (P2),y ; (win + 0)
6a4e : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
6a51 : ad 30 83 LDA $8330 ; (vdc_state + 10)
6a54 : 18 __ __ CLC
6a55 : 65 1b __ ADC ACCU + 0 
6a57 : aa __ __ TAX
6a58 : ad 31 83 LDA $8331 ; (vdc_state + 11)
6a5b : 65 1c __ ADC ACCU + 1 
6a5d : a0 09 __ LDY #$09
6a5f : 91 0f __ STA (P2),y ; (win + 0)
6a61 : 8a __ __ TXA
6a62 : 88 __ __ DEY
6a63 : 91 0f __ STA (P2),y ; (win + 0)
.s1001:
6a65 : 60 __ __ RTS
--------------------------------------------------------------------
6a66 : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 00             : fILE ERROR!.
--------------------------------------------------------------------
6a72 : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 00    : eRROR NR.: %2x.
--------------------------------------------------------------------
6a81 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 2e 00                : pRESS KEY..
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
6a8c : 20 e4 ff JSR $ffe4 
6a8f : c9 00 __ CMP #$00
6a91 : f0 f9 __ BEQ $6a8c ; (vdcwin_getch.s0 + 0)
6a93 : 85 1b __ STA ACCU + 0 
6a95 : a9 00 __ LDA #$00
6a97 : 85 1c __ STA ACCU + 1 
.s1001:
6a99 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_free: ; vdcwin_win_free()->void
.s0:
6a9a : ad 23 83 LDA $8323 ; (winCfg + 5)
6a9d : d0 01 __ BNE $6aa0 ; (vdcwin_win_free.s3 + 0)
6a9f : 60 __ __ RTS
.s3:
6aa0 : 85 43 __ STA T0 + 0 
6aa2 : aa __ __ TAX
6aa3 : bd fc 6b LDA $6bfc,x ; (__multab13L + 0)
6aa6 : 85 44 __ STA T1 + 0 
6aa8 : aa __ __ TAX
6aa9 : bd 47 84 LDA $8447,x ; (linebuffer + 71)
6aac : 85 0d __ STA P0 
6aae : bd 48 84 LDA $8448,x ; (linebuffer + 72)
6ab1 : 85 0e __ STA P1 
6ab3 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
6ab6 : a5 1b __ LDA ACCU + 0 
6ab8 : 85 45 __ STA T2 + 0 
6aba : a5 1c __ LDA ACCU + 1 
6abc : 85 46 __ STA T2 + 1 
6abe : a4 44 __ LDY T1 + 0 
6ac0 : b9 4a 84 LDA $844a,y ; (linebuffer + 74)
6ac3 : 85 1d __ STA ACCU + 2 
6ac5 : b9 44 84 LDA $8444,y ; (linebuffer + 68)
6ac8 : 85 48 __ STA T5 + 0 
6aca : 8d 24 83 STA $8324 ; (winCfg + 6)
6acd : b9 45 84 LDA $8445,y ; (linebuffer + 69)
6ad0 : 85 49 __ STA T5 + 1 
6ad2 : 8d 25 83 STA $8325 ; (winCfg + 7)
6ad5 : b9 46 84 LDA $8446,y ; (linebuffer + 70)
6ad8 : 85 44 __ STA T1 + 0 
6ada : be 49 84 LDX $8449,y ; (linebuffer + 73)
6add : 0a __ __ ASL
6ade : 10 12 __ BPL $6af2 ; (vdcwin_win_free.s51 + 0)
.s8:
6ae0 : a5 0d __ LDA P0 
6ae2 : f0 0e __ BEQ $6af2 ; (vdcwin_win_free.s51 + 0)
.s5:
6ae4 : 18 __ __ CLC
6ae5 : a5 1b __ LDA ACCU + 0 
6ae7 : 69 ff __ ADC #$ff
6ae9 : 85 45 __ STA T2 + 0 
6aeb : a5 1c __ LDA ACCU + 1 
6aed : 69 ff __ ADC #$ff
6aef : 85 46 __ STA T2 + 1 
6af1 : e8 __ __ INX
.s51:
6af2 : a5 44 __ LDA T1 + 0 
6af4 : 29 20 __ AND #$20
6af6 : f0 18 __ BEQ $6b10 ; (vdcwin_win_free.s53 + 0)
.s12:
6af8 : b9 49 84 LDA $8449,y ; (linebuffer + 73)
6afb : 18 __ __ CLC
6afc : 65 0d __ ADC P0 
6afe : 85 4a __ STA T11 + 0 
6b00 : a9 00 __ LDA #$00
6b02 : 2a __ __ ROL
6b03 : cd 2a 83 CMP $832a ; (vdc_state + 4)
6b06 : d0 05 __ BNE $6b0d ; (vdcwin_win_free.s1005 + 0)
.s1004:
6b08 : a5 4a __ LDA T11 + 0 
6b0a : cd 29 83 CMP $8329 ; (vdc_state + 3)
.s1005:
6b0d : b0 01 __ BCS $6b10 ; (vdcwin_win_free.s53 + 0)
.s9:
6b0f : e8 __ __ INX
.s53:
6b10 : 24 44 __ BIT T1 + 0 
6b12 : 10 1b __ BPL $6b2f ; (vdcwin_win_free.s54 + 0)
.s16:
6b14 : a5 0e __ LDA P1 
6b16 : f0 17 __ BEQ $6b2f ; (vdcwin_win_free.s54 + 0)
.s13:
6b18 : b9 4a 84 LDA $844a,y ; (linebuffer + 74)
6b1b : 18 __ __ CLC
6b1c : 69 01 __ ADC #$01
6b1e : 85 1d __ STA ACCU + 2 
6b20 : 38 __ __ SEC
6b21 : a5 45 __ LDA T2 + 0 
6b23 : ed 29 83 SBC $8329 ; (vdc_state + 3)
6b26 : 85 45 __ STA T2 + 0 
6b28 : a5 46 __ LDA T2 + 1 
6b2a : ed 2a 83 SBC $832a ; (vdc_state + 4)
6b2d : 85 46 __ STA T2 + 1 
.s54:
6b2f : a5 44 __ LDA T1 + 0 
6b31 : 29 10 __ AND #$10
6b33 : f0 16 __ BEQ $6b4b ; (vdcwin_win_free.s19 + 0)
.s20:
6b35 : b9 4a 84 LDA $844a,y ; (linebuffer + 74)
6b38 : 18 __ __ CLC
6b39 : 65 0e __ ADC P1 
6b3b : a8 __ __ TAY
6b3c : a9 00 __ LDA #$00
6b3e : 2a __ __ ROL
6b3f : cd 2c 83 CMP $832c ; (vdc_state + 6)
6b42 : d0 03 __ BNE $6b47 ; (vdcwin_win_free.s1003 + 0)
.s1002:
6b44 : cc 2b 83 CPY $832b ; (vdc_state + 5)
.s1003:
6b47 : b0 02 __ BCS $6b4b ; (vdcwin_win_free.s19 + 0)
.s17:
6b49 : e6 1d __ INC ACCU + 2 
.s19:
6b4b : a5 1d __ LDA ACCU + 2 
6b4d : d0 11 __ BNE $6b60 ; (vdcwin_win_free.s25 + 0)
.s24:
6b4f : a5 48 __ LDA T5 + 0 
6b51 : 8d 24 83 STA $8324 ; (winCfg + 6)
6b54 : a5 49 __ LDA T5 + 1 
6b56 : 8d 25 83 STA $8325 ; (winCfg + 7)
6b59 : a6 43 __ LDX T0 + 0 
6b5b : ca __ __ DEX
6b5c : 8e 23 83 STX $8323 ; (winCfg + 5)
.s1001:
6b5f : 60 __ __ RTS
.s25:
6b60 : 86 12 __ STX P5 
6b62 : 85 47 __ STA T3 + 0 
.l1006:
6b64 : a9 00 __ LDA #$00
6b66 : 85 13 __ STA P6 
6b68 : ad 2e 83 LDA $832e ; (vdc_state + 8)
6b6b : 18 __ __ CLC
6b6c : 65 45 __ ADC T2 + 0 
6b6e : 85 0d __ STA P0 
6b70 : ad 2f 83 LDA $832f ; (vdc_state + 9)
6b73 : 65 46 __ ADC T2 + 1 
6b75 : 85 0e __ STA P1 
6b77 : ad 1e 83 LDA $831e ; (winCfg + 0)
6b7a : 85 0f __ STA P2 
6b7c : ad 24 83 LDA $8324 ; (winCfg + 6)
6b7f : 85 4a __ STA T11 + 0 
6b81 : 85 10 __ STA P3 
6b83 : ad 25 83 LDA $8325 ; (winCfg + 7)
6b86 : 85 4b __ STA T11 + 1 
6b88 : 85 11 __ STA P4 
6b8a : 20 53 14 JSR $1453 ; (bnk_cpytovdc.s0 + 0)
6b8d : a9 00 __ LDA #$00
6b8f : 85 13 __ STA P6 
6b91 : 18 __ __ CLC
6b92 : a5 4a __ LDA T11 + 0 
6b94 : 65 12 __ ADC P5 
6b96 : 85 4a __ STA T11 + 0 
6b98 : 85 10 __ STA P3 
6b9a : 8d 24 83 STA $8324 ; (winCfg + 6)
6b9d : a5 4b __ LDA T11 + 1 
6b9f : 69 00 __ ADC #$00
6ba1 : 85 4b __ STA T11 + 1 
6ba3 : 85 11 __ STA P4 
6ba5 : 8d 25 83 STA $8325 ; (winCfg + 7)
6ba8 : ad 30 83 LDA $8330 ; (vdc_state + 10)
6bab : 18 __ __ CLC
6bac : 65 45 __ ADC T2 + 0 
6bae : 85 0d __ STA P0 
6bb0 : ad 31 83 LDA $8331 ; (vdc_state + 11)
6bb3 : 65 46 __ ADC T2 + 1 
6bb5 : 85 0e __ STA P1 
6bb7 : 20 53 14 JSR $1453 ; (bnk_cpytovdc.s0 + 0)
6bba : 18 __ __ CLC
6bbb : a5 4a __ LDA T11 + 0 
6bbd : 65 12 __ ADC P5 
6bbf : 8d 24 83 STA $8324 ; (winCfg + 6)
6bc2 : a5 4b __ LDA T11 + 1 
6bc4 : 69 00 __ ADC #$00
6bc6 : 8d 25 83 STA $8325 ; (winCfg + 7)
6bc9 : ad 29 83 LDA $8329 ; (vdc_state + 3)
6bcc : 18 __ __ CLC
6bcd : 65 45 __ ADC T2 + 0 
6bcf : 85 45 __ STA T2 + 0 
6bd1 : ad 2a 83 LDA $832a ; (vdc_state + 4)
6bd4 : 65 46 __ ADC T2 + 1 
6bd6 : 85 46 __ STA T2 + 1 
6bd8 : c6 47 __ DEC T3 + 0 
6bda : d0 88 __ BNE $6b64 ; (vdcwin_win_free.l1006 + 0)
6bdc : 4c 4f 6b JMP $6b4f ; (vdcwin_win_free.s24 + 0)
--------------------------------------------------------------------
6bdf : __ __ __ BYT 2d 20 53 43 52 45 45 4e 20 32 3a 20 6c 4f 47 4f : - SCREEN 2: lOGO
6bef : __ __ __ BYT 20 54 45 53 54 20 53 43 52 45 45 4e 00          :  TEST SCREEN.
--------------------------------------------------------------------
__multab13L:
6bfc : __ __ __ BYT 00 0d 1a 27                                     : ...'
--------------------------------------------------------------------
6c00 : __ __ __ BYT 53 43 52 45 45 4e 32 00                         : SCREEN2.
--------------------------------------------------------------------
6c08 : __ __ __ BYT 20 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d :  oSCAR64 vdc dEM
6c18 : __ __ __ BYT 4f 00                                           : O.
--------------------------------------------------------------------
menu_placebar: ; menu_placebar(u8)->void
.s0:
6c1a : a9 00 __ LDA #$00
6c1c : 85 0d __ STA P0 
6c1e : a5 0f __ LDA P2 ; (y + 0)
6c20 : 8d d3 7e STA $7ed3 ; (menubar + 50)
6c23 : 85 0e __ STA P1 
6c25 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
6c28 : a9 12 __ LDA #$12
6c2a : 8d 00 d6 STA $d600 
6c2d : 18 __ __ CLC
6c2e : a5 1b __ LDA ACCU + 0 
6c30 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
6c33 : aa __ __ TAX
6c34 : a5 1c __ LDA ACCU + 1 
6c36 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
6c39 : a8 __ __ TAY
6c3a : a9 01 __ LDA #$01
6c3c : 85 48 __ STA T4 + 0 
.l669:
6c3e : 2c 00 d6 BIT $d600 
6c41 : 10 fb __ BPL $6c3e ; (menu_placebar.l669 + 0)
.s8:
6c43 : 8c 01 d6 STY $d601 
6c46 : a9 13 __ LDA #$13
6c48 : 8d 00 d6 STA $d600 
.l671:
6c4b : 2c 00 d6 BIT $d600 
6c4e : 10 fb __ BPL $6c4b ; (menu_placebar.l671 + 0)
.s13:
6c50 : 8e 01 d6 STX $d601 
6c53 : a9 1f __ LDA #$1f
6c55 : 8d 00 d6 STA $d600 
.l673:
6c58 : 2c 00 d6 BIT $d600 
6c5b : 10 fb __ BPL $6c58 ; (menu_placebar.l673 + 0)
.s17:
6c5d : a9 20 __ LDA #$20
6c5f : 8d 01 d6 STA $d601 
6c62 : a9 18 __ LDA #$18
6c64 : 8d 00 d6 STA $d600 
.l675:
6c67 : 2c 00 d6 BIT $d600 
6c6a : 10 fb __ BPL $6c67 ; (menu_placebar.l675 + 0)
.s23:
6c6c : ad 01 d6 LDA $d601 
6c6f : 29 7f __ AND #$7f
6c71 : a2 18 __ LDX #$18
6c73 : 8e 00 d6 STX $d600 
.l677:
6c76 : 2c 00 d6 BIT $d600 
6c79 : 10 fb __ BPL $6c76 ; (menu_placebar.l677 + 0)
.s29:
6c7b : 8d 01 d6 STA $d601 
6c7e : a9 1e __ LDA #$1e
6c80 : 8d 00 d6 STA $d600 
.l679:
6c83 : 2c 00 d6 BIT $d600 
6c86 : 10 fb __ BPL $6c83 ; (menu_placebar.l679 + 0)
.s34:
6c88 : a9 4f __ LDA #$4f
6c8a : 8d 01 d6 STA $d601 
6c8d : ad 30 83 LDA $8330 ; (vdc_state + 10)
6c90 : 18 __ __ CLC
6c91 : 65 1b __ ADC ACCU + 0 
6c93 : a2 12 __ LDX #$12
6c95 : 8e 00 d6 STX $d600 
6c98 : aa __ __ TAX
6c99 : ad 31 83 LDA $8331 ; (vdc_state + 11)
6c9c : 65 1c __ ADC ACCU + 1 
.l681:
6c9e : 2c 00 d6 BIT $d600 
6ca1 : 10 fb __ BPL $6c9e ; (menu_placebar.l681 + 0)
.s41:
6ca3 : 8d 01 d6 STA $d601 
6ca6 : a9 13 __ LDA #$13
6ca8 : 8d 00 d6 STA $d600 
.l683:
6cab : 2c 00 d6 BIT $d600 
6cae : 10 fb __ BPL $6cab ; (menu_placebar.l683 + 0)
.s46:
6cb0 : 8e 01 d6 STX $d601 
6cb3 : a9 1f __ LDA #$1f
6cb5 : 8d 00 d6 STA $d600 
.l685:
6cb8 : 2c 00 d6 BIT $d600 
6cbb : 10 fb __ BPL $6cb8 ; (menu_placebar.l685 + 0)
.s50:
6cbd : a9 c4 __ LDA #$c4
6cbf : 8d 01 d6 STA $d601 
6cc2 : a9 18 __ LDA #$18
6cc4 : 8d 00 d6 STA $d600 
.l687:
6cc7 : 2c 00 d6 BIT $d600 
6cca : 10 fb __ BPL $6cc7 ; (menu_placebar.l687 + 0)
.s56:
6ccc : ad 01 d6 LDA $d601 
6ccf : 29 7f __ AND #$7f
6cd1 : a2 18 __ LDX #$18
6cd3 : 8e 00 d6 STX $d600 
.l689:
6cd6 : 2c 00 d6 BIT $d600 
6cd9 : 10 fb __ BPL $6cd6 ; (menu_placebar.l689 + 0)
.s62:
6cdb : 8d 01 d6 STA $d601 
6cde : a9 1e __ LDA #$1e
6ce0 : 8d 00 d6 STA $d600 
.l691:
6ce3 : 2c 00 d6 BIT $d600 
6ce6 : 10 fb __ BPL $6ce3 ; (menu_placebar.l691 + 0)
.s67:
6ce8 : a9 00 __ LDA #$00
6cea : 85 43 __ STA T0 + 0 
6cec : 85 44 __ STA T1 + 0 
6cee : a9 4f __ LDA #$4f
6cf0 : 8d 01 d6 STA $d601 
6cf3 : 18 __ __ CLC
.l69:
6cf4 : a9 a1 __ LDA #$a1
6cf6 : 65 44 __ ADC T1 + 0 
6cf8 : 85 45 __ STA T2 + 0 
6cfa : 85 0d __ STA P0 
6cfc : a9 7e __ LDA #$7e
6cfe : 69 00 __ ADC #$00
6d00 : 85 46 __ STA T2 + 1 
6d02 : 85 0e __ STA P1 
6d04 : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
6d07 : a5 0f __ LDA P2 ; (y + 0)
6d09 : 85 0e __ STA P1 
6d0b : a5 1b __ LDA ACCU + 0 
6d0d : 85 47 __ STA T3 + 0 
6d0f : 18 __ __ CLC
6d10 : 65 48 __ ADC T4 + 0 
6d12 : 85 4c __ STA T7 + 0 
6d14 : a9 00 __ LDA #$00
6d16 : 2a __ __ ROL
6d17 : 85 4d __ STA T7 + 1 
6d19 : ad 29 83 LDA $8329 ; (vdc_state + 3)
6d1c : 38 __ __ SEC
6d1d : e9 01 __ SBC #$01
6d1f : aa __ __ TAX
6d20 : ad 2a 83 LDA $832a ; (vdc_state + 4)
6d23 : e9 00 __ SBC #$00
6d25 : c5 4d __ CMP T7 + 1 
6d27 : d0 02 __ BNE $6d2b ; (menu_placebar.s1025 + 0)
.s1024:
6d29 : e4 4c __ CPX T7 + 0 
.s1025:
6d2b : b0 06 __ BCS $6d33 ; (menu_placebar.s74 + 0)
.s72:
6d2d : 8a __ __ TXA
6d2e : 38 __ __ SEC
6d2f : e5 1b __ SBC ACCU + 0 
6d31 : 85 48 __ STA T4 + 0 
.s74:
6d33 : a5 48 __ LDA T4 + 0 
6d35 : 85 0d __ STA P0 
6d37 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
6d3a : a5 1b __ LDA ACCU + 0 
6d3c : 85 4a __ STA T6 + 0 
6d3e : a5 1c __ LDA ACCU + 1 
6d40 : 85 4b __ STA T6 + 1 
6d42 : a5 45 __ LDA T2 + 0 
6d44 : 85 0d __ STA P0 
6d46 : a5 46 __ LDA T2 + 1 
6d48 : 85 0e __ STA P1 
6d4a : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
6d4d : a5 1b __ LDA ACCU + 0 
6d4f : 85 4c __ STA T7 + 0 
6d51 : ad 2e 83 LDA $832e ; (vdc_state + 8)
6d54 : 18 __ __ CLC
6d55 : 65 4a __ ADC T6 + 0 
6d57 : a2 12 __ LDX #$12
6d59 : 8e 00 d6 STX $d600 
6d5c : aa __ __ TAX
6d5d : ad 2f 83 LDA $832f ; (vdc_state + 9)
6d60 : 65 4b __ ADC T6 + 1 
.l694:
6d62 : 2c 00 d6 BIT $d600 
6d65 : 10 fb __ BPL $6d62 ; (menu_placebar.l694 + 0)
.s81:
6d67 : 8d 01 d6 STA $d601 
6d6a : a9 13 __ LDA #$13
6d6c : 8d 00 d6 STA $d600 
.l696:
6d6f : 2c 00 d6 BIT $d600 
6d72 : 10 fb __ BPL $6d6f ; (menu_placebar.l696 + 0)
.s86:
6d74 : 8e 01 d6 STX $d601 
6d77 : a9 1f __ LDA #$1f
6d79 : 8d 00 d6 STA $d600 
6d7c : a5 1b __ LDA ACCU + 0 
6d7e : f0 18 __ BEQ $6d98 ; (menu_placebar.s91 + 0)
.s135:
6d80 : a0 00 __ LDY #$00
.l89:
6d82 : 84 49 __ STY T5 + 0 
6d84 : b1 45 __ LDA (T2 + 0),y 
6d86 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l699:
6d89 : 2c 00 d6 BIT $d600 
6d8c : 10 fb __ BPL $6d89 ; (menu_placebar.l699 + 0)
.s94:
6d8e : 8d 01 d6 STA $d601 
6d91 : a4 49 __ LDY T5 + 0 
6d93 : c8 __ __ INY
6d94 : c4 4c __ CPY T7 + 0 
6d96 : 90 ea __ BCC $6d82 ; (menu_placebar.l89 + 0)
.s91:
6d98 : a9 12 __ LDA #$12
6d9a : 8d 00 d6 STA $d600 
6d9d : c6 4c __ DEC T7 + 0 
6d9f : ad 30 83 LDA $8330 ; (vdc_state + 10)
6da2 : 18 __ __ CLC
6da3 : 65 4a __ ADC T6 + 0 
6da5 : aa __ __ TAX
6da6 : ad 31 83 LDA $8331 ; (vdc_state + 11)
6da9 : 65 4b __ ADC T6 + 1 
.l702:
6dab : 2c 00 d6 BIT $d600 
6dae : 10 fb __ BPL $6dab ; (menu_placebar.l702 + 0)
.s101:
6db0 : 8d 01 d6 STA $d601 
6db3 : a9 13 __ LDA #$13
6db5 : 8d 00 d6 STA $d600 
.l704:
6db8 : 2c 00 d6 BIT $d600 
6dbb : 10 fb __ BPL $6db8 ; (menu_placebar.l704 + 0)
.s106:
6dbd : 8e 01 d6 STX $d601 
6dc0 : a9 1f __ LDA #$1f
6dc2 : 8d 00 d6 STA $d600 
.l706:
6dc5 : 2c 00 d6 BIT $d600 
6dc8 : 10 fb __ BPL $6dc5 ; (menu_placebar.l706 + 0)
.s110:
6dca : a9 c4 __ LDA #$c4
6dcc : 8d 01 d6 STA $d601 
6dcf : a9 18 __ LDA #$18
6dd1 : 8d 00 d6 STA $d600 
.l708:
6dd4 : 2c 00 d6 BIT $d600 
6dd7 : 10 fb __ BPL $6dd4 ; (menu_placebar.l708 + 0)
.s116:
6dd9 : ad 01 d6 LDA $d601 
6ddc : 29 7f __ AND #$7f
6dde : a2 18 __ LDX #$18
6de0 : 8e 00 d6 STX $d600 
.l710:
6de3 : 2c 00 d6 BIT $d600 
6de6 : 10 fb __ BPL $6de3 ; (menu_placebar.l710 + 0)
.s122:
6de8 : 8d 01 d6 STA $d601 
6deb : a9 1e __ LDA #$1e
6ded : 8d 00 d6 STA $d600 
.l712:
6df0 : 2c 00 d6 BIT $d600 
6df3 : 10 fb __ BPL $6df0 ; (menu_placebar.l712 + 0)
.s127:
6df5 : a5 4c __ LDA T7 + 0 
6df7 : 8d 01 d6 STA $d601 
6dfa : a5 48 __ LDA T4 + 0 
6dfc : a6 43 __ LDX T0 + 0 
6dfe : e8 __ __ INX
6dff : 86 43 __ STX T0 + 0 
6e01 : 9d cd 7e STA $7ecd,x ; (menubar + 44)
6e04 : a5 47 __ LDA T3 + 0 
6e06 : 38 __ __ SEC
6e07 : 65 48 __ ADC T4 + 0 
6e09 : 85 48 __ STA T4 + 0 
6e0b : 18 __ __ CLC
6e0c : a5 44 __ LDA T1 + 0 
6e0e : 69 09 __ ADC #$09
6e10 : 85 44 __ STA T1 + 0 
6e12 : e0 05 __ CPX #$05
6e14 : b0 03 __ BCS $6e19 ; (menu_placebar.s1001 + 0)
6e16 : 4c f4 6c JMP $6cf4 ; (menu_placebar.l69 + 0)
.s1001:
6e19 : 60 __ __ RTS
--------------------------------------------------------------------
6e1a : __ __ __ BYT 6d 3a 20 25 55 20 74 61 3a 20 25 34 58 20 61 61 : m: %U ta: %4X aa
6e2a : __ __ __ BYT 3a 20 25 34 58 20 77 3a 20 25 33 55 20 68 3a 20 : : %4X w: %3U h: 
6e3a : __ __ __ BYT 25 33 55 20 61 3a 20 25 32 58 00                : %3U a: %2X.
--------------------------------------------------------------------
6e45 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 3a 20 25 53 00    : sCREENMODE: %S.
--------------------------------------------------------------------
6e54 : __ __ __ BYT 73 45 4c 45 43 54 20 44 45 53 49 52 45 44 20 44 : sELECT DESIRED D
6e64 : __ __ __ BYT 45 4d 4f 20 55 53 49 4e 47 20 43 55 52 53 4f 52 : EMO USING CURSOR
6e74 : __ __ __ BYT 20 4b 45 59 53 20 41 4e 44 20 72 65 74 75 72 6e :  KEYS AND return
6e84 : __ __ __ BYT 20 49 4e 20 4d 45 4e 55 2e 00                   :  IN MENU..
--------------------------------------------------------------------
6e8e : __ __ __ BYT 69 4e 20 53 43 52 4f 4c 4c 49 4e 47 20 44 45 4d : iN SCROLLING DEM
6e9e : __ __ __ BYT 4f 53 2c 20 50 52 45 53 53 20 77 61 73 64 20 4f : OS, PRESS wasd O
6eae : __ __ __ BYT 52 20 43 55 52 53 4f 52 20 4b 45 59 53 20 54 4f : R CURSOR KEYS TO
6ebe : __ __ __ BYT 20 4d 4f 56 45 2c 20 65 73 63 20 54 4f 20 45 58 :  MOVE, esc TO EX
6ece : __ __ __ BYT 49 54 2e 00                                     : IT..
--------------------------------------------------------------------
6ed2 : __ __ __ BYT 20 25 53 20 00                                  :  %S .
--------------------------------------------------------------------
6ed7 : __ __ __ BYT 25 43 25 53 20 00                               : %C%S .
--------------------------------------------------------------------
6edd : __ __ __ BYT 73 45 4c 45 43 54 20 53 43 52 45 45 4e 20 4d 4f : sELECT SCREEN MO
6eed : __ __ __ BYT 44 45 00                                        : DE.
--------------------------------------------------------------------
6ef0 : __ __ __ BYT 25 53 20 25 53 20 25 53 20 25 53 2e 00          : %S %S %S %S..
--------------------------------------------------------------------
spentry:
6efd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
6efe : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
bootdevice:
6eff : __ __ __ BSS	1
--------------------------------------------------------------------
6f00 : __ __ __ BYT 69 4e 20 4f 54 48 45 52 20 44 45 4d 4f 53 2c 20 : iN OTHER DEMOS, 
6f10 : __ __ __ BYT 50 52 45 53 53 20 41 20 4b 45 54 59 20 54 4f 20 : PRESS A KETY TO 
6f20 : __ __ __ BYT 43 4f 4e 54 49 4e 55 45 20 54 4f 20 4e 45 58 54 : CONTINUE TO NEXT
6f30 : __ __ __ BYT 20 53 54 45 50 2e 00                            :  STEP..
--------------------------------------------------------------------
vdcwin_cpy_viewport: ; vdcwin_cpy_viewport(struct VDCViewport*)->void
.s0:
6f37 : a5 14 __ LDA P7 ; (viewport + 0)
6f39 : 85 43 __ STA T0 + 0 
6f3b : a5 15 __ LDA P8 ; (viewport + 1)
6f3d : 85 44 __ STA T0 + 1 
6f3f : a0 09 __ LDY #$09
6f41 : b1 14 __ LDA (P7),y ; (viewport + 0)
6f43 : 85 1b __ STA ACCU + 0 
6f45 : c8 __ __ INY
6f46 : b1 14 __ LDA (P7),y ; (viewport + 0)
6f48 : 85 1c __ STA ACCU + 1 
6f4a : a0 03 __ LDY #$03
6f4c : b1 14 __ LDA (P7),y ; (viewport + 0)
6f4e : 85 03 __ STA WORK + 0 
6f50 : c8 __ __ INY
6f51 : b1 14 __ LDA (P7),y ; (viewport + 0)
6f53 : 85 04 __ STA WORK + 1 
6f55 : 20 03 7d JSR $7d03 ; (mul16 + 0)
6f58 : a0 01 __ LDY #$01
6f5a : b1 14 __ LDA (P7),y ; (viewport + 0)
6f5c : 18 __ __ CLC
6f5d : 65 05 __ ADC WORK + 2 
6f5f : aa __ __ TAX
6f60 : c8 __ __ INY
6f61 : b1 14 __ LDA (P7),y ; (viewport + 0)
6f63 : 65 06 __ ADC WORK + 3 
6f65 : 85 46 __ STA T1 + 1 
6f67 : 8a __ __ TXA
6f68 : 18 __ __ CLC
6f69 : a0 07 __ LDY #$07
6f6b : 71 14 __ ADC (P7),y ; (viewport + 0)
6f6d : 85 45 __ STA T1 + 0 
6f6f : a5 46 __ LDA T1 + 1 
6f71 : c8 __ __ INY
6f72 : 71 14 __ ADC (P7),y ; (viewport + 0)
6f74 : 85 46 __ STA T1 + 1 
6f76 : a9 00 __ LDA #$00
6f78 : 85 49 __ STA T3 + 0 
6f7a : a0 11 __ LDY #$11
6f7c : b1 14 __ LDA (P7),y ; (viewport + 0)
6f7e : aa __ __ TAX
6f7f : c8 __ __ INY
6f80 : b1 14 __ LDA (P7),y ; (viewport + 0)
6f82 : 4c be 6f JMP $6fbe ; (vdcwin_cpy_viewport.l1 + 0)
.s2:
6f85 : 86 0d __ STX P0 
6f87 : a5 45 __ LDA T1 + 0 
6f89 : 85 10 __ STA P3 
6f8b : a5 46 __ LDA T1 + 1 
6f8d : 85 11 __ STA P4 
6f8f : a0 00 __ LDY #$00
6f91 : 84 13 __ STY P6 
6f93 : b1 43 __ LDA (T0 + 0),y 
6f95 : 85 0f __ STA P2 
6f97 : a0 0d __ LDY #$0d
6f99 : b1 43 __ LDA (T0 + 0),y 
6f9b : 85 12 __ STA P5 
6f9d : 20 53 14 JSR $1453 ; (bnk_cpytovdc.s0 + 0)
6fa0 : a5 45 __ LDA T1 + 0 
6fa2 : 18 __ __ CLC
6fa3 : a0 03 __ LDY #$03
6fa5 : 71 43 __ ADC (T0 + 0),y 
6fa7 : 85 45 __ STA T1 + 0 
6fa9 : a5 46 __ LDA T1 + 1 
6fab : c8 __ __ INY
6fac : 71 43 __ ADC (T0 + 0),y 
6fae : 85 46 __ STA T1 + 1 
6fb0 : ad 29 83 LDA $8329 ; (vdc_state + 3)
6fb3 : 18 __ __ CLC
6fb4 : 65 0d __ ADC P0 
6fb6 : aa __ __ TAX
6fb7 : ad 2a 83 LDA $832a ; (vdc_state + 4)
6fba : 65 0e __ ADC P1 
6fbc : e6 49 __ INC T3 + 0 
.l1:
6fbe : 85 0e __ STA P1 
6fc0 : a5 49 __ LDA T3 + 0 
6fc2 : a0 0e __ LDY #$0e
6fc4 : d1 43 __ CMP (T0 + 0),y 
6fc6 : 90 bd __ BCC $6f85 ; (vdcwin_cpy_viewport.s2 + 0)
.s4:
6fc8 : a0 03 __ LDY #$03
6fca : b1 43 __ LDA (T0 + 0),y 
6fcc : 85 45 __ STA T1 + 0 
6fce : 85 03 __ STA WORK + 0 
6fd0 : c8 __ __ INY
6fd1 : b1 43 __ LDA (T0 + 0),y 
6fd3 : 85 46 __ STA T1 + 1 
6fd5 : 85 04 __ STA WORK + 1 
6fd7 : a0 09 __ LDY #$09
6fd9 : b1 43 __ LDA (T0 + 0),y 
6fdb : 85 1b __ STA ACCU + 0 
6fdd : c8 __ __ INY
6fde : b1 43 __ LDA (T0 + 0),y 
6fe0 : 85 1c __ STA ACCU + 1 
6fe2 : 20 03 7d JSR $7d03 ; (mul16 + 0)
6fe5 : a0 01 __ LDY #$01
6fe7 : b1 43 __ LDA (T0 + 0),y 
6fe9 : 18 __ __ CLC
6fea : 65 05 __ ADC WORK + 2 
6fec : aa __ __ TAX
6fed : c8 __ __ INY
6fee : b1 43 __ LDA (T0 + 0),y 
6ff0 : 65 06 __ ADC WORK + 3 
6ff2 : 85 48 __ STA T2 + 1 
6ff4 : 8a __ __ TXA
6ff5 : 18 __ __ CLC
6ff6 : a0 07 __ LDY #$07
6ff8 : 71 43 __ ADC (T0 + 0),y 
6ffa : 85 47 __ STA T2 + 0 
6ffc : a5 48 __ LDA T2 + 1 
6ffe : c8 __ __ INY
6fff : 71 43 __ ADC (T0 + 0),y 
7001 : 85 48 __ STA T2 + 1 
7003 : a0 05 __ LDY #$05
7005 : b1 43 __ LDA (T0 + 0),y 
7007 : 85 1b __ STA ACCU + 0 
7009 : c8 __ __ INY
700a : b1 43 __ LDA (T0 + 0),y 
700c : 85 1c __ STA ACCU + 1 
700e : a5 45 __ LDA T1 + 0 
7010 : 85 03 __ STA WORK + 0 
7012 : a5 46 __ LDA T1 + 1 
7014 : 85 04 __ STA WORK + 1 
7016 : 20 03 7d JSR $7d03 ; (mul16 + 0)
7019 : 18 __ __ CLC
701a : a5 47 __ LDA T2 + 0 
701c : 65 05 __ ADC WORK + 2 
701e : aa __ __ TAX
701f : a5 48 __ LDA T2 + 1 
7021 : 65 06 __ ADC WORK + 3 
7023 : a8 __ __ TAY
7024 : 8a __ __ TXA
7025 : 18 __ __ CLC
7026 : 69 30 __ ADC #$30
7028 : 85 45 __ STA T1 + 0 
702a : 90 01 __ BCC $702d ; (vdcwin_cpy_viewport.s1007 + 0)
.s1006:
702c : c8 __ __ INY
.s1007:
702d : 84 46 __ STY T1 + 1 
702f : a9 00 __ LDA #$00
7031 : 85 49 __ STA T3 + 0 
7033 : a0 13 __ LDY #$13
7035 : b1 43 __ LDA (T0 + 0),y 
7037 : aa __ __ TAX
7038 : c8 __ __ INY
7039 : b1 43 __ LDA (T0 + 0),y 
703b : 4c 77 70 JMP $7077 ; (vdcwin_cpy_viewport.l5 + 0)
.s6:
703e : 86 0d __ STX P0 
7040 : a5 45 __ LDA T1 + 0 
7042 : 85 10 __ STA P3 
7044 : a5 46 __ LDA T1 + 1 
7046 : 85 11 __ STA P4 
7048 : a0 00 __ LDY #$00
704a : 84 13 __ STY P6 
704c : b1 14 __ LDA (P7),y ; (viewport + 0)
704e : 85 0f __ STA P2 
7050 : a0 0d __ LDY #$0d
7052 : b1 14 __ LDA (P7),y ; (viewport + 0)
7054 : 85 12 __ STA P5 
7056 : 20 53 14 JSR $1453 ; (bnk_cpytovdc.s0 + 0)
7059 : a5 45 __ LDA T1 + 0 
705b : 18 __ __ CLC
705c : a0 03 __ LDY #$03
705e : 71 14 __ ADC (P7),y ; (viewport + 0)
7060 : 85 45 __ STA T1 + 0 
7062 : a5 46 __ LDA T1 + 1 
7064 : c8 __ __ INY
7065 : 71 14 __ ADC (P7),y ; (viewport + 0)
7067 : 85 46 __ STA T1 + 1 
7069 : ad 29 83 LDA $8329 ; (vdc_state + 3)
706c : 18 __ __ CLC
706d : 65 0d __ ADC P0 
706f : aa __ __ TAX
7070 : ad 2a 83 LDA $832a ; (vdc_state + 4)
7073 : 65 0e __ ADC P1 
7075 : e6 49 __ INC T3 + 0 
.l5:
7077 : 85 0e __ STA P1 
7079 : a5 49 __ LDA T3 + 0 
707b : a0 0e __ LDY #$0e
707d : d1 14 __ CMP (P7),y ; (viewport + 0)
707f : 90 bd __ BCC $703e ; (vdcwin_cpy_viewport.s6 + 0)
.s1001:
7081 : 60 __ __ RTS
--------------------------------------------------------------------
menu_pulldown: ; menu_pulldown(u8,u8,u8,u8)->u8
.s1000:
7082 : a2 0c __ LDX #$0c
7084 : b5 53 __ LDA T0 + 0,x 
7086 : 9d cc bf STA $bfcc,x ; (nouns + 67)
7089 : ca __ __ DEX
708a : 10 f8 __ BPL $7084 ; (menu_pulldown.s1000 + 2)
708c : 38 __ __ SEC
708d : a5 23 __ LDA SP + 0 
708f : e9 0a __ SBC #$0a
7091 : 85 23 __ STA SP + 0 
7093 : b0 02 __ BCS $7097 ; (menu_pulldown.s0 + 0)
7095 : c6 24 __ DEC SP + 1 
.s0:
7097 : a9 d8 __ LDA #$d8
7099 : ae ff bf LDX $bfff ; (sstack + 7)
709c : 86 53 __ STX T0 + 0 
709e : 18 __ __ CLC
709f : 7d 66 7e ADC $7e66,x ; (__multab102L + 0)
70a2 : 85 55 __ STA T2 + 0 
70a4 : 85 0d __ STA P0 
70a6 : a9 7f __ LDA #$7f
70a8 : 7d 6d 7e ADC $7e6d,x ; (__multab102H + 0)
70ab : 85 56 __ STA T2 + 1 
70ad : 85 0e __ STA P1 
70af : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
70b2 : a6 53 __ LDX T0 + 0 
70b4 : bd d4 7e LDA $7ed4,x ; (pulldown_options + 0)
70b7 : 85 58 __ STA T4 + 0 
70b9 : 8d f8 bf STA $bff8 ; (sstack + 0)
70bc : e0 05 __ CPX #$05
70be : 90 08 __ BCC $70c8 ; (menu_pulldown.s541 + 0)
.s540:
70c0 : a9 00 __ LDA #$00
70c2 : 85 54 __ STA T1 + 0 
70c4 : a9 f0 __ LDA #$f0
70c6 : b0 06 __ BCS $70ce ; (menu_pulldown.s545 + 0)
.s541:
70c8 : a9 01 __ LDA #$01
70ca : 85 54 __ STA T1 + 0 
70cc : a9 70 __ LDA #$70
.s545:
70ce : 85 15 __ STA P8 
70d0 : ad fd bf LDA $bffd ; (sstack + 5)
70d3 : 85 16 __ STA P9 
70d5 : ad fe bf LDA $bffe ; (sstack + 6)
70d8 : 85 17 __ STA P10 
70da : 18 __ __ CLC
70db : a5 1b __ LDA ACCU + 0 
70dd : 69 02 __ ADC #$02
70df : 85 18 __ STA P11 
70e1 : 20 9e 61 JSR $619e ; (vdcwin_win_new.s1000 + 0)
70e4 : a9 01 __ LDA #$01
70e6 : 85 53 __ STA T0 + 0 
70e8 : a5 58 __ LDA T4 + 0 
70ea : f0 03 __ BEQ $70ef ; (menu_pulldown.l58 + 0)
70ec : 4c cb 73 JMP $73cb ; (menu_pulldown.s247 + 0)
.l58:
70ef : a9 2d __ LDA #$2d
70f1 : a0 06 __ LDY #$06
70f3 : 91 23 __ STA (SP + 0),y 
70f5 : a9 00 __ LDA #$00
70f7 : 85 1c __ STA ACCU + 1 
70f9 : c8 __ __ INY
70fa : 91 23 __ STA (SP + 0),y 
70fc : a9 00 __ LDA #$00
70fe : a0 02 __ LDY #$02
7100 : 91 23 __ STA (SP + 0),y 
7102 : a9 84 __ LDA #$84
7104 : c8 __ __ INY
7105 : 91 23 __ STA (SP + 0),y 
7107 : a9 d7 __ LDA #$d7
7109 : c8 __ __ INY
710a : 91 23 __ STA (SP + 0),y 
710c : a9 6e __ LDA #$6e
710e : c8 __ __ INY
710f : 91 23 __ STA (SP + 0),y 
7111 : a5 53 __ LDA T0 + 0 
7113 : 85 1b __ STA ACCU + 0 
7115 : a9 11 __ LDA #$11
7117 : 20 e3 7c JSR $7ce3 ; (mul16by8 + 0)
711a : 38 __ __ SEC
711b : a5 05 __ LDA WORK + 2 
711d : e9 11 __ SBC #$11
711f : aa __ __ TAX
7120 : a5 06 __ LDA WORK + 3 
7122 : e9 00 __ SBC #$00
7124 : 85 5d __ STA T7 + 1 
7126 : 8a __ __ TXA
7127 : 18 __ __ CLC
7128 : 65 55 __ ADC T2 + 0 
712a : a0 08 __ LDY #$08
712c : 91 23 __ STA (SP + 0),y 
712e : a5 5d __ LDA T7 + 1 
7130 : 65 56 __ ADC T2 + 1 
7132 : c8 __ __ INY
7133 : 91 23 __ STA (SP + 0),y 
7135 : 20 2a 5e JSR $5e2a ; (sprintf.s0 + 0)
7138 : ad fd bf LDA $bffd ; (sstack + 5)
713b : 85 0d __ STA P0 
713d : ad fe bf LDA $bffe ; (sstack + 6)
7140 : 85 5c __ STA T7 + 0 
7142 : 18 __ __ CLC
7143 : 65 53 __ ADC T0 + 0 
7145 : 38 __ __ SEC
7146 : e9 01 __ SBC #$01
7148 : 85 0e __ STA P1 
714a : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
714d : a5 1b __ LDA ACCU + 0 
714f : 85 5a __ STA T6 + 0 
7151 : a5 1c __ LDA ACCU + 1 
7153 : 85 5b __ STA T6 + 1 
7155 : 20 c5 5d JSR $5dc5 ; (strlen@proxy + 0)
7158 : a5 1b __ LDA ACCU + 0 
715a : 85 57 __ STA T3 + 0 
715c : ad 2e 83 LDA $832e ; (vdc_state + 8)
715f : 18 __ __ CLC
7160 : 65 5a __ ADC T6 + 0 
7162 : a2 12 __ LDX #$12
7164 : 8e 00 d6 STX $d600 
7167 : aa __ __ TAX
7168 : ad 2f 83 LDA $832f ; (vdc_state + 9)
716b : 65 5b __ ADC T6 + 1 
.l1025:
716d : 2c 00 d6 BIT $d600 
7170 : 10 fb __ BPL $716d ; (menu_pulldown.l1025 + 0)
.s66:
7172 : 8d 01 d6 STA $d601 
7175 : a9 13 __ LDA #$13
7177 : 8d 00 d6 STA $d600 
.l1027:
717a : 2c 00 d6 BIT $d600 
717d : 10 fb __ BPL $717a ; (menu_pulldown.l1027 + 0)
.s71:
717f : 8e 01 d6 STX $d601 
7182 : a9 1f __ LDA #$1f
7184 : 8d 00 d6 STA $d600 
7187 : a5 1b __ LDA ACCU + 0 
7189 : f0 19 __ BEQ $71a4 ; (menu_pulldown.s76 + 0)
.s233:
718b : a2 00 __ LDX #$00
.l74:
718d : 86 59 __ STX T5 + 0 
718f : bd 00 84 LDA $8400,x ; (linebuffer + 0)
7192 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l1030:
7195 : 2c 00 d6 BIT $d600 
7198 : 10 fb __ BPL $7195 ; (menu_pulldown.l1030 + 0)
.s79:
719a : 8d 01 d6 STA $d601 
719d : a6 59 __ LDX T5 + 0 
719f : e8 __ __ INX
71a0 : e4 57 __ CPX T3 + 0 
71a2 : 90 e9 __ BCC $718d ; (menu_pulldown.l74 + 0)
.s76:
71a4 : a9 12 __ LDA #$12
71a6 : 8d 00 d6 STA $d600 
71a9 : c6 57 __ DEC T3 + 0 
71ab : ad 30 83 LDA $8330 ; (vdc_state + 10)
71ae : 18 __ __ CLC
71af : 65 5a __ ADC T6 + 0 
71b1 : aa __ __ TAX
71b2 : ad 31 83 LDA $8331 ; (vdc_state + 11)
71b5 : 65 5b __ ADC T6 + 1 
.l1033:
71b7 : 2c 00 d6 BIT $d600 
71ba : 10 fb __ BPL $71b7 ; (menu_pulldown.l1033 + 0)
.s86:
71bc : 8d 01 d6 STA $d601 
71bf : a9 13 __ LDA #$13
71c1 : 8d 00 d6 STA $d600 
.l1035:
71c4 : 2c 00 d6 BIT $d600 
71c7 : 10 fb __ BPL $71c4 ; (menu_pulldown.l1035 + 0)
.s91:
71c9 : 8e 01 d6 STX $d601 
71cc : a9 1f __ LDA #$1f
71ce : 8d 00 d6 STA $d600 
.l1037:
71d1 : 2c 00 d6 BIT $d600 
71d4 : 10 fb __ BPL $71d1 ; (menu_pulldown.l1037 + 0)
.s95:
71d6 : a9 cd __ LDA #$cd
71d8 : 8d 01 d6 STA $d601 
71db : a9 18 __ LDA #$18
71dd : 8d 00 d6 STA $d600 
.l1039:
71e0 : 2c 00 d6 BIT $d600 
71e3 : 10 fb __ BPL $71e0 ; (menu_pulldown.l1039 + 0)
.s101:
71e5 : ad 01 d6 LDA $d601 
71e8 : 29 7f __ AND #$7f
71ea : a2 18 __ LDX #$18
71ec : 8e 00 d6 STX $d600 
.l1041:
71ef : 2c 00 d6 BIT $d600 
71f2 : 10 fb __ BPL $71ef ; (menu_pulldown.l1041 + 0)
.s107:
71f4 : 8d 01 d6 STA $d601 
71f7 : a9 1e __ LDA #$1e
71f9 : 8d 00 d6 STA $d600 
.l1043:
71fc : 2c 00 d6 BIT $d600 
71ff : 10 fb __ BPL $71fc ; (menu_pulldown.l1043 + 0)
.s112:
7201 : a5 57 __ LDA T3 + 0 
7203 : 8d 01 d6 STA $d601 
.l113:
7206 : 20 8c 6a JSR $6a8c ; (vdcwin_getch.s0 + 0)
7209 : a5 1b __ LDA ACCU + 0 
720b : 85 57 __ STA T3 + 0 
720d : c9 0d __ CMP #$0d
720f : f0 18 __ BEQ $7229 ; (menu_pulldown.s114 + 0)
.s120:
7211 : c9 9d __ CMP #$9d
7213 : f0 14 __ BEQ $7229 ; (menu_pulldown.s114 + 0)
.s119:
7215 : c9 1d __ CMP #$1d
7217 : f0 10 __ BEQ $7229 ; (menu_pulldown.s114 + 0)
.s118:
7219 : c9 91 __ CMP #$91
721b : f0 0c __ BEQ $7229 ; (menu_pulldown.s114 + 0)
.s117:
721d : c9 11 __ CMP #$11
721f : f0 08 __ BEQ $7229 ; (menu_pulldown.s114 + 0)
.s116:
7221 : c9 1b __ CMP #$1b
7223 : f0 04 __ BEQ $7229 ; (menu_pulldown.s114 + 0)
.s115:
7225 : c9 03 __ CMP #$03
7227 : d0 dd __ BNE $7206 ; (menu_pulldown.l113 + 0)
.s114:
7229 : a5 1b __ LDA ACCU + 0 
722b : c9 1b __ CMP #$1b
722d : d0 03 __ BNE $7232 ; (menu_pulldown.s201 + 0)
722f : 4c bc 73 JMP $73bc ; (menu_pulldown.s122 + 0)
.s201:
7232 : b0 03 __ BCS $7237 ; (menu_pulldown.s202 + 0)
7234 : 4c ac 73 JMP $73ac ; (menu_pulldown.s203 + 0)
.s202:
7237 : c9 91 __ CMP #$91
7239 : f0 43 __ BEQ $727e ; (menu_pulldown.s135 + 0)
.s209:
723b : b0 2f __ BCS $726c ; (menu_pulldown.s210 + 0)
.s211:
723d : c9 1d __ CMP #$1d
723f : f0 03 __ BEQ $7244 ; (menu_pulldown.s131 + 0)
7241 : 4c ef 70 JMP $70ef ; (menu_pulldown.l58 + 0)
.s131:
7244 : a5 54 __ LDA T1 + 0 
7246 : d0 03 __ BNE $724b ; (menu_pulldown.s132 + 0)
7248 : 4c ef 70 JMP $70ef ; (menu_pulldown.l58 + 0)
.s132:
724b : a9 13 __ LDA #$13
.s1107:
724d : 85 53 __ STA T0 + 0 
.s59:
724f : 20 9a 6a JSR $6a9a ; (vdcwin_win_free.s0 + 0)
7252 : a5 53 __ LDA T0 + 0 
7254 : 85 1b __ STA ACCU + 0 
.s1001:
7256 : 18 __ __ CLC
7257 : a5 23 __ LDA SP + 0 
7259 : 69 0a __ ADC #$0a
725b : 85 23 __ STA SP + 0 
725d : 90 02 __ BCC $7261 ; (menu_pulldown.s1001 + 11)
725f : e6 24 __ INC SP + 1 
7261 : a2 0c __ LDX #$0c
7263 : bd cc bf LDA $bfcc,x ; (nouns + 67)
7266 : 95 53 __ STA T0 + 0,x 
7268 : ca __ __ DEX
7269 : 10 f8 __ BPL $7263 ; (menu_pulldown.s1001 + 13)
726b : 60 __ __ RTS
.s210:
726c : c9 9d __ CMP #$9d
726e : f0 03 __ BEQ $7273 ; (menu_pulldown.s127 + 0)
7270 : 4c ef 70 JMP $70ef ; (menu_pulldown.l58 + 0)
.s127:
7273 : a5 54 __ LDA T1 + 0 
7275 : d0 03 __ BNE $727a ; (menu_pulldown.s128 + 0)
7277 : 4c ef 70 JMP $70ef ; (menu_pulldown.l58 + 0)
.s128:
727a : a9 12 __ LDA #$12
727c : d0 cf __ BNE $724d ; (menu_pulldown.s1107 + 0)
.s135:
727e : a9 00 __ LDA #$00
7280 : a0 02 __ LDY #$02
7282 : 91 23 __ STA (SP + 0),y 
7284 : a9 84 __ LDA #$84
7286 : c8 __ __ INY
7287 : 91 23 __ STA (SP + 0),y 
7289 : a9 d2 __ LDA #$d2
728b : c8 __ __ INY
728c : 91 23 __ STA (SP + 0),y 
728e : a9 6e __ LDA #$6e
7290 : c8 __ __ INY
7291 : 91 23 __ STA (SP + 0),y 
7293 : a5 53 __ LDA T0 + 0 
7295 : 85 1b __ STA ACCU + 0 
7297 : a9 00 __ LDA #$00
7299 : 85 1c __ STA ACCU + 1 
729b : a9 11 __ LDA #$11
729d : 20 e3 7c JSR $7ce3 ; (mul16by8 + 0)
72a0 : 38 __ __ SEC
72a1 : a5 05 __ LDA WORK + 2 
72a3 : e9 11 __ SBC #$11
72a5 : aa __ __ TAX
72a6 : a5 06 __ LDA WORK + 3 
72a8 : e9 00 __ SBC #$00
72aa : 85 44 __ STA T10 + 1 
72ac : 8a __ __ TXA
72ad : 18 __ __ CLC
72ae : 65 55 __ ADC T2 + 0 
72b0 : a0 06 __ LDY #$06
72b2 : 91 23 __ STA (SP + 0),y 
72b4 : a5 44 __ LDA T10 + 1 
72b6 : 65 56 __ ADC T2 + 1 
72b8 : c8 __ __ INY
72b9 : 91 23 __ STA (SP + 0),y 
72bb : 20 2a 5e JSR $5e2a ; (sprintf.s0 + 0)
72be : ad fd bf LDA $bffd ; (sstack + 5)
72c1 : 85 0d __ STA P0 
72c3 : 18 __ __ CLC
72c4 : a5 53 __ LDA T0 + 0 
72c6 : 65 5c __ ADC T7 + 0 
72c8 : 38 __ __ SEC
72c9 : e9 01 __ SBC #$01
72cb : 85 0e __ STA P1 
72cd : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
72d0 : a5 1b __ LDA ACCU + 0 
72d2 : 85 5c __ STA T7 + 0 
72d4 : a5 1c __ LDA ACCU + 1 
72d6 : 85 5d __ STA T7 + 1 
72d8 : 20 c5 5d JSR $5dc5 ; (strlen@proxy + 0)
72db : a5 1b __ LDA ACCU + 0 
72dd : 85 5a __ STA T6 + 0 
72df : ad 2e 83 LDA $832e ; (vdc_state + 8)
72e2 : 18 __ __ CLC
72e3 : 65 5c __ ADC T7 + 0 
72e5 : a2 12 __ LDX #$12
72e7 : 8e 00 d6 STX $d600 
72ea : aa __ __ TAX
72eb : ad 2f 83 LDA $832f ; (vdc_state + 9)
72ee : 65 5d __ ADC T7 + 1 
.l1046:
72f0 : 2c 00 d6 BIT $d600 
72f3 : 10 fb __ BPL $72f0 ; (menu_pulldown.l1046 + 0)
.s142:
72f5 : 8d 01 d6 STA $d601 
72f8 : a9 13 __ LDA #$13
72fa : 8d 00 d6 STA $d600 
.l1048:
72fd : 2c 00 d6 BIT $d600 
7300 : 10 fb __ BPL $72fd ; (menu_pulldown.l1048 + 0)
.s147:
7302 : 8e 01 d6 STX $d601 
7305 : a9 1f __ LDA #$1f
7307 : 8d 00 d6 STA $d600 
730a : a5 1b __ LDA ACCU + 0 
730c : f0 19 __ BEQ $7327 ; (menu_pulldown.s152 + 0)
.s222:
730e : a2 00 __ LDX #$00
.l150:
7310 : 86 59 __ STX T5 + 0 
7312 : bd 00 84 LDA $8400,x ; (linebuffer + 0)
7315 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l1051:
7318 : 2c 00 d6 BIT $d600 
731b : 10 fb __ BPL $7318 ; (menu_pulldown.l1051 + 0)
.s155:
731d : 8d 01 d6 STA $d601 
7320 : a6 59 __ LDX T5 + 0 
7322 : e8 __ __ INX
7323 : e4 5a __ CPX T6 + 0 
7325 : 90 e9 __ BCC $7310 ; (menu_pulldown.l150 + 0)
.s152:
7327 : a9 12 __ LDA #$12
7329 : 8d 00 d6 STA $d600 
732c : c6 5a __ DEC T6 + 0 
732e : ad 30 83 LDA $8330 ; (vdc_state + 10)
7331 : 18 __ __ CLC
7332 : 65 5c __ ADC T7 + 0 
7334 : aa __ __ TAX
7335 : ad 31 83 LDA $8331 ; (vdc_state + 11)
7338 : 65 5d __ ADC T7 + 1 
.l1054:
733a : 2c 00 d6 BIT $d600 
733d : 10 fb __ BPL $733a ; (menu_pulldown.l1054 + 0)
.s162:
733f : 8d 01 d6 STA $d601 
7342 : a9 13 __ LDA #$13
7344 : 8d 00 d6 STA $d600 
.l1056:
7347 : 2c 00 d6 BIT $d600 
734a : 10 fb __ BPL $7347 ; (menu_pulldown.l1056 + 0)
.s167:
734c : 8e 01 d6 STX $d601 
734f : a9 1f __ LDA #$1f
7351 : 8d 00 d6 STA $d600 
.l1058:
7354 : 2c 00 d6 BIT $d600 
7357 : 10 fb __ BPL $7354 ; (menu_pulldown.l1058 + 0)
.s171:
7359 : a9 c6 __ LDA #$c6
735b : 8d 01 d6 STA $d601 
735e : a9 18 __ LDA #$18
7360 : 8d 00 d6 STA $d600 
.l1060:
7363 : 2c 00 d6 BIT $d600 
7366 : 10 fb __ BPL $7363 ; (menu_pulldown.l1060 + 0)
.s177:
7368 : ad 01 d6 LDA $d601 
736b : 29 7f __ AND #$7f
736d : a2 18 __ LDX #$18
736f : 8e 00 d6 STX $d600 
.l1062:
7372 : 2c 00 d6 BIT $d600 
7375 : 10 fb __ BPL $7372 ; (menu_pulldown.l1062 + 0)
.s183:
7377 : 8d 01 d6 STA $d601 
737a : a9 1e __ LDA #$1e
737c : 8d 00 d6 STA $d600 
.l1064:
737f : 2c 00 d6 BIT $d600 
7382 : 10 fb __ BPL $737f ; (menu_pulldown.l1064 + 0)
.s188:
7384 : a5 5a __ LDA T6 + 0 
7386 : 8d 01 d6 STA $d601 
7389 : a5 57 __ LDA T3 + 0 
738b : c9 91 __ CMP #$91
738d : d0 0e __ BNE $739d ; (menu_pulldown.s190 + 0)
.s189:
738f : c6 53 __ DEC T0 + 0 
7391 : f0 03 __ BEQ $7396 ; (menu_pulldown.s192 + 0)
7393 : 4c ef 70 JMP $70ef ; (menu_pulldown.l58 + 0)
.s192:
7396 : a5 58 __ LDA T4 + 0 
.s1106:
7398 : 85 53 __ STA T0 + 0 
739a : 4c ef 70 JMP $70ef ; (menu_pulldown.l58 + 0)
.s190:
739d : e6 53 __ INC T0 + 0 
739f : a5 58 __ LDA T4 + 0 
73a1 : c5 53 __ CMP T0 + 0 
73a3 : 90 03 __ BCC $73a8 ; (menu_pulldown.s195 + 0)
73a5 : 4c ef 70 JMP $70ef ; (menu_pulldown.l58 + 0)
.s195:
73a8 : a9 01 __ LDA #$01
73aa : 90 ec __ BCC $7398 ; (menu_pulldown.s1106 + 0)
.s203:
73ac : c9 0d __ CMP #$0d
73ae : d0 03 __ BNE $73b3 ; (menu_pulldown.s204 + 0)
73b0 : 4c 4f 72 JMP $724f ; (menu_pulldown.s59 + 0)
.s204:
73b3 : b0 0c __ BCS $73c1 ; (menu_pulldown.s205 + 0)
.s206:
73b5 : c9 03 __ CMP #$03
73b7 : f0 03 __ BEQ $73bc ; (menu_pulldown.s122 + 0)
73b9 : 4c ef 70 JMP $70ef ; (menu_pulldown.l58 + 0)
.s122:
73bc : a9 00 __ LDA #$00
73be : 4c 4d 72 JMP $724d ; (menu_pulldown.s1107 + 0)
.s205:
73c1 : c9 11 __ CMP #$11
73c3 : d0 03 __ BNE $73c8 ; (menu_pulldown.s205 + 7)
73c5 : 4c 7e 72 JMP $727e ; (menu_pulldown.s135 + 0)
73c8 : 4c ef 70 JMP $70ef ; (menu_pulldown.l58 + 0)
.s247:
73cb : a9 00 __ LDA #$00
73cd : 85 59 __ STA T5 + 0 
.l2:
73cf : a9 00 __ LDA #$00
73d1 : a0 02 __ LDY #$02
73d3 : 91 23 __ STA (SP + 0),y 
73d5 : a9 84 __ LDA #$84
73d7 : c8 __ __ INY
73d8 : 91 23 __ STA (SP + 0),y 
73da : a9 d2 __ LDA #$d2
73dc : c8 __ __ INY
73dd : 91 23 __ STA (SP + 0),y 
73df : a9 6e __ LDA #$6e
73e1 : c8 __ __ INY
73e2 : 91 23 __ STA (SP + 0),y 
73e4 : a5 59 __ LDA T5 + 0 
73e6 : 85 1b __ STA ACCU + 0 
73e8 : a9 00 __ LDA #$00
73ea : 85 1c __ STA ACCU + 1 
73ec : a9 11 __ LDA #$11
73ee : 20 e3 7c JSR $7ce3 ; (mul16by8 + 0)
73f1 : 18 __ __ CLC
73f2 : a5 55 __ LDA T2 + 0 
73f4 : 65 05 __ ADC WORK + 2 
73f6 : a0 06 __ LDY #$06
73f8 : 91 23 __ STA (SP + 0),y 
73fa : a5 56 __ LDA T2 + 1 
73fc : 65 06 __ ADC WORK + 3 
73fe : c8 __ __ INY
73ff : 91 23 __ STA (SP + 0),y 
7401 : 20 2a 5e JSR $5e2a ; (sprintf.s0 + 0)
7404 : ad fd bf LDA $bffd ; (sstack + 5)
7407 : 85 0d __ STA P0 
7409 : ad fe bf LDA $bffe ; (sstack + 6)
740c : 18 __ __ CLC
740d : 65 59 __ ADC T5 + 0 
740f : 85 0e __ STA P1 
7411 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
7414 : a5 1b __ LDA ACCU + 0 
7416 : 85 5c __ STA T7 + 0 
7418 : a5 1c __ LDA ACCU + 1 
741a : 85 5d __ STA T7 + 1 
741c : 20 c5 5d JSR $5dc5 ; (strlen@proxy + 0)
741f : a5 1b __ LDA ACCU + 0 
7421 : 85 5e __ STA T8 + 0 
7423 : ad 2e 83 LDA $832e ; (vdc_state + 8)
7426 : 18 __ __ CLC
7427 : 65 5c __ ADC T7 + 0 
7429 : a2 12 __ LDX #$12
742b : 8e 00 d6 STX $d600 
742e : aa __ __ TAX
742f : ad 2f 83 LDA $832f ; (vdc_state + 9)
7432 : 65 5d __ ADC T7 + 1 
.l1004:
7434 : 2c 00 d6 BIT $d600 
7437 : 10 fb __ BPL $7434 ; (menu_pulldown.l1004 + 0)
.s11:
7439 : 8d 01 d6 STA $d601 
743c : a9 13 __ LDA #$13
743e : 8d 00 d6 STA $d600 
.l1006:
7441 : 2c 00 d6 BIT $d600 
7444 : 10 fb __ BPL $7441 ; (menu_pulldown.l1006 + 0)
.s16:
7446 : 8e 01 d6 STX $d601 
7449 : a9 1f __ LDA #$1f
744b : 8d 00 d6 STA $d600 
744e : a5 1b __ LDA ACCU + 0 
7450 : f0 19 __ BEQ $746b ; (menu_pulldown.s21 + 0)
.s244:
7452 : a2 00 __ LDX #$00
.l19:
7454 : 86 5f __ STX T9 + 0 
7456 : bd 00 84 LDA $8400,x ; (linebuffer + 0)
7459 : 20 f1 5d JSR $5df1 ; (pet2screen.s0 + 0)
.l1009:
745c : 2c 00 d6 BIT $d600 
745f : 10 fb __ BPL $745c ; (menu_pulldown.l1009 + 0)
.s24:
7461 : 8d 01 d6 STA $d601 
7464 : a6 5f __ LDX T9 + 0 
7466 : e8 __ __ INX
7467 : e4 5e __ CPX T8 + 0 
7469 : 90 e9 __ BCC $7454 ; (menu_pulldown.l19 + 0)
.s21:
746b : a9 12 __ LDA #$12
746d : 8d 00 d6 STA $d600 
7470 : c6 5e __ DEC T8 + 0 
7472 : ad 30 83 LDA $8330 ; (vdc_state + 10)
7475 : 18 __ __ CLC
7476 : 65 5c __ ADC T7 + 0 
7478 : aa __ __ TAX
7479 : ad 31 83 LDA $8331 ; (vdc_state + 11)
747c : 65 5d __ ADC T7 + 1 
.l1012:
747e : 2c 00 d6 BIT $d600 
7481 : 10 fb __ BPL $747e ; (menu_pulldown.l1012 + 0)
.s31:
7483 : 8d 01 d6 STA $d601 
7486 : a9 13 __ LDA #$13
7488 : 8d 00 d6 STA $d600 
.l1014:
748b : 2c 00 d6 BIT $d600 
748e : 10 fb __ BPL $748b ; (menu_pulldown.l1014 + 0)
.s36:
7490 : 8e 01 d6 STX $d601 
7493 : a9 1f __ LDA #$1f
7495 : 8d 00 d6 STA $d600 
.l1016:
7498 : 2c 00 d6 BIT $d600 
749b : 10 fb __ BPL $7498 ; (menu_pulldown.l1016 + 0)
.s40:
749d : a9 c6 __ LDA #$c6
749f : 8d 01 d6 STA $d601 
74a2 : a9 18 __ LDA #$18
74a4 : 8d 00 d6 STA $d600 
.l1018:
74a7 : 2c 00 d6 BIT $d600 
74aa : 10 fb __ BPL $74a7 ; (menu_pulldown.l1018 + 0)
.s46:
74ac : ad 01 d6 LDA $d601 
74af : 29 7f __ AND #$7f
74b1 : a2 18 __ LDX #$18
74b3 : 8e 00 d6 STX $d600 
.l1020:
74b6 : 2c 00 d6 BIT $d600 
74b9 : 10 fb __ BPL $74b6 ; (menu_pulldown.l1020 + 0)
.s52:
74bb : 8d 01 d6 STA $d601 
74be : a9 1e __ LDA #$1e
74c0 : 8d 00 d6 STA $d600 
.l1022:
74c3 : 2c 00 d6 BIT $d600 
74c6 : 10 fb __ BPL $74c3 ; (menu_pulldown.l1022 + 0)
.s57:
74c8 : a5 5e __ LDA T8 + 0 
74ca : 8d 01 d6 STA $d601 
74cd : e6 59 __ INC T5 + 0 
74cf : a5 59 __ LDA T5 + 0 
74d1 : c5 58 __ CMP T4 + 0 
74d3 : b0 03 __ BCS $74d8 ; (menu_pulldown.s57 + 16)
74d5 : 4c cf 73 JMP $73cf ; (menu_pulldown.l2 + 0)
74d8 : 4c ef 70 JMP $70ef ; (menu_pulldown.l58 + 0)
--------------------------------------------------------------------
rand: ; rand()->u16
.s0:
74db : ad dc 7e LDA $7edc ; (seed + 1)
74de : 4a __ __ LSR
74df : ad db 7e LDA $7edb ; (seed + 0)
74e2 : 6a __ __ ROR
74e3 : aa __ __ TAX
74e4 : a9 00 __ LDA #$00
74e6 : 6a __ __ ROR
74e7 : 4d db 7e EOR $7edb ; (seed + 0)
74ea : 85 1b __ STA ACCU + 0 
74ec : 8a __ __ TXA
74ed : 4d dc 7e EOR $7edc ; (seed + 1)
74f0 : 85 1c __ STA ACCU + 1 
74f2 : 4a __ __ LSR
74f3 : 45 1b __ EOR ACCU + 0 
74f5 : 8d db 7e STA $7edb ; (seed + 0)
74f8 : 85 1b __ STA ACCU + 0 
74fa : 45 1c __ EOR ACCU + 1 
74fc : 8d dc 7e STA $7edc ; (seed + 1)
74ff : 85 1c __ STA ACCU + 1 
.s1001:
7501 : 60 __ __ RTS
--------------------------------------------------------------------
generateSentence: ; generateSentence(u8*)->void
.s1000:
7502 : a5 53 __ LDA T2 + 0 
7504 : 8d 4b bf STA $bf4b ; (generateSentence@stack + 0)
7507 : a5 54 __ LDA T2 + 1 
7509 : 8d 4c bf STA $bf4c ; (generateSentence@stack + 1)
750c : 38 __ __ SEC
750d : a5 23 __ LDA SP + 0 
750f : e9 0e __ SBC #$0e
7511 : 85 23 __ STA SP + 0 
7513 : b0 02 __ BCS $7517 ; (generateSentence.s0 + 0)
7515 : c6 24 __ DEC SP + 1 
.s0:
7517 : a9 74 __ LDA #$74
7519 : 8d d4 bf STA $bfd4 ; (wrapbuffer + 54)
751c : a9 48 __ LDA #$48
751e : 8d d5 bf STA $bfd5 ; (wrapbuffer + 55)
7521 : a9 45 __ LDA #$45
7523 : 8d d6 bf STA $bfd6 ; (wrapbuffer + 56)
7526 : a9 00 __ LDA #$00
7528 : 8d d7 bf STA $bfd7 ; (wrapbuffer + 57)
752b : 8d d9 bf STA $bfd9 ; (wrapbuffer + 59)
752e : 8d da bf STA $bfda ; (wrapbuffer + 60)
7531 : 8d db bf STA $bfdb ; (wrapbuffer + 61)
7534 : a9 61 __ LDA #$61
7536 : 8d d8 bf STA $bfd8 ; (wrapbuffer + 58)
7539 : a2 4b __ LDX #$4b
.l1002:
753b : bd a1 82 LDA $82a1,x ; (pulldown_titles + 713)
753e : 9d 88 bf STA $bf88,x ; (verbs + 29)
7541 : ca __ __ DEX
7542 : d0 f7 __ BNE $753b ; (generateSentence.l1002 + 0)
.s1003:
7544 : a2 1e __ LDX #$1e
.l1004:
7546 : bd dc 7e LDA $7edc,x ; (seed + 1)
7549 : 9d 6a bf STA $bf6a,x ; (adjectives + 29)
754c : ca __ __ DEX
754d : d0 f7 __ BNE $7546 ; (generateSentence.l1004 + 0)
.s1005:
754f : a2 1e __ LDX #$1e
.l1006:
7551 : bd ff 82 LDA $82ff,x 
7554 : 9d 4c bf STA $bf4c,x ; (generateSentence@stack + 1)
7557 : ca __ __ DEX
7558 : d0 f7 __ BNE $7551 ; (generateSentence.l1006 + 0)
.s1007:
755a : 20 db 74 JSR $74db ; (rand.s0 + 0)
755d : a5 1b __ LDA ACCU + 0 
755f : 85 4e __ STA T0 + 0 
7561 : 20 db 74 JSR $74db ; (rand.s0 + 0)
7564 : a5 1b __ LDA ACCU + 0 
7566 : 85 4f __ STA T1 + 0 
7568 : a5 1c __ LDA ACCU + 1 
756a : 85 50 __ STA T1 + 1 
756c : 20 db 74 JSR $74db ; (rand.s0 + 0)
756f : a5 1b __ LDA ACCU + 0 
7571 : 85 53 __ STA T2 + 0 
7573 : a5 1c __ LDA ACCU + 1 
7575 : 85 54 __ STA T2 + 1 
7577 : 20 db 74 JSR $74db ; (rand.s0 + 0)
757a : ad fd bf LDA $bffd ; (sstack + 5)
757d : 85 45 __ STA T4 + 0 
757f : ad fe bf LDA $bffe ; (sstack + 6)
7582 : 85 46 __ STA T4 + 1 
7584 : a9 00 __ LDA #$00
7586 : 85 04 __ STA WORK + 1 
7588 : a8 __ __ TAY
7589 : 91 45 __ STA (T4 + 0),y 
758b : a5 45 __ LDA T4 + 0 
758d : a0 02 __ LDY #$02
758f : 91 23 __ STA (SP + 0),y 
7591 : a5 46 __ LDA T4 + 1 
7593 : c8 __ __ INY
7594 : 91 23 __ STA (SP + 0),y 
7596 : a9 f0 __ LDA #$f0
7598 : c8 __ __ INY
7599 : 91 23 __ STA (SP + 0),y 
759b : a9 6e __ LDA #$6e
759d : c8 __ __ INY
759e : 84 03 __ STY WORK + 0 
75a0 : 91 23 __ STA (SP + 0),y 
75a2 : a5 4e __ LDA T0 + 0 
75a4 : 29 01 __ AND #$01
75a6 : 0a __ __ ASL
75a7 : 0a __ __ ASL
75a8 : 69 d4 __ ADC #$d4
75aa : c8 __ __ INY
75ab : 91 23 __ STA (SP + 0),y 
75ad : a9 bf __ LDA #$bf
75af : 69 00 __ ADC #$00
75b1 : c8 __ __ INY
75b2 : 91 23 __ STA (SP + 0),y 
75b4 : 20 45 7d JSR $7d45 ; (divmod + 0)
75b7 : a6 05 __ LDX WORK + 2 
75b9 : bd 74 7e LDA $7e74,x ; (__multab6L + 0)
75bc : 18 __ __ CLC
75bd : 69 4d __ ADC #$4d
75bf : a0 08 __ LDY #$08
75c1 : 91 23 __ STA (SP + 0),y 
75c3 : a9 bf __ LDA #$bf
75c5 : 69 00 __ ADC #$00
75c7 : c8 __ __ INY
75c8 : 91 23 __ STA (SP + 0),y 
75ca : a5 4f __ LDA T1 + 0 
75cc : 85 1b __ STA ACCU + 0 
75ce : a5 50 __ LDA T1 + 1 
75d0 : 85 1c __ STA ACCU + 1 
75d2 : a9 05 __ LDA #$05
75d4 : 85 03 __ STA WORK + 0 
75d6 : a9 00 __ LDA #$00
75d8 : 85 04 __ STA WORK + 1 
75da : 20 45 7d JSR $7d45 ; (divmod + 0)
75dd : a6 05 __ LDX WORK + 2 
75df : bd 79 7e LDA $7e79,x ; (__multab15L + 0)
75e2 : 18 __ __ CLC
75e3 : 69 89 __ ADC #$89
75e5 : a0 0a __ LDY #$0a
75e7 : 91 23 __ STA (SP + 0),y 
75e9 : a9 bf __ LDA #$bf
75eb : 69 00 __ ADC #$00
75ed : c8 __ __ INY
75ee : 91 23 __ STA (SP + 0),y 
75f0 : a5 53 __ LDA T2 + 0 
75f2 : 85 1b __ STA ACCU + 0 
75f4 : a5 54 __ LDA T2 + 1 
75f6 : 85 1c __ STA ACCU + 1 
75f8 : a9 05 __ LDA #$05
75fa : 85 03 __ STA WORK + 0 
75fc : a9 00 __ LDA #$00
75fe : 85 04 __ STA WORK + 1 
7600 : 20 45 7d JSR $7d45 ; (divmod + 0)
7603 : a6 05 __ LDX WORK + 2 
7605 : bd 74 7e LDA $7e74,x ; (__multab6L + 0)
7608 : 18 __ __ CLC
7609 : 69 6b __ ADC #$6b
760b : a0 0c __ LDY #$0c
760d : 91 23 __ STA (SP + 0),y 
760f : a9 bf __ LDA #$bf
7611 : 69 00 __ ADC #$00
7613 : c8 __ __ INY
7614 : 91 23 __ STA (SP + 0),y 
7616 : 20 2a 5e JSR $5e2a ; (sprintf.s0 + 0)
.s1001:
7619 : 18 __ __ CLC
761a : a5 23 __ LDA SP + 0 
761c : 69 0e __ ADC #$0e
761e : 85 23 __ STA SP + 0 
7620 : 90 02 __ BCC $7624 ; (generateSentence.s1001 + 11)
7622 : e6 24 __ INC SP + 1 
7624 : ad 4b bf LDA $bf4b ; (generateSentence@stack + 0)
7627 : 85 53 __ STA T2 + 0 
7629 : ad 4c bf LDA $bf4c ; (generateSentence@stack + 1)
762c : 85 54 __ STA T2 + 1 
762e : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_printwrap: ; vdcwin_printwrap(struct VDCWin*,const u8*)->void
.s1000:
762f : a2 0c __ LDX #$0c
7631 : b5 53 __ LDA T0 + 0,x 
7633 : 9d 90 bf STA $bf90,x ; (nouns + 7)
7636 : ca __ __ DEX
7637 : 10 f8 __ BPL $7631 ; (vdcwin_printwrap.s1000 + 2)
7639 : 38 __ __ SEC
763a : a5 23 __ LDA SP + 0 
763c : e9 06 __ SBC #$06
763e : 85 23 __ STA SP + 0 
7640 : b0 02 __ BCS $7644 ; (vdcwin_printwrap.s0 + 0)
7642 : c6 24 __ DEC SP + 1 
.s0:
7644 : a5 13 __ LDA P6 ; (str + 0)
7646 : 85 0d __ STA P0 
7648 : a5 14 __ LDA P7 ; (str + 1)
764a : 85 0e __ STA P1 
764c : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
764f : a5 1b __ LDA ACCU + 0 
7651 : f0 31 __ BEQ $7684 ; (vdcwin_printwrap.s1001 + 0)
.s84:
7653 : 85 53 __ STA T0 + 0 
7655 : a9 00 __ LDA #$00
7657 : 85 57 __ STA T3 + 0 
7659 : 85 5c __ STA T6 + 0 
765b : a9 ff __ LDA #$ff
765d : 85 59 __ STA T4 + 1 
765f : 85 5b __ STA T5 + 1 
7661 : a0 02 __ LDY #$02
7663 : b1 11 __ LDA (P4),y ; (win + 0)
7665 : 85 54 __ STA T1 + 0 
.l4:
7667 : a5 57 __ LDA T3 + 0 
7669 : c5 53 __ CMP T0 + 0 
766b : b0 0d __ BCS $767a ; (vdcwin_printwrap.s7 + 0)
.l9:
766d : 24 5b __ BIT T5 + 1 
766f : 10 09 __ BPL $767a ; (vdcwin_printwrap.s7 + 0)
.s8:
7671 : a6 5c __ LDX T6 + 0 
7673 : e0 50 __ CPX #$50
7675 : b0 03 __ BCS $767a ; (vdcwin_printwrap.s7 + 0)
7677 : 4c 44 78 JMP $7844 ; (vdcwin_printwrap.s6 + 0)
.s7:
767a : a6 5c __ LDX T6 + 0 
767c : d0 1c __ BNE $769a ; (vdcwin_printwrap.s19 + 0)
.s1:
767e : a5 57 __ LDA T3 + 0 
7680 : c5 53 __ CMP T0 + 0 
7682 : 90 e9 __ BCC $766d ; (vdcwin_printwrap.l9 + 0)
.s1001:
7684 : 18 __ __ CLC
7685 : a5 23 __ LDA SP + 0 
7687 : 69 06 __ ADC #$06
7689 : 85 23 __ STA SP + 0 
768b : 90 02 __ BCC $768f ; (vdcwin_printwrap.s1001 + 11)
768d : e6 24 __ INC SP + 1 
768f : a2 0c __ LDX #$0c
7691 : bd 90 bf LDA $bf90,x ; (nouns + 7)
7694 : 95 53 __ STA T0 + 0,x 
7696 : ca __ __ DEX
7697 : 10 f8 __ BPL $7691 ; (vdcwin_printwrap.s1001 + 13)
7699 : 60 __ __ RTS
.s19:
769a : a9 00 __ LDA #$00
769c : 9d 9e bf STA $bf9e,x ; (nouns + 21)
769f : a9 9e __ LDA #$9e
76a1 : 85 0d __ STA P0 
76a3 : a9 bf __ LDA #$bf
76a5 : 85 0e __ STA P1 
.l22:
76a7 : 20 cd 5d JSR $5dcd ; (strlen.s0 + 0)
76aa : a0 02 __ LDY #$02
76ac : b1 11 __ LDA (P4),y ; (win + 0)
76ae : c5 1b __ CMP ACCU + 0 
76b0 : 90 52 __ BCC $7704 ; (vdcwin_printwrap.s23 + 0)
.s24:
76b2 : a0 04 __ LDY #$04
76b4 : b1 11 __ LDA (P4),y ; (win + 0)
76b6 : 18 __ __ CLC
76b7 : 65 1b __ ADC ACCU + 0 
76b9 : b0 06 __ BCS $76c1 ; (vdcwin_printwrap.s72 + 0)
.s1010:
76bb : c5 54 __ CMP T1 + 0 
76bd : 90 1a __ BCC $76d9 ; (vdcwin_printwrap.s74 + 0)
.s1036:
76bf : f0 18 __ BEQ $76d9 ; (vdcwin_printwrap.s74 + 0)
.s72:
76c1 : a5 11 __ LDA P4 ; (win + 0)
76c3 : a0 02 __ LDY #$02
76c5 : 91 23 __ STA (SP + 0),y 
76c7 : a5 12 __ LDA P5 ; (win + 1)
76c9 : c8 __ __ INY
76ca : 91 23 __ STA (SP + 0),y 
76cc : a9 ff __ LDA #$ff
76ce : c8 __ __ INY
76cf : 91 23 __ STA (SP + 0),y 
76d1 : a9 56 __ LDA #$56
76d3 : c8 __ __ INY
76d4 : 91 23 __ STA (SP + 0),y 
76d6 : 20 64 78 JSR $7864 ; (vdcwin_printline.s1000 + 0)
.s74:
76d9 : a5 11 __ LDA P4 ; (win + 0)
76db : a0 02 __ LDY #$02
76dd : 91 23 __ STA (SP + 0),y 
76df : a5 12 __ LDA P5 ; (win + 1)
76e1 : c8 __ __ INY
76e2 : 91 23 __ STA (SP + 0),y 
76e4 : a9 9e __ LDA #$9e
76e6 : c8 __ __ INY
76e7 : 91 23 __ STA (SP + 0),y 
76e9 : a9 bf __ LDA #$bf
76eb : c8 __ __ INY
76ec : 91 23 __ STA (SP + 0),y 
76ee : 20 35 7b JSR $7b35 ; (vdcwin_put_string.s1000 + 0)
76f1 : a5 57 __ LDA T3 + 0 
76f3 : c5 53 __ CMP T0 + 0 
76f5 : b0 8d __ BCS $7684 ; (vdcwin_printwrap.s1001 + 0)
.s211:
76f7 : a9 00 __ LDA #$00
76f9 : 85 5c __ STA T6 + 0 
76fb : a9 ff __ LDA #$ff
76fd : 85 5b __ STA T5 + 1 
76ff : 85 59 __ STA T4 + 1 
7701 : 4c 67 76 JMP $7667 ; (vdcwin_printwrap.l4 + 0)
.s23:
7704 : a5 11 __ LDA P4 ; (win + 0)
7706 : 91 23 __ STA (SP + 0),y 
7708 : a5 12 __ LDA P5 ; (win + 1)
770a : c8 __ __ INY
770b : 91 23 __ STA (SP + 0),y 
770d : a9 ff __ LDA #$ff
770f : c8 __ __ INY
7710 : 91 23 __ STA (SP + 0),y 
7712 : a9 56 __ LDA #$56
7714 : c8 __ __ INY
7715 : 91 23 __ STA (SP + 0),y 
7717 : 20 64 78 JSR $7864 ; (vdcwin_printline.s1000 + 0)
771a : a5 11 __ LDA P4 ; (win + 0)
771c : 85 55 __ STA T2 + 0 
771e : a5 12 __ LDA P5 ; (win + 1)
7720 : 85 56 __ STA T2 + 1 
7722 : a0 02 __ LDY #$02
7724 : b1 11 __ LDA (P4),y ; (win + 0)
7726 : 85 5c __ STA T6 + 0 
7728 : f0 14 __ BEQ $773e ; (vdcwin_printwrap.s26 + 0)
.s81:
772a : a0 04 __ LDY #$04
772c : b1 11 __ LDA (P4),y ; (win + 0)
772e : 85 58 __ STA T4 + 0 
7730 : c8 __ __ INY
7731 : b1 11 __ LDA (P4),y ; (win + 0)
7733 : 85 5a __ STA T5 + 0 
7735 : ad 2d 83 LDA $832d ; (vdc_state + 7)
7738 : 85 5e __ STA T10 + 0 
773a : a2 00 __ LDX #$00
773c : f0 65 __ BEQ $77a3 ; (vdcwin_printwrap.l28 + 0)
.s26:
773e : a5 5c __ LDA T6 + 0 
7740 : 18 __ __ CLC
7741 : a0 04 __ LDY #$04
7743 : 71 55 __ ADC (T2 + 0),y 
7745 : 91 55 __ STA (T2 + 0),y 
7747 : a0 02 __ LDY #$02
7749 : d1 55 __ CMP (T2 + 0),y 
774b : 90 32 __ BCC $777f ; (vdcwin_printwrap.s25 + 0)
.s66:
774d : a9 00 __ LDA #$00
774f : a0 04 __ LDY #$04
7751 : 91 55 __ STA (T2 + 0),y 
7753 : c8 __ __ INY
7754 : b1 55 __ LDA (T2 + 0),y 
7756 : aa __ __ TAX
7757 : 18 __ __ CLC
7758 : 69 01 __ ADC #$01
775a : 91 55 __ STA (T2 + 0),y 
775c : a0 03 __ LDY #$03
775e : d1 55 __ CMP (T2 + 0),y 
7760 : d0 1d __ BNE $777f ; (vdcwin_printwrap.s25 + 0)
.s69:
7762 : 8a __ __ TXA
7763 : a0 05 __ LDY #$05
7765 : 91 55 __ STA (T2 + 0),y 
7767 : a5 55 __ LDA T2 + 0 
7769 : a0 02 __ LDY #$02
776b : 91 23 __ STA (SP + 0),y 
776d : a5 56 __ LDA T2 + 1 
776f : c8 __ __ INY
7770 : 91 23 __ STA (SP + 0),y 
7772 : a9 ff __ LDA #$ff
7774 : c8 __ __ INY
7775 : 91 23 __ STA (SP + 0),y 
7777 : a9 56 __ LDA #$56
7779 : c8 __ __ INY
777a : 91 23 __ STA (SP + 0),y 
777c : 20 64 78 JSR $7864 ; (vdcwin_printline.s1000 + 0)
.s25:
777f : a9 9e __ LDA #$9e
7781 : 85 0d __ STA P0 
7783 : a9 bf __ LDA #$bf
7785 : 85 0e __ STA P1 
7787 : a0 02 __ LDY #$02
7789 : b1 11 __ LDA (P4),y ; (win + 0)
778b : 18 __ __ CLC
778c : 69 9e __ ADC #$9e
778e : 85 58 __ STA T4 + 0 
7790 : a9 bf __ LDA #$bf
7792 : 69 00 __ ADC #$00
7794 : 85 59 __ STA T4 + 1 
7796 : a0 ff __ LDY #$ff
.l1012:
7798 : c8 __ __ INY
7799 : b1 58 __ LDA (T4 + 0),y 
779b : 99 9e bf STA $bf9e,y ; (nouns + 21)
779e : d0 f8 __ BNE $7798 ; (vdcwin_printwrap.l1012 + 0)
77a0 : 4c a7 76 JMP $76a7 ; (vdcwin_printwrap.l22 + 0)
.l28:
77a3 : 86 5d __ STX T7 + 0 
77a5 : bd 9e bf LDA $bf9e,x ; (nouns + 21)
77a8 : 4a __ __ LSR
77a9 : 4a __ __ LSR
77aa : 4a __ __ LSR
77ab : 4a __ __ LSR
77ac : 4a __ __ LSR
77ad : a8 __ __ TAY
77ae : b9 ed 82 LDA $82ed,y ; (p2smap + 0)
77b1 : 5d 9e bf EOR $bf9e,x ; (nouns + 21)
77b4 : 85 5f __ STA T11 + 0 
77b6 : a0 00 __ LDY #$00
77b8 : b1 55 __ LDA (T2 + 0),y 
77ba : 18 __ __ CLC
77bb : 65 58 __ ADC T4 + 0 
77bd : 18 __ __ CLC
77be : 65 5d __ ADC T7 + 0 
77c0 : 85 0d __ STA P0 
77c2 : c8 __ __ INY
77c3 : b1 55 __ LDA (T2 + 0),y 
77c5 : 18 __ __ CLC
77c6 : 65 5a __ ADC T5 + 0 
77c8 : 85 0e __ STA P1 
77ca : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
77cd : a9 12 __ LDA #$12
77cf : 8d 00 d6 STA $d600 
77d2 : 18 __ __ CLC
77d3 : a5 1b __ LDA ACCU + 0 
77d5 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
77d8 : aa __ __ TAX
77d9 : a5 1c __ LDA ACCU + 1 
77db : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l300:
77de : 2c 00 d6 BIT $d600 
77e1 : 10 fb __ BPL $77de ; (vdcwin_printwrap.l300 + 0)
.s40:
77e3 : 8d 01 d6 STA $d601 
77e6 : a9 13 __ LDA #$13
77e8 : 8d 00 d6 STA $d600 
.l302:
77eb : 2c 00 d6 BIT $d600 
77ee : 10 fb __ BPL $77eb ; (vdcwin_printwrap.l302 + 0)
.s45:
77f0 : 8e 01 d6 STX $d601 
77f3 : a9 1f __ LDA #$1f
77f5 : 8d 00 d6 STA $d600 
.l304:
77f8 : 2c 00 d6 BIT $d600 
77fb : 10 fb __ BPL $77f8 ; (vdcwin_printwrap.l304 + 0)
.s49:
77fd : a5 5f __ LDA T11 + 0 
77ff : 8d 01 d6 STA $d601 
7802 : ad 30 83 LDA $8330 ; (vdc_state + 10)
7805 : 18 __ __ CLC
7806 : 65 1b __ ADC ACCU + 0 
7808 : a2 12 __ LDX #$12
780a : 8e 00 d6 STX $d600 
780d : aa __ __ TAX
780e : ad 31 83 LDA $8331 ; (vdc_state + 11)
7811 : 65 1c __ ADC ACCU + 1 
.l306:
7813 : 2c 00 d6 BIT $d600 
7816 : 10 fb __ BPL $7813 ; (vdcwin_printwrap.l306 + 0)
.s56:
7818 : 8d 01 d6 STA $d601 
781b : a9 13 __ LDA #$13
781d : 8d 00 d6 STA $d600 
.l308:
7820 : 2c 00 d6 BIT $d600 
7823 : 10 fb __ BPL $7820 ; (vdcwin_printwrap.l308 + 0)
.s61:
7825 : 8e 01 d6 STX $d601 
7828 : a9 1f __ LDA #$1f
782a : 8d 00 d6 STA $d600 
.l310:
782d : 2c 00 d6 BIT $d600 
7830 : 10 fb __ BPL $782d ; (vdcwin_printwrap.l310 + 0)
.s65:
7832 : a5 5e __ LDA T10 + 0 
7834 : 8d 01 d6 STA $d601 
7837 : a6 5d __ LDX T7 + 0 
7839 : e8 __ __ INX
783a : e4 5c __ CPX T6 + 0 
783c : b0 03 __ BCS $7841 ; (vdcwin_printwrap.s65 + 15)
783e : 4c a3 77 JMP $77a3 ; (vdcwin_printwrap.l28 + 0)
7841 : 4c 3e 77 JMP $773e ; (vdcwin_printwrap.s26 + 0)
.s6:
7844 : a4 57 __ LDY T3 + 0 
7846 : b1 13 __ LDA (P6),y ; (str + 0)
7848 : 9d 9e bf STA $bf9e,x ; (nouns + 21)
784b : c9 20 __ CMP #$20
784d : d0 06 __ BNE $7855 ; (vdcwin_printwrap.s10 + 0)
.s16:
784f : a9 00 __ LDA #$00
7851 : 85 5b __ STA T5 + 1 
7853 : f0 08 __ BEQ $785d ; (vdcwin_printwrap.s229 + 0)
.s10:
7855 : 24 59 __ BIT T4 + 1 
7857 : 10 04 __ BPL $785d ; (vdcwin_printwrap.s229 + 0)
.s13:
7859 : a9 00 __ LDA #$00
785b : 85 59 __ STA T4 + 1 
.s229:
785d : e6 57 __ INC T3 + 0 
785f : e6 5c __ INC T6 + 0 
7861 : 4c 67 76 JMP $7667 ; (vdcwin_printwrap.l4 + 0)
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
7864 : a2 08 __ LDX #$08
7866 : b5 53 __ LDA T0 + 0,x 
7868 : 9d ef bf STA $bfef,x ; (buffer + 7)
786b : ca __ __ DEX
786c : 10 f8 __ BPL $7866 ; (vdcwin_printline.s1000 + 2)
786e : 38 __ __ SEC
786f : a5 23 __ LDA SP + 0 
7871 : e9 06 __ SBC #$06
7873 : 85 23 __ STA SP + 0 
7875 : b0 02 __ BCS $7879 ; (vdcwin_printline.s0 + 0)
7877 : c6 24 __ DEC SP + 1 
.s0:
7879 : a0 08 __ LDY #$08
787b : b1 23 __ LDA (SP + 0),y 
787d : 85 53 __ STA T0 + 0 
787f : a0 02 __ LDY #$02
7881 : 91 23 __ STA (SP + 0),y 
7883 : a0 09 __ LDY #$09
7885 : b1 23 __ LDA (SP + 0),y 
7887 : 85 54 __ STA T0 + 1 
7889 : a0 03 __ LDY #$03
788b : 91 23 __ STA (SP + 0),y 
788d : a0 0a __ LDY #$0a
788f : b1 23 __ LDA (SP + 0),y 
7891 : a0 04 __ LDY #$04
7893 : 91 23 __ STA (SP + 0),y 
7895 : a0 0b __ LDY #$0b
7897 : b1 23 __ LDA (SP + 0),y 
7899 : a0 05 __ LDY #$05
789b : 91 23 __ STA (SP + 0),y 
789d : 20 35 7b JSR $7b35 ; (vdcwin_put_string.s1000 + 0)
78a0 : a9 00 __ LDA #$00
78a2 : a0 04 __ LDY #$04
78a4 : 91 53 __ STA (T0 + 0),y 
78a6 : 88 __ __ DEY
78a7 : b1 53 __ LDA (T0 + 0),y 
78a9 : 38 __ __ SEC
78aa : e9 01 __ SBC #$01
78ac : 85 55 __ STA T1 + 0 
78ae : a0 05 __ LDY #$05
78b0 : b1 53 __ LDA (T0 + 0),y 
78b2 : 90 0b __ BCC $78bf ; (vdcwin_printline.s2 + 0)
.s1058:
78b4 : aa __ __ TAX
78b5 : e4 55 __ CPX T1 + 0 
78b7 : b0 06 __ BCS $78bf ; (vdcwin_printline.s2 + 0)
.s1:
78b9 : e8 __ __ INX
78ba : 8a __ __ TXA
78bb : 91 53 __ STA (T0 + 0),y 
78bd : 90 68 __ BCC $7927 ; (vdcwin_printline.s1001 + 0)
.s2:
78bf : a9 00 __ LDA #$00
78c1 : 85 57 __ STA T2 + 0 
78c3 : ad 29 83 LDA $8329 ; (vdc_state + 3)
78c6 : 85 55 __ STA T1 + 0 
78c8 : ad 2a 83 LDA $832a ; (vdc_state + 4)
78cb : 85 56 __ STA T1 + 1 
78cd : a0 02 __ LDY #$02
78cf : b1 53 __ LDA (T0 + 0),y 
78d1 : 85 5a __ STA T4 + 0 
78d3 : a0 06 __ LDY #$06
78d5 : b1 53 __ LDA (T0 + 0),y 
78d7 : 85 58 __ STA T3 + 0 
78d9 : c8 __ __ INY
78da : b1 53 __ LDA (T0 + 0),y 
78dc : 85 59 __ STA T3 + 1 
78de : c8 __ __ INY
78df : b1 53 __ LDA (T0 + 0),y 
78e1 : aa __ __ TAX
78e2 : c8 __ __ INY
78e3 : b1 53 __ LDA (T0 + 0),y 
.l5:
78e5 : 85 44 __ STA T5 + 1 
78e7 : a0 03 __ LDY #$03
78e9 : b1 53 __ LDA (T0 + 0),y 
78eb : 85 45 __ STA T7 + 0 
78ed : 38 __ __ SEC
78ee : e9 01 __ SBC #$01
78f0 : b0 03 __ BCS $78f5 ; (vdcwin_printline.s1056 + 0)
78f2 : 4c 18 7a JMP $7a18 ; (vdcwin_printline.s6 + 0)
.s1056:
78f5 : c5 57 __ CMP T2 + 0 
78f7 : 90 05 __ BCC $78fe ; (vdcwin_printline.s4 + 0)
.s1062:
78f9 : f0 03 __ BEQ $78fe ; (vdcwin_printline.s4 + 0)
78fb : 4c 18 7a JMP $7a18 ; (vdcwin_printline.s6 + 0)
.s4:
78fe : a0 01 __ LDY #$01
7900 : b1 53 __ LDA (T0 + 0),y 
7902 : 18 __ __ CLC
7903 : 65 45 __ ADC T7 + 0 
7905 : 38 __ __ SEC
7906 : e9 01 __ SBC #$01
7908 : 85 55 __ STA T1 + 0 
790a : 18 __ __ CLC
790b : 69 01 __ ADC #$01
790d : 85 58 __ STA T3 + 0 
790f : 88 __ __ DEY
7910 : b1 53 __ LDA (T0 + 0),y 
7912 : 85 57 __ STA T2 + 0 
7914 : a0 02 __ LDY #$02
7916 : b1 53 __ LDA (T0 + 0),y 
7918 : 85 5a __ STA T4 + 0 
791a : a9 00 __ LDA #$00
791c : 2a __ __ ROL
791d : 85 59 __ STA T3 + 1 
791f : d0 1c __ BNE $793d ; (vdcwin_printline.l186 + 0)
.s1026:
7921 : a5 55 __ LDA T1 + 0 
7923 : c5 58 __ CMP T3 + 0 
7925 : 90 16 __ BCC $793d ; (vdcwin_printline.l186 + 0)
.s1001:
7927 : 18 __ __ CLC
7928 : a5 23 __ LDA SP + 0 
792a : 69 06 __ ADC #$06
792c : 85 23 __ STA SP + 0 
792e : 90 02 __ BCC $7932 ; (vdcwin_printline.s1001 + 11)
7930 : e6 24 __ INC SP + 1 
7932 : a2 08 __ LDX #$08
7934 : bd ef bf LDA $bfef,x ; (buffer + 7)
7937 : 95 53 __ STA T0 + 0,x 
7939 : ca __ __ DEX
793a : 10 f8 __ BPL $7934 ; (vdcwin_printline.s1001 + 13)
793c : 60 __ __ RTS
.l186:
793d : a5 57 __ LDA T2 + 0 
793f : 85 0d __ STA P0 ; (win + 0)
7941 : a5 55 __ LDA T1 + 0 
7943 : 85 0e __ STA P1 ; (win + 1)
7945 : ad 2d 83 LDA $832d ; (vdc_state + 7)
7948 : 85 5b __ STA T6 + 0 
794a : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
794d : a9 12 __ LDA #$12
794f : 8d 00 d6 STA $d600 
7952 : 18 __ __ CLC
7953 : a5 1b __ LDA ACCU + 0 
7955 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
7958 : a8 __ __ TAY
7959 : a5 1c __ LDA ACCU + 1 
795b : 6d 2f 83 ADC $832f ; (vdc_state + 9)
795e : a6 5a __ LDX T4 + 0 
7960 : ca __ __ DEX
.l915:
7961 : 2c 00 d6 BIT $d600 
7964 : 10 fb __ BPL $7961 ; (vdcwin_printline.l915 + 0)
.s196:
7966 : 8d 01 d6 STA $d601 
7969 : a9 13 __ LDA #$13
796b : 8d 00 d6 STA $d600 
.l917:
796e : 2c 00 d6 BIT $d600 
7971 : 10 fb __ BPL $796e ; (vdcwin_printline.l917 + 0)
.s201:
7973 : 8c 01 d6 STY $d601 
7976 : a9 1f __ LDA #$1f
7978 : 8d 00 d6 STA $d600 
.l919:
797b : 2c 00 d6 BIT $d600 
797e : 10 fb __ BPL $797b ; (vdcwin_printline.l919 + 0)
.s205:
7980 : a9 20 __ LDA #$20
7982 : 8d 01 d6 STA $d601 
7985 : a9 18 __ LDA #$18
7987 : 8d 00 d6 STA $d600 
.l921:
798a : 2c 00 d6 BIT $d600 
798d : 10 fb __ BPL $798a ; (vdcwin_printline.l921 + 0)
.s211:
798f : ad 01 d6 LDA $d601 
7992 : 29 7f __ AND #$7f
7994 : a0 18 __ LDY #$18
7996 : 8c 00 d6 STY $d600 
.l923:
7999 : 2c 00 d6 BIT $d600 
799c : 10 fb __ BPL $7999 ; (vdcwin_printline.l923 + 0)
.s217:
799e : 8d 01 d6 STA $d601 
79a1 : a9 1e __ LDA #$1e
79a3 : 8d 00 d6 STA $d600 
.l925:
79a6 : 2c 00 d6 BIT $d600 
79a9 : 10 fb __ BPL $79a6 ; (vdcwin_printline.l925 + 0)
.s222:
79ab : 8e 01 d6 STX $d601 
79ae : ad 30 83 LDA $8330 ; (vdc_state + 10)
79b1 : 18 __ __ CLC
79b2 : 65 1b __ ADC ACCU + 0 
79b4 : a0 12 __ LDY #$12
79b6 : 8c 00 d6 STY $d600 
79b9 : a8 __ __ TAY
79ba : ad 31 83 LDA $8331 ; (vdc_state + 11)
79bd : 65 1c __ ADC ACCU + 1 
.l927:
79bf : 2c 00 d6 BIT $d600 
79c2 : 10 fb __ BPL $79bf ; (vdcwin_printline.l927 + 0)
.s229:
79c4 : 8d 01 d6 STA $d601 
79c7 : a9 13 __ LDA #$13
79c9 : 8d 00 d6 STA $d600 
.l929:
79cc : 2c 00 d6 BIT $d600 
79cf : 10 fb __ BPL $79cc ; (vdcwin_printline.l929 + 0)
.s234:
79d1 : 8c 01 d6 STY $d601 
79d4 : a9 1f __ LDA #$1f
79d6 : 8d 00 d6 STA $d600 
.l931:
79d9 : 2c 00 d6 BIT $d600 
79dc : 10 fb __ BPL $79d9 ; (vdcwin_printline.l931 + 0)
.s238:
79de : a5 5b __ LDA T6 + 0 
79e0 : 8d 01 d6 STA $d601 
79e3 : a9 18 __ LDA #$18
79e5 : 8d 00 d6 STA $d600 
.l933:
79e8 : 2c 00 d6 BIT $d600 
79eb : 10 fb __ BPL $79e8 ; (vdcwin_printline.l933 + 0)
.s244:
79ed : ad 01 d6 LDA $d601 
79f0 : 29 7f __ AND #$7f
79f2 : a0 18 __ LDY #$18
79f4 : 8c 00 d6 STY $d600 
.l935:
79f7 : 2c 00 d6 BIT $d600 
79fa : 10 fb __ BPL $79f7 ; (vdcwin_printline.l935 + 0)
.s250:
79fc : 8d 01 d6 STA $d601 
79ff : a9 1e __ LDA #$1e
7a01 : 8d 00 d6 STA $d600 
.l937:
7a04 : 2c 00 d6 BIT $d600 
7a07 : 10 fb __ BPL $7a04 ; (vdcwin_printline.l937 + 0)
.s255:
7a09 : 8e 01 d6 STX $d601 
7a0c : e6 55 __ INC T1 + 0 
7a0e : a5 59 __ LDA T3 + 1 
7a10 : f0 03 __ BEQ $7a15 ; (vdcwin_printline.s255 + 12)
7a12 : 4c 3d 79 JMP $793d ; (vdcwin_printline.l186 + 0)
7a15 : 4c 21 79 JMP $7921 ; (vdcwin_printline.s1026 + 0)
.s6:
7a18 : a9 12 __ LDA #$12
7a1a : 8d 00 d6 STA $d600 
7a1d : 8a __ __ TXA
7a1e : 18 __ __ CLC
7a1f : 65 55 __ ADC T1 + 0 
7a21 : a8 __ __ TAY
7a22 : a5 44 __ LDA T5 + 1 
7a24 : 65 56 __ ADC T1 + 1 
7a26 : 85 46 __ STA T7 + 1 
7a28 : 18 __ __ CLC
7a29 : a5 58 __ LDA T3 + 0 
7a2b : 65 55 __ ADC T1 + 0 
7a2d : 85 49 __ STA T9 + 0 
7a2f : a5 59 __ LDA T3 + 1 
7a31 : 65 56 __ ADC T1 + 1 
7a33 : 85 4a __ STA T9 + 1 
.l886:
7a35 : 2c 00 d6 BIT $d600 
7a38 : 10 fb __ BPL $7a35 ; (vdcwin_printline.l886 + 0)
.s62:
7a3a : a5 59 __ LDA T3 + 1 
7a3c : 8d 01 d6 STA $d601 
7a3f : a9 13 __ LDA #$13
7a41 : 8d 00 d6 STA $d600 
.l888:
7a44 : 2c 00 d6 BIT $d600 
7a47 : 10 fb __ BPL $7a44 ; (vdcwin_printline.l888 + 0)
.s67:
7a49 : a5 58 __ LDA T3 + 0 
7a4b : 8d 01 d6 STA $d601 
7a4e : a9 1f __ LDA #$1f
7a50 : 8d 00 d6 STA $d600 
7a53 : a9 18 __ LDA #$18
7a55 : 8d 00 d6 STA $d600 
.l890:
7a58 : 2c 00 d6 BIT $d600 
7a5b : 10 fb __ BPL $7a58 ; (vdcwin_printline.l890 + 0)
.s74:
7a5d : ad 01 d6 LDA $d601 
7a60 : 09 80 __ ORA #$80
7a62 : 85 4b __ STA T10 + 0 
7a64 : a9 18 __ LDA #$18
7a66 : 8d 00 d6 STA $d600 
.l892:
7a69 : 2c 00 d6 BIT $d600 
7a6c : 10 fb __ BPL $7a69 ; (vdcwin_printline.l892 + 0)
.s80:
7a6e : a5 4b __ LDA T10 + 0 
7a70 : 8d 01 d6 STA $d601 
7a73 : a9 20 __ LDA #$20
7a75 : 8d 00 d6 STA $d600 
.l894:
7a78 : 2c 00 d6 BIT $d600 
7a7b : 10 fb __ BPL $7a78 ; (vdcwin_printline.l894 + 0)
.s85:
7a7d : a5 4a __ LDA T9 + 1 
7a7f : 8d 01 d6 STA $d601 
7a82 : a9 21 __ LDA #$21
7a84 : 8d 00 d6 STA $d600 
.l896:
7a87 : 2c 00 d6 BIT $d600 
7a8a : 10 fb __ BPL $7a87 ; (vdcwin_printline.l896 + 0)
.s90:
7a8c : a5 49 __ LDA T9 + 0 
7a8e : 8d 01 d6 STA $d601 
7a91 : a9 1f __ LDA #$1f
7a93 : 8d 00 d6 STA $d600 
7a96 : a9 1e __ LDA #$1e
7a98 : 8d 00 d6 STA $d600 
.l898:
7a9b : 2c 00 d6 BIT $d600 
7a9e : 10 fb __ BPL $7a9b ; (vdcwin_printline.l898 + 0)
.s96:
7aa0 : a5 5a __ LDA T4 + 0 
7aa2 : 8d 01 d6 STA $d601 
7aa5 : a9 12 __ LDA #$12
7aa7 : 8d 00 d6 STA $d600 
.l900:
7aaa : 2c 00 d6 BIT $d600 
7aad : 10 fb __ BPL $7aaa ; (vdcwin_printline.l900 + 0)
.s149:
7aaf : a5 44 __ LDA T5 + 1 
7ab1 : 8d 01 d6 STA $d601 
7ab4 : a9 13 __ LDA #$13
7ab6 : 8d 00 d6 STA $d600 
.l902:
7ab9 : 2c 00 d6 BIT $d600 
7abc : 10 fb __ BPL $7ab9 ; (vdcwin_printline.l902 + 0)
.s154:
7abe : 8e 01 d6 STX $d601 
7ac1 : a9 1f __ LDA #$1f
7ac3 : 8d 00 d6 STA $d600 
7ac6 : a9 18 __ LDA #$18
7ac8 : 8d 00 d6 STA $d600 
.l904:
7acb : 2c 00 d6 BIT $d600 
7ace : 10 fb __ BPL $7acb ; (vdcwin_printline.l904 + 0)
.s161:
7ad0 : ad 01 d6 LDA $d601 
7ad3 : 09 80 __ ORA #$80
7ad5 : 85 49 __ STA T9 + 0 
7ad7 : a9 18 __ LDA #$18
7ad9 : 8d 00 d6 STA $d600 
.l906:
7adc : 2c 00 d6 BIT $d600 
7adf : 10 fb __ BPL $7adc ; (vdcwin_printline.l906 + 0)
.s167:
7ae1 : a5 49 __ LDA T9 + 0 
7ae3 : 8d 01 d6 STA $d601 
7ae6 : a9 20 __ LDA #$20
7ae8 : 8d 00 d6 STA $d600 
.l908:
7aeb : 2c 00 d6 BIT $d600 
7aee : 10 fb __ BPL $7aeb ; (vdcwin_printline.l908 + 0)
.s172:
7af0 : a5 46 __ LDA T7 + 1 
7af2 : 8d 01 d6 STA $d601 
7af5 : a9 21 __ LDA #$21
7af7 : 8d 00 d6 STA $d600 
.l910:
7afa : 2c 00 d6 BIT $d600 
7afd : 10 fb __ BPL $7afa ; (vdcwin_printline.l910 + 0)
.s177:
7aff : 8c 01 d6 STY $d601 
7b02 : a9 1f __ LDA #$1f
7b04 : 8d 00 d6 STA $d600 
7b07 : a9 1e __ LDA #$1e
7b09 : 8d 00 d6 STA $d600 
.l912:
7b0c : 2c 00 d6 BIT $d600 
7b0f : 10 fb __ BPL $7b0c ; (vdcwin_printline.l912 + 0)
.s183:
7b11 : a5 5a __ LDA T4 + 0 
7b13 : 8d 01 d6 STA $d601 
7b16 : ad 29 83 LDA $8329 ; (vdc_state + 3)
7b19 : 18 __ __ CLC
7b1a : 65 58 __ ADC T3 + 0 
7b1c : 85 58 __ STA T3 + 0 
7b1e : ad 2a 83 LDA $832a ; (vdc_state + 4)
7b21 : 65 59 __ ADC T3 + 1 
7b23 : 85 59 __ STA T3 + 1 
7b25 : 8a __ __ TXA
7b26 : 18 __ __ CLC
7b27 : 6d 29 83 ADC $8329 ; (vdc_state + 3)
7b2a : aa __ __ TAX
7b2b : a5 44 __ LDA T5 + 1 
7b2d : 6d 2a 83 ADC $832a ; (vdc_state + 4)
7b30 : e6 57 __ INC T2 + 0 
7b32 : 4c e5 78 JMP $78e5 ; (vdcwin_printline.l5 + 0)
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->void
.s1000:
7b35 : 38 __ __ SEC
7b36 : a5 23 __ LDA SP + 0 
7b38 : e9 0f __ SBC #$0f
7b3a : 85 23 __ STA SP + 0 
7b3c : b0 02 __ BCS $7b40 ; (vdcwin_put_string.s1000 + 11)
7b3e : c6 24 __ DEC SP + 1 
7b40 : a0 0e __ LDY #$0e
7b42 : a2 08 __ LDX #$08
7b44 : b5 53 __ LDA T0 + 0,x 
7b46 : 91 23 __ STA (SP + 0),y 
7b48 : 88 __ __ DEY
7b49 : ca __ __ DEX
7b4a : 10 f8 __ BPL $7b44 ; (vdcwin_put_string.s1000 + 15)
.s0:
7b4c : a9 00 __ LDA #$00
7b4e : 85 53 __ STA T0 + 0 
7b50 : a0 11 __ LDY #$11
7b52 : b1 23 __ LDA (SP + 0),y 
7b54 : 85 54 __ STA T1 + 0 
7b56 : c8 __ __ INY
7b57 : b1 23 __ LDA (SP + 0),y 
7b59 : 85 55 __ STA T1 + 1 
7b5b : a0 04 __ LDY #$04
7b5d : b1 54 __ LDA (T1 + 0),y 
7b5f : 85 56 __ STA T2 + 0 
7b61 : c8 __ __ INY
7b62 : b1 54 __ LDA (T1 + 0),y 
7b64 : 85 57 __ STA T3 + 0 
7b66 : a0 13 __ LDY #$13
7b68 : b1 23 __ LDA (SP + 0),y 
7b6a : 85 58 __ STA T4 + 0 
7b6c : c8 __ __ INY
7b6d : b1 23 __ LDA (SP + 0),y 
7b6f : 85 59 __ STA T4 + 1 
.l2:
7b71 : a4 53 __ LDY T0 + 0 
7b73 : b1 58 __ LDA (T4 + 0),y 
7b75 : d0 5b __ BNE $7bd2 ; (vdcwin_put_string.s3 + 0)
.s4:
7b77 : a0 04 __ LDY #$04
7b79 : b1 54 __ LDA (T1 + 0),y 
7b7b : 18 __ __ CLC
7b7c : 65 53 __ ADC T0 + 0 
7b7e : 91 54 __ STA (T1 + 0),y 
7b80 : a0 02 __ LDY #$02
7b82 : d1 54 __ CMP (T1 + 0),y 
7b84 : 90 34 __ BCC $7bba ; (vdcwin_put_string.s1001 + 0)
.s41:
7b86 : a9 00 __ LDA #$00
7b88 : a0 04 __ LDY #$04
7b8a : 91 54 __ STA (T1 + 0),y 
7b8c : c8 __ __ INY
7b8d : b1 54 __ LDA (T1 + 0),y 
7b8f : 85 53 __ STA T0 + 0 
7b91 : 18 __ __ CLC
7b92 : 69 01 __ ADC #$01
7b94 : 91 54 __ STA (T1 + 0),y 
7b96 : a0 03 __ LDY #$03
7b98 : d1 54 __ CMP (T1 + 0),y 
7b9a : d0 1e __ BNE $7bba ; (vdcwin_put_string.s1001 + 0)
.s44:
7b9c : a5 53 __ LDA T0 + 0 
7b9e : a0 05 __ LDY #$05
7ba0 : 91 54 __ STA (T1 + 0),y 
7ba2 : a5 54 __ LDA T1 + 0 
7ba4 : a0 02 __ LDY #$02
7ba6 : 91 23 __ STA (SP + 0),y 
7ba8 : a5 55 __ LDA T1 + 1 
7baa : c8 __ __ INY
7bab : 91 23 __ STA (SP + 0),y 
7bad : a9 ff __ LDA #$ff
7baf : c8 __ __ INY
7bb0 : 91 23 __ STA (SP + 0),y 
7bb2 : a9 56 __ LDA #$56
7bb4 : c8 __ __ INY
7bb5 : 91 23 __ STA (SP + 0),y 
7bb7 : 20 64 78 JSR $7864 ; (vdcwin_printline.s1000 + 0)
.s1001:
7bba : a0 0e __ LDY #$0e
7bbc : a2 08 __ LDX #$08
7bbe : b1 23 __ LDA (SP + 0),y 
7bc0 : 95 53 __ STA T0 + 0,x 
7bc2 : 88 __ __ DEY
7bc3 : ca __ __ DEX
7bc4 : 10 f8 __ BPL $7bbe ; (vdcwin_put_string.s1001 + 4)
7bc6 : 18 __ __ CLC
7bc7 : a5 23 __ LDA SP + 0 
7bc9 : 69 0f __ ADC #$0f
7bcb : 85 23 __ STA SP + 0 
7bcd : 90 02 __ BCC $7bd1 ; (vdcwin_put_string.s1001 + 23)
7bcf : e6 24 __ INC SP + 1 
7bd1 : 60 __ __ RTS
.s3:
7bd2 : 4a __ __ LSR
7bd3 : 4a __ __ LSR
7bd4 : 4a __ __ LSR
7bd5 : 4a __ __ LSR
7bd6 : 4a __ __ LSR
7bd7 : aa __ __ TAX
7bd8 : bd ed 82 LDA $82ed,x ; (p2smap + 0)
7bdb : 51 58 __ EOR (T4 + 0),y 
7bdd : 85 5a __ STA T7 + 0 
7bdf : a5 56 __ LDA T2 + 0 
7be1 : 18 __ __ CLC
7be2 : a0 00 __ LDY #$00
7be4 : 71 54 __ ADC (T1 + 0),y 
7be6 : 18 __ __ CLC
7be7 : 65 53 __ ADC T0 + 0 
7be9 : 85 0d __ STA P0 ; (win + 0)
7beb : a5 57 __ LDA T3 + 0 
7bed : 18 __ __ CLC
7bee : c8 __ __ INY
7bef : 71 54 __ ADC (T1 + 0),y 
7bf1 : 85 0e __ STA P1 ; (win + 1)
7bf3 : ad 2d 83 LDA $832d ; (vdc_state + 7)
7bf6 : 85 5b __ STA T8 + 0 
7bf8 : 20 ab 4f JSR $4fab ; (vdc_coords.s0 + 0)
7bfb : a9 12 __ LDA #$12
7bfd : 8d 00 d6 STA $d600 
7c00 : 18 __ __ CLC
7c01 : a5 1b __ LDA ACCU + 0 
7c03 : 6d 2e 83 ADC $832e ; (vdc_state + 8)
7c06 : aa __ __ TAX
7c07 : a5 1c __ LDA ACCU + 1 
7c09 : 6d 2f 83 ADC $832f ; (vdc_state + 9)
.l186:
7c0c : 2c 00 d6 BIT $d600 
7c0f : 10 fb __ BPL $7c0c ; (vdcwin_put_string.l186 + 0)
.s14:
7c11 : 8d 01 d6 STA $d601 
7c14 : a9 13 __ LDA #$13
7c16 : 8d 00 d6 STA $d600 
.l188:
7c19 : 2c 00 d6 BIT $d600 
7c1c : 10 fb __ BPL $7c19 ; (vdcwin_put_string.l188 + 0)
.s19:
7c1e : 8e 01 d6 STX $d601 
7c21 : a9 1f __ LDA #$1f
7c23 : 8d 00 d6 STA $d600 
.l190:
7c26 : 2c 00 d6 BIT $d600 
7c29 : 10 fb __ BPL $7c26 ; (vdcwin_put_string.l190 + 0)
.s23:
7c2b : a5 5a __ LDA T7 + 0 
7c2d : 8d 01 d6 STA $d601 
7c30 : ad 30 83 LDA $8330 ; (vdc_state + 10)
7c33 : 18 __ __ CLC
7c34 : 65 1b __ ADC ACCU + 0 
7c36 : a2 12 __ LDX #$12
7c38 : 8e 00 d6 STX $d600 
7c3b : aa __ __ TAX
7c3c : ad 31 83 LDA $8331 ; (vdc_state + 11)
7c3f : 65 1c __ ADC ACCU + 1 
.l192:
7c41 : 2c 00 d6 BIT $d600 
7c44 : 10 fb __ BPL $7c41 ; (vdcwin_put_string.l192 + 0)
.s30:
7c46 : 8d 01 d6 STA $d601 
7c49 : a9 13 __ LDA #$13
7c4b : 8d 00 d6 STA $d600 
.l194:
7c4e : 2c 00 d6 BIT $d600 
7c51 : 10 fb __ BPL $7c4e ; (vdcwin_put_string.l194 + 0)
.s35:
7c53 : 8e 01 d6 STX $d601 
7c56 : a9 1f __ LDA #$1f
7c58 : 8d 00 d6 STA $d600 
.l196:
7c5b : 2c 00 d6 BIT $d600 
7c5e : 10 fb __ BPL $7c5b ; (vdcwin_put_string.l196 + 0)
.s39:
7c60 : a5 5b __ LDA T8 + 0 
7c62 : 8d 01 d6 STA $d601 
7c65 : e6 53 __ INC T0 + 0 
7c67 : 4c 71 7b JMP $7b71 ; (vdcwin_put_string.l2 + 0)
--------------------------------------------------------------------
7c6a : __ __ __ BYT 6d 4f 56 45 20 42 59 20 77 2c 61 2c 73 2c 64 20 : mOVE BY w,a,s,d 
7c7a : __ __ __ BYT 4f 52 20 43 55 52 53 4f 52 20 4b 45 59 53 2e 20 : OR CURSOR KEYS. 
7c8a : __ __ __ BYT 65 73 63 20 4f 52 20 73 74 6f 70 20 54 4f 20 45 : esc OR stop TO E
7c9a : __ __ __ BYT 58 49 54 2e 00                                  : XIT..
--------------------------------------------------------------------
7c9f : __ __ __ BYT 70 45 54 53 43 49 49 20 41 52 54 20 43 52 45 44 : pETSCII ART CRED
7caf : __ __ __ BYT 49 54 3a 20 27 6c 4f 56 45 20 49 53 20 54 48 45 : IT: 'lOVE IS THE
7cbf : __ __ __ BYT 20 44 52 55 47 27 20 61 54 4c 41 4e 54 49 53 2c :  DRUG' aTLANTIS,
7ccf : __ __ __ BYT 20 32 30 32 33 2c 20 61 52 54 20 42 59 20 6c 4f :  2023, aRT BY lO
7cdf : __ __ __ BYT 42 4f 2e 00                                     : BO..
--------------------------------------------------------------------
mul16by8: ; mul16by8
7ce3 : a0 00 __ LDY #$00
7ce5 : 84 06 __ STY WORK + 3 
7ce7 : 4a __ __ LSR
7ce8 : 90 0d __ BCC $7cf7 ; (mul16by8 + 20)
7cea : aa __ __ TAX
7ceb : 18 __ __ CLC
7cec : 98 __ __ TYA
7ced : 65 1b __ ADC ACCU + 0 
7cef : a8 __ __ TAY
7cf0 : a5 06 __ LDA WORK + 3 
7cf2 : 65 1c __ ADC ACCU + 1 
7cf4 : 85 06 __ STA WORK + 3 
7cf6 : 8a __ __ TXA
7cf7 : 06 1b __ ASL ACCU + 0 
7cf9 : 26 1c __ ROL ACCU + 1 
7cfb : 4a __ __ LSR
7cfc : b0 ec __ BCS $7cea ; (mul16by8 + 7)
7cfe : d0 f7 __ BNE $7cf7 ; (mul16by8 + 20)
7d00 : 84 05 __ STY WORK + 2 
7d02 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
7d03 : a0 00 __ LDY #$00
7d05 : 84 06 __ STY WORK + 3 
7d07 : a5 03 __ LDA WORK + 0 
7d09 : a6 04 __ LDX WORK + 1 
7d0b : f0 1c __ BEQ $7d29 ; (mul16 + 38)
7d0d : 38 __ __ SEC
7d0e : 6a __ __ ROR
7d0f : 90 0d __ BCC $7d1e ; (mul16 + 27)
7d11 : aa __ __ TAX
7d12 : 18 __ __ CLC
7d13 : 98 __ __ TYA
7d14 : 65 1b __ ADC ACCU + 0 
7d16 : a8 __ __ TAY
7d17 : a5 06 __ LDA WORK + 3 
7d19 : 65 1c __ ADC ACCU + 1 
7d1b : 85 06 __ STA WORK + 3 
7d1d : 8a __ __ TXA
7d1e : 06 1b __ ASL ACCU + 0 
7d20 : 26 1c __ ROL ACCU + 1 
7d22 : 4a __ __ LSR
7d23 : 90 f9 __ BCC $7d1e ; (mul16 + 27)
7d25 : d0 ea __ BNE $7d11 ; (mul16 + 14)
7d27 : a5 04 __ LDA WORK + 1 
7d29 : 4a __ __ LSR
7d2a : 90 0d __ BCC $7d39 ; (mul16 + 54)
7d2c : aa __ __ TAX
7d2d : 18 __ __ CLC
7d2e : 98 __ __ TYA
7d2f : 65 1b __ ADC ACCU + 0 
7d31 : a8 __ __ TAY
7d32 : a5 06 __ LDA WORK + 3 
7d34 : 65 1c __ ADC ACCU + 1 
7d36 : 85 06 __ STA WORK + 3 
7d38 : 8a __ __ TXA
7d39 : 06 1b __ ASL ACCU + 0 
7d3b : 26 1c __ ROL ACCU + 1 
7d3d : 4a __ __ LSR
7d3e : b0 ec __ BCS $7d2c ; (mul16 + 41)
7d40 : d0 f7 __ BNE $7d39 ; (mul16 + 54)
7d42 : 84 05 __ STY WORK + 2 
7d44 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
7d45 : a5 1c __ LDA ACCU + 1 
7d47 : d0 31 __ BNE $7d7a ; (divmod + 53)
7d49 : a5 04 __ LDA WORK + 1 
7d4b : d0 1e __ BNE $7d6b ; (divmod + 38)
7d4d : 85 06 __ STA WORK + 3 
7d4f : a2 04 __ LDX #$04
7d51 : 06 1b __ ASL ACCU + 0 
7d53 : 2a __ __ ROL
7d54 : c5 03 __ CMP WORK + 0 
7d56 : 90 02 __ BCC $7d5a ; (divmod + 21)
7d58 : e5 03 __ SBC WORK + 0 
7d5a : 26 1b __ ROL ACCU + 0 
7d5c : 2a __ __ ROL
7d5d : c5 03 __ CMP WORK + 0 
7d5f : 90 02 __ BCC $7d63 ; (divmod + 30)
7d61 : e5 03 __ SBC WORK + 0 
7d63 : 26 1b __ ROL ACCU + 0 
7d65 : ca __ __ DEX
7d66 : d0 eb __ BNE $7d53 ; (divmod + 14)
7d68 : 85 05 __ STA WORK + 2 
7d6a : 60 __ __ RTS
7d6b : a5 1b __ LDA ACCU + 0 
7d6d : 85 05 __ STA WORK + 2 
7d6f : a5 1c __ LDA ACCU + 1 
7d71 : 85 06 __ STA WORK + 3 
7d73 : a9 00 __ LDA #$00
7d75 : 85 1b __ STA ACCU + 0 
7d77 : 85 1c __ STA ACCU + 1 
7d79 : 60 __ __ RTS
7d7a : a5 04 __ LDA WORK + 1 
7d7c : d0 1f __ BNE $7d9d ; (divmod + 88)
7d7e : a5 03 __ LDA WORK + 0 
7d80 : 30 1b __ BMI $7d9d ; (divmod + 88)
7d82 : a9 00 __ LDA #$00
7d84 : 85 06 __ STA WORK + 3 
7d86 : a2 10 __ LDX #$10
7d88 : 06 1b __ ASL ACCU + 0 
7d8a : 26 1c __ ROL ACCU + 1 
7d8c : 2a __ __ ROL
7d8d : c5 03 __ CMP WORK + 0 
7d8f : 90 02 __ BCC $7d93 ; (divmod + 78)
7d91 : e5 03 __ SBC WORK + 0 
7d93 : 26 1b __ ROL ACCU + 0 
7d95 : 26 1c __ ROL ACCU + 1 
7d97 : ca __ __ DEX
7d98 : d0 f2 __ BNE $7d8c ; (divmod + 71)
7d9a : 85 05 __ STA WORK + 2 
7d9c : 60 __ __ RTS
7d9d : a9 00 __ LDA #$00
7d9f : 85 05 __ STA WORK + 2 
7da1 : 85 06 __ STA WORK + 3 
7da3 : 84 02 __ STY $02 
7da5 : a0 10 __ LDY #$10
7da7 : 18 __ __ CLC
7da8 : 26 1b __ ROL ACCU + 0 
7daa : 26 1c __ ROL ACCU + 1 
7dac : 26 05 __ ROL WORK + 2 
7dae : 26 06 __ ROL WORK + 3 
7db0 : 38 __ __ SEC
7db1 : a5 05 __ LDA WORK + 2 
7db3 : e5 03 __ SBC WORK + 0 
7db5 : aa __ __ TAX
7db6 : a5 06 __ LDA WORK + 3 
7db8 : e5 04 __ SBC WORK + 1 
7dba : 90 04 __ BCC $7dc0 ; (divmod + 123)
7dbc : 86 05 __ STX WORK + 2 
7dbe : 85 06 __ STA WORK + 3 
7dc0 : 88 __ __ DEY
7dc1 : d0 e5 __ BNE $7da8 ; (divmod + 99)
7dc3 : 26 1b __ ROL ACCU + 0 
7dc5 : 26 1c __ ROL ACCU + 1 
7dc7 : a4 02 __ LDY $02 
7dc9 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
7dca : 84 02 __ STY $02 
7dcc : a0 20 __ LDY #$20
7dce : a9 00 __ LDA #$00
7dd0 : 85 07 __ STA WORK + 4 
7dd2 : 85 08 __ STA WORK + 5 
7dd4 : 85 09 __ STA WORK + 6 
7dd6 : 85 0a __ STA WORK + 7 
7dd8 : a5 05 __ LDA WORK + 2 
7dda : 05 06 __ ORA WORK + 3 
7ddc : d0 39 __ BNE $7e17 ; (divmod32 + 77)
7dde : 18 __ __ CLC
7ddf : 26 1b __ ROL ACCU + 0 
7de1 : 26 1c __ ROL ACCU + 1 
7de3 : 26 1d __ ROL ACCU + 2 
7de5 : 26 1e __ ROL ACCU + 3 
7de7 : 26 07 __ ROL WORK + 4 
7de9 : 26 08 __ ROL WORK + 5 
7deb : 90 0c __ BCC $7df9 ; (divmod32 + 47)
7ded : a5 07 __ LDA WORK + 4 
7def : e5 03 __ SBC WORK + 0 
7df1 : aa __ __ TAX
7df2 : a5 08 __ LDA WORK + 5 
7df4 : e5 04 __ SBC WORK + 1 
7df6 : 38 __ __ SEC
7df7 : b0 0c __ BCS $7e05 ; (divmod32 + 59)
7df9 : 38 __ __ SEC
7dfa : a5 07 __ LDA WORK + 4 
7dfc : e5 03 __ SBC WORK + 0 
7dfe : aa __ __ TAX
7dff : a5 08 __ LDA WORK + 5 
7e01 : e5 04 __ SBC WORK + 1 
7e03 : 90 04 __ BCC $7e09 ; (divmod32 + 63)
7e05 : 86 07 __ STX WORK + 4 
7e07 : 85 08 __ STA WORK + 5 
7e09 : 88 __ __ DEY
7e0a : d0 d3 __ BNE $7ddf ; (divmod32 + 21)
7e0c : 26 1b __ ROL ACCU + 0 
7e0e : 26 1c __ ROL ACCU + 1 
7e10 : 26 1d __ ROL ACCU + 2 
7e12 : 26 1e __ ROL ACCU + 3 
7e14 : a4 02 __ LDY $02 
7e16 : 60 __ __ RTS
7e17 : 18 __ __ CLC
7e18 : 26 1b __ ROL ACCU + 0 
7e1a : 26 1c __ ROL ACCU + 1 
7e1c : 26 1d __ ROL ACCU + 2 
7e1e : 26 1e __ ROL ACCU + 3 
7e20 : 26 07 __ ROL WORK + 4 
7e22 : 26 08 __ ROL WORK + 5 
7e24 : 26 09 __ ROL WORK + 6 
7e26 : 26 0a __ ROL WORK + 7 
7e28 : a5 07 __ LDA WORK + 4 
7e2a : c5 03 __ CMP WORK + 0 
7e2c : a5 08 __ LDA WORK + 5 
7e2e : e5 04 __ SBC WORK + 1 
7e30 : a5 09 __ LDA WORK + 6 
7e32 : e5 05 __ SBC WORK + 2 
7e34 : a5 0a __ LDA WORK + 7 
7e36 : e5 06 __ SBC WORK + 3 
7e38 : 90 18 __ BCC $7e52 ; (divmod32 + 136)
7e3a : a5 07 __ LDA WORK + 4 
7e3c : e5 03 __ SBC WORK + 0 
7e3e : 85 07 __ STA WORK + 4 
7e40 : a5 08 __ LDA WORK + 5 
7e42 : e5 04 __ SBC WORK + 1 
7e44 : 85 08 __ STA WORK + 5 
7e46 : a5 09 __ LDA WORK + 6 
7e48 : e5 05 __ SBC WORK + 2 
7e4a : 85 09 __ STA WORK + 6 
7e4c : a5 0a __ LDA WORK + 7 
7e4e : e5 06 __ SBC WORK + 3 
7e50 : 85 0a __ STA WORK + 7 
7e52 : 88 __ __ DEY
7e53 : d0 c3 __ BNE $7e18 ; (divmod32 + 78)
7e55 : 26 1b __ ROL ACCU + 0 
7e57 : 26 1c __ ROL ACCU + 1 
7e59 : 26 1d __ ROL ACCU + 2 
7e5b : 26 1e __ ROL ACCU + 3 
7e5d : a4 02 __ LDY $02 
7e5f : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
7e60 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
__multab102L:
7e66 : __ __ __ BYT 00 66 cc 32 98 fe 64                            : .f.2..d
--------------------------------------------------------------------
__multab102H:
7e6d : __ __ __ BYT 00 00 00 01 01 01 02                            : .......
--------------------------------------------------------------------
__multab6L:
7e74 : __ __ __ BYT 00 06 0c 12 18                                  : .....
--------------------------------------------------------------------
__multab15L:
7e79 : __ __ __ BYT 00 0f 1e 2d 3c                                  : ...-<
--------------------------------------------------------------------
__multab9L:
7e7e : __ __ __ BYT 00 09 12 1b 24 2d                               : ....$-
--------------------------------------------------------------------
vdc_coords@proxy: ; vdc_coords@proxy
7e84 : a9 0a __ LDA #$0a
7e86 : 85 0d __ STA P0 
7e88 : a9 09 __ LDA #$09
7e8a : 85 0e __ STA P1 
7e8c : 4c ab 4f JMP $4fab ; (vdc_coords.s0 + 0)
--------------------------------------------------------------------
winStyles:
7e8f : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
7e9f : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
menubar:
7ea1 : __ __ __ BYT 73 45 54 54 49 4e 47 53 00 77 49 4e 44 4f 57 53 : sETTINGS.wINDOWS
7eb1 : __ __ __ BYT 00 00 76 49 45 57 50 4f 52 54 00 73 43 52 4f 4c : ..vIEWPORT.sCROL
7ec1 : __ __ __ BYT 4c 00 00 00 63 48 41 52 53 45 54 00 00 00 00 00 : L...cHARSET.....
7ed1 : __ __ __ BYT 00 00 01                                        : ...
--------------------------------------------------------------------
pulldown_options:
7ed4 : __ __ __ BYT 03 02 02 02 01 02 06                            : .......
--------------------------------------------------------------------
seed:
7edb : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
7edd : __ __ __ BYT 46 4c 49 45 53 00 4a 55 4d 50 53 00 53 4c 45 45 : FLIES.JUMPS.SLEE
7eed : __ __ __ BYT 50 53 45 41 54 53 00 00 57 41 4c 4b 53 00       : PSEATS..WALKS.
--------------------------------------------------------------------
vdc_modes:
7f00 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
7f10 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
7f20 : __ __ __ BYT e7 24 7e ff 50 00 32 00 00 00 00 00 10 00 40 00 : .$~.P.2.......@.
7f30 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
7f40 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
7f50 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
7f60 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
7f70 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
7f80 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
7f90 : __ __ __ BYT 50 00 32 00 00 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
7fa0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
7fb0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
7fc0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
7fd0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
pulldown_titles:
7fd8 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 00 00 00 00 00 00 : sCREENMODE......
7fe8 : __ __ __ BYT 00 69 4e 46 4f 20 20 20 20 20 20 00 00 00 00 00 : .iNFO      .....
7ff8 : __ __ __ BYT 00 00 65 58 49 54 20 20 20 20 20 20 00 00 00 00 : ..eXIT      ....
8008 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8018 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8028 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8038 : __ __ __ BYT 00 00 00 00 00 00 77 49 4e 44 4f 57 20 4f 4e 20 : ......wINDOW ON 
8048 : __ __ __ BYT 57 49 4e 44 4f 57 00 74 45 58 54 20 45 4e 54 52 : WINDOW.tEXT ENTR
8058 : __ __ __ BYT 59 20 20 20 20 20 20 00 00 00 00 00 00 00 00 00 : Y      .........
8068 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8078 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8088 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8098 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 73 43 52 45 : ............sCRE
80a8 : __ __ __ BYT 45 4e 20 31 00 00 00 00 00 00 00 00 00 73 43 52 : EN 1.........sCR
80b8 : __ __ __ BYT 45 45 4e 20 32 00 00 00 00 00 00 00 00 00 00 00 : EEN 2...........
80c8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
80d8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
80e8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
80f8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8108 : __ __ __ BYT 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 31 00 00 : ..fULLSCREEN 1..
8118 : __ __ __ BYT 00 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 32 00 : ...fULLSCREEN 2.
8128 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8138 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8148 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8158 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8168 : __ __ __ BYT 00 00 00 00 00 00 00 00 63 48 41 52 53 45 54 20 : ........cHARSET 
8178 : __ __ __ BYT 44 45 4d 4f 00 00 00 00 00 00 00 00 00 00 00 00 : DEMO............
8188 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8198 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
81a8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
81b8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
81c8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 79 45 : ..............yE
81d8 : __ __ __ BYT 53 00 00 00 00 00 00 00 00 00 00 00 00 00 00 6e : S..............n
81e8 : __ __ __ BYT 4f 20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : O ..............
81f8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8208 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8218 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8228 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8238 : __ __ __ BYT 00 00 00 00 70 61 6c 20 20 38 30 58 32 35 00 00 : ....pal  80X25..
8248 : __ __ __ BYT 00 00 00 00 00 70 61 6c 20 20 38 30 58 35 30 00 : .....pal  80X50.
8258 : __ __ __ BYT 00 00 00 00 00 00 70 61 6c 20 20 38 30 58 37 30 : ......pal  80X70
8268 : __ __ __ BYT 00 00 00 00 00 00 00 6e 74 73 63 20 38 30 58 32 : .......ntsc 80X2
8278 : __ __ __ BYT 35 00 00 00 00 00 00 00 6e 74 73 63 20 38 30 58 : 5.......ntsc 80X
8288 : __ __ __ BYT 35 30 00 00 00 00 00 00 00 6e 74 73 63 20 38 30 : 50.......ntsc 80
8298 : __ __ __ BYT 58 37 30 00 00 00 00 00 00 00                   : X70.......
--------------------------------------------------------------------
82a2 : __ __ __ BYT 42 4c 55 45 20 4a 41 59 00 00 00 00 00 00 00 43 : BLUE JAY.......C
82b2 : __ __ __ BYT 41 52 44 49 4e 41 4c 00 00 00 00 00 00 00 45 41 : ARDINAL.......EA
82c2 : __ __ __ BYT 53 54 45 52 4e 20 50 48 4f 45 42 45 00 47 52 41 : STERN PHOEBE.GRA
82d2 : __ __ __ BYT 43 4b 4c 45 00 00 00 00 00 00 00 00 53 41 4e 44 : CKLE........SAND
82e2 : __ __ __ BYT 48 49 4c 4c 20 43 52 41 4e 45 00                : HILL CRANE.
--------------------------------------------------------------------
p2smap:
82ed : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
screenset:
82f5 : __ __ __ BYT 00 40 50 96 00 a0 a0 4b                         : .@P....K
--------------------------------------------------------------------
8300 : __ __ __ BYT 42 49 47 00 00 00 53 4d 41 4c 4c 00 41 4e 47 52 : BIG...SMALL.ANGR
8310 : __ __ __ BYT 59 00 57 45 54 00 00 00 48 41 50 50 59 00       : Y.WET...HAPPY.
--------------------------------------------------------------------
winCfg:
831e : __ __ __ BSS	8
--------------------------------------------------------------------
vdc_state:
8326 : __ __ __ BSS	25
--------------------------------------------------------------------
multab:
833f : __ __ __ BSS	144
--------------------------------------------------------------------
krnio_pstatus:
83cf : __ __ __ BSS	16
--------------------------------------------------------------------
linebuffer:
8400 : __ __ __ BSS	81
--------------------------------------------------------------------
windows:
8451 : __ __ __ BSS	39
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
01:1380 : ad ff 6e LDA $6eff ; (bootdevice + 0)
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
01:1391 : 20 50 58 JSR $5850 ; (krnio_setbnk.s0 + 0)
01:1394 : a5 12 __ LDA P5 ; (fname + 0)
01:1396 : 85 0d __ STA P0 
01:1398 : a5 13 __ LDA P6 ; (fname + 1)
01:139a : 85 0e __ STA P1 
01:139c : 20 57 58 JSR $5857 ; (krnio_setnam.s0 + 0)
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
01:13be : a9 00 __ LDA #$00
01:13c0 : 85 0e __ STA P1 
01:13c2 : a9 84 __ LDA #$84
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
01:1447 : a9 00 __ LDA #$00
01:1449 : 85 10 __ STA P3 
01:144b : a9 84 __ LDA #$84
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
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:14ba : a9 0e __ LDA #$0e
01:14bc : 85 0d __ STA P0 
01:14be : a9 00 __ LDA #$00
01:14c0 : 85 0e __ STA P1 
01:14c2 : a9 84 __ LDA #$84
01:14c4 : 85 0f __ STA P2 
01:14c6 : a9 00 __ LDA #$00
01:14c8 : 85 13 __ STA P6 
01:14ca : 4c ce 13 JMP $13ce ; (bnk_cpyfromvdc.s0 + 0)
