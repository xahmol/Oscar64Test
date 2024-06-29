; Compiled with 1.29.247
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
1c13 : 8e fe 28 STX $28fe ; (spentry + 0)
1c16 : a9 c3 __ LDA #$c3
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 6e __ LDA #$6e
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 6f __ LDA #$6f
1c21 : e9 6e __ SBC #$6e
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
1c35 : a9 90 __ LDA #$90
1c37 : e9 c3 __ SBC #$c3
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
1c50 : a9 14 __ LDA #$14
1c52 : 85 23 __ STA SP + 0 
1c54 : a9 be __ LDA #$be
1c56 : 85 24 __ STA SP + 1 
1c58 : 20 80 1c JSR $1c80 ; (main.s1000 + 0)
1c5b : a9 4c __ LDA #$4c
1c5d : 85 54 __ STA $54 
1c5f : a9 00 __ LDA #$00
1c61 : 85 13 __ STA P6 
1c63 : 85 1a __ STA IP + 1 
1c65 : a9 1b __ LDA #$1b
1c67 : 85 18 __ STA P11 
1c69 : a9 19 __ LDA #$19
1c6b : 85 16 __ STA P9 
1c6d : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
.s1000:
1c80 : a5 53 __ LDA T0 + 0 
1c82 : 8d 16 be STA $be16 ; (main@stack + 0)
1c85 : a5 54 __ LDA T1 + 0 
1c87 : 8d 17 be STA $be17 ; (main@stack + 1)
1c8a : a5 55 __ LDA T3 + 0 
1c8c : 8d 18 be STA $be18 ; (main@stack + 2)
1c8f : 38 __ __ SEC
1c90 : a5 23 __ LDA SP + 0 
1c92 : e9 0a __ SBC #$0a
1c94 : 85 23 __ STA SP + 0 
1c96 : b0 02 __ BCS $1c9a ; (main.s0 + 0)
1c98 : c6 24 __ DEC SP + 1 
.s0:
1c9a : a9 7f __ LDA #$7f
1c9c : 8d 0d dc STA $dc0d 
1c9f : 8d 0d dd STA $dd0d 
1ca2 : 8d 00 dc STA $dc00 
1ca5 : 8d 44 6d STA $6d44 ; (winCfg + 0)
1ca8 : a9 08 __ LDA #$08
1caa : 8d 0e dc STA $dc0e 
1cad : 8d 0f dc STA $dc0f 
1cb0 : 8d 0e dd STA $dd0e 
1cb3 : 8d 0f dd STA $dd0f 
1cb6 : a9 00 __ LDA #$00
1cb8 : 8d 03 dc STA $dc03 
1cbb : 8d 03 dd STA $dd03 
1cbe : 8d 47 6d STA $6d47 ; (winCfg + 3)
1cc1 : 8d 49 6d STA $6d49 ; (winCfg + 5)
1cc4 : 8d 45 6d STA $6d45 ; (winCfg + 1)
1cc7 : 8d 4a 6d STA $6d4a ; (winCfg + 6)
1cca : a9 ff __ LDA #$ff
1ccc : 8d 02 dc STA $dc02 
1ccf : a9 07 __ LDA #$07
1cd1 : 8d 01 dd STA $dd01 
1cd4 : a9 3f __ LDA #$3f
1cd6 : 8d 02 dd STA $dd02 
1cd9 : a9 a8 __ LDA #$a8
1cdb : 8d 46 6d STA $6d46 ; (winCfg + 2)
1cde : 8d 4b 6d STA $6d4b ; (winCfg + 7)
1ce1 : a9 20 __ LDA #$20
1ce3 : 8d 48 6d STA $6d48 ; (winCfg + 4)
1ce6 : 20 f3 1f JSR $1ff3 ; (bnk_init.s1000 + 0)
1ce9 : 20 74 28 JSR $2874 ; (krill_loadcode.s1000 + 0)
1cec : 20 28 29 JSR $2928 ; (vdc_init.s1000 + 0)
1cef : 20 5b 13 JSR $135b ; (krill_init.s1000 + 0)
1cf2 : a9 00 __ LDA #$00
1cf4 : 85 0f __ STA P2 
1cf6 : 85 10 __ STA P3 
1cf8 : ad 63 6d LDA $6d63 ; (vdc_state + 7)
1cfb : 85 54 __ STA T1 + 0 
1cfd : 85 13 __ STA P6 
1cff : a9 d2 __ LDA #$d2
1d01 : 85 11 __ STA P4 
1d03 : a9 2e __ LDA #$2e
1d05 : 85 12 __ STA P5 
1d07 : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
1d0a : a9 75 __ LDA #$75
1d0c : a0 02 __ LDY #$02
1d0e : 91 23 __ STA (SP + 0),y 
1d10 : a9 6d __ LDA #$6d
1d12 : c8 __ __ INY
1d13 : 91 23 __ STA (SP + 0),y 
1d15 : a9 27 __ LDA #$27
1d17 : c8 __ __ INY
1d18 : 91 23 __ STA (SP + 0),y 
1d1a : a9 30 __ LDA #$30
1d1c : c8 __ __ INY
1d1d : 91 23 __ STA (SP + 0),y 
1d1f : ad 5c 6d LDA $6d5c ; (vdc_state + 0)
1d22 : c8 __ __ INY
1d23 : 91 23 __ STA (SP + 0),y 
1d25 : a9 00 __ LDA #$00
1d27 : c8 __ __ INY
1d28 : 91 23 __ STA (SP + 0),y 
1d2a : ad 5d 6d LDA $6d5d ; (vdc_state + 1)
1d2d : d0 07 __ BNE $1d36 ; (main.s69 + 0)
.s70:
1d2f : a9 30 __ LDA #$30
1d31 : a2 5f __ LDX #$5f
1d33 : 4c 3a 1d JMP $1d3a ; (main.s71 + 0)
.s69:
1d36 : a9 30 __ LDA #$30
1d38 : a2 5c __ LDX #$5c
.s71:
1d3a : a0 09 __ LDY #$09
1d3c : 91 23 __ STA (SP + 0),y 
1d3e : 8a __ __ TXA
1d3f : 88 __ __ DEY
1d40 : 91 23 __ STA (SP + 0),y 
1d42 : 20 f9 2f JSR $2ff9 ; (sprintf.s0 + 0)
1d45 : a9 02 __ LDA #$02
1d47 : 85 10 __ STA P3 
1d49 : 20 b9 67 JSR $67b9 ; (vdc_prints_attr@proxy + 0)
1d4c : a9 04 __ LDA #$04
1d4e : 85 10 __ STA P3 
1d50 : a9 30 __ LDA #$30
1d52 : 85 12 __ STA P5 
1d54 : a9 63 __ LDA #$63
1d56 : 85 11 __ STA P4 
1d58 : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
1d5b : e6 10 __ INC P3 
1d5d : a9 73 __ LDA #$73
1d5f : 85 11 __ STA P4 
1d61 : a9 30 __ LDA #$30
1d63 : 85 12 __ STA P5 
1d65 : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
1d68 : a9 30 __ LDA #$30
1d6a : 85 14 __ STA P7 
1d6c : a9 40 __ LDA #$40
1d6e : 85 12 __ STA P5 
1d70 : a9 c3 __ LDA #$c3
1d72 : 85 13 __ STA P6 
1d74 : 20 7f 67 JSR $677f ; (krill_load@proxy + 0)
1d77 : aa __ __ TAX
1d78 : a9 01 __ LDA #$01
1d7a : 85 55 __ STA T3 + 0 
1d7c : 8a __ __ TXA
1d7d : f0 06 __ BEQ $1d85 ; (main.s10 + 0)
.s8:
1d7f : 20 cb 30 JSR $30cb ; (menu_fileerrormessage.s1000 + 0)
1d82 : 20 4c 28 JSR $284c ; (exit@proxy + 0)
.s10:
1d85 : a9 00 __ LDA #$00
1d87 : 85 0f __ STA P2 
1d89 : a9 06 __ LDA #$06
1d8b : 85 10 __ STA P3 
1d8d : a9 91 __ LDA #$91
1d8f : 85 11 __ STA P4 
1d91 : a9 37 __ LDA #$37
1d93 : 85 12 __ STA P5 
1d95 : 20 d7 67 JSR $67d7 ; (vdc_prints_attr@proxy + 0)
1d98 : a9 37 __ LDA #$37
1d9a : 85 14 __ STA P7 
1d9c : a9 bd __ LDA #$bd
1d9e : 85 13 __ STA P6 
1da0 : 20 92 30 JSR $3092 ; (krill_load@proxy + 0)
1da3 : 09 00 __ ORA #$00
1da5 : f0 06 __ BEQ $1dad ; (main.l40 + 0)
.s12:
1da7 : 20 cb 30 JSR $30cb ; (menu_fileerrormessage.s1000 + 0)
1daa : 20 4c 28 JSR $284c ; (exit@proxy + 0)
.l40:
1dad : 20 f1 14 JSR $14f1 ; (sid_startmusic.s0 + 0)
.l15:
1db0 : 20 c4 37 JSR $37c4 ; (menu_placetop.s0 + 0)
1db3 : a9 00 __ LDA #$00
1db5 : 8d 1d be STA $be1d ; (vp_logo + 1)
1db8 : 8d 20 be STA $be20 ; (vp_logo + 4)
1dbb : 8d 22 be STA $be22 ; (vp_logo + 6)
1dbe : 8d 23 be STA $be23 ; (vp_logo + 7)
1dc1 : 8d 24 be STA $be24 ; (vp_logo + 8)
1dc4 : 8d 25 be STA $be25 ; (vp_logo + 9)
1dc7 : 8d 26 be STA $be26 ; (vp_logo + 10)
1dca : a9 7f __ LDA #$7f
1dcc : 8d 1c be STA $be1c ; (vp_logo + 0)
1dcf : a9 a0 __ LDA #$a0
1dd1 : 8d 1f be STA $be1f ; (vp_logo + 3)
1dd4 : ad 62 6d LDA $6d62 ; (vdc_state + 6)
1dd7 : 4a __ __ LSR
1dd8 : a9 4b __ LDA #$4b
1dda : 8d 21 be STA $be21 ; (vp_logo + 5)
1ddd : a9 10 __ LDA #$10
1ddf : 85 0f __ STA P2 
1de1 : a9 30 __ LDA #$30
1de3 : 85 11 __ STA P4 
1de5 : a9 0c __ LDA #$0c
1de7 : 85 12 __ STA P5 
1de9 : a9 40 __ LDA #$40
1deb : 8d 1e be STA $be1e ; (vp_logo + 2)
1dee : a9 27 __ LDA #$27
1df0 : 85 0d __ STA P0 
1df2 : a9 be __ LDA #$be
1df4 : 85 0e __ STA P1 
1df6 : ad 61 6d LDA $6d61 ; (vdc_state + 5)
1df9 : 85 53 __ STA T0 + 0 
1dfb : 6a __ __ ROR
1dfc : 38 __ __ SEC
1dfd : e9 06 __ SBC #$06
1dff : 85 10 __ STA P3 
1e01 : 20 15 33 JSR $3315 ; (vdcwin_init.s0 + 0)
1e04 : a9 00 __ LDA #$00
1e06 : 8d 24 be STA $be24 ; (vp_logo + 8)
1e09 : 8d 26 be STA $be26 ; (vp_logo + 10)
1e0c : a9 10 __ LDA #$10
1e0e : 8d 23 be STA $be23 ; (vp_logo + 7)
1e11 : a9 75 __ LDA #$75
1e13 : a0 02 __ LDY #$02
1e15 : 91 23 __ STA (SP + 0),y 
1e17 : a9 6d __ LDA #$6d
1e19 : c8 __ __ INY
1e1a : 91 23 __ STA (SP + 0),y 
1e1c : a9 27 __ LDA #$27
1e1e : c8 __ __ INY
1e1f : 91 23 __ STA (SP + 0),y 
1e21 : a9 30 __ LDA #$30
1e23 : c8 __ __ INY
1e24 : 91 23 __ STA (SP + 0),y 
1e26 : ad 5c 6d LDA $6d5c ; (vdc_state + 0)
1e29 : c8 __ __ INY
1e2a : 8c 25 be STY $be25 ; (vp_logo + 9)
1e2d : 91 23 __ STA (SP + 0),y 
1e2f : a9 00 __ LDA #$00
1e31 : c8 __ __ INY
1e32 : 91 23 __ STA (SP + 0),y 
1e34 : ad 5d 6d LDA $6d5d ; (vdc_state + 1)
1e37 : d0 07 __ BNE $1e40 ; (main.s72 + 0)
.s73:
1e39 : a9 30 __ LDA #$30
1e3b : a2 5f __ LDX #$5f
1e3d : 4c 44 1e JMP $1e44 ; (main.s74 + 0)
.s72:
1e40 : a9 30 __ LDA #$30
1e42 : a2 5c __ LDX #$5c
.s74:
1e44 : a0 09 __ LDY #$09
1e46 : 91 23 __ STA (SP + 0),y 
1e48 : 8a __ __ TXA
1e49 : 88 __ __ DEY
1e4a : 91 23 __ STA (SP + 0),y 
1e4c : 20 f9 2f JSR $2ff9 ; (sprintf.s0 + 0)
1e4f : ad 63 6d LDA $6d63 ; (vdc_state + 7)
1e52 : 85 54 __ STA T1 + 0 
1e54 : 85 13 __ STA P6 
1e56 : a9 75 __ LDA #$75
1e58 : 85 11 __ STA P4 
1e5a : a9 6d __ LDA #$6d
1e5c : 85 12 __ STA P5 
1e5e : 20 cc 67 JSR $67cc ; (vdc_prints_attr@proxy + 0)
1e61 : a9 75 __ LDA #$75
1e63 : a0 02 __ LDY #$02
1e65 : 91 23 __ STA (SP + 0),y 
1e67 : a9 6d __ LDA #$6d
1e69 : c8 __ __ INY
1e6a : 91 23 __ STA (SP + 0),y 
1e6c : a9 81 __ LDA #$81
1e6e : c8 __ __ INY
1e6f : 91 23 __ STA (SP + 0),y 
1e71 : a9 38 __ LDA #$38
1e73 : c8 __ __ INY
1e74 : 91 23 __ STA (SP + 0),y 
1e76 : ad 5e 6d LDA $6d5e ; (vdc_state + 2)
1e79 : 85 1b __ STA ACCU + 0 
1e7b : a9 00 __ LDA #$00
1e7d : 85 1c __ STA ACCU + 1 
1e7f : a9 11 __ LDA #$11
1e81 : 20 3e 64 JSR $643e ; (mul16by8 + 0)
1e84 : 18 __ __ CLC
1e85 : a9 a2 __ LDA #$a2
1e87 : 65 05 __ ADC WORK + 2 
1e89 : a0 06 __ LDY #$06
1e8b : 91 23 __ STA (SP + 0),y 
1e8d : a9 6c __ LDA #$6c
1e8f : 69 00 __ ADC #$00
1e91 : c8 __ __ INY
1e92 : 91 23 __ STA (SP + 0),y 
1e94 : 20 f9 2f JSR $2ff9 ; (sprintf.s0 + 0)
1e97 : a9 04 __ LDA #$04
1e99 : 85 10 __ STA P3 
1e9b : 20 b9 67 JSR $67b9 ; (vdc_prints_attr@proxy + 0)
1e9e : 38 __ __ SEC
1e9f : a5 53 __ LDA T0 + 0 
1ea1 : e9 04 __ SBC #$04
1ea3 : 85 10 __ STA P3 
1ea5 : a9 90 __ LDA #$90
1ea7 : 85 11 __ STA P4 
1ea9 : a9 38 __ LDA #$38
1eab : 85 12 __ STA P5 
1ead : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
1eb0 : e6 10 __ INC P3 
1eb2 : a9 00 __ LDA #$00
1eb4 : 85 11 __ STA P4 
1eb6 : a9 39 __ LDA #$39
1eb8 : 85 12 __ STA P5 
1eba : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
1ebd : e6 10 __ INC P3 
1ebf : a9 ca __ LDA #$ca
1ec1 : 85 11 __ STA P4 
1ec3 : a9 38 __ LDA #$38
1ec5 : 85 12 __ STA P5 
1ec7 : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
1eca : a9 1c __ LDA #$1c
1ecc : 85 16 __ STA P9 
1ece : a9 be __ LDA #$be
1ed0 : 85 17 __ STA P10 
1ed2 : 20 44 39 JSR $3944 ; (vdcwin_cpy_viewport.s0 + 0)
1ed5 : 20 8f 3a JSR $3a8f ; (menu_main.s1000 + 0)
1ed8 : a5 1b __ LDA ACCU + 0 
1eda : 85 54 __ STA T1 + 0 
1edc : c9 29 __ CMP #$29
1ede : b0 03 __ BCS $1ee3 ; (main.s44 + 0)
1ee0 : 4c af 1f JMP $1faf ; (main.s46 + 0)
.s44:
1ee3 : c9 2b __ CMP #$2b
1ee5 : b0 0c __ BCS $1ef3 ; (main.s45 + 0)
.s29:
1ee7 : 38 __ __ SEC
1ee8 : e9 29 __ SBC #$29
1eea : 8d ff bf STA $bfff ; (sstack + 8)
1eed : 20 d8 59 JSR $59d8 ; (scroll_fullscreen_smooth.s1000 + 0)
1ef0 : 4c 4c 1f JMP $1f4c ; (main.s23 + 0)
.s45:
1ef3 : c9 3d __ CMP #$3d
1ef5 : b0 03 __ BCS $1efa ; (main.s55 + 0)
1ef7 : 4c 9b 1f JMP $1f9b ; (main.s57 + 0)
.s55:
1efa : c9 3f __ CMP #$3f
1efc : 90 03 __ BCC $1f01 ; (main.s32 + 0)
1efe : 4c 8c 1f JMP $1f8c ; (main.s56 + 0)
.s32:
1f01 : 38 __ __ SEC
1f02 : e9 3c __ SBC #$3c
1f04 : 85 53 __ STA T0 + 0 
1f06 : 90 06 __ BCC $1f0e ; (main.s33 + 0)
.s1008:
1f08 : a5 55 __ LDA T3 + 0 
1f0a : c5 53 __ CMP T0 + 0 
1f0c : f0 3e __ BEQ $1f4c ; (main.s23 + 0)
.s33:
1f0e : 20 6d 15 JSR $156d ; (sid_stopmusic.s0 + 0)
1f11 : a9 75 __ LDA #$75
1f13 : a0 02 __ LDY #$02
1f15 : 91 23 __ STA (SP + 0),y 
1f17 : a9 6d __ LDA #$6d
1f19 : c8 __ __ INY
1f1a : 91 23 __ STA (SP + 0),y 
1f1c : a9 eb __ LDA #$eb
1f1e : c8 __ __ INY
1f1f : 91 23 __ STA (SP + 0),y 
1f21 : a9 60 __ LDA #$60
1f23 : c8 __ __ INY
1f24 : 91 23 __ STA (SP + 0),y 
1f26 : a5 53 __ LDA T0 + 0 
1f28 : c8 __ __ INY
1f29 : 91 23 __ STA (SP + 0),y 
1f2b : a9 00 __ LDA #$00
1f2d : c8 __ __ INY
1f2e : 91 23 __ STA (SP + 0),y 
1f30 : 20 f9 2f JSR $2ff9 ; (sprintf.s0 + 0)
1f33 : a9 6d __ LDA #$6d
1f35 : 85 14 __ STA P7 
1f37 : a9 75 __ LDA #$75
1f39 : 85 13 __ STA P6 
1f3b : 20 92 30 JSR $3092 ; (krill_load@proxy + 0)
1f3e : 09 00 __ ORA #$00
1f40 : f0 03 __ BEQ $1f45 ; (main.s93 + 0)
.s36:
1f42 : 20 cb 30 JSR $30cb ; (menu_fileerrormessage.s1000 + 0)
.s93:
1f45 : a5 53 __ LDA T0 + 0 
1f47 : 85 55 __ STA T3 + 0 
1f49 : 20 f1 14 JSR $14f1 ; (sid_startmusic.s0 + 0)
.s23:
1f4c : a5 54 __ LDA T1 + 0 
1f4e : c9 0d __ CMP #$0d
1f50 : f0 03 __ BEQ $1f55 ; (main.s16 + 0)
1f52 : 4c b0 1d JMP $1db0 ; (main.l15 + 0)
.s16:
1f55 : 20 6d 15 JSR $156d ; (sid_stopmusic.s0 + 0)
1f58 : a9 00 __ LDA #$00
1f5a : 20 e2 2b JSR $2be2 ; (fastmode.s0 + 0)
1f5d : 20 01 2c JSR $2c01 ; (vdc_set_mode@proxy + 0)
1f60 : 20 65 2a JSR $2a65 ; (vdc_cls.s0 + 0)
1f63 : a9 04 __ LDA #$04
1f65 : 8d 06 d5 STA $d506 
1f68 : 20 b0 15 JSR $15b0 ; (krill_done.s0 + 0)
1f6b : a9 00 __ LDA #$00
1f6d : 85 1b __ STA ACCU + 0 
1f6f : 85 1c __ STA ACCU + 1 
.s1001:
1f71 : 18 __ __ CLC
1f72 : a5 23 __ LDA SP + 0 
1f74 : 69 0a __ ADC #$0a
1f76 : 85 23 __ STA SP + 0 
1f78 : 90 02 __ BCC $1f7c ; (main.s1001 + 11)
1f7a : e6 24 __ INC SP + 1 
1f7c : ad 16 be LDA $be16 ; (main@stack + 0)
1f7f : 85 53 __ STA T0 + 0 
1f81 : ad 17 be LDA $be17 ; (main@stack + 1)
1f84 : 85 54 __ STA T1 + 0 
1f86 : ad 18 be LDA $be18 ; (main@stack + 2)
1f89 : 85 55 __ STA T3 + 0 
1f8b : 60 __ __ RTS
.s56:
1f8c : d0 06 __ BNE $1f94 ; (main.s60 + 0)
.s39:
1f8e : 20 6d 15 JSR $156d ; (sid_stopmusic.s0 + 0)
1f91 : 4c b0 1d JMP $1db0 ; (main.l15 + 0)
.s60:
1f94 : c9 40 __ CMP #$40
1f96 : d0 b4 __ BNE $1f4c ; (main.s23 + 0)
1f98 : 4c ad 1d JMP $1dad ; (main.l40 + 0)
.s57:
1f9b : c9 2b __ CMP #$2b
1f9d : d0 06 __ BNE $1fa5 ; (main.s58 + 0)
.s30:
1f9f : 20 e3 5f JSR $5fe3 ; (scroll_bigfont.s1000 + 0)
1fa2 : 4c b0 1d JMP $1db0 ; (main.l15 + 0)
.s58:
1fa5 : c9 33 __ CMP #$33
1fa7 : d0 a3 __ BNE $1f4c ; (main.s23 + 0)
.s31:
1fa9 : 20 20 63 JSR $6320 ; (charset_demo.s1000 + 0)
1fac : 4c b0 1d JMP $1db0 ; (main.l15 + 0)
.s46:
1faf : c9 15 __ CMP #$15
1fb1 : d0 06 __ BNE $1fb9 ; (main.s47 + 0)
.s26:
1fb3 : 20 8d 40 JSR $408d ; (windows_windowstacking.s1000 + 0)
1fb6 : 4c b0 1d JMP $1db0 ; (main.l15 + 0)
.s47:
1fb9 : 90 21 __ BCC $1fdc ; (main.s49 + 0)
.s48:
1fbb : c9 16 __ CMP #$16
1fbd : d0 06 __ BNE $1fc5 ; (main.s52 + 0)
.s27:
1fbf : 20 00 49 JSR $4900 ; (windows_textinput.s1000 + 0)
1fc2 : 4c b0 1d JMP $1db0 ; (main.l15 + 0)
.s52:
1fc5 : c9 1f __ CMP #$1f
1fc7 : 90 83 __ BCC $1f4c ; (main.s23 + 0)
.s54:
1fc9 : c9 21 __ CMP #$21
1fcb : 90 03 __ BCC $1fd0 ; (main.s28 + 0)
1fcd : 4c 4c 1f JMP $1f4c ; (main.s23 + 0)
.s28:
1fd0 : 38 __ __ SEC
1fd1 : e9 1f __ SBC #$1f
1fd3 : 8d ff bf STA $bfff ; (sstack + 8)
1fd6 : 20 a3 52 JSR $52a3 ; (viewport_demo.s1000 + 0)
1fd9 : 4c b0 1d JMP $1db0 ; (main.l15 + 0)
.s49:
1fdc : c9 0b __ CMP #$0b
1fde : d0 06 __ BNE $1fe6 ; (main.s50 + 0)
.s24:
1fe0 : 20 06 3e JSR $3e06 ; (settings_screenmode.s1000 + 0)
1fe3 : 4c b0 1d JMP $1db0 ; (main.l15 + 0)
.s50:
1fe6 : c9 0c __ CMP #$0c
1fe8 : f0 03 __ BEQ $1fed ; (main.s25 + 0)
1fea : 4c 4c 1f JMP $1f4c ; (main.s23 + 0)
.s25:
1fed : 20 83 3e JSR $3e83 ; (settings_versioninfo.s1000 + 0)
1ff0 : 4c b0 1d JMP $1db0 ; (main.l15 + 0)
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
1ff3 : 38 __ __ SEC
1ff4 : a5 23 __ LDA SP + 0 
1ff6 : e9 06 __ SBC #$06
1ff8 : 85 23 __ STA SP + 0 
1ffa : b0 02 __ BCS $1ffe ; (bnk_init.s0 + 0)
1ffc : c6 24 __ DEC SP + 1 
.s0:
1ffe : a9 3c __ LDA #$3c
2000 : a0 02 __ LDY #$02
2002 : 91 23 __ STA (SP + 0),y 
2004 : a9 27 __ LDA #$27
2006 : c8 __ __ INY
2007 : 91 23 __ STA (SP + 0),y 
2009 : a5 ba __ LDA $ba 
200b : d0 02 __ BNE $200f ; (bnk_init.s1002 + 0)
.s2:
200d : a9 08 __ LDA #$08
.s1002:
200f : 8d ff 4a STA $4aff ; (bootdevice + 0)
2012 : a0 04 __ LDY #$04
2014 : 91 23 __ STA (SP + 0),y 
2016 : a9 00 __ LDA #$00
2018 : c8 __ __ INY
2019 : 91 23 __ STA (SP + 0),y 
201b : 20 4a 20 JSR $204a ; (printf.s0 + 0)
201e : a9 06 __ LDA #$06
2020 : 8d 06 d5 STA $d506 
2023 : a9 4c __ LDA #$4c
2025 : a0 02 __ LDY #$02
2027 : 91 23 __ STA (SP + 0),y 
2029 : a9 27 __ LDA #$27
202b : c8 __ __ INY
202c : 91 23 __ STA (SP + 0),y 
202e : 20 4a 20 JSR $204a ; (printf.s0 + 0)
2031 : a9 69 __ LDA #$69
2033 : 8d fc bf STA $bffc ; (sstack + 5)
2036 : a9 28 __ LDA #$28
2038 : 8d fd bf STA $bffd ; (sstack + 6)
203b : 20 66 27 JSR $2766 ; (load_overlay.s1000 + 0)
.s1001:
203e : 18 __ __ CLC
203f : a5 23 __ LDA SP + 0 
2041 : 69 06 __ ADC #$06
2043 : 85 23 __ STA SP + 0 
2045 : 90 02 __ BCC $2049 ; (bnk_init.s1001 + 11)
2047 : e6 24 __ INC SP + 1 
2049 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
204a : a9 01 __ LDA #$01
204c : 8d fb bf STA $bffb ; (sstack + 4)
204f : a9 ad __ LDA #$ad
2051 : 85 16 __ STA P9 
2053 : a9 bf __ LDA #$bf
2055 : 85 17 __ STA P10 
2057 : a0 02 __ LDY #$02
2059 : b1 23 __ LDA (SP + 0),y 
205b : 8d f7 bf STA $bff7 ; (sstack + 0)
205e : c8 __ __ INY
205f : b1 23 __ LDA (SP + 0),y 
2061 : 8d f8 bf STA $bff8 ; (sstack + 1)
2064 : 18 __ __ CLC
2065 : a5 23 __ LDA SP + 0 
2067 : 69 04 __ ADC #$04
2069 : 8d f9 bf STA $bff9 ; (sstack + 2)
206c : a5 24 __ LDA SP + 1 
206e : 69 00 __ ADC #$00
2070 : 8d fa bf STA $bffa ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s0:
2073 : ad f7 bf LDA $bff7 ; (sstack + 0)
2076 : 85 49 __ STA T1 + 0 
2078 : a9 00 __ LDA #$00
207a : 85 47 __ STA T0 + 0 
207c : ad f8 bf LDA $bff8 ; (sstack + 1)
207f : 85 4a __ STA T1 + 1 
.l1:
2081 : a0 00 __ LDY #$00
2083 : b1 49 __ LDA (T1 + 0),y 
2085 : d0 2d __ BNE $20b4 ; (sformat.s2 + 0)
.s3:
2087 : a4 47 __ LDY T0 + 0 
2089 : 91 16 __ STA (P9),y ; (buff + 0)
208b : 98 __ __ TYA
208c : f0 1d __ BEQ $20ab ; (sformat.s1070 + 0)
.s116:
208e : ad fb bf LDA $bffb ; (sstack + 4)
2091 : d0 0d __ BNE $20a0 ; (sformat.s119 + 0)
.s120:
2093 : 18 __ __ CLC
2094 : a5 16 __ LDA P9 ; (buff + 0)
2096 : 65 47 __ ADC T0 + 0 
2098 : aa __ __ TAX
2099 : a5 17 __ LDA P10 ; (buff + 1)
209b : 69 00 __ ADC #$00
209d : 4c af 20 JMP $20af ; (sformat.s1001 + 0)
.s119:
20a0 : a5 16 __ LDA P9 ; (buff + 0)
20a2 : 85 0d __ STA P0 
20a4 : a5 17 __ LDA P10 ; (buff + 1)
20a6 : 85 0e __ STA P1 
20a8 : 20 39 24 JSR $2439 ; (puts.s0 + 0)
.s1070:
20ab : a5 17 __ LDA P10 ; (buff + 1)
20ad : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
20af : 86 1b __ STX ACCU + 0 ; (fps + 0)
20b1 : 85 1c __ STA ACCU + 1 ; (fps + 1)
20b3 : 60 __ __ RTS
.s2:
20b4 : c9 25 __ CMP #$25
20b6 : f0 3e __ BEQ $20f6 ; (sformat.s4 + 0)
.s5:
20b8 : a4 47 __ LDY T0 + 0 
20ba : 91 16 __ STA (P9),y ; (buff + 0)
20bc : e6 49 __ INC T1 + 0 
20be : d0 02 __ BNE $20c2 ; (sformat.s1098 + 0)
.s1097:
20c0 : e6 4a __ INC T1 + 1 
.s1098:
20c2 : c8 __ __ INY
20c3 : 84 47 __ STY T0 + 0 
20c5 : 98 __ __ TYA
20c6 : c0 28 __ CPY #$28
20c8 : 90 b7 __ BCC $2081 ; (sformat.l1 + 0)
.s110:
20ca : 85 4c __ STA T5 + 0 
20cc : a9 00 __ LDA #$00
20ce : 85 47 __ STA T0 + 0 
20d0 : ad fb bf LDA $bffb ; (sstack + 4)
20d3 : f0 14 __ BEQ $20e9 ; (sformat.s114 + 0)
.s113:
20d5 : a5 16 __ LDA P9 ; (buff + 0)
20d7 : 85 0d __ STA P0 
20d9 : a5 17 __ LDA P10 ; (buff + 1)
20db : 85 0e __ STA P1 
20dd : a9 00 __ LDA #$00
20df : a4 4c __ LDY T5 + 0 
20e1 : 91 16 __ STA (P9),y ; (buff + 0)
20e3 : 20 39 24 JSR $2439 ; (puts.s0 + 0)
20e6 : 4c 81 20 JMP $2081 ; (sformat.l1 + 0)
.s114:
20e9 : 18 __ __ CLC
20ea : a5 16 __ LDA P9 ; (buff + 0)
20ec : 65 4c __ ADC T5 + 0 
20ee : 85 16 __ STA P9 ; (buff + 0)
20f0 : 90 8f __ BCC $2081 ; (sformat.l1 + 0)
.s1099:
20f2 : e6 17 __ INC P10 ; (buff + 1)
20f4 : b0 8b __ BCS $2081 ; (sformat.l1 + 0)
.s4:
20f6 : a5 47 __ LDA T0 + 0 
20f8 : f0 27 __ BEQ $2121 ; (sformat.s9 + 0)
.s7:
20fa : 84 47 __ STY T0 + 0 
20fc : 85 4c __ STA T5 + 0 
20fe : ad fb bf LDA $bffb ; (sstack + 4)
2101 : f0 13 __ BEQ $2116 ; (sformat.s11 + 0)
.s10:
2103 : a5 16 __ LDA P9 ; (buff + 0)
2105 : 85 0d __ STA P0 
2107 : a5 17 __ LDA P10 ; (buff + 1)
2109 : 85 0e __ STA P1 
210b : 98 __ __ TYA
210c : a4 4c __ LDY T5 + 0 
210e : 91 16 __ STA (P9),y ; (buff + 0)
2110 : 20 39 24 JSR $2439 ; (puts.s0 + 0)
2113 : 4c 21 21 JMP $2121 ; (sformat.s9 + 0)
.s11:
2116 : 18 __ __ CLC
2117 : a5 16 __ LDA P9 ; (buff + 0)
2119 : 65 4c __ ADC T5 + 0 
211b : 85 16 __ STA P9 ; (buff + 0)
211d : 90 02 __ BCC $2121 ; (sformat.s9 + 0)
.s1095:
211f : e6 17 __ INC P10 ; (buff + 1)
.s9:
2121 : a9 00 __ LDA #$00
2123 : 8d e3 bf STA $bfe3 ; (wrapbuffer + 75)
2126 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 76)
2129 : 8d e5 bf STA $bfe5 ; (wrapbuffer + 77)
212c : 8d e6 bf STA $bfe6 ; (wrapbuffer + 78)
212f : a9 0a __ LDA #$0a
2131 : 8d e2 bf STA $bfe2 ; (wrapbuffer + 74)
2134 : a0 01 __ LDY #$01
2136 : b1 49 __ LDA (T1 + 0),y 
2138 : a2 20 __ LDX #$20
213a : 8e df bf STX $bfdf ; (wrapbuffer + 71)
213d : a2 00 __ LDX #$00
213f : 8e e0 bf STX $bfe0 ; (wrapbuffer + 72)
2142 : ca __ __ DEX
2143 : 8e e1 bf STX $bfe1 ; (wrapbuffer + 73)
2146 : aa __ __ TAX
2147 : 18 __ __ CLC
2148 : a5 49 __ LDA T1 + 0 
214a : 69 02 __ ADC #$02
214c : 4c 59 21 JMP $2159 ; (sformat.l14 + 0)
.s264:
214f : a0 00 __ LDY #$00
2151 : b1 49 __ LDA (T1 + 0),y 
2153 : aa __ __ TAX
2154 : 18 __ __ CLC
2155 : a5 49 __ LDA T1 + 0 
2157 : 69 01 __ ADC #$01
.l14:
2159 : 85 49 __ STA T1 + 0 
215b : 90 02 __ BCC $215f ; (sformat.s1082 + 0)
.s1081:
215d : e6 4a __ INC T1 + 1 
.s1082:
215f : 8a __ __ TXA
2160 : e0 2b __ CPX #$2b
2162 : d0 07 __ BNE $216b ; (sformat.s17 + 0)
.s16:
2164 : a9 01 __ LDA #$01
2166 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 76)
2169 : d0 e4 __ BNE $214f ; (sformat.s264 + 0)
.s17:
216b : c9 30 __ CMP #$30
216d : d0 06 __ BNE $2175 ; (sformat.s20 + 0)
.s19:
216f : 8d df bf STA $bfdf ; (wrapbuffer + 71)
2172 : 4c 4f 21 JMP $214f ; (sformat.s264 + 0)
.s20:
2175 : c9 23 __ CMP #$23
2177 : d0 07 __ BNE $2180 ; (sformat.s23 + 0)
.s22:
2179 : a9 01 __ LDA #$01
217b : 8d e6 bf STA $bfe6 ; (wrapbuffer + 78)
217e : d0 cf __ BNE $214f ; (sformat.s264 + 0)
.s23:
2180 : c9 2d __ CMP #$2d
2182 : d0 07 __ BNE $218b ; (sformat.s15 + 0)
.s25:
2184 : a9 01 __ LDA #$01
2186 : 8d e5 bf STA $bfe5 ; (wrapbuffer + 77)
2189 : d0 c4 __ BNE $214f ; (sformat.s264 + 0)
.s15:
218b : 85 4c __ STA T5 + 0 
218d : c9 30 __ CMP #$30
218f : 90 55 __ BCC $21e6 ; (sformat.s31 + 0)
.s32:
2191 : c9 3a __ CMP #$3a
2193 : b0 51 __ BCS $21e6 ; (sformat.s31 + 0)
.s29:
2195 : a9 00 __ LDA #$00
2197 : 85 44 __ STA T6 + 0 
2199 : 85 45 __ STA T6 + 1 
219b : e0 3a __ CPX #$3a
219d : b0 40 __ BCS $21df ; (sformat.s35 + 0)
.l34:
219f : a5 44 __ LDA T6 + 0 
21a1 : 0a __ __ ASL
21a2 : 85 1b __ STA ACCU + 0 ; (fps + 0)
21a4 : a5 45 __ LDA T6 + 1 
21a6 : 2a __ __ ROL
21a7 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
21a9 : 2a __ __ ROL
21aa : aa __ __ TAX
21ab : 18 __ __ CLC
21ac : a5 1b __ LDA ACCU + 0 ; (fps + 0)
21ae : 65 44 __ ADC T6 + 0 
21b0 : 85 44 __ STA T6 + 0 
21b2 : 8a __ __ TXA
21b3 : 65 45 __ ADC T6 + 1 
21b5 : 06 44 __ ASL T6 + 0 
21b7 : 2a __ __ ROL
21b8 : aa __ __ TAX
21b9 : 18 __ __ CLC
21ba : a5 44 __ LDA T6 + 0 
21bc : 65 4c __ ADC T5 + 0 
21be : 90 01 __ BCC $21c1 ; (sformat.s1092 + 0)
.s1091:
21c0 : e8 __ __ INX
.s1092:
21c1 : 38 __ __ SEC
21c2 : e9 30 __ SBC #$30
21c4 : 85 44 __ STA T6 + 0 
21c6 : 8a __ __ TXA
21c7 : e9 00 __ SBC #$00
21c9 : 85 45 __ STA T6 + 1 
21cb : a0 00 __ LDY #$00
21cd : b1 49 __ LDA (T1 + 0),y 
21cf : 85 4c __ STA T5 + 0 
21d1 : e6 49 __ INC T1 + 0 
21d3 : d0 02 __ BNE $21d7 ; (sformat.s1094 + 0)
.s1093:
21d5 : e6 4a __ INC T1 + 1 
.s1094:
21d7 : c9 30 __ CMP #$30
21d9 : 90 04 __ BCC $21df ; (sformat.s35 + 0)
.s36:
21db : c9 3a __ CMP #$3a
21dd : 90 c0 __ BCC $219f ; (sformat.l34 + 0)
.s35:
21df : a5 44 __ LDA T6 + 0 
21e1 : 8d e0 bf STA $bfe0 ; (wrapbuffer + 72)
21e4 : a5 4c __ LDA T5 + 0 
.s31:
21e6 : c9 2e __ CMP #$2e
21e8 : d0 4d __ BNE $2237 ; (sformat.s39 + 0)
.s37:
21ea : a9 00 __ LDA #$00
21ec : 85 44 __ STA T6 + 0 
21ee : f0 08 __ BEQ $21f8 ; (sformat.l243 + 0)
.s1090:
21f0 : 38 __ __ SEC
21f1 : e9 30 __ SBC #$30
21f3 : 85 44 __ STA T6 + 0 
21f5 : 8a __ __ TXA
21f6 : e9 00 __ SBC #$00
.l243:
21f8 : 85 45 __ STA T6 + 1 
21fa : a0 00 __ LDY #$00
21fc : b1 49 __ LDA (T1 + 0),y 
21fe : 85 4c __ STA T5 + 0 
2200 : e6 49 __ INC T1 + 0 
2202 : d0 02 __ BNE $2206 ; (sformat.s1084 + 0)
.s1083:
2204 : e6 4a __ INC T1 + 1 
.s1084:
2206 : c9 30 __ CMP #$30
2208 : 90 28 __ BCC $2232 ; (sformat.s42 + 0)
.s43:
220a : c9 3a __ CMP #$3a
220c : b0 24 __ BCS $2232 ; (sformat.s42 + 0)
.s41:
220e : a5 44 __ LDA T6 + 0 
2210 : 0a __ __ ASL
2211 : 85 1b __ STA ACCU + 0 ; (fps + 0)
2213 : a5 45 __ LDA T6 + 1 
2215 : 2a __ __ ROL
2216 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
2218 : 2a __ __ ROL
2219 : aa __ __ TAX
221a : 18 __ __ CLC
221b : a5 1b __ LDA ACCU + 0 ; (fps + 0)
221d : 65 44 __ ADC T6 + 0 
221f : 85 44 __ STA T6 + 0 
2221 : 8a __ __ TXA
2222 : 65 45 __ ADC T6 + 1 
2224 : 06 44 __ ASL T6 + 0 
2226 : 2a __ __ ROL
2227 : aa __ __ TAX
2228 : 18 __ __ CLC
2229 : a5 44 __ LDA T6 + 0 
222b : 65 4c __ ADC T5 + 0 
222d : 90 c1 __ BCC $21f0 ; (sformat.s1090 + 0)
.s1089:
222f : e8 __ __ INX
2230 : b0 be __ BCS $21f0 ; (sformat.s1090 + 0)
.s42:
2232 : a6 44 __ LDX T6 + 0 
2234 : 8e e1 bf STX $bfe1 ; (wrapbuffer + 73)
.s39:
2237 : c9 64 __ CMP #$64
2239 : f0 04 __ BEQ $223f ; (sformat.s44 + 0)
.s47:
223b : c9 44 __ CMP #$44
223d : d0 05 __ BNE $2244 ; (sformat.s45 + 0)
.s44:
223f : a9 01 __ LDA #$01
2241 : 4c fd 23 JMP $23fd ; (sformat.s261 + 0)
.s45:
2244 : c9 75 __ CMP #$75
2246 : d0 03 __ BNE $224b ; (sformat.s51 + 0)
2248 : 4c fb 23 JMP $23fb ; (sformat.s291 + 0)
.s51:
224b : c9 55 __ CMP #$55
224d : d0 03 __ BNE $2252 ; (sformat.s49 + 0)
224f : 4c fb 23 JMP $23fb ; (sformat.s291 + 0)
.s49:
2252 : c9 78 __ CMP #$78
2254 : f0 04 __ BEQ $225a ; (sformat.s52 + 0)
.s55:
2256 : c9 58 __ CMP #$58
2258 : d0 0d __ BNE $2267 ; (sformat.s53 + 0)
.s52:
225a : a9 10 __ LDA #$10
225c : 8d e2 bf STA $bfe2 ; (wrapbuffer + 74)
225f : a9 00 __ LDA #$00
2261 : 8d e3 bf STA $bfe3 ; (wrapbuffer + 75)
2264 : 4c fb 23 JMP $23fb ; (sformat.s291 + 0)
.s53:
2267 : c9 6c __ CMP #$6c
2269 : d0 03 __ BNE $226e ; (sformat.s59 + 0)
226b : 4c 7f 23 JMP $237f ; (sformat.s56 + 0)
.s59:
226e : c9 4c __ CMP #$4c
2270 : d0 03 __ BNE $2275 ; (sformat.s57 + 0)
2272 : 4c 7f 23 JMP $237f ; (sformat.s56 + 0)
.s57:
2275 : c9 73 __ CMP #$73
2277 : f0 54 __ BEQ $22cd ; (sformat.s72 + 0)
.s75:
2279 : c9 53 __ CMP #$53
227b : f0 50 __ BEQ $22cd ; (sformat.s72 + 0)
.s73:
227d : c9 63 __ CMP #$63
227f : f0 23 __ BEQ $22a4 ; (sformat.s103 + 0)
.s106:
2281 : c9 43 __ CMP #$43
2283 : f0 1f __ BEQ $22a4 ; (sformat.s103 + 0)
.s104:
2285 : 09 00 __ ORA #$00
2287 : d0 03 __ BNE $228c ; (sformat.s107 + 0)
2289 : 4c 81 20 JMP $2081 ; (sformat.l1 + 0)
.s107:
228c : 18 __ __ CLC
228d : a5 16 __ LDA P9 ; (buff + 0)
228f : 65 47 __ ADC T0 + 0 
2291 : 85 44 __ STA T6 + 0 
2293 : a5 17 __ LDA P10 ; (buff + 1)
2295 : 69 00 __ ADC #$00
2297 : 85 45 __ STA T6 + 1 
2299 : a5 4c __ LDA T5 + 0 
.s1068:
229b : a0 00 __ LDY #$00
229d : 91 44 __ STA (T6 + 0),y 
229f : e6 47 __ INC T0 + 0 
22a1 : 4c 81 20 JMP $2081 ; (sformat.l1 + 0)
.s103:
22a4 : ad f9 bf LDA $bff9 ; (sstack + 2)
22a7 : 85 4c __ STA T5 + 0 
22a9 : 18 __ __ CLC
22aa : 69 02 __ ADC #$02
22ac : 8d f9 bf STA $bff9 ; (sstack + 2)
22af : ad fa bf LDA $bffa ; (sstack + 3)
22b2 : 85 4d __ STA T5 + 1 
22b4 : 69 00 __ ADC #$00
22b6 : 8d fa bf STA $bffa ; (sstack + 3)
22b9 : 18 __ __ CLC
22ba : a5 16 __ LDA P9 ; (buff + 0)
22bc : 65 47 __ ADC T0 + 0 
22be : 85 44 __ STA T6 + 0 
22c0 : a5 17 __ LDA P10 ; (buff + 1)
22c2 : 69 00 __ ADC #$00
22c4 : 85 45 __ STA T6 + 1 
22c6 : a0 00 __ LDY #$00
22c8 : b1 4c __ LDA (T5 + 0),y 
22ca : 4c 9b 22 JMP $229b ; (sformat.s1068 + 0)
.s72:
22cd : ad f9 bf LDA $bff9 ; (sstack + 2)
22d0 : 85 4c __ STA T5 + 0 
22d2 : 18 __ __ CLC
22d3 : 69 02 __ ADC #$02
22d5 : 8d f9 bf STA $bff9 ; (sstack + 2)
22d8 : ad fa bf LDA $bffa ; (sstack + 3)
22db : 85 4d __ STA T5 + 1 
22dd : 69 00 __ ADC #$00
22df : 8d fa bf STA $bffa ; (sstack + 3)
22e2 : a0 00 __ LDY #$00
22e4 : 84 4b __ STY T3 + 0 
22e6 : b1 4c __ LDA (T5 + 0),y 
22e8 : aa __ __ TAX
22e9 : c8 __ __ INY
22ea : b1 4c __ LDA (T5 + 0),y 
22ec : 86 4c __ STX T5 + 0 
22ee : 85 4d __ STA T5 + 1 
22f0 : ad e0 bf LDA $bfe0 ; (wrapbuffer + 72)
22f3 : f0 0c __ BEQ $2301 ; (sformat.s78 + 0)
.s1073:
22f5 : 88 __ __ DEY
22f6 : b1 4c __ LDA (T5 + 0),y 
22f8 : f0 05 __ BEQ $22ff ; (sformat.s1074 + 0)
.l80:
22fa : c8 __ __ INY
22fb : b1 4c __ LDA (T5 + 0),y 
22fd : d0 fb __ BNE $22fa ; (sformat.l80 + 0)
.s1074:
22ff : 84 4b __ STY T3 + 0 
.s78:
2301 : ad e5 bf LDA $bfe5 ; (wrapbuffer + 77)
2304 : d0 19 __ BNE $231f ; (sformat.s84 + 0)
.s1077:
2306 : a6 4b __ LDX T3 + 0 
2308 : ec e0 bf CPX $bfe0 ; (wrapbuffer + 72)
230b : a4 47 __ LDY T0 + 0 
230d : b0 0c __ BCS $231b ; (sformat.s1078 + 0)
.l86:
230f : ad df bf LDA $bfdf ; (wrapbuffer + 71)
2312 : 91 16 __ STA (P9),y ; (buff + 0)
2314 : c8 __ __ INY
2315 : e8 __ __ INX
2316 : ec e0 bf CPX $bfe0 ; (wrapbuffer + 72)
2319 : 90 f4 __ BCC $230f ; (sformat.l86 + 0)
.s1078:
231b : 86 4b __ STX T3 + 0 
231d : 84 47 __ STY T0 + 0 
.s84:
231f : ad fb bf LDA $bffb ; (sstack + 4)
2322 : d0 37 __ BNE $235b ; (sformat.s88 + 0)
.l94:
2324 : a0 00 __ LDY #$00
2326 : b1 4c __ LDA (T5 + 0),y 
2328 : f0 0f __ BEQ $2339 ; (sformat.s251 + 0)
.s95:
232a : a4 47 __ LDY T0 + 0 
232c : 91 16 __ STA (P9),y ; (buff + 0)
232e : e6 47 __ INC T0 + 0 
2330 : e6 4c __ INC T5 + 0 
2332 : d0 f0 __ BNE $2324 ; (sformat.l94 + 0)
.s1087:
2334 : e6 4d __ INC T5 + 1 
2336 : 4c 24 23 JMP $2324 ; (sformat.l94 + 0)
.s251:
2339 : ad e5 bf LDA $bfe5 ; (wrapbuffer + 77)
233c : d0 03 __ BNE $2341 ; (sformat.s1075 + 0)
233e : 4c 81 20 JMP $2081 ; (sformat.l1 + 0)
.s1075:
2341 : a6 4b __ LDX T3 + 0 
2343 : ec e0 bf CPX $bfe0 ; (wrapbuffer + 72)
2346 : a4 47 __ LDY T0 + 0 
2348 : b0 0c __ BCS $2356 ; (sformat.s1076 + 0)
.l101:
234a : ad df bf LDA $bfdf ; (wrapbuffer + 71)
234d : 91 16 __ STA (P9),y ; (buff + 0)
234f : c8 __ __ INY
2350 : e8 __ __ INX
2351 : ec e0 bf CPX $bfe0 ; (wrapbuffer + 72)
2354 : 90 f4 __ BCC $234a ; (sformat.l101 + 0)
.s1076:
2356 : 84 47 __ STY T0 + 0 
2358 : 4c 81 20 JMP $2081 ; (sformat.l1 + 0)
.s88:
235b : a5 47 __ LDA T0 + 0 
235d : f0 12 __ BEQ $2371 ; (sformat.s93 + 0)
.s91:
235f : a6 16 __ LDX P9 ; (buff + 0)
2361 : 86 0d __ STX P0 
2363 : a6 17 __ LDX P10 ; (buff + 1)
2365 : 86 0e __ STX P1 
2367 : a8 __ __ TAY
2368 : a9 00 __ LDA #$00
236a : 85 47 __ STA T0 + 0 
236c : 91 16 __ STA (P9),y ; (buff + 0)
236e : 20 39 24 JSR $2439 ; (puts.s0 + 0)
.s93:
2371 : a5 4c __ LDA T5 + 0 
2373 : 85 0d __ STA P0 
2375 : a5 4d __ LDA T5 + 1 
2377 : 85 0e __ STA P1 
2379 : 20 39 24 JSR $2439 ; (puts.s0 + 0)
237c : 4c 39 23 JMP $2339 ; (sformat.s251 + 0)
.s56:
237f : ad f9 bf LDA $bff9 ; (sstack + 2)
2382 : 85 4c __ STA T5 + 0 
2384 : 18 __ __ CLC
2385 : 69 04 __ ADC #$04
2387 : 8d f9 bf STA $bff9 ; (sstack + 2)
238a : ad fa bf LDA $bffa ; (sstack + 3)
238d : 85 4d __ STA T5 + 1 
238f : 69 00 __ ADC #$00
2391 : 8d fa bf STA $bffa ; (sstack + 3)
2394 : a0 00 __ LDY #$00
2396 : b1 49 __ LDA (T1 + 0),y 
2398 : aa __ __ TAX
2399 : e6 49 __ INC T1 + 0 
239b : d0 02 __ BNE $239f ; (sformat.s1086 + 0)
.s1085:
239d : e6 4a __ INC T1 + 1 
.s1086:
239f : b1 4c __ LDA (T5 + 0),y 
23a1 : 85 11 __ STA P4 
23a3 : a0 01 __ LDY #$01
23a5 : b1 4c __ LDA (T5 + 0),y 
23a7 : 85 12 __ STA P5 
23a9 : c8 __ __ INY
23aa : b1 4c __ LDA (T5 + 0),y 
23ac : 85 13 __ STA P6 
23ae : c8 __ __ INY
23af : b1 4c __ LDA (T5 + 0),y 
23b1 : 85 14 __ STA P7 
23b3 : 8a __ __ TXA
23b4 : e0 64 __ CPX #$64
23b6 : f0 04 __ BEQ $23bc ; (sformat.s60 + 0)
.s63:
23b8 : c9 44 __ CMP #$44
23ba : d0 04 __ BNE $23c0 ; (sformat.s61 + 0)
.s60:
23bc : a9 01 __ LDA #$01
23be : d0 1f __ BNE $23df ; (sformat.s262 + 0)
.s61:
23c0 : c9 75 __ CMP #$75
23c2 : f0 19 __ BEQ $23dd ; (sformat.s292 + 0)
.s67:
23c4 : c9 55 __ CMP #$55
23c6 : f0 15 __ BEQ $23dd ; (sformat.s292 + 0)
.s65:
23c8 : c9 78 __ CMP #$78
23ca : f0 07 __ BEQ $23d3 ; (sformat.s68 + 0)
.s71:
23cc : c9 58 __ CMP #$58
23ce : f0 03 __ BEQ $23d3 ; (sformat.s68 + 0)
23d0 : 4c 81 20 JMP $2081 ; (sformat.l1 + 0)
.s68:
23d3 : a9 10 __ LDA #$10
23d5 : 8d e2 bf STA $bfe2 ; (wrapbuffer + 74)
23d8 : a9 00 __ LDA #$00
23da : 8d e3 bf STA $bfe3 ; (wrapbuffer + 75)
.s292:
23dd : a9 00 __ LDA #$00
.s262:
23df : 85 15 __ STA P8 
23e1 : a5 16 __ LDA P9 ; (buff + 0)
23e3 : 85 0f __ STA P2 
23e5 : a5 17 __ LDA P10 ; (buff + 1)
23e7 : 85 10 __ STA P3 
23e9 : a9 df __ LDA #$df
23eb : 85 0d __ STA P0 
23ed : a9 bf __ LDA #$bf
23ef : 85 0e __ STA P1 
23f1 : 20 c9 25 JSR $25c9 ; (nforml.s0 + 0)
.s1069:
23f4 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
23f6 : 85 47 __ STA T0 + 0 
23f8 : 4c 81 20 JMP $2081 ; (sformat.l1 + 0)
.s291:
23fb : a9 00 __ LDA #$00
.s261:
23fd : 85 13 __ STA P6 
23ff : a5 16 __ LDA P9 ; (buff + 0)
2401 : 85 0f __ STA P2 
2403 : a5 17 __ LDA P10 ; (buff + 1)
2405 : 85 10 __ STA P3 
2407 : ad f9 bf LDA $bff9 ; (sstack + 2)
240a : 85 47 __ STA T0 + 0 
240c : ad fa bf LDA $bffa ; (sstack + 3)
240f : 85 48 __ STA T0 + 1 
2411 : a0 00 __ LDY #$00
2413 : b1 47 __ LDA (T0 + 0),y 
2415 : 85 11 __ STA P4 
2417 : c8 __ __ INY
2418 : b1 47 __ LDA (T0 + 0),y 
241a : 85 12 __ STA P5 
241c : 18 __ __ CLC
241d : a5 47 __ LDA T0 + 0 
241f : 69 02 __ ADC #$02
2421 : 8d f9 bf STA $bff9 ; (sstack + 2)
2424 : a5 48 __ LDA T0 + 1 
2426 : 69 00 __ ADC #$00
2428 : 8d fa bf STA $bffa ; (sstack + 3)
242b : a9 df __ LDA #$df
242d : 85 0d __ STA P0 
242f : a9 bf __ LDA #$bf
2431 : 85 0e __ STA P1 
2433 : 20 8e 24 JSR $248e ; (nformi.s0 + 0)
2436 : 4c f4 23 JMP $23f4 ; (sformat.s1069 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
2439 : a0 00 __ LDY #$00
243b : b1 0d __ LDA (P0),y 
243d : f0 0b __ BEQ $244a ; (puts.s1001 + 0)
243f : 20 4b 24 JSR $244b ; (putpch + 0)
2442 : e6 0d __ INC P0 
2444 : d0 f3 __ BNE $2439 ; (puts.s0 + 0)
2446 : e6 0e __ INC P1 
2448 : d0 ef __ BNE $2439 ; (puts.s0 + 0)
.s1001:
244a : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
244b : ae ff 28 LDX $28ff ; (giocharmap + 0)
244e : e0 01 __ CPX #$01
2450 : 90 26 __ BCC $2478 ; (putpch + 45)
2452 : c9 0a __ CMP #$0a
2454 : d0 02 __ BNE $2458 ; (putpch + 13)
2456 : a9 0d __ LDA #$0d
2458 : c9 09 __ CMP #$09
245a : f0 1f __ BEQ $247b ; (putpch + 48)
245c : e0 02 __ CPX #$02
245e : 90 18 __ BCC $2478 ; (putpch + 45)
2460 : c9 41 __ CMP #$41
2462 : 90 14 __ BCC $2478 ; (putpch + 45)
2464 : c9 7b __ CMP #$7b
2466 : b0 10 __ BCS $2478 ; (putpch + 45)
2468 : c9 61 __ CMP #$61
246a : b0 04 __ BCS $2470 ; (putpch + 37)
246c : c9 5b __ CMP #$5b
246e : b0 08 __ BCS $2478 ; (putpch + 45)
2470 : 49 20 __ EOR #$20
2472 : e0 03 __ CPX #$03
2474 : f0 02 __ BEQ $2478 ; (putpch + 45)
2476 : 29 df __ AND #$df
2478 : 4c d2 ff JMP $ffd2 
247b : 38 __ __ SEC
247c : 20 f0 ff JSR $fff0 
247f : 98 __ __ TYA
2480 : 29 03 __ AND #$03
2482 : 49 03 __ EOR #$03
2484 : aa __ __ TAX
2485 : a9 20 __ LDA #$20
2487 : 20 d2 ff JSR $ffd2 
248a : ca __ __ DEX
248b : 10 fa __ BPL $2487 ; (putpch + 60)
248d : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
248e : a9 00 __ LDA #$00
2490 : 85 43 __ STA T0 + 0 
2492 : a5 13 __ LDA P6 ; (s + 0)
2494 : f0 19 __ BEQ $24af ; (nformi.s3 + 0)
.s4:
2496 : 24 12 __ BIT P5 ; (v + 1)
2498 : 10 15 __ BPL $24af ; (nformi.s3 + 0)
.s1:
249a : 38 __ __ SEC
249b : a9 00 __ LDA #$00
249d : e5 11 __ SBC P4 ; (v + 0)
249f : 85 11 __ STA P4 ; (v + 0)
24a1 : a9 00 __ LDA #$00
24a3 : e5 12 __ SBC P5 ; (v + 1)
24a5 : 85 12 __ STA P5 ; (v + 1)
24a7 : e6 43 __ INC T0 + 0 
24a9 : a9 10 __ LDA #$10
24ab : 85 44 __ STA T2 + 0 
24ad : d0 0a __ BNE $24b9 ; (nformi.s42 + 0)
.s3:
24af : a9 10 __ LDA #$10
24b1 : 85 44 __ STA T2 + 0 
24b3 : a5 11 __ LDA P4 ; (v + 0)
24b5 : 05 12 __ ORA P5 ; (v + 1)
24b7 : f0 46 __ BEQ $24ff ; (nformi.s7 + 0)
.s42:
24b9 : a0 03 __ LDY #$03
24bb : b1 0d __ LDA (P0),y ; (si + 0)
24bd : 85 45 __ STA T3 + 0 
24bf : c8 __ __ INY
24c0 : b1 0d __ LDA (P0),y ; (si + 0)
24c2 : 85 46 __ STA T3 + 1 
.l6:
24c4 : a5 11 __ LDA P4 ; (v + 0)
24c6 : 85 1b __ STA ACCU + 0 
24c8 : a5 12 __ LDA P5 ; (v + 1)
24ca : 85 1c __ STA ACCU + 1 
24cc : a5 45 __ LDA T3 + 0 
24ce : 85 03 __ STA WORK + 0 
24d0 : a5 46 __ LDA T3 + 1 
24d2 : 85 04 __ STA WORK + 1 
24d4 : 20 a0 64 JSR $64a0 ; (divmod + 0)
24d7 : a5 06 __ LDA WORK + 3 
24d9 : 30 08 __ BMI $24e3 ; (nformi.s78 + 0)
.s1019:
24db : d0 0a __ BNE $24e7 ; (nformi.s77 + 0)
.s1018:
24dd : a5 05 __ LDA WORK + 2 
24df : c9 0a __ CMP #$0a
24e1 : b0 04 __ BCS $24e7 ; (nformi.s77 + 0)
.s78:
24e3 : a9 30 __ LDA #$30
24e5 : d0 02 __ BNE $24e9 ; (nformi.s79 + 0)
.s77:
24e7 : a9 37 __ LDA #$37
.s79:
24e9 : c6 44 __ DEC T2 + 0 
24eb : 18 __ __ CLC
24ec : 65 05 __ ADC WORK + 2 
24ee : a6 44 __ LDX T2 + 0 
24f0 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
24f3 : a5 1b __ LDA ACCU + 0 
24f5 : 85 11 __ STA P4 ; (v + 0)
24f7 : a5 1c __ LDA ACCU + 1 
24f9 : 85 12 __ STA P5 ; (v + 1)
24fb : 05 11 __ ORA P4 ; (v + 0)
24fd : d0 c5 __ BNE $24c4 ; (nformi.l6 + 0)
.s7:
24ff : a0 02 __ LDY #$02
2501 : b1 0d __ LDA (P0),y ; (si + 0)
2503 : c9 ff __ CMP #$ff
2505 : d0 04 __ BNE $250b ; (nformi.s80 + 0)
.s81:
2507 : a9 0f __ LDA #$0f
2509 : d0 05 __ BNE $2510 ; (nformi.s1026 + 0)
.s80:
250b : 38 __ __ SEC
250c : a9 10 __ LDA #$10
250e : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
2510 : a8 __ __ TAY
2511 : c4 44 __ CPY T2 + 0 
2513 : b0 0d __ BCS $2522 ; (nformi.s10 + 0)
.s9:
2515 : a9 30 __ LDA #$30
.l1027:
2517 : c6 44 __ DEC T2 + 0 
2519 : a6 44 __ LDX T2 + 0 
251b : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
251e : c4 44 __ CPY T2 + 0 
2520 : 90 f5 __ BCC $2517 ; (nformi.l1027 + 0)
.s10:
2522 : a0 07 __ LDY #$07
2524 : b1 0d __ LDA (P0),y ; (si + 0)
2526 : f0 20 __ BEQ $2548 ; (nformi.s13 + 0)
.s14:
2528 : a0 04 __ LDY #$04
252a : b1 0d __ LDA (P0),y ; (si + 0)
252c : d0 1a __ BNE $2548 ; (nformi.s13 + 0)
.s1013:
252e : 88 __ __ DEY
252f : b1 0d __ LDA (P0),y ; (si + 0)
2531 : c9 10 __ CMP #$10
2533 : d0 13 __ BNE $2548 ; (nformi.s13 + 0)
.s11:
2535 : a9 58 __ LDA #$58
2537 : a6 44 __ LDX T2 + 0 
2539 : 9d e6 bf STA $bfe6,x ; (wrapbuffer + 78)
253c : 8a __ __ TXA
253d : 18 __ __ CLC
253e : 69 fe __ ADC #$fe
2540 : 85 44 __ STA T2 + 0 
2542 : aa __ __ TAX
2543 : a9 30 __ LDA #$30
2545 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
.s13:
2548 : a9 00 __ LDA #$00
254a : 85 1b __ STA ACCU + 0 
254c : a5 43 __ LDA T0 + 0 
254e : f0 06 __ BEQ $2556 ; (nformi.s16 + 0)
.s15:
2550 : c6 44 __ DEC T2 + 0 
2552 : a9 2d __ LDA #$2d
2554 : d0 0a __ BNE $2560 ; (nformi.s1025 + 0)
.s16:
2556 : a0 05 __ LDY #$05
2558 : b1 0d __ LDA (P0),y ; (si + 0)
255a : f0 09 __ BEQ $2565 ; (nformi.s162 + 0)
.s18:
255c : c6 44 __ DEC T2 + 0 
255e : a9 2b __ LDA #$2b
.s1025:
2560 : a6 44 __ LDX T2 + 0 
2562 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
.s162:
2565 : a0 06 __ LDY #$06
2567 : b1 0d __ LDA (P0),y ; (si + 0)
2569 : d0 33 __ BNE $259e ; (nformi.s24 + 0)
.l30:
256b : a0 01 __ LDY #$01
256d : b1 0d __ LDA (P0),y ; (si + 0)
256f : 18 __ __ CLC
2570 : 65 44 __ ADC T2 + 0 
2572 : b0 04 __ BCS $2578 ; (nformi.s31 + 0)
.s1006:
2574 : c9 11 __ CMP #$11
2576 : 90 0d __ BCC $2585 ; (nformi.s33 + 0)
.s31:
2578 : c6 44 __ DEC T2 + 0 
257a : a0 00 __ LDY #$00
257c : b1 0d __ LDA (P0),y ; (si + 0)
257e : a6 44 __ LDX T2 + 0 
2580 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
2583 : b0 e6 __ BCS $256b ; (nformi.l30 + 0)
.s33:
2585 : a6 44 __ LDX T2 + 0 
2587 : e0 10 __ CPX #$10
2589 : b0 0e __ BCS $2599 ; (nformi.s23 + 0)
.s34:
258b : 88 __ __ DEY
.l1022:
258c : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 79)
258f : 91 0f __ STA (P2),y ; (str + 0)
2591 : c8 __ __ INY
2592 : e8 __ __ INX
2593 : e0 10 __ CPX #$10
2595 : 90 f5 __ BCC $258c ; (nformi.l1022 + 0)
.s1023:
2597 : 84 1b __ STY ACCU + 0 
.s23:
2599 : a9 00 __ LDA #$00
259b : 85 1c __ STA ACCU + 1 
.s1001:
259d : 60 __ __ RTS
.s24:
259e : a6 44 __ LDX T2 + 0 
25a0 : e0 10 __ CPX #$10
25a2 : b0 1a __ BCS $25be ; (nformi.l27 + 0)
.s25:
25a4 : a0 00 __ LDY #$00
.l1020:
25a6 : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 79)
25a9 : 91 0f __ STA (P2),y ; (str + 0)
25ab : c8 __ __ INY
25ac : e8 __ __ INX
25ad : e0 10 __ CPX #$10
25af : 90 f5 __ BCC $25a6 ; (nformi.l1020 + 0)
.s1021:
25b1 : 84 1b __ STY ACCU + 0 
25b3 : b0 09 __ BCS $25be ; (nformi.l27 + 0)
.s28:
25b5 : 88 __ __ DEY
25b6 : b1 0d __ LDA (P0),y ; (si + 0)
25b8 : a4 1b __ LDY ACCU + 0 
25ba : 91 0f __ STA (P2),y ; (str + 0)
25bc : e6 1b __ INC ACCU + 0 
.l27:
25be : a5 1b __ LDA ACCU + 0 
25c0 : a0 01 __ LDY #$01
25c2 : d1 0d __ CMP (P0),y ; (si + 0)
25c4 : 90 ef __ BCC $25b5 ; (nformi.s28 + 0)
25c6 : 4c 99 25 JMP $2599 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
25c9 : a9 00 __ LDA #$00
25cb : 85 43 __ STA T0 + 0 
25cd : a5 15 __ LDA P8 ; (s + 0)
25cf : f0 21 __ BEQ $25f2 ; (nforml.s182 + 0)
.s4:
25d1 : a5 14 __ LDA P7 ; (v + 3)
25d3 : f0 1d __ BEQ $25f2 ; (nforml.s182 + 0)
.s1032:
25d5 : 10 1b __ BPL $25f2 ; (nforml.s182 + 0)
.s1:
25d7 : 38 __ __ SEC
25d8 : a9 00 __ LDA #$00
25da : e5 11 __ SBC P4 ; (v + 0)
25dc : 85 11 __ STA P4 ; (v + 0)
25de : a9 00 __ LDA #$00
25e0 : e5 12 __ SBC P5 ; (v + 1)
25e2 : 85 12 __ STA P5 ; (v + 1)
25e4 : a9 00 __ LDA #$00
25e6 : e5 13 __ SBC P6 ; (v + 2)
25e8 : 85 13 __ STA P6 ; (v + 2)
25ea : a9 00 __ LDA #$00
25ec : e5 14 __ SBC P7 ; (v + 3)
25ee : 85 14 __ STA P7 ; (v + 3)
25f0 : e6 43 __ INC T0 + 0 
.s182:
25f2 : a9 10 __ LDA #$10
25f4 : 85 44 __ STA T2 + 0 
25f6 : a5 14 __ LDA P7 ; (v + 3)
25f8 : d0 0c __ BNE $2606 ; (nforml.s42 + 0)
.s1024:
25fa : a5 13 __ LDA P6 ; (v + 2)
25fc : d0 08 __ BNE $2606 ; (nforml.s42 + 0)
.s1025:
25fe : a5 12 __ LDA P5 ; (v + 1)
2600 : d0 04 __ BNE $2606 ; (nforml.s42 + 0)
.s1026:
2602 : c5 11 __ CMP P4 ; (v + 0)
2604 : b0 0e __ BCS $2614 ; (nforml.s7 + 0)
.s42:
2606 : a0 03 __ LDY #$03
2608 : b1 0d __ LDA (P0),y ; (si + 0)
260a : 85 45 __ STA T5 + 0 
260c : c8 __ __ INY
260d : b1 0d __ LDA (P0),y ; (si + 0)
260f : 85 46 __ STA T5 + 1 
2611 : 4c de 26 JMP $26de ; (nforml.l6 + 0)
.s7:
2614 : a0 02 __ LDY #$02
2616 : b1 0d __ LDA (P0),y ; (si + 0)
2618 : c9 ff __ CMP #$ff
261a : d0 04 __ BNE $2620 ; (nforml.s80 + 0)
.s81:
261c : a9 0f __ LDA #$0f
261e : d0 05 __ BNE $2625 ; (nforml.s1039 + 0)
.s80:
2620 : 38 __ __ SEC
2621 : a9 10 __ LDA #$10
2623 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
2625 : a8 __ __ TAY
2626 : c4 44 __ CPY T2 + 0 
2628 : b0 0d __ BCS $2637 ; (nforml.s10 + 0)
.s9:
262a : a9 30 __ LDA #$30
.l1040:
262c : c6 44 __ DEC T2 + 0 
262e : a6 44 __ LDX T2 + 0 
2630 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
2633 : c4 44 __ CPY T2 + 0 
2635 : 90 f5 __ BCC $262c ; (nforml.l1040 + 0)
.s10:
2637 : a0 07 __ LDY #$07
2639 : b1 0d __ LDA (P0),y ; (si + 0)
263b : f0 20 __ BEQ $265d ; (nforml.s13 + 0)
.s14:
263d : a0 04 __ LDY #$04
263f : b1 0d __ LDA (P0),y ; (si + 0)
2641 : d0 1a __ BNE $265d ; (nforml.s13 + 0)
.s1013:
2643 : 88 __ __ DEY
2644 : b1 0d __ LDA (P0),y ; (si + 0)
2646 : c9 10 __ CMP #$10
2648 : d0 13 __ BNE $265d ; (nforml.s13 + 0)
.s11:
264a : a9 58 __ LDA #$58
264c : a6 44 __ LDX T2 + 0 
264e : 9d e6 bf STA $bfe6,x ; (wrapbuffer + 78)
2651 : 8a __ __ TXA
2652 : 18 __ __ CLC
2653 : 69 fe __ ADC #$fe
2655 : 85 44 __ STA T2 + 0 
2657 : aa __ __ TAX
2658 : a9 30 __ LDA #$30
265a : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
.s13:
265d : a9 00 __ LDA #$00
265f : 85 1b __ STA ACCU + 0 
2661 : a5 43 __ LDA T0 + 0 
2663 : f0 06 __ BEQ $266b ; (nforml.s16 + 0)
.s15:
2665 : c6 44 __ DEC T2 + 0 
2667 : a9 2d __ LDA #$2d
2669 : d0 0a __ BNE $2675 ; (nforml.s1038 + 0)
.s16:
266b : a0 05 __ LDY #$05
266d : b1 0d __ LDA (P0),y ; (si + 0)
266f : f0 09 __ BEQ $267a ; (nforml.s163 + 0)
.s18:
2671 : c6 44 __ DEC T2 + 0 
2673 : a9 2b __ LDA #$2b
.s1038:
2675 : a6 44 __ LDX T2 + 0 
2677 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
.s163:
267a : a0 06 __ LDY #$06
267c : b1 0d __ LDA (P0),y ; (si + 0)
267e : d0 33 __ BNE $26b3 ; (nforml.s24 + 0)
.l30:
2680 : a0 01 __ LDY #$01
2682 : b1 0d __ LDA (P0),y ; (si + 0)
2684 : 18 __ __ CLC
2685 : 65 44 __ ADC T2 + 0 
2687 : b0 04 __ BCS $268d ; (nforml.s31 + 0)
.s1006:
2689 : c9 11 __ CMP #$11
268b : 90 0d __ BCC $269a ; (nforml.s33 + 0)
.s31:
268d : c6 44 __ DEC T2 + 0 
268f : a0 00 __ LDY #$00
2691 : b1 0d __ LDA (P0),y ; (si + 0)
2693 : a6 44 __ LDX T2 + 0 
2695 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
2698 : b0 e6 __ BCS $2680 ; (nforml.l30 + 0)
.s33:
269a : a6 44 __ LDX T2 + 0 
269c : e0 10 __ CPX #$10
269e : b0 0e __ BCS $26ae ; (nforml.s23 + 0)
.s34:
26a0 : 88 __ __ DEY
.l1035:
26a1 : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 79)
26a4 : 91 0f __ STA (P2),y ; (str + 0)
26a6 : c8 __ __ INY
26a7 : e8 __ __ INX
26a8 : e0 10 __ CPX #$10
26aa : 90 f5 __ BCC $26a1 ; (nforml.l1035 + 0)
.s1036:
26ac : 84 1b __ STY ACCU + 0 
.s23:
26ae : a9 00 __ LDA #$00
26b0 : 85 1c __ STA ACCU + 1 
.s1001:
26b2 : 60 __ __ RTS
.s24:
26b3 : a6 44 __ LDX T2 + 0 
26b5 : e0 10 __ CPX #$10
26b7 : b0 1a __ BCS $26d3 ; (nforml.l27 + 0)
.s25:
26b9 : a0 00 __ LDY #$00
.l1033:
26bb : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 79)
26be : 91 0f __ STA (P2),y ; (str + 0)
26c0 : c8 __ __ INY
26c1 : e8 __ __ INX
26c2 : e0 10 __ CPX #$10
26c4 : 90 f5 __ BCC $26bb ; (nforml.l1033 + 0)
.s1034:
26c6 : 84 1b __ STY ACCU + 0 
26c8 : b0 09 __ BCS $26d3 ; (nforml.l27 + 0)
.s28:
26ca : 88 __ __ DEY
26cb : b1 0d __ LDA (P0),y ; (si + 0)
26cd : a4 1b __ LDY ACCU + 0 
26cf : 91 0f __ STA (P2),y ; (str + 0)
26d1 : e6 1b __ INC ACCU + 0 
.l27:
26d3 : a5 1b __ LDA ACCU + 0 
26d5 : a0 01 __ LDY #$01
26d7 : d1 0d __ CMP (P0),y ; (si + 0)
26d9 : 90 ef __ BCC $26ca ; (nforml.s28 + 0)
26db : 4c ae 26 JMP $26ae ; (nforml.s23 + 0)
.l6:
26de : a5 11 __ LDA P4 ; (v + 0)
26e0 : 85 1b __ STA ACCU + 0 
26e2 : a5 12 __ LDA P5 ; (v + 1)
26e4 : 85 1c __ STA ACCU + 1 
26e6 : a5 13 __ LDA P6 ; (v + 2)
26e8 : 85 1d __ STA ACCU + 2 
26ea : a5 14 __ LDA P7 ; (v + 3)
26ec : 85 1e __ STA ACCU + 3 
26ee : a5 45 __ LDA T5 + 0 
26f0 : 85 03 __ STA WORK + 0 
26f2 : a5 46 __ LDA T5 + 1 
26f4 : 85 04 __ STA WORK + 1 
26f6 : a9 00 __ LDA #$00
26f8 : 85 05 __ STA WORK + 2 
26fa : 85 06 __ STA WORK + 3 
26fc : 20 25 65 JSR $6525 ; (divmod32 + 0)
26ff : a5 08 __ LDA WORK + 5 
2701 : 30 08 __ BMI $270b ; (nforml.s78 + 0)
.s1023:
2703 : d0 0a __ BNE $270f ; (nforml.s77 + 0)
.s1022:
2705 : a5 07 __ LDA WORK + 4 
2707 : c9 0a __ CMP #$0a
2709 : b0 04 __ BCS $270f ; (nforml.s77 + 0)
.s78:
270b : a9 30 __ LDA #$30
270d : d0 02 __ BNE $2711 ; (nforml.s79 + 0)
.s77:
270f : a9 37 __ LDA #$37
.s79:
2711 : c6 44 __ DEC T2 + 0 
2713 : 18 __ __ CLC
2714 : 65 07 __ ADC WORK + 4 
2716 : a6 44 __ LDX T2 + 0 
2718 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
271b : a5 1b __ LDA ACCU + 0 
271d : 85 11 __ STA P4 ; (v + 0)
271f : a5 1c __ LDA ACCU + 1 
2721 : 85 12 __ STA P5 ; (v + 1)
2723 : a5 1d __ LDA ACCU + 2 
2725 : 85 13 __ STA P6 ; (v + 2)
2727 : a5 1e __ LDA ACCU + 3 
2729 : 85 14 __ STA P7 ; (v + 3)
272b : d0 b1 __ BNE $26de ; (nforml.l6 + 0)
.s1018:
272d : a5 13 __ LDA P6 ; (v + 2)
272f : d0 ad __ BNE $26de ; (nforml.l6 + 0)
.s1019:
2731 : a5 12 __ LDA P5 ; (v + 1)
2733 : d0 a9 __ BNE $26de ; (nforml.l6 + 0)
.s1020:
2735 : c5 11 __ CMP P4 ; (v + 0)
2737 : 90 a5 __ BCC $26de ; (nforml.l6 + 0)
2739 : 4c 14 26 JMP $2614 ; (nforml.s7 + 0)
--------------------------------------------------------------------
273c : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
274c : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
275c : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
load_overlay: ; load_overlay(const u8*)->void
.s1000:
2766 : 38 __ __ SEC
2767 : a5 23 __ LDA SP + 0 
2769 : e9 06 __ SBC #$06
276b : 85 23 __ STA SP + 0 
276d : b0 02 __ BCS $2771 ; (load_overlay.s0 + 0)
276f : c6 24 __ DEC SP + 1 
.s0:
2771 : a9 00 __ LDA #$00
2773 : aa __ __ TAX
2774 : 20 68 ff JSR $ff68 
2777 : ad fc bf LDA $bffc ; (sstack + 5)
277a : 85 4e __ STA T0 + 0 
277c : 85 0d __ STA P0 
277e : ad fd bf LDA $bffd ; (sstack + 6)
2781 : 85 4f __ STA T0 + 1 
2783 : 85 0e __ STA P1 
2785 : 20 e9 27 JSR $27e9 ; (krnio_setnam.s0 + 0)
2788 : a5 4e __ LDA T0 + 0 
278a : a0 04 __ LDY #$04
278c : 91 23 __ STA (SP + 0),y 
278e : a5 4f __ LDA T0 + 1 
2790 : c8 __ __ INY
2791 : 91 23 __ STA (SP + 0),y 
2793 : a9 00 __ LDA #$00
2795 : a0 02 __ LDY #$02
2797 : 91 23 __ STA (SP + 0),y 
2799 : a9 28 __ LDA #$28
279b : c8 __ __ INY
279c : 91 23 __ STA (SP + 0),y 
279e : 20 4a 20 JSR $204a ; (printf.s0 + 0)
27a1 : a9 01 __ LDA #$01
27a3 : 85 0d __ STA P0 
27a5 : 85 0f __ STA P2 
27a7 : ad ff 4a LDA $4aff ; (bootdevice + 0)
27aa : 85 0e __ STA P1 
27ac : 20 0d 28 JSR $280d ; (krnio_load.s0 + 0)
27af : 09 00 __ ORA #$00
27b1 : d0 2a __ BNE $27dd ; (load_overlay.s1001 + 0)
.s1:
27b3 : a9 22 __ LDA #$22
27b5 : a0 02 __ LDY #$02
27b7 : 91 23 __ STA (SP + 0),y 
27b9 : a9 28 __ LDA #$28
27bb : c8 __ __ INY
27bc : 91 23 __ STA (SP + 0),y 
27be : 20 4a 20 JSR $204a ; (printf.s0 + 0)
27c1 : a9 40 __ LDA #$40
27c3 : a0 02 __ LDY #$02
27c5 : 91 23 __ STA (SP + 0),y 
27c7 : a9 28 __ LDA #$28
27c9 : c8 __ __ INY
27ca : 91 23 __ STA (SP + 0),y 
27cc : ad 4d 6d LDA $6d4d ; (krnio_pstatus + 1)
27cf : c8 __ __ INY
27d0 : 91 23 __ STA (SP + 0),y 
27d2 : a9 00 __ LDA #$00
27d4 : c8 __ __ INY
27d5 : 91 23 __ STA (SP + 0),y 
27d7 : 20 4a 20 JSR $204a ; (printf.s0 + 0)
27da : 20 4c 28 JSR $284c ; (exit@proxy + 0)
.s1001:
27dd : 18 __ __ CLC
27de : a5 23 __ LDA SP + 0 
27e0 : 69 06 __ ADC #$06
27e2 : 85 23 __ STA SP + 0 
27e4 : 90 02 __ BCC $27e8 ; (load_overlay.s1001 + 11)
27e6 : e6 24 __ INC SP + 1 
27e8 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
27e9 : a5 0d __ LDA P0 
27eb : 05 0e __ ORA P1 
27ed : f0 08 __ BEQ $27f7 ; (krnio_setnam.s0 + 14)
27ef : a0 ff __ LDY #$ff
27f1 : c8 __ __ INY
27f2 : b1 0d __ LDA (P0),y 
27f4 : d0 fb __ BNE $27f1 ; (krnio_setnam.s0 + 8)
27f6 : 98 __ __ TYA
27f7 : a6 0d __ LDX P0 
27f9 : a4 0e __ LDY P1 
27fb : 20 bd ff JSR $ffbd 
.s1001:
27fe : 60 __ __ RTS
--------------------------------------------------------------------
27ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
2800 : __ __ __ BYT 4c 4f 41 44 49 4e 47 3a 20 25 53 0a 00          : LOADING: %S..
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
280d : a5 0d __ LDA P0 
280f : a4 0f __ LDY P2 
2811 : a6 0e __ LDX P1 
2813 : 20 ba ff JSR $ffba 
2816 : a9 00 __ LDA #$00
2818 : a8 __ __ TAY
2819 : 20 d5 ff JSR $ffd5 
281c : a9 00 __ LDA #$00
281e : 2a __ __ ROL
281f : 49 01 __ EOR #$01
.s1001:
2821 : 60 __ __ RTS
--------------------------------------------------------------------
2822 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
2832 : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
2840 : __ __ __ BYT 53 54 41 54 55 53 3a 20 25 44 0a 00             : STATUS: %D..
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
284c : a9 01 __ LDA #$01
284e : 85 0d __ STA P0 
2850 : a9 00 __ LDA #$00
2852 : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
2854 : a5 0d __ LDA P0 
2856 : 85 1b __ STA ACCU + 0 
2858 : a5 0e __ LDA P1 
285a : 85 1c __ STA ACCU + 1 
285c : ae fe 28 LDX $28fe ; (spentry + 0)
285f : 9a __ __ TXS
2860 : a9 4c __ LDA #$4c
2862 : 85 54 __ STA $54 
2864 : a9 00 __ LDA #$00
2866 : 85 13 __ STA P6 
.s1001:
2868 : 60 __ __ RTS
--------------------------------------------------------------------
2869 : __ __ __ BYT 56 44 43 54 45 53 54 4c 4d 43 00                : VDCTESTLMC.
--------------------------------------------------------------------
krill_loadcode: ; krill_loadcode()->void
.s1000:
2874 : 38 __ __ SEC
2875 : a5 23 __ LDA SP + 0 
2877 : e9 04 __ SBC #$04
2879 : 85 23 __ STA SP + 0 
287b : b0 02 __ BCS $287f ; (krill_loadcode.s0 + 0)
287d : c6 24 __ DEC SP + 1 
.s0:
287f : a9 c1 __ LDA #$c1
2881 : a0 02 __ LDY #$02
2883 : 91 23 __ STA (SP + 0),y 
2885 : a9 28 __ LDA #$28
2887 : c8 __ __ INY
2888 : 91 23 __ STA (SP + 0),y 
288a : 20 4a 20 JSR $204a ; (printf.s0 + 0)
288d : a9 e5 __ LDA #$e5
288f : 8d fc bf STA $bffc ; (sstack + 5)
2892 : a9 28 __ LDA #$28
2894 : 8d fd bf STA $bffd ; (sstack + 6)
2897 : 20 66 27 JSR $2766 ; (load_overlay.s1000 + 0)
289a : a9 00 __ LDA #$00
289c : a0 02 __ LDY #$02
289e : 91 23 __ STA (SP + 0),y 
28a0 : a9 29 __ LDA #$29
28a2 : c8 __ __ INY
28a3 : 91 23 __ STA (SP + 0),y 
28a5 : 20 4a 20 JSR $204a ; (printf.s0 + 0)
28a8 : a9 f2 __ LDA #$f2
28aa : 8d fc bf STA $bffc ; (sstack + 5)
28ad : a9 28 __ LDA #$28
28af : 8d fd bf STA $bffd ; (sstack + 6)
28b2 : 20 66 27 JSR $2766 ; (load_overlay.s1000 + 0)
.s1001:
28b5 : 18 __ __ CLC
28b6 : a5 23 __ LDA SP + 0 
28b8 : 69 04 __ ADC #$04
28ba : 85 23 __ STA SP + 0 
28bc : 90 02 __ BCC $28c0 ; (krill_loadcode.s1001 + 11)
28be : e6 24 __ INC SP + 1 
28c0 : 60 __ __ RTS
--------------------------------------------------------------------
28c1 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4b 52 49 4c 4c 27 53 20 : LOADING KRILL'S 
28d1 : __ __ __ BYT 4c 4f 41 44 45 52 3a 20 49 4e 53 54 41 4c 4c 45 : LOADER: INSTALLE
28e1 : __ __ __ BYT 52 2e 0a 00                                     : R...
--------------------------------------------------------------------
28e5 : __ __ __ BYT 49 4e 53 54 41 4c 4c 2d 43 31 32 38 00          : INSTALL-C128.
--------------------------------------------------------------------
28f2 : __ __ __ BYT 4c 4f 41 44 45 52 2d 43 31 32 38 00             : LOADER-C128.
--------------------------------------------------------------------
spentry:
28fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
28ff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
2900 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4b 52 49 4c 4c 27 53 20 : LOADING KRILL'S 
2910 : __ __ __ BYT 4c 4f 41 44 45 52 3a 20 52 45 53 49 44 45 4e 54 : LOADER: RESIDENT
2920 : __ __ __ BYT 20 43 4f 44 45 2e 0a 00                         :  CODE...
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
2928 : 38 __ __ SEC
2929 : a5 23 __ LDA SP + 0 
292b : e9 04 __ SBC #$04
292d : 85 23 __ STA SP + 0 
292f : b0 02 __ BCS $2933 ; (vdc_init.s0 + 0)
2931 : c6 24 __ DEC SP + 1 
.s0:
2933 : a9 1a __ LDA #$1a
2935 : 8d 00 d6 STA $d600 
.l463:
2938 : 2c 00 d6 BIT $d600 
293b : 10 fb __ BPL $2938 ; (vdc_init.l463 + 0)
.s7:
293d : ad 01 d6 LDA $d601 
2940 : 29 f0 __ AND #$f0
2942 : aa __ __ TAX
2943 : a9 1a __ LDA #$1a
2945 : 8d 00 d6 STA $d600 
.l465:
2948 : 2c 00 d6 BIT $d600 
294b : 10 fb __ BPL $2948 ; (vdc_init.l465 + 0)
.s13:
294d : 8e 01 d6 STX $d601 
2950 : 8d 00 d6 STA $d600 
.l467:
2953 : 2c 00 d6 BIT $d600 
2956 : 10 fb __ BPL $2953 ; (vdc_init.l467 + 0)
.s20:
2958 : ad 01 d6 LDA $d601 
295b : 29 0f __ AND #$0f
295d : 09 d0 __ ORA #$d0
295f : a2 1a __ LDX #$1a
2961 : 8e 00 d6 STX $d600 
.l469:
2964 : 2c 00 d6 BIT $d600 
2967 : 10 fb __ BPL $2964 ; (vdc_init.l469 + 0)
.s26:
2969 : 8d 01 d6 STA $d601 
296c : a9 8d __ LDA #$8d
296e : 8d 63 6d STA $6d63 ; (vdc_state + 7)
2971 : a9 1c __ LDA #$1c
2973 : 8d 00 d6 STA $d600 
.l471:
2976 : 2c 00 d6 BIT $d600 
2979 : 10 fb __ BPL $2976 ; (vdc_init.l471 + 0)
.s32:
297b : ad 01 d6 LDA $d601 
297e : aa __ __ TAX
297f : 09 10 __ ORA #$10
2981 : a0 1c __ LDY #$1c
2983 : 8c 00 d6 STY $d600 
.l473:
2986 : 2c 00 d6 BIT $d600 
2989 : 10 fb __ BPL $2986 ; (vdc_init.l473 + 0)
.s39:
298b : 8d 01 d6 STA $d601 
298e : a9 12 __ LDA #$12
2990 : 8d 00 d6 STA $d600 
.l475:
2993 : 2c 00 d6 BIT $d600 
2996 : 10 fb __ BPL $2993 ; (vdc_init.l475 + 0)
.s46:
2998 : a9 1f __ LDA #$1f
299a : 8d 01 d6 STA $d601 
299d : a9 13 __ LDA #$13
299f : 8d 00 d6 STA $d600 
.l477:
29a2 : 2c 00 d6 BIT $d600 
29a5 : 10 fb __ BPL $29a2 ; (vdc_init.l477 + 0)
.s51:
29a7 : a9 ff __ LDA #$ff
29a9 : 8d 01 d6 STA $d601 
29ac : a9 1f __ LDA #$1f
29ae : 8d 00 d6 STA $d600 
.l479:
29b1 : 2c 00 d6 BIT $d600 
29b4 : 10 fb __ BPL $29b1 ; (vdc_init.l479 + 0)
.s55:
29b6 : a9 00 __ LDA #$00
29b8 : 8d 01 d6 STA $d601 
29bb : a9 12 __ LDA #$12
29bd : 8d 00 d6 STA $d600 
.l481:
29c0 : 2c 00 d6 BIT $d600 
29c3 : 10 fb __ BPL $29c0 ; (vdc_init.l481 + 0)
.s62:
29c5 : a9 9f __ LDA #$9f
29c7 : 8d 01 d6 STA $d601 
29ca : a9 13 __ LDA #$13
29cc : 8d 00 d6 STA $d600 
.l483:
29cf : 2c 00 d6 BIT $d600 
29d2 : 10 fb __ BPL $29cf ; (vdc_init.l483 + 0)
.s67:
29d4 : a9 ff __ LDA #$ff
29d6 : 8d 01 d6 STA $d601 
29d9 : a9 1f __ LDA #$1f
29db : 8d 00 d6 STA $d600 
.l485:
29de : 2c 00 d6 BIT $d600 
29e1 : 10 fb __ BPL $29de ; (vdc_init.l485 + 0)
.s71:
29e3 : a9 ff __ LDA #$ff
29e5 : 8d 01 d6 STA $d601 
29e8 : a9 12 __ LDA #$12
29ea : 8d 00 d6 STA $d600 
.l487:
29ed : 2c 00 d6 BIT $d600 
29f0 : 10 fb __ BPL $29ed ; (vdc_init.l487 + 0)
.s78:
29f2 : a9 1f __ LDA #$1f
29f4 : 8d 01 d6 STA $d601 
29f7 : a9 13 __ LDA #$13
29f9 : 8d 00 d6 STA $d600 
.l489:
29fc : 2c 00 d6 BIT $d600 
29ff : 10 fb __ BPL $29fc ; (vdc_init.l489 + 0)
.s83:
2a01 : a9 ff __ LDA #$ff
2a03 : 8d 01 d6 STA $d601 
2a06 : a9 1f __ LDA #$1f
2a08 : 8d 00 d6 STA $d600 
.l491:
2a0b : 2c 00 d6 BIT $d600 
2a0e : 10 fb __ BPL $2a0b ; (vdc_init.l491 + 0)
.s87:
2a10 : ad 01 d6 LDA $d601 
2a13 : f0 04 __ BEQ $2a19 ; (vdc_init.s1038 + 0)
.s1039:
2a15 : a9 10 __ LDA #$10
2a17 : d0 02 __ BNE $2a1b ; (vdc_init.s1040 + 0)
.s1038:
2a19 : a9 40 __ LDA #$40
.s1040:
2a1b : 8d 5c 6d STA $6d5c ; (vdc_state + 0)
2a1e : 8c 00 d6 STY $d600 
.l494:
2a21 : 2c 00 d6 BIT $d600 
2a24 : 10 fb __ BPL $2a21 ; (vdc_init.l494 + 0)
.s94:
2a26 : 8e 01 d6 STX $d601 
2a29 : 20 65 2a JSR $2a65 ; (vdc_cls.s0 + 0)
2a2c : 24 d7 __ BIT $d7 
2a2e : 30 17 __ BMI $2a47 ; (vdc_init.s97 + 0)
.s100:
2a30 : a9 72 __ LDA #$72
2a32 : a0 02 __ LDY #$02
2a34 : 91 23 __ STA (SP + 0),y 
2a36 : a9 2b __ LDA #$2b
2a38 : c8 __ __ INY
2a39 : 91 23 __ STA (SP + 0),y 
2a3b : 20 4a 20 JSR $204a ; (printf.s0 + 0)
2a3e : 20 9d 2b JSR $2b9d ; (getch.s0 + 0)
2a41 : 20 81 ff JSR $ff81 
2a44 : 20 da 2b JSR $2bda ; (screen_setmode.s0 + 0)
.s97:
2a47 : a9 01 __ LDA #$01
2a49 : 20 e2 2b JSR $2be2 ; (fastmode.s0 + 0)
2a4c : 20 01 2c JSR $2c01 ; (vdc_set_mode@proxy + 0)
2a4f : ad 5c 6d LDA $6d5c ; (vdc_state + 0)
2a52 : c9 40 __ CMP #$40
2a54 : d0 03 __ BNE $2a59 ; (vdc_init.s1001 + 0)
.s107:
2a56 : 20 fa 2d JSR $2dfa ; (vdc_set_extended_memsize.s0 + 0)
.s1001:
2a59 : 18 __ __ CLC
2a5a : a5 23 __ LDA SP + 0 
2a5c : 69 04 __ ADC #$04
2a5e : 85 23 __ STA SP + 0 
2a60 : 90 02 __ BCC $2a64 ; (vdc_init.s1001 + 11)
2a62 : e6 24 __ INC SP + 1 
2a64 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
2a65 : a9 00 __ LDA #$00
2a67 : 85 0f __ STA P2 
2a69 : 85 14 __ STA P7 
2a6b : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
2a6e : 85 13 __ STA P6 
2a70 : a9 20 __ LDA #$20
2a72 : 85 11 __ STA P4 
2a74 : ad 61 6d LDA $6d61 ; (vdc_state + 5)
2a77 : 85 15 __ STA P8 
--------------------------------------------------------------------
vdc_clear: ; vdc_clear(u8,u8,u8,u8,u8)->void
.s0:
2a79 : 18 __ __ CLC
2a7a : a5 14 __ LDA P7 ; (y + 0)
2a7c : 65 15 __ ADC P8 ; (lines + 0)
2a7e : 85 46 __ STA T1 + 0 
2a80 : a9 00 __ LDA #$00
2a82 : 2a __ __ ROL
2a83 : 85 47 __ STA T1 + 1 
2a85 : 90 09 __ BCC $2a90 ; (vdc_clear.l1 + 0)
.s2:
2a87 : 85 10 __ STA P3 
2a89 : 20 9e 2a JSR $2a9e ; (vdc_hchar@proxy + 0)
2a8c : e6 14 __ INC P7 ; (y + 0)
2a8e : a5 47 __ LDA T1 + 1 
.l1:
2a90 : f0 05 __ BEQ $2a97 ; (vdc_clear.s1002 + 0)
.s1004:
2a92 : a5 14 __ LDA P7 ; (y + 0)
2a94 : 4c 87 2a JMP $2a87 ; (vdc_clear.s2 + 0)
.s1002:
2a97 : a5 14 __ LDA P7 ; (y + 0)
2a99 : c5 46 __ CMP T1 + 0 
2a9b : 90 ea __ BCC $2a87 ; (vdc_clear.s2 + 0)
.s1001:
2a9d : 60 __ __ RTS
--------------------------------------------------------------------
vdc_hchar@proxy: ; vdc_hchar@proxy
2a9e : ad 63 6d LDA $6d63 ; (vdc_state + 7)
2aa1 : 85 12 __ STA P5 
--------------------------------------------------------------------
vdc_hchar: ; vdc_hchar(u8,u8,u8,u8,u8)->void
.s0:
2aa3 : a5 10 __ LDA P3 ; (y + 0)
2aa5 : 0a __ __ ASL
2aa6 : aa __ __ TAX
2aa7 : bd 00 6f LDA $6f00,x ; (multab + 0)
2aaa : 18 __ __ CLC
2aab : 65 0f __ ADC P2 ; (x + 0)
2aad : 85 43 __ STA T1 + 0 
2aaf : bd 01 6f LDA $6f01,x ; (multab + 1)
2ab2 : 69 00 __ ADC #$00
2ab4 : 85 44 __ STA T1 + 1 
2ab6 : ad 64 6d LDA $6d64 ; (vdc_state + 8)
2ab9 : 18 __ __ CLC
2aba : 65 43 __ ADC T1 + 0 
2abc : 85 0d __ STA P0 
2abe : ad 65 6d LDA $6d65 ; (vdc_state + 9)
2ac1 : 65 44 __ ADC T1 + 1 
2ac3 : 85 0e __ STA P1 
2ac5 : 20 4e 2b JSR $2b4e ; (vdc_mem_addr.s0 + 0)
2ac8 : a6 13 __ LDX P6 ; (length + 0)
2aca : ca __ __ DEX
2acb : 86 45 __ STX T2 + 0 
.l221:
2acd : 2c 00 d6 BIT $d600 
2ad0 : 10 fb __ BPL $2acd ; (vdc_hchar.l221 + 0)
.s6:
2ad2 : a5 11 __ LDA P4 ; (val + 0)
2ad4 : 8d 01 d6 STA $d601 
2ad7 : a2 18 __ LDX #$18
2ad9 : 8e 00 d6 STX $d600 
.l223:
2adc : 2c 00 d6 BIT $d600 
2adf : 10 fb __ BPL $2adc ; (vdc_hchar.l223 + 0)
.s12:
2ae1 : ad 01 d6 LDA $d601 
2ae4 : 29 7f __ AND #$7f
2ae6 : 8e 00 d6 STX $d600 
.l225:
2ae9 : 2c 00 d6 BIT $d600 
2aec : 10 fb __ BPL $2ae9 ; (vdc_hchar.l225 + 0)
.s18:
2aee : 8d 01 d6 STA $d601 
2af1 : a9 1e __ LDA #$1e
2af3 : 8d 00 d6 STA $d600 
.l227:
2af6 : 2c 00 d6 BIT $d600 
2af9 : 10 fb __ BPL $2af6 ; (vdc_hchar.l227 + 0)
.s23:
2afb : a5 45 __ LDA T2 + 0 
2afd : 8d 01 d6 STA $d601 
2b00 : ad 66 6d LDA $6d66 ; (vdc_state + 10)
2b03 : 18 __ __ CLC
2b04 : 65 43 __ ADC T1 + 0 
2b06 : 85 0d __ STA P0 
2b08 : ad 67 6d LDA $6d67 ; (vdc_state + 11)
2b0b : 65 44 __ ADC T1 + 1 
2b0d : 85 0e __ STA P1 
2b0f : 20 4e 2b JSR $2b4e ; (vdc_mem_addr.s0 + 0)
.l229:
2b12 : 2c 00 d6 BIT $d600 
2b15 : 10 fb __ BPL $2b12 ; (vdc_hchar.l229 + 0)
.s27:
2b17 : a5 12 __ LDA P5 ; (attr + 0)
2b19 : 8d 01 d6 STA $d601 
2b1c : a2 18 __ LDX #$18
2b1e : 8e 00 d6 STX $d600 
.l231:
2b21 : 2c 00 d6 BIT $d600 
2b24 : 10 fb __ BPL $2b21 ; (vdc_hchar.l231 + 0)
.s33:
2b26 : ad 01 d6 LDA $d601 
2b29 : 29 7f __ AND #$7f
2b2b : 8e 00 d6 STX $d600 
.l233:
2b2e : 2c 00 d6 BIT $d600 
2b31 : 10 fb __ BPL $2b2e ; (vdc_hchar.l233 + 0)
.s39:
2b33 : 8d 01 d6 STA $d601 
2b36 : a9 1e __ LDA #$1e
2b38 : 8d 00 d6 STA $d600 
.l235:
2b3b : 2c 00 d6 BIT $d600 
2b3e : 10 fb __ BPL $2b3b ; (vdc_hchar.l235 + 0)
.s44:
2b40 : a5 45 __ LDA T2 + 0 
2b42 : 8d 01 d6 STA $d601 
.s1001:
2b45 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
2b46 : a5 0f __ LDA P2 
2b48 : 85 0d __ STA P0 
2b4a : a5 10 __ LDA P3 
2b4c : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
2b4e : a9 12 __ LDA #$12
2b50 : 8d 00 d6 STA $d600 
.l56:
2b53 : 2c 00 d6 BIT $d600 
2b56 : 10 fb __ BPL $2b53 ; (vdc_mem_addr.l56 + 0)
.s5:
2b58 : a5 0e __ LDA P1 ; (addr + 1)
2b5a : 8d 01 d6 STA $d601 
2b5d : a9 13 __ LDA #$13
2b5f : 8d 00 d6 STA $d600 
.l58:
2b62 : 2c 00 d6 BIT $d600 
2b65 : 10 fb __ BPL $2b62 ; (vdc_mem_addr.l58 + 0)
.s10:
2b67 : a5 0d __ LDA P0 ; (addr + 0)
2b69 : 8d 01 d6 STA $d601 
2b6c : a9 1f __ LDA #$1f
2b6e : 8d 00 d6 STA $d600 
.s1001:
2b71 : 60 __ __ RTS
--------------------------------------------------------------------
2b72 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2b82 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2b92 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->u8
.s0:
2b9d : 20 a9 2b JSR $2ba9 ; (getpch + 0)
2ba0 : c9 00 __ CMP #$00
2ba2 : f0 f9 __ BEQ $2b9d ; (getch.s0 + 0)
2ba4 : 85 1b __ STA ACCU + 0 
.s1001:
2ba6 : a5 1b __ LDA ACCU + 0 
2ba8 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
2ba9 : 20 e4 ff JSR $ffe4 
2bac : ae ff 28 LDX $28ff ; (giocharmap + 0)
2baf : e0 01 __ CPX #$01
2bb1 : 90 26 __ BCC $2bd9 ; (getpch + 48)
2bb3 : c9 0d __ CMP #$0d
2bb5 : d0 02 __ BNE $2bb9 ; (getpch + 16)
2bb7 : a9 0a __ LDA #$0a
2bb9 : e0 02 __ CPX #$02
2bbb : 90 1c __ BCC $2bd9 ; (getpch + 48)
2bbd : c9 db __ CMP #$db
2bbf : b0 18 __ BCS $2bd9 ; (getpch + 48)
2bc1 : c9 41 __ CMP #$41
2bc3 : 90 14 __ BCC $2bd9 ; (getpch + 48)
2bc5 : c9 c1 __ CMP #$c1
2bc7 : 90 02 __ BCC $2bcb ; (getpch + 34)
2bc9 : 49 a0 __ EOR #$a0
2bcb : c9 7b __ CMP #$7b
2bcd : b0 0a __ BCS $2bd9 ; (getpch + 48)
2bcf : c9 61 __ CMP #$61
2bd1 : b0 04 __ BCS $2bd7 ; (getpch + 46)
2bd3 : c9 5b __ CMP #$5b
2bd5 : b0 02 __ BCS $2bd9 ; (getpch + 48)
2bd7 : 49 20 __ EOR #$20
2bd9 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2bda : 24 d7 __ BIT $d7 
2bdc : 10 01 __ BPL $2bdf ; (screen_setmode.s6 + 0)
.s1001:
2bde : 60 __ __ RTS
.s6:
2bdf : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2be2 : 09 00 __ ORA #$00
2be4 : d0 0d __ BNE $2bf3 ; (fastmode.s1 + 0)
.s2:
2be6 : 8d 30 d0 STA $d030 
2be9 : ad 11 d0 LDA $d011 
2bec : 29 7f __ AND #$7f
2bee : 09 10 __ ORA #$10
2bf0 : 4c fd 2b JMP $2bfd ; (fastmode.s3 + 0)
.s1:
2bf3 : a9 01 __ LDA #$01
2bf5 : 8d 30 d0 STA $d030 
2bf8 : ad 11 d0 LDA $d011 
2bfb : 29 6f __ AND #$6f
.s3:
2bfd : 8d 11 d0 STA $d011 
.s1001:
2c00 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode@proxy: ; vdc_set_mode@proxy
2c01 : a9 00 __ LDA #$00
2c03 : 85 16 __ STA P9 
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
2c05 : a5 53 __ LDA T5 + 0 
2c07 : 8d f5 bf STA $bff5 ; (buffer + 14)
2c0a : a5 54 __ LDA T5 + 1 
2c0c : 8d f6 bf STA $bff6 ; (buffer + 15)
.s0:
2c0f : a4 16 __ LDY P9 ; (mode + 0)
2c11 : be fa 3f LDX $3ffa,y ; (__multab36L + 0)
2c14 : 86 4b __ STX T1 + 0 
2c16 : 86 4d __ STX T2 + 0 
2c18 : bd 04 69 LDA $6904,x ; (vdc_modes + 4)
2c1b : f0 0a __ BEQ $2c27 ; (vdc_set_mode.s3 + 0)
.s4:
2c1d : ad 5c 6d LDA $6d5c ; (vdc_state + 0)
2c20 : c9 10 __ CMP #$10
2c22 : d0 03 __ BNE $2c27 ; (vdc_set_mode.s3 + 0)
2c24 : 4c 80 2d JMP $2d80 ; (vdc_set_mode.s1001 + 0)
.s3:
2c27 : 8c 5e 6d STY $6d5e ; (vdc_state + 2)
2c2a : a9 00 __ LDA #$00
2c2c : 8d 72 6d STA $6d72 ; (vdc_state + 22)
2c2f : 8d 73 6d STA $6d73 ; (vdc_state + 23)
2c32 : 8d 74 6d STA $6d74 ; (vdc_state + 24)
2c35 : bd 00 69 LDA $6900,x ; (vdc_modes + 0)
2c38 : 8d 5f 6d STA $6d5f ; (vdc_state + 3)
2c3b : bd 01 69 LDA $6901,x ; (vdc_modes + 1)
2c3e : 8d 60 6d STA $6d60 ; (vdc_state + 4)
2c41 : bd 02 69 LDA $6902,x ; (vdc_modes + 2)
2c44 : 8d 61 6d STA $6d61 ; (vdc_state + 5)
2c47 : bd 03 69 LDA $6903,x ; (vdc_modes + 3)
2c4a : 8d 62 6d STA $6d62 ; (vdc_state + 6)
2c4d : bd 09 69 LDA $6909,x ; (vdc_modes + 9)
2c50 : 8d 68 6d STA $6d68 ; (vdc_state + 12)
2c53 : bd 0a 69 LDA $690a,x ; (vdc_modes + 10)
2c56 : 8d 69 6d STA $6d69 ; (vdc_state + 13)
2c59 : bd 0b 69 LDA $690b,x ; (vdc_modes + 11)
2c5c : 8d 6a 6d STA $6d6a ; (vdc_state + 14)
2c5f : bd 0c 69 LDA $690c,x ; (vdc_modes + 12)
2c62 : 8d 6b 6d STA $6d6b ; (vdc_state + 15)
2c65 : bd 0d 69 LDA $690d,x ; (vdc_modes + 13)
2c68 : 8d 6c 6d STA $6d6c ; (vdc_state + 16)
2c6b : bd 0e 69 LDA $690e,x ; (vdc_modes + 14)
2c6e : 8d 6d 6d STA $6d6d ; (vdc_state + 17)
2c71 : bd 0f 69 LDA $690f,x ; (vdc_modes + 15)
2c74 : 8d 6e 6d STA $6d6e ; (vdc_state + 18)
2c77 : bd 10 69 LDA $6910,x ; (vdc_modes + 16)
2c7a : 8d 6f 6d STA $6d6f ; (vdc_state + 19)
2c7d : bd 11 69 LDA $6911,x ; (vdc_modes + 17)
2c80 : 8d 70 6d STA $6d70 ; (vdc_state + 20)
2c83 : bd 12 69 LDA $6912,x ; (vdc_modes + 18)
2c86 : 8d 71 6d STA $6d71 ; (vdc_state + 21)
2c89 : bd 05 69 LDA $6905,x ; (vdc_modes + 5)
2c8c : 85 4e __ STA T3 + 0 
2c8e : 8d 64 6d STA $6d64 ; (vdc_state + 8)
2c91 : bd 06 69 LDA $6906,x ; (vdc_modes + 6)
2c94 : 85 4f __ STA T3 + 1 
2c96 : 8d 65 6d STA $6d65 ; (vdc_state + 9)
2c99 : bd 07 69 LDA $6907,x ; (vdc_modes + 7)
2c9c : 85 53 __ STA T5 + 0 
2c9e : 8d 66 6d STA $6d66 ; (vdc_state + 10)
2ca1 : bd 08 69 LDA $6908,x ; (vdc_modes + 8)
2ca4 : 85 54 __ STA T5 + 1 
2ca6 : 8d 67 6d STA $6d67 ; (vdc_state + 11)
2ca9 : 20 8b 2d JSR $2d8b ; (vdc_set_multab.s0 + 0)
2cac : a9 22 __ LDA #$22
2cae : 8d 00 d6 STA $d600 
.l295:
2cb1 : 2c 00 d6 BIT $d600 
2cb4 : 10 fb __ BPL $2cb1 ; (vdc_set_mode.l295 + 0)
.s11:
2cb6 : a9 80 __ LDA #$80
2cb8 : 8d 01 d6 STA $d601 
2cbb : a9 0c __ LDA #$0c
2cbd : 8d 00 d6 STA $d600 
.l297:
2cc0 : 2c 00 d6 BIT $d600 
2cc3 : 10 fb __ BPL $2cc0 ; (vdc_set_mode.l297 + 0)
.s17:
2cc5 : a5 4f __ LDA T3 + 1 
2cc7 : 8d 01 d6 STA $d601 
2cca : a9 0d __ LDA #$0d
2ccc : 8d 00 d6 STA $d600 
.l299:
2ccf : 2c 00 d6 BIT $d600 
2cd2 : 10 fb __ BPL $2ccf ; (vdc_set_mode.l299 + 0)
.s22:
2cd4 : a5 4e __ LDA T3 + 0 
2cd6 : 8d 01 d6 STA $d601 
2cd9 : a9 14 __ LDA #$14
2cdb : 8d 00 d6 STA $d600 
.l301:
2cde : 2c 00 d6 BIT $d600 
2ce1 : 10 fb __ BPL $2cde ; (vdc_set_mode.l301 + 0)
.s27:
2ce3 : a5 54 __ LDA T5 + 1 
2ce5 : 8d 01 d6 STA $d601 
2ce8 : a9 15 __ LDA #$15
2cea : 8d 00 d6 STA $d600 
.l303:
2ced : 2c 00 d6 BIT $d600 
2cf0 : 10 fb __ BPL $2ced ; (vdc_set_mode.l303 + 0)
.s32:
2cf2 : a5 53 __ LDA T5 + 0 
2cf4 : 8d 01 d6 STA $d601 
2cf7 : a6 4b __ LDX T1 + 0 
2cf9 : bd 0e 69 LDA $690e,x ; (vdc_modes + 14)
2cfc : a2 1c __ LDX #$1c
2cfe : 8e 00 d6 STX $d600 
.l305:
2d01 : 2c 00 d6 BIT $d600 
2d04 : 10 fb __ BPL $2d01 ; (vdc_set_mode.l305 + 0)
.s39:
2d06 : aa __ __ TAX
2d07 : ad 01 d6 LDA $d601 
2d0a : 29 10 __ AND #$10
2d0c : 85 53 __ STA T5 + 0 
2d0e : a9 1c __ LDA #$1c
2d10 : 8d 00 d6 STA $d600 
2d13 : 8a __ __ TXA
2d14 : 29 e0 __ AND #$e0
2d16 : 05 53 __ ORA T5 + 0 
.l307:
2d18 : 2c 00 d6 BIT $d600 
2d1b : 10 fb __ BPL $2d18 ; (vdc_set_mode.l307 + 0)
.s45:
2d1d : 8d 01 d6 STA $d601 
2d20 : 20 db 2d JSR $2ddb ; (vdc_restore_charsets.s0 + 0)
2d23 : 18 __ __ CLC
2d24 : a9 13 __ LDA #$13
2d26 : 65 4b __ ADC T1 + 0 
2d28 : 85 4b __ STA T1 + 0 
2d2a : a9 69 __ LDA #$69
2d2c : 69 00 __ ADC #$00
2d2e : 85 4c __ STA T1 + 1 
2d30 : 18 __ __ CLC
2d31 : a5 4d __ LDA T2 + 0 
2d33 : 69 13 __ ADC #$13
2d35 : 85 4e __ STA T3 + 0 
2d37 : a9 00 __ LDA #$00
2d39 : 85 43 __ STA T0 + 0 
2d3b : 69 69 __ ADC #$69
2d3d : 85 4f __ STA T3 + 1 
.l46:
2d3f : a4 43 __ LDY T0 + 0 
2d41 : b1 4b __ LDA (T1 + 0),y 
2d43 : 85 47 __ STA T7 + 0 
2d45 : c8 __ __ INY
2d46 : b1 4b __ LDA (T1 + 0),y 
2d48 : aa __ __ TAX
2d49 : a5 47 __ LDA T7 + 0 
2d4b : 8d 00 d6 STA $d600 
2d4e : c8 __ __ INY
2d4f : 84 43 __ STY T0 + 0 
.l309:
2d51 : 2c 00 d6 BIT $d600 
2d54 : 10 fb __ BPL $2d51 ; (vdc_set_mode.l309 + 0)
.s52:
2d56 : 8e 01 d6 STX $d601 
2d59 : b1 4e __ LDA (T3 + 0),y 
2d5b : c9 ff __ CMP #$ff
2d5d : d0 e0 __ BNE $2d3f ; (vdc_set_mode.l46 + 0)
.s47:
2d5f : a6 4d __ LDX T2 + 0 
2d61 : bd 04 69 LDA $6904,x ; (vdc_modes + 4)
2d64 : f0 08 __ BEQ $2d6e ; (vdc_set_mode.s55 + 0)
.s56:
2d66 : ad 5d 6d LDA $6d5d ; (vdc_state + 1)
2d69 : d0 03 __ BNE $2d6e ; (vdc_set_mode.s55 + 0)
.s53:
2d6b : 20 fa 2d JSR $2dfa ; (vdc_set_extended_memsize.s0 + 0)
.s55:
2d6e : 20 65 2a JSR $2a65 ; (vdc_cls.s0 + 0)
2d71 : a9 22 __ LDA #$22
2d73 : 8d 00 d6 STA $d600 
.l314:
2d76 : 2c 00 d6 BIT $d600 
2d79 : 10 fb __ BPL $2d76 ; (vdc_set_mode.l314 + 0)
.s62:
2d7b : a9 7d __ LDA #$7d
2d7d : 8d 01 d6 STA $d601 
.s1001:
2d80 : ad f5 bf LDA $bff5 ; (buffer + 14)
2d83 : 85 53 __ STA T5 + 0 
2d85 : ad f6 bf LDA $bff6 ; (buffer + 15)
2d88 : 85 54 __ STA T5 + 1 
2d8a : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
2d8b : ad 61 6d LDA $6d61 ; (vdc_state + 5)
2d8e : 0d 62 6d ORA $6d62 ; (vdc_state + 6)
2d91 : f0 47 __ BEQ $2dda ; (vdc_set_multab.s1001 + 0)
.s5:
2d93 : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
2d96 : 18 __ __ CLC
2d97 : 6d 74 6d ADC $6d74 ; (vdc_state + 24)
2d9a : 85 1b __ STA ACCU + 0 
2d9c : ad 60 6d LDA $6d60 ; (vdc_state + 4)
2d9f : 69 00 __ ADC #$00
2da1 : 85 1c __ STA ACCU + 1 
2da3 : a9 00 __ LDA #$00
2da5 : 85 43 __ STA T3 + 0 
2da7 : 85 44 __ STA T3 + 1 
2da9 : a9 00 __ LDA #$00
2dab : 85 45 __ STA T4 + 0 
2dad : a9 6f __ LDA #$6f
2daf : 85 46 __ STA T4 + 1 
2db1 : ae 61 6d LDX $6d61 ; (vdc_state + 5)
.l1002:
2db4 : a5 43 __ LDA T3 + 0 
2db6 : a0 00 __ LDY #$00
2db8 : 91 45 __ STA (T4 + 0),y 
2dba : a5 44 __ LDA T3 + 1 
2dbc : c8 __ __ INY
2dbd : 91 45 __ STA (T4 + 0),y 
2dbf : 18 __ __ CLC
2dc0 : a5 1b __ LDA ACCU + 0 
2dc2 : 65 43 __ ADC T3 + 0 
2dc4 : 85 43 __ STA T3 + 0 
2dc6 : a5 1c __ LDA ACCU + 1 
2dc8 : 65 44 __ ADC T3 + 1 
2dca : 85 44 __ STA T3 + 1 
2dcc : 18 __ __ CLC
2dcd : a5 45 __ LDA T4 + 0 
2dcf : 69 02 __ ADC #$02
2dd1 : 85 45 __ STA T4 + 0 
2dd3 : 90 02 __ BCC $2dd7 ; (vdc_set_multab.s1005 + 0)
.s1004:
2dd5 : e6 46 __ INC T4 + 1 
.s1005:
2dd7 : ca __ __ DEX
2dd8 : d0 da __ BNE $2db4 ; (vdc_set_multab.l1002 + 0)
.s1001:
2dda : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
2ddb : ad 6c 6d LDA $6d6c ; (vdc_state + 16)
2dde : 85 0f __ STA P2 
2de0 : a9 01 __ LDA #$01
2de2 : 85 11 __ STA P4 
2de4 : a9 02 __ LDA #$02
2de6 : 85 15 __ STA P8 
2de8 : ad 6d 6d LDA $6d6d ; (vdc_state + 17)
2deb : 85 10 __ STA P3 
2ded : a9 00 __ LDA #$00
2def : 85 14 __ STA P7 
2df1 : 85 12 __ STA P5 
2df3 : a9 d0 __ LDA #$d0
2df5 : 85 13 __ STA P6 
2df7 : 4c 00 13 JMP $1300 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
2dfa : ad 5c 6d LDA $6d5c ; (vdc_state + 0)
2dfd : c9 10 __ CMP #$10
2dff : d0 01 __ BNE $2e02 ; (vdc_set_extended_memsize.s4 + 0)
2e01 : 60 __ __ RTS
.s4:
2e02 : ad 5d 6d LDA $6d5d ; (vdc_state + 1)
2e05 : f0 01 __ BEQ $2e08 ; (vdc_set_extended_memsize.s3 + 0)
2e07 : 60 __ __ RTS
.s3:
2e08 : a2 22 __ LDX #$22
2e0a : 8e 00 d6 STX $d600 
.l380:
2e0d : 2c 00 d6 BIT $d600 
2e10 : 10 fb __ BPL $2e0d ; (vdc_set_extended_memsize.l380 + 0)
.s11:
2e12 : 85 4a __ STA T1 + 1 
2e14 : 85 0d __ STA P0 
2e16 : a9 80 __ LDA #$80
2e18 : 8d 01 d6 STA $d601 
2e1b : a9 ff __ LDA #$ff
2e1d : 85 48 __ STA T0 + 0 
.l14:
2e1f : 20 05 68 JSR $6805 ; (vdc_mem_addr@proxy + 0)
.l382:
2e22 : 2c 00 d6 BIT $d600 
2e25 : 10 fb __ BPL $2e22 ; (vdc_set_extended_memsize.l382 + 0)
.s20:
2e27 : a9 00 __ LDA #$00
2e29 : 8d 01 d6 STA $d601 
2e2c : a2 18 __ LDX #$18
2e2e : 8e 00 d6 STX $d600 
.l384:
2e31 : 2c 00 d6 BIT $d600 
2e34 : 10 fb __ BPL $2e31 ; (vdc_set_extended_memsize.l384 + 0)
.s26:
2e36 : ad 01 d6 LDA $d601 
2e39 : 29 7f __ AND #$7f
2e3b : 8e 00 d6 STX $d600 
.l386:
2e3e : 2c 00 d6 BIT $d600 
2e41 : 10 fb __ BPL $2e3e ; (vdc_set_extended_memsize.l386 + 0)
.s32:
2e43 : 8d 01 d6 STA $d601 
2e46 : a9 1e __ LDA #$1e
2e48 : 8d 00 d6 STA $d600 
.l388:
2e4b : 2c 00 d6 BIT $d600 
2e4e : 10 fb __ BPL $2e4b ; (vdc_set_extended_memsize.l388 + 0)
.s37:
2e50 : e6 4a __ INC T1 + 1 
2e52 : a9 ff __ LDA #$ff
2e54 : 8d 01 d6 STA $d601 
2e57 : c6 48 __ DEC T0 + 0 
2e59 : d0 c4 __ BNE $2e1f ; (vdc_set_extended_memsize.l14 + 0)
.s16:
2e5b : 20 05 68 JSR $6805 ; (vdc_mem_addr@proxy + 0)
.l391:
2e5e : 2c 00 d6 BIT $d600 
2e61 : 10 fb __ BPL $2e5e ; (vdc_set_extended_memsize.l391 + 0)
.s41:
2e63 : a9 00 __ LDA #$00
2e65 : 8d 01 d6 STA $d601 
2e68 : a2 18 __ LDX #$18
2e6a : 8e 00 d6 STX $d600 
.l393:
2e6d : 2c 00 d6 BIT $d600 
2e70 : 10 fb __ BPL $2e6d ; (vdc_set_extended_memsize.l393 + 0)
.s47:
2e72 : ad 01 d6 LDA $d601 
2e75 : 29 7f __ AND #$7f
2e77 : 8e 00 d6 STX $d600 
.l395:
2e7a : 2c 00 d6 BIT $d600 
2e7d : 10 fb __ BPL $2e7a ; (vdc_set_extended_memsize.l395 + 0)
.s53:
2e7f : 8d 01 d6 STA $d601 
2e82 : a9 1e __ LDA #$1e
2e84 : 8d 00 d6 STA $d600 
.l397:
2e87 : 2c 00 d6 BIT $d600 
2e8a : 10 fb __ BPL $2e87 ; (vdc_set_extended_memsize.l397 + 0)
.s58:
2e8c : a9 ff __ LDA #$ff
2e8e : 8d 01 d6 STA $d601 
2e91 : a0 1c __ LDY #$1c
2e93 : 8c 00 d6 STY $d600 
.l399:
2e96 : 2c 00 d6 BIT $d600 
2e99 : 10 fb __ BPL $2e96 ; (vdc_set_extended_memsize.l399 + 0)
.s64:
2e9b : ad 01 d6 LDA $d601 
2e9e : 09 10 __ ORA #$10
2ea0 : 8c 00 d6 STY $d600 
.l401:
2ea3 : 2c 00 d6 BIT $d600 
2ea6 : 10 fb __ BPL $2ea3 ; (vdc_set_extended_memsize.l401 + 0)
.s70:
2ea8 : 8d 01 d6 STA $d601 
2eab : 20 db 2d JSR $2ddb ; (vdc_restore_charsets.s0 + 0)
2eae : 20 65 2a JSR $2a65 ; (vdc_cls.s0 + 0)
2eb1 : a9 22 __ LDA #$22
2eb3 : 8d 00 d6 STA $d600 
.l403:
2eb6 : 2c 00 d6 BIT $d600 
2eb9 : 10 fb __ BPL $2eb6 ; (vdc_set_extended_memsize.l403 + 0)
.s76:
2ebb : a9 7d __ LDA #$7d
2ebd : 8d 01 d6 STA $d601 
2ec0 : a9 01 __ LDA #$01
2ec2 : 8d 5d 6d STA $6d5d ; (vdc_state + 1)
.s1001:
2ec5 : 60 __ __ RTS
--------------------------------------------------------------------
krill_install: ; krill_install()->u8
.s0:
2ec6 : 20 00 a0 JSR $a000 
2ec9 : b0 02 __ BCS $2ecd ; (krill_install.s0 + 7)
2ecb : a9 00 __ LDA #$00
2ecd : 85 1b __ STA ACCU + 0 
.s1001:
2ecf : a5 1b __ LDA ACCU + 0 
2ed1 : 60 __ __ RTS
--------------------------------------------------------------------
2ed2 : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 6f 53 43 41 52 36 34 : sTARTING oSCAR64
2ee2 : __ __ __ BYT 20 76 64 63 20 44 45 4d 4f 2e 00                :  vdc DEMO..
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
2eed : a9 0a __ LDA #$0a
2eef : 85 0f __ STA P2 
2ef1 : a9 09 __ LDA #$09
2ef3 : 85 10 __ STA P3 
2ef5 : a9 8d __ LDA #$8d
2ef7 : 85 13 __ STA P6 
--------------------------------------------------------------------
vdc_prints_attr: ; vdc_prints_attr(u8,u8,const u8*,u8)->void
.s0:
2ef9 : a5 11 __ LDA P4 ; (string + 0)
2efb : 85 0d __ STA P0 
2efd : 85 43 __ STA T0 + 0 
2eff : a5 12 __ LDA P5 ; (string + 1)
2f01 : 85 0e __ STA P1 
2f03 : 85 44 __ STA T0 + 1 
2f05 : a5 10 __ LDA P3 ; (y + 0)
2f07 : 0a __ __ ASL
2f08 : aa __ __ TAX
2f09 : bd 00 6f LDA $6f00,x ; (multab + 0)
2f0c : 85 45 __ STA T2 + 0 
2f0e : bd 01 6f LDA $6f01,x ; (multab + 1)
2f11 : 85 46 __ STA T2 + 1 
2f13 : 20 d5 2f JSR $2fd5 ; (strlen.s0 + 0)
2f16 : a5 1b __ LDA ACCU + 0 
2f18 : 85 47 __ STA T3 + 0 
2f1a : 18 __ __ CLC
2f1b : a5 0f __ LDA P2 ; (x + 0)
2f1d : 65 45 __ ADC T2 + 0 
2f1f : 85 45 __ STA T2 + 0 
2f21 : 90 02 __ BCC $2f25 ; (vdc_prints_attr.s1041 + 0)
.s1040:
2f23 : e6 46 __ INC T2 + 1 
.s1041:
2f25 : 18 __ __ CLC
2f26 : 6d 64 6d ADC $6d64 ; (vdc_state + 8)
2f29 : 85 0d __ STA P0 
2f2b : ad 65 6d LDA $6d65 ; (vdc_state + 9)
2f2e : 65 46 __ ADC T2 + 1 
2f30 : 85 0e __ STA P1 
2f32 : 20 4e 2b JSR $2b4e ; (vdc_mem_addr.s0 + 0)
2f35 : a5 47 __ LDA T3 + 0 
2f37 : f0 55 __ BEQ $2f8e ; (vdc_prints_attr.s6 + 0)
.s64:
2f39 : a0 00 __ LDY #$00
.l4:
2f3b : b1 43 __ LDA (T0 + 0),y 
2f3d : c9 20 __ CMP #$20
2f3f : b0 05 __ BCS $2f46 ; (vdc_prints_attr.s10 + 0)
.s9:
2f41 : 69 80 __ ADC #$80
2f43 : 4c 80 2f JMP $2f80 ; (vdc_prints_attr.s1038 + 0)
.s10:
2f46 : c9 40 __ CMP #$40
2f48 : aa __ __ TAX
2f49 : 90 2f __ BCC $2f7a ; (vdc_prints_attr.s29 + 0)
.s15:
2f4b : c9 60 __ CMP #$60
2f4d : 90 1b __ BCC $2f6a ; (vdc_prints_attr.s12 + 0)
.s19:
2f4f : 09 00 __ ORA #$00
2f51 : 30 06 __ BMI $2f59 ; (vdc_prints_attr.s17 + 0)
.s16:
2f53 : 38 __ __ SEC
2f54 : e9 20 __ SBC #$20
2f56 : 4c 80 2f JMP $2f80 ; (vdc_prints_attr.s1038 + 0)
.s17:
2f59 : c9 80 __ CMP #$80
2f5b : 90 1d __ BCC $2f7a ; (vdc_prints_attr.s29 + 0)
.s23:
2f5d : c9 a0 __ CMP #$a0
2f5f : b0 05 __ BCS $2f66 ; (vdc_prints_attr.s27 + 0)
.s20:
2f61 : 69 40 __ ADC #$40
2f63 : 4c 80 2f JMP $2f80 ; (vdc_prints_attr.s1038 + 0)
.s27:
2f66 : c9 c0 __ CMP #$c0
2f68 : b0 06 __ BCS $2f70 ; (vdc_prints_attr.s31 + 0)
.s12:
2f6a : 38 __ __ SEC
2f6b : e9 40 __ SBC #$40
2f6d : 4c 80 2f JMP $2f80 ; (vdc_prints_attr.s1038 + 0)
.s31:
2f70 : c9 ff __ CMP #$ff
2f72 : b0 06 __ BCS $2f7a ; (vdc_prints_attr.s29 + 0)
.s28:
2f74 : 38 __ __ SEC
2f75 : e9 80 __ SBC #$80
2f77 : 4c 80 2f JMP $2f80 ; (vdc_prints_attr.s1038 + 0)
.s29:
2f7a : c9 ff __ CMP #$ff
2f7c : d0 03 __ BNE $2f81 ; (vdc_prints_attr.l193 + 0)
.s32:
2f7e : a9 5e __ LDA #$5e
.s1038:
2f80 : aa __ __ TAX
.l193:
2f81 : 2c 00 d6 BIT $d600 
2f84 : 10 fb __ BPL $2f81 ; (vdc_prints_attr.l193 + 0)
.s37:
2f86 : 8e 01 d6 STX $d601 
2f89 : c8 __ __ INY
2f8a : c4 47 __ CPY T3 + 0 
2f8c : 90 ad __ BCC $2f3b ; (vdc_prints_attr.l4 + 0)
.s6:
2f8e : ad 66 6d LDA $6d66 ; (vdc_state + 10)
2f91 : 18 __ __ CLC
2f92 : 65 45 __ ADC T2 + 0 
2f94 : 85 0d __ STA P0 
2f96 : ad 67 6d LDA $6d67 ; (vdc_state + 11)
2f99 : 65 46 __ ADC T2 + 1 
2f9b : 85 0e __ STA P1 
2f9d : 20 4e 2b JSR $2b4e ; (vdc_mem_addr.s0 + 0)
2fa0 : a6 47 __ LDX T3 + 0 
2fa2 : ca __ __ DEX
.l196:
2fa3 : 2c 00 d6 BIT $d600 
2fa6 : 10 fb __ BPL $2fa3 ; (vdc_prints_attr.l196 + 0)
.s41:
2fa8 : a5 13 __ LDA P6 ; (attr + 0)
2faa : 8d 01 d6 STA $d601 
2fad : a0 18 __ LDY #$18
2faf : 8c 00 d6 STY $d600 
.l198:
2fb2 : 2c 00 d6 BIT $d600 
2fb5 : 10 fb __ BPL $2fb2 ; (vdc_prints_attr.l198 + 0)
.s47:
2fb7 : ad 01 d6 LDA $d601 
2fba : 29 7f __ AND #$7f
2fbc : 8c 00 d6 STY $d600 
.l200:
2fbf : 2c 00 d6 BIT $d600 
2fc2 : 10 fb __ BPL $2fbf ; (vdc_prints_attr.l200 + 0)
.s53:
2fc4 : 8d 01 d6 STA $d601 
2fc7 : a9 1e __ LDA #$1e
2fc9 : 8d 00 d6 STA $d600 
.l202:
2fcc : 2c 00 d6 BIT $d600 
2fcf : 10 fb __ BPL $2fcc ; (vdc_prints_attr.l202 + 0)
.s58:
2fd1 : 8e 01 d6 STX $d601 
.s1001:
2fd4 : 60 __ __ RTS
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
2fd5 : a9 00 __ LDA #$00
2fd7 : 85 1b __ STA ACCU + 0 
2fd9 : 85 1c __ STA ACCU + 1 
2fdb : a8 __ __ TAY
2fdc : b1 0d __ LDA (P0),y ; (str + 0)
2fde : f0 18 __ BEQ $2ff8 ; (strlen.s1001 + 0)
.s2:
2fe0 : a5 0d __ LDA P0 ; (str + 0)
2fe2 : 85 1b __ STA ACCU + 0 
2fe4 : a2 00 __ LDX #$00
.l1002:
2fe6 : c8 __ __ INY
2fe7 : d0 01 __ BNE $2fea ; (strlen.s1005 + 0)
.s1004:
2fe9 : e8 __ __ INX
.s1005:
2fea : 8a __ __ TXA
2feb : 18 __ __ CLC
2fec : 65 0e __ ADC P1 ; (str + 1)
2fee : 85 1c __ STA ACCU + 1 
2ff0 : b1 1b __ LDA (ACCU + 0),y 
2ff2 : d0 f2 __ BNE $2fe6 ; (strlen.l1002 + 0)
.s1003:
2ff4 : 86 1c __ STX ACCU + 1 
2ff6 : 84 1b __ STY ACCU + 0 
.s1001:
2ff8 : 60 __ __ RTS
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s0:
2ff9 : a9 00 __ LDA #$00
2ffb : 8d fb bf STA $bffb ; (sstack + 4)
2ffe : a0 02 __ LDY #$02
3000 : b1 23 __ LDA (SP + 0),y 
3002 : 85 16 __ STA P9 
3004 : c8 __ __ INY
3005 : b1 23 __ LDA (SP + 0),y 
3007 : 85 17 __ STA P10 
3009 : c8 __ __ INY
300a : b1 23 __ LDA (SP + 0),y 
300c : 8d f7 bf STA $bff7 ; (sstack + 0)
300f : c8 __ __ INY
3010 : b1 23 __ LDA (SP + 0),y 
3012 : 8d f8 bf STA $bff8 ; (sstack + 1)
3015 : 18 __ __ CLC
3016 : a5 23 __ LDA SP + 0 
3018 : 69 06 __ ADC #$06
301a : 8d f9 bf STA $bff9 ; (sstack + 2)
301d : a5 24 __ LDA SP + 1 
301f : 69 00 __ ADC #$00
3021 : 8d fa bf STA $bffa ; (sstack + 3)
3024 : 4c 73 20 JMP $2073 ; (sformat.s0 + 0)
--------------------------------------------------------------------
3027 : __ __ __ BYT 76 64 63 20 4d 45 4d 4f 52 59 20 44 45 54 45 43 : vdc MEMORY DETEC
3037 : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 2c 20 45 58 54 45 : TED: %U kb, EXTE
3047 : __ __ __ BYT 4e 44 45 44 20 4d 45 4d 4f 52 59 20 25 53 41 42 : NDED MEMORY %SAB
3057 : __ __ __ BYT 4c 45 44 2e 00                                  : LED..
--------------------------------------------------------------------
305c : __ __ __ BYT 65 4e 00                                        : eN.
--------------------------------------------------------------------
305f : __ __ __ BYT 64 49 53 00                                     : dIS.
--------------------------------------------------------------------
3063 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 3a 00 : lOADING ASSETS:.
--------------------------------------------------------------------
3073 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 3a 20 6c 4f 47 4f 20 41 : - SCREEN: lOGO A
3083 : __ __ __ BYT 4e 44 20 54 45 53 54 20 53 43 52 45 45 4e 00    : ND TEST SCREEN.
--------------------------------------------------------------------
krill_load@proxy: ; krill_load@proxy
3092 : a9 00 __ LDA #$00
3094 : 85 11 __ STA P4 
3096 : a9 20 __ LDA #$20
3098 : 85 12 __ STA P5 
--------------------------------------------------------------------
krill_load: ; krill_load(u8,const u16,const u8*)->u8
.s0:
309a : ad 00 ff LDA $ff00 
309d : 8d fd 15 STA $15fd ; (krillvar + 19)
30a0 : a9 7e __ LDA #$7e
30a2 : 8d fc 15 STA $15fc ; (krillvar + 18)
30a5 : a9 00 __ LDA #$00
30a7 : 8d fe 15 STA $15fe ; (krillvar + 20)
30aa : a5 11 __ LDA P4 ; (start + 0)
30ac : 85 f5 __ STA $f5 
30ae : a5 12 __ LDA P5 ; (start + 1)
30b0 : 85 f6 __ STA $f6 
30b2 : a0 ff __ LDY #$ff
.l1002:
30b4 : c8 __ __ INY
30b5 : b1 13 __ LDA (P6),y ; (fname + 0)
30b7 : 99 ea 15 STA $15ea,y ; (krillvar + 0)
30ba : d0 f8 __ BNE $30b4 ; (krill_load.l1002 + 0)
.s1003:
30bc : 20 e0 13 JSR $13e0 ; (krill_load_core.s0 + 0)
30bf : ad fe 15 LDA $15fe ; (krillvar + 20)
.s1001:
30c2 : 60 __ __ RTS
--------------------------------------------------------------------
30c3 : __ __ __ BYT 53 43 52 45 45 4e 32 00                         : SCREEN2.
--------------------------------------------------------------------
menu_fileerrormessage: ; menu_fileerrormessage()->void
.s1000:
30cb : 38 __ __ SEC
30cc : a5 23 __ LDA SP + 0 
30ce : e9 08 __ SBC #$08
30d0 : 85 23 __ STA SP + 0 
30d2 : b0 02 __ BCS $30d6 ; (menu_fileerrormessage.s0 + 0)
30d4 : c6 24 __ DEC SP + 1 
.s0:
30d6 : a9 08 __ LDA #$08
30d8 : 85 18 __ STA P11 
30da : 8d f7 bf STA $bff7 ; (sstack + 0)
30dd : a9 f0 __ LDA #$f0
30df : 85 17 __ STA P10 
30e1 : a9 1e __ LDA #$1e
30e3 : 8d f8 bf STA $bff8 ; (sstack + 1)
30e6 : a9 06 __ LDA #$06
30e8 : 8d f9 bf STA $bff9 ; (sstack + 2)
30eb : ad 63 6d LDA $6d63 ; (vdc_state + 7)
30ee : 85 52 __ STA T0 + 0 
30f0 : a9 8d __ LDA #$8d
30f2 : 8d 63 6d STA $6d63 ; (vdc_state + 7)
30f5 : 20 4f 31 JSR $314f ; (vdcwin_win_new.s1000 + 0)
30f8 : a9 36 __ LDA #$36
30fa : 85 12 __ STA P5 
30fc : a9 1c __ LDA #$1c
30fe : 85 11 __ STA P4 
3100 : 20 ed 2e JSR $2eed ; (vdc_prints_attr@proxy + 0)
3103 : a9 75 __ LDA #$75
3105 : a0 02 __ LDY #$02
3107 : 91 23 __ STA (SP + 0),y 
3109 : a9 6d __ LDA #$6d
310b : c8 __ __ INY
310c : 91 23 __ STA (SP + 0),y 
310e : a9 28 __ LDA #$28
3110 : c8 __ __ INY
3111 : 91 23 __ STA (SP + 0),y 
3113 : a9 36 __ LDA #$36
3115 : c8 __ __ INY
3116 : 91 23 __ STA (SP + 0),y 
3118 : ad 4d 6d LDA $6d4d ; (krnio_pstatus + 1)
311b : c8 __ __ INY
311c : 91 23 __ STA (SP + 0),y 
311e : a9 00 __ LDA #$00
3120 : c8 __ __ INY
3121 : 91 23 __ STA (SP + 0),y 
3123 : 20 f9 2f JSR $2ff9 ; (sprintf.s0 + 0)
3126 : a9 0a __ LDA #$0a
3128 : 85 0f __ STA P2 
312a : a9 0b __ LDA #$0b
312c : 85 10 __ STA P3 
312e : 20 f6 67 JSR $67f6 ; (vdc_prints_attr@proxy + 0)
3131 : a9 0d __ LDA #$0d
3133 : 85 10 __ STA P3 
3135 : 20 df 67 JSR $67df ; (vdc_prints_attr@proxy + 0)
3138 : 20 42 36 JSR $3642 ; (vdcwin_getch.s0 + 0)
313b : 20 50 36 JSR $3650 ; (vdcwin_win_free.s0 + 0)
313e : a5 52 __ LDA T0 + 0 
3140 : 8d 63 6d STA $6d63 ; (vdc_state + 7)
.s1001:
3143 : 18 __ __ CLC
3144 : a5 23 __ LDA SP + 0 
3146 : 69 08 __ ADC #$08
3148 : 85 23 __ STA SP + 0 
314a : 90 02 __ BCC $314e ; (menu_fileerrormessage.s1001 + 11)
314c : e6 24 __ INC SP + 1 
314e : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_new: ; vdcwin_win_new(u8,u8,u8,u8,u8)->void
.s1000:
314f : a2 03 __ LDX #$03
3151 : b5 53 __ LDA T8 + 0,x 
3153 : 9d f3 bf STA $bff3,x ; (buffer + 12)
3156 : ca __ __ DEX
3157 : 10 f8 __ BPL $3151 ; (vdcwin_win_new.s1000 + 2)
.s0:
3159 : ad f8 bf LDA $bff8 ; (sstack + 1)
315c : 85 11 __ STA P4 
315e : 85 4c __ STA T1 + 0 
3160 : ad f9 bf LDA $bff9 ; (sstack + 2)
3163 : 85 12 __ STA P5 
3165 : 85 4d __ STA T3 + 0 
3167 : ad f7 bf LDA $bff7 ; (sstack + 0)
316a : 0a __ __ ASL
316b : aa __ __ TAX
316c : bd 00 6f LDA $6f00,x ; (multab + 0)
316f : 18 __ __ CLC
3170 : 65 18 __ ADC P11 ; (xpos + 0)
3172 : 85 53 __ STA T8 + 0 
3174 : bd 01 6f LDA $6f01,x ; (multab + 1)
3177 : 69 00 __ ADC #$00
3179 : 85 54 __ STA T8 + 1 
317b : a5 17 __ LDA P10 ; (border + 0)
317d : 0a __ __ ASL
317e : 10 0e __ BPL $318e ; (vdcwin_win_new.s57 + 0)
.s6:
3180 : a5 18 __ LDA P11 ; (xpos + 0)
3182 : f0 0a __ BEQ $318e ; (vdcwin_win_new.s57 + 0)
.s3:
3184 : e6 4c __ INC T1 + 0 
3186 : a5 53 __ LDA T8 + 0 
3188 : d0 02 __ BNE $318c ; (vdcwin_win_new.s1013 + 0)
.s1012:
318a : c6 54 __ DEC T8 + 1 
.s1013:
318c : c6 53 __ DEC T8 + 0 
.s57:
318e : a5 17 __ LDA P10 ; (border + 0)
3190 : 29 20 __ AND #$20
3192 : f0 15 __ BEQ $31a9 ; (vdcwin_win_new.s59 + 0)
.s10:
3194 : 18 __ __ CLC
3195 : a5 11 __ LDA P4 
3197 : 65 18 __ ADC P11 ; (xpos + 0)
3199 : a8 __ __ TAY
319a : a9 00 __ LDA #$00
319c : 2a __ __ ROL
319d : cd 60 6d CMP $6d60 ; (vdc_state + 4)
31a0 : d0 03 __ BNE $31a5 ; (vdcwin_win_new.s1009 + 0)
.s1008:
31a2 : cc 5f 6d CPY $6d5f ; (vdc_state + 3)
.s1009:
31a5 : b0 02 __ BCS $31a9 ; (vdcwin_win_new.s59 + 0)
.s7:
31a7 : e6 4c __ INC T1 + 0 
.s59:
31a9 : 24 17 __ BIT P10 ; (border + 0)
31ab : 10 1e __ BPL $31cb ; (vdcwin_win_new.s60 + 0)
.s14:
31ad : ad f7 bf LDA $bff7 ; (sstack + 0)
31b0 : f0 19 __ BEQ $31cb ; (vdcwin_win_new.s60 + 0)
.s11:
31b2 : e6 4d __ INC T3 + 0 
31b4 : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
31b7 : 85 03 __ STA WORK + 0 
31b9 : ad 60 6d LDA $6d60 ; (vdc_state + 4)
31bc : 85 04 __ STA WORK + 1 
31be : 38 __ __ SEC
31bf : a5 53 __ LDA T8 + 0 
31c1 : e5 03 __ SBC WORK + 0 
31c3 : 85 53 __ STA T8 + 0 
31c5 : a5 54 __ LDA T8 + 1 
31c7 : e5 04 __ SBC WORK + 1 
31c9 : 85 54 __ STA T8 + 1 
.s60:
31cb : a5 17 __ LDA P10 ; (border + 0)
31cd : 29 10 __ AND #$10
31cf : f0 16 __ BEQ $31e7 ; (vdcwin_win_new.s17 + 0)
.s18:
31d1 : 18 __ __ CLC
31d2 : a5 12 __ LDA P5 
31d4 : 6d f7 bf ADC $bff7 ; (sstack + 0)
31d7 : a8 __ __ TAY
31d8 : a9 00 __ LDA #$00
31da : 2a __ __ ROL
31db : cd 62 6d CMP $6d62 ; (vdc_state + 6)
31de : d0 03 __ BNE $31e3 ; (vdcwin_win_new.s1007 + 0)
.s1006:
31e0 : cc 61 6d CPY $6d61 ; (vdc_state + 5)
.s1007:
31e3 : b0 02 __ BCS $31e7 ; (vdcwin_win_new.s17 + 0)
.s15:
31e5 : e6 4d __ INC T3 + 0 
.s17:
31e7 : a5 12 __ LDA P5 
31e9 : 85 1b __ STA ACCU + 0 ; (height + 0)
31eb : a9 00 __ LDA #$00
31ed : 85 1c __ STA ACCU + 1 
31ef : a5 11 __ LDA P4 
31f1 : 20 3e 64 JSR $643e ; (mul16by8 + 0)
31f4 : a5 05 __ LDA WORK + 2 
31f6 : 0a __ __ ASL
31f7 : 85 4e __ STA T5 + 0 
31f9 : a5 06 __ LDA WORK + 3 
31fb : 2a __ __ ROL
31fc : 85 4f __ STA T5 + 1 
31fe : ad 4a 6d LDA $6d4a ; (winCfg + 6)
3201 : 85 50 __ STA T7 + 0 
3203 : 18 __ __ CLC
3204 : 65 4e __ ADC T5 + 0 
3206 : 85 4e __ STA T5 + 0 
3208 : ad 4b 6d LDA $6d4b ; (winCfg + 7)
320b : 85 51 __ STA T7 + 1 
320d : 65 4f __ ADC T5 + 1 
320f : 85 4f __ STA T5 + 1 
3211 : ad 45 6d LDA $6d45 ; (winCfg + 1)
3214 : 18 __ __ CLC
3215 : 6d 47 6d ADC $6d47 ; (winCfg + 3)
3218 : a8 __ __ TAY
3219 : ad 46 6d LDA $6d46 ; (winCfg + 2)
321c : 6d 48 6d ADC $6d48 ; (winCfg + 4)
321f : aa __ __ TAX
3220 : 98 __ __ TYA
3221 : 18 __ __ CLC
3222 : 69 fe __ ADC #$fe
3224 : a8 __ __ TAY
3225 : 8a __ __ TXA
3226 : 69 ff __ ADC #$ff
3228 : c5 4f __ CMP T5 + 1 
322a : d0 02 __ BNE $322e ; (vdcwin_win_new.s1005 + 0)
.s1004:
322c : c4 4e __ CPY T5 + 0 
.s1005:
322e : 90 51 __ BCC $3281 ; (vdcwin_win_new.s1001 + 0)
.s21:
3230 : ad 49 6d LDA $6d49 ; (winCfg + 5)
3233 : c9 03 __ CMP #$03
3235 : f0 4a __ BEQ $3281 ; (vdcwin_win_new.s1001 + 0)
.s25:
3237 : a5 18 __ LDA P11 ; (xpos + 0)
3239 : 85 0f __ STA P2 
323b : ad f7 bf LDA $bff7 ; (sstack + 0)
323e : 85 10 __ STA P3 
3240 : ee 49 6d INC $6d49 ; (winCfg + 5)
3243 : ae 49 6d LDX $6d49 ; (winCfg + 5)
3246 : bd 5a 67 LDA $675a,x ; (__multab13L + 0)
3249 : 85 4e __ STA T5 + 0 
324b : 18 __ __ CLC
324c : 69 bc __ ADC #$bc
324e : 85 55 __ STA T10 + 0 
3250 : 85 0d __ STA P0 
3252 : a9 6d __ LDA #$6d
3254 : 69 00 __ ADC #$00
3256 : 85 56 __ STA T10 + 1 
3258 : 85 0e __ STA P1 
325a : 20 15 33 JSR $3315 ; (vdcwin_init.s0 + 0)
325d : a5 50 __ LDA T7 + 0 
325f : a6 4e __ LDX T5 + 0 
3261 : 9d b9 6d STA $6db9,x ; (linebuffer + 68)
3264 : a5 51 __ LDA T7 + 1 
3266 : 9d ba 6d STA $6dba,x ; (linebuffer + 69)
3269 : a5 17 __ LDA P10 ; (border + 0)
326b : 9d bb 6d STA $6dbb,x ; (linebuffer + 70)
326e : a5 4d __ LDA T3 + 0 
3270 : d0 1a __ BNE $328c ; (vdcwin_win_new.s32 + 0)
.s30:
3272 : a5 55 __ LDA T10 + 0 
3274 : 85 14 __ STA P7 
3276 : a5 56 __ LDA T10 + 1 
3278 : 85 15 __ STA P8 
327a : a5 17 __ LDA P10 ; (border + 0)
327c : 85 16 __ STA P9 
327e : 20 d9 33 JSR $33d9 ; (vdcwin_border_clear.s0 + 0)
.s1001:
3281 : a2 03 __ LDX #$03
3283 : bd f3 bf LDA $bff3,x ; (buffer + 12)
3286 : 95 53 __ STA T8 + 0,x 
3288 : ca __ __ DEX
3289 : 10 f8 __ BPL $3283 ; (vdcwin_win_new.s1001 + 2)
328b : 60 __ __ RTS
.s32:
328c : 85 4b __ STA T0 + 0 
328e : a5 4c __ LDA T1 + 0 
3290 : 85 12 __ STA P5 
.l1010:
3292 : ad 44 6d LDA $6d44 ; (winCfg + 0)
3295 : 85 0d __ STA P0 
3297 : a9 00 __ LDA #$00
3299 : 85 13 __ STA P6 
329b : ad 4a 6d LDA $6d4a ; (winCfg + 6)
329e : 85 50 __ STA T7 + 0 
32a0 : 85 0e __ STA P1 
32a2 : ad 4b 6d LDA $6d4b ; (winCfg + 7)
32a5 : 85 51 __ STA T7 + 1 
32a7 : 85 0f __ STA P2 
32a9 : ad 64 6d LDA $6d64 ; (vdc_state + 8)
32ac : 18 __ __ CLC
32ad : 65 53 __ ADC T8 + 0 
32af : 85 10 __ STA P3 
32b1 : ad 65 6d LDA $6d65 ; (vdc_state + 9)
32b4 : 65 54 __ ADC T8 + 1 
32b6 : 85 11 __ STA P4 
32b8 : 20 20 14 JSR $1420 ; (bnk_cpyfromvdc.s0 + 0)
32bb : a9 00 __ LDA #$00
32bd : 85 13 __ STA P6 
32bf : 18 __ __ CLC
32c0 : a5 50 __ LDA T7 + 0 
32c2 : 65 12 __ ADC P5 
32c4 : 85 50 __ STA T7 + 0 
32c6 : 85 0e __ STA P1 
32c8 : 8d 4a 6d STA $6d4a ; (winCfg + 6)
32cb : a5 51 __ LDA T7 + 1 
32cd : 69 00 __ ADC #$00
32cf : 85 51 __ STA T7 + 1 
32d1 : 85 0f __ STA P2 
32d3 : 8d 4b 6d STA $6d4b ; (winCfg + 7)
32d6 : ad 66 6d LDA $6d66 ; (vdc_state + 10)
32d9 : 18 __ __ CLC
32da : 65 53 __ ADC T8 + 0 
32dc : 85 10 __ STA P3 
32de : ad 67 6d LDA $6d67 ; (vdc_state + 11)
32e1 : 65 54 __ ADC T8 + 1 
32e3 : 85 11 __ STA P4 
32e5 : 20 20 14 JSR $1420 ; (bnk_cpyfromvdc.s0 + 0)
32e8 : 18 __ __ CLC
32e9 : a5 50 __ LDA T7 + 0 
32eb : 65 12 __ ADC P5 
32ed : 8d 4a 6d STA $6d4a ; (winCfg + 6)
32f0 : a5 51 __ LDA T7 + 1 
32f2 : 69 00 __ ADC #$00
32f4 : 8d 4b 6d STA $6d4b ; (winCfg + 7)
32f7 : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
32fa : 18 __ __ CLC
32fb : 65 53 __ ADC T8 + 0 
32fd : 85 53 __ STA T8 + 0 
32ff : ad 60 6d LDA $6d60 ; (vdc_state + 4)
3302 : 65 54 __ ADC T8 + 1 
3304 : 85 54 __ STA T8 + 1 
3306 : c6 4b __ DEC T0 + 0 
3308 : d0 88 __ BNE $3292 ; (vdcwin_win_new.l1010 + 0)
330a : 4c 72 32 JMP $3272 ; (vdcwin_win_new.s30 + 0)
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
330d : a9 dc __ LDA #$dc
330f : 85 0d __ STA P0 
3311 : a9 bf __ LDA #$bf
3313 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
3315 : a9 00 __ LDA #$00
3317 : a0 04 __ LDY #$04
3319 : 91 0d __ STA (P0),y ; (win + 0)
331b : c8 __ __ INY
331c : 91 0d __ STA (P0),y ; (win + 0)
331e : a5 0f __ LDA P2 ; (sx + 0)
3320 : a0 00 __ LDY #$00
3322 : 91 0d __ STA (P0),y ; (win + 0)
3324 : a5 10 __ LDA P3 ; (sy + 0)
3326 : c8 __ __ INY
3327 : 91 0d __ STA (P0),y ; (win + 0)
3329 : a5 11 __ LDA P4 ; (wx + 0)
332b : c8 __ __ INY
332c : 91 0d __ STA (P0),y ; (win + 0)
332e : a5 12 __ LDA P5 ; (wy + 0)
3330 : c8 __ __ INY
3331 : 91 0d __ STA (P0),y ; (win + 0)
3333 : 06 10 __ ASL P3 ; (sy + 0)
3335 : a6 10 __ LDX P3 ; (sy + 0)
3337 : bd 00 6f LDA $6f00,x ; (multab + 0)
333a : 18 __ __ CLC
333b : 65 0f __ ADC P2 ; (sx + 0)
333d : 85 1b __ STA ACCU + 0 
333f : bd 01 6f LDA $6f01,x ; (multab + 1)
3342 : 69 00 __ ADC #$00
3344 : a8 __ __ TAY
3345 : ad 64 6d LDA $6d64 ; (vdc_state + 8)
3348 : 18 __ __ CLC
3349 : 65 1b __ ADC ACCU + 0 
334b : 85 1b __ STA ACCU + 0 
334d : 98 __ __ TYA
334e : 6d 65 6d ADC $6d65 ; (vdc_state + 9)
3351 : a0 07 __ LDY #$07
3353 : 91 0d __ STA (P0),y ; (win + 0)
3355 : a5 1b __ LDA ACCU + 0 
3357 : 88 __ __ DEY
3358 : 91 0d __ STA (P0),y ; (win + 0)
335a : bd 00 6f LDA $6f00,x ; (multab + 0)
335d : 18 __ __ CLC
335e : 65 0f __ ADC P2 ; (sx + 0)
3360 : 85 1b __ STA ACCU + 0 
3362 : bd 01 6f LDA $6f01,x ; (multab + 1)
3365 : 69 00 __ ADC #$00
3367 : aa __ __ TAX
3368 : ad 66 6d LDA $6d66 ; (vdc_state + 10)
336b : 18 __ __ CLC
336c : 65 1b __ ADC ACCU + 0 
336e : 85 1b __ STA ACCU + 0 
3370 : 8a __ __ TXA
3371 : 6d 67 6d ADC $6d67 ; (vdc_state + 11)
3374 : a0 09 __ LDY #$09
3376 : 91 0d __ STA (P0),y ; (win + 0)
3378 : a5 1b __ LDA ACCU + 0 
337a : 88 __ __ DEY
337b : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
337d : 60 __ __ RTS
--------------------------------------------------------------------
txtscr_scroller_init: ; txtscr_scroller_init(struct TXTSCRScrollText*,struct TXTSCRBigFont*,u8*,u8,u8,u8,u8)->void
.s0:
337e : a9 00 __ LDA #$00
3380 : a0 0e __ LDY #$0e
3382 : 91 17 __ STA (P10),y ; (settings + 0)
3384 : c8 __ __ INY
3385 : 91 17 __ STA (P10),y ; (settings + 0)
3387 : c8 __ __ INY
3388 : 91 17 __ STA (P10),y ; (settings + 0)
338a : c8 __ __ INY
338b : 91 17 __ STA (P10),y ; (settings + 0)
338d : a9 46 __ LDA #$46
338f : 85 11 __ STA P4 
3391 : ad f9 bf LDA $bff9 ; (sstack + 2)
3394 : a0 00 __ LDY #$00
3396 : 91 17 __ STA (P10),y ; (settings + 0)
3398 : ad fa bf LDA $bffa ; (sstack + 3)
339b : c8 __ __ INY
339c : 91 17 __ STA (P10),y ; (settings + 0)
339e : ad f8 bf LDA $bff8 ; (sstack + 1)
33a1 : 85 44 __ STA T1 + 1 
33a3 : ad f7 bf LDA $bff7 ; (sstack + 0)
33a6 : 85 43 __ STA T1 + 0 
33a8 : c8 __ __ INY
33a9 : 91 17 __ STA (P10),y ; (settings + 0)
33ab : a5 44 __ LDA T1 + 1 
33ad : c8 __ __ INY
33ae : 91 17 __ STA (P10),y ; (settings + 0)
33b0 : a0 05 __ LDY #$05
33b2 : 84 0f __ STY P2 
33b4 : b1 43 __ LDA (T1 + 0),y 
33b6 : 85 12 __ STA P5 
33b8 : 18 __ __ CLC
33b9 : a5 17 __ LDA P10 ; (settings + 0)
33bb : 69 04 __ ADC #$04
33bd : 85 0d __ STA P0 
33bf : a5 18 __ LDA P11 ; (settings + 1)
33c1 : 69 00 __ ADC #$00
33c3 : 85 0e __ STA P1 
33c5 : ad fb bf LDA $bffb ; (sstack + 4)
33c8 : 85 10 __ STA P3 
33ca : 20 15 33 JSR $3315 ; (vdcwin_init.s0 + 0)
33cd : a5 0d __ LDA P0 
33cf : 85 14 __ STA P7 
33d1 : a5 0e __ LDA P1 
33d3 : 85 15 __ STA P8 
--------------------------------------------------------------------
vdcwin_border_clear@proxy: ; vdcwin_border_clear@proxy
33d5 : a9 f0 __ LDA #$f0
33d7 : 85 16 __ STA P9 
--------------------------------------------------------------------
vdcwin_border_clear: ; vdcwin_border_clear(struct VDCWin*,u8)->void
.s0:
33d9 : a5 16 __ LDA P9 ; (border + 0)
33db : 29 0f __ AND #$0f
33dd : 85 47 __ STA T2 + 0 
33df : 49 ff __ EOR #$ff
33e1 : 18 __ __ CLC
33e2 : 69 01 __ ADC #$01
33e4 : 29 09 __ AND #$09
33e6 : 85 48 __ STA T3 + 0 
33e8 : aa __ __ TAX
33e9 : bd 48 68 LDA $6848,x ; (winStyles + 0)
33ec : 85 49 __ STA T4 + 0 
33ee : a5 16 __ LDA P9 ; (border + 0)
33f0 : 0a __ __ ASL
33f1 : 10 0c __ BPL $33ff ; (vdcwin_border_clear.s53 + 0)
.s4:
33f3 : a0 00 __ LDY #$00
33f5 : b1 14 __ LDA (P7),y ; (win + 0)
33f7 : d0 06 __ BNE $33ff ; (vdcwin_border_clear.s53 + 0)
.s1:
33f9 : a5 16 __ LDA P9 ; (border + 0)
33fb : 29 bf __ AND #$bf
33fd : 85 16 __ STA P9 ; (border + 0)
.s53:
33ff : a5 16 __ LDA P9 ; (border + 0)
3401 : 29 20 __ AND #$20
3403 : f0 2c __ BEQ $3431 ; (vdcwin_border_clear.s55 + 0)
.s8:
3405 : a0 00 __ LDY #$00
3407 : b1 14 __ LDA (P7),y ; (win + 0)
3409 : 18 __ __ CLC
340a : a0 02 __ LDY #$02
340c : 71 14 __ ADC (P7),y ; (win + 0)
340e : a8 __ __ TAY
340f : a9 00 __ LDA #$00
3411 : 2a __ __ ROL
3412 : 85 1c __ STA ACCU + 1 
3414 : 98 __ __ TYA
3415 : 69 01 __ ADC #$01
3417 : 85 1b __ STA ACCU + 0 
3419 : 90 02 __ BCC $341d ; (vdcwin_border_clear.s1009 + 0)
.s1008:
341b : e6 1c __ INC ACCU + 1 
.s1009:
341d : ad 60 6d LDA $6d60 ; (vdc_state + 4)
3420 : c5 1c __ CMP ACCU + 1 
3422 : d0 05 __ BNE $3429 ; (vdcwin_border_clear.s1007 + 0)
.s1006:
3424 : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
3427 : c5 1b __ CMP ACCU + 0 
.s1007:
3429 : b0 06 __ BCS $3431 ; (vdcwin_border_clear.s55 + 0)
.s5:
342b : a5 16 __ LDA P9 ; (border + 0)
342d : 29 df __ AND #$df
342f : 85 16 __ STA P9 ; (border + 0)
.s55:
3431 : 24 16 __ BIT P9 ; (border + 0)
3433 : 10 67 __ BPL $349c ; (vdcwin_border_clear.s59 + 0)
.s12:
3435 : a0 01 __ LDY #$01
3437 : b1 14 __ LDA (P7),y ; (win + 0)
3439 : f0 61 __ BEQ $349c ; (vdcwin_border_clear.s59 + 0)
.s9:
343b : 38 __ __ SEC
343c : e9 01 __ SBC #$01
343e : 85 4a __ STA T7 + 0 
3440 : a5 16 __ LDA P9 ; (border + 0)
3442 : 0a __ __ ASL
3443 : 10 18 __ BPL $345d ; (vdcwin_border_clear.s15 + 0)
.s13:
3445 : a5 4a __ LDA T7 + 0 
3447 : 85 0e __ STA P1 
3449 : a5 49 __ LDA T4 + 0 
344b : 85 10 __ STA P3 
344d : bd 49 68 LDA $6849,x ; (winStyles + 1)
3450 : 85 0f __ STA P2 
3452 : 38 __ __ SEC
3453 : 88 __ __ DEY
3454 : b1 14 __ LDA (P7),y ; (win + 0)
3456 : e9 01 __ SBC #$01
3458 : 85 0d __ STA P0 
345a : 20 9e 35 JSR $359e ; (vdc_printc.s0 + 0)
.s15:
345d : a0 00 __ LDY #$00
345f : b1 14 __ LDA (P7),y ; (win + 0)
3461 : 85 46 __ STA T0 + 0 
3463 : 85 0f __ STA P2 
3465 : a5 4a __ LDA T7 + 0 
3467 : 85 10 __ STA P3 
3469 : a5 49 __ LDA T4 + 0 
346b : 85 12 __ STA P5 
346d : a6 48 __ LDX T3 + 0 
346f : bd 4d 68 LDA $684d,x ; (winStyles + 5)
3472 : 85 11 __ STA P4 
3474 : a0 02 __ LDY #$02
3476 : b1 14 __ LDA (P7),y ; (win + 0)
3478 : 85 13 __ STA P6 
347a : 20 a3 2a JSR $2aa3 ; (vdc_hchar.s0 + 0)
347d : a5 16 __ LDA P9 ; (border + 0)
347f : 29 20 __ AND #$20
3481 : f0 19 __ BEQ $349c ; (vdcwin_border_clear.s59 + 0)
.s16:
3483 : a5 10 __ LDA P3 
3485 : 85 0e __ STA P1 
3487 : a5 12 __ LDA P5 
3489 : 85 10 __ STA P3 
348b : a6 48 __ LDX T3 + 0 
348d : bd 4a 68 LDA $684a,x ; (winStyles + 2)
3490 : 85 0f __ STA P2 
3492 : 18 __ __ CLC
3493 : a5 13 __ LDA P6 
3495 : 65 46 __ ADC T0 + 0 
3497 : 85 0d __ STA P0 
3499 : 20 9e 35 JSR $359e ; (vdc_printc.s0 + 0)
.s59:
349c : a5 16 __ LDA P9 ; (border + 0)
349e : 29 10 __ AND #$10
34a0 : f0 79 __ BEQ $351b ; (vdcwin_border_clear.s39 + 0)
.s22:
34a2 : a0 01 __ LDY #$01
34a4 : b1 14 __ LDA (P7),y ; (win + 0)
34a6 : 18 __ __ CLC
34a7 : a0 03 __ LDY #$03
34a9 : 71 14 __ ADC (P7),y ; (win + 0)
34ab : 85 4a __ STA T7 + 0 
34ad : a9 00 __ LDA #$00
34af : 2a __ __ ROL
34b0 : cd 62 6d CMP $6d62 ; (vdc_state + 6)
34b3 : d0 05 __ BNE $34ba ; (vdcwin_border_clear.s1005 + 0)
.s1004:
34b5 : a5 4a __ LDA T7 + 0 
34b7 : cd 61 6d CMP $6d61 ; (vdc_state + 5)
.s1005:
34ba : b0 5f __ BCS $351b ; (vdcwin_border_clear.s39 + 0)
.s19:
34bc : a5 16 __ LDA P9 ; (border + 0)
34be : 0a __ __ ASL
34bf : 10 1b __ BPL $34dc ; (vdcwin_border_clear.s25 + 0)
.s23:
34c1 : a5 4a __ LDA T7 + 0 
34c3 : 85 0e __ STA P1 
34c5 : a5 49 __ LDA T4 + 0 
34c7 : 85 10 __ STA P3 
34c9 : a6 48 __ LDX T3 + 0 
34cb : bd 4b 68 LDA $684b,x ; (winStyles + 3)
34ce : 85 0f __ STA P2 
34d0 : 38 __ __ SEC
34d1 : a0 00 __ LDY #$00
34d3 : b1 14 __ LDA (P7),y ; (win + 0)
34d5 : e9 01 __ SBC #$01
34d7 : 85 0d __ STA P0 
34d9 : 20 9e 35 JSR $359e ; (vdc_printc.s0 + 0)
.s25:
34dc : a0 00 __ LDY #$00
34de : b1 14 __ LDA (P7),y ; (win + 0)
34e0 : 85 46 __ STA T0 + 0 
34e2 : 85 0f __ STA P2 
34e4 : a5 4a __ LDA T7 + 0 
34e6 : 85 10 __ STA P3 
34e8 : a5 49 __ LDA T4 + 0 
34ea : 85 12 __ STA P5 
34ec : a6 48 __ LDX T3 + 0 
34ee : bd 4e 68 LDA $684e,x ; (winStyles + 6)
34f1 : 85 11 __ STA P4 
34f3 : a0 02 __ LDY #$02
34f5 : b1 14 __ LDA (P7),y ; (win + 0)
34f7 : 85 13 __ STA P6 
34f9 : 20 a3 2a JSR $2aa3 ; (vdc_hchar.s0 + 0)
34fc : a5 16 __ LDA P9 ; (border + 0)
34fe : 29 20 __ AND #$20
3500 : f0 19 __ BEQ $351b ; (vdcwin_border_clear.s39 + 0)
.s26:
3502 : a5 10 __ LDA P3 
3504 : 85 0e __ STA P1 
3506 : a5 12 __ LDA P5 
3508 : 85 10 __ STA P3 
350a : a6 48 __ LDX T3 + 0 
350c : bd 4c 68 LDA $684c,x ; (winStyles + 4)
350f : 85 0f __ STA P2 
3511 : 18 __ __ CLC
3512 : a5 13 __ LDA P6 
3514 : 65 46 __ ADC T0 + 0 
3516 : 85 0d __ STA P0 
3518 : 20 9e 35 JSR $359e ; (vdc_printc.s0 + 0)
.s39:
351b : a9 00 __ LDA #$00
351d : 85 46 __ STA T0 + 0 
351f : f0 04 __ BEQ $3525 ; (vdcwin_border_clear.l29 + 0)
.s69:
3521 : e6 46 __ INC T0 + 0 
3523 : a5 46 __ LDA T0 + 0 
.l29:
3525 : a0 03 __ LDY #$03
3527 : d1 14 __ CMP (P7),y ; (win + 0)
3529 : 90 01 __ BCC $352c ; (vdcwin_border_clear.s30 + 0)
.s1001:
352b : 60 __ __ RTS
.s30:
352c : a5 16 __ LDA P9 ; (border + 0)
352e : 0a __ __ ASL
352f : 10 25 __ BPL $3556 ; (vdcwin_border_clear.s35 + 0)
.s33:
3531 : a5 49 __ LDA T4 + 0 
3533 : 85 10 __ STA P3 
3535 : 38 __ __ SEC
3536 : a0 00 __ LDY #$00
3538 : b1 14 __ LDA (P7),y ; (win + 0)
353a : e9 01 __ SBC #$01
353c : 85 0d __ STA P0 
353e : c8 __ __ INY
353f : b1 14 __ LDA (P7),y ; (win + 0)
3541 : 18 __ __ CLC
3542 : 65 46 __ ADC T0 + 0 
3544 : 85 0e __ STA P1 
3546 : 38 __ __ SEC
3547 : a9 00 __ LDA #$00
3549 : e5 47 __ SBC T2 + 0 
354b : 29 09 __ AND #$09
354d : aa __ __ TAX
354e : bd 4f 68 LDA $684f,x ; (winStyles + 7)
3551 : 85 0f __ STA P2 
3553 : 20 9e 35 JSR $359e ; (vdc_printc.s0 + 0)
.s35:
3556 : a9 20 __ LDA #$20
3558 : 85 11 __ STA P4 
355a : a0 02 __ LDY #$02
355c : b1 14 __ LDA (P7),y ; (win + 0)
355e : 85 13 __ STA P6 
3560 : a0 00 __ LDY #$00
3562 : b1 14 __ LDA (P7),y ; (win + 0)
3564 : 85 0f __ STA P2 
3566 : c8 __ __ INY
3567 : b1 14 __ LDA (P7),y ; (win + 0)
3569 : 18 __ __ CLC
356a : 65 46 __ ADC T0 + 0 
356c : 85 10 __ STA P3 
356e : 20 9e 2a JSR $2a9e ; (vdc_hchar@proxy + 0)
3571 : a5 16 __ LDA P9 ; (border + 0)
3573 : 29 20 __ AND #$20
3575 : f0 aa __ BEQ $3521 ; (vdcwin_border_clear.s69 + 0)
.s36:
3577 : a5 10 __ LDA P3 
3579 : 85 0e __ STA P1 
357b : a5 49 __ LDA T4 + 0 
357d : 85 10 __ STA P3 
357f : 18 __ __ CLC
3580 : a5 13 __ LDA P6 
3582 : 65 0f __ ADC P2 
3584 : 85 0d __ STA P0 
3586 : 38 __ __ SEC
3587 : a9 00 __ LDA #$00
3589 : e5 47 __ SBC T2 + 0 
358b : 29 09 __ AND #$09
358d : aa __ __ TAX
358e : bd 50 68 LDA $6850,x ; (winStyles + 8)
3591 : 85 0f __ STA P2 
3593 : 20 9e 35 JSR $359e ; (vdc_printc.s0 + 0)
3596 : 4c 21 35 JMP $3521 ; (vdcwin_border_clear.s69 + 0)
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
3599 : ad 63 6d LDA $6d63 ; (vdc_state + 7)
359c : 85 10 __ STA P3 
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
359e : a5 0e __ LDA P1 ; (y + 0)
35a0 : 0a __ __ ASL
35a1 : a2 12 __ LDX #$12
35a3 : 8e 00 d6 STX $d600 
35a6 : aa __ __ TAX
35a7 : 18 __ __ CLC
35a8 : a5 0d __ LDA P0 ; (x + 0)
35aa : 7d 00 6f ADC $6f00,x ; (multab + 0)
35ad : 85 1b __ STA ACCU + 0 
35af : a9 00 __ LDA #$00
35b1 : 7d 01 6f ADC $6f01,x ; (multab + 1)
35b4 : 85 1c __ STA ACCU + 1 
35b6 : 18 __ __ CLC
35b7 : a5 1b __ LDA ACCU + 0 
35b9 : 6d 64 6d ADC $6d64 ; (vdc_state + 8)
35bc : aa __ __ TAX
35bd : a5 1c __ LDA ACCU + 1 
35bf : 6d 65 6d ADC $6d65 ; (vdc_state + 9)
.l167:
35c2 : 2c 00 d6 BIT $d600 
35c5 : 10 fb __ BPL $35c2 ; (vdc_printc.l167 + 0)
.s9:
35c7 : 8d 01 d6 STA $d601 
35ca : a9 13 __ LDA #$13
35cc : 8d 00 d6 STA $d600 
.l169:
35cf : 2c 00 d6 BIT $d600 
35d2 : 10 fb __ BPL $35cf ; (vdc_printc.l169 + 0)
.s14:
35d4 : 8e 01 d6 STX $d601 
35d7 : a9 1f __ LDA #$1f
35d9 : 8d 00 d6 STA $d600 
.l171:
35dc : 2c 00 d6 BIT $d600 
35df : 10 fb __ BPL $35dc ; (vdc_printc.l171 + 0)
.s18:
35e1 : a5 0f __ LDA P2 ; (val + 0)
35e3 : 8d 01 d6 STA $d601 
35e6 : ad 66 6d LDA $6d66 ; (vdc_state + 10)
35e9 : 18 __ __ CLC
35ea : 65 1b __ ADC ACCU + 0 
35ec : a8 __ __ TAY
35ed : a9 12 __ LDA #$12
35ef : 8d 00 d6 STA $d600 
35f2 : ad 67 6d LDA $6d67 ; (vdc_state + 11)
35f5 : 65 1c __ ADC ACCU + 1 
.l173:
35f7 : 2c 00 d6 BIT $d600 
35fa : 10 fb __ BPL $35f7 ; (vdc_printc.l173 + 0)
.s25:
35fc : 8d 01 d6 STA $d601 
35ff : a9 13 __ LDA #$13
3601 : 8d 00 d6 STA $d600 
.l175:
3604 : 2c 00 d6 BIT $d600 
3607 : 10 fb __ BPL $3604 ; (vdc_printc.l175 + 0)
.s30:
3609 : 8c 01 d6 STY $d601 
360c : a9 1f __ LDA #$1f
360e : 8d 00 d6 STA $d600 
.l177:
3611 : 2c 00 d6 BIT $d600 
3614 : 10 fb __ BPL $3611 ; (vdc_printc.l177 + 0)
.s34:
3616 : a5 10 __ LDA P3 ; (attr + 0)
3618 : 8d 01 d6 STA $d601 
.s1001:
361b : 60 __ __ RTS
--------------------------------------------------------------------
361c : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 00             : fILE ERROR!.
--------------------------------------------------------------------
3628 : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 00    : eRROR NR.: %2x.
--------------------------------------------------------------------
3637 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 2e 00                : pRESS KEY..
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
3642 : 20 e4 ff JSR $ffe4 
3645 : c9 00 __ CMP #$00
3647 : f0 f9 __ BEQ $3642 ; (vdcwin_getch.s0 + 0)
3649 : 85 1b __ STA ACCU + 0 
364b : a9 00 __ LDA #$00
364d : 85 1c __ STA ACCU + 1 
.s1001:
364f : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_free: ; vdcwin_win_free()->void
.s0:
3650 : ad 49 6d LDA $6d49 ; (winCfg + 5)
3653 : d0 01 __ BNE $3656 ; (vdcwin_win_free.s3 + 0)
3655 : 60 __ __ RTS
.s3:
3656 : 85 44 __ STA T0 + 0 
3658 : a8 __ __ TAY
3659 : be 5a 67 LDX $675a,y ; (__multab13L + 0)
365c : 86 1b __ STX ACCU + 0 
365e : bc be 6d LDY $6dbe,x ; (linebuffer + 73)
3661 : 84 1c __ STY ACCU + 1 
3663 : bd bf 6d LDA $6dbf,x ; (linebuffer + 74)
3666 : 85 43 __ STA T5 + 0 
3668 : 85 1d __ STA ACCU + 2 
366a : bd b9 6d LDA $6db9,x ; (linebuffer + 68)
366d : 85 45 __ STA T2 + 0 
366f : 8d 4a 6d STA $6d4a ; (winCfg + 6)
3672 : bd ba 6d LDA $6dba,x ; (linebuffer + 69)
3675 : 85 46 __ STA T2 + 1 
3677 : 8d 4b 6d STA $6d4b ; (winCfg + 7)
367a : bd bc 6d LDA $6dbc,x ; (linebuffer + 71)
367d : 85 1e __ STA ACCU + 3 
367f : bd bd 6d LDA $6dbd,x ; (linebuffer + 72)
3682 : 85 4a __ STA T10 + 0 
3684 : 0a __ __ ASL
3685 : aa __ __ TAX
3686 : bd 00 6f LDA $6f00,x ; (multab + 0)
3689 : 18 __ __ CLC
368a : 65 1e __ ADC ACCU + 3 
368c : 85 4b __ STA T11 + 0 
368e : bd 01 6f LDA $6f01,x ; (multab + 1)
3691 : 69 00 __ ADC #$00
3693 : 85 4c __ STA T11 + 1 
3695 : a6 1b __ LDX ACCU + 0 
3697 : bd bb 6d LDA $6dbb,x ; (linebuffer + 70)
369a : 85 1b __ STA ACCU + 0 
369c : 0a __ __ ASL
369d : 10 0e __ BPL $36ad ; (vdcwin_win_free.s53 + 0)
.s10:
369f : a5 1e __ LDA ACCU + 3 
36a1 : f0 0a __ BEQ $36ad ; (vdcwin_win_free.s53 + 0)
.s7:
36a3 : e6 1c __ INC ACCU + 1 
36a5 : a5 4b __ LDA T11 + 0 
36a7 : d0 02 __ BNE $36ab ; (vdcwin_win_free.s1009 + 0)
.s1008:
36a9 : c6 4c __ DEC T11 + 1 
.s1009:
36ab : c6 4b __ DEC T11 + 0 
.s53:
36ad : a5 1b __ LDA ACCU + 0 
36af : 29 20 __ AND #$20
36b1 : f0 14 __ BEQ $36c7 ; (vdcwin_win_free.s55 + 0)
.s14:
36b3 : 98 __ __ TYA
36b4 : 18 __ __ CLC
36b5 : 65 1e __ ADC ACCU + 3 
36b7 : a8 __ __ TAY
36b8 : a9 00 __ LDA #$00
36ba : 2a __ __ ROL
36bb : cd 60 6d CMP $6d60 ; (vdc_state + 4)
36be : d0 03 __ BNE $36c3 ; (vdcwin_win_free.s1005 + 0)
.s1004:
36c0 : cc 5f 6d CPY $6d5f ; (vdc_state + 3)
.s1005:
36c3 : b0 02 __ BCS $36c7 ; (vdcwin_win_free.s55 + 0)
.s11:
36c5 : e6 1c __ INC ACCU + 1 
.s55:
36c7 : 24 1b __ BIT ACCU + 0 
36c9 : 10 15 __ BPL $36e0 ; (vdcwin_win_free.s56 + 0)
.s18:
36cb : a5 4a __ LDA T10 + 0 
36cd : f0 11 __ BEQ $36e0 ; (vdcwin_win_free.s56 + 0)
.s15:
36cf : e6 1d __ INC ACCU + 2 
36d1 : 38 __ __ SEC
36d2 : a5 4b __ LDA T11 + 0 
36d4 : ed 5f 6d SBC $6d5f ; (vdc_state + 3)
36d7 : 85 4b __ STA T11 + 0 
36d9 : a5 4c __ LDA T11 + 1 
36db : ed 60 6d SBC $6d60 ; (vdc_state + 4)
36de : 85 4c __ STA T11 + 1 
.s56:
36e0 : a5 1b __ LDA ACCU + 0 
36e2 : 29 10 __ AND #$10
36e4 : f0 15 __ BEQ $36fb ; (vdcwin_win_free.s21 + 0)
.s22:
36e6 : 18 __ __ CLC
36e7 : a5 43 __ LDA T5 + 0 
36e9 : 65 4a __ ADC T10 + 0 
36eb : a8 __ __ TAY
36ec : a9 00 __ LDA #$00
36ee : 2a __ __ ROL
36ef : cd 62 6d CMP $6d62 ; (vdc_state + 6)
36f2 : d0 03 __ BNE $36f7 ; (vdcwin_win_free.s1003 + 0)
.s1002:
36f4 : cc 61 6d CPY $6d61 ; (vdc_state + 5)
.s1003:
36f7 : b0 02 __ BCS $36fb ; (vdcwin_win_free.s21 + 0)
.s19:
36f9 : e6 1d __ INC ACCU + 2 
.s21:
36fb : a5 1d __ LDA ACCU + 2 
36fd : d0 11 __ BNE $3710 ; (vdcwin_win_free.s27 + 0)
.s26:
36ff : a5 45 __ LDA T2 + 0 
3701 : 8d 4a 6d STA $6d4a ; (winCfg + 6)
3704 : a5 46 __ LDA T2 + 1 
3706 : 8d 4b 6d STA $6d4b ; (winCfg + 7)
3709 : a6 44 __ LDX T0 + 0 
370b : ca __ __ DEX
370c : 8e 49 6d STX $6d49 ; (winCfg + 5)
.s1001:
370f : 60 __ __ RTS
.s27:
3710 : 85 47 __ STA T3 + 0 
3712 : a5 1c __ LDA ACCU + 1 
3714 : 85 14 __ STA P7 
.l1006:
3716 : ad 64 6d LDA $6d64 ; (vdc_state + 8)
3719 : 18 __ __ CLC
371a : 65 4b __ ADC T11 + 0 
371c : 85 0f __ STA P2 
371e : a9 00 __ LDA #$00
3720 : 85 15 __ STA P8 
3722 : ad 65 6d LDA $6d65 ; (vdc_state + 9)
3725 : 65 4c __ ADC T11 + 1 
3727 : 85 10 __ STA P3 
3729 : ad 44 6d LDA $6d44 ; (winCfg + 0)
372c : 85 11 __ STA P4 
372e : ad 4a 6d LDA $6d4a ; (winCfg + 6)
3731 : 85 48 __ STA T7 + 0 
3733 : 85 12 __ STA P5 
3735 : ad 4b 6d LDA $6d4b ; (winCfg + 7)
3738 : 85 49 __ STA T7 + 1 
373a : 85 13 __ STA P6 
373c : 20 aa 14 JSR $14aa ; (bnk_cpytovdc.s0 + 0)
373f : a9 00 __ LDA #$00
3741 : 85 15 __ STA P8 
3743 : 18 __ __ CLC
3744 : a5 48 __ LDA T7 + 0 
3746 : 65 14 __ ADC P7 
3748 : 85 48 __ STA T7 + 0 
374a : 85 12 __ STA P5 
374c : 8d 4a 6d STA $6d4a ; (winCfg + 6)
374f : a5 49 __ LDA T7 + 1 
3751 : 69 00 __ ADC #$00
3753 : 85 49 __ STA T7 + 1 
3755 : 85 13 __ STA P6 
3757 : 8d 4b 6d STA $6d4b ; (winCfg + 7)
375a : ad 66 6d LDA $6d66 ; (vdc_state + 10)
375d : 18 __ __ CLC
375e : 65 4b __ ADC T11 + 0 
3760 : 85 0f __ STA P2 
3762 : ad 67 6d LDA $6d67 ; (vdc_state + 11)
3765 : 65 4c __ ADC T11 + 1 
3767 : 85 10 __ STA P3 
3769 : 20 aa 14 JSR $14aa ; (bnk_cpytovdc.s0 + 0)
376c : 18 __ __ CLC
376d : a5 48 __ LDA T7 + 0 
376f : 65 14 __ ADC P7 
3771 : 8d 4a 6d STA $6d4a ; (winCfg + 6)
3774 : a5 49 __ LDA T7 + 1 
3776 : 69 00 __ ADC #$00
3778 : 8d 4b 6d STA $6d4b ; (winCfg + 7)
377b : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
377e : 18 __ __ CLC
377f : 65 4b __ ADC T11 + 0 
3781 : 85 4b __ STA T11 + 0 
3783 : ad 60 6d LDA $6d60 ; (vdc_state + 4)
3786 : 65 4c __ ADC T11 + 1 
3788 : 85 4c __ STA T11 + 1 
378a : c6 47 __ DEC T3 + 0 
378c : d0 88 __ BNE $3716 ; (vdcwin_win_free.l1006 + 0)
378e : 4c ff 36 JMP $36ff ; (vdcwin_win_free.s26 + 0)
--------------------------------------------------------------------
3791 : __ __ __ BYT 2d 20 4d 55 53 49 43 3a 20 75 4c 54 49 4d 41 54 : - MUSIC: uLTIMAT
37a1 : __ __ __ BYT 45 20 61 58 45 4c 20 66 20 46 52 4f 4d 20 6e 4f : E aXEL f FROM nO
37b1 : __ __ __ BYT 52 44 49 53 43 48 53 4f 55 4e 44 00             : RDISCHSOUND.
--------------------------------------------------------------------
37bd : __ __ __ BYT 4d 55 53 49 43 31 00                            : MUSIC1.
--------------------------------------------------------------------
menu_placetop: ; menu_placetop(const u8*)->void
.s0:
37c4 : 20 65 2a JSR $2a65 ; (vdc_cls.s0 + 0)
37c7 : a9 00 __ LDA #$00
37c9 : 85 0f __ STA P2 
37cb : 85 10 __ STA P3 
37cd : a9 c5 __ LDA #$c5
37cf : 85 12 __ STA P5 
37d1 : 20 32 68 JSR $6832 ; (vdc_hchar@proxy + 0)
37d4 : a9 c5 __ LDA #$c5
37d6 : 85 13 __ STA P6 
37d8 : a9 38 __ LDA #$38
37da : 85 12 __ STA P5 
37dc : a9 6f __ LDA #$6f
37de : 85 11 __ STA P4 
37e0 : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
37e3 : a9 01 __ LDA #$01
37e5 : 85 14 __ STA P7 
--------------------------------------------------------------------
menu_placebar: ; menu_placebar(u8)->void
.s0:
37e7 : a5 14 __ LDA P7 ; (y + 0)
37e9 : 8d 96 68 STA $6896 ; (menubar + 60)
37ec : 85 10 __ STA P3 
37ee : a9 00 __ LDA #$00
37f0 : 85 0f __ STA P2 
37f2 : a9 c4 __ LDA #$c4
37f4 : 85 12 __ STA P5 
37f6 : 20 32 68 JSR $6832 ; (vdc_hchar@proxy + 0)
37f9 : a9 00 __ LDA #$00
37fb : 85 48 __ STA T1 + 0 
37fd : 85 49 __ STA T2 + 0 
37ff : a9 01 __ LDA #$01
3801 : 85 4a __ STA T3 + 0 
3803 : a9 06 __ LDA #$06
3805 : 85 4b __ STA T4 + 0 
.l2:
3807 : 18 __ __ CLC
3808 : a9 5a __ LDA #$5a
380a : 65 49 __ ADC T2 + 0 
380c : 85 0d __ STA P0 
380e : a9 68 __ LDA #$68
3810 : 69 00 __ ADC #$00
3812 : 85 0e __ STA P1 
3814 : 20 d5 2f JSR $2fd5 ; (strlen.s0 + 0)
3817 : a5 0d __ LDA P0 
3819 : 85 11 __ STA P4 
381b : a5 0e __ LDA P1 
381d : 85 12 __ STA P5 
381f : a5 1b __ LDA ACCU + 0 
3821 : 85 4c __ STA T5 + 0 
3823 : 18 __ __ CLC
3824 : 65 4a __ ADC T3 + 0 
3826 : 85 43 __ STA T6 + 0 
3828 : a9 c4 __ LDA #$c4
382a : 85 13 __ STA P6 
382c : a9 00 __ LDA #$00
382e : 2a __ __ ROL
382f : 85 44 __ STA T6 + 1 
3831 : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
3834 : 38 __ __ SEC
3835 : e9 01 __ SBC #$01
3837 : a8 __ __ TAY
3838 : ad 60 6d LDA $6d60 ; (vdc_state + 4)
383b : e9 00 __ SBC #$00
383d : c5 44 __ CMP T6 + 1 
383f : d0 02 __ BNE $3843 ; (menu_placebar.s1003 + 0)
.s1002:
3841 : c4 43 __ CPY T6 + 0 
.s1003:
3843 : 90 04 __ BCC $3849 ; (menu_placebar.s5 + 0)
.s7:
3845 : a5 4a __ LDA T3 + 0 
3847 : b0 04 __ BCS $384d ; (menu_placebar.s1004 + 0)
.s5:
3849 : 98 __ __ TYA
384a : 38 __ __ SEC
384b : e5 1b __ SBC ACCU + 0 
.s1004:
384d : 85 0f __ STA P2 
384f : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
3852 : a5 0f __ LDA P2 
3854 : a6 48 __ LDX T1 + 0 
3856 : e8 __ __ INX
3857 : 86 48 __ STX T1 + 0 
3859 : 9d 8f 68 STA $688f,x ; (menubar + 53)
385c : a5 4c __ LDA T5 + 0 
385e : 38 __ __ SEC
385f : 65 0f __ ADC P2 
3861 : 85 4a __ STA T3 + 0 
3863 : 18 __ __ CLC
3864 : a5 49 __ LDA T2 + 0 
3866 : 69 09 __ ADC #$09
3868 : 85 49 __ STA T2 + 0 
386a : c6 4b __ DEC T4 + 0 
386c : d0 99 __ BNE $3807 ; (menu_placebar.l2 + 0)
.s1001:
386e : 60 __ __ RTS
--------------------------------------------------------------------
386f : __ __ __ BYT 20 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d :  oSCAR64 vdc dEM
387f : __ __ __ BYT 4f 00                                           : O.
--------------------------------------------------------------------
3881 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 3a 20 25 53 00    : sCREENMODE: %S.
--------------------------------------------------------------------
3890 : __ __ __ BYT 73 45 4c 45 43 54 20 44 45 53 49 52 45 44 20 44 : sELECT DESIRED D
38a0 : __ __ __ BYT 45 4d 4f 20 55 53 49 4e 47 20 43 55 52 53 4f 52 : EMO USING CURSOR
38b0 : __ __ __ BYT 20 4b 45 59 53 20 41 4e 44 20 72 65 74 75 72 6e :  KEYS AND return
38c0 : __ __ __ BYT 20 49 4e 20 4d 45 4e 55 2e 00                   :  IN MENU..
--------------------------------------------------------------------
38ca : __ __ __ BYT 69 4e 20 4f 54 48 45 52 20 44 45 4d 4f 53 2c 20 : iN OTHER DEMOS, 
38da : __ __ __ BYT 50 52 45 53 53 20 41 20 4b 45 59 20 54 4f 20 43 : PRESS A KEY TO C
38ea : __ __ __ BYT 4f 4e 54 49 4e 55 45 20 54 4f 20 4e 45 58 54 20 : ONTINUE TO NEXT 
38fa : __ __ __ BYT 53 54 45 50 2e 00                               : STEP..
--------------------------------------------------------------------
3900 : __ __ __ BYT 69 4e 20 53 43 52 4f 4c 4c 49 4e 47 20 44 45 4d : iN SCROLLING DEM
3910 : __ __ __ BYT 4f 53 2c 20 50 52 45 53 53 20 77 61 73 64 20 4f : OS, PRESS wasd O
3920 : __ __ __ BYT 52 20 43 55 52 53 4f 52 20 4b 45 59 53 20 54 4f : R CURSOR KEYS TO
3930 : __ __ __ BYT 20 4d 4f 56 45 2c 20 65 73 63 20 54 4f 20 45 58 :  MOVE, esc TO EX
3940 : __ __ __ BYT 49 54 2e 00                                     : IT..
--------------------------------------------------------------------
vdcwin_cpy_viewport: ; vdcwin_cpy_viewport(struct VDCViewport*)->void
.s0:
3944 : a5 16 __ LDA P9 ; (viewport + 0)
3946 : 85 44 __ STA T0 + 0 
3948 : a5 17 __ LDA P10 ; (viewport + 1)
394a : 85 45 __ STA T0 + 1 
394c : a0 09 __ LDY #$09
394e : b1 16 __ LDA (P9),y ; (viewport + 0)
3950 : 85 1b __ STA ACCU + 0 
3952 : c8 __ __ INY
3953 : b1 16 __ LDA (P9),y ; (viewport + 0)
3955 : 85 1c __ STA ACCU + 1 
3957 : a0 03 __ LDY #$03
3959 : b1 16 __ LDA (P9),y ; (viewport + 0)
395b : 85 03 __ STA WORK + 0 
395d : c8 __ __ INY
395e : b1 16 __ LDA (P9),y ; (viewport + 0)
3960 : 85 04 __ STA WORK + 1 
3962 : 20 5e 64 JSR $645e ; (mul16 + 0)
3965 : a0 01 __ LDY #$01
3967 : b1 16 __ LDA (P9),y ; (viewport + 0)
3969 : 18 __ __ CLC
396a : 65 05 __ ADC WORK + 2 
396c : aa __ __ TAX
396d : c8 __ __ INY
396e : b1 16 __ LDA (P9),y ; (viewport + 0)
3970 : 65 06 __ ADC WORK + 3 
3972 : 85 47 __ STA T1 + 1 
3974 : 8a __ __ TXA
3975 : 18 __ __ CLC
3976 : a0 07 __ LDY #$07
3978 : 71 16 __ ADC (P9),y ; (viewport + 0)
397a : 85 46 __ STA T1 + 0 
397c : a5 47 __ LDA T1 + 1 
397e : c8 __ __ INY
397f : 71 16 __ ADC (P9),y ; (viewport + 0)
3981 : 85 47 __ STA T1 + 1 
3983 : a9 00 __ LDA #$00
3985 : 85 4a __ STA T3 + 0 
3987 : a0 11 __ LDY #$11
3989 : b1 16 __ LDA (P9),y ; (viewport + 0)
398b : aa __ __ TAX
398c : c8 __ __ INY
398d : b1 16 __ LDA (P9),y ; (viewport + 0)
398f : 4c cb 39 JMP $39cb ; (vdcwin_cpy_viewport.l1 + 0)
.s2:
3992 : 86 0f __ STX P2 
3994 : a5 46 __ LDA T1 + 0 
3996 : 85 12 __ STA P5 
3998 : a5 47 __ LDA T1 + 1 
399a : 85 13 __ STA P6 
399c : a0 00 __ LDY #$00
399e : 84 15 __ STY P8 
39a0 : b1 44 __ LDA (T0 + 0),y 
39a2 : 85 11 __ STA P4 
39a4 : a0 0d __ LDY #$0d
39a6 : b1 44 __ LDA (T0 + 0),y 
39a8 : 85 14 __ STA P7 
39aa : 20 aa 14 JSR $14aa ; (bnk_cpytovdc.s0 + 0)
39ad : a5 46 __ LDA T1 + 0 
39af : 18 __ __ CLC
39b0 : a0 03 __ LDY #$03
39b2 : 71 44 __ ADC (T0 + 0),y 
39b4 : 85 46 __ STA T1 + 0 
39b6 : a5 47 __ LDA T1 + 1 
39b8 : c8 __ __ INY
39b9 : 71 44 __ ADC (T0 + 0),y 
39bb : 85 47 __ STA T1 + 1 
39bd : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
39c0 : 18 __ __ CLC
39c1 : 65 0f __ ADC P2 
39c3 : aa __ __ TAX
39c4 : ad 60 6d LDA $6d60 ; (vdc_state + 4)
39c7 : 65 10 __ ADC P3 
39c9 : e6 4a __ INC T3 + 0 
.l1:
39cb : 85 10 __ STA P3 
39cd : a5 4a __ LDA T3 + 0 
39cf : a0 0e __ LDY #$0e
39d1 : d1 44 __ CMP (T0 + 0),y 
39d3 : 90 bd __ BCC $3992 ; (vdcwin_cpy_viewport.s2 + 0)
.s4:
39d5 : a0 03 __ LDY #$03
39d7 : b1 44 __ LDA (T0 + 0),y 
39d9 : 85 46 __ STA T1 + 0 
39db : 85 03 __ STA WORK + 0 
39dd : c8 __ __ INY
39de : b1 44 __ LDA (T0 + 0),y 
39e0 : 85 47 __ STA T1 + 1 
39e2 : 85 04 __ STA WORK + 1 
39e4 : a0 09 __ LDY #$09
39e6 : b1 44 __ LDA (T0 + 0),y 
39e8 : 85 1b __ STA ACCU + 0 
39ea : c8 __ __ INY
39eb : b1 44 __ LDA (T0 + 0),y 
39ed : 85 1c __ STA ACCU + 1 
39ef : 20 5e 64 JSR $645e ; (mul16 + 0)
39f2 : a0 01 __ LDY #$01
39f4 : b1 44 __ LDA (T0 + 0),y 
39f6 : 18 __ __ CLC
39f7 : 65 05 __ ADC WORK + 2 
39f9 : aa __ __ TAX
39fa : c8 __ __ INY
39fb : b1 44 __ LDA (T0 + 0),y 
39fd : 65 06 __ ADC WORK + 3 
39ff : 85 49 __ STA T2 + 1 
3a01 : 8a __ __ TXA
3a02 : 18 __ __ CLC
3a03 : a0 07 __ LDY #$07
3a05 : 71 44 __ ADC (T0 + 0),y 
3a07 : 85 48 __ STA T2 + 0 
3a09 : a5 49 __ LDA T2 + 1 
3a0b : c8 __ __ INY
3a0c : 71 44 __ ADC (T0 + 0),y 
3a0e : 85 49 __ STA T2 + 1 
3a10 : a0 05 __ LDY #$05
3a12 : b1 44 __ LDA (T0 + 0),y 
3a14 : 85 1b __ STA ACCU + 0 
3a16 : c8 __ __ INY
3a17 : b1 44 __ LDA (T0 + 0),y 
3a19 : 85 1c __ STA ACCU + 1 
3a1b : a5 46 __ LDA T1 + 0 
3a1d : 85 03 __ STA WORK + 0 
3a1f : a5 47 __ LDA T1 + 1 
3a21 : 85 04 __ STA WORK + 1 
3a23 : 20 5e 64 JSR $645e ; (mul16 + 0)
3a26 : 18 __ __ CLC
3a27 : a5 48 __ LDA T2 + 0 
3a29 : 65 05 __ ADC WORK + 2 
3a2b : aa __ __ TAX
3a2c : a5 49 __ LDA T2 + 1 
3a2e : 65 06 __ ADC WORK + 3 
3a30 : a8 __ __ TAY
3a31 : 8a __ __ TXA
3a32 : 18 __ __ CLC
3a33 : 69 30 __ ADC #$30
3a35 : 85 46 __ STA T1 + 0 
3a37 : 90 01 __ BCC $3a3a ; (vdcwin_cpy_viewport.s1007 + 0)
.s1006:
3a39 : c8 __ __ INY
.s1007:
3a3a : 84 47 __ STY T1 + 1 
3a3c : a9 00 __ LDA #$00
3a3e : 85 4a __ STA T3 + 0 
3a40 : a0 13 __ LDY #$13
3a42 : b1 44 __ LDA (T0 + 0),y 
3a44 : aa __ __ TAX
3a45 : c8 __ __ INY
3a46 : b1 44 __ LDA (T0 + 0),y 
3a48 : 4c 84 3a JMP $3a84 ; (vdcwin_cpy_viewport.l5 + 0)
.s6:
3a4b : 86 0f __ STX P2 
3a4d : a5 46 __ LDA T1 + 0 
3a4f : 85 12 __ STA P5 
3a51 : a5 47 __ LDA T1 + 1 
3a53 : 85 13 __ STA P6 
3a55 : a0 00 __ LDY #$00
3a57 : 84 15 __ STY P8 
3a59 : b1 16 __ LDA (P9),y ; (viewport + 0)
3a5b : 85 11 __ STA P4 
3a5d : a0 0d __ LDY #$0d
3a5f : b1 16 __ LDA (P9),y ; (viewport + 0)
3a61 : 85 14 __ STA P7 
3a63 : 20 aa 14 JSR $14aa ; (bnk_cpytovdc.s0 + 0)
3a66 : a5 46 __ LDA T1 + 0 
3a68 : 18 __ __ CLC
3a69 : a0 03 __ LDY #$03
3a6b : 71 16 __ ADC (P9),y ; (viewport + 0)
3a6d : 85 46 __ STA T1 + 0 
3a6f : a5 47 __ LDA T1 + 1 
3a71 : c8 __ __ INY
3a72 : 71 16 __ ADC (P9),y ; (viewport + 0)
3a74 : 85 47 __ STA T1 + 1 
3a76 : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
3a79 : 18 __ __ CLC
3a7a : 65 0f __ ADC P2 
3a7c : aa __ __ TAX
3a7d : ad 60 6d LDA $6d60 ; (vdc_state + 4)
3a80 : 65 10 __ ADC P3 
3a82 : e6 4a __ INC T3 + 0 
.l5:
3a84 : 85 10 __ STA P3 
3a86 : a5 4a __ LDA T3 + 0 
3a88 : a0 0e __ LDY #$0e
3a8a : d1 16 __ CMP (P9),y ; (viewport + 0)
3a8c : 90 bd __ BCC $3a4b ; (vdcwin_cpy_viewport.s6 + 0)
.s1001:
3a8e : 60 __ __ RTS
--------------------------------------------------------------------
menu_main: ; menu_main()->u8
.s1000:
3a8f : a2 03 __ LDX #$03
3a91 : b5 53 __ LDA T0 + 0,x 
3a93 : 9d ca bf STA $bfca,x ; (bigfont + 175)
3a96 : ca __ __ DEX
3a97 : 10 f8 __ BPL $3a91 ; (menu_main.s1000 + 2)
.s0:
3a99 : ad 96 68 LDA $6896 ; (menubar + 60)
3a9c : 85 14 __ STA P7 
3a9e : 20 e7 37 JSR $37e7 ; (menu_placebar.s0 + 0)
.l84:
3aa1 : a9 01 __ LDA #$01
3aa3 : 85 53 __ STA T0 + 0 
.l3:
3aa5 : a9 cf __ LDA #$cf
3aa7 : 85 13 __ STA P6 
3aa9 : a6 53 __ LDX T0 + 0 
3aab : bd 8f 68 LDA $688f,x ; (menubar + 53)
3aae : 85 0f __ STA P2 
3ab0 : ad 96 68 LDA $6896 ; (menubar + 60)
3ab3 : 85 10 __ STA P3 
3ab5 : bd 6e 67 LDA $676e,x ; (__multab9L + 0)
3ab8 : 18 __ __ CLC
3ab9 : 69 51 __ ADC #$51
3abb : 85 11 __ STA P4 
3abd : a9 68 __ LDA #$68
3abf : 69 00 __ ADC #$00
3ac1 : 85 12 __ STA P5 
3ac3 : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
.l5:
3ac6 : 20 42 36 JSR $3642 ; (vdcwin_getch.s0 + 0)
3ac9 : a5 1b __ LDA ACCU + 0 
3acb : 85 54 __ STA T1 + 0 
3acd : c9 0d __ CMP #$0d
3acf : d0 06 __ BNE $3ad7 ; (menu_main.s1002 + 0)
.s1003:
3ad1 : a9 00 __ LDA #$00
3ad3 : 85 55 __ STA T3 + 0 
3ad5 : f0 14 __ BEQ $3aeb ; (menu_main.s6 + 0)
.s1002:
3ad7 : a2 01 __ LDX #$01
3ad9 : 86 55 __ STX T3 + 0 
3adb : c9 9d __ CMP #$9d
3add : f0 0c __ BEQ $3aeb ; (menu_main.s6 + 0)
.s9:
3adf : c9 1d __ CMP #$1d
3ae1 : f0 08 __ BEQ $3aeb ; (menu_main.s6 + 0)
.s8:
3ae3 : c9 1b __ CMP #$1b
3ae5 : f0 04 __ BEQ $3aeb ; (menu_main.s6 + 0)
.s7:
3ae7 : c9 03 __ CMP #$03
3ae9 : d0 db __ BNE $3ac6 ; (menu_main.l5 + 0)
.s6:
3aeb : a9 c4 __ LDA #$c4
3aed : 85 13 __ STA P6 
3aef : a6 53 __ LDX T0 + 0 
3af1 : bd 8f 68 LDA $688f,x ; (menubar + 53)
3af4 : 85 0f __ STA P2 
3af6 : ad 96 68 LDA $6896 ; (menubar + 60)
3af9 : 85 56 __ STA T4 + 0 
3afb : 85 10 __ STA P3 
3afd : bd 6e 67 LDA $676e,x ; (__multab9L + 0)
3b00 : 18 __ __ CLC
3b01 : 69 51 __ ADC #$51
3b03 : 85 11 __ STA P4 
3b05 : a9 68 __ LDA #$68
3b07 : 69 00 __ ADC #$00
3b09 : 85 12 __ STA P5 
3b0b : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
3b0e : a5 54 __ LDA T1 + 0 
3b10 : c9 9d __ CMP #$9d
3b12 : d0 03 __ BNE $3b17 ; (menu_main.s12 + 0)
3b14 : 4c a4 3b JMP $3ba4 ; (menu_main.s11 + 0)
.s12:
3b17 : c9 1d __ CMP #$1d
3b19 : d0 0c __ BNE $3b27 ; (menu_main.s13 + 0)
.s17:
3b1b : e6 53 __ INC T0 + 0 
3b1d : a5 53 __ LDA T0 + 0 
3b1f : c9 07 __ CMP #$07
3b21 : 90 04 __ BCC $3b27 ; (menu_main.s13 + 0)
.s20:
3b23 : a9 01 __ LDA #$01
.s1039:
3b25 : 85 53 __ STA T0 + 0 
.s13:
3b27 : a5 55 __ LDA T3 + 0 
3b29 : f0 0d __ BEQ $3b38 ; (menu_main.s4 + 0)
.s24:
3b2b : a5 54 __ LDA T1 + 0 
3b2d : c9 1b __ CMP #$1b
3b2f : f0 11 __ BEQ $3b42 ; (menu_main.s26 + 0)
.s23:
3b31 : c9 03 __ CMP #$03
3b33 : f0 03 __ BEQ $3b38 ; (menu_main.s4 + 0)
3b35 : 4c a5 3a JMP $3aa5 ; (menu_main.l3 + 0)
.s4:
3b38 : a5 54 __ LDA T1 + 0 
3b3a : c9 1b __ CMP #$1b
3b3c : f0 04 __ BEQ $3b42 ; (menu_main.s26 + 0)
.s28:
3b3e : c9 03 __ CMP #$03
3b40 : d0 06 __ BNE $3b48 ; (menu_main.s25 + 0)
.s26:
3b42 : a9 63 __ LDA #$63
3b44 : 85 55 __ STA T3 + 0 
3b46 : d0 44 __ BNE $3b8c ; (menu_main.s2 + 0)
.s25:
3b48 : a6 53 __ LDX T0 + 0 
3b4a : ca __ __ DEX
3b4b : 8e fe bf STX $bffe ; (sstack + 7)
3b4e : bd 90 68 LDA $6890,x ; (menubar + 54)
3b51 : 8d fc bf STA $bffc ; (sstack + 5)
3b54 : a6 56 __ LDX T4 + 0 
3b56 : e8 __ __ INX
3b57 : 8e fd bf STX $bffd ; (sstack + 6)
3b5a : 20 b0 3b JSR $3bb0 ; (menu_pulldown.s1000 + 0)
3b5d : a5 1b __ LDA ACCU + 0 
3b5f : 85 55 __ STA T3 + 0 
3b61 : c9 12 __ CMP #$12
3b63 : d0 0e __ BNE $3b73 ; (menu_main.s31 + 0)
.s29:
3b65 : a9 00 __ LDA #$00
3b67 : 85 55 __ STA T3 + 0 
3b69 : c6 53 __ DEC T0 + 0 
3b6b : d0 06 __ BNE $3b73 ; (menu_main.s31 + 0)
.s32:
3b6d : a9 06 __ LDA #$06
3b6f : 85 53 __ STA T0 + 0 
3b71 : d0 12 __ BNE $3b85 ; (menu_main.s27 + 0)
.s31:
3b73 : c9 13 __ CMP #$13
3b75 : d0 0e __ BNE $3b85 ; (menu_main.s27 + 0)
.s35:
3b77 : e6 53 __ INC T0 + 0 
3b79 : a5 53 __ LDA T0 + 0 
3b7b : c9 07 __ CMP #$07
3b7d : b0 03 __ BCS $3b82 ; (menu_main.s35 + 11)
3b7f : 4c a5 3a JMP $3aa5 ; (menu_main.l3 + 0)
3b82 : 4c a1 3a JMP $3aa1 ; (menu_main.l84 + 0)
.s27:
3b85 : a5 55 __ LDA T3 + 0 
3b87 : d0 03 __ BNE $3b8c ; (menu_main.s2 + 0)
3b89 : 4c a5 3a JMP $3aa5 ; (menu_main.l3 + 0)
.s2:
3b8c : a5 53 __ LDA T0 + 0 
3b8e : 0a __ __ ASL
3b8f : 0a __ __ ASL
3b90 : 18 __ __ CLC
3b91 : 65 53 __ ADC T0 + 0 
3b93 : 0a __ __ ASL
3b94 : 18 __ __ CLC
3b95 : 65 55 __ ADC T3 + 0 
3b97 : 85 1b __ STA ACCU + 0 
.s1001:
3b99 : a2 03 __ LDX #$03
3b9b : bd ca bf LDA $bfca,x ; (bigfont + 175)
3b9e : 95 53 __ STA T0 + 0,x 
3ba0 : ca __ __ DEX
3ba1 : 10 f8 __ BPL $3b9b ; (menu_main.s1001 + 2)
3ba3 : 60 __ __ RTS
.s11:
3ba4 : c6 53 __ DEC T0 + 0 
3ba6 : f0 03 __ BEQ $3bab ; (menu_main.s14 + 0)
3ba8 : 4c 27 3b JMP $3b27 ; (menu_main.s13 + 0)
.s14:
3bab : a9 06 __ LDA #$06
3bad : 4c 25 3b JMP $3b25 ; (menu_main.s1039 + 0)
--------------------------------------------------------------------
menu_pulldown: ; menu_pulldown(u8,u8,u8,u8)->u8
.s1000:
3bb0 : a2 0a __ LDX #$0a
3bb2 : b5 53 __ LDA T1 + 0,x 
3bb4 : 9d cf bf STA $bfcf,x ; (bigfont + 180)
3bb7 : ca __ __ DEX
3bb8 : 10 f8 __ BPL $3bb2 ; (menu_pulldown.s1000 + 2)
3bba : 38 __ __ SEC
3bbb : a5 23 __ LDA SP + 0 
3bbd : e9 0a __ SBC #$0a
3bbf : 85 23 __ STA SP + 0 
3bc1 : b0 02 __ BCS $3bc5 ; (menu_pulldown.s0 + 0)
3bc3 : c6 24 __ DEC SP + 1 
.s0:
3bc5 : a9 d8 __ LDA #$d8
3bc7 : ae fe bf LDX $bffe ; (sstack + 7)
3bca : 86 52 __ STX T0 + 0 
3bcc : 18 __ __ CLC
3bcd : 7d 5e 67 ADC $675e,x ; (__multab102L + 0)
3bd0 : 85 54 __ STA T2 + 0 
3bd2 : 85 0d __ STA P0 
3bd4 : a9 69 __ LDA #$69
3bd6 : 7d 66 67 ADC $6766,x ; (__multab102H + 0)
3bd9 : 85 55 __ STA T2 + 1 
3bdb : 85 0e __ STA P1 
3bdd : 20 d5 2f JSR $2fd5 ; (strlen.s0 + 0)
3be0 : a6 52 __ LDX T0 + 0 
3be2 : bd 97 68 LDA $6897,x ; (pulldown_options + 0)
3be5 : 85 57 __ STA T4 + 0 
3be7 : 8d f9 bf STA $bff9 ; (sstack + 2)
3bea : e0 06 __ CPX #$06
3bec : 90 08 __ BCC $3bf6 ; (menu_pulldown.s87 + 0)
.s86:
3bee : a9 f0 __ LDA #$f0
3bf0 : 85 17 __ STA P10 
3bf2 : a9 00 __ LDA #$00
3bf4 : b0 06 __ BCS $3bfc ; (menu_pulldown.s91 + 0)
.s87:
3bf6 : a9 70 __ LDA #$70
3bf8 : 85 17 __ STA P10 
3bfa : a9 01 __ LDA #$01
.s91:
3bfc : 85 53 __ STA T1 + 0 
3bfe : ad fc bf LDA $bffc ; (sstack + 5)
3c01 : 85 52 __ STA T0 + 0 
3c03 : 85 18 __ STA P11 
3c05 : ad fd bf LDA $bffd ; (sstack + 6)
3c08 : 85 56 __ STA T3 + 0 
3c0a : 8d f7 bf STA $bff7 ; (sstack + 0)
3c0d : 18 __ __ CLC
3c0e : a5 1b __ LDA ACCU + 0 
3c10 : 69 02 __ ADC #$02
3c12 : 8d f8 bf STA $bff8 ; (sstack + 1)
3c15 : 20 4f 31 JSR $314f ; (vdcwin_win_new.s1000 + 0)
3c18 : a9 01 __ LDA #$01
3c1a : 85 58 __ STA T6 + 0 
3c1c : a5 57 __ LDA T4 + 0 
3c1e : f0 57 __ BEQ $3c77 ; (menu_pulldown.l5 + 0)
.s58:
3c20 : 85 59 __ STA T7 + 0 
3c22 : a9 00 __ LDA #$00
3c24 : 85 5a __ STA T8 + 0 
3c26 : 85 5b __ STA T8 + 1 
.l2:
3c28 : a9 75 __ LDA #$75
3c2a : a0 02 __ LDY #$02
3c2c : 91 23 __ STA (SP + 0),y 
3c2e : a9 6d __ LDA #$6d
3c30 : c8 __ __ INY
3c31 : 91 23 __ STA (SP + 0),y 
3c33 : a9 f9 __ LDA #$f9
3c35 : c8 __ __ INY
3c36 : 91 23 __ STA (SP + 0),y 
3c38 : a9 3d __ LDA #$3d
3c3a : c8 __ __ INY
3c3b : 91 23 __ STA (SP + 0),y 
3c3d : 18 __ __ CLC
3c3e : a5 54 __ LDA T2 + 0 
3c40 : 65 5a __ ADC T8 + 0 
3c42 : c8 __ __ INY
3c43 : 91 23 __ STA (SP + 0),y 
3c45 : a5 55 __ LDA T2 + 1 
3c47 : 65 5b __ ADC T8 + 1 
3c49 : c8 __ __ INY
3c4a : 91 23 __ STA (SP + 0),y 
3c4c : 20 f9 2f JSR $2ff9 ; (sprintf.s0 + 0)
3c4f : a5 52 __ LDA T0 + 0 
3c51 : 85 0f __ STA P2 
3c53 : a5 56 __ LDA T3 + 0 
3c55 : 85 10 __ STA P3 
3c57 : e6 56 __ INC T3 + 0 
3c59 : a9 75 __ LDA #$75
3c5b : 85 11 __ STA P4 
3c5d : a9 c6 __ LDA #$c6
3c5f : 85 13 __ STA P6 
3c61 : a9 6d __ LDA #$6d
3c63 : 85 12 __ STA P5 
3c65 : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
3c68 : 18 __ __ CLC
3c69 : a5 5a __ LDA T8 + 0 
3c6b : 69 11 __ ADC #$11
3c6d : 85 5a __ STA T8 + 0 
3c6f : 90 02 __ BCC $3c73 ; (menu_pulldown.s1047 + 0)
.s1046:
3c71 : e6 5b __ INC T8 + 1 
.s1047:
3c73 : c6 59 __ DEC T7 + 0 
3c75 : d0 b1 __ BNE $3c28 ; (menu_pulldown.l2 + 0)
.l5:
3c77 : a9 2d __ LDA #$2d
3c79 : a0 06 __ LDY #$06
3c7b : 91 23 __ STA (SP + 0),y 
3c7d : a9 00 __ LDA #$00
3c7f : 85 1c __ STA ACCU + 1 
3c81 : c8 __ __ INY
3c82 : 91 23 __ STA (SP + 0),y 
3c84 : a9 75 __ LDA #$75
3c86 : a0 02 __ LDY #$02
3c88 : 91 23 __ STA (SP + 0),y 
3c8a : a9 6d __ LDA #$6d
3c8c : c8 __ __ INY
3c8d : 91 23 __ STA (SP + 0),y 
3c8f : a9 00 __ LDA #$00
3c91 : c8 __ __ INY
3c92 : 91 23 __ STA (SP + 0),y 
3c94 : a9 3e __ LDA #$3e
3c96 : c8 __ __ INY
3c97 : 91 23 __ STA (SP + 0),y 
3c99 : a5 58 __ LDA T6 + 0 
3c9b : 85 1b __ STA ACCU + 0 
3c9d : a9 11 __ LDA #$11
3c9f : 20 3e 64 JSR $643e ; (mul16by8 + 0)
3ca2 : 38 __ __ SEC
3ca3 : a5 05 __ LDA WORK + 2 
3ca5 : e9 11 __ SBC #$11
3ca7 : aa __ __ TAX
3ca8 : a5 06 __ LDA WORK + 3 
3caa : e9 00 __ SBC #$00
3cac : 85 5d __ STA T9 + 1 
3cae : 8a __ __ TXA
3caf : 18 __ __ CLC
3cb0 : 65 54 __ ADC T2 + 0 
3cb2 : a0 08 __ LDY #$08
3cb4 : 91 23 __ STA (SP + 0),y 
3cb6 : a5 5d __ LDA T9 + 1 
3cb8 : 65 55 __ ADC T2 + 1 
3cba : c8 __ __ INY
3cbb : 91 23 __ STA (SP + 0),y 
3cbd : 20 f9 2f JSR $2ff9 ; (sprintf.s0 + 0)
3cc0 : ad fc bf LDA $bffc ; (sstack + 5)
3cc3 : 85 0f __ STA P2 
3cc5 : a9 75 __ LDA #$75
3cc7 : 85 11 __ STA P4 
3cc9 : a9 6d __ LDA #$6d
3ccb : 85 12 __ STA P5 
3ccd : a9 cd __ LDA #$cd
3ccf : 85 13 __ STA P6 
3cd1 : ad fd bf LDA $bffd ; (sstack + 6)
3cd4 : 85 56 __ STA T3 + 0 
3cd6 : 18 __ __ CLC
3cd7 : 65 58 __ ADC T6 + 0 
3cd9 : 38 __ __ SEC
3cda : e9 01 __ SBC #$01
3cdc : 85 10 __ STA P3 
3cde : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
.l7:
3ce1 : 20 42 36 JSR $3642 ; (vdcwin_getch.s0 + 0)
3ce4 : a5 1b __ LDA ACCU + 0 
3ce6 : 85 5a __ STA T8 + 0 
3ce8 : c9 0d __ CMP #$0d
3cea : f0 18 __ BEQ $3d04 ; (menu_pulldown.s8 + 0)
.s14:
3cec : c9 9d __ CMP #$9d
3cee : f0 14 __ BEQ $3d04 ; (menu_pulldown.s8 + 0)
.s13:
3cf0 : c9 1d __ CMP #$1d
3cf2 : f0 10 __ BEQ $3d04 ; (menu_pulldown.s8 + 0)
.s12:
3cf4 : c9 91 __ CMP #$91
3cf6 : f0 0c __ BEQ $3d04 ; (menu_pulldown.s8 + 0)
.s11:
3cf8 : c9 11 __ CMP #$11
3cfa : f0 08 __ BEQ $3d04 ; (menu_pulldown.s8 + 0)
.s10:
3cfc : c9 1b __ CMP #$1b
3cfe : f0 04 __ BEQ $3d04 ; (menu_pulldown.s8 + 0)
.s9:
3d00 : c9 03 __ CMP #$03
3d02 : d0 dd __ BNE $3ce1 ; (menu_pulldown.l7 + 0)
.s8:
3d04 : a5 1b __ LDA ACCU + 0 
3d06 : c9 1b __ CMP #$1b
3d08 : d0 03 __ BNE $3d0d ; (menu_pulldown.s42 + 0)
3d0a : 4c ea 3d JMP $3dea ; (menu_pulldown.s16 + 0)
.s42:
3d0d : b0 03 __ BCS $3d12 ; (menu_pulldown.s43 + 0)
3d0f : 4c da 3d JMP $3dda ; (menu_pulldown.s44 + 0)
.s43:
3d12 : c9 91 __ CMP #$91
3d14 : f0 43 __ BEQ $3d59 ; (menu_pulldown.s29 + 0)
.s50:
3d16 : b0 2f __ BCS $3d47 ; (menu_pulldown.s51 + 0)
.s52:
3d18 : c9 1d __ CMP #$1d
3d1a : f0 03 __ BEQ $3d1f ; (menu_pulldown.s25 + 0)
3d1c : 4c 77 3c JMP $3c77 ; (menu_pulldown.l5 + 0)
.s25:
3d1f : a5 53 __ LDA T1 + 0 
3d21 : d0 03 __ BNE $3d26 ; (menu_pulldown.s26 + 0)
3d23 : 4c 77 3c JMP $3c77 ; (menu_pulldown.l5 + 0)
.s26:
3d26 : a9 13 __ LDA #$13
.s1045:
3d28 : 85 58 __ STA T6 + 0 
.s6:
3d2a : 20 50 36 JSR $3650 ; (vdcwin_win_free.s0 + 0)
3d2d : a5 58 __ LDA T6 + 0 
3d2f : 85 1b __ STA ACCU + 0 
.s1001:
3d31 : 18 __ __ CLC
3d32 : a5 23 __ LDA SP + 0 
3d34 : 69 0a __ ADC #$0a
3d36 : 85 23 __ STA SP + 0 
3d38 : 90 02 __ BCC $3d3c ; (menu_pulldown.s1001 + 11)
3d3a : e6 24 __ INC SP + 1 
3d3c : a2 0a __ LDX #$0a
3d3e : bd cf bf LDA $bfcf,x ; (bigfont + 180)
3d41 : 95 53 __ STA T1 + 0,x 
3d43 : ca __ __ DEX
3d44 : 10 f8 __ BPL $3d3e ; (menu_pulldown.s1001 + 13)
3d46 : 60 __ __ RTS
.s51:
3d47 : c9 9d __ CMP #$9d
3d49 : f0 03 __ BEQ $3d4e ; (menu_pulldown.s21 + 0)
3d4b : 4c 77 3c JMP $3c77 ; (menu_pulldown.l5 + 0)
.s21:
3d4e : a5 53 __ LDA T1 + 0 
3d50 : d0 03 __ BNE $3d55 ; (menu_pulldown.s22 + 0)
3d52 : 4c 77 3c JMP $3c77 ; (menu_pulldown.l5 + 0)
.s22:
3d55 : a9 12 __ LDA #$12
3d57 : d0 cf __ BNE $3d28 ; (menu_pulldown.s1045 + 0)
.s29:
3d59 : a9 75 __ LDA #$75
3d5b : a0 02 __ LDY #$02
3d5d : 91 23 __ STA (SP + 0),y 
3d5f : a9 6d __ LDA #$6d
3d61 : c8 __ __ INY
3d62 : 91 23 __ STA (SP + 0),y 
3d64 : a9 f9 __ LDA #$f9
3d66 : c8 __ __ INY
3d67 : 91 23 __ STA (SP + 0),y 
3d69 : a9 3d __ LDA #$3d
3d6b : c8 __ __ INY
3d6c : 91 23 __ STA (SP + 0),y 
3d6e : a5 58 __ LDA T6 + 0 
3d70 : 85 1b __ STA ACCU + 0 
3d72 : a9 00 __ LDA #$00
3d74 : 85 1c __ STA ACCU + 1 
3d76 : a9 11 __ LDA #$11
3d78 : 20 3e 64 JSR $643e ; (mul16by8 + 0)
3d7b : 38 __ __ SEC
3d7c : a5 05 __ LDA WORK + 2 
3d7e : e9 11 __ SBC #$11
3d80 : aa __ __ TAX
3d81 : a5 06 __ LDA WORK + 3 
3d83 : e9 00 __ SBC #$00
3d85 : 85 44 __ STA T11 + 1 
3d87 : 8a __ __ TXA
3d88 : 18 __ __ CLC
3d89 : 65 54 __ ADC T2 + 0 
3d8b : a0 06 __ LDY #$06
3d8d : 91 23 __ STA (SP + 0),y 
3d8f : a5 44 __ LDA T11 + 1 
3d91 : 65 55 __ ADC T2 + 1 
3d93 : c8 __ __ INY
3d94 : 91 23 __ STA (SP + 0),y 
3d96 : 20 f9 2f JSR $2ff9 ; (sprintf.s0 + 0)
3d99 : ad fc bf LDA $bffc ; (sstack + 5)
3d9c : 85 0f __ STA P2 
3d9e : a9 75 __ LDA #$75
3da0 : 85 11 __ STA P4 
3da2 : a9 6d __ LDA #$6d
3da4 : 85 12 __ STA P5 
3da6 : a9 c6 __ LDA #$c6
3da8 : 85 13 __ STA P6 
3daa : 18 __ __ CLC
3dab : a5 58 __ LDA T6 + 0 
3dad : 65 56 __ ADC T3 + 0 
3daf : 38 __ __ SEC
3db0 : e9 01 __ SBC #$01
3db2 : 85 10 __ STA P3 
3db4 : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
3db7 : a5 5a __ LDA T8 + 0 
3db9 : c9 91 __ CMP #$91
3dbb : d0 0e __ BNE $3dcb ; (menu_pulldown.s31 + 0)
.s30:
3dbd : c6 58 __ DEC T6 + 0 
3dbf : f0 03 __ BEQ $3dc4 ; (menu_pulldown.s33 + 0)
3dc1 : 4c 77 3c JMP $3c77 ; (menu_pulldown.l5 + 0)
.s33:
3dc4 : a5 57 __ LDA T4 + 0 
.s1044:
3dc6 : 85 58 __ STA T6 + 0 
3dc8 : 4c 77 3c JMP $3c77 ; (menu_pulldown.l5 + 0)
.s31:
3dcb : e6 58 __ INC T6 + 0 
3dcd : a5 57 __ LDA T4 + 0 
3dcf : c5 58 __ CMP T6 + 0 
3dd1 : 90 03 __ BCC $3dd6 ; (menu_pulldown.s36 + 0)
3dd3 : 4c 77 3c JMP $3c77 ; (menu_pulldown.l5 + 0)
.s36:
3dd6 : a9 01 __ LDA #$01
3dd8 : 90 ec __ BCC $3dc6 ; (menu_pulldown.s1044 + 0)
.s44:
3dda : c9 0d __ CMP #$0d
3ddc : d0 03 __ BNE $3de1 ; (menu_pulldown.s45 + 0)
3dde : 4c 2a 3d JMP $3d2a ; (menu_pulldown.s6 + 0)
.s45:
3de1 : b0 0c __ BCS $3def ; (menu_pulldown.s46 + 0)
.s47:
3de3 : c9 03 __ CMP #$03
3de5 : f0 03 __ BEQ $3dea ; (menu_pulldown.s16 + 0)
3de7 : 4c 77 3c JMP $3c77 ; (menu_pulldown.l5 + 0)
.s16:
3dea : a9 00 __ LDA #$00
3dec : 4c 28 3d JMP $3d28 ; (menu_pulldown.s1045 + 0)
.s46:
3def : c9 11 __ CMP #$11
3df1 : d0 03 __ BNE $3df6 ; (menu_pulldown.s46 + 7)
3df3 : 4c 59 3d JMP $3d59 ; (menu_pulldown.s29 + 0)
3df6 : 4c 77 3c JMP $3c77 ; (menu_pulldown.l5 + 0)
--------------------------------------------------------------------
3df9 : __ __ __ BYT 20 25 53 20 00                                  :  %S .
--------------------------------------------------------------------
seed:
3dfe : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
3e00 : __ __ __ BYT 25 43 25 53 20 00                               : %C%S .
--------------------------------------------------------------------
settings_screenmode: ; settings_screenmode()->void
.s1000:
3e06 : a5 53 __ LDA T0 + 0 
3e08 : 8d cd bf STA $bfcd ; (bigfont + 178)
3e0b : a5 54 __ LDA T2 + 0 
3e0d : 8d ce bf STA $bfce ; (bigfont + 179)
.s0:
3e10 : a9 08 __ LDA #$08
3e12 : 85 18 __ STA P11 
3e14 : 8d f7 bf STA $bff7 ; (sstack + 0)
3e17 : a9 f0 __ LDA #$f0
3e19 : 85 17 __ STA P10 
3e1b : a9 1e __ LDA #$1e
3e1d : 8d f8 bf STA $bff8 ; (sstack + 1)
3e20 : a9 0a __ LDA #$0a
3e22 : 8d f9 bf STA $bff9 ; (sstack + 2)
3e25 : ad 63 6d LDA $6d63 ; (vdc_state + 7)
3e28 : 85 53 __ STA T0 + 0 
3e2a : a9 8d __ LDA #$8d
3e2c : 8d 63 6d STA $6d63 ; (vdc_state + 7)
3e2f : 20 4f 31 JSR $314f ; (vdcwin_win_new.s1000 + 0)
3e32 : a9 3e __ LDA #$3e
3e34 : 85 12 __ STA P5 
3e36 : a9 70 __ LDA #$70
3e38 : 85 11 __ STA P4 
3e3a : 20 ed 2e JSR $2eed ; (vdc_prints_attr@proxy + 0)
3e3d : a9 19 __ LDA #$19
3e3f : 8d fc bf STA $bffc ; (sstack + 5)
3e42 : a9 0b __ LDA #$0b
3e44 : 8d fd bf STA $bffd ; (sstack + 6)
3e47 : a9 07 __ LDA #$07
3e49 : 8d fe bf STA $bffe ; (sstack + 7)
3e4c : 20 b0 3b JSR $3bb0 ; (menu_pulldown.s1000 + 0)
3e4f : a5 1b __ LDA ACCU + 0 
3e51 : 85 54 __ STA T2 + 0 
3e53 : 20 50 36 JSR $3650 ; (vdcwin_win_free.s0 + 0)
3e56 : a4 54 __ LDY T2 + 0 
3e58 : f0 06 __ BEQ $3e60 ; (settings_screenmode.s4 + 0)
.s2:
3e5a : 88 __ __ DEY
3e5b : 84 16 __ STY P9 
3e5d : 20 05 2c JSR $2c05 ; (vdc_set_mode.s1000 + 0)
.s4:
3e60 : a5 53 __ LDA T0 + 0 
3e62 : 8d 63 6d STA $6d63 ; (vdc_state + 7)
.s1001:
3e65 : ad cd bf LDA $bfcd ; (bigfont + 178)
3e68 : 85 53 __ STA T0 + 0 
3e6a : ad ce bf LDA $bfce ; (bigfont + 179)
3e6d : 85 54 __ STA T2 + 0 
3e6f : 60 __ __ RTS
--------------------------------------------------------------------
3e70 : __ __ __ BYT 73 45 4c 45 43 54 20 53 43 52 45 45 4e 20 4d 4f : sELECT SCREEN MO
3e80 : __ __ __ BYT 44 45 00                                        : DE.
--------------------------------------------------------------------
settings_versioninfo: ; settings_versioninfo()->void
.s1000:
3e83 : 38 __ __ SEC
3e84 : a5 23 __ LDA SP + 0 
3e86 : e9 08 __ SBC #$08
3e88 : 85 23 __ STA SP + 0 
3e8a : b0 02 __ BCS $3e8e ; (settings_versioninfo.s0 + 0)
3e8c : c6 24 __ DEC SP + 1 
.s0:
3e8e : a9 05 __ LDA #$05
3e90 : 85 18 __ STA P11 
3e92 : 8d f7 bf STA $bff7 ; (sstack + 0)
3e95 : a9 f0 __ LDA #$f0
3e97 : 85 17 __ STA P10 
3e99 : a9 3c __ LDA #$3c
3e9b : 8d f8 bf STA $bff8 ; (sstack + 1)
3e9e : a9 0f __ LDA #$0f
3ea0 : 8d f9 bf STA $bff9 ; (sstack + 2)
3ea3 : ad 63 6d LDA $6d63 ; (vdc_state + 7)
3ea6 : 85 52 __ STA T0 + 0 
3ea8 : a9 8d __ LDA #$8d
3eaa : 8d 63 6d STA $6d63 ; (vdc_state + 7)
3ead : 20 4f 31 JSR $314f ; (vdcwin_win_new.s1000 + 0)
3eb0 : a9 06 __ LDA #$06
3eb2 : 85 0f __ STA P2 
3eb4 : 85 10 __ STA P3 
3eb6 : a9 ad __ LDA #$ad
3eb8 : 8d 63 6d STA $6d63 ; (vdc_state + 7)
3ebb : 85 13 __ STA P6 
3ebd : a9 76 __ LDA #$76
3ebf : 85 11 __ STA P4 
3ec1 : a9 3f __ LDA #$3f
3ec3 : 85 12 __ STA P5 
3ec5 : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
3ec8 : a9 8d __ LDA #$8d
3eca : 8d 63 6d STA $6d63 ; (vdc_state + 7)
3ecd : 85 13 __ STA P6 
3ecf : a9 08 __ LDA #$08
3ed1 : 85 10 __ STA P3 
3ed3 : a9 96 __ LDA #$96
3ed5 : 85 11 __ STA P4 
3ed7 : a9 3f __ LDA #$3f
3ed9 : 85 12 __ STA P5 
3edb : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
3ede : e6 10 __ INC P3 
3ee0 : a9 a7 __ LDA #$a7
3ee2 : 85 11 __ STA P4 
3ee4 : a9 3f __ LDA #$3f
3ee6 : 85 12 __ STA P5 
3ee8 : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
3eeb : a9 75 __ LDA #$75
3eed : a0 02 __ LDY #$02
3eef : 91 23 __ STA (SP + 0),y 
3ef1 : a9 6d __ LDA #$6d
3ef3 : c8 __ __ INY
3ef4 : 91 23 __ STA (SP + 0),y 
3ef6 : a9 c5 __ LDA #$c5
3ef8 : c8 __ __ INY
3ef9 : 91 23 __ STA (SP + 0),y 
3efb : a9 3f __ LDA #$3f
3efd : c8 __ __ INY
3efe : 91 23 __ STA (SP + 0),y 
3f00 : a9 d1 __ LDA #$d1
3f02 : c8 __ __ INY
3f03 : 91 23 __ STA (SP + 0),y 
3f05 : a9 3f __ LDA #$3f
3f07 : c8 __ __ INY
3f08 : 91 23 __ STA (SP + 0),y 
3f0a : 20 f9 2f JSR $2ff9 ; (sprintf.s0 + 0)
3f0d : a9 06 __ LDA #$06
3f0f : 85 0f __ STA P2 
3f11 : a9 0a __ LDA #$0a
3f13 : 85 10 __ STA P3 
3f15 : 20 f6 67 JSR $67f6 ; (vdc_prints_attr@proxy + 0)
3f18 : a9 0c __ LDA #$0c
3f1a : 85 10 __ STA P3 
3f1c : a9 3f __ LDA #$3f
3f1e : 85 12 __ STA P5 
3f20 : a9 e3 __ LDA #$e3
3f22 : 85 11 __ STA P4 
3f24 : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
3f27 : e6 10 __ INC P3 
3f29 : a9 00 __ LDA #$00
3f2b : 85 11 __ STA P4 
3f2d : a9 40 __ LDA #$40
3f2f : 85 12 __ STA P5 
3f31 : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
3f34 : e6 10 __ INC P3 
3f36 : a9 30 __ LDA #$30
3f38 : 85 11 __ STA P4 
3f3a : a9 40 __ LDA #$40
3f3c : 85 12 __ STA P5 
3f3e : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
3f41 : a9 10 __ LDA #$10
3f43 : 85 10 __ STA P3 
3f45 : a9 40 __ LDA #$40
3f47 : 85 12 __ STA P5 
3f49 : a9 57 __ LDA #$57
3f4b : 85 11 __ STA P4 
3f4d : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
3f50 : a9 12 __ LDA #$12
3f52 : 85 10 __ STA P3 
3f54 : a9 40 __ LDA #$40
3f56 : 85 12 __ STA P5 
3f58 : a9 74 __ LDA #$74
3f5a : 85 11 __ STA P4 
3f5c : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
3f5f : 20 9d 2b JSR $2b9d ; (getch.s0 + 0)
3f62 : 20 50 36 JSR $3650 ; (vdcwin_win_free.s0 + 0)
3f65 : a5 52 __ LDA T0 + 0 
3f67 : 8d 63 6d STA $6d63 ; (vdc_state + 7)
.s1001:
3f6a : 18 __ __ CLC
3f6b : a5 23 __ LDA SP + 0 
3f6d : 69 08 __ ADC #$08
3f6f : 85 23 __ STA SP + 0 
3f71 : 90 02 __ BCC $3f75 ; (settings_versioninfo.s1001 + 11)
3f73 : e6 24 __ INC SP + 1 
3f75 : 60 __ __ RTS
--------------------------------------------------------------------
3f76 : __ __ __ BYT 76 45 52 53 49 4f 4e 20 49 4e 46 4f 52 4d 41 54 : vERSION INFORMAT
3f86 : __ __ __ BYT 49 4f 4e 20 41 4e 44 20 43 52 45 44 49 54 53 00 : ION AND CREDITS.
--------------------------------------------------------------------
3f96 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d 4f : oSCAR64 vdc dEMO
3fa6 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
3fa7 : __ __ __ BYT 77 52 49 54 54 45 4e 20 49 4e 20 32 30 32 34 20 : wRITTEN IN 2024 
3fb7 : __ __ __ BYT 42 59 20 78 41 4e 44 45 52 20 6d 4f 4c 00       : BY xANDER mOL.
--------------------------------------------------------------------
3fc5 : __ __ __ BYT 76 45 52 53 49 4f 4e 3a 20 25 53 00             : vERSION: %S.
--------------------------------------------------------------------
3fd1 : __ __ __ BYT 56 30 31 2d 32 30 32 34 30 36 32 39 2d 31 35 33 : V01-20240629-153
3fe1 : __ __ __ BYT 35 00                                           : 5.
--------------------------------------------------------------------
3fe3 : __ __ __ BYT 6d 55 53 49 43 20 42 59 20 6e 4f 52 44 49 53 43 : mUSIC BY nORDISC
3ff3 : __ __ __ BYT 48 53 4f 55 4e 44 00                            : HSOUND.
--------------------------------------------------------------------
__multab36L:
3ffa : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
4000 : __ __ __ BYT 66 55 4c 4c 20 53 4f 55 52 43 45 20 43 4f 44 45 : fULL SOURCE CODE
4010 : __ __ __ BYT 2c 20 44 4f 43 55 4d 45 4e 54 41 54 49 4f 4e 20 : , DOCUMENTATION 
4020 : __ __ __ BYT 41 4e 44 20 43 52 45 44 49 54 53 20 41 54 3a 00 : AND CREDITS AT:.
--------------------------------------------------------------------
4030 : __ __ __ BYT 48 54 54 50 53 3a 2f 2f 47 49 54 48 55 42 2e 43 : HTTPS://GITHUB.C
4040 : __ __ __ BYT 4f 4d 2f 58 41 48 4d 4f 4c 2f 6f 53 43 41 52 36 : OM/XAHMOL/oSCAR6
4050 : __ __ __ BYT 34 74 45 53 54 2f 00                            : 4tEST/.
--------------------------------------------------------------------
4057 : __ __ __ BYT 28 63 29 20 32 30 32 34 2c 20 69 64 52 45 41 4d : (c) 2024, idREAM
4067 : __ __ __ BYT 54 69 4e 38 62 49 54 53 2e 43 4f 4d 00          : TiN8bITS.COM.
--------------------------------------------------------------------
4074 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 54 4f 20 43 : pRESS A KEY TO C
4084 : __ __ __ BYT 4f 4e 54 49 4e 55 45 2e 00                      : ONTINUE..
--------------------------------------------------------------------
windows_windowstacking: ; windows_windowstacking()->void
.s1000:
408d : a2 04 __ LDX #$04
408f : b5 53 __ LDA T0 + 0,x 
4091 : 9d 45 bf STA $bf45,x ; (bigfont + 42)
4094 : ca __ __ DEX
4095 : 10 f8 __ BPL $408f ; (windows_windowstacking.s1000 + 2)
.s0:
4097 : ad 08 dc LDA $dc08 
409a : 18 __ __ CLC
409b : 6d 09 dc ADC $dc09 
409e : a0 00 __ LDY #$00
40a0 : 90 01 __ BCC $40a3 ; (windows_windowstacking.s1007 + 0)
.s1006:
40a2 : c8 __ __ INY
.s1007:
40a3 : 18 __ __ CLC
40a4 : 69 01 __ ADC #$01
40a6 : 8d fe 3d STA $3dfe ; (seed + 0)
40a9 : 90 01 __ BCC $40ac ; (windows_windowstacking.s1009 + 0)
.s1008:
40ab : c8 __ __ INY
.s1009:
40ac : 8c ff 3d STY $3dff ; (seed + 1)
40af : a9 00 __ LDA #$00
40b1 : 85 54 __ STA T1 + 0 
40b3 : 85 55 __ STA T1 + 1 
40b5 : 85 56 __ STA T2 + 0 
40b7 : 85 57 __ STA T3 + 0 
.l2:
40b9 : a5 54 __ LDA T1 + 0 
40bb : 29 01 __ AND #$01
40bd : 09 f0 __ ORA #$f0
40bf : 85 17 __ STA P10 
40c1 : a9 28 __ LDA #$28
40c3 : 8d f8 bf STA $bff8 ; (sstack + 1)
40c6 : 18 __ __ CLC
40c7 : a5 57 __ LDA T3 + 0 
40c9 : 69 05 __ ADC #$05
40cb : 85 18 __ STA P11 
40cd : 18 __ __ CLC
40ce : a5 56 __ LDA T2 + 0 
40d0 : 69 05 __ ADC #$05
40d2 : 8d f7 bf STA $bff7 ; (sstack + 0)
40d5 : ad 61 6d LDA $6d61 ; (vdc_state + 5)
40d8 : 85 1b __ STA ACCU + 0 
40da : ad 62 6d LDA $6d62 ; (vdc_state + 6)
40dd : 85 1c __ STA ACCU + 1 
40df : a9 03 __ LDA #$03
40e1 : 85 03 __ STA WORK + 0 
40e3 : a9 00 __ LDA #$00
40e5 : 85 04 __ STA WORK + 1 
40e7 : 20 a0 64 JSR $64a0 ; (divmod + 0)
40ea : a5 1b __ LDA ACCU + 0 
40ec : 8d f9 bf STA $bff9 ; (sstack + 2)
40ef : 20 4f 31 JSR $314f ; (vdcwin_win_new.s1000 + 0)
40f2 : a9 64 __ LDA #$64
40f4 : 85 53 __ STA T0 + 0 
.l5:
40f6 : a9 75 __ LDA #$75
40f8 : 8d fc bf STA $bffc ; (sstack + 5)
40fb : a9 6d __ LDA #$6d
40fd : 8d fd bf STA $bffd ; (sstack + 6)
4100 : 20 31 42 JSR $4231 ; (rand.s0 + 0)
4103 : ad 63 6d LDA $6d63 ; (vdc_state + 7)
4106 : 29 f0 __ AND #$f0
4108 : 85 46 __ STA T7 + 0 
410a : 20 f3 60 JSR $60f3 ; (divmod@proxy + 0)
410d : a5 05 __ LDA WORK + 2 
410f : 38 __ __ SEC
4110 : 65 46 __ ADC T7 + 0 
4112 : 8d 63 6d STA $6d63 ; (vdc_state + 7)
4115 : 20 58 42 JSR $4258 ; (generateSentence.s1000 + 0)
4118 : a9 75 __ LDA #$75
411a : 8d fc bf STA $bffc ; (sstack + 5)
411d : a9 6d __ LDA #$6d
411f : 8d fd bf STA $bffd ; (sstack + 6)
4122 : ad 49 6d LDA $6d49 ; (winCfg + 5)
4125 : 85 1b __ STA ACCU + 0 
4127 : a9 00 __ LDA #$00
4129 : 85 1c __ STA ACCU + 1 
412b : a9 0d __ LDA #$0d
412d : 20 3e 64 JSR $643e ; (mul16by8 + 0)
4130 : 18 __ __ CLC
4131 : a9 bc __ LDA #$bc
4133 : 65 05 __ ADC WORK + 2 
4135 : 8d fa bf STA $bffa ; (sstack + 3)
4138 : a9 6d __ LDA #$6d
413a : 69 00 __ ADC #$00
413c : 8d fb bf STA $bffb ; (sstack + 4)
413f : 20 82 43 JSR $4382 ; (vdcwin_printwrap.s1000 + 0)
4142 : ac 49 6d LDY $6d49 ; (winCfg + 5)
4145 : be 5a 67 LDX $675a,y ; (__multab13L + 0)
4148 : bd c0 6d LDA $6dc0,x ; (linebuffer + 75)
414b : f0 17 __ BEQ $4164 ; (windows_windowstacking.s60 + 0)
.s9:
414d : 86 43 __ STX T5 + 0 
414f : a9 20 __ LDA #$20
4151 : 8d f7 bf STA $bff7 ; (sstack + 0)
4154 : 18 __ __ CLC
4155 : a9 bc __ LDA #$bc
4157 : 65 43 __ ADC T5 + 0 
4159 : 85 17 __ STA P10 
415b : a9 6d __ LDA #$6d
415d : 69 00 __ ADC #$00
415f : 85 18 __ STA P11 
4161 : 20 67 48 JSR $4867 ; (vdcwin_put_char.s1000 + 0)
.s60:
4164 : c6 53 __ DEC T0 + 0 
4166 : d0 8e __ BNE $40f6 ; (windows_windowstacking.l5 + 0)
.s7:
4168 : 20 9d 2b JSR $2b9d ; (getch.s0 + 0)
416b : ad 63 6d LDA $6d63 ; (vdc_state + 7)
416e : 29 f0 __ AND #$f0
4170 : 09 0d __ ORA #$0d
4172 : 8d 63 6d STA $6d63 ; (vdc_state + 7)
4175 : e6 54 __ INC T1 + 0 
4177 : d0 02 __ BNE $417b ; (windows_windowstacking.s1011 + 0)
.s1010:
4179 : e6 55 __ INC T1 + 1 
.s1011:
417b : 18 __ __ CLC
417c : a5 57 __ LDA T3 + 0 
417e : 69 05 __ ADC #$05
4180 : 85 57 __ STA T3 + 0 
4182 : 18 __ __ CLC
4183 : a5 56 __ LDA T2 + 0 
4185 : 69 03 __ ADC #$03
4187 : 85 56 __ STA T2 + 0 
4189 : ad 49 6d LDA $6d49 ; (winCfg + 5)
418c : c9 03 __ CMP #$03
418e : b0 03 __ BCS $4193 ; (windows_windowstacking.l13 + 0)
4190 : 4c b9 40 JMP $40b9 ; (windows_windowstacking.l2 + 0)
.l13:
4193 : 20 50 36 JSR $3650 ; (vdcwin_win_free.s0 + 0)
4196 : a9 64 __ LDA #$64
4198 : 85 53 __ STA T0 + 0 
.l16:
419a : a9 75 __ LDA #$75
419c : 8d fc bf STA $bffc ; (sstack + 5)
419f : a9 6d __ LDA #$6d
41a1 : 8d fd bf STA $bffd ; (sstack + 6)
41a4 : 20 31 42 JSR $4231 ; (rand.s0 + 0)
41a7 : ad 63 6d LDA $6d63 ; (vdc_state + 7)
41aa : 29 f0 __ AND #$f0
41ac : 85 57 __ STA T3 + 0 
41ae : 20 f3 60 JSR $60f3 ; (divmod@proxy + 0)
41b1 : a5 05 __ LDA WORK + 2 
41b3 : 38 __ __ SEC
41b4 : 65 57 __ ADC T3 + 0 
41b6 : 8d 63 6d STA $6d63 ; (vdc_state + 7)
41b9 : 20 58 42 JSR $4258 ; (generateSentence.s1000 + 0)
41bc : a9 75 __ LDA #$75
41be : 8d fc bf STA $bffc ; (sstack + 5)
41c1 : a9 6d __ LDA #$6d
41c3 : 8d fd bf STA $bffd ; (sstack + 6)
41c6 : ad 49 6d LDA $6d49 ; (winCfg + 5)
41c9 : 85 1b __ STA ACCU + 0 
41cb : a9 00 __ LDA #$00
41cd : 85 1c __ STA ACCU + 1 
41cf : a9 0d __ LDA #$0d
41d1 : 20 3e 64 JSR $643e ; (mul16by8 + 0)
41d4 : 18 __ __ CLC
41d5 : a9 bc __ LDA #$bc
41d7 : 65 05 __ ADC WORK + 2 
41d9 : 8d fa bf STA $bffa ; (sstack + 3)
41dc : a9 6d __ LDA #$6d
41de : 69 00 __ ADC #$00
41e0 : 8d fb bf STA $bffb ; (sstack + 4)
41e3 : 20 82 43 JSR $4382 ; (vdcwin_printwrap.s1000 + 0)
41e6 : ac 49 6d LDY $6d49 ; (winCfg + 5)
41e9 : be 5a 67 LDX $675a,y ; (__multab13L + 0)
41ec : bd c0 6d LDA $6dc0,x ; (linebuffer + 75)
41ef : f0 17 __ BEQ $4208 ; (windows_windowstacking.s61 + 0)
.s20:
41f1 : 86 56 __ STX T2 + 0 
41f3 : a9 20 __ LDA #$20
41f5 : 8d f7 bf STA $bff7 ; (sstack + 0)
41f8 : 18 __ __ CLC
41f9 : a9 bc __ LDA #$bc
41fb : 65 56 __ ADC T2 + 0 
41fd : 85 17 __ STA P10 
41ff : a9 6d __ LDA #$6d
4201 : 69 00 __ ADC #$00
4203 : 85 18 __ STA P11 
4205 : 20 67 48 JSR $4867 ; (vdcwin_put_char.s1000 + 0)
.s61:
4208 : c6 53 __ DEC T0 + 0 
420a : d0 8e __ BNE $419a ; (windows_windowstacking.l16 + 0)
.s18:
420c : 20 9d 2b JSR $2b9d ; (getch.s0 + 0)
420f : ad 63 6d LDA $6d63 ; (vdc_state + 7)
4212 : 29 f0 __ AND #$f0
4214 : 09 0d __ ORA #$0d
4216 : 8d 63 6d STA $6d63 ; (vdc_state + 7)
4219 : a9 01 __ LDA #$01
421b : cd 49 6d CMP $6d49 ; (winCfg + 5)
421e : b0 03 __ BCS $4223 ; (windows_windowstacking.s14 + 0)
4220 : 4c 93 41 JMP $4193 ; (windows_windowstacking.l13 + 0)
.s14:
4223 : 20 50 36 JSR $3650 ; (vdcwin_win_free.s0 + 0)
.s1001:
4226 : a2 04 __ LDX #$04
4228 : bd 45 bf LDA $bf45,x ; (bigfont + 42)
422b : 95 53 __ STA T0 + 0,x 
422d : ca __ __ DEX
422e : 10 f8 __ BPL $4228 ; (windows_windowstacking.s1001 + 2)
4230 : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
.s0:
4231 : ad ff 3d LDA $3dff ; (seed + 1)
4234 : 4a __ __ LSR
4235 : ad fe 3d LDA $3dfe ; (seed + 0)
4238 : 6a __ __ ROR
4239 : aa __ __ TAX
423a : a9 00 __ LDA #$00
423c : 6a __ __ ROR
423d : 4d fe 3d EOR $3dfe ; (seed + 0)
4240 : 85 1b __ STA ACCU + 0 
4242 : 8a __ __ TXA
4243 : 4d ff 3d EOR $3dff ; (seed + 1)
4246 : 85 1c __ STA ACCU + 1 
4248 : 4a __ __ LSR
4249 : 45 1b __ EOR ACCU + 0 
424b : 8d fe 3d STA $3dfe ; (seed + 0)
424e : 85 1b __ STA ACCU + 0 
4250 : 45 1c __ EOR ACCU + 1 
4252 : 8d ff 3d STA $3dff ; (seed + 1)
4255 : 85 1c __ STA ACCU + 1 
.s1001:
4257 : 60 __ __ RTS
--------------------------------------------------------------------
generateSentence: ; generateSentence(u8*)->void
.s1000:
4258 : a5 53 __ LDA T2 + 0 
425a : 8d 4e bf STA $bf4e ; (bigfont + 51)
425d : a5 54 __ LDA T2 + 1 
425f : 8d 4f bf STA $bf4f ; (bigfont + 52)
4262 : 38 __ __ SEC
4263 : a5 23 __ LDA SP + 0 
4265 : e9 0e __ SBC #$0e
4267 : 85 23 __ STA SP + 0 
4269 : b0 02 __ BCS $426d ; (generateSentence.s0 + 0)
426b : c6 24 __ DEC SP + 1 
.s0:
426d : a9 00 __ LDA #$00
426f : 8d da bf STA $bfda ; (bigfont + 191)
4272 : 8d dc bf STA $bfdc ; (bigfont + 193)
4275 : 8d dd bf STA $bfdd ; (bigfont + 194)
4278 : 8d de bf STA $bfde ; (bigfont + 195)
427b : a9 74 __ LDA #$74
427d : 8d d7 bf STA $bfd7 ; (bigfont + 188)
4280 : a9 48 __ LDA #$48
4282 : 8d d8 bf STA $bfd8 ; (bigfont + 189)
4285 : a9 45 __ LDA #$45
4287 : 8d d9 bf STA $bfd9 ; (bigfont + 190)
428a : a9 61 __ LDA #$61
428c : 8d db bf STA $bfdb ; (bigfont + 192)
428f : a2 4b __ LDX #$4b
.l1002:
4291 : bd 9e 68 LDA $689e,x ; (pulldown_options + 7)
4294 : 9d 8b bf STA $bf8b,x ; (bigfont + 112)
4297 : ca __ __ DEX
4298 : d0 f7 __ BNE $4291 ; (generateSentence.l1002 + 0)
.s1003:
429a : a2 1e __ LDX #$1e
.l1004:
429c : bd 07 6d LDA $6d07,x ; (pulldown_titles + 815)
429f : 9d 6d bf STA $bf6d,x ; (bigfont + 82)
42a2 : ca __ __ DEX
42a3 : d0 f7 __ BNE $429c ; (generateSentence.l1004 + 0)
.s1005:
42a5 : a2 1e __ LDX #$1e
.l1006:
42a7 : bd 25 6d LDA $6d25,x 
42aa : 9d 4f bf STA $bf4f,x ; (bigfont + 52)
42ad : ca __ __ DEX
42ae : d0 f7 __ BNE $42a7 ; (generateSentence.l1006 + 0)
.s1007:
42b0 : 20 31 42 JSR $4231 ; (rand.s0 + 0)
42b3 : a5 1b __ LDA ACCU + 0 
42b5 : 85 4e __ STA T0 + 0 
42b7 : 20 31 42 JSR $4231 ; (rand.s0 + 0)
42ba : a5 1b __ LDA ACCU + 0 
42bc : 85 4f __ STA T1 + 0 
42be : a5 1c __ LDA ACCU + 1 
42c0 : 85 50 __ STA T1 + 1 
42c2 : 20 31 42 JSR $4231 ; (rand.s0 + 0)
42c5 : a5 1b __ LDA ACCU + 0 
42c7 : 85 53 __ STA T2 + 0 
42c9 : a5 1c __ LDA ACCU + 1 
42cb : 85 54 __ STA T2 + 1 
42cd : 20 31 42 JSR $4231 ; (rand.s0 + 0)
42d0 : ad fc bf LDA $bffc ; (sstack + 5)
42d3 : 85 45 __ STA T4 + 0 
42d5 : ad fd bf LDA $bffd ; (sstack + 6)
42d8 : 85 46 __ STA T4 + 1 
42da : a9 00 __ LDA #$00
42dc : 85 04 __ STA WORK + 1 
42de : a8 __ __ TAY
42df : 91 45 __ STA (T4 + 0),y 
42e1 : a5 45 __ LDA T4 + 0 
42e3 : a0 02 __ LDY #$02
42e5 : 91 23 __ STA (SP + 0),y 
42e7 : a5 46 __ LDA T4 + 1 
42e9 : c8 __ __ INY
42ea : 91 23 __ STA (SP + 0),y 
42ec : a9 75 __ LDA #$75
42ee : c8 __ __ INY
42ef : 91 23 __ STA (SP + 0),y 
42f1 : a9 43 __ LDA #$43
42f3 : c8 __ __ INY
42f4 : 84 03 __ STY WORK + 0 
42f6 : 91 23 __ STA (SP + 0),y 
42f8 : a5 4e __ LDA T0 + 0 
42fa : 29 01 __ AND #$01
42fc : 0a __ __ ASL
42fd : 0a __ __ ASL
42fe : 69 d7 __ ADC #$d7
4300 : c8 __ __ INY
4301 : 91 23 __ STA (SP + 0),y 
4303 : a9 bf __ LDA #$bf
4305 : 69 00 __ ADC #$00
4307 : c8 __ __ INY
4308 : 91 23 __ STA (SP + 0),y 
430a : 20 a0 64 JSR $64a0 ; (divmod + 0)
430d : a6 05 __ LDX WORK + 2 
430f : bd 75 67 LDA $6775,x ; (__multab6L + 0)
4312 : 18 __ __ CLC
4313 : 69 50 __ ADC #$50
4315 : a0 08 __ LDY #$08
4317 : 91 23 __ STA (SP + 0),y 
4319 : a9 bf __ LDA #$bf
431b : 69 00 __ ADC #$00
431d : c8 __ __ INY
431e : 91 23 __ STA (SP + 0),y 
4320 : a5 4f __ LDA T1 + 0 
4322 : 85 1b __ STA ACCU + 0 
4324 : a5 50 __ LDA T1 + 1 
4326 : 85 1c __ STA ACCU + 1 
4328 : 20 3d 68 JSR $683d ; (divmod@proxy + 0)
432b : a6 05 __ LDX WORK + 2 
432d : bd 7a 67 LDA $677a,x ; (__multab15L + 0)
4330 : 18 __ __ CLC
4331 : 69 8c __ ADC #$8c
4333 : a0 0a __ LDY #$0a
4335 : 91 23 __ STA (SP + 0),y 
4337 : a9 bf __ LDA #$bf
4339 : 69 00 __ ADC #$00
433b : c8 __ __ INY
433c : 91 23 __ STA (SP + 0),y 
433e : a5 53 __ LDA T2 + 0 
4340 : 85 1b __ STA ACCU + 0 
4342 : a5 54 __ LDA T2 + 1 
4344 : 85 1c __ STA ACCU + 1 
4346 : 20 3d 68 JSR $683d ; (divmod@proxy + 0)
4349 : a6 05 __ LDX WORK + 2 
434b : bd 75 67 LDA $6775,x ; (__multab6L + 0)
434e : 18 __ __ CLC
434f : 69 6e __ ADC #$6e
4351 : a0 0c __ LDY #$0c
4353 : 91 23 __ STA (SP + 0),y 
4355 : a9 bf __ LDA #$bf
4357 : 69 00 __ ADC #$00
4359 : c8 __ __ INY
435a : 91 23 __ STA (SP + 0),y 
435c : 20 f9 2f JSR $2ff9 ; (sprintf.s0 + 0)
.s1001:
435f : 18 __ __ CLC
4360 : a5 23 __ LDA SP + 0 
4362 : 69 0e __ ADC #$0e
4364 : 85 23 __ STA SP + 0 
4366 : 90 02 __ BCC $436a ; (generateSentence.s1001 + 11)
4368 : e6 24 __ INC SP + 1 
436a : ad 4e bf LDA $bf4e ; (bigfont + 51)
436d : 85 53 __ STA T2 + 0 
436f : ad 4f bf LDA $bf4f ; (bigfont + 52)
4372 : 85 54 __ STA T2 + 1 
4374 : 60 __ __ RTS
--------------------------------------------------------------------
4375 : __ __ __ BYT 25 53 20 25 53 20 25 53 20 25 53 2e 00          : %S %S %S %S..
--------------------------------------------------------------------
vdcwin_printwrap: ; vdcwin_printwrap(struct VDCWin*,const u8*)->void
.s1000:
4382 : a2 04 __ LDX #$04
4384 : b5 53 __ LDA T0 + 0,x 
4386 : 9d 90 bf STA $bf90,x ; (bigfont + 117)
4389 : ca __ __ DEX
438a : 10 f8 __ BPL $4384 ; (vdcwin_printwrap.s1000 + 2)
438c : 38 __ __ SEC
438d : a5 23 __ LDA SP + 0 
438f : e9 06 __ SBC #$06
4391 : 85 23 __ STA SP + 0 
4393 : b0 02 __ BCS $4397 ; (vdcwin_printwrap.s0 + 0)
4395 : c6 24 __ DEC SP + 1 
.s0:
4397 : ad fc bf LDA $bffc ; (sstack + 5)
439a : 85 0d __ STA P0 
439c : ad fd bf LDA $bffd ; (sstack + 6)
439f : 85 0e __ STA P1 
43a1 : 20 d5 2f JSR $2fd5 ; (strlen.s0 + 0)
43a4 : a5 1b __ LDA ACCU + 0 
43a6 : f0 3b __ BEQ $43e3 ; (vdcwin_printwrap.s1001 + 0)
.s30:
43a8 : 85 53 __ STA T0 + 0 
43aa : a9 00 __ LDA #$00
43ac : 85 55 __ STA T3 + 0 
43ae : 85 45 __ STA T6 + 0 
43b0 : a9 ff __ LDA #$ff
43b2 : 85 57 __ STA T4 + 1 
43b4 : 85 44 __ STA T5 + 1 
43b6 : ad fa bf LDA $bffa ; (sstack + 3)
43b9 : 85 1b __ STA ACCU + 0 
43bb : ad fb bf LDA $bffb ; (sstack + 4)
43be : 85 1c __ STA ACCU + 1 ; (win + 0)
43c0 : a0 02 __ LDY #$02
43c2 : b1 1b __ LDA (ACCU + 0),y 
43c4 : 85 54 __ STA T1 + 0 
.l4:
43c6 : a5 55 __ LDA T3 + 0 
43c8 : c5 53 __ CMP T0 + 0 
43ca : b0 0d __ BCS $43d9 ; (vdcwin_printwrap.s7 + 0)
.l9:
43cc : 24 44 __ BIT T5 + 1 
43ce : 10 09 __ BPL $43d9 ; (vdcwin_printwrap.s7 + 0)
.s8:
43d0 : a5 45 __ LDA T6 + 0 
43d2 : c9 50 __ CMP #$50
43d4 : b0 03 __ BCS $43d9 ; (vdcwin_printwrap.s7 + 0)
43d6 : 4c da 44 JMP $44da ; (vdcwin_printwrap.s6 + 0)
.s7:
43d9 : a6 45 __ LDX T6 + 0 
43db : d0 1c __ BNE $43f9 ; (vdcwin_printwrap.s19 + 0)
.s1:
43dd : a5 55 __ LDA T3 + 0 
43df : c5 53 __ CMP T0 + 0 
43e1 : 90 e9 __ BCC $43cc ; (vdcwin_printwrap.l9 + 0)
.s1001:
43e3 : 18 __ __ CLC
43e4 : a5 23 __ LDA SP + 0 
43e6 : 69 06 __ ADC #$06
43e8 : 85 23 __ STA SP + 0 
43ea : 90 02 __ BCC $43ee ; (vdcwin_printwrap.s1001 + 11)
43ec : e6 24 __ INC SP + 1 
43ee : a2 04 __ LDX #$04
43f0 : bd 90 bf LDA $bf90,x ; (bigfont + 117)
43f3 : 95 53 __ STA T0 + 0,x 
43f5 : ca __ __ DEX
43f6 : 10 f8 __ BPL $43f0 ; (vdcwin_printwrap.s1001 + 13)
43f8 : 60 __ __ RTS
.s19:
43f9 : a9 00 __ LDA #$00
43fb : 9d 98 bf STA $bf98,x ; (bigfont + 125)
43fe : a9 98 __ LDA #$98
4400 : 85 0d __ STA P0 
4402 : a9 bf __ LDA #$bf
4404 : 85 0e __ STA P1 
4406 : 20 d5 2f JSR $2fd5 ; (strlen.s0 + 0)
4409 : ad fa bf LDA $bffa ; (sstack + 3)
440c : 85 56 __ STA T4 + 0 
440e : ad fb bf LDA $bffb ; (sstack + 4)
4411 : 85 57 __ STA T4 + 1 
4413 : 4c 19 44 JMP $4419 ; (vdcwin_printwrap.l22 + 0)
.s1013:
4416 : 20 d5 2f JSR $2fd5 ; (strlen.s0 + 0)
.l22:
4419 : a0 02 __ LDY #$02
441b : b1 56 __ LDA (T4 + 0),y 
441d : c5 1b __ CMP ACCU + 0 
441f : 90 57 __ BCC $4478 ; (vdcwin_printwrap.s23 + 0)
.s24:
4421 : a0 04 __ LDY #$04
4423 : b1 56 __ LDA (T4 + 0),y 
4425 : 18 __ __ CLC
4426 : 65 1b __ ADC ACCU + 0 
4428 : b0 06 __ BCS $4430 ; (vdcwin_printwrap.s25 + 0)
.s1010:
442a : c5 54 __ CMP T1 + 0 
442c : 90 1a __ BCC $4448 ; (vdcwin_printwrap.s27 + 0)
.s1018:
442e : f0 18 __ BEQ $4448 ; (vdcwin_printwrap.s27 + 0)
.s25:
4430 : a5 56 __ LDA T4 + 0 
4432 : a0 02 __ LDY #$02
4434 : 91 23 __ STA (SP + 0),y 
4436 : a5 57 __ LDA T4 + 1 
4438 : c8 __ __ INY
4439 : 91 23 __ STA (SP + 0),y 
443b : a9 ff __ LDA #$ff
443d : c8 __ __ INY
443e : 91 23 __ STA (SP + 0),y 
4440 : a9 27 __ LDA #$27
4442 : c8 __ __ INY
4443 : 91 23 __ STA (SP + 0),y 
4445 : 20 06 45 JSR $4506 ; (vdcwin_printline.s1000 + 0)
.s27:
4448 : ad fa bf LDA $bffa ; (sstack + 3)
444b : a0 02 __ LDY #$02
444d : 91 23 __ STA (SP + 0),y 
444f : ad fb bf LDA $bffb ; (sstack + 4)
4452 : c8 __ __ INY
4453 : 91 23 __ STA (SP + 0),y 
4455 : a9 98 __ LDA #$98
4457 : c8 __ __ INY
4458 : 91 23 __ STA (SP + 0),y 
445a : a9 bf __ LDA #$bf
445c : c8 __ __ INY
445d : 91 23 __ STA (SP + 0),y 
445f : 20 ae 45 JSR $45ae ; (vdcwin_put_string.s1000 + 0)
4462 : a5 55 __ LDA T3 + 0 
4464 : c5 53 __ CMP T0 + 0 
4466 : 90 03 __ BCC $446b ; (vdcwin_printwrap.s49 + 0)
4468 : 4c e3 43 JMP $43e3 ; (vdcwin_printwrap.s1001 + 0)
.s49:
446b : a9 ff __ LDA #$ff
446d : 85 44 __ STA T5 + 1 
446f : 85 57 __ STA T4 + 1 
4471 : a9 00 __ LDA #$00
4473 : 85 45 __ STA T6 + 0 
4475 : 4c c6 43 JMP $43c6 ; (vdcwin_printwrap.l4 + 0)
.s23:
4478 : a5 56 __ LDA T4 + 0 
447a : 91 23 __ STA (SP + 0),y 
447c : a5 57 __ LDA T4 + 1 
447e : c8 __ __ INY
447f : 91 23 __ STA (SP + 0),y 
4481 : a9 ff __ LDA #$ff
4483 : c8 __ __ INY
4484 : 91 23 __ STA (SP + 0),y 
4486 : a9 27 __ LDA #$27
4488 : c8 __ __ INY
4489 : 91 23 __ STA (SP + 0),y 
448b : 20 06 45 JSR $4506 ; (vdcwin_printline.s1000 + 0)
448e : ad fa bf LDA $bffa ; (sstack + 3)
4491 : 85 17 __ STA P10 
4493 : ad fb bf LDA $bffb ; (sstack + 4)
4496 : 85 18 __ STA P11 
4498 : a0 02 __ LDY #$02
449a : b1 17 __ LDA (P10),y 
449c : 8d f9 bf STA $bff9 ; (sstack + 2)
449f : a9 98 __ LDA #$98
44a1 : 8d f7 bf STA $bff7 ; (sstack + 0)
44a4 : a9 bf __ LDA #$bf
44a6 : 8d f8 bf STA $bff8 ; (sstack + 1)
44a9 : 20 ae 47 JSR $47ae ; (vdcwin_put_chars.s1000 + 0)
44ac : ad fa bf LDA $bffa ; (sstack + 3)
44af : 85 43 __ STA T5 + 0 
44b1 : a9 98 __ LDA #$98
44b3 : 85 0d __ STA P0 
44b5 : a9 bf __ LDA #$bf
44b7 : 85 0e __ STA P1 
44b9 : ad fb bf LDA $bffb ; (sstack + 4)
44bc : 85 44 __ STA T5 + 1 
44be : a0 02 __ LDY #$02
44c0 : b1 43 __ LDA (T5 + 0),y 
44c2 : 18 __ __ CLC
44c3 : 69 98 __ ADC #$98
44c5 : 85 43 __ STA T5 + 0 
44c7 : a9 bf __ LDA #$bf
44c9 : 69 00 __ ADC #$00
44cb : 85 44 __ STA T5 + 1 
44cd : a0 ff __ LDY #$ff
.l1012:
44cf : c8 __ __ INY
44d0 : b1 43 __ LDA (T5 + 0),y 
44d2 : 99 98 bf STA $bf98,y ; (bigfont + 125)
44d5 : d0 f8 __ BNE $44cf ; (vdcwin_printwrap.l1012 + 0)
44d7 : 4c 16 44 JMP $4416 ; (vdcwin_printwrap.s1013 + 0)
.s6:
44da : ad fc bf LDA $bffc ; (sstack + 5)
44dd : 85 49 __ STA T9 + 0 
44df : ad fd bf LDA $bffd ; (sstack + 6)
44e2 : 85 4a __ STA T9 + 1 
44e4 : a4 55 __ LDY T3 + 0 
44e6 : b1 49 __ LDA (T9 + 0),y 
44e8 : a6 45 __ LDX T6 + 0 
44ea : 9d 98 bf STA $bf98,x ; (bigfont + 125)
44ed : c9 20 __ CMP #$20
44ef : d0 06 __ BNE $44f7 ; (vdcwin_printwrap.s10 + 0)
.s16:
44f1 : a9 00 __ LDA #$00
44f3 : 85 44 __ STA T5 + 1 
44f5 : f0 08 __ BEQ $44ff ; (vdcwin_printwrap.s53 + 0)
.s10:
44f7 : 24 57 __ BIT T4 + 1 
44f9 : 10 04 __ BPL $44ff ; (vdcwin_printwrap.s53 + 0)
.s13:
44fb : a9 00 __ LDA #$00
44fd : 85 57 __ STA T4 + 1 
.s53:
44ff : e6 55 __ INC T3 + 0 
4501 : e6 45 __ INC T6 + 0 
4503 : 4c c6 43 JMP $43c6 ; (vdcwin_printwrap.l4 + 0)
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
4506 : a5 53 __ LDA T0 + 0 
4508 : 8d f3 bf STA $bff3 ; (buffer + 12)
450b : a5 54 __ LDA T0 + 1 
450d : 8d f4 bf STA $bff4 ; (buffer + 13)
4510 : a5 55 __ LDA T1 + 0 
4512 : 8d f5 bf STA $bff5 ; (buffer + 14)
4515 : 38 __ __ SEC
4516 : a5 23 __ LDA SP + 0 
4518 : e9 06 __ SBC #$06
451a : 85 23 __ STA SP + 0 
451c : b0 02 __ BCS $4520 ; (vdcwin_printline.s0 + 0)
451e : c6 24 __ DEC SP + 1 
.s0:
4520 : a0 08 __ LDY #$08
4522 : b1 23 __ LDA (SP + 0),y 
4524 : 85 53 __ STA T0 + 0 
4526 : a0 02 __ LDY #$02
4528 : 91 23 __ STA (SP + 0),y 
452a : a0 09 __ LDY #$09
452c : b1 23 __ LDA (SP + 0),y 
452e : 85 54 __ STA T0 + 1 
4530 : a0 03 __ LDY #$03
4532 : 91 23 __ STA (SP + 0),y 
4534 : a0 0a __ LDY #$0a
4536 : b1 23 __ LDA (SP + 0),y 
4538 : a0 04 __ LDY #$04
453a : 91 23 __ STA (SP + 0),y 
453c : a0 0b __ LDY #$0b
453e : b1 23 __ LDA (SP + 0),y 
4540 : a0 05 __ LDY #$05
4542 : 91 23 __ STA (SP + 0),y 
4544 : 20 ae 45 JSR $45ae ; (vdcwin_put_string.s1000 + 0)
4547 : a9 00 __ LDA #$00
4549 : a0 04 __ LDY #$04
454b : 91 53 __ STA (T0 + 0),y 
454d : 88 __ __ DEY
454e : b1 53 __ LDA (T0 + 0),y 
4550 : 85 55 __ STA T1 + 0 
4552 : 38 __ __ SEC
4553 : e9 01 __ SBC #$01
4555 : 85 44 __ STA T3 + 0 
4557 : a0 05 __ LDY #$05
4559 : b1 53 __ LDA (T0 + 0),y 
455b : 90 0b __ BCC $4568 ; (vdcwin_printline.s2 + 0)
.s1002:
455d : aa __ __ TAX
455e : e4 44 __ CPX T3 + 0 
4560 : b0 06 __ BCS $4568 ; (vdcwin_printline.s2 + 0)
.s1:
4562 : e8 __ __ INX
4563 : 8a __ __ TXA
4564 : 91 53 __ STA (T0 + 0),y 
4566 : 90 2b __ BCC $4593 ; (vdcwin_printline.s1001 + 0)
.s2:
4568 : a5 53 __ LDA T0 + 0 
456a : 85 15 __ STA P8 
456c : a5 54 __ LDA T0 + 1 
456e : 85 16 __ STA P9 
4570 : 20 5e 46 JSR $465e ; (vdcwin_scroll_up.s0 + 0)
4573 : a9 20 __ LDA #$20
4575 : 85 11 __ STA P4 
4577 : a0 00 __ LDY #$00
4579 : b1 15 __ LDA (P8),y 
457b : 85 0f __ STA P2 ; (str + 0)
457d : a0 02 __ LDY #$02
457f : b1 15 __ LDA (P8),y 
4581 : 85 13 __ STA P6 
4583 : 88 __ __ DEY
4584 : 84 15 __ STY P8 
4586 : b1 53 __ LDA (T0 + 0),y 
4588 : 18 __ __ CLC
4589 : 65 55 __ ADC T1 + 0 
458b : 38 __ __ SEC
458c : e9 01 __ SBC #$01
458e : 85 14 __ STA P7 
4590 : 20 79 2a JSR $2a79 ; (vdc_clear.s0 + 0)
.s1001:
4593 : 18 __ __ CLC
4594 : a5 23 __ LDA SP + 0 
4596 : 69 06 __ ADC #$06
4598 : 85 23 __ STA SP + 0 
459a : 90 02 __ BCC $459e ; (vdcwin_printline.s1001 + 11)
459c : e6 24 __ INC SP + 1 
459e : ad f3 bf LDA $bff3 ; (buffer + 12)
45a1 : 85 53 __ STA T0 + 0 
45a3 : ad f4 bf LDA $bff4 ; (buffer + 13)
45a6 : 85 54 __ STA T0 + 1 
45a8 : ad f5 bf LDA $bff5 ; (buffer + 14)
45ab : 85 55 __ STA T1 + 0 
45ad : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->void
.s1000:
45ae : 38 __ __ SEC
45af : a5 23 __ LDA SP + 0 
45b1 : e9 0b __ SBC #$0b
45b3 : 85 23 __ STA SP + 0 
45b5 : b0 02 __ BCS $45b9 ; (vdcwin_put_string.s0 + 0)
45b7 : c6 24 __ DEC SP + 1 
.s0:
45b9 : a0 0d __ LDY #$0d
45bb : b1 23 __ LDA (SP + 0),y 
45bd : 85 11 __ STA P4 
45bf : c8 __ __ INY
45c0 : b1 23 __ LDA (SP + 0),y 
45c2 : 85 12 __ STA P5 
45c4 : a0 04 __ LDY #$04
45c6 : b1 11 __ LDA (P4),y 
45c8 : 85 13 __ STA P6 
45ca : c8 __ __ INY
45cb : b1 11 __ LDA (P4),y 
45cd : 85 14 __ STA P7 
45cf : a0 0f __ LDY #$0f
45d1 : b1 23 __ LDA (SP + 0),y 
45d3 : 85 15 __ STA P8 
45d5 : c8 __ __ INY
45d6 : b1 23 __ LDA (SP + 0),y 
45d8 : 85 16 __ STA P9 
45da : 20 29 46 JSR $4629 ; (vdcwin_putat_string.s0 + 0)
45dd : 18 __ __ CLC
45de : a5 1b __ LDA ACCU + 0 
45e0 : 65 13 __ ADC P6 
45e2 : a0 04 __ LDY #$04
45e4 : 91 11 __ STA (P4),y 
45e6 : a0 02 __ LDY #$02
45e8 : d1 11 __ CMP (P4),y 
45ea : 90 31 __ BCC $461d ; (vdcwin_put_string.s1001 + 0)
.s1:
45ec : a9 00 __ LDA #$00
45ee : a0 04 __ LDY #$04
45f0 : 91 11 __ STA (P4),y 
45f2 : a5 14 __ LDA P7 
45f4 : 69 00 __ ADC #$00
45f6 : c8 __ __ INY
45f7 : 91 11 __ STA (P4),y 
45f9 : a0 03 __ LDY #$03
45fb : d1 11 __ CMP (P4),y 
45fd : d0 1e __ BNE $461d ; (vdcwin_put_string.s1001 + 0)
.s4:
45ff : a5 14 __ LDA P7 
4601 : a0 05 __ LDY #$05
4603 : 91 11 __ STA (P4),y 
4605 : a5 11 __ LDA P4 
4607 : a0 02 __ LDY #$02
4609 : 91 23 __ STA (SP + 0),y 
460b : a5 12 __ LDA P5 
460d : c8 __ __ INY
460e : 91 23 __ STA (SP + 0),y 
4610 : a9 ff __ LDA #$ff
4612 : c8 __ __ INY
4613 : 91 23 __ STA (SP + 0),y 
4615 : a9 27 __ LDA #$27
4617 : c8 __ __ INY
4618 : 91 23 __ STA (SP + 0),y 
461a : 20 06 45 JSR $4506 ; (vdcwin_printline.s1000 + 0)
.s1001:
461d : 18 __ __ CLC
461e : a5 23 __ LDA SP + 0 
4620 : 69 0b __ ADC #$0b
4622 : 85 23 __ STA SP + 0 
4624 : 90 02 __ BCC $4628 ; (vdcwin_put_string.s1001 + 11)
4626 : e6 24 __ INC SP + 1 
4628 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_string: ; vdcwin_putat_string(struct VDCWin*,u8,u8,const u8*)->u8
.s0:
4629 : a9 00 __ LDA #$00
462b : 85 43 __ STA T0 + 0 
462d : f0 26 __ BEQ $4655 ; (vdcwin_putat_string.l1 + 0)
.s2:
462f : 4a __ __ LSR
4630 : 4a __ __ LSR
4631 : 4a __ __ LSR
4632 : 4a __ __ LSR
4633 : 4a __ __ LSR
4634 : aa __ __ TAX
4635 : bd ea 68 LDA $68ea,x ; (p2smap + 0)
4638 : 51 15 __ EOR (P8),y ; (str + 0)
463a : 85 0f __ STA P2 
463c : a5 13 __ LDA P6 ; (x + 0)
463e : 18 __ __ CLC
463f : a0 00 __ LDY #$00
4641 : 71 11 __ ADC (P4),y ; (win + 0)
4643 : 18 __ __ CLC
4644 : 65 43 __ ADC T0 + 0 
4646 : 85 0d __ STA P0 
4648 : a5 14 __ LDA P7 ; (y + 0)
464a : 18 __ __ CLC
464b : c8 __ __ INY
464c : 71 11 __ ADC (P4),y ; (win + 0)
464e : 85 0e __ STA P1 
4650 : 20 99 35 JSR $3599 ; (vdc_printc@proxy + 0)
4653 : e6 43 __ INC T0 + 0 
.l1:
4655 : a4 43 __ LDY T0 + 0 
4657 : b1 15 __ LDA (P8),y ; (str + 0)
4659 : d0 d4 __ BNE $462f ; (vdcwin_putat_string.s2 + 0)
.s3:
465b : 84 1b __ STY ACCU + 0 
.s1001:
465d : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_up: ; vdcwin_scroll_up(struct VDCWin*,u8)->void
.s0:
465e : a9 00 __ LDA #$00
4660 : 85 46 __ STA T0 + 0 
4662 : a0 02 __ LDY #$02
4664 : b1 15 __ LDA (P8),y ; (win + 0)
4666 : 85 47 __ STA T2 + 0 
4668 : a0 06 __ LDY #$06
466a : b1 15 __ LDA (P8),y ; (win + 0)
466c : 85 48 __ STA T3 + 0 
466e : c8 __ __ INY
466f : b1 15 __ LDA (P8),y ; (win + 0)
4671 : 85 49 __ STA T3 + 1 
4673 : c8 __ __ INY
4674 : b1 15 __ LDA (P8),y ; (win + 0)
4676 : 85 4a __ STA T4 + 0 
4678 : c8 __ __ INY
4679 : b1 15 __ LDA (P8),y ; (win + 0)
467b : 85 4b __ STA T4 + 1 
467d : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
4680 : 85 4c __ STA T5 + 0 
4682 : ad 60 6d LDA $6d60 ; (vdc_state + 4)
4685 : 85 4d __ STA T5 + 1 
4687 : 4c d2 46 JMP $46d2 ; (vdcwin_scroll_up.l1 + 0)
.s2:
468a : a5 48 __ LDA T3 + 0 
468c : 85 0f __ STA P2 
468e : 18 __ __ CLC
468f : 65 4c __ ADC T5 + 0 
4691 : 85 11 __ STA P4 
4693 : a5 49 __ LDA T3 + 1 
4695 : 85 10 __ STA P3 
4697 : 65 4d __ ADC T5 + 1 
4699 : 85 12 __ STA P5 
469b : 20 e2 46 JSR $46e2 ; (vdc_block_copy@proxy + 0)
469e : a5 4a __ LDA T4 + 0 
46a0 : 85 0f __ STA P2 
46a2 : 18 __ __ CLC
46a3 : 65 4c __ ADC T5 + 0 
46a5 : 85 11 __ STA P4 
46a7 : a5 4b __ LDA T4 + 1 
46a9 : 85 10 __ STA P3 
46ab : 65 4d __ ADC T5 + 1 
46ad : 85 12 __ STA P5 
46af : 20 ea 46 JSR $46ea ; (vdc_block_copy.s0 + 0)
46b2 : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
46b5 : 18 __ __ CLC
46b6 : 65 48 __ ADC T3 + 0 
46b8 : 85 48 __ STA T3 + 0 
46ba : ad 60 6d LDA $6d60 ; (vdc_state + 4)
46bd : 65 49 __ ADC T3 + 1 
46bf : 85 49 __ STA T3 + 1 
46c1 : 18 __ __ CLC
46c2 : a5 4a __ LDA T4 + 0 
46c4 : 6d 5f 6d ADC $6d5f ; (vdc_state + 3)
46c7 : 85 4a __ STA T4 + 0 
46c9 : a5 4b __ LDA T4 + 1 
46cb : 6d 60 6d ADC $6d60 ; (vdc_state + 4)
46ce : 85 4b __ STA T4 + 1 
46d0 : e6 46 __ INC T0 + 0 
.l1:
46d2 : a0 03 __ LDY #$03
46d4 : b1 15 __ LDA (P8),y ; (win + 0)
46d6 : 38 __ __ SEC
46d7 : e9 01 __ SBC #$01
46d9 : 90 af __ BCC $468a ; (vdcwin_scroll_up.s2 + 0)
.s1002:
46db : c5 46 __ CMP T0 + 0 
46dd : 90 02 __ BCC $46e1 ; (vdcwin_scroll_up.s1001 + 0)
.s1004:
46df : d0 a9 __ BNE $468a ; (vdcwin_scroll_up.s2 + 0)
.s1001:
46e1 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
46e2 : a5 47 __ LDA $47 
46e4 : 85 13 __ STA P6 
46e6 : a9 00 __ LDA #$00
46e8 : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_block_copy: ; vdc_block_copy(u16,u16,u16)->void
.s0:
46ea : a5 14 __ LDA P7 ; (length + 1)
46ec : d0 50 __ BNE $473e ; (vdc_block_copy.s73 + 0)
.s4:
46ee : 20 46 2b JSR $2b46 ; (vdc_mem_addr@proxy + 0)
46f1 : a2 18 __ LDX #$18
46f3 : 8e 00 d6 STX $d600 
.l332:
46f6 : 2c 00 d6 BIT $d600 
46f9 : 10 fb __ BPL $46f6 ; (vdc_block_copy.l332 + 0)
.s40:
46fb : ad 01 d6 LDA $d601 
46fe : 09 80 __ ORA #$80
4700 : 8e 00 d6 STX $d600 
.l334:
4703 : 2c 00 d6 BIT $d600 
4706 : 10 fb __ BPL $4703 ; (vdc_block_copy.l334 + 0)
.s46:
4708 : 8d 01 d6 STA $d601 
470b : a9 20 __ LDA #$20
470d : 8d 00 d6 STA $d600 
.l336:
4710 : 2c 00 d6 BIT $d600 
4713 : 10 fb __ BPL $4710 ; (vdc_block_copy.l336 + 0)
.s51:
4715 : a5 12 __ LDA P5 ; (src + 1)
4717 : 8d 01 d6 STA $d601 
471a : a9 21 __ LDA #$21
471c : 8d 00 d6 STA $d600 
.l338:
471f : 2c 00 d6 BIT $d600 
4722 : 10 fb __ BPL $471f ; (vdc_block_copy.l338 + 0)
.s56:
4724 : a5 11 __ LDA P4 ; (src + 0)
4726 : 8d 01 d6 STA $d601 
4729 : a9 1f __ LDA #$1f
472b : 8d 00 d6 STA $d600 
472e : a9 1e __ LDA #$1e
4730 : 8d 00 d6 STA $d600 
.l340:
4733 : 2c 00 d6 BIT $d600 
4736 : 10 fb __ BPL $4733 ; (vdc_block_copy.l340 + 0)
.s62:
4738 : a5 13 __ LDA P6 ; (length + 0)
473a : 8d 01 d6 STA $d601 
.s1001:
473d : 60 __ __ RTS
.s73:
473e : 85 45 __ STA T2 + 0 
4740 : a5 10 __ LDA P3 ; (dest + 1)
4742 : 85 44 __ STA T0 + 1 
4744 : a5 0f __ LDA P2 ; (dest + 0)
4746 : 85 0d __ STA P0 
.l2:
4748 : a5 44 __ LDA T0 + 1 
474a : 85 0e __ STA P1 
474c : 20 4e 2b JSR $2b4e ; (vdc_mem_addr.s0 + 0)
474f : a2 18 __ LDX #$18
4751 : 8e 00 d6 STX $d600 
.l321:
4754 : 2c 00 d6 BIT $d600 
4757 : 10 fb __ BPL $4754 ; (vdc_block_copy.l321 + 0)
.s11:
4759 : ad 01 d6 LDA $d601 
475c : 09 80 __ ORA #$80
475e : 8e 00 d6 STX $d600 
.l323:
4761 : 2c 00 d6 BIT $d600 
4764 : 10 fb __ BPL $4761 ; (vdc_block_copy.l323 + 0)
.s17:
4766 : 8d 01 d6 STA $d601 
4769 : a9 20 __ LDA #$20
476b : 8d 00 d6 STA $d600 
.l325:
476e : 2c 00 d6 BIT $d600 
4771 : 10 fb __ BPL $476e ; (vdc_block_copy.l325 + 0)
.s22:
4773 : a5 12 __ LDA P5 ; (src + 1)
4775 : 8d 01 d6 STA $d601 
4778 : a9 21 __ LDA #$21
477a : 8d 00 d6 STA $d600 
.l327:
477d : 2c 00 d6 BIT $d600 
4780 : 10 fb __ BPL $477d ; (vdc_block_copy.l327 + 0)
.s27:
4782 : a5 11 __ LDA P4 ; (src + 0)
4784 : 8d 01 d6 STA $d601 
4787 : a9 1f __ LDA #$1f
4789 : 8d 00 d6 STA $d600 
478c : a9 1e __ LDA #$1e
478e : 8d 00 d6 STA $d600 
.l329:
4791 : 2c 00 d6 BIT $d600 
4794 : 10 fb __ BPL $4791 ; (vdc_block_copy.l329 + 0)
.s33:
4796 : e6 12 __ INC P5 ; (src + 1)
4798 : a9 ff __ LDA #$ff
479a : 8d 01 d6 STA $d601 
479d : e6 44 __ INC T0 + 1 
479f : c6 45 __ DEC T2 + 0 
47a1 : d0 a5 __ BNE $4748 ; (vdc_block_copy.l2 + 0)
.s145:
47a3 : a5 0d __ LDA P0 
47a5 : 85 0f __ STA P2 ; (dest + 0)
47a7 : a5 44 __ LDA T0 + 1 
47a9 : 85 10 __ STA P3 ; (dest + 1)
47ab : 4c ee 46 JMP $46ee ; (vdc_block_copy.s4 + 0)
--------------------------------------------------------------------
vdcwin_put_chars: ; vdcwin_put_chars(struct VDCWin*,const u8*,u8)->void
.s1000:
47ae : a2 05 __ LDX #$05
47b0 : b5 53 __ LDA T1 + 0,x 
47b2 : 9d e9 bf STA $bfe9,x ; (vp_fill + 24)
47b5 : ca __ __ DEX
47b6 : 10 f8 __ BPL $47b0 ; (vdcwin_put_chars.s1000 + 2)
47b8 : 38 __ __ SEC
47b9 : a5 23 __ LDA SP + 0 
47bb : e9 06 __ SBC #$06
47bd : 85 23 __ STA SP + 0 
47bf : b0 02 __ BCS $47c3 ; (vdcwin_put_chars.s0 + 0)
47c1 : c6 24 __ DEC SP + 1 
.s0:
47c3 : ad f9 bf LDA $bff9 ; (sstack + 2)
47c6 : f0 4a __ BEQ $4812 ; (vdcwin_put_chars.s1 + 0)
.s14:
47c8 : 85 53 __ STA T1 + 0 
47ca : a0 05 __ LDY #$05
47cc : b1 17 __ LDA (P10),y ; (win + 0)
47ce : 85 55 __ STA T3 + 0 
47d0 : 88 __ __ DEY
47d1 : b1 17 __ LDA (P10),y ; (win + 0)
47d3 : 85 56 __ STA T4 + 0 
47d5 : ad f7 bf LDA $bff7 ; (sstack + 0)
47d8 : 85 57 __ STA T5 + 0 
47da : ad f8 bf LDA $bff8 ; (sstack + 1)
47dd : 85 58 __ STA T5 + 1 
47df : a0 00 __ LDY #$00
.l1008:
47e1 : 84 54 __ STY T2 + 0 
47e3 : b1 57 __ LDA (T5 + 0),y 
47e5 : 4a __ __ LSR
47e6 : 4a __ __ LSR
47e7 : 4a __ __ LSR
47e8 : 4a __ __ LSR
47e9 : 4a __ __ LSR
47ea : aa __ __ TAX
47eb : bd ea 68 LDA $68ea,x ; (p2smap + 0)
47ee : 51 57 __ EOR (T5 + 0),y 
47f0 : 85 0f __ STA P2 
47f2 : a0 00 __ LDY #$00
47f4 : b1 17 __ LDA (P10),y ; (win + 0)
47f6 : 18 __ __ CLC
47f7 : 65 56 __ ADC T4 + 0 
47f9 : 18 __ __ CLC
47fa : 65 54 __ ADC T2 + 0 
47fc : 85 0d __ STA P0 
47fe : c8 __ __ INY
47ff : b1 17 __ LDA (P10),y ; (win + 0)
4801 : 18 __ __ CLC
4802 : 65 55 __ ADC T3 + 0 
4804 : 85 0e __ STA P1 
4806 : 20 99 35 JSR $3599 ; (vdc_printc@proxy + 0)
4809 : a4 54 __ LDY T2 + 0 
480b : c8 __ __ INY
480c : c4 53 __ CPY T1 + 0 
480e : 90 d1 __ BCC $47e1 ; (vdcwin_put_chars.l1008 + 0)
.s1010:
4810 : a5 53 __ LDA T1 + 0 
.s1:
4812 : 18 __ __ CLC
4813 : a0 04 __ LDY #$04
4815 : 71 17 __ ADC (P10),y ; (win + 0)
4817 : 91 17 __ STA (P10),y ; (win + 0)
4819 : a0 02 __ LDY #$02
481b : d1 17 __ CMP (P10),y ; (win + 0)
481d : 90 32 __ BCC $4851 ; (vdcwin_put_chars.s1001 + 0)
.s8:
481f : a9 00 __ LDA #$00
4821 : a0 04 __ LDY #$04
4823 : 91 17 __ STA (P10),y ; (win + 0)
4825 : c8 __ __ INY
4826 : b1 17 __ LDA (P10),y ; (win + 0)
4828 : aa __ __ TAX
4829 : 18 __ __ CLC
482a : 69 01 __ ADC #$01
482c : 91 17 __ STA (P10),y ; (win + 0)
482e : a0 03 __ LDY #$03
4830 : d1 17 __ CMP (P10),y ; (win + 0)
4832 : d0 1d __ BNE $4851 ; (vdcwin_put_chars.s1001 + 0)
.s11:
4834 : 8a __ __ TXA
4835 : a0 05 __ LDY #$05
4837 : 91 17 __ STA (P10),y ; (win + 0)
4839 : a5 17 __ LDA P10 ; (win + 0)
483b : a0 02 __ LDY #$02
483d : 91 23 __ STA (SP + 0),y 
483f : a5 18 __ LDA P11 ; (win + 1)
4841 : c8 __ __ INY
4842 : 91 23 __ STA (SP + 0),y 
4844 : a9 ff __ LDA #$ff
4846 : c8 __ __ INY
4847 : 91 23 __ STA (SP + 0),y 
4849 : a9 27 __ LDA #$27
484b : c8 __ __ INY
484c : 91 23 __ STA (SP + 0),y 
484e : 20 06 45 JSR $4506 ; (vdcwin_printline.s1000 + 0)
.s1001:
4851 : 18 __ __ CLC
4852 : a5 23 __ LDA SP + 0 
4854 : 69 06 __ ADC #$06
4856 : 85 23 __ STA SP + 0 
4858 : 90 02 __ BCC $485c ; (vdcwin_put_chars.s1001 + 11)
485a : e6 24 __ INC SP + 1 
485c : a2 05 __ LDX #$05
485e : bd e9 bf LDA $bfe9,x ; (vp_fill + 24)
4861 : 95 53 __ STA T1 + 0,x 
4863 : ca __ __ DEX
4864 : 10 f8 __ BPL $485e ; (vdcwin_put_chars.s1001 + 13)
4866 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_char: ; vdcwin_put_char(struct VDCWin*,u8)->void
.s1000:
4867 : a5 53 __ LDA T0 + 0 
4869 : 8d ef bf STA $bfef ; (vp_fill + 30)
486c : a5 54 __ LDA T2 + 0 
486e : 8d f0 bf STA $bff0 ; (vp_fill + 31)
4871 : 38 __ __ SEC
4872 : a5 23 __ LDA SP + 0 
4874 : e9 06 __ SBC #$06
4876 : 85 23 __ STA SP + 0 
4878 : b0 02 __ BCS $487c ; (vdcwin_put_char.s0 + 0)
487a : c6 24 __ DEC SP + 1 
.s0:
487c : ad f7 bf LDA $bff7 ; (sstack + 0)
487f : 4a __ __ LSR
4880 : 4a __ __ LSR
4881 : 4a __ __ LSR
4882 : 4a __ __ LSR
4883 : 4a __ __ LSR
4884 : aa __ __ TAX
4885 : bd ea 68 LDA $68ea,x ; (p2smap + 0)
4888 : 4d f7 bf EOR $bff7 ; (sstack + 0)
488b : 85 0f __ STA P2 
488d : a0 04 __ LDY #$04
488f : b1 17 __ LDA (P10),y ; (win + 0)
4891 : 85 53 __ STA T0 + 0 
4893 : 18 __ __ CLC
4894 : a0 00 __ LDY #$00
4896 : 71 17 __ ADC (P10),y ; (win + 0)
4898 : 85 0d __ STA P0 
489a : a0 05 __ LDY #$05
489c : b1 17 __ LDA (P10),y ; (win + 0)
489e : 85 54 __ STA T2 + 0 
48a0 : 18 __ __ CLC
48a1 : a0 01 __ LDY #$01
48a3 : 71 17 __ ADC (P10),y ; (win + 0)
48a5 : 85 0e __ STA P1 
48a7 : 20 99 35 JSR $3599 ; (vdc_printc@proxy + 0)
48aa : a6 53 __ LDX T0 + 0 
48ac : e8 __ __ INX
48ad : 8a __ __ TXA
48ae : a0 04 __ LDY #$04
48b0 : 91 17 __ STA (P10),y ; (win + 0)
48b2 : a0 02 __ LDY #$02
48b4 : d1 17 __ CMP (P10),y ; (win + 0)
48b6 : d0 32 __ BNE $48ea ; (vdcwin_put_char.s1001 + 0)
.s4:
48b8 : a9 00 __ LDA #$00
48ba : a0 04 __ LDY #$04
48bc : 91 17 __ STA (P10),y ; (win + 0)
48be : 18 __ __ CLC
48bf : a5 54 __ LDA T2 + 0 
48c1 : 69 01 __ ADC #$01
48c3 : c8 __ __ INY
48c4 : 91 17 __ STA (P10),y ; (win + 0)
48c6 : a0 03 __ LDY #$03
48c8 : d1 17 __ CMP (P10),y ; (win + 0)
48ca : d0 1e __ BNE $48ea ; (vdcwin_put_char.s1001 + 0)
.s7:
48cc : a5 54 __ LDA T2 + 0 
48ce : a0 05 __ LDY #$05
48d0 : 91 17 __ STA (P10),y ; (win + 0)
48d2 : a5 17 __ LDA P10 ; (win + 0)
48d4 : a0 02 __ LDY #$02
48d6 : 91 23 __ STA (SP + 0),y 
48d8 : a5 18 __ LDA P11 ; (win + 1)
48da : c8 __ __ INY
48db : 91 23 __ STA (SP + 0),y 
48dd : a9 ff __ LDA #$ff
48df : c8 __ __ INY
48e0 : 91 23 __ STA (SP + 0),y 
48e2 : a9 27 __ LDA #$27
48e4 : c8 __ __ INY
48e5 : 91 23 __ STA (SP + 0),y 
48e7 : 20 06 45 JSR $4506 ; (vdcwin_printline.s1000 + 0)
.s1001:
48ea : 18 __ __ CLC
48eb : a5 23 __ LDA SP + 0 
48ed : 69 06 __ ADC #$06
48ef : 85 23 __ STA SP + 0 
48f1 : 90 02 __ BCC $48f5 ; (vdcwin_put_char.s1001 + 11)
48f3 : e6 24 __ INC SP + 1 
48f5 : ad ef bf LDA $bfef ; (vp_fill + 30)
48f8 : 85 53 __ STA T0 + 0 
48fa : ad f0 bf LDA $bff0 ; (vp_fill + 31)
48fd : 85 54 __ STA T2 + 0 
48ff : 60 __ __ RTS
--------------------------------------------------------------------
windows_textinput: ; windows_textinput()->void
.s1000:
4900 : a2 04 __ LDX #$04
4902 : b5 53 __ LDA T0 + 0,x 
4904 : 9d 8a bf STA $bf8a,x ; (bigfont + 111)
4907 : ca __ __ DEX
4908 : 10 f8 __ BPL $4902 ; (windows_textinput.s1000 + 2)
490a : 38 __ __ SEC
490b : a5 23 __ LDA SP + 0 
490d : e9 06 __ SBC #$06
490f : 85 23 __ STA SP + 0 
4911 : b0 02 __ BCS $4915 ; (windows_textinput.s0 + 0)
4913 : c6 24 __ DEC SP + 1 
.s0:
4915 : a9 f0 __ LDA #$f0
4917 : 85 17 __ STA P10 
4919 : a9 3c __ LDA #$3c
491b : 8d f8 bf STA $bff8 ; (sstack + 1)
491e : a9 05 __ LDA #$05
4920 : 85 18 __ STA P11 
4922 : a9 0c __ LDA #$0c
4924 : 8d f9 bf STA $bff9 ; (sstack + 2)
4927 : a9 fb __ LDA #$fb
4929 : 85 1b __ STA ACCU + 0 
492b : a9 00 __ LDA #$00
492d : 85 1c __ STA ACCU + 1 
492f : 20 02 66 JSR $6602 ; (malloc + 0)
4932 : a5 1b __ LDA ACCU + 0 
4934 : 85 53 __ STA T0 + 0 
4936 : a5 1c __ LDA ACCU + 1 
4938 : 85 54 __ STA T0 + 1 
493a : ad 61 6d LDA $6d61 ; (vdc_state + 5)
493d : 85 55 __ STA T1 + 0 
493f : ad 62 6d LDA $6d62 ; (vdc_state + 6)
4942 : 4a __ __ LSR
4943 : 66 55 __ ROR T1 + 0 
4945 : 38 __ __ SEC
4946 : a5 55 __ LDA T1 + 0 
4948 : e9 06 __ SBC #$06
494a : 8d f7 bf STA $bff7 ; (sstack + 0)
494d : 20 4f 31 JSR $314f ; (vdcwin_win_new.s1000 + 0)
4950 : ad 49 6d LDA $6d49 ; (winCfg + 5)
4953 : 85 1b __ STA ACCU + 0 
4955 : a9 01 __ LDA #$01
4957 : 85 14 __ STA P7 
4959 : a9 00 __ LDA #$00
495b : 85 13 __ STA P6 
495d : 85 1c __ STA ACCU + 1 
495f : a9 0d __ LDA #$0d
4961 : 20 3e 64 JSR $643e ; (mul16by8 + 0)
4964 : 18 __ __ CLC
4965 : a9 bc __ LDA #$bc
4967 : 65 05 __ ADC WORK + 2 
4969 : 85 11 __ STA P4 
496b : a9 6d __ LDA #$6d
496d : 69 00 __ ADC #$00
496f : 85 12 __ STA P5 
4971 : a9 00 __ LDA #$00
4973 : 85 15 __ STA P8 
4975 : a9 4b __ LDA #$4b
4977 : 85 16 __ STA P9 
4979 : 20 29 46 JSR $4629 ; (vdcwin_putat_string.s0 + 0)
497c : a9 0a __ LDA #$0a
497e : 85 18 __ STA P11 
4980 : a9 32 __ LDA #$32
4982 : 8d f8 bf STA $bff8 ; (sstack + 1)
4985 : a9 05 __ LDA #$05
4987 : 8d f9 bf STA $bff9 ; (sstack + 2)
498a : 38 __ __ SEC
498b : a5 55 __ LDA T1 + 0 
498d : e9 03 __ SBC #$03
498f : 8d f7 bf STA $bff7 ; (sstack + 0)
4992 : 20 4f 31 JSR $314f ; (vdcwin_win_new.s1000 + 0)
4995 : ad 49 6d LDA $6d49 ; (winCfg + 5)
4998 : 85 1b __ STA ACCU + 0 
499a : a9 00 __ LDA #$00
499c : 85 1c __ STA ACCU + 1 
499e : a9 0d __ LDA #$0d
49a0 : 20 3e 64 JSR $643e ; (mul16by8 + 0)
49a3 : 18 __ __ CLC
49a4 : a9 bc __ LDA #$bc
49a6 : 65 05 __ ADC WORK + 2 
49a8 : 8d f8 bf STA $bff8 ; (sstack + 1)
49ab : a9 6d __ LDA #$6d
49ad : 69 00 __ ADC #$00
49af : 8d f9 bf STA $bff9 ; (sstack + 2)
49b2 : 20 2e 4b JSR $4b2e ; (vdcwin_edit.s1000 + 0)
49b5 : a5 53 __ LDA T0 + 0 
49b7 : 85 12 __ STA P5 
49b9 : a5 54 __ LDA T0 + 1 
49bb : 85 13 __ STA P6 
49bd : ad 49 6d LDA $6d49 ; (winCfg + 5)
49c0 : 85 1b __ STA ACCU + 0 
49c2 : a9 00 __ LDA #$00
49c4 : 85 1c __ STA ACCU + 1 
49c6 : a9 0d __ LDA #$0d
49c8 : 20 3e 64 JSR $643e ; (mul16by8 + 0)
49cb : 18 __ __ CLC
49cc : a9 bc __ LDA #$bc
49ce : 65 05 __ ADC WORK + 2 
49d0 : 85 10 __ STA P3 
49d2 : a9 6d __ LDA #$6d
49d4 : 69 00 __ ADC #$00
49d6 : 85 11 __ STA P4 
49d8 : 20 eb 51 JSR $51eb ; (vdcwin_get_rect.s0 + 0)
49db : 20 50 36 JSR $3650 ; (vdcwin_win_free.s0 + 0)
49de : a9 20 __ LDA #$20
49e0 : 85 11 __ STA P4 
49e2 : ae 49 6d LDX $6d49 ; (winCfg + 5)
49e5 : bd 5a 67 LDA $675a,x ; (__multab13L + 0)
49e8 : 85 55 __ STA T1 + 0 
49ea : 18 __ __ CLC
49eb : 69 bc __ ADC #$bc
49ed : 85 56 __ STA T2 + 0 
49ef : a9 6d __ LDA #$6d
49f1 : 69 00 __ ADC #$00
49f3 : 85 57 __ STA T2 + 1 
49f5 : bc 5a 67 LDY $675a,x ; (__multab13L + 0)
49f8 : b9 bc 6d LDA $6dbc,y ; (linebuffer + 71)
49fb : 85 0f __ STA P2 
49fd : a6 55 __ LDX T1 + 0 
49ff : bd bd 6d LDA $6dbd,x ; (linebuffer + 72)
4a02 : 85 14 __ STA P7 
4a04 : bd be 6d LDA $6dbe,x ; (linebuffer + 73)
4a07 : 85 13 __ STA P6 
4a09 : bd bf 6d LDA $6dbf,x ; (linebuffer + 74)
4a0c : 85 15 __ STA P8 
4a0e : 20 79 2a JSR $2a79 ; (vdc_clear.s0 + 0)
4a11 : a5 56 __ LDA T2 + 0 
4a13 : 85 11 __ STA P4 
4a15 : a5 57 __ LDA T2 + 1 
4a17 : 85 12 __ STA P5 
4a19 : a9 00 __ LDA #$00
4a1b : 85 13 __ STA P6 
4a1d : a9 52 __ LDA #$52
4a1f : 85 16 __ STA P9 
4a21 : a9 01 __ LDA #$01
4a23 : 85 14 __ STA P7 
4a25 : a9 7a __ LDA #$7a
4a27 : 85 15 __ STA P8 
4a29 : 20 29 46 JSR $4629 ; (vdcwin_putat_string.s0 + 0)
4a2c : a5 11 __ LDA P4 
4a2e : 8d fa bf STA $bffa ; (sstack + 3)
4a31 : a5 12 __ LDA P5 
4a33 : 8d fb bf STA $bffb ; (sstack + 4)
4a36 : a5 53 __ LDA T0 + 0 
4a38 : 8d fc bf STA $bffc ; (sstack + 5)
4a3b : a5 54 __ LDA T0 + 1 
4a3d : 8d fd bf STA $bffd ; (sstack + 6)
4a40 : a9 00 __ LDA #$00
4a42 : a6 55 __ LDX T1 + 0 
4a44 : 9d c0 6d STA $6dc0,x ; (linebuffer + 75)
4a47 : a9 03 __ LDA #$03
4a49 : 9d c1 6d STA $6dc1,x ; (linebuffer + 76)
4a4c : 20 82 43 JSR $4382 ; (vdcwin_printwrap.s1000 + 0)
4a4f : ad 49 6d LDA $6d49 ; (winCfg + 5)
4a52 : 85 1b __ STA ACCU + 0 
4a54 : a9 00 __ LDA #$00
4a56 : 85 1c __ STA ACCU + 1 
4a58 : a9 0d __ LDA #$0d
4a5a : 20 3e 64 JSR $643e ; (mul16by8 + 0)
4a5d : 18 __ __ CLC
4a5e : a9 bc __ LDA #$bc
4a60 : 65 05 __ ADC WORK + 2 
4a62 : a0 02 __ LDY #$02
4a64 : 91 23 __ STA (SP + 0),y 
4a66 : a9 6d __ LDA #$6d
4a68 : 69 00 __ ADC #$00
4a6a : c8 __ __ INY
4a6b : 91 23 __ STA (SP + 0),y 
4a6d : a9 ff __ LDA #$ff
4a6f : c8 __ __ INY
4a70 : 91 23 __ STA (SP + 0),y 
4a72 : a9 27 __ LDA #$27
4a74 : c8 __ __ INY
4a75 : 91 23 __ STA (SP + 0),y 
4a77 : 20 06 45 JSR $4506 ; (vdcwin_printline.s1000 + 0)
4a7a : ae 49 6d LDX $6d49 ; (winCfg + 5)
4a7d : bd 5a 67 LDA $675a,x ; (__multab13L + 0)
4a80 : 18 __ __ CLC
4a81 : 69 bc __ ADC #$bc
4a83 : a0 02 __ LDY #$02
4a85 : 91 23 __ STA (SP + 0),y 
4a87 : a9 6d __ LDA #$6d
4a89 : 69 00 __ ADC #$00
4a8b : c8 __ __ INY
4a8c : 91 23 __ STA (SP + 0),y 
4a8e : a9 37 __ LDA #$37
4a90 : c8 __ __ INY
4a91 : 91 23 __ STA (SP + 0),y 
4a93 : a9 36 __ LDA #$36
4a95 : c8 __ __ INY
4a96 : 91 23 __ STA (SP + 0),y 
4a98 : bc 5a 67 LDY $675a,x ; (__multab13L + 0)
4a9b : b9 c1 6d LDA $6dc1,y ; (linebuffer + 76)
4a9e : 18 __ __ CLC
4a9f : 69 01 __ ADC #$01
4aa1 : b0 0d __ BCS $4ab0 ; (windows_textinput.s4 + 0)
.s1002:
4aa3 : d9 bf 6d CMP $6dbf,y ; (linebuffer + 74)
4aa6 : b0 08 __ BCS $4ab0 ; (windows_textinput.s4 + 0)
.s5:
4aa8 : be c1 6d LDX $6dc1,y ; (linebuffer + 76)
4aab : e8 __ __ INX
4aac : 8a __ __ TXA
4aad : 99 c1 6d STA $6dc1,y ; (linebuffer + 76)
.s4:
4ab0 : 20 ae 45 JSR $45ae ; (vdcwin_put_string.s1000 + 0)
4ab3 : 20 9d 2b JSR $2b9d ; (getch.s0 + 0)
4ab6 : 20 50 36 JSR $3650 ; (vdcwin_win_free.s0 + 0)
4ab9 : a5 53 __ LDA T0 + 0 
4abb : 85 1b __ STA ACCU + 0 
4abd : a5 54 __ LDA T0 + 1 
4abf : 85 1c __ STA ACCU + 1 
4ac1 : 20 c1 66 JSR $66c1 ; (free + 0)
.s1001:
4ac4 : 18 __ __ CLC
4ac5 : a5 23 __ LDA SP + 0 
4ac7 : 69 06 __ ADC #$06
4ac9 : 85 23 __ STA SP + 0 
4acb : 90 02 __ BCC $4acf ; (windows_textinput.s1001 + 11)
4acd : e6 24 __ INC SP + 1 
4acf : a2 04 __ LDX #$04
4ad1 : bd 8a bf LDA $bf8a,x ; (bigfont + 111)
4ad4 : 95 53 __ STA T0 + 0,x 
4ad6 : ca __ __ DEX
4ad7 : 10 f8 __ BPL $4ad1 ; (windows_textinput.s1001 + 13)
4ad9 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_cursor_backward: ; vdcwin_cursor_backward(struct VDCWin*)->bool
.s0:
4ada : a0 04 __ LDY #$04
4adc : b1 0d __ LDA (P0),y ; (win + 0)
4ade : f0 06 __ BEQ $4ae6 ; (vdcwin_cursor_backward.s2 + 0)
.s1:
4ae0 : 38 __ __ SEC
4ae1 : e9 01 __ SBC #$01
4ae3 : 4c fa 4a JMP $4afa ; (vdcwin_cursor_backward.s1003 + 0)
.s2:
4ae6 : c8 __ __ INY
4ae7 : b1 0d __ LDA (P0),y ; (win + 0)
4ae9 : f0 13 __ BEQ $4afe ; (vdcwin_cursor_backward.s1001 + 0)
.s5:
4aeb : aa __ __ TAX
4aec : 38 __ __ SEC
4aed : a0 02 __ LDY #$02
4aef : b1 0d __ LDA (P0),y ; (win + 0)
4af1 : e9 01 __ SBC #$01
4af3 : a0 04 __ LDY #$04
4af5 : 91 0d __ STA (P0),y ; (win + 0)
4af7 : ca __ __ DEX
4af8 : 8a __ __ TXA
4af9 : c8 __ __ INY
.s1003:
4afa : 91 0d __ STA (P0),y ; (win + 0)
4afc : a9 01 __ LDA #$01
.s1001:
4afe : 60 __ __ RTS
--------------------------------------------------------------------
bootdevice:
4aff : __ __ __ BSS	1
--------------------------------------------------------------------
4b00 : __ __ __ BYT 74 52 59 20 54 45 58 54 20 45 4e 54 52 59 20 49 : tRY TEXT ENTRY I
4b10 : __ __ __ BYT 4e 20 57 49 4e 44 4f 57 2c 20 41 43 43 45 50 54 : N WINDOW, ACCEPT
4b20 : __ __ __ BYT 20 57 49 54 48 20 72 65 74 75 72 6e 2e 00       :  WITH return..
--------------------------------------------------------------------
vdcwin_edit: ; vdcwin_edit(struct VDCWin*)->void
.s1000:
4b2e : a5 53 __ LDA T0 + 0 
4b30 : 8d eb bf STA $bfeb ; (vp_fill + 26)
4b33 : a5 54 __ LDA T0 + 1 
4b35 : 8d ec bf STA $bfec ; (vp_fill + 27)
4b38 : a5 55 __ LDA T1 + 0 
4b3a : 8d ed bf STA $bfed ; (vp_fill + 28)
.s0:
4b3d : ad f8 bf LDA $bff8 ; (sstack + 1)
4b40 : 85 53 __ STA T0 + 0 
4b42 : ad f9 bf LDA $bff9 ; (sstack + 2)
4b45 : 85 54 __ STA T0 + 1 
.l2:
4b47 : a5 53 __ LDA T0 + 0 
4b49 : 85 0d __ STA P0 
4b4b : a5 54 __ LDA T0 + 1 
4b4d : 85 0e __ STA P1 
4b4f : a9 01 __ LDA #$01
4b51 : 85 0f __ STA P2 
4b53 : 20 9a 4c JSR $4c9a ; (vdcwin_cursor_show.s0 + 0)
4b56 : c6 0f __ DEC P2 
4b58 : 20 42 36 JSR $3642 ; (vdcwin_getch.s0 + 0)
4b5b : a5 1b __ LDA ACCU + 0 ; (win + 1)
4b5d : 85 55 __ STA T1 + 0 
4b5f : 20 9a 4c JSR $4c9a ; (vdcwin_cursor_show.s0 + 0)
4b62 : a5 55 __ LDA T1 + 0 
4b64 : c9 14 __ CMP #$14
4b66 : d0 15 __ BNE $4b7d ; (vdcwin_edit.s57 + 0)
.s41:
4b68 : 20 da 4a JSR $4ada ; (vdcwin_cursor_backward.s0 + 0)
4b6b : 09 00 __ ORA #$00
4b6d : f0 d8 __ BEQ $4b47 ; (vdcwin_edit.l2 + 0)
.s42:
4b6f : a5 0d __ LDA P0 
4b71 : 85 15 __ STA P8 
4b73 : a5 0e __ LDA P1 
4b75 : 85 16 __ STA P9 
4b77 : 20 43 4d JSR $4d43 ; (vdcwin_delete_char.s0 + 0)
4b7a : 4c 47 4b JMP $4b47 ; (vdcwin_edit.l2 + 0)
.s57:
4b7d : b0 03 __ BCS $4b82 ; (vdcwin_edit.s58 + 0)
4b7f : 4c 5c 4c JMP $4c5c ; (vdcwin_edit.s59 + 0)
.s58:
4b82 : c9 93 __ CMP #$93
4b84 : d0 1f __ BNE $4ba5 ; (vdcwin_edit.s66 + 0)
.s12:
4b86 : a9 20 __ LDA #$20
4b88 : 85 11 __ STA P4 
4b8a : a0 00 __ LDY #$00
4b8c : b1 0d __ LDA (P0),y 
4b8e : 85 0f __ STA P2 
4b90 : c8 __ __ INY
4b91 : b1 0d __ LDA (P0),y 
4b93 : 85 14 __ STA P7 
4b95 : c8 __ __ INY
4b96 : b1 0d __ LDA (P0),y 
4b98 : 85 13 __ STA P6 
4b9a : c8 __ __ INY
4b9b : b1 0d __ LDA (P0),y 
4b9d : 85 15 __ STA P8 
4b9f : 20 79 2a JSR $2a79 ; (vdc_clear.s0 + 0)
4ba2 : 4c 50 4c JMP $4c50 ; (vdcwin_edit.s93 + 0)
.s66:
4ba5 : 90 58 __ BCC $4bff ; (vdcwin_edit.s68 + 0)
.s67:
4ba7 : c9 9d __ CMP #$9d
4ba9 : d0 06 __ BNE $4bb1 ; (vdcwin_edit.s46 + 0)
.s40:
4bab : 20 da 4a JSR $4ada ; (vdcwin_cursor_backward.s0 + 0)
4bae : 4c 47 4b JMP $4b47 ; (vdcwin_edit.l2 + 0)
.s46:
4bb1 : c9 20 __ CMP #$20
4bb3 : 90 92 __ BCC $4b47 ; (vdcwin_edit.l2 + 0)
.s51:
4bb5 : 09 00 __ ORA #$00
4bb7 : 10 04 __ BPL $4bbd ; (vdcwin_edit.s47 + 0)
.s50:
4bb9 : c9 a0 __ CMP #$a0
4bbb : 90 8a __ BCC $4b47 ; (vdcwin_edit.l2 + 0)
.s47:
4bbd : a0 05 __ LDY #$05
4bbf : b1 0d __ LDA (P0),y 
4bc1 : 18 __ __ CLC
4bc2 : 69 01 __ ADC #$01
4bc4 : b0 06 __ BCS $4bcc ; (vdcwin_edit.s55 + 0)
.s1004:
4bc6 : a0 03 __ LDY #$03
4bc8 : d1 0d __ CMP (P0),y 
4bca : 90 15 __ BCC $4be1 ; (vdcwin_edit.s52 + 0)
.s55:
4bcc : a0 04 __ LDY #$04
4bce : b1 0d __ LDA (P0),y 
4bd0 : 18 __ __ CLC
4bd1 : 69 01 __ ADC #$01
4bd3 : 90 03 __ BCC $4bd8 ; (vdcwin_edit.s1002 + 0)
4bd5 : 4c 47 4b JMP $4b47 ; (vdcwin_edit.l2 + 0)
.s1002:
4bd8 : a0 02 __ LDY #$02
4bda : d1 0d __ CMP (P0),y 
4bdc : 90 03 __ BCC $4be1 ; (vdcwin_edit.s52 + 0)
4bde : 4c 47 4b JMP $4b47 ; (vdcwin_edit.l2 + 0)
.s52:
4be1 : a5 0d __ LDA P0 
4be3 : 85 16 __ STA P9 
4be5 : a5 0e __ LDA P1 
4be7 : 85 17 __ STA P10 
4be9 : 20 04 4f JSR $4f04 ; (vdcwin_insert_char.s0 + 0)
4bec : a5 53 __ LDA T0 + 0 
4bee : 85 17 __ STA P10 
4bf0 : a5 54 __ LDA T0 + 1 
4bf2 : 85 18 __ STA P11 
4bf4 : a5 55 __ LDA T1 + 0 
4bf6 : 8d f7 bf STA $bff7 ; (sstack + 0)
4bf9 : 20 67 48 JSR $4867 ; (vdcwin_put_char.s1000 + 0)
4bfc : 4c 47 4b JMP $4b47 ; (vdcwin_edit.l2 + 0)
.s68:
4bff : c9 1d __ CMP #$1d
4c01 : f0 17 __ BEQ $4c1a ; (vdcwin_edit.s29 + 0)
.s69:
4c03 : c9 91 __ CMP #$91
4c05 : d0 aa __ BNE $4bb1 ; (vdcwin_edit.s46 + 0)
.s22:
4c07 : a0 05 __ LDY #$05
4c09 : b1 0d __ LDA (P0),y 
4c0b : d0 03 __ BNE $4c10 ; (vdcwin_edit.s24 + 0)
4c0d : 4c 47 4b JMP $4b47 ; (vdcwin_edit.l2 + 0)
.s24:
4c10 : aa __ __ TAX
4c11 : ca __ __ DEX
.s94:
4c12 : 8a __ __ TXA
4c13 : a0 05 __ LDY #$05
.s1042:
4c15 : 91 0d __ STA (P0),y 
4c17 : 4c 47 4b JMP $4b47 ; (vdcwin_edit.l2 + 0)
.s29:
4c1a : a0 02 __ LDY #$02
4c1c : b1 0d __ LDA (P0),y 
4c1e : 85 55 __ STA T1 + 0 
4c20 : a0 04 __ LDY #$04
4c22 : b1 0d __ LDA (P0),y 
4c24 : aa __ __ TAX
4c25 : 18 __ __ CLC
4c26 : 69 01 __ ADC #$01
4c28 : b0 08 __ BCS $4c32 ; (vdcwin_edit.s32 + 0)
.s1018:
4c2a : c5 55 __ CMP T1 + 0 
4c2c : b0 04 __ BCS $4c32 ; (vdcwin_edit.s32 + 0)
.s31:
4c2e : e8 __ __ INX
4c2f : 8a __ __ TXA
4c30 : 90 e3 __ BCC $4c15 ; (vdcwin_edit.s1042 + 0)
.s32:
4c32 : a0 05 __ LDY #$05
4c34 : b1 0d __ LDA (P0),y 
4c36 : aa __ __ TAX
4c37 : 18 __ __ CLC
4c38 : 69 01 __ ADC #$01
4c3a : 90 03 __ BCC $4c3f ; (vdcwin_edit.s1016 + 0)
4c3c : 4c 47 4b JMP $4b47 ; (vdcwin_edit.l2 + 0)
.s1016:
4c3f : a0 03 __ LDY #$03
4c41 : d1 0d __ CMP (P0),y 
4c43 : 90 03 __ BCC $4c48 ; (vdcwin_edit.s35 + 0)
4c45 : 4c 47 4b JMP $4b47 ; (vdcwin_edit.l2 + 0)
.s35:
4c48 : a9 00 __ LDA #$00
4c4a : c8 __ __ INY
4c4b : 91 0d __ STA (P0),y 
.s95:
4c4d : e8 __ __ INX
4c4e : 90 c2 __ BCC $4c12 ; (vdcwin_edit.s94 + 0)
.s93:
4c50 : a9 00 __ LDA #$00
4c52 : a0 04 __ LDY #$04
4c54 : 91 53 __ STA (T0 + 0),y 
4c56 : c8 __ __ INY
4c57 : 91 53 __ STA (T0 + 0),y 
4c59 : 4c 47 4b JMP $4b47 ; (vdcwin_edit.l2 + 0)
.s59:
4c5c : c9 11 __ CMP #$11
4c5e : d0 16 __ BNE $4c76 ; (vdcwin_edit.s60 + 0)
.s15:
4c60 : a0 05 __ LDY #$05
4c62 : b1 0d __ LDA (P0),y 
4c64 : aa __ __ TAX
4c65 : 18 __ __ CLC
4c66 : 69 01 __ ADC #$01
4c68 : 90 03 __ BCC $4c6d ; (vdcwin_edit.s1034 + 0)
4c6a : 4c 47 4b JMP $4b47 ; (vdcwin_edit.l2 + 0)
.s1034:
4c6d : a0 03 __ LDY #$03
4c6f : d1 0d __ CMP (P0),y 
4c71 : 90 da __ BCC $4c4d ; (vdcwin_edit.s95 + 0)
4c73 : 4c 47 4b JMP $4b47 ; (vdcwin_edit.l2 + 0)
.s60:
4c76 : 90 07 __ BCC $4c7f ; (vdcwin_edit.s62 + 0)
.s61:
4c78 : c9 13 __ CMP #$13
4c7a : f0 d4 __ BEQ $4c50 ; (vdcwin_edit.s93 + 0)
4c7c : 4c b1 4b JMP $4bb1 ; (vdcwin_edit.s46 + 0)
.s62:
4c7f : c9 03 __ CMP #$03
4c81 : f0 07 __ BEQ $4c8a ; (vdcwin_edit.s1001 + 0)
.s63:
4c83 : c9 0d __ CMP #$0d
4c85 : f0 03 __ BEQ $4c8a ; (vdcwin_edit.s1001 + 0)
4c87 : 4c b1 4b JMP $4bb1 ; (vdcwin_edit.s46 + 0)
.s1001:
4c8a : ad eb bf LDA $bfeb ; (vp_fill + 26)
4c8d : 85 53 __ STA T0 + 0 
4c8f : ad ec bf LDA $bfec ; (vp_fill + 27)
4c92 : 85 54 __ STA T0 + 1 
4c94 : ad ed bf LDA $bfed ; (vp_fill + 28)
4c97 : 85 55 __ STA T1 + 0 
4c99 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_cursor_show: ; vdcwin_cursor_show(struct VDCWin*,bool)->void
.s0:
4c9a : a0 01 __ LDY #$01
4c9c : b1 0d __ LDA (P0),y ; (win + 0)
4c9e : 18 __ __ CLC
4c9f : a0 05 __ LDY #$05
4ca1 : 71 0d __ ADC (P0),y ; (win + 0)
4ca3 : 0a __ __ ASL
4ca4 : aa __ __ TAX
4ca5 : 18 __ __ CLC
4ca6 : 88 __ __ DEY
4ca7 : b1 0d __ LDA (P0),y ; (win + 0)
4ca9 : a0 00 __ LDY #$00
4cab : 71 0d __ ADC (P0),y ; (win + 0)
4cad : 18 __ __ CLC
4cae : 7d 00 6f ADC $6f00,x ; (multab + 0)
4cb1 : a8 __ __ TAY
4cb2 : a9 00 __ LDA #$00
4cb4 : 7d 01 6f ADC $6f01,x ; (multab + 1)
4cb7 : a2 12 __ LDX #$12
4cb9 : 8e 00 d6 STX $d600 
4cbc : aa __ __ TAX
4cbd : 98 __ __ TYA
4cbe : 18 __ __ CLC
4cbf : 6d 66 6d ADC $6d66 ; (vdc_state + 10)
4cc2 : a8 __ __ TAY
4cc3 : 8a __ __ TXA
4cc4 : 6d 67 6d ADC $6d67 ; (vdc_state + 11)
4cc7 : aa __ __ TAX
4cc8 : a5 0f __ LDA P2 ; (show + 0)
4cca : d0 50 __ BNE $4d1c ; (vdcwin_cursor_show.l1026 + 0)
.l1027:
4ccc : 2c 00 d6 BIT $d600 
4ccf : 10 fb __ BPL $4ccc ; (vdcwin_cursor_show.l1027 + 0)
.s47:
4cd1 : 8e 01 d6 STX $d601 
4cd4 : a9 13 __ LDA #$13
4cd6 : 8d 00 d6 STA $d600 
.l351:
4cd9 : 2c 00 d6 BIT $d600 
4cdc : 10 fb __ BPL $4cd9 ; (vdcwin_cursor_show.l351 + 0)
.s52:
4cde : 8c 01 d6 STY $d601 
4ce1 : a9 1f __ LDA #$1f
4ce3 : 8d 00 d6 STA $d600 
.l353:
4ce6 : 2c 00 d6 BIT $d600 
4ce9 : 10 fb __ BPL $4ce6 ; (vdcwin_cursor_show.l353 + 0)
.s56:
4ceb : ad 01 d6 LDA $d601 
4cee : 29 bf __ AND #$bf
.s1030:
4cf0 : 85 1b __ STA ACCU + 0 
4cf2 : a9 12 __ LDA #$12
4cf4 : 8d 00 d6 STA $d600 
.l344:
4cf7 : 2c 00 d6 BIT $d600 
4cfa : 10 fb __ BPL $4cf7 ; (vdcwin_cursor_show.l344 + 0)
.s1029:
4cfc : 8e 01 d6 STX $d601 
4cff : a9 13 __ LDA #$13
4d01 : 8d 00 d6 STA $d600 
.l346:
4d04 : 2c 00 d6 BIT $d600 
4d07 : 10 fb __ BPL $4d04 ; (vdcwin_cursor_show.l346 + 0)
.s1028:
4d09 : 8c 01 d6 STY $d601 
4d0c : a9 1f __ LDA #$1f
4d0e : 8d 00 d6 STA $d600 
.l348:
4d11 : 2c 00 d6 BIT $d600 
4d14 : 10 fb __ BPL $4d11 ; (vdcwin_cursor_show.l348 + 0)
.s560:
4d16 : a5 1b __ LDA ACCU + 0 
4d18 : 8d 01 d6 STA $d601 
.s1001:
4d1b : 60 __ __ RTS
.l1026:
4d1c : 2c 00 d6 BIT $d600 
4d1f : 10 fb __ BPL $4d1c ; (vdcwin_cursor_show.l1026 + 0)
.s13:
4d21 : 8e 01 d6 STX $d601 
4d24 : a9 13 __ LDA #$13
4d26 : 8d 00 d6 STA $d600 
.l340:
4d29 : 2c 00 d6 BIT $d600 
4d2c : 10 fb __ BPL $4d29 ; (vdcwin_cursor_show.l340 + 0)
.s18:
4d2e : 8c 01 d6 STY $d601 
4d31 : a9 1f __ LDA #$1f
4d33 : 8d 00 d6 STA $d600 
.l342:
4d36 : 2c 00 d6 BIT $d600 
4d39 : 10 fb __ BPL $4d36 ; (vdcwin_cursor_show.l342 + 0)
.s22:
4d3b : ad 01 d6 LDA $d601 
4d3e : 09 40 __ ORA #$40
4d40 : 4c f0 4c JMP $4cf0 ; (vdcwin_cursor_show.s1030 + 0)
--------------------------------------------------------------------
vdcwin_delete_char: ; vdcwin_delete_char(struct VDCWin*)->void
.s0:
4d43 : a0 05 __ LDY #$05
4d45 : b1 15 __ LDA (P8),y ; (win + 0)
4d47 : 85 46 __ STA T2 + 0 
4d49 : 0a __ __ ASL
4d4a : aa __ __ TAX
4d4b : bd 00 6f LDA $6f00,x ; (multab + 0)
4d4e : 85 47 __ STA T3 + 0 
4d50 : 18 __ __ CLC
4d51 : c8 __ __ INY
4d52 : 71 15 __ ADC (P8),y ; (win + 0)
4d54 : 85 49 __ STA T4 + 0 
4d56 : bd 01 6f LDA $6f01,x ; (multab + 1)
4d59 : 85 48 __ STA T3 + 1 
4d5b : c8 __ __ INY
4d5c : 71 15 __ ADC (P8),y ; (win + 0)
4d5e : 85 4a __ STA T4 + 1 
4d60 : a0 04 __ LDY #$04
4d62 : b1 15 __ LDA (P8),y ; (win + 0)
4d64 : 85 4b __ STA T5 + 0 
4d66 : 18 __ __ CLC
4d67 : 65 49 __ ADC T4 + 0 
4d69 : 85 0f __ STA P2 
4d6b : a9 00 __ LDA #$00
4d6d : 85 14 __ STA P7 
4d6f : 65 4a __ ADC T4 + 1 
4d71 : 85 10 __ STA P3 
4d73 : 18 __ __ CLC
4d74 : a5 0f __ LDA P2 
4d76 : 69 01 __ ADC #$01
4d78 : 85 11 __ STA P4 
4d7a : a5 10 __ LDA P3 
4d7c : 69 00 __ ADC #$00
4d7e : 85 12 __ STA P5 
4d80 : a0 02 __ LDY #$02
4d82 : b1 15 __ LDA (P8),y ; (win + 0)
4d84 : 38 __ __ SEC
4d85 : e9 01 __ SBC #$01
4d87 : 85 4c __ STA T6 + 0 
4d89 : 38 __ __ SEC
4d8a : e5 4b __ SBC T5 + 0 
4d8c : 85 13 __ STA P6 
4d8e : a0 08 __ LDY #$08
4d90 : b1 15 __ LDA (P8),y ; (win + 0)
4d92 : 85 4f __ STA T8 + 0 
4d94 : c8 __ __ INY
4d95 : b1 15 __ LDA (P8),y ; (win + 0)
4d97 : 85 50 __ STA T8 + 1 
4d99 : 20 ea 46 JSR $46ea ; (vdc_block_copy.s0 + 0)
4d9c : 18 __ __ CLC
4d9d : a5 4f __ LDA T8 + 0 
4d9f : 65 47 __ ADC T3 + 0 
4da1 : 85 47 __ STA T3 + 0 
4da3 : a5 50 __ LDA T8 + 1 
4da5 : 65 48 __ ADC T3 + 1 
4da7 : 85 48 __ STA T3 + 1 
4da9 : 18 __ __ CLC
4daa : a5 47 __ LDA T3 + 0 
4dac : 65 4b __ ADC T5 + 0 
4dae : 85 0f __ STA P2 
4db0 : a5 48 __ LDA T3 + 1 
4db2 : 69 00 __ ADC #$00
4db4 : 85 10 __ STA P3 
4db6 : 18 __ __ CLC
4db7 : a5 0f __ LDA P2 
4db9 : 69 01 __ ADC #$01
4dbb : 85 11 __ STA P4 
4dbd : a5 10 __ LDA P3 
.l6:
4dbf : 69 00 __ ADC #$00
4dc1 : 85 12 __ STA P5 
4dc3 : 20 ea 46 JSR $46ea ; (vdc_block_copy.s0 + 0)
4dc6 : e6 46 __ INC T2 + 0 
4dc8 : 18 __ __ CLC
4dc9 : a5 4c __ LDA T6 + 0 
4dcb : 65 49 __ ADC T4 + 0 
4dcd : aa __ __ TAX
4dce : a9 00 __ LDA #$00
4dd0 : 65 4a __ ADC T4 + 1 
4dd2 : 85 4e __ STA T7 + 1 
4dd4 : a5 46 __ LDA T2 + 0 
4dd6 : a0 03 __ LDY #$03
4dd8 : d1 15 __ CMP (P8),y ; (win + 0)
4dda : a9 12 __ LDA #$12
4ddc : 8d 00 d6 STA $d600 
4ddf : 90 27 __ BCC $4e08 ; (vdcwin_delete_char.s7 + 0)
.l461:
4de1 : 2c 00 d6 BIT $d600 
4de4 : 10 fb __ BPL $4de1 ; (vdcwin_delete_char.l461 + 0)
.s84:
4de6 : a5 4e __ LDA T7 + 1 
4de8 : 8d 01 d6 STA $d601 
4deb : a9 13 __ LDA #$13
4ded : 8d 00 d6 STA $d600 
.l463:
4df0 : 2c 00 d6 BIT $d600 
4df3 : 10 fb __ BPL $4df0 ; (vdcwin_delete_char.l463 + 0)
.s89:
4df5 : 8e 01 d6 STX $d601 
4df8 : a9 1f __ LDA #$1f
4dfa : 8d 00 d6 STA $d600 
.l465:
4dfd : 2c 00 d6 BIT $d600 
4e00 : 10 fb __ BPL $4dfd ; (vdcwin_delete_char.l465 + 0)
.s93:
4e02 : a9 20 __ LDA #$20
4e04 : 8d 01 d6 STA $d601 
.s1001:
4e07 : 60 __ __ RTS
.s7:
4e08 : a5 49 __ LDA T4 + 0 
4e0a : 6d 5f 6d ADC $6d5f ; (vdc_state + 3)
4e0d : a8 __ __ TAY
4e0e : a5 4a __ LDA T4 + 1 
4e10 : 6d 60 6d ADC $6d60 ; (vdc_state + 4)
4e13 : 85 45 __ STA T9 + 1 
.l437:
4e15 : 2c 00 d6 BIT $d600 
4e18 : 10 fb __ BPL $4e15 ; (vdcwin_delete_char.l437 + 0)
.s16:
4e1a : 8d 01 d6 STA $d601 
4e1d : a9 13 __ LDA #$13
4e1f : 8d 00 d6 STA $d600 
.l439:
4e22 : 2c 00 d6 BIT $d600 
4e25 : 10 fb __ BPL $4e22 ; (vdcwin_delete_char.l439 + 0)
.s21:
4e27 : 8c 01 d6 STY $d601 
4e2a : a9 1f __ LDA #$1f
4e2c : 8d 00 d6 STA $d600 
.l441:
4e2f : 2c 00 d6 BIT $d600 
4e32 : 10 fb __ BPL $4e2f ; (vdcwin_delete_char.l441 + 0)
.s25:
4e34 : ad 01 d6 LDA $d601 
4e37 : 85 43 __ STA T1 + 0 
4e39 : a9 12 __ LDA #$12
4e3b : 8d 00 d6 STA $d600 
.l443:
4e3e : 2c 00 d6 BIT $d600 
4e41 : 10 fb __ BPL $4e3e ; (vdcwin_delete_char.l443 + 0)
.s33:
4e43 : a5 4e __ LDA T7 + 1 
4e45 : 8d 01 d6 STA $d601 
4e48 : a9 13 __ LDA #$13
4e4a : 8d 00 d6 STA $d600 
.l445:
4e4d : 2c 00 d6 BIT $d600 
4e50 : 10 fb __ BPL $4e4d ; (vdcwin_delete_char.l445 + 0)
.s38:
4e52 : 8e 01 d6 STX $d601 
4e55 : a9 1f __ LDA #$1f
4e57 : 8d 00 d6 STA $d600 
.l447:
4e5a : 2c 00 d6 BIT $d600 
4e5d : 10 fb __ BPL $4e5a ; (vdcwin_delete_char.l447 + 0)
.s42:
4e5f : a5 43 __ LDA T1 + 0 
4e61 : 8d 01 d6 STA $d601 
4e64 : a9 12 __ LDA #$12
4e66 : 8d 00 d6 STA $d600 
4e69 : 18 __ __ CLC
4e6a : a5 47 __ LDA T3 + 0 
4e6c : 65 4c __ ADC T6 + 0 
4e6e : aa __ __ TAX
4e6f : a5 48 __ LDA T3 + 1 
4e71 : 69 00 __ ADC #$00
4e73 : 85 4a __ STA T4 + 1 
4e75 : 18 __ __ CLC
4e76 : a5 47 __ LDA T3 + 0 
4e78 : 6d 5f 6d ADC $6d5f ; (vdc_state + 3)
4e7b : 85 4d __ STA T7 + 0 
4e7d : a5 48 __ LDA T3 + 1 
4e7f : 6d 60 6d ADC $6d60 ; (vdc_state + 4)
4e82 : 85 4e __ STA T7 + 1 
.l449:
4e84 : 2c 00 d6 BIT $d600 
4e87 : 10 fb __ BPL $4e84 ; (vdcwin_delete_char.l449 + 0)
.s50:
4e89 : 8d 01 d6 STA $d601 
4e8c : a9 13 __ LDA #$13
4e8e : 8d 00 d6 STA $d600 
.l451:
4e91 : 2c 00 d6 BIT $d600 
4e94 : 10 fb __ BPL $4e91 ; (vdcwin_delete_char.l451 + 0)
.s55:
4e96 : a5 4d __ LDA T7 + 0 
4e98 : 8d 01 d6 STA $d601 
4e9b : a9 1f __ LDA #$1f
4e9d : 8d 00 d6 STA $d600 
.l453:
4ea0 : 2c 00 d6 BIT $d600 
4ea3 : 10 fb __ BPL $4ea0 ; (vdcwin_delete_char.l453 + 0)
.s59:
4ea5 : ad 01 d6 LDA $d601 
4ea8 : 85 43 __ STA T1 + 0 
4eaa : a9 12 __ LDA #$12
4eac : 8d 00 d6 STA $d600 
.l455:
4eaf : 2c 00 d6 BIT $d600 
4eb2 : 10 fb __ BPL $4eaf ; (vdcwin_delete_char.l455 + 0)
.s67:
4eb4 : a5 4a __ LDA T4 + 1 
4eb6 : 8d 01 d6 STA $d601 
4eb9 : a9 13 __ LDA #$13
4ebb : 8d 00 d6 STA $d600 
.l457:
4ebe : 2c 00 d6 BIT $d600 
4ec1 : 10 fb __ BPL $4ebe ; (vdcwin_delete_char.l457 + 0)
.s72:
4ec3 : 8e 01 d6 STX $d601 
4ec6 : a9 1f __ LDA #$1f
4ec8 : 8d 00 d6 STA $d600 
.l459:
4ecb : 2c 00 d6 BIT $d600 
4ece : 10 fb __ BPL $4ecb ; (vdcwin_delete_char.l459 + 0)
.s76:
4ed0 : 84 0f __ STY P2 
4ed2 : 84 49 __ STY T4 + 0 
4ed4 : a5 43 __ LDA T1 + 0 
4ed6 : 8d 01 d6 STA $d601 
4ed9 : 98 __ __ TYA
4eda : 18 __ __ CLC
4edb : 69 01 __ ADC #$01
4edd : 85 11 __ STA P4 
4edf : a5 45 __ LDA T9 + 1 
4ee1 : 85 10 __ STA P3 
4ee3 : 85 4a __ STA T4 + 1 
4ee5 : a6 4c __ LDX T6 + 0 
4ee7 : 86 13 __ STX P6 
4ee9 : 69 00 __ ADC #$00
4eeb : 85 12 __ STA P5 
4eed : 20 86 67 JSR $6786 ; (vdc_block_copy@proxy + 0)
4ef0 : a5 4d __ LDA T7 + 0 
4ef2 : 85 47 __ STA T3 + 0 
4ef4 : 85 0f __ STA P2 
4ef6 : 18 __ __ CLC
4ef7 : 69 01 __ ADC #$01
4ef9 : 85 11 __ STA P4 
4efb : a5 4e __ LDA T7 + 1 
4efd : 85 48 __ STA T3 + 1 
4eff : 85 10 __ STA P3 
4f01 : 4c bf 4d JMP $4dbf ; (vdcwin_delete_char.l6 + 0)
--------------------------------------------------------------------
vdcwin_insert_char: ; vdcwin_insert_char(struct VDCWin*)->void
.s0:
4f04 : a0 02 __ LDY #$02
4f06 : b1 16 __ LDA (P9),y ; (win + 0)
4f08 : 38 __ __ SEC
4f09 : e9 01 __ SBC #$01
4f0b : 85 46 __ STA T2 + 0 
4f0d : c8 __ __ INY
4f0e : b1 16 __ LDA (P9),y ; (win + 0)
4f10 : 38 __ __ SEC
4f11 : e9 01 __ SBC #$01
4f13 : 85 47 __ STA T3 + 0 
4f15 : 0a __ __ ASL
4f16 : aa __ __ TAX
4f17 : a0 06 __ LDY #$06
4f19 : b1 16 __ LDA (P9),y ; (win + 0)
4f1b : 18 __ __ CLC
4f1c : 7d 00 6f ADC $6f00,x ; (multab + 0)
4f1f : 85 4b __ STA T5 + 0 
4f21 : c8 __ __ INY
4f22 : b1 16 __ LDA (P9),y ; (win + 0)
4f24 : 7d 01 6f ADC $6f01,x ; (multab + 1)
4f27 : 85 4c __ STA T5 + 1 
4f29 : c8 __ __ INY
4f2a : b1 16 __ LDA (P9),y ; (win + 0)
4f2c : 18 __ __ CLC
4f2d : 7d 00 6f ADC $6f00,x ; (multab + 0)
4f30 : 85 49 __ STA T4 + 0 
4f32 : c8 __ __ INY
4f33 : b1 16 __ LDA (P9),y ; (win + 0)
4f35 : 7d 01 6f ADC $6f01,x ; (multab + 1)
4f38 : 85 4a __ STA T4 + 1 
4f3a : 4c 42 4f JMP $4f42 ; (vdcwin_insert_char.l5 + 0)
.s80:
4f3d : 8e 01 d6 STX $d601 
4f40 : c6 47 __ DEC T3 + 0 
.l5:
4f42 : a0 05 __ LDY #$05
4f44 : b1 16 __ LDA (P9),y ; (win + 0)
4f46 : c5 47 __ CMP T3 + 0 
4f48 : b0 03 __ BCS $4f4d ; (vdcwin_insert_char.s7 + 0)
4f4a : 4c 44 50 JMP $5044 ; (vdcwin_insert_char.s6 + 0)
.s7:
4f4d : 88 __ __ DEY
4f4e : b1 16 __ LDA (P9),y ; (win + 0)
4f50 : 18 __ __ CLC
4f51 : 65 4b __ ADC T5 + 0 
4f53 : 85 47 __ STA T3 + 0 
4f55 : a9 00 __ LDA #$00
4f57 : 65 4c __ ADC T5 + 1 
4f59 : 85 48 __ STA T3 + 1 
4f5b : 38 __ __ SEC
4f5c : a5 46 __ LDA T2 + 0 
4f5e : f1 16 __ SBC (P9),y ; (win + 0)
4f60 : d0 2e __ BNE $4f90 ; (vdcwin_insert_char.s81 + 0)
.s83:
4f62 : a9 12 __ LDA #$12
4f64 : 8d 00 d6 STA $d600 
.l476:
4f67 : 2c 00 d6 BIT $d600 
4f6a : 10 fb __ BPL $4f67 ; (vdcwin_insert_char.l476 + 0)
.s95:
4f6c : a5 48 __ LDA T3 + 1 
4f6e : 8d 01 d6 STA $d601 
4f71 : a9 13 __ LDA #$13
4f73 : 8d 00 d6 STA $d600 
.l478:
4f76 : 2c 00 d6 BIT $d600 
4f79 : 10 fb __ BPL $4f76 ; (vdcwin_insert_char.l478 + 0)
.s100:
4f7b : a5 47 __ LDA T3 + 0 
4f7d : 8d 01 d6 STA $d601 
4f80 : a9 1f __ LDA #$1f
4f82 : 8d 00 d6 STA $d600 
.l480:
4f85 : 2c 00 d6 BIT $d600 
4f88 : 10 fb __ BPL $4f85 ; (vdcwin_insert_char.l480 + 0)
.s104:
4f8a : a9 20 __ LDA #$20
4f8c : 8d 01 d6 STA $d601 
.s1001:
4f8f : 60 __ __ RTS
.s81:
4f90 : 85 46 __ STA T2 + 0 
4f92 : 85 13 __ STA P6 
4f94 : 85 12 __ STA P5 
4f96 : 18 __ __ CLC
4f97 : a5 47 __ LDA T3 + 0 
4f99 : 69 01 __ ADC #$01
4f9b : 85 4b __ STA T5 + 0 
4f9d : a5 48 __ LDA T3 + 1 
4f9f : 69 00 __ ADC #$00
4fa1 : 85 4c __ STA T5 + 1 
4fa3 : b1 16 __ LDA (P9),y ; (win + 0)
4fa5 : 18 __ __ CLC
4fa6 : 65 49 __ ADC T4 + 0 
4fa8 : 85 16 __ STA P9 ; (win + 0)
4faa : a9 00 __ LDA #$00
4fac : 65 4a __ ADC T4 + 1 
4fae : 85 17 __ STA P10 ; (win + 1)
4fb0 : 18 __ __ CLC
4fb1 : a5 16 __ LDA P9 ; (win + 0)
4fb3 : 69 01 __ ADC #$01
4fb5 : 85 49 __ STA T4 + 0 
4fb7 : a5 17 __ LDA P10 ; (win + 1)
4fb9 : 69 00 __ ADC #$00
4fbb : 85 4a __ STA T4 + 1 
4fbd : ad 5d 6d LDA $6d5d ; (vdc_state + 1)
4fc0 : d0 0e __ BNE $4fd0 ; (vdcwin_insert_char.s86 + 0)
.s88:
4fc2 : a9 03 __ LDA #$03
4fc4 : cd 69 6d CMP $6d69 ; (vdc_state + 13)
4fc7 : d0 05 __ BNE $4fce ; (vdcwin_insert_char.s1009 + 0)
.s1008:
4fc9 : a9 ff __ LDA #$ff
4fcb : cd 68 6d CMP $6d68 ; (vdc_state + 12)
.s1009:
4fce : 90 3d __ BCC $500d ; (vdcwin_insert_char.s85 + 0)
.s86:
4fd0 : a5 47 __ LDA T3 + 0 
4fd2 : 85 11 __ STA P4 
4fd4 : a5 48 __ LDA T3 + 1 
4fd6 : 85 12 __ STA P5 
4fd8 : ad 68 6d LDA $6d68 ; (vdc_state + 12)
4fdb : 85 4d __ STA T6 + 0 
4fdd : 85 0f __ STA P2 
4fdf : ad 69 6d LDA $6d69 ; (vdc_state + 13)
4fe2 : 85 4e __ STA T6 + 1 
4fe4 : 85 10 __ STA P3 
4fe6 : 20 86 67 JSR $6786 ; (vdc_block_copy@proxy + 0)
4fe9 : a5 4b __ LDA T5 + 0 
4feb : 85 0f __ STA P2 
4fed : a5 4c __ LDA T5 + 1 
4fef : 85 10 __ STA P3 
4ff1 : 20 a3 67 JSR $67a3 ; (vdc_block_copy@proxy + 0)
4ff4 : a5 16 __ LDA P9 ; (win + 0)
4ff6 : 85 11 __ STA P4 
4ff8 : a5 17 __ LDA P10 ; (win + 1)
4ffa : 85 12 __ STA P5 
4ffc : 20 ae 67 JSR $67ae ; (vdc_block_copy@proxy + 0)
4fff : a5 49 __ LDA T4 + 0 
5001 : 85 0f __ STA P2 
5003 : a5 4a __ LDA T4 + 1 
5005 : 85 10 __ STA P3 
5007 : 20 a3 67 JSR $67a3 ; (vdc_block_copy@proxy + 0)
500a : 4c 62 4f JMP $4f62 ; (vdcwin_insert_char.s83 + 0)
.s85:
500d : a5 47 __ LDA T3 + 0 
500f : 85 10 __ STA P3 
5011 : a5 48 __ LDA T3 + 1 
5013 : 85 11 __ STA P4 
5015 : 20 d7 15 JSR $15d7 ; (bnk_cpyfromvdc@proxy + 0)
5018 : a5 4b __ LDA T5 + 0 
501a : 85 0f __ STA P2 
501c : a5 4c __ LDA T5 + 1 
501e : 85 10 __ STA P3 
5020 : a5 46 __ LDA T2 + 0 
5022 : 85 14 __ STA P7 
5024 : 20 9a 14 JSR $149a ; (bnk_cpytovdc@proxy + 0)
5027 : a5 16 __ LDA P9 ; (win + 0)
5029 : 85 10 __ STA P3 
502b : a5 17 __ LDA P10 ; (win + 1)
502d : 85 11 __ STA P4 
502f : a5 14 __ LDA P7 
5031 : 85 12 __ STA P5 
5033 : 20 d7 15 JSR $15d7 ; (bnk_cpyfromvdc@proxy + 0)
5036 : a5 49 __ LDA T4 + 0 
5038 : 85 0f __ STA P2 
503a : a5 4a __ LDA T4 + 1 
503c : 85 10 __ STA P3 
503e : 20 9a 14 JSR $149a ; (bnk_cpytovdc@proxy + 0)
5041 : 4c 62 4f JMP $4f62 ; (vdcwin_insert_char.s83 + 0)
.s6:
5044 : a5 4b __ LDA T5 + 0 
5046 : 69 01 __ ADC #$01
5048 : 85 4d __ STA T6 + 0 
504a : a5 4c __ LDA T5 + 1 
504c : 69 00 __ ADC #$00
504e : 85 4e __ STA T6 + 1 
5050 : 18 __ __ CLC
5051 : a5 49 __ LDA T4 + 0 
5053 : 69 01 __ ADC #$01
5055 : 85 4f __ STA T7 + 0 
5057 : a5 4a __ LDA T4 + 1 
5059 : 69 00 __ ADC #$00
505b : 85 50 __ STA T7 + 1 
505d : ad 5d 6d LDA $6d5d ; (vdc_state + 1)
5060 : d0 0e __ BNE $5070 ; (vdcwin_insert_char.s10 + 0)
.s12:
5062 : a9 03 __ LDA #$03
5064 : cd 69 6d CMP $6d69 ; (vdc_state + 13)
5067 : d0 05 __ BNE $506e ; (vdcwin_insert_char.s1035 + 0)
.s1034:
5069 : a9 ff __ LDA #$ff
506b : cd 68 6d CMP $6d68 ; (vdc_state + 12)
.s1035:
506e : 90 51 __ BCC $50c1 ; (vdcwin_insert_char.s9 + 0)
.s10:
5070 : a5 4b __ LDA T5 + 0 
5072 : 85 11 __ STA P4 
5074 : a5 4c __ LDA T5 + 1 
5076 : 85 12 __ STA P5 
5078 : ad 68 6d LDA $6d68 ; (vdc_state + 12)
507b : 85 51 __ STA T8 + 0 
507d : 85 0f __ STA P2 
507f : ad 69 6d LDA $6d69 ; (vdc_state + 13)
5082 : 85 52 __ STA T8 + 1 
5084 : 85 10 __ STA P3 
5086 : a5 46 __ LDA T2 + 0 
5088 : 85 13 __ STA P6 
508a : 20 86 67 JSR $6786 ; (vdc_block_copy@proxy + 0)
508d : a5 51 __ LDA T8 + 0 
508f : 85 11 __ STA P4 
5091 : a5 52 __ LDA T8 + 1 
5093 : 85 12 __ STA P5 
5095 : 20 ae 67 JSR $67ae ; (vdc_block_copy@proxy + 0)
5098 : a5 51 __ LDA T8 + 0 
509a : 85 0f __ STA P2 
509c : a5 52 __ LDA T8 + 1 
509e : 85 10 __ STA P3 
50a0 : a5 49 __ LDA T4 + 0 
50a2 : 85 11 __ STA P4 
50a4 : a5 4a __ LDA T4 + 1 
50a6 : 85 12 __ STA P5 
50a8 : 20 ea 46 JSR $46ea ; (vdc_block_copy.s0 + 0)
50ab : a5 4f __ LDA T7 + 0 
50ad : 85 0f __ STA P2 
50af : a5 50 __ LDA T7 + 1 
50b1 : 85 10 __ STA P3 
50b3 : a5 51 __ LDA T8 + 0 
50b5 : 85 11 __ STA P4 
50b7 : a5 52 __ LDA T8 + 1 
50b9 : 85 12 __ STA P5 
50bb : 20 ea 46 JSR $46ea ; (vdc_block_copy.s0 + 0)
50be : 4c f1 50 JMP $50f1 ; (vdcwin_insert_char.s8 + 0)
.s9:
50c1 : a5 4b __ LDA T5 + 0 
50c3 : 85 10 __ STA P3 
50c5 : a5 4c __ LDA T5 + 1 
50c7 : 85 11 __ STA P4 
50c9 : 20 0c 14 JSR $140c ; (bnk_cpyfromvdc@proxy + 0)
50cc : a5 4d __ LDA T6 + 0 
50ce : 85 0f __ STA P2 
50d0 : a5 4e __ LDA T6 + 1 
50d2 : 85 10 __ STA P3 
50d4 : a5 12 __ LDA P5 
50d6 : 85 14 __ STA P7 
50d8 : 20 9a 14 JSR $149a ; (bnk_cpytovdc@proxy + 0)
50db : a5 49 __ LDA T4 + 0 
50dd : 85 10 __ STA P3 
50df : a5 4a __ LDA T4 + 1 
50e1 : 85 11 __ STA P4 
50e3 : 20 0c 14 JSR $140c ; (bnk_cpyfromvdc@proxy + 0)
50e6 : a5 4f __ LDA T7 + 0 
50e8 : 85 0f __ STA P2 
50ea : a5 50 __ LDA T7 + 1 
50ec : 85 10 __ STA P3 
50ee : 20 9a 14 JSR $149a ; (bnk_cpytovdc@proxy + 0)
.s8:
50f1 : a9 12 __ LDA #$12
50f3 : 8d 00 d6 STA $d600 
50f6 : 38 __ __ SEC
50f7 : a5 4b __ LDA T5 + 0 
50f9 : ed 5f 6d SBC $6d5f ; (vdc_state + 3)
50fc : 85 4b __ STA T5 + 0 
50fe : a5 4c __ LDA T5 + 1 
5100 : ed 60 6d SBC $6d60 ; (vdc_state + 4)
5103 : 85 4c __ STA T5 + 1 
5105 : 18 __ __ CLC
5106 : a5 4b __ LDA T5 + 0 
5108 : 6d 5f 6d ADC $6d5f ; (vdc_state + 3)
510b : aa __ __ TAX
510c : a5 4c __ LDA T5 + 1 
510e : 6d 60 6d ADC $6d60 ; (vdc_state + 4)
5111 : a8 __ __ TAY
5112 : 18 __ __ CLC
5113 : a5 46 __ LDA T2 + 0 
5115 : 65 4b __ ADC T5 + 0 
5117 : 85 1b __ STA ACCU + 0 
5119 : a9 00 __ LDA #$00
511b : 65 4c __ ADC T5 + 1 
511d : 85 44 __ STA T10 + 0 
511f : 38 __ __ SEC
5120 : a5 49 __ LDA T4 + 0 
5122 : ed 5f 6d SBC $6d5f ; (vdc_state + 3)
5125 : 85 49 __ STA T4 + 0 
5127 : a5 4a __ LDA T4 + 1 
5129 : ed 60 6d SBC $6d60 ; (vdc_state + 4)
512c : 85 4a __ STA T4 + 1 
.l449:
512e : 2c 00 d6 BIT $d600 
5131 : 10 fb __ BPL $512e ; (vdcwin_insert_char.l449 + 0)
.s20:
5133 : a5 44 __ LDA T10 + 0 
5135 : 8d 01 d6 STA $d601 
5138 : a9 13 __ LDA #$13
513a : 8d 00 d6 STA $d600 
.l451:
513d : 2c 00 d6 BIT $d600 
5140 : 10 fb __ BPL $513d ; (vdcwin_insert_char.l451 + 0)
.s25:
5142 : a5 1b __ LDA ACCU + 0 
5144 : 8d 01 d6 STA $d601 
5147 : a9 1f __ LDA #$1f
5149 : 8d 00 d6 STA $d600 
.l453:
514c : 2c 00 d6 BIT $d600 
514f : 10 fb __ BPL $514c ; (vdcwin_insert_char.l453 + 0)
.s29:
5151 : ad 01 d6 LDA $d601 
5154 : 85 43 __ STA T1 + 0 
5156 : a9 12 __ LDA #$12
5158 : 8d 00 d6 STA $d600 
.l455:
515b : 2c 00 d6 BIT $d600 
515e : 10 fb __ BPL $515b ; (vdcwin_insert_char.l455 + 0)
.s37:
5160 : 8c 01 d6 STY $d601 
5163 : a9 13 __ LDA #$13
5165 : 8d 00 d6 STA $d600 
.l457:
5168 : 2c 00 d6 BIT $d600 
516b : 10 fb __ BPL $5168 ; (vdcwin_insert_char.l457 + 0)
.s42:
516d : 8e 01 d6 STX $d601 
5170 : a9 1f __ LDA #$1f
5172 : 8d 00 d6 STA $d600 
.l459:
5175 : 2c 00 d6 BIT $d600 
5178 : 10 fb __ BPL $5175 ; (vdcwin_insert_char.l459 + 0)
.s46:
517a : a5 43 __ LDA T1 + 0 
517c : 8d 01 d6 STA $d601 
517f : a9 12 __ LDA #$12
5181 : 8d 00 d6 STA $d600 
5184 : 18 __ __ CLC
5185 : a5 49 __ LDA T4 + 0 
5187 : 65 46 __ ADC T2 + 0 
5189 : aa __ __ TAX
518a : a5 4a __ LDA T4 + 1 
518c : 69 00 __ ADC #$00
518e : a8 __ __ TAY
518f : 18 __ __ CLC
5190 : a5 49 __ LDA T4 + 0 
5192 : 6d 5f 6d ADC $6d5f ; (vdc_state + 3)
5195 : 85 4d __ STA T6 + 0 
5197 : a5 4a __ LDA T4 + 1 
5199 : 6d 60 6d ADC $6d60 ; (vdc_state + 4)
519c : 85 4e __ STA T6 + 1 
.l461:
519e : 2c 00 d6 BIT $d600 
51a1 : 10 fb __ BPL $519e ; (vdcwin_insert_char.l461 + 0)
.s54:
51a3 : 8c 01 d6 STY $d601 
51a6 : a9 13 __ LDA #$13
51a8 : 8d 00 d6 STA $d600 
.l463:
51ab : 2c 00 d6 BIT $d600 
51ae : 10 fb __ BPL $51ab ; (vdcwin_insert_char.l463 + 0)
.s59:
51b0 : 8e 01 d6 STX $d601 
51b3 : a9 1f __ LDA #$1f
51b5 : 8d 00 d6 STA $d600 
.l465:
51b8 : 2c 00 d6 BIT $d600 
51bb : 10 fb __ BPL $51b8 ; (vdcwin_insert_char.l465 + 0)
.s63:
51bd : a9 12 __ LDA #$12
51bf : ae 01 d6 LDX $d601 
51c2 : 8d 00 d6 STA $d600 
.l467:
51c5 : 2c 00 d6 BIT $d600 
51c8 : 10 fb __ BPL $51c5 ; (vdcwin_insert_char.l467 + 0)
.s71:
51ca : a5 4e __ LDA T6 + 1 
51cc : 8d 01 d6 STA $d601 
51cf : a9 13 __ LDA #$13
51d1 : 8d 00 d6 STA $d600 
.l469:
51d4 : 2c 00 d6 BIT $d600 
51d7 : 10 fb __ BPL $51d4 ; (vdcwin_insert_char.l469 + 0)
.s76:
51d9 : a5 4d __ LDA T6 + 0 
51db : 8d 01 d6 STA $d601 
51de : a9 1f __ LDA #$1f
51e0 : 8d 00 d6 STA $d600 
.l471:
51e3 : 2c 00 d6 BIT $d600 
51e6 : 10 fb __ BPL $51e3 ; (vdcwin_insert_char.l471 + 0)
51e8 : 4c 3d 4f JMP $4f3d ; (vdcwin_insert_char.s80 + 0)
--------------------------------------------------------------------
vdcwin_get_rect: ; vdcwin_get_rect(struct VDCWin*,u8,u8,u8,u8,u8,u8*)->void
.s0:
51eb : a0 06 __ LDY #$06
51ed : b1 10 __ LDA (P3),y ; (win + 0)
51ef : 18 __ __ CLC
51f0 : 6d 00 6f ADC $6f00 ; (multab + 0)
51f3 : 85 43 __ STA T0 + 0 
51f5 : c8 __ __ INY
51f6 : b1 10 __ LDA (P3),y ; (win + 0)
51f8 : 6d 01 6f ADC $6f01 ; (multab + 1)
51fb : 85 44 __ STA T0 + 1 
51fd : a9 05 __ LDA #$05
51ff : 85 45 __ STA T2 + 0 
.l4:
5201 : a9 00 __ LDA #$00
5203 : 85 46 __ STA T3 + 0 
.l8:
5205 : a9 12 __ LDA #$12
5207 : 8d 00 d6 STA $d600 
520a : 18 __ __ CLC
520b : a5 12 __ LDA P5 ; (chars + 0)
520d : 65 46 __ ADC T3 + 0 
520f : 85 0d __ STA P0 
5211 : a5 13 __ LDA P6 ; (chars + 1)
5213 : 69 00 __ ADC #$00
5215 : 85 0e __ STA P1 
5217 : 18 __ __ CLC
5218 : a5 43 __ LDA T0 + 0 
521a : 65 46 __ ADC T3 + 0 
521c : aa __ __ TAX
521d : a5 44 __ LDA T0 + 1 
521f : 69 00 __ ADC #$00
.l129:
5221 : 2c 00 d6 BIT $d600 
5224 : 10 fb __ BPL $5221 ; (vdcwin_get_rect.l129 + 0)
.s18:
5226 : 8d 01 d6 STA $d601 
5229 : a9 13 __ LDA #$13
522b : 8d 00 d6 STA $d600 
.l131:
522e : 2c 00 d6 BIT $d600 
5231 : 10 fb __ BPL $522e ; (vdcwin_get_rect.l131 + 0)
.s23:
5233 : 8e 01 d6 STX $d601 
5236 : a9 1f __ LDA #$1f
5238 : 8d 00 d6 STA $d600 
.l133:
523b : 2c 00 d6 BIT $d600 
523e : 10 fb __ BPL $523b ; (vdcwin_get_rect.l133 + 0)
.s27:
5240 : ad 01 d6 LDA $d601 
5243 : a8 __ __ TAY
5244 : 4a __ __ LSR
5245 : 4a __ __ LSR
5246 : 4a __ __ LSR
5247 : 4a __ __ LSR
5248 : 4a __ __ LSR
5249 : aa __ __ TAX
524a : 98 __ __ TYA
524b : 5d f2 68 EOR $68f2,x ; (s2pmap + 0)
524e : 85 0f __ STA P2 
5250 : 20 4b 15 JSR $154b ; (bnk_writeb.s0 + 0)
5253 : e6 46 __ INC T3 + 0 
5255 : a5 46 __ LDA T3 + 0 
5257 : c9 32 __ CMP #$32
5259 : 90 aa __ BCC $5205 ; (vdcwin_get_rect.l8 + 0)
.s10:
525b : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
525e : 18 __ __ CLC
525f : 65 43 __ ADC T0 + 0 
5261 : 85 43 __ STA T0 + 0 
5263 : ad 60 6d LDA $6d60 ; (vdc_state + 4)
5266 : 65 44 __ ADC T0 + 1 
5268 : 85 44 __ STA T0 + 1 
526a : 18 __ __ CLC
526b : a5 12 __ LDA P5 ; (chars + 0)
526d : 69 32 __ ADC #$32
526f : 85 12 __ STA P5 ; (chars + 0)
5271 : 90 02 __ BCC $5275 ; (vdcwin_get_rect.s1011 + 0)
.s1010:
5273 : e6 13 __ INC P6 ; (chars + 1)
.s1011:
5275 : c6 45 __ DEC T2 + 0 
5277 : d0 88 __ BNE $5201 ; (vdcwin_get_rect.l4 + 0)
.s1001:
5279 : 60 __ __ RTS
--------------------------------------------------------------------
527a : __ __ __ BYT 65 4e 54 45 52 45 44 20 53 54 52 49 4e 47 20 46 : eNTERED STRING F
528a : __ __ __ BYT 4f 52 4d 41 54 54 45 44 20 57 49 54 48 20 57 4f : ORMATTED WITH WO
529a : __ __ __ BYT 52 44 20 57 52 41 50 3a 00                      : RD WRAP:.
--------------------------------------------------------------------
viewport_demo: ; viewport_demo(u8)->void
.s1000:
52a3 : a5 53 __ LDA T0 + 0 
52a5 : 8d 9e bf STA $bf9e ; (bigfont + 131)
52a8 : a5 54 __ LDA T2 + 0 
52aa : 8d 9f bf STA $bf9f ; (bigfont + 132)
52ad : a5 55 __ LDA T3 + 0 
52af : 8d a0 bf STA $bfa0 ; (bigfont + 133)
.s0:
52b2 : a9 00 __ LDA #$00
52b4 : 8d fd bf STA $bffd ; (sstack + 6)
52b7 : 8d fe bf STA $bffe ; (sstack + 7)
52ba : ad ff bf LDA $bfff ; (sstack + 8)
52bd : 85 53 __ STA T0 + 0 
52bf : 8d fc bf STA $bffc ; (sstack + 5)
52c2 : 20 46 54 JSR $5446 ; (screen_switch.s1000 + 0)
52c5 : a5 1b __ LDA ACCU + 0 
52c7 : d0 10 __ BNE $52d9 ; (viewport_demo.s3 + 0)
.s1001:
52c9 : ad 9e bf LDA $bf9e ; (bigfont + 131)
52cc : 85 53 __ STA T0 + 0 
52ce : ad 9f bf LDA $bf9f ; (bigfont + 132)
52d1 : 85 54 __ STA T2 + 0 
52d3 : ad a0 bf LDA $bfa0 ; (bigfont + 133)
52d6 : 85 55 __ STA T3 + 0 
52d8 : 60 __ __ RTS
.s3:
52d9 : ad 63 6d LDA $6d63 ; (vdc_state + 7)
52dc : 85 13 __ STA P6 
52de : a9 93 __ LDA #$93
52e0 : 85 11 __ STA P4 
52e2 : a9 55 __ LDA #$55
52e4 : 85 12 __ STA P5 
52e6 : 20 cc 67 JSR $67cc ; (vdc_prints_attr@proxy + 0)
52e9 : a9 05 __ LDA #$05
52eb : 85 0f __ STA P2 
52ed : 85 10 __ STA P3 
52ef : ad 61 6d LDA $6d61 ; (vdc_state + 5)
52f2 : 38 __ __ SEC
52f3 : e9 07 __ SBC #$07
52f5 : 85 55 __ STA T3 + 0 
52f7 : 85 12 __ STA P5 
52f9 : a9 46 __ LDA #$46
52fb : 85 11 __ STA P4 
52fd : a9 c3 __ LDA #$c3
52ff : 85 0d __ STA P0 
5301 : a9 bf __ LDA #$bf
5303 : 85 0e __ STA P1 
5305 : 20 15 33 JSR $3315 ; (vdcwin_init.s0 + 0)
5308 : a9 c3 __ LDA #$c3
530a : 85 14 __ STA P7 
530c : a9 bf __ LDA #$bf
530e : 85 15 __ STA P8 
5310 : 20 d5 33 JSR $33d5 ; (vdcwin_border_clear@proxy + 0)
5313 : a9 00 __ LDA #$00
5315 : 8d aa bf STA $bfaa ; (bigfont + 143)
5318 : 8d ab bf STA $bfab ; (bigfont + 144)
531b : 8d ac bf STA $bfac ; (bigfont + 145)
531e : 8d ad bf STA $bfad ; (bigfont + 146)
5321 : a9 7f __ LDA #$7f
5323 : 8d a3 bf STA $bfa3 ; (bigfont + 136)
5326 : a9 05 __ LDA #$05
5328 : 85 0f __ STA P2 
532a : 85 10 __ STA P3 
532c : a5 55 __ LDA T3 + 0 
532e : 85 12 __ STA P5 
5330 : a9 46 __ LDA #$46
5332 : 85 11 __ STA P4 
5334 : a9 40 __ LDA #$40
5336 : 8d a5 bf STA $bfa5 ; (bigfont + 138)
5339 : a5 53 __ LDA T0 + 0 
533b : 0a __ __ ASL
533c : 85 54 __ STA T2 + 0 
533e : 85 55 __ STA T3 + 0 
5340 : aa __ __ TAX
5341 : bd fa 68 LDA $68fa,x ; (screenset + 0)
5344 : 8d a6 bf STA $bfa6 ; (bigfont + 139)
5347 : a9 00 __ LDA #$00
5349 : 8d a9 bf STA $bfa9 ; (bigfont + 142)
534c : 8d a4 bf STA $bfa4 ; (bigfont + 137)
534f : 8d a7 bf STA $bfa7 ; (bigfont + 140)
5352 : bd fb 68 LDA $68fb,x ; (screenset + 1)
5355 : 8d a8 bf STA $bfa8 ; (bigfont + 141)
5358 : a9 ae __ LDA #$ae
535a : 85 0d __ STA P0 
535c : a9 bf __ LDA #$bf
535e : 85 0e __ STA P1 
5360 : 20 15 33 JSR $3315 ; (vdcwin_init.s0 + 0)
5363 : a9 a3 __ LDA #$a3
5365 : 85 16 __ STA P9 
5367 : a9 bf __ LDA #$bf
5369 : 85 17 __ STA P10 
536b : 20 44 39 JSR $3944 ; (vdcwin_cpy_viewport.s0 + 0)
.l7:
536e : 20 9d 2b JSR $2b9d ; (getch.s0 + 0)
5371 : 85 53 __ STA T0 + 0 
5373 : a2 00 __ LDX #$00
5375 : 86 43 __ STX T1 + 0 
5377 : c9 57 __ CMP #$57
5379 : f0 04 __ BEQ $537f ; (viewport_demo.s12 + 0)
.s13:
537b : c9 91 __ CMP #$91
537d : d0 11 __ BNE $5390 ; (viewport_demo.s11 + 0)
.s12:
537f : ad ac bf LDA $bfac ; (bigfont + 145)
5382 : 0d ad bf ORA $bfad ; (bigfont + 146)
5385 : f0 09 __ BEQ $5390 ; (viewport_demo.s11 + 0)
.s9:
5387 : a9 08 __ LDA #$08
5389 : 85 43 __ STA T1 + 0 
538b : a5 53 __ LDA T0 + 0 
538d : 4c 96 53 JMP $5396 ; (viewport_demo.s18 + 0)
.s11:
5390 : a5 53 __ LDA T0 + 0 
5392 : c9 53 __ CMP #$53
5394 : f0 04 __ BEQ $539a ; (viewport_demo.s17 + 0)
.s18:
5396 : c9 11 __ CMP #$11
5398 : d0 2f __ BNE $53c9 ; (viewport_demo.s16 + 0)
.s17:
539a : a6 54 __ LDX T2 + 0 
539c : bd fb 68 LDA $68fb,x ; (screenset + 1)
539f : 38 __ __ SEC
53a0 : ed 61 6d SBC $6d61 ; (vdc_state + 5)
53a3 : a8 __ __ TAY
53a4 : a9 00 __ LDA #$00
53a6 : ed 62 6d SBC $6d62 ; (vdc_state + 6)
53a9 : aa __ __ TAX
53aa : 98 __ __ TYA
53ab : 18 __ __ CLC
53ac : 69 06 __ ADC #$06
53ae : 85 44 __ STA T4 + 0 
53b0 : 90 01 __ BCC $53b3 ; (viewport_demo.s1027 + 0)
.s1026:
53b2 : e8 __ __ INX
.s1027:
53b3 : 86 45 __ STX T4 + 1 
53b5 : ad ad bf LDA $bfad ; (bigfont + 146)
53b8 : c5 45 __ CMP T4 + 1 
53ba : d0 05 __ BNE $53c1 ; (viewport_demo.s1017 + 0)
.s1016:
53bc : ad ac bf LDA $bfac ; (bigfont + 145)
53bf : c5 44 __ CMP T4 + 0 
.s1017:
53c1 : b0 06 __ BCS $53c9 ; (viewport_demo.s16 + 0)
.s14:
53c3 : a5 43 __ LDA T1 + 0 
53c5 : 09 04 __ ORA #$04
53c7 : 85 43 __ STA T1 + 0 
.s16:
53c9 : a5 53 __ LDA T0 + 0 
53cb : c9 41 __ CMP #$41
53cd : f0 04 __ BEQ $53d3 ; (viewport_demo.s22 + 0)
.s23:
53cf : c9 9d __ CMP #$9d
53d1 : d0 0e __ BNE $53e1 ; (viewport_demo.s21 + 0)
.s22:
53d3 : ad aa bf LDA $bfaa ; (bigfont + 143)
53d6 : 0d ab bf ORA $bfab ; (bigfont + 144)
53d9 : f0 06 __ BEQ $53e1 ; (viewport_demo.s21 + 0)
.s19:
53db : a5 43 __ LDA T1 + 0 
53dd : 09 01 __ ORA #$01
53df : 85 43 __ STA T1 + 0 
.s21:
53e1 : a5 53 __ LDA T0 + 0 
53e3 : c9 44 __ CMP #$44
53e5 : f0 04 __ BEQ $53eb ; (viewport_demo.s27 + 0)
.s28:
53e7 : c9 1d __ CMP #$1d
53e9 : d0 24 __ BNE $540f ; (viewport_demo.s26 + 0)
.s27:
53eb : a6 55 __ LDX T3 + 0 
53ed : bd fa 68 LDA $68fa,x ; (screenset + 0)
53f0 : 38 __ __ SEC
53f1 : e9 47 __ SBC #$47
53f3 : 85 44 __ STA T4 + 0 
53f5 : a9 00 __ LDA #$00
53f7 : e9 00 __ SBC #$00
53f9 : 85 45 __ STA T4 + 1 
53fb : ad ab bf LDA $bfab ; (bigfont + 144)
53fe : c5 45 __ CMP T4 + 1 
5400 : d0 05 __ BNE $5407 ; (viewport_demo.s1007 + 0)
.s1006:
5402 : ad aa bf LDA $bfaa ; (bigfont + 143)
5405 : c5 44 __ CMP T4 + 0 
.s1007:
5407 : b0 06 __ BCS $540f ; (viewport_demo.s26 + 0)
.s24:
5409 : a5 43 __ LDA T1 + 0 
540b : 09 02 __ ORA #$02
540d : 90 04 __ BCC $5413 ; (viewport_demo.s29 + 0)
.s26:
540f : a5 43 __ LDA T1 + 0 
5411 : f0 10 __ BEQ $5423 ; (viewport_demo.s31 + 0)
.s29:
5413 : 8d f9 bf STA $bff9 ; (sstack + 2)
5416 : a9 a3 __ LDA #$a3
5418 : 8d f7 bf STA $bff7 ; (sstack + 0)
541b : a9 bf __ LDA #$bf
541d : 8d f8 bf STA $bff8 ; (sstack + 1)
5420 : 20 c8 55 JSR $55c8 ; (vdcwin_viewportscroll.s1000 + 0)
.s31:
5423 : a5 53 __ LDA T0 + 0 
5425 : c9 1b __ CMP #$1b
5427 : f0 07 __ BEQ $5430 ; (viewport_demo.s8 + 0)
.s32:
5429 : c9 03 __ CMP #$03
542b : f0 03 __ BEQ $5430 ; (viewport_demo.s8 + 0)
542d : 4c 6e 53 JMP $536e ; (viewport_demo.l7 + 0)
.s8:
5430 : a9 01 __ LDA #$01
5432 : 8d fd bf STA $bffd ; (sstack + 6)
5435 : a9 00 __ LDA #$00
5437 : 8d fe bf STA $bffe ; (sstack + 7)
543a : ad ff bf LDA $bfff ; (sstack + 8)
543d : 8d fc bf STA $bffc ; (sstack + 5)
5440 : 20 46 54 JSR $5446 ; (screen_switch.s1000 + 0)
5443 : 4c c9 52 JMP $52c9 ; (viewport_demo.s1001 + 0)
--------------------------------------------------------------------
screen_switch: ; screen_switch(u8,u8,u8)->u8
.s1000:
5446 : a5 53 __ LDA T1 + 0 
5448 : 8d de bf STA $bfde ; (bigfont + 195)
.s0:
544b : ae 61 6d LDX $6d61 ; (vdc_state + 5)
544e : ca __ __ DEX
544f : ca __ __ DEX
5450 : 86 15 __ STX P8 
5452 : 20 1f 68 JSR $681f ; (vdc_clear@proxy + 0)
5455 : a9 12 __ LDA #$12
5457 : 85 11 __ STA P4 
5459 : a9 55 __ LDA #$55
545b : 85 12 __ STA P5 
545d : 20 ea 67 JSR $67ea ; (vdc_prints_attr@proxy + 0)
5460 : a9 01 __ LDA #$01
5462 : 85 53 __ STA T1 + 0 
5464 : a9 00 __ LDA #$00
5466 : cd fc bf CMP $bffc ; (sstack + 5)
5469 : 2a __ __ ROL
546a : 85 46 __ STA T3 + 0 
546c : d0 07 __ BNE $5475 ; (screen_switch.s2 + 0)
.s5:
546e : ad fc bf LDA $bffc ; (sstack + 5)
5471 : c9 02 __ CMP #$02
5473 : d0 5d __ BNE $54d2 ; (screen_switch.s4 + 0)
.s2:
5475 : a9 00 __ LDA #$00
5477 : 85 11 __ STA P4 
5479 : a9 40 __ LDA #$40
547b : 85 12 __ STA P5 
547d : ad fd bf LDA $bffd ; (sstack + 6)
5480 : f0 07 __ BEQ $5489 ; (screen_switch.s7 + 0)
.s6:
5482 : a9 30 __ LDA #$30
5484 : a0 c3 __ LDY #$c3
5486 : 4c c0 54 JMP $54c0 ; (screen_switch.s32 + 0)
.s7:
5489 : a5 46 __ LDA T3 + 0 
548b : d0 56 __ BNE $54e3 ; (screen_switch.s12 + 0)
.s13:
548d : a9 73 __ LDA #$73
548f : 85 13 __ STA P6 
5491 : a9 55 __ LDA #$55
5493 : 85 14 __ STA P7 
5495 : 20 9a 30 JSR $309a ; (krill_load.s0 + 0)
5498 : 09 00 __ ORA #$00
549a : f0 07 __ BEQ $54a3 ; (screen_switch.s24 + 0)
.s22:
549c : 20 cb 30 JSR $30cb ; (menu_fileerrormessage.s1000 + 0)
549f : a9 00 __ LDA #$00
54a1 : c6 53 __ DEC T1 + 0 
.s24:
54a3 : 85 0f __ STA P2 
54a5 : a9 04 __ LDA #$04
54a7 : 85 10 __ STA P3 
54a9 : a9 7b __ LDA #$7b
54ab : 85 11 __ STA P4 
54ad : a9 55 __ LDA #$55
54af : 85 12 __ STA P5 
54b1 : 20 d7 67 JSR $67d7 ; (vdc_prints_attr@proxy + 0)
54b4 : a9 00 __ LDA #$00
54b6 : 85 11 __ STA P4 
54b8 : a9 a0 __ LDA #$a0
54ba : 85 12 __ STA P5 
54bc : a9 55 __ LDA #$55
54be : a0 8c __ LDY #$8c
.s32:
54c0 : 84 13 __ STY P6 
54c2 : 85 14 __ STA P7 
54c4 : 20 9a 30 JSR $309a ; (krill_load.s0 + 0)
54c7 : 09 00 __ ORA #$00
54c9 : f0 07 __ BEQ $54d2 ; (screen_switch.s4 + 0)
.s9:
54cb : 20 cb 30 JSR $30cb ; (menu_fileerrormessage.s1000 + 0)
54ce : a9 00 __ LDA #$00
54d0 : 85 53 __ STA T1 + 0 
.s4:
54d2 : a9 00 __ LDA #$00
54d4 : 85 0f __ STA P2 
54d6 : 20 0c 68 JSR $680c ; (vdc_clear@proxy + 0)
54d9 : a5 53 __ LDA T1 + 0 
54db : 85 1b __ STA ACCU + 0 
.s1001:
54dd : ad de bf LDA $bfde ; (bigfont + 195)
54e0 : 85 53 __ STA T1 + 0 
54e2 : 60 __ __ RTS
.s12:
54e3 : a9 27 __ LDA #$27
54e5 : 85 13 __ STA P6 
54e7 : a9 55 __ LDA #$55
54e9 : 85 14 __ STA P7 
54eb : 20 9a 30 JSR $309a ; (krill_load.s0 + 0)
54ee : 09 00 __ ORA #$00
54f0 : f0 05 __ BEQ $54f7 ; (screen_switch.s34 + 0)
.s15:
54f2 : 20 cb 30 JSR $30cb ; (menu_fileerrormessage.s1000 + 0)
54f5 : c6 53 __ DEC T1 + 0 
.s34:
54f7 : ad fe bf LDA $bffe ; (sstack + 7)
54fa : d0 d6 __ BNE $54d2 ; (screen_switch.s4 + 0)
.s18:
54fc : 85 0f __ STA P2 
54fe : ae 61 6d LDX $6d61 ; (vdc_state + 5)
5501 : ca __ __ DEX
5502 : 86 10 __ STX P3 
5504 : a9 2f __ LDA #$2f
5506 : 85 11 __ STA P4 
5508 : a9 55 __ LDA #$55
550a : 85 12 __ STA P5 
550c : 20 d7 67 JSR $67d7 ; (vdc_prints_attr@proxy + 0)
550f : 4c d2 54 JMP $54d2 ; (screen_switch.s4 + 0)
--------------------------------------------------------------------
5512 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 53 43 52 45 45 4e 20 44 : lOADING SCREEN D
5522 : __ __ __ BYT 41 54 41 2e 00                                  : ATA..
--------------------------------------------------------------------
5527 : __ __ __ BYT 53 43 52 45 45 4e 31 00                         : SCREEN1.
--------------------------------------------------------------------
552f : __ __ __ BYT 70 45 54 53 43 49 49 20 41 52 54 20 43 52 45 44 : pETSCII ART CRED
553f : __ __ __ BYT 49 54 3a 20 27 6c 4f 56 45 20 49 53 20 54 48 45 : IT: 'lOVE IS THE
554f : __ __ __ BYT 20 44 52 55 47 27 20 61 54 4c 41 4e 54 49 53 2c :  DRUG' aTLANTIS,
555f : __ __ __ BYT 20 32 30 32 33 2c 20 61 52 54 20 42 59 20 6c 4f :  2023, aRT BY lO
556f : __ __ __ BYT 42 4f 2e 00                                     : BO..
--------------------------------------------------------------------
5573 : __ __ __ BYT 53 43 52 45 45 4e 33 00                         : SCREEN3.
--------------------------------------------------------------------
557b : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 43 48 41 52 53 45 54 2e : lOADING CHARSET.
558b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
558c : __ __ __ BYT 43 48 41 52 53 31 00                            : CHARS1.
--------------------------------------------------------------------
5593 : __ __ __ BYT 6d 4f 56 45 20 42 59 20 77 2c 61 2c 73 2c 64 20 : mOVE BY w,a,s,d 
55a3 : __ __ __ BYT 4f 52 20 43 55 52 53 4f 52 20 4b 45 59 53 2e 20 : OR CURSOR KEYS. 
55b3 : __ __ __ BYT 65 73 63 20 4f 52 20 73 74 6f 70 20 54 4f 20 45 : esc OR stop TO E
55c3 : __ __ __ BYT 58 49 54 2e 00                                  : XIT..
--------------------------------------------------------------------
vdcwin_viewportscroll: ; vdcwin_viewportscroll(struct VDCViewport*,u8)->void
.s1000:
55c8 : a5 53 __ LDA T2 + 0 
55ca : 8d cd bf STA $bfcd ; (bigfont + 178)
.s0:
55cd : ad f7 bf LDA $bff7 ; (sstack + 0)
55d0 : 85 50 __ STA T0 + 0 
55d2 : ad f8 bf LDA $bff8 ; (sstack + 1)
55d5 : 85 51 __ STA T0 + 1 
55d7 : a0 14 __ LDY #$14
.l1002:
55d9 : b1 50 __ LDA (T0 + 0),y 
55db : 99 d1 bf STA $bfd1,y ; (bigfont + 182)
55de : 88 __ __ DEY
55df : 10 f8 __ BPL $55d9 ; (vdcwin_viewportscroll.l1002 + 0)
.s1003:
55e1 : ad f9 bf LDA $bff9 ; (sstack + 2)
55e4 : 85 53 __ STA T2 + 0 
55e6 : 4a __ __ LSR
55e7 : 90 45 __ BCC $562e ; (vdcwin_viewportscroll.s14 + 0)
.s1:
55e9 : a5 50 __ LDA T0 + 0 
55eb : 69 0a __ ADC #$0a
55ed : 85 16 __ STA P9 
55ef : a5 51 __ LDA T0 + 1 
55f1 : 69 00 __ ADC #$00
55f3 : 85 17 __ STA P10 
55f5 : 20 46 57 JSR $5746 ; (vdcwin_scroll_right.s1000 + 0)
55f8 : a9 01 __ LDA #$01
55fa : 85 11 __ STA P4 
55fc : a0 0b __ LDY #$0b
55fe : b1 50 __ LDA (T0 + 0),y 
5600 : 85 0f __ STA P2 
5602 : c8 __ __ INY
5603 : b1 50 __ LDA (T0 + 0),y 
5605 : 85 10 __ STA P3 
5607 : a0 0e __ LDY #$0e
5609 : b1 50 __ LDA (T0 + 0),y 
560b : 85 12 __ STA P5 
560d : ad d8 bf LDA $bfd8 ; (bigfont + 189)
5610 : 18 __ __ CLC
5611 : 69 ff __ ADC #$ff
5613 : 8d d8 bf STA $bfd8 ; (bigfont + 189)
5616 : b0 03 __ BCS $561b ; (vdcwin_viewportscroll.s1005 + 0)
.s1004:
5618 : ce d9 bf DEC $bfd9 ; (bigfont + 190)
.s1005:
561b : 18 __ __ CLC
561c : a0 07 __ LDY #$07
561e : b1 50 __ LDA (T0 + 0),y 
5620 : 69 ff __ ADC #$ff
5622 : 91 50 __ STA (T0 + 0),y 
5624 : c8 __ __ INY
5625 : b1 50 __ LDA (T0 + 0),y 
5627 : 69 ff __ ADC #$ff
5629 : 91 50 __ STA (T0 + 0),y 
562b : 20 0d 33 JSR $330d ; (vdcwin_init@proxy + 0)
.s14:
562e : a5 53 __ LDA T2 + 0 
5630 : 29 02 __ AND #$02
5632 : f0 58 __ BEQ $568c ; (vdcwin_viewportscroll.s15 + 0)
.s4:
5634 : 18 __ __ CLC
5635 : a5 50 __ LDA T0 + 0 
5637 : 69 0b __ ADC #$0b
5639 : 85 16 __ STA P9 
563b : a5 51 __ LDA T0 + 1 
563d : 69 00 __ ADC #$00
563f : 85 17 __ STA P10 
5641 : 20 50 58 JSR $5850 ; (vdcwin_scroll_left.s0 + 0)
5644 : a9 01 __ LDA #$01
5646 : 85 11 __ STA P4 
5648 : a0 0c __ LDY #$0c
564a : b1 50 __ LDA (T0 + 0),y 
564c : 85 10 __ STA P3 
564e : a0 0e __ LDY #$0e
5650 : b1 50 __ LDA (T0 + 0),y 
5652 : 85 12 __ STA P5 
5654 : 88 __ __ DEY
5655 : b1 50 __ LDA (T0 + 0),y 
5657 : 85 43 __ STA T1 + 0 
5659 : 18 __ __ CLC
565a : 6d d8 bf ADC $bfd8 ; (bigfont + 189)
565d : 8d d8 bf STA $bfd8 ; (bigfont + 189)
5660 : 90 03 __ BCC $5665 ; (vdcwin_viewportscroll.s1007 + 0)
.s1006:
5662 : ee d9 bf INC $bfd9 ; (bigfont + 190)
.s1007:
5665 : 18 __ __ CLC
5666 : a0 07 __ LDY #$07
5668 : b1 50 __ LDA (T0 + 0),y 
566a : 69 01 __ ADC #$01
566c : 91 50 __ STA (T0 + 0),y 
566e : c8 __ __ INY
566f : b1 50 __ LDA (T0 + 0),y 
5671 : 69 00 __ ADC #$00
5673 : 91 50 __ STA (T0 + 0),y 
5675 : a9 dc __ LDA #$dc
5677 : 85 0d __ STA P0 
5679 : a9 bf __ LDA #$bf
567b : 85 0e __ STA P1 
567d : a0 0b __ LDY #$0b
567f : b1 50 __ LDA (T0 + 0),y 
5681 : 18 __ __ CLC
5682 : 65 43 __ ADC T1 + 0 
5684 : 38 __ __ SEC
5685 : e9 01 __ SBC #$01
5687 : 85 0f __ STA P2 
5689 : 20 15 33 JSR $3315 ; (vdcwin_init.s0 + 0)
.s15:
568c : a5 53 __ LDA T2 + 0 
568e : 29 08 __ AND #$08
5690 : f0 45 __ BEQ $56d7 ; (vdcwin_viewportscroll.s16 + 0)
.s7:
5692 : 18 __ __ CLC
5693 : a5 50 __ LDA T0 + 0 
5695 : 69 0b __ ADC #$0b
5697 : 85 15 __ STA P8 
5699 : a5 51 __ LDA T0 + 1 
569b : 69 00 __ ADC #$00
569d : 85 16 __ STA P9 
569f : 20 3b 59 JSR $593b ; (vdcwin_scroll_down.s0 + 0)
56a2 : a9 01 __ LDA #$01
56a4 : 85 12 __ STA P5 
56a6 : a0 0b __ LDY #$0b
56a8 : b1 50 __ LDA (T0 + 0),y 
56aa : 85 0f __ STA P2 
56ac : c8 __ __ INY
56ad : b1 50 __ LDA (T0 + 0),y 
56af : 85 10 __ STA P3 
56b1 : c8 __ __ INY
56b2 : b1 50 __ LDA (T0 + 0),y 
56b4 : 85 11 __ STA P4 
56b6 : ad da bf LDA $bfda ; (bigfont + 191)
56b9 : 18 __ __ CLC
56ba : 69 ff __ ADC #$ff
56bc : 8d da bf STA $bfda ; (bigfont + 191)
56bf : b0 03 __ BCS $56c4 ; (vdcwin_viewportscroll.s1009 + 0)
.s1008:
56c1 : ce db bf DEC $bfdb ; (bigfont + 192)
.s1009:
56c4 : 18 __ __ CLC
56c5 : a0 09 __ LDY #$09
56c7 : b1 50 __ LDA (T0 + 0),y 
56c9 : 69 ff __ ADC #$ff
56cb : 91 50 __ STA (T0 + 0),y 
56cd : c8 __ __ INY
56ce : b1 50 __ LDA (T0 + 0),y 
56d0 : 69 ff __ ADC #$ff
56d2 : 91 50 __ STA (T0 + 0),y 
56d4 : 20 0d 33 JSR $330d ; (vdcwin_init@proxy + 0)
.s16:
56d7 : a5 53 __ LDA T2 + 0 
56d9 : 29 04 __ AND #$04
56db : f0 58 __ BEQ $5735 ; (vdcwin_viewportscroll.s12 + 0)
.s10:
56dd : 18 __ __ CLC
56de : a5 50 __ LDA T0 + 0 
56e0 : 69 0b __ ADC #$0b
56e2 : 85 15 __ STA P8 
56e4 : a5 51 __ LDA T0 + 1 
56e6 : 69 00 __ ADC #$00
56e8 : 85 16 __ STA P9 
56ea : 20 5e 46 JSR $465e ; (vdcwin_scroll_up.s0 + 0)
56ed : a9 01 __ LDA #$01
56ef : 85 12 __ STA P5 
56f1 : a0 0b __ LDY #$0b
56f3 : b1 50 __ LDA (T0 + 0),y 
56f5 : 85 0f __ STA P2 
56f7 : a0 0d __ LDY #$0d
56f9 : b1 50 __ LDA (T0 + 0),y 
56fb : 85 11 __ STA P4 
56fd : c8 __ __ INY
56fe : b1 50 __ LDA (T0 + 0),y 
5700 : 85 43 __ STA T1 + 0 
5702 : 18 __ __ CLC
5703 : 6d da bf ADC $bfda ; (bigfont + 191)
5706 : 8d da bf STA $bfda ; (bigfont + 191)
5709 : 90 03 __ BCC $570e ; (vdcwin_viewportscroll.s1011 + 0)
.s1010:
570b : ee db bf INC $bfdb ; (bigfont + 192)
.s1011:
570e : 18 __ __ CLC
570f : a0 09 __ LDY #$09
5711 : b1 50 __ LDA (T0 + 0),y 
5713 : 69 01 __ ADC #$01
5715 : 91 50 __ STA (T0 + 0),y 
5717 : c8 __ __ INY
5718 : b1 50 __ LDA (T0 + 0),y 
571a : 69 00 __ ADC #$00
571c : 91 50 __ STA (T0 + 0),y 
571e : a9 dc __ LDA #$dc
5720 : 85 0d __ STA P0 
5722 : a9 bf __ LDA #$bf
5724 : 85 0e __ STA P1 
5726 : a0 0c __ LDY #$0c
5728 : b1 50 __ LDA (T0 + 0),y 
572a : 18 __ __ CLC
572b : 65 43 __ ADC T1 + 0 
572d : 38 __ __ SEC
572e : e9 01 __ SBC #$01
5730 : 85 10 __ STA P3 
5732 : 20 15 33 JSR $3315 ; (vdcwin_init.s0 + 0)
.s12:
5735 : a9 d1 __ LDA #$d1
5737 : 85 16 __ STA P9 
5739 : a9 bf __ LDA #$bf
573b : 85 17 __ STA P10 
573d : 20 44 39 JSR $3944 ; (vdcwin_cpy_viewport.s0 + 0)
.s1001:
5740 : ad cd bf LDA $bfcd ; (bigfont + 178)
5743 : 85 53 __ STA T2 + 0 
5745 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_right: ; vdcwin_scroll_right(struct VDCWin*,u8)->void
.s1000:
5746 : a5 53 __ LDA T8 + 0 
5748 : 8d f1 bf STA $bff1 ; (buffer + 10)
574b : a5 54 __ LDA T8 + 1 
574d : 8d f2 bf STA $bff2 ; (buffer + 11)
.s0:
5750 : a0 02 __ LDY #$02
5752 : b1 16 __ LDA (P9),y ; (win + 0)
5754 : 38 __ __ SEC
5755 : e9 01 __ SBC #$01
5757 : 85 47 __ STA T2 + 0 
5759 : a9 00 __ LDA #$00
575b : 85 46 __ STA T1 + 0 
575d : a0 06 __ LDY #$06
575f : b1 16 __ LDA (P9),y ; (win + 0)
5761 : 85 48 __ STA T3 + 0 
5763 : c8 __ __ INY
5764 : b1 16 __ LDA (P9),y ; (win + 0)
5766 : 85 49 __ STA T3 + 1 
5768 : c8 __ __ INY
5769 : b1 16 __ LDA (P9),y ; (win + 0)
576b : 85 4a __ STA T4 + 0 
576d : c8 __ __ INY
576e : b1 16 __ LDA (P9),y ; (win + 0)
5770 : 4c 91 57 JMP $5791 ; (vdcwin_scroll_right.l1 + 0)
.s5:
5773 : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
5776 : 18 __ __ CLC
5777 : 65 48 __ ADC T3 + 0 
5779 : 85 48 __ STA T3 + 0 
577b : ad 60 6d LDA $6d60 ; (vdc_state + 4)
577e : 65 49 __ ADC T3 + 1 
5780 : 85 49 __ STA T3 + 1 
5782 : 18 __ __ CLC
5783 : a5 4a __ LDA T4 + 0 
5785 : 6d 5f 6d ADC $6d5f ; (vdc_state + 3)
5788 : 85 4a __ STA T4 + 0 
578a : a5 4b __ LDA T4 + 1 
578c : 6d 60 6d ADC $6d60 ; (vdc_state + 4)
578f : e6 46 __ INC T1 + 0 
.l1:
5791 : 85 4b __ STA T4 + 1 
5793 : a5 46 __ LDA T1 + 0 
5795 : a0 03 __ LDY #$03
5797 : d1 16 __ CMP (P9),y ; (win + 0)
5799 : 90 0b __ BCC $57a6 ; (vdcwin_scroll_right.s2 + 0)
.s1001:
579b : ad f1 bf LDA $bff1 ; (buffer + 10)
579e : 85 53 __ STA T8 + 0 
57a0 : ad f2 bf LDA $bff2 ; (buffer + 11)
57a3 : 85 54 __ STA T8 + 1 
57a5 : 60 __ __ RTS
.s2:
57a6 : a5 48 __ LDA T3 + 0 
57a8 : 69 01 __ ADC #$01
57aa : 85 4c __ STA T6 + 0 
57ac : a5 49 __ LDA T3 + 1 
57ae : 69 00 __ ADC #$00
57b0 : 85 4d __ STA T6 + 1 
57b2 : 18 __ __ CLC
57b3 : a5 4a __ LDA T4 + 0 
57b5 : 69 01 __ ADC #$01
57b7 : 85 4e __ STA T7 + 0 
57b9 : a5 4b __ LDA T4 + 1 
57bb : 69 00 __ ADC #$00
57bd : 85 4f __ STA T7 + 1 
57bf : ad 5d 6d LDA $6d5d ; (vdc_state + 1)
57c2 : d0 0c __ BNE $57d0 ; (vdcwin_scroll_right.s7 + 0)
.s9:
57c4 : cc 69 6d CPY $6d69 ; (vdc_state + 13)
57c7 : d0 05 __ BNE $57ce ; (vdcwin_scroll_right.s1003 + 0)
.s1002:
57c9 : a9 ff __ LDA #$ff
57cb : cd 68 6d CMP $6d68 ; (vdc_state + 12)
.s1003:
57ce : 90 4d __ BCC $581d ; (vdcwin_scroll_right.s6 + 0)
.s7:
57d0 : a5 48 __ LDA T3 + 0 
57d2 : 85 11 __ STA P4 
57d4 : a5 49 __ LDA T3 + 1 
57d6 : 85 12 __ STA P5 
57d8 : ad 68 6d LDA $6d68 ; (vdc_state + 12)
57db : 85 53 __ STA T8 + 0 
57dd : 85 0f __ STA P2 
57df : ad 69 6d LDA $6d69 ; (vdc_state + 13)
57e2 : 85 54 __ STA T8 + 1 
57e4 : 85 10 __ STA P3 
57e6 : 20 e2 46 JSR $46e2 ; (vdc_block_copy@proxy + 0)
57e9 : a5 53 __ LDA T8 + 0 
57eb : 85 11 __ STA P4 
57ed : a5 54 __ LDA T8 + 1 
57ef : 85 12 __ STA P5 
57f1 : 20 98 67 JSR $6798 ; (vdc_block_copy@proxy + 0)
57f4 : a5 53 __ LDA T8 + 0 
57f6 : 85 0f __ STA P2 
57f8 : a5 54 __ LDA T8 + 1 
57fa : 85 10 __ STA P3 
57fc : a5 4a __ LDA T4 + 0 
57fe : 85 11 __ STA P4 
5800 : a5 4b __ LDA T4 + 1 
5802 : 85 12 __ STA P5 
5804 : 20 ea 46 JSR $46ea ; (vdc_block_copy.s0 + 0)
5807 : a5 4e __ LDA T7 + 0 
5809 : 85 0f __ STA P2 
580b : a5 4f __ LDA T7 + 1 
580d : 85 10 __ STA P3 
580f : a5 53 __ LDA T8 + 0 
5811 : 85 11 __ STA P4 
5813 : a5 54 __ LDA T8 + 1 
5815 : 85 12 __ STA P5 
5817 : 20 ea 46 JSR $46ea ; (vdc_block_copy.s0 + 0)
581a : 4c 73 57 JMP $5773 ; (vdcwin_scroll_right.s5 + 0)
.s6:
581d : a5 48 __ LDA T3 + 0 
581f : 85 10 __ STA P3 
5821 : a5 49 __ LDA T3 + 1 
5823 : 85 11 __ STA P4 
5825 : 20 c0 15 JSR $15c0 ; (bnk_cpyfromvdc@proxy + 0)
5828 : a5 4c __ LDA T6 + 0 
582a : 85 0f __ STA P2 
582c : a5 4d __ LDA T6 + 1 
582e : 85 10 __ STA P3 
5830 : a5 12 __ LDA P5 
5832 : 85 14 __ STA P7 
5834 : 20 9a 14 JSR $149a ; (bnk_cpytovdc@proxy + 0)
5837 : a5 4a __ LDA T4 + 0 
5839 : 85 10 __ STA P3 
583b : a5 4b __ LDA T4 + 1 
583d : 85 11 __ STA P4 
583f : 20 c0 15 JSR $15c0 ; (bnk_cpyfromvdc@proxy + 0)
5842 : a5 4e __ LDA T7 + 0 
5844 : 85 0f __ STA P2 
5846 : a5 4f __ LDA T7 + 1 
5848 : 85 10 __ STA P3 
584a : 20 9a 14 JSR $149a ; (bnk_cpytovdc@proxy + 0)
584d : 4c 73 57 JMP $5773 ; (vdcwin_scroll_right.s5 + 0)
--------------------------------------------------------------------
vdcwin_scroll_left: ; vdcwin_scroll_left(struct VDCWin*,u8)->void
.s0:
5850 : a0 02 __ LDY #$02
5852 : b1 16 __ LDA (P9),y ; (win + 0)
5854 : 38 __ __ SEC
5855 : e9 01 __ SBC #$01
5857 : 85 47 __ STA T2 + 0 
5859 : a0 06 __ LDY #$06
585b : b1 16 __ LDA (P9),y ; (win + 0)
585d : 85 48 __ STA T3 + 0 
585f : c8 __ __ INY
5860 : b1 16 __ LDA (P9),y ; (win + 0)
5862 : 85 49 __ STA T3 + 1 
5864 : c8 __ __ INY
5865 : b1 16 __ LDA (P9),y ; (win + 0)
5867 : 85 4a __ STA T4 + 0 
5869 : c8 __ __ INY
586a : b1 16 __ LDA (P9),y ; (win + 0)
586c : 85 4b __ STA T4 + 1 
.l62:
586e : ad 00 d6 LDA $d600 
5871 : 29 20 __ AND #$20
5873 : f0 f9 __ BEQ $586e ; (vdcwin_scroll_left.l62 + 0)
.s1:
5875 : a9 00 __ LDA #$00
5877 : 85 46 __ STA T1 + 0 
5879 : f0 22 __ BEQ $589d ; (vdcwin_scroll_left.l4 + 0)
.s8:
587b : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
587e : 18 __ __ CLC
587f : 65 48 __ ADC T3 + 0 
5881 : 85 48 __ STA T3 + 0 
5883 : ad 60 6d LDA $6d60 ; (vdc_state + 4)
5886 : 65 49 __ ADC T3 + 1 
5888 : 85 49 __ STA T3 + 1 
588a : 18 __ __ CLC
588b : a5 4a __ LDA T4 + 0 
588d : 6d 5f 6d ADC $6d5f ; (vdc_state + 3)
5890 : 85 4a __ STA T4 + 0 
5892 : a5 4b __ LDA T4 + 1 
5894 : 6d 60 6d ADC $6d60 ; (vdc_state + 4)
5897 : 85 4b __ STA T4 + 1 
5899 : e6 46 __ INC T1 + 0 
589b : a5 46 __ LDA T1 + 0 
.l4:
589d : a0 03 __ LDY #$03
589f : d1 16 __ CMP (P9),y ; (win + 0)
58a1 : 90 08 __ BCC $58ab ; (vdcwin_scroll_left.s5 + 0)
.l14:
58a3 : ad 00 d6 LDA $d600 
58a6 : 29 20 __ AND #$20
58a8 : d0 f9 __ BNE $58a3 ; (vdcwin_scroll_left.l14 + 0)
.s1001:
58aa : 60 __ __ RTS
.s5:
58ab : a5 48 __ LDA T3 + 0 
58ad : 69 01 __ ADC #$01
58af : 85 10 __ STA P3 
58b1 : 85 11 __ STA P4 
58b3 : a5 49 __ LDA T3 + 1 
58b5 : 69 00 __ ADC #$00
58b7 : 85 12 __ STA P5 
58b9 : 18 __ __ CLC
58ba : a5 4a __ LDA T4 + 0 
58bc : 69 01 __ ADC #$01
58be : 85 4e __ STA T7 + 0 
58c0 : a5 4b __ LDA T4 + 1 
58c2 : 69 00 __ ADC #$00
58c4 : 85 4f __ STA T7 + 1 
58c6 : ad 5d 6d LDA $6d5d ; (vdc_state + 1)
58c9 : d0 0c __ BNE $58d7 ; (vdcwin_scroll_left.s10 + 0)
.s12:
58cb : cc 69 6d CPY $6d69 ; (vdc_state + 13)
58ce : d0 05 __ BNE $58d5 ; (vdcwin_scroll_left.s1003 + 0)
.s1002:
58d0 : a9 ff __ LDA #$ff
58d2 : cd 68 6d CMP $6d68 ; (vdc_state + 12)
.s1003:
58d5 : 90 35 __ BCC $590c ; (vdcwin_scroll_left.s9 + 0)
.s10:
58d7 : ad 68 6d LDA $6d68 ; (vdc_state + 12)
58da : 85 4c __ STA T5 + 0 
58dc : 85 0f __ STA P2 
58de : ad 69 6d LDA $6d69 ; (vdc_state + 13)
58e1 : 85 4d __ STA T5 + 1 
58e3 : 85 10 __ STA P3 
58e5 : 20 e2 46 JSR $46e2 ; (vdc_block_copy@proxy + 0)
58e8 : a5 48 __ LDA T3 + 0 
58ea : 85 0f __ STA P2 
58ec : a5 49 __ LDA T3 + 1 
58ee : 85 10 __ STA P3 
58f0 : 20 8d 67 JSR $678d ; (vdc_block_copy@proxy + 0)
58f3 : a5 4e __ LDA T7 + 0 
58f5 : 85 11 __ STA P4 
58f7 : a5 4f __ LDA T7 + 1 
58f9 : 85 12 __ STA P5 
58fb : 20 98 67 JSR $6798 ; (vdc_block_copy@proxy + 0)
58fe : a5 4a __ LDA T4 + 0 
5900 : 85 0f __ STA P2 
5902 : a5 4b __ LDA T4 + 1 
5904 : 85 10 __ STA P3 
5906 : 20 8d 67 JSR $678d ; (vdc_block_copy@proxy + 0)
5909 : 4c 7b 58 JMP $587b ; (vdcwin_scroll_left.s8 + 0)
.s9:
590c : a5 12 __ LDA P5 
590e : 85 11 __ STA P4 
5910 : 20 c0 15 JSR $15c0 ; (bnk_cpyfromvdc@proxy + 0)
5913 : a5 48 __ LDA T3 + 0 
5915 : 85 0f __ STA P2 
5917 : a5 49 __ LDA T3 + 1 
5919 : 85 10 __ STA P3 
591b : a5 12 __ LDA P5 
591d : 85 14 __ STA P7 
591f : 20 9a 14 JSR $149a ; (bnk_cpytovdc@proxy + 0)
5922 : a5 4e __ LDA T7 + 0 
5924 : 85 10 __ STA P3 
5926 : a5 4f __ LDA T7 + 1 
5928 : 85 11 __ STA P4 
592a : 20 c0 15 JSR $15c0 ; (bnk_cpyfromvdc@proxy + 0)
592d : a5 4a __ LDA T4 + 0 
592f : 85 0f __ STA P2 
5931 : a5 4b __ LDA T4 + 1 
5933 : 85 10 __ STA P3 
5935 : 20 9a 14 JSR $149a ; (bnk_cpytovdc@proxy + 0)
5938 : 4c 7b 58 JMP $587b ; (vdcwin_scroll_left.s8 + 0)
--------------------------------------------------------------------
vdcwin_scroll_down: ; vdcwin_scroll_down(struct VDCWin*,u8)->void
.s0:
593b : ad 5f 6d LDA $6d5f ; (vdc_state + 3)
593e : 85 49 __ STA T3 + 0 
5940 : 85 1b __ STA ACCU + 0 
5942 : ad 60 6d LDA $6d60 ; (vdc_state + 4)
5945 : 85 4a __ STA T3 + 1 
5947 : 85 1c __ STA ACCU + 1 
5949 : a0 03 __ LDY #$03
594b : b1 15 __ LDA (P8),y ; (win + 0)
594d : 20 3e 64 JSR $643e ; (mul16by8 + 0)
5950 : a0 06 __ LDY #$06
5952 : b1 15 __ LDA (P8),y ; (win + 0)
5954 : 18 __ __ CLC
5955 : 65 05 __ ADC WORK + 2 
5957 : 85 4b __ STA T4 + 0 
5959 : c8 __ __ INY
595a : b1 15 __ LDA (P8),y ; (win + 0)
595c : 65 06 __ ADC WORK + 3 
595e : 85 4c __ STA T4 + 1 
5960 : c8 __ __ INY
5961 : b1 15 __ LDA (P8),y ; (win + 0)
5963 : 18 __ __ CLC
5964 : 65 05 __ ADC WORK + 2 
5966 : 85 47 __ STA T2 + 0 
5968 : c8 __ __ INY
5969 : b1 15 __ LDA (P8),y ; (win + 0)
596b : 65 06 __ ADC WORK + 3 
596d : 85 48 __ STA T2 + 1 
596f : a9 00 __ LDA #$00
5971 : 85 46 __ STA T1 + 0 
5973 : a0 02 __ LDY #$02
5975 : b1 15 __ LDA (P8),y ; (win + 0)
5977 : 85 4d __ STA T6 + 0 
5979 : 4c c8 59 JMP $59c8 ; (vdcwin_scroll_down.l1 + 0)
.s2:
597c : 38 __ __ SEC
597d : a5 4b __ LDA T4 + 0 
597f : ed 5f 6d SBC $6d5f ; (vdc_state + 3)
5982 : 85 0f __ STA P2 
5984 : 85 4b __ STA T4 + 0 
5986 : a5 4c __ LDA T4 + 1 
5988 : ed 60 6d SBC $6d60 ; (vdc_state + 4)
598b : 85 10 __ STA P3 
598d : 85 4c __ STA T4 + 1 
598f : 38 __ __ SEC
5990 : a5 0f __ LDA P2 
5992 : e5 49 __ SBC T3 + 0 
5994 : 85 11 __ STA P4 
5996 : a5 10 __ LDA P3 
5998 : e5 4a __ SBC T3 + 1 
599a : 85 12 __ STA P5 
599c : a5 4d __ LDA T6 + 0 
599e : 85 13 __ STA P6 
59a0 : 20 86 67 JSR $6786 ; (vdc_block_copy@proxy + 0)
59a3 : 38 __ __ SEC
59a4 : a5 47 __ LDA T2 + 0 
59a6 : ed 5f 6d SBC $6d5f ; (vdc_state + 3)
59a9 : 85 47 __ STA T2 + 0 
59ab : 85 0f __ STA P2 
59ad : a5 48 __ LDA T2 + 1 
59af : ed 60 6d SBC $6d60 ; (vdc_state + 4)
59b2 : 85 48 __ STA T2 + 1 
59b4 : 85 10 __ STA P3 
59b6 : 38 __ __ SEC
59b7 : a5 0f __ LDA P2 
59b9 : e5 49 __ SBC T3 + 0 
59bb : 85 11 __ STA P4 
59bd : a5 10 __ LDA P3 
59bf : e5 4a __ SBC T3 + 1 
59c1 : 85 12 __ STA P5 
59c3 : 20 ea 46 JSR $46ea ; (vdc_block_copy.s0 + 0)
59c6 : e6 46 __ INC T1 + 0 
.l1:
59c8 : a0 03 __ LDY #$03
59ca : b1 15 __ LDA (P8),y ; (win + 0)
59cc : 38 __ __ SEC
59cd : e9 01 __ SBC #$01
59cf : 90 ab __ BCC $597c ; (vdcwin_scroll_down.s2 + 0)
.s1002:
59d1 : c5 46 __ CMP T1 + 0 
59d3 : 90 02 __ BCC $59d7 ; (vdcwin_scroll_down.s1001 + 0)
.s1004:
59d5 : d0 a5 __ BNE $597c ; (vdcwin_scroll_down.s2 + 0)
.s1001:
59d7 : 60 __ __ RTS
--------------------------------------------------------------------
scroll_fullscreen_smooth: ; scroll_fullscreen_smooth(u8)->void
.s1000:
59d8 : a5 53 __ LDA T0 + 0 
59da : 8d cf bf STA $bfcf ; (bigfont + 180)
.s0:
59dd : ad ff bf LDA $bfff ; (sstack + 8)
59e0 : 85 53 __ STA T0 + 0 
59e2 : 8d fc bf STA $bffc ; (sstack + 5)
59e5 : a9 00 __ LDA #$00
59e7 : 8d fd bf STA $bffd ; (sstack + 6)
59ea : a9 01 __ LDA #$01
59ec : 8d fe bf STA $bffe ; (sstack + 7)
59ef : 20 46 54 JSR $5446 ; (screen_switch.s1000 + 0)
59f2 : a9 7f __ LDA #$7f
59f4 : 8d d0 bf STA $bfd0 ; (bigfont + 181)
59f7 : a9 00 __ LDA #$00
59f9 : 8d d1 bf STA $bfd1 ; (bigfont + 182)
59fc : a9 40 __ LDA #$40
59fe : 8d d2 bf STA $bfd2 ; (bigfont + 183)
5a01 : a5 53 __ LDA T0 + 0 
5a03 : 0a __ __ ASL
5a04 : aa __ __ TAX
5a05 : bd fa 68 LDA $68fa,x ; (screenset + 0)
5a08 : 8d d3 bf STA $bfd3 ; (bigfont + 184)
5a0b : bd fb 68 LDA $68fb,x ; (screenset + 1)
5a0e : 8d d4 bf STA $bfd4 ; (bigfont + 185)
5a11 : ad 5e 6d LDA $6d5e ; (vdc_state + 2)
5a14 : 8d f7 bf STA $bff7 ; (sstack + 0)
5a17 : a9 d0 __ LDA #$d0
5a19 : 85 17 __ STA P10 
5a1b : a9 bf __ LDA #$bf
5a1d : 85 18 __ STA P11 
5a1f : 20 e9 5a JSR $5ae9 ; (vdc_softscroll_init.s1000 + 0)
5a22 : a5 1b __ LDA ACCU + 0 
5a24 : d0 17 __ BNE $5a3d ; (scroll_fullscreen_smooth.l4 + 0)
.s3:
5a26 : a9 01 __ LDA #$01
5a28 : 8d fd bf STA $bffd ; (sstack + 6)
5a2b : 8d fe bf STA $bffe ; (sstack + 7)
5a2e : ad ff bf LDA $bfff ; (sstack + 8)
5a31 : 8d fc bf STA $bffc ; (sstack + 5)
5a34 : 20 46 54 JSR $5446 ; (screen_switch.s1000 + 0)
.s1001:
5a37 : ad cf bf LDA $bfcf ; (bigfont + 180)
5a3a : 85 53 __ STA T0 + 0 
5a3c : 60 __ __ RTS
.l4:
5a3d : 20 9d 2b JSR $2b9d ; (getch.s0 + 0)
5a40 : 85 53 __ STA T0 + 0 
5a42 : c9 57 __ CMP #$57
5a44 : f0 04 __ BEQ $5a4a ; (scroll_fullscreen_smooth.s6 + 0)
.s9:
5a46 : c9 91 __ CMP #$91
5a48 : d0 10 __ BNE $5a5a ; (scroll_fullscreen_smooth.s8 + 0)
.s6:
5a4a : a9 d0 __ LDA #$d0
5a4c : 85 0d __ STA P0 
5a4e : a9 bf __ LDA #$bf
5a50 : 85 0e __ STA P1 
5a52 : 20 92 5c JSR $5c92 ; (vdc_softscroll_up.l236 + 0)
5a55 : a5 53 __ LDA T0 + 0 
5a57 : 4c 5e 5a JMP $5a5e ; (scroll_fullscreen_smooth.s13 + 0)
.s8:
5a5a : c9 53 __ CMP #$53
5a5c : f0 04 __ BEQ $5a62 ; (scroll_fullscreen_smooth.s10 + 0)
.s13:
5a5e : c9 11 __ CMP #$11
5a60 : d0 0b __ BNE $5a6d ; (scroll_fullscreen_smooth.s12 + 0)
.s10:
5a62 : a9 d0 __ LDA #$d0
5a64 : 85 0d __ STA P0 
5a66 : a9 bf __ LDA #$bf
5a68 : 85 0e __ STA P1 
5a6a : 20 65 5d JSR $5d65 ; (vdc_softscroll_down.l211 + 0)
.s12:
5a6d : a5 53 __ LDA T0 + 0 
5a6f : c9 41 __ CMP #$41
5a71 : f0 04 __ BEQ $5a77 ; (scroll_fullscreen_smooth.s14 + 0)
.s17:
5a73 : c9 9d __ CMP #$9d
5a75 : d0 0d __ BNE $5a84 ; (scroll_fullscreen_smooth.s16 + 0)
.s14:
5a77 : a9 d0 __ LDA #$d0
5a79 : 85 0d __ STA P0 
5a7b : a9 bf __ LDA #$bf
5a7d : 85 0e __ STA P1 
5a7f : 20 3f 5e JSR $5e3f ; (vdc_softscroll_left.s0 + 0)
5a82 : a5 53 __ LDA T0 + 0 
.s16:
5a84 : c9 44 __ CMP #$44
5a86 : f0 04 __ BEQ $5a8c ; (scroll_fullscreen_smooth.s18 + 0)
.s21:
5a88 : c9 1d __ CMP #$1d
5a8a : d0 0e __ BNE $5a9a ; (scroll_fullscreen_smooth.s20 + 0)
.s18:
5a8c : a9 d0 __ LDA #$d0
5a8e : 85 0d __ STA P0 
5a90 : a9 bf __ LDA #$bf
5a92 : 85 0e __ STA P1 
5a94 : 20 01 5f JSR $5f01 ; (vdc_softscroll_right.s0 + 0)
5a97 : 4c 9e 5a JMP $5a9e ; (scroll_fullscreen_smooth.s22 + 0)
.s20:
5a9a : c9 1b __ CMP #$1b
5a9c : f0 06 __ BEQ $5aa4 ; (scroll_fullscreen_smooth.s5 + 0)
.s22:
5a9e : a5 53 __ LDA T0 + 0 
5aa0 : c9 03 __ CMP #$03
5aa2 : d0 99 __ BNE $5a3d ; (scroll_fullscreen_smooth.l4 + 0)
.s5:
5aa4 : ad 5e 6d LDA $6d5e ; (vdc_state + 2)
5aa7 : 85 53 __ STA T0 + 0 
5aa9 : 20 65 2a JSR $2a65 ; (vdc_cls.s0 + 0)
5aac : a9 1b __ LDA #$1b
5aae : 8d 00 d6 STA $d600 
.l131:
5ab1 : 2c 00 d6 BIT $d600 
5ab4 : 10 fb __ BPL $5ab1 ; (scroll_fullscreen_smooth.l131 + 0)
.s28:
5ab6 : a9 00 __ LDA #$00
5ab8 : 8d 01 d6 STA $d601 
5abb : a9 18 __ LDA #$18
5abd : 8d 00 d6 STA $d600 
5ac0 : ac d9 bf LDY $bfd9 ; (bigfont + 190)
.l133:
5ac3 : 2c 00 d6 BIT $d600 
5ac6 : 10 fb __ BPL $5ac3 ; (scroll_fullscreen_smooth.l133 + 0)
.s33:
5ac8 : 8c 01 d6 STY $d601 
5acb : a9 19 __ LDA #$19
5acd : 8d 00 d6 STA $d600 
5ad0 : ad dd bf LDA $bfdd ; (bigfont + 194)
5ad3 : 18 __ __ CLC
5ad4 : 6d da bf ADC $bfda ; (bigfont + 191)
.l135:
5ad7 : 2c 00 d6 BIT $d600 
5ada : 10 fb __ BPL $5ad7 ; (scroll_fullscreen_smooth.l135 + 0)
.s38:
5adc : 8d 01 d6 STA $d601 
5adf : a5 53 __ LDA T0 + 0 
5ae1 : 85 16 __ STA P9 
5ae3 : 20 05 2c JSR $2c05 ; (vdc_set_mode.s1000 + 0)
5ae6 : 4c 26 5a JMP $5a26 ; (scroll_fullscreen_smooth.s3 + 0)
--------------------------------------------------------------------
vdc_softscroll_init: ; vdc_softscroll_init(struct VDCSoftScrollSettings*,u8)->u8
.s1000:
5ae9 : a2 03 __ LDX #$03
5aeb : b5 53 __ LDA T3 + 0,x 
5aed : 9d ef bf STA $bfef,x ; (vp_fill + 30)
5af0 : ca __ __ DEX
5af1 : 10 f8 __ BPL $5aeb ; (vdc_softscroll_init.s1000 + 2)
.s0:
5af3 : a0 04 __ LDY #$04
5af5 : b1 17 __ LDA (P10),y ; (settings + 0)
5af7 : 85 1b __ STA ACCU + 0 
5af9 : a9 00 __ LDA #$00
5afb : 85 1c __ STA ACCU + 1 
5afd : 88 __ __ DEY
5afe : b1 17 __ LDA (P10),y ; (settings + 0)
5b00 : 85 50 __ STA T2 + 0 
5b02 : 20 3e 64 JSR $643e ; (mul16by8 + 0)
5b05 : a5 05 __ LDA WORK + 2 
5b07 : 85 53 __ STA T3 + 0 
5b09 : 0a __ __ ASL
5b0a : aa __ __ TAX
5b0b : a5 06 __ LDA WORK + 3 
5b0d : 85 54 __ STA T3 + 1 
5b0f : 2a __ __ ROL
5b10 : a8 __ __ TAY
5b11 : 8a __ __ TXA
5b12 : 18 __ __ CLC
5b13 : 69 30 __ ADC #$30
5b15 : 85 55 __ STA T4 + 0 
5b17 : 90 01 __ BCC $5b1a ; (vdc_softscroll_init.s1027 + 0)
.s1026:
5b19 : c8 __ __ INY
.s1027:
5b1a : 84 56 __ STY T4 + 1 
5b1c : a9 20 __ LDA #$20
5b1e : c5 56 __ CMP T4 + 1 
5b20 : d0 04 __ BNE $5b26 ; (vdc_softscroll_init.s1025 + 0)
.s1024:
5b22 : a9 00 __ LDA #$00
5b24 : c5 55 __ CMP T4 + 0 
.s1025:
5b26 : b0 08 __ BCS $5b30 ; (vdc_softscroll_init.s4 + 0)
.s5:
5b28 : ad 5d 6d LDA $6d5d ; (vdc_state + 1)
5b2b : d0 03 __ BNE $5b30 ; (vdc_softscroll_init.s4 + 0)
5b2d : 4c 8e 5c JMP $5c8e ; (vdc_softscroll_init.s1 + 0)
.s4:
5b30 : a9 e0 __ LDA #$e0
5b32 : c5 56 __ CMP T4 + 1 
5b34 : d0 04 __ BNE $5b3a ; (vdc_softscroll_init.s1023 + 0)
.s1022:
5b36 : a9 00 __ LDA #$00
5b38 : c5 55 __ CMP T4 + 0 
.s1023:
5b3a : b0 03 __ BCS $5b3f ; (vdc_softscroll_init.s3 + 0)
5b3c : 4c 8e 5c JMP $5c8e ; (vdc_softscroll_init.s1 + 0)
.s3:
5b3f : ad f7 bf LDA $bff7 ; (sstack + 0)
5b42 : 85 16 __ STA P9 
5b44 : 20 05 2c JSR $2c05 ; (vdc_set_mode.s1000 + 0)
5b47 : a9 00 __ LDA #$00
5b49 : 8d 64 6d STA $6d64 ; (vdc_state + 8)
5b4c : 8d 6c 6d STA $6d6c ; (vdc_state + 16)
5b4f : 8d 6d 6d STA $6d6d ; (vdc_state + 17)
5b52 : 8d 6e 6d STA $6d6e ; (vdc_state + 18)
5b55 : a9 20 __ LDA #$20
5b57 : 8d 65 6d STA $6d65 ; (vdc_state + 9)
5b5a : a9 10 __ LDA #$10
5b5c : 8d 6f 6d STA $6d6f ; (vdc_state + 19)
5b5f : a5 53 __ LDA T3 + 0 
5b61 : 8d 66 6d STA $6d66 ; (vdc_state + 10)
5b64 : 18 __ __ CLC
5b65 : a5 54 __ LDA T3 + 1 
5b67 : 69 20 __ ADC #$20
5b69 : 85 56 __ STA T4 + 1 
5b6b : 8d 67 6d STA $6d67 ; (vdc_state + 11)
5b6e : 38 __ __ SEC
5b6f : a5 50 __ LDA T2 + 0 
5b71 : ed 5f 6d SBC $6d5f ; (vdc_state + 3)
5b74 : 85 50 __ STA T2 + 0 
5b76 : 8d 74 6d STA $6d74 ; (vdc_state + 24)
5b79 : 20 8b 2d JSR $2d8b ; (vdc_set_multab.s0 + 0)
5b7c : 20 65 2a JSR $2a65 ; (vdc_cls.s0 + 0)
5b7f : a9 1c __ LDA #$1c
5b81 : 8d 00 d6 STA $d600 
.l290:
5b84 : 2c 00 d6 BIT $d600 
5b87 : 10 fb __ BPL $5b84 ; (vdc_softscroll_init.l290 + 0)
.s13:
5b89 : ad 01 d6 LDA $d601 
5b8c : 29 10 __ AND #$10
5b8e : a2 1c __ LDX #$1c
5b90 : 8e 00 d6 STX $d600 
.l292:
5b93 : 2c 00 d6 BIT $d600 
5b96 : 10 fb __ BPL $5b93 ; (vdc_softscroll_init.l292 + 0)
.s19:
5b98 : 8d 01 d6 STA $d601 
5b9b : 20 db 2d JSR $2ddb ; (vdc_restore_charsets.s0 + 0)
5b9e : a9 0c __ LDA #$0c
5ba0 : 8d 00 d6 STA $d600 
.l294:
5ba3 : 2c 00 d6 BIT $d600 
5ba6 : 10 fb __ BPL $5ba3 ; (vdc_softscroll_init.l294 + 0)
.s25:
5ba8 : a9 20 __ LDA #$20
5baa : 8d 01 d6 STA $d601 
5bad : a9 0d __ LDA #$0d
5baf : 8d 00 d6 STA $d600 
.l296:
5bb2 : 2c 00 d6 BIT $d600 
5bb5 : 10 fb __ BPL $5bb2 ; (vdc_softscroll_init.l296 + 0)
.s30:
5bb7 : a9 00 __ LDA #$00
5bb9 : 8d 01 d6 STA $d601 
5bbc : a9 14 __ LDA #$14
5bbe : 8d 00 d6 STA $d600 
.l298:
5bc1 : 2c 00 d6 BIT $d600 
5bc4 : 10 fb __ BPL $5bc1 ; (vdc_softscroll_init.l298 + 0)
.s35:
5bc6 : a5 56 __ LDA T4 + 1 
5bc8 : 8d 01 d6 STA $d601 
5bcb : a9 15 __ LDA #$15
5bcd : 8d 00 d6 STA $d600 
.l300:
5bd0 : 2c 00 d6 BIT $d600 
5bd3 : 10 fb __ BPL $5bd0 ; (vdc_softscroll_init.l300 + 0)
.s40:
5bd5 : a5 53 __ LDA T3 + 0 
5bd7 : 8d 01 d6 STA $d601 
5bda : a9 1b __ LDA #$1b
5bdc : 8d 00 d6 STA $d600 
.l302:
5bdf : 2c 00 d6 BIT $d600 
5be2 : 10 fb __ BPL $5bdf ; (vdc_softscroll_init.l302 + 0)
.s45:
5be4 : a5 50 __ LDA T2 + 0 
5be6 : 8d 01 d6 STA $d601 
5be9 : a5 53 __ LDA T3 + 0 
5beb : 85 14 __ STA P7 
5bed : a9 20 __ LDA #$20
5bef : 85 10 __ STA P3 
5bf1 : a5 54 __ LDA T3 + 1 
5bf3 : 85 15 __ STA P8 
5bf5 : a0 00 __ LDY #$00
5bf7 : 84 0f __ STY P2 
5bf9 : b1 17 __ LDA (P10),y ; (settings + 0)
5bfb : 85 11 __ STA P4 
5bfd : c8 __ __ INY
5bfe : b1 17 __ LDA (P10),y ; (settings + 0)
5c00 : 85 50 __ STA T2 + 0 
5c02 : 85 12 __ STA P5 
5c04 : c8 __ __ INY
5c05 : b1 17 __ LDA (P10),y ; (settings + 0)
5c07 : 85 51 __ STA T2 + 1 
5c09 : 85 13 __ STA P6 
5c0b : 20 aa 14 JSR $14aa ; (bnk_cpytovdc.s0 + 0)
5c0e : a5 56 __ LDA T4 + 1 
5c10 : 85 10 __ STA P3 
5c12 : a5 14 __ LDA P7 
5c14 : 85 0f __ STA P2 
5c16 : 18 __ __ CLC
5c17 : 65 50 __ ADC T2 + 0 
5c19 : aa __ __ TAX
5c1a : a5 54 __ LDA T3 + 1 
5c1c : 85 15 __ STA P8 
5c1e : 65 51 __ ADC T2 + 1 
5c20 : a8 __ __ TAY
5c21 : 8a __ __ TXA
5c22 : 18 __ __ CLC
5c23 : 69 30 __ ADC #$30
5c25 : 85 12 __ STA P5 
5c27 : 90 01 __ BCC $5c2a ; (vdc_softscroll_init.s1029 + 0)
.s1028:
5c29 : c8 __ __ INY
.s1029:
5c2a : 84 13 __ STY P6 
5c2c : 20 aa 14 JSR $14aa ; (bnk_cpytovdc.s0 + 0)
5c2f : a9 00 __ LDA #$00
5c31 : a0 05 __ LDY #$05
5c33 : 91 17 __ STA (P10),y ; (settings + 0)
5c35 : c8 __ __ INY
5c36 : 91 17 __ STA (P10),y ; (settings + 0)
5c38 : c8 __ __ INY
5c39 : 91 17 __ STA (P10),y ; (settings + 0)
5c3b : c8 __ __ INY
5c3c : 91 17 __ STA (P10),y ; (settings + 0)
5c3e : a9 18 __ LDA #$18
5c40 : 8d 00 d6 STA $d600 
.l304:
5c43 : 2c 00 d6 BIT $d600 
5c46 : 10 fb __ BPL $5c43 ; (vdc_softscroll_init.l304 + 0)
.s50:
5c48 : ad 01 d6 LDA $d601 
5c4b : 29 f0 __ AND #$f0
5c4d : a0 09 __ LDY #$09
5c4f : 91 17 __ STA (P10),y ; (settings + 0)
5c51 : a2 19 __ LDX #$19
5c53 : 8e 00 d6 STX $d600 
.l306:
5c56 : 2c 00 d6 BIT $d600 
5c59 : 10 fb __ BPL $5c56 ; (vdc_softscroll_init.l306 + 0)
.s57:
5c5b : ad 01 d6 LDA $d601 
5c5e : 29 0f __ AND #$0f
5c60 : a0 0d __ LDY #$0d
5c62 : 91 17 __ STA (P10),y ; (settings + 0)
5c64 : 8e 00 d6 STX $d600 
.l308:
5c67 : 2c 00 d6 BIT $d600 
5c6a : 10 fb __ BPL $5c67 ; (vdc_softscroll_init.l308 + 0)
.s64:
5c6c : a9 00 __ LDA #$00
5c6e : ae 01 d6 LDX $d601 
5c71 : a0 0b __ LDY #$0b
5c73 : 91 17 __ STA (P10),y ; (settings + 0)
5c75 : c8 __ __ INY
5c76 : 91 17 __ STA (P10),y ; (settings + 0)
5c78 : 8a __ __ TXA
5c79 : 29 f0 __ AND #$f0
5c7b : a0 0a __ LDY #$0a
5c7d : 91 17 __ STA (P10),y ; (settings + 0)
5c7f : a9 01 __ LDA #$01
.s1001:
5c81 : 85 1b __ STA ACCU + 0 
5c83 : a2 03 __ LDX #$03
5c85 : bd ef bf LDA $bfef,x ; (vp_fill + 30)
5c88 : 95 53 __ STA T3 + 0,x 
5c8a : ca __ __ DEX
5c8b : 10 f8 __ BPL $5c85 ; (vdc_softscroll_init.s1001 + 4)
5c8d : 60 __ __ RTS
.s1:
5c8e : a9 00 __ LDA #$00
5c90 : 90 ef __ BCC $5c81 ; (vdc_softscroll_init.s1001 + 0)
--------------------------------------------------------------------
vdc_softscroll_up: ; vdc_softscroll_up(struct VDCSoftScrollSettings*,u8)->void
.l236:
5c92 : ad 00 d6 LDA $d600 
5c95 : 29 20 __ AND #$20
5c97 : f0 f9 __ BEQ $5c92 ; (vdc_softscroll_up.l236 + 0)
.l6:
5c99 : ad 00 d6 LDA $d600 
5c9c : 29 20 __ AND #$20
5c9e : d0 f9 __ BNE $5c99 ; (vdc_softscroll_up.l6 + 0)
.s1:
5ca0 : a0 07 __ LDY #$07
5ca2 : b1 0d __ LDA (P0),y ; (settings + 0)
5ca4 : c9 02 __ CMP #$02
5ca6 : 90 03 __ BCC $5cab ; (vdc_softscroll_up.s9 + 0)
5ca8 : 4c 4d 5d JMP $5d4d ; (vdc_softscroll_up.s8 + 0)
.s9:
5cab : a0 0c __ LDY #$0c
5cad : b1 0d __ LDA (P0),y ; (settings + 0)
5caf : d0 01 __ BNE $5cb2 ; (vdc_softscroll_up.s16 + 0)
.s1001:
5cb1 : 60 __ __ RTS
.s16:
5cb2 : aa __ __ TAX
5cb3 : a9 06 __ LDA #$06
5cb5 : a0 07 __ LDY #$07
5cb7 : 91 0d __ STA (P0),y ; (settings + 0)
5cb9 : ca __ __ DEX
5cba : 8a __ __ TXA
5cbb : a0 0c __ LDY #$0c
5cbd : 91 0d __ STA (P0),y ; (settings + 0)
5cbf : a0 03 __ LDY #$03
5cc1 : b1 0d __ LDA (P0),y ; (settings + 0)
5cc3 : 85 1b __ STA ACCU + 0 
5cc5 : 38 __ __ SEC
5cc6 : a0 05 __ LDY #$05
5cc8 : b1 0d __ LDA (P0),y ; (settings + 0)
5cca : e5 1b __ SBC ACCU + 0 
5ccc : 85 43 __ STA T3 + 0 
5cce : 91 0d __ STA (P0),y ; (settings + 0)
5cd0 : c8 __ __ INY
5cd1 : b1 0d __ LDA (P0),y ; (settings + 0)
5cd3 : e9 00 __ SBC #$00
5cd5 : 85 44 __ STA T3 + 1 
5cd7 : 91 0d __ STA (P0),y ; (settings + 0)
.l242:
5cd9 : ad 00 d6 LDA $d600 
5cdc : 29 20 __ AND #$20
5cde : d0 f9 __ BNE $5cd9 ; (vdc_softscroll_up.l242 + 0)
.s19:
5ce0 : a0 07 __ LDY #$07
5ce2 : b1 0d __ LDA (P0),y ; (settings + 0)
5ce4 : aa __ __ TAX
5ce5 : a0 09 __ LDY #$09
5ce7 : b1 0d __ LDA (P0),y ; (settings + 0)
5ce9 : 85 1b __ STA ACCU + 0 
5ceb : a9 18 __ LDA #$18
5ced : 8d 00 d6 STA $d600 
5cf0 : 8a __ __ TXA
5cf1 : 18 __ __ CLC
5cf2 : 65 1b __ ADC ACCU + 0 
.l244:
5cf4 : 2c 00 d6 BIT $d600 
5cf7 : 10 fb __ BPL $5cf4 ; (vdc_softscroll_up.l244 + 0)
.s26:
5cf9 : 8d 01 d6 STA $d601 
5cfc : ad 66 6d LDA $6d66 ; (vdc_state + 10)
5cff : 18 __ __ CLC
5d00 : 65 43 __ ADC T3 + 0 
5d02 : aa __ __ TAX
5d03 : ad 67 6d LDA $6d67 ; (vdc_state + 11)
5d06 : 65 44 __ ADC T3 + 1 
5d08 : a8 __ __ TAY
5d09 : ad 64 6d LDA $6d64 ; (vdc_state + 8)
5d0c : 18 __ __ CLC
5d0d : 65 43 __ ADC T3 + 0 
5d0f : 85 43 __ STA T3 + 0 
5d11 : a9 0c __ LDA #$0c
5d13 : 8d 00 d6 STA $d600 
5d16 : ad 65 6d LDA $6d65 ; (vdc_state + 9)
5d19 : 65 44 __ ADC T3 + 1 
.l246:
5d1b : 2c 00 d6 BIT $d600 
5d1e : 10 fb __ BPL $5d1b ; (vdc_softscroll_up.l246 + 0)
.s32:
5d20 : 8d 01 d6 STA $d601 
5d23 : a9 0d __ LDA #$0d
5d25 : 8d 00 d6 STA $d600 
.l248:
5d28 : 2c 00 d6 BIT $d600 
5d2b : 10 fb __ BPL $5d28 ; (vdc_softscroll_up.l248 + 0)
.s37:
5d2d : a5 43 __ LDA T3 + 0 
5d2f : 8d 01 d6 STA $d601 
5d32 : a9 14 __ LDA #$14
5d34 : 8d 00 d6 STA $d600 
.l250:
5d37 : 2c 00 d6 BIT $d600 
5d3a : 10 fb __ BPL $5d37 ; (vdc_softscroll_up.l250 + 0)
.s42:
5d3c : 8c 01 d6 STY $d601 
5d3f : a9 15 __ LDA #$15
5d41 : 8d 00 d6 STA $d600 
.l239:
5d44 : 2c 00 d6 BIT $d600 
5d47 : 10 fb __ BPL $5d44 ; (vdc_softscroll_up.l239 + 0)
.s427:
5d49 : 8e 01 d6 STX $d601 
5d4c : 60 __ __ RTS
.s8:
5d4d : e9 02 __ SBC #$02
5d4f : 91 0d __ STA (P0),y ; (settings + 0)
5d51 : aa __ __ TAX
5d52 : a0 09 __ LDY #$09
5d54 : b1 0d __ LDA (P0),y ; (settings + 0)
5d56 : 85 1b __ STA ACCU + 0 
5d58 : a9 18 __ LDA #$18
5d5a : 8d 00 d6 STA $d600 
5d5d : 8a __ __ TXA
5d5e : 18 __ __ CLC
5d5f : 65 1b __ ADC ACCU + 0 
5d61 : aa __ __ TAX
5d62 : 4c 44 5d JMP $5d44 ; (vdc_softscroll_up.l239 + 0)
--------------------------------------------------------------------
vdc_softscroll_down: ; vdc_softscroll_down(struct VDCSoftScrollSettings*,u8)->void
.l211:
5d65 : ad 00 d6 LDA $d600 
5d68 : 29 20 __ AND #$20
5d6a : f0 f9 __ BEQ $5d65 ; (vdc_softscroll_down.l211 + 0)
.l6:
5d6c : ad 00 d6 LDA $d600 
5d6f : 29 20 __ AND #$20
5d71 : d0 f9 __ BNE $5d6c ; (vdc_softscroll_down.l6 + 0)
.s1:
5d73 : a0 07 __ LDY #$07
5d75 : b1 0d __ LDA (P0),y ; (settings + 0)
5d77 : aa __ __ TAX
5d78 : 18 __ __ CLC
5d79 : 69 02 __ ADC #$02
5d7b : 91 0d __ STA (P0),y ; (settings + 0)
5d7d : c9 07 __ CMP #$07
5d7f : b0 13 __ BCS $5d94 ; (vdc_softscroll_down.s8 + 0)
.s9:
5d81 : a0 09 __ LDY #$09
5d83 : 71 0d __ ADC (P0),y ; (settings + 0)
5d85 : aa __ __ TAX
5d86 : a9 18 __ LDA #$18
.s1018:
5d88 : 8d 00 d6 STA $d600 
.l223:
5d8b : 2c 00 d6 BIT $d600 
5d8e : 10 fb __ BPL $5d8b ; (vdc_softscroll_down.l223 + 0)
.s384:
5d90 : 8e 01 d6 STX $d601 
.s1001:
5d93 : 60 __ __ RTS
.s8:
5d94 : a0 04 __ LDY #$04
5d96 : b1 0d __ LDA (P0),y ; (settings + 0)
5d98 : ed 61 6d SBC $6d61 ; (vdc_state + 5)
5d9b : a8 __ __ TAY
5d9c : a9 00 __ LDA #$00
5d9e : ed 62 6d SBC $6d62 ; (vdc_state + 6)
5da1 : 85 44 __ STA T4 + 1 
5da3 : 98 __ __ TYA
5da4 : 38 __ __ SEC
5da5 : e9 01 __ SBC #$01
5da7 : 85 43 __ STA T4 + 0 
5da9 : a0 0c __ LDY #$0c
5dab : b1 0d __ LDA (P0),y ; (settings + 0)
5dad : 85 1b __ STA ACCU + 0 
5daf : a5 44 __ LDA T4 + 1 
5db1 : e9 00 __ SBC #$00
5db3 : d0 0c __ BNE $5dc1 ; (vdc_softscroll_down.s11 + 0)
.s1014:
5db5 : a5 1b __ LDA ACCU + 0 
5db7 : c5 43 __ CMP T4 + 0 
5db9 : 90 06 __ BCC $5dc1 ; (vdc_softscroll_down.s11 + 0)
.s12:
5dbb : 8a __ __ TXA
5dbc : a0 07 __ LDY #$07
5dbe : 91 0d __ STA (P0),y ; (settings + 0)
5dc0 : 60 __ __ RTS
.s11:
5dc1 : a9 00 __ LDA #$00
5dc3 : a0 07 __ LDY #$07
5dc5 : 91 0d __ STA (P0),y ; (settings + 0)
5dc7 : 18 __ __ CLC
5dc8 : a5 1b __ LDA ACCU + 0 
5dca : 69 01 __ ADC #$01
5dcc : a0 0c __ LDY #$0c
5dce : 91 0d __ STA (P0),y ; (settings + 0)
5dd0 : a0 03 __ LDY #$03
5dd2 : b1 0d __ LDA (P0),y ; (settings + 0)
5dd4 : 18 __ __ CLC
5dd5 : a0 05 __ LDY #$05
5dd7 : 71 0d __ ADC (P0),y ; (settings + 0)
5dd9 : 85 43 __ STA T4 + 0 
5ddb : 91 0d __ STA (P0),y ; (settings + 0)
5ddd : c8 __ __ INY
5dde : b1 0d __ LDA (P0),y ; (settings + 0)
5de0 : 69 00 __ ADC #$00
5de2 : 85 44 __ STA T4 + 1 
5de4 : 91 0d __ STA (P0),y ; (settings + 0)
5de6 : a0 09 __ LDY #$09
5de8 : b1 0d __ LDA (P0),y ; (settings + 0)
5dea : a2 18 __ LDX #$18
5dec : 8e 00 d6 STX $d600 
.l215:
5def : 2c 00 d6 BIT $d600 
5df2 : 10 fb __ BPL $5def ; (vdc_softscroll_down.l215 + 0)
.s18:
5df4 : 8d 01 d6 STA $d601 
5df7 : ad 66 6d LDA $6d66 ; (vdc_state + 10)
5dfa : 18 __ __ CLC
5dfb : 65 43 __ ADC T4 + 0 
5dfd : aa __ __ TAX
5dfe : ad 67 6d LDA $6d67 ; (vdc_state + 11)
5e01 : 65 44 __ ADC T4 + 1 
5e03 : a8 __ __ TAY
5e04 : ad 64 6d LDA $6d64 ; (vdc_state + 8)
5e07 : 18 __ __ CLC
5e08 : 65 43 __ ADC T4 + 0 
5e0a : 85 43 __ STA T4 + 0 
5e0c : a9 0c __ LDA #$0c
5e0e : 8d 00 d6 STA $d600 
5e11 : ad 65 6d LDA $6d65 ; (vdc_state + 9)
5e14 : 65 44 __ ADC T4 + 1 
.l217:
5e16 : 2c 00 d6 BIT $d600 
5e19 : 10 fb __ BPL $5e16 ; (vdc_softscroll_down.l217 + 0)
.s24:
5e1b : 8d 01 d6 STA $d601 
5e1e : a9 0d __ LDA #$0d
5e20 : 8d 00 d6 STA $d600 
.l219:
5e23 : 2c 00 d6 BIT $d600 
5e26 : 10 fb __ BPL $5e23 ; (vdc_softscroll_down.l219 + 0)
.s29:
5e28 : a5 43 __ LDA T4 + 0 
5e2a : 8d 01 d6 STA $d601 
5e2d : a9 14 __ LDA #$14
5e2f : 8d 00 d6 STA $d600 
.l221:
5e32 : 2c 00 d6 BIT $d600 
5e35 : 10 fb __ BPL $5e32 ; (vdc_softscroll_down.l221 + 0)
.s34:
5e37 : 8c 01 d6 STY $d601 
5e3a : a9 15 __ LDA #$15
5e3c : 4c 88 5d JMP $5d88 ; (vdc_softscroll_down.s1018 + 0)
--------------------------------------------------------------------
vdc_softscroll_left: ; vdc_softscroll_left(struct VDCSoftScrollSettings*,u8)->void
.s0:
5e3f : 18 __ __ CLC
5e40 : a0 08 __ LDY #$08
5e42 : b1 0d __ LDA (P0),y ; (settings + 0)
5e44 : 69 02 __ ADC #$02
5e46 : 91 0d __ STA (P0),y ; (settings + 0)
5e48 : c9 07 __ CMP #$07
5e4a : 90 10 __ BCC $5e5c ; (vdc_softscroll_left.s1019 + 0)
.s1:
5e4c : a0 0d __ LDY #$0d
5e4e : b1 0d __ LDA (P0),y ; (settings + 0)
5e50 : aa __ __ TAX
5e51 : a0 0b __ LDY #$0b
5e53 : b1 0d __ LDA (P0),y ; (settings + 0)
5e55 : d0 18 __ BNE $5e6f ; (vdc_softscroll_left.s4 + 0)
.s5:
5e57 : 8a __ __ TXA
5e58 : a0 08 __ LDY #$08
5e5a : 91 0d __ STA (P0),y ; (settings + 0)
.s1019:
5e5c : 18 __ __ CLC
5e5d : a0 0a __ LDY #$0a
5e5f : 71 0d __ ADC (P0),y ; (settings + 0)
.s1018:
5e61 : a2 19 __ LDX #$19
5e63 : 8e 00 d6 STX $d600 
.l277:
5e66 : 2c 00 d6 BIT $d600 
5e69 : 10 fb __ BPL $5e66 ; (vdc_softscroll_left.l277 + 0)
.s479:
5e6b : 8d 01 d6 STA $d601 
.s1001:
5e6e : 60 __ __ RTS
.s4:
5e6f : 85 1b __ STA ACCU + 0 
5e71 : 8a __ __ TXA
5e72 : 29 01 __ AND #$01
5e74 : a0 08 __ LDY #$08
5e76 : 91 0d __ STA (P0),y ; (settings + 0)
5e78 : 18 __ __ CLC
5e79 : a5 1b __ LDA ACCU + 0 
5e7b : 69 ff __ ADC #$ff
5e7d : a0 0b __ LDY #$0b
5e7f : 91 0d __ STA (P0),y ; (settings + 0)
5e81 : 18 __ __ CLC
5e82 : a0 05 __ LDY #$05
5e84 : b1 0d __ LDA (P0),y ; (settings + 0)
5e86 : 69 ff __ ADC #$ff
5e88 : 85 1b __ STA ACCU + 0 
5e8a : 91 0d __ STA (P0),y ; (settings + 0)
5e8c : c8 __ __ INY
5e8d : b1 0d __ LDA (P0),y ; (settings + 0)
5e8f : 69 ff __ ADC #$ff
5e91 : 85 1c __ STA ACCU + 1 
5e93 : 91 0d __ STA (P0),y ; (settings + 0)
.l265:
5e95 : ad 00 d6 LDA $d600 
5e98 : 29 20 __ AND #$20
5e9a : d0 f9 __ BNE $5e95 ; (vdc_softscroll_left.l265 + 0)
.s7:
5e9c : ad 66 6d LDA $6d66 ; (vdc_state + 10)
5e9f : 18 __ __ CLC
5ea0 : 65 1b __ ADC ACCU + 0 
5ea2 : aa __ __ TAX
5ea3 : ad 67 6d LDA $6d67 ; (vdc_state + 11)
5ea6 : 65 1c __ ADC ACCU + 1 
5ea8 : a8 __ __ TAY
5ea9 : ad 64 6d LDA $6d64 ; (vdc_state + 8)
5eac : 18 __ __ CLC
5ead : 65 1b __ ADC ACCU + 0 
5eaf : 85 1b __ STA ACCU + 0 
5eb1 : a9 0c __ LDA #$0c
5eb3 : 8d 00 d6 STA $d600 
5eb6 : ad 65 6d LDA $6d65 ; (vdc_state + 9)
5eb9 : 65 1c __ ADC ACCU + 1 
.l267:
5ebb : 2c 00 d6 BIT $d600 
5ebe : 10 fb __ BPL $5ebb ; (vdc_softscroll_left.l267 + 0)
.s15:
5ec0 : 8d 01 d6 STA $d601 
5ec3 : a9 0d __ LDA #$0d
5ec5 : 8d 00 d6 STA $d600 
.l269:
5ec8 : 2c 00 d6 BIT $d600 
5ecb : 10 fb __ BPL $5ec8 ; (vdc_softscroll_left.l269 + 0)
.s20:
5ecd : a5 1b __ LDA ACCU + 0 
5ecf : 8d 01 d6 STA $d601 
5ed2 : a9 14 __ LDA #$14
5ed4 : 8d 00 d6 STA $d600 
.l271:
5ed7 : 2c 00 d6 BIT $d600 
5eda : 10 fb __ BPL $5ed7 ; (vdc_softscroll_left.l271 + 0)
.s25:
5edc : 8c 01 d6 STY $d601 
5edf : a9 15 __ LDA #$15
5ee1 : 8d 00 d6 STA $d600 
.l273:
5ee4 : 2c 00 d6 BIT $d600 
5ee7 : 10 fb __ BPL $5ee4 ; (vdc_softscroll_left.l273 + 0)
.s30:
5ee9 : 8e 01 d6 STX $d601 
.l275:
5eec : ad 00 d6 LDA $d600 
5eef : 29 20 __ AND #$20
5ef1 : f0 f9 __ BEQ $5eec ; (vdc_softscroll_left.l275 + 0)
.l36:
5ef3 : ad 00 d6 LDA $d600 
5ef6 : 29 20 __ AND #$20
5ef8 : d0 f9 __ BNE $5ef3 ; (vdc_softscroll_left.l36 + 0)
.s31:
5efa : a0 0a __ LDY #$0a
5efc : b1 0d __ LDA (P0),y ; (settings + 0)
5efe : 4c 61 5e JMP $5e61 ; (vdc_softscroll_left.s1018 + 0)
--------------------------------------------------------------------
vdc_softscroll_right: ; vdc_softscroll_right(struct VDCSoftScrollSettings*,u8)->void
.s0:
5f01 : a0 08 __ LDY #$08
5f03 : b1 0d __ LDA (P0),y ; (settings + 0)
5f05 : c9 02 __ CMP #$02
5f07 : 90 03 __ BCC $5f0c ; (vdc_softscroll_right.s2 + 0)
5f09 : 4c d5 5f JMP $5fd5 ; (vdc_softscroll_right.s1 + 0)
.s2:
5f0c : a0 03 __ LDY #$03
5f0e : b1 0d __ LDA (P0),y ; (settings + 0)
5f10 : 38 __ __ SEC
5f11 : ed 5f 6d SBC $6d5f ; (vdc_state + 3)
5f14 : 85 43 __ STA T3 + 0 
5f16 : a9 00 __ LDA #$00
5f18 : ed 60 6d SBC $6d60 ; (vdc_state + 4)
5f1b : 85 44 __ STA T3 + 1 
5f1d : a0 0b __ LDY #$0b
5f1f : b1 0d __ LDA (P0),y ; (settings + 0)
5f21 : 85 1b __ STA ACCU + 0 
5f23 : 18 __ __ CLC
5f24 : 69 01 __ ADC #$01
5f26 : aa __ __ TAX
5f27 : a9 00 __ LDA #$00
5f29 : 2a __ __ ROL
5f2a : c5 44 __ CMP T3 + 1 
5f2c : d0 02 __ BNE $5f30 ; (vdc_softscroll_right.s1013 + 0)
.s1012:
5f2e : e4 43 __ CPX T3 + 0 
.s1013:
5f30 : 90 01 __ BCC $5f33 ; (vdc_softscroll_right.s12 + 0)
.s1001:
5f32 : 60 __ __ RTS
.s12:
5f33 : a0 0d __ LDY #$0d
5f35 : b1 0d __ LDA (P0),y ; (settings + 0)
5f37 : 29 01 __ AND #$01
5f39 : 09 06 __ ORA #$06
5f3b : a0 08 __ LDY #$08
5f3d : 91 0d __ STA (P0),y ; (settings + 0)
5f3f : a6 1b __ LDX ACCU + 0 
5f41 : e8 __ __ INX
5f42 : 8a __ __ TXA
5f43 : a0 0b __ LDY #$0b
5f45 : 91 0d __ STA (P0),y ; (settings + 0)
5f47 : a0 05 __ LDY #$05
5f49 : b1 0d __ LDA (P0),y ; (settings + 0)
5f4b : 69 01 __ ADC #$01
5f4d : 85 43 __ STA T3 + 0 
5f4f : 91 0d __ STA (P0),y ; (settings + 0)
5f51 : c8 __ __ INY
5f52 : b1 0d __ LDA (P0),y ; (settings + 0)
5f54 : 69 00 __ ADC #$00
5f56 : 85 44 __ STA T3 + 1 
5f58 : 91 0d __ STA (P0),y ; (settings + 0)
.l251:
5f5a : ad 00 d6 LDA $d600 
5f5d : 29 20 __ AND #$20
5f5f : d0 f9 __ BNE $5f5a ; (vdc_softscroll_right.l251 + 0)
.s15:
5f61 : ad 66 6d LDA $6d66 ; (vdc_state + 10)
5f64 : 18 __ __ CLC
5f65 : 65 43 __ ADC T3 + 0 
5f67 : aa __ __ TAX
5f68 : ad 67 6d LDA $6d67 ; (vdc_state + 11)
5f6b : 65 44 __ ADC T3 + 1 
5f6d : a8 __ __ TAY
5f6e : ad 64 6d LDA $6d64 ; (vdc_state + 8)
5f71 : 18 __ __ CLC
5f72 : 65 43 __ ADC T3 + 0 
5f74 : 85 43 __ STA T3 + 0 
5f76 : a9 0c __ LDA #$0c
5f78 : 8d 00 d6 STA $d600 
5f7b : ad 65 6d LDA $6d65 ; (vdc_state + 9)
5f7e : 65 44 __ ADC T3 + 1 
.l253:
5f80 : 2c 00 d6 BIT $d600 
5f83 : 10 fb __ BPL $5f80 ; (vdc_softscroll_right.l253 + 0)
.s23:
5f85 : 8d 01 d6 STA $d601 
5f88 : a9 0d __ LDA #$0d
5f8a : 8d 00 d6 STA $d600 
.l255:
5f8d : 2c 00 d6 BIT $d600 
5f90 : 10 fb __ BPL $5f8d ; (vdc_softscroll_right.l255 + 0)
.s28:
5f92 : a5 43 __ LDA T3 + 0 
5f94 : 8d 01 d6 STA $d601 
5f97 : a9 14 __ LDA #$14
5f99 : 8d 00 d6 STA $d600 
.l257:
5f9c : 2c 00 d6 BIT $d600 
5f9f : 10 fb __ BPL $5f9c ; (vdc_softscroll_right.l257 + 0)
.s33:
5fa1 : 8c 01 d6 STY $d601 
5fa4 : a9 15 __ LDA #$15
5fa6 : 8d 00 d6 STA $d600 
.l259:
5fa9 : 2c 00 d6 BIT $d600 
5fac : 10 fb __ BPL $5fa9 ; (vdc_softscroll_right.l259 + 0)
.s38:
5fae : 8e 01 d6 STX $d601 
.l261:
5fb1 : ad 00 d6 LDA $d600 
5fb4 : 29 20 __ AND #$20
5fb6 : f0 f9 __ BEQ $5fb1 ; (vdc_softscroll_right.l261 + 0)
.s39:
5fb8 : a0 08 __ LDY #$08
.s1018:
5fba : b1 0d __ LDA (P0),y ; (settings + 0)
5fbc : aa __ __ TAX
5fbd : a0 0a __ LDY #$0a
5fbf : b1 0d __ LDA (P0),y ; (settings + 0)
5fc1 : 85 1b __ STA ACCU + 0 
5fc3 : a9 19 __ LDA #$19
5fc5 : 8d 00 d6 STA $d600 
5fc8 : 8a __ __ TXA
5fc9 : 18 __ __ CLC
5fca : 65 1b __ ADC ACCU + 0 
.l247:
5fcc : 2c 00 d6 BIT $d600 
5fcf : 10 fb __ BPL $5fcc ; (vdc_softscroll_right.l247 + 0)
.s437:
5fd1 : 8d 01 d6 STA $d601 
5fd4 : 60 __ __ RTS
.s1:
5fd5 : e9 02 __ SBC #$02
5fd7 : 91 0d __ STA (P0),y ; (settings + 0)
.l246:
5fd9 : ad 00 d6 LDA $d600 
5fdc : 29 20 __ AND #$20
5fde : f0 f9 __ BEQ $5fd9 ; (vdc_softscroll_right.l246 + 0)
5fe0 : 4c ba 5f JMP $5fba ; (vdc_softscroll_right.s1018 + 0)
--------------------------------------------------------------------
scroll_bigfont: ; scroll_bigfont()->void
.s1000:
5fe3 : a5 53 __ LDA T0 + 0 
5fe5 : 8d 3c be STA $be3c ; (scroll_bigfont@stack + 0)
5fe8 : a5 54 __ LDA T0 + 1 
5fea : 8d 3d be STA $be3d ; (scroll_bigfont@stack + 1)
.s0:
5fed : a9 02 __ LDA #$02
5fef : 85 14 __ STA P7 
5ff1 : 8d 08 bf STA $bf08 ; (color + 4)
5ff4 : a9 00 __ LDA #$00
5ff6 : 85 0f __ STA P2 
5ff8 : a9 20 __ LDA #$20
5ffa : 85 11 __ STA P4 
5ffc : a9 50 __ LDA #$50
5ffe : 85 13 __ STA P6 
6000 : a9 0e __ LDA #$0e
6002 : 8d 04 bf STA $bf04 ; (color + 0)
6005 : a9 07 __ LDA #$07
6007 : 8d 05 bf STA $bf05 ; (color + 1)
600a : a9 06 __ LDA #$06
600c : 8d 06 bf STA $bf06 ; (color + 2)
600f : a9 03 __ LDA #$03
6011 : 8d 07 bf STA $bf07 ; (color + 3)
6014 : a2 c3 __ LDX #$c3
.l1002:
6016 : bd ff 6d LDA $6dff,x 
6019 : 9d 40 be STA $be40,x ; (scroll_bigfont@stack + 4)
601c : ca __ __ DEX
601d : d0 f7 __ BNE $6016 ; (scroll_bigfont.l1002 + 0)
.s1003:
601f : ad 61 6d LDA $6d61 ; (vdc_state + 5)
6022 : 85 53 __ STA T0 + 0 
6024 : 38 __ __ SEC
6025 : e9 02 __ SBC #$02
6027 : 85 15 __ STA P8 
6029 : ad 62 6d LDA $6d62 ; (vdc_state + 6)
602c : 85 54 __ STA T0 + 1 
602e : 20 79 2a JSR $2a79 ; (vdc_clear.s0 + 0)
6031 : a9 d6 __ LDA #$d6
6033 : 85 11 __ STA P4 
6035 : a9 60 __ LDA #$60
6037 : 85 12 __ STA P5 
6039 : 20 ea 67 JSR $67ea ; (vdc_prints_attr@proxy + 0)
603c : e6 10 __ INC P3 
603e : a9 00 __ LDA #$00
6040 : 85 11 __ STA P4 
6042 : a9 61 __ LDA #$61
6044 : 85 12 __ STA P5 
6046 : 20 f9 2e JSR $2ef9 ; (vdc_prints_attr.s0 + 0)
6049 : a9 60 __ LDA #$60
604b : 85 14 __ STA P7 
604d : a9 a0 __ LDA #$a0
604f : 85 12 __ STA P5 
6051 : a9 e4 __ LDA #$e4
6053 : 85 13 __ STA P6 
6055 : 20 7f 67 JSR $677f ; (krill_load@proxy + 0)
6058 : 09 00 __ ORA #$00
605a : f0 06 __ BEQ $6062 ; (scroll_bigfont.s5 + 0)
.s3:
605c : 20 cb 30 JSR $30cb ; (menu_fileerrormessage.s1000 + 0)
605f : 4c cb 60 JMP $60cb ; (scroll_bigfont.s1001 + 0)
.s5:
6062 : 20 0c 68 JSR $680c ; (vdc_clear@proxy + 0)
6065 : a9 1b __ LDA #$1b
6067 : 85 0d __ STA P0 
6069 : a9 bf __ LDA #$bf
606b : 85 10 __ STA P3 
606d : a9 bf __ LDA #$bf
606f : 85 0e __ STA P1 
6071 : a9 04 __ LDA #$04
6073 : 85 0f __ STA P2 
6075 : 20 3a 61 JSR $613a ; (txtscr_bigfont_init.s0 + 0)
6078 : 46 54 __ LSR T0 + 1 
607a : a9 1b __ LDA #$1b
607c : 8d f7 bf STA $bff7 ; (sstack + 0)
607f : a9 bf __ LDA #$bf
6081 : 8d f8 bf STA $bff8 ; (sstack + 1)
6084 : a9 09 __ LDA #$09
6086 : 85 17 __ STA P10 
6088 : a9 bf __ LDA #$bf
608a : 85 18 __ STA P11 
608c : a9 41 __ LDA #$41
608e : 8d f9 bf STA $bff9 ; (sstack + 2)
6091 : a9 be __ LDA #$be
6093 : 8d fa bf STA $bffa ; (sstack + 3)
6096 : a5 53 __ LDA T0 + 0 
6098 : 6a __ __ ROR
6099 : 38 __ __ SEC
609a : e9 02 __ SBC #$02
609c : 8d fb bf STA $bffb ; (sstack + 4)
609f : 20 7e 33 JSR $337e ; (txtscr_scroller_init.s0 + 0)
.l58:
60a2 : 20 e4 ff JSR $ffe4 
60a5 : 09 00 __ ORA #$00
60a7 : d0 f9 __ BNE $60a2 ; (scroll_bigfont.l58 + 0)
.l10:
60a9 : 20 e4 ff JSR $ffe4 
60ac : 85 1b __ STA ACCU + 0 
60ae : 85 53 __ STA T0 + 0 
60b0 : a9 00 __ LDA #$00
60b2 : 85 1c __ STA ACCU + 1 
60b4 : a9 09 __ LDA #$09
60b6 : 8d f7 bf STA $bff7 ; (sstack + 0)
60b9 : a9 bf __ LDA #$bf
60bb : 8d f8 bf STA $bff8 ; (sstack + 1)
60be : 20 e8 61 JSR $61e8 ; (txtscr_scroll_do.s1000 + 0)
60c1 : a5 53 __ LDA T0 + 0 
60c3 : c9 1b __ CMP #$1b
60c5 : f0 04 __ BEQ $60cb ; (scroll_bigfont.s1001 + 0)
.s12:
60c7 : c9 03 __ CMP #$03
60c9 : d0 de __ BNE $60a9 ; (scroll_bigfont.l10 + 0)
.s1001:
60cb : ad 3c be LDA $be3c ; (scroll_bigfont@stack + 0)
60ce : 85 53 __ STA T0 + 0 
60d0 : ad 3d be LDA $be3d ; (scroll_bigfont@stack + 1)
60d3 : 85 54 __ STA T0 + 1 
60d5 : 60 __ __ RTS
--------------------------------------------------------------------
60d6 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 44 41 54 41 2e 00       : lOADING DATA..
--------------------------------------------------------------------
60e4 : __ __ __ BYT 43 48 41 52 53 32 00                            : CHARS2.
--------------------------------------------------------------------
60eb : __ __ __ BYT 4d 55 53 49 43 25 55 00                         : MUSIC%U.
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
60f3 : a9 0f __ LDA #$0f
60f5 : 85 03 __ STA WORK + 0 
60f7 : a9 00 __ LDA #$00
60f9 : 85 04 __ STA WORK + 1 
60fb : 4c a0 64 JMP $64a0 ; (divmod + 0)
--------------------------------------------------------------------
6100 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 53 43 52 4f 4c 4c 20 70 : lOADING SCROLL p
6110 : __ __ __ BYT 65 74 73 63 69 69 20 46 4f 4e 54 3a 20 27 73 4d : etscii FONT: 'sM
6120 : __ __ __ BYT 41 4c 4c 20 72 4f 55 4e 44 20 66 4f 4e 54 27 20 : ALL rOUND fONT' 
6130 : __ __ __ BYT 42 59 20 63 55 50 49 44 2e 00                   : BY cUPID..
--------------------------------------------------------------------
txtscr_bigfont_init: ; txtscr_bigfont_init(struct TXTSCRBigFont*,u8,u8*,u8,u8,u8,u8,u8*)->void
.s0:
613a : a9 5b __ LDA #$5b
613c : 85 47 __ STA T4 + 0 
613e : a0 00 __ LDY #$00
6140 : 91 0d __ STA (P0),y ; (settings + 0)
6142 : a9 7f __ LDA #$7f
6144 : c8 __ __ INY
6145 : 91 0d __ STA (P0),y ; (settings + 0)
6147 : a9 50 __ LDA #$50
6149 : c8 __ __ INY
614a : 91 0d __ STA (P0),y ; (settings + 0)
614c : a9 00 __ LDA #$00
614e : c8 __ __ INY
614f : 91 0d __ STA (P0),y ; (settings + 0)
6151 : a9 04 __ LDA #$04
6153 : a8 __ __ TAY
6154 : 91 0d __ STA (P0),y ; (settings + 0)
6156 : a9 05 __ LDA #$05
6158 : a8 __ __ TAY
6159 : 91 0d __ STA (P0),y ; (settings + 0)
615b : 18 __ __ CLC
615c : a5 0d __ LDA P0 ; (settings + 0)
615e : 69 06 __ ADC #$06
6160 : 85 44 __ STA T2 + 0 
6162 : a5 0e __ LDA P1 ; (settings + 1)
6164 : 69 00 __ ADC #$00
6166 : 85 45 __ STA T2 + 1 
6168 : a9 00 __ LDA #$00
616a : 85 43 __ STA T1 + 0 
616c : 85 46 __ STA T3 + 0 
.l2:
616e : a5 43 __ LDA T1 + 0 
6170 : 85 1b __ STA ACCU + 0 
6172 : a9 00 __ LDA #$00
6174 : 85 1c __ STA ACCU + 1 
6176 : 85 04 __ STA WORK + 1 
6178 : a9 14 __ LDA #$14
617a : 85 03 __ STA WORK + 0 
617c : 20 a0 64 JSR $64a0 ; (divmod + 0)
617f : a5 05 __ LDA WORK + 2 
6181 : 0a __ __ ASL
6182 : 0a __ __ ASL
6183 : 85 48 __ STA T6 + 0 
6185 : a5 1b __ LDA ACCU + 0 
6187 : 85 49 __ STA T7 + 0 
6189 : 0a __ __ ASL
618a : a8 __ __ TAY
618b : a5 1c __ LDA ACCU + 1 
618d : 2a __ __ ROL
618e : aa __ __ TAX
618f : 98 __ __ TYA
6190 : 18 __ __ CLC
6191 : 65 1b __ ADC ACCU + 0 
6193 : a8 __ __ TAY
6194 : 8a __ __ TXA
6195 : 65 1c __ ADC ACCU + 1 
6197 : 85 1b __ STA ACCU + 0 
6199 : 98 __ __ TYA
619a : 0a __ __ ASL
619b : 26 1b __ ROL ACCU + 0 
619d : 0a __ __ ASL
619e : 26 1b __ ROL ACCU + 0 
61a0 : 0a __ __ ASL
61a1 : 26 1b __ ROL ACCU + 0 
61a3 : 18 __ __ CLC
61a4 : 65 49 __ ADC T7 + 0 
61a6 : 85 49 __ STA T7 + 0 
61a8 : a5 1b __ LDA ACCU + 0 
61aa : 65 1c __ ADC ACCU + 1 
61ac : 06 49 __ ASL T7 + 0 
61ae : 2a __ __ ROL
61af : 06 49 __ ASL T7 + 0 
61b1 : 2a __ __ ROL
61b2 : 06 49 __ ASL T7 + 0 
61b4 : 2a __ __ ROL
61b5 : 06 49 __ ASL T7 + 0 
61b7 : 2a __ __ ROL
61b8 : aa __ __ TAX
61b9 : 18 __ __ CLC
61ba : a5 49 __ LDA T7 + 0 
61bc : 65 48 __ ADC T6 + 0 
61be : a4 46 __ LDY T3 + 0 
61c0 : 91 44 __ STA (T2 + 0),y 
61c2 : 8a __ __ TXA
61c3 : 69 a0 __ ADC #$a0
61c5 : c8 __ __ INY
61c6 : 91 44 __ STA (T2 + 0),y 
61c8 : c8 __ __ INY
61c9 : 84 46 __ STY T3 + 0 
61cb : e6 43 __ INC T1 + 0 
61cd : c6 47 __ DEC T4 + 0 
61cf : d0 9d __ BNE $616e ; (txtscr_bigfont_init.l2 + 0)
.s4:
61d1 : 18 __ __ CLC
61d2 : a5 0d __ LDA P0 ; (settings + 0)
61d4 : 69 bc __ ADC #$bc
61d6 : 85 0d __ STA P0 ; (settings + 0)
61d8 : 90 02 __ BCC $61dc ; (txtscr_bigfont_init.s1007 + 0)
.s1006:
61da : e6 0e __ INC P1 ; (settings + 1)
.s1007:
61dc : a0 00 __ LDY #$00
.l1004:
61de : b1 0f __ LDA (P2),y ; (color + 0)
61e0 : 91 0d __ STA (P0),y ; (settings + 0)
61e2 : c8 __ __ INY
61e3 : c0 05 __ CPY #$05
61e5 : 90 f7 __ BCC $61de ; (txtscr_bigfont_init.l1004 + 0)
.s1001:
61e7 : 60 __ __ RTS
--------------------------------------------------------------------
txtscr_scroll_do: ; txtscr_scroll_do(struct TXTSCRScrollText*)->void
.s1000:
61e8 : a2 09 __ LDX #$09
61ea : b5 53 __ LDA T1 + 0,x 
61ec : 9d ed bf STA $bfed,x ; (vp_fill + 28)
61ef : ca __ __ DEX
61f0 : 10 f8 __ BPL $61ea ; (txtscr_scroll_do.s1000 + 2)
.s0:
61f2 : ad f7 bf LDA $bff7 ; (sstack + 0)
61f5 : 85 50 __ STA T0 + 0 
61f7 : 18 __ __ CLC
61f8 : 69 04 __ ADC #$04
61fa : 85 16 __ STA P9 
61fc : ad f8 bf LDA $bff8 ; (sstack + 1)
61ff : 85 51 __ STA T0 + 1 
6201 : 69 00 __ ADC #$00
6203 : 85 17 __ STA P10 
6205 : 20 50 58 JSR $5850 ; (vdcwin_scroll_left.s0 + 0)
6208 : 4c 12 62 JMP $6212 ; (txtscr_scroll_do.l1 + 0)
.s3:
620b : a0 0e __ LDY #$0e
620d : 91 50 __ STA (T0 + 0),y 
620f : c8 __ __ INY
6210 : 91 50 __ STA (T0 + 0),y 
.l1:
6212 : a0 00 __ LDY #$00
6214 : b1 50 __ LDA (T0 + 0),y 
6216 : 18 __ __ CLC
6217 : a0 0e __ LDY #$0e
6219 : 71 50 __ ADC (T0 + 0),y 
621b : 85 53 __ STA T1 + 0 
621d : a0 01 __ LDY #$01
621f : b1 50 __ LDA (T0 + 0),y 
6221 : a0 0f __ LDY #$0f
6223 : 71 50 __ ADC (T0 + 0),y 
6225 : 85 54 __ STA T1 + 1 
6227 : a0 00 __ LDY #$00
6229 : b1 53 __ LDA (T1 + 0),y 
622b : aa __ __ TAX
622c : f0 dd __ BEQ $620b ; (txtscr_scroll_do.s3 + 0)
.s2:
622e : a0 04 __ LDY #$04
6230 : b1 50 __ LDA (T0 + 0),y 
6232 : 18 __ __ CLC
6233 : a0 06 __ LDY #$06
6235 : 71 50 __ ADC (T0 + 0),y 
6237 : 38 __ __ SEC
6238 : e9 01 __ SBC #$01
623a : 85 53 __ STA T1 + 0 
623c : a0 02 __ LDY #$02
623e : b1 50 __ LDA (T0 + 0),y 
6240 : 85 55 __ STA T2 + 0 
6242 : 18 __ __ CLC
6243 : 69 bc __ ADC #$bc
6245 : 85 58 __ STA T5 + 0 
6247 : c8 __ __ INY
6248 : b1 50 __ LDA (T0 + 0),y 
624a : 85 56 __ STA T2 + 1 
624c : 69 00 __ ADC #$00
624e : 85 59 __ STA T5 + 1 
6250 : 8a __ __ TXA
6251 : 0a __ __ ASL
6252 : aa __ __ TAX
6253 : a9 00 __ LDA #$00
6255 : 85 57 __ STA T4 + 0 
6257 : 2a __ __ ROL
6258 : a8 __ __ TAY
6259 : 8a __ __ TXA
625a : 38 __ __ SEC
625b : e9 40 __ SBC #$40
625d : b0 01 __ BCS $6260 ; (txtscr_scroll_do.s1010 + 0)
.s1009:
625f : 88 __ __ DEY
.s1010:
6260 : 18 __ __ CLC
6261 : 65 55 __ ADC T2 + 0 
6263 : 85 5a __ STA T6 + 0 
6265 : 98 __ __ TYA
6266 : 65 56 __ ADC T2 + 1 
6268 : 85 5b __ STA T6 + 1 
626a : a0 06 __ LDY #$06
626c : b1 5a __ LDA (T6 + 0),y 
626e : aa __ __ TAX
626f : c8 __ __ INY
6270 : b1 5a __ LDA (T6 + 0),y 
6272 : 86 5a __ STX T6 + 0 
6274 : 85 5b __ STA T6 + 1 
6276 : a0 05 __ LDY #$05
6278 : b1 50 __ LDA (T0 + 0),y 
627a : 85 52 __ STA T3 + 0 
627c : a0 10 __ LDY #$10
627e : b1 50 __ LDA (T0 + 0),y 
6280 : 85 5c __ STA T7 + 0 
6282 : 4c c2 62 JMP $62c2 ; (txtscr_scroll_do.l7 + 0)
.s8:
6285 : a0 01 __ LDY #$01
6287 : b1 55 __ LDA (T2 + 0),y 
6289 : 85 0d __ STA P0 
628b : a5 5a __ LDA T6 + 0 
628d : 65 5c __ ADC T7 + 0 
628f : 85 0e __ STA P1 
6291 : a5 5b __ LDA T6 + 1 
6293 : 69 00 __ ADC #$00
6295 : 85 0f __ STA P2 
6297 : 20 5d 15 JSR $155d ; (bnk_readb.s0 + 0)
629a : 85 0f __ STA P2 
629c : a5 53 __ LDA T1 + 0 
629e : 85 0d __ STA P0 
62a0 : a4 57 __ LDY T4 + 0 
62a2 : b1 58 __ LDA (T5 + 0),y 
62a4 : 85 10 __ STA P3 
62a6 : 18 __ __ CLC
62a7 : a5 52 __ LDA T3 + 0 
62a9 : 65 57 __ ADC T4 + 0 
62ab : 85 0e __ STA P1 
62ad : 20 9e 35 JSR $359e ; (vdc_printc.s0 + 0)
62b0 : a5 5a __ LDA T6 + 0 
62b2 : 18 __ __ CLC
62b3 : a0 02 __ LDY #$02
62b5 : 71 55 __ ADC (T2 + 0),y 
62b7 : 85 5a __ STA T6 + 0 
62b9 : a5 5b __ LDA T6 + 1 
62bb : c8 __ __ INY
62bc : 71 55 __ ADC (T2 + 0),y 
62be : 85 5b __ STA T6 + 1 
62c0 : e6 57 __ INC T4 + 0 
.l7:
62c2 : a5 57 __ LDA T4 + 0 
62c4 : a0 05 __ LDY #$05
62c6 : d1 55 __ CMP (T2 + 0),y 
62c8 : 90 bb __ BCC $6285 ; (txtscr_scroll_do.s8 + 0)
.s6:
62ca : ad f7 bf LDA $bff7 ; (sstack + 0)
62cd : 85 50 __ STA T0 + 0 
62cf : ad f8 bf LDA $bff8 ; (sstack + 1)
62d2 : 85 51 __ STA T0 + 1 
62d4 : 18 __ __ CLC
62d5 : a0 10 __ LDY #$10
62d7 : b1 50 __ LDA (T0 + 0),y 
62d9 : 69 01 __ ADC #$01
62db : 85 55 __ STA T2 + 0 
62dd : 91 50 __ STA (T0 + 0),y 
62df : a0 02 __ LDY #$02
62e1 : b1 50 __ LDA (T0 + 0),y 
62e3 : 85 53 __ STA T1 + 0 
62e5 : c8 __ __ INY
62e6 : b1 50 __ LDA (T0 + 0),y 
62e8 : 85 54 __ STA T1 + 1 
62ea : c8 __ __ INY
62eb : b1 53 __ LDA (T1 + 0),y 
62ed : 38 __ __ SEC
62ee : e9 01 __ SBC #$01
62f0 : aa __ __ TAX
62f1 : a9 00 __ LDA #$00
62f3 : e9 00 __ SBC #$00
62f5 : 30 08 __ BMI $62ff ; (txtscr_scroll_do.s11 + 0)
.s1004:
62f7 : c9 00 __ CMP #$00
62f9 : d0 1a __ BNE $6315 ; (txtscr_scroll_do.s1001 + 0)
.s1002:
62fb : e4 55 __ CPX T2 + 0 
62fd : b0 16 __ BCS $6315 ; (txtscr_scroll_do.s1001 + 0)
.s11:
62ff : a9 00 __ LDA #$00
6301 : a0 10 __ LDY #$10
6303 : 91 50 __ STA (T0 + 0),y 
6305 : 18 __ __ CLC
6306 : a0 0e __ LDY #$0e
6308 : b1 50 __ LDA (T0 + 0),y 
630a : 69 01 __ ADC #$01
630c : 91 50 __ STA (T0 + 0),y 
630e : c8 __ __ INY
630f : b1 50 __ LDA (T0 + 0),y 
6311 : 69 00 __ ADC #$00
6313 : 91 50 __ STA (T0 + 0),y 
.s1001:
6315 : a2 09 __ LDX #$09
6317 : bd ed bf LDA $bfed,x ; (vp_fill + 28)
631a : 95 53 __ STA T1 + 0,x 
631c : ca __ __ DEX
631d : 10 f8 __ BPL $6317 ; (txtscr_scroll_do.s1001 + 2)
631f : 60 __ __ RTS
--------------------------------------------------------------------
charset_demo: ; charset_demo()->void
.s1000:
6320 : a5 53 __ LDA T0 + 0 
6322 : 8d bc bf STA $bfbc ; (bigfont + 161)
.s0:
6325 : a9 18 __ LDA #$18
6327 : 8d 00 d6 STA $d600 
.l63:
632a : 2c 00 d6 BIT $d600 
632d : 10 fb __ BPL $632a ; (charset_demo.l63 + 0)
.s5:
632f : ad 01 d6 LDA $d601 
6332 : 85 53 __ STA T0 + 0 
6334 : ae 61 6d LDX $6d61 ; (vdc_state + 5)
6337 : ca __ __ DEX
6338 : ca __ __ DEX
6339 : 86 15 __ STX P8 
633b : 20 1f 68 JSR $681f ; (vdc_clear@proxy + 0)
633e : a9 00 __ LDA #$00
6340 : 8d fd bf STA $bffd ; (sstack + 6)
6343 : 8d fe bf STA $bffe ; (sstack + 7)
6346 : a9 02 __ LDA #$02
6348 : 8d fc bf STA $bffc ; (sstack + 5)
634b : 20 46 54 JSR $5446 ; (screen_switch.s1000 + 0)
634e : ad 6c 6d LDA $6d6c ; (vdc_state + 16)
6351 : 85 0f __ STA P2 
6353 : a9 7f __ LDA #$7f
6355 : 85 11 __ STA P4 
6357 : a9 01 __ LDA #$01
6359 : 85 15 __ STA P8 
635b : ad 6d 6d LDA $6d6d ; (vdc_state + 17)
635e : 85 10 __ STA P3 
6360 : a9 00 __ LDA #$00
6362 : 85 14 __ STA P7 
6364 : 85 12 __ STA P5 
6366 : a9 a0 __ LDA #$a0
6368 : 85 13 __ STA P6 
636a : 20 00 13 JSR $1300 ; (bnk_redef_charset.s0 + 0)
636d : a9 00 __ LDA #$00
636f : 85 0f __ STA P2 
6371 : 8d c2 bf STA $bfc2 ; (bigfont + 167)
6374 : 8d c4 bf STA $bfc4 ; (bigfont + 169)
6377 : 8d c5 bf STA $bfc5 ; (bigfont + 170)
637a : 8d c6 bf STA $bfc6 ; (bigfont + 171)
637d : 8d c7 bf STA $bfc7 ; (bigfont + 172)
6380 : 8d c8 bf STA $bfc8 ; (bigfont + 173)
6383 : a9 7f __ LDA #$7f
6385 : 8d be bf STA $bfbe ; (bigfont + 163)
6388 : a9 50 __ LDA #$50
638a : 8d c1 bf STA $bfc1 ; (bigfont + 166)
638d : 85 11 __ STA P4 
638f : a9 19 __ LDA #$19
6391 : 8d c3 bf STA $bfc3 ; (bigfont + 168)
6394 : ad 62 6d LDA $6d62 ; (vdc_state + 6)
6397 : 85 44 __ STA T1 + 1 
6399 : d0 07 __ BNE $63a2 ; (charset_demo.s32 + 0)
.s1004:
639b : a9 19 __ LDA #$19
639d : cd 61 6d CMP $6d61 ; (vdc_state + 5)
63a0 : b0 04 __ BCS $63a6 ; (charset_demo.s33 + 0)
.s32:
63a2 : a9 19 __ LDA #$19
63a4 : d0 02 __ BNE $63a8 ; (charset_demo.s34 + 0)
.s33:
63a6 : a9 17 __ LDA #$17
.s34:
63a8 : 85 12 __ STA P5 
63aa : 46 44 __ LSR T1 + 1 
63ac : a9 00 __ LDA #$00
63ae : 8d bf bf STA $bfbf ; (bigfont + 164)
63b1 : a9 40 __ LDA #$40
63b3 : 8d c0 bf STA $bfc0 ; (bigfont + 165)
63b6 : a9 c9 __ LDA #$c9
63b8 : 85 0d __ STA P0 
63ba : a9 bf __ LDA #$bf
63bc : 85 0e __ STA P1 
63be : ad 61 6d LDA $6d61 ; (vdc_state + 5)
63c1 : 6a __ __ ROR
63c2 : 38 __ __ SEC
63c3 : e9 0a __ SBC #$0a
63c5 : 85 10 __ STA P3 
63c7 : 20 15 33 JSR $3315 ; (vdcwin_init.s0 + 0)
63ca : a9 be __ LDA #$be
63cc : 85 16 __ STA P9 
63ce : a9 bf __ LDA #$bf
63d0 : 85 17 __ STA P10 
63d2 : 20 44 39 JSR $3944 ; (vdcwin_cpy_viewport.s0 + 0)
63d5 : a9 2f __ LDA #$2f
63d7 : 85 0f __ STA P2 
63d9 : a9 1c __ LDA #$1c
63db : 85 11 __ STA P4 
63dd : a9 64 __ LDA #$64
63df : 85 12 __ STA P5 
63e1 : 20 ea 67 JSR $67ea ; (vdc_prints_attr@proxy + 0)
63e4 : e6 10 __ INC P3 
63e6 : a9 46 __ LDA #$46
63e8 : 85 0f __ STA P2 
63ea : 20 df 67 JSR $67df ; (vdc_prints_attr@proxy + 0)
63ed : 20 9d 2b JSR $2b9d ; (getch.s0 + 0)
63f0 : a9 18 __ LDA #$18
63f2 : 8d 00 d6 STA $d600 
63f5 : a5 53 __ LDA T0 + 0 
63f7 : 29 f0 __ AND #$f0
.l66:
63f9 : 2c 00 d6 BIT $d600 
63fc : 10 fb __ BPL $63f9 ; (charset_demo.l66 + 0)
.s15:
63fe : 8d 01 d6 STA $d601 
6401 : 20 db 2d JSR $2ddb ; (vdc_restore_charsets.s0 + 0)
6404 : a9 02 __ LDA #$02
6406 : 8d fc bf STA $bffc ; (sstack + 5)
6409 : a9 01 __ LDA #$01
640b : 8d fd bf STA $bffd ; (sstack + 6)
640e : a9 00 __ LDA #$00
6410 : 8d fe bf STA $bffe ; (sstack + 7)
6413 : 20 46 54 JSR $5446 ; (screen_switch.s1000 + 0)
.s1001:
6416 : ad bc bf LDA $bfbc ; (bigfont + 161)
6419 : 85 53 __ STA T0 + 0 
641b : 60 __ __ RTS
--------------------------------------------------------------------
641c : __ __ __ BYT 67 52 41 50 48 49 43 53 20 46 52 4f 4d 20 52 45 : gRAPHICS FROM RE
642c : __ __ __ BYT 44 45 46 49 4e 49 4e 47 20 43 48 41 52 53 45 54 : DEFINING CHARSET
643c : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
mul16by8: ; mul16by8
643e : a0 00 __ LDY #$00
6440 : 84 06 __ STY WORK + 3 
6442 : 4a __ __ LSR
6443 : 90 0d __ BCC $6452 ; (mul16by8 + 20)
6445 : aa __ __ TAX
6446 : 18 __ __ CLC
6447 : 98 __ __ TYA
6448 : 65 1b __ ADC ACCU + 0 
644a : a8 __ __ TAY
644b : a5 06 __ LDA WORK + 3 
644d : 65 1c __ ADC ACCU + 1 
644f : 85 06 __ STA WORK + 3 
6451 : 8a __ __ TXA
6452 : 06 1b __ ASL ACCU + 0 
6454 : 26 1c __ ROL ACCU + 1 
6456 : 4a __ __ LSR
6457 : b0 ec __ BCS $6445 ; (mul16by8 + 7)
6459 : d0 f7 __ BNE $6452 ; (mul16by8 + 20)
645b : 84 05 __ STY WORK + 2 
645d : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
645e : a0 00 __ LDY #$00
6460 : 84 06 __ STY WORK + 3 
6462 : a5 03 __ LDA WORK + 0 
6464 : a6 04 __ LDX WORK + 1 
6466 : f0 1c __ BEQ $6484 ; (mul16 + 38)
6468 : 38 __ __ SEC
6469 : 6a __ __ ROR
646a : 90 0d __ BCC $6479 ; (mul16 + 27)
646c : aa __ __ TAX
646d : 18 __ __ CLC
646e : 98 __ __ TYA
646f : 65 1b __ ADC ACCU + 0 
6471 : a8 __ __ TAY
6472 : a5 06 __ LDA WORK + 3 
6474 : 65 1c __ ADC ACCU + 1 
6476 : 85 06 __ STA WORK + 3 
6478 : 8a __ __ TXA
6479 : 06 1b __ ASL ACCU + 0 
647b : 26 1c __ ROL ACCU + 1 
647d : 4a __ __ LSR
647e : 90 f9 __ BCC $6479 ; (mul16 + 27)
6480 : d0 ea __ BNE $646c ; (mul16 + 14)
6482 : a5 04 __ LDA WORK + 1 
6484 : 4a __ __ LSR
6485 : 90 0d __ BCC $6494 ; (mul16 + 54)
6487 : aa __ __ TAX
6488 : 18 __ __ CLC
6489 : 98 __ __ TYA
648a : 65 1b __ ADC ACCU + 0 
648c : a8 __ __ TAY
648d : a5 06 __ LDA WORK + 3 
648f : 65 1c __ ADC ACCU + 1 
6491 : 85 06 __ STA WORK + 3 
6493 : 8a __ __ TXA
6494 : 06 1b __ ASL ACCU + 0 
6496 : 26 1c __ ROL ACCU + 1 
6498 : 4a __ __ LSR
6499 : b0 ec __ BCS $6487 ; (mul16 + 41)
649b : d0 f7 __ BNE $6494 ; (mul16 + 54)
649d : 84 05 __ STY WORK + 2 
649f : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
64a0 : a5 1c __ LDA ACCU + 1 
64a2 : d0 31 __ BNE $64d5 ; (divmod + 53)
64a4 : a5 04 __ LDA WORK + 1 
64a6 : d0 1e __ BNE $64c6 ; (divmod + 38)
64a8 : 85 06 __ STA WORK + 3 
64aa : a2 04 __ LDX #$04
64ac : 06 1b __ ASL ACCU + 0 
64ae : 2a __ __ ROL
64af : c5 03 __ CMP WORK + 0 
64b1 : 90 02 __ BCC $64b5 ; (divmod + 21)
64b3 : e5 03 __ SBC WORK + 0 
64b5 : 26 1b __ ROL ACCU + 0 
64b7 : 2a __ __ ROL
64b8 : c5 03 __ CMP WORK + 0 
64ba : 90 02 __ BCC $64be ; (divmod + 30)
64bc : e5 03 __ SBC WORK + 0 
64be : 26 1b __ ROL ACCU + 0 
64c0 : ca __ __ DEX
64c1 : d0 eb __ BNE $64ae ; (divmod + 14)
64c3 : 85 05 __ STA WORK + 2 
64c5 : 60 __ __ RTS
64c6 : a5 1b __ LDA ACCU + 0 
64c8 : 85 05 __ STA WORK + 2 
64ca : a5 1c __ LDA ACCU + 1 
64cc : 85 06 __ STA WORK + 3 
64ce : a9 00 __ LDA #$00
64d0 : 85 1b __ STA ACCU + 0 
64d2 : 85 1c __ STA ACCU + 1 
64d4 : 60 __ __ RTS
64d5 : a5 04 __ LDA WORK + 1 
64d7 : d0 1f __ BNE $64f8 ; (divmod + 88)
64d9 : a5 03 __ LDA WORK + 0 
64db : 30 1b __ BMI $64f8 ; (divmod + 88)
64dd : a9 00 __ LDA #$00
64df : 85 06 __ STA WORK + 3 
64e1 : a2 10 __ LDX #$10
64e3 : 06 1b __ ASL ACCU + 0 
64e5 : 26 1c __ ROL ACCU + 1 
64e7 : 2a __ __ ROL
64e8 : c5 03 __ CMP WORK + 0 
64ea : 90 02 __ BCC $64ee ; (divmod + 78)
64ec : e5 03 __ SBC WORK + 0 
64ee : 26 1b __ ROL ACCU + 0 
64f0 : 26 1c __ ROL ACCU + 1 
64f2 : ca __ __ DEX
64f3 : d0 f2 __ BNE $64e7 ; (divmod + 71)
64f5 : 85 05 __ STA WORK + 2 
64f7 : 60 __ __ RTS
64f8 : a9 00 __ LDA #$00
64fa : 85 05 __ STA WORK + 2 
64fc : 85 06 __ STA WORK + 3 
64fe : 84 02 __ STY $02 
6500 : a0 10 __ LDY #$10
6502 : 18 __ __ CLC
6503 : 26 1b __ ROL ACCU + 0 
6505 : 26 1c __ ROL ACCU + 1 
6507 : 26 05 __ ROL WORK + 2 
6509 : 26 06 __ ROL WORK + 3 
650b : 38 __ __ SEC
650c : a5 05 __ LDA WORK + 2 
650e : e5 03 __ SBC WORK + 0 
6510 : aa __ __ TAX
6511 : a5 06 __ LDA WORK + 3 
6513 : e5 04 __ SBC WORK + 1 
6515 : 90 04 __ BCC $651b ; (divmod + 123)
6517 : 86 05 __ STX WORK + 2 
6519 : 85 06 __ STA WORK + 3 
651b : 88 __ __ DEY
651c : d0 e5 __ BNE $6503 ; (divmod + 99)
651e : 26 1b __ ROL ACCU + 0 
6520 : 26 1c __ ROL ACCU + 1 
6522 : a4 02 __ LDY $02 
6524 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
6525 : 84 02 __ STY $02 
6527 : a0 20 __ LDY #$20
6529 : a9 00 __ LDA #$00
652b : 85 07 __ STA WORK + 4 
652d : 85 08 __ STA WORK + 5 
652f : 85 09 __ STA WORK + 6 
6531 : 85 0a __ STA WORK + 7 
6533 : a5 05 __ LDA WORK + 2 
6535 : 05 06 __ ORA WORK + 3 
6537 : d0 78 __ BNE $65b1 ; (divmod32 + 140)
6539 : a5 04 __ LDA WORK + 1 
653b : d0 27 __ BNE $6564 ; (divmod32 + 63)
653d : 18 __ __ CLC
653e : 26 1b __ ROL ACCU + 0 
6540 : 26 1c __ ROL ACCU + 1 
6542 : 26 1d __ ROL ACCU + 2 
6544 : 26 1e __ ROL ACCU + 3 
6546 : 2a __ __ ROL
6547 : 90 05 __ BCC $654e ; (divmod32 + 41)
6549 : e5 03 __ SBC WORK + 0 
654b : 38 __ __ SEC
654c : b0 06 __ BCS $6554 ; (divmod32 + 47)
654e : c5 03 __ CMP WORK + 0 
6550 : 90 02 __ BCC $6554 ; (divmod32 + 47)
6552 : e5 03 __ SBC WORK + 0 
6554 : 88 __ __ DEY
6555 : d0 e7 __ BNE $653e ; (divmod32 + 25)
6557 : 85 07 __ STA WORK + 4 
6559 : 26 1b __ ROL ACCU + 0 
655b : 26 1c __ ROL ACCU + 1 
655d : 26 1d __ ROL ACCU + 2 
655f : 26 1e __ ROL ACCU + 3 
6561 : a4 02 __ LDY $02 
6563 : 60 __ __ RTS
6564 : a5 1e __ LDA ACCU + 3 
6566 : d0 10 __ BNE $6578 ; (divmod32 + 83)
6568 : a6 1d __ LDX ACCU + 2 
656a : 86 1e __ STX ACCU + 3 
656c : a6 1c __ LDX ACCU + 1 
656e : 86 1d __ STX ACCU + 2 
6570 : a6 1b __ LDX ACCU + 0 
6572 : 86 1c __ STX ACCU + 1 
6574 : 85 1b __ STA ACCU + 0 
6576 : a0 18 __ LDY #$18
6578 : 18 __ __ CLC
6579 : 26 1b __ ROL ACCU + 0 
657b : 26 1c __ ROL ACCU + 1 
657d : 26 1d __ ROL ACCU + 2 
657f : 26 1e __ ROL ACCU + 3 
6581 : 26 07 __ ROL WORK + 4 
6583 : 26 08 __ ROL WORK + 5 
6585 : 90 0c __ BCC $6593 ; (divmod32 + 110)
6587 : a5 07 __ LDA WORK + 4 
6589 : e5 03 __ SBC WORK + 0 
658b : aa __ __ TAX
658c : a5 08 __ LDA WORK + 5 
658e : e5 04 __ SBC WORK + 1 
6590 : 38 __ __ SEC
6591 : b0 0c __ BCS $659f ; (divmod32 + 122)
6593 : 38 __ __ SEC
6594 : a5 07 __ LDA WORK + 4 
6596 : e5 03 __ SBC WORK + 0 
6598 : aa __ __ TAX
6599 : a5 08 __ LDA WORK + 5 
659b : e5 04 __ SBC WORK + 1 
659d : 90 04 __ BCC $65a3 ; (divmod32 + 126)
659f : 86 07 __ STX WORK + 4 
65a1 : 85 08 __ STA WORK + 5 
65a3 : 88 __ __ DEY
65a4 : d0 d3 __ BNE $6579 ; (divmod32 + 84)
65a6 : 26 1b __ ROL ACCU + 0 
65a8 : 26 1c __ ROL ACCU + 1 
65aa : 26 1d __ ROL ACCU + 2 
65ac : 26 1e __ ROL ACCU + 3 
65ae : a4 02 __ LDY $02 
65b0 : 60 __ __ RTS
65b1 : a0 10 __ LDY #$10
65b3 : a5 1e __ LDA ACCU + 3 
65b5 : 85 08 __ STA WORK + 5 
65b7 : a5 1d __ LDA ACCU + 2 
65b9 : 85 07 __ STA WORK + 4 
65bb : a9 00 __ LDA #$00
65bd : 85 1d __ STA ACCU + 2 
65bf : 85 1e __ STA ACCU + 3 
65c1 : 18 __ __ CLC
65c2 : 26 1b __ ROL ACCU + 0 
65c4 : 26 1c __ ROL ACCU + 1 
65c6 : 26 07 __ ROL WORK + 4 
65c8 : 26 08 __ ROL WORK + 5 
65ca : 26 09 __ ROL WORK + 6 
65cc : 26 0a __ ROL WORK + 7 
65ce : a5 07 __ LDA WORK + 4 
65d0 : c5 03 __ CMP WORK + 0 
65d2 : a5 08 __ LDA WORK + 5 
65d4 : e5 04 __ SBC WORK + 1 
65d6 : a5 09 __ LDA WORK + 6 
65d8 : e5 05 __ SBC WORK + 2 
65da : a5 0a __ LDA WORK + 7 
65dc : e5 06 __ SBC WORK + 3 
65de : 90 18 __ BCC $65f8 ; (divmod32 + 211)
65e0 : a5 07 __ LDA WORK + 4 
65e2 : e5 03 __ SBC WORK + 0 
65e4 : 85 07 __ STA WORK + 4 
65e6 : a5 08 __ LDA WORK + 5 
65e8 : e5 04 __ SBC WORK + 1 
65ea : 85 08 __ STA WORK + 5 
65ec : a5 09 __ LDA WORK + 6 
65ee : e5 05 __ SBC WORK + 2 
65f0 : 85 09 __ STA WORK + 6 
65f2 : a5 0a __ LDA WORK + 7 
65f4 : e5 06 __ SBC WORK + 3 
65f6 : 85 0a __ STA WORK + 7 
65f8 : 88 __ __ DEY
65f9 : d0 c7 __ BNE $65c2 ; (divmod32 + 157)
65fb : 26 1b __ ROL ACCU + 0 
65fd : 26 1c __ ROL ACCU + 1 
65ff : a4 02 __ LDY $02 
6601 : 60 __ __ RTS
--------------------------------------------------------------------
malloc: ; malloc
6602 : 18 __ __ CLC
6603 : a5 1b __ LDA ACCU + 0 
6605 : 69 02 __ ADC #$02
6607 : 85 03 __ STA WORK + 0 
6609 : a5 1c __ LDA ACCU + 1 
660b : 69 00 __ ADC #$00
660d : 85 04 __ STA WORK + 1 
660f : ad ef 6d LDA $6def ; (HeapNode + 2)
6612 : d0 1f __ BNE $6633 ; (malloc + 49)
6614 : a9 00 __ LDA #$00
6616 : 8d 90 6f STA $6f90 
6619 : 8d 91 6f STA $6f91 
661c : ee ef 6d INC $6def ; (HeapNode + 2)
661f : a9 90 __ LDA #$90
6621 : 8d ed 6d STA $6ded ; (HeapNode + 0)
6624 : a9 6f __ LDA #$6f
6626 : 8d ee 6d STA $6dee ; (HeapNode + 1)
6629 : a9 00 __ LDA #$00
662b : 8d 92 6f STA $6f92 
662e : a9 b0 __ LDA #$b0
6630 : 8d 93 6f STA $6f93 
6633 : a9 ed __ LDA #$ed
6635 : a2 6d __ LDX #$6d
6637 : 85 1d __ STA ACCU + 2 
6639 : 86 1e __ STX ACCU + 3 
663b : 18 __ __ CLC
663c : a0 00 __ LDY #$00
663e : b1 1d __ LDA (ACCU + 2),y 
6640 : 85 1b __ STA ACCU + 0 
6642 : 65 03 __ ADC WORK + 0 
6644 : 85 05 __ STA WORK + 2 
6646 : c8 __ __ INY
6647 : b1 1d __ LDA (ACCU + 2),y 
6649 : 85 1c __ STA ACCU + 1 
664b : f0 18 __ BEQ $6665 ; (malloc + 99)
664d : 65 04 __ ADC WORK + 1 
664f : 85 06 __ STA WORK + 3 
6651 : a0 02 __ LDY #$02
6653 : b1 1b __ LDA (ACCU + 0),y 
6655 : c5 05 __ CMP WORK + 2 
6657 : c8 __ __ INY
6658 : b1 1b __ LDA (ACCU + 0),y 
665a : e5 06 __ SBC WORK + 3 
665c : b0 08 __ BCS $6666 ; (malloc + 100)
665e : a5 1b __ LDA ACCU + 0 
6660 : a6 1c __ LDX ACCU + 1 
6662 : 4c 37 66 JMP $6637 ; (malloc + 53)
6665 : 60 __ __ RTS
6666 : 18 __ __ CLC
6667 : a5 05 __ LDA WORK + 2 
6669 : 69 03 __ ADC #$03
666b : 29 fc __ AND #$fc
666d : 85 07 __ STA WORK + 4 
666f : a5 06 __ LDA WORK + 3 
6671 : 69 00 __ ADC #$00
6673 : 85 08 __ STA WORK + 5 
6675 : a0 02 __ LDY #$02
6677 : a5 07 __ LDA WORK + 4 
6679 : d1 1b __ CMP (ACCU + 0),y 
667b : d0 15 __ BNE $6692 ; (malloc + 144)
667d : c8 __ __ INY
667e : a5 08 __ LDA WORK + 5 
6680 : d1 1b __ CMP (ACCU + 0),y 
6682 : d0 0e __ BNE $6692 ; (malloc + 144)
6684 : a0 00 __ LDY #$00
6686 : b1 1b __ LDA (ACCU + 0),y 
6688 : 91 1d __ STA (ACCU + 2),y 
668a : c8 __ __ INY
668b : b1 1b __ LDA (ACCU + 0),y 
668d : 91 1d __ STA (ACCU + 2),y 
668f : 4c af 66 JMP $66af ; (malloc + 173)
6692 : a0 00 __ LDY #$00
6694 : b1 1b __ LDA (ACCU + 0),y 
6696 : 91 07 __ STA (WORK + 4),y 
6698 : a5 07 __ LDA WORK + 4 
669a : 91 1d __ STA (ACCU + 2),y 
669c : c8 __ __ INY
669d : b1 1b __ LDA (ACCU + 0),y 
669f : 91 07 __ STA (WORK + 4),y 
66a1 : a5 08 __ LDA WORK + 5 
66a3 : 91 1d __ STA (ACCU + 2),y 
66a5 : c8 __ __ INY
66a6 : b1 1b __ LDA (ACCU + 0),y 
66a8 : 91 07 __ STA (WORK + 4),y 
66aa : c8 __ __ INY
66ab : b1 1b __ LDA (ACCU + 0),y 
66ad : 91 07 __ STA (WORK + 4),y 
66af : a0 00 __ LDY #$00
66b1 : a5 05 __ LDA WORK + 2 
66b3 : 91 1b __ STA (ACCU + 0),y 
66b5 : c8 __ __ INY
66b6 : a5 06 __ LDA WORK + 3 
66b8 : 91 1b __ STA (ACCU + 0),y 
66ba : a5 1b __ LDA ACCU + 0 
66bc : 09 02 __ ORA #$02
66be : 85 1b __ STA ACCU + 0 
66c0 : 60 __ __ RTS
--------------------------------------------------------------------
free: ; free
66c1 : a5 1b __ LDA ACCU + 0 
66c3 : 29 fc __ AND #$fc
66c5 : 85 1b __ STA ACCU + 0 
66c7 : 05 1c __ ORA ACCU + 1 
66c9 : d0 01 __ BNE $66cc ; (free + 11)
66cb : 60 __ __ RTS
66cc : 18 __ __ CLC
66cd : a0 00 __ LDY #$00
66cf : b1 1b __ LDA (ACCU + 0),y 
66d1 : 69 03 __ ADC #$03
66d3 : 29 fc __ AND #$fc
66d5 : 85 1d __ STA ACCU + 2 
66d7 : c8 __ __ INY
66d8 : b1 1b __ LDA (ACCU + 0),y 
66da : 69 00 __ ADC #$00
66dc : 85 1e __ STA ACCU + 3 
66de : a9 ed __ LDA #$ed
66e0 : a2 6d __ LDX #$6d
66e2 : 85 05 __ STA WORK + 2 
66e4 : 86 06 __ STX WORK + 3 
66e6 : a0 01 __ LDY #$01
66e8 : b1 05 __ LDA (WORK + 2),y 
66ea : f0 28 __ BEQ $6714 ; (free + 83)
66ec : aa __ __ TAX
66ed : 88 __ __ DEY
66ee : b1 05 __ LDA (WORK + 2),y 
66f0 : e4 1e __ CPX ACCU + 3 
66f2 : 90 ee __ BCC $66e2 ; (free + 33)
66f4 : d0 1e __ BNE $6714 ; (free + 83)
66f6 : c5 1d __ CMP ACCU + 2 
66f8 : 90 e8 __ BCC $66e2 ; (free + 33)
66fa : d0 18 __ BNE $6714 ; (free + 83)
66fc : a0 00 __ LDY #$00
66fe : b1 1d __ LDA (ACCU + 2),y 
6700 : 91 1b __ STA (ACCU + 0),y 
6702 : c8 __ __ INY
6703 : b1 1d __ LDA (ACCU + 2),y 
6705 : 91 1b __ STA (ACCU + 0),y 
6707 : c8 __ __ INY
6708 : b1 1d __ LDA (ACCU + 2),y 
670a : 91 1b __ STA (ACCU + 0),y 
670c : c8 __ __ INY
670d : b1 1d __ LDA (ACCU + 2),y 
670f : 91 1b __ STA (ACCU + 0),y 
6711 : 4c 29 67 JMP $6729 ; (free + 104)
6714 : a0 00 __ LDY #$00
6716 : b1 05 __ LDA (WORK + 2),y 
6718 : 91 1b __ STA (ACCU + 0),y 
671a : c8 __ __ INY
671b : b1 05 __ LDA (WORK + 2),y 
671d : 91 1b __ STA (ACCU + 0),y 
671f : c8 __ __ INY
6720 : a5 1d __ LDA ACCU + 2 
6722 : 91 1b __ STA (ACCU + 0),y 
6724 : c8 __ __ INY
6725 : a5 1e __ LDA ACCU + 3 
6727 : 91 1b __ STA (ACCU + 0),y 
6729 : a0 02 __ LDY #$02
672b : b1 05 __ LDA (WORK + 2),y 
672d : c5 1b __ CMP ACCU + 0 
672f : d0 1d __ BNE $674e ; (free + 141)
6731 : c8 __ __ INY
6732 : b1 05 __ LDA (WORK + 2),y 
6734 : c5 1c __ CMP ACCU + 1 
6736 : d0 16 __ BNE $674e ; (free + 141)
6738 : a0 00 __ LDY #$00
673a : b1 1b __ LDA (ACCU + 0),y 
673c : 91 05 __ STA (WORK + 2),y 
673e : c8 __ __ INY
673f : b1 1b __ LDA (ACCU + 0),y 
6741 : 91 05 __ STA (WORK + 2),y 
6743 : c8 __ __ INY
6744 : b1 1b __ LDA (ACCU + 0),y 
6746 : 91 05 __ STA (WORK + 2),y 
6748 : c8 __ __ INY
6749 : b1 1b __ LDA (ACCU + 0),y 
674b : 91 05 __ STA (WORK + 2),y 
674d : 60 __ __ RTS
674e : a0 00 __ LDY #$00
6750 : a5 1b __ LDA ACCU + 0 
6752 : 91 05 __ STA (WORK + 2),y 
6754 : c8 __ __ INY
6755 : a5 1c __ LDA ACCU + 1 
6757 : 91 05 __ STA (WORK + 2),y 
6759 : 60 __ __ RTS
--------------------------------------------------------------------
__multab13L:
675a : __ __ __ BYT 00 0d 1a 27                                     : ...'
--------------------------------------------------------------------
__multab102L:
675e : __ __ __ BYT 00 66 cc 32 98 fe 64 ca                         : .f.2..d.
--------------------------------------------------------------------
__multab102H:
6766 : __ __ __ BYT 00 00 00 01 01 01 02 02                         : ........
--------------------------------------------------------------------
__multab9L:
676e : __ __ __ BYT 00 09 12 1b 24 2d 36                            : ....$-6
--------------------------------------------------------------------
__multab6L:
6775 : __ __ __ BYT 00 06 0c 12 18                                  : .....
--------------------------------------------------------------------
__multab15L:
677a : __ __ __ BYT 00 0f 1e 2d 3c                                  : ...-<
--------------------------------------------------------------------
krill_load@proxy: ; krill_load@proxy
677f : a9 00 __ LDA #$00
6781 : 85 11 __ STA P4 
6783 : 4c 9a 30 JMP $309a ; (krill_load.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
6786 : a9 00 __ LDA #$00
6788 : 85 14 __ STA P7 
678a : 4c ea 46 JMP $46ea ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
678d : a5 4c __ LDA $4c 
678f : 85 11 __ STA P4 
6791 : a5 4d __ LDA $4d 
6793 : 85 12 __ STA P5 
6795 : 4c ea 46 JMP $46ea ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
6798 : a5 4c __ LDA $4c 
679a : 85 0f __ STA P2 
679c : a5 4d __ LDA $4d 
679e : 85 10 __ STA P3 
67a0 : 4c ea 46 JMP $46ea ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
67a3 : a5 4d __ LDA $4d 
67a5 : 85 11 __ STA P4 
67a7 : a5 4e __ LDA $4e 
67a9 : 85 12 __ STA P5 
67ab : 4c ea 46 JMP $46ea ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
67ae : a5 4d __ LDA $4d 
67b0 : 85 0f __ STA P2 
67b2 : a5 4e __ LDA $4e 
67b4 : 85 10 __ STA P3 
67b6 : 4c ea 46 JMP $46ea ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
67b9 : a9 00 __ LDA #$00
67bb : 85 0f __ STA P2 
67bd : a9 75 __ LDA #$75
67bf : 85 11 __ STA P4 
67c1 : a9 6d __ LDA #$6d
67c3 : 85 12 __ STA P5 
67c5 : a5 54 __ LDA $54 
67c7 : 85 13 __ STA P6 
67c9 : 4c f9 2e JMP $2ef9 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
67cc : a9 00 __ LDA #$00
67ce : 85 0f __ STA P2 
67d0 : a9 03 __ LDA #$03
67d2 : 85 10 __ STA P3 
67d4 : 4c f9 2e JMP $2ef9 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
67d7 : ad 63 6d LDA $6d63 ; (vdc_state + 7)
67da : 85 13 __ STA P6 
67dc : 4c f9 2e JMP $2ef9 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
67df : a9 37 __ LDA #$37
67e1 : 85 11 __ STA P4 
67e3 : a9 36 __ LDA #$36
67e5 : 85 12 __ STA P5 
67e7 : 4c f9 2e JMP $2ef9 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
67ea : a9 03 __ LDA #$03
67ec : 85 10 __ STA P3 
67ee : ad 63 6d LDA $6d63 ; (vdc_state + 7)
67f1 : 85 13 __ STA P6 
67f3 : 4c f9 2e JMP $2ef9 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
67f6 : a9 75 __ LDA #$75
67f8 : 85 11 __ STA P4 
67fa : a9 6d __ LDA #$6d
67fc : 85 12 __ STA P5 
67fe : a9 8d __ LDA #$8d
6800 : 85 13 __ STA P6 
6802 : 4c f9 2e JMP $2ef9 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
6805 : a5 4a __ LDA $4a 
6807 : 85 0e __ STA P1 
6809 : 4c 4e 2b JMP $2b4e ; (vdc_mem_addr.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
680c : a9 20 __ LDA #$20
680e : 85 11 __ STA P4 
6810 : a9 50 __ LDA #$50
6812 : 85 13 __ STA P6 
6814 : a9 03 __ LDA #$03
6816 : 85 14 __ STA P7 
6818 : a9 02 __ LDA #$02
681a : 85 15 __ STA P8 
681c : 4c 79 2a JMP $2a79 ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
681f : a9 00 __ LDA #$00
6821 : 85 0f __ STA P2 
6823 : a9 20 __ LDA #$20
6825 : 85 11 __ STA P4 
6827 : a9 50 __ LDA #$50
6829 : 85 13 __ STA P6 
682b : a9 02 __ LDA #$02
682d : 85 14 __ STA P7 
682f : 4c 79 2a JMP $2a79 ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_hchar@proxy: ; vdc_hchar@proxy
6832 : a9 20 __ LDA #$20
6834 : 85 11 __ STA P4 
6836 : a9 50 __ LDA #$50
6838 : 85 13 __ STA P6 
683a : 4c a3 2a JMP $2aa3 ; (vdc_hchar.s0 + 0)
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
683d : a9 05 __ LDA #$05
683f : 85 03 __ STA WORK + 0 
6841 : a9 00 __ LDA #$00
6843 : 85 04 __ STA WORK + 1 
6845 : 4c a0 64 JMP $64a0 ; (divmod + 0)
--------------------------------------------------------------------
winStyles:
6848 : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
6858 : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
menubar:
685a : __ __ __ BYT 73 45 54 54 49 4e 47 53 00 77 49 4e 44 4f 57 53 : sETTINGS.wINDOWS
686a : __ __ __ BYT 00 00 76 49 45 57 50 4f 52 54 00 73 43 52 4f 4c : ..vIEWPORT.sCROL
687a : __ __ __ BYT 4c 00 00 00 63 48 41 52 53 45 54 00 00 6d 55 53 : L...cHARSET..mUS
688a : __ __ __ BYT 49 43 00 00 00 00 00 00 00 00 00 00 01          : IC...........
--------------------------------------------------------------------
pulldown_options:
6897 : __ __ __ BYT 03 02 02 03 01 04 02 06                         : ........
--------------------------------------------------------------------
689f : __ __ __ BYT 42 4c 55 45 20 4a 41 59 00 00 00 00 00 00 00 43 : BLUE JAY.......C
68af : __ __ __ BYT 41 52 44 49 4e 41 4c 00 00 00 00 00 00 00 45 41 : ARDINAL.......EA
68bf : __ __ __ BYT 53 54 45 52 4e 20 50 48 4f 45 42 45 00 47 52 41 : STERN PHOEBE.GRA
68cf : __ __ __ BYT 43 4b 4c 45 00 00 00 00 00 00 00 00 53 41 4e 44 : CKLE........SAND
68df : __ __ __ BYT 48 49 4c 4c 20 43 52 41 4e 45 00                : HILL CRANE.
--------------------------------------------------------------------
p2smap:
68ea : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
s2pmap:
68f2 : __ __ __ BYT 40 00 20 c0 c0 80 a0 40                         : @. ....@
--------------------------------------------------------------------
screenset:
68fa : __ __ __ BYT 50 96 a0 4b 50 19                               : P..KP.
--------------------------------------------------------------------
vdc_modes:
6900 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
6910 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
6920 : __ __ __ BYT e7 24 7e ff 50 00 32 00 00 00 00 00 10 00 40 00 : .$~.P.2.......@.
6930 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
6940 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
6950 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
6960 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
6970 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
6980 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
6990 : __ __ __ BYT 50 00 32 00 00 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
69a0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
69b0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
69c0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
69d0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
pulldown_titles:
69d8 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 00 00 00 00 00 00 : sCREENMODE......
69e8 : __ __ __ BYT 00 69 4e 46 4f 20 20 20 20 20 20 00 00 00 00 00 : .iNFO      .....
69f8 : __ __ __ BYT 00 00 65 58 49 54 20 20 20 20 20 20 00 00 00 00 : ..eXIT      ....
6a08 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a18 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a28 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a38 : __ __ __ BYT 00 00 00 00 00 00 77 49 4e 44 4f 57 20 4f 4e 20 : ......wINDOW ON 
6a48 : __ __ __ BYT 57 49 4e 44 4f 57 00 74 45 58 54 20 45 4e 54 52 : WINDOW.tEXT ENTR
6a58 : __ __ __ BYT 59 20 20 20 20 20 20 00 00 00 00 00 00 00 00 00 : Y      .........
6a68 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a78 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a88 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 73 43 52 45 : ............sCRE
6aa8 : __ __ __ BYT 45 4e 20 31 00 00 00 00 00 00 00 00 00 73 43 52 : EN 1.........sCR
6ab8 : __ __ __ BYT 45 45 4e 20 32 00 00 00 00 00 00 00 00 00 00 00 : EEN 2...........
6ac8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6ad8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6ae8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6af8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b08 : __ __ __ BYT 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 31 00 00 : ..fULLSCREEN 1..
6b18 : __ __ __ BYT 00 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 32 00 : ...fULLSCREEN 2.
6b28 : __ __ __ BYT 00 00 00 00 62 49 47 46 4f 4e 54 20 54 45 58 54 : ....bIGFONT TEXT
6b38 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b48 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b58 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b68 : __ __ __ BYT 00 00 00 00 00 00 00 00 63 48 41 52 53 45 54 20 : ........cHARSET 
6b78 : __ __ __ BYT 44 45 4d 4f 00 00 00 00 00 00 00 00 00 00 00 00 : DEMO............
6b88 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6ba8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6bb8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6bc8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 75 4c : ..............uL
6bd8 : __ __ __ BYT 54 49 4d 41 54 45 20 61 58 45 4c 20 66 00 00 66 : TIMATE aXEL f..f
6be8 : __ __ __ BYT 41 44 45 44 20 20 20 20 20 20 20 20 20 20 00 00 : ADED          ..
6bf8 : __ __ __ BYT 73 54 4f 50 20 4d 55 53 49 43 20 20 20 20 20 00 : sTOP MUSIC     .
6c08 : __ __ __ BYT 00 72 45 53 54 41 52 54 20 4d 55 53 49 43 20 20 : .rESTART MUSIC  
6c18 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6c28 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6c38 : __ __ __ BYT 00 00 00 00 79 45 53 00 00 00 00 00 00 00 00 00 : ....yES.........
6c48 : __ __ __ BYT 00 00 00 00 00 6e 4f 20 00 00 00 00 00 00 00 00 : .....nO ........
6c58 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6c68 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6c78 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6c88 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6c98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 70 61 6c 20 20 38 : ..........pal  8
6ca8 : __ __ __ BYT 30 58 32 35 00 00 00 00 00 00 00 70 61 6c 20 20 : 0X25.......pal  
6cb8 : __ __ __ BYT 38 30 58 35 30 00 00 00 00 00 00 00 70 61 6c 20 : 80X50.......pal 
6cc8 : __ __ __ BYT 20 38 30 58 37 30 00 00 00 00 00 00 00 6e 74 73 :  80X70.......nts
6cd8 : __ __ __ BYT 63 20 38 30 58 32 35 00 00 00 00 00 00 00 6e 74 : c 80X25.......nt
6ce8 : __ __ __ BYT 73 63 20 38 30 58 35 30 00 00 00 00 00 00 00 6e : sc 80X50.......n
6cf8 : __ __ __ BYT 74 73 63 20 38 30 58 36 30 00 00 00 00 00 00 00 : tsc 80X60.......
--------------------------------------------------------------------
6d08 : __ __ __ BYT 46 4c 49 45 53 00 4a 55 4d 50 53 00 53 4c 45 45 : FLIES.JUMPS.SLEE
6d18 : __ __ __ BYT 50 53 45 41 54 53 00 00 57 41 4c 4b 53 00       : PSEATS..WALKS.
--------------------------------------------------------------------
6d26 : __ __ __ BYT 42 49 47 00 00 00 53 4d 41 4c 4c 00 41 4e 47 52 : BIG...SMALL.ANGR
6d36 : __ __ __ BYT 59 00 57 45 54 00 00 00 48 41 50 50 59 00       : Y.WET...HAPPY.
--------------------------------------------------------------------
winCfg:
6d44 : __ __ __ BSS	8
--------------------------------------------------------------------
krnio_pstatus:
6d4c : __ __ __ BSS	16
--------------------------------------------------------------------
vdc_state:
6d5c : __ __ __ BSS	25
--------------------------------------------------------------------
linebuffer:
6d75 : __ __ __ BSS	81
--------------------------------------------------------------------
windows:
6dc6 : __ __ __ BSS	39
--------------------------------------------------------------------
HeapNode:
6ded : __ __ __ BSS	4
--------------------------------------------------------------------
6e00 : __ __ __ BYT 77 45 4c 43 4f 4d 45 20 54 4f 20 6f 53 43 41 52 : wELCOME TO oSCAR
6e10 : __ __ __ BYT 36 34 20 76 64 63 20 64 45 4d 4f 2e 20 74 48 49 : 64 vdc dEMO. tHI
6e20 : __ __ __ BYT 53 20 44 45 4d 4f 20 49 53 20 57 52 49 54 54 45 : S DEMO IS WRITTE
6e30 : __ __ __ BYT 4e 20 54 4f 20 54 45 53 54 20 41 4e 44 20 44 45 : N TO TEST AND DE
6e40 : __ __ __ BYT 4d 4f 4e 53 54 52 41 54 45 20 54 48 45 20 76 64 : MONSTRATE THE vd
6e50 : __ __ __ BYT 63 20 4c 49 42 52 41 52 59 20 46 55 4e 43 54 49 : c LIBRARY FUNCTI
6e60 : __ __ __ BYT 4f 4e 53 20 69 20 48 41 56 45 20 54 52 49 45 44 : ONS i HAVE TRIED
6e70 : __ __ __ BYT 20 54 4f 20 42 55 49 4c 44 20 46 4f 52 20 54 48 :  TO BUILD FOR TH
6e80 : __ __ __ BYT 45 20 6f 53 43 41 52 36 34 20 43 4f 4d 50 49 4c : E oSCAR64 COMPIL
6e90 : __ __ __ BYT 45 52 2e 20 68 4f 50 45 20 59 4f 55 20 45 4e 4a : ER. hOPE YOU ENJ
6ea0 : __ __ __ BYT 4f 59 20 49 54 21 20 67 52 45 45 54 49 4e 47 53 : OY IT! gREETINGS
6eb0 : __ __ __ BYT 2c 20 78 41 4e 44 45 52 20 6d 4f 4c 2e 20 20 20 : , xANDER mOL.   
6ec0 : __ __ __ BYT 20 20 00                                        :   .
--------------------------------------------------------------------
multab:
6f00 : __ __ __ BSS	144
--------------------------------------------------------------------
bnk_redef_charset: ; bnk_redef_charset(u16,u8,volatile u8*,u16)->void
.s0:
01:1300 : ad 00 ff LDA $ff00 
01:1303 : 85 43 __ STA T0 + 0 
01:1305 : a9 0e __ LDA #$0e
01:1307 : 8d 00 ff STA $ff00 
01:130a : 20 46 2b JSR $2b46 ; (vdc_mem_addr@proxy + 0)
01:130d : a5 14 __ LDA P7 ; (size + 0)
01:130f : 05 15 __ ORA P8 ; (size + 1)
01:1311 : d0 06 __ BNE $1319 ; (bnk_redef_charset.l2 + 0)
.s3:
01:1313 : a5 43 __ LDA T0 + 0 
01:1315 : 8d 00 ff STA $ff00 
.s1001:
01:1318 : 60 __ __ RTS
.l2:
01:1319 : a2 08 __ LDX #$08
.l5:
01:131b : a5 11 __ LDA P4 ; (scr + 0)
01:131d : 8d 00 ff STA $ff00 
01:1320 : a0 00 __ LDY #$00
01:1322 : b1 12 __ LDA (P5),y ; (sp + 0)
01:1324 : a8 __ __ TAY
01:1325 : e6 12 __ INC P5 ; (sp + 0)
01:1327 : d0 02 __ BNE $132b ; (bnk_redef_charset.s1012 + 0)
.s1011:
01:1329 : e6 13 __ INC P6 ; (sp + 1)
.s1012:
01:132b : a9 0e __ LDA #$0e
01:132d : 8d 00 ff STA $ff00 
.l117:
01:1330 : 2c 00 d6 BIT $d600 
01:1333 : 10 fb __ BPL $1330 ; (bnk_redef_charset.l117 + 0)
.s10:
01:1335 : 8c 01 d6 STY $d601 
01:1338 : ca __ __ DEX
01:1339 : d0 e0 __ BNE $131b ; (bnk_redef_charset.l5 + 0)
.s7:
01:133b : a2 08 __ LDX #$08
.l12:
01:133d : 2c 00 d6 BIT $d600 
01:1340 : 10 fb __ BPL $133d ; (bnk_redef_charset.l12 + 0)
.s17:
01:1342 : a9 00 __ LDA #$00
01:1344 : 8d 01 d6 STA $d601 
01:1347 : ca __ __ DEX
01:1348 : d0 f3 __ BNE $133d ; (bnk_redef_charset.l12 + 0)
.s14:
01:134a : a5 14 __ LDA P7 ; (size + 0)
01:134c : d0 02 __ BNE $1350 ; (bnk_redef_charset.s1007 + 0)
.s1006:
01:134e : c6 15 __ DEC P8 ; (size + 1)
.s1007:
01:1350 : c6 14 __ DEC P7 ; (size + 0)
01:1352 : d0 c5 __ BNE $1319 ; (bnk_redef_charset.l2 + 0)
.s1008:
01:1354 : a5 15 __ LDA P8 ; (size + 1)
01:1356 : d0 c1 __ BNE $1319 ; (bnk_redef_charset.l2 + 0)
01:1358 : 4c 13 13 JMP $1313 ; (bnk_redef_charset.s3 + 0)
--------------------------------------------------------------------
krill_init: ; krill_init()->void
.s1000:
01:135b : 38 __ __ SEC
01:135c : a5 23 __ LDA SP + 0 
01:135e : e9 06 __ SBC #$06
01:1360 : 85 23 __ STA SP + 0 
01:1362 : b0 02 __ BCS $1366 ; (krill_init.s0 + 0)
01:1364 : c6 24 __ DEC SP + 1 
.s0:
01:1366 : a9 7f __ LDA #$7f
01:1368 : 8d 0d dc STA $dc0d 
01:136b : a9 02 __ LDA #$02
01:136d : 8d 00 dd STA $dd00 
01:1370 : 20 c6 2e JSR $2ec6 ; (krill_install.s0 + 0)
01:1373 : 8d fe 15 STA $15fe ; (krillvar + 20)
01:1376 : ad fe 15 LDA $15fe ; (krillvar + 20)
01:1379 : f0 1c __ BEQ $1397 ; (krill_init.s3 + 0)
.s1:
01:137b : a9 af __ LDA #$af
01:137d : a0 02 __ LDY #$02
01:137f : 91 23 __ STA (SP + 0),y 
01:1381 : a9 13 __ LDA #$13
01:1383 : c8 __ __ INY
01:1384 : 91 23 __ STA (SP + 0),y 
01:1386 : ad fe 15 LDA $15fe ; (krillvar + 20)
01:1389 : c8 __ __ INY
01:138a : 91 23 __ STA (SP + 0),y 
01:138c : a9 00 __ LDA #$00
01:138e : c8 __ __ INY
01:138f : 91 23 __ STA (SP + 0),y 
01:1391 : 20 4a 20 JSR $204a ; (printf.s0 + 0)
01:1394 : 20 4c 28 JSR $284c ; (exit@proxy + 0)
.s3:
01:1397 : 78 __ __ SEI
01:1398 : a9 d5 __ LDA #$d5
01:139a : 8d 14 03 STA $0314 
01:139d : a9 13 __ LDA #$13
01:139f : 8d 15 03 STA $0315 
01:13a2 : 58 __ __ CLI
.s1001:
01:13a3 : 18 __ __ CLC
01:13a4 : a5 23 __ LDA SP + 0 
01:13a6 : 69 06 __ ADC #$06
01:13a8 : 85 23 __ STA SP + 0 
01:13aa : 90 02 __ BCC $13ae ; (krill_init.s1001 + 11)
01:13ac : e6 24 __ INC SP + 1 
01:13ae : 60 __ __ RTS
--------------------------------------------------------------------
01:13af : __ __ __ BYT 45 52 52 4f 52 20 49 4e 20 49 4e 53 54 41 4c 4c : ERROR IN INSTALL
01:13bf : __ __ __ BYT 49 4e 47 2e 20 45 52 52 4f 52 20 43 4f 44 45 3a : ING. ERROR CODE:
01:13cf : __ __ __ BYT 20 25 55 2e 0a 00                               :  %U...
--------------------------------------------------------------------
krill_interrupt: ; krill_interrupt
01:13d5 : 20 24 c0 JSR $c024 
01:13d8 : 90 03 __ BCC $13dd ; (krill_interrupt + 8)
01:13da : 20 f8 f5 JSR $f5f8 
01:13dd : 4c 33 ff JMP $ff33 
--------------------------------------------------------------------
krill_load_core: ; krill_load_core()->void
.s0:
01:13e0 : ad fc 15 LDA $15fc ; (krillvar + 18)
01:13e3 : 8d 00 ff STA $ff00 
01:13e6 : a9 ea __ LDA #$ea
01:13e8 : 85 44 __ STA T1 + 0 
01:13ea : a9 00 __ LDA #$00
01:13ec : 85 43 __ STA T0 + 0 
01:13ee : a9 15 __ LDA #$15
01:13f0 : 85 45 __ STA T2 + 0 
01:13f2 : a6 44 __ LDX T1 + 0 
01:13f4 : a4 45 __ LDY T2 + 0 
01:13f6 : 38 __ __ SEC
01:13f7 : 20 00 0b JSR $0b00 
01:13fa : b0 02 __ BCS $13fe ; (krill_load_core.s0 + 30)
01:13fc : a9 00 __ LDA #$00
01:13fe : 85 43 __ STA T0 + 0 
01:1400 : a9 00 __ LDA #$00
01:1402 : 8d fe 15 STA $15fe ; (krillvar + 20)
01:1405 : ad fd 15 LDA $15fd ; (krillvar + 19)
01:1408 : 8d 00 ff STA $ff00 
.s1001:
01:140b : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:140c : a9 0e __ LDA #$0e
01:140e : 85 0d __ STA P0 
01:1410 : a9 75 __ LDA #$75
01:1412 : 85 0e __ STA P1 
01:1414 : a9 6d __ LDA #$6d
01:1416 : 85 0f __ STA P2 
01:1418 : a5 46 __ LDA $46 
01:141a : 85 12 __ STA P5 
01:141c : a9 00 __ LDA #$00
01:141e : 85 13 __ STA P6 
--------------------------------------------------------------------
bnk_cpyfromvdc: ; bnk_cpyfromvdc(u8,volatile u8*,u16,u16)->void
.s0:
01:1420 : ad 00 ff LDA $ff00 
01:1423 : 85 1d __ STA ACCU + 2 
01:1425 : a6 12 __ LDX P5 ; (size + 0)
.l110:
01:1427 : 8a __ __ TXA
01:1428 : 05 13 __ ORA P6 ; (size + 1)
01:142a : d0 06 __ BNE $1432 ; (bnk_cpyfromvdc.s2 + 0)
.s3:
01:142c : a5 1d __ LDA ACCU + 2 
01:142e : 8d 00 ff STA $ff00 
.s1001:
01:1431 : 60 __ __ RTS
.s2:
01:1432 : a9 0e __ LDA #$0e
01:1434 : 8d 00 ff STA $ff00 
01:1437 : a5 10 __ LDA P3 ; (vdcsrc + 0)
01:1439 : a8 __ __ TAY
01:143a : 18 __ __ CLC
01:143b : 69 01 __ ADC #$01
01:143d : 85 10 __ STA P3 ; (vdcsrc + 0)
01:143f : a5 11 __ LDA P4 ; (vdcsrc + 1)
01:1441 : 85 1b __ STA ACCU + 0 
01:1443 : 69 00 __ ADC #$00
01:1445 : 85 11 __ STA P4 ; (vdcsrc + 1)
01:1447 : a9 12 __ LDA #$12
01:1449 : 8d 00 d6 STA $d600 
.l111:
01:144c : 2c 00 d6 BIT $d600 
01:144f : 10 fb __ BPL $144c ; (bnk_cpyfromvdc.l111 + 0)
.s10:
01:1451 : a5 1b __ LDA ACCU + 0 
01:1453 : 8d 01 d6 STA $d601 
01:1456 : a9 13 __ LDA #$13
01:1458 : 8d 00 d6 STA $d600 
.l113:
01:145b : 2c 00 d6 BIT $d600 
01:145e : 10 fb __ BPL $145b ; (bnk_cpyfromvdc.l113 + 0)
.s15:
01:1460 : 8c 01 d6 STY $d601 
01:1463 : a9 1f __ LDA #$1f
01:1465 : 8d 00 d6 STA $d600 
.l115:
01:1468 : 2c 00 d6 BIT $d600 
01:146b : 10 fb __ BPL $1468 ; (bnk_cpyfromvdc.l115 + 0)
.s19:
01:146d : a5 0d __ LDA P0 ; (dcr + 0)
01:146f : ac 01 d6 LDY $d601 
01:1472 : 8d 00 ff STA $ff00 
01:1475 : a5 0e __ LDA P1 ; (dp + 0)
01:1477 : 85 1b __ STA ACCU + 0 
01:1479 : 18 __ __ CLC
01:147a : 69 01 __ ADC #$01
01:147c : 85 0e __ STA P1 ; (dp + 0)
01:147e : a5 0f __ LDA P2 ; (dp + 1)
01:1480 : 85 1c __ STA ACCU + 1 
01:1482 : 69 00 __ ADC #$00
01:1484 : 85 0f __ STA P2 ; (dp + 1)
01:1486 : 98 __ __ TYA
01:1487 : a0 00 __ LDY #$00
01:1489 : 91 1b __ STA (ACCU + 0),y 
01:148b : a9 0e __ LDA #$0e
01:148d : 8d 00 ff STA $ff00 
01:1490 : ca __ __ DEX
01:1491 : e0 ff __ CPX #$ff
01:1493 : d0 92 __ BNE $1427 ; (bnk_cpyfromvdc.l110 + 0)
.s1008:
01:1495 : c6 13 __ DEC P6 ; (size + 1)
01:1497 : 4c 27 14 JMP $1427 ; (bnk_cpyfromvdc.l110 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:149a : a9 0e __ LDA #$0e
01:149c : 85 11 __ STA P4 
01:149e : a9 75 __ LDA #$75
01:14a0 : 85 12 __ STA P5 
01:14a2 : a9 6d __ LDA #$6d
01:14a4 : 85 13 __ STA P6 
01:14a6 : a9 00 __ LDA #$00
01:14a8 : 85 15 __ STA P8 
--------------------------------------------------------------------
bnk_cpytovdc: ; bnk_cpytovdc(u16,u8,volatile u8*,u16)->void
.s0:
01:14aa : ad 00 ff LDA $ff00 
01:14ad : 85 43 __ STA T0 + 0 
01:14af : a9 0e __ LDA #$0e
01:14b1 : 8d 00 ff STA $ff00 
01:14b4 : 20 46 2b JSR $2b46 ; (vdc_mem_addr@proxy + 0)
01:14b7 : a5 14 __ LDA P7 ; (size + 0)
01:14b9 : 05 15 __ ORA P8 ; (size + 1)
01:14bb : d0 06 __ BNE $14c3 ; (bnk_cpytovdc.s1008 + 0)
.s3:
01:14bd : a5 43 __ LDA T0 + 0 
01:14bf : 8d 00 ff STA $ff00 
.s1001:
01:14c2 : 60 __ __ RTS
.s1008:
01:14c3 : a6 14 __ LDX P7 ; (size + 0)
.l2:
01:14c5 : a5 11 __ LDA P4 ; (scr + 0)
01:14c7 : 8d 00 ff STA $ff00 
01:14ca : a0 00 __ LDY #$00
01:14cc : b1 12 __ LDA (P5),y ; (sp + 0)
01:14ce : a8 __ __ TAY
01:14cf : e6 12 __ INC P5 ; (sp + 0)
01:14d1 : d0 02 __ BNE $14d5 ; (bnk_cpytovdc.s1010 + 0)
.s1009:
01:14d3 : e6 13 __ INC P6 ; (sp + 1)
.s1010:
01:14d5 : a9 0e __ LDA #$0e
01:14d7 : 8d 00 ff STA $ff00 
.l52:
01:14da : 2c 00 d6 BIT $d600 
01:14dd : 10 fb __ BPL $14da ; (bnk_cpytovdc.l52 + 0)
.s6:
01:14df : 8c 01 d6 STY $d601 
01:14e2 : 8a __ __ TXA
01:14e3 : d0 02 __ BNE $14e7 ; (bnk_cpytovdc.s1005 + 0)
.s1004:
01:14e5 : c6 15 __ DEC P8 ; (size + 1)
.s1005:
01:14e7 : ca __ __ DEX
01:14e8 : d0 db __ BNE $14c5 ; (bnk_cpytovdc.l2 + 0)
.s1006:
01:14ea : a5 15 __ LDA P8 ; (size + 1)
01:14ec : d0 d7 __ BNE $14c5 ; (bnk_cpytovdc.l2 + 0)
01:14ee : 4c bd 14 JMP $14bd ; (bnk_cpytovdc.s3 + 0)
--------------------------------------------------------------------
sid_startmusic: ; sid_startmusic()->void
.s0:
01:14f1 : ad 00 ff LDA $ff00 
01:14f4 : 85 43 __ STA T0 + 0 
01:14f6 : a9 7e __ LDA #$7e
01:14f8 : 8d 00 ff STA $ff00 
01:14fb : 78 __ __ SEI
01:14fc : a9 7e __ LDA #$7e
01:14fe : 8d 00 ff STA $ff00 
01:1501 : a9 00 __ LDA #$00
01:1503 : 20 00 20 JSR $2000 ; (bnk_init.s0 + 2)
01:1506 : ad 14 03 LDA $0314 
01:1509 : 8d ff 15 STA $15ff ; (sid_irq + 0)
01:150c : a9 23 __ LDA #$23
01:150e : 8d 14 03 STA $0314 
01:1511 : ad 15 03 LDA $0315 
01:1514 : 8d 00 16 STA $1600 ; (sid_irq + 1)
01:1517 : a9 15 __ LDA #$15
01:1519 : 8d 15 03 STA $0315 
01:151c : 58 __ __ CLI
01:151d : a5 43 __ LDA T0 + 0 
01:151f : 8d 00 ff STA $ff00 
.s1001:
01:1522 : 60 __ __ RTS
--------------------------------------------------------------------
sid_interrupt: ; sid_interrupt
01:1523 : ad 01 16 LDA $1601 ; (sid_pause + 0)
01:1526 : d0 20 __ BNE $1548 ; (sid_interrupt + 37)
01:1528 : ad 00 ff LDA $ff00 
01:152b : 8d 02 16 STA $1602 ; (sid_oldcr + 0)
01:152e : a9 7e __ LDA #$7e
01:1530 : 8d 00 ff STA $ff00 
01:1533 : 20 03 20 JSR $2003 ; (bnk_init.s0 + 5)
01:1536 : ad 02 16 LDA $1602 ; (sid_oldcr + 0)
01:1539 : 8d 00 ff STA $ff00 
01:153c : ad ff 15 LDA $15ff ; (sid_irq + 0)
01:153f : 8d 49 15 STA $1549 ; (sid_interrupt + 38)
01:1542 : ad 00 16 LDA $1600 ; (sid_irq + 1)
01:1545 : 8d 4a 15 STA $154a ; (sid_interrupt + 39)
01:1548 : 4c 65 fa JMP $fa65 
--------------------------------------------------------------------
bnk_writeb: ; bnk_writeb(u8,volatile u8*,u8)->void
.s0:
01:154b : a9 0e __ LDA #$0e
01:154d : ae 00 ff LDX $ff00 
01:1550 : 8d 00 ff STA $ff00 
01:1553 : a5 0f __ LDA P2 ; (b + 0)
01:1555 : a0 00 __ LDY #$00
01:1557 : 91 0d __ STA (P0),y ; (p + 0)
01:1559 : 8e 00 ff STX $ff00 
.s1001:
01:155c : 60 __ __ RTS
--------------------------------------------------------------------
bnk_readb: ; bnk_readb(u8,volatile u8*)->u8
.s0:
01:155d : a5 0d __ LDA P0 ; (cr + 0)
01:155f : ae 00 ff LDX $ff00 
01:1562 : 8d 00 ff STA $ff00 
01:1565 : a0 00 __ LDY #$00
01:1567 : b1 0e __ LDA (P1),y ; (p + 0)
01:1569 : 8e 00 ff STX $ff00 
.s1001:
01:156c : 60 __ __ RTS
--------------------------------------------------------------------
sid_stopmusic: ; sid_stopmusic()->void
.s0:
01:156d : 78 __ __ SEI
01:156e : ae ff 15 LDX $15ff ; (sid_irq + 0)
01:1571 : ac 00 16 LDY $1600 ; (sid_irq + 1)
01:1574 : 8e 14 03 STX $0314 
01:1577 : 8c 15 03 STY $0315 
01:157a : 58 __ __ CLI
--------------------------------------------------------------------
sid_resetsid: ; sid_resetsid()->void
.s0:
01:157b : a2 18 __ LDX #$18
01:157d : a9 00 __ LDA #$00
01:157f : 9d 00 d4 STA $d400,x 
01:1582 : ca __ __ DEX
01:1583 : 10 fa __ BPL $157f ; (sid_resetsid.s0 + 4)
01:1585 : a9 08 __ LDA #$08
01:1587 : 8d 04 d4 STA $d404 
01:158a : 8d 0b d4 STA $d40b 
01:158d : 8d 12 d4 STA $d412 
01:1590 : a2 03 __ LDX #$03
01:1592 : 2c 11 d0 BIT $d011 
01:1595 : 10 fb __ BPL $1592 ; (sid_resetsid.s0 + 23)
01:1597 : 2c 11 d0 BIT $d011 
01:159a : 30 fb __ BMI $1597 ; (sid_resetsid.s0 + 28)
01:159c : ca __ __ DEX
01:159d : 10 f3 __ BPL $1592 ; (sid_resetsid.s0 + 23)
01:159f : a9 00 __ LDA #$00
01:15a1 : 8d 04 d4 STA $d404 
01:15a4 : 8d 0b d4 STA $d40b 
01:15a7 : 8d 12 d4 STA $d412 
01:15aa : a9 00 __ LDA #$00
01:15ac : 8d 18 d4 STA $d418 
.s1001:
01:15af : 60 __ __ RTS
--------------------------------------------------------------------
krill_done: ; krill_done()->void
.s0:
01:15b0 : 78 __ __ SEI
01:15b1 : a9 65 __ LDA #$65
01:15b3 : 8d 14 03 STA $0314 
01:15b6 : a9 fa __ LDA #$fa
01:15b8 : 8d 15 03 STA $0315 
01:15bb : 58 __ __ CLI
01:15bc : 20 91 0e JSR $0e91 
.s1001:
01:15bf : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:15c0 : a9 0e __ LDA #$0e
01:15c2 : 85 0d __ STA P0 
01:15c4 : a9 75 __ LDA #$75
01:15c6 : 85 0e __ STA P1 
01:15c8 : a9 6d __ LDA #$6d
01:15ca : 85 0f __ STA P2 
01:15cc : a5 47 __ LDA $47 
01:15ce : 85 12 __ STA P5 
01:15d0 : a9 00 __ LDA #$00
01:15d2 : 85 13 __ STA P6 
01:15d4 : 4c 20 14 JMP $1420 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:15d7 : a9 0e __ LDA #$0e
01:15d9 : 85 0d __ STA P0 
01:15db : a9 75 __ LDA #$75
01:15dd : 85 0e __ STA P1 
01:15df : a9 6d __ LDA #$6d
01:15e1 : 85 0f __ STA P2 
01:15e3 : a9 00 __ LDA #$00
01:15e5 : 85 13 __ STA P6 
01:15e7 : 4c 20 14 JMP $1420 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
krillvar:
01:15ea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:15fa : __ __ __ BYT 00 00 00 00 00                                  : .....
--------------------------------------------------------------------
sid_irq:
01:15ff : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
sid_pause:
01:1601 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sid_oldcr:
01:1602 : __ __ __ BYT 00                                              : .
