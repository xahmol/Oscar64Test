; Compiled with 1.27.237
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
1c13 : 8e ff 37 STX $37ff ; (spentry + 0)
1c16 : a9 c3 __ LDA #$c3
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 6d __ LDA #$6d
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 6e __ LDA #$6e
1c21 : e9 6d __ SBC #$6d
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
1c50 : a9 10 __ LDA #$10
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
1c80 : a2 04 __ LDX #$04
1c82 : b5 53 __ LDA T0 + 0,x 
1c84 : 9d 12 be STA $be12,x ; (main@stack + 0)
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
1ca0 : 8d dc 6c STA $6cdc ; (winCfg + 0)
1ca3 : a9 08 __ LDA #$08
1ca5 : 8d 0e dc STA $dc0e 
1ca8 : 8d 0f dc STA $dc0f 
1cab : 8d 0e dd STA $dd0e 
1cae : 8d 0f dd STA $dd0f 
1cb1 : a9 00 __ LDA #$00
1cb3 : 8d 03 dc STA $dc03 
1cb6 : 8d 03 dd STA $dd03 
1cb9 : 8d df 6c STA $6cdf ; (winCfg + 3)
1cbc : 8d e1 6c STA $6ce1 ; (winCfg + 5)
1cbf : 8d dd 6c STA $6cdd ; (winCfg + 1)
1cc2 : 8d e2 6c STA $6ce2 ; (winCfg + 6)
1cc5 : a9 ff __ LDA #$ff
1cc7 : 8d 02 dc STA $dc02 
1cca : a9 07 __ LDA #$07
1ccc : 8d 01 dd STA $dd01 
1ccf : a9 3f __ LDA #$3f
1cd1 : 8d 02 dd STA $dd02 
1cd4 : a9 20 __ LDA #$20
1cd6 : 8d e0 6c STA $6ce0 ; (winCfg + 4)
1cd9 : a9 a8 __ LDA #$a8
1cdb : 8d de 6c STA $6cde ; (winCfg + 2)
1cde : 8d e3 6c STA $6ce3 ; (winCfg + 7)
1ce1 : 20 00 20 JSR $2000 ; (vdc_init.s1000 + 0)
1ce4 : a9 00 __ LDA #$00
1ce6 : 85 0f __ STA P2 
1ce8 : 85 10 __ STA P3 
1cea : a9 5f __ LDA #$5f
1cec : 85 11 __ STA P4 
1cee : a9 2e __ LDA #$2e
1cf0 : 85 12 __ STA P5 
1cf2 : ad eb 6c LDA $6ceb ; (vdc_state + 7)
1cf5 : 85 54 __ STA T1 + 0 
1cf7 : 85 13 __ STA P6 
1cf9 : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
1cfc : a9 90 __ LDA #$90
1cfe : a0 02 __ LDY #$02
1d00 : 91 23 __ STA (SP + 0),y 
1d02 : a9 6e __ LDA #$6e
1d04 : c8 __ __ INY
1d05 : 91 23 __ STA (SP + 0),y 
1d07 : a9 c7 __ LDA #$c7
1d09 : c8 __ __ INY
1d0a : 91 23 __ STA (SP + 0),y 
1d0c : a9 2f __ LDA #$2f
1d0e : c8 __ __ INY
1d0f : 91 23 __ STA (SP + 0),y 
1d11 : ad e4 6c LDA $6ce4 ; (vdc_state + 0)
1d14 : c8 __ __ INY
1d15 : 91 23 __ STA (SP + 0),y 
1d17 : a9 00 __ LDA #$00
1d19 : c8 __ __ INY
1d1a : 91 23 __ STA (SP + 0),y 
1d1c : ad e5 6c LDA $6ce5 ; (vdc_state + 1)
1d1f : d0 07 __ BNE $1d28 ; (main.s70 + 0)
.s71:
1d21 : a9 30 __ LDA #$30
1d23 : a2 00 __ LDX #$00
1d25 : 4c 2c 1d JMP $1d2c ; (main.s72 + 0)
.s70:
1d28 : a9 2f __ LDA #$2f
1d2a : a2 fc __ LDX #$fc
.s72:
1d2c : 85 56 __ STA T2 + 1 
1d2e : 8a __ __ TXA
1d2f : a0 08 __ LDY #$08
1d31 : 91 23 __ STA (SP + 0),y 
1d33 : a5 56 __ LDA T2 + 1 
1d35 : c8 __ __ INY
1d36 : 91 23 __ STA (SP + 0),y 
1d38 : 20 99 2f JSR $2f99 ; (sprintf.s0 + 0)
1d3b : a9 02 __ LDA #$02
1d3d : 85 10 __ STA P3 
1d3f : 20 79 67 JSR $6779 ; (vdc_prints_attr@proxy + 0)
1d42 : a9 04 __ LDA #$04
1d44 : 85 10 __ STA P3 
1d46 : a9 04 __ LDA #$04
1d48 : 85 11 __ STA P4 
1d4a : a9 30 __ LDA #$30
1d4c : 85 12 __ STA P5 
1d4e : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
1d51 : e6 10 __ INC P3 
1d53 : a9 14 __ LDA #$14
1d55 : 85 11 __ STA P4 
1d57 : a9 30 __ LDA #$30
1d59 : 85 12 __ STA P5 
1d5b : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
1d5e : ad ff 3e LDA $3eff ; (bootdevice + 0)
1d61 : 85 54 __ STA T1 + 0 
1d63 : 85 0f __ STA P2 
1d65 : a9 40 __ LDA #$40
1d67 : 85 11 __ STA P4 
1d69 : a9 33 __ LDA #$33
1d6b : 85 12 __ STA P5 
1d6d : a9 30 __ LDA #$30
1d6f : 85 13 __ STA P6 
1d71 : 20 3f 15 JSR $153f ; (bnk_load@proxy + 0)
1d74 : a9 01 __ LDA #$01
1d76 : 85 57 __ STA T4 + 0 
1d78 : a5 1b __ LDA ACCU + 0 
1d7a : d0 06 __ BNE $1d82 ; (main.s10 + 0)
.s8:
1d7c : 20 3b 30 JSR $303b ; (menu_fileerrormessage.s1000 + 0)
1d7f : 20 5f 2b JSR $2b5f ; (exit@proxy + 0)
.s10:
1d82 : a9 06 __ LDA #$06
1d84 : 85 10 __ STA P3 
1d86 : a9 27 __ LDA #$27
1d88 : 85 11 __ STA P4 
1d8a : a9 37 __ LDA #$37
1d8c : 85 12 __ STA P5 
1d8e : 20 8c 67 JSR $678c ; (vdc_prints_attr@proxy + 0)
1d91 : a5 54 __ LDA T1 + 0 
1d93 : 85 0f __ STA P2 
1d95 : a9 53 __ LDA #$53
1d97 : 85 12 __ STA P5 
1d99 : a9 37 __ LDA #$37
1d9b : 85 13 __ STA P6 
1d9d : 20 5b 13 JSR $135b ; (bnk_load@proxy + 0)
1da0 : a5 1b __ LDA ACCU + 0 
1da2 : d0 06 __ BNE $1daa ; (main.l41 + 0)
.s12:
1da4 : 20 3b 30 JSR $303b ; (menu_fileerrormessage.s1000 + 0)
1da7 : 20 5f 2b JSR $2b5f ; (exit@proxy + 0)
.l41:
1daa : 20 7d 14 JSR $147d ; (sid_startmusic.s0 + 0)
.l15:
1dad : 20 40 21 JSR $2140 ; (vdc_cls.s0 + 0)
1db0 : 20 7a 2e JSR $2e7a ; (menu_placeheader.s0 + 0)
1db3 : a9 01 __ LDA #$01
1db5 : 85 14 __ STA P7 
1db7 : 20 6c 37 JSR $376c ; (menu_placebar.s0 + 0)
1dba : a9 7f __ LDA #$7f
1dbc : 8d 18 be STA $be18 ; (vp_logo + 0)
1dbf : a9 a0 __ LDA #$a0
1dc1 : 8d 1b be STA $be1b ; (vp_logo + 3)
1dc4 : a9 00 __ LDA #$00
1dc6 : 8d 19 be STA $be19 ; (vp_logo + 1)
1dc9 : 8d 1c be STA $be1c ; (vp_logo + 4)
1dcc : 8d 1e be STA $be1e ; (vp_logo + 6)
1dcf : 8d 1f be STA $be1f ; (vp_logo + 7)
1dd2 : 8d 20 be STA $be20 ; (vp_logo + 8)
1dd5 : 8d 21 be STA $be21 ; (vp_logo + 9)
1dd8 : 8d 22 be STA $be22 ; (vp_logo + 10)
1ddb : a9 4b __ LDA #$4b
1ddd : 8d 1d be STA $be1d ; (vp_logo + 5)
1de0 : a9 10 __ LDA #$10
1de2 : 85 0f __ STA P2 
1de4 : a9 30 __ LDA #$30
1de6 : 85 11 __ STA P4 
1de8 : a9 0c __ LDA #$0c
1dea : 85 12 __ STA P5 
1dec : a9 40 __ LDA #$40
1dee : 8d 1a be STA $be1a ; (vp_logo + 2)
1df1 : a9 23 __ LDA #$23
1df3 : 85 0d __ STA P0 
1df5 : a9 be __ LDA #$be
1df7 : 85 0e __ STA P1 
1df9 : ad ea 6c LDA $6cea ; (vdc_state + 6)
1dfc : 4a __ __ LSR
1dfd : ad e9 6c LDA $6ce9 ; (vdc_state + 5)
1e00 : 85 53 __ STA T0 + 0 
1e02 : 6a __ __ ROR
1e03 : 38 __ __ SEC
1e04 : e9 06 __ SBC #$06
1e06 : 85 10 __ STA P3 
1e08 : 20 8d 32 JSR $328d ; (vdcwin_init.s0 + 0)
1e0b : a9 10 __ LDA #$10
1e0d : 8d 1f be STA $be1f ; (vp_logo + 7)
1e10 : a9 00 __ LDA #$00
1e12 : 8d 20 be STA $be20 ; (vp_logo + 8)
1e15 : 8d 22 be STA $be22 ; (vp_logo + 10)
1e18 : a9 90 __ LDA #$90
1e1a : a0 02 __ LDY #$02
1e1c : 91 23 __ STA (SP + 0),y 
1e1e : a9 6e __ LDA #$6e
1e20 : c8 __ __ INY
1e21 : 91 23 __ STA (SP + 0),y 
1e23 : a9 c7 __ LDA #$c7
1e25 : c8 __ __ INY
1e26 : 91 23 __ STA (SP + 0),y 
1e28 : a9 2f __ LDA #$2f
1e2a : c8 __ __ INY
1e2b : 91 23 __ STA (SP + 0),y 
1e2d : ad e4 6c LDA $6ce4 ; (vdc_state + 0)
1e30 : c8 __ __ INY
1e31 : 8c 21 be STY $be21 ; (vp_logo + 9)
1e34 : 91 23 __ STA (SP + 0),y 
1e36 : a9 00 __ LDA #$00
1e38 : c8 __ __ INY
1e39 : 91 23 __ STA (SP + 0),y 
1e3b : ad e5 6c LDA $6ce5 ; (vdc_state + 1)
1e3e : d0 07 __ BNE $1e47 ; (main.s73 + 0)
.s74:
1e40 : a9 30 __ LDA #$30
1e42 : a2 00 __ LDX #$00
1e44 : 4c 4b 1e JMP $1e4b ; (main.s75 + 0)
.s73:
1e47 : a9 2f __ LDA #$2f
1e49 : a2 fc __ LDX #$fc
.s75:
1e4b : 85 45 __ STA T5 + 1 
1e4d : 8a __ __ TXA
1e4e : a0 08 __ LDY #$08
1e50 : 91 23 __ STA (SP + 0),y 
1e52 : a5 45 __ LDA T5 + 1 
1e54 : c8 __ __ INY
1e55 : 91 23 __ STA (SP + 0),y 
1e57 : 20 99 2f JSR $2f99 ; (sprintf.s0 + 0)
1e5a : a9 00 __ LDA #$00
1e5c : 85 0f __ STA P2 
1e5e : a9 03 __ LDA #$03
1e60 : 85 10 __ STA P3 
1e62 : a9 90 __ LDA #$90
1e64 : 85 11 __ STA P4 
1e66 : a9 6e __ LDA #$6e
1e68 : 85 12 __ STA P5 
1e6a : ad eb 6c LDA $6ceb ; (vdc_state + 7)
1e6d : 85 54 __ STA T1 + 0 
1e6f : 85 13 __ STA P6 
1e71 : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
1e74 : a9 90 __ LDA #$90
1e76 : a0 02 __ LDY #$02
1e78 : 91 23 __ STA (SP + 0),y 
1e7a : a9 6e __ LDA #$6e
1e7c : c8 __ __ INY
1e7d : 91 23 __ STA (SP + 0),y 
1e7f : a9 f0 __ LDA #$f0
1e81 : c8 __ __ INY
1e82 : 91 23 __ STA (SP + 0),y 
1e84 : a9 37 __ LDA #$37
1e86 : c8 __ __ INY
1e87 : 91 23 __ STA (SP + 0),y 
1e89 : ad e6 6c LDA $6ce6 ; (vdc_state + 2)
1e8c : 85 1b __ STA ACCU + 0 
1e8e : a9 00 __ LDA #$00
1e90 : 85 1c __ STA ACCU + 1 
1e92 : a9 11 __ LDA #$11
1e94 : 20 2c 64 JSR $642c ; (mul16by8 + 0)
1e97 : 18 __ __ CLC
1e98 : a9 a1 __ LDA #$a1
1e9a : 65 05 __ ADC WORK + 2 
1e9c : a0 06 __ LDY #$06
1e9e : 91 23 __ STA (SP + 0),y 
1ea0 : a9 6b __ LDA #$6b
1ea2 : 69 00 __ ADC #$00
1ea4 : c8 __ __ INY
1ea5 : 91 23 __ STA (SP + 0),y 
1ea7 : 20 99 2f JSR $2f99 ; (sprintf.s0 + 0)
1eaa : a9 04 __ LDA #$04
1eac : 85 10 __ STA P3 
1eae : 20 79 67 JSR $6779 ; (vdc_prints_attr@proxy + 0)
1eb1 : 38 __ __ SEC
1eb2 : a5 53 __ LDA T0 + 0 
1eb4 : e9 04 __ SBC #$04
1eb6 : 85 10 __ STA P3 
1eb8 : a9 00 __ LDA #$00
1eba : 85 11 __ STA P4 
1ebc : a9 38 __ LDA #$38
1ebe : 85 12 __ STA P5 
1ec0 : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
1ec3 : e6 10 __ INC P3 
1ec5 : a9 3a __ LDA #$3a
1ec7 : 85 11 __ STA P4 
1ec9 : a9 38 __ LDA #$38
1ecb : 85 12 __ STA P5 
1ecd : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
1ed0 : e6 10 __ INC P3 
1ed2 : a9 7e __ LDA #$7e
1ed4 : 85 11 __ STA P4 
1ed6 : a9 38 __ LDA #$38
1ed8 : 85 12 __ STA P5 
1eda : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
1edd : a9 18 __ LDA #$18
1edf : 85 16 __ STA P9 
1ee1 : a9 be __ LDA #$be
1ee3 : 85 17 __ STA P10 
1ee5 : 20 b5 38 JSR $38b5 ; (vdcwin_cpy_viewport.s0 + 0)
1ee8 : 20 00 3a JSR $3a00 ; (menu_main.s1000 + 0)
1eeb : a5 1b __ LDA ACCU + 0 
1eed : 85 54 __ STA T1 + 0 
1eef : c9 29 __ CMP #$29
1ef1 : b0 03 __ BCS $1ef6 ; (main.s45 + 0)
1ef3 : 4c bf 1f JMP $1fbf ; (main.s47 + 0)
.s45:
1ef6 : c9 2b __ CMP #$2b
1ef8 : b0 0c __ BCS $1f06 ; (main.s46 + 0)
.s30:
1efa : 38 __ __ SEC
1efb : e9 29 __ SBC #$29
1efd : 8d ff bf STA $bfff ; (sstack + 8)
1f00 : 20 f5 59 JSR $59f5 ; (scroll_fullscreen_smooth.s1000 + 0)
1f03 : 4c 64 1f JMP $1f64 ; (main.s24 + 0)
.s46:
1f06 : c9 3d __ CMP #$3d
1f08 : b0 03 __ BCS $1f0d ; (main.s56 + 0)
1f0a : 4c ab 1f JMP $1fab ; (main.s58 + 0)
.s56:
1f0d : c9 3f __ CMP #$3f
1f0f : 90 03 __ BCC $1f14 ; (main.s33 + 0)
1f11 : 4c 9c 1f JMP $1f9c ; (main.s57 + 0)
.s33:
1f14 : 38 __ __ SEC
1f15 : e9 3c __ SBC #$3c
1f17 : 85 53 __ STA T0 + 0 
1f19 : 90 06 __ BCC $1f21 ; (main.s34 + 0)
.s1008:
1f1b : a5 57 __ LDA T4 + 0 
1f1d : c5 53 __ CMP T0 + 0 
1f1f : f0 43 __ BEQ $1f64 ; (main.s24 + 0)
.s34:
1f21 : 20 2e 15 JSR $152e ; (sid_stopmusic.s0 + 0)
1f24 : a9 90 __ LDA #$90
1f26 : a0 02 __ LDY #$02
1f28 : 91 23 __ STA (SP + 0),y 
1f2a : a9 6e __ LDA #$6e
1f2c : c8 __ __ INY
1f2d : 91 23 __ STA (SP + 0),y 
1f2f : a9 24 __ LDA #$24
1f31 : c8 __ __ INY
1f32 : 91 23 __ STA (SP + 0),y 
1f34 : a9 64 __ LDA #$64
1f36 : c8 __ __ INY
1f37 : 91 23 __ STA (SP + 0),y 
1f39 : a5 53 __ LDA T0 + 0 
1f3b : c8 __ __ INY
1f3c : 91 23 __ STA (SP + 0),y 
1f3e : a9 00 __ LDA #$00
1f40 : c8 __ __ INY
1f41 : 91 23 __ STA (SP + 0),y 
1f43 : 20 99 2f JSR $2f99 ; (sprintf.s0 + 0)
1f46 : a9 90 __ LDA #$90
1f48 : 85 12 __ STA P5 
1f4a : a9 6e __ LDA #$6e
1f4c : 85 13 __ STA P6 
1f4e : ad ff 3e LDA $3eff ; (bootdevice + 0)
1f51 : 85 0f __ STA P2 
1f53 : 20 5b 13 JSR $135b ; (bnk_load@proxy + 0)
1f56 : a5 1b __ LDA ACCU + 0 
1f58 : d0 03 __ BNE $1f5d ; (main.s94 + 0)
.s37:
1f5a : 20 3b 30 JSR $303b ; (menu_fileerrormessage.s1000 + 0)
.s94:
1f5d : a5 53 __ LDA T0 + 0 
1f5f : 85 57 __ STA T4 + 0 
1f61 : 20 7d 14 JSR $147d ; (sid_startmusic.s0 + 0)
.s24:
1f64 : a5 54 __ LDA T1 + 0 
1f66 : c9 0d __ CMP #$0d
1f68 : f0 03 __ BEQ $1f6d ; (main.s16 + 0)
1f6a : 4c ad 1d JMP $1dad ; (main.l15 + 0)
.s16:
1f6d : 20 2e 15 JSR $152e ; (sid_stopmusic.s0 + 0)
1f70 : a9 00 __ LDA #$00
1f72 : 20 7c 2b JSR $2b7c ; (fastmode.s0 + 0)
1f75 : 20 9b 2b JSR $2b9b ; (vdc_set_mode@proxy + 0)
1f78 : 20 40 21 JSR $2140 ; (vdc_cls.s0 + 0)
1f7b : a9 04 __ LDA #$04
1f7d : 8d 06 d5 STA $d506 
1f80 : a9 00 __ LDA #$00
1f82 : 85 1b __ STA ACCU + 0 
1f84 : 85 1c __ STA ACCU + 1 
.s1001:
1f86 : 18 __ __ CLC
1f87 : a5 23 __ LDA SP + 0 
1f89 : 69 0a __ ADC #$0a
1f8b : 85 23 __ STA SP + 0 
1f8d : 90 02 __ BCC $1f91 ; (main.s1001 + 11)
1f8f : e6 24 __ INC SP + 1 
1f91 : a2 04 __ LDX #$04
1f93 : bd 12 be LDA $be12,x ; (main@stack + 0)
1f96 : 95 53 __ STA T0 + 0,x 
1f98 : ca __ __ DEX
1f99 : 10 f8 __ BPL $1f93 ; (main.s1001 + 13)
1f9b : 60 __ __ RTS
.s57:
1f9c : d0 06 __ BNE $1fa4 ; (main.s61 + 0)
.s40:
1f9e : 20 2e 15 JSR $152e ; (sid_stopmusic.s0 + 0)
1fa1 : 4c ad 1d JMP $1dad ; (main.l15 + 0)
.s61:
1fa4 : c9 40 __ CMP #$40
1fa6 : d0 bc __ BNE $1f64 ; (main.s24 + 0)
1fa8 : 4c aa 1d JMP $1daa ; (main.l41 + 0)
.s58:
1fab : c9 2b __ CMP #$2b
1fad : d0 06 __ BNE $1fb5 ; (main.s59 + 0)
.s31:
1faf : 20 00 60 JSR $6000 ; (scroll_bigfont.s1000 + 0)
1fb2 : 4c ad 1d JMP $1dad ; (main.l15 + 0)
.s59:
1fb5 : c9 33 __ CMP #$33
1fb7 : d0 ab __ BNE $1f64 ; (main.s24 + 0)
.s32:
1fb9 : 20 f6 62 JSR $62f6 ; (charset_demo.s1000 + 0)
1fbc : 4c ad 1d JMP $1dad ; (main.l15 + 0)
.s47:
1fbf : c9 15 __ CMP #$15
1fc1 : d0 06 __ BNE $1fc9 ; (main.s48 + 0)
.s27:
1fc3 : 20 00 40 JSR $4000 ; (windows_windowstacking.s1000 + 0)
1fc6 : 4c ad 1d JMP $1dad ; (main.l15 + 0)
.s48:
1fc9 : 90 1e __ BCC $1fe9 ; (main.s50 + 0)
.s49:
1fcb : c9 16 __ CMP #$16
1fcd : d0 06 __ BNE $1fd5 ; (main.s53 + 0)
.s28:
1fcf : 20 77 48 JSR $4877 ; (windows_textinput.s1000 + 0)
1fd2 : 4c ad 1d JMP $1dad ; (main.l15 + 0)
.s53:
1fd5 : c9 1f __ CMP #$1f
1fd7 : 90 8b __ BCC $1f64 ; (main.s24 + 0)
.s55:
1fd9 : c9 21 __ CMP #$21
1fdb : b0 87 __ BCS $1f64 ; (main.s24 + 0)
.s29:
1fdd : 38 __ __ SEC
1fde : e9 1f __ SBC #$1f
1fe0 : 8d ff bf STA $bfff ; (sstack + 8)
1fe3 : 20 96 52 JSR $5296 ; (viewport_demo.s1000 + 0)
1fe6 : 4c ad 1d JMP $1dad ; (main.l15 + 0)
.s50:
1fe9 : c9 0b __ CMP #$0b
1feb : d0 06 __ BNE $1ff3 ; (main.s51 + 0)
.s25:
1fed : 20 7d 3d JSR $3d7d ; (settings_screenmode.s1000 + 0)
1ff0 : 4c ad 1d JMP $1dad ; (main.l15 + 0)
.s51:
1ff3 : c9 0c __ CMP #$0c
1ff5 : f0 03 __ BEQ $1ffa ; (main.s26 + 0)
1ff7 : 4c 64 1f JMP $1f64 ; (main.s24 + 0)
.s26:
1ffa : 20 fa 3d JSR $3dfa ; (settings_versioninfo.s1000 + 0)
1ffd : 4c ad 1d JMP $1dad ; (main.l15 + 0)
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
2000 : 38 __ __ SEC
2001 : a5 23 __ LDA SP + 0 
2003 : e9 04 __ SBC #$04
2005 : 85 23 __ STA SP + 0 
2007 : b0 02 __ BCS $200b ; (vdc_init.s0 + 0)
2009 : c6 24 __ DEC SP + 1 
.s0:
200b : a9 1a __ LDA #$1a
200d : 8d 00 d6 STA $d600 
.l128:
2010 : 2c 00 d6 BIT $d600 
2013 : 10 fb __ BPL $2010 ; (vdc_init.l128 + 0)
.s7:
2015 : ad 01 d6 LDA $d601 
2018 : 29 f0 __ AND #$f0
201a : aa __ __ TAX
201b : a9 1a __ LDA #$1a
201d : 8d 00 d6 STA $d600 
.l130:
2020 : 2c 00 d6 BIT $d600 
2023 : 10 fb __ BPL $2020 ; (vdc_init.l130 + 0)
.s13:
2025 : 8e 01 d6 STX $d601 
2028 : 8d 00 d6 STA $d600 
.l132:
202b : 2c 00 d6 BIT $d600 
202e : 10 fb __ BPL $202b ; (vdc_init.l132 + 0)
.s20:
2030 : ad 01 d6 LDA $d601 
2033 : 29 0f __ AND #$0f
2035 : 09 d0 __ ORA #$d0
2037 : a2 1a __ LDX #$1a
2039 : 8e 00 d6 STX $d600 
.l134:
203c : 2c 00 d6 BIT $d600 
203f : 10 fb __ BPL $203c ; (vdc_init.l134 + 0)
.s26:
2041 : 8d 01 d6 STA $d601 
2044 : a9 8d __ LDA #$8d
2046 : 8d eb 6c STA $6ceb ; (vdc_state + 7)
2049 : 20 88 20 JSR $2088 ; (vdc_detect_mem_size.s0 + 0)
204c : 24 d7 __ BIT $d7 
204e : 30 17 __ BMI $2067 ; (vdc_init.s29 + 0)
.s32:
2050 : a9 79 __ LDA #$79
2052 : a0 02 __ LDY #$02
2054 : 91 23 __ STA (SP + 0),y 
2056 : a9 29 __ LDA #$29
2058 : c8 __ __ INY
2059 : 91 23 __ STA (SP + 0),y 
205b : 20 52 22 JSR $2252 ; (printf.s0 + 0)
205e : 20 a4 29 JSR $29a4 ; (getch.s0 + 0)
2061 : 20 81 ff JSR $ff81 
2064 : 20 e4 29 JSR $29e4 ; (screen_setmode.s0 + 0)
.s29:
2067 : 20 ec 29 JSR $29ec ; (bnk_init.s1000 + 0)
206a : a9 01 __ LDA #$01
206c : 20 7c 2b JSR $2b7c ; (fastmode.s0 + 0)
206f : 20 9b 2b JSR $2b9b ; (vdc_set_mode@proxy + 0)
2072 : ad e4 6c LDA $6ce4 ; (vdc_state + 0)
2075 : c9 40 __ CMP #$40
2077 : d0 03 __ BNE $207c ; (vdc_init.s1001 + 0)
.s39:
2079 : 20 89 2d JSR $2d89 ; (vdc_set_extended_memsize.s0 + 0)
.s1001:
207c : 18 __ __ CLC
207d : a5 23 __ LDA SP + 0 
207f : 69 04 __ ADC #$04
2081 : 85 23 __ STA SP + 0 
2083 : 90 02 __ BCC $2087 ; (vdc_init.s1001 + 11)
2085 : e6 24 __ INC SP + 1 
2087 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_detect_mem_size: ; vdc_detect_mem_size()->void
.s0:
2088 : a9 1c __ LDA #$1c
208a : 8d 00 d6 STA $d600 
.l335:
208d : 2c 00 d6 BIT $d600 
2090 : 10 fb __ BPL $208d ; (vdc_detect_mem_size.l335 + 0)
.s5:
2092 : ad 01 d6 LDA $d601 
2095 : a8 __ __ TAY
2096 : 09 10 __ ORA #$10
2098 : a2 1c __ LDX #$1c
209a : 8e 00 d6 STX $d600 
.l337:
209d : 2c 00 d6 BIT $d600 
20a0 : 10 fb __ BPL $209d ; (vdc_detect_mem_size.l337 + 0)
.s12:
20a2 : 8d 01 d6 STA $d601 
20a5 : a9 12 __ LDA #$12
20a7 : 8d 00 d6 STA $d600 
.l339:
20aa : 2c 00 d6 BIT $d600 
20ad : 10 fb __ BPL $20aa ; (vdc_detect_mem_size.l339 + 0)
.s19:
20af : a9 1f __ LDA #$1f
20b1 : 8d 01 d6 STA $d601 
20b4 : a9 13 __ LDA #$13
20b6 : 8d 00 d6 STA $d600 
.l341:
20b9 : 2c 00 d6 BIT $d600 
20bc : 10 fb __ BPL $20b9 ; (vdc_detect_mem_size.l341 + 0)
.s24:
20be : a9 ff __ LDA #$ff
20c0 : 8d 01 d6 STA $d601 
20c3 : a9 1f __ LDA #$1f
20c5 : 8d 00 d6 STA $d600 
.l343:
20c8 : 2c 00 d6 BIT $d600 
20cb : 10 fb __ BPL $20c8 ; (vdc_detect_mem_size.l343 + 0)
.s28:
20cd : a9 00 __ LDA #$00
20cf : 8d 01 d6 STA $d601 
20d2 : a9 12 __ LDA #$12
20d4 : 8d 00 d6 STA $d600 
.l345:
20d7 : 2c 00 d6 BIT $d600 
20da : 10 fb __ BPL $20d7 ; (vdc_detect_mem_size.l345 + 0)
.s35:
20dc : a9 9f __ LDA #$9f
20de : 8d 01 d6 STA $d601 
20e1 : a9 13 __ LDA #$13
20e3 : 8d 00 d6 STA $d600 
.l347:
20e6 : 2c 00 d6 BIT $d600 
20e9 : 10 fb __ BPL $20e6 ; (vdc_detect_mem_size.l347 + 0)
.s40:
20eb : a9 ff __ LDA #$ff
20ed : 8d 01 d6 STA $d601 
20f0 : a9 1f __ LDA #$1f
20f2 : 8d 00 d6 STA $d600 
.l349:
20f5 : 2c 00 d6 BIT $d600 
20f8 : 10 fb __ BPL $20f5 ; (vdc_detect_mem_size.l349 + 0)
.s44:
20fa : a9 ff __ LDA #$ff
20fc : 8d 01 d6 STA $d601 
20ff : a9 12 __ LDA #$12
2101 : 8d 00 d6 STA $d600 
.l351:
2104 : 2c 00 d6 BIT $d600 
2107 : 10 fb __ BPL $2104 ; (vdc_detect_mem_size.l351 + 0)
.s51:
2109 : a9 1f __ LDA #$1f
210b : 8d 01 d6 STA $d601 
210e : a9 13 __ LDA #$13
2110 : 8d 00 d6 STA $d600 
.l353:
2113 : 2c 00 d6 BIT $d600 
2116 : 10 fb __ BPL $2113 ; (vdc_detect_mem_size.l353 + 0)
.s56:
2118 : a9 ff __ LDA #$ff
211a : 8d 01 d6 STA $d601 
211d : a9 1f __ LDA #$1f
211f : 8d 00 d6 STA $d600 
.l355:
2122 : 2c 00 d6 BIT $d600 
2125 : 10 fb __ BPL $2122 ; (vdc_detect_mem_size.l355 + 0)
.s60:
2127 : ad 01 d6 LDA $d601 
212a : f0 04 __ BEQ $2130 ; (vdc_detect_mem_size.s1026 + 0)
.s1027:
212c : a9 10 __ LDA #$10
212e : d0 02 __ BNE $2132 ; (vdc_detect_mem_size.s1028 + 0)
.s1026:
2130 : a9 40 __ LDA #$40
.s1028:
2132 : 8d e4 6c STA $6ce4 ; (vdc_state + 0)
2135 : 8e 00 d6 STX $d600 
.l358:
2138 : 2c 00 d6 BIT $d600 
213b : 10 fb __ BPL $2138 ; (vdc_detect_mem_size.l358 + 0)
.s67:
213d : 8c 01 d6 STY $d601 
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
2140 : a9 00 __ LDA #$00
2142 : 85 0f __ STA P2 
2144 : 85 14 __ STA P7 
2146 : a9 20 __ LDA #$20
2148 : 85 11 __ STA P4 
214a : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
214d : 85 13 __ STA P6 
214f : ad e9 6c LDA $6ce9 ; (vdc_state + 5)
2152 : 85 15 __ STA P8 
--------------------------------------------------------------------
vdc_clear: ; vdc_clear(u8,u8,u8,u8,u8)->void
.s0:
2154 : 18 __ __ CLC
2155 : a5 14 __ LDA P7 ; (y + 0)
2157 : 65 15 __ ADC P8 ; (lines + 0)
2159 : 85 46 __ STA T1 + 0 
215b : a9 00 __ LDA #$00
215d : 2a __ __ ROL
215e : 85 47 __ STA T1 + 1 
.l1:
2160 : f0 05 __ BEQ $2167 ; (vdc_clear.s1002 + 0)
.s1004:
2162 : a5 14 __ LDA P7 ; (y + 0)
2164 : 4c 6d 21 JMP $216d ; (vdc_clear.s2 + 0)
.s1002:
2167 : a5 14 __ LDA P7 ; (y + 0)
2169 : c5 46 __ CMP T1 + 0 
216b : b0 0c __ BCS $2179 ; (vdc_clear.s1001 + 0)
.s2:
216d : 85 10 __ STA P3 
216f : 20 7a 21 JSR $217a ; (vdc_hchar@proxy + 0)
2172 : e6 14 __ INC P7 ; (y + 0)
2174 : a5 47 __ LDA T1 + 1 
2176 : 4c 60 21 JMP $2160 ; (vdc_clear.l1 + 0)
.s1001:
2179 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_hchar@proxy: ; vdc_hchar@proxy
217a : ad eb 6c LDA $6ceb ; (vdc_state + 7)
217d : 85 12 __ STA P5 
--------------------------------------------------------------------
vdc_hchar: ; vdc_hchar(u8,u8,u8,u8,u8)->void
.s0:
217f : a5 10 __ LDA P3 ; (y + 0)
2181 : 0a __ __ ASL
2182 : aa __ __ TAX
2183 : bd 00 6e LDA $6e00,x ; (multab + 0)
2186 : 18 __ __ CLC
2187 : 65 0f __ ADC P2 ; (x + 0)
2189 : 85 43 __ STA T1 + 0 
218b : bd 01 6e LDA $6e01,x ; (multab + 1)
218e : 69 00 __ ADC #$00
2190 : 85 44 __ STA T1 + 1 
2192 : ad ec 6c LDA $6cec ; (vdc_state + 8)
2195 : 18 __ __ CLC
2196 : 65 43 __ ADC T1 + 0 
2198 : 85 0d __ STA P0 
219a : ad ed 6c LDA $6ced ; (vdc_state + 9)
219d : 65 44 __ ADC T1 + 1 
219f : 85 0e __ STA P1 
21a1 : 20 2e 22 JSR $222e ; (vdc_mem_addr.s0 + 0)
21a4 : a6 13 __ LDX P6 ; (length + 0)
21a6 : ca __ __ DEX
21a7 : 86 45 __ STX T2 + 0 
.l221:
21a9 : 2c 00 d6 BIT $d600 
21ac : 10 fb __ BPL $21a9 ; (vdc_hchar.l221 + 0)
.s6:
21ae : a5 11 __ LDA P4 ; (val + 0)
21b0 : 8d 01 d6 STA $d601 
21b3 : a9 18 __ LDA #$18
21b5 : 8d 00 d6 STA $d600 
.l223:
21b8 : 2c 00 d6 BIT $d600 
21bb : 10 fb __ BPL $21b8 ; (vdc_hchar.l223 + 0)
.s12:
21bd : ad 01 d6 LDA $d601 
21c0 : 29 7f __ AND #$7f
21c2 : a2 18 __ LDX #$18
21c4 : 8e 00 d6 STX $d600 
.l225:
21c7 : 2c 00 d6 BIT $d600 
21ca : 10 fb __ BPL $21c7 ; (vdc_hchar.l225 + 0)
.s18:
21cc : 8d 01 d6 STA $d601 
21cf : a9 1e __ LDA #$1e
21d1 : 8d 00 d6 STA $d600 
.l227:
21d4 : 2c 00 d6 BIT $d600 
21d7 : 10 fb __ BPL $21d4 ; (vdc_hchar.l227 + 0)
.s23:
21d9 : a5 45 __ LDA T2 + 0 
21db : 8d 01 d6 STA $d601 
21de : ad ee 6c LDA $6cee ; (vdc_state + 10)
21e1 : 18 __ __ CLC
21e2 : 65 43 __ ADC T1 + 0 
21e4 : 85 0d __ STA P0 
21e6 : ad ef 6c LDA $6cef ; (vdc_state + 11)
21e9 : 65 44 __ ADC T1 + 1 
21eb : 85 0e __ STA P1 
21ed : 20 2e 22 JSR $222e ; (vdc_mem_addr.s0 + 0)
.l229:
21f0 : 2c 00 d6 BIT $d600 
21f3 : 10 fb __ BPL $21f0 ; (vdc_hchar.l229 + 0)
.s27:
21f5 : a5 12 __ LDA P5 ; (attr + 0)
21f7 : 8d 01 d6 STA $d601 
21fa : a9 18 __ LDA #$18
21fc : 8d 00 d6 STA $d600 
.l231:
21ff : 2c 00 d6 BIT $d600 
2202 : 10 fb __ BPL $21ff ; (vdc_hchar.l231 + 0)
.s33:
2204 : ad 01 d6 LDA $d601 
2207 : 29 7f __ AND #$7f
2209 : a2 18 __ LDX #$18
220b : 8e 00 d6 STX $d600 
.l233:
220e : 2c 00 d6 BIT $d600 
2211 : 10 fb __ BPL $220e ; (vdc_hchar.l233 + 0)
.s39:
2213 : 8d 01 d6 STA $d601 
2216 : a9 1e __ LDA #$1e
2218 : 8d 00 d6 STA $d600 
.l235:
221b : 2c 00 d6 BIT $d600 
221e : 10 fb __ BPL $221b ; (vdc_hchar.l235 + 0)
.s44:
2220 : a5 45 __ LDA T2 + 0 
2222 : 8d 01 d6 STA $d601 
.s1001:
2225 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
2226 : a5 0f __ LDA P2 
2228 : 85 0d __ STA P0 
222a : a5 10 __ LDA P3 
222c : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
222e : a9 12 __ LDA #$12
2230 : 8d 00 d6 STA $d600 
.l56:
2233 : 2c 00 d6 BIT $d600 
2236 : 10 fb __ BPL $2233 ; (vdc_mem_addr.l56 + 0)
.s5:
2238 : a5 0e __ LDA P1 ; (addr + 1)
223a : 8d 01 d6 STA $d601 
223d : a9 13 __ LDA #$13
223f : 8d 00 d6 STA $d600 
.l58:
2242 : 2c 00 d6 BIT $d600 
2245 : 10 fb __ BPL $2242 ; (vdc_mem_addr.l58 + 0)
.s10:
2247 : a5 0d __ LDA P0 ; (addr + 0)
2249 : 8d 01 d6 STA $d601 
224c : a9 1f __ LDA #$1f
224e : 8d 00 d6 STA $d600 
.s1001:
2251 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
2252 : a9 01 __ LDA #$01
2254 : 8d fb bf STA $bffb ; (sstack + 4)
2257 : a9 a9 __ LDA #$a9
2259 : 85 16 __ STA P9 
225b : a9 bf __ LDA #$bf
225d : 85 17 __ STA P10 
225f : a0 02 __ LDY #$02
2261 : b1 23 __ LDA (SP + 0),y 
2263 : 8d f7 bf STA $bff7 ; (sstack + 0)
2266 : c8 __ __ INY
2267 : b1 23 __ LDA (SP + 0),y 
2269 : 8d f8 bf STA $bff8 ; (sstack + 1)
226c : 18 __ __ CLC
226d : a5 23 __ LDA SP + 0 
226f : 69 04 __ ADC #$04
2271 : 8d f9 bf STA $bff9 ; (sstack + 2)
2274 : a5 24 __ LDA SP + 1 
2276 : 69 00 __ ADC #$00
2278 : 8d fa bf STA $bffa ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s1000:
227b : a5 53 __ LDA T7 + 0 
227d : 8d db bf STA $bfdb ; (wrapbuffer + 62)
2280 : a5 54 __ LDA T7 + 1 
2282 : 8d dc bf STA $bfdc ; (wrapbuffer + 63)
2285 : a5 55 __ LDA T7 + 2 
2287 : 8d dd bf STA $bfdd ; (wrapbuffer + 64)
.s0:
228a : a9 00 __ LDA #$00
228c : 85 47 __ STA T0 + 0 
228e : ad f7 bf LDA $bff7 ; (sstack + 0)
2291 : 85 49 __ STA T1 + 0 
2293 : ad f8 bf LDA $bff8 ; (sstack + 1)
2296 : 85 4a __ STA T1 + 1 
.l1:
2298 : a0 00 __ LDY #$00
229a : b1 49 __ LDA (T1 + 0),y 
229c : d0 3c __ BNE $22da ; (sformat.s2 + 0)
.s3:
229e : a4 47 __ LDY T0 + 0 
22a0 : 91 16 __ STA (P9),y ; (buff + 0)
22a2 : 98 __ __ TYA
22a3 : f0 1d __ BEQ $22c2 ; (sformat.s1070 + 0)
.s116:
22a5 : ad fb bf LDA $bffb ; (sstack + 4)
22a8 : d0 0d __ BNE $22b7 ; (sformat.s119 + 0)
.s120:
22aa : 18 __ __ CLC
22ab : a5 16 __ LDA P9 ; (buff + 0)
22ad : 65 47 __ ADC T0 + 0 
22af : aa __ __ TAX
22b0 : a5 17 __ LDA P10 ; (buff + 1)
22b2 : 69 00 __ ADC #$00
22b4 : 4c c6 22 JMP $22c6 ; (sformat.s1001 + 0)
.s119:
22b7 : a5 16 __ LDA P9 ; (buff + 0)
22b9 : 85 0d __ STA P0 
22bb : a5 17 __ LDA P10 ; (buff + 1)
22bd : 85 0e __ STA P1 
22bf : 20 7c 26 JSR $267c ; (puts.s0 + 0)
.s1070:
22c2 : a5 17 __ LDA P10 ; (buff + 1)
22c4 : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
22c6 : 86 1b __ STX ACCU + 0 ; (fps + 0)
22c8 : 85 1c __ STA ACCU + 1 ; (fps + 1)
22ca : ad db bf LDA $bfdb ; (wrapbuffer + 62)
22cd : 85 53 __ STA T7 + 0 
22cf : ad dc bf LDA $bfdc ; (wrapbuffer + 63)
22d2 : 85 54 __ STA T7 + 1 
22d4 : ad dd bf LDA $bfdd ; (wrapbuffer + 64)
22d7 : 85 55 __ STA T7 + 2 
22d9 : 60 __ __ RTS
.s2:
22da : c9 25 __ CMP #$25
22dc : f0 3f __ BEQ $231d ; (sformat.s4 + 0)
.s5:
22de : a4 47 __ LDY T0 + 0 
22e0 : 91 16 __ STA (P9),y ; (buff + 0)
22e2 : e6 49 __ INC T1 + 0 
22e4 : d0 02 __ BNE $22e8 ; (sformat.s1098 + 0)
.s1097:
22e6 : e6 4a __ INC T1 + 1 
.s1098:
22e8 : c8 __ __ INY
22e9 : 84 47 __ STY T0 + 0 
22eb : 98 __ __ TYA
22ec : c0 28 __ CPY #$28
22ee : 90 a8 __ BCC $2298 ; (sformat.l1 + 0)
.s110:
22f0 : 85 4c __ STA T5 + 0 
22f2 : a9 00 __ LDA #$00
22f4 : 85 47 __ STA T0 + 0 
22f6 : ad fb bf LDA $bffb ; (sstack + 4)
22f9 : f0 14 __ BEQ $230f ; (sformat.s114 + 0)
.s113:
22fb : a5 16 __ LDA P9 ; (buff + 0)
22fd : 85 0d __ STA P0 
22ff : a5 17 __ LDA P10 ; (buff + 1)
2301 : 85 0e __ STA P1 
2303 : a9 00 __ LDA #$00
2305 : a4 4c __ LDY T5 + 0 
2307 : 91 16 __ STA (P9),y ; (buff + 0)
2309 : 20 7c 26 JSR $267c ; (puts.s0 + 0)
230c : 4c 98 22 JMP $2298 ; (sformat.l1 + 0)
.s114:
230f : 18 __ __ CLC
2310 : a5 16 __ LDA P9 ; (buff + 0)
2312 : 65 4c __ ADC T5 + 0 
2314 : 85 16 __ STA P9 ; (buff + 0)
2316 : 90 80 __ BCC $2298 ; (sformat.l1 + 0)
.s1099:
2318 : e6 17 __ INC P10 ; (buff + 1)
231a : 4c 98 22 JMP $2298 ; (sformat.l1 + 0)
.s4:
231d : a5 47 __ LDA T0 + 0 
231f : f0 27 __ BEQ $2348 ; (sformat.s9 + 0)
.s7:
2321 : 84 47 __ STY T0 + 0 
2323 : 85 4c __ STA T5 + 0 
2325 : ad fb bf LDA $bffb ; (sstack + 4)
2328 : f0 13 __ BEQ $233d ; (sformat.s11 + 0)
.s10:
232a : a5 16 __ LDA P9 ; (buff + 0)
232c : 85 0d __ STA P0 
232e : a5 17 __ LDA P10 ; (buff + 1)
2330 : 85 0e __ STA P1 
2332 : 98 __ __ TYA
2333 : a4 4c __ LDY T5 + 0 
2335 : 91 16 __ STA (P9),y ; (buff + 0)
2337 : 20 7c 26 JSR $267c ; (puts.s0 + 0)
233a : 4c 48 23 JMP $2348 ; (sformat.s9 + 0)
.s11:
233d : 18 __ __ CLC
233e : a5 16 __ LDA P9 ; (buff + 0)
2340 : 65 4c __ ADC T5 + 0 
2342 : 85 16 __ STA P9 ; (buff + 0)
2344 : 90 02 __ BCC $2348 ; (sformat.s9 + 0)
.s1095:
2346 : e6 17 __ INC P10 ; (buff + 1)
.s9:
2348 : a9 0a __ LDA #$0a
234a : 8d e2 bf STA $bfe2 ; (wrapbuffer + 69)
234d : a9 00 __ LDA #$00
234f : 8d e3 bf STA $bfe3 ; (wrapbuffer + 70)
2352 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 71)
2355 : 8d e5 bf STA $bfe5 ; (wrapbuffer + 72)
2358 : 8d e6 bf STA $bfe6 ; (wrapbuffer + 73)
235b : a0 01 __ LDY #$01
235d : b1 49 __ LDA (T1 + 0),y 
235f : a2 20 __ LDX #$20
2361 : 8e df bf STX $bfdf ; (wrapbuffer + 66)
2364 : a2 00 __ LDX #$00
2366 : 8e e0 bf STX $bfe0 ; (wrapbuffer + 67)
2369 : ca __ __ DEX
236a : 8e e1 bf STX $bfe1 ; (wrapbuffer + 68)
236d : aa __ __ TAX
236e : 18 __ __ CLC
236f : a5 49 __ LDA T1 + 0 
2371 : 69 02 __ ADC #$02
.l14:
2373 : 85 49 __ STA T1 + 0 
2375 : 90 02 __ BCC $2379 ; (sformat.s1082 + 0)
.s1081:
2377 : e6 4a __ INC T1 + 1 
.s1082:
2379 : 8a __ __ TXA
237a : e0 2b __ CPX #$2b
237c : d0 08 __ BNE $2386 ; (sformat.s17 + 0)
.s16:
237e : a9 01 __ LDA #$01
2380 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 71)
2383 : 4c 67 26 JMP $2667 ; (sformat.s264 + 0)
.s17:
2386 : c9 30 __ CMP #$30
2388 : d0 06 __ BNE $2390 ; (sformat.s20 + 0)
.s19:
238a : 8d df bf STA $bfdf ; (wrapbuffer + 66)
238d : 4c 67 26 JMP $2667 ; (sformat.s264 + 0)
.s20:
2390 : c9 23 __ CMP #$23
2392 : d0 08 __ BNE $239c ; (sformat.s23 + 0)
.s22:
2394 : a9 01 __ LDA #$01
2396 : 8d e6 bf STA $bfe6 ; (wrapbuffer + 73)
2399 : 4c 67 26 JMP $2667 ; (sformat.s264 + 0)
.s23:
239c : c9 2d __ CMP #$2d
239e : d0 08 __ BNE $23a8 ; (sformat.s15 + 0)
.s25:
23a0 : a9 01 __ LDA #$01
23a2 : 8d e5 bf STA $bfe5 ; (wrapbuffer + 72)
23a5 : 4c 67 26 JMP $2667 ; (sformat.s264 + 0)
.s15:
23a8 : 85 4c __ STA T5 + 0 
23aa : c9 30 __ CMP #$30
23ac : 90 55 __ BCC $2403 ; (sformat.s31 + 0)
.s32:
23ae : c9 3a __ CMP #$3a
23b0 : b0 51 __ BCS $2403 ; (sformat.s31 + 0)
.s29:
23b2 : a9 00 __ LDA #$00
23b4 : 85 44 __ STA T6 + 0 
23b6 : 85 45 __ STA T6 + 1 
23b8 : e0 3a __ CPX #$3a
23ba : b0 40 __ BCS $23fc ; (sformat.s35 + 0)
.l34:
23bc : a5 44 __ LDA T6 + 0 
23be : 0a __ __ ASL
23bf : 85 1b __ STA ACCU + 0 ; (fps + 0)
23c1 : a5 45 __ LDA T6 + 1 
23c3 : 2a __ __ ROL
23c4 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
23c6 : 2a __ __ ROL
23c7 : aa __ __ TAX
23c8 : 18 __ __ CLC
23c9 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
23cb : 65 44 __ ADC T6 + 0 
23cd : 85 44 __ STA T6 + 0 
23cf : 8a __ __ TXA
23d0 : 65 45 __ ADC T6 + 1 
23d2 : 06 44 __ ASL T6 + 0 
23d4 : 2a __ __ ROL
23d5 : aa __ __ TAX
23d6 : 18 __ __ CLC
23d7 : a5 44 __ LDA T6 + 0 
23d9 : 65 4c __ ADC T5 + 0 
23db : 90 01 __ BCC $23de ; (sformat.s1092 + 0)
.s1091:
23dd : e8 __ __ INX
.s1092:
23de : 38 __ __ SEC
23df : e9 30 __ SBC #$30
23e1 : 85 44 __ STA T6 + 0 
23e3 : 8a __ __ TXA
23e4 : e9 00 __ SBC #$00
23e6 : 85 45 __ STA T6 + 1 
23e8 : a0 00 __ LDY #$00
23ea : b1 49 __ LDA (T1 + 0),y 
23ec : 85 4c __ STA T5 + 0 
23ee : e6 49 __ INC T1 + 0 
23f0 : d0 02 __ BNE $23f4 ; (sformat.s1094 + 0)
.s1093:
23f2 : e6 4a __ INC T1 + 1 
.s1094:
23f4 : c9 30 __ CMP #$30
23f6 : 90 04 __ BCC $23fc ; (sformat.s35 + 0)
.s36:
23f8 : c9 3a __ CMP #$3a
23fa : 90 c0 __ BCC $23bc ; (sformat.l34 + 0)
.s35:
23fc : a5 44 __ LDA T6 + 0 
23fe : 8d e0 bf STA $bfe0 ; (wrapbuffer + 67)
2401 : a5 4c __ LDA T5 + 0 
.s31:
2403 : c9 2e __ CMP #$2e
2405 : d0 51 __ BNE $2458 ; (sformat.s39 + 0)
.s37:
2407 : a9 00 __ LDA #$00
2409 : 85 44 __ STA T6 + 0 
.l243:
240b : 85 45 __ STA T6 + 1 
240d : a0 00 __ LDY #$00
240f : b1 49 __ LDA (T1 + 0),y 
2411 : 85 4c __ STA T5 + 0 
2413 : e6 49 __ INC T1 + 0 
2415 : d0 02 __ BNE $2419 ; (sformat.s1084 + 0)
.s1083:
2417 : e6 4a __ INC T1 + 1 
.s1084:
2419 : c9 30 __ CMP #$30
241b : 90 04 __ BCC $2421 ; (sformat.s42 + 0)
.s43:
241d : c9 3a __ CMP #$3a
241f : 90 0a __ BCC $242b ; (sformat.s41 + 0)
.s42:
2421 : a5 44 __ LDA T6 + 0 
2423 : 8d e1 bf STA $bfe1 ; (wrapbuffer + 68)
2426 : a5 4c __ LDA T5 + 0 
2428 : 4c 58 24 JMP $2458 ; (sformat.s39 + 0)
.s41:
242b : a5 44 __ LDA T6 + 0 
242d : 0a __ __ ASL
242e : 85 1b __ STA ACCU + 0 ; (fps + 0)
2430 : a5 45 __ LDA T6 + 1 
2432 : 2a __ __ ROL
2433 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
2435 : 2a __ __ ROL
2436 : aa __ __ TAX
2437 : 18 __ __ CLC
2438 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
243a : 65 44 __ ADC T6 + 0 
243c : 85 44 __ STA T6 + 0 
243e : 8a __ __ TXA
243f : 65 45 __ ADC T6 + 1 
2441 : 06 44 __ ASL T6 + 0 
2443 : 2a __ __ ROL
2444 : aa __ __ TAX
2445 : 18 __ __ CLC
2446 : a5 44 __ LDA T6 + 0 
2448 : 65 4c __ ADC T5 + 0 
244a : 90 01 __ BCC $244d ; (sformat.s1090 + 0)
.s1089:
244c : e8 __ __ INX
.s1090:
244d : 38 __ __ SEC
244e : e9 30 __ SBC #$30
2450 : 85 44 __ STA T6 + 0 
2452 : 8a __ __ TXA
2453 : e9 00 __ SBC #$00
2455 : 4c 0b 24 JMP $240b ; (sformat.l243 + 0)
.s39:
2458 : c9 64 __ CMP #$64
245a : f0 04 __ BEQ $2460 ; (sformat.s44 + 0)
.s47:
245c : c9 44 __ CMP #$44
245e : d0 05 __ BNE $2465 ; (sformat.s45 + 0)
.s44:
2460 : a9 01 __ LDA #$01
2462 : 4c 2b 26 JMP $262b ; (sformat.s261 + 0)
.s45:
2465 : c9 75 __ CMP #$75
2467 : d0 03 __ BNE $246c ; (sformat.s51 + 0)
2469 : 4c 29 26 JMP $2629 ; (sformat.s291 + 0)
.s51:
246c : c9 55 __ CMP #$55
246e : d0 03 __ BNE $2473 ; (sformat.s49 + 0)
2470 : 4c 29 26 JMP $2629 ; (sformat.s291 + 0)
.s49:
2473 : c9 78 __ CMP #$78
2475 : f0 04 __ BEQ $247b ; (sformat.s52 + 0)
.s55:
2477 : c9 58 __ CMP #$58
2479 : d0 0d __ BNE $2488 ; (sformat.s53 + 0)
.s52:
247b : a9 10 __ LDA #$10
247d : 8d e2 bf STA $bfe2 ; (wrapbuffer + 69)
2480 : a9 00 __ LDA #$00
2482 : 8d e3 bf STA $bfe3 ; (wrapbuffer + 70)
2485 : 4c 29 26 JMP $2629 ; (sformat.s291 + 0)
.s53:
2488 : c9 6c __ CMP #$6c
248a : d0 03 __ BNE $248f ; (sformat.s59 + 0)
248c : 4c a0 25 JMP $25a0 ; (sformat.s56 + 0)
.s59:
248f : c9 4c __ CMP #$4c
2491 : d0 03 __ BNE $2496 ; (sformat.s57 + 0)
2493 : 4c a0 25 JMP $25a0 ; (sformat.s56 + 0)
.s57:
2496 : c9 73 __ CMP #$73
2498 : f0 54 __ BEQ $24ee ; (sformat.s72 + 0)
.s75:
249a : c9 53 __ CMP #$53
249c : f0 50 __ BEQ $24ee ; (sformat.s72 + 0)
.s73:
249e : c9 63 __ CMP #$63
24a0 : f0 23 __ BEQ $24c5 ; (sformat.s103 + 0)
.s106:
24a2 : c9 43 __ CMP #$43
24a4 : f0 1f __ BEQ $24c5 ; (sformat.s103 + 0)
.s104:
24a6 : 09 00 __ ORA #$00
24a8 : d0 03 __ BNE $24ad ; (sformat.s107 + 0)
24aa : 4c 98 22 JMP $2298 ; (sformat.l1 + 0)
.s107:
24ad : 18 __ __ CLC
24ae : a5 16 __ LDA P9 ; (buff + 0)
24b0 : 65 47 __ ADC T0 + 0 
24b2 : 85 44 __ STA T6 + 0 
24b4 : a5 17 __ LDA P10 ; (buff + 1)
24b6 : 69 00 __ ADC #$00
24b8 : 85 45 __ STA T6 + 1 
24ba : a5 4c __ LDA T5 + 0 
.s1068:
24bc : a0 00 __ LDY #$00
24be : 91 44 __ STA (T6 + 0),y 
24c0 : e6 47 __ INC T0 + 0 
24c2 : 4c 98 22 JMP $2298 ; (sformat.l1 + 0)
.s103:
24c5 : ad f9 bf LDA $bff9 ; (sstack + 2)
24c8 : 85 4c __ STA T5 + 0 
24ca : 18 __ __ CLC
24cb : 69 02 __ ADC #$02
24cd : 8d f9 bf STA $bff9 ; (sstack + 2)
24d0 : ad fa bf LDA $bffa ; (sstack + 3)
24d3 : 85 4d __ STA T5 + 1 
24d5 : 69 00 __ ADC #$00
24d7 : 8d fa bf STA $bffa ; (sstack + 3)
24da : 18 __ __ CLC
24db : a5 16 __ LDA P9 ; (buff + 0)
24dd : 65 47 __ ADC T0 + 0 
24df : 85 44 __ STA T6 + 0 
24e1 : a5 17 __ LDA P10 ; (buff + 1)
24e3 : 69 00 __ ADC #$00
24e5 : 85 45 __ STA T6 + 1 
24e7 : a0 00 __ LDY #$00
24e9 : b1 4c __ LDA (T5 + 0),y 
24eb : 4c bc 24 JMP $24bc ; (sformat.s1068 + 0)
.s72:
24ee : ad f9 bf LDA $bff9 ; (sstack + 2)
24f1 : 85 4c __ STA T5 + 0 
24f3 : 18 __ __ CLC
24f4 : 69 02 __ ADC #$02
24f6 : 8d f9 bf STA $bff9 ; (sstack + 2)
24f9 : ad fa bf LDA $bffa ; (sstack + 3)
24fc : 85 4d __ STA T5 + 1 
24fe : 69 00 __ ADC #$00
2500 : 8d fa bf STA $bffa ; (sstack + 3)
2503 : a0 00 __ LDY #$00
2505 : 84 4b __ STY T3 + 0 
2507 : b1 4c __ LDA (T5 + 0),y 
2509 : aa __ __ TAX
250a : c8 __ __ INY
250b : b1 4c __ LDA (T5 + 0),y 
250d : 86 4c __ STX T5 + 0 
250f : 85 4d __ STA T5 + 1 
2511 : ad e0 bf LDA $bfe0 ; (wrapbuffer + 67)
2514 : f0 0c __ BEQ $2522 ; (sformat.s78 + 0)
.s1073:
2516 : 88 __ __ DEY
2517 : b1 4c __ LDA (T5 + 0),y 
2519 : f0 05 __ BEQ $2520 ; (sformat.s1074 + 0)
.l80:
251b : c8 __ __ INY
251c : b1 4c __ LDA (T5 + 0),y 
251e : d0 fb __ BNE $251b ; (sformat.l80 + 0)
.s1074:
2520 : 84 4b __ STY T3 + 0 
.s78:
2522 : ad e5 bf LDA $bfe5 ; (wrapbuffer + 72)
2525 : d0 19 __ BNE $2540 ; (sformat.s84 + 0)
.s1077:
2527 : a6 4b __ LDX T3 + 0 
2529 : ec e0 bf CPX $bfe0 ; (wrapbuffer + 67)
252c : a4 47 __ LDY T0 + 0 
252e : b0 0c __ BCS $253c ; (sformat.s1078 + 0)
.l86:
2530 : ad df bf LDA $bfdf ; (wrapbuffer + 66)
2533 : 91 16 __ STA (P9),y ; (buff + 0)
2535 : e8 __ __ INX
2536 : ec e0 bf CPX $bfe0 ; (wrapbuffer + 67)
2539 : c8 __ __ INY
253a : 90 f4 __ BCC $2530 ; (sformat.l86 + 0)
.s1078:
253c : 86 4b __ STX T3 + 0 
253e : 84 47 __ STY T0 + 0 
.s84:
2540 : ad fb bf LDA $bffb ; (sstack + 4)
2543 : d0 37 __ BNE $257c ; (sformat.s88 + 0)
.l94:
2545 : a0 00 __ LDY #$00
2547 : b1 4c __ LDA (T5 + 0),y 
2549 : f0 0f __ BEQ $255a ; (sformat.s251 + 0)
.s95:
254b : a4 47 __ LDY T0 + 0 
254d : 91 16 __ STA (P9),y ; (buff + 0)
254f : e6 47 __ INC T0 + 0 
2551 : e6 4c __ INC T5 + 0 
2553 : d0 f0 __ BNE $2545 ; (sformat.l94 + 0)
.s1087:
2555 : e6 4d __ INC T5 + 1 
2557 : 4c 45 25 JMP $2545 ; (sformat.l94 + 0)
.s251:
255a : ad e5 bf LDA $bfe5 ; (wrapbuffer + 72)
255d : d0 03 __ BNE $2562 ; (sformat.s1075 + 0)
255f : 4c 98 22 JMP $2298 ; (sformat.l1 + 0)
.s1075:
2562 : a6 4b __ LDX T3 + 0 
2564 : ec e0 bf CPX $bfe0 ; (wrapbuffer + 67)
2567 : a4 47 __ LDY T0 + 0 
2569 : b0 0c __ BCS $2577 ; (sformat.s1076 + 0)
.l101:
256b : ad df bf LDA $bfdf ; (wrapbuffer + 66)
256e : 91 16 __ STA (P9),y ; (buff + 0)
2570 : e8 __ __ INX
2571 : ec e0 bf CPX $bfe0 ; (wrapbuffer + 67)
2574 : c8 __ __ INY
2575 : 90 f4 __ BCC $256b ; (sformat.l101 + 0)
.s1076:
2577 : 84 47 __ STY T0 + 0 
2579 : 4c 98 22 JMP $2298 ; (sformat.l1 + 0)
.s88:
257c : a5 47 __ LDA T0 + 0 
257e : f0 1a __ BEQ $259a ; (sformat.s93 + 0)
.s91:
2580 : a5 16 __ LDA P9 ; (buff + 0)
2582 : 85 0d __ STA P0 
2584 : a5 17 __ LDA P10 ; (buff + 1)
2586 : 85 0e __ STA P1 
2588 : a9 00 __ LDA #$00
258a : a4 47 __ LDY T0 + 0 
258c : 91 16 __ STA (P9),y ; (buff + 0)
258e : 20 7c 26 JSR $267c ; (puts.s0 + 0)
2591 : 20 74 26 JSR $2674 ; (puts@proxy + 0)
2594 : a9 00 __ LDA #$00
2596 : 85 47 __ STA T0 + 0 
2598 : f0 c0 __ BEQ $255a ; (sformat.s251 + 0)
.s93:
259a : 20 74 26 JSR $2674 ; (puts@proxy + 0)
259d : 4c 5a 25 JMP $255a ; (sformat.s251 + 0)
.s56:
25a0 : ad f9 bf LDA $bff9 ; (sstack + 2)
25a3 : 85 4c __ STA T5 + 0 
25a5 : 18 __ __ CLC
25a6 : 69 04 __ ADC #$04
25a8 : 8d f9 bf STA $bff9 ; (sstack + 2)
25ab : ad fa bf LDA $bffa ; (sstack + 3)
25ae : 85 4d __ STA T5 + 1 
25b0 : 69 00 __ ADC #$00
25b2 : 8d fa bf STA $bffa ; (sstack + 3)
25b5 : a0 00 __ LDY #$00
25b7 : b1 49 __ LDA (T1 + 0),y 
25b9 : aa __ __ TAX
25ba : e6 49 __ INC T1 + 0 
25bc : d0 02 __ BNE $25c0 ; (sformat.s1086 + 0)
.s1085:
25be : e6 4a __ INC T1 + 1 
.s1086:
25c0 : b1 4c __ LDA (T5 + 0),y 
25c2 : 85 53 __ STA T7 + 0 
25c4 : a0 01 __ LDY #$01
25c6 : b1 4c __ LDA (T5 + 0),y 
25c8 : 85 54 __ STA T7 + 1 
25ca : c8 __ __ INY
25cb : b1 4c __ LDA (T5 + 0),y 
25cd : 85 55 __ STA T7 + 2 
25cf : c8 __ __ INY
25d0 : b1 4c __ LDA (T5 + 0),y 
25d2 : a8 __ __ TAY
25d3 : 8a __ __ TXA
25d4 : e0 64 __ CPX #$64
25d6 : f0 04 __ BEQ $25dc ; (sformat.s60 + 0)
.s63:
25d8 : c9 44 __ CMP #$44
25da : d0 04 __ BNE $25e0 ; (sformat.s61 + 0)
.s60:
25dc : a9 01 __ LDA #$01
25de : d0 1f __ BNE $25ff ; (sformat.s262 + 0)
.s61:
25e0 : c9 75 __ CMP #$75
25e2 : f0 19 __ BEQ $25fd ; (sformat.s292 + 0)
.s67:
25e4 : c9 55 __ CMP #$55
25e6 : f0 15 __ BEQ $25fd ; (sformat.s292 + 0)
.s65:
25e8 : c9 78 __ CMP #$78
25ea : f0 07 __ BEQ $25f3 ; (sformat.s68 + 0)
.s71:
25ec : c9 58 __ CMP #$58
25ee : f0 03 __ BEQ $25f3 ; (sformat.s68 + 0)
25f0 : 4c 98 22 JMP $2298 ; (sformat.l1 + 0)
.s68:
25f3 : a9 10 __ LDA #$10
25f5 : 8d e2 bf STA $bfe2 ; (wrapbuffer + 69)
25f8 : a9 00 __ LDA #$00
25fa : 8d e3 bf STA $bfe3 ; (wrapbuffer + 70)
.s292:
25fd : a9 00 __ LDA #$00
.s262:
25ff : 84 14 __ STY P7 
2601 : 85 15 __ STA P8 
2603 : a5 16 __ LDA P9 ; (buff + 0)
2605 : 85 0f __ STA P2 
2607 : a5 17 __ LDA P10 ; (buff + 1)
2609 : 85 10 __ STA P3 
260b : a5 53 __ LDA T7 + 0 
260d : 85 11 __ STA P4 
260f : a5 54 __ LDA T7 + 1 
2611 : 85 12 __ STA P5 
2613 : a5 55 __ LDA T7 + 2 
2615 : 85 13 __ STA P6 
2617 : a9 df __ LDA #$df
2619 : 85 0d __ STA P0 
261b : a9 bf __ LDA #$bf
261d : 85 0e __ STA P1 
261f : 20 06 28 JSR $2806 ; (nforml.s0 + 0)
.s1069:
2622 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
2624 : 85 47 __ STA T0 + 0 
2626 : 4c 98 22 JMP $2298 ; (sformat.l1 + 0)
.s291:
2629 : a9 00 __ LDA #$00
.s261:
262b : 85 13 __ STA P6 
262d : a5 16 __ LDA P9 ; (buff + 0)
262f : 85 0f __ STA P2 
2631 : a5 17 __ LDA P10 ; (buff + 1)
2633 : 85 10 __ STA P3 
2635 : ad f9 bf LDA $bff9 ; (sstack + 2)
2638 : 85 47 __ STA T0 + 0 
263a : ad fa bf LDA $bffa ; (sstack + 3)
263d : 85 48 __ STA T0 + 1 
263f : a0 00 __ LDY #$00
2641 : b1 47 __ LDA (T0 + 0),y 
2643 : 85 11 __ STA P4 
2645 : c8 __ __ INY
2646 : b1 47 __ LDA (T0 + 0),y 
2648 : 85 12 __ STA P5 
264a : 18 __ __ CLC
264b : a5 47 __ LDA T0 + 0 
264d : 69 02 __ ADC #$02
264f : 8d f9 bf STA $bff9 ; (sstack + 2)
2652 : a5 48 __ LDA T0 + 1 
2654 : 69 00 __ ADC #$00
2656 : 8d fa bf STA $bffa ; (sstack + 3)
2659 : a9 df __ LDA #$df
265b : 85 0d __ STA P0 
265d : a9 bf __ LDA #$bf
265f : 85 0e __ STA P1 
2661 : 20 d1 26 JSR $26d1 ; (nformi.s0 + 0)
2664 : 4c 22 26 JMP $2622 ; (sformat.s1069 + 0)
.s264:
2667 : a0 00 __ LDY #$00
2669 : b1 49 __ LDA (T1 + 0),y 
266b : aa __ __ TAX
266c : 18 __ __ CLC
266d : a5 49 __ LDA T1 + 0 
266f : 69 01 __ ADC #$01
2671 : 4c 73 23 JMP $2373 ; (sformat.l14 + 0)
--------------------------------------------------------------------
puts@proxy: ; puts@proxy
2674 : a5 4c __ LDA $4c 
2676 : 85 0d __ STA P0 
2678 : a5 4d __ LDA $4d 
267a : 85 0e __ STA P1 
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
267c : a0 00 __ LDY #$00
267e : b1 0d __ LDA (P0),y 
2680 : f0 0b __ BEQ $268d ; (puts.s1001 + 0)
2682 : 20 8e 26 JSR $268e ; (putpch + 0)
2685 : e6 0d __ INC P0 
2687 : d0 f3 __ BNE $267c ; (puts.s0 + 0)
2689 : e6 0e __ INC P1 
268b : d0 ef __ BNE $267c ; (puts.s0 + 0)
.s1001:
268d : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
268e : ae fe 3e LDX $3efe ; (giocharmap + 0)
2691 : e0 01 __ CPX #$01
2693 : 90 26 __ BCC $26bb ; (putpch + 45)
2695 : c9 0a __ CMP #$0a
2697 : d0 02 __ BNE $269b ; (putpch + 13)
2699 : a9 0d __ LDA #$0d
269b : c9 09 __ CMP #$09
269d : f0 1f __ BEQ $26be ; (putpch + 48)
269f : e0 02 __ CPX #$02
26a1 : 90 18 __ BCC $26bb ; (putpch + 45)
26a3 : c9 41 __ CMP #$41
26a5 : 90 14 __ BCC $26bb ; (putpch + 45)
26a7 : c9 7b __ CMP #$7b
26a9 : b0 10 __ BCS $26bb ; (putpch + 45)
26ab : c9 61 __ CMP #$61
26ad : b0 04 __ BCS $26b3 ; (putpch + 37)
26af : c9 5b __ CMP #$5b
26b1 : b0 08 __ BCS $26bb ; (putpch + 45)
26b3 : 49 20 __ EOR #$20
26b5 : e0 03 __ CPX #$03
26b7 : f0 02 __ BEQ $26bb ; (putpch + 45)
26b9 : 29 df __ AND #$df
26bb : 4c d2 ff JMP $ffd2 
26be : 38 __ __ SEC
26bf : 20 f0 ff JSR $fff0 
26c2 : 98 __ __ TYA
26c3 : 29 03 __ AND #$03
26c5 : 49 03 __ EOR #$03
26c7 : aa __ __ TAX
26c8 : a9 20 __ LDA #$20
26ca : 20 d2 ff JSR $ffd2 
26cd : ca __ __ DEX
26ce : 10 fa __ BPL $26ca ; (putpch + 60)
26d0 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
26d1 : a9 00 __ LDA #$00
26d3 : 85 43 __ STA T0 + 0 
26d5 : a5 13 __ LDA P6 ; (s + 0)
26d7 : f0 13 __ BEQ $26ec ; (nformi.s182 + 0)
.s4:
26d9 : 24 12 __ BIT P5 ; (v + 1)
26db : 10 0f __ BPL $26ec ; (nformi.s182 + 0)
.s1:
26dd : 38 __ __ SEC
26de : a9 00 __ LDA #$00
26e0 : e5 11 __ SBC P4 ; (v + 0)
26e2 : 85 11 __ STA P4 ; (v + 0)
26e4 : a9 00 __ LDA #$00
26e6 : e5 12 __ SBC P5 ; (v + 1)
26e8 : 85 12 __ STA P5 ; (v + 1)
26ea : e6 43 __ INC T0 + 0 
.s182:
26ec : a9 10 __ LDA #$10
26ee : 85 44 __ STA T2 + 0 
26f0 : a5 11 __ LDA P4 ; (v + 0)
26f2 : 05 12 __ ORA P5 ; (v + 1)
26f4 : f0 46 __ BEQ $273c ; (nformi.s7 + 0)
.s42:
26f6 : a0 03 __ LDY #$03
26f8 : b1 0d __ LDA (P0),y ; (si + 0)
26fa : 85 45 __ STA T4 + 0 
26fc : c8 __ __ INY
26fd : b1 0d __ LDA (P0),y ; (si + 0)
26ff : 85 46 __ STA T4 + 1 
.l6:
2701 : a5 11 __ LDA P4 ; (v + 0)
2703 : 85 1b __ STA ACCU + 0 
2705 : a5 12 __ LDA P5 ; (v + 1)
2707 : 85 1c __ STA ACCU + 1 
2709 : a5 45 __ LDA T4 + 0 
270b : 85 03 __ STA WORK + 0 
270d : a5 46 __ LDA T4 + 1 
270f : 85 04 __ STA WORK + 1 
2711 : 20 8e 64 JSR $648e ; (divmod + 0)
2714 : a5 06 __ LDA WORK + 3 
2716 : 30 08 __ BMI $2720 ; (nformi.s78 + 0)
.s1019:
2718 : d0 0a __ BNE $2724 ; (nformi.s77 + 0)
.s1018:
271a : a5 05 __ LDA WORK + 2 
271c : c9 0a __ CMP #$0a
271e : b0 04 __ BCS $2724 ; (nformi.s77 + 0)
.s78:
2720 : a9 30 __ LDA #$30
2722 : d0 02 __ BNE $2726 ; (nformi.s79 + 0)
.s77:
2724 : a9 37 __ LDA #$37
.s79:
2726 : 18 __ __ CLC
2727 : 65 05 __ ADC WORK + 2 
2729 : c6 44 __ DEC T2 + 0 
272b : a6 44 __ LDX T2 + 0 
272d : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 74)
2730 : a5 1b __ LDA ACCU + 0 
2732 : 85 11 __ STA P4 ; (v + 0)
2734 : a5 1c __ LDA ACCU + 1 
2736 : 85 12 __ STA P5 ; (v + 1)
2738 : 05 11 __ ORA P4 ; (v + 0)
273a : d0 c5 __ BNE $2701 ; (nformi.l6 + 0)
.s7:
273c : a0 02 __ LDY #$02
273e : b1 0d __ LDA (P0),y ; (si + 0)
2740 : c9 ff __ CMP #$ff
2742 : d0 04 __ BNE $2748 ; (nformi.s80 + 0)
.s81:
2744 : a9 0f __ LDA #$0f
2746 : d0 05 __ BNE $274d ; (nformi.s1026 + 0)
.s80:
2748 : 38 __ __ SEC
2749 : a9 10 __ LDA #$10
274b : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
274d : a8 __ __ TAY
274e : c4 44 __ CPY T2 + 0 
2750 : b0 0d __ BCS $275f ; (nformi.s10 + 0)
.s9:
2752 : a9 30 __ LDA #$30
.l1027:
2754 : c6 44 __ DEC T2 + 0 
2756 : a6 44 __ LDX T2 + 0 
2758 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 74)
275b : c4 44 __ CPY T2 + 0 
275d : 90 f5 __ BCC $2754 ; (nformi.l1027 + 0)
.s10:
275f : a0 07 __ LDY #$07
2761 : b1 0d __ LDA (P0),y ; (si + 0)
2763 : f0 20 __ BEQ $2785 ; (nformi.s13 + 0)
.s14:
2765 : a0 04 __ LDY #$04
2767 : b1 0d __ LDA (P0),y ; (si + 0)
2769 : d0 1a __ BNE $2785 ; (nformi.s13 + 0)
.s1013:
276b : 88 __ __ DEY
276c : b1 0d __ LDA (P0),y ; (si + 0)
276e : c9 10 __ CMP #$10
2770 : d0 13 __ BNE $2785 ; (nformi.s13 + 0)
.s11:
2772 : a9 58 __ LDA #$58
2774 : a6 44 __ LDX T2 + 0 
2776 : 9d e6 bf STA $bfe6,x ; (wrapbuffer + 73)
2779 : 8a __ __ TXA
277a : 18 __ __ CLC
277b : 69 fe __ ADC #$fe
277d : 85 44 __ STA T2 + 0 
277f : aa __ __ TAX
2780 : a9 30 __ LDA #$30
2782 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 74)
.s13:
2785 : a9 00 __ LDA #$00
2787 : 85 1b __ STA ACCU + 0 
2789 : a5 43 __ LDA T0 + 0 
278b : f0 06 __ BEQ $2793 ; (nformi.s16 + 0)
.s15:
278d : c6 44 __ DEC T2 + 0 
278f : a9 2d __ LDA #$2d
2791 : d0 0a __ BNE $279d ; (nformi.s1025 + 0)
.s16:
2793 : a0 05 __ LDY #$05
2795 : b1 0d __ LDA (P0),y ; (si + 0)
2797 : f0 09 __ BEQ $27a2 ; (nformi.s163 + 0)
.s18:
2799 : c6 44 __ DEC T2 + 0 
279b : a9 2b __ LDA #$2b
.s1025:
279d : a6 44 __ LDX T2 + 0 
279f : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 74)
.s163:
27a2 : a0 06 __ LDY #$06
27a4 : b1 0d __ LDA (P0),y ; (si + 0)
27a6 : d0 33 __ BNE $27db ; (nformi.s24 + 0)
.l30:
27a8 : a0 01 __ LDY #$01
27aa : b1 0d __ LDA (P0),y ; (si + 0)
27ac : 18 __ __ CLC
27ad : 65 44 __ ADC T2 + 0 
27af : b0 04 __ BCS $27b5 ; (nformi.s31 + 0)
.s1006:
27b1 : c9 11 __ CMP #$11
27b3 : 90 0d __ BCC $27c2 ; (nformi.s33 + 0)
.s31:
27b5 : c6 44 __ DEC T2 + 0 
27b7 : a0 00 __ LDY #$00
27b9 : b1 0d __ LDA (P0),y ; (si + 0)
27bb : a6 44 __ LDX T2 + 0 
27bd : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 74)
27c0 : b0 e6 __ BCS $27a8 ; (nformi.l30 + 0)
.s33:
27c2 : a6 44 __ LDX T2 + 0 
27c4 : e0 10 __ CPX #$10
27c6 : b0 0e __ BCS $27d6 ; (nformi.s23 + 0)
.s34:
27c8 : 88 __ __ DEY
.l1022:
27c9 : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 74)
27cc : 91 0f __ STA (P2),y ; (str + 0)
27ce : e8 __ __ INX
27cf : e0 10 __ CPX #$10
27d1 : c8 __ __ INY
27d2 : 90 f5 __ BCC $27c9 ; (nformi.l1022 + 0)
.s1023:
27d4 : 84 1b __ STY ACCU + 0 
.s23:
27d6 : a9 00 __ LDA #$00
27d8 : 85 1c __ STA ACCU + 1 
.s1001:
27da : 60 __ __ RTS
.s24:
27db : a6 44 __ LDX T2 + 0 
27dd : e0 10 __ CPX #$10
27df : b0 1a __ BCS $27fb ; (nformi.l27 + 0)
.s25:
27e1 : a0 00 __ LDY #$00
.l1020:
27e3 : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 74)
27e6 : 91 0f __ STA (P2),y ; (str + 0)
27e8 : e8 __ __ INX
27e9 : e0 10 __ CPX #$10
27eb : c8 __ __ INY
27ec : 90 f5 __ BCC $27e3 ; (nformi.l1020 + 0)
.s1021:
27ee : 84 1b __ STY ACCU + 0 
27f0 : b0 09 __ BCS $27fb ; (nformi.l27 + 0)
.s28:
27f2 : 88 __ __ DEY
27f3 : b1 0d __ LDA (P0),y ; (si + 0)
27f5 : a4 1b __ LDY ACCU + 0 
27f7 : 91 0f __ STA (P2),y ; (str + 0)
27f9 : e6 1b __ INC ACCU + 0 
.l27:
27fb : a5 1b __ LDA ACCU + 0 
27fd : a0 01 __ LDY #$01
27ff : d1 0d __ CMP (P0),y ; (si + 0)
2801 : 90 ef __ BCC $27f2 ; (nformi.s28 + 0)
2803 : 4c d6 27 JMP $27d6 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
2806 : a9 00 __ LDA #$00
2808 : 85 43 __ STA T0 + 0 
280a : a5 15 __ LDA P8 ; (s + 0)
280c : f0 21 __ BEQ $282f ; (nforml.s182 + 0)
.s4:
280e : a5 14 __ LDA P7 ; (v + 3)
2810 : f0 1d __ BEQ $282f ; (nforml.s182 + 0)
.s1032:
2812 : 10 1b __ BPL $282f ; (nforml.s182 + 0)
.s1:
2814 : 38 __ __ SEC
2815 : a9 00 __ LDA #$00
2817 : e5 11 __ SBC P4 ; (v + 0)
2819 : 85 11 __ STA P4 ; (v + 0)
281b : a9 00 __ LDA #$00
281d : e5 12 __ SBC P5 ; (v + 1)
281f : 85 12 __ STA P5 ; (v + 1)
2821 : a9 00 __ LDA #$00
2823 : e5 13 __ SBC P6 ; (v + 2)
2825 : 85 13 __ STA P6 ; (v + 2)
2827 : a9 00 __ LDA #$00
2829 : e5 14 __ SBC P7 ; (v + 3)
282b : 85 14 __ STA P7 ; (v + 3)
282d : e6 43 __ INC T0 + 0 
.s182:
282f : a9 10 __ LDA #$10
2831 : 85 44 __ STA T2 + 0 
2833 : a5 14 __ LDA P7 ; (v + 3)
2835 : d0 0c __ BNE $2843 ; (nforml.s42 + 0)
.s1024:
2837 : a5 13 __ LDA P6 ; (v + 2)
2839 : d0 08 __ BNE $2843 ; (nforml.s42 + 0)
.s1025:
283b : a5 12 __ LDA P5 ; (v + 1)
283d : d0 04 __ BNE $2843 ; (nforml.s42 + 0)
.s1026:
283f : c5 11 __ CMP P4 ; (v + 0)
2841 : b0 0e __ BCS $2851 ; (nforml.s7 + 0)
.s42:
2843 : a0 03 __ LDY #$03
2845 : b1 0d __ LDA (P0),y ; (si + 0)
2847 : 85 45 __ STA T5 + 0 
2849 : c8 __ __ INY
284a : b1 0d __ LDA (P0),y ; (si + 0)
284c : 85 46 __ STA T5 + 1 
284e : 4c 1b 29 JMP $291b ; (nforml.l6 + 0)
.s7:
2851 : a0 02 __ LDY #$02
2853 : b1 0d __ LDA (P0),y ; (si + 0)
2855 : c9 ff __ CMP #$ff
2857 : d0 04 __ BNE $285d ; (nforml.s80 + 0)
.s81:
2859 : a9 0f __ LDA #$0f
285b : d0 05 __ BNE $2862 ; (nforml.s1039 + 0)
.s80:
285d : 38 __ __ SEC
285e : a9 10 __ LDA #$10
2860 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
2862 : a8 __ __ TAY
2863 : c4 44 __ CPY T2 + 0 
2865 : b0 0d __ BCS $2874 ; (nforml.s10 + 0)
.s9:
2867 : a9 30 __ LDA #$30
.l1040:
2869 : c6 44 __ DEC T2 + 0 
286b : a6 44 __ LDX T2 + 0 
286d : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 74)
2870 : c4 44 __ CPY T2 + 0 
2872 : 90 f5 __ BCC $2869 ; (nforml.l1040 + 0)
.s10:
2874 : a0 07 __ LDY #$07
2876 : b1 0d __ LDA (P0),y ; (si + 0)
2878 : f0 20 __ BEQ $289a ; (nforml.s13 + 0)
.s14:
287a : a0 04 __ LDY #$04
287c : b1 0d __ LDA (P0),y ; (si + 0)
287e : d0 1a __ BNE $289a ; (nforml.s13 + 0)
.s1013:
2880 : 88 __ __ DEY
2881 : b1 0d __ LDA (P0),y ; (si + 0)
2883 : c9 10 __ CMP #$10
2885 : d0 13 __ BNE $289a ; (nforml.s13 + 0)
.s11:
2887 : a9 58 __ LDA #$58
2889 : a6 44 __ LDX T2 + 0 
288b : 9d e6 bf STA $bfe6,x ; (wrapbuffer + 73)
288e : 8a __ __ TXA
288f : 18 __ __ CLC
2890 : 69 fe __ ADC #$fe
2892 : 85 44 __ STA T2 + 0 
2894 : aa __ __ TAX
2895 : a9 30 __ LDA #$30
2897 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 74)
.s13:
289a : a9 00 __ LDA #$00
289c : 85 1b __ STA ACCU + 0 
289e : a5 43 __ LDA T0 + 0 
28a0 : f0 06 __ BEQ $28a8 ; (nforml.s16 + 0)
.s15:
28a2 : c6 44 __ DEC T2 + 0 
28a4 : a9 2d __ LDA #$2d
28a6 : d0 0a __ BNE $28b2 ; (nforml.s1038 + 0)
.s16:
28a8 : a0 05 __ LDY #$05
28aa : b1 0d __ LDA (P0),y ; (si + 0)
28ac : f0 09 __ BEQ $28b7 ; (nforml.s163 + 0)
.s18:
28ae : c6 44 __ DEC T2 + 0 
28b0 : a9 2b __ LDA #$2b
.s1038:
28b2 : a6 44 __ LDX T2 + 0 
28b4 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 74)
.s163:
28b7 : a0 06 __ LDY #$06
28b9 : b1 0d __ LDA (P0),y ; (si + 0)
28bb : d0 33 __ BNE $28f0 ; (nforml.s24 + 0)
.l30:
28bd : a0 01 __ LDY #$01
28bf : b1 0d __ LDA (P0),y ; (si + 0)
28c1 : 18 __ __ CLC
28c2 : 65 44 __ ADC T2 + 0 
28c4 : b0 04 __ BCS $28ca ; (nforml.s31 + 0)
.s1006:
28c6 : c9 11 __ CMP #$11
28c8 : 90 0d __ BCC $28d7 ; (nforml.s33 + 0)
.s31:
28ca : c6 44 __ DEC T2 + 0 
28cc : a0 00 __ LDY #$00
28ce : b1 0d __ LDA (P0),y ; (si + 0)
28d0 : a6 44 __ LDX T2 + 0 
28d2 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 74)
28d5 : b0 e6 __ BCS $28bd ; (nforml.l30 + 0)
.s33:
28d7 : a6 44 __ LDX T2 + 0 
28d9 : e0 10 __ CPX #$10
28db : b0 0e __ BCS $28eb ; (nforml.s23 + 0)
.s34:
28dd : 88 __ __ DEY
.l1035:
28de : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 74)
28e1 : 91 0f __ STA (P2),y ; (str + 0)
28e3 : e8 __ __ INX
28e4 : e0 10 __ CPX #$10
28e6 : c8 __ __ INY
28e7 : 90 f5 __ BCC $28de ; (nforml.l1035 + 0)
.s1036:
28e9 : 84 1b __ STY ACCU + 0 
.s23:
28eb : a9 00 __ LDA #$00
28ed : 85 1c __ STA ACCU + 1 
.s1001:
28ef : 60 __ __ RTS
.s24:
28f0 : a6 44 __ LDX T2 + 0 
28f2 : e0 10 __ CPX #$10
28f4 : b0 1a __ BCS $2910 ; (nforml.l27 + 0)
.s25:
28f6 : a0 00 __ LDY #$00
.l1033:
28f8 : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 74)
28fb : 91 0f __ STA (P2),y ; (str + 0)
28fd : e8 __ __ INX
28fe : e0 10 __ CPX #$10
2900 : c8 __ __ INY
2901 : 90 f5 __ BCC $28f8 ; (nforml.l1033 + 0)
.s1034:
2903 : 84 1b __ STY ACCU + 0 
2905 : b0 09 __ BCS $2910 ; (nforml.l27 + 0)
.s28:
2907 : 88 __ __ DEY
2908 : b1 0d __ LDA (P0),y ; (si + 0)
290a : a4 1b __ LDY ACCU + 0 
290c : 91 0f __ STA (P2),y ; (str + 0)
290e : e6 1b __ INC ACCU + 0 
.l27:
2910 : a5 1b __ LDA ACCU + 0 
2912 : a0 01 __ LDY #$01
2914 : d1 0d __ CMP (P0),y ; (si + 0)
2916 : 90 ef __ BCC $2907 ; (nforml.s28 + 0)
2918 : 4c eb 28 JMP $28eb ; (nforml.s23 + 0)
.l6:
291b : a5 11 __ LDA P4 ; (v + 0)
291d : 85 1b __ STA ACCU + 0 
291f : a5 12 __ LDA P5 ; (v + 1)
2921 : 85 1c __ STA ACCU + 1 
2923 : a5 13 __ LDA P6 ; (v + 2)
2925 : 85 1d __ STA ACCU + 2 
2927 : a5 14 __ LDA P7 ; (v + 3)
2929 : 85 1e __ STA ACCU + 3 
292b : a5 45 __ LDA T5 + 0 
292d : 85 03 __ STA WORK + 0 
292f : a5 46 __ LDA T5 + 1 
2931 : 85 04 __ STA WORK + 1 
2933 : a9 00 __ LDA #$00
2935 : 85 05 __ STA WORK + 2 
2937 : 85 06 __ STA WORK + 3 
2939 : 20 13 65 JSR $6513 ; (divmod32 + 0)
293c : a5 08 __ LDA WORK + 5 
293e : 30 08 __ BMI $2948 ; (nforml.s78 + 0)
.s1023:
2940 : d0 0a __ BNE $294c ; (nforml.s77 + 0)
.s1022:
2942 : a5 07 __ LDA WORK + 4 
2944 : c9 0a __ CMP #$0a
2946 : b0 04 __ BCS $294c ; (nforml.s77 + 0)
.s78:
2948 : a9 30 __ LDA #$30
294a : d0 02 __ BNE $294e ; (nforml.s79 + 0)
.s77:
294c : a9 37 __ LDA #$37
.s79:
294e : 18 __ __ CLC
294f : 65 07 __ ADC WORK + 4 
2951 : c6 44 __ DEC T2 + 0 
2953 : a6 44 __ LDX T2 + 0 
2955 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 74)
2958 : a5 1b __ LDA ACCU + 0 
295a : 85 11 __ STA P4 ; (v + 0)
295c : a5 1c __ LDA ACCU + 1 
295e : 85 12 __ STA P5 ; (v + 1)
2960 : a5 1d __ LDA ACCU + 2 
2962 : 85 13 __ STA P6 ; (v + 2)
2964 : a5 1e __ LDA ACCU + 3 
2966 : 85 14 __ STA P7 ; (v + 3)
2968 : d0 b1 __ BNE $291b ; (nforml.l6 + 0)
.s1018:
296a : a5 13 __ LDA P6 ; (v + 2)
296c : d0 ad __ BNE $291b ; (nforml.l6 + 0)
.s1019:
296e : a5 12 __ LDA P5 ; (v + 1)
2970 : d0 a9 __ BNE $291b ; (nforml.l6 + 0)
.s1020:
2972 : c5 11 __ CMP P4 ; (v + 0)
2974 : 90 a5 __ BCC $291b ; (nforml.l6 + 0)
2976 : 4c 51 28 JMP $2851 ; (nforml.s7 + 0)
--------------------------------------------------------------------
2979 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2989 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2999 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->u8
.s0:
29a4 : 20 b0 29 JSR $29b0 ; (getpch + 0)
29a7 : c9 00 __ CMP #$00
29a9 : f0 f9 __ BEQ $29a4 ; (getch.s0 + 0)
29ab : 85 1b __ STA ACCU + 0 
.s1001:
29ad : a5 1b __ LDA ACCU + 0 
29af : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
29b0 : 20 e4 ff JSR $ffe4 
29b3 : ae fe 3e LDX $3efe ; (giocharmap + 0)
29b6 : e0 01 __ CPX #$01
29b8 : 90 26 __ BCC $29e0 ; (getpch + 48)
29ba : c9 0d __ CMP #$0d
29bc : d0 02 __ BNE $29c0 ; (getpch + 16)
29be : a9 0a __ LDA #$0a
29c0 : e0 02 __ CPX #$02
29c2 : 90 1c __ BCC $29e0 ; (getpch + 48)
29c4 : c9 db __ CMP #$db
29c6 : b0 18 __ BCS $29e0 ; (getpch + 48)
29c8 : c9 41 __ CMP #$41
29ca : 90 14 __ BCC $29e0 ; (getpch + 48)
29cc : c9 c1 __ CMP #$c1
29ce : 90 02 __ BCC $29d2 ; (getpch + 34)
29d0 : 49 a0 __ EOR #$a0
29d2 : c9 7b __ CMP #$7b
29d4 : b0 0a __ BCS $29e0 ; (getpch + 48)
29d6 : c9 61 __ CMP #$61
29d8 : b0 04 __ BCS $29de ; (getpch + 46)
29da : c9 5b __ CMP #$5b
29dc : b0 02 __ BCS $29e0 ; (getpch + 48)
29de : 49 20 __ EOR #$20
29e0 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
29e1 : 4c 81 ff JMP $ff81 
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
29e4 : 24 d7 __ BIT $d7 
29e6 : 10 01 __ BPL $29e9 ; (screen_setmode.s6 + 0)
.s1001:
29e8 : 60 __ __ RTS
.s6:
29e9 : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
29ec : 38 __ __ SEC
29ed : a5 23 __ LDA SP + 0 
29ef : e9 06 __ SBC #$06
29f1 : 85 23 __ STA SP + 0 
29f3 : b0 02 __ BCS $29f7 ; (bnk_init.s0 + 0)
29f5 : c6 24 __ DEC SP + 1 
.s0:
29f7 : a9 39 __ LDA #$39
29f9 : a0 02 __ LDY #$02
29fb : 91 23 __ STA (SP + 0),y 
29fd : a9 2a __ LDA #$2a
29ff : c8 __ __ INY
2a00 : 91 23 __ STA (SP + 0),y 
2a02 : a5 ba __ LDA $ba 
2a04 : d0 02 __ BNE $2a08 ; (bnk_init.s1002 + 0)
.s2:
2a06 : a9 08 __ LDA #$08
.s1002:
2a08 : 8d ff 3e STA $3eff ; (bootdevice + 0)
2a0b : a0 04 __ LDY #$04
2a0d : 91 23 __ STA (SP + 0),y 
2a0f : a9 00 __ LDA #$00
2a11 : c8 __ __ INY
2a12 : 91 23 __ STA (SP + 0),y 
2a14 : 20 52 22 JSR $2252 ; (printf.s0 + 0)
2a17 : a9 06 __ LDA #$06
2a19 : 8d 06 d5 STA $d506 
2a1c : a9 49 __ LDA #$49
2a1e : a0 02 __ LDY #$02
2a20 : 91 23 __ STA (SP + 0),y 
2a22 : a9 2a __ LDA #$2a
2a24 : c8 __ __ INY
2a25 : 91 23 __ STA (SP + 0),y 
2a27 : 20 52 22 JSR $2252 ; (printf.s0 + 0)
2a2a : 20 63 2a JSR $2a63 ; (load_overlay.s1000 + 0)
.s1001:
2a2d : 18 __ __ CLC
2a2e : a5 23 __ LDA SP + 0 
2a30 : 69 06 __ ADC #$06
2a32 : 85 23 __ STA SP + 0 
2a34 : 90 02 __ BCC $2a38 ; (bnk_init.s1001 + 11)
2a36 : e6 24 __ INC SP + 1 
2a38 : 60 __ __ RTS
--------------------------------------------------------------------
2a39 : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
2a49 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
2a59 : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
load_overlay: ; load_overlay(const u8*)->void
.s1000:
2a63 : 38 __ __ SEC
2a64 : a5 23 __ LDA SP + 0 
2a66 : e9 06 __ SBC #$06
2a68 : 85 23 __ STA SP + 0 
2a6a : b0 02 __ BCS $2a6e ; (load_overlay.s0 + 0)
2a6c : c6 24 __ DEC SP + 1 
.s0:
2a6e : a9 00 __ LDA #$00
2a70 : 85 0d __ STA P0 
2a72 : 85 0e __ STA P1 
2a74 : 20 ee 2a JSR $2aee ; (krnio_setbnk.s0 + 0)
2a77 : a9 e3 __ LDA #$e3
2a79 : 85 0d __ STA P0 
2a7b : a9 2a __ LDA #$2a
2a7d : 85 0e __ STA P1 
2a7f : 20 f5 2a JSR $2af5 ; (krnio_setnam.s0 + 0)
2a82 : a9 e3 __ LDA #$e3
2a84 : a0 04 __ LDY #$04
2a86 : 91 23 __ STA (SP + 0),y 
2a88 : a9 2a __ LDA #$2a
2a8a : c8 __ __ INY
2a8b : 91 23 __ STA (SP + 0),y 
2a8d : a9 0b __ LDA #$0b
2a8f : a0 02 __ LDY #$02
2a91 : 91 23 __ STA (SP + 0),y 
2a93 : a9 2b __ LDA #$2b
2a95 : c8 __ __ INY
2a96 : 91 23 __ STA (SP + 0),y 
2a98 : 20 52 22 JSR $2252 ; (printf.s0 + 0)
2a9b : a9 01 __ LDA #$01
2a9d : 85 0d __ STA P0 
2a9f : 85 0f __ STA P2 
2aa1 : ad ff 3e LDA $3eff ; (bootdevice + 0)
2aa4 : 85 0e __ STA P1 
2aa6 : 20 18 2b JSR $2b18 ; (krnio_load.s0 + 0)
2aa9 : 09 00 __ ORA #$00
2aab : d0 2a __ BNE $2ad7 ; (load_overlay.s1001 + 0)
.s1:
2aad : a9 35 __ LDA #$35
2aaf : a0 02 __ LDY #$02
2ab1 : 91 23 __ STA (SP + 0),y 
2ab3 : a9 2b __ LDA #$2b
2ab5 : c8 __ __ INY
2ab6 : 91 23 __ STA (SP + 0),y 
2ab8 : 20 52 22 JSR $2252 ; (printf.s0 + 0)
2abb : a9 53 __ LDA #$53
2abd : a0 02 __ LDY #$02
2abf : 91 23 __ STA (SP + 0),y 
2ac1 : a9 2b __ LDA #$2b
2ac3 : c8 __ __ INY
2ac4 : 91 23 __ STA (SP + 0),y 
2ac6 : ad c4 6d LDA $6dc4 ; (krnio_pstatus + 1)
2ac9 : c8 __ __ INY
2aca : 91 23 __ STA (SP + 0),y 
2acc : a9 00 __ LDA #$00
2ace : c8 __ __ INY
2acf : 91 23 __ STA (SP + 0),y 
2ad1 : 20 52 22 JSR $2252 ; (printf.s0 + 0)
2ad4 : 20 5f 2b JSR $2b5f ; (exit@proxy + 0)
.s1001:
2ad7 : 18 __ __ CLC
2ad8 : a5 23 __ LDA SP + 0 
2ada : 69 06 __ ADC #$06
2adc : 85 23 __ STA SP + 0 
2ade : 90 02 __ BCC $2ae2 ; (load_overlay.s1001 + 11)
2ae0 : e6 24 __ INC SP + 1 
2ae2 : 60 __ __ RTS
--------------------------------------------------------------------
2ae3 : __ __ __ BYT 56 44 43 54 45 53 54 4c 4d 43 00                : VDCTESTLMC.
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
2aee : a5 0d __ LDA P0 
2af0 : a6 0e __ LDX P1 
2af2 : 4c 68 ff JMP $ff68 
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
2af5 : a5 0d __ LDA P0 
2af7 : 05 0e __ ORA P1 
2af9 : f0 08 __ BEQ $2b03 ; (krnio_setnam.s0 + 14)
2afb : a0 ff __ LDY #$ff
2afd : c8 __ __ INY
2afe : b1 0d __ LDA (P0),y 
2b00 : d0 fb __ BNE $2afd ; (krnio_setnam.s0 + 8)
2b02 : 98 __ __ TYA
2b03 : a6 0d __ LDX P0 
2b05 : a4 0e __ LDY P1 
2b07 : 20 bd ff JSR $ffbd 
.s1001:
2b0a : 60 __ __ RTS
--------------------------------------------------------------------
2b0b : __ __ __ BYT 4c 4f 41 44 49 4e 47 3a 20 25 53 0a 00          : LOADING: %S..
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
2b18 : a5 0d __ LDA P0 
2b1a : a6 0e __ LDX P1 
2b1c : a4 0f __ LDY P2 
2b1e : 20 ba ff JSR $ffba 
2b21 : a9 00 __ LDA #$00
2b23 : a2 00 __ LDX #$00
2b25 : a0 00 __ LDY #$00
2b27 : 20 d5 ff JSR $ffd5 
2b2a : a9 00 __ LDA #$00
2b2c : b0 02 __ BCS $2b30 ; (krnio_load.s0 + 24)
2b2e : a9 01 __ LDA #$01
2b30 : 85 1b __ STA ACCU + 0 
.s1001:
2b32 : a5 1b __ LDA ACCU + 0 
2b34 : 60 __ __ RTS
--------------------------------------------------------------------
2b35 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
2b45 : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
2b53 : __ __ __ BYT 53 54 41 54 55 53 3a 20 25 44 0a 00             : STATUS: %D..
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
2b5f : a9 01 __ LDA #$01
2b61 : 85 0d __ STA P0 
2b63 : a9 00 __ LDA #$00
2b65 : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
2b67 : a5 0d __ LDA P0 
2b69 : 85 1b __ STA ACCU + 0 
2b6b : a5 0e __ LDA P1 
2b6d : 85 1c __ STA ACCU + 1 
2b6f : ae ff 37 LDX $37ff ; (spentry + 0)
2b72 : 9a __ __ TXS
2b73 : a9 4c __ LDA #$4c
2b75 : 85 54 __ STA $54 
2b77 : a9 00 __ LDA #$00
2b79 : 85 13 __ STA P6 
.s1001:
2b7b : 60 __ __ RTS
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2b7c : 09 00 __ ORA #$00
2b7e : d0 0d __ BNE $2b8d ; (fastmode.s1 + 0)
.s2:
2b80 : 8d 30 d0 STA $d030 
2b83 : ad 11 d0 LDA $d011 
2b86 : 29 7f __ AND #$7f
2b88 : 09 10 __ ORA #$10
2b8a : 4c 97 2b JMP $2b97 ; (fastmode.s3 + 0)
.s1:
2b8d : a9 01 __ LDA #$01
2b8f : 8d 30 d0 STA $d030 
2b92 : ad 11 d0 LDA $d011 
2b95 : 29 6f __ AND #$6f
.s3:
2b97 : 8d 11 d0 STA $d011 
.s1001:
2b9a : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode@proxy: ; vdc_set_mode@proxy
2b9b : a9 00 __ LDA #$00
2b9d : 85 16 __ STA P9 
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s0:
2b9f : a4 16 __ LDY P9 ; (mode + 0)
2ba1 : be 01 67 LDX $6701,y ; (__multab36L + 0)
2ba4 : 86 49 __ STX T1 + 0 
2ba6 : 86 4b __ STX T2 + 0 
2ba8 : bd 04 68 LDA $6804,x ; (vdc_modes + 4)
2bab : f0 08 __ BEQ $2bb5 ; (vdc_set_mode.s3 + 0)
.s4:
2bad : ad e4 6c LDA $6ce4 ; (vdc_state + 0)
2bb0 : c9 10 __ CMP #$10
2bb2 : d0 01 __ BNE $2bb5 ; (vdc_set_mode.s3 + 0)
2bb4 : 60 __ __ RTS
.s3:
2bb5 : 8c e6 6c STY $6ce6 ; (vdc_state + 2)
2bb8 : a9 00 __ LDA #$00
2bba : 8d fa 6c STA $6cfa ; (vdc_state + 22)
2bbd : 8d fb 6c STA $6cfb ; (vdc_state + 23)
2bc0 : 8d fc 6c STA $6cfc ; (vdc_state + 24)
2bc3 : bd 00 68 LDA $6800,x ; (vdc_modes + 0)
2bc6 : 8d e7 6c STA $6ce7 ; (vdc_state + 3)
2bc9 : bd 01 68 LDA $6801,x ; (vdc_modes + 1)
2bcc : 8d e8 6c STA $6ce8 ; (vdc_state + 4)
2bcf : bd 02 68 LDA $6802,x ; (vdc_modes + 2)
2bd2 : 8d e9 6c STA $6ce9 ; (vdc_state + 5)
2bd5 : bd 03 68 LDA $6803,x ; (vdc_modes + 3)
2bd8 : 8d ea 6c STA $6cea ; (vdc_state + 6)
2bdb : bd 09 68 LDA $6809,x ; (vdc_modes + 9)
2bde : 8d f0 6c STA $6cf0 ; (vdc_state + 12)
2be1 : bd 0a 68 LDA $680a,x ; (vdc_modes + 10)
2be4 : 8d f1 6c STA $6cf1 ; (vdc_state + 13)
2be7 : bd 0b 68 LDA $680b,x ; (vdc_modes + 11)
2bea : 8d f2 6c STA $6cf2 ; (vdc_state + 14)
2bed : bd 0c 68 LDA $680c,x ; (vdc_modes + 12)
2bf0 : 8d f3 6c STA $6cf3 ; (vdc_state + 15)
2bf3 : bd 0d 68 LDA $680d,x ; (vdc_modes + 13)
2bf6 : 8d f4 6c STA $6cf4 ; (vdc_state + 16)
2bf9 : bd 0e 68 LDA $680e,x ; (vdc_modes + 14)
2bfc : 8d f5 6c STA $6cf5 ; (vdc_state + 17)
2bff : bd 0f 68 LDA $680f,x ; (vdc_modes + 15)
2c02 : 8d f6 6c STA $6cf6 ; (vdc_state + 18)
2c05 : bd 10 68 LDA $6810,x ; (vdc_modes + 16)
2c08 : 8d f7 6c STA $6cf7 ; (vdc_state + 19)
2c0b : bd 11 68 LDA $6811,x ; (vdc_modes + 17)
2c0e : 8d f8 6c STA $6cf8 ; (vdc_state + 20)
2c11 : bd 12 68 LDA $6812,x ; (vdc_modes + 18)
2c14 : 8d f9 6c STA $6cf9 ; (vdc_state + 21)
2c17 : bd 05 68 LDA $6805,x ; (vdc_modes + 5)
2c1a : 85 4c __ STA T3 + 0 
2c1c : 8d ec 6c STA $6cec ; (vdc_state + 8)
2c1f : bd 06 68 LDA $6806,x ; (vdc_modes + 6)
2c22 : 85 4d __ STA T3 + 1 
2c24 : 8d ed 6c STA $6ced ; (vdc_state + 9)
2c27 : bd 07 68 LDA $6807,x ; (vdc_modes + 7)
2c2a : 85 4e __ STA T5 + 0 
2c2c : 8d ee 6c STA $6cee ; (vdc_state + 10)
2c2f : bd 08 68 LDA $6808,x ; (vdc_modes + 8)
2c32 : 85 4f __ STA T5 + 1 
2c34 : 8d ef 6c STA $6cef ; (vdc_state + 11)
2c37 : 20 0f 2d JSR $2d0f ; (vdc_set_multab.s0 + 0)
2c3a : a9 22 __ LDA #$22
2c3c : 8d 00 d6 STA $d600 
.l295:
2c3f : 2c 00 d6 BIT $d600 
2c42 : 10 fb __ BPL $2c3f ; (vdc_set_mode.l295 + 0)
.s11:
2c44 : a9 80 __ LDA #$80
2c46 : 8d 01 d6 STA $d601 
2c49 : a9 0c __ LDA #$0c
2c4b : 8d 00 d6 STA $d600 
.l297:
2c4e : 2c 00 d6 BIT $d600 
2c51 : 10 fb __ BPL $2c4e ; (vdc_set_mode.l297 + 0)
.s17:
2c53 : a5 4d __ LDA T3 + 1 
2c55 : 8d 01 d6 STA $d601 
2c58 : a9 0d __ LDA #$0d
2c5a : 8d 00 d6 STA $d600 
.l299:
2c5d : 2c 00 d6 BIT $d600 
2c60 : 10 fb __ BPL $2c5d ; (vdc_set_mode.l299 + 0)
.s22:
2c62 : a5 4c __ LDA T3 + 0 
2c64 : 8d 01 d6 STA $d601 
2c67 : a9 14 __ LDA #$14
2c69 : 8d 00 d6 STA $d600 
.l301:
2c6c : 2c 00 d6 BIT $d600 
2c6f : 10 fb __ BPL $2c6c ; (vdc_set_mode.l301 + 0)
.s27:
2c71 : a5 4f __ LDA T5 + 1 
2c73 : 8d 01 d6 STA $d601 
2c76 : a9 15 __ LDA #$15
2c78 : 8d 00 d6 STA $d600 
.l303:
2c7b : 2c 00 d6 BIT $d600 
2c7e : 10 fb __ BPL $2c7b ; (vdc_set_mode.l303 + 0)
.s32:
2c80 : a5 4e __ LDA T5 + 0 
2c82 : 8d 01 d6 STA $d601 
2c85 : a6 49 __ LDX T1 + 0 
2c87 : bd 0e 68 LDA $680e,x ; (vdc_modes + 14)
2c8a : 85 4d __ STA T3 + 1 
2c8c : a9 1c __ LDA #$1c
2c8e : 8d 00 d6 STA $d600 
.l305:
2c91 : 2c 00 d6 BIT $d600 
2c94 : 10 fb __ BPL $2c91 ; (vdc_set_mode.l305 + 0)
.s39:
2c96 : ad 01 d6 LDA $d601 
2c99 : 29 10 __ AND #$10
2c9b : 45 4d __ EOR T3 + 1 
2c9d : 29 1f __ AND #$1f
2c9f : 45 4d __ EOR T3 + 1 
2ca1 : a2 1c __ LDX #$1c
2ca3 : 8e 00 d6 STX $d600 
.l307:
2ca6 : 2c 00 d6 BIT $d600 
2ca9 : 10 fb __ BPL $2ca6 ; (vdc_set_mode.l307 + 0)
.s45:
2cab : 8d 01 d6 STA $d601 
2cae : 20 6a 2d JSR $2d6a ; (vdc_restore_charsets.s0 + 0)
2cb1 : 18 __ __ CLC
2cb2 : a9 13 __ LDA #$13
2cb4 : 65 49 __ ADC T1 + 0 
2cb6 : 85 49 __ STA T1 + 0 
2cb8 : a9 68 __ LDA #$68
2cba : 69 00 __ ADC #$00
2cbc : 85 4a __ STA T1 + 1 
2cbe : 18 __ __ CLC
2cbf : a5 4b __ LDA T2 + 0 
2cc1 : 69 13 __ ADC #$13
2cc3 : 85 4c __ STA T3 + 0 
2cc5 : a9 00 __ LDA #$00
2cc7 : 85 43 __ STA T0 + 0 
2cc9 : 69 68 __ ADC #$68
2ccb : 85 4d __ STA T3 + 1 
.l46:
2ccd : a4 43 __ LDY T0 + 0 
2ccf : b1 49 __ LDA (T1 + 0),y 
2cd1 : 85 47 __ STA T7 + 0 
2cd3 : c8 __ __ INY
2cd4 : b1 49 __ LDA (T1 + 0),y 
2cd6 : aa __ __ TAX
2cd7 : a5 47 __ LDA T7 + 0 
2cd9 : 8d 00 d6 STA $d600 
2cdc : c8 __ __ INY
2cdd : 84 43 __ STY T0 + 0 
.l309:
2cdf : 2c 00 d6 BIT $d600 
2ce2 : 10 fb __ BPL $2cdf ; (vdc_set_mode.l309 + 0)
.s52:
2ce4 : 8e 01 d6 STX $d601 
2ce7 : b1 4c __ LDA (T3 + 0),y 
2ce9 : c9 ff __ CMP #$ff
2ceb : d0 e0 __ BNE $2ccd ; (vdc_set_mode.l46 + 0)
.s47:
2ced : a6 4b __ LDX T2 + 0 
2cef : bd 04 68 LDA $6804,x ; (vdc_modes + 4)
2cf2 : f0 08 __ BEQ $2cfc ; (vdc_set_mode.s55 + 0)
.s56:
2cf4 : ad e5 6c LDA $6ce5 ; (vdc_state + 1)
2cf7 : d0 03 __ BNE $2cfc ; (vdc_set_mode.s55 + 0)
.s53:
2cf9 : 20 89 2d JSR $2d89 ; (vdc_set_extended_memsize.s0 + 0)
.s55:
2cfc : 20 40 21 JSR $2140 ; (vdc_cls.s0 + 0)
2cff : a9 22 __ LDA #$22
2d01 : 8d 00 d6 STA $d600 
.l314:
2d04 : 2c 00 d6 BIT $d600 
2d07 : 10 fb __ BPL $2d04 ; (vdc_set_mode.l314 + 0)
.s62:
2d09 : a9 7d __ LDA #$7d
2d0b : 8d 01 d6 STA $d601 
.s1001:
2d0e : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
2d0f : ad ea 6c LDA $6cea ; (vdc_state + 6)
2d12 : 85 1c __ STA ACCU + 1 
2d14 : ad e9 6c LDA $6ce9 ; (vdc_state + 5)
2d17 : 85 1b __ STA ACCU + 0 
2d19 : 05 1c __ ORA ACCU + 1 
2d1b : f0 4c __ BEQ $2d69 ; (vdc_set_multab.s1001 + 0)
.s5:
2d1d : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
2d20 : 18 __ __ CLC
2d21 : 6d fc 6c ADC $6cfc ; (vdc_state + 24)
2d24 : 85 43 __ STA T2 + 0 
2d26 : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
2d29 : 69 00 __ ADC #$00
2d2b : 85 44 __ STA T2 + 1 
2d2d : a9 00 __ LDA #$00
2d2f : 85 45 __ STA T3 + 0 
2d31 : 85 46 __ STA T3 + 1 
2d33 : a9 00 __ LDA #$00
2d35 : 85 47 __ STA T4 + 0 
2d37 : a9 6e __ LDA #$6e
2d39 : 85 48 __ STA T4 + 1 
2d3b : a2 00 __ LDX #$00
.l2:
2d3d : a5 45 __ LDA T3 + 0 
2d3f : a0 00 __ LDY #$00
2d41 : 91 47 __ STA (T4 + 0),y 
2d43 : a5 46 __ LDA T3 + 1 
2d45 : c8 __ __ INY
2d46 : 91 47 __ STA (T4 + 0),y 
2d48 : 18 __ __ CLC
2d49 : a5 43 __ LDA T2 + 0 
2d4b : 65 45 __ ADC T3 + 0 
2d4d : 85 45 __ STA T3 + 0 
2d4f : a5 44 __ LDA T2 + 1 
2d51 : 65 46 __ ADC T3 + 1 
2d53 : 85 46 __ STA T3 + 1 
2d55 : 18 __ __ CLC
2d56 : a5 47 __ LDA T4 + 0 
2d58 : 69 02 __ ADC #$02
2d5a : 85 47 __ STA T4 + 0 
2d5c : 90 02 __ BCC $2d60 ; (vdc_set_multab.s1006 + 0)
.s1005:
2d5e : e6 48 __ INC T4 + 1 
.s1006:
2d60 : e8 __ __ INX
2d61 : a5 1c __ LDA ACCU + 1 
2d63 : d0 d8 __ BNE $2d3d ; (vdc_set_multab.l2 + 0)
.s1002:
2d65 : e4 1b __ CPX ACCU + 0 
2d67 : 90 d4 __ BCC $2d3d ; (vdc_set_multab.l2 + 0)
.s1001:
2d69 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
2d6a : a9 01 __ LDA #$01
2d6c : 85 11 __ STA P4 
2d6e : a9 02 __ LDA #$02
2d70 : 85 15 __ STA P8 
2d72 : ad f4 6c LDA $6cf4 ; (vdc_state + 16)
2d75 : 85 0f __ STA P2 
2d77 : ad f5 6c LDA $6cf5 ; (vdc_state + 17)
2d7a : 85 10 __ STA P3 
2d7c : a9 00 __ LDA #$00
2d7e : 85 14 __ STA P7 
2d80 : 85 12 __ STA P5 
2d82 : a9 d0 __ LDA #$d0
2d84 : 85 13 __ STA P6 
2d86 : 4c 00 13 JMP $1300 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
2d89 : ad e4 6c LDA $6ce4 ; (vdc_state + 0)
2d8c : c9 10 __ CMP #$10
2d8e : f0 4d __ BEQ $2ddd ; (vdc_set_extended_memsize.s1001 + 0)
.s4:
2d90 : ad e5 6c LDA $6ce5 ; (vdc_state + 1)
2d93 : d0 48 __ BNE $2ddd ; (vdc_set_extended_memsize.s1001 + 0)
.s3:
2d95 : a9 22 __ LDA #$22
2d97 : 8d 00 d6 STA $d600 
.l120:
2d9a : 2c 00 d6 BIT $d600 
2d9d : 10 fb __ BPL $2d9a ; (vdc_set_extended_memsize.l120 + 0)
.s11:
2d9f : a9 80 __ LDA #$80
2da1 : 8d 01 d6 STA $d601 
2da4 : 20 de 2d JSR $2dde ; (vdc_wipe_mem.s0 + 0)
2da7 : a9 1c __ LDA #$1c
2da9 : 8d 00 d6 STA $d600 
.l122:
2dac : 2c 00 d6 BIT $d600 
2daf : 10 fb __ BPL $2dac ; (vdc_set_extended_memsize.l122 + 0)
.s17:
2db1 : ad 01 d6 LDA $d601 
2db4 : 09 10 __ ORA #$10
2db6 : a2 1c __ LDX #$1c
2db8 : 8e 00 d6 STX $d600 
.l124:
2dbb : 2c 00 d6 BIT $d600 
2dbe : 10 fb __ BPL $2dbb ; (vdc_set_extended_memsize.l124 + 0)
.s23:
2dc0 : 8d 01 d6 STA $d601 
2dc3 : 20 6a 2d JSR $2d6a ; (vdc_restore_charsets.s0 + 0)
2dc6 : 20 40 21 JSR $2140 ; (vdc_cls.s0 + 0)
2dc9 : a9 22 __ LDA #$22
2dcb : 8d 00 d6 STA $d600 
.l126:
2dce : 2c 00 d6 BIT $d600 
2dd1 : 10 fb __ BPL $2dce ; (vdc_set_extended_memsize.l126 + 0)
.s29:
2dd3 : a9 7d __ LDA #$7d
2dd5 : 8d 01 d6 STA $d601 
2dd8 : a9 01 __ LDA #$01
2dda : 8d e5 6c STA $6ce5 ; (vdc_state + 1)
.s1001:
2ddd : 60 __ __ RTS
--------------------------------------------------------------------
vdc_wipe_mem: ; vdc_wipe_mem()->void
.s0:
2dde : a9 00 __ LDA #$00
2de0 : 85 44 __ STA T0 + 1 
2de2 : 85 0d __ STA P0 
2de4 : a9 ff __ LDA #$ff
2de6 : 85 45 __ STA T1 + 0 
.l2:
2de8 : 20 be 67 JSR $67be ; (vdc_mem_addr@proxy + 0)
.l252:
2deb : 2c 00 d6 BIT $d600 
2dee : 10 fb __ BPL $2deb ; (vdc_wipe_mem.l252 + 0)
.s8:
2df0 : a9 00 __ LDA #$00
2df2 : 8d 01 d6 STA $d601 
2df5 : a9 18 __ LDA #$18
2df7 : 8d 00 d6 STA $d600 
.l254:
2dfa : 2c 00 d6 BIT $d600 
2dfd : 10 fb __ BPL $2dfa ; (vdc_wipe_mem.l254 + 0)
.s14:
2dff : ad 01 d6 LDA $d601 
2e02 : 29 7f __ AND #$7f
2e04 : a2 18 __ LDX #$18
2e06 : 8e 00 d6 STX $d600 
.l256:
2e09 : 2c 00 d6 BIT $d600 
2e0c : 10 fb __ BPL $2e09 ; (vdc_wipe_mem.l256 + 0)
.s20:
2e0e : 8d 01 d6 STA $d601 
2e11 : a9 1e __ LDA #$1e
2e13 : 8d 00 d6 STA $d600 
.l258:
2e16 : 2c 00 d6 BIT $d600 
2e19 : 10 fb __ BPL $2e16 ; (vdc_wipe_mem.l258 + 0)
.s25:
2e1b : e6 44 __ INC T0 + 1 
2e1d : a9 ff __ LDA #$ff
2e1f : 8d 01 d6 STA $d601 
2e22 : c6 45 __ DEC T1 + 0 
2e24 : d0 c2 __ BNE $2de8 ; (vdc_wipe_mem.l2 + 0)
.s4:
2e26 : 20 be 67 JSR $67be ; (vdc_mem_addr@proxy + 0)
.l261:
2e29 : 2c 00 d6 BIT $d600 
2e2c : 10 fb __ BPL $2e29 ; (vdc_wipe_mem.l261 + 0)
.s29:
2e2e : a9 00 __ LDA #$00
2e30 : 8d 01 d6 STA $d601 
2e33 : a9 18 __ LDA #$18
2e35 : 8d 00 d6 STA $d600 
.l263:
2e38 : 2c 00 d6 BIT $d600 
2e3b : 10 fb __ BPL $2e38 ; (vdc_wipe_mem.l263 + 0)
.s35:
2e3d : ad 01 d6 LDA $d601 
2e40 : 29 7f __ AND #$7f
2e42 : a2 18 __ LDX #$18
2e44 : 8e 00 d6 STX $d600 
.l265:
2e47 : 2c 00 d6 BIT $d600 
2e4a : 10 fb __ BPL $2e47 ; (vdc_wipe_mem.l265 + 0)
.s41:
2e4c : 8d 01 d6 STA $d601 
2e4f : a9 1e __ LDA #$1e
2e51 : 8d 00 d6 STA $d600 
.l267:
2e54 : 2c 00 d6 BIT $d600 
2e57 : 10 fb __ BPL $2e54 ; (vdc_wipe_mem.l267 + 0)
.s46:
2e59 : a9 ff __ LDA #$ff
2e5b : 8d 01 d6 STA $d601 
.s1001:
2e5e : 60 __ __ RTS
--------------------------------------------------------------------
2e5f : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 6f 53 43 41 52 36 34 : sTARTING oSCAR64
2e6f : __ __ __ BYT 20 76 64 63 20 44 45 4d 4f 2e 00                :  vdc DEMO..
--------------------------------------------------------------------
menu_placeheader: ; menu_placeheader(const u8*)->void
.s0:
2e7a : a9 00 __ LDA #$00
2e7c : 85 0f __ STA P2 
2e7e : 85 10 __ STA P3 
2e80 : a9 20 __ LDA #$20
2e82 : 85 11 __ STA P4 
2e84 : a9 c5 __ LDA #$c5
2e86 : 85 12 __ STA P5 
2e88 : a9 50 __ LDA #$50
2e8a : 85 13 __ STA P6 
2e8c : 20 7f 21 JSR $217f ; (vdc_hchar.s0 + 0)
2e8f : a9 c5 __ LDA #$c5
2e91 : 85 13 __ STA P6 
2e93 : a9 5a __ LDA #$5a
2e95 : 85 11 __ STA P4 
2e97 : a9 37 __ LDA #$37
2e99 : 85 12 __ STA P5 
--------------------------------------------------------------------
vdc_prints_attr: ; vdc_prints_attr(u8,u8,const u8*,u8)->void
.s0:
2e9b : a5 11 __ LDA P4 ; (string + 0)
2e9d : 85 0d __ STA P0 
2e9f : 85 43 __ STA T0 + 0 
2ea1 : a5 12 __ LDA P5 ; (string + 1)
2ea3 : 85 0e __ STA P1 
2ea5 : 85 44 __ STA T0 + 1 
2ea7 : a5 10 __ LDA P3 ; (y + 0)
2ea9 : 0a __ __ ASL
2eaa : aa __ __ TAX
2eab : bd 00 6e LDA $6e00,x ; (multab + 0)
2eae : 85 46 __ STA T2 + 0 
2eb0 : bd 01 6e LDA $6e01,x ; (multab + 1)
2eb3 : 85 47 __ STA T2 + 1 
2eb5 : 20 3c 2f JSR $2f3c ; (strlen.s0 + 0)
2eb8 : a5 1b __ LDA ACCU + 0 
2eba : 85 48 __ STA T3 + 0 
2ebc : 18 __ __ CLC
2ebd : a5 0f __ LDA P2 ; (x + 0)
2ebf : 65 46 __ ADC T2 + 0 
2ec1 : 85 46 __ STA T2 + 0 
2ec3 : 90 02 __ BCC $2ec7 ; (vdc_prints_attr.s1015 + 0)
.s1014:
2ec5 : e6 47 __ INC T2 + 1 
.s1015:
2ec7 : 18 __ __ CLC
2ec8 : 6d ec 6c ADC $6cec ; (vdc_state + 8)
2ecb : 85 0d __ STA P0 
2ecd : ad ed 6c LDA $6ced ; (vdc_state + 9)
2ed0 : 65 47 __ ADC T2 + 1 
2ed2 : 85 0e __ STA P1 
2ed4 : 20 2e 22 JSR $222e ; (vdc_mem_addr.s0 + 0)
2ed7 : a5 48 __ LDA T3 + 0 
2ed9 : f0 18 __ BEQ $2ef3 ; (vdc_prints_attr.s6 + 0)
.s36:
2edb : a0 00 __ LDY #$00
.l4:
2edd : 84 45 __ STY T1 + 0 
2edf : b1 43 __ LDA (T0 + 0),y 
2ee1 : 20 60 2f JSR $2f60 ; (pet2screen.s0 + 0)
.l164:
2ee4 : 2c 00 d6 BIT $d600 
2ee7 : 10 fb __ BPL $2ee4 ; (vdc_prints_attr.l164 + 0)
.s9:
2ee9 : 8d 01 d6 STA $d601 
2eec : a4 45 __ LDY T1 + 0 
2eee : c8 __ __ INY
2eef : c4 48 __ CPY T3 + 0 
2ef1 : 90 ea __ BCC $2edd ; (vdc_prints_attr.l4 + 0)
.s6:
2ef3 : ad ee 6c LDA $6cee ; (vdc_state + 10)
2ef6 : 18 __ __ CLC
2ef7 : 65 46 __ ADC T2 + 0 
2ef9 : 85 0d __ STA P0 
2efb : ad ef 6c LDA $6cef ; (vdc_state + 11)
2efe : 65 47 __ ADC T2 + 1 
2f00 : 85 0e __ STA P1 
2f02 : 20 2e 22 JSR $222e ; (vdc_mem_addr.s0 + 0)
2f05 : a6 48 __ LDX T3 + 0 
2f07 : ca __ __ DEX
.l167:
2f08 : 2c 00 d6 BIT $d600 
2f0b : 10 fb __ BPL $2f08 ; (vdc_prints_attr.l167 + 0)
.s13:
2f0d : a5 13 __ LDA P6 ; (attr + 0)
2f0f : 8d 01 d6 STA $d601 
2f12 : a9 18 __ LDA #$18
2f14 : 8d 00 d6 STA $d600 
.l169:
2f17 : 2c 00 d6 BIT $d600 
2f1a : 10 fb __ BPL $2f17 ; (vdc_prints_attr.l169 + 0)
.s19:
2f1c : ad 01 d6 LDA $d601 
2f1f : 29 7f __ AND #$7f
2f21 : a0 18 __ LDY #$18
2f23 : 8c 00 d6 STY $d600 
.l171:
2f26 : 2c 00 d6 BIT $d600 
2f29 : 10 fb __ BPL $2f26 ; (vdc_prints_attr.l171 + 0)
.s25:
2f2b : 8d 01 d6 STA $d601 
2f2e : a9 1e __ LDA #$1e
2f30 : 8d 00 d6 STA $d600 
.l173:
2f33 : 2c 00 d6 BIT $d600 
2f36 : 10 fb __ BPL $2f33 ; (vdc_prints_attr.l173 + 0)
.s30:
2f38 : 8e 01 d6 STX $d601 
.s1001:
2f3b : 60 __ __ RTS
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
2f3c : a9 00 __ LDA #$00
2f3e : 85 1b __ STA ACCU + 0 
2f40 : 85 1c __ STA ACCU + 1 
2f42 : a8 __ __ TAY
2f43 : b1 0d __ LDA (P0),y ; (str + 0)
2f45 : f0 18 __ BEQ $2f5f ; (strlen.s1001 + 0)
.s2:
2f47 : a5 0d __ LDA P0 ; (str + 0)
2f49 : 85 1b __ STA ACCU + 0 
2f4b : a2 00 __ LDX #$00
.l1002:
2f4d : c8 __ __ INY
2f4e : d0 01 __ BNE $2f51 ; (strlen.s1005 + 0)
.s1004:
2f50 : e8 __ __ INX
.s1005:
2f51 : 8a __ __ TXA
2f52 : 18 __ __ CLC
2f53 : 65 0e __ ADC P1 ; (str + 1)
2f55 : 85 1c __ STA ACCU + 1 
2f57 : b1 1b __ LDA (ACCU + 0),y 
2f59 : d0 f2 __ BNE $2f4d ; (strlen.l1002 + 0)
.s1003:
2f5b : 86 1c __ STX ACCU + 1 
2f5d : 84 1b __ STY ACCU + 0 
.s1001:
2f5f : 60 __ __ RTS
--------------------------------------------------------------------
pet2screen: ; pet2screen(u8)->u8
.s0:
2f60 : c9 20 __ CMP #$20
2f62 : b0 03 __ BCS $2f67 ; (pet2screen.s2 + 0)
.s1:
2f64 : 69 80 __ ADC #$80
2f66 : 60 __ __ RTS
.s2:
2f67 : c9 40 __ CMP #$40
2f69 : 90 27 __ BCC $2f92 ; (pet2screen.s21 + 0)
.s7:
2f6b : c9 60 __ CMP #$60
2f6d : 90 17 __ BCC $2f86 ; (pet2screen.s4 + 0)
.s11:
2f6f : 09 00 __ ORA #$00
2f71 : 30 04 __ BMI $2f77 ; (pet2screen.s9 + 0)
.s8:
2f73 : 38 __ __ SEC
2f74 : e9 20 __ SBC #$20
2f76 : 60 __ __ RTS
.s9:
2f77 : c9 80 __ CMP #$80
2f79 : 90 17 __ BCC $2f92 ; (pet2screen.s21 + 0)
.s15:
2f7b : c9 a0 __ CMP #$a0
2f7d : b0 03 __ BCS $2f82 ; (pet2screen.s19 + 0)
.s12:
2f7f : 69 40 __ ADC #$40
2f81 : 60 __ __ RTS
.s19:
2f82 : c9 c0 __ CMP #$c0
2f84 : b0 04 __ BCS $2f8a ; (pet2screen.s23 + 0)
.s4:
2f86 : 38 __ __ SEC
2f87 : e9 40 __ SBC #$40
2f89 : 60 __ __ RTS
.s23:
2f8a : c9 ff __ CMP #$ff
2f8c : b0 04 __ BCS $2f92 ; (pet2screen.s21 + 0)
.s20:
2f8e : 38 __ __ SEC
2f8f : e9 80 __ SBC #$80
2f91 : 60 __ __ RTS
.s21:
2f92 : c9 ff __ CMP #$ff
2f94 : d0 02 __ BNE $2f98 ; (pet2screen.s1001 + 0)
.s24:
2f96 : a9 5e __ LDA #$5e
.s1001:
2f98 : 60 __ __ RTS
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s0:
2f99 : a9 00 __ LDA #$00
2f9b : 8d fb bf STA $bffb ; (sstack + 4)
2f9e : a0 02 __ LDY #$02
2fa0 : b1 23 __ LDA (SP + 0),y 
2fa2 : 85 16 __ STA P9 
2fa4 : c8 __ __ INY
2fa5 : b1 23 __ LDA (SP + 0),y 
2fa7 : 85 17 __ STA P10 
2fa9 : c8 __ __ INY
2faa : b1 23 __ LDA (SP + 0),y 
2fac : 8d f7 bf STA $bff7 ; (sstack + 0)
2faf : c8 __ __ INY
2fb0 : b1 23 __ LDA (SP + 0),y 
2fb2 : 8d f8 bf STA $bff8 ; (sstack + 1)
2fb5 : 18 __ __ CLC
2fb6 : a5 23 __ LDA SP + 0 
2fb8 : 69 06 __ ADC #$06
2fba : 8d f9 bf STA $bff9 ; (sstack + 2)
2fbd : a5 24 __ LDA SP + 1 
2fbf : 69 00 __ ADC #$00
2fc1 : 8d fa bf STA $bffa ; (sstack + 3)
2fc4 : 4c 7b 22 JMP $227b ; (sformat.s1000 + 0)
--------------------------------------------------------------------
2fc7 : __ __ __ BYT 76 64 63 20 4d 45 4d 4f 52 59 20 44 45 54 45 43 : vdc MEMORY DETEC
2fd7 : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 2c 20 45 58 54 45 : TED: %U kb, EXTE
2fe7 : __ __ __ BYT 4e 44 45 44 20 4d 45 4d 4f 52 59 20 25 53 41 42 : NDED MEMORY %SAB
2ff7 : __ __ __ BYT 4c 45 44 2e 00                                  : LED..
--------------------------------------------------------------------
2ffc : __ __ __ BYT 65 4e 00                                        : eN.
--------------------------------------------------------------------
2fff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
3000 : __ __ __ BYT 64 49 53 00                                     : dIS.
--------------------------------------------------------------------
3004 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 3a 00 : lOADING ASSETS:.
--------------------------------------------------------------------
3014 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 3a 20 6c 4f 47 4f 20 41 : - SCREEN: lOGO A
3024 : __ __ __ BYT 4e 44 20 54 45 53 54 20 53 43 52 45 45 4e 00    : ND TEST SCREEN.
--------------------------------------------------------------------
3033 : __ __ __ BYT 53 43 52 45 45 4e 32 00                         : SCREEN2.
--------------------------------------------------------------------
menu_fileerrormessage: ; menu_fileerrormessage()->void
.s1000:
303b : 38 __ __ SEC
303c : a5 23 __ LDA SP + 0 
303e : e9 08 __ SBC #$08
3040 : 85 23 __ STA SP + 0 
3042 : b0 02 __ BCS $3046 ; (menu_fileerrormessage.s0 + 0)
3044 : c6 24 __ DEC SP + 1 
.s0:
3046 : a9 f0 __ LDA #$f0
3048 : 85 17 __ STA P10 
304a : a9 08 __ LDA #$08
304c : 85 18 __ STA P11 
304e : 8d f7 bf STA $bff7 ; (sstack + 0)
3051 : a9 1e __ LDA #$1e
3053 : 8d f8 bf STA $bff8 ; (sstack + 1)
3056 : a9 06 __ LDA #$06
3058 : 8d f9 bf STA $bff9 ; (sstack + 2)
305b : ad eb 6c LDA $6ceb ; (vdc_state + 7)
305e : 85 52 __ STA T0 + 0 
3060 : a9 8d __ LDA #$8d
3062 : 8d eb 6c STA $6ceb ; (vdc_state + 7)
3065 : 20 bf 30 JSR $30bf ; (vdcwin_win_new.s1000 + 0)
3068 : a9 b2 __ LDA #$b2
306a : 85 11 __ STA P4 
306c : a9 35 __ LDA #$35
306e : 85 12 __ STA P5 
3070 : 20 6a 67 JSR $676a ; (vdc_prints_attr@proxy + 0)
3073 : a9 90 __ LDA #$90
3075 : a0 02 __ LDY #$02
3077 : 91 23 __ STA (SP + 0),y 
3079 : a9 6e __ LDA #$6e
307b : c8 __ __ INY
307c : 91 23 __ STA (SP + 0),y 
307e : a9 be __ LDA #$be
3080 : c8 __ __ INY
3081 : 91 23 __ STA (SP + 0),y 
3083 : a9 35 __ LDA #$35
3085 : c8 __ __ INY
3086 : 91 23 __ STA (SP + 0),y 
3088 : ad c4 6d LDA $6dc4 ; (krnio_pstatus + 1)
308b : c8 __ __ INY
308c : 91 23 __ STA (SP + 0),y 
308e : a9 00 __ LDA #$00
3090 : c8 __ __ INY
3091 : 91 23 __ STA (SP + 0),y 
3093 : 20 99 2f JSR $2f99 ; (sprintf.s0 + 0)
3096 : a9 0a __ LDA #$0a
3098 : 85 0f __ STA P2 
309a : a9 0b __ LDA #$0b
309c : 85 10 __ STA P3 
309e : 20 af 67 JSR $67af ; (vdc_prints_attr@proxy + 0)
30a1 : a9 0d __ LDA #$0d
30a3 : 85 10 __ STA P3 
30a5 : 20 98 67 JSR $6798 ; (vdc_prints_attr@proxy + 0)
30a8 : 20 d8 35 JSR $35d8 ; (vdcwin_getch.s0 + 0)
30ab : 20 e6 35 JSR $35e6 ; (vdcwin_win_free.s0 + 0)
30ae : a5 52 __ LDA T0 + 0 
30b0 : 8d eb 6c STA $6ceb ; (vdc_state + 7)
.s1001:
30b3 : 18 __ __ CLC
30b4 : a5 23 __ LDA SP + 0 
30b6 : 69 08 __ ADC #$08
30b8 : 85 23 __ STA SP + 0 
30ba : 90 02 __ BCC $30be ; (menu_fileerrormessage.s1001 + 11)
30bc : e6 24 __ INC SP + 1 
30be : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_new: ; vdcwin_win_new(u8,u8,u8,u8,u8)->void
.s1000:
30bf : a2 03 __ LDX #$03
30c1 : b5 53 __ LDA T8 + 0,x 
30c3 : 9d f3 bf STA $bff3,x ; (buffer + 12)
30c6 : ca __ __ DEX
30c7 : 10 f8 __ BPL $30c1 ; (vdcwin_win_new.s1000 + 2)
.s0:
30c9 : ad f8 bf LDA $bff8 ; (sstack + 1)
30cc : 85 4b __ STA T0 + 0 
30ce : 85 4c __ STA T1 + 0 
30d0 : ad f9 bf LDA $bff9 ; (sstack + 2)
30d3 : 85 43 __ STA T2 + 0 
30d5 : 85 4d __ STA T3 + 0 
30d7 : ad f7 bf LDA $bff7 ; (sstack + 0)
30da : 0a __ __ ASL
30db : aa __ __ TAX
30dc : bd 00 6e LDA $6e00,x ; (multab + 0)
30df : 18 __ __ CLC
30e0 : 65 18 __ ADC P11 ; (xpos + 0)
30e2 : 85 53 __ STA T8 + 0 
30e4 : bd 01 6e LDA $6e01,x ; (multab + 1)
30e7 : 69 00 __ ADC #$00
30e9 : 85 54 __ STA T8 + 1 
30eb : a5 17 __ LDA P10 ; (border + 0)
30ed : 0a __ __ ASL
30ee : 10 0e __ BPL $30fe ; (vdcwin_win_new.s57 + 0)
.s6:
30f0 : a5 18 __ LDA P11 ; (xpos + 0)
30f2 : f0 0a __ BEQ $30fe ; (vdcwin_win_new.s57 + 0)
.s3:
30f4 : e6 4c __ INC T1 + 0 
30f6 : a5 53 __ LDA T8 + 0 
30f8 : d0 02 __ BNE $30fc ; (vdcwin_win_new.s1013 + 0)
.s1012:
30fa : c6 54 __ DEC T8 + 1 
.s1013:
30fc : c6 53 __ DEC T8 + 0 
.s57:
30fe : a5 17 __ LDA P10 ; (border + 0)
3100 : 29 20 __ AND #$20
3102 : f0 15 __ BEQ $3119 ; (vdcwin_win_new.s59 + 0)
.s10:
3104 : 18 __ __ CLC
3105 : a5 4b __ LDA T0 + 0 
3107 : 65 18 __ ADC P11 ; (xpos + 0)
3109 : a8 __ __ TAY
310a : a9 00 __ LDA #$00
310c : 2a __ __ ROL
310d : cd e8 6c CMP $6ce8 ; (vdc_state + 4)
3110 : d0 03 __ BNE $3115 ; (vdcwin_win_new.s1009 + 0)
.s1008:
3112 : cc e7 6c CPY $6ce7 ; (vdc_state + 3)
.s1009:
3115 : b0 02 __ BCS $3119 ; (vdcwin_win_new.s59 + 0)
.s7:
3117 : e6 4c __ INC T1 + 0 
.s59:
3119 : 24 17 __ BIT P10 ; (border + 0)
311b : 10 1e __ BPL $313b ; (vdcwin_win_new.s60 + 0)
.s14:
311d : ad f7 bf LDA $bff7 ; (sstack + 0)
3120 : f0 19 __ BEQ $313b ; (vdcwin_win_new.s60 + 0)
.s11:
3122 : e6 4d __ INC T3 + 0 
3124 : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
3127 : 85 03 __ STA WORK + 0 
3129 : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
312c : 85 04 __ STA WORK + 1 
312e : 38 __ __ SEC
312f : a5 53 __ LDA T8 + 0 
3131 : e5 03 __ SBC WORK + 0 
3133 : 85 53 __ STA T8 + 0 
3135 : a5 54 __ LDA T8 + 1 
3137 : e5 04 __ SBC WORK + 1 
3139 : 85 54 __ STA T8 + 1 
.s60:
313b : a5 17 __ LDA P10 ; (border + 0)
313d : 29 10 __ AND #$10
313f : f0 16 __ BEQ $3157 ; (vdcwin_win_new.s17 + 0)
.s18:
3141 : 18 __ __ CLC
3142 : a5 43 __ LDA T2 + 0 
3144 : 6d f7 bf ADC $bff7 ; (sstack + 0)
3147 : a8 __ __ TAY
3148 : a9 00 __ LDA #$00
314a : 2a __ __ ROL
314b : cd ea 6c CMP $6cea ; (vdc_state + 6)
314e : d0 03 __ BNE $3153 ; (vdcwin_win_new.s1007 + 0)
.s1006:
3150 : cc e9 6c CPY $6ce9 ; (vdc_state + 5)
.s1007:
3153 : b0 02 __ BCS $3157 ; (vdcwin_win_new.s17 + 0)
.s15:
3155 : e6 4d __ INC T3 + 0 
.s17:
3157 : a5 43 __ LDA T2 + 0 
3159 : 85 1b __ STA ACCU + 0 ; (height + 0)
315b : a9 00 __ LDA #$00
315d : 85 1c __ STA ACCU + 1 
315f : a5 4b __ LDA T0 + 0 
3161 : 20 2c 64 JSR $642c ; (mul16by8 + 0)
3164 : a5 05 __ LDA WORK + 2 
3166 : 0a __ __ ASL
3167 : 85 4e __ STA T5 + 0 
3169 : a5 06 __ LDA WORK + 3 
316b : 2a __ __ ROL
316c : 85 4f __ STA T5 + 1 
316e : ad e2 6c LDA $6ce2 ; (winCfg + 6)
3171 : 85 50 __ STA T7 + 0 
3173 : 18 __ __ CLC
3174 : 65 4e __ ADC T5 + 0 
3176 : 85 4e __ STA T5 + 0 
3178 : ad e3 6c LDA $6ce3 ; (winCfg + 7)
317b : 85 51 __ STA T7 + 1 
317d : 65 4f __ ADC T5 + 1 
317f : 85 4f __ STA T5 + 1 
3181 : ad dd 6c LDA $6cdd ; (winCfg + 1)
3184 : 18 __ __ CLC
3185 : 6d df 6c ADC $6cdf ; (winCfg + 3)
3188 : a8 __ __ TAY
3189 : ad de 6c LDA $6cde ; (winCfg + 2)
318c : 6d e0 6c ADC $6ce0 ; (winCfg + 4)
318f : aa __ __ TAX
3190 : 98 __ __ TYA
3191 : 18 __ __ CLC
3192 : 69 fe __ ADC #$fe
3194 : a8 __ __ TAY
3195 : 8a __ __ TXA
3196 : 69 ff __ ADC #$ff
3198 : c5 4f __ CMP T5 + 1 
319a : d0 02 __ BNE $319e ; (vdcwin_win_new.s1005 + 0)
.s1004:
319c : c4 4e __ CPY T5 + 0 
.s1005:
319e : 90 59 __ BCC $31f9 ; (vdcwin_win_new.s1001 + 0)
.s21:
31a0 : ad e1 6c LDA $6ce1 ; (winCfg + 5)
31a3 : c9 03 __ CMP #$03
31a5 : f0 52 __ BEQ $31f9 ; (vdcwin_win_new.s1001 + 0)
.s25:
31a7 : a5 18 __ LDA P11 ; (xpos + 0)
31a9 : 85 0f __ STA P2 
31ab : ad f7 bf LDA $bff7 ; (sstack + 0)
31ae : 85 10 __ STA P3 
31b0 : a5 4b __ LDA T0 + 0 
31b2 : 85 11 __ STA P4 
31b4 : a5 43 __ LDA T2 + 0 
31b6 : 85 12 __ STA P5 
31b8 : ee e1 6c INC $6ce1 ; (winCfg + 5)
31bb : ae e1 6c LDX $6ce1 ; (winCfg + 5)
31be : bd 07 67 LDA $6707,x ; (__multab13L + 0)
31c1 : 85 4e __ STA T5 + 0 
31c3 : 18 __ __ CLC
31c4 : 69 c9 __ ADC #$c9
31c6 : 85 55 __ STA T10 + 0 
31c8 : 85 0d __ STA P0 
31ca : a9 6d __ LDA #$6d
31cc : 69 00 __ ADC #$00
31ce : 85 56 __ STA T10 + 1 
31d0 : 85 0e __ STA P1 
31d2 : 20 8d 32 JSR $328d ; (vdcwin_init.s0 + 0)
31d5 : a5 50 __ LDA T7 + 0 
31d7 : a6 4e __ LDX T5 + 0 
31d9 : 9d c6 6d STA $6dc6,x ; (krnio_pstatus + 3)
31dc : a5 51 __ LDA T7 + 1 
31de : 9d c7 6d STA $6dc7,x ; (krnio_pstatus + 4)
31e1 : a5 17 __ LDA P10 ; (border + 0)
31e3 : 9d c8 6d STA $6dc8,x ; (krnio_pstatus + 5)
31e6 : a5 4d __ LDA T3 + 0 
31e8 : d0 1a __ BNE $3204 ; (vdcwin_win_new.s32 + 0)
.s30:
31ea : a5 55 __ LDA T10 + 0 
31ec : 85 14 __ STA P7 
31ee : a5 56 __ LDA T10 + 1 
31f0 : 85 15 __ STA P8 
31f2 : a5 17 __ LDA P10 ; (border + 0)
31f4 : 85 16 __ STA P9 
31f6 : 20 51 33 JSR $3351 ; (vdcwin_border_clear.s0 + 0)
.s1001:
31f9 : a2 03 __ LDX #$03
31fb : bd f3 bf LDA $bff3,x ; (buffer + 12)
31fe : 95 53 __ STA T8 + 0,x 
3200 : ca __ __ DEX
3201 : 10 f8 __ BPL $31fb ; (vdcwin_win_new.s1001 + 2)
3203 : 60 __ __ RTS
.s32:
3204 : 85 4b __ STA T0 + 0 
3206 : a5 4c __ LDA T1 + 0 
3208 : 85 12 __ STA P5 
.l1010:
320a : a9 00 __ LDA #$00
320c : 85 13 __ STA P6 
320e : ad dc 6c LDA $6cdc ; (winCfg + 0)
3211 : 85 0d __ STA P0 
3213 : ad e2 6c LDA $6ce2 ; (winCfg + 6)
3216 : 85 50 __ STA T7 + 0 
3218 : 85 0e __ STA P1 
321a : ad e3 6c LDA $6ce3 ; (winCfg + 7)
321d : 85 51 __ STA T7 + 1 
321f : 85 0f __ STA P2 
3221 : ad ec 6c LDA $6cec ; (vdc_state + 8)
3224 : 18 __ __ CLC
3225 : 65 53 __ ADC T8 + 0 
3227 : 85 10 __ STA P3 
3229 : ad ed 6c LDA $6ced ; (vdc_state + 9)
322c : 65 54 __ ADC T8 + 1 
322e : 85 11 __ STA P4 
3230 : 20 a8 13 JSR $13a8 ; (bnk_cpyfromvdc.s0 + 0)
3233 : a9 00 __ LDA #$00
3235 : 85 13 __ STA P6 
3237 : 18 __ __ CLC
3238 : a5 50 __ LDA T7 + 0 
323a : 65 12 __ ADC P5 
323c : 85 50 __ STA T7 + 0 
323e : 85 0e __ STA P1 
3240 : 8d e2 6c STA $6ce2 ; (winCfg + 6)
3243 : a5 51 __ LDA T7 + 1 
3245 : 69 00 __ ADC #$00
3247 : 85 51 __ STA T7 + 1 
3249 : 85 0f __ STA P2 
324b : 8d e3 6c STA $6ce3 ; (winCfg + 7)
324e : ad ee 6c LDA $6cee ; (vdc_state + 10)
3251 : 18 __ __ CLC
3252 : 65 53 __ ADC T8 + 0 
3254 : 85 10 __ STA P3 
3256 : ad ef 6c LDA $6cef ; (vdc_state + 11)
3259 : 65 54 __ ADC T8 + 1 
325b : 85 11 __ STA P4 
325d : 20 a8 13 JSR $13a8 ; (bnk_cpyfromvdc.s0 + 0)
3260 : 18 __ __ CLC
3261 : a5 50 __ LDA T7 + 0 
3263 : 65 12 __ ADC P5 
3265 : 8d e2 6c STA $6ce2 ; (winCfg + 6)
3268 : a5 51 __ LDA T7 + 1 
326a : 69 00 __ ADC #$00
326c : 8d e3 6c STA $6ce3 ; (winCfg + 7)
326f : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
3272 : 18 __ __ CLC
3273 : 65 53 __ ADC T8 + 0 
3275 : 85 53 __ STA T8 + 0 
3277 : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
327a : 65 54 __ ADC T8 + 1 
327c : 85 54 __ STA T8 + 1 
327e : c6 4b __ DEC T0 + 0 
3280 : d0 88 __ BNE $320a ; (vdcwin_win_new.l1010 + 0)
3282 : 4c ea 31 JMP $31ea ; (vdcwin_win_new.s30 + 0)
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
3285 : a9 dc __ LDA #$dc
3287 : 85 0d __ STA P0 
3289 : a9 bf __ LDA #$bf
328b : 85 0e __ STA P1 
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
328d : a9 00 __ LDA #$00
328f : a0 04 __ LDY #$04
3291 : 91 0d __ STA (P0),y ; (win + 0)
3293 : c8 __ __ INY
3294 : 91 0d __ STA (P0),y ; (win + 0)
3296 : a5 0f __ LDA P2 ; (sx + 0)
3298 : a0 00 __ LDY #$00
329a : 91 0d __ STA (P0),y ; (win + 0)
329c : a5 10 __ LDA P3 ; (sy + 0)
329e : c8 __ __ INY
329f : 91 0d __ STA (P0),y ; (win + 0)
32a1 : a5 11 __ LDA P4 ; (wx + 0)
32a3 : c8 __ __ INY
32a4 : 91 0d __ STA (P0),y ; (win + 0)
32a6 : a5 12 __ LDA P5 ; (wy + 0)
32a8 : c8 __ __ INY
32a9 : 91 0d __ STA (P0),y ; (win + 0)
32ab : 06 10 __ ASL P3 ; (sy + 0)
32ad : a6 10 __ LDX P3 ; (sy + 0)
32af : bd 00 6e LDA $6e00,x ; (multab + 0)
32b2 : 18 __ __ CLC
32b3 : 65 0f __ ADC P2 ; (sx + 0)
32b5 : 85 1b __ STA ACCU + 0 
32b7 : bd 01 6e LDA $6e01,x ; (multab + 1)
32ba : 69 00 __ ADC #$00
32bc : a8 __ __ TAY
32bd : ad ec 6c LDA $6cec ; (vdc_state + 8)
32c0 : 18 __ __ CLC
32c1 : 65 1b __ ADC ACCU + 0 
32c3 : 85 1b __ STA ACCU + 0 
32c5 : 98 __ __ TYA
32c6 : 6d ed 6c ADC $6ced ; (vdc_state + 9)
32c9 : a0 07 __ LDY #$07
32cb : 91 0d __ STA (P0),y ; (win + 0)
32cd : a5 1b __ LDA ACCU + 0 
32cf : 88 __ __ DEY
32d0 : 91 0d __ STA (P0),y ; (win + 0)
32d2 : bd 00 6e LDA $6e00,x ; (multab + 0)
32d5 : 18 __ __ CLC
32d6 : 65 0f __ ADC P2 ; (sx + 0)
32d8 : 85 1b __ STA ACCU + 0 
32da : bd 01 6e LDA $6e01,x ; (multab + 1)
32dd : 69 00 __ ADC #$00
32df : aa __ __ TAX
32e0 : ad ee 6c LDA $6cee ; (vdc_state + 10)
32e3 : 18 __ __ CLC
32e4 : 65 1b __ ADC ACCU + 0 
32e6 : 85 1b __ STA ACCU + 0 
32e8 : 8a __ __ TXA
32e9 : 6d ef 6c ADC $6cef ; (vdc_state + 11)
32ec : a0 09 __ LDY #$09
32ee : 91 0d __ STA (P0),y ; (win + 0)
32f0 : a5 1b __ LDA ACCU + 0 
32f2 : 88 __ __ DEY
32f3 : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
32f5 : 60 __ __ RTS
--------------------------------------------------------------------
txtscr_scroller_init: ; txtscr_scroller_init(struct TXTSCRScrollText*,struct TXTSCRBigFont*,u8*,u8,u8,u8,u8)->void
.s0:
32f6 : a9 46 __ LDA #$46
32f8 : 85 11 __ STA P4 
32fa : a9 00 __ LDA #$00
32fc : a0 0e __ LDY #$0e
32fe : 91 17 __ STA (P10),y ; (settings + 0)
3300 : c8 __ __ INY
3301 : 91 17 __ STA (P10),y ; (settings + 0)
3303 : c8 __ __ INY
3304 : 91 17 __ STA (P10),y ; (settings + 0)
3306 : c8 __ __ INY
3307 : 91 17 __ STA (P10),y ; (settings + 0)
3309 : ad f9 bf LDA $bff9 ; (sstack + 2)
330c : a0 00 __ LDY #$00
330e : 91 17 __ STA (P10),y ; (settings + 0)
3310 : ad fa bf LDA $bffa ; (sstack + 3)
3313 : c8 __ __ INY
3314 : 91 17 __ STA (P10),y ; (settings + 0)
3316 : ad f8 bf LDA $bff8 ; (sstack + 1)
3319 : 85 44 __ STA T1 + 1 
331b : ad f7 bf LDA $bff7 ; (sstack + 0)
331e : 85 43 __ STA T1 + 0 
3320 : c8 __ __ INY
3321 : 91 17 __ STA (P10),y ; (settings + 0)
3323 : a5 44 __ LDA T1 + 1 
3325 : c8 __ __ INY
3326 : 91 17 __ STA (P10),y ; (settings + 0)
3328 : a0 05 __ LDY #$05
332a : 84 0f __ STY P2 
332c : b1 43 __ LDA (T1 + 0),y 
332e : 85 12 __ STA P5 
3330 : 18 __ __ CLC
3331 : a5 17 __ LDA P10 ; (settings + 0)
3333 : 69 04 __ ADC #$04
3335 : 85 0d __ STA P0 
3337 : a5 18 __ LDA P11 ; (settings + 1)
3339 : 69 00 __ ADC #$00
333b : 85 0e __ STA P1 
333d : ad fb bf LDA $bffb ; (sstack + 4)
3340 : 85 10 __ STA P3 
3342 : 20 8d 32 JSR $328d ; (vdcwin_init.s0 + 0)
3345 : a5 0d __ LDA P0 
3347 : 85 14 __ STA P7 
3349 : a5 0e __ LDA P1 
334b : 85 15 __ STA P8 
--------------------------------------------------------------------
vdcwin_border_clear@proxy: ; vdcwin_border_clear@proxy
334d : a9 f0 __ LDA #$f0
334f : 85 16 __ STA P9 
--------------------------------------------------------------------
vdcwin_border_clear: ; vdcwin_border_clear(struct VDCWin*,u8)->void
.s0:
3351 : a5 16 __ LDA P9 ; (border + 0)
3353 : 29 0f __ AND #$0f
3355 : 85 47 __ STA T2 + 0 
3357 : 49 ff __ EOR #$ff
3359 : 18 __ __ CLC
335a : 69 01 __ ADC #$01
335c : 29 09 __ AND #$09
335e : 85 48 __ STA T3 + 0 
3360 : aa __ __ TAX
3361 : bd dc 67 LDA $67dc,x ; (winStyles + 0)
3364 : 85 49 __ STA T4 + 0 
3366 : a5 16 __ LDA P9 ; (border + 0)
3368 : 0a __ __ ASL
3369 : 10 0c __ BPL $3377 ; (vdcwin_border_clear.s53 + 0)
.s4:
336b : a0 00 __ LDY #$00
336d : b1 14 __ LDA (P7),y ; (win + 0)
336f : d0 06 __ BNE $3377 ; (vdcwin_border_clear.s53 + 0)
.s1:
3371 : a5 16 __ LDA P9 ; (border + 0)
3373 : 29 bf __ AND #$bf
3375 : 85 16 __ STA P9 ; (border + 0)
.s53:
3377 : a5 16 __ LDA P9 ; (border + 0)
3379 : 29 20 __ AND #$20
337b : f0 2c __ BEQ $33a9 ; (vdcwin_border_clear.s55 + 0)
.s8:
337d : a0 00 __ LDY #$00
337f : b1 14 __ LDA (P7),y ; (win + 0)
3381 : 18 __ __ CLC
3382 : a0 02 __ LDY #$02
3384 : 71 14 __ ADC (P7),y ; (win + 0)
3386 : a8 __ __ TAY
3387 : a9 00 __ LDA #$00
3389 : 2a __ __ ROL
338a : 85 1c __ STA ACCU + 1 
338c : 98 __ __ TYA
338d : 69 01 __ ADC #$01
338f : 85 1b __ STA ACCU + 0 
3391 : 90 02 __ BCC $3395 ; (vdcwin_border_clear.s8 + 24)
3393 : e6 1c __ INC ACCU + 1 
3395 : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
3398 : c5 1c __ CMP ACCU + 1 
339a : d0 05 __ BNE $33a1 ; (vdcwin_border_clear.s1007 + 0)
.s1006:
339c : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
339f : c5 1b __ CMP ACCU + 0 
.s1007:
33a1 : b0 06 __ BCS $33a9 ; (vdcwin_border_clear.s55 + 0)
.s5:
33a3 : a5 16 __ LDA P9 ; (border + 0)
33a5 : 29 df __ AND #$df
33a7 : 85 16 __ STA P9 ; (border + 0)
.s55:
33a9 : 24 16 __ BIT P9 ; (border + 0)
33ab : 10 67 __ BPL $3414 ; (vdcwin_border_clear.s59 + 0)
.s12:
33ad : a0 01 __ LDY #$01
33af : b1 14 __ LDA (P7),y ; (win + 0)
33b1 : f0 61 __ BEQ $3414 ; (vdcwin_border_clear.s59 + 0)
.s9:
33b3 : 38 __ __ SEC
33b4 : e9 01 __ SBC #$01
33b6 : 85 4a __ STA T7 + 0 
33b8 : a5 16 __ LDA P9 ; (border + 0)
33ba : 0a __ __ ASL
33bb : 10 18 __ BPL $33d5 ; (vdcwin_border_clear.s15 + 0)
.s13:
33bd : a5 4a __ LDA T7 + 0 
33bf : 85 0e __ STA P1 
33c1 : a5 49 __ LDA T4 + 0 
33c3 : 85 10 __ STA P3 
33c5 : bd dd 67 LDA $67dd,x ; (winStyles + 1)
33c8 : 85 0f __ STA P2 
33ca : 38 __ __ SEC
33cb : 88 __ __ DEY
33cc : b1 14 __ LDA (P7),y ; (win + 0)
33ce : e9 01 __ SBC #$01
33d0 : 85 0d __ STA P0 
33d2 : 20 34 35 JSR $3534 ; (vdc_printc.s0 + 0)
.s15:
33d5 : a0 00 __ LDY #$00
33d7 : b1 14 __ LDA (P7),y ; (win + 0)
33d9 : 85 46 __ STA T0 + 0 
33db : 85 0f __ STA P2 
33dd : a5 4a __ LDA T7 + 0 
33df : 85 10 __ STA P3 
33e1 : a5 49 __ LDA T4 + 0 
33e3 : 85 12 __ STA P5 
33e5 : a6 48 __ LDX T3 + 0 
33e7 : bd e1 67 LDA $67e1,x ; (winStyles + 5)
33ea : 85 11 __ STA P4 
33ec : a0 02 __ LDY #$02
33ee : b1 14 __ LDA (P7),y ; (win + 0)
33f0 : 85 13 __ STA P6 
33f2 : 20 7f 21 JSR $217f ; (vdc_hchar.s0 + 0)
33f5 : a5 16 __ LDA P9 ; (border + 0)
33f7 : 29 20 __ AND #$20
33f9 : f0 19 __ BEQ $3414 ; (vdcwin_border_clear.s59 + 0)
.s16:
33fb : a5 10 __ LDA P3 
33fd : 85 0e __ STA P1 
33ff : a5 12 __ LDA P5 
3401 : 85 10 __ STA P3 
3403 : a6 48 __ LDX T3 + 0 
3405 : bd de 67 LDA $67de,x ; (winStyles + 2)
3408 : 85 0f __ STA P2 
340a : 18 __ __ CLC
340b : a5 13 __ LDA P6 
340d : 65 46 __ ADC T0 + 0 
340f : 85 0d __ STA P0 
3411 : 20 34 35 JSR $3534 ; (vdc_printc.s0 + 0)
.s59:
3414 : a5 16 __ LDA P9 ; (border + 0)
3416 : 29 10 __ AND #$10
3418 : f0 79 __ BEQ $3493 ; (vdcwin_border_clear.s39 + 0)
.s22:
341a : a0 01 __ LDY #$01
341c : b1 14 __ LDA (P7),y ; (win + 0)
341e : 18 __ __ CLC
341f : a0 03 __ LDY #$03
3421 : 71 14 __ ADC (P7),y ; (win + 0)
3423 : 85 4a __ STA T7 + 0 
3425 : a9 00 __ LDA #$00
3427 : 2a __ __ ROL
3428 : cd ea 6c CMP $6cea ; (vdc_state + 6)
342b : d0 05 __ BNE $3432 ; (vdcwin_border_clear.s1005 + 0)
.s1004:
342d : a5 4a __ LDA T7 + 0 
342f : cd e9 6c CMP $6ce9 ; (vdc_state + 5)
.s1005:
3432 : b0 5f __ BCS $3493 ; (vdcwin_border_clear.s39 + 0)
.s19:
3434 : a5 16 __ LDA P9 ; (border + 0)
3436 : 0a __ __ ASL
3437 : 10 1b __ BPL $3454 ; (vdcwin_border_clear.s25 + 0)
.s23:
3439 : a5 4a __ LDA T7 + 0 
343b : 85 0e __ STA P1 
343d : a5 49 __ LDA T4 + 0 
343f : 85 10 __ STA P3 
3441 : a6 48 __ LDX T3 + 0 
3443 : bd df 67 LDA $67df,x ; (winStyles + 3)
3446 : 85 0f __ STA P2 
3448 : 38 __ __ SEC
3449 : a0 00 __ LDY #$00
344b : b1 14 __ LDA (P7),y ; (win + 0)
344d : e9 01 __ SBC #$01
344f : 85 0d __ STA P0 
3451 : 20 34 35 JSR $3534 ; (vdc_printc.s0 + 0)
.s25:
3454 : a0 00 __ LDY #$00
3456 : b1 14 __ LDA (P7),y ; (win + 0)
3458 : 85 46 __ STA T0 + 0 
345a : 85 0f __ STA P2 
345c : a5 4a __ LDA T7 + 0 
345e : 85 10 __ STA P3 
3460 : a5 49 __ LDA T4 + 0 
3462 : 85 12 __ STA P5 
3464 : a6 48 __ LDX T3 + 0 
3466 : bd e2 67 LDA $67e2,x ; (winStyles + 6)
3469 : 85 11 __ STA P4 
346b : a0 02 __ LDY #$02
346d : b1 14 __ LDA (P7),y ; (win + 0)
346f : 85 13 __ STA P6 
3471 : 20 7f 21 JSR $217f ; (vdc_hchar.s0 + 0)
3474 : a5 16 __ LDA P9 ; (border + 0)
3476 : 29 20 __ AND #$20
3478 : f0 19 __ BEQ $3493 ; (vdcwin_border_clear.s39 + 0)
.s26:
347a : a5 10 __ LDA P3 
347c : 85 0e __ STA P1 
347e : a5 12 __ LDA P5 
3480 : 85 10 __ STA P3 
3482 : a6 48 __ LDX T3 + 0 
3484 : bd e0 67 LDA $67e0,x ; (winStyles + 4)
3487 : 85 0f __ STA P2 
3489 : 18 __ __ CLC
348a : a5 13 __ LDA P6 
348c : 65 46 __ ADC T0 + 0 
348e : 85 0d __ STA P0 
3490 : 20 34 35 JSR $3534 ; (vdc_printc.s0 + 0)
.s39:
3493 : a9 00 __ LDA #$00
3495 : 85 46 __ STA T0 + 0 
.l29:
3497 : a0 03 __ LDY #$03
3499 : d1 14 __ CMP (P7),y ; (win + 0)
349b : 90 01 __ BCC $349e ; (vdcwin_border_clear.s30 + 0)
.s1001:
349d : 60 __ __ RTS
.s30:
349e : a5 16 __ LDA P9 ; (border + 0)
34a0 : 0a __ __ ASL
34a1 : 10 25 __ BPL $34c8 ; (vdcwin_border_clear.s35 + 0)
.s33:
34a3 : a5 49 __ LDA T4 + 0 
34a5 : 85 10 __ STA P3 
34a7 : 38 __ __ SEC
34a8 : a0 00 __ LDY #$00
34aa : b1 14 __ LDA (P7),y ; (win + 0)
34ac : e9 01 __ SBC #$01
34ae : 85 0d __ STA P0 
34b0 : c8 __ __ INY
34b1 : b1 14 __ LDA (P7),y ; (win + 0)
34b3 : 18 __ __ CLC
34b4 : 65 46 __ ADC T0 + 0 
34b6 : 85 0e __ STA P1 
34b8 : 38 __ __ SEC
34b9 : a9 00 __ LDA #$00
34bb : e5 47 __ SBC T2 + 0 
34bd : 29 09 __ AND #$09
34bf : aa __ __ TAX
34c0 : bd e3 67 LDA $67e3,x ; (winStyles + 7)
34c3 : 85 0f __ STA P2 
34c5 : 20 34 35 JSR $3534 ; (vdc_printc.s0 + 0)
.s35:
34c8 : a9 20 __ LDA #$20
34ca : 85 11 __ STA P4 
34cc : a0 02 __ LDY #$02
34ce : b1 14 __ LDA (P7),y ; (win + 0)
34d0 : 85 13 __ STA P6 
34d2 : a0 00 __ LDY #$00
34d4 : b1 14 __ LDA (P7),y ; (win + 0)
34d6 : 85 0f __ STA P2 
34d8 : c8 __ __ INY
34d9 : b1 14 __ LDA (P7),y ; (win + 0)
34db : 18 __ __ CLC
34dc : 65 46 __ ADC T0 + 0 
34de : 85 10 __ STA P3 
34e0 : 20 7a 21 JSR $217a ; (vdc_hchar@proxy + 0)
34e3 : a5 16 __ LDA P9 ; (border + 0)
34e5 : 29 20 __ AND #$20
34e7 : f0 1f __ BEQ $3508 ; (vdcwin_border_clear.s69 + 0)
.s36:
34e9 : a5 10 __ LDA P3 
34eb : 85 0e __ STA P1 
34ed : a5 49 __ LDA T4 + 0 
34ef : 85 10 __ STA P3 
34f1 : 18 __ __ CLC
34f2 : a5 13 __ LDA P6 
34f4 : 65 0f __ ADC P2 
34f6 : 85 0d __ STA P0 
34f8 : 38 __ __ SEC
34f9 : a9 00 __ LDA #$00
34fb : e5 47 __ SBC T2 + 0 
34fd : 29 09 __ AND #$09
34ff : aa __ __ TAX
3500 : bd e4 67 LDA $67e4,x ; (winStyles + 8)
3503 : 85 0f __ STA P2 
3505 : 20 34 35 JSR $3534 ; (vdc_printc.s0 + 0)
.s69:
3508 : e6 46 __ INC T0 + 0 
350a : a5 46 __ LDA T0 + 0 
350c : 4c 97 34 JMP $3497 ; (vdcwin_border_clear.l29 + 0)
--------------------------------------------------------------------
vdcwin_putat_char: ; vdcwin_putat_char(struct VDCWin*,u8,u8,u8)->void
.s0:
350f : a5 15 __ LDA P8 ; (ch + 0)
3511 : 4a __ __ LSR
3512 : 4a __ __ LSR
3513 : 4a __ __ LSR
3514 : 4a __ __ LSR
3515 : 4a __ __ LSR
3516 : aa __ __ TAX
3517 : bd f6 67 LDA $67f6,x ; (p2smap + 0)
351a : 45 15 __ EOR P8 ; (ch + 0)
351c : 85 0f __ STA P2 
351e : a5 13 __ LDA P6 ; (x + 0)
3520 : 18 __ __ CLC
3521 : a0 00 __ LDY #$00
3523 : 71 11 __ ADC (P4),y ; (win + 0)
3525 : 85 0d __ STA P0 
3527 : a5 14 __ LDA P7 ; (y + 0)
3529 : 18 __ __ CLC
352a : c8 __ __ INY
352b : 71 11 __ ADC (P4),y ; (win + 0)
352d : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
352f : ad eb 6c LDA $6ceb ; (vdc_state + 7)
3532 : 85 10 __ STA P3 
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
3534 : a5 0e __ LDA P1 ; (y + 0)
3536 : 0a __ __ ASL
3537 : a2 12 __ LDX #$12
3539 : 8e 00 d6 STX $d600 
353c : aa __ __ TAX
353d : 18 __ __ CLC
353e : a5 0d __ LDA P0 ; (x + 0)
3540 : 7d 00 6e ADC $6e00,x ; (multab + 0)
3543 : 85 1b __ STA ACCU + 0 
3545 : a9 00 __ LDA #$00
3547 : 7d 01 6e ADC $6e01,x ; (multab + 1)
354a : 85 1c __ STA ACCU + 1 
354c : 18 __ __ CLC
354d : a5 1b __ LDA ACCU + 0 
354f : 6d ec 6c ADC $6cec ; (vdc_state + 8)
3552 : aa __ __ TAX
3553 : a5 1c __ LDA ACCU + 1 
3555 : 6d ed 6c ADC $6ced ; (vdc_state + 9)
.l167:
3558 : 2c 00 d6 BIT $d600 
355b : 10 fb __ BPL $3558 ; (vdc_printc.l167 + 0)
.s9:
355d : 8d 01 d6 STA $d601 
3560 : a9 13 __ LDA #$13
3562 : 8d 00 d6 STA $d600 
.l169:
3565 : 2c 00 d6 BIT $d600 
3568 : 10 fb __ BPL $3565 ; (vdc_printc.l169 + 0)
.s14:
356a : 8e 01 d6 STX $d601 
356d : a9 1f __ LDA #$1f
356f : 8d 00 d6 STA $d600 
.l171:
3572 : 2c 00 d6 BIT $d600 
3575 : 10 fb __ BPL $3572 ; (vdc_printc.l171 + 0)
.s18:
3577 : a5 0f __ LDA P2 ; (val + 0)
3579 : 8d 01 d6 STA $d601 
357c : ad ee 6c LDA $6cee ; (vdc_state + 10)
357f : 18 __ __ CLC
3580 : 65 1b __ ADC ACCU + 0 
3582 : a8 __ __ TAY
3583 : a9 12 __ LDA #$12
3585 : 8d 00 d6 STA $d600 
3588 : ad ef 6c LDA $6cef ; (vdc_state + 11)
358b : 65 1c __ ADC ACCU + 1 
.l173:
358d : 2c 00 d6 BIT $d600 
3590 : 10 fb __ BPL $358d ; (vdc_printc.l173 + 0)
.s25:
3592 : 8d 01 d6 STA $d601 
3595 : a9 13 __ LDA #$13
3597 : 8d 00 d6 STA $d600 
.l175:
359a : 2c 00 d6 BIT $d600 
359d : 10 fb __ BPL $359a ; (vdc_printc.l175 + 0)
.s30:
359f : 8c 01 d6 STY $d601 
35a2 : a9 1f __ LDA #$1f
35a4 : 8d 00 d6 STA $d600 
.l177:
35a7 : 2c 00 d6 BIT $d600 
35aa : 10 fb __ BPL $35a7 ; (vdc_printc.l177 + 0)
.s34:
35ac : a5 10 __ LDA P3 ; (attr + 0)
35ae : 8d 01 d6 STA $d601 
.s1001:
35b1 : 60 __ __ RTS
--------------------------------------------------------------------
35b2 : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 00             : fILE ERROR!.
--------------------------------------------------------------------
35be : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 00    : eRROR NR.: %2x.
--------------------------------------------------------------------
35cd : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 2e 00                : pRESS KEY..
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
35d8 : 20 e4 ff JSR $ffe4 
35db : c9 00 __ CMP #$00
35dd : f0 f9 __ BEQ $35d8 ; (vdcwin_getch.s0 + 0)
35df : 85 1b __ STA ACCU + 0 
35e1 : a9 00 __ LDA #$00
35e3 : 85 1c __ STA ACCU + 1 
.s1001:
35e5 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_free: ; vdcwin_win_free()->void
.s0:
35e6 : ad e1 6c LDA $6ce1 ; (winCfg + 5)
35e9 : d0 01 __ BNE $35ec ; (vdcwin_win_free.s3 + 0)
35eb : 60 __ __ RTS
.s3:
35ec : 85 44 __ STA T0 + 0 
35ee : a8 __ __ TAY
35ef : be 07 67 LDX $6707,y ; (__multab13L + 0)
35f2 : 86 1b __ STX ACCU + 0 
35f4 : bc cb 6d LDY $6dcb,x ; (krnio_pstatus + 8)
35f7 : 84 1c __ STY ACCU + 1 
35f9 : bd cc 6d LDA $6dcc,x ; (krnio_pstatus + 9)
35fc : 85 43 __ STA T5 + 0 
35fe : 85 1d __ STA ACCU + 2 
3600 : bd c6 6d LDA $6dc6,x ; (krnio_pstatus + 3)
3603 : 85 45 __ STA T2 + 0 
3605 : 8d e2 6c STA $6ce2 ; (winCfg + 6)
3608 : bd c7 6d LDA $6dc7,x ; (krnio_pstatus + 4)
360b : 85 46 __ STA T2 + 1 
360d : 8d e3 6c STA $6ce3 ; (winCfg + 7)
3610 : bd c9 6d LDA $6dc9,x ; (krnio_pstatus + 6)
3613 : 85 1e __ STA ACCU + 3 
3615 : bd ca 6d LDA $6dca,x ; (krnio_pstatus + 7)
3618 : 85 4a __ STA T10 + 0 
361a : 0a __ __ ASL
361b : aa __ __ TAX
361c : bd 00 6e LDA $6e00,x ; (multab + 0)
361f : 18 __ __ CLC
3620 : 65 1e __ ADC ACCU + 3 
3622 : 85 4b __ STA T11 + 0 
3624 : bd 01 6e LDA $6e01,x ; (multab + 1)
3627 : 69 00 __ ADC #$00
3629 : 85 4c __ STA T11 + 1 
362b : a6 1b __ LDX ACCU + 0 
362d : bd c8 6d LDA $6dc8,x ; (krnio_pstatus + 5)
3630 : 85 1b __ STA ACCU + 0 
3632 : 0a __ __ ASL
3633 : 10 0e __ BPL $3643 ; (vdcwin_win_free.s53 + 0)
.s10:
3635 : a5 1e __ LDA ACCU + 3 
3637 : f0 0a __ BEQ $3643 ; (vdcwin_win_free.s53 + 0)
.s7:
3639 : e6 1c __ INC ACCU + 1 
363b : a5 4b __ LDA T11 + 0 
363d : d0 02 __ BNE $3641 ; (vdcwin_win_free.s1009 + 0)
.s1008:
363f : c6 4c __ DEC T11 + 1 
.s1009:
3641 : c6 4b __ DEC T11 + 0 
.s53:
3643 : a5 1b __ LDA ACCU + 0 
3645 : 29 20 __ AND #$20
3647 : f0 14 __ BEQ $365d ; (vdcwin_win_free.s55 + 0)
.s14:
3649 : 98 __ __ TYA
364a : 18 __ __ CLC
364b : 65 1e __ ADC ACCU + 3 
364d : a8 __ __ TAY
364e : a9 00 __ LDA #$00
3650 : 2a __ __ ROL
3651 : cd e8 6c CMP $6ce8 ; (vdc_state + 4)
3654 : d0 03 __ BNE $3659 ; (vdcwin_win_free.s1005 + 0)
.s1004:
3656 : cc e7 6c CPY $6ce7 ; (vdc_state + 3)
.s1005:
3659 : b0 02 __ BCS $365d ; (vdcwin_win_free.s55 + 0)
.s11:
365b : e6 1c __ INC ACCU + 1 
.s55:
365d : 24 1b __ BIT ACCU + 0 
365f : 10 15 __ BPL $3676 ; (vdcwin_win_free.s56 + 0)
.s18:
3661 : a5 4a __ LDA T10 + 0 
3663 : f0 11 __ BEQ $3676 ; (vdcwin_win_free.s56 + 0)
.s15:
3665 : e6 1d __ INC ACCU + 2 
3667 : 38 __ __ SEC
3668 : a5 4b __ LDA T11 + 0 
366a : ed e7 6c SBC $6ce7 ; (vdc_state + 3)
366d : 85 4b __ STA T11 + 0 
366f : a5 4c __ LDA T11 + 1 
3671 : ed e8 6c SBC $6ce8 ; (vdc_state + 4)
3674 : 85 4c __ STA T11 + 1 
.s56:
3676 : a5 1b __ LDA ACCU + 0 
3678 : 29 10 __ AND #$10
367a : f0 15 __ BEQ $3691 ; (vdcwin_win_free.s21 + 0)
.s22:
367c : 18 __ __ CLC
367d : a5 43 __ LDA T5 + 0 
367f : 65 4a __ ADC T10 + 0 
3681 : a8 __ __ TAY
3682 : a9 00 __ LDA #$00
3684 : 2a __ __ ROL
3685 : cd ea 6c CMP $6cea ; (vdc_state + 6)
3688 : d0 03 __ BNE $368d ; (vdcwin_win_free.s1003 + 0)
.s1002:
368a : cc e9 6c CPY $6ce9 ; (vdc_state + 5)
.s1003:
368d : b0 02 __ BCS $3691 ; (vdcwin_win_free.s21 + 0)
.s19:
368f : e6 1d __ INC ACCU + 2 
.s21:
3691 : a5 1d __ LDA ACCU + 2 
3693 : d0 11 __ BNE $36a6 ; (vdcwin_win_free.s27 + 0)
.s26:
3695 : a5 45 __ LDA T2 + 0 
3697 : 8d e2 6c STA $6ce2 ; (winCfg + 6)
369a : a5 46 __ LDA T2 + 1 
369c : 8d e3 6c STA $6ce3 ; (winCfg + 7)
369f : a6 44 __ LDX T0 + 0 
36a1 : ca __ __ DEX
36a2 : 8e e1 6c STX $6ce1 ; (winCfg + 5)
.s1001:
36a5 : 60 __ __ RTS
.s27:
36a6 : 85 47 __ STA T3 + 0 
36a8 : a5 1c __ LDA ACCU + 1 
36aa : 85 14 __ STA P7 
.l1006:
36ac : a9 00 __ LDA #$00
36ae : 85 15 __ STA P8 
36b0 : ad ec 6c LDA $6cec ; (vdc_state + 8)
36b3 : 18 __ __ CLC
36b4 : 65 4b __ ADC T11 + 0 
36b6 : 85 0f __ STA P2 
36b8 : ad ed 6c LDA $6ced ; (vdc_state + 9)
36bb : 65 4c __ ADC T11 + 1 
36bd : 85 10 __ STA P3 
36bf : ad dc 6c LDA $6cdc ; (winCfg + 0)
36c2 : 85 11 __ STA P4 
36c4 : ad e2 6c LDA $6ce2 ; (winCfg + 6)
36c7 : 85 48 __ STA T7 + 0 
36c9 : 85 12 __ STA P5 
36cb : ad e3 6c LDA $6ce3 ; (winCfg + 7)
36ce : 85 49 __ STA T7 + 1 
36d0 : 85 13 __ STA P6 
36d2 : 20 36 14 JSR $1436 ; (bnk_cpytovdc.s0 + 0)
36d5 : a9 00 __ LDA #$00
36d7 : 85 15 __ STA P8 
36d9 : 18 __ __ CLC
36da : a5 48 __ LDA T7 + 0 
36dc : 65 14 __ ADC P7 
36de : 85 48 __ STA T7 + 0 
36e0 : 85 12 __ STA P5 
36e2 : 8d e2 6c STA $6ce2 ; (winCfg + 6)
36e5 : a5 49 __ LDA T7 + 1 
36e7 : 69 00 __ ADC #$00
36e9 : 85 49 __ STA T7 + 1 
36eb : 85 13 __ STA P6 
36ed : 8d e3 6c STA $6ce3 ; (winCfg + 7)
36f0 : ad ee 6c LDA $6cee ; (vdc_state + 10)
36f3 : 18 __ __ CLC
36f4 : 65 4b __ ADC T11 + 0 
36f6 : 85 0f __ STA P2 
36f8 : ad ef 6c LDA $6cef ; (vdc_state + 11)
36fb : 65 4c __ ADC T11 + 1 
36fd : 85 10 __ STA P3 
36ff : 20 36 14 JSR $1436 ; (bnk_cpytovdc.s0 + 0)
3702 : 18 __ __ CLC
3703 : a5 48 __ LDA T7 + 0 
3705 : 65 14 __ ADC P7 
3707 : 8d e2 6c STA $6ce2 ; (winCfg + 6)
370a : a5 49 __ LDA T7 + 1 
370c : 69 00 __ ADC #$00
370e : 8d e3 6c STA $6ce3 ; (winCfg + 7)
3711 : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
3714 : 18 __ __ CLC
3715 : 65 4b __ ADC T11 + 0 
3717 : 85 4b __ STA T11 + 0 
3719 : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
371c : 65 4c __ ADC T11 + 1 
371e : 85 4c __ STA T11 + 1 
3720 : c6 47 __ DEC T3 + 0 
3722 : d0 88 __ BNE $36ac ; (vdcwin_win_free.l1006 + 0)
3724 : 4c 95 36 JMP $3695 ; (vdcwin_win_free.s26 + 0)
--------------------------------------------------------------------
3727 : __ __ __ BYT 2d 20 4d 55 53 49 43 3a 20 75 4c 54 49 4d 41 54 : - MUSIC: uLTIMAT
3737 : __ __ __ BYT 45 20 61 58 45 4c 20 66 20 46 52 4f 4d 20 6e 4f : E aXEL f FROM nO
3747 : __ __ __ BYT 52 44 49 53 43 48 53 4f 55 4e 44 00             : RDISCHSOUND.
--------------------------------------------------------------------
3753 : __ __ __ BYT 4d 55 53 49 43 31 00                            : MUSIC1.
--------------------------------------------------------------------
375a : __ __ __ BYT 20 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d :  oSCAR64 vdc dEM
376a : __ __ __ BYT 4f 00                                           : O.
--------------------------------------------------------------------
menu_placebar: ; menu_placebar(u8)->void
.s0:
376c : a9 00 __ LDA #$00
376e : 85 0f __ STA P2 
3770 : a9 20 __ LDA #$20
3772 : 85 11 __ STA P4 
3774 : a9 c4 __ LDA #$c4
3776 : 85 12 __ STA P5 
3778 : a9 50 __ LDA #$50
377a : 85 13 __ STA P6 
377c : a5 14 __ LDA P7 ; (y + 0)
377e : 8d 3c 69 STA $693c ; (menubar + 60)
3781 : 85 10 __ STA P3 
3783 : 20 7f 21 JSR $217f ; (vdc_hchar.s0 + 0)
3786 : a9 01 __ LDA #$01
3788 : 85 49 __ STA T1 + 0 
378a : a0 00 __ LDY #$00
378c : 84 4a __ STY T2 + 0 
.l2:
378e : b9 0b 67 LDA $670b,y ; (__multab9L + 0)
3791 : 18 __ __ CLC
3792 : 69 00 __ ADC #$00
3794 : 85 0d __ STA P0 
3796 : a9 69 __ LDA #$69
3798 : 69 00 __ ADC #$00
379a : 85 0e __ STA P1 
379c : 20 3c 2f JSR $2f3c ; (strlen.s0 + 0)
379f : a5 0d __ LDA P0 
37a1 : 85 11 __ STA P4 
37a3 : a5 0e __ LDA P1 
37a5 : 85 12 __ STA P5 
37a7 : a9 c4 __ LDA #$c4
37a9 : 85 13 __ STA P6 
37ab : a5 1b __ LDA ACCU + 0 
37ad : 85 4b __ STA T4 + 0 
37af : 18 __ __ CLC
37b0 : 65 49 __ ADC T1 + 0 
37b2 : 85 43 __ STA T5 + 0 
37b4 : a9 00 __ LDA #$00
37b6 : 2a __ __ ROL
37b7 : 85 44 __ STA T5 + 1 
37b9 : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
37bc : 38 __ __ SEC
37bd : e9 01 __ SBC #$01
37bf : a8 __ __ TAY
37c0 : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
37c3 : e9 00 __ SBC #$00
37c5 : c5 44 __ CMP T5 + 1 
37c7 : d0 02 __ BNE $37cb ; (menu_placebar.s1005 + 0)
.s1004:
37c9 : c4 43 __ CPY T5 + 0 
.s1005:
37cb : 90 04 __ BCC $37d1 ; (menu_placebar.s5 + 0)
.s7:
37cd : a5 49 __ LDA T1 + 0 
37cf : b0 04 __ BCS $37d5 ; (menu_placebar.s1006 + 0)
.s5:
37d1 : 98 __ __ TYA
37d2 : 38 __ __ SEC
37d3 : e5 1b __ SBC ACCU + 0 
.s1006:
37d5 : 85 0f __ STA P2 
37d7 : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
37da : a5 0f __ LDA P2 
37dc : a4 4a __ LDY T2 + 0 
37de : c8 __ __ INY
37df : 84 4a __ STY T2 + 0 
37e1 : 99 35 69 STA $6935,y ; (menubar + 53)
37e4 : a5 4b __ LDA T4 + 0 
37e6 : 38 __ __ SEC
37e7 : 65 0f __ ADC P2 
37e9 : 85 49 __ STA T1 + 0 
37eb : c0 06 __ CPY #$06
37ed : 90 9f __ BCC $378e ; (menu_placebar.l2 + 0)
.s1001:
37ef : 60 __ __ RTS
--------------------------------------------------------------------
37f0 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 3a 20 25 53 00    : sCREENMODE: %S.
--------------------------------------------------------------------
spentry:
37ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
3800 : __ __ __ BYT 73 45 4c 45 43 54 20 44 45 53 49 52 45 44 20 44 : sELECT DESIRED D
3810 : __ __ __ BYT 45 4d 4f 20 55 53 49 4e 47 20 43 55 52 53 4f 52 : EMO USING CURSOR
3820 : __ __ __ BYT 20 4b 45 59 53 20 41 4e 44 20 72 65 74 75 72 6e :  KEYS AND return
3830 : __ __ __ BYT 20 49 4e 20 4d 45 4e 55 2e 00                   :  IN MENU..
--------------------------------------------------------------------
383a : __ __ __ BYT 69 4e 20 53 43 52 4f 4c 4c 49 4e 47 20 44 45 4d : iN SCROLLING DEM
384a : __ __ __ BYT 4f 53 2c 20 50 52 45 53 53 20 77 61 73 64 20 4f : OS, PRESS wasd O
385a : __ __ __ BYT 52 20 43 55 52 53 4f 52 20 4b 45 59 53 20 54 4f : R CURSOR KEYS TO
386a : __ __ __ BYT 20 4d 4f 56 45 2c 20 65 73 63 20 54 4f 20 45 58 :  MOVE, esc TO EX
387a : __ __ __ BYT 49 54 2e 00                                     : IT..
--------------------------------------------------------------------
387e : __ __ __ BYT 69 4e 20 4f 54 48 45 52 20 44 45 4d 4f 53 2c 20 : iN OTHER DEMOS, 
388e : __ __ __ BYT 50 52 45 53 53 20 41 20 4b 45 54 59 20 54 4f 20 : PRESS A KETY TO 
389e : __ __ __ BYT 43 4f 4e 54 49 4e 55 45 20 54 4f 20 4e 45 58 54 : CONTINUE TO NEXT
38ae : __ __ __ BYT 20 53 54 45 50 2e 00                            :  STEP..
--------------------------------------------------------------------
vdcwin_cpy_viewport: ; vdcwin_cpy_viewport(struct VDCViewport*)->void
.s0:
38b5 : a5 16 __ LDA P9 ; (viewport + 0)
38b7 : 85 44 __ STA T0 + 0 
38b9 : a5 17 __ LDA P10 ; (viewport + 1)
38bb : 85 45 __ STA T0 + 1 
38bd : a0 09 __ LDY #$09
38bf : b1 16 __ LDA (P9),y ; (viewport + 0)
38c1 : 85 1b __ STA ACCU + 0 
38c3 : c8 __ __ INY
38c4 : b1 16 __ LDA (P9),y ; (viewport + 0)
38c6 : 85 1c __ STA ACCU + 1 
38c8 : a0 03 __ LDY #$03
38ca : b1 16 __ LDA (P9),y ; (viewport + 0)
38cc : 85 03 __ STA WORK + 0 
38ce : c8 __ __ INY
38cf : b1 16 __ LDA (P9),y ; (viewport + 0)
38d1 : 85 04 __ STA WORK + 1 
38d3 : 20 4c 64 JSR $644c ; (mul16 + 0)
38d6 : a0 01 __ LDY #$01
38d8 : b1 16 __ LDA (P9),y ; (viewport + 0)
38da : 18 __ __ CLC
38db : 65 05 __ ADC WORK + 2 
38dd : aa __ __ TAX
38de : c8 __ __ INY
38df : b1 16 __ LDA (P9),y ; (viewport + 0)
38e1 : 65 06 __ ADC WORK + 3 
38e3 : 85 47 __ STA T1 + 1 
38e5 : 8a __ __ TXA
38e6 : 18 __ __ CLC
38e7 : a0 07 __ LDY #$07
38e9 : 71 16 __ ADC (P9),y ; (viewport + 0)
38eb : 85 46 __ STA T1 + 0 
38ed : a5 47 __ LDA T1 + 1 
38ef : c8 __ __ INY
38f0 : 71 16 __ ADC (P9),y ; (viewport + 0)
38f2 : 85 47 __ STA T1 + 1 
38f4 : a9 00 __ LDA #$00
38f6 : 85 4a __ STA T3 + 0 
38f8 : a0 11 __ LDY #$11
38fa : b1 16 __ LDA (P9),y ; (viewport + 0)
38fc : aa __ __ TAX
38fd : c8 __ __ INY
38fe : b1 16 __ LDA (P9),y ; (viewport + 0)
3900 : 4c 3c 39 JMP $393c ; (vdcwin_cpy_viewport.l1 + 0)
.s2:
3903 : 86 0f __ STX P2 
3905 : a5 46 __ LDA T1 + 0 
3907 : 85 12 __ STA P5 
3909 : a5 47 __ LDA T1 + 1 
390b : 85 13 __ STA P6 
390d : a0 00 __ LDY #$00
390f : 84 15 __ STY P8 
3911 : b1 44 __ LDA (T0 + 0),y 
3913 : 85 11 __ STA P4 
3915 : a0 0d __ LDY #$0d
3917 : b1 44 __ LDA (T0 + 0),y 
3919 : 85 14 __ STA P7 
391b : 20 36 14 JSR $1436 ; (bnk_cpytovdc.s0 + 0)
391e : a5 46 __ LDA T1 + 0 
3920 : 18 __ __ CLC
3921 : a0 03 __ LDY #$03
3923 : 71 44 __ ADC (T0 + 0),y 
3925 : 85 46 __ STA T1 + 0 
3927 : a5 47 __ LDA T1 + 1 
3929 : c8 __ __ INY
392a : 71 44 __ ADC (T0 + 0),y 
392c : 85 47 __ STA T1 + 1 
392e : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
3931 : 18 __ __ CLC
3932 : 65 0f __ ADC P2 
3934 : aa __ __ TAX
3935 : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
3938 : 65 10 __ ADC P3 
393a : e6 4a __ INC T3 + 0 
.l1:
393c : 85 10 __ STA P3 
393e : a5 4a __ LDA T3 + 0 
3940 : a0 0e __ LDY #$0e
3942 : d1 44 __ CMP (T0 + 0),y 
3944 : 90 bd __ BCC $3903 ; (vdcwin_cpy_viewport.s2 + 0)
.s4:
3946 : a0 03 __ LDY #$03
3948 : b1 44 __ LDA (T0 + 0),y 
394a : 85 46 __ STA T1 + 0 
394c : 85 03 __ STA WORK + 0 
394e : c8 __ __ INY
394f : b1 44 __ LDA (T0 + 0),y 
3951 : 85 47 __ STA T1 + 1 
3953 : 85 04 __ STA WORK + 1 
3955 : a0 09 __ LDY #$09
3957 : b1 44 __ LDA (T0 + 0),y 
3959 : 85 1b __ STA ACCU + 0 
395b : c8 __ __ INY
395c : b1 44 __ LDA (T0 + 0),y 
395e : 85 1c __ STA ACCU + 1 
3960 : 20 4c 64 JSR $644c ; (mul16 + 0)
3963 : a0 01 __ LDY #$01
3965 : b1 44 __ LDA (T0 + 0),y 
3967 : 18 __ __ CLC
3968 : 65 05 __ ADC WORK + 2 
396a : aa __ __ TAX
396b : c8 __ __ INY
396c : b1 44 __ LDA (T0 + 0),y 
396e : 65 06 __ ADC WORK + 3 
3970 : 85 49 __ STA T2 + 1 
3972 : 8a __ __ TXA
3973 : 18 __ __ CLC
3974 : a0 07 __ LDY #$07
3976 : 71 44 __ ADC (T0 + 0),y 
3978 : 85 48 __ STA T2 + 0 
397a : a5 49 __ LDA T2 + 1 
397c : c8 __ __ INY
397d : 71 44 __ ADC (T0 + 0),y 
397f : 85 49 __ STA T2 + 1 
3981 : a0 05 __ LDY #$05
3983 : b1 44 __ LDA (T0 + 0),y 
3985 : 85 1b __ STA ACCU + 0 
3987 : c8 __ __ INY
3988 : b1 44 __ LDA (T0 + 0),y 
398a : 85 1c __ STA ACCU + 1 
398c : a5 46 __ LDA T1 + 0 
398e : 85 03 __ STA WORK + 0 
3990 : a5 47 __ LDA T1 + 1 
3992 : 85 04 __ STA WORK + 1 
3994 : 20 4c 64 JSR $644c ; (mul16 + 0)
3997 : 18 __ __ CLC
3998 : a5 48 __ LDA T2 + 0 
399a : 65 05 __ ADC WORK + 2 
399c : aa __ __ TAX
399d : a5 49 __ LDA T2 + 1 
399f : 65 06 __ ADC WORK + 3 
39a1 : a8 __ __ TAY
39a2 : 8a __ __ TXA
39a3 : 18 __ __ CLC
39a4 : 69 30 __ ADC #$30
39a6 : 85 46 __ STA T1 + 0 
39a8 : 90 01 __ BCC $39ab ; (vdcwin_cpy_viewport.s1007 + 0)
.s1006:
39aa : c8 __ __ INY
.s1007:
39ab : 84 47 __ STY T1 + 1 
39ad : a9 00 __ LDA #$00
39af : 85 4a __ STA T3 + 0 
39b1 : a0 13 __ LDY #$13
39b3 : b1 44 __ LDA (T0 + 0),y 
39b5 : aa __ __ TAX
39b6 : c8 __ __ INY
39b7 : b1 44 __ LDA (T0 + 0),y 
39b9 : 4c f5 39 JMP $39f5 ; (vdcwin_cpy_viewport.l5 + 0)
.s6:
39bc : 86 0f __ STX P2 
39be : a5 46 __ LDA T1 + 0 
39c0 : 85 12 __ STA P5 
39c2 : a5 47 __ LDA T1 + 1 
39c4 : 85 13 __ STA P6 
39c6 : a0 00 __ LDY #$00
39c8 : 84 15 __ STY P8 
39ca : b1 16 __ LDA (P9),y ; (viewport + 0)
39cc : 85 11 __ STA P4 
39ce : a0 0d __ LDY #$0d
39d0 : b1 16 __ LDA (P9),y ; (viewport + 0)
39d2 : 85 14 __ STA P7 
39d4 : 20 36 14 JSR $1436 ; (bnk_cpytovdc.s0 + 0)
39d7 : a5 46 __ LDA T1 + 0 
39d9 : 18 __ __ CLC
39da : a0 03 __ LDY #$03
39dc : 71 16 __ ADC (P9),y ; (viewport + 0)
39de : 85 46 __ STA T1 + 0 
39e0 : a5 47 __ LDA T1 + 1 
39e2 : c8 __ __ INY
39e3 : 71 16 __ ADC (P9),y ; (viewport + 0)
39e5 : 85 47 __ STA T1 + 1 
39e7 : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
39ea : 18 __ __ CLC
39eb : 65 0f __ ADC P2 
39ed : aa __ __ TAX
39ee : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
39f1 : 65 10 __ ADC P3 
39f3 : e6 4a __ INC T3 + 0 
.l5:
39f5 : 85 10 __ STA P3 
39f7 : a5 4a __ LDA T3 + 0 
39f9 : a0 0e __ LDY #$0e
39fb : d1 16 __ CMP (P9),y ; (viewport + 0)
39fd : 90 bd __ BCC $39bc ; (vdcwin_cpy_viewport.s6 + 0)
.s1001:
39ff : 60 __ __ RTS
--------------------------------------------------------------------
menu_main: ; menu_main()->u8
.s1000:
3a00 : a2 03 __ LDX #$03
3a02 : b5 53 __ LDA T0 + 0,x 
3a04 : 9d c7 bf STA $bfc7,x ; (bigfont + 176)
3a07 : ca __ __ DEX
3a08 : 10 f8 __ BPL $3a02 ; (menu_main.s1000 + 2)
.s0:
3a0a : ad 3c 69 LDA $693c ; (menubar + 60)
3a0d : 85 14 __ STA P7 
3a0f : 20 6c 37 JSR $376c ; (menu_placebar.s0 + 0)
.l84:
3a12 : a9 01 __ LDA #$01
3a14 : 85 53 __ STA T0 + 0 
.l3:
3a16 : a9 cf __ LDA #$cf
3a18 : 85 13 __ STA P6 
3a1a : a6 53 __ LDX T0 + 0 
3a1c : bd 35 69 LDA $6935,x ; (menubar + 53)
3a1f : 85 0f __ STA P2 
3a21 : ad 3c 69 LDA $693c ; (menubar + 60)
3a24 : 85 10 __ STA P3 
3a26 : bd 0b 67 LDA $670b,x ; (__multab9L + 0)
3a29 : 18 __ __ CLC
3a2a : 69 f7 __ ADC #$f7
3a2c : 85 11 __ STA P4 
3a2e : a9 68 __ LDA #$68
3a30 : 69 00 __ ADC #$00
3a32 : 85 12 __ STA P5 
3a34 : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
.l5:
3a37 : 20 d8 35 JSR $35d8 ; (vdcwin_getch.s0 + 0)
3a3a : a5 1b __ LDA ACCU + 0 
3a3c : 85 54 __ STA T1 + 0 
3a3e : c9 0d __ CMP #$0d
3a40 : d0 06 __ BNE $3a48 ; (menu_main.s1002 + 0)
.s1003:
3a42 : a9 00 __ LDA #$00
3a44 : 85 55 __ STA T3 + 0 
3a46 : f0 16 __ BEQ $3a5e ; (menu_main.s6 + 0)
.s1002:
3a48 : a9 01 __ LDA #$01
3a4a : 85 55 __ STA T3 + 0 
3a4c : a5 1b __ LDA ACCU + 0 
3a4e : c9 9d __ CMP #$9d
3a50 : f0 0c __ BEQ $3a5e ; (menu_main.s6 + 0)
.s9:
3a52 : c9 1d __ CMP #$1d
3a54 : f0 08 __ BEQ $3a5e ; (menu_main.s6 + 0)
.s8:
3a56 : c9 1b __ CMP #$1b
3a58 : f0 04 __ BEQ $3a5e ; (menu_main.s6 + 0)
.s7:
3a5a : c9 03 __ CMP #$03
3a5c : d0 d9 __ BNE $3a37 ; (menu_main.l5 + 0)
.s6:
3a5e : a9 c4 __ LDA #$c4
3a60 : 85 13 __ STA P6 
3a62 : a6 53 __ LDX T0 + 0 
3a64 : bd 35 69 LDA $6935,x ; (menubar + 53)
3a67 : 85 0f __ STA P2 
3a69 : ad 3c 69 LDA $693c ; (menubar + 60)
3a6c : 85 56 __ STA T4 + 0 
3a6e : 85 10 __ STA P3 
3a70 : bd 0b 67 LDA $670b,x ; (__multab9L + 0)
3a73 : 18 __ __ CLC
3a74 : 69 f7 __ ADC #$f7
3a76 : 85 11 __ STA P4 
3a78 : a9 68 __ LDA #$68
3a7a : 69 00 __ ADC #$00
3a7c : 85 12 __ STA P5 
3a7e : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
3a81 : a5 54 __ LDA T1 + 0 
3a83 : c9 9d __ CMP #$9d
3a85 : d0 03 __ BNE $3a8a ; (menu_main.s12 + 0)
3a87 : 4c 18 3b JMP $3b18 ; (menu_main.s11 + 0)
.s12:
3a8a : c9 1d __ CMP #$1d
3a8c : d0 0c __ BNE $3a9a ; (menu_main.s13 + 0)
.s17:
3a8e : e6 53 __ INC T0 + 0 
3a90 : a5 53 __ LDA T0 + 0 
3a92 : c9 07 __ CMP #$07
3a94 : 90 04 __ BCC $3a9a ; (menu_main.s13 + 0)
.s20:
3a96 : a9 01 __ LDA #$01
.s1039:
3a98 : 85 53 __ STA T0 + 0 
.s13:
3a9a : a5 55 __ LDA T3 + 0 
3a9c : f0 0d __ BEQ $3aab ; (menu_main.s4 + 0)
.s24:
3a9e : a5 54 __ LDA T1 + 0 
3aa0 : c9 1b __ CMP #$1b
3aa2 : f0 11 __ BEQ $3ab5 ; (menu_main.s26 + 0)
.s23:
3aa4 : c9 03 __ CMP #$03
3aa6 : f0 03 __ BEQ $3aab ; (menu_main.s4 + 0)
3aa8 : 4c 16 3a JMP $3a16 ; (menu_main.l3 + 0)
.s4:
3aab : a5 54 __ LDA T1 + 0 
3aad : c9 1b __ CMP #$1b
3aaf : f0 04 __ BEQ $3ab5 ; (menu_main.s26 + 0)
.s28:
3ab1 : c9 03 __ CMP #$03
3ab3 : d0 06 __ BNE $3abb ; (menu_main.s25 + 0)
.s26:
3ab5 : a9 63 __ LDA #$63
3ab7 : 85 55 __ STA T3 + 0 
3ab9 : d0 45 __ BNE $3b00 ; (menu_main.s2 + 0)
.s25:
3abb : a6 53 __ LDX T0 + 0 
3abd : ca __ __ DEX
3abe : 8e fe bf STX $bffe ; (sstack + 7)
3ac1 : bd 36 69 LDA $6936,x ; (menubar + 54)
3ac4 : 8d fc bf STA $bffc ; (sstack + 5)
3ac7 : a6 56 __ LDX T4 + 0 
3ac9 : e8 __ __ INX
3aca : 8e fd bf STX $bffd ; (sstack + 6)
3acd : 20 24 3b JSR $3b24 ; (menu_pulldown.s1000 + 0)
3ad0 : a5 1b __ LDA ACCU + 0 
3ad2 : 85 55 __ STA T3 + 0 
3ad4 : c9 12 __ CMP #$12
3ad6 : d0 0e __ BNE $3ae6 ; (menu_main.s31 + 0)
.s29:
3ad8 : a9 00 __ LDA #$00
3ada : 85 55 __ STA T3 + 0 
3adc : c6 53 __ DEC T0 + 0 
3ade : d0 06 __ BNE $3ae6 ; (menu_main.s31 + 0)
.s32:
3ae0 : a9 06 __ LDA #$06
3ae2 : 85 53 __ STA T0 + 0 
3ae4 : d0 13 __ BNE $3af9 ; (menu_main.s27 + 0)
.s31:
3ae6 : c9 13 __ CMP #$13
3ae8 : d0 0f __ BNE $3af9 ; (menu_main.s27 + 0)
.s35:
3aea : e6 53 __ INC T0 + 0 
3aec : a5 53 __ LDA T0 + 0 
3aee : c9 07 __ CMP #$07
3af0 : 90 03 __ BCC $3af5 ; (menu_main.s63 + 0)
3af2 : 4c 12 3a JMP $3a12 ; (menu_main.l84 + 0)
.s63:
3af5 : a9 00 __ LDA #$00
3af7 : 85 55 __ STA T3 + 0 
.s27:
3af9 : a5 55 __ LDA T3 + 0 
3afb : d0 03 __ BNE $3b00 ; (menu_main.s2 + 0)
3afd : 4c 16 3a JMP $3a16 ; (menu_main.l3 + 0)
.s2:
3b00 : a5 53 __ LDA T0 + 0 
3b02 : 0a __ __ ASL
3b03 : 0a __ __ ASL
3b04 : 18 __ __ CLC
3b05 : 65 53 __ ADC T0 + 0 
3b07 : 0a __ __ ASL
3b08 : 18 __ __ CLC
3b09 : 65 55 __ ADC T3 + 0 
3b0b : 85 1b __ STA ACCU + 0 
.s1001:
3b0d : a2 03 __ LDX #$03
3b0f : bd c7 bf LDA $bfc7,x ; (bigfont + 176)
3b12 : 95 53 __ STA T0 + 0,x 
3b14 : ca __ __ DEX
3b15 : 10 f8 __ BPL $3b0f ; (menu_main.s1001 + 2)
3b17 : 60 __ __ RTS
.s11:
3b18 : c6 53 __ DEC T0 + 0 
3b1a : f0 03 __ BEQ $3b1f ; (menu_main.s14 + 0)
3b1c : 4c 9a 3a JMP $3a9a ; (menu_main.s13 + 0)
.s14:
3b1f : a9 06 __ LDA #$06
3b21 : 4c 98 3a JMP $3a98 ; (menu_main.s1039 + 0)
--------------------------------------------------------------------
menu_pulldown: ; menu_pulldown(u8,u8,u8,u8)->u8
.s1000:
3b24 : a2 0a __ LDX #$0a
3b26 : b5 53 __ LDA T1 + 0,x 
3b28 : 9d cc bf STA $bfcc,x ; (bigfont + 181)
3b2b : ca __ __ DEX
3b2c : 10 f8 __ BPL $3b26 ; (menu_pulldown.s1000 + 2)
3b2e : 38 __ __ SEC
3b2f : a5 23 __ LDA SP + 0 
3b31 : e9 0a __ SBC #$0a
3b33 : 85 23 __ STA SP + 0 
3b35 : b0 02 __ BCS $3b39 ; (menu_pulldown.s0 + 0)
3b37 : c6 24 __ DEC SP + 1 
.s0:
3b39 : a9 3d __ LDA #$3d
3b3b : ae fe bf LDX $bffe ; (sstack + 7)
3b3e : 86 52 __ STX T0 + 0 
3b40 : 18 __ __ CLC
3b41 : 7d 12 67 ADC $6712,x ; (__multab102L + 0)
3b44 : 85 54 __ STA T2 + 0 
3b46 : 85 0d __ STA P0 
3b48 : a9 69 __ LDA #$69
3b4a : 7d 1a 67 ADC $671a,x ; (__multab102H + 0)
3b4d : 85 55 __ STA T2 + 1 
3b4f : 85 0e __ STA P1 
3b51 : 20 3c 2f JSR $2f3c ; (strlen.s0 + 0)
3b54 : a6 52 __ LDX T0 + 0 
3b56 : bd ee 67 LDA $67ee,x ; (pulldown_options + 0)
3b59 : 85 57 __ STA T4 + 0 
3b5b : 8d f9 bf STA $bff9 ; (sstack + 2)
3b5e : e0 06 __ CPX #$06
3b60 : 90 08 __ BCC $3b6a ; (menu_pulldown.s77 + 0)
.s76:
3b62 : a9 00 __ LDA #$00
3b64 : 85 53 __ STA T1 + 0 
3b66 : a9 f0 __ LDA #$f0
3b68 : b0 06 __ BCS $3b70 ; (menu_pulldown.s81 + 0)
.s77:
3b6a : a9 01 __ LDA #$01
3b6c : 85 53 __ STA T1 + 0 
3b6e : a9 70 __ LDA #$70
.s81:
3b70 : 85 17 __ STA P10 
3b72 : ad fc bf LDA $bffc ; (sstack + 5)
3b75 : 85 52 __ STA T0 + 0 
3b77 : 85 18 __ STA P11 
3b79 : ad fd bf LDA $bffd ; (sstack + 6)
3b7c : 85 56 __ STA T3 + 0 
3b7e : 8d f7 bf STA $bff7 ; (sstack + 0)
3b81 : 18 __ __ CLC
3b82 : a5 1b __ LDA ACCU + 0 
3b84 : 69 02 __ ADC #$02
3b86 : 8d f8 bf STA $bff8 ; (sstack + 1)
3b89 : 20 bf 30 JSR $30bf ; (vdcwin_win_new.s1000 + 0)
3b8c : a9 01 __ LDA #$01
3b8e : 85 59 __ STA T6 + 0 
3b90 : a5 57 __ LDA T4 + 0 
3b92 : f0 5c __ BEQ $3bf0 ; (menu_pulldown.l5 + 0)
.s58:
3b94 : a9 00 __ LDA #$00
3b96 : 85 58 __ STA T5 + 0 
3b98 : 85 5a __ STA T8 + 0 
3b9a : 85 5b __ STA T8 + 1 
3b9c : 18 __ __ CLC
.l1048:
3b9d : a9 90 __ LDA #$90
3b9f : a0 02 __ LDY #$02
3ba1 : 91 23 __ STA (SP + 0),y 
3ba3 : a9 6e __ LDA #$6e
3ba5 : c8 __ __ INY
3ba6 : 91 23 __ STA (SP + 0),y 
3ba8 : a9 72 __ LDA #$72
3baa : c8 __ __ INY
3bab : 91 23 __ STA (SP + 0),y 
3bad : a9 3d __ LDA #$3d
3baf : c8 __ __ INY
3bb0 : 91 23 __ STA (SP + 0),y 
3bb2 : a5 54 __ LDA T2 + 0 
3bb4 : 65 5a __ ADC T8 + 0 
3bb6 : c8 __ __ INY
3bb7 : 91 23 __ STA (SP + 0),y 
3bb9 : a5 55 __ LDA T2 + 1 
3bbb : 65 5b __ ADC T8 + 1 
3bbd : c8 __ __ INY
3bbe : 91 23 __ STA (SP + 0),y 
3bc0 : 20 99 2f JSR $2f99 ; (sprintf.s0 + 0)
3bc3 : a5 52 __ LDA T0 + 0 
3bc5 : 85 0f __ STA P2 
3bc7 : a9 90 __ LDA #$90
3bc9 : 85 11 __ STA P4 
3bcb : a9 6e __ LDA #$6e
3bcd : 85 12 __ STA P5 
3bcf : a9 c6 __ LDA #$c6
3bd1 : 85 13 __ STA P6 
3bd3 : 18 __ __ CLC
3bd4 : a5 58 __ LDA T5 + 0 
3bd6 : 65 56 __ ADC T3 + 0 
3bd8 : 85 10 __ STA P3 
3bda : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
3bdd : 18 __ __ CLC
3bde : a5 5a __ LDA T8 + 0 
3be0 : 69 11 __ ADC #$11
3be2 : 85 5a __ STA T8 + 0 
3be4 : 90 02 __ BCC $3be8 ; (menu_pulldown.s1051 + 0)
.s1050:
3be6 : e6 5b __ INC T8 + 1 
.s1051:
3be8 : e6 58 __ INC T5 + 0 
3bea : a5 58 __ LDA T5 + 0 
3bec : c5 57 __ CMP T4 + 0 
3bee : 90 ad __ BCC $3b9d ; (menu_pulldown.l1048 + 0)
.l5:
3bf0 : a9 2d __ LDA #$2d
3bf2 : a0 06 __ LDY #$06
3bf4 : 91 23 __ STA (SP + 0),y 
3bf6 : a9 00 __ LDA #$00
3bf8 : 85 1c __ STA ACCU + 1 
3bfa : c8 __ __ INY
3bfb : 91 23 __ STA (SP + 0),y 
3bfd : a9 90 __ LDA #$90
3bff : a0 02 __ LDY #$02
3c01 : 91 23 __ STA (SP + 0),y 
3c03 : a9 6e __ LDA #$6e
3c05 : c8 __ __ INY
3c06 : 91 23 __ STA (SP + 0),y 
3c08 : a9 77 __ LDA #$77
3c0a : c8 __ __ INY
3c0b : 91 23 __ STA (SP + 0),y 
3c0d : a9 3d __ LDA #$3d
3c0f : c8 __ __ INY
3c10 : 91 23 __ STA (SP + 0),y 
3c12 : a5 59 __ LDA T6 + 0 
3c14 : 85 1b __ STA ACCU + 0 
3c16 : a9 11 __ LDA #$11
3c18 : 20 2c 64 JSR $642c ; (mul16by8 + 0)
3c1b : 38 __ __ SEC
3c1c : a5 05 __ LDA WORK + 2 
3c1e : e9 11 __ SBC #$11
3c20 : aa __ __ TAX
3c21 : a5 06 __ LDA WORK + 3 
3c23 : e9 00 __ SBC #$00
3c25 : 85 5d __ STA T9 + 1 
3c27 : 8a __ __ TXA
3c28 : 18 __ __ CLC
3c29 : 65 54 __ ADC T2 + 0 
3c2b : a0 08 __ LDY #$08
3c2d : 91 23 __ STA (SP + 0),y 
3c2f : a5 5d __ LDA T9 + 1 
3c31 : 65 55 __ ADC T2 + 1 
3c33 : c8 __ __ INY
3c34 : 91 23 __ STA (SP + 0),y 
3c36 : 20 99 2f JSR $2f99 ; (sprintf.s0 + 0)
3c39 : a9 90 __ LDA #$90
3c3b : 85 11 __ STA P4 
3c3d : a9 6e __ LDA #$6e
3c3f : 85 12 __ STA P5 
3c41 : a9 cd __ LDA #$cd
3c43 : 85 13 __ STA P6 
3c45 : ad fc bf LDA $bffc ; (sstack + 5)
3c48 : 85 0f __ STA P2 
3c4a : ad fd bf LDA $bffd ; (sstack + 6)
3c4d : 85 56 __ STA T3 + 0 
3c4f : 18 __ __ CLC
3c50 : 65 59 __ ADC T6 + 0 
3c52 : 38 __ __ SEC
3c53 : e9 01 __ SBC #$01
3c55 : 85 10 __ STA P3 
3c57 : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
.l7:
3c5a : 20 d8 35 JSR $35d8 ; (vdcwin_getch.s0 + 0)
3c5d : a5 1b __ LDA ACCU + 0 
3c5f : 85 5a __ STA T8 + 0 
3c61 : c9 0d __ CMP #$0d
3c63 : f0 18 __ BEQ $3c7d ; (menu_pulldown.s8 + 0)
.s14:
3c65 : c9 9d __ CMP #$9d
3c67 : f0 14 __ BEQ $3c7d ; (menu_pulldown.s8 + 0)
.s13:
3c69 : c9 1d __ CMP #$1d
3c6b : f0 10 __ BEQ $3c7d ; (menu_pulldown.s8 + 0)
.s12:
3c6d : c9 91 __ CMP #$91
3c6f : f0 0c __ BEQ $3c7d ; (menu_pulldown.s8 + 0)
.s11:
3c71 : c9 11 __ CMP #$11
3c73 : f0 08 __ BEQ $3c7d ; (menu_pulldown.s8 + 0)
.s10:
3c75 : c9 1b __ CMP #$1b
3c77 : f0 04 __ BEQ $3c7d ; (menu_pulldown.s8 + 0)
.s9:
3c79 : c9 03 __ CMP #$03
3c7b : d0 dd __ BNE $3c5a ; (menu_pulldown.l7 + 0)
.s8:
3c7d : a5 1b __ LDA ACCU + 0 
3c7f : c9 1b __ CMP #$1b
3c81 : d0 03 __ BNE $3c86 ; (menu_pulldown.s42 + 0)
3c83 : 4c 63 3d JMP $3d63 ; (menu_pulldown.s16 + 0)
.s42:
3c86 : b0 03 __ BCS $3c8b ; (menu_pulldown.s43 + 0)
3c88 : 4c 53 3d JMP $3d53 ; (menu_pulldown.s44 + 0)
.s43:
3c8b : c9 91 __ CMP #$91
3c8d : f0 43 __ BEQ $3cd2 ; (menu_pulldown.s29 + 0)
.s50:
3c8f : b0 2f __ BCS $3cc0 ; (menu_pulldown.s51 + 0)
.s52:
3c91 : c9 1d __ CMP #$1d
3c93 : f0 03 __ BEQ $3c98 ; (menu_pulldown.s25 + 0)
3c95 : 4c f0 3b JMP $3bf0 ; (menu_pulldown.l5 + 0)
.s25:
3c98 : a5 53 __ LDA T1 + 0 
3c9a : d0 03 __ BNE $3c9f ; (menu_pulldown.s26 + 0)
3c9c : 4c f0 3b JMP $3bf0 ; (menu_pulldown.l5 + 0)
.s26:
3c9f : a9 13 __ LDA #$13
.s1047:
3ca1 : 85 59 __ STA T6 + 0 
.s6:
3ca3 : 20 e6 35 JSR $35e6 ; (vdcwin_win_free.s0 + 0)
3ca6 : a5 59 __ LDA T6 + 0 
3ca8 : 85 1b __ STA ACCU + 0 
.s1001:
3caa : 18 __ __ CLC
3cab : a5 23 __ LDA SP + 0 
3cad : 69 0a __ ADC #$0a
3caf : 85 23 __ STA SP + 0 
3cb1 : 90 02 __ BCC $3cb5 ; (menu_pulldown.s1001 + 11)
3cb3 : e6 24 __ INC SP + 1 
3cb5 : a2 0a __ LDX #$0a
3cb7 : bd cc bf LDA $bfcc,x ; (bigfont + 181)
3cba : 95 53 __ STA T1 + 0,x 
3cbc : ca __ __ DEX
3cbd : 10 f8 __ BPL $3cb7 ; (menu_pulldown.s1001 + 13)
3cbf : 60 __ __ RTS
.s51:
3cc0 : c9 9d __ CMP #$9d
3cc2 : f0 03 __ BEQ $3cc7 ; (menu_pulldown.s21 + 0)
3cc4 : 4c f0 3b JMP $3bf0 ; (menu_pulldown.l5 + 0)
.s21:
3cc7 : a5 53 __ LDA T1 + 0 
3cc9 : d0 03 __ BNE $3cce ; (menu_pulldown.s22 + 0)
3ccb : 4c f0 3b JMP $3bf0 ; (menu_pulldown.l5 + 0)
.s22:
3cce : a9 12 __ LDA #$12
3cd0 : d0 cf __ BNE $3ca1 ; (menu_pulldown.s1047 + 0)
.s29:
3cd2 : a9 90 __ LDA #$90
3cd4 : a0 02 __ LDY #$02
3cd6 : 91 23 __ STA (SP + 0),y 
3cd8 : a9 6e __ LDA #$6e
3cda : c8 __ __ INY
3cdb : 91 23 __ STA (SP + 0),y 
3cdd : a9 72 __ LDA #$72
3cdf : c8 __ __ INY
3ce0 : 91 23 __ STA (SP + 0),y 
3ce2 : a9 3d __ LDA #$3d
3ce4 : c8 __ __ INY
3ce5 : 91 23 __ STA (SP + 0),y 
3ce7 : a5 59 __ LDA T6 + 0 
3ce9 : 85 1b __ STA ACCU + 0 
3ceb : a9 00 __ LDA #$00
3ced : 85 1c __ STA ACCU + 1 
3cef : a9 11 __ LDA #$11
3cf1 : 20 2c 64 JSR $642c ; (mul16by8 + 0)
3cf4 : 38 __ __ SEC
3cf5 : a5 05 __ LDA WORK + 2 
3cf7 : e9 11 __ SBC #$11
3cf9 : aa __ __ TAX
3cfa : a5 06 __ LDA WORK + 3 
3cfc : e9 00 __ SBC #$00
3cfe : 85 45 __ STA T11 + 1 
3d00 : 8a __ __ TXA
3d01 : 18 __ __ CLC
3d02 : 65 54 __ ADC T2 + 0 
3d04 : a0 06 __ LDY #$06
3d06 : 91 23 __ STA (SP + 0),y 
3d08 : a5 45 __ LDA T11 + 1 
3d0a : 65 55 __ ADC T2 + 1 
3d0c : c8 __ __ INY
3d0d : 91 23 __ STA (SP + 0),y 
3d0f : 20 99 2f JSR $2f99 ; (sprintf.s0 + 0)
3d12 : a9 90 __ LDA #$90
3d14 : 85 11 __ STA P4 
3d16 : a9 6e __ LDA #$6e
3d18 : 85 12 __ STA P5 
3d1a : a9 c6 __ LDA #$c6
3d1c : 85 13 __ STA P6 
3d1e : ad fc bf LDA $bffc ; (sstack + 5)
3d21 : 85 0f __ STA P2 
3d23 : 18 __ __ CLC
3d24 : a5 59 __ LDA T6 + 0 
3d26 : 65 56 __ ADC T3 + 0 
3d28 : 38 __ __ SEC
3d29 : e9 01 __ SBC #$01
3d2b : 85 10 __ STA P3 
3d2d : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
3d30 : a5 5a __ LDA T8 + 0 
3d32 : c9 91 __ CMP #$91
3d34 : d0 0e __ BNE $3d44 ; (menu_pulldown.s31 + 0)
.s30:
3d36 : c6 59 __ DEC T6 + 0 
3d38 : f0 03 __ BEQ $3d3d ; (menu_pulldown.s33 + 0)
3d3a : 4c f0 3b JMP $3bf0 ; (menu_pulldown.l5 + 0)
.s33:
3d3d : a5 57 __ LDA T4 + 0 
.s1046:
3d3f : 85 59 __ STA T6 + 0 
3d41 : 4c f0 3b JMP $3bf0 ; (menu_pulldown.l5 + 0)
.s31:
3d44 : e6 59 __ INC T6 + 0 
3d46 : a5 57 __ LDA T4 + 0 
3d48 : c5 59 __ CMP T6 + 0 
3d4a : 90 03 __ BCC $3d4f ; (menu_pulldown.s36 + 0)
3d4c : 4c f0 3b JMP $3bf0 ; (menu_pulldown.l5 + 0)
.s36:
3d4f : a9 01 __ LDA #$01
3d51 : 90 ec __ BCC $3d3f ; (menu_pulldown.s1046 + 0)
.s44:
3d53 : c9 0d __ CMP #$0d
3d55 : d0 03 __ BNE $3d5a ; (menu_pulldown.s45 + 0)
3d57 : 4c a3 3c JMP $3ca3 ; (menu_pulldown.s6 + 0)
.s45:
3d5a : b0 0c __ BCS $3d68 ; (menu_pulldown.s46 + 0)
.s47:
3d5c : c9 03 __ CMP #$03
3d5e : f0 03 __ BEQ $3d63 ; (menu_pulldown.s16 + 0)
3d60 : 4c f0 3b JMP $3bf0 ; (menu_pulldown.l5 + 0)
.s16:
3d63 : a9 00 __ LDA #$00
3d65 : 4c a1 3c JMP $3ca1 ; (menu_pulldown.s1047 + 0)
.s46:
3d68 : c9 11 __ CMP #$11
3d6a : d0 03 __ BNE $3d6f ; (menu_pulldown.s46 + 7)
3d6c : 4c d2 3c JMP $3cd2 ; (menu_pulldown.s29 + 0)
3d6f : 4c f0 3b JMP $3bf0 ; (menu_pulldown.l5 + 0)
--------------------------------------------------------------------
3d72 : __ __ __ BYT 20 25 53 20 00                                  :  %S .
--------------------------------------------------------------------
3d77 : __ __ __ BYT 25 43 25 53 20 00                               : %C%S .
--------------------------------------------------------------------
settings_screenmode: ; settings_screenmode()->void
.s1000:
3d7d : a5 53 __ LDA T0 + 0 
3d7f : 8d ca bf STA $bfca ; (bigfont + 179)
3d82 : a5 54 __ LDA T2 + 0 
3d84 : 8d cb bf STA $bfcb ; (bigfont + 180)
.s0:
3d87 : a9 f0 __ LDA #$f0
3d89 : 85 17 __ STA P10 
3d8b : a9 08 __ LDA #$08
3d8d : 85 18 __ STA P11 
3d8f : 8d f7 bf STA $bff7 ; (sstack + 0)
3d92 : a9 1e __ LDA #$1e
3d94 : 8d f8 bf STA $bff8 ; (sstack + 1)
3d97 : a9 0a __ LDA #$0a
3d99 : 8d f9 bf STA $bff9 ; (sstack + 2)
3d9c : ad eb 6c LDA $6ceb ; (vdc_state + 7)
3d9f : 85 53 __ STA T0 + 0 
3da1 : a9 8d __ LDA #$8d
3da3 : 8d eb 6c STA $6ceb ; (vdc_state + 7)
3da6 : 20 bf 30 JSR $30bf ; (vdcwin_win_new.s1000 + 0)
3da9 : a9 e7 __ LDA #$e7
3dab : 85 11 __ STA P4 
3dad : a9 3d __ LDA #$3d
3daf : 85 12 __ STA P5 
3db1 : 20 6a 67 JSR $676a ; (vdc_prints_attr@proxy + 0)
3db4 : a9 19 __ LDA #$19
3db6 : 8d fc bf STA $bffc ; (sstack + 5)
3db9 : a9 0b __ LDA #$0b
3dbb : 8d fd bf STA $bffd ; (sstack + 6)
3dbe : a9 07 __ LDA #$07
3dc0 : 8d fe bf STA $bffe ; (sstack + 7)
3dc3 : 20 24 3b JSR $3b24 ; (menu_pulldown.s1000 + 0)
3dc6 : a5 1b __ LDA ACCU + 0 
3dc8 : 85 54 __ STA T2 + 0 
3dca : 20 e6 35 JSR $35e6 ; (vdcwin_win_free.s0 + 0)
3dcd : a4 54 __ LDY T2 + 0 
3dcf : f0 06 __ BEQ $3dd7 ; (settings_screenmode.s4 + 0)
.s2:
3dd1 : 88 __ __ DEY
3dd2 : 84 16 __ STY P9 
3dd4 : 20 9f 2b JSR $2b9f ; (vdc_set_mode.s0 + 0)
.s4:
3dd7 : a5 53 __ LDA T0 + 0 
3dd9 : 8d eb 6c STA $6ceb ; (vdc_state + 7)
.s1001:
3ddc : ad ca bf LDA $bfca ; (bigfont + 179)
3ddf : 85 53 __ STA T0 + 0 
3de1 : ad cb bf LDA $bfcb ; (bigfont + 180)
3de4 : 85 54 __ STA T2 + 0 
3de6 : 60 __ __ RTS
--------------------------------------------------------------------
3de7 : __ __ __ BYT 73 45 4c 45 43 54 20 53 43 52 45 45 4e 20 4d 4f : sELECT SCREEN MO
3df7 : __ __ __ BYT 44 45 00                                        : DE.
--------------------------------------------------------------------
settings_versioninfo: ; settings_versioninfo()->void
.s1000:
3dfa : 38 __ __ SEC
3dfb : a5 23 __ LDA SP + 0 
3dfd : e9 08 __ SBC #$08
3dff : 85 23 __ STA SP + 0 
3e01 : b0 02 __ BCS $3e05 ; (settings_versioninfo.s0 + 0)
3e03 : c6 24 __ DEC SP + 1 
.s0:
3e05 : a9 f0 __ LDA #$f0
3e07 : 85 17 __ STA P10 
3e09 : a9 05 __ LDA #$05
3e0b : 85 18 __ STA P11 
3e0d : 8d f7 bf STA $bff7 ; (sstack + 0)
3e10 : a9 3c __ LDA #$3c
3e12 : 8d f8 bf STA $bff8 ; (sstack + 1)
3e15 : a9 0f __ LDA #$0f
3e17 : 8d f9 bf STA $bff9 ; (sstack + 2)
3e1a : ad eb 6c LDA $6ceb ; (vdc_state + 7)
3e1d : 85 52 __ STA T0 + 0 
3e1f : a9 8d __ LDA #$8d
3e21 : 8d eb 6c STA $6ceb ; (vdc_state + 7)
3e24 : 20 bf 30 JSR $30bf ; (vdcwin_win_new.s1000 + 0)
3e27 : a9 06 __ LDA #$06
3e29 : 85 0f __ STA P2 
3e2b : 85 10 __ STA P3 
3e2d : a9 ad __ LDA #$ad
3e2f : 8d eb 6c STA $6ceb ; (vdc_state + 7)
3e32 : 85 13 __ STA P6 
3e34 : a9 00 __ LDA #$00
3e36 : 85 11 __ STA P4 
3e38 : a9 3f __ LDA #$3f
3e3a : 85 12 __ STA P5 
3e3c : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
3e3f : a9 08 __ LDA #$08
3e41 : 85 10 __ STA P3 
3e43 : a9 8d __ LDA #$8d
3e45 : 8d eb 6c STA $6ceb ; (vdc_state + 7)
3e48 : 85 13 __ STA P6 
3e4a : a9 ed __ LDA #$ed
3e4c : 85 11 __ STA P4 
3e4e : a9 3e __ LDA #$3e
3e50 : 85 12 __ STA P5 
3e52 : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
3e55 : e6 10 __ INC P3 
3e57 : a9 20 __ LDA #$20
3e59 : 85 11 __ STA P4 
3e5b : a9 3f __ LDA #$3f
3e5d : 85 12 __ STA P5 
3e5f : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
3e62 : a9 90 __ LDA #$90
3e64 : a0 02 __ LDY #$02
3e66 : 91 23 __ STA (SP + 0),y 
3e68 : a9 6e __ LDA #$6e
3e6a : c8 __ __ INY
3e6b : 91 23 __ STA (SP + 0),y 
3e6d : a9 3e __ LDA #$3e
3e6f : c8 __ __ INY
3e70 : 91 23 __ STA (SP + 0),y 
3e72 : a9 3f __ LDA #$3f
3e74 : c8 __ __ INY
3e75 : 91 23 __ STA (SP + 0),y 
3e77 : a9 4a __ LDA #$4a
3e79 : c8 __ __ INY
3e7a : 91 23 __ STA (SP + 0),y 
3e7c : a9 3f __ LDA #$3f
3e7e : c8 __ __ INY
3e7f : 91 23 __ STA (SP + 0),y 
3e81 : 20 99 2f JSR $2f99 ; (sprintf.s0 + 0)
3e84 : a9 06 __ LDA #$06
3e86 : 85 0f __ STA P2 
3e88 : a9 0a __ LDA #$0a
3e8a : 85 10 __ STA P3 
3e8c : 20 af 67 JSR $67af ; (vdc_prints_attr@proxy + 0)
3e8f : a9 0c __ LDA #$0c
3e91 : 85 10 __ STA P3 
3e93 : a9 5c __ LDA #$5c
3e95 : 85 11 __ STA P4 
3e97 : a9 3f __ LDA #$3f
3e99 : 85 12 __ STA P5 
3e9b : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
3e9e : e6 10 __ INC P3 
3ea0 : a9 73 __ LDA #$73
3ea2 : 85 11 __ STA P4 
3ea4 : a9 3f __ LDA #$3f
3ea6 : 85 12 __ STA P5 
3ea8 : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
3eab : e6 10 __ INC P3 
3ead : a9 a3 __ LDA #$a3
3eaf : 85 11 __ STA P4 
3eb1 : a9 3f __ LDA #$3f
3eb3 : 85 12 __ STA P5 
3eb5 : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
3eb8 : a9 10 __ LDA #$10
3eba : 85 10 __ STA P3 
3ebc : a9 ca __ LDA #$ca
3ebe : 85 11 __ STA P4 
3ec0 : a9 3f __ LDA #$3f
3ec2 : 85 12 __ STA P5 
3ec4 : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
3ec7 : a9 12 __ LDA #$12
3ec9 : 85 10 __ STA P3 
3ecb : a9 e7 __ LDA #$e7
3ecd : 85 11 __ STA P4 
3ecf : a9 3f __ LDA #$3f
3ed1 : 85 12 __ STA P5 
3ed3 : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
3ed6 : 20 a4 29 JSR $29a4 ; (getch.s0 + 0)
3ed9 : 20 e6 35 JSR $35e6 ; (vdcwin_win_free.s0 + 0)
3edc : a5 52 __ LDA T0 + 0 
3ede : 8d eb 6c STA $6ceb ; (vdc_state + 7)
.s1001:
3ee1 : 18 __ __ CLC
3ee2 : a5 23 __ LDA SP + 0 
3ee4 : 69 08 __ ADC #$08
3ee6 : 85 23 __ STA SP + 0 
3ee8 : 90 02 __ BCC $3eec ; (settings_versioninfo.s1001 + 11)
3eea : e6 24 __ INC SP + 1 
3eec : 60 __ __ RTS
--------------------------------------------------------------------
3eed : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d 4f : oSCAR64 vdc dEMO
3efd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
3efe : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
bootdevice:
3eff : __ __ __ BSS	1
--------------------------------------------------------------------
3f00 : __ __ __ BYT 76 45 52 53 49 4f 4e 20 49 4e 46 4f 52 4d 41 54 : vERSION INFORMAT
3f10 : __ __ __ BYT 49 4f 4e 20 41 4e 44 20 43 52 45 44 49 54 53 00 : ION AND CREDITS.
--------------------------------------------------------------------
3f20 : __ __ __ BYT 77 52 49 54 54 45 4e 20 49 4e 20 32 30 32 34 20 : wRITTEN IN 2024 
3f30 : __ __ __ BYT 42 59 20 78 41 4e 44 45 52 20 6d 4f 4c 00       : BY xANDER mOL.
--------------------------------------------------------------------
3f3e : __ __ __ BYT 76 45 52 53 49 4f 4e 3a 20 25 53 00             : vERSION: %S.
--------------------------------------------------------------------
3f4a : __ __ __ BYT 56 30 31 2d 32 30 32 34 30 32 31 38 2d 31 37 35 : V01-20240218-175
3f5a : __ __ __ BYT 34 00                                           : 4.
--------------------------------------------------------------------
3f5c : __ __ __ BYT 6d 55 53 49 43 20 42 59 20 6e 4f 52 44 49 53 43 : mUSIC BY nORDISC
3f6c : __ __ __ BYT 48 53 4f 55 4e 44 00                            : HSOUND.
--------------------------------------------------------------------
3f73 : __ __ __ BYT 66 55 4c 4c 20 53 4f 55 52 43 45 20 43 4f 44 45 : fULL SOURCE CODE
3f83 : __ __ __ BYT 2c 20 44 4f 43 55 4d 45 4e 54 41 54 49 4f 4e 20 : , DOCUMENTATION 
3f93 : __ __ __ BYT 41 4e 44 20 43 52 45 44 49 54 53 20 41 54 3a 00 : AND CREDITS AT:.
--------------------------------------------------------------------
3fa3 : __ __ __ BYT 48 54 54 50 53 3a 2f 2f 47 49 54 48 55 42 2e 43 : HTTPS://GITHUB.C
3fb3 : __ __ __ BYT 4f 4d 2f 58 41 48 4d 4f 4c 2f 6f 53 43 41 52 36 : OM/XAHMOL/oSCAR6
3fc3 : __ __ __ BYT 34 74 45 53 54 2f 00                            : 4tEST/.
--------------------------------------------------------------------
3fca : __ __ __ BYT 28 63 29 20 32 30 32 34 2c 20 69 64 52 45 41 4d : (c) 2024, idREAM
3fda : __ __ __ BYT 54 69 4e 38 62 49 54 53 2e 43 4f 4d 00          : TiN8bITS.COM.
--------------------------------------------------------------------
3fe7 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 54 4f 20 43 : pRESS A KEY TO C
3ff7 : __ __ __ BYT 4f 4e 54 49 4e 55 45 2e 00                      : ONTINUE..
--------------------------------------------------------------------
windows_windowstacking: ; windows_windowstacking()->void
.s1000:
4000 : a5 53 __ LDA T0 + 0 
4002 : 8d 46 bf STA $bf46 ; (bigfont + 47)
4005 : a5 54 __ LDA T4 + 0 
4007 : 8d 47 bf STA $bf47 ; (bigfont + 48)
.s0:
400a : ad 08 dc LDA $dc08 
400d : 18 __ __ CLC
400e : 6d 09 dc ADC $dc09 
4011 : a8 __ __ TAY
4012 : a9 00 __ LDA #$00
4014 : 85 53 __ STA T0 + 0 
4016 : 2a __ __ ROL
4017 : aa __ __ TAX
4018 : 98 __ __ TYA
4019 : 69 01 __ ADC #$01
401b : 8d fd 60 STA $60fd ; (seed + 0)
401e : 90 01 __ BCC $4021 ; (windows_windowstacking.s1007 + 0)
.s1006:
4020 : e8 __ __ INX
.s1007:
4021 : 8e fe 60 STX $60fe ; (seed + 1)
.l2:
4024 : a9 28 __ LDA #$28
4026 : 8d f8 bf STA $bff8 ; (sstack + 1)
4029 : a5 53 __ LDA T0 + 0 
402b : 29 01 __ AND #$01
402d : 09 f0 __ ORA #$f0
402f : 85 17 __ STA P10 
4031 : a5 53 __ LDA T0 + 0 
4033 : 0a __ __ ASL
4034 : 0a __ __ ASL
4035 : 18 __ __ CLC
4036 : 65 53 __ ADC T0 + 0 
4038 : 18 __ __ CLC
4039 : 69 05 __ ADC #$05
403b : 85 18 __ STA P11 
403d : a5 53 __ LDA T0 + 0 
403f : 0a __ __ ASL
4040 : 18 __ __ CLC
4041 : 65 53 __ ADC T0 + 0 
4043 : 18 __ __ CLC
4044 : 69 05 __ ADC #$05
4046 : 8d f7 bf STA $bff7 ; (sstack + 0)
4049 : ad e9 6c LDA $6ce9 ; (vdc_state + 5)
404c : 85 1b __ STA ACCU + 0 
404e : ad ea 6c LDA $6cea ; (vdc_state + 6)
4051 : 85 1c __ STA ACCU + 1 
4053 : a9 03 __ LDA #$03
4055 : 85 03 __ STA WORK + 0 
4057 : a9 00 __ LDA #$00
4059 : 85 04 __ STA WORK + 1 
405b : 20 8e 64 JSR $648e ; (divmod + 0)
405e : a5 1b __ LDA ACCU + 0 
4060 : 8d f9 bf STA $bff9 ; (sstack + 2)
4063 : 20 bf 30 JSR $30bf ; (vdcwin_win_new.s1000 + 0)
4066 : a9 64 __ LDA #$64
4068 : 85 54 __ STA T4 + 0 
.l5:
406a : 20 a3 41 JSR $41a3 ; (rand.s0 + 0)
406d : a9 90 __ LDA #$90
406f : 8d fc bf STA $bffc ; (sstack + 5)
4072 : a9 6e __ LDA #$6e
4074 : 8d fd bf STA $bffd ; (sstack + 6)
4077 : ad eb 6c LDA $6ceb ; (vdc_state + 7)
407a : 29 f0 __ AND #$f0
407c : 85 45 __ STA T3 + 0 
407e : a9 0f __ LDA #$0f
4080 : 85 03 __ STA WORK + 0 
4082 : a9 00 __ LDA #$00
4084 : 85 04 __ STA WORK + 1 
4086 : 20 8e 64 JSR $648e ; (divmod + 0)
4089 : a5 05 __ LDA WORK + 2 
408b : 38 __ __ SEC
408c : 65 45 __ ADC T3 + 0 
408e : 8d eb 6c STA $6ceb ; (vdc_state + 7)
4091 : 20 ca 41 JSR $41ca ; (generateSentence.s1000 + 0)
4094 : a9 90 __ LDA #$90
4096 : 8d fe bf STA $bffe ; (sstack + 7)
4099 : a9 6e __ LDA #$6e
409b : 8d ff bf STA $bfff ; (sstack + 8)
409e : ad e1 6c LDA $6ce1 ; (winCfg + 5)
40a1 : 85 1b __ STA ACCU + 0 
40a3 : a9 00 __ LDA #$00
40a5 : 85 1c __ STA ACCU + 1 
40a7 : a9 0d __ LDA #$0d
40a9 : 20 2c 64 JSR $642c ; (mul16by8 + 0)
40ac : 18 __ __ CLC
40ad : a9 c9 __ LDA #$c9
40af : 65 05 __ ADC WORK + 2 
40b1 : 8d fc bf STA $bffc ; (sstack + 5)
40b4 : a9 6d __ LDA #$6d
40b6 : 69 00 __ ADC #$00
40b8 : 8d fd bf STA $bffd ; (sstack + 6)
40bb : 20 0d 43 JSR $430d ; (vdcwin_printwrap.s1000 + 0)
40be : ac e1 6c LDY $6ce1 ; (winCfg + 5)
40c1 : be 07 67 LDX $6707,y ; (__multab13L + 0)
40c4 : bd cd 6d LDA $6dcd,x ; (krnio_pstatus + 10)
40c7 : f0 17 __ BEQ $40e0 ; (windows_windowstacking.s56 + 0)
.s9:
40c9 : 86 43 __ STX T2 + 0 
40cb : a9 20 __ LDA #$20
40cd : 8d f7 bf STA $bff7 ; (sstack + 0)
40d0 : 18 __ __ CLC
40d1 : a9 c9 __ LDA #$c9
40d3 : 65 43 __ ADC T2 + 0 
40d5 : 85 17 __ STA P10 
40d7 : a9 6d __ LDA #$6d
40d9 : 69 00 __ ADC #$00
40db : 85 18 __ STA P11 
40dd : 20 05 48 JSR $4805 ; (vdcwin_put_char.s1000 + 0)
.s56:
40e0 : c6 54 __ DEC T4 + 0 
40e2 : d0 86 __ BNE $406a ; (windows_windowstacking.l5 + 0)
.s7:
40e4 : 20 a4 29 JSR $29a4 ; (getch.s0 + 0)
40e7 : ad eb 6c LDA $6ceb ; (vdc_state + 7)
40ea : 29 f0 __ AND #$f0
40ec : 09 0d __ ORA #$0d
40ee : 8d eb 6c STA $6ceb ; (vdc_state + 7)
40f1 : e6 53 __ INC T0 + 0 
40f3 : ad e1 6c LDA $6ce1 ; (winCfg + 5)
40f6 : c9 03 __ CMP #$03
40f8 : b0 03 __ BCS $40fd ; (windows_windowstacking.l13 + 0)
40fa : 4c 24 40 JMP $4024 ; (windows_windowstacking.l2 + 0)
.l13:
40fd : 20 e6 35 JSR $35e6 ; (vdcwin_win_free.s0 + 0)
4100 : a9 64 __ LDA #$64
4102 : 85 53 __ STA T0 + 0 
.l16:
4104 : 20 a3 41 JSR $41a3 ; (rand.s0 + 0)
4107 : a9 90 __ LDA #$90
4109 : 8d fc bf STA $bffc ; (sstack + 5)
410c : a9 6e __ LDA #$6e
410e : 8d fd bf STA $bffd ; (sstack + 6)
4111 : ad eb 6c LDA $6ceb ; (vdc_state + 7)
4114 : 29 f0 __ AND #$f0
4116 : 85 45 __ STA T3 + 0 
4118 : a9 0f __ LDA #$0f
411a : 85 03 __ STA WORK + 0 
411c : a9 00 __ LDA #$00
411e : 85 04 __ STA WORK + 1 
4120 : 20 8e 64 JSR $648e ; (divmod + 0)
4123 : a5 05 __ LDA WORK + 2 
4125 : 38 __ __ SEC
4126 : 65 45 __ ADC T3 + 0 
4128 : 8d eb 6c STA $6ceb ; (vdc_state + 7)
412b : 20 ca 41 JSR $41ca ; (generateSentence.s1000 + 0)
412e : a9 90 __ LDA #$90
4130 : 8d fe bf STA $bffe ; (sstack + 7)
4133 : a9 6e __ LDA #$6e
4135 : 8d ff bf STA $bfff ; (sstack + 8)
4138 : ad e1 6c LDA $6ce1 ; (winCfg + 5)
413b : 85 1b __ STA ACCU + 0 
413d : a9 00 __ LDA #$00
413f : 85 1c __ STA ACCU + 1 
4141 : a9 0d __ LDA #$0d
4143 : 20 2c 64 JSR $642c ; (mul16by8 + 0)
4146 : 18 __ __ CLC
4147 : a9 c9 __ LDA #$c9
4149 : 65 05 __ ADC WORK + 2 
414b : 8d fc bf STA $bffc ; (sstack + 5)
414e : a9 6d __ LDA #$6d
4150 : 69 00 __ ADC #$00
4152 : 8d fd bf STA $bffd ; (sstack + 6)
4155 : 20 0d 43 JSR $430d ; (vdcwin_printwrap.s1000 + 0)
4158 : ac e1 6c LDY $6ce1 ; (winCfg + 5)
415b : be 07 67 LDX $6707,y ; (__multab13L + 0)
415e : bd cd 6d LDA $6dcd,x ; (krnio_pstatus + 10)
4161 : f0 17 __ BEQ $417a ; (windows_windowstacking.s57 + 0)
.s20:
4163 : 86 43 __ STX T2 + 0 
4165 : a9 20 __ LDA #$20
4167 : 8d f7 bf STA $bff7 ; (sstack + 0)
416a : 18 __ __ CLC
416b : a9 c9 __ LDA #$c9
416d : 65 43 __ ADC T2 + 0 
416f : 85 17 __ STA P10 
4171 : a9 6d __ LDA #$6d
4173 : 69 00 __ ADC #$00
4175 : 85 18 __ STA P11 
4177 : 20 05 48 JSR $4805 ; (vdcwin_put_char.s1000 + 0)
.s57:
417a : c6 53 __ DEC T0 + 0 
417c : d0 86 __ BNE $4104 ; (windows_windowstacking.l16 + 0)
.s18:
417e : 20 a4 29 JSR $29a4 ; (getch.s0 + 0)
4181 : ad eb 6c LDA $6ceb ; (vdc_state + 7)
4184 : 29 f0 __ AND #$f0
4186 : 09 0d __ ORA #$0d
4188 : 8d eb 6c STA $6ceb ; (vdc_state + 7)
418b : a9 01 __ LDA #$01
418d : cd e1 6c CMP $6ce1 ; (winCfg + 5)
4190 : b0 03 __ BCS $4195 ; (windows_windowstacking.s14 + 0)
4192 : 4c fd 40 JMP $40fd ; (windows_windowstacking.l13 + 0)
.s14:
4195 : 20 e6 35 JSR $35e6 ; (vdcwin_win_free.s0 + 0)
.s1001:
4198 : ad 46 bf LDA $bf46 ; (bigfont + 47)
419b : 85 53 __ STA T0 + 0 
419d : ad 47 bf LDA $bf47 ; (bigfont + 48)
41a0 : 85 54 __ STA T4 + 0 
41a2 : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
.s0:
41a3 : ad fe 60 LDA $60fe ; (seed + 1)
41a6 : 4a __ __ LSR
41a7 : ad fd 60 LDA $60fd ; (seed + 0)
41aa : 6a __ __ ROR
41ab : aa __ __ TAX
41ac : a9 00 __ LDA #$00
41ae : 6a __ __ ROR
41af : 4d fd 60 EOR $60fd ; (seed + 0)
41b2 : 85 1b __ STA ACCU + 0 
41b4 : 8a __ __ TXA
41b5 : 4d fe 60 EOR $60fe ; (seed + 1)
41b8 : 85 1c __ STA ACCU + 1 
41ba : 4a __ __ LSR
41bb : 45 1b __ EOR ACCU + 0 
41bd : 8d fd 60 STA $60fd ; (seed + 0)
41c0 : 85 1b __ STA ACCU + 0 
41c2 : 45 1c __ EOR ACCU + 1 
41c4 : 8d fe 60 STA $60fe ; (seed + 1)
41c7 : 85 1c __ STA ACCU + 1 
.s1001:
41c9 : 60 __ __ RTS
--------------------------------------------------------------------
generateSentence: ; generateSentence(u8*)->void
.s1000:
41ca : a5 53 __ LDA T2 + 0 
41cc : 8d 4a bf STA $bf4a ; (bigfont + 51)
41cf : a5 54 __ LDA T2 + 1 
41d1 : 8d 4b bf STA $bf4b ; (bigfont + 52)
41d4 : 38 __ __ SEC
41d5 : a5 23 __ LDA SP + 0 
41d7 : e9 0e __ SBC #$0e
41d9 : 85 23 __ STA SP + 0 
41db : b0 02 __ BCS $41df ; (generateSentence.s0 + 0)
41dd : c6 24 __ DEC SP + 1 
.s0:
41df : a9 74 __ LDA #$74
41e1 : 8d d3 bf STA $bfd3 ; (bigfont + 188)
41e4 : a9 48 __ LDA #$48
41e6 : 8d d4 bf STA $bfd4 ; (bigfont + 189)
41e9 : a9 45 __ LDA #$45
41eb : 8d d5 bf STA $bfd5 ; (bigfont + 190)
41ee : a9 00 __ LDA #$00
41f0 : 8d d6 bf STA $bfd6 ; (bigfont + 191)
41f3 : 8d d8 bf STA $bfd8 ; (bigfont + 193)
41f6 : 8d d9 bf STA $bfd9 ; (bigfont + 194)
41f9 : 8d da bf STA $bfda ; (bigfont + 195)
41fc : a9 61 __ LDA #$61
41fe : 8d d7 bf STA $bfd7 ; (bigfont + 192)
4201 : a2 4b __ LDX #$4b
.l1002:
4203 : bd 6c 6c LDA $6c6c,x ; (pulldown_titles + 815)
4206 : 9d 87 bf STA $bf87,x ; (bigfont + 112)
4209 : ca __ __ DEX
420a : d0 f7 __ BNE $4203 ; (generateSentence.l1002 + 0)
.s1003:
420c : a2 1e __ LDX #$1e
.l1004:
420e : bd d7 68 LDA $68d7,x ; (vdc_modes + 215)
4211 : 9d 69 bf STA $bf69,x ; (bigfont + 82)
4214 : ca __ __ DEX
4215 : d0 f7 __ BNE $420e ; (generateSentence.l1004 + 0)
.s1005:
4217 : a2 1e __ LDX #$1e
.l1006:
4219 : bd b7 6c LDA $6cb7,x 
421c : 9d 4b bf STA $bf4b,x ; (bigfont + 52)
421f : ca __ __ DEX
4220 : d0 f7 __ BNE $4219 ; (generateSentence.l1006 + 0)
.s1007:
4222 : 20 a3 41 JSR $41a3 ; (rand.s0 + 0)
4225 : a5 1b __ LDA ACCU + 0 
4227 : 85 4e __ STA T0 + 0 
4229 : 20 a3 41 JSR $41a3 ; (rand.s0 + 0)
422c : a5 1b __ LDA ACCU + 0 
422e : 85 4f __ STA T1 + 0 
4230 : a5 1c __ LDA ACCU + 1 
4232 : 85 50 __ STA T1 + 1 
4234 : 20 a3 41 JSR $41a3 ; (rand.s0 + 0)
4237 : a5 1b __ LDA ACCU + 0 
4239 : 85 53 __ STA T2 + 0 
423b : a5 1c __ LDA ACCU + 1 
423d : 85 54 __ STA T2 + 1 
423f : 20 a3 41 JSR $41a3 ; (rand.s0 + 0)
4242 : ad fc bf LDA $bffc ; (sstack + 5)
4245 : 85 45 __ STA T4 + 0 
4247 : ad fd bf LDA $bffd ; (sstack + 6)
424a : 85 46 __ STA T4 + 1 
424c : a9 00 __ LDA #$00
424e : 85 04 __ STA WORK + 1 
4250 : a8 __ __ TAY
4251 : 91 45 __ STA (T4 + 0),y 
4253 : a5 45 __ LDA T4 + 0 
4255 : a0 02 __ LDY #$02
4257 : 91 23 __ STA (SP + 0),y 
4259 : a5 46 __ LDA T4 + 1 
425b : c8 __ __ INY
425c : 91 23 __ STA (SP + 0),y 
425e : a9 00 __ LDA #$00
4260 : c8 __ __ INY
4261 : 91 23 __ STA (SP + 0),y 
4263 : a9 43 __ LDA #$43
4265 : c8 __ __ INY
4266 : 84 03 __ STY WORK + 0 
4268 : 91 23 __ STA (SP + 0),y 
426a : a5 4e __ LDA T0 + 0 
426c : 29 01 __ AND #$01
426e : 0a __ __ ASL
426f : 0a __ __ ASL
4270 : 69 d3 __ ADC #$d3
4272 : c8 __ __ INY
4273 : 91 23 __ STA (SP + 0),y 
4275 : a9 bf __ LDA #$bf
4277 : 69 00 __ ADC #$00
4279 : c8 __ __ INY
427a : 91 23 __ STA (SP + 0),y 
427c : 20 8e 64 JSR $648e ; (divmod + 0)
427f : a6 05 __ LDX WORK + 2 
4281 : bd 22 67 LDA $6722,x ; (__multab6L + 0)
4284 : 18 __ __ CLC
4285 : 69 4c __ ADC #$4c
4287 : a0 08 __ LDY #$08
4289 : 91 23 __ STA (SP + 0),y 
428b : a9 bf __ LDA #$bf
428d : 69 00 __ ADC #$00
428f : c8 __ __ INY
4290 : 91 23 __ STA (SP + 0),y 
4292 : a5 4f __ LDA T1 + 0 
4294 : 85 1b __ STA ACCU + 0 
4296 : a5 50 __ LDA T1 + 1 
4298 : 85 1c __ STA ACCU + 1 
429a : a9 05 __ LDA #$05
429c : 85 03 __ STA WORK + 0 
429e : a9 00 __ LDA #$00
42a0 : 85 04 __ STA WORK + 1 
42a2 : 20 8e 64 JSR $648e ; (divmod + 0)
42a5 : a6 05 __ LDX WORK + 2 
42a7 : bd 27 67 LDA $6727,x ; (__multab15L + 0)
42aa : 18 __ __ CLC
42ab : 69 88 __ ADC #$88
42ad : a0 0a __ LDY #$0a
42af : 91 23 __ STA (SP + 0),y 
42b1 : a9 bf __ LDA #$bf
42b3 : 69 00 __ ADC #$00
42b5 : c8 __ __ INY
42b6 : 91 23 __ STA (SP + 0),y 
42b8 : a5 53 __ LDA T2 + 0 
42ba : 85 1b __ STA ACCU + 0 
42bc : a5 54 __ LDA T2 + 1 
42be : 85 1c __ STA ACCU + 1 
42c0 : a9 05 __ LDA #$05
42c2 : 85 03 __ STA WORK + 0 
42c4 : a9 00 __ LDA #$00
42c6 : 85 04 __ STA WORK + 1 
42c8 : 20 8e 64 JSR $648e ; (divmod + 0)
42cb : a6 05 __ LDX WORK + 2 
42cd : bd 22 67 LDA $6722,x ; (__multab6L + 0)
42d0 : 18 __ __ CLC
42d1 : 69 6a __ ADC #$6a
42d3 : a0 0c __ LDY #$0c
42d5 : 91 23 __ STA (SP + 0),y 
42d7 : a9 bf __ LDA #$bf
42d9 : 69 00 __ ADC #$00
42db : c8 __ __ INY
42dc : 91 23 __ STA (SP + 0),y 
42de : 20 99 2f JSR $2f99 ; (sprintf.s0 + 0)
.s1001:
42e1 : 18 __ __ CLC
42e2 : a5 23 __ LDA SP + 0 
42e4 : 69 0e __ ADC #$0e
42e6 : 85 23 __ STA SP + 0 
42e8 : 90 02 __ BCC $42ec ; (generateSentence.s1001 + 11)
42ea : e6 24 __ INC SP + 1 
42ec : ad 4a bf LDA $bf4a ; (bigfont + 51)
42ef : 85 53 __ STA T2 + 0 
42f1 : ad 4b bf LDA $bf4b ; (bigfont + 52)
42f4 : 85 54 __ STA T2 + 1 
42f6 : 60 __ __ RTS
--------------------------------------------------------------------
42f7 : __ __ __ BYT 53 43 52 45 45 4e 31 00                         : SCREEN1.
--------------------------------------------------------------------
4300 : __ __ __ BYT 25 53 20 25 53 20 25 53 20 25 53 2e 00          : %S %S %S %S..
--------------------------------------------------------------------
vdcwin_printwrap: ; vdcwin_printwrap(struct VDCWin*,const u8*)->void
.s1000:
430d : a2 06 __ LDX #$06
430f : b5 53 __ LDA T0 + 0,x 
4311 : 9d 95 bf STA $bf95,x ; (bigfont + 126)
4314 : ca __ __ DEX
4315 : 10 f8 __ BPL $430f ; (vdcwin_printwrap.s1000 + 2)
4317 : 38 __ __ SEC
4318 : a5 23 __ LDA SP + 0 
431a : e9 06 __ SBC #$06
431c : 85 23 __ STA SP + 0 
431e : b0 02 __ BCS $4322 ; (vdcwin_printwrap.s0 + 0)
4320 : c6 24 __ DEC SP + 1 
.s0:
4322 : ad fe bf LDA $bffe ; (sstack + 7)
4325 : 85 0d __ STA P0 
4327 : ad ff bf LDA $bfff ; (sstack + 8)
432a : 85 0e __ STA P1 
432c : 20 3c 2f JSR $2f3c ; (strlen.s0 + 0)
432f : a5 1b __ LDA ACCU + 0 
4331 : f0 3b __ BEQ $436e ; (vdcwin_printwrap.s1001 + 0)
.s30:
4333 : 85 53 __ STA T0 + 0 
4335 : a9 00 __ LDA #$00
4337 : 85 57 __ STA T3 + 0 
4339 : 85 45 __ STA T6 + 0 
433b : a9 ff __ LDA #$ff
433d : 85 59 __ STA T4 + 1 
433f : 85 44 __ STA T5 + 1 
4341 : ad fc bf LDA $bffc ; (sstack + 5)
4344 : 85 55 __ STA T2 + 0 
4346 : ad fd bf LDA $bffd ; (sstack + 6)
4349 : 85 56 __ STA T2 + 1 
434b : a0 02 __ LDY #$02
434d : b1 55 __ LDA (T2 + 0),y 
434f : 85 54 __ STA T1 + 0 
.l4:
4351 : a5 57 __ LDA T3 + 0 
4353 : c5 53 __ CMP T0 + 0 
4355 : b0 0d __ BCS $4364 ; (vdcwin_printwrap.s7 + 0)
.l9:
4357 : 24 44 __ BIT T5 + 1 
4359 : 10 09 __ BPL $4364 ; (vdcwin_printwrap.s7 + 0)
.s8:
435b : a5 45 __ LDA T6 + 0 
435d : c9 50 __ CMP #$50
435f : b0 03 __ BCS $4364 ; (vdcwin_printwrap.s7 + 0)
4361 : 4c 65 44 JMP $4465 ; (vdcwin_printwrap.s6 + 0)
.s7:
4364 : a6 45 __ LDX T6 + 0 
4366 : d0 1c __ BNE $4384 ; (vdcwin_printwrap.s19 + 0)
.s1:
4368 : a5 57 __ LDA T3 + 0 
436a : c5 53 __ CMP T0 + 0 
436c : 90 e9 __ BCC $4357 ; (vdcwin_printwrap.l9 + 0)
.s1001:
436e : 18 __ __ CLC
436f : a5 23 __ LDA SP + 0 
4371 : 69 06 __ ADC #$06
4373 : 85 23 __ STA SP + 0 
4375 : 90 02 __ BCC $4379 ; (vdcwin_printwrap.s1001 + 11)
4377 : e6 24 __ INC SP + 1 
4379 : a2 06 __ LDX #$06
437b : bd 95 bf LDA $bf95,x ; (bigfont + 126)
437e : 95 53 __ STA T0 + 0,x 
4380 : ca __ __ DEX
4381 : 10 f8 __ BPL $437b ; (vdcwin_printwrap.s1001 + 13)
4383 : 60 __ __ RTS
.s19:
4384 : a9 00 __ LDA #$00
4386 : 9d 9d bf STA $bf9d,x ; (bigfont + 134)
4389 : a9 9d __ LDA #$9d
438b : 85 0d __ STA P0 
438d : a9 bf __ LDA #$bf
438f : 85 0e __ STA P1 
4391 : 20 3c 2f JSR $2f3c ; (strlen.s0 + 0)
4394 : ad fc bf LDA $bffc ; (sstack + 5)
4397 : 85 58 __ STA T4 + 0 
4399 : ad fd bf LDA $bffd ; (sstack + 6)
439c : 85 59 __ STA T4 + 1 
.l22:
439e : a0 02 __ LDY #$02
43a0 : b1 58 __ LDA (T4 + 0),y 
43a2 : c5 1b __ CMP ACCU + 0 
43a4 : 90 54 __ BCC $43fa ; (vdcwin_printwrap.s23 + 0)
.s24:
43a6 : a0 04 __ LDY #$04
43a8 : b1 58 __ LDA (T4 + 0),y 
43aa : 18 __ __ CLC
43ab : 65 1b __ ADC ACCU + 0 
43ad : b0 06 __ BCS $43b5 ; (vdcwin_printwrap.s25 + 0)
.s1010:
43af : c5 54 __ CMP T1 + 0 
43b1 : 90 1a __ BCC $43cd ; (vdcwin_printwrap.s27 + 0)
.s1018:
43b3 : f0 18 __ BEQ $43cd ; (vdcwin_printwrap.s27 + 0)
.s25:
43b5 : a5 58 __ LDA T4 + 0 
43b7 : a0 02 __ LDY #$02
43b9 : 91 23 __ STA (SP + 0),y 
43bb : a5 59 __ LDA T4 + 1 
43bd : c8 __ __ INY
43be : 91 23 __ STA (SP + 0),y 
43c0 : a9 ff __ LDA #$ff
43c2 : c8 __ __ INY
43c3 : 91 23 __ STA (SP + 0),y 
43c5 : a9 2f __ LDA #$2f
43c7 : c8 __ __ INY
43c8 : 91 23 __ STA (SP + 0),y 
43ca : 20 91 44 JSR $4491 ; (vdcwin_printline.s1000 + 0)
.s27:
43cd : ad fc bf LDA $bffc ; (sstack + 5)
43d0 : a0 02 __ LDY #$02
43d2 : 91 23 __ STA (SP + 0),y 
43d4 : ad fd bf LDA $bffd ; (sstack + 6)
43d7 : c8 __ __ INY
43d8 : 91 23 __ STA (SP + 0),y 
43da : a9 9d __ LDA #$9d
43dc : c8 __ __ INY
43dd : 91 23 __ STA (SP + 0),y 
43df : a9 bf __ LDA #$bf
43e1 : c8 __ __ INY
43e2 : 91 23 __ STA (SP + 0),y 
43e4 : 20 39 45 JSR $4539 ; (vdcwin_put_string.s1000 + 0)
43e7 : a5 57 __ LDA T3 + 0 
43e9 : c5 53 __ CMP T0 + 0 
43eb : b0 81 __ BCS $436e ; (vdcwin_printwrap.s1001 + 0)
.s49:
43ed : a9 00 __ LDA #$00
43ef : 85 45 __ STA T6 + 0 
43f1 : a9 ff __ LDA #$ff
43f3 : 85 44 __ STA T5 + 1 
43f5 : 85 59 __ STA T4 + 1 
43f7 : 4c 51 43 JMP $4351 ; (vdcwin_printwrap.l4 + 0)
.s23:
43fa : a5 58 __ LDA T4 + 0 
43fc : 91 23 __ STA (SP + 0),y 
43fe : a5 59 __ LDA T4 + 1 
4400 : c8 __ __ INY
4401 : 91 23 __ STA (SP + 0),y 
4403 : a9 ff __ LDA #$ff
4405 : c8 __ __ INY
4406 : 91 23 __ STA (SP + 0),y 
4408 : a9 2f __ LDA #$2f
440a : c8 __ __ INY
440b : 91 23 __ STA (SP + 0),y 
440d : 20 91 44 JSR $4491 ; (vdcwin_printline.s1000 + 0)
4410 : ad fc bf LDA $bffc ; (sstack + 5)
4413 : 85 55 __ STA T2 + 0 
4415 : 8d f7 bf STA $bff7 ; (sstack + 0)
4418 : ad fd bf LDA $bffd ; (sstack + 6)
441b : 85 56 __ STA T2 + 1 
441d : 8d f8 bf STA $bff8 ; (sstack + 1)
4420 : a0 02 __ LDY #$02
4422 : b1 55 __ LDA (T2 + 0),y 
4424 : 8d fb bf STA $bffb ; (sstack + 4)
4427 : a9 9d __ LDA #$9d
4429 : 8d f9 bf STA $bff9 ; (sstack + 2)
442c : a9 bf __ LDA #$bf
442e : 8d fa bf STA $bffa ; (sstack + 3)
4431 : 20 39 47 JSR $4739 ; (vdcwin_put_chars.s1000 + 0)
4434 : a9 9d __ LDA #$9d
4436 : 85 0d __ STA P0 
4438 : a9 bf __ LDA #$bf
443a : 85 0e __ STA P1 
443c : ad fc bf LDA $bffc ; (sstack + 5)
443f : 85 43 __ STA T5 + 0 
4441 : ad fd bf LDA $bffd ; (sstack + 6)
4444 : 85 44 __ STA T5 + 1 
4446 : a0 02 __ LDY #$02
4448 : b1 43 __ LDA (T5 + 0),y 
444a : 18 __ __ CLC
444b : 69 9d __ ADC #$9d
444d : 85 43 __ STA T5 + 0 
444f : a9 bf __ LDA #$bf
4451 : 69 00 __ ADC #$00
4453 : 85 44 __ STA T5 + 1 
4455 : a0 ff __ LDY #$ff
.l1012:
4457 : c8 __ __ INY
4458 : b1 43 __ LDA (T5 + 0),y 
445a : 99 9d bf STA $bf9d,y ; (bigfont + 134)
445d : d0 f8 __ BNE $4457 ; (vdcwin_printwrap.l1012 + 0)
.s1013:
445f : 20 3c 2f JSR $2f3c ; (strlen.s0 + 0)
4462 : 4c 9e 43 JMP $439e ; (vdcwin_printwrap.l22 + 0)
.s6:
4465 : ad fe bf LDA $bffe ; (sstack + 7)
4468 : 85 49 __ STA T9 + 0 
446a : ad ff bf LDA $bfff ; (sstack + 8)
446d : 85 4a __ STA T9 + 1 
446f : a4 57 __ LDY T3 + 0 
4471 : b1 49 __ LDA (T9 + 0),y 
4473 : a6 45 __ LDX T6 + 0 
4475 : 9d 9d bf STA $bf9d,x ; (bigfont + 134)
4478 : c9 20 __ CMP #$20
447a : d0 06 __ BNE $4482 ; (vdcwin_printwrap.s10 + 0)
.s16:
447c : a9 00 __ LDA #$00
447e : 85 44 __ STA T5 + 1 
4480 : f0 08 __ BEQ $448a ; (vdcwin_printwrap.s53 + 0)
.s10:
4482 : 24 59 __ BIT T4 + 1 
4484 : 10 04 __ BPL $448a ; (vdcwin_printwrap.s53 + 0)
.s13:
4486 : a9 00 __ LDA #$00
4488 : 85 59 __ STA T4 + 1 
.s53:
448a : e6 57 __ INC T3 + 0 
448c : e6 45 __ INC T6 + 0 
448e : 4c 51 43 JMP $4351 ; (vdcwin_printwrap.l4 + 0)
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
4491 : a5 53 __ LDA T0 + 0 
4493 : 8d f3 bf STA $bff3 ; (buffer + 12)
4496 : a5 54 __ LDA T0 + 1 
4498 : 8d f4 bf STA $bff4 ; (buffer + 13)
449b : a5 55 __ LDA T1 + 0 
449d : 8d f5 bf STA $bff5 ; (buffer + 14)
44a0 : 38 __ __ SEC
44a1 : a5 23 __ LDA SP + 0 
44a3 : e9 06 __ SBC #$06
44a5 : 85 23 __ STA SP + 0 
44a7 : b0 02 __ BCS $44ab ; (vdcwin_printline.s0 + 0)
44a9 : c6 24 __ DEC SP + 1 
.s0:
44ab : a0 08 __ LDY #$08
44ad : b1 23 __ LDA (SP + 0),y 
44af : 85 53 __ STA T0 + 0 
44b1 : a0 02 __ LDY #$02
44b3 : 91 23 __ STA (SP + 0),y 
44b5 : a0 09 __ LDY #$09
44b7 : b1 23 __ LDA (SP + 0),y 
44b9 : 85 54 __ STA T0 + 1 
44bb : a0 03 __ LDY #$03
44bd : 91 23 __ STA (SP + 0),y 
44bf : a0 0a __ LDY #$0a
44c1 : b1 23 __ LDA (SP + 0),y 
44c3 : a0 04 __ LDY #$04
44c5 : 91 23 __ STA (SP + 0),y 
44c7 : a0 0b __ LDY #$0b
44c9 : b1 23 __ LDA (SP + 0),y 
44cb : a0 05 __ LDY #$05
44cd : 91 23 __ STA (SP + 0),y 
44cf : 20 39 45 JSR $4539 ; (vdcwin_put_string.s1000 + 0)
44d2 : a9 00 __ LDA #$00
44d4 : a0 04 __ LDY #$04
44d6 : 91 53 __ STA (T0 + 0),y 
44d8 : 88 __ __ DEY
44d9 : b1 53 __ LDA (T0 + 0),y 
44db : 85 55 __ STA T1 + 0 
44dd : 38 __ __ SEC
44de : e9 01 __ SBC #$01
44e0 : 85 44 __ STA T3 + 0 
44e2 : a0 05 __ LDY #$05
44e4 : b1 53 __ LDA (T0 + 0),y 
44e6 : 90 0b __ BCC $44f3 ; (vdcwin_printline.s2 + 0)
.s1002:
44e8 : aa __ __ TAX
44e9 : e4 44 __ CPX T3 + 0 
44eb : b0 06 __ BCS $44f3 ; (vdcwin_printline.s2 + 0)
.s1:
44ed : e8 __ __ INX
44ee : 8a __ __ TXA
44ef : 91 53 __ STA (T0 + 0),y 
44f1 : 90 2b __ BCC $451e ; (vdcwin_printline.s1001 + 0)
.s2:
44f3 : a5 53 __ LDA T0 + 0 
44f5 : 85 15 __ STA P8 
44f7 : a5 54 __ LDA T0 + 1 
44f9 : 85 16 __ STA P9 
44fb : 20 e9 45 JSR $45e9 ; (vdcwin_scroll_up.s0 + 0)
44fe : a9 20 __ LDA #$20
4500 : 85 11 __ STA P4 
4502 : a0 00 __ LDY #$00
4504 : b1 15 __ LDA (P8),y 
4506 : 85 0f __ STA P2 ; (str + 0)
4508 : a0 02 __ LDY #$02
450a : b1 15 __ LDA (P8),y 
450c : 85 13 __ STA P6 
450e : 88 __ __ DEY
450f : 84 15 __ STY P8 
4511 : b1 53 __ LDA (T0 + 0),y 
4513 : 18 __ __ CLC
4514 : 65 55 __ ADC T1 + 0 
4516 : 38 __ __ SEC
4517 : e9 01 __ SBC #$01
4519 : 85 14 __ STA P7 
451b : 20 54 21 JSR $2154 ; (vdc_clear.s0 + 0)
.s1001:
451e : 18 __ __ CLC
451f : a5 23 __ LDA SP + 0 
4521 : 69 06 __ ADC #$06
4523 : 85 23 __ STA SP + 0 
4525 : 90 02 __ BCC $4529 ; (vdcwin_printline.s1001 + 11)
4527 : e6 24 __ INC SP + 1 
4529 : ad f3 bf LDA $bff3 ; (buffer + 12)
452c : 85 53 __ STA T0 + 0 
452e : ad f4 bf LDA $bff4 ; (buffer + 13)
4531 : 85 54 __ STA T0 + 1 
4533 : ad f5 bf LDA $bff5 ; (buffer + 14)
4536 : 85 55 __ STA T1 + 0 
4538 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->void
.s1000:
4539 : 38 __ __ SEC
453a : a5 23 __ LDA SP + 0 
453c : e9 0b __ SBC #$0b
453e : 85 23 __ STA SP + 0 
4540 : b0 02 __ BCS $4544 ; (vdcwin_put_string.s0 + 0)
4542 : c6 24 __ DEC SP + 1 
.s0:
4544 : a0 0d __ LDY #$0d
4546 : b1 23 __ LDA (SP + 0),y 
4548 : 85 11 __ STA P4 
454a : c8 __ __ INY
454b : b1 23 __ LDA (SP + 0),y 
454d : 85 12 __ STA P5 
454f : a0 04 __ LDY #$04
4551 : b1 11 __ LDA (P4),y 
4553 : 85 13 __ STA P6 
4555 : c8 __ __ INY
4556 : b1 11 __ LDA (P4),y 
4558 : 85 14 __ STA P7 
455a : a0 0f __ LDY #$0f
455c : b1 23 __ LDA (SP + 0),y 
455e : 85 15 __ STA P8 
4560 : c8 __ __ INY
4561 : b1 23 __ LDA (SP + 0),y 
4563 : 85 16 __ STA P9 
4565 : 20 b4 45 JSR $45b4 ; (vdcwin_putat_string.s0 + 0)
4568 : 18 __ __ CLC
4569 : a5 1b __ LDA ACCU + 0 
456b : 65 13 __ ADC P6 
456d : a0 04 __ LDY #$04
456f : 91 11 __ STA (P4),y 
4571 : a0 02 __ LDY #$02
4573 : d1 11 __ CMP (P4),y 
4575 : 90 31 __ BCC $45a8 ; (vdcwin_put_string.s1001 + 0)
.s1:
4577 : a9 00 __ LDA #$00
4579 : a0 04 __ LDY #$04
457b : 91 11 __ STA (P4),y 
457d : a5 14 __ LDA P7 
457f : 69 00 __ ADC #$00
4581 : c8 __ __ INY
4582 : 91 11 __ STA (P4),y 
4584 : a0 03 __ LDY #$03
4586 : d1 11 __ CMP (P4),y 
4588 : d0 1e __ BNE $45a8 ; (vdcwin_put_string.s1001 + 0)
.s4:
458a : a5 14 __ LDA P7 
458c : a0 05 __ LDY #$05
458e : 91 11 __ STA (P4),y 
4590 : a5 11 __ LDA P4 
4592 : a0 02 __ LDY #$02
4594 : 91 23 __ STA (SP + 0),y 
4596 : a5 12 __ LDA P5 
4598 : c8 __ __ INY
4599 : 91 23 __ STA (SP + 0),y 
459b : a9 ff __ LDA #$ff
459d : c8 __ __ INY
459e : 91 23 __ STA (SP + 0),y 
45a0 : a9 2f __ LDA #$2f
45a2 : c8 __ __ INY
45a3 : 91 23 __ STA (SP + 0),y 
45a5 : 20 91 44 JSR $4491 ; (vdcwin_printline.s1000 + 0)
.s1001:
45a8 : 18 __ __ CLC
45a9 : a5 23 __ LDA SP + 0 
45ab : 69 0b __ ADC #$0b
45ad : 85 23 __ STA SP + 0 
45af : 90 02 __ BCC $45b3 ; (vdcwin_put_string.s1001 + 11)
45b1 : e6 24 __ INC SP + 1 
45b3 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_string: ; vdcwin_putat_string(struct VDCWin*,u8,u8,const u8*)->u8
.s0:
45b4 : a9 00 __ LDA #$00
45b6 : 85 43 __ STA T0 + 0 
45b8 : f0 26 __ BEQ $45e0 ; (vdcwin_putat_string.l1 + 0)
.s2:
45ba : 4a __ __ LSR
45bb : 4a __ __ LSR
45bc : 4a __ __ LSR
45bd : 4a __ __ LSR
45be : 4a __ __ LSR
45bf : aa __ __ TAX
45c0 : bd f6 67 LDA $67f6,x ; (p2smap + 0)
45c3 : 51 15 __ EOR (P8),y ; (str + 0)
45c5 : 85 0f __ STA P2 
45c7 : a5 13 __ LDA P6 ; (x + 0)
45c9 : 18 __ __ CLC
45ca : a0 00 __ LDY #$00
45cc : 71 11 __ ADC (P4),y ; (win + 0)
45ce : 18 __ __ CLC
45cf : 65 43 __ ADC T0 + 0 
45d1 : 85 0d __ STA P0 
45d3 : a5 14 __ LDA P7 ; (y + 0)
45d5 : 18 __ __ CLC
45d6 : c8 __ __ INY
45d7 : 71 11 __ ADC (P4),y ; (win + 0)
45d9 : 85 0e __ STA P1 
45db : 20 2f 35 JSR $352f ; (vdc_printc@proxy + 0)
45de : e6 43 __ INC T0 + 0 
.l1:
45e0 : a4 43 __ LDY T0 + 0 
45e2 : b1 15 __ LDA (P8),y ; (str + 0)
45e4 : d0 d4 __ BNE $45ba ; (vdcwin_putat_string.s2 + 0)
.s3:
45e6 : 84 1b __ STY ACCU + 0 
.s1001:
45e8 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_up: ; vdcwin_scroll_up(struct VDCWin*,u8)->void
.s0:
45e9 : a9 00 __ LDA #$00
45eb : 85 46 __ STA T0 + 0 
45ed : a0 02 __ LDY #$02
45ef : b1 15 __ LDA (P8),y ; (win + 0)
45f1 : 85 47 __ STA T2 + 0 
45f3 : a0 06 __ LDY #$06
45f5 : b1 15 __ LDA (P8),y ; (win + 0)
45f7 : 85 48 __ STA T3 + 0 
45f9 : c8 __ __ INY
45fa : b1 15 __ LDA (P8),y ; (win + 0)
45fc : 85 49 __ STA T3 + 1 
45fe : c8 __ __ INY
45ff : b1 15 __ LDA (P8),y ; (win + 0)
4601 : 85 4a __ STA T4 + 0 
4603 : c8 __ __ INY
4604 : b1 15 __ LDA (P8),y ; (win + 0)
4606 : 85 4b __ STA T4 + 1 
4608 : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
460b : 85 4c __ STA T5 + 0 
460d : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
4610 : 85 4d __ STA T5 + 1 
4612 : 4c 5d 46 JMP $465d ; (vdcwin_scroll_up.l1 + 0)
.s2:
4615 : a5 48 __ LDA T3 + 0 
4617 : 85 0f __ STA P2 
4619 : 18 __ __ CLC
461a : 65 4c __ ADC T5 + 0 
461c : 85 11 __ STA P4 
461e : a5 49 __ LDA T3 + 1 
4620 : 85 10 __ STA P3 
4622 : 65 4d __ ADC T5 + 1 
4624 : 85 12 __ STA P5 
4626 : 20 6d 46 JSR $466d ; (vdc_block_copy@proxy + 0)
4629 : a5 4a __ LDA T4 + 0 
462b : 85 0f __ STA P2 
462d : 18 __ __ CLC
462e : 65 4c __ ADC T5 + 0 
4630 : 85 11 __ STA P4 
4632 : a5 4b __ LDA T4 + 1 
4634 : 85 10 __ STA P3 
4636 : 65 4d __ ADC T5 + 1 
4638 : 85 12 __ STA P5 
463a : 20 75 46 JSR $4675 ; (vdc_block_copy.s0 + 0)
463d : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
4640 : 18 __ __ CLC
4641 : 65 48 __ ADC T3 + 0 
4643 : 85 48 __ STA T3 + 0 
4645 : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
4648 : 65 49 __ ADC T3 + 1 
464a : 85 49 __ STA T3 + 1 
464c : 18 __ __ CLC
464d : a5 4a __ LDA T4 + 0 
464f : 6d e7 6c ADC $6ce7 ; (vdc_state + 3)
4652 : 85 4a __ STA T4 + 0 
4654 : a5 4b __ LDA T4 + 1 
4656 : 6d e8 6c ADC $6ce8 ; (vdc_state + 4)
4659 : 85 4b __ STA T4 + 1 
465b : e6 46 __ INC T0 + 0 
.l1:
465d : a0 03 __ LDY #$03
465f : b1 15 __ LDA (P8),y ; (win + 0)
4661 : 38 __ __ SEC
4662 : e9 01 __ SBC #$01
4664 : 90 af __ BCC $4615 ; (vdcwin_scroll_up.s2 + 0)
.s1002:
4666 : c5 46 __ CMP T0 + 0 
4668 : 90 02 __ BCC $466c ; (vdcwin_scroll_up.s1001 + 0)
.s1004:
466a : d0 a9 __ BNE $4615 ; (vdcwin_scroll_up.s2 + 0)
.s1001:
466c : 60 __ __ RTS
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
466d : a5 47 __ LDA $47 
466f : 85 13 __ STA P6 
4671 : a9 00 __ LDA #$00
4673 : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_block_copy: ; vdc_block_copy(u16,u16,u16)->void
.s0:
4675 : a5 14 __ LDA P7 ; (length + 1)
4677 : d0 52 __ BNE $46cb ; (vdc_block_copy.s73 + 0)
.s4:
4679 : 20 26 22 JSR $2226 ; (vdc_mem_addr@proxy + 0)
467c : a9 18 __ LDA #$18
467e : 8d 00 d6 STA $d600 
.l332:
4681 : 2c 00 d6 BIT $d600 
4684 : 10 fb __ BPL $4681 ; (vdc_block_copy.l332 + 0)
.s40:
4686 : ad 01 d6 LDA $d601 
4689 : 09 80 __ ORA #$80
468b : a2 18 __ LDX #$18
468d : 8e 00 d6 STX $d600 
.l334:
4690 : 2c 00 d6 BIT $d600 
4693 : 10 fb __ BPL $4690 ; (vdc_block_copy.l334 + 0)
.s46:
4695 : 8d 01 d6 STA $d601 
4698 : a9 20 __ LDA #$20
469a : 8d 00 d6 STA $d600 
.l336:
469d : 2c 00 d6 BIT $d600 
46a0 : 10 fb __ BPL $469d ; (vdc_block_copy.l336 + 0)
.s51:
46a2 : a5 12 __ LDA P5 ; (src + 1)
46a4 : 8d 01 d6 STA $d601 
46a7 : a9 21 __ LDA #$21
46a9 : 8d 00 d6 STA $d600 
.l338:
46ac : 2c 00 d6 BIT $d600 
46af : 10 fb __ BPL $46ac ; (vdc_block_copy.l338 + 0)
.s56:
46b1 : a5 11 __ LDA P4 ; (src + 0)
46b3 : 8d 01 d6 STA $d601 
46b6 : a9 1f __ LDA #$1f
46b8 : 8d 00 d6 STA $d600 
46bb : a9 1e __ LDA #$1e
46bd : 8d 00 d6 STA $d600 
.l340:
46c0 : 2c 00 d6 BIT $d600 
46c3 : 10 fb __ BPL $46c0 ; (vdc_block_copy.l340 + 0)
.s62:
46c5 : a5 13 __ LDA P6 ; (length + 0)
46c7 : 8d 01 d6 STA $d601 
.s1001:
46ca : 60 __ __ RTS
.s73:
46cb : 85 45 __ STA T2 + 0 
46cd : a5 10 __ LDA P3 ; (dest + 1)
46cf : 85 44 __ STA T0 + 1 
46d1 : a5 0f __ LDA P2 ; (dest + 0)
46d3 : 85 0d __ STA P0 
.l2:
46d5 : 20 be 67 JSR $67be ; (vdc_mem_addr@proxy + 0)
46d8 : a9 18 __ LDA #$18
46da : 8d 00 d6 STA $d600 
.l321:
46dd : 2c 00 d6 BIT $d600 
46e0 : 10 fb __ BPL $46dd ; (vdc_block_copy.l321 + 0)
.s11:
46e2 : ad 01 d6 LDA $d601 
46e5 : 09 80 __ ORA #$80
46e7 : a2 18 __ LDX #$18
46e9 : 8e 00 d6 STX $d600 
.l323:
46ec : 2c 00 d6 BIT $d600 
46ef : 10 fb __ BPL $46ec ; (vdc_block_copy.l323 + 0)
.s17:
46f1 : 8d 01 d6 STA $d601 
46f4 : a9 20 __ LDA #$20
46f6 : 8d 00 d6 STA $d600 
.l325:
46f9 : 2c 00 d6 BIT $d600 
46fc : 10 fb __ BPL $46f9 ; (vdc_block_copy.l325 + 0)
.s22:
46fe : a5 12 __ LDA P5 ; (src + 1)
4700 : 8d 01 d6 STA $d601 
4703 : a9 21 __ LDA #$21
4705 : 8d 00 d6 STA $d600 
.l327:
4708 : 2c 00 d6 BIT $d600 
470b : 10 fb __ BPL $4708 ; (vdc_block_copy.l327 + 0)
.s27:
470d : a5 11 __ LDA P4 ; (src + 0)
470f : 8d 01 d6 STA $d601 
4712 : a9 1f __ LDA #$1f
4714 : 8d 00 d6 STA $d600 
4717 : a9 1e __ LDA #$1e
4719 : 8d 00 d6 STA $d600 
.l329:
471c : 2c 00 d6 BIT $d600 
471f : 10 fb __ BPL $471c ; (vdc_block_copy.l329 + 0)
.s33:
4721 : a9 ff __ LDA #$ff
4723 : 8d 01 d6 STA $d601 
4726 : e6 12 __ INC P5 ; (src + 1)
4728 : e6 44 __ INC T0 + 1 
472a : c6 45 __ DEC T2 + 0 
472c : d0 a7 __ BNE $46d5 ; (vdc_block_copy.l2 + 0)
.s145:
472e : a5 0d __ LDA P0 
4730 : 85 0f __ STA P2 ; (dest + 0)
4732 : a5 44 __ LDA T0 + 1 
4734 : 85 10 __ STA P3 ; (dest + 1)
4736 : 4c 79 46 JMP $4679 ; (vdc_block_copy.s4 + 0)
--------------------------------------------------------------------
vdcwin_put_chars: ; vdcwin_put_chars(struct VDCWin*,const u8*,u8)->void
.s1000:
4739 : a5 53 __ LDA T0 + 0 
473b : 8d ee bf STA $bfee ; (vp_fill + 29)
473e : a5 54 __ LDA T0 + 1 
4740 : 8d ef bf STA $bfef ; (vp_fill + 30)
4743 : 38 __ __ SEC
4744 : a5 23 __ LDA SP + 0 
4746 : e9 06 __ SBC #$06
4748 : 85 23 __ STA SP + 0 
474a : b0 02 __ BCS $474e ; (vdcwin_put_chars.s0 + 0)
474c : c6 24 __ DEC SP + 1 
.s0:
474e : ad f7 bf LDA $bff7 ; (sstack + 0)
4751 : 85 53 __ STA T0 + 0 
4753 : 85 11 __ STA P4 
4755 : ad f8 bf LDA $bff8 ; (sstack + 1)
4758 : 85 54 __ STA T0 + 1 
475a : 85 12 __ STA P5 
475c : a0 04 __ LDY #$04
475e : b1 53 __ LDA (T0 + 0),y 
4760 : 85 13 __ STA P6 
4762 : c8 __ __ INY
4763 : b1 53 __ LDA (T0 + 0),y 
4765 : 85 14 __ STA P7 
4767 : ad f9 bf LDA $bff9 ; (sstack + 2)
476a : 85 15 __ STA P8 
476c : ad fa bf LDA $bffa ; (sstack + 3)
476f : 85 16 __ STA P9 
4771 : ad fb bf LDA $bffb ; (sstack + 4)
4774 : 85 17 __ STA P10 
4776 : 20 cf 47 JSR $47cf ; (vdcwin_putat_chars.s0 + 0)
4779 : 18 __ __ CLC
477a : a5 17 __ LDA P10 
477c : 65 13 __ ADC P6 
477e : a0 04 __ LDY #$04
4780 : 91 53 __ STA (T0 + 0),y 
4782 : a0 02 __ LDY #$02
4784 : d1 53 __ CMP (T0 + 0),y 
4786 : 90 31 __ BCC $47b9 ; (vdcwin_put_chars.s1001 + 0)
.s1:
4788 : a9 00 __ LDA #$00
478a : a0 04 __ LDY #$04
478c : 91 53 __ STA (T0 + 0),y 
478e : a5 14 __ LDA P7 
4790 : 69 00 __ ADC #$00
4792 : c8 __ __ INY
4793 : 91 53 __ STA (T0 + 0),y 
4795 : a0 03 __ LDY #$03
4797 : d1 53 __ CMP (T0 + 0),y 
4799 : d0 1e __ BNE $47b9 ; (vdcwin_put_chars.s1001 + 0)
.s4:
479b : a5 14 __ LDA P7 
479d : a0 05 __ LDY #$05
479f : 91 53 __ STA (T0 + 0),y 
47a1 : a5 53 __ LDA T0 + 0 
47a3 : a0 02 __ LDY #$02
47a5 : 91 23 __ STA (SP + 0),y 
47a7 : a5 54 __ LDA T0 + 1 
47a9 : c8 __ __ INY
47aa : 91 23 __ STA (SP + 0),y 
47ac : a9 ff __ LDA #$ff
47ae : c8 __ __ INY
47af : 91 23 __ STA (SP + 0),y 
47b1 : a9 2f __ LDA #$2f
47b3 : c8 __ __ INY
47b4 : 91 23 __ STA (SP + 0),y 
47b6 : 20 91 44 JSR $4491 ; (vdcwin_printline.s1000 + 0)
.s1001:
47b9 : 18 __ __ CLC
47ba : a5 23 __ LDA SP + 0 
47bc : 69 06 __ ADC #$06
47be : 85 23 __ STA SP + 0 
47c0 : 90 02 __ BCC $47c4 ; (vdcwin_put_chars.s1001 + 11)
47c2 : e6 24 __ INC SP + 1 
47c4 : ad ee bf LDA $bfee ; (vp_fill + 29)
47c7 : 85 53 __ STA T0 + 0 
47c9 : ad ef bf LDA $bfef ; (vp_fill + 30)
47cc : 85 54 __ STA T0 + 1 
47ce : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_chars: ; vdcwin_putat_chars(struct VDCWin*,u8,u8,const u8*,u8)->void
.s0:
47cf : a5 17 __ LDA P10 ; (num + 0)
47d1 : f0 31 __ BEQ $4804 ; (vdcwin_putat_chars.s1001 + 0)
.s7:
47d3 : a0 00 __ LDY #$00
.l1004:
47d5 : 84 43 __ STY T1 + 0 
47d7 : b1 15 __ LDA (P8),y ; (chars + 0)
47d9 : 4a __ __ LSR
47da : 4a __ __ LSR
47db : 4a __ __ LSR
47dc : 4a __ __ LSR
47dd : 4a __ __ LSR
47de : aa __ __ TAX
47df : bd f6 67 LDA $67f6,x ; (p2smap + 0)
47e2 : 51 15 __ EOR (P8),y ; (chars + 0)
47e4 : 85 0f __ STA P2 
47e6 : a0 00 __ LDY #$00
47e8 : b1 11 __ LDA (P4),y ; (win + 0)
47ea : 18 __ __ CLC
47eb : 65 13 __ ADC P6 ; (x + 0)
47ed : 18 __ __ CLC
47ee : 65 43 __ ADC T1 + 0 
47f0 : 85 0d __ STA P0 
47f2 : c8 __ __ INY
47f3 : b1 11 __ LDA (P4),y ; (win + 0)
47f5 : 18 __ __ CLC
47f6 : 65 14 __ ADC P7 ; (y + 0)
47f8 : 85 0e __ STA P1 
47fa : 20 2f 35 JSR $352f ; (vdc_printc@proxy + 0)
47fd : a4 43 __ LDY T1 + 0 
47ff : c8 __ __ INY
4800 : c4 17 __ CPY P10 ; (num + 0)
4802 : 90 d1 __ BCC $47d5 ; (vdcwin_putat_chars.l1004 + 0)
.s1001:
4804 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_char: ; vdcwin_put_char(struct VDCWin*,u8)->void
.s1000:
4805 : 38 __ __ SEC
4806 : a5 23 __ LDA SP + 0 
4808 : e9 06 __ SBC #$06
480a : 85 23 __ STA SP + 0 
480c : b0 02 __ BCS $4810 ; (vdcwin_put_char.s0 + 0)
480e : c6 24 __ DEC SP + 1 
.s0:
4810 : a5 17 __ LDA P10 ; (win + 0)
4812 : 85 11 __ STA P4 
4814 : a5 18 __ LDA P11 ; (win + 1)
4816 : 85 12 __ STA P5 
4818 : a0 04 __ LDY #$04
481a : b1 17 __ LDA (P10),y ; (win + 0)
481c : 85 13 __ STA P6 
481e : c8 __ __ INY
481f : b1 17 __ LDA (P10),y ; (win + 0)
4821 : 85 14 __ STA P7 
4823 : ad f7 bf LDA $bff7 ; (sstack + 0)
4826 : 85 15 __ STA P8 
4828 : 20 0f 35 JSR $350f ; (vdcwin_putat_char.s0 + 0)
482b : a6 13 __ LDX P6 
482d : e8 __ __ INX
482e : 8a __ __ TXA
482f : a0 04 __ LDY #$04
4831 : 91 17 __ STA (P10),y ; (win + 0)
4833 : a0 02 __ LDY #$02
4835 : d1 17 __ CMP (P10),y ; (win + 0)
4837 : d0 32 __ BNE $486b ; (vdcwin_put_char.s1001 + 0)
.s1:
4839 : a9 00 __ LDA #$00
483b : a0 04 __ LDY #$04
483d : 91 17 __ STA (P10),y ; (win + 0)
483f : 18 __ __ CLC
4840 : a5 14 __ LDA P7 
4842 : 69 01 __ ADC #$01
4844 : c8 __ __ INY
4845 : 91 17 __ STA (P10),y ; (win + 0)
4847 : a0 03 __ LDY #$03
4849 : d1 17 __ CMP (P10),y ; (win + 0)
484b : d0 1e __ BNE $486b ; (vdcwin_put_char.s1001 + 0)
.s4:
484d : a5 14 __ LDA P7 
484f : a0 05 __ LDY #$05
4851 : 91 17 __ STA (P10),y ; (win + 0)
4853 : a5 17 __ LDA P10 ; (win + 0)
4855 : a0 02 __ LDY #$02
4857 : 91 23 __ STA (SP + 0),y 
4859 : a5 18 __ LDA P11 ; (win + 1)
485b : c8 __ __ INY
485c : 91 23 __ STA (SP + 0),y 
485e : a9 ff __ LDA #$ff
4860 : c8 __ __ INY
4861 : 91 23 __ STA (SP + 0),y 
4863 : a9 2f __ LDA #$2f
4865 : c8 __ __ INY
4866 : 91 23 __ STA (SP + 0),y 
4868 : 20 91 44 JSR $4491 ; (vdcwin_printline.s1000 + 0)
.s1001:
486b : 18 __ __ CLC
486c : a5 23 __ LDA SP + 0 
486e : 69 06 __ ADC #$06
4870 : 85 23 __ STA SP + 0 
4872 : 90 02 __ BCC $4876 ; (vdcwin_put_char.s1001 + 11)
4874 : e6 24 __ INC SP + 1 
4876 : 60 __ __ RTS
--------------------------------------------------------------------
windows_textinput: ; windows_textinput()->void
.s1000:
4877 : a2 04 __ LDX #$04
4879 : b5 53 __ LDA T0 + 0,x 
487b : 9d 8f bf STA $bf8f,x ; (bigfont + 120)
487e : ca __ __ DEX
487f : 10 f8 __ BPL $4879 ; (windows_textinput.s1000 + 2)
4881 : 38 __ __ SEC
4882 : a5 23 __ LDA SP + 0 
4884 : e9 06 __ SBC #$06
4886 : 85 23 __ STA SP + 0 
4888 : b0 02 __ BCS $488c ; (windows_textinput.s0 + 0)
488a : c6 24 __ DEC SP + 1 
.s0:
488c : a9 f0 __ LDA #$f0
488e : 85 17 __ STA P10 
4890 : a9 05 __ LDA #$05
4892 : 85 18 __ STA P11 
4894 : a9 3c __ LDA #$3c
4896 : 8d f8 bf STA $bff8 ; (sstack + 1)
4899 : a9 0c __ LDA #$0c
489b : 8d f9 bf STA $bff9 ; (sstack + 2)
489e : a9 fb __ LDA #$fb
48a0 : 85 1b __ STA ACCU + 0 
48a2 : a9 00 __ LDA #$00
48a4 : 85 1c __ STA ACCU + 1 
48a6 : 20 a9 65 JSR $65a9 ; (malloc + 0)
48a9 : a5 1b __ LDA ACCU + 0 
48ab : 85 53 __ STA T0 + 0 
48ad : a5 1c __ LDA ACCU + 1 
48af : 85 54 __ STA T0 + 1 
48b1 : ad e9 6c LDA $6ce9 ; (vdc_state + 5)
48b4 : 85 55 __ STA T1 + 0 
48b6 : ad ea 6c LDA $6cea ; (vdc_state + 6)
48b9 : 4a __ __ LSR
48ba : 66 55 __ ROR T1 + 0 
48bc : 38 __ __ SEC
48bd : a5 55 __ LDA T1 + 0 
48bf : e9 06 __ SBC #$06
48c1 : 8d f7 bf STA $bff7 ; (sstack + 0)
48c4 : 20 bf 30 JSR $30bf ; (vdcwin_win_new.s1000 + 0)
48c7 : a9 01 __ LDA #$01
48c9 : 85 14 __ STA P7 
48cb : ad e1 6c LDA $6ce1 ; (winCfg + 5)
48ce : 85 1b __ STA ACCU + 0 
48d0 : a9 00 __ LDA #$00
48d2 : 85 13 __ STA P6 
48d4 : 85 1c __ STA ACCU + 1 
48d6 : a9 0d __ LDA #$0d
48d8 : 20 2c 64 JSR $642c ; (mul16by8 + 0)
48db : 18 __ __ CLC
48dc : a9 c9 __ LDA #$c9
48de : 65 05 __ ADC WORK + 2 
48e0 : 85 11 __ STA P4 
48e2 : a9 6d __ LDA #$6d
48e4 : 69 00 __ ADC #$00
48e6 : 85 12 __ STA P5 
48e8 : a9 51 __ LDA #$51
48ea : 85 15 __ STA P8 
48ec : a9 4a __ LDA #$4a
48ee : 85 16 __ STA P9 
48f0 : 20 b4 45 JSR $45b4 ; (vdcwin_putat_string.s0 + 0)
48f3 : a9 0a __ LDA #$0a
48f5 : 85 18 __ STA P11 
48f7 : a9 32 __ LDA #$32
48f9 : 8d f8 bf STA $bff8 ; (sstack + 1)
48fc : a9 05 __ LDA #$05
48fe : 8d f9 bf STA $bff9 ; (sstack + 2)
4901 : 38 __ __ SEC
4902 : a5 55 __ LDA T1 + 0 
4904 : e9 03 __ SBC #$03
4906 : 8d f7 bf STA $bff7 ; (sstack + 0)
4909 : 20 bf 30 JSR $30bf ; (vdcwin_win_new.s1000 + 0)
490c : ad e1 6c LDA $6ce1 ; (winCfg + 5)
490f : 85 1b __ STA ACCU + 0 
4911 : a9 00 __ LDA #$00
4913 : 85 1c __ STA ACCU + 1 
4915 : a9 0d __ LDA #$0d
4917 : 20 2c 64 JSR $642c ; (mul16by8 + 0)
491a : 18 __ __ CLC
491b : a9 c9 __ LDA #$c9
491d : 65 05 __ ADC WORK + 2 
491f : 8d fb bf STA $bffb ; (sstack + 4)
4922 : a9 6d __ LDA #$6d
4924 : 69 00 __ ADC #$00
4926 : 8d fc bf STA $bffc ; (sstack + 5)
4929 : 20 7f 4a JSR $4a7f ; (vdcwin_edit.s1000 + 0)
492c : a5 53 __ LDA T0 + 0 
492e : 85 12 __ STA P5 
4930 : a5 54 __ LDA T0 + 1 
4932 : 85 13 __ STA P6 
4934 : ad e1 6c LDA $6ce1 ; (winCfg + 5)
4937 : 85 1b __ STA ACCU + 0 
4939 : a9 00 __ LDA #$00
493b : 85 1c __ STA ACCU + 1 
493d : a9 0d __ LDA #$0d
493f : 20 2c 64 JSR $642c ; (mul16by8 + 0)
4942 : 18 __ __ CLC
4943 : a9 c9 __ LDA #$c9
4945 : 65 05 __ ADC WORK + 2 
4947 : 85 10 __ STA P3 
4949 : a9 6d __ LDA #$6d
494b : 69 00 __ ADC #$00
494d : 85 11 __ STA P4 
494f : 20 de 51 JSR $51de ; (vdcwin_get_rect.s0 + 0)
4952 : 20 e6 35 JSR $35e6 ; (vdcwin_win_free.s0 + 0)
4955 : a9 20 __ LDA #$20
4957 : 85 11 __ STA P4 
4959 : ae e1 6c LDX $6ce1 ; (winCfg + 5)
495c : bd 07 67 LDA $6707,x ; (__multab13L + 0)
495f : 85 55 __ STA T1 + 0 
4961 : 18 __ __ CLC
4962 : 69 c9 __ ADC #$c9
4964 : 85 56 __ STA T2 + 0 
4966 : a9 6d __ LDA #$6d
4968 : 69 00 __ ADC #$00
496a : 85 57 __ STA T2 + 1 
496c : bc 07 67 LDY $6707,x ; (__multab13L + 0)
496f : b9 c9 6d LDA $6dc9,y ; (krnio_pstatus + 6)
4972 : 85 0f __ STA P2 
4974 : a6 55 __ LDX T1 + 0 
4976 : bd ca 6d LDA $6dca,x ; (krnio_pstatus + 7)
4979 : 85 14 __ STA P7 
497b : bd cb 6d LDA $6dcb,x ; (krnio_pstatus + 8)
497e : 85 13 __ STA P6 
4980 : bd cc 6d LDA $6dcc,x ; (krnio_pstatus + 9)
4983 : 85 15 __ STA P8 
4985 : 20 54 21 JSR $2154 ; (vdc_clear.s0 + 0)
4988 : a5 56 __ LDA T2 + 0 
498a : 85 11 __ STA P4 
498c : a5 57 __ LDA T2 + 1 
498e : 85 12 __ STA P5 
4990 : a9 00 __ LDA #$00
4992 : 85 13 __ STA P6 
4994 : a9 01 __ LDA #$01
4996 : 85 14 __ STA P7 
4998 : a9 6d __ LDA #$6d
499a : 85 15 __ STA P8 
499c : a9 52 __ LDA #$52
499e : 85 16 __ STA P9 
49a0 : 20 b4 45 JSR $45b4 ; (vdcwin_putat_string.s0 + 0)
49a3 : a5 11 __ LDA P4 
49a5 : 8d fc bf STA $bffc ; (sstack + 5)
49a8 : a5 12 __ LDA P5 
49aa : 8d fd bf STA $bffd ; (sstack + 6)
49ad : a5 53 __ LDA T0 + 0 
49af : 8d fe bf STA $bffe ; (sstack + 7)
49b2 : a5 54 __ LDA T0 + 1 
49b4 : 8d ff bf STA $bfff ; (sstack + 8)
49b7 : a9 00 __ LDA #$00
49b9 : a6 55 __ LDX T1 + 0 
49bb : 9d cd 6d STA $6dcd,x ; (krnio_pstatus + 10)
49be : a9 03 __ LDA #$03
49c0 : 9d ce 6d STA $6dce,x ; (krnio_pstatus + 11)
49c3 : 20 0d 43 JSR $430d ; (vdcwin_printwrap.s1000 + 0)
49c6 : ad e1 6c LDA $6ce1 ; (winCfg + 5)
49c9 : 85 1b __ STA ACCU + 0 
49cb : a9 00 __ LDA #$00
49cd : 85 1c __ STA ACCU + 1 
49cf : a9 0d __ LDA #$0d
49d1 : 20 2c 64 JSR $642c ; (mul16by8 + 0)
49d4 : 18 __ __ CLC
49d5 : a9 c9 __ LDA #$c9
49d7 : 65 05 __ ADC WORK + 2 
49d9 : a0 02 __ LDY #$02
49db : 91 23 __ STA (SP + 0),y 
49dd : a9 6d __ LDA #$6d
49df : 69 00 __ ADC #$00
49e1 : c8 __ __ INY
49e2 : 91 23 __ STA (SP + 0),y 
49e4 : a9 ff __ LDA #$ff
49e6 : c8 __ __ INY
49e7 : 91 23 __ STA (SP + 0),y 
49e9 : a9 2f __ LDA #$2f
49eb : c8 __ __ INY
49ec : 91 23 __ STA (SP + 0),y 
49ee : 20 91 44 JSR $4491 ; (vdcwin_printline.s1000 + 0)
49f1 : ae e1 6c LDX $6ce1 ; (winCfg + 5)
49f4 : bd 07 67 LDA $6707,x ; (__multab13L + 0)
49f7 : 18 __ __ CLC
49f8 : 69 c9 __ ADC #$c9
49fa : a0 02 __ LDY #$02
49fc : 91 23 __ STA (SP + 0),y 
49fe : a9 6d __ LDA #$6d
4a00 : 69 00 __ ADC #$00
4a02 : c8 __ __ INY
4a03 : 91 23 __ STA (SP + 0),y 
4a05 : a9 cd __ LDA #$cd
4a07 : c8 __ __ INY
4a08 : 91 23 __ STA (SP + 0),y 
4a0a : a9 35 __ LDA #$35
4a0c : c8 __ __ INY
4a0d : 91 23 __ STA (SP + 0),y 
4a0f : bc 07 67 LDY $6707,x ; (__multab13L + 0)
4a12 : b9 ce 6d LDA $6dce,y ; (krnio_pstatus + 11)
4a15 : 18 __ __ CLC
4a16 : 69 01 __ ADC #$01
4a18 : b0 0d __ BCS $4a27 ; (windows_textinput.s4 + 0)
.s1002:
4a1a : d9 cc 6d CMP $6dcc,y ; (krnio_pstatus + 9)
4a1d : b0 08 __ BCS $4a27 ; (windows_textinput.s4 + 0)
.s5:
4a1f : be ce 6d LDX $6dce,y ; (krnio_pstatus + 11)
4a22 : e8 __ __ INX
4a23 : 8a __ __ TXA
4a24 : 99 ce 6d STA $6dce,y ; (krnio_pstatus + 11)
.s4:
4a27 : 20 39 45 JSR $4539 ; (vdcwin_put_string.s1000 + 0)
4a2a : 20 a4 29 JSR $29a4 ; (getch.s0 + 0)
4a2d : 20 e6 35 JSR $35e6 ; (vdcwin_win_free.s0 + 0)
4a30 : a5 53 __ LDA T0 + 0 
4a32 : 85 1b __ STA ACCU + 0 
4a34 : a5 54 __ LDA T0 + 1 
4a36 : 85 1c __ STA ACCU + 1 
4a38 : 20 68 66 JSR $6668 ; (free + 0)
.s1001:
4a3b : 18 __ __ CLC
4a3c : a5 23 __ LDA SP + 0 
4a3e : 69 06 __ ADC #$06
4a40 : 85 23 __ STA SP + 0 
4a42 : 90 02 __ BCC $4a46 ; (windows_textinput.s1001 + 11)
4a44 : e6 24 __ INC SP + 1 
4a46 : a2 04 __ LDX #$04
4a48 : bd 8f bf LDA $bf8f,x ; (bigfont + 120)
4a4b : 95 53 __ STA T0 + 0,x 
4a4d : ca __ __ DEX
4a4e : 10 f8 __ BPL $4a48 ; (windows_textinput.s1001 + 13)
4a50 : 60 __ __ RTS
--------------------------------------------------------------------
4a51 : __ __ __ BYT 74 52 59 20 54 45 58 54 20 45 4e 54 52 59 20 49 : tRY TEXT ENTRY I
4a61 : __ __ __ BYT 4e 20 57 49 4e 44 4f 57 2c 20 41 43 43 45 50 54 : N WINDOW, ACCEPT
4a71 : __ __ __ BYT 20 57 49 54 48 20 72 65 74 75 72 6e 2e 00       :  WITH return..
--------------------------------------------------------------------
vdcwin_edit: ; vdcwin_edit(struct VDCWin*)->void
.s1000:
4a7f : a5 53 __ LDA T0 + 0 
4a81 : 8d ec bf STA $bfec ; (wrapbuffer + 79)
4a84 : a5 54 __ LDA T0 + 1 
4a86 : 8d ed bf STA $bfed ; (wrapbuffer + 80)
4a89 : a5 55 __ LDA T1 + 0 
4a8b : 8d ee bf STA $bfee ; (vp_fill + 29)
.s0:
4a8e : ad fb bf LDA $bffb ; (sstack + 4)
4a91 : 85 53 __ STA T0 + 0 
4a93 : ad fc bf LDA $bffc ; (sstack + 5)
4a96 : 85 54 __ STA T0 + 1 
.l2:
4a98 : a5 53 __ LDA T0 + 0 
4a9a : 85 0d __ STA P0 
4a9c : a5 54 __ LDA T0 + 1 
4a9e : 85 0e __ STA P1 
4aa0 : a9 01 __ LDA #$01
4aa2 : 85 0f __ STA P2 
4aa4 : 20 d9 4a JSR $4ad9 ; (vdcwin_cursor_show.s0 + 0)
4aa7 : 20 d8 35 JSR $35d8 ; (vdcwin_getch.s0 + 0)
4aaa : a5 1b __ LDA ACCU + 0 
4aac : 85 55 __ STA T1 + 0 
4aae : c6 0f __ DEC P2 
4ab0 : 20 d9 4a JSR $4ad9 ; (vdcwin_cursor_show.s0 + 0)
4ab3 : a5 0d __ LDA P0 
4ab5 : 8d f8 bf STA $bff8 ; (sstack + 1)
4ab8 : a5 0e __ LDA P1 
4aba : 8d f9 bf STA $bff9 ; (sstack + 2)
4abd : a5 55 __ LDA T1 + 0 
4abf : 8d fa bf STA $bffa ; (sstack + 3)
4ac2 : 20 82 4b JSR $4b82 ; (vdcwin_edit_char.s1000 + 0)
4ac5 : a5 1b __ LDA ACCU + 0 
4ac7 : f0 cf __ BEQ $4a98 ; (vdcwin_edit.l2 + 0)
.s1001:
4ac9 : ad ec bf LDA $bfec ; (wrapbuffer + 79)
4acc : 85 53 __ STA T0 + 0 
4ace : ad ed bf LDA $bfed ; (wrapbuffer + 80)
4ad1 : 85 54 __ STA T0 + 1 
4ad3 : ad ee bf LDA $bfee ; (vp_fill + 29)
4ad6 : 85 55 __ STA T1 + 0 
4ad8 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_cursor_show: ; vdcwin_cursor_show(struct VDCWin*,bool)->void
.s0:
4ad9 : a0 01 __ LDY #$01
4adb : b1 0d __ LDA (P0),y ; (win + 0)
4add : 18 __ __ CLC
4ade : a0 05 __ LDY #$05
4ae0 : 71 0d __ ADC (P0),y ; (win + 0)
4ae2 : 0a __ __ ASL
4ae3 : aa __ __ TAX
4ae4 : 18 __ __ CLC
4ae5 : 88 __ __ DEY
4ae6 : b1 0d __ LDA (P0),y ; (win + 0)
4ae8 : a0 00 __ LDY #$00
4aea : 71 0d __ ADC (P0),y ; (win + 0)
4aec : 18 __ __ CLC
4aed : 7d 00 6e ADC $6e00,x ; (multab + 0)
4af0 : a8 __ __ TAY
4af1 : a9 00 __ LDA #$00
4af3 : 7d 01 6e ADC $6e01,x ; (multab + 1)
4af6 : a2 12 __ LDX #$12
4af8 : 8e 00 d6 STX $d600 
4afb : aa __ __ TAX
4afc : 98 __ __ TYA
4afd : 18 __ __ CLC
4afe : 6d ee 6c ADC $6cee ; (vdc_state + 10)
4b01 : a8 __ __ TAY
4b02 : 8a __ __ TXA
4b03 : 6d ef 6c ADC $6cef ; (vdc_state + 11)
4b06 : aa __ __ TAX
4b07 : a5 0f __ LDA P2 ; (show + 0)
4b09 : d0 50 __ BNE $4b5b ; (vdcwin_cursor_show.l1026 + 0)
.l1027:
4b0b : 2c 00 d6 BIT $d600 
4b0e : 10 fb __ BPL $4b0b ; (vdcwin_cursor_show.l1027 + 0)
.s47:
4b10 : 8e 01 d6 STX $d601 
4b13 : a9 13 __ LDA #$13
4b15 : 8d 00 d6 STA $d600 
.l351:
4b18 : 2c 00 d6 BIT $d600 
4b1b : 10 fb __ BPL $4b18 ; (vdcwin_cursor_show.l351 + 0)
.s52:
4b1d : 8c 01 d6 STY $d601 
4b20 : a9 1f __ LDA #$1f
4b22 : 8d 00 d6 STA $d600 
.l353:
4b25 : 2c 00 d6 BIT $d600 
4b28 : 10 fb __ BPL $4b25 ; (vdcwin_cursor_show.l353 + 0)
.s56:
4b2a : ad 01 d6 LDA $d601 
4b2d : 29 bf __ AND #$bf
.s1030:
4b2f : 85 1b __ STA ACCU + 0 
4b31 : a9 12 __ LDA #$12
4b33 : 8d 00 d6 STA $d600 
.l344:
4b36 : 2c 00 d6 BIT $d600 
4b39 : 10 fb __ BPL $4b36 ; (vdcwin_cursor_show.l344 + 0)
.s1029:
4b3b : 8e 01 d6 STX $d601 
4b3e : a9 13 __ LDA #$13
4b40 : 8d 00 d6 STA $d600 
.l346:
4b43 : 2c 00 d6 BIT $d600 
4b46 : 10 fb __ BPL $4b43 ; (vdcwin_cursor_show.l346 + 0)
.s1028:
4b48 : 8c 01 d6 STY $d601 
4b4b : a9 1f __ LDA #$1f
4b4d : 8d 00 d6 STA $d600 
.l348:
4b50 : 2c 00 d6 BIT $d600 
4b53 : 10 fb __ BPL $4b50 ; (vdcwin_cursor_show.l348 + 0)
.s560:
4b55 : a5 1b __ LDA ACCU + 0 
4b57 : 8d 01 d6 STA $d601 
.s1001:
4b5a : 60 __ __ RTS
.l1026:
4b5b : 2c 00 d6 BIT $d600 
4b5e : 10 fb __ BPL $4b5b ; (vdcwin_cursor_show.l1026 + 0)
.s13:
4b60 : 8e 01 d6 STX $d601 
4b63 : a9 13 __ LDA #$13
4b65 : 8d 00 d6 STA $d600 
.l340:
4b68 : 2c 00 d6 BIT $d600 
4b6b : 10 fb __ BPL $4b68 ; (vdcwin_cursor_show.l340 + 0)
.s18:
4b6d : 8c 01 d6 STY $d601 
4b70 : a9 1f __ LDA #$1f
4b72 : 8d 00 d6 STA $d600 
.l342:
4b75 : 2c 00 d6 BIT $d600 
4b78 : 10 fb __ BPL $4b75 ; (vdcwin_cursor_show.l342 + 0)
.s22:
4b7a : ad 01 d6 LDA $d601 
4b7d : 09 40 __ ORA #$40
4b7f : 4c 2f 4b JMP $4b2f ; (vdcwin_cursor_show.s1030 + 0)
--------------------------------------------------------------------
vdcwin_edit_char: ; vdcwin_edit_char(struct VDCWin*,u8)->bool
.s1000:
4b82 : a5 53 __ LDA T0 + 0 
4b84 : 8d f0 bf STA $bff0 ; (vp_fill + 31)
4b87 : a5 54 __ LDA T2 + 0 
4b89 : 8d f1 bf STA $bff1 ; (buffer + 10)
4b8c : a5 55 __ LDA T2 + 1 
4b8e : 8d f2 bf STA $bff2 ; (buffer + 11)
.s0:
4b91 : ad fa bf LDA $bffa ; (sstack + 3)
4b94 : c9 14 __ CMP #$14
4b96 : d0 03 __ BNE $4b9b ; (vdcwin_edit_char.s39 + 0)
4b98 : 4c d1 4c JMP $4cd1 ; (vdcwin_edit_char.s23 + 0)
.s39:
4b9b : 85 53 __ STA T0 + 0 
4b9d : c9 14 __ CMP #$14
4b9f : b0 03 __ BCS $4ba4 ; (vdcwin_edit_char.s40 + 0)
4ba1 : 4c 85 4c JMP $4c85 ; (vdcwin_edit_char.s41 + 0)
.s40:
4ba4 : c9 93 __ CMP #$93
4ba6 : d0 29 __ BNE $4bd1 ; (vdcwin_edit_char.s48 + 0)
.s4:
4ba8 : a9 20 __ LDA #$20
4baa : 85 11 __ STA P4 
4bac : ad f8 bf LDA $bff8 ; (sstack + 1)
4baf : 85 54 __ STA T2 + 0 
4bb1 : ad f9 bf LDA $bff9 ; (sstack + 2)
4bb4 : 85 55 __ STA T2 + 1 
4bb6 : a0 00 __ LDY #$00
4bb8 : b1 54 __ LDA (T2 + 0),y 
4bba : 85 0f __ STA P2 
4bbc : c8 __ __ INY
4bbd : b1 54 __ LDA (T2 + 0),y 
4bbf : 85 14 __ STA P7 
4bc1 : c8 __ __ INY
4bc2 : b1 54 __ LDA (T2 + 0),y 
4bc4 : 85 13 __ STA P6 
4bc6 : c8 __ __ INY
4bc7 : b1 54 __ LDA (T2 + 0),y 
4bc9 : 85 15 __ STA P8 
4bcb : 20 54 21 JSR $2154 ; (vdc_clear.s0 + 0)
4bce : 4c 7a 4c JMP $4c7a ; (vdcwin_edit_char.s1040 + 0)
.s48:
4bd1 : 90 77 __ BCC $4c4a ; (vdcwin_edit_char.s50 + 0)
.s49:
4bd3 : c9 9d __ CMP #$9d
4bd5 : d0 10 __ BNE $4be7 ; (vdcwin_edit_char.s28 + 0)
.s22:
4bd7 : ad f8 bf LDA $bff8 ; (sstack + 1)
4bda : 85 0d __ STA P0 
4bdc : ad f9 bf LDA $bff9 ; (sstack + 2)
4bdf : 85 0e __ STA P1 
4be1 : 20 2a 4d JSR $4d2a ; (vdcwin_cursor_backward.s0 + 0)
4be4 : 4c 36 4c JMP $4c36 ; (vdcwin_edit_char.s1038 + 0)
.s28:
4be7 : c9 20 __ CMP #$20
4be9 : 90 4b __ BCC $4c36 ; (vdcwin_edit_char.s1038 + 0)
.s33:
4beb : 09 00 __ ORA #$00
4bed : 10 04 __ BPL $4bf3 ; (vdcwin_edit_char.s29 + 0)
.s32:
4bef : c9 a0 __ CMP #$a0
4bf1 : 90 43 __ BCC $4c36 ; (vdcwin_edit_char.s1038 + 0)
.s29:
4bf3 : ad f8 bf LDA $bff8 ; (sstack + 1)
4bf6 : 85 54 __ STA T2 + 0 
4bf8 : ad f9 bf LDA $bff9 ; (sstack + 2)
4bfb : 85 55 __ STA T2 + 1 
4bfd : a0 05 __ LDY #$05
4bff : b1 54 __ LDA (T2 + 0),y 
4c01 : 18 __ __ CLC
4c02 : 69 01 __ ADC #$01
4c04 : b0 06 __ BCS $4c0c ; (vdcwin_edit_char.s37 + 0)
.s1004:
4c06 : a0 03 __ LDY #$03
4c08 : d1 54 __ CMP (T2 + 0),y 
4c0a : 90 0f __ BCC $4c1b ; (vdcwin_edit_char.s34 + 0)
.s37:
4c0c : a0 04 __ LDY #$04
4c0e : b1 54 __ LDA (T2 + 0),y 
4c10 : 18 __ __ CLC
4c11 : 69 01 __ ADC #$01
4c13 : b0 21 __ BCS $4c36 ; (vdcwin_edit_char.s1038 + 0)
.s1002:
4c15 : a0 02 __ LDY #$02
4c17 : d1 54 __ CMP (T2 + 0),y 
4c19 : b0 1b __ BCS $4c36 ; (vdcwin_edit_char.s1038 + 0)
.s34:
4c1b : a5 54 __ LDA T2 + 0 
4c1d : 85 16 __ STA P9 
4c1f : a5 55 __ LDA T2 + 1 
4c21 : 85 17 __ STA P10 
4c23 : 20 16 4f JSR $4f16 ; (vdcwin_insert_char.s0 + 0)
4c26 : a5 54 __ LDA T2 + 0 
4c28 : 85 17 __ STA P10 
4c2a : a5 55 __ LDA T2 + 1 
4c2c : 85 18 __ STA P11 
4c2e : a5 53 __ LDA T0 + 0 
4c30 : 8d f7 bf STA $bff7 ; (sstack + 0)
4c33 : 20 05 48 JSR $4805 ; (vdcwin_put_char.s1000 + 0)
.s1038:
4c36 : a9 00 __ LDA #$00
.s1001:
4c38 : 85 1b __ STA ACCU + 0 ; (win + 1)
4c3a : ad f0 bf LDA $bff0 ; (vp_fill + 31)
4c3d : 85 53 __ STA T0 + 0 
4c3f : ad f1 bf LDA $bff1 ; (buffer + 10)
4c42 : 85 54 __ STA T2 + 0 
4c44 : ad f2 bf LDA $bff2 ; (buffer + 11)
4c47 : 85 55 __ STA T2 + 1 
4c49 : 60 __ __ RTS
.s50:
4c4a : c9 1d __ CMP #$1d
4c4c : d0 10 __ BNE $4c5e ; (vdcwin_edit_char.s51 + 0)
.s21:
4c4e : ad f8 bf LDA $bff8 ; (sstack + 1)
4c51 : 85 0d __ STA P0 
4c53 : ad f9 bf LDA $bff9 ; (sstack + 2)
4c56 : 85 0e __ STA P1 
4c58 : 20 f7 4c JSR $4cf7 ; (vdcwin_cursor_forward.s0 + 0)
4c5b : 4c 36 4c JMP $4c36 ; (vdcwin_edit_char.s1038 + 0)
.s51:
4c5e : c9 91 __ CMP #$91
4c60 : d0 85 __ BNE $4be7 ; (vdcwin_edit_char.s28 + 0)
.s14:
4c62 : ad f8 bf LDA $bff8 ; (sstack + 1)
4c65 : 85 54 __ STA T2 + 0 
4c67 : ad f9 bf LDA $bff9 ; (sstack + 2)
4c6a : 85 55 __ STA T2 + 1 
4c6c : a0 05 __ LDY #$05
4c6e : b1 54 __ LDA (T2 + 0),y 
4c70 : f0 c4 __ BEQ $4c36 ; (vdcwin_edit_char.s1038 + 0)
.s16:
4c72 : 38 __ __ SEC
4c73 : e9 01 __ SBC #$01
.s1039:
4c75 : 91 54 __ STA (T2 + 0),y 
4c77 : 4c 36 4c JMP $4c36 ; (vdcwin_edit_char.s1038 + 0)
.s1040:
4c7a : a9 00 __ LDA #$00
4c7c : a0 04 __ LDY #$04
4c7e : 91 54 __ STA (T2 + 0),y 
4c80 : c8 __ __ INY
4c81 : 91 54 __ STA (T2 + 0),y 
4c83 : d0 b3 __ BNE $4c38 ; (vdcwin_edit_char.s1001 + 0)
.s41:
4c85 : c9 11 __ CMP #$11
4c87 : d0 22 __ BNE $4cab ; (vdcwin_edit_char.s42 + 0)
.s7:
4c89 : ad f8 bf LDA $bff8 ; (sstack + 1)
4c8c : 85 54 __ STA T2 + 0 
4c8e : ad f9 bf LDA $bff9 ; (sstack + 2)
4c91 : 85 55 __ STA T2 + 1 
4c93 : a0 03 __ LDY #$03
4c95 : b1 54 __ LDA (T2 + 0),y 
4c97 : 85 44 __ STA T3 + 0 
4c99 : a0 05 __ LDY #$05
4c9b : b1 54 __ LDA (T2 + 0),y 
4c9d : aa __ __ TAX
4c9e : 18 __ __ CLC
4c9f : 69 01 __ ADC #$01
4ca1 : b0 93 __ BCS $4c36 ; (vdcwin_edit_char.s1038 + 0)
.s1030:
4ca3 : c5 44 __ CMP T3 + 0 
4ca5 : b0 8f __ BCS $4c36 ; (vdcwin_edit_char.s1038 + 0)
.s9:
4ca7 : e8 __ __ INX
4ca8 : 8a __ __ TXA
4ca9 : 90 ca __ BCC $4c75 ; (vdcwin_edit_char.s1039 + 0)
.s42:
4cab : 90 14 __ BCC $4cc1 ; (vdcwin_edit_char.s44 + 0)
.s43:
4cad : c9 13 __ CMP #$13
4caf : f0 03 __ BEQ $4cb4 ; (vdcwin_edit_char.s3 + 0)
4cb1 : 4c e7 4b JMP $4be7 ; (vdcwin_edit_char.s28 + 0)
.s3:
4cb4 : ad f8 bf LDA $bff8 ; (sstack + 1)
4cb7 : 85 54 __ STA T2 + 0 
4cb9 : ad f9 bf LDA $bff9 ; (sstack + 2)
4cbc : 85 55 __ STA T2 + 1 
4cbe : 4c 7a 4c JMP $4c7a ; (vdcwin_edit_char.s1040 + 0)
.s44:
4cc1 : c9 03 __ CMP #$03
4cc3 : f0 07 __ BEQ $4ccc ; (vdcwin_edit_char.s2 + 0)
.s45:
4cc5 : c9 0d __ CMP #$0d
4cc7 : f0 03 __ BEQ $4ccc ; (vdcwin_edit_char.s2 + 0)
4cc9 : 4c e7 4b JMP $4be7 ; (vdcwin_edit_char.s28 + 0)
.s2:
4ccc : a9 01 __ LDA #$01
4cce : 4c 38 4c JMP $4c38 ; (vdcwin_edit_char.s1001 + 0)
.s23:
4cd1 : ad f8 bf LDA $bff8 ; (sstack + 1)
4cd4 : 85 54 __ STA T2 + 0 
4cd6 : 85 0d __ STA P0 
4cd8 : ad f9 bf LDA $bff9 ; (sstack + 2)
4cdb : 85 55 __ STA T2 + 1 
4cdd : 85 0e __ STA P1 
4cdf : 20 2a 4d JSR $4d2a ; (vdcwin_cursor_backward.s0 + 0)
4ce2 : 09 00 __ ORA #$00
4ce4 : d0 03 __ BNE $4ce9 ; (vdcwin_edit_char.s24 + 0)
4ce6 : 4c 36 4c JMP $4c36 ; (vdcwin_edit_char.s1038 + 0)
.s24:
4ce9 : a5 54 __ LDA T2 + 0 
4ceb : 85 15 __ STA P8 
4ced : a5 55 __ LDA T2 + 1 
4cef : 85 16 __ STA P9 
4cf1 : 20 4f 4d JSR $4d4f ; (vdcwin_delete_char.s0 + 0)
4cf4 : 4c 36 4c JMP $4c36 ; (vdcwin_edit_char.s1038 + 0)
--------------------------------------------------------------------
vdcwin_cursor_forward: ; vdcwin_cursor_forward(struct VDCWin*)->void
.s0:
4cf7 : a0 02 __ LDY #$02
4cf9 : b1 0d __ LDA (P0),y ; (win + 0)
4cfb : 85 1b __ STA ACCU + 0 
4cfd : a0 04 __ LDY #$04
4cff : b1 0d __ LDA (P0),y ; (win + 0)
4d01 : aa __ __ TAX
4d02 : 18 __ __ CLC
4d03 : 69 01 __ ADC #$01
4d05 : b0 08 __ BCS $4d0f ; (vdcwin_cursor_forward.s2 + 0)
.s1004:
4d07 : c5 1b __ CMP ACCU + 0 
4d09 : b0 04 __ BCS $4d0f ; (vdcwin_cursor_forward.s2 + 0)
.s1:
4d0b : e8 __ __ INX
4d0c : 8a __ __ TXA
4d0d : 90 18 __ BCC $4d27 ; (vdcwin_cursor_forward.s1006 + 0)
.s2:
4d0f : a0 05 __ LDY #$05
4d11 : b1 0d __ LDA (P0),y ; (win + 0)
4d13 : aa __ __ TAX
4d14 : 18 __ __ CLC
4d15 : 69 01 __ ADC #$01
4d17 : b0 10 __ BCS $4d29 ; (vdcwin_cursor_forward.s1001 + 0)
.s1002:
4d19 : a0 03 __ LDY #$03
4d1b : d1 0d __ CMP (P0),y ; (win + 0)
4d1d : b0 0a __ BCS $4d29 ; (vdcwin_cursor_forward.s1001 + 0)
.s5:
4d1f : a9 00 __ LDA #$00
4d21 : c8 __ __ INY
4d22 : 91 0d __ STA (P0),y ; (win + 0)
4d24 : e8 __ __ INX
4d25 : 8a __ __ TXA
4d26 : c8 __ __ INY
.s1006:
4d27 : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
4d29 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_cursor_backward: ; vdcwin_cursor_backward(struct VDCWin*)->bool
.s0:
4d2a : a0 04 __ LDY #$04
4d2c : b1 0d __ LDA (P0),y ; (win + 0)
4d2e : f0 06 __ BEQ $4d36 ; (vdcwin_cursor_backward.s2 + 0)
.s1:
4d30 : 38 __ __ SEC
4d31 : e9 01 __ SBC #$01
4d33 : 4c 4a 4d JMP $4d4a ; (vdcwin_cursor_backward.s1003 + 0)
.s2:
4d36 : c8 __ __ INY
4d37 : b1 0d __ LDA (P0),y ; (win + 0)
4d39 : f0 13 __ BEQ $4d4e ; (vdcwin_cursor_backward.s1001 + 0)
.s5:
4d3b : aa __ __ TAX
4d3c : 38 __ __ SEC
4d3d : a0 02 __ LDY #$02
4d3f : b1 0d __ LDA (P0),y ; (win + 0)
4d41 : e9 01 __ SBC #$01
4d43 : a0 04 __ LDY #$04
4d45 : 91 0d __ STA (P0),y ; (win + 0)
4d47 : ca __ __ DEX
4d48 : 8a __ __ TXA
4d49 : c8 __ __ INY
.s1003:
4d4a : 91 0d __ STA (P0),y ; (win + 0)
4d4c : a9 01 __ LDA #$01
.s1001:
4d4e : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_delete_char: ; vdcwin_delete_char(struct VDCWin*)->void
.s0:
4d4f : a0 05 __ LDY #$05
4d51 : b1 15 __ LDA (P8),y ; (win + 0)
4d53 : 85 46 __ STA T2 + 0 
4d55 : 0a __ __ ASL
4d56 : aa __ __ TAX
4d57 : bd 00 6e LDA $6e00,x ; (multab + 0)
4d5a : 85 47 __ STA T3 + 0 
4d5c : 18 __ __ CLC
4d5d : c8 __ __ INY
4d5e : 71 15 __ ADC (P8),y ; (win + 0)
4d60 : 85 49 __ STA T4 + 0 
4d62 : bd 01 6e LDA $6e01,x ; (multab + 1)
4d65 : 85 48 __ STA T3 + 1 
4d67 : c8 __ __ INY
4d68 : 71 15 __ ADC (P8),y ; (win + 0)
4d6a : 85 4a __ STA T4 + 1 
4d6c : a0 04 __ LDY #$04
4d6e : b1 15 __ LDA (P8),y ; (win + 0)
4d70 : 85 4b __ STA T5 + 0 
4d72 : 18 __ __ CLC
4d73 : 65 49 __ ADC T4 + 0 
4d75 : 85 0f __ STA P2 
4d77 : a9 00 __ LDA #$00
4d79 : 85 14 __ STA P7 
4d7b : 65 4a __ ADC T4 + 1 
4d7d : 85 10 __ STA P3 
4d7f : 18 __ __ CLC
4d80 : a5 0f __ LDA P2 
4d82 : 69 01 __ ADC #$01
4d84 : 85 11 __ STA P4 
4d86 : a5 10 __ LDA P3 
4d88 : 69 00 __ ADC #$00
4d8a : 85 12 __ STA P5 
4d8c : a0 02 __ LDY #$02
4d8e : b1 15 __ LDA (P8),y ; (win + 0)
4d90 : 38 __ __ SEC
4d91 : e9 01 __ SBC #$01
4d93 : 85 4c __ STA T6 + 0 
4d95 : 38 __ __ SEC
4d96 : e5 4b __ SBC T5 + 0 
4d98 : 85 13 __ STA P6 
4d9a : a0 08 __ LDY #$08
4d9c : b1 15 __ LDA (P8),y ; (win + 0)
4d9e : 85 4f __ STA T8 + 0 
4da0 : c8 __ __ INY
4da1 : b1 15 __ LDA (P8),y ; (win + 0)
4da3 : 85 50 __ STA T8 + 1 
4da5 : 20 75 46 JSR $4675 ; (vdc_block_copy.s0 + 0)
4da8 : 18 __ __ CLC
4da9 : a5 4f __ LDA T8 + 0 
4dab : 65 47 __ ADC T3 + 0 
4dad : 85 47 __ STA T3 + 0 
4daf : a5 50 __ LDA T8 + 1 
4db1 : 65 48 __ ADC T3 + 1 
4db3 : 85 48 __ STA T3 + 1 
4db5 : 18 __ __ CLC
4db6 : a5 47 __ LDA T3 + 0 
4db8 : 65 4b __ ADC T5 + 0 
4dba : 85 0f __ STA P2 
4dbc : a5 48 __ LDA T3 + 1 
4dbe : 69 00 __ ADC #$00
4dc0 : 85 10 __ STA P3 
4dc2 : 18 __ __ CLC
4dc3 : a5 0f __ LDA P2 
4dc5 : 69 01 __ ADC #$01
4dc7 : 85 11 __ STA P4 
4dc9 : a5 10 __ LDA P3 
.l6:
4dcb : 69 00 __ ADC #$00
4dcd : 85 12 __ STA P5 
4dcf : 20 75 46 JSR $4675 ; (vdc_block_copy.s0 + 0)
4dd2 : e6 46 __ INC T2 + 0 
4dd4 : 18 __ __ CLC
4dd5 : a5 4c __ LDA T6 + 0 
4dd7 : 65 49 __ ADC T4 + 0 
4dd9 : aa __ __ TAX
4dda : a9 00 __ LDA #$00
4ddc : 65 4a __ ADC T4 + 1 
4dde : 85 4e __ STA T7 + 1 
4de0 : a5 46 __ LDA T2 + 0 
4de2 : a0 03 __ LDY #$03
4de4 : d1 15 __ CMP (P8),y ; (win + 0)
4de6 : a9 12 __ LDA #$12
4de8 : 8d 00 d6 STA $d600 
4deb : 90 27 __ BCC $4e14 ; (vdcwin_delete_char.s7 + 0)
.l461:
4ded : 2c 00 d6 BIT $d600 
4df0 : 10 fb __ BPL $4ded ; (vdcwin_delete_char.l461 + 0)
.s84:
4df2 : a5 4e __ LDA T7 + 1 
4df4 : 8d 01 d6 STA $d601 
4df7 : a9 13 __ LDA #$13
4df9 : 8d 00 d6 STA $d600 
.l463:
4dfc : 2c 00 d6 BIT $d600 
4dff : 10 fb __ BPL $4dfc ; (vdcwin_delete_char.l463 + 0)
.s89:
4e01 : 8e 01 d6 STX $d601 
4e04 : a9 1f __ LDA #$1f
4e06 : 8d 00 d6 STA $d600 
.l465:
4e09 : 2c 00 d6 BIT $d600 
4e0c : 10 fb __ BPL $4e09 ; (vdcwin_delete_char.l465 + 0)
.s93:
4e0e : a9 20 __ LDA #$20
4e10 : 8d 01 d6 STA $d601 
.s1001:
4e13 : 60 __ __ RTS
.s7:
4e14 : a5 49 __ LDA T4 + 0 
4e16 : 6d e7 6c ADC $6ce7 ; (vdc_state + 3)
4e19 : a8 __ __ TAY
4e1a : a5 4a __ LDA T4 + 1 
4e1c : 6d e8 6c ADC $6ce8 ; (vdc_state + 4)
4e1f : 85 45 __ STA T9 + 1 
.l437:
4e21 : 2c 00 d6 BIT $d600 
4e24 : 10 fb __ BPL $4e21 ; (vdcwin_delete_char.l437 + 0)
.s16:
4e26 : 8d 01 d6 STA $d601 
4e29 : a9 13 __ LDA #$13
4e2b : 8d 00 d6 STA $d600 
.l439:
4e2e : 2c 00 d6 BIT $d600 
4e31 : 10 fb __ BPL $4e2e ; (vdcwin_delete_char.l439 + 0)
.s21:
4e33 : 8c 01 d6 STY $d601 
4e36 : a9 1f __ LDA #$1f
4e38 : 8d 00 d6 STA $d600 
.l441:
4e3b : 2c 00 d6 BIT $d600 
4e3e : 10 fb __ BPL $4e3b ; (vdcwin_delete_char.l441 + 0)
.s25:
4e40 : ad 01 d6 LDA $d601 
4e43 : 85 43 __ STA T1 + 0 
4e45 : a9 12 __ LDA #$12
4e47 : 8d 00 d6 STA $d600 
.l443:
4e4a : 2c 00 d6 BIT $d600 
4e4d : 10 fb __ BPL $4e4a ; (vdcwin_delete_char.l443 + 0)
.s33:
4e4f : a5 4e __ LDA T7 + 1 
4e51 : 8d 01 d6 STA $d601 
4e54 : a9 13 __ LDA #$13
4e56 : 8d 00 d6 STA $d600 
.l445:
4e59 : 2c 00 d6 BIT $d600 
4e5c : 10 fb __ BPL $4e59 ; (vdcwin_delete_char.l445 + 0)
.s38:
4e5e : 8e 01 d6 STX $d601 
4e61 : a9 1f __ LDA #$1f
4e63 : 8d 00 d6 STA $d600 
.l447:
4e66 : 2c 00 d6 BIT $d600 
4e69 : 10 fb __ BPL $4e66 ; (vdcwin_delete_char.l447 + 0)
.s42:
4e6b : a5 43 __ LDA T1 + 0 
4e6d : 8d 01 d6 STA $d601 
4e70 : a9 12 __ LDA #$12
4e72 : 8d 00 d6 STA $d600 
4e75 : 18 __ __ CLC
4e76 : a5 47 __ LDA T3 + 0 
4e78 : 65 4c __ ADC T6 + 0 
4e7a : aa __ __ TAX
4e7b : a5 48 __ LDA T3 + 1 
4e7d : 69 00 __ ADC #$00
4e7f : 85 4a __ STA T4 + 1 
4e81 : 18 __ __ CLC
4e82 : a5 47 __ LDA T3 + 0 
4e84 : 6d e7 6c ADC $6ce7 ; (vdc_state + 3)
4e87 : 85 4d __ STA T7 + 0 
4e89 : a5 48 __ LDA T3 + 1 
4e8b : 6d e8 6c ADC $6ce8 ; (vdc_state + 4)
4e8e : 85 4e __ STA T7 + 1 
.l449:
4e90 : 2c 00 d6 BIT $d600 
4e93 : 10 fb __ BPL $4e90 ; (vdcwin_delete_char.l449 + 0)
.s50:
4e95 : 8d 01 d6 STA $d601 
4e98 : a9 13 __ LDA #$13
4e9a : 8d 00 d6 STA $d600 
.l451:
4e9d : 2c 00 d6 BIT $d600 
4ea0 : 10 fb __ BPL $4e9d ; (vdcwin_delete_char.l451 + 0)
.s55:
4ea2 : a5 4d __ LDA T7 + 0 
4ea4 : 8d 01 d6 STA $d601 
4ea7 : a9 1f __ LDA #$1f
4ea9 : 8d 00 d6 STA $d600 
.l453:
4eac : 2c 00 d6 BIT $d600 
4eaf : 10 fb __ BPL $4eac ; (vdcwin_delete_char.l453 + 0)
.s59:
4eb1 : ad 01 d6 LDA $d601 
4eb4 : 85 43 __ STA T1 + 0 
4eb6 : a9 12 __ LDA #$12
4eb8 : 8d 00 d6 STA $d600 
.l455:
4ebb : 2c 00 d6 BIT $d600 
4ebe : 10 fb __ BPL $4ebb ; (vdcwin_delete_char.l455 + 0)
.s67:
4ec0 : a5 4a __ LDA T4 + 1 
4ec2 : 8d 01 d6 STA $d601 
4ec5 : a9 13 __ LDA #$13
4ec7 : 8d 00 d6 STA $d600 
.l457:
4eca : 2c 00 d6 BIT $d600 
4ecd : 10 fb __ BPL $4eca ; (vdcwin_delete_char.l457 + 0)
.s72:
4ecf : 8e 01 d6 STX $d601 
4ed2 : a9 1f __ LDA #$1f
4ed4 : 8d 00 d6 STA $d600 
.l459:
4ed7 : 2c 00 d6 BIT $d600 
4eda : 10 fb __ BPL $4ed7 ; (vdcwin_delete_char.l459 + 0)
.s76:
4edc : 84 0f __ STY P2 
4ede : 84 49 __ STY T4 + 0 
4ee0 : a5 43 __ LDA T1 + 0 
4ee2 : 8d 01 d6 STA $d601 
4ee5 : a5 45 __ LDA T9 + 1 
4ee7 : 85 10 __ STA P3 
4ee9 : 85 4a __ STA T4 + 1 
4eeb : a5 4c __ LDA T6 + 0 
4eed : 85 13 __ STA P6 
4eef : a9 00 __ LDA #$00
4ef1 : 85 14 __ STA P7 
4ef3 : 98 __ __ TYA
4ef4 : 18 __ __ CLC
4ef5 : 69 01 __ ADC #$01
4ef7 : 85 11 __ STA P4 
4ef9 : a5 10 __ LDA P3 
4efb : 69 00 __ ADC #$00
4efd : 85 12 __ STA P5 
4eff : 20 75 46 JSR $4675 ; (vdc_block_copy.s0 + 0)
4f02 : a5 4d __ LDA T7 + 0 
4f04 : 85 47 __ STA T3 + 0 
4f06 : 85 0f __ STA P2 
4f08 : 18 __ __ CLC
4f09 : 69 01 __ ADC #$01
4f0b : 85 11 __ STA P4 
4f0d : a5 4e __ LDA T7 + 1 
4f0f : 85 48 __ STA T3 + 1 
4f11 : 85 10 __ STA P3 
4f13 : 4c cb 4d JMP $4dcb ; (vdcwin_delete_char.l6 + 0)
--------------------------------------------------------------------
vdcwin_insert_char: ; vdcwin_insert_char(struct VDCWin*)->void
.s0:
4f16 : a0 02 __ LDY #$02
4f18 : b1 16 __ LDA (P9),y ; (win + 0)
4f1a : 38 __ __ SEC
4f1b : e9 01 __ SBC #$01
4f1d : 85 46 __ STA T2 + 0 
4f1f : c8 __ __ INY
4f20 : b1 16 __ LDA (P9),y ; (win + 0)
4f22 : 38 __ __ SEC
4f23 : e9 01 __ SBC #$01
4f25 : 85 47 __ STA T3 + 0 
4f27 : 0a __ __ ASL
4f28 : aa __ __ TAX
4f29 : a0 06 __ LDY #$06
4f2b : b1 16 __ LDA (P9),y ; (win + 0)
4f2d : 18 __ __ CLC
4f2e : 7d 00 6e ADC $6e00,x ; (multab + 0)
4f31 : 85 4b __ STA T5 + 0 
4f33 : c8 __ __ INY
4f34 : b1 16 __ LDA (P9),y ; (win + 0)
4f36 : 7d 01 6e ADC $6e01,x ; (multab + 1)
4f39 : 85 4c __ STA T5 + 1 
4f3b : c8 __ __ INY
4f3c : b1 16 __ LDA (P9),y ; (win + 0)
4f3e : 18 __ __ CLC
4f3f : 7d 00 6e ADC $6e00,x ; (multab + 0)
4f42 : 85 49 __ STA T4 + 0 
4f44 : c8 __ __ INY
4f45 : b1 16 __ LDA (P9),y ; (win + 0)
4f47 : 7d 01 6e ADC $6e01,x ; (multab + 1)
4f4a : 85 4a __ STA T4 + 1 
.l5:
4f4c : a0 05 __ LDY #$05
4f4e : b1 16 __ LDA (P9),y ; (win + 0)
4f50 : c5 47 __ CMP T3 + 0 
4f52 : b0 03 __ BCS $4f57 ; (vdcwin_insert_char.s7 + 0)
4f54 : 4c 46 50 JMP $5046 ; (vdcwin_insert_char.s6 + 0)
.s7:
4f57 : 88 __ __ DEY
4f58 : b1 16 __ LDA (P9),y ; (win + 0)
4f5a : 18 __ __ CLC
4f5b : 65 4b __ ADC T5 + 0 
4f5d : 85 47 __ STA T3 + 0 
4f5f : a9 00 __ LDA #$00
4f61 : 65 4c __ ADC T5 + 1 
4f63 : 85 48 __ STA T3 + 1 
4f65 : 38 __ __ SEC
4f66 : a5 46 __ LDA T2 + 0 
4f68 : f1 16 __ SBC (P9),y ; (win + 0)
4f6a : d0 03 __ BNE $4f6f ; (vdcwin_insert_char.s81 + 0)
4f6c : 4c 18 50 JMP $5018 ; (vdcwin_insert_char.s83 + 0)
.s81:
4f6f : 85 46 __ STA T2 + 0 
4f71 : 18 __ __ CLC
4f72 : a5 47 __ LDA T3 + 0 
4f74 : 69 01 __ ADC #$01
4f76 : 85 4b __ STA T5 + 0 
4f78 : a5 48 __ LDA T3 + 1 
4f7a : 69 00 __ ADC #$00
4f7c : 85 4c __ STA T5 + 1 
4f7e : b1 16 __ LDA (P9),y ; (win + 0)
4f80 : 18 __ __ CLC
4f81 : 65 49 __ ADC T4 + 0 
4f83 : 85 16 __ STA P9 ; (win + 0)
4f85 : a9 00 __ LDA #$00
4f87 : 65 4a __ ADC T4 + 1 
4f89 : 85 17 __ STA P10 ; (win + 1)
4f8b : 18 __ __ CLC
4f8c : a5 16 __ LDA P9 ; (win + 0)
4f8e : 69 01 __ ADC #$01
4f90 : 85 49 __ STA T4 + 0 
4f92 : a5 17 __ LDA P10 ; (win + 1)
4f94 : 69 00 __ ADC #$00
4f96 : 85 4a __ STA T4 + 1 
4f98 : ad e5 6c LDA $6ce5 ; (vdc_state + 1)
4f9b : d0 0e __ BNE $4fab ; (vdcwin_insert_char.s86 + 0)
.s88:
4f9d : a9 03 __ LDA #$03
4f9f : cd f1 6c CMP $6cf1 ; (vdc_state + 13)
4fa2 : d0 05 __ BNE $4fa9 ; (vdcwin_insert_char.s1009 + 0)
.s1008:
4fa4 : a9 ff __ LDA #$ff
4fa6 : cd f0 6c CMP $6cf0 ; (vdc_state + 12)
.s1009:
4fa9 : 90 41 __ BCC $4fec ; (vdcwin_insert_char.s85 + 0)
.s86:
4fab : a5 47 __ LDA T3 + 0 
4fad : 85 11 __ STA P4 
4faf : a5 48 __ LDA T3 + 1 
4fb1 : 85 12 __ STA P5 
4fb3 : ad f0 6c LDA $6cf0 ; (vdc_state + 12)
4fb6 : 85 4d __ STA T6 + 0 
4fb8 : 85 0f __ STA P2 
4fba : ad f1 6c LDA $6cf1 ; (vdc_state + 13)
4fbd : 85 4e __ STA T6 + 1 
4fbf : 85 10 __ STA P3 
4fc1 : 20 5f 67 JSR $675f ; (vdc_block_copy@proxy + 0)
4fc4 : a5 4b __ LDA T5 + 0 
4fc6 : 85 0f __ STA P2 
4fc8 : a5 4c __ LDA T5 + 1 
4fca : 85 10 __ STA P3 
4fcc : 20 49 67 JSR $6749 ; (vdc_block_copy@proxy + 0)
4fcf : a5 4e __ LDA T6 + 1 
4fd1 : 85 10 __ STA P3 
4fd3 : a5 16 __ LDA P9 ; (win + 0)
4fd5 : 85 11 __ STA P4 
4fd7 : a5 17 __ LDA P10 ; (win + 1)
4fd9 : 85 12 __ STA P5 
4fdb : 20 37 67 JSR $6737 ; (vdc_block_copy@proxy + 0)
4fde : a5 49 __ LDA T4 + 0 
4fe0 : 85 0f __ STA P2 
4fe2 : a5 4a __ LDA T4 + 1 
4fe4 : 85 10 __ STA P3 
4fe6 : 20 49 67 JSR $6749 ; (vdc_block_copy@proxy + 0)
4fe9 : 4c 18 50 JMP $5018 ; (vdcwin_insert_char.s83 + 0)
.s85:
4fec : a5 47 __ LDA T3 + 0 
4fee : 85 10 __ STA P3 
4ff0 : a5 48 __ LDA T3 + 1 
4ff2 : 85 11 __ STA P4 
4ff4 : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc@proxy + 0)
4ff7 : a5 4b __ LDA T5 + 0 
4ff9 : 85 0f __ STA P2 
4ffb : a5 4c __ LDA T5 + 1 
4ffd : 85 10 __ STA P3 
4fff : 20 22 14 JSR $1422 ; (bnk_cpytovdc@proxy + 0)
5002 : a5 16 __ LDA P9 ; (win + 0)
5004 : 85 10 __ STA P3 
5006 : a5 17 __ LDA P10 ; (win + 1)
5008 : 85 11 __ STA P4 
500a : 20 70 15 JSR $1570 ; (bnk_cpyfromvdc@proxy + 0)
500d : a5 49 __ LDA T4 + 0 
500f : 85 0f __ STA P2 
5011 : a5 4a __ LDA T4 + 1 
5013 : 85 10 __ STA P3 
5015 : 20 46 15 JSR $1546 ; (bnk_cpytovdc@proxy + 0)
.s83:
5018 : a9 12 __ LDA #$12
501a : 8d 00 d6 STA $d600 
.l476:
501d : 2c 00 d6 BIT $d600 
5020 : 10 fb __ BPL $501d ; (vdcwin_insert_char.l476 + 0)
.s95:
5022 : a5 48 __ LDA T3 + 1 
5024 : 8d 01 d6 STA $d601 
5027 : a9 13 __ LDA #$13
5029 : 8d 00 d6 STA $d600 
.l478:
502c : 2c 00 d6 BIT $d600 
502f : 10 fb __ BPL $502c ; (vdcwin_insert_char.l478 + 0)
.s100:
5031 : a5 47 __ LDA T3 + 0 
5033 : 8d 01 d6 STA $d601 
5036 : a9 1f __ LDA #$1f
5038 : 8d 00 d6 STA $d600 
.l480:
503b : 2c 00 d6 BIT $d600 
503e : 10 fb __ BPL $503b ; (vdcwin_insert_char.l480 + 0)
.s104:
5040 : a9 20 __ LDA #$20
5042 : 8d 01 d6 STA $d601 
.s1001:
5045 : 60 __ __ RTS
.s6:
5046 : a5 4b __ LDA T5 + 0 
5048 : 69 01 __ ADC #$01
504a : 85 4d __ STA T6 + 0 
504c : a5 4c __ LDA T5 + 1 
504e : 69 00 __ ADC #$00
5050 : 85 4e __ STA T6 + 1 
5052 : 18 __ __ CLC
5053 : a5 49 __ LDA T4 + 0 
5055 : 69 01 __ ADC #$01
5057 : 85 4f __ STA T7 + 0 
5059 : a5 4a __ LDA T4 + 1 
505b : 69 00 __ ADC #$00
505d : 85 50 __ STA T7 + 1 
505f : ad e5 6c LDA $6ce5 ; (vdc_state + 1)
5062 : d0 0e __ BNE $5072 ; (vdcwin_insert_char.s10 + 0)
.s12:
5064 : a9 03 __ LDA #$03
5066 : cd f1 6c CMP $6cf1 ; (vdc_state + 13)
5069 : d0 05 __ BNE $5070 ; (vdcwin_insert_char.s1035 + 0)
.s1034:
506b : a9 ff __ LDA #$ff
506d : cd f0 6c CMP $6cf0 ; (vdc_state + 12)
.s1035:
5070 : 90 41 __ BCC $50b3 ; (vdcwin_insert_char.s9 + 0)
.s10:
5072 : a5 4b __ LDA T5 + 0 
5074 : 85 11 __ STA P4 
5076 : a5 4c __ LDA T5 + 1 
5078 : 85 12 __ STA P5 
507a : ad f0 6c LDA $6cf0 ; (vdc_state + 12)
507d : 85 51 __ STA T8 + 0 
507f : 85 0f __ STA P2 
5081 : ad f1 6c LDA $6cf1 ; (vdc_state + 13)
5084 : 85 52 __ STA T8 + 1 
5086 : 85 10 __ STA P3 
5088 : 20 5f 67 JSR $675f ; (vdc_block_copy@proxy + 0)
508b : a5 4d __ LDA T6 + 0 
508d : 85 0f __ STA P2 
508f : a5 4e __ LDA T6 + 1 
5091 : 85 10 __ STA P3 
5093 : 20 54 67 JSR $6754 ; (vdc_block_copy@proxy + 0)
5096 : a5 52 __ LDA T8 + 1 
5098 : 85 10 __ STA P3 
509a : a5 49 __ LDA T4 + 0 
509c : 85 11 __ STA P4 
509e : a5 4a __ LDA T4 + 1 
50a0 : 85 12 __ STA P5 
50a2 : 20 37 67 JSR $6737 ; (vdc_block_copy@proxy + 0)
50a5 : a5 4f __ LDA T7 + 0 
50a7 : 85 0f __ STA P2 
50a9 : a5 50 __ LDA T7 + 1 
50ab : 85 10 __ STA P3 
50ad : 20 54 67 JSR $6754 ; (vdc_block_copy@proxy + 0)
50b0 : 4c df 50 JMP $50df ; (vdcwin_insert_char.s8 + 0)
.s9:
50b3 : a5 4b __ LDA T5 + 0 
50b5 : 85 10 __ STA P3 
50b7 : a5 4c __ LDA T5 + 1 
50b9 : 85 11 __ STA P4 
50bb : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc@proxy + 0)
50be : a5 4d __ LDA T6 + 0 
50c0 : 85 0f __ STA P2 
50c2 : a5 4e __ LDA T6 + 1 
50c4 : 85 10 __ STA P3 
50c6 : 20 22 14 JSR $1422 ; (bnk_cpytovdc@proxy + 0)
50c9 : a5 49 __ LDA T4 + 0 
50cb : 85 10 __ STA P3 
50cd : a5 4a __ LDA T4 + 1 
50cf : 85 11 __ STA P4 
50d1 : 20 70 15 JSR $1570 ; (bnk_cpyfromvdc@proxy + 0)
50d4 : a5 4f __ LDA T7 + 0 
50d6 : 85 0f __ STA P2 
50d8 : a5 50 __ LDA T7 + 1 
50da : 85 10 __ STA P3 
50dc : 20 46 15 JSR $1546 ; (bnk_cpytovdc@proxy + 0)
.s8:
50df : a9 12 __ LDA #$12
50e1 : 8d 00 d6 STA $d600 
50e4 : 38 __ __ SEC
50e5 : a5 4b __ LDA T5 + 0 
50e7 : ed e7 6c SBC $6ce7 ; (vdc_state + 3)
50ea : 85 4b __ STA T5 + 0 
50ec : a5 4c __ LDA T5 + 1 
50ee : ed e8 6c SBC $6ce8 ; (vdc_state + 4)
50f1 : 85 4c __ STA T5 + 1 
50f3 : 18 __ __ CLC
50f4 : a5 4b __ LDA T5 + 0 
50f6 : 6d e7 6c ADC $6ce7 ; (vdc_state + 3)
50f9 : aa __ __ TAX
50fa : a5 4c __ LDA T5 + 1 
50fc : 6d e8 6c ADC $6ce8 ; (vdc_state + 4)
50ff : a8 __ __ TAY
5100 : 18 __ __ CLC
5101 : a5 46 __ LDA T2 + 0 
5103 : 65 4b __ ADC T5 + 0 
5105 : 85 1b __ STA ACCU + 0 
5107 : a9 00 __ LDA #$00
5109 : 65 4c __ ADC T5 + 1 
510b : 85 44 __ STA T10 + 0 
510d : 38 __ __ SEC
510e : a5 49 __ LDA T4 + 0 
5110 : ed e7 6c SBC $6ce7 ; (vdc_state + 3)
5113 : 85 49 __ STA T4 + 0 
5115 : a5 4a __ LDA T4 + 1 
5117 : ed e8 6c SBC $6ce8 ; (vdc_state + 4)
511a : 85 4a __ STA T4 + 1 
.l449:
511c : 2c 00 d6 BIT $d600 
511f : 10 fb __ BPL $511c ; (vdcwin_insert_char.l449 + 0)
.s20:
5121 : a5 44 __ LDA T10 + 0 
5123 : 8d 01 d6 STA $d601 
5126 : a9 13 __ LDA #$13
5128 : 8d 00 d6 STA $d600 
.l451:
512b : 2c 00 d6 BIT $d600 
512e : 10 fb __ BPL $512b ; (vdcwin_insert_char.l451 + 0)
.s25:
5130 : a5 1b __ LDA ACCU + 0 
5132 : 8d 01 d6 STA $d601 
5135 : a9 1f __ LDA #$1f
5137 : 8d 00 d6 STA $d600 
.l453:
513a : 2c 00 d6 BIT $d600 
513d : 10 fb __ BPL $513a ; (vdcwin_insert_char.l453 + 0)
.s29:
513f : ad 01 d6 LDA $d601 
5142 : 85 43 __ STA T1 + 0 
5144 : a9 12 __ LDA #$12
5146 : 8d 00 d6 STA $d600 
.l455:
5149 : 2c 00 d6 BIT $d600 
514c : 10 fb __ BPL $5149 ; (vdcwin_insert_char.l455 + 0)
.s37:
514e : 8c 01 d6 STY $d601 
5151 : a9 13 __ LDA #$13
5153 : 8d 00 d6 STA $d600 
.l457:
5156 : 2c 00 d6 BIT $d600 
5159 : 10 fb __ BPL $5156 ; (vdcwin_insert_char.l457 + 0)
.s42:
515b : 8e 01 d6 STX $d601 
515e : a9 1f __ LDA #$1f
5160 : 8d 00 d6 STA $d600 
.l459:
5163 : 2c 00 d6 BIT $d600 
5166 : 10 fb __ BPL $5163 ; (vdcwin_insert_char.l459 + 0)
.s46:
5168 : a5 43 __ LDA T1 + 0 
516a : 8d 01 d6 STA $d601 
516d : a9 12 __ LDA #$12
516f : 8d 00 d6 STA $d600 
5172 : 18 __ __ CLC
5173 : a5 49 __ LDA T4 + 0 
5175 : 65 46 __ ADC T2 + 0 
5177 : aa __ __ TAX
5178 : a5 4a __ LDA T4 + 1 
517a : 69 00 __ ADC #$00
517c : a8 __ __ TAY
517d : 18 __ __ CLC
517e : a5 49 __ LDA T4 + 0 
5180 : 6d e7 6c ADC $6ce7 ; (vdc_state + 3)
5183 : 85 4d __ STA T6 + 0 
5185 : a5 4a __ LDA T4 + 1 
5187 : 6d e8 6c ADC $6ce8 ; (vdc_state + 4)
518a : 85 4e __ STA T6 + 1 
.l461:
518c : 2c 00 d6 BIT $d600 
518f : 10 fb __ BPL $518c ; (vdcwin_insert_char.l461 + 0)
.s54:
5191 : 8c 01 d6 STY $d601 
5194 : a9 13 __ LDA #$13
5196 : 8d 00 d6 STA $d600 
.l463:
5199 : 2c 00 d6 BIT $d600 
519c : 10 fb __ BPL $5199 ; (vdcwin_insert_char.l463 + 0)
.s59:
519e : 8e 01 d6 STX $d601 
51a1 : a9 1f __ LDA #$1f
51a3 : 8d 00 d6 STA $d600 
.l465:
51a6 : 2c 00 d6 BIT $d600 
51a9 : 10 fb __ BPL $51a6 ; (vdcwin_insert_char.l465 + 0)
.s63:
51ab : a9 12 __ LDA #$12
51ad : ae 01 d6 LDX $d601 
51b0 : 8d 00 d6 STA $d600 
.l467:
51b3 : 2c 00 d6 BIT $d600 
51b6 : 10 fb __ BPL $51b3 ; (vdcwin_insert_char.l467 + 0)
.s71:
51b8 : a5 4e __ LDA T6 + 1 
51ba : 8d 01 d6 STA $d601 
51bd : a9 13 __ LDA #$13
51bf : 8d 00 d6 STA $d600 
.l469:
51c2 : 2c 00 d6 BIT $d600 
51c5 : 10 fb __ BPL $51c2 ; (vdcwin_insert_char.l469 + 0)
.s76:
51c7 : a5 4d __ LDA T6 + 0 
51c9 : 8d 01 d6 STA $d601 
51cc : a9 1f __ LDA #$1f
51ce : 8d 00 d6 STA $d600 
.l471:
51d1 : 2c 00 d6 BIT $d600 
51d4 : 10 fb __ BPL $51d1 ; (vdcwin_insert_char.l471 + 0)
.s80:
51d6 : 8e 01 d6 STX $d601 
51d9 : c6 47 __ DEC T3 + 0 
51db : 4c 4c 4f JMP $4f4c ; (vdcwin_insert_char.l5 + 0)
--------------------------------------------------------------------
vdcwin_get_rect: ; vdcwin_get_rect(struct VDCWin*,u8,u8,u8,u8,u8,u8*)->void
.s0:
51de : a0 06 __ LDY #$06
51e0 : b1 10 __ LDA (P3),y ; (win + 0)
51e2 : 18 __ __ CLC
51e3 : 6d 00 6e ADC $6e00 ; (multab + 0)
51e6 : 85 43 __ STA T0 + 0 
51e8 : c8 __ __ INY
51e9 : b1 10 __ LDA (P3),y ; (win + 0)
51eb : 6d 01 6e ADC $6e01 ; (multab + 1)
51ee : 85 44 __ STA T0 + 1 
51f0 : a9 05 __ LDA #$05
51f2 : 85 45 __ STA T2 + 0 
.l4:
51f4 : a9 00 __ LDA #$00
51f6 : 85 46 __ STA T3 + 0 
.l8:
51f8 : a9 12 __ LDA #$12
51fa : 8d 00 d6 STA $d600 
51fd : 18 __ __ CLC
51fe : a5 12 __ LDA P5 ; (chars + 0)
5200 : 65 46 __ ADC T3 + 0 
5202 : 85 0d __ STA P0 
5204 : a5 13 __ LDA P6 ; (chars + 1)
5206 : 69 00 __ ADC #$00
5208 : 85 0e __ STA P1 
520a : 18 __ __ CLC
520b : a5 43 __ LDA T0 + 0 
520d : 65 46 __ ADC T3 + 0 
520f : aa __ __ TAX
5210 : a5 44 __ LDA T0 + 1 
5212 : 69 00 __ ADC #$00
.l129:
5214 : 2c 00 d6 BIT $d600 
5217 : 10 fb __ BPL $5214 ; (vdcwin_get_rect.l129 + 0)
.s18:
5219 : 8d 01 d6 STA $d601 
521c : a9 13 __ LDA #$13
521e : 8d 00 d6 STA $d600 
.l131:
5221 : 2c 00 d6 BIT $d600 
5224 : 10 fb __ BPL $5221 ; (vdcwin_get_rect.l131 + 0)
.s23:
5226 : 8e 01 d6 STX $d601 
5229 : a9 1f __ LDA #$1f
522b : 8d 00 d6 STA $d600 
.l133:
522e : 2c 00 d6 BIT $d600 
5231 : 10 fb __ BPL $522e ; (vdcwin_get_rect.l133 + 0)
.s27:
5233 : ad 01 d6 LDA $d601 
5236 : a8 __ __ TAY
5237 : 4a __ __ LSR
5238 : 4a __ __ LSR
5239 : 4a __ __ LSR
523a : 4a __ __ LSR
523b : 4a __ __ LSR
523c : aa __ __ TAX
523d : 98 __ __ TYA
523e : 5d f6 68 EOR $68f6,x ; (s2pmap + 0)
5241 : 85 0f __ STA P2 
5243 : 20 d7 14 JSR $14d7 ; (bnk_writeb.s0 + 0)
5246 : e6 46 __ INC T3 + 0 
5248 : a5 46 __ LDA T3 + 0 
524a : c9 32 __ CMP #$32
524c : 90 aa __ BCC $51f8 ; (vdcwin_get_rect.l8 + 0)
.s10:
524e : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
5251 : 18 __ __ CLC
5252 : 65 43 __ ADC T0 + 0 
5254 : 85 43 __ STA T0 + 0 
5256 : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
5259 : 65 44 __ ADC T0 + 1 
525b : 85 44 __ STA T0 + 1 
525d : 18 __ __ CLC
525e : a5 12 __ LDA P5 ; (chars + 0)
5260 : 69 32 __ ADC #$32
5262 : 85 12 __ STA P5 ; (chars + 0)
5264 : 90 02 __ BCC $5268 ; (vdcwin_get_rect.s1011 + 0)
.s1010:
5266 : e6 13 __ INC P6 ; (chars + 1)
.s1011:
5268 : c6 45 __ DEC T2 + 0 
526a : d0 88 __ BNE $51f4 ; (vdcwin_get_rect.l4 + 0)
.s1001:
526c : 60 __ __ RTS
--------------------------------------------------------------------
526d : __ __ __ BYT 65 4e 54 45 52 45 44 20 53 54 52 49 4e 47 20 46 : eNTERED STRING F
527d : __ __ __ BYT 4f 52 4d 41 54 54 45 44 20 57 49 54 48 20 57 4f : ORMATTED WITH WO
528d : __ __ __ BYT 52 44 20 57 52 41 50 3a 00                      : RD WRAP:.
--------------------------------------------------------------------
viewport_demo: ; viewport_demo(u8)->void
.s1000:
5296 : a5 53 __ LDA T0 + 0 
5298 : 8d 9e bf STA $bf9e ; (bigfont + 135)
529b : a5 54 __ LDA T2 + 0 
529d : 8d 9f bf STA $bf9f ; (bigfont + 136)
52a0 : a5 55 __ LDA T3 + 0 
52a2 : 8d a0 bf STA $bfa0 ; (bigfont + 137)
.s0:
52a5 : a9 00 __ LDA #$00
52a7 : 8d fd bf STA $bffd ; (sstack + 6)
52aa : 8d fe bf STA $bffe ; (sstack + 7)
52ad : ad ff bf LDA $bfff ; (sstack + 8)
52b0 : 85 53 __ STA T0 + 0 
52b2 : 8d fc bf STA $bffc ; (sstack + 5)
52b5 : 20 3a 54 JSR $543a ; (screen_switch.s1000 + 0)
52b8 : a5 1b __ LDA ACCU + 0 
52ba : d0 10 __ BNE $52cc ; (viewport_demo.s3 + 0)
.s1001:
52bc : ad 9e bf LDA $bf9e ; (bigfont + 135)
52bf : 85 53 __ STA T0 + 0 
52c1 : ad 9f bf LDA $bf9f ; (bigfont + 136)
52c4 : 85 54 __ STA T2 + 0 
52c6 : ad a0 bf LDA $bfa0 ; (bigfont + 137)
52c9 : 85 55 __ STA T3 + 0 
52cb : 60 __ __ RTS
.s3:
52cc : a9 03 __ LDA #$03
52ce : 85 10 __ STA P3 
52d0 : a9 b6 __ LDA #$b6
52d2 : 85 11 __ STA P4 
52d4 : a9 55 __ LDA #$55
52d6 : 85 12 __ STA P5 
52d8 : 20 8c 67 JSR $678c ; (vdc_prints_attr@proxy + 0)
52db : a9 05 __ LDA #$05
52dd : 85 0f __ STA P2 
52df : 85 10 __ STA P3 
52e1 : a9 46 __ LDA #$46
52e3 : 85 11 __ STA P4 
52e5 : a9 c3 __ LDA #$c3
52e7 : 85 0d __ STA P0 
52e9 : a9 bf __ LDA #$bf
52eb : 85 0e __ STA P1 
52ed : ad e9 6c LDA $6ce9 ; (vdc_state + 5)
52f0 : 38 __ __ SEC
52f1 : e9 07 __ SBC #$07
52f3 : 85 55 __ STA T3 + 0 
52f5 : 85 12 __ STA P5 
52f7 : 20 8d 32 JSR $328d ; (vdcwin_init.s0 + 0)
52fa : a9 c3 __ LDA #$c3
52fc : 85 14 __ STA P7 
52fe : a9 bf __ LDA #$bf
5300 : 85 15 __ STA P8 
5302 : 20 4d 33 JSR $334d ; (vdcwin_border_clear@proxy + 0)
5305 : a9 7f __ LDA #$7f
5307 : 8d a3 bf STA $bfa3 ; (bigfont + 140)
530a : a9 00 __ LDA #$00
530c : 8d aa bf STA $bfaa ; (bigfont + 147)
530f : 8d ab bf STA $bfab ; (bigfont + 148)
5312 : 8d ac bf STA $bfac ; (bigfont + 149)
5315 : 8d ad bf STA $bfad ; (bigfont + 150)
5318 : a9 05 __ LDA #$05
531a : 85 0f __ STA P2 
531c : 85 10 __ STA P3 
531e : a9 46 __ LDA #$46
5320 : 85 11 __ STA P4 
5322 : a5 55 __ LDA T3 + 0 
5324 : 85 12 __ STA P5 
5326 : a9 40 __ LDA #$40
5328 : 8d a5 bf STA $bfa5 ; (bigfont + 142)
532b : a5 53 __ LDA T0 + 0 
532d : 0a __ __ ASL
532e : 85 54 __ STA T2 + 0 
5330 : 85 55 __ STA T3 + 0 
5332 : aa __ __ TAX
5333 : bd d6 6c LDA $6cd6,x ; (screenset + 0)
5336 : 8d a6 bf STA $bfa6 ; (bigfont + 143)
5339 : a9 00 __ LDA #$00
533b : 8d a9 bf STA $bfa9 ; (bigfont + 146)
533e : 8d a4 bf STA $bfa4 ; (bigfont + 141)
5341 : 8d a7 bf STA $bfa7 ; (bigfont + 144)
5344 : bd d7 6c LDA $6cd7,x ; (screenset + 1)
5347 : 8d a8 bf STA $bfa8 ; (bigfont + 145)
534a : a9 ae __ LDA #$ae
534c : 85 0d __ STA P0 
534e : a9 bf __ LDA #$bf
5350 : 85 0e __ STA P1 
5352 : 20 8d 32 JSR $328d ; (vdcwin_init.s0 + 0)
5355 : a9 a3 __ LDA #$a3
5357 : 85 16 __ STA P9 
5359 : a9 bf __ LDA #$bf
535b : 85 17 __ STA P10 
535d : 20 b5 38 JSR $38b5 ; (vdcwin_cpy_viewport.s0 + 0)
.l7:
5360 : 20 a4 29 JSR $29a4 ; (getch.s0 + 0)
5363 : 85 53 __ STA T0 + 0 
5365 : a9 00 __ LDA #$00
5367 : 85 43 __ STA T1 + 0 
5369 : a5 53 __ LDA T0 + 0 
536b : c9 57 __ CMP #$57
536d : f0 04 __ BEQ $5373 ; (viewport_demo.s12 + 0)
.s13:
536f : c9 91 __ CMP #$91
5371 : d0 11 __ BNE $5384 ; (viewport_demo.s11 + 0)
.s12:
5373 : ad ac bf LDA $bfac ; (bigfont + 149)
5376 : 0d ad bf ORA $bfad ; (bigfont + 150)
5379 : f0 09 __ BEQ $5384 ; (viewport_demo.s11 + 0)
.s9:
537b : a9 08 __ LDA #$08
537d : 85 43 __ STA T1 + 0 
537f : a5 53 __ LDA T0 + 0 
5381 : 4c 8a 53 JMP $538a ; (viewport_demo.s18 + 0)
.s11:
5384 : a5 53 __ LDA T0 + 0 
5386 : c9 53 __ CMP #$53
5388 : f0 04 __ BEQ $538e ; (viewport_demo.s17 + 0)
.s18:
538a : c9 11 __ CMP #$11
538c : d0 2f __ BNE $53bd ; (viewport_demo.s16 + 0)
.s17:
538e : a6 54 __ LDX T2 + 0 
5390 : bd d7 6c LDA $6cd7,x ; (screenset + 1)
5393 : 38 __ __ SEC
5394 : ed e9 6c SBC $6ce9 ; (vdc_state + 5)
5397 : a8 __ __ TAY
5398 : a9 00 __ LDA #$00
539a : ed ea 6c SBC $6cea ; (vdc_state + 6)
539d : aa __ __ TAX
539e : 98 __ __ TYA
539f : 18 __ __ CLC
53a0 : 69 06 __ ADC #$06
53a2 : 85 44 __ STA T4 + 0 
53a4 : 90 01 __ BCC $53a7 ; (viewport_demo.s1027 + 0)
.s1026:
53a6 : e8 __ __ INX
.s1027:
53a7 : 86 45 __ STX T4 + 1 
53a9 : ad ad bf LDA $bfad ; (bigfont + 150)
53ac : c5 45 __ CMP T4 + 1 
53ae : d0 05 __ BNE $53b5 ; (viewport_demo.s1017 + 0)
.s1016:
53b0 : ad ac bf LDA $bfac ; (bigfont + 149)
53b3 : c5 44 __ CMP T4 + 0 
.s1017:
53b5 : b0 06 __ BCS $53bd ; (viewport_demo.s16 + 0)
.s14:
53b7 : a5 43 __ LDA T1 + 0 
53b9 : 09 04 __ ORA #$04
53bb : 85 43 __ STA T1 + 0 
.s16:
53bd : a5 53 __ LDA T0 + 0 
53bf : c9 41 __ CMP #$41
53c1 : f0 04 __ BEQ $53c7 ; (viewport_demo.s22 + 0)
.s23:
53c3 : c9 9d __ CMP #$9d
53c5 : d0 0e __ BNE $53d5 ; (viewport_demo.s21 + 0)
.s22:
53c7 : ad aa bf LDA $bfaa ; (bigfont + 147)
53ca : 0d ab bf ORA $bfab ; (bigfont + 148)
53cd : f0 06 __ BEQ $53d5 ; (viewport_demo.s21 + 0)
.s19:
53cf : a5 43 __ LDA T1 + 0 
53d1 : 09 01 __ ORA #$01
53d3 : 85 43 __ STA T1 + 0 
.s21:
53d5 : a5 53 __ LDA T0 + 0 
53d7 : c9 44 __ CMP #$44
53d9 : f0 04 __ BEQ $53df ; (viewport_demo.s27 + 0)
.s28:
53db : c9 1d __ CMP #$1d
53dd : d0 24 __ BNE $5403 ; (viewport_demo.s26 + 0)
.s27:
53df : a6 55 __ LDX T3 + 0 
53e1 : bd d6 6c LDA $6cd6,x ; (screenset + 0)
53e4 : 38 __ __ SEC
53e5 : e9 47 __ SBC #$47
53e7 : 85 44 __ STA T4 + 0 
53e9 : a9 00 __ LDA #$00
53eb : e9 00 __ SBC #$00
53ed : 85 45 __ STA T4 + 1 
53ef : ad ab bf LDA $bfab ; (bigfont + 148)
53f2 : c5 45 __ CMP T4 + 1 
53f4 : d0 05 __ BNE $53fb ; (viewport_demo.s1007 + 0)
.s1006:
53f6 : ad aa bf LDA $bfaa ; (bigfont + 147)
53f9 : c5 44 __ CMP T4 + 0 
.s1007:
53fb : b0 06 __ BCS $5403 ; (viewport_demo.s26 + 0)
.s24:
53fd : a5 43 __ LDA T1 + 0 
53ff : 09 02 __ ORA #$02
5401 : 90 04 __ BCC $5407 ; (viewport_demo.s29 + 0)
.s26:
5403 : a5 43 __ LDA T1 + 0 
5405 : f0 10 __ BEQ $5417 ; (viewport_demo.s31 + 0)
.s29:
5407 : 8d f9 bf STA $bff9 ; (sstack + 2)
540a : a9 a3 __ LDA #$a3
540c : 8d f7 bf STA $bff7 ; (sstack + 0)
540f : a9 bf __ LDA #$bf
5411 : 8d f8 bf STA $bff8 ; (sstack + 1)
5414 : 20 eb 55 JSR $55eb ; (vdcwin_viewportscroll.s1000 + 0)
.s31:
5417 : a5 53 __ LDA T0 + 0 
5419 : c9 1b __ CMP #$1b
541b : f0 07 __ BEQ $5424 ; (viewport_demo.s8 + 0)
.s32:
541d : c9 03 __ CMP #$03
541f : f0 03 __ BEQ $5424 ; (viewport_demo.s8 + 0)
5421 : 4c 60 53 JMP $5360 ; (viewport_demo.l7 + 0)
.s8:
5424 : a9 01 __ LDA #$01
5426 : 8d fd bf STA $bffd ; (sstack + 6)
5429 : a9 00 __ LDA #$00
542b : 8d fe bf STA $bffe ; (sstack + 7)
542e : ad ff bf LDA $bfff ; (sstack + 8)
5431 : 8d fc bf STA $bffc ; (sstack + 5)
5434 : 20 3a 54 JSR $543a ; (screen_switch.s1000 + 0)
5437 : 4c bc 52 JMP $52bc ; (viewport_demo.s1001 + 0)
--------------------------------------------------------------------
screen_switch: ; screen_switch(u8,u8,u8)->u8
.s1000:
543a : a5 53 __ LDA T1 + 0 
543c : 8d d8 bf STA $bfd8 ; (bigfont + 193)
543f : a5 54 __ LDA T2 + 0 
5441 : 8d d9 bf STA $bfd9 ; (bigfont + 194)
5444 : a5 55 __ LDA T3 + 0 
5446 : 8d da bf STA $bfda ; (bigfont + 195)
.s0:
5449 : a9 00 __ LDA #$00
544b : 85 0f __ STA P2 
544d : a9 20 __ LDA #$20
544f : 85 11 __ STA P4 
5451 : a9 50 __ LDA #$50
5453 : 85 13 __ STA P6 
5455 : a9 02 __ LDA #$02
5457 : 85 14 __ STA P7 
5459 : ae e9 6c LDX $6ce9 ; (vdc_state + 5)
545c : ca __ __ DEX
545d : ca __ __ DEX
545e : 86 15 __ STX P8 
5460 : 20 54 21 JSR $2154 ; (vdc_clear.s0 + 0)
5463 : a9 3d __ LDA #$3d
5465 : 85 11 __ STA P4 
5467 : a9 55 __ LDA #$55
5469 : 85 12 __ STA P5 
546b : 20 a3 67 JSR $67a3 ; (vdc_prints_attr@proxy + 0)
546e : a9 01 __ LDA #$01
5470 : 85 53 __ STA T1 + 0 
5472 : a9 00 __ LDA #$00
5474 : cd fc bf CMP $bffc ; (sstack + 5)
5477 : 2a __ __ ROL
5478 : 85 55 __ STA T3 + 0 
547a : d0 07 __ BNE $5483 ; (screen_switch.s2 + 0)
.s5:
547c : ad fc bf LDA $bffc ; (sstack + 5)
547f : c9 02 __ CMP #$02
5481 : d0 6f __ BNE $54f2 ; (screen_switch.s4 + 0)
.s2:
5483 : 20 e9 14 JSR $14e9 ; (sid_resetsid.s0 + 0)
5486 : ad ff 3e LDA $3eff ; (bootdevice + 0)
5489 : 85 54 __ STA T2 + 0 
548b : 85 0f __ STA P2 
548d : a9 00 __ LDA #$00
548f : 85 10 __ STA P3 
5491 : a9 40 __ LDA #$40
5493 : 85 11 __ STA P4 
5495 : ad fd bf LDA $bffd ; (sstack + 6)
5498 : f0 07 __ BEQ $54a1 ; (screen_switch.s7 + 0)
.s6:
549a : a9 30 __ LDA #$30
549c : a0 33 __ LDY #$33
549e : 4c d8 54 JMP $54d8 ; (screen_switch.s32 + 0)
.s7:
54a1 : a5 55 __ LDA T3 + 0 
54a3 : d0 64 __ BNE $5509 ; (screen_switch.s12 + 0)
.s13:
54a5 : a9 96 __ LDA #$96
54a7 : 85 12 __ STA P5 
54a9 : a9 55 __ LDA #$55
54ab : 85 13 __ STA P6 
54ad : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
54b0 : a5 1b __ LDA ACCU + 0 
54b2 : d0 05 __ BNE $54b9 ; (screen_switch.s24 + 0)
.s22:
54b4 : 20 3b 30 JSR $303b ; (menu_fileerrormessage.s1000 + 0)
54b7 : c6 53 __ DEC T1 + 0 
.s24:
54b9 : a9 04 __ LDA #$04
54bb : 85 10 __ STA P3 
54bd : a9 9e __ LDA #$9e
54bf : 85 11 __ STA P4 
54c1 : a9 55 __ LDA #$55
54c3 : 85 12 __ STA P5 
54c5 : 20 8c 67 JSR $678c ; (vdc_prints_attr@proxy + 0)
54c8 : a5 54 __ LDA T2 + 0 
54ca : 85 0f __ STA P2 
54cc : a9 00 __ LDA #$00
54ce : 85 10 __ STA P3 
54d0 : a9 a0 __ LDA #$a0
54d2 : 85 11 __ STA P4 
54d4 : a9 55 __ LDA #$55
54d6 : a0 af __ LDY #$af
.s32:
54d8 : 84 12 __ STY P5 
54da : 85 13 __ STA P6 
54dc : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
54df : a5 1b __ LDA ACCU + 0 
54e1 : d0 0c __ BNE $54ef ; (screen_switch.s38 + 0)
.s9:
54e3 : 20 3b 30 JSR $303b ; (menu_fileerrormessage.s1000 + 0)
54e6 : 20 e9 14 JSR $14e9 ; (sid_resetsid.s0 + 0)
54e9 : a9 00 __ LDA #$00
54eb : 85 53 __ STA T1 + 0 
54ed : f0 03 __ BEQ $54f2 ; (screen_switch.s4 + 0)
.s38:
54ef : 20 e9 14 JSR $14e9 ; (sid_resetsid.s0 + 0)
.s4:
54f2 : 20 c5 67 JSR $67c5 ; (vdc_clear@proxy + 0)
54f5 : a5 53 __ LDA T1 + 0 
54f7 : 85 1b __ STA ACCU + 0 
.s1001:
54f9 : ad d8 bf LDA $bfd8 ; (bigfont + 193)
54fc : 85 53 __ STA T1 + 0 
54fe : ad d9 bf LDA $bfd9 ; (bigfont + 194)
5501 : 85 54 __ STA T2 + 0 
5503 : ad da bf LDA $bfda ; (bigfont + 195)
5506 : 85 55 __ STA T3 + 0 
5508 : 60 __ __ RTS
.s12:
5509 : a9 f7 __ LDA #$f7
550b : 85 12 __ STA P5 
550d : a9 42 __ LDA #$42
550f : 85 13 __ STA P6 
5511 : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
5514 : a5 1b __ LDA ACCU + 0 
5516 : d0 05 __ BNE $551d ; (screen_switch.s34 + 0)
.s15:
5518 : 20 3b 30 JSR $303b ; (menu_fileerrormessage.s1000 + 0)
551b : c6 53 __ DEC T1 + 0 
.s34:
551d : ad fe bf LDA $bffe ; (sstack + 7)
5520 : d0 cd __ BNE $54ef ; (screen_switch.s38 + 0)
.s18:
5522 : 85 0f __ STA P2 
5524 : ae e9 6c LDX $6ce9 ; (vdc_state + 5)
5527 : ca __ __ DEX
5528 : 86 10 __ STX P3 
552a : a9 52 __ LDA #$52
552c : 85 11 __ STA P4 
552e : a9 55 __ LDA #$55
5530 : 85 12 __ STA P5 
5532 : ad eb 6c LDA $6ceb ; (vdc_state + 7)
5535 : 85 13 __ STA P6 
5537 : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
553a : 4c ef 54 JMP $54ef ; (screen_switch.s38 + 0)
--------------------------------------------------------------------
553d : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 53 43 52 45 45 4e 20 44 : lOADING SCREEN D
554d : __ __ __ BYT 41 54 41 2e 00                                  : ATA..
--------------------------------------------------------------------
5552 : __ __ __ BYT 70 45 54 53 43 49 49 20 41 52 54 20 43 52 45 44 : pETSCII ART CRED
5562 : __ __ __ BYT 49 54 3a 20 27 6c 4f 56 45 20 49 53 20 54 48 45 : IT: 'lOVE IS THE
5572 : __ __ __ BYT 20 44 52 55 47 27 20 61 54 4c 41 4e 54 49 53 2c :  DRUG' aTLANTIS,
5582 : __ __ __ BYT 20 32 30 32 33 2c 20 61 52 54 20 42 59 20 6c 4f :  2023, aRT BY lO
5592 : __ __ __ BYT 42 4f 2e 00                                     : BO..
--------------------------------------------------------------------
5596 : __ __ __ BYT 53 43 52 45 45 4e 33 00                         : SCREEN3.
--------------------------------------------------------------------
559e : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 43 48 41 52 53 45 54 2e : lOADING CHARSET.
55ae : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
55af : __ __ __ BYT 43 48 41 52 53 31 00                            : CHARS1.
--------------------------------------------------------------------
55b6 : __ __ __ BYT 6d 4f 56 45 20 42 59 20 77 2c 61 2c 73 2c 64 20 : mOVE BY w,a,s,d 
55c6 : __ __ __ BYT 4f 52 20 43 55 52 53 4f 52 20 4b 45 59 53 2e 20 : OR CURSOR KEYS. 
55d6 : __ __ __ BYT 65 73 63 20 4f 52 20 73 74 6f 70 20 54 4f 20 45 : esc OR stop TO E
55e6 : __ __ __ BYT 58 49 54 2e 00                                  : XIT..
--------------------------------------------------------------------
vdcwin_viewportscroll: ; vdcwin_viewportscroll(struct VDCViewport*,u8)->void
.s1000:
55eb : a5 53 __ LDA T2 + 0 
55ed : 8d cd bf STA $bfcd ; (bigfont + 182)
.s0:
55f0 : ad f7 bf LDA $bff7 ; (sstack + 0)
55f3 : 85 50 __ STA T0 + 0 
55f5 : ad f8 bf LDA $bff8 ; (sstack + 1)
55f8 : 85 51 __ STA T0 + 1 
55fa : a0 14 __ LDY #$14
.l1002:
55fc : b1 50 __ LDA (T0 + 0),y 
55fe : 99 d1 bf STA $bfd1,y ; (bigfont + 186)
5601 : 88 __ __ DEY
5602 : 10 f8 __ BPL $55fc ; (vdcwin_viewportscroll.l1002 + 0)
.s1003:
5604 : ad f9 bf LDA $bff9 ; (sstack + 2)
5607 : 85 53 __ STA T2 + 0 
5609 : 4a __ __ LSR
560a : 90 45 __ BCC $5651 ; (vdcwin_viewportscroll.s14 + 0)
.s1:
560c : a5 50 __ LDA T0 + 0 
560e : 69 0a __ ADC #$0a
5610 : 85 16 __ STA P9 
5612 : a5 51 __ LDA T0 + 1 
5614 : 69 00 __ ADC #$00
5616 : 85 17 __ STA P10 
5618 : 20 69 57 JSR $5769 ; (vdcwin_scroll_right.s1000 + 0)
561b : a9 01 __ LDA #$01
561d : 85 11 __ STA P4 
561f : a0 0b __ LDY #$0b
5621 : b1 50 __ LDA (T0 + 0),y 
5623 : 85 0f __ STA P2 
5625 : c8 __ __ INY
5626 : b1 50 __ LDA (T0 + 0),y 
5628 : 85 10 __ STA P3 
562a : a0 0e __ LDY #$0e
562c : b1 50 __ LDA (T0 + 0),y 
562e : 85 12 __ STA P5 
5630 : ad d8 bf LDA $bfd8 ; (bigfont + 193)
5633 : 18 __ __ CLC
5634 : 69 ff __ ADC #$ff
5636 : 8d d8 bf STA $bfd8 ; (bigfont + 193)
5639 : b0 03 __ BCS $563e ; (vdcwin_viewportscroll.s1005 + 0)
.s1004:
563b : ce d9 bf DEC $bfd9 ; (bigfont + 194)
.s1005:
563e : 18 __ __ CLC
563f : a0 07 __ LDY #$07
5641 : b1 50 __ LDA (T0 + 0),y 
5643 : 69 ff __ ADC #$ff
5645 : 91 50 __ STA (T0 + 0),y 
5647 : c8 __ __ INY
5648 : b1 50 __ LDA (T0 + 0),y 
564a : 69 ff __ ADC #$ff
564c : 91 50 __ STA (T0 + 0),y 
564e : 20 85 32 JSR $3285 ; (vdcwin_init@proxy + 0)
.s14:
5651 : a5 53 __ LDA T2 + 0 
5653 : 29 02 __ AND #$02
5655 : f0 58 __ BEQ $56af ; (vdcwin_viewportscroll.s15 + 0)
.s4:
5657 : 18 __ __ CLC
5658 : a5 50 __ LDA T0 + 0 
565a : 69 0b __ ADC #$0b
565c : 85 16 __ STA P9 
565e : a5 51 __ LDA T0 + 1 
5660 : 69 00 __ ADC #$00
5662 : 85 17 __ STA P10 
5664 : 20 60 58 JSR $5860 ; (vdcwin_scroll_left.s0 + 0)
5667 : a9 01 __ LDA #$01
5669 : 85 11 __ STA P4 
566b : a0 0c __ LDY #$0c
566d : b1 50 __ LDA (T0 + 0),y 
566f : 85 10 __ STA P3 
5671 : a0 0e __ LDY #$0e
5673 : b1 50 __ LDA (T0 + 0),y 
5675 : 85 12 __ STA P5 
5677 : 88 __ __ DEY
5678 : b1 50 __ LDA (T0 + 0),y 
567a : 85 43 __ STA T1 + 0 
567c : 18 __ __ CLC
567d : 6d d8 bf ADC $bfd8 ; (bigfont + 193)
5680 : 8d d8 bf STA $bfd8 ; (bigfont + 193)
5683 : 90 03 __ BCC $5688 ; (vdcwin_viewportscroll.s1007 + 0)
.s1006:
5685 : ee d9 bf INC $bfd9 ; (bigfont + 194)
.s1007:
5688 : 18 __ __ CLC
5689 : a0 07 __ LDY #$07
568b : b1 50 __ LDA (T0 + 0),y 
568d : 69 01 __ ADC #$01
568f : 91 50 __ STA (T0 + 0),y 
5691 : c8 __ __ INY
5692 : b1 50 __ LDA (T0 + 0),y 
5694 : 69 00 __ ADC #$00
5696 : 91 50 __ STA (T0 + 0),y 
5698 : a9 dc __ LDA #$dc
569a : 85 0d __ STA P0 
569c : a9 bf __ LDA #$bf
569e : 85 0e __ STA P1 
56a0 : a0 0b __ LDY #$0b
56a2 : b1 50 __ LDA (T0 + 0),y 
56a4 : 18 __ __ CLC
56a5 : 65 43 __ ADC T1 + 0 
56a7 : 38 __ __ SEC
56a8 : e9 01 __ SBC #$01
56aa : 85 0f __ STA P2 
56ac : 20 8d 32 JSR $328d ; (vdcwin_init.s0 + 0)
.s15:
56af : a5 53 __ LDA T2 + 0 
56b1 : 29 08 __ AND #$08
56b3 : f0 45 __ BEQ $56fa ; (vdcwin_viewportscroll.s16 + 0)
.s7:
56b5 : 18 __ __ CLC
56b6 : a5 50 __ LDA T0 + 0 
56b8 : 69 0b __ ADC #$0b
56ba : 85 15 __ STA P8 
56bc : a5 51 __ LDA T0 + 1 
56be : 69 00 __ ADC #$00
56c0 : 85 16 __ STA P9 
56c2 : 20 4e 59 JSR $594e ; (vdcwin_scroll_down.s0 + 0)
56c5 : a9 01 __ LDA #$01
56c7 : 85 12 __ STA P5 
56c9 : a0 0b __ LDY #$0b
56cb : b1 50 __ LDA (T0 + 0),y 
56cd : 85 0f __ STA P2 
56cf : c8 __ __ INY
56d0 : b1 50 __ LDA (T0 + 0),y 
56d2 : 85 10 __ STA P3 
56d4 : c8 __ __ INY
56d5 : b1 50 __ LDA (T0 + 0),y 
56d7 : 85 11 __ STA P4 
56d9 : ad da bf LDA $bfda ; (bigfont + 195)
56dc : 18 __ __ CLC
56dd : 69 ff __ ADC #$ff
56df : 8d da bf STA $bfda ; (bigfont + 195)
56e2 : b0 03 __ BCS $56e7 ; (vdcwin_viewportscroll.s1009 + 0)
.s1008:
56e4 : ce db bf DEC $bfdb ; (wrapbuffer + 62)
.s1009:
56e7 : 18 __ __ CLC
56e8 : a0 09 __ LDY #$09
56ea : b1 50 __ LDA (T0 + 0),y 
56ec : 69 ff __ ADC #$ff
56ee : 91 50 __ STA (T0 + 0),y 
56f0 : c8 __ __ INY
56f1 : b1 50 __ LDA (T0 + 0),y 
56f3 : 69 ff __ ADC #$ff
56f5 : 91 50 __ STA (T0 + 0),y 
56f7 : 20 85 32 JSR $3285 ; (vdcwin_init@proxy + 0)
.s16:
56fa : a5 53 __ LDA T2 + 0 
56fc : 29 04 __ AND #$04
56fe : f0 58 __ BEQ $5758 ; (vdcwin_viewportscroll.s12 + 0)
.s10:
5700 : 18 __ __ CLC
5701 : a5 50 __ LDA T0 + 0 
5703 : 69 0b __ ADC #$0b
5705 : 85 15 __ STA P8 
5707 : a5 51 __ LDA T0 + 1 
5709 : 69 00 __ ADC #$00
570b : 85 16 __ STA P9 
570d : 20 e9 45 JSR $45e9 ; (vdcwin_scroll_up.s0 + 0)
5710 : a9 01 __ LDA #$01
5712 : 85 12 __ STA P5 
5714 : a0 0b __ LDY #$0b
5716 : b1 50 __ LDA (T0 + 0),y 
5718 : 85 0f __ STA P2 
571a : a0 0d __ LDY #$0d
571c : b1 50 __ LDA (T0 + 0),y 
571e : 85 11 __ STA P4 
5720 : c8 __ __ INY
5721 : b1 50 __ LDA (T0 + 0),y 
5723 : 85 43 __ STA T1 + 0 
5725 : 18 __ __ CLC
5726 : 6d da bf ADC $bfda ; (bigfont + 195)
5729 : 8d da bf STA $bfda ; (bigfont + 195)
572c : 90 03 __ BCC $5731 ; (vdcwin_viewportscroll.s1011 + 0)
.s1010:
572e : ee db bf INC $bfdb ; (wrapbuffer + 62)
.s1011:
5731 : 18 __ __ CLC
5732 : a0 09 __ LDY #$09
5734 : b1 50 __ LDA (T0 + 0),y 
5736 : 69 01 __ ADC #$01
5738 : 91 50 __ STA (T0 + 0),y 
573a : c8 __ __ INY
573b : b1 50 __ LDA (T0 + 0),y 
573d : 69 00 __ ADC #$00
573f : 91 50 __ STA (T0 + 0),y 
5741 : a9 dc __ LDA #$dc
5743 : 85 0d __ STA P0 
5745 : a9 bf __ LDA #$bf
5747 : 85 0e __ STA P1 
5749 : a0 0c __ LDY #$0c
574b : b1 50 __ LDA (T0 + 0),y 
574d : 18 __ __ CLC
574e : 65 43 __ ADC T1 + 0 
5750 : 38 __ __ SEC
5751 : e9 01 __ SBC #$01
5753 : 85 10 __ STA P3 
5755 : 20 8d 32 JSR $328d ; (vdcwin_init.s0 + 0)
.s12:
5758 : a9 d1 __ LDA #$d1
575a : 85 16 __ STA P9 
575c : a9 bf __ LDA #$bf
575e : 85 17 __ STA P10 
5760 : 20 b5 38 JSR $38b5 ; (vdcwin_cpy_viewport.s0 + 0)
.s1001:
5763 : ad cd bf LDA $bfcd ; (bigfont + 182)
5766 : 85 53 __ STA T2 + 0 
5768 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_right: ; vdcwin_scroll_right(struct VDCWin*,u8)->void
.s1000:
5769 : a5 53 __ LDA T8 + 0 
576b : 8d f1 bf STA $bff1 ; (buffer + 10)
576e : a5 54 __ LDA T8 + 1 
5770 : 8d f2 bf STA $bff2 ; (buffer + 11)
.s0:
5773 : a0 02 __ LDY #$02
5775 : b1 16 __ LDA (P9),y ; (win + 0)
5777 : 38 __ __ SEC
5778 : e9 01 __ SBC #$01
577a : 85 47 __ STA T2 + 0 
577c : a9 00 __ LDA #$00
577e : 85 46 __ STA T1 + 0 
5780 : a0 06 __ LDY #$06
5782 : b1 16 __ LDA (P9),y ; (win + 0)
5784 : 85 48 __ STA T3 + 0 
5786 : c8 __ __ INY
5787 : b1 16 __ LDA (P9),y ; (win + 0)
5789 : 85 49 __ STA T3 + 1 
578b : c8 __ __ INY
578c : b1 16 __ LDA (P9),y ; (win + 0)
578e : 85 4a __ STA T4 + 0 
5790 : c8 __ __ INY
5791 : b1 16 __ LDA (P9),y ; (win + 0)
.l1:
5793 : 85 4b __ STA T4 + 1 
5795 : a5 46 __ LDA T1 + 0 
5797 : a0 03 __ LDY #$03
5799 : d1 16 __ CMP (P9),y ; (win + 0)
579b : 90 0b __ BCC $57a8 ; (vdcwin_scroll_right.s2 + 0)
.s1001:
579d : ad f1 bf LDA $bff1 ; (buffer + 10)
57a0 : 85 53 __ STA T8 + 0 
57a2 : ad f2 bf LDA $bff2 ; (buffer + 11)
57a5 : 85 54 __ STA T8 + 1 
57a7 : 60 __ __ RTS
.s2:
57a8 : a5 48 __ LDA T3 + 0 
57aa : 69 01 __ ADC #$01
57ac : 85 4c __ STA T6 + 0 
57ae : a5 49 __ LDA T3 + 1 
57b0 : 69 00 __ ADC #$00
57b2 : 85 4d __ STA T6 + 1 
57b4 : 18 __ __ CLC
57b5 : a5 4a __ LDA T4 + 0 
57b7 : 69 01 __ ADC #$01
57b9 : 85 4e __ STA T7 + 0 
57bb : a5 4b __ LDA T4 + 1 
57bd : 69 00 __ ADC #$00
57bf : 85 4f __ STA T7 + 1 
57c1 : ad e5 6c LDA $6ce5 ; (vdc_state + 1)
57c4 : d0 0c __ BNE $57d2 ; (vdcwin_scroll_right.s7 + 0)
.s9:
57c6 : cc f1 6c CPY $6cf1 ; (vdc_state + 13)
57c9 : d0 05 __ BNE $57d0 ; (vdcwin_scroll_right.s1003 + 0)
.s1002:
57cb : a9 ff __ LDA #$ff
57cd : cd f0 6c CMP $6cf0 ; (vdc_state + 12)
.s1003:
57d0 : 90 41 __ BCC $5813 ; (vdcwin_scroll_right.s6 + 0)
.s7:
57d2 : a5 48 __ LDA T3 + 0 
57d4 : 85 11 __ STA P4 
57d6 : a5 49 __ LDA T3 + 1 
57d8 : 85 12 __ STA P5 
57da : ad f0 6c LDA $6cf0 ; (vdc_state + 12)
57dd : 85 53 __ STA T8 + 0 
57df : 85 0f __ STA P2 
57e1 : ad f1 6c LDA $6cf1 ; (vdc_state + 13)
57e4 : 85 54 __ STA T8 + 1 
57e6 : 85 10 __ STA P3 
57e8 : 20 6d 46 JSR $466d ; (vdc_block_copy@proxy + 0)
57eb : a5 4c __ LDA T6 + 0 
57ed : 85 0f __ STA P2 
57ef : a5 4d __ LDA T6 + 1 
57f1 : 85 10 __ STA P3 
57f3 : 20 3e 67 JSR $673e ; (vdc_block_copy@proxy + 0)
57f6 : a5 54 __ LDA T8 + 1 
57f8 : 85 10 __ STA P3 
57fa : a5 4a __ LDA T4 + 0 
57fc : 85 11 __ STA P4 
57fe : a5 4b __ LDA T4 + 1 
5800 : 85 12 __ STA P5 
5802 : 20 37 67 JSR $6737 ; (vdc_block_copy@proxy + 0)
5805 : a5 4e __ LDA T7 + 0 
5807 : 85 0f __ STA P2 
5809 : a5 4f __ LDA T7 + 1 
580b : 85 10 __ STA P3 
580d : 20 3e 67 JSR $673e ; (vdc_block_copy@proxy + 0)
5810 : 4c 3f 58 JMP $583f ; (vdcwin_scroll_right.s5 + 0)
.s6:
5813 : a5 48 __ LDA T3 + 0 
5815 : 85 10 __ STA P3 
5817 : a5 49 __ LDA T3 + 1 
5819 : 85 11 __ STA P4 
581b : 20 87 15 JSR $1587 ; (bnk_cpyfromvdc@proxy + 0)
581e : a5 4c __ LDA T6 + 0 
5820 : 85 0f __ STA P2 
5822 : a5 4d __ LDA T6 + 1 
5824 : 85 10 __ STA P3 
5826 : 20 59 15 JSR $1559 ; (bnk_cpytovdc@proxy + 0)
5829 : a5 4a __ LDA T4 + 0 
582b : 85 10 __ STA P3 
582d : a5 4b __ LDA T4 + 1 
582f : 85 11 __ STA P4 
5831 : 20 70 15 JSR $1570 ; (bnk_cpyfromvdc@proxy + 0)
5834 : a5 4e __ LDA T7 + 0 
5836 : 85 0f __ STA P2 
5838 : a5 4f __ LDA T7 + 1 
583a : 85 10 __ STA P3 
583c : 20 46 15 JSR $1546 ; (bnk_cpytovdc@proxy + 0)
.s5:
583f : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
5842 : 18 __ __ CLC
5843 : 65 48 __ ADC T3 + 0 
5845 : 85 48 __ STA T3 + 0 
5847 : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
584a : 65 49 __ ADC T3 + 1 
584c : 85 49 __ STA T3 + 1 
584e : 18 __ __ CLC
584f : a5 4a __ LDA T4 + 0 
5851 : 6d e7 6c ADC $6ce7 ; (vdc_state + 3)
5854 : 85 4a __ STA T4 + 0 
5856 : a5 4b __ LDA T4 + 1 
5858 : 6d e8 6c ADC $6ce8 ; (vdc_state + 4)
585b : e6 46 __ INC T1 + 0 
585d : 4c 93 57 JMP $5793 ; (vdcwin_scroll_right.l1 + 0)
--------------------------------------------------------------------
vdcwin_scroll_left: ; vdcwin_scroll_left(struct VDCWin*,u8)->void
.s0:
5860 : a0 02 __ LDY #$02
5862 : b1 16 __ LDA (P9),y ; (win + 0)
5864 : 38 __ __ SEC
5865 : e9 01 __ SBC #$01
5867 : 85 47 __ STA T2 + 0 
5869 : a0 06 __ LDY #$06
586b : b1 16 __ LDA (P9),y ; (win + 0)
586d : 85 48 __ STA T3 + 0 
586f : c8 __ __ INY
5870 : b1 16 __ LDA (P9),y ; (win + 0)
5872 : 85 49 __ STA T3 + 1 
5874 : c8 __ __ INY
5875 : b1 16 __ LDA (P9),y ; (win + 0)
5877 : 85 4a __ STA T4 + 0 
5879 : c8 __ __ INY
587a : b1 16 __ LDA (P9),y ; (win + 0)
587c : 85 4b __ STA T4 + 1 
.l62:
587e : ad 00 d6 LDA $d600 
5881 : 29 20 __ AND #$20
5883 : f0 f9 __ BEQ $587e ; (vdcwin_scroll_left.l62 + 0)
.s1:
5885 : a9 00 __ LDA #$00
5887 : 85 46 __ STA T1 + 0 
.l4:
5889 : a0 03 __ LDY #$03
588b : d1 16 __ CMP (P9),y ; (win + 0)
588d : 90 08 __ BCC $5897 ; (vdcwin_scroll_left.s5 + 0)
.l14:
588f : ad 00 d6 LDA $d600 
5892 : 29 20 __ AND #$20
5894 : d0 f9 __ BNE $588f ; (vdcwin_scroll_left.l14 + 0)
.s1001:
5896 : 60 __ __ RTS
.s5:
5897 : a5 48 __ LDA T3 + 0 
5899 : 69 01 __ ADC #$01
589b : aa __ __ TAX
589c : a5 49 __ LDA T3 + 1 
589e : 69 00 __ ADC #$00
58a0 : 85 4d __ STA T5 + 1 
58a2 : 18 __ __ CLC
58a3 : a5 4a __ LDA T4 + 0 
58a5 : 69 01 __ ADC #$01
58a7 : 85 4e __ STA T7 + 0 
58a9 : a5 4b __ LDA T4 + 1 
58ab : 69 00 __ ADC #$00
58ad : 85 4f __ STA T7 + 1 
58af : ad e5 6c LDA $6ce5 ; (vdc_state + 1)
58b2 : d0 0c __ BNE $58c0 ; (vdcwin_scroll_left.s10 + 0)
.s12:
58b4 : cc f1 6c CPY $6cf1 ; (vdc_state + 13)
58b7 : d0 05 __ BNE $58be ; (vdcwin_scroll_left.s1003 + 0)
.s1002:
58b9 : a9 ff __ LDA #$ff
58bb : cd f0 6c CMP $6cf0 ; (vdc_state + 12)
.s1003:
58be : 90 3f __ BCC $58ff ; (vdcwin_scroll_left.s9 + 0)
.s10:
58c0 : 86 11 __ STX P4 
58c2 : a5 4d __ LDA T5 + 1 
58c4 : 85 12 __ STA P5 
58c6 : ad f0 6c LDA $6cf0 ; (vdc_state + 12)
58c9 : 85 4c __ STA T5 + 0 
58cb : 85 0f __ STA P2 
58cd : ad f1 6c LDA $6cf1 ; (vdc_state + 13)
58d0 : 85 4d __ STA T5 + 1 
58d2 : 85 10 __ STA P3 
58d4 : 20 6d 46 JSR $466d ; (vdc_block_copy@proxy + 0)
58d7 : a5 48 __ LDA T3 + 0 
58d9 : 85 0f __ STA P2 
58db : a5 49 __ LDA T3 + 1 
58dd : 85 10 __ STA P3 
58df : 20 2c 67 JSR $672c ; (vdc_block_copy@proxy + 0)
58e2 : a5 4d __ LDA T5 + 1 
58e4 : 85 10 __ STA P3 
58e6 : a5 4e __ LDA T7 + 0 
58e8 : 85 11 __ STA P4 
58ea : a5 4f __ LDA T7 + 1 
58ec : 85 12 __ STA P5 
58ee : 20 37 67 JSR $6737 ; (vdc_block_copy@proxy + 0)
58f1 : a5 4a __ LDA T4 + 0 
58f3 : 85 0f __ STA P2 
58f5 : a5 4b __ LDA T4 + 1 
58f7 : 85 10 __ STA P3 
58f9 : 20 2c 67 JSR $672c ; (vdc_block_copy@proxy + 0)
58fc : 4c 29 59 JMP $5929 ; (vdcwin_scroll_left.s8 + 0)
.s9:
58ff : 86 10 __ STX P3 
5901 : a5 4d __ LDA T5 + 1 
5903 : 85 11 __ STA P4 
5905 : 20 87 15 JSR $1587 ; (bnk_cpyfromvdc@proxy + 0)
5908 : a5 48 __ LDA T3 + 0 
590a : 85 0f __ STA P2 
590c : a5 49 __ LDA T3 + 1 
590e : 85 10 __ STA P3 
5910 : 20 59 15 JSR $1559 ; (bnk_cpytovdc@proxy + 0)
5913 : a5 4e __ LDA T7 + 0 
5915 : 85 10 __ STA P3 
5917 : a5 4f __ LDA T7 + 1 
5919 : 85 11 __ STA P4 
591b : 20 70 15 JSR $1570 ; (bnk_cpyfromvdc@proxy + 0)
591e : a5 4a __ LDA T4 + 0 
5920 : 85 0f __ STA P2 
5922 : a5 4b __ LDA T4 + 1 
5924 : 85 10 __ STA P3 
5926 : 20 46 15 JSR $1546 ; (bnk_cpytovdc@proxy + 0)
.s8:
5929 : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
592c : 18 __ __ CLC
592d : 65 48 __ ADC T3 + 0 
592f : 85 48 __ STA T3 + 0 
5931 : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
5934 : 65 49 __ ADC T3 + 1 
5936 : 85 49 __ STA T3 + 1 
5938 : 18 __ __ CLC
5939 : a5 4a __ LDA T4 + 0 
593b : 6d e7 6c ADC $6ce7 ; (vdc_state + 3)
593e : 85 4a __ STA T4 + 0 
5940 : a5 4b __ LDA T4 + 1 
5942 : 6d e8 6c ADC $6ce8 ; (vdc_state + 4)
5945 : 85 4b __ STA T4 + 1 
5947 : e6 46 __ INC T1 + 0 
5949 : a5 46 __ LDA T1 + 0 
594b : 4c 89 58 JMP $5889 ; (vdcwin_scroll_left.l4 + 0)
--------------------------------------------------------------------
vdcwin_scroll_down: ; vdcwin_scroll_down(struct VDCWin*,u8)->void
.s0:
594e : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
5951 : 85 49 __ STA T3 + 0 
5953 : 85 1b __ STA ACCU + 0 
5955 : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
5958 : 85 4a __ STA T3 + 1 
595a : 85 1c __ STA ACCU + 1 
595c : a0 03 __ LDY #$03
595e : b1 15 __ LDA (P8),y ; (win + 0)
5960 : 20 2c 64 JSR $642c ; (mul16by8 + 0)
5963 : a0 06 __ LDY #$06
5965 : b1 15 __ LDA (P8),y ; (win + 0)
5967 : 18 __ __ CLC
5968 : 65 05 __ ADC WORK + 2 
596a : 85 4b __ STA T4 + 0 
596c : c8 __ __ INY
596d : b1 15 __ LDA (P8),y ; (win + 0)
596f : 65 06 __ ADC WORK + 3 
5971 : 85 4c __ STA T4 + 1 
5973 : c8 __ __ INY
5974 : b1 15 __ LDA (P8),y ; (win + 0)
5976 : 18 __ __ CLC
5977 : 65 05 __ ADC WORK + 2 
5979 : 85 47 __ STA T2 + 0 
597b : c8 __ __ INY
597c : b1 15 __ LDA (P8),y ; (win + 0)
597e : 65 06 __ ADC WORK + 3 
5980 : 85 48 __ STA T2 + 1 
5982 : a9 00 __ LDA #$00
5984 : 85 46 __ STA T1 + 0 
5986 : a0 02 __ LDY #$02
5988 : b1 15 __ LDA (P8),y ; (win + 0)
598a : 85 4f __ STA T6 + 0 
598c : 4c e5 59 JMP $59e5 ; (vdcwin_scroll_down.l1 + 0)
.s2:
598f : ad e7 6c LDA $6ce7 ; (vdc_state + 3)
5992 : 85 4d __ STA T5 + 0 
5994 : ad e8 6c LDA $6ce8 ; (vdc_state + 4)
5997 : 85 4e __ STA T5 + 1 
5999 : 38 __ __ SEC
599a : a5 4b __ LDA T4 + 0 
599c : e5 4d __ SBC T5 + 0 
599e : 85 0f __ STA P2 
59a0 : 85 4b __ STA T4 + 0 
59a2 : a5 4c __ LDA T4 + 1 
59a4 : e5 4e __ SBC T5 + 1 
59a6 : 85 10 __ STA P3 
59a8 : 85 4c __ STA T4 + 1 
59aa : 38 __ __ SEC
59ab : a5 0f __ LDA P2 
59ad : e5 49 __ SBC T3 + 0 
59af : 85 11 __ STA P4 
59b1 : a5 10 __ LDA P3 
59b3 : e5 4a __ SBC T3 + 1 
59b5 : 85 12 __ STA P5 
59b7 : a5 4f __ LDA T6 + 0 
59b9 : 85 13 __ STA P6 
59bb : a9 00 __ LDA #$00
59bd : 85 14 __ STA P7 
59bf : 20 75 46 JSR $4675 ; (vdc_block_copy.s0 + 0)
59c2 : 38 __ __ SEC
59c3 : a5 47 __ LDA T2 + 0 
59c5 : e5 4d __ SBC T5 + 0 
59c7 : 85 47 __ STA T2 + 0 
59c9 : 85 0f __ STA P2 
59cb : a5 48 __ LDA T2 + 1 
59cd : e5 4e __ SBC T5 + 1 
59cf : 85 48 __ STA T2 + 1 
59d1 : 85 10 __ STA P3 
59d3 : 38 __ __ SEC
59d4 : a5 0f __ LDA P2 
59d6 : e5 49 __ SBC T3 + 0 
59d8 : 85 11 __ STA P4 
59da : a5 10 __ LDA P3 
59dc : e5 4a __ SBC T3 + 1 
59de : 85 12 __ STA P5 
59e0 : 20 75 46 JSR $4675 ; (vdc_block_copy.s0 + 0)
59e3 : e6 46 __ INC T1 + 0 
.l1:
59e5 : a0 03 __ LDY #$03
59e7 : b1 15 __ LDA (P8),y ; (win + 0)
59e9 : 38 __ __ SEC
59ea : e9 01 __ SBC #$01
59ec : 90 a1 __ BCC $598f ; (vdcwin_scroll_down.s2 + 0)
.s1002:
59ee : c5 46 __ CMP T1 + 0 
59f0 : 90 02 __ BCC $59f4 ; (vdcwin_scroll_down.s1001 + 0)
.s1004:
59f2 : d0 9b __ BNE $598f ; (vdcwin_scroll_down.s2 + 0)
.s1001:
59f4 : 60 __ __ RTS
--------------------------------------------------------------------
scroll_fullscreen_smooth: ; scroll_fullscreen_smooth(u8)->void
.s1000:
59f5 : a5 53 __ LDA T0 + 0 
59f7 : 8d c9 bf STA $bfc9 ; (bigfont + 178)
.s0:
59fa : a9 00 __ LDA #$00
59fc : 8d fd bf STA $bffd ; (sstack + 6)
59ff : a9 01 __ LDA #$01
5a01 : 8d fe bf STA $bffe ; (sstack + 7)
5a04 : ad ff bf LDA $bfff ; (sstack + 8)
5a07 : 85 53 __ STA T0 + 0 
5a09 : 8d fc bf STA $bffc ; (sstack + 5)
5a0c : 20 3a 54 JSR $543a ; (screen_switch.s1000 + 0)
5a0f : a9 7f __ LDA #$7f
5a11 : 8d ca bf STA $bfca ; (bigfont + 179)
5a14 : a9 00 __ LDA #$00
5a16 : 8d cb bf STA $bfcb ; (bigfont + 180)
5a19 : a9 40 __ LDA #$40
5a1b : 8d cc bf STA $bfcc ; (bigfont + 181)
5a1e : a5 53 __ LDA T0 + 0 
5a20 : 0a __ __ ASL
5a21 : aa __ __ TAX
5a22 : bd d6 6c LDA $6cd6,x ; (screenset + 0)
5a25 : 8d cd bf STA $bfcd ; (bigfont + 182)
5a28 : bd d7 6c LDA $6cd7,x ; (screenset + 1)
5a2b : 8d ce bf STA $bfce ; (bigfont + 183)
5a2e : a9 ca __ LDA #$ca
5a30 : 85 17 __ STA P10 
5a32 : a9 bf __ LDA #$bf
5a34 : 85 18 __ STA P11 
5a36 : ad e6 6c LDA $6ce6 ; (vdc_state + 2)
5a39 : 8d f7 bf STA $bff7 ; (sstack + 0)
5a3c : 20 06 5b JSR $5b06 ; (vdc_softscroll_init.s1000 + 0)
5a3f : a5 1b __ LDA ACCU + 0 
5a41 : d0 17 __ BNE $5a5a ; (scroll_fullscreen_smooth.l4 + 0)
.s3:
5a43 : a9 01 __ LDA #$01
5a45 : 8d fd bf STA $bffd ; (sstack + 6)
5a48 : 8d fe bf STA $bffe ; (sstack + 7)
5a4b : ad ff bf LDA $bfff ; (sstack + 8)
5a4e : 8d fc bf STA $bffc ; (sstack + 5)
5a51 : 20 3a 54 JSR $543a ; (screen_switch.s1000 + 0)
.s1001:
5a54 : ad c9 bf LDA $bfc9 ; (bigfont + 178)
5a57 : 85 53 __ STA T0 + 0 
5a59 : 60 __ __ RTS
.l4:
5a5a : 20 a4 29 JSR $29a4 ; (getch.s0 + 0)
5a5d : 85 53 __ STA T0 + 0 
5a5f : c9 57 __ CMP #$57
5a61 : f0 04 __ BEQ $5a67 ; (scroll_fullscreen_smooth.s6 + 0)
.s9:
5a63 : c9 91 __ CMP #$91
5a65 : d0 10 __ BNE $5a77 ; (scroll_fullscreen_smooth.s8 + 0)
.s6:
5a67 : a9 ca __ LDA #$ca
5a69 : 85 0d __ STA P0 
5a6b : a9 bf __ LDA #$bf
5a6d : 85 0e __ STA P1 
5a6f : 20 af 5c JSR $5caf ; (vdc_softscroll_up.l236 + 0)
5a72 : a5 53 __ LDA T0 + 0 
5a74 : 4c 7b 5a JMP $5a7b ; (scroll_fullscreen_smooth.s13 + 0)
.s8:
5a77 : c9 53 __ CMP #$53
5a79 : f0 04 __ BEQ $5a7f ; (scroll_fullscreen_smooth.s10 + 0)
.s13:
5a7b : c9 11 __ CMP #$11
5a7d : d0 0b __ BNE $5a8a ; (scroll_fullscreen_smooth.s12 + 0)
.s10:
5a7f : a9 ca __ LDA #$ca
5a81 : 85 0d __ STA P0 
5a83 : a9 bf __ LDA #$bf
5a85 : 85 0e __ STA P1 
5a87 : 20 82 5d JSR $5d82 ; (vdc_softscroll_down.l211 + 0)
.s12:
5a8a : a5 53 __ LDA T0 + 0 
5a8c : c9 41 __ CMP #$41
5a8e : f0 04 __ BEQ $5a94 ; (scroll_fullscreen_smooth.s14 + 0)
.s17:
5a90 : c9 9d __ CMP #$9d
5a92 : d0 0d __ BNE $5aa1 ; (scroll_fullscreen_smooth.s16 + 0)
.s14:
5a94 : a9 ca __ LDA #$ca
5a96 : 85 0d __ STA P0 
5a98 : a9 bf __ LDA #$bf
5a9a : 85 0e __ STA P1 
5a9c : 20 5c 5e JSR $5e5c ; (vdc_softscroll_left.s0 + 0)
5a9f : a5 53 __ LDA T0 + 0 
.s16:
5aa1 : c9 44 __ CMP #$44
5aa3 : f0 04 __ BEQ $5aa9 ; (scroll_fullscreen_smooth.s18 + 0)
.s21:
5aa5 : c9 1d __ CMP #$1d
5aa7 : d0 0e __ BNE $5ab7 ; (scroll_fullscreen_smooth.s20 + 0)
.s18:
5aa9 : a9 ca __ LDA #$ca
5aab : 85 0d __ STA P0 
5aad : a9 bf __ LDA #$bf
5aaf : 85 0e __ STA P1 
5ab1 : 20 1e 5f JSR $5f1e ; (vdc_softscroll_right.s0 + 0)
5ab4 : 4c bb 5a JMP $5abb ; (scroll_fullscreen_smooth.s22 + 0)
.s20:
5ab7 : c9 1b __ CMP #$1b
5ab9 : f0 06 __ BEQ $5ac1 ; (scroll_fullscreen_smooth.s5 + 0)
.s22:
5abb : a5 53 __ LDA T0 + 0 
5abd : c9 03 __ CMP #$03
5abf : d0 99 __ BNE $5a5a ; (scroll_fullscreen_smooth.l4 + 0)
.s5:
5ac1 : ad e6 6c LDA $6ce6 ; (vdc_state + 2)
5ac4 : 85 53 __ STA T0 + 0 
5ac6 : 20 40 21 JSR $2140 ; (vdc_cls.s0 + 0)
5ac9 : a9 1b __ LDA #$1b
5acb : 8d 00 d6 STA $d600 
.l131:
5ace : 2c 00 d6 BIT $d600 
5ad1 : 10 fb __ BPL $5ace ; (scroll_fullscreen_smooth.l131 + 0)
.s28:
5ad3 : a9 00 __ LDA #$00
5ad5 : 8d 01 d6 STA $d601 
5ad8 : a9 18 __ LDA #$18
5ada : 8d 00 d6 STA $d600 
5add : ac d3 bf LDY $bfd3 ; (bigfont + 188)
.l133:
5ae0 : 2c 00 d6 BIT $d600 
5ae3 : 10 fb __ BPL $5ae0 ; (scroll_fullscreen_smooth.l133 + 0)
.s33:
5ae5 : 8c 01 d6 STY $d601 
5ae8 : a9 19 __ LDA #$19
5aea : 8d 00 d6 STA $d600 
5aed : ad d7 bf LDA $bfd7 ; (bigfont + 192)
5af0 : 18 __ __ CLC
5af1 : 6d d4 bf ADC $bfd4 ; (bigfont + 189)
.l135:
5af4 : 2c 00 d6 BIT $d600 
5af7 : 10 fb __ BPL $5af4 ; (scroll_fullscreen_smooth.l135 + 0)
.s38:
5af9 : 8d 01 d6 STA $d601 
5afc : a5 53 __ LDA T0 + 0 
5afe : 85 16 __ STA P9 
5b00 : 20 9f 2b JSR $2b9f ; (vdc_set_mode.s0 + 0)
5b03 : 4c 43 5a JMP $5a43 ; (scroll_fullscreen_smooth.s3 + 0)
--------------------------------------------------------------------
vdc_softscroll_init: ; vdc_softscroll_init(struct VDCSoftScrollSettings*,u8)->u8
.s1000:
5b06 : a2 03 __ LDX #$03
5b08 : b5 53 __ LDA T3 + 0,x 
5b0a : 9d f1 bf STA $bff1,x ; (buffer + 10)
5b0d : ca __ __ DEX
5b0e : 10 f8 __ BPL $5b08 ; (vdc_softscroll_init.s1000 + 2)
.s0:
5b10 : a0 04 __ LDY #$04
5b12 : b1 17 __ LDA (P10),y ; (settings + 0)
5b14 : 85 1b __ STA ACCU + 0 
5b16 : a9 00 __ LDA #$00
5b18 : 85 1c __ STA ACCU + 1 
5b1a : 88 __ __ DEY
5b1b : b1 17 __ LDA (P10),y ; (settings + 0)
5b1d : 85 50 __ STA T2 + 0 
5b1f : 20 2c 64 JSR $642c ; (mul16by8 + 0)
5b22 : a5 05 __ LDA WORK + 2 
5b24 : 85 53 __ STA T3 + 0 
5b26 : 0a __ __ ASL
5b27 : aa __ __ TAX
5b28 : a5 06 __ LDA WORK + 3 
5b2a : 85 54 __ STA T3 + 1 
5b2c : 2a __ __ ROL
5b2d : a8 __ __ TAY
5b2e : 8a __ __ TXA
5b2f : 18 __ __ CLC
5b30 : 69 30 __ ADC #$30
5b32 : 85 55 __ STA T4 + 0 
5b34 : 90 01 __ BCC $5b37 ; (vdc_softscroll_init.s1027 + 0)
.s1026:
5b36 : c8 __ __ INY
.s1027:
5b37 : 84 56 __ STY T4 + 1 
5b39 : a9 20 __ LDA #$20
5b3b : c5 56 __ CMP T4 + 1 
5b3d : d0 04 __ BNE $5b43 ; (vdc_softscroll_init.s1025 + 0)
.s1024:
5b3f : a9 00 __ LDA #$00
5b41 : c5 55 __ CMP T4 + 0 
.s1025:
5b43 : b0 05 __ BCS $5b4a ; (vdc_softscroll_init.s4 + 0)
.s5:
5b45 : ad e5 6c LDA $6ce5 ; (vdc_state + 1)
5b48 : f0 0d __ BEQ $5b57 ; (vdc_softscroll_init.s1 + 0)
.s4:
5b4a : 98 __ __ TYA
5b4b : 49 80 __ EOR #$80
5b4d : c9 60 __ CMP #$60
5b4f : d0 04 __ BNE $5b55 ; (vdc_softscroll_init.s1023 + 0)
.s1022:
5b51 : a5 55 __ LDA T4 + 0 
5b53 : c9 01 __ CMP #$01
.s1023:
5b55 : 90 0f __ BCC $5b66 ; (vdc_softscroll_init.s3 + 0)
.s1:
5b57 : a9 00 __ LDA #$00
.s1001:
5b59 : 85 1b __ STA ACCU + 0 
5b5b : a2 03 __ LDX #$03
5b5d : bd f1 bf LDA $bff1,x ; (buffer + 10)
5b60 : 95 53 __ STA T3 + 0,x 
5b62 : ca __ __ DEX
5b63 : 10 f8 __ BPL $5b5d ; (vdc_softscroll_init.s1001 + 4)
5b65 : 60 __ __ RTS
.s3:
5b66 : ad f7 bf LDA $bff7 ; (sstack + 0)
5b69 : 85 16 __ STA P9 
5b6b : 20 9f 2b JSR $2b9f ; (vdc_set_mode.s0 + 0)
5b6e : a9 00 __ LDA #$00
5b70 : 8d ec 6c STA $6cec ; (vdc_state + 8)
5b73 : 8d f4 6c STA $6cf4 ; (vdc_state + 16)
5b76 : 8d f5 6c STA $6cf5 ; (vdc_state + 17)
5b79 : 8d f6 6c STA $6cf6 ; (vdc_state + 18)
5b7c : a9 20 __ LDA #$20
5b7e : 8d ed 6c STA $6ced ; (vdc_state + 9)
5b81 : a9 10 __ LDA #$10
5b83 : 8d f7 6c STA $6cf7 ; (vdc_state + 19)
5b86 : a5 53 __ LDA T3 + 0 
5b88 : 8d ee 6c STA $6cee ; (vdc_state + 10)
5b8b : 18 __ __ CLC
5b8c : a5 54 __ LDA T3 + 1 
5b8e : 69 20 __ ADC #$20
5b90 : 85 56 __ STA T4 + 1 
5b92 : 8d ef 6c STA $6cef ; (vdc_state + 11)
5b95 : 38 __ __ SEC
5b96 : a5 50 __ LDA T2 + 0 
5b98 : ed e7 6c SBC $6ce7 ; (vdc_state + 3)
5b9b : 85 50 __ STA T2 + 0 
5b9d : 8d fc 6c STA $6cfc ; (vdc_state + 24)
5ba0 : 20 0f 2d JSR $2d0f ; (vdc_set_multab.s0 + 0)
5ba3 : 20 40 21 JSR $2140 ; (vdc_cls.s0 + 0)
5ba6 : a9 1c __ LDA #$1c
5ba8 : 8d 00 d6 STA $d600 
.l290:
5bab : 2c 00 d6 BIT $d600 
5bae : 10 fb __ BPL $5bab ; (vdc_softscroll_init.l290 + 0)
.s13:
5bb0 : ad 01 d6 LDA $d601 
5bb3 : 29 10 __ AND #$10
5bb5 : a2 1c __ LDX #$1c
5bb7 : 8e 00 d6 STX $d600 
.l292:
5bba : 2c 00 d6 BIT $d600 
5bbd : 10 fb __ BPL $5bba ; (vdc_softscroll_init.l292 + 0)
.s19:
5bbf : 8d 01 d6 STA $d601 
5bc2 : 20 6a 2d JSR $2d6a ; (vdc_restore_charsets.s0 + 0)
5bc5 : a9 0c __ LDA #$0c
5bc7 : 8d 00 d6 STA $d600 
.l294:
5bca : 2c 00 d6 BIT $d600 
5bcd : 10 fb __ BPL $5bca ; (vdc_softscroll_init.l294 + 0)
.s25:
5bcf : a9 20 __ LDA #$20
5bd1 : 8d 01 d6 STA $d601 
5bd4 : a9 0d __ LDA #$0d
5bd6 : 8d 00 d6 STA $d600 
.l296:
5bd9 : 2c 00 d6 BIT $d600 
5bdc : 10 fb __ BPL $5bd9 ; (vdc_softscroll_init.l296 + 0)
.s30:
5bde : a9 00 __ LDA #$00
5be0 : 8d 01 d6 STA $d601 
5be3 : a9 14 __ LDA #$14
5be5 : 8d 00 d6 STA $d600 
.l298:
5be8 : 2c 00 d6 BIT $d600 
5beb : 10 fb __ BPL $5be8 ; (vdc_softscroll_init.l298 + 0)
.s35:
5bed : a5 56 __ LDA T4 + 1 
5bef : 8d 01 d6 STA $d601 
5bf2 : a9 15 __ LDA #$15
5bf4 : 8d 00 d6 STA $d600 
.l300:
5bf7 : 2c 00 d6 BIT $d600 
5bfa : 10 fb __ BPL $5bf7 ; (vdc_softscroll_init.l300 + 0)
.s40:
5bfc : a5 53 __ LDA T3 + 0 
5bfe : 8d 01 d6 STA $d601 
5c01 : a9 1b __ LDA #$1b
5c03 : 8d 00 d6 STA $d600 
.l302:
5c06 : 2c 00 d6 BIT $d600 
5c09 : 10 fb __ BPL $5c06 ; (vdc_softscroll_init.l302 + 0)
.s45:
5c0b : a5 50 __ LDA T2 + 0 
5c0d : 8d 01 d6 STA $d601 
5c10 : a9 20 __ LDA #$20
5c12 : 85 10 __ STA P3 
5c14 : a5 53 __ LDA T3 + 0 
5c16 : 85 14 __ STA P7 
5c18 : a5 54 __ LDA T3 + 1 
5c1a : 85 15 __ STA P8 
5c1c : a0 00 __ LDY #$00
5c1e : 84 0f __ STY P2 
5c20 : b1 17 __ LDA (P10),y ; (settings + 0)
5c22 : 85 11 __ STA P4 
5c24 : c8 __ __ INY
5c25 : b1 17 __ LDA (P10),y ; (settings + 0)
5c27 : 85 50 __ STA T2 + 0 
5c29 : 85 12 __ STA P5 
5c2b : c8 __ __ INY
5c2c : b1 17 __ LDA (P10),y ; (settings + 0)
5c2e : 85 51 __ STA T2 + 1 
5c30 : 85 13 __ STA P6 
5c32 : 20 36 14 JSR $1436 ; (bnk_cpytovdc.s0 + 0)
5c35 : a5 14 __ LDA P7 
5c37 : 85 0f __ STA P2 
5c39 : a5 56 __ LDA T4 + 1 
5c3b : 85 10 __ STA P3 
5c3d : 18 __ __ CLC
5c3e : a5 50 __ LDA T2 + 0 
5c40 : 65 14 __ ADC P7 
5c42 : aa __ __ TAX
5c43 : a5 54 __ LDA T3 + 1 
5c45 : 85 15 __ STA P8 
5c47 : 65 51 __ ADC T2 + 1 
5c49 : a8 __ __ TAY
5c4a : 8a __ __ TXA
5c4b : 18 __ __ CLC
5c4c : 69 30 __ ADC #$30
5c4e : 85 12 __ STA P5 
5c50 : 90 01 __ BCC $5c53 ; (vdc_softscroll_init.s1029 + 0)
.s1028:
5c52 : c8 __ __ INY
.s1029:
5c53 : 84 13 __ STY P6 
5c55 : 20 36 14 JSR $1436 ; (bnk_cpytovdc.s0 + 0)
5c58 : a9 00 __ LDA #$00
5c5a : a0 05 __ LDY #$05
5c5c : 91 17 __ STA (P10),y ; (settings + 0)
5c5e : c8 __ __ INY
5c5f : 91 17 __ STA (P10),y ; (settings + 0)
5c61 : c8 __ __ INY
5c62 : 91 17 __ STA (P10),y ; (settings + 0)
5c64 : c8 __ __ INY
5c65 : 91 17 __ STA (P10),y ; (settings + 0)
5c67 : a9 18 __ LDA #$18
5c69 : 8d 00 d6 STA $d600 
.l304:
5c6c : 2c 00 d6 BIT $d600 
5c6f : 10 fb __ BPL $5c6c ; (vdc_softscroll_init.l304 + 0)
.s50:
5c71 : ad 01 d6 LDA $d601 
5c74 : 29 f0 __ AND #$f0
5c76 : a0 09 __ LDY #$09
5c78 : 91 17 __ STA (P10),y ; (settings + 0)
5c7a : a9 19 __ LDA #$19
5c7c : 8d 00 d6 STA $d600 
.l306:
5c7f : 2c 00 d6 BIT $d600 
5c82 : 10 fb __ BPL $5c7f ; (vdc_softscroll_init.l306 + 0)
.s57:
5c84 : ad 01 d6 LDA $d601 
5c87 : 29 0f __ AND #$0f
5c89 : a0 0d __ LDY #$0d
5c8b : 91 17 __ STA (P10),y ; (settings + 0)
5c8d : a9 19 __ LDA #$19
5c8f : 8d 00 d6 STA $d600 
.l308:
5c92 : 2c 00 d6 BIT $d600 
5c95 : 10 fb __ BPL $5c92 ; (vdc_softscroll_init.l308 + 0)
.s64:
5c97 : a9 00 __ LDA #$00
5c99 : ae 01 d6 LDX $d601 
5c9c : a0 0b __ LDY #$0b
5c9e : 91 17 __ STA (P10),y ; (settings + 0)
5ca0 : c8 __ __ INY
5ca1 : 91 17 __ STA (P10),y ; (settings + 0)
5ca3 : 8a __ __ TXA
5ca4 : 29 f0 __ AND #$f0
5ca6 : a0 0a __ LDY #$0a
5ca8 : 91 17 __ STA (P10),y ; (settings + 0)
5caa : a9 01 __ LDA #$01
5cac : 4c 59 5b JMP $5b59 ; (vdc_softscroll_init.s1001 + 0)
--------------------------------------------------------------------
vdc_softscroll_up: ; vdc_softscroll_up(struct VDCSoftScrollSettings*,u8)->void
.l236:
5caf : ad 00 d6 LDA $d600 
5cb2 : 29 20 __ AND #$20
5cb4 : f0 f9 __ BEQ $5caf ; (vdc_softscroll_up.l236 + 0)
.l6:
5cb6 : ad 00 d6 LDA $d600 
5cb9 : 29 20 __ AND #$20
5cbb : d0 f9 __ BNE $5cb6 ; (vdc_softscroll_up.l6 + 0)
.s1:
5cbd : a0 07 __ LDY #$07
5cbf : b1 0d __ LDA (P0),y ; (settings + 0)
5cc1 : c9 02 __ CMP #$02
5cc3 : 90 03 __ BCC $5cc8 ; (vdc_softscroll_up.s9 + 0)
5cc5 : 4c 6a 5d JMP $5d6a ; (vdc_softscroll_up.s8 + 0)
.s9:
5cc8 : a0 0c __ LDY #$0c
5cca : b1 0d __ LDA (P0),y ; (settings + 0)
5ccc : d0 01 __ BNE $5ccf ; (vdc_softscroll_up.s16 + 0)
.s1001:
5cce : 60 __ __ RTS
.s16:
5ccf : aa __ __ TAX
5cd0 : a9 06 __ LDA #$06
5cd2 : a0 07 __ LDY #$07
5cd4 : 91 0d __ STA (P0),y ; (settings + 0)
5cd6 : ca __ __ DEX
5cd7 : 8a __ __ TXA
5cd8 : a0 0c __ LDY #$0c
5cda : 91 0d __ STA (P0),y ; (settings + 0)
5cdc : a0 03 __ LDY #$03
5cde : b1 0d __ LDA (P0),y ; (settings + 0)
5ce0 : 85 1b __ STA ACCU + 0 
5ce2 : 38 __ __ SEC
5ce3 : a0 05 __ LDY #$05
5ce5 : b1 0d __ LDA (P0),y ; (settings + 0)
5ce7 : e5 1b __ SBC ACCU + 0 
5ce9 : 85 43 __ STA T3 + 0 
5ceb : 91 0d __ STA (P0),y ; (settings + 0)
5ced : c8 __ __ INY
5cee : b1 0d __ LDA (P0),y ; (settings + 0)
5cf0 : e9 00 __ SBC #$00
5cf2 : 85 44 __ STA T3 + 1 
5cf4 : 91 0d __ STA (P0),y ; (settings + 0)
.l242:
5cf6 : ad 00 d6 LDA $d600 
5cf9 : 29 20 __ AND #$20
5cfb : d0 f9 __ BNE $5cf6 ; (vdc_softscroll_up.l242 + 0)
.s19:
5cfd : a0 07 __ LDY #$07
5cff : b1 0d __ LDA (P0),y ; (settings + 0)
5d01 : aa __ __ TAX
5d02 : a0 09 __ LDY #$09
5d04 : b1 0d __ LDA (P0),y ; (settings + 0)
5d06 : 85 1b __ STA ACCU + 0 
5d08 : a9 18 __ LDA #$18
5d0a : 8d 00 d6 STA $d600 
5d0d : 8a __ __ TXA
5d0e : 18 __ __ CLC
5d0f : 65 1b __ ADC ACCU + 0 
.l244:
5d11 : 2c 00 d6 BIT $d600 
5d14 : 10 fb __ BPL $5d11 ; (vdc_softscroll_up.l244 + 0)
.s26:
5d16 : 8d 01 d6 STA $d601 
5d19 : ad ee 6c LDA $6cee ; (vdc_state + 10)
5d1c : 18 __ __ CLC
5d1d : 65 43 __ ADC T3 + 0 
5d1f : aa __ __ TAX
5d20 : ad ef 6c LDA $6cef ; (vdc_state + 11)
5d23 : 65 44 __ ADC T3 + 1 
5d25 : a8 __ __ TAY
5d26 : ad ec 6c LDA $6cec ; (vdc_state + 8)
5d29 : 18 __ __ CLC
5d2a : 65 43 __ ADC T3 + 0 
5d2c : 85 43 __ STA T3 + 0 
5d2e : a9 0c __ LDA #$0c
5d30 : 8d 00 d6 STA $d600 
5d33 : ad ed 6c LDA $6ced ; (vdc_state + 9)
5d36 : 65 44 __ ADC T3 + 1 
.l246:
5d38 : 2c 00 d6 BIT $d600 
5d3b : 10 fb __ BPL $5d38 ; (vdc_softscroll_up.l246 + 0)
.s32:
5d3d : 8d 01 d6 STA $d601 
5d40 : a9 0d __ LDA #$0d
5d42 : 8d 00 d6 STA $d600 
.l248:
5d45 : 2c 00 d6 BIT $d600 
5d48 : 10 fb __ BPL $5d45 ; (vdc_softscroll_up.l248 + 0)
.s37:
5d4a : a5 43 __ LDA T3 + 0 
5d4c : 8d 01 d6 STA $d601 
5d4f : a9 14 __ LDA #$14
5d51 : 8d 00 d6 STA $d600 
.l250:
5d54 : 2c 00 d6 BIT $d600 
5d57 : 10 fb __ BPL $5d54 ; (vdc_softscroll_up.l250 + 0)
.s42:
5d59 : 8c 01 d6 STY $d601 
5d5c : a9 15 __ LDA #$15
5d5e : 8d 00 d6 STA $d600 
.l239:
5d61 : 2c 00 d6 BIT $d600 
5d64 : 10 fb __ BPL $5d61 ; (vdc_softscroll_up.l239 + 0)
.s427:
5d66 : 8e 01 d6 STX $d601 
5d69 : 60 __ __ RTS
.s8:
5d6a : e9 02 __ SBC #$02
5d6c : 91 0d __ STA (P0),y ; (settings + 0)
5d6e : aa __ __ TAX
5d6f : a0 09 __ LDY #$09
5d71 : b1 0d __ LDA (P0),y ; (settings + 0)
5d73 : 85 1b __ STA ACCU + 0 
5d75 : a9 18 __ LDA #$18
5d77 : 8d 00 d6 STA $d600 
5d7a : 8a __ __ TXA
5d7b : 18 __ __ CLC
5d7c : 65 1b __ ADC ACCU + 0 
5d7e : aa __ __ TAX
5d7f : 4c 61 5d JMP $5d61 ; (vdc_softscroll_up.l239 + 0)
--------------------------------------------------------------------
vdc_softscroll_down: ; vdc_softscroll_down(struct VDCSoftScrollSettings*,u8)->void
.l211:
5d82 : ad 00 d6 LDA $d600 
5d85 : 29 20 __ AND #$20
5d87 : f0 f9 __ BEQ $5d82 ; (vdc_softscroll_down.l211 + 0)
.l6:
5d89 : ad 00 d6 LDA $d600 
5d8c : 29 20 __ AND #$20
5d8e : d0 f9 __ BNE $5d89 ; (vdc_softscroll_down.l6 + 0)
.s1:
5d90 : a0 07 __ LDY #$07
5d92 : b1 0d __ LDA (P0),y ; (settings + 0)
5d94 : aa __ __ TAX
5d95 : 18 __ __ CLC
5d96 : 69 02 __ ADC #$02
5d98 : 91 0d __ STA (P0),y ; (settings + 0)
5d9a : c9 07 __ CMP #$07
5d9c : b0 13 __ BCS $5db1 ; (vdc_softscroll_down.s8 + 0)
.s9:
5d9e : a0 09 __ LDY #$09
5da0 : 71 0d __ ADC (P0),y ; (settings + 0)
5da2 : aa __ __ TAX
5da3 : a9 18 __ LDA #$18
.s1018:
5da5 : 8d 00 d6 STA $d600 
.l223:
5da8 : 2c 00 d6 BIT $d600 
5dab : 10 fb __ BPL $5da8 ; (vdc_softscroll_down.l223 + 0)
.s384:
5dad : 8e 01 d6 STX $d601 
.s1001:
5db0 : 60 __ __ RTS
.s8:
5db1 : a0 04 __ LDY #$04
5db3 : b1 0d __ LDA (P0),y ; (settings + 0)
5db5 : ed e9 6c SBC $6ce9 ; (vdc_state + 5)
5db8 : a8 __ __ TAY
5db9 : a9 00 __ LDA #$00
5dbb : ed ea 6c SBC $6cea ; (vdc_state + 6)
5dbe : 85 44 __ STA T4 + 1 
5dc0 : 98 __ __ TYA
5dc1 : 38 __ __ SEC
5dc2 : e9 01 __ SBC #$01
5dc4 : 85 43 __ STA T4 + 0 
5dc6 : a0 0c __ LDY #$0c
5dc8 : b1 0d __ LDA (P0),y ; (settings + 0)
5dca : 85 1b __ STA ACCU + 0 
5dcc : a5 44 __ LDA T4 + 1 
5dce : e9 00 __ SBC #$00
5dd0 : d0 0c __ BNE $5dde ; (vdc_softscroll_down.s11 + 0)
.s1014:
5dd2 : a5 1b __ LDA ACCU + 0 
5dd4 : c5 43 __ CMP T4 + 0 
5dd6 : 90 06 __ BCC $5dde ; (vdc_softscroll_down.s11 + 0)
.s12:
5dd8 : 8a __ __ TXA
5dd9 : a0 07 __ LDY #$07
5ddb : 91 0d __ STA (P0),y ; (settings + 0)
5ddd : 60 __ __ RTS
.s11:
5dde : a9 00 __ LDA #$00
5de0 : a0 07 __ LDY #$07
5de2 : 91 0d __ STA (P0),y ; (settings + 0)
5de4 : 18 __ __ CLC
5de5 : a5 1b __ LDA ACCU + 0 
5de7 : 69 01 __ ADC #$01
5de9 : a0 0c __ LDY #$0c
5deb : 91 0d __ STA (P0),y ; (settings + 0)
5ded : a0 03 __ LDY #$03
5def : b1 0d __ LDA (P0),y ; (settings + 0)
5df1 : 18 __ __ CLC
5df2 : a0 05 __ LDY #$05
5df4 : 71 0d __ ADC (P0),y ; (settings + 0)
5df6 : 85 43 __ STA T4 + 0 
5df8 : 91 0d __ STA (P0),y ; (settings + 0)
5dfa : c8 __ __ INY
5dfb : b1 0d __ LDA (P0),y ; (settings + 0)
5dfd : 69 00 __ ADC #$00
5dff : 85 44 __ STA T4 + 1 
5e01 : 91 0d __ STA (P0),y ; (settings + 0)
5e03 : a0 09 __ LDY #$09
5e05 : b1 0d __ LDA (P0),y ; (settings + 0)
5e07 : a2 18 __ LDX #$18
5e09 : 8e 00 d6 STX $d600 
.l215:
5e0c : 2c 00 d6 BIT $d600 
5e0f : 10 fb __ BPL $5e0c ; (vdc_softscroll_down.l215 + 0)
.s18:
5e11 : 8d 01 d6 STA $d601 
5e14 : ad ee 6c LDA $6cee ; (vdc_state + 10)
5e17 : 18 __ __ CLC
5e18 : 65 43 __ ADC T4 + 0 
5e1a : aa __ __ TAX
5e1b : ad ef 6c LDA $6cef ; (vdc_state + 11)
5e1e : 65 44 __ ADC T4 + 1 
5e20 : a8 __ __ TAY
5e21 : ad ec 6c LDA $6cec ; (vdc_state + 8)
5e24 : 18 __ __ CLC
5e25 : 65 43 __ ADC T4 + 0 
5e27 : 85 43 __ STA T4 + 0 
5e29 : a9 0c __ LDA #$0c
5e2b : 8d 00 d6 STA $d600 
5e2e : ad ed 6c LDA $6ced ; (vdc_state + 9)
5e31 : 65 44 __ ADC T4 + 1 
.l217:
5e33 : 2c 00 d6 BIT $d600 
5e36 : 10 fb __ BPL $5e33 ; (vdc_softscroll_down.l217 + 0)
.s24:
5e38 : 8d 01 d6 STA $d601 
5e3b : a9 0d __ LDA #$0d
5e3d : 8d 00 d6 STA $d600 
.l219:
5e40 : 2c 00 d6 BIT $d600 
5e43 : 10 fb __ BPL $5e40 ; (vdc_softscroll_down.l219 + 0)
.s29:
5e45 : a5 43 __ LDA T4 + 0 
5e47 : 8d 01 d6 STA $d601 
5e4a : a9 14 __ LDA #$14
5e4c : 8d 00 d6 STA $d600 
.l221:
5e4f : 2c 00 d6 BIT $d600 
5e52 : 10 fb __ BPL $5e4f ; (vdc_softscroll_down.l221 + 0)
.s34:
5e54 : 8c 01 d6 STY $d601 
5e57 : a9 15 __ LDA #$15
5e59 : 4c a5 5d JMP $5da5 ; (vdc_softscroll_down.s1018 + 0)
--------------------------------------------------------------------
vdc_softscroll_left: ; vdc_softscroll_left(struct VDCSoftScrollSettings*,u8)->void
.s0:
5e5c : 18 __ __ CLC
5e5d : a0 08 __ LDY #$08
5e5f : b1 0d __ LDA (P0),y ; (settings + 0)
5e61 : 69 02 __ ADC #$02
5e63 : 91 0d __ STA (P0),y ; (settings + 0)
5e65 : c9 07 __ CMP #$07
5e67 : 90 10 __ BCC $5e79 ; (vdc_softscroll_left.s1019 + 0)
.s1:
5e69 : a0 0d __ LDY #$0d
5e6b : b1 0d __ LDA (P0),y ; (settings + 0)
5e6d : aa __ __ TAX
5e6e : a0 0b __ LDY #$0b
5e70 : b1 0d __ LDA (P0),y ; (settings + 0)
5e72 : d0 18 __ BNE $5e8c ; (vdc_softscroll_left.s4 + 0)
.s5:
5e74 : 8a __ __ TXA
5e75 : a0 08 __ LDY #$08
5e77 : 91 0d __ STA (P0),y ; (settings + 0)
.s1019:
5e79 : 18 __ __ CLC
5e7a : a0 0a __ LDY #$0a
5e7c : 71 0d __ ADC (P0),y ; (settings + 0)
.s1018:
5e7e : a2 19 __ LDX #$19
5e80 : 8e 00 d6 STX $d600 
.l277:
5e83 : 2c 00 d6 BIT $d600 
5e86 : 10 fb __ BPL $5e83 ; (vdc_softscroll_left.l277 + 0)
.s479:
5e88 : 8d 01 d6 STA $d601 
.s1001:
5e8b : 60 __ __ RTS
.s4:
5e8c : 85 1b __ STA ACCU + 0 
5e8e : 8a __ __ TXA
5e8f : 29 01 __ AND #$01
5e91 : a0 08 __ LDY #$08
5e93 : 91 0d __ STA (P0),y ; (settings + 0)
5e95 : 18 __ __ CLC
5e96 : a5 1b __ LDA ACCU + 0 
5e98 : 69 ff __ ADC #$ff
5e9a : a0 0b __ LDY #$0b
5e9c : 91 0d __ STA (P0),y ; (settings + 0)
5e9e : 18 __ __ CLC
5e9f : a0 05 __ LDY #$05
5ea1 : b1 0d __ LDA (P0),y ; (settings + 0)
5ea3 : 69 ff __ ADC #$ff
5ea5 : 85 1b __ STA ACCU + 0 
5ea7 : 91 0d __ STA (P0),y ; (settings + 0)
5ea9 : c8 __ __ INY
5eaa : b1 0d __ LDA (P0),y ; (settings + 0)
5eac : 69 ff __ ADC #$ff
5eae : 85 1c __ STA ACCU + 1 
5eb0 : 91 0d __ STA (P0),y ; (settings + 0)
.l265:
5eb2 : ad 00 d6 LDA $d600 
5eb5 : 29 20 __ AND #$20
5eb7 : d0 f9 __ BNE $5eb2 ; (vdc_softscroll_left.l265 + 0)
.s7:
5eb9 : ad ee 6c LDA $6cee ; (vdc_state + 10)
5ebc : 18 __ __ CLC
5ebd : 65 1b __ ADC ACCU + 0 
5ebf : aa __ __ TAX
5ec0 : ad ef 6c LDA $6cef ; (vdc_state + 11)
5ec3 : 65 1c __ ADC ACCU + 1 
5ec5 : a8 __ __ TAY
5ec6 : ad ec 6c LDA $6cec ; (vdc_state + 8)
5ec9 : 18 __ __ CLC
5eca : 65 1b __ ADC ACCU + 0 
5ecc : 85 1b __ STA ACCU + 0 
5ece : a9 0c __ LDA #$0c
5ed0 : 8d 00 d6 STA $d600 
5ed3 : ad ed 6c LDA $6ced ; (vdc_state + 9)
5ed6 : 65 1c __ ADC ACCU + 1 
.l267:
5ed8 : 2c 00 d6 BIT $d600 
5edb : 10 fb __ BPL $5ed8 ; (vdc_softscroll_left.l267 + 0)
.s15:
5edd : 8d 01 d6 STA $d601 
5ee0 : a9 0d __ LDA #$0d
5ee2 : 8d 00 d6 STA $d600 
.l269:
5ee5 : 2c 00 d6 BIT $d600 
5ee8 : 10 fb __ BPL $5ee5 ; (vdc_softscroll_left.l269 + 0)
.s20:
5eea : a5 1b __ LDA ACCU + 0 
5eec : 8d 01 d6 STA $d601 
5eef : a9 14 __ LDA #$14
5ef1 : 8d 00 d6 STA $d600 
.l271:
5ef4 : 2c 00 d6 BIT $d600 
5ef7 : 10 fb __ BPL $5ef4 ; (vdc_softscroll_left.l271 + 0)
.s25:
5ef9 : 8c 01 d6 STY $d601 
5efc : a9 15 __ LDA #$15
5efe : 8d 00 d6 STA $d600 
.l273:
5f01 : 2c 00 d6 BIT $d600 
5f04 : 10 fb __ BPL $5f01 ; (vdc_softscroll_left.l273 + 0)
.s30:
5f06 : 8e 01 d6 STX $d601 
.l275:
5f09 : ad 00 d6 LDA $d600 
5f0c : 29 20 __ AND #$20
5f0e : f0 f9 __ BEQ $5f09 ; (vdc_softscroll_left.l275 + 0)
.l36:
5f10 : ad 00 d6 LDA $d600 
5f13 : 29 20 __ AND #$20
5f15 : d0 f9 __ BNE $5f10 ; (vdc_softscroll_left.l36 + 0)
.s31:
5f17 : a0 0a __ LDY #$0a
5f19 : b1 0d __ LDA (P0),y ; (settings + 0)
5f1b : 4c 7e 5e JMP $5e7e ; (vdc_softscroll_left.s1018 + 0)
--------------------------------------------------------------------
vdc_softscroll_right: ; vdc_softscroll_right(struct VDCSoftScrollSettings*,u8)->void
.s0:
5f1e : a0 08 __ LDY #$08
5f20 : b1 0d __ LDA (P0),y ; (settings + 0)
5f22 : c9 02 __ CMP #$02
5f24 : 90 03 __ BCC $5f29 ; (vdc_softscroll_right.s2 + 0)
5f26 : 4c f2 5f JMP $5ff2 ; (vdc_softscroll_right.s1 + 0)
.s2:
5f29 : a0 03 __ LDY #$03
5f2b : b1 0d __ LDA (P0),y ; (settings + 0)
5f2d : 38 __ __ SEC
5f2e : ed e7 6c SBC $6ce7 ; (vdc_state + 3)
5f31 : 85 43 __ STA T3 + 0 
5f33 : a9 00 __ LDA #$00
5f35 : ed e8 6c SBC $6ce8 ; (vdc_state + 4)
5f38 : 85 44 __ STA T3 + 1 
5f3a : a0 0b __ LDY #$0b
5f3c : b1 0d __ LDA (P0),y ; (settings + 0)
5f3e : 85 1b __ STA ACCU + 0 
5f40 : 18 __ __ CLC
5f41 : 69 01 __ ADC #$01
5f43 : aa __ __ TAX
5f44 : a9 00 __ LDA #$00
5f46 : 2a __ __ ROL
5f47 : c5 44 __ CMP T3 + 1 
5f49 : d0 02 __ BNE $5f4d ; (vdc_softscroll_right.s1013 + 0)
.s1012:
5f4b : e4 43 __ CPX T3 + 0 
.s1013:
5f4d : 90 01 __ BCC $5f50 ; (vdc_softscroll_right.s12 + 0)
.s1001:
5f4f : 60 __ __ RTS
.s12:
5f50 : a0 0d __ LDY #$0d
5f52 : b1 0d __ LDA (P0),y ; (settings + 0)
5f54 : 29 01 __ AND #$01
5f56 : 09 06 __ ORA #$06
5f58 : a0 08 __ LDY #$08
5f5a : 91 0d __ STA (P0),y ; (settings + 0)
5f5c : a6 1b __ LDX ACCU + 0 
5f5e : e8 __ __ INX
5f5f : 8a __ __ TXA
5f60 : a0 0b __ LDY #$0b
5f62 : 91 0d __ STA (P0),y ; (settings + 0)
5f64 : a0 05 __ LDY #$05
5f66 : b1 0d __ LDA (P0),y ; (settings + 0)
5f68 : 69 01 __ ADC #$01
5f6a : 85 43 __ STA T3 + 0 
5f6c : 91 0d __ STA (P0),y ; (settings + 0)
5f6e : c8 __ __ INY
5f6f : b1 0d __ LDA (P0),y ; (settings + 0)
5f71 : 69 00 __ ADC #$00
5f73 : 85 44 __ STA T3 + 1 
5f75 : 91 0d __ STA (P0),y ; (settings + 0)
.l251:
5f77 : ad 00 d6 LDA $d600 
5f7a : 29 20 __ AND #$20
5f7c : d0 f9 __ BNE $5f77 ; (vdc_softscroll_right.l251 + 0)
.s15:
5f7e : ad ee 6c LDA $6cee ; (vdc_state + 10)
5f81 : 18 __ __ CLC
5f82 : 65 43 __ ADC T3 + 0 
5f84 : aa __ __ TAX
5f85 : ad ef 6c LDA $6cef ; (vdc_state + 11)
5f88 : 65 44 __ ADC T3 + 1 
5f8a : a8 __ __ TAY
5f8b : ad ec 6c LDA $6cec ; (vdc_state + 8)
5f8e : 18 __ __ CLC
5f8f : 65 43 __ ADC T3 + 0 
5f91 : 85 43 __ STA T3 + 0 
5f93 : a9 0c __ LDA #$0c
5f95 : 8d 00 d6 STA $d600 
5f98 : ad ed 6c LDA $6ced ; (vdc_state + 9)
5f9b : 65 44 __ ADC T3 + 1 
.l253:
5f9d : 2c 00 d6 BIT $d600 
5fa0 : 10 fb __ BPL $5f9d ; (vdc_softscroll_right.l253 + 0)
.s23:
5fa2 : 8d 01 d6 STA $d601 
5fa5 : a9 0d __ LDA #$0d
5fa7 : 8d 00 d6 STA $d600 
.l255:
5faa : 2c 00 d6 BIT $d600 
5fad : 10 fb __ BPL $5faa ; (vdc_softscroll_right.l255 + 0)
.s28:
5faf : a5 43 __ LDA T3 + 0 
5fb1 : 8d 01 d6 STA $d601 
5fb4 : a9 14 __ LDA #$14
5fb6 : 8d 00 d6 STA $d600 
.l257:
5fb9 : 2c 00 d6 BIT $d600 
5fbc : 10 fb __ BPL $5fb9 ; (vdc_softscroll_right.l257 + 0)
.s33:
5fbe : 8c 01 d6 STY $d601 
5fc1 : a9 15 __ LDA #$15
5fc3 : 8d 00 d6 STA $d600 
.l259:
5fc6 : 2c 00 d6 BIT $d600 
5fc9 : 10 fb __ BPL $5fc6 ; (vdc_softscroll_right.l259 + 0)
.s38:
5fcb : 8e 01 d6 STX $d601 
.l261:
5fce : ad 00 d6 LDA $d600 
5fd1 : 29 20 __ AND #$20
5fd3 : f0 f9 __ BEQ $5fce ; (vdc_softscroll_right.l261 + 0)
.s39:
5fd5 : a0 08 __ LDY #$08
.s1018:
5fd7 : b1 0d __ LDA (P0),y ; (settings + 0)
5fd9 : aa __ __ TAX
5fda : a0 0a __ LDY #$0a
5fdc : b1 0d __ LDA (P0),y ; (settings + 0)
5fde : 85 1b __ STA ACCU + 0 
5fe0 : a9 19 __ LDA #$19
5fe2 : 8d 00 d6 STA $d600 
5fe5 : 8a __ __ TXA
5fe6 : 18 __ __ CLC
5fe7 : 65 1b __ ADC ACCU + 0 
.l247:
5fe9 : 2c 00 d6 BIT $d600 
5fec : 10 fb __ BPL $5fe9 ; (vdc_softscroll_right.l247 + 0)
.s437:
5fee : 8d 01 d6 STA $d601 
5ff1 : 60 __ __ RTS
.s1:
5ff2 : e9 02 __ SBC #$02
5ff4 : 91 0d __ STA (P0),y ; (settings + 0)
.l246:
5ff6 : ad 00 d6 LDA $d600 
5ff9 : 29 20 __ AND #$20
5ffb : f0 f9 __ BEQ $5ff6 ; (vdc_softscroll_right.l246 + 0)
5ffd : 4c d7 5f JMP $5fd7 ; (vdc_softscroll_right.s1018 + 0)
--------------------------------------------------------------------
scroll_bigfont: ; scroll_bigfont()->void
.s1000:
6000 : a5 53 __ LDA T0 + 0 
6002 : 8d 38 be STA $be38 ; (scroll_bigfont@stack + 0)
6005 : a5 54 __ LDA T0 + 1 
6007 : 8d 39 be STA $be39 ; (scroll_bigfont@stack + 1)
.s0:
600a : a9 00 __ LDA #$00
600c : 85 0f __ STA P2 
600e : a9 20 __ LDA #$20
6010 : 85 11 __ STA P4 
6012 : a9 50 __ LDA #$50
6014 : 85 13 __ STA P6 
6016 : a9 0e __ LDA #$0e
6018 : 8d 00 bf STA $bf00 ; (color + 0)
601b : a9 07 __ LDA #$07
601d : 8d 01 bf STA $bf01 ; (color + 1)
6020 : a9 06 __ LDA #$06
6022 : 8d 02 bf STA $bf02 ; (color + 2)
6025 : a9 03 __ LDA #$03
6027 : 8d 03 bf STA $bf03 ; (color + 3)
602a : a9 02 __ LDA #$02
602c : 85 14 __ STA P7 
602e : 8d 04 bf STA $bf04 ; (color + 4)
6031 : a2 c3 __ LDX #$c3
.l1002:
6033 : bd ff 6c LDA $6cff,x 
6036 : 9d 3c be STA $be3c,x ; (scroll_bigfont@stack + 4)
6039 : ca __ __ DEX
603a : d0 f7 __ BNE $6033 ; (scroll_bigfont.l1002 + 0)
.s1003:
603c : ad e9 6c LDA $6ce9 ; (vdc_state + 5)
603f : 85 53 __ STA T0 + 0 
6041 : 38 __ __ SEC
6042 : e9 02 __ SBC #$02
6044 : 85 15 __ STA P8 
6046 : ad ea 6c LDA $6cea ; (vdc_state + 6)
6049 : 85 54 __ STA T0 + 1 
604b : 20 54 21 JSR $2154 ; (vdc_clear.s0 + 0)
604e : a9 00 __ LDA #$00
6050 : 85 11 __ STA P4 
6052 : a9 61 __ LDA #$61
6054 : 85 12 __ STA P5 
6056 : 20 a3 67 JSR $67a3 ; (vdc_prints_attr@proxy + 0)
6059 : e6 10 __ INC P3 
605b : a9 0e __ LDA #$0e
605d : 85 11 __ STA P4 
605f : a9 61 __ LDA #$61
6061 : 85 12 __ STA P5 
6063 : 20 9b 2e JSR $2e9b ; (vdc_prints_attr.s0 + 0)
6066 : ad ff 3e LDA $3eff ; (bootdevice + 0)
6069 : 85 0f __ STA P2 
606b : a9 a0 __ LDA #$a0
606d : 85 11 __ STA P4 
606f : a9 f6 __ LDA #$f6
6071 : 85 12 __ STA P5 
6073 : a9 60 __ LDA #$60
6075 : 85 13 __ STA P6 
6077 : 20 3f 15 JSR $153f ; (bnk_load@proxy + 0)
607a : a5 1b __ LDA ACCU + 0 
607c : d0 06 __ BNE $6084 ; (scroll_bigfont.s5 + 0)
.s3:
607e : 20 3b 30 JSR $303b ; (menu_fileerrormessage.s1000 + 0)
6081 : 4c eb 60 JMP $60eb ; (scroll_bigfont.s1001 + 0)
.s5:
6084 : 20 c5 67 JSR $67c5 ; (vdc_clear@proxy + 0)
6087 : a9 17 __ LDA #$17
6089 : 85 0d __ STA P0 
608b : a9 bf __ LDA #$bf
608d : 85 0e __ STA P1 
608f : a9 00 __ LDA #$00
6091 : 85 0f __ STA P2 
6093 : a9 bf __ LDA #$bf
6095 : 85 10 __ STA P3 
6097 : 20 2b 61 JSR $612b ; (txtscr_bigfont_init.s0 + 0)
609a : a9 17 __ LDA #$17
609c : 8d f7 bf STA $bff7 ; (sstack + 0)
609f : a9 bf __ LDA #$bf
60a1 : 8d f8 bf STA $bff8 ; (sstack + 1)
60a4 : a9 05 __ LDA #$05
60a6 : 85 17 __ STA P10 
60a8 : a9 bf __ LDA #$bf
60aa : 85 18 __ STA P11 
60ac : a9 3d __ LDA #$3d
60ae : 8d f9 bf STA $bff9 ; (sstack + 2)
60b1 : a9 be __ LDA #$be
60b3 : 8d fa bf STA $bffa ; (sstack + 3)
60b6 : 46 54 __ LSR T0 + 1 
60b8 : a5 53 __ LDA T0 + 0 
60ba : 6a __ __ ROR
60bb : 38 __ __ SEC
60bc : e9 02 __ SBC #$02
60be : 8d fb bf STA $bffb ; (sstack + 4)
60c1 : 20 f6 32 JSR $32f6 ; (txtscr_scroller_init.s0 + 0)
.l58:
60c4 : 20 d6 61 JSR $61d6 ; (vdcwin_checkch.s0 + 0)
60c7 : a5 1b __ LDA ACCU + 0 
60c9 : 05 1c __ ORA ACCU + 1 
60cb : d0 f7 __ BNE $60c4 ; (scroll_bigfont.l58 + 0)
.l10:
60cd : 20 d6 61 JSR $61d6 ; (vdcwin_checkch.s0 + 0)
60d0 : a5 1b __ LDA ACCU + 0 
60d2 : 85 53 __ STA T0 + 0 
60d4 : a9 05 __ LDA #$05
60d6 : 8d f7 bf STA $bff7 ; (sstack + 0)
60d9 : a9 bf __ LDA #$bf
60db : 8d f8 bf STA $bff8 ; (sstack + 1)
60de : 20 e0 61 JSR $61e0 ; (txtscr_scroll_do.s0 + 0)
60e1 : a5 53 __ LDA T0 + 0 
60e3 : c9 1b __ CMP #$1b
60e5 : f0 04 __ BEQ $60eb ; (scroll_bigfont.s1001 + 0)
.s12:
60e7 : c9 03 __ CMP #$03
60e9 : d0 e2 __ BNE $60cd ; (scroll_bigfont.l10 + 0)
.s1001:
60eb : ad 38 be LDA $be38 ; (scroll_bigfont@stack + 0)
60ee : 85 53 __ STA T0 + 0 
60f0 : ad 39 be LDA $be39 ; (scroll_bigfont@stack + 1)
60f3 : 85 54 __ STA T0 + 1 
60f5 : 60 __ __ RTS
--------------------------------------------------------------------
60f6 : __ __ __ BYT 43 48 41 52 53 32 00                            : CHARS2.
--------------------------------------------------------------------
seed:
60fd : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
6100 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 44 41 54 41 2e 00       : lOADING DATA..
--------------------------------------------------------------------
610e : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 53 43 52 4f 4c 4c 20 70 : lOADING SCROLL p
611e : __ __ __ BYT 65 74 73 63 69 69 20 46 4f 4e 54 2e 00          : etscii FONT..
--------------------------------------------------------------------
txtscr_bigfont_init: ; txtscr_bigfont_init(struct TXTSCRBigFont*,u8,u8*,u8,u8,u8,u8,u8*)->void
.s0:
612b : a9 5b __ LDA #$5b
612d : a0 00 __ LDY #$00
612f : 91 0d __ STA (P0),y ; (settings + 0)
6131 : a9 7f __ LDA #$7f
6133 : c8 __ __ INY
6134 : 91 0d __ STA (P0),y ; (settings + 0)
6136 : a9 50 __ LDA #$50
6138 : c8 __ __ INY
6139 : 91 0d __ STA (P0),y ; (settings + 0)
613b : a9 00 __ LDA #$00
613d : c8 __ __ INY
613e : 91 0d __ STA (P0),y ; (settings + 0)
6140 : a9 04 __ LDA #$04
6142 : a8 __ __ TAY
6143 : 91 0d __ STA (P0),y ; (settings + 0)
6145 : a9 05 __ LDA #$05
6147 : a8 __ __ TAY
6148 : 91 0d __ STA (P0),y ; (settings + 0)
614a : 18 __ __ CLC
614b : a5 0d __ LDA P0 ; (settings + 0)
614d : 69 06 __ ADC #$06
614f : 85 43 __ STA T1 + 0 
6151 : a5 0e __ LDA P1 ; (settings + 1)
6153 : 69 00 __ ADC #$00
6155 : 85 44 __ STA T1 + 1 
6157 : a9 00 __ LDA #$00
6159 : 85 45 __ STA T2 + 0 
615b : 85 46 __ STA T3 + 0 
.l1006:
615d : 85 1b __ STA ACCU + 0 
615f : a9 00 __ LDA #$00
6161 : 85 1c __ STA ACCU + 1 
6163 : 85 04 __ STA WORK + 1 
6165 : a9 14 __ LDA #$14
6167 : 85 03 __ STA WORK + 0 
6169 : 20 8e 64 JSR $648e ; (divmod + 0)
616c : a5 05 __ LDA WORK + 2 
616e : 0a __ __ ASL
616f : 0a __ __ ASL
6170 : 85 48 __ STA T6 + 0 
6172 : a5 1b __ LDA ACCU + 0 
6174 : 85 47 __ STA T5 + 0 
6176 : 0a __ __ ASL
6177 : a8 __ __ TAY
6178 : a5 1c __ LDA ACCU + 1 
617a : 2a __ __ ROL
617b : aa __ __ TAX
617c : 98 __ __ TYA
617d : 18 __ __ CLC
617e : 65 1b __ ADC ACCU + 0 
6180 : a8 __ __ TAY
6181 : 8a __ __ TXA
6182 : 65 1c __ ADC ACCU + 1 
6184 : 85 1b __ STA ACCU + 0 
6186 : 98 __ __ TYA
6187 : 0a __ __ ASL
6188 : 26 1b __ ROL ACCU + 0 
618a : 0a __ __ ASL
618b : 26 1b __ ROL ACCU + 0 
618d : 0a __ __ ASL
618e : 26 1b __ ROL ACCU + 0 
6190 : 18 __ __ CLC
6191 : 65 47 __ ADC T5 + 0 
6193 : 85 47 __ STA T5 + 0 
6195 : a5 1b __ LDA ACCU + 0 
6197 : 65 1c __ ADC ACCU + 1 
6199 : 06 47 __ ASL T5 + 0 
619b : 2a __ __ ROL
619c : 06 47 __ ASL T5 + 0 
619e : 2a __ __ ROL
619f : 06 47 __ ASL T5 + 0 
61a1 : 2a __ __ ROL
61a2 : 06 47 __ ASL T5 + 0 
61a4 : 2a __ __ ROL
61a5 : aa __ __ TAX
61a6 : 18 __ __ CLC
61a7 : a5 47 __ LDA T5 + 0 
61a9 : 65 48 __ ADC T6 + 0 
61ab : a4 46 __ LDY T3 + 0 
61ad : 91 43 __ STA (T1 + 0),y 
61af : 8a __ __ TXA
61b0 : 69 a0 __ ADC #$a0
61b2 : c8 __ __ INY
61b3 : 91 43 __ STA (T1 + 0),y 
61b5 : c8 __ __ INY
61b6 : 84 46 __ STY T3 + 0 
61b8 : e6 45 __ INC T2 + 0 
61ba : a5 45 __ LDA T2 + 0 
61bc : c9 5b __ CMP #$5b
61be : 90 9d __ BCC $615d ; (txtscr_bigfont_init.l1006 + 0)
.s4:
61c0 : a5 0d __ LDA P0 ; (settings + 0)
61c2 : 69 bb __ ADC #$bb
61c4 : 85 0d __ STA P0 ; (settings + 0)
61c6 : 90 02 __ BCC $61ca ; (txtscr_bigfont_init.s1011 + 0)
.s1010:
61c8 : e6 0e __ INC P1 ; (settings + 1)
.s1011:
61ca : a0 00 __ LDY #$00
.l1008:
61cc : b1 0f __ LDA (P2),y ; (color + 0)
61ce : 91 0d __ STA (P0),y ; (settings + 0)
61d0 : c8 __ __ INY
61d1 : c0 05 __ CPY #$05
61d3 : 90 f7 __ BCC $61cc ; (txtscr_bigfont_init.l1008 + 0)
.s1001:
61d5 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_checkch: ; vdcwin_checkch()->i16
.s0:
61d6 : 20 e4 ff JSR $ffe4 
61d9 : 85 1b __ STA ACCU + 0 
61db : a9 00 __ LDA #$00
61dd : 85 1c __ STA ACCU + 1 
.s1001:
61df : 60 __ __ RTS
--------------------------------------------------------------------
txtscr_scroll_do: ; txtscr_scroll_do(struct TXTSCRScrollText*)->void
.s0:
61e0 : ad f7 bf LDA $bff7 ; (sstack + 0)
61e3 : 85 50 __ STA T0 + 0 
61e5 : 18 __ __ CLC
61e6 : 69 04 __ ADC #$04
61e8 : 85 16 __ STA P9 
61ea : ad f8 bf LDA $bff8 ; (sstack + 1)
61ed : 85 51 __ STA T0 + 1 
61ef : 69 00 __ ADC #$00
61f1 : 85 17 __ STA P10 
61f3 : 20 60 58 JSR $5860 ; (vdcwin_scroll_left.s0 + 0)
61f6 : 4c 00 62 JMP $6200 ; (txtscr_scroll_do.l1 + 0)
.s3:
61f9 : a0 0e __ LDY #$0e
61fb : 91 50 __ STA (T0 + 0),y 
61fd : c8 __ __ INY
61fe : 91 50 __ STA (T0 + 0),y 
.l1:
6200 : a0 00 __ LDY #$00
6202 : b1 50 __ LDA (T0 + 0),y 
6204 : 18 __ __ CLC
6205 : a0 0e __ LDY #$0e
6207 : 71 50 __ ADC (T0 + 0),y 
6209 : 85 1b __ STA ACCU + 0 
620b : a0 01 __ LDY #$01
620d : b1 50 __ LDA (T0 + 0),y 
620f : a0 0f __ LDY #$0f
6211 : 71 50 __ ADC (T0 + 0),y 
6213 : 85 1c __ STA ACCU + 1 
6215 : a0 00 __ LDY #$00
6217 : b1 1b __ LDA (ACCU + 0),y 
6219 : f0 de __ BEQ $61f9 ; (txtscr_scroll_do.s3 + 0)
.s2:
621b : 85 13 __ STA P6 
621d : a0 05 __ LDY #$05
621f : b1 50 __ LDA (T0 + 0),y 
6221 : 85 15 __ STA P8 
6223 : a0 02 __ LDY #$02
6225 : b1 50 __ LDA (T0 + 0),y 
6227 : 85 11 __ STA P4 
6229 : c8 __ __ INY
622a : b1 50 __ LDA (T0 + 0),y 
622c : 85 12 __ STA P5 
622e : c8 __ __ INY
622f : b1 50 __ LDA (T0 + 0),y 
6231 : 18 __ __ CLC
6232 : a0 06 __ LDY #$06
6234 : 71 50 __ ADC (T0 + 0),y 
6236 : 38 __ __ SEC
6237 : e9 01 __ SBC #$01
6239 : 85 14 __ STA P7 
623b : a0 10 __ LDY #$10
623d : b1 50 __ LDA (T0 + 0),y 
623f : 85 16 __ STA P9 
6241 : 20 7b 62 JSR $627b ; (txtscr_bigfont_printchar.s0 + 0)
6244 : a6 16 __ LDX P9 
6246 : e8 __ __ INX
6247 : 8a __ __ TXA
6248 : a0 10 __ LDY #$10
624a : 91 50 __ STA (T0 + 0),y 
624c : a0 04 __ LDY #$04
624e : b1 11 __ LDA (P4),y 
6250 : 38 __ __ SEC
6251 : e9 01 __ SBC #$01
6253 : a8 __ __ TAY
6254 : a9 00 __ LDA #$00
6256 : e9 00 __ SBC #$00
6258 : 30 0a __ BMI $6264 ; (txtscr_scroll_do.s6 + 0)
.s1004:
625a : c9 00 __ CMP #$00
625c : d0 1c __ BNE $627a ; (txtscr_scroll_do.s1001 + 0)
.s1002:
625e : 86 43 __ STX T2 + 0 
6260 : c4 43 __ CPY T2 + 0 
6262 : b0 16 __ BCS $627a ; (txtscr_scroll_do.s1001 + 0)
.s6:
6264 : a9 00 __ LDA #$00
6266 : a0 10 __ LDY #$10
6268 : 91 50 __ STA (T0 + 0),y 
626a : 18 __ __ CLC
626b : a0 0e __ LDY #$0e
626d : b1 50 __ LDA (T0 + 0),y 
626f : 69 01 __ ADC #$01
6271 : 91 50 __ STA (T0 + 0),y 
6273 : c8 __ __ INY
6274 : b1 50 __ LDA (T0 + 0),y 
6276 : 69 00 __ ADC #$00
6278 : 91 50 __ STA (T0 + 0),y 
.s1001:
627a : 60 __ __ RTS
--------------------------------------------------------------------
txtscr_bigfont_printchar: ; txtscr_bigfont_printchar(struct TXTSCRBigFont*,u8,u8,u8,u8)->void
.s0:
627b : 18 __ __ CLC
627c : a5 11 __ LDA P4 ; (settings + 0)
627e : 69 bc __ ADC #$bc
6280 : 85 44 __ STA T2 + 0 
6282 : a5 12 __ LDA P5 ; (settings + 1)
6284 : 69 00 __ ADC #$00
6286 : 85 45 __ STA T2 + 1 
6288 : a5 13 __ LDA P6 ; (ch + 0)
628a : 0a __ __ ASL
628b : aa __ __ TAX
628c : a9 00 __ LDA #$00
628e : 85 43 __ STA T0 + 0 
6290 : 2a __ __ ROL
6291 : a8 __ __ TAY
6292 : 8a __ __ TXA
6293 : 38 __ __ SEC
6294 : e9 40 __ SBC #$40
6296 : b0 01 __ BCS $6299 ; (txtscr_bigfont_printchar.s1005 + 0)
.s1004:
6298 : 88 __ __ DEY
.s1005:
6299 : 18 __ __ CLC
629a : 65 11 __ ADC P4 ; (settings + 0)
629c : 85 46 __ STA T4 + 0 
629e : 98 __ __ TYA
629f : 65 12 __ ADC P5 ; (settings + 1)
62a1 : 85 47 __ STA T4 + 1 
62a3 : a0 06 __ LDY #$06
62a5 : b1 46 __ LDA (T4 + 0),y 
62a7 : aa __ __ TAX
62a8 : c8 __ __ INY
62a9 : b1 46 __ LDA (T4 + 0),y 
62ab : 86 46 __ STX T4 + 0 
62ad : 4c eb 62 JMP $62eb ; (txtscr_bigfont_printchar.l1 + 0)
.s2:
62b0 : a0 01 __ LDY #$01
62b2 : b1 11 __ LDA (P4),y ; (settings + 0)
62b4 : 85 0d __ STA P0 
62b6 : a5 46 __ LDA T4 + 0 
62b8 : 65 16 __ ADC P9 ; (col + 0)
62ba : 85 0e __ STA P1 
62bc : a5 47 __ LDA T4 + 1 
62be : 69 00 __ ADC #$00
62c0 : 85 0f __ STA P2 
62c2 : 20 1e 15 JSR $151e ; (bnk_readb.s0 + 0)
62c5 : 85 0f __ STA P2 
62c7 : a4 43 __ LDY T0 + 0 
62c9 : b1 44 __ LDA (T2 + 0),y 
62cb : 85 10 __ STA P3 
62cd : a5 14 __ LDA P7 ; (x + 0)
62cf : 85 0d __ STA P0 
62d1 : 18 __ __ CLC
62d2 : a5 15 __ LDA P8 ; (y + 0)
62d4 : 65 43 __ ADC T0 + 0 
62d6 : 85 0e __ STA P1 
62d8 : 20 34 35 JSR $3534 ; (vdc_printc.s0 + 0)
62db : a5 46 __ LDA T4 + 0 
62dd : 18 __ __ CLC
62de : a0 02 __ LDY #$02
62e0 : 71 11 __ ADC (P4),y ; (settings + 0)
62e2 : 85 46 __ STA T4 + 0 
62e4 : a5 47 __ LDA T4 + 1 
62e6 : c8 __ __ INY
62e7 : 71 11 __ ADC (P4),y ; (settings + 0)
62e9 : e6 43 __ INC T0 + 0 
.l1:
62eb : 85 47 __ STA T4 + 1 
62ed : a5 43 __ LDA T0 + 0 
62ef : a0 05 __ LDY #$05
62f1 : d1 11 __ CMP (P4),y ; (settings + 0)
62f3 : 90 bb __ BCC $62b0 ; (txtscr_bigfont_printchar.s2 + 0)
.s1001:
62f5 : 60 __ __ RTS
--------------------------------------------------------------------
charset_demo: ; charset_demo()->void
.s1000:
62f6 : a5 53 __ LDA T0 + 0 
62f8 : 8d b6 bf STA $bfb6 ; (bigfont + 159)
.s0:
62fb : a9 18 __ LDA #$18
62fd : 8d 00 d6 STA $d600 
.l63:
6300 : 2c 00 d6 BIT $d600 
6303 : 10 fb __ BPL $6300 ; (charset_demo.l63 + 0)
.s5:
6305 : ad 01 d6 LDA $d601 
6308 : 85 53 __ STA T0 + 0 
630a : a9 00 __ LDA #$00
630c : 85 0f __ STA P2 
630e : a9 20 __ LDA #$20
6310 : 85 11 __ STA P4 
6312 : a9 50 __ LDA #$50
6314 : 85 13 __ STA P6 
6316 : a9 02 __ LDA #$02
6318 : 85 14 __ STA P7 
631a : ae e9 6c LDX $6ce9 ; (vdc_state + 5)
631d : ca __ __ DEX
631e : ca __ __ DEX
631f : 86 15 __ STX P8 
6321 : 20 54 21 JSR $2154 ; (vdc_clear.s0 + 0)
6324 : a9 02 __ LDA #$02
6326 : 8d fc bf STA $bffc ; (sstack + 5)
6329 : a9 00 __ LDA #$00
632b : 8d fd bf STA $bffd ; (sstack + 6)
632e : 8d fe bf STA $bffe ; (sstack + 7)
6331 : 20 3a 54 JSR $543a ; (screen_switch.s1000 + 0)
6334 : a9 7f __ LDA #$7f
6336 : 85 11 __ STA P4 
6338 : a9 01 __ LDA #$01
633a : 85 15 __ STA P8 
633c : ad f4 6c LDA $6cf4 ; (vdc_state + 16)
633f : 85 0f __ STA P2 
6341 : ad f5 6c LDA $6cf5 ; (vdc_state + 17)
6344 : 85 10 __ STA P3 
6346 : a9 00 __ LDA #$00
6348 : 85 14 __ STA P7 
634a : 85 12 __ STA P5 
634c : a9 a0 __ LDA #$a0
634e : 85 13 __ STA P6 
6350 : 20 00 13 JSR $1300 ; (bnk_redef_charset.s0 + 0)
6353 : a9 7f __ LDA #$7f
6355 : 8d b8 bf STA $bfb8 ; (bigfont + 161)
6358 : a9 00 __ LDA #$00
635a : 85 0f __ STA P2 
635c : 8d bc bf STA $bfbc ; (bigfont + 165)
635f : 8d be bf STA $bfbe ; (bigfont + 167)
6362 : 8d bf bf STA $bfbf ; (bigfont + 168)
6365 : 8d c0 bf STA $bfc0 ; (bigfont + 169)
6368 : 8d c1 bf STA $bfc1 ; (bigfont + 170)
636b : 8d c2 bf STA $bfc2 ; (bigfont + 171)
636e : a9 19 __ LDA #$19
6370 : 8d bd bf STA $bfbd ; (bigfont + 166)
6373 : a9 50 __ LDA #$50
6375 : 8d bb bf STA $bfbb ; (bigfont + 164)
6378 : 85 11 __ STA P4 
637a : ad ea 6c LDA $6cea ; (vdc_state + 6)
637d : 85 44 __ STA T1 + 1 
637f : d0 07 __ BNE $6388 ; (charset_demo.s32 + 0)
.s1004:
6381 : a9 19 __ LDA #$19
6383 : cd e9 6c CMP $6ce9 ; (vdc_state + 5)
6386 : b0 04 __ BCS $638c ; (charset_demo.s33 + 0)
.s32:
6388 : a9 19 __ LDA #$19
638a : d0 02 __ BNE $638e ; (charset_demo.s34 + 0)
.s33:
638c : a9 17 __ LDA #$17
.s34:
638e : 85 12 __ STA P5 
6390 : a9 00 __ LDA #$00
6392 : 8d b9 bf STA $bfb9 ; (bigfont + 162)
6395 : a9 40 __ LDA #$40
6397 : 8d ba bf STA $bfba ; (bigfont + 163)
639a : a9 c3 __ LDA #$c3
639c : 85 0d __ STA P0 
639e : a9 bf __ LDA #$bf
63a0 : 85 0e __ STA P1 
63a2 : 46 44 __ LSR T1 + 1 
63a4 : ad e9 6c LDA $6ce9 ; (vdc_state + 5)
63a7 : 6a __ __ ROR
63a8 : 38 __ __ SEC
63a9 : e9 0a __ SBC #$0a
63ab : 85 10 __ STA P3 
63ad : 20 8d 32 JSR $328d ; (vdcwin_init.s0 + 0)
63b0 : a9 b8 __ LDA #$b8
63b2 : 85 16 __ STA P9 
63b4 : a9 bf __ LDA #$bf
63b6 : 85 17 __ STA P10 
63b8 : 20 b5 38 JSR $38b5 ; (vdcwin_cpy_viewport.s0 + 0)
63bb : a9 2f __ LDA #$2f
63bd : 85 0f __ STA P2 
63bf : a9 02 __ LDA #$02
63c1 : 85 11 __ STA P4 
63c3 : a9 64 __ LDA #$64
63c5 : 85 12 __ STA P5 
63c7 : 20 a3 67 JSR $67a3 ; (vdc_prints_attr@proxy + 0)
63ca : a9 46 __ LDA #$46
63cc : 85 0f __ STA P2 
63ce : e6 10 __ INC P3 
63d0 : 20 98 67 JSR $6798 ; (vdc_prints_attr@proxy + 0)
63d3 : 20 a4 29 JSR $29a4 ; (getch.s0 + 0)
63d6 : a9 18 __ LDA #$18
63d8 : 8d 00 d6 STA $d600 
63db : a5 53 __ LDA T0 + 0 
63dd : 29 f0 __ AND #$f0
.l66:
63df : 2c 00 d6 BIT $d600 
63e2 : 10 fb __ BPL $63df ; (charset_demo.l66 + 0)
.s15:
63e4 : 8d 01 d6 STA $d601 
63e7 : 20 6a 2d JSR $2d6a ; (vdc_restore_charsets.s0 + 0)
63ea : a9 02 __ LDA #$02
63ec : 8d fc bf STA $bffc ; (sstack + 5)
63ef : a9 01 __ LDA #$01
63f1 : 8d fd bf STA $bffd ; (sstack + 6)
63f4 : a9 00 __ LDA #$00
63f6 : 8d fe bf STA $bffe ; (sstack + 7)
63f9 : 20 3a 54 JSR $543a ; (screen_switch.s1000 + 0)
.s1001:
63fc : ad b6 bf LDA $bfb6 ; (bigfont + 159)
63ff : 85 53 __ STA T0 + 0 
6401 : 60 __ __ RTS
--------------------------------------------------------------------
6402 : __ __ __ BYT 67 52 41 50 48 49 43 53 20 46 52 4f 4d 20 52 45 : gRAPHICS FROM RE
6412 : __ __ __ BYT 44 45 46 49 4e 49 4e 47 20 43 48 41 52 53 45 54 : DEFINING CHARSET
6422 : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
6424 : __ __ __ BYT 4d 55 53 49 43 25 55 00                         : MUSIC%U.
--------------------------------------------------------------------
mul16by8: ; mul16by8
642c : a0 00 __ LDY #$00
642e : 84 06 __ STY WORK + 3 
6430 : 4a __ __ LSR
6431 : 90 0d __ BCC $6440 ; (mul16by8 + 20)
6433 : aa __ __ TAX
6434 : 18 __ __ CLC
6435 : 98 __ __ TYA
6436 : 65 1b __ ADC ACCU + 0 
6438 : a8 __ __ TAY
6439 : a5 06 __ LDA WORK + 3 
643b : 65 1c __ ADC ACCU + 1 
643d : 85 06 __ STA WORK + 3 
643f : 8a __ __ TXA
6440 : 06 1b __ ASL ACCU + 0 
6442 : 26 1c __ ROL ACCU + 1 
6444 : 4a __ __ LSR
6445 : b0 ec __ BCS $6433 ; (mul16by8 + 7)
6447 : d0 f7 __ BNE $6440 ; (mul16by8 + 20)
6449 : 84 05 __ STY WORK + 2 
644b : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
644c : a0 00 __ LDY #$00
644e : 84 06 __ STY WORK + 3 
6450 : a5 03 __ LDA WORK + 0 
6452 : a6 04 __ LDX WORK + 1 
6454 : f0 1c __ BEQ $6472 ; (mul16 + 38)
6456 : 38 __ __ SEC
6457 : 6a __ __ ROR
6458 : 90 0d __ BCC $6467 ; (mul16 + 27)
645a : aa __ __ TAX
645b : 18 __ __ CLC
645c : 98 __ __ TYA
645d : 65 1b __ ADC ACCU + 0 
645f : a8 __ __ TAY
6460 : a5 06 __ LDA WORK + 3 
6462 : 65 1c __ ADC ACCU + 1 
6464 : 85 06 __ STA WORK + 3 
6466 : 8a __ __ TXA
6467 : 06 1b __ ASL ACCU + 0 
6469 : 26 1c __ ROL ACCU + 1 
646b : 4a __ __ LSR
646c : 90 f9 __ BCC $6467 ; (mul16 + 27)
646e : d0 ea __ BNE $645a ; (mul16 + 14)
6470 : a5 04 __ LDA WORK + 1 
6472 : 4a __ __ LSR
6473 : 90 0d __ BCC $6482 ; (mul16 + 54)
6475 : aa __ __ TAX
6476 : 18 __ __ CLC
6477 : 98 __ __ TYA
6478 : 65 1b __ ADC ACCU + 0 
647a : a8 __ __ TAY
647b : a5 06 __ LDA WORK + 3 
647d : 65 1c __ ADC ACCU + 1 
647f : 85 06 __ STA WORK + 3 
6481 : 8a __ __ TXA
6482 : 06 1b __ ASL ACCU + 0 
6484 : 26 1c __ ROL ACCU + 1 
6486 : 4a __ __ LSR
6487 : b0 ec __ BCS $6475 ; (mul16 + 41)
6489 : d0 f7 __ BNE $6482 ; (mul16 + 54)
648b : 84 05 __ STY WORK + 2 
648d : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
648e : a5 1c __ LDA ACCU + 1 
6490 : d0 31 __ BNE $64c3 ; (divmod + 53)
6492 : a5 04 __ LDA WORK + 1 
6494 : d0 1e __ BNE $64b4 ; (divmod + 38)
6496 : 85 06 __ STA WORK + 3 
6498 : a2 04 __ LDX #$04
649a : 06 1b __ ASL ACCU + 0 
649c : 2a __ __ ROL
649d : c5 03 __ CMP WORK + 0 
649f : 90 02 __ BCC $64a3 ; (divmod + 21)
64a1 : e5 03 __ SBC WORK + 0 
64a3 : 26 1b __ ROL ACCU + 0 
64a5 : 2a __ __ ROL
64a6 : c5 03 __ CMP WORK + 0 
64a8 : 90 02 __ BCC $64ac ; (divmod + 30)
64aa : e5 03 __ SBC WORK + 0 
64ac : 26 1b __ ROL ACCU + 0 
64ae : ca __ __ DEX
64af : d0 eb __ BNE $649c ; (divmod + 14)
64b1 : 85 05 __ STA WORK + 2 
64b3 : 60 __ __ RTS
64b4 : a5 1b __ LDA ACCU + 0 
64b6 : 85 05 __ STA WORK + 2 
64b8 : a5 1c __ LDA ACCU + 1 
64ba : 85 06 __ STA WORK + 3 
64bc : a9 00 __ LDA #$00
64be : 85 1b __ STA ACCU + 0 
64c0 : 85 1c __ STA ACCU + 1 
64c2 : 60 __ __ RTS
64c3 : a5 04 __ LDA WORK + 1 
64c5 : d0 1f __ BNE $64e6 ; (divmod + 88)
64c7 : a5 03 __ LDA WORK + 0 
64c9 : 30 1b __ BMI $64e6 ; (divmod + 88)
64cb : a9 00 __ LDA #$00
64cd : 85 06 __ STA WORK + 3 
64cf : a2 10 __ LDX #$10
64d1 : 06 1b __ ASL ACCU + 0 
64d3 : 26 1c __ ROL ACCU + 1 
64d5 : 2a __ __ ROL
64d6 : c5 03 __ CMP WORK + 0 
64d8 : 90 02 __ BCC $64dc ; (divmod + 78)
64da : e5 03 __ SBC WORK + 0 
64dc : 26 1b __ ROL ACCU + 0 
64de : 26 1c __ ROL ACCU + 1 
64e0 : ca __ __ DEX
64e1 : d0 f2 __ BNE $64d5 ; (divmod + 71)
64e3 : 85 05 __ STA WORK + 2 
64e5 : 60 __ __ RTS
64e6 : a9 00 __ LDA #$00
64e8 : 85 05 __ STA WORK + 2 
64ea : 85 06 __ STA WORK + 3 
64ec : 84 02 __ STY $02 
64ee : a0 10 __ LDY #$10
64f0 : 18 __ __ CLC
64f1 : 26 1b __ ROL ACCU + 0 
64f3 : 26 1c __ ROL ACCU + 1 
64f5 : 26 05 __ ROL WORK + 2 
64f7 : 26 06 __ ROL WORK + 3 
64f9 : 38 __ __ SEC
64fa : a5 05 __ LDA WORK + 2 
64fc : e5 03 __ SBC WORK + 0 
64fe : aa __ __ TAX
64ff : a5 06 __ LDA WORK + 3 
6501 : e5 04 __ SBC WORK + 1 
6503 : 90 04 __ BCC $6509 ; (divmod + 123)
6505 : 86 05 __ STX WORK + 2 
6507 : 85 06 __ STA WORK + 3 
6509 : 88 __ __ DEY
650a : d0 e5 __ BNE $64f1 ; (divmod + 99)
650c : 26 1b __ ROL ACCU + 0 
650e : 26 1c __ ROL ACCU + 1 
6510 : a4 02 __ LDY $02 
6512 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
6513 : 84 02 __ STY $02 
6515 : a0 20 __ LDY #$20
6517 : a9 00 __ LDA #$00
6519 : 85 07 __ STA WORK + 4 
651b : 85 08 __ STA WORK + 5 
651d : 85 09 __ STA WORK + 6 
651f : 85 0a __ STA WORK + 7 
6521 : a5 05 __ LDA WORK + 2 
6523 : 05 06 __ ORA WORK + 3 
6525 : d0 39 __ BNE $6560 ; (divmod32 + 77)
6527 : 18 __ __ CLC
6528 : 26 1b __ ROL ACCU + 0 
652a : 26 1c __ ROL ACCU + 1 
652c : 26 1d __ ROL ACCU + 2 
652e : 26 1e __ ROL ACCU + 3 
6530 : 26 07 __ ROL WORK + 4 
6532 : 26 08 __ ROL WORK + 5 
6534 : 90 0c __ BCC $6542 ; (divmod32 + 47)
6536 : a5 07 __ LDA WORK + 4 
6538 : e5 03 __ SBC WORK + 0 
653a : aa __ __ TAX
653b : a5 08 __ LDA WORK + 5 
653d : e5 04 __ SBC WORK + 1 
653f : 38 __ __ SEC
6540 : b0 0c __ BCS $654e ; (divmod32 + 59)
6542 : 38 __ __ SEC
6543 : a5 07 __ LDA WORK + 4 
6545 : e5 03 __ SBC WORK + 0 
6547 : aa __ __ TAX
6548 : a5 08 __ LDA WORK + 5 
654a : e5 04 __ SBC WORK + 1 
654c : 90 04 __ BCC $6552 ; (divmod32 + 63)
654e : 86 07 __ STX WORK + 4 
6550 : 85 08 __ STA WORK + 5 
6552 : 88 __ __ DEY
6553 : d0 d3 __ BNE $6528 ; (divmod32 + 21)
6555 : 26 1b __ ROL ACCU + 0 
6557 : 26 1c __ ROL ACCU + 1 
6559 : 26 1d __ ROL ACCU + 2 
655b : 26 1e __ ROL ACCU + 3 
655d : a4 02 __ LDY $02 
655f : 60 __ __ RTS
6560 : 18 __ __ CLC
6561 : 26 1b __ ROL ACCU + 0 
6563 : 26 1c __ ROL ACCU + 1 
6565 : 26 1d __ ROL ACCU + 2 
6567 : 26 1e __ ROL ACCU + 3 
6569 : 26 07 __ ROL WORK + 4 
656b : 26 08 __ ROL WORK + 5 
656d : 26 09 __ ROL WORK + 6 
656f : 26 0a __ ROL WORK + 7 
6571 : a5 07 __ LDA WORK + 4 
6573 : c5 03 __ CMP WORK + 0 
6575 : a5 08 __ LDA WORK + 5 
6577 : e5 04 __ SBC WORK + 1 
6579 : a5 09 __ LDA WORK + 6 
657b : e5 05 __ SBC WORK + 2 
657d : a5 0a __ LDA WORK + 7 
657f : e5 06 __ SBC WORK + 3 
6581 : 90 18 __ BCC $659b ; (divmod32 + 136)
6583 : a5 07 __ LDA WORK + 4 
6585 : e5 03 __ SBC WORK + 0 
6587 : 85 07 __ STA WORK + 4 
6589 : a5 08 __ LDA WORK + 5 
658b : e5 04 __ SBC WORK + 1 
658d : 85 08 __ STA WORK + 5 
658f : a5 09 __ LDA WORK + 6 
6591 : e5 05 __ SBC WORK + 2 
6593 : 85 09 __ STA WORK + 6 
6595 : a5 0a __ LDA WORK + 7 
6597 : e5 06 __ SBC WORK + 3 
6599 : 85 0a __ STA WORK + 7 
659b : 88 __ __ DEY
659c : d0 c3 __ BNE $6561 ; (divmod32 + 78)
659e : 26 1b __ ROL ACCU + 0 
65a0 : 26 1c __ ROL ACCU + 1 
65a2 : 26 1d __ ROL ACCU + 2 
65a4 : 26 1e __ ROL ACCU + 3 
65a6 : a4 02 __ LDY $02 
65a8 : 60 __ __ RTS
--------------------------------------------------------------------
malloc: ; malloc
65a9 : 18 __ __ CLC
65aa : a5 1b __ LDA ACCU + 0 
65ac : 69 02 __ ADC #$02
65ae : 85 03 __ STA WORK + 0 
65b0 : a5 1c __ LDA ACCU + 1 
65b2 : 69 00 __ ADC #$00
65b4 : 85 04 __ STA WORK + 1 
65b6 : ad fc 6d LDA $6dfc ; (HeapNode + 2)
65b9 : d0 1f __ BNE $65da ; (malloc + 49)
65bb : a9 00 __ LDA #$00
65bd : 8d e8 6e STA $6ee8 
65c0 : 8d e9 6e STA $6ee9 
65c3 : ee fc 6d INC $6dfc ; (HeapNode + 2)
65c6 : a9 e8 __ LDA #$e8
65c8 : 8d fa 6d STA $6dfa ; (HeapNode + 0)
65cb : a9 6e __ LDA #$6e
65cd : 8d fb 6d STA $6dfb ; (HeapNode + 1)
65d0 : a9 00 __ LDA #$00
65d2 : 8d ea 6e STA $6eea 
65d5 : a9 b0 __ LDA #$b0
65d7 : 8d eb 6e STA $6eeb 
65da : a9 fa __ LDA #$fa
65dc : a2 6d __ LDX #$6d
65de : 85 1d __ STA ACCU + 2 
65e0 : 86 1e __ STX ACCU + 3 
65e2 : 18 __ __ CLC
65e3 : a0 00 __ LDY #$00
65e5 : b1 1d __ LDA (ACCU + 2),y 
65e7 : 85 1b __ STA ACCU + 0 
65e9 : 65 03 __ ADC WORK + 0 
65eb : 85 05 __ STA WORK + 2 
65ed : c8 __ __ INY
65ee : b1 1d __ LDA (ACCU + 2),y 
65f0 : 85 1c __ STA ACCU + 1 
65f2 : f0 18 __ BEQ $660c ; (malloc + 99)
65f4 : 65 04 __ ADC WORK + 1 
65f6 : 85 06 __ STA WORK + 3 
65f8 : a0 02 __ LDY #$02
65fa : b1 1b __ LDA (ACCU + 0),y 
65fc : c5 05 __ CMP WORK + 2 
65fe : c8 __ __ INY
65ff : b1 1b __ LDA (ACCU + 0),y 
6601 : e5 06 __ SBC WORK + 3 
6603 : b0 08 __ BCS $660d ; (malloc + 100)
6605 : a5 1b __ LDA ACCU + 0 
6607 : a6 1c __ LDX ACCU + 1 
6609 : 4c de 65 JMP $65de ; (malloc + 53)
660c : 60 __ __ RTS
660d : 18 __ __ CLC
660e : a5 05 __ LDA WORK + 2 
6610 : 69 03 __ ADC #$03
6612 : 29 fc __ AND #$fc
6614 : 85 07 __ STA WORK + 4 
6616 : a5 06 __ LDA WORK + 3 
6618 : 69 00 __ ADC #$00
661a : 85 08 __ STA WORK + 5 
661c : a0 02 __ LDY #$02
661e : a5 07 __ LDA WORK + 4 
6620 : d1 1b __ CMP (ACCU + 0),y 
6622 : d0 15 __ BNE $6639 ; (malloc + 144)
6624 : c8 __ __ INY
6625 : a5 08 __ LDA WORK + 5 
6627 : d1 1b __ CMP (ACCU + 0),y 
6629 : d0 0e __ BNE $6639 ; (malloc + 144)
662b : a0 00 __ LDY #$00
662d : b1 1b __ LDA (ACCU + 0),y 
662f : 91 1d __ STA (ACCU + 2),y 
6631 : c8 __ __ INY
6632 : b1 1b __ LDA (ACCU + 0),y 
6634 : 91 1d __ STA (ACCU + 2),y 
6636 : 4c 56 66 JMP $6656 ; (malloc + 173)
6639 : a0 00 __ LDY #$00
663b : b1 1b __ LDA (ACCU + 0),y 
663d : 91 07 __ STA (WORK + 4),y 
663f : a5 07 __ LDA WORK + 4 
6641 : 91 1d __ STA (ACCU + 2),y 
6643 : c8 __ __ INY
6644 : b1 1b __ LDA (ACCU + 0),y 
6646 : 91 07 __ STA (WORK + 4),y 
6648 : a5 08 __ LDA WORK + 5 
664a : 91 1d __ STA (ACCU + 2),y 
664c : c8 __ __ INY
664d : b1 1b __ LDA (ACCU + 0),y 
664f : 91 07 __ STA (WORK + 4),y 
6651 : c8 __ __ INY
6652 : b1 1b __ LDA (ACCU + 0),y 
6654 : 91 07 __ STA (WORK + 4),y 
6656 : a0 00 __ LDY #$00
6658 : a5 05 __ LDA WORK + 2 
665a : 91 1b __ STA (ACCU + 0),y 
665c : c8 __ __ INY
665d : a5 06 __ LDA WORK + 3 
665f : 91 1b __ STA (ACCU + 0),y 
6661 : a5 1b __ LDA ACCU + 0 
6663 : 09 02 __ ORA #$02
6665 : 85 1b __ STA ACCU + 0 
6667 : 60 __ __ RTS
--------------------------------------------------------------------
free: ; free
6668 : a5 1b __ LDA ACCU + 0 
666a : 29 fc __ AND #$fc
666c : 85 1b __ STA ACCU + 0 
666e : 05 1c __ ORA ACCU + 1 
6670 : d0 01 __ BNE $6673 ; (free + 11)
6672 : 60 __ __ RTS
6673 : 18 __ __ CLC
6674 : a0 00 __ LDY #$00
6676 : b1 1b __ LDA (ACCU + 0),y 
6678 : 69 03 __ ADC #$03
667a : 29 fc __ AND #$fc
667c : 85 1d __ STA ACCU + 2 
667e : c8 __ __ INY
667f : b1 1b __ LDA (ACCU + 0),y 
6681 : 69 00 __ ADC #$00
6683 : 85 1e __ STA ACCU + 3 
6685 : a9 fa __ LDA #$fa
6687 : a2 6d __ LDX #$6d
6689 : 85 05 __ STA WORK + 2 
668b : 86 06 __ STX WORK + 3 
668d : a0 01 __ LDY #$01
668f : b1 05 __ LDA (WORK + 2),y 
6691 : f0 28 __ BEQ $66bb ; (free + 83)
6693 : aa __ __ TAX
6694 : 88 __ __ DEY
6695 : b1 05 __ LDA (WORK + 2),y 
6697 : e4 1e __ CPX ACCU + 3 
6699 : 90 ee __ BCC $6689 ; (free + 33)
669b : d0 1e __ BNE $66bb ; (free + 83)
669d : c5 1d __ CMP ACCU + 2 
669f : 90 e8 __ BCC $6689 ; (free + 33)
66a1 : d0 18 __ BNE $66bb ; (free + 83)
66a3 : a0 00 __ LDY #$00
66a5 : b1 1d __ LDA (ACCU + 2),y 
66a7 : 91 1b __ STA (ACCU + 0),y 
66a9 : c8 __ __ INY
66aa : b1 1d __ LDA (ACCU + 2),y 
66ac : 91 1b __ STA (ACCU + 0),y 
66ae : c8 __ __ INY
66af : b1 1d __ LDA (ACCU + 2),y 
66b1 : 91 1b __ STA (ACCU + 0),y 
66b3 : c8 __ __ INY
66b4 : b1 1d __ LDA (ACCU + 2),y 
66b6 : 91 1b __ STA (ACCU + 0),y 
66b8 : 4c d0 66 JMP $66d0 ; (free + 104)
66bb : a0 00 __ LDY #$00
66bd : b1 05 __ LDA (WORK + 2),y 
66bf : 91 1b __ STA (ACCU + 0),y 
66c1 : c8 __ __ INY
66c2 : b1 05 __ LDA (WORK + 2),y 
66c4 : 91 1b __ STA (ACCU + 0),y 
66c6 : c8 __ __ INY
66c7 : a5 1d __ LDA ACCU + 2 
66c9 : 91 1b __ STA (ACCU + 0),y 
66cb : c8 __ __ INY
66cc : a5 1e __ LDA ACCU + 3 
66ce : 91 1b __ STA (ACCU + 0),y 
66d0 : a0 02 __ LDY #$02
66d2 : b1 05 __ LDA (WORK + 2),y 
66d4 : c5 1b __ CMP ACCU + 0 
66d6 : d0 1d __ BNE $66f5 ; (free + 141)
66d8 : c8 __ __ INY
66d9 : b1 05 __ LDA (WORK + 2),y 
66db : c5 1c __ CMP ACCU + 1 
66dd : d0 16 __ BNE $66f5 ; (free + 141)
66df : a0 00 __ LDY #$00
66e1 : b1 1b __ LDA (ACCU + 0),y 
66e3 : 91 05 __ STA (WORK + 2),y 
66e5 : c8 __ __ INY
66e6 : b1 1b __ LDA (ACCU + 0),y 
66e8 : 91 05 __ STA (WORK + 2),y 
66ea : c8 __ __ INY
66eb : b1 1b __ LDA (ACCU + 0),y 
66ed : 91 05 __ STA (WORK + 2),y 
66ef : c8 __ __ INY
66f0 : b1 1b __ LDA (ACCU + 0),y 
66f2 : 91 05 __ STA (WORK + 2),y 
66f4 : 60 __ __ RTS
66f5 : a0 00 __ LDY #$00
66f7 : a5 1b __ LDA ACCU + 0 
66f9 : 91 05 __ STA (WORK + 2),y 
66fb : c8 __ __ INY
66fc : a5 1c __ LDA ACCU + 1 
66fe : 91 05 __ STA (WORK + 2),y 
6700 : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
6701 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
__multab13L:
6707 : __ __ __ BYT 00 0d 1a 27                                     : ...'
--------------------------------------------------------------------
__multab9L:
670b : __ __ __ BYT 00 09 12 1b 24 2d 36                            : ....$-6
--------------------------------------------------------------------
__multab102L:
6712 : __ __ __ BYT 00 66 cc 32 98 fe 64 ca                         : .f.2..d.
--------------------------------------------------------------------
__multab102H:
671a : __ __ __ BYT 00 00 00 01 01 01 02 02                         : ........
--------------------------------------------------------------------
__multab6L:
6722 : __ __ __ BYT 00 06 0c 12 18                                  : .....
--------------------------------------------------------------------
__multab15L:
6727 : __ __ __ BYT 00 0f 1e 2d 3c                                  : ...-<
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
672c : a5 4c __ LDA $4c 
672e : 85 11 __ STA P4 
6730 : a5 4d __ LDA $4d 
6732 : 85 12 __ STA P5 
6734 : 4c 75 46 JMP $4675 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
6737 : a5 11 __ LDA P4 
6739 : 85 0f __ STA P2 
673b : 4c 75 46 JMP $4675 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
673e : a5 53 __ LDA $53 
6740 : 85 11 __ STA P4 
6742 : a5 54 __ LDA $54 
6744 : 85 12 __ STA P5 
6746 : 4c 75 46 JMP $4675 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
6749 : a5 4d __ LDA $4d 
674b : 85 11 __ STA P4 
674d : a5 4e __ LDA $4e 
674f : 85 12 __ STA P5 
6751 : 4c 75 46 JMP $4675 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
6754 : a5 51 __ LDA $51 
6756 : 85 11 __ STA P4 
6758 : a5 52 __ LDA $52 
675a : 85 12 __ STA P5 
675c : 4c 75 46 JMP $4675 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
675f : a5 46 __ LDA $46 
6761 : 85 13 __ STA P6 
6763 : a9 00 __ LDA #$00
6765 : 85 14 __ STA P7 
6767 : 4c 75 46 JMP $4675 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
676a : a9 0a __ LDA #$0a
676c : 85 0f __ STA P2 
676e : a9 09 __ LDA #$09
6770 : 85 10 __ STA P3 
6772 : a9 8d __ LDA #$8d
6774 : 85 13 __ STA P6 
6776 : 4c 9b 2e JMP $2e9b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
6779 : a9 00 __ LDA #$00
677b : 85 0f __ STA P2 
677d : a9 90 __ LDA #$90
677f : 85 11 __ STA P4 
6781 : a9 6e __ LDA #$6e
6783 : 85 12 __ STA P5 
6785 : a5 54 __ LDA $54 
6787 : 85 13 __ STA P6 
6789 : 4c 9b 2e JMP $2e9b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
678c : a9 00 __ LDA #$00
678e : 85 0f __ STA P2 
6790 : ad eb 6c LDA $6ceb ; (vdc_state + 7)
6793 : 85 13 __ STA P6 
6795 : 4c 9b 2e JMP $2e9b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
6798 : a9 cd __ LDA #$cd
679a : 85 11 __ STA P4 
679c : a9 35 __ LDA #$35
679e : 85 12 __ STA P5 
67a0 : 4c 9b 2e JMP $2e9b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
67a3 : a9 03 __ LDA #$03
67a5 : 85 10 __ STA P3 
67a7 : ad eb 6c LDA $6ceb ; (vdc_state + 7)
67aa : 85 13 __ STA P6 
67ac : 4c 9b 2e JMP $2e9b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
67af : a9 90 __ LDA #$90
67b1 : 85 11 __ STA P4 
67b3 : a9 6e __ LDA #$6e
67b5 : 85 12 __ STA P5 
67b7 : a9 8d __ LDA #$8d
67b9 : 85 13 __ STA P6 
67bb : 4c 9b 2e JMP $2e9b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
67be : a5 44 __ LDA $44 
67c0 : 85 0e __ STA P1 
67c2 : 4c 2e 22 JMP $222e ; (vdc_mem_addr.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
67c5 : a9 00 __ LDA #$00
67c7 : 85 0f __ STA P2 
67c9 : a9 20 __ LDA #$20
67cb : 85 11 __ STA P4 
67cd : a9 50 __ LDA #$50
67cf : 85 13 __ STA P6 
67d1 : a9 03 __ LDA #$03
67d3 : 85 14 __ STA P7 
67d5 : a9 02 __ LDA #$02
67d7 : 85 15 __ STA P8 
67d9 : 4c 54 21 JMP $2154 ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
winStyles:
67dc : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
67ec : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
pulldown_options:
67ee : __ __ __ BYT 03 02 02 03 01 04 02 06                         : ........
--------------------------------------------------------------------
p2smap:
67f6 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
vdc_modes:
6800 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
6810 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
6820 : __ __ __ BYT e7 24 7e ff 50 00 32 00 00 00 00 00 10 00 40 00 : .$~.P.2.......@.
6830 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
6840 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
6850 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
6860 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
6870 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
6880 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
6890 : __ __ __ BYT 50 00 32 00 00 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
68a0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
68b0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
68c0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
68d0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
68d8 : __ __ __ BYT 46 4c 49 45 53 00 4a 55 4d 50 53 00 53 4c 45 45 : FLIES.JUMPS.SLEE
68e8 : __ __ __ BYT 50 53 45 41 54 53 00 00 57 41 4c 4b 53 00       : PSEATS..WALKS.
--------------------------------------------------------------------
s2pmap:
68f6 : __ __ __ BYT 40 00 20 c0 c0 80 a0 40                         : @. ....@
--------------------------------------------------------------------
menubar:
6900 : __ __ __ BYT 73 45 54 54 49 4e 47 53 00 77 49 4e 44 4f 57 53 : sETTINGS.wINDOWS
6910 : __ __ __ BYT 00 00 76 49 45 57 50 4f 52 54 00 73 43 52 4f 4c : ..vIEWPORT.sCROL
6920 : __ __ __ BYT 4c 00 00 00 63 48 41 52 53 45 54 00 00 6d 55 53 : L...cHARSET..mUS
6930 : __ __ __ BYT 49 43 00 00 00 00 00 00 00 00 00 00 01          : IC...........
--------------------------------------------------------------------
pulldown_titles:
693d : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 00 00 00 00 00 00 : sCREENMODE......
694d : __ __ __ BYT 00 69 4e 46 4f 20 20 20 20 20 20 00 00 00 00 00 : .iNFO      .....
695d : __ __ __ BYT 00 00 65 58 49 54 20 20 20 20 20 20 00 00 00 00 : ..eXIT      ....
696d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
697d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
698d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
699d : __ __ __ BYT 00 00 00 00 00 00 77 49 4e 44 4f 57 20 4f 4e 20 : ......wINDOW ON 
69ad : __ __ __ BYT 57 49 4e 44 4f 57 00 74 45 58 54 20 45 4e 54 52 : WINDOW.tEXT ENTR
69bd : __ __ __ BYT 59 20 20 20 20 20 20 00 00 00 00 00 00 00 00 00 : Y      .........
69cd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
69dd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
69ed : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
69fd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 73 43 52 45 : ............sCRE
6a0d : __ __ __ BYT 45 4e 20 31 00 00 00 00 00 00 00 00 00 73 43 52 : EN 1.........sCR
6a1d : __ __ __ BYT 45 45 4e 20 32 00 00 00 00 00 00 00 00 00 00 00 : EEN 2...........
6a2d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a3d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a4d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a5d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a6d : __ __ __ BYT 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 31 00 00 : ..fULLSCREEN 1..
6a7d : __ __ __ BYT 00 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 32 00 : ...fULLSCREEN 2.
6a8d : __ __ __ BYT 00 00 00 00 62 49 47 46 4f 4e 54 20 54 45 58 54 : ....bIGFONT TEXT
6a9d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6aad : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6abd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6acd : __ __ __ BYT 00 00 00 00 00 00 00 00 63 48 41 52 53 45 54 20 : ........cHARSET 
6add : __ __ __ BYT 44 45 4d 4f 00 00 00 00 00 00 00 00 00 00 00 00 : DEMO............
6aed : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6afd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b0d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b1d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b2d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 75 4c : ..............uL
6b3d : __ __ __ BYT 54 49 4d 41 54 45 20 61 58 45 4c 20 66 00 00 66 : TIMATE aXEL f..f
6b4d : __ __ __ BYT 41 44 45 44 20 20 20 20 20 20 20 20 20 20 00 00 : ADED          ..
6b5d : __ __ __ BYT 73 54 4f 50 20 4d 55 53 49 43 20 20 20 20 20 00 : sTOP MUSIC     .
6b6d : __ __ __ BYT 00 72 45 53 54 41 52 54 20 4d 55 53 49 43 20 20 : .rESTART MUSIC  
6b7d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b8d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b9d : __ __ __ BYT 00 00 00 00 79 45 53 00 00 00 00 00 00 00 00 00 : ....yES.........
6bad : __ __ __ BYT 00 00 00 00 00 6e 4f 20 00 00 00 00 00 00 00 00 : .....nO ........
6bbd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6bcd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6bdd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6bed : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6bfd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 70 61 6c 20 20 38 : ..........pal  8
6c0d : __ __ __ BYT 30 58 32 35 00 00 00 00 00 00 00 70 61 6c 20 20 : 0X25.......pal  
6c1d : __ __ __ BYT 38 30 58 35 30 00 00 00 00 00 00 00 70 61 6c 20 : 80X50.......pal 
6c2d : __ __ __ BYT 20 38 30 58 37 30 00 00 00 00 00 00 00 6e 74 73 :  80X70.......nts
6c3d : __ __ __ BYT 63 20 38 30 58 32 35 00 00 00 00 00 00 00 6e 74 : c 80X25.......nt
6c4d : __ __ __ BYT 73 63 20 38 30 58 35 30 00 00 00 00 00 00 00 6e : sc 80X50.......n
6c5d : __ __ __ BYT 74 73 63 20 38 30 58 36 30 00 00 00 00 00 00 00 : tsc 80X60.......
--------------------------------------------------------------------
6c6d : __ __ __ BYT 42 4c 55 45 20 4a 41 59 00 00 00 00 00 00 00 43 : BLUE JAY.......C
6c7d : __ __ __ BYT 41 52 44 49 4e 41 4c 00 00 00 00 00 00 00 45 41 : ARDINAL.......EA
6c8d : __ __ __ BYT 53 54 45 52 4e 20 50 48 4f 45 42 45 00 47 52 41 : STERN PHOEBE.GRA
6c9d : __ __ __ BYT 43 4b 4c 45 00 00 00 00 00 00 00 00 53 41 4e 44 : CKLE........SAND
6cad : __ __ __ BYT 48 49 4c 4c 20 43 52 41 4e 45 00                : HILL CRANE.
--------------------------------------------------------------------
6cb8 : __ __ __ BYT 42 49 47 00 00 00 53 4d 41 4c 4c 00 41 4e 47 52 : BIG...SMALL.ANGR
6cc8 : __ __ __ BYT 59 00 57 45 54 00 00 00 48 41 50 50 59 00       : Y.WET...HAPPY.
--------------------------------------------------------------------
screenset:
6cd6 : __ __ __ BYT 50 96 a0 4b 50 19                               : P..KP.
--------------------------------------------------------------------
winCfg:
6cdc : __ __ __ BSS	8
--------------------------------------------------------------------
vdc_state:
6ce4 : __ __ __ BSS	25
--------------------------------------------------------------------
6d00 : __ __ __ BYT 77 45 4c 43 4f 4d 45 20 54 4f 20 6f 53 43 41 52 : wELCOME TO oSCAR
6d10 : __ __ __ BYT 36 34 20 76 64 63 20 64 45 4d 4f 2e 20 74 48 49 : 64 vdc dEMO. tHI
6d20 : __ __ __ BYT 53 20 44 45 4d 4f 20 49 53 20 57 52 49 54 54 45 : S DEMO IS WRITTE
6d30 : __ __ __ BYT 4e 20 54 4f 20 54 45 53 54 20 41 4e 44 20 44 45 : N TO TEST AND DE
6d40 : __ __ __ BYT 4d 4f 4e 53 54 52 41 54 45 20 54 48 45 20 76 64 : MONSTRATE THE vd
6d50 : __ __ __ BYT 63 20 4c 49 42 52 41 52 59 20 46 55 4e 43 54 49 : c LIBRARY FUNCTI
6d60 : __ __ __ BYT 4f 4e 53 20 69 20 48 41 56 45 20 54 52 49 45 44 : ONS i HAVE TRIED
6d70 : __ __ __ BYT 20 54 4f 20 42 55 49 4c 44 20 46 4f 52 20 54 48 :  TO BUILD FOR TH
6d80 : __ __ __ BYT 45 20 6f 53 43 41 52 36 34 20 43 4f 4d 50 49 4c : E oSCAR64 COMPIL
6d90 : __ __ __ BYT 45 52 2e 20 68 4f 50 45 20 59 4f 55 20 45 4e 4a : ER. hOPE YOU ENJ
6da0 : __ __ __ BYT 4f 59 20 49 54 21 20 67 52 45 45 54 49 4e 47 53 : OY IT! gREETINGS
6db0 : __ __ __ BYT 2c 20 78 41 4e 44 45 52 20 6d 4f 4c 2e 20 20 20 : , xANDER mOL.   
6dc0 : __ __ __ BYT 20 20 00                                        :   .
--------------------------------------------------------------------
krnio_pstatus:
6dc3 : __ __ __ BSS	16
--------------------------------------------------------------------
windows:
6dd3 : __ __ __ BSS	39
--------------------------------------------------------------------
HeapNode:
6dfa : __ __ __ BSS	4
--------------------------------------------------------------------
multab:
6e00 : __ __ __ BSS	144
--------------------------------------------------------------------
linebuffer:
6e90 : __ __ __ BSS	81
--------------------------------------------------------------------
bnk_redef_charset: ; bnk_redef_charset(u16,u8,u8*,u16)->void
.s0:
01:1300 : ad 00 ff LDA $ff00 
01:1303 : 85 43 __ STA T0 + 0 
01:1305 : a9 0e __ LDA #$0e
01:1307 : 8d 00 ff STA $ff00 
01:130a : 20 26 22 JSR $2226 ; (vdc_mem_addr@proxy + 0)
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
bnk_load@proxy: ; bnk_load@proxy
01:135b : a9 00 __ LDA #$00
01:135d : 85 10 __ STA P3 
01:135f : a9 20 __ LDA #$20
01:1361 : 85 11 __ STA P4 
--------------------------------------------------------------------
bnk_load: ; bnk_load(u8,u8,const u8*,const u8*)->bool
.s0:
01:1363 : a9 01 __ LDA #$01
01:1365 : 85 0d __ STA P0 
01:1367 : a9 00 __ LDA #$00
01:1369 : 85 0e __ STA P1 
01:136b : 20 ee 2a JSR $2aee ; (krnio_setbnk.s0 + 0)
01:136e : a5 12 __ LDA P5 ; (fname + 0)
01:1370 : 85 0d __ STA P0 
01:1372 : a5 13 __ LDA P6 ; (fname + 1)
01:1374 : 85 0e __ STA P1 
01:1376 : 20 f5 2a JSR $2af5 ; (krnio_setnam.s0 + 0)
01:1379 : a9 01 __ LDA #$01
01:137b : a6 0f __ LDX P2 
01:137d : a0 00 __ LDY #$00
01:137f : 20 ba ff JSR $ffba 
01:1382 : a9 00 __ LDA #$00
01:1384 : a6 10 __ LDX P3 
01:1386 : a4 11 __ LDY P4 
01:1388 : 20 d5 ff JSR $ffd5 
01:138b : a9 00 __ LDA #$00
01:138d : b0 02 __ BCS $1391 ; (bnk_load.s0 + 46)
01:138f : a9 01 __ LDA #$01
01:1391 : 85 1b __ STA ACCU + 0 
.s1001:
01:1393 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:1394 : a9 0e __ LDA #$0e
01:1396 : 85 0d __ STA P0 
01:1398 : a9 90 __ LDA #$90
01:139a : 85 0e __ STA P1 
01:139c : a9 6e __ LDA #$6e
01:139e : 85 0f __ STA P2 
01:13a0 : a5 46 __ LDA $46 
01:13a2 : 85 12 __ STA P5 
01:13a4 : a9 00 __ LDA #$00
01:13a6 : 85 13 __ STA P6 
--------------------------------------------------------------------
bnk_cpyfromvdc: ; bnk_cpyfromvdc(u8,u8*,u16,u16)->void
.s0:
01:13a8 : ad 00 ff LDA $ff00 
01:13ab : 85 1d __ STA ACCU + 2 
01:13ad : a6 12 __ LDX P5 ; (size + 0)
.l110:
01:13af : 8a __ __ TXA
01:13b0 : 05 13 __ ORA P6 ; (size + 1)
01:13b2 : d0 06 __ BNE $13ba ; (bnk_cpyfromvdc.s2 + 0)
.s3:
01:13b4 : a5 1d __ LDA ACCU + 2 
01:13b6 : 8d 00 ff STA $ff00 
.s1001:
01:13b9 : 60 __ __ RTS
.s2:
01:13ba : a9 0e __ LDA #$0e
01:13bc : 8d 00 ff STA $ff00 
01:13bf : a5 10 __ LDA P3 ; (vdcsrc + 0)
01:13c1 : a8 __ __ TAY
01:13c2 : 18 __ __ CLC
01:13c3 : 69 01 __ ADC #$01
01:13c5 : 85 10 __ STA P3 ; (vdcsrc + 0)
01:13c7 : a5 11 __ LDA P4 ; (vdcsrc + 1)
01:13c9 : 85 1b __ STA ACCU + 0 
01:13cb : 69 00 __ ADC #$00
01:13cd : 85 11 __ STA P4 ; (vdcsrc + 1)
01:13cf : a9 12 __ LDA #$12
01:13d1 : 8d 00 d6 STA $d600 
.l111:
01:13d4 : 2c 00 d6 BIT $d600 
01:13d7 : 10 fb __ BPL $13d4 ; (bnk_cpyfromvdc.l111 + 0)
.s10:
01:13d9 : a5 1b __ LDA ACCU + 0 
01:13db : 8d 01 d6 STA $d601 
01:13de : a9 13 __ LDA #$13
01:13e0 : 8d 00 d6 STA $d600 
.l113:
01:13e3 : 2c 00 d6 BIT $d600 
01:13e6 : 10 fb __ BPL $13e3 ; (bnk_cpyfromvdc.l113 + 0)
.s15:
01:13e8 : 8c 01 d6 STY $d601 
01:13eb : a9 1f __ LDA #$1f
01:13ed : 8d 00 d6 STA $d600 
.l115:
01:13f0 : 2c 00 d6 BIT $d600 
01:13f3 : 10 fb __ BPL $13f0 ; (bnk_cpyfromvdc.l115 + 0)
.s19:
01:13f5 : a5 0d __ LDA P0 ; (dcr + 0)
01:13f7 : ac 01 d6 LDY $d601 
01:13fa : 8d 00 ff STA $ff00 
01:13fd : a5 0e __ LDA P1 ; (dp + 0)
01:13ff : 85 1b __ STA ACCU + 0 
01:1401 : 18 __ __ CLC
01:1402 : 69 01 __ ADC #$01
01:1404 : 85 0e __ STA P1 ; (dp + 0)
01:1406 : a5 0f __ LDA P2 ; (dp + 1)
01:1408 : 85 1c __ STA ACCU + 1 
01:140a : 69 00 __ ADC #$00
01:140c : 85 0f __ STA P2 ; (dp + 1)
01:140e : 98 __ __ TYA
01:140f : a0 00 __ LDY #$00
01:1411 : 91 1b __ STA (ACCU + 0),y 
01:1413 : a9 0e __ LDA #$0e
01:1415 : 8d 00 ff STA $ff00 
01:1418 : ca __ __ DEX
01:1419 : e0 ff __ CPX #$ff
01:141b : d0 92 __ BNE $13af ; (bnk_cpyfromvdc.l110 + 0)
.s1008:
01:141d : c6 13 __ DEC P6 ; (size + 1)
01:141f : 4c af 13 JMP $13af ; (bnk_cpyfromvdc.l110 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:1422 : a9 0e __ LDA #$0e
01:1424 : 85 11 __ STA P4 
01:1426 : a9 90 __ LDA #$90
01:1428 : 85 12 __ STA P5 
01:142a : a9 6e __ LDA #$6e
01:142c : 85 13 __ STA P6 
01:142e : a5 46 __ LDA $46 
01:1430 : 85 14 __ STA P7 
01:1432 : a9 00 __ LDA #$00
01:1434 : 85 15 __ STA P8 
--------------------------------------------------------------------
bnk_cpytovdc: ; bnk_cpytovdc(u16,u8,u8*,u16)->void
.s0:
01:1436 : ad 00 ff LDA $ff00 
01:1439 : 85 43 __ STA T0 + 0 
01:143b : a9 0e __ LDA #$0e
01:143d : 8d 00 ff STA $ff00 
01:1440 : 20 26 22 JSR $2226 ; (vdc_mem_addr@proxy + 0)
01:1443 : a5 14 __ LDA P7 ; (size + 0)
01:1445 : 05 15 __ ORA P8 ; (size + 1)
01:1447 : d0 06 __ BNE $144f ; (bnk_cpytovdc.s1008 + 0)
.s3:
01:1449 : a5 43 __ LDA T0 + 0 
01:144b : 8d 00 ff STA $ff00 
.s1001:
01:144e : 60 __ __ RTS
.s1008:
01:144f : a6 14 __ LDX P7 ; (size + 0)
.l2:
01:1451 : a5 11 __ LDA P4 ; (scr + 0)
01:1453 : 8d 00 ff STA $ff00 
01:1456 : a0 00 __ LDY #$00
01:1458 : b1 12 __ LDA (P5),y ; (sp + 0)
01:145a : a8 __ __ TAY
01:145b : e6 12 __ INC P5 ; (sp + 0)
01:145d : d0 02 __ BNE $1461 ; (bnk_cpytovdc.s1010 + 0)
.s1009:
01:145f : e6 13 __ INC P6 ; (sp + 1)
.s1010:
01:1461 : a9 0e __ LDA #$0e
01:1463 : 8d 00 ff STA $ff00 
.l52:
01:1466 : 2c 00 d6 BIT $d600 
01:1469 : 10 fb __ BPL $1466 ; (bnk_cpytovdc.l52 + 0)
.s6:
01:146b : 8c 01 d6 STY $d601 
01:146e : 8a __ __ TXA
01:146f : d0 02 __ BNE $1473 ; (bnk_cpytovdc.s1005 + 0)
.s1004:
01:1471 : c6 15 __ DEC P8 ; (size + 1)
.s1005:
01:1473 : ca __ __ DEX
01:1474 : d0 db __ BNE $1451 ; (bnk_cpytovdc.l2 + 0)
.s1006:
01:1476 : a5 15 __ LDA P8 ; (size + 1)
01:1478 : d0 d7 __ BNE $1451 ; (bnk_cpytovdc.l2 + 0)
01:147a : 4c 49 14 JMP $1449 ; (bnk_cpytovdc.s3 + 0)
--------------------------------------------------------------------
sid_startmusic: ; sid_startmusic()->void
.s0:
01:147d : ad 00 ff LDA $ff00 
01:1480 : 85 43 __ STA T0 + 0 
01:1482 : a9 7e __ LDA #$7e
01:1484 : 8d 00 ff STA $ff00 
01:1487 : 78 __ __ SEI
01:1488 : a9 7e __ LDA #$7e
01:148a : 8d 00 ff STA $ff00 
01:148d : a9 00 __ LDA #$00
01:148f : 20 00 20 JSR $2000 ; (vdc_init.s1000 + 0)
01:1492 : ad 14 03 LDA $0314 
01:1495 : 8d 9e 15 STA $159e ; (sid_irq + 0)
01:1498 : a9 af __ LDA #$af
01:149a : 8d 14 03 STA $0314 
01:149d : ad 15 03 LDA $0315 
01:14a0 : 8d 9f 15 STA $159f ; (sid_irq + 1)
01:14a3 : a9 14 __ LDA #$14
01:14a5 : 8d 15 03 STA $0315 
01:14a8 : 58 __ __ CLI
01:14a9 : a5 43 __ LDA T0 + 0 
01:14ab : 8d 00 ff STA $ff00 
.s1001:
01:14ae : 60 __ __ RTS
--------------------------------------------------------------------
sid_interrupt: ; sid_interrupt
01:14af : ad a0 15 LDA $15a0 ; (sid_pause + 0)
01:14b2 : d0 20 __ BNE $14d4 ; (sid_interrupt + 37)
01:14b4 : ad 00 ff LDA $ff00 
01:14b7 : 8d a1 15 STA $15a1 ; (sid_oldcr + 0)
01:14ba : a9 7e __ LDA #$7e
01:14bc : 8d 00 ff STA $ff00 
01:14bf : 20 03 20 JSR $2003 ; (vdc_init.s1000 + 3)
01:14c2 : ad a1 15 LDA $15a1 ; (sid_oldcr + 0)
01:14c5 : 8d 00 ff STA $ff00 
01:14c8 : ad 9e 15 LDA $159e ; (sid_irq + 0)
01:14cb : 8d d5 14 STA $14d5 ; (sid_interrupt + 38)
01:14ce : ad 9f 15 LDA $159f ; (sid_irq + 1)
01:14d1 : 8d d6 14 STA $14d6 ; (sid_interrupt + 39)
01:14d4 : 4c 65 fa JMP $fa65 
--------------------------------------------------------------------
bnk_writeb: ; bnk_writeb(u8,u8*,u8)->void
.s0:
01:14d7 : a9 0e __ LDA #$0e
01:14d9 : ae 00 ff LDX $ff00 
01:14dc : 8d 00 ff STA $ff00 
01:14df : a5 0f __ LDA P2 ; (b + 0)
01:14e1 : a0 00 __ LDY #$00
01:14e3 : 91 0d __ STA (P0),y ; (p + 0)
01:14e5 : 8e 00 ff STX $ff00 
.s1001:
01:14e8 : 60 __ __ RTS
--------------------------------------------------------------------
sid_pausemusic: ; sid_pausemusic()->void
--------------------------------------------------------------------
sid_resetsid: ; sid_resetsid()->void
.s0:
01:14e9 : a2 18 __ LDX #$18
01:14eb : a9 00 __ LDA #$00
01:14ed : 9d 00 d4 STA $d400,x 
01:14f0 : ca __ __ DEX
01:14f1 : 10 fa __ BPL $14ed ; (sid_resetsid.s0 + 4)
01:14f3 : a9 08 __ LDA #$08
01:14f5 : 8d 04 d4 STA $d404 
01:14f8 : 8d 0b d4 STA $d40b 
01:14fb : 8d 12 d4 STA $d412 
01:14fe : a2 03 __ LDX #$03
01:1500 : 2c 11 d0 BIT $d011 
01:1503 : 10 fb __ BPL $1500 ; (sid_resetsid.s0 + 23)
01:1505 : 2c 11 d0 BIT $d011 
01:1508 : 30 fb __ BMI $1505 ; (sid_resetsid.s0 + 28)
01:150a : ca __ __ DEX
01:150b : 10 f3 __ BPL $1500 ; (sid_resetsid.s0 + 23)
01:150d : a9 00 __ LDA #$00
01:150f : 8d 04 d4 STA $d404 
01:1512 : 8d 0b d4 STA $d40b 
01:1515 : 8d 12 d4 STA $d412 
01:1518 : a9 00 __ LDA #$00
01:151a : 8d 18 d4 STA $d418 
.s1001:
01:151d : 60 __ __ RTS
--------------------------------------------------------------------
bnk_readb: ; bnk_readb(u8,u8*)->u8
.s0:
01:151e : a5 0d __ LDA P0 ; (cr + 0)
01:1520 : ae 00 ff LDX $ff00 
01:1523 : 8d 00 ff STA $ff00 
01:1526 : a0 00 __ LDY #$00
01:1528 : b1 0e __ LDA (P1),y ; (p + 0)
01:152a : 8e 00 ff STX $ff00 
.s1001:
01:152d : 60 __ __ RTS
--------------------------------------------------------------------
sid_stopmusic: ; sid_stopmusic()->void
.s0:
01:152e : 78 __ __ SEI
01:152f : ae 9e 15 LDX $159e ; (sid_irq + 0)
01:1532 : ac 9f 15 LDY $159f ; (sid_irq + 1)
01:1535 : 8e 14 03 STX $0314 
01:1538 : 8c 15 03 STY $0315 
01:153b : 58 __ __ CLI
01:153c : 4c e9 14 JMP $14e9 ; (sid_resetsid.s0 + 0)
--------------------------------------------------------------------
bnk_load@proxy: ; bnk_load@proxy
01:153f : a9 00 __ LDA #$00
01:1541 : 85 10 __ STA P3 
01:1543 : 4c 63 13 JMP $1363 ; (bnk_load.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:1546 : a9 0e __ LDA #$0e
01:1548 : 85 11 __ STA P4 
01:154a : a9 90 __ LDA #$90
01:154c : 85 12 __ STA P5 
01:154e : a9 6e __ LDA #$6e
01:1550 : 85 13 __ STA P6 
01:1552 : a9 00 __ LDA #$00
01:1554 : 85 15 __ STA P8 
01:1556 : 4c 36 14 JMP $1436 ; (bnk_cpytovdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:1559 : a9 0e __ LDA #$0e
01:155b : 85 11 __ STA P4 
01:155d : a9 90 __ LDA #$90
01:155f : 85 12 __ STA P5 
01:1561 : a9 6e __ LDA #$6e
01:1563 : 85 13 __ STA P6 
01:1565 : a5 47 __ LDA $47 
01:1567 : 85 14 __ STA P7 
01:1569 : a9 00 __ LDA #$00
01:156b : 85 15 __ STA P8 
01:156d : 4c 36 14 JMP $1436 ; (bnk_cpytovdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:1570 : a9 0e __ LDA #$0e
01:1572 : 85 0d __ STA P0 
01:1574 : a9 90 __ LDA #$90
01:1576 : 85 0e __ STA P1 
01:1578 : a9 6e __ LDA #$6e
01:157a : 85 0f __ STA P2 
01:157c : a5 14 __ LDA P7 
01:157e : 85 12 __ STA P5 
01:1580 : a9 00 __ LDA #$00
01:1582 : 85 13 __ STA P6 
01:1584 : 4c a8 13 JMP $13a8 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:1587 : a9 0e __ LDA #$0e
01:1589 : 85 0d __ STA P0 
01:158b : a9 90 __ LDA #$90
01:158d : 85 0e __ STA P1 
01:158f : a9 6e __ LDA #$6e
01:1591 : 85 0f __ STA P2 
01:1593 : a5 47 __ LDA $47 
01:1595 : 85 12 __ STA P5 
01:1597 : a9 00 __ LDA #$00
01:1599 : 85 13 __ STA P6 
01:159b : 4c a8 13 JMP $13a8 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
sid_irq:
01:159e : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
sid_pause:
01:15a0 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sid_oldcr:
01:15a1 : __ __ __ BYT 00                                              : .
