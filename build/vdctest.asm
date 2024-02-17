; Compiled with 1.27.236
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
1c13 : 8e ff 2b STX $2bff ; (spentry + 0)
1c16 : a9 c3 __ LDA #$c3
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 70 __ LDA #$70
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 71 __ LDA #$71
1c21 : e9 70 __ SBC #$70
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
1c50 : a9 12 __ LDA #$12
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
1c84 : 9d 14 be STA $be14,x ; (main@stack + 0)
1c87 : ca __ __ DEX
1c88 : 10 f8 __ BPL $1c82 ; (main.s1000 + 2)
1c8a : 38 __ __ SEC
1c8b : a5 23 __ LDA SP + 0 
1c8d : e9 0a __ SBC #$0a
1c8f : 85 23 __ STA SP + 0 
1c91 : b0 02 __ BCS $1c95 ; (main.s0 + 0)
1c93 : c6 24 __ DEC SP + 1 
.s0:
1c95 : 20 24 20 JSR $2024 ; (cia_init.s0 + 0)
1c98 : a9 7f __ LDA #$7f
1c9a : 85 0d __ STA P0 
1c9c : a9 00 __ LDA #$00
1c9e : 85 10 __ STA P3 
1ca0 : 85 0e __ STA P1 
1ca2 : a9 20 __ LDA #$20
1ca4 : 85 11 __ STA P4 
1ca6 : a9 a8 __ LDA #$a8
1ca8 : 85 0f __ STA P2 
1caa : 20 55 20 JSR $2055 ; (vdcwin_winstorage_init.s0 + 0)
1cad : a9 00 __ LDA #$00
1caf : 8d f9 bf STA $bff9 ; (sstack + 7)
1cb2 : a9 01 __ LDA #$01
1cb4 : 8d fa bf STA $bffa ; (sstack + 8)
1cb7 : 20 7a 20 JSR $207a ; (vdc_init.s1000 + 0)
1cba : a9 00 __ LDA #$00
1cbc : 85 18 __ STA P11 
1cbe : 8d f2 bf STA $bff2 ; (sstack + 0)
1cc1 : a9 5d __ LDA #$5d
1cc3 : 8d f3 bf STA $bff3 ; (sstack + 1)
1cc6 : a9 2f __ LDA #$2f
1cc8 : 8d f4 bf STA $bff4 ; (sstack + 2)
1ccb : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
1cce : a9 90 __ LDA #$90
1cd0 : a0 02 __ LDY #$02
1cd2 : 91 23 __ STA (SP + 0),y 
1cd4 : a9 71 __ LDA #$71
1cd6 : c8 __ __ INY
1cd7 : 91 23 __ STA (SP + 0),y 
1cd9 : a9 b8 __ LDA #$b8
1cdb : c8 __ __ INY
1cdc : 91 23 __ STA (SP + 0),y 
1cde : a9 2f __ LDA #$2f
1ce0 : c8 __ __ INY
1ce1 : 91 23 __ STA (SP + 0),y 
1ce3 : ad cb 6f LDA $6fcb ; (vdc_state + 0)
1ce6 : c8 __ __ INY
1ce7 : 91 23 __ STA (SP + 0),y 
1ce9 : a9 00 __ LDA #$00
1ceb : c8 __ __ INY
1cec : 91 23 __ STA (SP + 0),y 
1cee : ad cc 6f LDA $6fcc ; (vdc_state + 1)
1cf1 : d0 07 __ BNE $1cfa ; (main.s54 + 0)
.s55:
1cf3 : a9 2f __ LDA #$2f
1cf5 : a2 ed __ LDX #$ed
1cf7 : 4c fe 1c JMP $1cfe ; (main.s56 + 0)
.s54:
1cfa : a9 2a __ LDA #$2a
1cfc : a2 fc __ LDX #$fc
.s56:
1cfe : 85 55 __ STA T1 + 1 
1d00 : 8a __ __ TXA
1d01 : a0 08 __ LDY #$08
1d03 : 91 23 __ STA (SP + 0),y 
1d05 : a5 55 __ LDA T1 + 1 
1d07 : c8 __ __ INY
1d08 : 91 23 __ STA (SP + 0),y 
1d0a : 20 78 2f JSR $2f78 ; (sprintf.s0 + 0)
1d0d : a9 02 __ LDA #$02
1d0f : 8d f2 bf STA $bff2 ; (sstack + 0)
1d12 : a9 90 __ LDA #$90
1d14 : 8d f3 bf STA $bff3 ; (sstack + 1)
1d17 : a9 71 __ LDA #$71
1d19 : 8d f4 bf STA $bff4 ; (sstack + 2)
1d1c : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
1d1f : a9 04 __ LDA #$04
1d21 : 8d f2 bf STA $bff2 ; (sstack + 0)
1d24 : a9 00 __ LDA #$00
1d26 : 8d f3 bf STA $bff3 ; (sstack + 1)
1d29 : a9 30 __ LDA #$30
1d2b : 8d f4 bf STA $bff4 ; (sstack + 2)
1d2e : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
1d31 : a9 05 __ LDA #$05
1d33 : 8d f2 bf STA $bff2 ; (sstack + 0)
1d36 : a9 10 __ LDA #$10
1d38 : 8d f3 bf STA $bff3 ; (sstack + 1)
1d3b : a9 30 __ LDA #$30
1d3d : 8d f4 bf STA $bff4 ; (sstack + 2)
1d40 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
1d43 : a9 01 __ LDA #$01
1d45 : 85 57 __ STA T4 + 0 
1d47 : 85 10 __ STA P3 
1d49 : ad fc 6a LDA $6afc ; (bootdevice + 0)
1d4c : 85 56 __ STA T2 + 0 
1d4e : 85 0f __ STA P2 
1d50 : a9 00 __ LDA #$00
1d52 : 85 11 __ STA P4 
1d54 : a9 40 __ LDA #$40
1d56 : 85 12 __ STA P5 
1d58 : a9 f1 __ LDA #$f1
1d5a : 85 13 __ STA P6 
1d5c : a9 2f __ LDA #$2f
1d5e : 85 14 __ STA P7 
1d60 : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
1d63 : a5 1b __ LDA ACCU + 0 
1d65 : d0 0e __ BNE $1d75 ; (main.s4 + 0)
.s2:
1d67 : 20 2f 30 JSR $302f ; (menu_fileerrormessage.s1000 + 0)
1d6a : a9 01 __ LDA #$01
1d6c : 85 0d __ STA P0 
1d6e : a9 00 __ LDA #$00
1d70 : 85 0e __ STA P1 
1d72 : 20 1e 2c JSR $2c1e ; (exit.s0 + 0)
.s4:
1d75 : a9 00 __ LDA #$00
1d77 : 85 18 __ STA P11 
1d79 : a9 06 __ LDA #$06
1d7b : 8d f2 bf STA $bff2 ; (sstack + 0)
1d7e : a9 d3 __ LDA #$d3
1d80 : 8d f3 bf STA $bff3 ; (sstack + 1)
1d83 : a9 36 __ LDA #$36
1d85 : 8d f4 bf STA $bff4 ; (sstack + 2)
1d88 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
1d8b : a5 56 __ LDA T2 + 0 
1d8d : 85 0f __ STA P2 
1d8f : a9 01 __ LDA #$01
1d91 : 85 10 __ STA P3 
1d93 : a9 00 __ LDA #$00
1d95 : 85 11 __ STA P4 
1d97 : a9 20 __ LDA #$20
1d99 : 85 12 __ STA P5 
1d9b : a9 f9 __ LDA #$f9
1d9d : 85 13 __ STA P6 
1d9f : a9 2f __ LDA #$2f
1da1 : 85 14 __ STA P7 
1da3 : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
1da6 : a5 1b __ LDA ACCU + 0 
1da8 : d0 0e __ BNE $1db8 ; (main.l27 + 0)
.s5:
1daa : 20 2f 30 JSR $302f ; (menu_fileerrormessage.s1000 + 0)
1dad : a9 01 __ LDA #$01
1daf : 85 0d __ STA P0 
1db1 : a9 00 __ LDA #$00
1db3 : 85 0e __ STA P1 
1db5 : 20 1e 2c JSR $2c1e ; (exit.s0 + 0)
.l27:
1db8 : 20 3c 14 JSR $143c ; (sid_startmusic.s0 + 0)
.l8:
1dbb : a9 c2 __ LDA #$c2
1dbd : 8d f6 bf STA $bff6 ; (sstack + 4)
1dc0 : a9 37 __ LDA #$37
1dc2 : 8d f7 bf STA $bff7 ; (sstack + 5)
1dc5 : 20 ff 36 JSR $36ff ; (menu_placetop.s0 + 0)
1dc8 : a9 7f __ LDA #$7f
1dca : 85 17 __ STA P10 
1dcc : a9 a0 __ LDA #$a0
1dce : 8d f4 bf STA $bff4 ; (sstack + 2)
1dd1 : a9 00 __ LDA #$00
1dd3 : 8d f2 bf STA $bff2 ; (sstack + 0)
1dd6 : 8d f5 bf STA $bff5 ; (sstack + 3)
1dd9 : 8d f7 bf STA $bff7 ; (sstack + 5)
1ddc : 8d f9 bf STA $bff9 ; (sstack + 7)
1ddf : 8d fb bf STA $bffb ; (sstack + 9)
1de2 : a9 4b __ LDA #$4b
1de4 : 8d f6 bf STA $bff6 ; (sstack + 4)
1de7 : a9 30 __ LDA #$30
1de9 : 8d f8 bf STA $bff8 ; (sstack + 6)
1dec : a9 0c __ LDA #$0c
1dee : 8d fa bf STA $bffa ; (sstack + 8)
1df1 : a9 10 __ LDA #$10
1df3 : 8d fc bf STA $bffc ; (sstack + 10)
1df6 : a9 1c __ LDA #$1c
1df8 : 85 15 __ STA P8 
1dfa : a9 be __ LDA #$be
1dfc : 85 16 __ STA P9 
1dfe : a9 40 __ LDA #$40
1e00 : 8d f3 bf STA $bff3 ; (sstack + 1)
1e03 : ad d1 6f LDA $6fd1 ; (vdc_state + 6)
1e06 : 4a __ __ LSR
1e07 : ad d0 6f LDA $6fd0 ; (vdc_state + 5)
1e0a : 85 54 __ STA T1 + 0 
1e0c : 6a __ __ ROR
1e0d : 38 __ __ SEC
1e0e : e9 06 __ SBC #$06
1e10 : 8d fd bf STA $bffd ; (sstack + 11)
1e13 : 20 d4 37 JSR $37d4 ; (vdcwin_viewport_init.s0 + 0)
1e16 : a9 10 __ LDA #$10
1e18 : 8d 23 be STA $be23 ; (vp_logo + 7)
1e1b : a9 00 __ LDA #$00
1e1d : 8d 24 be STA $be24 ; (vp_logo + 8)
1e20 : 8d 26 be STA $be26 ; (vp_logo + 10)
1e23 : a9 90 __ LDA #$90
1e25 : a0 02 __ LDY #$02
1e27 : 91 23 __ STA (SP + 0),y 
1e29 : a9 71 __ LDA #$71
1e2b : c8 __ __ INY
1e2c : 91 23 __ STA (SP + 0),y 
1e2e : a9 b8 __ LDA #$b8
1e30 : c8 __ __ INY
1e31 : 91 23 __ STA (SP + 0),y 
1e33 : a9 2f __ LDA #$2f
1e35 : c8 __ __ INY
1e36 : 91 23 __ STA (SP + 0),y 
1e38 : ad cb 6f LDA $6fcb ; (vdc_state + 0)
1e3b : c8 __ __ INY
1e3c : 8c 25 be STY $be25 ; (vp_logo + 9)
1e3f : 91 23 __ STA (SP + 0),y 
1e41 : a9 00 __ LDA #$00
1e43 : c8 __ __ INY
1e44 : 91 23 __ STA (SP + 0),y 
1e46 : ad cc 6f LDA $6fcc ; (vdc_state + 1)
1e49 : d0 07 __ BNE $1e52 ; (main.s57 + 0)
.s58:
1e4b : a9 2f __ LDA #$2f
1e4d : a2 ed __ LDX #$ed
1e4f : 4c 56 1e JMP $1e56 ; (main.s59 + 0)
.s57:
1e52 : a9 2a __ LDA #$2a
1e54 : a2 fc __ LDX #$fc
.s59:
1e56 : 85 45 __ STA T6 + 1 
1e58 : 8a __ __ TXA
1e59 : a0 08 __ LDY #$08
1e5b : 91 23 __ STA (SP + 0),y 
1e5d : a5 45 __ LDA T6 + 1 
1e5f : c8 __ __ INY
1e60 : 91 23 __ STA (SP + 0),y 
1e62 : 20 78 2f JSR $2f78 ; (sprintf.s0 + 0)
1e65 : a9 00 __ LDA #$00
1e67 : 85 18 __ STA P11 
1e69 : a9 03 __ LDA #$03
1e6b : 8d f2 bf STA $bff2 ; (sstack + 0)
1e6e : a9 90 __ LDA #$90
1e70 : 8d f3 bf STA $bff3 ; (sstack + 1)
1e73 : a9 71 __ LDA #$71
1e75 : 8d f4 bf STA $bff4 ; (sstack + 2)
1e78 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
1e7b : a9 90 __ LDA #$90
1e7d : a0 02 __ LDY #$02
1e7f : 91 23 __ STA (SP + 0),y 
1e81 : a9 71 __ LDA #$71
1e83 : c8 __ __ INY
1e84 : 91 23 __ STA (SP + 0),y 
1e86 : a9 31 __ LDA #$31
1e88 : c8 __ __ INY
1e89 : 91 23 __ STA (SP + 0),y 
1e8b : a9 38 __ LDA #$38
1e8d : c8 __ __ INY
1e8e : 91 23 __ STA (SP + 0),y 
1e90 : ad cd 6f LDA $6fcd ; (vdc_state + 2)
1e93 : 85 1b __ STA ACCU + 0 
1e95 : a9 00 __ LDA #$00
1e97 : 85 1c __ STA ACCU + 1 
1e99 : a9 11 __ LDA #$11
1e9b : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
1e9e : 18 __ __ CLC
1e9f : a9 a1 __ LDA #$a1
1ea1 : 65 05 __ ADC WORK + 2 
1ea3 : a0 06 __ LDY #$06
1ea5 : 91 23 __ STA (SP + 0),y 
1ea7 : a9 6e __ LDA #$6e
1ea9 : 69 00 __ ADC #$00
1eab : c8 __ __ INY
1eac : 91 23 __ STA (SP + 0),y 
1eae : 20 78 2f JSR $2f78 ; (sprintf.s0 + 0)
1eb1 : a9 04 __ LDA #$04
1eb3 : 8d f2 bf STA $bff2 ; (sstack + 0)
1eb6 : a9 90 __ LDA #$90
1eb8 : 8d f3 bf STA $bff3 ; (sstack + 1)
1ebb : a9 71 __ LDA #$71
1ebd : 8d f4 bf STA $bff4 ; (sstack + 2)
1ec0 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
1ec3 : 38 __ __ SEC
1ec4 : a5 54 __ LDA T1 + 0 
1ec6 : e9 04 __ SBC #$04
1ec8 : 8d f2 bf STA $bff2 ; (sstack + 0)
1ecb : a9 40 __ LDA #$40
1ecd : 8d f3 bf STA $bff3 ; (sstack + 1)
1ed0 : a9 38 __ LDA #$38
1ed2 : 8d f4 bf STA $bff4 ; (sstack + 2)
1ed5 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
1ed8 : 38 __ __ SEC
1ed9 : a5 54 __ LDA T1 + 0 
1edb : e9 03 __ SBC #$03
1edd : 8d f2 bf STA $bff2 ; (sstack + 0)
1ee0 : a9 7a __ LDA #$7a
1ee2 : 8d f3 bf STA $bff3 ; (sstack + 1)
1ee5 : a9 38 __ LDA #$38
1ee7 : 8d f4 bf STA $bff4 ; (sstack + 2)
1eea : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
1eed : 38 __ __ SEC
1eee : a5 54 __ LDA T1 + 0 
1ef0 : e9 02 __ SBC #$02
1ef2 : 8d f2 bf STA $bff2 ; (sstack + 0)
1ef5 : a9 be __ LDA #$be
1ef7 : 8d f3 bf STA $bff3 ; (sstack + 1)
1efa : a9 38 __ LDA #$38
1efc : 8d f4 bf STA $bff4 ; (sstack + 2)
1eff : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
1f02 : a9 1c __ LDA #$1c
1f04 : 85 16 __ STA P9 
1f06 : a9 be __ LDA #$be
1f08 : 85 17 __ STA P10 
1f0a : 20 f5 38 JSR $38f5 ; (vdcwin_cpy_viewport.s0 + 0)
1f0d : 20 40 3a JSR $3a40 ; (menu_main.s1000 + 0)
1f10 : a5 1b __ LDA ACCU + 0 
1f12 : 85 56 __ STA T2 + 0 
1f14 : c9 29 __ CMP #$29
1f16 : b0 03 __ BCS $1f1b ; (main.s31 + 0)
1f18 : 4c e3 1f JMP $1fe3 ; (main.s33 + 0)
.s31:
1f1b : c9 2b __ CMP #$2b
1f1d : b0 0c __ BCS $1f2b ; (main.s32 + 0)
.s16:
1f1f : 38 __ __ SEC
1f20 : e9 29 __ SBC #$29
1f22 : 8d fd bf STA $bffd ; (sstack + 11)
1f25 : 20 20 5d JSR $5d20 ; (scroll_fullscreen_smooth.s1000 + 0)
1f28 : 4c 95 1f JMP $1f95 ; (main.s10 + 0)
.s32:
1f2b : c9 3d __ CMP #$3d
1f2d : b0 03 __ BCS $1f32 ; (main.s42 + 0)
1f2f : 4c cf 1f JMP $1fcf ; (main.s44 + 0)
.s42:
1f32 : c9 3f __ CMP #$3f
1f34 : 90 03 __ BCC $1f39 ; (main.s19 + 0)
1f36 : 4c c0 1f JMP $1fc0 ; (main.s43 + 0)
.s19:
1f39 : 38 __ __ SEC
1f3a : e9 3c __ SBC #$3c
1f3c : 85 53 __ STA T0 + 0 
1f3e : 90 06 __ BCC $1f46 ; (main.s20 + 0)
.s1008:
1f40 : a5 57 __ LDA T4 + 0 
1f42 : c5 53 __ CMP T0 + 0 
1f44 : f0 4f __ BEQ $1f95 ; (main.s10 + 0)
.s20:
1f46 : 20 f0 14 JSR $14f0 ; (sid_stopmusic.s0 + 0)
1f49 : a9 90 __ LDA #$90
1f4b : a0 02 __ LDY #$02
1f4d : 91 23 __ STA (SP + 0),y 
1f4f : a9 71 __ LDA #$71
1f51 : c8 __ __ INY
1f52 : 91 23 __ STA (SP + 0),y 
1f54 : a9 94 __ LDA #$94
1f56 : c8 __ __ INY
1f57 : 91 23 __ STA (SP + 0),y 
1f59 : a9 67 __ LDA #$67
1f5b : c8 __ __ INY
1f5c : 91 23 __ STA (SP + 0),y 
1f5e : a5 53 __ LDA T0 + 0 
1f60 : c8 __ __ INY
1f61 : 91 23 __ STA (SP + 0),y 
1f63 : a9 00 __ LDA #$00
1f65 : c8 __ __ INY
1f66 : 91 23 __ STA (SP + 0),y 
1f68 : 20 78 2f JSR $2f78 ; (sprintf.s0 + 0)
1f6b : a9 01 __ LDA #$01
1f6d : 85 10 __ STA P3 
1f6f : a9 90 __ LDA #$90
1f71 : 85 13 __ STA P6 
1f73 : a9 71 __ LDA #$71
1f75 : 85 14 __ STA P7 
1f77 : ad fc 6a LDA $6afc ; (bootdevice + 0)
1f7a : 85 0f __ STA P2 
1f7c : a9 00 __ LDA #$00
1f7e : 85 11 __ STA P4 
1f80 : a9 20 __ LDA #$20
1f82 : 85 12 __ STA P5 
1f84 : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
1f87 : a5 1b __ LDA ACCU + 0 
1f89 : d0 03 __ BNE $1f8e ; (main.s78 + 0)
.s23:
1f8b : 20 2f 30 JSR $302f ; (menu_fileerrormessage.s1000 + 0)
.s78:
1f8e : a5 53 __ LDA T0 + 0 
1f90 : 85 57 __ STA T4 + 0 
1f92 : 20 3c 14 JSR $143c ; (sid_startmusic.s0 + 0)
.s10:
1f95 : a5 56 __ LDA T2 + 0 
1f97 : c9 0d __ CMP #$0d
1f99 : f0 03 __ BEQ $1f9e ; (main.s9 + 0)
1f9b : 4c bb 1d JMP $1dbb ; (main.l8 + 0)
.s9:
1f9e : 20 f0 14 JSR $14f0 ; (sid_stopmusic.s0 + 0)
1fa1 : 20 9c 67 JSR $679c ; (vdc_exit.s0 + 0)
1fa4 : a9 00 __ LDA #$00
1fa6 : 85 1b __ STA ACCU + 0 
1fa8 : 85 1c __ STA ACCU + 1 
.s1001:
1faa : 18 __ __ CLC
1fab : a5 23 __ LDA SP + 0 
1fad : 69 0a __ ADC #$0a
1faf : 85 23 __ STA SP + 0 
1fb1 : 90 02 __ BCC $1fb5 ; (main.s1001 + 11)
1fb3 : e6 24 __ INC SP + 1 
1fb5 : a2 04 __ LDX #$04
1fb7 : bd 14 be LDA $be14,x ; (main@stack + 0)
1fba : 95 53 __ STA T0 + 0,x 
1fbc : ca __ __ DEX
1fbd : 10 f8 __ BPL $1fb7 ; (main.s1001 + 13)
1fbf : 60 __ __ RTS
.s43:
1fc0 : d0 06 __ BNE $1fc8 ; (main.s47 + 0)
.s26:
1fc2 : 20 f0 14 JSR $14f0 ; (sid_stopmusic.s0 + 0)
1fc5 : 4c bb 1d JMP $1dbb ; (main.l8 + 0)
.s47:
1fc8 : c9 40 __ CMP #$40
1fca : d0 c9 __ BNE $1f95 ; (main.s10 + 0)
1fcc : 4c b8 1d JMP $1db8 ; (main.l27 + 0)
.s44:
1fcf : c9 2b __ CMP #$2b
1fd1 : d0 06 __ BNE $1fd9 ; (main.s45 + 0)
.s17:
1fd3 : 20 6b 62 JSR $626b ; (scroll_bigfont.s1000 + 0)
1fd6 : 4c bb 1d JMP $1dbb ; (main.l8 + 0)
.s45:
1fd9 : c9 33 __ CMP #$33
1fdb : d0 b8 __ BNE $1f95 ; (main.s10 + 0)
.s18:
1fdd : 20 5d 66 JSR $665d ; (charset_demo.s1000 + 0)
1fe0 : 4c bb 1d JMP $1dbb ; (main.l8 + 0)
.s33:
1fe3 : c9 15 __ CMP #$15
1fe5 : d0 06 __ BNE $1fed ; (main.s34 + 0)
.s13:
1fe7 : 20 b6 40 JSR $40b6 ; (windows_windowstacking.s1000 + 0)
1fea : 4c bb 1d JMP $1dbb ; (main.l8 + 0)
.s34:
1fed : 90 1e __ BCC $200d ; (main.s36 + 0)
.s35:
1fef : c9 16 __ CMP #$16
1ff1 : d0 06 __ BNE $1ff9 ; (main.s39 + 0)
.s14:
1ff3 : 20 70 49 JSR $4970 ; (windows_textinput.s1000 + 0)
1ff6 : 4c bb 1d JMP $1dbb ; (main.l8 + 0)
.s39:
1ff9 : c9 1f __ CMP #$1f
1ffb : 90 98 __ BCC $1f95 ; (main.s10 + 0)
.s41:
1ffd : c9 21 __ CMP #$21
1fff : b0 94 __ BCS $1f95 ; (main.s10 + 0)
.s15:
2001 : 38 __ __ SEC
2002 : e9 1f __ SBC #$1f
2004 : 8d fe bf STA $bffe ; (sstack + 12)
2007 : 20 c6 53 JSR $53c6 ; (viewport_demo.s1000 + 0)
200a : 4c bb 1d JMP $1dbb ; (main.l8 + 0)
.s36:
200d : c9 0b __ CMP #$0b
200f : d0 06 __ BNE $2017 ; (main.s37 + 0)
.s11:
2011 : 20 d2 3d JSR $3dd2 ; (settings_screenmode.s1000 + 0)
2014 : 4c bb 1d JMP $1dbb ; (main.l8 + 0)
.s37:
2017 : c9 0c __ CMP #$0c
2019 : f0 03 __ BEQ $201e ; (main.s12 + 0)
201b : 4c 95 1f JMP $1f95 ; (main.s10 + 0)
.s12:
201e : 20 62 3e JSR $3e62 ; (settings_versioninfo.s1000 + 0)
2021 : 4c bb 1d JMP $1dbb ; (main.l8 + 0)
--------------------------------------------------------------------
cia_init: ; cia_init()->void
.s0:
2024 : a9 7f __ LDA #$7f
2026 : 8d 0d dc STA $dc0d 
2029 : 8d 0d dd STA $dd0d 
202c : 8d 00 dc STA $dc00 
202f : a9 08 __ LDA #$08
2031 : 8d 0e dc STA $dc0e 
2034 : 8d 0f dc STA $dc0f 
2037 : 8d 0e dd STA $dd0e 
203a : 8d 0f dd STA $dd0f 
203d : a9 00 __ LDA #$00
203f : 8d 03 dc STA $dc03 
2042 : 8d 03 dd STA $dd03 
2045 : a9 ff __ LDA #$ff
2047 : 8d 02 dc STA $dc02 
204a : a9 07 __ LDA #$07
204c : 8d 01 dd STA $dd01 
204f : a9 3f __ LDA #$3f
2051 : 8d 02 dd STA $dd02 
.s1001:
2054 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_winstorage_init: ; vdcwin_winstorage_init(u8,u8*,u16)->void
.s0:
2055 : a9 00 __ LDA #$00
2057 : 8d c8 6f STA $6fc8 ; (winCfg + 5)
205a : a5 0d __ LDA P0 ; (memcr + 0)
205c : 8d c3 6f STA $6fc3 ; (winCfg + 0)
205f : a5 0e __ LDA P1 ; (membase + 0)
2061 : 8d c4 6f STA $6fc4 ; (winCfg + 1)
2064 : 8d c9 6f STA $6fc9 ; (winCfg + 6)
2067 : a5 0f __ LDA P2 ; (membase + 1)
2069 : 8d c5 6f STA $6fc5 ; (winCfg + 2)
206c : 8d ca 6f STA $6fca ; (winCfg + 7)
206f : a5 10 __ LDA P3 ; (memsize + 0)
2071 : 8d c6 6f STA $6fc6 ; (winCfg + 3)
2074 : a5 11 __ LDA P4 ; (memsize + 1)
2076 : 8d c7 6f STA $6fc7 ; (winCfg + 4)
.s1001:
2079 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
207a : 38 __ __ SEC
207b : a5 23 __ LDA SP + 0 
207d : e9 04 __ SBC #$04
207f : 85 23 __ STA SP + 0 
2081 : b0 02 __ BCS $2085 ; (vdc_init.s0 + 0)
2083 : c6 24 __ DEC SP + 1 
.s0:
2085 : a9 00 __ LDA #$00
2087 : 85 0f __ STA P2 
2089 : 20 e9 20 JSR $20e9 ; (vdc_bgcolor.s0 + 0)
208c : a9 0d __ LDA #$0d
208e : 85 0f __ STA P2 
2090 : 20 16 21 JSR $2116 ; (vdc_fgcolor.s0 + 0)
2093 : a9 8d __ LDA #$8d
2095 : 8d d2 6f STA $6fd2 ; (vdc_state + 7)
2098 : 20 2e 21 JSR $212e ; (vdc_detect_mem_size.s0 + 0)
209b : 20 d4 22 JSR $22d4 ; (screen_width.s0 + 0)
209e : c9 28 __ CMP #$28
20a0 : d0 1b __ BNE $20bd ; (vdc_init.s3 + 0)
.s1:
20a2 : a9 10 __ LDA #$10
20a4 : a0 02 __ LDY #$02
20a6 : 91 23 __ STA (SP + 0),y 
20a8 : a9 2a __ LDA #$2a
20aa : c8 __ __ INY
20ab : 91 23 __ STA (SP + 0),y 
20ad : 20 de 22 JSR $22de ; (printf.s0 + 0)
20b0 : 20 3b 2a JSR $2a3b ; (getch.s0 + 0)
20b3 : 20 78 2a JSR $2a78 ; (clrscr.s0 + 0)
20b6 : a9 50 __ LDA #$50
20b8 : 85 0d __ STA P0 
20ba : 20 7c 2a JSR $2a7c ; (screen_setmode.s0 + 0)
.s3:
20bd : 20 87 2a JSR $2a87 ; (bnk_init.s1000 + 0)
20c0 : a9 01 __ LDA #$01
20c2 : 20 33 2c JSR $2c33 ; (fastmode.s0 + 0)
20c5 : ad f9 bf LDA $bff9 ; (sstack + 7)
20c8 : 8d f6 bf STA $bff6 ; (sstack + 4)
20cb : 20 52 2c JSR $2c52 ; (vdc_set_mode.s0 + 0)
20ce : ad cb 6f LDA $6fcb ; (vdc_state + 0)
20d1 : c9 40 __ CMP #$40
20d3 : d0 08 __ BNE $20dd ; (vdc_init.s1001 + 0)
.s7:
20d5 : ad fa bf LDA $bffa ; (sstack + 8)
20d8 : f0 03 __ BEQ $20dd ; (vdc_init.s1001 + 0)
.s4:
20da : 20 26 2e JSR $2e26 ; (vdc_set_extended_memsize.s0 + 0)
.s1001:
20dd : 18 __ __ CLC
20de : a5 23 __ LDA SP + 0 
20e0 : 69 04 __ ADC #$04
20e2 : 85 23 __ STA SP + 0 
20e4 : 90 02 __ BCC $20e8 ; (vdc_init.s1001 + 11)
20e6 : e6 24 __ INC SP + 1 
20e8 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_bgcolor: ; vdc_bgcolor(u8)->void
.s0:
20e9 : a9 1a __ LDA #$1a
20eb : 85 0d __ STA P0 
20ed : 20 0a 21 JSR $210a ; (vdc_reg_read.s0 + 0)
20f0 : 29 f0 __ AND #$f0
20f2 : 18 __ __ CLC
20f3 : 65 0f __ ADC P2 ; (color + 0)
20f5 : 85 0e __ STA P1 
20f7 : 4c fa 20 JMP $20fa ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_reg_write: ; vdc_reg_write(enum VDCRegister,u8)->void
.s0:
20fa : a5 0d __ LDA P0 ; (reg + 0)
20fc : 8d 00 d6 STA $d600 
.l27:
20ff : 2c 00 d6 BIT $d600 
2102 : 10 fb __ BPL $20ff ; (vdc_reg_write.l27 + 0)
.s4:
2104 : a5 0e __ LDA P1 ; (data + 0)
2106 : 8d 01 d6 STA $d601 
.s1001:
2109 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_reg_read: ; vdc_reg_read(enum VDCRegister)->u8
.s0:
210a : 8d 00 d6 STA $d600 
.l29:
210d : 2c 00 d6 BIT $d600 
2110 : 10 fb __ BPL $210d ; (vdc_reg_read.l29 + 0)
.s1001:
2112 : ad 01 d6 LDA $d601 
2115 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_fgcolor: ; vdc_fgcolor(u8)->void
.s0:
2116 : a9 1a __ LDA #$1a
2118 : 85 0d __ STA P0 
211a : 20 0a 21 JSR $210a ; (vdc_reg_read.s0 + 0)
211d : 29 0f __ AND #$0f
211f : 85 43 __ STA T1 + 0 
2121 : a5 0f __ LDA P2 ; (color + 0)
2123 : 0a __ __ ASL
2124 : 0a __ __ ASL
2125 : 0a __ __ ASL
2126 : 0a __ __ ASL
2127 : 05 43 __ ORA T1 + 0 
2129 : 85 0e __ STA P1 
212b : 4c fa 20 JMP $20fa ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_detect_mem_size: ; vdc_detect_mem_size()->void
.s0:
212e : a9 1c __ LDA #$1c
2130 : 85 0d __ STA P0 
2132 : 20 0a 21 JSR $210a ; (vdc_reg_read.s0 + 0)
2135 : 85 48 __ STA T0 + 0 
2137 : 09 10 __ ORA #$10
2139 : 85 0e __ STA P1 
213b : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
213e : a9 ff __ LDA #$ff
2140 : 85 0d __ STA P0 
2142 : a9 1f __ LDA #$1f
2144 : 85 0e __ STA P1 
2146 : a9 00 __ LDA #$00
2148 : 85 0f __ STA P2 
214a : 20 78 21 JSR $2178 ; (vdc_mem_write_at.s0 + 0)
214d : a9 9f __ LDA #$9f
214f : 85 0e __ STA P1 
2151 : c6 0f __ DEC P2 
2153 : 20 78 21 JSR $2178 ; (vdc_mem_write_at.s0 + 0)
2156 : a9 1f __ LDA #$1f
2158 : 85 0e __ STA P1 
215a : 20 a6 21 JSR $21a6 ; (vdc_mem_read_at.s0 + 0)
215d : c9 01 __ CMP #$01
215f : a9 00 __ LDA #$00
2161 : 69 ff __ ADC #$ff
2163 : 29 50 __ AND #$50
2165 : 49 10 __ EOR #$10
2167 : 8d cb 6f STA $6fcb ; (vdc_state + 0)
216a : a9 1c __ LDA #$1c
216c : 85 0d __ STA P0 
216e : a5 48 __ LDA T0 + 0 
2170 : 85 0e __ STA P1 
2172 : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
2175 : 4c d2 21 JMP $21d2 ; (vdc_cls.s0 + 0)
--------------------------------------------------------------------
vdc_mem_write_at: ; vdc_mem_write_at(u16,u8)->void
.s0:
2178 : a9 12 __ LDA #$12
217a : 8d 00 d6 STA $d600 
.l82:
217d : 2c 00 d6 BIT $d600 
2180 : 10 fb __ BPL $217d ; (vdc_mem_write_at.l82 + 0)
.s6:
2182 : a5 0e __ LDA P1 ; (addr + 1)
2184 : 8d 01 d6 STA $d601 
2187 : a9 13 __ LDA #$13
2189 : 8d 00 d6 STA $d600 
.l84:
218c : 2c 00 d6 BIT $d600 
218f : 10 fb __ BPL $218c ; (vdc_mem_write_at.l84 + 0)
.s11:
2191 : a5 0d __ LDA P0 ; (addr + 0)
2193 : 8d 01 d6 STA $d601 
2196 : a9 1f __ LDA #$1f
2198 : 8d 00 d6 STA $d600 
.l86:
219b : 2c 00 d6 BIT $d600 
219e : 10 fb __ BPL $219b ; (vdc_mem_write_at.l86 + 0)
.s15:
21a0 : a5 0f __ LDA P2 ; (data + 0)
21a2 : 8d 01 d6 STA $d601 
.s1001:
21a5 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_read_at: ; vdc_mem_read_at(u16)->u8
.s0:
21a6 : a9 12 __ LDA #$12
21a8 : 8d 00 d6 STA $d600 
.l84:
21ab : 2c 00 d6 BIT $d600 
21ae : 10 fb __ BPL $21ab ; (vdc_mem_read_at.l84 + 0)
.s6:
21b0 : a5 0e __ LDA P1 ; (addr + 1)
21b2 : 8d 01 d6 STA $d601 
21b5 : a9 13 __ LDA #$13
21b7 : 8d 00 d6 STA $d600 
.l86:
21ba : 2c 00 d6 BIT $d600 
21bd : 10 fb __ BPL $21ba ; (vdc_mem_read_at.l86 + 0)
.s11:
21bf : a5 0d __ LDA P0 ; (addr + 0)
21c1 : 8d 01 d6 STA $d601 
21c4 : a9 1f __ LDA #$1f
21c6 : 8d 00 d6 STA $d600 
.l88:
21c9 : 2c 00 d6 BIT $d600 
21cc : 10 fb __ BPL $21c9 ; (vdc_mem_read_at.l88 + 0)
.s1001:
21ce : ad 01 d6 LDA $d601 
21d1 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
21d2 : a9 00 __ LDA #$00
21d4 : 85 18 __ STA P11 
21d6 : 8d f2 bf STA $bff2 ; (sstack + 0)
21d9 : a9 20 __ LDA #$20
21db : 8d f3 bf STA $bff3 ; (sstack + 1)
21de : ad ce 6f LDA $6fce ; (vdc_state + 3)
21e1 : 8d f4 bf STA $bff4 ; (sstack + 2)
21e4 : ad d0 6f LDA $6fd0 ; (vdc_state + 5)
21e7 : 8d f5 bf STA $bff5 ; (sstack + 3)
21ea : 4c ed 21 JMP $21ed ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_clear: ; vdc_clear(u8,u8,u8,u8,u8)->void
.s0:
21ed : ad f2 bf LDA $bff2 ; (sstack + 0)
21f0 : 85 45 __ STA T0 + 0 
21f2 : 18 __ __ CLC
21f3 : 6d f5 bf ADC $bff5 ; (sstack + 3)
21f6 : 85 46 __ STA T1 + 0 
21f8 : a9 00 __ LDA #$00
21fa : 2a __ __ ROL
21fb : 85 47 __ STA T1 + 1 
.l1:
21fd : f0 05 __ BEQ $2204 ; (vdc_clear.s1002 + 0)
.s1004:
21ff : a5 45 __ LDA T0 + 0 
2201 : 4c 0a 22 JMP $220a ; (vdc_clear.s2 + 0)
.s1002:
2204 : a5 45 __ LDA T0 + 0 
2206 : c5 46 __ CMP T1 + 0 
2208 : b0 1f __ BCS $2229 ; (vdc_clear.s1001 + 0)
.s2:
220a : 85 14 __ STA P7 
220c : a5 18 __ LDA P11 ; (x + 0)
220e : 85 13 __ STA P6 
2210 : ad f3 bf LDA $bff3 ; (sstack + 1)
2213 : 85 15 __ STA P8 
2215 : ad d2 6f LDA $6fd2 ; (vdc_state + 7)
2218 : 85 16 __ STA P9 
221a : ad f4 bf LDA $bff4 ; (sstack + 2)
221d : 85 17 __ STA P10 
221f : 20 2a 22 JSR $222a ; (vdc_hchar.s0 + 0)
2222 : e6 45 __ INC T0 + 0 
2224 : a5 47 __ LDA T1 + 1 
2226 : 4c fd 21 JMP $21fd ; (vdc_clear.l1 + 0)
.s1001:
2229 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_hchar: ; vdc_hchar(u8,u8,u8,u8,u8)->void
.s0:
222a : a5 13 __ LDA P6 ; (x + 0)
222c : 85 0d __ STA P0 
222e : a5 14 __ LDA P7 ; (y + 0)
2230 : 85 0e __ STA P1 
2232 : 20 6e 22 JSR $226e ; (vdc_coords.s0 + 0)
2235 : a5 1b __ LDA ACCU + 0 
2237 : 85 43 __ STA T1 + 0 
2239 : a5 1c __ LDA ACCU + 1 
223b : 85 44 __ STA T1 + 1 
223d : ad d3 6f LDA $6fd3 ; (vdc_state + 8)
2240 : 18 __ __ CLC
2241 : 65 1b __ ADC ACCU + 0 
2243 : 85 0f __ STA P2 
2245 : ad d4 6f LDA $6fd4 ; (vdc_state + 9)
2248 : 65 1c __ ADC ACCU + 1 
224a : 85 10 __ STA P3 
224c : a5 15 __ LDA P8 ; (val + 0)
224e : 85 11 __ STA P4 
2250 : a6 17 __ LDX P10 ; (length + 0)
2252 : ca __ __ DEX
2253 : 86 12 __ STX P5 
2255 : 20 82 22 JSR $2282 ; (vdc_block_fill.s0 + 0)
2258 : ad d5 6f LDA $6fd5 ; (vdc_state + 10)
225b : 18 __ __ CLC
225c : 65 43 __ ADC T1 + 0 
225e : 85 0f __ STA P2 
2260 : ad d6 6f LDA $6fd6 ; (vdc_state + 11)
2263 : 65 44 __ ADC T1 + 1 
2265 : 85 10 __ STA P3 
2267 : a5 16 __ LDA P9 ; (attr + 0)
2269 : 85 11 __ STA P4 
226b : 4c 82 22 JMP $2282 ; (vdc_block_fill.s0 + 0)
--------------------------------------------------------------------
vdc_coords: ; vdc_coords(u8,u8)->u16
.s0:
226e : a5 0e __ LDA P1 ; (y + 0)
2270 : 0a __ __ ASL
2271 : aa __ __ TAX
2272 : bd 00 71 LDA $7100,x ; (multab + 0)
2275 : 18 __ __ CLC
2276 : 65 0d __ ADC P0 ; (x + 0)
2278 : 85 1b __ STA ACCU + 0 
227a : bd 01 71 LDA $7101,x ; (multab + 1)
227d : 69 00 __ ADC #$00
227f : 85 1c __ STA ACCU + 1 
.s1001:
2281 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_block_fill: ; vdc_block_fill(u16,u8,u8)->void
.s0:
2282 : a5 0f __ LDA P2 ; (address + 0)
2284 : 85 0d __ STA P0 
2286 : a5 10 __ LDA P3 ; (address + 1)
2288 : 85 0e __ STA P1 
228a : 20 b0 22 JSR $22b0 ; (vdc_mem_addr.s0 + 0)
.l26:
228d : 2c 00 d6 BIT $d600 
2290 : 10 fb __ BPL $228d ; (vdc_block_fill.l26 + 0)
.s3:
2292 : a5 11 __ LDA P4 ; (value + 0)
2294 : 8d 01 d6 STA $d601 
2297 : a9 18 __ LDA #$18
2299 : 85 0d __ STA P0 
229b : 20 0a 21 JSR $210a ; (vdc_reg_read.s0 + 0)
229e : 29 7f __ AND #$7f
22a0 : 85 0e __ STA P1 
22a2 : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
22a5 : a9 1e __ LDA #$1e
22a7 : 85 0d __ STA P0 
22a9 : a5 12 __ LDA P5 ; (length + 0)
22ab : 85 0e __ STA P1 
22ad : 4c fa 20 JMP $20fa ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
22b0 : a9 12 __ LDA #$12
22b2 : 8d 00 d6 STA $d600 
.l56:
22b5 : 2c 00 d6 BIT $d600 
22b8 : 10 fb __ BPL $22b5 ; (vdc_mem_addr.l56 + 0)
.s5:
22ba : a5 0e __ LDA P1 ; (addr + 1)
22bc : 8d 01 d6 STA $d601 
22bf : a9 13 __ LDA #$13
22c1 : 8d 00 d6 STA $d600 
.l58:
22c4 : 2c 00 d6 BIT $d600 
22c7 : 10 fb __ BPL $22c4 ; (vdc_mem_addr.l58 + 0)
.s10:
22c9 : a5 0d __ LDA P0 ; (addr + 0)
22cb : 8d 01 d6 STA $d601 
22ce : a9 1f __ LDA #$1f
22d0 : 8d 00 d6 STA $d600 
.s1001:
22d3 : 60 __ __ RTS
--------------------------------------------------------------------
screen_width: ; screen_width()->u8
.s0:
22d4 : 24 d7 __ BIT $d7 
22d6 : 30 03 __ BMI $22db ; (screen_width.s1 + 0)
.s2:
22d8 : a9 28 __ LDA #$28
22da : 60 __ __ RTS
.s1:
22db : a9 50 __ LDA #$50
.s1001:
22dd : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
22de : a9 01 __ LDA #$01
22e0 : 8d f6 bf STA $bff6 ; (sstack + 4)
22e3 : a9 a4 __ LDA #$a4
22e5 : 85 16 __ STA P9 
22e7 : a9 bf __ LDA #$bf
22e9 : 85 17 __ STA P10 
22eb : a0 02 __ LDY #$02
22ed : b1 23 __ LDA (SP + 0),y 
22ef : 8d f2 bf STA $bff2 ; (sstack + 0)
22f2 : c8 __ __ INY
22f3 : b1 23 __ LDA (SP + 0),y 
22f5 : 8d f3 bf STA $bff3 ; (sstack + 1)
22f8 : 18 __ __ CLC
22f9 : a5 23 __ LDA SP + 0 
22fb : 69 04 __ ADC #$04
22fd : 8d f4 bf STA $bff4 ; (sstack + 2)
2300 : a5 24 __ LDA SP + 1 
2302 : 69 00 __ ADC #$00
2304 : 8d f5 bf STA $bff5 ; (sstack + 3)
2307 : 4c 0a 23 JMP $230a ; (sformat.s1000 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s1000:
230a : a5 53 __ LDA T7 + 0 
230c : 8d d6 bf STA $bfd6 ; (wrapbuffer + 62)
230f : a5 54 __ LDA T7 + 1 
2311 : 8d d7 bf STA $bfd7 ; (wrapbuffer + 63)
2314 : a5 55 __ LDA T7 + 2 
2316 : 8d d8 bf STA $bfd8 ; (wrapbuffer + 64)
.s0:
2319 : a9 00 __ LDA #$00
231b : 85 47 __ STA T0 + 0 
231d : ad f2 bf LDA $bff2 ; (sstack + 0)
2320 : 85 49 __ STA T1 + 0 
2322 : ad f3 bf LDA $bff3 ; (sstack + 1)
2325 : 85 4a __ STA T1 + 1 
.l1:
2327 : a0 00 __ LDY #$00
2329 : b1 49 __ LDA (T1 + 0),y 
232b : d0 3c __ BNE $2369 ; (sformat.s2 + 0)
.s3:
232d : a4 47 __ LDY T0 + 0 
232f : 91 16 __ STA (P9),y ; (buff + 0)
2331 : 98 __ __ TYA
2332 : f0 1d __ BEQ $2351 ; (sformat.s1070 + 0)
.s116:
2334 : ad f6 bf LDA $bff6 ; (sstack + 4)
2337 : d0 0d __ BNE $2346 ; (sformat.s119 + 0)
.s120:
2339 : 18 __ __ CLC
233a : a5 16 __ LDA P9 ; (buff + 0)
233c : 65 47 __ ADC T0 + 0 
233e : aa __ __ TAX
233f : a5 17 __ LDA P10 ; (buff + 1)
2341 : 69 00 __ ADC #$00
2343 : 4c 55 23 JMP $2355 ; (sformat.s1001 + 0)
.s119:
2346 : a5 16 __ LDA P9 ; (buff + 0)
2348 : 85 0d __ STA P0 
234a : a5 17 __ LDA P10 ; (buff + 1)
234c : 85 0e __ STA P1 
234e : 20 13 27 JSR $2713 ; (puts.s0 + 0)
.s1070:
2351 : a5 17 __ LDA P10 ; (buff + 1)
2353 : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
2355 : 86 1b __ STX ACCU + 0 ; (fps + 0)
2357 : 85 1c __ STA ACCU + 1 ; (fps + 1)
2359 : ad d6 bf LDA $bfd6 ; (wrapbuffer + 62)
235c : 85 53 __ STA T7 + 0 
235e : ad d7 bf LDA $bfd7 ; (wrapbuffer + 63)
2361 : 85 54 __ STA T7 + 1 
2363 : ad d8 bf LDA $bfd8 ; (wrapbuffer + 64)
2366 : 85 55 __ STA T7 + 2 
2368 : 60 __ __ RTS
.s2:
2369 : c9 25 __ CMP #$25
236b : f0 3f __ BEQ $23ac ; (sformat.s4 + 0)
.s5:
236d : a4 47 __ LDY T0 + 0 
236f : 91 16 __ STA (P9),y ; (buff + 0)
2371 : e6 49 __ INC T1 + 0 
2373 : d0 02 __ BNE $2377 ; (sformat.s1098 + 0)
.s1097:
2375 : e6 4a __ INC T1 + 1 
.s1098:
2377 : c8 __ __ INY
2378 : 84 47 __ STY T0 + 0 
237a : 98 __ __ TYA
237b : c0 28 __ CPY #$28
237d : 90 a8 __ BCC $2327 ; (sformat.l1 + 0)
.s110:
237f : 85 4c __ STA T5 + 0 
2381 : a9 00 __ LDA #$00
2383 : 85 47 __ STA T0 + 0 
2385 : ad f6 bf LDA $bff6 ; (sstack + 4)
2388 : f0 14 __ BEQ $239e ; (sformat.s114 + 0)
.s113:
238a : a5 16 __ LDA P9 ; (buff + 0)
238c : 85 0d __ STA P0 
238e : a5 17 __ LDA P10 ; (buff + 1)
2390 : 85 0e __ STA P1 
2392 : a9 00 __ LDA #$00
2394 : a4 4c __ LDY T5 + 0 
2396 : 91 16 __ STA (P9),y ; (buff + 0)
2398 : 20 13 27 JSR $2713 ; (puts.s0 + 0)
239b : 4c 27 23 JMP $2327 ; (sformat.l1 + 0)
.s114:
239e : 18 __ __ CLC
239f : a5 16 __ LDA P9 ; (buff + 0)
23a1 : 65 4c __ ADC T5 + 0 
23a3 : 85 16 __ STA P9 ; (buff + 0)
23a5 : 90 80 __ BCC $2327 ; (sformat.l1 + 0)
.s1099:
23a7 : e6 17 __ INC P10 ; (buff + 1)
23a9 : 4c 27 23 JMP $2327 ; (sformat.l1 + 0)
.s4:
23ac : a5 47 __ LDA T0 + 0 
23ae : f0 27 __ BEQ $23d7 ; (sformat.s9 + 0)
.s7:
23b0 : 84 47 __ STY T0 + 0 
23b2 : 85 4c __ STA T5 + 0 
23b4 : ad f6 bf LDA $bff6 ; (sstack + 4)
23b7 : f0 13 __ BEQ $23cc ; (sformat.s11 + 0)
.s10:
23b9 : a5 16 __ LDA P9 ; (buff + 0)
23bb : 85 0d __ STA P0 
23bd : a5 17 __ LDA P10 ; (buff + 1)
23bf : 85 0e __ STA P1 
23c1 : 98 __ __ TYA
23c2 : a4 4c __ LDY T5 + 0 
23c4 : 91 16 __ STA (P9),y ; (buff + 0)
23c6 : 20 13 27 JSR $2713 ; (puts.s0 + 0)
23c9 : 4c d7 23 JMP $23d7 ; (sformat.s9 + 0)
.s11:
23cc : 18 __ __ CLC
23cd : a5 16 __ LDA P9 ; (buff + 0)
23cf : 65 4c __ ADC T5 + 0 
23d1 : 85 16 __ STA P9 ; (buff + 0)
23d3 : 90 02 __ BCC $23d7 ; (sformat.s9 + 0)
.s1095:
23d5 : e6 17 __ INC P10 ; (buff + 1)
.s9:
23d7 : a9 0a __ LDA #$0a
23d9 : 8d dd bf STA $bfdd ; (wrapbuffer + 69)
23dc : a9 00 __ LDA #$00
23de : 8d de bf STA $bfde ; (wrapbuffer + 70)
23e1 : 8d df bf STA $bfdf ; (wrapbuffer + 71)
23e4 : 8d e0 bf STA $bfe0 ; (wrapbuffer + 72)
23e7 : 8d e1 bf STA $bfe1 ; (wrapbuffer + 73)
23ea : a0 01 __ LDY #$01
23ec : b1 49 __ LDA (T1 + 0),y 
23ee : a2 20 __ LDX #$20
23f0 : 8e da bf STX $bfda ; (wrapbuffer + 66)
23f3 : a2 00 __ LDX #$00
23f5 : 8e db bf STX $bfdb ; (wrapbuffer + 67)
23f8 : ca __ __ DEX
23f9 : 8e dc bf STX $bfdc ; (wrapbuffer + 68)
23fc : aa __ __ TAX
23fd : 18 __ __ CLC
23fe : a5 49 __ LDA T1 + 0 
2400 : 69 02 __ ADC #$02
.l14:
2402 : 85 49 __ STA T1 + 0 
2404 : 90 02 __ BCC $2408 ; (sformat.s1082 + 0)
.s1081:
2406 : e6 4a __ INC T1 + 1 
.s1082:
2408 : 8a __ __ TXA
2409 : e0 2b __ CPX #$2b
240b : d0 08 __ BNE $2415 ; (sformat.s17 + 0)
.s16:
240d : a9 01 __ LDA #$01
240f : 8d df bf STA $bfdf ; (wrapbuffer + 71)
2412 : 4c 06 27 JMP $2706 ; (sformat.s264 + 0)
.s17:
2415 : c9 30 __ CMP #$30
2417 : d0 06 __ BNE $241f ; (sformat.s20 + 0)
.s19:
2419 : 8d da bf STA $bfda ; (wrapbuffer + 66)
241c : 4c 06 27 JMP $2706 ; (sformat.s264 + 0)
.s20:
241f : c9 23 __ CMP #$23
2421 : d0 08 __ BNE $242b ; (sformat.s23 + 0)
.s22:
2423 : a9 01 __ LDA #$01
2425 : 8d e1 bf STA $bfe1 ; (wrapbuffer + 73)
2428 : 4c 06 27 JMP $2706 ; (sformat.s264 + 0)
.s23:
242b : c9 2d __ CMP #$2d
242d : d0 08 __ BNE $2437 ; (sformat.s15 + 0)
.s25:
242f : a9 01 __ LDA #$01
2431 : 8d e0 bf STA $bfe0 ; (wrapbuffer + 72)
2434 : 4c 06 27 JMP $2706 ; (sformat.s264 + 0)
.s15:
2437 : 85 4c __ STA T5 + 0 
2439 : c9 30 __ CMP #$30
243b : 90 55 __ BCC $2492 ; (sformat.s31 + 0)
.s32:
243d : c9 3a __ CMP #$3a
243f : b0 51 __ BCS $2492 ; (sformat.s31 + 0)
.s29:
2441 : a9 00 __ LDA #$00
2443 : 85 44 __ STA T6 + 0 
2445 : 85 45 __ STA T6 + 1 
2447 : e0 3a __ CPX #$3a
2449 : b0 40 __ BCS $248b ; (sformat.s35 + 0)
.l34:
244b : a5 44 __ LDA T6 + 0 
244d : 0a __ __ ASL
244e : 85 1b __ STA ACCU + 0 ; (fps + 0)
2450 : a5 45 __ LDA T6 + 1 
2452 : 2a __ __ ROL
2453 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
2455 : 2a __ __ ROL
2456 : aa __ __ TAX
2457 : 18 __ __ CLC
2458 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
245a : 65 44 __ ADC T6 + 0 
245c : 85 44 __ STA T6 + 0 
245e : 8a __ __ TXA
245f : 65 45 __ ADC T6 + 1 
2461 : 06 44 __ ASL T6 + 0 
2463 : 2a __ __ ROL
2464 : aa __ __ TAX
2465 : 18 __ __ CLC
2466 : a5 44 __ LDA T6 + 0 
2468 : 65 4c __ ADC T5 + 0 
246a : 90 01 __ BCC $246d ; (sformat.s1092 + 0)
.s1091:
246c : e8 __ __ INX
.s1092:
246d : 38 __ __ SEC
246e : e9 30 __ SBC #$30
2470 : 85 44 __ STA T6 + 0 
2472 : 8a __ __ TXA
2473 : e9 00 __ SBC #$00
2475 : 85 45 __ STA T6 + 1 
2477 : a0 00 __ LDY #$00
2479 : b1 49 __ LDA (T1 + 0),y 
247b : 85 4c __ STA T5 + 0 
247d : e6 49 __ INC T1 + 0 
247f : d0 02 __ BNE $2483 ; (sformat.s1094 + 0)
.s1093:
2481 : e6 4a __ INC T1 + 1 
.s1094:
2483 : c9 30 __ CMP #$30
2485 : 90 04 __ BCC $248b ; (sformat.s35 + 0)
.s36:
2487 : c9 3a __ CMP #$3a
2489 : 90 c0 __ BCC $244b ; (sformat.l34 + 0)
.s35:
248b : a5 44 __ LDA T6 + 0 
248d : 8d db bf STA $bfdb ; (wrapbuffer + 67)
2490 : a5 4c __ LDA T5 + 0 
.s31:
2492 : c9 2e __ CMP #$2e
2494 : d0 51 __ BNE $24e7 ; (sformat.s39 + 0)
.s37:
2496 : a9 00 __ LDA #$00
2498 : 85 44 __ STA T6 + 0 
.l243:
249a : 85 45 __ STA T6 + 1 
249c : a0 00 __ LDY #$00
249e : b1 49 __ LDA (T1 + 0),y 
24a0 : 85 4c __ STA T5 + 0 
24a2 : e6 49 __ INC T1 + 0 
24a4 : d0 02 __ BNE $24a8 ; (sformat.s1084 + 0)
.s1083:
24a6 : e6 4a __ INC T1 + 1 
.s1084:
24a8 : c9 30 __ CMP #$30
24aa : 90 04 __ BCC $24b0 ; (sformat.s42 + 0)
.s43:
24ac : c9 3a __ CMP #$3a
24ae : 90 0a __ BCC $24ba ; (sformat.s41 + 0)
.s42:
24b0 : a5 44 __ LDA T6 + 0 
24b2 : 8d dc bf STA $bfdc ; (wrapbuffer + 68)
24b5 : a5 4c __ LDA T5 + 0 
24b7 : 4c e7 24 JMP $24e7 ; (sformat.s39 + 0)
.s41:
24ba : a5 44 __ LDA T6 + 0 
24bc : 0a __ __ ASL
24bd : 85 1b __ STA ACCU + 0 ; (fps + 0)
24bf : a5 45 __ LDA T6 + 1 
24c1 : 2a __ __ ROL
24c2 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
24c4 : 2a __ __ ROL
24c5 : aa __ __ TAX
24c6 : 18 __ __ CLC
24c7 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
24c9 : 65 44 __ ADC T6 + 0 
24cb : 85 44 __ STA T6 + 0 
24cd : 8a __ __ TXA
24ce : 65 45 __ ADC T6 + 1 
24d0 : 06 44 __ ASL T6 + 0 
24d2 : 2a __ __ ROL
24d3 : aa __ __ TAX
24d4 : 18 __ __ CLC
24d5 : a5 44 __ LDA T6 + 0 
24d7 : 65 4c __ ADC T5 + 0 
24d9 : 90 01 __ BCC $24dc ; (sformat.s1090 + 0)
.s1089:
24db : e8 __ __ INX
.s1090:
24dc : 38 __ __ SEC
24dd : e9 30 __ SBC #$30
24df : 85 44 __ STA T6 + 0 
24e1 : 8a __ __ TXA
24e2 : e9 00 __ SBC #$00
24e4 : 4c 9a 24 JMP $249a ; (sformat.l243 + 0)
.s39:
24e7 : c9 64 __ CMP #$64
24e9 : f0 04 __ BEQ $24ef ; (sformat.s44 + 0)
.s47:
24eb : c9 44 __ CMP #$44
24ed : d0 05 __ BNE $24f4 ; (sformat.s45 + 0)
.s44:
24ef : a9 01 __ LDA #$01
24f1 : 4c ca 26 JMP $26ca ; (sformat.s261 + 0)
.s45:
24f4 : c9 75 __ CMP #$75
24f6 : d0 03 __ BNE $24fb ; (sformat.s51 + 0)
24f8 : 4c c8 26 JMP $26c8 ; (sformat.s291 + 0)
.s51:
24fb : c9 55 __ CMP #$55
24fd : d0 03 __ BNE $2502 ; (sformat.s49 + 0)
24ff : 4c c8 26 JMP $26c8 ; (sformat.s291 + 0)
.s49:
2502 : c9 78 __ CMP #$78
2504 : f0 04 __ BEQ $250a ; (sformat.s52 + 0)
.s55:
2506 : c9 58 __ CMP #$58
2508 : d0 0d __ BNE $2517 ; (sformat.s53 + 0)
.s52:
250a : a9 10 __ LDA #$10
250c : 8d dd bf STA $bfdd ; (wrapbuffer + 69)
250f : a9 00 __ LDA #$00
2511 : 8d de bf STA $bfde ; (wrapbuffer + 70)
2514 : 4c c8 26 JMP $26c8 ; (sformat.s291 + 0)
.s53:
2517 : c9 6c __ CMP #$6c
2519 : d0 03 __ BNE $251e ; (sformat.s59 + 0)
251b : 4c 3f 26 JMP $263f ; (sformat.s56 + 0)
.s59:
251e : c9 4c __ CMP #$4c
2520 : d0 03 __ BNE $2525 ; (sformat.s57 + 0)
2522 : 4c 3f 26 JMP $263f ; (sformat.s56 + 0)
.s57:
2525 : c9 73 __ CMP #$73
2527 : f0 54 __ BEQ $257d ; (sformat.s72 + 0)
.s75:
2529 : c9 53 __ CMP #$53
252b : f0 50 __ BEQ $257d ; (sformat.s72 + 0)
.s73:
252d : c9 63 __ CMP #$63
252f : f0 23 __ BEQ $2554 ; (sformat.s103 + 0)
.s106:
2531 : c9 43 __ CMP #$43
2533 : f0 1f __ BEQ $2554 ; (sformat.s103 + 0)
.s104:
2535 : 09 00 __ ORA #$00
2537 : d0 03 __ BNE $253c ; (sformat.s107 + 0)
2539 : 4c 27 23 JMP $2327 ; (sformat.l1 + 0)
.s107:
253c : 18 __ __ CLC
253d : a5 16 __ LDA P9 ; (buff + 0)
253f : 65 47 __ ADC T0 + 0 
2541 : 85 44 __ STA T6 + 0 
2543 : a5 17 __ LDA P10 ; (buff + 1)
2545 : 69 00 __ ADC #$00
2547 : 85 45 __ STA T6 + 1 
2549 : a5 4c __ LDA T5 + 0 
.s1068:
254b : a0 00 __ LDY #$00
254d : 91 44 __ STA (T6 + 0),y 
254f : e6 47 __ INC T0 + 0 
2551 : 4c 27 23 JMP $2327 ; (sformat.l1 + 0)
.s103:
2554 : ad f4 bf LDA $bff4 ; (sstack + 2)
2557 : 85 4c __ STA T5 + 0 
2559 : 18 __ __ CLC
255a : 69 02 __ ADC #$02
255c : 8d f4 bf STA $bff4 ; (sstack + 2)
255f : ad f5 bf LDA $bff5 ; (sstack + 3)
2562 : 85 4d __ STA T5 + 1 
2564 : 69 00 __ ADC #$00
2566 : 8d f5 bf STA $bff5 ; (sstack + 3)
2569 : 18 __ __ CLC
256a : a5 16 __ LDA P9 ; (buff + 0)
256c : 65 47 __ ADC T0 + 0 
256e : 85 44 __ STA T6 + 0 
2570 : a5 17 __ LDA P10 ; (buff + 1)
2572 : 69 00 __ ADC #$00
2574 : 85 45 __ STA T6 + 1 
2576 : a0 00 __ LDY #$00
2578 : b1 4c __ LDA (T5 + 0),y 
257a : 4c 4b 25 JMP $254b ; (sformat.s1068 + 0)
.s72:
257d : ad f4 bf LDA $bff4 ; (sstack + 2)
2580 : 85 4c __ STA T5 + 0 
2582 : 18 __ __ CLC
2583 : 69 02 __ ADC #$02
2585 : 8d f4 bf STA $bff4 ; (sstack + 2)
2588 : ad f5 bf LDA $bff5 ; (sstack + 3)
258b : 85 4d __ STA T5 + 1 
258d : 69 00 __ ADC #$00
258f : 8d f5 bf STA $bff5 ; (sstack + 3)
2592 : a0 00 __ LDY #$00
2594 : 84 4b __ STY T3 + 0 
2596 : b1 4c __ LDA (T5 + 0),y 
2598 : aa __ __ TAX
2599 : c8 __ __ INY
259a : b1 4c __ LDA (T5 + 0),y 
259c : 86 4c __ STX T5 + 0 
259e : 85 4d __ STA T5 + 1 
25a0 : ad db bf LDA $bfdb ; (wrapbuffer + 67)
25a3 : f0 0c __ BEQ $25b1 ; (sformat.s78 + 0)
.s1073:
25a5 : 88 __ __ DEY
25a6 : b1 4c __ LDA (T5 + 0),y 
25a8 : f0 05 __ BEQ $25af ; (sformat.s1074 + 0)
.l80:
25aa : c8 __ __ INY
25ab : b1 4c __ LDA (T5 + 0),y 
25ad : d0 fb __ BNE $25aa ; (sformat.l80 + 0)
.s1074:
25af : 84 4b __ STY T3 + 0 
.s78:
25b1 : ad e0 bf LDA $bfe0 ; (wrapbuffer + 72)
25b4 : d0 19 __ BNE $25cf ; (sformat.s84 + 0)
.s1077:
25b6 : a6 4b __ LDX T3 + 0 
25b8 : ec db bf CPX $bfdb ; (wrapbuffer + 67)
25bb : a4 47 __ LDY T0 + 0 
25bd : b0 0c __ BCS $25cb ; (sformat.s1078 + 0)
.l86:
25bf : ad da bf LDA $bfda ; (wrapbuffer + 66)
25c2 : 91 16 __ STA (P9),y ; (buff + 0)
25c4 : e8 __ __ INX
25c5 : ec db bf CPX $bfdb ; (wrapbuffer + 67)
25c8 : c8 __ __ INY
25c9 : 90 f4 __ BCC $25bf ; (sformat.l86 + 0)
.s1078:
25cb : 86 4b __ STX T3 + 0 
25cd : 84 47 __ STY T0 + 0 
.s84:
25cf : ad f6 bf LDA $bff6 ; (sstack + 4)
25d2 : d0 37 __ BNE $260b ; (sformat.s88 + 0)
.l94:
25d4 : a0 00 __ LDY #$00
25d6 : b1 4c __ LDA (T5 + 0),y 
25d8 : f0 0f __ BEQ $25e9 ; (sformat.s251 + 0)
.s95:
25da : a4 47 __ LDY T0 + 0 
25dc : 91 16 __ STA (P9),y ; (buff + 0)
25de : e6 47 __ INC T0 + 0 
25e0 : e6 4c __ INC T5 + 0 
25e2 : d0 f0 __ BNE $25d4 ; (sformat.l94 + 0)
.s1087:
25e4 : e6 4d __ INC T5 + 1 
25e6 : 4c d4 25 JMP $25d4 ; (sformat.l94 + 0)
.s251:
25e9 : ad e0 bf LDA $bfe0 ; (wrapbuffer + 72)
25ec : d0 03 __ BNE $25f1 ; (sformat.s1075 + 0)
25ee : 4c 27 23 JMP $2327 ; (sformat.l1 + 0)
.s1075:
25f1 : a6 4b __ LDX T3 + 0 
25f3 : ec db bf CPX $bfdb ; (wrapbuffer + 67)
25f6 : a4 47 __ LDY T0 + 0 
25f8 : b0 0c __ BCS $2606 ; (sformat.s1076 + 0)
.l101:
25fa : ad da bf LDA $bfda ; (wrapbuffer + 66)
25fd : 91 16 __ STA (P9),y ; (buff + 0)
25ff : e8 __ __ INX
2600 : ec db bf CPX $bfdb ; (wrapbuffer + 67)
2603 : c8 __ __ INY
2604 : 90 f4 __ BCC $25fa ; (sformat.l101 + 0)
.s1076:
2606 : 84 47 __ STY T0 + 0 
2608 : 4c 27 23 JMP $2327 ; (sformat.l1 + 0)
.s88:
260b : a5 47 __ LDA T0 + 0 
260d : f0 22 __ BEQ $2631 ; (sformat.s93 + 0)
.s91:
260f : a5 16 __ LDA P9 ; (buff + 0)
2611 : 85 0d __ STA P0 
2613 : a5 17 __ LDA P10 ; (buff + 1)
2615 : 85 0e __ STA P1 
2617 : a9 00 __ LDA #$00
2619 : a4 47 __ LDY T0 + 0 
261b : 91 16 __ STA (P9),y ; (buff + 0)
261d : 20 13 27 JSR $2713 ; (puts.s0 + 0)
2620 : a5 4c __ LDA T5 + 0 
2622 : 85 0d __ STA P0 
2624 : a5 4d __ LDA T5 + 1 
2626 : 85 0e __ STA P1 
2628 : 20 13 27 JSR $2713 ; (puts.s0 + 0)
262b : a9 00 __ LDA #$00
262d : 85 47 __ STA T0 + 0 
262f : f0 b8 __ BEQ $25e9 ; (sformat.s251 + 0)
.s93:
2631 : a5 4c __ LDA T5 + 0 
2633 : 85 0d __ STA P0 
2635 : a5 4d __ LDA T5 + 1 
2637 : 85 0e __ STA P1 
2639 : 20 13 27 JSR $2713 ; (puts.s0 + 0)
263c : 4c e9 25 JMP $25e9 ; (sformat.s251 + 0)
.s56:
263f : ad f4 bf LDA $bff4 ; (sstack + 2)
2642 : 85 4c __ STA T5 + 0 
2644 : 18 __ __ CLC
2645 : 69 04 __ ADC #$04
2647 : 8d f4 bf STA $bff4 ; (sstack + 2)
264a : ad f5 bf LDA $bff5 ; (sstack + 3)
264d : 85 4d __ STA T5 + 1 
264f : 69 00 __ ADC #$00
2651 : 8d f5 bf STA $bff5 ; (sstack + 3)
2654 : a0 00 __ LDY #$00
2656 : b1 49 __ LDA (T1 + 0),y 
2658 : aa __ __ TAX
2659 : e6 49 __ INC T1 + 0 
265b : d0 02 __ BNE $265f ; (sformat.s1086 + 0)
.s1085:
265d : e6 4a __ INC T1 + 1 
.s1086:
265f : b1 4c __ LDA (T5 + 0),y 
2661 : 85 53 __ STA T7 + 0 
2663 : a0 01 __ LDY #$01
2665 : b1 4c __ LDA (T5 + 0),y 
2667 : 85 54 __ STA T7 + 1 
2669 : c8 __ __ INY
266a : b1 4c __ LDA (T5 + 0),y 
266c : 85 55 __ STA T7 + 2 
266e : c8 __ __ INY
266f : b1 4c __ LDA (T5 + 0),y 
2671 : a8 __ __ TAY
2672 : 8a __ __ TXA
2673 : e0 64 __ CPX #$64
2675 : f0 04 __ BEQ $267b ; (sformat.s60 + 0)
.s63:
2677 : c9 44 __ CMP #$44
2679 : d0 04 __ BNE $267f ; (sformat.s61 + 0)
.s60:
267b : a9 01 __ LDA #$01
267d : d0 1f __ BNE $269e ; (sformat.s262 + 0)
.s61:
267f : c9 75 __ CMP #$75
2681 : f0 19 __ BEQ $269c ; (sformat.s292 + 0)
.s67:
2683 : c9 55 __ CMP #$55
2685 : f0 15 __ BEQ $269c ; (sformat.s292 + 0)
.s65:
2687 : c9 78 __ CMP #$78
2689 : f0 07 __ BEQ $2692 ; (sformat.s68 + 0)
.s71:
268b : c9 58 __ CMP #$58
268d : f0 03 __ BEQ $2692 ; (sformat.s68 + 0)
268f : 4c 27 23 JMP $2327 ; (sformat.l1 + 0)
.s68:
2692 : a9 10 __ LDA #$10
2694 : 8d dd bf STA $bfdd ; (wrapbuffer + 69)
2697 : a9 00 __ LDA #$00
2699 : 8d de bf STA $bfde ; (wrapbuffer + 70)
.s292:
269c : a9 00 __ LDA #$00
.s262:
269e : 84 14 __ STY P7 
26a0 : 85 15 __ STA P8 
26a2 : a5 16 __ LDA P9 ; (buff + 0)
26a4 : 85 0f __ STA P2 
26a6 : a5 17 __ LDA P10 ; (buff + 1)
26a8 : 85 10 __ STA P3 
26aa : a5 53 __ LDA T7 + 0 
26ac : 85 11 __ STA P4 
26ae : a5 54 __ LDA T7 + 1 
26b0 : 85 12 __ STA P5 
26b2 : a5 55 __ LDA T7 + 2 
26b4 : 85 13 __ STA P6 
26b6 : a9 da __ LDA #$da
26b8 : 85 0d __ STA P0 
26ba : a9 bf __ LDA #$bf
26bc : 85 0e __ STA P1 
26be : 20 9d 28 JSR $289d ; (nforml.s0 + 0)
.s1069:
26c1 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
26c3 : 85 47 __ STA T0 + 0 
26c5 : 4c 27 23 JMP $2327 ; (sformat.l1 + 0)
.s291:
26c8 : a9 00 __ LDA #$00
.s261:
26ca : 85 13 __ STA P6 
26cc : a5 16 __ LDA P9 ; (buff + 0)
26ce : 85 0f __ STA P2 
26d0 : a5 17 __ LDA P10 ; (buff + 1)
26d2 : 85 10 __ STA P3 
26d4 : ad f4 bf LDA $bff4 ; (sstack + 2)
26d7 : 85 47 __ STA T0 + 0 
26d9 : ad f5 bf LDA $bff5 ; (sstack + 3)
26dc : 85 48 __ STA T0 + 1 
26de : a0 00 __ LDY #$00
26e0 : b1 47 __ LDA (T0 + 0),y 
26e2 : 85 11 __ STA P4 
26e4 : c8 __ __ INY
26e5 : b1 47 __ LDA (T0 + 0),y 
26e7 : 85 12 __ STA P5 
26e9 : 18 __ __ CLC
26ea : a5 47 __ LDA T0 + 0 
26ec : 69 02 __ ADC #$02
26ee : 8d f4 bf STA $bff4 ; (sstack + 2)
26f1 : a5 48 __ LDA T0 + 1 
26f3 : 69 00 __ ADC #$00
26f5 : 8d f5 bf STA $bff5 ; (sstack + 3)
26f8 : a9 da __ LDA #$da
26fa : 85 0d __ STA P0 
26fc : a9 bf __ LDA #$bf
26fe : 85 0e __ STA P1 
2700 : 20 68 27 JSR $2768 ; (nformi.s0 + 0)
2703 : 4c c1 26 JMP $26c1 ; (sformat.s1069 + 0)
.s264:
2706 : a0 00 __ LDY #$00
2708 : b1 49 __ LDA (T1 + 0),y 
270a : aa __ __ TAX
270b : 18 __ __ CLC
270c : a5 49 __ LDA T1 + 0 
270e : 69 01 __ ADC #$01
2710 : 4c 02 24 JMP $2402 ; (sformat.l14 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
2713 : a0 00 __ LDY #$00
2715 : b1 0d __ LDA (P0),y 
2717 : f0 0b __ BEQ $2724 ; (puts.s1001 + 0)
2719 : 20 25 27 JSR $2725 ; (putpch + 0)
271c : e6 0d __ INC P0 
271e : d0 f3 __ BNE $2713 ; (puts.s0 + 0)
2720 : e6 0e __ INC P1 
2722 : d0 ef __ BNE $2713 ; (puts.s0 + 0)
.s1001:
2724 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
2725 : ae ff 56 LDX $56ff ; (giocharmap + 0)
2728 : e0 01 __ CPX #$01
272a : 90 26 __ BCC $2752 ; (putpch + 45)
272c : c9 0a __ CMP #$0a
272e : d0 02 __ BNE $2732 ; (putpch + 13)
2730 : a9 0d __ LDA #$0d
2732 : c9 09 __ CMP #$09
2734 : f0 1f __ BEQ $2755 ; (putpch + 48)
2736 : e0 02 __ CPX #$02
2738 : 90 18 __ BCC $2752 ; (putpch + 45)
273a : c9 41 __ CMP #$41
273c : 90 14 __ BCC $2752 ; (putpch + 45)
273e : c9 7b __ CMP #$7b
2740 : b0 10 __ BCS $2752 ; (putpch + 45)
2742 : c9 61 __ CMP #$61
2744 : b0 04 __ BCS $274a ; (putpch + 37)
2746 : c9 5b __ CMP #$5b
2748 : b0 08 __ BCS $2752 ; (putpch + 45)
274a : 49 20 __ EOR #$20
274c : e0 03 __ CPX #$03
274e : f0 02 __ BEQ $2752 ; (putpch + 45)
2750 : 29 df __ AND #$df
2752 : 4c d2 ff JMP $ffd2 
2755 : 38 __ __ SEC
2756 : 20 f0 ff JSR $fff0 
2759 : 98 __ __ TYA
275a : 29 03 __ AND #$03
275c : 49 03 __ EOR #$03
275e : aa __ __ TAX
275f : a9 20 __ LDA #$20
2761 : 20 d2 ff JSR $ffd2 
2764 : ca __ __ DEX
2765 : 10 fa __ BPL $2761 ; (putpch + 60)
2767 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
2768 : a9 00 __ LDA #$00
276a : 85 43 __ STA T0 + 0 
276c : a5 13 __ LDA P6 ; (s + 0)
276e : f0 13 __ BEQ $2783 ; (nformi.s182 + 0)
.s4:
2770 : 24 12 __ BIT P5 ; (v + 1)
2772 : 10 0f __ BPL $2783 ; (nformi.s182 + 0)
.s1:
2774 : 38 __ __ SEC
2775 : a9 00 __ LDA #$00
2777 : e5 11 __ SBC P4 ; (v + 0)
2779 : 85 11 __ STA P4 ; (v + 0)
277b : a9 00 __ LDA #$00
277d : e5 12 __ SBC P5 ; (v + 1)
277f : 85 12 __ STA P5 ; (v + 1)
2781 : e6 43 __ INC T0 + 0 
.s182:
2783 : a9 10 __ LDA #$10
2785 : 85 44 __ STA T2 + 0 
2787 : a5 11 __ LDA P4 ; (v + 0)
2789 : 05 12 __ ORA P5 ; (v + 1)
278b : f0 46 __ BEQ $27d3 ; (nformi.s7 + 0)
.s42:
278d : a0 03 __ LDY #$03
278f : b1 0d __ LDA (P0),y ; (si + 0)
2791 : 85 45 __ STA T4 + 0 
2793 : c8 __ __ INY
2794 : b1 0d __ LDA (P0),y ; (si + 0)
2796 : 85 46 __ STA T4 + 1 
.l6:
2798 : a5 11 __ LDA P4 ; (v + 0)
279a : 85 1b __ STA ACCU + 0 
279c : a5 12 __ LDA P5 ; (v + 1)
279e : 85 1c __ STA ACCU + 1 
27a0 : a5 45 __ LDA T4 + 0 
27a2 : 85 03 __ STA WORK + 0 
27a4 : a5 46 __ LDA T4 + 1 
27a6 : 85 04 __ STA WORK + 1 
27a8 : 20 14 68 JSR $6814 ; (divmod + 0)
27ab : a5 06 __ LDA WORK + 3 
27ad : 30 08 __ BMI $27b7 ; (nformi.s78 + 0)
.s1019:
27af : d0 0a __ BNE $27bb ; (nformi.s77 + 0)
.s1018:
27b1 : a5 05 __ LDA WORK + 2 
27b3 : c9 0a __ CMP #$0a
27b5 : b0 04 __ BCS $27bb ; (nformi.s77 + 0)
.s78:
27b7 : a9 30 __ LDA #$30
27b9 : d0 02 __ BNE $27bd ; (nformi.s79 + 0)
.s77:
27bb : a9 37 __ LDA #$37
.s79:
27bd : 18 __ __ CLC
27be : 65 05 __ ADC WORK + 2 
27c0 : c6 44 __ DEC T2 + 0 
27c2 : a6 44 __ LDX T2 + 0 
27c4 : 9d e2 bf STA $bfe2,x ; (wrapbuffer + 74)
27c7 : a5 1b __ LDA ACCU + 0 
27c9 : 85 11 __ STA P4 ; (v + 0)
27cb : a5 1c __ LDA ACCU + 1 
27cd : 85 12 __ STA P5 ; (v + 1)
27cf : 05 11 __ ORA P4 ; (v + 0)
27d1 : d0 c5 __ BNE $2798 ; (nformi.l6 + 0)
.s7:
27d3 : a0 02 __ LDY #$02
27d5 : b1 0d __ LDA (P0),y ; (si + 0)
27d7 : c9 ff __ CMP #$ff
27d9 : d0 04 __ BNE $27df ; (nformi.s80 + 0)
.s81:
27db : a9 0f __ LDA #$0f
27dd : d0 05 __ BNE $27e4 ; (nformi.s1026 + 0)
.s80:
27df : 38 __ __ SEC
27e0 : a9 10 __ LDA #$10
27e2 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
27e4 : a8 __ __ TAY
27e5 : c4 44 __ CPY T2 + 0 
27e7 : b0 0d __ BCS $27f6 ; (nformi.s10 + 0)
.s9:
27e9 : a9 30 __ LDA #$30
.l1027:
27eb : c6 44 __ DEC T2 + 0 
27ed : a6 44 __ LDX T2 + 0 
27ef : 9d e2 bf STA $bfe2,x ; (wrapbuffer + 74)
27f2 : c4 44 __ CPY T2 + 0 
27f4 : 90 f5 __ BCC $27eb ; (nformi.l1027 + 0)
.s10:
27f6 : a0 07 __ LDY #$07
27f8 : b1 0d __ LDA (P0),y ; (si + 0)
27fa : f0 20 __ BEQ $281c ; (nformi.s13 + 0)
.s14:
27fc : a0 04 __ LDY #$04
27fe : b1 0d __ LDA (P0),y ; (si + 0)
2800 : d0 1a __ BNE $281c ; (nformi.s13 + 0)
.s1013:
2802 : 88 __ __ DEY
2803 : b1 0d __ LDA (P0),y ; (si + 0)
2805 : c9 10 __ CMP #$10
2807 : d0 13 __ BNE $281c ; (nformi.s13 + 0)
.s11:
2809 : a9 58 __ LDA #$58
280b : a6 44 __ LDX T2 + 0 
280d : 9d e1 bf STA $bfe1,x ; (wrapbuffer + 73)
2810 : 8a __ __ TXA
2811 : 18 __ __ CLC
2812 : 69 fe __ ADC #$fe
2814 : 85 44 __ STA T2 + 0 
2816 : aa __ __ TAX
2817 : a9 30 __ LDA #$30
2819 : 9d e2 bf STA $bfe2,x ; (wrapbuffer + 74)
.s13:
281c : a9 00 __ LDA #$00
281e : 85 1b __ STA ACCU + 0 
2820 : a5 43 __ LDA T0 + 0 
2822 : f0 06 __ BEQ $282a ; (nformi.s16 + 0)
.s15:
2824 : c6 44 __ DEC T2 + 0 
2826 : a9 2d __ LDA #$2d
2828 : d0 0a __ BNE $2834 ; (nformi.s1025 + 0)
.s16:
282a : a0 05 __ LDY #$05
282c : b1 0d __ LDA (P0),y ; (si + 0)
282e : f0 09 __ BEQ $2839 ; (nformi.s163 + 0)
.s18:
2830 : c6 44 __ DEC T2 + 0 
2832 : a9 2b __ LDA #$2b
.s1025:
2834 : a6 44 __ LDX T2 + 0 
2836 : 9d e2 bf STA $bfe2,x ; (wrapbuffer + 74)
.s163:
2839 : a0 06 __ LDY #$06
283b : b1 0d __ LDA (P0),y ; (si + 0)
283d : d0 33 __ BNE $2872 ; (nformi.s24 + 0)
.l30:
283f : a0 01 __ LDY #$01
2841 : b1 0d __ LDA (P0),y ; (si + 0)
2843 : 18 __ __ CLC
2844 : 65 44 __ ADC T2 + 0 
2846 : b0 04 __ BCS $284c ; (nformi.s31 + 0)
.s1006:
2848 : c9 11 __ CMP #$11
284a : 90 0d __ BCC $2859 ; (nformi.s33 + 0)
.s31:
284c : c6 44 __ DEC T2 + 0 
284e : a0 00 __ LDY #$00
2850 : b1 0d __ LDA (P0),y ; (si + 0)
2852 : a6 44 __ LDX T2 + 0 
2854 : 9d e2 bf STA $bfe2,x ; (wrapbuffer + 74)
2857 : b0 e6 __ BCS $283f ; (nformi.l30 + 0)
.s33:
2859 : a6 44 __ LDX T2 + 0 
285b : e0 10 __ CPX #$10
285d : b0 0e __ BCS $286d ; (nformi.s23 + 0)
.s34:
285f : 88 __ __ DEY
.l1022:
2860 : bd e2 bf LDA $bfe2,x ; (wrapbuffer + 74)
2863 : 91 0f __ STA (P2),y ; (str + 0)
2865 : e8 __ __ INX
2866 : e0 10 __ CPX #$10
2868 : c8 __ __ INY
2869 : 90 f5 __ BCC $2860 ; (nformi.l1022 + 0)
.s1023:
286b : 84 1b __ STY ACCU + 0 
.s23:
286d : a9 00 __ LDA #$00
286f : 85 1c __ STA ACCU + 1 
.s1001:
2871 : 60 __ __ RTS
.s24:
2872 : a6 44 __ LDX T2 + 0 
2874 : e0 10 __ CPX #$10
2876 : b0 1a __ BCS $2892 ; (nformi.l27 + 0)
.s25:
2878 : a0 00 __ LDY #$00
.l1020:
287a : bd e2 bf LDA $bfe2,x ; (wrapbuffer + 74)
287d : 91 0f __ STA (P2),y ; (str + 0)
287f : e8 __ __ INX
2880 : e0 10 __ CPX #$10
2882 : c8 __ __ INY
2883 : 90 f5 __ BCC $287a ; (nformi.l1020 + 0)
.s1021:
2885 : 84 1b __ STY ACCU + 0 
2887 : b0 09 __ BCS $2892 ; (nformi.l27 + 0)
.s28:
2889 : 88 __ __ DEY
288a : b1 0d __ LDA (P0),y ; (si + 0)
288c : a4 1b __ LDY ACCU + 0 
288e : 91 0f __ STA (P2),y ; (str + 0)
2890 : e6 1b __ INC ACCU + 0 
.l27:
2892 : a5 1b __ LDA ACCU + 0 
2894 : a0 01 __ LDY #$01
2896 : d1 0d __ CMP (P0),y ; (si + 0)
2898 : 90 ef __ BCC $2889 ; (nformi.s28 + 0)
289a : 4c 6d 28 JMP $286d ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
289d : a9 00 __ LDA #$00
289f : 85 43 __ STA T0 + 0 
28a1 : a5 15 __ LDA P8 ; (s + 0)
28a3 : f0 21 __ BEQ $28c6 ; (nforml.s182 + 0)
.s4:
28a5 : a5 14 __ LDA P7 ; (v + 3)
28a7 : f0 1d __ BEQ $28c6 ; (nforml.s182 + 0)
.s1032:
28a9 : 10 1b __ BPL $28c6 ; (nforml.s182 + 0)
.s1:
28ab : 38 __ __ SEC
28ac : a9 00 __ LDA #$00
28ae : e5 11 __ SBC P4 ; (v + 0)
28b0 : 85 11 __ STA P4 ; (v + 0)
28b2 : a9 00 __ LDA #$00
28b4 : e5 12 __ SBC P5 ; (v + 1)
28b6 : 85 12 __ STA P5 ; (v + 1)
28b8 : a9 00 __ LDA #$00
28ba : e5 13 __ SBC P6 ; (v + 2)
28bc : 85 13 __ STA P6 ; (v + 2)
28be : a9 00 __ LDA #$00
28c0 : e5 14 __ SBC P7 ; (v + 3)
28c2 : 85 14 __ STA P7 ; (v + 3)
28c4 : e6 43 __ INC T0 + 0 
.s182:
28c6 : a9 10 __ LDA #$10
28c8 : 85 44 __ STA T2 + 0 
28ca : a5 14 __ LDA P7 ; (v + 3)
28cc : d0 0c __ BNE $28da ; (nforml.s42 + 0)
.s1024:
28ce : a5 13 __ LDA P6 ; (v + 2)
28d0 : d0 08 __ BNE $28da ; (nforml.s42 + 0)
.s1025:
28d2 : a5 12 __ LDA P5 ; (v + 1)
28d4 : d0 04 __ BNE $28da ; (nforml.s42 + 0)
.s1026:
28d6 : c5 11 __ CMP P4 ; (v + 0)
28d8 : b0 0e __ BCS $28e8 ; (nforml.s7 + 0)
.s42:
28da : a0 03 __ LDY #$03
28dc : b1 0d __ LDA (P0),y ; (si + 0)
28de : 85 45 __ STA T5 + 0 
28e0 : c8 __ __ INY
28e1 : b1 0d __ LDA (P0),y ; (si + 0)
28e3 : 85 46 __ STA T5 + 1 
28e5 : 4c b2 29 JMP $29b2 ; (nforml.l6 + 0)
.s7:
28e8 : a0 02 __ LDY #$02
28ea : b1 0d __ LDA (P0),y ; (si + 0)
28ec : c9 ff __ CMP #$ff
28ee : d0 04 __ BNE $28f4 ; (nforml.s80 + 0)
.s81:
28f0 : a9 0f __ LDA #$0f
28f2 : d0 05 __ BNE $28f9 ; (nforml.s1039 + 0)
.s80:
28f4 : 38 __ __ SEC
28f5 : a9 10 __ LDA #$10
28f7 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
28f9 : a8 __ __ TAY
28fa : c4 44 __ CPY T2 + 0 
28fc : b0 0d __ BCS $290b ; (nforml.s10 + 0)
.s9:
28fe : a9 30 __ LDA #$30
.l1040:
2900 : c6 44 __ DEC T2 + 0 
2902 : a6 44 __ LDX T2 + 0 
2904 : 9d e2 bf STA $bfe2,x ; (wrapbuffer + 74)
2907 : c4 44 __ CPY T2 + 0 
2909 : 90 f5 __ BCC $2900 ; (nforml.l1040 + 0)
.s10:
290b : a0 07 __ LDY #$07
290d : b1 0d __ LDA (P0),y ; (si + 0)
290f : f0 20 __ BEQ $2931 ; (nforml.s13 + 0)
.s14:
2911 : a0 04 __ LDY #$04
2913 : b1 0d __ LDA (P0),y ; (si + 0)
2915 : d0 1a __ BNE $2931 ; (nforml.s13 + 0)
.s1013:
2917 : 88 __ __ DEY
2918 : b1 0d __ LDA (P0),y ; (si + 0)
291a : c9 10 __ CMP #$10
291c : d0 13 __ BNE $2931 ; (nforml.s13 + 0)
.s11:
291e : a9 58 __ LDA #$58
2920 : a6 44 __ LDX T2 + 0 
2922 : 9d e1 bf STA $bfe1,x ; (wrapbuffer + 73)
2925 : 8a __ __ TXA
2926 : 18 __ __ CLC
2927 : 69 fe __ ADC #$fe
2929 : 85 44 __ STA T2 + 0 
292b : aa __ __ TAX
292c : a9 30 __ LDA #$30
292e : 9d e2 bf STA $bfe2,x ; (wrapbuffer + 74)
.s13:
2931 : a9 00 __ LDA #$00
2933 : 85 1b __ STA ACCU + 0 
2935 : a5 43 __ LDA T0 + 0 
2937 : f0 06 __ BEQ $293f ; (nforml.s16 + 0)
.s15:
2939 : c6 44 __ DEC T2 + 0 
293b : a9 2d __ LDA #$2d
293d : d0 0a __ BNE $2949 ; (nforml.s1038 + 0)
.s16:
293f : a0 05 __ LDY #$05
2941 : b1 0d __ LDA (P0),y ; (si + 0)
2943 : f0 09 __ BEQ $294e ; (nforml.s163 + 0)
.s18:
2945 : c6 44 __ DEC T2 + 0 
2947 : a9 2b __ LDA #$2b
.s1038:
2949 : a6 44 __ LDX T2 + 0 
294b : 9d e2 bf STA $bfe2,x ; (wrapbuffer + 74)
.s163:
294e : a0 06 __ LDY #$06
2950 : b1 0d __ LDA (P0),y ; (si + 0)
2952 : d0 33 __ BNE $2987 ; (nforml.s24 + 0)
.l30:
2954 : a0 01 __ LDY #$01
2956 : b1 0d __ LDA (P0),y ; (si + 0)
2958 : 18 __ __ CLC
2959 : 65 44 __ ADC T2 + 0 
295b : b0 04 __ BCS $2961 ; (nforml.s31 + 0)
.s1006:
295d : c9 11 __ CMP #$11
295f : 90 0d __ BCC $296e ; (nforml.s33 + 0)
.s31:
2961 : c6 44 __ DEC T2 + 0 
2963 : a0 00 __ LDY #$00
2965 : b1 0d __ LDA (P0),y ; (si + 0)
2967 : a6 44 __ LDX T2 + 0 
2969 : 9d e2 bf STA $bfe2,x ; (wrapbuffer + 74)
296c : b0 e6 __ BCS $2954 ; (nforml.l30 + 0)
.s33:
296e : a6 44 __ LDX T2 + 0 
2970 : e0 10 __ CPX #$10
2972 : b0 0e __ BCS $2982 ; (nforml.s23 + 0)
.s34:
2974 : 88 __ __ DEY
.l1035:
2975 : bd e2 bf LDA $bfe2,x ; (wrapbuffer + 74)
2978 : 91 0f __ STA (P2),y ; (str + 0)
297a : e8 __ __ INX
297b : e0 10 __ CPX #$10
297d : c8 __ __ INY
297e : 90 f5 __ BCC $2975 ; (nforml.l1035 + 0)
.s1036:
2980 : 84 1b __ STY ACCU + 0 
.s23:
2982 : a9 00 __ LDA #$00
2984 : 85 1c __ STA ACCU + 1 
.s1001:
2986 : 60 __ __ RTS
.s24:
2987 : a6 44 __ LDX T2 + 0 
2989 : e0 10 __ CPX #$10
298b : b0 1a __ BCS $29a7 ; (nforml.l27 + 0)
.s25:
298d : a0 00 __ LDY #$00
.l1033:
298f : bd e2 bf LDA $bfe2,x ; (wrapbuffer + 74)
2992 : 91 0f __ STA (P2),y ; (str + 0)
2994 : e8 __ __ INX
2995 : e0 10 __ CPX #$10
2997 : c8 __ __ INY
2998 : 90 f5 __ BCC $298f ; (nforml.l1033 + 0)
.s1034:
299a : 84 1b __ STY ACCU + 0 
299c : b0 09 __ BCS $29a7 ; (nforml.l27 + 0)
.s28:
299e : 88 __ __ DEY
299f : b1 0d __ LDA (P0),y ; (si + 0)
29a1 : a4 1b __ LDY ACCU + 0 
29a3 : 91 0f __ STA (P2),y ; (str + 0)
29a5 : e6 1b __ INC ACCU + 0 
.l27:
29a7 : a5 1b __ LDA ACCU + 0 
29a9 : a0 01 __ LDY #$01
29ab : d1 0d __ CMP (P0),y ; (si + 0)
29ad : 90 ef __ BCC $299e ; (nforml.s28 + 0)
29af : 4c 82 29 JMP $2982 ; (nforml.s23 + 0)
.l6:
29b2 : a5 11 __ LDA P4 ; (v + 0)
29b4 : 85 1b __ STA ACCU + 0 
29b6 : a5 12 __ LDA P5 ; (v + 1)
29b8 : 85 1c __ STA ACCU + 1 
29ba : a5 13 __ LDA P6 ; (v + 2)
29bc : 85 1d __ STA ACCU + 2 
29be : a5 14 __ LDA P7 ; (v + 3)
29c0 : 85 1e __ STA ACCU + 3 
29c2 : a5 45 __ LDA T5 + 0 
29c4 : 85 03 __ STA WORK + 0 
29c6 : a5 46 __ LDA T5 + 1 
29c8 : 85 04 __ STA WORK + 1 
29ca : a9 00 __ LDA #$00
29cc : 85 05 __ STA WORK + 2 
29ce : 85 06 __ STA WORK + 3 
29d0 : 20 99 68 JSR $6899 ; (divmod32 + 0)
29d3 : a5 08 __ LDA WORK + 5 
29d5 : 30 08 __ BMI $29df ; (nforml.s78 + 0)
.s1023:
29d7 : d0 0a __ BNE $29e3 ; (nforml.s77 + 0)
.s1022:
29d9 : a5 07 __ LDA WORK + 4 
29db : c9 0a __ CMP #$0a
29dd : b0 04 __ BCS $29e3 ; (nforml.s77 + 0)
.s78:
29df : a9 30 __ LDA #$30
29e1 : d0 02 __ BNE $29e5 ; (nforml.s79 + 0)
.s77:
29e3 : a9 37 __ LDA #$37
.s79:
29e5 : 18 __ __ CLC
29e6 : 65 07 __ ADC WORK + 4 
29e8 : c6 44 __ DEC T2 + 0 
29ea : a6 44 __ LDX T2 + 0 
29ec : 9d e2 bf STA $bfe2,x ; (wrapbuffer + 74)
29ef : a5 1b __ LDA ACCU + 0 
29f1 : 85 11 __ STA P4 ; (v + 0)
29f3 : a5 1c __ LDA ACCU + 1 
29f5 : 85 12 __ STA P5 ; (v + 1)
29f7 : a5 1d __ LDA ACCU + 2 
29f9 : 85 13 __ STA P6 ; (v + 2)
29fb : a5 1e __ LDA ACCU + 3 
29fd : 85 14 __ STA P7 ; (v + 3)
29ff : d0 b1 __ BNE $29b2 ; (nforml.l6 + 0)
.s1018:
2a01 : a5 13 __ LDA P6 ; (v + 2)
2a03 : d0 ad __ BNE $29b2 ; (nforml.l6 + 0)
.s1019:
2a05 : a5 12 __ LDA P5 ; (v + 1)
2a07 : d0 a9 __ BNE $29b2 ; (nforml.l6 + 0)
.s1020:
2a09 : c5 11 __ CMP P4 ; (v + 0)
2a0b : 90 a5 __ BCC $29b2 ; (nforml.l6 + 0)
2a0d : 4c e8 28 JMP $28e8 ; (nforml.s7 + 0)
--------------------------------------------------------------------
2a10 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2a20 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2a30 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->u8
.s0:
2a3b : 20 47 2a JSR $2a47 ; (getpch + 0)
2a3e : c9 00 __ CMP #$00
2a40 : f0 f9 __ BEQ $2a3b ; (getch.s0 + 0)
2a42 : 85 1b __ STA ACCU + 0 
.s1001:
2a44 : a5 1b __ LDA ACCU + 0 
2a46 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
2a47 : 20 e4 ff JSR $ffe4 
2a4a : ae ff 56 LDX $56ff ; (giocharmap + 0)
2a4d : e0 01 __ CPX #$01
2a4f : 90 26 __ BCC $2a77 ; (getpch + 48)
2a51 : c9 0d __ CMP #$0d
2a53 : d0 02 __ BNE $2a57 ; (getpch + 16)
2a55 : a9 0a __ LDA #$0a
2a57 : e0 02 __ CPX #$02
2a59 : 90 1c __ BCC $2a77 ; (getpch + 48)
2a5b : c9 db __ CMP #$db
2a5d : b0 18 __ BCS $2a77 ; (getpch + 48)
2a5f : c9 41 __ CMP #$41
2a61 : 90 14 __ BCC $2a77 ; (getpch + 48)
2a63 : c9 c1 __ CMP #$c1
2a65 : 90 02 __ BCC $2a69 ; (getpch + 34)
2a67 : 49 a0 __ EOR #$a0
2a69 : c9 7b __ CMP #$7b
2a6b : b0 0a __ BCS $2a77 ; (getpch + 48)
2a6d : c9 61 __ CMP #$61
2a6f : b0 04 __ BCS $2a75 ; (getpch + 46)
2a71 : c9 5b __ CMP #$5b
2a73 : b0 02 __ BCS $2a77 ; (getpch + 48)
2a75 : 49 20 __ EOR #$20
2a77 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
2a78 : 20 81 ff JSR $ff81 
.s1001:
2a7b : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2a7c : 20 d4 22 JSR $22d4 ; (screen_width.s0 + 0)
2a7f : c5 0d __ CMP P0 ; (mode + 0)
2a81 : f0 03 __ BEQ $2a86 ; (screen_setmode.s1001 + 0)
.s1:
2a83 : 20 5f ff JSR $ff5f 
.s1001:
2a86 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
2a87 : 38 __ __ SEC
2a88 : a5 23 __ LDA SP + 0 
2a8a : e9 06 __ SBC #$06
2a8c : 85 23 __ STA SP + 0 
2a8e : b0 02 __ BCS $2a92 ; (bnk_init.s0 + 0)
2a90 : c6 24 __ DEC SP + 1 
.s0:
2a92 : 20 dd 2a JSR $2add ; (getcurrentdevice.s0 + 0)
2a95 : 8d fc 6a STA $6afc ; (bootdevice + 0)
2a98 : a9 e4 __ LDA #$e4
2a9a : a0 02 __ LDY #$02
2a9c : 91 23 __ STA (SP + 0),y 
2a9e : a9 2a __ LDA #$2a
2aa0 : c8 __ __ INY
2aa1 : 91 23 __ STA (SP + 0),y 
2aa3 : ad fc 6a LDA $6afc ; (bootdevice + 0)
2aa6 : c8 __ __ INY
2aa7 : 91 23 __ STA (SP + 0),y 
2aa9 : a9 00 __ LDA #$00
2aab : c8 __ __ INY
2aac : 91 23 __ STA (SP + 0),y 
2aae : 20 de 22 JSR $22de ; (printf.s0 + 0)
2ab1 : a9 06 __ LDA #$06
2ab3 : 8d 06 d5 STA $d506 
2ab6 : a9 00 __ LDA #$00
2ab8 : a0 02 __ LDY #$02
2aba : 91 23 __ STA (SP + 0),y 
2abc : a9 2b __ LDA #$2b
2abe : c8 __ __ INY
2abf : 91 23 __ STA (SP + 0),y 
2ac1 : 20 de 22 JSR $22de ; (printf.s0 + 0)
2ac4 : a9 f4 __ LDA #$f4
2ac6 : 8d f7 bf STA $bff7 ; (sstack + 5)
2ac9 : a9 2b __ LDA #$2b
2acb : 8d f8 bf STA $bff8 ; (sstack + 6)
2ace : 20 1a 2b JSR $2b1a ; (load_overlay.s1000 + 0)
.s1001:
2ad1 : 18 __ __ CLC
2ad2 : a5 23 __ LDA SP + 0 
2ad4 : 69 06 __ ADC #$06
2ad6 : 85 23 __ STA SP + 0 
2ad8 : 90 02 __ BCC $2adc ; (bnk_init.s1001 + 11)
2ada : e6 24 __ INC SP + 1 
2adc : 60 __ __ RTS
--------------------------------------------------------------------
getcurrentdevice: ; getcurrentdevice()->u8
.s0:
2add : a5 ba __ LDA $ba 
2adf : d0 02 __ BNE $2ae3 ; (getcurrentdevice.s1001 + 0)
.s1:
2ae1 : a9 08 __ LDA #$08
.s1001:
2ae3 : 60 __ __ RTS
--------------------------------------------------------------------
2ae4 : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
2af4 : a5 0d __ LDA P0 
2af6 : a6 0e __ LDX P1 
2af8 : 20 68 ff JSR $ff68 
.s1001:
2afb : 60 __ __ RTS
--------------------------------------------------------------------
2afc : __ __ __ BYT 65 4e 00                                        : eN.
--------------------------------------------------------------------
2aff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
2b00 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
2b10 : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
load_overlay: ; load_overlay(const u8*)->void
.s1000:
2b1a : 38 __ __ SEC
2b1b : a5 23 __ LDA SP + 0 
2b1d : e9 06 __ SBC #$06
2b1f : 85 23 __ STA SP + 0 
2b21 : b0 02 __ BCS $2b25 ; (load_overlay.s0 + 0)
2b23 : c6 24 __ DEC SP + 1 
.s0:
2b25 : a9 00 __ LDA #$00
2b27 : 85 0d __ STA P0 
2b29 : 85 0e __ STA P1 
2b2b : 20 f4 2a JSR $2af4 ; (krnio_setbnk.s0 + 0)
2b2e : ad f7 bf LDA $bff7 ; (sstack + 5)
2b31 : 85 4e __ STA T0 + 0 
2b33 : 85 0d __ STA P0 
2b35 : ad f8 bf LDA $bff8 ; (sstack + 6)
2b38 : 85 4f __ STA T0 + 1 
2b3a : 85 0e __ STA P1 
2b3c : 20 a8 2b JSR $2ba8 ; (krnio_setnam.s0 + 0)
2b3f : a5 4e __ LDA T0 + 0 
2b41 : a0 04 __ LDY #$04
2b43 : 91 23 __ STA (SP + 0),y 
2b45 : a5 4f __ LDA T0 + 1 
2b47 : c8 __ __ INY
2b48 : 91 23 __ STA (SP + 0),y 
2b4a : a9 be __ LDA #$be
2b4c : a0 02 __ LDY #$02
2b4e : 91 23 __ STA (SP + 0),y 
2b50 : a9 2b __ LDA #$2b
2b52 : c8 __ __ INY
2b53 : 91 23 __ STA (SP + 0),y 
2b55 : 20 de 22 JSR $22de ; (printf.s0 + 0)
2b58 : a9 01 __ LDA #$01
2b5a : 85 0d __ STA P0 
2b5c : 85 0f __ STA P2 
2b5e : ad fc 6a LDA $6afc ; (bootdevice + 0)
2b61 : 85 0e __ STA P1 
2b63 : 20 cb 2b JSR $2bcb ; (krnio_load.s0 + 0)
2b66 : 09 00 __ ORA #$00
2b68 : d0 32 __ BNE $2b9c ; (load_overlay.s1001 + 0)
.s1:
2b6a : a9 00 __ LDA #$00
2b6c : a0 02 __ LDY #$02
2b6e : 91 23 __ STA (SP + 0),y 
2b70 : a9 2c __ LDA #$2c
2b72 : c8 __ __ INY
2b73 : 91 23 __ STA (SP + 0),y 
2b75 : 20 de 22 JSR $22de ; (printf.s0 + 0)
2b78 : a9 e8 __ LDA #$e8
2b7a : a0 02 __ LDY #$02
2b7c : 91 23 __ STA (SP + 0),y 
2b7e : a9 2b __ LDA #$2b
2b80 : c8 __ __ INY
2b81 : 91 23 __ STA (SP + 0),y 
2b83 : ad e5 6f LDA $6fe5 ; (krnio_pstatus + 1)
2b86 : c8 __ __ INY
2b87 : 91 23 __ STA (SP + 0),y 
2b89 : a9 00 __ LDA #$00
2b8b : c8 __ __ INY
2b8c : 91 23 __ STA (SP + 0),y 
2b8e : 20 de 22 JSR $22de ; (printf.s0 + 0)
2b91 : a9 01 __ LDA #$01
2b93 : 85 0d __ STA P0 
2b95 : a9 00 __ LDA #$00
2b97 : 85 0e __ STA P1 
2b99 : 20 1e 2c JSR $2c1e ; (exit.s0 + 0)
.s1001:
2b9c : 18 __ __ CLC
2b9d : a5 23 __ LDA SP + 0 
2b9f : 69 06 __ ADC #$06
2ba1 : 85 23 __ STA SP + 0 
2ba3 : 90 02 __ BCC $2ba7 ; (load_overlay.s1001 + 11)
2ba5 : e6 24 __ INC SP + 1 
2ba7 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
2ba8 : a5 0d __ LDA P0 
2baa : 05 0e __ ORA P1 
2bac : f0 08 __ BEQ $2bb6 ; (krnio_setnam.s0 + 14)
2bae : a0 ff __ LDY #$ff
2bb0 : c8 __ __ INY
2bb1 : b1 0d __ LDA (P0),y 
2bb3 : d0 fb __ BNE $2bb0 ; (krnio_setnam.s0 + 8)
2bb5 : 98 __ __ TYA
2bb6 : a6 0d __ LDX P0 
2bb8 : a4 0e __ LDY P1 
2bba : 20 bd ff JSR $ffbd 
.s1001:
2bbd : 60 __ __ RTS
--------------------------------------------------------------------
2bbe : __ __ __ BYT 4c 4f 41 44 49 4e 47 3a 20 25 53 0a 00          : LOADING: %S..
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
2bcb : a5 0d __ LDA P0 
2bcd : a6 0e __ LDX P1 
2bcf : a4 0f __ LDY P2 
2bd1 : 20 ba ff JSR $ffba 
2bd4 : a9 00 __ LDA #$00
2bd6 : a2 00 __ LDX #$00
2bd8 : a0 00 __ LDY #$00
2bda : 20 d5 ff JSR $ffd5 
2bdd : a9 00 __ LDA #$00
2bdf : b0 02 __ BCS $2be3 ; (krnio_load.s0 + 24)
2be1 : a9 01 __ LDA #$01
2be3 : 85 1b __ STA ACCU + 0 
.s1001:
2be5 : a5 1b __ LDA ACCU + 0 
2be7 : 60 __ __ RTS
--------------------------------------------------------------------
2be8 : __ __ __ BYT 53 54 41 54 55 53 3a 20 25 44 0a 00             : STATUS: %D..
--------------------------------------------------------------------
2bf4 : __ __ __ BYT 56 44 43 54 45 53 54 4c 4d 43 00                : VDCTESTLMC.
--------------------------------------------------------------------
spentry:
2bff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
2c00 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
2c10 : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
2c1e : a5 0d __ LDA P0 
2c20 : 85 1b __ STA ACCU + 0 
2c22 : a5 0e __ LDA P1 
2c24 : 85 1c __ STA ACCU + 1 
2c26 : ae ff 2b LDX $2bff ; (spentry + 0)
2c29 : 9a __ __ TXS
2c2a : a9 4c __ LDA #$4c
2c2c : 85 54 __ STA $54 
2c2e : a9 00 __ LDA #$00
2c30 : 85 13 __ STA P6 
.s1001:
2c32 : 60 __ __ RTS
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2c33 : 09 00 __ ORA #$00
2c35 : d0 0d __ BNE $2c44 ; (fastmode.s1 + 0)
.s2:
2c37 : 8d 30 d0 STA $d030 
2c3a : ad 11 d0 LDA $d011 
2c3d : 29 7f __ AND #$7f
2c3f : 09 10 __ ORA #$10
2c41 : 4c 4e 2c JMP $2c4e ; (fastmode.s3 + 0)
.s1:
2c44 : a9 01 __ LDA #$01
2c46 : 8d 30 d0 STA $d030 
2c49 : ad 11 d0 LDA $d011 
2c4c : 29 6f __ AND #$6f
.s3:
2c4e : 8d 11 d0 STA $d011 
.s1001:
2c51 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->u8
.s0:
2c52 : ac f6 bf LDY $bff6 ; (sstack + 4)
2c55 : be 87 6a LDX $6a87,y ; (__multab36L + 0)
2c58 : 86 4a __ STX T1 + 0 
2c5a : 86 4c __ STX T2 + 0 
2c5c : bd 04 6b LDA $6b04,x ; (vdc_modes + 4)
2c5f : f0 0a __ BEQ $2c6b ; (vdc_set_mode.s3 + 0)
.s4:
2c61 : ad cb 6f LDA $6fcb ; (vdc_state + 0)
2c64 : c9 10 __ CMP #$10
2c66 : d0 03 __ BNE $2c6b ; (vdc_set_mode.s3 + 0)
2c68 : 4c 61 2d JMP $2d61 ; (vdc_set_mode.s1 + 0)
.s3:
2c6b : ad f6 bf LDA $bff6 ; (sstack + 4)
2c6e : 8d cd 6f STA $6fcd ; (vdc_state + 2)
2c71 : a9 00 __ LDA #$00
2c73 : 8d e1 6f STA $6fe1 ; (vdc_state + 22)
2c76 : 8d e2 6f STA $6fe2 ; (vdc_state + 23)
2c79 : 8d e3 6f STA $6fe3 ; (vdc_state + 24)
2c7c : bd 00 6b LDA $6b00,x ; (vdc_modes + 0)
2c7f : 8d ce 6f STA $6fce ; (vdc_state + 3)
2c82 : bd 01 6b LDA $6b01,x ; (vdc_modes + 1)
2c85 : 8d cf 6f STA $6fcf ; (vdc_state + 4)
2c88 : bd 02 6b LDA $6b02,x ; (vdc_modes + 2)
2c8b : 8d d0 6f STA $6fd0 ; (vdc_state + 5)
2c8e : bd 03 6b LDA $6b03,x ; (vdc_modes + 3)
2c91 : 8d d1 6f STA $6fd1 ; (vdc_state + 6)
2c94 : bd 09 6b LDA $6b09,x ; (vdc_modes + 9)
2c97 : 8d d7 6f STA $6fd7 ; (vdc_state + 12)
2c9a : bd 0a 6b LDA $6b0a,x ; (vdc_modes + 10)
2c9d : 8d d8 6f STA $6fd8 ; (vdc_state + 13)
2ca0 : bd 0b 6b LDA $6b0b,x ; (vdc_modes + 11)
2ca3 : 8d d9 6f STA $6fd9 ; (vdc_state + 14)
2ca6 : bd 0c 6b LDA $6b0c,x ; (vdc_modes + 12)
2ca9 : 8d da 6f STA $6fda ; (vdc_state + 15)
2cac : bd 0d 6b LDA $6b0d,x ; (vdc_modes + 13)
2caf : 8d db 6f STA $6fdb ; (vdc_state + 16)
2cb2 : bd 0e 6b LDA $6b0e,x ; (vdc_modes + 14)
2cb5 : 8d dc 6f STA $6fdc ; (vdc_state + 17)
2cb8 : bd 0f 6b LDA $6b0f,x ; (vdc_modes + 15)
2cbb : 8d dd 6f STA $6fdd ; (vdc_state + 18)
2cbe : bd 10 6b LDA $6b10,x ; (vdc_modes + 16)
2cc1 : 8d de 6f STA $6fde ; (vdc_state + 19)
2cc4 : bd 11 6b LDA $6b11,x ; (vdc_modes + 17)
2cc7 : 8d df 6f STA $6fdf ; (vdc_state + 20)
2cca : bd 12 6b LDA $6b12,x ; (vdc_modes + 18)
2ccd : 8d e0 6f STA $6fe0 ; (vdc_state + 21)
2cd0 : bd 05 6b LDA $6b05,x ; (vdc_modes + 5)
2cd3 : 85 4d __ STA T3 + 0 
2cd5 : 8d d3 6f STA $6fd3 ; (vdc_state + 8)
2cd8 : bd 06 6b LDA $6b06,x ; (vdc_modes + 6)
2cdb : 85 4e __ STA T3 + 1 
2cdd : 8d d4 6f STA $6fd4 ; (vdc_state + 9)
2ce0 : bd 07 6b LDA $6b07,x ; (vdc_modes + 7)
2ce3 : 85 4f __ STA T5 + 0 
2ce5 : 8d d5 6f STA $6fd5 ; (vdc_state + 10)
2ce8 : bd 08 6b LDA $6b08,x ; (vdc_modes + 8)
2ceb : 85 50 __ STA T5 + 1 
2ced : 8d d6 6f STA $6fd6 ; (vdc_state + 11)
2cf0 : 20 65 2d JSR $2d65 ; (vdc_set_multab.s0 + 0)
2cf3 : 20 c0 2d JSR $2dc0 ; (vdc_disable_display.s0 + 0)
2cf6 : a5 4d __ LDA T3 + 0 
2cf8 : 85 0f __ STA P2 
2cfa : a5 4e __ LDA T3 + 1 
2cfc : 85 10 __ STA P3 
2cfe : a5 4f __ LDA T5 + 0 
2d00 : 85 11 __ STA P4 
2d02 : a5 50 __ LDA T5 + 1 
2d04 : 85 12 __ STA P5 
2d06 : 20 cb 2d JSR $2dcb ; (vdc_set_disp_address.s0 + 0)
2d09 : a6 4a __ LDX T1 + 0 
2d0b : bd 0d 6b LDA $6b0d,x ; (vdc_modes + 13)
2d0e : 85 0f __ STA P2 
2d10 : bd 0e 6b LDA $6b0e,x ; (vdc_modes + 14)
2d13 : 85 10 __ STA P3 
2d15 : 20 f3 2d JSR $2df3 ; (vdc_set_charset_address.s0 + 0)
2d18 : 20 07 2e JSR $2e07 ; (vdc_restore_charsets.s0 + 0)
2d1b : 18 __ __ CLC
2d1c : a9 13 __ LDA #$13
2d1e : 65 4a __ ADC T1 + 0 
2d20 : a6 4a __ LDX T1 + 0 
2d22 : 85 4a __ STA T1 + 0 
2d24 : a9 6b __ LDA #$6b
2d26 : 69 00 __ ADC #$00
2d28 : 85 4b __ STA T1 + 1 
2d2a : a0 00 __ LDY #$00
2d2c : 84 49 __ STY T0 + 0 
2d2e : bd 13 6b LDA $6b13,x ; (vdc_modes + 19)
.l1008:
2d31 : 85 0d __ STA P0 
2d33 : c8 __ __ INY
2d34 : b1 4a __ LDA (T1 + 0),y 
2d36 : 85 0e __ STA P1 
2d38 : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
2d3b : a4 49 __ LDY T0 + 0 
2d3d : c8 __ __ INY
2d3e : c8 __ __ INY
2d3f : 84 49 __ STY T0 + 0 
2d41 : b1 4a __ LDA (T1 + 0),y 
2d43 : c9 ff __ CMP #$ff
2d45 : d0 ea __ BNE $2d31 ; (vdc_set_mode.l1008 + 0)
.s7:
2d47 : a6 4c __ LDX T2 + 0 
2d49 : bd 04 6b LDA $6b04,x ; (vdc_modes + 4)
2d4c : f0 08 __ BEQ $2d56 ; (vdc_set_mode.s1010 + 0)
.s11:
2d4e : ad cc 6f LDA $6fcc ; (vdc_state + 1)
2d51 : d0 03 __ BNE $2d56 ; (vdc_set_mode.s1010 + 0)
.s8:
2d53 : 20 26 2e JSR $2e26 ; (vdc_set_extended_memsize.s0 + 0)
.s1010:
2d56 : 20 d2 21 JSR $21d2 ; (vdc_cls.s0 + 0)
2d59 : 20 6f 2e JSR $2e6f ; (vdc_enable_display.s0 + 0)
2d5c : a9 01 __ LDA #$01
.s1001:
2d5e : 85 1b __ STA ACCU + 0 
2d60 : 60 __ __ RTS
.s1:
2d61 : a9 00 __ LDA #$00
2d63 : f0 f9 __ BEQ $2d5e ; (vdc_set_mode.s1001 + 0)
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
2d65 : ad d1 6f LDA $6fd1 ; (vdc_state + 6)
2d68 : 85 1c __ STA ACCU + 1 
2d6a : ad d0 6f LDA $6fd0 ; (vdc_state + 5)
2d6d : 85 1b __ STA ACCU + 0 
2d6f : 05 1c __ ORA ACCU + 1 
2d71 : f0 4c __ BEQ $2dbf ; (vdc_set_multab.s1001 + 0)
.s5:
2d73 : ad ce 6f LDA $6fce ; (vdc_state + 3)
2d76 : 18 __ __ CLC
2d77 : 6d e3 6f ADC $6fe3 ; (vdc_state + 24)
2d7a : 85 43 __ STA T2 + 0 
2d7c : ad cf 6f LDA $6fcf ; (vdc_state + 4)
2d7f : 69 00 __ ADC #$00
2d81 : 85 44 __ STA T2 + 1 
2d83 : a9 00 __ LDA #$00
2d85 : 85 45 __ STA T3 + 0 
2d87 : 85 46 __ STA T3 + 1 
2d89 : a9 00 __ LDA #$00
2d8b : 85 47 __ STA T4 + 0 
2d8d : a9 71 __ LDA #$71
2d8f : 85 48 __ STA T4 + 1 
2d91 : a2 00 __ LDX #$00
.l2:
2d93 : a5 45 __ LDA T3 + 0 
2d95 : a0 00 __ LDY #$00
2d97 : 91 47 __ STA (T4 + 0),y 
2d99 : a5 46 __ LDA T3 + 1 
2d9b : c8 __ __ INY
2d9c : 91 47 __ STA (T4 + 0),y 
2d9e : 18 __ __ CLC
2d9f : a5 43 __ LDA T2 + 0 
2da1 : 65 45 __ ADC T3 + 0 
2da3 : 85 45 __ STA T3 + 0 
2da5 : a5 44 __ LDA T2 + 1 
2da7 : 65 46 __ ADC T3 + 1 
2da9 : 85 46 __ STA T3 + 1 
2dab : 18 __ __ CLC
2dac : a5 47 __ LDA T4 + 0 
2dae : 69 02 __ ADC #$02
2db0 : 85 47 __ STA T4 + 0 
2db2 : 90 02 __ BCC $2db6 ; (vdc_set_multab.s1006 + 0)
.s1005:
2db4 : e6 48 __ INC T4 + 1 
.s1006:
2db6 : e8 __ __ INX
2db7 : a5 1c __ LDA ACCU + 1 
2db9 : d0 d8 __ BNE $2d93 ; (vdc_set_multab.l2 + 0)
.s1002:
2dbb : e4 1b __ CPX ACCU + 0 
2dbd : 90 d4 __ BCC $2d93 ; (vdc_set_multab.l2 + 0)
.s1001:
2dbf : 60 __ __ RTS
--------------------------------------------------------------------
vdc_disable_display: ; vdc_disable_display()->void
.s0:
2dc0 : a9 22 __ LDA #$22
2dc2 : 85 0d __ STA P0 
2dc4 : a9 80 __ LDA #$80
2dc6 : 85 0e __ STA P1 
2dc8 : 4c fa 20 JMP $20fa ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_set_disp_address: ; vdc_set_disp_address(u16,u16)->void
.s0:
2dcb : a9 0c __ LDA #$0c
2dcd : 85 0d __ STA P0 
2dcf : a5 10 __ LDA P3 ; (text + 1)
2dd1 : 85 0e __ STA P1 
2dd3 : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
2dd6 : e6 0d __ INC P0 
2dd8 : a5 0f __ LDA P2 ; (text + 0)
2dda : 85 0e __ STA P1 
2ddc : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
2ddf : a9 14 __ LDA #$14
2de1 : 85 0d __ STA P0 
2de3 : a5 12 __ LDA P5 ; (attr + 1)
2de5 : 85 0e __ STA P1 
2de7 : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
2dea : e6 0d __ INC P0 
2dec : a5 11 __ LDA P4 ; (attr + 0)
2dee : 85 0e __ STA P1 
2df0 : 4c fa 20 JMP $20fa ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_set_charset_address: ; vdc_set_charset_address(u16)->void
.s0:
2df3 : a9 1c __ LDA #$1c
2df5 : 85 0d __ STA P0 
2df7 : 20 0a 21 JSR $210a ; (vdc_reg_read.s0 + 0)
2dfa : 29 10 __ AND #$10
2dfc : 45 10 __ EOR P3 ; (address + 1)
2dfe : 29 1f __ AND #$1f
2e00 : 45 10 __ EOR P3 ; (address + 1)
2e02 : 85 0e __ STA P1 
2e04 : 4c fa 20 JMP $20fa ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
2e07 : a9 01 __ LDA #$01
2e09 : 85 11 __ STA P4 
2e0b : a9 02 __ LDA #$02
2e0d : 85 15 __ STA P8 
2e0f : ad db 6f LDA $6fdb ; (vdc_state + 16)
2e12 : 85 0f __ STA P2 
2e14 : ad dc 6f LDA $6fdc ; (vdc_state + 17)
2e17 : 85 10 __ STA P3 
2e19 : a9 00 __ LDA #$00
2e1b : 85 14 __ STA P7 
2e1d : 85 12 __ STA P5 
2e1f : a9 d0 __ LDA #$d0
2e21 : 85 13 __ STA P6 
2e23 : 4c 00 13 JMP $1300 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
2e26 : ad cb 6f LDA $6fcb ; (vdc_state + 0)
2e29 : c9 10 __ CMP #$10
2e2b : f0 27 __ BEQ $2e54 ; (vdc_set_extended_memsize.s1001 + 0)
.s4:
2e2d : ad cc 6f LDA $6fcc ; (vdc_state + 1)
2e30 : d0 22 __ BNE $2e54 ; (vdc_set_extended_memsize.s1001 + 0)
.s3:
2e32 : 20 c0 2d JSR $2dc0 ; (vdc_disable_display.s0 + 0)
2e35 : 20 55 2e JSR $2e55 ; (vdc_wipe_mem.s0 + 0)
2e38 : a9 1c __ LDA #$1c
2e3a : 85 0d __ STA P0 
2e3c : 20 0a 21 JSR $210a ; (vdc_reg_read.s0 + 0)
2e3f : 09 10 __ ORA #$10
2e41 : 85 0e __ STA P1 
2e43 : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
2e46 : 20 07 2e JSR $2e07 ; (vdc_restore_charsets.s0 + 0)
2e49 : 20 d2 21 JSR $21d2 ; (vdc_cls.s0 + 0)
2e4c : 20 6f 2e JSR $2e6f ; (vdc_enable_display.s0 + 0)
2e4f : a9 01 __ LDA #$01
2e51 : 8d cc 6f STA $6fcc ; (vdc_state + 1)
.s1001:
2e54 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_wipe_mem: ; vdc_wipe_mem()->void
.s0:
2e55 : a9 ff __ LDA #$ff
2e57 : 85 43 __ STA T1 + 0 
2e59 : 85 12 __ STA P5 
2e5b : a9 00 __ LDA #$00
2e5d : 85 0f __ STA P2 
2e5f : 85 10 __ STA P3 
2e61 : 85 11 __ STA P4 
.l1004:
2e63 : 20 82 22 JSR $2282 ; (vdc_block_fill.s0 + 0)
2e66 : e6 10 __ INC P3 
2e68 : c6 43 __ DEC T1 + 0 
2e6a : d0 f7 __ BNE $2e63 ; (vdc_wipe_mem.l1004 + 0)
.s1003:
2e6c : 4c 82 22 JMP $2282 ; (vdc_block_fill.s0 + 0)
--------------------------------------------------------------------
vdc_enable_display: ; vdc_enable_display()->void
.s0:
2e6f : a9 22 __ LDA #$22
2e71 : 85 0d __ STA P0 
2e73 : a9 7d __ LDA #$7d
2e75 : 85 0e __ STA P1 
2e77 : 4c fa 20 JMP $20fa ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_prints: ; vdc_prints(u8,u8,const u8*)->void
.s0:
2e7a : a5 18 __ LDA P11 ; (x + 0)
2e7c : 85 13 __ STA P6 
2e7e : ad f2 bf LDA $bff2 ; (sstack + 0)
2e81 : 85 14 __ STA P7 
2e83 : ad f3 bf LDA $bff3 ; (sstack + 1)
2e86 : 85 15 __ STA P8 
2e88 : ad f4 bf LDA $bff4 ; (sstack + 2)
2e8b : 85 16 __ STA P9 
2e8d : ad d2 6f LDA $6fd2 ; (vdc_state + 7)
2e90 : 85 17 __ STA P10 
2e92 : 4c 95 2e JMP $2e95 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr: ; vdc_prints_attr(u8,u8,const u8*,u8)->void
.s0:
2e95 : a5 13 __ LDA P6 ; (x + 0)
2e97 : 85 0d __ STA P0 
2e99 : a5 14 __ LDA P7 ; (y + 0)
2e9b : 85 0e __ STA P1 
2e9d : 20 6e 22 JSR $226e ; (vdc_coords.s0 + 0)
2ea0 : a5 1b __ LDA ACCU + 0 
2ea2 : 85 44 __ STA T1 + 0 
2ea4 : a5 1c __ LDA ACCU + 1 
2ea6 : 85 45 __ STA T1 + 1 
2ea8 : a5 15 __ LDA P8 ; (string + 0)
2eaa : 85 0d __ STA P0 
2eac : a5 16 __ LDA P9 ; (string + 1)
2eae : 85 0e __ STA P1 
2eb0 : 20 00 2f JSR $2f00 ; (strlen.s0 + 0)
2eb3 : a5 1b __ LDA ACCU + 0 
2eb5 : 85 46 __ STA T3 + 0 
2eb7 : ad d3 6f LDA $6fd3 ; (vdc_state + 8)
2eba : 18 __ __ CLC
2ebb : 65 44 __ ADC T1 + 0 
2ebd : 85 0d __ STA P0 
2ebf : ad d4 6f LDA $6fd4 ; (vdc_state + 9)
2ec2 : 65 45 __ ADC T1 + 1 
2ec4 : 85 0e __ STA P1 
2ec6 : 20 b0 22 JSR $22b0 ; (vdc_mem_addr.s0 + 0)
2ec9 : a5 46 __ LDA T3 + 0 
2ecb : f0 18 __ BEQ $2ee5 ; (vdc_prints_attr.s4 + 0)
.s9:
2ecd : a0 00 __ LDY #$00
.l2:
2ecf : 84 43 __ STY T0 + 0 
2ed1 : b1 15 __ LDA (P8),y ; (string + 0)
2ed3 : 20 24 2f JSR $2f24 ; (pet2screen.s0 + 0)
.l53:
2ed6 : 2c 00 d6 BIT $d600 
2ed9 : 10 fb __ BPL $2ed6 ; (vdc_prints_attr.l53 + 0)
.s7:
2edb : 8d 01 d6 STA $d601 
2ede : a4 43 __ LDY T0 + 0 
2ee0 : c8 __ __ INY
2ee1 : c4 46 __ CPY T3 + 0 
2ee3 : 90 ea __ BCC $2ecf ; (vdc_prints_attr.l2 + 0)
.s4:
2ee5 : ad d5 6f LDA $6fd5 ; (vdc_state + 10)
2ee8 : 18 __ __ CLC
2ee9 : 65 44 __ ADC T1 + 0 
2eeb : 85 0f __ STA P2 
2eed : ad d6 6f LDA $6fd6 ; (vdc_state + 11)
2ef0 : 65 45 __ ADC T1 + 1 
2ef2 : 85 10 __ STA P3 
2ef4 : a5 17 __ LDA P10 ; (attr + 0)
2ef6 : 85 11 __ STA P4 
2ef8 : a6 46 __ LDX T3 + 0 
2efa : ca __ __ DEX
2efb : 86 12 __ STX P5 
2efd : 4c 82 22 JMP $2282 ; (vdc_block_fill.s0 + 0)
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
2f00 : a9 00 __ LDA #$00
2f02 : 85 1b __ STA ACCU + 0 
2f04 : 85 1c __ STA ACCU + 1 
2f06 : a8 __ __ TAY
2f07 : b1 0d __ LDA (P0),y ; (str + 0)
2f09 : f0 18 __ BEQ $2f23 ; (strlen.s1001 + 0)
.s2:
2f0b : a5 0d __ LDA P0 ; (str + 0)
2f0d : 85 1b __ STA ACCU + 0 
2f0f : a2 00 __ LDX #$00
.l1002:
2f11 : c8 __ __ INY
2f12 : d0 01 __ BNE $2f15 ; (strlen.s1005 + 0)
.s1004:
2f14 : e8 __ __ INX
.s1005:
2f15 : 8a __ __ TXA
2f16 : 18 __ __ CLC
2f17 : 65 0e __ ADC P1 ; (str + 1)
2f19 : 85 1c __ STA ACCU + 1 
2f1b : b1 1b __ LDA (ACCU + 0),y 
2f1d : d0 f2 __ BNE $2f11 ; (strlen.l1002 + 0)
.s1003:
2f1f : 86 1c __ STX ACCU + 1 
2f21 : 84 1b __ STY ACCU + 0 
.s1001:
2f23 : 60 __ __ RTS
--------------------------------------------------------------------
pet2screen: ; pet2screen(u8)->u8
.s0:
2f24 : c9 20 __ CMP #$20
2f26 : b0 03 __ BCS $2f2b ; (pet2screen.s2 + 0)
.s1:
2f28 : 69 80 __ ADC #$80
2f2a : 60 __ __ RTS
.s2:
2f2b : c9 40 __ CMP #$40
2f2d : 90 27 __ BCC $2f56 ; (pet2screen.s21 + 0)
.s7:
2f2f : c9 60 __ CMP #$60
2f31 : 90 17 __ BCC $2f4a ; (pet2screen.s4 + 0)
.s11:
2f33 : 09 00 __ ORA #$00
2f35 : 30 04 __ BMI $2f3b ; (pet2screen.s9 + 0)
.s8:
2f37 : 38 __ __ SEC
2f38 : e9 20 __ SBC #$20
2f3a : 60 __ __ RTS
.s9:
2f3b : c9 80 __ CMP #$80
2f3d : 90 17 __ BCC $2f56 ; (pet2screen.s21 + 0)
.s15:
2f3f : c9 a0 __ CMP #$a0
2f41 : b0 03 __ BCS $2f46 ; (pet2screen.s19 + 0)
.s12:
2f43 : 69 40 __ ADC #$40
2f45 : 60 __ __ RTS
.s19:
2f46 : c9 c0 __ CMP #$c0
2f48 : b0 04 __ BCS $2f4e ; (pet2screen.s23 + 0)
.s4:
2f4a : 38 __ __ SEC
2f4b : e9 40 __ SBC #$40
2f4d : 60 __ __ RTS
.s23:
2f4e : c9 ff __ CMP #$ff
2f50 : b0 04 __ BCS $2f56 ; (pet2screen.s21 + 0)
.s20:
2f52 : 38 __ __ SEC
2f53 : e9 80 __ SBC #$80
2f55 : 60 __ __ RTS
.s21:
2f56 : c9 ff __ CMP #$ff
2f58 : d0 02 __ BNE $2f5c ; (pet2screen.s1001 + 0)
.s24:
2f5a : a9 5e __ LDA #$5e
.s1001:
2f5c : 60 __ __ RTS
--------------------------------------------------------------------
2f5d : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 6f 53 43 41 52 36 34 : sTARTING oSCAR64
2f6d : __ __ __ BYT 20 76 64 63 20 44 45 4d 4f 2e 00                :  vdc DEMO..
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->i16
.s0:
2f78 : a9 00 __ LDA #$00
2f7a : 8d f6 bf STA $bff6 ; (sstack + 4)
2f7d : a0 02 __ LDY #$02
2f7f : b1 23 __ LDA (SP + 0),y 
2f81 : 85 4e __ STA T0 + 0 
2f83 : 85 16 __ STA P9 
2f85 : c8 __ __ INY
2f86 : b1 23 __ LDA (SP + 0),y 
2f88 : 85 4f __ STA T0 + 1 
2f8a : 85 17 __ STA P10 
2f8c : c8 __ __ INY
2f8d : b1 23 __ LDA (SP + 0),y 
2f8f : 8d f2 bf STA $bff2 ; (sstack + 0)
2f92 : c8 __ __ INY
2f93 : b1 23 __ LDA (SP + 0),y 
2f95 : 8d f3 bf STA $bff3 ; (sstack + 1)
2f98 : 18 __ __ CLC
2f99 : a5 23 __ LDA SP + 0 
2f9b : 69 06 __ ADC #$06
2f9d : 8d f4 bf STA $bff4 ; (sstack + 2)
2fa0 : a5 24 __ LDA SP + 1 
2fa2 : 69 00 __ ADC #$00
2fa4 : 8d f5 bf STA $bff5 ; (sstack + 3)
2fa7 : 20 0a 23 JSR $230a ; (sformat.s1000 + 0)
2faa : 38 __ __ SEC
2fab : a5 1b __ LDA ACCU + 0 
2fad : e5 4e __ SBC T0 + 0 
2faf : 85 1b __ STA ACCU + 0 
2fb1 : a5 1c __ LDA ACCU + 1 
2fb3 : e5 4f __ SBC T0 + 1 
2fb5 : 85 1c __ STA ACCU + 1 
.s1001:
2fb7 : 60 __ __ RTS
--------------------------------------------------------------------
2fb8 : __ __ __ BYT 76 64 63 20 4d 45 4d 4f 52 59 20 44 45 54 45 43 : vdc MEMORY DETEC
2fc8 : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 2c 20 45 58 54 45 : TED: %U kb, EXTE
2fd8 : __ __ __ BYT 4e 44 45 44 20 4d 45 4d 4f 52 59 20 25 53 41 42 : NDED MEMORY %SAB
2fe8 : __ __ __ BYT 4c 45 44 2e 00                                  : LED..
--------------------------------------------------------------------
2fed : __ __ __ BYT 64 49 53 00                                     : dIS.
--------------------------------------------------------------------
2ff1 : __ __ __ BYT 53 43 52 45 45 4e 32 00                         : SCREEN2.
--------------------------------------------------------------------
2ff9 : __ __ __ BYT 4d 55 53 49 43 31 00                            : MUSIC1.
--------------------------------------------------------------------
3000 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 3a 00 : lOADING ASSETS:.
--------------------------------------------------------------------
3010 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 3a 20 6c 4f 47 4f 20 41 : - SCREEN: lOGO A
3020 : __ __ __ BYT 4e 44 20 54 45 53 54 20 53 43 52 45 45 4e 00    : ND TEST SCREEN.
--------------------------------------------------------------------
menu_fileerrormessage: ; menu_fileerrormessage()->void
.s1000:
302f : a5 53 __ LDA T0 + 0 
3031 : 8d d3 bf STA $bfd3 ; (wrapbuffer + 59)
3034 : 38 __ __ SEC
3035 : a5 23 __ LDA SP + 0 
3037 : e9 08 __ SBC #$08
3039 : 85 23 __ STA SP + 0 
303b : b0 02 __ BCS $303f ; (menu_fileerrormessage.s0 + 0)
303d : c6 24 __ DEC SP + 1 
.s0:
303f : a9 f0 __ LDA #$f0
3041 : 8d f5 bf STA $bff5 ; (sstack + 3)
3044 : a9 08 __ LDA #$08
3046 : 8d f6 bf STA $bff6 ; (sstack + 4)
3049 : 8d f7 bf STA $bff7 ; (sstack + 5)
304c : a9 1e __ LDA #$1e
304e : 8d f8 bf STA $bff8 ; (sstack + 6)
3051 : a9 06 __ LDA #$06
3053 : 8d f9 bf STA $bff9 ; (sstack + 7)
3056 : ad d2 6f LDA $6fd2 ; (vdc_state + 7)
3059 : 85 53 __ STA T0 + 0 
305b : a9 8d __ LDA #$8d
305d : 8d d2 6f STA $6fd2 ; (vdc_state + 7)
3060 : 20 dc 30 JSR $30dc ; (vdcwin_win_new.s1000 + 0)
3063 : a9 0a __ LDA #$0a
3065 : 85 18 __ STA P11 
3067 : a9 09 __ LDA #$09
3069 : 8d f2 bf STA $bff2 ; (sstack + 0)
306c : a9 5a __ LDA #$5a
306e : 8d f3 bf STA $bff3 ; (sstack + 1)
3071 : a9 35 __ LDA #$35
3073 : 8d f4 bf STA $bff4 ; (sstack + 2)
3076 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
3079 : a9 90 __ LDA #$90
307b : a0 02 __ LDY #$02
307d : 91 23 __ STA (SP + 0),y 
307f : a9 71 __ LDA #$71
3081 : c8 __ __ INY
3082 : 91 23 __ STA (SP + 0),y 
3084 : a9 66 __ LDA #$66
3086 : c8 __ __ INY
3087 : 91 23 __ STA (SP + 0),y 
3089 : a9 35 __ LDA #$35
308b : c8 __ __ INY
308c : 91 23 __ STA (SP + 0),y 
308e : ad e5 6f LDA $6fe5 ; (krnio_pstatus + 1)
3091 : c8 __ __ INY
3092 : 91 23 __ STA (SP + 0),y 
3094 : a9 00 __ LDA #$00
3096 : c8 __ __ INY
3097 : 91 23 __ STA (SP + 0),y 
3099 : 20 78 2f JSR $2f78 ; (sprintf.s0 + 0)
309c : a9 0b __ LDA #$0b
309e : 8d f2 bf STA $bff2 ; (sstack + 0)
30a1 : a9 90 __ LDA #$90
30a3 : 8d f3 bf STA $bff3 ; (sstack + 1)
30a6 : a9 71 __ LDA #$71
30a8 : 8d f4 bf STA $bff4 ; (sstack + 2)
30ab : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
30ae : a9 0d __ LDA #$0d
30b0 : 8d f2 bf STA $bff2 ; (sstack + 0)
30b3 : a9 75 __ LDA #$75
30b5 : 8d f3 bf STA $bff3 ; (sstack + 1)
30b8 : a9 35 __ LDA #$35
30ba : 8d f4 bf STA $bff4 ; (sstack + 2)
30bd : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
30c0 : 20 80 35 JSR $3580 ; (vdcwin_getch.s0 + 0)
30c3 : 20 8e 35 JSR $358e ; (vdcwin_win_free.s0 + 0)
30c6 : a5 53 __ LDA T0 + 0 
30c8 : 8d d2 6f STA $6fd2 ; (vdc_state + 7)
.s1001:
30cb : 18 __ __ CLC
30cc : a5 23 __ LDA SP + 0 
30ce : 69 08 __ ADC #$08
30d0 : 85 23 __ STA SP + 0 
30d2 : 90 02 __ BCC $30d6 ; (menu_fileerrormessage.s1001 + 11)
30d4 : e6 24 __ INC SP + 1 
30d6 : ad d3 bf LDA $bfd3 ; (wrapbuffer + 59)
30d9 : 85 53 __ STA T0 + 0 
30db : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_new: ; vdcwin_win_new(u8,u8,u8,u8,u8)->bool
.s1000:
30dc : a2 0a __ LDX #$0a
30de : b5 53 __ LDA T4 + 0,x 
30e0 : 9d e7 bf STA $bfe7,x ; (wrapbuffer + 79)
30e3 : ca __ __ DEX
30e4 : 10 f8 __ BPL $30de ; (vdcwin_win_new.s1000 + 2)
.s0:
30e6 : ad f8 bf LDA $bff8 ; (sstack + 6)
30e9 : 85 4f __ STA T0 + 0 
30eb : 85 50 __ STA T1 + 0 
30ed : ad f9 bf LDA $bff9 ; (sstack + 7)
30f0 : 85 51 __ STA T2 + 0 
30f2 : 85 52 __ STA T3 + 0 
30f4 : ad f6 bf LDA $bff6 ; (sstack + 4)
30f7 : 85 53 __ STA T4 + 0 
30f9 : 85 0d __ STA P0 
30fb : ad f7 bf LDA $bff7 ; (sstack + 5)
30fe : 85 54 __ STA T5 + 0 
3100 : 85 0e __ STA P1 
3102 : 20 6e 22 JSR $226e ; (vdc_coords.s0 + 0)
3105 : a5 1b __ LDA ACCU + 0 
3107 : 85 55 __ STA T6 + 0 
3109 : a5 1c __ LDA ACCU + 1 ; (border + 0)
310b : 85 56 __ STA T6 + 1 
310d : ad f5 bf LDA $bff5 ; (sstack + 3)
3110 : 85 57 __ STA T7 + 0 
3112 : 85 58 __ STA T8 + 0 
3114 : 0a __ __ ASL
3115 : 10 13 __ BPL $312a ; (vdcwin_win_new.s55 + 0)
.s4:
3117 : a5 53 __ LDA T4 + 0 
3119 : f0 0f __ BEQ $312a ; (vdcwin_win_new.s55 + 0)
.s1:
311b : e6 50 __ INC T1 + 0 
311d : 18 __ __ CLC
311e : a5 1b __ LDA ACCU + 0 
3120 : 69 ff __ ADC #$ff
3122 : 85 55 __ STA T6 + 0 
3124 : a5 1c __ LDA ACCU + 1 ; (border + 0)
3126 : 69 ff __ ADC #$ff
3128 : 85 56 __ STA T6 + 1 
.s55:
312a : a5 58 __ LDA T8 + 0 
312c : 29 20 __ AND #$20
312e : f0 15 __ BEQ $3145 ; (vdcwin_win_new.s57 + 0)
.s8:
3130 : 18 __ __ CLC
3131 : a5 4f __ LDA T0 + 0 
3133 : 65 53 __ ADC T4 + 0 
3135 : a8 __ __ TAY
3136 : a9 00 __ LDA #$00
3138 : 2a __ __ ROL
3139 : cd cf 6f CMP $6fcf ; (vdc_state + 4)
313c : d0 03 __ BNE $3141 ; (vdcwin_win_new.s1009 + 0)
.s1008:
313e : cc ce 6f CPY $6fce ; (vdc_state + 3)
.s1009:
3141 : b0 02 __ BCS $3145 ; (vdcwin_win_new.s57 + 0)
.s5:
3143 : e6 50 __ INC T1 + 0 
.s57:
3145 : 24 58 __ BIT T8 + 0 
3147 : 10 1d __ BPL $3166 ; (vdcwin_win_new.s58 + 0)
.s12:
3149 : a5 54 __ LDA T5 + 0 
314b : f0 19 __ BEQ $3166 ; (vdcwin_win_new.s58 + 0)
.s9:
314d : e6 52 __ INC T3 + 0 
314f : ad ce 6f LDA $6fce ; (vdc_state + 3)
3152 : 85 03 __ STA WORK + 0 
3154 : ad cf 6f LDA $6fcf ; (vdc_state + 4)
3157 : 85 04 __ STA WORK + 1 
3159 : 38 __ __ SEC
315a : a5 55 __ LDA T6 + 0 
315c : e5 03 __ SBC WORK + 0 
315e : 85 55 __ STA T6 + 0 
3160 : a5 56 __ LDA T6 + 1 
3162 : e5 04 __ SBC WORK + 1 
3164 : 85 56 __ STA T6 + 1 
.s58:
3166 : a5 58 __ LDA T8 + 0 
3168 : 29 10 __ AND #$10
316a : f0 15 __ BEQ $3181 ; (vdcwin_win_new.s15 + 0)
.s16:
316c : 18 __ __ CLC
316d : a5 51 __ LDA T2 + 0 
316f : 65 54 __ ADC T5 + 0 
3171 : a8 __ __ TAY
3172 : a9 00 __ LDA #$00
3174 : 2a __ __ ROL
3175 : cd d1 6f CMP $6fd1 ; (vdc_state + 6)
3178 : d0 03 __ BNE $317d ; (vdcwin_win_new.s1007 + 0)
.s1006:
317a : cc d0 6f CPY $6fd0 ; (vdc_state + 5)
.s1007:
317d : b0 02 __ BCS $3181 ; (vdcwin_win_new.s15 + 0)
.s13:
317f : e6 52 __ INC T3 + 0 
.s15:
3181 : a5 51 __ LDA T2 + 0 
3183 : 85 1b __ STA ACCU + 0 
3185 : a9 00 __ LDA #$00
3187 : 85 1c __ STA ACCU + 1 ; (border + 0)
3189 : a5 4f __ LDA T0 + 0 
318b : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
318e : a5 05 __ LDA WORK + 2 
3190 : 0a __ __ ASL
3191 : 85 58 __ STA T8 + 0 
3193 : a5 06 __ LDA WORK + 3 
3195 : 2a __ __ ROL
3196 : 85 59 __ STA T8 + 1 
3198 : ad c9 6f LDA $6fc9 ; (winCfg + 6)
319b : 85 5a __ STA T9 + 0 
319d : 18 __ __ CLC
319e : 65 58 __ ADC T8 + 0 
31a0 : 85 58 __ STA T8 + 0 
31a2 : ad ca 6f LDA $6fca ; (winCfg + 7)
31a5 : 85 5b __ STA T9 + 1 
31a7 : 65 59 __ ADC T8 + 1 
31a9 : 85 59 __ STA T8 + 1 
31ab : ad c4 6f LDA $6fc4 ; (winCfg + 1)
31ae : 18 __ __ CLC
31af : 6d c6 6f ADC $6fc6 ; (winCfg + 3)
31b2 : a8 __ __ TAY
31b3 : ad c5 6f LDA $6fc5 ; (winCfg + 2)
31b6 : 6d c7 6f ADC $6fc7 ; (winCfg + 4)
31b9 : aa __ __ TAX
31ba : 98 __ __ TYA
31bb : 18 __ __ CLC
31bc : 69 fe __ ADC #$fe
31be : a8 __ __ TAY
31bf : 8a __ __ TXA
31c0 : 69 ff __ ADC #$ff
31c2 : c5 59 __ CMP T8 + 1 
31c4 : d0 02 __ BNE $31c8 ; (vdcwin_win_new.s1005 + 0)
.s1004:
31c6 : c4 58 __ CPY T8 + 0 
.s1005:
31c8 : 90 07 __ BCC $31d1 ; (vdcwin_win_new.s17 + 0)
.s19:
31ca : ad c8 6f LDA $6fc8 ; (winCfg + 5)
31cd : c9 03 __ CMP #$03
31cf : d0 04 __ BNE $31d5 ; (vdcwin_win_new.s23 + 0)
.s17:
31d1 : a9 00 __ LDA #$00
31d3 : f0 56 __ BEQ $322b ; (vdcwin_win_new.s1001 + 0)
.s23:
31d5 : a5 53 __ LDA T4 + 0 
31d7 : 85 11 __ STA P4 
31d9 : a5 54 __ LDA T5 + 0 
31db : 85 12 __ STA P5 
31dd : a5 4f __ LDA T0 + 0 
31df : 85 13 __ STA P6 
31e1 : a5 51 __ LDA T2 + 0 
31e3 : 85 14 __ STA P7 
31e5 : ee c8 6f INC $6fc8 ; (winCfg + 5)
31e8 : ae c8 6f LDX $6fc8 ; (winCfg + 5)
31eb : bd 8d 6a LDA $6a8d,x ; (__multab13L + 0)
31ee : 85 58 __ STA T8 + 0 
31f0 : 18 __ __ CLC
31f1 : 69 b9 __ ADC #$b9
31f3 : 85 5c __ STA T10 + 0 
31f5 : 85 0f __ STA P2 
31f7 : a9 70 __ LDA #$70
31f9 : 69 00 __ ADC #$00
31fb : 85 5d __ STA T10 + 1 
31fd : 85 10 __ STA P3 
31ff : 20 bb 32 JSR $32bb ; (vdcwin_init.s0 + 0)
3202 : a5 5a __ LDA T9 + 0 
3204 : a6 58 __ LDX T8 + 0 
3206 : 9d b6 70 STA $70b6,x 
3209 : a5 5b __ LDA T9 + 1 
320b : 9d b7 70 STA $70b7,x 
320e : a5 57 __ LDA T7 + 0 
3210 : 9d b8 70 STA $70b8,x 
3213 : a5 52 __ LDA T3 + 0 
3215 : d0 21 __ BNE $3238 ; (vdcwin_win_new.s30 + 0)
.s28:
3217 : a5 5c __ LDA T10 + 0 
3219 : 8d f2 bf STA $bff2 ; (sstack + 0)
321c : a5 5d __ LDA T10 + 1 
321e : 8d f3 bf STA $bff3 ; (sstack + 1)
3221 : a5 57 __ LDA T7 + 0 
3223 : 8d f4 bf STA $bff4 ; (sstack + 2)
3226 : 20 0c 33 JSR $330c ; (vdcwin_border_clear.s0 + 0)
3229 : a9 01 __ LDA #$01
.s1001:
322b : 85 1b __ STA ACCU + 0 
322d : a2 0a __ LDX #$0a
322f : bd e7 bf LDA $bfe7,x ; (wrapbuffer + 79)
3232 : 95 53 __ STA T4 + 0,x 
3234 : ca __ __ DEX
3235 : 10 f8 __ BPL $322f ; (vdcwin_win_new.s1001 + 4)
3237 : 60 __ __ RTS
.s30:
3238 : 85 4f __ STA T0 + 0 
.l26:
323a : a5 50 __ LDA T1 + 0 
323c : 85 14 __ STA P7 
323e : a9 00 __ LDA #$00
3240 : 85 15 __ STA P8 
3242 : ad c3 6f LDA $6fc3 ; (winCfg + 0)
3245 : 85 0f __ STA P2 
3247 : ad c9 6f LDA $6fc9 ; (winCfg + 6)
324a : 85 5a __ STA T9 + 0 
324c : 85 10 __ STA P3 
324e : ad ca 6f LDA $6fca ; (winCfg + 7)
3251 : 85 5b __ STA T9 + 1 
3253 : 85 11 __ STA P4 
3255 : ad d3 6f LDA $6fd3 ; (vdc_state + 8)
3258 : 18 __ __ CLC
3259 : 65 55 __ ADC T6 + 0 
325b : 85 12 __ STA P5 
325d : ad d4 6f LDA $6fd4 ; (vdc_state + 9)
3260 : 65 56 __ ADC T6 + 1 
3262 : 85 13 __ STA P6 
3264 : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
3267 : a9 00 __ LDA #$00
3269 : 85 15 __ STA P8 
326b : a5 50 __ LDA T1 + 0 
326d : 85 14 __ STA P7 
326f : 18 __ __ CLC
3270 : 65 5a __ ADC T9 + 0 
3272 : 85 5a __ STA T9 + 0 
3274 : 85 10 __ STA P3 
3276 : 8d c9 6f STA $6fc9 ; (winCfg + 6)
3279 : a5 5b __ LDA T9 + 1 
327b : 69 00 __ ADC #$00
327d : 85 5b __ STA T9 + 1 
327f : 85 11 __ STA P4 
3281 : 8d ca 6f STA $6fca ; (winCfg + 7)
3284 : ad d5 6f LDA $6fd5 ; (vdc_state + 10)
3287 : 18 __ __ CLC
3288 : 65 55 __ ADC T6 + 0 
328a : 85 12 __ STA P5 
328c : ad d6 6f LDA $6fd6 ; (vdc_state + 11)
328f : 65 56 __ ADC T6 + 1 
3291 : 85 13 __ STA P6 
3293 : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
3296 : 18 __ __ CLC
3297 : a5 5a __ LDA T9 + 0 
3299 : 65 50 __ ADC T1 + 0 
329b : 8d c9 6f STA $6fc9 ; (winCfg + 6)
329e : a5 5b __ LDA T9 + 1 
32a0 : 69 00 __ ADC #$00
32a2 : 8d ca 6f STA $6fca ; (winCfg + 7)
32a5 : ad ce 6f LDA $6fce ; (vdc_state + 3)
32a8 : 18 __ __ CLC
32a9 : 65 55 __ ADC T6 + 0 
32ab : 85 55 __ STA T6 + 0 
32ad : ad cf 6f LDA $6fcf ; (vdc_state + 4)
32b0 : 65 56 __ ADC T6 + 1 
32b2 : 85 56 __ STA T6 + 1 
32b4 : c6 4f __ DEC T0 + 0 
32b6 : d0 82 __ BNE $323a ; (vdcwin_win_new.l26 + 0)
32b8 : 4c 17 32 JMP $3217 ; (vdcwin_win_new.s28 + 0)
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
32bb : a5 11 __ LDA P4 ; (sx + 0)
32bd : 85 0d __ STA P0 
32bf : a0 00 __ LDY #$00
32c1 : 91 0f __ STA (P2),y ; (win + 0)
32c3 : 98 __ __ TYA
32c4 : a0 04 __ LDY #$04
32c6 : 91 0f __ STA (P2),y ; (win + 0)
32c8 : c8 __ __ INY
32c9 : 91 0f __ STA (P2),y ; (win + 0)
32cb : a5 12 __ LDA P5 ; (sy + 0)
32cd : a0 01 __ LDY #$01
32cf : 91 0f __ STA (P2),y ; (win + 0)
32d1 : 85 0e __ STA P1 
32d3 : a5 13 __ LDA P6 ; (wx + 0)
32d5 : c8 __ __ INY
32d6 : 91 0f __ STA (P2),y ; (win + 0)
32d8 : a5 14 __ LDA P7 ; (wy + 0)
32da : c8 __ __ INY
32db : 91 0f __ STA (P2),y ; (win + 0)
32dd : 20 6e 22 JSR $226e ; (vdc_coords.s0 + 0)
32e0 : ad d3 6f LDA $6fd3 ; (vdc_state + 8)
32e3 : 18 __ __ CLC
32e4 : 65 1b __ ADC ACCU + 0 
32e6 : aa __ __ TAX
32e7 : ad d4 6f LDA $6fd4 ; (vdc_state + 9)
32ea : 65 1c __ ADC ACCU + 1 
32ec : a0 07 __ LDY #$07
32ee : 91 0f __ STA (P2),y ; (win + 0)
32f0 : 8a __ __ TXA
32f1 : 88 __ __ DEY
32f2 : 91 0f __ STA (P2),y ; (win + 0)
32f4 : 20 6e 22 JSR $226e ; (vdc_coords.s0 + 0)
32f7 : ad d5 6f LDA $6fd5 ; (vdc_state + 10)
32fa : 18 __ __ CLC
32fb : 65 1b __ ADC ACCU + 0 
32fd : aa __ __ TAX
32fe : ad d6 6f LDA $6fd6 ; (vdc_state + 11)
3301 : 65 1c __ ADC ACCU + 1 
3303 : a0 09 __ LDY #$09
3305 : 91 0f __ STA (P2),y ; (win + 0)
3307 : 8a __ __ TXA
3308 : 88 __ __ DEY
3309 : 91 0f __ STA (P2),y ; (win + 0)
.s1001:
330b : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_border_clear: ; vdcwin_border_clear(struct VDCWin*,u8)->void
.s0:
330c : ad f4 bf LDA $bff4 ; (sstack + 2)
330f : 29 0f __ AND #$0f
3311 : 85 48 __ STA T2 + 0 
3313 : 49 ff __ EOR #$ff
3315 : 18 __ __ CLC
3316 : 69 01 __ ADC #$01
3318 : 29 09 __ AND #$09
331a : 85 49 __ STA T3 + 0 
331c : aa __ __ TAX
331d : bd b2 6a LDA $6ab2,x ; (winStyles + 0)
3320 : 85 4a __ STA T4 + 0 
3322 : ad f4 bf LDA $bff4 ; (sstack + 2)
3325 : 0a __ __ ASL
3326 : 10 10 __ BPL $3338 ; (vdcwin_border_clear.s53 + 0)
.s4:
3328 : ad f2 bf LDA $bff2 ; (sstack + 0)
332b : 85 4b __ STA T5 + 0 
332d : ad f3 bf LDA $bff3 ; (sstack + 1)
3330 : 85 4c __ STA T5 + 1 
3332 : a0 00 __ LDY #$00
3334 : b1 4b __ LDA (T5 + 0),y 
3336 : f0 06 __ BEQ $333e ; (vdcwin_border_clear.s1 + 0)
.s53:
3338 : ad f4 bf LDA $bff4 ; (sstack + 2)
333b : 4c 46 33 JMP $3346 ; (vdcwin_border_clear.s1008 + 0)
.s1:
333e : ad f4 bf LDA $bff4 ; (sstack + 2)
3341 : 29 bf __ AND #$bf
3343 : 8d f4 bf STA $bff4 ; (sstack + 2)
.s1008:
3346 : 29 20 __ AND #$20
3348 : f0 3c __ BEQ $3386 ; (vdcwin_border_clear.s7 + 0)
.s8:
334a : ad f2 bf LDA $bff2 ; (sstack + 0)
334d : 85 46 __ STA T1 + 0 
334f : ad f3 bf LDA $bff3 ; (sstack + 1)
3352 : 85 47 __ STA T1 + 1 
3354 : a0 00 __ LDY #$00
3356 : b1 46 __ LDA (T1 + 0),y 
3358 : 18 __ __ CLC
3359 : a0 02 __ LDY #$02
335b : 71 46 __ ADC (T1 + 0),y 
335d : a8 __ __ TAY
335e : a9 00 __ LDA #$00
3360 : 2a __ __ ROL
3361 : 85 47 __ STA T1 + 1 
3363 : 98 __ __ TYA
3364 : 69 01 __ ADC #$01
3366 : 85 4b __ STA T5 + 0 
3368 : a5 47 __ LDA T1 + 1 
336a : 69 00 __ ADC #$00
336c : 85 4c __ STA T5 + 1 
336e : ad cf 6f LDA $6fcf ; (vdc_state + 4)
3371 : c5 4c __ CMP T5 + 1 
3373 : d0 05 __ BNE $337a ; (vdcwin_border_clear.s1007 + 0)
.s1006:
3375 : ad ce 6f LDA $6fce ; (vdc_state + 3)
3378 : c5 4b __ CMP T5 + 0 
.s1007:
337a : b0 0a __ BCS $3386 ; (vdcwin_border_clear.s7 + 0)
.s5:
337c : ad f4 bf LDA $bff4 ; (sstack + 2)
337f : 29 df __ AND #$df
3381 : 8d f4 bf STA $bff4 ; (sstack + 2)
3384 : 90 03 __ BCC $3389 ; (vdcwin_border_clear.s55 + 0)
.s7:
3386 : ad f4 bf LDA $bff4 ; (sstack + 2)
.s55:
3389 : 85 45 __ STA T0 + 0 
338b : 09 00 __ ORA #$00
338d : 85 46 __ STA T1 + 0 
338f : 10 6e __ BPL $33ff ; (vdcwin_border_clear.s59 + 0)
.s12:
3391 : ad f2 bf LDA $bff2 ; (sstack + 0)
3394 : 85 4b __ STA T5 + 0 
3396 : ad f3 bf LDA $bff3 ; (sstack + 1)
3399 : 85 4c __ STA T5 + 1 
339b : a0 01 __ LDY #$01
339d : b1 4b __ LDA (T5 + 0),y 
339f : f0 5e __ BEQ $33ff ; (vdcwin_border_clear.s59 + 0)
.s9:
33a1 : 38 __ __ SEC
33a2 : e9 01 __ SBC #$01
33a4 : 85 4d __ STA T7 + 0 
33a6 : 06 45 __ ASL T0 + 0 
33a8 : 10 16 __ BPL $33c0 ; (vdcwin_border_clear.s15 + 0)
.s13:
33aa : 85 11 __ STA P4 
33ac : a5 4a __ LDA T4 + 0 
33ae : 85 13 __ STA P6 
33b0 : bd b3 6a LDA $6ab3,x ; (winStyles + 1)
33b3 : 85 12 __ STA P5 
33b5 : 38 __ __ SEC
33b6 : 88 __ __ DEY
33b7 : b1 4b __ LDA (T5 + 0),y 
33b9 : e9 01 __ SBC #$01
33bb : 85 10 __ STA P3 
33bd : 20 1b 35 JSR $351b ; (vdc_printc.s0 + 0)
.s15:
33c0 : a0 00 __ LDY #$00
33c2 : b1 4b __ LDA (T5 + 0),y 
33c4 : 85 45 __ STA T0 + 0 
33c6 : 85 13 __ STA P6 
33c8 : a5 4d __ LDA T7 + 0 
33ca : 85 14 __ STA P7 
33cc : a5 4a __ LDA T4 + 0 
33ce : 85 16 __ STA P9 
33d0 : a6 49 __ LDX T3 + 0 
33d2 : bd b7 6a LDA $6ab7,x ; (winStyles + 5)
33d5 : 85 15 __ STA P8 
33d7 : a0 02 __ LDY #$02
33d9 : b1 4b __ LDA (T5 + 0),y 
33db : 85 17 __ STA P10 
33dd : 20 2a 22 JSR $222a ; (vdc_hchar.s0 + 0)
33e0 : a5 46 __ LDA T1 + 0 
33e2 : 29 20 __ AND #$20
33e4 : f0 19 __ BEQ $33ff ; (vdcwin_border_clear.s59 + 0)
.s16:
33e6 : a5 14 __ LDA P7 
33e8 : 85 11 __ STA P4 
33ea : a5 16 __ LDA P9 
33ec : 85 13 __ STA P6 
33ee : a6 49 __ LDX T3 + 0 
33f0 : bd b4 6a LDA $6ab4,x ; (winStyles + 2)
33f3 : 85 12 __ STA P5 
33f5 : 18 __ __ CLC
33f6 : a5 17 __ LDA P10 
33f8 : 65 45 __ ADC T0 + 0 
33fa : 85 10 __ STA P3 
33fc : 20 1b 35 JSR $351b ; (vdc_printc.s0 + 0)
.s59:
33ff : a5 46 __ LDA T1 + 0 
3401 : 29 10 __ AND #$10
3403 : d0 03 __ BNE $3408 ; (vdcwin_border_clear.s22 + 0)
3405 : 4c 8b 34 JMP $348b ; (vdcwin_border_clear.s39 + 0)
.s22:
3408 : ad f2 bf LDA $bff2 ; (sstack + 0)
340b : 85 4b __ STA T5 + 0 
340d : ad f3 bf LDA $bff3 ; (sstack + 1)
3410 : 85 4c __ STA T5 + 1 
3412 : a0 01 __ LDY #$01
3414 : b1 4b __ LDA (T5 + 0),y 
3416 : 18 __ __ CLC
3417 : a0 03 __ LDY #$03
3419 : 71 4b __ ADC (T5 + 0),y 
341b : 85 4d __ STA T7 + 0 
341d : a9 00 __ LDA #$00
341f : 2a __ __ ROL
3420 : cd d1 6f CMP $6fd1 ; (vdc_state + 6)
3423 : d0 05 __ BNE $342a ; (vdcwin_border_clear.s1005 + 0)
.s1004:
3425 : a5 4d __ LDA T7 + 0 
3427 : cd d0 6f CMP $6fd0 ; (vdc_state + 5)
.s1005:
342a : b0 5f __ BCS $348b ; (vdcwin_border_clear.s39 + 0)
.s19:
342c : a5 46 __ LDA T1 + 0 
342e : 0a __ __ ASL
342f : 10 1b __ BPL $344c ; (vdcwin_border_clear.s25 + 0)
.s23:
3431 : a5 4d __ LDA T7 + 0 
3433 : 85 11 __ STA P4 
3435 : a5 4a __ LDA T4 + 0 
3437 : 85 13 __ STA P6 
3439 : a6 49 __ LDX T3 + 0 
343b : bd b5 6a LDA $6ab5,x ; (winStyles + 3)
343e : 85 12 __ STA P5 
3440 : 38 __ __ SEC
3441 : a0 00 __ LDY #$00
3443 : b1 4b __ LDA (T5 + 0),y 
3445 : e9 01 __ SBC #$01
3447 : 85 10 __ STA P3 
3449 : 20 1b 35 JSR $351b ; (vdc_printc.s0 + 0)
.s25:
344c : a0 00 __ LDY #$00
344e : b1 4b __ LDA (T5 + 0),y 
3450 : 85 45 __ STA T0 + 0 
3452 : 85 13 __ STA P6 
3454 : a5 4d __ LDA T7 + 0 
3456 : 85 14 __ STA P7 
3458 : a5 4a __ LDA T4 + 0 
345a : 85 16 __ STA P9 
345c : a6 49 __ LDX T3 + 0 
345e : bd b8 6a LDA $6ab8,x ; (winStyles + 6)
3461 : 85 15 __ STA P8 
3463 : a0 02 __ LDY #$02
3465 : b1 4b __ LDA (T5 + 0),y 
3467 : 85 17 __ STA P10 
3469 : 20 2a 22 JSR $222a ; (vdc_hchar.s0 + 0)
346c : a5 46 __ LDA T1 + 0 
346e : 29 20 __ AND #$20
3470 : f0 19 __ BEQ $348b ; (vdcwin_border_clear.s39 + 0)
.s26:
3472 : a5 14 __ LDA P7 
3474 : 85 11 __ STA P4 
3476 : a5 16 __ LDA P9 
3478 : 85 13 __ STA P6 
347a : a6 49 __ LDX T3 + 0 
347c : bd b6 6a LDA $6ab6,x ; (winStyles + 4)
347f : 85 12 __ STA P5 
3481 : 18 __ __ CLC
3482 : a5 17 __ LDA P10 
3484 : 65 45 __ ADC T0 + 0 
3486 : 85 10 __ STA P3 
3488 : 20 1b 35 JSR $351b ; (vdc_printc.s0 + 0)
.s39:
348b : a9 00 __ LDA #$00
348d : 85 45 __ STA T0 + 0 
348f : ad f2 bf LDA $bff2 ; (sstack + 0)
3492 : 85 46 __ STA T1 + 0 
3494 : ad f3 bf LDA $bff3 ; (sstack + 1)
3497 : 85 47 __ STA T1 + 1 
.l29:
3499 : a5 45 __ LDA T0 + 0 
349b : a0 03 __ LDY #$03
349d : d1 46 __ CMP (T1 + 0),y 
349f : 90 01 __ BCC $34a2 ; (vdcwin_border_clear.s30 + 0)
.s1001:
34a1 : 60 __ __ RTS
.s30:
34a2 : ad f4 bf LDA $bff4 ; (sstack + 2)
34a5 : 85 4b __ STA T5 + 0 
34a7 : 0a __ __ ASL
34a8 : 10 25 __ BPL $34cf ; (vdcwin_border_clear.s35 + 0)
.s33:
34aa : a5 4a __ LDA T4 + 0 
34ac : 85 13 __ STA P6 
34ae : 38 __ __ SEC
34af : a0 00 __ LDY #$00
34b1 : b1 46 __ LDA (T1 + 0),y 
34b3 : e9 01 __ SBC #$01
34b5 : 85 10 __ STA P3 
34b7 : c8 __ __ INY
34b8 : b1 46 __ LDA (T1 + 0),y 
34ba : 18 __ __ CLC
34bb : 65 45 __ ADC T0 + 0 
34bd : 85 11 __ STA P4 
34bf : 38 __ __ SEC
34c0 : a9 00 __ LDA #$00
34c2 : e5 48 __ SBC T2 + 0 
34c4 : 29 09 __ AND #$09
34c6 : aa __ __ TAX
34c7 : bd b9 6a LDA $6ab9,x ; (winStyles + 7)
34ca : 85 12 __ STA P5 
34cc : 20 1b 35 JSR $351b ; (vdc_printc.s0 + 0)
.s35:
34cf : a9 20 __ LDA #$20
34d1 : 85 15 __ STA P8 
34d3 : a0 02 __ LDY #$02
34d5 : b1 46 __ LDA (T1 + 0),y 
34d7 : 85 17 __ STA P10 
34d9 : a0 00 __ LDY #$00
34db : b1 46 __ LDA (T1 + 0),y 
34dd : 85 4e __ STA T9 + 0 
34df : 85 13 __ STA P6 
34e1 : c8 __ __ INY
34e2 : b1 46 __ LDA (T1 + 0),y 
34e4 : 18 __ __ CLC
34e5 : 65 45 __ ADC T0 + 0 
34e7 : 85 14 __ STA P7 
34e9 : ad d2 6f LDA $6fd2 ; (vdc_state + 7)
34ec : 85 16 __ STA P9 
34ee : 20 2a 22 JSR $222a ; (vdc_hchar.s0 + 0)
34f1 : a5 4b __ LDA T5 + 0 
34f3 : 29 20 __ AND #$20
34f5 : f0 1f __ BEQ $3516 ; (vdcwin_border_clear.s69 + 0)
.s36:
34f7 : a5 14 __ LDA P7 
34f9 : 85 11 __ STA P4 
34fb : a5 4a __ LDA T4 + 0 
34fd : 85 13 __ STA P6 
34ff : 18 __ __ CLC
3500 : a5 17 __ LDA P10 
3502 : 65 4e __ ADC T9 + 0 
3504 : 85 10 __ STA P3 
3506 : 38 __ __ SEC
3507 : a9 00 __ LDA #$00
3509 : e5 48 __ SBC T2 + 0 
350b : 29 09 __ AND #$09
350d : aa __ __ TAX
350e : bd ba 6a LDA $6aba,x ; (winStyles + 8)
3511 : 85 12 __ STA P5 
3513 : 20 1b 35 JSR $351b ; (vdc_printc.s0 + 0)
.s69:
3516 : e6 45 __ INC T0 + 0 
3518 : 4c 99 34 JMP $3499 ; (vdcwin_border_clear.l29 + 0)
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
351b : a5 10 __ LDA P3 ; (x + 0)
351d : 85 0d __ STA P0 
351f : a5 11 __ LDA P4 ; (y + 0)
3521 : 85 0e __ STA P1 
3523 : 20 6e 22 JSR $226e ; (vdc_coords.s0 + 0)
3526 : a5 1b __ LDA ACCU + 0 
3528 : 85 43 __ STA T1 + 0 
352a : a5 1c __ LDA ACCU + 1 
352c : 85 44 __ STA T1 + 1 
352e : ad d3 6f LDA $6fd3 ; (vdc_state + 8)
3531 : 18 __ __ CLC
3532 : 65 1b __ ADC ACCU + 0 
3534 : 85 0d __ STA P0 
3536 : ad d4 6f LDA $6fd4 ; (vdc_state + 9)
3539 : 65 1c __ ADC ACCU + 1 
353b : 85 0e __ STA P1 
353d : a5 12 __ LDA P5 ; (val + 0)
353f : 85 0f __ STA P2 
3541 : 20 78 21 JSR $2178 ; (vdc_mem_write_at.s0 + 0)
3544 : ad d5 6f LDA $6fd5 ; (vdc_state + 10)
3547 : 18 __ __ CLC
3548 : 65 43 __ ADC T1 + 0 
354a : 85 0d __ STA P0 
354c : ad d6 6f LDA $6fd6 ; (vdc_state + 11)
354f : 65 44 __ ADC T1 + 1 
3551 : 85 0e __ STA P1 
3553 : a5 13 __ LDA P6 ; (attr + 0)
3555 : 85 0f __ STA P2 
3557 : 4c 78 21 JMP $2178 ; (vdc_mem_write_at.s0 + 0)
--------------------------------------------------------------------
355a : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 00             : fILE ERROR!.
--------------------------------------------------------------------
3566 : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 00    : eRROR NR.: %2x.
--------------------------------------------------------------------
3575 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 2e 00                : pRESS KEY..
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
3580 : 20 e4 ff JSR $ffe4 
3583 : c9 00 __ CMP #$00
3585 : f0 f9 __ BEQ $3580 ; (vdcwin_getch.s0 + 0)
3587 : 85 1b __ STA ACCU + 0 
3589 : a9 00 __ LDA #$00
358b : 85 1c __ STA ACCU + 1 
.s1001:
358d : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_free: ; vdcwin_win_free()->void
.s0:
358e : ad c8 6f LDA $6fc8 ; (winCfg + 5)
3591 : d0 01 __ BNE $3594 ; (vdcwin_win_free.s3 + 0)
3593 : 60 __ __ RTS
.s3:
3594 : 85 44 __ STA T0 + 0 
3596 : aa __ __ TAX
3597 : bd 8d 6a LDA $6a8d,x ; (__multab13L + 0)
359a : 85 45 __ STA T1 + 0 
359c : aa __ __ TAX
359d : bd b9 70 LDA $70b9,x 
35a0 : 85 0d __ STA P0 
35a2 : bd ba 70 LDA $70ba,x 
35a5 : 85 0e __ STA P1 
35a7 : 20 6e 22 JSR $226e ; (vdc_coords.s0 + 0)
35aa : a5 1b __ LDA ACCU + 0 
35ac : 85 46 __ STA T2 + 0 
35ae : a5 1c __ LDA ACCU + 1 
35b0 : 85 47 __ STA T2 + 1 
35b2 : a4 45 __ LDY T1 + 0 
35b4 : b9 bc 70 LDA $70bc,y 
35b7 : 85 1d __ STA ACCU + 2 
35b9 : b9 b6 70 LDA $70b6,y 
35bc : 85 49 __ STA T5 + 0 
35be : 8d c9 6f STA $6fc9 ; (winCfg + 6)
35c1 : b9 b7 70 LDA $70b7,y 
35c4 : 85 4a __ STA T5 + 1 
35c6 : 8d ca 6f STA $6fca ; (winCfg + 7)
35c9 : b9 b8 70 LDA $70b8,y 
35cc : 85 45 __ STA T1 + 0 
35ce : be bb 70 LDX $70bb,y 
35d1 : 0a __ __ ASL
35d2 : 10 12 __ BPL $35e6 ; (vdcwin_win_free.s51 + 0)
.s8:
35d4 : a5 0d __ LDA P0 
35d6 : f0 0e __ BEQ $35e6 ; (vdcwin_win_free.s51 + 0)
.s5:
35d8 : 18 __ __ CLC
35d9 : a5 1b __ LDA ACCU + 0 
35db : 69 ff __ ADC #$ff
35dd : 85 46 __ STA T2 + 0 
35df : a5 1c __ LDA ACCU + 1 
35e1 : 69 ff __ ADC #$ff
35e3 : 85 47 __ STA T2 + 1 
35e5 : e8 __ __ INX
.s51:
35e6 : a5 45 __ LDA T1 + 0 
35e8 : 29 20 __ AND #$20
35ea : f0 18 __ BEQ $3604 ; (vdcwin_win_free.s53 + 0)
.s12:
35ec : b9 bb 70 LDA $70bb,y 
35ef : 18 __ __ CLC
35f0 : 65 0d __ ADC P0 
35f2 : 85 4b __ STA T11 + 0 
35f4 : a9 00 __ LDA #$00
35f6 : 2a __ __ ROL
35f7 : cd cf 6f CMP $6fcf ; (vdc_state + 4)
35fa : d0 05 __ BNE $3601 ; (vdcwin_win_free.s1005 + 0)
.s1004:
35fc : a5 4b __ LDA T11 + 0 
35fe : cd ce 6f CMP $6fce ; (vdc_state + 3)
.s1005:
3601 : b0 01 __ BCS $3604 ; (vdcwin_win_free.s53 + 0)
.s9:
3603 : e8 __ __ INX
.s53:
3604 : 24 45 __ BIT T1 + 0 
3606 : 10 1b __ BPL $3623 ; (vdcwin_win_free.s54 + 0)
.s16:
3608 : a5 0e __ LDA P1 
360a : f0 17 __ BEQ $3623 ; (vdcwin_win_free.s54 + 0)
.s13:
360c : b9 bc 70 LDA $70bc,y 
360f : 18 __ __ CLC
3610 : 69 01 __ ADC #$01
3612 : 85 1d __ STA ACCU + 2 
3614 : 38 __ __ SEC
3615 : a5 46 __ LDA T2 + 0 
3617 : ed ce 6f SBC $6fce ; (vdc_state + 3)
361a : 85 46 __ STA T2 + 0 
361c : a5 47 __ LDA T2 + 1 
361e : ed cf 6f SBC $6fcf ; (vdc_state + 4)
3621 : 85 47 __ STA T2 + 1 
.s54:
3623 : a5 45 __ LDA T1 + 0 
3625 : 29 10 __ AND #$10
3627 : f0 16 __ BEQ $363f ; (vdcwin_win_free.s19 + 0)
.s20:
3629 : b9 bc 70 LDA $70bc,y 
362c : 18 __ __ CLC
362d : 65 0e __ ADC P1 
362f : a8 __ __ TAY
3630 : a9 00 __ LDA #$00
3632 : 2a __ __ ROL
3633 : cd d1 6f CMP $6fd1 ; (vdc_state + 6)
3636 : d0 03 __ BNE $363b ; (vdcwin_win_free.s1003 + 0)
.s1002:
3638 : cc d0 6f CPY $6fd0 ; (vdc_state + 5)
.s1003:
363b : b0 02 __ BCS $363f ; (vdcwin_win_free.s19 + 0)
.s17:
363d : e6 1d __ INC ACCU + 2 
.s19:
363f : a5 1d __ LDA ACCU + 2 
3641 : d0 11 __ BNE $3654 ; (vdcwin_win_free.s25 + 0)
.s24:
3643 : a5 49 __ LDA T5 + 0 
3645 : 8d c9 6f STA $6fc9 ; (winCfg + 6)
3648 : a5 4a __ LDA T5 + 1 
364a : 8d ca 6f STA $6fca ; (winCfg + 7)
364d : a6 44 __ LDX T0 + 0 
364f : ca __ __ DEX
3650 : 8e c8 6f STX $6fc8 ; (winCfg + 5)
.s1001:
3653 : 60 __ __ RTS
.s25:
3654 : 86 14 __ STX P7 
3656 : 85 48 __ STA T3 + 0 
.l1006:
3658 : a9 00 __ LDA #$00
365a : 85 15 __ STA P8 
365c : ad d3 6f LDA $6fd3 ; (vdc_state + 8)
365f : 18 __ __ CLC
3660 : 65 46 __ ADC T2 + 0 
3662 : 85 0f __ STA P2 
3664 : ad d4 6f LDA $6fd4 ; (vdc_state + 9)
3667 : 65 47 __ ADC T2 + 1 
3669 : 85 10 __ STA P3 
366b : ad c3 6f LDA $6fc3 ; (winCfg + 0)
366e : 85 11 __ STA P4 
3670 : ad c9 6f LDA $6fc9 ; (winCfg + 6)
3673 : 85 4b __ STA T11 + 0 
3675 : 85 12 __ STA P5 
3677 : ad ca 6f LDA $6fca ; (winCfg + 7)
367a : 85 4c __ STA T11 + 1 
367c : 85 13 __ STA P6 
367e : 20 ed 13 JSR $13ed ; (bnk_cpytovdc.s0 + 0)
3681 : a9 00 __ LDA #$00
3683 : 85 15 __ STA P8 
3685 : 18 __ __ CLC
3686 : a5 4b __ LDA T11 + 0 
3688 : 65 14 __ ADC P7 
368a : 85 4b __ STA T11 + 0 
368c : 85 12 __ STA P5 
368e : 8d c9 6f STA $6fc9 ; (winCfg + 6)
3691 : a5 4c __ LDA T11 + 1 
3693 : 69 00 __ ADC #$00
3695 : 85 4c __ STA T11 + 1 
3697 : 85 13 __ STA P6 
3699 : 8d ca 6f STA $6fca ; (winCfg + 7)
369c : ad d5 6f LDA $6fd5 ; (vdc_state + 10)
369f : 18 __ __ CLC
36a0 : 65 46 __ ADC T2 + 0 
36a2 : 85 0f __ STA P2 
36a4 : ad d6 6f LDA $6fd6 ; (vdc_state + 11)
36a7 : 65 47 __ ADC T2 + 1 
36a9 : 85 10 __ STA P3 
36ab : 20 ed 13 JSR $13ed ; (bnk_cpytovdc.s0 + 0)
36ae : 18 __ __ CLC
36af : a5 4b __ LDA T11 + 0 
36b1 : 65 14 __ ADC P7 
36b3 : 8d c9 6f STA $6fc9 ; (winCfg + 6)
36b6 : a5 4c __ LDA T11 + 1 
36b8 : 69 00 __ ADC #$00
36ba : 8d ca 6f STA $6fca ; (winCfg + 7)
36bd : ad ce 6f LDA $6fce ; (vdc_state + 3)
36c0 : 18 __ __ CLC
36c1 : 65 46 __ ADC T2 + 0 
36c3 : 85 46 __ STA T2 + 0 
36c5 : ad cf 6f LDA $6fcf ; (vdc_state + 4)
36c8 : 65 47 __ ADC T2 + 1 
36ca : 85 47 __ STA T2 + 1 
36cc : c6 48 __ DEC T3 + 0 
36ce : d0 88 __ BNE $3658 ; (vdcwin_win_free.l1006 + 0)
36d0 : 4c 43 36 JMP $3643 ; (vdcwin_win_free.s24 + 0)
--------------------------------------------------------------------
36d3 : __ __ __ BYT 2d 20 4d 55 53 49 43 3a 20 75 4c 54 49 4d 41 54 : - MUSIC: uLTIMAT
36e3 : __ __ __ BYT 45 20 61 58 45 4c 20 66 20 46 52 4f 4d 20 6e 4f : E aXEL f FROM nO
36f3 : __ __ __ BYT 52 44 49 53 43 48 53 4f 55 4e 44 00             : RDISCHSOUND.
--------------------------------------------------------------------
menu_placetop: ; menu_placetop(const u8*)->void
.s0:
36ff : 20 d2 21 JSR $21d2 ; (vdc_cls.s0 + 0)
3702 : ad f6 bf LDA $bff6 ; (sstack + 4)
3705 : 8d f2 bf STA $bff2 ; (sstack + 0)
3708 : ad f7 bf LDA $bff7 ; (sstack + 5)
370b : 8d f3 bf STA $bff3 ; (sstack + 1)
370e : 20 18 37 JSR $3718 ; (menu_placeheader.s0 + 0)
3711 : a9 01 __ LDA #$01
3713 : 85 18 __ STA P11 
3715 : 4c 3e 37 JMP $373e ; (menu_placebar.s0 + 0)
--------------------------------------------------------------------
menu_placeheader: ; menu_placeheader(const u8*)->void
.s0:
3718 : a9 00 __ LDA #$00
371a : 85 13 __ STA P6 
371c : 85 14 __ STA P7 
371e : a9 20 __ LDA #$20
3720 : 85 15 __ STA P8 
3722 : a9 c5 __ LDA #$c5
3724 : 85 16 __ STA P9 
3726 : a9 50 __ LDA #$50
3728 : 85 17 __ STA P10 
372a : 20 2a 22 JSR $222a ; (vdc_hchar.s0 + 0)
372d : a9 c5 __ LDA #$c5
372f : 85 17 __ STA P10 
3731 : ad f2 bf LDA $bff2 ; (sstack + 0)
3734 : 85 15 __ STA P8 
3736 : ad f3 bf LDA $bff3 ; (sstack + 1)
3739 : 85 16 __ STA P9 
373b : 4c 95 2e JMP $2e95 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
menu_placebar: ; menu_placebar(u8)->void
.s0:
373e : a9 00 __ LDA #$00
3740 : 85 13 __ STA P6 
3742 : a9 20 __ LDA #$20
3744 : 85 15 __ STA P8 
3746 : a9 c4 __ LDA #$c4
3748 : 85 16 __ STA P9 
374a : a9 50 __ LDA #$50
374c : 85 17 __ STA P10 
374e : a5 18 __ LDA P11 ; (y + 0)
3750 : 8d 3c 6c STA $6c3c ; (menubar + 60)
3753 : 85 14 __ STA P7 
3755 : 20 2a 22 JSR $222a ; (vdc_hchar.s0 + 0)
3758 : a9 01 __ LDA #$01
375a : 85 47 __ STA T1 + 0 
375c : a0 00 __ LDY #$00
375e : 84 48 __ STY T2 + 0 
.l2:
3760 : b9 91 6a LDA $6a91,y ; (__multab9L + 0)
3763 : 18 __ __ CLC
3764 : 69 00 __ ADC #$00
3766 : 85 0d __ STA P0 
3768 : a9 6c __ LDA #$6c
376a : 69 00 __ ADC #$00
376c : 85 0e __ STA P1 
376e : 20 00 2f JSR $2f00 ; (strlen.s0 + 0)
3771 : a5 0d __ LDA P0 
3773 : 85 15 __ STA P8 
3775 : a5 0e __ LDA P1 
3777 : 85 16 __ STA P9 
3779 : a9 c4 __ LDA #$c4
377b : 85 17 __ STA P10 
377d : a5 1b __ LDA ACCU + 0 
377f : 85 49 __ STA T4 + 0 
3781 : 18 __ __ CLC
3782 : 65 47 __ ADC T1 + 0 
3784 : 85 43 __ STA T5 + 0 
3786 : a9 00 __ LDA #$00
3788 : 2a __ __ ROL
3789 : 85 44 __ STA T5 + 1 
378b : ad ce 6f LDA $6fce ; (vdc_state + 3)
378e : 38 __ __ SEC
378f : e9 01 __ SBC #$01
3791 : a8 __ __ TAY
3792 : ad cf 6f LDA $6fcf ; (vdc_state + 4)
3795 : e9 00 __ SBC #$00
3797 : c5 44 __ CMP T5 + 1 
3799 : d0 02 __ BNE $379d ; (menu_placebar.s1005 + 0)
.s1004:
379b : c4 43 __ CPY T5 + 0 
.s1005:
379d : 90 04 __ BCC $37a3 ; (menu_placebar.s5 + 0)
.s7:
379f : a5 47 __ LDA T1 + 0 
37a1 : b0 04 __ BCS $37a7 ; (menu_placebar.s1006 + 0)
.s5:
37a3 : 98 __ __ TYA
37a4 : 38 __ __ SEC
37a5 : e5 1b __ SBC ACCU + 0 
.s1006:
37a7 : 85 13 __ STA P6 
37a9 : 20 95 2e JSR $2e95 ; (vdc_prints_attr.s0 + 0)
37ac : a5 13 __ LDA P6 
37ae : a4 48 __ LDY T2 + 0 
37b0 : c8 __ __ INY
37b1 : 84 48 __ STY T2 + 0 
37b3 : 99 35 6c STA $6c35,y ; (menubar + 53)
37b6 : a5 49 __ LDA T4 + 0 
37b8 : 38 __ __ SEC
37b9 : 65 13 __ ADC P6 
37bb : 85 47 __ STA T1 + 0 
37bd : c0 06 __ CPY #$06
37bf : 90 9f __ BCC $3760 ; (menu_placebar.l2 + 0)
.s1001:
37c1 : 60 __ __ RTS
--------------------------------------------------------------------
37c2 : __ __ __ BYT 20 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d :  oSCAR64 vdc dEM
37d2 : __ __ __ BYT 4f 00                                           : O.
--------------------------------------------------------------------
vdcwin_viewport_init: ; vdcwin_viewport_init(struct VDCViewport*,u8,u8*,u16,u16,u16,u16,u8,u8)->void
.s0:
37d4 : a9 00 __ LDA #$00
37d6 : a0 07 __ LDY #$07
37d8 : 91 15 __ STA (P8),y ; (vp + 0)
37da : c8 __ __ INY
37db : 91 15 __ STA (P8),y ; (vp + 0)
37dd : c8 __ __ INY
37de : 91 15 __ STA (P8),y ; (vp + 0)
37e0 : c8 __ __ INY
37e1 : 91 15 __ STA (P8),y ; (vp + 0)
37e3 : a5 17 __ LDA P10 ; (sourcebank + 0)
37e5 : a0 00 __ LDY #$00
37e7 : 91 15 __ STA (P8),y ; (vp + 0)
37e9 : ad f2 bf LDA $bff2 ; (sstack + 0)
37ec : c8 __ __ INY
37ed : 91 15 __ STA (P8),y ; (vp + 0)
37ef : ad f3 bf LDA $bff3 ; (sstack + 1)
37f2 : c8 __ __ INY
37f3 : 91 15 __ STA (P8),y ; (vp + 0)
37f5 : ad f4 bf LDA $bff4 ; (sstack + 2)
37f8 : c8 __ __ INY
37f9 : 91 15 __ STA (P8),y ; (vp + 0)
37fb : ad f5 bf LDA $bff5 ; (sstack + 3)
37fe : c8 __ __ INY
37ff : 91 15 __ STA (P8),y ; (vp + 0)
3801 : ad f6 bf LDA $bff6 ; (sstack + 4)
3804 : c8 __ __ INY
3805 : 91 15 __ STA (P8),y ; (vp + 0)
3807 : ad f7 bf LDA $bff7 ; (sstack + 5)
380a : c8 __ __ INY
380b : 91 15 __ STA (P8),y ; (vp + 0)
380d : 18 __ __ CLC
380e : a5 15 __ LDA P8 ; (vp + 0)
3810 : 69 0b __ ADC #$0b
3812 : 85 0f __ STA P2 
3814 : a5 16 __ LDA P9 ; (vp + 1)
3816 : 69 00 __ ADC #$00
3818 : 85 10 __ STA P3 
381a : ad fc bf LDA $bffc ; (sstack + 10)
381d : 85 11 __ STA P4 
381f : ad fd bf LDA $bffd ; (sstack + 11)
3822 : 85 12 __ STA P5 
3824 : ad f8 bf LDA $bff8 ; (sstack + 6)
3827 : 85 13 __ STA P6 
3829 : ad fa bf LDA $bffa ; (sstack + 8)
382c : 85 14 __ STA P7 
382e : 4c bb 32 JMP $32bb ; (vdcwin_init.s0 + 0)
--------------------------------------------------------------------
3831 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 3a 20 25 53 00    : sCREENMODE: %S.
--------------------------------------------------------------------
3840 : __ __ __ BYT 73 45 4c 45 43 54 20 44 45 53 49 52 45 44 20 44 : sELECT DESIRED D
3850 : __ __ __ BYT 45 4d 4f 20 55 53 49 4e 47 20 43 55 52 53 4f 52 : EMO USING CURSOR
3860 : __ __ __ BYT 20 4b 45 59 53 20 41 4e 44 20 72 65 74 75 72 6e :  KEYS AND return
3870 : __ __ __ BYT 20 49 4e 20 4d 45 4e 55 2e 00                   :  IN MENU..
--------------------------------------------------------------------
387a : __ __ __ BYT 69 4e 20 53 43 52 4f 4c 4c 49 4e 47 20 44 45 4d : iN SCROLLING DEM
388a : __ __ __ BYT 4f 53 2c 20 50 52 45 53 53 20 77 61 73 64 20 4f : OS, PRESS wasd O
389a : __ __ __ BYT 52 20 43 55 52 53 4f 52 20 4b 45 59 53 20 54 4f : R CURSOR KEYS TO
38aa : __ __ __ BYT 20 4d 4f 56 45 2c 20 65 73 63 20 54 4f 20 45 58 :  MOVE, esc TO EX
38ba : __ __ __ BYT 49 54 2e 00                                     : IT..
--------------------------------------------------------------------
38be : __ __ __ BYT 69 4e 20 4f 54 48 45 52 20 44 45 4d 4f 53 2c 20 : iN OTHER DEMOS, 
38ce : __ __ __ BYT 50 52 45 53 53 20 41 20 4b 45 54 59 20 54 4f 20 : PRESS A KETY TO 
38de : __ __ __ BYT 43 4f 4e 54 49 4e 55 45 20 54 4f 20 4e 45 58 54 : CONTINUE TO NEXT
38ee : __ __ __ BYT 20 53 54 45 50 2e 00                            :  STEP..
--------------------------------------------------------------------
vdcwin_cpy_viewport: ; vdcwin_cpy_viewport(struct VDCViewport*)->void
.s0:
38f5 : a5 16 __ LDA P9 ; (viewport + 0)
38f7 : 85 44 __ STA T0 + 0 
38f9 : a5 17 __ LDA P10 ; (viewport + 1)
38fb : 85 45 __ STA T0 + 1 
38fd : a0 09 __ LDY #$09
38ff : b1 16 __ LDA (P9),y ; (viewport + 0)
3901 : 85 1b __ STA ACCU + 0 
3903 : c8 __ __ INY
3904 : b1 16 __ LDA (P9),y ; (viewport + 0)
3906 : 85 1c __ STA ACCU + 1 
3908 : a0 03 __ LDY #$03
390a : b1 16 __ LDA (P9),y ; (viewport + 0)
390c : 85 03 __ STA WORK + 0 
390e : c8 __ __ INY
390f : b1 16 __ LDA (P9),y ; (viewport + 0)
3911 : 85 04 __ STA WORK + 1 
3913 : 20 d2 67 JSR $67d2 ; (mul16 + 0)
3916 : a0 01 __ LDY #$01
3918 : b1 16 __ LDA (P9),y ; (viewport + 0)
391a : 18 __ __ CLC
391b : 65 05 __ ADC WORK + 2 
391d : aa __ __ TAX
391e : c8 __ __ INY
391f : b1 16 __ LDA (P9),y ; (viewport + 0)
3921 : 65 06 __ ADC WORK + 3 
3923 : 85 47 __ STA T1 + 1 
3925 : 8a __ __ TXA
3926 : 18 __ __ CLC
3927 : a0 07 __ LDY #$07
3929 : 71 16 __ ADC (P9),y ; (viewport + 0)
392b : 85 46 __ STA T1 + 0 
392d : a5 47 __ LDA T1 + 1 
392f : c8 __ __ INY
3930 : 71 16 __ ADC (P9),y ; (viewport + 0)
3932 : 85 47 __ STA T1 + 1 
3934 : a9 00 __ LDA #$00
3936 : 85 4a __ STA T3 + 0 
3938 : a0 11 __ LDY #$11
393a : b1 16 __ LDA (P9),y ; (viewport + 0)
393c : aa __ __ TAX
393d : c8 __ __ INY
393e : b1 16 __ LDA (P9),y ; (viewport + 0)
3940 : 4c 7c 39 JMP $397c ; (vdcwin_cpy_viewport.l1 + 0)
.s2:
3943 : 86 0f __ STX P2 
3945 : a5 46 __ LDA T1 + 0 
3947 : 85 12 __ STA P5 
3949 : a5 47 __ LDA T1 + 1 
394b : 85 13 __ STA P6 
394d : a0 00 __ LDY #$00
394f : 84 15 __ STY P8 
3951 : b1 44 __ LDA (T0 + 0),y 
3953 : 85 11 __ STA P4 
3955 : a0 0d __ LDY #$0d
3957 : b1 44 __ LDA (T0 + 0),y 
3959 : 85 14 __ STA P7 
395b : 20 ed 13 JSR $13ed ; (bnk_cpytovdc.s0 + 0)
395e : a5 46 __ LDA T1 + 0 
3960 : 18 __ __ CLC
3961 : a0 03 __ LDY #$03
3963 : 71 44 __ ADC (T0 + 0),y 
3965 : 85 46 __ STA T1 + 0 
3967 : a5 47 __ LDA T1 + 1 
3969 : c8 __ __ INY
396a : 71 44 __ ADC (T0 + 0),y 
396c : 85 47 __ STA T1 + 1 
396e : ad ce 6f LDA $6fce ; (vdc_state + 3)
3971 : 18 __ __ CLC
3972 : 65 0f __ ADC P2 
3974 : aa __ __ TAX
3975 : ad cf 6f LDA $6fcf ; (vdc_state + 4)
3978 : 65 10 __ ADC P3 
397a : e6 4a __ INC T3 + 0 
.l1:
397c : 85 10 __ STA P3 
397e : a5 4a __ LDA T3 + 0 
3980 : a0 0e __ LDY #$0e
3982 : d1 44 __ CMP (T0 + 0),y 
3984 : 90 bd __ BCC $3943 ; (vdcwin_cpy_viewport.s2 + 0)
.s4:
3986 : a0 03 __ LDY #$03
3988 : b1 44 __ LDA (T0 + 0),y 
398a : 85 46 __ STA T1 + 0 
398c : 85 03 __ STA WORK + 0 
398e : c8 __ __ INY
398f : b1 44 __ LDA (T0 + 0),y 
3991 : 85 47 __ STA T1 + 1 
3993 : 85 04 __ STA WORK + 1 
3995 : a0 09 __ LDY #$09
3997 : b1 44 __ LDA (T0 + 0),y 
3999 : 85 1b __ STA ACCU + 0 
399b : c8 __ __ INY
399c : b1 44 __ LDA (T0 + 0),y 
399e : 85 1c __ STA ACCU + 1 
39a0 : 20 d2 67 JSR $67d2 ; (mul16 + 0)
39a3 : a0 01 __ LDY #$01
39a5 : b1 44 __ LDA (T0 + 0),y 
39a7 : 18 __ __ CLC
39a8 : 65 05 __ ADC WORK + 2 
39aa : aa __ __ TAX
39ab : c8 __ __ INY
39ac : b1 44 __ LDA (T0 + 0),y 
39ae : 65 06 __ ADC WORK + 3 
39b0 : 85 49 __ STA T2 + 1 
39b2 : 8a __ __ TXA
39b3 : 18 __ __ CLC
39b4 : a0 07 __ LDY #$07
39b6 : 71 44 __ ADC (T0 + 0),y 
39b8 : 85 48 __ STA T2 + 0 
39ba : a5 49 __ LDA T2 + 1 
39bc : c8 __ __ INY
39bd : 71 44 __ ADC (T0 + 0),y 
39bf : 85 49 __ STA T2 + 1 
39c1 : a0 05 __ LDY #$05
39c3 : b1 44 __ LDA (T0 + 0),y 
39c5 : 85 1b __ STA ACCU + 0 
39c7 : c8 __ __ INY
39c8 : b1 44 __ LDA (T0 + 0),y 
39ca : 85 1c __ STA ACCU + 1 
39cc : a5 46 __ LDA T1 + 0 
39ce : 85 03 __ STA WORK + 0 
39d0 : a5 47 __ LDA T1 + 1 
39d2 : 85 04 __ STA WORK + 1 
39d4 : 20 d2 67 JSR $67d2 ; (mul16 + 0)
39d7 : 18 __ __ CLC
39d8 : a5 48 __ LDA T2 + 0 
39da : 65 05 __ ADC WORK + 2 
39dc : aa __ __ TAX
39dd : a5 49 __ LDA T2 + 1 
39df : 65 06 __ ADC WORK + 3 
39e1 : a8 __ __ TAY
39e2 : 8a __ __ TXA
39e3 : 18 __ __ CLC
39e4 : 69 30 __ ADC #$30
39e6 : 85 46 __ STA T1 + 0 
39e8 : 90 01 __ BCC $39eb ; (vdcwin_cpy_viewport.s1007 + 0)
.s1006:
39ea : c8 __ __ INY
.s1007:
39eb : 84 47 __ STY T1 + 1 
39ed : a9 00 __ LDA #$00
39ef : 85 4a __ STA T3 + 0 
39f1 : a0 13 __ LDY #$13
39f3 : b1 44 __ LDA (T0 + 0),y 
39f5 : aa __ __ TAX
39f6 : c8 __ __ INY
39f7 : b1 44 __ LDA (T0 + 0),y 
39f9 : 4c 35 3a JMP $3a35 ; (vdcwin_cpy_viewport.l5 + 0)
.s6:
39fc : 86 0f __ STX P2 
39fe : a5 46 __ LDA T1 + 0 
3a00 : 85 12 __ STA P5 
3a02 : a5 47 __ LDA T1 + 1 
3a04 : 85 13 __ STA P6 
3a06 : a0 00 __ LDY #$00
3a08 : 84 15 __ STY P8 
3a0a : b1 16 __ LDA (P9),y ; (viewport + 0)
3a0c : 85 11 __ STA P4 
3a0e : a0 0d __ LDY #$0d
3a10 : b1 16 __ LDA (P9),y ; (viewport + 0)
3a12 : 85 14 __ STA P7 
3a14 : 20 ed 13 JSR $13ed ; (bnk_cpytovdc.s0 + 0)
3a17 : a5 46 __ LDA T1 + 0 
3a19 : 18 __ __ CLC
3a1a : a0 03 __ LDY #$03
3a1c : 71 16 __ ADC (P9),y ; (viewport + 0)
3a1e : 85 46 __ STA T1 + 0 
3a20 : a5 47 __ LDA T1 + 1 
3a22 : c8 __ __ INY
3a23 : 71 16 __ ADC (P9),y ; (viewport + 0)
3a25 : 85 47 __ STA T1 + 1 
3a27 : ad ce 6f LDA $6fce ; (vdc_state + 3)
3a2a : 18 __ __ CLC
3a2b : 65 0f __ ADC P2 
3a2d : aa __ __ TAX
3a2e : ad cf 6f LDA $6fcf ; (vdc_state + 4)
3a31 : 65 10 __ ADC P3 
3a33 : e6 4a __ INC T3 + 0 
.l5:
3a35 : 85 10 __ STA P3 
3a37 : a5 4a __ LDA T3 + 0 
3a39 : a0 0e __ LDY #$0e
3a3b : d1 16 __ CMP (P9),y ; (viewport + 0)
3a3d : 90 bd __ BCC $39fc ; (vdcwin_cpy_viewport.s6 + 0)
.s1001:
3a3f : 60 __ __ RTS
--------------------------------------------------------------------
menu_main: ; menu_main()->u8
.s1000:
3a40 : a2 03 __ LDX #$03
3a42 : b5 53 __ LDA T0 + 0,x 
3a44 : 9d c1 bf STA $bfc1,x ; (bigfont + 178)
3a47 : ca __ __ DEX
3a48 : 10 f8 __ BPL $3a42 ; (menu_main.s1000 + 2)
.s0:
3a4a : ad 3c 6c LDA $6c3c ; (menubar + 60)
3a4d : 85 18 __ STA P11 
3a4f : 20 3e 37 JSR $373e ; (menu_placebar.s0 + 0)
.l84:
3a52 : a9 01 __ LDA #$01
3a54 : 85 53 __ STA T0 + 0 
.l3:
3a56 : a9 cf __ LDA #$cf
3a58 : 85 17 __ STA P10 
3a5a : a6 53 __ LDX T0 + 0 
3a5c : bd 35 6c LDA $6c35,x ; (menubar + 53)
3a5f : 85 13 __ STA P6 
3a61 : ad 3c 6c LDA $6c3c ; (menubar + 60)
3a64 : 85 14 __ STA P7 
3a66 : bd 91 6a LDA $6a91,x ; (__multab9L + 0)
3a69 : 18 __ __ CLC
3a6a : 69 f7 __ ADC #$f7
3a6c : 85 15 __ STA P8 
3a6e : a9 6b __ LDA #$6b
3a70 : 69 00 __ ADC #$00
3a72 : 85 16 __ STA P9 
3a74 : 20 95 2e JSR $2e95 ; (vdc_prints_attr.s0 + 0)
.l5:
3a77 : 20 80 35 JSR $3580 ; (vdcwin_getch.s0 + 0)
3a7a : a5 1b __ LDA ACCU + 0 
3a7c : 85 54 __ STA T1 + 0 
3a7e : c9 0d __ CMP #$0d
3a80 : d0 06 __ BNE $3a88 ; (menu_main.s1002 + 0)
.s1003:
3a82 : a9 00 __ LDA #$00
3a84 : 85 55 __ STA T3 + 0 
3a86 : f0 16 __ BEQ $3a9e ; (menu_main.s6 + 0)
.s1002:
3a88 : a9 01 __ LDA #$01
3a8a : 85 55 __ STA T3 + 0 
3a8c : a5 1b __ LDA ACCU + 0 
3a8e : c9 9d __ CMP #$9d
3a90 : f0 0c __ BEQ $3a9e ; (menu_main.s6 + 0)
.s9:
3a92 : c9 1d __ CMP #$1d
3a94 : f0 08 __ BEQ $3a9e ; (menu_main.s6 + 0)
.s8:
3a96 : c9 1b __ CMP #$1b
3a98 : f0 04 __ BEQ $3a9e ; (menu_main.s6 + 0)
.s7:
3a9a : c9 03 __ CMP #$03
3a9c : d0 d9 __ BNE $3a77 ; (menu_main.l5 + 0)
.s6:
3a9e : a9 c4 __ LDA #$c4
3aa0 : 85 17 __ STA P10 
3aa2 : a6 53 __ LDX T0 + 0 
3aa4 : bd 35 6c LDA $6c35,x ; (menubar + 53)
3aa7 : 85 13 __ STA P6 
3aa9 : ad 3c 6c LDA $6c3c ; (menubar + 60)
3aac : 85 56 __ STA T4 + 0 
3aae : 85 14 __ STA P7 
3ab0 : bd 91 6a LDA $6a91,x ; (__multab9L + 0)
3ab3 : 18 __ __ CLC
3ab4 : 69 f7 __ ADC #$f7
3ab6 : 85 15 __ STA P8 
3ab8 : a9 6b __ LDA #$6b
3aba : 69 00 __ ADC #$00
3abc : 85 16 __ STA P9 
3abe : 20 95 2e JSR $2e95 ; (vdc_prints_attr.s0 + 0)
3ac1 : a5 54 __ LDA T1 + 0 
3ac3 : c9 9d __ CMP #$9d
3ac5 : d0 03 __ BNE $3aca ; (menu_main.s12 + 0)
3ac7 : 4c 5d 3b JMP $3b5d ; (menu_main.s11 + 0)
.s12:
3aca : c9 1d __ CMP #$1d
3acc : d0 0c __ BNE $3ada ; (menu_main.s13 + 0)
.s17:
3ace : e6 53 __ INC T0 + 0 
3ad0 : a5 53 __ LDA T0 + 0 
3ad2 : c9 07 __ CMP #$07
3ad4 : 90 04 __ BCC $3ada ; (menu_main.s13 + 0)
.s20:
3ad6 : a9 01 __ LDA #$01
.s1039:
3ad8 : 85 53 __ STA T0 + 0 
.s13:
3ada : a5 55 __ LDA T3 + 0 
3adc : f0 0d __ BEQ $3aeb ; (menu_main.s4 + 0)
.s24:
3ade : a5 54 __ LDA T1 + 0 
3ae0 : c9 1b __ CMP #$1b
3ae2 : f0 11 __ BEQ $3af5 ; (menu_main.s26 + 0)
.s23:
3ae4 : c9 03 __ CMP #$03
3ae6 : f0 03 __ BEQ $3aeb ; (menu_main.s4 + 0)
3ae8 : 4c 56 3a JMP $3a56 ; (menu_main.l3 + 0)
.s4:
3aeb : a5 54 __ LDA T1 + 0 
3aed : c9 1b __ CMP #$1b
3aef : f0 04 __ BEQ $3af5 ; (menu_main.s26 + 0)
.s28:
3af1 : c9 03 __ CMP #$03
3af3 : d0 06 __ BNE $3afb ; (menu_main.s25 + 0)
.s26:
3af5 : a9 63 __ LDA #$63
3af7 : 85 55 __ STA T3 + 0 
3af9 : d0 4a __ BNE $3b45 ; (menu_main.s2 + 0)
.s25:
3afb : a9 01 __ LDA #$01
3afd : 8d fd bf STA $bffd ; (sstack + 11)
3b00 : a6 53 __ LDX T0 + 0 
3b02 : ca __ __ DEX
3b03 : 8e fc bf STX $bffc ; (sstack + 10)
3b06 : bd 36 6c LDA $6c36,x ; (menubar + 54)
3b09 : 8d fa bf STA $bffa ; (sstack + 8)
3b0c : a6 56 __ LDX T4 + 0 
3b0e : e8 __ __ INX
3b0f : 8e fb bf STX $bffb ; (sstack + 9)
3b12 : 20 69 3b JSR $3b69 ; (menu_pulldown.s1000 + 0)
3b15 : a5 1b __ LDA ACCU + 0 
3b17 : 85 55 __ STA T3 + 0 
3b19 : c9 12 __ CMP #$12
3b1b : d0 0e __ BNE $3b2b ; (menu_main.s31 + 0)
.s29:
3b1d : a9 00 __ LDA #$00
3b1f : 85 55 __ STA T3 + 0 
3b21 : c6 53 __ DEC T0 + 0 
3b23 : d0 06 __ BNE $3b2b ; (menu_main.s31 + 0)
.s32:
3b25 : a9 06 __ LDA #$06
3b27 : 85 53 __ STA T0 + 0 
3b29 : d0 13 __ BNE $3b3e ; (menu_main.s27 + 0)
.s31:
3b2b : c9 13 __ CMP #$13
3b2d : d0 0f __ BNE $3b3e ; (menu_main.s27 + 0)
.s35:
3b2f : e6 53 __ INC T0 + 0 
3b31 : a5 53 __ LDA T0 + 0 
3b33 : c9 07 __ CMP #$07
3b35 : 90 03 __ BCC $3b3a ; (menu_main.s63 + 0)
3b37 : 4c 52 3a JMP $3a52 ; (menu_main.l84 + 0)
.s63:
3b3a : a9 00 __ LDA #$00
3b3c : 85 55 __ STA T3 + 0 
.s27:
3b3e : a5 55 __ LDA T3 + 0 
3b40 : d0 03 __ BNE $3b45 ; (menu_main.s2 + 0)
3b42 : 4c 56 3a JMP $3a56 ; (menu_main.l3 + 0)
.s2:
3b45 : a5 53 __ LDA T0 + 0 
3b47 : 0a __ __ ASL
3b48 : 0a __ __ ASL
3b49 : 18 __ __ CLC
3b4a : 65 53 __ ADC T0 + 0 
3b4c : 0a __ __ ASL
3b4d : 18 __ __ CLC
3b4e : 65 55 __ ADC T3 + 0 
3b50 : 85 1b __ STA ACCU + 0 
.s1001:
3b52 : a2 03 __ LDX #$03
3b54 : bd c1 bf LDA $bfc1,x ; (bigfont + 178)
3b57 : 95 53 __ STA T0 + 0,x 
3b59 : ca __ __ DEX
3b5a : 10 f8 __ BPL $3b54 ; (menu_main.s1001 + 2)
3b5c : 60 __ __ RTS
.s11:
3b5d : c6 53 __ DEC T0 + 0 
3b5f : f0 03 __ BEQ $3b64 ; (menu_main.s14 + 0)
3b61 : 4c da 3a JMP $3ada ; (menu_main.s13 + 0)
.s14:
3b64 : a9 06 __ LDA #$06
3b66 : 4c d8 3a JMP $3ad8 ; (menu_main.s1039 + 0)
--------------------------------------------------------------------
menu_pulldown: ; menu_pulldown(u8,u8,u8,u8)->u8
.s1000:
3b69 : a2 0b __ LDX #$0b
3b6b : b5 53 __ LDA T0 + 0,x 
3b6d : 9d c6 bf STA $bfc6,x ; (bigfont + 183)
3b70 : ca __ __ DEX
3b71 : 10 f8 __ BPL $3b6b ; (menu_pulldown.s1000 + 2)
3b73 : 38 __ __ SEC
3b74 : a5 23 __ LDA SP + 0 ; (menunumber + 0)
3b76 : e9 0a __ SBC #$0a
3b78 : 85 23 __ STA SP + 0 ; (menunumber + 0)
3b7a : b0 02 __ BCS $3b7e ; (menu_pulldown.s0 + 0)
3b7c : c6 24 __ DEC SP + 1 ; (escapable + 0)
.s0:
3b7e : a9 3d __ LDA #$3d
3b80 : ae fc bf LDX $bffc ; (sstack + 10)
3b83 : 86 53 __ STX T0 + 0 
3b85 : 18 __ __ CLC
3b86 : 7d 98 6a ADC $6a98,x ; (__multab102L + 0)
3b89 : 85 55 __ STA T2 + 0 
3b8b : 85 0d __ STA P0 
3b8d : a9 6c __ LDA #$6c
3b8f : 7d a0 6a ADC $6aa0,x ; (__multab102H + 0)
3b92 : 85 56 __ STA T2 + 1 
3b94 : 85 0e __ STA P1 
3b96 : 20 00 2f JSR $2f00 ; (strlen.s0 + 0)
3b99 : a6 53 __ LDX T0 + 0 
3b9b : bd c4 6a LDA $6ac4,x ; (pulldown_options + 0)
3b9e : 85 58 __ STA T4 + 0 
3ba0 : 8d f9 bf STA $bff9 ; (sstack + 7)
3ba3 : e0 06 __ CPX #$06
3ba5 : 90 08 __ BCC $3baf ; (menu_pulldown.s77 + 0)
.s76:
3ba7 : a9 00 __ LDA #$00
3ba9 : 85 54 __ STA T1 + 0 
3bab : a9 f0 __ LDA #$f0
3bad : b0 06 __ BCS $3bb5 ; (menu_pulldown.s81 + 0)
.s77:
3baf : a9 01 __ LDA #$01
3bb1 : 85 54 __ STA T1 + 0 
3bb3 : a9 70 __ LDA #$70
.s81:
3bb5 : 8d f5 bf STA $bff5 ; (sstack + 3)
3bb8 : ad fa bf LDA $bffa ; (sstack + 8)
3bbb : 85 53 __ STA T0 + 0 
3bbd : 8d f6 bf STA $bff6 ; (sstack + 4)
3bc0 : ad fb bf LDA $bffb ; (sstack + 9)
3bc3 : 85 59 __ STA T5 + 0 
3bc5 : 8d f7 bf STA $bff7 ; (sstack + 5)
3bc8 : 18 __ __ CLC
3bc9 : a5 1b __ LDA ACCU + 0 
3bcb : 69 02 __ ADC #$02
3bcd : 8d f8 bf STA $bff8 ; (sstack + 6)
3bd0 : 20 dc 30 JSR $30dc ; (vdcwin_win_new.s1000 + 0)
3bd3 : a9 01 __ LDA #$01
3bd5 : 85 5a __ STA T6 + 0 
3bd7 : a5 58 __ LDA T4 + 0 
3bd9 : f0 60 __ BEQ $3c3b ; (menu_pulldown.l5 + 0)
.s58:
3bdb : a5 59 __ LDA T5 + 0 
3bdd : 85 57 __ STA T3 + 0 
3bdf : a9 00 __ LDA #$00
3be1 : 85 59 __ STA T5 + 0 
3be3 : 85 5b __ STA T8 + 0 
3be5 : 85 5c __ STA T8 + 1 
3be7 : 18 __ __ CLC
.l1050:
3be8 : a9 90 __ LDA #$90
3bea : a0 02 __ LDY #$02
3bec : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3bee : a9 71 __ LDA #$71
3bf0 : c8 __ __ INY
3bf1 : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3bf3 : a9 c7 __ LDA #$c7
3bf5 : c8 __ __ INY
3bf6 : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3bf8 : a9 3d __ LDA #$3d
3bfa : c8 __ __ INY
3bfb : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3bfd : a5 55 __ LDA T2 + 0 
3bff : 65 5b __ ADC T8 + 0 
3c01 : c8 __ __ INY
3c02 : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3c04 : a5 56 __ LDA T2 + 1 
3c06 : 65 5c __ ADC T8 + 1 
3c08 : c8 __ __ INY
3c09 : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3c0b : 20 78 2f JSR $2f78 ; (sprintf.s0 + 0)
3c0e : a5 53 __ LDA T0 + 0 
3c10 : 85 13 __ STA P6 
3c12 : a9 90 __ LDA #$90
3c14 : 85 15 __ STA P8 
3c16 : a9 71 __ LDA #$71
3c18 : 85 16 __ STA P9 
3c1a : a9 c6 __ LDA #$c6
3c1c : 85 17 __ STA P10 
3c1e : 18 __ __ CLC
3c1f : a5 59 __ LDA T5 + 0 
3c21 : 65 57 __ ADC T3 + 0 
3c23 : 85 14 __ STA P7 
3c25 : 20 95 2e JSR $2e95 ; (vdc_prints_attr.s0 + 0)
3c28 : 18 __ __ CLC
3c29 : a5 5b __ LDA T8 + 0 
3c2b : 69 11 __ ADC #$11
3c2d : 85 5b __ STA T8 + 0 
3c2f : 90 02 __ BCC $3c33 ; (menu_pulldown.s1053 + 0)
.s1052:
3c31 : e6 5c __ INC T8 + 1 
.s1053:
3c33 : e6 59 __ INC T5 + 0 
3c35 : a5 59 __ LDA T5 + 0 
3c37 : c5 58 __ CMP T4 + 0 
3c39 : 90 ad __ BCC $3be8 ; (menu_pulldown.l1050 + 0)
.l5:
3c3b : a9 2d __ LDA #$2d
3c3d : a0 06 __ LDY #$06
3c3f : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3c41 : a9 00 __ LDA #$00
3c43 : 85 1c __ STA ACCU + 1 
3c45 : c8 __ __ INY
3c46 : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3c48 : a9 90 __ LDA #$90
3c4a : a0 02 __ LDY #$02
3c4c : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3c4e : a9 71 __ LDA #$71
3c50 : c8 __ __ INY
3c51 : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3c53 : a9 cc __ LDA #$cc
3c55 : c8 __ __ INY
3c56 : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3c58 : a9 3d __ LDA #$3d
3c5a : c8 __ __ INY
3c5b : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3c5d : a5 5a __ LDA T6 + 0 
3c5f : 85 1b __ STA ACCU + 0 
3c61 : a9 11 __ LDA #$11
3c63 : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
3c66 : 38 __ __ SEC
3c67 : a5 05 __ LDA WORK + 2 
3c69 : e9 11 __ SBC #$11
3c6b : aa __ __ TAX
3c6c : a5 06 __ LDA WORK + 3 
3c6e : e9 00 __ SBC #$00
3c70 : 85 5e __ STA T9 + 1 
3c72 : 8a __ __ TXA
3c73 : 18 __ __ CLC
3c74 : 65 55 __ ADC T2 + 0 
3c76 : a0 08 __ LDY #$08
3c78 : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3c7a : a5 5e __ LDA T9 + 1 
3c7c : 65 56 __ ADC T2 + 1 
3c7e : c8 __ __ INY
3c7f : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3c81 : 20 78 2f JSR $2f78 ; (sprintf.s0 + 0)
3c84 : a9 90 __ LDA #$90
3c86 : 85 15 __ STA P8 
3c88 : a9 71 __ LDA #$71
3c8a : 85 16 __ STA P9 
3c8c : a9 cd __ LDA #$cd
3c8e : 85 17 __ STA P10 
3c90 : ad fa bf LDA $bffa ; (sstack + 8)
3c93 : 85 13 __ STA P6 
3c95 : ad fb bf LDA $bffb ; (sstack + 9)
3c98 : 85 57 __ STA T3 + 0 
3c9a : 18 __ __ CLC
3c9b : 65 5a __ ADC T6 + 0 
3c9d : 38 __ __ SEC
3c9e : e9 01 __ SBC #$01
3ca0 : 85 14 __ STA P7 
3ca2 : 20 95 2e JSR $2e95 ; (vdc_prints_attr.s0 + 0)
.l7:
3ca5 : 20 80 35 JSR $3580 ; (vdcwin_getch.s0 + 0)
3ca8 : a5 1b __ LDA ACCU + 0 
3caa : 85 5b __ STA T8 + 0 
3cac : c9 0d __ CMP #$0d
3cae : f0 18 __ BEQ $3cc8 ; (menu_pulldown.s8 + 0)
.s14:
3cb0 : c9 9d __ CMP #$9d
3cb2 : f0 14 __ BEQ $3cc8 ; (menu_pulldown.s8 + 0)
.s13:
3cb4 : c9 1d __ CMP #$1d
3cb6 : f0 10 __ BEQ $3cc8 ; (menu_pulldown.s8 + 0)
.s12:
3cb8 : c9 91 __ CMP #$91
3cba : f0 0c __ BEQ $3cc8 ; (menu_pulldown.s8 + 0)
.s11:
3cbc : c9 11 __ CMP #$11
3cbe : f0 08 __ BEQ $3cc8 ; (menu_pulldown.s8 + 0)
.s10:
3cc0 : c9 1b __ CMP #$1b
3cc2 : f0 04 __ BEQ $3cc8 ; (menu_pulldown.s8 + 0)
.s9:
3cc4 : c9 03 __ CMP #$03
3cc6 : d0 dd __ BNE $3ca5 ; (menu_pulldown.l7 + 0)
.s8:
3cc8 : a5 1b __ LDA ACCU + 0 
3cca : c9 1b __ CMP #$1b
3ccc : d0 03 __ BNE $3cd1 ; (menu_pulldown.s42 + 0)
3cce : 4c ae 3d JMP $3dae ; (menu_pulldown.s16 + 0)
.s42:
3cd1 : b0 03 __ BCS $3cd6 ; (menu_pulldown.s43 + 0)
3cd3 : 4c 9e 3d JMP $3d9e ; (menu_pulldown.s44 + 0)
.s43:
3cd6 : c9 91 __ CMP #$91
3cd8 : f0 43 __ BEQ $3d1d ; (menu_pulldown.s29 + 0)
.s50:
3cda : b0 2f __ BCS $3d0b ; (menu_pulldown.s51 + 0)
.s52:
3cdc : c9 1d __ CMP #$1d
3cde : f0 03 __ BEQ $3ce3 ; (menu_pulldown.s25 + 0)
3ce0 : 4c 3b 3c JMP $3c3b ; (menu_pulldown.l5 + 0)
.s25:
3ce3 : a5 54 __ LDA T1 + 0 
3ce5 : d0 03 __ BNE $3cea ; (menu_pulldown.s26 + 0)
3ce7 : 4c 3b 3c JMP $3c3b ; (menu_pulldown.l5 + 0)
.s26:
3cea : a9 13 __ LDA #$13
.s1049:
3cec : 85 5a __ STA T6 + 0 
.s6:
3cee : 20 8e 35 JSR $358e ; (vdcwin_win_free.s0 + 0)
3cf1 : a5 5a __ LDA T6 + 0 
3cf3 : 85 1b __ STA ACCU + 0 
.s1001:
3cf5 : 18 __ __ CLC
3cf6 : a5 23 __ LDA SP + 0 ; (menunumber + 0)
3cf8 : 69 0a __ ADC #$0a
3cfa : 85 23 __ STA SP + 0 ; (menunumber + 0)
3cfc : 90 02 __ BCC $3d00 ; (menu_pulldown.s1001 + 11)
3cfe : e6 24 __ INC SP + 1 ; (escapable + 0)
3d00 : a2 0b __ LDX #$0b
3d02 : bd c6 bf LDA $bfc6,x ; (bigfont + 183)
3d05 : 95 53 __ STA T0 + 0,x 
3d07 : ca __ __ DEX
3d08 : 10 f8 __ BPL $3d02 ; (menu_pulldown.s1001 + 13)
3d0a : 60 __ __ RTS
.s51:
3d0b : c9 9d __ CMP #$9d
3d0d : f0 03 __ BEQ $3d12 ; (menu_pulldown.s21 + 0)
3d0f : 4c 3b 3c JMP $3c3b ; (menu_pulldown.l5 + 0)
.s21:
3d12 : a5 54 __ LDA T1 + 0 
3d14 : d0 03 __ BNE $3d19 ; (menu_pulldown.s22 + 0)
3d16 : 4c 3b 3c JMP $3c3b ; (menu_pulldown.l5 + 0)
.s22:
3d19 : a9 12 __ LDA #$12
3d1b : d0 cf __ BNE $3cec ; (menu_pulldown.s1049 + 0)
.s29:
3d1d : a9 90 __ LDA #$90
3d1f : a0 02 __ LDY #$02
3d21 : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3d23 : a9 71 __ LDA #$71
3d25 : c8 __ __ INY
3d26 : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3d28 : a9 c7 __ LDA #$c7
3d2a : c8 __ __ INY
3d2b : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3d2d : a9 3d __ LDA #$3d
3d2f : c8 __ __ INY
3d30 : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3d32 : a5 5a __ LDA T6 + 0 
3d34 : 85 1b __ STA ACCU + 0 
3d36 : a9 00 __ LDA #$00
3d38 : 85 1c __ STA ACCU + 1 
3d3a : a9 11 __ LDA #$11
3d3c : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
3d3f : 38 __ __ SEC
3d40 : a5 05 __ LDA WORK + 2 
3d42 : e9 11 __ SBC #$11
3d44 : aa __ __ TAX
3d45 : a5 06 __ LDA WORK + 3 
3d47 : e9 00 __ SBC #$00
3d49 : 85 45 __ STA T11 + 1 
3d4b : 8a __ __ TXA
3d4c : 18 __ __ CLC
3d4d : 65 55 __ ADC T2 + 0 
3d4f : a0 06 __ LDY #$06
3d51 : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3d53 : a5 45 __ LDA T11 + 1 
3d55 : 65 56 __ ADC T2 + 1 
3d57 : c8 __ __ INY
3d58 : 91 23 __ STA (SP + 0),y ; (menunumber + 0)
3d5a : 20 78 2f JSR $2f78 ; (sprintf.s0 + 0)
3d5d : a9 90 __ LDA #$90
3d5f : 85 15 __ STA P8 
3d61 : a9 71 __ LDA #$71
3d63 : 85 16 __ STA P9 
3d65 : a9 c6 __ LDA #$c6
3d67 : 85 17 __ STA P10 
3d69 : ad fa bf LDA $bffa ; (sstack + 8)
3d6c : 85 13 __ STA P6 
3d6e : 18 __ __ CLC
3d6f : a5 5a __ LDA T6 + 0 
3d71 : 65 57 __ ADC T3 + 0 
3d73 : 38 __ __ SEC
3d74 : e9 01 __ SBC #$01
3d76 : 85 14 __ STA P7 
3d78 : 20 95 2e JSR $2e95 ; (vdc_prints_attr.s0 + 0)
3d7b : a5 5b __ LDA T8 + 0 
3d7d : c9 91 __ CMP #$91
3d7f : d0 0e __ BNE $3d8f ; (menu_pulldown.s31 + 0)
.s30:
3d81 : c6 5a __ DEC T6 + 0 
3d83 : f0 03 __ BEQ $3d88 ; (menu_pulldown.s33 + 0)
3d85 : 4c 3b 3c JMP $3c3b ; (menu_pulldown.l5 + 0)
.s33:
3d88 : a5 58 __ LDA T4 + 0 
.s1048:
3d8a : 85 5a __ STA T6 + 0 
3d8c : 4c 3b 3c JMP $3c3b ; (menu_pulldown.l5 + 0)
.s31:
3d8f : e6 5a __ INC T6 + 0 
3d91 : a5 58 __ LDA T4 + 0 
3d93 : c5 5a __ CMP T6 + 0 
3d95 : 90 03 __ BCC $3d9a ; (menu_pulldown.s36 + 0)
3d97 : 4c 3b 3c JMP $3c3b ; (menu_pulldown.l5 + 0)
.s36:
3d9a : a9 01 __ LDA #$01
3d9c : 90 ec __ BCC $3d8a ; (menu_pulldown.s1048 + 0)
.s44:
3d9e : c9 0d __ CMP #$0d
3da0 : d0 03 __ BNE $3da5 ; (menu_pulldown.s45 + 0)
3da2 : 4c ee 3c JMP $3cee ; (menu_pulldown.s6 + 0)
.s45:
3da5 : b0 16 __ BCS $3dbd ; (menu_pulldown.s46 + 0)
.s47:
3da7 : c9 03 __ CMP #$03
3da9 : f0 03 __ BEQ $3dae ; (menu_pulldown.s16 + 0)
3dab : 4c 3b 3c JMP $3c3b ; (menu_pulldown.l5 + 0)
.s16:
3dae : ad fd bf LDA $bffd ; (sstack + 11)
3db1 : c9 01 __ CMP #$01
3db3 : f0 03 __ BEQ $3db8 ; (menu_pulldown.s17 + 0)
3db5 : 4c 3b 3c JMP $3c3b ; (menu_pulldown.l5 + 0)
.s17:
3db8 : a9 00 __ LDA #$00
3dba : 4c ec 3c JMP $3cec ; (menu_pulldown.s1049 + 0)
.s46:
3dbd : c9 11 __ CMP #$11
3dbf : d0 03 __ BNE $3dc4 ; (menu_pulldown.s46 + 7)
3dc1 : 4c 1d 3d JMP $3d1d ; (menu_pulldown.s29 + 0)
3dc4 : 4c 3b 3c JMP $3c3b ; (menu_pulldown.l5 + 0)
--------------------------------------------------------------------
3dc7 : __ __ __ BYT 20 25 53 20 00                                  :  %S .
--------------------------------------------------------------------
3dcc : __ __ __ BYT 25 43 25 53 20 00                               : %C%S .
--------------------------------------------------------------------
settings_screenmode: ; settings_screenmode()->void
.s1000:
3dd2 : a5 53 __ LDA T0 + 0 
3dd4 : 8d c4 bf STA $bfc4 ; (bigfont + 181)
3dd7 : a5 54 __ LDA T2 + 0 
3dd9 : 8d c5 bf STA $bfc5 ; (bigfont + 182)
.s0:
3ddc : a9 f0 __ LDA #$f0
3dde : 8d f5 bf STA $bff5 ; (sstack + 3)
3de1 : a9 08 __ LDA #$08
3de3 : 8d f6 bf STA $bff6 ; (sstack + 4)
3de6 : 8d f7 bf STA $bff7 ; (sstack + 5)
3de9 : a9 1e __ LDA #$1e
3deb : 8d f8 bf STA $bff8 ; (sstack + 6)
3dee : a9 0a __ LDA #$0a
3df0 : 8d f9 bf STA $bff9 ; (sstack + 7)
3df3 : ad d2 6f LDA $6fd2 ; (vdc_state + 7)
3df6 : 85 53 __ STA T0 + 0 
3df8 : a9 8d __ LDA #$8d
3dfa : 8d d2 6f STA $6fd2 ; (vdc_state + 7)
3dfd : 20 dc 30 JSR $30dc ; (vdcwin_win_new.s1000 + 0)
3e00 : a9 0a __ LDA #$0a
3e02 : 85 18 __ STA P11 
3e04 : a9 09 __ LDA #$09
3e06 : 8d f2 bf STA $bff2 ; (sstack + 0)
3e09 : a9 4f __ LDA #$4f
3e0b : 8d f3 bf STA $bff3 ; (sstack + 1)
3e0e : a9 3e __ LDA #$3e
3e10 : 8d f4 bf STA $bff4 ; (sstack + 2)
3e13 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
3e16 : a9 19 __ LDA #$19
3e18 : 8d fa bf STA $bffa ; (sstack + 8)
3e1b : a9 0b __ LDA #$0b
3e1d : 8d fb bf STA $bffb ; (sstack + 9)
3e20 : a9 07 __ LDA #$07
3e22 : 8d fc bf STA $bffc ; (sstack + 10)
3e25 : a9 01 __ LDA #$01
3e27 : 8d fd bf STA $bffd ; (sstack + 11)
3e2a : 20 69 3b JSR $3b69 ; (menu_pulldown.s1000 + 0)
3e2d : a5 1b __ LDA ACCU + 0 
3e2f : 85 54 __ STA T2 + 0 
3e31 : 20 8e 35 JSR $358e ; (vdcwin_win_free.s0 + 0)
3e34 : a4 54 __ LDY T2 + 0 
3e36 : f0 07 __ BEQ $3e3f ; (settings_screenmode.s3 + 0)
.s1:
3e38 : 88 __ __ DEY
3e39 : 8c f6 bf STY $bff6 ; (sstack + 4)
3e3c : 20 52 2c JSR $2c52 ; (vdc_set_mode.s0 + 0)
.s3:
3e3f : a5 53 __ LDA T0 + 0 
3e41 : 8d d2 6f STA $6fd2 ; (vdc_state + 7)
.s1001:
3e44 : ad c4 bf LDA $bfc4 ; (bigfont + 181)
3e47 : 85 53 __ STA T0 + 0 
3e49 : ad c5 bf LDA $bfc5 ; (bigfont + 182)
3e4c : 85 54 __ STA T2 + 0 
3e4e : 60 __ __ RTS
--------------------------------------------------------------------
3e4f : __ __ __ BYT 73 45 4c 45 43 54 20 53 43 52 45 45 4e 20 4d 4f : sELECT SCREEN MO
3e5f : __ __ __ BYT 44 45 00                                        : DE.
--------------------------------------------------------------------
settings_versioninfo: ; settings_versioninfo()->void
.s1000:
3e62 : a5 53 __ LDA T0 + 0 
3e64 : 8d d3 bf STA $bfd3 ; (wrapbuffer + 59)
3e67 : 38 __ __ SEC
3e68 : a5 23 __ LDA SP + 0 
3e6a : e9 08 __ SBC #$08
3e6c : 85 23 __ STA SP + 0 
3e6e : b0 02 __ BCS $3e72 ; (settings_versioninfo.s0 + 0)
3e70 : c6 24 __ DEC SP + 1 
.s0:
3e72 : a9 f0 __ LDA #$f0
3e74 : 8d f5 bf STA $bff5 ; (sstack + 3)
3e77 : a9 05 __ LDA #$05
3e79 : 8d f6 bf STA $bff6 ; (sstack + 4)
3e7c : 8d f7 bf STA $bff7 ; (sstack + 5)
3e7f : a9 3c __ LDA #$3c
3e81 : 8d f8 bf STA $bff8 ; (sstack + 6)
3e84 : a9 0f __ LDA #$0f
3e86 : 8d f9 bf STA $bff9 ; (sstack + 7)
3e89 : ad d2 6f LDA $6fd2 ; (vdc_state + 7)
3e8c : 85 53 __ STA T0 + 0 
3e8e : a9 8d __ LDA #$8d
3e90 : 8d d2 6f STA $6fd2 ; (vdc_state + 7)
3e93 : 20 dc 30 JSR $30dc ; (vdcwin_win_new.s1000 + 0)
3e96 : a9 01 __ LDA #$01
3e98 : 20 82 3f JSR $3f82 ; (vdc_underline.s0 + 0)
3e9b : a9 06 __ LDA #$06
3e9d : 85 18 __ STA P11 
3e9f : 8d f2 bf STA $bff2 ; (sstack + 0)
3ea2 : a9 97 __ LDA #$97
3ea4 : 8d f3 bf STA $bff3 ; (sstack + 1)
3ea7 : a9 3f __ LDA #$3f
3ea9 : 8d f4 bf STA $bff4 ; (sstack + 2)
3eac : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
3eaf : a9 00 __ LDA #$00
3eb1 : 20 82 3f JSR $3f82 ; (vdc_underline.s0 + 0)
3eb4 : a9 08 __ LDA #$08
3eb6 : 8d f2 bf STA $bff2 ; (sstack + 0)
3eb9 : a9 b7 __ LDA #$b7
3ebb : 8d f3 bf STA $bff3 ; (sstack + 1)
3ebe : a9 3f __ LDA #$3f
3ec0 : 8d f4 bf STA $bff4 ; (sstack + 2)
3ec3 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
3ec6 : a9 09 __ LDA #$09
3ec8 : 8d f2 bf STA $bff2 ; (sstack + 0)
3ecb : a9 c8 __ LDA #$c8
3ecd : 8d f3 bf STA $bff3 ; (sstack + 1)
3ed0 : a9 3f __ LDA #$3f
3ed2 : 8d f4 bf STA $bff4 ; (sstack + 2)
3ed5 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
3ed8 : a9 90 __ LDA #$90
3eda : a0 02 __ LDY #$02
3edc : 91 23 __ STA (SP + 0),y 
3ede : a9 71 __ LDA #$71
3ee0 : c8 __ __ INY
3ee1 : 91 23 __ STA (SP + 0),y 
3ee3 : a9 e6 __ LDA #$e6
3ee5 : c8 __ __ INY
3ee6 : 91 23 __ STA (SP + 0),y 
3ee8 : a9 3f __ LDA #$3f
3eea : c8 __ __ INY
3eeb : 91 23 __ STA (SP + 0),y 
3eed : a9 00 __ LDA #$00
3eef : c8 __ __ INY
3ef0 : 91 23 __ STA (SP + 0),y 
3ef2 : a9 40 __ LDA #$40
3ef4 : c8 __ __ INY
3ef5 : 91 23 __ STA (SP + 0),y 
3ef7 : 20 78 2f JSR $2f78 ; (sprintf.s0 + 0)
3efa : a9 0a __ LDA #$0a
3efc : 8d f2 bf STA $bff2 ; (sstack + 0)
3eff : a9 90 __ LDA #$90
3f01 : 8d f3 bf STA $bff3 ; (sstack + 1)
3f04 : a9 71 __ LDA #$71
3f06 : 8d f4 bf STA $bff4 ; (sstack + 2)
3f09 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
3f0c : a9 0c __ LDA #$0c
3f0e : 8d f2 bf STA $bff2 ; (sstack + 0)
3f11 : a9 12 __ LDA #$12
3f13 : 8d f3 bf STA $bff3 ; (sstack + 1)
3f16 : a9 40 __ LDA #$40
3f18 : 8d f4 bf STA $bff4 ; (sstack + 2)
3f1b : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
3f1e : a9 0d __ LDA #$0d
3f20 : 8d f2 bf STA $bff2 ; (sstack + 0)
3f23 : a9 29 __ LDA #$29
3f25 : 8d f3 bf STA $bff3 ; (sstack + 1)
3f28 : a9 40 __ LDA #$40
3f2a : 8d f4 bf STA $bff4 ; (sstack + 2)
3f2d : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
3f30 : a9 0e __ LDA #$0e
3f32 : 8d f2 bf STA $bff2 ; (sstack + 0)
3f35 : a9 59 __ LDA #$59
3f37 : 8d f3 bf STA $bff3 ; (sstack + 1)
3f3a : a9 40 __ LDA #$40
3f3c : 8d f4 bf STA $bff4 ; (sstack + 2)
3f3f : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
3f42 : a9 10 __ LDA #$10
3f44 : 8d f2 bf STA $bff2 ; (sstack + 0)
3f47 : a9 80 __ LDA #$80
3f49 : 8d f3 bf STA $bff3 ; (sstack + 1)
3f4c : a9 40 __ LDA #$40
3f4e : 8d f4 bf STA $bff4 ; (sstack + 2)
3f51 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
3f54 : a9 12 __ LDA #$12
3f56 : 8d f2 bf STA $bff2 ; (sstack + 0)
3f59 : a9 9d __ LDA #$9d
3f5b : 8d f3 bf STA $bff3 ; (sstack + 1)
3f5e : a9 40 __ LDA #$40
3f60 : 8d f4 bf STA $bff4 ; (sstack + 2)
3f63 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
3f66 : 20 3b 2a JSR $2a3b ; (getch.s0 + 0)
3f69 : 20 8e 35 JSR $358e ; (vdcwin_win_free.s0 + 0)
3f6c : a5 53 __ LDA T0 + 0 
3f6e : 8d d2 6f STA $6fd2 ; (vdc_state + 7)
.s1001:
3f71 : 18 __ __ CLC
3f72 : a5 23 __ LDA SP + 0 
3f74 : 69 08 __ ADC #$08
3f76 : 85 23 __ STA SP + 0 
3f78 : 90 02 __ BCC $3f7c ; (settings_versioninfo.s1001 + 11)
3f7a : e6 24 __ INC SP + 1 
3f7c : ad d3 bf LDA $bfd3 ; (wrapbuffer + 59)
3f7f : 85 53 __ STA T0 + 0 
3f81 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_underline: ; vdc_underline(u8)->void
.s0:
3f82 : 09 00 __ ORA #$00
3f84 : d0 08 __ BNE $3f8e ; (vdc_underline.s1 + 0)
.s2:
3f86 : ad d2 6f LDA $6fd2 ; (vdc_state + 7)
3f89 : 29 df __ AND #$df
3f8b : 4c 93 3f JMP $3f93 ; (vdc_underline.s3 + 0)
.s1:
3f8e : ad d2 6f LDA $6fd2 ; (vdc_state + 7)
3f91 : 09 20 __ ORA #$20
.s3:
3f93 : 8d d2 6f STA $6fd2 ; (vdc_state + 7)
.s1001:
3f96 : 60 __ __ RTS
--------------------------------------------------------------------
3f97 : __ __ __ BYT 76 45 52 53 49 4f 4e 20 49 4e 46 4f 52 4d 41 54 : vERSION INFORMAT
3fa7 : __ __ __ BYT 49 4f 4e 20 41 4e 44 20 43 52 45 44 49 54 53 00 : ION AND CREDITS.
--------------------------------------------------------------------
3fb7 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d 4f : oSCAR64 vdc dEMO
3fc7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
3fc8 : __ __ __ BYT 77 52 49 54 54 45 4e 20 49 4e 20 32 30 32 34 20 : wRITTEN IN 2024 
3fd8 : __ __ __ BYT 42 59 20 78 41 4e 44 45 52 20 6d 4f 4c 00       : BY xANDER mOL.
--------------------------------------------------------------------
3fe6 : __ __ __ BYT 76 45 52 53 49 4f 4e 3a 20 25 53 00             : vERSION: %S.
--------------------------------------------------------------------
vdc_textcolor: ; vdc_textcolor(u8)->void
.s1000:
3ff2 : 85 0d __ STA P0 ; (color + 0)
.s0:
3ff4 : ad d2 6f LDA $6fd2 ; (vdc_state + 7)
3ff7 : 29 f0 __ AND #$f0
3ff9 : 18 __ __ CLC
3ffa : 65 0d __ ADC P0 ; (color + 0)
3ffc : 8d d2 6f STA $6fd2 ; (vdc_state + 7)
.s1001:
3fff : 60 __ __ RTS
--------------------------------------------------------------------
4000 : __ __ __ BYT 56 30 31 2d 32 30 32 34 30 32 31 37 2d 32 33 31 : V01-20240217-231
4010 : __ __ __ BYT 36 00                                           : 6.
--------------------------------------------------------------------
4012 : __ __ __ BYT 6d 55 53 49 43 20 42 59 20 6e 4f 52 44 49 53 43 : mUSIC BY nORDISC
4022 : __ __ __ BYT 48 53 4f 55 4e 44 00                            : HSOUND.
--------------------------------------------------------------------
4029 : __ __ __ BYT 66 55 4c 4c 20 53 4f 55 52 43 45 20 43 4f 44 45 : fULL SOURCE CODE
4039 : __ __ __ BYT 2c 20 44 4f 43 55 4d 45 4e 54 41 54 49 4f 4e 20 : , DOCUMENTATION 
4049 : __ __ __ BYT 41 4e 44 20 43 52 45 44 49 54 53 20 41 54 3a 00 : AND CREDITS AT:.
--------------------------------------------------------------------
4059 : __ __ __ BYT 48 54 54 50 53 3a 2f 2f 47 49 54 48 55 42 2e 43 : HTTPS://GITHUB.C
4069 : __ __ __ BYT 4f 4d 2f 58 41 48 4d 4f 4c 2f 6f 53 43 41 52 36 : OM/XAHMOL/oSCAR6
4079 : __ __ __ BYT 34 74 45 53 54 2f 00                            : 4tEST/.
--------------------------------------------------------------------
4080 : __ __ __ BYT 28 63 29 20 32 30 32 34 2c 20 69 64 52 45 41 4d : (c) 2024, idREAM
4090 : __ __ __ BYT 54 69 4e 38 62 49 54 53 2e 43 4f 4d 00          : TiN8bITS.COM.
--------------------------------------------------------------------
409d : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 54 4f 20 43 : pRESS A KEY TO C
40ad : __ __ __ BYT 4f 4e 54 49 4e 55 45 2e 00                      : ONTINUE..
--------------------------------------------------------------------
windows_windowstacking: ; windows_windowstacking()->void
.s1000:
40b6 : a5 53 __ LDA T0 + 0 
40b8 : 8d 3f bf STA $bf3f ; (bigfont + 48)
40bb : a5 54 __ LDA T4 + 0 
40bd : 8d 40 bf STA $bf40 ; (bigfont + 49)
.s0:
40c0 : ad 08 dc LDA $dc08 
40c3 : 18 __ __ CLC
40c4 : 6d 09 dc ADC $dc09 
40c7 : a8 __ __ TAY
40c8 : a9 00 __ LDA #$00
40ca : 85 53 __ STA T0 + 0 
40cc : 2a __ __ ROL
40cd : aa __ __ TAX
40ce : 98 __ __ TYA
40cf : 69 01 __ ADC #$01
40d1 : 8d cc 6a STA $6acc ; (seed + 0)
40d4 : 90 01 __ BCC $40d7 ; (windows_windowstacking.s1007 + 0)
.s1006:
40d6 : e8 __ __ INX
.s1007:
40d7 : 8e cd 6a STX $6acd ; (seed + 1)
.l1:
40da : a9 28 __ LDA #$28
40dc : 8d f8 bf STA $bff8 ; (sstack + 6)
40df : a5 53 __ LDA T0 + 0 
40e1 : 29 01 __ AND #$01
40e3 : 09 f0 __ ORA #$f0
40e5 : 8d f5 bf STA $bff5 ; (sstack + 3)
40e8 : a5 53 __ LDA T0 + 0 
40ea : 0a __ __ ASL
40eb : 0a __ __ ASL
40ec : 18 __ __ CLC
40ed : 65 53 __ ADC T0 + 0 
40ef : 18 __ __ CLC
40f0 : 69 05 __ ADC #$05
40f2 : 8d f6 bf STA $bff6 ; (sstack + 4)
40f5 : a5 53 __ LDA T0 + 0 
40f7 : 0a __ __ ASL
40f8 : 18 __ __ CLC
40f9 : 65 53 __ ADC T0 + 0 
40fb : 18 __ __ CLC
40fc : 69 05 __ ADC #$05
40fe : 8d f7 bf STA $bff7 ; (sstack + 5)
4101 : ad d0 6f LDA $6fd0 ; (vdc_state + 5)
4104 : 85 1b __ STA ACCU + 0 
4106 : ad d1 6f LDA $6fd1 ; (vdc_state + 6)
4109 : 85 1c __ STA ACCU + 1 
410b : a9 03 __ LDA #$03
410d : 85 03 __ STA WORK + 0 
410f : a9 00 __ LDA #$00
4111 : 85 04 __ STA WORK + 1 
4113 : 20 14 68 JSR $6814 ; (divmod + 0)
4116 : a5 1b __ LDA ACCU + 0 
4118 : 8d f9 bf STA $bff9 ; (sstack + 7)
411b : 20 dc 30 JSR $30dc ; (vdcwin_win_new.s1000 + 0)
411e : a9 64 __ LDA #$64
4120 : 85 54 __ STA T4 + 0 
.l4:
4122 : 20 47 42 JSR $4247 ; (rand.s0 + 0)
4125 : a9 0f __ LDA #$0f
4127 : 85 03 __ STA WORK + 0 
4129 : a9 00 __ LDA #$00
412b : 85 04 __ STA WORK + 1 
412d : 20 14 68 JSR $6814 ; (divmod + 0)
4130 : 18 __ __ CLC
4131 : a5 05 __ LDA WORK + 2 
4133 : 69 01 __ ADC #$01
4135 : 20 f2 3f JSR $3ff2 ; (vdc_textcolor.s1000 + 0)
4138 : a9 90 __ LDA #$90
413a : 8d f7 bf STA $bff7 ; (sstack + 5)
413d : a9 71 __ LDA #$71
413f : 8d f8 bf STA $bff8 ; (sstack + 6)
4142 : 20 6e 42 JSR $426e ; (generateSentence.s1000 + 0)
4145 : a9 90 __ LDA #$90
4147 : 8d fe bf STA $bffe ; (sstack + 12)
414a : a9 71 __ LDA #$71
414c : 8d ff bf STA $bfff ; (sstack + 13)
414f : ad c8 6f LDA $6fc8 ; (winCfg + 5)
4152 : 85 1b __ STA ACCU + 0 
4154 : a9 00 __ LDA #$00
4156 : 85 1c __ STA ACCU + 1 
4158 : a9 0d __ LDA #$0d
415a : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
415d : 18 __ __ CLC
415e : a9 b9 __ LDA #$b9
4160 : 65 05 __ ADC WORK + 2 
4162 : 8d fc bf STA $bffc ; (sstack + 10)
4165 : a9 70 __ LDA #$70
4167 : 69 00 __ ADC #$00
4169 : 8d fd bf STA $bffd ; (sstack + 11)
416c : 20 91 43 JSR $4391 ; (vdcwin_printwrap.s1000 + 0)
416f : ac c8 6f LDY $6fc8 ; (winCfg + 5)
4172 : be 8d 6a LDX $6a8d,y ; (__multab13L + 0)
4175 : bd bd 70 LDA $70bd,x 
4178 : f0 19 __ BEQ $4193 ; (windows_windowstacking.s51 + 0)
.s7:
417a : 86 43 __ STX T2 + 0 
417c : a9 20 __ LDA #$20
417e : 8d f9 bf STA $bff9 ; (sstack + 7)
4181 : 18 __ __ CLC
4182 : a9 b9 __ LDA #$b9
4184 : 65 43 __ ADC T2 + 0 
4186 : 8d f7 bf STA $bff7 ; (sstack + 5)
4189 : a9 70 __ LDA #$70
418b : 69 00 __ ADC #$00
418d : 8d f8 bf STA $bff8 ; (sstack + 6)
4190 : 20 bc 48 JSR $48bc ; (vdcwin_put_char.s1000 + 0)
.s51:
4193 : c6 54 __ DEC T4 + 0 
4195 : d0 8b __ BNE $4122 ; (windows_windowstacking.l4 + 0)
.s6:
4197 : 20 3b 2a JSR $2a3b ; (getch.s0 + 0)
419a : a9 0d __ LDA #$0d
419c : 20 f2 3f JSR $3ff2 ; (vdc_textcolor.s1000 + 0)
419f : e6 53 __ INC T0 + 0 
41a1 : ad c8 6f LDA $6fc8 ; (winCfg + 5)
41a4 : c9 03 __ CMP #$03
41a6 : b0 03 __ BCS $41ab ; (windows_windowstacking.l10 + 0)
41a8 : 4c da 40 JMP $40da ; (windows_windowstacking.l1 + 0)
.l10:
41ab : 20 8e 35 JSR $358e ; (vdcwin_win_free.s0 + 0)
41ae : a9 64 __ LDA #$64
41b0 : 85 53 __ STA T0 + 0 
.l13:
41b2 : 20 47 42 JSR $4247 ; (rand.s0 + 0)
41b5 : a9 0f __ LDA #$0f
41b7 : 85 03 __ STA WORK + 0 
41b9 : a9 00 __ LDA #$00
41bb : 85 04 __ STA WORK + 1 
41bd : 20 14 68 JSR $6814 ; (divmod + 0)
41c0 : 18 __ __ CLC
41c1 : a5 05 __ LDA WORK + 2 
41c3 : 69 01 __ ADC #$01
41c5 : 20 f2 3f JSR $3ff2 ; (vdc_textcolor.s1000 + 0)
41c8 : a9 90 __ LDA #$90
41ca : 8d f7 bf STA $bff7 ; (sstack + 5)
41cd : a9 71 __ LDA #$71
41cf : 8d f8 bf STA $bff8 ; (sstack + 6)
41d2 : 20 6e 42 JSR $426e ; (generateSentence.s1000 + 0)
41d5 : a9 90 __ LDA #$90
41d7 : 8d fe bf STA $bffe ; (sstack + 12)
41da : a9 71 __ LDA #$71
41dc : 8d ff bf STA $bfff ; (sstack + 13)
41df : ad c8 6f LDA $6fc8 ; (winCfg + 5)
41e2 : 85 1b __ STA ACCU + 0 
41e4 : a9 00 __ LDA #$00
41e6 : 85 1c __ STA ACCU + 1 
41e8 : a9 0d __ LDA #$0d
41ea : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
41ed : 18 __ __ CLC
41ee : a9 b9 __ LDA #$b9
41f0 : 65 05 __ ADC WORK + 2 
41f2 : 8d fc bf STA $bffc ; (sstack + 10)
41f5 : a9 70 __ LDA #$70
41f7 : 69 00 __ ADC #$00
41f9 : 8d fd bf STA $bffd ; (sstack + 11)
41fc : 20 91 43 JSR $4391 ; (vdcwin_printwrap.s1000 + 0)
41ff : ac c8 6f LDY $6fc8 ; (winCfg + 5)
4202 : be 8d 6a LDX $6a8d,y ; (__multab13L + 0)
4205 : bd bd 70 LDA $70bd,x 
4208 : f0 19 __ BEQ $4223 ; (windows_windowstacking.s52 + 0)
.s16:
420a : 86 43 __ STX T2 + 0 
420c : a9 20 __ LDA #$20
420e : 8d f9 bf STA $bff9 ; (sstack + 7)
4211 : 18 __ __ CLC
4212 : a9 b9 __ LDA #$b9
4214 : 65 43 __ ADC T2 + 0 
4216 : 8d f7 bf STA $bff7 ; (sstack + 5)
4219 : a9 70 __ LDA #$70
421b : 69 00 __ ADC #$00
421d : 8d f8 bf STA $bff8 ; (sstack + 6)
4220 : 20 bc 48 JSR $48bc ; (vdcwin_put_char.s1000 + 0)
.s52:
4223 : c6 53 __ DEC T0 + 0 
4225 : d0 8b __ BNE $41b2 ; (windows_windowstacking.l13 + 0)
.s15:
4227 : 20 3b 2a JSR $2a3b ; (getch.s0 + 0)
422a : a9 0d __ LDA #$0d
422c : 20 f2 3f JSR $3ff2 ; (vdc_textcolor.s1000 + 0)
422f : a9 01 __ LDA #$01
4231 : cd c8 6f CMP $6fc8 ; (winCfg + 5)
4234 : b0 03 __ BCS $4239 ; (windows_windowstacking.s11 + 0)
4236 : 4c ab 41 JMP $41ab ; (windows_windowstacking.l10 + 0)
.s11:
4239 : 20 8e 35 JSR $358e ; (vdcwin_win_free.s0 + 0)
.s1001:
423c : ad 3f bf LDA $bf3f ; (bigfont + 48)
423f : 85 53 __ STA T0 + 0 
4241 : ad 40 bf LDA $bf40 ; (bigfont + 49)
4244 : 85 54 __ STA T4 + 0 
4246 : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
.s0:
4247 : ad cd 6a LDA $6acd ; (seed + 1)
424a : 4a __ __ LSR
424b : ad cc 6a LDA $6acc ; (seed + 0)
424e : 6a __ __ ROR
424f : aa __ __ TAX
4250 : a9 00 __ LDA #$00
4252 : 6a __ __ ROR
4253 : 4d cc 6a EOR $6acc ; (seed + 0)
4256 : 85 1b __ STA ACCU + 0 
4258 : 8a __ __ TXA
4259 : 4d cd 6a EOR $6acd ; (seed + 1)
425c : 85 1c __ STA ACCU + 1 
425e : 4a __ __ LSR
425f : 45 1b __ EOR ACCU + 0 
4261 : 8d cc 6a STA $6acc ; (seed + 0)
4264 : 85 1b __ STA ACCU + 0 
4266 : 45 1c __ EOR ACCU + 1 
4268 : 8d cd 6a STA $6acd ; (seed + 1)
426b : 85 1c __ STA ACCU + 1 
.s1001:
426d : 60 __ __ RTS
--------------------------------------------------------------------
generateSentence: ; generateSentence(u8*)->void
.s1000:
426e : a2 03 __ LDX #$03
4270 : b5 53 __ LDA T1 + 0,x 
4272 : 9d 43 bf STA $bf43,x ; (bigfont + 52)
4275 : ca __ __ DEX
4276 : 10 f8 __ BPL $4270 ; (generateSentence.s1000 + 2)
4278 : 38 __ __ SEC
4279 : a5 23 __ LDA SP + 0 
427b : e9 0e __ SBC #$0e
427d : 85 23 __ STA SP + 0 
427f : b0 02 __ BCS $4283 ; (generateSentence.s0 + 0)
4281 : c6 24 __ DEC SP + 1 
.s0:
4283 : a2 08 __ LDX #$08
.l1002:
4285 : bd cd 6a LDA $6acd,x ; (seed + 1)
4288 : 9d cd bf STA $bfcd,x ; (bigfont + 190)
428b : ca __ __ DEX
428c : d0 f7 __ BNE $4285 ; (generateSentence.l1002 + 0)
.s1003:
428e : a2 4b __ LDX #$4b
.l1004:
4290 : bd 6c 6f LDA $6f6c,x ; (pulldown_titles + 815)
4293 : 9d 82 bf STA $bf82,x ; (bigfont + 115)
4296 : ca __ __ DEX
4297 : d0 f7 __ BNE $4290 ; (generateSentence.l1004 + 0)
.s1005:
4299 : a2 1e __ LDX #$1e
.l1006:
429b : bd d5 6a LDA $6ad5,x 
429e : 9d 64 bf STA $bf64,x ; (bigfont + 85)
42a1 : ca __ __ DEX
42a2 : d0 f7 __ BNE $429b ; (generateSentence.l1006 + 0)
.s1007:
42a4 : a2 1e __ LDX #$1e
.l1008:
42a6 : bd d7 6b LDA $6bd7,x ; (vdc_modes + 215)
42a9 : 9d 46 bf STA $bf46,x ; (bigfont + 55)
42ac : ca __ __ DEX
42ad : d0 f7 __ BNE $42a6 ; (generateSentence.l1008 + 0)
.s1009:
42af : 20 47 42 JSR $4247 ; (rand.s0 + 0)
42b2 : a5 1b __ LDA ACCU + 0 
42b4 : 85 50 __ STA T0 + 0 
42b6 : 20 47 42 JSR $4247 ; (rand.s0 + 0)
42b9 : a5 1b __ LDA ACCU + 0 
42bb : 85 53 __ STA T1 + 0 
42bd : a5 1c __ LDA ACCU + 1 
42bf : 85 54 __ STA T1 + 1 
42c1 : 20 47 42 JSR $4247 ; (rand.s0 + 0)
42c4 : a5 1b __ LDA ACCU + 0 
42c6 : 85 55 __ STA T2 + 0 
42c8 : a5 1c __ LDA ACCU + 1 
42ca : 85 56 __ STA T2 + 1 
42cc : 20 47 42 JSR $4247 ; (rand.s0 + 0)
42cf : ad f7 bf LDA $bff7 ; (sstack + 5)
42d2 : 85 45 __ STA T4 + 0 
42d4 : ad f8 bf LDA $bff8 ; (sstack + 6)
42d7 : 85 46 __ STA T4 + 1 
42d9 : a9 00 __ LDA #$00
42db : 85 04 __ STA WORK + 1 
42dd : a8 __ __ TAY
42de : 91 45 __ STA (T4 + 0),y 
42e0 : a5 45 __ LDA T4 + 0 
42e2 : a0 02 __ LDY #$02
42e4 : 91 23 __ STA (SP + 0),y 
42e6 : a5 46 __ LDA T4 + 1 
42e8 : c8 __ __ INY
42e9 : 91 23 __ STA (SP + 0),y 
42eb : a9 84 __ LDA #$84
42ed : c8 __ __ INY
42ee : 91 23 __ STA (SP + 0),y 
42f0 : a9 43 __ LDA #$43
42f2 : c8 __ __ INY
42f3 : 84 03 __ STY WORK + 0 
42f5 : 91 23 __ STA (SP + 0),y 
42f7 : a5 50 __ LDA T0 + 0 
42f9 : 29 01 __ AND #$01
42fb : 0a __ __ ASL
42fc : 0a __ __ ASL
42fd : 69 ce __ ADC #$ce
42ff : c8 __ __ INY
4300 : 91 23 __ STA (SP + 0),y 
4302 : a9 bf __ LDA #$bf
4304 : 69 00 __ ADC #$00
4306 : c8 __ __ INY
4307 : 91 23 __ STA (SP + 0),y 
4309 : 20 14 68 JSR $6814 ; (divmod + 0)
430c : a6 05 __ LDX WORK + 2 
430e : bd a8 6a LDA $6aa8,x ; (__multab6L + 0)
4311 : 18 __ __ CLC
4312 : 69 47 __ ADC #$47
4314 : a0 08 __ LDY #$08
4316 : 91 23 __ STA (SP + 0),y 
4318 : a9 bf __ LDA #$bf
431a : 69 00 __ ADC #$00
431c : c8 __ __ INY
431d : 91 23 __ STA (SP + 0),y 
431f : a5 53 __ LDA T1 + 0 
4321 : 85 1b __ STA ACCU + 0 
4323 : a5 54 __ LDA T1 + 1 
4325 : 85 1c __ STA ACCU + 1 
4327 : a9 05 __ LDA #$05
4329 : 85 03 __ STA WORK + 0 
432b : a9 00 __ LDA #$00
432d : 85 04 __ STA WORK + 1 
432f : 20 14 68 JSR $6814 ; (divmod + 0)
4332 : a6 05 __ LDX WORK + 2 
4334 : bd ad 6a LDA $6aad,x ; (__multab15L + 0)
4337 : 18 __ __ CLC
4338 : 69 83 __ ADC #$83
433a : a0 0a __ LDY #$0a
433c : 91 23 __ STA (SP + 0),y 
433e : a9 bf __ LDA #$bf
4340 : 69 00 __ ADC #$00
4342 : c8 __ __ INY
4343 : 91 23 __ STA (SP + 0),y 
4345 : a5 55 __ LDA T2 + 0 
4347 : 85 1b __ STA ACCU + 0 
4349 : a5 56 __ LDA T2 + 1 
434b : 85 1c __ STA ACCU + 1 
434d : a9 05 __ LDA #$05
434f : 85 03 __ STA WORK + 0 
4351 : a9 00 __ LDA #$00
4353 : 85 04 __ STA WORK + 1 
4355 : 20 14 68 JSR $6814 ; (divmod + 0)
4358 : a6 05 __ LDX WORK + 2 
435a : bd a8 6a LDA $6aa8,x ; (__multab6L + 0)
435d : 18 __ __ CLC
435e : 69 65 __ ADC #$65
4360 : a0 0c __ LDY #$0c
4362 : 91 23 __ STA (SP + 0),y 
4364 : a9 bf __ LDA #$bf
4366 : 69 00 __ ADC #$00
4368 : c8 __ __ INY
4369 : 91 23 __ STA (SP + 0),y 
436b : 20 78 2f JSR $2f78 ; (sprintf.s0 + 0)
.s1001:
436e : 18 __ __ CLC
436f : a5 23 __ LDA SP + 0 
4371 : 69 0e __ ADC #$0e
4373 : 85 23 __ STA SP + 0 
4375 : 90 02 __ BCC $4379 ; (generateSentence.s1001 + 11)
4377 : e6 24 __ INC SP + 1 
4379 : a2 03 __ LDX #$03
437b : bd 43 bf LDA $bf43,x ; (bigfont + 52)
437e : 95 53 __ STA T1 + 0,x 
4380 : ca __ __ DEX
4381 : 10 f8 __ BPL $437b ; (generateSentence.s1001 + 13)
4383 : 60 __ __ RTS
--------------------------------------------------------------------
4384 : __ __ __ BYT 25 53 20 25 53 20 25 53 20 25 53 2e 00          : %S %S %S %S..
--------------------------------------------------------------------
vdcwin_printwrap: ; vdcwin_printwrap(struct VDCWin*,const u8*)->void
.s1000:
4391 : a2 06 __ LDX #$06
4393 : b5 53 __ LDA T0 + 0,x 
4395 : 9d 90 bf STA $bf90,x ; (bigfont + 129)
4398 : ca __ __ DEX
4399 : 10 f8 __ BPL $4393 ; (vdcwin_printwrap.s1000 + 2)
439b : 38 __ __ SEC
439c : a5 23 __ LDA SP + 0 ; (win + 0)
439e : e9 06 __ SBC #$06
43a0 : 85 23 __ STA SP + 0 ; (win + 0)
43a2 : b0 02 __ BCS $43a6 ; (vdcwin_printwrap.s0 + 0)
43a4 : c6 24 __ DEC SP + 1 ; (win + 1)
.s0:
43a6 : ad fe bf LDA $bffe ; (sstack + 12)
43a9 : 85 0d __ STA P0 
43ab : ad ff bf LDA $bfff ; (sstack + 13)
43ae : 85 0e __ STA P1 
43b0 : 20 00 2f JSR $2f00 ; (strlen.s0 + 0)
43b3 : a5 1b __ LDA ACCU + 0 
43b5 : f0 3b __ BEQ $43f2 ; (vdcwin_printwrap.s1001 + 0)
.s30:
43b7 : 85 53 __ STA T0 + 0 
43b9 : a9 00 __ LDA #$00
43bb : 85 57 __ STA T3 + 0 
43bd : 85 45 __ STA T6 + 0 
43bf : a9 ff __ LDA #$ff
43c1 : 85 59 __ STA T4 + 1 
43c3 : 85 44 __ STA T5 + 1 
43c5 : ad fc bf LDA $bffc ; (sstack + 10)
43c8 : 85 55 __ STA T2 + 0 
43ca : ad fd bf LDA $bffd ; (sstack + 11)
43cd : 85 56 __ STA T2 + 1 
43cf : a0 02 __ LDY #$02
43d1 : b1 55 __ LDA (T2 + 0),y 
43d3 : 85 54 __ STA T1 + 0 
.l4:
43d5 : a5 57 __ LDA T3 + 0 
43d7 : c5 53 __ CMP T0 + 0 
43d9 : b0 0d __ BCS $43e8 ; (vdcwin_printwrap.s7 + 0)
.l9:
43db : 24 44 __ BIT T5 + 1 
43dd : 10 09 __ BPL $43e8 ; (vdcwin_printwrap.s7 + 0)
.s8:
43df : a5 45 __ LDA T6 + 0 
43e1 : c9 50 __ CMP #$50
43e3 : b0 03 __ BCS $43e8 ; (vdcwin_printwrap.s7 + 0)
43e5 : 4c e9 44 JMP $44e9 ; (vdcwin_printwrap.s6 + 0)
.s7:
43e8 : a6 45 __ LDX T6 + 0 
43ea : d0 1c __ BNE $4408 ; (vdcwin_printwrap.s19 + 0)
.s1:
43ec : a5 57 __ LDA T3 + 0 
43ee : c5 53 __ CMP T0 + 0 
43f0 : 90 e9 __ BCC $43db ; (vdcwin_printwrap.l9 + 0)
.s1001:
43f2 : 18 __ __ CLC
43f3 : a5 23 __ LDA SP + 0 ; (win + 0)
43f5 : 69 06 __ ADC #$06
43f7 : 85 23 __ STA SP + 0 ; (win + 0)
43f9 : 90 02 __ BCC $43fd ; (vdcwin_printwrap.s1001 + 11)
43fb : e6 24 __ INC SP + 1 ; (win + 1)
43fd : a2 06 __ LDX #$06
43ff : bd 90 bf LDA $bf90,x ; (bigfont + 129)
4402 : 95 53 __ STA T0 + 0,x 
4404 : ca __ __ DEX
4405 : 10 f8 __ BPL $43ff ; (vdcwin_printwrap.s1001 + 13)
4407 : 60 __ __ RTS
.s19:
4408 : a9 00 __ LDA #$00
440a : 9d 98 bf STA $bf98,x ; (bigfont + 137)
440d : a9 98 __ LDA #$98
440f : 85 0d __ STA P0 
4411 : a9 bf __ LDA #$bf
4413 : 85 0e __ STA P1 
4415 : 20 00 2f JSR $2f00 ; (strlen.s0 + 0)
4418 : ad fc bf LDA $bffc ; (sstack + 10)
441b : 85 58 __ STA T4 + 0 
441d : ad fd bf LDA $bffd ; (sstack + 11)
4420 : 85 59 __ STA T4 + 1 
.l22:
4422 : a0 02 __ LDY #$02
4424 : b1 58 __ LDA (T4 + 0),y 
4426 : c5 1b __ CMP ACCU + 0 
4428 : 90 54 __ BCC $447e ; (vdcwin_printwrap.s23 + 0)
.s24:
442a : a0 04 __ LDY #$04
442c : b1 58 __ LDA (T4 + 0),y 
442e : 18 __ __ CLC
442f : 65 1b __ ADC ACCU + 0 
4431 : b0 06 __ BCS $4439 ; (vdcwin_printwrap.s25 + 0)
.s1010:
4433 : c5 54 __ CMP T1 + 0 
4435 : 90 1a __ BCC $4451 ; (vdcwin_printwrap.s27 + 0)
.s1018:
4437 : f0 18 __ BEQ $4451 ; (vdcwin_printwrap.s27 + 0)
.s25:
4439 : a5 58 __ LDA T4 + 0 
443b : a0 02 __ LDY #$02
443d : 91 23 __ STA (SP + 0),y ; (win + 0)
443f : a5 59 __ LDA T4 + 1 
4441 : c8 __ __ INY
4442 : 91 23 __ STA (SP + 0),y ; (win + 0)
4444 : a9 ff __ LDA #$ff
4446 : c8 __ __ INY
4447 : 91 23 __ STA (SP + 0),y ; (win + 0)
4449 : a9 2a __ LDA #$2a
444b : c8 __ __ INY
444c : 91 23 __ STA (SP + 0),y ; (win + 0)
444e : 20 15 45 JSR $4515 ; (vdcwin_printline.s1000 + 0)
.s27:
4451 : ad fc bf LDA $bffc ; (sstack + 10)
4454 : a0 02 __ LDY #$02
4456 : 91 23 __ STA (SP + 0),y ; (win + 0)
4458 : ad fd bf LDA $bffd ; (sstack + 11)
445b : c8 __ __ INY
445c : 91 23 __ STA (SP + 0),y ; (win + 0)
445e : a9 98 __ LDA #$98
4460 : c8 __ __ INY
4461 : 91 23 __ STA (SP + 0),y ; (win + 0)
4463 : a9 bf __ LDA #$bf
4465 : c8 __ __ INY
4466 : 91 23 __ STA (SP + 0),y ; (win + 0)
4468 : 20 ca 45 JSR $45ca ; (vdcwin_put_string.s1000 + 0)
446b : a5 57 __ LDA T3 + 0 
446d : c5 53 __ CMP T0 + 0 
446f : b0 81 __ BCS $43f2 ; (vdcwin_printwrap.s1001 + 0)
.s49:
4471 : a9 00 __ LDA #$00
4473 : 85 45 __ STA T6 + 0 
4475 : a9 ff __ LDA #$ff
4477 : 85 44 __ STA T5 + 1 
4479 : 85 59 __ STA T4 + 1 
447b : 4c d5 43 JMP $43d5 ; (vdcwin_printwrap.l4 + 0)
.s23:
447e : a5 58 __ LDA T4 + 0 
4480 : 91 23 __ STA (SP + 0),y ; (win + 0)
4482 : a5 59 __ LDA T4 + 1 
4484 : c8 __ __ INY
4485 : 91 23 __ STA (SP + 0),y ; (win + 0)
4487 : a9 ff __ LDA #$ff
4489 : c8 __ __ INY
448a : 91 23 __ STA (SP + 0),y ; (win + 0)
448c : a9 2a __ LDA #$2a
448e : c8 __ __ INY
448f : 91 23 __ STA (SP + 0),y ; (win + 0)
4491 : 20 15 45 JSR $4515 ; (vdcwin_printline.s1000 + 0)
4494 : ad fc bf LDA $bffc ; (sstack + 10)
4497 : 85 55 __ STA T2 + 0 
4499 : 8d f7 bf STA $bff7 ; (sstack + 5)
449c : ad fd bf LDA $bffd ; (sstack + 11)
449f : 85 56 __ STA T2 + 1 
44a1 : 8d f8 bf STA $bff8 ; (sstack + 6)
44a4 : a0 02 __ LDY #$02
44a6 : b1 55 __ LDA (T2 + 0),y 
44a8 : 8d fb bf STA $bffb ; (sstack + 9)
44ab : a9 98 __ LDA #$98
44ad : 8d f9 bf STA $bff9 ; (sstack + 7)
44b0 : a9 bf __ LDA #$bf
44b2 : 8d fa bf STA $bffa ; (sstack + 8)
44b5 : 20 cf 47 JSR $47cf ; (vdcwin_put_chars.s1000 + 0)
44b8 : a9 98 __ LDA #$98
44ba : 85 0d __ STA P0 
44bc : a9 bf __ LDA #$bf
44be : 85 0e __ STA P1 
44c0 : ad fc bf LDA $bffc ; (sstack + 10)
44c3 : 85 43 __ STA T5 + 0 
44c5 : ad fd bf LDA $bffd ; (sstack + 11)
44c8 : 85 44 __ STA T5 + 1 
44ca : a0 02 __ LDY #$02
44cc : b1 43 __ LDA (T5 + 0),y 
44ce : 18 __ __ CLC
44cf : 69 98 __ ADC #$98
44d1 : 85 43 __ STA T5 + 0 
44d3 : a9 bf __ LDA #$bf
44d5 : 69 00 __ ADC #$00
44d7 : 85 44 __ STA T5 + 1 
44d9 : a0 ff __ LDY #$ff
.l1012:
44db : c8 __ __ INY
44dc : b1 43 __ LDA (T5 + 0),y 
44de : 99 98 bf STA $bf98,y ; (bigfont + 137)
44e1 : d0 f8 __ BNE $44db ; (vdcwin_printwrap.l1012 + 0)
.s1013:
44e3 : 20 00 2f JSR $2f00 ; (strlen.s0 + 0)
44e6 : 4c 22 44 JMP $4422 ; (vdcwin_printwrap.l22 + 0)
.s6:
44e9 : ad fe bf LDA $bffe ; (sstack + 12)
44ec : 85 49 __ STA T9 + 0 
44ee : ad ff bf LDA $bfff ; (sstack + 13)
44f1 : 85 4a __ STA T9 + 1 
44f3 : a4 57 __ LDY T3 + 0 
44f5 : b1 49 __ LDA (T9 + 0),y 
44f7 : a6 45 __ LDX T6 + 0 
44f9 : 9d 98 bf STA $bf98,x ; (bigfont + 137)
44fc : c9 20 __ CMP #$20
44fe : d0 06 __ BNE $4506 ; (vdcwin_printwrap.s10 + 0)
.s16:
4500 : a9 00 __ LDA #$00
4502 : 85 44 __ STA T5 + 1 
4504 : f0 08 __ BEQ $450e ; (vdcwin_printwrap.s53 + 0)
.s10:
4506 : 24 59 __ BIT T4 + 1 
4508 : 10 04 __ BPL $450e ; (vdcwin_printwrap.s53 + 0)
.s13:
450a : a9 00 __ LDA #$00
450c : 85 59 __ STA T4 + 1 
.s53:
450e : e6 57 __ INC T3 + 0 
4510 : e6 45 __ INC T6 + 0 
4512 : 4c d5 43 JMP $43d5 ; (vdcwin_printwrap.l4 + 0)
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
4515 : a5 53 __ LDA T0 + 0 
4517 : 8d ee bf STA $bfee ; (buffer + 12)
451a : a5 54 __ LDA T0 + 1 
451c : 8d ef bf STA $bfef ; (buffer + 13)
451f : a5 55 __ LDA T1 + 0 
4521 : 8d f0 bf STA $bff0 ; (buffer + 14)
4524 : 38 __ __ SEC
4525 : a5 23 __ LDA SP + 0 
4527 : e9 06 __ SBC #$06
4529 : 85 23 __ STA SP + 0 
452b : b0 02 __ BCS $452f ; (vdcwin_printline.s0 + 0)
452d : c6 24 __ DEC SP + 1 
.s0:
452f : a0 08 __ LDY #$08
4531 : b1 23 __ LDA (SP + 0),y 
4533 : 85 53 __ STA T0 + 0 
4535 : a0 02 __ LDY #$02
4537 : 91 23 __ STA (SP + 0),y 
4539 : a0 09 __ LDY #$09
453b : b1 23 __ LDA (SP + 0),y 
453d : 85 54 __ STA T0 + 1 
453f : a0 03 __ LDY #$03
4541 : 91 23 __ STA (SP + 0),y 
4543 : a0 0a __ LDY #$0a
4545 : b1 23 __ LDA (SP + 0),y 
4547 : a0 04 __ LDY #$04
4549 : 91 23 __ STA (SP + 0),y 
454b : a0 0b __ LDY #$0b
454d : b1 23 __ LDA (SP + 0),y 
454f : a0 05 __ LDY #$05
4551 : 91 23 __ STA (SP + 0),y 
4553 : 20 ca 45 JSR $45ca ; (vdcwin_put_string.s1000 + 0)
4556 : a9 00 __ LDA #$00
4558 : a0 04 __ LDY #$04
455a : 91 53 __ STA (T0 + 0),y 
455c : 88 __ __ DEY
455d : b1 53 __ LDA (T0 + 0),y 
455f : 85 55 __ STA T1 + 0 
4561 : 38 __ __ SEC
4562 : e9 01 __ SBC #$01
4564 : 85 44 __ STA T3 + 0 
4566 : a0 05 __ LDY #$05
4568 : b1 53 __ LDA (T0 + 0),y 
456a : 90 0b __ BCC $4577 ; (vdcwin_printline.s2 + 0)
.s1002:
456c : aa __ __ TAX
456d : e4 44 __ CPX T3 + 0 
456f : b0 06 __ BCS $4577 ; (vdcwin_printline.s2 + 0)
.s1:
4571 : e8 __ __ INX
4572 : 8a __ __ TXA
4573 : 91 53 __ STA (T0 + 0),y 
4575 : 90 38 __ BCC $45af ; (vdcwin_printline.s1001 + 0)
.s2:
4577 : a5 53 __ LDA T0 + 0 
4579 : 8d f4 bf STA $bff4 ; (sstack + 2)
457c : a5 54 __ LDA T0 + 1 
457e : 8d f5 bf STA $bff5 ; (sstack + 3)
4581 : a9 01 __ LDA #$01
4583 : 8d f6 bf STA $bff6 ; (sstack + 4)
4586 : 20 a0 46 JSR $46a0 ; (vdcwin_scroll_up.s0 + 0)
4589 : a9 20 __ LDA #$20
458b : 8d f3 bf STA $bff3 ; (sstack + 1)
458e : a9 01 __ LDA #$01
4590 : 8d f5 bf STA $bff5 ; (sstack + 3)
4593 : a0 00 __ LDY #$00
4595 : b1 53 __ LDA (T0 + 0),y 
4597 : 85 18 __ STA P11 
4599 : a0 02 __ LDY #$02
459b : b1 53 __ LDA (T0 + 0),y 
459d : 8d f4 bf STA $bff4 ; (sstack + 2)
45a0 : 88 __ __ DEY
45a1 : b1 53 __ LDA (T0 + 0),y 
45a3 : 18 __ __ CLC
45a4 : 65 55 __ ADC T1 + 0 
45a6 : 38 __ __ SEC
45a7 : e9 01 __ SBC #$01
45a9 : 8d f2 bf STA $bff2 ; (sstack + 0)
45ac : 20 ed 21 JSR $21ed ; (vdc_clear.s0 + 0)
.s1001:
45af : 18 __ __ CLC
45b0 : a5 23 __ LDA SP + 0 
45b2 : 69 06 __ ADC #$06
45b4 : 85 23 __ STA SP + 0 
45b6 : 90 02 __ BCC $45ba ; (vdcwin_printline.s1001 + 11)
45b8 : e6 24 __ INC SP + 1 
45ba : ad ee bf LDA $bfee ; (buffer + 12)
45bd : 85 53 __ STA T0 + 0 
45bf : ad ef bf LDA $bfef ; (buffer + 13)
45c2 : 85 54 __ STA T0 + 1 
45c4 : ad f0 bf LDA $bff0 ; (buffer + 14)
45c7 : 85 55 __ STA T1 + 0 
45c9 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->u8
.s1000:
45ca : 38 __ __ SEC
45cb : a5 23 __ LDA SP + 0 
45cd : e9 0c __ SBC #$0c
45cf : 85 23 __ STA SP + 0 
45d1 : b0 02 __ BCS $45d5 ; (vdcwin_put_string.s1000 + 11)
45d3 : c6 24 __ DEC SP + 1 
45d5 : a0 06 __ LDY #$06
45d7 : a5 53 __ LDA T1 + 0 
45d9 : 91 23 __ STA (SP + 0),y 
.s0:
45db : a0 0e __ LDY #$0e
45dd : b1 23 __ LDA (SP + 0),y 
45df : 85 14 __ STA P7 
45e1 : c8 __ __ INY
45e2 : b1 23 __ LDA (SP + 0),y 
45e4 : 85 15 __ STA P8 
45e6 : a0 04 __ LDY #$04
45e8 : b1 14 __ LDA (P7),y 
45ea : 85 16 __ STA P9 
45ec : c8 __ __ INY
45ed : b1 14 __ LDA (P7),y 
45ef : 85 17 __ STA P10 
45f1 : a0 10 __ LDY #$10
45f3 : b1 23 __ LDA (SP + 0),y 
45f5 : 8d f2 bf STA $bff2 ; (sstack + 0)
45f8 : c8 __ __ INY
45f9 : b1 23 __ LDA (SP + 0),y 
45fb : 8d f3 bf STA $bff3 ; (sstack + 1)
45fe : 20 5b 46 JSR $465b ; (vdcwin_putat_string.s0 + 0)
4601 : 18 __ __ CLC
4602 : a5 1b __ LDA ACCU + 0 
4604 : 65 16 __ ADC P9 
4606 : a0 04 __ LDY #$04
4608 : 91 14 __ STA (P7),y 
460a : a0 02 __ LDY #$02
460c : d1 14 __ CMP (P7),y 
460e : 90 39 __ BCC $4649 ; (vdcwin_put_string.s1001 + 0)
.s1:
4610 : a9 00 __ LDA #$00
4612 : a0 04 __ LDY #$04
4614 : 91 14 __ STA (P7),y 
4616 : a5 17 __ LDA P10 
4618 : 69 00 __ ADC #$00
461a : c8 __ __ INY
461b : 91 14 __ STA (P7),y 
461d : a0 03 __ LDY #$03
461f : d1 14 __ CMP (P7),y 
4621 : d0 26 __ BNE $4649 ; (vdcwin_put_string.s1001 + 0)
.s4:
4623 : a5 1b __ LDA ACCU + 0 
4625 : 85 53 __ STA T1 + 0 
4627 : a5 17 __ LDA P10 
4629 : a0 05 __ LDY #$05
462b : 91 14 __ STA (P7),y 
462d : a5 14 __ LDA P7 
462f : a0 02 __ LDY #$02
4631 : 91 23 __ STA (SP + 0),y 
4633 : a5 15 __ LDA P8 
4635 : c8 __ __ INY
4636 : 91 23 __ STA (SP + 0),y 
4638 : a9 ff __ LDA #$ff
463a : c8 __ __ INY
463b : 91 23 __ STA (SP + 0),y 
463d : a9 2a __ LDA #$2a
463f : c8 __ __ INY
4640 : 91 23 __ STA (SP + 0),y 
4642 : 20 15 45 JSR $4515 ; (vdcwin_printline.s1000 + 0)
4645 : a5 53 __ LDA T1 + 0 
4647 : 85 1b __ STA ACCU + 0 
.s1001:
4649 : a0 06 __ LDY #$06
464b : b1 23 __ LDA (SP + 0),y 
464d : 85 53 __ STA T1 + 0 
464f : 18 __ __ CLC
4650 : a5 23 __ LDA SP + 0 
4652 : 69 0c __ ADC #$0c
4654 : 85 23 __ STA SP + 0 
4656 : 90 02 __ BCC $465a ; (vdcwin_put_string.s1001 + 17)
4658 : e6 24 __ INC SP + 1 
465a : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_string: ; vdcwin_putat_string(struct VDCWin*,u8,u8,const u8*)->u8
.s0:
465b : a9 00 __ LDA #$00
465d : 85 45 __ STA T0 + 0 
465f : ad f2 bf LDA $bff2 ; (sstack + 0)
4662 : 85 46 __ STA T1 + 0 
4664 : ad f3 bf LDA $bff3 ; (sstack + 1)
4667 : 85 47 __ STA T1 + 1 
4669 : 4c 97 46 JMP $4697 ; (vdcwin_putat_string.l1 + 0)
.s2:
466c : 4a __ __ LSR
466d : 4a __ __ LSR
466e : 4a __ __ LSR
466f : 4a __ __ LSR
4670 : 4a __ __ LSR
4671 : aa __ __ TAX
4672 : bd f4 6a LDA $6af4,x ; (p2smap + 0)
4675 : 51 46 __ EOR (T1 + 0),y 
4677 : 85 12 __ STA P5 
4679 : a5 16 __ LDA P9 ; (x + 0)
467b : 18 __ __ CLC
467c : a0 00 __ LDY #$00
467e : 71 14 __ ADC (P7),y ; (win + 0)
4680 : 18 __ __ CLC
4681 : 65 45 __ ADC T0 + 0 
4683 : 85 10 __ STA P3 
4685 : a5 17 __ LDA P10 ; (y + 0)
4687 : 18 __ __ CLC
4688 : c8 __ __ INY
4689 : 71 14 __ ADC (P7),y ; (win + 0)
468b : 85 11 __ STA P4 
468d : ad d2 6f LDA $6fd2 ; (vdc_state + 7)
4690 : 85 13 __ STA P6 
4692 : 20 1b 35 JSR $351b ; (vdc_printc.s0 + 0)
4695 : e6 45 __ INC T0 + 0 
.l1:
4697 : a4 45 __ LDY T0 + 0 
4699 : b1 46 __ LDA (T1 + 0),y 
469b : d0 cf __ BNE $466c ; (vdcwin_putat_string.s2 + 0)
.s3:
469d : 84 1b __ STY ACCU + 0 
.s1001:
469f : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_up: ; vdcwin_scroll_up(struct VDCWin*,u8)->void
.s0:
46a0 : ad ce 6f LDA $6fce ; (vdc_state + 3)
46a3 : 85 1b __ STA ACCU + 0 ; (win + 0)
46a5 : ad cf 6f LDA $6fcf ; (vdc_state + 4)
46a8 : 85 1c __ STA ACCU + 1 ; (win + 1)
46aa : ad f6 bf LDA $bff6 ; (sstack + 4)
46ad : 85 46 __ STA T1 + 0 
46af : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
46b2 : a5 05 __ LDA WORK + 2 
46b4 : 85 47 __ STA T2 + 0 
46b6 : a5 06 __ LDA WORK + 3 
46b8 : 85 48 __ STA T2 + 1 
46ba : a9 00 __ LDA #$00
46bc : 85 45 __ STA T0 + 0 
46be : ad f4 bf LDA $bff4 ; (sstack + 2)
46c1 : 85 49 __ STA T3 + 0 
46c3 : ad f5 bf LDA $bff5 ; (sstack + 3)
46c6 : 85 4a __ STA T3 + 1 
46c8 : a0 02 __ LDY #$02
46ca : b1 49 __ LDA (T3 + 0),y 
46cc : 85 4b __ STA T4 + 0 
46ce : a0 06 __ LDY #$06
46d0 : b1 49 __ LDA (T3 + 0),y 
46d2 : 85 4c __ STA T5 + 0 
46d4 : c8 __ __ INY
46d5 : b1 49 __ LDA (T3 + 0),y 
46d7 : 85 4d __ STA T5 + 1 
46d9 : c8 __ __ INY
46da : b1 49 __ LDA (T3 + 0),y 
46dc : 85 4e __ STA T6 + 0 
46de : c8 __ __ INY
46df : b1 49 __ LDA (T3 + 0),y 
46e1 : 4c 3e 47 JMP $473e ; (vdcwin_scroll_up.l1 + 0)
.s2:
46e4 : a5 4c __ LDA T5 + 0 
46e6 : 85 14 __ STA P7 
46e8 : 18 __ __ CLC
46e9 : 65 47 __ ADC T2 + 0 
46eb : 85 16 __ STA P9 
46ed : a5 4d __ LDA T5 + 1 
46ef : 85 15 __ STA P8 
46f1 : 65 48 __ ADC T2 + 1 
46f3 : 85 17 __ STA P10 
46f5 : a5 4b __ LDA T4 + 0 
46f7 : 8d f2 bf STA $bff2 ; (sstack + 0)
46fa : a9 00 __ LDA #$00
46fc : 8d f3 bf STA $bff3 ; (sstack + 1)
46ff : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
4702 : a5 4e __ LDA T6 + 0 
4704 : 85 14 __ STA P7 
4706 : 18 __ __ CLC
4707 : 65 47 __ ADC T2 + 0 
4709 : 85 16 __ STA P9 
470b : a5 4f __ LDA T6 + 1 
470d : 85 15 __ STA P8 
470f : 65 48 __ ADC T2 + 1 
4711 : 85 17 __ STA P10 
4713 : a5 4b __ LDA T4 + 0 
4715 : 8d f2 bf STA $bff2 ; (sstack + 0)
4718 : a9 00 __ LDA #$00
471a : 8d f3 bf STA $bff3 ; (sstack + 1)
471d : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
4720 : ad ce 6f LDA $6fce ; (vdc_state + 3)
4723 : 18 __ __ CLC
4724 : 65 4c __ ADC T5 + 0 
4726 : 85 4c __ STA T5 + 0 
4728 : ad cf 6f LDA $6fcf ; (vdc_state + 4)
472b : 65 4d __ ADC T5 + 1 
472d : 85 4d __ STA T5 + 1 
472f : 18 __ __ CLC
4730 : a5 14 __ LDA P7 
4732 : 6d ce 6f ADC $6fce ; (vdc_state + 3)
4735 : 85 4e __ STA T6 + 0 
4737 : a5 4f __ LDA T6 + 1 
4739 : 6d cf 6f ADC $6fcf ; (vdc_state + 4)
473c : e6 45 __ INC T0 + 0 
.l1:
473e : 85 4f __ STA T6 + 1 
4740 : a0 03 __ LDY #$03
4742 : b1 49 __ LDA (T3 + 0),y 
4744 : 38 __ __ SEC
4745 : e5 46 __ SBC T1 + 0 
4747 : 90 9b __ BCC $46e4 ; (vdcwin_scroll_up.s2 + 0)
.s1002:
4749 : c5 45 __ CMP T0 + 0 
474b : 90 02 __ BCC $474f ; (vdcwin_scroll_up.s1001 + 0)
.s1004:
474d : d0 95 __ BNE $46e4 ; (vdcwin_scroll_up.s2 + 0)
.s1001:
474f : 60 __ __ RTS
--------------------------------------------------------------------
vdc_block_copy: ; vdc_block_copy(u16,u16,u16)->void
.s0:
4750 : ad f2 bf LDA $bff2 ; (sstack + 0)
4753 : 85 44 __ STA T1 + 0 
4755 : ad f3 bf LDA $bff3 ; (sstack + 1)
4758 : f0 21 __ BEQ $477b ; (vdc_block_copy.s4 + 0)
.s2:
475a : 85 43 __ STA T0 + 0 
475c : a9 ff __ LDA #$ff
475e : 85 13 __ STA P6 
4760 : a5 14 __ LDA P7 ; (dest + 0)
4762 : 85 0f __ STA P2 
4764 : a5 16 __ LDA P9 ; (src + 0)
4766 : 85 11 __ STA P4 
.l1002:
4768 : a5 15 __ LDA P8 ; (dest + 1)
476a : 85 10 __ STA P3 
476c : a5 17 __ LDA P10 ; (src + 1)
476e : 85 12 __ STA P5 
4770 : 20 92 47 JSR $4792 ; (vdc_block_copy_page.s0 + 0)
4773 : e6 15 __ INC P8 ; (dest + 1)
4775 : e6 17 __ INC P10 ; (src + 1)
4777 : c6 43 __ DEC T0 + 0 
4779 : d0 ed __ BNE $4768 ; (vdc_block_copy.l1002 + 0)
.s4:
477b : a5 44 __ LDA T1 + 0 
477d : 85 13 __ STA P6 
477f : a5 14 __ LDA P7 ; (dest + 0)
4781 : 85 0f __ STA P2 
4783 : a5 15 __ LDA P8 ; (dest + 1)
4785 : 85 10 __ STA P3 
4787 : a5 16 __ LDA P9 ; (src + 0)
4789 : 85 11 __ STA P4 
478b : a5 17 __ LDA P10 ; (src + 1)
478d : 85 12 __ STA P5 
478f : 4c 92 47 JMP $4792 ; (vdc_block_copy_page.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy_page: ; vdc_block_copy_page(u16,u16,u8)->void
.s0:
4792 : a5 0f __ LDA P2 ; (dest + 0)
4794 : 85 0d __ STA P0 
4796 : a5 10 __ LDA P3 ; (dest + 1)
4798 : 85 0e __ STA P1 
479a : 20 b0 22 JSR $22b0 ; (vdc_mem_addr.s0 + 0)
479d : a9 18 __ LDA #$18
479f : 85 0d __ STA P0 
47a1 : 20 0a 21 JSR $210a ; (vdc_reg_read.s0 + 0)
47a4 : 09 80 __ ORA #$80
47a6 : 85 0e __ STA P1 
47a8 : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
47ab : a9 20 __ LDA #$20
47ad : 85 0d __ STA P0 
47af : a5 12 __ LDA P5 ; (src + 1)
47b1 : 85 0e __ STA P1 
47b3 : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
47b6 : e6 0d __ INC P0 
47b8 : a5 11 __ LDA P4 ; (src + 0)
47ba : 85 0e __ STA P1 
47bc : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
47bf : a9 1f __ LDA #$1f
47c1 : 8d 00 d6 STA $d600 
47c4 : a9 1e __ LDA #$1e
47c6 : 85 0d __ STA P0 
47c8 : a5 13 __ LDA P6 ; (length + 0)
47ca : 85 0e __ STA P1 
47cc : 4c fa 20 JMP $20fa ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdcwin_put_chars: ; vdcwin_put_chars(struct VDCWin*,const u8*,u8)->void
.s1000:
47cf : a5 53 __ LDA T0 + 0 
47d1 : 8d e9 bf STA $bfe9 ; (vp_fill + 29)
47d4 : a5 54 __ LDA T0 + 1 
47d6 : 8d ea bf STA $bfea ; (vp_fill + 30)
47d9 : a5 55 __ LDA T4 + 0 
47db : 8d eb bf STA $bfeb ; (vp_fill + 31)
47de : 38 __ __ SEC
47df : a5 23 __ LDA SP + 0 
47e1 : e9 06 __ SBC #$06
47e3 : 85 23 __ STA SP + 0 
47e5 : b0 02 __ BCS $47e9 ; (vdcwin_put_chars.s0 + 0)
47e7 : c6 24 __ DEC SP + 1 
.s0:
47e9 : ad f7 bf LDA $bff7 ; (sstack + 5)
47ec : 85 53 __ STA T0 + 0 
47ee : 85 14 __ STA P7 
47f0 : ad f8 bf LDA $bff8 ; (sstack + 6)
47f3 : 85 54 __ STA T0 + 1 
47f5 : 85 15 __ STA P8 
47f7 : a0 04 __ LDY #$04
47f9 : b1 53 __ LDA (T0 + 0),y 
47fb : 85 16 __ STA P9 
47fd : c8 __ __ INY
47fe : b1 53 __ LDA (T0 + 0),y 
4800 : 85 17 __ STA P10 
4802 : ad f9 bf LDA $bff9 ; (sstack + 7)
4805 : 8d f2 bf STA $bff2 ; (sstack + 0)
4808 : ad fa bf LDA $bffa ; (sstack + 8)
480b : 8d f3 bf STA $bff3 ; (sstack + 1)
480e : ad fb bf LDA $bffb ; (sstack + 9)
4811 : 85 55 __ STA T4 + 0 
4813 : 8d f4 bf STA $bff4 ; (sstack + 2)
4816 : 20 74 48 JSR $4874 ; (vdcwin_putat_chars.s0 + 0)
4819 : 18 __ __ CLC
481a : a5 55 __ LDA T4 + 0 
481c : 65 16 __ ADC P9 
481e : a0 04 __ LDY #$04
4820 : 91 53 __ STA (T0 + 0),y 
4822 : a0 02 __ LDY #$02
4824 : d1 53 __ CMP (T0 + 0),y 
4826 : 90 31 __ BCC $4859 ; (vdcwin_put_chars.s1001 + 0)
.s1:
4828 : a9 00 __ LDA #$00
482a : a0 04 __ LDY #$04
482c : 91 53 __ STA (T0 + 0),y 
482e : a5 17 __ LDA P10 
4830 : 69 00 __ ADC #$00
4832 : c8 __ __ INY
4833 : 91 53 __ STA (T0 + 0),y 
4835 : a0 03 __ LDY #$03
4837 : d1 53 __ CMP (T0 + 0),y 
4839 : d0 1e __ BNE $4859 ; (vdcwin_put_chars.s1001 + 0)
.s4:
483b : a5 17 __ LDA P10 
483d : a0 05 __ LDY #$05
483f : 91 53 __ STA (T0 + 0),y 
4841 : a5 53 __ LDA T0 + 0 
4843 : a0 02 __ LDY #$02
4845 : 91 23 __ STA (SP + 0),y 
4847 : a5 54 __ LDA T0 + 1 
4849 : c8 __ __ INY
484a : 91 23 __ STA (SP + 0),y 
484c : a9 ff __ LDA #$ff
484e : c8 __ __ INY
484f : 91 23 __ STA (SP + 0),y 
4851 : a9 2a __ LDA #$2a
4853 : c8 __ __ INY
4854 : 91 23 __ STA (SP + 0),y 
4856 : 20 15 45 JSR $4515 ; (vdcwin_printline.s1000 + 0)
.s1001:
4859 : 18 __ __ CLC
485a : a5 23 __ LDA SP + 0 
485c : 69 06 __ ADC #$06
485e : 85 23 __ STA SP + 0 
4860 : 90 02 __ BCC $4864 ; (vdcwin_put_chars.s1001 + 11)
4862 : e6 24 __ INC SP + 1 
4864 : ad e9 bf LDA $bfe9 ; (vp_fill + 29)
4867 : 85 53 __ STA T0 + 0 
4869 : ad ea bf LDA $bfea ; (vp_fill + 30)
486c : 85 54 __ STA T0 + 1 
486e : ad eb bf LDA $bfeb ; (vp_fill + 31)
4871 : 85 55 __ STA T4 + 0 
4873 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_chars: ; vdcwin_putat_chars(struct VDCWin*,u8,u8,const u8*,u8)->void
.s0:
4874 : ad f4 bf LDA $bff4 ; (sstack + 2)
4877 : f0 42 __ BEQ $48bb ; (vdcwin_putat_chars.s1001 + 0)
.s7:
4879 : 85 45 __ STA T0 + 0 
487b : ad f2 bf LDA $bff2 ; (sstack + 0)
487e : 85 47 __ STA T4 + 0 
4880 : ad f3 bf LDA $bff3 ; (sstack + 1)
4883 : 85 48 __ STA T4 + 1 
4885 : a0 00 __ LDY #$00
.l1004:
4887 : 84 46 __ STY T1 + 0 
4889 : b1 47 __ LDA (T4 + 0),y 
488b : 4a __ __ LSR
488c : 4a __ __ LSR
488d : 4a __ __ LSR
488e : 4a __ __ LSR
488f : 4a __ __ LSR
4890 : aa __ __ TAX
4891 : bd f4 6a LDA $6af4,x ; (p2smap + 0)
4894 : 51 47 __ EOR (T4 + 0),y 
4896 : 85 12 __ STA P5 
4898 : a0 00 __ LDY #$00
489a : b1 14 __ LDA (P7),y ; (win + 0)
489c : 18 __ __ CLC
489d : 65 16 __ ADC P9 ; (x + 0)
489f : 18 __ __ CLC
48a0 : 65 46 __ ADC T1 + 0 
48a2 : 85 10 __ STA P3 
48a4 : c8 __ __ INY
48a5 : b1 14 __ LDA (P7),y ; (win + 0)
48a7 : 18 __ __ CLC
48a8 : 65 17 __ ADC P10 ; (y + 0)
48aa : 85 11 __ STA P4 
48ac : ad d2 6f LDA $6fd2 ; (vdc_state + 7)
48af : 85 13 __ STA P6 
48b1 : 20 1b 35 JSR $351b ; (vdc_printc.s0 + 0)
48b4 : a4 46 __ LDY T1 + 0 
48b6 : c8 __ __ INY
48b7 : c4 45 __ CPY T0 + 0 
48b9 : 90 cc __ BCC $4887 ; (vdcwin_putat_chars.l1004 + 0)
.s1001:
48bb : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_char: ; vdcwin_put_char(struct VDCWin*,u8)->void
.s1000:
48bc : a5 53 __ LDA T0 + 0 
48be : 8d ea bf STA $bfea ; (vp_fill + 30)
48c1 : a5 54 __ LDA T0 + 1 
48c3 : 8d eb bf STA $bfeb ; (vp_fill + 31)
48c6 : 38 __ __ SEC
48c7 : a5 23 __ LDA SP + 0 
48c9 : e9 06 __ SBC #$06
48cb : 85 23 __ STA SP + 0 
48cd : b0 02 __ BCS $48d1 ; (vdcwin_put_char.s0 + 0)
48cf : c6 24 __ DEC SP + 1 
.s0:
48d1 : ad f7 bf LDA $bff7 ; (sstack + 5)
48d4 : 85 53 __ STA T0 + 0 
48d6 : 85 14 __ STA P7 
48d8 : ad f8 bf LDA $bff8 ; (sstack + 6)
48db : 85 54 __ STA T0 + 1 
48dd : 85 15 __ STA P8 
48df : a0 04 __ LDY #$04
48e1 : b1 53 __ LDA (T0 + 0),y 
48e3 : 85 16 __ STA P9 
48e5 : c8 __ __ INY
48e6 : b1 53 __ LDA (T0 + 0),y 
48e8 : 85 17 __ STA P10 
48ea : ad f9 bf LDA $bff9 ; (sstack + 7)
48ed : 85 18 __ STA P11 
48ef : 20 48 49 JSR $4948 ; (vdcwin_putat_char.s0 + 0)
48f2 : a6 16 __ LDX P9 
48f4 : e8 __ __ INX
48f5 : 8a __ __ TXA
48f6 : a0 04 __ LDY #$04
48f8 : 91 53 __ STA (T0 + 0),y 
48fa : a0 02 __ LDY #$02
48fc : d1 53 __ CMP (T0 + 0),y 
48fe : d0 32 __ BNE $4932 ; (vdcwin_put_char.s1001 + 0)
.s1:
4900 : a9 00 __ LDA #$00
4902 : a0 04 __ LDY #$04
4904 : 91 53 __ STA (T0 + 0),y 
4906 : 18 __ __ CLC
4907 : a5 17 __ LDA P10 
4909 : 69 01 __ ADC #$01
490b : c8 __ __ INY
490c : 91 53 __ STA (T0 + 0),y 
490e : a0 03 __ LDY #$03
4910 : d1 53 __ CMP (T0 + 0),y 
4912 : d0 1e __ BNE $4932 ; (vdcwin_put_char.s1001 + 0)
.s4:
4914 : a5 17 __ LDA P10 
4916 : a0 05 __ LDY #$05
4918 : 91 53 __ STA (T0 + 0),y 
491a : a5 53 __ LDA T0 + 0 
491c : a0 02 __ LDY #$02
491e : 91 23 __ STA (SP + 0),y 
4920 : a5 54 __ LDA T0 + 1 
4922 : c8 __ __ INY
4923 : 91 23 __ STA (SP + 0),y 
4925 : a9 ff __ LDA #$ff
4927 : c8 __ __ INY
4928 : 91 23 __ STA (SP + 0),y 
492a : a9 2a __ LDA #$2a
492c : c8 __ __ INY
492d : 91 23 __ STA (SP + 0),y 
492f : 20 15 45 JSR $4515 ; (vdcwin_printline.s1000 + 0)
.s1001:
4932 : 18 __ __ CLC
4933 : a5 23 __ LDA SP + 0 
4935 : 69 06 __ ADC #$06
4937 : 85 23 __ STA SP + 0 
4939 : 90 02 __ BCC $493d ; (vdcwin_put_char.s1001 + 11)
493b : e6 24 __ INC SP + 1 
493d : ad ea bf LDA $bfea ; (vp_fill + 30)
4940 : 85 53 __ STA T0 + 0 
4942 : ad eb bf LDA $bfeb ; (vp_fill + 31)
4945 : 85 54 __ STA T0 + 1 
4947 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_char: ; vdcwin_putat_char(struct VDCWin*,u8,u8,u8)->void
.s0:
4948 : a5 18 __ LDA P11 ; (ch + 0)
494a : 4a __ __ LSR
494b : 4a __ __ LSR
494c : 4a __ __ LSR
494d : 4a __ __ LSR
494e : 4a __ __ LSR
494f : aa __ __ TAX
4950 : bd f4 6a LDA $6af4,x ; (p2smap + 0)
4953 : 45 18 __ EOR P11 ; (ch + 0)
4955 : 85 12 __ STA P5 
4957 : a5 16 __ LDA P9 ; (x + 0)
4959 : 18 __ __ CLC
495a : a0 00 __ LDY #$00
495c : 71 14 __ ADC (P7),y ; (win + 0)
495e : 85 10 __ STA P3 
4960 : a5 17 __ LDA P10 ; (y + 0)
4962 : 18 __ __ CLC
4963 : c8 __ __ INY
4964 : 71 14 __ ADC (P7),y ; (win + 0)
4966 : 85 11 __ STA P4 
4968 : ad d2 6f LDA $6fd2 ; (vdc_state + 7)
496b : 85 13 __ STA P6 
496d : 4c 1b 35 JMP $351b ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
windows_textinput: ; windows_textinput()->void
.s1000:
4970 : a2 04 __ LDX #$04
4972 : b5 53 __ LDA T0 + 0,x 
4974 : 9d 8a bf STA $bf8a,x ; (bigfont + 123)
4977 : ca __ __ DEX
4978 : 10 f8 __ BPL $4972 ; (windows_textinput.s1000 + 2)
497a : 38 __ __ SEC
497b : a5 23 __ LDA SP + 0 
497d : e9 06 __ SBC #$06
497f : 85 23 __ STA SP + 0 
4981 : b0 02 __ BCS $4985 ; (windows_textinput.s0 + 0)
4983 : c6 24 __ DEC SP + 1 
.s0:
4985 : a9 f0 __ LDA #$f0
4987 : 8d f5 bf STA $bff5 ; (sstack + 3)
498a : a9 05 __ LDA #$05
498c : 8d f6 bf STA $bff6 ; (sstack + 4)
498f : a9 3c __ LDA #$3c
4991 : 8d f8 bf STA $bff8 ; (sstack + 6)
4994 : a9 0c __ LDA #$0c
4996 : 8d f9 bf STA $bff9 ; (sstack + 7)
4999 : a9 fb __ LDA #$fb
499b : 85 1b __ STA ACCU + 0 
499d : a9 00 __ LDA #$00
499f : 85 1c __ STA ACCU + 1 
49a1 : 20 2f 69 JSR $692f ; (malloc + 0)
49a4 : a5 1b __ LDA ACCU + 0 
49a6 : 85 53 __ STA T0 + 0 
49a8 : a5 1c __ LDA ACCU + 1 
49aa : 85 54 __ STA T0 + 1 
49ac : ad d0 6f LDA $6fd0 ; (vdc_state + 5)
49af : 85 55 __ STA T1 + 0 
49b1 : ad d1 6f LDA $6fd1 ; (vdc_state + 6)
49b4 : 4a __ __ LSR
49b5 : 66 55 __ ROR T1 + 0 
49b7 : 38 __ __ SEC
49b8 : a5 55 __ LDA T1 + 0 
49ba : e9 06 __ SBC #$06
49bc : 8d f7 bf STA $bff7 ; (sstack + 5)
49bf : 20 dc 30 JSR $30dc ; (vdcwin_win_new.s1000 + 0)
49c2 : a9 01 __ LDA #$01
49c4 : 85 17 __ STA P10 
49c6 : ad c8 6f LDA $6fc8 ; (winCfg + 5)
49c9 : 85 1b __ STA ACCU + 0 
49cb : a9 00 __ LDA #$00
49cd : 85 16 __ STA P9 
49cf : 85 1c __ STA ACCU + 1 
49d1 : a9 0d __ LDA #$0d
49d3 : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
49d6 : 18 __ __ CLC
49d7 : a9 b9 __ LDA #$b9
49d9 : 65 05 __ ADC WORK + 2 
49db : 85 14 __ STA P7 
49dd : a9 70 __ LDA #$70
49df : 69 00 __ ADC #$00
49e1 : 85 15 __ STA P8 
49e3 : a9 4e __ LDA #$4e
49e5 : 8d f2 bf STA $bff2 ; (sstack + 0)
49e8 : a9 4b __ LDA #$4b
49ea : 8d f3 bf STA $bff3 ; (sstack + 1)
49ed : 20 5b 46 JSR $465b ; (vdcwin_putat_string.s0 + 0)
49f0 : a9 f0 __ LDA #$f0
49f2 : 8d f5 bf STA $bff5 ; (sstack + 3)
49f5 : a9 0a __ LDA #$0a
49f7 : 8d f6 bf STA $bff6 ; (sstack + 4)
49fa : a9 32 __ LDA #$32
49fc : 8d f8 bf STA $bff8 ; (sstack + 6)
49ff : a9 05 __ LDA #$05
4a01 : 8d f9 bf STA $bff9 ; (sstack + 7)
4a04 : 38 __ __ SEC
4a05 : a5 55 __ LDA T1 + 0 
4a07 : e9 03 __ SBC #$03
4a09 : 8d f7 bf STA $bff7 ; (sstack + 5)
4a0c : 20 dc 30 JSR $30dc ; (vdcwin_win_new.s1000 + 0)
4a0f : ad c8 6f LDA $6fc8 ; (winCfg + 5)
4a12 : 85 1b __ STA ACCU + 0 
4a14 : a9 00 __ LDA #$00
4a16 : 85 1c __ STA ACCU + 1 
4a18 : a9 0d __ LDA #$0d
4a1a : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
4a1d : 18 __ __ CLC
4a1e : a9 b9 __ LDA #$b9
4a20 : 65 05 __ ADC WORK + 2 
4a22 : 8d fe bf STA $bffe ; (sstack + 12)
4a25 : a9 70 __ LDA #$70
4a27 : 69 00 __ ADC #$00
4a29 : 8d ff bf STA $bfff ; (sstack + 13)
4a2c : 20 7c 4b JSR $4b7c ; (vdcwin_edit.s1000 + 0)
4a2f : a9 00 __ LDA #$00
4a31 : 85 1c __ STA ACCU + 1 
4a33 : 85 13 __ STA P6 
4a35 : 85 14 __ STA P7 
4a37 : a9 32 __ LDA #$32
4a39 : 85 15 __ STA P8 
4a3b : a9 05 __ LDA #$05
4a3d : 85 16 __ STA P9 
4a3f : a9 0e __ LDA #$0e
4a41 : 85 17 __ STA P10 
4a43 : a5 53 __ LDA T0 + 0 
4a45 : 8d f2 bf STA $bff2 ; (sstack + 0)
4a48 : a5 54 __ LDA T0 + 1 
4a4a : 8d f3 bf STA $bff3 ; (sstack + 1)
4a4d : ad c8 6f LDA $6fc8 ; (winCfg + 5)
4a50 : 85 1b __ STA ACCU + 0 
4a52 : a9 0d __ LDA #$0d
4a54 : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
4a57 : 18 __ __ CLC
4a58 : a9 b9 __ LDA #$b9
4a5a : 65 05 __ ADC WORK + 2 
4a5c : 85 11 __ STA P4 
4a5e : a9 70 __ LDA #$70
4a60 : 69 00 __ ADC #$00
4a62 : 85 12 __ STA P5 
4a64 : 20 f8 52 JSR $52f8 ; (vdcwin_get_rect.s0 + 0)
4a67 : 20 8e 35 JSR $358e ; (vdcwin_win_free.s0 + 0)
4a6a : ae c8 6f LDX $6fc8 ; (winCfg + 5)
4a6d : bd 8d 6a LDA $6a8d,x ; (__multab13L + 0)
4a70 : 85 55 __ STA T1 + 0 
4a72 : 18 __ __ CLC
4a73 : 69 b9 __ ADC #$b9
4a75 : 85 56 __ STA T2 + 0 
4a77 : 8d f9 bf STA $bff9 ; (sstack + 7)
4a7a : a9 70 __ LDA #$70
4a7c : 69 00 __ ADC #$00
4a7e : 85 57 __ STA T2 + 1 
4a80 : 8d fa bf STA $bffa ; (sstack + 8)
4a83 : 20 65 4d JSR $4d65 ; (vdcwin_clear.s0 + 0)
4a86 : a5 56 __ LDA T2 + 0 
4a88 : 85 14 __ STA P7 
4a8a : a5 57 __ LDA T2 + 1 
4a8c : 85 15 __ STA P8 
4a8e : a9 00 __ LDA #$00
4a90 : 85 16 __ STA P9 
4a92 : a9 01 __ LDA #$01
4a94 : 85 17 __ STA P10 
4a96 : a9 9d __ LDA #$9d
4a98 : 8d f2 bf STA $bff2 ; (sstack + 0)
4a9b : a9 53 __ LDA #$53
4a9d : 8d f3 bf STA $bff3 ; (sstack + 1)
4aa0 : 20 5b 46 JSR $465b ; (vdcwin_putat_string.s0 + 0)
4aa3 : a5 14 __ LDA P7 
4aa5 : 8d fc bf STA $bffc ; (sstack + 10)
4aa8 : a5 15 __ LDA P8 
4aaa : 8d fd bf STA $bffd ; (sstack + 11)
4aad : a5 53 __ LDA T0 + 0 
4aaf : 8d fe bf STA $bffe ; (sstack + 12)
4ab2 : a5 54 __ LDA T0 + 1 
4ab4 : 8d ff bf STA $bfff ; (sstack + 13)
4ab7 : a9 00 __ LDA #$00
4ab9 : a6 55 __ LDX T1 + 0 
4abb : 9d bd 70 STA $70bd,x 
4abe : a9 03 __ LDA #$03
4ac0 : 9d be 70 STA $70be,x 
4ac3 : 20 91 43 JSR $4391 ; (vdcwin_printwrap.s1000 + 0)
4ac6 : ad c8 6f LDA $6fc8 ; (winCfg + 5)
4ac9 : 85 1b __ STA ACCU + 0 
4acb : a9 00 __ LDA #$00
4acd : 85 1c __ STA ACCU + 1 
4acf : a9 0d __ LDA #$0d
4ad1 : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
4ad4 : 18 __ __ CLC
4ad5 : a9 b9 __ LDA #$b9
4ad7 : 65 05 __ ADC WORK + 2 
4ad9 : a0 02 __ LDY #$02
4adb : 91 23 __ STA (SP + 0),y 
4add : a9 70 __ LDA #$70
4adf : 69 00 __ ADC #$00
4ae1 : c8 __ __ INY
4ae2 : 91 23 __ STA (SP + 0),y 
4ae4 : a9 ff __ LDA #$ff
4ae6 : c8 __ __ INY
4ae7 : 91 23 __ STA (SP + 0),y 
4ae9 : a9 2a __ LDA #$2a
4aeb : c8 __ __ INY
4aec : 91 23 __ STA (SP + 0),y 
4aee : 20 15 45 JSR $4515 ; (vdcwin_printline.s1000 + 0)
4af1 : ad c8 6f LDA $6fc8 ; (winCfg + 5)
4af4 : 85 1b __ STA ACCU + 0 
4af6 : a9 00 __ LDA #$00
4af8 : 85 1c __ STA ACCU + 1 
4afa : a9 0d __ LDA #$0d
4afc : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
4aff : 18 __ __ CLC
4b00 : a9 b9 __ LDA #$b9
4b02 : 65 05 __ ADC WORK + 2 
4b04 : 85 0d __ STA P0 
4b06 : a9 70 __ LDA #$70
4b08 : 69 00 __ ADC #$00
4b0a : 85 0e __ STA P1 
4b0c : 20 a4 4d JSR $4da4 ; (vdcwin_cursor_down.s0 + 0)
4b0f : a5 0d __ LDA P0 
4b11 : a0 02 __ LDY #$02
4b13 : 91 23 __ STA (SP + 0),y 
4b15 : a5 0e __ LDA P1 
4b17 : c8 __ __ INY
4b18 : 91 23 __ STA (SP + 0),y 
4b1a : a9 75 __ LDA #$75
4b1c : c8 __ __ INY
4b1d : 91 23 __ STA (SP + 0),y 
4b1f : a9 35 __ LDA #$35
4b21 : c8 __ __ INY
4b22 : 91 23 __ STA (SP + 0),y 
4b24 : 20 ca 45 JSR $45ca ; (vdcwin_put_string.s1000 + 0)
4b27 : 20 3b 2a JSR $2a3b ; (getch.s0 + 0)
4b2a : 20 8e 35 JSR $358e ; (vdcwin_win_free.s0 + 0)
4b2d : a5 53 __ LDA T0 + 0 
4b2f : 85 1b __ STA ACCU + 0 
4b31 : a5 54 __ LDA T0 + 1 
4b33 : 85 1c __ STA ACCU + 1 
4b35 : 20 ee 69 JSR $69ee ; (free + 0)
.s1001:
4b38 : 18 __ __ CLC
4b39 : a5 23 __ LDA SP + 0 
4b3b : 69 06 __ ADC #$06
4b3d : 85 23 __ STA SP + 0 
4b3f : 90 02 __ BCC $4b43 ; (windows_textinput.s1001 + 11)
4b41 : e6 24 __ INC SP + 1 
4b43 : a2 04 __ LDX #$04
4b45 : bd 8a bf LDA $bf8a,x ; (bigfont + 123)
4b48 : 95 53 __ STA T0 + 0,x 
4b4a : ca __ __ DEX
4b4b : 10 f8 __ BPL $4b45 ; (windows_textinput.s1001 + 13)
4b4d : 60 __ __ RTS
--------------------------------------------------------------------
4b4e : __ __ __ BYT 74 52 59 20 54 45 58 54 20 45 4e 54 52 59 20 49 : tRY TEXT ENTRY I
4b5e : __ __ __ BYT 4e 20 57 49 4e 44 4f 57 2c 20 41 43 43 45 50 54 : N WINDOW, ACCEPT
4b6e : __ __ __ BYT 20 57 49 54 48 20 72 65 74 75 72 6e 2e 00       :  WITH return..
--------------------------------------------------------------------
vdcwin_edit: ; vdcwin_edit(struct VDCWin*)->u8
.s1000:
4b7c : a5 53 __ LDA T0 + 0 
4b7e : 8d e3 bf STA $bfe3 ; (wrapbuffer + 75)
4b81 : a5 54 __ LDA T0 + 1 
4b83 : 8d e4 bf STA $bfe4 ; (wrapbuffer + 76)
4b86 : a5 55 __ LDA T1 + 0 
4b88 : 8d e5 bf STA $bfe5 ; (wrapbuffer + 77)
.s0:
4b8b : ad fe bf LDA $bffe ; (sstack + 12)
4b8e : 85 53 __ STA T0 + 0 
4b90 : ad ff bf LDA $bfff ; (sstack + 13)
4b93 : 85 54 __ STA T0 + 1 
.l2:
4b95 : a5 53 __ LDA T0 + 0 
4b97 : 85 10 __ STA P3 
4b99 : a5 54 __ LDA T0 + 1 
4b9b : 85 11 __ STA P4 
4b9d : a9 01 __ LDA #$01
4b9f : 85 12 __ STA P5 
4ba1 : 20 da 4b JSR $4bda ; (vdcwin_cursor_show.s0 + 0)
4ba4 : 20 80 35 JSR $3580 ; (vdcwin_getch.s0 + 0)
4ba7 : a5 1b __ LDA ACCU + 0 
4ba9 : 85 55 __ STA T1 + 0 
4bab : c6 12 __ DEC P5 
4bad : 20 da 4b JSR $4bda ; (vdcwin_cursor_show.s0 + 0)
4bb0 : a5 10 __ LDA P3 
4bb2 : 8d fb bf STA $bffb ; (sstack + 9)
4bb5 : a5 11 __ LDA P4 
4bb7 : 8d fc bf STA $bffc ; (sstack + 10)
4bba : a5 55 __ LDA T1 + 0 
4bbc : 8d fd bf STA $bffd ; (sstack + 11)
4bbf : 20 18 4c JSR $4c18 ; (vdcwin_edit_char.s1000 + 0)
4bc2 : a5 1b __ LDA ACCU + 0 
4bc4 : f0 cf __ BEQ $4b95 ; (vdcwin_edit.l2 + 0)
.s5:
4bc6 : a5 55 __ LDA T1 + 0 
4bc8 : 85 1b __ STA ACCU + 0 
.s1001:
4bca : ad e3 bf LDA $bfe3 ; (wrapbuffer + 75)
4bcd : 85 53 __ STA T0 + 0 
4bcf : ad e4 bf LDA $bfe4 ; (wrapbuffer + 76)
4bd2 : 85 54 __ STA T0 + 1 
4bd4 : ad e5 bf LDA $bfe5 ; (wrapbuffer + 77)
4bd7 : 85 55 __ STA T1 + 0 
4bd9 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_cursor_show: ; vdcwin_cursor_show(struct VDCWin*,bool)->void
.s0:
4bda : a0 00 __ LDY #$00
4bdc : b1 10 __ LDA (P3),y ; (win + 0)
4bde : 18 __ __ CLC
4bdf : a0 04 __ LDY #$04
4be1 : 71 10 __ ADC (P3),y ; (win + 0)
4be3 : 85 0d __ STA P0 
4be5 : a0 01 __ LDY #$01
4be7 : b1 10 __ LDA (P3),y ; (win + 0)
4be9 : 18 __ __ CLC
4bea : a0 05 __ LDY #$05
4bec : 71 10 __ ADC (P3),y ; (win + 0)
4bee : 85 0e __ STA P1 
4bf0 : 20 6e 22 JSR $226e ; (vdc_coords.s0 + 0)
4bf3 : ad d5 6f LDA $6fd5 ; (vdc_state + 10)
4bf6 : 18 __ __ CLC
4bf7 : 65 1b __ ADC ACCU + 0 
4bf9 : 85 0d __ STA P0 
4bfb : ad d6 6f LDA $6fd6 ; (vdc_state + 11)
4bfe : 65 1c __ ADC ACCU + 1 
4c00 : 85 0e __ STA P1 
4c02 : a5 12 __ LDA P5 ; (show + 0)
4c04 : d0 08 __ BNE $4c0e ; (vdcwin_cursor_show.s1 + 0)
.s2:
4c06 : 20 a6 21 JSR $21a6 ; (vdc_mem_read_at.s0 + 0)
4c09 : 29 bf __ AND #$bf
4c0b : 4c 13 4c JMP $4c13 ; (vdcwin_cursor_show.s3 + 0)
.s1:
4c0e : 20 a6 21 JSR $21a6 ; (vdc_mem_read_at.s0 + 0)
4c11 : 09 40 __ ORA #$40
.s3:
4c13 : 85 0f __ STA P2 
4c15 : 4c 78 21 JMP $2178 ; (vdc_mem_write_at.s0 + 0)
--------------------------------------------------------------------
vdcwin_edit_char: ; vdcwin_edit_char(struct VDCWin*,u8)->bool
.s1000:
4c18 : a5 53 __ LDA T0 + 0 
4c1a : 8d e7 bf STA $bfe7 ; (wrapbuffer + 79)
4c1d : a5 54 __ LDA T2 + 0 
4c1f : 8d e8 bf STA $bfe8 ; (wrapbuffer + 80)
4c22 : a5 55 __ LDA T2 + 1 
4c24 : 8d e9 bf STA $bfe9 ; (vp_fill + 29)
.s0:
4c27 : ad fd bf LDA $bffd ; (sstack + 11)
4c2a : c9 14 __ CMP #$14
4c2c : d0 03 __ BNE $4c31 ; (vdcwin_edit_char.s25 + 0)
4c2e : 4c 3d 4d JMP $4d3d ; (vdcwin_edit_char.s9 + 0)
.s25:
4c31 : 85 53 __ STA T0 + 0 
4c33 : c9 14 __ CMP #$14
4c35 : b0 03 __ BCS $4c3a ; (vdcwin_edit_char.s26 + 0)
4c37 : 4c 04 4d JMP $4d04 ; (vdcwin_edit_char.s27 + 0)
.s26:
4c3a : c9 93 __ CMP #$93
4c3c : d0 16 __ BNE $4c54 ; (vdcwin_edit_char.s34 + 0)
.s4:
4c3e : ad fb bf LDA $bffb ; (sstack + 9)
4c41 : 85 54 __ STA T2 + 0 
4c43 : 8d f9 bf STA $bff9 ; (sstack + 7)
4c46 : ad fc bf LDA $bffc ; (sstack + 10)
4c49 : 85 55 __ STA T2 + 1 
4c4b : 8d fa bf STA $bffa ; (sstack + 8)
4c4e : 20 65 4d JSR $4d65 ; (vdcwin_clear.s0 + 0)
4c51 : 4c f9 4c JMP $4cf9 ; (vdcwin_edit_char.s1037 + 0)
.s34:
4c54 : 90 7b __ BCC $4cd1 ; (vdcwin_edit_char.s36 + 0)
.s35:
4c56 : c9 9d __ CMP #$9d
4c58 : d0 10 __ BNE $4c6a ; (vdcwin_edit_char.s14 + 0)
.s8:
4c5a : ad fb bf LDA $bffb ; (sstack + 9)
4c5d : 85 0d __ STA P0 
4c5f : ad fc bf LDA $bffc ; (sstack + 10)
4c62 : 85 0e __ STA P1 
4c64 : 20 08 4e JSR $4e08 ; (vdcwin_cursor_backward.s0 + 0)
4c67 : 4c bd 4c JMP $4cbd ; (vdcwin_edit_char.s1036 + 0)
.s14:
4c6a : c9 20 __ CMP #$20
4c6c : 90 4f __ BCC $4cbd ; (vdcwin_edit_char.s1036 + 0)
.s19:
4c6e : 09 00 __ ORA #$00
4c70 : 10 04 __ BPL $4c76 ; (vdcwin_edit_char.s15 + 0)
.s18:
4c72 : c9 a0 __ CMP #$a0
4c74 : 90 47 __ BCC $4cbd ; (vdcwin_edit_char.s1036 + 0)
.s15:
4c76 : ad fb bf LDA $bffb ; (sstack + 9)
4c79 : 85 54 __ STA T2 + 0 
4c7b : ad fc bf LDA $bffc ; (sstack + 10)
4c7e : 85 55 __ STA T2 + 1 
4c80 : a0 05 __ LDY #$05
4c82 : b1 54 __ LDA (T2 + 0),y 
4c84 : 18 __ __ CLC
4c85 : 69 01 __ ADC #$01
4c87 : b0 06 __ BCS $4c8f ; (vdcwin_edit_char.s23 + 0)
.s1004:
4c89 : a0 03 __ LDY #$03
4c8b : d1 54 __ CMP (T2 + 0),y 
4c8d : 90 0f __ BCC $4c9e ; (vdcwin_edit_char.s20 + 0)
.s23:
4c8f : a0 04 __ LDY #$04
4c91 : b1 54 __ LDA (T2 + 0),y 
4c93 : 18 __ __ CLC
4c94 : 69 01 __ ADC #$01
4c96 : b0 25 __ BCS $4cbd ; (vdcwin_edit_char.s1036 + 0)
.s1002:
4c98 : a0 02 __ LDY #$02
4c9a : d1 54 __ CMP (T2 + 0),y 
4c9c : b0 1f __ BCS $4cbd ; (vdcwin_edit_char.s1036 + 0)
.s20:
4c9e : a5 54 __ LDA T2 + 0 
4ca0 : 8d f4 bf STA $bff4 ; (sstack + 2)
4ca3 : a5 55 __ LDA T2 + 1 
4ca5 : 8d f5 bf STA $bff5 ; (sstack + 3)
4ca8 : 20 bc 4f JSR $4fbc ; (vdcwin_insert_char.s0 + 0)
4cab : a5 54 __ LDA T2 + 0 
4cad : 8d f7 bf STA $bff7 ; (sstack + 5)
4cb0 : a5 55 __ LDA T2 + 1 
4cb2 : 8d f8 bf STA $bff8 ; (sstack + 6)
4cb5 : a5 53 __ LDA T0 + 0 
4cb7 : 8d f9 bf STA $bff9 ; (sstack + 7)
4cba : 20 bc 48 JSR $48bc ; (vdcwin_put_char.s1000 + 0)
.s1036:
4cbd : a9 00 __ LDA #$00
.s1001:
4cbf : 85 1b __ STA ACCU + 0 
4cc1 : ad e7 bf LDA $bfe7 ; (wrapbuffer + 79)
4cc4 : 85 53 __ STA T0 + 0 
4cc6 : ad e8 bf LDA $bfe8 ; (wrapbuffer + 80)
4cc9 : 85 54 __ STA T2 + 0 
4ccb : ad e9 bf LDA $bfe9 ; (vp_fill + 29)
4cce : 85 55 __ STA T2 + 1 
4cd0 : 60 __ __ RTS
.s36:
4cd1 : c9 1d __ CMP #$1d
4cd3 : d0 10 __ BNE $4ce5 ; (vdcwin_edit_char.s37 + 0)
.s7:
4cd5 : ad fb bf LDA $bffb ; (sstack + 9)
4cd8 : 85 0d __ STA P0 
4cda : ad fc bf LDA $bffc ; (sstack + 10)
4cdd : 85 0e __ STA P1 
4cdf : 20 d0 4d JSR $4dd0 ; (vdcwin_cursor_forward.s0 + 0)
4ce2 : 4c bd 4c JMP $4cbd ; (vdcwin_edit_char.s1036 + 0)
.s37:
4ce5 : c9 91 __ CMP #$91
4ce7 : d0 81 __ BNE $4c6a ; (vdcwin_edit_char.s14 + 0)
.s6:
4ce9 : ad fb bf LDA $bffb ; (sstack + 9)
4cec : 85 0d __ STA P0 
4cee : ad fc bf LDA $bffc ; (sstack + 10)
4cf1 : 85 0e __ STA P1 
4cf3 : 20 c2 4d JSR $4dc2 ; (vdcwin_cursor_up.s0 + 0)
4cf6 : 4c bd 4c JMP $4cbd ; (vdcwin_edit_char.s1036 + 0)
.s1037:
4cf9 : a9 00 __ LDA #$00
4cfb : a0 04 __ LDY #$04
4cfd : 91 54 __ STA (T2 + 0),y 
4cff : c8 __ __ INY
4d00 : 91 54 __ STA (T2 + 0),y 
4d02 : d0 bb __ BNE $4cbf ; (vdcwin_edit_char.s1001 + 0)
.s27:
4d04 : c9 11 __ CMP #$11
4d06 : d0 10 __ BNE $4d18 ; (vdcwin_edit_char.s28 + 0)
.s5:
4d08 : ad fb bf LDA $bffb ; (sstack + 9)
4d0b : 85 0d __ STA P0 
4d0d : ad fc bf LDA $bffc ; (sstack + 10)
4d10 : 85 0e __ STA P1 
4d12 : 20 a4 4d JSR $4da4 ; (vdcwin_cursor_down.s0 + 0)
4d15 : 4c bd 4c JMP $4cbd ; (vdcwin_edit_char.s1036 + 0)
.s28:
4d18 : 90 14 __ BCC $4d2e ; (vdcwin_edit_char.s30 + 0)
.s29:
4d1a : c9 13 __ CMP #$13
4d1c : f0 03 __ BEQ $4d21 ; (vdcwin_edit_char.s3 + 0)
4d1e : 4c 6a 4c JMP $4c6a ; (vdcwin_edit_char.s14 + 0)
.s3:
4d21 : ad fb bf LDA $bffb ; (sstack + 9)
4d24 : 85 54 __ STA T2 + 0 
4d26 : ad fc bf LDA $bffc ; (sstack + 10)
4d29 : 85 55 __ STA T2 + 1 
4d2b : 4c f9 4c JMP $4cf9 ; (vdcwin_edit_char.s1037 + 0)
.s30:
4d2e : c9 03 __ CMP #$03
4d30 : f0 07 __ BEQ $4d39 ; (vdcwin_edit_char.s2 + 0)
.s31:
4d32 : c9 0d __ CMP #$0d
4d34 : f0 03 __ BEQ $4d39 ; (vdcwin_edit_char.s2 + 0)
4d36 : 4c 6a 4c JMP $4c6a ; (vdcwin_edit_char.s14 + 0)
.s2:
4d39 : a9 01 __ LDA #$01
4d3b : d0 82 __ BNE $4cbf ; (vdcwin_edit_char.s1001 + 0)
.s9:
4d3d : ad fb bf LDA $bffb ; (sstack + 9)
4d40 : 85 54 __ STA T2 + 0 
4d42 : 85 0d __ STA P0 
4d44 : ad fc bf LDA $bffc ; (sstack + 10)
4d47 : 85 55 __ STA T2 + 1 
4d49 : 85 0e __ STA P1 
4d4b : 20 08 4e JSR $4e08 ; (vdcwin_cursor_backward.s0 + 0)
4d4e : 09 00 __ ORA #$00
4d50 : d0 03 __ BNE $4d55 ; (vdcwin_edit_char.s10 + 0)
4d52 : 4c bd 4c JMP $4cbd ; (vdcwin_edit_char.s1036 + 0)
.s10:
4d55 : a5 54 __ LDA T2 + 0 
4d57 : 8d f4 bf STA $bff4 ; (sstack + 2)
4d5a : a5 55 __ LDA T2 + 1 
4d5c : 8d f5 bf STA $bff5 ; (sstack + 3)
4d5f : 20 2d 4e JSR $4e2d ; (vdcwin_delete_char.s1000 + 0)
4d62 : 4c bd 4c JMP $4cbd ; (vdcwin_edit_char.s1036 + 0)
--------------------------------------------------------------------
vdcwin_clear: ; vdcwin_clear(struct VDCWin*)->void
.s0:
4d65 : a9 20 __ LDA #$20
4d67 : 8d f8 bf STA $bff8 ; (sstack + 6)
4d6a : ad f9 bf LDA $bff9 ; (sstack + 7)
4d6d : 8d f6 bf STA $bff6 ; (sstack + 4)
4d70 : ad fa bf LDA $bffa ; (sstack + 8)
4d73 : 8d f7 bf STA $bff7 ; (sstack + 5)
4d76 : 4c 79 4d JMP $4d79 ; (vdcwin_fill.s0 + 0)
--------------------------------------------------------------------
vdcwin_fill: ; vdcwin_fill(struct VDCWin*,u8)->void
.s0:
4d79 : ad f6 bf LDA $bff6 ; (sstack + 4)
4d7c : 85 43 __ STA T0 + 0 
4d7e : ad f7 bf LDA $bff7 ; (sstack + 5)
4d81 : 85 44 __ STA T0 + 1 
4d83 : a0 00 __ LDY #$00
4d85 : b1 43 __ LDA (T0 + 0),y 
4d87 : 85 18 __ STA P11 
4d89 : c8 __ __ INY
4d8a : b1 43 __ LDA (T0 + 0),y 
4d8c : 8d f2 bf STA $bff2 ; (sstack + 0)
4d8f : c8 __ __ INY
4d90 : b1 43 __ LDA (T0 + 0),y 
4d92 : 8d f4 bf STA $bff4 ; (sstack + 2)
4d95 : c8 __ __ INY
4d96 : b1 43 __ LDA (T0 + 0),y 
4d98 : 8d f5 bf STA $bff5 ; (sstack + 3)
4d9b : ad f8 bf LDA $bff8 ; (sstack + 6)
4d9e : 8d f3 bf STA $bff3 ; (sstack + 1)
4da1 : 4c ed 21 JMP $21ed ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdcwin_cursor_down: ; vdcwin_cursor_down(struct VDCWin*)->bool
.s0:
4da4 : a0 03 __ LDY #$03
4da6 : b1 0d __ LDA (P0),y ; (win + 0)
4da8 : 85 1b __ STA ACCU + 0 
4daa : a0 05 __ LDY #$05
4dac : b1 0d __ LDA (P0),y ; (win + 0)
4dae : aa __ __ TAX
4daf : 18 __ __ CLC
4db0 : 69 01 __ ADC #$01
4db2 : b0 0b __ BCS $4dbf ; (vdcwin_cursor_down.s3 + 0)
.s1002:
4db4 : c5 1b __ CMP ACCU + 0 
4db6 : b0 07 __ BCS $4dbf ; (vdcwin_cursor_down.s3 + 0)
.s1:
4db8 : e8 __ __ INX
4db9 : 8a __ __ TXA
4dba : 91 0d __ STA (P0),y ; (win + 0)
4dbc : a9 01 __ LDA #$01
4dbe : 60 __ __ RTS
.s3:
4dbf : a9 00 __ LDA #$00
.s1001:
4dc1 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_cursor_up: ; vdcwin_cursor_up(struct VDCWin*)->bool
.s0:
4dc2 : a0 05 __ LDY #$05
4dc4 : b1 0d __ LDA (P0),y ; (win + 0)
4dc6 : f0 07 __ BEQ $4dcf ; (vdcwin_cursor_up.s1001 + 0)
.s1:
4dc8 : 38 __ __ SEC
4dc9 : e9 01 __ SBC #$01
4dcb : 91 0d __ STA (P0),y ; (win + 0)
4dcd : a9 01 __ LDA #$01
.s1001:
4dcf : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_cursor_forward: ; vdcwin_cursor_forward(struct VDCWin*)->bool
.s0:
4dd0 : a0 02 __ LDY #$02
4dd2 : b1 0d __ LDA (P0),y ; (win + 0)
4dd4 : 85 1b __ STA ACCU + 0 
4dd6 : a0 04 __ LDY #$04
4dd8 : b1 0d __ LDA (P0),y ; (win + 0)
4dda : aa __ __ TAX
4ddb : 18 __ __ CLC
4ddc : 69 01 __ ADC #$01
4dde : b0 08 __ BCS $4de8 ; (vdcwin_cursor_forward.s2 + 0)
.s1004:
4de0 : c5 1b __ CMP ACCU + 0 
4de2 : b0 04 __ BCS $4de8 ; (vdcwin_cursor_forward.s2 + 0)
.s1:
4de4 : e8 __ __ INX
4de5 : 8a __ __ TXA
4de6 : 90 1b __ BCC $4e03 ; (vdcwin_cursor_forward.s1006 + 0)
.s2:
4de8 : a0 05 __ LDY #$05
4dea : b1 0d __ LDA (P0),y ; (win + 0)
4dec : aa __ __ TAX
4ded : 18 __ __ CLC
4dee : 69 01 __ ADC #$01
4df0 : b0 06 __ BCS $4df8 ; (vdcwin_cursor_forward.s3 + 0)
.s1002:
4df2 : a0 03 __ LDY #$03
4df4 : d1 0d __ CMP (P0),y ; (win + 0)
4df6 : 90 03 __ BCC $4dfb ; (vdcwin_cursor_forward.s5 + 0)
.s3:
4df8 : a9 00 __ LDA #$00
4dfa : 60 __ __ RTS
.s5:
4dfb : a9 00 __ LDA #$00
4dfd : c8 __ __ INY
4dfe : 91 0d __ STA (P0),y ; (win + 0)
4e00 : e8 __ __ INX
4e01 : 8a __ __ TXA
4e02 : c8 __ __ INY
.s1006:
4e03 : 91 0d __ STA (P0),y ; (win + 0)
4e05 : a9 01 __ LDA #$01
.s1001:
4e07 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_cursor_backward: ; vdcwin_cursor_backward(struct VDCWin*)->bool
.s0:
4e08 : a0 04 __ LDY #$04
4e0a : b1 0d __ LDA (P0),y ; (win + 0)
4e0c : f0 06 __ BEQ $4e14 ; (vdcwin_cursor_backward.s2 + 0)
.s1:
4e0e : 38 __ __ SEC
4e0f : e9 01 __ SBC #$01
4e11 : 4c 28 4e JMP $4e28 ; (vdcwin_cursor_backward.s1003 + 0)
.s2:
4e14 : c8 __ __ INY
4e15 : b1 0d __ LDA (P0),y ; (win + 0)
4e17 : f0 13 __ BEQ $4e2c ; (vdcwin_cursor_backward.s1001 + 0)
.s5:
4e19 : aa __ __ TAX
4e1a : 38 __ __ SEC
4e1b : a0 02 __ LDY #$02
4e1d : b1 0d __ LDA (P0),y ; (win + 0)
4e1f : e9 01 __ SBC #$01
4e21 : a0 04 __ LDY #$04
4e23 : 91 0d __ STA (P0),y ; (win + 0)
4e25 : ca __ __ DEX
4e26 : 8a __ __ TXA
4e27 : c8 __ __ INY
.s1003:
4e28 : 91 0d __ STA (P0),y ; (win + 0)
4e2a : a9 01 __ LDA #$01
.s1001:
4e2c : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_delete_char: ; vdcwin_delete_char(struct VDCWin*)->void
.s1000:
4e2d : a2 03 __ LDX #$03
4e2f : b5 53 __ LDA T9 + 0,x 
4e31 : 9d ec bf STA $bfec,x ; (buffer + 10)
4e34 : ca __ __ DEX
4e35 : 10 f8 __ BPL $4e2f ; (vdcwin_delete_char.s1000 + 2)
.s0:
4e37 : a9 00 __ LDA #$00
4e39 : 85 0d __ STA P0 
4e3b : ad f4 bf LDA $bff4 ; (sstack + 2)
4e3e : 85 45 __ STA T0 + 0 
4e40 : ad f5 bf LDA $bff5 ; (sstack + 3)
4e43 : 85 46 __ STA T0 + 1 
4e45 : a0 05 __ LDY #$05
4e47 : b1 45 __ LDA (T0 + 0),y 
4e49 : 85 47 __ STA T1 + 0 
4e4b : 85 0e __ STA P1 
4e4d : 20 6e 22 JSR $226e ; (vdc_coords.s0 + 0)
4e50 : a5 1b __ LDA ACCU + 0 ; (win + 0)
4e52 : 85 48 __ STA T2 + 0 
4e54 : a5 1c __ LDA ACCU + 1 ; (win + 1)
4e56 : 85 49 __ STA T2 + 1 
4e58 : a0 06 __ LDY #$06
4e5a : b1 45 __ LDA (T0 + 0),y 
4e5c : 85 4a __ STA T3 + 0 
4e5e : c8 __ __ INY
4e5f : b1 45 __ LDA (T0 + 0),y 
4e61 : 85 4b __ STA T3 + 1 
4e63 : 20 6e 22 JSR $226e ; (vdc_coords.s0 + 0)
4e66 : a5 1b __ LDA ACCU + 0 ; (win + 0)
4e68 : 85 4c __ STA T4 + 0 
4e6a : a5 1c __ LDA ACCU + 1 ; (win + 1)
4e6c : 85 4d __ STA T4 + 1 
4e6e : 18 __ __ CLC
4e6f : a5 4a __ LDA T3 + 0 
4e71 : 65 48 __ ADC T2 + 0 
4e73 : 85 48 __ STA T2 + 0 
4e75 : a5 4b __ LDA T3 + 1 
4e77 : 65 49 __ ADC T2 + 1 
4e79 : 85 49 __ STA T2 + 1 
4e7b : a0 04 __ LDY #$04
4e7d : b1 45 __ LDA (T0 + 0),y 
4e7f : 85 4a __ STA T3 + 0 
4e81 : 18 __ __ CLC
4e82 : 65 48 __ ADC T2 + 0 
4e84 : 85 14 __ STA P7 
4e86 : a9 00 __ LDA #$00
4e88 : 65 49 __ ADC T2 + 1 
4e8a : 85 15 __ STA P8 
4e8c : 18 __ __ CLC
4e8d : a5 14 __ LDA P7 
4e8f : 69 01 __ ADC #$01
4e91 : 85 16 __ STA P9 
4e93 : a5 15 __ LDA P8 
4e95 : 69 00 __ ADC #$00
4e97 : 85 17 __ STA P10 
4e99 : a0 02 __ LDY #$02
4e9b : b1 45 __ LDA (T0 + 0),y 
4e9d : 38 __ __ SEC
4e9e : e9 01 __ SBC #$01
4ea0 : 85 4e __ STA T6 + 0 
4ea2 : 38 __ __ SEC
4ea3 : e5 4a __ SBC T3 + 0 
4ea5 : 85 4f __ STA T7 + 0 
4ea7 : 8d f2 bf STA $bff2 ; (sstack + 0)
4eaa : a9 00 __ LDA #$00
4eac : 8d f3 bf STA $bff3 ; (sstack + 1)
4eaf : a0 08 __ LDY #$08
4eb1 : b1 45 __ LDA (T0 + 0),y 
4eb3 : 85 50 __ STA T8 + 0 
4eb5 : c8 __ __ INY
4eb6 : b1 45 __ LDA (T0 + 0),y 
4eb8 : 85 51 __ STA T8 + 1 
4eba : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
4ebd : a5 4f __ LDA T7 + 0 
4ebf : 8d f2 bf STA $bff2 ; (sstack + 0)
4ec2 : a9 00 __ LDA #$00
4ec4 : 8d f3 bf STA $bff3 ; (sstack + 1)
4ec7 : 18 __ __ CLC
4ec8 : a5 50 __ LDA T8 + 0 
4eca : 65 4c __ ADC T4 + 0 
4ecc : 85 4c __ STA T4 + 0 
4ece : a5 51 __ LDA T8 + 1 
4ed0 : 65 4d __ ADC T4 + 1 
4ed2 : 85 4d __ STA T4 + 1 
4ed4 : 18 __ __ CLC
4ed5 : a5 4c __ LDA T4 + 0 
4ed7 : 65 4a __ ADC T3 + 0 
4ed9 : 85 14 __ STA P7 
4edb : a5 4d __ LDA T4 + 1 
4edd : 69 00 __ ADC #$00
4edf : 85 15 __ STA P8 
4ee1 : 18 __ __ CLC
4ee2 : a5 14 __ LDA P7 
4ee4 : 69 01 __ ADC #$01
4ee6 : 85 16 __ STA P9 
4ee8 : a5 15 __ LDA P8 
4eea : 69 00 __ ADC #$00
4eec : 85 17 __ STA P10 
4eee : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
4ef1 : a6 47 __ LDX T1 + 0 
4ef3 : e8 __ __ INX
4ef4 : 86 4a __ STX T3 + 0 
.l2:
4ef6 : 18 __ __ CLC
4ef7 : a5 4e __ LDA T6 + 0 
4ef9 : 65 48 __ ADC T2 + 0 
4efb : 85 50 __ STA T8 + 0 
4efd : 85 0d __ STA P0 
4eff : a9 00 __ LDA #$00
4f01 : 65 49 __ ADC T2 + 1 
4f03 : 85 51 __ STA T8 + 1 
4f05 : 85 0e __ STA P1 
4f07 : a5 4a __ LDA T3 + 0 
4f09 : a0 03 __ LDY #$03
4f0b : d1 45 __ CMP (T0 + 0),y 
4f0d : 90 12 __ BCC $4f21 ; (vdcwin_delete_char.s3 + 0)
.s4:
4f0f : a9 20 __ LDA #$20
4f11 : 85 0f __ STA P2 
4f13 : 20 78 21 JSR $2178 ; (vdc_mem_write_at.s0 + 0)
.s1001:
4f16 : a2 03 __ LDX #$03
4f18 : bd ec bf LDA $bfec,x ; (buffer + 10)
4f1b : 95 53 __ STA T9 + 0,x 
4f1d : ca __ __ DEX
4f1e : 10 f8 __ BPL $4f18 ; (vdcwin_delete_char.s1001 + 2)
4f20 : 60 __ __ RTS
.s3:
4f21 : ad ce 6f LDA $6fce ; (vdc_state + 3)
4f24 : 85 53 __ STA T9 + 0 
4f26 : 65 48 __ ADC T2 + 0 
4f28 : 85 55 __ STA T10 + 0 
4f2a : 85 0d __ STA P0 
4f2c : ad cf 6f LDA $6fcf ; (vdc_state + 4)
4f2f : 85 54 __ STA T9 + 1 
4f31 : 65 49 __ ADC T2 + 1 
4f33 : 85 56 __ STA T10 + 1 
4f35 : 85 0e __ STA P1 
4f37 : 20 a6 21 JSR $21a6 ; (vdc_mem_read_at.s0 + 0)
4f3a : 85 0f __ STA P2 
4f3c : a5 50 __ LDA T8 + 0 
4f3e : 85 0d __ STA P0 
4f40 : a5 51 __ LDA T8 + 1 
4f42 : 85 0e __ STA P1 
4f44 : 20 78 21 JSR $2178 ; (vdc_mem_write_at.s0 + 0)
4f47 : 18 __ __ CLC
4f48 : a5 4c __ LDA T4 + 0 
4f4a : 65 53 __ ADC T9 + 0 
4f4c : 85 50 __ STA T8 + 0 
4f4e : 85 0d __ STA P0 
4f50 : a5 4d __ LDA T4 + 1 
4f52 : 65 54 __ ADC T9 + 1 
4f54 : 85 51 __ STA T8 + 1 
4f56 : 85 0e __ STA P1 
4f58 : 20 a6 21 JSR $21a6 ; (vdc_mem_read_at.s0 + 0)
4f5b : 85 0f __ STA P2 
4f5d : 18 __ __ CLC
4f5e : a5 4c __ LDA T4 + 0 
4f60 : 65 4e __ ADC T6 + 0 
4f62 : 85 0d __ STA P0 
4f64 : a5 4d __ LDA T4 + 1 
4f66 : 69 00 __ ADC #$00
4f68 : 85 0e __ STA P1 
4f6a : 20 78 21 JSR $2178 ; (vdc_mem_write_at.s0 + 0)
4f6d : a5 55 __ LDA T10 + 0 
4f6f : 85 14 __ STA P7 
4f71 : 85 48 __ STA T2 + 0 
4f73 : a5 56 __ LDA T10 + 1 
4f75 : 85 15 __ STA P8 
4f77 : 85 49 __ STA T2 + 1 
4f79 : a5 4e __ LDA T6 + 0 
4f7b : 8d f2 bf STA $bff2 ; (sstack + 0)
4f7e : a9 00 __ LDA #$00
4f80 : 8d f3 bf STA $bff3 ; (sstack + 1)
4f83 : 18 __ __ CLC
4f84 : a5 14 __ LDA P7 
4f86 : 69 01 __ ADC #$01
4f88 : 85 16 __ STA P9 
4f8a : a5 15 __ LDA P8 
4f8c : 69 00 __ ADC #$00
4f8e : 85 17 __ STA P10 
4f90 : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
4f93 : a5 50 __ LDA T8 + 0 
4f95 : 85 4c __ STA T4 + 0 
4f97 : 85 14 __ STA P7 
4f99 : 18 __ __ CLC
4f9a : 69 01 __ ADC #$01
4f9c : 85 16 __ STA P9 
4f9e : a5 51 __ LDA T8 + 1 
4fa0 : 85 4d __ STA T4 + 1 
4fa2 : 85 15 __ STA P8 
4fa4 : a5 4e __ LDA T6 + 0 
4fa6 : 8d f2 bf STA $bff2 ; (sstack + 0)
4fa9 : a9 00 __ LDA #$00
4fab : 8d f3 bf STA $bff3 ; (sstack + 1)
4fae : a5 15 __ LDA P8 
4fb0 : 69 00 __ ADC #$00
4fb2 : 85 17 __ STA P10 
4fb4 : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
4fb7 : e6 4a __ INC T3 + 0 
4fb9 : 4c f6 4e JMP $4ef6 ; (vdcwin_delete_char.l2 + 0)
--------------------------------------------------------------------
vdcwin_insert_char: ; vdcwin_insert_char(struct VDCWin*)->void
.s0:
4fbc : a9 00 __ LDA #$00
4fbe : 85 0d __ STA P0 
4fc0 : ad f4 bf LDA $bff4 ; (sstack + 2)
4fc3 : 85 45 __ STA T0 + 0 
4fc5 : ad f5 bf LDA $bff5 ; (sstack + 3)
4fc8 : 85 46 __ STA T0 + 1 
4fca : a0 03 __ LDY #$03
4fcc : b1 45 __ LDA (T0 + 0),y 
4fce : 38 __ __ SEC
4fcf : e9 01 __ SBC #$01
4fd1 : 85 0e __ STA P1 
4fd3 : 85 47 __ STA T1 + 0 
4fd5 : 88 __ __ DEY
4fd6 : b1 45 __ LDA (T0 + 0),y 
4fd8 : 38 __ __ SEC
4fd9 : e9 01 __ SBC #$01
4fdb : 85 4a __ STA T4 + 0 
4fdd : 20 6e 22 JSR $226e ; (vdc_coords.s0 + 0)
4fe0 : a0 06 __ LDY #$06
4fe2 : b1 45 __ LDA (T0 + 0),y 
4fe4 : 18 __ __ CLC
4fe5 : 65 1b __ ADC ACCU + 0 ; (win + 0)
4fe7 : 85 48 __ STA T2 + 0 
4fe9 : c8 __ __ INY
4fea : b1 45 __ LDA (T0 + 0),y 
4fec : 65 1c __ ADC ACCU + 1 ; (win + 1)
4fee : 85 49 __ STA T2 + 1 
4ff0 : 20 6e 22 JSR $226e ; (vdc_coords.s0 + 0)
4ff3 : a0 08 __ LDY #$08
4ff5 : b1 45 __ LDA (T0 + 0),y 
4ff7 : 18 __ __ CLC
4ff8 : 65 1b __ ADC ACCU + 0 ; (win + 0)
4ffa : 85 4b __ STA T5 + 0 
4ffc : c8 __ __ INY
4ffd : b1 45 __ LDA (T0 + 0),y 
4fff : 65 1c __ ADC ACCU + 1 ; (win + 1)
5001 : 85 4c __ STA T5 + 1 
.l1:
5003 : a0 05 __ LDY #$05
5005 : b1 45 __ LDA (T0 + 0),y 
5007 : c5 47 __ CMP T1 + 0 
5009 : b0 03 __ BCS $500e ; (vdcwin_insert_char.s3 + 0)
500b : 4c 67 51 JMP $5167 ; (vdcwin_insert_char.s2 + 0)
.s3:
500e : 88 __ __ DEY
500f : b1 45 __ LDA (T0 + 0),y 
5011 : 18 __ __ CLC
5012 : 65 48 __ ADC T2 + 0 
5014 : 85 48 __ STA T2 + 0 
5016 : 90 02 __ BCC $501a ; (vdcwin_insert_char.s1009 + 0)
.s1008:
5018 : e6 49 __ INC T2 + 1 
.s1009:
501a : 38 __ __ SEC
501b : a5 4a __ LDA T4 + 0 
501d : f1 45 __ SBC (T0 + 0),y 
501f : d0 0f __ BNE $5030 ; (vdcwin_insert_char.s9 + 0)
.s11:
5021 : a5 48 __ LDA T2 + 0 
5023 : 85 0d __ STA P0 
5025 : a5 49 __ LDA T2 + 1 
5027 : 85 0e __ STA P1 
5029 : a9 20 __ LDA #$20
502b : 85 0f __ STA P2 
502d : 4c 78 21 JMP $2178 ; (vdc_mem_write_at.s0 + 0)
.s9:
5030 : 85 4a __ STA T4 + 0 
5032 : 18 __ __ CLC
5033 : a5 48 __ LDA T2 + 0 
5035 : 69 01 __ ADC #$01
5037 : 85 4d __ STA T6 + 0 
5039 : a5 49 __ LDA T2 + 1 
503b : 69 00 __ ADC #$00
503d : 85 4e __ STA T6 + 1 
503f : b1 45 __ LDA (T0 + 0),y 
5041 : 18 __ __ CLC
5042 : 65 4b __ ADC T5 + 0 
5044 : 85 45 __ STA T0 + 0 
5046 : a9 00 __ LDA #$00
5048 : 65 4c __ ADC T5 + 1 
504a : 85 46 __ STA T0 + 1 
504c : 18 __ __ CLC
504d : a5 45 __ LDA T0 + 0 
504f : 69 01 __ ADC #$01
5051 : 85 4b __ STA T5 + 0 
5053 : a5 46 __ LDA T0 + 1 
5055 : 69 00 __ ADC #$00
5057 : 85 4c __ STA T5 + 1 
5059 : ad cc 6f LDA $6fcc ; (vdc_state + 1)
505c : d0 11 __ BNE $506f ; (vdcwin_insert_char.s14 + 0)
.s16:
505e : a9 03 __ LDA #$03
5060 : cd d8 6f CMP $6fd8 ; (vdc_state + 13)
5063 : d0 05 __ BNE $506a ; (vdcwin_insert_char.s1003 + 0)
.s1002:
5065 : a9 ff __ LDA #$ff
5067 : cd d7 6f CMP $6fd7 ; (vdc_state + 12)
.s1003:
506a : b0 03 __ BCS $506f ; (vdcwin_insert_char.s14 + 0)
506c : 4c ec 50 JMP $50ec ; (vdcwin_insert_char.s13 + 0)
.s14:
506f : a5 48 __ LDA T2 + 0 
5071 : 85 16 __ STA P9 
5073 : a5 49 __ LDA T2 + 1 
5075 : 85 17 __ STA P10 
5077 : ad d7 6f LDA $6fd7 ; (vdc_state + 12)
507a : 85 4f __ STA T7 + 0 
507c : 85 14 __ STA P7 
507e : ad d8 6f LDA $6fd8 ; (vdc_state + 13)
5081 : 85 50 __ STA T7 + 1 
5083 : 85 15 __ STA P8 
5085 : a5 4a __ LDA T4 + 0 
5087 : 8d f2 bf STA $bff2 ; (sstack + 0)
508a : a9 00 __ LDA #$00
508c : 8d f3 bf STA $bff3 ; (sstack + 1)
508f : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
5092 : a5 4d __ LDA T6 + 0 
5094 : 85 14 __ STA P7 
5096 : a5 4e __ LDA T6 + 1 
5098 : 85 15 __ STA P8 
509a : a5 4f __ LDA T7 + 0 
509c : 85 16 __ STA P9 
509e : a5 50 __ LDA T7 + 1 
50a0 : 85 17 __ STA P10 
50a2 : a5 4a __ LDA T4 + 0 
50a4 : 8d f2 bf STA $bff2 ; (sstack + 0)
50a7 : a9 00 __ LDA #$00
50a9 : 8d f3 bf STA $bff3 ; (sstack + 1)
50ac : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
50af : a5 16 __ LDA P9 
50b1 : 85 14 __ STA P7 
50b3 : a5 50 __ LDA T7 + 1 
50b5 : 85 15 __ STA P8 
50b7 : a5 45 __ LDA T0 + 0 
50b9 : 85 16 __ STA P9 
50bb : a5 46 __ LDA T0 + 1 
50bd : 85 17 __ STA P10 
50bf : a5 4a __ LDA T4 + 0 
50c1 : 8d f2 bf STA $bff2 ; (sstack + 0)
50c4 : a9 00 __ LDA #$00
50c6 : 8d f3 bf STA $bff3 ; (sstack + 1)
50c9 : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
50cc : a5 4b __ LDA T5 + 0 
50ce : 85 14 __ STA P7 
50d0 : a5 4c __ LDA T5 + 1 
50d2 : 85 15 __ STA P8 
50d4 : a5 4f __ LDA T7 + 0 
50d6 : 85 16 __ STA P9 
50d8 : a5 50 __ LDA T7 + 1 
50da : 85 17 __ STA P10 
50dc : a5 4a __ LDA T4 + 0 
50de : 8d f2 bf STA $bff2 ; (sstack + 0)
50e1 : a9 00 __ LDA #$00
50e3 : 8d f3 bf STA $bff3 ; (sstack + 1)
50e6 : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
50e9 : 4c 21 50 JMP $5021 ; (vdcwin_insert_char.s11 + 0)
.s13:
50ec : a9 0e __ LDA #$0e
50ee : 85 0f __ STA P2 
50f0 : a5 48 __ LDA T2 + 0 
50f2 : 85 12 __ STA P5 
50f4 : a5 49 __ LDA T2 + 1 
50f6 : 85 13 __ STA P6 
50f8 : a9 90 __ LDA #$90
50fa : 85 10 __ STA P3 
50fc : a9 71 __ LDA #$71
50fe : 85 11 __ STA P4 
5100 : a5 4a __ LDA T4 + 0 
5102 : 85 14 __ STA P7 
5104 : a9 00 __ LDA #$00
5106 : 85 15 __ STA P8 
5108 : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
510b : a5 4d __ LDA T6 + 0 
510d : 85 0f __ STA P2 
510f : a5 4e __ LDA T6 + 1 
5111 : 85 10 __ STA P3 
5113 : a9 0e __ LDA #$0e
5115 : 85 11 __ STA P4 
5117 : a9 90 __ LDA #$90
5119 : 85 12 __ STA P5 
511b : a9 71 __ LDA #$71
511d : 85 13 __ STA P6 
511f : a5 4a __ LDA T4 + 0 
5121 : 85 14 __ STA P7 
5123 : a9 00 __ LDA #$00
5125 : 85 15 __ STA P8 
5127 : 20 ed 13 JSR $13ed ; (bnk_cpytovdc.s0 + 0)
512a : a9 0e __ LDA #$0e
512c : 85 0f __ STA P2 
512e : a9 90 __ LDA #$90
5130 : 85 10 __ STA P3 
5132 : a9 71 __ LDA #$71
5134 : 85 11 __ STA P4 
5136 : a5 45 __ LDA T0 + 0 
5138 : 85 12 __ STA P5 
513a : a5 46 __ LDA T0 + 1 
513c : 85 13 __ STA P6 
513e : a9 00 __ LDA #$00
5140 : 85 15 __ STA P8 
5142 : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
5145 : a5 4b __ LDA T5 + 0 
5147 : 85 0f __ STA P2 
5149 : a5 4c __ LDA T5 + 1 
514b : 85 10 __ STA P3 
514d : a9 0e __ LDA #$0e
514f : 85 11 __ STA P4 
5151 : a9 90 __ LDA #$90
5153 : 85 12 __ STA P5 
5155 : a9 71 __ LDA #$71
5157 : 85 13 __ STA P6 
5159 : a5 4a __ LDA T4 + 0 
515b : 85 14 __ STA P7 
515d : a9 00 __ LDA #$00
515f : 85 15 __ STA P8 
5161 : 20 ed 13 JSR $13ed ; (bnk_cpytovdc.s0 + 0)
5164 : 4c 21 50 JMP $5021 ; (vdcwin_insert_char.s11 + 0)
.s2:
5167 : a5 48 __ LDA T2 + 0 
5169 : 69 01 __ ADC #$01
516b : 85 4d __ STA T6 + 0 
516d : a5 49 __ LDA T2 + 1 
516f : 69 00 __ ADC #$00
5171 : 85 4e __ STA T6 + 1 
5173 : 18 __ __ CLC
5174 : a5 4b __ LDA T5 + 0 
5176 : 69 01 __ ADC #$01
5178 : 85 4f __ STA T7 + 0 
517a : a5 4c __ LDA T5 + 1 
517c : 69 00 __ ADC #$00
517e : 85 50 __ STA T7 + 1 
5180 : ad cc 6f LDA $6fcc ; (vdc_state + 1)
5183 : d0 11 __ BNE $5196 ; (vdcwin_insert_char.s6 + 0)
.s8:
5185 : a9 03 __ LDA #$03
5187 : cd d8 6f CMP $6fd8 ; (vdc_state + 13)
518a : d0 05 __ BNE $5191 ; (vdcwin_insert_char.s1005 + 0)
.s1004:
518c : a9 ff __ LDA #$ff
518e : cd d7 6f CMP $6fd7 ; (vdc_state + 12)
.s1005:
5191 : b0 03 __ BCS $5196 ; (vdcwin_insert_char.s6 + 0)
5193 : 4c 13 52 JMP $5213 ; (vdcwin_insert_char.s5 + 0)
.s6:
5196 : a5 48 __ LDA T2 + 0 
5198 : 85 16 __ STA P9 
519a : a5 49 __ LDA T2 + 1 
519c : 85 17 __ STA P10 
519e : ad d7 6f LDA $6fd7 ; (vdc_state + 12)
51a1 : 85 51 __ STA T8 + 0 
51a3 : 85 14 __ STA P7 
51a5 : ad d8 6f LDA $6fd8 ; (vdc_state + 13)
51a8 : 85 52 __ STA T8 + 1 
51aa : 85 15 __ STA P8 
51ac : a5 4a __ LDA T4 + 0 
51ae : 8d f2 bf STA $bff2 ; (sstack + 0)
51b1 : a9 00 __ LDA #$00
51b3 : 8d f3 bf STA $bff3 ; (sstack + 1)
51b6 : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
51b9 : a5 4d __ LDA T6 + 0 
51bb : 85 14 __ STA P7 
51bd : a5 4e __ LDA T6 + 1 
51bf : 85 15 __ STA P8 
51c1 : a5 51 __ LDA T8 + 0 
51c3 : 85 16 __ STA P9 
51c5 : a5 52 __ LDA T8 + 1 
51c7 : 85 17 __ STA P10 
51c9 : a5 4a __ LDA T4 + 0 
51cb : 8d f2 bf STA $bff2 ; (sstack + 0)
51ce : a9 00 __ LDA #$00
51d0 : 8d f3 bf STA $bff3 ; (sstack + 1)
51d3 : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
51d6 : a5 16 __ LDA P9 
51d8 : 85 14 __ STA P7 
51da : a5 52 __ LDA T8 + 1 
51dc : 85 15 __ STA P8 
51de : a5 4b __ LDA T5 + 0 
51e0 : 85 16 __ STA P9 
51e2 : a5 4c __ LDA T5 + 1 
51e4 : 85 17 __ STA P10 
51e6 : a5 4a __ LDA T4 + 0 
51e8 : 8d f2 bf STA $bff2 ; (sstack + 0)
51eb : a9 00 __ LDA #$00
51ed : 8d f3 bf STA $bff3 ; (sstack + 1)
51f0 : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
51f3 : a5 4f __ LDA T7 + 0 
51f5 : 85 14 __ STA P7 
51f7 : a5 50 __ LDA T7 + 1 
51f9 : 85 15 __ STA P8 
51fb : a5 51 __ LDA T8 + 0 
51fd : 85 16 __ STA P9 
51ff : a5 52 __ LDA T8 + 1 
5201 : 85 17 __ STA P10 
5203 : a5 4a __ LDA T4 + 0 
5205 : 8d f2 bf STA $bff2 ; (sstack + 0)
5208 : a9 00 __ LDA #$00
520a : 8d f3 bf STA $bff3 ; (sstack + 1)
520d : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
5210 : 4c 8b 52 JMP $528b ; (vdcwin_insert_char.s4 + 0)
.s5:
5213 : a9 0e __ LDA #$0e
5215 : 85 0f __ STA P2 
5217 : a5 48 __ LDA T2 + 0 
5219 : 85 12 __ STA P5 
521b : a5 49 __ LDA T2 + 1 
521d : 85 13 __ STA P6 
521f : a9 90 __ LDA #$90
5221 : 85 10 __ STA P3 
5223 : a9 71 __ LDA #$71
5225 : 85 11 __ STA P4 
5227 : a5 4a __ LDA T4 + 0 
5229 : 85 14 __ STA P7 
522b : a9 00 __ LDA #$00
522d : 85 15 __ STA P8 
522f : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
5232 : a5 4d __ LDA T6 + 0 
5234 : 85 0f __ STA P2 
5236 : a5 4e __ LDA T6 + 1 
5238 : 85 10 __ STA P3 
523a : a9 0e __ LDA #$0e
523c : 85 11 __ STA P4 
523e : a9 90 __ LDA #$90
5240 : 85 12 __ STA P5 
5242 : a9 71 __ LDA #$71
5244 : 85 13 __ STA P6 
5246 : a5 4a __ LDA T4 + 0 
5248 : 85 14 __ STA P7 
524a : a9 00 __ LDA #$00
524c : 85 15 __ STA P8 
524e : 20 ed 13 JSR $13ed ; (bnk_cpytovdc.s0 + 0)
5251 : a9 0e __ LDA #$0e
5253 : 85 0f __ STA P2 
5255 : a9 90 __ LDA #$90
5257 : 85 10 __ STA P3 
5259 : a9 71 __ LDA #$71
525b : 85 11 __ STA P4 
525d : a5 4b __ LDA T5 + 0 
525f : 85 12 __ STA P5 
5261 : a5 4c __ LDA T5 + 1 
5263 : 85 13 __ STA P6 
5265 : a9 00 __ LDA #$00
5267 : 85 15 __ STA P8 
5269 : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
526c : a5 4f __ LDA T7 + 0 
526e : 85 0f __ STA P2 
5270 : a5 50 __ LDA T7 + 1 
5272 : 85 10 __ STA P3 
5274 : a9 0e __ LDA #$0e
5276 : 85 11 __ STA P4 
5278 : a9 90 __ LDA #$90
527a : 85 12 __ STA P5 
527c : a9 71 __ LDA #$71
527e : 85 13 __ STA P6 
5280 : a5 4a __ LDA T4 + 0 
5282 : 85 14 __ STA P7 
5284 : a9 00 __ LDA #$00
5286 : 85 15 __ STA P8 
5288 : 20 ed 13 JSR $13ed ; (bnk_cpytovdc.s0 + 0)
.s4:
528b : ad ce 6f LDA $6fce ; (vdc_state + 3)
528e : 85 4d __ STA T6 + 0 
5290 : ad cf 6f LDA $6fcf ; (vdc_state + 4)
5293 : 85 4e __ STA T6 + 1 
5295 : 38 __ __ SEC
5296 : a5 48 __ LDA T2 + 0 
5298 : e5 4d __ SBC T6 + 0 
529a : 85 48 __ STA T2 + 0 
529c : a5 49 __ LDA T2 + 1 
529e : e5 4e __ SBC T6 + 1 
52a0 : 85 49 __ STA T2 + 1 
52a2 : 18 __ __ CLC
52a3 : a5 4a __ LDA T4 + 0 
52a5 : 65 48 __ ADC T2 + 0 
52a7 : 85 0d __ STA P0 
52a9 : a9 00 __ LDA #$00
52ab : 65 49 __ ADC T2 + 1 
52ad : 85 0e __ STA P1 
52af : 20 a6 21 JSR $21a6 ; (vdc_mem_read_at.s0 + 0)
52b2 : 85 0f __ STA P2 
52b4 : 18 __ __ CLC
52b5 : a5 48 __ LDA T2 + 0 
52b7 : 65 4d __ ADC T6 + 0 
52b9 : 85 0d __ STA P0 
52bb : a5 49 __ LDA T2 + 1 
52bd : 65 4e __ ADC T6 + 1 
52bf : 85 0e __ STA P1 
52c1 : 20 78 21 JSR $2178 ; (vdc_mem_write_at.s0 + 0)
52c4 : 38 __ __ SEC
52c5 : a5 4b __ LDA T5 + 0 
52c7 : e5 4d __ SBC T6 + 0 
52c9 : 85 4b __ STA T5 + 0 
52cb : a5 4c __ LDA T5 + 1 
52cd : e5 4e __ SBC T6 + 1 
52cf : 85 4c __ STA T5 + 1 
52d1 : 18 __ __ CLC
52d2 : a5 4b __ LDA T5 + 0 
52d4 : 65 4a __ ADC T4 + 0 
52d6 : 85 0d __ STA P0 
52d8 : a5 4c __ LDA T5 + 1 
52da : 69 00 __ ADC #$00
52dc : 85 0e __ STA P1 
52de : 20 a6 21 JSR $21a6 ; (vdc_mem_read_at.s0 + 0)
52e1 : 85 0f __ STA P2 
52e3 : 18 __ __ CLC
52e4 : a5 4b __ LDA T5 + 0 
52e6 : 65 4d __ ADC T6 + 0 
52e8 : 85 0d __ STA P0 
52ea : a5 4c __ LDA T5 + 1 
52ec : 65 4e __ ADC T6 + 1 
52ee : 85 0e __ STA P1 
52f0 : 20 78 21 JSR $2178 ; (vdc_mem_write_at.s0 + 0)
52f3 : c6 47 __ DEC T1 + 0 
52f5 : 4c 03 50 JMP $5003 ; (vdcwin_insert_char.l1 + 0)
--------------------------------------------------------------------
vdcwin_get_rect: ; vdcwin_get_rect(struct VDCWin*,u8,u8,u8,u8,u8,u8*)->void
.s0:
52f8 : a5 13 __ LDA P6 ; (x + 0)
52fa : 85 0d __ STA P0 
52fc : a5 14 __ LDA P7 ; (y + 0)
52fe : 85 0e __ STA P1 
5300 : 20 6e 22 JSR $226e ; (vdc_coords.s0 + 0)
5303 : a5 16 __ LDA P9 ; (h + 0)
5305 : d0 01 __ BNE $5308 ; (vdcwin_get_rect.s12 + 0)
5307 : 60 __ __ RTS
.s12:
5308 : a5 15 __ LDA P8 ; (w + 0)
530a : c9 01 __ CMP #$01
530c : a9 00 __ LDA #$00
530e : 85 48 __ STA T4 + 0 
5310 : 2a __ __ ROL
5311 : 85 45 __ STA T2 + 0 
5313 : a0 06 __ LDY #$06
5315 : b1 11 __ LDA (P4),y ; (win + 0)
5317 : 65 1b __ ADC ACCU + 0 
5319 : 85 43 __ STA T1 + 0 
531b : c8 __ __ INY
531c : b1 11 __ LDA (P4),y ; (win + 0)
531e : 65 1c __ ADC ACCU + 1 
5320 : 85 44 __ STA T1 + 1 
5322 : a5 45 __ LDA T2 + 0 
5324 : d0 2b __ BNE $5351 ; (vdcwin_get_rect.l11 + 0)
.s1011:
5326 : a8 __ __ TAY
5327 : aa __ __ TAX
.l8:
5328 : ad f2 bf LDA $bff2 ; (sstack + 0)
532b : 18 __ __ CLC
532c : 65 15 __ ADC P8 ; (w + 0)
532e : 8d f2 bf STA $bff2 ; (sstack + 0)
5331 : 90 03 __ BCC $5336 ; (vdcwin_get_rect.s1018 + 0)
.s1017:
5333 : ee f3 bf INC $bff3 ; (sstack + 1)
.s1018:
5336 : ad ce 6f LDA $6fce ; (vdc_state + 3)
5339 : 18 __ __ CLC
533a : 65 43 __ ADC T1 + 0 
533c : 85 43 __ STA T1 + 0 
533e : ad cf 6f LDA $6fcf ; (vdc_state + 4)
5341 : 65 44 __ ADC T1 + 1 
5343 : e8 __ __ INX
5344 : e4 16 __ CPX P9 ; (h + 0)
5346 : b0 54 __ BCS $539c ; (vdcwin_get_rect.s1001 + 0)
.s2:
5348 : 85 44 __ STA T1 + 1 
534a : 98 __ __ TYA
534b : f0 db __ BEQ $5328 ; (vdcwin_get_rect.l8 + 0)
.s1009:
534d : 86 48 __ STX T4 + 0 
534f : 85 45 __ STA T2 + 0 
.l11:
5351 : ad f2 bf LDA $bff2 ; (sstack + 0)
5354 : 85 46 __ STA T3 + 0 
5356 : ad f3 bf LDA $bff3 ; (sstack + 1)
5359 : 85 47 __ STA T3 + 1 
535b : a9 00 __ LDA #$00
535d : 85 49 __ STA T5 + 0 
535f : 18 __ __ CLC
.l1015:
5360 : 65 43 __ ADC T1 + 0 
5362 : 85 0d __ STA P0 
5364 : a9 00 __ LDA #$00
5366 : 65 44 __ ADC T1 + 1 
5368 : 85 0e __ STA P1 
536a : 20 a6 21 JSR $21a6 ; (vdc_mem_read_at.s0 + 0)
536d : a8 __ __ TAY
536e : 4a __ __ LSR
536f : 4a __ __ LSR
5370 : 4a __ __ LSR
5371 : 4a __ __ LSR
5372 : 4a __ __ LSR
5373 : aa __ __ TAX
5374 : a5 17 __ LDA P10 ; (cr + 0)
5376 : 85 0d __ STA P0 
5378 : 18 __ __ CLC
5379 : a5 46 __ LDA T3 + 0 
537b : 65 49 __ ADC T5 + 0 
537d : 85 0e __ STA P1 
537f : a5 47 __ LDA T3 + 1 
5381 : 69 00 __ ADC #$00
5383 : 85 0f __ STA P2 
5385 : 98 __ __ TYA
5386 : 5d f6 6b EOR $6bf6,x ; (s2pmap + 0)
5389 : 85 10 __ STA P3 
538b : 20 96 14 JSR $1496 ; (bnk_writeb.s0 + 0)
538e : e6 49 __ INC T5 + 0 
5390 : a5 49 __ LDA T5 + 0 
5392 : c5 15 __ CMP P8 ; (w + 0)
5394 : 90 ca __ BCC $5360 ; (vdcwin_get_rect.l1015 + 0)
.s1010:
5396 : a6 48 __ LDX T4 + 0 
5398 : a4 45 __ LDY T2 + 0 
539a : b0 8c __ BCS $5328 ; (vdcwin_get_rect.l8 + 0)
.s1001:
539c : 60 __ __ RTS
--------------------------------------------------------------------
539d : __ __ __ BYT 65 4e 54 45 52 45 44 20 53 54 52 49 4e 47 20 46 : eNTERED STRING F
53ad : __ __ __ BYT 4f 52 4d 41 54 54 45 44 20 57 49 54 48 20 57 4f : ORMATTED WITH WO
53bd : __ __ __ BYT 52 44 20 57 52 41 50 3a 00                      : RD WRAP:.
--------------------------------------------------------------------
viewport_demo: ; viewport_demo(u8)->void
.s1000:
53c6 : a2 03 __ LDX #$03
53c8 : b5 53 __ LDA T0 + 0,x 
53ca : 9d a0 bf STA $bfa0,x ; (bigfont + 145)
53cd : ca __ __ DEX
53ce : 10 f8 __ BPL $53c8 ; (viewport_demo.s1000 + 2)
.s0:
53d0 : a9 00 __ LDA #$00
53d2 : 8d fb bf STA $bffb ; (sstack + 9)
53d5 : 8d fc bf STA $bffc ; (sstack + 10)
53d8 : ad fe bf LDA $bffe ; (sstack + 12)
53db : 85 53 __ STA T0 + 0 
53dd : 8d fa bf STA $bffa ; (sstack + 8)
53e0 : 20 74 55 JSR $5574 ; (screen_switch.s1000 + 0)
53e3 : a5 1b __ LDA ACCU + 0 
53e5 : d0 0b __ BNE $53f2 ; (viewport_demo.s3 + 0)
.s1001:
53e7 : a2 03 __ LDX #$03
53e9 : bd a0 bf LDA $bfa0,x ; (bigfont + 145)
53ec : 95 53 __ STA T0 + 0,x 
53ee : ca __ __ DEX
53ef : 10 f8 __ BPL $53e9 ; (viewport_demo.s1001 + 2)
53f1 : 60 __ __ RTS
.s3:
53f2 : a9 00 __ LDA #$00
53f4 : 85 18 __ STA P11 
53f6 : a9 03 __ LDA #$03
53f8 : 8d f2 bf STA $bff2 ; (sstack + 0)
53fb : a9 44 __ LDA #$44
53fd : 8d f3 bf STA $bff3 ; (sstack + 1)
5400 : a9 57 __ LDA #$57
5402 : 8d f4 bf STA $bff4 ; (sstack + 2)
5405 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
5408 : a9 05 __ LDA #$05
540a : 85 11 __ STA P4 
540c : 85 12 __ STA P5 
540e : a9 46 __ LDA #$46
5410 : 85 13 __ STA P6 
5412 : a9 bc __ LDA #$bc
5414 : 85 0f __ STA P2 
5416 : a9 bf __ LDA #$bf
5418 : 85 10 __ STA P3 
541a : ad d0 6f LDA $6fd0 ; (vdc_state + 5)
541d : 38 __ __ SEC
541e : e9 07 __ SBC #$07
5420 : 85 54 __ STA T3 + 0 
5422 : 85 14 __ STA P7 
5424 : ad d1 6f LDA $6fd1 ; (vdc_state + 6)
5427 : e9 00 __ SBC #$00
5429 : 85 55 __ STA T3 + 1 
542b : 20 bb 32 JSR $32bb ; (vdcwin_init.s0 + 0)
542e : a9 bc __ LDA #$bc
5430 : 8d f2 bf STA $bff2 ; (sstack + 0)
5433 : a9 bf __ LDA #$bf
5435 : 8d f3 bf STA $bff3 ; (sstack + 1)
5438 : a9 f0 __ LDA #$f0
543a : 8d f4 bf STA $bff4 ; (sstack + 2)
543d : 20 0c 33 JSR $330c ; (vdcwin_border_clear.s0 + 0)
5440 : a9 7f __ LDA #$7f
5442 : 85 17 __ STA P10 
5444 : a9 46 __ LDA #$46
5446 : 8d f8 bf STA $bff8 ; (sstack + 6)
5449 : a5 54 __ LDA T3 + 0 
544b : 8d fa bf STA $bffa ; (sstack + 8)
544e : a5 55 __ LDA T3 + 1 
5450 : 8d fb bf STA $bffb ; (sstack + 9)
5453 : a9 05 __ LDA #$05
5455 : 8d fc bf STA $bffc ; (sstack + 10)
5458 : 8d fd bf STA $bffd ; (sstack + 11)
545b : a9 a7 __ LDA #$a7
545d : 85 15 __ STA P8 
545f : a9 bf __ LDA #$bf
5461 : 85 16 __ STA P9 
5463 : a9 00 __ LDA #$00
5465 : 8d f9 bf STA $bff9 ; (sstack + 7)
5468 : 8d f2 bf STA $bff2 ; (sstack + 0)
546b : a9 40 __ LDA #$40
546d : 8d f3 bf STA $bff3 ; (sstack + 1)
5470 : a5 53 __ LDA T0 + 0 
5472 : 0a __ __ ASL
5473 : 85 54 __ STA T3 + 0 
5475 : 85 56 __ STA T4 + 0 
5477 : aa __ __ TAX
5478 : bd b8 6f LDA $6fb8,x ; (screenset + 0)
547b : 8d f4 bf STA $bff4 ; (sstack + 2)
547e : bd b9 6f LDA $6fb9,x ; (screenset + 1)
5481 : 8d f6 bf STA $bff6 ; (sstack + 4)
5484 : a9 00 __ LDA #$00
5486 : 8d f5 bf STA $bff5 ; (sstack + 3)
5489 : 8d f7 bf STA $bff7 ; (sstack + 5)
548c : 20 d4 37 JSR $37d4 ; (vdcwin_viewport_init.s0 + 0)
548f : a9 a7 __ LDA #$a7
5491 : 85 16 __ STA P9 
5493 : a9 bf __ LDA #$bf
5495 : 85 17 __ STA P10 
5497 : 20 f5 38 JSR $38f5 ; (vdcwin_cpy_viewport.s0 + 0)
.l5:
549a : 20 3b 2a JSR $2a3b ; (getch.s0 + 0)
549d : 85 53 __ STA T0 + 0 
549f : a9 00 __ LDA #$00
54a1 : 85 43 __ STA T1 + 0 
54a3 : a5 53 __ LDA T0 + 0 
54a5 : c9 57 __ CMP #$57
54a7 : f0 04 __ BEQ $54ad ; (viewport_demo.s10 + 0)
.s11:
54a9 : c9 91 __ CMP #$91
54ab : d0 11 __ BNE $54be ; (viewport_demo.s9 + 0)
.s10:
54ad : ad b0 bf LDA $bfb0 ; (bigfont + 161)
54b0 : 0d b1 bf ORA $bfb1 ; (bigfont + 162)
54b3 : f0 09 __ BEQ $54be ; (viewport_demo.s9 + 0)
.s7:
54b5 : a9 08 __ LDA #$08
54b7 : 85 43 __ STA T1 + 0 
54b9 : a5 53 __ LDA T0 + 0 
54bb : 4c c4 54 JMP $54c4 ; (viewport_demo.s16 + 0)
.s9:
54be : a5 53 __ LDA T0 + 0 
54c0 : c9 53 __ CMP #$53
54c2 : f0 04 __ BEQ $54c8 ; (viewport_demo.s15 + 0)
.s16:
54c4 : c9 11 __ CMP #$11
54c6 : d0 2f __ BNE $54f7 ; (viewport_demo.s14 + 0)
.s15:
54c8 : a6 54 __ LDX T3 + 0 
54ca : bd b9 6f LDA $6fb9,x ; (screenset + 1)
54cd : 38 __ __ SEC
54ce : ed d0 6f SBC $6fd0 ; (vdc_state + 5)
54d1 : a8 __ __ TAY
54d2 : a9 00 __ LDA #$00
54d4 : ed d1 6f SBC $6fd1 ; (vdc_state + 6)
54d7 : aa __ __ TAX
54d8 : 98 __ __ TYA
54d9 : 18 __ __ CLC
54da : 69 06 __ ADC #$06
54dc : 85 1b __ STA ACCU + 0 
54de : 90 01 __ BCC $54e1 ; (viewport_demo.s1027 + 0)
.s1026:
54e0 : e8 __ __ INX
.s1027:
54e1 : 86 1c __ STX ACCU + 1 
54e3 : ad b1 bf LDA $bfb1 ; (bigfont + 162)
54e6 : c5 1c __ CMP ACCU + 1 
54e8 : d0 05 __ BNE $54ef ; (viewport_demo.s1017 + 0)
.s1016:
54ea : ad b0 bf LDA $bfb0 ; (bigfont + 161)
54ed : c5 1b __ CMP ACCU + 0 
.s1017:
54ef : b0 06 __ BCS $54f7 ; (viewport_demo.s14 + 0)
.s12:
54f1 : a5 43 __ LDA T1 + 0 
54f3 : 09 04 __ ORA #$04
54f5 : 85 43 __ STA T1 + 0 
.s14:
54f7 : a5 53 __ LDA T0 + 0 
54f9 : c9 41 __ CMP #$41
54fb : f0 04 __ BEQ $5501 ; (viewport_demo.s20 + 0)
.s21:
54fd : c9 9d __ CMP #$9d
54ff : d0 0e __ BNE $550f ; (viewport_demo.s19 + 0)
.s20:
5501 : ad ae bf LDA $bfae ; (bigfont + 159)
5504 : 0d af bf ORA $bfaf ; (bigfont + 160)
5507 : f0 06 __ BEQ $550f ; (viewport_demo.s19 + 0)
.s17:
5509 : a5 43 __ LDA T1 + 0 
550b : 09 01 __ ORA #$01
550d : 85 43 __ STA T1 + 0 
.s19:
550f : a5 53 __ LDA T0 + 0 
5511 : c9 44 __ CMP #$44
5513 : f0 04 __ BEQ $5519 ; (viewport_demo.s25 + 0)
.s26:
5515 : c9 1d __ CMP #$1d
5517 : d0 24 __ BNE $553d ; (viewport_demo.s24 + 0)
.s25:
5519 : a6 56 __ LDX T4 + 0 
551b : bd b8 6f LDA $6fb8,x ; (screenset + 0)
551e : 38 __ __ SEC
551f : e9 47 __ SBC #$47
5521 : 85 1b __ STA ACCU + 0 
5523 : a9 00 __ LDA #$00
5525 : e9 00 __ SBC #$00
5527 : 85 1c __ STA ACCU + 1 
5529 : ad af bf LDA $bfaf ; (bigfont + 160)
552c : c5 1c __ CMP ACCU + 1 
552e : d0 05 __ BNE $5535 ; (viewport_demo.s1007 + 0)
.s1006:
5530 : ad ae bf LDA $bfae ; (bigfont + 159)
5533 : c5 1b __ CMP ACCU + 0 
.s1007:
5535 : b0 06 __ BCS $553d ; (viewport_demo.s24 + 0)
.s22:
5537 : a5 43 __ LDA T1 + 0 
5539 : 09 02 __ ORA #$02
553b : 90 04 __ BCC $5541 ; (viewport_demo.s27 + 0)
.s24:
553d : a5 43 __ LDA T1 + 0 
553f : f0 10 __ BEQ $5551 ; (viewport_demo.s29 + 0)
.s27:
5541 : 8d f9 bf STA $bff9 ; (sstack + 7)
5544 : a9 a7 __ LDA #$a7
5546 : 8d f7 bf STA $bff7 ; (sstack + 5)
5549 : a9 bf __ LDA #$bf
554b : 8d f8 bf STA $bff8 ; (sstack + 6)
554e : 20 79 57 JSR $5779 ; (vdcwin_viewportscroll.s1000 + 0)
.s29:
5551 : a5 53 __ LDA T0 + 0 
5553 : c9 1b __ CMP #$1b
5555 : f0 07 __ BEQ $555e ; (viewport_demo.s6 + 0)
.s30:
5557 : c9 03 __ CMP #$03
5559 : f0 03 __ BEQ $555e ; (viewport_demo.s6 + 0)
555b : 4c 9a 54 JMP $549a ; (viewport_demo.l5 + 0)
.s6:
555e : a9 01 __ LDA #$01
5560 : 8d fb bf STA $bffb ; (sstack + 9)
5563 : a9 00 __ LDA #$00
5565 : 8d fc bf STA $bffc ; (sstack + 10)
5568 : ad fe bf LDA $bffe ; (sstack + 12)
556b : 8d fa bf STA $bffa ; (sstack + 8)
556e : 20 74 55 JSR $5574 ; (screen_switch.s1000 + 0)
5571 : 4c e7 53 JMP $53e7 ; (viewport_demo.s1001 + 0)
--------------------------------------------------------------------
screen_switch: ; screen_switch(u8,u8,u8)->u8
.s1000:
5574 : a5 53 __ LDA T1 + 0 
5576 : 8d d0 bf STA $bfd0 ; (bigfont + 193)
5579 : a5 54 __ LDA T2 + 0 
557b : 8d d1 bf STA $bfd1 ; (bigfont + 194)
557e : a5 55 __ LDA T3 + 0 
5580 : 8d d2 bf STA $bfd2 ; (bigfont + 195)
.s0:
5583 : a9 00 __ LDA #$00
5585 : 85 18 __ STA P11 
5587 : a9 02 __ LDA #$02
5589 : 8d f2 bf STA $bff2 ; (sstack + 0)
558c : a9 20 __ LDA #$20
558e : 8d f3 bf STA $bff3 ; (sstack + 1)
5591 : a9 50 __ LDA #$50
5593 : 8d f4 bf STA $bff4 ; (sstack + 2)
5596 : ae d0 6f LDX $6fd0 ; (vdc_state + 5)
5599 : ca __ __ DEX
559a : ca __ __ DEX
559b : 8e f5 bf STX $bff5 ; (sstack + 3)
559e : 20 ed 21 JSR $21ed ; (vdc_clear.s0 + 0)
55a1 : a9 03 __ LDA #$03
55a3 : 8d f2 bf STA $bff2 ; (sstack + 0)
55a6 : a9 ad __ LDA #$ad
55a8 : 8d f3 bf STA $bff3 ; (sstack + 1)
55ab : a9 56 __ LDA #$56
55ad : 8d f4 bf STA $bff4 ; (sstack + 2)
55b0 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
55b3 : a9 01 __ LDA #$01
55b5 : 85 53 __ STA T1 + 0 
55b7 : a9 00 __ LDA #$00
55b9 : cd fa bf CMP $bffa ; (sstack + 8)
55bc : 2a __ __ ROL
55bd : 85 55 __ STA T3 + 0 
55bf : d0 0a __ BNE $55cb ; (screen_switch.s1 + 0)
.s4:
55c1 : ad fa bf LDA $bffa ; (sstack + 8)
55c4 : c9 02 __ CMP #$02
55c6 : f0 03 __ BEQ $55cb ; (screen_switch.s1 + 0)
55c8 : 4c 4c 56 JMP $564c ; (screen_switch.s3 + 0)
.s1:
55cb : 20 a8 14 JSR $14a8 ; (sid_pausemusic.s0 + 0)
55ce : a9 01 __ LDA #$01
55d0 : 85 10 __ STA P3 
55d2 : ad fc 6a LDA $6afc ; (bootdevice + 0)
55d5 : 85 54 __ STA T2 + 0 
55d7 : 85 0f __ STA P2 
55d9 : a9 00 __ LDA #$00
55db : 85 11 __ STA P4 
55dd : a9 40 __ LDA #$40
55df : 85 12 __ STA P5 
55e1 : ad fb bf LDA $bffb ; (sstack + 9)
55e4 : f0 07 __ BEQ $55ed ; (screen_switch.s6 + 0)
.s5:
55e6 : a9 2f __ LDA #$2f
55e8 : a0 f1 __ LDY #$f1
55ea : 4c 32 56 JMP $5632 ; (screen_switch.s29 + 0)
.s6:
55ed : a5 55 __ LDA T3 + 0 
55ef : f0 03 __ BEQ $55f4 ; (screen_switch.s12 + 0)
55f1 : 4c 7b 56 JMP $567b ; (screen_switch.s11 + 0)
.s12:
55f4 : a9 ca __ LDA #$ca
55f6 : 85 13 __ STA P6 
55f8 : a9 56 __ LDA #$56
55fa : 85 14 __ STA P7 
55fc : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
55ff : a5 1b __ LDA ACCU + 0 
5601 : d0 05 __ BNE $5608 ; (screen_switch.s22 + 0)
.s20:
5603 : 20 2f 30 JSR $302f ; (menu_fileerrormessage.s1000 + 0)
5606 : c6 53 __ DEC T1 + 0 
.s22:
5608 : a9 00 __ LDA #$00
560a : 85 18 __ STA P11 
560c : a9 04 __ LDA #$04
560e : 8d f2 bf STA $bff2 ; (sstack + 0)
5611 : a9 d2 __ LDA #$d2
5613 : 8d f3 bf STA $bff3 ; (sstack + 1)
5616 : a9 56 __ LDA #$56
5618 : 8d f4 bf STA $bff4 ; (sstack + 2)
561b : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
561e : a5 54 __ LDA T2 + 0 
5620 : 85 0f __ STA P2 
5622 : a9 01 __ LDA #$01
5624 : 85 10 __ STA P3 
5626 : a9 00 __ LDA #$00
5628 : 85 11 __ STA P4 
562a : a9 a0 __ LDA #$a0
562c : 85 12 __ STA P5 
562e : a9 56 __ LDA #$56
5630 : a0 e3 __ LDY #$e3
.s29:
5632 : 84 13 __ STY P6 
5634 : 85 14 __ STA P7 
5636 : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
5639 : a5 1b __ LDA ACCU + 0 
563b : d0 0c __ BNE $5649 ; (screen_switch.s35 + 0)
.s8:
563d : 20 2f 30 JSR $302f ; (menu_fileerrormessage.s1000 + 0)
5640 : 20 a8 14 JSR $14a8 ; (sid_pausemusic.s0 + 0)
5643 : a9 00 __ LDA #$00
5645 : 85 53 __ STA T1 + 0 
5647 : f0 03 __ BEQ $564c ; (screen_switch.s3 + 0)
.s35:
5649 : 20 a8 14 JSR $14a8 ; (sid_pausemusic.s0 + 0)
.s3:
564c : a9 00 __ LDA #$00
564e : 85 18 __ STA P11 
5650 : a9 03 __ LDA #$03
5652 : 8d f2 bf STA $bff2 ; (sstack + 0)
5655 : a9 20 __ LDA #$20
5657 : 8d f3 bf STA $bff3 ; (sstack + 1)
565a : a9 50 __ LDA #$50
565c : 8d f4 bf STA $bff4 ; (sstack + 2)
565f : a9 02 __ LDA #$02
5661 : 8d f5 bf STA $bff5 ; (sstack + 3)
5664 : 20 ed 21 JSR $21ed ; (vdc_clear.s0 + 0)
5667 : a5 53 __ LDA T1 + 0 
5669 : 85 1b __ STA ACCU + 0 
.s1001:
566b : ad d0 bf LDA $bfd0 ; (bigfont + 193)
566e : 85 53 __ STA T1 + 0 
5670 : ad d1 bf LDA $bfd1 ; (bigfont + 194)
5673 : 85 54 __ STA T2 + 0 
5675 : ad d2 bf LDA $bfd2 ; (bigfont + 195)
5678 : 85 55 __ STA T3 + 0 
567a : 60 __ __ RTS
.s11:
567b : a9 c2 __ LDA #$c2
567d : 85 13 __ STA P6 
567f : a9 56 __ LDA #$56
5681 : 85 14 __ STA P7 
5683 : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
5686 : a5 1b __ LDA ACCU + 0 
5688 : d0 05 __ BNE $568f ; (screen_switch.s31 + 0)
.s14:
568a : 20 2f 30 JSR $302f ; (menu_fileerrormessage.s1000 + 0)
568d : c6 53 __ DEC T1 + 0 
.s31:
568f : ad fc bf LDA $bffc ; (sstack + 10)
5692 : d0 b5 __ BNE $5649 ; (screen_switch.s35 + 0)
.s17:
5694 : 85 18 __ STA P11 
5696 : ae d0 6f LDX $6fd0 ; (vdc_state + 5)
5699 : ca __ __ DEX
569a : 8e f2 bf STX $bff2 ; (sstack + 0)
569d : a9 00 __ LDA #$00
569f : 8d f3 bf STA $bff3 ; (sstack + 1)
56a2 : a9 57 __ LDA #$57
56a4 : 8d f4 bf STA $bff4 ; (sstack + 2)
56a7 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
56aa : 4c 49 56 JMP $5649 ; (screen_switch.s35 + 0)
--------------------------------------------------------------------
56ad : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 53 43 52 45 45 4e 20 44 : lOADING SCREEN D
56bd : __ __ __ BYT 41 54 41 2e 00                                  : ATA..
--------------------------------------------------------------------
56c2 : __ __ __ BYT 53 43 52 45 45 4e 31 00                         : SCREEN1.
--------------------------------------------------------------------
56ca : __ __ __ BYT 53 43 52 45 45 4e 33 00                         : SCREEN3.
--------------------------------------------------------------------
56d2 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 43 48 41 52 53 45 54 2e : lOADING CHARSET.
56e2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
56e3 : __ __ __ BYT 43 48 41 52 53 31 00                            : CHARS1.
--------------------------------------------------------------------
56ea : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 44 41 54 41 2e 00       : lOADING DATA..
--------------------------------------------------------------------
56f8 : __ __ __ BYT 43 48 41 52 53 32 00                            : CHARS2.
--------------------------------------------------------------------
giocharmap:
56ff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
5700 : __ __ __ BYT 70 45 54 53 43 49 49 20 41 52 54 20 43 52 45 44 : pETSCII ART CRED
5710 : __ __ __ BYT 49 54 3a 20 27 6c 4f 56 45 20 49 53 20 54 48 45 : IT: 'lOVE IS THE
5720 : __ __ __ BYT 20 44 52 55 47 27 20 61 54 4c 41 4e 54 49 53 2c :  DRUG' aTLANTIS,
5730 : __ __ __ BYT 20 32 30 32 33 2c 20 61 52 54 20 42 59 20 6c 4f :  2023, aRT BY lO
5740 : __ __ __ BYT 42 4f 2e 00                                     : BO..
--------------------------------------------------------------------
5744 : __ __ __ BYT 6d 4f 56 45 20 42 59 20 77 2c 61 2c 73 2c 64 20 : mOVE BY w,a,s,d 
5754 : __ __ __ BYT 4f 52 20 43 55 52 53 4f 52 20 4b 45 59 53 2e 20 : OR CURSOR KEYS. 
5764 : __ __ __ BYT 65 73 63 20 4f 52 20 73 74 6f 70 20 54 4f 20 45 : esc OR stop TO E
5774 : __ __ __ BYT 58 49 54 2e 00                                  : XIT..
--------------------------------------------------------------------
vdcwin_viewportscroll: ; vdcwin_viewportscroll(struct VDCViewport*,u8)->void
.s1000:
5779 : a5 53 __ LDA T0 + 0 
577b : 8d c6 bf STA $bfc6 ; (bigfont + 183)
577e : a5 54 __ LDA T0 + 1 
5780 : 8d c7 bf STA $bfc7 ; (bigfont + 184)
5783 : a5 55 __ LDA T2 + 0 
5785 : 8d c8 bf STA $bfc8 ; (bigfont + 185)
.s0:
5788 : ad f7 bf LDA $bff7 ; (sstack + 5)
578b : 85 53 __ STA T0 + 0 
578d : ad f8 bf LDA $bff8 ; (sstack + 6)
5790 : 85 54 __ STA T0 + 1 
5792 : a0 14 __ LDY #$14
.l1002:
5794 : b1 53 __ LDA (T0 + 0),y 
5796 : 99 cc bf STA $bfcc,y ; (bigfont + 189)
5799 : 88 __ __ DEY
579a : 10 f8 __ BPL $5794 ; (vdcwin_viewportscroll.l1002 + 0)
.s1003:
579c : ad f9 bf LDA $bff9 ; (sstack + 7)
579f : 85 55 __ STA T2 + 0 
57a1 : 4a __ __ LSR
57a2 : 90 54 __ BCC $57f8 ; (vdcwin_viewportscroll.s14 + 0)
.s1:
57a4 : a9 01 __ LDA #$01
57a6 : 8d f6 bf STA $bff6 ; (sstack + 4)
57a9 : a5 53 __ LDA T0 + 0 
57ab : 69 0a __ ADC #$0a
57ad : 8d f4 bf STA $bff4 ; (sstack + 2)
57b0 : a5 54 __ LDA T0 + 1 
57b2 : 69 00 __ ADC #$00
57b4 : 8d f5 bf STA $bff5 ; (sstack + 3)
57b7 : 20 37 59 JSR $5937 ; (vdcwin_scroll_right.s1000 + 0)
57ba : a9 01 __ LDA #$01
57bc : 85 13 __ STA P6 
57be : a0 0b __ LDY #$0b
57c0 : b1 53 __ LDA (T0 + 0),y 
57c2 : 85 11 __ STA P4 
57c4 : c8 __ __ INY
57c5 : b1 53 __ LDA (T0 + 0),y 
57c7 : 85 12 __ STA P5 
57c9 : a0 0e __ LDY #$0e
57cb : b1 53 __ LDA (T0 + 0),y 
57cd : 85 14 __ STA P7 
57cf : ad d3 bf LDA $bfd3 ; (wrapbuffer + 59)
57d2 : 18 __ __ CLC
57d3 : 69 ff __ ADC #$ff
57d5 : 8d d3 bf STA $bfd3 ; (wrapbuffer + 59)
57d8 : b0 03 __ BCS $57dd ; (vdcwin_viewportscroll.s1005 + 0)
.s1004:
57da : ce d4 bf DEC $bfd4 ; (wrapbuffer + 60)
.s1005:
57dd : 18 __ __ CLC
57de : a0 07 __ LDY #$07
57e0 : b1 53 __ LDA (T0 + 0),y 
57e2 : 69 ff __ ADC #$ff
57e4 : 91 53 __ STA (T0 + 0),y 
57e6 : c8 __ __ INY
57e7 : b1 53 __ LDA (T0 + 0),y 
57e9 : 69 ff __ ADC #$ff
57eb : 91 53 __ STA (T0 + 0),y 
57ed : a9 d7 __ LDA #$d7
57ef : 85 0f __ STA P2 
57f1 : a9 bf __ LDA #$bf
57f3 : 85 10 __ STA P3 
57f5 : 20 bb 32 JSR $32bb ; (vdcwin_init.s0 + 0)
.s14:
57f8 : a5 55 __ LDA T2 + 0 
57fa : 29 02 __ AND #$02
57fc : f0 5f __ BEQ $585d ; (vdcwin_viewportscroll.s15 + 0)
.s4:
57fe : a9 01 __ LDA #$01
5800 : 8d f6 bf STA $bff6 ; (sstack + 4)
5803 : 18 __ __ CLC
5804 : a5 53 __ LDA T0 + 0 
5806 : 69 0b __ ADC #$0b
5808 : 8d f4 bf STA $bff4 ; (sstack + 2)
580b : a5 54 __ LDA T0 + 1 
580d : 69 00 __ ADC #$00
580f : 8d f5 bf STA $bff5 ; (sstack + 3)
5812 : 20 c8 5a JSR $5ac8 ; (vdcwin_scroll_left.s0 + 0)
5815 : a9 01 __ LDA #$01
5817 : 85 13 __ STA P6 
5819 : a0 0c __ LDY #$0c
581b : b1 53 __ LDA (T0 + 0),y 
581d : 85 12 __ STA P5 
581f : a0 0e __ LDY #$0e
5821 : b1 53 __ LDA (T0 + 0),y 
5823 : 85 14 __ STA P7 
5825 : 88 __ __ DEY
5826 : b1 53 __ LDA (T0 + 0),y 
5828 : 85 43 __ STA T1 + 0 
582a : 18 __ __ CLC
582b : 6d d3 bf ADC $bfd3 ; (wrapbuffer + 59)
582e : 8d d3 bf STA $bfd3 ; (wrapbuffer + 59)
5831 : 90 03 __ BCC $5836 ; (vdcwin_viewportscroll.s1007 + 0)
.s1006:
5833 : ee d4 bf INC $bfd4 ; (wrapbuffer + 60)
.s1007:
5836 : 18 __ __ CLC
5837 : a0 07 __ LDY #$07
5839 : b1 53 __ LDA (T0 + 0),y 
583b : 69 01 __ ADC #$01
583d : 91 53 __ STA (T0 + 0),y 
583f : c8 __ __ INY
5840 : b1 53 __ LDA (T0 + 0),y 
5842 : 69 00 __ ADC #$00
5844 : 91 53 __ STA (T0 + 0),y 
5846 : a9 d7 __ LDA #$d7
5848 : 85 0f __ STA P2 
584a : a9 bf __ LDA #$bf
584c : 85 10 __ STA P3 
584e : a0 0b __ LDY #$0b
5850 : b1 53 __ LDA (T0 + 0),y 
5852 : 18 __ __ CLC
5853 : 65 43 __ ADC T1 + 0 
5855 : 38 __ __ SEC
5856 : e9 01 __ SBC #$01
5858 : 85 11 __ STA P4 
585a : 20 bb 32 JSR $32bb ; (vdcwin_init.s0 + 0)
.s15:
585d : a5 55 __ LDA T2 + 0 
585f : 29 08 __ AND #$08
5861 : f0 54 __ BEQ $58b7 ; (vdcwin_viewportscroll.s16 + 0)
.s7:
5863 : a9 01 __ LDA #$01
5865 : 8d f6 bf STA $bff6 ; (sstack + 4)
5868 : 18 __ __ CLC
5869 : a5 53 __ LDA T0 + 0 
586b : 69 0b __ ADC #$0b
586d : 8d f4 bf STA $bff4 ; (sstack + 2)
5870 : a5 54 __ LDA T0 + 1 
5872 : 69 00 __ ADC #$00
5874 : 8d f5 bf STA $bff5 ; (sstack + 3)
5877 : 20 4d 5c JSR $5c4d ; (vdcwin_scroll_down.s0 + 0)
587a : a9 01 __ LDA #$01
587c : 85 14 __ STA P7 
587e : a0 0b __ LDY #$0b
5880 : b1 53 __ LDA (T0 + 0),y 
5882 : 85 11 __ STA P4 
5884 : c8 __ __ INY
5885 : b1 53 __ LDA (T0 + 0),y 
5887 : 85 12 __ STA P5 
5889 : c8 __ __ INY
588a : b1 53 __ LDA (T0 + 0),y 
588c : 85 13 __ STA P6 
588e : ad d5 bf LDA $bfd5 ; (wrapbuffer + 61)
5891 : 18 __ __ CLC
5892 : 69 ff __ ADC #$ff
5894 : 8d d5 bf STA $bfd5 ; (wrapbuffer + 61)
5897 : b0 03 __ BCS $589c ; (vdcwin_viewportscroll.s1009 + 0)
.s1008:
5899 : ce d6 bf DEC $bfd6 ; (wrapbuffer + 62)
.s1009:
589c : 18 __ __ CLC
589d : a0 09 __ LDY #$09
589f : b1 53 __ LDA (T0 + 0),y 
58a1 : 69 ff __ ADC #$ff
58a3 : 91 53 __ STA (T0 + 0),y 
58a5 : c8 __ __ INY
58a6 : b1 53 __ LDA (T0 + 0),y 
58a8 : 69 ff __ ADC #$ff
58aa : 91 53 __ STA (T0 + 0),y 
58ac : a9 d7 __ LDA #$d7
58ae : 85 0f __ STA P2 
58b0 : a9 bf __ LDA #$bf
58b2 : 85 10 __ STA P3 
58b4 : 20 bb 32 JSR $32bb ; (vdcwin_init.s0 + 0)
.s16:
58b7 : a5 55 __ LDA T2 + 0 
58b9 : 29 04 __ AND #$04
58bb : f0 5f __ BEQ $591c ; (vdcwin_viewportscroll.s12 + 0)
.s10:
58bd : a9 01 __ LDA #$01
58bf : 8d f6 bf STA $bff6 ; (sstack + 4)
58c2 : 18 __ __ CLC
58c3 : a5 53 __ LDA T0 + 0 
58c5 : 69 0b __ ADC #$0b
58c7 : 8d f4 bf STA $bff4 ; (sstack + 2)
58ca : a5 54 __ LDA T0 + 1 
58cc : 69 00 __ ADC #$00
58ce : 8d f5 bf STA $bff5 ; (sstack + 3)
58d1 : 20 a0 46 JSR $46a0 ; (vdcwin_scroll_up.s0 + 0)
58d4 : a9 01 __ LDA #$01
58d6 : 85 14 __ STA P7 
58d8 : a0 0b __ LDY #$0b
58da : b1 53 __ LDA (T0 + 0),y 
58dc : 85 11 __ STA P4 
58de : a0 0d __ LDY #$0d
58e0 : b1 53 __ LDA (T0 + 0),y 
58e2 : 85 13 __ STA P6 
58e4 : c8 __ __ INY
58e5 : b1 53 __ LDA (T0 + 0),y 
58e7 : 85 43 __ STA T1 + 0 
58e9 : 18 __ __ CLC
58ea : 6d d5 bf ADC $bfd5 ; (wrapbuffer + 61)
58ed : 8d d5 bf STA $bfd5 ; (wrapbuffer + 61)
58f0 : 90 03 __ BCC $58f5 ; (vdcwin_viewportscroll.s1011 + 0)
.s1010:
58f2 : ee d6 bf INC $bfd6 ; (wrapbuffer + 62)
.s1011:
58f5 : 18 __ __ CLC
58f6 : a0 09 __ LDY #$09
58f8 : b1 53 __ LDA (T0 + 0),y 
58fa : 69 01 __ ADC #$01
58fc : 91 53 __ STA (T0 + 0),y 
58fe : c8 __ __ INY
58ff : b1 53 __ LDA (T0 + 0),y 
5901 : 69 00 __ ADC #$00
5903 : 91 53 __ STA (T0 + 0),y 
5905 : a9 d7 __ LDA #$d7
5907 : 85 0f __ STA P2 
5909 : a9 bf __ LDA #$bf
590b : 85 10 __ STA P3 
590d : a0 0c __ LDY #$0c
590f : b1 53 __ LDA (T0 + 0),y 
5911 : 18 __ __ CLC
5912 : 65 43 __ ADC T1 + 0 
5914 : 38 __ __ SEC
5915 : e9 01 __ SBC #$01
5917 : 85 12 __ STA P5 
5919 : 20 bb 32 JSR $32bb ; (vdcwin_init.s0 + 0)
.s12:
591c : a9 cc __ LDA #$cc
591e : 85 16 __ STA P9 
5920 : a9 bf __ LDA #$bf
5922 : 85 17 __ STA P10 
5924 : 20 f5 38 JSR $38f5 ; (vdcwin_cpy_viewport.s0 + 0)
.s1001:
5927 : ad c6 bf LDA $bfc6 ; (bigfont + 183)
592a : 85 53 __ STA T0 + 0 
592c : ad c7 bf LDA $bfc7 ; (bigfont + 184)
592f : 85 54 __ STA T0 + 1 
5931 : ad c8 bf LDA $bfc8 ; (bigfont + 185)
5934 : 85 55 __ STA T2 + 0 
5936 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_right: ; vdcwin_scroll_right(struct VDCWin*,u8)->void
.s1000:
5937 : a5 53 __ LDA T9 + 0 
5939 : 8d ec bf STA $bfec ; (buffer + 10)
593c : a5 54 __ LDA T9 + 1 
593e : 8d ed bf STA $bfed ; (buffer + 11)
.s0:
5941 : ad f4 bf LDA $bff4 ; (sstack + 2)
5944 : 85 45 __ STA T0 + 0 
5946 : ad f5 bf LDA $bff5 ; (sstack + 3)
5949 : 85 46 __ STA T0 + 1 
594b : ad f6 bf LDA $bff6 ; (sstack + 4)
594e : 85 49 __ STA T3 + 0 
5950 : 38 __ __ SEC
5951 : a0 02 __ LDY #$02
5953 : b1 45 __ LDA (T0 + 0),y 
5955 : e5 49 __ SBC T3 + 0 
5957 : 85 48 __ STA T2 + 0 
5959 : a9 00 __ LDA #$00
595b : 85 47 __ STA T1 + 0 
595d : a0 06 __ LDY #$06
595f : b1 45 __ LDA (T0 + 0),y 
5961 : 85 4a __ STA T4 + 0 
5963 : c8 __ __ INY
5964 : b1 45 __ LDA (T0 + 0),y 
5966 : 85 4b __ STA T4 + 1 
5968 : c8 __ __ INY
5969 : b1 45 __ LDA (T0 + 0),y 
596b : 85 4c __ STA T5 + 0 
596d : c8 __ __ INY
596e : b1 45 __ LDA (T0 + 0),y 
.l1:
5970 : 85 4d __ STA T5 + 1 
5972 : a5 47 __ LDA T1 + 0 
5974 : a0 03 __ LDY #$03
5976 : d1 45 __ CMP (T0 + 0),y 
5978 : 90 0b __ BCC $5985 ; (vdcwin_scroll_right.s2 + 0)
.s1001:
597a : ad ec bf LDA $bfec ; (buffer + 10)
597d : 85 53 __ STA T9 + 0 
597f : ad ed bf LDA $bfed ; (buffer + 11)
5982 : 85 54 __ STA T9 + 1 
5984 : 60 __ __ RTS
.s2:
5985 : a5 4a __ LDA T4 + 0 
5987 : 65 49 __ ADC T3 + 0 
5989 : 85 4e __ STA T7 + 0 
598b : a5 4b __ LDA T4 + 1 
598d : 69 00 __ ADC #$00
598f : 85 4f __ STA T7 + 1 
5991 : 18 __ __ CLC
5992 : a5 49 __ LDA T3 + 0 
5994 : 65 4c __ ADC T5 + 0 
5996 : 85 50 __ STA T8 + 0 
5998 : a9 00 __ LDA #$00
599a : 65 4d __ ADC T5 + 1 
599c : 85 51 __ STA T8 + 1 
599e : ad cc 6f LDA $6fcc ; (vdc_state + 1)
59a1 : d0 0f __ BNE $59b2 ; (vdcwin_scroll_right.s7 + 0)
.s9:
59a3 : cc d8 6f CPY $6fd8 ; (vdc_state + 13)
59a6 : d0 05 __ BNE $59ad ; (vdcwin_scroll_right.s1003 + 0)
.s1002:
59a8 : a9 ff __ LDA #$ff
59aa : cd d7 6f CMP $6fd7 ; (vdc_state + 12)
.s1003:
59ad : b0 03 __ BCS $59b2 ; (vdcwin_scroll_right.s7 + 0)
59af : 4c 2f 5a JMP $5a2f ; (vdcwin_scroll_right.s6 + 0)
.s7:
59b2 : a5 4a __ LDA T4 + 0 
59b4 : 85 16 __ STA P9 
59b6 : a5 4b __ LDA T4 + 1 
59b8 : 85 17 __ STA P10 
59ba : ad d7 6f LDA $6fd7 ; (vdc_state + 12)
59bd : 85 53 __ STA T9 + 0 
59bf : 85 14 __ STA P7 
59c1 : ad d8 6f LDA $6fd8 ; (vdc_state + 13)
59c4 : 85 54 __ STA T9 + 1 
59c6 : 85 15 __ STA P8 
59c8 : a5 48 __ LDA T2 + 0 
59ca : 8d f2 bf STA $bff2 ; (sstack + 0)
59cd : a9 00 __ LDA #$00
59cf : 8d f3 bf STA $bff3 ; (sstack + 1)
59d2 : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
59d5 : a5 4e __ LDA T7 + 0 
59d7 : 85 14 __ STA P7 
59d9 : a5 4f __ LDA T7 + 1 
59db : 85 15 __ STA P8 
59dd : a5 53 __ LDA T9 + 0 
59df : 85 16 __ STA P9 
59e1 : a5 54 __ LDA T9 + 1 
59e3 : 85 17 __ STA P10 
59e5 : a5 48 __ LDA T2 + 0 
59e7 : 8d f2 bf STA $bff2 ; (sstack + 0)
59ea : a9 00 __ LDA #$00
59ec : 8d f3 bf STA $bff3 ; (sstack + 1)
59ef : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
59f2 : a5 16 __ LDA P9 
59f4 : 85 14 __ STA P7 
59f6 : a5 54 __ LDA T9 + 1 
59f8 : 85 15 __ STA P8 
59fa : a5 4c __ LDA T5 + 0 
59fc : 85 16 __ STA P9 
59fe : a5 4d __ LDA T5 + 1 
5a00 : 85 17 __ STA P10 
5a02 : a5 48 __ LDA T2 + 0 
5a04 : 8d f2 bf STA $bff2 ; (sstack + 0)
5a07 : a9 00 __ LDA #$00
5a09 : 8d f3 bf STA $bff3 ; (sstack + 1)
5a0c : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
5a0f : a5 50 __ LDA T8 + 0 
5a11 : 85 14 __ STA P7 
5a13 : a5 51 __ LDA T8 + 1 
5a15 : 85 15 __ STA P8 
5a17 : a5 53 __ LDA T9 + 0 
5a19 : 85 16 __ STA P9 
5a1b : a5 54 __ LDA T9 + 1 
5a1d : 85 17 __ STA P10 
5a1f : a5 48 __ LDA T2 + 0 
5a21 : 8d f2 bf STA $bff2 ; (sstack + 0)
5a24 : a9 00 __ LDA #$00
5a26 : 8d f3 bf STA $bff3 ; (sstack + 1)
5a29 : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
5a2c : 4c a7 5a JMP $5aa7 ; (vdcwin_scroll_right.s5 + 0)
.s6:
5a2f : a9 0e __ LDA #$0e
5a31 : 85 0f __ STA P2 
5a33 : a5 4a __ LDA T4 + 0 
5a35 : 85 12 __ STA P5 
5a37 : a5 4b __ LDA T4 + 1 
5a39 : 85 13 __ STA P6 
5a3b : a9 90 __ LDA #$90
5a3d : 85 10 __ STA P3 
5a3f : a9 71 __ LDA #$71
5a41 : 85 11 __ STA P4 
5a43 : a5 48 __ LDA T2 + 0 
5a45 : 85 14 __ STA P7 
5a47 : a9 00 __ LDA #$00
5a49 : 85 15 __ STA P8 
5a4b : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
5a4e : a5 4e __ LDA T7 + 0 
5a50 : 85 0f __ STA P2 
5a52 : a5 4f __ LDA T7 + 1 
5a54 : 85 10 __ STA P3 
5a56 : a9 0e __ LDA #$0e
5a58 : 85 11 __ STA P4 
5a5a : a9 90 __ LDA #$90
5a5c : 85 12 __ STA P5 
5a5e : a9 71 __ LDA #$71
5a60 : 85 13 __ STA P6 
5a62 : a5 48 __ LDA T2 + 0 
5a64 : 85 14 __ STA P7 
5a66 : a9 00 __ LDA #$00
5a68 : 85 15 __ STA P8 
5a6a : 20 ed 13 JSR $13ed ; (bnk_cpytovdc.s0 + 0)
5a6d : a9 0e __ LDA #$0e
5a6f : 85 0f __ STA P2 
5a71 : a9 90 __ LDA #$90
5a73 : 85 10 __ STA P3 
5a75 : a9 71 __ LDA #$71
5a77 : 85 11 __ STA P4 
5a79 : a5 4c __ LDA T5 + 0 
5a7b : 85 12 __ STA P5 
5a7d : a5 4d __ LDA T5 + 1 
5a7f : 85 13 __ STA P6 
5a81 : a9 00 __ LDA #$00
5a83 : 85 15 __ STA P8 
5a85 : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
5a88 : a5 50 __ LDA T8 + 0 
5a8a : 85 0f __ STA P2 
5a8c : a5 51 __ LDA T8 + 1 
5a8e : 85 10 __ STA P3 
5a90 : a9 0e __ LDA #$0e
5a92 : 85 11 __ STA P4 
5a94 : a9 90 __ LDA #$90
5a96 : 85 12 __ STA P5 
5a98 : a9 71 __ LDA #$71
5a9a : 85 13 __ STA P6 
5a9c : a5 48 __ LDA T2 + 0 
5a9e : 85 14 __ STA P7 
5aa0 : a9 00 __ LDA #$00
5aa2 : 85 15 __ STA P8 
5aa4 : 20 ed 13 JSR $13ed ; (bnk_cpytovdc.s0 + 0)
.s5:
5aa7 : ad ce 6f LDA $6fce ; (vdc_state + 3)
5aaa : 18 __ __ CLC
5aab : 65 4a __ ADC T4 + 0 
5aad : 85 4a __ STA T4 + 0 
5aaf : ad cf 6f LDA $6fcf ; (vdc_state + 4)
5ab2 : 65 4b __ ADC T4 + 1 
5ab4 : 85 4b __ STA T4 + 1 
5ab6 : 18 __ __ CLC
5ab7 : a5 4c __ LDA T5 + 0 
5ab9 : 6d ce 6f ADC $6fce ; (vdc_state + 3)
5abc : 85 4c __ STA T5 + 0 
5abe : a5 4d __ LDA T5 + 1 
5ac0 : 6d cf 6f ADC $6fcf ; (vdc_state + 4)
5ac3 : e6 47 __ INC T1 + 0 
5ac5 : 4c 70 59 JMP $5970 ; (vdcwin_scroll_right.l1 + 0)
--------------------------------------------------------------------
vdcwin_scroll_left: ; vdcwin_scroll_left(struct VDCWin*,u8)->void
.s0:
5ac8 : ad f4 bf LDA $bff4 ; (sstack + 2)
5acb : 85 45 __ STA T0 + 0 
5acd : ad f5 bf LDA $bff5 ; (sstack + 3)
5ad0 : 85 46 __ STA T0 + 1 
5ad2 : ad f6 bf LDA $bff6 ; (sstack + 4)
5ad5 : 85 49 __ STA T3 + 0 
5ad7 : 38 __ __ SEC
5ad8 : a0 02 __ LDY #$02
5ada : b1 45 __ LDA (T0 + 0),y 
5adc : e5 49 __ SBC T3 + 0 
5ade : 85 48 __ STA T2 + 0 
5ae0 : a0 06 __ LDY #$06
5ae2 : b1 45 __ LDA (T0 + 0),y 
5ae4 : 85 4a __ STA T4 + 0 
5ae6 : c8 __ __ INY
5ae7 : b1 45 __ LDA (T0 + 0),y 
5ae9 : 85 4b __ STA T4 + 1 
5aeb : c8 __ __ INY
5aec : b1 45 __ LDA (T0 + 0),y 
5aee : 85 4c __ STA T5 + 0 
5af0 : c8 __ __ INY
5af1 : b1 45 __ LDA (T0 + 0),y 
5af3 : 85 4d __ STA T5 + 1 
.l62:
5af5 : ad 00 d6 LDA $d600 
5af8 : 29 20 __ AND #$20
5afa : f0 f9 __ BEQ $5af5 ; (vdcwin_scroll_left.l62 + 0)
.s1:
5afc : a9 00 __ LDA #$00
5afe : 85 47 __ STA T1 + 0 
.l4:
5b00 : a0 03 __ LDY #$03
5b02 : d1 45 __ CMP (T0 + 0),y 
5b04 : 90 08 __ BCC $5b0e ; (vdcwin_scroll_left.s5 + 0)
.l14:
5b06 : ad 00 d6 LDA $d600 
5b09 : 29 20 __ AND #$20
5b0b : d0 f9 __ BNE $5b06 ; (vdcwin_scroll_left.l14 + 0)
.s1001:
5b0d : 60 __ __ RTS
.s5:
5b0e : a5 4a __ LDA T4 + 0 
5b10 : 65 49 __ ADC T3 + 0 
5b12 : aa __ __ TAX
5b13 : a5 4b __ LDA T4 + 1 
5b15 : 69 00 __ ADC #$00
5b17 : 85 4f __ STA T6 + 1 
5b19 : 18 __ __ CLC
5b1a : a5 49 __ LDA T3 + 0 
5b1c : 65 4c __ ADC T5 + 0 
5b1e : 85 50 __ STA T8 + 0 
5b20 : a9 00 __ LDA #$00
5b22 : 65 4d __ ADC T5 + 1 
5b24 : 85 51 __ STA T8 + 1 
5b26 : ad cc 6f LDA $6fcc ; (vdc_state + 1)
5b29 : d0 0c __ BNE $5b37 ; (vdcwin_scroll_left.s10 + 0)
.s12:
5b2b : cc d8 6f CPY $6fd8 ; (vdc_state + 13)
5b2e : d0 05 __ BNE $5b35 ; (vdcwin_scroll_left.s1003 + 0)
.s1002:
5b30 : a9 ff __ LDA #$ff
5b32 : cd d7 6f CMP $6fd7 ; (vdc_state + 12)
.s1003:
5b35 : 90 7b __ BCC $5bb2 ; (vdcwin_scroll_left.s9 + 0)
.s10:
5b37 : 86 16 __ STX P9 
5b39 : a5 4f __ LDA T6 + 1 
5b3b : 85 17 __ STA P10 
5b3d : ad d7 6f LDA $6fd7 ; (vdc_state + 12)
5b40 : 85 4e __ STA T6 + 0 
5b42 : 85 14 __ STA P7 
5b44 : ad d8 6f LDA $6fd8 ; (vdc_state + 13)
5b47 : 85 4f __ STA T6 + 1 
5b49 : 85 15 __ STA P8 
5b4b : a5 48 __ LDA T2 + 0 
5b4d : 8d f2 bf STA $bff2 ; (sstack + 0)
5b50 : a9 00 __ LDA #$00
5b52 : 8d f3 bf STA $bff3 ; (sstack + 1)
5b55 : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
5b58 : a5 4a __ LDA T4 + 0 
5b5a : 85 14 __ STA P7 
5b5c : a5 4b __ LDA T4 + 1 
5b5e : 85 15 __ STA P8 
5b60 : a5 4e __ LDA T6 + 0 
5b62 : 85 16 __ STA P9 
5b64 : a5 4f __ LDA T6 + 1 
5b66 : 85 17 __ STA P10 
5b68 : a5 48 __ LDA T2 + 0 
5b6a : 8d f2 bf STA $bff2 ; (sstack + 0)
5b6d : a9 00 __ LDA #$00
5b6f : 8d f3 bf STA $bff3 ; (sstack + 1)
5b72 : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
5b75 : a5 16 __ LDA P9 
5b77 : 85 14 __ STA P7 
5b79 : a5 4f __ LDA T6 + 1 
5b7b : 85 15 __ STA P8 
5b7d : a5 50 __ LDA T8 + 0 
5b7f : 85 16 __ STA P9 
5b81 : a5 51 __ LDA T8 + 1 
5b83 : 85 17 __ STA P10 
5b85 : a5 48 __ LDA T2 + 0 
5b87 : 8d f2 bf STA $bff2 ; (sstack + 0)
5b8a : a9 00 __ LDA #$00
5b8c : 8d f3 bf STA $bff3 ; (sstack + 1)
5b8f : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
5b92 : a5 4c __ LDA T5 + 0 
5b94 : 85 14 __ STA P7 
5b96 : a5 4d __ LDA T5 + 1 
5b98 : 85 15 __ STA P8 
5b9a : a5 4e __ LDA T6 + 0 
5b9c : 85 16 __ STA P9 
5b9e : a5 4f __ LDA T6 + 1 
5ba0 : 85 17 __ STA P10 
5ba2 : a5 48 __ LDA T2 + 0 
5ba4 : 8d f2 bf STA $bff2 ; (sstack + 0)
5ba7 : a9 00 __ LDA #$00
5ba9 : 8d f3 bf STA $bff3 ; (sstack + 1)
5bac : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
5baf : 4c 28 5c JMP $5c28 ; (vdcwin_scroll_left.s8 + 0)
.s9:
5bb2 : 86 12 __ STX P5 
5bb4 : a9 0e __ LDA #$0e
5bb6 : 85 0f __ STA P2 
5bb8 : a5 4f __ LDA T6 + 1 
5bba : 85 13 __ STA P6 
5bbc : a9 90 __ LDA #$90
5bbe : 85 10 __ STA P3 
5bc0 : a9 71 __ LDA #$71
5bc2 : 85 11 __ STA P4 
5bc4 : a5 48 __ LDA T2 + 0 
5bc6 : 85 14 __ STA P7 
5bc8 : a9 00 __ LDA #$00
5bca : 85 15 __ STA P8 
5bcc : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
5bcf : a5 4a __ LDA T4 + 0 
5bd1 : 85 0f __ STA P2 
5bd3 : a5 4b __ LDA T4 + 1 
5bd5 : 85 10 __ STA P3 
5bd7 : a9 0e __ LDA #$0e
5bd9 : 85 11 __ STA P4 
5bdb : a9 90 __ LDA #$90
5bdd : 85 12 __ STA P5 
5bdf : a9 71 __ LDA #$71
5be1 : 85 13 __ STA P6 
5be3 : a5 48 __ LDA T2 + 0 
5be5 : 85 14 __ STA P7 
5be7 : a9 00 __ LDA #$00
5be9 : 85 15 __ STA P8 
5beb : 20 ed 13 JSR $13ed ; (bnk_cpytovdc.s0 + 0)
5bee : a9 0e __ LDA #$0e
5bf0 : 85 0f __ STA P2 
5bf2 : a9 90 __ LDA #$90
5bf4 : 85 10 __ STA P3 
5bf6 : a9 71 __ LDA #$71
5bf8 : 85 11 __ STA P4 
5bfa : a5 50 __ LDA T8 + 0 
5bfc : 85 12 __ STA P5 
5bfe : a5 51 __ LDA T8 + 1 
5c00 : 85 13 __ STA P6 
5c02 : a9 00 __ LDA #$00
5c04 : 85 15 __ STA P8 
5c06 : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
5c09 : a5 4c __ LDA T5 + 0 
5c0b : 85 0f __ STA P2 
5c0d : a5 4d __ LDA T5 + 1 
5c0f : 85 10 __ STA P3 
5c11 : a9 0e __ LDA #$0e
5c13 : 85 11 __ STA P4 
5c15 : a9 90 __ LDA #$90
5c17 : 85 12 __ STA P5 
5c19 : a9 71 __ LDA #$71
5c1b : 85 13 __ STA P6 
5c1d : a5 48 __ LDA T2 + 0 
5c1f : 85 14 __ STA P7 
5c21 : a9 00 __ LDA #$00
5c23 : 85 15 __ STA P8 
5c25 : 20 ed 13 JSR $13ed ; (bnk_cpytovdc.s0 + 0)
.s8:
5c28 : ad ce 6f LDA $6fce ; (vdc_state + 3)
5c2b : 18 __ __ CLC
5c2c : 65 4a __ ADC T4 + 0 
5c2e : 85 4a __ STA T4 + 0 
5c30 : ad cf 6f LDA $6fcf ; (vdc_state + 4)
5c33 : 65 4b __ ADC T4 + 1 
5c35 : 85 4b __ STA T4 + 1 
5c37 : 18 __ __ CLC
5c38 : a5 4c __ LDA T5 + 0 
5c3a : 6d ce 6f ADC $6fce ; (vdc_state + 3)
5c3d : 85 4c __ STA T5 + 0 
5c3f : a5 4d __ LDA T5 + 1 
5c41 : 6d cf 6f ADC $6fcf ; (vdc_state + 4)
5c44 : 85 4d __ STA T5 + 1 
5c46 : e6 47 __ INC T1 + 0 
5c48 : a5 47 __ LDA T1 + 0 
5c4a : 4c 00 5b JMP $5b00 ; (vdcwin_scroll_left.l4 + 0)
--------------------------------------------------------------------
vdcwin_scroll_down: ; vdcwin_scroll_down(struct VDCWin*,u8)->void
.s0:
5c4d : ad f4 bf LDA $bff4 ; (sstack + 2)
5c50 : 85 45 __ STA T0 + 0 
5c52 : ad f5 bf LDA $bff5 ; (sstack + 3)
5c55 : 85 46 __ STA T0 + 1 
5c57 : ad ce 6f LDA $6fce ; (vdc_state + 3)
5c5a : 85 1b __ STA ACCU + 0 ; (win + 0)
5c5c : ad cf 6f LDA $6fcf ; (vdc_state + 4)
5c5f : 85 1c __ STA ACCU + 1 ; (win + 1)
5c61 : a0 03 __ LDY #$03
5c63 : b1 45 __ LDA (T0 + 0),y 
5c65 : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
5c68 : a0 06 __ LDY #$06
5c6a : b1 45 __ LDA (T0 + 0),y 
5c6c : 18 __ __ CLC
5c6d : 65 05 __ ADC WORK + 2 
5c6f : 85 4c __ STA T4 + 0 
5c71 : c8 __ __ INY
5c72 : b1 45 __ LDA (T0 + 0),y 
5c74 : 65 06 __ ADC WORK + 3 
5c76 : 85 4d __ STA T4 + 1 
5c78 : c8 __ __ INY
5c79 : b1 45 __ LDA (T0 + 0),y 
5c7b : 18 __ __ CLC
5c7c : 65 05 __ ADC WORK + 2 
5c7e : 85 48 __ STA T2 + 0 
5c80 : c8 __ __ INY
5c81 : b1 45 __ LDA (T0 + 0),y 
5c83 : 65 06 __ ADC WORK + 3 
5c85 : 85 49 __ STA T2 + 1 
5c87 : ad ce 6f LDA $6fce ; (vdc_state + 3)
5c8a : 85 1b __ STA ACCU + 0 ; (win + 0)
5c8c : ad cf 6f LDA $6fcf ; (vdc_state + 4)
5c8f : 85 1c __ STA ACCU + 1 ; (win + 1)
5c91 : ad f6 bf LDA $bff6 ; (sstack + 4)
5c94 : 85 4e __ STA T5 + 0 
5c96 : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
5c99 : a5 05 __ LDA WORK + 2 
5c9b : 85 4a __ STA T3 + 0 
5c9d : a5 06 __ LDA WORK + 3 
5c9f : 85 4b __ STA T3 + 1 
5ca1 : a9 00 __ LDA #$00
5ca3 : 85 47 __ STA T1 + 0 
5ca5 : a0 02 __ LDY #$02
5ca7 : b1 45 __ LDA (T0 + 0),y 
5ca9 : 85 4f __ STA T6 + 0 
.l1:
5cab : a0 03 __ LDY #$03
5cad : b1 45 __ LDA (T0 + 0),y 
5caf : 38 __ __ SEC
5cb0 : e5 4e __ SBC T5 + 0 
5cb2 : 90 06 __ BCC $5cba ; (vdcwin_scroll_down.s2 + 0)
.s1002:
5cb4 : c5 47 __ CMP T1 + 0 
5cb6 : 90 67 __ BCC $5d1f ; (vdcwin_scroll_down.s1001 + 0)
.s1004:
5cb8 : f0 65 __ BEQ $5d1f ; (vdcwin_scroll_down.s1001 + 0)
.s2:
5cba : ad ce 6f LDA $6fce ; (vdc_state + 3)
5cbd : 85 50 __ STA T8 + 0 
5cbf : ad cf 6f LDA $6fcf ; (vdc_state + 4)
5cc2 : 85 51 __ STA T8 + 1 
5cc4 : 38 __ __ SEC
5cc5 : a5 4c __ LDA T4 + 0 
5cc7 : e5 50 __ SBC T8 + 0 
5cc9 : 85 14 __ STA P7 
5ccb : 85 4c __ STA T4 + 0 
5ccd : a5 4d __ LDA T4 + 1 
5ccf : e5 51 __ SBC T8 + 1 
5cd1 : 85 15 __ STA P8 
5cd3 : 85 4d __ STA T4 + 1 
5cd5 : 38 __ __ SEC
5cd6 : a5 14 __ LDA P7 
5cd8 : e5 4a __ SBC T3 + 0 
5cda : 85 16 __ STA P9 
5cdc : a5 15 __ LDA P8 
5cde : e5 4b __ SBC T3 + 1 
5ce0 : 85 17 __ STA P10 
5ce2 : a5 4f __ LDA T6 + 0 
5ce4 : 8d f2 bf STA $bff2 ; (sstack + 0)
5ce7 : a9 00 __ LDA #$00
5ce9 : 8d f3 bf STA $bff3 ; (sstack + 1)
5cec : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
5cef : a5 4f __ LDA T6 + 0 
5cf1 : 8d f2 bf STA $bff2 ; (sstack + 0)
5cf4 : a9 00 __ LDA #$00
5cf6 : 8d f3 bf STA $bff3 ; (sstack + 1)
5cf9 : 38 __ __ SEC
5cfa : a5 48 __ LDA T2 + 0 
5cfc : e5 50 __ SBC T8 + 0 
5cfe : 85 48 __ STA T2 + 0 
5d00 : 85 14 __ STA P7 
5d02 : a5 49 __ LDA T2 + 1 
5d04 : e5 51 __ SBC T8 + 1 
5d06 : 85 49 __ STA T2 + 1 
5d08 : 85 15 __ STA P8 
5d0a : 38 __ __ SEC
5d0b : a5 14 __ LDA P7 
5d0d : e5 4a __ SBC T3 + 0 
5d0f : 85 16 __ STA P9 
5d11 : a5 15 __ LDA P8 
5d13 : e5 4b __ SBC T3 + 1 
5d15 : 85 17 __ STA P10 
5d17 : 20 50 47 JSR $4750 ; (vdc_block_copy.s0 + 0)
5d1a : e6 47 __ INC T1 + 0 
5d1c : 4c ab 5c JMP $5cab ; (vdcwin_scroll_down.l1 + 0)
.s1001:
5d1f : 60 __ __ RTS
--------------------------------------------------------------------
scroll_fullscreen_smooth: ; scroll_fullscreen_smooth(u8)->void
.s1000:
5d20 : a5 53 __ LDA T0 + 0 
5d22 : 8d c1 bf STA $bfc1 ; (bigfont + 178)
.s0:
5d25 : a9 00 __ LDA #$00
5d27 : 8d fb bf STA $bffb ; (sstack + 9)
5d2a : a9 01 __ LDA #$01
5d2c : 8d fc bf STA $bffc ; (sstack + 10)
5d2f : ad fd bf LDA $bffd ; (sstack + 11)
5d32 : 85 53 __ STA T0 + 0 
5d34 : 8d fa bf STA $bffa ; (sstack + 8)
5d37 : 20 74 55 JSR $5574 ; (screen_switch.s1000 + 0)
5d3a : a9 7f __ LDA #$7f
5d3c : 8d c2 bf STA $bfc2 ; (bigfont + 179)
5d3f : a9 00 __ LDA #$00
5d41 : 8d c3 bf STA $bfc3 ; (bigfont + 180)
5d44 : a9 40 __ LDA #$40
5d46 : 8d c4 bf STA $bfc4 ; (bigfont + 181)
5d49 : a5 53 __ LDA T0 + 0 
5d4b : 0a __ __ ASL
5d4c : aa __ __ TAX
5d4d : bd b8 6f LDA $6fb8,x ; (screenset + 0)
5d50 : 8d c5 bf STA $bfc5 ; (bigfont + 182)
5d53 : bd b9 6f LDA $6fb9,x ; (screenset + 1)
5d56 : 8d c6 bf STA $bfc6 ; (bigfont + 183)
5d59 : a9 c2 __ LDA #$c2
5d5b : 8d f7 bf STA $bff7 ; (sstack + 5)
5d5e : a9 bf __ LDA #$bf
5d60 : 8d f8 bf STA $bff8 ; (sstack + 6)
5d63 : ad cd 6f LDA $6fcd ; (vdc_state + 2)
5d66 : 8d f9 bf STA $bff9 ; (sstack + 7)
5d69 : 20 14 5e JSR $5e14 ; (vdc_softscroll_init.s1000 + 0)
5d6c : a5 1b __ LDA ACCU + 0 
5d6e : d0 17 __ BNE $5d87 ; (scroll_fullscreen_smooth.l4 + 0)
.s3:
5d70 : a9 01 __ LDA #$01
5d72 : 8d fb bf STA $bffb ; (sstack + 9)
5d75 : 8d fc bf STA $bffc ; (sstack + 10)
5d78 : ad fd bf LDA $bffd ; (sstack + 11)
5d7b : 8d fa bf STA $bffa ; (sstack + 8)
5d7e : 20 74 55 JSR $5574 ; (screen_switch.s1000 + 0)
.s1001:
5d81 : ad c1 bf LDA $bfc1 ; (bigfont + 178)
5d84 : 85 53 __ STA T0 + 0 
5d86 : 60 __ __ RTS
.l4:
5d87 : 20 3b 2a JSR $2a3b ; (getch.s0 + 0)
5d8a : 85 53 __ STA T0 + 0 
5d8c : c9 57 __ CMP #$57
5d8e : f0 04 __ BEQ $5d94 ; (scroll_fullscreen_smooth.s6 + 0)
.s9:
5d90 : c9 91 __ CMP #$91
5d92 : d0 14 __ BNE $5da8 ; (scroll_fullscreen_smooth.s8 + 0)
.s6:
5d94 : a9 02 __ LDA #$02
5d96 : 85 15 __ STA P8 
5d98 : a9 c2 __ LDA #$c2
5d9a : 85 13 __ STA P6 
5d9c : a9 bf __ LDA #$bf
5d9e : 85 14 __ STA P7 
5da0 : 20 39 5f JSR $5f39 ; (vdc_softscroll_up.l73 + 0)
5da3 : a5 53 __ LDA T0 + 0 
5da5 : 4c ac 5d JMP $5dac ; (scroll_fullscreen_smooth.s13 + 0)
.s8:
5da8 : c9 53 __ CMP #$53
5daa : f0 04 __ BEQ $5db0 ; (scroll_fullscreen_smooth.s10 + 0)
.s13:
5dac : c9 11 __ CMP #$11
5dae : d0 0f __ BNE $5dbf ; (scroll_fullscreen_smooth.s12 + 0)
.s10:
5db0 : a9 02 __ LDA #$02
5db2 : 85 15 __ STA P8 
5db4 : a9 c2 __ LDA #$c2
5db6 : 85 13 __ STA P6 
5db8 : a9 bf __ LDA #$bf
5dba : 85 14 __ STA P7 
5dbc : 20 e2 5f JSR $5fe2 ; (vdc_softscroll_down.l48 + 0)
.s12:
5dbf : a5 53 __ LDA T0 + 0 
5dc1 : c9 41 __ CMP #$41
5dc3 : f0 04 __ BEQ $5dc9 ; (scroll_fullscreen_smooth.s14 + 0)
.s17:
5dc5 : c9 9d __ CMP #$9d
5dc7 : d0 11 __ BNE $5dda ; (scroll_fullscreen_smooth.s16 + 0)
.s14:
5dc9 : a9 02 __ LDA #$02
5dcb : 85 15 __ STA P8 
5dcd : a9 c2 __ LDA #$c2
5dcf : 85 13 __ STA P6 
5dd1 : a9 bf __ LDA #$bf
5dd3 : 85 14 __ STA P7 
5dd5 : 20 9d 60 JSR $609d ; (vdc_softscroll_left.s0 + 0)
5dd8 : a5 53 __ LDA T0 + 0 
.s16:
5dda : c9 44 __ CMP #$44
5ddc : f0 04 __ BEQ $5de2 ; (scroll_fullscreen_smooth.s18 + 0)
.s21:
5dde : c9 1d __ CMP #$1d
5de0 : d0 12 __ BNE $5df4 ; (scroll_fullscreen_smooth.s20 + 0)
.s18:
5de2 : a9 02 __ LDA #$02
5de4 : 85 15 __ STA P8 
5de6 : a9 c2 __ LDA #$c2
5de8 : 85 13 __ STA P6 
5dea : a9 bf __ LDA #$bf
5dec : 85 14 __ STA P7 
5dee : 20 4e 61 JSR $614e ; (vdc_softscroll_right.s0 + 0)
5df1 : 4c f8 5d JMP $5df8 ; (scroll_fullscreen_smooth.s22 + 0)
.s20:
5df4 : c9 1b __ CMP #$1b
5df6 : f0 06 __ BEQ $5dfe ; (scroll_fullscreen_smooth.s5 + 0)
.s22:
5df8 : a5 53 __ LDA T0 + 0 
5dfa : c9 03 __ CMP #$03
5dfc : d0 89 __ BNE $5d87 ; (scroll_fullscreen_smooth.l4 + 0)
.s5:
5dfe : a9 c2 __ LDA #$c2
5e00 : 8d f7 bf STA $bff7 ; (sstack + 5)
5e03 : a9 bf __ LDA #$bf
5e05 : 8d f8 bf STA $bff8 ; (sstack + 6)
5e08 : ad cd 6f LDA $6fcd ; (vdc_state + 2)
5e0b : 8d f9 bf STA $bff9 ; (sstack + 7)
5e0e : 20 18 62 JSR $6218 ; (vdc_softscroll_exit.s1000 + 0)
5e11 : 4c 70 5d JMP $5d70 ; (scroll_fullscreen_smooth.s3 + 0)
--------------------------------------------------------------------
vdc_softscroll_init: ; vdc_softscroll_init(struct VDCSoftScrollSettings*,u8)->u8
.s1000:
5e14 : a2 07 __ LDX #$07
5e16 : b5 53 __ LDA T1 + 0,x 
5e18 : 9d ea bf STA $bfea,x ; (vp_fill + 30)
5e1b : ca __ __ DEX
5e1c : 10 f8 __ BPL $5e16 ; (vdc_softscroll_init.s1000 + 2)
.s0:
5e1e : ad f9 bf LDA $bff9 ; (sstack + 7)
5e21 : 8d f6 bf STA $bff6 ; (sstack + 4)
5e24 : ad f7 bf LDA $bff7 ; (sstack + 5)
5e27 : 85 53 __ STA T1 + 0 
5e29 : ad f8 bf LDA $bff8 ; (sstack + 6)
5e2c : 85 54 __ STA T1 + 1 
5e2e : a0 03 __ LDY #$03
5e30 : b1 53 __ LDA (T1 + 0),y 
5e32 : 85 51 __ STA T0 + 0 
5e34 : c8 __ __ INY
5e35 : b1 53 __ LDA (T1 + 0),y 
5e37 : 85 52 __ STA T2 + 0 
5e39 : 20 52 2c JSR $2c52 ; (vdc_set_mode.s0 + 0)
5e3c : a9 00 __ LDA #$00
5e3e : 85 1c __ STA ACCU + 1 
5e40 : 8d d3 6f STA $6fd3 ; (vdc_state + 8)
5e43 : 8d db 6f STA $6fdb ; (vdc_state + 16)
5e46 : 8d dc 6f STA $6fdc ; (vdc_state + 17)
5e49 : 8d dd 6f STA $6fdd ; (vdc_state + 18)
5e4c : a9 20 __ LDA #$20
5e4e : 8d d4 6f STA $6fd4 ; (vdc_state + 9)
5e51 : a9 10 __ LDA #$10
5e53 : 8d de 6f STA $6fde ; (vdc_state + 19)
5e56 : a5 52 __ LDA T2 + 0 
5e58 : 85 1b __ STA ACCU + 0 
5e5a : a5 51 __ LDA T0 + 0 
5e5c : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
5e5f : a5 05 __ LDA WORK + 2 
5e61 : 85 59 __ STA T5 + 0 
5e63 : 8d d5 6f STA $6fd5 ; (vdc_state + 10)
5e66 : a5 06 __ LDA WORK + 3 
5e68 : 85 58 __ STA T4 + 1 
5e6a : 18 __ __ CLC
5e6b : 69 20 __ ADC #$20
5e6d : 85 5a __ STA T5 + 1 
5e6f : 8d d6 6f STA $6fd6 ; (vdc_state + 11)
5e72 : 38 __ __ SEC
5e73 : a5 51 __ LDA T0 + 0 
5e75 : ed ce 6f SBC $6fce ; (vdc_state + 3)
5e78 : 85 55 __ STA T3 + 0 
5e7a : 8d e3 6f STA $6fe3 ; (vdc_state + 24)
5e7d : 20 65 2d JSR $2d65 ; (vdc_set_multab.s0 + 0)
5e80 : 20 d2 21 JSR $21d2 ; (vdc_cls.s0 + 0)
5e83 : a9 00 __ LDA #$00
5e85 : 85 0f __ STA P2 
5e87 : 85 10 __ STA P3 
5e89 : 20 f3 2d JSR $2df3 ; (vdc_set_charset_address.s0 + 0)
5e8c : 20 07 2e JSR $2e07 ; (vdc_restore_charsets.s0 + 0)
5e8f : a9 00 __ LDA #$00
5e91 : 85 0f __ STA P2 
5e93 : a9 20 __ LDA #$20
5e95 : 85 10 __ STA P3 
5e97 : a5 59 __ LDA T5 + 0 
5e99 : 85 11 __ STA P4 
5e9b : a5 5a __ LDA T5 + 1 
5e9d : 85 12 __ STA P5 
5e9f : 20 cb 2d JSR $2dcb ; (vdc_set_disp_address.s0 + 0)
5ea2 : a9 1b __ LDA #$1b
5ea4 : 85 0d __ STA P0 
5ea6 : a5 55 __ LDA T3 + 0 
5ea8 : 85 0e __ STA P1 
5eaa : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
5ead : a5 11 __ LDA P4 
5eaf : 85 14 __ STA P7 
5eb1 : a5 58 __ LDA T4 + 1 
5eb3 : 85 15 __ STA P8 
5eb5 : a0 00 __ LDY #$00
5eb7 : b1 53 __ LDA (T1 + 0),y 
5eb9 : 85 11 __ STA P4 
5ebb : c8 __ __ INY
5ebc : b1 53 __ LDA (T1 + 0),y 
5ebe : 85 55 __ STA T3 + 0 
5ec0 : 85 12 __ STA P5 
5ec2 : c8 __ __ INY
5ec3 : b1 53 __ LDA (T1 + 0),y 
5ec5 : 85 56 __ STA T3 + 1 
5ec7 : 85 13 __ STA P6 
5ec9 : 20 ed 13 JSR $13ed ; (bnk_cpytovdc.s0 + 0)
5ecc : a5 59 __ LDA T5 + 0 
5ece : 85 0f __ STA P2 
5ed0 : a5 5a __ LDA T5 + 1 
5ed2 : 85 10 __ STA P3 
5ed4 : 18 __ __ CLC
5ed5 : a5 55 __ LDA T3 + 0 
5ed7 : 65 14 __ ADC P7 
5ed9 : aa __ __ TAX
5eda : a5 58 __ LDA T4 + 1 
5edc : 85 15 __ STA P8 
5ede : 65 56 __ ADC T3 + 1 
5ee0 : a8 __ __ TAY
5ee1 : 8a __ __ TXA
5ee2 : 18 __ __ CLC
5ee3 : 69 30 __ ADC #$30
5ee5 : 85 12 __ STA P5 
5ee7 : 90 01 __ BCC $5eea ; (vdc_softscroll_init.s1003 + 0)
.s1002:
5ee9 : c8 __ __ INY
.s1003:
5eea : 84 13 __ STY P6 
5eec : 20 ed 13 JSR $13ed ; (bnk_cpytovdc.s0 + 0)
5eef : a9 00 __ LDA #$00
5ef1 : a0 05 __ LDY #$05
5ef3 : 91 53 __ STA (T1 + 0),y 
5ef5 : c8 __ __ INY
5ef6 : 91 53 __ STA (T1 + 0),y 
5ef8 : c8 __ __ INY
5ef9 : 91 53 __ STA (T1 + 0),y 
5efb : c8 __ __ INY
5efc : 91 53 __ STA (T1 + 0),y 
5efe : a9 18 __ LDA #$18
5f00 : 20 0a 21 JSR $210a ; (vdc_reg_read.s0 + 0)
5f03 : 29 f0 __ AND #$f0
5f05 : a0 09 __ LDY #$09
5f07 : 91 53 __ STA (T1 + 0),y 
5f09 : a9 19 __ LDA #$19
5f0b : 20 0a 21 JSR $210a ; (vdc_reg_read.s0 + 0)
5f0e : 29 0f __ AND #$0f
5f10 : a0 0d __ LDY #$0d
5f12 : 91 53 __ STA (T1 + 0),y 
5f14 : a9 19 __ LDA #$19
5f16 : 20 0a 21 JSR $210a ; (vdc_reg_read.s0 + 0)
5f19 : aa __ __ TAX
5f1a : a9 00 __ LDA #$00
5f1c : a0 0b __ LDY #$0b
5f1e : 91 53 __ STA (T1 + 0),y 
5f20 : c8 __ __ INY
5f21 : 91 53 __ STA (T1 + 0),y 
5f23 : 8a __ __ TXA
5f24 : 29 f0 __ AND #$f0
5f26 : a0 0a __ LDY #$0a
5f28 : 91 53 __ STA (T1 + 0),y 
5f2a : a9 01 __ LDA #$01
5f2c : 85 1b __ STA ACCU + 0 
.s1001:
5f2e : a2 07 __ LDX #$07
5f30 : bd ea bf LDA $bfea,x ; (vp_fill + 30)
5f33 : 95 53 __ STA T1 + 0,x 
5f35 : ca __ __ DEX
5f36 : 10 f8 __ BPL $5f30 ; (vdc_softscroll_init.s1001 + 2)
5f38 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_softscroll_up: ; vdc_softscroll_up(struct VDCSoftScrollSettings*,u8)->void
.l73:
5f39 : ad 00 d6 LDA $d600 
5f3c : 29 20 __ AND #$20
5f3e : f0 f9 __ BEQ $5f39 ; (vdc_softscroll_up.l73 + 0)
.l6:
5f40 : ad 00 d6 LDA $d600 
5f43 : 29 20 __ AND #$20
5f45 : d0 f9 __ BNE $5f40 ; (vdc_softscroll_up.l6 + 0)
.s1:
5f47 : a5 15 __ LDA P8 ; (step + 0)
5f49 : 38 __ __ SEC
5f4a : e9 01 __ SBC #$01
5f4c : aa __ __ TAX
5f4d : a9 00 __ LDA #$00
5f4f : a0 07 __ LDY #$07
5f51 : e9 00 __ SBC #$00
5f53 : 30 74 __ BMI $5fc9 ; (vdc_softscroll_up.s8 + 0)
.s1004:
5f55 : c9 00 __ CMP #$00
5f57 : d0 05 __ BNE $5f5e ; (vdc_softscroll_up.s9 + 0)
.s1002:
5f59 : 8a __ __ TXA
5f5a : d1 13 __ CMP (P6),y ; (settings + 0)
5f5c : 90 6b __ BCC $5fc9 ; (vdc_softscroll_up.s8 + 0)
.s9:
5f5e : a0 0c __ LDY #$0c
5f60 : b1 13 __ LDA (P6),y ; (settings + 0)
5f62 : d0 01 __ BNE $5f65 ; (vdc_softscroll_up.s11 + 0)
.s1001:
5f64 : 60 __ __ RTS
.s11:
5f65 : aa __ __ TAX
5f66 : 38 __ __ SEC
5f67 : a9 08 __ LDA #$08
5f69 : e5 15 __ SBC P8 ; (step + 0)
5f6b : a0 07 __ LDY #$07
5f6d : 91 13 __ STA (P6),y ; (settings + 0)
5f6f : ca __ __ DEX
5f70 : 8a __ __ TXA
5f71 : a0 0c __ LDY #$0c
5f73 : 91 13 __ STA (P6),y ; (settings + 0)
5f75 : a0 03 __ LDY #$03
5f77 : b1 13 __ LDA (P6),y ; (settings + 0)
5f79 : 85 1b __ STA ACCU + 0 
5f7b : 38 __ __ SEC
5f7c : a0 05 __ LDY #$05
5f7e : b1 13 __ LDA (P6),y ; (settings + 0)
5f80 : e5 1b __ SBC ACCU + 0 
5f82 : 85 43 __ STA T1 + 0 
5f84 : 91 13 __ STA (P6),y ; (settings + 0)
5f86 : c8 __ __ INY
5f87 : b1 13 __ LDA (P6),y ; (settings + 0)
5f89 : e9 00 __ SBC #$00
5f8b : 85 44 __ STA T1 + 1 
5f8d : 91 13 __ STA (P6),y ; (settings + 0)
.l77:
5f8f : ad 00 d6 LDA $d600 
5f92 : 29 20 __ AND #$20
5f94 : d0 f9 __ BNE $5f8f ; (vdc_softscroll_up.l77 + 0)
.s14:
5f96 : a9 18 __ LDA #$18
5f98 : 85 0d __ STA P0 
5f9a : a0 09 __ LDY #$09
5f9c : b1 13 __ LDA (P6),y ; (settings + 0)
5f9e : 18 __ __ CLC
5f9f : a0 07 __ LDY #$07
5fa1 : 71 13 __ ADC (P6),y ; (settings + 0)
5fa3 : 85 0e __ STA P1 
5fa5 : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
5fa8 : ad d3 6f LDA $6fd3 ; (vdc_state + 8)
5fab : 18 __ __ CLC
5fac : 65 43 __ ADC T1 + 0 
5fae : 85 0f __ STA P2 
5fb0 : ad d4 6f LDA $6fd4 ; (vdc_state + 9)
5fb3 : 65 44 __ ADC T1 + 1 
5fb5 : 85 10 __ STA P3 
5fb7 : ad d5 6f LDA $6fd5 ; (vdc_state + 10)
5fba : 18 __ __ CLC
5fbb : 65 43 __ ADC T1 + 0 
5fbd : 85 11 __ STA P4 
5fbf : ad d6 6f LDA $6fd6 ; (vdc_state + 11)
5fc2 : 65 44 __ ADC T1 + 1 
5fc4 : 85 12 __ STA P5 
5fc6 : 4c cb 2d JMP $2dcb ; (vdc_set_disp_address.s0 + 0)
.s8:
5fc9 : b1 13 __ LDA (P6),y ; (settings + 0)
5fcb : 38 __ __ SEC
5fcc : e5 15 __ SBC P8 ; (step + 0)
5fce : 85 43 __ STA T1 + 0 
5fd0 : 91 13 __ STA (P6),y ; (settings + 0)
5fd2 : a9 18 __ LDA #$18
5fd4 : 85 0d __ STA P0 
5fd6 : a0 09 __ LDY #$09
5fd8 : b1 13 __ LDA (P6),y ; (settings + 0)
5fda : 18 __ __ CLC
5fdb : 65 43 __ ADC T1 + 0 
5fdd : 85 0e __ STA P1 
5fdf : 4c fa 20 JMP $20fa ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_softscroll_down: ; vdc_softscroll_down(struct VDCSoftScrollSettings*,u8)->void
.l48:
5fe2 : ad 00 d6 LDA $d600 
5fe5 : 29 20 __ AND #$20
5fe7 : f0 f9 __ BEQ $5fe2 ; (vdc_softscroll_down.l48 + 0)
.l6:
5fe9 : ad 00 d6 LDA $d600 
5fec : 29 20 __ AND #$20
5fee : d0 f9 __ BNE $5fe9 ; (vdc_softscroll_down.l6 + 0)
.s1:
5ff0 : a5 15 __ LDA P8 ; (step + 0)
5ff2 : 18 __ __ CLC
5ff3 : a0 07 __ LDY #$07
5ff5 : 71 13 __ ADC (P6),y ; (settings + 0)
5ff7 : 85 43 __ STA T2 + 0 
5ff9 : 91 13 __ STA (P6),y ; (settings + 0)
5ffb : 38 __ __ SEC
5ffc : a9 08 __ LDA #$08
5ffe : e5 15 __ SBC P8 ; (step + 0)
6000 : aa __ __ TAX
6001 : a9 00 __ LDA #$00
6003 : e9 00 __ SBC #$00
6005 : 30 18 __ BMI $601f ; (vdc_softscroll_down.s8 + 0)
.s1006:
6007 : c9 00 __ CMP #$00
6009 : d0 04 __ BNE $600f ; (vdc_softscroll_down.s9 + 0)
.s1004:
600b : e4 43 __ CPX T2 + 0 
600d : 90 10 __ BCC $601f ; (vdc_softscroll_down.s8 + 0)
.s9:
600f : a9 18 __ LDA #$18
6011 : 85 0d __ STA P0 
6013 : a0 09 __ LDY #$09
6015 : b1 13 __ LDA (P6),y ; (settings + 0)
6017 : 18 __ __ CLC
6018 : 65 43 __ ADC T2 + 0 
601a : 85 0e __ STA P1 
601c : 4c fa 20 JMP $20fa ; (vdc_reg_write.s0 + 0)
.s8:
601f : a0 04 __ LDY #$04
6021 : b1 13 __ LDA (P6),y ; (settings + 0)
6023 : 38 __ __ SEC
6024 : ed d0 6f SBC $6fd0 ; (vdc_state + 5)
6027 : aa __ __ TAX
6028 : a9 00 __ LDA #$00
602a : ed d1 6f SBC $6fd1 ; (vdc_state + 6)
602d : 85 1c __ STA ACCU + 1 
602f : 8a __ __ TXA
6030 : 38 __ __ SEC
6031 : e9 01 __ SBC #$01
6033 : 85 1b __ STA ACCU + 0 
6035 : a0 0c __ LDY #$0c
6037 : b1 13 __ LDA (P6),y ; (settings + 0)
6039 : aa __ __ TAX
603a : a5 1c __ LDA ACCU + 1 
603c : e9 00 __ SBC #$00
603e : d0 0d __ BNE $604d ; (vdc_softscroll_down.s11 + 0)
.s1002:
6040 : e4 1b __ CPX ACCU + 0 
6042 : 90 09 __ BCC $604d ; (vdc_softscroll_down.s11 + 0)
.s12:
6044 : a5 43 __ LDA T2 + 0 
6046 : e5 15 __ SBC P8 ; (step + 0)
6048 : a0 07 __ LDY #$07
604a : 91 13 __ STA (P6),y ; (settings + 0)
.s1001:
604c : 60 __ __ RTS
.s11:
604d : a9 00 __ LDA #$00
604f : a0 07 __ LDY #$07
6051 : 91 13 __ STA (P6),y ; (settings + 0)
6053 : a9 18 __ LDA #$18
6055 : 85 0d __ STA P0 
6057 : a0 09 __ LDY #$09
6059 : b1 13 __ LDA (P6),y ; (settings + 0)
605b : 85 0e __ STA P1 
605d : e8 __ __ INX
605e : 8a __ __ TXA
605f : a0 0c __ LDY #$0c
6061 : 91 13 __ STA (P6),y ; (settings + 0)
6063 : a0 03 __ LDY #$03
6065 : b1 13 __ LDA (P6),y ; (settings + 0)
6067 : 18 __ __ CLC
6068 : a0 05 __ LDY #$05
606a : 71 13 __ ADC (P6),y ; (settings + 0)
606c : 85 43 __ STA T2 + 0 
606e : 91 13 __ STA (P6),y ; (settings + 0)
6070 : c8 __ __ INY
6071 : b1 13 __ LDA (P6),y ; (settings + 0)
6073 : 69 00 __ ADC #$00
6075 : 85 44 __ STA T2 + 1 
6077 : 91 13 __ STA (P6),y ; (settings + 0)
6079 : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
607c : ad d3 6f LDA $6fd3 ; (vdc_state + 8)
607f : 18 __ __ CLC
6080 : 65 43 __ ADC T2 + 0 
6082 : 85 0f __ STA P2 
6084 : ad d4 6f LDA $6fd4 ; (vdc_state + 9)
6087 : 65 44 __ ADC T2 + 1 
6089 : 85 10 __ STA P3 
608b : ad d5 6f LDA $6fd5 ; (vdc_state + 10)
608e : 18 __ __ CLC
608f : 65 43 __ ADC T2 + 0 
6091 : 85 11 __ STA P4 
6093 : ad d6 6f LDA $6fd6 ; (vdc_state + 11)
6096 : 65 44 __ ADC T2 + 1 
6098 : 85 12 __ STA P5 
609a : 4c cb 2d JMP $2dcb ; (vdc_set_disp_address.s0 + 0)
--------------------------------------------------------------------
vdc_softscroll_left: ; vdc_softscroll_left(struct VDCSoftScrollSettings*,u8)->void
.s0:
609d : a5 15 __ LDA P8 ; (step + 0)
609f : 18 __ __ CLC
60a0 : a0 08 __ LDY #$08
60a2 : 71 13 __ ADC (P6),y ; (settings + 0)
60a4 : 85 43 __ STA T2 + 0 
60a6 : 91 13 __ STA (P6),y ; (settings + 0)
60a8 : 98 __ __ TYA
60a9 : 38 __ __ SEC
60aa : e5 15 __ SBC P8 ; (step + 0)
60ac : aa __ __ TAX
60ad : a9 00 __ LDA #$00
60af : e9 00 __ SBC #$00
60b1 : 30 08 __ BMI $60bb ; (vdc_softscroll_left.s1 + 0)
.s1004:
60b3 : c9 00 __ CMP #$00
60b5 : d0 16 __ BNE $60cd ; (vdc_softscroll_left.s80 + 0)
.s1002:
60b7 : e4 43 __ CPX T2 + 0 
60b9 : b0 12 __ BCS $60cd ; (vdc_softscroll_left.s80 + 0)
.s1:
60bb : a0 0d __ LDY #$0d
60bd : b1 13 __ LDA (P6),y ; (settings + 0)
60bf : 85 43 __ STA T2 + 0 
60c1 : aa __ __ TAX
60c2 : a0 0b __ LDY #$0b
60c4 : b1 13 __ LDA (P6),y ; (settings + 0)
60c6 : d0 15 __ BNE $60dd ; (vdc_softscroll_left.s4 + 0)
.s5:
60c8 : 8a __ __ TXA
60c9 : a0 08 __ LDY #$08
60cb : 91 13 __ STA (P6),y ; (settings + 0)
.s80:
60cd : a0 0a __ LDY #$0a
60cf : b1 13 __ LDA (P6),y ; (settings + 0)
60d1 : 18 __ __ CLC
60d2 : 65 43 __ ADC T2 + 0 
.s3:
60d4 : 85 0e __ STA P1 
60d6 : a9 19 __ LDA #$19
60d8 : 85 0d __ STA P0 
60da : 4c fa 20 JMP $20fa ; (vdc_reg_write.s0 + 0)
.s4:
60dd : 86 1b __ STX ACCU + 0 
60df : 85 45 __ STA T5 + 0 
60e1 : a9 00 __ LDA #$00
60e3 : 85 1c __ STA ACCU + 1 
60e5 : 85 04 __ STA WORK + 1 
60e7 : a5 15 __ LDA P8 ; (step + 0)
60e9 : 85 03 __ STA WORK + 0 
60eb : 20 14 68 JSR $6814 ; (divmod + 0)
60ee : a5 05 __ LDA WORK + 2 
60f0 : a0 08 __ LDY #$08
60f2 : 91 13 __ STA (P6),y ; (settings + 0)
60f4 : 18 __ __ CLC
60f5 : a5 45 __ LDA T5 + 0 
60f7 : 69 ff __ ADC #$ff
60f9 : a0 0b __ LDY #$0b
60fb : 91 13 __ STA (P6),y ; (settings + 0)
60fd : 18 __ __ CLC
60fe : a0 05 __ LDY #$05
6100 : b1 13 __ LDA (P6),y ; (settings + 0)
6102 : 69 ff __ ADC #$ff
6104 : 85 43 __ STA T2 + 0 
6106 : 91 13 __ STA (P6),y ; (settings + 0)
6108 : c8 __ __ INY
6109 : b1 13 __ LDA (P6),y ; (settings + 0)
610b : 69 ff __ ADC #$ff
610d : 85 44 __ STA T2 + 1 
610f : 91 13 __ STA (P6),y ; (settings + 0)
.l75:
6111 : ad 00 d6 LDA $d600 
6114 : 29 20 __ AND #$20
6116 : d0 f9 __ BNE $6111 ; (vdc_softscroll_left.l75 + 0)
.s7:
6118 : ad d3 6f LDA $6fd3 ; (vdc_state + 8)
611b : 18 __ __ CLC
611c : 65 43 __ ADC T2 + 0 
611e : 85 0f __ STA P2 
6120 : ad d4 6f LDA $6fd4 ; (vdc_state + 9)
6123 : 65 44 __ ADC T2 + 1 
6125 : 85 10 __ STA P3 
6127 : ad d5 6f LDA $6fd5 ; (vdc_state + 10)
612a : 18 __ __ CLC
612b : 65 43 __ ADC T2 + 0 
612d : 85 11 __ STA P4 
612f : ad d6 6f LDA $6fd6 ; (vdc_state + 11)
6132 : 65 44 __ ADC T2 + 1 
6134 : 85 12 __ STA P5 
6136 : 20 cb 2d JSR $2dcb ; (vdc_set_disp_address.s0 + 0)
.l77:
6139 : ad 00 d6 LDA $d600 
613c : 29 20 __ AND #$20
613e : f0 f9 __ BEQ $6139 ; (vdc_softscroll_left.l77 + 0)
.l15:
6140 : ad 00 d6 LDA $d600 
6143 : 29 20 __ AND #$20
6145 : d0 f9 __ BNE $6140 ; (vdc_softscroll_left.l15 + 0)
.s10:
6147 : a0 0a __ LDY #$0a
6149 : b1 13 __ LDA (P6),y ; (settings + 0)
614b : 4c d4 60 JMP $60d4 ; (vdc_softscroll_left.s3 + 0)
--------------------------------------------------------------------
vdc_softscroll_right: ; vdc_softscroll_right(struct VDCSoftScrollSettings*,u8)->void
.s0:
614e : a5 15 __ LDA P8 ; (step + 0)
6150 : 38 __ __ SEC
6151 : e9 01 __ SBC #$01
6153 : aa __ __ TAX
6154 : a9 00 __ LDA #$00
6156 : a0 08 __ LDY #$08
6158 : e9 00 __ SBC #$00
615a : 10 03 __ BPL $615f ; (vdc_softscroll_right.s1006 + 0)
615c : 4c 0e 62 JMP $620e ; (vdc_softscroll_right.s1 + 0)
.s1006:
615f : c9 00 __ CMP #$00
6161 : d0 08 __ BNE $616b ; (vdc_softscroll_right.s2 + 0)
.s1004:
6163 : 8a __ __ TXA
6164 : d1 13 __ CMP (P6),y ; (settings + 0)
6166 : b0 03 __ BCS $616b ; (vdc_softscroll_right.s2 + 0)
6168 : 4c 0e 62 JMP $620e ; (vdc_softscroll_right.s1 + 0)
.s2:
616b : a0 03 __ LDY #$03
616d : b1 13 __ LDA (P6),y ; (settings + 0)
616f : 38 __ __ SEC
6170 : ed ce 6f SBC $6fce ; (vdc_state + 3)
6173 : 85 1b __ STA ACCU + 0 
6175 : a9 00 __ LDA #$00
6177 : ed cf 6f SBC $6fcf ; (vdc_state + 4)
617a : 85 1c __ STA ACCU + 1 
617c : a0 0b __ LDY #$0b
617e : b1 13 __ LDA (P6),y ; (settings + 0)
6180 : 85 43 __ STA T0 + 0 
6182 : 18 __ __ CLC
6183 : 69 01 __ ADC #$01
6185 : aa __ __ TAX
6186 : a9 00 __ LDA #$00
6188 : 2a __ __ ROL
6189 : c5 1c __ CMP ACCU + 1 
618b : d0 02 __ BNE $618f ; (vdc_softscroll_right.s1003 + 0)
.s1002:
618d : e4 1b __ CPX ACCU + 0 
.s1003:
618f : 90 01 __ BCC $6192 ; (vdc_softscroll_right.s7 + 0)
.s1001:
6191 : 60 __ __ RTS
.s7:
6192 : a0 0d __ LDY #$0d
6194 : b1 13 __ LDA (P6),y ; (settings + 0)
6196 : 85 1b __ STA ACCU + 0 
6198 : a9 00 __ LDA #$00
619a : 85 1c __ STA ACCU + 1 
619c : 85 04 __ STA WORK + 1 
619e : a5 15 __ LDA P8 ; (step + 0)
61a0 : 85 03 __ STA WORK + 0 
61a2 : 20 14 68 JSR $6814 ; (divmod + 0)
61a5 : 38 __ __ SEC
61a6 : a9 08 __ LDA #$08
61a8 : e5 15 __ SBC P8 ; (step + 0)
61aa : 18 __ __ CLC
61ab : 65 05 __ ADC WORK + 2 
61ad : a0 08 __ LDY #$08
61af : 91 13 __ STA (P6),y ; (settings + 0)
61b1 : a6 43 __ LDX T0 + 0 
61b3 : e8 __ __ INX
61b4 : 8a __ __ TXA
61b5 : a0 0b __ LDY #$0b
61b7 : 91 13 __ STA (P6),y ; (settings + 0)
61b9 : 18 __ __ CLC
61ba : a0 05 __ LDY #$05
61bc : b1 13 __ LDA (P6),y ; (settings + 0)
61be : 69 01 __ ADC #$01
61c0 : 85 44 __ STA T1 + 0 
61c2 : 91 13 __ STA (P6),y ; (settings + 0)
61c4 : c8 __ __ INY
61c5 : b1 13 __ LDA (P6),y ; (settings + 0)
61c7 : 69 00 __ ADC #$00
61c9 : 85 45 __ STA T1 + 1 
61cb : 91 13 __ STA (P6),y ; (settings + 0)
.l86:
61cd : ad 00 d6 LDA $d600 
61d0 : 29 20 __ AND #$20
61d2 : d0 f9 __ BNE $61cd ; (vdc_softscroll_right.l86 + 0)
.s10:
61d4 : ad d3 6f LDA $6fd3 ; (vdc_state + 8)
61d7 : 18 __ __ CLC
61d8 : 65 44 __ ADC T1 + 0 
61da : 85 0f __ STA P2 
61dc : ad d4 6f LDA $6fd4 ; (vdc_state + 9)
61df : 65 45 __ ADC T1 + 1 
61e1 : 85 10 __ STA P3 
61e3 : ad d5 6f LDA $6fd5 ; (vdc_state + 10)
61e6 : 18 __ __ CLC
61e7 : 65 44 __ ADC T1 + 0 
61e9 : 85 11 __ STA P4 
61eb : ad d6 6f LDA $6fd6 ; (vdc_state + 11)
61ee : 65 45 __ ADC T1 + 1 
61f0 : 85 12 __ STA P5 
61f2 : 20 cb 2d JSR $2dcb ; (vdc_set_disp_address.s0 + 0)
.l83:
61f5 : ad 00 d6 LDA $d600 
61f8 : 29 20 __ AND #$20
61fa : f0 f9 __ BEQ $61f5 ; (vdc_softscroll_right.l83 + 0)
.s166:
61fc : a9 19 __ LDA #$19
61fe : 85 0d __ STA P0 
6200 : a0 0a __ LDY #$0a
6202 : b1 13 __ LDA (P6),y ; (settings + 0)
6204 : 18 __ __ CLC
6205 : a0 08 __ LDY #$08
6207 : 71 13 __ ADC (P6),y ; (settings + 0)
6209 : 85 0e __ STA P1 
620b : 4c fa 20 JMP $20fa ; (vdc_reg_write.s0 + 0)
.s1:
620e : b1 13 __ LDA (P6),y ; (settings + 0)
6210 : 38 __ __ SEC
6211 : e5 15 __ SBC P8 ; (step + 0)
6213 : 91 13 __ STA (P6),y ; (settings + 0)
6215 : 4c f5 61 JMP $61f5 ; (vdc_softscroll_right.l83 + 0)
--------------------------------------------------------------------
vdc_softscroll_exit: ; vdc_softscroll_exit(struct VDCSoftScrollSettings*,u8)->void
.s1000:
6218 : a5 53 __ LDA T0 + 0 
621a : 8d f0 bf STA $bff0 ; (buffer + 14)
621d : a5 54 __ LDA T0 + 1 
621f : 8d f1 bf STA $bff1 ; (buffer + 15)
.s0:
6222 : 20 d2 21 JSR $21d2 ; (vdc_cls.s0 + 0)
6225 : a9 1b __ LDA #$1b
6227 : 85 0d __ STA P0 
6229 : a9 00 __ LDA #$00
622b : 85 0e __ STA P1 
622d : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
6230 : a9 18 __ LDA #$18
6232 : 85 0d __ STA P0 
6234 : ad f7 bf LDA $bff7 ; (sstack + 5)
6237 : 85 53 __ STA T0 + 0 
6239 : ad f8 bf LDA $bff8 ; (sstack + 6)
623c : 85 54 __ STA T0 + 1 
623e : a0 09 __ LDY #$09
6240 : b1 53 __ LDA (T0 + 0),y 
6242 : 85 0e __ STA P1 
6244 : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
6247 : e6 0d __ INC P0 
6249 : a0 0a __ LDY #$0a
624b : b1 53 __ LDA (T0 + 0),y 
624d : 18 __ __ CLC
624e : a0 0d __ LDY #$0d
6250 : 71 53 __ ADC (T0 + 0),y 
6252 : 85 0e __ STA P1 
6254 : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
6257 : ad f9 bf LDA $bff9 ; (sstack + 7)
625a : 8d f6 bf STA $bff6 ; (sstack + 4)
625d : 20 52 2c JSR $2c52 ; (vdc_set_mode.s0 + 0)
.s1001:
6260 : ad f0 bf LDA $bff0 ; (buffer + 14)
6263 : 85 53 __ STA T0 + 0 
6265 : ad f1 bf LDA $bff1 ; (buffer + 15)
6268 : 85 54 __ STA T0 + 1 
626a : 60 __ __ RTS
--------------------------------------------------------------------
scroll_bigfont: ; scroll_bigfont()->void
.s1000:
626b : a5 53 __ LDA T0 + 0 
626d : 8d 31 be STA $be31 ; (scroll_bigfont@stack + 0)
6270 : a5 54 __ LDA T0 + 1 
6272 : 8d 32 be STA $be32 ; (scroll_bigfont@stack + 1)
.s0:
6275 : a9 00 __ LDA #$00
6277 : 85 18 __ STA P11 
6279 : a9 02 __ LDA #$02
627b : 8d f2 bf STA $bff2 ; (sstack + 0)
627e : a9 20 __ LDA #$20
6280 : 8d f3 bf STA $bff3 ; (sstack + 1)
6283 : a9 50 __ LDA #$50
6285 : 8d f4 bf STA $bff4 ; (sstack + 2)
6288 : a2 05 __ LDX #$05
.l1002:
628a : bd bd 6f LDA $6fbd,x ; (screenset + 5)
628d : 9d f7 be STA $bef7,x ; (scrolltext + 194)
6290 : ca __ __ DEX
6291 : d0 f7 __ BNE $628a ; (scroll_bigfont.l1002 + 0)
.s1003:
6293 : a2 c3 __ LDX #$c3
.l1004:
6295 : bd ff 6f LDA $6fff,x 
6298 : 9d 34 be STA $be34,x ; (scroll_bigfont@stack + 3)
629b : ca __ __ DEX
629c : d0 f7 __ BNE $6295 ; (scroll_bigfont.l1004 + 0)
.s1005:
629e : ad d0 6f LDA $6fd0 ; (vdc_state + 5)
62a1 : 85 53 __ STA T0 + 0 
62a3 : 38 __ __ SEC
62a4 : e9 02 __ SBC #$02
62a6 : 8d f5 bf STA $bff5 ; (sstack + 3)
62a9 : ad d1 6f LDA $6fd1 ; (vdc_state + 6)
62ac : 85 54 __ STA T0 + 1 
62ae : 20 ed 21 JSR $21ed ; (vdc_clear.s0 + 0)
62b1 : a9 03 __ LDA #$03
62b3 : 8d f2 bf STA $bff2 ; (sstack + 0)
62b6 : a9 ea __ LDA #$ea
62b8 : 8d f3 bf STA $bff3 ; (sstack + 1)
62bb : a9 56 __ LDA #$56
62bd : 8d f4 bf STA $bff4 ; (sstack + 2)
62c0 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
62c3 : a9 04 __ LDA #$04
62c5 : 8d f2 bf STA $bff2 ; (sstack + 0)
62c8 : a9 b1 __ LDA #$b1
62ca : 8d f3 bf STA $bff3 ; (sstack + 1)
62cd : a9 63 __ LDA #$63
62cf : 8d f4 bf STA $bff4 ; (sstack + 2)
62d2 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
62d5 : a9 01 __ LDA #$01
62d7 : 85 10 __ STA P3 
62d9 : ad fc 6a LDA $6afc ; (bootdevice + 0)
62dc : 85 0f __ STA P2 
62de : a9 00 __ LDA #$00
62e0 : 85 11 __ STA P4 
62e2 : a9 a0 __ LDA #$a0
62e4 : 85 12 __ STA P5 
62e6 : a9 f8 __ LDA #$f8
62e8 : 85 13 __ STA P6 
62ea : a9 56 __ LDA #$56
62ec : 85 14 __ STA P7 
62ee : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
62f1 : a5 1b __ LDA ACCU + 0 
62f3 : d0 0e __ BNE $6303 ; (scroll_bigfont.s3 + 0)
.s1:
62f5 : 20 2f 30 JSR $302f ; (menu_fileerrormessage.s1000 + 0)
.s1001:
62f8 : ad 31 be LDA $be31 ; (scroll_bigfont@stack + 0)
62fb : 85 53 __ STA T0 + 0 
62fd : ad 32 be LDA $be32 ; (scroll_bigfont@stack + 1)
6300 : 85 54 __ STA T0 + 1 
6302 : 60 __ __ RTS
.s3:
6303 : a9 03 __ LDA #$03
6305 : 8d f2 bf STA $bff2 ; (sstack + 0)
6308 : a9 20 __ LDA #$20
630a : 8d f3 bf STA $bff3 ; (sstack + 1)
630d : a9 50 __ LDA #$50
630f : 8d f4 bf STA $bff4 ; (sstack + 2)
6312 : a9 02 __ LDA #$02
6314 : 8d f5 bf STA $bff5 ; (sstack + 3)
6317 : 20 ed 21 JSR $21ed ; (vdc_clear.s0 + 0)
631a : a9 7f __ LDA #$7f
631c : 85 0f __ STA P2 
631e : a9 00 __ LDA #$00
6320 : 85 10 __ STA P3 
6322 : a9 a0 __ LDA #$a0
6324 : 85 11 __ STA P4 
6326 : a9 50 __ LDA #$50
6328 : 85 12 __ STA P5 
632a : a9 04 __ LDA #$04
632c : 85 13 __ STA P6 
632e : a9 05 __ LDA #$05
6330 : 85 14 __ STA P7 
6332 : a9 5b __ LDA #$5b
6334 : 85 15 __ STA P8 
6336 : a9 0f __ LDA #$0f
6338 : 85 0d __ STA P0 
633a : a9 bf __ LDA #$bf
633c : 85 0e __ STA P1 
633e : a9 f8 __ LDA #$f8
6340 : 85 16 __ STA P9 
6342 : a9 be __ LDA #$be
6344 : 85 17 __ STA P10 
6346 : 20 ce 63 JSR $63ce ; (txtscr_bigfont_init.s0 + 0)
6349 : a9 0f __ LDA #$0f
634b : 8d f7 bf STA $bff7 ; (sstack + 5)
634e : a9 bf __ LDA #$bf
6350 : 8d f8 bf STA $bff8 ; (sstack + 6)
6353 : a9 05 __ LDA #$05
6355 : 8d fb bf STA $bffb ; (sstack + 9)
6358 : a9 46 __ LDA #$46
635a : 8d fd bf STA $bffd ; (sstack + 11)
635d : a9 f0 __ LDA #$f0
635f : 8d fe bf STA $bffe ; (sstack + 12)
6362 : a9 fd __ LDA #$fd
6364 : 8d f5 bf STA $bff5 ; (sstack + 3)
6367 : a9 be __ LDA #$be
6369 : 8d f6 bf STA $bff6 ; (sstack + 4)
636c : a9 35 __ LDA #$35
636e : 8d f9 bf STA $bff9 ; (sstack + 7)
6371 : a9 be __ LDA #$be
6373 : 8d fa bf STA $bffa ; (sstack + 8)
6376 : 46 54 __ LSR T0 + 1 
6378 : a5 53 __ LDA T0 + 0 
637a : 6a __ __ ROR
637b : 38 __ __ SEC
637c : e9 02 __ SBC #$02
637e : 8d fc bf STA $bffc ; (sstack + 10)
6381 : 20 b1 64 JSR $64b1 ; (txtscr_scroller_init.s0 + 0)
.l56:
6384 : 20 1e 65 JSR $651e ; (vdcwin_checkch.s0 + 0)
6387 : a5 1b __ LDA ACCU + 0 
6389 : 05 1c __ ORA ACCU + 1 
638b : d0 f7 __ BNE $6384 ; (scroll_bigfont.l56 + 0)
.l8:
638d : 20 1e 65 JSR $651e ; (vdcwin_checkch.s0 + 0)
6390 : a5 1b __ LDA ACCU + 0 
6392 : 85 53 __ STA T0 + 0 
6394 : a9 fd __ LDA #$fd
6396 : 8d f7 bf STA $bff7 ; (sstack + 5)
6399 : a9 be __ LDA #$be
639b : 8d f8 bf STA $bff8 ; (sstack + 6)
639e : 20 28 65 JSR $6528 ; (txtscr_scroll_do.s1000 + 0)
63a1 : a5 53 __ LDA T0 + 0 
63a3 : c9 1b __ CMP #$1b
63a5 : d0 03 __ BNE $63aa ; (scroll_bigfont.s10 + 0)
63a7 : 4c f8 62 JMP $62f8 ; (scroll_bigfont.s1001 + 0)
.s10:
63aa : c9 03 __ CMP #$03
63ac : d0 df __ BNE $638d ; (scroll_bigfont.l8 + 0)
63ae : 4c f8 62 JMP $62f8 ; (scroll_bigfont.s1001 + 0)
--------------------------------------------------------------------
63b1 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 53 43 52 4f 4c 4c 20 70 : lOADING SCROLL p
63c1 : __ __ __ BYT 65 74 73 63 69 69 20 46 4f 4e 54 2e 00          : etscii FONT..
--------------------------------------------------------------------
txtscr_bigfont_init: ; txtscr_bigfont_init(struct TXTSCRBigFont*,u8,u8*,u8,u8,u8,u8,u8*)->void
.s0:
63ce : a5 15 __ LDA P8 ; (ch_num + 0)
63d0 : a0 00 __ LDY #$00
63d2 : 91 0d __ STA (P0),y ; (settings + 0)
63d4 : a5 0f __ LDA P2 ; (scr + 0)
63d6 : c8 __ __ INY
63d7 : 91 0d __ STA (P0),y ; (settings + 0)
63d9 : a5 12 __ LDA P5 ; (width + 0)
63db : c8 __ __ INY
63dc : 91 0d __ STA (P0),y ; (settings + 0)
63de : a9 00 __ LDA #$00
63e0 : c8 __ __ INY
63e1 : 91 0d __ STA (P0),y ; (settings + 0)
63e3 : a5 13 __ LDA P6 ; (ch_width + 0)
63e5 : c8 __ __ INY
63e6 : 91 0d __ STA (P0),y ; (settings + 0)
63e8 : a5 14 __ LDA P7 ; (ch_height + 0)
63ea : c8 __ __ INY
63eb : 91 0d __ STA (P0),y ; (settings + 0)
63ed : a5 15 __ LDA P8 ; (ch_num + 0)
63ef : f0 41 __ BEQ $6432 ; (txtscr_bigfont_init.s4 + 0)
.s10:
63f1 : a5 14 __ LDA P7 ; (ch_height + 0)
63f3 : 85 1b __ STA ACCU + 0 
63f5 : a9 00 __ LDA #$00
63f7 : 85 1c __ STA ACCU + 1 
63f9 : a5 12 __ LDA P5 ; (width + 0)
63fb : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
63fe : a5 05 __ LDA WORK + 2 
6400 : 85 46 __ STA T6 + 0 
6402 : a5 06 __ LDA WORK + 3 
6404 : 85 47 __ STA T6 + 1 
6406 : a5 13 __ LDA P6 ; (ch_width + 0)
6408 : 85 03 __ STA WORK + 0 
640a : a5 12 __ LDA P5 ; (width + 0)
640c : 85 1b __ STA ACCU + 0 
640e : a9 00 __ LDA #$00
6410 : 85 1c __ STA ACCU + 1 
6412 : 85 04 __ STA WORK + 1 
6414 : 20 14 68 JSR $6814 ; (divmod + 0)
6417 : a5 1b __ LDA ACCU + 0 
6419 : 85 44 __ STA T3 + 0 
641b : a5 1c __ LDA ACCU + 1 
641d : 85 45 __ STA T3 + 1 
641f : 18 __ __ CLC
6420 : a5 0d __ LDA P0 ; (settings + 0)
6422 : 69 06 __ ADC #$06
6424 : 85 48 __ STA T8 + 0 
6426 : a5 0e __ LDA P1 ; (settings + 1)
6428 : 69 00 __ ADC #$00
642a : 85 49 __ STA T8 + 1 
642c : a9 00 __ LDA #$00
642e : 85 43 __ STA T2 + 0 
6430 : f0 1b __ BEQ $644d ; (txtscr_bigfont_init.l1006 + 0)
.s4:
6432 : a5 14 __ LDA P7 ; (ch_height + 0)
6434 : f0 16 __ BEQ $644c ; (txtscr_bigfont_init.s1001 + 0)
.s9:
6436 : 18 __ __ CLC
6437 : a5 0d __ LDA P0 ; (settings + 0)
6439 : 69 bc __ ADC #$bc
643b : 85 0d __ STA P0 ; (settings + 0)
643d : 90 02 __ BCC $6441 ; (txtscr_bigfont_init.s1013 + 0)
.s1012:
643f : e6 0e __ INC P1 ; (settings + 1)
.s1013:
6441 : a0 00 __ LDY #$00
.l1008:
6443 : b1 16 __ LDA (P9),y ; (color + 0)
6445 : 91 0d __ STA (P0),y ; (settings + 0)
6447 : c8 __ __ INY
6448 : c4 14 __ CPY P7 ; (ch_height + 0)
644a : 90 f7 __ BCC $6443 ; (txtscr_bigfont_init.l1008 + 0)
.s1001:
644c : 60 __ __ RTS
.l1006:
644d : 85 1b __ STA ACCU + 0 
644f : a9 00 __ LDA #$00
6451 : 85 1c __ STA ACCU + 1 
6453 : a5 44 __ LDA T3 + 0 
6455 : 85 03 __ STA WORK + 0 
6457 : a5 45 __ LDA T3 + 1 
6459 : 85 04 __ STA WORK + 1 
645b : 20 14 68 JSR $6814 ; (divmod + 0)
645e : a5 05 __ LDA WORK + 2 
6460 : 85 4a __ STA T10 + 0 
6462 : a5 06 __ LDA WORK + 3 
6464 : 85 4b __ STA T10 + 1 
6466 : a5 46 __ LDA T6 + 0 
6468 : 85 03 __ STA WORK + 0 
646a : a5 47 __ LDA T6 + 1 
646c : 85 04 __ STA WORK + 1 
646e : 20 d2 67 JSR $67d2 ; (mul16 + 0)
6471 : 18 __ __ CLC
6472 : a5 10 __ LDA P3 ; (sp + 0)
6474 : 65 05 __ ADC WORK + 2 
6476 : 85 4c __ STA T11 + 0 
6478 : a5 11 __ LDA P4 ; (sp + 1)
647a : 65 06 __ ADC WORK + 3 
647c : 85 4d __ STA T11 + 1 
647e : a5 4a __ LDA T10 + 0 
6480 : 85 1b __ STA ACCU + 0 
6482 : a5 4b __ LDA T10 + 1 
6484 : 85 1c __ STA ACCU + 1 
6486 : a5 13 __ LDA P6 ; (ch_width + 0)
6488 : 20 b2 67 JSR $67b2 ; (mul16by8 + 0)
648b : 18 __ __ CLC
648c : a5 4c __ LDA T11 + 0 
648e : 65 05 __ ADC WORK + 2 
6490 : a0 00 __ LDY #$00
6492 : 91 48 __ STA (T8 + 0),y 
6494 : a5 4d __ LDA T11 + 1 
6496 : 65 06 __ ADC WORK + 3 
6498 : c8 __ __ INY
6499 : 91 48 __ STA (T8 + 0),y 
649b : 18 __ __ CLC
649c : a5 48 __ LDA T8 + 0 
649e : 69 02 __ ADC #$02
64a0 : 85 48 __ STA T8 + 0 
64a2 : 90 02 __ BCC $64a6 ; (txtscr_bigfont_init.s1011 + 0)
.s1010:
64a4 : e6 49 __ INC T8 + 1 
.s1011:
64a6 : e6 43 __ INC T2 + 0 
64a8 : a5 43 __ LDA T2 + 0 
64aa : c5 15 __ CMP P8 ; (ch_num + 0)
64ac : 90 9f __ BCC $644d ; (txtscr_bigfont_init.l1006 + 0)
64ae : 4c 32 64 JMP $6432 ; (txtscr_bigfont_init.s4 + 0)
--------------------------------------------------------------------
txtscr_scroller_init: ; txtscr_scroller_init(struct TXTSCRScrollText*,struct TXTSCRBigFont*,u8*,u8,u8,u8,u8)->void
.s0:
64b1 : ad f5 bf LDA $bff5 ; (sstack + 3)
64b4 : 85 4f __ STA T0 + 0 
64b6 : 18 __ __ CLC
64b7 : 69 04 __ ADC #$04
64b9 : 85 0f __ STA P2 
64bb : ad f6 bf LDA $bff6 ; (sstack + 4)
64be : 85 50 __ STA T0 + 1 
64c0 : a9 00 __ LDA #$00
64c2 : a0 0e __ LDY #$0e
64c4 : 91 4f __ STA (T0 + 0),y 
64c6 : c8 __ __ INY
64c7 : 91 4f __ STA (T0 + 0),y 
64c9 : c8 __ __ INY
64ca : 91 4f __ STA (T0 + 0),y 
64cc : c8 __ __ INY
64cd : 91 4f __ STA (T0 + 0),y 
64cf : ad f9 bf LDA $bff9 ; (sstack + 7)
64d2 : a0 00 __ LDY #$00
64d4 : 91 4f __ STA (T0 + 0),y 
64d6 : ad fa bf LDA $bffa ; (sstack + 8)
64d9 : c8 __ __ INY
64da : 91 4f __ STA (T0 + 0),y 
64dc : ad f8 bf LDA $bff8 ; (sstack + 6)
64df : 85 44 __ STA T1 + 1 
64e1 : ad f7 bf LDA $bff7 ; (sstack + 5)
64e4 : 85 43 __ STA T1 + 0 
64e6 : c8 __ __ INY
64e7 : 91 4f __ STA (T0 + 0),y 
64e9 : a5 44 __ LDA T1 + 1 
64eb : c8 __ __ INY
64ec : 91 4f __ STA (T0 + 0),y 
64ee : a0 05 __ LDY #$05
64f0 : b1 43 __ LDA (T1 + 0),y 
64f2 : 85 14 __ STA P7 
64f4 : a5 50 __ LDA T0 + 1 
64f6 : 69 00 __ ADC #$00
64f8 : 85 10 __ STA P3 
64fa : ad fb bf LDA $bffb ; (sstack + 9)
64fd : 85 11 __ STA P4 
64ff : ad fc bf LDA $bffc ; (sstack + 10)
6502 : 85 12 __ STA P5 
6504 : ad fd bf LDA $bffd ; (sstack + 11)
6507 : 85 13 __ STA P6 
6509 : 20 bb 32 JSR $32bb ; (vdcwin_init.s0 + 0)
650c : a5 0f __ LDA P2 
650e : 8d f2 bf STA $bff2 ; (sstack + 0)
6511 : a5 10 __ LDA P3 
6513 : 8d f3 bf STA $bff3 ; (sstack + 1)
6516 : a9 f0 __ LDA #$f0
6518 : 8d f4 bf STA $bff4 ; (sstack + 2)
651b : 4c 0c 33 JMP $330c ; (vdcwin_border_clear.s0 + 0)
--------------------------------------------------------------------
vdcwin_checkch: ; vdcwin_checkch()->i16
.s0:
651e : 20 e4 ff JSR $ffe4 
6521 : 85 1b __ STA ACCU + 0 
6523 : a9 00 __ LDA #$00
6525 : 85 1c __ STA ACCU + 1 
.s1001:
6527 : 60 __ __ RTS
--------------------------------------------------------------------
txtscr_scroll_do: ; txtscr_scroll_do(struct TXTSCRScrollText*)->void
.s1000:
6528 : a2 03 __ LDX #$03
652a : b5 53 __ LDA T0 + 0,x 
652c : 9d ee bf STA $bfee,x ; (buffer + 12)
652f : ca __ __ DEX
6530 : 10 f8 __ BPL $652a ; (txtscr_scroll_do.s1000 + 2)
.s0:
6532 : a9 01 __ LDA #$01
6534 : 8d f6 bf STA $bff6 ; (sstack + 4)
6537 : ad f7 bf LDA $bff7 ; (sstack + 5)
653a : 85 53 __ STA T0 + 0 
653c : 18 __ __ CLC
653d : 69 04 __ ADC #$04
653f : 8d f4 bf STA $bff4 ; (sstack + 2)
6542 : ad f8 bf LDA $bff8 ; (sstack + 6)
6545 : 85 54 __ STA T0 + 1 
6547 : 69 00 __ ADC #$00
6549 : 8d f5 bf STA $bff5 ; (sstack + 3)
654c : 20 c8 5a JSR $5ac8 ; (vdcwin_scroll_left.s0 + 0)
654f : 4c 59 65 JMP $6559 ; (txtscr_scroll_do.l1 + 0)
.s3:
6552 : a0 0e __ LDY #$0e
6554 : 91 53 __ STA (T0 + 0),y 
6556 : c8 __ __ INY
6557 : 91 53 __ STA (T0 + 0),y 
.l1:
6559 : a0 00 __ LDY #$00
655b : b1 53 __ LDA (T0 + 0),y 
655d : 18 __ __ CLC
655e : a0 0e __ LDY #$0e
6560 : 71 53 __ ADC (T0 + 0),y 
6562 : 85 55 __ STA T1 + 0 
6564 : a0 01 __ LDY #$01
6566 : b1 53 __ LDA (T0 + 0),y 
6568 : a0 0f __ LDY #$0f
656a : 71 53 __ ADC (T0 + 0),y 
656c : 85 56 __ STA T1 + 1 
656e : a0 00 __ LDY #$00
6570 : b1 55 __ LDA (T1 + 0),y 
6572 : f0 de __ BEQ $6552 ; (txtscr_scroll_do.s3 + 0)
.s2:
6574 : 85 16 __ STA P9 
6576 : a0 05 __ LDY #$05
6578 : b1 53 __ LDA (T0 + 0),y 
657a : 85 18 __ STA P11 
657c : a0 02 __ LDY #$02
657e : b1 53 __ LDA (T0 + 0),y 
6580 : 85 14 __ STA P7 
6582 : c8 __ __ INY
6583 : b1 53 __ LDA (T0 + 0),y 
6585 : 85 15 __ STA P8 
6587 : c8 __ __ INY
6588 : b1 53 __ LDA (T0 + 0),y 
658a : 18 __ __ CLC
658b : a0 06 __ LDY #$06
658d : 71 53 __ ADC (T0 + 0),y 
658f : 38 __ __ SEC
6590 : e9 01 __ SBC #$01
6592 : 85 17 __ STA P10 
6594 : a0 10 __ LDY #$10
6596 : b1 53 __ LDA (T0 + 0),y 
6598 : 85 52 __ STA T3 + 0 
659a : 8d f2 bf STA $bff2 ; (sstack + 0)
659d : 20 e1 65 JSR $65e1 ; (txtscr_bigfont_printchar.s0 + 0)
65a0 : a6 52 __ LDX T3 + 0 
65a2 : e8 __ __ INX
65a3 : 8a __ __ TXA
65a4 : a0 10 __ LDY #$10
65a6 : 91 53 __ STA (T0 + 0),y 
65a8 : a0 04 __ LDY #$04
65aa : b1 14 __ LDA (P7),y 
65ac : 38 __ __ SEC
65ad : e9 01 __ SBC #$01
65af : a8 __ __ TAY
65b0 : a9 00 __ LDA #$00
65b2 : e9 00 __ SBC #$00
65b4 : 30 0a __ BMI $65c0 ; (txtscr_scroll_do.s6 + 0)
.s1004:
65b6 : c9 00 __ CMP #$00
65b8 : d0 1c __ BNE $65d6 ; (txtscr_scroll_do.s1001 + 0)
.s1002:
65ba : 86 43 __ STX T2 + 0 
65bc : c4 43 __ CPY T2 + 0 
65be : b0 16 __ BCS $65d6 ; (txtscr_scroll_do.s1001 + 0)
.s6:
65c0 : a9 00 __ LDA #$00
65c2 : a0 10 __ LDY #$10
65c4 : 91 53 __ STA (T0 + 0),y 
65c6 : 18 __ __ CLC
65c7 : a0 0e __ LDY #$0e
65c9 : b1 53 __ LDA (T0 + 0),y 
65cb : 69 01 __ ADC #$01
65cd : 91 53 __ STA (T0 + 0),y 
65cf : c8 __ __ INY
65d0 : b1 53 __ LDA (T0 + 0),y 
65d2 : 69 00 __ ADC #$00
65d4 : 91 53 __ STA (T0 + 0),y 
.s1001:
65d6 : a2 03 __ LDX #$03
65d8 : bd ee bf LDA $bfee,x ; (buffer + 12)
65db : 95 53 __ STA T0 + 0,x 
65dd : ca __ __ DEX
65de : 10 f8 __ BPL $65d8 ; (txtscr_scroll_do.s1001 + 2)
65e0 : 60 __ __ RTS
--------------------------------------------------------------------
txtscr_bigfont_printchar: ; txtscr_bigfont_printchar(struct TXTSCRBigFont*,u8,u8,u8,u8)->void
.s0:
65e1 : 18 __ __ CLC
65e2 : a5 14 __ LDA P7 ; (settings + 0)
65e4 : 69 bc __ ADC #$bc
65e6 : 85 46 __ STA T2 + 0 
65e8 : a5 15 __ LDA P8 ; (settings + 1)
65ea : 69 00 __ ADC #$00
65ec : 85 47 __ STA T2 + 1 
65ee : a5 16 __ LDA P9 ; (ch + 0)
65f0 : 0a __ __ ASL
65f1 : aa __ __ TAX
65f2 : a9 00 __ LDA #$00
65f4 : 85 45 __ STA T0 + 0 
65f6 : 2a __ __ ROL
65f7 : a8 __ __ TAY
65f8 : 8a __ __ TXA
65f9 : 38 __ __ SEC
65fa : e9 40 __ SBC #$40
65fc : b0 01 __ BCS $65ff ; (txtscr_bigfont_printchar.s1005 + 0)
.s1004:
65fe : 88 __ __ DEY
.s1005:
65ff : 18 __ __ CLC
6600 : 65 14 __ ADC P7 ; (settings + 0)
6602 : 85 48 __ STA T4 + 0 
6604 : 98 __ __ TYA
6605 : 65 15 __ ADC P8 ; (settings + 1)
6607 : 85 49 __ STA T4 + 1 
6609 : a0 06 __ LDY #$06
660b : b1 48 __ LDA (T4 + 0),y 
660d : aa __ __ TAX
660e : c8 __ __ INY
660f : b1 48 __ LDA (T4 + 0),y 
6611 : 86 48 __ STX T4 + 0 
6613 : 4c 52 66 JMP $6652 ; (txtscr_bigfont_printchar.l1 + 0)
.s2:
6616 : a0 01 __ LDY #$01
6618 : b1 14 __ LDA (P7),y ; (settings + 0)
661a : 85 0d __ STA P0 
661c : a5 48 __ LDA T4 + 0 
661e : 6d f2 bf ADC $bff2 ; (sstack + 0)
6621 : 85 0e __ STA P1 
6623 : a5 49 __ LDA T4 + 1 
6625 : 69 00 __ ADC #$00
6627 : 85 0f __ STA P2 
6629 : 20 e0 14 JSR $14e0 ; (bnk_readb.s0 + 0)
662c : 85 12 __ STA P5 
662e : a4 45 __ LDY T0 + 0 
6630 : b1 46 __ LDA (T2 + 0),y 
6632 : 85 13 __ STA P6 
6634 : a5 17 __ LDA P10 ; (x + 0)
6636 : 85 10 __ STA P3 
6638 : 18 __ __ CLC
6639 : a5 18 __ LDA P11 ; (y + 0)
663b : 65 45 __ ADC T0 + 0 
663d : 85 11 __ STA P4 
663f : 20 1b 35 JSR $351b ; (vdc_printc.s0 + 0)
6642 : a5 48 __ LDA T4 + 0 
6644 : 18 __ __ CLC
6645 : a0 02 __ LDY #$02
6647 : 71 14 __ ADC (P7),y ; (settings + 0)
6649 : 85 48 __ STA T4 + 0 
664b : a5 49 __ LDA T4 + 1 
664d : c8 __ __ INY
664e : 71 14 __ ADC (P7),y ; (settings + 0)
6650 : e6 45 __ INC T0 + 0 
.l1:
6652 : 85 49 __ STA T4 + 1 
6654 : a5 45 __ LDA T0 + 0 
6656 : a0 05 __ LDY #$05
6658 : d1 14 __ CMP (P7),y ; (settings + 0)
665a : 90 ba __ BCC $6616 ; (txtscr_bigfont_printchar.s2 + 0)
.s1001:
665c : 60 __ __ RTS
--------------------------------------------------------------------
charset_demo: ; charset_demo()->void
.s1000:
665d : a5 53 __ LDA T0 + 0 
665f : 8d b8 bf STA $bfb8 ; (bigfont + 169)
.s0:
6662 : a9 18 __ LDA #$18
6664 : 20 0a 21 JSR $210a ; (vdc_reg_read.s0 + 0)
6667 : 85 53 __ STA T0 + 0 
6669 : a9 00 __ LDA #$00
666b : 85 18 __ STA P11 
666d : a9 02 __ LDA #$02
666f : 8d f2 bf STA $bff2 ; (sstack + 0)
6672 : a9 20 __ LDA #$20
6674 : 8d f3 bf STA $bff3 ; (sstack + 1)
6677 : a9 50 __ LDA #$50
6679 : 8d f4 bf STA $bff4 ; (sstack + 2)
667c : ae d0 6f LDX $6fd0 ; (vdc_state + 5)
667f : ca __ __ DEX
6680 : ca __ __ DEX
6681 : 8e f5 bf STX $bff5 ; (sstack + 3)
6684 : 20 ed 21 JSR $21ed ; (vdc_clear.s0 + 0)
6687 : a9 02 __ LDA #$02
6689 : 8d fa bf STA $bffa ; (sstack + 8)
668c : a9 00 __ LDA #$00
668e : 8d fb bf STA $bffb ; (sstack + 9)
6691 : 8d fc bf STA $bffc ; (sstack + 10)
6694 : 20 74 55 JSR $5574 ; (screen_switch.s1000 + 0)
6697 : a9 7f __ LDA #$7f
6699 : 85 11 __ STA P4 
669b : a9 01 __ LDA #$01
669d : 85 15 __ STA P8 
669f : ad db 6f LDA $6fdb ; (vdc_state + 16)
66a2 : 85 0f __ STA P2 
66a4 : ad dc 6f LDA $6fdc ; (vdc_state + 17)
66a7 : 85 10 __ STA P3 
66a9 : a9 00 __ LDA #$00
66ab : 85 14 __ STA P7 
66ad : 85 12 __ STA P5 
66af : a9 a0 __ LDA #$a0
66b1 : 85 13 __ STA P6 
66b3 : 20 00 13 JSR $1300 ; (bnk_redef_charset.s0 + 0)
66b6 : a9 7f __ LDA #$7f
66b8 : 85 17 __ STA P10 
66ba : a9 50 __ LDA #$50
66bc : 8d f4 bf STA $bff4 ; (sstack + 2)
66bf : 8d f8 bf STA $bff8 ; (sstack + 6)
66c2 : a9 00 __ LDA #$00
66c4 : 8d f5 bf STA $bff5 ; (sstack + 3)
66c7 : 8d f7 bf STA $bff7 ; (sstack + 5)
66ca : 8d f9 bf STA $bff9 ; (sstack + 7)
66cd : 8d fc bf STA $bffc ; (sstack + 10)
66d0 : a9 19 __ LDA #$19
66d2 : 8d f6 bf STA $bff6 ; (sstack + 4)
66d5 : ad d1 6f LDA $6fd1 ; (vdc_state + 6)
66d8 : 85 44 __ STA T1 + 1 
66da : d0 07 __ BNE $66e3 ; (charset_demo.s1 + 0)
.s1002:
66dc : a9 19 __ LDA #$19
66de : cd d0 6f CMP $6fd0 ; (vdc_state + 5)
66e1 : b0 04 __ BCS $66e7 ; (charset_demo.s2 + 0)
.s1:
66e3 : a9 19 __ LDA #$19
66e5 : d0 02 __ BNE $66e9 ; (charset_demo.s3 + 0)
.s2:
66e7 : a9 17 __ LDA #$17
.s3:
66e9 : 8d fa bf STA $bffa ; (sstack + 8)
66ec : a9 bb __ LDA #$bb
66ee : 85 15 __ STA P8 
66f0 : a9 bf __ LDA #$bf
66f2 : 85 16 __ STA P9 
66f4 : a9 00 __ LDA #$00
66f6 : 8d fb bf STA $bffb ; (sstack + 9)
66f9 : 8d f2 bf STA $bff2 ; (sstack + 0)
66fc : a9 40 __ LDA #$40
66fe : 8d f3 bf STA $bff3 ; (sstack + 1)
6701 : 46 44 __ LSR T1 + 1 
6703 : ad d0 6f LDA $6fd0 ; (vdc_state + 5)
6706 : 6a __ __ ROR
6707 : 38 __ __ SEC
6708 : e9 0a __ SBC #$0a
670a : 8d fd bf STA $bffd ; (sstack + 11)
670d : 20 d4 37 JSR $37d4 ; (vdcwin_viewport_init.s0 + 0)
6710 : a9 bb __ LDA #$bb
6712 : 85 16 __ STA P9 
6714 : a9 bf __ LDA #$bf
6716 : 85 17 __ STA P10 
6718 : 20 f5 38 JSR $38f5 ; (vdcwin_cpy_viewport.s0 + 0)
671b : a9 2f __ LDA #$2f
671d : 85 18 __ STA P11 
671f : a9 03 __ LDA #$03
6721 : 8d f2 bf STA $bff2 ; (sstack + 0)
6724 : a9 72 __ LDA #$72
6726 : 8d f3 bf STA $bff3 ; (sstack + 1)
6729 : a9 67 __ LDA #$67
672b : 8d f4 bf STA $bff4 ; (sstack + 2)
672e : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
6731 : a9 46 __ LDA #$46
6733 : 85 18 __ STA P11 
6735 : a9 04 __ LDA #$04
6737 : 8d f2 bf STA $bff2 ; (sstack + 0)
673a : a9 75 __ LDA #$75
673c : 8d f3 bf STA $bff3 ; (sstack + 1)
673f : a9 35 __ LDA #$35
6741 : 8d f4 bf STA $bff4 ; (sstack + 2)
6744 : 20 7a 2e JSR $2e7a ; (vdc_prints.s0 + 0)
6747 : 20 3b 2a JSR $2a3b ; (getch.s0 + 0)
674a : a9 18 __ LDA #$18
674c : 85 0d __ STA P0 
674e : a5 53 __ LDA T0 + 0 
6750 : 29 f0 __ AND #$f0
6752 : 85 0e __ STA P1 
6754 : 20 fa 20 JSR $20fa ; (vdc_reg_write.s0 + 0)
6757 : 20 07 2e JSR $2e07 ; (vdc_restore_charsets.s0 + 0)
675a : a9 02 __ LDA #$02
675c : 8d fa bf STA $bffa ; (sstack + 8)
675f : a9 01 __ LDA #$01
6761 : 8d fb bf STA $bffb ; (sstack + 9)
6764 : a9 00 __ LDA #$00
6766 : 8d fc bf STA $bffc ; (sstack + 10)
6769 : 20 74 55 JSR $5574 ; (screen_switch.s1000 + 0)
.s1001:
676c : ad b8 bf LDA $bfb8 ; (bigfont + 169)
676f : 85 53 __ STA T0 + 0 
6771 : 60 __ __ RTS
--------------------------------------------------------------------
6772 : __ __ __ BYT 67 52 41 50 48 49 43 53 20 46 52 4f 4d 20 52 45 : gRAPHICS FROM RE
6782 : __ __ __ BYT 44 45 46 49 4e 49 4e 47 20 43 48 41 52 53 45 54 : DEFINING CHARSET
6792 : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
6794 : __ __ __ BYT 4d 55 53 49 43 25 55 00                         : MUSIC%U.
--------------------------------------------------------------------
vdc_exit: ; vdc_exit()->void
.s0:
679c : a9 00 __ LDA #$00
679e : 20 33 2c JSR $2c33 ; (fastmode.s0 + 0)
67a1 : a9 00 __ LDA #$00
67a3 : 8d f6 bf STA $bff6 ; (sstack + 4)
67a6 : 20 52 2c JSR $2c52 ; (vdc_set_mode.s0 + 0)
67a9 : 20 d2 21 JSR $21d2 ; (vdc_cls.s0 + 0)
67ac : a9 04 __ LDA #$04
67ae : 8d 06 d5 STA $d506 
.s1001:
67b1 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
67b2 : a0 00 __ LDY #$00
67b4 : 84 06 __ STY WORK + 3 
67b6 : 4a __ __ LSR
67b7 : 90 0d __ BCC $67c6 ; (mul16by8 + 20)
67b9 : aa __ __ TAX
67ba : 18 __ __ CLC
67bb : 98 __ __ TYA
67bc : 65 1b __ ADC ACCU + 0 
67be : a8 __ __ TAY
67bf : a5 06 __ LDA WORK + 3 
67c1 : 65 1c __ ADC ACCU + 1 
67c3 : 85 06 __ STA WORK + 3 
67c5 : 8a __ __ TXA
67c6 : 06 1b __ ASL ACCU + 0 
67c8 : 26 1c __ ROL ACCU + 1 
67ca : 4a __ __ LSR
67cb : b0 ec __ BCS $67b9 ; (mul16by8 + 7)
67cd : d0 f7 __ BNE $67c6 ; (mul16by8 + 20)
67cf : 84 05 __ STY WORK + 2 
67d1 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
67d2 : a0 00 __ LDY #$00
67d4 : 84 06 __ STY WORK + 3 
67d6 : a5 03 __ LDA WORK + 0 
67d8 : a6 04 __ LDX WORK + 1 
67da : f0 1c __ BEQ $67f8 ; (mul16 + 38)
67dc : 38 __ __ SEC
67dd : 6a __ __ ROR
67de : 90 0d __ BCC $67ed ; (mul16 + 27)
67e0 : aa __ __ TAX
67e1 : 18 __ __ CLC
67e2 : 98 __ __ TYA
67e3 : 65 1b __ ADC ACCU + 0 
67e5 : a8 __ __ TAY
67e6 : a5 06 __ LDA WORK + 3 
67e8 : 65 1c __ ADC ACCU + 1 
67ea : 85 06 __ STA WORK + 3 
67ec : 8a __ __ TXA
67ed : 06 1b __ ASL ACCU + 0 
67ef : 26 1c __ ROL ACCU + 1 
67f1 : 4a __ __ LSR
67f2 : 90 f9 __ BCC $67ed ; (mul16 + 27)
67f4 : d0 ea __ BNE $67e0 ; (mul16 + 14)
67f6 : a5 04 __ LDA WORK + 1 
67f8 : 4a __ __ LSR
67f9 : 90 0d __ BCC $6808 ; (mul16 + 54)
67fb : aa __ __ TAX
67fc : 18 __ __ CLC
67fd : 98 __ __ TYA
67fe : 65 1b __ ADC ACCU + 0 
6800 : a8 __ __ TAY
6801 : a5 06 __ LDA WORK + 3 
6803 : 65 1c __ ADC ACCU + 1 
6805 : 85 06 __ STA WORK + 3 
6807 : 8a __ __ TXA
6808 : 06 1b __ ASL ACCU + 0 
680a : 26 1c __ ROL ACCU + 1 
680c : 4a __ __ LSR
680d : b0 ec __ BCS $67fb ; (mul16 + 41)
680f : d0 f7 __ BNE $6808 ; (mul16 + 54)
6811 : 84 05 __ STY WORK + 2 
6813 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
6814 : a5 1c __ LDA ACCU + 1 
6816 : d0 31 __ BNE $6849 ; (divmod + 53)
6818 : a5 04 __ LDA WORK + 1 
681a : d0 1e __ BNE $683a ; (divmod + 38)
681c : 85 06 __ STA WORK + 3 
681e : a2 04 __ LDX #$04
6820 : 06 1b __ ASL ACCU + 0 
6822 : 2a __ __ ROL
6823 : c5 03 __ CMP WORK + 0 
6825 : 90 02 __ BCC $6829 ; (divmod + 21)
6827 : e5 03 __ SBC WORK + 0 
6829 : 26 1b __ ROL ACCU + 0 
682b : 2a __ __ ROL
682c : c5 03 __ CMP WORK + 0 
682e : 90 02 __ BCC $6832 ; (divmod + 30)
6830 : e5 03 __ SBC WORK + 0 
6832 : 26 1b __ ROL ACCU + 0 
6834 : ca __ __ DEX
6835 : d0 eb __ BNE $6822 ; (divmod + 14)
6837 : 85 05 __ STA WORK + 2 
6839 : 60 __ __ RTS
683a : a5 1b __ LDA ACCU + 0 
683c : 85 05 __ STA WORK + 2 
683e : a5 1c __ LDA ACCU + 1 
6840 : 85 06 __ STA WORK + 3 
6842 : a9 00 __ LDA #$00
6844 : 85 1b __ STA ACCU + 0 
6846 : 85 1c __ STA ACCU + 1 
6848 : 60 __ __ RTS
6849 : a5 04 __ LDA WORK + 1 
684b : d0 1f __ BNE $686c ; (divmod + 88)
684d : a5 03 __ LDA WORK + 0 
684f : 30 1b __ BMI $686c ; (divmod + 88)
6851 : a9 00 __ LDA #$00
6853 : 85 06 __ STA WORK + 3 
6855 : a2 10 __ LDX #$10
6857 : 06 1b __ ASL ACCU + 0 
6859 : 26 1c __ ROL ACCU + 1 
685b : 2a __ __ ROL
685c : c5 03 __ CMP WORK + 0 
685e : 90 02 __ BCC $6862 ; (divmod + 78)
6860 : e5 03 __ SBC WORK + 0 
6862 : 26 1b __ ROL ACCU + 0 
6864 : 26 1c __ ROL ACCU + 1 
6866 : ca __ __ DEX
6867 : d0 f2 __ BNE $685b ; (divmod + 71)
6869 : 85 05 __ STA WORK + 2 
686b : 60 __ __ RTS
686c : a9 00 __ LDA #$00
686e : 85 05 __ STA WORK + 2 
6870 : 85 06 __ STA WORK + 3 
6872 : 84 02 __ STY $02 
6874 : a0 10 __ LDY #$10
6876 : 18 __ __ CLC
6877 : 26 1b __ ROL ACCU + 0 
6879 : 26 1c __ ROL ACCU + 1 
687b : 26 05 __ ROL WORK + 2 
687d : 26 06 __ ROL WORK + 3 
687f : 38 __ __ SEC
6880 : a5 05 __ LDA WORK + 2 
6882 : e5 03 __ SBC WORK + 0 
6884 : aa __ __ TAX
6885 : a5 06 __ LDA WORK + 3 
6887 : e5 04 __ SBC WORK + 1 
6889 : 90 04 __ BCC $688f ; (divmod + 123)
688b : 86 05 __ STX WORK + 2 
688d : 85 06 __ STA WORK + 3 
688f : 88 __ __ DEY
6890 : d0 e5 __ BNE $6877 ; (divmod + 99)
6892 : 26 1b __ ROL ACCU + 0 
6894 : 26 1c __ ROL ACCU + 1 
6896 : a4 02 __ LDY $02 
6898 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
6899 : 84 02 __ STY $02 
689b : a0 20 __ LDY #$20
689d : a9 00 __ LDA #$00
689f : 85 07 __ STA WORK + 4 
68a1 : 85 08 __ STA WORK + 5 
68a3 : 85 09 __ STA WORK + 6 
68a5 : 85 0a __ STA WORK + 7 
68a7 : a5 05 __ LDA WORK + 2 
68a9 : 05 06 __ ORA WORK + 3 
68ab : d0 39 __ BNE $68e6 ; (divmod32 + 77)
68ad : 18 __ __ CLC
68ae : 26 1b __ ROL ACCU + 0 
68b0 : 26 1c __ ROL ACCU + 1 
68b2 : 26 1d __ ROL ACCU + 2 
68b4 : 26 1e __ ROL ACCU + 3 
68b6 : 26 07 __ ROL WORK + 4 
68b8 : 26 08 __ ROL WORK + 5 
68ba : 90 0c __ BCC $68c8 ; (divmod32 + 47)
68bc : a5 07 __ LDA WORK + 4 
68be : e5 03 __ SBC WORK + 0 
68c0 : aa __ __ TAX
68c1 : a5 08 __ LDA WORK + 5 
68c3 : e5 04 __ SBC WORK + 1 
68c5 : 38 __ __ SEC
68c6 : b0 0c __ BCS $68d4 ; (divmod32 + 59)
68c8 : 38 __ __ SEC
68c9 : a5 07 __ LDA WORK + 4 
68cb : e5 03 __ SBC WORK + 0 
68cd : aa __ __ TAX
68ce : a5 08 __ LDA WORK + 5 
68d0 : e5 04 __ SBC WORK + 1 
68d2 : 90 04 __ BCC $68d8 ; (divmod32 + 63)
68d4 : 86 07 __ STX WORK + 4 
68d6 : 85 08 __ STA WORK + 5 
68d8 : 88 __ __ DEY
68d9 : d0 d3 __ BNE $68ae ; (divmod32 + 21)
68db : 26 1b __ ROL ACCU + 0 
68dd : 26 1c __ ROL ACCU + 1 
68df : 26 1d __ ROL ACCU + 2 
68e1 : 26 1e __ ROL ACCU + 3 
68e3 : a4 02 __ LDY $02 
68e5 : 60 __ __ RTS
68e6 : 18 __ __ CLC
68e7 : 26 1b __ ROL ACCU + 0 
68e9 : 26 1c __ ROL ACCU + 1 
68eb : 26 1d __ ROL ACCU + 2 
68ed : 26 1e __ ROL ACCU + 3 
68ef : 26 07 __ ROL WORK + 4 
68f1 : 26 08 __ ROL WORK + 5 
68f3 : 26 09 __ ROL WORK + 6 
68f5 : 26 0a __ ROL WORK + 7 
68f7 : a5 07 __ LDA WORK + 4 
68f9 : c5 03 __ CMP WORK + 0 
68fb : a5 08 __ LDA WORK + 5 
68fd : e5 04 __ SBC WORK + 1 
68ff : a5 09 __ LDA WORK + 6 
6901 : e5 05 __ SBC WORK + 2 
6903 : a5 0a __ LDA WORK + 7 
6905 : e5 06 __ SBC WORK + 3 
6907 : 90 18 __ BCC $6921 ; (divmod32 + 136)
6909 : a5 07 __ LDA WORK + 4 
690b : e5 03 __ SBC WORK + 0 
690d : 85 07 __ STA WORK + 4 
690f : a5 08 __ LDA WORK + 5 
6911 : e5 04 __ SBC WORK + 1 
6913 : 85 08 __ STA WORK + 5 
6915 : a5 09 __ LDA WORK + 6 
6917 : e5 05 __ SBC WORK + 2 
6919 : 85 09 __ STA WORK + 6 
691b : a5 0a __ LDA WORK + 7 
691d : e5 06 __ SBC WORK + 3 
691f : 85 0a __ STA WORK + 7 
6921 : 88 __ __ DEY
6922 : d0 c3 __ BNE $68e7 ; (divmod32 + 78)
6924 : 26 1b __ ROL ACCU + 0 
6926 : 26 1c __ ROL ACCU + 1 
6928 : 26 1d __ ROL ACCU + 2 
692a : 26 1e __ ROL ACCU + 3 
692c : a4 02 __ LDY $02 
692e : 60 __ __ RTS
--------------------------------------------------------------------
malloc: ; malloc
692f : 18 __ __ CLC
6930 : a5 1b __ LDA ACCU + 0 
6932 : 69 02 __ ADC #$02
6934 : 85 03 __ STA WORK + 0 
6936 : a5 1c __ LDA ACCU + 1 
6938 : 69 00 __ ADC #$00
693a : 85 04 __ STA WORK + 1 
693c : ad f6 6f LDA $6ff6 ; (HeapNode + 2)
693f : d0 1f __ BNE $6960 ; (malloc + 49)
6941 : a9 00 __ LDA #$00
6943 : 8d e8 71 STA $71e8 
6946 : 8d e9 71 STA $71e9 
6949 : ee f6 6f INC $6ff6 ; (HeapNode + 2)
694c : a9 e8 __ LDA #$e8
694e : 8d f4 6f STA $6ff4 ; (HeapNode + 0)
6951 : a9 71 __ LDA #$71
6953 : 8d f5 6f STA $6ff5 ; (HeapNode + 1)
6956 : a9 00 __ LDA #$00
6958 : 8d ea 71 STA $71ea 
695b : a9 b0 __ LDA #$b0
695d : 8d eb 71 STA $71eb 
6960 : a9 f4 __ LDA #$f4
6962 : a2 6f __ LDX #$6f
6964 : 85 1d __ STA ACCU + 2 
6966 : 86 1e __ STX ACCU + 3 
6968 : 18 __ __ CLC
6969 : a0 00 __ LDY #$00
696b : b1 1d __ LDA (ACCU + 2),y 
696d : 85 1b __ STA ACCU + 0 
696f : 65 03 __ ADC WORK + 0 
6971 : 85 05 __ STA WORK + 2 
6973 : c8 __ __ INY
6974 : b1 1d __ LDA (ACCU + 2),y 
6976 : 85 1c __ STA ACCU + 1 
6978 : f0 18 __ BEQ $6992 ; (malloc + 99)
697a : 65 04 __ ADC WORK + 1 
697c : 85 06 __ STA WORK + 3 
697e : a0 02 __ LDY #$02
6980 : b1 1b __ LDA (ACCU + 0),y 
6982 : c5 05 __ CMP WORK + 2 
6984 : c8 __ __ INY
6985 : b1 1b __ LDA (ACCU + 0),y 
6987 : e5 06 __ SBC WORK + 3 
6989 : b0 08 __ BCS $6993 ; (malloc + 100)
698b : a5 1b __ LDA ACCU + 0 
698d : a6 1c __ LDX ACCU + 1 
698f : 4c 64 69 JMP $6964 ; (malloc + 53)
6992 : 60 __ __ RTS
6993 : 18 __ __ CLC
6994 : a5 05 __ LDA WORK + 2 
6996 : 69 03 __ ADC #$03
6998 : 29 fc __ AND #$fc
699a : 85 07 __ STA WORK + 4 
699c : a5 06 __ LDA WORK + 3 
699e : 69 00 __ ADC #$00
69a0 : 85 08 __ STA WORK + 5 
69a2 : a0 02 __ LDY #$02
69a4 : a5 07 __ LDA WORK + 4 
69a6 : d1 1b __ CMP (ACCU + 0),y 
69a8 : d0 15 __ BNE $69bf ; (malloc + 144)
69aa : c8 __ __ INY
69ab : a5 08 __ LDA WORK + 5 
69ad : d1 1b __ CMP (ACCU + 0),y 
69af : d0 0e __ BNE $69bf ; (malloc + 144)
69b1 : a0 00 __ LDY #$00
69b3 : b1 1b __ LDA (ACCU + 0),y 
69b5 : 91 1d __ STA (ACCU + 2),y 
69b7 : c8 __ __ INY
69b8 : b1 1b __ LDA (ACCU + 0),y 
69ba : 91 1d __ STA (ACCU + 2),y 
69bc : 4c dc 69 JMP $69dc ; (malloc + 173)
69bf : a0 00 __ LDY #$00
69c1 : b1 1b __ LDA (ACCU + 0),y 
69c3 : 91 07 __ STA (WORK + 4),y 
69c5 : a5 07 __ LDA WORK + 4 
69c7 : 91 1d __ STA (ACCU + 2),y 
69c9 : c8 __ __ INY
69ca : b1 1b __ LDA (ACCU + 0),y 
69cc : 91 07 __ STA (WORK + 4),y 
69ce : a5 08 __ LDA WORK + 5 
69d0 : 91 1d __ STA (ACCU + 2),y 
69d2 : c8 __ __ INY
69d3 : b1 1b __ LDA (ACCU + 0),y 
69d5 : 91 07 __ STA (WORK + 4),y 
69d7 : c8 __ __ INY
69d8 : b1 1b __ LDA (ACCU + 0),y 
69da : 91 07 __ STA (WORK + 4),y 
69dc : a0 00 __ LDY #$00
69de : a5 05 __ LDA WORK + 2 
69e0 : 91 1b __ STA (ACCU + 0),y 
69e2 : c8 __ __ INY
69e3 : a5 06 __ LDA WORK + 3 
69e5 : 91 1b __ STA (ACCU + 0),y 
69e7 : a5 1b __ LDA ACCU + 0 
69e9 : 09 02 __ ORA #$02
69eb : 85 1b __ STA ACCU + 0 
69ed : 60 __ __ RTS
--------------------------------------------------------------------
free: ; free
69ee : a5 1b __ LDA ACCU + 0 
69f0 : 29 fc __ AND #$fc
69f2 : 85 1b __ STA ACCU + 0 
69f4 : 05 1c __ ORA ACCU + 1 
69f6 : d0 01 __ BNE $69f9 ; (free + 11)
69f8 : 60 __ __ RTS
69f9 : 18 __ __ CLC
69fa : a0 00 __ LDY #$00
69fc : b1 1b __ LDA (ACCU + 0),y 
69fe : 69 03 __ ADC #$03
6a00 : 29 fc __ AND #$fc
6a02 : 85 1d __ STA ACCU + 2 
6a04 : c8 __ __ INY
6a05 : b1 1b __ LDA (ACCU + 0),y 
6a07 : 69 00 __ ADC #$00
6a09 : 85 1e __ STA ACCU + 3 
6a0b : a9 f4 __ LDA #$f4
6a0d : a2 6f __ LDX #$6f
6a0f : 85 05 __ STA WORK + 2 
6a11 : 86 06 __ STX WORK + 3 
6a13 : a0 01 __ LDY #$01
6a15 : b1 05 __ LDA (WORK + 2),y 
6a17 : f0 28 __ BEQ $6a41 ; (free + 83)
6a19 : aa __ __ TAX
6a1a : 88 __ __ DEY
6a1b : b1 05 __ LDA (WORK + 2),y 
6a1d : e4 1e __ CPX ACCU + 3 
6a1f : 90 ee __ BCC $6a0f ; (free + 33)
6a21 : d0 1e __ BNE $6a41 ; (free + 83)
6a23 : c5 1d __ CMP ACCU + 2 
6a25 : 90 e8 __ BCC $6a0f ; (free + 33)
6a27 : d0 18 __ BNE $6a41 ; (free + 83)
6a29 : a0 00 __ LDY #$00
6a2b : b1 1d __ LDA (ACCU + 2),y 
6a2d : 91 1b __ STA (ACCU + 0),y 
6a2f : c8 __ __ INY
6a30 : b1 1d __ LDA (ACCU + 2),y 
6a32 : 91 1b __ STA (ACCU + 0),y 
6a34 : c8 __ __ INY
6a35 : b1 1d __ LDA (ACCU + 2),y 
6a37 : 91 1b __ STA (ACCU + 0),y 
6a39 : c8 __ __ INY
6a3a : b1 1d __ LDA (ACCU + 2),y 
6a3c : 91 1b __ STA (ACCU + 0),y 
6a3e : 4c 56 6a JMP $6a56 ; (free + 104)
6a41 : a0 00 __ LDY #$00
6a43 : b1 05 __ LDA (WORK + 2),y 
6a45 : 91 1b __ STA (ACCU + 0),y 
6a47 : c8 __ __ INY
6a48 : b1 05 __ LDA (WORK + 2),y 
6a4a : 91 1b __ STA (ACCU + 0),y 
6a4c : c8 __ __ INY
6a4d : a5 1d __ LDA ACCU + 2 
6a4f : 91 1b __ STA (ACCU + 0),y 
6a51 : c8 __ __ INY
6a52 : a5 1e __ LDA ACCU + 3 
6a54 : 91 1b __ STA (ACCU + 0),y 
6a56 : a0 02 __ LDY #$02
6a58 : b1 05 __ LDA (WORK + 2),y 
6a5a : c5 1b __ CMP ACCU + 0 
6a5c : d0 1d __ BNE $6a7b ; (free + 141)
6a5e : c8 __ __ INY
6a5f : b1 05 __ LDA (WORK + 2),y 
6a61 : c5 1c __ CMP ACCU + 1 
6a63 : d0 16 __ BNE $6a7b ; (free + 141)
6a65 : a0 00 __ LDY #$00
6a67 : b1 1b __ LDA (ACCU + 0),y 
6a69 : 91 05 __ STA (WORK + 2),y 
6a6b : c8 __ __ INY
6a6c : b1 1b __ LDA (ACCU + 0),y 
6a6e : 91 05 __ STA (WORK + 2),y 
6a70 : c8 __ __ INY
6a71 : b1 1b __ LDA (ACCU + 0),y 
6a73 : 91 05 __ STA (WORK + 2),y 
6a75 : c8 __ __ INY
6a76 : b1 1b __ LDA (ACCU + 0),y 
6a78 : 91 05 __ STA (WORK + 2),y 
6a7a : 60 __ __ RTS
6a7b : a0 00 __ LDY #$00
6a7d : a5 1b __ LDA ACCU + 0 
6a7f : 91 05 __ STA (WORK + 2),y 
6a81 : c8 __ __ INY
6a82 : a5 1c __ LDA ACCU + 1 
6a84 : 91 05 __ STA (WORK + 2),y 
6a86 : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
6a87 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
__multab13L:
6a8d : __ __ __ BYT 00 0d 1a 27                                     : ...'
--------------------------------------------------------------------
__multab9L:
6a91 : __ __ __ BYT 00 09 12 1b 24 2d 36                            : ....$-6
--------------------------------------------------------------------
__multab102L:
6a98 : __ __ __ BYT 00 66 cc 32 98 fe 64 ca                         : .f.2..d.
--------------------------------------------------------------------
__multab102H:
6aa0 : __ __ __ BYT 00 00 00 01 01 01 02 02                         : ........
--------------------------------------------------------------------
__multab6L:
6aa8 : __ __ __ BYT 00 06 0c 12 18                                  : .....
--------------------------------------------------------------------
__multab15L:
6aad : __ __ __ BYT 00 0f 1e 2d 3c                                  : ...-<
--------------------------------------------------------------------
winStyles:
6ab2 : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
6ac2 : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
pulldown_options:
6ac4 : __ __ __ BYT 03 02 02 03 01 04 02 06                         : ........
--------------------------------------------------------------------
seed:
6acc : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
6ace : __ __ __ BYT 74 48 45 00 61 00 00 00                         : tHE.a...
--------------------------------------------------------------------
6ad6 : __ __ __ BYT 46 4c 49 45 53 00 4a 55 4d 50 53 00 53 4c 45 45 : FLIES.JUMPS.SLEE
6ae6 : __ __ __ BYT 50 53 45 41 54 53 00 00 57 41 4c 4b 53 00       : PSEATS..WALKS.
--------------------------------------------------------------------
p2smap:
6af4 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
bootdevice:
6afc : __ __ __ BSS	1
--------------------------------------------------------------------
vdc_modes:
6b00 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
6b10 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
6b20 : __ __ __ BYT e7 24 7e ff 50 00 32 00 00 00 00 00 10 00 40 00 : .$~.P.2.......@.
6b30 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
6b40 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
6b50 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
6b60 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
6b70 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
6b80 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
6b90 : __ __ __ BYT 50 00 32 00 00 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
6ba0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
6bb0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
6bc0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
6bd0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
6bd8 : __ __ __ BYT 42 49 47 00 00 00 53 4d 41 4c 4c 00 41 4e 47 52 : BIG...SMALL.ANGR
6be8 : __ __ __ BYT 59 00 57 45 54 00 00 00 48 41 50 50 59 00       : Y.WET...HAPPY.
--------------------------------------------------------------------
s2pmap:
6bf6 : __ __ __ BYT 40 00 20 c0 c0 80 a0 40                         : @. ....@
--------------------------------------------------------------------
menubar:
6c00 : __ __ __ BYT 73 45 54 54 49 4e 47 53 00 77 49 4e 44 4f 57 53 : sETTINGS.wINDOWS
6c10 : __ __ __ BYT 00 00 76 49 45 57 50 4f 52 54 00 73 43 52 4f 4c : ..vIEWPORT.sCROL
6c20 : __ __ __ BYT 4c 00 00 00 63 48 41 52 53 45 54 00 00 6d 55 53 : L...cHARSET..mUS
6c30 : __ __ __ BYT 49 43 00 00 00 00 00 00 00 00 00 00 01          : IC...........
--------------------------------------------------------------------
pulldown_titles:
6c3d : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 00 00 00 00 00 00 : sCREENMODE......
6c4d : __ __ __ BYT 00 69 4e 46 4f 20 20 20 20 20 20 00 00 00 00 00 : .iNFO      .....
6c5d : __ __ __ BYT 00 00 65 58 49 54 20 20 20 20 20 20 00 00 00 00 : ..eXIT      ....
6c6d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6c7d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6c8d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6c9d : __ __ __ BYT 00 00 00 00 00 00 77 49 4e 44 4f 57 20 4f 4e 20 : ......wINDOW ON 
6cad : __ __ __ BYT 57 49 4e 44 4f 57 00 74 45 58 54 20 45 4e 54 52 : WINDOW.tEXT ENTR
6cbd : __ __ __ BYT 59 20 20 20 20 20 20 00 00 00 00 00 00 00 00 00 : Y      .........
6ccd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6cdd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6ced : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6cfd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 73 43 52 45 : ............sCRE
6d0d : __ __ __ BYT 45 4e 20 31 00 00 00 00 00 00 00 00 00 73 43 52 : EN 1.........sCR
6d1d : __ __ __ BYT 45 45 4e 20 32 00 00 00 00 00 00 00 00 00 00 00 : EEN 2...........
6d2d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6d3d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6d4d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6d5d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6d6d : __ __ __ BYT 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 31 00 00 : ..fULLSCREEN 1..
6d7d : __ __ __ BYT 00 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 32 00 : ...fULLSCREEN 2.
6d8d : __ __ __ BYT 00 00 00 00 62 49 47 46 4f 4e 54 20 54 45 58 54 : ....bIGFONT TEXT
6d9d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6dad : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6dbd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6dcd : __ __ __ BYT 00 00 00 00 00 00 00 00 63 48 41 52 53 45 54 20 : ........cHARSET 
6ddd : __ __ __ BYT 44 45 4d 4f 00 00 00 00 00 00 00 00 00 00 00 00 : DEMO............
6ded : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6dfd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6e0d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6e1d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6e2d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 75 4c : ..............uL
6e3d : __ __ __ BYT 54 49 4d 41 54 45 20 61 58 45 4c 20 66 00 00 66 : TIMATE aXEL f..f
6e4d : __ __ __ BYT 41 44 45 44 20 20 20 20 20 20 20 20 20 20 00 00 : ADED          ..
6e5d : __ __ __ BYT 73 54 4f 50 20 4d 55 53 49 43 20 20 20 20 20 00 : sTOP MUSIC     .
6e6d : __ __ __ BYT 00 72 45 53 54 41 52 54 20 4d 55 53 49 43 20 20 : .rESTART MUSIC  
6e7d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6e8d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6e9d : __ __ __ BYT 00 00 00 00 79 45 53 00 00 00 00 00 00 00 00 00 : ....yES.........
6ead : __ __ __ BYT 00 00 00 00 00 6e 4f 20 00 00 00 00 00 00 00 00 : .....nO ........
6ebd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6ecd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6edd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6eed : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
6efd : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 70 61 6c 20 20 38 : ..........pal  8
6f0d : __ __ __ BYT 30 58 32 35 00 00 00 00 00 00 00 70 61 6c 20 20 : 0X25.......pal  
6f1d : __ __ __ BYT 38 30 58 35 30 00 00 00 00 00 00 00 70 61 6c 20 : 80X50.......pal 
6f2d : __ __ __ BYT 20 38 30 58 37 30 00 00 00 00 00 00 00 6e 74 73 :  80X70.......nts
6f3d : __ __ __ BYT 63 20 38 30 58 32 35 00 00 00 00 00 00 00 6e 74 : c 80X25.......nt
6f4d : __ __ __ BYT 73 63 20 38 30 58 35 30 00 00 00 00 00 00 00 6e : sc 80X50.......n
6f5d : __ __ __ BYT 74 73 63 20 38 30 58 36 30 00 00 00 00 00 00 00 : tsc 80X60.......
--------------------------------------------------------------------
6f6d : __ __ __ BYT 42 4c 55 45 20 4a 41 59 00 00 00 00 00 00 00 43 : BLUE JAY.......C
6f7d : __ __ __ BYT 41 52 44 49 4e 41 4c 00 00 00 00 00 00 00 45 41 : ARDINAL.......EA
6f8d : __ __ __ BYT 53 54 45 52 4e 20 50 48 4f 45 42 45 00 47 52 41 : STERN PHOEBE.GRA
6f9d : __ __ __ BYT 43 4b 4c 45 00 00 00 00 00 00 00 00 53 41 4e 44 : CKLE........SAND
6fad : __ __ __ BYT 48 49 4c 4c 20 43 52 41 4e 45 00                : HILL CRANE.
--------------------------------------------------------------------
screenset:
6fb8 : __ __ __ BYT 50 96 a0 4b 50 19                               : P..KP.
--------------------------------------------------------------------
6fbe : __ __ __ BYT 0e 07 06 03 02                                  : .....
--------------------------------------------------------------------
winCfg:
6fc3 : __ __ __ BSS	8
--------------------------------------------------------------------
vdc_state:
6fcb : __ __ __ BSS	25
--------------------------------------------------------------------
krnio_pstatus:
6fe4 : __ __ __ BSS	16
--------------------------------------------------------------------
HeapNode:
6ff4 : __ __ __ BSS	4
--------------------------------------------------------------------
7000 : __ __ __ BYT 77 45 4c 43 4f 4d 45 20 54 4f 20 6f 53 43 41 52 : wELCOME TO oSCAR
7010 : __ __ __ BYT 36 34 20 76 64 63 20 64 45 4d 4f 2e 20 74 48 49 : 64 vdc dEMO. tHI
7020 : __ __ __ BYT 53 20 44 45 4d 4f 20 49 53 20 57 52 49 54 54 45 : S DEMO IS WRITTE
7030 : __ __ __ BYT 4e 20 54 4f 20 54 45 53 54 20 41 4e 44 20 44 45 : N TO TEST AND DE
7040 : __ __ __ BYT 4d 4f 4e 53 54 52 41 54 45 20 54 48 45 20 76 64 : MONSTRATE THE vd
7050 : __ __ __ BYT 63 20 4c 49 42 52 41 52 59 20 46 55 4e 43 54 49 : c LIBRARY FUNCTI
7060 : __ __ __ BYT 4f 4e 53 20 69 20 48 41 56 45 20 54 52 49 45 44 : ONS i HAVE TRIED
7070 : __ __ __ BYT 20 54 4f 20 42 55 49 4c 44 20 46 4f 52 20 54 48 :  TO BUILD FOR TH
7080 : __ __ __ BYT 45 20 6f 53 43 41 52 36 34 20 43 4f 4d 50 49 4c : E oSCAR64 COMPIL
7090 : __ __ __ BYT 45 52 2e 20 68 4f 50 45 20 59 4f 55 20 45 4e 4a : ER. hOPE YOU ENJ
70a0 : __ __ __ BYT 4f 59 20 49 54 21 20 67 52 45 45 54 49 4e 47 53 : OY IT! gREETINGS
70b0 : __ __ __ BYT 2c 20 78 41 4e 44 45 52 20 6d 4f 4c 2e 20 20 20 : , xANDER mOL.   
70c0 : __ __ __ BYT 20 20 00                                        :   .
--------------------------------------------------------------------
windows:
70c3 : __ __ __ BSS	39
--------------------------------------------------------------------
multab:
7100 : __ __ __ BSS	144
--------------------------------------------------------------------
linebuffer:
7190 : __ __ __ BSS	81
--------------------------------------------------------------------
bnk_redef_charset: ; bnk_redef_charset(u16,u8,u8*,u16)->void
.s0:
01:1300 : ad 00 ff LDA $ff00 
01:1303 : 85 43 __ STA T0 + 0 
01:1305 : a9 0e __ LDA #$0e
01:1307 : 8d 00 ff STA $ff00 
01:130a : a5 0f __ LDA P2 ; (vdcdest + 0)
01:130c : 85 0d __ STA P0 
01:130e : a5 10 __ LDA P3 ; (vdcdest + 1)
01:1310 : 85 0e __ STA P1 
01:1312 : 20 b0 22 JSR $22b0 ; (vdc_mem_addr.s0 + 0)
01:1315 : a5 14 __ LDA P7 ; (size + 0)
01:1317 : 05 15 __ ORA P8 ; (size + 1)
01:1319 : d0 06 __ BNE $1321 ; (bnk_redef_charset.l2 + 0)
.s3:
01:131b : a5 43 __ LDA T0 + 0 
01:131d : 8d 00 ff STA $ff00 
.s1001:
01:1320 : 60 __ __ RTS
.l2:
01:1321 : a2 08 __ LDX #$08
.l5:
01:1323 : a5 11 __ LDA P4 ; (scr + 0)
01:1325 : 8d 00 ff STA $ff00 
01:1328 : a0 00 __ LDY #$00
01:132a : b1 12 __ LDA (P5),y ; (sp + 0)
01:132c : a8 __ __ TAY
01:132d : e6 12 __ INC P5 ; (sp + 0)
01:132f : d0 02 __ BNE $1333 ; (bnk_redef_charset.s1012 + 0)
.s1011:
01:1331 : e6 13 __ INC P6 ; (sp + 1)
.s1012:
01:1333 : a9 0e __ LDA #$0e
01:1335 : 8d 00 ff STA $ff00 
.l117:
01:1338 : 2c 00 d6 BIT $d600 
01:133b : 10 fb __ BPL $1338 ; (bnk_redef_charset.l117 + 0)
.s10:
01:133d : 8c 01 d6 STY $d601 
01:1340 : ca __ __ DEX
01:1341 : d0 e0 __ BNE $1323 ; (bnk_redef_charset.l5 + 0)
.s7:
01:1343 : a2 08 __ LDX #$08
.l12:
01:1345 : 2c 00 d6 BIT $d600 
01:1348 : 10 fb __ BPL $1345 ; (bnk_redef_charset.l12 + 0)
.s17:
01:134a : a9 00 __ LDA #$00
01:134c : 8d 01 d6 STA $d601 
01:134f : ca __ __ DEX
01:1350 : d0 f3 __ BNE $1345 ; (bnk_redef_charset.l12 + 0)
.s14:
01:1352 : a5 14 __ LDA P7 ; (size + 0)
01:1354 : d0 02 __ BNE $1358 ; (bnk_redef_charset.s1007 + 0)
.s1006:
01:1356 : c6 15 __ DEC P8 ; (size + 1)
.s1007:
01:1358 : c6 14 __ DEC P7 ; (size + 0)
01:135a : d0 c5 __ BNE $1321 ; (bnk_redef_charset.l2 + 0)
.s1008:
01:135c : a5 15 __ LDA P8 ; (size + 1)
01:135e : d0 c1 __ BNE $1321 ; (bnk_redef_charset.l2 + 0)
01:1360 : 4c 1b 13 JMP $131b ; (bnk_redef_charset.s3 + 0)
--------------------------------------------------------------------
bnk_load: ; bnk_load(u8,u8,const u8*,const u8*)->bool
.s0:
01:1363 : a9 00 __ LDA #$00
01:1365 : 85 0e __ STA P1 
01:1367 : a5 10 __ LDA P3 ; (bank + 0)
01:1369 : 85 0d __ STA P0 
01:136b : 20 f4 2a JSR $2af4 ; (krnio_setbnk.s0 + 0)
01:136e : a5 13 __ LDA P6 ; (fname + 0)
01:1370 : 85 0d __ STA P0 
01:1372 : a5 14 __ LDA P7 ; (fname + 1)
01:1374 : 85 0e __ STA P1 
01:1376 : 20 a8 2b JSR $2ba8 ; (krnio_setnam.s0 + 0)
01:1379 : a9 01 __ LDA #$01
01:137b : a6 0f __ LDX P2 
01:137d : a0 00 __ LDY #$00
01:137f : 20 ba ff JSR $ffba 
01:1382 : a9 00 __ LDA #$00
01:1384 : a6 11 __ LDX P4 
01:1386 : a4 12 __ LDY P5 
01:1388 : 20 d5 ff JSR $ffd5 
01:138b : a9 00 __ LDA #$00
01:138d : b0 02 __ BCS $1391 ; (bnk_load.s0 + 46)
01:138f : a9 01 __ LDA #$01
01:1391 : 85 1b __ STA ACCU + 0 
.s1001:
01:1393 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpyfromvdc: ; bnk_cpyfromvdc(u8,u8*,u16,u16)->void
.s0:
01:1394 : ad 00 ff LDA $ff00 
01:1397 : 85 43 __ STA T1 + 0 
01:1399 : a5 14 __ LDA P7 ; (size + 0)
01:139b : 05 15 __ ORA P8 ; (size + 1)
01:139d : f0 48 __ BEQ $13e7 ; (bnk_cpyfromvdc.s3 + 0)
.l2:
01:139f : a9 0e __ LDA #$0e
01:13a1 : 8d 00 ff STA $ff00 
01:13a4 : a5 12 __ LDA P5 ; (vdcsrc + 0)
01:13a6 : 85 0d __ STA P0 
01:13a8 : 18 __ __ CLC
01:13a9 : 69 01 __ ADC #$01
01:13ab : 85 12 __ STA P5 ; (vdcsrc + 0)
01:13ad : a5 13 __ LDA P6 ; (vdcsrc + 1)
01:13af : 85 0e __ STA P1 
01:13b1 : 69 00 __ ADC #$00
01:13b3 : 85 13 __ STA P6 ; (vdcsrc + 1)
01:13b5 : 20 a6 21 JSR $21a6 ; (vdc_mem_read_at.s0 + 0)
01:13b8 : aa __ __ TAX
01:13b9 : a5 0f __ LDA P2 ; (dcr + 0)
01:13bb : 8d 00 ff STA $ff00 
01:13be : a5 10 __ LDA P3 ; (dp + 0)
01:13c0 : 85 1b __ STA ACCU + 0 
01:13c2 : 18 __ __ CLC
01:13c3 : 69 01 __ ADC #$01
01:13c5 : 85 10 __ STA P3 ; (dp + 0)
01:13c7 : a5 11 __ LDA P4 ; (dp + 1)
01:13c9 : 85 1c __ STA ACCU + 1 
01:13cb : 69 00 __ ADC #$00
01:13cd : 85 11 __ STA P4 ; (dp + 1)
01:13cf : 8a __ __ TXA
01:13d0 : a0 00 __ LDY #$00
01:13d2 : 91 1b __ STA (ACCU + 0),y 
01:13d4 : a9 0e __ LDA #$0e
01:13d6 : 8d 00 ff STA $ff00 
01:13d9 : a5 14 __ LDA P7 ; (size + 0)
01:13db : d0 02 __ BNE $13df ; (bnk_cpyfromvdc.s1003 + 0)
.s1002:
01:13dd : c6 15 __ DEC P8 ; (size + 1)
.s1003:
01:13df : c6 14 __ DEC P7 ; (size + 0)
01:13e1 : d0 bc __ BNE $139f ; (bnk_cpyfromvdc.l2 + 0)
.s1004:
01:13e3 : a5 15 __ LDA P8 ; (size + 1)
01:13e5 : d0 b8 __ BNE $139f ; (bnk_cpyfromvdc.l2 + 0)
.s3:
01:13e7 : a5 43 __ LDA T1 + 0 
01:13e9 : 8d 00 ff STA $ff00 
.s1001:
01:13ec : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpytovdc: ; bnk_cpytovdc(u16,u8,u8*,u16)->void
.s0:
01:13ed : ad 00 ff LDA $ff00 
01:13f0 : 85 43 __ STA T0 + 0 
01:13f2 : a9 0e __ LDA #$0e
01:13f4 : 8d 00 ff STA $ff00 
01:13f7 : a5 0f __ LDA P2 ; (vdcdest + 0)
01:13f9 : 85 0d __ STA P0 
01:13fb : a5 10 __ LDA P3 ; (vdcdest + 1)
01:13fd : 85 0e __ STA P1 
01:13ff : 20 b0 22 JSR $22b0 ; (vdc_mem_addr.s0 + 0)
01:1402 : a5 14 __ LDA P7 ; (size + 0)
01:1404 : 05 15 __ ORA P8 ; (size + 1)
01:1406 : d0 06 __ BNE $140e ; (bnk_cpytovdc.s1008 + 0)
.s3:
01:1408 : a5 43 __ LDA T0 + 0 
01:140a : 8d 00 ff STA $ff00 
.s1001:
01:140d : 60 __ __ RTS
.s1008:
01:140e : a6 14 __ LDX P7 ; (size + 0)
.l2:
01:1410 : a5 11 __ LDA P4 ; (scr + 0)
01:1412 : 8d 00 ff STA $ff00 
01:1415 : a0 00 __ LDY #$00
01:1417 : b1 12 __ LDA (P5),y ; (sp + 0)
01:1419 : a8 __ __ TAY
01:141a : e6 12 __ INC P5 ; (sp + 0)
01:141c : d0 02 __ BNE $1420 ; (bnk_cpytovdc.s1010 + 0)
.s1009:
01:141e : e6 13 __ INC P6 ; (sp + 1)
.s1010:
01:1420 : a9 0e __ LDA #$0e
01:1422 : 8d 00 ff STA $ff00 
.l52:
01:1425 : 2c 00 d6 BIT $d600 
01:1428 : 10 fb __ BPL $1425 ; (bnk_cpytovdc.l52 + 0)
.s6:
01:142a : 8c 01 d6 STY $d601 
01:142d : 8a __ __ TXA
01:142e : d0 02 __ BNE $1432 ; (bnk_cpytovdc.s1005 + 0)
.s1004:
01:1430 : c6 15 __ DEC P8 ; (size + 1)
.s1005:
01:1432 : ca __ __ DEX
01:1433 : d0 db __ BNE $1410 ; (bnk_cpytovdc.l2 + 0)
.s1006:
01:1435 : a5 15 __ LDA P8 ; (size + 1)
01:1437 : d0 d7 __ BNE $1410 ; (bnk_cpytovdc.l2 + 0)
01:1439 : 4c 08 14 JMP $1408 ; (bnk_cpytovdc.s3 + 0)
--------------------------------------------------------------------
sid_startmusic: ; sid_startmusic()->void
.s0:
01:143c : ad 00 ff LDA $ff00 
01:143f : 85 43 __ STA T0 + 0 
01:1441 : a9 7e __ LDA #$7e
01:1443 : 8d 00 ff STA $ff00 
01:1446 : 78 __ __ SEI
01:1447 : a9 7e __ LDA #$7e
01:1449 : 8d 00 ff STA $ff00 
01:144c : a9 00 __ LDA #$00
01:144e : 20 00 20 JSR $2000 ; (main.s41 + 3)
01:1451 : ad 14 03 LDA $0314 
01:1454 : 8d 01 15 STA $1501 ; (sid_irq + 0)
01:1457 : a9 6e __ LDA #$6e
01:1459 : 8d 14 03 STA $0314 
01:145c : ad 15 03 LDA $0315 
01:145f : 8d 02 15 STA $1502 ; (sid_irq + 1)
01:1462 : a9 14 __ LDA #$14
01:1464 : 8d 15 03 STA $0315 
01:1467 : 58 __ __ CLI
01:1468 : a5 43 __ LDA T0 + 0 
01:146a : 8d 00 ff STA $ff00 
.s1001:
01:146d : 60 __ __ RTS
--------------------------------------------------------------------
sid_interrupt: ; sid_interrupt
01:146e : ad 03 15 LDA $1503 ; (sid_pause + 0)
01:1471 : d0 20 __ BNE $1493 ; (sid_interrupt + 37)
01:1473 : ad 00 ff LDA $ff00 
01:1476 : 8d 04 15 STA $1504 ; (sid_oldcr + 0)
01:1479 : a9 7e __ LDA #$7e
01:147b : 8d 00 ff STA $ff00 
01:147e : 20 03 20 JSR $2003 ; (main.s15 + 2)
01:1481 : ad 04 15 LDA $1504 ; (sid_oldcr + 0)
01:1484 : 8d 00 ff STA $ff00 
01:1487 : ad 01 15 LDA $1501 ; (sid_irq + 0)
01:148a : 8d 94 14 STA $1494 ; (sid_interrupt + 38)
01:148d : ad 02 15 LDA $1502 ; (sid_irq + 1)
01:1490 : 8d 95 14 STA $1495 ; (sid_interrupt + 39)
01:1493 : 4c 65 fa JMP $fa65 
--------------------------------------------------------------------
bnk_writeb: ; bnk_writeb(u8,u8*,u8)->void
.s0:
01:1496 : a5 0d __ LDA P0 ; (cr + 0)
01:1498 : ae 00 ff LDX $ff00 
01:149b : 8d 00 ff STA $ff00 
01:149e : a5 10 __ LDA P3 ; (b + 0)
01:14a0 : a0 00 __ LDY #$00
01:14a2 : 91 0e __ STA (P1),y ; (p + 0)
01:14a4 : 8e 00 ff STX $ff00 
.s1001:
01:14a7 : 60 __ __ RTS
--------------------------------------------------------------------
sid_pausemusic: ; sid_pausemusic()->void
.s0:
01:14a8 : 4c ab 14 JMP $14ab ; (sid_resetsid.s0 + 0)
--------------------------------------------------------------------
sid_resetsid: ; sid_resetsid()->void
.s0:
01:14ab : a2 18 __ LDX #$18
01:14ad : a9 00 __ LDA #$00
01:14af : 9d 00 d4 STA $d400,x 
01:14b2 : ca __ __ DEX
01:14b3 : 10 fa __ BPL $14af ; (sid_resetsid.s0 + 4)
01:14b5 : a9 08 __ LDA #$08
01:14b7 : 8d 04 d4 STA $d404 
01:14ba : 8d 0b d4 STA $d40b 
01:14bd : 8d 12 d4 STA $d412 
01:14c0 : a2 03 __ LDX #$03
01:14c2 : 2c 11 d0 BIT $d011 
01:14c5 : 10 fb __ BPL $14c2 ; (sid_resetsid.s0 + 23)
01:14c7 : 2c 11 d0 BIT $d011 
01:14ca : 30 fb __ BMI $14c7 ; (sid_resetsid.s0 + 28)
01:14cc : ca __ __ DEX
01:14cd : 10 f3 __ BPL $14c2 ; (sid_resetsid.s0 + 23)
01:14cf : a9 00 __ LDA #$00
01:14d1 : 8d 04 d4 STA $d404 
01:14d4 : 8d 0b d4 STA $d40b 
01:14d7 : 8d 12 d4 STA $d412 
01:14da : a9 00 __ LDA #$00
01:14dc : 8d 18 d4 STA $d418 
.s1001:
01:14df : 60 __ __ RTS
--------------------------------------------------------------------
bnk_readb: ; bnk_readb(u8,u8*)->u8
.s0:
01:14e0 : a5 0d __ LDA P0 ; (cr + 0)
01:14e2 : ae 00 ff LDX $ff00 
01:14e5 : 8d 00 ff STA $ff00 
01:14e8 : a0 00 __ LDY #$00
01:14ea : b1 0e __ LDA (P1),y ; (p + 0)
01:14ec : 8e 00 ff STX $ff00 
.s1001:
01:14ef : 60 __ __ RTS
--------------------------------------------------------------------
sid_stopmusic: ; sid_stopmusic()->void
.s0:
01:14f0 : 78 __ __ SEI
01:14f1 : ae 01 15 LDX $1501 ; (sid_irq + 0)
01:14f4 : ac 02 15 LDY $1502 ; (sid_irq + 1)
01:14f7 : 8e 14 03 STX $0314 
01:14fa : 8c 15 03 STY $0315 
01:14fd : 58 __ __ CLI
01:14fe : 4c ab 14 JMP $14ab ; (sid_resetsid.s0 + 0)
--------------------------------------------------------------------
sid_irq:
01:1501 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
sid_pause:
01:1503 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sid_oldcr:
01:1504 : __ __ __ BYT 00                                              : .
