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
1c13 : 8e fe 36 STX $36fe ; (spentry + 0)
1c16 : a9 c3 __ LDA #$c3
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 6f __ LDA #$6f
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 70 __ LDA #$70
1c21 : e9 6f __ SBC #$6f
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
1ca5 : 8d 44 6e STA $6e44 ; (winCfg + 0)
1ca8 : a9 08 __ LDA #$08
1caa : 8d 0e dc STA $dc0e 
1cad : 8d 0f dc STA $dc0f 
1cb0 : 8d 0e dd STA $dd0e 
1cb3 : 8d 0f dd STA $dd0f 
1cb6 : a9 00 __ LDA #$00
1cb8 : 8d 03 dc STA $dc03 
1cbb : 8d 03 dd STA $dd03 
1cbe : 8d 47 6e STA $6e47 ; (winCfg + 3)
1cc1 : 8d 49 6e STA $6e49 ; (winCfg + 5)
1cc4 : 8d 45 6e STA $6e45 ; (winCfg + 1)
1cc7 : 8d 4a 6e STA $6e4a ; (winCfg + 6)
1cca : a9 ff __ LDA #$ff
1ccc : 8d 02 dc STA $dc02 
1ccf : a9 07 __ LDA #$07
1cd1 : 8d 01 dd STA $dd01 
1cd4 : a9 3f __ LDA #$3f
1cd6 : 8d 02 dd STA $dd02 
1cd9 : a9 a8 __ LDA #$a8
1cdb : 8d 46 6e STA $6e46 ; (winCfg + 2)
1cde : 8d 4b 6e STA $6e4b ; (winCfg + 7)
1ce1 : a9 20 __ LDA #$20
1ce3 : 8d 48 6e STA $6e48 ; (winCfg + 4)
1ce6 : 20 f6 1f JSR $1ff6 ; (bnk_init.s1000 + 0)
1ce9 : 20 c5 13 JSR $13c5 ; (fastload_mapdir.s0 + 0)
1cec : 20 41 2a JSR $2a41 ; (vdc_init.s1000 + 0)
1cef : a9 00 __ LDA #$00
1cf1 : 85 0f __ STA P2 
1cf3 : 85 10 __ STA P3 
1cf5 : ad 63 6e LDA $6e63 ; (vdc_state + 7)
1cf8 : 85 54 __ STA T1 + 0 
1cfa : 85 13 __ STA P6 
1cfc : a9 db __ LDA #$db
1cfe : 85 11 __ STA P4 
1d00 : a9 2f __ LDA #$2f
1d02 : 85 12 __ STA P5 
1d04 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
1d07 : a9 75 __ LDA #$75
1d09 : a0 02 __ LDY #$02
1d0b : 91 23 __ STA (SP + 0),y 
1d0d : a9 6e __ LDA #$6e
1d0f : c8 __ __ INY
1d10 : 91 23 __ STA (SP + 0),y 
1d12 : a9 30 __ LDA #$30
1d14 : c8 __ __ INY
1d15 : 91 23 __ STA (SP + 0),y 
1d17 : a9 31 __ LDA #$31
1d19 : c8 __ __ INY
1d1a : 91 23 __ STA (SP + 0),y 
1d1c : ad 5c 6e LDA $6e5c ; (vdc_state + 0)
1d1f : c8 __ __ INY
1d20 : 91 23 __ STA (SP + 0),y 
1d22 : a9 00 __ LDA #$00
1d24 : c8 __ __ INY
1d25 : 91 23 __ STA (SP + 0),y 
1d27 : ad 5d 6e LDA $6e5d ; (vdc_state + 1)
1d2a : d0 07 __ BNE $1d33 ; (main.s70 + 0)
.s71:
1d2c : a9 31 __ LDA #$31
1d2e : a2 68 __ LDX #$68
1d30 : 4c 37 1d JMP $1d37 ; (main.s72 + 0)
.s70:
1d33 : a9 31 __ LDA #$31
1d35 : a2 65 __ LDX #$65
.s72:
1d37 : a0 09 __ LDY #$09
1d39 : 91 23 __ STA (SP + 0),y 
1d3b : 8a __ __ TXA
1d3c : 88 __ __ DEY
1d3d : 91 23 __ STA (SP + 0),y 
1d3f : 20 02 31 JSR $3102 ; (sprintf.s0 + 0)
1d42 : a9 02 __ LDA #$02
1d44 : 85 10 __ STA P3 
1d46 : 20 a9 68 JSR $68a9 ; (vdc_prints_attr@proxy + 0)
1d49 : a9 04 __ LDA #$04
1d4b : 85 10 __ STA P3 
1d4d : a9 31 __ LDA #$31
1d4f : 85 12 __ STA P5 
1d51 : a9 6c __ LDA #$6c
1d53 : 85 11 __ STA P4 
1d55 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
1d58 : e6 10 __ INC P3 
1d5a : a9 7c __ LDA #$7c
1d5c : 85 11 __ STA P4 
1d5e : a9 31 __ LDA #$31
1d60 : 85 12 __ STA P5 
1d62 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
1d65 : a9 01 __ LDA #$01
1d67 : 85 55 __ STA T3 + 0 
1d69 : 85 17 __ STA P10 
1d6b : a9 40 __ LDA #$40
1d6d : 85 16 __ STA P9 
1d6f : 20 0a 16 JSR $160a ; (fastload_load@proxy + 0)
1d72 : 09 00 __ ORA #$00
1d74 : f0 06 __ BEQ $1d7c ; (main.s10 + 0)
.s8:
1d76 : 20 9b 31 JSR $319b ; (menu_fileerrormessage.s1000 + 0)
1d79 : 20 4c 28 JSR $284c ; (exit@proxy + 0)
.s10:
1d7c : a9 06 __ LDA #$06
1d7e : 85 10 __ STA P3 
1d80 : a9 69 __ LDA #$69
1d82 : 85 11 __ STA P4 
1d84 : a9 38 __ LDA #$38
1d86 : 85 12 __ STA P5 
1d88 : 20 c7 68 JSR $68c7 ; (vdc_prints_attr@proxy + 0)
1d8b : a9 05 __ LDA #$05
1d8d : 85 17 __ STA P10 
1d8f : a9 20 __ LDA #$20
1d91 : 85 16 __ STA P9 
1d93 : 20 0a 16 JSR $160a ; (fastload_load@proxy + 0)
1d96 : 09 00 __ ORA #$00
1d98 : f0 06 __ BEQ $1da0 ; (main.l40 + 0)
.s12:
1d9a : 20 9b 31 JSR $319b ; (menu_fileerrormessage.s1000 + 0)
1d9d : 20 4c 28 JSR $284c ; (exit@proxy + 0)
.l40:
1da0 : 20 72 17 JSR $1772 ; (sid_startmusic.s0 + 0)
.l15:
1da3 : 20 95 38 JSR $3895 ; (menu_placetop.s0 + 0)
1da6 : a9 00 __ LDA #$00
1da8 : 8d 1d be STA $be1d ; (vp_logo + 1)
1dab : 8d 20 be STA $be20 ; (vp_logo + 4)
1dae : 8d 22 be STA $be22 ; (vp_logo + 6)
1db1 : 8d 23 be STA $be23 ; (vp_logo + 7)
1db4 : 8d 24 be STA $be24 ; (vp_logo + 8)
1db7 : 8d 25 be STA $be25 ; (vp_logo + 9)
1dba : 8d 26 be STA $be26 ; (vp_logo + 10)
1dbd : a9 7f __ LDA #$7f
1dbf : 8d 1c be STA $be1c ; (vp_logo + 0)
1dc2 : a9 a0 __ LDA #$a0
1dc4 : 8d 1f be STA $be1f ; (vp_logo + 3)
1dc7 : ad 62 6e LDA $6e62 ; (vdc_state + 6)
1dca : 4a __ __ LSR
1dcb : a9 4b __ LDA #$4b
1dcd : 8d 21 be STA $be21 ; (vp_logo + 5)
1dd0 : a9 10 __ LDA #$10
1dd2 : 85 0f __ STA P2 
1dd4 : a9 30 __ LDA #$30
1dd6 : 85 11 __ STA P4 
1dd8 : a9 0c __ LDA #$0c
1dda : 85 12 __ STA P5 
1ddc : a9 40 __ LDA #$40
1dde : 8d 1e be STA $be1e ; (vp_logo + 2)
1de1 : a9 27 __ LDA #$27
1de3 : 85 0d __ STA P0 
1de5 : a9 be __ LDA #$be
1de7 : 85 0e __ STA P1 
1de9 : ad 61 6e LDA $6e61 ; (vdc_state + 5)
1dec : 85 53 __ STA T0 + 0 
1dee : 6a __ __ ROR
1def : 38 __ __ SEC
1df0 : e9 06 __ SBC #$06
1df2 : 85 10 __ STA P3 
1df4 : 20 e5 33 JSR $33e5 ; (vdcwin_init.s0 + 0)
1df7 : a9 00 __ LDA #$00
1df9 : 8d 24 be STA $be24 ; (vp_logo + 8)
1dfc : 8d 26 be STA $be26 ; (vp_logo + 10)
1dff : a9 10 __ LDA #$10
1e01 : 8d 23 be STA $be23 ; (vp_logo + 7)
1e04 : a9 75 __ LDA #$75
1e06 : a0 02 __ LDY #$02
1e08 : 91 23 __ STA (SP + 0),y 
1e0a : a9 6e __ LDA #$6e
1e0c : c8 __ __ INY
1e0d : 91 23 __ STA (SP + 0),y 
1e0f : a9 30 __ LDA #$30
1e11 : c8 __ __ INY
1e12 : 91 23 __ STA (SP + 0),y 
1e14 : a9 31 __ LDA #$31
1e16 : c8 __ __ INY
1e17 : 91 23 __ STA (SP + 0),y 
1e19 : ad 5c 6e LDA $6e5c ; (vdc_state + 0)
1e1c : c8 __ __ INY
1e1d : 8c 25 be STY $be25 ; (vp_logo + 9)
1e20 : 91 23 __ STA (SP + 0),y 
1e22 : a9 00 __ LDA #$00
1e24 : c8 __ __ INY
1e25 : 91 23 __ STA (SP + 0),y 
1e27 : ad 5d 6e LDA $6e5d ; (vdc_state + 1)
1e2a : d0 07 __ BNE $1e33 ; (main.s73 + 0)
.s74:
1e2c : a9 31 __ LDA #$31
1e2e : a2 68 __ LDX #$68
1e30 : 4c 37 1e JMP $1e37 ; (main.s75 + 0)
.s73:
1e33 : a9 31 __ LDA #$31
1e35 : a2 65 __ LDX #$65
.s75:
1e37 : a0 09 __ LDY #$09
1e39 : 91 23 __ STA (SP + 0),y 
1e3b : 8a __ __ TXA
1e3c : 88 __ __ DEY
1e3d : 91 23 __ STA (SP + 0),y 
1e3f : 20 02 31 JSR $3102 ; (sprintf.s0 + 0)
1e42 : ad 63 6e LDA $6e63 ; (vdc_state + 7)
1e45 : 85 54 __ STA T1 + 0 
1e47 : 85 13 __ STA P6 
1e49 : a9 75 __ LDA #$75
1e4b : 85 11 __ STA P4 
1e4d : a9 6e __ LDA #$6e
1e4f : 85 12 __ STA P5 
1e51 : 20 bc 68 JSR $68bc ; (vdc_prints_attr@proxy + 0)
1e54 : a9 75 __ LDA #$75
1e56 : a0 02 __ LDY #$02
1e58 : 91 23 __ STA (SP + 0),y 
1e5a : a9 6e __ LDA #$6e
1e5c : c8 __ __ INY
1e5d : 91 23 __ STA (SP + 0),y 
1e5f : a9 52 __ LDA #$52
1e61 : c8 __ __ INY
1e62 : 91 23 __ STA (SP + 0),y 
1e64 : a9 39 __ LDA #$39
1e66 : c8 __ __ INY
1e67 : 91 23 __ STA (SP + 0),y 
1e69 : ad 5e 6e LDA $6e5e ; (vdc_state + 2)
1e6c : 85 1b __ STA ACCU + 0 
1e6e : a9 00 __ LDA #$00
1e70 : 85 1c __ STA ACCU + 1 
1e72 : a9 11 __ LDA #$11
1e74 : 20 3e 65 JSR $653e ; (mul16by8 + 0)
1e77 : 18 __ __ CLC
1e78 : a9 a2 __ LDA #$a2
1e7a : 65 05 __ ADC WORK + 2 
1e7c : a0 06 __ LDY #$06
1e7e : 91 23 __ STA (SP + 0),y 
1e80 : a9 6d __ LDA #$6d
1e82 : 69 00 __ ADC #$00
1e84 : c8 __ __ INY
1e85 : 91 23 __ STA (SP + 0),y 
1e87 : 20 02 31 JSR $3102 ; (sprintf.s0 + 0)
1e8a : a9 04 __ LDA #$04
1e8c : 85 10 __ STA P3 
1e8e : 20 a9 68 JSR $68a9 ; (vdc_prints_attr@proxy + 0)
1e91 : 38 __ __ SEC
1e92 : a5 53 __ LDA T0 + 0 
1e94 : e9 04 __ SBC #$04
1e96 : 85 10 __ STA P3 
1e98 : a9 61 __ LDA #$61
1e9a : 85 11 __ STA P4 
1e9c : a9 39 __ LDA #$39
1e9e : 85 12 __ STA P5 
1ea0 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
1ea3 : e6 10 __ INC P3 
1ea5 : a9 9b __ LDA #$9b
1ea7 : 85 11 __ STA P4 
1ea9 : a9 39 __ LDA #$39
1eab : 85 12 __ STA P5 
1ead : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
1eb0 : e6 10 __ INC P3 
1eb2 : a9 00 __ LDA #$00
1eb4 : 85 11 __ STA P4 
1eb6 : a9 3a __ LDA #$3a
1eb8 : 85 12 __ STA P5 
1eba : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
1ebd : a9 1c __ LDA #$1c
1ebf : 85 16 __ STA P9 
1ec1 : a9 be __ LDA #$be
1ec3 : 85 17 __ STA P10 
1ec5 : 20 36 3a JSR $3a36 ; (vdcwin_cpy_viewport.s0 + 0)
1ec8 : 20 81 3b JSR $3b81 ; (menu_main.s1000 + 0)
1ecb : a5 1b __ LDA ACCU + 0 
1ecd : 85 54 __ STA T1 + 0 
1ecf : c9 29 __ CMP #$29
1ed1 : b0 03 __ BCS $1ed6 ; (main.s44 + 0)
1ed3 : 4c af 1f JMP $1faf ; (main.s46 + 0)
.s44:
1ed6 : c9 2b __ CMP #$2b
1ed8 : b0 0c __ BCS $1ee6 ; (main.s45 + 0)
.s29:
1eda : 38 __ __ SEC
1edb : e9 29 __ SBC #$29
1edd : 8d ff bf STA $bfff ; (sstack + 8)
1ee0 : 20 ce 5a JSR $5ace ; (scroll_fullscreen_smooth.s1000 + 0)
1ee3 : 4c 43 1f JMP $1f43 ; (main.s23 + 0)
.s45:
1ee6 : c9 3d __ CMP #$3d
1ee8 : b0 03 __ BCS $1eed ; (main.s55 + 0)
1eea : 4c 9b 1f JMP $1f9b ; (main.s57 + 0)
.s55:
1eed : c9 3f __ CMP #$3f
1eef : 90 03 __ BCC $1ef4 ; (main.s32 + 0)
1ef1 : 4c 8c 1f JMP $1f8c ; (main.s56 + 0)
.s32:
1ef4 : 38 __ __ SEC
1ef5 : e9 3c __ SBC #$3c
1ef7 : 85 53 __ STA T0 + 0 
1ef9 : 90 06 __ BCC $1f01 ; (main.s33 + 0)
.s1008:
1efb : a5 55 __ LDA T3 + 0 
1efd : c5 53 __ CMP T0 + 0 
1eff : f0 42 __ BEQ $1f43 ; (main.s23 + 0)
.s33:
1f01 : 20 59 18 JSR $1859 ; (sid_stopmusic.s0 + 0)
1f04 : a9 75 __ LDA #$75
1f06 : a0 02 __ LDY #$02
1f08 : 91 23 __ STA (SP + 0),y 
1f0a : a9 6e __ LDA #$6e
1f0c : c8 __ __ INY
1f0d : 91 23 __ STA (SP + 0),y 
1f0f : a9 e1 __ LDA #$e1
1f11 : c8 __ __ INY
1f12 : 91 23 __ STA (SP + 0),y 
1f14 : a9 61 __ LDA #$61
1f16 : c8 __ __ INY
1f17 : 91 23 __ STA (SP + 0),y 
1f19 : a5 53 __ LDA T0 + 0 
1f1b : c8 __ __ INY
1f1c : 91 23 __ STA (SP + 0),y 
1f1e : a9 00 __ LDA #$00
1f20 : c8 __ __ INY
1f21 : 91 23 __ STA (SP + 0),y 
1f23 : 20 02 31 JSR $3102 ; (sprintf.s0 + 0)
1f26 : a9 75 __ LDA #$75
1f28 : 85 12 __ STA P5 
1f2a : a9 6e __ LDA #$6e
1f2c : 85 13 __ STA P6 
1f2e : a9 20 __ LDA #$20
1f30 : 85 11 __ STA P4 
1f32 : 20 13 18 JSR $1813 ; (bnk_load@proxy + 0)
1f35 : a5 1b __ LDA ACCU + 0 
1f37 : d0 03 __ BNE $1f3c ; (main.s94 + 0)
.s36:
1f39 : 20 9b 31 JSR $319b ; (menu_fileerrormessage.s1000 + 0)
.s94:
1f3c : a5 53 __ LDA T0 + 0 
1f3e : 85 55 __ STA T3 + 0 
1f40 : 20 72 17 JSR $1772 ; (sid_startmusic.s0 + 0)
.s23:
1f43 : a5 54 __ LDA T1 + 0 
1f45 : c9 0d __ CMP #$0d
1f47 : f0 03 __ BEQ $1f4c ; (main.s16 + 0)
1f49 : 4c a3 1d JMP $1da3 ; (main.l15 + 0)
.s16:
1f4c : 20 59 18 JSR $1859 ; (sid_stopmusic.s0 + 0)
1f4f : a9 00 __ LDA #$00
1f51 : 20 fb 2c JSR $2cfb ; (fastmode.s0 + 0)
1f54 : 20 f9 27 JSR $27f9 ; (vdc_set_mode@proxy + 0)
1f57 : 20 7e 2b JSR $2b7e ; (vdc_cls.s0 + 0)
1f5a : a9 04 __ LDA #$04
1f5c : 8d 06 d5 STA $d506 
1f5f : ad 94 18 LDA $1894 ; (fldrive + 0)
1f62 : 85 11 __ STA P4 
1f64 : a9 0f __ LDA #$0f
1f66 : 85 12 __ STA P5 
1f68 : 20 fb 29 JSR $29fb ; (iec_close.s0 + 0)
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
1f8e : 20 59 18 JSR $1859 ; (sid_stopmusic.s0 + 0)
1f91 : 4c a3 1d JMP $1da3 ; (main.l15 + 0)
.s60:
1f94 : c9 40 __ CMP #$40
1f96 : d0 ab __ BNE $1f43 ; (main.s23 + 0)
1f98 : 4c a0 1d JMP $1da0 ; (main.l40 + 0)
.s57:
1f9b : c9 2b __ CMP #$2b
1f9d : d0 06 __ BNE $1fa5 ; (main.s58 + 0)
.s30:
1f9f : 20 d9 60 JSR $60d9 ; (scroll_bigfont.s1000 + 0)
1fa2 : 4c a3 1d JMP $1da3 ; (main.l15 + 0)
.s58:
1fa5 : c9 33 __ CMP #$33
1fa7 : d0 9a __ BNE $1f43 ; (main.s23 + 0)
.s31:
1fa9 : 20 20 64 JSR $6420 ; (charset_demo.s1000 + 0)
1fac : 4c a3 1d JMP $1da3 ; (main.l15 + 0)
.s46:
1faf : c9 15 __ CMP #$15
1fb1 : d0 06 __ BNE $1fb9 ; (main.s47 + 0)
.s26:
1fb3 : 20 5d 41 JSR $415d ; (windows_windowstacking.s1000 + 0)
1fb6 : 4c a3 1d JMP $1da3 ; (main.l15 + 0)
.s47:
1fb9 : 90 24 __ BCC $1fdf ; (main.s49 + 0)
.s48:
1fbb : c9 16 __ CMP #$16
1fbd : d0 06 __ BNE $1fc5 ; (main.s52 + 0)
.s27:
1fbf : 20 d0 49 JSR $49d0 ; (windows_textinput.s1000 + 0)
1fc2 : 4c a3 1d JMP $1da3 ; (main.l15 + 0)
.s52:
1fc5 : c9 1f __ CMP #$1f
1fc7 : b0 03 __ BCS $1fcc ; (main.s54 + 0)
1fc9 : 4c 43 1f JMP $1f43 ; (main.s23 + 0)
.s54:
1fcc : c9 21 __ CMP #$21
1fce : 90 03 __ BCC $1fd3 ; (main.s28 + 0)
1fd0 : 4c 43 1f JMP $1f43 ; (main.s23 + 0)
.s28:
1fd3 : 38 __ __ SEC
1fd4 : e9 1f __ SBC #$1f
1fd6 : 8d ff bf STA $bfff ; (sstack + 8)
1fd9 : 20 72 53 JSR $5372 ; (viewport_demo.s1000 + 0)
1fdc : 4c a3 1d JMP $1da3 ; (main.l15 + 0)
.s49:
1fdf : c9 0b __ CMP #$0b
1fe1 : d0 06 __ BNE $1fe9 ; (main.s50 + 0)
.s24:
1fe3 : 20 eb 3e JSR $3eeb ; (settings_screenmode.s1000 + 0)
1fe6 : 4c a3 1d JMP $1da3 ; (main.l15 + 0)
.s50:
1fe9 : c9 0c __ CMP #$0c
1feb : f0 03 __ BEQ $1ff0 ; (main.s25 + 0)
1fed : 4c 43 1f JMP $1f43 ; (main.s23 + 0)
.s25:
1ff0 : 20 55 3f JSR $3f55 ; (settings_versioninfo.s1000 + 0)
1ff3 : 4c a3 1d JMP $1da3 ; (main.l15 + 0)
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
1ff6 : 38 __ __ SEC
1ff7 : a5 23 __ LDA SP + 0 
1ff9 : e9 06 __ SBC #$06
1ffb : 85 23 __ STA SP + 0 
1ffd : b0 02 __ BCS $2001 ; (bnk_init.s0 + 0)
1fff : c6 24 __ DEC SP + 1 
.s0:
2001 : a9 ae __ LDA #$ae
2003 : a0 02 __ LDY #$02
2005 : 91 23 __ STA (SP + 0),y 
2007 : a9 27 __ LDA #$27
2009 : c8 __ __ INY
200a : 91 23 __ STA (SP + 0),y 
200c : a5 ba __ LDA $ba 
200e : d0 02 __ BNE $2012 ; (bnk_init.s4 + 0)
.s2:
2010 : a9 08 __ LDA #$08
.s4:
2012 : 85 4e __ STA T1 + 0 
2014 : 8d ff 61 STA $61ff ; (bootdevice + 0)
2017 : a0 04 __ LDY #$04
2019 : 91 23 __ STA (SP + 0),y 
201b : a9 00 __ LDA #$00
201d : c8 __ __ INY
201e : 91 23 __ STA (SP + 0),y 
2020 : 20 bc 20 JSR $20bc ; (printf.s0 + 0)
2023 : a9 06 __ LDA #$06
2025 : 8d 06 d5 STA $d506 
2028 : a9 be __ LDA #$be
202a : a0 02 __ LDY #$02
202c : 91 23 __ STA (SP + 0),y 
202e : a9 27 __ LDA #$27
2030 : c8 __ __ INY
2031 : 91 23 __ STA (SP + 0),y 
2033 : 20 bc 20 JSR $20bc ; (printf.s0 + 0)
2036 : a9 00 __ LDA #$00
2038 : aa __ __ TAX
2039 : 20 68 ff JSR $ff68 
203c : a9 d8 __ LDA #$d8
203e : 85 0d __ STA P0 
2040 : a9 27 __ LDA #$27
2042 : 85 0e __ STA P1 
2044 : 20 e3 27 JSR $27e3 ; (krnio_setnam.s0 + 0)
2047 : a9 d8 __ LDA #$d8
2049 : a0 04 __ LDY #$04
204b : 91 23 __ STA (SP + 0),y 
204d : a9 27 __ LDA #$27
204f : c8 __ __ INY
2050 : 91 23 __ STA (SP + 0),y 
2052 : a9 00 __ LDA #$00
2054 : a0 02 __ LDY #$02
2056 : 91 23 __ STA (SP + 0),y 
2058 : a9 28 __ LDA #$28
205a : c8 __ __ INY
205b : 91 23 __ STA (SP + 0),y 
205d : 20 bc 20 JSR $20bc ; (printf.s0 + 0)
2060 : a9 01 __ LDA #$01
2062 : 85 0d __ STA P0 
2064 : 85 0f __ STA P2 
2066 : a5 4e __ LDA T1 + 0 
2068 : 85 0e __ STA P1 
206a : 20 0d 28 JSR $280d ; (krnio_load.s0 + 0)
206d : 09 00 __ ORA #$00
206f : d0 2a __ BNE $209b ; (bnk_init.s6 + 0)
.s7:
2071 : a9 22 __ LDA #$22
2073 : a0 02 __ LDY #$02
2075 : 91 23 __ STA (SP + 0),y 
2077 : a9 28 __ LDA #$28
2079 : c8 __ __ INY
207a : 91 23 __ STA (SP + 0),y 
207c : 20 bc 20 JSR $20bc ; (printf.s0 + 0)
207f : a9 40 __ LDA #$40
2081 : a0 02 __ LDY #$02
2083 : 91 23 __ STA (SP + 0),y 
2085 : a9 28 __ LDA #$28
2087 : c8 __ __ INY
2088 : 91 23 __ STA (SP + 0),y 
208a : ad 4d 6e LDA $6e4d ; (krnio_pstatus + 1)
208d : c8 __ __ INY
208e : 91 23 __ STA (SP + 0),y 
2090 : a9 00 __ LDA #$00
2092 : c8 __ __ INY
2093 : 91 23 __ STA (SP + 0),y 
2095 : 20 bc 20 JSR $20bc ; (printf.s0 + 0)
2098 : 20 4c 28 JSR $284c ; (exit@proxy + 0)
.s6:
209b : a9 69 __ LDA #$69
209d : a0 02 __ LDY #$02
209f : 91 23 __ STA (SP + 0),y 
20a1 : a9 28 __ LDA #$28
20a3 : c8 __ __ INY
20a4 : 91 23 __ STA (SP + 0),y 
20a6 : 20 bc 20 JSR $20bc ; (printf.s0 + 0)
20a9 : a5 4e __ LDA T1 + 0 
20ab : 85 15 __ STA P8 
20ad : 20 00 13 JSR $1300 ; (flossiec_init.s0 + 0)
.s1001:
20b0 : 18 __ __ CLC
20b1 : a5 23 __ LDA SP + 0 
20b3 : 69 06 __ ADC #$06
20b5 : 85 23 __ STA SP + 0 
20b7 : 90 02 __ BCC $20bb ; (bnk_init.s1001 + 11)
20b9 : e6 24 __ INC SP + 1 
20bb : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
20bc : a9 01 __ LDA #$01
20be : 8d fb bf STA $bffb ; (sstack + 4)
20c1 : a9 ad __ LDA #$ad
20c3 : 85 16 __ STA P9 
20c5 : a9 bf __ LDA #$bf
20c7 : 85 17 __ STA P10 
20c9 : a0 02 __ LDY #$02
20cb : b1 23 __ LDA (SP + 0),y 
20cd : 8d f7 bf STA $bff7 ; (sstack + 0)
20d0 : c8 __ __ INY
20d1 : b1 23 __ LDA (SP + 0),y 
20d3 : 8d f8 bf STA $bff8 ; (sstack + 1)
20d6 : 18 __ __ CLC
20d7 : a5 23 __ LDA SP + 0 
20d9 : 69 04 __ ADC #$04
20db : 8d f9 bf STA $bff9 ; (sstack + 2)
20de : a5 24 __ LDA SP + 1 
20e0 : 69 00 __ ADC #$00
20e2 : 8d fa bf STA $bffa ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s0:
20e5 : ad f7 bf LDA $bff7 ; (sstack + 0)
20e8 : 85 49 __ STA T1 + 0 
20ea : a9 00 __ LDA #$00
20ec : 85 47 __ STA T0 + 0 
20ee : ad f8 bf LDA $bff8 ; (sstack + 1)
20f1 : 85 4a __ STA T1 + 1 
.l1:
20f3 : a0 00 __ LDY #$00
20f5 : b1 49 __ LDA (T1 + 0),y 
20f7 : d0 2d __ BNE $2126 ; (sformat.s2 + 0)
.s3:
20f9 : a4 47 __ LDY T0 + 0 
20fb : 91 16 __ STA (P9),y ; (buff + 0)
20fd : 98 __ __ TYA
20fe : f0 1d __ BEQ $211d ; (sformat.s1070 + 0)
.s116:
2100 : ad fb bf LDA $bffb ; (sstack + 4)
2103 : d0 0d __ BNE $2112 ; (sformat.s119 + 0)
.s120:
2105 : 18 __ __ CLC
2106 : a5 16 __ LDA P9 ; (buff + 0)
2108 : 65 47 __ ADC T0 + 0 
210a : aa __ __ TAX
210b : a5 17 __ LDA P10 ; (buff + 1)
210d : 69 00 __ ADC #$00
210f : 4c 21 21 JMP $2121 ; (sformat.s1001 + 0)
.s119:
2112 : a5 16 __ LDA P9 ; (buff + 0)
2114 : 85 0d __ STA P0 
2116 : a5 17 __ LDA P10 ; (buff + 1)
2118 : 85 0e __ STA P1 
211a : 20 ab 24 JSR $24ab ; (puts.s0 + 0)
.s1070:
211d : a5 17 __ LDA P10 ; (buff + 1)
211f : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
2121 : 86 1b __ STX ACCU + 0 ; (fps + 0)
2123 : 85 1c __ STA ACCU + 1 ; (fps + 1)
2125 : 60 __ __ RTS
.s2:
2126 : c9 25 __ CMP #$25
2128 : f0 3e __ BEQ $2168 ; (sformat.s4 + 0)
.s5:
212a : a4 47 __ LDY T0 + 0 
212c : 91 16 __ STA (P9),y ; (buff + 0)
212e : e6 49 __ INC T1 + 0 
2130 : d0 02 __ BNE $2134 ; (sformat.s1098 + 0)
.s1097:
2132 : e6 4a __ INC T1 + 1 
.s1098:
2134 : c8 __ __ INY
2135 : 84 47 __ STY T0 + 0 
2137 : 98 __ __ TYA
2138 : c0 28 __ CPY #$28
213a : 90 b7 __ BCC $20f3 ; (sformat.l1 + 0)
.s110:
213c : 85 4c __ STA T5 + 0 
213e : a9 00 __ LDA #$00
2140 : 85 47 __ STA T0 + 0 
2142 : ad fb bf LDA $bffb ; (sstack + 4)
2145 : f0 14 __ BEQ $215b ; (sformat.s114 + 0)
.s113:
2147 : a5 16 __ LDA P9 ; (buff + 0)
2149 : 85 0d __ STA P0 
214b : a5 17 __ LDA P10 ; (buff + 1)
214d : 85 0e __ STA P1 
214f : a9 00 __ LDA #$00
2151 : a4 4c __ LDY T5 + 0 
2153 : 91 16 __ STA (P9),y ; (buff + 0)
2155 : 20 ab 24 JSR $24ab ; (puts.s0 + 0)
2158 : 4c f3 20 JMP $20f3 ; (sformat.l1 + 0)
.s114:
215b : 18 __ __ CLC
215c : a5 16 __ LDA P9 ; (buff + 0)
215e : 65 4c __ ADC T5 + 0 
2160 : 85 16 __ STA P9 ; (buff + 0)
2162 : 90 8f __ BCC $20f3 ; (sformat.l1 + 0)
.s1099:
2164 : e6 17 __ INC P10 ; (buff + 1)
2166 : b0 8b __ BCS $20f3 ; (sformat.l1 + 0)
.s4:
2168 : a5 47 __ LDA T0 + 0 
216a : f0 27 __ BEQ $2193 ; (sformat.s9 + 0)
.s7:
216c : 84 47 __ STY T0 + 0 
216e : 85 4c __ STA T5 + 0 
2170 : ad fb bf LDA $bffb ; (sstack + 4)
2173 : f0 13 __ BEQ $2188 ; (sformat.s11 + 0)
.s10:
2175 : a5 16 __ LDA P9 ; (buff + 0)
2177 : 85 0d __ STA P0 
2179 : a5 17 __ LDA P10 ; (buff + 1)
217b : 85 0e __ STA P1 
217d : 98 __ __ TYA
217e : a4 4c __ LDY T5 + 0 
2180 : 91 16 __ STA (P9),y ; (buff + 0)
2182 : 20 ab 24 JSR $24ab ; (puts.s0 + 0)
2185 : 4c 93 21 JMP $2193 ; (sformat.s9 + 0)
.s11:
2188 : 18 __ __ CLC
2189 : a5 16 __ LDA P9 ; (buff + 0)
218b : 65 4c __ ADC T5 + 0 
218d : 85 16 __ STA P9 ; (buff + 0)
218f : 90 02 __ BCC $2193 ; (sformat.s9 + 0)
.s1095:
2191 : e6 17 __ INC P10 ; (buff + 1)
.s9:
2193 : a9 00 __ LDA #$00
2195 : 8d e3 bf STA $bfe3 ; (wrapbuffer + 75)
2198 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 76)
219b : 8d e5 bf STA $bfe5 ; (wrapbuffer + 77)
219e : 8d e6 bf STA $bfe6 ; (wrapbuffer + 78)
21a1 : a9 0a __ LDA #$0a
21a3 : 8d e2 bf STA $bfe2 ; (wrapbuffer + 74)
21a6 : a0 01 __ LDY #$01
21a8 : b1 49 __ LDA (T1 + 0),y 
21aa : a2 20 __ LDX #$20
21ac : 8e df bf STX $bfdf ; (wrapbuffer + 71)
21af : a2 00 __ LDX #$00
21b1 : 8e e0 bf STX $bfe0 ; (wrapbuffer + 72)
21b4 : ca __ __ DEX
21b5 : 8e e1 bf STX $bfe1 ; (wrapbuffer + 73)
21b8 : aa __ __ TAX
21b9 : 18 __ __ CLC
21ba : a5 49 __ LDA T1 + 0 
21bc : 69 02 __ ADC #$02
21be : 4c cb 21 JMP $21cb ; (sformat.l14 + 0)
.s264:
21c1 : a0 00 __ LDY #$00
21c3 : b1 49 __ LDA (T1 + 0),y 
21c5 : aa __ __ TAX
21c6 : 18 __ __ CLC
21c7 : a5 49 __ LDA T1 + 0 
21c9 : 69 01 __ ADC #$01
.l14:
21cb : 85 49 __ STA T1 + 0 
21cd : 90 02 __ BCC $21d1 ; (sformat.s1082 + 0)
.s1081:
21cf : e6 4a __ INC T1 + 1 
.s1082:
21d1 : 8a __ __ TXA
21d2 : e0 2b __ CPX #$2b
21d4 : d0 07 __ BNE $21dd ; (sformat.s17 + 0)
.s16:
21d6 : a9 01 __ LDA #$01
21d8 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 76)
21db : d0 e4 __ BNE $21c1 ; (sformat.s264 + 0)
.s17:
21dd : c9 30 __ CMP #$30
21df : d0 06 __ BNE $21e7 ; (sformat.s20 + 0)
.s19:
21e1 : 8d df bf STA $bfdf ; (wrapbuffer + 71)
21e4 : 4c c1 21 JMP $21c1 ; (sformat.s264 + 0)
.s20:
21e7 : c9 23 __ CMP #$23
21e9 : d0 07 __ BNE $21f2 ; (sformat.s23 + 0)
.s22:
21eb : a9 01 __ LDA #$01
21ed : 8d e6 bf STA $bfe6 ; (wrapbuffer + 78)
21f0 : d0 cf __ BNE $21c1 ; (sformat.s264 + 0)
.s23:
21f2 : c9 2d __ CMP #$2d
21f4 : d0 07 __ BNE $21fd ; (sformat.s15 + 0)
.s25:
21f6 : a9 01 __ LDA #$01
21f8 : 8d e5 bf STA $bfe5 ; (wrapbuffer + 77)
21fb : d0 c4 __ BNE $21c1 ; (sformat.s264 + 0)
.s15:
21fd : 85 4c __ STA T5 + 0 
21ff : c9 30 __ CMP #$30
2201 : 90 55 __ BCC $2258 ; (sformat.s31 + 0)
.s32:
2203 : c9 3a __ CMP #$3a
2205 : b0 51 __ BCS $2258 ; (sformat.s31 + 0)
.s29:
2207 : a9 00 __ LDA #$00
2209 : 85 44 __ STA T6 + 0 
220b : 85 45 __ STA T6 + 1 
220d : e0 3a __ CPX #$3a
220f : b0 40 __ BCS $2251 ; (sformat.s35 + 0)
.l34:
2211 : a5 44 __ LDA T6 + 0 
2213 : 0a __ __ ASL
2214 : 85 1b __ STA ACCU + 0 ; (fps + 0)
2216 : a5 45 __ LDA T6 + 1 
2218 : 2a __ __ ROL
2219 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
221b : 2a __ __ ROL
221c : aa __ __ TAX
221d : 18 __ __ CLC
221e : a5 1b __ LDA ACCU + 0 ; (fps + 0)
2220 : 65 44 __ ADC T6 + 0 
2222 : 85 44 __ STA T6 + 0 
2224 : 8a __ __ TXA
2225 : 65 45 __ ADC T6 + 1 
2227 : 06 44 __ ASL T6 + 0 
2229 : 2a __ __ ROL
222a : aa __ __ TAX
222b : 18 __ __ CLC
222c : a5 44 __ LDA T6 + 0 
222e : 65 4c __ ADC T5 + 0 
2230 : 90 01 __ BCC $2233 ; (sformat.s1092 + 0)
.s1091:
2232 : e8 __ __ INX
.s1092:
2233 : 38 __ __ SEC
2234 : e9 30 __ SBC #$30
2236 : 85 44 __ STA T6 + 0 
2238 : 8a __ __ TXA
2239 : e9 00 __ SBC #$00
223b : 85 45 __ STA T6 + 1 
223d : a0 00 __ LDY #$00
223f : b1 49 __ LDA (T1 + 0),y 
2241 : 85 4c __ STA T5 + 0 
2243 : e6 49 __ INC T1 + 0 
2245 : d0 02 __ BNE $2249 ; (sformat.s1094 + 0)
.s1093:
2247 : e6 4a __ INC T1 + 1 
.s1094:
2249 : c9 30 __ CMP #$30
224b : 90 04 __ BCC $2251 ; (sformat.s35 + 0)
.s36:
224d : c9 3a __ CMP #$3a
224f : 90 c0 __ BCC $2211 ; (sformat.l34 + 0)
.s35:
2251 : a5 44 __ LDA T6 + 0 
2253 : 8d e0 bf STA $bfe0 ; (wrapbuffer + 72)
2256 : a5 4c __ LDA T5 + 0 
.s31:
2258 : c9 2e __ CMP #$2e
225a : d0 4d __ BNE $22a9 ; (sformat.s39 + 0)
.s37:
225c : a9 00 __ LDA #$00
225e : 85 44 __ STA T6 + 0 
2260 : f0 08 __ BEQ $226a ; (sformat.l243 + 0)
.s1090:
2262 : 38 __ __ SEC
2263 : e9 30 __ SBC #$30
2265 : 85 44 __ STA T6 + 0 
2267 : 8a __ __ TXA
2268 : e9 00 __ SBC #$00
.l243:
226a : 85 45 __ STA T6 + 1 
226c : a0 00 __ LDY #$00
226e : b1 49 __ LDA (T1 + 0),y 
2270 : 85 4c __ STA T5 + 0 
2272 : e6 49 __ INC T1 + 0 
2274 : d0 02 __ BNE $2278 ; (sformat.s1084 + 0)
.s1083:
2276 : e6 4a __ INC T1 + 1 
.s1084:
2278 : c9 30 __ CMP #$30
227a : 90 28 __ BCC $22a4 ; (sformat.s42 + 0)
.s43:
227c : c9 3a __ CMP #$3a
227e : b0 24 __ BCS $22a4 ; (sformat.s42 + 0)
.s41:
2280 : a5 44 __ LDA T6 + 0 
2282 : 0a __ __ ASL
2283 : 85 1b __ STA ACCU + 0 ; (fps + 0)
2285 : a5 45 __ LDA T6 + 1 
2287 : 2a __ __ ROL
2288 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
228a : 2a __ __ ROL
228b : aa __ __ TAX
228c : 18 __ __ CLC
228d : a5 1b __ LDA ACCU + 0 ; (fps + 0)
228f : 65 44 __ ADC T6 + 0 
2291 : 85 44 __ STA T6 + 0 
2293 : 8a __ __ TXA
2294 : 65 45 __ ADC T6 + 1 
2296 : 06 44 __ ASL T6 + 0 
2298 : 2a __ __ ROL
2299 : aa __ __ TAX
229a : 18 __ __ CLC
229b : a5 44 __ LDA T6 + 0 
229d : 65 4c __ ADC T5 + 0 
229f : 90 c1 __ BCC $2262 ; (sformat.s1090 + 0)
.s1089:
22a1 : e8 __ __ INX
22a2 : b0 be __ BCS $2262 ; (sformat.s1090 + 0)
.s42:
22a4 : a6 44 __ LDX T6 + 0 
22a6 : 8e e1 bf STX $bfe1 ; (wrapbuffer + 73)
.s39:
22a9 : c9 64 __ CMP #$64
22ab : f0 04 __ BEQ $22b1 ; (sformat.s44 + 0)
.s47:
22ad : c9 44 __ CMP #$44
22af : d0 05 __ BNE $22b6 ; (sformat.s45 + 0)
.s44:
22b1 : a9 01 __ LDA #$01
22b3 : 4c 6f 24 JMP $246f ; (sformat.s261 + 0)
.s45:
22b6 : c9 75 __ CMP #$75
22b8 : d0 03 __ BNE $22bd ; (sformat.s51 + 0)
22ba : 4c 6d 24 JMP $246d ; (sformat.s291 + 0)
.s51:
22bd : c9 55 __ CMP #$55
22bf : d0 03 __ BNE $22c4 ; (sformat.s49 + 0)
22c1 : 4c 6d 24 JMP $246d ; (sformat.s291 + 0)
.s49:
22c4 : c9 78 __ CMP #$78
22c6 : f0 04 __ BEQ $22cc ; (sformat.s52 + 0)
.s55:
22c8 : c9 58 __ CMP #$58
22ca : d0 0d __ BNE $22d9 ; (sformat.s53 + 0)
.s52:
22cc : a9 10 __ LDA #$10
22ce : 8d e2 bf STA $bfe2 ; (wrapbuffer + 74)
22d1 : a9 00 __ LDA #$00
22d3 : 8d e3 bf STA $bfe3 ; (wrapbuffer + 75)
22d6 : 4c 6d 24 JMP $246d ; (sformat.s291 + 0)
.s53:
22d9 : c9 6c __ CMP #$6c
22db : d0 03 __ BNE $22e0 ; (sformat.s59 + 0)
22dd : 4c f1 23 JMP $23f1 ; (sformat.s56 + 0)
.s59:
22e0 : c9 4c __ CMP #$4c
22e2 : d0 03 __ BNE $22e7 ; (sformat.s57 + 0)
22e4 : 4c f1 23 JMP $23f1 ; (sformat.s56 + 0)
.s57:
22e7 : c9 73 __ CMP #$73
22e9 : f0 54 __ BEQ $233f ; (sformat.s72 + 0)
.s75:
22eb : c9 53 __ CMP #$53
22ed : f0 50 __ BEQ $233f ; (sformat.s72 + 0)
.s73:
22ef : c9 63 __ CMP #$63
22f1 : f0 23 __ BEQ $2316 ; (sformat.s103 + 0)
.s106:
22f3 : c9 43 __ CMP #$43
22f5 : f0 1f __ BEQ $2316 ; (sformat.s103 + 0)
.s104:
22f7 : 09 00 __ ORA #$00
22f9 : d0 03 __ BNE $22fe ; (sformat.s107 + 0)
22fb : 4c f3 20 JMP $20f3 ; (sformat.l1 + 0)
.s107:
22fe : 18 __ __ CLC
22ff : a5 16 __ LDA P9 ; (buff + 0)
2301 : 65 47 __ ADC T0 + 0 
2303 : 85 44 __ STA T6 + 0 
2305 : a5 17 __ LDA P10 ; (buff + 1)
2307 : 69 00 __ ADC #$00
2309 : 85 45 __ STA T6 + 1 
230b : a5 4c __ LDA T5 + 0 
.s1068:
230d : a0 00 __ LDY #$00
230f : 91 44 __ STA (T6 + 0),y 
2311 : e6 47 __ INC T0 + 0 
2313 : 4c f3 20 JMP $20f3 ; (sformat.l1 + 0)
.s103:
2316 : ad f9 bf LDA $bff9 ; (sstack + 2)
2319 : 85 4c __ STA T5 + 0 
231b : 18 __ __ CLC
231c : 69 02 __ ADC #$02
231e : 8d f9 bf STA $bff9 ; (sstack + 2)
2321 : ad fa bf LDA $bffa ; (sstack + 3)
2324 : 85 4d __ STA T5 + 1 
2326 : 69 00 __ ADC #$00
2328 : 8d fa bf STA $bffa ; (sstack + 3)
232b : 18 __ __ CLC
232c : a5 16 __ LDA P9 ; (buff + 0)
232e : 65 47 __ ADC T0 + 0 
2330 : 85 44 __ STA T6 + 0 
2332 : a5 17 __ LDA P10 ; (buff + 1)
2334 : 69 00 __ ADC #$00
2336 : 85 45 __ STA T6 + 1 
2338 : a0 00 __ LDY #$00
233a : b1 4c __ LDA (T5 + 0),y 
233c : 4c 0d 23 JMP $230d ; (sformat.s1068 + 0)
.s72:
233f : ad f9 bf LDA $bff9 ; (sstack + 2)
2342 : 85 4c __ STA T5 + 0 
2344 : 18 __ __ CLC
2345 : 69 02 __ ADC #$02
2347 : 8d f9 bf STA $bff9 ; (sstack + 2)
234a : ad fa bf LDA $bffa ; (sstack + 3)
234d : 85 4d __ STA T5 + 1 
234f : 69 00 __ ADC #$00
2351 : 8d fa bf STA $bffa ; (sstack + 3)
2354 : a0 00 __ LDY #$00
2356 : 84 4b __ STY T3 + 0 
2358 : b1 4c __ LDA (T5 + 0),y 
235a : aa __ __ TAX
235b : c8 __ __ INY
235c : b1 4c __ LDA (T5 + 0),y 
235e : 86 4c __ STX T5 + 0 
2360 : 85 4d __ STA T5 + 1 
2362 : ad e0 bf LDA $bfe0 ; (wrapbuffer + 72)
2365 : f0 0c __ BEQ $2373 ; (sformat.s78 + 0)
.s1073:
2367 : 88 __ __ DEY
2368 : b1 4c __ LDA (T5 + 0),y 
236a : f0 05 __ BEQ $2371 ; (sformat.s1074 + 0)
.l80:
236c : c8 __ __ INY
236d : b1 4c __ LDA (T5 + 0),y 
236f : d0 fb __ BNE $236c ; (sformat.l80 + 0)
.s1074:
2371 : 84 4b __ STY T3 + 0 
.s78:
2373 : ad e5 bf LDA $bfe5 ; (wrapbuffer + 77)
2376 : d0 19 __ BNE $2391 ; (sformat.s84 + 0)
.s1077:
2378 : a6 4b __ LDX T3 + 0 
237a : ec e0 bf CPX $bfe0 ; (wrapbuffer + 72)
237d : a4 47 __ LDY T0 + 0 
237f : b0 0c __ BCS $238d ; (sformat.s1078 + 0)
.l86:
2381 : ad df bf LDA $bfdf ; (wrapbuffer + 71)
2384 : 91 16 __ STA (P9),y ; (buff + 0)
2386 : c8 __ __ INY
2387 : e8 __ __ INX
2388 : ec e0 bf CPX $bfe0 ; (wrapbuffer + 72)
238b : 90 f4 __ BCC $2381 ; (sformat.l86 + 0)
.s1078:
238d : 86 4b __ STX T3 + 0 
238f : 84 47 __ STY T0 + 0 
.s84:
2391 : ad fb bf LDA $bffb ; (sstack + 4)
2394 : d0 37 __ BNE $23cd ; (sformat.s88 + 0)
.l94:
2396 : a0 00 __ LDY #$00
2398 : b1 4c __ LDA (T5 + 0),y 
239a : f0 0f __ BEQ $23ab ; (sformat.s251 + 0)
.s95:
239c : a4 47 __ LDY T0 + 0 
239e : 91 16 __ STA (P9),y ; (buff + 0)
23a0 : e6 47 __ INC T0 + 0 
23a2 : e6 4c __ INC T5 + 0 
23a4 : d0 f0 __ BNE $2396 ; (sformat.l94 + 0)
.s1087:
23a6 : e6 4d __ INC T5 + 1 
23a8 : 4c 96 23 JMP $2396 ; (sformat.l94 + 0)
.s251:
23ab : ad e5 bf LDA $bfe5 ; (wrapbuffer + 77)
23ae : d0 03 __ BNE $23b3 ; (sformat.s1075 + 0)
23b0 : 4c f3 20 JMP $20f3 ; (sformat.l1 + 0)
.s1075:
23b3 : a6 4b __ LDX T3 + 0 
23b5 : ec e0 bf CPX $bfe0 ; (wrapbuffer + 72)
23b8 : a4 47 __ LDY T0 + 0 
23ba : b0 0c __ BCS $23c8 ; (sformat.s1076 + 0)
.l101:
23bc : ad df bf LDA $bfdf ; (wrapbuffer + 71)
23bf : 91 16 __ STA (P9),y ; (buff + 0)
23c1 : c8 __ __ INY
23c2 : e8 __ __ INX
23c3 : ec e0 bf CPX $bfe0 ; (wrapbuffer + 72)
23c6 : 90 f4 __ BCC $23bc ; (sformat.l101 + 0)
.s1076:
23c8 : 84 47 __ STY T0 + 0 
23ca : 4c f3 20 JMP $20f3 ; (sformat.l1 + 0)
.s88:
23cd : a5 47 __ LDA T0 + 0 
23cf : f0 12 __ BEQ $23e3 ; (sformat.s93 + 0)
.s91:
23d1 : a6 16 __ LDX P9 ; (buff + 0)
23d3 : 86 0d __ STX P0 
23d5 : a6 17 __ LDX P10 ; (buff + 1)
23d7 : 86 0e __ STX P1 
23d9 : a8 __ __ TAY
23da : a9 00 __ LDA #$00
23dc : 85 47 __ STA T0 + 0 
23de : 91 16 __ STA (P9),y ; (buff + 0)
23e0 : 20 ab 24 JSR $24ab ; (puts.s0 + 0)
.s93:
23e3 : a5 4c __ LDA T5 + 0 
23e5 : 85 0d __ STA P0 
23e7 : a5 4d __ LDA T5 + 1 
23e9 : 85 0e __ STA P1 
23eb : 20 ab 24 JSR $24ab ; (puts.s0 + 0)
23ee : 4c ab 23 JMP $23ab ; (sformat.s251 + 0)
.s56:
23f1 : ad f9 bf LDA $bff9 ; (sstack + 2)
23f4 : 85 4c __ STA T5 + 0 
23f6 : 18 __ __ CLC
23f7 : 69 04 __ ADC #$04
23f9 : 8d f9 bf STA $bff9 ; (sstack + 2)
23fc : ad fa bf LDA $bffa ; (sstack + 3)
23ff : 85 4d __ STA T5 + 1 
2401 : 69 00 __ ADC #$00
2403 : 8d fa bf STA $bffa ; (sstack + 3)
2406 : a0 00 __ LDY #$00
2408 : b1 49 __ LDA (T1 + 0),y 
240a : aa __ __ TAX
240b : e6 49 __ INC T1 + 0 
240d : d0 02 __ BNE $2411 ; (sformat.s1086 + 0)
.s1085:
240f : e6 4a __ INC T1 + 1 
.s1086:
2411 : b1 4c __ LDA (T5 + 0),y 
2413 : 85 11 __ STA P4 
2415 : a0 01 __ LDY #$01
2417 : b1 4c __ LDA (T5 + 0),y 
2419 : 85 12 __ STA P5 
241b : c8 __ __ INY
241c : b1 4c __ LDA (T5 + 0),y 
241e : 85 13 __ STA P6 
2420 : c8 __ __ INY
2421 : b1 4c __ LDA (T5 + 0),y 
2423 : 85 14 __ STA P7 
2425 : 8a __ __ TXA
2426 : e0 64 __ CPX #$64
2428 : f0 04 __ BEQ $242e ; (sformat.s60 + 0)
.s63:
242a : c9 44 __ CMP #$44
242c : d0 04 __ BNE $2432 ; (sformat.s61 + 0)
.s60:
242e : a9 01 __ LDA #$01
2430 : d0 1f __ BNE $2451 ; (sformat.s262 + 0)
.s61:
2432 : c9 75 __ CMP #$75
2434 : f0 19 __ BEQ $244f ; (sformat.s292 + 0)
.s67:
2436 : c9 55 __ CMP #$55
2438 : f0 15 __ BEQ $244f ; (sformat.s292 + 0)
.s65:
243a : c9 78 __ CMP #$78
243c : f0 07 __ BEQ $2445 ; (sformat.s68 + 0)
.s71:
243e : c9 58 __ CMP #$58
2440 : f0 03 __ BEQ $2445 ; (sformat.s68 + 0)
2442 : 4c f3 20 JMP $20f3 ; (sformat.l1 + 0)
.s68:
2445 : a9 10 __ LDA #$10
2447 : 8d e2 bf STA $bfe2 ; (wrapbuffer + 74)
244a : a9 00 __ LDA #$00
244c : 8d e3 bf STA $bfe3 ; (wrapbuffer + 75)
.s292:
244f : a9 00 __ LDA #$00
.s262:
2451 : 85 15 __ STA P8 
2453 : a5 16 __ LDA P9 ; (buff + 0)
2455 : 85 0f __ STA P2 
2457 : a5 17 __ LDA P10 ; (buff + 1)
2459 : 85 10 __ STA P3 
245b : a9 df __ LDA #$df
245d : 85 0d __ STA P0 
245f : a9 bf __ LDA #$bf
2461 : 85 0e __ STA P1 
2463 : 20 3b 26 JSR $263b ; (nforml.s0 + 0)
.s1069:
2466 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
2468 : 85 47 __ STA T0 + 0 
246a : 4c f3 20 JMP $20f3 ; (sformat.l1 + 0)
.s291:
246d : a9 00 __ LDA #$00
.s261:
246f : 85 13 __ STA P6 
2471 : a5 16 __ LDA P9 ; (buff + 0)
2473 : 85 0f __ STA P2 
2475 : a5 17 __ LDA P10 ; (buff + 1)
2477 : 85 10 __ STA P3 
2479 : ad f9 bf LDA $bff9 ; (sstack + 2)
247c : 85 47 __ STA T0 + 0 
247e : ad fa bf LDA $bffa ; (sstack + 3)
2481 : 85 48 __ STA T0 + 1 
2483 : a0 00 __ LDY #$00
2485 : b1 47 __ LDA (T0 + 0),y 
2487 : 85 11 __ STA P4 
2489 : c8 __ __ INY
248a : b1 47 __ LDA (T0 + 0),y 
248c : 85 12 __ STA P5 
248e : 18 __ __ CLC
248f : a5 47 __ LDA T0 + 0 
2491 : 69 02 __ ADC #$02
2493 : 8d f9 bf STA $bff9 ; (sstack + 2)
2496 : a5 48 __ LDA T0 + 1 
2498 : 69 00 __ ADC #$00
249a : 8d fa bf STA $bffa ; (sstack + 3)
249d : a9 df __ LDA #$df
249f : 85 0d __ STA P0 
24a1 : a9 bf __ LDA #$bf
24a3 : 85 0e __ STA P1 
24a5 : 20 00 25 JSR $2500 ; (nformi.s0 + 0)
24a8 : 4c 66 24 JMP $2466 ; (sformat.s1069 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
24ab : a0 00 __ LDY #$00
24ad : b1 0d __ LDA (P0),y 
24af : f0 0b __ BEQ $24bc ; (puts.s1001 + 0)
24b1 : 20 bd 24 JSR $24bd ; (putpch + 0)
24b4 : e6 0d __ INC P0 
24b6 : d0 f3 __ BNE $24ab ; (puts.s0 + 0)
24b8 : e6 0e __ INC P1 
24ba : d0 ef __ BNE $24ab ; (puts.s0 + 0)
.s1001:
24bc : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
24bd : ae ff 36 LDX $36ff ; (giocharmap + 0)
24c0 : e0 01 __ CPX #$01
24c2 : 90 26 __ BCC $24ea ; (putpch + 45)
24c4 : c9 0a __ CMP #$0a
24c6 : d0 02 __ BNE $24ca ; (putpch + 13)
24c8 : a9 0d __ LDA #$0d
24ca : c9 09 __ CMP #$09
24cc : f0 1f __ BEQ $24ed ; (putpch + 48)
24ce : e0 02 __ CPX #$02
24d0 : 90 18 __ BCC $24ea ; (putpch + 45)
24d2 : c9 41 __ CMP #$41
24d4 : 90 14 __ BCC $24ea ; (putpch + 45)
24d6 : c9 7b __ CMP #$7b
24d8 : b0 10 __ BCS $24ea ; (putpch + 45)
24da : c9 61 __ CMP #$61
24dc : b0 04 __ BCS $24e2 ; (putpch + 37)
24de : c9 5b __ CMP #$5b
24e0 : b0 08 __ BCS $24ea ; (putpch + 45)
24e2 : 49 20 __ EOR #$20
24e4 : e0 03 __ CPX #$03
24e6 : f0 02 __ BEQ $24ea ; (putpch + 45)
24e8 : 29 df __ AND #$df
24ea : 4c d2 ff JMP $ffd2 
24ed : 38 __ __ SEC
24ee : 20 f0 ff JSR $fff0 
24f1 : 98 __ __ TYA
24f2 : 29 03 __ AND #$03
24f4 : 49 03 __ EOR #$03
24f6 : aa __ __ TAX
24f7 : a9 20 __ LDA #$20
24f9 : 20 d2 ff JSR $ffd2 
24fc : ca __ __ DEX
24fd : 10 fa __ BPL $24f9 ; (putpch + 60)
24ff : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
2500 : a9 00 __ LDA #$00
2502 : 85 43 __ STA T0 + 0 
2504 : a5 13 __ LDA P6 ; (s + 0)
2506 : f0 19 __ BEQ $2521 ; (nformi.s3 + 0)
.s4:
2508 : 24 12 __ BIT P5 ; (v + 1)
250a : 10 15 __ BPL $2521 ; (nformi.s3 + 0)
.s1:
250c : 38 __ __ SEC
250d : a9 00 __ LDA #$00
250f : e5 11 __ SBC P4 ; (v + 0)
2511 : 85 11 __ STA P4 ; (v + 0)
2513 : a9 00 __ LDA #$00
2515 : e5 12 __ SBC P5 ; (v + 1)
2517 : 85 12 __ STA P5 ; (v + 1)
2519 : e6 43 __ INC T0 + 0 
251b : a9 10 __ LDA #$10
251d : 85 44 __ STA T2 + 0 
251f : d0 0a __ BNE $252b ; (nformi.s42 + 0)
.s3:
2521 : a9 10 __ LDA #$10
2523 : 85 44 __ STA T2 + 0 
2525 : a5 11 __ LDA P4 ; (v + 0)
2527 : 05 12 __ ORA P5 ; (v + 1)
2529 : f0 46 __ BEQ $2571 ; (nformi.s7 + 0)
.s42:
252b : a0 03 __ LDY #$03
252d : b1 0d __ LDA (P0),y ; (si + 0)
252f : 85 45 __ STA T3 + 0 
2531 : c8 __ __ INY
2532 : b1 0d __ LDA (P0),y ; (si + 0)
2534 : 85 46 __ STA T3 + 1 
.l6:
2536 : a5 11 __ LDA P4 ; (v + 0)
2538 : 85 1b __ STA ACCU + 0 
253a : a5 12 __ LDA P5 ; (v + 1)
253c : 85 1c __ STA ACCU + 1 
253e : a5 45 __ LDA T3 + 0 
2540 : 85 03 __ STA WORK + 0 
2542 : a5 46 __ LDA T3 + 1 
2544 : 85 04 __ STA WORK + 1 
2546 : 20 a0 65 JSR $65a0 ; (divmod + 0)
2549 : a5 06 __ LDA WORK + 3 
254b : 30 08 __ BMI $2555 ; (nformi.s78 + 0)
.s1019:
254d : d0 0a __ BNE $2559 ; (nformi.s77 + 0)
.s1018:
254f : a5 05 __ LDA WORK + 2 
2551 : c9 0a __ CMP #$0a
2553 : b0 04 __ BCS $2559 ; (nformi.s77 + 0)
.s78:
2555 : a9 30 __ LDA #$30
2557 : d0 02 __ BNE $255b ; (nformi.s79 + 0)
.s77:
2559 : a9 37 __ LDA #$37
.s79:
255b : c6 44 __ DEC T2 + 0 
255d : 18 __ __ CLC
255e : 65 05 __ ADC WORK + 2 
2560 : a6 44 __ LDX T2 + 0 
2562 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
2565 : a5 1b __ LDA ACCU + 0 
2567 : 85 11 __ STA P4 ; (v + 0)
2569 : a5 1c __ LDA ACCU + 1 
256b : 85 12 __ STA P5 ; (v + 1)
256d : 05 11 __ ORA P4 ; (v + 0)
256f : d0 c5 __ BNE $2536 ; (nformi.l6 + 0)
.s7:
2571 : a0 02 __ LDY #$02
2573 : b1 0d __ LDA (P0),y ; (si + 0)
2575 : c9 ff __ CMP #$ff
2577 : d0 04 __ BNE $257d ; (nformi.s80 + 0)
.s81:
2579 : a9 0f __ LDA #$0f
257b : d0 05 __ BNE $2582 ; (nformi.s1026 + 0)
.s80:
257d : 38 __ __ SEC
257e : a9 10 __ LDA #$10
2580 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
2582 : a8 __ __ TAY
2583 : c4 44 __ CPY T2 + 0 
2585 : b0 0d __ BCS $2594 ; (nformi.s10 + 0)
.s9:
2587 : a9 30 __ LDA #$30
.l1027:
2589 : c6 44 __ DEC T2 + 0 
258b : a6 44 __ LDX T2 + 0 
258d : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
2590 : c4 44 __ CPY T2 + 0 
2592 : 90 f5 __ BCC $2589 ; (nformi.l1027 + 0)
.s10:
2594 : a0 07 __ LDY #$07
2596 : b1 0d __ LDA (P0),y ; (si + 0)
2598 : f0 20 __ BEQ $25ba ; (nformi.s13 + 0)
.s14:
259a : a0 04 __ LDY #$04
259c : b1 0d __ LDA (P0),y ; (si + 0)
259e : d0 1a __ BNE $25ba ; (nformi.s13 + 0)
.s1013:
25a0 : 88 __ __ DEY
25a1 : b1 0d __ LDA (P0),y ; (si + 0)
25a3 : c9 10 __ CMP #$10
25a5 : d0 13 __ BNE $25ba ; (nformi.s13 + 0)
.s11:
25a7 : a9 58 __ LDA #$58
25a9 : a6 44 __ LDX T2 + 0 
25ab : 9d e6 bf STA $bfe6,x ; (wrapbuffer + 78)
25ae : 8a __ __ TXA
25af : 18 __ __ CLC
25b0 : 69 fe __ ADC #$fe
25b2 : 85 44 __ STA T2 + 0 
25b4 : aa __ __ TAX
25b5 : a9 30 __ LDA #$30
25b7 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
.s13:
25ba : a9 00 __ LDA #$00
25bc : 85 1b __ STA ACCU + 0 
25be : a5 43 __ LDA T0 + 0 
25c0 : f0 06 __ BEQ $25c8 ; (nformi.s16 + 0)
.s15:
25c2 : c6 44 __ DEC T2 + 0 
25c4 : a9 2d __ LDA #$2d
25c6 : d0 0a __ BNE $25d2 ; (nformi.s1025 + 0)
.s16:
25c8 : a0 05 __ LDY #$05
25ca : b1 0d __ LDA (P0),y ; (si + 0)
25cc : f0 09 __ BEQ $25d7 ; (nformi.s162 + 0)
.s18:
25ce : c6 44 __ DEC T2 + 0 
25d0 : a9 2b __ LDA #$2b
.s1025:
25d2 : a6 44 __ LDX T2 + 0 
25d4 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
.s162:
25d7 : a0 06 __ LDY #$06
25d9 : b1 0d __ LDA (P0),y ; (si + 0)
25db : d0 33 __ BNE $2610 ; (nformi.s24 + 0)
.l30:
25dd : a0 01 __ LDY #$01
25df : b1 0d __ LDA (P0),y ; (si + 0)
25e1 : 18 __ __ CLC
25e2 : 65 44 __ ADC T2 + 0 
25e4 : b0 04 __ BCS $25ea ; (nformi.s31 + 0)
.s1006:
25e6 : c9 11 __ CMP #$11
25e8 : 90 0d __ BCC $25f7 ; (nformi.s33 + 0)
.s31:
25ea : c6 44 __ DEC T2 + 0 
25ec : a0 00 __ LDY #$00
25ee : b1 0d __ LDA (P0),y ; (si + 0)
25f0 : a6 44 __ LDX T2 + 0 
25f2 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
25f5 : b0 e6 __ BCS $25dd ; (nformi.l30 + 0)
.s33:
25f7 : a6 44 __ LDX T2 + 0 
25f9 : e0 10 __ CPX #$10
25fb : b0 0e __ BCS $260b ; (nformi.s23 + 0)
.s34:
25fd : 88 __ __ DEY
.l1022:
25fe : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 79)
2601 : 91 0f __ STA (P2),y ; (str + 0)
2603 : c8 __ __ INY
2604 : e8 __ __ INX
2605 : e0 10 __ CPX #$10
2607 : 90 f5 __ BCC $25fe ; (nformi.l1022 + 0)
.s1023:
2609 : 84 1b __ STY ACCU + 0 
.s23:
260b : a9 00 __ LDA #$00
260d : 85 1c __ STA ACCU + 1 
.s1001:
260f : 60 __ __ RTS
.s24:
2610 : a6 44 __ LDX T2 + 0 
2612 : e0 10 __ CPX #$10
2614 : b0 1a __ BCS $2630 ; (nformi.l27 + 0)
.s25:
2616 : a0 00 __ LDY #$00
.l1020:
2618 : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 79)
261b : 91 0f __ STA (P2),y ; (str + 0)
261d : c8 __ __ INY
261e : e8 __ __ INX
261f : e0 10 __ CPX #$10
2621 : 90 f5 __ BCC $2618 ; (nformi.l1020 + 0)
.s1021:
2623 : 84 1b __ STY ACCU + 0 
2625 : b0 09 __ BCS $2630 ; (nformi.l27 + 0)
.s28:
2627 : 88 __ __ DEY
2628 : b1 0d __ LDA (P0),y ; (si + 0)
262a : a4 1b __ LDY ACCU + 0 
262c : 91 0f __ STA (P2),y ; (str + 0)
262e : e6 1b __ INC ACCU + 0 
.l27:
2630 : a5 1b __ LDA ACCU + 0 
2632 : a0 01 __ LDY #$01
2634 : d1 0d __ CMP (P0),y ; (si + 0)
2636 : 90 ef __ BCC $2627 ; (nformi.s28 + 0)
2638 : 4c 0b 26 JMP $260b ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
263b : a9 00 __ LDA #$00
263d : 85 43 __ STA T0 + 0 
263f : a5 15 __ LDA P8 ; (s + 0)
2641 : f0 21 __ BEQ $2664 ; (nforml.s182 + 0)
.s4:
2643 : a5 14 __ LDA P7 ; (v + 3)
2645 : f0 1d __ BEQ $2664 ; (nforml.s182 + 0)
.s1032:
2647 : 10 1b __ BPL $2664 ; (nforml.s182 + 0)
.s1:
2649 : 38 __ __ SEC
264a : a9 00 __ LDA #$00
264c : e5 11 __ SBC P4 ; (v + 0)
264e : 85 11 __ STA P4 ; (v + 0)
2650 : a9 00 __ LDA #$00
2652 : e5 12 __ SBC P5 ; (v + 1)
2654 : 85 12 __ STA P5 ; (v + 1)
2656 : a9 00 __ LDA #$00
2658 : e5 13 __ SBC P6 ; (v + 2)
265a : 85 13 __ STA P6 ; (v + 2)
265c : a9 00 __ LDA #$00
265e : e5 14 __ SBC P7 ; (v + 3)
2660 : 85 14 __ STA P7 ; (v + 3)
2662 : e6 43 __ INC T0 + 0 
.s182:
2664 : a9 10 __ LDA #$10
2666 : 85 44 __ STA T2 + 0 
2668 : a5 14 __ LDA P7 ; (v + 3)
266a : d0 0c __ BNE $2678 ; (nforml.s42 + 0)
.s1024:
266c : a5 13 __ LDA P6 ; (v + 2)
266e : d0 08 __ BNE $2678 ; (nforml.s42 + 0)
.s1025:
2670 : a5 12 __ LDA P5 ; (v + 1)
2672 : d0 04 __ BNE $2678 ; (nforml.s42 + 0)
.s1026:
2674 : c5 11 __ CMP P4 ; (v + 0)
2676 : b0 0e __ BCS $2686 ; (nforml.s7 + 0)
.s42:
2678 : a0 03 __ LDY #$03
267a : b1 0d __ LDA (P0),y ; (si + 0)
267c : 85 45 __ STA T5 + 0 
267e : c8 __ __ INY
267f : b1 0d __ LDA (P0),y ; (si + 0)
2681 : 85 46 __ STA T5 + 1 
2683 : 4c 50 27 JMP $2750 ; (nforml.l6 + 0)
.s7:
2686 : a0 02 __ LDY #$02
2688 : b1 0d __ LDA (P0),y ; (si + 0)
268a : c9 ff __ CMP #$ff
268c : d0 04 __ BNE $2692 ; (nforml.s80 + 0)
.s81:
268e : a9 0f __ LDA #$0f
2690 : d0 05 __ BNE $2697 ; (nforml.s1039 + 0)
.s80:
2692 : 38 __ __ SEC
2693 : a9 10 __ LDA #$10
2695 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
2697 : a8 __ __ TAY
2698 : c4 44 __ CPY T2 + 0 
269a : b0 0d __ BCS $26a9 ; (nforml.s10 + 0)
.s9:
269c : a9 30 __ LDA #$30
.l1040:
269e : c6 44 __ DEC T2 + 0 
26a0 : a6 44 __ LDX T2 + 0 
26a2 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
26a5 : c4 44 __ CPY T2 + 0 
26a7 : 90 f5 __ BCC $269e ; (nforml.l1040 + 0)
.s10:
26a9 : a0 07 __ LDY #$07
26ab : b1 0d __ LDA (P0),y ; (si + 0)
26ad : f0 20 __ BEQ $26cf ; (nforml.s13 + 0)
.s14:
26af : a0 04 __ LDY #$04
26b1 : b1 0d __ LDA (P0),y ; (si + 0)
26b3 : d0 1a __ BNE $26cf ; (nforml.s13 + 0)
.s1013:
26b5 : 88 __ __ DEY
26b6 : b1 0d __ LDA (P0),y ; (si + 0)
26b8 : c9 10 __ CMP #$10
26ba : d0 13 __ BNE $26cf ; (nforml.s13 + 0)
.s11:
26bc : a9 58 __ LDA #$58
26be : a6 44 __ LDX T2 + 0 
26c0 : 9d e6 bf STA $bfe6,x ; (wrapbuffer + 78)
26c3 : 8a __ __ TXA
26c4 : 18 __ __ CLC
26c5 : 69 fe __ ADC #$fe
26c7 : 85 44 __ STA T2 + 0 
26c9 : aa __ __ TAX
26ca : a9 30 __ LDA #$30
26cc : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
.s13:
26cf : a9 00 __ LDA #$00
26d1 : 85 1b __ STA ACCU + 0 
26d3 : a5 43 __ LDA T0 + 0 
26d5 : f0 06 __ BEQ $26dd ; (nforml.s16 + 0)
.s15:
26d7 : c6 44 __ DEC T2 + 0 
26d9 : a9 2d __ LDA #$2d
26db : d0 0a __ BNE $26e7 ; (nforml.s1038 + 0)
.s16:
26dd : a0 05 __ LDY #$05
26df : b1 0d __ LDA (P0),y ; (si + 0)
26e1 : f0 09 __ BEQ $26ec ; (nforml.s163 + 0)
.s18:
26e3 : c6 44 __ DEC T2 + 0 
26e5 : a9 2b __ LDA #$2b
.s1038:
26e7 : a6 44 __ LDX T2 + 0 
26e9 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
.s163:
26ec : a0 06 __ LDY #$06
26ee : b1 0d __ LDA (P0),y ; (si + 0)
26f0 : d0 33 __ BNE $2725 ; (nforml.s24 + 0)
.l30:
26f2 : a0 01 __ LDY #$01
26f4 : b1 0d __ LDA (P0),y ; (si + 0)
26f6 : 18 __ __ CLC
26f7 : 65 44 __ ADC T2 + 0 
26f9 : b0 04 __ BCS $26ff ; (nforml.s31 + 0)
.s1006:
26fb : c9 11 __ CMP #$11
26fd : 90 0d __ BCC $270c ; (nforml.s33 + 0)
.s31:
26ff : c6 44 __ DEC T2 + 0 
2701 : a0 00 __ LDY #$00
2703 : b1 0d __ LDA (P0),y ; (si + 0)
2705 : a6 44 __ LDX T2 + 0 
2707 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
270a : b0 e6 __ BCS $26f2 ; (nforml.l30 + 0)
.s33:
270c : a6 44 __ LDX T2 + 0 
270e : e0 10 __ CPX #$10
2710 : b0 0e __ BCS $2720 ; (nforml.s23 + 0)
.s34:
2712 : 88 __ __ DEY
.l1035:
2713 : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 79)
2716 : 91 0f __ STA (P2),y ; (str + 0)
2718 : c8 __ __ INY
2719 : e8 __ __ INX
271a : e0 10 __ CPX #$10
271c : 90 f5 __ BCC $2713 ; (nforml.l1035 + 0)
.s1036:
271e : 84 1b __ STY ACCU + 0 
.s23:
2720 : a9 00 __ LDA #$00
2722 : 85 1c __ STA ACCU + 1 
.s1001:
2724 : 60 __ __ RTS
.s24:
2725 : a6 44 __ LDX T2 + 0 
2727 : e0 10 __ CPX #$10
2729 : b0 1a __ BCS $2745 ; (nforml.l27 + 0)
.s25:
272b : a0 00 __ LDY #$00
.l1033:
272d : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 79)
2730 : 91 0f __ STA (P2),y ; (str + 0)
2732 : c8 __ __ INY
2733 : e8 __ __ INX
2734 : e0 10 __ CPX #$10
2736 : 90 f5 __ BCC $272d ; (nforml.l1033 + 0)
.s1034:
2738 : 84 1b __ STY ACCU + 0 
273a : b0 09 __ BCS $2745 ; (nforml.l27 + 0)
.s28:
273c : 88 __ __ DEY
273d : b1 0d __ LDA (P0),y ; (si + 0)
273f : a4 1b __ LDY ACCU + 0 
2741 : 91 0f __ STA (P2),y ; (str + 0)
2743 : e6 1b __ INC ACCU + 0 
.l27:
2745 : a5 1b __ LDA ACCU + 0 
2747 : a0 01 __ LDY #$01
2749 : d1 0d __ CMP (P0),y ; (si + 0)
274b : 90 ef __ BCC $273c ; (nforml.s28 + 0)
274d : 4c 20 27 JMP $2720 ; (nforml.s23 + 0)
.l6:
2750 : a5 11 __ LDA P4 ; (v + 0)
2752 : 85 1b __ STA ACCU + 0 
2754 : a5 12 __ LDA P5 ; (v + 1)
2756 : 85 1c __ STA ACCU + 1 
2758 : a5 13 __ LDA P6 ; (v + 2)
275a : 85 1d __ STA ACCU + 2 
275c : a5 14 __ LDA P7 ; (v + 3)
275e : 85 1e __ STA ACCU + 3 
2760 : a5 45 __ LDA T5 + 0 
2762 : 85 03 __ STA WORK + 0 
2764 : a5 46 __ LDA T5 + 1 
2766 : 85 04 __ STA WORK + 1 
2768 : a9 00 __ LDA #$00
276a : 85 05 __ STA WORK + 2 
276c : 85 06 __ STA WORK + 3 
276e : 20 25 66 JSR $6625 ; (divmod32 + 0)
2771 : a5 08 __ LDA WORK + 5 
2773 : 30 08 __ BMI $277d ; (nforml.s78 + 0)
.s1023:
2775 : d0 0a __ BNE $2781 ; (nforml.s77 + 0)
.s1022:
2777 : a5 07 __ LDA WORK + 4 
2779 : c9 0a __ CMP #$0a
277b : b0 04 __ BCS $2781 ; (nforml.s77 + 0)
.s78:
277d : a9 30 __ LDA #$30
277f : d0 02 __ BNE $2783 ; (nforml.s79 + 0)
.s77:
2781 : a9 37 __ LDA #$37
.s79:
2783 : c6 44 __ DEC T2 + 0 
2785 : 18 __ __ CLC
2786 : 65 07 __ ADC WORK + 4 
2788 : a6 44 __ LDX T2 + 0 
278a : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
278d : a5 1b __ LDA ACCU + 0 
278f : 85 11 __ STA P4 ; (v + 0)
2791 : a5 1c __ LDA ACCU + 1 
2793 : 85 12 __ STA P5 ; (v + 1)
2795 : a5 1d __ LDA ACCU + 2 
2797 : 85 13 __ STA P6 ; (v + 2)
2799 : a5 1e __ LDA ACCU + 3 
279b : 85 14 __ STA P7 ; (v + 3)
279d : d0 b1 __ BNE $2750 ; (nforml.l6 + 0)
.s1018:
279f : a5 13 __ LDA P6 ; (v + 2)
27a1 : d0 ad __ BNE $2750 ; (nforml.l6 + 0)
.s1019:
27a3 : a5 12 __ LDA P5 ; (v + 1)
27a5 : d0 a9 __ BNE $2750 ; (nforml.l6 + 0)
.s1020:
27a7 : c5 11 __ CMP P4 ; (v + 0)
27a9 : 90 a5 __ BCC $2750 ; (nforml.l6 + 0)
27ab : 4c 86 26 JMP $2686 ; (nforml.s7 + 0)
--------------------------------------------------------------------
27ae : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
27be : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
27ce : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
27d8 : __ __ __ BYT 56 44 43 54 45 53 54 4c 4d 43 00                : VDCTESTLMC.
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
27e3 : a5 0d __ LDA P0 
27e5 : 05 0e __ ORA P1 
27e7 : f0 08 __ BEQ $27f1 ; (krnio_setnam.s0 + 14)
27e9 : a0 ff __ LDY #$ff
27eb : c8 __ __ INY
27ec : b1 0d __ LDA (P0),y 
27ee : d0 fb __ BNE $27eb ; (krnio_setnam.s0 + 8)
27f0 : 98 __ __ TYA
27f1 : a6 0d __ LDX P0 
27f3 : a4 0e __ LDY P1 
27f5 : 20 bd ff JSR $ffbd 
.s1001:
27f8 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode@proxy: ; vdc_set_mode@proxy
27f9 : a9 00 __ LDA #$00
27fb : 85 16 __ STA P9 
27fd : 4c 1a 2d JMP $2d1a ; (vdc_set_mode.s1000 + 0)
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
285c : ae fe 36 LDX $36fe ; (spentry + 0)
285f : 9a __ __ TXS
2860 : a9 4c __ LDA #$4c
2862 : 85 54 __ STA $54 
2864 : a9 00 __ LDA #$00
2866 : 85 13 __ STA P6 
.s1001:
2868 : 60 __ __ RTS
--------------------------------------------------------------------
2869 : __ __ __ BYT 49 4e 49 54 49 41 4c 49 5a 45 20 46 41 53 54 20 : INITIALIZE FAST 
2879 : __ __ __ BYT 4c 4f 41 44 20 44 52 49 56 45 20 43 4f 44 45 2e : LOAD DRIVE CODE.
2889 : __ __ __ BYT 0a 00                                           : ..
--------------------------------------------------------------------
iec_open: ; iec_open(u8,u8,const u8*)->void
.s0:
288b : a9 00 __ LDA #$00
288d : 85 44 __ STA T0 + 0 
288f : 8d fa 69 STA $69fa ; (iec_status + 0)
2892 : a5 11 __ LDA P4 ; (dev + 0)
2894 : 09 20 __ ORA #$20
2896 : 85 0f __ STA P2 
2898 : a5 12 __ LDA P5 ; (sec + 0)
289a : 09 f0 __ ORA #$f0
289c : 85 10 __ STA P3 
289e : 20 f3 28 JSR $28f3 ; (iec_atn.s0 + 0)
28a1 : 4c ab 28 JMP $28ab ; (iec_open.l1 + 0)
.s2:
28a4 : 85 0f __ STA P2 
28a6 : 20 cf 29 JSR $29cf ; (iec_write.s0 + 0)
28a9 : e6 44 __ INC T0 + 0 
.l1:
28ab : a4 44 __ LDY T0 + 0 
28ad : b1 13 __ LDA (P6),y ; (fname + 0)
28af : d0 f3 __ BNE $28a4 ; (iec_open.s2 + 0)
--------------------------------------------------------------------
iec_unlisten: ; iec_unlisten()->void
.s0:
28b1 : 08 __ __ PHP
28b2 : 78 __ __ SEI
28b3 : ad fa 69 LDA $69fa ; (iec_status + 0)
28b6 : c9 02 __ CMP #$02
28b8 : d0 13 __ BNE $28cd ; (iec_unlisten.s3 + 0)
.s1:
28ba : a9 00 __ LDA #$00
28bc : 8d fa 69 STA $69fa ; (iec_status + 0)
28bf : 20 9c 29 JSR $299c ; (iec_eoib.s0 + 0)
28c2 : ad fb 69 LDA $69fb ; (iec_queue + 0)
28c5 : 85 0e __ STA P1 
28c7 : 20 46 29 JSR $2946 ; (iec_writeb.s0 + 0)
28ca : 20 ae 29 JSR $29ae ; (data_check.s0 + 0)
.s3:
28cd : a9 3f __ LDA #$3f
28cf : 85 0f __ STA P2 
28d1 : a9 ff __ LDA #$ff
28d3 : 85 10 __ STA P3 
28d5 : 20 f3 28 JSR $28f3 ; (iec_atn.s0 + 0)
28d8 : ad 00 dd LDA $dd00 
28db : 29 ef __ AND #$ef
28dd : 8d 00 dd STA $dd00 
28e0 : 28 __ __ PLP
.s1001:
28e1 : 60 __ __ RTS
--------------------------------------------------------------------
iec_listen: ; iec_listen(u8,u8)->void
.s0:
28e2 : a5 11 __ LDA P4 ; (dev + 0)
28e4 : 09 20 __ ORA #$20
28e6 : 85 0f __ STA P2 
28e8 : a9 00 __ LDA #$00
28ea : 8d fa 69 STA $69fa ; (iec_status + 0)
28ed : a5 12 __ LDA P5 ; (sec + 0)
28ef : 09 60 __ ORA #$60
28f1 : 85 10 __ STA P3 
--------------------------------------------------------------------
iec_atn: ; iec_atn(u8,u8)->void
.s0:
28f3 : ad 00 dd LDA $dd00 
28f6 : 29 ef __ AND #$ef
28f8 : 8d 00 dd STA $dd00 
28fb : ad 00 dd LDA $dd00 
28fe : 29 df __ AND #$df
2900 : 8d 00 dd STA $dd00 
2903 : ad 00 dd LDA $dd00 
2906 : 09 08 __ ORA #$08
2908 : 8d 00 dd STA $dd00 
290b : ad 00 dd LDA $dd00 
290e : 09 10 __ ORA #$10
2910 : 8d 00 dd STA $dd00 
2913 : a9 c8 __ LDA #$c8
2915 : 20 3e 29 JSR $293e ; (delay.s1000 + 0)
.l5:
2918 : 2c 00 dd BIT $dd00 
291b : 30 fb __ BMI $2918 ; (iec_atn.l5 + 0)
.s7:
291d : a5 0f __ LDA P2 ; (dev + 0)
291f : 85 0e __ STA P1 
2921 : 20 46 29 JSR $2946 ; (iec_writeb.s0 + 0)
2924 : 20 ae 29 JSR $29ae ; (data_check.s0 + 0)
2927 : a5 10 __ LDA P3 ; (sec + 0)
2929 : c9 ff __ CMP #$ff
292b : f0 08 __ BEQ $2935 ; (iec_atn.s13 + 0)
.s10:
292d : 85 0e __ STA P1 
292f : 20 46 29 JSR $2946 ; (iec_writeb.s0 + 0)
2932 : 20 ae 29 JSR $29ae ; (data_check.s0 + 0)
.s13:
2935 : ad 00 dd LDA $dd00 
2938 : 29 f7 __ AND #$f7
293a : 8d 00 dd STA $dd00 
.s1001:
293d : 60 __ __ RTS
--------------------------------------------------------------------
delay: ; delay(u8)->void
.s1000:
293e : 85 0d __ STA P0 
.s0:
2940 : a6 0d __ LDX P0 
2942 : ca __ __ DEX
2943 : d0 fd __ BNE $2942 ; (delay.s0 + 2)
.s1001:
2945 : 60 __ __ RTS
--------------------------------------------------------------------
iec_writeb: ; iec_writeb(u8)->void
.s0:
2946 : ad 00 dd LDA $dd00 
2949 : 29 ef __ AND #$ef
294b : 8d 00 dd STA $dd00 
.l2:
294e : 2c 00 dd BIT $dd00 
2951 : 10 fb __ BPL $294e ; (iec_writeb.l2 + 0)
.s4:
2953 : a9 05 __ LDA #$05
2955 : 20 3e 29 JSR $293e ; (delay.s1000 + 0)
2958 : a9 08 __ LDA #$08
295a : 85 43 __ STA T0 + 0 
.l8:
295c : ad 00 dd LDA $dd00 
295f : 09 10 __ ORA #$10
2961 : 8d 00 dd STA $dd00 
2964 : a9 05 __ LDA #$05
2966 : 20 3e 29 JSR $293e ; (delay.s1000 + 0)
2969 : a5 0e __ LDA P1 ; (b + 0)
296b : 4a __ __ LSR
296c : ad 00 dd LDA $dd00 
296f : 29 df __ AND #$df
2971 : b0 02 __ BCS $2975 ; (iec_writeb.s17 + 0)
.s13:
2973 : 09 20 __ ORA #$20
.s17:
2975 : 8d 00 dd STA $dd00 
2978 : ad 00 dd LDA $dd00 
297b : 29 ef __ AND #$ef
297d : 8d 00 dd STA $dd00 
2980 : 46 0e __ LSR P1 ; (b + 0)
2982 : a9 05 __ LDA #$05
2984 : 20 3e 29 JSR $293e ; (delay.s1000 + 0)
2987 : c6 43 __ DEC T0 + 0 
2989 : d0 d1 __ BNE $295c ; (iec_writeb.l8 + 0)
.s10:
298b : ad 00 dd LDA $dd00 
298e : 09 10 __ ORA #$10
2990 : 8d 00 dd STA $dd00 
2993 : ad 00 dd LDA $dd00 
2996 : 29 df __ AND #$df
2998 : 8d 00 dd STA $dd00 
.s1001:
299b : 60 __ __ RTS
--------------------------------------------------------------------
iec_eoib: ; iec_eoib()->void
.s0:
299c : ad 00 dd LDA $dd00 
299f : 29 ef __ AND #$ef
29a1 : 8d 00 dd STA $dd00 
.l2:
29a4 : 2c 00 dd BIT $dd00 
29a7 : 10 fb __ BPL $29a4 ; (iec_eoib.l2 + 0)
.s4:
29a9 : a9 28 __ LDA #$28
29ab : 20 3e 29 JSR $293e ; (delay.s1000 + 0)
--------------------------------------------------------------------
data_check: ; data_check()->void
.s0:
29ae : a9 c8 __ LDA #$c8
29b0 : 85 43 __ STA T0 + 0 
29b2 : 2c 00 dd BIT $dd00 
29b5 : 10 0e __ BPL $29c5 ; (data_check.s3 + 0)
.l2:
29b7 : a9 05 __ LDA #$05
29b9 : 20 3e 29 JSR $293e ; (delay.s1000 + 0)
29bc : c6 43 __ DEC T0 + 0 
29be : f0 05 __ BEQ $29c5 ; (data_check.s3 + 0)
.s4:
29c0 : 2c 00 dd BIT $dd00 
29c3 : 30 f2 __ BMI $29b7 ; (data_check.l2 + 0)
.s3:
29c5 : a5 43 __ LDA T0 + 0 
29c7 : d0 05 __ BNE $29ce ; (data_check.s1001 + 0)
.s8:
29c9 : a9 82 __ LDA #$82
29cb : 8d fa 69 STA $69fa ; (iec_status + 0)
.s1001:
29ce : 60 __ __ RTS
--------------------------------------------------------------------
iec_write: ; iec_write(u8)->void
.s0:
29cf : ad fa 69 LDA $69fa ; (iec_status + 0)
29d2 : c9 02 __ CMP #$02
29d4 : d0 16 __ BNE $29ec ; (iec_write.s3 + 0)
.s1:
29d6 : 08 __ __ PHP
29d7 : 78 __ __ SEI
29d8 : a9 00 __ LDA #$00
29da : 8d fa 69 STA $69fa ; (iec_status + 0)
29dd : ad fb 69 LDA $69fb ; (iec_queue + 0)
29e0 : 85 0e __ STA P1 
29e2 : 20 46 29 JSR $2946 ; (iec_writeb.s0 + 0)
29e5 : 28 __ __ PLP
29e6 : 20 ae 29 JSR $29ae ; (data_check.s0 + 0)
29e9 : ad fa 69 LDA $69fa ; (iec_status + 0)
.s3:
29ec : 09 00 __ ORA #$00
29ee : 30 0a __ BMI $29fa ; (iec_write.s1001 + 0)
.s4:
29f0 : a9 02 __ LDA #$02
29f2 : 8d fa 69 STA $69fa ; (iec_status + 0)
29f5 : a5 0f __ LDA P2 ; (b + 0)
29f7 : 8d fb 69 STA $69fb ; (iec_queue + 0)
.s1001:
29fa : 60 __ __ RTS
--------------------------------------------------------------------
iec_close: ; iec_close(u8,u8)->void
.s0:
29fb : a5 11 __ LDA P4 ; (dev + 0)
29fd : 09 20 __ ORA #$20
29ff : 85 0f __ STA P2 
2a01 : a5 12 __ LDA P5 ; (sec + 0)
2a03 : 09 e0 __ ORA #$e0
2a05 : 85 10 __ STA P3 
2a07 : 20 f3 28 JSR $28f3 ; (iec_atn.s0 + 0)
2a0a : 4c b1 28 JMP $28b1 ; (iec_unlisten.s0 + 0)
--------------------------------------------------------------------
2a0d : __ __ __ BYT 53 43 52 45 45 4d 31 2c 53 43 52 45 45 4e 32 2c : SCREEM1,SCREEN2,
2a1d : __ __ __ BYT 53 43 52 45 45 4e 33 2c 43 48 41 52 53 31 2c 43 : SCREEN3,CHARS1,C
2a2d : __ __ __ BYT 48 41 52 53 32 2c 4d 55 53 49 43 31 2c 4d 55 53 : HARS2,MUSIC1,MUS
2a3d : __ __ __ BYT 49 43 32 00                                     : IC2.
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
2a41 : 38 __ __ SEC
2a42 : a5 23 __ LDA SP + 0 
2a44 : e9 04 __ SBC #$04
2a46 : 85 23 __ STA SP + 0 
2a48 : b0 02 __ BCS $2a4c ; (vdc_init.s0 + 0)
2a4a : c6 24 __ DEC SP + 1 
.s0:
2a4c : a9 1a __ LDA #$1a
2a4e : 8d 00 d6 STA $d600 
.l463:
2a51 : 2c 00 d6 BIT $d600 
2a54 : 10 fb __ BPL $2a51 ; (vdc_init.l463 + 0)
.s7:
2a56 : ad 01 d6 LDA $d601 
2a59 : 29 f0 __ AND #$f0
2a5b : aa __ __ TAX
2a5c : a9 1a __ LDA #$1a
2a5e : 8d 00 d6 STA $d600 
.l465:
2a61 : 2c 00 d6 BIT $d600 
2a64 : 10 fb __ BPL $2a61 ; (vdc_init.l465 + 0)
.s13:
2a66 : 8e 01 d6 STX $d601 
2a69 : 8d 00 d6 STA $d600 
.l467:
2a6c : 2c 00 d6 BIT $d600 
2a6f : 10 fb __ BPL $2a6c ; (vdc_init.l467 + 0)
.s20:
2a71 : ad 01 d6 LDA $d601 
2a74 : 29 0f __ AND #$0f
2a76 : 09 d0 __ ORA #$d0
2a78 : a2 1a __ LDX #$1a
2a7a : 8e 00 d6 STX $d600 
.l469:
2a7d : 2c 00 d6 BIT $d600 
2a80 : 10 fb __ BPL $2a7d ; (vdc_init.l469 + 0)
.s26:
2a82 : 8d 01 d6 STA $d601 
2a85 : a9 8d __ LDA #$8d
2a87 : 8d 63 6e STA $6e63 ; (vdc_state + 7)
2a8a : a9 1c __ LDA #$1c
2a8c : 8d 00 d6 STA $d600 
.l471:
2a8f : 2c 00 d6 BIT $d600 
2a92 : 10 fb __ BPL $2a8f ; (vdc_init.l471 + 0)
.s32:
2a94 : ad 01 d6 LDA $d601 
2a97 : aa __ __ TAX
2a98 : 09 10 __ ORA #$10
2a9a : a0 1c __ LDY #$1c
2a9c : 8c 00 d6 STY $d600 
.l473:
2a9f : 2c 00 d6 BIT $d600 
2aa2 : 10 fb __ BPL $2a9f ; (vdc_init.l473 + 0)
.s39:
2aa4 : 8d 01 d6 STA $d601 
2aa7 : a9 12 __ LDA #$12
2aa9 : 8d 00 d6 STA $d600 
.l475:
2aac : 2c 00 d6 BIT $d600 
2aaf : 10 fb __ BPL $2aac ; (vdc_init.l475 + 0)
.s46:
2ab1 : a9 1f __ LDA #$1f
2ab3 : 8d 01 d6 STA $d601 
2ab6 : a9 13 __ LDA #$13
2ab8 : 8d 00 d6 STA $d600 
.l477:
2abb : 2c 00 d6 BIT $d600 
2abe : 10 fb __ BPL $2abb ; (vdc_init.l477 + 0)
.s51:
2ac0 : a9 ff __ LDA #$ff
2ac2 : 8d 01 d6 STA $d601 
2ac5 : a9 1f __ LDA #$1f
2ac7 : 8d 00 d6 STA $d600 
.l479:
2aca : 2c 00 d6 BIT $d600 
2acd : 10 fb __ BPL $2aca ; (vdc_init.l479 + 0)
.s55:
2acf : a9 00 __ LDA #$00
2ad1 : 8d 01 d6 STA $d601 
2ad4 : a9 12 __ LDA #$12
2ad6 : 8d 00 d6 STA $d600 
.l481:
2ad9 : 2c 00 d6 BIT $d600 
2adc : 10 fb __ BPL $2ad9 ; (vdc_init.l481 + 0)
.s62:
2ade : a9 9f __ LDA #$9f
2ae0 : 8d 01 d6 STA $d601 
2ae3 : a9 13 __ LDA #$13
2ae5 : 8d 00 d6 STA $d600 
.l483:
2ae8 : 2c 00 d6 BIT $d600 
2aeb : 10 fb __ BPL $2ae8 ; (vdc_init.l483 + 0)
.s67:
2aed : a9 ff __ LDA #$ff
2aef : 8d 01 d6 STA $d601 
2af2 : a9 1f __ LDA #$1f
2af4 : 8d 00 d6 STA $d600 
.l485:
2af7 : 2c 00 d6 BIT $d600 
2afa : 10 fb __ BPL $2af7 ; (vdc_init.l485 + 0)
.s71:
2afc : a9 ff __ LDA #$ff
2afe : 8d 01 d6 STA $d601 
2b01 : a9 12 __ LDA #$12
2b03 : 8d 00 d6 STA $d600 
.l487:
2b06 : 2c 00 d6 BIT $d600 
2b09 : 10 fb __ BPL $2b06 ; (vdc_init.l487 + 0)
.s78:
2b0b : a9 1f __ LDA #$1f
2b0d : 8d 01 d6 STA $d601 
2b10 : a9 13 __ LDA #$13
2b12 : 8d 00 d6 STA $d600 
.l489:
2b15 : 2c 00 d6 BIT $d600 
2b18 : 10 fb __ BPL $2b15 ; (vdc_init.l489 + 0)
.s83:
2b1a : a9 ff __ LDA #$ff
2b1c : 8d 01 d6 STA $d601 
2b1f : a9 1f __ LDA #$1f
2b21 : 8d 00 d6 STA $d600 
.l491:
2b24 : 2c 00 d6 BIT $d600 
2b27 : 10 fb __ BPL $2b24 ; (vdc_init.l491 + 0)
.s87:
2b29 : ad 01 d6 LDA $d601 
2b2c : f0 04 __ BEQ $2b32 ; (vdc_init.s1038 + 0)
.s1039:
2b2e : a9 10 __ LDA #$10
2b30 : d0 02 __ BNE $2b34 ; (vdc_init.s1040 + 0)
.s1038:
2b32 : a9 40 __ LDA #$40
.s1040:
2b34 : 8d 5c 6e STA $6e5c ; (vdc_state + 0)
2b37 : 8c 00 d6 STY $d600 
.l494:
2b3a : 2c 00 d6 BIT $d600 
2b3d : 10 fb __ BPL $2b3a ; (vdc_init.l494 + 0)
.s94:
2b3f : 8e 01 d6 STX $d601 
2b42 : 20 7e 2b JSR $2b7e ; (vdc_cls.s0 + 0)
2b45 : 24 d7 __ BIT $d7 
2b47 : 30 17 __ BMI $2b60 ; (vdc_init.s97 + 0)
.s100:
2b49 : a9 8b __ LDA #$8b
2b4b : a0 02 __ LDY #$02
2b4d : 91 23 __ STA (SP + 0),y 
2b4f : a9 2c __ LDA #$2c
2b51 : c8 __ __ INY
2b52 : 91 23 __ STA (SP + 0),y 
2b54 : 20 bc 20 JSR $20bc ; (printf.s0 + 0)
2b57 : 20 b6 2c JSR $2cb6 ; (getch.s0 + 0)
2b5a : 20 81 ff JSR $ff81 
2b5d : 20 f3 2c JSR $2cf3 ; (screen_setmode.s0 + 0)
.s97:
2b60 : a9 01 __ LDA #$01
2b62 : 20 fb 2c JSR $2cfb ; (fastmode.s0 + 0)
2b65 : 20 f9 27 JSR $27f9 ; (vdc_set_mode@proxy + 0)
2b68 : ad 5c 6e LDA $6e5c ; (vdc_state + 0)
2b6b : c9 40 __ CMP #$40
2b6d : d0 03 __ BNE $2b72 ; (vdc_init.s1001 + 0)
.s107:
2b6f : 20 0f 2f JSR $2f0f ; (vdc_set_extended_memsize.s0 + 0)
.s1001:
2b72 : 18 __ __ CLC
2b73 : a5 23 __ LDA SP + 0 
2b75 : 69 04 __ ADC #$04
2b77 : 85 23 __ STA SP + 0 
2b79 : 90 02 __ BCC $2b7d ; (vdc_init.s1001 + 11)
2b7b : e6 24 __ INC SP + 1 
2b7d : 60 __ __ RTS
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
2b7e : a9 00 __ LDA #$00
2b80 : 85 0f __ STA P2 
2b82 : 85 14 __ STA P7 
2b84 : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
2b87 : 85 13 __ STA P6 
2b89 : a9 20 __ LDA #$20
2b8b : 85 11 __ STA P4 
2b8d : ad 61 6e LDA $6e61 ; (vdc_state + 5)
2b90 : 85 15 __ STA P8 
--------------------------------------------------------------------
vdc_clear: ; vdc_clear(u8,u8,u8,u8,u8)->void
.s0:
2b92 : 18 __ __ CLC
2b93 : a5 14 __ LDA P7 ; (y + 0)
2b95 : 65 15 __ ADC P8 ; (lines + 0)
2b97 : 85 46 __ STA T1 + 0 
2b99 : a9 00 __ LDA #$00
2b9b : 2a __ __ ROL
2b9c : 85 47 __ STA T1 + 1 
2b9e : 90 09 __ BCC $2ba9 ; (vdc_clear.l1 + 0)
.s2:
2ba0 : 85 10 __ STA P3 
2ba2 : 20 b7 2b JSR $2bb7 ; (vdc_hchar@proxy + 0)
2ba5 : e6 14 __ INC P7 ; (y + 0)
2ba7 : a5 47 __ LDA T1 + 1 
.l1:
2ba9 : f0 05 __ BEQ $2bb0 ; (vdc_clear.s1002 + 0)
.s1004:
2bab : a5 14 __ LDA P7 ; (y + 0)
2bad : 4c a0 2b JMP $2ba0 ; (vdc_clear.s2 + 0)
.s1002:
2bb0 : a5 14 __ LDA P7 ; (y + 0)
2bb2 : c5 46 __ CMP T1 + 0 
2bb4 : 90 ea __ BCC $2ba0 ; (vdc_clear.s2 + 0)
.s1001:
2bb6 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_hchar@proxy: ; vdc_hchar@proxy
2bb7 : ad 63 6e LDA $6e63 ; (vdc_state + 7)
2bba : 85 12 __ STA P5 
--------------------------------------------------------------------
vdc_hchar: ; vdc_hchar(u8,u8,u8,u8,u8)->void
.s0:
2bbc : a5 10 __ LDA P3 ; (y + 0)
2bbe : 0a __ __ ASL
2bbf : aa __ __ TAX
2bc0 : bd 00 70 LDA $7000,x ; (multab + 0)
2bc3 : 18 __ __ CLC
2bc4 : 65 0f __ ADC P2 ; (x + 0)
2bc6 : 85 43 __ STA T1 + 0 
2bc8 : bd 01 70 LDA $7001,x ; (multab + 1)
2bcb : 69 00 __ ADC #$00
2bcd : 85 44 __ STA T1 + 1 
2bcf : ad 64 6e LDA $6e64 ; (vdc_state + 8)
2bd2 : 18 __ __ CLC
2bd3 : 65 43 __ ADC T1 + 0 
2bd5 : 85 0d __ STA P0 
2bd7 : ad 65 6e LDA $6e65 ; (vdc_state + 9)
2bda : 65 44 __ ADC T1 + 1 
2bdc : 85 0e __ STA P1 
2bde : 20 67 2c JSR $2c67 ; (vdc_mem_addr.s0 + 0)
2be1 : a6 13 __ LDX P6 ; (length + 0)
2be3 : ca __ __ DEX
2be4 : 86 45 __ STX T2 + 0 
.l221:
2be6 : 2c 00 d6 BIT $d600 
2be9 : 10 fb __ BPL $2be6 ; (vdc_hchar.l221 + 0)
.s6:
2beb : a5 11 __ LDA P4 ; (val + 0)
2bed : 8d 01 d6 STA $d601 
2bf0 : a2 18 __ LDX #$18
2bf2 : 8e 00 d6 STX $d600 
.l223:
2bf5 : 2c 00 d6 BIT $d600 
2bf8 : 10 fb __ BPL $2bf5 ; (vdc_hchar.l223 + 0)
.s12:
2bfa : ad 01 d6 LDA $d601 
2bfd : 29 7f __ AND #$7f
2bff : 8e 00 d6 STX $d600 
.l225:
2c02 : 2c 00 d6 BIT $d600 
2c05 : 10 fb __ BPL $2c02 ; (vdc_hchar.l225 + 0)
.s18:
2c07 : 8d 01 d6 STA $d601 
2c0a : a9 1e __ LDA #$1e
2c0c : 8d 00 d6 STA $d600 
.l227:
2c0f : 2c 00 d6 BIT $d600 
2c12 : 10 fb __ BPL $2c0f ; (vdc_hchar.l227 + 0)
.s23:
2c14 : a5 45 __ LDA T2 + 0 
2c16 : 8d 01 d6 STA $d601 
2c19 : ad 66 6e LDA $6e66 ; (vdc_state + 10)
2c1c : 18 __ __ CLC
2c1d : 65 43 __ ADC T1 + 0 
2c1f : 85 0d __ STA P0 
2c21 : ad 67 6e LDA $6e67 ; (vdc_state + 11)
2c24 : 65 44 __ ADC T1 + 1 
2c26 : 85 0e __ STA P1 
2c28 : 20 67 2c JSR $2c67 ; (vdc_mem_addr.s0 + 0)
.l229:
2c2b : 2c 00 d6 BIT $d600 
2c2e : 10 fb __ BPL $2c2b ; (vdc_hchar.l229 + 0)
.s27:
2c30 : a5 12 __ LDA P5 ; (attr + 0)
2c32 : 8d 01 d6 STA $d601 
2c35 : a2 18 __ LDX #$18
2c37 : 8e 00 d6 STX $d600 
.l231:
2c3a : 2c 00 d6 BIT $d600 
2c3d : 10 fb __ BPL $2c3a ; (vdc_hchar.l231 + 0)
.s33:
2c3f : ad 01 d6 LDA $d601 
2c42 : 29 7f __ AND #$7f
2c44 : 8e 00 d6 STX $d600 
.l233:
2c47 : 2c 00 d6 BIT $d600 
2c4a : 10 fb __ BPL $2c47 ; (vdc_hchar.l233 + 0)
.s39:
2c4c : 8d 01 d6 STA $d601 
2c4f : a9 1e __ LDA #$1e
2c51 : 8d 00 d6 STA $d600 
.l235:
2c54 : 2c 00 d6 BIT $d600 
2c57 : 10 fb __ BPL $2c54 ; (vdc_hchar.l235 + 0)
.s44:
2c59 : a5 45 __ LDA T2 + 0 
2c5b : 8d 01 d6 STA $d601 
.s1001:
2c5e : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
2c5f : a5 0f __ LDA P2 
2c61 : 85 0d __ STA P0 
2c63 : a5 10 __ LDA P3 
2c65 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
2c67 : a9 12 __ LDA #$12
2c69 : 8d 00 d6 STA $d600 
.l56:
2c6c : 2c 00 d6 BIT $d600 
2c6f : 10 fb __ BPL $2c6c ; (vdc_mem_addr.l56 + 0)
.s5:
2c71 : a5 0e __ LDA P1 ; (addr + 1)
2c73 : 8d 01 d6 STA $d601 
2c76 : a9 13 __ LDA #$13
2c78 : 8d 00 d6 STA $d600 
.l58:
2c7b : 2c 00 d6 BIT $d600 
2c7e : 10 fb __ BPL $2c7b ; (vdc_mem_addr.l58 + 0)
.s10:
2c80 : a5 0d __ LDA P0 ; (addr + 0)
2c82 : 8d 01 d6 STA $d601 
2c85 : a9 1f __ LDA #$1f
2c87 : 8d 00 d6 STA $d600 
.s1001:
2c8a : 60 __ __ RTS
--------------------------------------------------------------------
2c8b : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2c9b : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2cab : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->u8
.s0:
2cb6 : 20 c2 2c JSR $2cc2 ; (getpch + 0)
2cb9 : c9 00 __ CMP #$00
2cbb : f0 f9 __ BEQ $2cb6 ; (getch.s0 + 0)
2cbd : 85 1b __ STA ACCU + 0 
.s1001:
2cbf : a5 1b __ LDA ACCU + 0 
2cc1 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
2cc2 : 20 e4 ff JSR $ffe4 
2cc5 : ae ff 36 LDX $36ff ; (giocharmap + 0)
2cc8 : e0 01 __ CPX #$01
2cca : 90 26 __ BCC $2cf2 ; (getpch + 48)
2ccc : c9 0d __ CMP #$0d
2cce : d0 02 __ BNE $2cd2 ; (getpch + 16)
2cd0 : a9 0a __ LDA #$0a
2cd2 : e0 02 __ CPX #$02
2cd4 : 90 1c __ BCC $2cf2 ; (getpch + 48)
2cd6 : c9 db __ CMP #$db
2cd8 : b0 18 __ BCS $2cf2 ; (getpch + 48)
2cda : c9 41 __ CMP #$41
2cdc : 90 14 __ BCC $2cf2 ; (getpch + 48)
2cde : c9 c1 __ CMP #$c1
2ce0 : 90 02 __ BCC $2ce4 ; (getpch + 34)
2ce2 : 49 a0 __ EOR #$a0
2ce4 : c9 7b __ CMP #$7b
2ce6 : b0 0a __ BCS $2cf2 ; (getpch + 48)
2ce8 : c9 61 __ CMP #$61
2cea : b0 04 __ BCS $2cf0 ; (getpch + 46)
2cec : c9 5b __ CMP #$5b
2cee : b0 02 __ BCS $2cf2 ; (getpch + 48)
2cf0 : 49 20 __ EOR #$20
2cf2 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2cf3 : 24 d7 __ BIT $d7 
2cf5 : 10 01 __ BPL $2cf8 ; (screen_setmode.s6 + 0)
.s1001:
2cf7 : 60 __ __ RTS
.s6:
2cf8 : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2cfb : 09 00 __ ORA #$00
2cfd : d0 0d __ BNE $2d0c ; (fastmode.s1 + 0)
.s2:
2cff : 8d 30 d0 STA $d030 
2d02 : ad 11 d0 LDA $d011 
2d05 : 29 7f __ AND #$7f
2d07 : 09 10 __ ORA #$10
2d09 : 4c 16 2d JMP $2d16 ; (fastmode.s3 + 0)
.s1:
2d0c : a9 01 __ LDA #$01
2d0e : 8d 30 d0 STA $d030 
2d11 : ad 11 d0 LDA $d011 
2d14 : 29 6f __ AND #$6f
.s3:
2d16 : 8d 11 d0 STA $d011 
.s1001:
2d19 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
2d1a : a5 53 __ LDA T5 + 0 
2d1c : 8d f5 bf STA $bff5 ; (fname + 15)
2d1f : a5 54 __ LDA T5 + 1 
2d21 : 8d f6 bf STA $bff6 ; (fname + 16)
.s0:
2d24 : a4 16 __ LDY P9 ; (mode + 0)
2d26 : be f4 61 LDX $61f4,y ; (__multab36L + 0)
2d29 : 86 4b __ STX T1 + 0 
2d2b : 86 4d __ STX T2 + 0 
2d2d : bd 04 6a LDA $6a04,x ; (vdc_modes + 4)
2d30 : f0 0a __ BEQ $2d3c ; (vdc_set_mode.s3 + 0)
.s4:
2d32 : ad 5c 6e LDA $6e5c ; (vdc_state + 0)
2d35 : c9 10 __ CMP #$10
2d37 : d0 03 __ BNE $2d3c ; (vdc_set_mode.s3 + 0)
2d39 : 4c 95 2e JMP $2e95 ; (vdc_set_mode.s1001 + 0)
.s3:
2d3c : 8c 5e 6e STY $6e5e ; (vdc_state + 2)
2d3f : a9 00 __ LDA #$00
2d41 : 8d 72 6e STA $6e72 ; (vdc_state + 22)
2d44 : 8d 73 6e STA $6e73 ; (vdc_state + 23)
2d47 : 8d 74 6e STA $6e74 ; (vdc_state + 24)
2d4a : bd 00 6a LDA $6a00,x ; (vdc_modes + 0)
2d4d : 8d 5f 6e STA $6e5f ; (vdc_state + 3)
2d50 : bd 01 6a LDA $6a01,x ; (vdc_modes + 1)
2d53 : 8d 60 6e STA $6e60 ; (vdc_state + 4)
2d56 : bd 02 6a LDA $6a02,x ; (vdc_modes + 2)
2d59 : 8d 61 6e STA $6e61 ; (vdc_state + 5)
2d5c : bd 03 6a LDA $6a03,x ; (vdc_modes + 3)
2d5f : 8d 62 6e STA $6e62 ; (vdc_state + 6)
2d62 : bd 09 6a LDA $6a09,x ; (vdc_modes + 9)
2d65 : 8d 68 6e STA $6e68 ; (vdc_state + 12)
2d68 : bd 0a 6a LDA $6a0a,x ; (vdc_modes + 10)
2d6b : 8d 69 6e STA $6e69 ; (vdc_state + 13)
2d6e : bd 0b 6a LDA $6a0b,x ; (vdc_modes + 11)
2d71 : 8d 6a 6e STA $6e6a ; (vdc_state + 14)
2d74 : bd 0c 6a LDA $6a0c,x ; (vdc_modes + 12)
2d77 : 8d 6b 6e STA $6e6b ; (vdc_state + 15)
2d7a : bd 0d 6a LDA $6a0d,x ; (vdc_modes + 13)
2d7d : 8d 6c 6e STA $6e6c ; (vdc_state + 16)
2d80 : bd 0e 6a LDA $6a0e,x ; (vdc_modes + 14)
2d83 : 8d 6d 6e STA $6e6d ; (vdc_state + 17)
2d86 : bd 0f 6a LDA $6a0f,x ; (vdc_modes + 15)
2d89 : 8d 6e 6e STA $6e6e ; (vdc_state + 18)
2d8c : bd 10 6a LDA $6a10,x ; (vdc_modes + 16)
2d8f : 8d 6f 6e STA $6e6f ; (vdc_state + 19)
2d92 : bd 11 6a LDA $6a11,x ; (vdc_modes + 17)
2d95 : 8d 70 6e STA $6e70 ; (vdc_state + 20)
2d98 : bd 12 6a LDA $6a12,x ; (vdc_modes + 18)
2d9b : 8d 71 6e STA $6e71 ; (vdc_state + 21)
2d9e : bd 05 6a LDA $6a05,x ; (vdc_modes + 5)
2da1 : 85 4e __ STA T3 + 0 
2da3 : 8d 64 6e STA $6e64 ; (vdc_state + 8)
2da6 : bd 06 6a LDA $6a06,x ; (vdc_modes + 6)
2da9 : 85 4f __ STA T3 + 1 
2dab : 8d 65 6e STA $6e65 ; (vdc_state + 9)
2dae : bd 07 6a LDA $6a07,x ; (vdc_modes + 7)
2db1 : 85 53 __ STA T5 + 0 
2db3 : 8d 66 6e STA $6e66 ; (vdc_state + 10)
2db6 : bd 08 6a LDA $6a08,x ; (vdc_modes + 8)
2db9 : 85 54 __ STA T5 + 1 
2dbb : 8d 67 6e STA $6e67 ; (vdc_state + 11)
2dbe : 20 a0 2e JSR $2ea0 ; (vdc_set_multab.s0 + 0)
2dc1 : a9 22 __ LDA #$22
2dc3 : 8d 00 d6 STA $d600 
.l295:
2dc6 : 2c 00 d6 BIT $d600 
2dc9 : 10 fb __ BPL $2dc6 ; (vdc_set_mode.l295 + 0)
.s11:
2dcb : a9 80 __ LDA #$80
2dcd : 8d 01 d6 STA $d601 
2dd0 : a9 0c __ LDA #$0c
2dd2 : 8d 00 d6 STA $d600 
.l297:
2dd5 : 2c 00 d6 BIT $d600 
2dd8 : 10 fb __ BPL $2dd5 ; (vdc_set_mode.l297 + 0)
.s17:
2dda : a5 4f __ LDA T3 + 1 
2ddc : 8d 01 d6 STA $d601 
2ddf : a9 0d __ LDA #$0d
2de1 : 8d 00 d6 STA $d600 
.l299:
2de4 : 2c 00 d6 BIT $d600 
2de7 : 10 fb __ BPL $2de4 ; (vdc_set_mode.l299 + 0)
.s22:
2de9 : a5 4e __ LDA T3 + 0 
2deb : 8d 01 d6 STA $d601 
2dee : a9 14 __ LDA #$14
2df0 : 8d 00 d6 STA $d600 
.l301:
2df3 : 2c 00 d6 BIT $d600 
2df6 : 10 fb __ BPL $2df3 ; (vdc_set_mode.l301 + 0)
.s27:
2df8 : a5 54 __ LDA T5 + 1 
2dfa : 8d 01 d6 STA $d601 
2dfd : a9 15 __ LDA #$15
2dff : 8d 00 d6 STA $d600 
.l303:
2e02 : 2c 00 d6 BIT $d600 
2e05 : 10 fb __ BPL $2e02 ; (vdc_set_mode.l303 + 0)
.s32:
2e07 : a5 53 __ LDA T5 + 0 
2e09 : 8d 01 d6 STA $d601 
2e0c : a6 4b __ LDX T1 + 0 
2e0e : bd 0e 6a LDA $6a0e,x ; (vdc_modes + 14)
2e11 : a2 1c __ LDX #$1c
2e13 : 8e 00 d6 STX $d600 
.l305:
2e16 : 2c 00 d6 BIT $d600 
2e19 : 10 fb __ BPL $2e16 ; (vdc_set_mode.l305 + 0)
.s39:
2e1b : aa __ __ TAX
2e1c : ad 01 d6 LDA $d601 
2e1f : 29 10 __ AND #$10
2e21 : 85 53 __ STA T5 + 0 
2e23 : a9 1c __ LDA #$1c
2e25 : 8d 00 d6 STA $d600 
2e28 : 8a __ __ TXA
2e29 : 29 e0 __ AND #$e0
2e2b : 05 53 __ ORA T5 + 0 
.l307:
2e2d : 2c 00 d6 BIT $d600 
2e30 : 10 fb __ BPL $2e2d ; (vdc_set_mode.l307 + 0)
.s45:
2e32 : 8d 01 d6 STA $d601 
2e35 : 20 f0 2e JSR $2ef0 ; (vdc_restore_charsets.s0 + 0)
2e38 : 18 __ __ CLC
2e39 : a9 13 __ LDA #$13
2e3b : 65 4b __ ADC T1 + 0 
2e3d : 85 4b __ STA T1 + 0 
2e3f : a9 6a __ LDA #$6a
2e41 : 69 00 __ ADC #$00
2e43 : 85 4c __ STA T1 + 1 
2e45 : 18 __ __ CLC
2e46 : a5 4d __ LDA T2 + 0 
2e48 : 69 13 __ ADC #$13
2e4a : 85 4e __ STA T3 + 0 
2e4c : a9 00 __ LDA #$00
2e4e : 85 43 __ STA T0 + 0 
2e50 : 69 6a __ ADC #$6a
2e52 : 85 4f __ STA T3 + 1 
.l46:
2e54 : a4 43 __ LDY T0 + 0 
2e56 : b1 4b __ LDA (T1 + 0),y 
2e58 : 85 47 __ STA T7 + 0 
2e5a : c8 __ __ INY
2e5b : b1 4b __ LDA (T1 + 0),y 
2e5d : aa __ __ TAX
2e5e : a5 47 __ LDA T7 + 0 
2e60 : 8d 00 d6 STA $d600 
2e63 : c8 __ __ INY
2e64 : 84 43 __ STY T0 + 0 
.l309:
2e66 : 2c 00 d6 BIT $d600 
2e69 : 10 fb __ BPL $2e66 ; (vdc_set_mode.l309 + 0)
.s52:
2e6b : 8e 01 d6 STX $d601 
2e6e : b1 4e __ LDA (T3 + 0),y 
2e70 : c9 ff __ CMP #$ff
2e72 : d0 e0 __ BNE $2e54 ; (vdc_set_mode.l46 + 0)
.s47:
2e74 : a6 4d __ LDX T2 + 0 
2e76 : bd 04 6a LDA $6a04,x ; (vdc_modes + 4)
2e79 : f0 08 __ BEQ $2e83 ; (vdc_set_mode.s55 + 0)
.s56:
2e7b : ad 5d 6e LDA $6e5d ; (vdc_state + 1)
2e7e : d0 03 __ BNE $2e83 ; (vdc_set_mode.s55 + 0)
.s53:
2e80 : 20 0f 2f JSR $2f0f ; (vdc_set_extended_memsize.s0 + 0)
.s55:
2e83 : 20 7e 2b JSR $2b7e ; (vdc_cls.s0 + 0)
2e86 : a9 22 __ LDA #$22
2e88 : 8d 00 d6 STA $d600 
.l314:
2e8b : 2c 00 d6 BIT $d600 
2e8e : 10 fb __ BPL $2e8b ; (vdc_set_mode.l314 + 0)
.s62:
2e90 : a9 7d __ LDA #$7d
2e92 : 8d 01 d6 STA $d601 
.s1001:
2e95 : ad f5 bf LDA $bff5 ; (fname + 15)
2e98 : 85 53 __ STA T5 + 0 
2e9a : ad f6 bf LDA $bff6 ; (fname + 16)
2e9d : 85 54 __ STA T5 + 1 
2e9f : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
2ea0 : ad 61 6e LDA $6e61 ; (vdc_state + 5)
2ea3 : 0d 62 6e ORA $6e62 ; (vdc_state + 6)
2ea6 : f0 47 __ BEQ $2eef ; (vdc_set_multab.s1001 + 0)
.s5:
2ea8 : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
2eab : 18 __ __ CLC
2eac : 6d 74 6e ADC $6e74 ; (vdc_state + 24)
2eaf : 85 1b __ STA ACCU + 0 
2eb1 : ad 60 6e LDA $6e60 ; (vdc_state + 4)
2eb4 : 69 00 __ ADC #$00
2eb6 : 85 1c __ STA ACCU + 1 
2eb8 : a9 00 __ LDA #$00
2eba : 85 43 __ STA T3 + 0 
2ebc : 85 44 __ STA T3 + 1 
2ebe : a9 00 __ LDA #$00
2ec0 : 85 45 __ STA T4 + 0 
2ec2 : a9 70 __ LDA #$70
2ec4 : 85 46 __ STA T4 + 1 
2ec6 : ae 61 6e LDX $6e61 ; (vdc_state + 5)
.l1002:
2ec9 : a5 43 __ LDA T3 + 0 
2ecb : a0 00 __ LDY #$00
2ecd : 91 45 __ STA (T4 + 0),y 
2ecf : a5 44 __ LDA T3 + 1 
2ed1 : c8 __ __ INY
2ed2 : 91 45 __ STA (T4 + 0),y 
2ed4 : 18 __ __ CLC
2ed5 : a5 1b __ LDA ACCU + 0 
2ed7 : 65 43 __ ADC T3 + 0 
2ed9 : 85 43 __ STA T3 + 0 
2edb : a5 1c __ LDA ACCU + 1 
2edd : 65 44 __ ADC T3 + 1 
2edf : 85 44 __ STA T3 + 1 
2ee1 : 18 __ __ CLC
2ee2 : a5 45 __ LDA T4 + 0 
2ee4 : 69 02 __ ADC #$02
2ee6 : 85 45 __ STA T4 + 0 
2ee8 : 90 02 __ BCC $2eec ; (vdc_set_multab.s1005 + 0)
.s1004:
2eea : e6 46 __ INC T4 + 1 
.s1005:
2eec : ca __ __ DEX
2eed : d0 da __ BNE $2ec9 ; (vdc_set_multab.l1002 + 0)
.s1001:
2eef : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
2ef0 : ad 6c 6e LDA $6e6c ; (vdc_state + 16)
2ef3 : 85 0f __ STA P2 
2ef5 : a9 01 __ LDA #$01
2ef7 : 85 11 __ STA P4 
2ef9 : a9 02 __ LDA #$02
2efb : 85 15 __ STA P8 
2efd : ad 6d 6e LDA $6e6d ; (vdc_state + 17)
2f00 : 85 10 __ STA P3 
2f02 : a9 00 __ LDA #$00
2f04 : 85 14 __ STA P7 
2f06 : 85 12 __ STA P5 
2f08 : a9 d0 __ LDA #$d0
2f0a : 85 13 __ STA P6 
2f0c : 4c af 15 JMP $15af ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
2f0f : ad 5c 6e LDA $6e5c ; (vdc_state + 0)
2f12 : c9 10 __ CMP #$10
2f14 : d0 01 __ BNE $2f17 ; (vdc_set_extended_memsize.s4 + 0)
2f16 : 60 __ __ RTS
.s4:
2f17 : ad 5d 6e LDA $6e5d ; (vdc_state + 1)
2f1a : f0 01 __ BEQ $2f1d ; (vdc_set_extended_memsize.s3 + 0)
2f1c : 60 __ __ RTS
.s3:
2f1d : a2 22 __ LDX #$22
2f1f : 8e 00 d6 STX $d600 
.l380:
2f22 : 2c 00 d6 BIT $d600 
2f25 : 10 fb __ BPL $2f22 ; (vdc_set_extended_memsize.l380 + 0)
.s11:
2f27 : 85 4a __ STA T1 + 1 
2f29 : 85 0d __ STA P0 
2f2b : a9 80 __ LDA #$80
2f2d : 8d 01 d6 STA $d601 
2f30 : a9 ff __ LDA #$ff
2f32 : 85 48 __ STA T0 + 0 
.l14:
2f34 : 20 f9 68 JSR $68f9 ; (vdc_mem_addr@proxy + 0)
.l382:
2f37 : 2c 00 d6 BIT $d600 
2f3a : 10 fb __ BPL $2f37 ; (vdc_set_extended_memsize.l382 + 0)
.s20:
2f3c : a9 00 __ LDA #$00
2f3e : 8d 01 d6 STA $d601 
2f41 : a2 18 __ LDX #$18
2f43 : 8e 00 d6 STX $d600 
.l384:
2f46 : 2c 00 d6 BIT $d600 
2f49 : 10 fb __ BPL $2f46 ; (vdc_set_extended_memsize.l384 + 0)
.s26:
2f4b : ad 01 d6 LDA $d601 
2f4e : 29 7f __ AND #$7f
2f50 : 8e 00 d6 STX $d600 
.l386:
2f53 : 2c 00 d6 BIT $d600 
2f56 : 10 fb __ BPL $2f53 ; (vdc_set_extended_memsize.l386 + 0)
.s32:
2f58 : 8d 01 d6 STA $d601 
2f5b : a9 1e __ LDA #$1e
2f5d : 8d 00 d6 STA $d600 
.l388:
2f60 : 2c 00 d6 BIT $d600 
2f63 : 10 fb __ BPL $2f60 ; (vdc_set_extended_memsize.l388 + 0)
.s37:
2f65 : e6 4a __ INC T1 + 1 
2f67 : a9 ff __ LDA #$ff
2f69 : 8d 01 d6 STA $d601 
2f6c : c6 48 __ DEC T0 + 0 
2f6e : d0 c4 __ BNE $2f34 ; (vdc_set_extended_memsize.l14 + 0)
.s16:
2f70 : 20 f9 68 JSR $68f9 ; (vdc_mem_addr@proxy + 0)
.l391:
2f73 : 2c 00 d6 BIT $d600 
2f76 : 10 fb __ BPL $2f73 ; (vdc_set_extended_memsize.l391 + 0)
.s41:
2f78 : a9 00 __ LDA #$00
2f7a : 8d 01 d6 STA $d601 
2f7d : a2 18 __ LDX #$18
2f7f : 8e 00 d6 STX $d600 
.l393:
2f82 : 2c 00 d6 BIT $d600 
2f85 : 10 fb __ BPL $2f82 ; (vdc_set_extended_memsize.l393 + 0)
.s47:
2f87 : ad 01 d6 LDA $d601 
2f8a : 29 7f __ AND #$7f
2f8c : 8e 00 d6 STX $d600 
.l395:
2f8f : 2c 00 d6 BIT $d600 
2f92 : 10 fb __ BPL $2f8f ; (vdc_set_extended_memsize.l395 + 0)
.s53:
2f94 : 8d 01 d6 STA $d601 
2f97 : a9 1e __ LDA #$1e
2f99 : 8d 00 d6 STA $d600 
.l397:
2f9c : 2c 00 d6 BIT $d600 
2f9f : 10 fb __ BPL $2f9c ; (vdc_set_extended_memsize.l397 + 0)
.s58:
2fa1 : a9 ff __ LDA #$ff
2fa3 : 8d 01 d6 STA $d601 
2fa6 : a0 1c __ LDY #$1c
2fa8 : 8c 00 d6 STY $d600 
.l399:
2fab : 2c 00 d6 BIT $d600 
2fae : 10 fb __ BPL $2fab ; (vdc_set_extended_memsize.l399 + 0)
.s64:
2fb0 : ad 01 d6 LDA $d601 
2fb3 : 09 10 __ ORA #$10
2fb5 : 8c 00 d6 STY $d600 
.l401:
2fb8 : 2c 00 d6 BIT $d600 
2fbb : 10 fb __ BPL $2fb8 ; (vdc_set_extended_memsize.l401 + 0)
.s70:
2fbd : 8d 01 d6 STA $d601 
2fc0 : 20 f0 2e JSR $2ef0 ; (vdc_restore_charsets.s0 + 0)
2fc3 : 20 7e 2b JSR $2b7e ; (vdc_cls.s0 + 0)
2fc6 : a9 22 __ LDA #$22
2fc8 : 8d 00 d6 STA $d600 
.l403:
2fcb : 2c 00 d6 BIT $d600 
2fce : 10 fb __ BPL $2fcb ; (vdc_set_extended_memsize.l403 + 0)
.s76:
2fd0 : a9 7d __ LDA #$7d
2fd2 : 8d 01 d6 STA $d601 
2fd5 : a9 01 __ LDA #$01
2fd7 : 8d 5d 6e STA $6e5d ; (vdc_state + 1)
.s1001:
2fda : 60 __ __ RTS
--------------------------------------------------------------------
2fdb : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 6f 53 43 41 52 36 34 : sTARTING oSCAR64
2feb : __ __ __ BYT 20 76 64 63 20 44 45 4d 4f 2e 00                :  vdc DEMO..
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
2ff6 : a9 0a __ LDA #$0a
2ff8 : 85 0f __ STA P2 
2ffa : a9 09 __ LDA #$09
2ffc : 85 10 __ STA P3 
2ffe : a9 8d __ LDA #$8d
3000 : 85 13 __ STA P6 
--------------------------------------------------------------------
vdc_prints_attr: ; vdc_prints_attr(u8,u8,const u8*,u8)->void
.s0:
3002 : a5 11 __ LDA P4 ; (string + 0)
3004 : 85 0d __ STA P0 
3006 : 85 43 __ STA T0 + 0 
3008 : a5 12 __ LDA P5 ; (string + 1)
300a : 85 0e __ STA P1 
300c : 85 44 __ STA T0 + 1 
300e : a5 10 __ LDA P3 ; (y + 0)
3010 : 0a __ __ ASL
3011 : aa __ __ TAX
3012 : bd 00 70 LDA $7000,x ; (multab + 0)
3015 : 85 45 __ STA T2 + 0 
3017 : bd 01 70 LDA $7001,x ; (multab + 1)
301a : 85 46 __ STA T2 + 1 
301c : 20 de 30 JSR $30de ; (strlen.s0 + 0)
301f : a5 1b __ LDA ACCU + 0 
3021 : 85 47 __ STA T3 + 0 
3023 : 18 __ __ CLC
3024 : a5 0f __ LDA P2 ; (x + 0)
3026 : 65 45 __ ADC T2 + 0 
3028 : 85 45 __ STA T2 + 0 
302a : 90 02 __ BCC $302e ; (vdc_prints_attr.s1041 + 0)
.s1040:
302c : e6 46 __ INC T2 + 1 
.s1041:
302e : 18 __ __ CLC
302f : 6d 64 6e ADC $6e64 ; (vdc_state + 8)
3032 : 85 0d __ STA P0 
3034 : ad 65 6e LDA $6e65 ; (vdc_state + 9)
3037 : 65 46 __ ADC T2 + 1 
3039 : 85 0e __ STA P1 
303b : 20 67 2c JSR $2c67 ; (vdc_mem_addr.s0 + 0)
303e : a5 47 __ LDA T3 + 0 
3040 : f0 55 __ BEQ $3097 ; (vdc_prints_attr.s6 + 0)
.s64:
3042 : a0 00 __ LDY #$00
.l4:
3044 : b1 43 __ LDA (T0 + 0),y 
3046 : c9 20 __ CMP #$20
3048 : b0 05 __ BCS $304f ; (vdc_prints_attr.s10 + 0)
.s9:
304a : 69 80 __ ADC #$80
304c : 4c 89 30 JMP $3089 ; (vdc_prints_attr.s1038 + 0)
.s10:
304f : c9 40 __ CMP #$40
3051 : aa __ __ TAX
3052 : 90 2f __ BCC $3083 ; (vdc_prints_attr.s29 + 0)
.s15:
3054 : c9 60 __ CMP #$60
3056 : 90 1b __ BCC $3073 ; (vdc_prints_attr.s12 + 0)
.s19:
3058 : 09 00 __ ORA #$00
305a : 30 06 __ BMI $3062 ; (vdc_prints_attr.s17 + 0)
.s16:
305c : 38 __ __ SEC
305d : e9 20 __ SBC #$20
305f : 4c 89 30 JMP $3089 ; (vdc_prints_attr.s1038 + 0)
.s17:
3062 : c9 80 __ CMP #$80
3064 : 90 1d __ BCC $3083 ; (vdc_prints_attr.s29 + 0)
.s23:
3066 : c9 a0 __ CMP #$a0
3068 : b0 05 __ BCS $306f ; (vdc_prints_attr.s27 + 0)
.s20:
306a : 69 40 __ ADC #$40
306c : 4c 89 30 JMP $3089 ; (vdc_prints_attr.s1038 + 0)
.s27:
306f : c9 c0 __ CMP #$c0
3071 : b0 06 __ BCS $3079 ; (vdc_prints_attr.s31 + 0)
.s12:
3073 : 38 __ __ SEC
3074 : e9 40 __ SBC #$40
3076 : 4c 89 30 JMP $3089 ; (vdc_prints_attr.s1038 + 0)
.s31:
3079 : c9 ff __ CMP #$ff
307b : b0 06 __ BCS $3083 ; (vdc_prints_attr.s29 + 0)
.s28:
307d : 38 __ __ SEC
307e : e9 80 __ SBC #$80
3080 : 4c 89 30 JMP $3089 ; (vdc_prints_attr.s1038 + 0)
.s29:
3083 : c9 ff __ CMP #$ff
3085 : d0 03 __ BNE $308a ; (vdc_prints_attr.l193 + 0)
.s32:
3087 : a9 5e __ LDA #$5e
.s1038:
3089 : aa __ __ TAX
.l193:
308a : 2c 00 d6 BIT $d600 
308d : 10 fb __ BPL $308a ; (vdc_prints_attr.l193 + 0)
.s37:
308f : 8e 01 d6 STX $d601 
3092 : c8 __ __ INY
3093 : c4 47 __ CPY T3 + 0 
3095 : 90 ad __ BCC $3044 ; (vdc_prints_attr.l4 + 0)
.s6:
3097 : ad 66 6e LDA $6e66 ; (vdc_state + 10)
309a : 18 __ __ CLC
309b : 65 45 __ ADC T2 + 0 
309d : 85 0d __ STA P0 
309f : ad 67 6e LDA $6e67 ; (vdc_state + 11)
30a2 : 65 46 __ ADC T2 + 1 
30a4 : 85 0e __ STA P1 
30a6 : 20 67 2c JSR $2c67 ; (vdc_mem_addr.s0 + 0)
30a9 : a6 47 __ LDX T3 + 0 
30ab : ca __ __ DEX
.l196:
30ac : 2c 00 d6 BIT $d600 
30af : 10 fb __ BPL $30ac ; (vdc_prints_attr.l196 + 0)
.s41:
30b1 : a5 13 __ LDA P6 ; (attr + 0)
30b3 : 8d 01 d6 STA $d601 
30b6 : a0 18 __ LDY #$18
30b8 : 8c 00 d6 STY $d600 
.l198:
30bb : 2c 00 d6 BIT $d600 
30be : 10 fb __ BPL $30bb ; (vdc_prints_attr.l198 + 0)
.s47:
30c0 : ad 01 d6 LDA $d601 
30c3 : 29 7f __ AND #$7f
30c5 : 8c 00 d6 STY $d600 
.l200:
30c8 : 2c 00 d6 BIT $d600 
30cb : 10 fb __ BPL $30c8 ; (vdc_prints_attr.l200 + 0)
.s53:
30cd : 8d 01 d6 STA $d601 
30d0 : a9 1e __ LDA #$1e
30d2 : 8d 00 d6 STA $d600 
.l202:
30d5 : 2c 00 d6 BIT $d600 
30d8 : 10 fb __ BPL $30d5 ; (vdc_prints_attr.l202 + 0)
.s58:
30da : 8e 01 d6 STX $d601 
.s1001:
30dd : 60 __ __ RTS
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
30de : a9 00 __ LDA #$00
30e0 : 85 1b __ STA ACCU + 0 
30e2 : 85 1c __ STA ACCU + 1 
30e4 : a8 __ __ TAY
30e5 : b1 0d __ LDA (P0),y ; (str + 0)
30e7 : f0 18 __ BEQ $3101 ; (strlen.s1001 + 0)
.s2:
30e9 : a5 0d __ LDA P0 ; (str + 0)
30eb : 85 1b __ STA ACCU + 0 
30ed : a2 00 __ LDX #$00
.l1002:
30ef : c8 __ __ INY
30f0 : d0 01 __ BNE $30f3 ; (strlen.s1005 + 0)
.s1004:
30f2 : e8 __ __ INX
.s1005:
30f3 : 8a __ __ TXA
30f4 : 18 __ __ CLC
30f5 : 65 0e __ ADC P1 ; (str + 1)
30f7 : 85 1c __ STA ACCU + 1 
30f9 : b1 1b __ LDA (ACCU + 0),y 
30fb : d0 f2 __ BNE $30ef ; (strlen.l1002 + 0)
.s1003:
30fd : 86 1c __ STX ACCU + 1 
30ff : 84 1b __ STY ACCU + 0 
.s1001:
3101 : 60 __ __ RTS
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s0:
3102 : a9 00 __ LDA #$00
3104 : 8d fb bf STA $bffb ; (sstack + 4)
3107 : a0 02 __ LDY #$02
3109 : b1 23 __ LDA (SP + 0),y 
310b : 85 16 __ STA P9 
310d : c8 __ __ INY
310e : b1 23 __ LDA (SP + 0),y 
3110 : 85 17 __ STA P10 
3112 : c8 __ __ INY
3113 : b1 23 __ LDA (SP + 0),y 
3115 : 8d f7 bf STA $bff7 ; (sstack + 0)
3118 : c8 __ __ INY
3119 : b1 23 __ LDA (SP + 0),y 
311b : 8d f8 bf STA $bff8 ; (sstack + 1)
311e : 18 __ __ CLC
311f : a5 23 __ LDA SP + 0 
3121 : 69 06 __ ADC #$06
3123 : 8d f9 bf STA $bff9 ; (sstack + 2)
3126 : a5 24 __ LDA SP + 1 
3128 : 69 00 __ ADC #$00
312a : 8d fa bf STA $bffa ; (sstack + 3)
312d : 4c e5 20 JMP $20e5 ; (sformat.s0 + 0)
--------------------------------------------------------------------
3130 : __ __ __ BYT 76 64 63 20 4d 45 4d 4f 52 59 20 44 45 54 45 43 : vdc MEMORY DETEC
3140 : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 2c 20 45 58 54 45 : TED: %U kb, EXTE
3150 : __ __ __ BYT 4e 44 45 44 20 4d 45 4d 4f 52 59 20 25 53 41 42 : NDED MEMORY %SAB
3160 : __ __ __ BYT 4c 45 44 2e 00                                  : LED..
--------------------------------------------------------------------
3165 : __ __ __ BYT 65 4e 00                                        : eN.
--------------------------------------------------------------------
3168 : __ __ __ BYT 64 49 53 00                                     : dIS.
--------------------------------------------------------------------
316c : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 3a 00 : lOADING ASSETS:.
--------------------------------------------------------------------
317c : __ __ __ BYT 2d 20 53 43 52 45 45 4e 3a 20 6c 4f 47 4f 20 41 : - SCREEN: lOGO A
318c : __ __ __ BYT 4e 44 20 54 45 53 54 20 53 43 52 45 45 4e 00    : ND TEST SCREEN.
--------------------------------------------------------------------
menu_fileerrormessage: ; menu_fileerrormessage()->void
.s1000:
319b : 38 __ __ SEC
319c : a5 23 __ LDA SP + 0 
319e : e9 08 __ SBC #$08
31a0 : 85 23 __ STA SP + 0 
31a2 : b0 02 __ BCS $31a6 ; (menu_fileerrormessage.s0 + 0)
31a4 : c6 24 __ DEC SP + 1 
.s0:
31a6 : a9 08 __ LDA #$08
31a8 : 85 18 __ STA P11 
31aa : 8d f7 bf STA $bff7 ; (sstack + 0)
31ad : a9 f0 __ LDA #$f0
31af : 85 17 __ STA P10 
31b1 : a9 1e __ LDA #$1e
31b3 : 8d f8 bf STA $bff8 ; (sstack + 1)
31b6 : a9 06 __ LDA #$06
31b8 : 8d f9 bf STA $bff9 ; (sstack + 2)
31bb : ad 63 6e LDA $6e63 ; (vdc_state + 7)
31be : 85 52 __ STA T0 + 0 
31c0 : a9 8d __ LDA #$8d
31c2 : 8d 63 6e STA $6e63 ; (vdc_state + 7)
31c5 : 20 1f 32 JSR $321f ; (vdcwin_win_new.s1000 + 0)
31c8 : a9 36 __ LDA #$36
31ca : 85 12 __ STA P5 
31cc : a9 ec __ LDA #$ec
31ce : 85 11 __ STA P4 
31d0 : 20 f6 2f JSR $2ff6 ; (vdc_prints_attr@proxy + 0)
31d3 : a9 75 __ LDA #$75
31d5 : a0 02 __ LDY #$02
31d7 : 91 23 __ STA (SP + 0),y 
31d9 : a9 6e __ LDA #$6e
31db : c8 __ __ INY
31dc : 91 23 __ STA (SP + 0),y 
31de : a9 00 __ LDA #$00
31e0 : c8 __ __ INY
31e1 : 91 23 __ STA (SP + 0),y 
31e3 : a9 37 __ LDA #$37
31e5 : c8 __ __ INY
31e6 : 91 23 __ STA (SP + 0),y 
31e8 : ad 4d 6e LDA $6e4d ; (krnio_pstatus + 1)
31eb : c8 __ __ INY
31ec : 91 23 __ STA (SP + 0),y 
31ee : a9 00 __ LDA #$00
31f0 : c8 __ __ INY
31f1 : 91 23 __ STA (SP + 0),y 
31f3 : 20 02 31 JSR $3102 ; (sprintf.s0 + 0)
31f6 : a9 0a __ LDA #$0a
31f8 : 85 0f __ STA P2 
31fa : a9 0b __ LDA #$0b
31fc : 85 10 __ STA P3 
31fe : 20 ea 68 JSR $68ea ; (vdc_prints_attr@proxy + 0)
3201 : a9 0d __ LDA #$0d
3203 : 85 10 __ STA P3 
3205 : 20 d3 68 JSR $68d3 ; (vdc_prints_attr@proxy + 0)
3208 : 20 1a 37 JSR $371a ; (vdcwin_getch.s0 + 0)
320b : 20 28 37 JSR $3728 ; (vdcwin_win_free.s0 + 0)
320e : a5 52 __ LDA T0 + 0 
3210 : 8d 63 6e STA $6e63 ; (vdc_state + 7)
.s1001:
3213 : 18 __ __ CLC
3214 : a5 23 __ LDA SP + 0 
3216 : 69 08 __ ADC #$08
3218 : 85 23 __ STA SP + 0 
321a : 90 02 __ BCC $321e ; (menu_fileerrormessage.s1001 + 11)
321c : e6 24 __ INC SP + 1 
321e : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_new: ; vdcwin_win_new(u8,u8,u8,u8,u8)->void
.s1000:
321f : a2 03 __ LDX #$03
3221 : b5 53 __ LDA T8 + 0,x 
3223 : 9d f3 bf STA $bff3,x ; (fname + 13)
3226 : ca __ __ DEX
3227 : 10 f8 __ BPL $3221 ; (vdcwin_win_new.s1000 + 2)
.s0:
3229 : ad f8 bf LDA $bff8 ; (sstack + 1)
322c : 85 11 __ STA P4 
322e : 85 4c __ STA T1 + 0 
3230 : ad f9 bf LDA $bff9 ; (sstack + 2)
3233 : 85 12 __ STA P5 
3235 : 85 4d __ STA T3 + 0 
3237 : ad f7 bf LDA $bff7 ; (sstack + 0)
323a : 0a __ __ ASL
323b : aa __ __ TAX
323c : bd 00 70 LDA $7000,x ; (multab + 0)
323f : 18 __ __ CLC
3240 : 65 18 __ ADC P11 ; (xpos + 0)
3242 : 85 53 __ STA T8 + 0 
3244 : bd 01 70 LDA $7001,x ; (multab + 1)
3247 : 69 00 __ ADC #$00
3249 : 85 54 __ STA T8 + 1 
324b : a5 17 __ LDA P10 ; (border + 0)
324d : 0a __ __ ASL
324e : 10 0e __ BPL $325e ; (vdcwin_win_new.s57 + 0)
.s6:
3250 : a5 18 __ LDA P11 ; (xpos + 0)
3252 : f0 0a __ BEQ $325e ; (vdcwin_win_new.s57 + 0)
.s3:
3254 : e6 4c __ INC T1 + 0 
3256 : a5 53 __ LDA T8 + 0 
3258 : d0 02 __ BNE $325c ; (vdcwin_win_new.s1013 + 0)
.s1012:
325a : c6 54 __ DEC T8 + 1 
.s1013:
325c : c6 53 __ DEC T8 + 0 
.s57:
325e : a5 17 __ LDA P10 ; (border + 0)
3260 : 29 20 __ AND #$20
3262 : f0 15 __ BEQ $3279 ; (vdcwin_win_new.s59 + 0)
.s10:
3264 : 18 __ __ CLC
3265 : a5 11 __ LDA P4 
3267 : 65 18 __ ADC P11 ; (xpos + 0)
3269 : a8 __ __ TAY
326a : a9 00 __ LDA #$00
326c : 2a __ __ ROL
326d : cd 60 6e CMP $6e60 ; (vdc_state + 4)
3270 : d0 03 __ BNE $3275 ; (vdcwin_win_new.s1009 + 0)
.s1008:
3272 : cc 5f 6e CPY $6e5f ; (vdc_state + 3)
.s1009:
3275 : b0 02 __ BCS $3279 ; (vdcwin_win_new.s59 + 0)
.s7:
3277 : e6 4c __ INC T1 + 0 
.s59:
3279 : 24 17 __ BIT P10 ; (border + 0)
327b : 10 1e __ BPL $329b ; (vdcwin_win_new.s60 + 0)
.s14:
327d : ad f7 bf LDA $bff7 ; (sstack + 0)
3280 : f0 19 __ BEQ $329b ; (vdcwin_win_new.s60 + 0)
.s11:
3282 : e6 4d __ INC T3 + 0 
3284 : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
3287 : 85 03 __ STA WORK + 0 
3289 : ad 60 6e LDA $6e60 ; (vdc_state + 4)
328c : 85 04 __ STA WORK + 1 
328e : 38 __ __ SEC
328f : a5 53 __ LDA T8 + 0 
3291 : e5 03 __ SBC WORK + 0 
3293 : 85 53 __ STA T8 + 0 
3295 : a5 54 __ LDA T8 + 1 
3297 : e5 04 __ SBC WORK + 1 
3299 : 85 54 __ STA T8 + 1 
.s60:
329b : a5 17 __ LDA P10 ; (border + 0)
329d : 29 10 __ AND #$10
329f : f0 16 __ BEQ $32b7 ; (vdcwin_win_new.s17 + 0)
.s18:
32a1 : 18 __ __ CLC
32a2 : a5 12 __ LDA P5 
32a4 : 6d f7 bf ADC $bff7 ; (sstack + 0)
32a7 : a8 __ __ TAY
32a8 : a9 00 __ LDA #$00
32aa : 2a __ __ ROL
32ab : cd 62 6e CMP $6e62 ; (vdc_state + 6)
32ae : d0 03 __ BNE $32b3 ; (vdcwin_win_new.s1007 + 0)
.s1006:
32b0 : cc 61 6e CPY $6e61 ; (vdc_state + 5)
.s1007:
32b3 : b0 02 __ BCS $32b7 ; (vdcwin_win_new.s17 + 0)
.s15:
32b5 : e6 4d __ INC T3 + 0 
.s17:
32b7 : a5 12 __ LDA P5 
32b9 : 85 1b __ STA ACCU + 0 ; (height + 0)
32bb : a9 00 __ LDA #$00
32bd : 85 1c __ STA ACCU + 1 
32bf : a5 11 __ LDA P4 
32c1 : 20 3e 65 JSR $653e ; (mul16by8 + 0)
32c4 : a5 05 __ LDA WORK + 2 
32c6 : 0a __ __ ASL
32c7 : 85 4e __ STA T5 + 0 
32c9 : a5 06 __ LDA WORK + 3 
32cb : 2a __ __ ROL
32cc : 85 4f __ STA T5 + 1 
32ce : ad 4a 6e LDA $6e4a ; (winCfg + 6)
32d1 : 85 50 __ STA T7 + 0 
32d3 : 18 __ __ CLC
32d4 : 65 4e __ ADC T5 + 0 
32d6 : 85 4e __ STA T5 + 0 
32d8 : ad 4b 6e LDA $6e4b ; (winCfg + 7)
32db : 85 51 __ STA T7 + 1 
32dd : 65 4f __ ADC T5 + 1 
32df : 85 4f __ STA T5 + 1 
32e1 : ad 45 6e LDA $6e45 ; (winCfg + 1)
32e4 : 18 __ __ CLC
32e5 : 6d 47 6e ADC $6e47 ; (winCfg + 3)
32e8 : a8 __ __ TAY
32e9 : ad 46 6e LDA $6e46 ; (winCfg + 2)
32ec : 6d 48 6e ADC $6e48 ; (winCfg + 4)
32ef : aa __ __ TAX
32f0 : 98 __ __ TYA
32f1 : 18 __ __ CLC
32f2 : 69 fe __ ADC #$fe
32f4 : a8 __ __ TAY
32f5 : 8a __ __ TXA
32f6 : 69 ff __ ADC #$ff
32f8 : c5 4f __ CMP T5 + 1 
32fa : d0 02 __ BNE $32fe ; (vdcwin_win_new.s1005 + 0)
.s1004:
32fc : c4 4e __ CPY T5 + 0 
.s1005:
32fe : 90 51 __ BCC $3351 ; (vdcwin_win_new.s1001 + 0)
.s21:
3300 : ad 49 6e LDA $6e49 ; (winCfg + 5)
3303 : c9 03 __ CMP #$03
3305 : f0 4a __ BEQ $3351 ; (vdcwin_win_new.s1001 + 0)
.s25:
3307 : a5 18 __ LDA P11 ; (xpos + 0)
3309 : 85 0f __ STA P2 
330b : ad f7 bf LDA $bff7 ; (sstack + 0)
330e : 85 10 __ STA P3 
3310 : ee 49 6e INC $6e49 ; (winCfg + 5)
3313 : ae 49 6e LDX $6e49 ; (winCfg + 5)
3316 : bd fc 40 LDA $40fc,x ; (__multab13L + 0)
3319 : 85 4e __ STA T5 + 0 
331b : 18 __ __ CLC
331c : 69 bc __ ADC #$bc
331e : 85 55 __ STA T10 + 0 
3320 : 85 0d __ STA P0 
3322 : a9 6e __ LDA #$6e
3324 : 69 00 __ ADC #$00
3326 : 85 56 __ STA T10 + 1 
3328 : 85 0e __ STA P1 
332a : 20 e5 33 JSR $33e5 ; (vdcwin_init.s0 + 0)
332d : a5 50 __ LDA T7 + 0 
332f : a6 4e __ LDX T5 + 0 
3331 : 9d b9 6e STA $6eb9,x ; (linebuffer + 68)
3334 : a5 51 __ LDA T7 + 1 
3336 : 9d ba 6e STA $6eba,x ; (linebuffer + 69)
3339 : a5 17 __ LDA P10 ; (border + 0)
333b : 9d bb 6e STA $6ebb,x ; (linebuffer + 70)
333e : a5 4d __ LDA T3 + 0 
3340 : d0 1a __ BNE $335c ; (vdcwin_win_new.s32 + 0)
.s30:
3342 : a5 55 __ LDA T10 + 0 
3344 : 85 14 __ STA P7 
3346 : a5 56 __ LDA T10 + 1 
3348 : 85 15 __ STA P8 
334a : a5 17 __ LDA P10 ; (border + 0)
334c : 85 16 __ STA P9 
334e : 20 a9 34 JSR $34a9 ; (vdcwin_border_clear.s0 + 0)
.s1001:
3351 : a2 03 __ LDX #$03
3353 : bd f3 bf LDA $bff3,x ; (fname + 13)
3356 : 95 53 __ STA T8 + 0,x 
3358 : ca __ __ DEX
3359 : 10 f8 __ BPL $3353 ; (vdcwin_win_new.s1001 + 2)
335b : 60 __ __ RTS
.s32:
335c : 85 4b __ STA T0 + 0 
335e : a5 4c __ LDA T1 + 0 
3360 : 85 12 __ STA P5 
.l1010:
3362 : ad 44 6e LDA $6e44 ; (winCfg + 0)
3365 : 85 0d __ STA P0 
3367 : a9 00 __ LDA #$00
3369 : 85 13 __ STA P6 
336b : ad 4a 6e LDA $6e4a ; (winCfg + 6)
336e : 85 50 __ STA T7 + 0 
3370 : 85 0e __ STA P1 
3372 : ad 4b 6e LDA $6e4b ; (winCfg + 7)
3375 : 85 51 __ STA T7 + 1 
3377 : 85 0f __ STA P2 
3379 : ad 64 6e LDA $6e64 ; (vdc_state + 8)
337c : 18 __ __ CLC
337d : 65 53 __ ADC T8 + 0 
337f : 85 10 __ STA P3 
3381 : ad 65 6e LDA $6e65 ; (vdc_state + 9)
3384 : 65 54 __ ADC T8 + 1 
3386 : 85 11 __ STA P4 
3388 : 20 a1 16 JSR $16a1 ; (bnk_cpyfromvdc.s0 + 0)
338b : a9 00 __ LDA #$00
338d : 85 13 __ STA P6 
338f : 18 __ __ CLC
3390 : a5 50 __ LDA T7 + 0 
3392 : 65 12 __ ADC P5 
3394 : 85 50 __ STA T7 + 0 
3396 : 85 0e __ STA P1 
3398 : 8d 4a 6e STA $6e4a ; (winCfg + 6)
339b : a5 51 __ LDA T7 + 1 
339d : 69 00 __ ADC #$00
339f : 85 51 __ STA T7 + 1 
33a1 : 85 0f __ STA P2 
33a3 : 8d 4b 6e STA $6e4b ; (winCfg + 7)
33a6 : ad 66 6e LDA $6e66 ; (vdc_state + 10)
33a9 : 18 __ __ CLC
33aa : 65 53 __ ADC T8 + 0 
33ac : 85 10 __ STA P3 
33ae : ad 67 6e LDA $6e67 ; (vdc_state + 11)
33b1 : 65 54 __ ADC T8 + 1 
33b3 : 85 11 __ STA P4 
33b5 : 20 a1 16 JSR $16a1 ; (bnk_cpyfromvdc.s0 + 0)
33b8 : 18 __ __ CLC
33b9 : a5 50 __ LDA T7 + 0 
33bb : 65 12 __ ADC P5 
33bd : 8d 4a 6e STA $6e4a ; (winCfg + 6)
33c0 : a5 51 __ LDA T7 + 1 
33c2 : 69 00 __ ADC #$00
33c4 : 8d 4b 6e STA $6e4b ; (winCfg + 7)
33c7 : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
33ca : 18 __ __ CLC
33cb : 65 53 __ ADC T8 + 0 
33cd : 85 53 __ STA T8 + 0 
33cf : ad 60 6e LDA $6e60 ; (vdc_state + 4)
33d2 : 65 54 __ ADC T8 + 1 
33d4 : 85 54 __ STA T8 + 1 
33d6 : c6 4b __ DEC T0 + 0 
33d8 : d0 88 __ BNE $3362 ; (vdcwin_win_new.l1010 + 0)
33da : 4c 42 33 JMP $3342 ; (vdcwin_win_new.s30 + 0)
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
33dd : a9 dc __ LDA #$dc
33df : 85 0d __ STA P0 
33e1 : a9 bf __ LDA #$bf
33e3 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
33e5 : a9 00 __ LDA #$00
33e7 : a0 04 __ LDY #$04
33e9 : 91 0d __ STA (P0),y ; (win + 0)
33eb : c8 __ __ INY
33ec : 91 0d __ STA (P0),y ; (win + 0)
33ee : a5 0f __ LDA P2 ; (sx + 0)
33f0 : a0 00 __ LDY #$00
33f2 : 91 0d __ STA (P0),y ; (win + 0)
33f4 : a5 10 __ LDA P3 ; (sy + 0)
33f6 : c8 __ __ INY
33f7 : 91 0d __ STA (P0),y ; (win + 0)
33f9 : a5 11 __ LDA P4 ; (wx + 0)
33fb : c8 __ __ INY
33fc : 91 0d __ STA (P0),y ; (win + 0)
33fe : a5 12 __ LDA P5 ; (wy + 0)
3400 : c8 __ __ INY
3401 : 91 0d __ STA (P0),y ; (win + 0)
3403 : 06 10 __ ASL P3 ; (sy + 0)
3405 : a6 10 __ LDX P3 ; (sy + 0)
3407 : bd 00 70 LDA $7000,x ; (multab + 0)
340a : 18 __ __ CLC
340b : 65 0f __ ADC P2 ; (sx + 0)
340d : 85 1b __ STA ACCU + 0 
340f : bd 01 70 LDA $7001,x ; (multab + 1)
3412 : 69 00 __ ADC #$00
3414 : a8 __ __ TAY
3415 : ad 64 6e LDA $6e64 ; (vdc_state + 8)
3418 : 18 __ __ CLC
3419 : 65 1b __ ADC ACCU + 0 
341b : 85 1b __ STA ACCU + 0 
341d : 98 __ __ TYA
341e : 6d 65 6e ADC $6e65 ; (vdc_state + 9)
3421 : a0 07 __ LDY #$07
3423 : 91 0d __ STA (P0),y ; (win + 0)
3425 : a5 1b __ LDA ACCU + 0 
3427 : 88 __ __ DEY
3428 : 91 0d __ STA (P0),y ; (win + 0)
342a : bd 00 70 LDA $7000,x ; (multab + 0)
342d : 18 __ __ CLC
342e : 65 0f __ ADC P2 ; (sx + 0)
3430 : 85 1b __ STA ACCU + 0 
3432 : bd 01 70 LDA $7001,x ; (multab + 1)
3435 : 69 00 __ ADC #$00
3437 : aa __ __ TAX
3438 : ad 66 6e LDA $6e66 ; (vdc_state + 10)
343b : 18 __ __ CLC
343c : 65 1b __ ADC ACCU + 0 
343e : 85 1b __ STA ACCU + 0 
3440 : 8a __ __ TXA
3441 : 6d 67 6e ADC $6e67 ; (vdc_state + 11)
3444 : a0 09 __ LDY #$09
3446 : 91 0d __ STA (P0),y ; (win + 0)
3448 : a5 1b __ LDA ACCU + 0 
344a : 88 __ __ DEY
344b : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
344d : 60 __ __ RTS
--------------------------------------------------------------------
txtscr_scroller_init: ; txtscr_scroller_init(struct TXTSCRScrollText*,struct TXTSCRBigFont*,u8*,u8,u8,u8,u8)->void
.s0:
344e : a9 00 __ LDA #$00
3450 : a0 0e __ LDY #$0e
3452 : 91 17 __ STA (P10),y ; (settings + 0)
3454 : c8 __ __ INY
3455 : 91 17 __ STA (P10),y ; (settings + 0)
3457 : c8 __ __ INY
3458 : 91 17 __ STA (P10),y ; (settings + 0)
345a : c8 __ __ INY
345b : 91 17 __ STA (P10),y ; (settings + 0)
345d : a9 46 __ LDA #$46
345f : 85 11 __ STA P4 
3461 : ad f9 bf LDA $bff9 ; (sstack + 2)
3464 : a0 00 __ LDY #$00
3466 : 91 17 __ STA (P10),y ; (settings + 0)
3468 : ad fa bf LDA $bffa ; (sstack + 3)
346b : c8 __ __ INY
346c : 91 17 __ STA (P10),y ; (settings + 0)
346e : ad f8 bf LDA $bff8 ; (sstack + 1)
3471 : 85 44 __ STA T1 + 1 
3473 : ad f7 bf LDA $bff7 ; (sstack + 0)
3476 : 85 43 __ STA T1 + 0 
3478 : c8 __ __ INY
3479 : 91 17 __ STA (P10),y ; (settings + 0)
347b : a5 44 __ LDA T1 + 1 
347d : c8 __ __ INY
347e : 91 17 __ STA (P10),y ; (settings + 0)
3480 : a0 05 __ LDY #$05
3482 : 84 0f __ STY P2 
3484 : b1 43 __ LDA (T1 + 0),y 
3486 : 85 12 __ STA P5 
3488 : 18 __ __ CLC
3489 : a5 17 __ LDA P10 ; (settings + 0)
348b : 69 04 __ ADC #$04
348d : 85 0d __ STA P0 
348f : a5 18 __ LDA P11 ; (settings + 1)
3491 : 69 00 __ ADC #$00
3493 : 85 0e __ STA P1 
3495 : ad fb bf LDA $bffb ; (sstack + 4)
3498 : 85 10 __ STA P3 
349a : 20 e5 33 JSR $33e5 ; (vdcwin_init.s0 + 0)
349d : a5 0d __ LDA P0 
349f : 85 14 __ STA P7 
34a1 : a5 0e __ LDA P1 
34a3 : 85 15 __ STA P8 
--------------------------------------------------------------------
vdcwin_border_clear@proxy: ; vdcwin_border_clear@proxy
34a5 : a9 f0 __ LDA #$f0
34a7 : 85 16 __ STA P9 
--------------------------------------------------------------------
vdcwin_border_clear: ; vdcwin_border_clear(struct VDCWin*,u8)->void
.s0:
34a9 : a5 16 __ LDA P9 ; (border + 0)
34ab : 29 0f __ AND #$0f
34ad : 85 47 __ STA T2 + 0 
34af : 49 ff __ EOR #$ff
34b1 : 18 __ __ CLC
34b2 : 69 01 __ ADC #$01
34b4 : 29 09 __ AND #$09
34b6 : 85 48 __ STA T3 + 0 
34b8 : aa __ __ TAX
34b9 : bd 40 69 LDA $6940,x ; (winStyles + 0)
34bc : 85 49 __ STA T4 + 0 
34be : a5 16 __ LDA P9 ; (border + 0)
34c0 : 0a __ __ ASL
34c1 : 10 0c __ BPL $34cf ; (vdcwin_border_clear.s53 + 0)
.s4:
34c3 : a0 00 __ LDY #$00
34c5 : b1 14 __ LDA (P7),y ; (win + 0)
34c7 : d0 06 __ BNE $34cf ; (vdcwin_border_clear.s53 + 0)
.s1:
34c9 : a5 16 __ LDA P9 ; (border + 0)
34cb : 29 bf __ AND #$bf
34cd : 85 16 __ STA P9 ; (border + 0)
.s53:
34cf : a5 16 __ LDA P9 ; (border + 0)
34d1 : 29 20 __ AND #$20
34d3 : f0 2c __ BEQ $3501 ; (vdcwin_border_clear.s55 + 0)
.s8:
34d5 : a0 00 __ LDY #$00
34d7 : b1 14 __ LDA (P7),y ; (win + 0)
34d9 : 18 __ __ CLC
34da : a0 02 __ LDY #$02
34dc : 71 14 __ ADC (P7),y ; (win + 0)
34de : a8 __ __ TAY
34df : a9 00 __ LDA #$00
34e1 : 2a __ __ ROL
34e2 : 85 1c __ STA ACCU + 1 
34e4 : 98 __ __ TYA
34e5 : 69 01 __ ADC #$01
34e7 : 85 1b __ STA ACCU + 0 
34e9 : 90 02 __ BCC $34ed ; (vdcwin_border_clear.s1009 + 0)
.s1008:
34eb : e6 1c __ INC ACCU + 1 
.s1009:
34ed : ad 60 6e LDA $6e60 ; (vdc_state + 4)
34f0 : c5 1c __ CMP ACCU + 1 
34f2 : d0 05 __ BNE $34f9 ; (vdcwin_border_clear.s1007 + 0)
.s1006:
34f4 : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
34f7 : c5 1b __ CMP ACCU + 0 
.s1007:
34f9 : b0 06 __ BCS $3501 ; (vdcwin_border_clear.s55 + 0)
.s5:
34fb : a5 16 __ LDA P9 ; (border + 0)
34fd : 29 df __ AND #$df
34ff : 85 16 __ STA P9 ; (border + 0)
.s55:
3501 : 24 16 __ BIT P9 ; (border + 0)
3503 : 10 67 __ BPL $356c ; (vdcwin_border_clear.s59 + 0)
.s12:
3505 : a0 01 __ LDY #$01
3507 : b1 14 __ LDA (P7),y ; (win + 0)
3509 : f0 61 __ BEQ $356c ; (vdcwin_border_clear.s59 + 0)
.s9:
350b : 38 __ __ SEC
350c : e9 01 __ SBC #$01
350e : 85 4a __ STA T7 + 0 
3510 : a5 16 __ LDA P9 ; (border + 0)
3512 : 0a __ __ ASL
3513 : 10 18 __ BPL $352d ; (vdcwin_border_clear.s15 + 0)
.s13:
3515 : a5 4a __ LDA T7 + 0 
3517 : 85 0e __ STA P1 
3519 : a5 49 __ LDA T4 + 0 
351b : 85 10 __ STA P3 
351d : bd 41 69 LDA $6941,x ; (winStyles + 1)
3520 : 85 0f __ STA P2 
3522 : 38 __ __ SEC
3523 : 88 __ __ DEY
3524 : b1 14 __ LDA (P7),y ; (win + 0)
3526 : e9 01 __ SBC #$01
3528 : 85 0d __ STA P0 
352a : 20 6e 36 JSR $366e ; (vdc_printc.s0 + 0)
.s15:
352d : a0 00 __ LDY #$00
352f : b1 14 __ LDA (P7),y ; (win + 0)
3531 : 85 46 __ STA T0 + 0 
3533 : 85 0f __ STA P2 
3535 : a5 4a __ LDA T7 + 0 
3537 : 85 10 __ STA P3 
3539 : a5 49 __ LDA T4 + 0 
353b : 85 12 __ STA P5 
353d : a6 48 __ LDX T3 + 0 
353f : bd 45 69 LDA $6945,x ; (winStyles + 5)
3542 : 85 11 __ STA P4 
3544 : a0 02 __ LDY #$02
3546 : b1 14 __ LDA (P7),y ; (win + 0)
3548 : 85 13 __ STA P6 
354a : 20 bc 2b JSR $2bbc ; (vdc_hchar.s0 + 0)
354d : a5 16 __ LDA P9 ; (border + 0)
354f : 29 20 __ AND #$20
3551 : f0 19 __ BEQ $356c ; (vdcwin_border_clear.s59 + 0)
.s16:
3553 : a5 10 __ LDA P3 
3555 : 85 0e __ STA P1 
3557 : a5 12 __ LDA P5 
3559 : 85 10 __ STA P3 
355b : a6 48 __ LDX T3 + 0 
355d : bd 42 69 LDA $6942,x ; (winStyles + 2)
3560 : 85 0f __ STA P2 
3562 : 18 __ __ CLC
3563 : a5 13 __ LDA P6 
3565 : 65 46 __ ADC T0 + 0 
3567 : 85 0d __ STA P0 
3569 : 20 6e 36 JSR $366e ; (vdc_printc.s0 + 0)
.s59:
356c : a5 16 __ LDA P9 ; (border + 0)
356e : 29 10 __ AND #$10
3570 : f0 79 __ BEQ $35eb ; (vdcwin_border_clear.s39 + 0)
.s22:
3572 : a0 01 __ LDY #$01
3574 : b1 14 __ LDA (P7),y ; (win + 0)
3576 : 18 __ __ CLC
3577 : a0 03 __ LDY #$03
3579 : 71 14 __ ADC (P7),y ; (win + 0)
357b : 85 4a __ STA T7 + 0 
357d : a9 00 __ LDA #$00
357f : 2a __ __ ROL
3580 : cd 62 6e CMP $6e62 ; (vdc_state + 6)
3583 : d0 05 __ BNE $358a ; (vdcwin_border_clear.s1005 + 0)
.s1004:
3585 : a5 4a __ LDA T7 + 0 
3587 : cd 61 6e CMP $6e61 ; (vdc_state + 5)
.s1005:
358a : b0 5f __ BCS $35eb ; (vdcwin_border_clear.s39 + 0)
.s19:
358c : a5 16 __ LDA P9 ; (border + 0)
358e : 0a __ __ ASL
358f : 10 1b __ BPL $35ac ; (vdcwin_border_clear.s25 + 0)
.s23:
3591 : a5 4a __ LDA T7 + 0 
3593 : 85 0e __ STA P1 
3595 : a5 49 __ LDA T4 + 0 
3597 : 85 10 __ STA P3 
3599 : a6 48 __ LDX T3 + 0 
359b : bd 43 69 LDA $6943,x ; (winStyles + 3)
359e : 85 0f __ STA P2 
35a0 : 38 __ __ SEC
35a1 : a0 00 __ LDY #$00
35a3 : b1 14 __ LDA (P7),y ; (win + 0)
35a5 : e9 01 __ SBC #$01
35a7 : 85 0d __ STA P0 
35a9 : 20 6e 36 JSR $366e ; (vdc_printc.s0 + 0)
.s25:
35ac : a0 00 __ LDY #$00
35ae : b1 14 __ LDA (P7),y ; (win + 0)
35b0 : 85 46 __ STA T0 + 0 
35b2 : 85 0f __ STA P2 
35b4 : a5 4a __ LDA T7 + 0 
35b6 : 85 10 __ STA P3 
35b8 : a5 49 __ LDA T4 + 0 
35ba : 85 12 __ STA P5 
35bc : a6 48 __ LDX T3 + 0 
35be : bd 46 69 LDA $6946,x ; (winStyles + 6)
35c1 : 85 11 __ STA P4 
35c3 : a0 02 __ LDY #$02
35c5 : b1 14 __ LDA (P7),y ; (win + 0)
35c7 : 85 13 __ STA P6 
35c9 : 20 bc 2b JSR $2bbc ; (vdc_hchar.s0 + 0)
35cc : a5 16 __ LDA P9 ; (border + 0)
35ce : 29 20 __ AND #$20
35d0 : f0 19 __ BEQ $35eb ; (vdcwin_border_clear.s39 + 0)
.s26:
35d2 : a5 10 __ LDA P3 
35d4 : 85 0e __ STA P1 
35d6 : a5 12 __ LDA P5 
35d8 : 85 10 __ STA P3 
35da : a6 48 __ LDX T3 + 0 
35dc : bd 44 69 LDA $6944,x ; (winStyles + 4)
35df : 85 0f __ STA P2 
35e1 : 18 __ __ CLC
35e2 : a5 13 __ LDA P6 
35e4 : 65 46 __ ADC T0 + 0 
35e6 : 85 0d __ STA P0 
35e8 : 20 6e 36 JSR $366e ; (vdc_printc.s0 + 0)
.s39:
35eb : a9 00 __ LDA #$00
35ed : 85 46 __ STA T0 + 0 
35ef : f0 04 __ BEQ $35f5 ; (vdcwin_border_clear.l29 + 0)
.s69:
35f1 : e6 46 __ INC T0 + 0 
35f3 : a5 46 __ LDA T0 + 0 
.l29:
35f5 : a0 03 __ LDY #$03
35f7 : d1 14 __ CMP (P7),y ; (win + 0)
35f9 : 90 01 __ BCC $35fc ; (vdcwin_border_clear.s30 + 0)
.s1001:
35fb : 60 __ __ RTS
.s30:
35fc : a5 16 __ LDA P9 ; (border + 0)
35fe : 0a __ __ ASL
35ff : 10 25 __ BPL $3626 ; (vdcwin_border_clear.s35 + 0)
.s33:
3601 : a5 49 __ LDA T4 + 0 
3603 : 85 10 __ STA P3 
3605 : 38 __ __ SEC
3606 : a0 00 __ LDY #$00
3608 : b1 14 __ LDA (P7),y ; (win + 0)
360a : e9 01 __ SBC #$01
360c : 85 0d __ STA P0 
360e : c8 __ __ INY
360f : b1 14 __ LDA (P7),y ; (win + 0)
3611 : 18 __ __ CLC
3612 : 65 46 __ ADC T0 + 0 
3614 : 85 0e __ STA P1 
3616 : 38 __ __ SEC
3617 : a9 00 __ LDA #$00
3619 : e5 47 __ SBC T2 + 0 
361b : 29 09 __ AND #$09
361d : aa __ __ TAX
361e : bd 47 69 LDA $6947,x ; (winStyles + 7)
3621 : 85 0f __ STA P2 
3623 : 20 6e 36 JSR $366e ; (vdc_printc.s0 + 0)
.s35:
3626 : a9 20 __ LDA #$20
3628 : 85 11 __ STA P4 
362a : a0 02 __ LDY #$02
362c : b1 14 __ LDA (P7),y ; (win + 0)
362e : 85 13 __ STA P6 
3630 : a0 00 __ LDY #$00
3632 : b1 14 __ LDA (P7),y ; (win + 0)
3634 : 85 0f __ STA P2 
3636 : c8 __ __ INY
3637 : b1 14 __ LDA (P7),y ; (win + 0)
3639 : 18 __ __ CLC
363a : 65 46 __ ADC T0 + 0 
363c : 85 10 __ STA P3 
363e : 20 b7 2b JSR $2bb7 ; (vdc_hchar@proxy + 0)
3641 : a5 16 __ LDA P9 ; (border + 0)
3643 : 29 20 __ AND #$20
3645 : f0 aa __ BEQ $35f1 ; (vdcwin_border_clear.s69 + 0)
.s36:
3647 : a5 10 __ LDA P3 
3649 : 85 0e __ STA P1 
364b : a5 49 __ LDA T4 + 0 
364d : 85 10 __ STA P3 
364f : 18 __ __ CLC
3650 : a5 13 __ LDA P6 
3652 : 65 0f __ ADC P2 
3654 : 85 0d __ STA P0 
3656 : 38 __ __ SEC
3657 : a9 00 __ LDA #$00
3659 : e5 47 __ SBC T2 + 0 
365b : 29 09 __ AND #$09
365d : aa __ __ TAX
365e : bd 48 69 LDA $6948,x ; (winStyles + 8)
3661 : 85 0f __ STA P2 
3663 : 20 6e 36 JSR $366e ; (vdc_printc.s0 + 0)
3666 : 4c f1 35 JMP $35f1 ; (vdcwin_border_clear.s69 + 0)
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
3669 : ad 63 6e LDA $6e63 ; (vdc_state + 7)
366c : 85 10 __ STA P3 
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
366e : a5 0e __ LDA P1 ; (y + 0)
3670 : 0a __ __ ASL
3671 : a2 12 __ LDX #$12
3673 : 8e 00 d6 STX $d600 
3676 : aa __ __ TAX
3677 : 18 __ __ CLC
3678 : a5 0d __ LDA P0 ; (x + 0)
367a : 7d 00 70 ADC $7000,x ; (multab + 0)
367d : 85 1b __ STA ACCU + 0 
367f : a9 00 __ LDA #$00
3681 : 7d 01 70 ADC $7001,x ; (multab + 1)
3684 : 85 1c __ STA ACCU + 1 
3686 : 18 __ __ CLC
3687 : a5 1b __ LDA ACCU + 0 
3689 : 6d 64 6e ADC $6e64 ; (vdc_state + 8)
368c : aa __ __ TAX
368d : a5 1c __ LDA ACCU + 1 
368f : 6d 65 6e ADC $6e65 ; (vdc_state + 9)
.l167:
3692 : 2c 00 d6 BIT $d600 
3695 : 10 fb __ BPL $3692 ; (vdc_printc.l167 + 0)
.s9:
3697 : 8d 01 d6 STA $d601 
369a : a9 13 __ LDA #$13
369c : 8d 00 d6 STA $d600 
.l169:
369f : 2c 00 d6 BIT $d600 
36a2 : 10 fb __ BPL $369f ; (vdc_printc.l169 + 0)
.s14:
36a4 : 8e 01 d6 STX $d601 
36a7 : a9 1f __ LDA #$1f
36a9 : 8d 00 d6 STA $d600 
.l171:
36ac : 2c 00 d6 BIT $d600 
36af : 10 fb __ BPL $36ac ; (vdc_printc.l171 + 0)
.s18:
36b1 : a5 0f __ LDA P2 ; (val + 0)
36b3 : 8d 01 d6 STA $d601 
36b6 : ad 66 6e LDA $6e66 ; (vdc_state + 10)
36b9 : 18 __ __ CLC
36ba : 65 1b __ ADC ACCU + 0 
36bc : a8 __ __ TAY
36bd : a9 12 __ LDA #$12
36bf : 8d 00 d6 STA $d600 
36c2 : ad 67 6e LDA $6e67 ; (vdc_state + 11)
36c5 : 65 1c __ ADC ACCU + 1 
.l173:
36c7 : 2c 00 d6 BIT $d600 
36ca : 10 fb __ BPL $36c7 ; (vdc_printc.l173 + 0)
.s25:
36cc : 8d 01 d6 STA $d601 
36cf : a9 13 __ LDA #$13
36d1 : 8d 00 d6 STA $d600 
.l175:
36d4 : 2c 00 d6 BIT $d600 
36d7 : 10 fb __ BPL $36d4 ; (vdc_printc.l175 + 0)
.s30:
36d9 : 8c 01 d6 STY $d601 
36dc : a9 1f __ LDA #$1f
36de : 8d 00 d6 STA $d600 
.l177:
36e1 : 2c 00 d6 BIT $d600 
36e4 : 10 fb __ BPL $36e1 ; (vdc_printc.l177 + 0)
.s34:
36e6 : a5 10 __ LDA P3 ; (attr + 0)
36e8 : 8d 01 d6 STA $d601 
.s1001:
36eb : 60 __ __ RTS
--------------------------------------------------------------------
36ec : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 00             : fILE ERROR!.
--------------------------------------------------------------------
36f8 : __ __ __ BYT 20 25 53 20 00                                  :  %S .
--------------------------------------------------------------------
36fd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
spentry:
36fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
36ff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
3700 : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 00    : eRROR NR.: %2x.
--------------------------------------------------------------------
370f : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 2e 00                : pRESS KEY..
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
371a : 20 e4 ff JSR $ffe4 
371d : c9 00 __ CMP #$00
371f : f0 f9 __ BEQ $371a ; (vdcwin_getch.s0 + 0)
3721 : 85 1b __ STA ACCU + 0 
3723 : a9 00 __ LDA #$00
3725 : 85 1c __ STA ACCU + 1 
.s1001:
3727 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_free: ; vdcwin_win_free()->void
.s0:
3728 : ad 49 6e LDA $6e49 ; (winCfg + 5)
372b : d0 01 __ BNE $372e ; (vdcwin_win_free.s3 + 0)
372d : 60 __ __ RTS
.s3:
372e : 85 44 __ STA T0 + 0 
3730 : a8 __ __ TAY
3731 : be fc 40 LDX $40fc,y ; (__multab13L + 0)
3734 : 86 1b __ STX ACCU + 0 
3736 : bc be 6e LDY $6ebe,x ; (linebuffer + 73)
3739 : 84 1c __ STY ACCU + 1 
373b : bd bf 6e LDA $6ebf,x ; (linebuffer + 74)
373e : 85 43 __ STA T5 + 0 
3740 : 85 1d __ STA ACCU + 2 
3742 : bd b9 6e LDA $6eb9,x ; (linebuffer + 68)
3745 : 85 45 __ STA T2 + 0 
3747 : 8d 4a 6e STA $6e4a ; (winCfg + 6)
374a : bd ba 6e LDA $6eba,x ; (linebuffer + 69)
374d : 85 46 __ STA T2 + 1 
374f : 8d 4b 6e STA $6e4b ; (winCfg + 7)
3752 : bd bc 6e LDA $6ebc,x ; (linebuffer + 71)
3755 : 85 1e __ STA ACCU + 3 
3757 : bd bd 6e LDA $6ebd,x ; (linebuffer + 72)
375a : 85 4a __ STA T10 + 0 
375c : 0a __ __ ASL
375d : aa __ __ TAX
375e : bd 00 70 LDA $7000,x ; (multab + 0)
3761 : 18 __ __ CLC
3762 : 65 1e __ ADC ACCU + 3 
3764 : 85 4b __ STA T11 + 0 
3766 : bd 01 70 LDA $7001,x ; (multab + 1)
3769 : 69 00 __ ADC #$00
376b : 85 4c __ STA T11 + 1 
376d : a6 1b __ LDX ACCU + 0 
376f : bd bb 6e LDA $6ebb,x ; (linebuffer + 70)
3772 : 85 1b __ STA ACCU + 0 
3774 : 0a __ __ ASL
3775 : 10 0e __ BPL $3785 ; (vdcwin_win_free.s53 + 0)
.s10:
3777 : a5 1e __ LDA ACCU + 3 
3779 : f0 0a __ BEQ $3785 ; (vdcwin_win_free.s53 + 0)
.s7:
377b : e6 1c __ INC ACCU + 1 
377d : a5 4b __ LDA T11 + 0 
377f : d0 02 __ BNE $3783 ; (vdcwin_win_free.s1009 + 0)
.s1008:
3781 : c6 4c __ DEC T11 + 1 
.s1009:
3783 : c6 4b __ DEC T11 + 0 
.s53:
3785 : a5 1b __ LDA ACCU + 0 
3787 : 29 20 __ AND #$20
3789 : f0 14 __ BEQ $379f ; (vdcwin_win_free.s55 + 0)
.s14:
378b : 98 __ __ TYA
378c : 18 __ __ CLC
378d : 65 1e __ ADC ACCU + 3 
378f : a8 __ __ TAY
3790 : a9 00 __ LDA #$00
3792 : 2a __ __ ROL
3793 : cd 60 6e CMP $6e60 ; (vdc_state + 4)
3796 : d0 03 __ BNE $379b ; (vdcwin_win_free.s1005 + 0)
.s1004:
3798 : cc 5f 6e CPY $6e5f ; (vdc_state + 3)
.s1005:
379b : b0 02 __ BCS $379f ; (vdcwin_win_free.s55 + 0)
.s11:
379d : e6 1c __ INC ACCU + 1 
.s55:
379f : 24 1b __ BIT ACCU + 0 
37a1 : 10 15 __ BPL $37b8 ; (vdcwin_win_free.s56 + 0)
.s18:
37a3 : a5 4a __ LDA T10 + 0 
37a5 : f0 11 __ BEQ $37b8 ; (vdcwin_win_free.s56 + 0)
.s15:
37a7 : e6 1d __ INC ACCU + 2 
37a9 : 38 __ __ SEC
37aa : a5 4b __ LDA T11 + 0 
37ac : ed 5f 6e SBC $6e5f ; (vdc_state + 3)
37af : 85 4b __ STA T11 + 0 
37b1 : a5 4c __ LDA T11 + 1 
37b3 : ed 60 6e SBC $6e60 ; (vdc_state + 4)
37b6 : 85 4c __ STA T11 + 1 
.s56:
37b8 : a5 1b __ LDA ACCU + 0 
37ba : 29 10 __ AND #$10
37bc : f0 15 __ BEQ $37d3 ; (vdcwin_win_free.s21 + 0)
.s22:
37be : 18 __ __ CLC
37bf : a5 43 __ LDA T5 + 0 
37c1 : 65 4a __ ADC T10 + 0 
37c3 : a8 __ __ TAY
37c4 : a9 00 __ LDA #$00
37c6 : 2a __ __ ROL
37c7 : cd 62 6e CMP $6e62 ; (vdc_state + 6)
37ca : d0 03 __ BNE $37cf ; (vdcwin_win_free.s1003 + 0)
.s1002:
37cc : cc 61 6e CPY $6e61 ; (vdc_state + 5)
.s1003:
37cf : b0 02 __ BCS $37d3 ; (vdcwin_win_free.s21 + 0)
.s19:
37d1 : e6 1d __ INC ACCU + 2 
.s21:
37d3 : a5 1d __ LDA ACCU + 2 
37d5 : d0 11 __ BNE $37e8 ; (vdcwin_win_free.s27 + 0)
.s26:
37d7 : a5 45 __ LDA T2 + 0 
37d9 : 8d 4a 6e STA $6e4a ; (winCfg + 6)
37dc : a5 46 __ LDA T2 + 1 
37de : 8d 4b 6e STA $6e4b ; (winCfg + 7)
37e1 : a6 44 __ LDX T0 + 0 
37e3 : ca __ __ DEX
37e4 : 8e 49 6e STX $6e49 ; (winCfg + 5)
.s1001:
37e7 : 60 __ __ RTS
.s27:
37e8 : 85 47 __ STA T3 + 0 
37ea : a5 1c __ LDA ACCU + 1 
37ec : 85 14 __ STA P7 
.l1006:
37ee : ad 64 6e LDA $6e64 ; (vdc_state + 8)
37f1 : 18 __ __ CLC
37f2 : 65 4b __ ADC T11 + 0 
37f4 : 85 0f __ STA P2 
37f6 : a9 00 __ LDA #$00
37f8 : 85 15 __ STA P8 
37fa : ad 65 6e LDA $6e65 ; (vdc_state + 9)
37fd : 65 4c __ ADC T11 + 1 
37ff : 85 10 __ STA P3 
3801 : ad 44 6e LDA $6e44 ; (winCfg + 0)
3804 : 85 11 __ STA P4 
3806 : ad 4a 6e LDA $6e4a ; (winCfg + 6)
3809 : 85 48 __ STA T7 + 0 
380b : 85 12 __ STA P5 
380d : ad 4b 6e LDA $6e4b ; (winCfg + 7)
3810 : 85 49 __ STA T7 + 1 
3812 : 85 13 __ STA P6 
3814 : 20 2b 17 JSR $172b ; (bnk_cpytovdc.s0 + 0)
3817 : a9 00 __ LDA #$00
3819 : 85 15 __ STA P8 
381b : 18 __ __ CLC
381c : a5 48 __ LDA T7 + 0 
381e : 65 14 __ ADC P7 
3820 : 85 48 __ STA T7 + 0 
3822 : 85 12 __ STA P5 
3824 : 8d 4a 6e STA $6e4a ; (winCfg + 6)
3827 : a5 49 __ LDA T7 + 1 
3829 : 69 00 __ ADC #$00
382b : 85 49 __ STA T7 + 1 
382d : 85 13 __ STA P6 
382f : 8d 4b 6e STA $6e4b ; (winCfg + 7)
3832 : ad 66 6e LDA $6e66 ; (vdc_state + 10)
3835 : 18 __ __ CLC
3836 : 65 4b __ ADC T11 + 0 
3838 : 85 0f __ STA P2 
383a : ad 67 6e LDA $6e67 ; (vdc_state + 11)
383d : 65 4c __ ADC T11 + 1 
383f : 85 10 __ STA P3 
3841 : 20 2b 17 JSR $172b ; (bnk_cpytovdc.s0 + 0)
3844 : 18 __ __ CLC
3845 : a5 48 __ LDA T7 + 0 
3847 : 65 14 __ ADC P7 
3849 : 8d 4a 6e STA $6e4a ; (winCfg + 6)
384c : a5 49 __ LDA T7 + 1 
384e : 69 00 __ ADC #$00
3850 : 8d 4b 6e STA $6e4b ; (winCfg + 7)
3853 : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
3856 : 18 __ __ CLC
3857 : 65 4b __ ADC T11 + 0 
3859 : 85 4b __ STA T11 + 0 
385b : ad 60 6e LDA $6e60 ; (vdc_state + 4)
385e : 65 4c __ ADC T11 + 1 
3860 : 85 4c __ STA T11 + 1 
3862 : c6 47 __ DEC T3 + 0 
3864 : d0 88 __ BNE $37ee ; (vdcwin_win_free.l1006 + 0)
3866 : 4c d7 37 JMP $37d7 ; (vdcwin_win_free.s26 + 0)
--------------------------------------------------------------------
3869 : __ __ __ BYT 2d 20 4d 55 53 49 43 3a 20 75 4c 54 49 4d 41 54 : - MUSIC: uLTIMAT
3879 : __ __ __ BYT 45 20 61 58 45 4c 20 66 20 46 52 4f 4d 20 6e 4f : E aXEL f FROM nO
3889 : __ __ __ BYT 52 44 49 53 43 48 53 4f 55 4e 44 00             : RDISCHSOUND.
--------------------------------------------------------------------
menu_placetop: ; menu_placetop(const u8*)->void
.s0:
3895 : 20 7e 2b JSR $2b7e ; (vdc_cls.s0 + 0)
3898 : a9 00 __ LDA #$00
389a : 85 0f __ STA P2 
389c : 85 10 __ STA P3 
389e : a9 c5 __ LDA #$c5
38a0 : 85 12 __ STA P5 
38a2 : 20 2a 69 JSR $692a ; (vdc_hchar@proxy + 0)
38a5 : a9 c5 __ LDA #$c5
38a7 : 85 13 __ STA P6 
38a9 : a9 39 __ LDA #$39
38ab : 85 12 __ STA P5 
38ad : a9 40 __ LDA #$40
38af : 85 11 __ STA P4 
38b1 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
38b4 : a9 01 __ LDA #$01
38b6 : 85 14 __ STA P7 
--------------------------------------------------------------------
menu_placebar: ; menu_placebar(u8)->void
.s0:
38b8 : a5 14 __ LDA P7 ; (y + 0)
38ba : 8d 8e 69 STA $698e ; (menubar + 60)
38bd : 85 10 __ STA P3 
38bf : a9 00 __ LDA #$00
38c1 : 85 0f __ STA P2 
38c3 : a9 c4 __ LDA #$c4
38c5 : 85 12 __ STA P5 
38c7 : 20 2a 69 JSR $692a ; (vdc_hchar@proxy + 0)
38ca : a9 00 __ LDA #$00
38cc : 85 48 __ STA T1 + 0 
38ce : 85 49 __ STA T2 + 0 
38d0 : a9 01 __ LDA #$01
38d2 : 85 4a __ STA T3 + 0 
38d4 : a9 06 __ LDA #$06
38d6 : 85 4b __ STA T4 + 0 
.l2:
38d8 : 18 __ __ CLC
38d9 : a9 52 __ LDA #$52
38db : 65 49 __ ADC T2 + 0 
38dd : 85 0d __ STA P0 
38df : a9 69 __ LDA #$69
38e1 : 69 00 __ ADC #$00
38e3 : 85 0e __ STA P1 
38e5 : 20 de 30 JSR $30de ; (strlen.s0 + 0)
38e8 : a5 0d __ LDA P0 
38ea : 85 11 __ STA P4 
38ec : a5 0e __ LDA P1 
38ee : 85 12 __ STA P5 
38f0 : a5 1b __ LDA ACCU + 0 
38f2 : 85 4c __ STA T5 + 0 
38f4 : 18 __ __ CLC
38f5 : 65 4a __ ADC T3 + 0 
38f7 : 85 43 __ STA T6 + 0 
38f9 : a9 c4 __ LDA #$c4
38fb : 85 13 __ STA P6 
38fd : a9 00 __ LDA #$00
38ff : 2a __ __ ROL
3900 : 85 44 __ STA T6 + 1 
3902 : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
3905 : 38 __ __ SEC
3906 : e9 01 __ SBC #$01
3908 : a8 __ __ TAY
3909 : ad 60 6e LDA $6e60 ; (vdc_state + 4)
390c : e9 00 __ SBC #$00
390e : c5 44 __ CMP T6 + 1 
3910 : d0 02 __ BNE $3914 ; (menu_placebar.s1003 + 0)
.s1002:
3912 : c4 43 __ CPY T6 + 0 
.s1003:
3914 : 90 04 __ BCC $391a ; (menu_placebar.s5 + 0)
.s7:
3916 : a5 4a __ LDA T3 + 0 
3918 : b0 04 __ BCS $391e ; (menu_placebar.s1004 + 0)
.s5:
391a : 98 __ __ TYA
391b : 38 __ __ SEC
391c : e5 1b __ SBC ACCU + 0 
.s1004:
391e : 85 0f __ STA P2 
3920 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
3923 : a5 0f __ LDA P2 
3925 : a6 48 __ LDX T1 + 0 
3927 : e8 __ __ INX
3928 : 86 48 __ STX T1 + 0 
392a : 9d 87 69 STA $6987,x ; (menubar + 53)
392d : a5 4c __ LDA T5 + 0 
392f : 38 __ __ SEC
3930 : 65 0f __ ADC P2 
3932 : 85 4a __ STA T3 + 0 
3934 : 18 __ __ CLC
3935 : a5 49 __ LDA T2 + 0 
3937 : 69 09 __ ADC #$09
3939 : 85 49 __ STA T2 + 0 
393b : c6 4b __ DEC T4 + 0 
393d : d0 99 __ BNE $38d8 ; (menu_placebar.l2 + 0)
.s1001:
393f : 60 __ __ RTS
--------------------------------------------------------------------
3940 : __ __ __ BYT 20 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d :  oSCAR64 vdc dEM
3950 : __ __ __ BYT 4f 00                                           : O.
--------------------------------------------------------------------
3952 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 3a 20 25 53 00    : sCREENMODE: %S.
--------------------------------------------------------------------
3961 : __ __ __ BYT 73 45 4c 45 43 54 20 44 45 53 49 52 45 44 20 44 : sELECT DESIRED D
3971 : __ __ __ BYT 45 4d 4f 20 55 53 49 4e 47 20 43 55 52 53 4f 52 : EMO USING CURSOR
3981 : __ __ __ BYT 20 4b 45 59 53 20 41 4e 44 20 72 65 74 75 72 6e :  KEYS AND return
3991 : __ __ __ BYT 20 49 4e 20 4d 45 4e 55 2e 00                   :  IN MENU..
--------------------------------------------------------------------
399b : __ __ __ BYT 69 4e 20 53 43 52 4f 4c 4c 49 4e 47 20 44 45 4d : iN SCROLLING DEM
39ab : __ __ __ BYT 4f 53 2c 20 50 52 45 53 53 20 77 61 73 64 20 4f : OS, PRESS wasd O
39bb : __ __ __ BYT 52 20 43 55 52 53 4f 52 20 4b 45 59 53 20 54 4f : R CURSOR KEYS TO
39cb : __ __ __ BYT 20 4d 4f 56 45 2c 20 65 73 63 20 54 4f 20 45 58 :  MOVE, esc TO EX
39db : __ __ __ BYT 49 54 2e 00                                     : IT..
--------------------------------------------------------------------
39df : __ __ __ BYT 25 43 25 53 20 00                               : %C%S .
--------------------------------------------------------------------
39e5 : __ __ __ BYT 73 45 4c 45 43 54 20 53 43 52 45 45 4e 20 4d 4f : sELECT SCREEN MO
39f5 : __ __ __ BYT 44 45 00                                        : DE.
--------------------------------------------------------------------
39f8 : __ __ __ BYT 53 43 52 45 45 4e 32 00                         : SCREEN2.
--------------------------------------------------------------------
3a00 : __ __ __ BYT 69 4e 20 4f 54 48 45 52 20 44 45 4d 4f 53 2c 20 : iN OTHER DEMOS, 
3a10 : __ __ __ BYT 50 52 45 53 53 20 41 20 4b 45 59 20 54 4f 20 43 : PRESS A KEY TO C
3a20 : __ __ __ BYT 4f 4e 54 49 4e 55 45 20 54 4f 20 4e 45 58 54 20 : ONTINUE TO NEXT 
3a30 : __ __ __ BYT 53 54 45 50 2e 00                               : STEP..
--------------------------------------------------------------------
vdcwin_cpy_viewport: ; vdcwin_cpy_viewport(struct VDCViewport*)->void
.s0:
3a36 : a5 16 __ LDA P9 ; (viewport + 0)
3a38 : 85 44 __ STA T0 + 0 
3a3a : a5 17 __ LDA P10 ; (viewport + 1)
3a3c : 85 45 __ STA T0 + 1 
3a3e : a0 09 __ LDY #$09
3a40 : b1 16 __ LDA (P9),y ; (viewport + 0)
3a42 : 85 1b __ STA ACCU + 0 
3a44 : c8 __ __ INY
3a45 : b1 16 __ LDA (P9),y ; (viewport + 0)
3a47 : 85 1c __ STA ACCU + 1 
3a49 : a0 03 __ LDY #$03
3a4b : b1 16 __ LDA (P9),y ; (viewport + 0)
3a4d : 85 03 __ STA WORK + 0 
3a4f : c8 __ __ INY
3a50 : b1 16 __ LDA (P9),y ; (viewport + 0)
3a52 : 85 04 __ STA WORK + 1 
3a54 : 20 5e 65 JSR $655e ; (mul16 + 0)
3a57 : a0 01 __ LDY #$01
3a59 : b1 16 __ LDA (P9),y ; (viewport + 0)
3a5b : 18 __ __ CLC
3a5c : 65 05 __ ADC WORK + 2 
3a5e : aa __ __ TAX
3a5f : c8 __ __ INY
3a60 : b1 16 __ LDA (P9),y ; (viewport + 0)
3a62 : 65 06 __ ADC WORK + 3 
3a64 : 85 47 __ STA T1 + 1 
3a66 : 8a __ __ TXA
3a67 : 18 __ __ CLC
3a68 : a0 07 __ LDY #$07
3a6a : 71 16 __ ADC (P9),y ; (viewport + 0)
3a6c : 85 46 __ STA T1 + 0 
3a6e : a5 47 __ LDA T1 + 1 
3a70 : c8 __ __ INY
3a71 : 71 16 __ ADC (P9),y ; (viewport + 0)
3a73 : 85 47 __ STA T1 + 1 
3a75 : a9 00 __ LDA #$00
3a77 : 85 4a __ STA T3 + 0 
3a79 : a0 11 __ LDY #$11
3a7b : b1 16 __ LDA (P9),y ; (viewport + 0)
3a7d : aa __ __ TAX
3a7e : c8 __ __ INY
3a7f : b1 16 __ LDA (P9),y ; (viewport + 0)
3a81 : 4c bd 3a JMP $3abd ; (vdcwin_cpy_viewport.l1 + 0)
.s2:
3a84 : 86 0f __ STX P2 
3a86 : a5 46 __ LDA T1 + 0 
3a88 : 85 12 __ STA P5 
3a8a : a5 47 __ LDA T1 + 1 
3a8c : 85 13 __ STA P6 
3a8e : a0 00 __ LDY #$00
3a90 : 84 15 __ STY P8 
3a92 : b1 44 __ LDA (T0 + 0),y 
3a94 : 85 11 __ STA P4 
3a96 : a0 0d __ LDY #$0d
3a98 : b1 44 __ LDA (T0 + 0),y 
3a9a : 85 14 __ STA P7 
3a9c : 20 2b 17 JSR $172b ; (bnk_cpytovdc.s0 + 0)
3a9f : a5 46 __ LDA T1 + 0 
3aa1 : 18 __ __ CLC
3aa2 : a0 03 __ LDY #$03
3aa4 : 71 44 __ ADC (T0 + 0),y 
3aa6 : 85 46 __ STA T1 + 0 
3aa8 : a5 47 __ LDA T1 + 1 
3aaa : c8 __ __ INY
3aab : 71 44 __ ADC (T0 + 0),y 
3aad : 85 47 __ STA T1 + 1 
3aaf : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
3ab2 : 18 __ __ CLC
3ab3 : 65 0f __ ADC P2 
3ab5 : aa __ __ TAX
3ab6 : ad 60 6e LDA $6e60 ; (vdc_state + 4)
3ab9 : 65 10 __ ADC P3 
3abb : e6 4a __ INC T3 + 0 
.l1:
3abd : 85 10 __ STA P3 
3abf : a5 4a __ LDA T3 + 0 
3ac1 : a0 0e __ LDY #$0e
3ac3 : d1 44 __ CMP (T0 + 0),y 
3ac5 : 90 bd __ BCC $3a84 ; (vdcwin_cpy_viewport.s2 + 0)
.s4:
3ac7 : a0 03 __ LDY #$03
3ac9 : b1 44 __ LDA (T0 + 0),y 
3acb : 85 46 __ STA T1 + 0 
3acd : 85 03 __ STA WORK + 0 
3acf : c8 __ __ INY
3ad0 : b1 44 __ LDA (T0 + 0),y 
3ad2 : 85 47 __ STA T1 + 1 
3ad4 : 85 04 __ STA WORK + 1 
3ad6 : a0 09 __ LDY #$09
3ad8 : b1 44 __ LDA (T0 + 0),y 
3ada : 85 1b __ STA ACCU + 0 
3adc : c8 __ __ INY
3add : b1 44 __ LDA (T0 + 0),y 
3adf : 85 1c __ STA ACCU + 1 
3ae1 : 20 5e 65 JSR $655e ; (mul16 + 0)
3ae4 : a0 01 __ LDY #$01
3ae6 : b1 44 __ LDA (T0 + 0),y 
3ae8 : 18 __ __ CLC
3ae9 : 65 05 __ ADC WORK + 2 
3aeb : aa __ __ TAX
3aec : c8 __ __ INY
3aed : b1 44 __ LDA (T0 + 0),y 
3aef : 65 06 __ ADC WORK + 3 
3af1 : 85 49 __ STA T2 + 1 
3af3 : 8a __ __ TXA
3af4 : 18 __ __ CLC
3af5 : a0 07 __ LDY #$07
3af7 : 71 44 __ ADC (T0 + 0),y 
3af9 : 85 48 __ STA T2 + 0 
3afb : a5 49 __ LDA T2 + 1 
3afd : c8 __ __ INY
3afe : 71 44 __ ADC (T0 + 0),y 
3b00 : 85 49 __ STA T2 + 1 
3b02 : a0 05 __ LDY #$05
3b04 : b1 44 __ LDA (T0 + 0),y 
3b06 : 85 1b __ STA ACCU + 0 
3b08 : c8 __ __ INY
3b09 : b1 44 __ LDA (T0 + 0),y 
3b0b : 85 1c __ STA ACCU + 1 
3b0d : a5 46 __ LDA T1 + 0 
3b0f : 85 03 __ STA WORK + 0 
3b11 : a5 47 __ LDA T1 + 1 
3b13 : 85 04 __ STA WORK + 1 
3b15 : 20 5e 65 JSR $655e ; (mul16 + 0)
3b18 : 18 __ __ CLC
3b19 : a5 48 __ LDA T2 + 0 
3b1b : 65 05 __ ADC WORK + 2 
3b1d : aa __ __ TAX
3b1e : a5 49 __ LDA T2 + 1 
3b20 : 65 06 __ ADC WORK + 3 
3b22 : a8 __ __ TAY
3b23 : 8a __ __ TXA
3b24 : 18 __ __ CLC
3b25 : 69 30 __ ADC #$30
3b27 : 85 46 __ STA T1 + 0 
3b29 : 90 01 __ BCC $3b2c ; (vdcwin_cpy_viewport.s1007 + 0)
.s1006:
3b2b : c8 __ __ INY
.s1007:
3b2c : 84 47 __ STY T1 + 1 
3b2e : a9 00 __ LDA #$00
3b30 : 85 4a __ STA T3 + 0 
3b32 : a0 13 __ LDY #$13
3b34 : b1 44 __ LDA (T0 + 0),y 
3b36 : aa __ __ TAX
3b37 : c8 __ __ INY
3b38 : b1 44 __ LDA (T0 + 0),y 
3b3a : 4c 76 3b JMP $3b76 ; (vdcwin_cpy_viewport.l5 + 0)
.s6:
3b3d : 86 0f __ STX P2 
3b3f : a5 46 __ LDA T1 + 0 
3b41 : 85 12 __ STA P5 
3b43 : a5 47 __ LDA T1 + 1 
3b45 : 85 13 __ STA P6 
3b47 : a0 00 __ LDY #$00
3b49 : 84 15 __ STY P8 
3b4b : b1 16 __ LDA (P9),y ; (viewport + 0)
3b4d : 85 11 __ STA P4 
3b4f : a0 0d __ LDY #$0d
3b51 : b1 16 __ LDA (P9),y ; (viewport + 0)
3b53 : 85 14 __ STA P7 
3b55 : 20 2b 17 JSR $172b ; (bnk_cpytovdc.s0 + 0)
3b58 : a5 46 __ LDA T1 + 0 
3b5a : 18 __ __ CLC
3b5b : a0 03 __ LDY #$03
3b5d : 71 16 __ ADC (P9),y ; (viewport + 0)
3b5f : 85 46 __ STA T1 + 0 
3b61 : a5 47 __ LDA T1 + 1 
3b63 : c8 __ __ INY
3b64 : 71 16 __ ADC (P9),y ; (viewport + 0)
3b66 : 85 47 __ STA T1 + 1 
3b68 : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
3b6b : 18 __ __ CLC
3b6c : 65 0f __ ADC P2 
3b6e : aa __ __ TAX
3b6f : ad 60 6e LDA $6e60 ; (vdc_state + 4)
3b72 : 65 10 __ ADC P3 
3b74 : e6 4a __ INC T3 + 0 
.l5:
3b76 : 85 10 __ STA P3 
3b78 : a5 4a __ LDA T3 + 0 
3b7a : a0 0e __ LDY #$0e
3b7c : d1 16 __ CMP (P9),y ; (viewport + 0)
3b7e : 90 bd __ BCC $3b3d ; (vdcwin_cpy_viewport.s6 + 0)
.s1001:
3b80 : 60 __ __ RTS
--------------------------------------------------------------------
menu_main: ; menu_main()->u8
.s1000:
3b81 : a2 03 __ LDX #$03
3b83 : b5 53 __ LDA T0 + 0,x 
3b85 : 9d ca bf STA $bfca,x ; (bigfont + 175)
3b88 : ca __ __ DEX
3b89 : 10 f8 __ BPL $3b83 ; (menu_main.s1000 + 2)
.s0:
3b8b : ad 8e 69 LDA $698e ; (menubar + 60)
3b8e : 85 14 __ STA P7 
3b90 : 20 b8 38 JSR $38b8 ; (menu_placebar.s0 + 0)
.l84:
3b93 : a9 01 __ LDA #$01
3b95 : 85 53 __ STA T0 + 0 
.l3:
3b97 : a9 cf __ LDA #$cf
3b99 : 85 13 __ STA P6 
3b9b : a6 53 __ LDX T0 + 0 
3b9d : bd 87 69 LDA $6987,x ; (menubar + 53)
3ba0 : 85 0f __ STA P2 
3ba2 : ad 8e 69 LDA $698e ; (menubar + 60)
3ba5 : 85 10 __ STA P3 
3ba7 : bd 6a 68 LDA $686a,x ; (__multab9L + 0)
3baa : 18 __ __ CLC
3bab : 69 49 __ ADC #$49
3bad : 85 11 __ STA P4 
3baf : a9 69 __ LDA #$69
3bb1 : 69 00 __ ADC #$00
3bb3 : 85 12 __ STA P5 
3bb5 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
.l5:
3bb8 : 20 1a 37 JSR $371a ; (vdcwin_getch.s0 + 0)
3bbb : a5 1b __ LDA ACCU + 0 
3bbd : 85 54 __ STA T1 + 0 
3bbf : c9 0d __ CMP #$0d
3bc1 : d0 06 __ BNE $3bc9 ; (menu_main.s1002 + 0)
.s1003:
3bc3 : a9 00 __ LDA #$00
3bc5 : 85 55 __ STA T3 + 0 
3bc7 : f0 14 __ BEQ $3bdd ; (menu_main.s6 + 0)
.s1002:
3bc9 : a2 01 __ LDX #$01
3bcb : 86 55 __ STX T3 + 0 
3bcd : c9 9d __ CMP #$9d
3bcf : f0 0c __ BEQ $3bdd ; (menu_main.s6 + 0)
.s9:
3bd1 : c9 1d __ CMP #$1d
3bd3 : f0 08 __ BEQ $3bdd ; (menu_main.s6 + 0)
.s8:
3bd5 : c9 1b __ CMP #$1b
3bd7 : f0 04 __ BEQ $3bdd ; (menu_main.s6 + 0)
.s7:
3bd9 : c9 03 __ CMP #$03
3bdb : d0 db __ BNE $3bb8 ; (menu_main.l5 + 0)
.s6:
3bdd : a9 c4 __ LDA #$c4
3bdf : 85 13 __ STA P6 
3be1 : a6 53 __ LDX T0 + 0 
3be3 : bd 87 69 LDA $6987,x ; (menubar + 53)
3be6 : 85 0f __ STA P2 
3be8 : ad 8e 69 LDA $698e ; (menubar + 60)
3beb : 85 56 __ STA T4 + 0 
3bed : 85 10 __ STA P3 
3bef : bd 6a 68 LDA $686a,x ; (__multab9L + 0)
3bf2 : 18 __ __ CLC
3bf3 : 69 49 __ ADC #$49
3bf5 : 85 11 __ STA P4 
3bf7 : a9 69 __ LDA #$69
3bf9 : 69 00 __ ADC #$00
3bfb : 85 12 __ STA P5 
3bfd : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
3c00 : a5 54 __ LDA T1 + 0 
3c02 : c9 9d __ CMP #$9d
3c04 : d0 03 __ BNE $3c09 ; (menu_main.s12 + 0)
3c06 : 4c 96 3c JMP $3c96 ; (menu_main.s11 + 0)
.s12:
3c09 : c9 1d __ CMP #$1d
3c0b : d0 0c __ BNE $3c19 ; (menu_main.s13 + 0)
.s17:
3c0d : e6 53 __ INC T0 + 0 
3c0f : a5 53 __ LDA T0 + 0 
3c11 : c9 07 __ CMP #$07
3c13 : 90 04 __ BCC $3c19 ; (menu_main.s13 + 0)
.s20:
3c15 : a9 01 __ LDA #$01
.s1039:
3c17 : 85 53 __ STA T0 + 0 
.s13:
3c19 : a5 55 __ LDA T3 + 0 
3c1b : f0 0d __ BEQ $3c2a ; (menu_main.s4 + 0)
.s24:
3c1d : a5 54 __ LDA T1 + 0 
3c1f : c9 1b __ CMP #$1b
3c21 : f0 11 __ BEQ $3c34 ; (menu_main.s26 + 0)
.s23:
3c23 : c9 03 __ CMP #$03
3c25 : f0 03 __ BEQ $3c2a ; (menu_main.s4 + 0)
3c27 : 4c 97 3b JMP $3b97 ; (menu_main.l3 + 0)
.s4:
3c2a : a5 54 __ LDA T1 + 0 
3c2c : c9 1b __ CMP #$1b
3c2e : f0 04 __ BEQ $3c34 ; (menu_main.s26 + 0)
.s28:
3c30 : c9 03 __ CMP #$03
3c32 : d0 06 __ BNE $3c3a ; (menu_main.s25 + 0)
.s26:
3c34 : a9 63 __ LDA #$63
3c36 : 85 55 __ STA T3 + 0 
3c38 : d0 44 __ BNE $3c7e ; (menu_main.s2 + 0)
.s25:
3c3a : a6 53 __ LDX T0 + 0 
3c3c : ca __ __ DEX
3c3d : 8e fe bf STX $bffe ; (sstack + 7)
3c40 : bd 88 69 LDA $6988,x ; (menubar + 54)
3c43 : 8d fc bf STA $bffc ; (sstack + 5)
3c46 : a6 56 __ LDX T4 + 0 
3c48 : e8 __ __ INX
3c49 : 8e fd bf STX $bffd ; (sstack + 6)
3c4c : 20 a2 3c JSR $3ca2 ; (menu_pulldown.s1000 + 0)
3c4f : a5 1b __ LDA ACCU + 0 
3c51 : 85 55 __ STA T3 + 0 
3c53 : c9 12 __ CMP #$12
3c55 : d0 0e __ BNE $3c65 ; (menu_main.s31 + 0)
.s29:
3c57 : a9 00 __ LDA #$00
3c59 : 85 55 __ STA T3 + 0 
3c5b : c6 53 __ DEC T0 + 0 
3c5d : d0 06 __ BNE $3c65 ; (menu_main.s31 + 0)
.s32:
3c5f : a9 06 __ LDA #$06
3c61 : 85 53 __ STA T0 + 0 
3c63 : d0 12 __ BNE $3c77 ; (menu_main.s27 + 0)
.s31:
3c65 : c9 13 __ CMP #$13
3c67 : d0 0e __ BNE $3c77 ; (menu_main.s27 + 0)
.s35:
3c69 : e6 53 __ INC T0 + 0 
3c6b : a5 53 __ LDA T0 + 0 
3c6d : c9 07 __ CMP #$07
3c6f : b0 03 __ BCS $3c74 ; (menu_main.s35 + 11)
3c71 : 4c 97 3b JMP $3b97 ; (menu_main.l3 + 0)
3c74 : 4c 93 3b JMP $3b93 ; (menu_main.l84 + 0)
.s27:
3c77 : a5 55 __ LDA T3 + 0 
3c79 : d0 03 __ BNE $3c7e ; (menu_main.s2 + 0)
3c7b : 4c 97 3b JMP $3b97 ; (menu_main.l3 + 0)
.s2:
3c7e : a5 53 __ LDA T0 + 0 
3c80 : 0a __ __ ASL
3c81 : 0a __ __ ASL
3c82 : 18 __ __ CLC
3c83 : 65 53 __ ADC T0 + 0 
3c85 : 0a __ __ ASL
3c86 : 18 __ __ CLC
3c87 : 65 55 __ ADC T3 + 0 
3c89 : 85 1b __ STA ACCU + 0 
.s1001:
3c8b : a2 03 __ LDX #$03
3c8d : bd ca bf LDA $bfca,x ; (bigfont + 175)
3c90 : 95 53 __ STA T0 + 0,x 
3c92 : ca __ __ DEX
3c93 : 10 f8 __ BPL $3c8d ; (menu_main.s1001 + 2)
3c95 : 60 __ __ RTS
.s11:
3c96 : c6 53 __ DEC T0 + 0 
3c98 : f0 03 __ BEQ $3c9d ; (menu_main.s14 + 0)
3c9a : 4c 19 3c JMP $3c19 ; (menu_main.s13 + 0)
.s14:
3c9d : a9 06 __ LDA #$06
3c9f : 4c 17 3c JMP $3c17 ; (menu_main.s1039 + 0)
--------------------------------------------------------------------
menu_pulldown: ; menu_pulldown(u8,u8,u8,u8)->u8
.s1000:
3ca2 : a2 0a __ LDX #$0a
3ca4 : b5 53 __ LDA T1 + 0,x 
3ca6 : 9d cf bf STA $bfcf,x ; (bigfont + 180)
3ca9 : ca __ __ DEX
3caa : 10 f8 __ BPL $3ca4 ; (menu_pulldown.s1000 + 2)
3cac : 38 __ __ SEC
3cad : a5 23 __ LDA SP + 0 
3caf : e9 0a __ SBC #$0a
3cb1 : 85 23 __ STA SP + 0 
3cb3 : b0 02 __ BCS $3cb7 ; (menu_pulldown.s0 + 0)
3cb5 : c6 24 __ DEC SP + 1 
.s0:
3cb7 : a9 d8 __ LDA #$d8
3cb9 : ae fe bf LDX $bffe ; (sstack + 7)
3cbc : 86 52 __ STX T0 + 0 
3cbe : 18 __ __ CLC
3cbf : 7d 5a 68 ADC $685a,x ; (__multab102L + 0)
3cc2 : 85 54 __ STA T2 + 0 
3cc4 : 85 0d __ STA P0 
3cc6 : a9 6a __ LDA #$6a
3cc8 : 7d 62 68 ADC $6862,x ; (__multab102H + 0)
3ccb : 85 55 __ STA T2 + 1 
3ccd : 85 0e __ STA P1 
3ccf : 20 de 30 JSR $30de ; (strlen.s0 + 0)
3cd2 : a6 52 __ LDX T0 + 0 
3cd4 : bd 8f 69 LDA $698f,x ; (pulldown_options + 0)
3cd7 : 85 57 __ STA T4 + 0 
3cd9 : 8d f9 bf STA $bff9 ; (sstack + 2)
3cdc : e0 06 __ CPX #$06
3cde : 90 08 __ BCC $3ce8 ; (menu_pulldown.s87 + 0)
.s86:
3ce0 : a9 f0 __ LDA #$f0
3ce2 : 85 17 __ STA P10 
3ce4 : a9 00 __ LDA #$00
3ce6 : b0 06 __ BCS $3cee ; (menu_pulldown.s91 + 0)
.s87:
3ce8 : a9 70 __ LDA #$70
3cea : 85 17 __ STA P10 
3cec : a9 01 __ LDA #$01
.s91:
3cee : 85 53 __ STA T1 + 0 
3cf0 : ad fc bf LDA $bffc ; (sstack + 5)
3cf3 : 85 52 __ STA T0 + 0 
3cf5 : 85 18 __ STA P11 
3cf7 : ad fd bf LDA $bffd ; (sstack + 6)
3cfa : 85 56 __ STA T3 + 0 
3cfc : 8d f7 bf STA $bff7 ; (sstack + 0)
3cff : 18 __ __ CLC
3d00 : a5 1b __ LDA ACCU + 0 
3d02 : 69 02 __ ADC #$02
3d04 : 8d f8 bf STA $bff8 ; (sstack + 1)
3d07 : 20 1f 32 JSR $321f ; (vdcwin_win_new.s1000 + 0)
3d0a : a9 01 __ LDA #$01
3d0c : 85 58 __ STA T6 + 0 
3d0e : a5 57 __ LDA T4 + 0 
3d10 : f0 57 __ BEQ $3d69 ; (menu_pulldown.l5 + 0)
.s58:
3d12 : 85 59 __ STA T7 + 0 
3d14 : a9 00 __ LDA #$00
3d16 : 85 5a __ STA T8 + 0 
3d18 : 85 5b __ STA T8 + 1 
.l2:
3d1a : a9 75 __ LDA #$75
3d1c : a0 02 __ LDY #$02
3d1e : 91 23 __ STA (SP + 0),y 
3d20 : a9 6e __ LDA #$6e
3d22 : c8 __ __ INY
3d23 : 91 23 __ STA (SP + 0),y 
3d25 : a9 f8 __ LDA #$f8
3d27 : c8 __ __ INY
3d28 : 91 23 __ STA (SP + 0),y 
3d2a : a9 36 __ LDA #$36
3d2c : c8 __ __ INY
3d2d : 91 23 __ STA (SP + 0),y 
3d2f : 18 __ __ CLC
3d30 : a5 54 __ LDA T2 + 0 
3d32 : 65 5a __ ADC T8 + 0 
3d34 : c8 __ __ INY
3d35 : 91 23 __ STA (SP + 0),y 
3d37 : a5 55 __ LDA T2 + 1 
3d39 : 65 5b __ ADC T8 + 1 
3d3b : c8 __ __ INY
3d3c : 91 23 __ STA (SP + 0),y 
3d3e : 20 02 31 JSR $3102 ; (sprintf.s0 + 0)
3d41 : a5 52 __ LDA T0 + 0 
3d43 : 85 0f __ STA P2 
3d45 : a5 56 __ LDA T3 + 0 
3d47 : 85 10 __ STA P3 
3d49 : e6 56 __ INC T3 + 0 
3d4b : a9 75 __ LDA #$75
3d4d : 85 11 __ STA P4 
3d4f : a9 c6 __ LDA #$c6
3d51 : 85 13 __ STA P6 
3d53 : a9 6e __ LDA #$6e
3d55 : 85 12 __ STA P5 
3d57 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
3d5a : 18 __ __ CLC
3d5b : a5 5a __ LDA T8 + 0 
3d5d : 69 11 __ ADC #$11
3d5f : 85 5a __ STA T8 + 0 
3d61 : 90 02 __ BCC $3d65 ; (menu_pulldown.s1047 + 0)
.s1046:
3d63 : e6 5b __ INC T8 + 1 
.s1047:
3d65 : c6 59 __ DEC T7 + 0 
3d67 : d0 b1 __ BNE $3d1a ; (menu_pulldown.l2 + 0)
.l5:
3d69 : a9 2d __ LDA #$2d
3d6b : a0 06 __ LDY #$06
3d6d : 91 23 __ STA (SP + 0),y 
3d6f : a9 00 __ LDA #$00
3d71 : 85 1c __ STA ACCU + 1 
3d73 : c8 __ __ INY
3d74 : 91 23 __ STA (SP + 0),y 
3d76 : a9 75 __ LDA #$75
3d78 : a0 02 __ LDY #$02
3d7a : 91 23 __ STA (SP + 0),y 
3d7c : a9 6e __ LDA #$6e
3d7e : c8 __ __ INY
3d7f : 91 23 __ STA (SP + 0),y 
3d81 : a9 df __ LDA #$df
3d83 : c8 __ __ INY
3d84 : 91 23 __ STA (SP + 0),y 
3d86 : a9 39 __ LDA #$39
3d88 : c8 __ __ INY
3d89 : 91 23 __ STA (SP + 0),y 
3d8b : a5 58 __ LDA T6 + 0 
3d8d : 85 1b __ STA ACCU + 0 
3d8f : a9 11 __ LDA #$11
3d91 : 20 3e 65 JSR $653e ; (mul16by8 + 0)
3d94 : 38 __ __ SEC
3d95 : a5 05 __ LDA WORK + 2 
3d97 : e9 11 __ SBC #$11
3d99 : aa __ __ TAX
3d9a : a5 06 __ LDA WORK + 3 
3d9c : e9 00 __ SBC #$00
3d9e : 85 5d __ STA T9 + 1 
3da0 : 8a __ __ TXA
3da1 : 18 __ __ CLC
3da2 : 65 54 __ ADC T2 + 0 
3da4 : a0 08 __ LDY #$08
3da6 : 91 23 __ STA (SP + 0),y 
3da8 : a5 5d __ LDA T9 + 1 
3daa : 65 55 __ ADC T2 + 1 
3dac : c8 __ __ INY
3dad : 91 23 __ STA (SP + 0),y 
3daf : 20 02 31 JSR $3102 ; (sprintf.s0 + 0)
3db2 : ad fc bf LDA $bffc ; (sstack + 5)
3db5 : 85 0f __ STA P2 
3db7 : a9 75 __ LDA #$75
3db9 : 85 11 __ STA P4 
3dbb : a9 6e __ LDA #$6e
3dbd : 85 12 __ STA P5 
3dbf : a9 cd __ LDA #$cd
3dc1 : 85 13 __ STA P6 
3dc3 : ad fd bf LDA $bffd ; (sstack + 6)
3dc6 : 85 56 __ STA T3 + 0 
3dc8 : 18 __ __ CLC
3dc9 : 65 58 __ ADC T6 + 0 
3dcb : 38 __ __ SEC
3dcc : e9 01 __ SBC #$01
3dce : 85 10 __ STA P3 
3dd0 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
.l7:
3dd3 : 20 1a 37 JSR $371a ; (vdcwin_getch.s0 + 0)
3dd6 : a5 1b __ LDA ACCU + 0 
3dd8 : 85 5a __ STA T8 + 0 
3dda : c9 0d __ CMP #$0d
3ddc : f0 18 __ BEQ $3df6 ; (menu_pulldown.s8 + 0)
.s14:
3dde : c9 9d __ CMP #$9d
3de0 : f0 14 __ BEQ $3df6 ; (menu_pulldown.s8 + 0)
.s13:
3de2 : c9 1d __ CMP #$1d
3de4 : f0 10 __ BEQ $3df6 ; (menu_pulldown.s8 + 0)
.s12:
3de6 : c9 91 __ CMP #$91
3de8 : f0 0c __ BEQ $3df6 ; (menu_pulldown.s8 + 0)
.s11:
3dea : c9 11 __ CMP #$11
3dec : f0 08 __ BEQ $3df6 ; (menu_pulldown.s8 + 0)
.s10:
3dee : c9 1b __ CMP #$1b
3df0 : f0 04 __ BEQ $3df6 ; (menu_pulldown.s8 + 0)
.s9:
3df2 : c9 03 __ CMP #$03
3df4 : d0 dd __ BNE $3dd3 ; (menu_pulldown.l7 + 0)
.s8:
3df6 : a5 1b __ LDA ACCU + 0 
3df8 : c9 1b __ CMP #$1b
3dfa : d0 03 __ BNE $3dff ; (menu_pulldown.s42 + 0)
3dfc : 4c dc 3e JMP $3edc ; (menu_pulldown.s16 + 0)
.s42:
3dff : b0 03 __ BCS $3e04 ; (menu_pulldown.s43 + 0)
3e01 : 4c cc 3e JMP $3ecc ; (menu_pulldown.s44 + 0)
.s43:
3e04 : c9 91 __ CMP #$91
3e06 : f0 43 __ BEQ $3e4b ; (menu_pulldown.s29 + 0)
.s50:
3e08 : b0 2f __ BCS $3e39 ; (menu_pulldown.s51 + 0)
.s52:
3e0a : c9 1d __ CMP #$1d
3e0c : f0 03 __ BEQ $3e11 ; (menu_pulldown.s25 + 0)
3e0e : 4c 69 3d JMP $3d69 ; (menu_pulldown.l5 + 0)
.s25:
3e11 : a5 53 __ LDA T1 + 0 
3e13 : d0 03 __ BNE $3e18 ; (menu_pulldown.s26 + 0)
3e15 : 4c 69 3d JMP $3d69 ; (menu_pulldown.l5 + 0)
.s26:
3e18 : a9 13 __ LDA #$13
.s1045:
3e1a : 85 58 __ STA T6 + 0 
.s6:
3e1c : 20 28 37 JSR $3728 ; (vdcwin_win_free.s0 + 0)
3e1f : a5 58 __ LDA T6 + 0 
3e21 : 85 1b __ STA ACCU + 0 
.s1001:
3e23 : 18 __ __ CLC
3e24 : a5 23 __ LDA SP + 0 
3e26 : 69 0a __ ADC #$0a
3e28 : 85 23 __ STA SP + 0 
3e2a : 90 02 __ BCC $3e2e ; (menu_pulldown.s1001 + 11)
3e2c : e6 24 __ INC SP + 1 
3e2e : a2 0a __ LDX #$0a
3e30 : bd cf bf LDA $bfcf,x ; (bigfont + 180)
3e33 : 95 53 __ STA T1 + 0,x 
3e35 : ca __ __ DEX
3e36 : 10 f8 __ BPL $3e30 ; (menu_pulldown.s1001 + 13)
3e38 : 60 __ __ RTS
.s51:
3e39 : c9 9d __ CMP #$9d
3e3b : f0 03 __ BEQ $3e40 ; (menu_pulldown.s21 + 0)
3e3d : 4c 69 3d JMP $3d69 ; (menu_pulldown.l5 + 0)
.s21:
3e40 : a5 53 __ LDA T1 + 0 
3e42 : d0 03 __ BNE $3e47 ; (menu_pulldown.s22 + 0)
3e44 : 4c 69 3d JMP $3d69 ; (menu_pulldown.l5 + 0)
.s22:
3e47 : a9 12 __ LDA #$12
3e49 : d0 cf __ BNE $3e1a ; (menu_pulldown.s1045 + 0)
.s29:
3e4b : a9 75 __ LDA #$75
3e4d : a0 02 __ LDY #$02
3e4f : 91 23 __ STA (SP + 0),y 
3e51 : a9 6e __ LDA #$6e
3e53 : c8 __ __ INY
3e54 : 91 23 __ STA (SP + 0),y 
3e56 : a9 f8 __ LDA #$f8
3e58 : c8 __ __ INY
3e59 : 91 23 __ STA (SP + 0),y 
3e5b : a9 36 __ LDA #$36
3e5d : c8 __ __ INY
3e5e : 91 23 __ STA (SP + 0),y 
3e60 : a5 58 __ LDA T6 + 0 
3e62 : 85 1b __ STA ACCU + 0 
3e64 : a9 00 __ LDA #$00
3e66 : 85 1c __ STA ACCU + 1 
3e68 : a9 11 __ LDA #$11
3e6a : 20 3e 65 JSR $653e ; (mul16by8 + 0)
3e6d : 38 __ __ SEC
3e6e : a5 05 __ LDA WORK + 2 
3e70 : e9 11 __ SBC #$11
3e72 : aa __ __ TAX
3e73 : a5 06 __ LDA WORK + 3 
3e75 : e9 00 __ SBC #$00
3e77 : 85 44 __ STA T11 + 1 
3e79 : 8a __ __ TXA
3e7a : 18 __ __ CLC
3e7b : 65 54 __ ADC T2 + 0 
3e7d : a0 06 __ LDY #$06
3e7f : 91 23 __ STA (SP + 0),y 
3e81 : a5 44 __ LDA T11 + 1 
3e83 : 65 55 __ ADC T2 + 1 
3e85 : c8 __ __ INY
3e86 : 91 23 __ STA (SP + 0),y 
3e88 : 20 02 31 JSR $3102 ; (sprintf.s0 + 0)
3e8b : ad fc bf LDA $bffc ; (sstack + 5)
3e8e : 85 0f __ STA P2 
3e90 : a9 75 __ LDA #$75
3e92 : 85 11 __ STA P4 
3e94 : a9 6e __ LDA #$6e
3e96 : 85 12 __ STA P5 
3e98 : a9 c6 __ LDA #$c6
3e9a : 85 13 __ STA P6 
3e9c : 18 __ __ CLC
3e9d : a5 58 __ LDA T6 + 0 
3e9f : 65 56 __ ADC T3 + 0 
3ea1 : 38 __ __ SEC
3ea2 : e9 01 __ SBC #$01
3ea4 : 85 10 __ STA P3 
3ea6 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
3ea9 : a5 5a __ LDA T8 + 0 
3eab : c9 91 __ CMP #$91
3ead : d0 0e __ BNE $3ebd ; (menu_pulldown.s31 + 0)
.s30:
3eaf : c6 58 __ DEC T6 + 0 
3eb1 : f0 03 __ BEQ $3eb6 ; (menu_pulldown.s33 + 0)
3eb3 : 4c 69 3d JMP $3d69 ; (menu_pulldown.l5 + 0)
.s33:
3eb6 : a5 57 __ LDA T4 + 0 
.s1044:
3eb8 : 85 58 __ STA T6 + 0 
3eba : 4c 69 3d JMP $3d69 ; (menu_pulldown.l5 + 0)
.s31:
3ebd : e6 58 __ INC T6 + 0 
3ebf : a5 57 __ LDA T4 + 0 
3ec1 : c5 58 __ CMP T6 + 0 
3ec3 : 90 03 __ BCC $3ec8 ; (menu_pulldown.s36 + 0)
3ec5 : 4c 69 3d JMP $3d69 ; (menu_pulldown.l5 + 0)
.s36:
3ec8 : a9 01 __ LDA #$01
3eca : 90 ec __ BCC $3eb8 ; (menu_pulldown.s1044 + 0)
.s44:
3ecc : c9 0d __ CMP #$0d
3ece : d0 03 __ BNE $3ed3 ; (menu_pulldown.s45 + 0)
3ed0 : 4c 1c 3e JMP $3e1c ; (menu_pulldown.s6 + 0)
.s45:
3ed3 : b0 0c __ BCS $3ee1 ; (menu_pulldown.s46 + 0)
.s47:
3ed5 : c9 03 __ CMP #$03
3ed7 : f0 03 __ BEQ $3edc ; (menu_pulldown.s16 + 0)
3ed9 : 4c 69 3d JMP $3d69 ; (menu_pulldown.l5 + 0)
.s16:
3edc : a9 00 __ LDA #$00
3ede : 4c 1a 3e JMP $3e1a ; (menu_pulldown.s1045 + 0)
.s46:
3ee1 : c9 11 __ CMP #$11
3ee3 : d0 03 __ BNE $3ee8 ; (menu_pulldown.s46 + 7)
3ee5 : 4c 4b 3e JMP $3e4b ; (menu_pulldown.s29 + 0)
3ee8 : 4c 69 3d JMP $3d69 ; (menu_pulldown.l5 + 0)
--------------------------------------------------------------------
settings_screenmode: ; settings_screenmode()->void
.s1000:
3eeb : a5 53 __ LDA T0 + 0 
3eed : 8d cd bf STA $bfcd ; (bigfont + 178)
3ef0 : a5 54 __ LDA T2 + 0 
3ef2 : 8d ce bf STA $bfce ; (bigfont + 179)
.s0:
3ef5 : a9 08 __ LDA #$08
3ef7 : 85 18 __ STA P11 
3ef9 : 8d f7 bf STA $bff7 ; (sstack + 0)
3efc : a9 f0 __ LDA #$f0
3efe : 85 17 __ STA P10 
3f00 : a9 1e __ LDA #$1e
3f02 : 8d f8 bf STA $bff8 ; (sstack + 1)
3f05 : a9 0a __ LDA #$0a
3f07 : 8d f9 bf STA $bff9 ; (sstack + 2)
3f0a : ad 63 6e LDA $6e63 ; (vdc_state + 7)
3f0d : 85 53 __ STA T0 + 0 
3f0f : a9 8d __ LDA #$8d
3f11 : 8d 63 6e STA $6e63 ; (vdc_state + 7)
3f14 : 20 1f 32 JSR $321f ; (vdcwin_win_new.s1000 + 0)
3f17 : a9 39 __ LDA #$39
3f19 : 85 12 __ STA P5 
3f1b : a9 e5 __ LDA #$e5
3f1d : 85 11 __ STA P4 
3f1f : 20 f6 2f JSR $2ff6 ; (vdc_prints_attr@proxy + 0)
3f22 : a9 19 __ LDA #$19
3f24 : 8d fc bf STA $bffc ; (sstack + 5)
3f27 : a9 0b __ LDA #$0b
3f29 : 8d fd bf STA $bffd ; (sstack + 6)
3f2c : a9 07 __ LDA #$07
3f2e : 8d fe bf STA $bffe ; (sstack + 7)
3f31 : 20 a2 3c JSR $3ca2 ; (menu_pulldown.s1000 + 0)
3f34 : a5 1b __ LDA ACCU + 0 
3f36 : 85 54 __ STA T2 + 0 
3f38 : 20 28 37 JSR $3728 ; (vdcwin_win_free.s0 + 0)
3f3b : a4 54 __ LDY T2 + 0 
3f3d : f0 06 __ BEQ $3f45 ; (settings_screenmode.s4 + 0)
.s2:
3f3f : 88 __ __ DEY
3f40 : 84 16 __ STY P9 
3f42 : 20 1a 2d JSR $2d1a ; (vdc_set_mode.s1000 + 0)
.s4:
3f45 : a5 53 __ LDA T0 + 0 
3f47 : 8d 63 6e STA $6e63 ; (vdc_state + 7)
.s1001:
3f4a : ad cd bf LDA $bfcd ; (bigfont + 178)
3f4d : 85 53 __ STA T0 + 0 
3f4f : ad ce bf LDA $bfce ; (bigfont + 179)
3f52 : 85 54 __ STA T2 + 0 
3f54 : 60 __ __ RTS
--------------------------------------------------------------------
settings_versioninfo: ; settings_versioninfo()->void
.s1000:
3f55 : 38 __ __ SEC
3f56 : a5 23 __ LDA SP + 0 
3f58 : e9 08 __ SBC #$08
3f5a : 85 23 __ STA SP + 0 
3f5c : b0 02 __ BCS $3f60 ; (settings_versioninfo.s0 + 0)
3f5e : c6 24 __ DEC SP + 1 
.s0:
3f60 : a9 05 __ LDA #$05
3f62 : 85 18 __ STA P11 
3f64 : 8d f7 bf STA $bff7 ; (sstack + 0)
3f67 : a9 f0 __ LDA #$f0
3f69 : 85 17 __ STA P10 
3f6b : a9 3c __ LDA #$3c
3f6d : 8d f8 bf STA $bff8 ; (sstack + 1)
3f70 : a9 0f __ LDA #$0f
3f72 : 8d f9 bf STA $bff9 ; (sstack + 2)
3f75 : ad 63 6e LDA $6e63 ; (vdc_state + 7)
3f78 : 85 52 __ STA T0 + 0 
3f7a : a9 8d __ LDA #$8d
3f7c : 8d 63 6e STA $6e63 ; (vdc_state + 7)
3f7f : 20 1f 32 JSR $321f ; (vdcwin_win_new.s1000 + 0)
3f82 : a9 06 __ LDA #$06
3f84 : 85 0f __ STA P2 
3f86 : 85 10 __ STA P3 
3f88 : a9 ad __ LDA #$ad
3f8a : 8d 63 6e STA $6e63 ; (vdc_state + 7)
3f8d : 85 13 __ STA P6 
3f8f : a9 48 __ LDA #$48
3f91 : 85 11 __ STA P4 
3f93 : a9 40 __ LDA #$40
3f95 : 85 12 __ STA P5 
3f97 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
3f9a : a9 8d __ LDA #$8d
3f9c : 8d 63 6e STA $6e63 ; (vdc_state + 7)
3f9f : 85 13 __ STA P6 
3fa1 : a9 08 __ LDA #$08
3fa3 : 85 10 __ STA P3 
3fa5 : a9 68 __ LDA #$68
3fa7 : 85 11 __ STA P4 
3fa9 : a9 40 __ LDA #$40
3fab : 85 12 __ STA P5 
3fad : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
3fb0 : e6 10 __ INC P3 
3fb2 : a9 79 __ LDA #$79
3fb4 : 85 11 __ STA P4 
3fb6 : a9 40 __ LDA #$40
3fb8 : 85 12 __ STA P5 
3fba : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
3fbd : a9 75 __ LDA #$75
3fbf : a0 02 __ LDY #$02
3fc1 : 91 23 __ STA (SP + 0),y 
3fc3 : a9 6e __ LDA #$6e
3fc5 : c8 __ __ INY
3fc6 : 91 23 __ STA (SP + 0),y 
3fc8 : a9 97 __ LDA #$97
3fca : c8 __ __ INY
3fcb : 91 23 __ STA (SP + 0),y 
3fcd : a9 40 __ LDA #$40
3fcf : c8 __ __ INY
3fd0 : 91 23 __ STA (SP + 0),y 
3fd2 : a9 a3 __ LDA #$a3
3fd4 : c8 __ __ INY
3fd5 : 91 23 __ STA (SP + 0),y 
3fd7 : a9 40 __ LDA #$40
3fd9 : c8 __ __ INY
3fda : 91 23 __ STA (SP + 0),y 
3fdc : 20 02 31 JSR $3102 ; (sprintf.s0 + 0)
3fdf : a9 06 __ LDA #$06
3fe1 : 85 0f __ STA P2 
3fe3 : a9 0a __ LDA #$0a
3fe5 : 85 10 __ STA P3 
3fe7 : 20 ea 68 JSR $68ea ; (vdc_prints_attr@proxy + 0)
3fea : a9 0c __ LDA #$0c
3fec : 85 10 __ STA P3 
3fee : a9 40 __ LDA #$40
3ff0 : 85 12 __ STA P5 
3ff2 : a9 b5 __ LDA #$b5
3ff4 : 85 11 __ STA P4 
3ff6 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
3ff9 : e6 10 __ INC P3 
3ffb : a9 cc __ LDA #$cc
3ffd : 85 11 __ STA P4 
3fff : a9 40 __ LDA #$40
4001 : 85 12 __ STA P5 
4003 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
4006 : e6 10 __ INC P3 
4008 : a9 00 __ LDA #$00
400a : 85 11 __ STA P4 
400c : a9 41 __ LDA #$41
400e : 85 12 __ STA P5 
4010 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
4013 : a9 10 __ LDA #$10
4015 : 85 10 __ STA P3 
4017 : a9 41 __ LDA #$41
4019 : 85 12 __ STA P5 
401b : a9 27 __ LDA #$27
401d : 85 11 __ STA P4 
401f : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
4022 : a9 12 __ LDA #$12
4024 : 85 10 __ STA P3 
4026 : a9 41 __ LDA #$41
4028 : 85 12 __ STA P5 
402a : a9 44 __ LDA #$44
402c : 85 11 __ STA P4 
402e : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
4031 : 20 b6 2c JSR $2cb6 ; (getch.s0 + 0)
4034 : 20 28 37 JSR $3728 ; (vdcwin_win_free.s0 + 0)
4037 : a5 52 __ LDA T0 + 0 
4039 : 8d 63 6e STA $6e63 ; (vdc_state + 7)
.s1001:
403c : 18 __ __ CLC
403d : a5 23 __ LDA SP + 0 
403f : 69 08 __ ADC #$08
4041 : 85 23 __ STA SP + 0 
4043 : 90 02 __ BCC $4047 ; (settings_versioninfo.s1001 + 11)
4045 : e6 24 __ INC SP + 1 
4047 : 60 __ __ RTS
--------------------------------------------------------------------
4048 : __ __ __ BYT 76 45 52 53 49 4f 4e 20 49 4e 46 4f 52 4d 41 54 : vERSION INFORMAT
4058 : __ __ __ BYT 49 4f 4e 20 41 4e 44 20 43 52 45 44 49 54 53 00 : ION AND CREDITS.
--------------------------------------------------------------------
4068 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d 4f : oSCAR64 vdc dEMO
4078 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4079 : __ __ __ BYT 77 52 49 54 54 45 4e 20 49 4e 20 32 30 32 34 20 : wRITTEN IN 2024 
4089 : __ __ __ BYT 42 59 20 78 41 4e 44 45 52 20 6d 4f 4c 00       : BY xANDER mOL.
--------------------------------------------------------------------
4097 : __ __ __ BYT 76 45 52 53 49 4f 4e 3a 20 25 53 00             : vERSION: %S.
--------------------------------------------------------------------
40a3 : __ __ __ BYT 56 30 31 2d 32 30 32 34 30 36 32 39 2d 31 35 33 : V01-20240629-153
40b3 : __ __ __ BYT 35 00                                           : 5.
--------------------------------------------------------------------
40b5 : __ __ __ BYT 6d 55 53 49 43 20 42 59 20 6e 4f 52 44 49 53 43 : mUSIC BY nORDISC
40c5 : __ __ __ BYT 48 53 4f 55 4e 44 00                            : HSOUND.
--------------------------------------------------------------------
40cc : __ __ __ BYT 66 55 4c 4c 20 53 4f 55 52 43 45 20 43 4f 44 45 : fULL SOURCE CODE
40dc : __ __ __ BYT 2c 20 44 4f 43 55 4d 45 4e 54 41 54 49 4f 4e 20 : , DOCUMENTATION 
40ec : __ __ __ BYT 41 4e 44 20 43 52 45 44 49 54 53 20 41 54 3a 00 : AND CREDITS AT:.
--------------------------------------------------------------------
__multab13L:
40fc : __ __ __ BYT 00 0d 1a 27                                     : ...'
--------------------------------------------------------------------
4100 : __ __ __ BYT 48 54 54 50 53 3a 2f 2f 47 49 54 48 55 42 2e 43 : HTTPS://GITHUB.C
4110 : __ __ __ BYT 4f 4d 2f 58 41 48 4d 4f 4c 2f 6f 53 43 41 52 36 : OM/XAHMOL/oSCAR6
4120 : __ __ __ BYT 34 74 45 53 54 2f 00                            : 4tEST/.
--------------------------------------------------------------------
4127 : __ __ __ BYT 28 63 29 20 32 30 32 34 2c 20 69 64 52 45 41 4d : (c) 2024, idREAM
4137 : __ __ __ BYT 54 69 4e 38 62 49 54 53 2e 43 4f 4d 00          : TiN8bITS.COM.
--------------------------------------------------------------------
4144 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 54 4f 20 43 : pRESS A KEY TO C
4154 : __ __ __ BYT 4f 4e 54 49 4e 55 45 2e 00                      : ONTINUE..
--------------------------------------------------------------------
windows_windowstacking: ; windows_windowstacking()->void
.s1000:
415d : a2 04 __ LDX #$04
415f : b5 53 __ LDA T0 + 0,x 
4161 : 9d 45 bf STA $bf45,x ; (bigfont + 42)
4164 : ca __ __ DEX
4165 : 10 f8 __ BPL $415f ; (windows_windowstacking.s1000 + 2)
.s0:
4167 : ad 08 dc LDA $dc08 
416a : 18 __ __ CLC
416b : 6d 09 dc ADC $dc09 
416e : a0 00 __ LDY #$00
4170 : 90 01 __ BCC $4173 ; (windows_windowstacking.s1007 + 0)
.s1006:
4172 : c8 __ __ INY
.s1007:
4173 : 18 __ __ CLC
4174 : 69 01 __ ADC #$01
4176 : 8d 97 69 STA $6997 ; (seed + 0)
4179 : 90 01 __ BCC $417c ; (windows_windowstacking.s1009 + 0)
.s1008:
417b : c8 __ __ INY
.s1009:
417c : 8c 98 69 STY $6998 ; (seed + 1)
417f : a9 00 __ LDA #$00
4181 : 85 54 __ STA T1 + 0 
4183 : 85 55 __ STA T1 + 1 
4185 : 85 56 __ STA T2 + 0 
4187 : 85 57 __ STA T3 + 0 
.l2:
4189 : a5 54 __ LDA T1 + 0 
418b : 29 01 __ AND #$01
418d : 09 f0 __ ORA #$f0
418f : 85 17 __ STA P10 
4191 : a9 28 __ LDA #$28
4193 : 8d f8 bf STA $bff8 ; (sstack + 1)
4196 : 18 __ __ CLC
4197 : a5 57 __ LDA T3 + 0 
4199 : 69 05 __ ADC #$05
419b : 85 18 __ STA P11 
419d : 18 __ __ CLC
419e : a5 56 __ LDA T2 + 0 
41a0 : 69 05 __ ADC #$05
41a2 : 8d f7 bf STA $bff7 ; (sstack + 0)
41a5 : ad 61 6e LDA $6e61 ; (vdc_state + 5)
41a8 : 85 1b __ STA ACCU + 0 
41aa : ad 62 6e LDA $6e62 ; (vdc_state + 6)
41ad : 85 1c __ STA ACCU + 1 
41af : a9 03 __ LDA #$03
41b1 : 85 03 __ STA WORK + 0 
41b3 : a9 00 __ LDA #$00
41b5 : 85 04 __ STA WORK + 1 
41b7 : 20 a0 65 JSR $65a0 ; (divmod + 0)
41ba : a5 1b __ LDA ACCU + 0 
41bc : 8d f9 bf STA $bff9 ; (sstack + 2)
41bf : 20 1f 32 JSR $321f ; (vdcwin_win_new.s1000 + 0)
41c2 : a9 64 __ LDA #$64
41c4 : 85 53 __ STA T0 + 0 
.l5:
41c6 : a9 75 __ LDA #$75
41c8 : 8d fc bf STA $bffc ; (sstack + 5)
41cb : a9 6e __ LDA #$6e
41cd : 8d fd bf STA $bffd ; (sstack + 6)
41d0 : 20 01 43 JSR $4301 ; (rand.s0 + 0)
41d3 : ad 63 6e LDA $6e63 ; (vdc_state + 7)
41d6 : 29 f0 __ AND #$f0
41d8 : 85 46 __ STA T7 + 0 
41da : 20 e9 61 JSR $61e9 ; (divmod@proxy + 0)
41dd : a5 05 __ LDA WORK + 2 
41df : 38 __ __ SEC
41e0 : 65 46 __ ADC T7 + 0 
41e2 : 8d 63 6e STA $6e63 ; (vdc_state + 7)
41e5 : 20 28 43 JSR $4328 ; (generateSentence.s1000 + 0)
41e8 : a9 75 __ LDA #$75
41ea : 8d fc bf STA $bffc ; (sstack + 5)
41ed : a9 6e __ LDA #$6e
41ef : 8d fd bf STA $bffd ; (sstack + 6)
41f2 : ad 49 6e LDA $6e49 ; (winCfg + 5)
41f5 : 85 1b __ STA ACCU + 0 
41f7 : a9 00 __ LDA #$00
41f9 : 85 1c __ STA ACCU + 1 
41fb : a9 0d __ LDA #$0d
41fd : 20 3e 65 JSR $653e ; (mul16by8 + 0)
4200 : 18 __ __ CLC
4201 : a9 bc __ LDA #$bc
4203 : 65 05 __ ADC WORK + 2 
4205 : 8d fa bf STA $bffa ; (sstack + 3)
4208 : a9 6e __ LDA #$6e
420a : 69 00 __ ADC #$00
420c : 8d fb bf STA $bffb ; (sstack + 4)
420f : 20 52 44 JSR $4452 ; (vdcwin_printwrap.s1000 + 0)
4212 : ac 49 6e LDY $6e49 ; (winCfg + 5)
4215 : be fc 40 LDX $40fc,y ; (__multab13L + 0)
4218 : bd c0 6e LDA $6ec0,x ; (linebuffer + 75)
421b : f0 17 __ BEQ $4234 ; (windows_windowstacking.s60 + 0)
.s9:
421d : 86 43 __ STX T5 + 0 
421f : a9 20 __ LDA #$20
4221 : 8d f7 bf STA $bff7 ; (sstack + 0)
4224 : 18 __ __ CLC
4225 : a9 bc __ LDA #$bc
4227 : 65 43 __ ADC T5 + 0 
4229 : 85 17 __ STA P10 
422b : a9 6e __ LDA #$6e
422d : 69 00 __ ADC #$00
422f : 85 18 __ STA P11 
4231 : 20 37 49 JSR $4937 ; (vdcwin_put_char.s1000 + 0)
.s60:
4234 : c6 53 __ DEC T0 + 0 
4236 : d0 8e __ BNE $41c6 ; (windows_windowstacking.l5 + 0)
.s7:
4238 : 20 b6 2c JSR $2cb6 ; (getch.s0 + 0)
423b : ad 63 6e LDA $6e63 ; (vdc_state + 7)
423e : 29 f0 __ AND #$f0
4240 : 09 0d __ ORA #$0d
4242 : 8d 63 6e STA $6e63 ; (vdc_state + 7)
4245 : e6 54 __ INC T1 + 0 
4247 : d0 02 __ BNE $424b ; (windows_windowstacking.s1011 + 0)
.s1010:
4249 : e6 55 __ INC T1 + 1 
.s1011:
424b : 18 __ __ CLC
424c : a5 57 __ LDA T3 + 0 
424e : 69 05 __ ADC #$05
4250 : 85 57 __ STA T3 + 0 
4252 : 18 __ __ CLC
4253 : a5 56 __ LDA T2 + 0 
4255 : 69 03 __ ADC #$03
4257 : 85 56 __ STA T2 + 0 
4259 : ad 49 6e LDA $6e49 ; (winCfg + 5)
425c : c9 03 __ CMP #$03
425e : b0 03 __ BCS $4263 ; (windows_windowstacking.l13 + 0)
4260 : 4c 89 41 JMP $4189 ; (windows_windowstacking.l2 + 0)
.l13:
4263 : 20 28 37 JSR $3728 ; (vdcwin_win_free.s0 + 0)
4266 : a9 64 __ LDA #$64
4268 : 85 53 __ STA T0 + 0 
.l16:
426a : a9 75 __ LDA #$75
426c : 8d fc bf STA $bffc ; (sstack + 5)
426f : a9 6e __ LDA #$6e
4271 : 8d fd bf STA $bffd ; (sstack + 6)
4274 : 20 01 43 JSR $4301 ; (rand.s0 + 0)
4277 : ad 63 6e LDA $6e63 ; (vdc_state + 7)
427a : 29 f0 __ AND #$f0
427c : 85 57 __ STA T3 + 0 
427e : 20 e9 61 JSR $61e9 ; (divmod@proxy + 0)
4281 : a5 05 __ LDA WORK + 2 
4283 : 38 __ __ SEC
4284 : 65 57 __ ADC T3 + 0 
4286 : 8d 63 6e STA $6e63 ; (vdc_state + 7)
4289 : 20 28 43 JSR $4328 ; (generateSentence.s1000 + 0)
428c : a9 75 __ LDA #$75
428e : 8d fc bf STA $bffc ; (sstack + 5)
4291 : a9 6e __ LDA #$6e
4293 : 8d fd bf STA $bffd ; (sstack + 6)
4296 : ad 49 6e LDA $6e49 ; (winCfg + 5)
4299 : 85 1b __ STA ACCU + 0 
429b : a9 00 __ LDA #$00
429d : 85 1c __ STA ACCU + 1 
429f : a9 0d __ LDA #$0d
42a1 : 20 3e 65 JSR $653e ; (mul16by8 + 0)
42a4 : 18 __ __ CLC
42a5 : a9 bc __ LDA #$bc
42a7 : 65 05 __ ADC WORK + 2 
42a9 : 8d fa bf STA $bffa ; (sstack + 3)
42ac : a9 6e __ LDA #$6e
42ae : 69 00 __ ADC #$00
42b0 : 8d fb bf STA $bffb ; (sstack + 4)
42b3 : 20 52 44 JSR $4452 ; (vdcwin_printwrap.s1000 + 0)
42b6 : ac 49 6e LDY $6e49 ; (winCfg + 5)
42b9 : be fc 40 LDX $40fc,y ; (__multab13L + 0)
42bc : bd c0 6e LDA $6ec0,x ; (linebuffer + 75)
42bf : f0 17 __ BEQ $42d8 ; (windows_windowstacking.s61 + 0)
.s20:
42c1 : 86 56 __ STX T2 + 0 
42c3 : a9 20 __ LDA #$20
42c5 : 8d f7 bf STA $bff7 ; (sstack + 0)
42c8 : 18 __ __ CLC
42c9 : a9 bc __ LDA #$bc
42cb : 65 56 __ ADC T2 + 0 
42cd : 85 17 __ STA P10 
42cf : a9 6e __ LDA #$6e
42d1 : 69 00 __ ADC #$00
42d3 : 85 18 __ STA P11 
42d5 : 20 37 49 JSR $4937 ; (vdcwin_put_char.s1000 + 0)
.s61:
42d8 : c6 53 __ DEC T0 + 0 
42da : d0 8e __ BNE $426a ; (windows_windowstacking.l16 + 0)
.s18:
42dc : 20 b6 2c JSR $2cb6 ; (getch.s0 + 0)
42df : ad 63 6e LDA $6e63 ; (vdc_state + 7)
42e2 : 29 f0 __ AND #$f0
42e4 : 09 0d __ ORA #$0d
42e6 : 8d 63 6e STA $6e63 ; (vdc_state + 7)
42e9 : a9 01 __ LDA #$01
42eb : cd 49 6e CMP $6e49 ; (winCfg + 5)
42ee : b0 03 __ BCS $42f3 ; (windows_windowstacking.s14 + 0)
42f0 : 4c 63 42 JMP $4263 ; (windows_windowstacking.l13 + 0)
.s14:
42f3 : 20 28 37 JSR $3728 ; (vdcwin_win_free.s0 + 0)
.s1001:
42f6 : a2 04 __ LDX #$04
42f8 : bd 45 bf LDA $bf45,x ; (bigfont + 42)
42fb : 95 53 __ STA T0 + 0,x 
42fd : ca __ __ DEX
42fe : 10 f8 __ BPL $42f8 ; (windows_windowstacking.s1001 + 2)
4300 : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
.s0:
4301 : ad 98 69 LDA $6998 ; (seed + 1)
4304 : 4a __ __ LSR
4305 : ad 97 69 LDA $6997 ; (seed + 0)
4308 : 6a __ __ ROR
4309 : aa __ __ TAX
430a : a9 00 __ LDA #$00
430c : 6a __ __ ROR
430d : 4d 97 69 EOR $6997 ; (seed + 0)
4310 : 85 1b __ STA ACCU + 0 
4312 : 8a __ __ TXA
4313 : 4d 98 69 EOR $6998 ; (seed + 1)
4316 : 85 1c __ STA ACCU + 1 
4318 : 4a __ __ LSR
4319 : 45 1b __ EOR ACCU + 0 
431b : 8d 97 69 STA $6997 ; (seed + 0)
431e : 85 1b __ STA ACCU + 0 
4320 : 45 1c __ EOR ACCU + 1 
4322 : 8d 98 69 STA $6998 ; (seed + 1)
4325 : 85 1c __ STA ACCU + 1 
.s1001:
4327 : 60 __ __ RTS
--------------------------------------------------------------------
generateSentence: ; generateSentence(u8*)->void
.s1000:
4328 : a5 53 __ LDA T2 + 0 
432a : 8d 4e bf STA $bf4e ; (bigfont + 51)
432d : a5 54 __ LDA T2 + 1 
432f : 8d 4f bf STA $bf4f ; (bigfont + 52)
4332 : 38 __ __ SEC
4333 : a5 23 __ LDA SP + 0 
4335 : e9 0e __ SBC #$0e
4337 : 85 23 __ STA SP + 0 
4339 : b0 02 __ BCS $433d ; (generateSentence.s0 + 0)
433b : c6 24 __ DEC SP + 1 
.s0:
433d : a9 00 __ LDA #$00
433f : 8d da bf STA $bfda ; (bigfont + 191)
4342 : 8d dc bf STA $bfdc ; (bigfont + 193)
4345 : 8d dd bf STA $bfdd ; (bigfont + 194)
4348 : 8d de bf STA $bfde ; (bigfont + 195)
434b : a9 74 __ LDA #$74
434d : 8d d7 bf STA $bfd7 ; (bigfont + 188)
4350 : a9 48 __ LDA #$48
4352 : 8d d8 bf STA $bfd8 ; (bigfont + 189)
4355 : a9 45 __ LDA #$45
4357 : 8d d9 bf STA $bfd9 ; (bigfont + 190)
435a : a9 61 __ LDA #$61
435c : 8d db bf STA $bfdb ; (bigfont + 192)
435f : a2 4b __ LDX #$4b
.l1002:
4361 : bd 98 69 LDA $6998,x ; (seed + 1)
4364 : 9d 8b bf STA $bf8b,x ; (bigfont + 112)
4367 : ca __ __ DEX
4368 : d0 f7 __ BNE $4361 ; (generateSentence.l1002 + 0)
.s1003:
436a : a2 1e __ LDX #$1e
.l1004:
436c : bd 07 6e LDA $6e07,x ; (pulldown_titles + 815)
436f : 9d 6d bf STA $bf6d,x ; (bigfont + 82)
4372 : ca __ __ DEX
4373 : d0 f7 __ BNE $436c ; (generateSentence.l1004 + 0)
.s1005:
4375 : a2 1e __ LDX #$1e
.l1006:
4377 : bd 25 6e LDA $6e25,x 
437a : 9d 4f bf STA $bf4f,x ; (bigfont + 52)
437d : ca __ __ DEX
437e : d0 f7 __ BNE $4377 ; (generateSentence.l1006 + 0)
.s1007:
4380 : 20 01 43 JSR $4301 ; (rand.s0 + 0)
4383 : a5 1b __ LDA ACCU + 0 
4385 : 85 4e __ STA T0 + 0 
4387 : 20 01 43 JSR $4301 ; (rand.s0 + 0)
438a : a5 1b __ LDA ACCU + 0 
438c : 85 4f __ STA T1 + 0 
438e : a5 1c __ LDA ACCU + 1 
4390 : 85 50 __ STA T1 + 1 
4392 : 20 01 43 JSR $4301 ; (rand.s0 + 0)
4395 : a5 1b __ LDA ACCU + 0 
4397 : 85 53 __ STA T2 + 0 
4399 : a5 1c __ LDA ACCU + 1 
439b : 85 54 __ STA T2 + 1 
439d : 20 01 43 JSR $4301 ; (rand.s0 + 0)
43a0 : ad fc bf LDA $bffc ; (sstack + 5)
43a3 : 85 45 __ STA T4 + 0 
43a5 : ad fd bf LDA $bffd ; (sstack + 6)
43a8 : 85 46 __ STA T4 + 1 
43aa : a9 00 __ LDA #$00
43ac : 85 04 __ STA WORK + 1 
43ae : a8 __ __ TAY
43af : 91 45 __ STA (T4 + 0),y 
43b1 : a5 45 __ LDA T4 + 0 
43b3 : a0 02 __ LDY #$02
43b5 : 91 23 __ STA (SP + 0),y 
43b7 : a5 46 __ LDA T4 + 1 
43b9 : c8 __ __ INY
43ba : 91 23 __ STA (SP + 0),y 
43bc : a9 45 __ LDA #$45
43be : c8 __ __ INY
43bf : 91 23 __ STA (SP + 0),y 
43c1 : a9 44 __ LDA #$44
43c3 : c8 __ __ INY
43c4 : 84 03 __ STY WORK + 0 
43c6 : 91 23 __ STA (SP + 0),y 
43c8 : a5 4e __ LDA T0 + 0 
43ca : 29 01 __ AND #$01
43cc : 0a __ __ ASL
43cd : 0a __ __ ASL
43ce : 69 d7 __ ADC #$d7
43d0 : c8 __ __ INY
43d1 : 91 23 __ STA (SP + 0),y 
43d3 : a9 bf __ LDA #$bf
43d5 : 69 00 __ ADC #$00
43d7 : c8 __ __ INY
43d8 : 91 23 __ STA (SP + 0),y 
43da : 20 a0 65 JSR $65a0 ; (divmod + 0)
43dd : a6 05 __ LDX WORK + 2 
43df : bd fa 61 LDA $61fa,x ; (__multab6L + 0)
43e2 : 18 __ __ CLC
43e3 : 69 50 __ ADC #$50
43e5 : a0 08 __ LDY #$08
43e7 : 91 23 __ STA (SP + 0),y 
43e9 : a9 bf __ LDA #$bf
43eb : 69 00 __ ADC #$00
43ed : c8 __ __ INY
43ee : 91 23 __ STA (SP + 0),y 
43f0 : a5 4f __ LDA T1 + 0 
43f2 : 85 1b __ STA ACCU + 0 
43f4 : a5 50 __ LDA T1 + 1 
43f6 : 85 1c __ STA ACCU + 1 
43f8 : 20 35 69 JSR $6935 ; (divmod@proxy + 0)
43fb : a6 05 __ LDX WORK + 2 
43fd : bd 71 68 LDA $6871,x ; (__multab15L + 0)
4400 : 18 __ __ CLC
4401 : 69 8c __ ADC #$8c
4403 : a0 0a __ LDY #$0a
4405 : 91 23 __ STA (SP + 0),y 
4407 : a9 bf __ LDA #$bf
4409 : 69 00 __ ADC #$00
440b : c8 __ __ INY
440c : 91 23 __ STA (SP + 0),y 
440e : a5 53 __ LDA T2 + 0 
4410 : 85 1b __ STA ACCU + 0 
4412 : a5 54 __ LDA T2 + 1 
4414 : 85 1c __ STA ACCU + 1 
4416 : 20 35 69 JSR $6935 ; (divmod@proxy + 0)
4419 : a6 05 __ LDX WORK + 2 
441b : bd fa 61 LDA $61fa,x ; (__multab6L + 0)
441e : 18 __ __ CLC
441f : 69 6e __ ADC #$6e
4421 : a0 0c __ LDY #$0c
4423 : 91 23 __ STA (SP + 0),y 
4425 : a9 bf __ LDA #$bf
4427 : 69 00 __ ADC #$00
4429 : c8 __ __ INY
442a : 91 23 __ STA (SP + 0),y 
442c : 20 02 31 JSR $3102 ; (sprintf.s0 + 0)
.s1001:
442f : 18 __ __ CLC
4430 : a5 23 __ LDA SP + 0 
4432 : 69 0e __ ADC #$0e
4434 : 85 23 __ STA SP + 0 
4436 : 90 02 __ BCC $443a ; (generateSentence.s1001 + 11)
4438 : e6 24 __ INC SP + 1 
443a : ad 4e bf LDA $bf4e ; (bigfont + 51)
443d : 85 53 __ STA T2 + 0 
443f : ad 4f bf LDA $bf4f ; (bigfont + 52)
4442 : 85 54 __ STA T2 + 1 
4444 : 60 __ __ RTS
--------------------------------------------------------------------
4445 : __ __ __ BYT 25 53 20 25 53 20 25 53 20 25 53 2e 00          : %S %S %S %S..
--------------------------------------------------------------------
vdcwin_printwrap: ; vdcwin_printwrap(struct VDCWin*,const u8*)->void
.s1000:
4452 : a2 04 __ LDX #$04
4454 : b5 53 __ LDA T0 + 0,x 
4456 : 9d 90 bf STA $bf90,x ; (bigfont + 117)
4459 : ca __ __ DEX
445a : 10 f8 __ BPL $4454 ; (vdcwin_printwrap.s1000 + 2)
445c : 38 __ __ SEC
445d : a5 23 __ LDA SP + 0 
445f : e9 06 __ SBC #$06
4461 : 85 23 __ STA SP + 0 
4463 : b0 02 __ BCS $4467 ; (vdcwin_printwrap.s0 + 0)
4465 : c6 24 __ DEC SP + 1 
.s0:
4467 : ad fc bf LDA $bffc ; (sstack + 5)
446a : 85 0d __ STA P0 
446c : ad fd bf LDA $bffd ; (sstack + 6)
446f : 85 0e __ STA P1 
4471 : 20 de 30 JSR $30de ; (strlen.s0 + 0)
4474 : a5 1b __ LDA ACCU + 0 
4476 : f0 3b __ BEQ $44b3 ; (vdcwin_printwrap.s1001 + 0)
.s30:
4478 : 85 53 __ STA T0 + 0 
447a : a9 00 __ LDA #$00
447c : 85 55 __ STA T3 + 0 
447e : 85 45 __ STA T6 + 0 
4480 : a9 ff __ LDA #$ff
4482 : 85 57 __ STA T4 + 1 
4484 : 85 44 __ STA T5 + 1 
4486 : ad fa bf LDA $bffa ; (sstack + 3)
4489 : 85 1b __ STA ACCU + 0 
448b : ad fb bf LDA $bffb ; (sstack + 4)
448e : 85 1c __ STA ACCU + 1 ; (win + 0)
4490 : a0 02 __ LDY #$02
4492 : b1 1b __ LDA (ACCU + 0),y 
4494 : 85 54 __ STA T1 + 0 
.l4:
4496 : a5 55 __ LDA T3 + 0 
4498 : c5 53 __ CMP T0 + 0 
449a : b0 0d __ BCS $44a9 ; (vdcwin_printwrap.s7 + 0)
.l9:
449c : 24 44 __ BIT T5 + 1 
449e : 10 09 __ BPL $44a9 ; (vdcwin_printwrap.s7 + 0)
.s8:
44a0 : a5 45 __ LDA T6 + 0 
44a2 : c9 50 __ CMP #$50
44a4 : b0 03 __ BCS $44a9 ; (vdcwin_printwrap.s7 + 0)
44a6 : 4c aa 45 JMP $45aa ; (vdcwin_printwrap.s6 + 0)
.s7:
44a9 : a6 45 __ LDX T6 + 0 
44ab : d0 1c __ BNE $44c9 ; (vdcwin_printwrap.s19 + 0)
.s1:
44ad : a5 55 __ LDA T3 + 0 
44af : c5 53 __ CMP T0 + 0 
44b1 : 90 e9 __ BCC $449c ; (vdcwin_printwrap.l9 + 0)
.s1001:
44b3 : 18 __ __ CLC
44b4 : a5 23 __ LDA SP + 0 
44b6 : 69 06 __ ADC #$06
44b8 : 85 23 __ STA SP + 0 
44ba : 90 02 __ BCC $44be ; (vdcwin_printwrap.s1001 + 11)
44bc : e6 24 __ INC SP + 1 
44be : a2 04 __ LDX #$04
44c0 : bd 90 bf LDA $bf90,x ; (bigfont + 117)
44c3 : 95 53 __ STA T0 + 0,x 
44c5 : ca __ __ DEX
44c6 : 10 f8 __ BPL $44c0 ; (vdcwin_printwrap.s1001 + 13)
44c8 : 60 __ __ RTS
.s19:
44c9 : a9 00 __ LDA #$00
44cb : 9d 98 bf STA $bf98,x ; (bigfont + 125)
44ce : a9 98 __ LDA #$98
44d0 : 85 0d __ STA P0 
44d2 : a9 bf __ LDA #$bf
44d4 : 85 0e __ STA P1 
44d6 : 20 de 30 JSR $30de ; (strlen.s0 + 0)
44d9 : ad fa bf LDA $bffa ; (sstack + 3)
44dc : 85 56 __ STA T4 + 0 
44de : ad fb bf LDA $bffb ; (sstack + 4)
44e1 : 85 57 __ STA T4 + 1 
44e3 : 4c e9 44 JMP $44e9 ; (vdcwin_printwrap.l22 + 0)
.s1013:
44e6 : 20 de 30 JSR $30de ; (strlen.s0 + 0)
.l22:
44e9 : a0 02 __ LDY #$02
44eb : b1 56 __ LDA (T4 + 0),y 
44ed : c5 1b __ CMP ACCU + 0 
44ef : 90 57 __ BCC $4548 ; (vdcwin_printwrap.s23 + 0)
.s24:
44f1 : a0 04 __ LDY #$04
44f3 : b1 56 __ LDA (T4 + 0),y 
44f5 : 18 __ __ CLC
44f6 : 65 1b __ ADC ACCU + 0 
44f8 : b0 06 __ BCS $4500 ; (vdcwin_printwrap.s25 + 0)
.s1010:
44fa : c5 54 __ CMP T1 + 0 
44fc : 90 1a __ BCC $4518 ; (vdcwin_printwrap.s27 + 0)
.s1018:
44fe : f0 18 __ BEQ $4518 ; (vdcwin_printwrap.s27 + 0)
.s25:
4500 : a5 56 __ LDA T4 + 0 
4502 : a0 02 __ LDY #$02
4504 : 91 23 __ STA (SP + 0),y 
4506 : a5 57 __ LDA T4 + 1 
4508 : c8 __ __ INY
4509 : 91 23 __ STA (SP + 0),y 
450b : a9 fd __ LDA #$fd
450d : c8 __ __ INY
450e : 91 23 __ STA (SP + 0),y 
4510 : a9 36 __ LDA #$36
4512 : c8 __ __ INY
4513 : 91 23 __ STA (SP + 0),y 
4515 : 20 d6 45 JSR $45d6 ; (vdcwin_printline.s1000 + 0)
.s27:
4518 : ad fa bf LDA $bffa ; (sstack + 3)
451b : a0 02 __ LDY #$02
451d : 91 23 __ STA (SP + 0),y 
451f : ad fb bf LDA $bffb ; (sstack + 4)
4522 : c8 __ __ INY
4523 : 91 23 __ STA (SP + 0),y 
4525 : a9 98 __ LDA #$98
4527 : c8 __ __ INY
4528 : 91 23 __ STA (SP + 0),y 
452a : a9 bf __ LDA #$bf
452c : c8 __ __ INY
452d : 91 23 __ STA (SP + 0),y 
452f : 20 7e 46 JSR $467e ; (vdcwin_put_string.s1000 + 0)
4532 : a5 55 __ LDA T3 + 0 
4534 : c5 53 __ CMP T0 + 0 
4536 : 90 03 __ BCC $453b ; (vdcwin_printwrap.s49 + 0)
4538 : 4c b3 44 JMP $44b3 ; (vdcwin_printwrap.s1001 + 0)
.s49:
453b : a9 ff __ LDA #$ff
453d : 85 44 __ STA T5 + 1 
453f : 85 57 __ STA T4 + 1 
4541 : a9 00 __ LDA #$00
4543 : 85 45 __ STA T6 + 0 
4545 : 4c 96 44 JMP $4496 ; (vdcwin_printwrap.l4 + 0)
.s23:
4548 : a5 56 __ LDA T4 + 0 
454a : 91 23 __ STA (SP + 0),y 
454c : a5 57 __ LDA T4 + 1 
454e : c8 __ __ INY
454f : 91 23 __ STA (SP + 0),y 
4551 : a9 fd __ LDA #$fd
4553 : c8 __ __ INY
4554 : 91 23 __ STA (SP + 0),y 
4556 : a9 36 __ LDA #$36
4558 : c8 __ __ INY
4559 : 91 23 __ STA (SP + 0),y 
455b : 20 d6 45 JSR $45d6 ; (vdcwin_printline.s1000 + 0)
455e : ad fa bf LDA $bffa ; (sstack + 3)
4561 : 85 17 __ STA P10 
4563 : ad fb bf LDA $bffb ; (sstack + 4)
4566 : 85 18 __ STA P11 
4568 : a0 02 __ LDY #$02
456a : b1 17 __ LDA (P10),y 
456c : 8d f9 bf STA $bff9 ; (sstack + 2)
456f : a9 98 __ LDA #$98
4571 : 8d f7 bf STA $bff7 ; (sstack + 0)
4574 : a9 bf __ LDA #$bf
4576 : 8d f8 bf STA $bff8 ; (sstack + 1)
4579 : 20 7e 48 JSR $487e ; (vdcwin_put_chars.s1000 + 0)
457c : ad fa bf LDA $bffa ; (sstack + 3)
457f : 85 43 __ STA T5 + 0 
4581 : a9 98 __ LDA #$98
4583 : 85 0d __ STA P0 
4585 : a9 bf __ LDA #$bf
4587 : 85 0e __ STA P1 
4589 : ad fb bf LDA $bffb ; (sstack + 4)
458c : 85 44 __ STA T5 + 1 
458e : a0 02 __ LDY #$02
4590 : b1 43 __ LDA (T5 + 0),y 
4592 : 18 __ __ CLC
4593 : 69 98 __ ADC #$98
4595 : 85 43 __ STA T5 + 0 
4597 : a9 bf __ LDA #$bf
4599 : 69 00 __ ADC #$00
459b : 85 44 __ STA T5 + 1 
459d : a0 ff __ LDY #$ff
.l1012:
459f : c8 __ __ INY
45a0 : b1 43 __ LDA (T5 + 0),y 
45a2 : 99 98 bf STA $bf98,y ; (bigfont + 125)
45a5 : d0 f8 __ BNE $459f ; (vdcwin_printwrap.l1012 + 0)
45a7 : 4c e6 44 JMP $44e6 ; (vdcwin_printwrap.s1013 + 0)
.s6:
45aa : ad fc bf LDA $bffc ; (sstack + 5)
45ad : 85 49 __ STA T9 + 0 
45af : ad fd bf LDA $bffd ; (sstack + 6)
45b2 : 85 4a __ STA T9 + 1 
45b4 : a4 55 __ LDY T3 + 0 
45b6 : b1 49 __ LDA (T9 + 0),y 
45b8 : a6 45 __ LDX T6 + 0 
45ba : 9d 98 bf STA $bf98,x ; (bigfont + 125)
45bd : c9 20 __ CMP #$20
45bf : d0 06 __ BNE $45c7 ; (vdcwin_printwrap.s10 + 0)
.s16:
45c1 : a9 00 __ LDA #$00
45c3 : 85 44 __ STA T5 + 1 
45c5 : f0 08 __ BEQ $45cf ; (vdcwin_printwrap.s53 + 0)
.s10:
45c7 : 24 57 __ BIT T4 + 1 
45c9 : 10 04 __ BPL $45cf ; (vdcwin_printwrap.s53 + 0)
.s13:
45cb : a9 00 __ LDA #$00
45cd : 85 57 __ STA T4 + 1 
.s53:
45cf : e6 55 __ INC T3 + 0 
45d1 : e6 45 __ INC T6 + 0 
45d3 : 4c 96 44 JMP $4496 ; (vdcwin_printwrap.l4 + 0)
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
45d6 : a5 53 __ LDA T0 + 0 
45d8 : 8d f3 bf STA $bff3 ; (fname + 13)
45db : a5 54 __ LDA T0 + 1 
45dd : 8d f4 bf STA $bff4 ; (fname + 14)
45e0 : a5 55 __ LDA T1 + 0 
45e2 : 8d f5 bf STA $bff5 ; (fname + 15)
45e5 : 38 __ __ SEC
45e6 : a5 23 __ LDA SP + 0 
45e8 : e9 06 __ SBC #$06
45ea : 85 23 __ STA SP + 0 
45ec : b0 02 __ BCS $45f0 ; (vdcwin_printline.s0 + 0)
45ee : c6 24 __ DEC SP + 1 
.s0:
45f0 : a0 08 __ LDY #$08
45f2 : b1 23 __ LDA (SP + 0),y 
45f4 : 85 53 __ STA T0 + 0 
45f6 : a0 02 __ LDY #$02
45f8 : 91 23 __ STA (SP + 0),y 
45fa : a0 09 __ LDY #$09
45fc : b1 23 __ LDA (SP + 0),y 
45fe : 85 54 __ STA T0 + 1 
4600 : a0 03 __ LDY #$03
4602 : 91 23 __ STA (SP + 0),y 
4604 : a0 0a __ LDY #$0a
4606 : b1 23 __ LDA (SP + 0),y 
4608 : a0 04 __ LDY #$04
460a : 91 23 __ STA (SP + 0),y 
460c : a0 0b __ LDY #$0b
460e : b1 23 __ LDA (SP + 0),y 
4610 : a0 05 __ LDY #$05
4612 : 91 23 __ STA (SP + 0),y 
4614 : 20 7e 46 JSR $467e ; (vdcwin_put_string.s1000 + 0)
4617 : a9 00 __ LDA #$00
4619 : a0 04 __ LDY #$04
461b : 91 53 __ STA (T0 + 0),y 
461d : 88 __ __ DEY
461e : b1 53 __ LDA (T0 + 0),y 
4620 : 85 55 __ STA T1 + 0 
4622 : 38 __ __ SEC
4623 : e9 01 __ SBC #$01
4625 : 85 44 __ STA T3 + 0 
4627 : a0 05 __ LDY #$05
4629 : b1 53 __ LDA (T0 + 0),y 
462b : 90 0b __ BCC $4638 ; (vdcwin_printline.s2 + 0)
.s1002:
462d : aa __ __ TAX
462e : e4 44 __ CPX T3 + 0 
4630 : b0 06 __ BCS $4638 ; (vdcwin_printline.s2 + 0)
.s1:
4632 : e8 __ __ INX
4633 : 8a __ __ TXA
4634 : 91 53 __ STA (T0 + 0),y 
4636 : 90 2b __ BCC $4663 ; (vdcwin_printline.s1001 + 0)
.s2:
4638 : a5 53 __ LDA T0 + 0 
463a : 85 15 __ STA P8 
463c : a5 54 __ LDA T0 + 1 
463e : 85 16 __ STA P9 
4640 : 20 2e 47 JSR $472e ; (vdcwin_scroll_up.s0 + 0)
4643 : a9 20 __ LDA #$20
4645 : 85 11 __ STA P4 
4647 : a0 00 __ LDY #$00
4649 : b1 15 __ LDA (P8),y 
464b : 85 0f __ STA P2 ; (str + 0)
464d : a0 02 __ LDY #$02
464f : b1 15 __ LDA (P8),y 
4651 : 85 13 __ STA P6 
4653 : 88 __ __ DEY
4654 : 84 15 __ STY P8 
4656 : b1 53 __ LDA (T0 + 0),y 
4658 : 18 __ __ CLC
4659 : 65 55 __ ADC T1 + 0 
465b : 38 __ __ SEC
465c : e9 01 __ SBC #$01
465e : 85 14 __ STA P7 
4660 : 20 92 2b JSR $2b92 ; (vdc_clear.s0 + 0)
.s1001:
4663 : 18 __ __ CLC
4664 : a5 23 __ LDA SP + 0 
4666 : 69 06 __ ADC #$06
4668 : 85 23 __ STA SP + 0 
466a : 90 02 __ BCC $466e ; (vdcwin_printline.s1001 + 11)
466c : e6 24 __ INC SP + 1 
466e : ad f3 bf LDA $bff3 ; (fname + 13)
4671 : 85 53 __ STA T0 + 0 
4673 : ad f4 bf LDA $bff4 ; (fname + 14)
4676 : 85 54 __ STA T0 + 1 
4678 : ad f5 bf LDA $bff5 ; (fname + 15)
467b : 85 55 __ STA T1 + 0 
467d : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->void
.s1000:
467e : 38 __ __ SEC
467f : a5 23 __ LDA SP + 0 
4681 : e9 0b __ SBC #$0b
4683 : 85 23 __ STA SP + 0 
4685 : b0 02 __ BCS $4689 ; (vdcwin_put_string.s0 + 0)
4687 : c6 24 __ DEC SP + 1 
.s0:
4689 : a0 0d __ LDY #$0d
468b : b1 23 __ LDA (SP + 0),y 
468d : 85 11 __ STA P4 
468f : c8 __ __ INY
4690 : b1 23 __ LDA (SP + 0),y 
4692 : 85 12 __ STA P5 
4694 : a0 04 __ LDY #$04
4696 : b1 11 __ LDA (P4),y 
4698 : 85 13 __ STA P6 
469a : c8 __ __ INY
469b : b1 11 __ LDA (P4),y 
469d : 85 14 __ STA P7 
469f : a0 0f __ LDY #$0f
46a1 : b1 23 __ LDA (SP + 0),y 
46a3 : 85 15 __ STA P8 
46a5 : c8 __ __ INY
46a6 : b1 23 __ LDA (SP + 0),y 
46a8 : 85 16 __ STA P9 
46aa : 20 f9 46 JSR $46f9 ; (vdcwin_putat_string.s0 + 0)
46ad : 18 __ __ CLC
46ae : a5 1b __ LDA ACCU + 0 
46b0 : 65 13 __ ADC P6 
46b2 : a0 04 __ LDY #$04
46b4 : 91 11 __ STA (P4),y 
46b6 : a0 02 __ LDY #$02
46b8 : d1 11 __ CMP (P4),y 
46ba : 90 31 __ BCC $46ed ; (vdcwin_put_string.s1001 + 0)
.s1:
46bc : a9 00 __ LDA #$00
46be : a0 04 __ LDY #$04
46c0 : 91 11 __ STA (P4),y 
46c2 : a5 14 __ LDA P7 
46c4 : 69 00 __ ADC #$00
46c6 : c8 __ __ INY
46c7 : 91 11 __ STA (P4),y 
46c9 : a0 03 __ LDY #$03
46cb : d1 11 __ CMP (P4),y 
46cd : d0 1e __ BNE $46ed ; (vdcwin_put_string.s1001 + 0)
.s4:
46cf : a5 14 __ LDA P7 
46d1 : a0 05 __ LDY #$05
46d3 : 91 11 __ STA (P4),y 
46d5 : a5 11 __ LDA P4 
46d7 : a0 02 __ LDY #$02
46d9 : 91 23 __ STA (SP + 0),y 
46db : a5 12 __ LDA P5 
46dd : c8 __ __ INY
46de : 91 23 __ STA (SP + 0),y 
46e0 : a9 fd __ LDA #$fd
46e2 : c8 __ __ INY
46e3 : 91 23 __ STA (SP + 0),y 
46e5 : a9 36 __ LDA #$36
46e7 : c8 __ __ INY
46e8 : 91 23 __ STA (SP + 0),y 
46ea : 20 d6 45 JSR $45d6 ; (vdcwin_printline.s1000 + 0)
.s1001:
46ed : 18 __ __ CLC
46ee : a5 23 __ LDA SP + 0 
46f0 : 69 0b __ ADC #$0b
46f2 : 85 23 __ STA SP + 0 
46f4 : 90 02 __ BCC $46f8 ; (vdcwin_put_string.s1001 + 11)
46f6 : e6 24 __ INC SP + 1 
46f8 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_string: ; vdcwin_putat_string(struct VDCWin*,u8,u8,const u8*)->u8
.s0:
46f9 : a9 00 __ LDA #$00
46fb : 85 43 __ STA T0 + 0 
46fd : f0 26 __ BEQ $4725 ; (vdcwin_putat_string.l1 + 0)
.s2:
46ff : 4a __ __ LSR
4700 : 4a __ __ LSR
4701 : 4a __ __ LSR
4702 : 4a __ __ LSR
4703 : 4a __ __ LSR
4704 : aa __ __ TAX
4705 : bd e4 69 LDA $69e4,x ; (p2smap + 0)
4708 : 51 15 __ EOR (P8),y ; (str + 0)
470a : 85 0f __ STA P2 
470c : a5 13 __ LDA P6 ; (x + 0)
470e : 18 __ __ CLC
470f : a0 00 __ LDY #$00
4711 : 71 11 __ ADC (P4),y ; (win + 0)
4713 : 18 __ __ CLC
4714 : 65 43 __ ADC T0 + 0 
4716 : 85 0d __ STA P0 
4718 : a5 14 __ LDA P7 ; (y + 0)
471a : 18 __ __ CLC
471b : c8 __ __ INY
471c : 71 11 __ ADC (P4),y ; (win + 0)
471e : 85 0e __ STA P1 
4720 : 20 69 36 JSR $3669 ; (vdc_printc@proxy + 0)
4723 : e6 43 __ INC T0 + 0 
.l1:
4725 : a4 43 __ LDY T0 + 0 
4727 : b1 15 __ LDA (P8),y ; (str + 0)
4729 : d0 d4 __ BNE $46ff ; (vdcwin_putat_string.s2 + 0)
.s3:
472b : 84 1b __ STY ACCU + 0 
.s1001:
472d : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_up: ; vdcwin_scroll_up(struct VDCWin*,u8)->void
.s0:
472e : a9 00 __ LDA #$00
4730 : 85 46 __ STA T0 + 0 
4732 : a0 02 __ LDY #$02
4734 : b1 15 __ LDA (P8),y ; (win + 0)
4736 : 85 47 __ STA T2 + 0 
4738 : a0 06 __ LDY #$06
473a : b1 15 __ LDA (P8),y ; (win + 0)
473c : 85 48 __ STA T3 + 0 
473e : c8 __ __ INY
473f : b1 15 __ LDA (P8),y ; (win + 0)
4741 : 85 49 __ STA T3 + 1 
4743 : c8 __ __ INY
4744 : b1 15 __ LDA (P8),y ; (win + 0)
4746 : 85 4a __ STA T4 + 0 
4748 : c8 __ __ INY
4749 : b1 15 __ LDA (P8),y ; (win + 0)
474b : 85 4b __ STA T4 + 1 
474d : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
4750 : 85 4c __ STA T5 + 0 
4752 : ad 60 6e LDA $6e60 ; (vdc_state + 4)
4755 : 85 4d __ STA T5 + 1 
4757 : 4c a2 47 JMP $47a2 ; (vdcwin_scroll_up.l1 + 0)
.s2:
475a : a5 48 __ LDA T3 + 0 
475c : 85 0f __ STA P2 
475e : 18 __ __ CLC
475f : 65 4c __ ADC T5 + 0 
4761 : 85 11 __ STA P4 
4763 : a5 49 __ LDA T3 + 1 
4765 : 85 10 __ STA P3 
4767 : 65 4d __ ADC T5 + 1 
4769 : 85 12 __ STA P5 
476b : 20 b2 47 JSR $47b2 ; (vdc_block_copy@proxy + 0)
476e : a5 4a __ LDA T4 + 0 
4770 : 85 0f __ STA P2 
4772 : 18 __ __ CLC
4773 : 65 4c __ ADC T5 + 0 
4775 : 85 11 __ STA P4 
4777 : a5 4b __ LDA T4 + 1 
4779 : 85 10 __ STA P3 
477b : 65 4d __ ADC T5 + 1 
477d : 85 12 __ STA P5 
477f : 20 ba 47 JSR $47ba ; (vdc_block_copy.s0 + 0)
4782 : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
4785 : 18 __ __ CLC
4786 : 65 48 __ ADC T3 + 0 
4788 : 85 48 __ STA T3 + 0 
478a : ad 60 6e LDA $6e60 ; (vdc_state + 4)
478d : 65 49 __ ADC T3 + 1 
478f : 85 49 __ STA T3 + 1 
4791 : 18 __ __ CLC
4792 : a5 4a __ LDA T4 + 0 
4794 : 6d 5f 6e ADC $6e5f ; (vdc_state + 3)
4797 : 85 4a __ STA T4 + 0 
4799 : a5 4b __ LDA T4 + 1 
479b : 6d 60 6e ADC $6e60 ; (vdc_state + 4)
479e : 85 4b __ STA T4 + 1 
47a0 : e6 46 __ INC T0 + 0 
.l1:
47a2 : a0 03 __ LDY #$03
47a4 : b1 15 __ LDA (P8),y ; (win + 0)
47a6 : 38 __ __ SEC
47a7 : e9 01 __ SBC #$01
47a9 : 90 af __ BCC $475a ; (vdcwin_scroll_up.s2 + 0)
.s1002:
47ab : c5 46 __ CMP T0 + 0 
47ad : 90 02 __ BCC $47b1 ; (vdcwin_scroll_up.s1001 + 0)
.s1004:
47af : d0 a9 __ BNE $475a ; (vdcwin_scroll_up.s2 + 0)
.s1001:
47b1 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
47b2 : a5 47 __ LDA $47 
47b4 : 85 13 __ STA P6 
47b6 : a9 00 __ LDA #$00
47b8 : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_block_copy: ; vdc_block_copy(u16,u16,u16)->void
.s0:
47ba : a5 14 __ LDA P7 ; (length + 1)
47bc : d0 50 __ BNE $480e ; (vdc_block_copy.s73 + 0)
.s4:
47be : 20 5f 2c JSR $2c5f ; (vdc_mem_addr@proxy + 0)
47c1 : a2 18 __ LDX #$18
47c3 : 8e 00 d6 STX $d600 
.l332:
47c6 : 2c 00 d6 BIT $d600 
47c9 : 10 fb __ BPL $47c6 ; (vdc_block_copy.l332 + 0)
.s40:
47cb : ad 01 d6 LDA $d601 
47ce : 09 80 __ ORA #$80
47d0 : 8e 00 d6 STX $d600 
.l334:
47d3 : 2c 00 d6 BIT $d600 
47d6 : 10 fb __ BPL $47d3 ; (vdc_block_copy.l334 + 0)
.s46:
47d8 : 8d 01 d6 STA $d601 
47db : a9 20 __ LDA #$20
47dd : 8d 00 d6 STA $d600 
.l336:
47e0 : 2c 00 d6 BIT $d600 
47e3 : 10 fb __ BPL $47e0 ; (vdc_block_copy.l336 + 0)
.s51:
47e5 : a5 12 __ LDA P5 ; (src + 1)
47e7 : 8d 01 d6 STA $d601 
47ea : a9 21 __ LDA #$21
47ec : 8d 00 d6 STA $d600 
.l338:
47ef : 2c 00 d6 BIT $d600 
47f2 : 10 fb __ BPL $47ef ; (vdc_block_copy.l338 + 0)
.s56:
47f4 : a5 11 __ LDA P4 ; (src + 0)
47f6 : 8d 01 d6 STA $d601 
47f9 : a9 1f __ LDA #$1f
47fb : 8d 00 d6 STA $d600 
47fe : a9 1e __ LDA #$1e
4800 : 8d 00 d6 STA $d600 
.l340:
4803 : 2c 00 d6 BIT $d600 
4806 : 10 fb __ BPL $4803 ; (vdc_block_copy.l340 + 0)
.s62:
4808 : a5 13 __ LDA P6 ; (length + 0)
480a : 8d 01 d6 STA $d601 
.s1001:
480d : 60 __ __ RTS
.s73:
480e : 85 45 __ STA T2 + 0 
4810 : a5 10 __ LDA P3 ; (dest + 1)
4812 : 85 44 __ STA T0 + 1 
4814 : a5 0f __ LDA P2 ; (dest + 0)
4816 : 85 0d __ STA P0 
.l2:
4818 : a5 44 __ LDA T0 + 1 
481a : 85 0e __ STA P1 
481c : 20 67 2c JSR $2c67 ; (vdc_mem_addr.s0 + 0)
481f : a2 18 __ LDX #$18
4821 : 8e 00 d6 STX $d600 
.l321:
4824 : 2c 00 d6 BIT $d600 
4827 : 10 fb __ BPL $4824 ; (vdc_block_copy.l321 + 0)
.s11:
4829 : ad 01 d6 LDA $d601 
482c : 09 80 __ ORA #$80
482e : 8e 00 d6 STX $d600 
.l323:
4831 : 2c 00 d6 BIT $d600 
4834 : 10 fb __ BPL $4831 ; (vdc_block_copy.l323 + 0)
.s17:
4836 : 8d 01 d6 STA $d601 
4839 : a9 20 __ LDA #$20
483b : 8d 00 d6 STA $d600 
.l325:
483e : 2c 00 d6 BIT $d600 
4841 : 10 fb __ BPL $483e ; (vdc_block_copy.l325 + 0)
.s22:
4843 : a5 12 __ LDA P5 ; (src + 1)
4845 : 8d 01 d6 STA $d601 
4848 : a9 21 __ LDA #$21
484a : 8d 00 d6 STA $d600 
.l327:
484d : 2c 00 d6 BIT $d600 
4850 : 10 fb __ BPL $484d ; (vdc_block_copy.l327 + 0)
.s27:
4852 : a5 11 __ LDA P4 ; (src + 0)
4854 : 8d 01 d6 STA $d601 
4857 : a9 1f __ LDA #$1f
4859 : 8d 00 d6 STA $d600 
485c : a9 1e __ LDA #$1e
485e : 8d 00 d6 STA $d600 
.l329:
4861 : 2c 00 d6 BIT $d600 
4864 : 10 fb __ BPL $4861 ; (vdc_block_copy.l329 + 0)
.s33:
4866 : e6 12 __ INC P5 ; (src + 1)
4868 : a9 ff __ LDA #$ff
486a : 8d 01 d6 STA $d601 
486d : e6 44 __ INC T0 + 1 
486f : c6 45 __ DEC T2 + 0 
4871 : d0 a5 __ BNE $4818 ; (vdc_block_copy.l2 + 0)
.s145:
4873 : a5 0d __ LDA P0 
4875 : 85 0f __ STA P2 ; (dest + 0)
4877 : a5 44 __ LDA T0 + 1 
4879 : 85 10 __ STA P3 ; (dest + 1)
487b : 4c be 47 JMP $47be ; (vdc_block_copy.s4 + 0)
--------------------------------------------------------------------
vdcwin_put_chars: ; vdcwin_put_chars(struct VDCWin*,const u8*,u8)->void
.s1000:
487e : a2 05 __ LDX #$05
4880 : b5 53 __ LDA T1 + 0,x 
4882 : 9d e9 bf STA $bfe9,x ; (vp_fill + 24)
4885 : ca __ __ DEX
4886 : 10 f8 __ BPL $4880 ; (vdcwin_put_chars.s1000 + 2)
4888 : 38 __ __ SEC
4889 : a5 23 __ LDA SP + 0 
488b : e9 06 __ SBC #$06
488d : 85 23 __ STA SP + 0 
488f : b0 02 __ BCS $4893 ; (vdcwin_put_chars.s0 + 0)
4891 : c6 24 __ DEC SP + 1 
.s0:
4893 : ad f9 bf LDA $bff9 ; (sstack + 2)
4896 : f0 4a __ BEQ $48e2 ; (vdcwin_put_chars.s1 + 0)
.s14:
4898 : 85 53 __ STA T1 + 0 
489a : a0 05 __ LDY #$05
489c : b1 17 __ LDA (P10),y ; (win + 0)
489e : 85 55 __ STA T3 + 0 
48a0 : 88 __ __ DEY
48a1 : b1 17 __ LDA (P10),y ; (win + 0)
48a3 : 85 56 __ STA T4 + 0 
48a5 : ad f7 bf LDA $bff7 ; (sstack + 0)
48a8 : 85 57 __ STA T5 + 0 
48aa : ad f8 bf LDA $bff8 ; (sstack + 1)
48ad : 85 58 __ STA T5 + 1 
48af : a0 00 __ LDY #$00
.l1008:
48b1 : 84 54 __ STY T2 + 0 
48b3 : b1 57 __ LDA (T5 + 0),y 
48b5 : 4a __ __ LSR
48b6 : 4a __ __ LSR
48b7 : 4a __ __ LSR
48b8 : 4a __ __ LSR
48b9 : 4a __ __ LSR
48ba : aa __ __ TAX
48bb : bd e4 69 LDA $69e4,x ; (p2smap + 0)
48be : 51 57 __ EOR (T5 + 0),y 
48c0 : 85 0f __ STA P2 
48c2 : a0 00 __ LDY #$00
48c4 : b1 17 __ LDA (P10),y ; (win + 0)
48c6 : 18 __ __ CLC
48c7 : 65 56 __ ADC T4 + 0 
48c9 : 18 __ __ CLC
48ca : 65 54 __ ADC T2 + 0 
48cc : 85 0d __ STA P0 
48ce : c8 __ __ INY
48cf : b1 17 __ LDA (P10),y ; (win + 0)
48d1 : 18 __ __ CLC
48d2 : 65 55 __ ADC T3 + 0 
48d4 : 85 0e __ STA P1 
48d6 : 20 69 36 JSR $3669 ; (vdc_printc@proxy + 0)
48d9 : a4 54 __ LDY T2 + 0 
48db : c8 __ __ INY
48dc : c4 53 __ CPY T1 + 0 
48de : 90 d1 __ BCC $48b1 ; (vdcwin_put_chars.l1008 + 0)
.s1010:
48e0 : a5 53 __ LDA T1 + 0 
.s1:
48e2 : 18 __ __ CLC
48e3 : a0 04 __ LDY #$04
48e5 : 71 17 __ ADC (P10),y ; (win + 0)
48e7 : 91 17 __ STA (P10),y ; (win + 0)
48e9 : a0 02 __ LDY #$02
48eb : d1 17 __ CMP (P10),y ; (win + 0)
48ed : 90 32 __ BCC $4921 ; (vdcwin_put_chars.s1001 + 0)
.s8:
48ef : a9 00 __ LDA #$00
48f1 : a0 04 __ LDY #$04
48f3 : 91 17 __ STA (P10),y ; (win + 0)
48f5 : c8 __ __ INY
48f6 : b1 17 __ LDA (P10),y ; (win + 0)
48f8 : aa __ __ TAX
48f9 : 18 __ __ CLC
48fa : 69 01 __ ADC #$01
48fc : 91 17 __ STA (P10),y ; (win + 0)
48fe : a0 03 __ LDY #$03
4900 : d1 17 __ CMP (P10),y ; (win + 0)
4902 : d0 1d __ BNE $4921 ; (vdcwin_put_chars.s1001 + 0)
.s11:
4904 : 8a __ __ TXA
4905 : a0 05 __ LDY #$05
4907 : 91 17 __ STA (P10),y ; (win + 0)
4909 : a5 17 __ LDA P10 ; (win + 0)
490b : a0 02 __ LDY #$02
490d : 91 23 __ STA (SP + 0),y 
490f : a5 18 __ LDA P11 ; (win + 1)
4911 : c8 __ __ INY
4912 : 91 23 __ STA (SP + 0),y 
4914 : a9 fd __ LDA #$fd
4916 : c8 __ __ INY
4917 : 91 23 __ STA (SP + 0),y 
4919 : a9 36 __ LDA #$36
491b : c8 __ __ INY
491c : 91 23 __ STA (SP + 0),y 
491e : 20 d6 45 JSR $45d6 ; (vdcwin_printline.s1000 + 0)
.s1001:
4921 : 18 __ __ CLC
4922 : a5 23 __ LDA SP + 0 
4924 : 69 06 __ ADC #$06
4926 : 85 23 __ STA SP + 0 
4928 : 90 02 __ BCC $492c ; (vdcwin_put_chars.s1001 + 11)
492a : e6 24 __ INC SP + 1 
492c : a2 05 __ LDX #$05
492e : bd e9 bf LDA $bfe9,x ; (vp_fill + 24)
4931 : 95 53 __ STA T1 + 0,x 
4933 : ca __ __ DEX
4934 : 10 f8 __ BPL $492e ; (vdcwin_put_chars.s1001 + 13)
4936 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_char: ; vdcwin_put_char(struct VDCWin*,u8)->void
.s1000:
4937 : a5 53 __ LDA T0 + 0 
4939 : 8d ef bf STA $bfef ; (vp_fill + 30)
493c : a5 54 __ LDA T2 + 0 
493e : 8d f0 bf STA $bff0 ; (vp_fill + 31)
4941 : 38 __ __ SEC
4942 : a5 23 __ LDA SP + 0 
4944 : e9 06 __ SBC #$06
4946 : 85 23 __ STA SP + 0 
4948 : b0 02 __ BCS $494c ; (vdcwin_put_char.s0 + 0)
494a : c6 24 __ DEC SP + 1 
.s0:
494c : ad f7 bf LDA $bff7 ; (sstack + 0)
494f : 4a __ __ LSR
4950 : 4a __ __ LSR
4951 : 4a __ __ LSR
4952 : 4a __ __ LSR
4953 : 4a __ __ LSR
4954 : aa __ __ TAX
4955 : bd e4 69 LDA $69e4,x ; (p2smap + 0)
4958 : 4d f7 bf EOR $bff7 ; (sstack + 0)
495b : 85 0f __ STA P2 
495d : a0 04 __ LDY #$04
495f : b1 17 __ LDA (P10),y ; (win + 0)
4961 : 85 53 __ STA T0 + 0 
4963 : 18 __ __ CLC
4964 : a0 00 __ LDY #$00
4966 : 71 17 __ ADC (P10),y ; (win + 0)
4968 : 85 0d __ STA P0 
496a : a0 05 __ LDY #$05
496c : b1 17 __ LDA (P10),y ; (win + 0)
496e : 85 54 __ STA T2 + 0 
4970 : 18 __ __ CLC
4971 : a0 01 __ LDY #$01
4973 : 71 17 __ ADC (P10),y ; (win + 0)
4975 : 85 0e __ STA P1 
4977 : 20 69 36 JSR $3669 ; (vdc_printc@proxy + 0)
497a : a6 53 __ LDX T0 + 0 
497c : e8 __ __ INX
497d : 8a __ __ TXA
497e : a0 04 __ LDY #$04
4980 : 91 17 __ STA (P10),y ; (win + 0)
4982 : a0 02 __ LDY #$02
4984 : d1 17 __ CMP (P10),y ; (win + 0)
4986 : d0 32 __ BNE $49ba ; (vdcwin_put_char.s1001 + 0)
.s4:
4988 : a9 00 __ LDA #$00
498a : a0 04 __ LDY #$04
498c : 91 17 __ STA (P10),y ; (win + 0)
498e : 18 __ __ CLC
498f : a5 54 __ LDA T2 + 0 
4991 : 69 01 __ ADC #$01
4993 : c8 __ __ INY
4994 : 91 17 __ STA (P10),y ; (win + 0)
4996 : a0 03 __ LDY #$03
4998 : d1 17 __ CMP (P10),y ; (win + 0)
499a : d0 1e __ BNE $49ba ; (vdcwin_put_char.s1001 + 0)
.s7:
499c : a5 54 __ LDA T2 + 0 
499e : a0 05 __ LDY #$05
49a0 : 91 17 __ STA (P10),y ; (win + 0)
49a2 : a5 17 __ LDA P10 ; (win + 0)
49a4 : a0 02 __ LDY #$02
49a6 : 91 23 __ STA (SP + 0),y 
49a8 : a5 18 __ LDA P11 ; (win + 1)
49aa : c8 __ __ INY
49ab : 91 23 __ STA (SP + 0),y 
49ad : a9 fd __ LDA #$fd
49af : c8 __ __ INY
49b0 : 91 23 __ STA (SP + 0),y 
49b2 : a9 36 __ LDA #$36
49b4 : c8 __ __ INY
49b5 : 91 23 __ STA (SP + 0),y 
49b7 : 20 d6 45 JSR $45d6 ; (vdcwin_printline.s1000 + 0)
.s1001:
49ba : 18 __ __ CLC
49bb : a5 23 __ LDA SP + 0 
49bd : 69 06 __ ADC #$06
49bf : 85 23 __ STA SP + 0 
49c1 : 90 02 __ BCC $49c5 ; (vdcwin_put_char.s1001 + 11)
49c3 : e6 24 __ INC SP + 1 
49c5 : ad ef bf LDA $bfef ; (vp_fill + 30)
49c8 : 85 53 __ STA T0 + 0 
49ca : ad f0 bf LDA $bff0 ; (vp_fill + 31)
49cd : 85 54 __ STA T2 + 0 
49cf : 60 __ __ RTS
--------------------------------------------------------------------
windows_textinput: ; windows_textinput()->void
.s1000:
49d0 : a2 04 __ LDX #$04
49d2 : b5 53 __ LDA T0 + 0,x 
49d4 : 9d 8a bf STA $bf8a,x ; (bigfont + 111)
49d7 : ca __ __ DEX
49d8 : 10 f8 __ BPL $49d2 ; (windows_textinput.s1000 + 2)
49da : 38 __ __ SEC
49db : a5 23 __ LDA SP + 0 
49dd : e9 06 __ SBC #$06
49df : 85 23 __ STA SP + 0 
49e1 : b0 02 __ BCS $49e5 ; (windows_textinput.s0 + 0)
49e3 : c6 24 __ DEC SP + 1 
.s0:
49e5 : a9 f0 __ LDA #$f0
49e7 : 85 17 __ STA P10 
49e9 : a9 3c __ LDA #$3c
49eb : 8d f8 bf STA $bff8 ; (sstack + 1)
49ee : a9 05 __ LDA #$05
49f0 : 85 18 __ STA P11 
49f2 : a9 0c __ LDA #$0c
49f4 : 8d f9 bf STA $bff9 ; (sstack + 2)
49f7 : a9 fb __ LDA #$fb
49f9 : 85 1b __ STA ACCU + 0 
49fb : a9 00 __ LDA #$00
49fd : 85 1c __ STA ACCU + 1 
49ff : 20 02 67 JSR $6702 ; (malloc + 0)
4a02 : a5 1b __ LDA ACCU + 0 
4a04 : 85 53 __ STA T0 + 0 
4a06 : a5 1c __ LDA ACCU + 1 
4a08 : 85 54 __ STA T0 + 1 
4a0a : ad 61 6e LDA $6e61 ; (vdc_state + 5)
4a0d : 85 55 __ STA T1 + 0 
4a0f : ad 62 6e LDA $6e62 ; (vdc_state + 6)
4a12 : 4a __ __ LSR
4a13 : 66 55 __ ROR T1 + 0 
4a15 : 38 __ __ SEC
4a16 : a5 55 __ LDA T1 + 0 
4a18 : e9 06 __ SBC #$06
4a1a : 8d f7 bf STA $bff7 ; (sstack + 0)
4a1d : 20 1f 32 JSR $321f ; (vdcwin_win_new.s1000 + 0)
4a20 : ad 49 6e LDA $6e49 ; (winCfg + 5)
4a23 : 85 1b __ STA ACCU + 0 
4a25 : a9 01 __ LDA #$01
4a27 : 85 14 __ STA P7 
4a29 : a9 00 __ LDA #$00
4a2b : 85 13 __ STA P6 
4a2d : 85 1c __ STA ACCU + 1 
4a2f : a9 0d __ LDA #$0d
4a31 : 20 3e 65 JSR $653e ; (mul16by8 + 0)
4a34 : 18 __ __ CLC
4a35 : a9 bc __ LDA #$bc
4a37 : 65 05 __ ADC WORK + 2 
4a39 : 85 11 __ STA P4 
4a3b : a9 6e __ LDA #$6e
4a3d : 69 00 __ ADC #$00
4a3f : 85 12 __ STA P5 
4a41 : a9 aa __ LDA #$aa
4a43 : 85 15 __ STA P8 
4a45 : a9 4b __ LDA #$4b
4a47 : 85 16 __ STA P9 
4a49 : 20 f9 46 JSR $46f9 ; (vdcwin_putat_string.s0 + 0)
4a4c : a9 0a __ LDA #$0a
4a4e : 85 18 __ STA P11 
4a50 : a9 32 __ LDA #$32
4a52 : 8d f8 bf STA $bff8 ; (sstack + 1)
4a55 : a9 05 __ LDA #$05
4a57 : 8d f9 bf STA $bff9 ; (sstack + 2)
4a5a : 38 __ __ SEC
4a5b : a5 55 __ LDA T1 + 0 
4a5d : e9 03 __ SBC #$03
4a5f : 8d f7 bf STA $bff7 ; (sstack + 0)
4a62 : 20 1f 32 JSR $321f ; (vdcwin_win_new.s1000 + 0)
4a65 : ad 49 6e LDA $6e49 ; (winCfg + 5)
4a68 : 85 1b __ STA ACCU + 0 
4a6a : a9 00 __ LDA #$00
4a6c : 85 1c __ STA ACCU + 1 
4a6e : a9 0d __ LDA #$0d
4a70 : 20 3e 65 JSR $653e ; (mul16by8 + 0)
4a73 : 18 __ __ CLC
4a74 : a9 bc __ LDA #$bc
4a76 : 65 05 __ ADC WORK + 2 
4a78 : 8d f8 bf STA $bff8 ; (sstack + 1)
4a7b : a9 6e __ LDA #$6e
4a7d : 69 00 __ ADC #$00
4a7f : 8d f9 bf STA $bff9 ; (sstack + 2)
4a82 : 20 d8 4b JSR $4bd8 ; (vdcwin_edit.s1000 + 0)
4a85 : a5 53 __ LDA T0 + 0 
4a87 : 85 12 __ STA P5 
4a89 : a5 54 __ LDA T0 + 1 
4a8b : 85 13 __ STA P6 
4a8d : ad 49 6e LDA $6e49 ; (winCfg + 5)
4a90 : 85 1b __ STA ACCU + 0 
4a92 : a9 00 __ LDA #$00
4a94 : 85 1c __ STA ACCU + 1 
4a96 : a9 0d __ LDA #$0d
4a98 : 20 3e 65 JSR $653e ; (mul16by8 + 0)
4a9b : 18 __ __ CLC
4a9c : a9 bc __ LDA #$bc
4a9e : 65 05 __ ADC WORK + 2 
4aa0 : 85 10 __ STA P3 
4aa2 : a9 6e __ LDA #$6e
4aa4 : 69 00 __ ADC #$00
4aa6 : 85 11 __ STA P4 
4aa8 : 20 ba 52 JSR $52ba ; (vdcwin_get_rect.s0 + 0)
4aab : 20 28 37 JSR $3728 ; (vdcwin_win_free.s0 + 0)
4aae : a9 20 __ LDA #$20
4ab0 : 85 11 __ STA P4 
4ab2 : ae 49 6e LDX $6e49 ; (winCfg + 5)
4ab5 : bd fc 40 LDA $40fc,x ; (__multab13L + 0)
4ab8 : 85 55 __ STA T1 + 0 
4aba : 18 __ __ CLC
4abb : 69 bc __ ADC #$bc
4abd : 85 56 __ STA T2 + 0 
4abf : a9 6e __ LDA #$6e
4ac1 : 69 00 __ ADC #$00
4ac3 : 85 57 __ STA T2 + 1 
4ac5 : bc fc 40 LDY $40fc,x ; (__multab13L + 0)
4ac8 : b9 bc 6e LDA $6ebc,y ; (linebuffer + 71)
4acb : 85 0f __ STA P2 
4acd : a6 55 __ LDX T1 + 0 
4acf : bd bd 6e LDA $6ebd,x ; (linebuffer + 72)
4ad2 : 85 14 __ STA P7 
4ad4 : bd be 6e LDA $6ebe,x ; (linebuffer + 73)
4ad7 : 85 13 __ STA P6 
4ad9 : bd bf 6e LDA $6ebf,x ; (linebuffer + 74)
4adc : 85 15 __ STA P8 
4ade : 20 92 2b JSR $2b92 ; (vdc_clear.s0 + 0)
4ae1 : a5 56 __ LDA T2 + 0 
4ae3 : 85 11 __ STA P4 
4ae5 : a5 57 __ LDA T2 + 1 
4ae7 : 85 12 __ STA P5 
4ae9 : a9 00 __ LDA #$00
4aeb : 85 13 __ STA P6 
4aed : a9 53 __ LDA #$53
4aef : 85 16 __ STA P9 
4af1 : a9 01 __ LDA #$01
4af3 : 85 14 __ STA P7 
4af5 : a9 49 __ LDA #$49
4af7 : 85 15 __ STA P8 
4af9 : 20 f9 46 JSR $46f9 ; (vdcwin_putat_string.s0 + 0)
4afc : a5 11 __ LDA P4 
4afe : 8d fa bf STA $bffa ; (sstack + 3)
4b01 : a5 12 __ LDA P5 
4b03 : 8d fb bf STA $bffb ; (sstack + 4)
4b06 : a5 53 __ LDA T0 + 0 
4b08 : 8d fc bf STA $bffc ; (sstack + 5)
4b0b : a5 54 __ LDA T0 + 1 
4b0d : 8d fd bf STA $bffd ; (sstack + 6)
4b10 : a9 00 __ LDA #$00
4b12 : a6 55 __ LDX T1 + 0 
4b14 : 9d c0 6e STA $6ec0,x ; (linebuffer + 75)
4b17 : a9 03 __ LDA #$03
4b19 : 9d c1 6e STA $6ec1,x ; (linebuffer + 76)
4b1c : 20 52 44 JSR $4452 ; (vdcwin_printwrap.s1000 + 0)
4b1f : ad 49 6e LDA $6e49 ; (winCfg + 5)
4b22 : 85 1b __ STA ACCU + 0 
4b24 : a9 00 __ LDA #$00
4b26 : 85 1c __ STA ACCU + 1 
4b28 : a9 0d __ LDA #$0d
4b2a : 20 3e 65 JSR $653e ; (mul16by8 + 0)
4b2d : 18 __ __ CLC
4b2e : a9 bc __ LDA #$bc
4b30 : 65 05 __ ADC WORK + 2 
4b32 : a0 02 __ LDY #$02
4b34 : 91 23 __ STA (SP + 0),y 
4b36 : a9 6e __ LDA #$6e
4b38 : 69 00 __ ADC #$00
4b3a : c8 __ __ INY
4b3b : 91 23 __ STA (SP + 0),y 
4b3d : a9 fd __ LDA #$fd
4b3f : c8 __ __ INY
4b40 : 91 23 __ STA (SP + 0),y 
4b42 : a9 36 __ LDA #$36
4b44 : c8 __ __ INY
4b45 : 91 23 __ STA (SP + 0),y 
4b47 : 20 d6 45 JSR $45d6 ; (vdcwin_printline.s1000 + 0)
4b4a : ae 49 6e LDX $6e49 ; (winCfg + 5)
4b4d : bd fc 40 LDA $40fc,x ; (__multab13L + 0)
4b50 : 18 __ __ CLC
4b51 : 69 bc __ ADC #$bc
4b53 : a0 02 __ LDY #$02
4b55 : 91 23 __ STA (SP + 0),y 
4b57 : a9 6e __ LDA #$6e
4b59 : 69 00 __ ADC #$00
4b5b : c8 __ __ INY
4b5c : 91 23 __ STA (SP + 0),y 
4b5e : a9 0f __ LDA #$0f
4b60 : c8 __ __ INY
4b61 : 91 23 __ STA (SP + 0),y 
4b63 : a9 37 __ LDA #$37
4b65 : c8 __ __ INY
4b66 : 91 23 __ STA (SP + 0),y 
4b68 : bc fc 40 LDY $40fc,x ; (__multab13L + 0)
4b6b : b9 c1 6e LDA $6ec1,y ; (linebuffer + 76)
4b6e : 18 __ __ CLC
4b6f : 69 01 __ ADC #$01
4b71 : b0 0d __ BCS $4b80 ; (windows_textinput.s4 + 0)
.s1002:
4b73 : d9 bf 6e CMP $6ebf,y ; (linebuffer + 74)
4b76 : b0 08 __ BCS $4b80 ; (windows_textinput.s4 + 0)
.s5:
4b78 : be c1 6e LDX $6ec1,y ; (linebuffer + 76)
4b7b : e8 __ __ INX
4b7c : 8a __ __ TXA
4b7d : 99 c1 6e STA $6ec1,y ; (linebuffer + 76)
.s4:
4b80 : 20 7e 46 JSR $467e ; (vdcwin_put_string.s1000 + 0)
4b83 : 20 b6 2c JSR $2cb6 ; (getch.s0 + 0)
4b86 : 20 28 37 JSR $3728 ; (vdcwin_win_free.s0 + 0)
4b89 : a5 53 __ LDA T0 + 0 
4b8b : 85 1b __ STA ACCU + 0 
4b8d : a5 54 __ LDA T0 + 1 
4b8f : 85 1c __ STA ACCU + 1 
4b91 : 20 c1 67 JSR $67c1 ; (free + 0)
.s1001:
4b94 : 18 __ __ CLC
4b95 : a5 23 __ LDA SP + 0 
4b97 : 69 06 __ ADC #$06
4b99 : 85 23 __ STA SP + 0 
4b9b : 90 02 __ BCC $4b9f ; (windows_textinput.s1001 + 11)
4b9d : e6 24 __ INC SP + 1 
4b9f : a2 04 __ LDX #$04
4ba1 : bd 8a bf LDA $bf8a,x ; (bigfont + 111)
4ba4 : 95 53 __ STA T0 + 0,x 
4ba6 : ca __ __ DEX
4ba7 : 10 f8 __ BPL $4ba1 ; (windows_textinput.s1001 + 13)
4ba9 : 60 __ __ RTS
--------------------------------------------------------------------
4baa : __ __ __ BYT 74 52 59 20 54 45 58 54 20 45 4e 54 52 59 20 49 : tRY TEXT ENTRY I
4bba : __ __ __ BYT 4e 20 57 49 4e 44 4f 57 2c 20 41 43 43 45 50 54 : N WINDOW, ACCEPT
4bca : __ __ __ BYT 20 57 49 54 48 20 72 65 74 75 72 6e 2e 00       :  WITH return..
--------------------------------------------------------------------
vdcwin_edit: ; vdcwin_edit(struct VDCWin*)->void
.s1000:
4bd8 : a5 53 __ LDA T0 + 0 
4bda : 8d eb bf STA $bfeb ; (vp_fill + 26)
4bdd : a5 54 __ LDA T0 + 1 
4bdf : 8d ec bf STA $bfec ; (vp_fill + 27)
4be2 : a5 55 __ LDA T1 + 0 
4be4 : 8d ed bf STA $bfed ; (vp_fill + 28)
.s0:
4be7 : ad f8 bf LDA $bff8 ; (sstack + 1)
4bea : 85 53 __ STA T0 + 0 
4bec : ad f9 bf LDA $bff9 ; (sstack + 2)
4bef : 85 54 __ STA T0 + 1 
.l2:
4bf1 : a5 53 __ LDA T0 + 0 
4bf3 : 85 0d __ STA P0 
4bf5 : a5 54 __ LDA T0 + 1 
4bf7 : 85 0e __ STA P1 
4bf9 : a9 01 __ LDA #$01
4bfb : 85 0f __ STA P2 
4bfd : 20 44 4d JSR $4d44 ; (vdcwin_cursor_show.s0 + 0)
4c00 : c6 0f __ DEC P2 
4c02 : 20 1a 37 JSR $371a ; (vdcwin_getch.s0 + 0)
4c05 : a5 1b __ LDA ACCU + 0 ; (win + 1)
4c07 : 85 55 __ STA T1 + 0 
4c09 : 20 44 4d JSR $4d44 ; (vdcwin_cursor_show.s0 + 0)
4c0c : a5 55 __ LDA T1 + 0 
4c0e : c9 14 __ CMP #$14
4c10 : d0 15 __ BNE $4c27 ; (vdcwin_edit.s57 + 0)
.s41:
4c12 : 20 ed 4d JSR $4ded ; (vdcwin_cursor_backward.s0 + 0)
4c15 : 09 00 __ ORA #$00
4c17 : f0 d8 __ BEQ $4bf1 ; (vdcwin_edit.l2 + 0)
.s42:
4c19 : a5 0d __ LDA P0 
4c1b : 85 15 __ STA P8 
4c1d : a5 0e __ LDA P1 
4c1f : 85 16 __ STA P9 
4c21 : 20 12 4e JSR $4e12 ; (vdcwin_delete_char.s0 + 0)
4c24 : 4c f1 4b JMP $4bf1 ; (vdcwin_edit.l2 + 0)
.s57:
4c27 : b0 03 __ BCS $4c2c ; (vdcwin_edit.s58 + 0)
4c29 : 4c 06 4d JMP $4d06 ; (vdcwin_edit.s59 + 0)
.s58:
4c2c : c9 93 __ CMP #$93
4c2e : d0 1f __ BNE $4c4f ; (vdcwin_edit.s66 + 0)
.s12:
4c30 : a9 20 __ LDA #$20
4c32 : 85 11 __ STA P4 
4c34 : a0 00 __ LDY #$00
4c36 : b1 0d __ LDA (P0),y 
4c38 : 85 0f __ STA P2 
4c3a : c8 __ __ INY
4c3b : b1 0d __ LDA (P0),y 
4c3d : 85 14 __ STA P7 
4c3f : c8 __ __ INY
4c40 : b1 0d __ LDA (P0),y 
4c42 : 85 13 __ STA P6 
4c44 : c8 __ __ INY
4c45 : b1 0d __ LDA (P0),y 
4c47 : 85 15 __ STA P8 
4c49 : 20 92 2b JSR $2b92 ; (vdc_clear.s0 + 0)
4c4c : 4c fa 4c JMP $4cfa ; (vdcwin_edit.s93 + 0)
.s66:
4c4f : 90 58 __ BCC $4ca9 ; (vdcwin_edit.s68 + 0)
.s67:
4c51 : c9 9d __ CMP #$9d
4c53 : d0 06 __ BNE $4c5b ; (vdcwin_edit.s46 + 0)
.s40:
4c55 : 20 ed 4d JSR $4ded ; (vdcwin_cursor_backward.s0 + 0)
4c58 : 4c f1 4b JMP $4bf1 ; (vdcwin_edit.l2 + 0)
.s46:
4c5b : c9 20 __ CMP #$20
4c5d : 90 92 __ BCC $4bf1 ; (vdcwin_edit.l2 + 0)
.s51:
4c5f : 09 00 __ ORA #$00
4c61 : 10 04 __ BPL $4c67 ; (vdcwin_edit.s47 + 0)
.s50:
4c63 : c9 a0 __ CMP #$a0
4c65 : 90 8a __ BCC $4bf1 ; (vdcwin_edit.l2 + 0)
.s47:
4c67 : a0 05 __ LDY #$05
4c69 : b1 0d __ LDA (P0),y 
4c6b : 18 __ __ CLC
4c6c : 69 01 __ ADC #$01
4c6e : b0 06 __ BCS $4c76 ; (vdcwin_edit.s55 + 0)
.s1004:
4c70 : a0 03 __ LDY #$03
4c72 : d1 0d __ CMP (P0),y 
4c74 : 90 15 __ BCC $4c8b ; (vdcwin_edit.s52 + 0)
.s55:
4c76 : a0 04 __ LDY #$04
4c78 : b1 0d __ LDA (P0),y 
4c7a : 18 __ __ CLC
4c7b : 69 01 __ ADC #$01
4c7d : 90 03 __ BCC $4c82 ; (vdcwin_edit.s1002 + 0)
4c7f : 4c f1 4b JMP $4bf1 ; (vdcwin_edit.l2 + 0)
.s1002:
4c82 : a0 02 __ LDY #$02
4c84 : d1 0d __ CMP (P0),y 
4c86 : 90 03 __ BCC $4c8b ; (vdcwin_edit.s52 + 0)
4c88 : 4c f1 4b JMP $4bf1 ; (vdcwin_edit.l2 + 0)
.s52:
4c8b : a5 0d __ LDA P0 
4c8d : 85 16 __ STA P9 
4c8f : a5 0e __ LDA P1 
4c91 : 85 17 __ STA P10 
4c93 : 20 d3 4f JSR $4fd3 ; (vdcwin_insert_char.s0 + 0)
4c96 : a5 53 __ LDA T0 + 0 
4c98 : 85 17 __ STA P10 
4c9a : a5 54 __ LDA T0 + 1 
4c9c : 85 18 __ STA P11 
4c9e : a5 55 __ LDA T1 + 0 
4ca0 : 8d f7 bf STA $bff7 ; (sstack + 0)
4ca3 : 20 37 49 JSR $4937 ; (vdcwin_put_char.s1000 + 0)
4ca6 : 4c f1 4b JMP $4bf1 ; (vdcwin_edit.l2 + 0)
.s68:
4ca9 : c9 1d __ CMP #$1d
4cab : f0 17 __ BEQ $4cc4 ; (vdcwin_edit.s29 + 0)
.s69:
4cad : c9 91 __ CMP #$91
4caf : d0 aa __ BNE $4c5b ; (vdcwin_edit.s46 + 0)
.s22:
4cb1 : a0 05 __ LDY #$05
4cb3 : b1 0d __ LDA (P0),y 
4cb5 : d0 03 __ BNE $4cba ; (vdcwin_edit.s24 + 0)
4cb7 : 4c f1 4b JMP $4bf1 ; (vdcwin_edit.l2 + 0)
.s24:
4cba : aa __ __ TAX
4cbb : ca __ __ DEX
.s94:
4cbc : 8a __ __ TXA
4cbd : a0 05 __ LDY #$05
.s1042:
4cbf : 91 0d __ STA (P0),y 
4cc1 : 4c f1 4b JMP $4bf1 ; (vdcwin_edit.l2 + 0)
.s29:
4cc4 : a0 02 __ LDY #$02
4cc6 : b1 0d __ LDA (P0),y 
4cc8 : 85 55 __ STA T1 + 0 
4cca : a0 04 __ LDY #$04
4ccc : b1 0d __ LDA (P0),y 
4cce : aa __ __ TAX
4ccf : 18 __ __ CLC
4cd0 : 69 01 __ ADC #$01
4cd2 : b0 08 __ BCS $4cdc ; (vdcwin_edit.s32 + 0)
.s1018:
4cd4 : c5 55 __ CMP T1 + 0 
4cd6 : b0 04 __ BCS $4cdc ; (vdcwin_edit.s32 + 0)
.s31:
4cd8 : e8 __ __ INX
4cd9 : 8a __ __ TXA
4cda : 90 e3 __ BCC $4cbf ; (vdcwin_edit.s1042 + 0)
.s32:
4cdc : a0 05 __ LDY #$05
4cde : b1 0d __ LDA (P0),y 
4ce0 : aa __ __ TAX
4ce1 : 18 __ __ CLC
4ce2 : 69 01 __ ADC #$01
4ce4 : 90 03 __ BCC $4ce9 ; (vdcwin_edit.s1016 + 0)
4ce6 : 4c f1 4b JMP $4bf1 ; (vdcwin_edit.l2 + 0)
.s1016:
4ce9 : a0 03 __ LDY #$03
4ceb : d1 0d __ CMP (P0),y 
4ced : 90 03 __ BCC $4cf2 ; (vdcwin_edit.s35 + 0)
4cef : 4c f1 4b JMP $4bf1 ; (vdcwin_edit.l2 + 0)
.s35:
4cf2 : a9 00 __ LDA #$00
4cf4 : c8 __ __ INY
4cf5 : 91 0d __ STA (P0),y 
.s95:
4cf7 : e8 __ __ INX
4cf8 : 90 c2 __ BCC $4cbc ; (vdcwin_edit.s94 + 0)
.s93:
4cfa : a9 00 __ LDA #$00
4cfc : a0 04 __ LDY #$04
4cfe : 91 53 __ STA (T0 + 0),y 
4d00 : c8 __ __ INY
4d01 : 91 53 __ STA (T0 + 0),y 
4d03 : 4c f1 4b JMP $4bf1 ; (vdcwin_edit.l2 + 0)
.s59:
4d06 : c9 11 __ CMP #$11
4d08 : d0 16 __ BNE $4d20 ; (vdcwin_edit.s60 + 0)
.s15:
4d0a : a0 05 __ LDY #$05
4d0c : b1 0d __ LDA (P0),y 
4d0e : aa __ __ TAX
4d0f : 18 __ __ CLC
4d10 : 69 01 __ ADC #$01
4d12 : 90 03 __ BCC $4d17 ; (vdcwin_edit.s1034 + 0)
4d14 : 4c f1 4b JMP $4bf1 ; (vdcwin_edit.l2 + 0)
.s1034:
4d17 : a0 03 __ LDY #$03
4d19 : d1 0d __ CMP (P0),y 
4d1b : 90 da __ BCC $4cf7 ; (vdcwin_edit.s95 + 0)
4d1d : 4c f1 4b JMP $4bf1 ; (vdcwin_edit.l2 + 0)
.s60:
4d20 : 90 07 __ BCC $4d29 ; (vdcwin_edit.s62 + 0)
.s61:
4d22 : c9 13 __ CMP #$13
4d24 : f0 d4 __ BEQ $4cfa ; (vdcwin_edit.s93 + 0)
4d26 : 4c 5b 4c JMP $4c5b ; (vdcwin_edit.s46 + 0)
.s62:
4d29 : c9 03 __ CMP #$03
4d2b : f0 07 __ BEQ $4d34 ; (vdcwin_edit.s1001 + 0)
.s63:
4d2d : c9 0d __ CMP #$0d
4d2f : f0 03 __ BEQ $4d34 ; (vdcwin_edit.s1001 + 0)
4d31 : 4c 5b 4c JMP $4c5b ; (vdcwin_edit.s46 + 0)
.s1001:
4d34 : ad eb bf LDA $bfeb ; (vp_fill + 26)
4d37 : 85 53 __ STA T0 + 0 
4d39 : ad ec bf LDA $bfec ; (vp_fill + 27)
4d3c : 85 54 __ STA T0 + 1 
4d3e : ad ed bf LDA $bfed ; (vp_fill + 28)
4d41 : 85 55 __ STA T1 + 0 
4d43 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_cursor_show: ; vdcwin_cursor_show(struct VDCWin*,bool)->void
.s0:
4d44 : a0 01 __ LDY #$01
4d46 : b1 0d __ LDA (P0),y ; (win + 0)
4d48 : 18 __ __ CLC
4d49 : a0 05 __ LDY #$05
4d4b : 71 0d __ ADC (P0),y ; (win + 0)
4d4d : 0a __ __ ASL
4d4e : aa __ __ TAX
4d4f : 18 __ __ CLC
4d50 : 88 __ __ DEY
4d51 : b1 0d __ LDA (P0),y ; (win + 0)
4d53 : a0 00 __ LDY #$00
4d55 : 71 0d __ ADC (P0),y ; (win + 0)
4d57 : 18 __ __ CLC
4d58 : 7d 00 70 ADC $7000,x ; (multab + 0)
4d5b : a8 __ __ TAY
4d5c : a9 00 __ LDA #$00
4d5e : 7d 01 70 ADC $7001,x ; (multab + 1)
4d61 : a2 12 __ LDX #$12
4d63 : 8e 00 d6 STX $d600 
4d66 : aa __ __ TAX
4d67 : 98 __ __ TYA
4d68 : 18 __ __ CLC
4d69 : 6d 66 6e ADC $6e66 ; (vdc_state + 10)
4d6c : a8 __ __ TAY
4d6d : 8a __ __ TXA
4d6e : 6d 67 6e ADC $6e67 ; (vdc_state + 11)
4d71 : aa __ __ TAX
4d72 : a5 0f __ LDA P2 ; (show + 0)
4d74 : d0 50 __ BNE $4dc6 ; (vdcwin_cursor_show.l1026 + 0)
.l1027:
4d76 : 2c 00 d6 BIT $d600 
4d79 : 10 fb __ BPL $4d76 ; (vdcwin_cursor_show.l1027 + 0)
.s47:
4d7b : 8e 01 d6 STX $d601 
4d7e : a9 13 __ LDA #$13
4d80 : 8d 00 d6 STA $d600 
.l351:
4d83 : 2c 00 d6 BIT $d600 
4d86 : 10 fb __ BPL $4d83 ; (vdcwin_cursor_show.l351 + 0)
.s52:
4d88 : 8c 01 d6 STY $d601 
4d8b : a9 1f __ LDA #$1f
4d8d : 8d 00 d6 STA $d600 
.l353:
4d90 : 2c 00 d6 BIT $d600 
4d93 : 10 fb __ BPL $4d90 ; (vdcwin_cursor_show.l353 + 0)
.s56:
4d95 : ad 01 d6 LDA $d601 
4d98 : 29 bf __ AND #$bf
.s1030:
4d9a : 85 1b __ STA ACCU + 0 
4d9c : a9 12 __ LDA #$12
4d9e : 8d 00 d6 STA $d600 
.l344:
4da1 : 2c 00 d6 BIT $d600 
4da4 : 10 fb __ BPL $4da1 ; (vdcwin_cursor_show.l344 + 0)
.s1029:
4da6 : 8e 01 d6 STX $d601 
4da9 : a9 13 __ LDA #$13
4dab : 8d 00 d6 STA $d600 
.l346:
4dae : 2c 00 d6 BIT $d600 
4db1 : 10 fb __ BPL $4dae ; (vdcwin_cursor_show.l346 + 0)
.s1028:
4db3 : 8c 01 d6 STY $d601 
4db6 : a9 1f __ LDA #$1f
4db8 : 8d 00 d6 STA $d600 
.l348:
4dbb : 2c 00 d6 BIT $d600 
4dbe : 10 fb __ BPL $4dbb ; (vdcwin_cursor_show.l348 + 0)
.s560:
4dc0 : a5 1b __ LDA ACCU + 0 
4dc2 : 8d 01 d6 STA $d601 
.s1001:
4dc5 : 60 __ __ RTS
.l1026:
4dc6 : 2c 00 d6 BIT $d600 
4dc9 : 10 fb __ BPL $4dc6 ; (vdcwin_cursor_show.l1026 + 0)
.s13:
4dcb : 8e 01 d6 STX $d601 
4dce : a9 13 __ LDA #$13
4dd0 : 8d 00 d6 STA $d600 
.l340:
4dd3 : 2c 00 d6 BIT $d600 
4dd6 : 10 fb __ BPL $4dd3 ; (vdcwin_cursor_show.l340 + 0)
.s18:
4dd8 : 8c 01 d6 STY $d601 
4ddb : a9 1f __ LDA #$1f
4ddd : 8d 00 d6 STA $d600 
.l342:
4de0 : 2c 00 d6 BIT $d600 
4de3 : 10 fb __ BPL $4de0 ; (vdcwin_cursor_show.l342 + 0)
.s22:
4de5 : ad 01 d6 LDA $d601 
4de8 : 09 40 __ ORA #$40
4dea : 4c 9a 4d JMP $4d9a ; (vdcwin_cursor_show.s1030 + 0)
--------------------------------------------------------------------
vdcwin_cursor_backward: ; vdcwin_cursor_backward(struct VDCWin*)->bool
.s0:
4ded : a0 04 __ LDY #$04
4def : b1 0d __ LDA (P0),y ; (win + 0)
4df1 : f0 06 __ BEQ $4df9 ; (vdcwin_cursor_backward.s2 + 0)
.s1:
4df3 : 38 __ __ SEC
4df4 : e9 01 __ SBC #$01
4df6 : 4c 0d 4e JMP $4e0d ; (vdcwin_cursor_backward.s1003 + 0)
.s2:
4df9 : c8 __ __ INY
4dfa : b1 0d __ LDA (P0),y ; (win + 0)
4dfc : f0 13 __ BEQ $4e11 ; (vdcwin_cursor_backward.s1001 + 0)
.s5:
4dfe : aa __ __ TAX
4dff : 38 __ __ SEC
4e00 : a0 02 __ LDY #$02
4e02 : b1 0d __ LDA (P0),y ; (win + 0)
4e04 : e9 01 __ SBC #$01
4e06 : a0 04 __ LDY #$04
4e08 : 91 0d __ STA (P0),y ; (win + 0)
4e0a : ca __ __ DEX
4e0b : 8a __ __ TXA
4e0c : c8 __ __ INY
.s1003:
4e0d : 91 0d __ STA (P0),y ; (win + 0)
4e0f : a9 01 __ LDA #$01
.s1001:
4e11 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_delete_char: ; vdcwin_delete_char(struct VDCWin*)->void
.s0:
4e12 : a0 05 __ LDY #$05
4e14 : b1 15 __ LDA (P8),y ; (win + 0)
4e16 : 85 46 __ STA T2 + 0 
4e18 : 0a __ __ ASL
4e19 : aa __ __ TAX
4e1a : bd 00 70 LDA $7000,x ; (multab + 0)
4e1d : 85 47 __ STA T3 + 0 
4e1f : 18 __ __ CLC
4e20 : c8 __ __ INY
4e21 : 71 15 __ ADC (P8),y ; (win + 0)
4e23 : 85 49 __ STA T4 + 0 
4e25 : bd 01 70 LDA $7001,x ; (multab + 1)
4e28 : 85 48 __ STA T3 + 1 
4e2a : c8 __ __ INY
4e2b : 71 15 __ ADC (P8),y ; (win + 0)
4e2d : 85 4a __ STA T4 + 1 
4e2f : a0 04 __ LDY #$04
4e31 : b1 15 __ LDA (P8),y ; (win + 0)
4e33 : 85 4b __ STA T5 + 0 
4e35 : 18 __ __ CLC
4e36 : 65 49 __ ADC T4 + 0 
4e38 : 85 0f __ STA P2 
4e3a : a9 00 __ LDA #$00
4e3c : 85 14 __ STA P7 
4e3e : 65 4a __ ADC T4 + 1 
4e40 : 85 10 __ STA P3 
4e42 : 18 __ __ CLC
4e43 : a5 0f __ LDA P2 
4e45 : 69 01 __ ADC #$01
4e47 : 85 11 __ STA P4 
4e49 : a5 10 __ LDA P3 
4e4b : 69 00 __ ADC #$00
4e4d : 85 12 __ STA P5 
4e4f : a0 02 __ LDY #$02
4e51 : b1 15 __ LDA (P8),y ; (win + 0)
4e53 : 38 __ __ SEC
4e54 : e9 01 __ SBC #$01
4e56 : 85 4c __ STA T6 + 0 
4e58 : 38 __ __ SEC
4e59 : e5 4b __ SBC T5 + 0 
4e5b : 85 13 __ STA P6 
4e5d : a0 08 __ LDY #$08
4e5f : b1 15 __ LDA (P8),y ; (win + 0)
4e61 : 85 4f __ STA T8 + 0 
4e63 : c8 __ __ INY
4e64 : b1 15 __ LDA (P8),y ; (win + 0)
4e66 : 85 50 __ STA T8 + 1 
4e68 : 20 ba 47 JSR $47ba ; (vdc_block_copy.s0 + 0)
4e6b : 18 __ __ CLC
4e6c : a5 4f __ LDA T8 + 0 
4e6e : 65 47 __ ADC T3 + 0 
4e70 : 85 47 __ STA T3 + 0 
4e72 : a5 50 __ LDA T8 + 1 
4e74 : 65 48 __ ADC T3 + 1 
4e76 : 85 48 __ STA T3 + 1 
4e78 : 18 __ __ CLC
4e79 : a5 47 __ LDA T3 + 0 
4e7b : 65 4b __ ADC T5 + 0 
4e7d : 85 0f __ STA P2 
4e7f : a5 48 __ LDA T3 + 1 
4e81 : 69 00 __ ADC #$00
4e83 : 85 10 __ STA P3 
4e85 : 18 __ __ CLC
4e86 : a5 0f __ LDA P2 
4e88 : 69 01 __ ADC #$01
4e8a : 85 11 __ STA P4 
4e8c : a5 10 __ LDA P3 
.l6:
4e8e : 69 00 __ ADC #$00
4e90 : 85 12 __ STA P5 
4e92 : 20 ba 47 JSR $47ba ; (vdc_block_copy.s0 + 0)
4e95 : e6 46 __ INC T2 + 0 
4e97 : 18 __ __ CLC
4e98 : a5 4c __ LDA T6 + 0 
4e9a : 65 49 __ ADC T4 + 0 
4e9c : aa __ __ TAX
4e9d : a9 00 __ LDA #$00
4e9f : 65 4a __ ADC T4 + 1 
4ea1 : 85 4e __ STA T7 + 1 
4ea3 : a5 46 __ LDA T2 + 0 
4ea5 : a0 03 __ LDY #$03
4ea7 : d1 15 __ CMP (P8),y ; (win + 0)
4ea9 : a9 12 __ LDA #$12
4eab : 8d 00 d6 STA $d600 
4eae : 90 27 __ BCC $4ed7 ; (vdcwin_delete_char.s7 + 0)
.l461:
4eb0 : 2c 00 d6 BIT $d600 
4eb3 : 10 fb __ BPL $4eb0 ; (vdcwin_delete_char.l461 + 0)
.s84:
4eb5 : a5 4e __ LDA T7 + 1 
4eb7 : 8d 01 d6 STA $d601 
4eba : a9 13 __ LDA #$13
4ebc : 8d 00 d6 STA $d600 
.l463:
4ebf : 2c 00 d6 BIT $d600 
4ec2 : 10 fb __ BPL $4ebf ; (vdcwin_delete_char.l463 + 0)
.s89:
4ec4 : 8e 01 d6 STX $d601 
4ec7 : a9 1f __ LDA #$1f
4ec9 : 8d 00 d6 STA $d600 
.l465:
4ecc : 2c 00 d6 BIT $d600 
4ecf : 10 fb __ BPL $4ecc ; (vdcwin_delete_char.l465 + 0)
.s93:
4ed1 : a9 20 __ LDA #$20
4ed3 : 8d 01 d6 STA $d601 
.s1001:
4ed6 : 60 __ __ RTS
.s7:
4ed7 : a5 49 __ LDA T4 + 0 
4ed9 : 6d 5f 6e ADC $6e5f ; (vdc_state + 3)
4edc : a8 __ __ TAY
4edd : a5 4a __ LDA T4 + 1 
4edf : 6d 60 6e ADC $6e60 ; (vdc_state + 4)
4ee2 : 85 45 __ STA T9 + 1 
.l437:
4ee4 : 2c 00 d6 BIT $d600 
4ee7 : 10 fb __ BPL $4ee4 ; (vdcwin_delete_char.l437 + 0)
.s16:
4ee9 : 8d 01 d6 STA $d601 
4eec : a9 13 __ LDA #$13
4eee : 8d 00 d6 STA $d600 
.l439:
4ef1 : 2c 00 d6 BIT $d600 
4ef4 : 10 fb __ BPL $4ef1 ; (vdcwin_delete_char.l439 + 0)
.s21:
4ef6 : 8c 01 d6 STY $d601 
4ef9 : a9 1f __ LDA #$1f
4efb : 8d 00 d6 STA $d600 
.l441:
4efe : 2c 00 d6 BIT $d600 
4f01 : 10 fb __ BPL $4efe ; (vdcwin_delete_char.l441 + 0)
.s25:
4f03 : ad 01 d6 LDA $d601 
4f06 : 85 43 __ STA T1 + 0 
4f08 : a9 12 __ LDA #$12
4f0a : 8d 00 d6 STA $d600 
.l443:
4f0d : 2c 00 d6 BIT $d600 
4f10 : 10 fb __ BPL $4f0d ; (vdcwin_delete_char.l443 + 0)
.s33:
4f12 : a5 4e __ LDA T7 + 1 
4f14 : 8d 01 d6 STA $d601 
4f17 : a9 13 __ LDA #$13
4f19 : 8d 00 d6 STA $d600 
.l445:
4f1c : 2c 00 d6 BIT $d600 
4f1f : 10 fb __ BPL $4f1c ; (vdcwin_delete_char.l445 + 0)
.s38:
4f21 : 8e 01 d6 STX $d601 
4f24 : a9 1f __ LDA #$1f
4f26 : 8d 00 d6 STA $d600 
.l447:
4f29 : 2c 00 d6 BIT $d600 
4f2c : 10 fb __ BPL $4f29 ; (vdcwin_delete_char.l447 + 0)
.s42:
4f2e : a5 43 __ LDA T1 + 0 
4f30 : 8d 01 d6 STA $d601 
4f33 : a9 12 __ LDA #$12
4f35 : 8d 00 d6 STA $d600 
4f38 : 18 __ __ CLC
4f39 : a5 47 __ LDA T3 + 0 
4f3b : 65 4c __ ADC T6 + 0 
4f3d : aa __ __ TAX
4f3e : a5 48 __ LDA T3 + 1 
4f40 : 69 00 __ ADC #$00
4f42 : 85 4a __ STA T4 + 1 
4f44 : 18 __ __ CLC
4f45 : a5 47 __ LDA T3 + 0 
4f47 : 6d 5f 6e ADC $6e5f ; (vdc_state + 3)
4f4a : 85 4d __ STA T7 + 0 
4f4c : a5 48 __ LDA T3 + 1 
4f4e : 6d 60 6e ADC $6e60 ; (vdc_state + 4)
4f51 : 85 4e __ STA T7 + 1 
.l449:
4f53 : 2c 00 d6 BIT $d600 
4f56 : 10 fb __ BPL $4f53 ; (vdcwin_delete_char.l449 + 0)
.s50:
4f58 : 8d 01 d6 STA $d601 
4f5b : a9 13 __ LDA #$13
4f5d : 8d 00 d6 STA $d600 
.l451:
4f60 : 2c 00 d6 BIT $d600 
4f63 : 10 fb __ BPL $4f60 ; (vdcwin_delete_char.l451 + 0)
.s55:
4f65 : a5 4d __ LDA T7 + 0 
4f67 : 8d 01 d6 STA $d601 
4f6a : a9 1f __ LDA #$1f
4f6c : 8d 00 d6 STA $d600 
.l453:
4f6f : 2c 00 d6 BIT $d600 
4f72 : 10 fb __ BPL $4f6f ; (vdcwin_delete_char.l453 + 0)
.s59:
4f74 : ad 01 d6 LDA $d601 
4f77 : 85 43 __ STA T1 + 0 
4f79 : a9 12 __ LDA #$12
4f7b : 8d 00 d6 STA $d600 
.l455:
4f7e : 2c 00 d6 BIT $d600 
4f81 : 10 fb __ BPL $4f7e ; (vdcwin_delete_char.l455 + 0)
.s67:
4f83 : a5 4a __ LDA T4 + 1 
4f85 : 8d 01 d6 STA $d601 
4f88 : a9 13 __ LDA #$13
4f8a : 8d 00 d6 STA $d600 
.l457:
4f8d : 2c 00 d6 BIT $d600 
4f90 : 10 fb __ BPL $4f8d ; (vdcwin_delete_char.l457 + 0)
.s72:
4f92 : 8e 01 d6 STX $d601 
4f95 : a9 1f __ LDA #$1f
4f97 : 8d 00 d6 STA $d600 
.l459:
4f9a : 2c 00 d6 BIT $d600 
4f9d : 10 fb __ BPL $4f9a ; (vdcwin_delete_char.l459 + 0)
.s76:
4f9f : 84 0f __ STY P2 
4fa1 : 84 49 __ STY T4 + 0 
4fa3 : a5 43 __ LDA T1 + 0 
4fa5 : 8d 01 d6 STA $d601 
4fa8 : 98 __ __ TYA
4fa9 : 18 __ __ CLC
4faa : 69 01 __ ADC #$01
4fac : 85 11 __ STA P4 
4fae : a5 45 __ LDA T9 + 1 
4fb0 : 85 10 __ STA P3 
4fb2 : 85 4a __ STA T4 + 1 
4fb4 : a6 4c __ LDX T6 + 0 
4fb6 : 86 13 __ STX P6 
4fb8 : 69 00 __ ADC #$00
4fba : 85 12 __ STA P5 
4fbc : 20 76 68 JSR $6876 ; (vdc_block_copy@proxy + 0)
4fbf : a5 4d __ LDA T7 + 0 
4fc1 : 85 47 __ STA T3 + 0 
4fc3 : 85 0f __ STA P2 
4fc5 : 18 __ __ CLC
4fc6 : 69 01 __ ADC #$01
4fc8 : 85 11 __ STA P4 
4fca : a5 4e __ LDA T7 + 1 
4fcc : 85 48 __ STA T3 + 1 
4fce : 85 10 __ STA P3 
4fd0 : 4c 8e 4e JMP $4e8e ; (vdcwin_delete_char.l6 + 0)
--------------------------------------------------------------------
vdcwin_insert_char: ; vdcwin_insert_char(struct VDCWin*)->void
.s0:
4fd3 : a0 02 __ LDY #$02
4fd5 : b1 16 __ LDA (P9),y ; (win + 0)
4fd7 : 38 __ __ SEC
4fd8 : e9 01 __ SBC #$01
4fda : 85 46 __ STA T2 + 0 
4fdc : c8 __ __ INY
4fdd : b1 16 __ LDA (P9),y ; (win + 0)
4fdf : 38 __ __ SEC
4fe0 : e9 01 __ SBC #$01
4fe2 : 85 47 __ STA T3 + 0 
4fe4 : 0a __ __ ASL
4fe5 : aa __ __ TAX
4fe6 : a0 06 __ LDY #$06
4fe8 : b1 16 __ LDA (P9),y ; (win + 0)
4fea : 18 __ __ CLC
4feb : 7d 00 70 ADC $7000,x ; (multab + 0)
4fee : 85 4b __ STA T5 + 0 
4ff0 : c8 __ __ INY
4ff1 : b1 16 __ LDA (P9),y ; (win + 0)
4ff3 : 7d 01 70 ADC $7001,x ; (multab + 1)
4ff6 : 85 4c __ STA T5 + 1 
4ff8 : c8 __ __ INY
4ff9 : b1 16 __ LDA (P9),y ; (win + 0)
4ffb : 18 __ __ CLC
4ffc : 7d 00 70 ADC $7000,x ; (multab + 0)
4fff : 85 49 __ STA T4 + 0 
5001 : c8 __ __ INY
5002 : b1 16 __ LDA (P9),y ; (win + 0)
5004 : 7d 01 70 ADC $7001,x ; (multab + 1)
5007 : 85 4a __ STA T4 + 1 
5009 : 4c 11 50 JMP $5011 ; (vdcwin_insert_char.l5 + 0)
.s80:
500c : 8e 01 d6 STX $d601 
500f : c6 47 __ DEC T3 + 0 
.l5:
5011 : a0 05 __ LDY #$05
5013 : b1 16 __ LDA (P9),y ; (win + 0)
5015 : c5 47 __ CMP T3 + 0 
5017 : b0 03 __ BCS $501c ; (vdcwin_insert_char.s7 + 0)
5019 : 4c 13 51 JMP $5113 ; (vdcwin_insert_char.s6 + 0)
.s7:
501c : 88 __ __ DEY
501d : b1 16 __ LDA (P9),y ; (win + 0)
501f : 18 __ __ CLC
5020 : 65 4b __ ADC T5 + 0 
5022 : 85 47 __ STA T3 + 0 
5024 : a9 00 __ LDA #$00
5026 : 65 4c __ ADC T5 + 1 
5028 : 85 48 __ STA T3 + 1 
502a : 38 __ __ SEC
502b : a5 46 __ LDA T2 + 0 
502d : f1 16 __ SBC (P9),y ; (win + 0)
502f : d0 2e __ BNE $505f ; (vdcwin_insert_char.s81 + 0)
.s83:
5031 : a9 12 __ LDA #$12
5033 : 8d 00 d6 STA $d600 
.l476:
5036 : 2c 00 d6 BIT $d600 
5039 : 10 fb __ BPL $5036 ; (vdcwin_insert_char.l476 + 0)
.s95:
503b : a5 48 __ LDA T3 + 1 
503d : 8d 01 d6 STA $d601 
5040 : a9 13 __ LDA #$13
5042 : 8d 00 d6 STA $d600 
.l478:
5045 : 2c 00 d6 BIT $d600 
5048 : 10 fb __ BPL $5045 ; (vdcwin_insert_char.l478 + 0)
.s100:
504a : a5 47 __ LDA T3 + 0 
504c : 8d 01 d6 STA $d601 
504f : a9 1f __ LDA #$1f
5051 : 8d 00 d6 STA $d600 
.l480:
5054 : 2c 00 d6 BIT $d600 
5057 : 10 fb __ BPL $5054 ; (vdcwin_insert_char.l480 + 0)
.s104:
5059 : a9 20 __ LDA #$20
505b : 8d 01 d6 STA $d601 
.s1001:
505e : 60 __ __ RTS
.s81:
505f : 85 46 __ STA T2 + 0 
5061 : 85 13 __ STA P6 
5063 : 85 12 __ STA P5 
5065 : 18 __ __ CLC
5066 : a5 47 __ LDA T3 + 0 
5068 : 69 01 __ ADC #$01
506a : 85 4b __ STA T5 + 0 
506c : a5 48 __ LDA T3 + 1 
506e : 69 00 __ ADC #$00
5070 : 85 4c __ STA T5 + 1 
5072 : b1 16 __ LDA (P9),y ; (win + 0)
5074 : 18 __ __ CLC
5075 : 65 49 __ ADC T4 + 0 
5077 : 85 16 __ STA P9 ; (win + 0)
5079 : a9 00 __ LDA #$00
507b : 65 4a __ ADC T4 + 1 
507d : 85 17 __ STA P10 ; (win + 1)
507f : 18 __ __ CLC
5080 : a5 16 __ LDA P9 ; (win + 0)
5082 : 69 01 __ ADC #$01
5084 : 85 49 __ STA T4 + 0 
5086 : a5 17 __ LDA P10 ; (win + 1)
5088 : 69 00 __ ADC #$00
508a : 85 4a __ STA T4 + 1 
508c : ad 5d 6e LDA $6e5d ; (vdc_state + 1)
508f : d0 0e __ BNE $509f ; (vdcwin_insert_char.s86 + 0)
.s88:
5091 : a9 03 __ LDA #$03
5093 : cd 69 6e CMP $6e69 ; (vdc_state + 13)
5096 : d0 05 __ BNE $509d ; (vdcwin_insert_char.s1009 + 0)
.s1008:
5098 : a9 ff __ LDA #$ff
509a : cd 68 6e CMP $6e68 ; (vdc_state + 12)
.s1009:
509d : 90 3d __ BCC $50dc ; (vdcwin_insert_char.s85 + 0)
.s86:
509f : a5 47 __ LDA T3 + 0 
50a1 : 85 11 __ STA P4 
50a3 : a5 48 __ LDA T3 + 1 
50a5 : 85 12 __ STA P5 
50a7 : ad 68 6e LDA $6e68 ; (vdc_state + 12)
50aa : 85 4d __ STA T6 + 0 
50ac : 85 0f __ STA P2 
50ae : ad 69 6e LDA $6e69 ; (vdc_state + 13)
50b1 : 85 4e __ STA T6 + 1 
50b3 : 85 10 __ STA P3 
50b5 : 20 76 68 JSR $6876 ; (vdc_block_copy@proxy + 0)
50b8 : a5 4b __ LDA T5 + 0 
50ba : 85 0f __ STA P2 
50bc : a5 4c __ LDA T5 + 1 
50be : 85 10 __ STA P3 
50c0 : 20 93 68 JSR $6893 ; (vdc_block_copy@proxy + 0)
50c3 : a5 16 __ LDA P9 ; (win + 0)
50c5 : 85 11 __ STA P4 
50c7 : a5 17 __ LDA P10 ; (win + 1)
50c9 : 85 12 __ STA P5 
50cb : 20 9e 68 JSR $689e ; (vdc_block_copy@proxy + 0)
50ce : a5 49 __ LDA T4 + 0 
50d0 : 85 0f __ STA P2 
50d2 : a5 4a __ LDA T4 + 1 
50d4 : 85 10 __ STA P3 
50d6 : 20 93 68 JSR $6893 ; (vdc_block_copy@proxy + 0)
50d9 : 4c 31 50 JMP $5031 ; (vdcwin_insert_char.s83 + 0)
.s85:
50dc : a5 47 __ LDA T3 + 0 
50de : 85 10 __ STA P3 
50e0 : a5 48 __ LDA T3 + 1 
50e2 : 85 11 __ STA P4 
50e4 : 20 81 18 JSR $1881 ; (bnk_cpyfromvdc@proxy + 0)
50e7 : a5 4b __ LDA T5 + 0 
50e9 : 85 0f __ STA P2 
50eb : a5 4c __ LDA T5 + 1 
50ed : 85 10 __ STA P3 
50ef : a5 46 __ LDA T2 + 0 
50f1 : 85 14 __ STA P7 
50f3 : 20 1b 17 JSR $171b ; (bnk_cpytovdc@proxy + 0)
50f6 : a5 16 __ LDA P9 ; (win + 0)
50f8 : 85 10 __ STA P3 
50fa : a5 17 __ LDA P10 ; (win + 1)
50fc : 85 11 __ STA P4 
50fe : a5 14 __ LDA P7 
5100 : 85 12 __ STA P5 
5102 : 20 81 18 JSR $1881 ; (bnk_cpyfromvdc@proxy + 0)
5105 : a5 49 __ LDA T4 + 0 
5107 : 85 0f __ STA P2 
5109 : a5 4a __ LDA T4 + 1 
510b : 85 10 __ STA P3 
510d : 20 1b 17 JSR $171b ; (bnk_cpytovdc@proxy + 0)
5110 : 4c 31 50 JMP $5031 ; (vdcwin_insert_char.s83 + 0)
.s6:
5113 : a5 4b __ LDA T5 + 0 
5115 : 69 01 __ ADC #$01
5117 : 85 4d __ STA T6 + 0 
5119 : a5 4c __ LDA T5 + 1 
511b : 69 00 __ ADC #$00
511d : 85 4e __ STA T6 + 1 
511f : 18 __ __ CLC
5120 : a5 49 __ LDA T4 + 0 
5122 : 69 01 __ ADC #$01
5124 : 85 4f __ STA T7 + 0 
5126 : a5 4a __ LDA T4 + 1 
5128 : 69 00 __ ADC #$00
512a : 85 50 __ STA T7 + 1 
512c : ad 5d 6e LDA $6e5d ; (vdc_state + 1)
512f : d0 0e __ BNE $513f ; (vdcwin_insert_char.s10 + 0)
.s12:
5131 : a9 03 __ LDA #$03
5133 : cd 69 6e CMP $6e69 ; (vdc_state + 13)
5136 : d0 05 __ BNE $513d ; (vdcwin_insert_char.s1035 + 0)
.s1034:
5138 : a9 ff __ LDA #$ff
513a : cd 68 6e CMP $6e68 ; (vdc_state + 12)
.s1035:
513d : 90 51 __ BCC $5190 ; (vdcwin_insert_char.s9 + 0)
.s10:
513f : a5 4b __ LDA T5 + 0 
5141 : 85 11 __ STA P4 
5143 : a5 4c __ LDA T5 + 1 
5145 : 85 12 __ STA P5 
5147 : ad 68 6e LDA $6e68 ; (vdc_state + 12)
514a : 85 51 __ STA T8 + 0 
514c : 85 0f __ STA P2 
514e : ad 69 6e LDA $6e69 ; (vdc_state + 13)
5151 : 85 52 __ STA T8 + 1 
5153 : 85 10 __ STA P3 
5155 : a5 46 __ LDA T2 + 0 
5157 : 85 13 __ STA P6 
5159 : 20 76 68 JSR $6876 ; (vdc_block_copy@proxy + 0)
515c : a5 51 __ LDA T8 + 0 
515e : 85 11 __ STA P4 
5160 : a5 52 __ LDA T8 + 1 
5162 : 85 12 __ STA P5 
5164 : 20 9e 68 JSR $689e ; (vdc_block_copy@proxy + 0)
5167 : a5 51 __ LDA T8 + 0 
5169 : 85 0f __ STA P2 
516b : a5 52 __ LDA T8 + 1 
516d : 85 10 __ STA P3 
516f : a5 49 __ LDA T4 + 0 
5171 : 85 11 __ STA P4 
5173 : a5 4a __ LDA T4 + 1 
5175 : 85 12 __ STA P5 
5177 : 20 ba 47 JSR $47ba ; (vdc_block_copy.s0 + 0)
517a : a5 4f __ LDA T7 + 0 
517c : 85 0f __ STA P2 
517e : a5 50 __ LDA T7 + 1 
5180 : 85 10 __ STA P3 
5182 : a5 51 __ LDA T8 + 0 
5184 : 85 11 __ STA P4 
5186 : a5 52 __ LDA T8 + 1 
5188 : 85 12 __ STA P5 
518a : 20 ba 47 JSR $47ba ; (vdc_block_copy.s0 + 0)
518d : 4c c0 51 JMP $51c0 ; (vdcwin_insert_char.s8 + 0)
.s9:
5190 : a5 4b __ LDA T5 + 0 
5192 : 85 10 __ STA P3 
5194 : a5 4c __ LDA T5 + 1 
5196 : 85 11 __ STA P4 
5198 : 20 8d 16 JSR $168d ; (bnk_cpyfromvdc@proxy + 0)
519b : a5 4d __ LDA T6 + 0 
519d : 85 0f __ STA P2 
519f : a5 4e __ LDA T6 + 1 
51a1 : 85 10 __ STA P3 
51a3 : a5 12 __ LDA P5 
51a5 : 85 14 __ STA P7 
51a7 : 20 1b 17 JSR $171b ; (bnk_cpytovdc@proxy + 0)
51aa : a5 49 __ LDA T4 + 0 
51ac : 85 10 __ STA P3 
51ae : a5 4a __ LDA T4 + 1 
51b0 : 85 11 __ STA P4 
51b2 : 20 8d 16 JSR $168d ; (bnk_cpyfromvdc@proxy + 0)
51b5 : a5 4f __ LDA T7 + 0 
51b7 : 85 0f __ STA P2 
51b9 : a5 50 __ LDA T7 + 1 
51bb : 85 10 __ STA P3 
51bd : 20 1b 17 JSR $171b ; (bnk_cpytovdc@proxy + 0)
.s8:
51c0 : a9 12 __ LDA #$12
51c2 : 8d 00 d6 STA $d600 
51c5 : 38 __ __ SEC
51c6 : a5 4b __ LDA T5 + 0 
51c8 : ed 5f 6e SBC $6e5f ; (vdc_state + 3)
51cb : 85 4b __ STA T5 + 0 
51cd : a5 4c __ LDA T5 + 1 
51cf : ed 60 6e SBC $6e60 ; (vdc_state + 4)
51d2 : 85 4c __ STA T5 + 1 
51d4 : 18 __ __ CLC
51d5 : a5 4b __ LDA T5 + 0 
51d7 : 6d 5f 6e ADC $6e5f ; (vdc_state + 3)
51da : aa __ __ TAX
51db : a5 4c __ LDA T5 + 1 
51dd : 6d 60 6e ADC $6e60 ; (vdc_state + 4)
51e0 : a8 __ __ TAY
51e1 : 18 __ __ CLC
51e2 : a5 46 __ LDA T2 + 0 
51e4 : 65 4b __ ADC T5 + 0 
51e6 : 85 1b __ STA ACCU + 0 
51e8 : a9 00 __ LDA #$00
51ea : 65 4c __ ADC T5 + 1 
51ec : 85 44 __ STA T10 + 0 
51ee : 38 __ __ SEC
51ef : a5 49 __ LDA T4 + 0 
51f1 : ed 5f 6e SBC $6e5f ; (vdc_state + 3)
51f4 : 85 49 __ STA T4 + 0 
51f6 : a5 4a __ LDA T4 + 1 
51f8 : ed 60 6e SBC $6e60 ; (vdc_state + 4)
51fb : 85 4a __ STA T4 + 1 
.l449:
51fd : 2c 00 d6 BIT $d600 
5200 : 10 fb __ BPL $51fd ; (vdcwin_insert_char.l449 + 0)
.s20:
5202 : a5 44 __ LDA T10 + 0 
5204 : 8d 01 d6 STA $d601 
5207 : a9 13 __ LDA #$13
5209 : 8d 00 d6 STA $d600 
.l451:
520c : 2c 00 d6 BIT $d600 
520f : 10 fb __ BPL $520c ; (vdcwin_insert_char.l451 + 0)
.s25:
5211 : a5 1b __ LDA ACCU + 0 
5213 : 8d 01 d6 STA $d601 
5216 : a9 1f __ LDA #$1f
5218 : 8d 00 d6 STA $d600 
.l453:
521b : 2c 00 d6 BIT $d600 
521e : 10 fb __ BPL $521b ; (vdcwin_insert_char.l453 + 0)
.s29:
5220 : ad 01 d6 LDA $d601 
5223 : 85 43 __ STA T1 + 0 
5225 : a9 12 __ LDA #$12
5227 : 8d 00 d6 STA $d600 
.l455:
522a : 2c 00 d6 BIT $d600 
522d : 10 fb __ BPL $522a ; (vdcwin_insert_char.l455 + 0)
.s37:
522f : 8c 01 d6 STY $d601 
5232 : a9 13 __ LDA #$13
5234 : 8d 00 d6 STA $d600 
.l457:
5237 : 2c 00 d6 BIT $d600 
523a : 10 fb __ BPL $5237 ; (vdcwin_insert_char.l457 + 0)
.s42:
523c : 8e 01 d6 STX $d601 
523f : a9 1f __ LDA #$1f
5241 : 8d 00 d6 STA $d600 
.l459:
5244 : 2c 00 d6 BIT $d600 
5247 : 10 fb __ BPL $5244 ; (vdcwin_insert_char.l459 + 0)
.s46:
5249 : a5 43 __ LDA T1 + 0 
524b : 8d 01 d6 STA $d601 
524e : a9 12 __ LDA #$12
5250 : 8d 00 d6 STA $d600 
5253 : 18 __ __ CLC
5254 : a5 49 __ LDA T4 + 0 
5256 : 65 46 __ ADC T2 + 0 
5258 : aa __ __ TAX
5259 : a5 4a __ LDA T4 + 1 
525b : 69 00 __ ADC #$00
525d : a8 __ __ TAY
525e : 18 __ __ CLC
525f : a5 49 __ LDA T4 + 0 
5261 : 6d 5f 6e ADC $6e5f ; (vdc_state + 3)
5264 : 85 4d __ STA T6 + 0 
5266 : a5 4a __ LDA T4 + 1 
5268 : 6d 60 6e ADC $6e60 ; (vdc_state + 4)
526b : 85 4e __ STA T6 + 1 
.l461:
526d : 2c 00 d6 BIT $d600 
5270 : 10 fb __ BPL $526d ; (vdcwin_insert_char.l461 + 0)
.s54:
5272 : 8c 01 d6 STY $d601 
5275 : a9 13 __ LDA #$13
5277 : 8d 00 d6 STA $d600 
.l463:
527a : 2c 00 d6 BIT $d600 
527d : 10 fb __ BPL $527a ; (vdcwin_insert_char.l463 + 0)
.s59:
527f : 8e 01 d6 STX $d601 
5282 : a9 1f __ LDA #$1f
5284 : 8d 00 d6 STA $d600 
.l465:
5287 : 2c 00 d6 BIT $d600 
528a : 10 fb __ BPL $5287 ; (vdcwin_insert_char.l465 + 0)
.s63:
528c : a9 12 __ LDA #$12
528e : ae 01 d6 LDX $d601 
5291 : 8d 00 d6 STA $d600 
.l467:
5294 : 2c 00 d6 BIT $d600 
5297 : 10 fb __ BPL $5294 ; (vdcwin_insert_char.l467 + 0)
.s71:
5299 : a5 4e __ LDA T6 + 1 
529b : 8d 01 d6 STA $d601 
529e : a9 13 __ LDA #$13
52a0 : 8d 00 d6 STA $d600 
.l469:
52a3 : 2c 00 d6 BIT $d600 
52a6 : 10 fb __ BPL $52a3 ; (vdcwin_insert_char.l469 + 0)
.s76:
52a8 : a5 4d __ LDA T6 + 0 
52aa : 8d 01 d6 STA $d601 
52ad : a9 1f __ LDA #$1f
52af : 8d 00 d6 STA $d600 
.l471:
52b2 : 2c 00 d6 BIT $d600 
52b5 : 10 fb __ BPL $52b2 ; (vdcwin_insert_char.l471 + 0)
52b7 : 4c 0c 50 JMP $500c ; (vdcwin_insert_char.s80 + 0)
--------------------------------------------------------------------
vdcwin_get_rect: ; vdcwin_get_rect(struct VDCWin*,u8,u8,u8,u8,u8,u8*)->void
.s0:
52ba : a0 06 __ LDY #$06
52bc : b1 10 __ LDA (P3),y ; (win + 0)
52be : 18 __ __ CLC
52bf : 6d 00 70 ADC $7000 ; (multab + 0)
52c2 : 85 43 __ STA T0 + 0 
52c4 : c8 __ __ INY
52c5 : b1 10 __ LDA (P3),y ; (win + 0)
52c7 : 6d 01 70 ADC $7001 ; (multab + 1)
52ca : 85 44 __ STA T0 + 1 
52cc : a9 05 __ LDA #$05
52ce : 85 45 __ STA T2 + 0 
.l4:
52d0 : a9 00 __ LDA #$00
52d2 : 85 46 __ STA T3 + 0 
.l8:
52d4 : a9 12 __ LDA #$12
52d6 : 8d 00 d6 STA $d600 
52d9 : 18 __ __ CLC
52da : a5 12 __ LDA P5 ; (chars + 0)
52dc : 65 46 __ ADC T3 + 0 
52de : 85 0d __ STA P0 
52e0 : a5 13 __ LDA P6 ; (chars + 1)
52e2 : 69 00 __ ADC #$00
52e4 : 85 0e __ STA P1 
52e6 : 18 __ __ CLC
52e7 : a5 43 __ LDA T0 + 0 
52e9 : 65 46 __ ADC T3 + 0 
52eb : aa __ __ TAX
52ec : a5 44 __ LDA T0 + 1 
52ee : 69 00 __ ADC #$00
.l129:
52f0 : 2c 00 d6 BIT $d600 
52f3 : 10 fb __ BPL $52f0 ; (vdcwin_get_rect.l129 + 0)
.s18:
52f5 : 8d 01 d6 STA $d601 
52f8 : a9 13 __ LDA #$13
52fa : 8d 00 d6 STA $d600 
.l131:
52fd : 2c 00 d6 BIT $d600 
5300 : 10 fb __ BPL $52fd ; (vdcwin_get_rect.l131 + 0)
.s23:
5302 : 8e 01 d6 STX $d601 
5305 : a9 1f __ LDA #$1f
5307 : 8d 00 d6 STA $d600 
.l133:
530a : 2c 00 d6 BIT $d600 
530d : 10 fb __ BPL $530a ; (vdcwin_get_rect.l133 + 0)
.s27:
530f : ad 01 d6 LDA $d601 
5312 : a8 __ __ TAY
5313 : 4a __ __ LSR
5314 : 4a __ __ LSR
5315 : 4a __ __ LSR
5316 : 4a __ __ LSR
5317 : 4a __ __ LSR
5318 : aa __ __ TAX
5319 : 98 __ __ TYA
531a : 5d ec 69 EOR $69ec,x ; (s2pmap + 0)
531d : 85 0f __ STA P2 
531f : 20 cc 17 JSR $17cc ; (bnk_writeb.s0 + 0)
5322 : e6 46 __ INC T3 + 0 
5324 : a5 46 __ LDA T3 + 0 
5326 : c9 32 __ CMP #$32
5328 : 90 aa __ BCC $52d4 ; (vdcwin_get_rect.l8 + 0)
.s10:
532a : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
532d : 18 __ __ CLC
532e : 65 43 __ ADC T0 + 0 
5330 : 85 43 __ STA T0 + 0 
5332 : ad 60 6e LDA $6e60 ; (vdc_state + 4)
5335 : 65 44 __ ADC T0 + 1 
5337 : 85 44 __ STA T0 + 1 
5339 : 18 __ __ CLC
533a : a5 12 __ LDA P5 ; (chars + 0)
533c : 69 32 __ ADC #$32
533e : 85 12 __ STA P5 ; (chars + 0)
5340 : 90 02 __ BCC $5344 ; (vdcwin_get_rect.s1011 + 0)
.s1010:
5342 : e6 13 __ INC P6 ; (chars + 1)
.s1011:
5344 : c6 45 __ DEC T2 + 0 
5346 : d0 88 __ BNE $52d0 ; (vdcwin_get_rect.l4 + 0)
.s1001:
5348 : 60 __ __ RTS
--------------------------------------------------------------------
5349 : __ __ __ BYT 65 4e 54 45 52 45 44 20 53 54 52 49 4e 47 20 46 : eNTERED STRING F
5359 : __ __ __ BYT 4f 52 4d 41 54 54 45 44 20 57 49 54 48 20 57 4f : ORMATTED WITH WO
5369 : __ __ __ BYT 52 44 20 57 52 41 50 3a 00                      : RD WRAP:.
--------------------------------------------------------------------
viewport_demo: ; viewport_demo(u8)->void
.s1000:
5372 : a5 53 __ LDA T0 + 0 
5374 : 8d 9e bf STA $bf9e ; (bigfont + 131)
5377 : a5 54 __ LDA T2 + 0 
5379 : 8d 9f bf STA $bf9f ; (bigfont + 132)
537c : a5 55 __ LDA T3 + 0 
537e : 8d a0 bf STA $bfa0 ; (bigfont + 133)
.s0:
5381 : a9 00 __ LDA #$00
5383 : 8d fd bf STA $bffd ; (sstack + 6)
5386 : 8d fe bf STA $bffe ; (sstack + 7)
5389 : ad ff bf LDA $bfff ; (sstack + 8)
538c : 85 53 __ STA T0 + 0 
538e : 8d fc bf STA $bffc ; (sstack + 5)
5391 : 20 15 55 JSR $5515 ; (screen_switch.s1000 + 0)
5394 : a5 1b __ LDA ACCU + 0 
5396 : d0 10 __ BNE $53a8 ; (viewport_demo.s3 + 0)
.s1001:
5398 : ad 9e bf LDA $bf9e ; (bigfont + 131)
539b : 85 53 __ STA T0 + 0 
539d : ad 9f bf LDA $bf9f ; (bigfont + 132)
53a0 : 85 54 __ STA T2 + 0 
53a2 : ad a0 bf LDA $bfa0 ; (bigfont + 133)
53a5 : 85 55 __ STA T3 + 0 
53a7 : 60 __ __ RTS
.s3:
53a8 : ad 63 6e LDA $6e63 ; (vdc_state + 7)
53ab : 85 13 __ STA P6 
53ad : a9 89 __ LDA #$89
53af : 85 11 __ STA P4 
53b1 : a9 56 __ LDA #$56
53b3 : 85 12 __ STA P5 
53b5 : 20 bc 68 JSR $68bc ; (vdc_prints_attr@proxy + 0)
53b8 : a9 05 __ LDA #$05
53ba : 85 0f __ STA P2 
53bc : 85 10 __ STA P3 
53be : ad 61 6e LDA $6e61 ; (vdc_state + 5)
53c1 : 38 __ __ SEC
53c2 : e9 07 __ SBC #$07
53c4 : 85 55 __ STA T3 + 0 
53c6 : 85 12 __ STA P5 
53c8 : a9 46 __ LDA #$46
53ca : 85 11 __ STA P4 
53cc : a9 c3 __ LDA #$c3
53ce : 85 0d __ STA P0 
53d0 : a9 bf __ LDA #$bf
53d2 : 85 0e __ STA P1 
53d4 : 20 e5 33 JSR $33e5 ; (vdcwin_init.s0 + 0)
53d7 : a9 c3 __ LDA #$c3
53d9 : 85 14 __ STA P7 
53db : a9 bf __ LDA #$bf
53dd : 85 15 __ STA P8 
53df : 20 a5 34 JSR $34a5 ; (vdcwin_border_clear@proxy + 0)
53e2 : a9 00 __ LDA #$00
53e4 : 8d aa bf STA $bfaa ; (bigfont + 143)
53e7 : 8d ab bf STA $bfab ; (bigfont + 144)
53ea : 8d ac bf STA $bfac ; (bigfont + 145)
53ed : 8d ad bf STA $bfad ; (bigfont + 146)
53f0 : a9 7f __ LDA #$7f
53f2 : 8d a3 bf STA $bfa3 ; (bigfont + 136)
53f5 : a9 05 __ LDA #$05
53f7 : 85 0f __ STA P2 
53f9 : 85 10 __ STA P3 
53fb : a5 55 __ LDA T3 + 0 
53fd : 85 12 __ STA P5 
53ff : a9 46 __ LDA #$46
5401 : 85 11 __ STA P4 
5403 : a9 40 __ LDA #$40
5405 : 8d a5 bf STA $bfa5 ; (bigfont + 138)
5408 : a5 53 __ LDA T0 + 0 
540a : 0a __ __ ASL
540b : 85 54 __ STA T2 + 0 
540d : 85 55 __ STA T3 + 0 
540f : aa __ __ TAX
5410 : bd f4 69 LDA $69f4,x ; (screenset + 0)
5413 : 8d a6 bf STA $bfa6 ; (bigfont + 139)
5416 : a9 00 __ LDA #$00
5418 : 8d a9 bf STA $bfa9 ; (bigfont + 142)
541b : 8d a4 bf STA $bfa4 ; (bigfont + 137)
541e : 8d a7 bf STA $bfa7 ; (bigfont + 140)
5421 : bd f5 69 LDA $69f5,x ; (screenset + 1)
5424 : 8d a8 bf STA $bfa8 ; (bigfont + 141)
5427 : a9 ae __ LDA #$ae
5429 : 85 0d __ STA P0 
542b : a9 bf __ LDA #$bf
542d : 85 0e __ STA P1 
542f : 20 e5 33 JSR $33e5 ; (vdcwin_init.s0 + 0)
5432 : a9 a3 __ LDA #$a3
5434 : 85 16 __ STA P9 
5436 : a9 bf __ LDA #$bf
5438 : 85 17 __ STA P10 
543a : 20 36 3a JSR $3a36 ; (vdcwin_cpy_viewport.s0 + 0)
.l7:
543d : 20 b6 2c JSR $2cb6 ; (getch.s0 + 0)
5440 : 85 53 __ STA T0 + 0 
5442 : a2 00 __ LDX #$00
5444 : 86 43 __ STX T1 + 0 
5446 : c9 57 __ CMP #$57
5448 : f0 04 __ BEQ $544e ; (viewport_demo.s12 + 0)
.s13:
544a : c9 91 __ CMP #$91
544c : d0 11 __ BNE $545f ; (viewport_demo.s11 + 0)
.s12:
544e : ad ac bf LDA $bfac ; (bigfont + 145)
5451 : 0d ad bf ORA $bfad ; (bigfont + 146)
5454 : f0 09 __ BEQ $545f ; (viewport_demo.s11 + 0)
.s9:
5456 : a9 08 __ LDA #$08
5458 : 85 43 __ STA T1 + 0 
545a : a5 53 __ LDA T0 + 0 
545c : 4c 65 54 JMP $5465 ; (viewport_demo.s18 + 0)
.s11:
545f : a5 53 __ LDA T0 + 0 
5461 : c9 53 __ CMP #$53
5463 : f0 04 __ BEQ $5469 ; (viewport_demo.s17 + 0)
.s18:
5465 : c9 11 __ CMP #$11
5467 : d0 2f __ BNE $5498 ; (viewport_demo.s16 + 0)
.s17:
5469 : a6 54 __ LDX T2 + 0 
546b : bd f5 69 LDA $69f5,x ; (screenset + 1)
546e : 38 __ __ SEC
546f : ed 61 6e SBC $6e61 ; (vdc_state + 5)
5472 : a8 __ __ TAY
5473 : a9 00 __ LDA #$00
5475 : ed 62 6e SBC $6e62 ; (vdc_state + 6)
5478 : aa __ __ TAX
5479 : 98 __ __ TYA
547a : 18 __ __ CLC
547b : 69 06 __ ADC #$06
547d : 85 44 __ STA T4 + 0 
547f : 90 01 __ BCC $5482 ; (viewport_demo.s1027 + 0)
.s1026:
5481 : e8 __ __ INX
.s1027:
5482 : 86 45 __ STX T4 + 1 
5484 : ad ad bf LDA $bfad ; (bigfont + 146)
5487 : c5 45 __ CMP T4 + 1 
5489 : d0 05 __ BNE $5490 ; (viewport_demo.s1017 + 0)
.s1016:
548b : ad ac bf LDA $bfac ; (bigfont + 145)
548e : c5 44 __ CMP T4 + 0 
.s1017:
5490 : b0 06 __ BCS $5498 ; (viewport_demo.s16 + 0)
.s14:
5492 : a5 43 __ LDA T1 + 0 
5494 : 09 04 __ ORA #$04
5496 : 85 43 __ STA T1 + 0 
.s16:
5498 : a5 53 __ LDA T0 + 0 
549a : c9 41 __ CMP #$41
549c : f0 04 __ BEQ $54a2 ; (viewport_demo.s22 + 0)
.s23:
549e : c9 9d __ CMP #$9d
54a0 : d0 0e __ BNE $54b0 ; (viewport_demo.s21 + 0)
.s22:
54a2 : ad aa bf LDA $bfaa ; (bigfont + 143)
54a5 : 0d ab bf ORA $bfab ; (bigfont + 144)
54a8 : f0 06 __ BEQ $54b0 ; (viewport_demo.s21 + 0)
.s19:
54aa : a5 43 __ LDA T1 + 0 
54ac : 09 01 __ ORA #$01
54ae : 85 43 __ STA T1 + 0 
.s21:
54b0 : a5 53 __ LDA T0 + 0 
54b2 : c9 44 __ CMP #$44
54b4 : f0 04 __ BEQ $54ba ; (viewport_demo.s27 + 0)
.s28:
54b6 : c9 1d __ CMP #$1d
54b8 : d0 24 __ BNE $54de ; (viewport_demo.s26 + 0)
.s27:
54ba : a6 55 __ LDX T3 + 0 
54bc : bd f4 69 LDA $69f4,x ; (screenset + 0)
54bf : 38 __ __ SEC
54c0 : e9 47 __ SBC #$47
54c2 : 85 44 __ STA T4 + 0 
54c4 : a9 00 __ LDA #$00
54c6 : e9 00 __ SBC #$00
54c8 : 85 45 __ STA T4 + 1 
54ca : ad ab bf LDA $bfab ; (bigfont + 144)
54cd : c5 45 __ CMP T4 + 1 
54cf : d0 05 __ BNE $54d6 ; (viewport_demo.s1007 + 0)
.s1006:
54d1 : ad aa bf LDA $bfaa ; (bigfont + 143)
54d4 : c5 44 __ CMP T4 + 0 
.s1007:
54d6 : b0 06 __ BCS $54de ; (viewport_demo.s26 + 0)
.s24:
54d8 : a5 43 __ LDA T1 + 0 
54da : 09 02 __ ORA #$02
54dc : 90 04 __ BCC $54e2 ; (viewport_demo.s29 + 0)
.s26:
54de : a5 43 __ LDA T1 + 0 
54e0 : f0 10 __ BEQ $54f2 ; (viewport_demo.s31 + 0)
.s29:
54e2 : 8d f9 bf STA $bff9 ; (sstack + 2)
54e5 : a9 a3 __ LDA #$a3
54e7 : 8d f7 bf STA $bff7 ; (sstack + 0)
54ea : a9 bf __ LDA #$bf
54ec : 8d f8 bf STA $bff8 ; (sstack + 1)
54ef : 20 be 56 JSR $56be ; (vdcwin_viewportscroll.s1000 + 0)
.s31:
54f2 : a5 53 __ LDA T0 + 0 
54f4 : c9 1b __ CMP #$1b
54f6 : f0 07 __ BEQ $54ff ; (viewport_demo.s8 + 0)
.s32:
54f8 : c9 03 __ CMP #$03
54fa : f0 03 __ BEQ $54ff ; (viewport_demo.s8 + 0)
54fc : 4c 3d 54 JMP $543d ; (viewport_demo.l7 + 0)
.s8:
54ff : a9 01 __ LDA #$01
5501 : 8d fd bf STA $bffd ; (sstack + 6)
5504 : a9 00 __ LDA #$00
5506 : 8d fe bf STA $bffe ; (sstack + 7)
5509 : ad ff bf LDA $bfff ; (sstack + 8)
550c : 8d fc bf STA $bffc ; (sstack + 5)
550f : 20 15 55 JSR $5515 ; (screen_switch.s1000 + 0)
5512 : 4c 98 53 JMP $5398 ; (viewport_demo.s1001 + 0)
--------------------------------------------------------------------
screen_switch: ; screen_switch(u8,u8,u8)->u8
.s1000:
5515 : a5 53 __ LDA T1 + 0 
5517 : 8d dc bf STA $bfdc ; (bigfont + 193)
551a : a5 54 __ LDA T2 + 0 
551c : 8d dd bf STA $bfdd ; (bigfont + 194)
551f : a5 55 __ LDA T3 + 0 
5521 : 8d de bf STA $bfde ; (bigfont + 195)
.s0:
5524 : ae 61 6e LDX $6e61 ; (vdc_state + 5)
5527 : ca __ __ DEX
5528 : ca __ __ DEX
5529 : 86 15 __ STX P8 
552b : 20 17 69 JSR $6917 ; (vdc_clear@proxy + 0)
552e : a9 08 __ LDA #$08
5530 : 85 11 __ STA P4 
5532 : a9 56 __ LDA #$56
5534 : 85 12 __ STA P5 
5536 : 20 de 68 JSR $68de ; (vdc_prints_attr@proxy + 0)
5539 : a9 01 __ LDA #$01
553b : 85 53 __ STA T1 + 0 
553d : a9 00 __ LDA #$00
553f : cd fc bf CMP $bffc ; (sstack + 5)
5542 : 2a __ __ ROL
5543 : 85 55 __ STA T3 + 0 
5545 : d0 07 __ BNE $554e ; (screen_switch.s2 + 0)
.s5:
5547 : ad fc bf LDA $bffc ; (sstack + 5)
554a : c9 02 __ CMP #$02
554c : d0 6f __ BNE $55bd ; (screen_switch.s4 + 0)
.s2:
554e : 20 de 17 JSR $17de ; (sid_resetsid.s0 + 0)
5551 : ad ff 61 LDA $61ff ; (bootdevice + 0)
5554 : 85 54 __ STA T2 + 0 
5556 : 85 0f __ STA P2 
5558 : a9 00 __ LDA #$00
555a : 85 10 __ STA P3 
555c : a9 40 __ LDA #$40
555e : 85 11 __ STA P4 
5560 : ad fd bf LDA $bffd ; (sstack + 6)
5563 : f0 07 __ BEQ $556c ; (screen_switch.s7 + 0)
.s6:
5565 : a9 39 __ LDA #$39
5567 : a0 f8 __ LDY #$f8
5569 : 4c a3 55 JMP $55a3 ; (screen_switch.s32 + 0)
.s7:
556c : a5 55 __ LDA T3 + 0 
556e : d0 64 __ BNE $55d4 ; (screen_switch.s12 + 0)
.s13:
5570 : a9 69 __ LDA #$69
5572 : 85 12 __ STA P5 
5574 : a9 56 __ LDA #$56
5576 : 85 13 __ STA P6 
5578 : 20 1c 18 JSR $181c ; (bnk_load.s0 + 0)
557b : a5 1b __ LDA ACCU + 0 
557d : d0 05 __ BNE $5584 ; (screen_switch.s24 + 0)
.s22:
557f : 20 9b 31 JSR $319b ; (menu_fileerrormessage.s1000 + 0)
5582 : c6 53 __ DEC T1 + 0 
.s24:
5584 : a9 04 __ LDA #$04
5586 : 85 10 __ STA P3 
5588 : a9 71 __ LDA #$71
558a : 85 11 __ STA P4 
558c : a9 56 __ LDA #$56
558e : 85 12 __ STA P5 
5590 : 20 c7 68 JSR $68c7 ; (vdc_prints_attr@proxy + 0)
5593 : a5 54 __ LDA T2 + 0 
5595 : 85 0f __ STA P2 
5597 : a9 00 __ LDA #$00
5599 : 85 10 __ STA P3 
559b : a9 a0 __ LDA #$a0
559d : 85 11 __ STA P4 
559f : a9 56 __ LDA #$56
55a1 : a0 82 __ LDY #$82
.s32:
55a3 : 84 12 __ STY P5 
55a5 : 85 13 __ STA P6 
55a7 : 20 1c 18 JSR $181c ; (bnk_load.s0 + 0)
55aa : a5 1b __ LDA ACCU + 0 
55ac : d0 0c __ BNE $55ba ; (screen_switch.s38 + 0)
.s9:
55ae : 20 9b 31 JSR $319b ; (menu_fileerrormessage.s1000 + 0)
55b1 : 20 de 17 JSR $17de ; (sid_resetsid.s0 + 0)
55b4 : a9 00 __ LDA #$00
55b6 : 85 53 __ STA T1 + 0 
55b8 : f0 03 __ BEQ $55bd ; (screen_switch.s4 + 0)
.s38:
55ba : 20 de 17 JSR $17de ; (sid_resetsid.s0 + 0)
.s4:
55bd : 20 00 69 JSR $6900 ; (vdc_clear@proxy + 0)
55c0 : a5 53 __ LDA T1 + 0 
55c2 : 85 1b __ STA ACCU + 0 
.s1001:
55c4 : ad dc bf LDA $bfdc ; (bigfont + 193)
55c7 : 85 53 __ STA T1 + 0 
55c9 : ad dd bf LDA $bfdd ; (bigfont + 194)
55cc : 85 54 __ STA T2 + 0 
55ce : ad de bf LDA $bfde ; (bigfont + 195)
55d1 : 85 55 __ STA T3 + 0 
55d3 : 60 __ __ RTS
.s12:
55d4 : a9 1d __ LDA #$1d
55d6 : 85 12 __ STA P5 
55d8 : a9 56 __ LDA #$56
55da : 85 13 __ STA P6 
55dc : 20 1c 18 JSR $181c ; (bnk_load.s0 + 0)
55df : a5 1b __ LDA ACCU + 0 
55e1 : d0 05 __ BNE $55e8 ; (screen_switch.s34 + 0)
.s15:
55e3 : 20 9b 31 JSR $319b ; (menu_fileerrormessage.s1000 + 0)
55e6 : c6 53 __ DEC T1 + 0 
.s34:
55e8 : ad fe bf LDA $bffe ; (sstack + 7)
55eb : d0 cd __ BNE $55ba ; (screen_switch.s38 + 0)
.s18:
55ed : 85 0f __ STA P2 
55ef : ae 61 6e LDX $6e61 ; (vdc_state + 5)
55f2 : ca __ __ DEX
55f3 : 86 10 __ STX P3 
55f5 : ad 63 6e LDA $6e63 ; (vdc_state + 7)
55f8 : 85 13 __ STA P6 
55fa : a9 25 __ LDA #$25
55fc : 85 11 __ STA P4 
55fe : a9 56 __ LDA #$56
5600 : 85 12 __ STA P5 
5602 : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
5605 : 4c ba 55 JMP $55ba ; (screen_switch.s38 + 0)
--------------------------------------------------------------------
5608 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 53 43 52 45 45 4e 20 44 : lOADING SCREEN D
5618 : __ __ __ BYT 41 54 41 2e 00                                  : ATA..
--------------------------------------------------------------------
561d : __ __ __ BYT 53 43 52 45 45 4e 31 00                         : SCREEN1.
--------------------------------------------------------------------
5625 : __ __ __ BYT 70 45 54 53 43 49 49 20 41 52 54 20 43 52 45 44 : pETSCII ART CRED
5635 : __ __ __ BYT 49 54 3a 20 27 6c 4f 56 45 20 49 53 20 54 48 45 : IT: 'lOVE IS THE
5645 : __ __ __ BYT 20 44 52 55 47 27 20 61 54 4c 41 4e 54 49 53 2c :  DRUG' aTLANTIS,
5655 : __ __ __ BYT 20 32 30 32 33 2c 20 61 52 54 20 42 59 20 6c 4f :  2023, aRT BY lO
5665 : __ __ __ BYT 42 4f 2e 00                                     : BO..
--------------------------------------------------------------------
5669 : __ __ __ BYT 53 43 52 45 45 4e 33 00                         : SCREEN3.
--------------------------------------------------------------------
5671 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 43 48 41 52 53 45 54 2e : lOADING CHARSET.
5681 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
5682 : __ __ __ BYT 43 48 41 52 53 31 00                            : CHARS1.
--------------------------------------------------------------------
5689 : __ __ __ BYT 6d 4f 56 45 20 42 59 20 77 2c 61 2c 73 2c 64 20 : mOVE BY w,a,s,d 
5699 : __ __ __ BYT 4f 52 20 43 55 52 53 4f 52 20 4b 45 59 53 2e 20 : OR CURSOR KEYS. 
56a9 : __ __ __ BYT 65 73 63 20 4f 52 20 73 74 6f 70 20 54 4f 20 45 : esc OR stop TO E
56b9 : __ __ __ BYT 58 49 54 2e 00                                  : XIT..
--------------------------------------------------------------------
vdcwin_viewportscroll: ; vdcwin_viewportscroll(struct VDCViewport*,u8)->void
.s1000:
56be : a5 53 __ LDA T2 + 0 
56c0 : 8d cd bf STA $bfcd ; (bigfont + 178)
.s0:
56c3 : ad f7 bf LDA $bff7 ; (sstack + 0)
56c6 : 85 50 __ STA T0 + 0 
56c8 : ad f8 bf LDA $bff8 ; (sstack + 1)
56cb : 85 51 __ STA T0 + 1 
56cd : a0 14 __ LDY #$14
.l1002:
56cf : b1 50 __ LDA (T0 + 0),y 
56d1 : 99 d1 bf STA $bfd1,y ; (bigfont + 182)
56d4 : 88 __ __ DEY
56d5 : 10 f8 __ BPL $56cf ; (vdcwin_viewportscroll.l1002 + 0)
.s1003:
56d7 : ad f9 bf LDA $bff9 ; (sstack + 2)
56da : 85 53 __ STA T2 + 0 
56dc : 4a __ __ LSR
56dd : 90 45 __ BCC $5724 ; (vdcwin_viewportscroll.s14 + 0)
.s1:
56df : a5 50 __ LDA T0 + 0 
56e1 : 69 0a __ ADC #$0a
56e3 : 85 16 __ STA P9 
56e5 : a5 51 __ LDA T0 + 1 
56e7 : 69 00 __ ADC #$00
56e9 : 85 17 __ STA P10 
56eb : 20 3c 58 JSR $583c ; (vdcwin_scroll_right.s1000 + 0)
56ee : a9 01 __ LDA #$01
56f0 : 85 11 __ STA P4 
56f2 : a0 0b __ LDY #$0b
56f4 : b1 50 __ LDA (T0 + 0),y 
56f6 : 85 0f __ STA P2 
56f8 : c8 __ __ INY
56f9 : b1 50 __ LDA (T0 + 0),y 
56fb : 85 10 __ STA P3 
56fd : a0 0e __ LDY #$0e
56ff : b1 50 __ LDA (T0 + 0),y 
5701 : 85 12 __ STA P5 
5703 : ad d8 bf LDA $bfd8 ; (bigfont + 189)
5706 : 18 __ __ CLC
5707 : 69 ff __ ADC #$ff
5709 : 8d d8 bf STA $bfd8 ; (bigfont + 189)
570c : b0 03 __ BCS $5711 ; (vdcwin_viewportscroll.s1005 + 0)
.s1004:
570e : ce d9 bf DEC $bfd9 ; (bigfont + 190)
.s1005:
5711 : 18 __ __ CLC
5712 : a0 07 __ LDY #$07
5714 : b1 50 __ LDA (T0 + 0),y 
5716 : 69 ff __ ADC #$ff
5718 : 91 50 __ STA (T0 + 0),y 
571a : c8 __ __ INY
571b : b1 50 __ LDA (T0 + 0),y 
571d : 69 ff __ ADC #$ff
571f : 91 50 __ STA (T0 + 0),y 
5721 : 20 dd 33 JSR $33dd ; (vdcwin_init@proxy + 0)
.s14:
5724 : a5 53 __ LDA T2 + 0 
5726 : 29 02 __ AND #$02
5728 : f0 58 __ BEQ $5782 ; (vdcwin_viewportscroll.s15 + 0)
.s4:
572a : 18 __ __ CLC
572b : a5 50 __ LDA T0 + 0 
572d : 69 0b __ ADC #$0b
572f : 85 16 __ STA P9 
5731 : a5 51 __ LDA T0 + 1 
5733 : 69 00 __ ADC #$00
5735 : 85 17 __ STA P10 
5737 : 20 46 59 JSR $5946 ; (vdcwin_scroll_left.s0 + 0)
573a : a9 01 __ LDA #$01
573c : 85 11 __ STA P4 
573e : a0 0c __ LDY #$0c
5740 : b1 50 __ LDA (T0 + 0),y 
5742 : 85 10 __ STA P3 
5744 : a0 0e __ LDY #$0e
5746 : b1 50 __ LDA (T0 + 0),y 
5748 : 85 12 __ STA P5 
574a : 88 __ __ DEY
574b : b1 50 __ LDA (T0 + 0),y 
574d : 85 43 __ STA T1 + 0 
574f : 18 __ __ CLC
5750 : 6d d8 bf ADC $bfd8 ; (bigfont + 189)
5753 : 8d d8 bf STA $bfd8 ; (bigfont + 189)
5756 : 90 03 __ BCC $575b ; (vdcwin_viewportscroll.s1007 + 0)
.s1006:
5758 : ee d9 bf INC $bfd9 ; (bigfont + 190)
.s1007:
575b : 18 __ __ CLC
575c : a0 07 __ LDY #$07
575e : b1 50 __ LDA (T0 + 0),y 
5760 : 69 01 __ ADC #$01
5762 : 91 50 __ STA (T0 + 0),y 
5764 : c8 __ __ INY
5765 : b1 50 __ LDA (T0 + 0),y 
5767 : 69 00 __ ADC #$00
5769 : 91 50 __ STA (T0 + 0),y 
576b : a9 dc __ LDA #$dc
576d : 85 0d __ STA P0 
576f : a9 bf __ LDA #$bf
5771 : 85 0e __ STA P1 
5773 : a0 0b __ LDY #$0b
5775 : b1 50 __ LDA (T0 + 0),y 
5777 : 18 __ __ CLC
5778 : 65 43 __ ADC T1 + 0 
577a : 38 __ __ SEC
577b : e9 01 __ SBC #$01
577d : 85 0f __ STA P2 
577f : 20 e5 33 JSR $33e5 ; (vdcwin_init.s0 + 0)
.s15:
5782 : a5 53 __ LDA T2 + 0 
5784 : 29 08 __ AND #$08
5786 : f0 45 __ BEQ $57cd ; (vdcwin_viewportscroll.s16 + 0)
.s7:
5788 : 18 __ __ CLC
5789 : a5 50 __ LDA T0 + 0 
578b : 69 0b __ ADC #$0b
578d : 85 15 __ STA P8 
578f : a5 51 __ LDA T0 + 1 
5791 : 69 00 __ ADC #$00
5793 : 85 16 __ STA P9 
5795 : 20 31 5a JSR $5a31 ; (vdcwin_scroll_down.s0 + 0)
5798 : a9 01 __ LDA #$01
579a : 85 12 __ STA P5 
579c : a0 0b __ LDY #$0b
579e : b1 50 __ LDA (T0 + 0),y 
57a0 : 85 0f __ STA P2 
57a2 : c8 __ __ INY
57a3 : b1 50 __ LDA (T0 + 0),y 
57a5 : 85 10 __ STA P3 
57a7 : c8 __ __ INY
57a8 : b1 50 __ LDA (T0 + 0),y 
57aa : 85 11 __ STA P4 
57ac : ad da bf LDA $bfda ; (bigfont + 191)
57af : 18 __ __ CLC
57b0 : 69 ff __ ADC #$ff
57b2 : 8d da bf STA $bfda ; (bigfont + 191)
57b5 : b0 03 __ BCS $57ba ; (vdcwin_viewportscroll.s1009 + 0)
.s1008:
57b7 : ce db bf DEC $bfdb ; (bigfont + 192)
.s1009:
57ba : 18 __ __ CLC
57bb : a0 09 __ LDY #$09
57bd : b1 50 __ LDA (T0 + 0),y 
57bf : 69 ff __ ADC #$ff
57c1 : 91 50 __ STA (T0 + 0),y 
57c3 : c8 __ __ INY
57c4 : b1 50 __ LDA (T0 + 0),y 
57c6 : 69 ff __ ADC #$ff
57c8 : 91 50 __ STA (T0 + 0),y 
57ca : 20 dd 33 JSR $33dd ; (vdcwin_init@proxy + 0)
.s16:
57cd : a5 53 __ LDA T2 + 0 
57cf : 29 04 __ AND #$04
57d1 : f0 58 __ BEQ $582b ; (vdcwin_viewportscroll.s12 + 0)
.s10:
57d3 : 18 __ __ CLC
57d4 : a5 50 __ LDA T0 + 0 
57d6 : 69 0b __ ADC #$0b
57d8 : 85 15 __ STA P8 
57da : a5 51 __ LDA T0 + 1 
57dc : 69 00 __ ADC #$00
57de : 85 16 __ STA P9 
57e0 : 20 2e 47 JSR $472e ; (vdcwin_scroll_up.s0 + 0)
57e3 : a9 01 __ LDA #$01
57e5 : 85 12 __ STA P5 
57e7 : a0 0b __ LDY #$0b
57e9 : b1 50 __ LDA (T0 + 0),y 
57eb : 85 0f __ STA P2 
57ed : a0 0d __ LDY #$0d
57ef : b1 50 __ LDA (T0 + 0),y 
57f1 : 85 11 __ STA P4 
57f3 : c8 __ __ INY
57f4 : b1 50 __ LDA (T0 + 0),y 
57f6 : 85 43 __ STA T1 + 0 
57f8 : 18 __ __ CLC
57f9 : 6d da bf ADC $bfda ; (bigfont + 191)
57fc : 8d da bf STA $bfda ; (bigfont + 191)
57ff : 90 03 __ BCC $5804 ; (vdcwin_viewportscroll.s1011 + 0)
.s1010:
5801 : ee db bf INC $bfdb ; (bigfont + 192)
.s1011:
5804 : 18 __ __ CLC
5805 : a0 09 __ LDY #$09
5807 : b1 50 __ LDA (T0 + 0),y 
5809 : 69 01 __ ADC #$01
580b : 91 50 __ STA (T0 + 0),y 
580d : c8 __ __ INY
580e : b1 50 __ LDA (T0 + 0),y 
5810 : 69 00 __ ADC #$00
5812 : 91 50 __ STA (T0 + 0),y 
5814 : a9 dc __ LDA #$dc
5816 : 85 0d __ STA P0 
5818 : a9 bf __ LDA #$bf
581a : 85 0e __ STA P1 
581c : a0 0c __ LDY #$0c
581e : b1 50 __ LDA (T0 + 0),y 
5820 : 18 __ __ CLC
5821 : 65 43 __ ADC T1 + 0 
5823 : 38 __ __ SEC
5824 : e9 01 __ SBC #$01
5826 : 85 10 __ STA P3 
5828 : 20 e5 33 JSR $33e5 ; (vdcwin_init.s0 + 0)
.s12:
582b : a9 d1 __ LDA #$d1
582d : 85 16 __ STA P9 
582f : a9 bf __ LDA #$bf
5831 : 85 17 __ STA P10 
5833 : 20 36 3a JSR $3a36 ; (vdcwin_cpy_viewport.s0 + 0)
.s1001:
5836 : ad cd bf LDA $bfcd ; (bigfont + 178)
5839 : 85 53 __ STA T2 + 0 
583b : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_right: ; vdcwin_scroll_right(struct VDCWin*,u8)->void
.s1000:
583c : a5 53 __ LDA T8 + 0 
583e : 8d f1 bf STA $bff1 ; (fname + 11)
5841 : a5 54 __ LDA T8 + 1 
5843 : 8d f2 bf STA $bff2 ; (fname + 12)
.s0:
5846 : a0 02 __ LDY #$02
5848 : b1 16 __ LDA (P9),y ; (win + 0)
584a : 38 __ __ SEC
584b : e9 01 __ SBC #$01
584d : 85 47 __ STA T2 + 0 
584f : a9 00 __ LDA #$00
5851 : 85 46 __ STA T1 + 0 
5853 : a0 06 __ LDY #$06
5855 : b1 16 __ LDA (P9),y ; (win + 0)
5857 : 85 48 __ STA T3 + 0 
5859 : c8 __ __ INY
585a : b1 16 __ LDA (P9),y ; (win + 0)
585c : 85 49 __ STA T3 + 1 
585e : c8 __ __ INY
585f : b1 16 __ LDA (P9),y ; (win + 0)
5861 : 85 4a __ STA T4 + 0 
5863 : c8 __ __ INY
5864 : b1 16 __ LDA (P9),y ; (win + 0)
5866 : 4c 87 58 JMP $5887 ; (vdcwin_scroll_right.l1 + 0)
.s5:
5869 : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
586c : 18 __ __ CLC
586d : 65 48 __ ADC T3 + 0 
586f : 85 48 __ STA T3 + 0 
5871 : ad 60 6e LDA $6e60 ; (vdc_state + 4)
5874 : 65 49 __ ADC T3 + 1 
5876 : 85 49 __ STA T3 + 1 
5878 : 18 __ __ CLC
5879 : a5 4a __ LDA T4 + 0 
587b : 6d 5f 6e ADC $6e5f ; (vdc_state + 3)
587e : 85 4a __ STA T4 + 0 
5880 : a5 4b __ LDA T4 + 1 
5882 : 6d 60 6e ADC $6e60 ; (vdc_state + 4)
5885 : e6 46 __ INC T1 + 0 
.l1:
5887 : 85 4b __ STA T4 + 1 
5889 : a5 46 __ LDA T1 + 0 
588b : a0 03 __ LDY #$03
588d : d1 16 __ CMP (P9),y ; (win + 0)
588f : 90 0b __ BCC $589c ; (vdcwin_scroll_right.s2 + 0)
.s1001:
5891 : ad f1 bf LDA $bff1 ; (fname + 11)
5894 : 85 53 __ STA T8 + 0 
5896 : ad f2 bf LDA $bff2 ; (fname + 12)
5899 : 85 54 __ STA T8 + 1 
589b : 60 __ __ RTS
.s2:
589c : a5 48 __ LDA T3 + 0 
589e : 69 01 __ ADC #$01
58a0 : 85 4c __ STA T6 + 0 
58a2 : a5 49 __ LDA T3 + 1 
58a4 : 69 00 __ ADC #$00
58a6 : 85 4d __ STA T6 + 1 
58a8 : 18 __ __ CLC
58a9 : a5 4a __ LDA T4 + 0 
58ab : 69 01 __ ADC #$01
58ad : 85 4e __ STA T7 + 0 
58af : a5 4b __ LDA T4 + 1 
58b1 : 69 00 __ ADC #$00
58b3 : 85 4f __ STA T7 + 1 
58b5 : ad 5d 6e LDA $6e5d ; (vdc_state + 1)
58b8 : d0 0c __ BNE $58c6 ; (vdcwin_scroll_right.s7 + 0)
.s9:
58ba : cc 69 6e CPY $6e69 ; (vdc_state + 13)
58bd : d0 05 __ BNE $58c4 ; (vdcwin_scroll_right.s1003 + 0)
.s1002:
58bf : a9 ff __ LDA #$ff
58c1 : cd 68 6e CMP $6e68 ; (vdc_state + 12)
.s1003:
58c4 : 90 4d __ BCC $5913 ; (vdcwin_scroll_right.s6 + 0)
.s7:
58c6 : a5 48 __ LDA T3 + 0 
58c8 : 85 11 __ STA P4 
58ca : a5 49 __ LDA T3 + 1 
58cc : 85 12 __ STA P5 
58ce : ad 68 6e LDA $6e68 ; (vdc_state + 12)
58d1 : 85 53 __ STA T8 + 0 
58d3 : 85 0f __ STA P2 
58d5 : ad 69 6e LDA $6e69 ; (vdc_state + 13)
58d8 : 85 54 __ STA T8 + 1 
58da : 85 10 __ STA P3 
58dc : 20 b2 47 JSR $47b2 ; (vdc_block_copy@proxy + 0)
58df : a5 53 __ LDA T8 + 0 
58e1 : 85 11 __ STA P4 
58e3 : a5 54 __ LDA T8 + 1 
58e5 : 85 12 __ STA P5 
58e7 : 20 88 68 JSR $6888 ; (vdc_block_copy@proxy + 0)
58ea : a5 53 __ LDA T8 + 0 
58ec : 85 0f __ STA P2 
58ee : a5 54 __ LDA T8 + 1 
58f0 : 85 10 __ STA P3 
58f2 : a5 4a __ LDA T4 + 0 
58f4 : 85 11 __ STA P4 
58f6 : a5 4b __ LDA T4 + 1 
58f8 : 85 12 __ STA P5 
58fa : 20 ba 47 JSR $47ba ; (vdc_block_copy.s0 + 0)
58fd : a5 4e __ LDA T7 + 0 
58ff : 85 0f __ STA P2 
5901 : a5 4f __ LDA T7 + 1 
5903 : 85 10 __ STA P3 
5905 : a5 53 __ LDA T8 + 0 
5907 : 85 11 __ STA P4 
5909 : a5 54 __ LDA T8 + 1 
590b : 85 12 __ STA P5 
590d : 20 ba 47 JSR $47ba ; (vdc_block_copy.s0 + 0)
5910 : 4c 69 58 JMP $5869 ; (vdcwin_scroll_right.s5 + 0)
.s6:
5913 : a5 48 __ LDA T3 + 0 
5915 : 85 10 __ STA P3 
5917 : a5 49 __ LDA T3 + 1 
5919 : 85 11 __ STA P4 
591b : 20 6a 18 JSR $186a ; (bnk_cpyfromvdc@proxy + 0)
591e : a5 4c __ LDA T6 + 0 
5920 : 85 0f __ STA P2 
5922 : a5 4d __ LDA T6 + 1 
5924 : 85 10 __ STA P3 
5926 : a5 12 __ LDA P5 
5928 : 85 14 __ STA P7 
592a : 20 1b 17 JSR $171b ; (bnk_cpytovdc@proxy + 0)
592d : a5 4a __ LDA T4 + 0 
592f : 85 10 __ STA P3 
5931 : a5 4b __ LDA T4 + 1 
5933 : 85 11 __ STA P4 
5935 : 20 6a 18 JSR $186a ; (bnk_cpyfromvdc@proxy + 0)
5938 : a5 4e __ LDA T7 + 0 
593a : 85 0f __ STA P2 
593c : a5 4f __ LDA T7 + 1 
593e : 85 10 __ STA P3 
5940 : 20 1b 17 JSR $171b ; (bnk_cpytovdc@proxy + 0)
5943 : 4c 69 58 JMP $5869 ; (vdcwin_scroll_right.s5 + 0)
--------------------------------------------------------------------
vdcwin_scroll_left: ; vdcwin_scroll_left(struct VDCWin*,u8)->void
.s0:
5946 : a0 02 __ LDY #$02
5948 : b1 16 __ LDA (P9),y ; (win + 0)
594a : 38 __ __ SEC
594b : e9 01 __ SBC #$01
594d : 85 47 __ STA T2 + 0 
594f : a0 06 __ LDY #$06
5951 : b1 16 __ LDA (P9),y ; (win + 0)
5953 : 85 48 __ STA T3 + 0 
5955 : c8 __ __ INY
5956 : b1 16 __ LDA (P9),y ; (win + 0)
5958 : 85 49 __ STA T3 + 1 
595a : c8 __ __ INY
595b : b1 16 __ LDA (P9),y ; (win + 0)
595d : 85 4a __ STA T4 + 0 
595f : c8 __ __ INY
5960 : b1 16 __ LDA (P9),y ; (win + 0)
5962 : 85 4b __ STA T4 + 1 
.l62:
5964 : ad 00 d6 LDA $d600 
5967 : 29 20 __ AND #$20
5969 : f0 f9 __ BEQ $5964 ; (vdcwin_scroll_left.l62 + 0)
.s1:
596b : a9 00 __ LDA #$00
596d : 85 46 __ STA T1 + 0 
596f : f0 22 __ BEQ $5993 ; (vdcwin_scroll_left.l4 + 0)
.s8:
5971 : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
5974 : 18 __ __ CLC
5975 : 65 48 __ ADC T3 + 0 
5977 : 85 48 __ STA T3 + 0 
5979 : ad 60 6e LDA $6e60 ; (vdc_state + 4)
597c : 65 49 __ ADC T3 + 1 
597e : 85 49 __ STA T3 + 1 
5980 : 18 __ __ CLC
5981 : a5 4a __ LDA T4 + 0 
5983 : 6d 5f 6e ADC $6e5f ; (vdc_state + 3)
5986 : 85 4a __ STA T4 + 0 
5988 : a5 4b __ LDA T4 + 1 
598a : 6d 60 6e ADC $6e60 ; (vdc_state + 4)
598d : 85 4b __ STA T4 + 1 
598f : e6 46 __ INC T1 + 0 
5991 : a5 46 __ LDA T1 + 0 
.l4:
5993 : a0 03 __ LDY #$03
5995 : d1 16 __ CMP (P9),y ; (win + 0)
5997 : 90 08 __ BCC $59a1 ; (vdcwin_scroll_left.s5 + 0)
.l14:
5999 : ad 00 d6 LDA $d600 
599c : 29 20 __ AND #$20
599e : d0 f9 __ BNE $5999 ; (vdcwin_scroll_left.l14 + 0)
.s1001:
59a0 : 60 __ __ RTS
.s5:
59a1 : a5 48 __ LDA T3 + 0 
59a3 : 69 01 __ ADC #$01
59a5 : 85 10 __ STA P3 
59a7 : 85 11 __ STA P4 
59a9 : a5 49 __ LDA T3 + 1 
59ab : 69 00 __ ADC #$00
59ad : 85 12 __ STA P5 
59af : 18 __ __ CLC
59b0 : a5 4a __ LDA T4 + 0 
59b2 : 69 01 __ ADC #$01
59b4 : 85 4e __ STA T7 + 0 
59b6 : a5 4b __ LDA T4 + 1 
59b8 : 69 00 __ ADC #$00
59ba : 85 4f __ STA T7 + 1 
59bc : ad 5d 6e LDA $6e5d ; (vdc_state + 1)
59bf : d0 0c __ BNE $59cd ; (vdcwin_scroll_left.s10 + 0)
.s12:
59c1 : cc 69 6e CPY $6e69 ; (vdc_state + 13)
59c4 : d0 05 __ BNE $59cb ; (vdcwin_scroll_left.s1003 + 0)
.s1002:
59c6 : a9 ff __ LDA #$ff
59c8 : cd 68 6e CMP $6e68 ; (vdc_state + 12)
.s1003:
59cb : 90 35 __ BCC $5a02 ; (vdcwin_scroll_left.s9 + 0)
.s10:
59cd : ad 68 6e LDA $6e68 ; (vdc_state + 12)
59d0 : 85 4c __ STA T5 + 0 
59d2 : 85 0f __ STA P2 
59d4 : ad 69 6e LDA $6e69 ; (vdc_state + 13)
59d7 : 85 4d __ STA T5 + 1 
59d9 : 85 10 __ STA P3 
59db : 20 b2 47 JSR $47b2 ; (vdc_block_copy@proxy + 0)
59de : a5 48 __ LDA T3 + 0 
59e0 : 85 0f __ STA P2 
59e2 : a5 49 __ LDA T3 + 1 
59e4 : 85 10 __ STA P3 
59e6 : 20 7d 68 JSR $687d ; (vdc_block_copy@proxy + 0)
59e9 : a5 4e __ LDA T7 + 0 
59eb : 85 11 __ STA P4 
59ed : a5 4f __ LDA T7 + 1 
59ef : 85 12 __ STA P5 
59f1 : 20 88 68 JSR $6888 ; (vdc_block_copy@proxy + 0)
59f4 : a5 4a __ LDA T4 + 0 
59f6 : 85 0f __ STA P2 
59f8 : a5 4b __ LDA T4 + 1 
59fa : 85 10 __ STA P3 
59fc : 20 7d 68 JSR $687d ; (vdc_block_copy@proxy + 0)
59ff : 4c 71 59 JMP $5971 ; (vdcwin_scroll_left.s8 + 0)
.s9:
5a02 : a5 12 __ LDA P5 
5a04 : 85 11 __ STA P4 
5a06 : 20 6a 18 JSR $186a ; (bnk_cpyfromvdc@proxy + 0)
5a09 : a5 48 __ LDA T3 + 0 
5a0b : 85 0f __ STA P2 
5a0d : a5 49 __ LDA T3 + 1 
5a0f : 85 10 __ STA P3 
5a11 : a5 12 __ LDA P5 
5a13 : 85 14 __ STA P7 
5a15 : 20 1b 17 JSR $171b ; (bnk_cpytovdc@proxy + 0)
5a18 : a5 4e __ LDA T7 + 0 
5a1a : 85 10 __ STA P3 
5a1c : a5 4f __ LDA T7 + 1 
5a1e : 85 11 __ STA P4 
5a20 : 20 6a 18 JSR $186a ; (bnk_cpyfromvdc@proxy + 0)
5a23 : a5 4a __ LDA T4 + 0 
5a25 : 85 0f __ STA P2 
5a27 : a5 4b __ LDA T4 + 1 
5a29 : 85 10 __ STA P3 
5a2b : 20 1b 17 JSR $171b ; (bnk_cpytovdc@proxy + 0)
5a2e : 4c 71 59 JMP $5971 ; (vdcwin_scroll_left.s8 + 0)
--------------------------------------------------------------------
vdcwin_scroll_down: ; vdcwin_scroll_down(struct VDCWin*,u8)->void
.s0:
5a31 : ad 5f 6e LDA $6e5f ; (vdc_state + 3)
5a34 : 85 49 __ STA T3 + 0 
5a36 : 85 1b __ STA ACCU + 0 
5a38 : ad 60 6e LDA $6e60 ; (vdc_state + 4)
5a3b : 85 4a __ STA T3 + 1 
5a3d : 85 1c __ STA ACCU + 1 
5a3f : a0 03 __ LDY #$03
5a41 : b1 15 __ LDA (P8),y ; (win + 0)
5a43 : 20 3e 65 JSR $653e ; (mul16by8 + 0)
5a46 : a0 06 __ LDY #$06
5a48 : b1 15 __ LDA (P8),y ; (win + 0)
5a4a : 18 __ __ CLC
5a4b : 65 05 __ ADC WORK + 2 
5a4d : 85 4b __ STA T4 + 0 
5a4f : c8 __ __ INY
5a50 : b1 15 __ LDA (P8),y ; (win + 0)
5a52 : 65 06 __ ADC WORK + 3 
5a54 : 85 4c __ STA T4 + 1 
5a56 : c8 __ __ INY
5a57 : b1 15 __ LDA (P8),y ; (win + 0)
5a59 : 18 __ __ CLC
5a5a : 65 05 __ ADC WORK + 2 
5a5c : 85 47 __ STA T2 + 0 
5a5e : c8 __ __ INY
5a5f : b1 15 __ LDA (P8),y ; (win + 0)
5a61 : 65 06 __ ADC WORK + 3 
5a63 : 85 48 __ STA T2 + 1 
5a65 : a9 00 __ LDA #$00
5a67 : 85 46 __ STA T1 + 0 
5a69 : a0 02 __ LDY #$02
5a6b : b1 15 __ LDA (P8),y ; (win + 0)
5a6d : 85 4d __ STA T6 + 0 
5a6f : 4c be 5a JMP $5abe ; (vdcwin_scroll_down.l1 + 0)
.s2:
5a72 : 38 __ __ SEC
5a73 : a5 4b __ LDA T4 + 0 
5a75 : ed 5f 6e SBC $6e5f ; (vdc_state + 3)
5a78 : 85 0f __ STA P2 
5a7a : 85 4b __ STA T4 + 0 
5a7c : a5 4c __ LDA T4 + 1 
5a7e : ed 60 6e SBC $6e60 ; (vdc_state + 4)
5a81 : 85 10 __ STA P3 
5a83 : 85 4c __ STA T4 + 1 
5a85 : 38 __ __ SEC
5a86 : a5 0f __ LDA P2 
5a88 : e5 49 __ SBC T3 + 0 
5a8a : 85 11 __ STA P4 
5a8c : a5 10 __ LDA P3 
5a8e : e5 4a __ SBC T3 + 1 
5a90 : 85 12 __ STA P5 
5a92 : a5 4d __ LDA T6 + 0 
5a94 : 85 13 __ STA P6 
5a96 : 20 76 68 JSR $6876 ; (vdc_block_copy@proxy + 0)
5a99 : 38 __ __ SEC
5a9a : a5 47 __ LDA T2 + 0 
5a9c : ed 5f 6e SBC $6e5f ; (vdc_state + 3)
5a9f : 85 47 __ STA T2 + 0 
5aa1 : 85 0f __ STA P2 
5aa3 : a5 48 __ LDA T2 + 1 
5aa5 : ed 60 6e SBC $6e60 ; (vdc_state + 4)
5aa8 : 85 48 __ STA T2 + 1 
5aaa : 85 10 __ STA P3 
5aac : 38 __ __ SEC
5aad : a5 0f __ LDA P2 
5aaf : e5 49 __ SBC T3 + 0 
5ab1 : 85 11 __ STA P4 
5ab3 : a5 10 __ LDA P3 
5ab5 : e5 4a __ SBC T3 + 1 
5ab7 : 85 12 __ STA P5 
5ab9 : 20 ba 47 JSR $47ba ; (vdc_block_copy.s0 + 0)
5abc : e6 46 __ INC T1 + 0 
.l1:
5abe : a0 03 __ LDY #$03
5ac0 : b1 15 __ LDA (P8),y ; (win + 0)
5ac2 : 38 __ __ SEC
5ac3 : e9 01 __ SBC #$01
5ac5 : 90 ab __ BCC $5a72 ; (vdcwin_scroll_down.s2 + 0)
.s1002:
5ac7 : c5 46 __ CMP T1 + 0 
5ac9 : 90 02 __ BCC $5acd ; (vdcwin_scroll_down.s1001 + 0)
.s1004:
5acb : d0 a5 __ BNE $5a72 ; (vdcwin_scroll_down.s2 + 0)
.s1001:
5acd : 60 __ __ RTS
--------------------------------------------------------------------
scroll_fullscreen_smooth: ; scroll_fullscreen_smooth(u8)->void
.s1000:
5ace : a5 53 __ LDA T0 + 0 
5ad0 : 8d cd bf STA $bfcd ; (bigfont + 178)
.s0:
5ad3 : ad ff bf LDA $bfff ; (sstack + 8)
5ad6 : 85 53 __ STA T0 + 0 
5ad8 : 8d fc bf STA $bffc ; (sstack + 5)
5adb : a9 00 __ LDA #$00
5add : 8d fd bf STA $bffd ; (sstack + 6)
5ae0 : a9 01 __ LDA #$01
5ae2 : 8d fe bf STA $bffe ; (sstack + 7)
5ae5 : 20 15 55 JSR $5515 ; (screen_switch.s1000 + 0)
5ae8 : a9 7f __ LDA #$7f
5aea : 8d ce bf STA $bfce ; (bigfont + 179)
5aed : a9 00 __ LDA #$00
5aef : 8d cf bf STA $bfcf ; (bigfont + 180)
5af2 : a9 40 __ LDA #$40
5af4 : 8d d0 bf STA $bfd0 ; (bigfont + 181)
5af7 : a5 53 __ LDA T0 + 0 
5af9 : 0a __ __ ASL
5afa : aa __ __ TAX
5afb : bd f4 69 LDA $69f4,x ; (screenset + 0)
5afe : 8d d1 bf STA $bfd1 ; (bigfont + 182)
5b01 : bd f5 69 LDA $69f5,x ; (screenset + 1)
5b04 : 8d d2 bf STA $bfd2 ; (bigfont + 183)
5b07 : ad 5e 6e LDA $6e5e ; (vdc_state + 2)
5b0a : 8d f7 bf STA $bff7 ; (sstack + 0)
5b0d : a9 ce __ LDA #$ce
5b0f : 85 17 __ STA P10 
5b11 : a9 bf __ LDA #$bf
5b13 : 85 18 __ STA P11 
5b15 : 20 df 5b JSR $5bdf ; (vdc_softscroll_init.s1000 + 0)
5b18 : a5 1b __ LDA ACCU + 0 
5b1a : d0 17 __ BNE $5b33 ; (scroll_fullscreen_smooth.l4 + 0)
.s3:
5b1c : a9 01 __ LDA #$01
5b1e : 8d fd bf STA $bffd ; (sstack + 6)
5b21 : 8d fe bf STA $bffe ; (sstack + 7)
5b24 : ad ff bf LDA $bfff ; (sstack + 8)
5b27 : 8d fc bf STA $bffc ; (sstack + 5)
5b2a : 20 15 55 JSR $5515 ; (screen_switch.s1000 + 0)
.s1001:
5b2d : ad cd bf LDA $bfcd ; (bigfont + 178)
5b30 : 85 53 __ STA T0 + 0 
5b32 : 60 __ __ RTS
.l4:
5b33 : 20 b6 2c JSR $2cb6 ; (getch.s0 + 0)
5b36 : 85 53 __ STA T0 + 0 
5b38 : c9 57 __ CMP #$57
5b3a : f0 04 __ BEQ $5b40 ; (scroll_fullscreen_smooth.s6 + 0)
.s9:
5b3c : c9 91 __ CMP #$91
5b3e : d0 10 __ BNE $5b50 ; (scroll_fullscreen_smooth.s8 + 0)
.s6:
5b40 : a9 ce __ LDA #$ce
5b42 : 85 0d __ STA P0 
5b44 : a9 bf __ LDA #$bf
5b46 : 85 0e __ STA P1 
5b48 : 20 88 5d JSR $5d88 ; (vdc_softscroll_up.l236 + 0)
5b4b : a5 53 __ LDA T0 + 0 
5b4d : 4c 54 5b JMP $5b54 ; (scroll_fullscreen_smooth.s13 + 0)
.s8:
5b50 : c9 53 __ CMP #$53
5b52 : f0 04 __ BEQ $5b58 ; (scroll_fullscreen_smooth.s10 + 0)
.s13:
5b54 : c9 11 __ CMP #$11
5b56 : d0 0b __ BNE $5b63 ; (scroll_fullscreen_smooth.s12 + 0)
.s10:
5b58 : a9 ce __ LDA #$ce
5b5a : 85 0d __ STA P0 
5b5c : a9 bf __ LDA #$bf
5b5e : 85 0e __ STA P1 
5b60 : 20 5b 5e JSR $5e5b ; (vdc_softscroll_down.l211 + 0)
.s12:
5b63 : a5 53 __ LDA T0 + 0 
5b65 : c9 41 __ CMP #$41
5b67 : f0 04 __ BEQ $5b6d ; (scroll_fullscreen_smooth.s14 + 0)
.s17:
5b69 : c9 9d __ CMP #$9d
5b6b : d0 0d __ BNE $5b7a ; (scroll_fullscreen_smooth.s16 + 0)
.s14:
5b6d : a9 ce __ LDA #$ce
5b6f : 85 0d __ STA P0 
5b71 : a9 bf __ LDA #$bf
5b73 : 85 0e __ STA P1 
5b75 : 20 35 5f JSR $5f35 ; (vdc_softscroll_left.s0 + 0)
5b78 : a5 53 __ LDA T0 + 0 
.s16:
5b7a : c9 44 __ CMP #$44
5b7c : f0 04 __ BEQ $5b82 ; (scroll_fullscreen_smooth.s18 + 0)
.s21:
5b7e : c9 1d __ CMP #$1d
5b80 : d0 0e __ BNE $5b90 ; (scroll_fullscreen_smooth.s20 + 0)
.s18:
5b82 : a9 ce __ LDA #$ce
5b84 : 85 0d __ STA P0 
5b86 : a9 bf __ LDA #$bf
5b88 : 85 0e __ STA P1 
5b8a : 20 f7 5f JSR $5ff7 ; (vdc_softscroll_right.s0 + 0)
5b8d : 4c 94 5b JMP $5b94 ; (scroll_fullscreen_smooth.s22 + 0)
.s20:
5b90 : c9 1b __ CMP #$1b
5b92 : f0 06 __ BEQ $5b9a ; (scroll_fullscreen_smooth.s5 + 0)
.s22:
5b94 : a5 53 __ LDA T0 + 0 
5b96 : c9 03 __ CMP #$03
5b98 : d0 99 __ BNE $5b33 ; (scroll_fullscreen_smooth.l4 + 0)
.s5:
5b9a : ad 5e 6e LDA $6e5e ; (vdc_state + 2)
5b9d : 85 53 __ STA T0 + 0 
5b9f : 20 7e 2b JSR $2b7e ; (vdc_cls.s0 + 0)
5ba2 : a9 1b __ LDA #$1b
5ba4 : 8d 00 d6 STA $d600 
.l131:
5ba7 : 2c 00 d6 BIT $d600 
5baa : 10 fb __ BPL $5ba7 ; (scroll_fullscreen_smooth.l131 + 0)
.s28:
5bac : a9 00 __ LDA #$00
5bae : 8d 01 d6 STA $d601 
5bb1 : a9 18 __ LDA #$18
5bb3 : 8d 00 d6 STA $d600 
5bb6 : ac d7 bf LDY $bfd7 ; (bigfont + 188)
.l133:
5bb9 : 2c 00 d6 BIT $d600 
5bbc : 10 fb __ BPL $5bb9 ; (scroll_fullscreen_smooth.l133 + 0)
.s33:
5bbe : 8c 01 d6 STY $d601 
5bc1 : a9 19 __ LDA #$19
5bc3 : 8d 00 d6 STA $d600 
5bc6 : ad db bf LDA $bfdb ; (bigfont + 192)
5bc9 : 18 __ __ CLC
5bca : 6d d8 bf ADC $bfd8 ; (bigfont + 189)
.l135:
5bcd : 2c 00 d6 BIT $d600 
5bd0 : 10 fb __ BPL $5bcd ; (scroll_fullscreen_smooth.l135 + 0)
.s38:
5bd2 : 8d 01 d6 STA $d601 
5bd5 : a5 53 __ LDA T0 + 0 
5bd7 : 85 16 __ STA P9 
5bd9 : 20 1a 2d JSR $2d1a ; (vdc_set_mode.s1000 + 0)
5bdc : 4c 1c 5b JMP $5b1c ; (scroll_fullscreen_smooth.s3 + 0)
--------------------------------------------------------------------
vdc_softscroll_init: ; vdc_softscroll_init(struct VDCSoftScrollSettings*,u8)->u8
.s1000:
5bdf : a2 03 __ LDX #$03
5be1 : b5 53 __ LDA T3 + 0,x 
5be3 : 9d ef bf STA $bfef,x ; (vp_fill + 30)
5be6 : ca __ __ DEX
5be7 : 10 f8 __ BPL $5be1 ; (vdc_softscroll_init.s1000 + 2)
.s0:
5be9 : a0 04 __ LDY #$04
5beb : b1 17 __ LDA (P10),y ; (settings + 0)
5bed : 85 1b __ STA ACCU + 0 
5bef : a9 00 __ LDA #$00
5bf1 : 85 1c __ STA ACCU + 1 
5bf3 : 88 __ __ DEY
5bf4 : b1 17 __ LDA (P10),y ; (settings + 0)
5bf6 : 85 50 __ STA T2 + 0 
5bf8 : 20 3e 65 JSR $653e ; (mul16by8 + 0)
5bfb : a5 05 __ LDA WORK + 2 
5bfd : 85 53 __ STA T3 + 0 
5bff : 0a __ __ ASL
5c00 : aa __ __ TAX
5c01 : a5 06 __ LDA WORK + 3 
5c03 : 85 54 __ STA T3 + 1 
5c05 : 2a __ __ ROL
5c06 : a8 __ __ TAY
5c07 : 8a __ __ TXA
5c08 : 18 __ __ CLC
5c09 : 69 30 __ ADC #$30
5c0b : 85 55 __ STA T4 + 0 
5c0d : 90 01 __ BCC $5c10 ; (vdc_softscroll_init.s1027 + 0)
.s1026:
5c0f : c8 __ __ INY
.s1027:
5c10 : 84 56 __ STY T4 + 1 
5c12 : a9 20 __ LDA #$20
5c14 : c5 56 __ CMP T4 + 1 
5c16 : d0 04 __ BNE $5c1c ; (vdc_softscroll_init.s1025 + 0)
.s1024:
5c18 : a9 00 __ LDA #$00
5c1a : c5 55 __ CMP T4 + 0 
.s1025:
5c1c : b0 08 __ BCS $5c26 ; (vdc_softscroll_init.s4 + 0)
.s5:
5c1e : ad 5d 6e LDA $6e5d ; (vdc_state + 1)
5c21 : d0 03 __ BNE $5c26 ; (vdc_softscroll_init.s4 + 0)
5c23 : 4c 84 5d JMP $5d84 ; (vdc_softscroll_init.s1 + 0)
.s4:
5c26 : a9 e0 __ LDA #$e0
5c28 : c5 56 __ CMP T4 + 1 
5c2a : d0 04 __ BNE $5c30 ; (vdc_softscroll_init.s1023 + 0)
.s1022:
5c2c : a9 00 __ LDA #$00
5c2e : c5 55 __ CMP T4 + 0 
.s1023:
5c30 : b0 03 __ BCS $5c35 ; (vdc_softscroll_init.s3 + 0)
5c32 : 4c 84 5d JMP $5d84 ; (vdc_softscroll_init.s1 + 0)
.s3:
5c35 : ad f7 bf LDA $bff7 ; (sstack + 0)
5c38 : 85 16 __ STA P9 
5c3a : 20 1a 2d JSR $2d1a ; (vdc_set_mode.s1000 + 0)
5c3d : a9 00 __ LDA #$00
5c3f : 8d 64 6e STA $6e64 ; (vdc_state + 8)
5c42 : 8d 6c 6e STA $6e6c ; (vdc_state + 16)
5c45 : 8d 6d 6e STA $6e6d ; (vdc_state + 17)
5c48 : 8d 6e 6e STA $6e6e ; (vdc_state + 18)
5c4b : a9 20 __ LDA #$20
5c4d : 8d 65 6e STA $6e65 ; (vdc_state + 9)
5c50 : a9 10 __ LDA #$10
5c52 : 8d 6f 6e STA $6e6f ; (vdc_state + 19)
5c55 : a5 53 __ LDA T3 + 0 
5c57 : 8d 66 6e STA $6e66 ; (vdc_state + 10)
5c5a : 18 __ __ CLC
5c5b : a5 54 __ LDA T3 + 1 
5c5d : 69 20 __ ADC #$20
5c5f : 85 56 __ STA T4 + 1 
5c61 : 8d 67 6e STA $6e67 ; (vdc_state + 11)
5c64 : 38 __ __ SEC
5c65 : a5 50 __ LDA T2 + 0 
5c67 : ed 5f 6e SBC $6e5f ; (vdc_state + 3)
5c6a : 85 50 __ STA T2 + 0 
5c6c : 8d 74 6e STA $6e74 ; (vdc_state + 24)
5c6f : 20 a0 2e JSR $2ea0 ; (vdc_set_multab.s0 + 0)
5c72 : 20 7e 2b JSR $2b7e ; (vdc_cls.s0 + 0)
5c75 : a9 1c __ LDA #$1c
5c77 : 8d 00 d6 STA $d600 
.l290:
5c7a : 2c 00 d6 BIT $d600 
5c7d : 10 fb __ BPL $5c7a ; (vdc_softscroll_init.l290 + 0)
.s13:
5c7f : ad 01 d6 LDA $d601 
5c82 : 29 10 __ AND #$10
5c84 : a2 1c __ LDX #$1c
5c86 : 8e 00 d6 STX $d600 
.l292:
5c89 : 2c 00 d6 BIT $d600 
5c8c : 10 fb __ BPL $5c89 ; (vdc_softscroll_init.l292 + 0)
.s19:
5c8e : 8d 01 d6 STA $d601 
5c91 : 20 f0 2e JSR $2ef0 ; (vdc_restore_charsets.s0 + 0)
5c94 : a9 0c __ LDA #$0c
5c96 : 8d 00 d6 STA $d600 
.l294:
5c99 : 2c 00 d6 BIT $d600 
5c9c : 10 fb __ BPL $5c99 ; (vdc_softscroll_init.l294 + 0)
.s25:
5c9e : a9 20 __ LDA #$20
5ca0 : 8d 01 d6 STA $d601 
5ca3 : a9 0d __ LDA #$0d
5ca5 : 8d 00 d6 STA $d600 
.l296:
5ca8 : 2c 00 d6 BIT $d600 
5cab : 10 fb __ BPL $5ca8 ; (vdc_softscroll_init.l296 + 0)
.s30:
5cad : a9 00 __ LDA #$00
5caf : 8d 01 d6 STA $d601 
5cb2 : a9 14 __ LDA #$14
5cb4 : 8d 00 d6 STA $d600 
.l298:
5cb7 : 2c 00 d6 BIT $d600 
5cba : 10 fb __ BPL $5cb7 ; (vdc_softscroll_init.l298 + 0)
.s35:
5cbc : a5 56 __ LDA T4 + 1 
5cbe : 8d 01 d6 STA $d601 
5cc1 : a9 15 __ LDA #$15
5cc3 : 8d 00 d6 STA $d600 
.l300:
5cc6 : 2c 00 d6 BIT $d600 
5cc9 : 10 fb __ BPL $5cc6 ; (vdc_softscroll_init.l300 + 0)
.s40:
5ccb : a5 53 __ LDA T3 + 0 
5ccd : 8d 01 d6 STA $d601 
5cd0 : a9 1b __ LDA #$1b
5cd2 : 8d 00 d6 STA $d600 
.l302:
5cd5 : 2c 00 d6 BIT $d600 
5cd8 : 10 fb __ BPL $5cd5 ; (vdc_softscroll_init.l302 + 0)
.s45:
5cda : a5 50 __ LDA T2 + 0 
5cdc : 8d 01 d6 STA $d601 
5cdf : a5 53 __ LDA T3 + 0 
5ce1 : 85 14 __ STA P7 
5ce3 : a9 20 __ LDA #$20
5ce5 : 85 10 __ STA P3 
5ce7 : a5 54 __ LDA T3 + 1 
5ce9 : 85 15 __ STA P8 
5ceb : a0 00 __ LDY #$00
5ced : 84 0f __ STY P2 
5cef : b1 17 __ LDA (P10),y ; (settings + 0)
5cf1 : 85 11 __ STA P4 
5cf3 : c8 __ __ INY
5cf4 : b1 17 __ LDA (P10),y ; (settings + 0)
5cf6 : 85 50 __ STA T2 + 0 
5cf8 : 85 12 __ STA P5 
5cfa : c8 __ __ INY
5cfb : b1 17 __ LDA (P10),y ; (settings + 0)
5cfd : 85 51 __ STA T2 + 1 
5cff : 85 13 __ STA P6 
5d01 : 20 2b 17 JSR $172b ; (bnk_cpytovdc.s0 + 0)
5d04 : a5 56 __ LDA T4 + 1 
5d06 : 85 10 __ STA P3 
5d08 : a5 14 __ LDA P7 
5d0a : 85 0f __ STA P2 
5d0c : 18 __ __ CLC
5d0d : 65 50 __ ADC T2 + 0 
5d0f : aa __ __ TAX
5d10 : a5 54 __ LDA T3 + 1 
5d12 : 85 15 __ STA P8 
5d14 : 65 51 __ ADC T2 + 1 
5d16 : a8 __ __ TAY
5d17 : 8a __ __ TXA
5d18 : 18 __ __ CLC
5d19 : 69 30 __ ADC #$30
5d1b : 85 12 __ STA P5 
5d1d : 90 01 __ BCC $5d20 ; (vdc_softscroll_init.s1029 + 0)
.s1028:
5d1f : c8 __ __ INY
.s1029:
5d20 : 84 13 __ STY P6 
5d22 : 20 2b 17 JSR $172b ; (bnk_cpytovdc.s0 + 0)
5d25 : a9 00 __ LDA #$00
5d27 : a0 05 __ LDY #$05
5d29 : 91 17 __ STA (P10),y ; (settings + 0)
5d2b : c8 __ __ INY
5d2c : 91 17 __ STA (P10),y ; (settings + 0)
5d2e : c8 __ __ INY
5d2f : 91 17 __ STA (P10),y ; (settings + 0)
5d31 : c8 __ __ INY
5d32 : 91 17 __ STA (P10),y ; (settings + 0)
5d34 : a9 18 __ LDA #$18
5d36 : 8d 00 d6 STA $d600 
.l304:
5d39 : 2c 00 d6 BIT $d600 
5d3c : 10 fb __ BPL $5d39 ; (vdc_softscroll_init.l304 + 0)
.s50:
5d3e : ad 01 d6 LDA $d601 
5d41 : 29 f0 __ AND #$f0
5d43 : a0 09 __ LDY #$09
5d45 : 91 17 __ STA (P10),y ; (settings + 0)
5d47 : a2 19 __ LDX #$19
5d49 : 8e 00 d6 STX $d600 
.l306:
5d4c : 2c 00 d6 BIT $d600 
5d4f : 10 fb __ BPL $5d4c ; (vdc_softscroll_init.l306 + 0)
.s57:
5d51 : ad 01 d6 LDA $d601 
5d54 : 29 0f __ AND #$0f
5d56 : a0 0d __ LDY #$0d
5d58 : 91 17 __ STA (P10),y ; (settings + 0)
5d5a : 8e 00 d6 STX $d600 
.l308:
5d5d : 2c 00 d6 BIT $d600 
5d60 : 10 fb __ BPL $5d5d ; (vdc_softscroll_init.l308 + 0)
.s64:
5d62 : a9 00 __ LDA #$00
5d64 : ae 01 d6 LDX $d601 
5d67 : a0 0b __ LDY #$0b
5d69 : 91 17 __ STA (P10),y ; (settings + 0)
5d6b : c8 __ __ INY
5d6c : 91 17 __ STA (P10),y ; (settings + 0)
5d6e : 8a __ __ TXA
5d6f : 29 f0 __ AND #$f0
5d71 : a0 0a __ LDY #$0a
5d73 : 91 17 __ STA (P10),y ; (settings + 0)
5d75 : a9 01 __ LDA #$01
.s1001:
5d77 : 85 1b __ STA ACCU + 0 
5d79 : a2 03 __ LDX #$03
5d7b : bd ef bf LDA $bfef,x ; (vp_fill + 30)
5d7e : 95 53 __ STA T3 + 0,x 
5d80 : ca __ __ DEX
5d81 : 10 f8 __ BPL $5d7b ; (vdc_softscroll_init.s1001 + 4)
5d83 : 60 __ __ RTS
.s1:
5d84 : a9 00 __ LDA #$00
5d86 : 90 ef __ BCC $5d77 ; (vdc_softscroll_init.s1001 + 0)
--------------------------------------------------------------------
vdc_softscroll_up: ; vdc_softscroll_up(struct VDCSoftScrollSettings*,u8)->void
.l236:
5d88 : ad 00 d6 LDA $d600 
5d8b : 29 20 __ AND #$20
5d8d : f0 f9 __ BEQ $5d88 ; (vdc_softscroll_up.l236 + 0)
.l6:
5d8f : ad 00 d6 LDA $d600 
5d92 : 29 20 __ AND #$20
5d94 : d0 f9 __ BNE $5d8f ; (vdc_softscroll_up.l6 + 0)
.s1:
5d96 : a0 07 __ LDY #$07
5d98 : b1 0d __ LDA (P0),y ; (settings + 0)
5d9a : c9 02 __ CMP #$02
5d9c : 90 03 __ BCC $5da1 ; (vdc_softscroll_up.s9 + 0)
5d9e : 4c 43 5e JMP $5e43 ; (vdc_softscroll_up.s8 + 0)
.s9:
5da1 : a0 0c __ LDY #$0c
5da3 : b1 0d __ LDA (P0),y ; (settings + 0)
5da5 : d0 01 __ BNE $5da8 ; (vdc_softscroll_up.s16 + 0)
.s1001:
5da7 : 60 __ __ RTS
.s16:
5da8 : aa __ __ TAX
5da9 : a9 06 __ LDA #$06
5dab : a0 07 __ LDY #$07
5dad : 91 0d __ STA (P0),y ; (settings + 0)
5daf : ca __ __ DEX
5db0 : 8a __ __ TXA
5db1 : a0 0c __ LDY #$0c
5db3 : 91 0d __ STA (P0),y ; (settings + 0)
5db5 : a0 03 __ LDY #$03
5db7 : b1 0d __ LDA (P0),y ; (settings + 0)
5db9 : 85 1b __ STA ACCU + 0 
5dbb : 38 __ __ SEC
5dbc : a0 05 __ LDY #$05
5dbe : b1 0d __ LDA (P0),y ; (settings + 0)
5dc0 : e5 1b __ SBC ACCU + 0 
5dc2 : 85 43 __ STA T3 + 0 
5dc4 : 91 0d __ STA (P0),y ; (settings + 0)
5dc6 : c8 __ __ INY
5dc7 : b1 0d __ LDA (P0),y ; (settings + 0)
5dc9 : e9 00 __ SBC #$00
5dcb : 85 44 __ STA T3 + 1 
5dcd : 91 0d __ STA (P0),y ; (settings + 0)
.l242:
5dcf : ad 00 d6 LDA $d600 
5dd2 : 29 20 __ AND #$20
5dd4 : d0 f9 __ BNE $5dcf ; (vdc_softscroll_up.l242 + 0)
.s19:
5dd6 : a0 07 __ LDY #$07
5dd8 : b1 0d __ LDA (P0),y ; (settings + 0)
5dda : aa __ __ TAX
5ddb : a0 09 __ LDY #$09
5ddd : b1 0d __ LDA (P0),y ; (settings + 0)
5ddf : 85 1b __ STA ACCU + 0 
5de1 : a9 18 __ LDA #$18
5de3 : 8d 00 d6 STA $d600 
5de6 : 8a __ __ TXA
5de7 : 18 __ __ CLC
5de8 : 65 1b __ ADC ACCU + 0 
.l244:
5dea : 2c 00 d6 BIT $d600 
5ded : 10 fb __ BPL $5dea ; (vdc_softscroll_up.l244 + 0)
.s26:
5def : 8d 01 d6 STA $d601 
5df2 : ad 66 6e LDA $6e66 ; (vdc_state + 10)
5df5 : 18 __ __ CLC
5df6 : 65 43 __ ADC T3 + 0 
5df8 : aa __ __ TAX
5df9 : ad 67 6e LDA $6e67 ; (vdc_state + 11)
5dfc : 65 44 __ ADC T3 + 1 
5dfe : a8 __ __ TAY
5dff : ad 64 6e LDA $6e64 ; (vdc_state + 8)
5e02 : 18 __ __ CLC
5e03 : 65 43 __ ADC T3 + 0 
5e05 : 85 43 __ STA T3 + 0 
5e07 : a9 0c __ LDA #$0c
5e09 : 8d 00 d6 STA $d600 
5e0c : ad 65 6e LDA $6e65 ; (vdc_state + 9)
5e0f : 65 44 __ ADC T3 + 1 
.l246:
5e11 : 2c 00 d6 BIT $d600 
5e14 : 10 fb __ BPL $5e11 ; (vdc_softscroll_up.l246 + 0)
.s32:
5e16 : 8d 01 d6 STA $d601 
5e19 : a9 0d __ LDA #$0d
5e1b : 8d 00 d6 STA $d600 
.l248:
5e1e : 2c 00 d6 BIT $d600 
5e21 : 10 fb __ BPL $5e1e ; (vdc_softscroll_up.l248 + 0)
.s37:
5e23 : a5 43 __ LDA T3 + 0 
5e25 : 8d 01 d6 STA $d601 
5e28 : a9 14 __ LDA #$14
5e2a : 8d 00 d6 STA $d600 
.l250:
5e2d : 2c 00 d6 BIT $d600 
5e30 : 10 fb __ BPL $5e2d ; (vdc_softscroll_up.l250 + 0)
.s42:
5e32 : 8c 01 d6 STY $d601 
5e35 : a9 15 __ LDA #$15
5e37 : 8d 00 d6 STA $d600 
.l239:
5e3a : 2c 00 d6 BIT $d600 
5e3d : 10 fb __ BPL $5e3a ; (vdc_softscroll_up.l239 + 0)
.s427:
5e3f : 8e 01 d6 STX $d601 
5e42 : 60 __ __ RTS
.s8:
5e43 : e9 02 __ SBC #$02
5e45 : 91 0d __ STA (P0),y ; (settings + 0)
5e47 : aa __ __ TAX
5e48 : a0 09 __ LDY #$09
5e4a : b1 0d __ LDA (P0),y ; (settings + 0)
5e4c : 85 1b __ STA ACCU + 0 
5e4e : a9 18 __ LDA #$18
5e50 : 8d 00 d6 STA $d600 
5e53 : 8a __ __ TXA
5e54 : 18 __ __ CLC
5e55 : 65 1b __ ADC ACCU + 0 
5e57 : aa __ __ TAX
5e58 : 4c 3a 5e JMP $5e3a ; (vdc_softscroll_up.l239 + 0)
--------------------------------------------------------------------
vdc_softscroll_down: ; vdc_softscroll_down(struct VDCSoftScrollSettings*,u8)->void
.l211:
5e5b : ad 00 d6 LDA $d600 
5e5e : 29 20 __ AND #$20
5e60 : f0 f9 __ BEQ $5e5b ; (vdc_softscroll_down.l211 + 0)
.l6:
5e62 : ad 00 d6 LDA $d600 
5e65 : 29 20 __ AND #$20
5e67 : d0 f9 __ BNE $5e62 ; (vdc_softscroll_down.l6 + 0)
.s1:
5e69 : a0 07 __ LDY #$07
5e6b : b1 0d __ LDA (P0),y ; (settings + 0)
5e6d : aa __ __ TAX
5e6e : 18 __ __ CLC
5e6f : 69 02 __ ADC #$02
5e71 : 91 0d __ STA (P0),y ; (settings + 0)
5e73 : c9 07 __ CMP #$07
5e75 : b0 13 __ BCS $5e8a ; (vdc_softscroll_down.s8 + 0)
.s9:
5e77 : a0 09 __ LDY #$09
5e79 : 71 0d __ ADC (P0),y ; (settings + 0)
5e7b : aa __ __ TAX
5e7c : a9 18 __ LDA #$18
.s1018:
5e7e : 8d 00 d6 STA $d600 
.l223:
5e81 : 2c 00 d6 BIT $d600 
5e84 : 10 fb __ BPL $5e81 ; (vdc_softscroll_down.l223 + 0)
.s384:
5e86 : 8e 01 d6 STX $d601 
.s1001:
5e89 : 60 __ __ RTS
.s8:
5e8a : a0 04 __ LDY #$04
5e8c : b1 0d __ LDA (P0),y ; (settings + 0)
5e8e : ed 61 6e SBC $6e61 ; (vdc_state + 5)
5e91 : a8 __ __ TAY
5e92 : a9 00 __ LDA #$00
5e94 : ed 62 6e SBC $6e62 ; (vdc_state + 6)
5e97 : 85 44 __ STA T4 + 1 
5e99 : 98 __ __ TYA
5e9a : 38 __ __ SEC
5e9b : e9 01 __ SBC #$01
5e9d : 85 43 __ STA T4 + 0 
5e9f : a0 0c __ LDY #$0c
5ea1 : b1 0d __ LDA (P0),y ; (settings + 0)
5ea3 : 85 1b __ STA ACCU + 0 
5ea5 : a5 44 __ LDA T4 + 1 
5ea7 : e9 00 __ SBC #$00
5ea9 : d0 0c __ BNE $5eb7 ; (vdc_softscroll_down.s11 + 0)
.s1014:
5eab : a5 1b __ LDA ACCU + 0 
5ead : c5 43 __ CMP T4 + 0 
5eaf : 90 06 __ BCC $5eb7 ; (vdc_softscroll_down.s11 + 0)
.s12:
5eb1 : 8a __ __ TXA
5eb2 : a0 07 __ LDY #$07
5eb4 : 91 0d __ STA (P0),y ; (settings + 0)
5eb6 : 60 __ __ RTS
.s11:
5eb7 : a9 00 __ LDA #$00
5eb9 : a0 07 __ LDY #$07
5ebb : 91 0d __ STA (P0),y ; (settings + 0)
5ebd : 18 __ __ CLC
5ebe : a5 1b __ LDA ACCU + 0 
5ec0 : 69 01 __ ADC #$01
5ec2 : a0 0c __ LDY #$0c
5ec4 : 91 0d __ STA (P0),y ; (settings + 0)
5ec6 : a0 03 __ LDY #$03
5ec8 : b1 0d __ LDA (P0),y ; (settings + 0)
5eca : 18 __ __ CLC
5ecb : a0 05 __ LDY #$05
5ecd : 71 0d __ ADC (P0),y ; (settings + 0)
5ecf : 85 43 __ STA T4 + 0 
5ed1 : 91 0d __ STA (P0),y ; (settings + 0)
5ed3 : c8 __ __ INY
5ed4 : b1 0d __ LDA (P0),y ; (settings + 0)
5ed6 : 69 00 __ ADC #$00
5ed8 : 85 44 __ STA T4 + 1 
5eda : 91 0d __ STA (P0),y ; (settings + 0)
5edc : a0 09 __ LDY #$09
5ede : b1 0d __ LDA (P0),y ; (settings + 0)
5ee0 : a2 18 __ LDX #$18
5ee2 : 8e 00 d6 STX $d600 
.l215:
5ee5 : 2c 00 d6 BIT $d600 
5ee8 : 10 fb __ BPL $5ee5 ; (vdc_softscroll_down.l215 + 0)
.s18:
5eea : 8d 01 d6 STA $d601 
5eed : ad 66 6e LDA $6e66 ; (vdc_state + 10)
5ef0 : 18 __ __ CLC
5ef1 : 65 43 __ ADC T4 + 0 
5ef3 : aa __ __ TAX
5ef4 : ad 67 6e LDA $6e67 ; (vdc_state + 11)
5ef7 : 65 44 __ ADC T4 + 1 
5ef9 : a8 __ __ TAY
5efa : ad 64 6e LDA $6e64 ; (vdc_state + 8)
5efd : 18 __ __ CLC
5efe : 65 43 __ ADC T4 + 0 
5f00 : 85 43 __ STA T4 + 0 
5f02 : a9 0c __ LDA #$0c
5f04 : 8d 00 d6 STA $d600 
5f07 : ad 65 6e LDA $6e65 ; (vdc_state + 9)
5f0a : 65 44 __ ADC T4 + 1 
.l217:
5f0c : 2c 00 d6 BIT $d600 
5f0f : 10 fb __ BPL $5f0c ; (vdc_softscroll_down.l217 + 0)
.s24:
5f11 : 8d 01 d6 STA $d601 
5f14 : a9 0d __ LDA #$0d
5f16 : 8d 00 d6 STA $d600 
.l219:
5f19 : 2c 00 d6 BIT $d600 
5f1c : 10 fb __ BPL $5f19 ; (vdc_softscroll_down.l219 + 0)
.s29:
5f1e : a5 43 __ LDA T4 + 0 
5f20 : 8d 01 d6 STA $d601 
5f23 : a9 14 __ LDA #$14
5f25 : 8d 00 d6 STA $d600 
.l221:
5f28 : 2c 00 d6 BIT $d600 
5f2b : 10 fb __ BPL $5f28 ; (vdc_softscroll_down.l221 + 0)
.s34:
5f2d : 8c 01 d6 STY $d601 
5f30 : a9 15 __ LDA #$15
5f32 : 4c 7e 5e JMP $5e7e ; (vdc_softscroll_down.s1018 + 0)
--------------------------------------------------------------------
vdc_softscroll_left: ; vdc_softscroll_left(struct VDCSoftScrollSettings*,u8)->void
.s0:
5f35 : 18 __ __ CLC
5f36 : a0 08 __ LDY #$08
5f38 : b1 0d __ LDA (P0),y ; (settings + 0)
5f3a : 69 02 __ ADC #$02
5f3c : 91 0d __ STA (P0),y ; (settings + 0)
5f3e : c9 07 __ CMP #$07
5f40 : 90 10 __ BCC $5f52 ; (vdc_softscroll_left.s1019 + 0)
.s1:
5f42 : a0 0d __ LDY #$0d
5f44 : b1 0d __ LDA (P0),y ; (settings + 0)
5f46 : aa __ __ TAX
5f47 : a0 0b __ LDY #$0b
5f49 : b1 0d __ LDA (P0),y ; (settings + 0)
5f4b : d0 18 __ BNE $5f65 ; (vdc_softscroll_left.s4 + 0)
.s5:
5f4d : 8a __ __ TXA
5f4e : a0 08 __ LDY #$08
5f50 : 91 0d __ STA (P0),y ; (settings + 0)
.s1019:
5f52 : 18 __ __ CLC
5f53 : a0 0a __ LDY #$0a
5f55 : 71 0d __ ADC (P0),y ; (settings + 0)
.s1018:
5f57 : a2 19 __ LDX #$19
5f59 : 8e 00 d6 STX $d600 
.l277:
5f5c : 2c 00 d6 BIT $d600 
5f5f : 10 fb __ BPL $5f5c ; (vdc_softscroll_left.l277 + 0)
.s479:
5f61 : 8d 01 d6 STA $d601 
.s1001:
5f64 : 60 __ __ RTS
.s4:
5f65 : 85 1b __ STA ACCU + 0 
5f67 : 8a __ __ TXA
5f68 : 29 01 __ AND #$01
5f6a : a0 08 __ LDY #$08
5f6c : 91 0d __ STA (P0),y ; (settings + 0)
5f6e : 18 __ __ CLC
5f6f : a5 1b __ LDA ACCU + 0 
5f71 : 69 ff __ ADC #$ff
5f73 : a0 0b __ LDY #$0b
5f75 : 91 0d __ STA (P0),y ; (settings + 0)
5f77 : 18 __ __ CLC
5f78 : a0 05 __ LDY #$05
5f7a : b1 0d __ LDA (P0),y ; (settings + 0)
5f7c : 69 ff __ ADC #$ff
5f7e : 85 1b __ STA ACCU + 0 
5f80 : 91 0d __ STA (P0),y ; (settings + 0)
5f82 : c8 __ __ INY
5f83 : b1 0d __ LDA (P0),y ; (settings + 0)
5f85 : 69 ff __ ADC #$ff
5f87 : 85 1c __ STA ACCU + 1 
5f89 : 91 0d __ STA (P0),y ; (settings + 0)
.l265:
5f8b : ad 00 d6 LDA $d600 
5f8e : 29 20 __ AND #$20
5f90 : d0 f9 __ BNE $5f8b ; (vdc_softscroll_left.l265 + 0)
.s7:
5f92 : ad 66 6e LDA $6e66 ; (vdc_state + 10)
5f95 : 18 __ __ CLC
5f96 : 65 1b __ ADC ACCU + 0 
5f98 : aa __ __ TAX
5f99 : ad 67 6e LDA $6e67 ; (vdc_state + 11)
5f9c : 65 1c __ ADC ACCU + 1 
5f9e : a8 __ __ TAY
5f9f : ad 64 6e LDA $6e64 ; (vdc_state + 8)
5fa2 : 18 __ __ CLC
5fa3 : 65 1b __ ADC ACCU + 0 
5fa5 : 85 1b __ STA ACCU + 0 
5fa7 : a9 0c __ LDA #$0c
5fa9 : 8d 00 d6 STA $d600 
5fac : ad 65 6e LDA $6e65 ; (vdc_state + 9)
5faf : 65 1c __ ADC ACCU + 1 
.l267:
5fb1 : 2c 00 d6 BIT $d600 
5fb4 : 10 fb __ BPL $5fb1 ; (vdc_softscroll_left.l267 + 0)
.s15:
5fb6 : 8d 01 d6 STA $d601 
5fb9 : a9 0d __ LDA #$0d
5fbb : 8d 00 d6 STA $d600 
.l269:
5fbe : 2c 00 d6 BIT $d600 
5fc1 : 10 fb __ BPL $5fbe ; (vdc_softscroll_left.l269 + 0)
.s20:
5fc3 : a5 1b __ LDA ACCU + 0 
5fc5 : 8d 01 d6 STA $d601 
5fc8 : a9 14 __ LDA #$14
5fca : 8d 00 d6 STA $d600 
.l271:
5fcd : 2c 00 d6 BIT $d600 
5fd0 : 10 fb __ BPL $5fcd ; (vdc_softscroll_left.l271 + 0)
.s25:
5fd2 : 8c 01 d6 STY $d601 
5fd5 : a9 15 __ LDA #$15
5fd7 : 8d 00 d6 STA $d600 
.l273:
5fda : 2c 00 d6 BIT $d600 
5fdd : 10 fb __ BPL $5fda ; (vdc_softscroll_left.l273 + 0)
.s30:
5fdf : 8e 01 d6 STX $d601 
.l275:
5fe2 : ad 00 d6 LDA $d600 
5fe5 : 29 20 __ AND #$20
5fe7 : f0 f9 __ BEQ $5fe2 ; (vdc_softscroll_left.l275 + 0)
.l36:
5fe9 : ad 00 d6 LDA $d600 
5fec : 29 20 __ AND #$20
5fee : d0 f9 __ BNE $5fe9 ; (vdc_softscroll_left.l36 + 0)
.s31:
5ff0 : a0 0a __ LDY #$0a
5ff2 : b1 0d __ LDA (P0),y ; (settings + 0)
5ff4 : 4c 57 5f JMP $5f57 ; (vdc_softscroll_left.s1018 + 0)
--------------------------------------------------------------------
vdc_softscroll_right: ; vdc_softscroll_right(struct VDCSoftScrollSettings*,u8)->void
.s0:
5ff7 : a0 08 __ LDY #$08
5ff9 : b1 0d __ LDA (P0),y ; (settings + 0)
5ffb : c9 02 __ CMP #$02
5ffd : 90 03 __ BCC $6002 ; (vdc_softscroll_right.s2 + 0)
5fff : 4c cb 60 JMP $60cb ; (vdc_softscroll_right.s1 + 0)
.s2:
6002 : a0 03 __ LDY #$03
6004 : b1 0d __ LDA (P0),y ; (settings + 0)
6006 : 38 __ __ SEC
6007 : ed 5f 6e SBC $6e5f ; (vdc_state + 3)
600a : 85 43 __ STA T3 + 0 
600c : a9 00 __ LDA #$00
600e : ed 60 6e SBC $6e60 ; (vdc_state + 4)
6011 : 85 44 __ STA T3 + 1 
6013 : a0 0b __ LDY #$0b
6015 : b1 0d __ LDA (P0),y ; (settings + 0)
6017 : 85 1b __ STA ACCU + 0 
6019 : 18 __ __ CLC
601a : 69 01 __ ADC #$01
601c : aa __ __ TAX
601d : a9 00 __ LDA #$00
601f : 2a __ __ ROL
6020 : c5 44 __ CMP T3 + 1 
6022 : d0 02 __ BNE $6026 ; (vdc_softscroll_right.s1013 + 0)
.s1012:
6024 : e4 43 __ CPX T3 + 0 
.s1013:
6026 : 90 01 __ BCC $6029 ; (vdc_softscroll_right.s12 + 0)
.s1001:
6028 : 60 __ __ RTS
.s12:
6029 : a0 0d __ LDY #$0d
602b : b1 0d __ LDA (P0),y ; (settings + 0)
602d : 29 01 __ AND #$01
602f : 09 06 __ ORA #$06
6031 : a0 08 __ LDY #$08
6033 : 91 0d __ STA (P0),y ; (settings + 0)
6035 : a6 1b __ LDX ACCU + 0 
6037 : e8 __ __ INX
6038 : 8a __ __ TXA
6039 : a0 0b __ LDY #$0b
603b : 91 0d __ STA (P0),y ; (settings + 0)
603d : a0 05 __ LDY #$05
603f : b1 0d __ LDA (P0),y ; (settings + 0)
6041 : 69 01 __ ADC #$01
6043 : 85 43 __ STA T3 + 0 
6045 : 91 0d __ STA (P0),y ; (settings + 0)
6047 : c8 __ __ INY
6048 : b1 0d __ LDA (P0),y ; (settings + 0)
604a : 69 00 __ ADC #$00
604c : 85 44 __ STA T3 + 1 
604e : 91 0d __ STA (P0),y ; (settings + 0)
.l251:
6050 : ad 00 d6 LDA $d600 
6053 : 29 20 __ AND #$20
6055 : d0 f9 __ BNE $6050 ; (vdc_softscroll_right.l251 + 0)
.s15:
6057 : ad 66 6e LDA $6e66 ; (vdc_state + 10)
605a : 18 __ __ CLC
605b : 65 43 __ ADC T3 + 0 
605d : aa __ __ TAX
605e : ad 67 6e LDA $6e67 ; (vdc_state + 11)
6061 : 65 44 __ ADC T3 + 1 
6063 : a8 __ __ TAY
6064 : ad 64 6e LDA $6e64 ; (vdc_state + 8)
6067 : 18 __ __ CLC
6068 : 65 43 __ ADC T3 + 0 
606a : 85 43 __ STA T3 + 0 
606c : a9 0c __ LDA #$0c
606e : 8d 00 d6 STA $d600 
6071 : ad 65 6e LDA $6e65 ; (vdc_state + 9)
6074 : 65 44 __ ADC T3 + 1 
.l253:
6076 : 2c 00 d6 BIT $d600 
6079 : 10 fb __ BPL $6076 ; (vdc_softscroll_right.l253 + 0)
.s23:
607b : 8d 01 d6 STA $d601 
607e : a9 0d __ LDA #$0d
6080 : 8d 00 d6 STA $d600 
.l255:
6083 : 2c 00 d6 BIT $d600 
6086 : 10 fb __ BPL $6083 ; (vdc_softscroll_right.l255 + 0)
.s28:
6088 : a5 43 __ LDA T3 + 0 
608a : 8d 01 d6 STA $d601 
608d : a9 14 __ LDA #$14
608f : 8d 00 d6 STA $d600 
.l257:
6092 : 2c 00 d6 BIT $d600 
6095 : 10 fb __ BPL $6092 ; (vdc_softscroll_right.l257 + 0)
.s33:
6097 : 8c 01 d6 STY $d601 
609a : a9 15 __ LDA #$15
609c : 8d 00 d6 STA $d600 
.l259:
609f : 2c 00 d6 BIT $d600 
60a2 : 10 fb __ BPL $609f ; (vdc_softscroll_right.l259 + 0)
.s38:
60a4 : 8e 01 d6 STX $d601 
.l261:
60a7 : ad 00 d6 LDA $d600 
60aa : 29 20 __ AND #$20
60ac : f0 f9 __ BEQ $60a7 ; (vdc_softscroll_right.l261 + 0)
.s39:
60ae : a0 08 __ LDY #$08
.s1018:
60b0 : b1 0d __ LDA (P0),y ; (settings + 0)
60b2 : aa __ __ TAX
60b3 : a0 0a __ LDY #$0a
60b5 : b1 0d __ LDA (P0),y ; (settings + 0)
60b7 : 85 1b __ STA ACCU + 0 
60b9 : a9 19 __ LDA #$19
60bb : 8d 00 d6 STA $d600 
60be : 8a __ __ TXA
60bf : 18 __ __ CLC
60c0 : 65 1b __ ADC ACCU + 0 
.l247:
60c2 : 2c 00 d6 BIT $d600 
60c5 : 10 fb __ BPL $60c2 ; (vdc_softscroll_right.l247 + 0)
.s437:
60c7 : 8d 01 d6 STA $d601 
60ca : 60 __ __ RTS
.s1:
60cb : e9 02 __ SBC #$02
60cd : 91 0d __ STA (P0),y ; (settings + 0)
.l246:
60cf : ad 00 d6 LDA $d600 
60d2 : 29 20 __ AND #$20
60d4 : f0 f9 __ BEQ $60cf ; (vdc_softscroll_right.l246 + 0)
60d6 : 4c b0 60 JMP $60b0 ; (vdc_softscroll_right.s1018 + 0)
--------------------------------------------------------------------
scroll_bigfont: ; scroll_bigfont()->void
.s1000:
60d9 : a5 53 __ LDA T0 + 0 
60db : 8d 3c be STA $be3c ; (scroll_bigfont@stack + 0)
60de : a5 54 __ LDA T0 + 1 
60e0 : 8d 3d be STA $be3d ; (scroll_bigfont@stack + 1)
.s0:
60e3 : a9 02 __ LDA #$02
60e5 : 85 14 __ STA P7 
60e7 : 8d 08 bf STA $bf08 ; (color + 4)
60ea : a9 00 __ LDA #$00
60ec : 85 0f __ STA P2 
60ee : a9 20 __ LDA #$20
60f0 : 85 11 __ STA P4 
60f2 : a9 50 __ LDA #$50
60f4 : 85 13 __ STA P6 
60f6 : a9 0e __ LDA #$0e
60f8 : 8d 04 bf STA $bf04 ; (color + 0)
60fb : a9 07 __ LDA #$07
60fd : 8d 05 bf STA $bf05 ; (color + 1)
6100 : a9 06 __ LDA #$06
6102 : 8d 06 bf STA $bf06 ; (color + 2)
6105 : a9 03 __ LDA #$03
6107 : 8d 07 bf STA $bf07 ; (color + 3)
610a : a2 c3 __ LDX #$c3
.l1002:
610c : bd ff 6e LDA $6eff,x 
610f : 9d 40 be STA $be40,x ; (scroll_bigfont@stack + 4)
6112 : ca __ __ DEX
6113 : d0 f7 __ BNE $610c ; (scroll_bigfont.l1002 + 0)
.s1003:
6115 : ad 61 6e LDA $6e61 ; (vdc_state + 5)
6118 : 85 53 __ STA T0 + 0 
611a : 38 __ __ SEC
611b : e9 02 __ SBC #$02
611d : 85 15 __ STA P8 
611f : ad 62 6e LDA $6e62 ; (vdc_state + 6)
6122 : 85 54 __ STA T0 + 1 
6124 : 20 92 2b JSR $2b92 ; (vdc_clear.s0 + 0)
6127 : a9 cc __ LDA #$cc
6129 : 85 11 __ STA P4 
612b : a9 61 __ LDA #$61
612d : 85 12 __ STA P5 
612f : 20 de 68 JSR $68de ; (vdc_prints_attr@proxy + 0)
6132 : e6 10 __ INC P3 
6134 : a9 00 __ LDA #$00
6136 : 85 11 __ STA P4 
6138 : a9 62 __ LDA #$62
613a : 85 12 __ STA P5 
613c : 20 02 30 JSR $3002 ; (vdc_prints_attr.s0 + 0)
613f : a9 61 __ LDA #$61
6141 : 85 13 __ STA P6 
6143 : a9 a0 __ LDA #$a0
6145 : 85 11 __ STA P4 
6147 : a9 da __ LDA #$da
6149 : 85 12 __ STA P5 
614b : 20 13 18 JSR $1813 ; (bnk_load@proxy + 0)
614e : a5 1b __ LDA ACCU + 0 
6150 : d0 06 __ BNE $6158 ; (scroll_bigfont.s5 + 0)
.s3:
6152 : 20 9b 31 JSR $319b ; (menu_fileerrormessage.s1000 + 0)
6155 : 4c c1 61 JMP $61c1 ; (scroll_bigfont.s1001 + 0)
.s5:
6158 : 20 00 69 JSR $6900 ; (vdc_clear@proxy + 0)
615b : a9 1b __ LDA #$1b
615d : 85 0d __ STA P0 
615f : a9 bf __ LDA #$bf
6161 : 85 10 __ STA P3 
6163 : a9 bf __ LDA #$bf
6165 : 85 0e __ STA P1 
6167 : a9 04 __ LDA #$04
6169 : 85 0f __ STA P2 
616b : 20 3a 62 JSR $623a ; (txtscr_bigfont_init.s0 + 0)
616e : 46 54 __ LSR T0 + 1 
6170 : a9 1b __ LDA #$1b
6172 : 8d f7 bf STA $bff7 ; (sstack + 0)
6175 : a9 bf __ LDA #$bf
6177 : 8d f8 bf STA $bff8 ; (sstack + 1)
617a : a9 09 __ LDA #$09
617c : 85 17 __ STA P10 
617e : a9 bf __ LDA #$bf
6180 : 85 18 __ STA P11 
6182 : a9 41 __ LDA #$41
6184 : 8d f9 bf STA $bff9 ; (sstack + 2)
6187 : a9 be __ LDA #$be
6189 : 8d fa bf STA $bffa ; (sstack + 3)
618c : a5 53 __ LDA T0 + 0 
618e : 6a __ __ ROR
618f : 38 __ __ SEC
6190 : e9 02 __ SBC #$02
6192 : 8d fb bf STA $bffb ; (sstack + 4)
6195 : 20 4e 34 JSR $344e ; (txtscr_scroller_init.s0 + 0)
.l58:
6198 : 20 e4 ff JSR $ffe4 
619b : 09 00 __ ORA #$00
619d : d0 f9 __ BNE $6198 ; (scroll_bigfont.l58 + 0)
.l10:
619f : 20 e4 ff JSR $ffe4 
61a2 : 85 1b __ STA ACCU + 0 
61a4 : 85 53 __ STA T0 + 0 
61a6 : a9 00 __ LDA #$00
61a8 : 85 1c __ STA ACCU + 1 
61aa : a9 09 __ LDA #$09
61ac : 8d f7 bf STA $bff7 ; (sstack + 0)
61af : a9 bf __ LDA #$bf
61b1 : 8d f8 bf STA $bff8 ; (sstack + 1)
61b4 : 20 e8 62 JSR $62e8 ; (txtscr_scroll_do.s1000 + 0)
61b7 : a5 53 __ LDA T0 + 0 
61b9 : c9 1b __ CMP #$1b
61bb : f0 04 __ BEQ $61c1 ; (scroll_bigfont.s1001 + 0)
.s12:
61bd : c9 03 __ CMP #$03
61bf : d0 de __ BNE $619f ; (scroll_bigfont.l10 + 0)
.s1001:
61c1 : ad 3c be LDA $be3c ; (scroll_bigfont@stack + 0)
61c4 : 85 53 __ STA T0 + 0 
61c6 : ad 3d be LDA $be3d ; (scroll_bigfont@stack + 1)
61c9 : 85 54 __ STA T0 + 1 
61cb : 60 __ __ RTS
--------------------------------------------------------------------
61cc : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 44 41 54 41 2e 00       : lOADING DATA..
--------------------------------------------------------------------
61da : __ __ __ BYT 43 48 41 52 53 32 00                            : CHARS2.
--------------------------------------------------------------------
61e1 : __ __ __ BYT 4d 55 53 49 43 25 55 00                         : MUSIC%U.
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
61e9 : a9 0f __ LDA #$0f
61eb : 85 03 __ STA WORK + 0 
61ed : a9 00 __ LDA #$00
61ef : 85 04 __ STA WORK + 1 
61f1 : 4c a0 65 JMP $65a0 ; (divmod + 0)
--------------------------------------------------------------------
__multab36L:
61f4 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
__multab6L:
61fa : __ __ __ BYT 00 06 0c 12 18                                  : .....
--------------------------------------------------------------------
bootdevice:
61ff : __ __ __ BSS	1
--------------------------------------------------------------------
6200 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 53 43 52 4f 4c 4c 20 70 : lOADING SCROLL p
6210 : __ __ __ BYT 65 74 73 63 69 69 20 46 4f 4e 54 3a 20 27 73 4d : etscii FONT: 'sM
6220 : __ __ __ BYT 41 4c 4c 20 72 4f 55 4e 44 20 66 4f 4e 54 27 20 : ALL rOUND fONT' 
6230 : __ __ __ BYT 42 59 20 63 55 50 49 44 2e 00                   : BY cUPID..
--------------------------------------------------------------------
txtscr_bigfont_init: ; txtscr_bigfont_init(struct TXTSCRBigFont*,u8,u8*,u8,u8,u8,u8,u8*)->void
.s0:
623a : a9 5b __ LDA #$5b
623c : 85 47 __ STA T4 + 0 
623e : a0 00 __ LDY #$00
6240 : 91 0d __ STA (P0),y ; (settings + 0)
6242 : a9 7f __ LDA #$7f
6244 : c8 __ __ INY
6245 : 91 0d __ STA (P0),y ; (settings + 0)
6247 : a9 50 __ LDA #$50
6249 : c8 __ __ INY
624a : 91 0d __ STA (P0),y ; (settings + 0)
624c : a9 00 __ LDA #$00
624e : c8 __ __ INY
624f : 91 0d __ STA (P0),y ; (settings + 0)
6251 : a9 04 __ LDA #$04
6253 : a8 __ __ TAY
6254 : 91 0d __ STA (P0),y ; (settings + 0)
6256 : a9 05 __ LDA #$05
6258 : a8 __ __ TAY
6259 : 91 0d __ STA (P0),y ; (settings + 0)
625b : 18 __ __ CLC
625c : a5 0d __ LDA P0 ; (settings + 0)
625e : 69 06 __ ADC #$06
6260 : 85 44 __ STA T2 + 0 
6262 : a5 0e __ LDA P1 ; (settings + 1)
6264 : 69 00 __ ADC #$00
6266 : 85 45 __ STA T2 + 1 
6268 : a9 00 __ LDA #$00
626a : 85 43 __ STA T1 + 0 
626c : 85 46 __ STA T3 + 0 
.l2:
626e : a5 43 __ LDA T1 + 0 
6270 : 85 1b __ STA ACCU + 0 
6272 : a9 00 __ LDA #$00
6274 : 85 1c __ STA ACCU + 1 
6276 : 85 04 __ STA WORK + 1 
6278 : a9 14 __ LDA #$14
627a : 85 03 __ STA WORK + 0 
627c : 20 a0 65 JSR $65a0 ; (divmod + 0)
627f : a5 05 __ LDA WORK + 2 
6281 : 0a __ __ ASL
6282 : 0a __ __ ASL
6283 : 85 48 __ STA T6 + 0 
6285 : a5 1b __ LDA ACCU + 0 
6287 : 85 49 __ STA T7 + 0 
6289 : 0a __ __ ASL
628a : a8 __ __ TAY
628b : a5 1c __ LDA ACCU + 1 
628d : 2a __ __ ROL
628e : aa __ __ TAX
628f : 98 __ __ TYA
6290 : 18 __ __ CLC
6291 : 65 1b __ ADC ACCU + 0 
6293 : a8 __ __ TAY
6294 : 8a __ __ TXA
6295 : 65 1c __ ADC ACCU + 1 
6297 : 85 1b __ STA ACCU + 0 
6299 : 98 __ __ TYA
629a : 0a __ __ ASL
629b : 26 1b __ ROL ACCU + 0 
629d : 0a __ __ ASL
629e : 26 1b __ ROL ACCU + 0 
62a0 : 0a __ __ ASL
62a1 : 26 1b __ ROL ACCU + 0 
62a3 : 18 __ __ CLC
62a4 : 65 49 __ ADC T7 + 0 
62a6 : 85 49 __ STA T7 + 0 
62a8 : a5 1b __ LDA ACCU + 0 
62aa : 65 1c __ ADC ACCU + 1 
62ac : 06 49 __ ASL T7 + 0 
62ae : 2a __ __ ROL
62af : 06 49 __ ASL T7 + 0 
62b1 : 2a __ __ ROL
62b2 : 06 49 __ ASL T7 + 0 
62b4 : 2a __ __ ROL
62b5 : 06 49 __ ASL T7 + 0 
62b7 : 2a __ __ ROL
62b8 : aa __ __ TAX
62b9 : 18 __ __ CLC
62ba : a5 49 __ LDA T7 + 0 
62bc : 65 48 __ ADC T6 + 0 
62be : a4 46 __ LDY T3 + 0 
62c0 : 91 44 __ STA (T2 + 0),y 
62c2 : 8a __ __ TXA
62c3 : 69 a0 __ ADC #$a0
62c5 : c8 __ __ INY
62c6 : 91 44 __ STA (T2 + 0),y 
62c8 : c8 __ __ INY
62c9 : 84 46 __ STY T3 + 0 
62cb : e6 43 __ INC T1 + 0 
62cd : c6 47 __ DEC T4 + 0 
62cf : d0 9d __ BNE $626e ; (txtscr_bigfont_init.l2 + 0)
.s4:
62d1 : 18 __ __ CLC
62d2 : a5 0d __ LDA P0 ; (settings + 0)
62d4 : 69 bc __ ADC #$bc
62d6 : 85 0d __ STA P0 ; (settings + 0)
62d8 : 90 02 __ BCC $62dc ; (txtscr_bigfont_init.s1007 + 0)
.s1006:
62da : e6 0e __ INC P1 ; (settings + 1)
.s1007:
62dc : a0 00 __ LDY #$00
.l1004:
62de : b1 0f __ LDA (P2),y ; (color + 0)
62e0 : 91 0d __ STA (P0),y ; (settings + 0)
62e2 : c8 __ __ INY
62e3 : c0 05 __ CPY #$05
62e5 : 90 f7 __ BCC $62de ; (txtscr_bigfont_init.l1004 + 0)
.s1001:
62e7 : 60 __ __ RTS
--------------------------------------------------------------------
txtscr_scroll_do: ; txtscr_scroll_do(struct TXTSCRScrollText*)->void
.s1000:
62e8 : a2 09 __ LDX #$09
62ea : b5 53 __ LDA T1 + 0,x 
62ec : 9d ed bf STA $bfed,x ; (vp_fill + 28)
62ef : ca __ __ DEX
62f0 : 10 f8 __ BPL $62ea ; (txtscr_scroll_do.s1000 + 2)
.s0:
62f2 : ad f7 bf LDA $bff7 ; (sstack + 0)
62f5 : 85 50 __ STA T0 + 0 
62f7 : 18 __ __ CLC
62f8 : 69 04 __ ADC #$04
62fa : 85 16 __ STA P9 
62fc : ad f8 bf LDA $bff8 ; (sstack + 1)
62ff : 85 51 __ STA T0 + 1 
6301 : 69 00 __ ADC #$00
6303 : 85 17 __ STA P10 
6305 : 20 46 59 JSR $5946 ; (vdcwin_scroll_left.s0 + 0)
6308 : 4c 12 63 JMP $6312 ; (txtscr_scroll_do.l1 + 0)
.s3:
630b : a0 0e __ LDY #$0e
630d : 91 50 __ STA (T0 + 0),y 
630f : c8 __ __ INY
6310 : 91 50 __ STA (T0 + 0),y 
.l1:
6312 : a0 00 __ LDY #$00
6314 : b1 50 __ LDA (T0 + 0),y 
6316 : 18 __ __ CLC
6317 : a0 0e __ LDY #$0e
6319 : 71 50 __ ADC (T0 + 0),y 
631b : 85 53 __ STA T1 + 0 
631d : a0 01 __ LDY #$01
631f : b1 50 __ LDA (T0 + 0),y 
6321 : a0 0f __ LDY #$0f
6323 : 71 50 __ ADC (T0 + 0),y 
6325 : 85 54 __ STA T1 + 1 
6327 : a0 00 __ LDY #$00
6329 : b1 53 __ LDA (T1 + 0),y 
632b : aa __ __ TAX
632c : f0 dd __ BEQ $630b ; (txtscr_scroll_do.s3 + 0)
.s2:
632e : a0 04 __ LDY #$04
6330 : b1 50 __ LDA (T0 + 0),y 
6332 : 18 __ __ CLC
6333 : a0 06 __ LDY #$06
6335 : 71 50 __ ADC (T0 + 0),y 
6337 : 38 __ __ SEC
6338 : e9 01 __ SBC #$01
633a : 85 53 __ STA T1 + 0 
633c : a0 02 __ LDY #$02
633e : b1 50 __ LDA (T0 + 0),y 
6340 : 85 55 __ STA T2 + 0 
6342 : 18 __ __ CLC
6343 : 69 bc __ ADC #$bc
6345 : 85 58 __ STA T5 + 0 
6347 : c8 __ __ INY
6348 : b1 50 __ LDA (T0 + 0),y 
634a : 85 56 __ STA T2 + 1 
634c : 69 00 __ ADC #$00
634e : 85 59 __ STA T5 + 1 
6350 : 8a __ __ TXA
6351 : 0a __ __ ASL
6352 : aa __ __ TAX
6353 : a9 00 __ LDA #$00
6355 : 85 57 __ STA T4 + 0 
6357 : 2a __ __ ROL
6358 : a8 __ __ TAY
6359 : 8a __ __ TXA
635a : 38 __ __ SEC
635b : e9 40 __ SBC #$40
635d : b0 01 __ BCS $6360 ; (txtscr_scroll_do.s1010 + 0)
.s1009:
635f : 88 __ __ DEY
.s1010:
6360 : 18 __ __ CLC
6361 : 65 55 __ ADC T2 + 0 
6363 : 85 5a __ STA T6 + 0 
6365 : 98 __ __ TYA
6366 : 65 56 __ ADC T2 + 1 
6368 : 85 5b __ STA T6 + 1 
636a : a0 06 __ LDY #$06
636c : b1 5a __ LDA (T6 + 0),y 
636e : aa __ __ TAX
636f : c8 __ __ INY
6370 : b1 5a __ LDA (T6 + 0),y 
6372 : 86 5a __ STX T6 + 0 
6374 : 85 5b __ STA T6 + 1 
6376 : a0 05 __ LDY #$05
6378 : b1 50 __ LDA (T0 + 0),y 
637a : 85 52 __ STA T3 + 0 
637c : a0 10 __ LDY #$10
637e : b1 50 __ LDA (T0 + 0),y 
6380 : 85 5c __ STA T7 + 0 
6382 : 4c c2 63 JMP $63c2 ; (txtscr_scroll_do.l7 + 0)
.s8:
6385 : a0 01 __ LDY #$01
6387 : b1 55 __ LDA (T2 + 0),y 
6389 : 85 0d __ STA P0 
638b : a5 5a __ LDA T6 + 0 
638d : 65 5c __ ADC T7 + 0 
638f : 85 0e __ STA P1 
6391 : a5 5b __ LDA T6 + 1 
6393 : 69 00 __ ADC #$00
6395 : 85 0f __ STA P2 
6397 : 20 49 18 JSR $1849 ; (bnk_readb.s0 + 0)
639a : 85 0f __ STA P2 
639c : a5 53 __ LDA T1 + 0 
639e : 85 0d __ STA P0 
63a0 : a4 57 __ LDY T4 + 0 
63a2 : b1 58 __ LDA (T5 + 0),y 
63a4 : 85 10 __ STA P3 
63a6 : 18 __ __ CLC
63a7 : a5 52 __ LDA T3 + 0 
63a9 : 65 57 __ ADC T4 + 0 
63ab : 85 0e __ STA P1 
63ad : 20 6e 36 JSR $366e ; (vdc_printc.s0 + 0)
63b0 : a5 5a __ LDA T6 + 0 
63b2 : 18 __ __ CLC
63b3 : a0 02 __ LDY #$02
63b5 : 71 55 __ ADC (T2 + 0),y 
63b7 : 85 5a __ STA T6 + 0 
63b9 : a5 5b __ LDA T6 + 1 
63bb : c8 __ __ INY
63bc : 71 55 __ ADC (T2 + 0),y 
63be : 85 5b __ STA T6 + 1 
63c0 : e6 57 __ INC T4 + 0 
.l7:
63c2 : a5 57 __ LDA T4 + 0 
63c4 : a0 05 __ LDY #$05
63c6 : d1 55 __ CMP (T2 + 0),y 
63c8 : 90 bb __ BCC $6385 ; (txtscr_scroll_do.s8 + 0)
.s6:
63ca : ad f7 bf LDA $bff7 ; (sstack + 0)
63cd : 85 50 __ STA T0 + 0 
63cf : ad f8 bf LDA $bff8 ; (sstack + 1)
63d2 : 85 51 __ STA T0 + 1 
63d4 : 18 __ __ CLC
63d5 : a0 10 __ LDY #$10
63d7 : b1 50 __ LDA (T0 + 0),y 
63d9 : 69 01 __ ADC #$01
63db : 85 55 __ STA T2 + 0 
63dd : 91 50 __ STA (T0 + 0),y 
63df : a0 02 __ LDY #$02
63e1 : b1 50 __ LDA (T0 + 0),y 
63e3 : 85 53 __ STA T1 + 0 
63e5 : c8 __ __ INY
63e6 : b1 50 __ LDA (T0 + 0),y 
63e8 : 85 54 __ STA T1 + 1 
63ea : c8 __ __ INY
63eb : b1 53 __ LDA (T1 + 0),y 
63ed : 38 __ __ SEC
63ee : e9 01 __ SBC #$01
63f0 : aa __ __ TAX
63f1 : a9 00 __ LDA #$00
63f3 : e9 00 __ SBC #$00
63f5 : 30 08 __ BMI $63ff ; (txtscr_scroll_do.s11 + 0)
.s1004:
63f7 : c9 00 __ CMP #$00
63f9 : d0 1a __ BNE $6415 ; (txtscr_scroll_do.s1001 + 0)
.s1002:
63fb : e4 55 __ CPX T2 + 0 
63fd : b0 16 __ BCS $6415 ; (txtscr_scroll_do.s1001 + 0)
.s11:
63ff : a9 00 __ LDA #$00
6401 : a0 10 __ LDY #$10
6403 : 91 50 __ STA (T0 + 0),y 
6405 : 18 __ __ CLC
6406 : a0 0e __ LDY #$0e
6408 : b1 50 __ LDA (T0 + 0),y 
640a : 69 01 __ ADC #$01
640c : 91 50 __ STA (T0 + 0),y 
640e : c8 __ __ INY
640f : b1 50 __ LDA (T0 + 0),y 
6411 : 69 00 __ ADC #$00
6413 : 91 50 __ STA (T0 + 0),y 
.s1001:
6415 : a2 09 __ LDX #$09
6417 : bd ed bf LDA $bfed,x ; (vp_fill + 28)
641a : 95 53 __ STA T1 + 0,x 
641c : ca __ __ DEX
641d : 10 f8 __ BPL $6417 ; (txtscr_scroll_do.s1001 + 2)
641f : 60 __ __ RTS
--------------------------------------------------------------------
charset_demo: ; charset_demo()->void
.s1000:
6420 : a5 53 __ LDA T0 + 0 
6422 : 8d ba bf STA $bfba ; (bigfont + 159)
.s0:
6425 : a9 18 __ LDA #$18
6427 : 8d 00 d6 STA $d600 
.l63:
642a : 2c 00 d6 BIT $d600 
642d : 10 fb __ BPL $642a ; (charset_demo.l63 + 0)
.s5:
642f : ad 01 d6 LDA $d601 
6432 : 85 53 __ STA T0 + 0 
6434 : ae 61 6e LDX $6e61 ; (vdc_state + 5)
6437 : ca __ __ DEX
6438 : ca __ __ DEX
6439 : 86 15 __ STX P8 
643b : 20 17 69 JSR $6917 ; (vdc_clear@proxy + 0)
643e : a9 00 __ LDA #$00
6440 : 8d fd bf STA $bffd ; (sstack + 6)
6443 : 8d fe bf STA $bffe ; (sstack + 7)
6446 : a9 02 __ LDA #$02
6448 : 8d fc bf STA $bffc ; (sstack + 5)
644b : 20 15 55 JSR $5515 ; (screen_switch.s1000 + 0)
644e : ad 6c 6e LDA $6e6c ; (vdc_state + 16)
6451 : 85 0f __ STA P2 
6453 : a9 7f __ LDA #$7f
6455 : 85 11 __ STA P4 
6457 : a9 01 __ LDA #$01
6459 : 85 15 __ STA P8 
645b : ad 6d 6e LDA $6e6d ; (vdc_state + 17)
645e : 85 10 __ STA P3 
6460 : a9 00 __ LDA #$00
6462 : 85 14 __ STA P7 
6464 : 85 12 __ STA P5 
6466 : a9 a0 __ LDA #$a0
6468 : 85 13 __ STA P6 
646a : 20 af 15 JSR $15af ; (bnk_redef_charset.s0 + 0)
646d : a9 00 __ LDA #$00
646f : 85 0f __ STA P2 
6471 : 8d c0 bf STA $bfc0 ; (bigfont + 165)
6474 : 8d c2 bf STA $bfc2 ; (bigfont + 167)
6477 : 8d c3 bf STA $bfc3 ; (bigfont + 168)
647a : 8d c4 bf STA $bfc4 ; (bigfont + 169)
647d : 8d c5 bf STA $bfc5 ; (bigfont + 170)
6480 : 8d c6 bf STA $bfc6 ; (bigfont + 171)
6483 : a9 7f __ LDA #$7f
6485 : 8d bc bf STA $bfbc ; (bigfont + 161)
6488 : a9 50 __ LDA #$50
648a : 8d bf bf STA $bfbf ; (bigfont + 164)
648d : 85 11 __ STA P4 
648f : a9 19 __ LDA #$19
6491 : 8d c1 bf STA $bfc1 ; (bigfont + 166)
6494 : ad 62 6e LDA $6e62 ; (vdc_state + 6)
6497 : 85 44 __ STA T1 + 1 
6499 : d0 07 __ BNE $64a2 ; (charset_demo.s32 + 0)
.s1004:
649b : a9 19 __ LDA #$19
649d : cd 61 6e CMP $6e61 ; (vdc_state + 5)
64a0 : b0 04 __ BCS $64a6 ; (charset_demo.s33 + 0)
.s32:
64a2 : a9 19 __ LDA #$19
64a4 : d0 02 __ BNE $64a8 ; (charset_demo.s34 + 0)
.s33:
64a6 : a9 17 __ LDA #$17
.s34:
64a8 : 85 12 __ STA P5 
64aa : 46 44 __ LSR T1 + 1 
64ac : a9 00 __ LDA #$00
64ae : 8d bd bf STA $bfbd ; (bigfont + 162)
64b1 : a9 40 __ LDA #$40
64b3 : 8d be bf STA $bfbe ; (bigfont + 163)
64b6 : a9 c7 __ LDA #$c7
64b8 : 85 0d __ STA P0 
64ba : a9 bf __ LDA #$bf
64bc : 85 0e __ STA P1 
64be : ad 61 6e LDA $6e61 ; (vdc_state + 5)
64c1 : 6a __ __ ROR
64c2 : 38 __ __ SEC
64c3 : e9 0a __ SBC #$0a
64c5 : 85 10 __ STA P3 
64c7 : 20 e5 33 JSR $33e5 ; (vdcwin_init.s0 + 0)
64ca : a9 bc __ LDA #$bc
64cc : 85 16 __ STA P9 
64ce : a9 bf __ LDA #$bf
64d0 : 85 17 __ STA P10 
64d2 : 20 36 3a JSR $3a36 ; (vdcwin_cpy_viewport.s0 + 0)
64d5 : a9 2f __ LDA #$2f
64d7 : 85 0f __ STA P2 
64d9 : a9 1c __ LDA #$1c
64db : 85 11 __ STA P4 
64dd : a9 65 __ LDA #$65
64df : 85 12 __ STA P5 
64e1 : 20 de 68 JSR $68de ; (vdc_prints_attr@proxy + 0)
64e4 : e6 10 __ INC P3 
64e6 : a9 46 __ LDA #$46
64e8 : 85 0f __ STA P2 
64ea : 20 d3 68 JSR $68d3 ; (vdc_prints_attr@proxy + 0)
64ed : 20 b6 2c JSR $2cb6 ; (getch.s0 + 0)
64f0 : a9 18 __ LDA #$18
64f2 : 8d 00 d6 STA $d600 
64f5 : a5 53 __ LDA T0 + 0 
64f7 : 29 f0 __ AND #$f0
.l66:
64f9 : 2c 00 d6 BIT $d600 
64fc : 10 fb __ BPL $64f9 ; (charset_demo.l66 + 0)
.s15:
64fe : 8d 01 d6 STA $d601 
6501 : 20 f0 2e JSR $2ef0 ; (vdc_restore_charsets.s0 + 0)
6504 : a9 02 __ LDA #$02
6506 : 8d fc bf STA $bffc ; (sstack + 5)
6509 : a9 01 __ LDA #$01
650b : 8d fd bf STA $bffd ; (sstack + 6)
650e : a9 00 __ LDA #$00
6510 : 8d fe bf STA $bffe ; (sstack + 7)
6513 : 20 15 55 JSR $5515 ; (screen_switch.s1000 + 0)
.s1001:
6516 : ad ba bf LDA $bfba ; (bigfont + 159)
6519 : 85 53 __ STA T0 + 0 
651b : 60 __ __ RTS
--------------------------------------------------------------------
651c : __ __ __ BYT 67 52 41 50 48 49 43 53 20 46 52 4f 4d 20 52 45 : gRAPHICS FROM RE
652c : __ __ __ BYT 44 45 46 49 4e 49 4e 47 20 43 48 41 52 53 45 54 : DEFINING CHARSET
653c : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
mul16by8: ; mul16by8
653e : a0 00 __ LDY #$00
6540 : 84 06 __ STY WORK + 3 
6542 : 4a __ __ LSR
6543 : 90 0d __ BCC $6552 ; (mul16by8 + 20)
6545 : aa __ __ TAX
6546 : 18 __ __ CLC
6547 : 98 __ __ TYA
6548 : 65 1b __ ADC ACCU + 0 
654a : a8 __ __ TAY
654b : a5 06 __ LDA WORK + 3 
654d : 65 1c __ ADC ACCU + 1 
654f : 85 06 __ STA WORK + 3 
6551 : 8a __ __ TXA
6552 : 06 1b __ ASL ACCU + 0 
6554 : 26 1c __ ROL ACCU + 1 
6556 : 4a __ __ LSR
6557 : b0 ec __ BCS $6545 ; (mul16by8 + 7)
6559 : d0 f7 __ BNE $6552 ; (mul16by8 + 20)
655b : 84 05 __ STY WORK + 2 
655d : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
655e : a0 00 __ LDY #$00
6560 : 84 06 __ STY WORK + 3 
6562 : a5 03 __ LDA WORK + 0 
6564 : a6 04 __ LDX WORK + 1 
6566 : f0 1c __ BEQ $6584 ; (mul16 + 38)
6568 : 38 __ __ SEC
6569 : 6a __ __ ROR
656a : 90 0d __ BCC $6579 ; (mul16 + 27)
656c : aa __ __ TAX
656d : 18 __ __ CLC
656e : 98 __ __ TYA
656f : 65 1b __ ADC ACCU + 0 
6571 : a8 __ __ TAY
6572 : a5 06 __ LDA WORK + 3 
6574 : 65 1c __ ADC ACCU + 1 
6576 : 85 06 __ STA WORK + 3 
6578 : 8a __ __ TXA
6579 : 06 1b __ ASL ACCU + 0 
657b : 26 1c __ ROL ACCU + 1 
657d : 4a __ __ LSR
657e : 90 f9 __ BCC $6579 ; (mul16 + 27)
6580 : d0 ea __ BNE $656c ; (mul16 + 14)
6582 : a5 04 __ LDA WORK + 1 
6584 : 4a __ __ LSR
6585 : 90 0d __ BCC $6594 ; (mul16 + 54)
6587 : aa __ __ TAX
6588 : 18 __ __ CLC
6589 : 98 __ __ TYA
658a : 65 1b __ ADC ACCU + 0 
658c : a8 __ __ TAY
658d : a5 06 __ LDA WORK + 3 
658f : 65 1c __ ADC ACCU + 1 
6591 : 85 06 __ STA WORK + 3 
6593 : 8a __ __ TXA
6594 : 06 1b __ ASL ACCU + 0 
6596 : 26 1c __ ROL ACCU + 1 
6598 : 4a __ __ LSR
6599 : b0 ec __ BCS $6587 ; (mul16 + 41)
659b : d0 f7 __ BNE $6594 ; (mul16 + 54)
659d : 84 05 __ STY WORK + 2 
659f : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
65a0 : a5 1c __ LDA ACCU + 1 
65a2 : d0 31 __ BNE $65d5 ; (divmod + 53)
65a4 : a5 04 __ LDA WORK + 1 
65a6 : d0 1e __ BNE $65c6 ; (divmod + 38)
65a8 : 85 06 __ STA WORK + 3 
65aa : a2 04 __ LDX #$04
65ac : 06 1b __ ASL ACCU + 0 
65ae : 2a __ __ ROL
65af : c5 03 __ CMP WORK + 0 
65b1 : 90 02 __ BCC $65b5 ; (divmod + 21)
65b3 : e5 03 __ SBC WORK + 0 
65b5 : 26 1b __ ROL ACCU + 0 
65b7 : 2a __ __ ROL
65b8 : c5 03 __ CMP WORK + 0 
65ba : 90 02 __ BCC $65be ; (divmod + 30)
65bc : e5 03 __ SBC WORK + 0 
65be : 26 1b __ ROL ACCU + 0 
65c0 : ca __ __ DEX
65c1 : d0 eb __ BNE $65ae ; (divmod + 14)
65c3 : 85 05 __ STA WORK + 2 
65c5 : 60 __ __ RTS
65c6 : a5 1b __ LDA ACCU + 0 
65c8 : 85 05 __ STA WORK + 2 
65ca : a5 1c __ LDA ACCU + 1 
65cc : 85 06 __ STA WORK + 3 
65ce : a9 00 __ LDA #$00
65d0 : 85 1b __ STA ACCU + 0 
65d2 : 85 1c __ STA ACCU + 1 
65d4 : 60 __ __ RTS
65d5 : a5 04 __ LDA WORK + 1 
65d7 : d0 1f __ BNE $65f8 ; (divmod + 88)
65d9 : a5 03 __ LDA WORK + 0 
65db : 30 1b __ BMI $65f8 ; (divmod + 88)
65dd : a9 00 __ LDA #$00
65df : 85 06 __ STA WORK + 3 
65e1 : a2 10 __ LDX #$10
65e3 : 06 1b __ ASL ACCU + 0 
65e5 : 26 1c __ ROL ACCU + 1 
65e7 : 2a __ __ ROL
65e8 : c5 03 __ CMP WORK + 0 
65ea : 90 02 __ BCC $65ee ; (divmod + 78)
65ec : e5 03 __ SBC WORK + 0 
65ee : 26 1b __ ROL ACCU + 0 
65f0 : 26 1c __ ROL ACCU + 1 
65f2 : ca __ __ DEX
65f3 : d0 f2 __ BNE $65e7 ; (divmod + 71)
65f5 : 85 05 __ STA WORK + 2 
65f7 : 60 __ __ RTS
65f8 : a9 00 __ LDA #$00
65fa : 85 05 __ STA WORK + 2 
65fc : 85 06 __ STA WORK + 3 
65fe : 84 02 __ STY $02 
6600 : a0 10 __ LDY #$10
6602 : 18 __ __ CLC
6603 : 26 1b __ ROL ACCU + 0 
6605 : 26 1c __ ROL ACCU + 1 
6607 : 26 05 __ ROL WORK + 2 
6609 : 26 06 __ ROL WORK + 3 
660b : 38 __ __ SEC
660c : a5 05 __ LDA WORK + 2 
660e : e5 03 __ SBC WORK + 0 
6610 : aa __ __ TAX
6611 : a5 06 __ LDA WORK + 3 
6613 : e5 04 __ SBC WORK + 1 
6615 : 90 04 __ BCC $661b ; (divmod + 123)
6617 : 86 05 __ STX WORK + 2 
6619 : 85 06 __ STA WORK + 3 
661b : 88 __ __ DEY
661c : d0 e5 __ BNE $6603 ; (divmod + 99)
661e : 26 1b __ ROL ACCU + 0 
6620 : 26 1c __ ROL ACCU + 1 
6622 : a4 02 __ LDY $02 
6624 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
6625 : 84 02 __ STY $02 
6627 : a0 20 __ LDY #$20
6629 : a9 00 __ LDA #$00
662b : 85 07 __ STA WORK + 4 
662d : 85 08 __ STA WORK + 5 
662f : 85 09 __ STA WORK + 6 
6631 : 85 0a __ STA WORK + 7 
6633 : a5 05 __ LDA WORK + 2 
6635 : 05 06 __ ORA WORK + 3 
6637 : d0 78 __ BNE $66b1 ; (divmod32 + 140)
6639 : a5 04 __ LDA WORK + 1 
663b : d0 27 __ BNE $6664 ; (divmod32 + 63)
663d : 18 __ __ CLC
663e : 26 1b __ ROL ACCU + 0 
6640 : 26 1c __ ROL ACCU + 1 
6642 : 26 1d __ ROL ACCU + 2 
6644 : 26 1e __ ROL ACCU + 3 
6646 : 2a __ __ ROL
6647 : 90 05 __ BCC $664e ; (divmod32 + 41)
6649 : e5 03 __ SBC WORK + 0 
664b : 38 __ __ SEC
664c : b0 06 __ BCS $6654 ; (divmod32 + 47)
664e : c5 03 __ CMP WORK + 0 
6650 : 90 02 __ BCC $6654 ; (divmod32 + 47)
6652 : e5 03 __ SBC WORK + 0 
6654 : 88 __ __ DEY
6655 : d0 e7 __ BNE $663e ; (divmod32 + 25)
6657 : 85 07 __ STA WORK + 4 
6659 : 26 1b __ ROL ACCU + 0 
665b : 26 1c __ ROL ACCU + 1 
665d : 26 1d __ ROL ACCU + 2 
665f : 26 1e __ ROL ACCU + 3 
6661 : a4 02 __ LDY $02 
6663 : 60 __ __ RTS
6664 : a5 1e __ LDA ACCU + 3 
6666 : d0 10 __ BNE $6678 ; (divmod32 + 83)
6668 : a6 1d __ LDX ACCU + 2 
666a : 86 1e __ STX ACCU + 3 
666c : a6 1c __ LDX ACCU + 1 
666e : 86 1d __ STX ACCU + 2 
6670 : a6 1b __ LDX ACCU + 0 
6672 : 86 1c __ STX ACCU + 1 
6674 : 85 1b __ STA ACCU + 0 
6676 : a0 18 __ LDY #$18
6678 : 18 __ __ CLC
6679 : 26 1b __ ROL ACCU + 0 
667b : 26 1c __ ROL ACCU + 1 
667d : 26 1d __ ROL ACCU + 2 
667f : 26 1e __ ROL ACCU + 3 
6681 : 26 07 __ ROL WORK + 4 
6683 : 26 08 __ ROL WORK + 5 
6685 : 90 0c __ BCC $6693 ; (divmod32 + 110)
6687 : a5 07 __ LDA WORK + 4 
6689 : e5 03 __ SBC WORK + 0 
668b : aa __ __ TAX
668c : a5 08 __ LDA WORK + 5 
668e : e5 04 __ SBC WORK + 1 
6690 : 38 __ __ SEC
6691 : b0 0c __ BCS $669f ; (divmod32 + 122)
6693 : 38 __ __ SEC
6694 : a5 07 __ LDA WORK + 4 
6696 : e5 03 __ SBC WORK + 0 
6698 : aa __ __ TAX
6699 : a5 08 __ LDA WORK + 5 
669b : e5 04 __ SBC WORK + 1 
669d : 90 04 __ BCC $66a3 ; (divmod32 + 126)
669f : 86 07 __ STX WORK + 4 
66a1 : 85 08 __ STA WORK + 5 
66a3 : 88 __ __ DEY
66a4 : d0 d3 __ BNE $6679 ; (divmod32 + 84)
66a6 : 26 1b __ ROL ACCU + 0 
66a8 : 26 1c __ ROL ACCU + 1 
66aa : 26 1d __ ROL ACCU + 2 
66ac : 26 1e __ ROL ACCU + 3 
66ae : a4 02 __ LDY $02 
66b0 : 60 __ __ RTS
66b1 : a0 10 __ LDY #$10
66b3 : a5 1e __ LDA ACCU + 3 
66b5 : 85 08 __ STA WORK + 5 
66b7 : a5 1d __ LDA ACCU + 2 
66b9 : 85 07 __ STA WORK + 4 
66bb : a9 00 __ LDA #$00
66bd : 85 1d __ STA ACCU + 2 
66bf : 85 1e __ STA ACCU + 3 
66c1 : 18 __ __ CLC
66c2 : 26 1b __ ROL ACCU + 0 
66c4 : 26 1c __ ROL ACCU + 1 
66c6 : 26 07 __ ROL WORK + 4 
66c8 : 26 08 __ ROL WORK + 5 
66ca : 26 09 __ ROL WORK + 6 
66cc : 26 0a __ ROL WORK + 7 
66ce : a5 07 __ LDA WORK + 4 
66d0 : c5 03 __ CMP WORK + 0 
66d2 : a5 08 __ LDA WORK + 5 
66d4 : e5 04 __ SBC WORK + 1 
66d6 : a5 09 __ LDA WORK + 6 
66d8 : e5 05 __ SBC WORK + 2 
66da : a5 0a __ LDA WORK + 7 
66dc : e5 06 __ SBC WORK + 3 
66de : 90 18 __ BCC $66f8 ; (divmod32 + 211)
66e0 : a5 07 __ LDA WORK + 4 
66e2 : e5 03 __ SBC WORK + 0 
66e4 : 85 07 __ STA WORK + 4 
66e6 : a5 08 __ LDA WORK + 5 
66e8 : e5 04 __ SBC WORK + 1 
66ea : 85 08 __ STA WORK + 5 
66ec : a5 09 __ LDA WORK + 6 
66ee : e5 05 __ SBC WORK + 2 
66f0 : 85 09 __ STA WORK + 6 
66f2 : a5 0a __ LDA WORK + 7 
66f4 : e5 06 __ SBC WORK + 3 
66f6 : 85 0a __ STA WORK + 7 
66f8 : 88 __ __ DEY
66f9 : d0 c7 __ BNE $66c2 ; (divmod32 + 157)
66fb : 26 1b __ ROL ACCU + 0 
66fd : 26 1c __ ROL ACCU + 1 
66ff : a4 02 __ LDY $02 
6701 : 60 __ __ RTS
--------------------------------------------------------------------
malloc: ; malloc
6702 : 18 __ __ CLC
6703 : a5 1b __ LDA ACCU + 0 
6705 : 69 02 __ ADC #$02
6707 : 85 03 __ STA WORK + 0 
6709 : a5 1c __ LDA ACCU + 1 
670b : 69 00 __ ADC #$00
670d : 85 04 __ STA WORK + 1 
670f : ad fe 69 LDA $69fe ; (HeapNode + 2)
6712 : d0 1f __ BNE $6733 ; (malloc + 49)
6714 : a9 00 __ LDA #$00
6716 : 8d 90 70 STA $7090 
6719 : 8d 91 70 STA $7091 
671c : ee fe 69 INC $69fe ; (HeapNode + 2)
671f : a9 90 __ LDA #$90
6721 : 8d fc 69 STA $69fc ; (HeapNode + 0)
6724 : a9 70 __ LDA #$70
6726 : 8d fd 69 STA $69fd ; (HeapNode + 1)
6729 : a9 00 __ LDA #$00
672b : 8d 92 70 STA $7092 
672e : a9 b0 __ LDA #$b0
6730 : 8d 93 70 STA $7093 
6733 : a9 fc __ LDA #$fc
6735 : a2 69 __ LDX #$69
6737 : 85 1d __ STA ACCU + 2 
6739 : 86 1e __ STX ACCU + 3 
673b : 18 __ __ CLC
673c : a0 00 __ LDY #$00
673e : b1 1d __ LDA (ACCU + 2),y 
6740 : 85 1b __ STA ACCU + 0 
6742 : 65 03 __ ADC WORK + 0 
6744 : 85 05 __ STA WORK + 2 
6746 : c8 __ __ INY
6747 : b1 1d __ LDA (ACCU + 2),y 
6749 : 85 1c __ STA ACCU + 1 
674b : f0 18 __ BEQ $6765 ; (malloc + 99)
674d : 65 04 __ ADC WORK + 1 
674f : 85 06 __ STA WORK + 3 
6751 : a0 02 __ LDY #$02
6753 : b1 1b __ LDA (ACCU + 0),y 
6755 : c5 05 __ CMP WORK + 2 
6757 : c8 __ __ INY
6758 : b1 1b __ LDA (ACCU + 0),y 
675a : e5 06 __ SBC WORK + 3 
675c : b0 08 __ BCS $6766 ; (malloc + 100)
675e : a5 1b __ LDA ACCU + 0 
6760 : a6 1c __ LDX ACCU + 1 
6762 : 4c 37 67 JMP $6737 ; (malloc + 53)
6765 : 60 __ __ RTS
6766 : 18 __ __ CLC
6767 : a5 05 __ LDA WORK + 2 
6769 : 69 03 __ ADC #$03
676b : 29 fc __ AND #$fc
676d : 85 07 __ STA WORK + 4 
676f : a5 06 __ LDA WORK + 3 
6771 : 69 00 __ ADC #$00
6773 : 85 08 __ STA WORK + 5 
6775 : a0 02 __ LDY #$02
6777 : a5 07 __ LDA WORK + 4 
6779 : d1 1b __ CMP (ACCU + 0),y 
677b : d0 15 __ BNE $6792 ; (malloc + 144)
677d : c8 __ __ INY
677e : a5 08 __ LDA WORK + 5 
6780 : d1 1b __ CMP (ACCU + 0),y 
6782 : d0 0e __ BNE $6792 ; (malloc + 144)
6784 : a0 00 __ LDY #$00
6786 : b1 1b __ LDA (ACCU + 0),y 
6788 : 91 1d __ STA (ACCU + 2),y 
678a : c8 __ __ INY
678b : b1 1b __ LDA (ACCU + 0),y 
678d : 91 1d __ STA (ACCU + 2),y 
678f : 4c af 67 JMP $67af ; (malloc + 173)
6792 : a0 00 __ LDY #$00
6794 : b1 1b __ LDA (ACCU + 0),y 
6796 : 91 07 __ STA (WORK + 4),y 
6798 : a5 07 __ LDA WORK + 4 
679a : 91 1d __ STA (ACCU + 2),y 
679c : c8 __ __ INY
679d : b1 1b __ LDA (ACCU + 0),y 
679f : 91 07 __ STA (WORK + 4),y 
67a1 : a5 08 __ LDA WORK + 5 
67a3 : 91 1d __ STA (ACCU + 2),y 
67a5 : c8 __ __ INY
67a6 : b1 1b __ LDA (ACCU + 0),y 
67a8 : 91 07 __ STA (WORK + 4),y 
67aa : c8 __ __ INY
67ab : b1 1b __ LDA (ACCU + 0),y 
67ad : 91 07 __ STA (WORK + 4),y 
67af : a0 00 __ LDY #$00
67b1 : a5 05 __ LDA WORK + 2 
67b3 : 91 1b __ STA (ACCU + 0),y 
67b5 : c8 __ __ INY
67b6 : a5 06 __ LDA WORK + 3 
67b8 : 91 1b __ STA (ACCU + 0),y 
67ba : a5 1b __ LDA ACCU + 0 
67bc : 09 02 __ ORA #$02
67be : 85 1b __ STA ACCU + 0 
67c0 : 60 __ __ RTS
--------------------------------------------------------------------
free: ; free
67c1 : a5 1b __ LDA ACCU + 0 
67c3 : 29 fc __ AND #$fc
67c5 : 85 1b __ STA ACCU + 0 
67c7 : 05 1c __ ORA ACCU + 1 
67c9 : d0 01 __ BNE $67cc ; (free + 11)
67cb : 60 __ __ RTS
67cc : 18 __ __ CLC
67cd : a0 00 __ LDY #$00
67cf : b1 1b __ LDA (ACCU + 0),y 
67d1 : 69 03 __ ADC #$03
67d3 : 29 fc __ AND #$fc
67d5 : 85 1d __ STA ACCU + 2 
67d7 : c8 __ __ INY
67d8 : b1 1b __ LDA (ACCU + 0),y 
67da : 69 00 __ ADC #$00
67dc : 85 1e __ STA ACCU + 3 
67de : a9 fc __ LDA #$fc
67e0 : a2 69 __ LDX #$69
67e2 : 85 05 __ STA WORK + 2 
67e4 : 86 06 __ STX WORK + 3 
67e6 : a0 01 __ LDY #$01
67e8 : b1 05 __ LDA (WORK + 2),y 
67ea : f0 28 __ BEQ $6814 ; (free + 83)
67ec : aa __ __ TAX
67ed : 88 __ __ DEY
67ee : b1 05 __ LDA (WORK + 2),y 
67f0 : e4 1e __ CPX ACCU + 3 
67f2 : 90 ee __ BCC $67e2 ; (free + 33)
67f4 : d0 1e __ BNE $6814 ; (free + 83)
67f6 : c5 1d __ CMP ACCU + 2 
67f8 : 90 e8 __ BCC $67e2 ; (free + 33)
67fa : d0 18 __ BNE $6814 ; (free + 83)
67fc : a0 00 __ LDY #$00
67fe : b1 1d __ LDA (ACCU + 2),y 
6800 : 91 1b __ STA (ACCU + 0),y 
6802 : c8 __ __ INY
6803 : b1 1d __ LDA (ACCU + 2),y 
6805 : 91 1b __ STA (ACCU + 0),y 
6807 : c8 __ __ INY
6808 : b1 1d __ LDA (ACCU + 2),y 
680a : 91 1b __ STA (ACCU + 0),y 
680c : c8 __ __ INY
680d : b1 1d __ LDA (ACCU + 2),y 
680f : 91 1b __ STA (ACCU + 0),y 
6811 : 4c 29 68 JMP $6829 ; (free + 104)
6814 : a0 00 __ LDY #$00
6816 : b1 05 __ LDA (WORK + 2),y 
6818 : 91 1b __ STA (ACCU + 0),y 
681a : c8 __ __ INY
681b : b1 05 __ LDA (WORK + 2),y 
681d : 91 1b __ STA (ACCU + 0),y 
681f : c8 __ __ INY
6820 : a5 1d __ LDA ACCU + 2 
6822 : 91 1b __ STA (ACCU + 0),y 
6824 : c8 __ __ INY
6825 : a5 1e __ LDA ACCU + 3 
6827 : 91 1b __ STA (ACCU + 0),y 
6829 : a0 02 __ LDY #$02
682b : b1 05 __ LDA (WORK + 2),y 
682d : c5 1b __ CMP ACCU + 0 
682f : d0 1d __ BNE $684e ; (free + 141)
6831 : c8 __ __ INY
6832 : b1 05 __ LDA (WORK + 2),y 
6834 : c5 1c __ CMP ACCU + 1 
6836 : d0 16 __ BNE $684e ; (free + 141)
6838 : a0 00 __ LDY #$00
683a : b1 1b __ LDA (ACCU + 0),y 
683c : 91 05 __ STA (WORK + 2),y 
683e : c8 __ __ INY
683f : b1 1b __ LDA (ACCU + 0),y 
6841 : 91 05 __ STA (WORK + 2),y 
6843 : c8 __ __ INY
6844 : b1 1b __ LDA (ACCU + 0),y 
6846 : 91 05 __ STA (WORK + 2),y 
6848 : c8 __ __ INY
6849 : b1 1b __ LDA (ACCU + 0),y 
684b : 91 05 __ STA (WORK + 2),y 
684d : 60 __ __ RTS
684e : a0 00 __ LDY #$00
6850 : a5 1b __ LDA ACCU + 0 
6852 : 91 05 __ STA (WORK + 2),y 
6854 : c8 __ __ INY
6855 : a5 1c __ LDA ACCU + 1 
6857 : 91 05 __ STA (WORK + 2),y 
6859 : 60 __ __ RTS
--------------------------------------------------------------------
__multab102L:
685a : __ __ __ BYT 00 66 cc 32 98 fe 64 ca                         : .f.2..d.
--------------------------------------------------------------------
__multab102H:
6862 : __ __ __ BYT 00 00 00 01 01 01 02 02                         : ........
--------------------------------------------------------------------
__multab9L:
686a : __ __ __ BYT 00 09 12 1b 24 2d 36                            : ....$-6
--------------------------------------------------------------------
__multab15L:
6871 : __ __ __ BYT 00 0f 1e 2d 3c                                  : ...-<
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
6876 : a9 00 __ LDA #$00
6878 : 85 14 __ STA P7 
687a : 4c ba 47 JMP $47ba ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
687d : a5 4c __ LDA $4c 
687f : 85 11 __ STA P4 
6881 : a5 4d __ LDA $4d 
6883 : 85 12 __ STA P5 
6885 : 4c ba 47 JMP $47ba ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
6888 : a5 4c __ LDA $4c 
688a : 85 0f __ STA P2 
688c : a5 4d __ LDA $4d 
688e : 85 10 __ STA P3 
6890 : 4c ba 47 JMP $47ba ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
6893 : a5 4d __ LDA $4d 
6895 : 85 11 __ STA P4 
6897 : a5 4e __ LDA $4e 
6899 : 85 12 __ STA P5 
689b : 4c ba 47 JMP $47ba ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
689e : a5 4d __ LDA $4d 
68a0 : 85 0f __ STA P2 
68a2 : a5 4e __ LDA $4e 
68a4 : 85 10 __ STA P3 
68a6 : 4c ba 47 JMP $47ba ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
68a9 : a9 00 __ LDA #$00
68ab : 85 0f __ STA P2 
68ad : a9 75 __ LDA #$75
68af : 85 11 __ STA P4 
68b1 : a9 6e __ LDA #$6e
68b3 : 85 12 __ STA P5 
68b5 : a5 54 __ LDA $54 
68b7 : 85 13 __ STA P6 
68b9 : 4c 02 30 JMP $3002 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
68bc : a9 00 __ LDA #$00
68be : 85 0f __ STA P2 
68c0 : a9 03 __ LDA #$03
68c2 : 85 10 __ STA P3 
68c4 : 4c 02 30 JMP $3002 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
68c7 : a9 00 __ LDA #$00
68c9 : 85 0f __ STA P2 
68cb : ad 63 6e LDA $6e63 ; (vdc_state + 7)
68ce : 85 13 __ STA P6 
68d0 : 4c 02 30 JMP $3002 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
68d3 : a9 0f __ LDA #$0f
68d5 : 85 11 __ STA P4 
68d7 : a9 37 __ LDA #$37
68d9 : 85 12 __ STA P5 
68db : 4c 02 30 JMP $3002 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
68de : a9 03 __ LDA #$03
68e0 : 85 10 __ STA P3 
68e2 : ad 63 6e LDA $6e63 ; (vdc_state + 7)
68e5 : 85 13 __ STA P6 
68e7 : 4c 02 30 JMP $3002 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
68ea : a9 75 __ LDA #$75
68ec : 85 11 __ STA P4 
68ee : a9 6e __ LDA #$6e
68f0 : 85 12 __ STA P5 
68f2 : a9 8d __ LDA #$8d
68f4 : 85 13 __ STA P6 
68f6 : 4c 02 30 JMP $3002 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
68f9 : a5 4a __ LDA $4a 
68fb : 85 0e __ STA P1 
68fd : 4c 67 2c JMP $2c67 ; (vdc_mem_addr.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
6900 : a9 00 __ LDA #$00
6902 : 85 0f __ STA P2 
6904 : a9 20 __ LDA #$20
6906 : 85 11 __ STA P4 
6908 : a9 50 __ LDA #$50
690a : 85 13 __ STA P6 
690c : a9 03 __ LDA #$03
690e : 85 14 __ STA P7 
6910 : a9 02 __ LDA #$02
6912 : 85 15 __ STA P8 
6914 : 4c 92 2b JMP $2b92 ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
6917 : a9 00 __ LDA #$00
6919 : 85 0f __ STA P2 
691b : a9 20 __ LDA #$20
691d : 85 11 __ STA P4 
691f : a9 50 __ LDA #$50
6921 : 85 13 __ STA P6 
6923 : a9 02 __ LDA #$02
6925 : 85 14 __ STA P7 
6927 : 4c 92 2b JMP $2b92 ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_hchar@proxy: ; vdc_hchar@proxy
692a : a9 20 __ LDA #$20
692c : 85 11 __ STA P4 
692e : a9 50 __ LDA #$50
6930 : 85 13 __ STA P6 
6932 : 4c bc 2b JMP $2bbc ; (vdc_hchar.s0 + 0)
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
6935 : a9 05 __ LDA #$05
6937 : 85 03 __ STA WORK + 0 
6939 : a9 00 __ LDA #$00
693b : 85 04 __ STA WORK + 1 
693d : 4c a0 65 JMP $65a0 ; (divmod + 0)
--------------------------------------------------------------------
winStyles:
6940 : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
6950 : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
menubar:
6952 : __ __ __ BYT 73 45 54 54 49 4e 47 53 00 77 49 4e 44 4f 57 53 : sETTINGS.wINDOWS
6962 : __ __ __ BYT 00 00 76 49 45 57 50 4f 52 54 00 73 43 52 4f 4c : ..vIEWPORT.sCROL
6972 : __ __ __ BYT 4c 00 00 00 63 48 41 52 53 45 54 00 00 6d 55 53 : L...cHARSET..mUS
6982 : __ __ __ BYT 49 43 00 00 00 00 00 00 00 00 00 00 01          : IC...........
--------------------------------------------------------------------
pulldown_options:
698f : __ __ __ BYT 03 02 02 03 01 04 02 06                         : ........
--------------------------------------------------------------------
seed:
6997 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
6999 : __ __ __ BYT 42 4c 55 45 20 4a 41 59 00 00 00 00 00 00 00 43 : BLUE JAY.......C
69a9 : __ __ __ BYT 41 52 44 49 4e 41 4c 00 00 00 00 00 00 00 45 41 : ARDINAL.......EA
69b9 : __ __ __ BYT 53 54 45 52 4e 20 50 48 4f 45 42 45 00 47 52 41 : STERN PHOEBE.GRA
69c9 : __ __ __ BYT 43 4b 4c 45 00 00 00 00 00 00 00 00 53 41 4e 44 : CKLE........SAND
69d9 : __ __ __ BYT 48 49 4c 4c 20 43 52 41 4e 45 00                : HILL CRANE.
--------------------------------------------------------------------
p2smap:
69e4 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
s2pmap:
69ec : __ __ __ BYT 40 00 20 c0 c0 80 a0 40                         : @. ....@
--------------------------------------------------------------------
screenset:
69f4 : __ __ __ BYT 50 96 a0 4b 50 19                               : P..KP.
--------------------------------------------------------------------
iec_status:
69fa : __ __ __ BSS	1
--------------------------------------------------------------------
iec_queue:
69fb : __ __ __ BSS	1
--------------------------------------------------------------------
HeapNode:
69fc : __ __ __ BSS	4
--------------------------------------------------------------------
vdc_modes:
6a00 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
6a10 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
6a20 : __ __ __ BYT e7 24 7e ff 50 00 32 00 00 00 00 00 10 00 40 00 : .$~.P.2.......@.
6a30 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
6a40 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
6a50 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
6a60 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
6a70 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
6a80 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
6a90 : __ __ __ BYT 50 00 32 00 00 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
6aa0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
6ab0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
6ac0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
6ad0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
pulldown_titles:
6ad8 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 00 00 00 00 00 00 : sCREENMODE......
6ae8 : __ __ __ BYT 00 69 4e 46 4f 20 20 20 20 20 20 00 00 00 00 00 : .iNFO      .....
6af8 : __ __ __ BYT 00 00 65 58 49 54 20 20 20 20 20 20 00 00 00 00 : ..eXIT      ....
6b08 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b18 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b28 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b38 : __ __ __ BYT 00 00 00 00 00 00 77 49 4e 44 4f 57 20 4f 4e 20 : ......wINDOW ON 
6b48 : __ __ __ BYT 57 49 4e 44 4f 57 00 74 45 58 54 20 45 4e 54 52 : WINDOW.tEXT ENTR
6b58 : __ __ __ BYT 59 20 20 20 20 20 20 00 00 00 00 00 00 00 00 00 : Y      .........
6b68 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b78 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b88 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6b98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 73 43 52 45 : ............sCRE
6ba8 : __ __ __ BYT 45 4e 20 31 00 00 00 00 00 00 00 00 00 73 43 52 : EN 1.........sCR
6bb8 : __ __ __ BYT 45 45 4e 20 32 00 00 00 00 00 00 00 00 00 00 00 : EEN 2...........
6bc8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6bd8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6be8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6bf8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6c08 : __ __ __ BYT 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 31 00 00 : ..fULLSCREEN 1..
6c18 : __ __ __ BYT 00 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 32 00 : ...fULLSCREEN 2.
6c28 : __ __ __ BYT 00 00 00 00 62 49 47 46 4f 4e 54 20 54 45 58 54 : ....bIGFONT TEXT
6c38 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6c48 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6c58 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6c68 : __ __ __ BYT 00 00 00 00 00 00 00 00 63 48 41 52 53 45 54 20 : ........cHARSET 
6c78 : __ __ __ BYT 44 45 4d 4f 00 00 00 00 00 00 00 00 00 00 00 00 : DEMO............
6c88 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6c98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6ca8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6cb8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6cc8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 75 4c : ..............uL
6cd8 : __ __ __ BYT 54 49 4d 41 54 45 20 61 58 45 4c 20 66 00 00 66 : TIMATE aXEL f..f
6ce8 : __ __ __ BYT 41 44 45 44 20 20 20 20 20 20 20 20 20 20 00 00 : ADED          ..
6cf8 : __ __ __ BYT 73 54 4f 50 20 4d 55 53 49 43 20 20 20 20 20 00 : sTOP MUSIC     .
6d08 : __ __ __ BYT 00 72 45 53 54 41 52 54 20 4d 55 53 49 43 20 20 : .rESTART MUSIC  
6d18 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6d28 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6d38 : __ __ __ BYT 00 00 00 00 79 45 53 00 00 00 00 00 00 00 00 00 : ....yES.........
6d48 : __ __ __ BYT 00 00 00 00 00 6e 4f 20 00 00 00 00 00 00 00 00 : .....nO ........
6d58 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6d68 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6d78 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6d88 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6d98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 70 61 6c 20 20 38 : ..........pal  8
6da8 : __ __ __ BYT 30 58 32 35 00 00 00 00 00 00 00 70 61 6c 20 20 : 0X25.......pal  
6db8 : __ __ __ BYT 38 30 58 35 30 00 00 00 00 00 00 00 70 61 6c 20 : 80X50.......pal 
6dc8 : __ __ __ BYT 20 38 30 58 37 30 00 00 00 00 00 00 00 6e 74 73 :  80X70.......nts
6dd8 : __ __ __ BYT 63 20 38 30 58 32 35 00 00 00 00 00 00 00 6e 74 : c 80X25.......nt
6de8 : __ __ __ BYT 73 63 20 38 30 58 35 30 00 00 00 00 00 00 00 6e : sc 80X50.......n
6df8 : __ __ __ BYT 74 73 63 20 38 30 58 36 30 00 00 00 00 00 00 00 : tsc 80X60.......
--------------------------------------------------------------------
6e08 : __ __ __ BYT 46 4c 49 45 53 00 4a 55 4d 50 53 00 53 4c 45 45 : FLIES.JUMPS.SLEE
6e18 : __ __ __ BYT 50 53 45 41 54 53 00 00 57 41 4c 4b 53 00       : PSEATS..WALKS.
--------------------------------------------------------------------
6e26 : __ __ __ BYT 42 49 47 00 00 00 53 4d 41 4c 4c 00 41 4e 47 52 : BIG...SMALL.ANGR
6e36 : __ __ __ BYT 59 00 57 45 54 00 00 00 48 41 50 50 59 00       : Y.WET...HAPPY.
--------------------------------------------------------------------
winCfg:
6e44 : __ __ __ BSS	8
--------------------------------------------------------------------
krnio_pstatus:
6e4c : __ __ __ BSS	16
--------------------------------------------------------------------
vdc_state:
6e5c : __ __ __ BSS	25
--------------------------------------------------------------------
linebuffer:
6e75 : __ __ __ BSS	81
--------------------------------------------------------------------
windows:
6ec6 : __ __ __ BSS	39
--------------------------------------------------------------------
6f00 : __ __ __ BYT 77 45 4c 43 4f 4d 45 20 54 4f 20 6f 53 43 41 52 : wELCOME TO oSCAR
6f10 : __ __ __ BYT 36 34 20 76 64 63 20 64 45 4d 4f 2e 20 74 48 49 : 64 vdc dEMO. tHI
6f20 : __ __ __ BYT 53 20 44 45 4d 4f 20 49 53 20 57 52 49 54 54 45 : S DEMO IS WRITTE
6f30 : __ __ __ BYT 4e 20 54 4f 20 54 45 53 54 20 41 4e 44 20 44 45 : N TO TEST AND DE
6f40 : __ __ __ BYT 4d 4f 4e 53 54 52 41 54 45 20 54 48 45 20 76 64 : MONSTRATE THE vd
6f50 : __ __ __ BYT 63 20 4c 49 42 52 41 52 59 20 46 55 4e 43 54 49 : c LIBRARY FUNCTI
6f60 : __ __ __ BYT 4f 4e 53 20 69 20 48 41 56 45 20 54 52 49 45 44 : ONS i HAVE TRIED
6f70 : __ __ __ BYT 20 54 4f 20 42 55 49 4c 44 20 46 4f 52 20 54 48 :  TO BUILD FOR TH
6f80 : __ __ __ BYT 45 20 6f 53 43 41 52 36 34 20 43 4f 4d 50 49 4c : E oSCAR64 COMPIL
6f90 : __ __ __ BYT 45 52 2e 20 68 4f 50 45 20 59 4f 55 20 45 4e 4a : ER. hOPE YOU ENJ
6fa0 : __ __ __ BYT 4f 59 20 49 54 21 20 67 52 45 45 54 49 4e 47 53 : OY IT! gREETINGS
6fb0 : __ __ __ BYT 2c 20 78 41 4e 44 45 52 20 6d 4f 4c 2e 20 20 20 : , xANDER mOL.   
6fc0 : __ __ __ BYT 20 20 00                                        :   .
--------------------------------------------------------------------
multab:
7000 : __ __ __ BSS	144
--------------------------------------------------------------------
flossiec_init: ; flossiec_init(u8)->void
.s0:
01:1300 : a5 15 __ LDA P8 ; (drive + 0)
01:1302 : 8d 94 18 STA $1894 ; (fldrive + 0)
01:1305 : 85 11 __ STA P4 
01:1307 : a9 00 __ LDA #$00
01:1309 : 8d 95 18 STA $1895 ; (flvxor + 0)
01:130c : a9 02 __ LDA #$02
01:130e : 85 12 __ STA P5 
01:1310 : a9 4e __ LDA #$4e
01:1312 : 85 13 __ STA P6 
01:1314 : a9 13 __ LDA #$13
01:1316 : 85 14 __ STA P7 
01:1318 : 20 8b 28 JSR $288b ; (iec_open.s0 + 0)
01:131b : 20 e2 28 JSR $28e2 ; (iec_listen.s0 + 0)
01:131e : a2 00 __ LDX #$00
.l1004:
01:1320 : 86 45 __ STX T2 + 0 
01:1322 : bd 51 13 LDA $1351,x ; (diskcode + 0)
01:1325 : 85 0f __ STA P2 
01:1327 : 20 cf 29 JSR $29cf ; (iec_write.s0 + 0)
01:132a : a6 45 __ LDX T2 + 0 
01:132c : e8 __ __ INX
01:132d : e0 7f __ CPX #$7f
01:132f : 90 ef __ BCC $1320 ; (flossiec_init.l1004 + 0)
.s4:
01:1331 : 20 b1 28 JSR $28b1 ; (iec_unlisten.s0 + 0)
01:1334 : a5 15 __ LDA P8 ; (drive + 0)
01:1336 : 85 11 __ STA P4 
01:1338 : a9 02 __ LDA #$02
01:133a : 85 12 __ STA P5 
01:133c : 20 fb 29 JSR $29fb ; (iec_close.s0 + 0)
01:133f : a9 0f __ LDA #$0f
01:1341 : 85 12 __ STA P5 
01:1343 : a9 13 __ LDA #$13
01:1345 : 85 14 __ STA P7 
01:1347 : a9 c4 __ LDA #$c4
01:1349 : 85 13 __ STA P6 
01:134b : 4c 8b 28 JMP $288b ; (iec_open.s0 + 0)
--------------------------------------------------------------------
01:134e : __ __ __ BYT 23 32 00                                        : #2.
--------------------------------------------------------------------
diskcode: ; diskcode
01:1351 : ea __ __ NOP
01:1352 : ea __ __ NOP
01:1353 : a9 08 __ LDA #$08
01:1355 : 8d 00 18 STA $1800 ; (sid_resetsid.s0 + 34)
01:1358 : ad 02 02 LDA $0202 
01:135b : 85 0c __ STA $0c 
01:135d : ad 03 02 LDA $0203 
01:1360 : 85 0d __ STA P0 
01:1362 : a9 80 __ LDA #$80
01:1364 : 85 03 __ STA WORK + 0 
01:1366 : a2 00 __ LDX #$00
01:1368 : 8a __ __ TXA
01:1369 : 4a __ __ LSR
01:136a : 4a __ __ LSR
01:136b : 4a __ __ LSR
01:136c : 4a __ __ LSR
01:136d : 9d 00 07 STA $0700,x 
01:1370 : e8 __ __ INX
01:1371 : d0 f5 __ BNE $1368 ; (diskcode + 23)
01:1373 : a5 03 __ LDA WORK + 0 
01:1375 : 30 fc __ BMI $1373 ; (diskcode + 34)
01:1377 : 78 __ __ SEI
01:1378 : a2 00 __ LDX #$00
01:137a : a9 00 __ LDA #$00
01:137c : 8d 00 18 STA $1800 ; (sid_resetsid.s0 + 34)
01:137f : bd 00 06 LDA $0600,x 
01:1382 : a8 __ __ TAY
01:1383 : 29 0f __ AND #$0f
01:1385 : 09 01 __ ORA #$01
01:1387 : 2c 00 18 BIT $1800 ; (sid_resetsid.s0 + 34)
01:138a : d0 fb __ BNE $1387 ; (diskcode + 54)
01:138c : 8d 00 18 STA $1800 ; (sid_resetsid.s0 + 34)
01:138f : 98 __ __ TYA
01:1390 : 0a __ __ ASL
01:1391 : 29 0a __ AND #$0a
01:1393 : 8d 00 18 STA $1800 ; (sid_resetsid.s0 + 34)
01:1396 : b9 00 07 LDA $0700,y 
01:1399 : ea __ __ NOP
01:139a : 8d 00 18 STA $1800 ; (sid_resetsid.s0 + 34)
01:139d : 0a __ __ ASL
01:139e : ea __ __ NOP
01:139f : 29 0a __ AND #$0a
01:13a1 : 8d 00 18 STA $1800 ; (sid_resetsid.s0 + 34)
01:13a4 : e8 __ __ INX
01:13a5 : d0 d3 __ BNE $137a ; (diskcode + 41)
01:13a7 : a9 08 __ LDA #$08
01:13a9 : 8d 00 18 STA $1800 ; (sid_resetsid.s0 + 34)
01:13ac : ad 00 06 LDA $0600 
01:13af : f0 0e __ BEQ $13bf ; (diskcode + 110)
01:13b1 : 85 0c __ STA $0c 
01:13b3 : ad 01 06 LDA $0601 
01:13b6 : 85 0d __ STA P0 
01:13b8 : a9 80 __ LDA #$80
01:13ba : 85 03 __ STA WORK + 0 
01:13bc : 58 __ __ CLI
01:13bd : d0 b4 __ BNE $1373 ; (diskcode + 34)
01:13bf : 8d 00 18 STA $1800 ; (sid_resetsid.s0 + 34)
01:13c2 : 58 __ __ CLI
01:13c3 : 60 __ __ RTS
--------------------------------------------------------------------
01:13c4 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
fastload_mapdir: ; fastload_mapdir(const u8*)->void
.s0:
01:13c5 : a9 12 __ LDA #$12
01:13c7 : 85 13 __ STA P6 
01:13c9 : a9 01 __ LDA #$01
01:13cb : 85 14 __ STA P7 
01:13cd : 20 ec 13 JSR $13ec ; (flossiec_open.s0 + 0)
01:13d0 : a9 96 __ LDA #$96
01:13d2 : 85 0d __ STA P0 
01:13d4 : a9 18 __ LDA #$18
01:13d6 : 85 0e __ STA P1 
01:13d8 : 20 7e 14 JSR $147e ; (mapdir.l146 + 0)
01:13db : ad 00 dd LDA $dd00 
01:13de : 09 20 __ ORA #$20
01:13e0 : 8d 00 dd STA $dd00 
01:13e3 : ad 11 d0 LDA $d011 
01:13e6 : 09 10 __ ORA #$10
01:13e8 : 8d 11 d0 STA $d011 
.s1001:
01:13eb : 60 __ __ RTS
--------------------------------------------------------------------
flossiec_open: ; flossiec_open(u8,u8)->void
.s0:
01:13ec : ad 94 18 LDA $1894 ; (fldrive + 0)
01:13ef : 85 11 __ STA P4 
01:13f1 : a9 0f __ LDA #$0f
01:13f3 : 85 12 __ STA P5 
01:13f5 : 20 e2 28 JSR $28e2 ; (iec_listen.s0 + 0)
01:13f8 : a9 55 __ LDA #$55
01:13fa : 85 0f __ STA P2 
01:13fc : 20 cf 29 JSR $29cf ; (iec_write.s0 + 0)
01:13ff : a9 34 __ LDA #$34
01:1401 : 85 0f __ STA P2 
01:1403 : 20 cf 29 JSR $29cf ; (iec_write.s0 + 0)
01:1406 : a5 13 __ LDA P6 ; (track + 0)
01:1408 : 85 0f __ STA P2 
01:140a : 20 cf 29 JSR $29cf ; (iec_write.s0 + 0)
01:140d : a5 14 __ LDA P7 ; (sector + 0)
01:140f : 85 0f __ STA P2 
01:1411 : 20 cf 29 JSR $29cf ; (iec_write.s0 + 0)
01:1414 : 20 b1 28 JSR $28b1 ; (iec_unlisten.s0 + 0)
01:1417 : ad 00 dd LDA $dd00 
01:141a : 09 20 __ ORA #$20
01:141c : 8d 00 dd STA $dd00 
01:141f : ad 11 d0 LDA $d011 
01:1422 : 29 ef __ AND #$ef
01:1424 : 8d 11 d0 STA $d011 
.l104:
01:1427 : 2c 11 d0 BIT $d011 
01:142a : 30 fb __ BMI $1427 ; (flossiec_open.l104 + 0)
.l5:
01:142c : 2c 11 d0 BIT $d011 
01:142f : 10 fb __ BPL $142c ; (flossiec_open.l5 + 0)
.s1:
01:1431 : ad 00 dd LDA $dd00 
01:1434 : 29 07 __ AND #$07
01:1436 : 85 1b __ STA ACCU + 0 
01:1438 : 4a __ __ LSR
01:1439 : 4a __ __ LSR
01:143a : 45 1b __ EOR ACCU + 0 
01:143c : 49 ff __ EOR #$ff
01:143e : cd 95 18 CMP $1895 ; (flvxor + 0)
01:1441 : f0 2b __ BEQ $146e ; (flossiec_open.l17 + 0)
.s9:
01:1443 : 8d 95 18 STA $1895 ; (flvxor + 0)
01:1446 : a0 00 __ LDY #$00
01:1448 : 84 1b __ STY ACCU + 0 
01:144a : aa __ __ TAX
.l1004:
01:144b : 8a __ __ TXA
01:144c : 45 1b __ EOR ACCU + 0 
01:144e : 85 1b __ STA ACCU + 0 
01:1450 : 29 11 __ AND #$11
01:1452 : 0a __ __ ASL
01:1453 : 0a __ __ ASL
01:1454 : 0a __ __ ASL
01:1455 : 45 1b __ EOR ACCU + 0 
01:1457 : 29 99 __ AND #$99
01:1459 : 45 1b __ EOR ACCU + 0 
01:145b : 85 1c __ STA ACCU + 1 
01:145d : a5 1b __ LDA ACCU + 0 
01:145f : 29 88 __ AND #$88
01:1461 : 4a __ __ LSR
01:1462 : 4a __ __ LSR
01:1463 : 4a __ __ LSR
01:1464 : 05 1c __ ORA ACCU + 1 
01:1466 : 99 00 19 STA $1900,y ; (remap + 0)
01:1469 : c8 __ __ INY
01:146a : 84 1b __ STY ACCU + 0 
01:146c : d0 dd __ BNE $144b ; (flossiec_open.l1004 + 0)
.l17:
01:146e : 2c 11 d0 BIT $d011 
01:1471 : 30 fb __ BMI $146e ; (flossiec_open.l17 + 0)
.l20:
01:1473 : 2c 11 d0 BIT $d011 
01:1476 : 10 fb __ BPL $1473 ; (flossiec_open.l20 + 0)
.s16:
01:1478 : a9 00 __ LDA #$00
01:147a : 8d aa 18 STA $18aa ; (flpos + 0)
.s1001:
01:147d : 60 __ __ RTS
--------------------------------------------------------------------
mapdir: ; mapdir(const u8*,struct floss_blk*)->void
.l146:
01:147e : 20 35 15 JSR $1535 ; (fl_read_buf.s0 + 0)
01:1481 : a9 00 __ LDA #$00
.l3:
01:1483 : 85 1b __ STA ACCU + 0 
01:1485 : a8 __ __ TAY
01:1486 : be 02 1a LDX $1a02,y ; (rbuffer + 2)
01:1489 : bd 00 19 LDA $1900,x ; (remap + 0)
01:148c : c9 82 __ CMP #$82
01:148e : f0 10 __ BEQ $14a0 ; (mapdir.s5 + 0)
.s142:
01:1490 : 18 __ __ CLC
01:1491 : a5 1b __ LDA ACCU + 0 
01:1493 : 69 20 __ ADC #$20
01:1495 : d0 ec __ BNE $1483 ; (mapdir.l3 + 0)
.s4:
01:1497 : ae 00 1a LDX $1a00 ; (rbuffer + 0)
01:149a : bd 00 19 LDA $1900,x ; (remap + 0)
01:149d : d0 df __ BNE $147e ; (mapdir.l146 + 0)
.s1001:
01:149f : 60 __ __ RTS
.s5:
01:14a0 : a9 00 __ LDA #$00
01:14a2 : 85 1c __ STA ACCU + 1 
01:14a4 : 18 __ __ CLC
.l11:
01:14a5 : a5 1c __ LDA ACCU + 1 
01:14a7 : 65 1b __ ADC ACCU + 0 
01:14a9 : a8 __ __ TAY
01:14aa : be 05 1a LDX $1a05,y ; (rbuffer + 5)
01:14ad : bd 00 19 LDA $1900,x ; (remap + 0)
01:14b0 : c9 a0 __ CMP #$a0
01:14b2 : f0 0c __ BEQ $14c0 ; (mapdir.s10 + 0)
.s9:
01:14b4 : a6 1c __ LDX ACCU + 1 
01:14b6 : e8 __ __ INX
01:14b7 : 86 1c __ STX ACCU + 1 
01:14b9 : 9d e5 bf STA $bfe5,x ; (wrapbuffer + 77)
01:14bc : e0 10 __ CPX #$10
01:14be : 90 e5 __ BCC $14a5 ; (mapdir.l11 + 0)
.s10:
01:14c0 : a9 00 __ LDA #$00
01:14c2 : a6 1c __ LDX ACCU + 1 
01:14c4 : 9d e6 bf STA $bfe6,x ; (wrapbuffer + 78)
01:14c7 : 85 1c __ STA ACCU + 1 
01:14c9 : a8 __ __ TAY
.l13:
01:14ca : a9 00 __ LDA #$00
01:14cc : 85 1d __ STA ACCU + 2 
01:14ce : ad e6 bf LDA $bfe6 ; (wrapbuffer + 78)
01:14d1 : f0 17 __ BEQ $14ea ; (mapdir.s17 + 0)
.l18:
01:14d3 : a6 1d __ LDX ACCU + 2 
01:14d5 : bd e6 bf LDA $bfe6,x ; (wrapbuffer + 78)
01:14d8 : a6 1c __ LDX ACCU + 1 
01:14da : dd 0d 2a CMP $2a0d,x 
01:14dd : d0 0b __ BNE $14ea ; (mapdir.s17 + 0)
.s16:
01:14df : e6 1d __ INC ACCU + 2 
01:14e1 : e6 1c __ INC ACCU + 1 
01:14e3 : a6 1d __ LDX ACCU + 2 
01:14e5 : bd e6 bf LDA $bfe6,x ; (wrapbuffer + 78)
01:14e8 : d0 e9 __ BNE $14d3 ; (mapdir.l18 + 0)
.s17:
01:14ea : a6 1d __ LDX ACCU + 2 
01:14ec : bd e6 bf LDA $bfe6,x ; (wrapbuffer + 78)
01:14ef : d0 28 __ BNE $1519 ; (mapdir.s1018 + 0)
.s22:
01:14f1 : a6 1c __ LDX ACCU + 1 
01:14f3 : bd 0d 2a LDA $2a0d,x 
01:14f6 : f0 04 __ BEQ $14fc ; (mapdir.s19 + 0)
.s23:
01:14f8 : c9 2c __ CMP #$2c
01:14fa : d0 1d __ BNE $1519 ; (mapdir.s1018 + 0)
.s19:
01:14fc : 98 __ __ TYA
01:14fd : 0a __ __ ASL
01:14fe : a8 __ __ TAY
01:14ff : a6 1b __ LDX ACCU + 0 
01:1501 : bd 03 1a LDA $1a03,x ; (rbuffer + 3)
01:1504 : aa __ __ TAX
01:1505 : bd 00 19 LDA $1900,x ; (remap + 0)
01:1508 : 91 0d __ STA (P0),y ; (blks + 0)
01:150a : a6 1b __ LDX ACCU + 0 
01:150c : bd 04 1a LDA $1a04,x ; (rbuffer + 4)
01:150f : aa __ __ TAX
01:1510 : bd 00 19 LDA $1900,x ; (remap + 0)
01:1513 : c8 __ __ INY
01:1514 : 91 0d __ STA (P0),y ; (blks + 0)
01:1516 : 4c 90 14 JMP $1490 ; (mapdir.s142 + 0)
.s1018:
01:1519 : a6 1c __ LDX ACCU + 1 
01:151b : bd 0d 2a LDA $2a0d,x 
01:151e : f0 0a __ BEQ $152a ; (mapdir.s1017 + 0)
.l30:
01:1520 : e8 __ __ INX
01:1521 : c9 2c __ CMP #$2c
01:1523 : f0 05 __ BEQ $152a ; (mapdir.s1017 + 0)
.s27:
01:1525 : bd 0d 2a LDA $2a0d,x 
01:1528 : d0 f6 __ BNE $1520 ; (mapdir.l30 + 0)
.s1017:
01:152a : 86 1c __ STX ACCU + 1 
01:152c : c8 __ __ INY
01:152d : bd 0d 2a LDA $2a0d,x 
01:1530 : d0 98 __ BNE $14ca ; (mapdir.l13 + 0)
01:1532 : 4c 90 14 JMP $1490 ; (mapdir.s142 + 0)
--------------------------------------------------------------------
fl_read_buf: ; fl_read_buf()->void
.s0:
01:1535 : ad 00 dd LDA $dd00 
01:1538 : 29 ef __ AND #$ef
01:153a : 85 1b __ STA ACCU + 0 
01:153c : 8d 00 dd STA $dd00 
01:153f : 29 df __ AND #$df
01:1541 : 85 1c __ STA ACCU + 1 
01:1543 : ad 00 dd LDA $dd00 
01:1546 : 29 40 __ AND #$40
01:1548 : f0 f9 __ BEQ $1543 ; (fl_read_buf.s0 + 14)
01:154a : 08 __ __ PHP
01:154b : 68 __ __ PLA
01:154c : 29 04 __ AND #$04
01:154e : f0 2f __ BEQ $157f ; (fl_read_buf.s0 + 74)
01:1550 : a0 00 __ LDY #$00
01:1552 : 38 __ __ SEC
01:1553 : a6 1c __ LDX ACCU + 1 
01:1555 : 8e 00 dd STX $dd00 
01:1558 : ee 20 d0 INC $d020 
01:155b : a6 1b __ LDX ACCU + 0 
01:155d : ea __ __ NOP
01:155e : ad 00 dd LDA $dd00 
01:1561 : 4a __ __ LSR
01:1562 : 4a __ __ LSR
01:1563 : ea __ __ NOP
01:1564 : 4d 00 dd EOR $dd00 
01:1567 : 4a __ __ LSR
01:1568 : 4a __ __ LSR
01:1569 : ea __ __ NOP
01:156a : 4d 00 dd EOR $dd00 
01:156d : 4a __ __ LSR
01:156e : 4a __ __ LSR
01:156f : 38 __ __ SEC
01:1570 : 4d 00 dd EOR $dd00 
01:1573 : 8e 00 dd STX $dd00 
01:1576 : 99 00 1a STA $1a00,y ; (rbuffer + 0)
01:1579 : c8 __ __ INY
01:157a : d0 d7 __ BNE $1553 ; (fl_read_buf.s0 + 30)
01:157c : 4c ae 15 JMP $15ae ; (fl_read_buf.s1001 + 0)
01:157f : a0 00 __ LDY #$00
01:1581 : 38 __ __ SEC
01:1582 : a6 1c __ LDX ACCU + 1 
01:1584 : 58 __ __ CLI
01:1585 : 78 __ __ SEI
01:1586 : 8e 00 dd STX $dd00 
01:1589 : ee 20 d0 INC $d020 
01:158c : a6 1b __ LDX ACCU + 0 
01:158e : ea __ __ NOP
01:158f : ad 00 dd LDA $dd00 
01:1592 : 4a __ __ LSR
01:1593 : 4a __ __ LSR
01:1594 : ea __ __ NOP
01:1595 : 4d 00 dd EOR $dd00 
01:1598 : 4a __ __ LSR
01:1599 : 4a __ __ LSR
01:159a : ea __ __ NOP
01:159b : 4d 00 dd EOR $dd00 
01:159e : 4a __ __ LSR
01:159f : 4a __ __ LSR
01:15a0 : 38 __ __ SEC
01:15a1 : 4d 00 dd EOR $dd00 
01:15a4 : 8e 00 dd STX $dd00 
01:15a7 : 99 00 1a STA $1a00,y ; (rbuffer + 0)
01:15aa : c8 __ __ INY
01:15ab : d0 d5 __ BNE $1582 ; (fl_read_buf.s0 + 77)
01:15ad : 58 __ __ CLI
.s1001:
01:15ae : 60 __ __ RTS
--------------------------------------------------------------------
bnk_redef_charset: ; bnk_redef_charset(u16,u8,volatile u8*,u16)->void
.s0:
01:15af : ad 00 ff LDA $ff00 
01:15b2 : 85 43 __ STA T0 + 0 
01:15b4 : a9 0e __ LDA #$0e
01:15b6 : 8d 00 ff STA $ff00 
01:15b9 : 20 5f 2c JSR $2c5f ; (vdc_mem_addr@proxy + 0)
01:15bc : a5 14 __ LDA P7 ; (size + 0)
01:15be : 05 15 __ ORA P8 ; (size + 1)
01:15c0 : d0 06 __ BNE $15c8 ; (bnk_redef_charset.l2 + 0)
.s3:
01:15c2 : a5 43 __ LDA T0 + 0 
01:15c4 : 8d 00 ff STA $ff00 
.s1001:
01:15c7 : 60 __ __ RTS
.l2:
01:15c8 : a2 08 __ LDX #$08
.l5:
01:15ca : a5 11 __ LDA P4 ; (scr + 0)
01:15cc : 8d 00 ff STA $ff00 
01:15cf : a0 00 __ LDY #$00
01:15d1 : b1 12 __ LDA (P5),y ; (sp + 0)
01:15d3 : a8 __ __ TAY
01:15d4 : e6 12 __ INC P5 ; (sp + 0)
01:15d6 : d0 02 __ BNE $15da ; (bnk_redef_charset.s1012 + 0)
.s1011:
01:15d8 : e6 13 __ INC P6 ; (sp + 1)
.s1012:
01:15da : a9 0e __ LDA #$0e
01:15dc : 8d 00 ff STA $ff00 
.l117:
01:15df : 2c 00 d6 BIT $d600 
01:15e2 : 10 fb __ BPL $15df ; (bnk_redef_charset.l117 + 0)
.s10:
01:15e4 : 8c 01 d6 STY $d601 
01:15e7 : ca __ __ DEX
01:15e8 : d0 e0 __ BNE $15ca ; (bnk_redef_charset.l5 + 0)
.s7:
01:15ea : a2 08 __ LDX #$08
.l12:
01:15ec : 2c 00 d6 BIT $d600 
01:15ef : 10 fb __ BPL $15ec ; (bnk_redef_charset.l12 + 0)
.s17:
01:15f1 : a9 00 __ LDA #$00
01:15f3 : 8d 01 d6 STA $d601 
01:15f6 : ca __ __ DEX
01:15f7 : d0 f3 __ BNE $15ec ; (bnk_redef_charset.l12 + 0)
.s14:
01:15f9 : a5 14 __ LDA P7 ; (size + 0)
01:15fb : d0 02 __ BNE $15ff ; (bnk_redef_charset.s1007 + 0)
.s1006:
01:15fd : c6 15 __ DEC P8 ; (size + 1)
.s1007:
01:15ff : c6 14 __ DEC P7 ; (size + 0)
01:1601 : d0 c5 __ BNE $15c8 ; (bnk_redef_charset.l2 + 0)
.s1008:
01:1603 : a5 15 __ LDA P8 ; (size + 1)
01:1605 : d0 c1 __ BNE $15c8 ; (bnk_redef_charset.l2 + 0)
01:1607 : 4c c2 15 JMP $15c2 ; (bnk_redef_charset.s3 + 0)
--------------------------------------------------------------------
fastload_load@proxy: ; fastload_load@proxy
01:160a : a9 00 __ LDA #$00
01:160c : 85 15 __ STA P8 
--------------------------------------------------------------------
fastload_load: ; fastload_load(u8,const u8*,u8)->bool
.s0:
01:160e : a5 15 __ LDA P8 ; (start + 0)
01:1610 : 85 45 __ STA T1 + 0 
01:1612 : a5 16 __ LDA P9 ; (start + 1)
01:1614 : 85 46 __ STA T1 + 1 
01:1616 : ad 00 ff LDA $ff00 
01:1619 : 85 44 __ STA T0 + 0 
01:161b : a5 17 __ LDA P10 ; (fnumber + 0)
01:161d : 0a __ __ ASL
01:161e : aa __ __ TAX
01:161f : bd 96 18 LDA $1896,x ; (blks + 0)
01:1622 : 85 13 __ STA P6 
01:1624 : bd 97 18 LDA $1897,x ; (blks + 1)
01:1627 : 85 14 __ STA P7 
01:1629 : 20 ec 13 JSR $13ec ; (flossiec_open.s0 + 0)
01:162c : a9 7e __ LDA #$7e
01:162e : 8d 00 ff STA $ff00 
.l33:
01:1631 : ae 00 1a LDX $1a00 ; (rbuffer + 0)
01:1634 : bd 00 19 LDA $1900,x ; (remap + 0)
01:1637 : d0 30 __ BNE $1669 ; (fastload_load.s10 + 0)
.s12:
01:1639 : ad aa 18 LDA $18aa ; (flpos + 0)
01:163c : ae 01 1a LDX $1a01 ; (rbuffer + 1)
01:163f : dd 00 19 CMP $1900,x ; (remap + 0)
01:1642 : 90 25 __ BCC $1669 ; (fastload_load.s10 + 0)
.s9:
01:1644 : a5 44 __ LDA T0 + 0 
01:1646 : 8d 00 ff STA $ff00 
01:1649 : ad 00 dd LDA $dd00 
01:164c : 09 20 __ ORA #$20
01:164e : 8d 00 dd STA $dd00 
01:1651 : ad 11 d0 LDA $d011 
01:1654 : 09 10 __ ORA #$10
01:1656 : 8d 11 d0 STA $d011 
01:1659 : a5 16 __ LDA P9 ; (start + 1)
01:165b : c5 46 __ CMP T1 + 1 
01:165d : d0 04 __ BNE $1663 ; (fastload_load.s1006 + 0)
.s1005:
01:165f : a5 15 __ LDA P8 ; (start + 0)
01:1661 : c5 45 __ CMP T1 + 0 
.s1006:
01:1663 : a9 00 __ LDA #$00
01:1665 : 2a __ __ ROL
01:1666 : 49 01 __ EOR #$01
.s1001:
01:1668 : 60 __ __ RTS
.s10:
01:1669 : ad aa 18 LDA $18aa ; (flpos + 0)
01:166c : d0 08 __ BNE $1676 ; (fastload_load.s17 + 0)
.s15:
01:166e : 20 35 15 JSR $1535 ; (fl_read_buf.s0 + 0)
01:1671 : a9 02 __ LDA #$02
01:1673 : 8d aa 18 STA $18aa ; (flpos + 0)
.s17:
01:1676 : ee aa 18 INC $18aa ; (flpos + 0)
01:1679 : a8 __ __ TAY
01:167a : be 00 1a LDX $1a00,y ; (rbuffer + 0)
01:167d : bd 00 19 LDA $1900,x ; (remap + 0)
01:1680 : a0 00 __ LDY #$00
01:1682 : 91 45 __ STA (T1 + 0),y 
01:1684 : e6 45 __ INC T1 + 0 
01:1686 : d0 a9 __ BNE $1631 ; (fastload_load.l33 + 0)
.s1009:
01:1688 : e6 46 __ INC T1 + 1 
01:168a : 4c 31 16 JMP $1631 ; (fastload_load.l33 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:168d : a9 0e __ LDA #$0e
01:168f : 85 0d __ STA P0 
01:1691 : a9 75 __ LDA #$75
01:1693 : 85 0e __ STA P1 
01:1695 : a9 6e __ LDA #$6e
01:1697 : 85 0f __ STA P2 
01:1699 : a5 46 __ LDA $46 
01:169b : 85 12 __ STA P5 
01:169d : a9 00 __ LDA #$00
01:169f : 85 13 __ STA P6 
--------------------------------------------------------------------
bnk_cpyfromvdc: ; bnk_cpyfromvdc(u8,volatile u8*,u16,u16)->void
.s0:
01:16a1 : ad 00 ff LDA $ff00 
01:16a4 : 85 1d __ STA ACCU + 2 
01:16a6 : a6 12 __ LDX P5 ; (size + 0)
.l110:
01:16a8 : 8a __ __ TXA
01:16a9 : 05 13 __ ORA P6 ; (size + 1)
01:16ab : d0 06 __ BNE $16b3 ; (bnk_cpyfromvdc.s2 + 0)
.s3:
01:16ad : a5 1d __ LDA ACCU + 2 
01:16af : 8d 00 ff STA $ff00 
.s1001:
01:16b2 : 60 __ __ RTS
.s2:
01:16b3 : a9 0e __ LDA #$0e
01:16b5 : 8d 00 ff STA $ff00 
01:16b8 : a5 10 __ LDA P3 ; (vdcsrc + 0)
01:16ba : a8 __ __ TAY
01:16bb : 18 __ __ CLC
01:16bc : 69 01 __ ADC #$01
01:16be : 85 10 __ STA P3 ; (vdcsrc + 0)
01:16c0 : a5 11 __ LDA P4 ; (vdcsrc + 1)
01:16c2 : 85 1b __ STA ACCU + 0 
01:16c4 : 69 00 __ ADC #$00
01:16c6 : 85 11 __ STA P4 ; (vdcsrc + 1)
01:16c8 : a9 12 __ LDA #$12
01:16ca : 8d 00 d6 STA $d600 
.l111:
01:16cd : 2c 00 d6 BIT $d600 
01:16d0 : 10 fb __ BPL $16cd ; (bnk_cpyfromvdc.l111 + 0)
.s10:
01:16d2 : a5 1b __ LDA ACCU + 0 
01:16d4 : 8d 01 d6 STA $d601 
01:16d7 : a9 13 __ LDA #$13
01:16d9 : 8d 00 d6 STA $d600 
.l113:
01:16dc : 2c 00 d6 BIT $d600 
01:16df : 10 fb __ BPL $16dc ; (bnk_cpyfromvdc.l113 + 0)
.s15:
01:16e1 : 8c 01 d6 STY $d601 
01:16e4 : a9 1f __ LDA #$1f
01:16e6 : 8d 00 d6 STA $d600 
.l115:
01:16e9 : 2c 00 d6 BIT $d600 
01:16ec : 10 fb __ BPL $16e9 ; (bnk_cpyfromvdc.l115 + 0)
.s19:
01:16ee : a5 0d __ LDA P0 ; (dcr + 0)
01:16f0 : ac 01 d6 LDY $d601 
01:16f3 : 8d 00 ff STA $ff00 
01:16f6 : a5 0e __ LDA P1 ; (dp + 0)
01:16f8 : 85 1b __ STA ACCU + 0 
01:16fa : 18 __ __ CLC
01:16fb : 69 01 __ ADC #$01
01:16fd : 85 0e __ STA P1 ; (dp + 0)
01:16ff : a5 0f __ LDA P2 ; (dp + 1)
01:1701 : 85 1c __ STA ACCU + 1 
01:1703 : 69 00 __ ADC #$00
01:1705 : 85 0f __ STA P2 ; (dp + 1)
01:1707 : 98 __ __ TYA
01:1708 : a0 00 __ LDY #$00
01:170a : 91 1b __ STA (ACCU + 0),y 
01:170c : a9 0e __ LDA #$0e
01:170e : 8d 00 ff STA $ff00 
01:1711 : ca __ __ DEX
01:1712 : e0 ff __ CPX #$ff
01:1714 : d0 92 __ BNE $16a8 ; (bnk_cpyfromvdc.l110 + 0)
.s1008:
01:1716 : c6 13 __ DEC P6 ; (size + 1)
01:1718 : 4c a8 16 JMP $16a8 ; (bnk_cpyfromvdc.l110 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:171b : a9 0e __ LDA #$0e
01:171d : 85 11 __ STA P4 
01:171f : a9 75 __ LDA #$75
01:1721 : 85 12 __ STA P5 
01:1723 : a9 6e __ LDA #$6e
01:1725 : 85 13 __ STA P6 
01:1727 : a9 00 __ LDA #$00
01:1729 : 85 15 __ STA P8 
--------------------------------------------------------------------
bnk_cpytovdc: ; bnk_cpytovdc(u16,u8,volatile u8*,u16)->void
.s0:
01:172b : ad 00 ff LDA $ff00 
01:172e : 85 43 __ STA T0 + 0 
01:1730 : a9 0e __ LDA #$0e
01:1732 : 8d 00 ff STA $ff00 
01:1735 : 20 5f 2c JSR $2c5f ; (vdc_mem_addr@proxy + 0)
01:1738 : a5 14 __ LDA P7 ; (size + 0)
01:173a : 05 15 __ ORA P8 ; (size + 1)
01:173c : d0 06 __ BNE $1744 ; (bnk_cpytovdc.s1008 + 0)
.s3:
01:173e : a5 43 __ LDA T0 + 0 
01:1740 : 8d 00 ff STA $ff00 
.s1001:
01:1743 : 60 __ __ RTS
.s1008:
01:1744 : a6 14 __ LDX P7 ; (size + 0)
.l2:
01:1746 : a5 11 __ LDA P4 ; (scr + 0)
01:1748 : 8d 00 ff STA $ff00 
01:174b : a0 00 __ LDY #$00
01:174d : b1 12 __ LDA (P5),y ; (sp + 0)
01:174f : a8 __ __ TAY
01:1750 : e6 12 __ INC P5 ; (sp + 0)
01:1752 : d0 02 __ BNE $1756 ; (bnk_cpytovdc.s1010 + 0)
.s1009:
01:1754 : e6 13 __ INC P6 ; (sp + 1)
.s1010:
01:1756 : a9 0e __ LDA #$0e
01:1758 : 8d 00 ff STA $ff00 
.l52:
01:175b : 2c 00 d6 BIT $d600 
01:175e : 10 fb __ BPL $175b ; (bnk_cpytovdc.l52 + 0)
.s6:
01:1760 : 8c 01 d6 STY $d601 
01:1763 : 8a __ __ TXA
01:1764 : d0 02 __ BNE $1768 ; (bnk_cpytovdc.s1005 + 0)
.s1004:
01:1766 : c6 15 __ DEC P8 ; (size + 1)
.s1005:
01:1768 : ca __ __ DEX
01:1769 : d0 db __ BNE $1746 ; (bnk_cpytovdc.l2 + 0)
.s1006:
01:176b : a5 15 __ LDA P8 ; (size + 1)
01:176d : d0 d7 __ BNE $1746 ; (bnk_cpytovdc.l2 + 0)
01:176f : 4c 3e 17 JMP $173e ; (bnk_cpytovdc.s3 + 0)
--------------------------------------------------------------------
sid_startmusic: ; sid_startmusic()->void
.s0:
01:1772 : ad 00 ff LDA $ff00 
01:1775 : 85 43 __ STA T0 + 0 
01:1777 : a9 7e __ LDA #$7e
01:1779 : 8d 00 ff STA $ff00 
01:177c : 78 __ __ SEI
01:177d : a9 7e __ LDA #$7e
01:177f : 8d 00 ff STA $ff00 
01:1782 : a9 00 __ LDA #$00
01:1784 : 20 00 20 JSR $2000 ; (bnk_init.s1000 + 10)
01:1787 : ad 14 03 LDA $0314 
01:178a : 8d ab 18 STA $18ab ; (sid_irq + 0)
01:178d : a9 a4 __ LDA #$a4
01:178f : 8d 14 03 STA $0314 
01:1792 : ad 15 03 LDA $0315 
01:1795 : 8d ac 18 STA $18ac ; (sid_irq + 1)
01:1798 : a9 17 __ LDA #$17
01:179a : 8d 15 03 STA $0315 
01:179d : 58 __ __ CLI
01:179e : a5 43 __ LDA T0 + 0 
01:17a0 : 8d 00 ff STA $ff00 
.s1001:
01:17a3 : 60 __ __ RTS
--------------------------------------------------------------------
sid_interrupt: ; sid_interrupt
01:17a4 : ad ad 18 LDA $18ad ; (sid_pause + 0)
01:17a7 : d0 20 __ BNE $17c9 ; (sid_interrupt + 37)
01:17a9 : ad 00 ff LDA $ff00 
01:17ac : 8d ae 18 STA $18ae ; (sid_oldcr + 0)
01:17af : a9 7e __ LDA #$7e
01:17b1 : 8d 00 ff STA $ff00 
01:17b4 : 20 03 20 JSR $2003 ; (bnk_init.s0 + 2)
01:17b7 : ad ae 18 LDA $18ae ; (sid_oldcr + 0)
01:17ba : 8d 00 ff STA $ff00 
01:17bd : ad ab 18 LDA $18ab ; (sid_irq + 0)
01:17c0 : 8d ca 17 STA $17ca ; (sid_interrupt + 38)
01:17c3 : ad ac 18 LDA $18ac ; (sid_irq + 1)
01:17c6 : 8d cb 17 STA $17cb ; (sid_interrupt + 39)
01:17c9 : 4c 65 fa JMP $fa65 
--------------------------------------------------------------------
bnk_writeb: ; bnk_writeb(u8,volatile u8*,u8)->void
.s0:
01:17cc : a9 0e __ LDA #$0e
01:17ce : ae 00 ff LDX $ff00 
01:17d1 : 8d 00 ff STA $ff00 
01:17d4 : a5 0f __ LDA P2 ; (b + 0)
01:17d6 : a0 00 __ LDY #$00
01:17d8 : 91 0d __ STA (P0),y ; (p + 0)
01:17da : 8e 00 ff STX $ff00 
.s1001:
01:17dd : 60 __ __ RTS
--------------------------------------------------------------------
sid_resetsid: ; sid_resetsid()->void
.s0:
01:17de : a2 18 __ LDX #$18
01:17e0 : a9 00 __ LDA #$00
01:17e2 : 9d 00 d4 STA $d400,x 
01:17e5 : ca __ __ DEX
01:17e6 : 10 fa __ BPL $17e2 ; (sid_resetsid.s0 + 4)
01:17e8 : a9 08 __ LDA #$08
01:17ea : 8d 04 d4 STA $d404 
01:17ed : 8d 0b d4 STA $d40b 
01:17f0 : 8d 12 d4 STA $d412 
01:17f3 : a2 03 __ LDX #$03
01:17f5 : 2c 11 d0 BIT $d011 
01:17f8 : 10 fb __ BPL $17f5 ; (sid_resetsid.s0 + 23)
01:17fa : 2c 11 d0 BIT $d011 
01:17fd : 30 fb __ BMI $17fa ; (sid_resetsid.s0 + 28)
01:17ff : ca __ __ DEX
01:1800 : 10 f3 __ BPL $17f5 ; (sid_resetsid.s0 + 23)
01:1802 : a9 00 __ LDA #$00
01:1804 : 8d 04 d4 STA $d404 
01:1807 : 8d 0b d4 STA $d40b 
01:180a : 8d 12 d4 STA $d412 
01:180d : a9 00 __ LDA #$00
01:180f : 8d 18 d4 STA $d418 
.s1001:
01:1812 : 60 __ __ RTS
--------------------------------------------------------------------
sid_pausemusic: ; sid_pausemusic()->void
--------------------------------------------------------------------
bnk_load@proxy: ; bnk_load@proxy
01:1813 : ad ff 61 LDA $61ff ; (bootdevice + 0)
01:1816 : 85 0f __ STA P2 
01:1818 : a9 00 __ LDA #$00
01:181a : 85 10 __ STA P3 
--------------------------------------------------------------------
bnk_load: ; bnk_load(u8,u8,const u8*,const u8*)->bool
.s0:
01:181c : a9 01 __ LDA #$01
01:181e : a2 00 __ LDX #$00
01:1820 : 20 68 ff JSR $ff68 
01:1823 : a5 12 __ LDA P5 ; (fname + 0)
01:1825 : 85 0d __ STA P0 
01:1827 : a5 13 __ LDA P6 ; (fname + 1)
01:1829 : 85 0e __ STA P1 
01:182b : 20 e3 27 JSR $27e3 ; (krnio_setnam.s0 + 0)
01:182e : a9 01 __ LDA #$01
01:1830 : a6 0f __ LDX P2 
01:1832 : a0 00 __ LDY #$00
01:1834 : 20 ba ff JSR $ffba 
01:1837 : a9 00 __ LDA #$00
01:1839 : a6 10 __ LDX P3 
01:183b : a4 11 __ LDY P4 
01:183d : 20 d5 ff JSR $ffd5 
01:1840 : a9 00 __ LDA #$00
01:1842 : b0 02 __ BCS $1846 ; (bnk_load.s0 + 42)
01:1844 : a9 01 __ LDA #$01
01:1846 : 85 1b __ STA ACCU + 0 
.s1001:
01:1848 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_readb: ; bnk_readb(u8,volatile u8*)->u8
.s0:
01:1849 : a5 0d __ LDA P0 ; (cr + 0)
01:184b : ae 00 ff LDX $ff00 
01:184e : 8d 00 ff STA $ff00 
01:1851 : a0 00 __ LDY #$00
01:1853 : b1 0e __ LDA (P1),y ; (p + 0)
01:1855 : 8e 00 ff STX $ff00 
.s1001:
01:1858 : 60 __ __ RTS
--------------------------------------------------------------------
sid_stopmusic: ; sid_stopmusic()->void
.s0:
01:1859 : 78 __ __ SEI
01:185a : ae ab 18 LDX $18ab ; (sid_irq + 0)
01:185d : ac ac 18 LDY $18ac ; (sid_irq + 1)
01:1860 : 8e 14 03 STX $0314 
01:1863 : 8c 15 03 STY $0315 
01:1866 : 58 __ __ CLI
01:1867 : 4c de 17 JMP $17de ; (sid_resetsid.s0 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:186a : a9 0e __ LDA #$0e
01:186c : 85 0d __ STA P0 
01:186e : a9 75 __ LDA #$75
01:1870 : 85 0e __ STA P1 
01:1872 : a9 6e __ LDA #$6e
01:1874 : 85 0f __ STA P2 
01:1876 : a5 47 __ LDA $47 
01:1878 : 85 12 __ STA P5 
01:187a : a9 00 __ LDA #$00
01:187c : 85 13 __ STA P6 
01:187e : 4c a1 16 JMP $16a1 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:1881 : a9 0e __ LDA #$0e
01:1883 : 85 0d __ STA P0 
01:1885 : a9 75 __ LDA #$75
01:1887 : 85 0e __ STA P1 
01:1889 : a9 6e __ LDA #$6e
01:188b : 85 0f __ STA P2 
01:188d : a9 00 __ LDA #$00
01:188f : 85 13 __ STA P6 
01:1891 : 4c a1 16 JMP $16a1 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
fldrive:
01:1894 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
flvxor:
01:1895 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
blks:
01:1896 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:18a6 : __ __ __ BYT 00 00 00 00                                     : ....
--------------------------------------------------------------------
flpos:
01:18aa : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sid_irq:
01:18ab : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
sid_pause:
01:18ad : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sid_oldcr:
01:18ae : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
remap:
01:1900 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1910 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1920 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1930 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1940 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1950 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1960 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1970 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1980 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1990 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:19a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:19b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:19c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:19d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:19e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:19f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
rbuffer:
01:1a00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1a10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1a20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1a30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1a40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1a50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1a60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1a70 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1a80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1a90 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1aa0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1ab0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1ac0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1ad0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1ae0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:1af0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
