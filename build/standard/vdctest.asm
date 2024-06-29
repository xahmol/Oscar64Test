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
1c13 : 8e ff 2d STX $2dff ; (spentry + 0)
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
1c8a : a5 55 __ LDA T4 + 0 
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
1ca5 : 8d 5b 6c STA $6c5b ; (winCfg + 0)
1ca8 : a9 08 __ LDA #$08
1caa : 8d 0e dc STA $dc0e 
1cad : 8d 0f dc STA $dc0f 
1cb0 : 8d 0e dd STA $dd0e 
1cb3 : 8d 0f dd STA $dd0f 
1cb6 : a9 00 __ LDA #$00
1cb8 : 8d 03 dc STA $dc03 
1cbb : 8d 03 dd STA $dd03 
1cbe : 8d 5e 6c STA $6c5e ; (winCfg + 3)
1cc1 : 8d 60 6c STA $6c60 ; (winCfg + 5)
1cc4 : 8d 5c 6c STA $6c5c ; (winCfg + 1)
1cc7 : 8d 61 6c STA $6c61 ; (winCfg + 6)
1cca : a9 ff __ LDA #$ff
1ccc : 8d 02 dc STA $dc02 
1ccf : a9 07 __ LDA #$07
1cd1 : 8d 01 dd STA $dd01 
1cd4 : a9 3f __ LDA #$3f
1cd6 : 8d 02 dd STA $dd02 
1cd9 : a9 a8 __ LDA #$a8
1cdb : 8d 5d 6c STA $6c5d ; (winCfg + 2)
1cde : 8d 62 6c STA $6c62 ; (winCfg + 7)
1ce1 : a9 20 __ LDA #$20
1ce3 : 8d 5f 6c STA $6c5f ; (winCfg + 4)
1ce6 : 20 f3 1f JSR $1ff3 ; (bnk_init.s1000 + 0)
1ce9 : 20 4a 28 JSR $284a ; (vdc_init.s1000 + 0)
1cec : a9 00 __ LDA #$00
1cee : 85 0f __ STA P2 
1cf0 : 85 10 __ STA P3 
1cf2 : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
1cf5 : 85 54 __ STA T1 + 0 
1cf7 : 85 13 __ STA P6 
1cf9 : a9 00 __ LDA #$00
1cfb : 85 11 __ STA P4 
1cfd : a9 2e __ LDA #$2e
1cff : 85 12 __ STA P5 
1d01 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
1d04 : a9 8c __ LDA #$8c
1d06 : a0 02 __ LDY #$02
1d08 : 91 23 __ STA (SP + 0),y 
1d0a : a9 6c __ LDA #$6c
1d0c : c8 __ __ INY
1d0d : 91 23 __ STA (SP + 0),y 
1d0f : a9 49 __ LDA #$49
1d11 : c8 __ __ INY
1d12 : 91 23 __ STA (SP + 0),y 
1d14 : a9 2f __ LDA #$2f
1d16 : c8 __ __ INY
1d17 : 91 23 __ STA (SP + 0),y 
1d19 : ad 73 6c LDA $6c73 ; (vdc_state + 0)
1d1c : c8 __ __ INY
1d1d : 91 23 __ STA (SP + 0),y 
1d1f : a9 00 __ LDA #$00
1d21 : c8 __ __ INY
1d22 : 91 23 __ STA (SP + 0),y 
1d24 : ad 74 6c LDA $6c74 ; (vdc_state + 1)
1d27 : d0 07 __ BNE $1d30 ; (main.s69 + 0)
.s70:
1d29 : a9 2d __ LDA #$2d
1d2b : a2 fa __ LDX #$fa
1d2d : 4c 34 1d JMP $1d34 ; (main.s71 + 0)
.s69:
1d30 : a9 2d __ LDA #$2d
1d32 : a2 f7 __ LDX #$f7
.s71:
1d34 : a0 09 __ LDY #$09
1d36 : 91 23 __ STA (SP + 0),y 
1d38 : 8a __ __ TXA
1d39 : 88 __ __ DEY
1d3a : 91 23 __ STA (SP + 0),y 
1d3c : 20 1b 2f JSR $2f1b ; (sprintf.s0 + 0)
1d3f : a9 02 __ LDA #$02
1d41 : 85 10 __ STA P3 
1d43 : 20 c8 66 JSR $66c8 ; (vdc_prints_attr@proxy + 0)
1d46 : a9 04 __ LDA #$04
1d48 : 85 10 __ STA P3 
1d4a : a9 2f __ LDA #$2f
1d4c : 85 12 __ STA P5 
1d4e : a9 7e __ LDA #$7e
1d50 : 85 11 __ STA P4 
1d52 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
1d55 : e6 10 __ INC P3 
1d57 : a9 8e __ LDA #$8e
1d59 : 85 11 __ STA P4 
1d5b : a9 2f __ LDA #$2f
1d5d : 85 12 __ STA P5 
1d5f : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
1d62 : ad fe 3e LDA $3efe ; (bootdevice + 0)
1d65 : 85 54 __ STA T1 + 0 
1d67 : 85 0f __ STA P2 
1d69 : a9 2f __ LDA #$2f
1d6b : 85 13 __ STA P6 
1d6d : a9 40 __ LDA #$40
1d6f : 85 11 __ STA P4 
1d71 : a9 ad __ LDA #$ad
1d73 : 85 12 __ STA P5 
1d75 : 20 37 15 JSR $1537 ; (bnk_load@proxy + 0)
1d78 : a9 01 __ LDA #$01
1d7a : 85 55 __ STA T4 + 0 
1d7c : a5 1b __ LDA ACCU + 0 
1d7e : d0 06 __ BNE $1d86 ; (main.s10 + 0)
.s8:
1d80 : 20 b5 2f JSR $2fb5 ; (menu_fileerrormessage.s1000 + 0)
1d83 : 20 2d 28 JSR $282d ; (exit@proxy + 0)
.s10:
1d86 : a9 06 __ LDA #$06
1d88 : 85 10 __ STA P3 
1d8a : a9 7b __ LDA #$7b
1d8c : 85 11 __ STA P4 
1d8e : a9 36 __ LDA #$36
1d90 : 85 12 __ STA P5 
1d92 : 20 e6 66 JSR $66e6 ; (vdc_prints_attr@proxy + 0)
1d95 : a5 54 __ LDA T1 + 0 
1d97 : 85 0f __ STA P2 
1d99 : a9 36 __ LDA #$36
1d9b : 85 13 __ STA P6 
1d9d : a9 a7 __ LDA #$a7
1d9f : 85 12 __ STA P5 
1da1 : 20 5b 13 JSR $135b ; (bnk_load@proxy + 0)
1da4 : a5 1b __ LDA ACCU + 0 
1da6 : d0 06 __ BNE $1dae ; (main.l40 + 0)
.s12:
1da8 : 20 b5 2f JSR $2fb5 ; (menu_fileerrormessage.s1000 + 0)
1dab : 20 2d 28 JSR $282d ; (exit@proxy + 0)
.l40:
1dae : 20 75 14 JSR $1475 ; (sid_startmusic.s0 + 0)
.l15:
1db1 : 20 ae 36 JSR $36ae ; (menu_placetop.s0 + 0)
1db4 : a9 00 __ LDA #$00
1db6 : 8d 1d be STA $be1d ; (vp_logo + 1)
1db9 : 8d 20 be STA $be20 ; (vp_logo + 4)
1dbc : 8d 22 be STA $be22 ; (vp_logo + 6)
1dbf : 8d 23 be STA $be23 ; (vp_logo + 7)
1dc2 : 8d 24 be STA $be24 ; (vp_logo + 8)
1dc5 : 8d 25 be STA $be25 ; (vp_logo + 9)
1dc8 : 8d 26 be STA $be26 ; (vp_logo + 10)
1dcb : a9 7f __ LDA #$7f
1dcd : 8d 1c be STA $be1c ; (vp_logo + 0)
1dd0 : a9 a0 __ LDA #$a0
1dd2 : 8d 1f be STA $be1f ; (vp_logo + 3)
1dd5 : ad 79 6c LDA $6c79 ; (vdc_state + 6)
1dd8 : 4a __ __ LSR
1dd9 : a9 4b __ LDA #$4b
1ddb : 8d 21 be STA $be21 ; (vp_logo + 5)
1dde : a9 10 __ LDA #$10
1de0 : 85 0f __ STA P2 
1de2 : a9 30 __ LDA #$30
1de4 : 85 11 __ STA P4 
1de6 : a9 0c __ LDA #$0c
1de8 : 85 12 __ STA P5 
1dea : a9 40 __ LDA #$40
1dec : 8d 1e be STA $be1e ; (vp_logo + 2)
1def : a9 27 __ LDA #$27
1df1 : 85 0d __ STA P0 
1df3 : a9 be __ LDA #$be
1df5 : 85 0e __ STA P1 
1df7 : ad 78 6c LDA $6c78 ; (vdc_state + 5)
1dfa : 85 53 __ STA T0 + 0 
1dfc : 6a __ __ ROR
1dfd : 38 __ __ SEC
1dfe : e9 06 __ SBC #$06
1e00 : 85 10 __ STA P3 
1e02 : 20 ff 31 JSR $31ff ; (vdcwin_init.s0 + 0)
1e05 : a9 00 __ LDA #$00
1e07 : 8d 24 be STA $be24 ; (vp_logo + 8)
1e0a : 8d 26 be STA $be26 ; (vp_logo + 10)
1e0d : a9 10 __ LDA #$10
1e0f : 8d 23 be STA $be23 ; (vp_logo + 7)
1e12 : a9 8c __ LDA #$8c
1e14 : a0 02 __ LDY #$02
1e16 : 91 23 __ STA (SP + 0),y 
1e18 : a9 6c __ LDA #$6c
1e1a : c8 __ __ INY
1e1b : 91 23 __ STA (SP + 0),y 
1e1d : a9 49 __ LDA #$49
1e1f : c8 __ __ INY
1e20 : 91 23 __ STA (SP + 0),y 
1e22 : a9 2f __ LDA #$2f
1e24 : c8 __ __ INY
1e25 : 91 23 __ STA (SP + 0),y 
1e27 : ad 73 6c LDA $6c73 ; (vdc_state + 0)
1e2a : c8 __ __ INY
1e2b : 8c 25 be STY $be25 ; (vp_logo + 9)
1e2e : 91 23 __ STA (SP + 0),y 
1e30 : a9 00 __ LDA #$00
1e32 : c8 __ __ INY
1e33 : 91 23 __ STA (SP + 0),y 
1e35 : ad 74 6c LDA $6c74 ; (vdc_state + 1)
1e38 : d0 07 __ BNE $1e41 ; (main.s72 + 0)
.s73:
1e3a : a9 2d __ LDA #$2d
1e3c : a2 fa __ LDX #$fa
1e3e : 4c 45 1e JMP $1e45 ; (main.s74 + 0)
.s72:
1e41 : a9 2d __ LDA #$2d
1e43 : a2 f7 __ LDX #$f7
.s74:
1e45 : a0 09 __ LDY #$09
1e47 : 91 23 __ STA (SP + 0),y 
1e49 : 8a __ __ TXA
1e4a : 88 __ __ DEY
1e4b : 91 23 __ STA (SP + 0),y 
1e4d : 20 1b 2f JSR $2f1b ; (sprintf.s0 + 0)
1e50 : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
1e53 : 85 54 __ STA T1 + 0 
1e55 : 85 13 __ STA P6 
1e57 : a9 8c __ LDA #$8c
1e59 : 85 11 __ STA P4 
1e5b : a9 6c __ LDA #$6c
1e5d : 85 12 __ STA P5 
1e5f : 20 db 66 JSR $66db ; (vdc_prints_attr@proxy + 0)
1e62 : a9 8c __ LDA #$8c
1e64 : a0 02 __ LDY #$02
1e66 : 91 23 __ STA (SP + 0),y 
1e68 : a9 6c __ LDA #$6c
1e6a : c8 __ __ INY
1e6b : 91 23 __ STA (SP + 0),y 
1e6d : a9 6b __ LDA #$6b
1e6f : c8 __ __ INY
1e70 : 91 23 __ STA (SP + 0),y 
1e72 : a9 37 __ LDA #$37
1e74 : c8 __ __ INY
1e75 : 91 23 __ STA (SP + 0),y 
1e77 : ad 75 6c LDA $6c75 ; (vdc_state + 2)
1e7a : 85 1b __ STA ACCU + 0 
1e7c : a9 00 __ LDA #$00
1e7e : 85 1c __ STA ACCU + 1 
1e80 : a9 11 __ LDA #$11
1e82 : 20 46 63 JSR $6346 ; (mul16by8 + 0)
1e85 : 18 __ __ CLC
1e86 : a9 a2 __ LDA #$a2
1e88 : 65 05 __ ADC WORK + 2 
1e8a : a0 06 __ LDY #$06
1e8c : 91 23 __ STA (SP + 0),y 
1e8e : a9 6b __ LDA #$6b
1e90 : 69 00 __ ADC #$00
1e92 : c8 __ __ INY
1e93 : 91 23 __ STA (SP + 0),y 
1e95 : 20 1b 2f JSR $2f1b ; (sprintf.s0 + 0)
1e98 : a9 04 __ LDA #$04
1e9a : 85 10 __ STA P3 
1e9c : 20 c8 66 JSR $66c8 ; (vdc_prints_attr@proxy + 0)
1e9f : 38 __ __ SEC
1ea0 : a5 53 __ LDA T0 + 0 
1ea2 : e9 04 __ SBC #$04
1ea4 : 85 10 __ STA P3 
1ea6 : a9 7a __ LDA #$7a
1ea8 : 85 11 __ STA P4 
1eaa : a9 37 __ LDA #$37
1eac : 85 12 __ STA P5 
1eae : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
1eb1 : e6 10 __ INC P3 
1eb3 : a9 b4 __ LDA #$b4
1eb5 : 85 11 __ STA P4 
1eb7 : a9 37 __ LDA #$37
1eb9 : 85 12 __ STA P5 
1ebb : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
1ebe : e6 10 __ INC P3 
1ec0 : a9 00 __ LDA #$00
1ec2 : 85 11 __ STA P4 
1ec4 : a9 38 __ LDA #$38
1ec6 : 85 12 __ STA P5 
1ec8 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
1ecb : a9 1c __ LDA #$1c
1ecd : 85 16 __ STA P9 
1ecf : a9 be __ LDA #$be
1ed1 : 85 17 __ STA P10 
1ed3 : 20 36 38 JSR $3836 ; (vdcwin_cpy_viewport.s0 + 0)
1ed6 : 20 81 39 JSR $3981 ; (menu_main.s1000 + 0)
1ed9 : a5 1b __ LDA ACCU + 0 
1edb : 85 54 __ STA T1 + 0 
1edd : c9 29 __ CMP #$29
1edf : b0 03 __ BCS $1ee4 ; (main.s44 + 0)
1ee1 : 4c b2 1f JMP $1fb2 ; (main.s46 + 0)
.s44:
1ee4 : c9 2b __ CMP #$2b
1ee6 : b0 0c __ BCS $1ef4 ; (main.s45 + 0)
.s29:
1ee8 : 38 __ __ SEC
1ee9 : e9 29 __ SBC #$29
1eeb : 8d ff bf STA $bfff ; (sstack + 8)
1eee : 20 e5 58 JSR $58e5 ; (scroll_fullscreen_smooth.s1000 + 0)
1ef1 : 4c 52 1f JMP $1f52 ; (main.s23 + 0)
.s45:
1ef4 : c9 3d __ CMP #$3d
1ef6 : b0 03 __ BCS $1efb ; (main.s55 + 0)
1ef8 : 4c 9e 1f JMP $1f9e ; (main.s57 + 0)
.s55:
1efb : c9 3f __ CMP #$3f
1efd : 90 03 __ BCC $1f02 ; (main.s32 + 0)
1eff : 4c 8f 1f JMP $1f8f ; (main.s56 + 0)
.s32:
1f02 : 38 __ __ SEC
1f03 : e9 3c __ SBC #$3c
1f05 : 85 53 __ STA T0 + 0 
1f07 : 90 06 __ BCC $1f0f ; (main.s33 + 0)
.s1008:
1f09 : a5 55 __ LDA T4 + 0 
1f0b : c5 53 __ CMP T0 + 0 
1f0d : f0 43 __ BEQ $1f52 ; (main.s23 + 0)
.s33:
1f0f : 20 26 15 JSR $1526 ; (sid_stopmusic.s0 + 0)
1f12 : a9 8c __ LDA #$8c
1f14 : a0 02 __ LDY #$02
1f16 : 91 23 __ STA (SP + 0),y 
1f18 : a9 6c __ LDA #$6c
1f1a : c8 __ __ INY
1f1b : 91 23 __ STA (SP + 0),y 
1f1d : a9 3e __ LDA #$3e
1f1f : c8 __ __ INY
1f20 : 91 23 __ STA (SP + 0),y 
1f22 : a9 63 __ LDA #$63
1f24 : c8 __ __ INY
1f25 : 91 23 __ STA (SP + 0),y 
1f27 : a5 53 __ LDA T0 + 0 
1f29 : c8 __ __ INY
1f2a : 91 23 __ STA (SP + 0),y 
1f2c : a9 00 __ LDA #$00
1f2e : c8 __ __ INY
1f2f : 91 23 __ STA (SP + 0),y 
1f31 : 20 1b 2f JSR $2f1b ; (sprintf.s0 + 0)
1f34 : ad fe 3e LDA $3efe ; (bootdevice + 0)
1f37 : 85 0f __ STA P2 
1f39 : a9 8c __ LDA #$8c
1f3b : 85 12 __ STA P5 
1f3d : a9 6c __ LDA #$6c
1f3f : 85 13 __ STA P6 
1f41 : 20 5b 13 JSR $135b ; (bnk_load@proxy + 0)
1f44 : a5 1b __ LDA ACCU + 0 
1f46 : d0 03 __ BNE $1f4b ; (main.s93 + 0)
.s36:
1f48 : 20 b5 2f JSR $2fb5 ; (menu_fileerrormessage.s1000 + 0)
.s93:
1f4b : a5 53 __ LDA T0 + 0 
1f4d : 85 55 __ STA T4 + 0 
1f4f : 20 75 14 JSR $1475 ; (sid_startmusic.s0 + 0)
.s23:
1f52 : a5 54 __ LDA T1 + 0 
1f54 : c9 0d __ CMP #$0d
1f56 : f0 03 __ BEQ $1f5b ; (main.s16 + 0)
1f58 : 4c b1 1d JMP $1db1 ; (main.l15 + 0)
.s16:
1f5b : 20 26 15 JSR $1526 ; (sid_stopmusic.s0 + 0)
1f5e : a9 00 __ LDA #$00
1f60 : 20 04 2b JSR $2b04 ; (fastmode.s0 + 0)
1f63 : 20 23 2b JSR $2b23 ; (vdc_set_mode@proxy + 0)
1f66 : 20 87 29 JSR $2987 ; (vdc_cls.s0 + 0)
1f69 : a9 00 __ LDA #$00
1f6b : 85 1b __ STA ACCU + 0 
1f6d : 85 1c __ STA ACCU + 1 
1f6f : a9 04 __ LDA #$04
1f71 : 8d 06 d5 STA $d506 
.s1001:
1f74 : 18 __ __ CLC
1f75 : a5 23 __ LDA SP + 0 
1f77 : 69 0a __ ADC #$0a
1f79 : 85 23 __ STA SP + 0 
1f7b : 90 02 __ BCC $1f7f ; (main.s1001 + 11)
1f7d : e6 24 __ INC SP + 1 
1f7f : ad 16 be LDA $be16 ; (main@stack + 0)
1f82 : 85 53 __ STA T0 + 0 
1f84 : ad 17 be LDA $be17 ; (main@stack + 1)
1f87 : 85 54 __ STA T1 + 0 
1f89 : ad 18 be LDA $be18 ; (main@stack + 2)
1f8c : 85 55 __ STA T4 + 0 
1f8e : 60 __ __ RTS
.s56:
1f8f : d0 06 __ BNE $1f97 ; (main.s60 + 0)
.s39:
1f91 : 20 26 15 JSR $1526 ; (sid_stopmusic.s0 + 0)
1f94 : 4c b1 1d JMP $1db1 ; (main.l15 + 0)
.s60:
1f97 : c9 40 __ CMP #$40
1f99 : d0 b7 __ BNE $1f52 ; (main.s23 + 0)
1f9b : 4c ae 1d JMP $1dae ; (main.l40 + 0)
.s57:
1f9e : c9 2b __ CMP #$2b
1fa0 : d0 06 __ BNE $1fa8 ; (main.s58 + 0)
.s30:
1fa2 : 20 f0 5e JSR $5ef0 ; (scroll_bigfont.s1000 + 0)
1fa5 : 4c b1 1d JMP $1db1 ; (main.l15 + 0)
.s58:
1fa8 : c9 33 __ CMP #$33
1faa : d0 a6 __ BNE $1f52 ; (main.s23 + 0)
.s31:
1fac : 20 20 62 JSR $6220 ; (charset_demo.s1000 + 0)
1faf : 4c b1 1d JMP $1db1 ; (main.l15 + 0)
.s46:
1fb2 : c9 15 __ CMP #$15
1fb4 : d0 06 __ BNE $1fbc ; (main.s47 + 0)
.s26:
1fb6 : 20 74 3f JSR $3f74 ; (windows_windowstacking.s1000 + 0)
1fb9 : 4c b1 1d JMP $1db1 ; (main.l15 + 0)
.s47:
1fbc : 90 1e __ BCC $1fdc ; (main.s49 + 0)
.s48:
1fbe : c9 16 __ CMP #$16
1fc0 : d0 06 __ BNE $1fc8 ; (main.s52 + 0)
.s27:
1fc2 : 20 e7 47 JSR $47e7 ; (windows_textinput.s1000 + 0)
1fc5 : 4c b1 1d JMP $1db1 ; (main.l15 + 0)
.s52:
1fc8 : c9 1f __ CMP #$1f
1fca : 90 86 __ BCC $1f52 ; (main.s23 + 0)
.s54:
1fcc : c9 21 __ CMP #$21
1fce : b0 82 __ BCS $1f52 ; (main.s23 + 0)
.s28:
1fd0 : 38 __ __ SEC
1fd1 : e9 1f __ SBC #$1f
1fd3 : 8d ff bf STA $bfff ; (sstack + 8)
1fd6 : 20 89 51 JSR $5189 ; (viewport_demo.s1000 + 0)
1fd9 : 4c b1 1d JMP $1db1 ; (main.l15 + 0)
.s49:
1fdc : c9 0b __ CMP #$0b
1fde : d0 06 __ BNE $1fe6 ; (main.s50 + 0)
.s24:
1fe0 : 20 f1 3c JSR $3cf1 ; (settings_screenmode.s1000 + 0)
1fe3 : 4c b1 1d JMP $1db1 ; (main.l15 + 0)
.s50:
1fe6 : c9 0c __ CMP #$0c
1fe8 : f0 03 __ BEQ $1fed ; (main.s25 + 0)
1fea : 4c 52 1f JMP $1f52 ; (main.s23 + 0)
.s25:
1fed : 20 6e 3d JSR $3d6e ; (settings_versioninfo.s1000 + 0)
1ff0 : 4c b1 1d JMP $1db1 ; (main.l15 + 0)
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
1ffe : a9 96 __ LDA #$96
2000 : a0 02 __ LDY #$02
2002 : 91 23 __ STA (SP + 0),y 
2004 : a9 27 __ LDA #$27
2006 : c8 __ __ INY
2007 : 91 23 __ STA (SP + 0),y 
2009 : a5 ba __ LDA $ba 
200b : d0 02 __ BNE $200f ; (bnk_init.s4 + 0)
.s2:
200d : a9 08 __ LDA #$08
.s4:
200f : 85 4e __ STA T1 + 0 
2011 : 8d fe 3e STA $3efe ; (bootdevice + 0)
2014 : a0 04 __ LDY #$04
2016 : 91 23 __ STA (SP + 0),y 
2018 : a9 00 __ LDA #$00
201a : c8 __ __ INY
201b : 91 23 __ STA (SP + 0),y 
201d : 20 a4 20 JSR $20a4 ; (printf.s0 + 0)
2020 : a9 06 __ LDA #$06
2022 : 8d 06 d5 STA $d506 
2025 : a9 a6 __ LDA #$a6
2027 : a0 02 __ LDY #$02
2029 : 91 23 __ STA (SP + 0),y 
202b : a9 27 __ LDA #$27
202d : c8 __ __ INY
202e : 91 23 __ STA (SP + 0),y 
2030 : 20 a4 20 JSR $20a4 ; (printf.s0 + 0)
2033 : a9 00 __ LDA #$00
2035 : aa __ __ TAX
2036 : 20 68 ff JSR $ff68 
2039 : a9 c0 __ LDA #$c0
203b : 85 0d __ STA P0 
203d : a9 27 __ LDA #$27
203f : 85 0e __ STA P1 
2041 : 20 cb 27 JSR $27cb ; (krnio_setnam.s0 + 0)
2044 : a9 c0 __ LDA #$c0
2046 : a0 04 __ LDY #$04
2048 : 91 23 __ STA (SP + 0),y 
204a : a9 27 __ LDA #$27
204c : c8 __ __ INY
204d : 91 23 __ STA (SP + 0),y 
204f : a9 e1 __ LDA #$e1
2051 : a0 02 __ LDY #$02
2053 : 91 23 __ STA (SP + 0),y 
2055 : a9 27 __ LDA #$27
2057 : c8 __ __ INY
2058 : 91 23 __ STA (SP + 0),y 
205a : 20 a4 20 JSR $20a4 ; (printf.s0 + 0)
205d : a9 01 __ LDA #$01
205f : 85 0d __ STA P0 
2061 : 85 0f __ STA P2 
2063 : a5 4e __ LDA T1 + 0 
2065 : 85 0e __ STA P1 
2067 : 20 ee 27 JSR $27ee ; (krnio_load.s0 + 0)
206a : 09 00 __ ORA #$00
206c : d0 2a __ BNE $2098 ; (bnk_init.s1001 + 0)
.s7:
206e : a9 03 __ LDA #$03
2070 : a0 02 __ LDY #$02
2072 : 91 23 __ STA (SP + 0),y 
2074 : a9 28 __ LDA #$28
2076 : c8 __ __ INY
2077 : 91 23 __ STA (SP + 0),y 
2079 : 20 a4 20 JSR $20a4 ; (printf.s0 + 0)
207c : a9 21 __ LDA #$21
207e : a0 02 __ LDY #$02
2080 : 91 23 __ STA (SP + 0),y 
2082 : a9 28 __ LDA #$28
2084 : c8 __ __ INY
2085 : 91 23 __ STA (SP + 0),y 
2087 : ad 64 6c LDA $6c64 ; (krnio_pstatus + 1)
208a : c8 __ __ INY
208b : 91 23 __ STA (SP + 0),y 
208d : a9 00 __ LDA #$00
208f : c8 __ __ INY
2090 : 91 23 __ STA (SP + 0),y 
2092 : 20 a4 20 JSR $20a4 ; (printf.s0 + 0)
2095 : 20 2d 28 JSR $282d ; (exit@proxy + 0)
.s1001:
2098 : 18 __ __ CLC
2099 : a5 23 __ LDA SP + 0 
209b : 69 06 __ ADC #$06
209d : 85 23 __ STA SP + 0 
209f : 90 02 __ BCC $20a3 ; (bnk_init.s1001 + 11)
20a1 : e6 24 __ INC SP + 1 
20a3 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
20a4 : a9 01 __ LDA #$01
20a6 : 8d fb bf STA $bffb ; (sstack + 4)
20a9 : a9 ad __ LDA #$ad
20ab : 85 16 __ STA P9 
20ad : a9 bf __ LDA #$bf
20af : 85 17 __ STA P10 
20b1 : a0 02 __ LDY #$02
20b3 : b1 23 __ LDA (SP + 0),y 
20b5 : 8d f7 bf STA $bff7 ; (sstack + 0)
20b8 : c8 __ __ INY
20b9 : b1 23 __ LDA (SP + 0),y 
20bb : 8d f8 bf STA $bff8 ; (sstack + 1)
20be : 18 __ __ CLC
20bf : a5 23 __ LDA SP + 0 
20c1 : 69 04 __ ADC #$04
20c3 : 8d f9 bf STA $bff9 ; (sstack + 2)
20c6 : a5 24 __ LDA SP + 1 
20c8 : 69 00 __ ADC #$00
20ca : 8d fa bf STA $bffa ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s0:
20cd : ad f7 bf LDA $bff7 ; (sstack + 0)
20d0 : 85 49 __ STA T1 + 0 
20d2 : a9 00 __ LDA #$00
20d4 : 85 47 __ STA T0 + 0 
20d6 : ad f8 bf LDA $bff8 ; (sstack + 1)
20d9 : 85 4a __ STA T1 + 1 
.l1:
20db : a0 00 __ LDY #$00
20dd : b1 49 __ LDA (T1 + 0),y 
20df : d0 2d __ BNE $210e ; (sformat.s2 + 0)
.s3:
20e1 : a4 47 __ LDY T0 + 0 
20e3 : 91 16 __ STA (P9),y ; (buff + 0)
20e5 : 98 __ __ TYA
20e6 : f0 1d __ BEQ $2105 ; (sformat.s1070 + 0)
.s116:
20e8 : ad fb bf LDA $bffb ; (sstack + 4)
20eb : d0 0d __ BNE $20fa ; (sformat.s119 + 0)
.s120:
20ed : 18 __ __ CLC
20ee : a5 16 __ LDA P9 ; (buff + 0)
20f0 : 65 47 __ ADC T0 + 0 
20f2 : aa __ __ TAX
20f3 : a5 17 __ LDA P10 ; (buff + 1)
20f5 : 69 00 __ ADC #$00
20f7 : 4c 09 21 JMP $2109 ; (sformat.s1001 + 0)
.s119:
20fa : a5 16 __ LDA P9 ; (buff + 0)
20fc : 85 0d __ STA P0 
20fe : a5 17 __ LDA P10 ; (buff + 1)
2100 : 85 0e __ STA P1 
2102 : 20 93 24 JSR $2493 ; (puts.s0 + 0)
.s1070:
2105 : a5 17 __ LDA P10 ; (buff + 1)
2107 : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
2109 : 86 1b __ STX ACCU + 0 ; (fps + 0)
210b : 85 1c __ STA ACCU + 1 ; (fps + 1)
210d : 60 __ __ RTS
.s2:
210e : c9 25 __ CMP #$25
2110 : f0 3e __ BEQ $2150 ; (sformat.s4 + 0)
.s5:
2112 : a4 47 __ LDY T0 + 0 
2114 : 91 16 __ STA (P9),y ; (buff + 0)
2116 : e6 49 __ INC T1 + 0 
2118 : d0 02 __ BNE $211c ; (sformat.s1098 + 0)
.s1097:
211a : e6 4a __ INC T1 + 1 
.s1098:
211c : c8 __ __ INY
211d : 84 47 __ STY T0 + 0 
211f : 98 __ __ TYA
2120 : c0 28 __ CPY #$28
2122 : 90 b7 __ BCC $20db ; (sformat.l1 + 0)
.s110:
2124 : 85 4c __ STA T5 + 0 
2126 : a9 00 __ LDA #$00
2128 : 85 47 __ STA T0 + 0 
212a : ad fb bf LDA $bffb ; (sstack + 4)
212d : f0 14 __ BEQ $2143 ; (sformat.s114 + 0)
.s113:
212f : a5 16 __ LDA P9 ; (buff + 0)
2131 : 85 0d __ STA P0 
2133 : a5 17 __ LDA P10 ; (buff + 1)
2135 : 85 0e __ STA P1 
2137 : a9 00 __ LDA #$00
2139 : a4 4c __ LDY T5 + 0 
213b : 91 16 __ STA (P9),y ; (buff + 0)
213d : 20 93 24 JSR $2493 ; (puts.s0 + 0)
2140 : 4c db 20 JMP $20db ; (sformat.l1 + 0)
.s114:
2143 : 18 __ __ CLC
2144 : a5 16 __ LDA P9 ; (buff + 0)
2146 : 65 4c __ ADC T5 + 0 
2148 : 85 16 __ STA P9 ; (buff + 0)
214a : 90 8f __ BCC $20db ; (sformat.l1 + 0)
.s1099:
214c : e6 17 __ INC P10 ; (buff + 1)
214e : b0 8b __ BCS $20db ; (sformat.l1 + 0)
.s4:
2150 : a5 47 __ LDA T0 + 0 
2152 : f0 27 __ BEQ $217b ; (sformat.s9 + 0)
.s7:
2154 : 84 47 __ STY T0 + 0 
2156 : 85 4c __ STA T5 + 0 
2158 : ad fb bf LDA $bffb ; (sstack + 4)
215b : f0 13 __ BEQ $2170 ; (sformat.s11 + 0)
.s10:
215d : a5 16 __ LDA P9 ; (buff + 0)
215f : 85 0d __ STA P0 
2161 : a5 17 __ LDA P10 ; (buff + 1)
2163 : 85 0e __ STA P1 
2165 : 98 __ __ TYA
2166 : a4 4c __ LDY T5 + 0 
2168 : 91 16 __ STA (P9),y ; (buff + 0)
216a : 20 93 24 JSR $2493 ; (puts.s0 + 0)
216d : 4c 7b 21 JMP $217b ; (sformat.s9 + 0)
.s11:
2170 : 18 __ __ CLC
2171 : a5 16 __ LDA P9 ; (buff + 0)
2173 : 65 4c __ ADC T5 + 0 
2175 : 85 16 __ STA P9 ; (buff + 0)
2177 : 90 02 __ BCC $217b ; (sformat.s9 + 0)
.s1095:
2179 : e6 17 __ INC P10 ; (buff + 1)
.s9:
217b : a9 00 __ LDA #$00
217d : 8d e3 bf STA $bfe3 ; (wrapbuffer + 75)
2180 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 76)
2183 : 8d e5 bf STA $bfe5 ; (wrapbuffer + 77)
2186 : 8d e6 bf STA $bfe6 ; (wrapbuffer + 78)
2189 : a9 0a __ LDA #$0a
218b : 8d e2 bf STA $bfe2 ; (wrapbuffer + 74)
218e : a0 01 __ LDY #$01
2190 : b1 49 __ LDA (T1 + 0),y 
2192 : a2 20 __ LDX #$20
2194 : 8e df bf STX $bfdf ; (wrapbuffer + 71)
2197 : a2 00 __ LDX #$00
2199 : 8e e0 bf STX $bfe0 ; (wrapbuffer + 72)
219c : ca __ __ DEX
219d : 8e e1 bf STX $bfe1 ; (wrapbuffer + 73)
21a0 : aa __ __ TAX
21a1 : 18 __ __ CLC
21a2 : a5 49 __ LDA T1 + 0 
21a4 : 69 02 __ ADC #$02
21a6 : 4c b3 21 JMP $21b3 ; (sformat.l14 + 0)
.s264:
21a9 : a0 00 __ LDY #$00
21ab : b1 49 __ LDA (T1 + 0),y 
21ad : aa __ __ TAX
21ae : 18 __ __ CLC
21af : a5 49 __ LDA T1 + 0 
21b1 : 69 01 __ ADC #$01
.l14:
21b3 : 85 49 __ STA T1 + 0 
21b5 : 90 02 __ BCC $21b9 ; (sformat.s1082 + 0)
.s1081:
21b7 : e6 4a __ INC T1 + 1 
.s1082:
21b9 : 8a __ __ TXA
21ba : e0 2b __ CPX #$2b
21bc : d0 07 __ BNE $21c5 ; (sformat.s17 + 0)
.s16:
21be : a9 01 __ LDA #$01
21c0 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 76)
21c3 : d0 e4 __ BNE $21a9 ; (sformat.s264 + 0)
.s17:
21c5 : c9 30 __ CMP #$30
21c7 : d0 06 __ BNE $21cf ; (sformat.s20 + 0)
.s19:
21c9 : 8d df bf STA $bfdf ; (wrapbuffer + 71)
21cc : 4c a9 21 JMP $21a9 ; (sformat.s264 + 0)
.s20:
21cf : c9 23 __ CMP #$23
21d1 : d0 07 __ BNE $21da ; (sformat.s23 + 0)
.s22:
21d3 : a9 01 __ LDA #$01
21d5 : 8d e6 bf STA $bfe6 ; (wrapbuffer + 78)
21d8 : d0 cf __ BNE $21a9 ; (sformat.s264 + 0)
.s23:
21da : c9 2d __ CMP #$2d
21dc : d0 07 __ BNE $21e5 ; (sformat.s15 + 0)
.s25:
21de : a9 01 __ LDA #$01
21e0 : 8d e5 bf STA $bfe5 ; (wrapbuffer + 77)
21e3 : d0 c4 __ BNE $21a9 ; (sformat.s264 + 0)
.s15:
21e5 : 85 4c __ STA T5 + 0 
21e7 : c9 30 __ CMP #$30
21e9 : 90 55 __ BCC $2240 ; (sformat.s31 + 0)
.s32:
21eb : c9 3a __ CMP #$3a
21ed : b0 51 __ BCS $2240 ; (sformat.s31 + 0)
.s29:
21ef : a9 00 __ LDA #$00
21f1 : 85 44 __ STA T6 + 0 
21f3 : 85 45 __ STA T6 + 1 
21f5 : e0 3a __ CPX #$3a
21f7 : b0 40 __ BCS $2239 ; (sformat.s35 + 0)
.l34:
21f9 : a5 44 __ LDA T6 + 0 
21fb : 0a __ __ ASL
21fc : 85 1b __ STA ACCU + 0 ; (fps + 0)
21fe : a5 45 __ LDA T6 + 1 
2200 : 2a __ __ ROL
2201 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
2203 : 2a __ __ ROL
2204 : aa __ __ TAX
2205 : 18 __ __ CLC
2206 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
2208 : 65 44 __ ADC T6 + 0 
220a : 85 44 __ STA T6 + 0 
220c : 8a __ __ TXA
220d : 65 45 __ ADC T6 + 1 
220f : 06 44 __ ASL T6 + 0 
2211 : 2a __ __ ROL
2212 : aa __ __ TAX
2213 : 18 __ __ CLC
2214 : a5 44 __ LDA T6 + 0 
2216 : 65 4c __ ADC T5 + 0 
2218 : 90 01 __ BCC $221b ; (sformat.s1092 + 0)
.s1091:
221a : e8 __ __ INX
.s1092:
221b : 38 __ __ SEC
221c : e9 30 __ SBC #$30
221e : 85 44 __ STA T6 + 0 
2220 : 8a __ __ TXA
2221 : e9 00 __ SBC #$00
2223 : 85 45 __ STA T6 + 1 
2225 : a0 00 __ LDY #$00
2227 : b1 49 __ LDA (T1 + 0),y 
2229 : 85 4c __ STA T5 + 0 
222b : e6 49 __ INC T1 + 0 
222d : d0 02 __ BNE $2231 ; (sformat.s1094 + 0)
.s1093:
222f : e6 4a __ INC T1 + 1 
.s1094:
2231 : c9 30 __ CMP #$30
2233 : 90 04 __ BCC $2239 ; (sformat.s35 + 0)
.s36:
2235 : c9 3a __ CMP #$3a
2237 : 90 c0 __ BCC $21f9 ; (sformat.l34 + 0)
.s35:
2239 : a5 44 __ LDA T6 + 0 
223b : 8d e0 bf STA $bfe0 ; (wrapbuffer + 72)
223e : a5 4c __ LDA T5 + 0 
.s31:
2240 : c9 2e __ CMP #$2e
2242 : d0 4d __ BNE $2291 ; (sformat.s39 + 0)
.s37:
2244 : a9 00 __ LDA #$00
2246 : 85 44 __ STA T6 + 0 
2248 : f0 08 __ BEQ $2252 ; (sformat.l243 + 0)
.s1090:
224a : 38 __ __ SEC
224b : e9 30 __ SBC #$30
224d : 85 44 __ STA T6 + 0 
224f : 8a __ __ TXA
2250 : e9 00 __ SBC #$00
.l243:
2252 : 85 45 __ STA T6 + 1 
2254 : a0 00 __ LDY #$00
2256 : b1 49 __ LDA (T1 + 0),y 
2258 : 85 4c __ STA T5 + 0 
225a : e6 49 __ INC T1 + 0 
225c : d0 02 __ BNE $2260 ; (sformat.s1084 + 0)
.s1083:
225e : e6 4a __ INC T1 + 1 
.s1084:
2260 : c9 30 __ CMP #$30
2262 : 90 28 __ BCC $228c ; (sformat.s42 + 0)
.s43:
2264 : c9 3a __ CMP #$3a
2266 : b0 24 __ BCS $228c ; (sformat.s42 + 0)
.s41:
2268 : a5 44 __ LDA T6 + 0 
226a : 0a __ __ ASL
226b : 85 1b __ STA ACCU + 0 ; (fps + 0)
226d : a5 45 __ LDA T6 + 1 
226f : 2a __ __ ROL
2270 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
2272 : 2a __ __ ROL
2273 : aa __ __ TAX
2274 : 18 __ __ CLC
2275 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
2277 : 65 44 __ ADC T6 + 0 
2279 : 85 44 __ STA T6 + 0 
227b : 8a __ __ TXA
227c : 65 45 __ ADC T6 + 1 
227e : 06 44 __ ASL T6 + 0 
2280 : 2a __ __ ROL
2281 : aa __ __ TAX
2282 : 18 __ __ CLC
2283 : a5 44 __ LDA T6 + 0 
2285 : 65 4c __ ADC T5 + 0 
2287 : 90 c1 __ BCC $224a ; (sformat.s1090 + 0)
.s1089:
2289 : e8 __ __ INX
228a : b0 be __ BCS $224a ; (sformat.s1090 + 0)
.s42:
228c : a6 44 __ LDX T6 + 0 
228e : 8e e1 bf STX $bfe1 ; (wrapbuffer + 73)
.s39:
2291 : c9 64 __ CMP #$64
2293 : f0 04 __ BEQ $2299 ; (sformat.s44 + 0)
.s47:
2295 : c9 44 __ CMP #$44
2297 : d0 05 __ BNE $229e ; (sformat.s45 + 0)
.s44:
2299 : a9 01 __ LDA #$01
229b : 4c 57 24 JMP $2457 ; (sformat.s261 + 0)
.s45:
229e : c9 75 __ CMP #$75
22a0 : d0 03 __ BNE $22a5 ; (sformat.s51 + 0)
22a2 : 4c 55 24 JMP $2455 ; (sformat.s291 + 0)
.s51:
22a5 : c9 55 __ CMP #$55
22a7 : d0 03 __ BNE $22ac ; (sformat.s49 + 0)
22a9 : 4c 55 24 JMP $2455 ; (sformat.s291 + 0)
.s49:
22ac : c9 78 __ CMP #$78
22ae : f0 04 __ BEQ $22b4 ; (sformat.s52 + 0)
.s55:
22b0 : c9 58 __ CMP #$58
22b2 : d0 0d __ BNE $22c1 ; (sformat.s53 + 0)
.s52:
22b4 : a9 10 __ LDA #$10
22b6 : 8d e2 bf STA $bfe2 ; (wrapbuffer + 74)
22b9 : a9 00 __ LDA #$00
22bb : 8d e3 bf STA $bfe3 ; (wrapbuffer + 75)
22be : 4c 55 24 JMP $2455 ; (sformat.s291 + 0)
.s53:
22c1 : c9 6c __ CMP #$6c
22c3 : d0 03 __ BNE $22c8 ; (sformat.s59 + 0)
22c5 : 4c d9 23 JMP $23d9 ; (sformat.s56 + 0)
.s59:
22c8 : c9 4c __ CMP #$4c
22ca : d0 03 __ BNE $22cf ; (sformat.s57 + 0)
22cc : 4c d9 23 JMP $23d9 ; (sformat.s56 + 0)
.s57:
22cf : c9 73 __ CMP #$73
22d1 : f0 54 __ BEQ $2327 ; (sformat.s72 + 0)
.s75:
22d3 : c9 53 __ CMP #$53
22d5 : f0 50 __ BEQ $2327 ; (sformat.s72 + 0)
.s73:
22d7 : c9 63 __ CMP #$63
22d9 : f0 23 __ BEQ $22fe ; (sformat.s103 + 0)
.s106:
22db : c9 43 __ CMP #$43
22dd : f0 1f __ BEQ $22fe ; (sformat.s103 + 0)
.s104:
22df : 09 00 __ ORA #$00
22e1 : d0 03 __ BNE $22e6 ; (sformat.s107 + 0)
22e3 : 4c db 20 JMP $20db ; (sformat.l1 + 0)
.s107:
22e6 : 18 __ __ CLC
22e7 : a5 16 __ LDA P9 ; (buff + 0)
22e9 : 65 47 __ ADC T0 + 0 
22eb : 85 44 __ STA T6 + 0 
22ed : a5 17 __ LDA P10 ; (buff + 1)
22ef : 69 00 __ ADC #$00
22f1 : 85 45 __ STA T6 + 1 
22f3 : a5 4c __ LDA T5 + 0 
.s1068:
22f5 : a0 00 __ LDY #$00
22f7 : 91 44 __ STA (T6 + 0),y 
22f9 : e6 47 __ INC T0 + 0 
22fb : 4c db 20 JMP $20db ; (sformat.l1 + 0)
.s103:
22fe : ad f9 bf LDA $bff9 ; (sstack + 2)
2301 : 85 4c __ STA T5 + 0 
2303 : 18 __ __ CLC
2304 : 69 02 __ ADC #$02
2306 : 8d f9 bf STA $bff9 ; (sstack + 2)
2309 : ad fa bf LDA $bffa ; (sstack + 3)
230c : 85 4d __ STA T5 + 1 
230e : 69 00 __ ADC #$00
2310 : 8d fa bf STA $bffa ; (sstack + 3)
2313 : 18 __ __ CLC
2314 : a5 16 __ LDA P9 ; (buff + 0)
2316 : 65 47 __ ADC T0 + 0 
2318 : 85 44 __ STA T6 + 0 
231a : a5 17 __ LDA P10 ; (buff + 1)
231c : 69 00 __ ADC #$00
231e : 85 45 __ STA T6 + 1 
2320 : a0 00 __ LDY #$00
2322 : b1 4c __ LDA (T5 + 0),y 
2324 : 4c f5 22 JMP $22f5 ; (sformat.s1068 + 0)
.s72:
2327 : ad f9 bf LDA $bff9 ; (sstack + 2)
232a : 85 4c __ STA T5 + 0 
232c : 18 __ __ CLC
232d : 69 02 __ ADC #$02
232f : 8d f9 bf STA $bff9 ; (sstack + 2)
2332 : ad fa bf LDA $bffa ; (sstack + 3)
2335 : 85 4d __ STA T5 + 1 
2337 : 69 00 __ ADC #$00
2339 : 8d fa bf STA $bffa ; (sstack + 3)
233c : a0 00 __ LDY #$00
233e : 84 4b __ STY T3 + 0 
2340 : b1 4c __ LDA (T5 + 0),y 
2342 : aa __ __ TAX
2343 : c8 __ __ INY
2344 : b1 4c __ LDA (T5 + 0),y 
2346 : 86 4c __ STX T5 + 0 
2348 : 85 4d __ STA T5 + 1 
234a : ad e0 bf LDA $bfe0 ; (wrapbuffer + 72)
234d : f0 0c __ BEQ $235b ; (sformat.s78 + 0)
.s1073:
234f : 88 __ __ DEY
2350 : b1 4c __ LDA (T5 + 0),y 
2352 : f0 05 __ BEQ $2359 ; (sformat.s1074 + 0)
.l80:
2354 : c8 __ __ INY
2355 : b1 4c __ LDA (T5 + 0),y 
2357 : d0 fb __ BNE $2354 ; (sformat.l80 + 0)
.s1074:
2359 : 84 4b __ STY T3 + 0 
.s78:
235b : ad e5 bf LDA $bfe5 ; (wrapbuffer + 77)
235e : d0 19 __ BNE $2379 ; (sformat.s84 + 0)
.s1077:
2360 : a6 4b __ LDX T3 + 0 
2362 : ec e0 bf CPX $bfe0 ; (wrapbuffer + 72)
2365 : a4 47 __ LDY T0 + 0 
2367 : b0 0c __ BCS $2375 ; (sformat.s1078 + 0)
.l86:
2369 : ad df bf LDA $bfdf ; (wrapbuffer + 71)
236c : 91 16 __ STA (P9),y ; (buff + 0)
236e : c8 __ __ INY
236f : e8 __ __ INX
2370 : ec e0 bf CPX $bfe0 ; (wrapbuffer + 72)
2373 : 90 f4 __ BCC $2369 ; (sformat.l86 + 0)
.s1078:
2375 : 86 4b __ STX T3 + 0 
2377 : 84 47 __ STY T0 + 0 
.s84:
2379 : ad fb bf LDA $bffb ; (sstack + 4)
237c : d0 37 __ BNE $23b5 ; (sformat.s88 + 0)
.l94:
237e : a0 00 __ LDY #$00
2380 : b1 4c __ LDA (T5 + 0),y 
2382 : f0 0f __ BEQ $2393 ; (sformat.s251 + 0)
.s95:
2384 : a4 47 __ LDY T0 + 0 
2386 : 91 16 __ STA (P9),y ; (buff + 0)
2388 : e6 47 __ INC T0 + 0 
238a : e6 4c __ INC T5 + 0 
238c : d0 f0 __ BNE $237e ; (sformat.l94 + 0)
.s1087:
238e : e6 4d __ INC T5 + 1 
2390 : 4c 7e 23 JMP $237e ; (sformat.l94 + 0)
.s251:
2393 : ad e5 bf LDA $bfe5 ; (wrapbuffer + 77)
2396 : d0 03 __ BNE $239b ; (sformat.s1075 + 0)
2398 : 4c db 20 JMP $20db ; (sformat.l1 + 0)
.s1075:
239b : a6 4b __ LDX T3 + 0 
239d : ec e0 bf CPX $bfe0 ; (wrapbuffer + 72)
23a0 : a4 47 __ LDY T0 + 0 
23a2 : b0 0c __ BCS $23b0 ; (sformat.s1076 + 0)
.l101:
23a4 : ad df bf LDA $bfdf ; (wrapbuffer + 71)
23a7 : 91 16 __ STA (P9),y ; (buff + 0)
23a9 : c8 __ __ INY
23aa : e8 __ __ INX
23ab : ec e0 bf CPX $bfe0 ; (wrapbuffer + 72)
23ae : 90 f4 __ BCC $23a4 ; (sformat.l101 + 0)
.s1076:
23b0 : 84 47 __ STY T0 + 0 
23b2 : 4c db 20 JMP $20db ; (sformat.l1 + 0)
.s88:
23b5 : a5 47 __ LDA T0 + 0 
23b7 : f0 12 __ BEQ $23cb ; (sformat.s93 + 0)
.s91:
23b9 : a6 16 __ LDX P9 ; (buff + 0)
23bb : 86 0d __ STX P0 
23bd : a6 17 __ LDX P10 ; (buff + 1)
23bf : 86 0e __ STX P1 
23c1 : a8 __ __ TAY
23c2 : a9 00 __ LDA #$00
23c4 : 85 47 __ STA T0 + 0 
23c6 : 91 16 __ STA (P9),y ; (buff + 0)
23c8 : 20 93 24 JSR $2493 ; (puts.s0 + 0)
.s93:
23cb : a5 4c __ LDA T5 + 0 
23cd : 85 0d __ STA P0 
23cf : a5 4d __ LDA T5 + 1 
23d1 : 85 0e __ STA P1 
23d3 : 20 93 24 JSR $2493 ; (puts.s0 + 0)
23d6 : 4c 93 23 JMP $2393 ; (sformat.s251 + 0)
.s56:
23d9 : ad f9 bf LDA $bff9 ; (sstack + 2)
23dc : 85 4c __ STA T5 + 0 
23de : 18 __ __ CLC
23df : 69 04 __ ADC #$04
23e1 : 8d f9 bf STA $bff9 ; (sstack + 2)
23e4 : ad fa bf LDA $bffa ; (sstack + 3)
23e7 : 85 4d __ STA T5 + 1 
23e9 : 69 00 __ ADC #$00
23eb : 8d fa bf STA $bffa ; (sstack + 3)
23ee : a0 00 __ LDY #$00
23f0 : b1 49 __ LDA (T1 + 0),y 
23f2 : aa __ __ TAX
23f3 : e6 49 __ INC T1 + 0 
23f5 : d0 02 __ BNE $23f9 ; (sformat.s1086 + 0)
.s1085:
23f7 : e6 4a __ INC T1 + 1 
.s1086:
23f9 : b1 4c __ LDA (T5 + 0),y 
23fb : 85 11 __ STA P4 
23fd : a0 01 __ LDY #$01
23ff : b1 4c __ LDA (T5 + 0),y 
2401 : 85 12 __ STA P5 
2403 : c8 __ __ INY
2404 : b1 4c __ LDA (T5 + 0),y 
2406 : 85 13 __ STA P6 
2408 : c8 __ __ INY
2409 : b1 4c __ LDA (T5 + 0),y 
240b : 85 14 __ STA P7 
240d : 8a __ __ TXA
240e : e0 64 __ CPX #$64
2410 : f0 04 __ BEQ $2416 ; (sformat.s60 + 0)
.s63:
2412 : c9 44 __ CMP #$44
2414 : d0 04 __ BNE $241a ; (sformat.s61 + 0)
.s60:
2416 : a9 01 __ LDA #$01
2418 : d0 1f __ BNE $2439 ; (sformat.s262 + 0)
.s61:
241a : c9 75 __ CMP #$75
241c : f0 19 __ BEQ $2437 ; (sformat.s292 + 0)
.s67:
241e : c9 55 __ CMP #$55
2420 : f0 15 __ BEQ $2437 ; (sformat.s292 + 0)
.s65:
2422 : c9 78 __ CMP #$78
2424 : f0 07 __ BEQ $242d ; (sformat.s68 + 0)
.s71:
2426 : c9 58 __ CMP #$58
2428 : f0 03 __ BEQ $242d ; (sformat.s68 + 0)
242a : 4c db 20 JMP $20db ; (sformat.l1 + 0)
.s68:
242d : a9 10 __ LDA #$10
242f : 8d e2 bf STA $bfe2 ; (wrapbuffer + 74)
2432 : a9 00 __ LDA #$00
2434 : 8d e3 bf STA $bfe3 ; (wrapbuffer + 75)
.s292:
2437 : a9 00 __ LDA #$00
.s262:
2439 : 85 15 __ STA P8 
243b : a5 16 __ LDA P9 ; (buff + 0)
243d : 85 0f __ STA P2 
243f : a5 17 __ LDA P10 ; (buff + 1)
2441 : 85 10 __ STA P3 
2443 : a9 df __ LDA #$df
2445 : 85 0d __ STA P0 
2447 : a9 bf __ LDA #$bf
2449 : 85 0e __ STA P1 
244b : 20 23 26 JSR $2623 ; (nforml.s0 + 0)
.s1069:
244e : a5 1b __ LDA ACCU + 0 ; (fps + 0)
2450 : 85 47 __ STA T0 + 0 
2452 : 4c db 20 JMP $20db ; (sformat.l1 + 0)
.s291:
2455 : a9 00 __ LDA #$00
.s261:
2457 : 85 13 __ STA P6 
2459 : a5 16 __ LDA P9 ; (buff + 0)
245b : 85 0f __ STA P2 
245d : a5 17 __ LDA P10 ; (buff + 1)
245f : 85 10 __ STA P3 
2461 : ad f9 bf LDA $bff9 ; (sstack + 2)
2464 : 85 47 __ STA T0 + 0 
2466 : ad fa bf LDA $bffa ; (sstack + 3)
2469 : 85 48 __ STA T0 + 1 
246b : a0 00 __ LDY #$00
246d : b1 47 __ LDA (T0 + 0),y 
246f : 85 11 __ STA P4 
2471 : c8 __ __ INY
2472 : b1 47 __ LDA (T0 + 0),y 
2474 : 85 12 __ STA P5 
2476 : 18 __ __ CLC
2477 : a5 47 __ LDA T0 + 0 
2479 : 69 02 __ ADC #$02
247b : 8d f9 bf STA $bff9 ; (sstack + 2)
247e : a5 48 __ LDA T0 + 1 
2480 : 69 00 __ ADC #$00
2482 : 8d fa bf STA $bffa ; (sstack + 3)
2485 : a9 df __ LDA #$df
2487 : 85 0d __ STA P0 
2489 : a9 bf __ LDA #$bf
248b : 85 0e __ STA P1 
248d : 20 e8 24 JSR $24e8 ; (nformi.s0 + 0)
2490 : 4c 4e 24 JMP $244e ; (sformat.s1069 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
2493 : a0 00 __ LDY #$00
2495 : b1 0d __ LDA (P0),y 
2497 : f0 0b __ BEQ $24a4 ; (puts.s1001 + 0)
2499 : 20 a5 24 JSR $24a5 ; (putpch + 0)
249c : e6 0d __ INC P0 
249e : d0 f3 __ BNE $2493 ; (puts.s0 + 0)
24a0 : e6 0e __ INC P1 
24a2 : d0 ef __ BNE $2493 ; (puts.s0 + 0)
.s1001:
24a4 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
24a5 : ae fd 37 LDX $37fd ; (giocharmap + 0)
24a8 : e0 01 __ CPX #$01
24aa : 90 26 __ BCC $24d2 ; (putpch + 45)
24ac : c9 0a __ CMP #$0a
24ae : d0 02 __ BNE $24b2 ; (putpch + 13)
24b0 : a9 0d __ LDA #$0d
24b2 : c9 09 __ CMP #$09
24b4 : f0 1f __ BEQ $24d5 ; (putpch + 48)
24b6 : e0 02 __ CPX #$02
24b8 : 90 18 __ BCC $24d2 ; (putpch + 45)
24ba : c9 41 __ CMP #$41
24bc : 90 14 __ BCC $24d2 ; (putpch + 45)
24be : c9 7b __ CMP #$7b
24c0 : b0 10 __ BCS $24d2 ; (putpch + 45)
24c2 : c9 61 __ CMP #$61
24c4 : b0 04 __ BCS $24ca ; (putpch + 37)
24c6 : c9 5b __ CMP #$5b
24c8 : b0 08 __ BCS $24d2 ; (putpch + 45)
24ca : 49 20 __ EOR #$20
24cc : e0 03 __ CPX #$03
24ce : f0 02 __ BEQ $24d2 ; (putpch + 45)
24d0 : 29 df __ AND #$df
24d2 : 4c d2 ff JMP $ffd2 
24d5 : 38 __ __ SEC
24d6 : 20 f0 ff JSR $fff0 
24d9 : 98 __ __ TYA
24da : 29 03 __ AND #$03
24dc : 49 03 __ EOR #$03
24de : aa __ __ TAX
24df : a9 20 __ LDA #$20
24e1 : 20 d2 ff JSR $ffd2 
24e4 : ca __ __ DEX
24e5 : 10 fa __ BPL $24e1 ; (putpch + 60)
24e7 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
24e8 : a9 00 __ LDA #$00
24ea : 85 43 __ STA T0 + 0 
24ec : a5 13 __ LDA P6 ; (s + 0)
24ee : f0 19 __ BEQ $2509 ; (nformi.s3 + 0)
.s4:
24f0 : 24 12 __ BIT P5 ; (v + 1)
24f2 : 10 15 __ BPL $2509 ; (nformi.s3 + 0)
.s1:
24f4 : 38 __ __ SEC
24f5 : a9 00 __ LDA #$00
24f7 : e5 11 __ SBC P4 ; (v + 0)
24f9 : 85 11 __ STA P4 ; (v + 0)
24fb : a9 00 __ LDA #$00
24fd : e5 12 __ SBC P5 ; (v + 1)
24ff : 85 12 __ STA P5 ; (v + 1)
2501 : e6 43 __ INC T0 + 0 
2503 : a9 10 __ LDA #$10
2505 : 85 44 __ STA T2 + 0 
2507 : d0 0a __ BNE $2513 ; (nformi.s42 + 0)
.s3:
2509 : a9 10 __ LDA #$10
250b : 85 44 __ STA T2 + 0 
250d : a5 11 __ LDA P4 ; (v + 0)
250f : 05 12 __ ORA P5 ; (v + 1)
2511 : f0 46 __ BEQ $2559 ; (nformi.s7 + 0)
.s42:
2513 : a0 03 __ LDY #$03
2515 : b1 0d __ LDA (P0),y ; (si + 0)
2517 : 85 45 __ STA T3 + 0 
2519 : c8 __ __ INY
251a : b1 0d __ LDA (P0),y ; (si + 0)
251c : 85 46 __ STA T3 + 1 
.l6:
251e : a5 11 __ LDA P4 ; (v + 0)
2520 : 85 1b __ STA ACCU + 0 
2522 : a5 12 __ LDA P5 ; (v + 1)
2524 : 85 1c __ STA ACCU + 1 
2526 : a5 45 __ LDA T3 + 0 
2528 : 85 03 __ STA WORK + 0 
252a : a5 46 __ LDA T3 + 1 
252c : 85 04 __ STA WORK + 1 
252e : 20 b0 63 JSR $63b0 ; (divmod + 0)
2531 : a5 06 __ LDA WORK + 3 
2533 : 30 08 __ BMI $253d ; (nformi.s78 + 0)
.s1019:
2535 : d0 0a __ BNE $2541 ; (nformi.s77 + 0)
.s1018:
2537 : a5 05 __ LDA WORK + 2 
2539 : c9 0a __ CMP #$0a
253b : b0 04 __ BCS $2541 ; (nformi.s77 + 0)
.s78:
253d : a9 30 __ LDA #$30
253f : d0 02 __ BNE $2543 ; (nformi.s79 + 0)
.s77:
2541 : a9 37 __ LDA #$37
.s79:
2543 : c6 44 __ DEC T2 + 0 
2545 : 18 __ __ CLC
2546 : 65 05 __ ADC WORK + 2 
2548 : a6 44 __ LDX T2 + 0 
254a : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
254d : a5 1b __ LDA ACCU + 0 
254f : 85 11 __ STA P4 ; (v + 0)
2551 : a5 1c __ LDA ACCU + 1 
2553 : 85 12 __ STA P5 ; (v + 1)
2555 : 05 11 __ ORA P4 ; (v + 0)
2557 : d0 c5 __ BNE $251e ; (nformi.l6 + 0)
.s7:
2559 : a0 02 __ LDY #$02
255b : b1 0d __ LDA (P0),y ; (si + 0)
255d : c9 ff __ CMP #$ff
255f : d0 04 __ BNE $2565 ; (nformi.s80 + 0)
.s81:
2561 : a9 0f __ LDA #$0f
2563 : d0 05 __ BNE $256a ; (nformi.s1026 + 0)
.s80:
2565 : 38 __ __ SEC
2566 : a9 10 __ LDA #$10
2568 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
256a : a8 __ __ TAY
256b : c4 44 __ CPY T2 + 0 
256d : b0 0d __ BCS $257c ; (nformi.s10 + 0)
.s9:
256f : a9 30 __ LDA #$30
.l1027:
2571 : c6 44 __ DEC T2 + 0 
2573 : a6 44 __ LDX T2 + 0 
2575 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
2578 : c4 44 __ CPY T2 + 0 
257a : 90 f5 __ BCC $2571 ; (nformi.l1027 + 0)
.s10:
257c : a0 07 __ LDY #$07
257e : b1 0d __ LDA (P0),y ; (si + 0)
2580 : f0 20 __ BEQ $25a2 ; (nformi.s13 + 0)
.s14:
2582 : a0 04 __ LDY #$04
2584 : b1 0d __ LDA (P0),y ; (si + 0)
2586 : d0 1a __ BNE $25a2 ; (nformi.s13 + 0)
.s1013:
2588 : 88 __ __ DEY
2589 : b1 0d __ LDA (P0),y ; (si + 0)
258b : c9 10 __ CMP #$10
258d : d0 13 __ BNE $25a2 ; (nformi.s13 + 0)
.s11:
258f : a9 58 __ LDA #$58
2591 : a6 44 __ LDX T2 + 0 
2593 : 9d e6 bf STA $bfe6,x ; (wrapbuffer + 78)
2596 : 8a __ __ TXA
2597 : 18 __ __ CLC
2598 : 69 fe __ ADC #$fe
259a : 85 44 __ STA T2 + 0 
259c : aa __ __ TAX
259d : a9 30 __ LDA #$30
259f : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
.s13:
25a2 : a9 00 __ LDA #$00
25a4 : 85 1b __ STA ACCU + 0 
25a6 : a5 43 __ LDA T0 + 0 
25a8 : f0 06 __ BEQ $25b0 ; (nformi.s16 + 0)
.s15:
25aa : c6 44 __ DEC T2 + 0 
25ac : a9 2d __ LDA #$2d
25ae : d0 0a __ BNE $25ba ; (nformi.s1025 + 0)
.s16:
25b0 : a0 05 __ LDY #$05
25b2 : b1 0d __ LDA (P0),y ; (si + 0)
25b4 : f0 09 __ BEQ $25bf ; (nformi.s162 + 0)
.s18:
25b6 : c6 44 __ DEC T2 + 0 
25b8 : a9 2b __ LDA #$2b
.s1025:
25ba : a6 44 __ LDX T2 + 0 
25bc : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
.s162:
25bf : a0 06 __ LDY #$06
25c1 : b1 0d __ LDA (P0),y ; (si + 0)
25c3 : d0 33 __ BNE $25f8 ; (nformi.s24 + 0)
.l30:
25c5 : a0 01 __ LDY #$01
25c7 : b1 0d __ LDA (P0),y ; (si + 0)
25c9 : 18 __ __ CLC
25ca : 65 44 __ ADC T2 + 0 
25cc : b0 04 __ BCS $25d2 ; (nformi.s31 + 0)
.s1006:
25ce : c9 11 __ CMP #$11
25d0 : 90 0d __ BCC $25df ; (nformi.s33 + 0)
.s31:
25d2 : c6 44 __ DEC T2 + 0 
25d4 : a0 00 __ LDY #$00
25d6 : b1 0d __ LDA (P0),y ; (si + 0)
25d8 : a6 44 __ LDX T2 + 0 
25da : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
25dd : b0 e6 __ BCS $25c5 ; (nformi.l30 + 0)
.s33:
25df : a6 44 __ LDX T2 + 0 
25e1 : e0 10 __ CPX #$10
25e3 : b0 0e __ BCS $25f3 ; (nformi.s23 + 0)
.s34:
25e5 : 88 __ __ DEY
.l1022:
25e6 : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 79)
25e9 : 91 0f __ STA (P2),y ; (str + 0)
25eb : c8 __ __ INY
25ec : e8 __ __ INX
25ed : e0 10 __ CPX #$10
25ef : 90 f5 __ BCC $25e6 ; (nformi.l1022 + 0)
.s1023:
25f1 : 84 1b __ STY ACCU + 0 
.s23:
25f3 : a9 00 __ LDA #$00
25f5 : 85 1c __ STA ACCU + 1 
.s1001:
25f7 : 60 __ __ RTS
.s24:
25f8 : a6 44 __ LDX T2 + 0 
25fa : e0 10 __ CPX #$10
25fc : b0 1a __ BCS $2618 ; (nformi.l27 + 0)
.s25:
25fe : a0 00 __ LDY #$00
.l1020:
2600 : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 79)
2603 : 91 0f __ STA (P2),y ; (str + 0)
2605 : c8 __ __ INY
2606 : e8 __ __ INX
2607 : e0 10 __ CPX #$10
2609 : 90 f5 __ BCC $2600 ; (nformi.l1020 + 0)
.s1021:
260b : 84 1b __ STY ACCU + 0 
260d : b0 09 __ BCS $2618 ; (nformi.l27 + 0)
.s28:
260f : 88 __ __ DEY
2610 : b1 0d __ LDA (P0),y ; (si + 0)
2612 : a4 1b __ LDY ACCU + 0 
2614 : 91 0f __ STA (P2),y ; (str + 0)
2616 : e6 1b __ INC ACCU + 0 
.l27:
2618 : a5 1b __ LDA ACCU + 0 
261a : a0 01 __ LDY #$01
261c : d1 0d __ CMP (P0),y ; (si + 0)
261e : 90 ef __ BCC $260f ; (nformi.s28 + 0)
2620 : 4c f3 25 JMP $25f3 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
2623 : a9 00 __ LDA #$00
2625 : 85 43 __ STA T0 + 0 
2627 : a5 15 __ LDA P8 ; (s + 0)
2629 : f0 21 __ BEQ $264c ; (nforml.s182 + 0)
.s4:
262b : a5 14 __ LDA P7 ; (v + 3)
262d : f0 1d __ BEQ $264c ; (nforml.s182 + 0)
.s1032:
262f : 10 1b __ BPL $264c ; (nforml.s182 + 0)
.s1:
2631 : 38 __ __ SEC
2632 : a9 00 __ LDA #$00
2634 : e5 11 __ SBC P4 ; (v + 0)
2636 : 85 11 __ STA P4 ; (v + 0)
2638 : a9 00 __ LDA #$00
263a : e5 12 __ SBC P5 ; (v + 1)
263c : 85 12 __ STA P5 ; (v + 1)
263e : a9 00 __ LDA #$00
2640 : e5 13 __ SBC P6 ; (v + 2)
2642 : 85 13 __ STA P6 ; (v + 2)
2644 : a9 00 __ LDA #$00
2646 : e5 14 __ SBC P7 ; (v + 3)
2648 : 85 14 __ STA P7 ; (v + 3)
264a : e6 43 __ INC T0 + 0 
.s182:
264c : a9 10 __ LDA #$10
264e : 85 44 __ STA T2 + 0 
2650 : a5 14 __ LDA P7 ; (v + 3)
2652 : d0 0c __ BNE $2660 ; (nforml.s42 + 0)
.s1024:
2654 : a5 13 __ LDA P6 ; (v + 2)
2656 : d0 08 __ BNE $2660 ; (nforml.s42 + 0)
.s1025:
2658 : a5 12 __ LDA P5 ; (v + 1)
265a : d0 04 __ BNE $2660 ; (nforml.s42 + 0)
.s1026:
265c : c5 11 __ CMP P4 ; (v + 0)
265e : b0 0e __ BCS $266e ; (nforml.s7 + 0)
.s42:
2660 : a0 03 __ LDY #$03
2662 : b1 0d __ LDA (P0),y ; (si + 0)
2664 : 85 45 __ STA T5 + 0 
2666 : c8 __ __ INY
2667 : b1 0d __ LDA (P0),y ; (si + 0)
2669 : 85 46 __ STA T5 + 1 
266b : 4c 38 27 JMP $2738 ; (nforml.l6 + 0)
.s7:
266e : a0 02 __ LDY #$02
2670 : b1 0d __ LDA (P0),y ; (si + 0)
2672 : c9 ff __ CMP #$ff
2674 : d0 04 __ BNE $267a ; (nforml.s80 + 0)
.s81:
2676 : a9 0f __ LDA #$0f
2678 : d0 05 __ BNE $267f ; (nforml.s1039 + 0)
.s80:
267a : 38 __ __ SEC
267b : a9 10 __ LDA #$10
267d : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
267f : a8 __ __ TAY
2680 : c4 44 __ CPY T2 + 0 
2682 : b0 0d __ BCS $2691 ; (nforml.s10 + 0)
.s9:
2684 : a9 30 __ LDA #$30
.l1040:
2686 : c6 44 __ DEC T2 + 0 
2688 : a6 44 __ LDX T2 + 0 
268a : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
268d : c4 44 __ CPY T2 + 0 
268f : 90 f5 __ BCC $2686 ; (nforml.l1040 + 0)
.s10:
2691 : a0 07 __ LDY #$07
2693 : b1 0d __ LDA (P0),y ; (si + 0)
2695 : f0 20 __ BEQ $26b7 ; (nforml.s13 + 0)
.s14:
2697 : a0 04 __ LDY #$04
2699 : b1 0d __ LDA (P0),y ; (si + 0)
269b : d0 1a __ BNE $26b7 ; (nforml.s13 + 0)
.s1013:
269d : 88 __ __ DEY
269e : b1 0d __ LDA (P0),y ; (si + 0)
26a0 : c9 10 __ CMP #$10
26a2 : d0 13 __ BNE $26b7 ; (nforml.s13 + 0)
.s11:
26a4 : a9 58 __ LDA #$58
26a6 : a6 44 __ LDX T2 + 0 
26a8 : 9d e6 bf STA $bfe6,x ; (wrapbuffer + 78)
26ab : 8a __ __ TXA
26ac : 18 __ __ CLC
26ad : 69 fe __ ADC #$fe
26af : 85 44 __ STA T2 + 0 
26b1 : aa __ __ TAX
26b2 : a9 30 __ LDA #$30
26b4 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
.s13:
26b7 : a9 00 __ LDA #$00
26b9 : 85 1b __ STA ACCU + 0 
26bb : a5 43 __ LDA T0 + 0 
26bd : f0 06 __ BEQ $26c5 ; (nforml.s16 + 0)
.s15:
26bf : c6 44 __ DEC T2 + 0 
26c1 : a9 2d __ LDA #$2d
26c3 : d0 0a __ BNE $26cf ; (nforml.s1038 + 0)
.s16:
26c5 : a0 05 __ LDY #$05
26c7 : b1 0d __ LDA (P0),y ; (si + 0)
26c9 : f0 09 __ BEQ $26d4 ; (nforml.s163 + 0)
.s18:
26cb : c6 44 __ DEC T2 + 0 
26cd : a9 2b __ LDA #$2b
.s1038:
26cf : a6 44 __ LDX T2 + 0 
26d1 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
.s163:
26d4 : a0 06 __ LDY #$06
26d6 : b1 0d __ LDA (P0),y ; (si + 0)
26d8 : d0 33 __ BNE $270d ; (nforml.s24 + 0)
.l30:
26da : a0 01 __ LDY #$01
26dc : b1 0d __ LDA (P0),y ; (si + 0)
26de : 18 __ __ CLC
26df : 65 44 __ ADC T2 + 0 
26e1 : b0 04 __ BCS $26e7 ; (nforml.s31 + 0)
.s1006:
26e3 : c9 11 __ CMP #$11
26e5 : 90 0d __ BCC $26f4 ; (nforml.s33 + 0)
.s31:
26e7 : c6 44 __ DEC T2 + 0 
26e9 : a0 00 __ LDY #$00
26eb : b1 0d __ LDA (P0),y ; (si + 0)
26ed : a6 44 __ LDX T2 + 0 
26ef : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
26f2 : b0 e6 __ BCS $26da ; (nforml.l30 + 0)
.s33:
26f4 : a6 44 __ LDX T2 + 0 
26f6 : e0 10 __ CPX #$10
26f8 : b0 0e __ BCS $2708 ; (nforml.s23 + 0)
.s34:
26fa : 88 __ __ DEY
.l1035:
26fb : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 79)
26fe : 91 0f __ STA (P2),y ; (str + 0)
2700 : c8 __ __ INY
2701 : e8 __ __ INX
2702 : e0 10 __ CPX #$10
2704 : 90 f5 __ BCC $26fb ; (nforml.l1035 + 0)
.s1036:
2706 : 84 1b __ STY ACCU + 0 
.s23:
2708 : a9 00 __ LDA #$00
270a : 85 1c __ STA ACCU + 1 
.s1001:
270c : 60 __ __ RTS
.s24:
270d : a6 44 __ LDX T2 + 0 
270f : e0 10 __ CPX #$10
2711 : b0 1a __ BCS $272d ; (nforml.l27 + 0)
.s25:
2713 : a0 00 __ LDY #$00
.l1033:
2715 : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 79)
2718 : 91 0f __ STA (P2),y ; (str + 0)
271a : c8 __ __ INY
271b : e8 __ __ INX
271c : e0 10 __ CPX #$10
271e : 90 f5 __ BCC $2715 ; (nforml.l1033 + 0)
.s1034:
2720 : 84 1b __ STY ACCU + 0 
2722 : b0 09 __ BCS $272d ; (nforml.l27 + 0)
.s28:
2724 : 88 __ __ DEY
2725 : b1 0d __ LDA (P0),y ; (si + 0)
2727 : a4 1b __ LDY ACCU + 0 
2729 : 91 0f __ STA (P2),y ; (str + 0)
272b : e6 1b __ INC ACCU + 0 
.l27:
272d : a5 1b __ LDA ACCU + 0 
272f : a0 01 __ LDY #$01
2731 : d1 0d __ CMP (P0),y ; (si + 0)
2733 : 90 ef __ BCC $2724 ; (nforml.s28 + 0)
2735 : 4c 08 27 JMP $2708 ; (nforml.s23 + 0)
.l6:
2738 : a5 11 __ LDA P4 ; (v + 0)
273a : 85 1b __ STA ACCU + 0 
273c : a5 12 __ LDA P5 ; (v + 1)
273e : 85 1c __ STA ACCU + 1 
2740 : a5 13 __ LDA P6 ; (v + 2)
2742 : 85 1d __ STA ACCU + 2 
2744 : a5 14 __ LDA P7 ; (v + 3)
2746 : 85 1e __ STA ACCU + 3 
2748 : a5 45 __ LDA T5 + 0 
274a : 85 03 __ STA WORK + 0 
274c : a5 46 __ LDA T5 + 1 
274e : 85 04 __ STA WORK + 1 
2750 : a9 00 __ LDA #$00
2752 : 85 05 __ STA WORK + 2 
2754 : 85 06 __ STA WORK + 3 
2756 : 20 35 64 JSR $6435 ; (divmod32 + 0)
2759 : a5 08 __ LDA WORK + 5 
275b : 30 08 __ BMI $2765 ; (nforml.s78 + 0)
.s1023:
275d : d0 0a __ BNE $2769 ; (nforml.s77 + 0)
.s1022:
275f : a5 07 __ LDA WORK + 4 
2761 : c9 0a __ CMP #$0a
2763 : b0 04 __ BCS $2769 ; (nforml.s77 + 0)
.s78:
2765 : a9 30 __ LDA #$30
2767 : d0 02 __ BNE $276b ; (nforml.s79 + 0)
.s77:
2769 : a9 37 __ LDA #$37
.s79:
276b : c6 44 __ DEC T2 + 0 
276d : 18 __ __ CLC
276e : 65 07 __ ADC WORK + 4 
2770 : a6 44 __ LDX T2 + 0 
2772 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
2775 : a5 1b __ LDA ACCU + 0 
2777 : 85 11 __ STA P4 ; (v + 0)
2779 : a5 1c __ LDA ACCU + 1 
277b : 85 12 __ STA P5 ; (v + 1)
277d : a5 1d __ LDA ACCU + 2 
277f : 85 13 __ STA P6 ; (v + 2)
2781 : a5 1e __ LDA ACCU + 3 
2783 : 85 14 __ STA P7 ; (v + 3)
2785 : d0 b1 __ BNE $2738 ; (nforml.l6 + 0)
.s1018:
2787 : a5 13 __ LDA P6 ; (v + 2)
2789 : d0 ad __ BNE $2738 ; (nforml.l6 + 0)
.s1019:
278b : a5 12 __ LDA P5 ; (v + 1)
278d : d0 a9 __ BNE $2738 ; (nforml.l6 + 0)
.s1020:
278f : c5 11 __ CMP P4 ; (v + 0)
2791 : 90 a5 __ BCC $2738 ; (nforml.l6 + 0)
2793 : 4c 6e 26 JMP $266e ; (nforml.s7 + 0)
--------------------------------------------------------------------
2796 : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
27a6 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
27b6 : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
27c0 : __ __ __ BYT 56 44 43 54 45 53 54 4c 4d 43 00                : VDCTESTLMC.
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
27cb : a5 0d __ LDA P0 
27cd : 05 0e __ ORA P1 
27cf : f0 08 __ BEQ $27d9 ; (krnio_setnam.s0 + 14)
27d1 : a0 ff __ LDY #$ff
27d3 : c8 __ __ INY
27d4 : b1 0d __ LDA (P0),y 
27d6 : d0 fb __ BNE $27d3 ; (krnio_setnam.s0 + 8)
27d8 : 98 __ __ TYA
27d9 : a6 0d __ LDX P0 
27db : a4 0e __ LDY P1 
27dd : 20 bd ff JSR $ffbd 
.s1001:
27e0 : 60 __ __ RTS
--------------------------------------------------------------------
27e1 : __ __ __ BYT 4c 4f 41 44 49 4e 47 3a 20 25 53 0a 00          : LOADING: %S..
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
27ee : a5 0d __ LDA P0 
27f0 : a4 0f __ LDY P2 
27f2 : a6 0e __ LDX P1 
27f4 : 20 ba ff JSR $ffba 
27f7 : a9 00 __ LDA #$00
27f9 : a8 __ __ TAY
27fa : 20 d5 ff JSR $ffd5 
27fd : a9 00 __ LDA #$00
27ff : 2a __ __ ROL
2800 : 49 01 __ EOR #$01
.s1001:
2802 : 60 __ __ RTS
--------------------------------------------------------------------
2803 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
2813 : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
2821 : __ __ __ BYT 53 54 41 54 55 53 3a 20 25 44 0a 00             : STATUS: %D..
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
282d : a9 01 __ LDA #$01
282f : 85 0d __ STA P0 
2831 : a9 00 __ LDA #$00
2833 : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
2835 : a5 0d __ LDA P0 
2837 : 85 1b __ STA ACCU + 0 
2839 : a5 0e __ LDA P1 
283b : 85 1c __ STA ACCU + 1 
283d : ae ff 2d LDX $2dff ; (spentry + 0)
2840 : 9a __ __ TXS
2841 : a9 4c __ LDA #$4c
2843 : 85 54 __ STA $54 
2845 : a9 00 __ LDA #$00
2847 : 85 13 __ STA P6 
.s1001:
2849 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
284a : 38 __ __ SEC
284b : a5 23 __ LDA SP + 0 
284d : e9 04 __ SBC #$04
284f : 85 23 __ STA SP + 0 
2851 : b0 02 __ BCS $2855 ; (vdc_init.s0 + 0)
2853 : c6 24 __ DEC SP + 1 
.s0:
2855 : a9 1a __ LDA #$1a
2857 : 8d 00 d6 STA $d600 
.l463:
285a : 2c 00 d6 BIT $d600 
285d : 10 fb __ BPL $285a ; (vdc_init.l463 + 0)
.s7:
285f : ad 01 d6 LDA $d601 
2862 : 29 f0 __ AND #$f0
2864 : aa __ __ TAX
2865 : a9 1a __ LDA #$1a
2867 : 8d 00 d6 STA $d600 
.l465:
286a : 2c 00 d6 BIT $d600 
286d : 10 fb __ BPL $286a ; (vdc_init.l465 + 0)
.s13:
286f : 8e 01 d6 STX $d601 
2872 : 8d 00 d6 STA $d600 
.l467:
2875 : 2c 00 d6 BIT $d600 
2878 : 10 fb __ BPL $2875 ; (vdc_init.l467 + 0)
.s20:
287a : ad 01 d6 LDA $d601 
287d : 29 0f __ AND #$0f
287f : 09 d0 __ ORA #$d0
2881 : a2 1a __ LDX #$1a
2883 : 8e 00 d6 STX $d600 
.l469:
2886 : 2c 00 d6 BIT $d600 
2889 : 10 fb __ BPL $2886 ; (vdc_init.l469 + 0)
.s26:
288b : 8d 01 d6 STA $d601 
288e : a9 8d __ LDA #$8d
2890 : 8d 7a 6c STA $6c7a ; (vdc_state + 7)
2893 : a9 1c __ LDA #$1c
2895 : 8d 00 d6 STA $d600 
.l471:
2898 : 2c 00 d6 BIT $d600 
289b : 10 fb __ BPL $2898 ; (vdc_init.l471 + 0)
.s32:
289d : ad 01 d6 LDA $d601 
28a0 : aa __ __ TAX
28a1 : 09 10 __ ORA #$10
28a3 : a0 1c __ LDY #$1c
28a5 : 8c 00 d6 STY $d600 
.l473:
28a8 : 2c 00 d6 BIT $d600 
28ab : 10 fb __ BPL $28a8 ; (vdc_init.l473 + 0)
.s39:
28ad : 8d 01 d6 STA $d601 
28b0 : a9 12 __ LDA #$12
28b2 : 8d 00 d6 STA $d600 
.l475:
28b5 : 2c 00 d6 BIT $d600 
28b8 : 10 fb __ BPL $28b5 ; (vdc_init.l475 + 0)
.s46:
28ba : a9 1f __ LDA #$1f
28bc : 8d 01 d6 STA $d601 
28bf : a9 13 __ LDA #$13
28c1 : 8d 00 d6 STA $d600 
.l477:
28c4 : 2c 00 d6 BIT $d600 
28c7 : 10 fb __ BPL $28c4 ; (vdc_init.l477 + 0)
.s51:
28c9 : a9 ff __ LDA #$ff
28cb : 8d 01 d6 STA $d601 
28ce : a9 1f __ LDA #$1f
28d0 : 8d 00 d6 STA $d600 
.l479:
28d3 : 2c 00 d6 BIT $d600 
28d6 : 10 fb __ BPL $28d3 ; (vdc_init.l479 + 0)
.s55:
28d8 : a9 00 __ LDA #$00
28da : 8d 01 d6 STA $d601 
28dd : a9 12 __ LDA #$12
28df : 8d 00 d6 STA $d600 
.l481:
28e2 : 2c 00 d6 BIT $d600 
28e5 : 10 fb __ BPL $28e2 ; (vdc_init.l481 + 0)
.s62:
28e7 : a9 9f __ LDA #$9f
28e9 : 8d 01 d6 STA $d601 
28ec : a9 13 __ LDA #$13
28ee : 8d 00 d6 STA $d600 
.l483:
28f1 : 2c 00 d6 BIT $d600 
28f4 : 10 fb __ BPL $28f1 ; (vdc_init.l483 + 0)
.s67:
28f6 : a9 ff __ LDA #$ff
28f8 : 8d 01 d6 STA $d601 
28fb : a9 1f __ LDA #$1f
28fd : 8d 00 d6 STA $d600 
.l485:
2900 : 2c 00 d6 BIT $d600 
2903 : 10 fb __ BPL $2900 ; (vdc_init.l485 + 0)
.s71:
2905 : a9 ff __ LDA #$ff
2907 : 8d 01 d6 STA $d601 
290a : a9 12 __ LDA #$12
290c : 8d 00 d6 STA $d600 
.l487:
290f : 2c 00 d6 BIT $d600 
2912 : 10 fb __ BPL $290f ; (vdc_init.l487 + 0)
.s78:
2914 : a9 1f __ LDA #$1f
2916 : 8d 01 d6 STA $d601 
2919 : a9 13 __ LDA #$13
291b : 8d 00 d6 STA $d600 
.l489:
291e : 2c 00 d6 BIT $d600 
2921 : 10 fb __ BPL $291e ; (vdc_init.l489 + 0)
.s83:
2923 : a9 ff __ LDA #$ff
2925 : 8d 01 d6 STA $d601 
2928 : a9 1f __ LDA #$1f
292a : 8d 00 d6 STA $d600 
.l491:
292d : 2c 00 d6 BIT $d600 
2930 : 10 fb __ BPL $292d ; (vdc_init.l491 + 0)
.s87:
2932 : ad 01 d6 LDA $d601 
2935 : f0 04 __ BEQ $293b ; (vdc_init.s1038 + 0)
.s1039:
2937 : a9 10 __ LDA #$10
2939 : d0 02 __ BNE $293d ; (vdc_init.s1040 + 0)
.s1038:
293b : a9 40 __ LDA #$40
.s1040:
293d : 8d 73 6c STA $6c73 ; (vdc_state + 0)
2940 : 8c 00 d6 STY $d600 
.l494:
2943 : 2c 00 d6 BIT $d600 
2946 : 10 fb __ BPL $2943 ; (vdc_init.l494 + 0)
.s94:
2948 : 8e 01 d6 STX $d601 
294b : 20 87 29 JSR $2987 ; (vdc_cls.s0 + 0)
294e : 24 d7 __ BIT $d7 
2950 : 30 17 __ BMI $2969 ; (vdc_init.s97 + 0)
.s100:
2952 : a9 94 __ LDA #$94
2954 : a0 02 __ LDY #$02
2956 : 91 23 __ STA (SP + 0),y 
2958 : a9 2a __ LDA #$2a
295a : c8 __ __ INY
295b : 91 23 __ STA (SP + 0),y 
295d : 20 a4 20 JSR $20a4 ; (printf.s0 + 0)
2960 : 20 bf 2a JSR $2abf ; (getch.s0 + 0)
2963 : 20 81 ff JSR $ff81 
2966 : 20 fc 2a JSR $2afc ; (screen_setmode.s0 + 0)
.s97:
2969 : a9 01 __ LDA #$01
296b : 20 04 2b JSR $2b04 ; (fastmode.s0 + 0)
296e : 20 23 2b JSR $2b23 ; (vdc_set_mode@proxy + 0)
2971 : ad 73 6c LDA $6c73 ; (vdc_state + 0)
2974 : c9 40 __ CMP #$40
2976 : d0 03 __ BNE $297b ; (vdc_init.s1001 + 0)
.s107:
2978 : 20 1c 2d JSR $2d1c ; (vdc_set_extended_memsize.s0 + 0)
.s1001:
297b : 18 __ __ CLC
297c : a5 23 __ LDA SP + 0 
297e : 69 04 __ ADC #$04
2980 : 85 23 __ STA SP + 0 
2982 : 90 02 __ BCC $2986 ; (vdc_init.s1001 + 11)
2984 : e6 24 __ INC SP + 1 
2986 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
2987 : a9 00 __ LDA #$00
2989 : 85 0f __ STA P2 
298b : 85 14 __ STA P7 
298d : ad 76 6c LDA $6c76 ; (vdc_state + 3)
2990 : 85 13 __ STA P6 
2992 : a9 20 __ LDA #$20
2994 : 85 11 __ STA P4 
2996 : ad 78 6c LDA $6c78 ; (vdc_state + 5)
2999 : 85 15 __ STA P8 
--------------------------------------------------------------------
vdc_clear: ; vdc_clear(u8,u8,u8,u8,u8)->void
.s0:
299b : 18 __ __ CLC
299c : a5 14 __ LDA P7 ; (y + 0)
299e : 65 15 __ ADC P8 ; (lines + 0)
29a0 : 85 46 __ STA T1 + 0 
29a2 : a9 00 __ LDA #$00
29a4 : 2a __ __ ROL
29a5 : 85 47 __ STA T1 + 1 
29a7 : 90 09 __ BCC $29b2 ; (vdc_clear.l1 + 0)
.s2:
29a9 : 85 10 __ STA P3 
29ab : 20 c0 29 JSR $29c0 ; (vdc_hchar@proxy + 0)
29ae : e6 14 __ INC P7 ; (y + 0)
29b0 : a5 47 __ LDA T1 + 1 
.l1:
29b2 : f0 05 __ BEQ $29b9 ; (vdc_clear.s1002 + 0)
.s1004:
29b4 : a5 14 __ LDA P7 ; (y + 0)
29b6 : 4c a9 29 JMP $29a9 ; (vdc_clear.s2 + 0)
.s1002:
29b9 : a5 14 __ LDA P7 ; (y + 0)
29bb : c5 46 __ CMP T1 + 0 
29bd : 90 ea __ BCC $29a9 ; (vdc_clear.s2 + 0)
.s1001:
29bf : 60 __ __ RTS
--------------------------------------------------------------------
vdc_hchar@proxy: ; vdc_hchar@proxy
29c0 : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
29c3 : 85 12 __ STA P5 
--------------------------------------------------------------------
vdc_hchar: ; vdc_hchar(u8,u8,u8,u8,u8)->void
.s0:
29c5 : a5 10 __ LDA P3 ; (y + 0)
29c7 : 0a __ __ ASL
29c8 : aa __ __ TAX
29c9 : bd 00 6e LDA $6e00,x ; (multab + 0)
29cc : 18 __ __ CLC
29cd : 65 0f __ ADC P2 ; (x + 0)
29cf : 85 43 __ STA T1 + 0 
29d1 : bd 01 6e LDA $6e01,x ; (multab + 1)
29d4 : 69 00 __ ADC #$00
29d6 : 85 44 __ STA T1 + 1 
29d8 : ad 7b 6c LDA $6c7b ; (vdc_state + 8)
29db : 18 __ __ CLC
29dc : 65 43 __ ADC T1 + 0 
29de : 85 0d __ STA P0 
29e0 : ad 7c 6c LDA $6c7c ; (vdc_state + 9)
29e3 : 65 44 __ ADC T1 + 1 
29e5 : 85 0e __ STA P1 
29e7 : 20 70 2a JSR $2a70 ; (vdc_mem_addr.s0 + 0)
29ea : a6 13 __ LDX P6 ; (length + 0)
29ec : ca __ __ DEX
29ed : 86 45 __ STX T2 + 0 
.l221:
29ef : 2c 00 d6 BIT $d600 
29f2 : 10 fb __ BPL $29ef ; (vdc_hchar.l221 + 0)
.s6:
29f4 : a5 11 __ LDA P4 ; (val + 0)
29f6 : 8d 01 d6 STA $d601 
29f9 : a2 18 __ LDX #$18
29fb : 8e 00 d6 STX $d600 
.l223:
29fe : 2c 00 d6 BIT $d600 
2a01 : 10 fb __ BPL $29fe ; (vdc_hchar.l223 + 0)
.s12:
2a03 : ad 01 d6 LDA $d601 
2a06 : 29 7f __ AND #$7f
2a08 : 8e 00 d6 STX $d600 
.l225:
2a0b : 2c 00 d6 BIT $d600 
2a0e : 10 fb __ BPL $2a0b ; (vdc_hchar.l225 + 0)
.s18:
2a10 : 8d 01 d6 STA $d601 
2a13 : a9 1e __ LDA #$1e
2a15 : 8d 00 d6 STA $d600 
.l227:
2a18 : 2c 00 d6 BIT $d600 
2a1b : 10 fb __ BPL $2a18 ; (vdc_hchar.l227 + 0)
.s23:
2a1d : a5 45 __ LDA T2 + 0 
2a1f : 8d 01 d6 STA $d601 
2a22 : ad 7d 6c LDA $6c7d ; (vdc_state + 10)
2a25 : 18 __ __ CLC
2a26 : 65 43 __ ADC T1 + 0 
2a28 : 85 0d __ STA P0 
2a2a : ad 7e 6c LDA $6c7e ; (vdc_state + 11)
2a2d : 65 44 __ ADC T1 + 1 
2a2f : 85 0e __ STA P1 
2a31 : 20 70 2a JSR $2a70 ; (vdc_mem_addr.s0 + 0)
.l229:
2a34 : 2c 00 d6 BIT $d600 
2a37 : 10 fb __ BPL $2a34 ; (vdc_hchar.l229 + 0)
.s27:
2a39 : a5 12 __ LDA P5 ; (attr + 0)
2a3b : 8d 01 d6 STA $d601 
2a3e : a2 18 __ LDX #$18
2a40 : 8e 00 d6 STX $d600 
.l231:
2a43 : 2c 00 d6 BIT $d600 
2a46 : 10 fb __ BPL $2a43 ; (vdc_hchar.l231 + 0)
.s33:
2a48 : ad 01 d6 LDA $d601 
2a4b : 29 7f __ AND #$7f
2a4d : 8e 00 d6 STX $d600 
.l233:
2a50 : 2c 00 d6 BIT $d600 
2a53 : 10 fb __ BPL $2a50 ; (vdc_hchar.l233 + 0)
.s39:
2a55 : 8d 01 d6 STA $d601 
2a58 : a9 1e __ LDA #$1e
2a5a : 8d 00 d6 STA $d600 
.l235:
2a5d : 2c 00 d6 BIT $d600 
2a60 : 10 fb __ BPL $2a5d ; (vdc_hchar.l235 + 0)
.s44:
2a62 : a5 45 __ LDA T2 + 0 
2a64 : 8d 01 d6 STA $d601 
.s1001:
2a67 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
2a68 : a5 0f __ LDA P2 
2a6a : 85 0d __ STA P0 
2a6c : a5 10 __ LDA P3 
2a6e : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
2a70 : a9 12 __ LDA #$12
2a72 : 8d 00 d6 STA $d600 
.l56:
2a75 : 2c 00 d6 BIT $d600 
2a78 : 10 fb __ BPL $2a75 ; (vdc_mem_addr.l56 + 0)
.s5:
2a7a : a5 0e __ LDA P1 ; (addr + 1)
2a7c : 8d 01 d6 STA $d601 
2a7f : a9 13 __ LDA #$13
2a81 : 8d 00 d6 STA $d600 
.l58:
2a84 : 2c 00 d6 BIT $d600 
2a87 : 10 fb __ BPL $2a84 ; (vdc_mem_addr.l58 + 0)
.s10:
2a89 : a5 0d __ LDA P0 ; (addr + 0)
2a8b : 8d 01 d6 STA $d601 
2a8e : a9 1f __ LDA #$1f
2a90 : 8d 00 d6 STA $d600 
.s1001:
2a93 : 60 __ __ RTS
--------------------------------------------------------------------
2a94 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2aa4 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2ab4 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->u8
.s0:
2abf : 20 cb 2a JSR $2acb ; (getpch + 0)
2ac2 : c9 00 __ CMP #$00
2ac4 : f0 f9 __ BEQ $2abf ; (getch.s0 + 0)
2ac6 : 85 1b __ STA ACCU + 0 
.s1001:
2ac8 : a5 1b __ LDA ACCU + 0 
2aca : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
2acb : 20 e4 ff JSR $ffe4 
2ace : ae fd 37 LDX $37fd ; (giocharmap + 0)
2ad1 : e0 01 __ CPX #$01
2ad3 : 90 26 __ BCC $2afb ; (getpch + 48)
2ad5 : c9 0d __ CMP #$0d
2ad7 : d0 02 __ BNE $2adb ; (getpch + 16)
2ad9 : a9 0a __ LDA #$0a
2adb : e0 02 __ CPX #$02
2add : 90 1c __ BCC $2afb ; (getpch + 48)
2adf : c9 db __ CMP #$db
2ae1 : b0 18 __ BCS $2afb ; (getpch + 48)
2ae3 : c9 41 __ CMP #$41
2ae5 : 90 14 __ BCC $2afb ; (getpch + 48)
2ae7 : c9 c1 __ CMP #$c1
2ae9 : 90 02 __ BCC $2aed ; (getpch + 34)
2aeb : 49 a0 __ EOR #$a0
2aed : c9 7b __ CMP #$7b
2aef : b0 0a __ BCS $2afb ; (getpch + 48)
2af1 : c9 61 __ CMP #$61
2af3 : b0 04 __ BCS $2af9 ; (getpch + 46)
2af5 : c9 5b __ CMP #$5b
2af7 : b0 02 __ BCS $2afb ; (getpch + 48)
2af9 : 49 20 __ EOR #$20
2afb : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2afc : 24 d7 __ BIT $d7 
2afe : 10 01 __ BPL $2b01 ; (screen_setmode.s6 + 0)
.s1001:
2b00 : 60 __ __ RTS
.s6:
2b01 : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2b04 : 09 00 __ ORA #$00
2b06 : d0 0d __ BNE $2b15 ; (fastmode.s1 + 0)
.s2:
2b08 : 8d 30 d0 STA $d030 
2b0b : ad 11 d0 LDA $d011 
2b0e : 29 7f __ AND #$7f
2b10 : 09 10 __ ORA #$10
2b12 : 4c 1f 2b JMP $2b1f ; (fastmode.s3 + 0)
.s1:
2b15 : a9 01 __ LDA #$01
2b17 : 8d 30 d0 STA $d030 
2b1a : ad 11 d0 LDA $d011 
2b1d : 29 6f __ AND #$6f
.s3:
2b1f : 8d 11 d0 STA $d011 
.s1001:
2b22 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode@proxy: ; vdc_set_mode@proxy
2b23 : a9 00 __ LDA #$00
2b25 : 85 16 __ STA P9 
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
2b27 : a5 53 __ LDA T5 + 0 
2b29 : 8d f5 bf STA $bff5 ; (buffer + 14)
2b2c : a5 54 __ LDA T5 + 1 
2b2e : 8d f6 bf STA $bff6 ; (buffer + 15)
.s0:
2b31 : a4 16 __ LDY P9 ; (mode + 0)
2b33 : be 6a 66 LDX $666a,y ; (__multab36L + 0)
2b36 : 86 4b __ STX T1 + 0 
2b38 : 86 4d __ STX T2 + 0 
2b3a : bd 04 68 LDA $6804,x ; (vdc_modes + 4)
2b3d : f0 0a __ BEQ $2b49 ; (vdc_set_mode.s3 + 0)
.s4:
2b3f : ad 73 6c LDA $6c73 ; (vdc_state + 0)
2b42 : c9 10 __ CMP #$10
2b44 : d0 03 __ BNE $2b49 ; (vdc_set_mode.s3 + 0)
2b46 : 4c a2 2c JMP $2ca2 ; (vdc_set_mode.s1001 + 0)
.s3:
2b49 : 8c 75 6c STY $6c75 ; (vdc_state + 2)
2b4c : a9 00 __ LDA #$00
2b4e : 8d 89 6c STA $6c89 ; (vdc_state + 22)
2b51 : 8d 8a 6c STA $6c8a ; (vdc_state + 23)
2b54 : 8d 8b 6c STA $6c8b ; (vdc_state + 24)
2b57 : bd 00 68 LDA $6800,x ; (vdc_modes + 0)
2b5a : 8d 76 6c STA $6c76 ; (vdc_state + 3)
2b5d : bd 01 68 LDA $6801,x ; (vdc_modes + 1)
2b60 : 8d 77 6c STA $6c77 ; (vdc_state + 4)
2b63 : bd 02 68 LDA $6802,x ; (vdc_modes + 2)
2b66 : 8d 78 6c STA $6c78 ; (vdc_state + 5)
2b69 : bd 03 68 LDA $6803,x ; (vdc_modes + 3)
2b6c : 8d 79 6c STA $6c79 ; (vdc_state + 6)
2b6f : bd 09 68 LDA $6809,x ; (vdc_modes + 9)
2b72 : 8d 7f 6c STA $6c7f ; (vdc_state + 12)
2b75 : bd 0a 68 LDA $680a,x ; (vdc_modes + 10)
2b78 : 8d 80 6c STA $6c80 ; (vdc_state + 13)
2b7b : bd 0b 68 LDA $680b,x ; (vdc_modes + 11)
2b7e : 8d 81 6c STA $6c81 ; (vdc_state + 14)
2b81 : bd 0c 68 LDA $680c,x ; (vdc_modes + 12)
2b84 : 8d 82 6c STA $6c82 ; (vdc_state + 15)
2b87 : bd 0d 68 LDA $680d,x ; (vdc_modes + 13)
2b8a : 8d 83 6c STA $6c83 ; (vdc_state + 16)
2b8d : bd 0e 68 LDA $680e,x ; (vdc_modes + 14)
2b90 : 8d 84 6c STA $6c84 ; (vdc_state + 17)
2b93 : bd 0f 68 LDA $680f,x ; (vdc_modes + 15)
2b96 : 8d 85 6c STA $6c85 ; (vdc_state + 18)
2b99 : bd 10 68 LDA $6810,x ; (vdc_modes + 16)
2b9c : 8d 86 6c STA $6c86 ; (vdc_state + 19)
2b9f : bd 11 68 LDA $6811,x ; (vdc_modes + 17)
2ba2 : 8d 87 6c STA $6c87 ; (vdc_state + 20)
2ba5 : bd 12 68 LDA $6812,x ; (vdc_modes + 18)
2ba8 : 8d 88 6c STA $6c88 ; (vdc_state + 21)
2bab : bd 05 68 LDA $6805,x ; (vdc_modes + 5)
2bae : 85 4e __ STA T3 + 0 
2bb0 : 8d 7b 6c STA $6c7b ; (vdc_state + 8)
2bb3 : bd 06 68 LDA $6806,x ; (vdc_modes + 6)
2bb6 : 85 4f __ STA T3 + 1 
2bb8 : 8d 7c 6c STA $6c7c ; (vdc_state + 9)
2bbb : bd 07 68 LDA $6807,x ; (vdc_modes + 7)
2bbe : 85 53 __ STA T5 + 0 
2bc0 : 8d 7d 6c STA $6c7d ; (vdc_state + 10)
2bc3 : bd 08 68 LDA $6808,x ; (vdc_modes + 8)
2bc6 : 85 54 __ STA T5 + 1 
2bc8 : 8d 7e 6c STA $6c7e ; (vdc_state + 11)
2bcb : 20 ad 2c JSR $2cad ; (vdc_set_multab.s0 + 0)
2bce : a9 22 __ LDA #$22
2bd0 : 8d 00 d6 STA $d600 
.l295:
2bd3 : 2c 00 d6 BIT $d600 
2bd6 : 10 fb __ BPL $2bd3 ; (vdc_set_mode.l295 + 0)
.s11:
2bd8 : a9 80 __ LDA #$80
2bda : 8d 01 d6 STA $d601 
2bdd : a9 0c __ LDA #$0c
2bdf : 8d 00 d6 STA $d600 
.l297:
2be2 : 2c 00 d6 BIT $d600 
2be5 : 10 fb __ BPL $2be2 ; (vdc_set_mode.l297 + 0)
.s17:
2be7 : a5 4f __ LDA T3 + 1 
2be9 : 8d 01 d6 STA $d601 
2bec : a9 0d __ LDA #$0d
2bee : 8d 00 d6 STA $d600 
.l299:
2bf1 : 2c 00 d6 BIT $d600 
2bf4 : 10 fb __ BPL $2bf1 ; (vdc_set_mode.l299 + 0)
.s22:
2bf6 : a5 4e __ LDA T3 + 0 
2bf8 : 8d 01 d6 STA $d601 
2bfb : a9 14 __ LDA #$14
2bfd : 8d 00 d6 STA $d600 
.l301:
2c00 : 2c 00 d6 BIT $d600 
2c03 : 10 fb __ BPL $2c00 ; (vdc_set_mode.l301 + 0)
.s27:
2c05 : a5 54 __ LDA T5 + 1 
2c07 : 8d 01 d6 STA $d601 
2c0a : a9 15 __ LDA #$15
2c0c : 8d 00 d6 STA $d600 
.l303:
2c0f : 2c 00 d6 BIT $d600 
2c12 : 10 fb __ BPL $2c0f ; (vdc_set_mode.l303 + 0)
.s32:
2c14 : a5 53 __ LDA T5 + 0 
2c16 : 8d 01 d6 STA $d601 
2c19 : a6 4b __ LDX T1 + 0 
2c1b : bd 0e 68 LDA $680e,x ; (vdc_modes + 14)
2c1e : a2 1c __ LDX #$1c
2c20 : 8e 00 d6 STX $d600 
.l305:
2c23 : 2c 00 d6 BIT $d600 
2c26 : 10 fb __ BPL $2c23 ; (vdc_set_mode.l305 + 0)
.s39:
2c28 : aa __ __ TAX
2c29 : ad 01 d6 LDA $d601 
2c2c : 29 10 __ AND #$10
2c2e : 85 53 __ STA T5 + 0 
2c30 : a9 1c __ LDA #$1c
2c32 : 8d 00 d6 STA $d600 
2c35 : 8a __ __ TXA
2c36 : 29 e0 __ AND #$e0
2c38 : 05 53 __ ORA T5 + 0 
.l307:
2c3a : 2c 00 d6 BIT $d600 
2c3d : 10 fb __ BPL $2c3a ; (vdc_set_mode.l307 + 0)
.s45:
2c3f : 8d 01 d6 STA $d601 
2c42 : 20 fd 2c JSR $2cfd ; (vdc_restore_charsets.s0 + 0)
2c45 : 18 __ __ CLC
2c46 : a9 13 __ LDA #$13
2c48 : 65 4b __ ADC T1 + 0 
2c4a : 85 4b __ STA T1 + 0 
2c4c : a9 68 __ LDA #$68
2c4e : 69 00 __ ADC #$00
2c50 : 85 4c __ STA T1 + 1 
2c52 : 18 __ __ CLC
2c53 : a5 4d __ LDA T2 + 0 
2c55 : 69 13 __ ADC #$13
2c57 : 85 4e __ STA T3 + 0 
2c59 : a9 00 __ LDA #$00
2c5b : 85 43 __ STA T0 + 0 
2c5d : 69 68 __ ADC #$68
2c5f : 85 4f __ STA T3 + 1 
.l46:
2c61 : a4 43 __ LDY T0 + 0 
2c63 : b1 4b __ LDA (T1 + 0),y 
2c65 : 85 47 __ STA T7 + 0 
2c67 : c8 __ __ INY
2c68 : b1 4b __ LDA (T1 + 0),y 
2c6a : aa __ __ TAX
2c6b : a5 47 __ LDA T7 + 0 
2c6d : 8d 00 d6 STA $d600 
2c70 : c8 __ __ INY
2c71 : 84 43 __ STY T0 + 0 
.l309:
2c73 : 2c 00 d6 BIT $d600 
2c76 : 10 fb __ BPL $2c73 ; (vdc_set_mode.l309 + 0)
.s52:
2c78 : 8e 01 d6 STX $d601 
2c7b : b1 4e __ LDA (T3 + 0),y 
2c7d : c9 ff __ CMP #$ff
2c7f : d0 e0 __ BNE $2c61 ; (vdc_set_mode.l46 + 0)
.s47:
2c81 : a6 4d __ LDX T2 + 0 
2c83 : bd 04 68 LDA $6804,x ; (vdc_modes + 4)
2c86 : f0 08 __ BEQ $2c90 ; (vdc_set_mode.s55 + 0)
.s56:
2c88 : ad 74 6c LDA $6c74 ; (vdc_state + 1)
2c8b : d0 03 __ BNE $2c90 ; (vdc_set_mode.s55 + 0)
.s53:
2c8d : 20 1c 2d JSR $2d1c ; (vdc_set_extended_memsize.s0 + 0)
.s55:
2c90 : 20 87 29 JSR $2987 ; (vdc_cls.s0 + 0)
2c93 : a9 22 __ LDA #$22
2c95 : 8d 00 d6 STA $d600 
.l314:
2c98 : 2c 00 d6 BIT $d600 
2c9b : 10 fb __ BPL $2c98 ; (vdc_set_mode.l314 + 0)
.s62:
2c9d : a9 7d __ LDA #$7d
2c9f : 8d 01 d6 STA $d601 
.s1001:
2ca2 : ad f5 bf LDA $bff5 ; (buffer + 14)
2ca5 : 85 53 __ STA T5 + 0 
2ca7 : ad f6 bf LDA $bff6 ; (buffer + 15)
2caa : 85 54 __ STA T5 + 1 
2cac : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
2cad : ad 78 6c LDA $6c78 ; (vdc_state + 5)
2cb0 : 0d 79 6c ORA $6c79 ; (vdc_state + 6)
2cb3 : f0 47 __ BEQ $2cfc ; (vdc_set_multab.s1001 + 0)
.s5:
2cb5 : ad 76 6c LDA $6c76 ; (vdc_state + 3)
2cb8 : 18 __ __ CLC
2cb9 : 6d 8b 6c ADC $6c8b ; (vdc_state + 24)
2cbc : 85 1b __ STA ACCU + 0 
2cbe : ad 77 6c LDA $6c77 ; (vdc_state + 4)
2cc1 : 69 00 __ ADC #$00
2cc3 : 85 1c __ STA ACCU + 1 
2cc5 : a9 00 __ LDA #$00
2cc7 : 85 43 __ STA T3 + 0 
2cc9 : 85 44 __ STA T3 + 1 
2ccb : a9 00 __ LDA #$00
2ccd : 85 45 __ STA T4 + 0 
2ccf : a9 6e __ LDA #$6e
2cd1 : 85 46 __ STA T4 + 1 
2cd3 : ae 78 6c LDX $6c78 ; (vdc_state + 5)
.l1002:
2cd6 : a5 43 __ LDA T3 + 0 
2cd8 : a0 00 __ LDY #$00
2cda : 91 45 __ STA (T4 + 0),y 
2cdc : a5 44 __ LDA T3 + 1 
2cde : c8 __ __ INY
2cdf : 91 45 __ STA (T4 + 0),y 
2ce1 : 18 __ __ CLC
2ce2 : a5 1b __ LDA ACCU + 0 
2ce4 : 65 43 __ ADC T3 + 0 
2ce6 : 85 43 __ STA T3 + 0 
2ce8 : a5 1c __ LDA ACCU + 1 
2cea : 65 44 __ ADC T3 + 1 
2cec : 85 44 __ STA T3 + 1 
2cee : 18 __ __ CLC
2cef : a5 45 __ LDA T4 + 0 
2cf1 : 69 02 __ ADC #$02
2cf3 : 85 45 __ STA T4 + 0 
2cf5 : 90 02 __ BCC $2cf9 ; (vdc_set_multab.s1005 + 0)
.s1004:
2cf7 : e6 46 __ INC T4 + 1 
.s1005:
2cf9 : ca __ __ DEX
2cfa : d0 da __ BNE $2cd6 ; (vdc_set_multab.l1002 + 0)
.s1001:
2cfc : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
2cfd : ad 83 6c LDA $6c83 ; (vdc_state + 16)
2d00 : 85 0f __ STA P2 
2d02 : a9 01 __ LDA #$01
2d04 : 85 11 __ STA P4 
2d06 : a9 02 __ LDA #$02
2d08 : 85 15 __ STA P8 
2d0a : ad 84 6c LDA $6c84 ; (vdc_state + 17)
2d0d : 85 10 __ STA P3 
2d0f : a9 00 __ LDA #$00
2d11 : 85 14 __ STA P7 
2d13 : 85 12 __ STA P5 
2d15 : a9 d0 __ LDA #$d0
2d17 : 85 13 __ STA P6 
2d19 : 4c 00 13 JMP $1300 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
2d1c : ad 73 6c LDA $6c73 ; (vdc_state + 0)
2d1f : c9 10 __ CMP #$10
2d21 : d0 01 __ BNE $2d24 ; (vdc_set_extended_memsize.s4 + 0)
2d23 : 60 __ __ RTS
.s4:
2d24 : ad 74 6c LDA $6c74 ; (vdc_state + 1)
2d27 : f0 01 __ BEQ $2d2a ; (vdc_set_extended_memsize.s3 + 0)
2d29 : 60 __ __ RTS
.s3:
2d2a : a2 22 __ LDX #$22
2d2c : 8e 00 d6 STX $d600 
.l380:
2d2f : 2c 00 d6 BIT $d600 
2d32 : 10 fb __ BPL $2d2f ; (vdc_set_extended_memsize.l380 + 0)
.s11:
2d34 : 85 4a __ STA T1 + 1 
2d36 : 85 0d __ STA P0 
2d38 : a9 80 __ LDA #$80
2d3a : 8d 01 d6 STA $d601 
2d3d : a9 ff __ LDA #$ff
2d3f : 85 48 __ STA T0 + 0 
.l14:
2d41 : 20 18 67 JSR $6718 ; (vdc_mem_addr@proxy + 0)
.l382:
2d44 : 2c 00 d6 BIT $d600 
2d47 : 10 fb __ BPL $2d44 ; (vdc_set_extended_memsize.l382 + 0)
.s20:
2d49 : a9 00 __ LDA #$00
2d4b : 8d 01 d6 STA $d601 
2d4e : a2 18 __ LDX #$18
2d50 : 8e 00 d6 STX $d600 
.l384:
2d53 : 2c 00 d6 BIT $d600 
2d56 : 10 fb __ BPL $2d53 ; (vdc_set_extended_memsize.l384 + 0)
.s26:
2d58 : ad 01 d6 LDA $d601 
2d5b : 29 7f __ AND #$7f
2d5d : 8e 00 d6 STX $d600 
.l386:
2d60 : 2c 00 d6 BIT $d600 
2d63 : 10 fb __ BPL $2d60 ; (vdc_set_extended_memsize.l386 + 0)
.s32:
2d65 : 8d 01 d6 STA $d601 
2d68 : a9 1e __ LDA #$1e
2d6a : 8d 00 d6 STA $d600 
.l388:
2d6d : 2c 00 d6 BIT $d600 
2d70 : 10 fb __ BPL $2d6d ; (vdc_set_extended_memsize.l388 + 0)
.s37:
2d72 : e6 4a __ INC T1 + 1 
2d74 : a9 ff __ LDA #$ff
2d76 : 8d 01 d6 STA $d601 
2d79 : c6 48 __ DEC T0 + 0 
2d7b : d0 c4 __ BNE $2d41 ; (vdc_set_extended_memsize.l14 + 0)
.s16:
2d7d : 20 18 67 JSR $6718 ; (vdc_mem_addr@proxy + 0)
.l391:
2d80 : 2c 00 d6 BIT $d600 
2d83 : 10 fb __ BPL $2d80 ; (vdc_set_extended_memsize.l391 + 0)
.s41:
2d85 : a9 00 __ LDA #$00
2d87 : 8d 01 d6 STA $d601 
2d8a : a2 18 __ LDX #$18
2d8c : 8e 00 d6 STX $d600 
.l393:
2d8f : 2c 00 d6 BIT $d600 
2d92 : 10 fb __ BPL $2d8f ; (vdc_set_extended_memsize.l393 + 0)
.s47:
2d94 : ad 01 d6 LDA $d601 
2d97 : 29 7f __ AND #$7f
2d99 : 8e 00 d6 STX $d600 
.l395:
2d9c : 2c 00 d6 BIT $d600 
2d9f : 10 fb __ BPL $2d9c ; (vdc_set_extended_memsize.l395 + 0)
.s53:
2da1 : 8d 01 d6 STA $d601 
2da4 : a9 1e __ LDA #$1e
2da6 : 8d 00 d6 STA $d600 
.l397:
2da9 : 2c 00 d6 BIT $d600 
2dac : 10 fb __ BPL $2da9 ; (vdc_set_extended_memsize.l397 + 0)
.s58:
2dae : a9 ff __ LDA #$ff
2db0 : 8d 01 d6 STA $d601 
2db3 : a0 1c __ LDY #$1c
2db5 : 8c 00 d6 STY $d600 
.l399:
2db8 : 2c 00 d6 BIT $d600 
2dbb : 10 fb __ BPL $2db8 ; (vdc_set_extended_memsize.l399 + 0)
.s64:
2dbd : ad 01 d6 LDA $d601 
2dc0 : 09 10 __ ORA #$10
2dc2 : 8c 00 d6 STY $d600 
.l401:
2dc5 : 2c 00 d6 BIT $d600 
2dc8 : 10 fb __ BPL $2dc5 ; (vdc_set_extended_memsize.l401 + 0)
.s70:
2dca : 8d 01 d6 STA $d601 
2dcd : 20 fd 2c JSR $2cfd ; (vdc_restore_charsets.s0 + 0)
2dd0 : 20 87 29 JSR $2987 ; (vdc_cls.s0 + 0)
2dd3 : a9 22 __ LDA #$22
2dd5 : 8d 00 d6 STA $d600 
.l403:
2dd8 : 2c 00 d6 BIT $d600 
2ddb : 10 fb __ BPL $2dd8 ; (vdc_set_extended_memsize.l403 + 0)
.s76:
2ddd : a9 7d __ LDA #$7d
2ddf : 8d 01 d6 STA $d601 
2de2 : a9 01 __ LDA #$01
2de4 : 8d 74 6c STA $6c74 ; (vdc_state + 1)
.s1001:
2de7 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
2de8 : a9 0a __ LDA #$0a
2dea : 85 0f __ STA P2 
2dec : a9 09 __ LDA #$09
2dee : 85 10 __ STA P3 
2df0 : a9 8d __ LDA #$8d
2df2 : 85 13 __ STA P6 
2df4 : 4c 1b 2e JMP $2e1b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
2df7 : __ __ __ BYT 65 4e 00                                        : eN.
--------------------------------------------------------------------
2dfa : __ __ __ BYT 64 49 53 00                                     : dIS.
--------------------------------------------------------------------
2dfe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
spentry:
2dff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
2e00 : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 6f 53 43 41 52 36 34 : sTARTING oSCAR64
2e10 : __ __ __ BYT 20 76 64 63 20 44 45 4d 4f 2e 00                :  vdc DEMO..
--------------------------------------------------------------------
vdc_prints_attr: ; vdc_prints_attr(u8,u8,const u8*,u8)->void
.s0:
2e1b : a5 11 __ LDA P4 ; (string + 0)
2e1d : 85 0d __ STA P0 
2e1f : 85 43 __ STA T0 + 0 
2e21 : a5 12 __ LDA P5 ; (string + 1)
2e23 : 85 0e __ STA P1 
2e25 : 85 44 __ STA T0 + 1 
2e27 : a5 10 __ LDA P3 ; (y + 0)
2e29 : 0a __ __ ASL
2e2a : aa __ __ TAX
2e2b : bd 00 6e LDA $6e00,x ; (multab + 0)
2e2e : 85 45 __ STA T2 + 0 
2e30 : bd 01 6e LDA $6e01,x ; (multab + 1)
2e33 : 85 46 __ STA T2 + 1 
2e35 : 20 f7 2e JSR $2ef7 ; (strlen.s0 + 0)
2e38 : a5 1b __ LDA ACCU + 0 
2e3a : 85 47 __ STA T3 + 0 
2e3c : 18 __ __ CLC
2e3d : a5 0f __ LDA P2 ; (x + 0)
2e3f : 65 45 __ ADC T2 + 0 
2e41 : 85 45 __ STA T2 + 0 
2e43 : 90 02 __ BCC $2e47 ; (vdc_prints_attr.s1041 + 0)
.s1040:
2e45 : e6 46 __ INC T2 + 1 
.s1041:
2e47 : 18 __ __ CLC
2e48 : 6d 7b 6c ADC $6c7b ; (vdc_state + 8)
2e4b : 85 0d __ STA P0 
2e4d : ad 7c 6c LDA $6c7c ; (vdc_state + 9)
2e50 : 65 46 __ ADC T2 + 1 
2e52 : 85 0e __ STA P1 
2e54 : 20 70 2a JSR $2a70 ; (vdc_mem_addr.s0 + 0)
2e57 : a5 47 __ LDA T3 + 0 
2e59 : f0 55 __ BEQ $2eb0 ; (vdc_prints_attr.s6 + 0)
.s64:
2e5b : a0 00 __ LDY #$00
.l4:
2e5d : b1 43 __ LDA (T0 + 0),y 
2e5f : c9 20 __ CMP #$20
2e61 : b0 05 __ BCS $2e68 ; (vdc_prints_attr.s10 + 0)
.s9:
2e63 : 69 80 __ ADC #$80
2e65 : 4c a2 2e JMP $2ea2 ; (vdc_prints_attr.s1038 + 0)
.s10:
2e68 : c9 40 __ CMP #$40
2e6a : aa __ __ TAX
2e6b : 90 2f __ BCC $2e9c ; (vdc_prints_attr.s29 + 0)
.s15:
2e6d : c9 60 __ CMP #$60
2e6f : 90 1b __ BCC $2e8c ; (vdc_prints_attr.s12 + 0)
.s19:
2e71 : 09 00 __ ORA #$00
2e73 : 30 06 __ BMI $2e7b ; (vdc_prints_attr.s17 + 0)
.s16:
2e75 : 38 __ __ SEC
2e76 : e9 20 __ SBC #$20
2e78 : 4c a2 2e JMP $2ea2 ; (vdc_prints_attr.s1038 + 0)
.s17:
2e7b : c9 80 __ CMP #$80
2e7d : 90 1d __ BCC $2e9c ; (vdc_prints_attr.s29 + 0)
.s23:
2e7f : c9 a0 __ CMP #$a0
2e81 : b0 05 __ BCS $2e88 ; (vdc_prints_attr.s27 + 0)
.s20:
2e83 : 69 40 __ ADC #$40
2e85 : 4c a2 2e JMP $2ea2 ; (vdc_prints_attr.s1038 + 0)
.s27:
2e88 : c9 c0 __ CMP #$c0
2e8a : b0 06 __ BCS $2e92 ; (vdc_prints_attr.s31 + 0)
.s12:
2e8c : 38 __ __ SEC
2e8d : e9 40 __ SBC #$40
2e8f : 4c a2 2e JMP $2ea2 ; (vdc_prints_attr.s1038 + 0)
.s31:
2e92 : c9 ff __ CMP #$ff
2e94 : b0 06 __ BCS $2e9c ; (vdc_prints_attr.s29 + 0)
.s28:
2e96 : 38 __ __ SEC
2e97 : e9 80 __ SBC #$80
2e99 : 4c a2 2e JMP $2ea2 ; (vdc_prints_attr.s1038 + 0)
.s29:
2e9c : c9 ff __ CMP #$ff
2e9e : d0 03 __ BNE $2ea3 ; (vdc_prints_attr.l193 + 0)
.s32:
2ea0 : a9 5e __ LDA #$5e
.s1038:
2ea2 : aa __ __ TAX
.l193:
2ea3 : 2c 00 d6 BIT $d600 
2ea6 : 10 fb __ BPL $2ea3 ; (vdc_prints_attr.l193 + 0)
.s37:
2ea8 : 8e 01 d6 STX $d601 
2eab : c8 __ __ INY
2eac : c4 47 __ CPY T3 + 0 
2eae : 90 ad __ BCC $2e5d ; (vdc_prints_attr.l4 + 0)
.s6:
2eb0 : ad 7d 6c LDA $6c7d ; (vdc_state + 10)
2eb3 : 18 __ __ CLC
2eb4 : 65 45 __ ADC T2 + 0 
2eb6 : 85 0d __ STA P0 
2eb8 : ad 7e 6c LDA $6c7e ; (vdc_state + 11)
2ebb : 65 46 __ ADC T2 + 1 
2ebd : 85 0e __ STA P1 
2ebf : 20 70 2a JSR $2a70 ; (vdc_mem_addr.s0 + 0)
2ec2 : a6 47 __ LDX T3 + 0 
2ec4 : ca __ __ DEX
.l196:
2ec5 : 2c 00 d6 BIT $d600 
2ec8 : 10 fb __ BPL $2ec5 ; (vdc_prints_attr.l196 + 0)
.s41:
2eca : a5 13 __ LDA P6 ; (attr + 0)
2ecc : 8d 01 d6 STA $d601 
2ecf : a0 18 __ LDY #$18
2ed1 : 8c 00 d6 STY $d600 
.l198:
2ed4 : 2c 00 d6 BIT $d600 
2ed7 : 10 fb __ BPL $2ed4 ; (vdc_prints_attr.l198 + 0)
.s47:
2ed9 : ad 01 d6 LDA $d601 
2edc : 29 7f __ AND #$7f
2ede : 8c 00 d6 STY $d600 
.l200:
2ee1 : 2c 00 d6 BIT $d600 
2ee4 : 10 fb __ BPL $2ee1 ; (vdc_prints_attr.l200 + 0)
.s53:
2ee6 : 8d 01 d6 STA $d601 
2ee9 : a9 1e __ LDA #$1e
2eeb : 8d 00 d6 STA $d600 
.l202:
2eee : 2c 00 d6 BIT $d600 
2ef1 : 10 fb __ BPL $2eee ; (vdc_prints_attr.l202 + 0)
.s58:
2ef3 : 8e 01 d6 STX $d601 
.s1001:
2ef6 : 60 __ __ RTS
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
2ef7 : a9 00 __ LDA #$00
2ef9 : 85 1b __ STA ACCU + 0 
2efb : 85 1c __ STA ACCU + 1 
2efd : a8 __ __ TAY
2efe : b1 0d __ LDA (P0),y ; (str + 0)
2f00 : f0 18 __ BEQ $2f1a ; (strlen.s1001 + 0)
.s2:
2f02 : a5 0d __ LDA P0 ; (str + 0)
2f04 : 85 1b __ STA ACCU + 0 
2f06 : a2 00 __ LDX #$00
.l1002:
2f08 : c8 __ __ INY
2f09 : d0 01 __ BNE $2f0c ; (strlen.s1005 + 0)
.s1004:
2f0b : e8 __ __ INX
.s1005:
2f0c : 8a __ __ TXA
2f0d : 18 __ __ CLC
2f0e : 65 0e __ ADC P1 ; (str + 1)
2f10 : 85 1c __ STA ACCU + 1 
2f12 : b1 1b __ LDA (ACCU + 0),y 
2f14 : d0 f2 __ BNE $2f08 ; (strlen.l1002 + 0)
.s1003:
2f16 : 86 1c __ STX ACCU + 1 
2f18 : 84 1b __ STY ACCU + 0 
.s1001:
2f1a : 60 __ __ RTS
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s0:
2f1b : a9 00 __ LDA #$00
2f1d : 8d fb bf STA $bffb ; (sstack + 4)
2f20 : a0 02 __ LDY #$02
2f22 : b1 23 __ LDA (SP + 0),y 
2f24 : 85 16 __ STA P9 
2f26 : c8 __ __ INY
2f27 : b1 23 __ LDA (SP + 0),y 
2f29 : 85 17 __ STA P10 
2f2b : c8 __ __ INY
2f2c : b1 23 __ LDA (SP + 0),y 
2f2e : 8d f7 bf STA $bff7 ; (sstack + 0)
2f31 : c8 __ __ INY
2f32 : b1 23 __ LDA (SP + 0),y 
2f34 : 8d f8 bf STA $bff8 ; (sstack + 1)
2f37 : 18 __ __ CLC
2f38 : a5 23 __ LDA SP + 0 
2f3a : 69 06 __ ADC #$06
2f3c : 8d f9 bf STA $bff9 ; (sstack + 2)
2f3f : a5 24 __ LDA SP + 1 
2f41 : 69 00 __ ADC #$00
2f43 : 8d fa bf STA $bffa ; (sstack + 3)
2f46 : 4c cd 20 JMP $20cd ; (sformat.s0 + 0)
--------------------------------------------------------------------
2f49 : __ __ __ BYT 76 64 63 20 4d 45 4d 4f 52 59 20 44 45 54 45 43 : vdc MEMORY DETEC
2f59 : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 2c 20 45 58 54 45 : TED: %U kb, EXTE
2f69 : __ __ __ BYT 4e 44 45 44 20 4d 45 4d 4f 52 59 20 25 53 41 42 : NDED MEMORY %SAB
2f79 : __ __ __ BYT 4c 45 44 2e 00                                  : LED..
--------------------------------------------------------------------
2f7e : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 3a 00 : lOADING ASSETS:.
--------------------------------------------------------------------
2f8e : __ __ __ BYT 2d 20 53 43 52 45 45 4e 3a 20 6c 4f 47 4f 20 41 : - SCREEN: lOGO A
2f9e : __ __ __ BYT 4e 44 20 54 45 53 54 20 53 43 52 45 45 4e 00    : ND TEST SCREEN.
--------------------------------------------------------------------
2fad : __ __ __ BYT 53 43 52 45 45 4e 32 00                         : SCREEN2.
--------------------------------------------------------------------
menu_fileerrormessage: ; menu_fileerrormessage()->void
.s1000:
2fb5 : 38 __ __ SEC
2fb6 : a5 23 __ LDA SP + 0 
2fb8 : e9 08 __ SBC #$08
2fba : 85 23 __ STA SP + 0 
2fbc : b0 02 __ BCS $2fc0 ; (menu_fileerrormessage.s0 + 0)
2fbe : c6 24 __ DEC SP + 1 
.s0:
2fc0 : a9 08 __ LDA #$08
2fc2 : 85 18 __ STA P11 
2fc4 : 8d f7 bf STA $bff7 ; (sstack + 0)
2fc7 : a9 f0 __ LDA #$f0
2fc9 : 85 17 __ STA P10 
2fcb : a9 1e __ LDA #$1e
2fcd : 8d f8 bf STA $bff8 ; (sstack + 1)
2fd0 : a9 06 __ LDA #$06
2fd2 : 8d f9 bf STA $bff9 ; (sstack + 2)
2fd5 : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
2fd8 : 85 52 __ STA T0 + 0 
2fda : a9 8d __ LDA #$8d
2fdc : 8d 7a 6c STA $6c7a ; (vdc_state + 7)
2fdf : 20 39 30 JSR $3039 ; (vdcwin_win_new.s1000 + 0)
2fe2 : a9 35 __ LDA #$35
2fe4 : 85 12 __ STA P5 
2fe6 : a9 06 __ LDA #$06
2fe8 : 85 11 __ STA P4 
2fea : 20 e8 2d JSR $2de8 ; (vdc_prints_attr@proxy + 0)
2fed : a9 8c __ LDA #$8c
2fef : a0 02 __ LDY #$02
2ff1 : 91 23 __ STA (SP + 0),y 
2ff3 : a9 6c __ LDA #$6c
2ff5 : c8 __ __ INY
2ff6 : 91 23 __ STA (SP + 0),y 
2ff8 : a9 12 __ LDA #$12
2ffa : c8 __ __ INY
2ffb : 91 23 __ STA (SP + 0),y 
2ffd : a9 35 __ LDA #$35
2fff : c8 __ __ INY
3000 : 91 23 __ STA (SP + 0),y 
3002 : ad 64 6c LDA $6c64 ; (krnio_pstatus + 1)
3005 : c8 __ __ INY
3006 : 91 23 __ STA (SP + 0),y 
3008 : a9 00 __ LDA #$00
300a : c8 __ __ INY
300b : 91 23 __ STA (SP + 0),y 
300d : 20 1b 2f JSR $2f1b ; (sprintf.s0 + 0)
3010 : a9 0a __ LDA #$0a
3012 : 85 0f __ STA P2 
3014 : a9 0b __ LDA #$0b
3016 : 85 10 __ STA P3 
3018 : 20 09 67 JSR $6709 ; (vdc_prints_attr@proxy + 0)
301b : a9 0d __ LDA #$0d
301d : 85 10 __ STA P3 
301f : 20 f2 66 JSR $66f2 ; (vdc_prints_attr@proxy + 0)
3022 : 20 2c 35 JSR $352c ; (vdcwin_getch.s0 + 0)
3025 : 20 3a 35 JSR $353a ; (vdcwin_win_free.s0 + 0)
3028 : a5 52 __ LDA T0 + 0 
302a : 8d 7a 6c STA $6c7a ; (vdc_state + 7)
.s1001:
302d : 18 __ __ CLC
302e : a5 23 __ LDA SP + 0 
3030 : 69 08 __ ADC #$08
3032 : 85 23 __ STA SP + 0 
3034 : 90 02 __ BCC $3038 ; (menu_fileerrormessage.s1001 + 11)
3036 : e6 24 __ INC SP + 1 
3038 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_new: ; vdcwin_win_new(u8,u8,u8,u8,u8)->void
.s1000:
3039 : a2 03 __ LDX #$03
303b : b5 53 __ LDA T8 + 0,x 
303d : 9d f3 bf STA $bff3,x ; (buffer + 12)
3040 : ca __ __ DEX
3041 : 10 f8 __ BPL $303b ; (vdcwin_win_new.s1000 + 2)
.s0:
3043 : ad f8 bf LDA $bff8 ; (sstack + 1)
3046 : 85 11 __ STA P4 
3048 : 85 4c __ STA T1 + 0 
304a : ad f9 bf LDA $bff9 ; (sstack + 2)
304d : 85 12 __ STA P5 
304f : 85 4d __ STA T3 + 0 
3051 : ad f7 bf LDA $bff7 ; (sstack + 0)
3054 : 0a __ __ ASL
3055 : aa __ __ TAX
3056 : bd 00 6e LDA $6e00,x ; (multab + 0)
3059 : 18 __ __ CLC
305a : 65 18 __ ADC P11 ; (xpos + 0)
305c : 85 53 __ STA T8 + 0 
305e : bd 01 6e LDA $6e01,x ; (multab + 1)
3061 : 69 00 __ ADC #$00
3063 : 85 54 __ STA T8 + 1 
3065 : a5 17 __ LDA P10 ; (border + 0)
3067 : 0a __ __ ASL
3068 : 10 0e __ BPL $3078 ; (vdcwin_win_new.s57 + 0)
.s6:
306a : a5 18 __ LDA P11 ; (xpos + 0)
306c : f0 0a __ BEQ $3078 ; (vdcwin_win_new.s57 + 0)
.s3:
306e : e6 4c __ INC T1 + 0 
3070 : a5 53 __ LDA T8 + 0 
3072 : d0 02 __ BNE $3076 ; (vdcwin_win_new.s1013 + 0)
.s1012:
3074 : c6 54 __ DEC T8 + 1 
.s1013:
3076 : c6 53 __ DEC T8 + 0 
.s57:
3078 : a5 17 __ LDA P10 ; (border + 0)
307a : 29 20 __ AND #$20
307c : f0 15 __ BEQ $3093 ; (vdcwin_win_new.s59 + 0)
.s10:
307e : 18 __ __ CLC
307f : a5 11 __ LDA P4 
3081 : 65 18 __ ADC P11 ; (xpos + 0)
3083 : a8 __ __ TAY
3084 : a9 00 __ LDA #$00
3086 : 2a __ __ ROL
3087 : cd 77 6c CMP $6c77 ; (vdc_state + 4)
308a : d0 03 __ BNE $308f ; (vdcwin_win_new.s1009 + 0)
.s1008:
308c : cc 76 6c CPY $6c76 ; (vdc_state + 3)
.s1009:
308f : b0 02 __ BCS $3093 ; (vdcwin_win_new.s59 + 0)
.s7:
3091 : e6 4c __ INC T1 + 0 
.s59:
3093 : 24 17 __ BIT P10 ; (border + 0)
3095 : 10 1e __ BPL $30b5 ; (vdcwin_win_new.s60 + 0)
.s14:
3097 : ad f7 bf LDA $bff7 ; (sstack + 0)
309a : f0 19 __ BEQ $30b5 ; (vdcwin_win_new.s60 + 0)
.s11:
309c : e6 4d __ INC T3 + 0 
309e : ad 76 6c LDA $6c76 ; (vdc_state + 3)
30a1 : 85 03 __ STA WORK + 0 
30a3 : ad 77 6c LDA $6c77 ; (vdc_state + 4)
30a6 : 85 04 __ STA WORK + 1 
30a8 : 38 __ __ SEC
30a9 : a5 53 __ LDA T8 + 0 
30ab : e5 03 __ SBC WORK + 0 
30ad : 85 53 __ STA T8 + 0 
30af : a5 54 __ LDA T8 + 1 
30b1 : e5 04 __ SBC WORK + 1 
30b3 : 85 54 __ STA T8 + 1 
.s60:
30b5 : a5 17 __ LDA P10 ; (border + 0)
30b7 : 29 10 __ AND #$10
30b9 : f0 16 __ BEQ $30d1 ; (vdcwin_win_new.s17 + 0)
.s18:
30bb : 18 __ __ CLC
30bc : a5 12 __ LDA P5 
30be : 6d f7 bf ADC $bff7 ; (sstack + 0)
30c1 : a8 __ __ TAY
30c2 : a9 00 __ LDA #$00
30c4 : 2a __ __ ROL
30c5 : cd 79 6c CMP $6c79 ; (vdc_state + 6)
30c8 : d0 03 __ BNE $30cd ; (vdcwin_win_new.s1007 + 0)
.s1006:
30ca : cc 78 6c CPY $6c78 ; (vdc_state + 5)
.s1007:
30cd : b0 02 __ BCS $30d1 ; (vdcwin_win_new.s17 + 0)
.s15:
30cf : e6 4d __ INC T3 + 0 
.s17:
30d1 : a5 12 __ LDA P5 
30d3 : 85 1b __ STA ACCU + 0 ; (height + 0)
30d5 : a9 00 __ LDA #$00
30d7 : 85 1c __ STA ACCU + 1 
30d9 : a5 11 __ LDA P4 
30db : 20 46 63 JSR $6346 ; (mul16by8 + 0)
30de : a5 05 __ LDA WORK + 2 
30e0 : 0a __ __ ASL
30e1 : 85 4e __ STA T5 + 0 
30e3 : a5 06 __ LDA WORK + 3 
30e5 : 2a __ __ ROL
30e6 : 85 4f __ STA T5 + 1 
30e8 : ad 61 6c LDA $6c61 ; (winCfg + 6)
30eb : 85 50 __ STA T7 + 0 
30ed : 18 __ __ CLC
30ee : 65 4e __ ADC T5 + 0 
30f0 : 85 4e __ STA T5 + 0 
30f2 : ad 62 6c LDA $6c62 ; (winCfg + 7)
30f5 : 85 51 __ STA T7 + 1 
30f7 : 65 4f __ ADC T5 + 1 
30f9 : 85 4f __ STA T5 + 1 
30fb : ad 5c 6c LDA $6c5c ; (winCfg + 1)
30fe : 18 __ __ CLC
30ff : 6d 5e 6c ADC $6c5e ; (winCfg + 3)
3102 : a8 __ __ TAY
3103 : ad 5d 6c LDA $6c5d ; (winCfg + 2)
3106 : 6d 5f 6c ADC $6c5f ; (winCfg + 4)
3109 : aa __ __ TAX
310a : 98 __ __ TYA
310b : 18 __ __ CLC
310c : 69 fe __ ADC #$fe
310e : a8 __ __ TAY
310f : 8a __ __ TXA
3110 : 69 ff __ ADC #$ff
3112 : c5 4f __ CMP T5 + 1 
3114 : d0 02 __ BNE $3118 ; (vdcwin_win_new.s1005 + 0)
.s1004:
3116 : c4 4e __ CPY T5 + 0 
.s1005:
3118 : 90 51 __ BCC $316b ; (vdcwin_win_new.s1001 + 0)
.s21:
311a : ad 60 6c LDA $6c60 ; (winCfg + 5)
311d : c9 03 __ CMP #$03
311f : f0 4a __ BEQ $316b ; (vdcwin_win_new.s1001 + 0)
.s25:
3121 : a5 18 __ LDA P11 ; (xpos + 0)
3123 : 85 0f __ STA P2 
3125 : ad f7 bf LDA $bff7 ; (sstack + 0)
3128 : 85 10 __ STA P3 
312a : ee 60 6c INC $6c60 ; (winCfg + 5)
312d : ae 60 6c LDX $6c60 ; (winCfg + 5)
3130 : bd 70 66 LDA $6670,x ; (__multab13L + 0)
3133 : 85 4e __ STA T5 + 0 
3135 : 18 __ __ CLC
3136 : 69 b9 __ ADC #$b9
3138 : 85 55 __ STA T10 + 0 
313a : 85 0d __ STA P0 
313c : a9 6d __ LDA #$6d
313e : 69 00 __ ADC #$00
3140 : 85 56 __ STA T10 + 1 
3142 : 85 0e __ STA P1 
3144 : 20 ff 31 JSR $31ff ; (vdcwin_init.s0 + 0)
3147 : a5 50 __ LDA T7 + 0 
3149 : a6 4e __ LDX T5 + 0 
314b : 9d b6 6d STA $6db6,x 
314e : a5 51 __ LDA T7 + 1 
3150 : 9d b7 6d STA $6db7,x 
3153 : a5 17 __ LDA P10 ; (border + 0)
3155 : 9d b8 6d STA $6db8,x 
3158 : a5 4d __ LDA T3 + 0 
315a : d0 1a __ BNE $3176 ; (vdcwin_win_new.s32 + 0)
.s30:
315c : a5 55 __ LDA T10 + 0 
315e : 85 14 __ STA P7 
3160 : a5 56 __ LDA T10 + 1 
3162 : 85 15 __ STA P8 
3164 : a5 17 __ LDA P10 ; (border + 0)
3166 : 85 16 __ STA P9 
3168 : 20 c3 32 JSR $32c3 ; (vdcwin_border_clear.s0 + 0)
.s1001:
316b : a2 03 __ LDX #$03
316d : bd f3 bf LDA $bff3,x ; (buffer + 12)
3170 : 95 53 __ STA T8 + 0,x 
3172 : ca __ __ DEX
3173 : 10 f8 __ BPL $316d ; (vdcwin_win_new.s1001 + 2)
3175 : 60 __ __ RTS
.s32:
3176 : 85 4b __ STA T0 + 0 
3178 : a5 4c __ LDA T1 + 0 
317a : 85 12 __ STA P5 
.l1010:
317c : ad 5b 6c LDA $6c5b ; (winCfg + 0)
317f : 85 0d __ STA P0 
3181 : a9 00 __ LDA #$00
3183 : 85 13 __ STA P6 
3185 : ad 61 6c LDA $6c61 ; (winCfg + 6)
3188 : 85 50 __ STA T7 + 0 
318a : 85 0e __ STA P1 
318c : ad 62 6c LDA $6c62 ; (winCfg + 7)
318f : 85 51 __ STA T7 + 1 
3191 : 85 0f __ STA P2 
3193 : ad 7b 6c LDA $6c7b ; (vdc_state + 8)
3196 : 18 __ __ CLC
3197 : 65 53 __ ADC T8 + 0 
3199 : 85 10 __ STA P3 
319b : ad 7c 6c LDA $6c7c ; (vdc_state + 9)
319e : 65 54 __ ADC T8 + 1 
31a0 : 85 11 __ STA P4 
31a2 : 20 a4 13 JSR $13a4 ; (bnk_cpyfromvdc.s0 + 0)
31a5 : a9 00 __ LDA #$00
31a7 : 85 13 __ STA P6 
31a9 : 18 __ __ CLC
31aa : a5 50 __ LDA T7 + 0 
31ac : 65 12 __ ADC P5 
31ae : 85 50 __ STA T7 + 0 
31b0 : 85 0e __ STA P1 
31b2 : 8d 61 6c STA $6c61 ; (winCfg + 6)
31b5 : a5 51 __ LDA T7 + 1 
31b7 : 69 00 __ ADC #$00
31b9 : 85 51 __ STA T7 + 1 
31bb : 85 0f __ STA P2 
31bd : 8d 62 6c STA $6c62 ; (winCfg + 7)
31c0 : ad 7d 6c LDA $6c7d ; (vdc_state + 10)
31c3 : 18 __ __ CLC
31c4 : 65 53 __ ADC T8 + 0 
31c6 : 85 10 __ STA P3 
31c8 : ad 7e 6c LDA $6c7e ; (vdc_state + 11)
31cb : 65 54 __ ADC T8 + 1 
31cd : 85 11 __ STA P4 
31cf : 20 a4 13 JSR $13a4 ; (bnk_cpyfromvdc.s0 + 0)
31d2 : 18 __ __ CLC
31d3 : a5 50 __ LDA T7 + 0 
31d5 : 65 12 __ ADC P5 
31d7 : 8d 61 6c STA $6c61 ; (winCfg + 6)
31da : a5 51 __ LDA T7 + 1 
31dc : 69 00 __ ADC #$00
31de : 8d 62 6c STA $6c62 ; (winCfg + 7)
31e1 : ad 76 6c LDA $6c76 ; (vdc_state + 3)
31e4 : 18 __ __ CLC
31e5 : 65 53 __ ADC T8 + 0 
31e7 : 85 53 __ STA T8 + 0 
31e9 : ad 77 6c LDA $6c77 ; (vdc_state + 4)
31ec : 65 54 __ ADC T8 + 1 
31ee : 85 54 __ STA T8 + 1 
31f0 : c6 4b __ DEC T0 + 0 
31f2 : d0 88 __ BNE $317c ; (vdcwin_win_new.l1010 + 0)
31f4 : 4c 5c 31 JMP $315c ; (vdcwin_win_new.s30 + 0)
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
31f7 : a9 dc __ LDA #$dc
31f9 : 85 0d __ STA P0 
31fb : a9 bf __ LDA #$bf
31fd : 85 0e __ STA P1 
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
31ff : a9 00 __ LDA #$00
3201 : a0 04 __ LDY #$04
3203 : 91 0d __ STA (P0),y ; (win + 0)
3205 : c8 __ __ INY
3206 : 91 0d __ STA (P0),y ; (win + 0)
3208 : a5 0f __ LDA P2 ; (sx + 0)
320a : a0 00 __ LDY #$00
320c : 91 0d __ STA (P0),y ; (win + 0)
320e : a5 10 __ LDA P3 ; (sy + 0)
3210 : c8 __ __ INY
3211 : 91 0d __ STA (P0),y ; (win + 0)
3213 : a5 11 __ LDA P4 ; (wx + 0)
3215 : c8 __ __ INY
3216 : 91 0d __ STA (P0),y ; (win + 0)
3218 : a5 12 __ LDA P5 ; (wy + 0)
321a : c8 __ __ INY
321b : 91 0d __ STA (P0),y ; (win + 0)
321d : 06 10 __ ASL P3 ; (sy + 0)
321f : a6 10 __ LDX P3 ; (sy + 0)
3221 : bd 00 6e LDA $6e00,x ; (multab + 0)
3224 : 18 __ __ CLC
3225 : 65 0f __ ADC P2 ; (sx + 0)
3227 : 85 1b __ STA ACCU + 0 
3229 : bd 01 6e LDA $6e01,x ; (multab + 1)
322c : 69 00 __ ADC #$00
322e : a8 __ __ TAY
322f : ad 7b 6c LDA $6c7b ; (vdc_state + 8)
3232 : 18 __ __ CLC
3233 : 65 1b __ ADC ACCU + 0 
3235 : 85 1b __ STA ACCU + 0 
3237 : 98 __ __ TYA
3238 : 6d 7c 6c ADC $6c7c ; (vdc_state + 9)
323b : a0 07 __ LDY #$07
323d : 91 0d __ STA (P0),y ; (win + 0)
323f : a5 1b __ LDA ACCU + 0 
3241 : 88 __ __ DEY
3242 : 91 0d __ STA (P0),y ; (win + 0)
3244 : bd 00 6e LDA $6e00,x ; (multab + 0)
3247 : 18 __ __ CLC
3248 : 65 0f __ ADC P2 ; (sx + 0)
324a : 85 1b __ STA ACCU + 0 
324c : bd 01 6e LDA $6e01,x ; (multab + 1)
324f : 69 00 __ ADC #$00
3251 : aa __ __ TAX
3252 : ad 7d 6c LDA $6c7d ; (vdc_state + 10)
3255 : 18 __ __ CLC
3256 : 65 1b __ ADC ACCU + 0 
3258 : 85 1b __ STA ACCU + 0 
325a : 8a __ __ TXA
325b : 6d 7e 6c ADC $6c7e ; (vdc_state + 11)
325e : a0 09 __ LDY #$09
3260 : 91 0d __ STA (P0),y ; (win + 0)
3262 : a5 1b __ LDA ACCU + 0 
3264 : 88 __ __ DEY
3265 : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
3267 : 60 __ __ RTS
--------------------------------------------------------------------
txtscr_scroller_init: ; txtscr_scroller_init(struct TXTSCRScrollText*,struct TXTSCRBigFont*,u8*,u8,u8,u8,u8)->void
.s0:
3268 : a9 00 __ LDA #$00
326a : a0 0e __ LDY #$0e
326c : 91 17 __ STA (P10),y ; (settings + 0)
326e : c8 __ __ INY
326f : 91 17 __ STA (P10),y ; (settings + 0)
3271 : c8 __ __ INY
3272 : 91 17 __ STA (P10),y ; (settings + 0)
3274 : c8 __ __ INY
3275 : 91 17 __ STA (P10),y ; (settings + 0)
3277 : a9 46 __ LDA #$46
3279 : 85 11 __ STA P4 
327b : ad f9 bf LDA $bff9 ; (sstack + 2)
327e : a0 00 __ LDY #$00
3280 : 91 17 __ STA (P10),y ; (settings + 0)
3282 : ad fa bf LDA $bffa ; (sstack + 3)
3285 : c8 __ __ INY
3286 : 91 17 __ STA (P10),y ; (settings + 0)
3288 : ad f8 bf LDA $bff8 ; (sstack + 1)
328b : 85 44 __ STA T1 + 1 
328d : ad f7 bf LDA $bff7 ; (sstack + 0)
3290 : 85 43 __ STA T1 + 0 
3292 : c8 __ __ INY
3293 : 91 17 __ STA (P10),y ; (settings + 0)
3295 : a5 44 __ LDA T1 + 1 
3297 : c8 __ __ INY
3298 : 91 17 __ STA (P10),y ; (settings + 0)
329a : a0 05 __ LDY #$05
329c : 84 0f __ STY P2 
329e : b1 43 __ LDA (T1 + 0),y 
32a0 : 85 12 __ STA P5 
32a2 : 18 __ __ CLC
32a3 : a5 17 __ LDA P10 ; (settings + 0)
32a5 : 69 04 __ ADC #$04
32a7 : 85 0d __ STA P0 
32a9 : a5 18 __ LDA P11 ; (settings + 1)
32ab : 69 00 __ ADC #$00
32ad : 85 0e __ STA P1 
32af : ad fb bf LDA $bffb ; (sstack + 4)
32b2 : 85 10 __ STA P3 
32b4 : 20 ff 31 JSR $31ff ; (vdcwin_init.s0 + 0)
32b7 : a5 0d __ LDA P0 
32b9 : 85 14 __ STA P7 
32bb : a5 0e __ LDA P1 
32bd : 85 15 __ STA P8 
--------------------------------------------------------------------
vdcwin_border_clear@proxy: ; vdcwin_border_clear@proxy
32bf : a9 f0 __ LDA #$f0
32c1 : 85 16 __ STA P9 
--------------------------------------------------------------------
vdcwin_border_clear: ; vdcwin_border_clear(struct VDCWin*,u8)->void
.s0:
32c3 : a5 16 __ LDA P9 ; (border + 0)
32c5 : 29 0f __ AND #$0f
32c7 : 85 47 __ STA T2 + 0 
32c9 : 49 ff __ EOR #$ff
32cb : 18 __ __ CLC
32cc : 69 01 __ ADC #$01
32ce : 29 09 __ AND #$09
32d0 : 85 48 __ STA T3 + 0 
32d2 : aa __ __ TAX
32d3 : bd 5f 67 LDA $675f,x ; (winStyles + 0)
32d6 : 85 49 __ STA T4 + 0 
32d8 : a5 16 __ LDA P9 ; (border + 0)
32da : 0a __ __ ASL
32db : 10 0c __ BPL $32e9 ; (vdcwin_border_clear.s53 + 0)
.s4:
32dd : a0 00 __ LDY #$00
32df : b1 14 __ LDA (P7),y ; (win + 0)
32e1 : d0 06 __ BNE $32e9 ; (vdcwin_border_clear.s53 + 0)
.s1:
32e3 : a5 16 __ LDA P9 ; (border + 0)
32e5 : 29 bf __ AND #$bf
32e7 : 85 16 __ STA P9 ; (border + 0)
.s53:
32e9 : a5 16 __ LDA P9 ; (border + 0)
32eb : 29 20 __ AND #$20
32ed : f0 2c __ BEQ $331b ; (vdcwin_border_clear.s55 + 0)
.s8:
32ef : a0 00 __ LDY #$00
32f1 : b1 14 __ LDA (P7),y ; (win + 0)
32f3 : 18 __ __ CLC
32f4 : a0 02 __ LDY #$02
32f6 : 71 14 __ ADC (P7),y ; (win + 0)
32f8 : a8 __ __ TAY
32f9 : a9 00 __ LDA #$00
32fb : 2a __ __ ROL
32fc : 85 1c __ STA ACCU + 1 
32fe : 98 __ __ TYA
32ff : 69 01 __ ADC #$01
3301 : 85 1b __ STA ACCU + 0 
3303 : 90 02 __ BCC $3307 ; (vdcwin_border_clear.s1009 + 0)
.s1008:
3305 : e6 1c __ INC ACCU + 1 
.s1009:
3307 : ad 77 6c LDA $6c77 ; (vdc_state + 4)
330a : c5 1c __ CMP ACCU + 1 
330c : d0 05 __ BNE $3313 ; (vdcwin_border_clear.s1007 + 0)
.s1006:
330e : ad 76 6c LDA $6c76 ; (vdc_state + 3)
3311 : c5 1b __ CMP ACCU + 0 
.s1007:
3313 : b0 06 __ BCS $331b ; (vdcwin_border_clear.s55 + 0)
.s5:
3315 : a5 16 __ LDA P9 ; (border + 0)
3317 : 29 df __ AND #$df
3319 : 85 16 __ STA P9 ; (border + 0)
.s55:
331b : 24 16 __ BIT P9 ; (border + 0)
331d : 10 67 __ BPL $3386 ; (vdcwin_border_clear.s59 + 0)
.s12:
331f : a0 01 __ LDY #$01
3321 : b1 14 __ LDA (P7),y ; (win + 0)
3323 : f0 61 __ BEQ $3386 ; (vdcwin_border_clear.s59 + 0)
.s9:
3325 : 38 __ __ SEC
3326 : e9 01 __ SBC #$01
3328 : 85 4a __ STA T7 + 0 
332a : a5 16 __ LDA P9 ; (border + 0)
332c : 0a __ __ ASL
332d : 10 18 __ BPL $3347 ; (vdcwin_border_clear.s15 + 0)
.s13:
332f : a5 4a __ LDA T7 + 0 
3331 : 85 0e __ STA P1 
3333 : a5 49 __ LDA T4 + 0 
3335 : 85 10 __ STA P3 
3337 : bd 60 67 LDA $6760,x ; (winStyles + 1)
333a : 85 0f __ STA P2 
333c : 38 __ __ SEC
333d : 88 __ __ DEY
333e : b1 14 __ LDA (P7),y ; (win + 0)
3340 : e9 01 __ SBC #$01
3342 : 85 0d __ STA P0 
3344 : 20 88 34 JSR $3488 ; (vdc_printc.s0 + 0)
.s15:
3347 : a0 00 __ LDY #$00
3349 : b1 14 __ LDA (P7),y ; (win + 0)
334b : 85 46 __ STA T0 + 0 
334d : 85 0f __ STA P2 
334f : a5 4a __ LDA T7 + 0 
3351 : 85 10 __ STA P3 
3353 : a5 49 __ LDA T4 + 0 
3355 : 85 12 __ STA P5 
3357 : a6 48 __ LDX T3 + 0 
3359 : bd 64 67 LDA $6764,x ; (winStyles + 5)
335c : 85 11 __ STA P4 
335e : a0 02 __ LDY #$02
3360 : b1 14 __ LDA (P7),y ; (win + 0)
3362 : 85 13 __ STA P6 
3364 : 20 c5 29 JSR $29c5 ; (vdc_hchar.s0 + 0)
3367 : a5 16 __ LDA P9 ; (border + 0)
3369 : 29 20 __ AND #$20
336b : f0 19 __ BEQ $3386 ; (vdcwin_border_clear.s59 + 0)
.s16:
336d : a5 10 __ LDA P3 
336f : 85 0e __ STA P1 
3371 : a5 12 __ LDA P5 
3373 : 85 10 __ STA P3 
3375 : a6 48 __ LDX T3 + 0 
3377 : bd 61 67 LDA $6761,x ; (winStyles + 2)
337a : 85 0f __ STA P2 
337c : 18 __ __ CLC
337d : a5 13 __ LDA P6 
337f : 65 46 __ ADC T0 + 0 
3381 : 85 0d __ STA P0 
3383 : 20 88 34 JSR $3488 ; (vdc_printc.s0 + 0)
.s59:
3386 : a5 16 __ LDA P9 ; (border + 0)
3388 : 29 10 __ AND #$10
338a : f0 79 __ BEQ $3405 ; (vdcwin_border_clear.s39 + 0)
.s22:
338c : a0 01 __ LDY #$01
338e : b1 14 __ LDA (P7),y ; (win + 0)
3390 : 18 __ __ CLC
3391 : a0 03 __ LDY #$03
3393 : 71 14 __ ADC (P7),y ; (win + 0)
3395 : 85 4a __ STA T7 + 0 
3397 : a9 00 __ LDA #$00
3399 : 2a __ __ ROL
339a : cd 79 6c CMP $6c79 ; (vdc_state + 6)
339d : d0 05 __ BNE $33a4 ; (vdcwin_border_clear.s1005 + 0)
.s1004:
339f : a5 4a __ LDA T7 + 0 
33a1 : cd 78 6c CMP $6c78 ; (vdc_state + 5)
.s1005:
33a4 : b0 5f __ BCS $3405 ; (vdcwin_border_clear.s39 + 0)
.s19:
33a6 : a5 16 __ LDA P9 ; (border + 0)
33a8 : 0a __ __ ASL
33a9 : 10 1b __ BPL $33c6 ; (vdcwin_border_clear.s25 + 0)
.s23:
33ab : a5 4a __ LDA T7 + 0 
33ad : 85 0e __ STA P1 
33af : a5 49 __ LDA T4 + 0 
33b1 : 85 10 __ STA P3 
33b3 : a6 48 __ LDX T3 + 0 
33b5 : bd 62 67 LDA $6762,x ; (winStyles + 3)
33b8 : 85 0f __ STA P2 
33ba : 38 __ __ SEC
33bb : a0 00 __ LDY #$00
33bd : b1 14 __ LDA (P7),y ; (win + 0)
33bf : e9 01 __ SBC #$01
33c1 : 85 0d __ STA P0 
33c3 : 20 88 34 JSR $3488 ; (vdc_printc.s0 + 0)
.s25:
33c6 : a0 00 __ LDY #$00
33c8 : b1 14 __ LDA (P7),y ; (win + 0)
33ca : 85 46 __ STA T0 + 0 
33cc : 85 0f __ STA P2 
33ce : a5 4a __ LDA T7 + 0 
33d0 : 85 10 __ STA P3 
33d2 : a5 49 __ LDA T4 + 0 
33d4 : 85 12 __ STA P5 
33d6 : a6 48 __ LDX T3 + 0 
33d8 : bd 65 67 LDA $6765,x ; (winStyles + 6)
33db : 85 11 __ STA P4 
33dd : a0 02 __ LDY #$02
33df : b1 14 __ LDA (P7),y ; (win + 0)
33e1 : 85 13 __ STA P6 
33e3 : 20 c5 29 JSR $29c5 ; (vdc_hchar.s0 + 0)
33e6 : a5 16 __ LDA P9 ; (border + 0)
33e8 : 29 20 __ AND #$20
33ea : f0 19 __ BEQ $3405 ; (vdcwin_border_clear.s39 + 0)
.s26:
33ec : a5 10 __ LDA P3 
33ee : 85 0e __ STA P1 
33f0 : a5 12 __ LDA P5 
33f2 : 85 10 __ STA P3 
33f4 : a6 48 __ LDX T3 + 0 
33f6 : bd 63 67 LDA $6763,x ; (winStyles + 4)
33f9 : 85 0f __ STA P2 
33fb : 18 __ __ CLC
33fc : a5 13 __ LDA P6 
33fe : 65 46 __ ADC T0 + 0 
3400 : 85 0d __ STA P0 
3402 : 20 88 34 JSR $3488 ; (vdc_printc.s0 + 0)
.s39:
3405 : a9 00 __ LDA #$00
3407 : 85 46 __ STA T0 + 0 
3409 : f0 04 __ BEQ $340f ; (vdcwin_border_clear.l29 + 0)
.s69:
340b : e6 46 __ INC T0 + 0 
340d : a5 46 __ LDA T0 + 0 
.l29:
340f : a0 03 __ LDY #$03
3411 : d1 14 __ CMP (P7),y ; (win + 0)
3413 : 90 01 __ BCC $3416 ; (vdcwin_border_clear.s30 + 0)
.s1001:
3415 : 60 __ __ RTS
.s30:
3416 : a5 16 __ LDA P9 ; (border + 0)
3418 : 0a __ __ ASL
3419 : 10 25 __ BPL $3440 ; (vdcwin_border_clear.s35 + 0)
.s33:
341b : a5 49 __ LDA T4 + 0 
341d : 85 10 __ STA P3 
341f : 38 __ __ SEC
3420 : a0 00 __ LDY #$00
3422 : b1 14 __ LDA (P7),y ; (win + 0)
3424 : e9 01 __ SBC #$01
3426 : 85 0d __ STA P0 
3428 : c8 __ __ INY
3429 : b1 14 __ LDA (P7),y ; (win + 0)
342b : 18 __ __ CLC
342c : 65 46 __ ADC T0 + 0 
342e : 85 0e __ STA P1 
3430 : 38 __ __ SEC
3431 : a9 00 __ LDA #$00
3433 : e5 47 __ SBC T2 + 0 
3435 : 29 09 __ AND #$09
3437 : aa __ __ TAX
3438 : bd 66 67 LDA $6766,x ; (winStyles + 7)
343b : 85 0f __ STA P2 
343d : 20 88 34 JSR $3488 ; (vdc_printc.s0 + 0)
.s35:
3440 : a9 20 __ LDA #$20
3442 : 85 11 __ STA P4 
3444 : a0 02 __ LDY #$02
3446 : b1 14 __ LDA (P7),y ; (win + 0)
3448 : 85 13 __ STA P6 
344a : a0 00 __ LDY #$00
344c : b1 14 __ LDA (P7),y ; (win + 0)
344e : 85 0f __ STA P2 
3450 : c8 __ __ INY
3451 : b1 14 __ LDA (P7),y ; (win + 0)
3453 : 18 __ __ CLC
3454 : 65 46 __ ADC T0 + 0 
3456 : 85 10 __ STA P3 
3458 : 20 c0 29 JSR $29c0 ; (vdc_hchar@proxy + 0)
345b : a5 16 __ LDA P9 ; (border + 0)
345d : 29 20 __ AND #$20
345f : f0 aa __ BEQ $340b ; (vdcwin_border_clear.s69 + 0)
.s36:
3461 : a5 10 __ LDA P3 
3463 : 85 0e __ STA P1 
3465 : a5 49 __ LDA T4 + 0 
3467 : 85 10 __ STA P3 
3469 : 18 __ __ CLC
346a : a5 13 __ LDA P6 
346c : 65 0f __ ADC P2 
346e : 85 0d __ STA P0 
3470 : 38 __ __ SEC
3471 : a9 00 __ LDA #$00
3473 : e5 47 __ SBC T2 + 0 
3475 : 29 09 __ AND #$09
3477 : aa __ __ TAX
3478 : bd 67 67 LDA $6767,x ; (winStyles + 8)
347b : 85 0f __ STA P2 
347d : 20 88 34 JSR $3488 ; (vdc_printc.s0 + 0)
3480 : 4c 0b 34 JMP $340b ; (vdcwin_border_clear.s69 + 0)
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
3483 : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
3486 : 85 10 __ STA P3 
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
3488 : a5 0e __ LDA P1 ; (y + 0)
348a : 0a __ __ ASL
348b : a2 12 __ LDX #$12
348d : 8e 00 d6 STX $d600 
3490 : aa __ __ TAX
3491 : 18 __ __ CLC
3492 : a5 0d __ LDA P0 ; (x + 0)
3494 : 7d 00 6e ADC $6e00,x ; (multab + 0)
3497 : 85 1b __ STA ACCU + 0 
3499 : a9 00 __ LDA #$00
349b : 7d 01 6e ADC $6e01,x ; (multab + 1)
349e : 85 1c __ STA ACCU + 1 
34a0 : 18 __ __ CLC
34a1 : a5 1b __ LDA ACCU + 0 
34a3 : 6d 7b 6c ADC $6c7b ; (vdc_state + 8)
34a6 : aa __ __ TAX
34a7 : a5 1c __ LDA ACCU + 1 
34a9 : 6d 7c 6c ADC $6c7c ; (vdc_state + 9)
.l167:
34ac : 2c 00 d6 BIT $d600 
34af : 10 fb __ BPL $34ac ; (vdc_printc.l167 + 0)
.s9:
34b1 : 8d 01 d6 STA $d601 
34b4 : a9 13 __ LDA #$13
34b6 : 8d 00 d6 STA $d600 
.l169:
34b9 : 2c 00 d6 BIT $d600 
34bc : 10 fb __ BPL $34b9 ; (vdc_printc.l169 + 0)
.s14:
34be : 8e 01 d6 STX $d601 
34c1 : a9 1f __ LDA #$1f
34c3 : 8d 00 d6 STA $d600 
.l171:
34c6 : 2c 00 d6 BIT $d600 
34c9 : 10 fb __ BPL $34c6 ; (vdc_printc.l171 + 0)
.s18:
34cb : a5 0f __ LDA P2 ; (val + 0)
34cd : 8d 01 d6 STA $d601 
34d0 : ad 7d 6c LDA $6c7d ; (vdc_state + 10)
34d3 : 18 __ __ CLC
34d4 : 65 1b __ ADC ACCU + 0 
34d6 : a8 __ __ TAY
34d7 : a9 12 __ LDA #$12
34d9 : 8d 00 d6 STA $d600 
34dc : ad 7e 6c LDA $6c7e ; (vdc_state + 11)
34df : 65 1c __ ADC ACCU + 1 
.l173:
34e1 : 2c 00 d6 BIT $d600 
34e4 : 10 fb __ BPL $34e1 ; (vdc_printc.l173 + 0)
.s25:
34e6 : 8d 01 d6 STA $d601 
34e9 : a9 13 __ LDA #$13
34eb : 8d 00 d6 STA $d600 
.l175:
34ee : 2c 00 d6 BIT $d600 
34f1 : 10 fb __ BPL $34ee ; (vdc_printc.l175 + 0)
.s30:
34f3 : 8c 01 d6 STY $d601 
34f6 : a9 1f __ LDA #$1f
34f8 : 8d 00 d6 STA $d600 
.l177:
34fb : 2c 00 d6 BIT $d600 
34fe : 10 fb __ BPL $34fb ; (vdc_printc.l177 + 0)
.s34:
3500 : a5 10 __ LDA P3 ; (attr + 0)
3502 : 8d 01 d6 STA $d601 
.s1001:
3505 : 60 __ __ RTS
--------------------------------------------------------------------
3506 : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 00             : fILE ERROR!.
--------------------------------------------------------------------
3512 : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 00    : eRROR NR.: %2x.
--------------------------------------------------------------------
3521 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 2e 00                : pRESS KEY..
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
352c : 20 e4 ff JSR $ffe4 
352f : c9 00 __ CMP #$00
3531 : f0 f9 __ BEQ $352c ; (vdcwin_getch.s0 + 0)
3533 : 85 1b __ STA ACCU + 0 
3535 : a9 00 __ LDA #$00
3537 : 85 1c __ STA ACCU + 1 
.s1001:
3539 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_free: ; vdcwin_win_free()->void
.s0:
353a : ad 60 6c LDA $6c60 ; (winCfg + 5)
353d : d0 01 __ BNE $3540 ; (vdcwin_win_free.s3 + 0)
353f : 60 __ __ RTS
.s3:
3540 : 85 44 __ STA T0 + 0 
3542 : a8 __ __ TAY
3543 : be 70 66 LDX $6670,y ; (__multab13L + 0)
3546 : 86 1b __ STX ACCU + 0 
3548 : bc bb 6d LDY $6dbb,x 
354b : 84 1c __ STY ACCU + 1 
354d : bd bc 6d LDA $6dbc,x 
3550 : 85 43 __ STA T5 + 0 
3552 : 85 1d __ STA ACCU + 2 
3554 : bd b6 6d LDA $6db6,x 
3557 : 85 45 __ STA T2 + 0 
3559 : 8d 61 6c STA $6c61 ; (winCfg + 6)
355c : bd b7 6d LDA $6db7,x 
355f : 85 46 __ STA T2 + 1 
3561 : 8d 62 6c STA $6c62 ; (winCfg + 7)
3564 : bd b9 6d LDA $6db9,x 
3567 : 85 1e __ STA ACCU + 3 
3569 : bd ba 6d LDA $6dba,x 
356c : 85 4a __ STA T10 + 0 
356e : 0a __ __ ASL
356f : aa __ __ TAX
3570 : bd 00 6e LDA $6e00,x ; (multab + 0)
3573 : 18 __ __ CLC
3574 : 65 1e __ ADC ACCU + 3 
3576 : 85 4b __ STA T11 + 0 
3578 : bd 01 6e LDA $6e01,x ; (multab + 1)
357b : 69 00 __ ADC #$00
357d : 85 4c __ STA T11 + 1 
357f : a6 1b __ LDX ACCU + 0 
3581 : bd b8 6d LDA $6db8,x 
3584 : 85 1b __ STA ACCU + 0 
3586 : 0a __ __ ASL
3587 : 10 0e __ BPL $3597 ; (vdcwin_win_free.s53 + 0)
.s10:
3589 : a5 1e __ LDA ACCU + 3 
358b : f0 0a __ BEQ $3597 ; (vdcwin_win_free.s53 + 0)
.s7:
358d : e6 1c __ INC ACCU + 1 
358f : a5 4b __ LDA T11 + 0 
3591 : d0 02 __ BNE $3595 ; (vdcwin_win_free.s1009 + 0)
.s1008:
3593 : c6 4c __ DEC T11 + 1 
.s1009:
3595 : c6 4b __ DEC T11 + 0 
.s53:
3597 : a5 1b __ LDA ACCU + 0 
3599 : 29 20 __ AND #$20
359b : f0 14 __ BEQ $35b1 ; (vdcwin_win_free.s55 + 0)
.s14:
359d : 98 __ __ TYA
359e : 18 __ __ CLC
359f : 65 1e __ ADC ACCU + 3 
35a1 : a8 __ __ TAY
35a2 : a9 00 __ LDA #$00
35a4 : 2a __ __ ROL
35a5 : cd 77 6c CMP $6c77 ; (vdc_state + 4)
35a8 : d0 03 __ BNE $35ad ; (vdcwin_win_free.s1005 + 0)
.s1004:
35aa : cc 76 6c CPY $6c76 ; (vdc_state + 3)
.s1005:
35ad : b0 02 __ BCS $35b1 ; (vdcwin_win_free.s55 + 0)
.s11:
35af : e6 1c __ INC ACCU + 1 
.s55:
35b1 : 24 1b __ BIT ACCU + 0 
35b3 : 10 15 __ BPL $35ca ; (vdcwin_win_free.s56 + 0)
.s18:
35b5 : a5 4a __ LDA T10 + 0 
35b7 : f0 11 __ BEQ $35ca ; (vdcwin_win_free.s56 + 0)
.s15:
35b9 : e6 1d __ INC ACCU + 2 
35bb : 38 __ __ SEC
35bc : a5 4b __ LDA T11 + 0 
35be : ed 76 6c SBC $6c76 ; (vdc_state + 3)
35c1 : 85 4b __ STA T11 + 0 
35c3 : a5 4c __ LDA T11 + 1 
35c5 : ed 77 6c SBC $6c77 ; (vdc_state + 4)
35c8 : 85 4c __ STA T11 + 1 
.s56:
35ca : a5 1b __ LDA ACCU + 0 
35cc : 29 10 __ AND #$10
35ce : f0 15 __ BEQ $35e5 ; (vdcwin_win_free.s21 + 0)
.s22:
35d0 : 18 __ __ CLC
35d1 : a5 43 __ LDA T5 + 0 
35d3 : 65 4a __ ADC T10 + 0 
35d5 : a8 __ __ TAY
35d6 : a9 00 __ LDA #$00
35d8 : 2a __ __ ROL
35d9 : cd 79 6c CMP $6c79 ; (vdc_state + 6)
35dc : d0 03 __ BNE $35e1 ; (vdcwin_win_free.s1003 + 0)
.s1002:
35de : cc 78 6c CPY $6c78 ; (vdc_state + 5)
.s1003:
35e1 : b0 02 __ BCS $35e5 ; (vdcwin_win_free.s21 + 0)
.s19:
35e3 : e6 1d __ INC ACCU + 2 
.s21:
35e5 : a5 1d __ LDA ACCU + 2 
35e7 : d0 11 __ BNE $35fa ; (vdcwin_win_free.s27 + 0)
.s26:
35e9 : a5 45 __ LDA T2 + 0 
35eb : 8d 61 6c STA $6c61 ; (winCfg + 6)
35ee : a5 46 __ LDA T2 + 1 
35f0 : 8d 62 6c STA $6c62 ; (winCfg + 7)
35f3 : a6 44 __ LDX T0 + 0 
35f5 : ca __ __ DEX
35f6 : 8e 60 6c STX $6c60 ; (winCfg + 5)
.s1001:
35f9 : 60 __ __ RTS
.s27:
35fa : 85 47 __ STA T3 + 0 
35fc : a5 1c __ LDA ACCU + 1 
35fe : 85 14 __ STA P7 
.l1006:
3600 : ad 7b 6c LDA $6c7b ; (vdc_state + 8)
3603 : 18 __ __ CLC
3604 : 65 4b __ ADC T11 + 0 
3606 : 85 0f __ STA P2 
3608 : a9 00 __ LDA #$00
360a : 85 15 __ STA P8 
360c : ad 7c 6c LDA $6c7c ; (vdc_state + 9)
360f : 65 4c __ ADC T11 + 1 
3611 : 85 10 __ STA P3 
3613 : ad 5b 6c LDA $6c5b ; (winCfg + 0)
3616 : 85 11 __ STA P4 
3618 : ad 61 6c LDA $6c61 ; (winCfg + 6)
361b : 85 48 __ STA T7 + 0 
361d : 85 12 __ STA P5 
361f : ad 62 6c LDA $6c62 ; (winCfg + 7)
3622 : 85 49 __ STA T7 + 1 
3624 : 85 13 __ STA P6 
3626 : 20 2e 14 JSR $142e ; (bnk_cpytovdc.s0 + 0)
3629 : a9 00 __ LDA #$00
362b : 85 15 __ STA P8 
362d : 18 __ __ CLC
362e : a5 48 __ LDA T7 + 0 
3630 : 65 14 __ ADC P7 
3632 : 85 48 __ STA T7 + 0 
3634 : 85 12 __ STA P5 
3636 : 8d 61 6c STA $6c61 ; (winCfg + 6)
3639 : a5 49 __ LDA T7 + 1 
363b : 69 00 __ ADC #$00
363d : 85 49 __ STA T7 + 1 
363f : 85 13 __ STA P6 
3641 : 8d 62 6c STA $6c62 ; (winCfg + 7)
3644 : ad 7d 6c LDA $6c7d ; (vdc_state + 10)
3647 : 18 __ __ CLC
3648 : 65 4b __ ADC T11 + 0 
364a : 85 0f __ STA P2 
364c : ad 7e 6c LDA $6c7e ; (vdc_state + 11)
364f : 65 4c __ ADC T11 + 1 
3651 : 85 10 __ STA P3 
3653 : 20 2e 14 JSR $142e ; (bnk_cpytovdc.s0 + 0)
3656 : 18 __ __ CLC
3657 : a5 48 __ LDA T7 + 0 
3659 : 65 14 __ ADC P7 
365b : 8d 61 6c STA $6c61 ; (winCfg + 6)
365e : a5 49 __ LDA T7 + 1 
3660 : 69 00 __ ADC #$00
3662 : 8d 62 6c STA $6c62 ; (winCfg + 7)
3665 : ad 76 6c LDA $6c76 ; (vdc_state + 3)
3668 : 18 __ __ CLC
3669 : 65 4b __ ADC T11 + 0 
366b : 85 4b __ STA T11 + 0 
366d : ad 77 6c LDA $6c77 ; (vdc_state + 4)
3670 : 65 4c __ ADC T11 + 1 
3672 : 85 4c __ STA T11 + 1 
3674 : c6 47 __ DEC T3 + 0 
3676 : d0 88 __ BNE $3600 ; (vdcwin_win_free.l1006 + 0)
3678 : 4c e9 35 JMP $35e9 ; (vdcwin_win_free.s26 + 0)
--------------------------------------------------------------------
367b : __ __ __ BYT 2d 20 4d 55 53 49 43 3a 20 75 4c 54 49 4d 41 54 : - MUSIC: uLTIMAT
368b : __ __ __ BYT 45 20 61 58 45 4c 20 66 20 46 52 4f 4d 20 6e 4f : E aXEL f FROM nO
369b : __ __ __ BYT 52 44 49 53 43 48 53 4f 55 4e 44 00             : RDISCHSOUND.
--------------------------------------------------------------------
36a7 : __ __ __ BYT 4d 55 53 49 43 31 00                            : MUSIC1.
--------------------------------------------------------------------
menu_placetop: ; menu_placetop(const u8*)->void
.s0:
36ae : 20 87 29 JSR $2987 ; (vdc_cls.s0 + 0)
36b1 : a9 00 __ LDA #$00
36b3 : 85 0f __ STA P2 
36b5 : 85 10 __ STA P3 
36b7 : a9 c5 __ LDA #$c5
36b9 : 85 12 __ STA P5 
36bb : 20 49 67 JSR $6749 ; (vdc_hchar@proxy + 0)
36be : a9 c5 __ LDA #$c5
36c0 : 85 13 __ STA P6 
36c2 : a9 37 __ LDA #$37
36c4 : 85 12 __ STA P5 
36c6 : a9 59 __ LDA #$59
36c8 : 85 11 __ STA P4 
36ca : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
36cd : a9 01 __ LDA #$01
36cf : 85 14 __ STA P7 
--------------------------------------------------------------------
menu_placebar: ; menu_placebar(u8)->void
.s0:
36d1 : a5 14 __ LDA P7 ; (y + 0)
36d3 : 8d ad 67 STA $67ad ; (menubar + 60)
36d6 : 85 10 __ STA P3 
36d8 : a9 00 __ LDA #$00
36da : 85 0f __ STA P2 
36dc : a9 c4 __ LDA #$c4
36de : 85 12 __ STA P5 
36e0 : 20 49 67 JSR $6749 ; (vdc_hchar@proxy + 0)
36e3 : a9 00 __ LDA #$00
36e5 : 85 48 __ STA T1 + 0 
36e7 : 85 49 __ STA T2 + 0 
36e9 : a9 01 __ LDA #$01
36eb : 85 4a __ STA T3 + 0 
36ed : a9 06 __ LDA #$06
36ef : 85 4b __ STA T4 + 0 
.l2:
36f1 : 18 __ __ CLC
36f2 : a9 71 __ LDA #$71
36f4 : 65 49 __ ADC T2 + 0 
36f6 : 85 0d __ STA P0 
36f8 : a9 67 __ LDA #$67
36fa : 69 00 __ ADC #$00
36fc : 85 0e __ STA P1 
36fe : 20 f7 2e JSR $2ef7 ; (strlen.s0 + 0)
3701 : a5 0d __ LDA P0 
3703 : 85 11 __ STA P4 
3705 : a5 0e __ LDA P1 
3707 : 85 12 __ STA P5 
3709 : a5 1b __ LDA ACCU + 0 
370b : 85 4c __ STA T5 + 0 
370d : 18 __ __ CLC
370e : 65 4a __ ADC T3 + 0 
3710 : 85 43 __ STA T6 + 0 
3712 : a9 c4 __ LDA #$c4
3714 : 85 13 __ STA P6 
3716 : a9 00 __ LDA #$00
3718 : 2a __ __ ROL
3719 : 85 44 __ STA T6 + 1 
371b : ad 76 6c LDA $6c76 ; (vdc_state + 3)
371e : 38 __ __ SEC
371f : e9 01 __ SBC #$01
3721 : a8 __ __ TAY
3722 : ad 77 6c LDA $6c77 ; (vdc_state + 4)
3725 : e9 00 __ SBC #$00
3727 : c5 44 __ CMP T6 + 1 
3729 : d0 02 __ BNE $372d ; (menu_placebar.s1003 + 0)
.s1002:
372b : c4 43 __ CPY T6 + 0 
.s1003:
372d : 90 04 __ BCC $3733 ; (menu_placebar.s5 + 0)
.s7:
372f : a5 4a __ LDA T3 + 0 
3731 : b0 04 __ BCS $3737 ; (menu_placebar.s1004 + 0)
.s5:
3733 : 98 __ __ TYA
3734 : 38 __ __ SEC
3735 : e5 1b __ SBC ACCU + 0 
.s1004:
3737 : 85 0f __ STA P2 
3739 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
373c : a5 0f __ LDA P2 
373e : a6 48 __ LDX T1 + 0 
3740 : e8 __ __ INX
3741 : 86 48 __ STX T1 + 0 
3743 : 9d a6 67 STA $67a6,x ; (menubar + 53)
3746 : a5 4c __ LDA T5 + 0 
3748 : 38 __ __ SEC
3749 : 65 0f __ ADC P2 
374b : 85 4a __ STA T3 + 0 
374d : 18 __ __ CLC
374e : a5 49 __ LDA T2 + 0 
3750 : 69 09 __ ADC #$09
3752 : 85 49 __ STA T2 + 0 
3754 : c6 4b __ DEC T4 + 0 
3756 : d0 99 __ BNE $36f1 ; (menu_placebar.l2 + 0)
.s1001:
3758 : 60 __ __ RTS
--------------------------------------------------------------------
3759 : __ __ __ BYT 20 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d :  oSCAR64 vdc dEM
3769 : __ __ __ BYT 4f 00                                           : O.
--------------------------------------------------------------------
376b : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 3a 20 25 53 00    : sCREENMODE: %S.
--------------------------------------------------------------------
377a : __ __ __ BYT 73 45 4c 45 43 54 20 44 45 53 49 52 45 44 20 44 : sELECT DESIRED D
378a : __ __ __ BYT 45 4d 4f 20 55 53 49 4e 47 20 43 55 52 53 4f 52 : EMO USING CURSOR
379a : __ __ __ BYT 20 4b 45 59 53 20 41 4e 44 20 72 65 74 75 72 6e :  KEYS AND return
37aa : __ __ __ BYT 20 49 4e 20 4d 45 4e 55 2e 00                   :  IN MENU..
--------------------------------------------------------------------
37b4 : __ __ __ BYT 69 4e 20 53 43 52 4f 4c 4c 49 4e 47 20 44 45 4d : iN SCROLLING DEM
37c4 : __ __ __ BYT 4f 53 2c 20 50 52 45 53 53 20 77 61 73 64 20 4f : OS, PRESS wasd O
37d4 : __ __ __ BYT 52 20 43 55 52 53 4f 52 20 4b 45 59 53 20 54 4f : R CURSOR KEYS TO
37e4 : __ __ __ BYT 20 4d 4f 56 45 2c 20 65 73 63 20 54 4f 20 45 58 :  MOVE, esc TO EX
37f4 : __ __ __ BYT 49 54 2e 00                                     : IT..
--------------------------------------------------------------------
37f8 : __ __ __ BYT 20 25 53 20 00                                  :  %S .
--------------------------------------------------------------------
giocharmap:
37fd : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
seed:
37fe : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
3800 : __ __ __ BYT 69 4e 20 4f 54 48 45 52 20 44 45 4d 4f 53 2c 20 : iN OTHER DEMOS, 
3810 : __ __ __ BYT 50 52 45 53 53 20 41 20 4b 45 59 20 54 4f 20 43 : PRESS A KEY TO C
3820 : __ __ __ BYT 4f 4e 54 49 4e 55 45 20 54 4f 20 4e 45 58 54 20 : ONTINUE TO NEXT 
3830 : __ __ __ BYT 53 54 45 50 2e 00                               : STEP..
--------------------------------------------------------------------
vdcwin_cpy_viewport: ; vdcwin_cpy_viewport(struct VDCViewport*)->void
.s0:
3836 : a5 16 __ LDA P9 ; (viewport + 0)
3838 : 85 44 __ STA T0 + 0 
383a : a5 17 __ LDA P10 ; (viewport + 1)
383c : 85 45 __ STA T0 + 1 
383e : a0 09 __ LDY #$09
3840 : b1 16 __ LDA (P9),y ; (viewport + 0)
3842 : 85 1b __ STA ACCU + 0 
3844 : c8 __ __ INY
3845 : b1 16 __ LDA (P9),y ; (viewport + 0)
3847 : 85 1c __ STA ACCU + 1 
3849 : a0 03 __ LDY #$03
384b : b1 16 __ LDA (P9),y ; (viewport + 0)
384d : 85 03 __ STA WORK + 0 
384f : c8 __ __ INY
3850 : b1 16 __ LDA (P9),y ; (viewport + 0)
3852 : 85 04 __ STA WORK + 1 
3854 : 20 66 63 JSR $6366 ; (mul16 + 0)
3857 : a0 01 __ LDY #$01
3859 : b1 16 __ LDA (P9),y ; (viewport + 0)
385b : 18 __ __ CLC
385c : 65 05 __ ADC WORK + 2 
385e : aa __ __ TAX
385f : c8 __ __ INY
3860 : b1 16 __ LDA (P9),y ; (viewport + 0)
3862 : 65 06 __ ADC WORK + 3 
3864 : 85 47 __ STA T1 + 1 
3866 : 8a __ __ TXA
3867 : 18 __ __ CLC
3868 : a0 07 __ LDY #$07
386a : 71 16 __ ADC (P9),y ; (viewport + 0)
386c : 85 46 __ STA T1 + 0 
386e : a5 47 __ LDA T1 + 1 
3870 : c8 __ __ INY
3871 : 71 16 __ ADC (P9),y ; (viewport + 0)
3873 : 85 47 __ STA T1 + 1 
3875 : a9 00 __ LDA #$00
3877 : 85 4a __ STA T3 + 0 
3879 : a0 11 __ LDY #$11
387b : b1 16 __ LDA (P9),y ; (viewport + 0)
387d : aa __ __ TAX
387e : c8 __ __ INY
387f : b1 16 __ LDA (P9),y ; (viewport + 0)
3881 : 4c bd 38 JMP $38bd ; (vdcwin_cpy_viewport.l1 + 0)
.s2:
3884 : 86 0f __ STX P2 
3886 : a5 46 __ LDA T1 + 0 
3888 : 85 12 __ STA P5 
388a : a5 47 __ LDA T1 + 1 
388c : 85 13 __ STA P6 
388e : a0 00 __ LDY #$00
3890 : 84 15 __ STY P8 
3892 : b1 44 __ LDA (T0 + 0),y 
3894 : 85 11 __ STA P4 
3896 : a0 0d __ LDY #$0d
3898 : b1 44 __ LDA (T0 + 0),y 
389a : 85 14 __ STA P7 
389c : 20 2e 14 JSR $142e ; (bnk_cpytovdc.s0 + 0)
389f : a5 46 __ LDA T1 + 0 
38a1 : 18 __ __ CLC
38a2 : a0 03 __ LDY #$03
38a4 : 71 44 __ ADC (T0 + 0),y 
38a6 : 85 46 __ STA T1 + 0 
38a8 : a5 47 __ LDA T1 + 1 
38aa : c8 __ __ INY
38ab : 71 44 __ ADC (T0 + 0),y 
38ad : 85 47 __ STA T1 + 1 
38af : ad 76 6c LDA $6c76 ; (vdc_state + 3)
38b2 : 18 __ __ CLC
38b3 : 65 0f __ ADC P2 
38b5 : aa __ __ TAX
38b6 : ad 77 6c LDA $6c77 ; (vdc_state + 4)
38b9 : 65 10 __ ADC P3 
38bb : e6 4a __ INC T3 + 0 
.l1:
38bd : 85 10 __ STA P3 
38bf : a5 4a __ LDA T3 + 0 
38c1 : a0 0e __ LDY #$0e
38c3 : d1 44 __ CMP (T0 + 0),y 
38c5 : 90 bd __ BCC $3884 ; (vdcwin_cpy_viewport.s2 + 0)
.s4:
38c7 : a0 03 __ LDY #$03
38c9 : b1 44 __ LDA (T0 + 0),y 
38cb : 85 46 __ STA T1 + 0 
38cd : 85 03 __ STA WORK + 0 
38cf : c8 __ __ INY
38d0 : b1 44 __ LDA (T0 + 0),y 
38d2 : 85 47 __ STA T1 + 1 
38d4 : 85 04 __ STA WORK + 1 
38d6 : a0 09 __ LDY #$09
38d8 : b1 44 __ LDA (T0 + 0),y 
38da : 85 1b __ STA ACCU + 0 
38dc : c8 __ __ INY
38dd : b1 44 __ LDA (T0 + 0),y 
38df : 85 1c __ STA ACCU + 1 
38e1 : 20 66 63 JSR $6366 ; (mul16 + 0)
38e4 : a0 01 __ LDY #$01
38e6 : b1 44 __ LDA (T0 + 0),y 
38e8 : 18 __ __ CLC
38e9 : 65 05 __ ADC WORK + 2 
38eb : aa __ __ TAX
38ec : c8 __ __ INY
38ed : b1 44 __ LDA (T0 + 0),y 
38ef : 65 06 __ ADC WORK + 3 
38f1 : 85 49 __ STA T2 + 1 
38f3 : 8a __ __ TXA
38f4 : 18 __ __ CLC
38f5 : a0 07 __ LDY #$07
38f7 : 71 44 __ ADC (T0 + 0),y 
38f9 : 85 48 __ STA T2 + 0 
38fb : a5 49 __ LDA T2 + 1 
38fd : c8 __ __ INY
38fe : 71 44 __ ADC (T0 + 0),y 
3900 : 85 49 __ STA T2 + 1 
3902 : a0 05 __ LDY #$05
3904 : b1 44 __ LDA (T0 + 0),y 
3906 : 85 1b __ STA ACCU + 0 
3908 : c8 __ __ INY
3909 : b1 44 __ LDA (T0 + 0),y 
390b : 85 1c __ STA ACCU + 1 
390d : a5 46 __ LDA T1 + 0 
390f : 85 03 __ STA WORK + 0 
3911 : a5 47 __ LDA T1 + 1 
3913 : 85 04 __ STA WORK + 1 
3915 : 20 66 63 JSR $6366 ; (mul16 + 0)
3918 : 18 __ __ CLC
3919 : a5 48 __ LDA T2 + 0 
391b : 65 05 __ ADC WORK + 2 
391d : aa __ __ TAX
391e : a5 49 __ LDA T2 + 1 
3920 : 65 06 __ ADC WORK + 3 
3922 : a8 __ __ TAY
3923 : 8a __ __ TXA
3924 : 18 __ __ CLC
3925 : 69 30 __ ADC #$30
3927 : 85 46 __ STA T1 + 0 
3929 : 90 01 __ BCC $392c ; (vdcwin_cpy_viewport.s1007 + 0)
.s1006:
392b : c8 __ __ INY
.s1007:
392c : 84 47 __ STY T1 + 1 
392e : a9 00 __ LDA #$00
3930 : 85 4a __ STA T3 + 0 
3932 : a0 13 __ LDY #$13
3934 : b1 44 __ LDA (T0 + 0),y 
3936 : aa __ __ TAX
3937 : c8 __ __ INY
3938 : b1 44 __ LDA (T0 + 0),y 
393a : 4c 76 39 JMP $3976 ; (vdcwin_cpy_viewport.l5 + 0)
.s6:
393d : 86 0f __ STX P2 
393f : a5 46 __ LDA T1 + 0 
3941 : 85 12 __ STA P5 
3943 : a5 47 __ LDA T1 + 1 
3945 : 85 13 __ STA P6 
3947 : a0 00 __ LDY #$00
3949 : 84 15 __ STY P8 
394b : b1 16 __ LDA (P9),y ; (viewport + 0)
394d : 85 11 __ STA P4 
394f : a0 0d __ LDY #$0d
3951 : b1 16 __ LDA (P9),y ; (viewport + 0)
3953 : 85 14 __ STA P7 
3955 : 20 2e 14 JSR $142e ; (bnk_cpytovdc.s0 + 0)
3958 : a5 46 __ LDA T1 + 0 
395a : 18 __ __ CLC
395b : a0 03 __ LDY #$03
395d : 71 16 __ ADC (P9),y ; (viewport + 0)
395f : 85 46 __ STA T1 + 0 
3961 : a5 47 __ LDA T1 + 1 
3963 : c8 __ __ INY
3964 : 71 16 __ ADC (P9),y ; (viewport + 0)
3966 : 85 47 __ STA T1 + 1 
3968 : ad 76 6c LDA $6c76 ; (vdc_state + 3)
396b : 18 __ __ CLC
396c : 65 0f __ ADC P2 
396e : aa __ __ TAX
396f : ad 77 6c LDA $6c77 ; (vdc_state + 4)
3972 : 65 10 __ ADC P3 
3974 : e6 4a __ INC T3 + 0 
.l5:
3976 : 85 10 __ STA P3 
3978 : a5 4a __ LDA T3 + 0 
397a : a0 0e __ LDY #$0e
397c : d1 16 __ CMP (P9),y ; (viewport + 0)
397e : 90 bd __ BCC $393d ; (vdcwin_cpy_viewport.s6 + 0)
.s1001:
3980 : 60 __ __ RTS
--------------------------------------------------------------------
menu_main: ; menu_main()->u8
.s1000:
3981 : a2 03 __ LDX #$03
3983 : b5 53 __ LDA T0 + 0,x 
3985 : 9d ca bf STA $bfca,x ; (bigfont + 175)
3988 : ca __ __ DEX
3989 : 10 f8 __ BPL $3983 ; (menu_main.s1000 + 2)
.s0:
398b : ad ad 67 LDA $67ad ; (menubar + 60)
398e : 85 14 __ STA P7 
3990 : 20 d1 36 JSR $36d1 ; (menu_placebar.s0 + 0)
.l84:
3993 : a9 01 __ LDA #$01
3995 : 85 53 __ STA T0 + 0 
.l3:
3997 : a9 cf __ LDA #$cf
3999 : 85 13 __ STA P6 
399b : a6 53 __ LDX T0 + 0 
399d : bd a6 67 LDA $67a6,x ; (menubar + 53)
39a0 : 85 0f __ STA P2 
39a2 : ad ad 67 LDA $67ad ; (menubar + 60)
39a5 : 85 10 __ STA P3 
39a7 : bd 84 66 LDA $6684,x ; (__multab9L + 0)
39aa : 18 __ __ CLC
39ab : 69 68 __ ADC #$68
39ad : 85 11 __ STA P4 
39af : a9 67 __ LDA #$67
39b1 : 69 00 __ ADC #$00
39b3 : 85 12 __ STA P5 
39b5 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
.l5:
39b8 : 20 2c 35 JSR $352c ; (vdcwin_getch.s0 + 0)
39bb : a5 1b __ LDA ACCU + 0 
39bd : 85 54 __ STA T1 + 0 
39bf : c9 0d __ CMP #$0d
39c1 : d0 06 __ BNE $39c9 ; (menu_main.s1002 + 0)
.s1003:
39c3 : a9 00 __ LDA #$00
39c5 : 85 55 __ STA T3 + 0 
39c7 : f0 14 __ BEQ $39dd ; (menu_main.s6 + 0)
.s1002:
39c9 : a2 01 __ LDX #$01
39cb : 86 55 __ STX T3 + 0 
39cd : c9 9d __ CMP #$9d
39cf : f0 0c __ BEQ $39dd ; (menu_main.s6 + 0)
.s9:
39d1 : c9 1d __ CMP #$1d
39d3 : f0 08 __ BEQ $39dd ; (menu_main.s6 + 0)
.s8:
39d5 : c9 1b __ CMP #$1b
39d7 : f0 04 __ BEQ $39dd ; (menu_main.s6 + 0)
.s7:
39d9 : c9 03 __ CMP #$03
39db : d0 db __ BNE $39b8 ; (menu_main.l5 + 0)
.s6:
39dd : a9 c4 __ LDA #$c4
39df : 85 13 __ STA P6 
39e1 : a6 53 __ LDX T0 + 0 
39e3 : bd a6 67 LDA $67a6,x ; (menubar + 53)
39e6 : 85 0f __ STA P2 
39e8 : ad ad 67 LDA $67ad ; (menubar + 60)
39eb : 85 56 __ STA T4 + 0 
39ed : 85 10 __ STA P3 
39ef : bd 84 66 LDA $6684,x ; (__multab9L + 0)
39f2 : 18 __ __ CLC
39f3 : 69 68 __ ADC #$68
39f5 : 85 11 __ STA P4 
39f7 : a9 67 __ LDA #$67
39f9 : 69 00 __ ADC #$00
39fb : 85 12 __ STA P5 
39fd : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
3a00 : a5 54 __ LDA T1 + 0 
3a02 : c9 9d __ CMP #$9d
3a04 : d0 03 __ BNE $3a09 ; (menu_main.s12 + 0)
3a06 : 4c 96 3a JMP $3a96 ; (menu_main.s11 + 0)
.s12:
3a09 : c9 1d __ CMP #$1d
3a0b : d0 0c __ BNE $3a19 ; (menu_main.s13 + 0)
.s17:
3a0d : e6 53 __ INC T0 + 0 
3a0f : a5 53 __ LDA T0 + 0 
3a11 : c9 07 __ CMP #$07
3a13 : 90 04 __ BCC $3a19 ; (menu_main.s13 + 0)
.s20:
3a15 : a9 01 __ LDA #$01
.s1039:
3a17 : 85 53 __ STA T0 + 0 
.s13:
3a19 : a5 55 __ LDA T3 + 0 
3a1b : f0 0d __ BEQ $3a2a ; (menu_main.s4 + 0)
.s24:
3a1d : a5 54 __ LDA T1 + 0 
3a1f : c9 1b __ CMP #$1b
3a21 : f0 11 __ BEQ $3a34 ; (menu_main.s26 + 0)
.s23:
3a23 : c9 03 __ CMP #$03
3a25 : f0 03 __ BEQ $3a2a ; (menu_main.s4 + 0)
3a27 : 4c 97 39 JMP $3997 ; (menu_main.l3 + 0)
.s4:
3a2a : a5 54 __ LDA T1 + 0 
3a2c : c9 1b __ CMP #$1b
3a2e : f0 04 __ BEQ $3a34 ; (menu_main.s26 + 0)
.s28:
3a30 : c9 03 __ CMP #$03
3a32 : d0 06 __ BNE $3a3a ; (menu_main.s25 + 0)
.s26:
3a34 : a9 63 __ LDA #$63
3a36 : 85 55 __ STA T3 + 0 
3a38 : d0 44 __ BNE $3a7e ; (menu_main.s2 + 0)
.s25:
3a3a : a6 53 __ LDX T0 + 0 
3a3c : ca __ __ DEX
3a3d : 8e fe bf STX $bffe ; (sstack + 7)
3a40 : bd a7 67 LDA $67a7,x ; (menubar + 54)
3a43 : 8d fc bf STA $bffc ; (sstack + 5)
3a46 : a6 56 __ LDX T4 + 0 
3a48 : e8 __ __ INX
3a49 : 8e fd bf STX $bffd ; (sstack + 6)
3a4c : 20 a2 3a JSR $3aa2 ; (menu_pulldown.s1000 + 0)
3a4f : a5 1b __ LDA ACCU + 0 
3a51 : 85 55 __ STA T3 + 0 
3a53 : c9 12 __ CMP #$12
3a55 : d0 0e __ BNE $3a65 ; (menu_main.s31 + 0)
.s29:
3a57 : a9 00 __ LDA #$00
3a59 : 85 55 __ STA T3 + 0 
3a5b : c6 53 __ DEC T0 + 0 
3a5d : d0 06 __ BNE $3a65 ; (menu_main.s31 + 0)
.s32:
3a5f : a9 06 __ LDA #$06
3a61 : 85 53 __ STA T0 + 0 
3a63 : d0 12 __ BNE $3a77 ; (menu_main.s27 + 0)
.s31:
3a65 : c9 13 __ CMP #$13
3a67 : d0 0e __ BNE $3a77 ; (menu_main.s27 + 0)
.s35:
3a69 : e6 53 __ INC T0 + 0 
3a6b : a5 53 __ LDA T0 + 0 
3a6d : c9 07 __ CMP #$07
3a6f : b0 03 __ BCS $3a74 ; (menu_main.s35 + 11)
3a71 : 4c 97 39 JMP $3997 ; (menu_main.l3 + 0)
3a74 : 4c 93 39 JMP $3993 ; (menu_main.l84 + 0)
.s27:
3a77 : a5 55 __ LDA T3 + 0 
3a79 : d0 03 __ BNE $3a7e ; (menu_main.s2 + 0)
3a7b : 4c 97 39 JMP $3997 ; (menu_main.l3 + 0)
.s2:
3a7e : a5 53 __ LDA T0 + 0 
3a80 : 0a __ __ ASL
3a81 : 0a __ __ ASL
3a82 : 18 __ __ CLC
3a83 : 65 53 __ ADC T0 + 0 
3a85 : 0a __ __ ASL
3a86 : 18 __ __ CLC
3a87 : 65 55 __ ADC T3 + 0 
3a89 : 85 1b __ STA ACCU + 0 
.s1001:
3a8b : a2 03 __ LDX #$03
3a8d : bd ca bf LDA $bfca,x ; (bigfont + 175)
3a90 : 95 53 __ STA T0 + 0,x 
3a92 : ca __ __ DEX
3a93 : 10 f8 __ BPL $3a8d ; (menu_main.s1001 + 2)
3a95 : 60 __ __ RTS
.s11:
3a96 : c6 53 __ DEC T0 + 0 
3a98 : f0 03 __ BEQ $3a9d ; (menu_main.s14 + 0)
3a9a : 4c 19 3a JMP $3a19 ; (menu_main.s13 + 0)
.s14:
3a9d : a9 06 __ LDA #$06
3a9f : 4c 17 3a JMP $3a17 ; (menu_main.s1039 + 0)
--------------------------------------------------------------------
menu_pulldown: ; menu_pulldown(u8,u8,u8,u8)->u8
.s1000:
3aa2 : a2 0a __ LDX #$0a
3aa4 : b5 53 __ LDA T1 + 0,x 
3aa6 : 9d cf bf STA $bfcf,x ; (bigfont + 180)
3aa9 : ca __ __ DEX
3aaa : 10 f8 __ BPL $3aa4 ; (menu_pulldown.s1000 + 2)
3aac : 38 __ __ SEC
3aad : a5 23 __ LDA SP + 0 
3aaf : e9 0a __ SBC #$0a
3ab1 : 85 23 __ STA SP + 0 
3ab3 : b0 02 __ BCS $3ab7 ; (menu_pulldown.s0 + 0)
3ab5 : c6 24 __ DEC SP + 1 
.s0:
3ab7 : a9 d8 __ LDA #$d8
3ab9 : ae fe bf LDX $bffe ; (sstack + 7)
3abc : 86 52 __ STX T0 + 0 
3abe : 18 __ __ CLC
3abf : 7d 74 66 ADC $6674,x ; (__multab102L + 0)
3ac2 : 85 54 __ STA T2 + 0 
3ac4 : 85 0d __ STA P0 
3ac6 : a9 68 __ LDA #$68
3ac8 : 7d 7c 66 ADC $667c,x ; (__multab102H + 0)
3acb : 85 55 __ STA T2 + 1 
3acd : 85 0e __ STA P1 
3acf : 20 f7 2e JSR $2ef7 ; (strlen.s0 + 0)
3ad2 : a6 52 __ LDX T0 + 0 
3ad4 : bd ae 67 LDA $67ae,x ; (pulldown_options + 0)
3ad7 : 85 57 __ STA T4 + 0 
3ad9 : 8d f9 bf STA $bff9 ; (sstack + 2)
3adc : e0 06 __ CPX #$06
3ade : 90 08 __ BCC $3ae8 ; (menu_pulldown.s87 + 0)
.s86:
3ae0 : a9 f0 __ LDA #$f0
3ae2 : 85 17 __ STA P10 
3ae4 : a9 00 __ LDA #$00
3ae6 : b0 06 __ BCS $3aee ; (menu_pulldown.s91 + 0)
.s87:
3ae8 : a9 70 __ LDA #$70
3aea : 85 17 __ STA P10 
3aec : a9 01 __ LDA #$01
.s91:
3aee : 85 53 __ STA T1 + 0 
3af0 : ad fc bf LDA $bffc ; (sstack + 5)
3af3 : 85 52 __ STA T0 + 0 
3af5 : 85 18 __ STA P11 
3af7 : ad fd bf LDA $bffd ; (sstack + 6)
3afa : 85 56 __ STA T3 + 0 
3afc : 8d f7 bf STA $bff7 ; (sstack + 0)
3aff : 18 __ __ CLC
3b00 : a5 1b __ LDA ACCU + 0 
3b02 : 69 02 __ ADC #$02
3b04 : 8d f8 bf STA $bff8 ; (sstack + 1)
3b07 : 20 39 30 JSR $3039 ; (vdcwin_win_new.s1000 + 0)
3b0a : a9 01 __ LDA #$01
3b0c : 85 58 __ STA T6 + 0 
3b0e : a5 57 __ LDA T4 + 0 
3b10 : f0 57 __ BEQ $3b69 ; (menu_pulldown.l5 + 0)
.s58:
3b12 : 85 59 __ STA T7 + 0 
3b14 : a9 00 __ LDA #$00
3b16 : 85 5a __ STA T8 + 0 
3b18 : 85 5b __ STA T8 + 1 
.l2:
3b1a : a9 8c __ LDA #$8c
3b1c : a0 02 __ LDY #$02
3b1e : 91 23 __ STA (SP + 0),y 
3b20 : a9 6c __ LDA #$6c
3b22 : c8 __ __ INY
3b23 : 91 23 __ STA (SP + 0),y 
3b25 : a9 f8 __ LDA #$f8
3b27 : c8 __ __ INY
3b28 : 91 23 __ STA (SP + 0),y 
3b2a : a9 37 __ LDA #$37
3b2c : c8 __ __ INY
3b2d : 91 23 __ STA (SP + 0),y 
3b2f : 18 __ __ CLC
3b30 : a5 54 __ LDA T2 + 0 
3b32 : 65 5a __ ADC T8 + 0 
3b34 : c8 __ __ INY
3b35 : 91 23 __ STA (SP + 0),y 
3b37 : a5 55 __ LDA T2 + 1 
3b39 : 65 5b __ ADC T8 + 1 
3b3b : c8 __ __ INY
3b3c : 91 23 __ STA (SP + 0),y 
3b3e : 20 1b 2f JSR $2f1b ; (sprintf.s0 + 0)
3b41 : a5 52 __ LDA T0 + 0 
3b43 : 85 0f __ STA P2 
3b45 : a5 56 __ LDA T3 + 0 
3b47 : 85 10 __ STA P3 
3b49 : e6 56 __ INC T3 + 0 
3b4b : a9 8c __ LDA #$8c
3b4d : 85 11 __ STA P4 
3b4f : a9 c6 __ LDA #$c6
3b51 : 85 13 __ STA P6 
3b53 : a9 6c __ LDA #$6c
3b55 : 85 12 __ STA P5 
3b57 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
3b5a : 18 __ __ CLC
3b5b : a5 5a __ LDA T8 + 0 
3b5d : 69 11 __ ADC #$11
3b5f : 85 5a __ STA T8 + 0 
3b61 : 90 02 __ BCC $3b65 ; (menu_pulldown.s1047 + 0)
.s1046:
3b63 : e6 5b __ INC T8 + 1 
.s1047:
3b65 : c6 59 __ DEC T7 + 0 
3b67 : d0 b1 __ BNE $3b1a ; (menu_pulldown.l2 + 0)
.l5:
3b69 : a9 2d __ LDA #$2d
3b6b : a0 06 __ LDY #$06
3b6d : 91 23 __ STA (SP + 0),y 
3b6f : a9 00 __ LDA #$00
3b71 : 85 1c __ STA ACCU + 1 
3b73 : c8 __ __ INY
3b74 : 91 23 __ STA (SP + 0),y 
3b76 : a9 8c __ LDA #$8c
3b78 : a0 02 __ LDY #$02
3b7a : 91 23 __ STA (SP + 0),y 
3b7c : a9 6c __ LDA #$6c
3b7e : c8 __ __ INY
3b7f : 91 23 __ STA (SP + 0),y 
3b81 : a9 eb __ LDA #$eb
3b83 : c8 __ __ INY
3b84 : 91 23 __ STA (SP + 0),y 
3b86 : a9 3c __ LDA #$3c
3b88 : c8 __ __ INY
3b89 : 91 23 __ STA (SP + 0),y 
3b8b : a5 58 __ LDA T6 + 0 
3b8d : 85 1b __ STA ACCU + 0 
3b8f : a9 11 __ LDA #$11
3b91 : 20 46 63 JSR $6346 ; (mul16by8 + 0)
3b94 : 38 __ __ SEC
3b95 : a5 05 __ LDA WORK + 2 
3b97 : e9 11 __ SBC #$11
3b99 : aa __ __ TAX
3b9a : a5 06 __ LDA WORK + 3 
3b9c : e9 00 __ SBC #$00
3b9e : 85 5d __ STA T9 + 1 
3ba0 : 8a __ __ TXA
3ba1 : 18 __ __ CLC
3ba2 : 65 54 __ ADC T2 + 0 
3ba4 : a0 08 __ LDY #$08
3ba6 : 91 23 __ STA (SP + 0),y 
3ba8 : a5 5d __ LDA T9 + 1 
3baa : 65 55 __ ADC T2 + 1 
3bac : c8 __ __ INY
3bad : 91 23 __ STA (SP + 0),y 
3baf : 20 1b 2f JSR $2f1b ; (sprintf.s0 + 0)
3bb2 : ad fc bf LDA $bffc ; (sstack + 5)
3bb5 : 85 0f __ STA P2 
3bb7 : a9 8c __ LDA #$8c
3bb9 : 85 11 __ STA P4 
3bbb : a9 6c __ LDA #$6c
3bbd : 85 12 __ STA P5 
3bbf : a9 cd __ LDA #$cd
3bc1 : 85 13 __ STA P6 
3bc3 : ad fd bf LDA $bffd ; (sstack + 6)
3bc6 : 85 56 __ STA T3 + 0 
3bc8 : 18 __ __ CLC
3bc9 : 65 58 __ ADC T6 + 0 
3bcb : 38 __ __ SEC
3bcc : e9 01 __ SBC #$01
3bce : 85 10 __ STA P3 
3bd0 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
.l7:
3bd3 : 20 2c 35 JSR $352c ; (vdcwin_getch.s0 + 0)
3bd6 : a5 1b __ LDA ACCU + 0 
3bd8 : 85 5a __ STA T8 + 0 
3bda : c9 0d __ CMP #$0d
3bdc : f0 18 __ BEQ $3bf6 ; (menu_pulldown.s8 + 0)
.s14:
3bde : c9 9d __ CMP #$9d
3be0 : f0 14 __ BEQ $3bf6 ; (menu_pulldown.s8 + 0)
.s13:
3be2 : c9 1d __ CMP #$1d
3be4 : f0 10 __ BEQ $3bf6 ; (menu_pulldown.s8 + 0)
.s12:
3be6 : c9 91 __ CMP #$91
3be8 : f0 0c __ BEQ $3bf6 ; (menu_pulldown.s8 + 0)
.s11:
3bea : c9 11 __ CMP #$11
3bec : f0 08 __ BEQ $3bf6 ; (menu_pulldown.s8 + 0)
.s10:
3bee : c9 1b __ CMP #$1b
3bf0 : f0 04 __ BEQ $3bf6 ; (menu_pulldown.s8 + 0)
.s9:
3bf2 : c9 03 __ CMP #$03
3bf4 : d0 dd __ BNE $3bd3 ; (menu_pulldown.l7 + 0)
.s8:
3bf6 : a5 1b __ LDA ACCU + 0 
3bf8 : c9 1b __ CMP #$1b
3bfa : d0 03 __ BNE $3bff ; (menu_pulldown.s42 + 0)
3bfc : 4c dc 3c JMP $3cdc ; (menu_pulldown.s16 + 0)
.s42:
3bff : b0 03 __ BCS $3c04 ; (menu_pulldown.s43 + 0)
3c01 : 4c cc 3c JMP $3ccc ; (menu_pulldown.s44 + 0)
.s43:
3c04 : c9 91 __ CMP #$91
3c06 : f0 43 __ BEQ $3c4b ; (menu_pulldown.s29 + 0)
.s50:
3c08 : b0 2f __ BCS $3c39 ; (menu_pulldown.s51 + 0)
.s52:
3c0a : c9 1d __ CMP #$1d
3c0c : f0 03 __ BEQ $3c11 ; (menu_pulldown.s25 + 0)
3c0e : 4c 69 3b JMP $3b69 ; (menu_pulldown.l5 + 0)
.s25:
3c11 : a5 53 __ LDA T1 + 0 
3c13 : d0 03 __ BNE $3c18 ; (menu_pulldown.s26 + 0)
3c15 : 4c 69 3b JMP $3b69 ; (menu_pulldown.l5 + 0)
.s26:
3c18 : a9 13 __ LDA #$13
.s1045:
3c1a : 85 58 __ STA T6 + 0 
.s6:
3c1c : 20 3a 35 JSR $353a ; (vdcwin_win_free.s0 + 0)
3c1f : a5 58 __ LDA T6 + 0 
3c21 : 85 1b __ STA ACCU + 0 
.s1001:
3c23 : 18 __ __ CLC
3c24 : a5 23 __ LDA SP + 0 
3c26 : 69 0a __ ADC #$0a
3c28 : 85 23 __ STA SP + 0 
3c2a : 90 02 __ BCC $3c2e ; (menu_pulldown.s1001 + 11)
3c2c : e6 24 __ INC SP + 1 
3c2e : a2 0a __ LDX #$0a
3c30 : bd cf bf LDA $bfcf,x ; (bigfont + 180)
3c33 : 95 53 __ STA T1 + 0,x 
3c35 : ca __ __ DEX
3c36 : 10 f8 __ BPL $3c30 ; (menu_pulldown.s1001 + 13)
3c38 : 60 __ __ RTS
.s51:
3c39 : c9 9d __ CMP #$9d
3c3b : f0 03 __ BEQ $3c40 ; (menu_pulldown.s21 + 0)
3c3d : 4c 69 3b JMP $3b69 ; (menu_pulldown.l5 + 0)
.s21:
3c40 : a5 53 __ LDA T1 + 0 
3c42 : d0 03 __ BNE $3c47 ; (menu_pulldown.s22 + 0)
3c44 : 4c 69 3b JMP $3b69 ; (menu_pulldown.l5 + 0)
.s22:
3c47 : a9 12 __ LDA #$12
3c49 : d0 cf __ BNE $3c1a ; (menu_pulldown.s1045 + 0)
.s29:
3c4b : a9 8c __ LDA #$8c
3c4d : a0 02 __ LDY #$02
3c4f : 91 23 __ STA (SP + 0),y 
3c51 : a9 6c __ LDA #$6c
3c53 : c8 __ __ INY
3c54 : 91 23 __ STA (SP + 0),y 
3c56 : a9 f8 __ LDA #$f8
3c58 : c8 __ __ INY
3c59 : 91 23 __ STA (SP + 0),y 
3c5b : a9 37 __ LDA #$37
3c5d : c8 __ __ INY
3c5e : 91 23 __ STA (SP + 0),y 
3c60 : a5 58 __ LDA T6 + 0 
3c62 : 85 1b __ STA ACCU + 0 
3c64 : a9 00 __ LDA #$00
3c66 : 85 1c __ STA ACCU + 1 
3c68 : a9 11 __ LDA #$11
3c6a : 20 46 63 JSR $6346 ; (mul16by8 + 0)
3c6d : 38 __ __ SEC
3c6e : a5 05 __ LDA WORK + 2 
3c70 : e9 11 __ SBC #$11
3c72 : aa __ __ TAX
3c73 : a5 06 __ LDA WORK + 3 
3c75 : e9 00 __ SBC #$00
3c77 : 85 44 __ STA T11 + 1 
3c79 : 8a __ __ TXA
3c7a : 18 __ __ CLC
3c7b : 65 54 __ ADC T2 + 0 
3c7d : a0 06 __ LDY #$06
3c7f : 91 23 __ STA (SP + 0),y 
3c81 : a5 44 __ LDA T11 + 1 
3c83 : 65 55 __ ADC T2 + 1 
3c85 : c8 __ __ INY
3c86 : 91 23 __ STA (SP + 0),y 
3c88 : 20 1b 2f JSR $2f1b ; (sprintf.s0 + 0)
3c8b : ad fc bf LDA $bffc ; (sstack + 5)
3c8e : 85 0f __ STA P2 
3c90 : a9 8c __ LDA #$8c
3c92 : 85 11 __ STA P4 
3c94 : a9 6c __ LDA #$6c
3c96 : 85 12 __ STA P5 
3c98 : a9 c6 __ LDA #$c6
3c9a : 85 13 __ STA P6 
3c9c : 18 __ __ CLC
3c9d : a5 58 __ LDA T6 + 0 
3c9f : 65 56 __ ADC T3 + 0 
3ca1 : 38 __ __ SEC
3ca2 : e9 01 __ SBC #$01
3ca4 : 85 10 __ STA P3 
3ca6 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
3ca9 : a5 5a __ LDA T8 + 0 
3cab : c9 91 __ CMP #$91
3cad : d0 0e __ BNE $3cbd ; (menu_pulldown.s31 + 0)
.s30:
3caf : c6 58 __ DEC T6 + 0 
3cb1 : f0 03 __ BEQ $3cb6 ; (menu_pulldown.s33 + 0)
3cb3 : 4c 69 3b JMP $3b69 ; (menu_pulldown.l5 + 0)
.s33:
3cb6 : a5 57 __ LDA T4 + 0 
.s1044:
3cb8 : 85 58 __ STA T6 + 0 
3cba : 4c 69 3b JMP $3b69 ; (menu_pulldown.l5 + 0)
.s31:
3cbd : e6 58 __ INC T6 + 0 
3cbf : a5 57 __ LDA T4 + 0 
3cc1 : c5 58 __ CMP T6 + 0 
3cc3 : 90 03 __ BCC $3cc8 ; (menu_pulldown.s36 + 0)
3cc5 : 4c 69 3b JMP $3b69 ; (menu_pulldown.l5 + 0)
.s36:
3cc8 : a9 01 __ LDA #$01
3cca : 90 ec __ BCC $3cb8 ; (menu_pulldown.s1044 + 0)
.s44:
3ccc : c9 0d __ CMP #$0d
3cce : d0 03 __ BNE $3cd3 ; (menu_pulldown.s45 + 0)
3cd0 : 4c 1c 3c JMP $3c1c ; (menu_pulldown.s6 + 0)
.s45:
3cd3 : b0 0c __ BCS $3ce1 ; (menu_pulldown.s46 + 0)
.s47:
3cd5 : c9 03 __ CMP #$03
3cd7 : f0 03 __ BEQ $3cdc ; (menu_pulldown.s16 + 0)
3cd9 : 4c 69 3b JMP $3b69 ; (menu_pulldown.l5 + 0)
.s16:
3cdc : a9 00 __ LDA #$00
3cde : 4c 1a 3c JMP $3c1a ; (menu_pulldown.s1045 + 0)
.s46:
3ce1 : c9 11 __ CMP #$11
3ce3 : d0 03 __ BNE $3ce8 ; (menu_pulldown.s46 + 7)
3ce5 : 4c 4b 3c JMP $3c4b ; (menu_pulldown.s29 + 0)
3ce8 : 4c 69 3b JMP $3b69 ; (menu_pulldown.l5 + 0)
--------------------------------------------------------------------
3ceb : __ __ __ BYT 25 43 25 53 20 00                               : %C%S .
--------------------------------------------------------------------
settings_screenmode: ; settings_screenmode()->void
.s1000:
3cf1 : a5 53 __ LDA T0 + 0 
3cf3 : 8d cd bf STA $bfcd ; (bigfont + 178)
3cf6 : a5 54 __ LDA T2 + 0 
3cf8 : 8d ce bf STA $bfce ; (bigfont + 179)
.s0:
3cfb : a9 08 __ LDA #$08
3cfd : 85 18 __ STA P11 
3cff : 8d f7 bf STA $bff7 ; (sstack + 0)
3d02 : a9 f0 __ LDA #$f0
3d04 : 85 17 __ STA P10 
3d06 : a9 1e __ LDA #$1e
3d08 : 8d f8 bf STA $bff8 ; (sstack + 1)
3d0b : a9 0a __ LDA #$0a
3d0d : 8d f9 bf STA $bff9 ; (sstack + 2)
3d10 : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
3d13 : 85 53 __ STA T0 + 0 
3d15 : a9 8d __ LDA #$8d
3d17 : 8d 7a 6c STA $6c7a ; (vdc_state + 7)
3d1a : 20 39 30 JSR $3039 ; (vdcwin_win_new.s1000 + 0)
3d1d : a9 3d __ LDA #$3d
3d1f : 85 12 __ STA P5 
3d21 : a9 5b __ LDA #$5b
3d23 : 85 11 __ STA P4 
3d25 : 20 e8 2d JSR $2de8 ; (vdc_prints_attr@proxy + 0)
3d28 : a9 19 __ LDA #$19
3d2a : 8d fc bf STA $bffc ; (sstack + 5)
3d2d : a9 0b __ LDA #$0b
3d2f : 8d fd bf STA $bffd ; (sstack + 6)
3d32 : a9 07 __ LDA #$07
3d34 : 8d fe bf STA $bffe ; (sstack + 7)
3d37 : 20 a2 3a JSR $3aa2 ; (menu_pulldown.s1000 + 0)
3d3a : a5 1b __ LDA ACCU + 0 
3d3c : 85 54 __ STA T2 + 0 
3d3e : 20 3a 35 JSR $353a ; (vdcwin_win_free.s0 + 0)
3d41 : a4 54 __ LDY T2 + 0 
3d43 : f0 06 __ BEQ $3d4b ; (settings_screenmode.s4 + 0)
.s2:
3d45 : 88 __ __ DEY
3d46 : 84 16 __ STY P9 
3d48 : 20 27 2b JSR $2b27 ; (vdc_set_mode.s1000 + 0)
.s4:
3d4b : a5 53 __ LDA T0 + 0 
3d4d : 8d 7a 6c STA $6c7a ; (vdc_state + 7)
.s1001:
3d50 : ad cd bf LDA $bfcd ; (bigfont + 178)
3d53 : 85 53 __ STA T0 + 0 
3d55 : ad ce bf LDA $bfce ; (bigfont + 179)
3d58 : 85 54 __ STA T2 + 0 
3d5a : 60 __ __ RTS
--------------------------------------------------------------------
3d5b : __ __ __ BYT 73 45 4c 45 43 54 20 53 43 52 45 45 4e 20 4d 4f : sELECT SCREEN MO
3d6b : __ __ __ BYT 44 45 00                                        : DE.
--------------------------------------------------------------------
settings_versioninfo: ; settings_versioninfo()->void
.s1000:
3d6e : 38 __ __ SEC
3d6f : a5 23 __ LDA SP + 0 
3d71 : e9 08 __ SBC #$08
3d73 : 85 23 __ STA SP + 0 
3d75 : b0 02 __ BCS $3d79 ; (settings_versioninfo.s0 + 0)
3d77 : c6 24 __ DEC SP + 1 
.s0:
3d79 : a9 05 __ LDA #$05
3d7b : 85 18 __ STA P11 
3d7d : 8d f7 bf STA $bff7 ; (sstack + 0)
3d80 : a9 f0 __ LDA #$f0
3d82 : 85 17 __ STA P10 
3d84 : a9 3c __ LDA #$3c
3d86 : 8d f8 bf STA $bff8 ; (sstack + 1)
3d89 : a9 0f __ LDA #$0f
3d8b : 8d f9 bf STA $bff9 ; (sstack + 2)
3d8e : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
3d91 : 85 52 __ STA T0 + 0 
3d93 : a9 8d __ LDA #$8d
3d95 : 8d 7a 6c STA $6c7a ; (vdc_state + 7)
3d98 : 20 39 30 JSR $3039 ; (vdcwin_win_new.s1000 + 0)
3d9b : a9 06 __ LDA #$06
3d9d : 85 0f __ STA P2 
3d9f : 85 10 __ STA P3 
3da1 : a9 ad __ LDA #$ad
3da3 : 8d 7a 6c STA $6c7a ; (vdc_state + 7)
3da6 : 85 13 __ STA P6 
3da8 : a9 61 __ LDA #$61
3daa : 85 11 __ STA P4 
3dac : a9 3e __ LDA #$3e
3dae : 85 12 __ STA P5 
3db0 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
3db3 : a9 8d __ LDA #$8d
3db5 : 8d 7a 6c STA $6c7a ; (vdc_state + 7)
3db8 : 85 13 __ STA P6 
3dba : a9 08 __ LDA #$08
3dbc : 85 10 __ STA P3 
3dbe : a9 81 __ LDA #$81
3dc0 : 85 11 __ STA P4 
3dc2 : a9 3e __ LDA #$3e
3dc4 : 85 12 __ STA P5 
3dc6 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
3dc9 : e6 10 __ INC P3 
3dcb : a9 92 __ LDA #$92
3dcd : 85 11 __ STA P4 
3dcf : a9 3e __ LDA #$3e
3dd1 : 85 12 __ STA P5 
3dd3 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
3dd6 : a9 8c __ LDA #$8c
3dd8 : a0 02 __ LDY #$02
3dda : 91 23 __ STA (SP + 0),y 
3ddc : a9 6c __ LDA #$6c
3dde : c8 __ __ INY
3ddf : 91 23 __ STA (SP + 0),y 
3de1 : a9 b0 __ LDA #$b0
3de3 : c8 __ __ INY
3de4 : 91 23 __ STA (SP + 0),y 
3de6 : a9 3e __ LDA #$3e
3de8 : c8 __ __ INY
3de9 : 91 23 __ STA (SP + 0),y 
3deb : a9 bc __ LDA #$bc
3ded : c8 __ __ INY
3dee : 91 23 __ STA (SP + 0),y 
3df0 : a9 3e __ LDA #$3e
3df2 : c8 __ __ INY
3df3 : 91 23 __ STA (SP + 0),y 
3df5 : 20 1b 2f JSR $2f1b ; (sprintf.s0 + 0)
3df8 : a9 06 __ LDA #$06
3dfa : 85 0f __ STA P2 
3dfc : a9 0a __ LDA #$0a
3dfe : 85 10 __ STA P3 
3e00 : 20 09 67 JSR $6709 ; (vdc_prints_attr@proxy + 0)
3e03 : a9 0c __ LDA #$0c
3e05 : 85 10 __ STA P3 
3e07 : a9 3e __ LDA #$3e
3e09 : 85 12 __ STA P5 
3e0b : a9 ce __ LDA #$ce
3e0d : 85 11 __ STA P4 
3e0f : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
3e12 : e6 10 __ INC P3 
3e14 : a9 00 __ LDA #$00
3e16 : 85 11 __ STA P4 
3e18 : a9 3f __ LDA #$3f
3e1a : 85 12 __ STA P5 
3e1c : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
3e1f : e6 10 __ INC P3 
3e21 : a9 30 __ LDA #$30
3e23 : 85 11 __ STA P4 
3e25 : a9 3f __ LDA #$3f
3e27 : 85 12 __ STA P5 
3e29 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
3e2c : a9 10 __ LDA #$10
3e2e : 85 10 __ STA P3 
3e30 : a9 3f __ LDA #$3f
3e32 : 85 12 __ STA P5 
3e34 : a9 57 __ LDA #$57
3e36 : 85 11 __ STA P4 
3e38 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
3e3b : a9 12 __ LDA #$12
3e3d : 85 10 __ STA P3 
3e3f : a9 3e __ LDA #$3e
3e41 : 85 12 __ STA P5 
3e43 : a9 e5 __ LDA #$e5
3e45 : 85 11 __ STA P4 
3e47 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
3e4a : 20 bf 2a JSR $2abf ; (getch.s0 + 0)
3e4d : 20 3a 35 JSR $353a ; (vdcwin_win_free.s0 + 0)
3e50 : a5 52 __ LDA T0 + 0 
3e52 : 8d 7a 6c STA $6c7a ; (vdc_state + 7)
.s1001:
3e55 : 18 __ __ CLC
3e56 : a5 23 __ LDA SP + 0 
3e58 : 69 08 __ ADC #$08
3e5a : 85 23 __ STA SP + 0 
3e5c : 90 02 __ BCC $3e60 ; (settings_versioninfo.s1001 + 11)
3e5e : e6 24 __ INC SP + 1 
3e60 : 60 __ __ RTS
--------------------------------------------------------------------
3e61 : __ __ __ BYT 76 45 52 53 49 4f 4e 20 49 4e 46 4f 52 4d 41 54 : vERSION INFORMAT
3e71 : __ __ __ BYT 49 4f 4e 20 41 4e 44 20 43 52 45 44 49 54 53 00 : ION AND CREDITS.
--------------------------------------------------------------------
3e81 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d 4f : oSCAR64 vdc dEMO
3e91 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
3e92 : __ __ __ BYT 77 52 49 54 54 45 4e 20 49 4e 20 32 30 32 34 20 : wRITTEN IN 2024 
3ea2 : __ __ __ BYT 42 59 20 78 41 4e 44 45 52 20 6d 4f 4c 00       : BY xANDER mOL.
--------------------------------------------------------------------
3eb0 : __ __ __ BYT 76 45 52 53 49 4f 4e 3a 20 25 53 00             : vERSION: %S.
--------------------------------------------------------------------
3ebc : __ __ __ BYT 56 30 31 2d 32 30 32 34 30 36 32 39 2d 31 35 33 : V01-20240629-153
3ecc : __ __ __ BYT 35 00                                           : 5.
--------------------------------------------------------------------
3ece : __ __ __ BYT 6d 55 53 49 43 20 42 59 20 6e 4f 52 44 49 53 43 : mUSIC BY nORDISC
3ede : __ __ __ BYT 48 53 4f 55 4e 44 00                            : HSOUND.
--------------------------------------------------------------------
3ee5 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 54 4f 20 43 : pRESS A KEY TO C
3ef5 : __ __ __ BYT 4f 4e 54 49 4e 55 45 2e 00                      : ONTINUE..
--------------------------------------------------------------------
bootdevice:
3efe : __ __ __ BSS	1
--------------------------------------------------------------------
3f00 : __ __ __ BYT 66 55 4c 4c 20 53 4f 55 52 43 45 20 43 4f 44 45 : fULL SOURCE CODE
3f10 : __ __ __ BYT 2c 20 44 4f 43 55 4d 45 4e 54 41 54 49 4f 4e 20 : , DOCUMENTATION 
3f20 : __ __ __ BYT 41 4e 44 20 43 52 45 44 49 54 53 20 41 54 3a 00 : AND CREDITS AT:.
--------------------------------------------------------------------
3f30 : __ __ __ BYT 48 54 54 50 53 3a 2f 2f 47 49 54 48 55 42 2e 43 : HTTPS://GITHUB.C
3f40 : __ __ __ BYT 4f 4d 2f 58 41 48 4d 4f 4c 2f 6f 53 43 41 52 36 : OM/XAHMOL/oSCAR6
3f50 : __ __ __ BYT 34 74 45 53 54 2f 00                            : 4tEST/.
--------------------------------------------------------------------
3f57 : __ __ __ BYT 28 63 29 20 32 30 32 34 2c 20 69 64 52 45 41 4d : (c) 2024, idREAM
3f67 : __ __ __ BYT 54 69 4e 38 62 49 54 53 2e 43 4f 4d 00          : TiN8bITS.COM.
--------------------------------------------------------------------
windows_windowstacking: ; windows_windowstacking()->void
.s1000:
3f74 : a2 04 __ LDX #$04
3f76 : b5 53 __ LDA T0 + 0,x 
3f78 : 9d 45 bf STA $bf45,x ; (bigfont + 42)
3f7b : ca __ __ DEX
3f7c : 10 f8 __ BPL $3f76 ; (windows_windowstacking.s1000 + 2)
.s0:
3f7e : ad 08 dc LDA $dc08 
3f81 : 18 __ __ CLC
3f82 : 6d 09 dc ADC $dc09 
3f85 : a0 00 __ LDY #$00
3f87 : 90 01 __ BCC $3f8a ; (windows_windowstacking.s1007 + 0)
.s1006:
3f89 : c8 __ __ INY
.s1007:
3f8a : 18 __ __ CLC
3f8b : 69 01 __ ADC #$01
3f8d : 8d fe 37 STA $37fe ; (seed + 0)
3f90 : 90 01 __ BCC $3f93 ; (windows_windowstacking.s1009 + 0)
.s1008:
3f92 : c8 __ __ INY
.s1009:
3f93 : 8c ff 37 STY $37ff ; (seed + 1)
3f96 : a9 00 __ LDA #$00
3f98 : 85 54 __ STA T1 + 0 
3f9a : 85 55 __ STA T1 + 1 
3f9c : 85 56 __ STA T2 + 0 
3f9e : 85 57 __ STA T3 + 0 
.l2:
3fa0 : a5 54 __ LDA T1 + 0 
3fa2 : 29 01 __ AND #$01
3fa4 : 09 f0 __ ORA #$f0
3fa6 : 85 17 __ STA P10 
3fa8 : a9 28 __ LDA #$28
3faa : 8d f8 bf STA $bff8 ; (sstack + 1)
3fad : 18 __ __ CLC
3fae : a5 57 __ LDA T3 + 0 
3fb0 : 69 05 __ ADC #$05
3fb2 : 85 18 __ STA P11 
3fb4 : 18 __ __ CLC
3fb5 : a5 56 __ LDA T2 + 0 
3fb7 : 69 05 __ ADC #$05
3fb9 : 8d f7 bf STA $bff7 ; (sstack + 0)
3fbc : ad 78 6c LDA $6c78 ; (vdc_state + 5)
3fbf : 85 1b __ STA ACCU + 0 
3fc1 : ad 79 6c LDA $6c79 ; (vdc_state + 6)
3fc4 : 85 1c __ STA ACCU + 1 
3fc6 : a9 03 __ LDA #$03
3fc8 : 85 03 __ STA WORK + 0 
3fca : a9 00 __ LDA #$00
3fcc : 85 04 __ STA WORK + 1 
3fce : 20 b0 63 JSR $63b0 ; (divmod + 0)
3fd1 : a5 1b __ LDA ACCU + 0 
3fd3 : 8d f9 bf STA $bff9 ; (sstack + 2)
3fd6 : 20 39 30 JSR $3039 ; (vdcwin_win_new.s1000 + 0)
3fd9 : a9 64 __ LDA #$64
3fdb : 85 53 __ STA T0 + 0 
.l5:
3fdd : a9 8c __ LDA #$8c
3fdf : 8d fc bf STA $bffc ; (sstack + 5)
3fe2 : a9 6c __ LDA #$6c
3fe4 : 8d fd bf STA $bffd ; (sstack + 6)
3fe7 : 20 18 41 JSR $4118 ; (rand.s0 + 0)
3fea : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
3fed : 29 f0 __ AND #$f0
3fef : 85 46 __ STA T7 + 0 
3ff1 : 20 a8 63 JSR $63a8 ; (divmod@proxy + 0)
3ff4 : a5 05 __ LDA WORK + 2 
3ff6 : 38 __ __ SEC
3ff7 : 65 46 __ ADC T7 + 0 
3ff9 : 8d 7a 6c STA $6c7a ; (vdc_state + 7)
3ffc : 20 3f 41 JSR $413f ; (generateSentence.s1000 + 0)
3fff : a9 8c __ LDA #$8c
4001 : 8d fc bf STA $bffc ; (sstack + 5)
4004 : a9 6c __ LDA #$6c
4006 : 8d fd bf STA $bffd ; (sstack + 6)
4009 : ad 60 6c LDA $6c60 ; (winCfg + 5)
400c : 85 1b __ STA ACCU + 0 
400e : a9 00 __ LDA #$00
4010 : 85 1c __ STA ACCU + 1 
4012 : a9 0d __ LDA #$0d
4014 : 20 46 63 JSR $6346 ; (mul16by8 + 0)
4017 : 18 __ __ CLC
4018 : a9 b9 __ LDA #$b9
401a : 65 05 __ ADC WORK + 2 
401c : 8d fa bf STA $bffa ; (sstack + 3)
401f : a9 6d __ LDA #$6d
4021 : 69 00 __ ADC #$00
4023 : 8d fb bf STA $bffb ; (sstack + 4)
4026 : 20 69 42 JSR $4269 ; (vdcwin_printwrap.s1000 + 0)
4029 : ac 60 6c LDY $6c60 ; (winCfg + 5)
402c : be 70 66 LDX $6670,y ; (__multab13L + 0)
402f : bd bd 6d LDA $6dbd,x 
4032 : f0 17 __ BEQ $404b ; (windows_windowstacking.s60 + 0)
.s9:
4034 : 86 43 __ STX T5 + 0 
4036 : a9 20 __ LDA #$20
4038 : 8d f7 bf STA $bff7 ; (sstack + 0)
403b : 18 __ __ CLC
403c : a9 b9 __ LDA #$b9
403e : 65 43 __ ADC T5 + 0 
4040 : 85 17 __ STA P10 
4042 : a9 6d __ LDA #$6d
4044 : 69 00 __ ADC #$00
4046 : 85 18 __ STA P11 
4048 : 20 4e 47 JSR $474e ; (vdcwin_put_char.s1000 + 0)
.s60:
404b : c6 53 __ DEC T0 + 0 
404d : d0 8e __ BNE $3fdd ; (windows_windowstacking.l5 + 0)
.s7:
404f : 20 bf 2a JSR $2abf ; (getch.s0 + 0)
4052 : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
4055 : 29 f0 __ AND #$f0
4057 : 09 0d __ ORA #$0d
4059 : 8d 7a 6c STA $6c7a ; (vdc_state + 7)
405c : e6 54 __ INC T1 + 0 
405e : d0 02 __ BNE $4062 ; (windows_windowstacking.s1011 + 0)
.s1010:
4060 : e6 55 __ INC T1 + 1 
.s1011:
4062 : 18 __ __ CLC
4063 : a5 57 __ LDA T3 + 0 
4065 : 69 05 __ ADC #$05
4067 : 85 57 __ STA T3 + 0 
4069 : 18 __ __ CLC
406a : a5 56 __ LDA T2 + 0 
406c : 69 03 __ ADC #$03
406e : 85 56 __ STA T2 + 0 
4070 : ad 60 6c LDA $6c60 ; (winCfg + 5)
4073 : c9 03 __ CMP #$03
4075 : b0 03 __ BCS $407a ; (windows_windowstacking.l13 + 0)
4077 : 4c a0 3f JMP $3fa0 ; (windows_windowstacking.l2 + 0)
.l13:
407a : 20 3a 35 JSR $353a ; (vdcwin_win_free.s0 + 0)
407d : a9 64 __ LDA #$64
407f : 85 53 __ STA T0 + 0 
.l16:
4081 : a9 8c __ LDA #$8c
4083 : 8d fc bf STA $bffc ; (sstack + 5)
4086 : a9 6c __ LDA #$6c
4088 : 8d fd bf STA $bffd ; (sstack + 6)
408b : 20 18 41 JSR $4118 ; (rand.s0 + 0)
408e : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
4091 : 29 f0 __ AND #$f0
4093 : 85 57 __ STA T3 + 0 
4095 : 20 a8 63 JSR $63a8 ; (divmod@proxy + 0)
4098 : a5 05 __ LDA WORK + 2 
409a : 38 __ __ SEC
409b : 65 57 __ ADC T3 + 0 
409d : 8d 7a 6c STA $6c7a ; (vdc_state + 7)
40a0 : 20 3f 41 JSR $413f ; (generateSentence.s1000 + 0)
40a3 : a9 8c __ LDA #$8c
40a5 : 8d fc bf STA $bffc ; (sstack + 5)
40a8 : a9 6c __ LDA #$6c
40aa : 8d fd bf STA $bffd ; (sstack + 6)
40ad : ad 60 6c LDA $6c60 ; (winCfg + 5)
40b0 : 85 1b __ STA ACCU + 0 
40b2 : a9 00 __ LDA #$00
40b4 : 85 1c __ STA ACCU + 1 
40b6 : a9 0d __ LDA #$0d
40b8 : 20 46 63 JSR $6346 ; (mul16by8 + 0)
40bb : 18 __ __ CLC
40bc : a9 b9 __ LDA #$b9
40be : 65 05 __ ADC WORK + 2 
40c0 : 8d fa bf STA $bffa ; (sstack + 3)
40c3 : a9 6d __ LDA #$6d
40c5 : 69 00 __ ADC #$00
40c7 : 8d fb bf STA $bffb ; (sstack + 4)
40ca : 20 69 42 JSR $4269 ; (vdcwin_printwrap.s1000 + 0)
40cd : ac 60 6c LDY $6c60 ; (winCfg + 5)
40d0 : be 70 66 LDX $6670,y ; (__multab13L + 0)
40d3 : bd bd 6d LDA $6dbd,x 
40d6 : f0 17 __ BEQ $40ef ; (windows_windowstacking.s61 + 0)
.s20:
40d8 : 86 56 __ STX T2 + 0 
40da : a9 20 __ LDA #$20
40dc : 8d f7 bf STA $bff7 ; (sstack + 0)
40df : 18 __ __ CLC
40e0 : a9 b9 __ LDA #$b9
40e2 : 65 56 __ ADC T2 + 0 
40e4 : 85 17 __ STA P10 
40e6 : a9 6d __ LDA #$6d
40e8 : 69 00 __ ADC #$00
40ea : 85 18 __ STA P11 
40ec : 20 4e 47 JSR $474e ; (vdcwin_put_char.s1000 + 0)
.s61:
40ef : c6 53 __ DEC T0 + 0 
40f1 : d0 8e __ BNE $4081 ; (windows_windowstacking.l16 + 0)
.s18:
40f3 : 20 bf 2a JSR $2abf ; (getch.s0 + 0)
40f6 : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
40f9 : 29 f0 __ AND #$f0
40fb : 09 0d __ ORA #$0d
40fd : 8d 7a 6c STA $6c7a ; (vdc_state + 7)
4100 : a9 01 __ LDA #$01
4102 : cd 60 6c CMP $6c60 ; (winCfg + 5)
4105 : b0 03 __ BCS $410a ; (windows_windowstacking.s14 + 0)
4107 : 4c 7a 40 JMP $407a ; (windows_windowstacking.l13 + 0)
.s14:
410a : 20 3a 35 JSR $353a ; (vdcwin_win_free.s0 + 0)
.s1001:
410d : a2 04 __ LDX #$04
410f : bd 45 bf LDA $bf45,x ; (bigfont + 42)
4112 : 95 53 __ STA T0 + 0,x 
4114 : ca __ __ DEX
4115 : 10 f8 __ BPL $410f ; (windows_windowstacking.s1001 + 2)
4117 : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
.s0:
4118 : ad ff 37 LDA $37ff ; (seed + 1)
411b : 4a __ __ LSR
411c : ad fe 37 LDA $37fe ; (seed + 0)
411f : 6a __ __ ROR
4120 : aa __ __ TAX
4121 : a9 00 __ LDA #$00
4123 : 6a __ __ ROR
4124 : 4d fe 37 EOR $37fe ; (seed + 0)
4127 : 85 1b __ STA ACCU + 0 
4129 : 8a __ __ TXA
412a : 4d ff 37 EOR $37ff ; (seed + 1)
412d : 85 1c __ STA ACCU + 1 
412f : 4a __ __ LSR
4130 : 45 1b __ EOR ACCU + 0 
4132 : 8d fe 37 STA $37fe ; (seed + 0)
4135 : 85 1b __ STA ACCU + 0 
4137 : 45 1c __ EOR ACCU + 1 
4139 : 8d ff 37 STA $37ff ; (seed + 1)
413c : 85 1c __ STA ACCU + 1 
.s1001:
413e : 60 __ __ RTS
--------------------------------------------------------------------
generateSentence: ; generateSentence(u8*)->void
.s1000:
413f : a5 53 __ LDA T2 + 0 
4141 : 8d 4e bf STA $bf4e ; (bigfont + 51)
4144 : a5 54 __ LDA T2 + 1 
4146 : 8d 4f bf STA $bf4f ; (bigfont + 52)
4149 : 38 __ __ SEC
414a : a5 23 __ LDA SP + 0 
414c : e9 0e __ SBC #$0e
414e : 85 23 __ STA SP + 0 
4150 : b0 02 __ BCS $4154 ; (generateSentence.s0 + 0)
4152 : c6 24 __ DEC SP + 1 
.s0:
4154 : a9 00 __ LDA #$00
4156 : 8d da bf STA $bfda ; (bigfont + 191)
4159 : 8d dc bf STA $bfdc ; (bigfont + 193)
415c : 8d dd bf STA $bfdd ; (bigfont + 194)
415f : 8d de bf STA $bfde ; (bigfont + 195)
4162 : a9 74 __ LDA #$74
4164 : 8d d7 bf STA $bfd7 ; (bigfont + 188)
4167 : a9 48 __ LDA #$48
4169 : 8d d8 bf STA $bfd8 ; (bigfont + 189)
416c : a9 45 __ LDA #$45
416e : 8d d9 bf STA $bfd9 ; (bigfont + 190)
4171 : a9 61 __ LDA #$61
4173 : 8d db bf STA $bfdb ; (bigfont + 192)
4176 : a2 4b __ LDX #$4b
.l1002:
4178 : bd 07 6c LDA $6c07,x ; (pulldown_titles + 815)
417b : 9d 8b bf STA $bf8b,x ; (bigfont + 112)
417e : ca __ __ DEX
417f : d0 f7 __ BNE $4178 ; (generateSentence.l1002 + 0)
.s1003:
4181 : a2 1e __ LDX #$1e
.l1004:
4183 : bd b5 67 LDA $67b5,x ; (pulldown_options + 7)
4186 : 9d 6d bf STA $bf6d,x ; (bigfont + 82)
4189 : ca __ __ DEX
418a : d0 f7 __ BNE $4183 ; (generateSentence.l1004 + 0)
.s1005:
418c : a2 1e __ LDX #$1e
.l1006:
418e : bd d3 67 LDA $67d3,x 
4191 : 9d 4f bf STA $bf4f,x ; (bigfont + 52)
4194 : ca __ __ DEX
4195 : d0 f7 __ BNE $418e ; (generateSentence.l1006 + 0)
.s1007:
4197 : 20 18 41 JSR $4118 ; (rand.s0 + 0)
419a : a5 1b __ LDA ACCU + 0 
419c : 85 4e __ STA T0 + 0 
419e : 20 18 41 JSR $4118 ; (rand.s0 + 0)
41a1 : a5 1b __ LDA ACCU + 0 
41a3 : 85 4f __ STA T1 + 0 
41a5 : a5 1c __ LDA ACCU + 1 
41a7 : 85 50 __ STA T1 + 1 
41a9 : 20 18 41 JSR $4118 ; (rand.s0 + 0)
41ac : a5 1b __ LDA ACCU + 0 
41ae : 85 53 __ STA T2 + 0 
41b0 : a5 1c __ LDA ACCU + 1 
41b2 : 85 54 __ STA T2 + 1 
41b4 : 20 18 41 JSR $4118 ; (rand.s0 + 0)
41b7 : ad fc bf LDA $bffc ; (sstack + 5)
41ba : 85 45 __ STA T4 + 0 
41bc : ad fd bf LDA $bffd ; (sstack + 6)
41bf : 85 46 __ STA T4 + 1 
41c1 : a9 00 __ LDA #$00
41c3 : 85 04 __ STA WORK + 1 
41c5 : a8 __ __ TAY
41c6 : 91 45 __ STA (T4 + 0),y 
41c8 : a5 45 __ LDA T4 + 0 
41ca : a0 02 __ LDY #$02
41cc : 91 23 __ STA (SP + 0),y 
41ce : a5 46 __ LDA T4 + 1 
41d0 : c8 __ __ INY
41d1 : 91 23 __ STA (SP + 0),y 
41d3 : a9 5c __ LDA #$5c
41d5 : c8 __ __ INY
41d6 : 91 23 __ STA (SP + 0),y 
41d8 : a9 42 __ LDA #$42
41da : c8 __ __ INY
41db : 84 03 __ STY WORK + 0 
41dd : 91 23 __ STA (SP + 0),y 
41df : a5 4e __ LDA T0 + 0 
41e1 : 29 01 __ AND #$01
41e3 : 0a __ __ ASL
41e4 : 0a __ __ ASL
41e5 : 69 d7 __ ADC #$d7
41e7 : c8 __ __ INY
41e8 : 91 23 __ STA (SP + 0),y 
41ea : a9 bf __ LDA #$bf
41ec : 69 00 __ ADC #$00
41ee : c8 __ __ INY
41ef : 91 23 __ STA (SP + 0),y 
41f1 : 20 b0 63 JSR $63b0 ; (divmod + 0)
41f4 : a6 05 __ LDX WORK + 2 
41f6 : bd 8b 66 LDA $668b,x ; (__multab6L + 0)
41f9 : 18 __ __ CLC
41fa : 69 50 __ ADC #$50
41fc : a0 08 __ LDY #$08
41fe : 91 23 __ STA (SP + 0),y 
4200 : a9 bf __ LDA #$bf
4202 : 69 00 __ ADC #$00
4204 : c8 __ __ INY
4205 : 91 23 __ STA (SP + 0),y 
4207 : a5 4f __ LDA T1 + 0 
4209 : 85 1b __ STA ACCU + 0 
420b : a5 50 __ LDA T1 + 1 
420d : 85 1c __ STA ACCU + 1 
420f : 20 54 67 JSR $6754 ; (divmod@proxy + 0)
4212 : a6 05 __ LDX WORK + 2 
4214 : bd 90 66 LDA $6690,x ; (__multab15L + 0)
4217 : 18 __ __ CLC
4218 : 69 8c __ ADC #$8c
421a : a0 0a __ LDY #$0a
421c : 91 23 __ STA (SP + 0),y 
421e : a9 bf __ LDA #$bf
4220 : 69 00 __ ADC #$00
4222 : c8 __ __ INY
4223 : 91 23 __ STA (SP + 0),y 
4225 : a5 53 __ LDA T2 + 0 
4227 : 85 1b __ STA ACCU + 0 
4229 : a5 54 __ LDA T2 + 1 
422b : 85 1c __ STA ACCU + 1 
422d : 20 54 67 JSR $6754 ; (divmod@proxy + 0)
4230 : a6 05 __ LDX WORK + 2 
4232 : bd 8b 66 LDA $668b,x ; (__multab6L + 0)
4235 : 18 __ __ CLC
4236 : 69 6e __ ADC #$6e
4238 : a0 0c __ LDY #$0c
423a : 91 23 __ STA (SP + 0),y 
423c : a9 bf __ LDA #$bf
423e : 69 00 __ ADC #$00
4240 : c8 __ __ INY
4241 : 91 23 __ STA (SP + 0),y 
4243 : 20 1b 2f JSR $2f1b ; (sprintf.s0 + 0)
.s1001:
4246 : 18 __ __ CLC
4247 : a5 23 __ LDA SP + 0 
4249 : 69 0e __ ADC #$0e
424b : 85 23 __ STA SP + 0 
424d : 90 02 __ BCC $4251 ; (generateSentence.s1001 + 11)
424f : e6 24 __ INC SP + 1 
4251 : ad 4e bf LDA $bf4e ; (bigfont + 51)
4254 : 85 53 __ STA T2 + 0 
4256 : ad 4f bf LDA $bf4f ; (bigfont + 52)
4259 : 85 54 __ STA T2 + 1 
425b : 60 __ __ RTS
--------------------------------------------------------------------
425c : __ __ __ BYT 25 53 20 25 53 20 25 53 20 25 53 2e 00          : %S %S %S %S..
--------------------------------------------------------------------
vdcwin_printwrap: ; vdcwin_printwrap(struct VDCWin*,const u8*)->void
.s1000:
4269 : a2 04 __ LDX #$04
426b : b5 53 __ LDA T0 + 0,x 
426d : 9d 90 bf STA $bf90,x ; (bigfont + 117)
4270 : ca __ __ DEX
4271 : 10 f8 __ BPL $426b ; (vdcwin_printwrap.s1000 + 2)
4273 : 38 __ __ SEC
4274 : a5 23 __ LDA SP + 0 
4276 : e9 06 __ SBC #$06
4278 : 85 23 __ STA SP + 0 
427a : b0 02 __ BCS $427e ; (vdcwin_printwrap.s0 + 0)
427c : c6 24 __ DEC SP + 1 
.s0:
427e : ad fc bf LDA $bffc ; (sstack + 5)
4281 : 85 0d __ STA P0 
4283 : ad fd bf LDA $bffd ; (sstack + 6)
4286 : 85 0e __ STA P1 
4288 : 20 f7 2e JSR $2ef7 ; (strlen.s0 + 0)
428b : a5 1b __ LDA ACCU + 0 
428d : f0 3b __ BEQ $42ca ; (vdcwin_printwrap.s1001 + 0)
.s30:
428f : 85 53 __ STA T0 + 0 
4291 : a9 00 __ LDA #$00
4293 : 85 55 __ STA T3 + 0 
4295 : 85 45 __ STA T6 + 0 
4297 : a9 ff __ LDA #$ff
4299 : 85 57 __ STA T4 + 1 
429b : 85 44 __ STA T5 + 1 
429d : ad fa bf LDA $bffa ; (sstack + 3)
42a0 : 85 1b __ STA ACCU + 0 
42a2 : ad fb bf LDA $bffb ; (sstack + 4)
42a5 : 85 1c __ STA ACCU + 1 ; (win + 0)
42a7 : a0 02 __ LDY #$02
42a9 : b1 1b __ LDA (ACCU + 0),y 
42ab : 85 54 __ STA T1 + 0 
.l4:
42ad : a5 55 __ LDA T3 + 0 
42af : c5 53 __ CMP T0 + 0 
42b1 : b0 0d __ BCS $42c0 ; (vdcwin_printwrap.s7 + 0)
.l9:
42b3 : 24 44 __ BIT T5 + 1 
42b5 : 10 09 __ BPL $42c0 ; (vdcwin_printwrap.s7 + 0)
.s8:
42b7 : a5 45 __ LDA T6 + 0 
42b9 : c9 50 __ CMP #$50
42bb : b0 03 __ BCS $42c0 ; (vdcwin_printwrap.s7 + 0)
42bd : 4c c1 43 JMP $43c1 ; (vdcwin_printwrap.s6 + 0)
.s7:
42c0 : a6 45 __ LDX T6 + 0 
42c2 : d0 1c __ BNE $42e0 ; (vdcwin_printwrap.s19 + 0)
.s1:
42c4 : a5 55 __ LDA T3 + 0 
42c6 : c5 53 __ CMP T0 + 0 
42c8 : 90 e9 __ BCC $42b3 ; (vdcwin_printwrap.l9 + 0)
.s1001:
42ca : 18 __ __ CLC
42cb : a5 23 __ LDA SP + 0 
42cd : 69 06 __ ADC #$06
42cf : 85 23 __ STA SP + 0 
42d1 : 90 02 __ BCC $42d5 ; (vdcwin_printwrap.s1001 + 11)
42d3 : e6 24 __ INC SP + 1 
42d5 : a2 04 __ LDX #$04
42d7 : bd 90 bf LDA $bf90,x ; (bigfont + 117)
42da : 95 53 __ STA T0 + 0,x 
42dc : ca __ __ DEX
42dd : 10 f8 __ BPL $42d7 ; (vdcwin_printwrap.s1001 + 13)
42df : 60 __ __ RTS
.s19:
42e0 : a9 00 __ LDA #$00
42e2 : 9d 98 bf STA $bf98,x ; (bigfont + 125)
42e5 : a9 98 __ LDA #$98
42e7 : 85 0d __ STA P0 
42e9 : a9 bf __ LDA #$bf
42eb : 85 0e __ STA P1 
42ed : 20 f7 2e JSR $2ef7 ; (strlen.s0 + 0)
42f0 : ad fa bf LDA $bffa ; (sstack + 3)
42f3 : 85 56 __ STA T4 + 0 
42f5 : ad fb bf LDA $bffb ; (sstack + 4)
42f8 : 85 57 __ STA T4 + 1 
42fa : 4c 00 43 JMP $4300 ; (vdcwin_printwrap.l22 + 0)
.s1013:
42fd : 20 f7 2e JSR $2ef7 ; (strlen.s0 + 0)
.l22:
4300 : a0 02 __ LDY #$02
4302 : b1 56 __ LDA (T4 + 0),y 
4304 : c5 1b __ CMP ACCU + 0 
4306 : 90 57 __ BCC $435f ; (vdcwin_printwrap.s23 + 0)
.s24:
4308 : a0 04 __ LDY #$04
430a : b1 56 __ LDA (T4 + 0),y 
430c : 18 __ __ CLC
430d : 65 1b __ ADC ACCU + 0 
430f : b0 06 __ BCS $4317 ; (vdcwin_printwrap.s25 + 0)
.s1010:
4311 : c5 54 __ CMP T1 + 0 
4313 : 90 1a __ BCC $432f ; (vdcwin_printwrap.s27 + 0)
.s1018:
4315 : f0 18 __ BEQ $432f ; (vdcwin_printwrap.s27 + 0)
.s25:
4317 : a5 56 __ LDA T4 + 0 
4319 : a0 02 __ LDY #$02
431b : 91 23 __ STA (SP + 0),y 
431d : a5 57 __ LDA T4 + 1 
431f : c8 __ __ INY
4320 : 91 23 __ STA (SP + 0),y 
4322 : a9 fe __ LDA #$fe
4324 : c8 __ __ INY
4325 : 91 23 __ STA (SP + 0),y 
4327 : a9 2d __ LDA #$2d
4329 : c8 __ __ INY
432a : 91 23 __ STA (SP + 0),y 
432c : 20 ed 43 JSR $43ed ; (vdcwin_printline.s1000 + 0)
.s27:
432f : ad fa bf LDA $bffa ; (sstack + 3)
4332 : a0 02 __ LDY #$02
4334 : 91 23 __ STA (SP + 0),y 
4336 : ad fb bf LDA $bffb ; (sstack + 4)
4339 : c8 __ __ INY
433a : 91 23 __ STA (SP + 0),y 
433c : a9 98 __ LDA #$98
433e : c8 __ __ INY
433f : 91 23 __ STA (SP + 0),y 
4341 : a9 bf __ LDA #$bf
4343 : c8 __ __ INY
4344 : 91 23 __ STA (SP + 0),y 
4346 : 20 95 44 JSR $4495 ; (vdcwin_put_string.s1000 + 0)
4349 : a5 55 __ LDA T3 + 0 
434b : c5 53 __ CMP T0 + 0 
434d : 90 03 __ BCC $4352 ; (vdcwin_printwrap.s49 + 0)
434f : 4c ca 42 JMP $42ca ; (vdcwin_printwrap.s1001 + 0)
.s49:
4352 : a9 ff __ LDA #$ff
4354 : 85 44 __ STA T5 + 1 
4356 : 85 57 __ STA T4 + 1 
4358 : a9 00 __ LDA #$00
435a : 85 45 __ STA T6 + 0 
435c : 4c ad 42 JMP $42ad ; (vdcwin_printwrap.l4 + 0)
.s23:
435f : a5 56 __ LDA T4 + 0 
4361 : 91 23 __ STA (SP + 0),y 
4363 : a5 57 __ LDA T4 + 1 
4365 : c8 __ __ INY
4366 : 91 23 __ STA (SP + 0),y 
4368 : a9 fe __ LDA #$fe
436a : c8 __ __ INY
436b : 91 23 __ STA (SP + 0),y 
436d : a9 2d __ LDA #$2d
436f : c8 __ __ INY
4370 : 91 23 __ STA (SP + 0),y 
4372 : 20 ed 43 JSR $43ed ; (vdcwin_printline.s1000 + 0)
4375 : ad fa bf LDA $bffa ; (sstack + 3)
4378 : 85 17 __ STA P10 
437a : ad fb bf LDA $bffb ; (sstack + 4)
437d : 85 18 __ STA P11 
437f : a0 02 __ LDY #$02
4381 : b1 17 __ LDA (P10),y 
4383 : 8d f9 bf STA $bff9 ; (sstack + 2)
4386 : a9 98 __ LDA #$98
4388 : 8d f7 bf STA $bff7 ; (sstack + 0)
438b : a9 bf __ LDA #$bf
438d : 8d f8 bf STA $bff8 ; (sstack + 1)
4390 : 20 95 46 JSR $4695 ; (vdcwin_put_chars.s1000 + 0)
4393 : ad fa bf LDA $bffa ; (sstack + 3)
4396 : 85 43 __ STA T5 + 0 
4398 : a9 98 __ LDA #$98
439a : 85 0d __ STA P0 
439c : a9 bf __ LDA #$bf
439e : 85 0e __ STA P1 
43a0 : ad fb bf LDA $bffb ; (sstack + 4)
43a3 : 85 44 __ STA T5 + 1 
43a5 : a0 02 __ LDY #$02
43a7 : b1 43 __ LDA (T5 + 0),y 
43a9 : 18 __ __ CLC
43aa : 69 98 __ ADC #$98
43ac : 85 43 __ STA T5 + 0 
43ae : a9 bf __ LDA #$bf
43b0 : 69 00 __ ADC #$00
43b2 : 85 44 __ STA T5 + 1 
43b4 : a0 ff __ LDY #$ff
.l1012:
43b6 : c8 __ __ INY
43b7 : b1 43 __ LDA (T5 + 0),y 
43b9 : 99 98 bf STA $bf98,y ; (bigfont + 125)
43bc : d0 f8 __ BNE $43b6 ; (vdcwin_printwrap.l1012 + 0)
43be : 4c fd 42 JMP $42fd ; (vdcwin_printwrap.s1013 + 0)
.s6:
43c1 : ad fc bf LDA $bffc ; (sstack + 5)
43c4 : 85 49 __ STA T9 + 0 
43c6 : ad fd bf LDA $bffd ; (sstack + 6)
43c9 : 85 4a __ STA T9 + 1 
43cb : a4 55 __ LDY T3 + 0 
43cd : b1 49 __ LDA (T9 + 0),y 
43cf : a6 45 __ LDX T6 + 0 
43d1 : 9d 98 bf STA $bf98,x ; (bigfont + 125)
43d4 : c9 20 __ CMP #$20
43d6 : d0 06 __ BNE $43de ; (vdcwin_printwrap.s10 + 0)
.s16:
43d8 : a9 00 __ LDA #$00
43da : 85 44 __ STA T5 + 1 
43dc : f0 08 __ BEQ $43e6 ; (vdcwin_printwrap.s53 + 0)
.s10:
43de : 24 57 __ BIT T4 + 1 
43e0 : 10 04 __ BPL $43e6 ; (vdcwin_printwrap.s53 + 0)
.s13:
43e2 : a9 00 __ LDA #$00
43e4 : 85 57 __ STA T4 + 1 
.s53:
43e6 : e6 55 __ INC T3 + 0 
43e8 : e6 45 __ INC T6 + 0 
43ea : 4c ad 42 JMP $42ad ; (vdcwin_printwrap.l4 + 0)
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
43ed : a5 53 __ LDA T0 + 0 
43ef : 8d f3 bf STA $bff3 ; (buffer + 12)
43f2 : a5 54 __ LDA T0 + 1 
43f4 : 8d f4 bf STA $bff4 ; (buffer + 13)
43f7 : a5 55 __ LDA T1 + 0 
43f9 : 8d f5 bf STA $bff5 ; (buffer + 14)
43fc : 38 __ __ SEC
43fd : a5 23 __ LDA SP + 0 
43ff : e9 06 __ SBC #$06
4401 : 85 23 __ STA SP + 0 
4403 : b0 02 __ BCS $4407 ; (vdcwin_printline.s0 + 0)
4405 : c6 24 __ DEC SP + 1 
.s0:
4407 : a0 08 __ LDY #$08
4409 : b1 23 __ LDA (SP + 0),y 
440b : 85 53 __ STA T0 + 0 
440d : a0 02 __ LDY #$02
440f : 91 23 __ STA (SP + 0),y 
4411 : a0 09 __ LDY #$09
4413 : b1 23 __ LDA (SP + 0),y 
4415 : 85 54 __ STA T0 + 1 
4417 : a0 03 __ LDY #$03
4419 : 91 23 __ STA (SP + 0),y 
441b : a0 0a __ LDY #$0a
441d : b1 23 __ LDA (SP + 0),y 
441f : a0 04 __ LDY #$04
4421 : 91 23 __ STA (SP + 0),y 
4423 : a0 0b __ LDY #$0b
4425 : b1 23 __ LDA (SP + 0),y 
4427 : a0 05 __ LDY #$05
4429 : 91 23 __ STA (SP + 0),y 
442b : 20 95 44 JSR $4495 ; (vdcwin_put_string.s1000 + 0)
442e : a9 00 __ LDA #$00
4430 : a0 04 __ LDY #$04
4432 : 91 53 __ STA (T0 + 0),y 
4434 : 88 __ __ DEY
4435 : b1 53 __ LDA (T0 + 0),y 
4437 : 85 55 __ STA T1 + 0 
4439 : 38 __ __ SEC
443a : e9 01 __ SBC #$01
443c : 85 44 __ STA T3 + 0 
443e : a0 05 __ LDY #$05
4440 : b1 53 __ LDA (T0 + 0),y 
4442 : 90 0b __ BCC $444f ; (vdcwin_printline.s2 + 0)
.s1002:
4444 : aa __ __ TAX
4445 : e4 44 __ CPX T3 + 0 
4447 : b0 06 __ BCS $444f ; (vdcwin_printline.s2 + 0)
.s1:
4449 : e8 __ __ INX
444a : 8a __ __ TXA
444b : 91 53 __ STA (T0 + 0),y 
444d : 90 2b __ BCC $447a ; (vdcwin_printline.s1001 + 0)
.s2:
444f : a5 53 __ LDA T0 + 0 
4451 : 85 15 __ STA P8 
4453 : a5 54 __ LDA T0 + 1 
4455 : 85 16 __ STA P9 
4457 : 20 45 45 JSR $4545 ; (vdcwin_scroll_up.s0 + 0)
445a : a9 20 __ LDA #$20
445c : 85 11 __ STA P4 
445e : a0 00 __ LDY #$00
4460 : b1 15 __ LDA (P8),y 
4462 : 85 0f __ STA P2 ; (str + 0)
4464 : a0 02 __ LDY #$02
4466 : b1 15 __ LDA (P8),y 
4468 : 85 13 __ STA P6 
446a : 88 __ __ DEY
446b : 84 15 __ STY P8 
446d : b1 53 __ LDA (T0 + 0),y 
446f : 18 __ __ CLC
4470 : 65 55 __ ADC T1 + 0 
4472 : 38 __ __ SEC
4473 : e9 01 __ SBC #$01
4475 : 85 14 __ STA P7 
4477 : 20 9b 29 JSR $299b ; (vdc_clear.s0 + 0)
.s1001:
447a : 18 __ __ CLC
447b : a5 23 __ LDA SP + 0 
447d : 69 06 __ ADC #$06
447f : 85 23 __ STA SP + 0 
4481 : 90 02 __ BCC $4485 ; (vdcwin_printline.s1001 + 11)
4483 : e6 24 __ INC SP + 1 
4485 : ad f3 bf LDA $bff3 ; (buffer + 12)
4488 : 85 53 __ STA T0 + 0 
448a : ad f4 bf LDA $bff4 ; (buffer + 13)
448d : 85 54 __ STA T0 + 1 
448f : ad f5 bf LDA $bff5 ; (buffer + 14)
4492 : 85 55 __ STA T1 + 0 
4494 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->void
.s1000:
4495 : 38 __ __ SEC
4496 : a5 23 __ LDA SP + 0 
4498 : e9 0b __ SBC #$0b
449a : 85 23 __ STA SP + 0 
449c : b0 02 __ BCS $44a0 ; (vdcwin_put_string.s0 + 0)
449e : c6 24 __ DEC SP + 1 
.s0:
44a0 : a0 0d __ LDY #$0d
44a2 : b1 23 __ LDA (SP + 0),y 
44a4 : 85 11 __ STA P4 
44a6 : c8 __ __ INY
44a7 : b1 23 __ LDA (SP + 0),y 
44a9 : 85 12 __ STA P5 
44ab : a0 04 __ LDY #$04
44ad : b1 11 __ LDA (P4),y 
44af : 85 13 __ STA P6 
44b1 : c8 __ __ INY
44b2 : b1 11 __ LDA (P4),y 
44b4 : 85 14 __ STA P7 
44b6 : a0 0f __ LDY #$0f
44b8 : b1 23 __ LDA (SP + 0),y 
44ba : 85 15 __ STA P8 
44bc : c8 __ __ INY
44bd : b1 23 __ LDA (SP + 0),y 
44bf : 85 16 __ STA P9 
44c1 : 20 10 45 JSR $4510 ; (vdcwin_putat_string.s0 + 0)
44c4 : 18 __ __ CLC
44c5 : a5 1b __ LDA ACCU + 0 
44c7 : 65 13 __ ADC P6 
44c9 : a0 04 __ LDY #$04
44cb : 91 11 __ STA (P4),y 
44cd : a0 02 __ LDY #$02
44cf : d1 11 __ CMP (P4),y 
44d1 : 90 31 __ BCC $4504 ; (vdcwin_put_string.s1001 + 0)
.s1:
44d3 : a9 00 __ LDA #$00
44d5 : a0 04 __ LDY #$04
44d7 : 91 11 __ STA (P4),y 
44d9 : a5 14 __ LDA P7 
44db : 69 00 __ ADC #$00
44dd : c8 __ __ INY
44de : 91 11 __ STA (P4),y 
44e0 : a0 03 __ LDY #$03
44e2 : d1 11 __ CMP (P4),y 
44e4 : d0 1e __ BNE $4504 ; (vdcwin_put_string.s1001 + 0)
.s4:
44e6 : a5 14 __ LDA P7 
44e8 : a0 05 __ LDY #$05
44ea : 91 11 __ STA (P4),y 
44ec : a5 11 __ LDA P4 
44ee : a0 02 __ LDY #$02
44f0 : 91 23 __ STA (SP + 0),y 
44f2 : a5 12 __ LDA P5 
44f4 : c8 __ __ INY
44f5 : 91 23 __ STA (SP + 0),y 
44f7 : a9 fe __ LDA #$fe
44f9 : c8 __ __ INY
44fa : 91 23 __ STA (SP + 0),y 
44fc : a9 2d __ LDA #$2d
44fe : c8 __ __ INY
44ff : 91 23 __ STA (SP + 0),y 
4501 : 20 ed 43 JSR $43ed ; (vdcwin_printline.s1000 + 0)
.s1001:
4504 : 18 __ __ CLC
4505 : a5 23 __ LDA SP + 0 
4507 : 69 0b __ ADC #$0b
4509 : 85 23 __ STA SP + 0 
450b : 90 02 __ BCC $450f ; (vdcwin_put_string.s1001 + 11)
450d : e6 24 __ INC SP + 1 
450f : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_string: ; vdcwin_putat_string(struct VDCWin*,u8,u8,const u8*)->u8
.s0:
4510 : a9 00 __ LDA #$00
4512 : 85 43 __ STA T0 + 0 
4514 : f0 26 __ BEQ $453c ; (vdcwin_putat_string.l1 + 0)
.s2:
4516 : 4a __ __ LSR
4517 : 4a __ __ LSR
4518 : 4a __ __ LSR
4519 : 4a __ __ LSR
451a : 4a __ __ LSR
451b : aa __ __ TAX
451c : bd f2 67 LDA $67f2,x ; (p2smap + 0)
451f : 51 15 __ EOR (P8),y ; (str + 0)
4521 : 85 0f __ STA P2 
4523 : a5 13 __ LDA P6 ; (x + 0)
4525 : 18 __ __ CLC
4526 : a0 00 __ LDY #$00
4528 : 71 11 __ ADC (P4),y ; (win + 0)
452a : 18 __ __ CLC
452b : 65 43 __ ADC T0 + 0 
452d : 85 0d __ STA P0 
452f : a5 14 __ LDA P7 ; (y + 0)
4531 : 18 __ __ CLC
4532 : c8 __ __ INY
4533 : 71 11 __ ADC (P4),y ; (win + 0)
4535 : 85 0e __ STA P1 
4537 : 20 83 34 JSR $3483 ; (vdc_printc@proxy + 0)
453a : e6 43 __ INC T0 + 0 
.l1:
453c : a4 43 __ LDY T0 + 0 
453e : b1 15 __ LDA (P8),y ; (str + 0)
4540 : d0 d4 __ BNE $4516 ; (vdcwin_putat_string.s2 + 0)
.s3:
4542 : 84 1b __ STY ACCU + 0 
.s1001:
4544 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_up: ; vdcwin_scroll_up(struct VDCWin*,u8)->void
.s0:
4545 : a9 00 __ LDA #$00
4547 : 85 46 __ STA T0 + 0 
4549 : a0 02 __ LDY #$02
454b : b1 15 __ LDA (P8),y ; (win + 0)
454d : 85 47 __ STA T2 + 0 
454f : a0 06 __ LDY #$06
4551 : b1 15 __ LDA (P8),y ; (win + 0)
4553 : 85 48 __ STA T3 + 0 
4555 : c8 __ __ INY
4556 : b1 15 __ LDA (P8),y ; (win + 0)
4558 : 85 49 __ STA T3 + 1 
455a : c8 __ __ INY
455b : b1 15 __ LDA (P8),y ; (win + 0)
455d : 85 4a __ STA T4 + 0 
455f : c8 __ __ INY
4560 : b1 15 __ LDA (P8),y ; (win + 0)
4562 : 85 4b __ STA T4 + 1 
4564 : ad 76 6c LDA $6c76 ; (vdc_state + 3)
4567 : 85 4c __ STA T5 + 0 
4569 : ad 77 6c LDA $6c77 ; (vdc_state + 4)
456c : 85 4d __ STA T5 + 1 
456e : 4c b9 45 JMP $45b9 ; (vdcwin_scroll_up.l1 + 0)
.s2:
4571 : a5 48 __ LDA T3 + 0 
4573 : 85 0f __ STA P2 
4575 : 18 __ __ CLC
4576 : 65 4c __ ADC T5 + 0 
4578 : 85 11 __ STA P4 
457a : a5 49 __ LDA T3 + 1 
457c : 85 10 __ STA P3 
457e : 65 4d __ ADC T5 + 1 
4580 : 85 12 __ STA P5 
4582 : 20 c9 45 JSR $45c9 ; (vdc_block_copy@proxy + 0)
4585 : a5 4a __ LDA T4 + 0 
4587 : 85 0f __ STA P2 
4589 : 18 __ __ CLC
458a : 65 4c __ ADC T5 + 0 
458c : 85 11 __ STA P4 
458e : a5 4b __ LDA T4 + 1 
4590 : 85 10 __ STA P3 
4592 : 65 4d __ ADC T5 + 1 
4594 : 85 12 __ STA P5 
4596 : 20 d1 45 JSR $45d1 ; (vdc_block_copy.s0 + 0)
4599 : ad 76 6c LDA $6c76 ; (vdc_state + 3)
459c : 18 __ __ CLC
459d : 65 48 __ ADC T3 + 0 
459f : 85 48 __ STA T3 + 0 
45a1 : ad 77 6c LDA $6c77 ; (vdc_state + 4)
45a4 : 65 49 __ ADC T3 + 1 
45a6 : 85 49 __ STA T3 + 1 
45a8 : 18 __ __ CLC
45a9 : a5 4a __ LDA T4 + 0 
45ab : 6d 76 6c ADC $6c76 ; (vdc_state + 3)
45ae : 85 4a __ STA T4 + 0 
45b0 : a5 4b __ LDA T4 + 1 
45b2 : 6d 77 6c ADC $6c77 ; (vdc_state + 4)
45b5 : 85 4b __ STA T4 + 1 
45b7 : e6 46 __ INC T0 + 0 
.l1:
45b9 : a0 03 __ LDY #$03
45bb : b1 15 __ LDA (P8),y ; (win + 0)
45bd : 38 __ __ SEC
45be : e9 01 __ SBC #$01
45c0 : 90 af __ BCC $4571 ; (vdcwin_scroll_up.s2 + 0)
.s1002:
45c2 : c5 46 __ CMP T0 + 0 
45c4 : 90 02 __ BCC $45c8 ; (vdcwin_scroll_up.s1001 + 0)
.s1004:
45c6 : d0 a9 __ BNE $4571 ; (vdcwin_scroll_up.s2 + 0)
.s1001:
45c8 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
45c9 : a5 47 __ LDA $47 
45cb : 85 13 __ STA P6 
45cd : a9 00 __ LDA #$00
45cf : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_block_copy: ; vdc_block_copy(u16,u16,u16)->void
.s0:
45d1 : a5 14 __ LDA P7 ; (length + 1)
45d3 : d0 50 __ BNE $4625 ; (vdc_block_copy.s73 + 0)
.s4:
45d5 : 20 68 2a JSR $2a68 ; (vdc_mem_addr@proxy + 0)
45d8 : a2 18 __ LDX #$18
45da : 8e 00 d6 STX $d600 
.l332:
45dd : 2c 00 d6 BIT $d600 
45e0 : 10 fb __ BPL $45dd ; (vdc_block_copy.l332 + 0)
.s40:
45e2 : ad 01 d6 LDA $d601 
45e5 : 09 80 __ ORA #$80
45e7 : 8e 00 d6 STX $d600 
.l334:
45ea : 2c 00 d6 BIT $d600 
45ed : 10 fb __ BPL $45ea ; (vdc_block_copy.l334 + 0)
.s46:
45ef : 8d 01 d6 STA $d601 
45f2 : a9 20 __ LDA #$20
45f4 : 8d 00 d6 STA $d600 
.l336:
45f7 : 2c 00 d6 BIT $d600 
45fa : 10 fb __ BPL $45f7 ; (vdc_block_copy.l336 + 0)
.s51:
45fc : a5 12 __ LDA P5 ; (src + 1)
45fe : 8d 01 d6 STA $d601 
4601 : a9 21 __ LDA #$21
4603 : 8d 00 d6 STA $d600 
.l338:
4606 : 2c 00 d6 BIT $d600 
4609 : 10 fb __ BPL $4606 ; (vdc_block_copy.l338 + 0)
.s56:
460b : a5 11 __ LDA P4 ; (src + 0)
460d : 8d 01 d6 STA $d601 
4610 : a9 1f __ LDA #$1f
4612 : 8d 00 d6 STA $d600 
4615 : a9 1e __ LDA #$1e
4617 : 8d 00 d6 STA $d600 
.l340:
461a : 2c 00 d6 BIT $d600 
461d : 10 fb __ BPL $461a ; (vdc_block_copy.l340 + 0)
.s62:
461f : a5 13 __ LDA P6 ; (length + 0)
4621 : 8d 01 d6 STA $d601 
.s1001:
4624 : 60 __ __ RTS
.s73:
4625 : 85 45 __ STA T2 + 0 
4627 : a5 10 __ LDA P3 ; (dest + 1)
4629 : 85 44 __ STA T0 + 1 
462b : a5 0f __ LDA P2 ; (dest + 0)
462d : 85 0d __ STA P0 
.l2:
462f : a5 44 __ LDA T0 + 1 
4631 : 85 0e __ STA P1 
4633 : 20 70 2a JSR $2a70 ; (vdc_mem_addr.s0 + 0)
4636 : a2 18 __ LDX #$18
4638 : 8e 00 d6 STX $d600 
.l321:
463b : 2c 00 d6 BIT $d600 
463e : 10 fb __ BPL $463b ; (vdc_block_copy.l321 + 0)
.s11:
4640 : ad 01 d6 LDA $d601 
4643 : 09 80 __ ORA #$80
4645 : 8e 00 d6 STX $d600 
.l323:
4648 : 2c 00 d6 BIT $d600 
464b : 10 fb __ BPL $4648 ; (vdc_block_copy.l323 + 0)
.s17:
464d : 8d 01 d6 STA $d601 
4650 : a9 20 __ LDA #$20
4652 : 8d 00 d6 STA $d600 
.l325:
4655 : 2c 00 d6 BIT $d600 
4658 : 10 fb __ BPL $4655 ; (vdc_block_copy.l325 + 0)
.s22:
465a : a5 12 __ LDA P5 ; (src + 1)
465c : 8d 01 d6 STA $d601 
465f : a9 21 __ LDA #$21
4661 : 8d 00 d6 STA $d600 
.l327:
4664 : 2c 00 d6 BIT $d600 
4667 : 10 fb __ BPL $4664 ; (vdc_block_copy.l327 + 0)
.s27:
4669 : a5 11 __ LDA P4 ; (src + 0)
466b : 8d 01 d6 STA $d601 
466e : a9 1f __ LDA #$1f
4670 : 8d 00 d6 STA $d600 
4673 : a9 1e __ LDA #$1e
4675 : 8d 00 d6 STA $d600 
.l329:
4678 : 2c 00 d6 BIT $d600 
467b : 10 fb __ BPL $4678 ; (vdc_block_copy.l329 + 0)
.s33:
467d : e6 12 __ INC P5 ; (src + 1)
467f : a9 ff __ LDA #$ff
4681 : 8d 01 d6 STA $d601 
4684 : e6 44 __ INC T0 + 1 
4686 : c6 45 __ DEC T2 + 0 
4688 : d0 a5 __ BNE $462f ; (vdc_block_copy.l2 + 0)
.s145:
468a : a5 0d __ LDA P0 
468c : 85 0f __ STA P2 ; (dest + 0)
468e : a5 44 __ LDA T0 + 1 
4690 : 85 10 __ STA P3 ; (dest + 1)
4692 : 4c d5 45 JMP $45d5 ; (vdc_block_copy.s4 + 0)
--------------------------------------------------------------------
vdcwin_put_chars: ; vdcwin_put_chars(struct VDCWin*,const u8*,u8)->void
.s1000:
4695 : a2 05 __ LDX #$05
4697 : b5 53 __ LDA T1 + 0,x 
4699 : 9d e9 bf STA $bfe9,x ; (vp_fill + 24)
469c : ca __ __ DEX
469d : 10 f8 __ BPL $4697 ; (vdcwin_put_chars.s1000 + 2)
469f : 38 __ __ SEC
46a0 : a5 23 __ LDA SP + 0 
46a2 : e9 06 __ SBC #$06
46a4 : 85 23 __ STA SP + 0 
46a6 : b0 02 __ BCS $46aa ; (vdcwin_put_chars.s0 + 0)
46a8 : c6 24 __ DEC SP + 1 
.s0:
46aa : ad f9 bf LDA $bff9 ; (sstack + 2)
46ad : f0 4a __ BEQ $46f9 ; (vdcwin_put_chars.s1 + 0)
.s14:
46af : 85 53 __ STA T1 + 0 
46b1 : a0 05 __ LDY #$05
46b3 : b1 17 __ LDA (P10),y ; (win + 0)
46b5 : 85 55 __ STA T3 + 0 
46b7 : 88 __ __ DEY
46b8 : b1 17 __ LDA (P10),y ; (win + 0)
46ba : 85 56 __ STA T4 + 0 
46bc : ad f7 bf LDA $bff7 ; (sstack + 0)
46bf : 85 57 __ STA T5 + 0 
46c1 : ad f8 bf LDA $bff8 ; (sstack + 1)
46c4 : 85 58 __ STA T5 + 1 
46c6 : a0 00 __ LDY #$00
.l1008:
46c8 : 84 54 __ STY T2 + 0 
46ca : b1 57 __ LDA (T5 + 0),y 
46cc : 4a __ __ LSR
46cd : 4a __ __ LSR
46ce : 4a __ __ LSR
46cf : 4a __ __ LSR
46d0 : 4a __ __ LSR
46d1 : aa __ __ TAX
46d2 : bd f2 67 LDA $67f2,x ; (p2smap + 0)
46d5 : 51 57 __ EOR (T5 + 0),y 
46d7 : 85 0f __ STA P2 
46d9 : a0 00 __ LDY #$00
46db : b1 17 __ LDA (P10),y ; (win + 0)
46dd : 18 __ __ CLC
46de : 65 56 __ ADC T4 + 0 
46e0 : 18 __ __ CLC
46e1 : 65 54 __ ADC T2 + 0 
46e3 : 85 0d __ STA P0 
46e5 : c8 __ __ INY
46e6 : b1 17 __ LDA (P10),y ; (win + 0)
46e8 : 18 __ __ CLC
46e9 : 65 55 __ ADC T3 + 0 
46eb : 85 0e __ STA P1 
46ed : 20 83 34 JSR $3483 ; (vdc_printc@proxy + 0)
46f0 : a4 54 __ LDY T2 + 0 
46f2 : c8 __ __ INY
46f3 : c4 53 __ CPY T1 + 0 
46f5 : 90 d1 __ BCC $46c8 ; (vdcwin_put_chars.l1008 + 0)
.s1010:
46f7 : a5 53 __ LDA T1 + 0 
.s1:
46f9 : 18 __ __ CLC
46fa : a0 04 __ LDY #$04
46fc : 71 17 __ ADC (P10),y ; (win + 0)
46fe : 91 17 __ STA (P10),y ; (win + 0)
4700 : a0 02 __ LDY #$02
4702 : d1 17 __ CMP (P10),y ; (win + 0)
4704 : 90 32 __ BCC $4738 ; (vdcwin_put_chars.s1001 + 0)
.s8:
4706 : a9 00 __ LDA #$00
4708 : a0 04 __ LDY #$04
470a : 91 17 __ STA (P10),y ; (win + 0)
470c : c8 __ __ INY
470d : b1 17 __ LDA (P10),y ; (win + 0)
470f : aa __ __ TAX
4710 : 18 __ __ CLC
4711 : 69 01 __ ADC #$01
4713 : 91 17 __ STA (P10),y ; (win + 0)
4715 : a0 03 __ LDY #$03
4717 : d1 17 __ CMP (P10),y ; (win + 0)
4719 : d0 1d __ BNE $4738 ; (vdcwin_put_chars.s1001 + 0)
.s11:
471b : 8a __ __ TXA
471c : a0 05 __ LDY #$05
471e : 91 17 __ STA (P10),y ; (win + 0)
4720 : a5 17 __ LDA P10 ; (win + 0)
4722 : a0 02 __ LDY #$02
4724 : 91 23 __ STA (SP + 0),y 
4726 : a5 18 __ LDA P11 ; (win + 1)
4728 : c8 __ __ INY
4729 : 91 23 __ STA (SP + 0),y 
472b : a9 fe __ LDA #$fe
472d : c8 __ __ INY
472e : 91 23 __ STA (SP + 0),y 
4730 : a9 2d __ LDA #$2d
4732 : c8 __ __ INY
4733 : 91 23 __ STA (SP + 0),y 
4735 : 20 ed 43 JSR $43ed ; (vdcwin_printline.s1000 + 0)
.s1001:
4738 : 18 __ __ CLC
4739 : a5 23 __ LDA SP + 0 
473b : 69 06 __ ADC #$06
473d : 85 23 __ STA SP + 0 
473f : 90 02 __ BCC $4743 ; (vdcwin_put_chars.s1001 + 11)
4741 : e6 24 __ INC SP + 1 
4743 : a2 05 __ LDX #$05
4745 : bd e9 bf LDA $bfe9,x ; (vp_fill + 24)
4748 : 95 53 __ STA T1 + 0,x 
474a : ca __ __ DEX
474b : 10 f8 __ BPL $4745 ; (vdcwin_put_chars.s1001 + 13)
474d : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_char: ; vdcwin_put_char(struct VDCWin*,u8)->void
.s1000:
474e : a5 53 __ LDA T0 + 0 
4750 : 8d ef bf STA $bfef ; (vp_fill + 30)
4753 : a5 54 __ LDA T2 + 0 
4755 : 8d f0 bf STA $bff0 ; (vp_fill + 31)
4758 : 38 __ __ SEC
4759 : a5 23 __ LDA SP + 0 
475b : e9 06 __ SBC #$06
475d : 85 23 __ STA SP + 0 
475f : b0 02 __ BCS $4763 ; (vdcwin_put_char.s0 + 0)
4761 : c6 24 __ DEC SP + 1 
.s0:
4763 : ad f7 bf LDA $bff7 ; (sstack + 0)
4766 : 4a __ __ LSR
4767 : 4a __ __ LSR
4768 : 4a __ __ LSR
4769 : 4a __ __ LSR
476a : 4a __ __ LSR
476b : aa __ __ TAX
476c : bd f2 67 LDA $67f2,x ; (p2smap + 0)
476f : 4d f7 bf EOR $bff7 ; (sstack + 0)
4772 : 85 0f __ STA P2 
4774 : a0 04 __ LDY #$04
4776 : b1 17 __ LDA (P10),y ; (win + 0)
4778 : 85 53 __ STA T0 + 0 
477a : 18 __ __ CLC
477b : a0 00 __ LDY #$00
477d : 71 17 __ ADC (P10),y ; (win + 0)
477f : 85 0d __ STA P0 
4781 : a0 05 __ LDY #$05
4783 : b1 17 __ LDA (P10),y ; (win + 0)
4785 : 85 54 __ STA T2 + 0 
4787 : 18 __ __ CLC
4788 : a0 01 __ LDY #$01
478a : 71 17 __ ADC (P10),y ; (win + 0)
478c : 85 0e __ STA P1 
478e : 20 83 34 JSR $3483 ; (vdc_printc@proxy + 0)
4791 : a6 53 __ LDX T0 + 0 
4793 : e8 __ __ INX
4794 : 8a __ __ TXA
4795 : a0 04 __ LDY #$04
4797 : 91 17 __ STA (P10),y ; (win + 0)
4799 : a0 02 __ LDY #$02
479b : d1 17 __ CMP (P10),y ; (win + 0)
479d : d0 32 __ BNE $47d1 ; (vdcwin_put_char.s1001 + 0)
.s4:
479f : a9 00 __ LDA #$00
47a1 : a0 04 __ LDY #$04
47a3 : 91 17 __ STA (P10),y ; (win + 0)
47a5 : 18 __ __ CLC
47a6 : a5 54 __ LDA T2 + 0 
47a8 : 69 01 __ ADC #$01
47aa : c8 __ __ INY
47ab : 91 17 __ STA (P10),y ; (win + 0)
47ad : a0 03 __ LDY #$03
47af : d1 17 __ CMP (P10),y ; (win + 0)
47b1 : d0 1e __ BNE $47d1 ; (vdcwin_put_char.s1001 + 0)
.s7:
47b3 : a5 54 __ LDA T2 + 0 
47b5 : a0 05 __ LDY #$05
47b7 : 91 17 __ STA (P10),y ; (win + 0)
47b9 : a5 17 __ LDA P10 ; (win + 0)
47bb : a0 02 __ LDY #$02
47bd : 91 23 __ STA (SP + 0),y 
47bf : a5 18 __ LDA P11 ; (win + 1)
47c1 : c8 __ __ INY
47c2 : 91 23 __ STA (SP + 0),y 
47c4 : a9 fe __ LDA #$fe
47c6 : c8 __ __ INY
47c7 : 91 23 __ STA (SP + 0),y 
47c9 : a9 2d __ LDA #$2d
47cb : c8 __ __ INY
47cc : 91 23 __ STA (SP + 0),y 
47ce : 20 ed 43 JSR $43ed ; (vdcwin_printline.s1000 + 0)
.s1001:
47d1 : 18 __ __ CLC
47d2 : a5 23 __ LDA SP + 0 
47d4 : 69 06 __ ADC #$06
47d6 : 85 23 __ STA SP + 0 
47d8 : 90 02 __ BCC $47dc ; (vdcwin_put_char.s1001 + 11)
47da : e6 24 __ INC SP + 1 
47dc : ad ef bf LDA $bfef ; (vp_fill + 30)
47df : 85 53 __ STA T0 + 0 
47e1 : ad f0 bf LDA $bff0 ; (vp_fill + 31)
47e4 : 85 54 __ STA T2 + 0 
47e6 : 60 __ __ RTS
--------------------------------------------------------------------
windows_textinput: ; windows_textinput()->void
.s1000:
47e7 : a2 04 __ LDX #$04
47e9 : b5 53 __ LDA T0 + 0,x 
47eb : 9d 8a bf STA $bf8a,x ; (bigfont + 111)
47ee : ca __ __ DEX
47ef : 10 f8 __ BPL $47e9 ; (windows_textinput.s1000 + 2)
47f1 : 38 __ __ SEC
47f2 : a5 23 __ LDA SP + 0 
47f4 : e9 06 __ SBC #$06
47f6 : 85 23 __ STA SP + 0 
47f8 : b0 02 __ BCS $47fc ; (windows_textinput.s0 + 0)
47fa : c6 24 __ DEC SP + 1 
.s0:
47fc : a9 f0 __ LDA #$f0
47fe : 85 17 __ STA P10 
4800 : a9 3c __ LDA #$3c
4802 : 8d f8 bf STA $bff8 ; (sstack + 1)
4805 : a9 05 __ LDA #$05
4807 : 85 18 __ STA P11 
4809 : a9 0c __ LDA #$0c
480b : 8d f9 bf STA $bff9 ; (sstack + 2)
480e : a9 fb __ LDA #$fb
4810 : 85 1b __ STA ACCU + 0 
4812 : a9 00 __ LDA #$00
4814 : 85 1c __ STA ACCU + 1 
4816 : 20 12 65 JSR $6512 ; (malloc + 0)
4819 : a5 1b __ LDA ACCU + 0 
481b : 85 53 __ STA T0 + 0 
481d : a5 1c __ LDA ACCU + 1 
481f : 85 54 __ STA T0 + 1 
4821 : ad 78 6c LDA $6c78 ; (vdc_state + 5)
4824 : 85 55 __ STA T1 + 0 
4826 : ad 79 6c LDA $6c79 ; (vdc_state + 6)
4829 : 4a __ __ LSR
482a : 66 55 __ ROR T1 + 0 
482c : 38 __ __ SEC
482d : a5 55 __ LDA T1 + 0 
482f : e9 06 __ SBC #$06
4831 : 8d f7 bf STA $bff7 ; (sstack + 0)
4834 : 20 39 30 JSR $3039 ; (vdcwin_win_new.s1000 + 0)
4837 : ad 60 6c LDA $6c60 ; (winCfg + 5)
483a : 85 1b __ STA ACCU + 0 
483c : a9 01 __ LDA #$01
483e : 85 14 __ STA P7 
4840 : a9 00 __ LDA #$00
4842 : 85 13 __ STA P6 
4844 : 85 1c __ STA ACCU + 1 
4846 : a9 0d __ LDA #$0d
4848 : 20 46 63 JSR $6346 ; (mul16by8 + 0)
484b : 18 __ __ CLC
484c : a9 b9 __ LDA #$b9
484e : 65 05 __ ADC WORK + 2 
4850 : 85 11 __ STA P4 
4852 : a9 6d __ LDA #$6d
4854 : 69 00 __ ADC #$00
4856 : 85 12 __ STA P5 
4858 : a9 c1 __ LDA #$c1
485a : 85 15 __ STA P8 
485c : a9 49 __ LDA #$49
485e : 85 16 __ STA P9 
4860 : 20 10 45 JSR $4510 ; (vdcwin_putat_string.s0 + 0)
4863 : a9 0a __ LDA #$0a
4865 : 85 18 __ STA P11 
4867 : a9 32 __ LDA #$32
4869 : 8d f8 bf STA $bff8 ; (sstack + 1)
486c : a9 05 __ LDA #$05
486e : 8d f9 bf STA $bff9 ; (sstack + 2)
4871 : 38 __ __ SEC
4872 : a5 55 __ LDA T1 + 0 
4874 : e9 03 __ SBC #$03
4876 : 8d f7 bf STA $bff7 ; (sstack + 0)
4879 : 20 39 30 JSR $3039 ; (vdcwin_win_new.s1000 + 0)
487c : ad 60 6c LDA $6c60 ; (winCfg + 5)
487f : 85 1b __ STA ACCU + 0 
4881 : a9 00 __ LDA #$00
4883 : 85 1c __ STA ACCU + 1 
4885 : a9 0d __ LDA #$0d
4887 : 20 46 63 JSR $6346 ; (mul16by8 + 0)
488a : 18 __ __ CLC
488b : a9 b9 __ LDA #$b9
488d : 65 05 __ ADC WORK + 2 
488f : 8d f8 bf STA $bff8 ; (sstack + 1)
4892 : a9 6d __ LDA #$6d
4894 : 69 00 __ ADC #$00
4896 : 8d f9 bf STA $bff9 ; (sstack + 2)
4899 : 20 ef 49 JSR $49ef ; (vdcwin_edit.s1000 + 0)
489c : a5 53 __ LDA T0 + 0 
489e : 85 12 __ STA P5 
48a0 : a5 54 __ LDA T0 + 1 
48a2 : 85 13 __ STA P6 
48a4 : ad 60 6c LDA $6c60 ; (winCfg + 5)
48a7 : 85 1b __ STA ACCU + 0 
48a9 : a9 00 __ LDA #$00
48ab : 85 1c __ STA ACCU + 1 
48ad : a9 0d __ LDA #$0d
48af : 20 46 63 JSR $6346 ; (mul16by8 + 0)
48b2 : 18 __ __ CLC
48b3 : a9 b9 __ LDA #$b9
48b5 : 65 05 __ ADC WORK + 2 
48b7 : 85 10 __ STA P3 
48b9 : a9 6d __ LDA #$6d
48bb : 69 00 __ ADC #$00
48bd : 85 11 __ STA P4 
48bf : 20 d1 50 JSR $50d1 ; (vdcwin_get_rect.s0 + 0)
48c2 : 20 3a 35 JSR $353a ; (vdcwin_win_free.s0 + 0)
48c5 : a9 20 __ LDA #$20
48c7 : 85 11 __ STA P4 
48c9 : ae 60 6c LDX $6c60 ; (winCfg + 5)
48cc : bd 70 66 LDA $6670,x ; (__multab13L + 0)
48cf : 85 55 __ STA T1 + 0 
48d1 : 18 __ __ CLC
48d2 : 69 b9 __ ADC #$b9
48d4 : 85 56 __ STA T2 + 0 
48d6 : a9 6d __ LDA #$6d
48d8 : 69 00 __ ADC #$00
48da : 85 57 __ STA T2 + 1 
48dc : bc 70 66 LDY $6670,x ; (__multab13L + 0)
48df : b9 b9 6d LDA $6db9,y 
48e2 : 85 0f __ STA P2 
48e4 : a6 55 __ LDX T1 + 0 
48e6 : bd ba 6d LDA $6dba,x 
48e9 : 85 14 __ STA P7 
48eb : bd bb 6d LDA $6dbb,x 
48ee : 85 13 __ STA P6 
48f0 : bd bc 6d LDA $6dbc,x 
48f3 : 85 15 __ STA P8 
48f5 : 20 9b 29 JSR $299b ; (vdc_clear.s0 + 0)
48f8 : a5 56 __ LDA T2 + 0 
48fa : 85 11 __ STA P4 
48fc : a5 57 __ LDA T2 + 1 
48fe : 85 12 __ STA P5 
4900 : a9 00 __ LDA #$00
4902 : 85 13 __ STA P6 
4904 : a9 51 __ LDA #$51
4906 : 85 16 __ STA P9 
4908 : a9 01 __ LDA #$01
490a : 85 14 __ STA P7 
490c : a9 60 __ LDA #$60
490e : 85 15 __ STA P8 
4910 : 20 10 45 JSR $4510 ; (vdcwin_putat_string.s0 + 0)
4913 : a5 11 __ LDA P4 
4915 : 8d fa bf STA $bffa ; (sstack + 3)
4918 : a5 12 __ LDA P5 
491a : 8d fb bf STA $bffb ; (sstack + 4)
491d : a5 53 __ LDA T0 + 0 
491f : 8d fc bf STA $bffc ; (sstack + 5)
4922 : a5 54 __ LDA T0 + 1 
4924 : 8d fd bf STA $bffd ; (sstack + 6)
4927 : a9 00 __ LDA #$00
4929 : a6 55 __ LDX T1 + 0 
492b : 9d bd 6d STA $6dbd,x 
492e : a9 03 __ LDA #$03
4930 : 9d be 6d STA $6dbe,x 
4933 : 20 69 42 JSR $4269 ; (vdcwin_printwrap.s1000 + 0)
4936 : ad 60 6c LDA $6c60 ; (winCfg + 5)
4939 : 85 1b __ STA ACCU + 0 
493b : a9 00 __ LDA #$00
493d : 85 1c __ STA ACCU + 1 
493f : a9 0d __ LDA #$0d
4941 : 20 46 63 JSR $6346 ; (mul16by8 + 0)
4944 : 18 __ __ CLC
4945 : a9 b9 __ LDA #$b9
4947 : 65 05 __ ADC WORK + 2 
4949 : a0 02 __ LDY #$02
494b : 91 23 __ STA (SP + 0),y 
494d : a9 6d __ LDA #$6d
494f : 69 00 __ ADC #$00
4951 : c8 __ __ INY
4952 : 91 23 __ STA (SP + 0),y 
4954 : a9 fe __ LDA #$fe
4956 : c8 __ __ INY
4957 : 91 23 __ STA (SP + 0),y 
4959 : a9 2d __ LDA #$2d
495b : c8 __ __ INY
495c : 91 23 __ STA (SP + 0),y 
495e : 20 ed 43 JSR $43ed ; (vdcwin_printline.s1000 + 0)
4961 : ae 60 6c LDX $6c60 ; (winCfg + 5)
4964 : bd 70 66 LDA $6670,x ; (__multab13L + 0)
4967 : 18 __ __ CLC
4968 : 69 b9 __ ADC #$b9
496a : a0 02 __ LDY #$02
496c : 91 23 __ STA (SP + 0),y 
496e : a9 6d __ LDA #$6d
4970 : 69 00 __ ADC #$00
4972 : c8 __ __ INY
4973 : 91 23 __ STA (SP + 0),y 
4975 : a9 21 __ LDA #$21
4977 : c8 __ __ INY
4978 : 91 23 __ STA (SP + 0),y 
497a : a9 35 __ LDA #$35
497c : c8 __ __ INY
497d : 91 23 __ STA (SP + 0),y 
497f : bc 70 66 LDY $6670,x ; (__multab13L + 0)
4982 : b9 be 6d LDA $6dbe,y 
4985 : 18 __ __ CLC
4986 : 69 01 __ ADC #$01
4988 : b0 0d __ BCS $4997 ; (windows_textinput.s4 + 0)
.s1002:
498a : d9 bc 6d CMP $6dbc,y 
498d : b0 08 __ BCS $4997 ; (windows_textinput.s4 + 0)
.s5:
498f : be be 6d LDX $6dbe,y 
4992 : e8 __ __ INX
4993 : 8a __ __ TXA
4994 : 99 be 6d STA $6dbe,y 
.s4:
4997 : 20 95 44 JSR $4495 ; (vdcwin_put_string.s1000 + 0)
499a : 20 bf 2a JSR $2abf ; (getch.s0 + 0)
499d : 20 3a 35 JSR $353a ; (vdcwin_win_free.s0 + 0)
49a0 : a5 53 __ LDA T0 + 0 
49a2 : 85 1b __ STA ACCU + 0 
49a4 : a5 54 __ LDA T0 + 1 
49a6 : 85 1c __ STA ACCU + 1 
49a8 : 20 d1 65 JSR $65d1 ; (free + 0)
.s1001:
49ab : 18 __ __ CLC
49ac : a5 23 __ LDA SP + 0 
49ae : 69 06 __ ADC #$06
49b0 : 85 23 __ STA SP + 0 
49b2 : 90 02 __ BCC $49b6 ; (windows_textinput.s1001 + 11)
49b4 : e6 24 __ INC SP + 1 
49b6 : a2 04 __ LDX #$04
49b8 : bd 8a bf LDA $bf8a,x ; (bigfont + 111)
49bb : 95 53 __ STA T0 + 0,x 
49bd : ca __ __ DEX
49be : 10 f8 __ BPL $49b8 ; (windows_textinput.s1001 + 13)
49c0 : 60 __ __ RTS
--------------------------------------------------------------------
49c1 : __ __ __ BYT 74 52 59 20 54 45 58 54 20 45 4e 54 52 59 20 49 : tRY TEXT ENTRY I
49d1 : __ __ __ BYT 4e 20 57 49 4e 44 4f 57 2c 20 41 43 43 45 50 54 : N WINDOW, ACCEPT
49e1 : __ __ __ BYT 20 57 49 54 48 20 72 65 74 75 72 6e 2e 00       :  WITH return..
--------------------------------------------------------------------
vdcwin_edit: ; vdcwin_edit(struct VDCWin*)->void
.s1000:
49ef : a5 53 __ LDA T0 + 0 
49f1 : 8d eb bf STA $bfeb ; (vp_fill + 26)
49f4 : a5 54 __ LDA T0 + 1 
49f6 : 8d ec bf STA $bfec ; (vp_fill + 27)
49f9 : a5 55 __ LDA T1 + 0 
49fb : 8d ed bf STA $bfed ; (vp_fill + 28)
.s0:
49fe : ad f8 bf LDA $bff8 ; (sstack + 1)
4a01 : 85 53 __ STA T0 + 0 
4a03 : ad f9 bf LDA $bff9 ; (sstack + 2)
4a06 : 85 54 __ STA T0 + 1 
.l2:
4a08 : a5 53 __ LDA T0 + 0 
4a0a : 85 0d __ STA P0 
4a0c : a5 54 __ LDA T0 + 1 
4a0e : 85 0e __ STA P1 
4a10 : a9 01 __ LDA #$01
4a12 : 85 0f __ STA P2 
4a14 : 20 5b 4b JSR $4b5b ; (vdcwin_cursor_show.s0 + 0)
4a17 : c6 0f __ DEC P2 
4a19 : 20 2c 35 JSR $352c ; (vdcwin_getch.s0 + 0)
4a1c : a5 1b __ LDA ACCU + 0 ; (win + 1)
4a1e : 85 55 __ STA T1 + 0 
4a20 : 20 5b 4b JSR $4b5b ; (vdcwin_cursor_show.s0 + 0)
4a23 : a5 55 __ LDA T1 + 0 
4a25 : c9 14 __ CMP #$14
4a27 : d0 15 __ BNE $4a3e ; (vdcwin_edit.s57 + 0)
.s41:
4a29 : 20 04 4c JSR $4c04 ; (vdcwin_cursor_backward.s0 + 0)
4a2c : 09 00 __ ORA #$00
4a2e : f0 d8 __ BEQ $4a08 ; (vdcwin_edit.l2 + 0)
.s42:
4a30 : a5 0d __ LDA P0 
4a32 : 85 15 __ STA P8 
4a34 : a5 0e __ LDA P1 
4a36 : 85 16 __ STA P9 
4a38 : 20 29 4c JSR $4c29 ; (vdcwin_delete_char.s0 + 0)
4a3b : 4c 08 4a JMP $4a08 ; (vdcwin_edit.l2 + 0)
.s57:
4a3e : b0 03 __ BCS $4a43 ; (vdcwin_edit.s58 + 0)
4a40 : 4c 1d 4b JMP $4b1d ; (vdcwin_edit.s59 + 0)
.s58:
4a43 : c9 93 __ CMP #$93
4a45 : d0 1f __ BNE $4a66 ; (vdcwin_edit.s66 + 0)
.s12:
4a47 : a9 20 __ LDA #$20
4a49 : 85 11 __ STA P4 
4a4b : a0 00 __ LDY #$00
4a4d : b1 0d __ LDA (P0),y 
4a4f : 85 0f __ STA P2 
4a51 : c8 __ __ INY
4a52 : b1 0d __ LDA (P0),y 
4a54 : 85 14 __ STA P7 
4a56 : c8 __ __ INY
4a57 : b1 0d __ LDA (P0),y 
4a59 : 85 13 __ STA P6 
4a5b : c8 __ __ INY
4a5c : b1 0d __ LDA (P0),y 
4a5e : 85 15 __ STA P8 
4a60 : 20 9b 29 JSR $299b ; (vdc_clear.s0 + 0)
4a63 : 4c 11 4b JMP $4b11 ; (vdcwin_edit.s93 + 0)
.s66:
4a66 : 90 58 __ BCC $4ac0 ; (vdcwin_edit.s68 + 0)
.s67:
4a68 : c9 9d __ CMP #$9d
4a6a : d0 06 __ BNE $4a72 ; (vdcwin_edit.s46 + 0)
.s40:
4a6c : 20 04 4c JSR $4c04 ; (vdcwin_cursor_backward.s0 + 0)
4a6f : 4c 08 4a JMP $4a08 ; (vdcwin_edit.l2 + 0)
.s46:
4a72 : c9 20 __ CMP #$20
4a74 : 90 92 __ BCC $4a08 ; (vdcwin_edit.l2 + 0)
.s51:
4a76 : 09 00 __ ORA #$00
4a78 : 10 04 __ BPL $4a7e ; (vdcwin_edit.s47 + 0)
.s50:
4a7a : c9 a0 __ CMP #$a0
4a7c : 90 8a __ BCC $4a08 ; (vdcwin_edit.l2 + 0)
.s47:
4a7e : a0 05 __ LDY #$05
4a80 : b1 0d __ LDA (P0),y 
4a82 : 18 __ __ CLC
4a83 : 69 01 __ ADC #$01
4a85 : b0 06 __ BCS $4a8d ; (vdcwin_edit.s55 + 0)
.s1004:
4a87 : a0 03 __ LDY #$03
4a89 : d1 0d __ CMP (P0),y 
4a8b : 90 15 __ BCC $4aa2 ; (vdcwin_edit.s52 + 0)
.s55:
4a8d : a0 04 __ LDY #$04
4a8f : b1 0d __ LDA (P0),y 
4a91 : 18 __ __ CLC
4a92 : 69 01 __ ADC #$01
4a94 : 90 03 __ BCC $4a99 ; (vdcwin_edit.s1002 + 0)
4a96 : 4c 08 4a JMP $4a08 ; (vdcwin_edit.l2 + 0)
.s1002:
4a99 : a0 02 __ LDY #$02
4a9b : d1 0d __ CMP (P0),y 
4a9d : 90 03 __ BCC $4aa2 ; (vdcwin_edit.s52 + 0)
4a9f : 4c 08 4a JMP $4a08 ; (vdcwin_edit.l2 + 0)
.s52:
4aa2 : a5 0d __ LDA P0 
4aa4 : 85 16 __ STA P9 
4aa6 : a5 0e __ LDA P1 
4aa8 : 85 17 __ STA P10 
4aaa : 20 ea 4d JSR $4dea ; (vdcwin_insert_char.s0 + 0)
4aad : a5 53 __ LDA T0 + 0 
4aaf : 85 17 __ STA P10 
4ab1 : a5 54 __ LDA T0 + 1 
4ab3 : 85 18 __ STA P11 
4ab5 : a5 55 __ LDA T1 + 0 
4ab7 : 8d f7 bf STA $bff7 ; (sstack + 0)
4aba : 20 4e 47 JSR $474e ; (vdcwin_put_char.s1000 + 0)
4abd : 4c 08 4a JMP $4a08 ; (vdcwin_edit.l2 + 0)
.s68:
4ac0 : c9 1d __ CMP #$1d
4ac2 : f0 17 __ BEQ $4adb ; (vdcwin_edit.s29 + 0)
.s69:
4ac4 : c9 91 __ CMP #$91
4ac6 : d0 aa __ BNE $4a72 ; (vdcwin_edit.s46 + 0)
.s22:
4ac8 : a0 05 __ LDY #$05
4aca : b1 0d __ LDA (P0),y 
4acc : d0 03 __ BNE $4ad1 ; (vdcwin_edit.s24 + 0)
4ace : 4c 08 4a JMP $4a08 ; (vdcwin_edit.l2 + 0)
.s24:
4ad1 : aa __ __ TAX
4ad2 : ca __ __ DEX
.s94:
4ad3 : 8a __ __ TXA
4ad4 : a0 05 __ LDY #$05
.s1042:
4ad6 : 91 0d __ STA (P0),y 
4ad8 : 4c 08 4a JMP $4a08 ; (vdcwin_edit.l2 + 0)
.s29:
4adb : a0 02 __ LDY #$02
4add : b1 0d __ LDA (P0),y 
4adf : 85 55 __ STA T1 + 0 
4ae1 : a0 04 __ LDY #$04
4ae3 : b1 0d __ LDA (P0),y 
4ae5 : aa __ __ TAX
4ae6 : 18 __ __ CLC
4ae7 : 69 01 __ ADC #$01
4ae9 : b0 08 __ BCS $4af3 ; (vdcwin_edit.s32 + 0)
.s1018:
4aeb : c5 55 __ CMP T1 + 0 
4aed : b0 04 __ BCS $4af3 ; (vdcwin_edit.s32 + 0)
.s31:
4aef : e8 __ __ INX
4af0 : 8a __ __ TXA
4af1 : 90 e3 __ BCC $4ad6 ; (vdcwin_edit.s1042 + 0)
.s32:
4af3 : a0 05 __ LDY #$05
4af5 : b1 0d __ LDA (P0),y 
4af7 : aa __ __ TAX
4af8 : 18 __ __ CLC
4af9 : 69 01 __ ADC #$01
4afb : 90 03 __ BCC $4b00 ; (vdcwin_edit.s1016 + 0)
4afd : 4c 08 4a JMP $4a08 ; (vdcwin_edit.l2 + 0)
.s1016:
4b00 : a0 03 __ LDY #$03
4b02 : d1 0d __ CMP (P0),y 
4b04 : 90 03 __ BCC $4b09 ; (vdcwin_edit.s35 + 0)
4b06 : 4c 08 4a JMP $4a08 ; (vdcwin_edit.l2 + 0)
.s35:
4b09 : a9 00 __ LDA #$00
4b0b : c8 __ __ INY
4b0c : 91 0d __ STA (P0),y 
.s95:
4b0e : e8 __ __ INX
4b0f : 90 c2 __ BCC $4ad3 ; (vdcwin_edit.s94 + 0)
.s93:
4b11 : a9 00 __ LDA #$00
4b13 : a0 04 __ LDY #$04
4b15 : 91 53 __ STA (T0 + 0),y 
4b17 : c8 __ __ INY
4b18 : 91 53 __ STA (T0 + 0),y 
4b1a : 4c 08 4a JMP $4a08 ; (vdcwin_edit.l2 + 0)
.s59:
4b1d : c9 11 __ CMP #$11
4b1f : d0 16 __ BNE $4b37 ; (vdcwin_edit.s60 + 0)
.s15:
4b21 : a0 05 __ LDY #$05
4b23 : b1 0d __ LDA (P0),y 
4b25 : aa __ __ TAX
4b26 : 18 __ __ CLC
4b27 : 69 01 __ ADC #$01
4b29 : 90 03 __ BCC $4b2e ; (vdcwin_edit.s1034 + 0)
4b2b : 4c 08 4a JMP $4a08 ; (vdcwin_edit.l2 + 0)
.s1034:
4b2e : a0 03 __ LDY #$03
4b30 : d1 0d __ CMP (P0),y 
4b32 : 90 da __ BCC $4b0e ; (vdcwin_edit.s95 + 0)
4b34 : 4c 08 4a JMP $4a08 ; (vdcwin_edit.l2 + 0)
.s60:
4b37 : 90 07 __ BCC $4b40 ; (vdcwin_edit.s62 + 0)
.s61:
4b39 : c9 13 __ CMP #$13
4b3b : f0 d4 __ BEQ $4b11 ; (vdcwin_edit.s93 + 0)
4b3d : 4c 72 4a JMP $4a72 ; (vdcwin_edit.s46 + 0)
.s62:
4b40 : c9 03 __ CMP #$03
4b42 : f0 07 __ BEQ $4b4b ; (vdcwin_edit.s1001 + 0)
.s63:
4b44 : c9 0d __ CMP #$0d
4b46 : f0 03 __ BEQ $4b4b ; (vdcwin_edit.s1001 + 0)
4b48 : 4c 72 4a JMP $4a72 ; (vdcwin_edit.s46 + 0)
.s1001:
4b4b : ad eb bf LDA $bfeb ; (vp_fill + 26)
4b4e : 85 53 __ STA T0 + 0 
4b50 : ad ec bf LDA $bfec ; (vp_fill + 27)
4b53 : 85 54 __ STA T0 + 1 
4b55 : ad ed bf LDA $bfed ; (vp_fill + 28)
4b58 : 85 55 __ STA T1 + 0 
4b5a : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_cursor_show: ; vdcwin_cursor_show(struct VDCWin*,bool)->void
.s0:
4b5b : a0 01 __ LDY #$01
4b5d : b1 0d __ LDA (P0),y ; (win + 0)
4b5f : 18 __ __ CLC
4b60 : a0 05 __ LDY #$05
4b62 : 71 0d __ ADC (P0),y ; (win + 0)
4b64 : 0a __ __ ASL
4b65 : aa __ __ TAX
4b66 : 18 __ __ CLC
4b67 : 88 __ __ DEY
4b68 : b1 0d __ LDA (P0),y ; (win + 0)
4b6a : a0 00 __ LDY #$00
4b6c : 71 0d __ ADC (P0),y ; (win + 0)
4b6e : 18 __ __ CLC
4b6f : 7d 00 6e ADC $6e00,x ; (multab + 0)
4b72 : a8 __ __ TAY
4b73 : a9 00 __ LDA #$00
4b75 : 7d 01 6e ADC $6e01,x ; (multab + 1)
4b78 : a2 12 __ LDX #$12
4b7a : 8e 00 d6 STX $d600 
4b7d : aa __ __ TAX
4b7e : 98 __ __ TYA
4b7f : 18 __ __ CLC
4b80 : 6d 7d 6c ADC $6c7d ; (vdc_state + 10)
4b83 : a8 __ __ TAY
4b84 : 8a __ __ TXA
4b85 : 6d 7e 6c ADC $6c7e ; (vdc_state + 11)
4b88 : aa __ __ TAX
4b89 : a5 0f __ LDA P2 ; (show + 0)
4b8b : d0 50 __ BNE $4bdd ; (vdcwin_cursor_show.l1026 + 0)
.l1027:
4b8d : 2c 00 d6 BIT $d600 
4b90 : 10 fb __ BPL $4b8d ; (vdcwin_cursor_show.l1027 + 0)
.s47:
4b92 : 8e 01 d6 STX $d601 
4b95 : a9 13 __ LDA #$13
4b97 : 8d 00 d6 STA $d600 
.l351:
4b9a : 2c 00 d6 BIT $d600 
4b9d : 10 fb __ BPL $4b9a ; (vdcwin_cursor_show.l351 + 0)
.s52:
4b9f : 8c 01 d6 STY $d601 
4ba2 : a9 1f __ LDA #$1f
4ba4 : 8d 00 d6 STA $d600 
.l353:
4ba7 : 2c 00 d6 BIT $d600 
4baa : 10 fb __ BPL $4ba7 ; (vdcwin_cursor_show.l353 + 0)
.s56:
4bac : ad 01 d6 LDA $d601 
4baf : 29 bf __ AND #$bf
.s1030:
4bb1 : 85 1b __ STA ACCU + 0 
4bb3 : a9 12 __ LDA #$12
4bb5 : 8d 00 d6 STA $d600 
.l344:
4bb8 : 2c 00 d6 BIT $d600 
4bbb : 10 fb __ BPL $4bb8 ; (vdcwin_cursor_show.l344 + 0)
.s1029:
4bbd : 8e 01 d6 STX $d601 
4bc0 : a9 13 __ LDA #$13
4bc2 : 8d 00 d6 STA $d600 
.l346:
4bc5 : 2c 00 d6 BIT $d600 
4bc8 : 10 fb __ BPL $4bc5 ; (vdcwin_cursor_show.l346 + 0)
.s1028:
4bca : 8c 01 d6 STY $d601 
4bcd : a9 1f __ LDA #$1f
4bcf : 8d 00 d6 STA $d600 
.l348:
4bd2 : 2c 00 d6 BIT $d600 
4bd5 : 10 fb __ BPL $4bd2 ; (vdcwin_cursor_show.l348 + 0)
.s560:
4bd7 : a5 1b __ LDA ACCU + 0 
4bd9 : 8d 01 d6 STA $d601 
.s1001:
4bdc : 60 __ __ RTS
.l1026:
4bdd : 2c 00 d6 BIT $d600 
4be0 : 10 fb __ BPL $4bdd ; (vdcwin_cursor_show.l1026 + 0)
.s13:
4be2 : 8e 01 d6 STX $d601 
4be5 : a9 13 __ LDA #$13
4be7 : 8d 00 d6 STA $d600 
.l340:
4bea : 2c 00 d6 BIT $d600 
4bed : 10 fb __ BPL $4bea ; (vdcwin_cursor_show.l340 + 0)
.s18:
4bef : 8c 01 d6 STY $d601 
4bf2 : a9 1f __ LDA #$1f
4bf4 : 8d 00 d6 STA $d600 
.l342:
4bf7 : 2c 00 d6 BIT $d600 
4bfa : 10 fb __ BPL $4bf7 ; (vdcwin_cursor_show.l342 + 0)
.s22:
4bfc : ad 01 d6 LDA $d601 
4bff : 09 40 __ ORA #$40
4c01 : 4c b1 4b JMP $4bb1 ; (vdcwin_cursor_show.s1030 + 0)
--------------------------------------------------------------------
vdcwin_cursor_backward: ; vdcwin_cursor_backward(struct VDCWin*)->bool
.s0:
4c04 : a0 04 __ LDY #$04
4c06 : b1 0d __ LDA (P0),y ; (win + 0)
4c08 : f0 06 __ BEQ $4c10 ; (vdcwin_cursor_backward.s2 + 0)
.s1:
4c0a : 38 __ __ SEC
4c0b : e9 01 __ SBC #$01
4c0d : 4c 24 4c JMP $4c24 ; (vdcwin_cursor_backward.s1003 + 0)
.s2:
4c10 : c8 __ __ INY
4c11 : b1 0d __ LDA (P0),y ; (win + 0)
4c13 : f0 13 __ BEQ $4c28 ; (vdcwin_cursor_backward.s1001 + 0)
.s5:
4c15 : aa __ __ TAX
4c16 : 38 __ __ SEC
4c17 : a0 02 __ LDY #$02
4c19 : b1 0d __ LDA (P0),y ; (win + 0)
4c1b : e9 01 __ SBC #$01
4c1d : a0 04 __ LDY #$04
4c1f : 91 0d __ STA (P0),y ; (win + 0)
4c21 : ca __ __ DEX
4c22 : 8a __ __ TXA
4c23 : c8 __ __ INY
.s1003:
4c24 : 91 0d __ STA (P0),y ; (win + 0)
4c26 : a9 01 __ LDA #$01
.s1001:
4c28 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_delete_char: ; vdcwin_delete_char(struct VDCWin*)->void
.s0:
4c29 : a0 05 __ LDY #$05
4c2b : b1 15 __ LDA (P8),y ; (win + 0)
4c2d : 85 46 __ STA T2 + 0 
4c2f : 0a __ __ ASL
4c30 : aa __ __ TAX
4c31 : bd 00 6e LDA $6e00,x ; (multab + 0)
4c34 : 85 47 __ STA T3 + 0 
4c36 : 18 __ __ CLC
4c37 : c8 __ __ INY
4c38 : 71 15 __ ADC (P8),y ; (win + 0)
4c3a : 85 49 __ STA T4 + 0 
4c3c : bd 01 6e LDA $6e01,x ; (multab + 1)
4c3f : 85 48 __ STA T3 + 1 
4c41 : c8 __ __ INY
4c42 : 71 15 __ ADC (P8),y ; (win + 0)
4c44 : 85 4a __ STA T4 + 1 
4c46 : a0 04 __ LDY #$04
4c48 : b1 15 __ LDA (P8),y ; (win + 0)
4c4a : 85 4b __ STA T5 + 0 
4c4c : 18 __ __ CLC
4c4d : 65 49 __ ADC T4 + 0 
4c4f : 85 0f __ STA P2 
4c51 : a9 00 __ LDA #$00
4c53 : 85 14 __ STA P7 
4c55 : 65 4a __ ADC T4 + 1 
4c57 : 85 10 __ STA P3 
4c59 : 18 __ __ CLC
4c5a : a5 0f __ LDA P2 
4c5c : 69 01 __ ADC #$01
4c5e : 85 11 __ STA P4 
4c60 : a5 10 __ LDA P3 
4c62 : 69 00 __ ADC #$00
4c64 : 85 12 __ STA P5 
4c66 : a0 02 __ LDY #$02
4c68 : b1 15 __ LDA (P8),y ; (win + 0)
4c6a : 38 __ __ SEC
4c6b : e9 01 __ SBC #$01
4c6d : 85 4c __ STA T6 + 0 
4c6f : 38 __ __ SEC
4c70 : e5 4b __ SBC T5 + 0 
4c72 : 85 13 __ STA P6 
4c74 : a0 08 __ LDY #$08
4c76 : b1 15 __ LDA (P8),y ; (win + 0)
4c78 : 85 4f __ STA T8 + 0 
4c7a : c8 __ __ INY
4c7b : b1 15 __ LDA (P8),y ; (win + 0)
4c7d : 85 50 __ STA T8 + 1 
4c7f : 20 d1 45 JSR $45d1 ; (vdc_block_copy.s0 + 0)
4c82 : 18 __ __ CLC
4c83 : a5 4f __ LDA T8 + 0 
4c85 : 65 47 __ ADC T3 + 0 
4c87 : 85 47 __ STA T3 + 0 
4c89 : a5 50 __ LDA T8 + 1 
4c8b : 65 48 __ ADC T3 + 1 
4c8d : 85 48 __ STA T3 + 1 
4c8f : 18 __ __ CLC
4c90 : a5 47 __ LDA T3 + 0 
4c92 : 65 4b __ ADC T5 + 0 
4c94 : 85 0f __ STA P2 
4c96 : a5 48 __ LDA T3 + 1 
4c98 : 69 00 __ ADC #$00
4c9a : 85 10 __ STA P3 
4c9c : 18 __ __ CLC
4c9d : a5 0f __ LDA P2 
4c9f : 69 01 __ ADC #$01
4ca1 : 85 11 __ STA P4 
4ca3 : a5 10 __ LDA P3 
.l6:
4ca5 : 69 00 __ ADC #$00
4ca7 : 85 12 __ STA P5 
4ca9 : 20 d1 45 JSR $45d1 ; (vdc_block_copy.s0 + 0)
4cac : e6 46 __ INC T2 + 0 
4cae : 18 __ __ CLC
4caf : a5 4c __ LDA T6 + 0 
4cb1 : 65 49 __ ADC T4 + 0 
4cb3 : aa __ __ TAX
4cb4 : a9 00 __ LDA #$00
4cb6 : 65 4a __ ADC T4 + 1 
4cb8 : 85 4e __ STA T7 + 1 
4cba : a5 46 __ LDA T2 + 0 
4cbc : a0 03 __ LDY #$03
4cbe : d1 15 __ CMP (P8),y ; (win + 0)
4cc0 : a9 12 __ LDA #$12
4cc2 : 8d 00 d6 STA $d600 
4cc5 : 90 27 __ BCC $4cee ; (vdcwin_delete_char.s7 + 0)
.l461:
4cc7 : 2c 00 d6 BIT $d600 
4cca : 10 fb __ BPL $4cc7 ; (vdcwin_delete_char.l461 + 0)
.s84:
4ccc : a5 4e __ LDA T7 + 1 
4cce : 8d 01 d6 STA $d601 
4cd1 : a9 13 __ LDA #$13
4cd3 : 8d 00 d6 STA $d600 
.l463:
4cd6 : 2c 00 d6 BIT $d600 
4cd9 : 10 fb __ BPL $4cd6 ; (vdcwin_delete_char.l463 + 0)
.s89:
4cdb : 8e 01 d6 STX $d601 
4cde : a9 1f __ LDA #$1f
4ce0 : 8d 00 d6 STA $d600 
.l465:
4ce3 : 2c 00 d6 BIT $d600 
4ce6 : 10 fb __ BPL $4ce3 ; (vdcwin_delete_char.l465 + 0)
.s93:
4ce8 : a9 20 __ LDA #$20
4cea : 8d 01 d6 STA $d601 
.s1001:
4ced : 60 __ __ RTS
.s7:
4cee : a5 49 __ LDA T4 + 0 
4cf0 : 6d 76 6c ADC $6c76 ; (vdc_state + 3)
4cf3 : a8 __ __ TAY
4cf4 : a5 4a __ LDA T4 + 1 
4cf6 : 6d 77 6c ADC $6c77 ; (vdc_state + 4)
4cf9 : 85 45 __ STA T9 + 1 
.l437:
4cfb : 2c 00 d6 BIT $d600 
4cfe : 10 fb __ BPL $4cfb ; (vdcwin_delete_char.l437 + 0)
.s16:
4d00 : 8d 01 d6 STA $d601 
4d03 : a9 13 __ LDA #$13
4d05 : 8d 00 d6 STA $d600 
.l439:
4d08 : 2c 00 d6 BIT $d600 
4d0b : 10 fb __ BPL $4d08 ; (vdcwin_delete_char.l439 + 0)
.s21:
4d0d : 8c 01 d6 STY $d601 
4d10 : a9 1f __ LDA #$1f
4d12 : 8d 00 d6 STA $d600 
.l441:
4d15 : 2c 00 d6 BIT $d600 
4d18 : 10 fb __ BPL $4d15 ; (vdcwin_delete_char.l441 + 0)
.s25:
4d1a : ad 01 d6 LDA $d601 
4d1d : 85 43 __ STA T1 + 0 
4d1f : a9 12 __ LDA #$12
4d21 : 8d 00 d6 STA $d600 
.l443:
4d24 : 2c 00 d6 BIT $d600 
4d27 : 10 fb __ BPL $4d24 ; (vdcwin_delete_char.l443 + 0)
.s33:
4d29 : a5 4e __ LDA T7 + 1 
4d2b : 8d 01 d6 STA $d601 
4d2e : a9 13 __ LDA #$13
4d30 : 8d 00 d6 STA $d600 
.l445:
4d33 : 2c 00 d6 BIT $d600 
4d36 : 10 fb __ BPL $4d33 ; (vdcwin_delete_char.l445 + 0)
.s38:
4d38 : 8e 01 d6 STX $d601 
4d3b : a9 1f __ LDA #$1f
4d3d : 8d 00 d6 STA $d600 
.l447:
4d40 : 2c 00 d6 BIT $d600 
4d43 : 10 fb __ BPL $4d40 ; (vdcwin_delete_char.l447 + 0)
.s42:
4d45 : a5 43 __ LDA T1 + 0 
4d47 : 8d 01 d6 STA $d601 
4d4a : a9 12 __ LDA #$12
4d4c : 8d 00 d6 STA $d600 
4d4f : 18 __ __ CLC
4d50 : a5 47 __ LDA T3 + 0 
4d52 : 65 4c __ ADC T6 + 0 
4d54 : aa __ __ TAX
4d55 : a5 48 __ LDA T3 + 1 
4d57 : 69 00 __ ADC #$00
4d59 : 85 4a __ STA T4 + 1 
4d5b : 18 __ __ CLC
4d5c : a5 47 __ LDA T3 + 0 
4d5e : 6d 76 6c ADC $6c76 ; (vdc_state + 3)
4d61 : 85 4d __ STA T7 + 0 
4d63 : a5 48 __ LDA T3 + 1 
4d65 : 6d 77 6c ADC $6c77 ; (vdc_state + 4)
4d68 : 85 4e __ STA T7 + 1 
.l449:
4d6a : 2c 00 d6 BIT $d600 
4d6d : 10 fb __ BPL $4d6a ; (vdcwin_delete_char.l449 + 0)
.s50:
4d6f : 8d 01 d6 STA $d601 
4d72 : a9 13 __ LDA #$13
4d74 : 8d 00 d6 STA $d600 
.l451:
4d77 : 2c 00 d6 BIT $d600 
4d7a : 10 fb __ BPL $4d77 ; (vdcwin_delete_char.l451 + 0)
.s55:
4d7c : a5 4d __ LDA T7 + 0 
4d7e : 8d 01 d6 STA $d601 
4d81 : a9 1f __ LDA #$1f
4d83 : 8d 00 d6 STA $d600 
.l453:
4d86 : 2c 00 d6 BIT $d600 
4d89 : 10 fb __ BPL $4d86 ; (vdcwin_delete_char.l453 + 0)
.s59:
4d8b : ad 01 d6 LDA $d601 
4d8e : 85 43 __ STA T1 + 0 
4d90 : a9 12 __ LDA #$12
4d92 : 8d 00 d6 STA $d600 
.l455:
4d95 : 2c 00 d6 BIT $d600 
4d98 : 10 fb __ BPL $4d95 ; (vdcwin_delete_char.l455 + 0)
.s67:
4d9a : a5 4a __ LDA T4 + 1 
4d9c : 8d 01 d6 STA $d601 
4d9f : a9 13 __ LDA #$13
4da1 : 8d 00 d6 STA $d600 
.l457:
4da4 : 2c 00 d6 BIT $d600 
4da7 : 10 fb __ BPL $4da4 ; (vdcwin_delete_char.l457 + 0)
.s72:
4da9 : 8e 01 d6 STX $d601 
4dac : a9 1f __ LDA #$1f
4dae : 8d 00 d6 STA $d600 
.l459:
4db1 : 2c 00 d6 BIT $d600 
4db4 : 10 fb __ BPL $4db1 ; (vdcwin_delete_char.l459 + 0)
.s76:
4db6 : 84 0f __ STY P2 
4db8 : 84 49 __ STY T4 + 0 
4dba : a5 43 __ LDA T1 + 0 
4dbc : 8d 01 d6 STA $d601 
4dbf : 98 __ __ TYA
4dc0 : 18 __ __ CLC
4dc1 : 69 01 __ ADC #$01
4dc3 : 85 11 __ STA P4 
4dc5 : a5 45 __ LDA T9 + 1 
4dc7 : 85 10 __ STA P3 
4dc9 : 85 4a __ STA T4 + 1 
4dcb : a6 4c __ LDX T6 + 0 
4dcd : 86 13 __ STX P6 
4dcf : 69 00 __ ADC #$00
4dd1 : 85 12 __ STA P5 
4dd3 : 20 95 66 JSR $6695 ; (vdc_block_copy@proxy + 0)
4dd6 : a5 4d __ LDA T7 + 0 
4dd8 : 85 47 __ STA T3 + 0 
4dda : 85 0f __ STA P2 
4ddc : 18 __ __ CLC
4ddd : 69 01 __ ADC #$01
4ddf : 85 11 __ STA P4 
4de1 : a5 4e __ LDA T7 + 1 
4de3 : 85 48 __ STA T3 + 1 
4de5 : 85 10 __ STA P3 
4de7 : 4c a5 4c JMP $4ca5 ; (vdcwin_delete_char.l6 + 0)
--------------------------------------------------------------------
vdcwin_insert_char: ; vdcwin_insert_char(struct VDCWin*)->void
.s0:
4dea : a0 02 __ LDY #$02
4dec : b1 16 __ LDA (P9),y ; (win + 0)
4dee : 38 __ __ SEC
4def : e9 01 __ SBC #$01
4df1 : 85 46 __ STA T2 + 0 
4df3 : c8 __ __ INY
4df4 : b1 16 __ LDA (P9),y ; (win + 0)
4df6 : 38 __ __ SEC
4df7 : e9 01 __ SBC #$01
4df9 : 85 47 __ STA T3 + 0 
4dfb : 0a __ __ ASL
4dfc : aa __ __ TAX
4dfd : a0 06 __ LDY #$06
4dff : b1 16 __ LDA (P9),y ; (win + 0)
4e01 : 18 __ __ CLC
4e02 : 7d 00 6e ADC $6e00,x ; (multab + 0)
4e05 : 85 4b __ STA T5 + 0 
4e07 : c8 __ __ INY
4e08 : b1 16 __ LDA (P9),y ; (win + 0)
4e0a : 7d 01 6e ADC $6e01,x ; (multab + 1)
4e0d : 85 4c __ STA T5 + 1 
4e0f : c8 __ __ INY
4e10 : b1 16 __ LDA (P9),y ; (win + 0)
4e12 : 18 __ __ CLC
4e13 : 7d 00 6e ADC $6e00,x ; (multab + 0)
4e16 : 85 49 __ STA T4 + 0 
4e18 : c8 __ __ INY
4e19 : b1 16 __ LDA (P9),y ; (win + 0)
4e1b : 7d 01 6e ADC $6e01,x ; (multab + 1)
4e1e : 85 4a __ STA T4 + 1 
4e20 : 4c 28 4e JMP $4e28 ; (vdcwin_insert_char.l5 + 0)
.s80:
4e23 : 8e 01 d6 STX $d601 
4e26 : c6 47 __ DEC T3 + 0 
.l5:
4e28 : a0 05 __ LDY #$05
4e2a : b1 16 __ LDA (P9),y ; (win + 0)
4e2c : c5 47 __ CMP T3 + 0 
4e2e : b0 03 __ BCS $4e33 ; (vdcwin_insert_char.s7 + 0)
4e30 : 4c 2a 4f JMP $4f2a ; (vdcwin_insert_char.s6 + 0)
.s7:
4e33 : 88 __ __ DEY
4e34 : b1 16 __ LDA (P9),y ; (win + 0)
4e36 : 18 __ __ CLC
4e37 : 65 4b __ ADC T5 + 0 
4e39 : 85 47 __ STA T3 + 0 
4e3b : a9 00 __ LDA #$00
4e3d : 65 4c __ ADC T5 + 1 
4e3f : 85 48 __ STA T3 + 1 
4e41 : 38 __ __ SEC
4e42 : a5 46 __ LDA T2 + 0 
4e44 : f1 16 __ SBC (P9),y ; (win + 0)
4e46 : d0 2e __ BNE $4e76 ; (vdcwin_insert_char.s81 + 0)
.s83:
4e48 : a9 12 __ LDA #$12
4e4a : 8d 00 d6 STA $d600 
.l476:
4e4d : 2c 00 d6 BIT $d600 
4e50 : 10 fb __ BPL $4e4d ; (vdcwin_insert_char.l476 + 0)
.s95:
4e52 : a5 48 __ LDA T3 + 1 
4e54 : 8d 01 d6 STA $d601 
4e57 : a9 13 __ LDA #$13
4e59 : 8d 00 d6 STA $d600 
.l478:
4e5c : 2c 00 d6 BIT $d600 
4e5f : 10 fb __ BPL $4e5c ; (vdcwin_insert_char.l478 + 0)
.s100:
4e61 : a5 47 __ LDA T3 + 0 
4e63 : 8d 01 d6 STA $d601 
4e66 : a9 1f __ LDA #$1f
4e68 : 8d 00 d6 STA $d600 
.l480:
4e6b : 2c 00 d6 BIT $d600 
4e6e : 10 fb __ BPL $4e6b ; (vdcwin_insert_char.l480 + 0)
.s104:
4e70 : a9 20 __ LDA #$20
4e72 : 8d 01 d6 STA $d601 
.s1001:
4e75 : 60 __ __ RTS
.s81:
4e76 : 85 46 __ STA T2 + 0 
4e78 : 85 13 __ STA P6 
4e7a : 85 12 __ STA P5 
4e7c : 18 __ __ CLC
4e7d : a5 47 __ LDA T3 + 0 
4e7f : 69 01 __ ADC #$01
4e81 : 85 4b __ STA T5 + 0 
4e83 : a5 48 __ LDA T3 + 1 
4e85 : 69 00 __ ADC #$00
4e87 : 85 4c __ STA T5 + 1 
4e89 : b1 16 __ LDA (P9),y ; (win + 0)
4e8b : 18 __ __ CLC
4e8c : 65 49 __ ADC T4 + 0 
4e8e : 85 16 __ STA P9 ; (win + 0)
4e90 : a9 00 __ LDA #$00
4e92 : 65 4a __ ADC T4 + 1 
4e94 : 85 17 __ STA P10 ; (win + 1)
4e96 : 18 __ __ CLC
4e97 : a5 16 __ LDA P9 ; (win + 0)
4e99 : 69 01 __ ADC #$01
4e9b : 85 49 __ STA T4 + 0 
4e9d : a5 17 __ LDA P10 ; (win + 1)
4e9f : 69 00 __ ADC #$00
4ea1 : 85 4a __ STA T4 + 1 
4ea3 : ad 74 6c LDA $6c74 ; (vdc_state + 1)
4ea6 : d0 0e __ BNE $4eb6 ; (vdcwin_insert_char.s86 + 0)
.s88:
4ea8 : a9 03 __ LDA #$03
4eaa : cd 80 6c CMP $6c80 ; (vdc_state + 13)
4ead : d0 05 __ BNE $4eb4 ; (vdcwin_insert_char.s1009 + 0)
.s1008:
4eaf : a9 ff __ LDA #$ff
4eb1 : cd 7f 6c CMP $6c7f ; (vdc_state + 12)
.s1009:
4eb4 : 90 3d __ BCC $4ef3 ; (vdcwin_insert_char.s85 + 0)
.s86:
4eb6 : a5 47 __ LDA T3 + 0 
4eb8 : 85 11 __ STA P4 
4eba : a5 48 __ LDA T3 + 1 
4ebc : 85 12 __ STA P5 
4ebe : ad 7f 6c LDA $6c7f ; (vdc_state + 12)
4ec1 : 85 4d __ STA T6 + 0 
4ec3 : 85 0f __ STA P2 
4ec5 : ad 80 6c LDA $6c80 ; (vdc_state + 13)
4ec8 : 85 4e __ STA T6 + 1 
4eca : 85 10 __ STA P3 
4ecc : 20 95 66 JSR $6695 ; (vdc_block_copy@proxy + 0)
4ecf : a5 4b __ LDA T5 + 0 
4ed1 : 85 0f __ STA P2 
4ed3 : a5 4c __ LDA T5 + 1 
4ed5 : 85 10 __ STA P3 
4ed7 : 20 b2 66 JSR $66b2 ; (vdc_block_copy@proxy + 0)
4eda : a5 16 __ LDA P9 ; (win + 0)
4edc : 85 11 __ STA P4 
4ede : a5 17 __ LDA P10 ; (win + 1)
4ee0 : 85 12 __ STA P5 
4ee2 : 20 bd 66 JSR $66bd ; (vdc_block_copy@proxy + 0)
4ee5 : a5 49 __ LDA T4 + 0 
4ee7 : 85 0f __ STA P2 
4ee9 : a5 4a __ LDA T4 + 1 
4eeb : 85 10 __ STA P3 
4eed : 20 b2 66 JSR $66b2 ; (vdc_block_copy@proxy + 0)
4ef0 : 4c 48 4e JMP $4e48 ; (vdcwin_insert_char.s83 + 0)
.s85:
4ef3 : a5 47 __ LDA T3 + 0 
4ef5 : 85 10 __ STA P3 
4ef7 : a5 48 __ LDA T3 + 1 
4ef9 : 85 11 __ STA P4 
4efb : 20 55 15 JSR $1555 ; (bnk_cpyfromvdc@proxy + 0)
4efe : a5 4b __ LDA T5 + 0 
4f00 : 85 0f __ STA P2 
4f02 : a5 4c __ LDA T5 + 1 
4f04 : 85 10 __ STA P3 
4f06 : a5 46 __ LDA T2 + 0 
4f08 : 85 14 __ STA P7 
4f0a : 20 1e 14 JSR $141e ; (bnk_cpytovdc@proxy + 0)
4f0d : a5 16 __ LDA P9 ; (win + 0)
4f0f : 85 10 __ STA P3 
4f11 : a5 17 __ LDA P10 ; (win + 1)
4f13 : 85 11 __ STA P4 
4f15 : a5 14 __ LDA P7 
4f17 : 85 12 __ STA P5 
4f19 : 20 55 15 JSR $1555 ; (bnk_cpyfromvdc@proxy + 0)
4f1c : a5 49 __ LDA T4 + 0 
4f1e : 85 0f __ STA P2 
4f20 : a5 4a __ LDA T4 + 1 
4f22 : 85 10 __ STA P3 
4f24 : 20 1e 14 JSR $141e ; (bnk_cpytovdc@proxy + 0)
4f27 : 4c 48 4e JMP $4e48 ; (vdcwin_insert_char.s83 + 0)
.s6:
4f2a : a5 4b __ LDA T5 + 0 
4f2c : 69 01 __ ADC #$01
4f2e : 85 4d __ STA T6 + 0 
4f30 : a5 4c __ LDA T5 + 1 
4f32 : 69 00 __ ADC #$00
4f34 : 85 4e __ STA T6 + 1 
4f36 : 18 __ __ CLC
4f37 : a5 49 __ LDA T4 + 0 
4f39 : 69 01 __ ADC #$01
4f3b : 85 4f __ STA T7 + 0 
4f3d : a5 4a __ LDA T4 + 1 
4f3f : 69 00 __ ADC #$00
4f41 : 85 50 __ STA T7 + 1 
4f43 : ad 74 6c LDA $6c74 ; (vdc_state + 1)
4f46 : d0 0e __ BNE $4f56 ; (vdcwin_insert_char.s10 + 0)
.s12:
4f48 : a9 03 __ LDA #$03
4f4a : cd 80 6c CMP $6c80 ; (vdc_state + 13)
4f4d : d0 05 __ BNE $4f54 ; (vdcwin_insert_char.s1035 + 0)
.s1034:
4f4f : a9 ff __ LDA #$ff
4f51 : cd 7f 6c CMP $6c7f ; (vdc_state + 12)
.s1035:
4f54 : 90 51 __ BCC $4fa7 ; (vdcwin_insert_char.s9 + 0)
.s10:
4f56 : a5 4b __ LDA T5 + 0 
4f58 : 85 11 __ STA P4 
4f5a : a5 4c __ LDA T5 + 1 
4f5c : 85 12 __ STA P5 
4f5e : ad 7f 6c LDA $6c7f ; (vdc_state + 12)
4f61 : 85 51 __ STA T8 + 0 
4f63 : 85 0f __ STA P2 
4f65 : ad 80 6c LDA $6c80 ; (vdc_state + 13)
4f68 : 85 52 __ STA T8 + 1 
4f6a : 85 10 __ STA P3 
4f6c : a5 46 __ LDA T2 + 0 
4f6e : 85 13 __ STA P6 
4f70 : 20 95 66 JSR $6695 ; (vdc_block_copy@proxy + 0)
4f73 : a5 51 __ LDA T8 + 0 
4f75 : 85 11 __ STA P4 
4f77 : a5 52 __ LDA T8 + 1 
4f79 : 85 12 __ STA P5 
4f7b : 20 bd 66 JSR $66bd ; (vdc_block_copy@proxy + 0)
4f7e : a5 51 __ LDA T8 + 0 
4f80 : 85 0f __ STA P2 
4f82 : a5 52 __ LDA T8 + 1 
4f84 : 85 10 __ STA P3 
4f86 : a5 49 __ LDA T4 + 0 
4f88 : 85 11 __ STA P4 
4f8a : a5 4a __ LDA T4 + 1 
4f8c : 85 12 __ STA P5 
4f8e : 20 d1 45 JSR $45d1 ; (vdc_block_copy.s0 + 0)
4f91 : a5 4f __ LDA T7 + 0 
4f93 : 85 0f __ STA P2 
4f95 : a5 50 __ LDA T7 + 1 
4f97 : 85 10 __ STA P3 
4f99 : a5 51 __ LDA T8 + 0 
4f9b : 85 11 __ STA P4 
4f9d : a5 52 __ LDA T8 + 1 
4f9f : 85 12 __ STA P5 
4fa1 : 20 d1 45 JSR $45d1 ; (vdc_block_copy.s0 + 0)
4fa4 : 4c d7 4f JMP $4fd7 ; (vdcwin_insert_char.s8 + 0)
.s9:
4fa7 : a5 4b __ LDA T5 + 0 
4fa9 : 85 10 __ STA P3 
4fab : a5 4c __ LDA T5 + 1 
4fad : 85 11 __ STA P4 
4faf : 20 90 13 JSR $1390 ; (bnk_cpyfromvdc@proxy + 0)
4fb2 : a5 4d __ LDA T6 + 0 
4fb4 : 85 0f __ STA P2 
4fb6 : a5 4e __ LDA T6 + 1 
4fb8 : 85 10 __ STA P3 
4fba : a5 12 __ LDA P5 
4fbc : 85 14 __ STA P7 
4fbe : 20 1e 14 JSR $141e ; (bnk_cpytovdc@proxy + 0)
4fc1 : a5 49 __ LDA T4 + 0 
4fc3 : 85 10 __ STA P3 
4fc5 : a5 4a __ LDA T4 + 1 
4fc7 : 85 11 __ STA P4 
4fc9 : 20 90 13 JSR $1390 ; (bnk_cpyfromvdc@proxy + 0)
4fcc : a5 4f __ LDA T7 + 0 
4fce : 85 0f __ STA P2 
4fd0 : a5 50 __ LDA T7 + 1 
4fd2 : 85 10 __ STA P3 
4fd4 : 20 1e 14 JSR $141e ; (bnk_cpytovdc@proxy + 0)
.s8:
4fd7 : a9 12 __ LDA #$12
4fd9 : 8d 00 d6 STA $d600 
4fdc : 38 __ __ SEC
4fdd : a5 4b __ LDA T5 + 0 
4fdf : ed 76 6c SBC $6c76 ; (vdc_state + 3)
4fe2 : 85 4b __ STA T5 + 0 
4fe4 : a5 4c __ LDA T5 + 1 
4fe6 : ed 77 6c SBC $6c77 ; (vdc_state + 4)
4fe9 : 85 4c __ STA T5 + 1 
4feb : 18 __ __ CLC
4fec : a5 4b __ LDA T5 + 0 
4fee : 6d 76 6c ADC $6c76 ; (vdc_state + 3)
4ff1 : aa __ __ TAX
4ff2 : a5 4c __ LDA T5 + 1 
4ff4 : 6d 77 6c ADC $6c77 ; (vdc_state + 4)
4ff7 : a8 __ __ TAY
4ff8 : 18 __ __ CLC
4ff9 : a5 46 __ LDA T2 + 0 
4ffb : 65 4b __ ADC T5 + 0 
4ffd : 85 1b __ STA ACCU + 0 
4fff : a9 00 __ LDA #$00
5001 : 65 4c __ ADC T5 + 1 
5003 : 85 44 __ STA T10 + 0 
5005 : 38 __ __ SEC
5006 : a5 49 __ LDA T4 + 0 
5008 : ed 76 6c SBC $6c76 ; (vdc_state + 3)
500b : 85 49 __ STA T4 + 0 
500d : a5 4a __ LDA T4 + 1 
500f : ed 77 6c SBC $6c77 ; (vdc_state + 4)
5012 : 85 4a __ STA T4 + 1 
.l449:
5014 : 2c 00 d6 BIT $d600 
5017 : 10 fb __ BPL $5014 ; (vdcwin_insert_char.l449 + 0)
.s20:
5019 : a5 44 __ LDA T10 + 0 
501b : 8d 01 d6 STA $d601 
501e : a9 13 __ LDA #$13
5020 : 8d 00 d6 STA $d600 
.l451:
5023 : 2c 00 d6 BIT $d600 
5026 : 10 fb __ BPL $5023 ; (vdcwin_insert_char.l451 + 0)
.s25:
5028 : a5 1b __ LDA ACCU + 0 
502a : 8d 01 d6 STA $d601 
502d : a9 1f __ LDA #$1f
502f : 8d 00 d6 STA $d600 
.l453:
5032 : 2c 00 d6 BIT $d600 
5035 : 10 fb __ BPL $5032 ; (vdcwin_insert_char.l453 + 0)
.s29:
5037 : ad 01 d6 LDA $d601 
503a : 85 43 __ STA T1 + 0 
503c : a9 12 __ LDA #$12
503e : 8d 00 d6 STA $d600 
.l455:
5041 : 2c 00 d6 BIT $d600 
5044 : 10 fb __ BPL $5041 ; (vdcwin_insert_char.l455 + 0)
.s37:
5046 : 8c 01 d6 STY $d601 
5049 : a9 13 __ LDA #$13
504b : 8d 00 d6 STA $d600 
.l457:
504e : 2c 00 d6 BIT $d600 
5051 : 10 fb __ BPL $504e ; (vdcwin_insert_char.l457 + 0)
.s42:
5053 : 8e 01 d6 STX $d601 
5056 : a9 1f __ LDA #$1f
5058 : 8d 00 d6 STA $d600 
.l459:
505b : 2c 00 d6 BIT $d600 
505e : 10 fb __ BPL $505b ; (vdcwin_insert_char.l459 + 0)
.s46:
5060 : a5 43 __ LDA T1 + 0 
5062 : 8d 01 d6 STA $d601 
5065 : a9 12 __ LDA #$12
5067 : 8d 00 d6 STA $d600 
506a : 18 __ __ CLC
506b : a5 49 __ LDA T4 + 0 
506d : 65 46 __ ADC T2 + 0 
506f : aa __ __ TAX
5070 : a5 4a __ LDA T4 + 1 
5072 : 69 00 __ ADC #$00
5074 : a8 __ __ TAY
5075 : 18 __ __ CLC
5076 : a5 49 __ LDA T4 + 0 
5078 : 6d 76 6c ADC $6c76 ; (vdc_state + 3)
507b : 85 4d __ STA T6 + 0 
507d : a5 4a __ LDA T4 + 1 
507f : 6d 77 6c ADC $6c77 ; (vdc_state + 4)
5082 : 85 4e __ STA T6 + 1 
.l461:
5084 : 2c 00 d6 BIT $d600 
5087 : 10 fb __ BPL $5084 ; (vdcwin_insert_char.l461 + 0)
.s54:
5089 : 8c 01 d6 STY $d601 
508c : a9 13 __ LDA #$13
508e : 8d 00 d6 STA $d600 
.l463:
5091 : 2c 00 d6 BIT $d600 
5094 : 10 fb __ BPL $5091 ; (vdcwin_insert_char.l463 + 0)
.s59:
5096 : 8e 01 d6 STX $d601 
5099 : a9 1f __ LDA #$1f
509b : 8d 00 d6 STA $d600 
.l465:
509e : 2c 00 d6 BIT $d600 
50a1 : 10 fb __ BPL $509e ; (vdcwin_insert_char.l465 + 0)
.s63:
50a3 : a9 12 __ LDA #$12
50a5 : ae 01 d6 LDX $d601 
50a8 : 8d 00 d6 STA $d600 
.l467:
50ab : 2c 00 d6 BIT $d600 
50ae : 10 fb __ BPL $50ab ; (vdcwin_insert_char.l467 + 0)
.s71:
50b0 : a5 4e __ LDA T6 + 1 
50b2 : 8d 01 d6 STA $d601 
50b5 : a9 13 __ LDA #$13
50b7 : 8d 00 d6 STA $d600 
.l469:
50ba : 2c 00 d6 BIT $d600 
50bd : 10 fb __ BPL $50ba ; (vdcwin_insert_char.l469 + 0)
.s76:
50bf : a5 4d __ LDA T6 + 0 
50c1 : 8d 01 d6 STA $d601 
50c4 : a9 1f __ LDA #$1f
50c6 : 8d 00 d6 STA $d600 
.l471:
50c9 : 2c 00 d6 BIT $d600 
50cc : 10 fb __ BPL $50c9 ; (vdcwin_insert_char.l471 + 0)
50ce : 4c 23 4e JMP $4e23 ; (vdcwin_insert_char.s80 + 0)
--------------------------------------------------------------------
vdcwin_get_rect: ; vdcwin_get_rect(struct VDCWin*,u8,u8,u8,u8,u8,u8*)->void
.s0:
50d1 : a0 06 __ LDY #$06
50d3 : b1 10 __ LDA (P3),y ; (win + 0)
50d5 : 18 __ __ CLC
50d6 : 6d 00 6e ADC $6e00 ; (multab + 0)
50d9 : 85 43 __ STA T0 + 0 
50db : c8 __ __ INY
50dc : b1 10 __ LDA (P3),y ; (win + 0)
50de : 6d 01 6e ADC $6e01 ; (multab + 1)
50e1 : 85 44 __ STA T0 + 1 
50e3 : a9 05 __ LDA #$05
50e5 : 85 45 __ STA T2 + 0 
.l4:
50e7 : a9 00 __ LDA #$00
50e9 : 85 46 __ STA T3 + 0 
.l8:
50eb : a9 12 __ LDA #$12
50ed : 8d 00 d6 STA $d600 
50f0 : 18 __ __ CLC
50f1 : a5 12 __ LDA P5 ; (chars + 0)
50f3 : 65 46 __ ADC T3 + 0 
50f5 : 85 0d __ STA P0 
50f7 : a5 13 __ LDA P6 ; (chars + 1)
50f9 : 69 00 __ ADC #$00
50fb : 85 0e __ STA P1 
50fd : 18 __ __ CLC
50fe : a5 43 __ LDA T0 + 0 
5100 : 65 46 __ ADC T3 + 0 
5102 : aa __ __ TAX
5103 : a5 44 __ LDA T0 + 1 
5105 : 69 00 __ ADC #$00
.l129:
5107 : 2c 00 d6 BIT $d600 
510a : 10 fb __ BPL $5107 ; (vdcwin_get_rect.l129 + 0)
.s18:
510c : 8d 01 d6 STA $d601 
510f : a9 13 __ LDA #$13
5111 : 8d 00 d6 STA $d600 
.l131:
5114 : 2c 00 d6 BIT $d600 
5117 : 10 fb __ BPL $5114 ; (vdcwin_get_rect.l131 + 0)
.s23:
5119 : 8e 01 d6 STX $d601 
511c : a9 1f __ LDA #$1f
511e : 8d 00 d6 STA $d600 
.l133:
5121 : 2c 00 d6 BIT $d600 
5124 : 10 fb __ BPL $5121 ; (vdcwin_get_rect.l133 + 0)
.s27:
5126 : ad 01 d6 LDA $d601 
5129 : a8 __ __ TAY
512a : 4a __ __ LSR
512b : 4a __ __ LSR
512c : 4a __ __ LSR
512d : 4a __ __ LSR
512e : 4a __ __ LSR
512f : aa __ __ TAX
5130 : 98 __ __ TYA
5131 : 5d 53 6c EOR $6c53,x ; (s2pmap + 0)
5134 : 85 0f __ STA P2 
5136 : 20 cf 14 JSR $14cf ; (bnk_writeb.s0 + 0)
5139 : e6 46 __ INC T3 + 0 
513b : a5 46 __ LDA T3 + 0 
513d : c9 32 __ CMP #$32
513f : 90 aa __ BCC $50eb ; (vdcwin_get_rect.l8 + 0)
.s10:
5141 : ad 76 6c LDA $6c76 ; (vdc_state + 3)
5144 : 18 __ __ CLC
5145 : 65 43 __ ADC T0 + 0 
5147 : 85 43 __ STA T0 + 0 
5149 : ad 77 6c LDA $6c77 ; (vdc_state + 4)
514c : 65 44 __ ADC T0 + 1 
514e : 85 44 __ STA T0 + 1 
5150 : 18 __ __ CLC
5151 : a5 12 __ LDA P5 ; (chars + 0)
5153 : 69 32 __ ADC #$32
5155 : 85 12 __ STA P5 ; (chars + 0)
5157 : 90 02 __ BCC $515b ; (vdcwin_get_rect.s1011 + 0)
.s1010:
5159 : e6 13 __ INC P6 ; (chars + 1)
.s1011:
515b : c6 45 __ DEC T2 + 0 
515d : d0 88 __ BNE $50e7 ; (vdcwin_get_rect.l4 + 0)
.s1001:
515f : 60 __ __ RTS
--------------------------------------------------------------------
5160 : __ __ __ BYT 65 4e 54 45 52 45 44 20 53 54 52 49 4e 47 20 46 : eNTERED STRING F
5170 : __ __ __ BYT 4f 52 4d 41 54 54 45 44 20 57 49 54 48 20 57 4f : ORMATTED WITH WO
5180 : __ __ __ BYT 52 44 20 57 52 41 50 3a 00                      : RD WRAP:.
--------------------------------------------------------------------
viewport_demo: ; viewport_demo(u8)->void
.s1000:
5189 : a5 53 __ LDA T0 + 0 
518b : 8d 9e bf STA $bf9e ; (bigfont + 131)
518e : a5 54 __ LDA T2 + 0 
5190 : 8d 9f bf STA $bf9f ; (bigfont + 132)
5193 : a5 55 __ LDA T3 + 0 
5195 : 8d a0 bf STA $bfa0 ; (bigfont + 133)
.s0:
5198 : a9 00 __ LDA #$00
519a : 8d fd bf STA $bffd ; (sstack + 6)
519d : 8d fe bf STA $bffe ; (sstack + 7)
51a0 : ad ff bf LDA $bfff ; (sstack + 8)
51a3 : 85 53 __ STA T0 + 0 
51a5 : 8d fc bf STA $bffc ; (sstack + 5)
51a8 : 20 2c 53 JSR $532c ; (screen_switch.s1000 + 0)
51ab : a5 1b __ LDA ACCU + 0 
51ad : d0 10 __ BNE $51bf ; (viewport_demo.s3 + 0)
.s1001:
51af : ad 9e bf LDA $bf9e ; (bigfont + 131)
51b2 : 85 53 __ STA T0 + 0 
51b4 : ad 9f bf LDA $bf9f ; (bigfont + 132)
51b7 : 85 54 __ STA T2 + 0 
51b9 : ad a0 bf LDA $bfa0 ; (bigfont + 133)
51bc : 85 55 __ STA T3 + 0 
51be : 60 __ __ RTS
.s3:
51bf : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
51c2 : 85 13 __ STA P6 
51c4 : a9 a0 __ LDA #$a0
51c6 : 85 11 __ STA P4 
51c8 : a9 54 __ LDA #$54
51ca : 85 12 __ STA P5 
51cc : 20 db 66 JSR $66db ; (vdc_prints_attr@proxy + 0)
51cf : a9 05 __ LDA #$05
51d1 : 85 0f __ STA P2 
51d3 : 85 10 __ STA P3 
51d5 : ad 78 6c LDA $6c78 ; (vdc_state + 5)
51d8 : 38 __ __ SEC
51d9 : e9 07 __ SBC #$07
51db : 85 55 __ STA T3 + 0 
51dd : 85 12 __ STA P5 
51df : a9 46 __ LDA #$46
51e1 : 85 11 __ STA P4 
51e3 : a9 c3 __ LDA #$c3
51e5 : 85 0d __ STA P0 
51e7 : a9 bf __ LDA #$bf
51e9 : 85 0e __ STA P1 
51eb : 20 ff 31 JSR $31ff ; (vdcwin_init.s0 + 0)
51ee : a9 c3 __ LDA #$c3
51f0 : 85 14 __ STA P7 
51f2 : a9 bf __ LDA #$bf
51f4 : 85 15 __ STA P8 
51f6 : 20 bf 32 JSR $32bf ; (vdcwin_border_clear@proxy + 0)
51f9 : a9 00 __ LDA #$00
51fb : 8d aa bf STA $bfaa ; (bigfont + 143)
51fe : 8d ab bf STA $bfab ; (bigfont + 144)
5201 : 8d ac bf STA $bfac ; (bigfont + 145)
5204 : 8d ad bf STA $bfad ; (bigfont + 146)
5207 : a9 7f __ LDA #$7f
5209 : 8d a3 bf STA $bfa3 ; (bigfont + 136)
520c : a9 05 __ LDA #$05
520e : 85 0f __ STA P2 
5210 : 85 10 __ STA P3 
5212 : a5 55 __ LDA T3 + 0 
5214 : 85 12 __ STA P5 
5216 : a9 46 __ LDA #$46
5218 : 85 11 __ STA P4 
521a : a9 40 __ LDA #$40
521c : 8d a5 bf STA $bfa5 ; (bigfont + 138)
521f : a5 53 __ LDA T0 + 0 
5221 : 0a __ __ ASL
5222 : 85 54 __ STA T2 + 0 
5224 : 85 55 __ STA T3 + 0 
5226 : aa __ __ TAX
5227 : bd fa 67 LDA $67fa,x ; (screenset + 0)
522a : 8d a6 bf STA $bfa6 ; (bigfont + 139)
522d : a9 00 __ LDA #$00
522f : 8d a9 bf STA $bfa9 ; (bigfont + 142)
5232 : 8d a4 bf STA $bfa4 ; (bigfont + 137)
5235 : 8d a7 bf STA $bfa7 ; (bigfont + 140)
5238 : bd fb 67 LDA $67fb,x ; (screenset + 1)
523b : 8d a8 bf STA $bfa8 ; (bigfont + 141)
523e : a9 ae __ LDA #$ae
5240 : 85 0d __ STA P0 
5242 : a9 bf __ LDA #$bf
5244 : 85 0e __ STA P1 
5246 : 20 ff 31 JSR $31ff ; (vdcwin_init.s0 + 0)
5249 : a9 a3 __ LDA #$a3
524b : 85 16 __ STA P9 
524d : a9 bf __ LDA #$bf
524f : 85 17 __ STA P10 
5251 : 20 36 38 JSR $3836 ; (vdcwin_cpy_viewport.s0 + 0)
.l7:
5254 : 20 bf 2a JSR $2abf ; (getch.s0 + 0)
5257 : 85 53 __ STA T0 + 0 
5259 : a2 00 __ LDX #$00
525b : 86 43 __ STX T1 + 0 
525d : c9 57 __ CMP #$57
525f : f0 04 __ BEQ $5265 ; (viewport_demo.s12 + 0)
.s13:
5261 : c9 91 __ CMP #$91
5263 : d0 11 __ BNE $5276 ; (viewport_demo.s11 + 0)
.s12:
5265 : ad ac bf LDA $bfac ; (bigfont + 145)
5268 : 0d ad bf ORA $bfad ; (bigfont + 146)
526b : f0 09 __ BEQ $5276 ; (viewport_demo.s11 + 0)
.s9:
526d : a9 08 __ LDA #$08
526f : 85 43 __ STA T1 + 0 
5271 : a5 53 __ LDA T0 + 0 
5273 : 4c 7c 52 JMP $527c ; (viewport_demo.s18 + 0)
.s11:
5276 : a5 53 __ LDA T0 + 0 
5278 : c9 53 __ CMP #$53
527a : f0 04 __ BEQ $5280 ; (viewport_demo.s17 + 0)
.s18:
527c : c9 11 __ CMP #$11
527e : d0 2f __ BNE $52af ; (viewport_demo.s16 + 0)
.s17:
5280 : a6 54 __ LDX T2 + 0 
5282 : bd fb 67 LDA $67fb,x ; (screenset + 1)
5285 : 38 __ __ SEC
5286 : ed 78 6c SBC $6c78 ; (vdc_state + 5)
5289 : a8 __ __ TAY
528a : a9 00 __ LDA #$00
528c : ed 79 6c SBC $6c79 ; (vdc_state + 6)
528f : aa __ __ TAX
5290 : 98 __ __ TYA
5291 : 18 __ __ CLC
5292 : 69 06 __ ADC #$06
5294 : 85 44 __ STA T4 + 0 
5296 : 90 01 __ BCC $5299 ; (viewport_demo.s1027 + 0)
.s1026:
5298 : e8 __ __ INX
.s1027:
5299 : 86 45 __ STX T4 + 1 
529b : ad ad bf LDA $bfad ; (bigfont + 146)
529e : c5 45 __ CMP T4 + 1 
52a0 : d0 05 __ BNE $52a7 ; (viewport_demo.s1017 + 0)
.s1016:
52a2 : ad ac bf LDA $bfac ; (bigfont + 145)
52a5 : c5 44 __ CMP T4 + 0 
.s1017:
52a7 : b0 06 __ BCS $52af ; (viewport_demo.s16 + 0)
.s14:
52a9 : a5 43 __ LDA T1 + 0 
52ab : 09 04 __ ORA #$04
52ad : 85 43 __ STA T1 + 0 
.s16:
52af : a5 53 __ LDA T0 + 0 
52b1 : c9 41 __ CMP #$41
52b3 : f0 04 __ BEQ $52b9 ; (viewport_demo.s22 + 0)
.s23:
52b5 : c9 9d __ CMP #$9d
52b7 : d0 0e __ BNE $52c7 ; (viewport_demo.s21 + 0)
.s22:
52b9 : ad aa bf LDA $bfaa ; (bigfont + 143)
52bc : 0d ab bf ORA $bfab ; (bigfont + 144)
52bf : f0 06 __ BEQ $52c7 ; (viewport_demo.s21 + 0)
.s19:
52c1 : a5 43 __ LDA T1 + 0 
52c3 : 09 01 __ ORA #$01
52c5 : 85 43 __ STA T1 + 0 
.s21:
52c7 : a5 53 __ LDA T0 + 0 
52c9 : c9 44 __ CMP #$44
52cb : f0 04 __ BEQ $52d1 ; (viewport_demo.s27 + 0)
.s28:
52cd : c9 1d __ CMP #$1d
52cf : d0 24 __ BNE $52f5 ; (viewport_demo.s26 + 0)
.s27:
52d1 : a6 55 __ LDX T3 + 0 
52d3 : bd fa 67 LDA $67fa,x ; (screenset + 0)
52d6 : 38 __ __ SEC
52d7 : e9 47 __ SBC #$47
52d9 : 85 44 __ STA T4 + 0 
52db : a9 00 __ LDA #$00
52dd : e9 00 __ SBC #$00
52df : 85 45 __ STA T4 + 1 
52e1 : ad ab bf LDA $bfab ; (bigfont + 144)
52e4 : c5 45 __ CMP T4 + 1 
52e6 : d0 05 __ BNE $52ed ; (viewport_demo.s1007 + 0)
.s1006:
52e8 : ad aa bf LDA $bfaa ; (bigfont + 143)
52eb : c5 44 __ CMP T4 + 0 
.s1007:
52ed : b0 06 __ BCS $52f5 ; (viewport_demo.s26 + 0)
.s24:
52ef : a5 43 __ LDA T1 + 0 
52f1 : 09 02 __ ORA #$02
52f3 : 90 04 __ BCC $52f9 ; (viewport_demo.s29 + 0)
.s26:
52f5 : a5 43 __ LDA T1 + 0 
52f7 : f0 10 __ BEQ $5309 ; (viewport_demo.s31 + 0)
.s29:
52f9 : 8d f9 bf STA $bff9 ; (sstack + 2)
52fc : a9 a3 __ LDA #$a3
52fe : 8d f7 bf STA $bff7 ; (sstack + 0)
5301 : a9 bf __ LDA #$bf
5303 : 8d f8 bf STA $bff8 ; (sstack + 1)
5306 : 20 d5 54 JSR $54d5 ; (vdcwin_viewportscroll.s1000 + 0)
.s31:
5309 : a5 53 __ LDA T0 + 0 
530b : c9 1b __ CMP #$1b
530d : f0 07 __ BEQ $5316 ; (viewport_demo.s8 + 0)
.s32:
530f : c9 03 __ CMP #$03
5311 : f0 03 __ BEQ $5316 ; (viewport_demo.s8 + 0)
5313 : 4c 54 52 JMP $5254 ; (viewport_demo.l7 + 0)
.s8:
5316 : a9 01 __ LDA #$01
5318 : 8d fd bf STA $bffd ; (sstack + 6)
531b : a9 00 __ LDA #$00
531d : 8d fe bf STA $bffe ; (sstack + 7)
5320 : ad ff bf LDA $bfff ; (sstack + 8)
5323 : 8d fc bf STA $bffc ; (sstack + 5)
5326 : 20 2c 53 JSR $532c ; (screen_switch.s1000 + 0)
5329 : 4c af 51 JMP $51af ; (viewport_demo.s1001 + 0)
--------------------------------------------------------------------
screen_switch: ; screen_switch(u8,u8,u8)->u8
.s1000:
532c : a5 53 __ LDA T1 + 0 
532e : 8d dc bf STA $bfdc ; (bigfont + 193)
5331 : a5 54 __ LDA T2 + 0 
5333 : 8d dd bf STA $bfdd ; (bigfont + 194)
5336 : a5 55 __ LDA T3 + 0 
5338 : 8d de bf STA $bfde ; (bigfont + 195)
.s0:
533b : ae 78 6c LDX $6c78 ; (vdc_state + 5)
533e : ca __ __ DEX
533f : ca __ __ DEX
5340 : 86 15 __ STX P8 
5342 : 20 36 67 JSR $6736 ; (vdc_clear@proxy + 0)
5345 : a9 1f __ LDA #$1f
5347 : 85 11 __ STA P4 
5349 : a9 54 __ LDA #$54
534b : 85 12 __ STA P5 
534d : 20 fd 66 JSR $66fd ; (vdc_prints_attr@proxy + 0)
5350 : a9 01 __ LDA #$01
5352 : 85 53 __ STA T1 + 0 
5354 : a9 00 __ LDA #$00
5356 : cd fc bf CMP $bffc ; (sstack + 5)
5359 : 2a __ __ ROL
535a : 85 55 __ STA T3 + 0 
535c : d0 07 __ BNE $5365 ; (screen_switch.s2 + 0)
.s5:
535e : ad fc bf LDA $bffc ; (sstack + 5)
5361 : c9 02 __ CMP #$02
5363 : d0 6f __ BNE $53d4 ; (screen_switch.s4 + 0)
.s2:
5365 : 20 e1 14 JSR $14e1 ; (sid_resetsid.s0 + 0)
5368 : ad fe 3e LDA $3efe ; (bootdevice + 0)
536b : 85 54 __ STA T2 + 0 
536d : 85 0f __ STA P2 
536f : a9 00 __ LDA #$00
5371 : 85 10 __ STA P3 
5373 : a9 40 __ LDA #$40
5375 : 85 11 __ STA P4 
5377 : ad fd bf LDA $bffd ; (sstack + 6)
537a : f0 07 __ BEQ $5383 ; (screen_switch.s7 + 0)
.s6:
537c : a9 2f __ LDA #$2f
537e : a0 ad __ LDY #$ad
5380 : 4c ba 53 JMP $53ba ; (screen_switch.s32 + 0)
.s7:
5383 : a5 55 __ LDA T3 + 0 
5385 : d0 64 __ BNE $53eb ; (screen_switch.s12 + 0)
.s13:
5387 : a9 80 __ LDA #$80
5389 : 85 12 __ STA P5 
538b : a9 54 __ LDA #$54
538d : 85 13 __ STA P6 
538f : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
5392 : a5 1b __ LDA ACCU + 0 
5394 : d0 05 __ BNE $539b ; (screen_switch.s24 + 0)
.s22:
5396 : 20 b5 2f JSR $2fb5 ; (menu_fileerrormessage.s1000 + 0)
5399 : c6 53 __ DEC T1 + 0 
.s24:
539b : a9 04 __ LDA #$04
539d : 85 10 __ STA P3 
539f : a9 88 __ LDA #$88
53a1 : 85 11 __ STA P4 
53a3 : a9 54 __ LDA #$54
53a5 : 85 12 __ STA P5 
53a7 : 20 e6 66 JSR $66e6 ; (vdc_prints_attr@proxy + 0)
53aa : a5 54 __ LDA T2 + 0 
53ac : 85 0f __ STA P2 
53ae : a9 00 __ LDA #$00
53b0 : 85 10 __ STA P3 
53b2 : a9 a0 __ LDA #$a0
53b4 : 85 11 __ STA P4 
53b6 : a9 54 __ LDA #$54
53b8 : a0 99 __ LDY #$99
.s32:
53ba : 84 12 __ STY P5 
53bc : 85 13 __ STA P6 
53be : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
53c1 : a5 1b __ LDA ACCU + 0 
53c3 : d0 0c __ BNE $53d1 ; (screen_switch.s38 + 0)
.s9:
53c5 : 20 b5 2f JSR $2fb5 ; (menu_fileerrormessage.s1000 + 0)
53c8 : 20 e1 14 JSR $14e1 ; (sid_resetsid.s0 + 0)
53cb : a9 00 __ LDA #$00
53cd : 85 53 __ STA T1 + 0 
53cf : f0 03 __ BEQ $53d4 ; (screen_switch.s4 + 0)
.s38:
53d1 : 20 e1 14 JSR $14e1 ; (sid_resetsid.s0 + 0)
.s4:
53d4 : 20 1f 67 JSR $671f ; (vdc_clear@proxy + 0)
53d7 : a5 53 __ LDA T1 + 0 
53d9 : 85 1b __ STA ACCU + 0 
.s1001:
53db : ad dc bf LDA $bfdc ; (bigfont + 193)
53de : 85 53 __ STA T1 + 0 
53e0 : ad dd bf LDA $bfdd ; (bigfont + 194)
53e3 : 85 54 __ STA T2 + 0 
53e5 : ad de bf LDA $bfde ; (bigfont + 195)
53e8 : 85 55 __ STA T3 + 0 
53ea : 60 __ __ RTS
.s12:
53eb : a9 34 __ LDA #$34
53ed : 85 12 __ STA P5 
53ef : a9 54 __ LDA #$54
53f1 : 85 13 __ STA P6 
53f3 : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
53f6 : a5 1b __ LDA ACCU + 0 
53f8 : d0 05 __ BNE $53ff ; (screen_switch.s34 + 0)
.s15:
53fa : 20 b5 2f JSR $2fb5 ; (menu_fileerrormessage.s1000 + 0)
53fd : c6 53 __ DEC T1 + 0 
.s34:
53ff : ad fe bf LDA $bffe ; (sstack + 7)
5402 : d0 cd __ BNE $53d1 ; (screen_switch.s38 + 0)
.s18:
5404 : 85 0f __ STA P2 
5406 : ae 78 6c LDX $6c78 ; (vdc_state + 5)
5409 : ca __ __ DEX
540a : 86 10 __ STX P3 
540c : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
540f : 85 13 __ STA P6 
5411 : a9 3c __ LDA #$3c
5413 : 85 11 __ STA P4 
5415 : a9 54 __ LDA #$54
5417 : 85 12 __ STA P5 
5419 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
541c : 4c d1 53 JMP $53d1 ; (screen_switch.s38 + 0)
--------------------------------------------------------------------
541f : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 53 43 52 45 45 4e 20 44 : lOADING SCREEN D
542f : __ __ __ BYT 41 54 41 2e 00                                  : ATA..
--------------------------------------------------------------------
5434 : __ __ __ BYT 53 43 52 45 45 4e 31 00                         : SCREEN1.
--------------------------------------------------------------------
543c : __ __ __ BYT 70 45 54 53 43 49 49 20 41 52 54 20 43 52 45 44 : pETSCII ART CRED
544c : __ __ __ BYT 49 54 3a 20 27 6c 4f 56 45 20 49 53 20 54 48 45 : IT: 'lOVE IS THE
545c : __ __ __ BYT 20 44 52 55 47 27 20 61 54 4c 41 4e 54 49 53 2c :  DRUG' aTLANTIS,
546c : __ __ __ BYT 20 32 30 32 33 2c 20 61 52 54 20 42 59 20 6c 4f :  2023, aRT BY lO
547c : __ __ __ BYT 42 4f 2e 00                                     : BO..
--------------------------------------------------------------------
5480 : __ __ __ BYT 53 43 52 45 45 4e 33 00                         : SCREEN3.
--------------------------------------------------------------------
5488 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 43 48 41 52 53 45 54 2e : lOADING CHARSET.
5498 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
5499 : __ __ __ BYT 43 48 41 52 53 31 00                            : CHARS1.
--------------------------------------------------------------------
54a0 : __ __ __ BYT 6d 4f 56 45 20 42 59 20 77 2c 61 2c 73 2c 64 20 : mOVE BY w,a,s,d 
54b0 : __ __ __ BYT 4f 52 20 43 55 52 53 4f 52 20 4b 45 59 53 2e 20 : OR CURSOR KEYS. 
54c0 : __ __ __ BYT 65 73 63 20 4f 52 20 73 74 6f 70 20 54 4f 20 45 : esc OR stop TO E
54d0 : __ __ __ BYT 58 49 54 2e 00                                  : XIT..
--------------------------------------------------------------------
vdcwin_viewportscroll: ; vdcwin_viewportscroll(struct VDCViewport*,u8)->void
.s1000:
54d5 : a5 53 __ LDA T2 + 0 
54d7 : 8d cd bf STA $bfcd ; (bigfont + 178)
.s0:
54da : ad f7 bf LDA $bff7 ; (sstack + 0)
54dd : 85 50 __ STA T0 + 0 
54df : ad f8 bf LDA $bff8 ; (sstack + 1)
54e2 : 85 51 __ STA T0 + 1 
54e4 : a0 14 __ LDY #$14
.l1002:
54e6 : b1 50 __ LDA (T0 + 0),y 
54e8 : 99 d1 bf STA $bfd1,y ; (bigfont + 182)
54eb : 88 __ __ DEY
54ec : 10 f8 __ BPL $54e6 ; (vdcwin_viewportscroll.l1002 + 0)
.s1003:
54ee : ad f9 bf LDA $bff9 ; (sstack + 2)
54f1 : 85 53 __ STA T2 + 0 
54f3 : 4a __ __ LSR
54f4 : 90 45 __ BCC $553b ; (vdcwin_viewportscroll.s14 + 0)
.s1:
54f6 : a5 50 __ LDA T0 + 0 
54f8 : 69 0a __ ADC #$0a
54fa : 85 16 __ STA P9 
54fc : a5 51 __ LDA T0 + 1 
54fe : 69 00 __ ADC #$00
5500 : 85 17 __ STA P10 
5502 : 20 53 56 JSR $5653 ; (vdcwin_scroll_right.s1000 + 0)
5505 : a9 01 __ LDA #$01
5507 : 85 11 __ STA P4 
5509 : a0 0b __ LDY #$0b
550b : b1 50 __ LDA (T0 + 0),y 
550d : 85 0f __ STA P2 
550f : c8 __ __ INY
5510 : b1 50 __ LDA (T0 + 0),y 
5512 : 85 10 __ STA P3 
5514 : a0 0e __ LDY #$0e
5516 : b1 50 __ LDA (T0 + 0),y 
5518 : 85 12 __ STA P5 
551a : ad d8 bf LDA $bfd8 ; (bigfont + 189)
551d : 18 __ __ CLC
551e : 69 ff __ ADC #$ff
5520 : 8d d8 bf STA $bfd8 ; (bigfont + 189)
5523 : b0 03 __ BCS $5528 ; (vdcwin_viewportscroll.s1005 + 0)
.s1004:
5525 : ce d9 bf DEC $bfd9 ; (bigfont + 190)
.s1005:
5528 : 18 __ __ CLC
5529 : a0 07 __ LDY #$07
552b : b1 50 __ LDA (T0 + 0),y 
552d : 69 ff __ ADC #$ff
552f : 91 50 __ STA (T0 + 0),y 
5531 : c8 __ __ INY
5532 : b1 50 __ LDA (T0 + 0),y 
5534 : 69 ff __ ADC #$ff
5536 : 91 50 __ STA (T0 + 0),y 
5538 : 20 f7 31 JSR $31f7 ; (vdcwin_init@proxy + 0)
.s14:
553b : a5 53 __ LDA T2 + 0 
553d : 29 02 __ AND #$02
553f : f0 58 __ BEQ $5599 ; (vdcwin_viewportscroll.s15 + 0)
.s4:
5541 : 18 __ __ CLC
5542 : a5 50 __ LDA T0 + 0 
5544 : 69 0b __ ADC #$0b
5546 : 85 16 __ STA P9 
5548 : a5 51 __ LDA T0 + 1 
554a : 69 00 __ ADC #$00
554c : 85 17 __ STA P10 
554e : 20 5d 57 JSR $575d ; (vdcwin_scroll_left.s0 + 0)
5551 : a9 01 __ LDA #$01
5553 : 85 11 __ STA P4 
5555 : a0 0c __ LDY #$0c
5557 : b1 50 __ LDA (T0 + 0),y 
5559 : 85 10 __ STA P3 
555b : a0 0e __ LDY #$0e
555d : b1 50 __ LDA (T0 + 0),y 
555f : 85 12 __ STA P5 
5561 : 88 __ __ DEY
5562 : b1 50 __ LDA (T0 + 0),y 
5564 : 85 43 __ STA T1 + 0 
5566 : 18 __ __ CLC
5567 : 6d d8 bf ADC $bfd8 ; (bigfont + 189)
556a : 8d d8 bf STA $bfd8 ; (bigfont + 189)
556d : 90 03 __ BCC $5572 ; (vdcwin_viewportscroll.s1007 + 0)
.s1006:
556f : ee d9 bf INC $bfd9 ; (bigfont + 190)
.s1007:
5572 : 18 __ __ CLC
5573 : a0 07 __ LDY #$07
5575 : b1 50 __ LDA (T0 + 0),y 
5577 : 69 01 __ ADC #$01
5579 : 91 50 __ STA (T0 + 0),y 
557b : c8 __ __ INY
557c : b1 50 __ LDA (T0 + 0),y 
557e : 69 00 __ ADC #$00
5580 : 91 50 __ STA (T0 + 0),y 
5582 : a9 dc __ LDA #$dc
5584 : 85 0d __ STA P0 
5586 : a9 bf __ LDA #$bf
5588 : 85 0e __ STA P1 
558a : a0 0b __ LDY #$0b
558c : b1 50 __ LDA (T0 + 0),y 
558e : 18 __ __ CLC
558f : 65 43 __ ADC T1 + 0 
5591 : 38 __ __ SEC
5592 : e9 01 __ SBC #$01
5594 : 85 0f __ STA P2 
5596 : 20 ff 31 JSR $31ff ; (vdcwin_init.s0 + 0)
.s15:
5599 : a5 53 __ LDA T2 + 0 
559b : 29 08 __ AND #$08
559d : f0 45 __ BEQ $55e4 ; (vdcwin_viewportscroll.s16 + 0)
.s7:
559f : 18 __ __ CLC
55a0 : a5 50 __ LDA T0 + 0 
55a2 : 69 0b __ ADC #$0b
55a4 : 85 15 __ STA P8 
55a6 : a5 51 __ LDA T0 + 1 
55a8 : 69 00 __ ADC #$00
55aa : 85 16 __ STA P9 
55ac : 20 48 58 JSR $5848 ; (vdcwin_scroll_down.s0 + 0)
55af : a9 01 __ LDA #$01
55b1 : 85 12 __ STA P5 
55b3 : a0 0b __ LDY #$0b
55b5 : b1 50 __ LDA (T0 + 0),y 
55b7 : 85 0f __ STA P2 
55b9 : c8 __ __ INY
55ba : b1 50 __ LDA (T0 + 0),y 
55bc : 85 10 __ STA P3 
55be : c8 __ __ INY
55bf : b1 50 __ LDA (T0 + 0),y 
55c1 : 85 11 __ STA P4 
55c3 : ad da bf LDA $bfda ; (bigfont + 191)
55c6 : 18 __ __ CLC
55c7 : 69 ff __ ADC #$ff
55c9 : 8d da bf STA $bfda ; (bigfont + 191)
55cc : b0 03 __ BCS $55d1 ; (vdcwin_viewportscroll.s1009 + 0)
.s1008:
55ce : ce db bf DEC $bfdb ; (bigfont + 192)
.s1009:
55d1 : 18 __ __ CLC
55d2 : a0 09 __ LDY #$09
55d4 : b1 50 __ LDA (T0 + 0),y 
55d6 : 69 ff __ ADC #$ff
55d8 : 91 50 __ STA (T0 + 0),y 
55da : c8 __ __ INY
55db : b1 50 __ LDA (T0 + 0),y 
55dd : 69 ff __ ADC #$ff
55df : 91 50 __ STA (T0 + 0),y 
55e1 : 20 f7 31 JSR $31f7 ; (vdcwin_init@proxy + 0)
.s16:
55e4 : a5 53 __ LDA T2 + 0 
55e6 : 29 04 __ AND #$04
55e8 : f0 58 __ BEQ $5642 ; (vdcwin_viewportscroll.s12 + 0)
.s10:
55ea : 18 __ __ CLC
55eb : a5 50 __ LDA T0 + 0 
55ed : 69 0b __ ADC #$0b
55ef : 85 15 __ STA P8 
55f1 : a5 51 __ LDA T0 + 1 
55f3 : 69 00 __ ADC #$00
55f5 : 85 16 __ STA P9 
55f7 : 20 45 45 JSR $4545 ; (vdcwin_scroll_up.s0 + 0)
55fa : a9 01 __ LDA #$01
55fc : 85 12 __ STA P5 
55fe : a0 0b __ LDY #$0b
5600 : b1 50 __ LDA (T0 + 0),y 
5602 : 85 0f __ STA P2 
5604 : a0 0d __ LDY #$0d
5606 : b1 50 __ LDA (T0 + 0),y 
5608 : 85 11 __ STA P4 
560a : c8 __ __ INY
560b : b1 50 __ LDA (T0 + 0),y 
560d : 85 43 __ STA T1 + 0 
560f : 18 __ __ CLC
5610 : 6d da bf ADC $bfda ; (bigfont + 191)
5613 : 8d da bf STA $bfda ; (bigfont + 191)
5616 : 90 03 __ BCC $561b ; (vdcwin_viewportscroll.s1011 + 0)
.s1010:
5618 : ee db bf INC $bfdb ; (bigfont + 192)
.s1011:
561b : 18 __ __ CLC
561c : a0 09 __ LDY #$09
561e : b1 50 __ LDA (T0 + 0),y 
5620 : 69 01 __ ADC #$01
5622 : 91 50 __ STA (T0 + 0),y 
5624 : c8 __ __ INY
5625 : b1 50 __ LDA (T0 + 0),y 
5627 : 69 00 __ ADC #$00
5629 : 91 50 __ STA (T0 + 0),y 
562b : a9 dc __ LDA #$dc
562d : 85 0d __ STA P0 
562f : a9 bf __ LDA #$bf
5631 : 85 0e __ STA P1 
5633 : a0 0c __ LDY #$0c
5635 : b1 50 __ LDA (T0 + 0),y 
5637 : 18 __ __ CLC
5638 : 65 43 __ ADC T1 + 0 
563a : 38 __ __ SEC
563b : e9 01 __ SBC #$01
563d : 85 10 __ STA P3 
563f : 20 ff 31 JSR $31ff ; (vdcwin_init.s0 + 0)
.s12:
5642 : a9 d1 __ LDA #$d1
5644 : 85 16 __ STA P9 
5646 : a9 bf __ LDA #$bf
5648 : 85 17 __ STA P10 
564a : 20 36 38 JSR $3836 ; (vdcwin_cpy_viewport.s0 + 0)
.s1001:
564d : ad cd bf LDA $bfcd ; (bigfont + 178)
5650 : 85 53 __ STA T2 + 0 
5652 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_right: ; vdcwin_scroll_right(struct VDCWin*,u8)->void
.s1000:
5653 : a5 53 __ LDA T8 + 0 
5655 : 8d f1 bf STA $bff1 ; (buffer + 10)
5658 : a5 54 __ LDA T8 + 1 
565a : 8d f2 bf STA $bff2 ; (buffer + 11)
.s0:
565d : a0 02 __ LDY #$02
565f : b1 16 __ LDA (P9),y ; (win + 0)
5661 : 38 __ __ SEC
5662 : e9 01 __ SBC #$01
5664 : 85 47 __ STA T2 + 0 
5666 : a9 00 __ LDA #$00
5668 : 85 46 __ STA T1 + 0 
566a : a0 06 __ LDY #$06
566c : b1 16 __ LDA (P9),y ; (win + 0)
566e : 85 48 __ STA T3 + 0 
5670 : c8 __ __ INY
5671 : b1 16 __ LDA (P9),y ; (win + 0)
5673 : 85 49 __ STA T3 + 1 
5675 : c8 __ __ INY
5676 : b1 16 __ LDA (P9),y ; (win + 0)
5678 : 85 4a __ STA T4 + 0 
567a : c8 __ __ INY
567b : b1 16 __ LDA (P9),y ; (win + 0)
567d : 4c 9e 56 JMP $569e ; (vdcwin_scroll_right.l1 + 0)
.s5:
5680 : ad 76 6c LDA $6c76 ; (vdc_state + 3)
5683 : 18 __ __ CLC
5684 : 65 48 __ ADC T3 + 0 
5686 : 85 48 __ STA T3 + 0 
5688 : ad 77 6c LDA $6c77 ; (vdc_state + 4)
568b : 65 49 __ ADC T3 + 1 
568d : 85 49 __ STA T3 + 1 
568f : 18 __ __ CLC
5690 : a5 4a __ LDA T4 + 0 
5692 : 6d 76 6c ADC $6c76 ; (vdc_state + 3)
5695 : 85 4a __ STA T4 + 0 
5697 : a5 4b __ LDA T4 + 1 
5699 : 6d 77 6c ADC $6c77 ; (vdc_state + 4)
569c : e6 46 __ INC T1 + 0 
.l1:
569e : 85 4b __ STA T4 + 1 
56a0 : a5 46 __ LDA T1 + 0 
56a2 : a0 03 __ LDY #$03
56a4 : d1 16 __ CMP (P9),y ; (win + 0)
56a6 : 90 0b __ BCC $56b3 ; (vdcwin_scroll_right.s2 + 0)
.s1001:
56a8 : ad f1 bf LDA $bff1 ; (buffer + 10)
56ab : 85 53 __ STA T8 + 0 
56ad : ad f2 bf LDA $bff2 ; (buffer + 11)
56b0 : 85 54 __ STA T8 + 1 
56b2 : 60 __ __ RTS
.s2:
56b3 : a5 48 __ LDA T3 + 0 
56b5 : 69 01 __ ADC #$01
56b7 : 85 4c __ STA T6 + 0 
56b9 : a5 49 __ LDA T3 + 1 
56bb : 69 00 __ ADC #$00
56bd : 85 4d __ STA T6 + 1 
56bf : 18 __ __ CLC
56c0 : a5 4a __ LDA T4 + 0 
56c2 : 69 01 __ ADC #$01
56c4 : 85 4e __ STA T7 + 0 
56c6 : a5 4b __ LDA T4 + 1 
56c8 : 69 00 __ ADC #$00
56ca : 85 4f __ STA T7 + 1 
56cc : ad 74 6c LDA $6c74 ; (vdc_state + 1)
56cf : d0 0c __ BNE $56dd ; (vdcwin_scroll_right.s7 + 0)
.s9:
56d1 : cc 80 6c CPY $6c80 ; (vdc_state + 13)
56d4 : d0 05 __ BNE $56db ; (vdcwin_scroll_right.s1003 + 0)
.s1002:
56d6 : a9 ff __ LDA #$ff
56d8 : cd 7f 6c CMP $6c7f ; (vdc_state + 12)
.s1003:
56db : 90 4d __ BCC $572a ; (vdcwin_scroll_right.s6 + 0)
.s7:
56dd : a5 48 __ LDA T3 + 0 
56df : 85 11 __ STA P4 
56e1 : a5 49 __ LDA T3 + 1 
56e3 : 85 12 __ STA P5 
56e5 : ad 7f 6c LDA $6c7f ; (vdc_state + 12)
56e8 : 85 53 __ STA T8 + 0 
56ea : 85 0f __ STA P2 
56ec : ad 80 6c LDA $6c80 ; (vdc_state + 13)
56ef : 85 54 __ STA T8 + 1 
56f1 : 85 10 __ STA P3 
56f3 : 20 c9 45 JSR $45c9 ; (vdc_block_copy@proxy + 0)
56f6 : a5 53 __ LDA T8 + 0 
56f8 : 85 11 __ STA P4 
56fa : a5 54 __ LDA T8 + 1 
56fc : 85 12 __ STA P5 
56fe : 20 a7 66 JSR $66a7 ; (vdc_block_copy@proxy + 0)
5701 : a5 53 __ LDA T8 + 0 
5703 : 85 0f __ STA P2 
5705 : a5 54 __ LDA T8 + 1 
5707 : 85 10 __ STA P3 
5709 : a5 4a __ LDA T4 + 0 
570b : 85 11 __ STA P4 
570d : a5 4b __ LDA T4 + 1 
570f : 85 12 __ STA P5 
5711 : 20 d1 45 JSR $45d1 ; (vdc_block_copy.s0 + 0)
5714 : a5 4e __ LDA T7 + 0 
5716 : 85 0f __ STA P2 
5718 : a5 4f __ LDA T7 + 1 
571a : 85 10 __ STA P3 
571c : a5 53 __ LDA T8 + 0 
571e : 85 11 __ STA P4 
5720 : a5 54 __ LDA T8 + 1 
5722 : 85 12 __ STA P5 
5724 : 20 d1 45 JSR $45d1 ; (vdc_block_copy.s0 + 0)
5727 : 4c 80 56 JMP $5680 ; (vdcwin_scroll_right.s5 + 0)
.s6:
572a : a5 48 __ LDA T3 + 0 
572c : 85 10 __ STA P3 
572e : a5 49 __ LDA T3 + 1 
5730 : 85 11 __ STA P4 
5732 : 20 3e 15 JSR $153e ; (bnk_cpyfromvdc@proxy + 0)
5735 : a5 4c __ LDA T6 + 0 
5737 : 85 0f __ STA P2 
5739 : a5 4d __ LDA T6 + 1 
573b : 85 10 __ STA P3 
573d : a5 12 __ LDA P5 
573f : 85 14 __ STA P7 
5741 : 20 1e 14 JSR $141e ; (bnk_cpytovdc@proxy + 0)
5744 : a5 4a __ LDA T4 + 0 
5746 : 85 10 __ STA P3 
5748 : a5 4b __ LDA T4 + 1 
574a : 85 11 __ STA P4 
574c : 20 3e 15 JSR $153e ; (bnk_cpyfromvdc@proxy + 0)
574f : a5 4e __ LDA T7 + 0 
5751 : 85 0f __ STA P2 
5753 : a5 4f __ LDA T7 + 1 
5755 : 85 10 __ STA P3 
5757 : 20 1e 14 JSR $141e ; (bnk_cpytovdc@proxy + 0)
575a : 4c 80 56 JMP $5680 ; (vdcwin_scroll_right.s5 + 0)
--------------------------------------------------------------------
vdcwin_scroll_left: ; vdcwin_scroll_left(struct VDCWin*,u8)->void
.s0:
575d : a0 02 __ LDY #$02
575f : b1 16 __ LDA (P9),y ; (win + 0)
5761 : 38 __ __ SEC
5762 : e9 01 __ SBC #$01
5764 : 85 47 __ STA T2 + 0 
5766 : a0 06 __ LDY #$06
5768 : b1 16 __ LDA (P9),y ; (win + 0)
576a : 85 48 __ STA T3 + 0 
576c : c8 __ __ INY
576d : b1 16 __ LDA (P9),y ; (win + 0)
576f : 85 49 __ STA T3 + 1 
5771 : c8 __ __ INY
5772 : b1 16 __ LDA (P9),y ; (win + 0)
5774 : 85 4a __ STA T4 + 0 
5776 : c8 __ __ INY
5777 : b1 16 __ LDA (P9),y ; (win + 0)
5779 : 85 4b __ STA T4 + 1 
.l62:
577b : ad 00 d6 LDA $d600 
577e : 29 20 __ AND #$20
5780 : f0 f9 __ BEQ $577b ; (vdcwin_scroll_left.l62 + 0)
.s1:
5782 : a9 00 __ LDA #$00
5784 : 85 46 __ STA T1 + 0 
5786 : f0 22 __ BEQ $57aa ; (vdcwin_scroll_left.l4 + 0)
.s8:
5788 : ad 76 6c LDA $6c76 ; (vdc_state + 3)
578b : 18 __ __ CLC
578c : 65 48 __ ADC T3 + 0 
578e : 85 48 __ STA T3 + 0 
5790 : ad 77 6c LDA $6c77 ; (vdc_state + 4)
5793 : 65 49 __ ADC T3 + 1 
5795 : 85 49 __ STA T3 + 1 
5797 : 18 __ __ CLC
5798 : a5 4a __ LDA T4 + 0 
579a : 6d 76 6c ADC $6c76 ; (vdc_state + 3)
579d : 85 4a __ STA T4 + 0 
579f : a5 4b __ LDA T4 + 1 
57a1 : 6d 77 6c ADC $6c77 ; (vdc_state + 4)
57a4 : 85 4b __ STA T4 + 1 
57a6 : e6 46 __ INC T1 + 0 
57a8 : a5 46 __ LDA T1 + 0 
.l4:
57aa : a0 03 __ LDY #$03
57ac : d1 16 __ CMP (P9),y ; (win + 0)
57ae : 90 08 __ BCC $57b8 ; (vdcwin_scroll_left.s5 + 0)
.l14:
57b0 : ad 00 d6 LDA $d600 
57b3 : 29 20 __ AND #$20
57b5 : d0 f9 __ BNE $57b0 ; (vdcwin_scroll_left.l14 + 0)
.s1001:
57b7 : 60 __ __ RTS
.s5:
57b8 : a5 48 __ LDA T3 + 0 
57ba : 69 01 __ ADC #$01
57bc : 85 10 __ STA P3 
57be : 85 11 __ STA P4 
57c0 : a5 49 __ LDA T3 + 1 
57c2 : 69 00 __ ADC #$00
57c4 : 85 12 __ STA P5 
57c6 : 18 __ __ CLC
57c7 : a5 4a __ LDA T4 + 0 
57c9 : 69 01 __ ADC #$01
57cb : 85 4e __ STA T7 + 0 
57cd : a5 4b __ LDA T4 + 1 
57cf : 69 00 __ ADC #$00
57d1 : 85 4f __ STA T7 + 1 
57d3 : ad 74 6c LDA $6c74 ; (vdc_state + 1)
57d6 : d0 0c __ BNE $57e4 ; (vdcwin_scroll_left.s10 + 0)
.s12:
57d8 : cc 80 6c CPY $6c80 ; (vdc_state + 13)
57db : d0 05 __ BNE $57e2 ; (vdcwin_scroll_left.s1003 + 0)
.s1002:
57dd : a9 ff __ LDA #$ff
57df : cd 7f 6c CMP $6c7f ; (vdc_state + 12)
.s1003:
57e2 : 90 35 __ BCC $5819 ; (vdcwin_scroll_left.s9 + 0)
.s10:
57e4 : ad 7f 6c LDA $6c7f ; (vdc_state + 12)
57e7 : 85 4c __ STA T5 + 0 
57e9 : 85 0f __ STA P2 
57eb : ad 80 6c LDA $6c80 ; (vdc_state + 13)
57ee : 85 4d __ STA T5 + 1 
57f0 : 85 10 __ STA P3 
57f2 : 20 c9 45 JSR $45c9 ; (vdc_block_copy@proxy + 0)
57f5 : a5 48 __ LDA T3 + 0 
57f7 : 85 0f __ STA P2 
57f9 : a5 49 __ LDA T3 + 1 
57fb : 85 10 __ STA P3 
57fd : 20 9c 66 JSR $669c ; (vdc_block_copy@proxy + 0)
5800 : a5 4e __ LDA T7 + 0 
5802 : 85 11 __ STA P4 
5804 : a5 4f __ LDA T7 + 1 
5806 : 85 12 __ STA P5 
5808 : 20 a7 66 JSR $66a7 ; (vdc_block_copy@proxy + 0)
580b : a5 4a __ LDA T4 + 0 
580d : 85 0f __ STA P2 
580f : a5 4b __ LDA T4 + 1 
5811 : 85 10 __ STA P3 
5813 : 20 9c 66 JSR $669c ; (vdc_block_copy@proxy + 0)
5816 : 4c 88 57 JMP $5788 ; (vdcwin_scroll_left.s8 + 0)
.s9:
5819 : a5 12 __ LDA P5 
581b : 85 11 __ STA P4 
581d : 20 3e 15 JSR $153e ; (bnk_cpyfromvdc@proxy + 0)
5820 : a5 48 __ LDA T3 + 0 
5822 : 85 0f __ STA P2 
5824 : a5 49 __ LDA T3 + 1 
5826 : 85 10 __ STA P3 
5828 : a5 12 __ LDA P5 
582a : 85 14 __ STA P7 
582c : 20 1e 14 JSR $141e ; (bnk_cpytovdc@proxy + 0)
582f : a5 4e __ LDA T7 + 0 
5831 : 85 10 __ STA P3 
5833 : a5 4f __ LDA T7 + 1 
5835 : 85 11 __ STA P4 
5837 : 20 3e 15 JSR $153e ; (bnk_cpyfromvdc@proxy + 0)
583a : a5 4a __ LDA T4 + 0 
583c : 85 0f __ STA P2 
583e : a5 4b __ LDA T4 + 1 
5840 : 85 10 __ STA P3 
5842 : 20 1e 14 JSR $141e ; (bnk_cpytovdc@proxy + 0)
5845 : 4c 88 57 JMP $5788 ; (vdcwin_scroll_left.s8 + 0)
--------------------------------------------------------------------
vdcwin_scroll_down: ; vdcwin_scroll_down(struct VDCWin*,u8)->void
.s0:
5848 : ad 76 6c LDA $6c76 ; (vdc_state + 3)
584b : 85 49 __ STA T3 + 0 
584d : 85 1b __ STA ACCU + 0 
584f : ad 77 6c LDA $6c77 ; (vdc_state + 4)
5852 : 85 4a __ STA T3 + 1 
5854 : 85 1c __ STA ACCU + 1 
5856 : a0 03 __ LDY #$03
5858 : b1 15 __ LDA (P8),y ; (win + 0)
585a : 20 46 63 JSR $6346 ; (mul16by8 + 0)
585d : a0 06 __ LDY #$06
585f : b1 15 __ LDA (P8),y ; (win + 0)
5861 : 18 __ __ CLC
5862 : 65 05 __ ADC WORK + 2 
5864 : 85 4b __ STA T4 + 0 
5866 : c8 __ __ INY
5867 : b1 15 __ LDA (P8),y ; (win + 0)
5869 : 65 06 __ ADC WORK + 3 
586b : 85 4c __ STA T4 + 1 
586d : c8 __ __ INY
586e : b1 15 __ LDA (P8),y ; (win + 0)
5870 : 18 __ __ CLC
5871 : 65 05 __ ADC WORK + 2 
5873 : 85 47 __ STA T2 + 0 
5875 : c8 __ __ INY
5876 : b1 15 __ LDA (P8),y ; (win + 0)
5878 : 65 06 __ ADC WORK + 3 
587a : 85 48 __ STA T2 + 1 
587c : a9 00 __ LDA #$00
587e : 85 46 __ STA T1 + 0 
5880 : a0 02 __ LDY #$02
5882 : b1 15 __ LDA (P8),y ; (win + 0)
5884 : 85 4d __ STA T6 + 0 
5886 : 4c d5 58 JMP $58d5 ; (vdcwin_scroll_down.l1 + 0)
.s2:
5889 : 38 __ __ SEC
588a : a5 4b __ LDA T4 + 0 
588c : ed 76 6c SBC $6c76 ; (vdc_state + 3)
588f : 85 0f __ STA P2 
5891 : 85 4b __ STA T4 + 0 
5893 : a5 4c __ LDA T4 + 1 
5895 : ed 77 6c SBC $6c77 ; (vdc_state + 4)
5898 : 85 10 __ STA P3 
589a : 85 4c __ STA T4 + 1 
589c : 38 __ __ SEC
589d : a5 0f __ LDA P2 
589f : e5 49 __ SBC T3 + 0 
58a1 : 85 11 __ STA P4 
58a3 : a5 10 __ LDA P3 
58a5 : e5 4a __ SBC T3 + 1 
58a7 : 85 12 __ STA P5 
58a9 : a5 4d __ LDA T6 + 0 
58ab : 85 13 __ STA P6 
58ad : 20 95 66 JSR $6695 ; (vdc_block_copy@proxy + 0)
58b0 : 38 __ __ SEC
58b1 : a5 47 __ LDA T2 + 0 
58b3 : ed 76 6c SBC $6c76 ; (vdc_state + 3)
58b6 : 85 47 __ STA T2 + 0 
58b8 : 85 0f __ STA P2 
58ba : a5 48 __ LDA T2 + 1 
58bc : ed 77 6c SBC $6c77 ; (vdc_state + 4)
58bf : 85 48 __ STA T2 + 1 
58c1 : 85 10 __ STA P3 
58c3 : 38 __ __ SEC
58c4 : a5 0f __ LDA P2 
58c6 : e5 49 __ SBC T3 + 0 
58c8 : 85 11 __ STA P4 
58ca : a5 10 __ LDA P3 
58cc : e5 4a __ SBC T3 + 1 
58ce : 85 12 __ STA P5 
58d0 : 20 d1 45 JSR $45d1 ; (vdc_block_copy.s0 + 0)
58d3 : e6 46 __ INC T1 + 0 
.l1:
58d5 : a0 03 __ LDY #$03
58d7 : b1 15 __ LDA (P8),y ; (win + 0)
58d9 : 38 __ __ SEC
58da : e9 01 __ SBC #$01
58dc : 90 ab __ BCC $5889 ; (vdcwin_scroll_down.s2 + 0)
.s1002:
58de : c5 46 __ CMP T1 + 0 
58e0 : 90 02 __ BCC $58e4 ; (vdcwin_scroll_down.s1001 + 0)
.s1004:
58e2 : d0 a5 __ BNE $5889 ; (vdcwin_scroll_down.s2 + 0)
.s1001:
58e4 : 60 __ __ RTS
--------------------------------------------------------------------
scroll_fullscreen_smooth: ; scroll_fullscreen_smooth(u8)->void
.s1000:
58e5 : a5 53 __ LDA T0 + 0 
58e7 : 8d cd bf STA $bfcd ; (bigfont + 178)
.s0:
58ea : ad ff bf LDA $bfff ; (sstack + 8)
58ed : 85 53 __ STA T0 + 0 
58ef : 8d fc bf STA $bffc ; (sstack + 5)
58f2 : a9 00 __ LDA #$00
58f4 : 8d fd bf STA $bffd ; (sstack + 6)
58f7 : a9 01 __ LDA #$01
58f9 : 8d fe bf STA $bffe ; (sstack + 7)
58fc : 20 2c 53 JSR $532c ; (screen_switch.s1000 + 0)
58ff : a9 7f __ LDA #$7f
5901 : 8d ce bf STA $bfce ; (bigfont + 179)
5904 : a9 00 __ LDA #$00
5906 : 8d cf bf STA $bfcf ; (bigfont + 180)
5909 : a9 40 __ LDA #$40
590b : 8d d0 bf STA $bfd0 ; (bigfont + 181)
590e : a5 53 __ LDA T0 + 0 
5910 : 0a __ __ ASL
5911 : aa __ __ TAX
5912 : bd fa 67 LDA $67fa,x ; (screenset + 0)
5915 : 8d d1 bf STA $bfd1 ; (bigfont + 182)
5918 : bd fb 67 LDA $67fb,x ; (screenset + 1)
591b : 8d d2 bf STA $bfd2 ; (bigfont + 183)
591e : ad 75 6c LDA $6c75 ; (vdc_state + 2)
5921 : 8d f7 bf STA $bff7 ; (sstack + 0)
5924 : a9 ce __ LDA #$ce
5926 : 85 17 __ STA P10 
5928 : a9 bf __ LDA #$bf
592a : 85 18 __ STA P11 
592c : 20 f6 59 JSR $59f6 ; (vdc_softscroll_init.s1000 + 0)
592f : a5 1b __ LDA ACCU + 0 
5931 : d0 17 __ BNE $594a ; (scroll_fullscreen_smooth.l4 + 0)
.s3:
5933 : a9 01 __ LDA #$01
5935 : 8d fd bf STA $bffd ; (sstack + 6)
5938 : 8d fe bf STA $bffe ; (sstack + 7)
593b : ad ff bf LDA $bfff ; (sstack + 8)
593e : 8d fc bf STA $bffc ; (sstack + 5)
5941 : 20 2c 53 JSR $532c ; (screen_switch.s1000 + 0)
.s1001:
5944 : ad cd bf LDA $bfcd ; (bigfont + 178)
5947 : 85 53 __ STA T0 + 0 
5949 : 60 __ __ RTS
.l4:
594a : 20 bf 2a JSR $2abf ; (getch.s0 + 0)
594d : 85 53 __ STA T0 + 0 
594f : c9 57 __ CMP #$57
5951 : f0 04 __ BEQ $5957 ; (scroll_fullscreen_smooth.s6 + 0)
.s9:
5953 : c9 91 __ CMP #$91
5955 : d0 10 __ BNE $5967 ; (scroll_fullscreen_smooth.s8 + 0)
.s6:
5957 : a9 ce __ LDA #$ce
5959 : 85 0d __ STA P0 
595b : a9 bf __ LDA #$bf
595d : 85 0e __ STA P1 
595f : 20 9f 5b JSR $5b9f ; (vdc_softscroll_up.l236 + 0)
5962 : a5 53 __ LDA T0 + 0 
5964 : 4c 6b 59 JMP $596b ; (scroll_fullscreen_smooth.s13 + 0)
.s8:
5967 : c9 53 __ CMP #$53
5969 : f0 04 __ BEQ $596f ; (scroll_fullscreen_smooth.s10 + 0)
.s13:
596b : c9 11 __ CMP #$11
596d : d0 0b __ BNE $597a ; (scroll_fullscreen_smooth.s12 + 0)
.s10:
596f : a9 ce __ LDA #$ce
5971 : 85 0d __ STA P0 
5973 : a9 bf __ LDA #$bf
5975 : 85 0e __ STA P1 
5977 : 20 72 5c JSR $5c72 ; (vdc_softscroll_down.l211 + 0)
.s12:
597a : a5 53 __ LDA T0 + 0 
597c : c9 41 __ CMP #$41
597e : f0 04 __ BEQ $5984 ; (scroll_fullscreen_smooth.s14 + 0)
.s17:
5980 : c9 9d __ CMP #$9d
5982 : d0 0d __ BNE $5991 ; (scroll_fullscreen_smooth.s16 + 0)
.s14:
5984 : a9 ce __ LDA #$ce
5986 : 85 0d __ STA P0 
5988 : a9 bf __ LDA #$bf
598a : 85 0e __ STA P1 
598c : 20 4c 5d JSR $5d4c ; (vdc_softscroll_left.s0 + 0)
598f : a5 53 __ LDA T0 + 0 
.s16:
5991 : c9 44 __ CMP #$44
5993 : f0 04 __ BEQ $5999 ; (scroll_fullscreen_smooth.s18 + 0)
.s21:
5995 : c9 1d __ CMP #$1d
5997 : d0 0e __ BNE $59a7 ; (scroll_fullscreen_smooth.s20 + 0)
.s18:
5999 : a9 ce __ LDA #$ce
599b : 85 0d __ STA P0 
599d : a9 bf __ LDA #$bf
599f : 85 0e __ STA P1 
59a1 : 20 0e 5e JSR $5e0e ; (vdc_softscroll_right.s0 + 0)
59a4 : 4c ab 59 JMP $59ab ; (scroll_fullscreen_smooth.s22 + 0)
.s20:
59a7 : c9 1b __ CMP #$1b
59a9 : f0 06 __ BEQ $59b1 ; (scroll_fullscreen_smooth.s5 + 0)
.s22:
59ab : a5 53 __ LDA T0 + 0 
59ad : c9 03 __ CMP #$03
59af : d0 99 __ BNE $594a ; (scroll_fullscreen_smooth.l4 + 0)
.s5:
59b1 : ad 75 6c LDA $6c75 ; (vdc_state + 2)
59b4 : 85 53 __ STA T0 + 0 
59b6 : 20 87 29 JSR $2987 ; (vdc_cls.s0 + 0)
59b9 : a9 1b __ LDA #$1b
59bb : 8d 00 d6 STA $d600 
.l131:
59be : 2c 00 d6 BIT $d600 
59c1 : 10 fb __ BPL $59be ; (scroll_fullscreen_smooth.l131 + 0)
.s28:
59c3 : a9 00 __ LDA #$00
59c5 : 8d 01 d6 STA $d601 
59c8 : a9 18 __ LDA #$18
59ca : 8d 00 d6 STA $d600 
59cd : ac d7 bf LDY $bfd7 ; (bigfont + 188)
.l133:
59d0 : 2c 00 d6 BIT $d600 
59d3 : 10 fb __ BPL $59d0 ; (scroll_fullscreen_smooth.l133 + 0)
.s33:
59d5 : 8c 01 d6 STY $d601 
59d8 : a9 19 __ LDA #$19
59da : 8d 00 d6 STA $d600 
59dd : ad db bf LDA $bfdb ; (bigfont + 192)
59e0 : 18 __ __ CLC
59e1 : 6d d8 bf ADC $bfd8 ; (bigfont + 189)
.l135:
59e4 : 2c 00 d6 BIT $d600 
59e7 : 10 fb __ BPL $59e4 ; (scroll_fullscreen_smooth.l135 + 0)
.s38:
59e9 : 8d 01 d6 STA $d601 
59ec : a5 53 __ LDA T0 + 0 
59ee : 85 16 __ STA P9 
59f0 : 20 27 2b JSR $2b27 ; (vdc_set_mode.s1000 + 0)
59f3 : 4c 33 59 JMP $5933 ; (scroll_fullscreen_smooth.s3 + 0)
--------------------------------------------------------------------
vdc_softscroll_init: ; vdc_softscroll_init(struct VDCSoftScrollSettings*,u8)->u8
.s1000:
59f6 : a2 03 __ LDX #$03
59f8 : b5 53 __ LDA T3 + 0,x 
59fa : 9d ef bf STA $bfef,x ; (vp_fill + 30)
59fd : ca __ __ DEX
59fe : 10 f8 __ BPL $59f8 ; (vdc_softscroll_init.s1000 + 2)
.s0:
5a00 : a0 04 __ LDY #$04
5a02 : b1 17 __ LDA (P10),y ; (settings + 0)
5a04 : 85 1b __ STA ACCU + 0 
5a06 : a9 00 __ LDA #$00
5a08 : 85 1c __ STA ACCU + 1 
5a0a : 88 __ __ DEY
5a0b : b1 17 __ LDA (P10),y ; (settings + 0)
5a0d : 85 50 __ STA T2 + 0 
5a0f : 20 46 63 JSR $6346 ; (mul16by8 + 0)
5a12 : a5 05 __ LDA WORK + 2 
5a14 : 85 53 __ STA T3 + 0 
5a16 : 0a __ __ ASL
5a17 : aa __ __ TAX
5a18 : a5 06 __ LDA WORK + 3 
5a1a : 85 54 __ STA T3 + 1 
5a1c : 2a __ __ ROL
5a1d : a8 __ __ TAY
5a1e : 8a __ __ TXA
5a1f : 18 __ __ CLC
5a20 : 69 30 __ ADC #$30
5a22 : 85 55 __ STA T4 + 0 
5a24 : 90 01 __ BCC $5a27 ; (vdc_softscroll_init.s1027 + 0)
.s1026:
5a26 : c8 __ __ INY
.s1027:
5a27 : 84 56 __ STY T4 + 1 
5a29 : a9 20 __ LDA #$20
5a2b : c5 56 __ CMP T4 + 1 
5a2d : d0 04 __ BNE $5a33 ; (vdc_softscroll_init.s1025 + 0)
.s1024:
5a2f : a9 00 __ LDA #$00
5a31 : c5 55 __ CMP T4 + 0 
.s1025:
5a33 : b0 08 __ BCS $5a3d ; (vdc_softscroll_init.s4 + 0)
.s5:
5a35 : ad 74 6c LDA $6c74 ; (vdc_state + 1)
5a38 : d0 03 __ BNE $5a3d ; (vdc_softscroll_init.s4 + 0)
5a3a : 4c 9b 5b JMP $5b9b ; (vdc_softscroll_init.s1 + 0)
.s4:
5a3d : a9 e0 __ LDA #$e0
5a3f : c5 56 __ CMP T4 + 1 
5a41 : d0 04 __ BNE $5a47 ; (vdc_softscroll_init.s1023 + 0)
.s1022:
5a43 : a9 00 __ LDA #$00
5a45 : c5 55 __ CMP T4 + 0 
.s1023:
5a47 : b0 03 __ BCS $5a4c ; (vdc_softscroll_init.s3 + 0)
5a49 : 4c 9b 5b JMP $5b9b ; (vdc_softscroll_init.s1 + 0)
.s3:
5a4c : ad f7 bf LDA $bff7 ; (sstack + 0)
5a4f : 85 16 __ STA P9 
5a51 : 20 27 2b JSR $2b27 ; (vdc_set_mode.s1000 + 0)
5a54 : a9 00 __ LDA #$00
5a56 : 8d 7b 6c STA $6c7b ; (vdc_state + 8)
5a59 : 8d 83 6c STA $6c83 ; (vdc_state + 16)
5a5c : 8d 84 6c STA $6c84 ; (vdc_state + 17)
5a5f : 8d 85 6c STA $6c85 ; (vdc_state + 18)
5a62 : a9 20 __ LDA #$20
5a64 : 8d 7c 6c STA $6c7c ; (vdc_state + 9)
5a67 : a9 10 __ LDA #$10
5a69 : 8d 86 6c STA $6c86 ; (vdc_state + 19)
5a6c : a5 53 __ LDA T3 + 0 
5a6e : 8d 7d 6c STA $6c7d ; (vdc_state + 10)
5a71 : 18 __ __ CLC
5a72 : a5 54 __ LDA T3 + 1 
5a74 : 69 20 __ ADC #$20
5a76 : 85 56 __ STA T4 + 1 
5a78 : 8d 7e 6c STA $6c7e ; (vdc_state + 11)
5a7b : 38 __ __ SEC
5a7c : a5 50 __ LDA T2 + 0 
5a7e : ed 76 6c SBC $6c76 ; (vdc_state + 3)
5a81 : 85 50 __ STA T2 + 0 
5a83 : 8d 8b 6c STA $6c8b ; (vdc_state + 24)
5a86 : 20 ad 2c JSR $2cad ; (vdc_set_multab.s0 + 0)
5a89 : 20 87 29 JSR $2987 ; (vdc_cls.s0 + 0)
5a8c : a9 1c __ LDA #$1c
5a8e : 8d 00 d6 STA $d600 
.l290:
5a91 : 2c 00 d6 BIT $d600 
5a94 : 10 fb __ BPL $5a91 ; (vdc_softscroll_init.l290 + 0)
.s13:
5a96 : ad 01 d6 LDA $d601 
5a99 : 29 10 __ AND #$10
5a9b : a2 1c __ LDX #$1c
5a9d : 8e 00 d6 STX $d600 
.l292:
5aa0 : 2c 00 d6 BIT $d600 
5aa3 : 10 fb __ BPL $5aa0 ; (vdc_softscroll_init.l292 + 0)
.s19:
5aa5 : 8d 01 d6 STA $d601 
5aa8 : 20 fd 2c JSR $2cfd ; (vdc_restore_charsets.s0 + 0)
5aab : a9 0c __ LDA #$0c
5aad : 8d 00 d6 STA $d600 
.l294:
5ab0 : 2c 00 d6 BIT $d600 
5ab3 : 10 fb __ BPL $5ab0 ; (vdc_softscroll_init.l294 + 0)
.s25:
5ab5 : a9 20 __ LDA #$20
5ab7 : 8d 01 d6 STA $d601 
5aba : a9 0d __ LDA #$0d
5abc : 8d 00 d6 STA $d600 
.l296:
5abf : 2c 00 d6 BIT $d600 
5ac2 : 10 fb __ BPL $5abf ; (vdc_softscroll_init.l296 + 0)
.s30:
5ac4 : a9 00 __ LDA #$00
5ac6 : 8d 01 d6 STA $d601 
5ac9 : a9 14 __ LDA #$14
5acb : 8d 00 d6 STA $d600 
.l298:
5ace : 2c 00 d6 BIT $d600 
5ad1 : 10 fb __ BPL $5ace ; (vdc_softscroll_init.l298 + 0)
.s35:
5ad3 : a5 56 __ LDA T4 + 1 
5ad5 : 8d 01 d6 STA $d601 
5ad8 : a9 15 __ LDA #$15
5ada : 8d 00 d6 STA $d600 
.l300:
5add : 2c 00 d6 BIT $d600 
5ae0 : 10 fb __ BPL $5add ; (vdc_softscroll_init.l300 + 0)
.s40:
5ae2 : a5 53 __ LDA T3 + 0 
5ae4 : 8d 01 d6 STA $d601 
5ae7 : a9 1b __ LDA #$1b
5ae9 : 8d 00 d6 STA $d600 
.l302:
5aec : 2c 00 d6 BIT $d600 
5aef : 10 fb __ BPL $5aec ; (vdc_softscroll_init.l302 + 0)
.s45:
5af1 : a5 50 __ LDA T2 + 0 
5af3 : 8d 01 d6 STA $d601 
5af6 : a5 53 __ LDA T3 + 0 
5af8 : 85 14 __ STA P7 
5afa : a9 20 __ LDA #$20
5afc : 85 10 __ STA P3 
5afe : a5 54 __ LDA T3 + 1 
5b00 : 85 15 __ STA P8 
5b02 : a0 00 __ LDY #$00
5b04 : 84 0f __ STY P2 
5b06 : b1 17 __ LDA (P10),y ; (settings + 0)
5b08 : 85 11 __ STA P4 
5b0a : c8 __ __ INY
5b0b : b1 17 __ LDA (P10),y ; (settings + 0)
5b0d : 85 50 __ STA T2 + 0 
5b0f : 85 12 __ STA P5 
5b11 : c8 __ __ INY
5b12 : b1 17 __ LDA (P10),y ; (settings + 0)
5b14 : 85 51 __ STA T2 + 1 
5b16 : 85 13 __ STA P6 
5b18 : 20 2e 14 JSR $142e ; (bnk_cpytovdc.s0 + 0)
5b1b : a5 56 __ LDA T4 + 1 
5b1d : 85 10 __ STA P3 
5b1f : a5 14 __ LDA P7 
5b21 : 85 0f __ STA P2 
5b23 : 18 __ __ CLC
5b24 : 65 50 __ ADC T2 + 0 
5b26 : aa __ __ TAX
5b27 : a5 54 __ LDA T3 + 1 
5b29 : 85 15 __ STA P8 
5b2b : 65 51 __ ADC T2 + 1 
5b2d : a8 __ __ TAY
5b2e : 8a __ __ TXA
5b2f : 18 __ __ CLC
5b30 : 69 30 __ ADC #$30
5b32 : 85 12 __ STA P5 
5b34 : 90 01 __ BCC $5b37 ; (vdc_softscroll_init.s1029 + 0)
.s1028:
5b36 : c8 __ __ INY
.s1029:
5b37 : 84 13 __ STY P6 
5b39 : 20 2e 14 JSR $142e ; (bnk_cpytovdc.s0 + 0)
5b3c : a9 00 __ LDA #$00
5b3e : a0 05 __ LDY #$05
5b40 : 91 17 __ STA (P10),y ; (settings + 0)
5b42 : c8 __ __ INY
5b43 : 91 17 __ STA (P10),y ; (settings + 0)
5b45 : c8 __ __ INY
5b46 : 91 17 __ STA (P10),y ; (settings + 0)
5b48 : c8 __ __ INY
5b49 : 91 17 __ STA (P10),y ; (settings + 0)
5b4b : a9 18 __ LDA #$18
5b4d : 8d 00 d6 STA $d600 
.l304:
5b50 : 2c 00 d6 BIT $d600 
5b53 : 10 fb __ BPL $5b50 ; (vdc_softscroll_init.l304 + 0)
.s50:
5b55 : ad 01 d6 LDA $d601 
5b58 : 29 f0 __ AND #$f0
5b5a : a0 09 __ LDY #$09
5b5c : 91 17 __ STA (P10),y ; (settings + 0)
5b5e : a2 19 __ LDX #$19
5b60 : 8e 00 d6 STX $d600 
.l306:
5b63 : 2c 00 d6 BIT $d600 
5b66 : 10 fb __ BPL $5b63 ; (vdc_softscroll_init.l306 + 0)
.s57:
5b68 : ad 01 d6 LDA $d601 
5b6b : 29 0f __ AND #$0f
5b6d : a0 0d __ LDY #$0d
5b6f : 91 17 __ STA (P10),y ; (settings + 0)
5b71 : 8e 00 d6 STX $d600 
.l308:
5b74 : 2c 00 d6 BIT $d600 
5b77 : 10 fb __ BPL $5b74 ; (vdc_softscroll_init.l308 + 0)
.s64:
5b79 : a9 00 __ LDA #$00
5b7b : ae 01 d6 LDX $d601 
5b7e : a0 0b __ LDY #$0b
5b80 : 91 17 __ STA (P10),y ; (settings + 0)
5b82 : c8 __ __ INY
5b83 : 91 17 __ STA (P10),y ; (settings + 0)
5b85 : 8a __ __ TXA
5b86 : 29 f0 __ AND #$f0
5b88 : a0 0a __ LDY #$0a
5b8a : 91 17 __ STA (P10),y ; (settings + 0)
5b8c : a9 01 __ LDA #$01
.s1001:
5b8e : 85 1b __ STA ACCU + 0 
5b90 : a2 03 __ LDX #$03
5b92 : bd ef bf LDA $bfef,x ; (vp_fill + 30)
5b95 : 95 53 __ STA T3 + 0,x 
5b97 : ca __ __ DEX
5b98 : 10 f8 __ BPL $5b92 ; (vdc_softscroll_init.s1001 + 4)
5b9a : 60 __ __ RTS
.s1:
5b9b : a9 00 __ LDA #$00
5b9d : 90 ef __ BCC $5b8e ; (vdc_softscroll_init.s1001 + 0)
--------------------------------------------------------------------
vdc_softscroll_up: ; vdc_softscroll_up(struct VDCSoftScrollSettings*,u8)->void
.l236:
5b9f : ad 00 d6 LDA $d600 
5ba2 : 29 20 __ AND #$20
5ba4 : f0 f9 __ BEQ $5b9f ; (vdc_softscroll_up.l236 + 0)
.l6:
5ba6 : ad 00 d6 LDA $d600 
5ba9 : 29 20 __ AND #$20
5bab : d0 f9 __ BNE $5ba6 ; (vdc_softscroll_up.l6 + 0)
.s1:
5bad : a0 07 __ LDY #$07
5baf : b1 0d __ LDA (P0),y ; (settings + 0)
5bb1 : c9 02 __ CMP #$02
5bb3 : 90 03 __ BCC $5bb8 ; (vdc_softscroll_up.s9 + 0)
5bb5 : 4c 5a 5c JMP $5c5a ; (vdc_softscroll_up.s8 + 0)
.s9:
5bb8 : a0 0c __ LDY #$0c
5bba : b1 0d __ LDA (P0),y ; (settings + 0)
5bbc : d0 01 __ BNE $5bbf ; (vdc_softscroll_up.s16 + 0)
.s1001:
5bbe : 60 __ __ RTS
.s16:
5bbf : aa __ __ TAX
5bc0 : a9 06 __ LDA #$06
5bc2 : a0 07 __ LDY #$07
5bc4 : 91 0d __ STA (P0),y ; (settings + 0)
5bc6 : ca __ __ DEX
5bc7 : 8a __ __ TXA
5bc8 : a0 0c __ LDY #$0c
5bca : 91 0d __ STA (P0),y ; (settings + 0)
5bcc : a0 03 __ LDY #$03
5bce : b1 0d __ LDA (P0),y ; (settings + 0)
5bd0 : 85 1b __ STA ACCU + 0 
5bd2 : 38 __ __ SEC
5bd3 : a0 05 __ LDY #$05
5bd5 : b1 0d __ LDA (P0),y ; (settings + 0)
5bd7 : e5 1b __ SBC ACCU + 0 
5bd9 : 85 43 __ STA T3 + 0 
5bdb : 91 0d __ STA (P0),y ; (settings + 0)
5bdd : c8 __ __ INY
5bde : b1 0d __ LDA (P0),y ; (settings + 0)
5be0 : e9 00 __ SBC #$00
5be2 : 85 44 __ STA T3 + 1 
5be4 : 91 0d __ STA (P0),y ; (settings + 0)
.l242:
5be6 : ad 00 d6 LDA $d600 
5be9 : 29 20 __ AND #$20
5beb : d0 f9 __ BNE $5be6 ; (vdc_softscroll_up.l242 + 0)
.s19:
5bed : a0 07 __ LDY #$07
5bef : b1 0d __ LDA (P0),y ; (settings + 0)
5bf1 : aa __ __ TAX
5bf2 : a0 09 __ LDY #$09
5bf4 : b1 0d __ LDA (P0),y ; (settings + 0)
5bf6 : 85 1b __ STA ACCU + 0 
5bf8 : a9 18 __ LDA #$18
5bfa : 8d 00 d6 STA $d600 
5bfd : 8a __ __ TXA
5bfe : 18 __ __ CLC
5bff : 65 1b __ ADC ACCU + 0 
.l244:
5c01 : 2c 00 d6 BIT $d600 
5c04 : 10 fb __ BPL $5c01 ; (vdc_softscroll_up.l244 + 0)
.s26:
5c06 : 8d 01 d6 STA $d601 
5c09 : ad 7d 6c LDA $6c7d ; (vdc_state + 10)
5c0c : 18 __ __ CLC
5c0d : 65 43 __ ADC T3 + 0 
5c0f : aa __ __ TAX
5c10 : ad 7e 6c LDA $6c7e ; (vdc_state + 11)
5c13 : 65 44 __ ADC T3 + 1 
5c15 : a8 __ __ TAY
5c16 : ad 7b 6c LDA $6c7b ; (vdc_state + 8)
5c19 : 18 __ __ CLC
5c1a : 65 43 __ ADC T3 + 0 
5c1c : 85 43 __ STA T3 + 0 
5c1e : a9 0c __ LDA #$0c
5c20 : 8d 00 d6 STA $d600 
5c23 : ad 7c 6c LDA $6c7c ; (vdc_state + 9)
5c26 : 65 44 __ ADC T3 + 1 
.l246:
5c28 : 2c 00 d6 BIT $d600 
5c2b : 10 fb __ BPL $5c28 ; (vdc_softscroll_up.l246 + 0)
.s32:
5c2d : 8d 01 d6 STA $d601 
5c30 : a9 0d __ LDA #$0d
5c32 : 8d 00 d6 STA $d600 
.l248:
5c35 : 2c 00 d6 BIT $d600 
5c38 : 10 fb __ BPL $5c35 ; (vdc_softscroll_up.l248 + 0)
.s37:
5c3a : a5 43 __ LDA T3 + 0 
5c3c : 8d 01 d6 STA $d601 
5c3f : a9 14 __ LDA #$14
5c41 : 8d 00 d6 STA $d600 
.l250:
5c44 : 2c 00 d6 BIT $d600 
5c47 : 10 fb __ BPL $5c44 ; (vdc_softscroll_up.l250 + 0)
.s42:
5c49 : 8c 01 d6 STY $d601 
5c4c : a9 15 __ LDA #$15
5c4e : 8d 00 d6 STA $d600 
.l239:
5c51 : 2c 00 d6 BIT $d600 
5c54 : 10 fb __ BPL $5c51 ; (vdc_softscroll_up.l239 + 0)
.s427:
5c56 : 8e 01 d6 STX $d601 
5c59 : 60 __ __ RTS
.s8:
5c5a : e9 02 __ SBC #$02
5c5c : 91 0d __ STA (P0),y ; (settings + 0)
5c5e : aa __ __ TAX
5c5f : a0 09 __ LDY #$09
5c61 : b1 0d __ LDA (P0),y ; (settings + 0)
5c63 : 85 1b __ STA ACCU + 0 
5c65 : a9 18 __ LDA #$18
5c67 : 8d 00 d6 STA $d600 
5c6a : 8a __ __ TXA
5c6b : 18 __ __ CLC
5c6c : 65 1b __ ADC ACCU + 0 
5c6e : aa __ __ TAX
5c6f : 4c 51 5c JMP $5c51 ; (vdc_softscroll_up.l239 + 0)
--------------------------------------------------------------------
vdc_softscroll_down: ; vdc_softscroll_down(struct VDCSoftScrollSettings*,u8)->void
.l211:
5c72 : ad 00 d6 LDA $d600 
5c75 : 29 20 __ AND #$20
5c77 : f0 f9 __ BEQ $5c72 ; (vdc_softscroll_down.l211 + 0)
.l6:
5c79 : ad 00 d6 LDA $d600 
5c7c : 29 20 __ AND #$20
5c7e : d0 f9 __ BNE $5c79 ; (vdc_softscroll_down.l6 + 0)
.s1:
5c80 : a0 07 __ LDY #$07
5c82 : b1 0d __ LDA (P0),y ; (settings + 0)
5c84 : aa __ __ TAX
5c85 : 18 __ __ CLC
5c86 : 69 02 __ ADC #$02
5c88 : 91 0d __ STA (P0),y ; (settings + 0)
5c8a : c9 07 __ CMP #$07
5c8c : b0 13 __ BCS $5ca1 ; (vdc_softscroll_down.s8 + 0)
.s9:
5c8e : a0 09 __ LDY #$09
5c90 : 71 0d __ ADC (P0),y ; (settings + 0)
5c92 : aa __ __ TAX
5c93 : a9 18 __ LDA #$18
.s1018:
5c95 : 8d 00 d6 STA $d600 
.l223:
5c98 : 2c 00 d6 BIT $d600 
5c9b : 10 fb __ BPL $5c98 ; (vdc_softscroll_down.l223 + 0)
.s384:
5c9d : 8e 01 d6 STX $d601 
.s1001:
5ca0 : 60 __ __ RTS
.s8:
5ca1 : a0 04 __ LDY #$04
5ca3 : b1 0d __ LDA (P0),y ; (settings + 0)
5ca5 : ed 78 6c SBC $6c78 ; (vdc_state + 5)
5ca8 : a8 __ __ TAY
5ca9 : a9 00 __ LDA #$00
5cab : ed 79 6c SBC $6c79 ; (vdc_state + 6)
5cae : 85 44 __ STA T4 + 1 
5cb0 : 98 __ __ TYA
5cb1 : 38 __ __ SEC
5cb2 : e9 01 __ SBC #$01
5cb4 : 85 43 __ STA T4 + 0 
5cb6 : a0 0c __ LDY #$0c
5cb8 : b1 0d __ LDA (P0),y ; (settings + 0)
5cba : 85 1b __ STA ACCU + 0 
5cbc : a5 44 __ LDA T4 + 1 
5cbe : e9 00 __ SBC #$00
5cc0 : d0 0c __ BNE $5cce ; (vdc_softscroll_down.s11 + 0)
.s1014:
5cc2 : a5 1b __ LDA ACCU + 0 
5cc4 : c5 43 __ CMP T4 + 0 
5cc6 : 90 06 __ BCC $5cce ; (vdc_softscroll_down.s11 + 0)
.s12:
5cc8 : 8a __ __ TXA
5cc9 : a0 07 __ LDY #$07
5ccb : 91 0d __ STA (P0),y ; (settings + 0)
5ccd : 60 __ __ RTS
.s11:
5cce : a9 00 __ LDA #$00
5cd0 : a0 07 __ LDY #$07
5cd2 : 91 0d __ STA (P0),y ; (settings + 0)
5cd4 : 18 __ __ CLC
5cd5 : a5 1b __ LDA ACCU + 0 
5cd7 : 69 01 __ ADC #$01
5cd9 : a0 0c __ LDY #$0c
5cdb : 91 0d __ STA (P0),y ; (settings + 0)
5cdd : a0 03 __ LDY #$03
5cdf : b1 0d __ LDA (P0),y ; (settings + 0)
5ce1 : 18 __ __ CLC
5ce2 : a0 05 __ LDY #$05
5ce4 : 71 0d __ ADC (P0),y ; (settings + 0)
5ce6 : 85 43 __ STA T4 + 0 
5ce8 : 91 0d __ STA (P0),y ; (settings + 0)
5cea : c8 __ __ INY
5ceb : b1 0d __ LDA (P0),y ; (settings + 0)
5ced : 69 00 __ ADC #$00
5cef : 85 44 __ STA T4 + 1 
5cf1 : 91 0d __ STA (P0),y ; (settings + 0)
5cf3 : a0 09 __ LDY #$09
5cf5 : b1 0d __ LDA (P0),y ; (settings + 0)
5cf7 : a2 18 __ LDX #$18
5cf9 : 8e 00 d6 STX $d600 
.l215:
5cfc : 2c 00 d6 BIT $d600 
5cff : 10 fb __ BPL $5cfc ; (vdc_softscroll_down.l215 + 0)
.s18:
5d01 : 8d 01 d6 STA $d601 
5d04 : ad 7d 6c LDA $6c7d ; (vdc_state + 10)
5d07 : 18 __ __ CLC
5d08 : 65 43 __ ADC T4 + 0 
5d0a : aa __ __ TAX
5d0b : ad 7e 6c LDA $6c7e ; (vdc_state + 11)
5d0e : 65 44 __ ADC T4 + 1 
5d10 : a8 __ __ TAY
5d11 : ad 7b 6c LDA $6c7b ; (vdc_state + 8)
5d14 : 18 __ __ CLC
5d15 : 65 43 __ ADC T4 + 0 
5d17 : 85 43 __ STA T4 + 0 
5d19 : a9 0c __ LDA #$0c
5d1b : 8d 00 d6 STA $d600 
5d1e : ad 7c 6c LDA $6c7c ; (vdc_state + 9)
5d21 : 65 44 __ ADC T4 + 1 
.l217:
5d23 : 2c 00 d6 BIT $d600 
5d26 : 10 fb __ BPL $5d23 ; (vdc_softscroll_down.l217 + 0)
.s24:
5d28 : 8d 01 d6 STA $d601 
5d2b : a9 0d __ LDA #$0d
5d2d : 8d 00 d6 STA $d600 
.l219:
5d30 : 2c 00 d6 BIT $d600 
5d33 : 10 fb __ BPL $5d30 ; (vdc_softscroll_down.l219 + 0)
.s29:
5d35 : a5 43 __ LDA T4 + 0 
5d37 : 8d 01 d6 STA $d601 
5d3a : a9 14 __ LDA #$14
5d3c : 8d 00 d6 STA $d600 
.l221:
5d3f : 2c 00 d6 BIT $d600 
5d42 : 10 fb __ BPL $5d3f ; (vdc_softscroll_down.l221 + 0)
.s34:
5d44 : 8c 01 d6 STY $d601 
5d47 : a9 15 __ LDA #$15
5d49 : 4c 95 5c JMP $5c95 ; (vdc_softscroll_down.s1018 + 0)
--------------------------------------------------------------------
vdc_softscroll_left: ; vdc_softscroll_left(struct VDCSoftScrollSettings*,u8)->void
.s0:
5d4c : 18 __ __ CLC
5d4d : a0 08 __ LDY #$08
5d4f : b1 0d __ LDA (P0),y ; (settings + 0)
5d51 : 69 02 __ ADC #$02
5d53 : 91 0d __ STA (P0),y ; (settings + 0)
5d55 : c9 07 __ CMP #$07
5d57 : 90 10 __ BCC $5d69 ; (vdc_softscroll_left.s1019 + 0)
.s1:
5d59 : a0 0d __ LDY #$0d
5d5b : b1 0d __ LDA (P0),y ; (settings + 0)
5d5d : aa __ __ TAX
5d5e : a0 0b __ LDY #$0b
5d60 : b1 0d __ LDA (P0),y ; (settings + 0)
5d62 : d0 18 __ BNE $5d7c ; (vdc_softscroll_left.s4 + 0)
.s5:
5d64 : 8a __ __ TXA
5d65 : a0 08 __ LDY #$08
5d67 : 91 0d __ STA (P0),y ; (settings + 0)
.s1019:
5d69 : 18 __ __ CLC
5d6a : a0 0a __ LDY #$0a
5d6c : 71 0d __ ADC (P0),y ; (settings + 0)
.s1018:
5d6e : a2 19 __ LDX #$19
5d70 : 8e 00 d6 STX $d600 
.l277:
5d73 : 2c 00 d6 BIT $d600 
5d76 : 10 fb __ BPL $5d73 ; (vdc_softscroll_left.l277 + 0)
.s479:
5d78 : 8d 01 d6 STA $d601 
.s1001:
5d7b : 60 __ __ RTS
.s4:
5d7c : 85 1b __ STA ACCU + 0 
5d7e : 8a __ __ TXA
5d7f : 29 01 __ AND #$01
5d81 : a0 08 __ LDY #$08
5d83 : 91 0d __ STA (P0),y ; (settings + 0)
5d85 : 18 __ __ CLC
5d86 : a5 1b __ LDA ACCU + 0 
5d88 : 69 ff __ ADC #$ff
5d8a : a0 0b __ LDY #$0b
5d8c : 91 0d __ STA (P0),y ; (settings + 0)
5d8e : 18 __ __ CLC
5d8f : a0 05 __ LDY #$05
5d91 : b1 0d __ LDA (P0),y ; (settings + 0)
5d93 : 69 ff __ ADC #$ff
5d95 : 85 1b __ STA ACCU + 0 
5d97 : 91 0d __ STA (P0),y ; (settings + 0)
5d99 : c8 __ __ INY
5d9a : b1 0d __ LDA (P0),y ; (settings + 0)
5d9c : 69 ff __ ADC #$ff
5d9e : 85 1c __ STA ACCU + 1 
5da0 : 91 0d __ STA (P0),y ; (settings + 0)
.l265:
5da2 : ad 00 d6 LDA $d600 
5da5 : 29 20 __ AND #$20
5da7 : d0 f9 __ BNE $5da2 ; (vdc_softscroll_left.l265 + 0)
.s7:
5da9 : ad 7d 6c LDA $6c7d ; (vdc_state + 10)
5dac : 18 __ __ CLC
5dad : 65 1b __ ADC ACCU + 0 
5daf : aa __ __ TAX
5db0 : ad 7e 6c LDA $6c7e ; (vdc_state + 11)
5db3 : 65 1c __ ADC ACCU + 1 
5db5 : a8 __ __ TAY
5db6 : ad 7b 6c LDA $6c7b ; (vdc_state + 8)
5db9 : 18 __ __ CLC
5dba : 65 1b __ ADC ACCU + 0 
5dbc : 85 1b __ STA ACCU + 0 
5dbe : a9 0c __ LDA #$0c
5dc0 : 8d 00 d6 STA $d600 
5dc3 : ad 7c 6c LDA $6c7c ; (vdc_state + 9)
5dc6 : 65 1c __ ADC ACCU + 1 
.l267:
5dc8 : 2c 00 d6 BIT $d600 
5dcb : 10 fb __ BPL $5dc8 ; (vdc_softscroll_left.l267 + 0)
.s15:
5dcd : 8d 01 d6 STA $d601 
5dd0 : a9 0d __ LDA #$0d
5dd2 : 8d 00 d6 STA $d600 
.l269:
5dd5 : 2c 00 d6 BIT $d600 
5dd8 : 10 fb __ BPL $5dd5 ; (vdc_softscroll_left.l269 + 0)
.s20:
5dda : a5 1b __ LDA ACCU + 0 
5ddc : 8d 01 d6 STA $d601 
5ddf : a9 14 __ LDA #$14
5de1 : 8d 00 d6 STA $d600 
.l271:
5de4 : 2c 00 d6 BIT $d600 
5de7 : 10 fb __ BPL $5de4 ; (vdc_softscroll_left.l271 + 0)
.s25:
5de9 : 8c 01 d6 STY $d601 
5dec : a9 15 __ LDA #$15
5dee : 8d 00 d6 STA $d600 
.l273:
5df1 : 2c 00 d6 BIT $d600 
5df4 : 10 fb __ BPL $5df1 ; (vdc_softscroll_left.l273 + 0)
.s30:
5df6 : 8e 01 d6 STX $d601 
.l275:
5df9 : ad 00 d6 LDA $d600 
5dfc : 29 20 __ AND #$20
5dfe : f0 f9 __ BEQ $5df9 ; (vdc_softscroll_left.l275 + 0)
.l36:
5e00 : ad 00 d6 LDA $d600 
5e03 : 29 20 __ AND #$20
5e05 : d0 f9 __ BNE $5e00 ; (vdc_softscroll_left.l36 + 0)
.s31:
5e07 : a0 0a __ LDY #$0a
5e09 : b1 0d __ LDA (P0),y ; (settings + 0)
5e0b : 4c 6e 5d JMP $5d6e ; (vdc_softscroll_left.s1018 + 0)
--------------------------------------------------------------------
vdc_softscroll_right: ; vdc_softscroll_right(struct VDCSoftScrollSettings*,u8)->void
.s0:
5e0e : a0 08 __ LDY #$08
5e10 : b1 0d __ LDA (P0),y ; (settings + 0)
5e12 : c9 02 __ CMP #$02
5e14 : 90 03 __ BCC $5e19 ; (vdc_softscroll_right.s2 + 0)
5e16 : 4c e2 5e JMP $5ee2 ; (vdc_softscroll_right.s1 + 0)
.s2:
5e19 : a0 03 __ LDY #$03
5e1b : b1 0d __ LDA (P0),y ; (settings + 0)
5e1d : 38 __ __ SEC
5e1e : ed 76 6c SBC $6c76 ; (vdc_state + 3)
5e21 : 85 43 __ STA T3 + 0 
5e23 : a9 00 __ LDA #$00
5e25 : ed 77 6c SBC $6c77 ; (vdc_state + 4)
5e28 : 85 44 __ STA T3 + 1 
5e2a : a0 0b __ LDY #$0b
5e2c : b1 0d __ LDA (P0),y ; (settings + 0)
5e2e : 85 1b __ STA ACCU + 0 
5e30 : 18 __ __ CLC
5e31 : 69 01 __ ADC #$01
5e33 : aa __ __ TAX
5e34 : a9 00 __ LDA #$00
5e36 : 2a __ __ ROL
5e37 : c5 44 __ CMP T3 + 1 
5e39 : d0 02 __ BNE $5e3d ; (vdc_softscroll_right.s1013 + 0)
.s1012:
5e3b : e4 43 __ CPX T3 + 0 
.s1013:
5e3d : 90 01 __ BCC $5e40 ; (vdc_softscroll_right.s12 + 0)
.s1001:
5e3f : 60 __ __ RTS
.s12:
5e40 : a0 0d __ LDY #$0d
5e42 : b1 0d __ LDA (P0),y ; (settings + 0)
5e44 : 29 01 __ AND #$01
5e46 : 09 06 __ ORA #$06
5e48 : a0 08 __ LDY #$08
5e4a : 91 0d __ STA (P0),y ; (settings + 0)
5e4c : a6 1b __ LDX ACCU + 0 
5e4e : e8 __ __ INX
5e4f : 8a __ __ TXA
5e50 : a0 0b __ LDY #$0b
5e52 : 91 0d __ STA (P0),y ; (settings + 0)
5e54 : a0 05 __ LDY #$05
5e56 : b1 0d __ LDA (P0),y ; (settings + 0)
5e58 : 69 01 __ ADC #$01
5e5a : 85 43 __ STA T3 + 0 
5e5c : 91 0d __ STA (P0),y ; (settings + 0)
5e5e : c8 __ __ INY
5e5f : b1 0d __ LDA (P0),y ; (settings + 0)
5e61 : 69 00 __ ADC #$00
5e63 : 85 44 __ STA T3 + 1 
5e65 : 91 0d __ STA (P0),y ; (settings + 0)
.l251:
5e67 : ad 00 d6 LDA $d600 
5e6a : 29 20 __ AND #$20
5e6c : d0 f9 __ BNE $5e67 ; (vdc_softscroll_right.l251 + 0)
.s15:
5e6e : ad 7d 6c LDA $6c7d ; (vdc_state + 10)
5e71 : 18 __ __ CLC
5e72 : 65 43 __ ADC T3 + 0 
5e74 : aa __ __ TAX
5e75 : ad 7e 6c LDA $6c7e ; (vdc_state + 11)
5e78 : 65 44 __ ADC T3 + 1 
5e7a : a8 __ __ TAY
5e7b : ad 7b 6c LDA $6c7b ; (vdc_state + 8)
5e7e : 18 __ __ CLC
5e7f : 65 43 __ ADC T3 + 0 
5e81 : 85 43 __ STA T3 + 0 
5e83 : a9 0c __ LDA #$0c
5e85 : 8d 00 d6 STA $d600 
5e88 : ad 7c 6c LDA $6c7c ; (vdc_state + 9)
5e8b : 65 44 __ ADC T3 + 1 
.l253:
5e8d : 2c 00 d6 BIT $d600 
5e90 : 10 fb __ BPL $5e8d ; (vdc_softscroll_right.l253 + 0)
.s23:
5e92 : 8d 01 d6 STA $d601 
5e95 : a9 0d __ LDA #$0d
5e97 : 8d 00 d6 STA $d600 
.l255:
5e9a : 2c 00 d6 BIT $d600 
5e9d : 10 fb __ BPL $5e9a ; (vdc_softscroll_right.l255 + 0)
.s28:
5e9f : a5 43 __ LDA T3 + 0 
5ea1 : 8d 01 d6 STA $d601 
5ea4 : a9 14 __ LDA #$14
5ea6 : 8d 00 d6 STA $d600 
.l257:
5ea9 : 2c 00 d6 BIT $d600 
5eac : 10 fb __ BPL $5ea9 ; (vdc_softscroll_right.l257 + 0)
.s33:
5eae : 8c 01 d6 STY $d601 
5eb1 : a9 15 __ LDA #$15
5eb3 : 8d 00 d6 STA $d600 
.l259:
5eb6 : 2c 00 d6 BIT $d600 
5eb9 : 10 fb __ BPL $5eb6 ; (vdc_softscroll_right.l259 + 0)
.s38:
5ebb : 8e 01 d6 STX $d601 
.l261:
5ebe : ad 00 d6 LDA $d600 
5ec1 : 29 20 __ AND #$20
5ec3 : f0 f9 __ BEQ $5ebe ; (vdc_softscroll_right.l261 + 0)
.s39:
5ec5 : a0 08 __ LDY #$08
.s1018:
5ec7 : b1 0d __ LDA (P0),y ; (settings + 0)
5ec9 : aa __ __ TAX
5eca : a0 0a __ LDY #$0a
5ecc : b1 0d __ LDA (P0),y ; (settings + 0)
5ece : 85 1b __ STA ACCU + 0 
5ed0 : a9 19 __ LDA #$19
5ed2 : 8d 00 d6 STA $d600 
5ed5 : 8a __ __ TXA
5ed6 : 18 __ __ CLC
5ed7 : 65 1b __ ADC ACCU + 0 
.l247:
5ed9 : 2c 00 d6 BIT $d600 
5edc : 10 fb __ BPL $5ed9 ; (vdc_softscroll_right.l247 + 0)
.s437:
5ede : 8d 01 d6 STA $d601 
5ee1 : 60 __ __ RTS
.s1:
5ee2 : e9 02 __ SBC #$02
5ee4 : 91 0d __ STA (P0),y ; (settings + 0)
.l246:
5ee6 : ad 00 d6 LDA $d600 
5ee9 : 29 20 __ AND #$20
5eeb : f0 f9 __ BEQ $5ee6 ; (vdc_softscroll_right.l246 + 0)
5eed : 4c c7 5e JMP $5ec7 ; (vdc_softscroll_right.s1018 + 0)
--------------------------------------------------------------------
scroll_bigfont: ; scroll_bigfont()->void
.s1000:
5ef0 : a5 53 __ LDA T0 + 0 
5ef2 : 8d 3c be STA $be3c ; (scroll_bigfont@stack + 0)
5ef5 : a5 54 __ LDA T0 + 1 
5ef7 : 8d 3d be STA $be3d ; (scroll_bigfont@stack + 1)
.s0:
5efa : a9 02 __ LDA #$02
5efc : 85 14 __ STA P7 
5efe : 8d 08 bf STA $bf08 ; (color + 4)
5f01 : a9 00 __ LDA #$00
5f03 : 85 0f __ STA P2 
5f05 : a9 20 __ LDA #$20
5f07 : 85 11 __ STA P4 
5f09 : a9 50 __ LDA #$50
5f0b : 85 13 __ STA P6 
5f0d : a9 0e __ LDA #$0e
5f0f : 8d 04 bf STA $bf04 ; (color + 0)
5f12 : a9 07 __ LDA #$07
5f14 : 8d 05 bf STA $bf05 ; (color + 1)
5f17 : a9 06 __ LDA #$06
5f19 : 8d 06 bf STA $bf06 ; (color + 2)
5f1c : a9 03 __ LDA #$03
5f1e : 8d 07 bf STA $bf07 ; (color + 3)
5f21 : a2 c3 __ LDX #$c3
.l1002:
5f23 : bd ff 6c LDA $6cff,x 
5f26 : 9d 40 be STA $be40,x ; (scroll_bigfont@stack + 4)
5f29 : ca __ __ DEX
5f2a : d0 f7 __ BNE $5f23 ; (scroll_bigfont.l1002 + 0)
.s1003:
5f2c : ad 78 6c LDA $6c78 ; (vdc_state + 5)
5f2f : 85 53 __ STA T0 + 0 
5f31 : 38 __ __ SEC
5f32 : e9 02 __ SBC #$02
5f34 : 85 15 __ STA P8 
5f36 : ad 79 6c LDA $6c79 ; (vdc_state + 6)
5f39 : 85 54 __ STA T0 + 1 
5f3b : 20 9b 29 JSR $299b ; (vdc_clear.s0 + 0)
5f3e : a9 e8 __ LDA #$e8
5f40 : 85 11 __ STA P4 
5f42 : a9 5f __ LDA #$5f
5f44 : 85 12 __ STA P5 
5f46 : 20 fd 66 JSR $66fd ; (vdc_prints_attr@proxy + 0)
5f49 : e6 10 __ INC P3 
5f4b : a9 00 __ LDA #$00
5f4d : 85 11 __ STA P4 
5f4f : a9 60 __ LDA #$60
5f51 : 85 12 __ STA P5 
5f53 : 20 1b 2e JSR $2e1b ; (vdc_prints_attr.s0 + 0)
5f56 : ad fe 3e LDA $3efe ; (bootdevice + 0)
5f59 : 85 0f __ STA P2 
5f5b : a9 5f __ LDA #$5f
5f5d : 85 13 __ STA P6 
5f5f : a9 a0 __ LDA #$a0
5f61 : 85 11 __ STA P4 
5f63 : a9 f6 __ LDA #$f6
5f65 : 85 12 __ STA P5 
5f67 : 20 37 15 JSR $1537 ; (bnk_load@proxy + 0)
5f6a : a5 1b __ LDA ACCU + 0 
5f6c : d0 06 __ BNE $5f74 ; (scroll_bigfont.s5 + 0)
.s3:
5f6e : 20 b5 2f JSR $2fb5 ; (menu_fileerrormessage.s1000 + 0)
5f71 : 4c dd 5f JMP $5fdd ; (scroll_bigfont.s1001 + 0)
.s5:
5f74 : 20 1f 67 JSR $671f ; (vdc_clear@proxy + 0)
5f77 : a9 1b __ LDA #$1b
5f79 : 85 0d __ STA P0 
5f7b : a9 bf __ LDA #$bf
5f7d : 85 10 __ STA P3 
5f7f : a9 bf __ LDA #$bf
5f81 : 85 0e __ STA P1 
5f83 : a9 04 __ LDA #$04
5f85 : 85 0f __ STA P2 
5f87 : 20 3a 60 JSR $603a ; (txtscr_bigfont_init.s0 + 0)
5f8a : 46 54 __ LSR T0 + 1 
5f8c : a9 1b __ LDA #$1b
5f8e : 8d f7 bf STA $bff7 ; (sstack + 0)
5f91 : a9 bf __ LDA #$bf
5f93 : 8d f8 bf STA $bff8 ; (sstack + 1)
5f96 : a9 09 __ LDA #$09
5f98 : 85 17 __ STA P10 
5f9a : a9 bf __ LDA #$bf
5f9c : 85 18 __ STA P11 
5f9e : a9 41 __ LDA #$41
5fa0 : 8d f9 bf STA $bff9 ; (sstack + 2)
5fa3 : a9 be __ LDA #$be
5fa5 : 8d fa bf STA $bffa ; (sstack + 3)
5fa8 : a5 53 __ LDA T0 + 0 
5faa : 6a __ __ ROR
5fab : 38 __ __ SEC
5fac : e9 02 __ SBC #$02
5fae : 8d fb bf STA $bffb ; (sstack + 4)
5fb1 : 20 68 32 JSR $3268 ; (txtscr_scroller_init.s0 + 0)
.l58:
5fb4 : 20 e4 ff JSR $ffe4 
5fb7 : 09 00 __ ORA #$00
5fb9 : d0 f9 __ BNE $5fb4 ; (scroll_bigfont.l58 + 0)
.l10:
5fbb : 20 e4 ff JSR $ffe4 
5fbe : 85 1b __ STA ACCU + 0 
5fc0 : 85 53 __ STA T0 + 0 
5fc2 : a9 00 __ LDA #$00
5fc4 : 85 1c __ STA ACCU + 1 
5fc6 : a9 09 __ LDA #$09
5fc8 : 8d f7 bf STA $bff7 ; (sstack + 0)
5fcb : a9 bf __ LDA #$bf
5fcd : 8d f8 bf STA $bff8 ; (sstack + 1)
5fd0 : 20 e8 60 JSR $60e8 ; (txtscr_scroll_do.s1000 + 0)
5fd3 : a5 53 __ LDA T0 + 0 
5fd5 : c9 1b __ CMP #$1b
5fd7 : f0 04 __ BEQ $5fdd ; (scroll_bigfont.s1001 + 0)
.s12:
5fd9 : c9 03 __ CMP #$03
5fdb : d0 de __ BNE $5fbb ; (scroll_bigfont.l10 + 0)
.s1001:
5fdd : ad 3c be LDA $be3c ; (scroll_bigfont@stack + 0)
5fe0 : 85 53 __ STA T0 + 0 
5fe2 : ad 3d be LDA $be3d ; (scroll_bigfont@stack + 1)
5fe5 : 85 54 __ STA T0 + 1 
5fe7 : 60 __ __ RTS
--------------------------------------------------------------------
5fe8 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 44 41 54 41 2e 00       : lOADING DATA..
--------------------------------------------------------------------
5ff6 : __ __ __ BYT 43 48 41 52 53 32 00                            : CHARS2.
--------------------------------------------------------------------
6000 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 53 43 52 4f 4c 4c 20 70 : lOADING SCROLL p
6010 : __ __ __ BYT 65 74 73 63 69 69 20 46 4f 4e 54 3a 20 27 73 4d : etscii FONT: 'sM
6020 : __ __ __ BYT 41 4c 4c 20 72 4f 55 4e 44 20 66 4f 4e 54 27 20 : ALL rOUND fONT' 
6030 : __ __ __ BYT 42 59 20 63 55 50 49 44 2e 00                   : BY cUPID..
--------------------------------------------------------------------
txtscr_bigfont_init: ; txtscr_bigfont_init(struct TXTSCRBigFont*,u8,u8*,u8,u8,u8,u8,u8*)->void
.s0:
603a : a9 5b __ LDA #$5b
603c : 85 47 __ STA T4 + 0 
603e : a0 00 __ LDY #$00
6040 : 91 0d __ STA (P0),y ; (settings + 0)
6042 : a9 7f __ LDA #$7f
6044 : c8 __ __ INY
6045 : 91 0d __ STA (P0),y ; (settings + 0)
6047 : a9 50 __ LDA #$50
6049 : c8 __ __ INY
604a : 91 0d __ STA (P0),y ; (settings + 0)
604c : a9 00 __ LDA #$00
604e : c8 __ __ INY
604f : 91 0d __ STA (P0),y ; (settings + 0)
6051 : a9 04 __ LDA #$04
6053 : a8 __ __ TAY
6054 : 91 0d __ STA (P0),y ; (settings + 0)
6056 : a9 05 __ LDA #$05
6058 : a8 __ __ TAY
6059 : 91 0d __ STA (P0),y ; (settings + 0)
605b : 18 __ __ CLC
605c : a5 0d __ LDA P0 ; (settings + 0)
605e : 69 06 __ ADC #$06
6060 : 85 44 __ STA T2 + 0 
6062 : a5 0e __ LDA P1 ; (settings + 1)
6064 : 69 00 __ ADC #$00
6066 : 85 45 __ STA T2 + 1 
6068 : a9 00 __ LDA #$00
606a : 85 43 __ STA T1 + 0 
606c : 85 46 __ STA T3 + 0 
.l2:
606e : a5 43 __ LDA T1 + 0 
6070 : 85 1b __ STA ACCU + 0 
6072 : a9 00 __ LDA #$00
6074 : 85 1c __ STA ACCU + 1 
6076 : 85 04 __ STA WORK + 1 
6078 : a9 14 __ LDA #$14
607a : 85 03 __ STA WORK + 0 
607c : 20 b0 63 JSR $63b0 ; (divmod + 0)
607f : a5 05 __ LDA WORK + 2 
6081 : 0a __ __ ASL
6082 : 0a __ __ ASL
6083 : 85 48 __ STA T6 + 0 
6085 : a5 1b __ LDA ACCU + 0 
6087 : 85 49 __ STA T7 + 0 
6089 : 0a __ __ ASL
608a : a8 __ __ TAY
608b : a5 1c __ LDA ACCU + 1 
608d : 2a __ __ ROL
608e : aa __ __ TAX
608f : 98 __ __ TYA
6090 : 18 __ __ CLC
6091 : 65 1b __ ADC ACCU + 0 
6093 : a8 __ __ TAY
6094 : 8a __ __ TXA
6095 : 65 1c __ ADC ACCU + 1 
6097 : 85 1b __ STA ACCU + 0 
6099 : 98 __ __ TYA
609a : 0a __ __ ASL
609b : 26 1b __ ROL ACCU + 0 
609d : 0a __ __ ASL
609e : 26 1b __ ROL ACCU + 0 
60a0 : 0a __ __ ASL
60a1 : 26 1b __ ROL ACCU + 0 
60a3 : 18 __ __ CLC
60a4 : 65 49 __ ADC T7 + 0 
60a6 : 85 49 __ STA T7 + 0 
60a8 : a5 1b __ LDA ACCU + 0 
60aa : 65 1c __ ADC ACCU + 1 
60ac : 06 49 __ ASL T7 + 0 
60ae : 2a __ __ ROL
60af : 06 49 __ ASL T7 + 0 
60b1 : 2a __ __ ROL
60b2 : 06 49 __ ASL T7 + 0 
60b4 : 2a __ __ ROL
60b5 : 06 49 __ ASL T7 + 0 
60b7 : 2a __ __ ROL
60b8 : aa __ __ TAX
60b9 : 18 __ __ CLC
60ba : a5 49 __ LDA T7 + 0 
60bc : 65 48 __ ADC T6 + 0 
60be : a4 46 __ LDY T3 + 0 
60c0 : 91 44 __ STA (T2 + 0),y 
60c2 : 8a __ __ TXA
60c3 : 69 a0 __ ADC #$a0
60c5 : c8 __ __ INY
60c6 : 91 44 __ STA (T2 + 0),y 
60c8 : c8 __ __ INY
60c9 : 84 46 __ STY T3 + 0 
60cb : e6 43 __ INC T1 + 0 
60cd : c6 47 __ DEC T4 + 0 
60cf : d0 9d __ BNE $606e ; (txtscr_bigfont_init.l2 + 0)
.s4:
60d1 : 18 __ __ CLC
60d2 : a5 0d __ LDA P0 ; (settings + 0)
60d4 : 69 bc __ ADC #$bc
60d6 : 85 0d __ STA P0 ; (settings + 0)
60d8 : 90 02 __ BCC $60dc ; (txtscr_bigfont_init.s1007 + 0)
.s1006:
60da : e6 0e __ INC P1 ; (settings + 1)
.s1007:
60dc : a0 00 __ LDY #$00
.l1004:
60de : b1 0f __ LDA (P2),y ; (color + 0)
60e0 : 91 0d __ STA (P0),y ; (settings + 0)
60e2 : c8 __ __ INY
60e3 : c0 05 __ CPY #$05
60e5 : 90 f7 __ BCC $60de ; (txtscr_bigfont_init.l1004 + 0)
.s1001:
60e7 : 60 __ __ RTS
--------------------------------------------------------------------
txtscr_scroll_do: ; txtscr_scroll_do(struct TXTSCRScrollText*)->void
.s1000:
60e8 : a2 09 __ LDX #$09
60ea : b5 53 __ LDA T1 + 0,x 
60ec : 9d ed bf STA $bfed,x ; (vp_fill + 28)
60ef : ca __ __ DEX
60f0 : 10 f8 __ BPL $60ea ; (txtscr_scroll_do.s1000 + 2)
.s0:
60f2 : ad f7 bf LDA $bff7 ; (sstack + 0)
60f5 : 85 50 __ STA T0 + 0 
60f7 : 18 __ __ CLC
60f8 : 69 04 __ ADC #$04
60fa : 85 16 __ STA P9 
60fc : ad f8 bf LDA $bff8 ; (sstack + 1)
60ff : 85 51 __ STA T0 + 1 
6101 : 69 00 __ ADC #$00
6103 : 85 17 __ STA P10 
6105 : 20 5d 57 JSR $575d ; (vdcwin_scroll_left.s0 + 0)
6108 : 4c 12 61 JMP $6112 ; (txtscr_scroll_do.l1 + 0)
.s3:
610b : a0 0e __ LDY #$0e
610d : 91 50 __ STA (T0 + 0),y 
610f : c8 __ __ INY
6110 : 91 50 __ STA (T0 + 0),y 
.l1:
6112 : a0 00 __ LDY #$00
6114 : b1 50 __ LDA (T0 + 0),y 
6116 : 18 __ __ CLC
6117 : a0 0e __ LDY #$0e
6119 : 71 50 __ ADC (T0 + 0),y 
611b : 85 53 __ STA T1 + 0 
611d : a0 01 __ LDY #$01
611f : b1 50 __ LDA (T0 + 0),y 
6121 : a0 0f __ LDY #$0f
6123 : 71 50 __ ADC (T0 + 0),y 
6125 : 85 54 __ STA T1 + 1 
6127 : a0 00 __ LDY #$00
6129 : b1 53 __ LDA (T1 + 0),y 
612b : aa __ __ TAX
612c : f0 dd __ BEQ $610b ; (txtscr_scroll_do.s3 + 0)
.s2:
612e : a0 04 __ LDY #$04
6130 : b1 50 __ LDA (T0 + 0),y 
6132 : 18 __ __ CLC
6133 : a0 06 __ LDY #$06
6135 : 71 50 __ ADC (T0 + 0),y 
6137 : 38 __ __ SEC
6138 : e9 01 __ SBC #$01
613a : 85 53 __ STA T1 + 0 
613c : a0 02 __ LDY #$02
613e : b1 50 __ LDA (T0 + 0),y 
6140 : 85 55 __ STA T2 + 0 
6142 : 18 __ __ CLC
6143 : 69 bc __ ADC #$bc
6145 : 85 58 __ STA T5 + 0 
6147 : c8 __ __ INY
6148 : b1 50 __ LDA (T0 + 0),y 
614a : 85 56 __ STA T2 + 1 
614c : 69 00 __ ADC #$00
614e : 85 59 __ STA T5 + 1 
6150 : 8a __ __ TXA
6151 : 0a __ __ ASL
6152 : aa __ __ TAX
6153 : a9 00 __ LDA #$00
6155 : 85 57 __ STA T4 + 0 
6157 : 2a __ __ ROL
6158 : a8 __ __ TAY
6159 : 8a __ __ TXA
615a : 38 __ __ SEC
615b : e9 40 __ SBC #$40
615d : b0 01 __ BCS $6160 ; (txtscr_scroll_do.s1010 + 0)
.s1009:
615f : 88 __ __ DEY
.s1010:
6160 : 18 __ __ CLC
6161 : 65 55 __ ADC T2 + 0 
6163 : 85 5a __ STA T6 + 0 
6165 : 98 __ __ TYA
6166 : 65 56 __ ADC T2 + 1 
6168 : 85 5b __ STA T6 + 1 
616a : a0 06 __ LDY #$06
616c : b1 5a __ LDA (T6 + 0),y 
616e : aa __ __ TAX
616f : c8 __ __ INY
6170 : b1 5a __ LDA (T6 + 0),y 
6172 : 86 5a __ STX T6 + 0 
6174 : 85 5b __ STA T6 + 1 
6176 : a0 05 __ LDY #$05
6178 : b1 50 __ LDA (T0 + 0),y 
617a : 85 52 __ STA T3 + 0 
617c : a0 10 __ LDY #$10
617e : b1 50 __ LDA (T0 + 0),y 
6180 : 85 5c __ STA T7 + 0 
6182 : 4c c2 61 JMP $61c2 ; (txtscr_scroll_do.l7 + 0)
.s8:
6185 : a0 01 __ LDY #$01
6187 : b1 55 __ LDA (T2 + 0),y 
6189 : 85 0d __ STA P0 
618b : a5 5a __ LDA T6 + 0 
618d : 65 5c __ ADC T7 + 0 
618f : 85 0e __ STA P1 
6191 : a5 5b __ LDA T6 + 1 
6193 : 69 00 __ ADC #$00
6195 : 85 0f __ STA P2 
6197 : 20 16 15 JSR $1516 ; (bnk_readb.s0 + 0)
619a : 85 0f __ STA P2 
619c : a5 53 __ LDA T1 + 0 
619e : 85 0d __ STA P0 
61a0 : a4 57 __ LDY T4 + 0 
61a2 : b1 58 __ LDA (T5 + 0),y 
61a4 : 85 10 __ STA P3 
61a6 : 18 __ __ CLC
61a7 : a5 52 __ LDA T3 + 0 
61a9 : 65 57 __ ADC T4 + 0 
61ab : 85 0e __ STA P1 
61ad : 20 88 34 JSR $3488 ; (vdc_printc.s0 + 0)
61b0 : a5 5a __ LDA T6 + 0 
61b2 : 18 __ __ CLC
61b3 : a0 02 __ LDY #$02
61b5 : 71 55 __ ADC (T2 + 0),y 
61b7 : 85 5a __ STA T6 + 0 
61b9 : a5 5b __ LDA T6 + 1 
61bb : c8 __ __ INY
61bc : 71 55 __ ADC (T2 + 0),y 
61be : 85 5b __ STA T6 + 1 
61c0 : e6 57 __ INC T4 + 0 
.l7:
61c2 : a5 57 __ LDA T4 + 0 
61c4 : a0 05 __ LDY #$05
61c6 : d1 55 __ CMP (T2 + 0),y 
61c8 : 90 bb __ BCC $6185 ; (txtscr_scroll_do.s8 + 0)
.s6:
61ca : ad f7 bf LDA $bff7 ; (sstack + 0)
61cd : 85 50 __ STA T0 + 0 
61cf : ad f8 bf LDA $bff8 ; (sstack + 1)
61d2 : 85 51 __ STA T0 + 1 
61d4 : 18 __ __ CLC
61d5 : a0 10 __ LDY #$10
61d7 : b1 50 __ LDA (T0 + 0),y 
61d9 : 69 01 __ ADC #$01
61db : 85 55 __ STA T2 + 0 
61dd : 91 50 __ STA (T0 + 0),y 
61df : a0 02 __ LDY #$02
61e1 : b1 50 __ LDA (T0 + 0),y 
61e3 : 85 53 __ STA T1 + 0 
61e5 : c8 __ __ INY
61e6 : b1 50 __ LDA (T0 + 0),y 
61e8 : 85 54 __ STA T1 + 1 
61ea : c8 __ __ INY
61eb : b1 53 __ LDA (T1 + 0),y 
61ed : 38 __ __ SEC
61ee : e9 01 __ SBC #$01
61f0 : aa __ __ TAX
61f1 : a9 00 __ LDA #$00
61f3 : e9 00 __ SBC #$00
61f5 : 30 08 __ BMI $61ff ; (txtscr_scroll_do.s11 + 0)
.s1004:
61f7 : c9 00 __ CMP #$00
61f9 : d0 1a __ BNE $6215 ; (txtscr_scroll_do.s1001 + 0)
.s1002:
61fb : e4 55 __ CPX T2 + 0 
61fd : b0 16 __ BCS $6215 ; (txtscr_scroll_do.s1001 + 0)
.s11:
61ff : a9 00 __ LDA #$00
6201 : a0 10 __ LDY #$10
6203 : 91 50 __ STA (T0 + 0),y 
6205 : 18 __ __ CLC
6206 : a0 0e __ LDY #$0e
6208 : b1 50 __ LDA (T0 + 0),y 
620a : 69 01 __ ADC #$01
620c : 91 50 __ STA (T0 + 0),y 
620e : c8 __ __ INY
620f : b1 50 __ LDA (T0 + 0),y 
6211 : 69 00 __ ADC #$00
6213 : 91 50 __ STA (T0 + 0),y 
.s1001:
6215 : a2 09 __ LDX #$09
6217 : bd ed bf LDA $bfed,x ; (vp_fill + 28)
621a : 95 53 __ STA T1 + 0,x 
621c : ca __ __ DEX
621d : 10 f8 __ BPL $6217 ; (txtscr_scroll_do.s1001 + 2)
621f : 60 __ __ RTS
--------------------------------------------------------------------
charset_demo: ; charset_demo()->void
.s1000:
6220 : a5 53 __ LDA T0 + 0 
6222 : 8d ba bf STA $bfba ; (bigfont + 159)
.s0:
6225 : a9 18 __ LDA #$18
6227 : 8d 00 d6 STA $d600 
.l63:
622a : 2c 00 d6 BIT $d600 
622d : 10 fb __ BPL $622a ; (charset_demo.l63 + 0)
.s5:
622f : ad 01 d6 LDA $d601 
6232 : 85 53 __ STA T0 + 0 
6234 : ae 78 6c LDX $6c78 ; (vdc_state + 5)
6237 : ca __ __ DEX
6238 : ca __ __ DEX
6239 : 86 15 __ STX P8 
623b : 20 36 67 JSR $6736 ; (vdc_clear@proxy + 0)
623e : a9 00 __ LDA #$00
6240 : 8d fd bf STA $bffd ; (sstack + 6)
6243 : 8d fe bf STA $bffe ; (sstack + 7)
6246 : a9 02 __ LDA #$02
6248 : 8d fc bf STA $bffc ; (sstack + 5)
624b : 20 2c 53 JSR $532c ; (screen_switch.s1000 + 0)
624e : ad 83 6c LDA $6c83 ; (vdc_state + 16)
6251 : 85 0f __ STA P2 
6253 : a9 7f __ LDA #$7f
6255 : 85 11 __ STA P4 
6257 : a9 01 __ LDA #$01
6259 : 85 15 __ STA P8 
625b : ad 84 6c LDA $6c84 ; (vdc_state + 17)
625e : 85 10 __ STA P3 
6260 : a9 00 __ LDA #$00
6262 : 85 14 __ STA P7 
6264 : 85 12 __ STA P5 
6266 : a9 a0 __ LDA #$a0
6268 : 85 13 __ STA P6 
626a : 20 00 13 JSR $1300 ; (bnk_redef_charset.s0 + 0)
626d : a9 00 __ LDA #$00
626f : 85 0f __ STA P2 
6271 : 8d c0 bf STA $bfc0 ; (bigfont + 165)
6274 : 8d c2 bf STA $bfc2 ; (bigfont + 167)
6277 : 8d c3 bf STA $bfc3 ; (bigfont + 168)
627a : 8d c4 bf STA $bfc4 ; (bigfont + 169)
627d : 8d c5 bf STA $bfc5 ; (bigfont + 170)
6280 : 8d c6 bf STA $bfc6 ; (bigfont + 171)
6283 : a9 7f __ LDA #$7f
6285 : 8d bc bf STA $bfbc ; (bigfont + 161)
6288 : a9 50 __ LDA #$50
628a : 8d bf bf STA $bfbf ; (bigfont + 164)
628d : 85 11 __ STA P4 
628f : a9 19 __ LDA #$19
6291 : 8d c1 bf STA $bfc1 ; (bigfont + 166)
6294 : ad 79 6c LDA $6c79 ; (vdc_state + 6)
6297 : 85 44 __ STA T1 + 1 
6299 : d0 07 __ BNE $62a2 ; (charset_demo.s32 + 0)
.s1004:
629b : a9 19 __ LDA #$19
629d : cd 78 6c CMP $6c78 ; (vdc_state + 5)
62a0 : b0 04 __ BCS $62a6 ; (charset_demo.s33 + 0)
.s32:
62a2 : a9 19 __ LDA #$19
62a4 : d0 02 __ BNE $62a8 ; (charset_demo.s34 + 0)
.s33:
62a6 : a9 17 __ LDA #$17
.s34:
62a8 : 85 12 __ STA P5 
62aa : 46 44 __ LSR T1 + 1 
62ac : a9 00 __ LDA #$00
62ae : 8d bd bf STA $bfbd ; (bigfont + 162)
62b1 : a9 40 __ LDA #$40
62b3 : 8d be bf STA $bfbe ; (bigfont + 163)
62b6 : a9 c7 __ LDA #$c7
62b8 : 85 0d __ STA P0 
62ba : a9 bf __ LDA #$bf
62bc : 85 0e __ STA P1 
62be : ad 78 6c LDA $6c78 ; (vdc_state + 5)
62c1 : 6a __ __ ROR
62c2 : 38 __ __ SEC
62c3 : e9 0a __ SBC #$0a
62c5 : 85 10 __ STA P3 
62c7 : 20 ff 31 JSR $31ff ; (vdcwin_init.s0 + 0)
62ca : a9 bc __ LDA #$bc
62cc : 85 16 __ STA P9 
62ce : a9 bf __ LDA #$bf
62d0 : 85 17 __ STA P10 
62d2 : 20 36 38 JSR $3836 ; (vdcwin_cpy_viewport.s0 + 0)
62d5 : a9 2f __ LDA #$2f
62d7 : 85 0f __ STA P2 
62d9 : a9 1c __ LDA #$1c
62db : 85 11 __ STA P4 
62dd : a9 63 __ LDA #$63
62df : 85 12 __ STA P5 
62e1 : 20 fd 66 JSR $66fd ; (vdc_prints_attr@proxy + 0)
62e4 : e6 10 __ INC P3 
62e6 : a9 46 __ LDA #$46
62e8 : 85 0f __ STA P2 
62ea : 20 f2 66 JSR $66f2 ; (vdc_prints_attr@proxy + 0)
62ed : 20 bf 2a JSR $2abf ; (getch.s0 + 0)
62f0 : a9 18 __ LDA #$18
62f2 : 8d 00 d6 STA $d600 
62f5 : a5 53 __ LDA T0 + 0 
62f7 : 29 f0 __ AND #$f0
.l66:
62f9 : 2c 00 d6 BIT $d600 
62fc : 10 fb __ BPL $62f9 ; (charset_demo.l66 + 0)
.s15:
62fe : 8d 01 d6 STA $d601 
6301 : 20 fd 2c JSR $2cfd ; (vdc_restore_charsets.s0 + 0)
6304 : a9 02 __ LDA #$02
6306 : 8d fc bf STA $bffc ; (sstack + 5)
6309 : a9 01 __ LDA #$01
630b : 8d fd bf STA $bffd ; (sstack + 6)
630e : a9 00 __ LDA #$00
6310 : 8d fe bf STA $bffe ; (sstack + 7)
6313 : 20 2c 53 JSR $532c ; (screen_switch.s1000 + 0)
.s1001:
6316 : ad ba bf LDA $bfba ; (bigfont + 159)
6319 : 85 53 __ STA T0 + 0 
631b : 60 __ __ RTS
--------------------------------------------------------------------
631c : __ __ __ BYT 67 52 41 50 48 49 43 53 20 46 52 4f 4d 20 52 45 : gRAPHICS FROM RE
632c : __ __ __ BYT 44 45 46 49 4e 49 4e 47 20 43 48 41 52 53 45 54 : DEFINING CHARSET
633c : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
633e : __ __ __ BYT 4d 55 53 49 43 25 55 00                         : MUSIC%U.
--------------------------------------------------------------------
mul16by8: ; mul16by8
6346 : a0 00 __ LDY #$00
6348 : 84 06 __ STY WORK + 3 
634a : 4a __ __ LSR
634b : 90 0d __ BCC $635a ; (mul16by8 + 20)
634d : aa __ __ TAX
634e : 18 __ __ CLC
634f : 98 __ __ TYA
6350 : 65 1b __ ADC ACCU + 0 
6352 : a8 __ __ TAY
6353 : a5 06 __ LDA WORK + 3 
6355 : 65 1c __ ADC ACCU + 1 
6357 : 85 06 __ STA WORK + 3 
6359 : 8a __ __ TXA
635a : 06 1b __ ASL ACCU + 0 
635c : 26 1c __ ROL ACCU + 1 
635e : 4a __ __ LSR
635f : b0 ec __ BCS $634d ; (mul16by8 + 7)
6361 : d0 f7 __ BNE $635a ; (mul16by8 + 20)
6363 : 84 05 __ STY WORK + 2 
6365 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
6366 : a0 00 __ LDY #$00
6368 : 84 06 __ STY WORK + 3 
636a : a5 03 __ LDA WORK + 0 
636c : a6 04 __ LDX WORK + 1 
636e : f0 1c __ BEQ $638c ; (mul16 + 38)
6370 : 38 __ __ SEC
6371 : 6a __ __ ROR
6372 : 90 0d __ BCC $6381 ; (mul16 + 27)
6374 : aa __ __ TAX
6375 : 18 __ __ CLC
6376 : 98 __ __ TYA
6377 : 65 1b __ ADC ACCU + 0 
6379 : a8 __ __ TAY
637a : a5 06 __ LDA WORK + 3 
637c : 65 1c __ ADC ACCU + 1 
637e : 85 06 __ STA WORK + 3 
6380 : 8a __ __ TXA
6381 : 06 1b __ ASL ACCU + 0 
6383 : 26 1c __ ROL ACCU + 1 
6385 : 4a __ __ LSR
6386 : 90 f9 __ BCC $6381 ; (mul16 + 27)
6388 : d0 ea __ BNE $6374 ; (mul16 + 14)
638a : a5 04 __ LDA WORK + 1 
638c : 4a __ __ LSR
638d : 90 0d __ BCC $639c ; (mul16 + 54)
638f : aa __ __ TAX
6390 : 18 __ __ CLC
6391 : 98 __ __ TYA
6392 : 65 1b __ ADC ACCU + 0 
6394 : a8 __ __ TAY
6395 : a5 06 __ LDA WORK + 3 
6397 : 65 1c __ ADC ACCU + 1 
6399 : 85 06 __ STA WORK + 3 
639b : 8a __ __ TXA
639c : 06 1b __ ASL ACCU + 0 
639e : 26 1c __ ROL ACCU + 1 
63a0 : 4a __ __ LSR
63a1 : b0 ec __ BCS $638f ; (mul16 + 41)
63a3 : d0 f7 __ BNE $639c ; (mul16 + 54)
63a5 : 84 05 __ STY WORK + 2 
63a7 : 60 __ __ RTS
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
63a8 : a9 0f __ LDA #$0f
63aa : 85 03 __ STA WORK + 0 
63ac : a9 00 __ LDA #$00
63ae : 85 04 __ STA WORK + 1 
--------------------------------------------------------------------
divmod: ; divmod
63b0 : a5 1c __ LDA ACCU + 1 
63b2 : d0 31 __ BNE $63e5 ; (divmod + 53)
63b4 : a5 04 __ LDA WORK + 1 
63b6 : d0 1e __ BNE $63d6 ; (divmod + 38)
63b8 : 85 06 __ STA WORK + 3 
63ba : a2 04 __ LDX #$04
63bc : 06 1b __ ASL ACCU + 0 
63be : 2a __ __ ROL
63bf : c5 03 __ CMP WORK + 0 
63c1 : 90 02 __ BCC $63c5 ; (divmod + 21)
63c3 : e5 03 __ SBC WORK + 0 
63c5 : 26 1b __ ROL ACCU + 0 
63c7 : 2a __ __ ROL
63c8 : c5 03 __ CMP WORK + 0 
63ca : 90 02 __ BCC $63ce ; (divmod + 30)
63cc : e5 03 __ SBC WORK + 0 
63ce : 26 1b __ ROL ACCU + 0 
63d0 : ca __ __ DEX
63d1 : d0 eb __ BNE $63be ; (divmod + 14)
63d3 : 85 05 __ STA WORK + 2 
63d5 : 60 __ __ RTS
63d6 : a5 1b __ LDA ACCU + 0 
63d8 : 85 05 __ STA WORK + 2 
63da : a5 1c __ LDA ACCU + 1 
63dc : 85 06 __ STA WORK + 3 
63de : a9 00 __ LDA #$00
63e0 : 85 1b __ STA ACCU + 0 
63e2 : 85 1c __ STA ACCU + 1 
63e4 : 60 __ __ RTS
63e5 : a5 04 __ LDA WORK + 1 
63e7 : d0 1f __ BNE $6408 ; (divmod + 88)
63e9 : a5 03 __ LDA WORK + 0 
63eb : 30 1b __ BMI $6408 ; (divmod + 88)
63ed : a9 00 __ LDA #$00
63ef : 85 06 __ STA WORK + 3 
63f1 : a2 10 __ LDX #$10
63f3 : 06 1b __ ASL ACCU + 0 
63f5 : 26 1c __ ROL ACCU + 1 
63f7 : 2a __ __ ROL
63f8 : c5 03 __ CMP WORK + 0 
63fa : 90 02 __ BCC $63fe ; (divmod + 78)
63fc : e5 03 __ SBC WORK + 0 
63fe : 26 1b __ ROL ACCU + 0 
6400 : 26 1c __ ROL ACCU + 1 
6402 : ca __ __ DEX
6403 : d0 f2 __ BNE $63f7 ; (divmod + 71)
6405 : 85 05 __ STA WORK + 2 
6407 : 60 __ __ RTS
6408 : a9 00 __ LDA #$00
640a : 85 05 __ STA WORK + 2 
640c : 85 06 __ STA WORK + 3 
640e : 84 02 __ STY $02 
6410 : a0 10 __ LDY #$10
6412 : 18 __ __ CLC
6413 : 26 1b __ ROL ACCU + 0 
6415 : 26 1c __ ROL ACCU + 1 
6417 : 26 05 __ ROL WORK + 2 
6419 : 26 06 __ ROL WORK + 3 
641b : 38 __ __ SEC
641c : a5 05 __ LDA WORK + 2 
641e : e5 03 __ SBC WORK + 0 
6420 : aa __ __ TAX
6421 : a5 06 __ LDA WORK + 3 
6423 : e5 04 __ SBC WORK + 1 
6425 : 90 04 __ BCC $642b ; (divmod + 123)
6427 : 86 05 __ STX WORK + 2 
6429 : 85 06 __ STA WORK + 3 
642b : 88 __ __ DEY
642c : d0 e5 __ BNE $6413 ; (divmod + 99)
642e : 26 1b __ ROL ACCU + 0 
6430 : 26 1c __ ROL ACCU + 1 
6432 : a4 02 __ LDY $02 
6434 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
6435 : 84 02 __ STY $02 
6437 : a0 20 __ LDY #$20
6439 : a9 00 __ LDA #$00
643b : 85 07 __ STA WORK + 4 
643d : 85 08 __ STA WORK + 5 
643f : 85 09 __ STA WORK + 6 
6441 : 85 0a __ STA WORK + 7 
6443 : a5 05 __ LDA WORK + 2 
6445 : 05 06 __ ORA WORK + 3 
6447 : d0 78 __ BNE $64c1 ; (divmod32 + 140)
6449 : a5 04 __ LDA WORK + 1 
644b : d0 27 __ BNE $6474 ; (divmod32 + 63)
644d : 18 __ __ CLC
644e : 26 1b __ ROL ACCU + 0 
6450 : 26 1c __ ROL ACCU + 1 
6452 : 26 1d __ ROL ACCU + 2 
6454 : 26 1e __ ROL ACCU + 3 
6456 : 2a __ __ ROL
6457 : 90 05 __ BCC $645e ; (divmod32 + 41)
6459 : e5 03 __ SBC WORK + 0 
645b : 38 __ __ SEC
645c : b0 06 __ BCS $6464 ; (divmod32 + 47)
645e : c5 03 __ CMP WORK + 0 
6460 : 90 02 __ BCC $6464 ; (divmod32 + 47)
6462 : e5 03 __ SBC WORK + 0 
6464 : 88 __ __ DEY
6465 : d0 e7 __ BNE $644e ; (divmod32 + 25)
6467 : 85 07 __ STA WORK + 4 
6469 : 26 1b __ ROL ACCU + 0 
646b : 26 1c __ ROL ACCU + 1 
646d : 26 1d __ ROL ACCU + 2 
646f : 26 1e __ ROL ACCU + 3 
6471 : a4 02 __ LDY $02 
6473 : 60 __ __ RTS
6474 : a5 1e __ LDA ACCU + 3 
6476 : d0 10 __ BNE $6488 ; (divmod32 + 83)
6478 : a6 1d __ LDX ACCU + 2 
647a : 86 1e __ STX ACCU + 3 
647c : a6 1c __ LDX ACCU + 1 
647e : 86 1d __ STX ACCU + 2 
6480 : a6 1b __ LDX ACCU + 0 
6482 : 86 1c __ STX ACCU + 1 
6484 : 85 1b __ STA ACCU + 0 
6486 : a0 18 __ LDY #$18
6488 : 18 __ __ CLC
6489 : 26 1b __ ROL ACCU + 0 
648b : 26 1c __ ROL ACCU + 1 
648d : 26 1d __ ROL ACCU + 2 
648f : 26 1e __ ROL ACCU + 3 
6491 : 26 07 __ ROL WORK + 4 
6493 : 26 08 __ ROL WORK + 5 
6495 : 90 0c __ BCC $64a3 ; (divmod32 + 110)
6497 : a5 07 __ LDA WORK + 4 
6499 : e5 03 __ SBC WORK + 0 
649b : aa __ __ TAX
649c : a5 08 __ LDA WORK + 5 
649e : e5 04 __ SBC WORK + 1 
64a0 : 38 __ __ SEC
64a1 : b0 0c __ BCS $64af ; (divmod32 + 122)
64a3 : 38 __ __ SEC
64a4 : a5 07 __ LDA WORK + 4 
64a6 : e5 03 __ SBC WORK + 0 
64a8 : aa __ __ TAX
64a9 : a5 08 __ LDA WORK + 5 
64ab : e5 04 __ SBC WORK + 1 
64ad : 90 04 __ BCC $64b3 ; (divmod32 + 126)
64af : 86 07 __ STX WORK + 4 
64b1 : 85 08 __ STA WORK + 5 
64b3 : 88 __ __ DEY
64b4 : d0 d3 __ BNE $6489 ; (divmod32 + 84)
64b6 : 26 1b __ ROL ACCU + 0 
64b8 : 26 1c __ ROL ACCU + 1 
64ba : 26 1d __ ROL ACCU + 2 
64bc : 26 1e __ ROL ACCU + 3 
64be : a4 02 __ LDY $02 
64c0 : 60 __ __ RTS
64c1 : a0 10 __ LDY #$10
64c3 : a5 1e __ LDA ACCU + 3 
64c5 : 85 08 __ STA WORK + 5 
64c7 : a5 1d __ LDA ACCU + 2 
64c9 : 85 07 __ STA WORK + 4 
64cb : a9 00 __ LDA #$00
64cd : 85 1d __ STA ACCU + 2 
64cf : 85 1e __ STA ACCU + 3 
64d1 : 18 __ __ CLC
64d2 : 26 1b __ ROL ACCU + 0 
64d4 : 26 1c __ ROL ACCU + 1 
64d6 : 26 07 __ ROL WORK + 4 
64d8 : 26 08 __ ROL WORK + 5 
64da : 26 09 __ ROL WORK + 6 
64dc : 26 0a __ ROL WORK + 7 
64de : a5 07 __ LDA WORK + 4 
64e0 : c5 03 __ CMP WORK + 0 
64e2 : a5 08 __ LDA WORK + 5 
64e4 : e5 04 __ SBC WORK + 1 
64e6 : a5 09 __ LDA WORK + 6 
64e8 : e5 05 __ SBC WORK + 2 
64ea : a5 0a __ LDA WORK + 7 
64ec : e5 06 __ SBC WORK + 3 
64ee : 90 18 __ BCC $6508 ; (divmod32 + 211)
64f0 : a5 07 __ LDA WORK + 4 
64f2 : e5 03 __ SBC WORK + 0 
64f4 : 85 07 __ STA WORK + 4 
64f6 : a5 08 __ LDA WORK + 5 
64f8 : e5 04 __ SBC WORK + 1 
64fa : 85 08 __ STA WORK + 5 
64fc : a5 09 __ LDA WORK + 6 
64fe : e5 05 __ SBC WORK + 2 
6500 : 85 09 __ STA WORK + 6 
6502 : a5 0a __ LDA WORK + 7 
6504 : e5 06 __ SBC WORK + 3 
6506 : 85 0a __ STA WORK + 7 
6508 : 88 __ __ DEY
6509 : d0 c7 __ BNE $64d2 ; (divmod32 + 157)
650b : 26 1b __ ROL ACCU + 0 
650d : 26 1c __ ROL ACCU + 1 
650f : a4 02 __ LDY $02 
6511 : 60 __ __ RTS
--------------------------------------------------------------------
malloc: ; malloc
6512 : 18 __ __ CLC
6513 : a5 1b __ LDA ACCU + 0 
6515 : 69 02 __ ADC #$02
6517 : 85 03 __ STA WORK + 0 
6519 : a5 1c __ LDA ACCU + 1 
651b : 69 00 __ ADC #$00
651d : 85 04 __ STA WORK + 1 
651f : ad df 6c LDA $6cdf ; (HeapNode + 2)
6522 : d0 1f __ BNE $6543 ; (malloc + 49)
6524 : a9 00 __ LDA #$00
6526 : 8d 90 6e STA $6e90 
6529 : 8d 91 6e STA $6e91 
652c : ee df 6c INC $6cdf ; (HeapNode + 2)
652f : a9 90 __ LDA #$90
6531 : 8d dd 6c STA $6cdd ; (HeapNode + 0)
6534 : a9 6e __ LDA #$6e
6536 : 8d de 6c STA $6cde ; (HeapNode + 1)
6539 : a9 00 __ LDA #$00
653b : 8d 92 6e STA $6e92 
653e : a9 b0 __ LDA #$b0
6540 : 8d 93 6e STA $6e93 
6543 : a9 dd __ LDA #$dd
6545 : a2 6c __ LDX #$6c
6547 : 85 1d __ STA ACCU + 2 
6549 : 86 1e __ STX ACCU + 3 
654b : 18 __ __ CLC
654c : a0 00 __ LDY #$00
654e : b1 1d __ LDA (ACCU + 2),y 
6550 : 85 1b __ STA ACCU + 0 
6552 : 65 03 __ ADC WORK + 0 
6554 : 85 05 __ STA WORK + 2 
6556 : c8 __ __ INY
6557 : b1 1d __ LDA (ACCU + 2),y 
6559 : 85 1c __ STA ACCU + 1 
655b : f0 18 __ BEQ $6575 ; (malloc + 99)
655d : 65 04 __ ADC WORK + 1 
655f : 85 06 __ STA WORK + 3 
6561 : a0 02 __ LDY #$02
6563 : b1 1b __ LDA (ACCU + 0),y 
6565 : c5 05 __ CMP WORK + 2 
6567 : c8 __ __ INY
6568 : b1 1b __ LDA (ACCU + 0),y 
656a : e5 06 __ SBC WORK + 3 
656c : b0 08 __ BCS $6576 ; (malloc + 100)
656e : a5 1b __ LDA ACCU + 0 
6570 : a6 1c __ LDX ACCU + 1 
6572 : 4c 47 65 JMP $6547 ; (malloc + 53)
6575 : 60 __ __ RTS
6576 : 18 __ __ CLC
6577 : a5 05 __ LDA WORK + 2 
6579 : 69 03 __ ADC #$03
657b : 29 fc __ AND #$fc
657d : 85 07 __ STA WORK + 4 
657f : a5 06 __ LDA WORK + 3 
6581 : 69 00 __ ADC #$00
6583 : 85 08 __ STA WORK + 5 
6585 : a0 02 __ LDY #$02
6587 : a5 07 __ LDA WORK + 4 
6589 : d1 1b __ CMP (ACCU + 0),y 
658b : d0 15 __ BNE $65a2 ; (malloc + 144)
658d : c8 __ __ INY
658e : a5 08 __ LDA WORK + 5 
6590 : d1 1b __ CMP (ACCU + 0),y 
6592 : d0 0e __ BNE $65a2 ; (malloc + 144)
6594 : a0 00 __ LDY #$00
6596 : b1 1b __ LDA (ACCU + 0),y 
6598 : 91 1d __ STA (ACCU + 2),y 
659a : c8 __ __ INY
659b : b1 1b __ LDA (ACCU + 0),y 
659d : 91 1d __ STA (ACCU + 2),y 
659f : 4c bf 65 JMP $65bf ; (malloc + 173)
65a2 : a0 00 __ LDY #$00
65a4 : b1 1b __ LDA (ACCU + 0),y 
65a6 : 91 07 __ STA (WORK + 4),y 
65a8 : a5 07 __ LDA WORK + 4 
65aa : 91 1d __ STA (ACCU + 2),y 
65ac : c8 __ __ INY
65ad : b1 1b __ LDA (ACCU + 0),y 
65af : 91 07 __ STA (WORK + 4),y 
65b1 : a5 08 __ LDA WORK + 5 
65b3 : 91 1d __ STA (ACCU + 2),y 
65b5 : c8 __ __ INY
65b6 : b1 1b __ LDA (ACCU + 0),y 
65b8 : 91 07 __ STA (WORK + 4),y 
65ba : c8 __ __ INY
65bb : b1 1b __ LDA (ACCU + 0),y 
65bd : 91 07 __ STA (WORK + 4),y 
65bf : a0 00 __ LDY #$00
65c1 : a5 05 __ LDA WORK + 2 
65c3 : 91 1b __ STA (ACCU + 0),y 
65c5 : c8 __ __ INY
65c6 : a5 06 __ LDA WORK + 3 
65c8 : 91 1b __ STA (ACCU + 0),y 
65ca : a5 1b __ LDA ACCU + 0 
65cc : 09 02 __ ORA #$02
65ce : 85 1b __ STA ACCU + 0 
65d0 : 60 __ __ RTS
--------------------------------------------------------------------
free: ; free
65d1 : a5 1b __ LDA ACCU + 0 
65d3 : 29 fc __ AND #$fc
65d5 : 85 1b __ STA ACCU + 0 
65d7 : 05 1c __ ORA ACCU + 1 
65d9 : d0 01 __ BNE $65dc ; (free + 11)
65db : 60 __ __ RTS
65dc : 18 __ __ CLC
65dd : a0 00 __ LDY #$00
65df : b1 1b __ LDA (ACCU + 0),y 
65e1 : 69 03 __ ADC #$03
65e3 : 29 fc __ AND #$fc
65e5 : 85 1d __ STA ACCU + 2 
65e7 : c8 __ __ INY
65e8 : b1 1b __ LDA (ACCU + 0),y 
65ea : 69 00 __ ADC #$00
65ec : 85 1e __ STA ACCU + 3 
65ee : a9 dd __ LDA #$dd
65f0 : a2 6c __ LDX #$6c
65f2 : 85 05 __ STA WORK + 2 
65f4 : 86 06 __ STX WORK + 3 
65f6 : a0 01 __ LDY #$01
65f8 : b1 05 __ LDA (WORK + 2),y 
65fa : f0 28 __ BEQ $6624 ; (free + 83)
65fc : aa __ __ TAX
65fd : 88 __ __ DEY
65fe : b1 05 __ LDA (WORK + 2),y 
6600 : e4 1e __ CPX ACCU + 3 
6602 : 90 ee __ BCC $65f2 ; (free + 33)
6604 : d0 1e __ BNE $6624 ; (free + 83)
6606 : c5 1d __ CMP ACCU + 2 
6608 : 90 e8 __ BCC $65f2 ; (free + 33)
660a : d0 18 __ BNE $6624 ; (free + 83)
660c : a0 00 __ LDY #$00
660e : b1 1d __ LDA (ACCU + 2),y 
6610 : 91 1b __ STA (ACCU + 0),y 
6612 : c8 __ __ INY
6613 : b1 1d __ LDA (ACCU + 2),y 
6615 : 91 1b __ STA (ACCU + 0),y 
6617 : c8 __ __ INY
6618 : b1 1d __ LDA (ACCU + 2),y 
661a : 91 1b __ STA (ACCU + 0),y 
661c : c8 __ __ INY
661d : b1 1d __ LDA (ACCU + 2),y 
661f : 91 1b __ STA (ACCU + 0),y 
6621 : 4c 39 66 JMP $6639 ; (free + 104)
6624 : a0 00 __ LDY #$00
6626 : b1 05 __ LDA (WORK + 2),y 
6628 : 91 1b __ STA (ACCU + 0),y 
662a : c8 __ __ INY
662b : b1 05 __ LDA (WORK + 2),y 
662d : 91 1b __ STA (ACCU + 0),y 
662f : c8 __ __ INY
6630 : a5 1d __ LDA ACCU + 2 
6632 : 91 1b __ STA (ACCU + 0),y 
6634 : c8 __ __ INY
6635 : a5 1e __ LDA ACCU + 3 
6637 : 91 1b __ STA (ACCU + 0),y 
6639 : a0 02 __ LDY #$02
663b : b1 05 __ LDA (WORK + 2),y 
663d : c5 1b __ CMP ACCU + 0 
663f : d0 1d __ BNE $665e ; (free + 141)
6641 : c8 __ __ INY
6642 : b1 05 __ LDA (WORK + 2),y 
6644 : c5 1c __ CMP ACCU + 1 
6646 : d0 16 __ BNE $665e ; (free + 141)
6648 : a0 00 __ LDY #$00
664a : b1 1b __ LDA (ACCU + 0),y 
664c : 91 05 __ STA (WORK + 2),y 
664e : c8 __ __ INY
664f : b1 1b __ LDA (ACCU + 0),y 
6651 : 91 05 __ STA (WORK + 2),y 
6653 : c8 __ __ INY
6654 : b1 1b __ LDA (ACCU + 0),y 
6656 : 91 05 __ STA (WORK + 2),y 
6658 : c8 __ __ INY
6659 : b1 1b __ LDA (ACCU + 0),y 
665b : 91 05 __ STA (WORK + 2),y 
665d : 60 __ __ RTS
665e : a0 00 __ LDY #$00
6660 : a5 1b __ LDA ACCU + 0 
6662 : 91 05 __ STA (WORK + 2),y 
6664 : c8 __ __ INY
6665 : a5 1c __ LDA ACCU + 1 
6667 : 91 05 __ STA (WORK + 2),y 
6669 : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
666a : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
__multab13L:
6670 : __ __ __ BYT 00 0d 1a 27                                     : ...'
--------------------------------------------------------------------
__multab102L:
6674 : __ __ __ BYT 00 66 cc 32 98 fe 64 ca                         : .f.2..d.
--------------------------------------------------------------------
__multab102H:
667c : __ __ __ BYT 00 00 00 01 01 01 02 02                         : ........
--------------------------------------------------------------------
__multab9L:
6684 : __ __ __ BYT 00 09 12 1b 24 2d 36                            : ....$-6
--------------------------------------------------------------------
__multab6L:
668b : __ __ __ BYT 00 06 0c 12 18                                  : .....
--------------------------------------------------------------------
__multab15L:
6690 : __ __ __ BYT 00 0f 1e 2d 3c                                  : ...-<
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
6695 : a9 00 __ LDA #$00
6697 : 85 14 __ STA P7 
6699 : 4c d1 45 JMP $45d1 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
669c : a5 4c __ LDA $4c 
669e : 85 11 __ STA P4 
66a0 : a5 4d __ LDA $4d 
66a2 : 85 12 __ STA P5 
66a4 : 4c d1 45 JMP $45d1 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
66a7 : a5 4c __ LDA $4c 
66a9 : 85 0f __ STA P2 
66ab : a5 4d __ LDA $4d 
66ad : 85 10 __ STA P3 
66af : 4c d1 45 JMP $45d1 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
66b2 : a5 4d __ LDA $4d 
66b4 : 85 11 __ STA P4 
66b6 : a5 4e __ LDA $4e 
66b8 : 85 12 __ STA P5 
66ba : 4c d1 45 JMP $45d1 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
66bd : a5 4d __ LDA $4d 
66bf : 85 0f __ STA P2 
66c1 : a5 4e __ LDA $4e 
66c3 : 85 10 __ STA P3 
66c5 : 4c d1 45 JMP $45d1 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
66c8 : a9 00 __ LDA #$00
66ca : 85 0f __ STA P2 
66cc : a9 8c __ LDA #$8c
66ce : 85 11 __ STA P4 
66d0 : a9 6c __ LDA #$6c
66d2 : 85 12 __ STA P5 
66d4 : a5 54 __ LDA $54 
66d6 : 85 13 __ STA P6 
66d8 : 4c 1b 2e JMP $2e1b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
66db : a9 00 __ LDA #$00
66dd : 85 0f __ STA P2 
66df : a9 03 __ LDA #$03
66e1 : 85 10 __ STA P3 
66e3 : 4c 1b 2e JMP $2e1b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
66e6 : a9 00 __ LDA #$00
66e8 : 85 0f __ STA P2 
66ea : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
66ed : 85 13 __ STA P6 
66ef : 4c 1b 2e JMP $2e1b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
66f2 : a9 21 __ LDA #$21
66f4 : 85 11 __ STA P4 
66f6 : a9 35 __ LDA #$35
66f8 : 85 12 __ STA P5 
66fa : 4c 1b 2e JMP $2e1b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
66fd : a9 03 __ LDA #$03
66ff : 85 10 __ STA P3 
6701 : ad 7a 6c LDA $6c7a ; (vdc_state + 7)
6704 : 85 13 __ STA P6 
6706 : 4c 1b 2e JMP $2e1b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
6709 : a9 8c __ LDA #$8c
670b : 85 11 __ STA P4 
670d : a9 6c __ LDA #$6c
670f : 85 12 __ STA P5 
6711 : a9 8d __ LDA #$8d
6713 : 85 13 __ STA P6 
6715 : 4c 1b 2e JMP $2e1b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
6718 : a5 4a __ LDA $4a 
671a : 85 0e __ STA P1 
671c : 4c 70 2a JMP $2a70 ; (vdc_mem_addr.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
671f : a9 00 __ LDA #$00
6721 : 85 0f __ STA P2 
6723 : a9 20 __ LDA #$20
6725 : 85 11 __ STA P4 
6727 : a9 50 __ LDA #$50
6729 : 85 13 __ STA P6 
672b : a9 03 __ LDA #$03
672d : 85 14 __ STA P7 
672f : a9 02 __ LDA #$02
6731 : 85 15 __ STA P8 
6733 : 4c 9b 29 JMP $299b ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
6736 : a9 00 __ LDA #$00
6738 : 85 0f __ STA P2 
673a : a9 20 __ LDA #$20
673c : 85 11 __ STA P4 
673e : a9 50 __ LDA #$50
6740 : 85 13 __ STA P6 
6742 : a9 02 __ LDA #$02
6744 : 85 14 __ STA P7 
6746 : 4c 9b 29 JMP $299b ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_hchar@proxy: ; vdc_hchar@proxy
6749 : a9 20 __ LDA #$20
674b : 85 11 __ STA P4 
674d : a9 50 __ LDA #$50
674f : 85 13 __ STA P6 
6751 : 4c c5 29 JMP $29c5 ; (vdc_hchar.s0 + 0)
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
6754 : a9 05 __ LDA #$05
6756 : 85 03 __ STA WORK + 0 
6758 : a9 00 __ LDA #$00
675a : 85 04 __ STA WORK + 1 
675c : 4c b0 63 JMP $63b0 ; (divmod + 0)
--------------------------------------------------------------------
winStyles:
675f : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
676f : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
menubar:
6771 : __ __ __ BYT 73 45 54 54 49 4e 47 53 00 77 49 4e 44 4f 57 53 : sETTINGS.wINDOWS
6781 : __ __ __ BYT 00 00 76 49 45 57 50 4f 52 54 00 73 43 52 4f 4c : ..vIEWPORT.sCROL
6791 : __ __ __ BYT 4c 00 00 00 63 48 41 52 53 45 54 00 00 6d 55 53 : L...cHARSET..mUS
67a1 : __ __ __ BYT 49 43 00 00 00 00 00 00 00 00 00 00 01          : IC...........
--------------------------------------------------------------------
pulldown_options:
67ae : __ __ __ BYT 03 02 02 03 01 04 02 06                         : ........
--------------------------------------------------------------------
67b6 : __ __ __ BYT 46 4c 49 45 53 00 4a 55 4d 50 53 00 53 4c 45 45 : FLIES.JUMPS.SLEE
67c6 : __ __ __ BYT 50 53 45 41 54 53 00 00 57 41 4c 4b 53 00       : PSEATS..WALKS.
--------------------------------------------------------------------
67d4 : __ __ __ BYT 42 49 47 00 00 00 53 4d 41 4c 4c 00 41 4e 47 52 : BIG...SMALL.ANGR
67e4 : __ __ __ BYT 59 00 57 45 54 00 00 00 48 41 50 50 59 00       : Y.WET...HAPPY.
--------------------------------------------------------------------
p2smap:
67f2 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
screenset:
67fa : __ __ __ BYT 50 96 a0 4b 50 19                               : P..KP.
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
pulldown_titles:
68d8 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 00 00 00 00 00 00 : sCREENMODE......
68e8 : __ __ __ BYT 00 69 4e 46 4f 20 20 20 20 20 20 00 00 00 00 00 : .iNFO      .....
68f8 : __ __ __ BYT 00 00 65 58 49 54 20 20 20 20 20 20 00 00 00 00 : ..eXIT      ....
6908 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6918 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6928 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6938 : __ __ __ BYT 00 00 00 00 00 00 77 49 4e 44 4f 57 20 4f 4e 20 : ......wINDOW ON 
6948 : __ __ __ BYT 57 49 4e 44 4f 57 00 74 45 58 54 20 45 4e 54 52 : WINDOW.tEXT ENTR
6958 : __ __ __ BYT 59 20 20 20 20 20 20 00 00 00 00 00 00 00 00 00 : Y      .........
6968 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6978 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6988 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6998 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 73 43 52 45 : ............sCRE
69a8 : __ __ __ BYT 45 4e 20 31 00 00 00 00 00 00 00 00 00 73 43 52 : EN 1.........sCR
69b8 : __ __ __ BYT 45 45 4e 20 32 00 00 00 00 00 00 00 00 00 00 00 : EEN 2...........
69c8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
69d8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
69e8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
69f8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a08 : __ __ __ BYT 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 31 00 00 : ..fULLSCREEN 1..
6a18 : __ __ __ BYT 00 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 32 00 : ...fULLSCREEN 2.
6a28 : __ __ __ BYT 00 00 00 00 62 49 47 46 4f 4e 54 20 54 45 58 54 : ....bIGFONT TEXT
6a38 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a48 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a58 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a68 : __ __ __ BYT 00 00 00 00 00 00 00 00 63 48 41 52 53 45 54 20 : ........cHARSET 
6a78 : __ __ __ BYT 44 45 4d 4f 00 00 00 00 00 00 00 00 00 00 00 00 : DEMO............
6a88 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6a98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6aa8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6ab8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6ac8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 75 4c : ..............uL
6ad8 : __ __ __ BYT 54 49 4d 41 54 45 20 61 58 45 4c 20 66 00 00 66 : TIMATE aXEL f..f
6ae8 : __ __ __ BYT 41 44 45 44 20 20 20 20 20 20 20 20 20 20 00 00 : ADED          ..
6af8 : __ __ __ BYT 73 54 4f 50 20 4d 55 53 49 43 20 20 20 20 20 00 : sTOP MUSIC     .
6b08 : __ __ __ BYT 00 72 45 53 54 41 52 54 20 4d 55 53 49 43 20 20 : .rESTART MUSIC  
6b18 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b28 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b38 : __ __ __ BYT 00 00 00 00 79 45 53 00 00 00 00 00 00 00 00 00 : ....yES.........
6b48 : __ __ __ BYT 00 00 00 00 00 6e 4f 20 00 00 00 00 00 00 00 00 : .....nO ........
6b58 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b68 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b78 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b88 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 70 61 6c 20 20 38 : ..........pal  8
6ba8 : __ __ __ BYT 30 58 32 35 00 00 00 00 00 00 00 70 61 6c 20 20 : 0X25.......pal  
6bb8 : __ __ __ BYT 38 30 58 35 30 00 00 00 00 00 00 00 70 61 6c 20 : 80X50.......pal 
6bc8 : __ __ __ BYT 20 38 30 58 37 30 00 00 00 00 00 00 00 6e 74 73 :  80X70.......nts
6bd8 : __ __ __ BYT 63 20 38 30 58 32 35 00 00 00 00 00 00 00 6e 74 : c 80X25.......nt
6be8 : __ __ __ BYT 73 63 20 38 30 58 35 30 00 00 00 00 00 00 00 6e : sc 80X50.......n
6bf8 : __ __ __ BYT 74 73 63 20 38 30 58 36 30 00 00 00 00 00 00 00 : tsc 80X60.......
--------------------------------------------------------------------
6c08 : __ __ __ BYT 42 4c 55 45 20 4a 41 59 00 00 00 00 00 00 00 43 : BLUE JAY.......C
6c18 : __ __ __ BYT 41 52 44 49 4e 41 4c 00 00 00 00 00 00 00 45 41 : ARDINAL.......EA
6c28 : __ __ __ BYT 53 54 45 52 4e 20 50 48 4f 45 42 45 00 47 52 41 : STERN PHOEBE.GRA
6c38 : __ __ __ BYT 43 4b 4c 45 00 00 00 00 00 00 00 00 53 41 4e 44 : CKLE........SAND
6c48 : __ __ __ BYT 48 49 4c 4c 20 43 52 41 4e 45 00                : HILL CRANE.
--------------------------------------------------------------------
s2pmap:
6c53 : __ __ __ BYT 40 00 20 c0 c0 80 a0 40                         : @. ....@
--------------------------------------------------------------------
winCfg:
6c5b : __ __ __ BSS	8
--------------------------------------------------------------------
krnio_pstatus:
6c63 : __ __ __ BSS	16
--------------------------------------------------------------------
vdc_state:
6c73 : __ __ __ BSS	25
--------------------------------------------------------------------
linebuffer:
6c8c : __ __ __ BSS	81
--------------------------------------------------------------------
HeapNode:
6cdd : __ __ __ BSS	4
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
windows:
6dc3 : __ __ __ BSS	39
--------------------------------------------------------------------
multab:
6e00 : __ __ __ BSS	144
--------------------------------------------------------------------
bnk_redef_charset: ; bnk_redef_charset(u16,u8,volatile u8*,u16)->void
.s0:
01:1300 : ad 00 ff LDA $ff00 
01:1303 : 85 43 __ STA T0 + 0 
01:1305 : a9 0e __ LDA #$0e
01:1307 : 8d 00 ff STA $ff00 
01:130a : 20 68 2a JSR $2a68 ; (vdc_mem_addr@proxy + 0)
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
01:1365 : a2 00 __ LDX #$00
01:1367 : 20 68 ff JSR $ff68 
01:136a : a5 12 __ LDA P5 ; (fname + 0)
01:136c : 85 0d __ STA P0 
01:136e : a5 13 __ LDA P6 ; (fname + 1)
01:1370 : 85 0e __ STA P1 
01:1372 : 20 cb 27 JSR $27cb ; (krnio_setnam.s0 + 0)
01:1375 : a9 01 __ LDA #$01
01:1377 : a6 0f __ LDX P2 
01:1379 : a0 00 __ LDY #$00
01:137b : 20 ba ff JSR $ffba 
01:137e : a9 00 __ LDA #$00
01:1380 : a6 10 __ LDX P3 
01:1382 : a4 11 __ LDY P4 
01:1384 : 20 d5 ff JSR $ffd5 
01:1387 : a9 00 __ LDA #$00
01:1389 : b0 02 __ BCS $138d ; (bnk_load.s0 + 42)
01:138b : a9 01 __ LDA #$01
01:138d : 85 1b __ STA ACCU + 0 
.s1001:
01:138f : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:1390 : a9 0e __ LDA #$0e
01:1392 : 85 0d __ STA P0 
01:1394 : a9 8c __ LDA #$8c
01:1396 : 85 0e __ STA P1 
01:1398 : a9 6c __ LDA #$6c
01:139a : 85 0f __ STA P2 
01:139c : a5 46 __ LDA $46 
01:139e : 85 12 __ STA P5 
01:13a0 : a9 00 __ LDA #$00
01:13a2 : 85 13 __ STA P6 
--------------------------------------------------------------------
bnk_cpyfromvdc: ; bnk_cpyfromvdc(u8,volatile u8*,u16,u16)->void
.s0:
01:13a4 : ad 00 ff LDA $ff00 
01:13a7 : 85 1d __ STA ACCU + 2 
01:13a9 : a6 12 __ LDX P5 ; (size + 0)
.l110:
01:13ab : 8a __ __ TXA
01:13ac : 05 13 __ ORA P6 ; (size + 1)
01:13ae : d0 06 __ BNE $13b6 ; (bnk_cpyfromvdc.s2 + 0)
.s3:
01:13b0 : a5 1d __ LDA ACCU + 2 
01:13b2 : 8d 00 ff STA $ff00 
.s1001:
01:13b5 : 60 __ __ RTS
.s2:
01:13b6 : a9 0e __ LDA #$0e
01:13b8 : 8d 00 ff STA $ff00 
01:13bb : a5 10 __ LDA P3 ; (vdcsrc + 0)
01:13bd : a8 __ __ TAY
01:13be : 18 __ __ CLC
01:13bf : 69 01 __ ADC #$01
01:13c1 : 85 10 __ STA P3 ; (vdcsrc + 0)
01:13c3 : a5 11 __ LDA P4 ; (vdcsrc + 1)
01:13c5 : 85 1b __ STA ACCU + 0 
01:13c7 : 69 00 __ ADC #$00
01:13c9 : 85 11 __ STA P4 ; (vdcsrc + 1)
01:13cb : a9 12 __ LDA #$12
01:13cd : 8d 00 d6 STA $d600 
.l111:
01:13d0 : 2c 00 d6 BIT $d600 
01:13d3 : 10 fb __ BPL $13d0 ; (bnk_cpyfromvdc.l111 + 0)
.s10:
01:13d5 : a5 1b __ LDA ACCU + 0 
01:13d7 : 8d 01 d6 STA $d601 
01:13da : a9 13 __ LDA #$13
01:13dc : 8d 00 d6 STA $d600 
.l113:
01:13df : 2c 00 d6 BIT $d600 
01:13e2 : 10 fb __ BPL $13df ; (bnk_cpyfromvdc.l113 + 0)
.s15:
01:13e4 : 8c 01 d6 STY $d601 
01:13e7 : a9 1f __ LDA #$1f
01:13e9 : 8d 00 d6 STA $d600 
.l115:
01:13ec : 2c 00 d6 BIT $d600 
01:13ef : 10 fb __ BPL $13ec ; (bnk_cpyfromvdc.l115 + 0)
.s19:
01:13f1 : a5 0d __ LDA P0 ; (dcr + 0)
01:13f3 : ac 01 d6 LDY $d601 
01:13f6 : 8d 00 ff STA $ff00 
01:13f9 : a5 0e __ LDA P1 ; (dp + 0)
01:13fb : 85 1b __ STA ACCU + 0 
01:13fd : 18 __ __ CLC
01:13fe : 69 01 __ ADC #$01
01:1400 : 85 0e __ STA P1 ; (dp + 0)
01:1402 : a5 0f __ LDA P2 ; (dp + 1)
01:1404 : 85 1c __ STA ACCU + 1 
01:1406 : 69 00 __ ADC #$00
01:1408 : 85 0f __ STA P2 ; (dp + 1)
01:140a : 98 __ __ TYA
01:140b : a0 00 __ LDY #$00
01:140d : 91 1b __ STA (ACCU + 0),y 
01:140f : a9 0e __ LDA #$0e
01:1411 : 8d 00 ff STA $ff00 
01:1414 : ca __ __ DEX
01:1415 : e0 ff __ CPX #$ff
01:1417 : d0 92 __ BNE $13ab ; (bnk_cpyfromvdc.l110 + 0)
.s1008:
01:1419 : c6 13 __ DEC P6 ; (size + 1)
01:141b : 4c ab 13 JMP $13ab ; (bnk_cpyfromvdc.l110 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:141e : a9 0e __ LDA #$0e
01:1420 : 85 11 __ STA P4 
01:1422 : a9 8c __ LDA #$8c
01:1424 : 85 12 __ STA P5 
01:1426 : a9 6c __ LDA #$6c
01:1428 : 85 13 __ STA P6 
01:142a : a9 00 __ LDA #$00
01:142c : 85 15 __ STA P8 
--------------------------------------------------------------------
bnk_cpytovdc: ; bnk_cpytovdc(u16,u8,volatile u8*,u16)->void
.s0:
01:142e : ad 00 ff LDA $ff00 
01:1431 : 85 43 __ STA T0 + 0 
01:1433 : a9 0e __ LDA #$0e
01:1435 : 8d 00 ff STA $ff00 
01:1438 : 20 68 2a JSR $2a68 ; (vdc_mem_addr@proxy + 0)
01:143b : a5 14 __ LDA P7 ; (size + 0)
01:143d : 05 15 __ ORA P8 ; (size + 1)
01:143f : d0 06 __ BNE $1447 ; (bnk_cpytovdc.s1008 + 0)
.s3:
01:1441 : a5 43 __ LDA T0 + 0 
01:1443 : 8d 00 ff STA $ff00 
.s1001:
01:1446 : 60 __ __ RTS
.s1008:
01:1447 : a6 14 __ LDX P7 ; (size + 0)
.l2:
01:1449 : a5 11 __ LDA P4 ; (scr + 0)
01:144b : 8d 00 ff STA $ff00 
01:144e : a0 00 __ LDY #$00
01:1450 : b1 12 __ LDA (P5),y ; (sp + 0)
01:1452 : a8 __ __ TAY
01:1453 : e6 12 __ INC P5 ; (sp + 0)
01:1455 : d0 02 __ BNE $1459 ; (bnk_cpytovdc.s1010 + 0)
.s1009:
01:1457 : e6 13 __ INC P6 ; (sp + 1)
.s1010:
01:1459 : a9 0e __ LDA #$0e
01:145b : 8d 00 ff STA $ff00 
.l52:
01:145e : 2c 00 d6 BIT $d600 
01:1461 : 10 fb __ BPL $145e ; (bnk_cpytovdc.l52 + 0)
.s6:
01:1463 : 8c 01 d6 STY $d601 
01:1466 : 8a __ __ TXA
01:1467 : d0 02 __ BNE $146b ; (bnk_cpytovdc.s1005 + 0)
.s1004:
01:1469 : c6 15 __ DEC P8 ; (size + 1)
.s1005:
01:146b : ca __ __ DEX
01:146c : d0 db __ BNE $1449 ; (bnk_cpytovdc.l2 + 0)
.s1006:
01:146e : a5 15 __ LDA P8 ; (size + 1)
01:1470 : d0 d7 __ BNE $1449 ; (bnk_cpytovdc.l2 + 0)
01:1472 : 4c 41 14 JMP $1441 ; (bnk_cpytovdc.s3 + 0)
--------------------------------------------------------------------
sid_startmusic: ; sid_startmusic()->void
.s0:
01:1475 : ad 00 ff LDA $ff00 
01:1478 : 85 43 __ STA T0 + 0 
01:147a : a9 7e __ LDA #$7e
01:147c : 8d 00 ff STA $ff00 
01:147f : 78 __ __ SEI
01:1480 : a9 7e __ LDA #$7e
01:1482 : 8d 00 ff STA $ff00 
01:1485 : a9 00 __ LDA #$00
01:1487 : 20 00 20 JSR $2000 ; (bnk_init.s0 + 2)
01:148a : ad 14 03 LDA $0314 
01:148d : 8d 68 15 STA $1568 ; (sid_irq + 0)
01:1490 : a9 a7 __ LDA #$a7
01:1492 : 8d 14 03 STA $0314 
01:1495 : ad 15 03 LDA $0315 
01:1498 : 8d 69 15 STA $1569 ; (sid_irq + 1)
01:149b : a9 14 __ LDA #$14
01:149d : 8d 15 03 STA $0315 
01:14a0 : 58 __ __ CLI
01:14a1 : a5 43 __ LDA T0 + 0 
01:14a3 : 8d 00 ff STA $ff00 
.s1001:
01:14a6 : 60 __ __ RTS
--------------------------------------------------------------------
sid_interrupt: ; sid_interrupt
01:14a7 : ad 6a 15 LDA $156a ; (sid_pause + 0)
01:14aa : d0 20 __ BNE $14cc ; (sid_interrupt + 37)
01:14ac : ad 00 ff LDA $ff00 
01:14af : 8d 6b 15 STA $156b ; (sid_oldcr + 0)
01:14b2 : a9 7e __ LDA #$7e
01:14b4 : 8d 00 ff STA $ff00 
01:14b7 : 20 03 20 JSR $2003 ; (bnk_init.s0 + 5)
01:14ba : ad 6b 15 LDA $156b ; (sid_oldcr + 0)
01:14bd : 8d 00 ff STA $ff00 
01:14c0 : ad 68 15 LDA $1568 ; (sid_irq + 0)
01:14c3 : 8d cd 14 STA $14cd ; (sid_interrupt + 38)
01:14c6 : ad 69 15 LDA $1569 ; (sid_irq + 1)
01:14c9 : 8d ce 14 STA $14ce ; (sid_interrupt + 39)
01:14cc : 4c 65 fa JMP $fa65 
--------------------------------------------------------------------
bnk_writeb: ; bnk_writeb(u8,volatile u8*,u8)->void
.s0:
01:14cf : a9 0e __ LDA #$0e
01:14d1 : ae 00 ff LDX $ff00 
01:14d4 : 8d 00 ff STA $ff00 
01:14d7 : a5 0f __ LDA P2 ; (b + 0)
01:14d9 : a0 00 __ LDY #$00
01:14db : 91 0d __ STA (P0),y ; (p + 0)
01:14dd : 8e 00 ff STX $ff00 
.s1001:
01:14e0 : 60 __ __ RTS
--------------------------------------------------------------------
sid_pausemusic: ; sid_pausemusic()->void
--------------------------------------------------------------------
sid_resetsid: ; sid_resetsid()->void
.s0:
01:14e1 : a2 18 __ LDX #$18
01:14e3 : a9 00 __ LDA #$00
01:14e5 : 9d 00 d4 STA $d400,x 
01:14e8 : ca __ __ DEX
01:14e9 : 10 fa __ BPL $14e5 ; (sid_resetsid.s0 + 4)
01:14eb : a9 08 __ LDA #$08
01:14ed : 8d 04 d4 STA $d404 
01:14f0 : 8d 0b d4 STA $d40b 
01:14f3 : 8d 12 d4 STA $d412 
01:14f6 : a2 03 __ LDX #$03
01:14f8 : 2c 11 d0 BIT $d011 
01:14fb : 10 fb __ BPL $14f8 ; (sid_resetsid.s0 + 23)
01:14fd : 2c 11 d0 BIT $d011 
01:1500 : 30 fb __ BMI $14fd ; (sid_resetsid.s0 + 28)
01:1502 : ca __ __ DEX
01:1503 : 10 f3 __ BPL $14f8 ; (sid_resetsid.s0 + 23)
01:1505 : a9 00 __ LDA #$00
01:1507 : 8d 04 d4 STA $d404 
01:150a : 8d 0b d4 STA $d40b 
01:150d : 8d 12 d4 STA $d412 
01:1510 : a9 00 __ LDA #$00
01:1512 : 8d 18 d4 STA $d418 
.s1001:
01:1515 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_readb: ; bnk_readb(u8,volatile u8*)->u8
.s0:
01:1516 : a5 0d __ LDA P0 ; (cr + 0)
01:1518 : ae 00 ff LDX $ff00 
01:151b : 8d 00 ff STA $ff00 
01:151e : a0 00 __ LDY #$00
01:1520 : b1 0e __ LDA (P1),y ; (p + 0)
01:1522 : 8e 00 ff STX $ff00 
.s1001:
01:1525 : 60 __ __ RTS
--------------------------------------------------------------------
sid_stopmusic: ; sid_stopmusic()->void
.s0:
01:1526 : 78 __ __ SEI
01:1527 : ae 68 15 LDX $1568 ; (sid_irq + 0)
01:152a : ac 69 15 LDY $1569 ; (sid_irq + 1)
01:152d : 8e 14 03 STX $0314 
01:1530 : 8c 15 03 STY $0315 
01:1533 : 58 __ __ CLI
01:1534 : 4c e1 14 JMP $14e1 ; (sid_resetsid.s0 + 0)
--------------------------------------------------------------------
bnk_load@proxy: ; bnk_load@proxy
01:1537 : a9 00 __ LDA #$00
01:1539 : 85 10 __ STA P3 
01:153b : 4c 63 13 JMP $1363 ; (bnk_load.s0 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:153e : a9 0e __ LDA #$0e
01:1540 : 85 0d __ STA P0 
01:1542 : a9 8c __ LDA #$8c
01:1544 : 85 0e __ STA P1 
01:1546 : a9 6c __ LDA #$6c
01:1548 : 85 0f __ STA P2 
01:154a : a5 47 __ LDA $47 
01:154c : 85 12 __ STA P5 
01:154e : a9 00 __ LDA #$00
01:1550 : 85 13 __ STA P6 
01:1552 : 4c a4 13 JMP $13a4 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:1555 : a9 0e __ LDA #$0e
01:1557 : 85 0d __ STA P0 
01:1559 : a9 8c __ LDA #$8c
01:155b : 85 0e __ STA P1 
01:155d : a9 6c __ LDA #$6c
01:155f : 85 0f __ STA P2 
01:1561 : a9 00 __ LDA #$00
01:1563 : 85 13 __ STA P6 
01:1565 : 4c a4 13 JMP $13a4 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
sid_irq:
01:1568 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
sid_pause:
01:156a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sid_oldcr:
01:156b : __ __ __ BYT 00                                              : .
