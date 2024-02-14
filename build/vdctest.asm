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
1c13 : 8e fe 2f STX $2ffe ; (spentry + 0)
1c16 : a9 57 __ LDA #$57
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 60 __ LDA #$60
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 61 __ LDA #$61
1c21 : e9 60 __ SBC #$60
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
1c37 : e9 57 __ SBC #$57
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
1c50 : a9 1e __ LDA #$1e
1c52 : 85 23 __ STA SP + 0 
1c54 : a9 bf __ LDA #$bf
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
1c84 : 9d 20 bf STA $bf20,x ; (main@stack + 0)
1c87 : ca __ __ DEX
1c88 : 10 f8 __ BPL $1c82 ; (main.s1000 + 2)
1c8a : 38 __ __ SEC
1c8b : a5 23 __ LDA SP + 0 
1c8d : e9 0a __ SBC #$0a
1c8f : 85 23 __ STA SP + 0 
1c91 : b0 02 __ BCS $1c95 ; (main.s0 + 0)
1c93 : c6 24 __ DEC SP + 1 
.s0:
1c95 : 20 38 20 JSR $2038 ; (cia_init.s0 + 0)
1c98 : a9 7f __ LDA #$7f
1c9a : 85 0d __ STA P0 
1c9c : a9 00 __ LDA #$00
1c9e : 85 10 __ STA P3 
1ca0 : 85 0e __ STA P1 
1ca2 : a9 20 __ LDA #$20
1ca4 : 85 11 __ STA P4 
1ca6 : a9 a8 __ LDA #$a8
1ca8 : 85 0f __ STA P2 
1caa : 20 69 20 JSR $2069 ; (vdcwin_winstorage_init.s0 + 0)
1cad : a9 00 __ LDA #$00
1caf : 8d f7 bf STA $bff7 ; (sstack + 7)
1cb2 : a9 01 __ LDA #$01
1cb4 : 8d f8 bf STA $bff8 ; (sstack + 8)
1cb7 : 20 8e 20 JSR $208e ; (vdc_init.s1000 + 0)
1cba : a9 00 __ LDA #$00
1cbc : 8d f1 bf STA $bff1 ; (sstack + 1)
1cbf : 8d f2 bf STA $bff2 ; (sstack + 2)
1cc2 : a9 3b __ LDA #$3b
1cc4 : 8d f3 bf STA $bff3 ; (sstack + 3)
1cc7 : a9 2f __ LDA #$2f
1cc9 : 8d f4 bf STA $bff4 ; (sstack + 4)
1ccc : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
1ccf : a9 88 __ LDA #$88
1cd1 : a0 02 __ LDY #$02
1cd3 : 91 23 __ STA (SP + 0),y 
1cd5 : a9 60 __ LDA #$60
1cd7 : c8 __ __ INY
1cd8 : 91 23 __ STA (SP + 0),y 
1cda : a9 96 __ LDA #$96
1cdc : c8 __ __ INY
1cdd : 91 23 __ STA (SP + 0),y 
1cdf : a9 2f __ LDA #$2f
1ce1 : c8 __ __ INY
1ce2 : 91 23 __ STA (SP + 0),y 
1ce4 : ad 5f 60 LDA $605f ; (vdc_state + 0)
1ce7 : c8 __ __ INY
1ce8 : 91 23 __ STA (SP + 0),y 
1cea : a9 00 __ LDA #$00
1cec : c8 __ __ INY
1ced : 91 23 __ STA (SP + 0),y 
1cef : ad 60 60 LDA $6060 ; (vdc_state + 1)
1cf2 : d0 07 __ BNE $1cfb ; (main.s51 + 0)
.s52:
1cf4 : a9 2f __ LDA #$2f
1cf6 : a2 ce __ LDX #$ce
1cf8 : 4c ff 1c JMP $1cff ; (main.s53 + 0)
.s51:
1cfb : a9 2f __ LDA #$2f
1cfd : a2 cb __ LDX #$cb
.s53:
1cff : 85 55 __ STA T1 + 1 
1d01 : 8a __ __ TXA
1d02 : a0 08 __ LDY #$08
1d04 : 91 23 __ STA (SP + 0),y 
1d06 : a5 55 __ LDA T1 + 1 
1d08 : c8 __ __ INY
1d09 : 91 23 __ STA (SP + 0),y 
1d0b : 20 56 2f JSR $2f56 ; (sprintf.s0 + 0)
1d0e : a9 00 __ LDA #$00
1d10 : 8d f1 bf STA $bff1 ; (sstack + 1)
1d13 : a9 02 __ LDA #$02
1d15 : 8d f2 bf STA $bff2 ; (sstack + 2)
1d18 : a9 88 __ LDA #$88
1d1a : 8d f3 bf STA $bff3 ; (sstack + 3)
1d1d : a9 60 __ LDA #$60
1d1f : 8d f4 bf STA $bff4 ; (sstack + 4)
1d22 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
1d25 : a9 00 __ LDA #$00
1d27 : 8d f1 bf STA $bff1 ; (sstack + 1)
1d2a : a9 04 __ LDA #$04
1d2c : 8d f2 bf STA $bff2 ; (sstack + 2)
1d2f : a9 d2 __ LDA #$d2
1d31 : 8d f3 bf STA $bff3 ; (sstack + 3)
1d34 : a9 2f __ LDA #$2f
1d36 : 8d f4 bf STA $bff4 ; (sstack + 4)
1d39 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
1d3c : a9 00 __ LDA #$00
1d3e : 8d f1 bf STA $bff1 ; (sstack + 1)
1d41 : a9 05 __ LDA #$05
1d43 : 8d f2 bf STA $bff2 ; (sstack + 2)
1d46 : a9 00 __ LDA #$00
1d48 : 8d f3 bf STA $bff3 ; (sstack + 3)
1d4b : a9 30 __ LDA #$30
1d4d : 8d f4 bf STA $bff4 ; (sstack + 4)
1d50 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
1d53 : a9 01 __ LDA #$01
1d55 : 85 57 __ STA T4 + 0 
1d57 : 85 10 __ STA P3 
1d59 : ad fe 5b LDA $5bfe ; (bootdevice + 0)
1d5c : 85 56 __ STA T2 + 0 
1d5e : 85 0f __ STA P2 
1d60 : a9 00 __ LDA #$00
1d62 : 85 11 __ STA P4 
1d64 : a9 40 __ LDA #$40
1d66 : 85 12 __ STA P5 
1d68 : a9 e2 __ LDA #$e2
1d6a : 85 13 __ STA P6 
1d6c : a9 2f __ LDA #$2f
1d6e : 85 14 __ STA P7 
1d70 : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
1d73 : a5 1b __ LDA ACCU + 0 
1d75 : d0 0e __ BNE $1d85 ; (main.s4 + 0)
.s2:
1d77 : 20 1f 30 JSR $301f ; (menu_fileerrormessage.s1000 + 0)
1d7a : a9 01 __ LDA #$01
1d7c : 85 0d __ STA P0 
1d7e : a9 00 __ LDA #$00
1d80 : 85 0e __ STA P1 
1d82 : 20 ee 2b JSR $2bee ; (exit.s0 + 0)
.s4:
1d85 : a9 00 __ LDA #$00
1d87 : 8d f1 bf STA $bff1 ; (sstack + 1)
1d8a : a9 06 __ LDA #$06
1d8c : 8d f2 bf STA $bff2 ; (sstack + 2)
1d8f : a9 d4 __ LDA #$d4
1d91 : 8d f3 bf STA $bff3 ; (sstack + 3)
1d94 : a9 36 __ LDA #$36
1d96 : 8d f4 bf STA $bff4 ; (sstack + 4)
1d99 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
1d9c : a5 56 __ LDA T2 + 0 
1d9e : 85 0f __ STA P2 
1da0 : a9 01 __ LDA #$01
1da2 : 85 10 __ STA P3 
1da4 : a9 00 __ LDA #$00
1da6 : 85 11 __ STA P4 
1da8 : a9 20 __ LDA #$20
1daa : 85 12 __ STA P5 
1dac : a9 f6 __ LDA #$f6
1dae : 85 13 __ STA P6 
1db0 : a9 2f __ LDA #$2f
1db2 : 85 14 __ STA P7 
1db4 : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
1db7 : a5 1b __ LDA ACCU + 0 
1db9 : d0 0e __ BNE $1dc9 ; (main.l73 + 0)
.s5:
1dbb : 20 1f 30 JSR $301f ; (menu_fileerrormessage.s1000 + 0)
1dbe : a9 01 __ LDA #$01
1dc0 : 85 0d __ STA P0 
1dc2 : a9 00 __ LDA #$00
1dc4 : 85 0e __ STA P1 
1dc6 : 20 ee 2b JSR $2bee ; (exit.s0 + 0)
.l73:
1dc9 : 20 3d 14 JSR $143d ; (sid_startmusic.s0 + 0)
.l8:
1dcc : a9 cf __ LDA #$cf
1dce : 8d f6 bf STA $bff6 ; (sstack + 6)
1dd1 : a9 37 __ LDA #$37
1dd3 : 8d f7 bf STA $bff7 ; (sstack + 7)
1dd6 : 20 00 37 JSR $3700 ; (menu_placetop.s0 + 0)
1dd9 : a9 7f __ LDA #$7f
1ddb : 85 17 __ STA P10 
1ddd : a9 a0 __ LDA #$a0
1ddf : 8d f2 bf STA $bff2 ; (sstack + 2)
1de2 : a9 00 __ LDA #$00
1de4 : 8d f0 bf STA $bff0 ; (sstack + 0)
1de7 : 8d f3 bf STA $bff3 ; (sstack + 3)
1dea : 8d f5 bf STA $bff5 ; (sstack + 5)
1ded : 8d f7 bf STA $bff7 ; (sstack + 7)
1df0 : 8d f9 bf STA $bff9 ; (sstack + 9)
1df3 : a9 4b __ LDA #$4b
1df5 : 8d f4 bf STA $bff4 ; (sstack + 4)
1df8 : a9 30 __ LDA #$30
1dfa : 8d f6 bf STA $bff6 ; (sstack + 6)
1dfd : a9 0c __ LDA #$0c
1dff : 8d f8 bf STA $bff8 ; (sstack + 8)
1e02 : a9 10 __ LDA #$10
1e04 : 8d fa bf STA $bffa ; (sstack + 10)
1e07 : a9 28 __ LDA #$28
1e09 : 85 15 __ STA P8 
1e0b : a9 bf __ LDA #$bf
1e0d : 85 16 __ STA P9 
1e0f : a9 40 __ LDA #$40
1e11 : 8d f1 bf STA $bff1 ; (sstack + 1)
1e14 : ad 65 60 LDA $6065 ; (vdc_state + 6)
1e17 : 4a __ __ LSR
1e18 : ad 64 60 LDA $6064 ; (vdc_state + 5)
1e1b : 85 54 __ STA T1 + 0 
1e1d : 6a __ __ ROR
1e1e : 38 __ __ SEC
1e1f : e9 06 __ SBC #$06
1e21 : 8d fb bf STA $bffb ; (sstack + 11)
1e24 : 20 e1 37 JSR $37e1 ; (vdcwin_viewport_init.s0 + 0)
1e27 : a9 10 __ LDA #$10
1e29 : 8d 2f bf STA $bf2f ; (vp_logo + 7)
1e2c : a9 00 __ LDA #$00
1e2e : 8d 30 bf STA $bf30 ; (vp_logo + 8)
1e31 : 8d 32 bf STA $bf32 ; (vp_logo + 10)
1e34 : a9 88 __ LDA #$88
1e36 : a0 02 __ LDY #$02
1e38 : 91 23 __ STA (SP + 0),y 
1e3a : a9 60 __ LDA #$60
1e3c : c8 __ __ INY
1e3d : 91 23 __ STA (SP + 0),y 
1e3f : a9 96 __ LDA #$96
1e41 : c8 __ __ INY
1e42 : 91 23 __ STA (SP + 0),y 
1e44 : a9 2f __ LDA #$2f
1e46 : c8 __ __ INY
1e47 : 91 23 __ STA (SP + 0),y 
1e49 : ad 5f 60 LDA $605f ; (vdc_state + 0)
1e4c : c8 __ __ INY
1e4d : 8c 31 bf STY $bf31 ; (vp_logo + 9)
1e50 : 91 23 __ STA (SP + 0),y 
1e52 : a9 00 __ LDA #$00
1e54 : c8 __ __ INY
1e55 : 91 23 __ STA (SP + 0),y 
1e57 : ad 60 60 LDA $6060 ; (vdc_state + 1)
1e5a : d0 07 __ BNE $1e63 ; (main.s54 + 0)
.s55:
1e5c : a9 2f __ LDA #$2f
1e5e : a2 ce __ LDX #$ce
1e60 : 4c 67 1e JMP $1e67 ; (main.s56 + 0)
.s54:
1e63 : a9 2f __ LDA #$2f
1e65 : a2 cb __ LDX #$cb
.s56:
1e67 : 85 45 __ STA T6 + 1 
1e69 : 8a __ __ TXA
1e6a : a0 08 __ LDY #$08
1e6c : 91 23 __ STA (SP + 0),y 
1e6e : a5 45 __ LDA T6 + 1 
1e70 : c8 __ __ INY
1e71 : 91 23 __ STA (SP + 0),y 
1e73 : 20 56 2f JSR $2f56 ; (sprintf.s0 + 0)
1e76 : a9 00 __ LDA #$00
1e78 : 8d f1 bf STA $bff1 ; (sstack + 1)
1e7b : a9 03 __ LDA #$03
1e7d : 8d f2 bf STA $bff2 ; (sstack + 2)
1e80 : a9 88 __ LDA #$88
1e82 : 8d f3 bf STA $bff3 ; (sstack + 3)
1e85 : a9 60 __ LDA #$60
1e87 : 8d f4 bf STA $bff4 ; (sstack + 4)
1e8a : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
1e8d : a9 88 __ LDA #$88
1e8f : a0 02 __ LDY #$02
1e91 : 91 23 __ STA (SP + 0),y 
1e93 : a9 60 __ LDA #$60
1e95 : c8 __ __ INY
1e96 : 91 23 __ STA (SP + 0),y 
1e98 : a9 3e __ LDA #$3e
1e9a : c8 __ __ INY
1e9b : 91 23 __ STA (SP + 0),y 
1e9d : a9 38 __ LDA #$38
1e9f : c8 __ __ INY
1ea0 : 91 23 __ STA (SP + 0),y 
1ea2 : ad 61 60 LDA $6061 ; (vdc_state + 2)
1ea5 : 85 1b __ STA ACCU + 0 
1ea7 : a9 00 __ LDA #$00
1ea9 : 85 1c __ STA ACCU + 1 
1eab : a9 11 __ LDA #$11
1ead : 20 b3 59 JSR $59b3 ; (mul16by8 + 0)
1eb0 : 18 __ __ CLC
1eb1 : a9 3c __ LDA #$3c
1eb3 : 65 05 __ ADC WORK + 2 
1eb5 : a0 06 __ LDY #$06
1eb7 : 91 23 __ STA (SP + 0),y 
1eb9 : a9 5f __ LDA #$5f
1ebb : 65 06 __ ADC WORK + 3 
1ebd : c8 __ __ INY
1ebe : 91 23 __ STA (SP + 0),y 
1ec0 : 20 56 2f JSR $2f56 ; (sprintf.s0 + 0)
1ec3 : a9 00 __ LDA #$00
1ec5 : 8d f1 bf STA $bff1 ; (sstack + 1)
1ec8 : a9 04 __ LDA #$04
1eca : 8d f2 bf STA $bff2 ; (sstack + 2)
1ecd : a9 88 __ LDA #$88
1ecf : 8d f3 bf STA $bff3 ; (sstack + 3)
1ed2 : a9 60 __ LDA #$60
1ed4 : 8d f4 bf STA $bff4 ; (sstack + 4)
1ed7 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
1eda : a9 00 __ LDA #$00
1edc : 8d f1 bf STA $bff1 ; (sstack + 1)
1edf : 38 __ __ SEC
1ee0 : a5 54 __ LDA T1 + 0 
1ee2 : e9 04 __ SBC #$04
1ee4 : 8d f2 bf STA $bff2 ; (sstack + 2)
1ee7 : a9 4d __ LDA #$4d
1ee9 : 8d f3 bf STA $bff3 ; (sstack + 3)
1eec : a9 38 __ LDA #$38
1eee : 8d f4 bf STA $bff4 ; (sstack + 4)
1ef1 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
1ef4 : a9 00 __ LDA #$00
1ef6 : 8d f1 bf STA $bff1 ; (sstack + 1)
1ef9 : 38 __ __ SEC
1efa : a5 54 __ LDA T1 + 0 
1efc : e9 03 __ SBC #$03
1efe : 8d f2 bf STA $bff2 ; (sstack + 2)
1f01 : a9 87 __ LDA #$87
1f03 : 8d f3 bf STA $bff3 ; (sstack + 3)
1f06 : a9 38 __ LDA #$38
1f08 : 8d f4 bf STA $bff4 ; (sstack + 4)
1f0b : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
1f0e : a9 00 __ LDA #$00
1f10 : 8d f1 bf STA $bff1 ; (sstack + 1)
1f13 : 38 __ __ SEC
1f14 : a5 54 __ LDA T1 + 0 
1f16 : e9 02 __ SBC #$02
1f18 : 8d f2 bf STA $bff2 ; (sstack + 2)
1f1b : a9 00 __ LDA #$00
1f1d : 8d f3 bf STA $bff3 ; (sstack + 3)
1f20 : a9 39 __ LDA #$39
1f22 : 8d f4 bf STA $bff4 ; (sstack + 4)
1f25 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
1f28 : a9 28 __ LDA #$28
1f2a : 8d f0 bf STA $bff0 ; (sstack + 0)
1f2d : a9 bf __ LDA #$bf
1f2f : 8d f1 bf STA $bff1 ; (sstack + 1)
1f32 : 20 37 39 JSR $3937 ; (vdcwin_cpy_viewport.s0 + 0)
1f35 : 20 94 3a JSR $3a94 ; (menu_main.s1000 + 0)
1f38 : a5 1b __ LDA ACCU + 0 
1f3a : 85 56 __ STA T2 + 0 
1f3c : c9 29 __ CMP #$29
1f3e : b0 03 __ BCS $1f43 ; (main.s29 + 0)
1f40 : 4c fb 1f JMP $1ffb ; (main.s31 + 0)
.s29:
1f43 : c9 2b __ CMP #$2b
1f45 : b0 0c __ BCS $1f53 ; (main.s30 + 0)
.s15:
1f47 : 38 __ __ SEC
1f48 : e9 29 __ SBC #$29
1f4a : 8d fc bf STA $bffc ; (sstack + 12)
1f4d : 20 71 53 JSR $5371 ; (scroll_fullscreen_smooth.s1000 + 0)
1f50 : 4c 66 1f JMP $1f66 ; (main.s10 + 0)
.s30:
1f53 : c9 3f __ CMP #$3f
1f55 : d0 06 __ BNE $1f5d ; (main.s39 + 0)
.s24:
1f57 : 20 cf 14 JSR $14cf ; (sid_stopmusic.s0 + 0)
1f5a : 4c cc 1d JMP $1dcc ; (main.l8 + 0)
.s39:
1f5d : 90 32 __ BCC $1f91 ; (main.s41 + 0)
.s40:
1f5f : c9 40 __ CMP #$40
1f61 : d0 03 __ BNE $1f66 ; (main.s10 + 0)
1f63 : 4c c9 1d JMP $1dc9 ; (main.l73 + 0)
.s10:
1f66 : a5 56 __ LDA T2 + 0 
1f68 : c9 0d __ CMP #$0d
1f6a : f0 03 __ BEQ $1f6f ; (main.s9 + 0)
1f6c : 4c cc 1d JMP $1dcc ; (main.l8 + 0)
.s9:
1f6f : 20 cf 14 JSR $14cf ; (sid_stopmusic.s0 + 0)
1f72 : 20 9d 59 JSR $599d ; (vdc_exit.s0 + 0)
1f75 : a9 00 __ LDA #$00
1f77 : 85 1b __ STA ACCU + 0 
1f79 : 85 1c __ STA ACCU + 1 
.s1001:
1f7b : 18 __ __ CLC
1f7c : a5 23 __ LDA SP + 0 
1f7e : 69 0a __ ADC #$0a
1f80 : 85 23 __ STA SP + 0 
1f82 : 90 02 __ BCC $1f86 ; (main.s1001 + 11)
1f84 : e6 24 __ INC SP + 1 
1f86 : a2 04 __ LDX #$04
1f88 : bd 20 bf LDA $bf20,x ; (main@stack + 0)
1f8b : 95 53 __ STA T0 + 0,x 
1f8d : ca __ __ DEX
1f8e : 10 f8 __ BPL $1f88 ; (main.s1001 + 13)
1f90 : 60 __ __ RTS
.s41:
1f91 : c9 33 __ CMP #$33
1f93 : d0 06 __ BNE $1f9b ; (main.s42 + 0)
.s16:
1f95 : 20 f3 58 JSR $58f3 ; (charset_demo.s0 + 0)
1f98 : 4c cc 1d JMP $1dcc ; (main.l8 + 0)
.s42:
1f9b : c9 3d __ CMP #$3d
1f9d : 90 c7 __ BCC $1f66 ; (main.s10 + 0)
.s44:
1f9f : e9 3c __ SBC #$3c
1fa1 : 85 53 __ STA T0 + 0 
1fa3 : 90 06 __ BCC $1fab ; (main.s18 + 0)
.s1006:
1fa5 : a5 57 __ LDA T4 + 0 
1fa7 : c5 53 __ CMP T0 + 0 
1fa9 : f0 bb __ BEQ $1f66 ; (main.s10 + 0)
.s18:
1fab : 20 cf 14 JSR $14cf ; (sid_stopmusic.s0 + 0)
1fae : a9 88 __ LDA #$88
1fb0 : a0 02 __ LDY #$02
1fb2 : 91 23 __ STA (SP + 0),y 
1fb4 : a9 60 __ LDA #$60
1fb6 : c8 __ __ INY
1fb7 : 91 23 __ STA (SP + 0),y 
1fb9 : a9 95 __ LDA #$95
1fbb : c8 __ __ INY
1fbc : 91 23 __ STA (SP + 0),y 
1fbe : a9 59 __ LDA #$59
1fc0 : c8 __ __ INY
1fc1 : 91 23 __ STA (SP + 0),y 
1fc3 : a5 53 __ LDA T0 + 0 
1fc5 : 85 57 __ STA T4 + 0 
1fc7 : c8 __ __ INY
1fc8 : 91 23 __ STA (SP + 0),y 
1fca : a9 00 __ LDA #$00
1fcc : c8 __ __ INY
1fcd : 91 23 __ STA (SP + 0),y 
1fcf : 20 56 2f JSR $2f56 ; (sprintf.s0 + 0)
1fd2 : a9 01 __ LDA #$01
1fd4 : 85 10 __ STA P3 
1fd6 : a9 88 __ LDA #$88
1fd8 : 85 13 __ STA P6 
1fda : a9 60 __ LDA #$60
1fdc : 85 14 __ STA P7 
1fde : ad fe 5b LDA $5bfe ; (bootdevice + 0)
1fe1 : 85 0f __ STA P2 
1fe3 : a9 00 __ LDA #$00
1fe5 : 85 11 __ STA P4 
1fe7 : a9 20 __ LDA #$20
1fe9 : 85 12 __ STA P5 
1feb : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
1fee : a5 1b __ LDA ACCU + 0 
1ff0 : f0 03 __ BEQ $1ff5 ; (main.s21 + 0)
1ff2 : 4c c9 1d JMP $1dc9 ; (main.l73 + 0)
.s21:
1ff5 : 20 1f 30 JSR $301f ; (menu_fileerrormessage.s1000 + 0)
1ff8 : 4c c9 1d JMP $1dc9 ; (main.l73 + 0)
.s31:
1ffb : c9 15 __ CMP #$15
1ffd : d0 06 __ BNE $2005 ; (main.s32 + 0)
.s13:
1fff : 20 00 41 JSR $4100 ; (windows_windowstacking.s1000 + 0)
2002 : 4c cc 1d JMP $1dcc ; (main.l8 + 0)
.s32:
2005 : 90 1a __ BCC $2021 ; (main.s34 + 0)
.s33:
2007 : c9 1f __ CMP #$1f
2009 : b0 03 __ BCS $200e ; (main.s38 + 0)
200b : 4c 66 1f JMP $1f66 ; (main.s10 + 0)
.s38:
200e : c9 21 __ CMP #$21
2010 : 90 03 __ BCC $2015 ; (main.s14 + 0)
2012 : 4c 66 1f JMP $1f66 ; (main.s10 + 0)
.s14:
2015 : 38 __ __ SEC
2016 : e9 1f __ SBC #$1f
2018 : 8d fc bf STA $bffc ; (sstack + 12)
201b : 20 1f 4a JSR $4a1f ; (viewport_demo.s1000 + 0)
201e : 4c cc 1d JMP $1dcc ; (main.l8 + 0)
.s34:
2021 : c9 0b __ CMP #$0b
2023 : d0 06 __ BNE $202b ; (main.s35 + 0)
.s11:
2025 : 20 21 3e JSR $3e21 ; (settings_screenmode.s1000 + 0)
2028 : 4c cc 1d JMP $1dcc ; (main.l8 + 0)
.s35:
202b : c9 0c __ CMP #$0c
202d : f0 03 __ BEQ $2032 ; (main.s12 + 0)
202f : 4c 66 1f JMP $1f66 ; (main.s10 + 0)
.s12:
2032 : 20 9f 3e JSR $3e9f ; (settings_versioninfo.s1000 + 0)
2035 : 4c cc 1d JMP $1dcc ; (main.l8 + 0)
--------------------------------------------------------------------
cia_init: ; cia_init()->void
.s0:
2038 : a9 7f __ LDA #$7f
203a : 8d 0d dc STA $dc0d 
203d : 8d 0d dd STA $dd0d 
2040 : 8d 00 dc STA $dc00 
2043 : a9 08 __ LDA #$08
2045 : 8d 0e dc STA $dc0e 
2048 : 8d 0f dc STA $dc0f 
204b : 8d 0e dd STA $dd0e 
204e : 8d 0f dd STA $dd0f 
2051 : a9 00 __ LDA #$00
2053 : 8d 03 dc STA $dc03 
2056 : 8d 03 dd STA $dd03 
2059 : a9 ff __ LDA #$ff
205b : 8d 02 dc STA $dc02 
205e : a9 07 __ LDA #$07
2060 : 8d 01 dd STA $dd01 
2063 : a9 3f __ LDA #$3f
2065 : 8d 02 dd STA $dd02 
.s1001:
2068 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_winstorage_init: ; vdcwin_winstorage_init(u8,u8*,u16)->void
.s0:
2069 : a9 00 __ LDA #$00
206b : 8d 5c 60 STA $605c ; (winCfg + 5)
206e : a5 0d __ LDA P0 ; (memcr + 0)
2070 : 8d 57 60 STA $6057 ; (winCfg + 0)
2073 : a5 0e __ LDA P1 ; (membase + 0)
2075 : 8d 58 60 STA $6058 ; (winCfg + 1)
2078 : 8d 5d 60 STA $605d ; (winCfg + 6)
207b : a5 0f __ LDA P2 ; (membase + 1)
207d : 8d 59 60 STA $6059 ; (winCfg + 2)
2080 : 8d 5e 60 STA $605e ; (winCfg + 7)
2083 : a5 10 __ LDA P3 ; (memsize + 0)
2085 : 8d 5a 60 STA $605a ; (winCfg + 3)
2088 : a5 11 __ LDA P4 ; (memsize + 1)
208a : 8d 5b 60 STA $605b ; (winCfg + 4)
.s1001:
208d : 60 __ __ RTS
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
208e : 38 __ __ SEC
208f : a5 23 __ LDA SP + 0 
2091 : e9 04 __ SBC #$04
2093 : 85 23 __ STA SP + 0 
2095 : b0 02 __ BCS $2099 ; (vdc_init.s0 + 0)
2097 : c6 24 __ DEC SP + 1 
.s0:
2099 : a9 00 __ LDA #$00
209b : 85 0f __ STA P2 
209d : 20 fd 20 JSR $20fd ; (vdc_bgcolor.s0 + 0)
20a0 : a9 0d __ LDA #$0d
20a2 : 85 0f __ STA P2 
20a4 : 20 2a 21 JSR $212a ; (vdc_fgcolor.s0 + 0)
20a7 : a9 8d __ LDA #$8d
20a9 : 8d 66 60 STA $6066 ; (vdc_state + 7)
20ac : 20 42 21 JSR $2142 ; (vdc_detect_mem_size.s0 + 0)
20af : 20 b4 22 JSR $22b4 ; (screen_width.s0 + 0)
20b2 : c9 28 __ CMP #$28
20b4 : d0 1b __ BNE $20d1 ; (vdc_init.s3 + 0)
.s1:
20b6 : a9 00 __ LDA #$00
20b8 : a0 02 __ LDY #$02
20ba : 91 23 __ STA (SP + 0),y 
20bc : a9 2a __ LDA #$2a
20be : c8 __ __ INY
20bf : 91 23 __ STA (SP + 0),y 
20c1 : 20 be 22 JSR $22be ; (printf.s0 + 0)
20c4 : 20 f0 29 JSR $29f0 ; (getch.s0 + 0)
20c7 : 20 fc 29 JSR $29fc ; (clrscr.s0 + 0)
20ca : a9 50 __ LDA #$50
20cc : 85 0d __ STA P0 
20ce : 20 5c 2a JSR $2a5c ; (screen_setmode.s0 + 0)
.s3:
20d1 : 20 67 2a JSR $2a67 ; (bnk_init.s1000 + 0)
20d4 : a9 01 __ LDA #$01
20d6 : 20 0e 2c JSR $2c0e ; (fastmode.s0 + 0)
20d9 : ad f7 bf LDA $bff7 ; (sstack + 7)
20dc : 8d f6 bf STA $bff6 ; (sstack + 6)
20df : 20 2d 2c JSR $2c2d ; (vdc_set_mode.s0 + 0)
20e2 : ad 5f 60 LDA $605f ; (vdc_state + 0)
20e5 : c9 40 __ CMP #$40
20e7 : d0 08 __ BNE $20f1 ; (vdc_init.s1001 + 0)
.s7:
20e9 : ad f8 bf LDA $bff8 ; (sstack + 8)
20ec : f0 03 __ BEQ $20f1 ; (vdc_init.s1001 + 0)
.s4:
20ee : 20 01 2e JSR $2e01 ; (vdc_set_extended_memsize.s0 + 0)
.s1001:
20f1 : 18 __ __ CLC
20f2 : a5 23 __ LDA SP + 0 
20f4 : 69 04 __ ADC #$04
20f6 : 85 23 __ STA SP + 0 
20f8 : 90 02 __ BCC $20fc ; (vdc_init.s1001 + 11)
20fa : e6 24 __ INC SP + 1 
20fc : 60 __ __ RTS
--------------------------------------------------------------------
vdc_bgcolor: ; vdc_bgcolor(u8)->void
.s0:
20fd : a9 1a __ LDA #$1a
20ff : 85 0d __ STA P0 
2101 : 20 1e 21 JSR $211e ; (vdc_reg_read.s0 + 0)
2104 : 29 f0 __ AND #$f0
2106 : 18 __ __ CLC
2107 : 65 0f __ ADC P2 ; (color + 0)
2109 : 85 0e __ STA P1 
210b : 4c 0e 21 JMP $210e ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_reg_write: ; vdc_reg_write(enum VDCRegister,u8)->void
.s0:
210e : a5 0d __ LDA P0 ; (reg + 0)
2110 : 8d 00 d6 STA $d600 
.l27:
2113 : 2c 00 d6 BIT $d600 
2116 : 10 fb __ BPL $2113 ; (vdc_reg_write.l27 + 0)
.s4:
2118 : a5 0e __ LDA P1 ; (data + 0)
211a : 8d 01 d6 STA $d601 
.s1001:
211d : 60 __ __ RTS
--------------------------------------------------------------------
vdc_reg_read: ; vdc_reg_read(enum VDCRegister)->u8
.s0:
211e : 8d 00 d6 STA $d600 
.l29:
2121 : 2c 00 d6 BIT $d600 
2124 : 10 fb __ BPL $2121 ; (vdc_reg_read.l29 + 0)
.s1001:
2126 : ad 01 d6 LDA $d601 
2129 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_fgcolor: ; vdc_fgcolor(u8)->void
.s0:
212a : a9 1a __ LDA #$1a
212c : 85 0d __ STA P0 
212e : 20 1e 21 JSR $211e ; (vdc_reg_read.s0 + 0)
2131 : 29 0f __ AND #$0f
2133 : 85 43 __ STA T1 + 0 
2135 : a5 0f __ LDA P2 ; (color + 0)
2137 : 0a __ __ ASL
2138 : 0a __ __ ASL
2139 : 0a __ __ ASL
213a : 0a __ __ ASL
213b : 05 43 __ ORA T1 + 0 
213d : 85 0e __ STA P1 
213f : 4c 0e 21 JMP $210e ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_detect_mem_size: ; vdc_detect_mem_size()->void
.s0:
2142 : a9 1c __ LDA #$1c
2144 : 85 0d __ STA P0 
2146 : 20 1e 21 JSR $211e ; (vdc_reg_read.s0 + 0)
2149 : 85 48 __ STA T0 + 0 
214b : 09 10 __ ORA #$10
214d : 85 0e __ STA P1 
214f : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
2152 : a9 ff __ LDA #$ff
2154 : 85 11 __ STA P4 
2156 : a9 1f __ LDA #$1f
2158 : 85 12 __ STA P5 
215a : a9 00 __ LDA #$00
215c : 85 13 __ STA P6 
215e : 20 8c 21 JSR $218c ; (vdc_mem_write_at.s0 + 0)
2161 : a9 9f __ LDA #$9f
2163 : 85 12 __ STA P5 
2165 : c6 13 __ DEC P6 
2167 : 20 8c 21 JSR $218c ; (vdc_mem_write_at.s0 + 0)
216a : a9 1f __ LDA #$1f
216c : 85 12 __ STA P5 
216e : 20 bc 21 JSR $21bc ; (vdc_mem_read_at.s0 + 0)
2171 : a9 1c __ LDA #$1c
2173 : 85 0d __ STA P0 
2175 : a5 48 __ LDA T0 + 0 
2177 : 85 0e __ STA P1 
2179 : a5 1b __ LDA ACCU + 0 
217b : f0 04 __ BEQ $2181 ; (vdc_detect_mem_size.s1002 + 0)
.s1003:
217d : a9 10 __ LDA #$10
217f : d0 02 __ BNE $2183 ; (vdc_detect_mem_size.s1004 + 0)
.s1002:
2181 : a9 40 __ LDA #$40
.s1004:
2183 : 8d 5f 60 STA $605f ; (vdc_state + 0)
2186 : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
2189 : 4c d2 21 JMP $21d2 ; (vdc_cls.s0 + 0)
--------------------------------------------------------------------
vdc_mem_write_at: ; vdc_mem_write_at(u16,u8)->void
.s0:
218c : a5 11 __ LDA P4 ; (addr + 0)
218e : 85 0f __ STA P2 
2190 : a5 12 __ LDA P5 ; (addr + 1)
2192 : 85 10 __ STA P3 
2194 : 20 a2 21 JSR $21a2 ; (vdc_mem_addr.s0 + 0)
.l26:
2197 : 2c 00 d6 BIT $d600 
219a : 10 fb __ BPL $2197 ; (vdc_mem_write_at.l26 + 0)
.s3:
219c : a5 13 __ LDA P6 ; (data + 0)
219e : 8d 01 d6 STA $d601 
.s1001:
21a1 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
21a2 : a9 12 __ LDA #$12
21a4 : 85 0d __ STA P0 
21a6 : a5 10 __ LDA P3 ; (addr + 1)
21a8 : 85 0e __ STA P1 
21aa : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
21ad : e6 0d __ INC P0 
21af : a5 0f __ LDA P2 ; (addr + 0)
21b1 : 85 0e __ STA P1 
21b3 : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
21b6 : a9 1f __ LDA #$1f
21b8 : 8d 00 d6 STA $d600 
.s1001:
21bb : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_read_at: ; vdc_mem_read_at(u16)->u8
.s0:
21bc : a5 11 __ LDA P4 ; (addr + 0)
21be : 85 0f __ STA P2 
21c0 : a5 12 __ LDA P5 ; (addr + 1)
21c2 : 85 10 __ STA P3 
21c4 : 20 a2 21 JSR $21a2 ; (vdc_mem_addr.s0 + 0)
.l28:
21c7 : 2c 00 d6 BIT $d600 
21ca : 10 fb __ BPL $21c7 ; (vdc_mem_read_at.l28 + 0)
.s3:
21cc : ad 01 d6 LDA $d601 
21cf : 85 1b __ STA ACCU + 0 
.s1001:
21d1 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
21d2 : a9 00 __ LDA #$00
21d4 : 8d f1 bf STA $bff1 ; (sstack + 1)
21d7 : 8d f2 bf STA $bff2 ; (sstack + 2)
21da : a9 20 __ LDA #$20
21dc : 8d f3 bf STA $bff3 ; (sstack + 3)
21df : ad 62 60 LDA $6062 ; (vdc_state + 3)
21e2 : 8d f4 bf STA $bff4 ; (sstack + 4)
21e5 : ad 64 60 LDA $6064 ; (vdc_state + 5)
21e8 : 8d f5 bf STA $bff5 ; (sstack + 5)
21eb : 4c ee 21 JMP $21ee ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_clear: ; vdc_clear(u8,u8,u8,u8,u8)->void
.s0:
21ee : ad f2 bf LDA $bff2 ; (sstack + 2)
21f1 : 85 45 __ STA T0 + 0 
21f3 : 18 __ __ CLC
21f4 : 6d f5 bf ADC $bff5 ; (sstack + 5)
21f7 : 85 46 __ STA T1 + 0 
21f9 : a9 00 __ LDA #$00
21fb : 2a __ __ ROL
21fc : 85 47 __ STA T1 + 1 
.l1:
21fe : f0 05 __ BEQ $2205 ; (vdc_clear.s1002 + 0)
.s1004:
2200 : a5 45 __ LDA T0 + 0 
2202 : 4c 0b 22 JMP $220b ; (vdc_clear.s2 + 0)
.s1002:
2205 : a5 45 __ LDA T0 + 0 
2207 : c5 46 __ CMP T1 + 0 
2209 : b0 21 __ BCS $222c ; (vdc_clear.s1001 + 0)
.s2:
220b : 85 16 __ STA P9 
220d : ad f1 bf LDA $bff1 ; (sstack + 1)
2210 : 85 15 __ STA P8 
2212 : ad f3 bf LDA $bff3 ; (sstack + 3)
2215 : 85 17 __ STA P10 
2217 : ad 66 60 LDA $6066 ; (vdc_state + 7)
221a : 85 18 __ STA P11 
221c : ad f4 bf LDA $bff4 ; (sstack + 4)
221f : 8d f0 bf STA $bff0 ; (sstack + 0)
2222 : 20 2d 22 JSR $222d ; (vdc_hchar.s0 + 0)
2225 : e6 45 __ INC T0 + 0 
2227 : a5 47 __ LDA T1 + 1 
2229 : 4c fe 21 JMP $21fe ; (vdc_clear.l1 + 0)
.s1001:
222c : 60 __ __ RTS
--------------------------------------------------------------------
vdc_hchar: ; vdc_hchar(u8,u8,u8,u8,u8)->void
.s0:
222d : a5 15 __ LDA P8 ; (x + 0)
222f : 85 0d __ STA P0 
2231 : a5 16 __ LDA P9 ; (y + 0)
2233 : 85 0e __ STA P1 
2235 : 20 72 22 JSR $2272 ; (vdc_coords.s0 + 0)
2238 : a5 1b __ LDA ACCU + 0 
223a : 85 43 __ STA T1 + 0 
223c : a5 1c __ LDA ACCU + 1 
223e : 85 44 __ STA T1 + 1 
2240 : ad 67 60 LDA $6067 ; (vdc_state + 8)
2243 : 18 __ __ CLC
2244 : 65 1b __ ADC ACCU + 0 
2246 : 85 11 __ STA P4 
2248 : ad 68 60 LDA $6068 ; (vdc_state + 9)
224b : 65 1c __ ADC ACCU + 1 
224d : 85 12 __ STA P5 
224f : a5 17 __ LDA P10 ; (val + 0)
2251 : 85 13 __ STA P6 
2253 : ae f0 bf LDX $bff0 ; (sstack + 0)
2256 : ca __ __ DEX
2257 : 86 14 __ STX P7 
2259 : 20 86 22 JSR $2286 ; (vdc_block_fill.s0 + 0)
225c : ad 69 60 LDA $6069 ; (vdc_state + 10)
225f : 18 __ __ CLC
2260 : 65 43 __ ADC T1 + 0 
2262 : 85 11 __ STA P4 
2264 : ad 6a 60 LDA $606a ; (vdc_state + 11)
2267 : 65 44 __ ADC T1 + 1 
2269 : 85 12 __ STA P5 
226b : a5 18 __ LDA P11 ; (attr + 0)
226d : 85 13 __ STA P6 
226f : 4c 86 22 JMP $2286 ; (vdc_block_fill.s0 + 0)
--------------------------------------------------------------------
vdc_coords: ; vdc_coords(u8,u8)->u16
.s0:
2272 : a5 0e __ LDA P1 ; (y + 0)
2274 : 0a __ __ ASL
2275 : aa __ __ TAX
2276 : bd 00 61 LDA $6100,x ; (multab + 0)
2279 : 18 __ __ CLC
227a : 65 0d __ ADC P0 ; (x + 0)
227c : 85 1b __ STA ACCU + 0 
227e : bd 01 61 LDA $6101,x ; (multab + 1)
2281 : 69 00 __ ADC #$00
2283 : 85 1c __ STA ACCU + 1 
.s1001:
2285 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_block_fill: ; vdc_block_fill(u16,u8,u8)->void
.s0:
2286 : a5 11 __ LDA P4 ; (address + 0)
2288 : 85 0f __ STA P2 
228a : a5 12 __ LDA P5 ; (address + 1)
228c : 85 10 __ STA P3 
228e : 20 a2 21 JSR $21a2 ; (vdc_mem_addr.s0 + 0)
.l26:
2291 : 2c 00 d6 BIT $d600 
2294 : 10 fb __ BPL $2291 ; (vdc_block_fill.l26 + 0)
.s3:
2296 : a5 13 __ LDA P6 ; (value + 0)
2298 : 8d 01 d6 STA $d601 
229b : a9 18 __ LDA #$18
229d : 85 0d __ STA P0 
229f : 20 1e 21 JSR $211e ; (vdc_reg_read.s0 + 0)
22a2 : 29 7f __ AND #$7f
22a4 : 85 0e __ STA P1 
22a6 : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
22a9 : a9 1e __ LDA #$1e
22ab : 85 0d __ STA P0 
22ad : a5 14 __ LDA P7 ; (length + 0)
22af : 85 0e __ STA P1 
22b1 : 4c 0e 21 JMP $210e ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
screen_width: ; screen_width()->u8
.s0:
22b4 : 24 d7 __ BIT $d7 
22b6 : 30 03 __ BMI $22bb ; (screen_width.s1 + 0)
.s2:
22b8 : a9 28 __ LDA #$28
22ba : 60 __ __ RTS
.s1:
22bb : a9 50 __ LDA #$50
.s1001:
22bd : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
22be : a9 01 __ LDA #$01
22c0 : 8d f4 bf STA $bff4 ; (sstack + 4)
22c3 : a9 a2 __ LDA #$a2
22c5 : 85 16 __ STA P9 
22c7 : a9 bf __ LDA #$bf
22c9 : 85 17 __ STA P10 
22cb : a0 02 __ LDY #$02
22cd : b1 23 __ LDA (SP + 0),y 
22cf : 8d f0 bf STA $bff0 ; (sstack + 0)
22d2 : c8 __ __ INY
22d3 : b1 23 __ LDA (SP + 0),y 
22d5 : 8d f1 bf STA $bff1 ; (sstack + 1)
22d8 : 18 __ __ CLC
22d9 : a5 23 __ LDA SP + 0 
22db : 69 04 __ ADC #$04
22dd : 8d f2 bf STA $bff2 ; (sstack + 2)
22e0 : a5 24 __ LDA SP + 1 
22e2 : 69 00 __ ADC #$00
22e4 : 8d f3 bf STA $bff3 ; (sstack + 3)
22e7 : 4c ea 22 JMP $22ea ; (sformat.s1000 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s1000:
22ea : a5 53 __ LDA T7 + 0 
22ec : 8d d4 bf STA $bfd4 ; (wrapbuffer + 62)
22ef : a5 54 __ LDA T7 + 1 
22f1 : 8d d5 bf STA $bfd5 ; (wrapbuffer + 63)
22f4 : a5 55 __ LDA T7 + 2 
22f6 : 8d d6 bf STA $bfd6 ; (wrapbuffer + 64)
.s0:
22f9 : a9 00 __ LDA #$00
22fb : 85 47 __ STA T0 + 0 
22fd : ad f0 bf LDA $bff0 ; (sstack + 0)
2300 : 85 49 __ STA T1 + 0 
2302 : ad f1 bf LDA $bff1 ; (sstack + 1)
2305 : 85 4a __ STA T1 + 1 
.l1:
2307 : a0 00 __ LDY #$00
2309 : b1 49 __ LDA (T1 + 0),y 
230b : d0 3c __ BNE $2349 ; (sformat.s2 + 0)
.s3:
230d : a4 47 __ LDY T0 + 0 
230f : 91 16 __ STA (P9),y ; (buff + 0)
2311 : 98 __ __ TYA
2312 : f0 1d __ BEQ $2331 ; (sformat.s1070 + 0)
.s116:
2314 : ad f4 bf LDA $bff4 ; (sstack + 4)
2317 : d0 0d __ BNE $2326 ; (sformat.s119 + 0)
.s120:
2319 : 18 __ __ CLC
231a : a5 16 __ LDA P9 ; (buff + 0)
231c : 65 47 __ ADC T0 + 0 
231e : aa __ __ TAX
231f : a5 17 __ LDA P10 ; (buff + 1)
2321 : 69 00 __ ADC #$00
2323 : 4c 35 23 JMP $2335 ; (sformat.s1001 + 0)
.s119:
2326 : a5 16 __ LDA P9 ; (buff + 0)
2328 : 85 0d __ STA P0 
232a : a5 17 __ LDA P10 ; (buff + 1)
232c : 85 0e __ STA P1 
232e : 20 f3 26 JSR $26f3 ; (puts.s0 + 0)
.s1070:
2331 : a5 17 __ LDA P10 ; (buff + 1)
2333 : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
2335 : 86 1b __ STX ACCU + 0 ; (fps + 0)
2337 : 85 1c __ STA ACCU + 1 ; (fps + 1)
2339 : ad d4 bf LDA $bfd4 ; (wrapbuffer + 62)
233c : 85 53 __ STA T7 + 0 
233e : ad d5 bf LDA $bfd5 ; (wrapbuffer + 63)
2341 : 85 54 __ STA T7 + 1 
2343 : ad d6 bf LDA $bfd6 ; (wrapbuffer + 64)
2346 : 85 55 __ STA T7 + 2 
2348 : 60 __ __ RTS
.s2:
2349 : c9 25 __ CMP #$25
234b : f0 3f __ BEQ $238c ; (sformat.s4 + 0)
.s5:
234d : a4 47 __ LDY T0 + 0 
234f : 91 16 __ STA (P9),y ; (buff + 0)
2351 : e6 49 __ INC T1 + 0 
2353 : d0 02 __ BNE $2357 ; (sformat.s1098 + 0)
.s1097:
2355 : e6 4a __ INC T1 + 1 
.s1098:
2357 : c8 __ __ INY
2358 : 84 47 __ STY T0 + 0 
235a : 98 __ __ TYA
235b : c0 28 __ CPY #$28
235d : 90 a8 __ BCC $2307 ; (sformat.l1 + 0)
.s110:
235f : 85 4c __ STA T5 + 0 
2361 : a9 00 __ LDA #$00
2363 : 85 47 __ STA T0 + 0 
2365 : ad f4 bf LDA $bff4 ; (sstack + 4)
2368 : f0 14 __ BEQ $237e ; (sformat.s114 + 0)
.s113:
236a : a5 16 __ LDA P9 ; (buff + 0)
236c : 85 0d __ STA P0 
236e : a5 17 __ LDA P10 ; (buff + 1)
2370 : 85 0e __ STA P1 
2372 : a9 00 __ LDA #$00
2374 : a4 4c __ LDY T5 + 0 
2376 : 91 16 __ STA (P9),y ; (buff + 0)
2378 : 20 f3 26 JSR $26f3 ; (puts.s0 + 0)
237b : 4c 07 23 JMP $2307 ; (sformat.l1 + 0)
.s114:
237e : 18 __ __ CLC
237f : a5 16 __ LDA P9 ; (buff + 0)
2381 : 65 4c __ ADC T5 + 0 
2383 : 85 16 __ STA P9 ; (buff + 0)
2385 : 90 80 __ BCC $2307 ; (sformat.l1 + 0)
.s1099:
2387 : e6 17 __ INC P10 ; (buff + 1)
2389 : 4c 07 23 JMP $2307 ; (sformat.l1 + 0)
.s4:
238c : a5 47 __ LDA T0 + 0 
238e : f0 27 __ BEQ $23b7 ; (sformat.s9 + 0)
.s7:
2390 : 84 47 __ STY T0 + 0 
2392 : 85 4c __ STA T5 + 0 
2394 : ad f4 bf LDA $bff4 ; (sstack + 4)
2397 : f0 13 __ BEQ $23ac ; (sformat.s11 + 0)
.s10:
2399 : a5 16 __ LDA P9 ; (buff + 0)
239b : 85 0d __ STA P0 
239d : a5 17 __ LDA P10 ; (buff + 1)
239f : 85 0e __ STA P1 
23a1 : 98 __ __ TYA
23a2 : a4 4c __ LDY T5 + 0 
23a4 : 91 16 __ STA (P9),y ; (buff + 0)
23a6 : 20 f3 26 JSR $26f3 ; (puts.s0 + 0)
23a9 : 4c b7 23 JMP $23b7 ; (sformat.s9 + 0)
.s11:
23ac : 18 __ __ CLC
23ad : a5 16 __ LDA P9 ; (buff + 0)
23af : 65 4c __ ADC T5 + 0 
23b1 : 85 16 __ STA P9 ; (buff + 0)
23b3 : 90 02 __ BCC $23b7 ; (sformat.s9 + 0)
.s1095:
23b5 : e6 17 __ INC P10 ; (buff + 1)
.s9:
23b7 : a9 0a __ LDA #$0a
23b9 : 8d db bf STA $bfdb ; (wrapbuffer + 69)
23bc : a9 00 __ LDA #$00
23be : 8d dc bf STA $bfdc ; (wrapbuffer + 70)
23c1 : 8d dd bf STA $bfdd ; (wrapbuffer + 71)
23c4 : 8d de bf STA $bfde ; (wrapbuffer + 72)
23c7 : 8d df bf STA $bfdf ; (wrapbuffer + 73)
23ca : a0 01 __ LDY #$01
23cc : b1 49 __ LDA (T1 + 0),y 
23ce : a2 20 __ LDX #$20
23d0 : 8e d8 bf STX $bfd8 ; (wrapbuffer + 66)
23d3 : a2 00 __ LDX #$00
23d5 : 8e d9 bf STX $bfd9 ; (wrapbuffer + 67)
23d8 : ca __ __ DEX
23d9 : 8e da bf STX $bfda ; (wrapbuffer + 68)
23dc : aa __ __ TAX
23dd : 18 __ __ CLC
23de : a5 49 __ LDA T1 + 0 
23e0 : 69 02 __ ADC #$02
.l14:
23e2 : 85 49 __ STA T1 + 0 
23e4 : 90 02 __ BCC $23e8 ; (sformat.s1082 + 0)
.s1081:
23e6 : e6 4a __ INC T1 + 1 
.s1082:
23e8 : 8a __ __ TXA
23e9 : e0 2b __ CPX #$2b
23eb : d0 08 __ BNE $23f5 ; (sformat.s17 + 0)
.s16:
23ed : a9 01 __ LDA #$01
23ef : 8d dd bf STA $bfdd ; (wrapbuffer + 71)
23f2 : 4c e6 26 JMP $26e6 ; (sformat.s264 + 0)
.s17:
23f5 : c9 30 __ CMP #$30
23f7 : d0 06 __ BNE $23ff ; (sformat.s20 + 0)
.s19:
23f9 : 8d d8 bf STA $bfd8 ; (wrapbuffer + 66)
23fc : 4c e6 26 JMP $26e6 ; (sformat.s264 + 0)
.s20:
23ff : e0 23 __ CPX #$23
2401 : d0 08 __ BNE $240b ; (sformat.s23 + 0)
.s22:
2403 : a9 01 __ LDA #$01
2405 : 8d df bf STA $bfdf ; (wrapbuffer + 73)
2408 : 4c e6 26 JMP $26e6 ; (sformat.s264 + 0)
.s23:
240b : e0 2d __ CPX #$2d
240d : d0 08 __ BNE $2417 ; (sformat.s15 + 0)
.s25:
240f : a9 01 __ LDA #$01
2411 : 8d de bf STA $bfde ; (wrapbuffer + 72)
2414 : 4c e6 26 JMP $26e6 ; (sformat.s264 + 0)
.s15:
2417 : 85 4c __ STA T5 + 0 
2419 : e0 30 __ CPX #$30
241b : 90 53 __ BCC $2470 ; (sformat.s31 + 0)
.s32:
241d : e0 3a __ CPX #$3a
241f : b0 4f __ BCS $2470 ; (sformat.s31 + 0)
.s29:
2421 : a9 00 __ LDA #$00
2423 : 85 44 __ STA T6 + 0 
2425 : 85 45 __ STA T6 + 1 
2427 : e0 3a __ CPX #$3a
2429 : b0 40 __ BCS $246b ; (sformat.s35 + 0)
.l34:
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
244a : 90 01 __ BCC $244d ; (sformat.s1092 + 0)
.s1091:
244c : e8 __ __ INX
.s1092:
244d : 38 __ __ SEC
244e : e9 30 __ SBC #$30
2450 : 85 44 __ STA T6 + 0 
2452 : 8a __ __ TXA
2453 : e9 00 __ SBC #$00
2455 : 85 45 __ STA T6 + 1 
2457 : a0 00 __ LDY #$00
2459 : b1 49 __ LDA (T1 + 0),y 
245b : 85 4c __ STA T5 + 0 
245d : e6 49 __ INC T1 + 0 
245f : d0 02 __ BNE $2463 ; (sformat.s1094 + 0)
.s1093:
2461 : e6 4a __ INC T1 + 1 
.s1094:
2463 : c9 30 __ CMP #$30
2465 : 90 04 __ BCC $246b ; (sformat.s35 + 0)
.s36:
2467 : c9 3a __ CMP #$3a
2469 : 90 c0 __ BCC $242b ; (sformat.l34 + 0)
.s35:
246b : a5 44 __ LDA T6 + 0 
246d : 8d d9 bf STA $bfd9 ; (wrapbuffer + 67)
.s31:
2470 : a5 4c __ LDA T5 + 0 
2472 : c9 2e __ CMP #$2e
2474 : d0 51 __ BNE $24c7 ; (sformat.s39 + 0)
.s37:
2476 : a9 00 __ LDA #$00
2478 : 85 44 __ STA T6 + 0 
.l243:
247a : 85 45 __ STA T6 + 1 
247c : a0 00 __ LDY #$00
247e : b1 49 __ LDA (T1 + 0),y 
2480 : 85 4c __ STA T5 + 0 
2482 : e6 49 __ INC T1 + 0 
2484 : d0 02 __ BNE $2488 ; (sformat.s1084 + 0)
.s1083:
2486 : e6 4a __ INC T1 + 1 
.s1084:
2488 : c9 30 __ CMP #$30
248a : 90 04 __ BCC $2490 ; (sformat.s42 + 0)
.s43:
248c : c9 3a __ CMP #$3a
248e : 90 0a __ BCC $249a ; (sformat.s41 + 0)
.s42:
2490 : a5 44 __ LDA T6 + 0 
2492 : 8d da bf STA $bfda ; (wrapbuffer + 68)
2495 : a5 4c __ LDA T5 + 0 
2497 : 4c c7 24 JMP $24c7 ; (sformat.s39 + 0)
.s41:
249a : a5 44 __ LDA T6 + 0 
249c : 0a __ __ ASL
249d : 85 1b __ STA ACCU + 0 ; (fps + 0)
249f : a5 45 __ LDA T6 + 1 
24a1 : 2a __ __ ROL
24a2 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
24a4 : 2a __ __ ROL
24a5 : aa __ __ TAX
24a6 : 18 __ __ CLC
24a7 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
24a9 : 65 44 __ ADC T6 + 0 
24ab : 85 44 __ STA T6 + 0 
24ad : 8a __ __ TXA
24ae : 65 45 __ ADC T6 + 1 
24b0 : 06 44 __ ASL T6 + 0 
24b2 : 2a __ __ ROL
24b3 : aa __ __ TAX
24b4 : 18 __ __ CLC
24b5 : a5 44 __ LDA T6 + 0 
24b7 : 65 4c __ ADC T5 + 0 
24b9 : 90 01 __ BCC $24bc ; (sformat.s1090 + 0)
.s1089:
24bb : e8 __ __ INX
.s1090:
24bc : 38 __ __ SEC
24bd : e9 30 __ SBC #$30
24bf : 85 44 __ STA T6 + 0 
24c1 : 8a __ __ TXA
24c2 : e9 00 __ SBC #$00
24c4 : 4c 7a 24 JMP $247a ; (sformat.l243 + 0)
.s39:
24c7 : c9 64 __ CMP #$64
24c9 : f0 04 __ BEQ $24cf ; (sformat.s44 + 0)
.s47:
24cb : c9 44 __ CMP #$44
24cd : d0 05 __ BNE $24d4 ; (sformat.s45 + 0)
.s44:
24cf : a9 01 __ LDA #$01
24d1 : 4c aa 26 JMP $26aa ; (sformat.s261 + 0)
.s45:
24d4 : c9 75 __ CMP #$75
24d6 : d0 03 __ BNE $24db ; (sformat.s51 + 0)
24d8 : 4c a8 26 JMP $26a8 ; (sformat.s291 + 0)
.s51:
24db : c9 55 __ CMP #$55
24dd : d0 03 __ BNE $24e2 ; (sformat.s49 + 0)
24df : 4c a8 26 JMP $26a8 ; (sformat.s291 + 0)
.s49:
24e2 : c9 78 __ CMP #$78
24e4 : f0 04 __ BEQ $24ea ; (sformat.s52 + 0)
.s55:
24e6 : c9 58 __ CMP #$58
24e8 : d0 0d __ BNE $24f7 ; (sformat.s53 + 0)
.s52:
24ea : a9 10 __ LDA #$10
24ec : 8d db bf STA $bfdb ; (wrapbuffer + 69)
24ef : a9 00 __ LDA #$00
24f1 : 8d dc bf STA $bfdc ; (wrapbuffer + 70)
24f4 : 4c a8 26 JMP $26a8 ; (sformat.s291 + 0)
.s53:
24f7 : c9 6c __ CMP #$6c
24f9 : d0 03 __ BNE $24fe ; (sformat.s59 + 0)
24fb : 4c 1f 26 JMP $261f ; (sformat.s56 + 0)
.s59:
24fe : c9 4c __ CMP #$4c
2500 : d0 03 __ BNE $2505 ; (sformat.s57 + 0)
2502 : 4c 1f 26 JMP $261f ; (sformat.s56 + 0)
.s57:
2505 : c9 73 __ CMP #$73
2507 : f0 54 __ BEQ $255d ; (sformat.s72 + 0)
.s75:
2509 : c9 53 __ CMP #$53
250b : f0 50 __ BEQ $255d ; (sformat.s72 + 0)
.s73:
250d : c9 63 __ CMP #$63
250f : f0 23 __ BEQ $2534 ; (sformat.s103 + 0)
.s106:
2511 : c9 43 __ CMP #$43
2513 : f0 1f __ BEQ $2534 ; (sformat.s103 + 0)
.s104:
2515 : 09 00 __ ORA #$00
2517 : d0 03 __ BNE $251c ; (sformat.s107 + 0)
2519 : 4c 07 23 JMP $2307 ; (sformat.l1 + 0)
.s107:
251c : 18 __ __ CLC
251d : a5 16 __ LDA P9 ; (buff + 0)
251f : 65 47 __ ADC T0 + 0 
2521 : 85 44 __ STA T6 + 0 
2523 : a5 17 __ LDA P10 ; (buff + 1)
2525 : 69 00 __ ADC #$00
2527 : 85 45 __ STA T6 + 1 
2529 : a5 4c __ LDA T5 + 0 
.s1068:
252b : a0 00 __ LDY #$00
252d : 91 44 __ STA (T6 + 0),y 
252f : e6 47 __ INC T0 + 0 
2531 : 4c 07 23 JMP $2307 ; (sformat.l1 + 0)
.s103:
2534 : ad f2 bf LDA $bff2 ; (sstack + 2)
2537 : 85 4c __ STA T5 + 0 
2539 : 18 __ __ CLC
253a : 69 02 __ ADC #$02
253c : 8d f2 bf STA $bff2 ; (sstack + 2)
253f : ad f3 bf LDA $bff3 ; (sstack + 3)
2542 : 85 4d __ STA T5 + 1 
2544 : 69 00 __ ADC #$00
2546 : 8d f3 bf STA $bff3 ; (sstack + 3)
2549 : 18 __ __ CLC
254a : a5 16 __ LDA P9 ; (buff + 0)
254c : 65 47 __ ADC T0 + 0 
254e : 85 44 __ STA T6 + 0 
2550 : a5 17 __ LDA P10 ; (buff + 1)
2552 : 69 00 __ ADC #$00
2554 : 85 45 __ STA T6 + 1 
2556 : a0 00 __ LDY #$00
2558 : b1 4c __ LDA (T5 + 0),y 
255a : 4c 2b 25 JMP $252b ; (sformat.s1068 + 0)
.s72:
255d : ad f2 bf LDA $bff2 ; (sstack + 2)
2560 : 85 4c __ STA T5 + 0 
2562 : 18 __ __ CLC
2563 : 69 02 __ ADC #$02
2565 : 8d f2 bf STA $bff2 ; (sstack + 2)
2568 : ad f3 bf LDA $bff3 ; (sstack + 3)
256b : 85 4d __ STA T5 + 1 
256d : 69 00 __ ADC #$00
256f : 8d f3 bf STA $bff3 ; (sstack + 3)
2572 : a0 00 __ LDY #$00
2574 : 84 4b __ STY T3 + 0 
2576 : b1 4c __ LDA (T5 + 0),y 
2578 : aa __ __ TAX
2579 : c8 __ __ INY
257a : b1 4c __ LDA (T5 + 0),y 
257c : 86 4c __ STX T5 + 0 
257e : 85 4d __ STA T5 + 1 
2580 : ad d9 bf LDA $bfd9 ; (wrapbuffer + 67)
2583 : f0 0c __ BEQ $2591 ; (sformat.s78 + 0)
.s1073:
2585 : 88 __ __ DEY
2586 : b1 4c __ LDA (T5 + 0),y 
2588 : f0 05 __ BEQ $258f ; (sformat.s1074 + 0)
.l80:
258a : c8 __ __ INY
258b : b1 4c __ LDA (T5 + 0),y 
258d : d0 fb __ BNE $258a ; (sformat.l80 + 0)
.s1074:
258f : 84 4b __ STY T3 + 0 
.s78:
2591 : ad de bf LDA $bfde ; (wrapbuffer + 72)
2594 : d0 19 __ BNE $25af ; (sformat.s84 + 0)
.s1077:
2596 : a6 4b __ LDX T3 + 0 
2598 : ec d9 bf CPX $bfd9 ; (wrapbuffer + 67)
259b : a4 47 __ LDY T0 + 0 
259d : b0 0c __ BCS $25ab ; (sformat.s1078 + 0)
.l86:
259f : ad d8 bf LDA $bfd8 ; (wrapbuffer + 66)
25a2 : 91 16 __ STA (P9),y ; (buff + 0)
25a4 : e8 __ __ INX
25a5 : ec d9 bf CPX $bfd9 ; (wrapbuffer + 67)
25a8 : c8 __ __ INY
25a9 : 90 f4 __ BCC $259f ; (sformat.l86 + 0)
.s1078:
25ab : 86 4b __ STX T3 + 0 
25ad : 84 47 __ STY T0 + 0 
.s84:
25af : ad f4 bf LDA $bff4 ; (sstack + 4)
25b2 : d0 37 __ BNE $25eb ; (sformat.s88 + 0)
.l94:
25b4 : a0 00 __ LDY #$00
25b6 : b1 4c __ LDA (T5 + 0),y 
25b8 : f0 0f __ BEQ $25c9 ; (sformat.s251 + 0)
.s95:
25ba : a4 47 __ LDY T0 + 0 
25bc : 91 16 __ STA (P9),y ; (buff + 0)
25be : e6 47 __ INC T0 + 0 
25c0 : e6 4c __ INC T5 + 0 
25c2 : d0 f0 __ BNE $25b4 ; (sformat.l94 + 0)
.s1087:
25c4 : e6 4d __ INC T5 + 1 
25c6 : 4c b4 25 JMP $25b4 ; (sformat.l94 + 0)
.s251:
25c9 : ad de bf LDA $bfde ; (wrapbuffer + 72)
25cc : d0 03 __ BNE $25d1 ; (sformat.s1075 + 0)
25ce : 4c 07 23 JMP $2307 ; (sformat.l1 + 0)
.s1075:
25d1 : a6 4b __ LDX T3 + 0 
25d3 : ec d9 bf CPX $bfd9 ; (wrapbuffer + 67)
25d6 : a4 47 __ LDY T0 + 0 
25d8 : b0 0c __ BCS $25e6 ; (sformat.s1076 + 0)
.l101:
25da : ad d8 bf LDA $bfd8 ; (wrapbuffer + 66)
25dd : 91 16 __ STA (P9),y ; (buff + 0)
25df : e8 __ __ INX
25e0 : ec d9 bf CPX $bfd9 ; (wrapbuffer + 67)
25e3 : c8 __ __ INY
25e4 : 90 f4 __ BCC $25da ; (sformat.l101 + 0)
.s1076:
25e6 : 84 47 __ STY T0 + 0 
25e8 : 4c 07 23 JMP $2307 ; (sformat.l1 + 0)
.s88:
25eb : a5 47 __ LDA T0 + 0 
25ed : f0 22 __ BEQ $2611 ; (sformat.s93 + 0)
.s91:
25ef : a5 16 __ LDA P9 ; (buff + 0)
25f1 : 85 0d __ STA P0 
25f3 : a5 17 __ LDA P10 ; (buff + 1)
25f5 : 85 0e __ STA P1 
25f7 : a9 00 __ LDA #$00
25f9 : a4 47 __ LDY T0 + 0 
25fb : 91 16 __ STA (P9),y ; (buff + 0)
25fd : 20 f3 26 JSR $26f3 ; (puts.s0 + 0)
2600 : a5 4c __ LDA T5 + 0 
2602 : 85 0d __ STA P0 
2604 : a5 4d __ LDA T5 + 1 
2606 : 85 0e __ STA P1 
2608 : 20 f3 26 JSR $26f3 ; (puts.s0 + 0)
260b : a9 00 __ LDA #$00
260d : 85 47 __ STA T0 + 0 
260f : f0 b8 __ BEQ $25c9 ; (sformat.s251 + 0)
.s93:
2611 : a5 4c __ LDA T5 + 0 
2613 : 85 0d __ STA P0 
2615 : a5 4d __ LDA T5 + 1 
2617 : 85 0e __ STA P1 
2619 : 20 f3 26 JSR $26f3 ; (puts.s0 + 0)
261c : 4c c9 25 JMP $25c9 ; (sformat.s251 + 0)
.s56:
261f : ad f2 bf LDA $bff2 ; (sstack + 2)
2622 : 85 4c __ STA T5 + 0 
2624 : 18 __ __ CLC
2625 : 69 04 __ ADC #$04
2627 : 8d f2 bf STA $bff2 ; (sstack + 2)
262a : ad f3 bf LDA $bff3 ; (sstack + 3)
262d : 85 4d __ STA T5 + 1 
262f : 69 00 __ ADC #$00
2631 : 8d f3 bf STA $bff3 ; (sstack + 3)
2634 : a0 00 __ LDY #$00
2636 : b1 49 __ LDA (T1 + 0),y 
2638 : aa __ __ TAX
2639 : e6 49 __ INC T1 + 0 
263b : d0 02 __ BNE $263f ; (sformat.s1086 + 0)
.s1085:
263d : e6 4a __ INC T1 + 1 
.s1086:
263f : b1 4c __ LDA (T5 + 0),y 
2641 : 85 53 __ STA T7 + 0 
2643 : a0 01 __ LDY #$01
2645 : b1 4c __ LDA (T5 + 0),y 
2647 : 85 54 __ STA T7 + 1 
2649 : c8 __ __ INY
264a : b1 4c __ LDA (T5 + 0),y 
264c : 85 55 __ STA T7 + 2 
264e : c8 __ __ INY
264f : b1 4c __ LDA (T5 + 0),y 
2651 : a8 __ __ TAY
2652 : 8a __ __ TXA
2653 : e0 64 __ CPX #$64
2655 : f0 04 __ BEQ $265b ; (sformat.s60 + 0)
.s63:
2657 : c9 44 __ CMP #$44
2659 : d0 04 __ BNE $265f ; (sformat.s61 + 0)
.s60:
265b : a9 01 __ LDA #$01
265d : d0 1f __ BNE $267e ; (sformat.s262 + 0)
.s61:
265f : c9 75 __ CMP #$75
2661 : f0 19 __ BEQ $267c ; (sformat.s292 + 0)
.s67:
2663 : c9 55 __ CMP #$55
2665 : f0 15 __ BEQ $267c ; (sformat.s292 + 0)
.s65:
2667 : c9 78 __ CMP #$78
2669 : f0 07 __ BEQ $2672 ; (sformat.s68 + 0)
.s71:
266b : c9 58 __ CMP #$58
266d : f0 03 __ BEQ $2672 ; (sformat.s68 + 0)
266f : 4c 07 23 JMP $2307 ; (sformat.l1 + 0)
.s68:
2672 : a9 10 __ LDA #$10
2674 : 8d db bf STA $bfdb ; (wrapbuffer + 69)
2677 : a9 00 __ LDA #$00
2679 : 8d dc bf STA $bfdc ; (wrapbuffer + 70)
.s292:
267c : a9 00 __ LDA #$00
.s262:
267e : 84 14 __ STY P7 
2680 : 85 15 __ STA P8 
2682 : a5 16 __ LDA P9 ; (buff + 0)
2684 : 85 0f __ STA P2 
2686 : a5 17 __ LDA P10 ; (buff + 1)
2688 : 85 10 __ STA P3 
268a : a5 53 __ LDA T7 + 0 
268c : 85 11 __ STA P4 
268e : a5 54 __ LDA T7 + 1 
2690 : 85 12 __ STA P5 
2692 : a5 55 __ LDA T7 + 2 
2694 : 85 13 __ STA P6 
2696 : a9 d8 __ LDA #$d8
2698 : 85 0d __ STA P0 
269a : a9 bf __ LDA #$bf
269c : 85 0e __ STA P1 
269e : 20 7d 28 JSR $287d ; (nforml.s0 + 0)
.s1069:
26a1 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
26a3 : 85 47 __ STA T0 + 0 
26a5 : 4c 07 23 JMP $2307 ; (sformat.l1 + 0)
.s291:
26a8 : a9 00 __ LDA #$00
.s261:
26aa : 85 13 __ STA P6 
26ac : a5 16 __ LDA P9 ; (buff + 0)
26ae : 85 0f __ STA P2 
26b0 : a5 17 __ LDA P10 ; (buff + 1)
26b2 : 85 10 __ STA P3 
26b4 : ad f2 bf LDA $bff2 ; (sstack + 2)
26b7 : 85 47 __ STA T0 + 0 
26b9 : ad f3 bf LDA $bff3 ; (sstack + 3)
26bc : 85 48 __ STA T0 + 1 
26be : a0 00 __ LDY #$00
26c0 : b1 47 __ LDA (T0 + 0),y 
26c2 : 85 11 __ STA P4 
26c4 : c8 __ __ INY
26c5 : b1 47 __ LDA (T0 + 0),y 
26c7 : 85 12 __ STA P5 
26c9 : 18 __ __ CLC
26ca : a5 47 __ LDA T0 + 0 
26cc : 69 02 __ ADC #$02
26ce : 8d f2 bf STA $bff2 ; (sstack + 2)
26d1 : a5 48 __ LDA T0 + 1 
26d3 : 69 00 __ ADC #$00
26d5 : 8d f3 bf STA $bff3 ; (sstack + 3)
26d8 : a9 d8 __ LDA #$d8
26da : 85 0d __ STA P0 
26dc : a9 bf __ LDA #$bf
26de : 85 0e __ STA P1 
26e0 : 20 48 27 JSR $2748 ; (nformi.s0 + 0)
26e3 : 4c a1 26 JMP $26a1 ; (sformat.s1069 + 0)
.s264:
26e6 : a0 00 __ LDY #$00
26e8 : b1 49 __ LDA (T1 + 0),y 
26ea : aa __ __ TAX
26eb : 18 __ __ CLC
26ec : a5 49 __ LDA T1 + 0 
26ee : 69 01 __ ADC #$01
26f0 : 4c e2 23 JMP $23e2 ; (sformat.l14 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
26f3 : a0 00 __ LDY #$00
26f5 : b1 0d __ LDA (P0),y 
26f7 : f0 0b __ BEQ $2704 ; (puts.s1001 + 0)
26f9 : 20 05 27 JSR $2705 ; (putpch + 0)
26fc : e6 0d __ INC P0 
26fe : d0 f3 __ BNE $26f3 ; (puts.s0 + 0)
2700 : e6 0e __ INC P1 
2702 : d0 ef __ BNE $26f3 ; (puts.s0 + 0)
.s1001:
2704 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
2705 : ae ff 2f LDX $2fff ; (giocharmap + 0)
2708 : e0 01 __ CPX #$01
270a : 90 26 __ BCC $2732 ; (putpch + 45)
270c : c9 0a __ CMP #$0a
270e : d0 02 __ BNE $2712 ; (putpch + 13)
2710 : a9 0d __ LDA #$0d
2712 : c9 09 __ CMP #$09
2714 : f0 1f __ BEQ $2735 ; (putpch + 48)
2716 : e0 02 __ CPX #$02
2718 : 90 18 __ BCC $2732 ; (putpch + 45)
271a : c9 41 __ CMP #$41
271c : 90 14 __ BCC $2732 ; (putpch + 45)
271e : c9 7b __ CMP #$7b
2720 : b0 10 __ BCS $2732 ; (putpch + 45)
2722 : c9 61 __ CMP #$61
2724 : b0 04 __ BCS $272a ; (putpch + 37)
2726 : c9 5b __ CMP #$5b
2728 : b0 08 __ BCS $2732 ; (putpch + 45)
272a : 49 20 __ EOR #$20
272c : e0 03 __ CPX #$03
272e : f0 02 __ BEQ $2732 ; (putpch + 45)
2730 : 29 df __ AND #$df
2732 : 4c d2 ff JMP $ffd2 
2735 : 38 __ __ SEC
2736 : 20 f0 ff JSR $fff0 
2739 : 98 __ __ TYA
273a : 29 03 __ AND #$03
273c : 49 03 __ EOR #$03
273e : aa __ __ TAX
273f : a9 20 __ LDA #$20
2741 : 20 d2 ff JSR $ffd2 
2744 : ca __ __ DEX
2745 : 10 fa __ BPL $2741 ; (putpch + 60)
2747 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
2748 : a9 00 __ LDA #$00
274a : 85 43 __ STA T0 + 0 
274c : a5 13 __ LDA P6 ; (s + 0)
274e : f0 13 __ BEQ $2763 ; (nformi.s182 + 0)
.s4:
2750 : 24 12 __ BIT P5 ; (v + 1)
2752 : 10 0f __ BPL $2763 ; (nformi.s182 + 0)
.s1:
2754 : 38 __ __ SEC
2755 : a9 00 __ LDA #$00
2757 : e5 11 __ SBC P4 ; (v + 0)
2759 : 85 11 __ STA P4 ; (v + 0)
275b : a9 00 __ LDA #$00
275d : e5 12 __ SBC P5 ; (v + 1)
275f : 85 12 __ STA P5 ; (v + 1)
2761 : e6 43 __ INC T0 + 0 
.s182:
2763 : a9 10 __ LDA #$10
2765 : 85 44 __ STA T2 + 0 
2767 : a5 11 __ LDA P4 ; (v + 0)
2769 : 05 12 __ ORA P5 ; (v + 1)
276b : f0 46 __ BEQ $27b3 ; (nformi.s7 + 0)
.s42:
276d : a0 03 __ LDY #$03
276f : b1 0d __ LDA (P0),y ; (si + 0)
2771 : 85 45 __ STA T4 + 0 
2773 : c8 __ __ INY
2774 : b1 0d __ LDA (P0),y ; (si + 0)
2776 : 85 46 __ STA T4 + 1 
.l6:
2778 : a5 11 __ LDA P4 ; (v + 0)
277a : 85 1b __ STA ACCU + 0 
277c : a5 12 __ LDA P5 ; (v + 1)
277e : 85 1c __ STA ACCU + 1 
2780 : a5 45 __ LDA T4 + 0 
2782 : 85 03 __ STA WORK + 0 
2784 : a5 46 __ LDA T4 + 1 
2786 : 85 04 __ STA WORK + 1 
2788 : 20 15 5a JSR $5a15 ; (divmod + 0)
278b : a5 06 __ LDA WORK + 3 
278d : 30 08 __ BMI $2797 ; (nformi.s78 + 0)
.s1019:
278f : d0 0a __ BNE $279b ; (nformi.s77 + 0)
.s1018:
2791 : a5 05 __ LDA WORK + 2 
2793 : c9 0a __ CMP #$0a
2795 : b0 04 __ BCS $279b ; (nformi.s77 + 0)
.s78:
2797 : a9 30 __ LDA #$30
2799 : d0 02 __ BNE $279d ; (nformi.s79 + 0)
.s77:
279b : a9 37 __ LDA #$37
.s79:
279d : 18 __ __ CLC
279e : 65 05 __ ADC WORK + 2 
27a0 : c6 44 __ DEC T2 + 0 
27a2 : a6 44 __ LDX T2 + 0 
27a4 : 9d e0 bf STA $bfe0,x ; (wrapbuffer + 74)
27a7 : a5 1b __ LDA ACCU + 0 
27a9 : 85 11 __ STA P4 ; (v + 0)
27ab : a5 1c __ LDA ACCU + 1 
27ad : 85 12 __ STA P5 ; (v + 1)
27af : 05 11 __ ORA P4 ; (v + 0)
27b1 : d0 c5 __ BNE $2778 ; (nformi.l6 + 0)
.s7:
27b3 : a0 02 __ LDY #$02
27b5 : b1 0d __ LDA (P0),y ; (si + 0)
27b7 : c9 ff __ CMP #$ff
27b9 : d0 04 __ BNE $27bf ; (nformi.s80 + 0)
.s81:
27bb : a9 0f __ LDA #$0f
27bd : d0 05 __ BNE $27c4 ; (nformi.s1026 + 0)
.s80:
27bf : 38 __ __ SEC
27c0 : a9 10 __ LDA #$10
27c2 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
27c4 : a8 __ __ TAY
27c5 : c4 44 __ CPY T2 + 0 
27c7 : b0 0d __ BCS $27d6 ; (nformi.s10 + 0)
.s9:
27c9 : a9 30 __ LDA #$30
.l1027:
27cb : c6 44 __ DEC T2 + 0 
27cd : a6 44 __ LDX T2 + 0 
27cf : 9d e0 bf STA $bfe0,x ; (wrapbuffer + 74)
27d2 : c4 44 __ CPY T2 + 0 
27d4 : 90 f5 __ BCC $27cb ; (nformi.l1027 + 0)
.s10:
27d6 : a0 07 __ LDY #$07
27d8 : b1 0d __ LDA (P0),y ; (si + 0)
27da : f0 20 __ BEQ $27fc ; (nformi.s13 + 0)
.s14:
27dc : a0 04 __ LDY #$04
27de : b1 0d __ LDA (P0),y ; (si + 0)
27e0 : d0 1a __ BNE $27fc ; (nformi.s13 + 0)
.s1013:
27e2 : 88 __ __ DEY
27e3 : b1 0d __ LDA (P0),y ; (si + 0)
27e5 : c9 10 __ CMP #$10
27e7 : d0 13 __ BNE $27fc ; (nformi.s13 + 0)
.s11:
27e9 : a9 58 __ LDA #$58
27eb : a6 44 __ LDX T2 + 0 
27ed : 9d df bf STA $bfdf,x ; (wrapbuffer + 73)
27f0 : 8a __ __ TXA
27f1 : 18 __ __ CLC
27f2 : 69 fe __ ADC #$fe
27f4 : 85 44 __ STA T2 + 0 
27f6 : aa __ __ TAX
27f7 : a9 30 __ LDA #$30
27f9 : 9d e0 bf STA $bfe0,x ; (wrapbuffer + 74)
.s13:
27fc : a9 00 __ LDA #$00
27fe : 85 1b __ STA ACCU + 0 
2800 : a5 43 __ LDA T0 + 0 
2802 : f0 06 __ BEQ $280a ; (nformi.s16 + 0)
.s15:
2804 : c6 44 __ DEC T2 + 0 
2806 : a9 2d __ LDA #$2d
2808 : d0 0a __ BNE $2814 ; (nformi.s1025 + 0)
.s16:
280a : a0 05 __ LDY #$05
280c : b1 0d __ LDA (P0),y ; (si + 0)
280e : f0 09 __ BEQ $2819 ; (nformi.s163 + 0)
.s18:
2810 : c6 44 __ DEC T2 + 0 
2812 : a9 2b __ LDA #$2b
.s1025:
2814 : a6 44 __ LDX T2 + 0 
2816 : 9d e0 bf STA $bfe0,x ; (wrapbuffer + 74)
.s163:
2819 : a0 06 __ LDY #$06
281b : b1 0d __ LDA (P0),y ; (si + 0)
281d : d0 33 __ BNE $2852 ; (nformi.s24 + 0)
.l30:
281f : a0 01 __ LDY #$01
2821 : b1 0d __ LDA (P0),y ; (si + 0)
2823 : 18 __ __ CLC
2824 : 65 44 __ ADC T2 + 0 
2826 : b0 04 __ BCS $282c ; (nformi.s31 + 0)
.s1006:
2828 : c9 11 __ CMP #$11
282a : 90 0d __ BCC $2839 ; (nformi.s33 + 0)
.s31:
282c : c6 44 __ DEC T2 + 0 
282e : a0 00 __ LDY #$00
2830 : b1 0d __ LDA (P0),y ; (si + 0)
2832 : a6 44 __ LDX T2 + 0 
2834 : 9d e0 bf STA $bfe0,x ; (wrapbuffer + 74)
2837 : b0 e6 __ BCS $281f ; (nformi.l30 + 0)
.s33:
2839 : a6 44 __ LDX T2 + 0 
283b : e0 10 __ CPX #$10
283d : b0 0e __ BCS $284d ; (nformi.s23 + 0)
.s34:
283f : 88 __ __ DEY
.l1022:
2840 : bd e0 bf LDA $bfe0,x ; (wrapbuffer + 74)
2843 : 91 0f __ STA (P2),y ; (str + 0)
2845 : e8 __ __ INX
2846 : e0 10 __ CPX #$10
2848 : c8 __ __ INY
2849 : 90 f5 __ BCC $2840 ; (nformi.l1022 + 0)
.s1023:
284b : 84 1b __ STY ACCU + 0 
.s23:
284d : a9 00 __ LDA #$00
284f : 85 1c __ STA ACCU + 1 
.s1001:
2851 : 60 __ __ RTS
.s24:
2852 : a6 44 __ LDX T2 + 0 
2854 : e0 10 __ CPX #$10
2856 : b0 1a __ BCS $2872 ; (nformi.l27 + 0)
.s25:
2858 : a0 00 __ LDY #$00
.l1020:
285a : bd e0 bf LDA $bfe0,x ; (wrapbuffer + 74)
285d : 91 0f __ STA (P2),y ; (str + 0)
285f : e8 __ __ INX
2860 : e0 10 __ CPX #$10
2862 : c8 __ __ INY
2863 : 90 f5 __ BCC $285a ; (nformi.l1020 + 0)
.s1021:
2865 : 84 1b __ STY ACCU + 0 
2867 : b0 09 __ BCS $2872 ; (nformi.l27 + 0)
.s28:
2869 : 88 __ __ DEY
286a : b1 0d __ LDA (P0),y ; (si + 0)
286c : a4 1b __ LDY ACCU + 0 
286e : 91 0f __ STA (P2),y ; (str + 0)
2870 : e6 1b __ INC ACCU + 0 
.l27:
2872 : a5 1b __ LDA ACCU + 0 
2874 : a0 01 __ LDY #$01
2876 : d1 0d __ CMP (P0),y ; (si + 0)
2878 : 90 ef __ BCC $2869 ; (nformi.s28 + 0)
287a : 4c 4d 28 JMP $284d ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
287d : a9 00 __ LDA #$00
287f : 85 43 __ STA T0 + 0 
2881 : a5 15 __ LDA P8 ; (s + 0)
2883 : f0 21 __ BEQ $28a6 ; (nforml.s182 + 0)
.s4:
2885 : a5 14 __ LDA P7 ; (v + 3)
2887 : f0 1d __ BEQ $28a6 ; (nforml.s182 + 0)
.s1032:
2889 : 10 1b __ BPL $28a6 ; (nforml.s182 + 0)
.s1:
288b : 38 __ __ SEC
288c : a9 00 __ LDA #$00
288e : e5 11 __ SBC P4 ; (v + 0)
2890 : 85 11 __ STA P4 ; (v + 0)
2892 : a9 00 __ LDA #$00
2894 : e5 12 __ SBC P5 ; (v + 1)
2896 : 85 12 __ STA P5 ; (v + 1)
2898 : a9 00 __ LDA #$00
289a : e5 13 __ SBC P6 ; (v + 2)
289c : 85 13 __ STA P6 ; (v + 2)
289e : a9 00 __ LDA #$00
28a0 : e5 14 __ SBC P7 ; (v + 3)
28a2 : 85 14 __ STA P7 ; (v + 3)
28a4 : e6 43 __ INC T0 + 0 
.s182:
28a6 : a9 10 __ LDA #$10
28a8 : 85 44 __ STA T2 + 0 
28aa : a5 14 __ LDA P7 ; (v + 3)
28ac : d0 0c __ BNE $28ba ; (nforml.s42 + 0)
.s1024:
28ae : a5 13 __ LDA P6 ; (v + 2)
28b0 : d0 08 __ BNE $28ba ; (nforml.s42 + 0)
.s1025:
28b2 : a5 12 __ LDA P5 ; (v + 1)
28b4 : d0 04 __ BNE $28ba ; (nforml.s42 + 0)
.s1026:
28b6 : c5 11 __ CMP P4 ; (v + 0)
28b8 : b0 0e __ BCS $28c8 ; (nforml.s7 + 0)
.s42:
28ba : a0 03 __ LDY #$03
28bc : b1 0d __ LDA (P0),y ; (si + 0)
28be : 85 45 __ STA T5 + 0 
28c0 : c8 __ __ INY
28c1 : b1 0d __ LDA (P0),y ; (si + 0)
28c3 : 85 46 __ STA T5 + 1 
28c5 : 4c 92 29 JMP $2992 ; (nforml.l6 + 0)
.s7:
28c8 : a0 02 __ LDY #$02
28ca : b1 0d __ LDA (P0),y ; (si + 0)
28cc : c9 ff __ CMP #$ff
28ce : d0 04 __ BNE $28d4 ; (nforml.s80 + 0)
.s81:
28d0 : a9 0f __ LDA #$0f
28d2 : d0 05 __ BNE $28d9 ; (nforml.s1039 + 0)
.s80:
28d4 : 38 __ __ SEC
28d5 : a9 10 __ LDA #$10
28d7 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
28d9 : a8 __ __ TAY
28da : c4 44 __ CPY T2 + 0 
28dc : b0 0d __ BCS $28eb ; (nforml.s10 + 0)
.s9:
28de : a9 30 __ LDA #$30
.l1040:
28e0 : c6 44 __ DEC T2 + 0 
28e2 : a6 44 __ LDX T2 + 0 
28e4 : 9d e0 bf STA $bfe0,x ; (wrapbuffer + 74)
28e7 : c4 44 __ CPY T2 + 0 
28e9 : 90 f5 __ BCC $28e0 ; (nforml.l1040 + 0)
.s10:
28eb : a0 07 __ LDY #$07
28ed : b1 0d __ LDA (P0),y ; (si + 0)
28ef : f0 20 __ BEQ $2911 ; (nforml.s13 + 0)
.s14:
28f1 : a0 04 __ LDY #$04
28f3 : b1 0d __ LDA (P0),y ; (si + 0)
28f5 : d0 1a __ BNE $2911 ; (nforml.s13 + 0)
.s1013:
28f7 : 88 __ __ DEY
28f8 : b1 0d __ LDA (P0),y ; (si + 0)
28fa : c9 10 __ CMP #$10
28fc : d0 13 __ BNE $2911 ; (nforml.s13 + 0)
.s11:
28fe : a9 58 __ LDA #$58
2900 : a6 44 __ LDX T2 + 0 
2902 : 9d df bf STA $bfdf,x ; (wrapbuffer + 73)
2905 : 8a __ __ TXA
2906 : 18 __ __ CLC
2907 : 69 fe __ ADC #$fe
2909 : 85 44 __ STA T2 + 0 
290b : aa __ __ TAX
290c : a9 30 __ LDA #$30
290e : 9d e0 bf STA $bfe0,x ; (wrapbuffer + 74)
.s13:
2911 : a9 00 __ LDA #$00
2913 : 85 1b __ STA ACCU + 0 
2915 : a5 43 __ LDA T0 + 0 
2917 : f0 06 __ BEQ $291f ; (nforml.s16 + 0)
.s15:
2919 : c6 44 __ DEC T2 + 0 
291b : a9 2d __ LDA #$2d
291d : d0 0a __ BNE $2929 ; (nforml.s1038 + 0)
.s16:
291f : a0 05 __ LDY #$05
2921 : b1 0d __ LDA (P0),y ; (si + 0)
2923 : f0 09 __ BEQ $292e ; (nforml.s163 + 0)
.s18:
2925 : c6 44 __ DEC T2 + 0 
2927 : a9 2b __ LDA #$2b
.s1038:
2929 : a6 44 __ LDX T2 + 0 
292b : 9d e0 bf STA $bfe0,x ; (wrapbuffer + 74)
.s163:
292e : a0 06 __ LDY #$06
2930 : b1 0d __ LDA (P0),y ; (si + 0)
2932 : d0 33 __ BNE $2967 ; (nforml.s24 + 0)
.l30:
2934 : a0 01 __ LDY #$01
2936 : b1 0d __ LDA (P0),y ; (si + 0)
2938 : 18 __ __ CLC
2939 : 65 44 __ ADC T2 + 0 
293b : b0 04 __ BCS $2941 ; (nforml.s31 + 0)
.s1006:
293d : c9 11 __ CMP #$11
293f : 90 0d __ BCC $294e ; (nforml.s33 + 0)
.s31:
2941 : c6 44 __ DEC T2 + 0 
2943 : a0 00 __ LDY #$00
2945 : b1 0d __ LDA (P0),y ; (si + 0)
2947 : a6 44 __ LDX T2 + 0 
2949 : 9d e0 bf STA $bfe0,x ; (wrapbuffer + 74)
294c : b0 e6 __ BCS $2934 ; (nforml.l30 + 0)
.s33:
294e : a6 44 __ LDX T2 + 0 
2950 : e0 10 __ CPX #$10
2952 : b0 0e __ BCS $2962 ; (nforml.s23 + 0)
.s34:
2954 : 88 __ __ DEY
.l1035:
2955 : bd e0 bf LDA $bfe0,x ; (wrapbuffer + 74)
2958 : 91 0f __ STA (P2),y ; (str + 0)
295a : e8 __ __ INX
295b : e0 10 __ CPX #$10
295d : c8 __ __ INY
295e : 90 f5 __ BCC $2955 ; (nforml.l1035 + 0)
.s1036:
2960 : 84 1b __ STY ACCU + 0 
.s23:
2962 : a9 00 __ LDA #$00
2964 : 85 1c __ STA ACCU + 1 
.s1001:
2966 : 60 __ __ RTS
.s24:
2967 : a6 44 __ LDX T2 + 0 
2969 : e0 10 __ CPX #$10
296b : b0 1a __ BCS $2987 ; (nforml.l27 + 0)
.s25:
296d : a0 00 __ LDY #$00
.l1033:
296f : bd e0 bf LDA $bfe0,x ; (wrapbuffer + 74)
2972 : 91 0f __ STA (P2),y ; (str + 0)
2974 : e8 __ __ INX
2975 : e0 10 __ CPX #$10
2977 : c8 __ __ INY
2978 : 90 f5 __ BCC $296f ; (nforml.l1033 + 0)
.s1034:
297a : 84 1b __ STY ACCU + 0 
297c : b0 09 __ BCS $2987 ; (nforml.l27 + 0)
.s28:
297e : 88 __ __ DEY
297f : b1 0d __ LDA (P0),y ; (si + 0)
2981 : a4 1b __ LDY ACCU + 0 
2983 : 91 0f __ STA (P2),y ; (str + 0)
2985 : e6 1b __ INC ACCU + 0 
.l27:
2987 : a5 1b __ LDA ACCU + 0 
2989 : a0 01 __ LDY #$01
298b : d1 0d __ CMP (P0),y ; (si + 0)
298d : 90 ef __ BCC $297e ; (nforml.s28 + 0)
298f : 4c 62 29 JMP $2962 ; (nforml.s23 + 0)
.l6:
2992 : a5 11 __ LDA P4 ; (v + 0)
2994 : 85 1b __ STA ACCU + 0 
2996 : a5 12 __ LDA P5 ; (v + 1)
2998 : 85 1c __ STA ACCU + 1 
299a : a5 13 __ LDA P6 ; (v + 2)
299c : 85 1d __ STA ACCU + 2 
299e : a5 14 __ LDA P7 ; (v + 3)
29a0 : 85 1e __ STA ACCU + 3 
29a2 : a5 45 __ LDA T5 + 0 
29a4 : 85 03 __ STA WORK + 0 
29a6 : a5 46 __ LDA T5 + 1 
29a8 : 85 04 __ STA WORK + 1 
29aa : a9 00 __ LDA #$00
29ac : 85 05 __ STA WORK + 2 
29ae : 85 06 __ STA WORK + 3 
29b0 : 20 9a 5a JSR $5a9a ; (divmod32 + 0)
29b3 : a5 08 __ LDA WORK + 5 
29b5 : 30 08 __ BMI $29bf ; (nforml.s78 + 0)
.s1023:
29b7 : d0 0a __ BNE $29c3 ; (nforml.s77 + 0)
.s1022:
29b9 : a5 07 __ LDA WORK + 4 
29bb : c9 0a __ CMP #$0a
29bd : b0 04 __ BCS $29c3 ; (nforml.s77 + 0)
.s78:
29bf : a9 30 __ LDA #$30
29c1 : d0 02 __ BNE $29c5 ; (nforml.s79 + 0)
.s77:
29c3 : a9 37 __ LDA #$37
.s79:
29c5 : 18 __ __ CLC
29c6 : 65 07 __ ADC WORK + 4 
29c8 : c6 44 __ DEC T2 + 0 
29ca : a6 44 __ LDX T2 + 0 
29cc : 9d e0 bf STA $bfe0,x ; (wrapbuffer + 74)
29cf : a5 1b __ LDA ACCU + 0 
29d1 : 85 11 __ STA P4 ; (v + 0)
29d3 : a5 1c __ LDA ACCU + 1 
29d5 : 85 12 __ STA P5 ; (v + 1)
29d7 : a5 1d __ LDA ACCU + 2 
29d9 : 85 13 __ STA P6 ; (v + 2)
29db : a5 1e __ LDA ACCU + 3 
29dd : 85 14 __ STA P7 ; (v + 3)
29df : d0 b1 __ BNE $2992 ; (nforml.l6 + 0)
.s1018:
29e1 : a5 13 __ LDA P6 ; (v + 2)
29e3 : d0 ad __ BNE $2992 ; (nforml.l6 + 0)
.s1019:
29e5 : a5 12 __ LDA P5 ; (v + 1)
29e7 : d0 a9 __ BNE $2992 ; (nforml.l6 + 0)
.s1020:
29e9 : c5 11 __ CMP P4 ; (v + 0)
29eb : 90 a5 __ BCC $2992 ; (nforml.l6 + 0)
29ed : 4c c8 28 JMP $28c8 ; (nforml.s7 + 0)
--------------------------------------------------------------------
getch: ; getch()->u8
.s0:
29f0 : 20 2b 2a JSR $2a2b ; (getpch + 0)
29f3 : c9 00 __ CMP #$00
29f5 : f0 f9 __ BEQ $29f0 ; (getch.s0 + 0)
29f7 : 85 1b __ STA ACCU + 0 
.s1001:
29f9 : a5 1b __ LDA ACCU + 0 
29fb : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
29fc : 20 81 ff JSR $ff81 
.s1001:
29ff : 60 __ __ RTS
--------------------------------------------------------------------
2a00 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2a10 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2a20 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getpch: ; getpch
2a2b : 20 e4 ff JSR $ffe4 
2a2e : ae ff 2f LDX $2fff ; (giocharmap + 0)
2a31 : e0 01 __ CPX #$01
2a33 : 90 26 __ BCC $2a5b ; (getpch + 48)
2a35 : c9 0d __ CMP #$0d
2a37 : d0 02 __ BNE $2a3b ; (getpch + 16)
2a39 : a9 0a __ LDA #$0a
2a3b : e0 02 __ CPX #$02
2a3d : 90 1c __ BCC $2a5b ; (getpch + 48)
2a3f : c9 db __ CMP #$db
2a41 : b0 18 __ BCS $2a5b ; (getpch + 48)
2a43 : c9 41 __ CMP #$41
2a45 : 90 14 __ BCC $2a5b ; (getpch + 48)
2a47 : c9 c1 __ CMP #$c1
2a49 : 90 02 __ BCC $2a4d ; (getpch + 34)
2a4b : 49 a0 __ EOR #$a0
2a4d : c9 7b __ CMP #$7b
2a4f : b0 0a __ BCS $2a5b ; (getpch + 48)
2a51 : c9 61 __ CMP #$61
2a53 : b0 04 __ BCS $2a59 ; (getpch + 46)
2a55 : c9 5b __ CMP #$5b
2a57 : b0 02 __ BCS $2a5b ; (getpch + 48)
2a59 : 49 20 __ EOR #$20
2a5b : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2a5c : 20 b4 22 JSR $22b4 ; (screen_width.s0 + 0)
2a5f : c5 0d __ CMP P0 ; (mode + 0)
2a61 : f0 03 __ BEQ $2a66 ; (screen_setmode.s1001 + 0)
.s1:
2a63 : 20 5f ff JSR $ff5f 
.s1001:
2a66 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
2a67 : 38 __ __ SEC
2a68 : a5 23 __ LDA SP + 0 
2a6a : e9 06 __ SBC #$06
2a6c : 85 23 __ STA SP + 0 
2a6e : b0 02 __ BCS $2a72 ; (bnk_init.s0 + 0)
2a70 : c6 24 __ DEC SP + 1 
.s0:
2a72 : 20 bd 2a JSR $2abd ; (getcurrentdevice.s0 + 0)
2a75 : 8d fe 5b STA $5bfe ; (bootdevice + 0)
2a78 : a9 c4 __ LDA #$c4
2a7a : a0 02 __ LDY #$02
2a7c : 91 23 __ STA (SP + 0),y 
2a7e : a9 2a __ LDA #$2a
2a80 : c8 __ __ INY
2a81 : 91 23 __ STA (SP + 0),y 
2a83 : ad fe 5b LDA $5bfe ; (bootdevice + 0)
2a86 : c8 __ __ INY
2a87 : 91 23 __ STA (SP + 0),y 
2a89 : a9 00 __ LDA #$00
2a8b : c8 __ __ INY
2a8c : 91 23 __ STA (SP + 0),y 
2a8e : 20 be 22 JSR $22be ; (printf.s0 + 0)
2a91 : a9 06 __ LDA #$06
2a93 : 8d 06 d5 STA $d506 
2a96 : a9 d4 __ LDA #$d4
2a98 : a0 02 __ LDY #$02
2a9a : 91 23 __ STA (SP + 0),y 
2a9c : a9 2a __ LDA #$2a
2a9e : c8 __ __ INY
2a9f : 91 23 __ STA (SP + 0),y 
2aa1 : 20 be 22 JSR $22be ; (printf.s0 + 0)
2aa4 : a9 03 __ LDA #$03
2aa6 : 8d f5 bf STA $bff5 ; (sstack + 5)
2aa9 : a9 2c __ LDA #$2c
2aab : 8d f6 bf STA $bff6 ; (sstack + 6)
2aae : 20 ee 2a JSR $2aee ; (load_overlay.s1000 + 0)
.s1001:
2ab1 : 18 __ __ CLC
2ab2 : a5 23 __ LDA SP + 0 
2ab4 : 69 06 __ ADC #$06
2ab6 : 85 23 __ STA SP + 0 
2ab8 : 90 02 __ BCC $2abc ; (bnk_init.s1001 + 11)
2aba : e6 24 __ INC SP + 1 
2abc : 60 __ __ RTS
--------------------------------------------------------------------
getcurrentdevice: ; getcurrentdevice()->u8
.s0:
2abd : a5 ba __ LDA $ba 
2abf : d0 02 __ BNE $2ac3 ; (getcurrentdevice.s1001 + 0)
.s1:
2ac1 : a9 08 __ LDA #$08
.s1001:
2ac3 : 60 __ __ RTS
--------------------------------------------------------------------
2ac4 : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
2ad4 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
2ae4 : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
load_overlay: ; load_overlay(const u8*)->void
.s1000:
2aee : 38 __ __ SEC
2aef : a5 23 __ LDA SP + 0 
2af1 : e9 06 __ SBC #$06
2af3 : 85 23 __ STA SP + 0 
2af5 : b0 02 __ BCS $2af9 ; (load_overlay.s0 + 0)
2af7 : c6 24 __ DEC SP + 1 
.s0:
2af9 : a9 00 __ LDA #$00
2afb : 85 0d __ STA P0 
2afd : 85 0e __ STA P1 
2aff : 20 7c 2b JSR $2b7c ; (krnio_setbnk.s0 + 0)
2b02 : ad f5 bf LDA $bff5 ; (sstack + 5)
2b05 : 85 4e __ STA T0 + 0 
2b07 : 85 0d __ STA P0 
2b09 : ad f6 bf LDA $bff6 ; (sstack + 6)
2b0c : 85 4f __ STA T0 + 1 
2b0e : 85 0e __ STA P1 
2b10 : 20 84 2b JSR $2b84 ; (krnio_setnam.s0 + 0)
2b13 : a5 4e __ LDA T0 + 0 
2b15 : a0 04 __ LDY #$04
2b17 : 91 23 __ STA (SP + 0),y 
2b19 : a5 4f __ LDA T0 + 1 
2b1b : c8 __ __ INY
2b1c : 91 23 __ STA (SP + 0),y 
2b1e : a9 9a __ LDA #$9a
2b20 : a0 02 __ LDY #$02
2b22 : 91 23 __ STA (SP + 0),y 
2b24 : a9 2b __ LDA #$2b
2b26 : c8 __ __ INY
2b27 : 91 23 __ STA (SP + 0),y 
2b29 : 20 be 22 JSR $22be ; (printf.s0 + 0)
2b2c : a9 01 __ LDA #$01
2b2e : 85 0d __ STA P0 
2b30 : 85 0f __ STA P2 
2b32 : ad fe 5b LDA $5bfe ; (bootdevice + 0)
2b35 : 85 0e __ STA P1 
2b37 : 20 a7 2b JSR $2ba7 ; (krnio_load.s0 + 0)
2b3a : 09 00 __ ORA #$00
2b3c : d0 32 __ BNE $2b70 ; (load_overlay.s1001 + 0)
.s1:
2b3e : a9 c4 __ LDA #$c4
2b40 : a0 02 __ LDY #$02
2b42 : 91 23 __ STA (SP + 0),y 
2b44 : a9 2b __ LDA #$2b
2b46 : c8 __ __ INY
2b47 : 91 23 __ STA (SP + 0),y 
2b49 : 20 be 22 JSR $22be ; (printf.s0 + 0)
2b4c : a9 e2 __ LDA #$e2
2b4e : a0 02 __ LDY #$02
2b50 : 91 23 __ STA (SP + 0),y 
2b52 : a9 2b __ LDA #$2b
2b54 : c8 __ __ INY
2b55 : 91 23 __ STA (SP + 0),y 
2b57 : ad 79 60 LDA $6079 ; (krnio_pstatus + 1)
2b5a : c8 __ __ INY
2b5b : 91 23 __ STA (SP + 0),y 
2b5d : a9 00 __ LDA #$00
2b5f : c8 __ __ INY
2b60 : 91 23 __ STA (SP + 0),y 
2b62 : 20 be 22 JSR $22be ; (printf.s0 + 0)
2b65 : a9 01 __ LDA #$01
2b67 : 85 0d __ STA P0 
2b69 : a9 00 __ LDA #$00
2b6b : 85 0e __ STA P1 
2b6d : 20 ee 2b JSR $2bee ; (exit.s0 + 0)
.s1001:
2b70 : 18 __ __ CLC
2b71 : a5 23 __ LDA SP + 0 
2b73 : 69 06 __ ADC #$06
2b75 : 85 23 __ STA SP + 0 
2b77 : 90 02 __ BCC $2b7b ; (load_overlay.s1001 + 11)
2b79 : e6 24 __ INC SP + 1 
2b7b : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
2b7c : a5 0d __ LDA P0 
2b7e : a6 0e __ LDX P1 
2b80 : 20 68 ff JSR $ff68 
.s1001:
2b83 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
2b84 : a5 0d __ LDA P0 
2b86 : 05 0e __ ORA P1 
2b88 : f0 08 __ BEQ $2b92 ; (krnio_setnam.s0 + 14)
2b8a : a0 ff __ LDY #$ff
2b8c : c8 __ __ INY
2b8d : b1 0d __ LDA (P0),y 
2b8f : d0 fb __ BNE $2b8c ; (krnio_setnam.s0 + 8)
2b91 : 98 __ __ TYA
2b92 : a6 0d __ LDX P0 
2b94 : a4 0e __ LDY P1 
2b96 : 20 bd ff JSR $ffbd 
.s1001:
2b99 : 60 __ __ RTS
--------------------------------------------------------------------
2b9a : __ __ __ BYT 4c 4f 41 44 49 4e 47 3a 20 25 53 0a 00          : LOADING: %S..
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
2ba7 : a5 0d __ LDA P0 
2ba9 : a6 0e __ LDX P1 
2bab : a4 0f __ LDY P2 
2bad : 20 ba ff JSR $ffba 
2bb0 : a9 00 __ LDA #$00
2bb2 : a2 00 __ LDX #$00
2bb4 : a0 00 __ LDY #$00
2bb6 : 20 d5 ff JSR $ffd5 
2bb9 : a9 00 __ LDA #$00
2bbb : b0 02 __ BCS $2bbf ; (krnio_load.s0 + 24)
2bbd : a9 01 __ LDA #$01
2bbf : 85 1b __ STA ACCU + 0 
.s1001:
2bc1 : a5 1b __ LDA ACCU + 0 
2bc3 : 60 __ __ RTS
--------------------------------------------------------------------
2bc4 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
2bd4 : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
2be2 : __ __ __ BYT 53 54 41 54 55 53 3a 20 25 44 0a 00             : STATUS: %D..
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
2bee : a5 0d __ LDA P0 
2bf0 : 85 1b __ STA ACCU + 0 
2bf2 : a5 0e __ LDA P1 
2bf4 : 85 1c __ STA ACCU + 1 
2bf6 : ae fe 2f LDX $2ffe ; (spentry + 0)
2bf9 : 9a __ __ TXS
2bfa : a9 4c __ LDA #$4c
2bfc : 85 54 __ STA $54 
2bfe : a9 00 __ LDA #$00
2c00 : 85 13 __ STA P6 
.s1001:
2c02 : 60 __ __ RTS
--------------------------------------------------------------------
2c03 : __ __ __ BYT 56 44 43 54 45 53 54 4c 4d 43 00                : VDCTESTLMC.
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2c0e : 09 00 __ ORA #$00
2c10 : d0 0d __ BNE $2c1f ; (fastmode.s1 + 0)
.s2:
2c12 : 8d 30 d0 STA $d030 
2c15 : ad 11 d0 LDA $d011 
2c18 : 29 7f __ AND #$7f
2c1a : 09 10 __ ORA #$10
2c1c : 4c 29 2c JMP $2c29 ; (fastmode.s3 + 0)
.s1:
2c1f : a9 01 __ LDA #$01
2c21 : 8d 30 d0 STA $d030 
2c24 : ad 11 d0 LDA $d011 
2c27 : 29 6f __ AND #$6f
.s3:
2c29 : 8d 11 d0 STA $d011 
.s1001:
2c2c : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->u8
.s0:
2c2d : ac f6 bf LDY $bff6 ; (sstack + 6)
2c30 : be 30 5b LDX $5b30,y ; (__multab36L + 0)
2c33 : 86 4a __ STX T1 + 0 
2c35 : 86 4c __ STX T2 + 0 
2c37 : bd 04 5c LDA $5c04,x ; (vdc_modes + 4)
2c3a : f0 0a __ BEQ $2c46 ; (vdc_set_mode.s3 + 0)
.s4:
2c3c : ad 5f 60 LDA $605f ; (vdc_state + 0)
2c3f : c9 10 __ CMP #$10
2c41 : d0 03 __ BNE $2c46 ; (vdc_set_mode.s3 + 0)
2c43 : 4c 3c 2d JMP $2d3c ; (vdc_set_mode.s1 + 0)
.s3:
2c46 : ad f6 bf LDA $bff6 ; (sstack + 6)
2c49 : 8d 61 60 STA $6061 ; (vdc_state + 2)
2c4c : a9 00 __ LDA #$00
2c4e : 8d 75 60 STA $6075 ; (vdc_state + 22)
2c51 : 8d 76 60 STA $6076 ; (vdc_state + 23)
2c54 : 8d 77 60 STA $6077 ; (vdc_state + 24)
2c57 : bd 00 5c LDA $5c00,x ; (vdc_modes + 0)
2c5a : 8d 62 60 STA $6062 ; (vdc_state + 3)
2c5d : bd 01 5c LDA $5c01,x ; (vdc_modes + 1)
2c60 : 8d 63 60 STA $6063 ; (vdc_state + 4)
2c63 : bd 02 5c LDA $5c02,x ; (vdc_modes + 2)
2c66 : 8d 64 60 STA $6064 ; (vdc_state + 5)
2c69 : bd 03 5c LDA $5c03,x ; (vdc_modes + 3)
2c6c : 8d 65 60 STA $6065 ; (vdc_state + 6)
2c6f : bd 09 5c LDA $5c09,x ; (vdc_modes + 9)
2c72 : 8d 6b 60 STA $606b ; (vdc_state + 12)
2c75 : bd 0a 5c LDA $5c0a,x ; (vdc_modes + 10)
2c78 : 8d 6c 60 STA $606c ; (vdc_state + 13)
2c7b : bd 0b 5c LDA $5c0b,x ; (vdc_modes + 11)
2c7e : 8d 6d 60 STA $606d ; (vdc_state + 14)
2c81 : bd 0c 5c LDA $5c0c,x ; (vdc_modes + 12)
2c84 : 8d 6e 60 STA $606e ; (vdc_state + 15)
2c87 : bd 0d 5c LDA $5c0d,x ; (vdc_modes + 13)
2c8a : 8d 6f 60 STA $606f ; (vdc_state + 16)
2c8d : bd 0e 5c LDA $5c0e,x ; (vdc_modes + 14)
2c90 : 8d 70 60 STA $6070 ; (vdc_state + 17)
2c93 : bd 0f 5c LDA $5c0f,x ; (vdc_modes + 15)
2c96 : 8d 71 60 STA $6071 ; (vdc_state + 18)
2c99 : bd 10 5c LDA $5c10,x ; (vdc_modes + 16)
2c9c : 8d 72 60 STA $6072 ; (vdc_state + 19)
2c9f : bd 11 5c LDA $5c11,x ; (vdc_modes + 17)
2ca2 : 8d 73 60 STA $6073 ; (vdc_state + 20)
2ca5 : bd 12 5c LDA $5c12,x ; (vdc_modes + 18)
2ca8 : 8d 74 60 STA $6074 ; (vdc_state + 21)
2cab : bd 05 5c LDA $5c05,x ; (vdc_modes + 5)
2cae : 85 4d __ STA T3 + 0 
2cb0 : 8d 67 60 STA $6067 ; (vdc_state + 8)
2cb3 : bd 06 5c LDA $5c06,x ; (vdc_modes + 6)
2cb6 : 85 4e __ STA T3 + 1 
2cb8 : 8d 68 60 STA $6068 ; (vdc_state + 9)
2cbb : bd 07 5c LDA $5c07,x ; (vdc_modes + 7)
2cbe : 85 4f __ STA T5 + 0 
2cc0 : 8d 69 60 STA $6069 ; (vdc_state + 10)
2cc3 : bd 08 5c LDA $5c08,x ; (vdc_modes + 8)
2cc6 : 85 50 __ STA T5 + 1 
2cc8 : 8d 6a 60 STA $606a ; (vdc_state + 11)
2ccb : 20 40 2d JSR $2d40 ; (vdc_set_multab.s0 + 0)
2cce : 20 9b 2d JSR $2d9b ; (vdc_disable_display.s0 + 0)
2cd1 : a5 4d __ LDA T3 + 0 
2cd3 : 85 0f __ STA P2 
2cd5 : a5 4e __ LDA T3 + 1 
2cd7 : 85 10 __ STA P3 
2cd9 : a5 4f __ LDA T5 + 0 
2cdb : 85 11 __ STA P4 
2cdd : a5 50 __ LDA T5 + 1 
2cdf : 85 12 __ STA P5 
2ce1 : 20 a6 2d JSR $2da6 ; (vdc_set_disp_address.s0 + 0)
2ce4 : a6 4a __ LDX T1 + 0 
2ce6 : bd 0d 5c LDA $5c0d,x ; (vdc_modes + 13)
2ce9 : 85 0f __ STA P2 
2ceb : bd 0e 5c LDA $5c0e,x ; (vdc_modes + 14)
2cee : 85 10 __ STA P3 
2cf0 : 20 ce 2d JSR $2dce ; (vdc_set_charset_address.s0 + 0)
2cf3 : 20 e2 2d JSR $2de2 ; (vdc_restore_charsets.s0 + 0)
2cf6 : 18 __ __ CLC
2cf7 : a9 13 __ LDA #$13
2cf9 : 65 4a __ ADC T1 + 0 
2cfb : a6 4a __ LDX T1 + 0 
2cfd : 85 4a __ STA T1 + 0 
2cff : a9 5c __ LDA #$5c
2d01 : 69 00 __ ADC #$00
2d03 : 85 4b __ STA T1 + 1 
2d05 : a0 00 __ LDY #$00
2d07 : 84 49 __ STY T0 + 0 
2d09 : bd 13 5c LDA $5c13,x ; (vdc_modes + 19)
.l1008:
2d0c : 85 0d __ STA P0 
2d0e : c8 __ __ INY
2d0f : b1 4a __ LDA (T1 + 0),y 
2d11 : 85 0e __ STA P1 
2d13 : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
2d16 : a4 49 __ LDY T0 + 0 
2d18 : c8 __ __ INY
2d19 : c8 __ __ INY
2d1a : 84 49 __ STY T0 + 0 
2d1c : b1 4a __ LDA (T1 + 0),y 
2d1e : c9 ff __ CMP #$ff
2d20 : d0 ea __ BNE $2d0c ; (vdc_set_mode.l1008 + 0)
.s7:
2d22 : a6 4c __ LDX T2 + 0 
2d24 : bd 04 5c LDA $5c04,x ; (vdc_modes + 4)
2d27 : f0 08 __ BEQ $2d31 ; (vdc_set_mode.s1010 + 0)
.s11:
2d29 : ad 60 60 LDA $6060 ; (vdc_state + 1)
2d2c : d0 03 __ BNE $2d31 ; (vdc_set_mode.s1010 + 0)
.s8:
2d2e : 20 01 2e JSR $2e01 ; (vdc_set_extended_memsize.s0 + 0)
.s1010:
2d31 : 20 d2 21 JSR $21d2 ; (vdc_cls.s0 + 0)
2d34 : 20 4a 2e JSR $2e4a ; (vdc_enable_display.s0 + 0)
2d37 : a9 01 __ LDA #$01
.s1001:
2d39 : 85 1b __ STA ACCU + 0 
2d3b : 60 __ __ RTS
.s1:
2d3c : a9 00 __ LDA #$00
2d3e : f0 f9 __ BEQ $2d39 ; (vdc_set_mode.s1001 + 0)
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
2d40 : ad 65 60 LDA $6065 ; (vdc_state + 6)
2d43 : 85 1c __ STA ACCU + 1 
2d45 : ad 64 60 LDA $6064 ; (vdc_state + 5)
2d48 : 85 1b __ STA ACCU + 0 
2d4a : 05 1c __ ORA ACCU + 1 
2d4c : f0 4c __ BEQ $2d9a ; (vdc_set_multab.s1001 + 0)
.s5:
2d4e : ad 62 60 LDA $6062 ; (vdc_state + 3)
2d51 : 18 __ __ CLC
2d52 : 6d 77 60 ADC $6077 ; (vdc_state + 24)
2d55 : 85 43 __ STA T2 + 0 
2d57 : ad 63 60 LDA $6063 ; (vdc_state + 4)
2d5a : 69 00 __ ADC #$00
2d5c : 85 44 __ STA T2 + 1 
2d5e : a9 00 __ LDA #$00
2d60 : 85 45 __ STA T3 + 0 
2d62 : 85 46 __ STA T3 + 1 
2d64 : a9 00 __ LDA #$00
2d66 : 85 47 __ STA T4 + 0 
2d68 : a9 61 __ LDA #$61
2d6a : 85 48 __ STA T4 + 1 
2d6c : a2 00 __ LDX #$00
.l2:
2d6e : a5 45 __ LDA T3 + 0 
2d70 : a0 00 __ LDY #$00
2d72 : 91 47 __ STA (T4 + 0),y 
2d74 : a5 46 __ LDA T3 + 1 
2d76 : c8 __ __ INY
2d77 : 91 47 __ STA (T4 + 0),y 
2d79 : 18 __ __ CLC
2d7a : a5 43 __ LDA T2 + 0 
2d7c : 65 45 __ ADC T3 + 0 
2d7e : 85 45 __ STA T3 + 0 
2d80 : a5 44 __ LDA T2 + 1 
2d82 : 65 46 __ ADC T3 + 1 
2d84 : 85 46 __ STA T3 + 1 
2d86 : 18 __ __ CLC
2d87 : a5 47 __ LDA T4 + 0 
2d89 : 69 02 __ ADC #$02
2d8b : 85 47 __ STA T4 + 0 
2d8d : 90 02 __ BCC $2d91 ; (vdc_set_multab.s1006 + 0)
.s1005:
2d8f : e6 48 __ INC T4 + 1 
.s1006:
2d91 : e8 __ __ INX
2d92 : a5 1c __ LDA ACCU + 1 
2d94 : d0 d8 __ BNE $2d6e ; (vdc_set_multab.l2 + 0)
.s1002:
2d96 : e4 1b __ CPX ACCU + 0 
2d98 : 90 d4 __ BCC $2d6e ; (vdc_set_multab.l2 + 0)
.s1001:
2d9a : 60 __ __ RTS
--------------------------------------------------------------------
vdc_disable_display: ; vdc_disable_display()->void
.s0:
2d9b : a9 22 __ LDA #$22
2d9d : 85 0d __ STA P0 
2d9f : a9 80 __ LDA #$80
2da1 : 85 0e __ STA P1 
2da3 : 4c 0e 21 JMP $210e ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_set_disp_address: ; vdc_set_disp_address(u16,u16)->void
.s0:
2da6 : a9 0c __ LDA #$0c
2da8 : 85 0d __ STA P0 
2daa : a5 10 __ LDA P3 ; (text + 1)
2dac : 85 0e __ STA P1 
2dae : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
2db1 : e6 0d __ INC P0 
2db3 : a5 0f __ LDA P2 ; (text + 0)
2db5 : 85 0e __ STA P1 
2db7 : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
2dba : a9 14 __ LDA #$14
2dbc : 85 0d __ STA P0 
2dbe : a5 12 __ LDA P5 ; (attr + 1)
2dc0 : 85 0e __ STA P1 
2dc2 : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
2dc5 : e6 0d __ INC P0 
2dc7 : a5 11 __ LDA P4 ; (attr + 0)
2dc9 : 85 0e __ STA P1 
2dcb : 4c 0e 21 JMP $210e ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_set_charset_address: ; vdc_set_charset_address(u16)->void
.s0:
2dce : a9 1c __ LDA #$1c
2dd0 : 85 0d __ STA P0 
2dd2 : 20 1e 21 JSR $211e ; (vdc_reg_read.s0 + 0)
2dd5 : 29 10 __ AND #$10
2dd7 : 45 10 __ EOR P3 ; (address + 1)
2dd9 : 29 1f __ AND #$1f
2ddb : 45 10 __ EOR P3 ; (address + 1)
2ddd : 85 0e __ STA P1 
2ddf : 4c 0e 21 JMP $210e ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
2de2 : a9 01 __ LDA #$01
2de4 : 85 13 __ STA P6 
2de6 : a9 02 __ LDA #$02
2de8 : 85 17 __ STA P10 
2dea : ad 6f 60 LDA $606f ; (vdc_state + 16)
2ded : 85 11 __ STA P4 
2def : ad 70 60 LDA $6070 ; (vdc_state + 17)
2df2 : 85 12 __ STA P5 
2df4 : a9 00 __ LDA #$00
2df6 : 85 16 __ STA P9 
2df8 : 85 14 __ STA P7 
2dfa : a9 d0 __ LDA #$d0
2dfc : 85 15 __ STA P8 
2dfe : 4c 00 13 JMP $1300 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
2e01 : ad 5f 60 LDA $605f ; (vdc_state + 0)
2e04 : c9 10 __ CMP #$10
2e06 : f0 27 __ BEQ $2e2f ; (vdc_set_extended_memsize.s1001 + 0)
.s4:
2e08 : ad 60 60 LDA $6060 ; (vdc_state + 1)
2e0b : d0 22 __ BNE $2e2f ; (vdc_set_extended_memsize.s1001 + 0)
.s3:
2e0d : 20 9b 2d JSR $2d9b ; (vdc_disable_display.s0 + 0)
2e10 : 20 30 2e JSR $2e30 ; (vdc_wipe_mem.s0 + 0)
2e13 : a9 1c __ LDA #$1c
2e15 : 85 0d __ STA P0 
2e17 : 20 1e 21 JSR $211e ; (vdc_reg_read.s0 + 0)
2e1a : 09 10 __ ORA #$10
2e1c : 85 0e __ STA P1 
2e1e : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
2e21 : 20 e2 2d JSR $2de2 ; (vdc_restore_charsets.s0 + 0)
2e24 : 20 d2 21 JSR $21d2 ; (vdc_cls.s0 + 0)
2e27 : 20 4a 2e JSR $2e4a ; (vdc_enable_display.s0 + 0)
2e2a : a9 01 __ LDA #$01
2e2c : 8d 60 60 STA $6060 ; (vdc_state + 1)
.s1001:
2e2f : 60 __ __ RTS
--------------------------------------------------------------------
vdc_wipe_mem: ; vdc_wipe_mem()->void
.s0:
2e30 : a9 ff __ LDA #$ff
2e32 : 85 43 __ STA T1 + 0 
2e34 : 85 14 __ STA P7 
2e36 : a9 00 __ LDA #$00
2e38 : 85 11 __ STA P4 
2e3a : 85 12 __ STA P5 
2e3c : 85 13 __ STA P6 
.l1004:
2e3e : 20 86 22 JSR $2286 ; (vdc_block_fill.s0 + 0)
2e41 : e6 12 __ INC P5 
2e43 : c6 43 __ DEC T1 + 0 
2e45 : d0 f7 __ BNE $2e3e ; (vdc_wipe_mem.l1004 + 0)
.s1003:
2e47 : 4c 86 22 JMP $2286 ; (vdc_block_fill.s0 + 0)
--------------------------------------------------------------------
vdc_enable_display: ; vdc_enable_display()->void
.s0:
2e4a : a9 22 __ LDA #$22
2e4c : 85 0d __ STA P0 
2e4e : a9 7d __ LDA #$7d
2e50 : 85 0e __ STA P1 
2e52 : 4c 0e 21 JMP $210e ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_prints: ; vdc_prints(u8,u8,const u8*)->void
.s0:
2e55 : ad f1 bf LDA $bff1 ; (sstack + 1)
2e58 : 85 15 __ STA P8 
2e5a : ad f2 bf LDA $bff2 ; (sstack + 2)
2e5d : 85 16 __ STA P9 
2e5f : ad f3 bf LDA $bff3 ; (sstack + 3)
2e62 : 85 17 __ STA P10 
2e64 : ad f4 bf LDA $bff4 ; (sstack + 4)
2e67 : 85 18 __ STA P11 
2e69 : ad 66 60 LDA $6066 ; (vdc_state + 7)
2e6c : 8d f0 bf STA $bff0 ; (sstack + 0)
2e6f : 4c 72 2e JMP $2e72 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr: ; vdc_prints_attr(u8,u8,const u8*,u8)->void
.s0:
2e72 : a5 15 __ LDA P8 ; (x + 0)
2e74 : 85 0d __ STA P0 
2e76 : a5 16 __ LDA P9 ; (y + 0)
2e78 : 85 0e __ STA P1 
2e7a : 20 72 22 JSR $2272 ; (vdc_coords.s0 + 0)
2e7d : a5 1b __ LDA ACCU + 0 
2e7f : 85 44 __ STA T1 + 0 
2e81 : a5 1c __ LDA ACCU + 1 
2e83 : 85 45 __ STA T1 + 1 
2e85 : a5 17 __ LDA P10 ; (string + 0)
2e87 : 85 0d __ STA P0 
2e89 : a5 18 __ LDA P11 ; (string + 1)
2e8b : 85 0e __ STA P1 
2e8d : 20 de 2e JSR $2ede ; (strlen.s0 + 0)
2e90 : a5 1b __ LDA ACCU + 0 
2e92 : 85 46 __ STA T3 + 0 
2e94 : ad 67 60 LDA $6067 ; (vdc_state + 8)
2e97 : 18 __ __ CLC
2e98 : 65 44 __ ADC T1 + 0 
2e9a : 85 0f __ STA P2 
2e9c : ad 68 60 LDA $6068 ; (vdc_state + 9)
2e9f : 65 45 __ ADC T1 + 1 
2ea1 : 85 10 __ STA P3 
2ea3 : 20 a2 21 JSR $21a2 ; (vdc_mem_addr.s0 + 0)
2ea6 : a5 46 __ LDA T3 + 0 
2ea8 : f0 18 __ BEQ $2ec2 ; (vdc_prints_attr.s4 + 0)
.s9:
2eaa : a0 00 __ LDY #$00
.l2:
2eac : 84 43 __ STY T0 + 0 
2eae : b1 17 __ LDA (P10),y ; (string + 0)
2eb0 : 20 02 2f JSR $2f02 ; (pet2screen.s0 + 0)
.l53:
2eb3 : 2c 00 d6 BIT $d600 
2eb6 : 10 fb __ BPL $2eb3 ; (vdc_prints_attr.l53 + 0)
.s7:
2eb8 : 8d 01 d6 STA $d601 
2ebb : a4 43 __ LDY T0 + 0 
2ebd : c8 __ __ INY
2ebe : c4 46 __ CPY T3 + 0 
2ec0 : 90 ea __ BCC $2eac ; (vdc_prints_attr.l2 + 0)
.s4:
2ec2 : ad 69 60 LDA $6069 ; (vdc_state + 10)
2ec5 : 18 __ __ CLC
2ec6 : 65 44 __ ADC T1 + 0 
2ec8 : 85 11 __ STA P4 
2eca : ad 6a 60 LDA $606a ; (vdc_state + 11)
2ecd : 65 45 __ ADC T1 + 1 
2ecf : 85 12 __ STA P5 
2ed1 : ad f0 bf LDA $bff0 ; (sstack + 0)
2ed4 : 85 13 __ STA P6 
2ed6 : a6 46 __ LDX T3 + 0 
2ed8 : ca __ __ DEX
2ed9 : 86 14 __ STX P7 
2edb : 4c 86 22 JMP $2286 ; (vdc_block_fill.s0 + 0)
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
2ede : a9 00 __ LDA #$00
2ee0 : 85 1b __ STA ACCU + 0 
2ee2 : 85 1c __ STA ACCU + 1 
2ee4 : a8 __ __ TAY
2ee5 : b1 0d __ LDA (P0),y ; (str + 0)
2ee7 : f0 18 __ BEQ $2f01 ; (strlen.s1001 + 0)
.s2:
2ee9 : a5 0d __ LDA P0 ; (str + 0)
2eeb : 85 1b __ STA ACCU + 0 
2eed : a2 00 __ LDX #$00
.l1002:
2eef : c8 __ __ INY
2ef0 : d0 01 __ BNE $2ef3 ; (strlen.s1005 + 0)
.s1004:
2ef2 : e8 __ __ INX
.s1005:
2ef3 : 8a __ __ TXA
2ef4 : 18 __ __ CLC
2ef5 : 65 0e __ ADC P1 ; (str + 1)
2ef7 : 85 1c __ STA ACCU + 1 
2ef9 : b1 1b __ LDA (ACCU + 0),y 
2efb : d0 f2 __ BNE $2eef ; (strlen.l1002 + 0)
.s1003:
2efd : 86 1c __ STX ACCU + 1 
2eff : 84 1b __ STY ACCU + 0 
.s1001:
2f01 : 60 __ __ RTS
--------------------------------------------------------------------
pet2screen: ; pet2screen(u8)->u8
.s0:
2f02 : c9 20 __ CMP #$20
2f04 : b0 03 __ BCS $2f09 ; (pet2screen.s2 + 0)
.s1:
2f06 : 69 80 __ ADC #$80
2f08 : 60 __ __ RTS
.s2:
2f09 : c9 40 __ CMP #$40
2f0b : 90 27 __ BCC $2f34 ; (pet2screen.s21 + 0)
.s7:
2f0d : c9 60 __ CMP #$60
2f0f : 90 17 __ BCC $2f28 ; (pet2screen.s4 + 0)
.s11:
2f11 : 09 00 __ ORA #$00
2f13 : 30 04 __ BMI $2f19 ; (pet2screen.s9 + 0)
.s8:
2f15 : 38 __ __ SEC
2f16 : e9 20 __ SBC #$20
2f18 : 60 __ __ RTS
.s9:
2f19 : c9 80 __ CMP #$80
2f1b : 90 17 __ BCC $2f34 ; (pet2screen.s21 + 0)
.s15:
2f1d : c9 a0 __ CMP #$a0
2f1f : b0 03 __ BCS $2f24 ; (pet2screen.s19 + 0)
.s12:
2f21 : 69 40 __ ADC #$40
2f23 : 60 __ __ RTS
.s19:
2f24 : c9 c0 __ CMP #$c0
2f26 : b0 04 __ BCS $2f2c ; (pet2screen.s23 + 0)
.s4:
2f28 : 38 __ __ SEC
2f29 : e9 40 __ SBC #$40
2f2b : 60 __ __ RTS
.s23:
2f2c : c9 ff __ CMP #$ff
2f2e : b0 04 __ BCS $2f34 ; (pet2screen.s21 + 0)
.s20:
2f30 : 38 __ __ SEC
2f31 : e9 80 __ SBC #$80
2f33 : 60 __ __ RTS
.s21:
2f34 : c9 ff __ CMP #$ff
2f36 : d0 02 __ BNE $2f3a ; (pet2screen.s1001 + 0)
.s24:
2f38 : a9 5e __ LDA #$5e
.s1001:
2f3a : 60 __ __ RTS
--------------------------------------------------------------------
2f3b : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 6f 53 43 41 52 36 34 : sTARTING oSCAR64
2f4b : __ __ __ BYT 20 76 64 63 20 44 45 4d 4f 2e 00                :  vdc DEMO..
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->i16
.s0:
2f56 : a9 00 __ LDA #$00
2f58 : 8d f4 bf STA $bff4 ; (sstack + 4)
2f5b : a0 02 __ LDY #$02
2f5d : b1 23 __ LDA (SP + 0),y 
2f5f : 85 4e __ STA T0 + 0 
2f61 : 85 16 __ STA P9 
2f63 : c8 __ __ INY
2f64 : b1 23 __ LDA (SP + 0),y 
2f66 : 85 4f __ STA T0 + 1 
2f68 : 85 17 __ STA P10 
2f6a : c8 __ __ INY
2f6b : b1 23 __ LDA (SP + 0),y 
2f6d : 8d f0 bf STA $bff0 ; (sstack + 0)
2f70 : c8 __ __ INY
2f71 : b1 23 __ LDA (SP + 0),y 
2f73 : 8d f1 bf STA $bff1 ; (sstack + 1)
2f76 : 18 __ __ CLC
2f77 : a5 23 __ LDA SP + 0 
2f79 : 69 06 __ ADC #$06
2f7b : 8d f2 bf STA $bff2 ; (sstack + 2)
2f7e : a5 24 __ LDA SP + 1 
2f80 : 69 00 __ ADC #$00
2f82 : 8d f3 bf STA $bff3 ; (sstack + 3)
2f85 : 20 ea 22 JSR $22ea ; (sformat.s1000 + 0)
2f88 : 38 __ __ SEC
2f89 : a5 1b __ LDA ACCU + 0 
2f8b : e5 4e __ SBC T0 + 0 
2f8d : 85 1b __ STA ACCU + 0 
2f8f : a5 1c __ LDA ACCU + 1 
2f91 : e5 4f __ SBC T0 + 1 
2f93 : 85 1c __ STA ACCU + 1 
.s1001:
2f95 : 60 __ __ RTS
--------------------------------------------------------------------
2f96 : __ __ __ BYT 76 64 63 20 4d 45 4d 4f 52 59 20 44 45 54 45 43 : vdc MEMORY DETEC
2fa6 : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 2c 20 45 58 54 45 : TED: %U kb, EXTE
2fb6 : __ __ __ BYT 4e 44 45 44 20 4d 45 4d 4f 52 59 20 25 53 41 42 : NDED MEMORY %SAB
2fc6 : __ __ __ BYT 4c 45 44 2e 00                                  : LED..
--------------------------------------------------------------------
2fcb : __ __ __ BYT 65 4e 00                                        : eN.
--------------------------------------------------------------------
2fce : __ __ __ BYT 64 49 53 00                                     : dIS.
--------------------------------------------------------------------
2fd2 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 3a 00 : lOADING ASSETS:.
--------------------------------------------------------------------
2fe2 : __ __ __ BYT 53 43 52 45 45 4e 32 00                         : SCREEN2.
--------------------------------------------------------------------
2fea : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 00             : fILE ERROR!.
--------------------------------------------------------------------
2ff6 : __ __ __ BYT 4d 55 53 49 43 31 00                            : MUSIC1.
--------------------------------------------------------------------
2ffd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
spentry:
2ffe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
2fff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
3000 : __ __ __ BYT 2d 20 53 43 52 45 45 4e 3a 20 6c 4f 47 4f 20 41 : - SCREEN: lOGO A
3010 : __ __ __ BYT 4e 44 20 54 45 53 54 20 53 43 52 45 45 4e 00    : ND TEST SCREEN.
--------------------------------------------------------------------
menu_fileerrormessage: ; menu_fileerrormessage()->void
.s1000:
301f : a5 53 __ LDA T0 + 0 
3021 : 8d d1 bf STA $bfd1 ; (wrapbuffer + 59)
3024 : 38 __ __ SEC
3025 : a5 23 __ LDA SP + 0 
3027 : e9 08 __ SBC #$08
3029 : 85 23 __ STA SP + 0 
302b : b0 02 __ BCS $302f ; (menu_fileerrormessage.s0 + 0)
302d : c6 24 __ DEC SP + 1 
.s0:
302f : a9 f0 __ LDA #$f0
3031 : 8d f4 bf STA $bff4 ; (sstack + 4)
3034 : a9 08 __ LDA #$08
3036 : 8d f5 bf STA $bff5 ; (sstack + 5)
3039 : 8d f6 bf STA $bff6 ; (sstack + 6)
303c : a9 1e __ LDA #$1e
303e : 8d f7 bf STA $bff7 ; (sstack + 7)
3041 : a9 06 __ LDA #$06
3043 : 8d f8 bf STA $bff8 ; (sstack + 8)
3046 : ad 66 60 LDA $6066 ; (vdc_state + 7)
3049 : 85 53 __ STA T0 + 0 
304b : a9 8d __ LDA #$8d
304d : 8d 66 60 STA $6066 ; (vdc_state + 7)
3050 : 20 d7 30 JSR $30d7 ; (vdcwin_win_new.s1000 + 0)
3053 : a9 0a __ LDA #$0a
3055 : 8d f1 bf STA $bff1 ; (sstack + 1)
3058 : a9 09 __ LDA #$09
305a : 8d f2 bf STA $bff2 ; (sstack + 2)
305d : a9 ea __ LDA #$ea
305f : 8d f3 bf STA $bff3 ; (sstack + 3)
3062 : a9 2f __ LDA #$2f
3064 : 8d f4 bf STA $bff4 ; (sstack + 4)
3067 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
306a : a9 88 __ LDA #$88
306c : a0 02 __ LDY #$02
306e : 91 23 __ STA (SP + 0),y 
3070 : a9 60 __ LDA #$60
3072 : c8 __ __ INY
3073 : 91 23 __ STA (SP + 0),y 
3075 : a9 67 __ LDA #$67
3077 : c8 __ __ INY
3078 : 91 23 __ STA (SP + 0),y 
307a : a9 35 __ LDA #$35
307c : c8 __ __ INY
307d : 91 23 __ STA (SP + 0),y 
307f : ad 79 60 LDA $6079 ; (krnio_pstatus + 1)
3082 : c8 __ __ INY
3083 : 91 23 __ STA (SP + 0),y 
3085 : a9 00 __ LDA #$00
3087 : c8 __ __ INY
3088 : 91 23 __ STA (SP + 0),y 
308a : 20 56 2f JSR $2f56 ; (sprintf.s0 + 0)
308d : a9 0a __ LDA #$0a
308f : 8d f1 bf STA $bff1 ; (sstack + 1)
3092 : a9 0b __ LDA #$0b
3094 : 8d f2 bf STA $bff2 ; (sstack + 2)
3097 : a9 88 __ LDA #$88
3099 : 8d f3 bf STA $bff3 ; (sstack + 3)
309c : a9 60 __ LDA #$60
309e : 8d f4 bf STA $bff4 ; (sstack + 4)
30a1 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
30a4 : a9 0a __ LDA #$0a
30a6 : 8d f1 bf STA $bff1 ; (sstack + 1)
30a9 : a9 0d __ LDA #$0d
30ab : 8d f2 bf STA $bff2 ; (sstack + 2)
30ae : a9 76 __ LDA #$76
30b0 : 8d f3 bf STA $bff3 ; (sstack + 3)
30b3 : a9 35 __ LDA #$35
30b5 : 8d f4 bf STA $bff4 ; (sstack + 4)
30b8 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
30bb : 20 81 35 JSR $3581 ; (vdcwin_getch.s0 + 0)
30be : 20 8f 35 JSR $358f ; (vdcwin_win_free.s0 + 0)
30c1 : a5 53 __ LDA T0 + 0 
30c3 : 8d 66 60 STA $6066 ; (vdc_state + 7)
.s1001:
30c6 : 18 __ __ CLC
30c7 : a5 23 __ LDA SP + 0 
30c9 : 69 08 __ ADC #$08
30cb : 85 23 __ STA SP + 0 
30cd : 90 02 __ BCC $30d1 ; (menu_fileerrormessage.s1001 + 11)
30cf : e6 24 __ INC SP + 1 
30d1 : ad d1 bf LDA $bfd1 ; (wrapbuffer + 59)
30d4 : 85 53 __ STA T0 + 0 
30d6 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_new: ; vdcwin_win_new(u8,u8,u8,u8,u8)->bool
.s1000:
30d7 : a2 0b __ LDX #$0b
30d9 : b5 53 __ LDA T3 + 0,x 
30db : 9d e4 bf STA $bfe4,x ; (wrapbuffer + 78)
30de : ca __ __ DEX
30df : 10 f8 __ BPL $30d9 ; (vdcwin_win_new.s1000 + 2)
.s0:
30e1 : ad f7 bf LDA $bff7 ; (sstack + 7)
30e4 : 85 50 __ STA T0 + 0 
30e6 : 85 51 __ STA T1 + 0 
30e8 : ad f8 bf LDA $bff8 ; (sstack + 8)
30eb : 85 52 __ STA T2 + 0 
30ed : 85 53 __ STA T3 + 0 
30ef : ad f5 bf LDA $bff5 ; (sstack + 5)
30f2 : 85 54 __ STA T4 + 0 
30f4 : 85 0d __ STA P0 
30f6 : ad f6 bf LDA $bff6 ; (sstack + 6)
30f9 : 85 55 __ STA T5 + 0 
30fb : 85 0e __ STA P1 
30fd : 20 72 22 JSR $2272 ; (vdc_coords.s0 + 0)
3100 : a5 1b __ LDA ACCU + 0 
3102 : 85 56 __ STA T6 + 0 
3104 : a5 1c __ LDA ACCU + 1 
3106 : 85 57 __ STA T6 + 1 
3108 : ad f4 bf LDA $bff4 ; (sstack + 4)
310b : 85 58 __ STA T7 + 0 
310d : 85 59 __ STA T8 + 0 
310f : 0a __ __ ASL
3110 : 10 13 __ BPL $3125 ; (vdcwin_win_new.s55 + 0)
.s4:
3112 : a5 54 __ LDA T4 + 0 
3114 : f0 0f __ BEQ $3125 ; (vdcwin_win_new.s55 + 0)
.s1:
3116 : e6 51 __ INC T1 + 0 
3118 : 18 __ __ CLC
3119 : a5 1b __ LDA ACCU + 0 
311b : 69 ff __ ADC #$ff
311d : 85 56 __ STA T6 + 0 
311f : a5 1c __ LDA ACCU + 1 
3121 : 69 ff __ ADC #$ff
3123 : 85 57 __ STA T6 + 1 
.s55:
3125 : a5 59 __ LDA T8 + 0 
3127 : 29 20 __ AND #$20
3129 : f0 15 __ BEQ $3140 ; (vdcwin_win_new.s57 + 0)
.s8:
312b : 18 __ __ CLC
312c : a5 50 __ LDA T0 + 0 
312e : 65 54 __ ADC T4 + 0 
3130 : a8 __ __ TAY
3131 : a9 00 __ LDA #$00
3133 : 2a __ __ ROL
3134 : cd 63 60 CMP $6063 ; (vdc_state + 4)
3137 : d0 03 __ BNE $313c ; (vdcwin_win_new.s1009 + 0)
.s1008:
3139 : cc 62 60 CPY $6062 ; (vdc_state + 3)
.s1009:
313c : b0 02 __ BCS $3140 ; (vdcwin_win_new.s57 + 0)
.s5:
313e : e6 51 __ INC T1 + 0 
.s57:
3140 : 24 59 __ BIT T8 + 0 
3142 : 10 1d __ BPL $3161 ; (vdcwin_win_new.s58 + 0)
.s12:
3144 : a5 55 __ LDA T5 + 0 
3146 : f0 19 __ BEQ $3161 ; (vdcwin_win_new.s58 + 0)
.s9:
3148 : e6 53 __ INC T3 + 0 
314a : ad 62 60 LDA $6062 ; (vdc_state + 3)
314d : 85 03 __ STA WORK + 0 
314f : ad 63 60 LDA $6063 ; (vdc_state + 4)
3152 : 85 04 __ STA WORK + 1 
3154 : 38 __ __ SEC
3155 : a5 56 __ LDA T6 + 0 
3157 : e5 03 __ SBC WORK + 0 
3159 : 85 56 __ STA T6 + 0 
315b : a5 57 __ LDA T6 + 1 
315d : e5 04 __ SBC WORK + 1 
315f : 85 57 __ STA T6 + 1 
.s58:
3161 : a5 59 __ LDA T8 + 0 
3163 : 29 10 __ AND #$10
3165 : f0 15 __ BEQ $317c ; (vdcwin_win_new.s15 + 0)
.s16:
3167 : 18 __ __ CLC
3168 : a5 52 __ LDA T2 + 0 
316a : 65 55 __ ADC T5 + 0 
316c : a8 __ __ TAY
316d : a9 00 __ LDA #$00
316f : 2a __ __ ROL
3170 : cd 65 60 CMP $6065 ; (vdc_state + 6)
3173 : d0 03 __ BNE $3178 ; (vdcwin_win_new.s1007 + 0)
.s1006:
3175 : cc 64 60 CPY $6064 ; (vdc_state + 5)
.s1007:
3178 : b0 02 __ BCS $317c ; (vdcwin_win_new.s15 + 0)
.s13:
317a : e6 53 __ INC T3 + 0 
.s15:
317c : a5 52 __ LDA T2 + 0 
317e : 85 1b __ STA ACCU + 0 
3180 : a9 00 __ LDA #$00
3182 : 85 1c __ STA ACCU + 1 
3184 : a5 50 __ LDA T0 + 0 
3186 : 20 b3 59 JSR $59b3 ; (mul16by8 + 0)
3189 : a5 05 __ LDA WORK + 2 
318b : 0a __ __ ASL
318c : 85 59 __ STA T8 + 0 
318e : a5 06 __ LDA WORK + 3 
3190 : 2a __ __ ROL
3191 : 85 5a __ STA T8 + 1 
3193 : ad 5d 60 LDA $605d ; (winCfg + 6)
3196 : 85 5b __ STA T9 + 0 
3198 : 18 __ __ CLC
3199 : 65 59 __ ADC T8 + 0 
319b : 85 59 __ STA T8 + 0 
319d : ad 5e 60 LDA $605e ; (winCfg + 7)
31a0 : 85 5c __ STA T9 + 1 
31a2 : 65 5a __ ADC T8 + 1 
31a4 : 85 5a __ STA T8 + 1 
31a6 : ad 58 60 LDA $6058 ; (winCfg + 1)
31a9 : 18 __ __ CLC
31aa : 6d 5a 60 ADC $605a ; (winCfg + 3)
31ad : a8 __ __ TAY
31ae : ad 59 60 LDA $6059 ; (winCfg + 2)
31b1 : 6d 5b 60 ADC $605b ; (winCfg + 4)
31b4 : aa __ __ TAX
31b5 : 98 __ __ TYA
31b6 : 18 __ __ CLC
31b7 : 69 fe __ ADC #$fe
31b9 : a8 __ __ TAY
31ba : 8a __ __ TXA
31bb : 69 ff __ ADC #$ff
31bd : c5 5a __ CMP T8 + 1 
31bf : d0 02 __ BNE $31c3 ; (vdcwin_win_new.s1005 + 0)
.s1004:
31c1 : c4 59 __ CPY T8 + 0 
.s1005:
31c3 : 90 07 __ BCC $31cc ; (vdcwin_win_new.s17 + 0)
.s19:
31c5 : ad 5c 60 LDA $605c ; (winCfg + 5)
31c8 : c9 03 __ CMP #$03
31ca : d0 04 __ BNE $31d0 ; (vdcwin_win_new.s23 + 0)
.s17:
31cc : a9 00 __ LDA #$00
31ce : f0 56 __ BEQ $3226 ; (vdcwin_win_new.s1001 + 0)
.s23:
31d0 : a5 54 __ LDA T4 + 0 
31d2 : 85 11 __ STA P4 
31d4 : a5 55 __ LDA T5 + 0 
31d6 : 85 12 __ STA P5 
31d8 : a5 50 __ LDA T0 + 0 
31da : 85 13 __ STA P6 
31dc : a5 52 __ LDA T2 + 0 
31de : 85 14 __ STA P7 
31e0 : ee 5c 60 INC $605c ; (winCfg + 5)
31e3 : ae 5c 60 LDX $605c ; (winCfg + 5)
31e6 : bd 36 5b LDA $5b36,x ; (__multab13L + 0)
31e9 : 85 59 __ STA T8 + 0 
31eb : 18 __ __ CLC
31ec : 69 cf __ ADC #$cf
31ee : 85 5d __ STA T10 + 0 
31f0 : 85 0f __ STA P2 
31f2 : a9 60 __ LDA #$60
31f4 : 69 00 __ ADC #$00
31f6 : 85 5e __ STA T10 + 1 
31f8 : 85 10 __ STA P3 
31fa : 20 bf 32 JSR $32bf ; (vdcwin_init.s0 + 0)
31fd : a5 5b __ LDA T9 + 0 
31ff : a6 59 __ LDX T8 + 0 
3201 : 9d cc 60 STA $60cc,x ; (linebuffer + 68)
3204 : a5 5c __ LDA T9 + 1 
3206 : 9d cd 60 STA $60cd,x ; (linebuffer + 69)
3209 : a5 58 __ LDA T7 + 0 
320b : 9d ce 60 STA $60ce,x ; (linebuffer + 70)
320e : a5 53 __ LDA T3 + 0 
3210 : d0 21 __ BNE $3233 ; (vdcwin_win_new.s30 + 0)
.s28:
3212 : a5 5d __ LDA T10 + 0 
3214 : 8d f1 bf STA $bff1 ; (sstack + 1)
3217 : a5 5e __ LDA T10 + 1 
3219 : 8d f2 bf STA $bff2 ; (sstack + 2)
321c : a5 58 __ LDA T7 + 0 
321e : 8d f3 bf STA $bff3 ; (sstack + 3)
3221 : 20 10 33 JSR $3310 ; (vdcwin_border_clear.s0 + 0)
3224 : a9 01 __ LDA #$01
.s1001:
3226 : 85 1b __ STA ACCU + 0 
3228 : a2 0b __ LDX #$0b
322a : bd e4 bf LDA $bfe4,x ; (wrapbuffer + 78)
322d : 95 53 __ STA T3 + 0,x 
322f : ca __ __ DEX
3230 : 10 f8 __ BPL $322a ; (vdcwin_win_new.s1001 + 4)
3232 : 60 __ __ RTS
.s30:
3233 : 85 50 __ STA T0 + 0 
.l26:
3235 : a5 51 __ LDA T1 + 0 
3237 : 8d f0 bf STA $bff0 ; (sstack + 0)
323a : a9 00 __ LDA #$00
323c : 8d f1 bf STA $bff1 ; (sstack + 1)
323f : ad 57 60 LDA $6057 ; (winCfg + 0)
3242 : 85 13 __ STA P6 
3244 : ad 5d 60 LDA $605d ; (winCfg + 6)
3247 : 85 5b __ STA T9 + 0 
3249 : 85 14 __ STA P7 
324b : ad 5e 60 LDA $605e ; (winCfg + 7)
324e : 85 5c __ STA T9 + 1 
3250 : 85 15 __ STA P8 
3252 : ad 67 60 LDA $6067 ; (vdc_state + 8)
3255 : 18 __ __ CLC
3256 : 65 56 __ ADC T6 + 0 
3258 : 85 16 __ STA P9 
325a : ad 68 60 LDA $6068 ; (vdc_state + 9)
325d : 65 57 __ ADC T6 + 1 
325f : 85 17 __ STA P10 
3261 : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
3264 : a5 51 __ LDA T1 + 0 
3266 : 8d f0 bf STA $bff0 ; (sstack + 0)
3269 : a9 00 __ LDA #$00
326b : 8d f1 bf STA $bff1 ; (sstack + 1)
326e : 18 __ __ CLC
326f : a5 5b __ LDA T9 + 0 
3271 : 65 51 __ ADC T1 + 0 
3273 : 85 5b __ STA T9 + 0 
3275 : 85 14 __ STA P7 
3277 : 8d 5d 60 STA $605d ; (winCfg + 6)
327a : a5 5c __ LDA T9 + 1 
327c : 69 00 __ ADC #$00
327e : 85 5c __ STA T9 + 1 
3280 : 85 15 __ STA P8 
3282 : 8d 5e 60 STA $605e ; (winCfg + 7)
3285 : ad 69 60 LDA $6069 ; (vdc_state + 10)
3288 : 18 __ __ CLC
3289 : 65 56 __ ADC T6 + 0 
328b : 85 16 __ STA P9 
328d : ad 6a 60 LDA $606a ; (vdc_state + 11)
3290 : 65 57 __ ADC T6 + 1 
3292 : 85 17 __ STA P10 
3294 : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
3297 : 18 __ __ CLC
3298 : a5 5b __ LDA T9 + 0 
329a : 65 51 __ ADC T1 + 0 
329c : 8d 5d 60 STA $605d ; (winCfg + 6)
329f : a5 5c __ LDA T9 + 1 
32a1 : 69 00 __ ADC #$00
32a3 : 8d 5e 60 STA $605e ; (winCfg + 7)
32a6 : ad 62 60 LDA $6062 ; (vdc_state + 3)
32a9 : 18 __ __ CLC
32aa : 65 56 __ ADC T6 + 0 
32ac : 85 56 __ STA T6 + 0 
32ae : ad 63 60 LDA $6063 ; (vdc_state + 4)
32b1 : 65 57 __ ADC T6 + 1 
32b3 : 85 57 __ STA T6 + 1 
32b5 : c6 50 __ DEC T0 + 0 
32b7 : f0 03 __ BEQ $32bc ; (vdcwin_win_new.l26 + 135)
32b9 : 4c 35 32 JMP $3235 ; (vdcwin_win_new.l26 + 0)
32bc : 4c 12 32 JMP $3212 ; (vdcwin_win_new.s28 + 0)
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
32bf : a5 11 __ LDA P4 ; (sx + 0)
32c1 : 85 0d __ STA P0 
32c3 : a0 00 __ LDY #$00
32c5 : 91 0f __ STA (P2),y ; (win + 0)
32c7 : 98 __ __ TYA
32c8 : a0 04 __ LDY #$04
32ca : 91 0f __ STA (P2),y ; (win + 0)
32cc : c8 __ __ INY
32cd : 91 0f __ STA (P2),y ; (win + 0)
32cf : a5 12 __ LDA P5 ; (sy + 0)
32d1 : a0 01 __ LDY #$01
32d3 : 91 0f __ STA (P2),y ; (win + 0)
32d5 : 85 0e __ STA P1 
32d7 : a5 13 __ LDA P6 ; (wx + 0)
32d9 : c8 __ __ INY
32da : 91 0f __ STA (P2),y ; (win + 0)
32dc : a5 14 __ LDA P7 ; (wy + 0)
32de : c8 __ __ INY
32df : 91 0f __ STA (P2),y ; (win + 0)
32e1 : 20 72 22 JSR $2272 ; (vdc_coords.s0 + 0)
32e4 : ad 67 60 LDA $6067 ; (vdc_state + 8)
32e7 : 18 __ __ CLC
32e8 : 65 1b __ ADC ACCU + 0 
32ea : aa __ __ TAX
32eb : ad 68 60 LDA $6068 ; (vdc_state + 9)
32ee : 65 1c __ ADC ACCU + 1 
32f0 : a0 07 __ LDY #$07
32f2 : 91 0f __ STA (P2),y ; (win + 0)
32f4 : 8a __ __ TXA
32f5 : 88 __ __ DEY
32f6 : 91 0f __ STA (P2),y ; (win + 0)
32f8 : 20 72 22 JSR $2272 ; (vdc_coords.s0 + 0)
32fb : ad 69 60 LDA $6069 ; (vdc_state + 10)
32fe : 18 __ __ CLC
32ff : 65 1b __ ADC ACCU + 0 
3301 : aa __ __ TAX
3302 : ad 6a 60 LDA $606a ; (vdc_state + 11)
3305 : 65 1c __ ADC ACCU + 1 
3307 : a0 09 __ LDY #$09
3309 : 91 0f __ STA (P2),y ; (win + 0)
330b : 8a __ __ TXA
330c : 88 __ __ DEY
330d : 91 0f __ STA (P2),y ; (win + 0)
.s1001:
330f : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_border_clear: ; vdcwin_border_clear(struct VDCWin*,u8)->void
.s0:
3310 : ad f3 bf LDA $bff3 ; (sstack + 3)
3313 : 29 0f __ AND #$0f
3315 : 85 48 __ STA T2 + 0 
3317 : 49 ff __ EOR #$ff
3319 : 18 __ __ CLC
331a : 69 01 __ ADC #$01
331c : 29 09 __ AND #$09
331e : 85 49 __ STA T3 + 0 
3320 : aa __ __ TAX
3321 : bd 5b 5b LDA $5b5b,x ; (winStyles + 0)
3324 : 85 4a __ STA T4 + 0 
3326 : ad f3 bf LDA $bff3 ; (sstack + 3)
3329 : 0a __ __ ASL
332a : 10 10 __ BPL $333c ; (vdcwin_border_clear.s53 + 0)
.s4:
332c : ad f1 bf LDA $bff1 ; (sstack + 1)
332f : 85 4b __ STA T5 + 0 
3331 : ad f2 bf LDA $bff2 ; (sstack + 2)
3334 : 85 4c __ STA T5 + 1 
3336 : a0 00 __ LDY #$00
3338 : b1 4b __ LDA (T5 + 0),y 
333a : f0 06 __ BEQ $3342 ; (vdcwin_border_clear.s1 + 0)
.s53:
333c : ad f3 bf LDA $bff3 ; (sstack + 3)
333f : 4c 4a 33 JMP $334a ; (vdcwin_border_clear.s1008 + 0)
.s1:
3342 : ad f3 bf LDA $bff3 ; (sstack + 3)
3345 : 29 bf __ AND #$bf
3347 : 8d f3 bf STA $bff3 ; (sstack + 3)
.s1008:
334a : 29 20 __ AND #$20
334c : f0 3c __ BEQ $338a ; (vdcwin_border_clear.s7 + 0)
.s8:
334e : ad f1 bf LDA $bff1 ; (sstack + 1)
3351 : 85 46 __ STA T1 + 0 
3353 : ad f2 bf LDA $bff2 ; (sstack + 2)
3356 : 85 47 __ STA T1 + 1 
3358 : a0 00 __ LDY #$00
335a : b1 46 __ LDA (T1 + 0),y 
335c : 18 __ __ CLC
335d : a0 02 __ LDY #$02
335f : 71 46 __ ADC (T1 + 0),y 
3361 : a8 __ __ TAY
3362 : a9 00 __ LDA #$00
3364 : 2a __ __ ROL
3365 : 85 47 __ STA T1 + 1 
3367 : 98 __ __ TYA
3368 : 69 01 __ ADC #$01
336a : 85 4b __ STA T5 + 0 
336c : a5 47 __ LDA T1 + 1 
336e : 69 00 __ ADC #$00
3370 : 85 4c __ STA T5 + 1 
3372 : ad 63 60 LDA $6063 ; (vdc_state + 4)
3375 : c5 4c __ CMP T5 + 1 
3377 : d0 05 __ BNE $337e ; (vdcwin_border_clear.s1007 + 0)
.s1006:
3379 : ad 62 60 LDA $6062 ; (vdc_state + 3)
337c : c5 4b __ CMP T5 + 0 
.s1007:
337e : b0 0a __ BCS $338a ; (vdcwin_border_clear.s7 + 0)
.s5:
3380 : ad f3 bf LDA $bff3 ; (sstack + 3)
3383 : 29 df __ AND #$df
3385 : 8d f3 bf STA $bff3 ; (sstack + 3)
3388 : 90 03 __ BCC $338d ; (vdcwin_border_clear.s55 + 0)
.s7:
338a : ad f3 bf LDA $bff3 ; (sstack + 3)
.s55:
338d : 85 45 __ STA T0 + 0 
338f : 09 00 __ ORA #$00
3391 : 85 46 __ STA T1 + 0 
3393 : 10 71 __ BPL $3406 ; (vdcwin_border_clear.s59 + 0)
.s12:
3395 : ad f1 bf LDA $bff1 ; (sstack + 1)
3398 : 85 4b __ STA T5 + 0 
339a : ad f2 bf LDA $bff2 ; (sstack + 2)
339d : 85 4c __ STA T5 + 1 
339f : a0 01 __ LDY #$01
33a1 : b1 4b __ LDA (T5 + 0),y 
33a3 : f0 61 __ BEQ $3406 ; (vdcwin_border_clear.s59 + 0)
.s9:
33a5 : 38 __ __ SEC
33a6 : e9 01 __ SBC #$01
33a8 : 85 4e __ STA T7 + 0 
33aa : 06 45 __ ASL T0 + 0 
33ac : 10 16 __ BPL $33c4 ; (vdcwin_border_clear.s15 + 0)
.s13:
33ae : 85 15 __ STA P8 
33b0 : a5 4a __ LDA T4 + 0 
33b2 : 85 17 __ STA P10 
33b4 : bd 5c 5b LDA $5b5c,x ; (winStyles + 1)
33b7 : 85 16 __ STA P9 
33b9 : 38 __ __ SEC
33ba : 88 __ __ DEY
33bb : b1 4b __ LDA (T5 + 0),y 
33bd : e9 01 __ SBC #$01
33bf : 85 14 __ STA P7 
33c1 : 20 28 35 JSR $3528 ; (vdc_printc.s0 + 0)
.s15:
33c4 : a0 00 __ LDY #$00
33c6 : b1 4b __ LDA (T5 + 0),y 
33c8 : 85 45 __ STA T0 + 0 
33ca : 85 15 __ STA P8 
33cc : a5 4e __ LDA T7 + 0 
33ce : 85 16 __ STA P9 
33d0 : a5 4a __ LDA T4 + 0 
33d2 : 85 18 __ STA P11 
33d4 : a6 49 __ LDX T3 + 0 
33d6 : bd 60 5b LDA $5b60,x ; (winStyles + 5)
33d9 : 85 17 __ STA P10 
33db : a0 02 __ LDY #$02
33dd : b1 4b __ LDA (T5 + 0),y 
33df : 85 4d __ STA T6 + 0 
33e1 : 8d f0 bf STA $bff0 ; (sstack + 0)
33e4 : 20 2d 22 JSR $222d ; (vdc_hchar.s0 + 0)
33e7 : a5 46 __ LDA T1 + 0 
33e9 : 29 20 __ AND #$20
33eb : f0 19 __ BEQ $3406 ; (vdcwin_border_clear.s59 + 0)
.s16:
33ed : a5 16 __ LDA P9 
33ef : 85 15 __ STA P8 
33f1 : a5 18 __ LDA P11 
33f3 : 85 17 __ STA P10 
33f5 : a6 49 __ LDX T3 + 0 
33f7 : bd 5d 5b LDA $5b5d,x ; (winStyles + 2)
33fa : 85 16 __ STA P9 
33fc : 18 __ __ CLC
33fd : a5 4d __ LDA T6 + 0 
33ff : 65 45 __ ADC T0 + 0 
3401 : 85 14 __ STA P7 
3403 : 20 28 35 JSR $3528 ; (vdc_printc.s0 + 0)
.s59:
3406 : a5 46 __ LDA T1 + 0 
3408 : 29 10 __ AND #$10
340a : d0 03 __ BNE $340f ; (vdcwin_border_clear.s22 + 0)
340c : 4c 95 34 JMP $3495 ; (vdcwin_border_clear.s39 + 0)
.s22:
340f : ad f1 bf LDA $bff1 ; (sstack + 1)
3412 : 85 4b __ STA T5 + 0 
3414 : ad f2 bf LDA $bff2 ; (sstack + 2)
3417 : 85 4c __ STA T5 + 1 
3419 : a0 01 __ LDY #$01
341b : b1 4b __ LDA (T5 + 0),y 
341d : 18 __ __ CLC
341e : a0 03 __ LDY #$03
3420 : 71 4b __ ADC (T5 + 0),y 
3422 : 85 4e __ STA T7 + 0 
3424 : a9 00 __ LDA #$00
3426 : 2a __ __ ROL
3427 : cd 65 60 CMP $6065 ; (vdc_state + 6)
342a : d0 05 __ BNE $3431 ; (vdcwin_border_clear.s1005 + 0)
.s1004:
342c : a5 4e __ LDA T7 + 0 
342e : cd 64 60 CMP $6064 ; (vdc_state + 5)
.s1005:
3431 : b0 62 __ BCS $3495 ; (vdcwin_border_clear.s39 + 0)
.s19:
3433 : a5 46 __ LDA T1 + 0 
3435 : 0a __ __ ASL
3436 : 10 1b __ BPL $3453 ; (vdcwin_border_clear.s25 + 0)
.s23:
3438 : a5 4e __ LDA T7 + 0 
343a : 85 15 __ STA P8 
343c : a5 4a __ LDA T4 + 0 
343e : 85 17 __ STA P10 
3440 : a6 49 __ LDX T3 + 0 
3442 : bd 5e 5b LDA $5b5e,x ; (winStyles + 3)
3445 : 85 16 __ STA P9 
3447 : 38 __ __ SEC
3448 : a0 00 __ LDY #$00
344a : b1 4b __ LDA (T5 + 0),y 
344c : e9 01 __ SBC #$01
344e : 85 14 __ STA P7 
3450 : 20 28 35 JSR $3528 ; (vdc_printc.s0 + 0)
.s25:
3453 : a0 00 __ LDY #$00
3455 : b1 4b __ LDA (T5 + 0),y 
3457 : 85 45 __ STA T0 + 0 
3459 : 85 15 __ STA P8 
345b : a5 4e __ LDA T7 + 0 
345d : 85 16 __ STA P9 
345f : a5 4a __ LDA T4 + 0 
3461 : 85 18 __ STA P11 
3463 : a6 49 __ LDX T3 + 0 
3465 : bd 61 5b LDA $5b61,x ; (winStyles + 6)
3468 : 85 17 __ STA P10 
346a : a0 02 __ LDY #$02
346c : b1 4b __ LDA (T5 + 0),y 
346e : 85 4d __ STA T6 + 0 
3470 : 8d f0 bf STA $bff0 ; (sstack + 0)
3473 : 20 2d 22 JSR $222d ; (vdc_hchar.s0 + 0)
3476 : a5 46 __ LDA T1 + 0 
3478 : 29 20 __ AND #$20
347a : f0 19 __ BEQ $3495 ; (vdcwin_border_clear.s39 + 0)
.s26:
347c : a5 16 __ LDA P9 
347e : 85 15 __ STA P8 
3480 : a5 18 __ LDA P11 
3482 : 85 17 __ STA P10 
3484 : a6 49 __ LDX T3 + 0 
3486 : bd 5f 5b LDA $5b5f,x ; (winStyles + 4)
3489 : 85 16 __ STA P9 
348b : 18 __ __ CLC
348c : a5 4d __ LDA T6 + 0 
348e : 65 45 __ ADC T0 + 0 
3490 : 85 14 __ STA P7 
3492 : 20 28 35 JSR $3528 ; (vdc_printc.s0 + 0)
.s39:
3495 : a9 00 __ LDA #$00
3497 : 85 45 __ STA T0 + 0 
3499 : ad f1 bf LDA $bff1 ; (sstack + 1)
349c : 85 46 __ STA T1 + 0 
349e : ad f2 bf LDA $bff2 ; (sstack + 2)
34a1 : 85 47 __ STA T1 + 1 
.l29:
34a3 : a5 45 __ LDA T0 + 0 
34a5 : a0 03 __ LDY #$03
34a7 : d1 46 __ CMP (T1 + 0),y 
34a9 : 90 01 __ BCC $34ac ; (vdcwin_border_clear.s30 + 0)
.s1001:
34ab : 60 __ __ RTS
.s30:
34ac : ad f3 bf LDA $bff3 ; (sstack + 3)
34af : 85 4b __ STA T5 + 0 
34b1 : 0a __ __ ASL
34b2 : 10 25 __ BPL $34d9 ; (vdcwin_border_clear.s35 + 0)
.s33:
34b4 : a5 4a __ LDA T4 + 0 
34b6 : 85 17 __ STA P10 
34b8 : 38 __ __ SEC
34b9 : a0 00 __ LDY #$00
34bb : b1 46 __ LDA (T1 + 0),y 
34bd : e9 01 __ SBC #$01
34bf : 85 14 __ STA P7 
34c1 : c8 __ __ INY
34c2 : b1 46 __ LDA (T1 + 0),y 
34c4 : 18 __ __ CLC
34c5 : 65 45 __ ADC T0 + 0 
34c7 : 85 15 __ STA P8 
34c9 : 38 __ __ SEC
34ca : a9 00 __ LDA #$00
34cc : e5 48 __ SBC T2 + 0 
34ce : 29 09 __ AND #$09
34d0 : aa __ __ TAX
34d1 : bd 62 5b LDA $5b62,x ; (winStyles + 7)
34d4 : 85 16 __ STA P9 
34d6 : 20 28 35 JSR $3528 ; (vdc_printc.s0 + 0)
.s35:
34d9 : a9 20 __ LDA #$20
34db : 85 17 __ STA P10 
34dd : a0 02 __ LDY #$02
34df : b1 46 __ LDA (T1 + 0),y 
34e1 : 85 4d __ STA T6 + 0 
34e3 : 8d f0 bf STA $bff0 ; (sstack + 0)
34e6 : a0 00 __ LDY #$00
34e8 : b1 46 __ LDA (T1 + 0),y 
34ea : 85 4f __ STA T9 + 0 
34ec : 85 15 __ STA P8 
34ee : c8 __ __ INY
34ef : b1 46 __ LDA (T1 + 0),y 
34f1 : 18 __ __ CLC
34f2 : 65 45 __ ADC T0 + 0 
34f4 : 85 16 __ STA P9 
34f6 : ad 66 60 LDA $6066 ; (vdc_state + 7)
34f9 : 85 18 __ STA P11 
34fb : 20 2d 22 JSR $222d ; (vdc_hchar.s0 + 0)
34fe : a5 4b __ LDA T5 + 0 
3500 : 29 20 __ AND #$20
3502 : f0 1f __ BEQ $3523 ; (vdcwin_border_clear.s69 + 0)
.s36:
3504 : a5 16 __ LDA P9 
3506 : 85 15 __ STA P8 
3508 : a5 4a __ LDA T4 + 0 
350a : 85 17 __ STA P10 
350c : 18 __ __ CLC
350d : a5 4d __ LDA T6 + 0 
350f : 65 4f __ ADC T9 + 0 
3511 : 85 14 __ STA P7 
3513 : 38 __ __ SEC
3514 : a9 00 __ LDA #$00
3516 : e5 48 __ SBC T2 + 0 
3518 : 29 09 __ AND #$09
351a : aa __ __ TAX
351b : bd 63 5b LDA $5b63,x ; (winStyles + 8)
351e : 85 16 __ STA P9 
3520 : 20 28 35 JSR $3528 ; (vdc_printc.s0 + 0)
.s69:
3523 : e6 45 __ INC T0 + 0 
3525 : 4c a3 34 JMP $34a3 ; (vdcwin_border_clear.l29 + 0)
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
3528 : a5 14 __ LDA P7 ; (x + 0)
352a : 85 0d __ STA P0 
352c : a5 15 __ LDA P8 ; (y + 0)
352e : 85 0e __ STA P1 
3530 : 20 72 22 JSR $2272 ; (vdc_coords.s0 + 0)
3533 : a5 1b __ LDA ACCU + 0 
3535 : 85 43 __ STA T1 + 0 
3537 : a5 1c __ LDA ACCU + 1 
3539 : 85 44 __ STA T1 + 1 
353b : ad 67 60 LDA $6067 ; (vdc_state + 8)
353e : 18 __ __ CLC
353f : 65 1b __ ADC ACCU + 0 
3541 : 85 11 __ STA P4 
3543 : ad 68 60 LDA $6068 ; (vdc_state + 9)
3546 : 65 1c __ ADC ACCU + 1 
3548 : 85 12 __ STA P5 
354a : a5 16 __ LDA P9 ; (val + 0)
354c : 85 13 __ STA P6 
354e : 20 8c 21 JSR $218c ; (vdc_mem_write_at.s0 + 0)
3551 : ad 69 60 LDA $6069 ; (vdc_state + 10)
3554 : 18 __ __ CLC
3555 : 65 43 __ ADC T1 + 0 
3557 : 85 11 __ STA P4 
3559 : ad 6a 60 LDA $606a ; (vdc_state + 11)
355c : 65 44 __ ADC T1 + 1 
355e : 85 12 __ STA P5 
3560 : a5 17 __ LDA P10 ; (attr + 0)
3562 : 85 13 __ STA P6 
3564 : 4c 8c 21 JMP $218c ; (vdc_mem_write_at.s0 + 0)
--------------------------------------------------------------------
3567 : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 00    : eRROR NR.: %2x.
--------------------------------------------------------------------
3576 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 2e 00                : pRESS KEY..
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
3581 : 20 e4 ff JSR $ffe4 
3584 : c9 00 __ CMP #$00
3586 : f0 f9 __ BEQ $3581 ; (vdcwin_getch.s0 + 0)
3588 : 85 1b __ STA ACCU + 0 
358a : a9 00 __ LDA #$00
358c : 85 1c __ STA ACCU + 1 
.s1001:
358e : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_free: ; vdcwin_win_free()->void
.s0:
358f : ad 5c 60 LDA $605c ; (winCfg + 5)
3592 : d0 01 __ BNE $3595 ; (vdcwin_win_free.s3 + 0)
3594 : 60 __ __ RTS
.s3:
3595 : 85 44 __ STA T0 + 0 
3597 : aa __ __ TAX
3598 : bd 36 5b LDA $5b36,x ; (__multab13L + 0)
359b : 85 45 __ STA T1 + 0 
359d : aa __ __ TAX
359e : bd cf 60 LDA $60cf,x ; (linebuffer + 71)
35a1 : 85 0d __ STA P0 
35a3 : bd d0 60 LDA $60d0,x ; (linebuffer + 72)
35a6 : 85 0e __ STA P1 
35a8 : 20 72 22 JSR $2272 ; (vdc_coords.s0 + 0)
35ab : a5 1b __ LDA ACCU + 0 
35ad : 85 46 __ STA T2 + 0 
35af : a5 1c __ LDA ACCU + 1 
35b1 : 85 47 __ STA T2 + 1 
35b3 : a4 45 __ LDY T1 + 0 
35b5 : b9 d2 60 LDA $60d2,y ; (linebuffer + 74)
35b8 : 85 1d __ STA ACCU + 2 
35ba : b9 cc 60 LDA $60cc,y ; (linebuffer + 68)
35bd : 85 49 __ STA T5 + 0 
35bf : 8d 5d 60 STA $605d ; (winCfg + 6)
35c2 : b9 cd 60 LDA $60cd,y ; (linebuffer + 69)
35c5 : 85 4a __ STA T5 + 1 
35c7 : 8d 5e 60 STA $605e ; (winCfg + 7)
35ca : b9 ce 60 LDA $60ce,y ; (linebuffer + 70)
35cd : 85 45 __ STA T1 + 0 
35cf : be d1 60 LDX $60d1,y ; (linebuffer + 73)
35d2 : 0a __ __ ASL
35d3 : 10 12 __ BPL $35e7 ; (vdcwin_win_free.s51 + 0)
.s8:
35d5 : a5 0d __ LDA P0 
35d7 : f0 0e __ BEQ $35e7 ; (vdcwin_win_free.s51 + 0)
.s5:
35d9 : 18 __ __ CLC
35da : a5 1b __ LDA ACCU + 0 
35dc : 69 ff __ ADC #$ff
35de : 85 46 __ STA T2 + 0 
35e0 : a5 1c __ LDA ACCU + 1 
35e2 : 69 ff __ ADC #$ff
35e4 : 85 47 __ STA T2 + 1 
35e6 : e8 __ __ INX
.s51:
35e7 : a5 45 __ LDA T1 + 0 
35e9 : 29 20 __ AND #$20
35eb : f0 18 __ BEQ $3605 ; (vdcwin_win_free.s53 + 0)
.s12:
35ed : b9 d1 60 LDA $60d1,y ; (linebuffer + 73)
35f0 : 18 __ __ CLC
35f1 : 65 0d __ ADC P0 
35f3 : 85 4b __ STA T11 + 0 
35f5 : a9 00 __ LDA #$00
35f7 : 2a __ __ ROL
35f8 : cd 63 60 CMP $6063 ; (vdc_state + 4)
35fb : d0 05 __ BNE $3602 ; (vdcwin_win_free.s1005 + 0)
.s1004:
35fd : a5 4b __ LDA T11 + 0 
35ff : cd 62 60 CMP $6062 ; (vdc_state + 3)
.s1005:
3602 : b0 01 __ BCS $3605 ; (vdcwin_win_free.s53 + 0)
.s9:
3604 : e8 __ __ INX
.s53:
3605 : 24 45 __ BIT T1 + 0 
3607 : 10 1b __ BPL $3624 ; (vdcwin_win_free.s54 + 0)
.s16:
3609 : a5 0e __ LDA P1 
360b : f0 17 __ BEQ $3624 ; (vdcwin_win_free.s54 + 0)
.s13:
360d : b9 d2 60 LDA $60d2,y ; (linebuffer + 74)
3610 : 18 __ __ CLC
3611 : 69 01 __ ADC #$01
3613 : 85 1d __ STA ACCU + 2 
3615 : 38 __ __ SEC
3616 : a5 46 __ LDA T2 + 0 
3618 : ed 62 60 SBC $6062 ; (vdc_state + 3)
361b : 85 46 __ STA T2 + 0 
361d : a5 47 __ LDA T2 + 1 
361f : ed 63 60 SBC $6063 ; (vdc_state + 4)
3622 : 85 47 __ STA T2 + 1 
.s54:
3624 : a5 45 __ LDA T1 + 0 
3626 : 29 10 __ AND #$10
3628 : f0 16 __ BEQ $3640 ; (vdcwin_win_free.s19 + 0)
.s20:
362a : b9 d2 60 LDA $60d2,y ; (linebuffer + 74)
362d : 18 __ __ CLC
362e : 65 0e __ ADC P1 
3630 : a8 __ __ TAY
3631 : a9 00 __ LDA #$00
3633 : 2a __ __ ROL
3634 : cd 65 60 CMP $6065 ; (vdc_state + 6)
3637 : d0 03 __ BNE $363c ; (vdcwin_win_free.s1003 + 0)
.s1002:
3639 : cc 64 60 CPY $6064 ; (vdc_state + 5)
.s1003:
363c : b0 02 __ BCS $3640 ; (vdcwin_win_free.s19 + 0)
.s17:
363e : e6 1d __ INC ACCU + 2 
.s19:
3640 : a5 1d __ LDA ACCU + 2 
3642 : d0 11 __ BNE $3655 ; (vdcwin_win_free.s25 + 0)
.s24:
3644 : a5 49 __ LDA T5 + 0 
3646 : 8d 5d 60 STA $605d ; (winCfg + 6)
3649 : a5 4a __ LDA T5 + 1 
364b : 8d 5e 60 STA $605e ; (winCfg + 7)
364e : a6 44 __ LDX T0 + 0 
3650 : ca __ __ DEX
3651 : 8e 5c 60 STX $605c ; (winCfg + 5)
.s1001:
3654 : 60 __ __ RTS
.s25:
3655 : 86 16 __ STX P9 
3657 : 85 48 __ STA T3 + 0 
.l1006:
3659 : a9 00 __ LDA #$00
365b : 85 17 __ STA P10 
365d : ad 67 60 LDA $6067 ; (vdc_state + 8)
3660 : 18 __ __ CLC
3661 : 65 46 __ ADC T2 + 0 
3663 : 85 11 __ STA P4 
3665 : ad 68 60 LDA $6068 ; (vdc_state + 9)
3668 : 65 47 __ ADC T2 + 1 
366a : 85 12 __ STA P5 
366c : ad 57 60 LDA $6057 ; (winCfg + 0)
366f : 85 13 __ STA P6 
3671 : ad 5d 60 LDA $605d ; (winCfg + 6)
3674 : 85 4b __ STA T11 + 0 
3676 : 85 14 __ STA P7 
3678 : ad 5e 60 LDA $605e ; (winCfg + 7)
367b : 85 4c __ STA T11 + 1 
367d : 85 15 __ STA P8 
367f : 20 ee 13 JSR $13ee ; (bnk_cpytovdc.s0 + 0)
3682 : a9 00 __ LDA #$00
3684 : 85 17 __ STA P10 
3686 : 18 __ __ CLC
3687 : a5 4b __ LDA T11 + 0 
3689 : 65 16 __ ADC P9 
368b : 85 4b __ STA T11 + 0 
368d : 85 14 __ STA P7 
368f : 8d 5d 60 STA $605d ; (winCfg + 6)
3692 : a5 4c __ LDA T11 + 1 
3694 : 69 00 __ ADC #$00
3696 : 85 4c __ STA T11 + 1 
3698 : 85 15 __ STA P8 
369a : 8d 5e 60 STA $605e ; (winCfg + 7)
369d : ad 69 60 LDA $6069 ; (vdc_state + 10)
36a0 : 18 __ __ CLC
36a1 : 65 46 __ ADC T2 + 0 
36a3 : 85 11 __ STA P4 
36a5 : ad 6a 60 LDA $606a ; (vdc_state + 11)
36a8 : 65 47 __ ADC T2 + 1 
36aa : 85 12 __ STA P5 
36ac : 20 ee 13 JSR $13ee ; (bnk_cpytovdc.s0 + 0)
36af : 18 __ __ CLC
36b0 : a5 4b __ LDA T11 + 0 
36b2 : 65 16 __ ADC P9 
36b4 : 8d 5d 60 STA $605d ; (winCfg + 6)
36b7 : a5 4c __ LDA T11 + 1 
36b9 : 69 00 __ ADC #$00
36bb : 8d 5e 60 STA $605e ; (winCfg + 7)
36be : ad 62 60 LDA $6062 ; (vdc_state + 3)
36c1 : 18 __ __ CLC
36c2 : 65 46 __ ADC T2 + 0 
36c4 : 85 46 __ STA T2 + 0 
36c6 : ad 63 60 LDA $6063 ; (vdc_state + 4)
36c9 : 65 47 __ ADC T2 + 1 
36cb : 85 47 __ STA T2 + 1 
36cd : c6 48 __ DEC T3 + 0 
36cf : d0 88 __ BNE $3659 ; (vdcwin_win_free.l1006 + 0)
36d1 : 4c 44 36 JMP $3644 ; (vdcwin_win_free.s24 + 0)
--------------------------------------------------------------------
36d4 : __ __ __ BYT 2d 20 4d 55 53 49 43 3a 20 75 4c 54 49 4d 41 54 : - MUSIC: uLTIMAT
36e4 : __ __ __ BYT 45 20 61 58 45 4c 20 66 20 46 52 4f 4d 20 6e 4f : E aXEL f FROM nO
36f4 : __ __ __ BYT 52 44 49 53 43 48 53 4f 55 4e 44 00             : RDISCHSOUND.
--------------------------------------------------------------------
menu_placetop: ; menu_placetop(const u8*)->void
.s0:
3700 : 20 d2 21 JSR $21d2 ; (vdc_cls.s0 + 0)
3703 : ad f6 bf LDA $bff6 ; (sstack + 6)
3706 : 8d f1 bf STA $bff1 ; (sstack + 1)
3709 : ad f7 bf LDA $bff7 ; (sstack + 7)
370c : 8d f2 bf STA $bff2 ; (sstack + 2)
370f : 20 1a 37 JSR $371a ; (menu_placeheader.s0 + 0)
3712 : a9 01 __ LDA #$01
3714 : 8d f1 bf STA $bff1 ; (sstack + 1)
3717 : 4c 42 37 JMP $3742 ; (menu_placebar.s0 + 0)
--------------------------------------------------------------------
menu_placeheader: ; menu_placeheader(const u8*)->void
.s0:
371a : a9 00 __ LDA #$00
371c : 85 15 __ STA P8 
371e : 85 16 __ STA P9 
3720 : a9 20 __ LDA #$20
3722 : 85 17 __ STA P10 
3724 : a9 c5 __ LDA #$c5
3726 : 85 18 __ STA P11 
3728 : a9 50 __ LDA #$50
372a : 8d f0 bf STA $bff0 ; (sstack + 0)
372d : 20 2d 22 JSR $222d ; (vdc_hchar.s0 + 0)
3730 : a9 c5 __ LDA #$c5
3732 : 8d f0 bf STA $bff0 ; (sstack + 0)
3735 : ad f1 bf LDA $bff1 ; (sstack + 1)
3738 : 85 17 __ STA P10 
373a : ad f2 bf LDA $bff2 ; (sstack + 2)
373d : 85 18 __ STA P11 
373f : 4c 72 2e JMP $2e72 ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
menu_placebar: ; menu_placebar(u8)->void
.s0:
3742 : a9 00 __ LDA #$00
3744 : 85 15 __ STA P8 
3746 : a9 20 __ LDA #$20
3748 : 85 17 __ STA P10 
374a : a9 c4 __ LDA #$c4
374c : 85 18 __ STA P11 
374e : a9 50 __ LDA #$50
3750 : 8d f0 bf STA $bff0 ; (sstack + 0)
3753 : ad f1 bf LDA $bff1 ; (sstack + 1)
3756 : 85 47 __ STA T0 + 0 
3758 : 8d a9 5b STA $5ba9 ; (menubar + 60)
375b : 85 16 __ STA P9 
375d : 20 2d 22 JSR $222d ; (vdc_hchar.s0 + 0)
3760 : a9 01 __ LDA #$01
3762 : 85 48 __ STA T1 + 0 
3764 : a0 00 __ LDY #$00
3766 : 84 49 __ STY T2 + 0 
.l2:
3768 : b9 3a 5b LDA $5b3a,y ; (__multab9L + 0)
376b : 18 __ __ CLC
376c : 69 6d __ ADC #$6d
376e : 85 0d __ STA P0 
3770 : a9 5b __ LDA #$5b
3772 : 69 00 __ ADC #$00
3774 : 85 0e __ STA P1 
3776 : 20 de 2e JSR $2ede ; (strlen.s0 + 0)
3779 : a5 47 __ LDA T0 + 0 
377b : 85 16 __ STA P9 
377d : a5 0d __ LDA P0 
377f : 85 17 __ STA P10 
3781 : a5 0e __ LDA P1 
3783 : 85 18 __ STA P11 
3785 : a9 c4 __ LDA #$c4
3787 : 8d f0 bf STA $bff0 ; (sstack + 0)
378a : a5 1b __ LDA ACCU + 0 
378c : 85 4a __ STA T4 + 0 
378e : 18 __ __ CLC
378f : 65 48 __ ADC T1 + 0 
3791 : 85 43 __ STA T5 + 0 
3793 : a9 00 __ LDA #$00
3795 : 2a __ __ ROL
3796 : 85 44 __ STA T5 + 1 
3798 : ad 62 60 LDA $6062 ; (vdc_state + 3)
379b : 38 __ __ SEC
379c : e9 01 __ SBC #$01
379e : a8 __ __ TAY
379f : ad 63 60 LDA $6063 ; (vdc_state + 4)
37a2 : e9 00 __ SBC #$00
37a4 : c5 44 __ CMP T5 + 1 
37a6 : d0 02 __ BNE $37aa ; (menu_placebar.s1005 + 0)
.s1004:
37a8 : c4 43 __ CPY T5 + 0 
.s1005:
37aa : 90 04 __ BCC $37b0 ; (menu_placebar.s5 + 0)
.s7:
37ac : a5 48 __ LDA T1 + 0 
37ae : b0 04 __ BCS $37b4 ; (menu_placebar.s1006 + 0)
.s5:
37b0 : 98 __ __ TYA
37b1 : 38 __ __ SEC
37b2 : e5 1b __ SBC ACCU + 0 
.s1006:
37b4 : 85 15 __ STA P8 
37b6 : 20 72 2e JSR $2e72 ; (vdc_prints_attr.s0 + 0)
37b9 : a5 15 __ LDA P8 
37bb : a4 49 __ LDY T2 + 0 
37bd : c8 __ __ INY
37be : 84 49 __ STY T2 + 0 
37c0 : 99 a2 5b STA $5ba2,y ; (menubar + 53)
37c3 : a5 4a __ LDA T4 + 0 
37c5 : 38 __ __ SEC
37c6 : 65 15 __ ADC P8 
37c8 : 85 48 __ STA T1 + 0 
37ca : c0 06 __ CPY #$06
37cc : 90 9a __ BCC $3768 ; (menu_placebar.l2 + 0)
.s1001:
37ce : 60 __ __ RTS
--------------------------------------------------------------------
37cf : __ __ __ BYT 20 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d :  oSCAR64 vdc dEM
37df : __ __ __ BYT 4f 00                                           : O.
--------------------------------------------------------------------
vdcwin_viewport_init: ; vdcwin_viewport_init(struct VDCViewport*,u8,u8*,u16,u16,u16,u16,u8,u8)->void
.s0:
37e1 : a9 00 __ LDA #$00
37e3 : a0 07 __ LDY #$07
37e5 : 91 15 __ STA (P8),y ; (vp + 0)
37e7 : c8 __ __ INY
37e8 : 91 15 __ STA (P8),y ; (vp + 0)
37ea : c8 __ __ INY
37eb : 91 15 __ STA (P8),y ; (vp + 0)
37ed : c8 __ __ INY
37ee : 91 15 __ STA (P8),y ; (vp + 0)
37f0 : a5 17 __ LDA P10 ; (sourcebank + 0)
37f2 : a0 00 __ LDY #$00
37f4 : 91 15 __ STA (P8),y ; (vp + 0)
37f6 : ad f0 bf LDA $bff0 ; (sstack + 0)
37f9 : c8 __ __ INY
37fa : 91 15 __ STA (P8),y ; (vp + 0)
37fc : ad f1 bf LDA $bff1 ; (sstack + 1)
37ff : c8 __ __ INY
3800 : 91 15 __ STA (P8),y ; (vp + 0)
3802 : ad f2 bf LDA $bff2 ; (sstack + 2)
3805 : c8 __ __ INY
3806 : 91 15 __ STA (P8),y ; (vp + 0)
3808 : ad f3 bf LDA $bff3 ; (sstack + 3)
380b : c8 __ __ INY
380c : 91 15 __ STA (P8),y ; (vp + 0)
380e : ad f4 bf LDA $bff4 ; (sstack + 4)
3811 : c8 __ __ INY
3812 : 91 15 __ STA (P8),y ; (vp + 0)
3814 : ad f5 bf LDA $bff5 ; (sstack + 5)
3817 : c8 __ __ INY
3818 : 91 15 __ STA (P8),y ; (vp + 0)
381a : 18 __ __ CLC
381b : a5 15 __ LDA P8 ; (vp + 0)
381d : 69 0b __ ADC #$0b
381f : 85 0f __ STA P2 
3821 : a5 16 __ LDA P9 ; (vp + 1)
3823 : 69 00 __ ADC #$00
3825 : 85 10 __ STA P3 
3827 : ad fa bf LDA $bffa ; (sstack + 10)
382a : 85 11 __ STA P4 
382c : ad fb bf LDA $bffb ; (sstack + 11)
382f : 85 12 __ STA P5 
3831 : ad f6 bf LDA $bff6 ; (sstack + 6)
3834 : 85 13 __ STA P6 
3836 : ad f8 bf LDA $bff8 ; (sstack + 8)
3839 : 85 14 __ STA P7 
383b : 4c bf 32 JMP $32bf ; (vdcwin_init.s0 + 0)
--------------------------------------------------------------------
383e : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 3a 20 25 53 00    : sCREENMODE: %S.
--------------------------------------------------------------------
384d : __ __ __ BYT 73 45 4c 45 43 54 20 44 45 53 49 52 45 44 20 44 : sELECT DESIRED D
385d : __ __ __ BYT 45 4d 4f 20 55 53 49 4e 47 20 43 55 52 53 4f 52 : EMO USING CURSOR
386d : __ __ __ BYT 20 4b 45 59 53 20 41 4e 44 20 72 65 74 75 72 6e :  KEYS AND return
387d : __ __ __ BYT 20 49 4e 20 4d 45 4e 55 2e 00                   :  IN MENU..
--------------------------------------------------------------------
3887 : __ __ __ BYT 69 4e 20 53 43 52 4f 4c 4c 49 4e 47 20 44 45 4d : iN SCROLLING DEM
3897 : __ __ __ BYT 4f 53 2c 20 50 52 45 53 53 20 77 61 73 64 20 4f : OS, PRESS wasd O
38a7 : __ __ __ BYT 52 20 43 55 52 53 4f 52 20 4b 45 59 53 20 54 4f : R CURSOR KEYS TO
38b7 : __ __ __ BYT 20 4d 4f 56 45 2c 20 65 73 63 20 54 4f 20 45 58 :  MOVE, esc TO EX
38c7 : __ __ __ BYT 49 54 2e 00                                     : IT..
--------------------------------------------------------------------
38cb : __ __ __ BYT 20 25 53 20 00                                  :  %S .
--------------------------------------------------------------------
38d0 : __ __ __ BYT 25 43 25 53 20 00                               : %C%S .
--------------------------------------------------------------------
38d6 : __ __ __ BYT 73 45 4c 45 43 54 20 53 43 52 45 45 4e 20 4d 4f : sELECT SCREEN MO
38e6 : __ __ __ BYT 44 45 00                                        : DE.
--------------------------------------------------------------------
vdc_underline: ; vdc_underline(u8)->void
.s0:
38e9 : 09 00 __ ORA #$00
38eb : d0 08 __ BNE $38f5 ; (vdc_underline.s1 + 0)
.s2:
38ed : ad 66 60 LDA $6066 ; (vdc_state + 7)
38f0 : 29 df __ AND #$df
38f2 : 4c fa 38 JMP $38fa ; (vdc_underline.s3 + 0)
.s1:
38f5 : ad 66 60 LDA $6066 ; (vdc_state + 7)
38f8 : 09 20 __ ORA #$20
.s3:
38fa : 8d 66 60 STA $6066 ; (vdc_state + 7)
.s1001:
38fd : 60 __ __ RTS
--------------------------------------------------------------------
seed:
38fe : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
3900 : __ __ __ BYT 69 4e 20 4f 54 48 45 52 20 44 45 4d 4f 53 2c 20 : iN OTHER DEMOS, 
3910 : __ __ __ BYT 50 52 45 53 53 20 41 20 4b 45 54 59 20 54 4f 20 : PRESS A KETY TO 
3920 : __ __ __ BYT 43 4f 4e 54 49 4e 55 45 20 54 4f 20 4e 45 58 54 : CONTINUE TO NEXT
3930 : __ __ __ BYT 20 53 54 45 50 2e 00                            :  STEP..
--------------------------------------------------------------------
vdcwin_cpy_viewport: ; vdcwin_cpy_viewport(struct VDCViewport*)->void
.s0:
3937 : ad f0 bf LDA $bff0 ; (sstack + 0)
393a : 85 44 __ STA T0 + 0 
393c : ad f1 bf LDA $bff1 ; (sstack + 1)
393f : 85 45 __ STA T0 + 1 
3941 : a0 09 __ LDY #$09
3943 : b1 44 __ LDA (T0 + 0),y 
3945 : 85 1b __ STA ACCU + 0 
3947 : c8 __ __ INY
3948 : b1 44 __ LDA (T0 + 0),y 
394a : 85 1c __ STA ACCU + 1 
394c : a0 03 __ LDY #$03
394e : b1 44 __ LDA (T0 + 0),y 
3950 : 85 03 __ STA WORK + 0 
3952 : c8 __ __ INY
3953 : b1 44 __ LDA (T0 + 0),y 
3955 : 85 04 __ STA WORK + 1 
3957 : 20 d3 59 JSR $59d3 ; (mul16 + 0)
395a : a0 01 __ LDY #$01
395c : b1 44 __ LDA (T0 + 0),y 
395e : 18 __ __ CLC
395f : 65 05 __ ADC WORK + 2 
3961 : aa __ __ TAX
3962 : c8 __ __ INY
3963 : b1 44 __ LDA (T0 + 0),y 
3965 : 65 06 __ ADC WORK + 3 
3967 : 85 47 __ STA T1 + 1 
3969 : 8a __ __ TXA
396a : 18 __ __ CLC
396b : a0 07 __ LDY #$07
396d : 71 44 __ ADC (T0 + 0),y 
396f : 85 46 __ STA T1 + 0 
3971 : a5 47 __ LDA T1 + 1 
3973 : c8 __ __ INY
3974 : 71 44 __ ADC (T0 + 0),y 
3976 : 85 47 __ STA T1 + 1 
3978 : a9 00 __ LDA #$00
397a : 85 4a __ STA T3 + 0 
397c : a0 11 __ LDY #$11
397e : b1 44 __ LDA (T0 + 0),y 
3980 : aa __ __ TAX
3981 : c8 __ __ INY
3982 : b1 44 __ LDA (T0 + 0),y 
3984 : 4c c0 39 JMP $39c0 ; (vdcwin_cpy_viewport.l1 + 0)
.s2:
3987 : 86 11 __ STX P4 
3989 : a5 46 __ LDA T1 + 0 
398b : 85 14 __ STA P7 
398d : a5 47 __ LDA T1 + 1 
398f : 85 15 __ STA P8 
3991 : a0 00 __ LDY #$00
3993 : 84 17 __ STY P10 
3995 : b1 44 __ LDA (T0 + 0),y 
3997 : 85 13 __ STA P6 
3999 : a0 0d __ LDY #$0d
399b : b1 44 __ LDA (T0 + 0),y 
399d : 85 16 __ STA P9 
399f : 20 ee 13 JSR $13ee ; (bnk_cpytovdc.s0 + 0)
39a2 : a5 46 __ LDA T1 + 0 
39a4 : 18 __ __ CLC
39a5 : a0 03 __ LDY #$03
39a7 : 71 44 __ ADC (T0 + 0),y 
39a9 : 85 46 __ STA T1 + 0 
39ab : a5 47 __ LDA T1 + 1 
39ad : c8 __ __ INY
39ae : 71 44 __ ADC (T0 + 0),y 
39b0 : 85 47 __ STA T1 + 1 
39b2 : ad 62 60 LDA $6062 ; (vdc_state + 3)
39b5 : 18 __ __ CLC
39b6 : 65 11 __ ADC P4 
39b8 : aa __ __ TAX
39b9 : ad 63 60 LDA $6063 ; (vdc_state + 4)
39bc : 65 12 __ ADC P5 
39be : e6 4a __ INC T3 + 0 
.l1:
39c0 : 85 12 __ STA P5 
39c2 : a5 4a __ LDA T3 + 0 
39c4 : a0 0e __ LDY #$0e
39c6 : d1 44 __ CMP (T0 + 0),y 
39c8 : 90 bd __ BCC $3987 ; (vdcwin_cpy_viewport.s2 + 0)
.s4:
39ca : a0 03 __ LDY #$03
39cc : b1 44 __ LDA (T0 + 0),y 
39ce : 85 46 __ STA T1 + 0 
39d0 : 85 03 __ STA WORK + 0 
39d2 : c8 __ __ INY
39d3 : b1 44 __ LDA (T0 + 0),y 
39d5 : 85 47 __ STA T1 + 1 
39d7 : 85 04 __ STA WORK + 1 
39d9 : a0 09 __ LDY #$09
39db : b1 44 __ LDA (T0 + 0),y 
39dd : 85 1b __ STA ACCU + 0 
39df : c8 __ __ INY
39e0 : b1 44 __ LDA (T0 + 0),y 
39e2 : 85 1c __ STA ACCU + 1 
39e4 : 20 d3 59 JSR $59d3 ; (mul16 + 0)
39e7 : a0 01 __ LDY #$01
39e9 : b1 44 __ LDA (T0 + 0),y 
39eb : 18 __ __ CLC
39ec : 65 05 __ ADC WORK + 2 
39ee : aa __ __ TAX
39ef : c8 __ __ INY
39f0 : b1 44 __ LDA (T0 + 0),y 
39f2 : 65 06 __ ADC WORK + 3 
39f4 : 85 49 __ STA T2 + 1 
39f6 : 8a __ __ TXA
39f7 : 18 __ __ CLC
39f8 : a0 07 __ LDY #$07
39fa : 71 44 __ ADC (T0 + 0),y 
39fc : 85 48 __ STA T2 + 0 
39fe : a5 49 __ LDA T2 + 1 
3a00 : c8 __ __ INY
3a01 : 71 44 __ ADC (T0 + 0),y 
3a03 : 85 49 __ STA T2 + 1 
3a05 : a0 05 __ LDY #$05
3a07 : b1 44 __ LDA (T0 + 0),y 
3a09 : 85 1b __ STA ACCU + 0 
3a0b : c8 __ __ INY
3a0c : b1 44 __ LDA (T0 + 0),y 
3a0e : 85 1c __ STA ACCU + 1 
3a10 : a5 46 __ LDA T1 + 0 
3a12 : 85 03 __ STA WORK + 0 
3a14 : a5 47 __ LDA T1 + 1 
3a16 : 85 04 __ STA WORK + 1 
3a18 : 20 d3 59 JSR $59d3 ; (mul16 + 0)
3a1b : 18 __ __ CLC
3a1c : a5 48 __ LDA T2 + 0 
3a1e : 65 05 __ ADC WORK + 2 
3a20 : aa __ __ TAX
3a21 : a5 49 __ LDA T2 + 1 
3a23 : 65 06 __ ADC WORK + 3 
3a25 : a8 __ __ TAY
3a26 : 8a __ __ TXA
3a27 : 18 __ __ CLC
3a28 : 69 30 __ ADC #$30
3a2a : 85 46 __ STA T1 + 0 
3a2c : 90 01 __ BCC $3a2f ; (vdcwin_cpy_viewport.s1007 + 0)
.s1006:
3a2e : c8 __ __ INY
.s1007:
3a2f : 84 47 __ STY T1 + 1 
3a31 : a9 00 __ LDA #$00
3a33 : 85 4a __ STA T3 + 0 
3a35 : a0 13 __ LDY #$13
3a37 : b1 44 __ LDA (T0 + 0),y 
3a39 : aa __ __ TAX
3a3a : c8 __ __ INY
3a3b : b1 44 __ LDA (T0 + 0),y 
3a3d : 85 45 __ STA T0 + 1 
3a3f : ad f0 bf LDA $bff0 ; (sstack + 0)
3a42 : 85 48 __ STA T2 + 0 
3a44 : ad f1 bf LDA $bff1 ; (sstack + 1)
3a47 : 85 49 __ STA T2 + 1 
3a49 : 4c 8b 3a JMP $3a8b ; (vdcwin_cpy_viewport.l5 + 0)
.s6:
3a4c : 86 11 __ STX P4 
3a4e : a5 45 __ LDA T0 + 1 
3a50 : 85 12 __ STA P5 
3a52 : a5 46 __ LDA T1 + 0 
3a54 : 85 14 __ STA P7 
3a56 : a5 47 __ LDA T1 + 1 
3a58 : 85 15 __ STA P8 
3a5a : a0 00 __ LDY #$00
3a5c : 84 17 __ STY P10 
3a5e : b1 48 __ LDA (T2 + 0),y 
3a60 : 85 13 __ STA P6 
3a62 : a0 0d __ LDY #$0d
3a64 : b1 48 __ LDA (T2 + 0),y 
3a66 : 85 16 __ STA P9 
3a68 : 20 ee 13 JSR $13ee ; (bnk_cpytovdc.s0 + 0)
3a6b : a5 46 __ LDA T1 + 0 
3a6d : 18 __ __ CLC
3a6e : a0 03 __ LDY #$03
3a70 : 71 48 __ ADC (T2 + 0),y 
3a72 : 85 46 __ STA T1 + 0 
3a74 : a5 47 __ LDA T1 + 1 
3a76 : c8 __ __ INY
3a77 : 71 48 __ ADC (T2 + 0),y 
3a79 : 85 47 __ STA T1 + 1 
3a7b : ad 62 60 LDA $6062 ; (vdc_state + 3)
3a7e : 18 __ __ CLC
3a7f : 65 11 __ ADC P4 
3a81 : aa __ __ TAX
3a82 : ad 63 60 LDA $6063 ; (vdc_state + 4)
3a85 : 65 12 __ ADC P5 
3a87 : 85 45 __ STA T0 + 1 
3a89 : e6 4a __ INC T3 + 0 
.l5:
3a8b : a5 4a __ LDA T3 + 0 
3a8d : a0 0e __ LDY #$0e
3a8f : d1 48 __ CMP (T2 + 0),y 
3a91 : 90 b9 __ BCC $3a4c ; (vdcwin_cpy_viewport.s6 + 0)
.s1001:
3a93 : 60 __ __ RTS
--------------------------------------------------------------------
menu_main: ; menu_main()->u8
.s1000:
3a94 : a2 03 __ LDX #$03
3a96 : b5 53 __ LDA T0 + 0,x 
3a98 : 9d bf bf STA $bfbf,x ; (nouns + 62)
3a9b : ca __ __ DEX
3a9c : 10 f8 __ BPL $3a96 ; (menu_main.s1000 + 2)
.s0:
3a9e : ad a9 5b LDA $5ba9 ; (menubar + 60)
3aa1 : 8d f1 bf STA $bff1 ; (sstack + 1)
3aa4 : 20 42 37 JSR $3742 ; (menu_placebar.s0 + 0)
.l84:
3aa7 : a9 01 __ LDA #$01
3aa9 : 85 53 __ STA T0 + 0 
.l3:
3aab : a9 cf __ LDA #$cf
3aad : 8d f0 bf STA $bff0 ; (sstack + 0)
3ab0 : a6 53 __ LDX T0 + 0 
3ab2 : bd a2 5b LDA $5ba2,x ; (menubar + 53)
3ab5 : 85 15 __ STA P8 
3ab7 : ad a9 5b LDA $5ba9 ; (menubar + 60)
3aba : 85 16 __ STA P9 
3abc : bd 3a 5b LDA $5b3a,x ; (__multab9L + 0)
3abf : 18 __ __ CLC
3ac0 : 69 64 __ ADC #$64
3ac2 : 85 17 __ STA P10 
3ac4 : a9 5b __ LDA #$5b
3ac6 : 69 00 __ ADC #$00
3ac8 : 85 18 __ STA P11 
3aca : 20 72 2e JSR $2e72 ; (vdc_prints_attr.s0 + 0)
.l5:
3acd : 20 81 35 JSR $3581 ; (vdcwin_getch.s0 + 0)
3ad0 : a5 1b __ LDA ACCU + 0 
3ad2 : 85 54 __ STA T1 + 0 
3ad4 : c9 0d __ CMP #$0d
3ad6 : d0 06 __ BNE $3ade ; (menu_main.s1002 + 0)
.s1003:
3ad8 : a9 00 __ LDA #$00
3ada : 85 55 __ STA T3 + 0 
3adc : f0 16 __ BEQ $3af4 ; (menu_main.s6 + 0)
.s1002:
3ade : a9 01 __ LDA #$01
3ae0 : 85 55 __ STA T3 + 0 
3ae2 : a5 1b __ LDA ACCU + 0 
3ae4 : c9 9d __ CMP #$9d
3ae6 : f0 0c __ BEQ $3af4 ; (menu_main.s6 + 0)
.s9:
3ae8 : c9 1d __ CMP #$1d
3aea : f0 08 __ BEQ $3af4 ; (menu_main.s6 + 0)
.s8:
3aec : c9 1b __ CMP #$1b
3aee : f0 04 __ BEQ $3af4 ; (menu_main.s6 + 0)
.s7:
3af0 : c9 03 __ CMP #$03
3af2 : d0 d9 __ BNE $3acd ; (menu_main.l5 + 0)
.s6:
3af4 : a9 c4 __ LDA #$c4
3af6 : 8d f0 bf STA $bff0 ; (sstack + 0)
3af9 : a6 53 __ LDX T0 + 0 
3afb : bd a2 5b LDA $5ba2,x ; (menubar + 53)
3afe : 85 15 __ STA P8 
3b00 : ad a9 5b LDA $5ba9 ; (menubar + 60)
3b03 : 85 56 __ STA T4 + 0 
3b05 : 85 16 __ STA P9 
3b07 : bd 3a 5b LDA $5b3a,x ; (__multab9L + 0)
3b0a : 18 __ __ CLC
3b0b : 69 64 __ ADC #$64
3b0d : 85 17 __ STA P10 
3b0f : a9 5b __ LDA #$5b
3b11 : 69 00 __ ADC #$00
3b13 : 85 18 __ STA P11 
3b15 : 20 72 2e JSR $2e72 ; (vdc_prints_attr.s0 + 0)
3b18 : a5 54 __ LDA T1 + 0 
3b1a : c9 9d __ CMP #$9d
3b1c : d0 03 __ BNE $3b21 ; (menu_main.s12 + 0)
3b1e : 4c b4 3b JMP $3bb4 ; (menu_main.s11 + 0)
.s12:
3b21 : c9 1d __ CMP #$1d
3b23 : d0 0c __ BNE $3b31 ; (menu_main.s13 + 0)
.s17:
3b25 : e6 53 __ INC T0 + 0 
3b27 : a5 53 __ LDA T0 + 0 
3b29 : c9 07 __ CMP #$07
3b2b : 90 04 __ BCC $3b31 ; (menu_main.s13 + 0)
.s20:
3b2d : a9 01 __ LDA #$01
.s1039:
3b2f : 85 53 __ STA T0 + 0 
.s13:
3b31 : a5 55 __ LDA T3 + 0 
3b33 : f0 0d __ BEQ $3b42 ; (menu_main.s4 + 0)
.s24:
3b35 : a5 54 __ LDA T1 + 0 
3b37 : c9 1b __ CMP #$1b
3b39 : f0 11 __ BEQ $3b4c ; (menu_main.s26 + 0)
.s23:
3b3b : c9 03 __ CMP #$03
3b3d : f0 03 __ BEQ $3b42 ; (menu_main.s4 + 0)
3b3f : 4c ab 3a JMP $3aab ; (menu_main.l3 + 0)
.s4:
3b42 : a5 54 __ LDA T1 + 0 
3b44 : c9 1b __ CMP #$1b
3b46 : f0 04 __ BEQ $3b4c ; (menu_main.s26 + 0)
.s28:
3b48 : c9 03 __ CMP #$03
3b4a : d0 06 __ BNE $3b52 ; (menu_main.s25 + 0)
.s26:
3b4c : a9 63 __ LDA #$63
3b4e : 85 55 __ STA T3 + 0 
3b50 : d0 4a __ BNE $3b9c ; (menu_main.s2 + 0)
.s25:
3b52 : a9 01 __ LDA #$01
3b54 : 8d fc bf STA $bffc ; (sstack + 12)
3b57 : a6 53 __ LDX T0 + 0 
3b59 : ca __ __ DEX
3b5a : 8e fb bf STX $bffb ; (sstack + 11)
3b5d : bd a3 5b LDA $5ba3,x ; (menubar + 54)
3b60 : 8d f9 bf STA $bff9 ; (sstack + 9)
3b63 : a6 56 __ LDX T4 + 0 
3b65 : e8 __ __ INX
3b66 : 8e fa bf STX $bffa ; (sstack + 10)
3b69 : 20 c0 3b JSR $3bc0 ; (menu_pulldown.s1000 + 0)
3b6c : a5 1b __ LDA ACCU + 0 
3b6e : 85 55 __ STA T3 + 0 
3b70 : c9 12 __ CMP #$12
3b72 : d0 0e __ BNE $3b82 ; (menu_main.s31 + 0)
.s29:
3b74 : a9 00 __ LDA #$00
3b76 : 85 55 __ STA T3 + 0 
3b78 : c6 53 __ DEC T0 + 0 
3b7a : d0 06 __ BNE $3b82 ; (menu_main.s31 + 0)
.s32:
3b7c : a9 06 __ LDA #$06
3b7e : 85 53 __ STA T0 + 0 
3b80 : d0 13 __ BNE $3b95 ; (menu_main.s27 + 0)
.s31:
3b82 : c9 13 __ CMP #$13
3b84 : d0 0f __ BNE $3b95 ; (menu_main.s27 + 0)
.s35:
3b86 : e6 53 __ INC T0 + 0 
3b88 : a5 53 __ LDA T0 + 0 
3b8a : c9 07 __ CMP #$07
3b8c : 90 03 __ BCC $3b91 ; (menu_main.s63 + 0)
3b8e : 4c a7 3a JMP $3aa7 ; (menu_main.l84 + 0)
.s63:
3b91 : a9 00 __ LDA #$00
3b93 : 85 55 __ STA T3 + 0 
.s27:
3b95 : a5 55 __ LDA T3 + 0 
3b97 : d0 03 __ BNE $3b9c ; (menu_main.s2 + 0)
3b99 : 4c ab 3a JMP $3aab ; (menu_main.l3 + 0)
.s2:
3b9c : a5 53 __ LDA T0 + 0 
3b9e : 0a __ __ ASL
3b9f : 0a __ __ ASL
3ba0 : 18 __ __ CLC
3ba1 : 65 53 __ ADC T0 + 0 
3ba3 : 0a __ __ ASL
3ba4 : 18 __ __ CLC
3ba5 : 65 55 __ ADC T3 + 0 
3ba7 : 85 1b __ STA ACCU + 0 
.s1001:
3ba9 : a2 03 __ LDX #$03
3bab : bd bf bf LDA $bfbf,x ; (nouns + 62)
3bae : 95 53 __ STA T0 + 0,x 
3bb0 : ca __ __ DEX
3bb1 : 10 f8 __ BPL $3bab ; (menu_main.s1001 + 2)
3bb3 : 60 __ __ RTS
.s11:
3bb4 : c6 53 __ DEC T0 + 0 
3bb6 : f0 03 __ BEQ $3bbb ; (menu_main.s14 + 0)
3bb8 : 4c 31 3b JMP $3b31 ; (menu_main.s13 + 0)
.s14:
3bbb : a9 06 __ LDA #$06
3bbd : 4c 2f 3b JMP $3b2f ; (menu_main.s1039 + 0)
--------------------------------------------------------------------
menu_pulldown: ; menu_pulldown(u8,u8,u8,u8)->u8
.s1000:
3bc0 : a2 0b __ LDX #$0b
3bc2 : b5 53 __ LDA T0 + 0,x 
3bc4 : 9d c4 bf STA $bfc4,x ; (nouns + 67)
3bc7 : ca __ __ DEX
3bc8 : 10 f8 __ BPL $3bc2 ; (menu_pulldown.s1000 + 2)
3bca : 38 __ __ SEC
3bcb : a5 23 __ LDA SP + 0 ; (ypos + 0)
3bcd : e9 0a __ SBC #$0a
3bcf : 85 23 __ STA SP + 0 ; (ypos + 0)
3bd1 : b0 02 __ BCS $3bd5 ; (menu_pulldown.s0 + 0)
3bd3 : c6 24 __ DEC SP + 1 ; (menunumber + 0)
.s0:
3bd5 : a9 d8 __ LDA #$d8
3bd7 : ae fb bf LDX $bffb ; (sstack + 11)
3bda : 86 53 __ STX T0 + 0 
3bdc : 18 __ __ CLC
3bdd : 7d 41 5b ADC $5b41,x ; (__multab102L + 0)
3be0 : 85 55 __ STA T2 + 0 
3be2 : 85 0d __ STA P0 
3be4 : a9 5c __ LDA #$5c
3be6 : 7d 49 5b ADC $5b49,x ; (__multab102H + 0)
3be9 : 85 56 __ STA T2 + 1 
3beb : 85 0e __ STA P1 
3bed : 20 de 2e JSR $2ede ; (strlen.s0 + 0)
3bf0 : a6 53 __ LDX T0 + 0 
3bf2 : bd aa 5b LDA $5baa,x ; (pulldown_options + 0)
3bf5 : 85 58 __ STA T4 + 0 
3bf7 : 8d f8 bf STA $bff8 ; (sstack + 8)
3bfa : e0 06 __ CPX #$06
3bfc : 90 08 __ BCC $3c06 ; (menu_pulldown.s77 + 0)
.s76:
3bfe : a9 00 __ LDA #$00
3c00 : 85 54 __ STA T1 + 0 
3c02 : a9 f0 __ LDA #$f0
3c04 : b0 06 __ BCS $3c0c ; (menu_pulldown.s81 + 0)
.s77:
3c06 : a9 01 __ LDA #$01
3c08 : 85 54 __ STA T1 + 0 
3c0a : a9 70 __ LDA #$70
.s81:
3c0c : 8d f4 bf STA $bff4 ; (sstack + 4)
3c0f : ad f9 bf LDA $bff9 ; (sstack + 9)
3c12 : 85 53 __ STA T0 + 0 
3c14 : 8d f5 bf STA $bff5 ; (sstack + 5)
3c17 : ad fa bf LDA $bffa ; (sstack + 10)
3c1a : 85 59 __ STA T5 + 0 
3c1c : 8d f6 bf STA $bff6 ; (sstack + 6)
3c1f : 18 __ __ CLC
3c20 : a5 1b __ LDA ACCU + 0 
3c22 : 69 02 __ ADC #$02
3c24 : 8d f7 bf STA $bff7 ; (sstack + 7)
3c27 : 20 d7 30 JSR $30d7 ; (vdcwin_win_new.s1000 + 0)
3c2a : a9 01 __ LDA #$01
3c2c : 85 5a __ STA T6 + 0 
3c2e : a5 58 __ LDA T4 + 0 
3c30 : f0 61 __ BEQ $3c93 ; (menu_pulldown.l5 + 0)
.s58:
3c32 : a5 59 __ LDA T5 + 0 
3c34 : 85 57 __ STA T3 + 0 
3c36 : a9 00 __ LDA #$00
3c38 : 85 59 __ STA T5 + 0 
3c3a : 85 5b __ STA T8 + 0 
3c3c : 85 5c __ STA T8 + 1 
3c3e : 18 __ __ CLC
.l1050:
3c3f : a9 88 __ LDA #$88
3c41 : a0 02 __ LDY #$02
3c43 : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3c45 : a9 60 __ LDA #$60
3c47 : c8 __ __ INY
3c48 : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3c4a : a9 cb __ LDA #$cb
3c4c : c8 __ __ INY
3c4d : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3c4f : a9 38 __ LDA #$38
3c51 : c8 __ __ INY
3c52 : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3c54 : a5 55 __ LDA T2 + 0 
3c56 : 65 5b __ ADC T8 + 0 
3c58 : c8 __ __ INY
3c59 : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3c5b : a5 56 __ LDA T2 + 1 
3c5d : 65 5c __ ADC T8 + 1 
3c5f : c8 __ __ INY
3c60 : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3c62 : 20 56 2f JSR $2f56 ; (sprintf.s0 + 0)
3c65 : a5 53 __ LDA T0 + 0 
3c67 : 85 15 __ STA P8 
3c69 : a9 88 __ LDA #$88
3c6b : 85 17 __ STA P10 
3c6d : a9 60 __ LDA #$60
3c6f : 85 18 __ STA P11 
3c71 : a9 c6 __ LDA #$c6
3c73 : 8d f0 bf STA $bff0 ; (sstack + 0)
3c76 : 18 __ __ CLC
3c77 : a5 59 __ LDA T5 + 0 
3c79 : 65 57 __ ADC T3 + 0 
3c7b : 85 16 __ STA P9 
3c7d : 20 72 2e JSR $2e72 ; (vdc_prints_attr.s0 + 0)
3c80 : 18 __ __ CLC
3c81 : a5 5b __ LDA T8 + 0 
3c83 : 69 11 __ ADC #$11
3c85 : 85 5b __ STA T8 + 0 
3c87 : 90 02 __ BCC $3c8b ; (menu_pulldown.s1053 + 0)
.s1052:
3c89 : e6 5c __ INC T8 + 1 
.s1053:
3c8b : e6 59 __ INC T5 + 0 
3c8d : a5 59 __ LDA T5 + 0 
3c8f : c5 58 __ CMP T4 + 0 
3c91 : 90 ac __ BCC $3c3f ; (menu_pulldown.l1050 + 0)
.l5:
3c93 : a9 2d __ LDA #$2d
3c95 : a0 06 __ LDY #$06
3c97 : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3c99 : a9 00 __ LDA #$00
3c9b : 85 1c __ STA ACCU + 1 
3c9d : c8 __ __ INY
3c9e : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3ca0 : a9 88 __ LDA #$88
3ca2 : a0 02 __ LDY #$02
3ca4 : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3ca6 : a9 60 __ LDA #$60
3ca8 : c8 __ __ INY
3ca9 : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3cab : a9 d0 __ LDA #$d0
3cad : c8 __ __ INY
3cae : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3cb0 : a9 38 __ LDA #$38
3cb2 : c8 __ __ INY
3cb3 : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3cb5 : a5 5a __ LDA T6 + 0 
3cb7 : 85 1b __ STA ACCU + 0 
3cb9 : a9 11 __ LDA #$11
3cbb : 20 b3 59 JSR $59b3 ; (mul16by8 + 0)
3cbe : 38 __ __ SEC
3cbf : a5 05 __ LDA WORK + 2 
3cc1 : e9 11 __ SBC #$11
3cc3 : aa __ __ TAX
3cc4 : a5 06 __ LDA WORK + 3 
3cc6 : e9 00 __ SBC #$00
3cc8 : 85 5e __ STA T9 + 1 
3cca : 8a __ __ TXA
3ccb : 18 __ __ CLC
3ccc : 65 55 __ ADC T2 + 0 
3cce : a0 08 __ LDY #$08
3cd0 : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3cd2 : a5 5e __ LDA T9 + 1 
3cd4 : 65 56 __ ADC T2 + 1 
3cd6 : c8 __ __ INY
3cd7 : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3cd9 : 20 56 2f JSR $2f56 ; (sprintf.s0 + 0)
3cdc : a9 88 __ LDA #$88
3cde : 85 17 __ STA P10 
3ce0 : a9 60 __ LDA #$60
3ce2 : 85 18 __ STA P11 
3ce4 : a9 cd __ LDA #$cd
3ce6 : 8d f0 bf STA $bff0 ; (sstack + 0)
3ce9 : ad f9 bf LDA $bff9 ; (sstack + 9)
3cec : 85 15 __ STA P8 
3cee : ad fa bf LDA $bffa ; (sstack + 10)
3cf1 : 85 57 __ STA T3 + 0 
3cf3 : 18 __ __ CLC
3cf4 : 65 5a __ ADC T6 + 0 
3cf6 : 38 __ __ SEC
3cf7 : e9 01 __ SBC #$01
3cf9 : 85 16 __ STA P9 
3cfb : 20 72 2e JSR $2e72 ; (vdc_prints_attr.s0 + 0)
.l7:
3cfe : 20 81 35 JSR $3581 ; (vdcwin_getch.s0 + 0)
3d01 : a5 1b __ LDA ACCU + 0 
3d03 : 85 5b __ STA T8 + 0 
3d05 : c9 0d __ CMP #$0d
3d07 : f0 18 __ BEQ $3d21 ; (menu_pulldown.s8 + 0)
.s14:
3d09 : c9 9d __ CMP #$9d
3d0b : f0 14 __ BEQ $3d21 ; (menu_pulldown.s8 + 0)
.s13:
3d0d : c9 1d __ CMP #$1d
3d0f : f0 10 __ BEQ $3d21 ; (menu_pulldown.s8 + 0)
.s12:
3d11 : c9 91 __ CMP #$91
3d13 : f0 0c __ BEQ $3d21 ; (menu_pulldown.s8 + 0)
.s11:
3d15 : c9 11 __ CMP #$11
3d17 : f0 08 __ BEQ $3d21 ; (menu_pulldown.s8 + 0)
.s10:
3d19 : c9 1b __ CMP #$1b
3d1b : f0 04 __ BEQ $3d21 ; (menu_pulldown.s8 + 0)
.s9:
3d1d : c9 03 __ CMP #$03
3d1f : d0 dd __ BNE $3cfe ; (menu_pulldown.l7 + 0)
.s8:
3d21 : a5 1b __ LDA ACCU + 0 
3d23 : c9 1b __ CMP #$1b
3d25 : d0 03 __ BNE $3d2a ; (menu_pulldown.s42 + 0)
3d27 : 4c 08 3e JMP $3e08 ; (menu_pulldown.s16 + 0)
.s42:
3d2a : b0 03 __ BCS $3d2f ; (menu_pulldown.s43 + 0)
3d2c : 4c f8 3d JMP $3df8 ; (menu_pulldown.s44 + 0)
.s43:
3d2f : c9 91 __ CMP #$91
3d31 : f0 43 __ BEQ $3d76 ; (menu_pulldown.s29 + 0)
.s50:
3d33 : b0 2f __ BCS $3d64 ; (menu_pulldown.s51 + 0)
.s52:
3d35 : c9 1d __ CMP #$1d
3d37 : f0 03 __ BEQ $3d3c ; (menu_pulldown.s25 + 0)
3d39 : 4c 93 3c JMP $3c93 ; (menu_pulldown.l5 + 0)
.s25:
3d3c : a5 54 __ LDA T1 + 0 
3d3e : d0 03 __ BNE $3d43 ; (menu_pulldown.s26 + 0)
3d40 : 4c 93 3c JMP $3c93 ; (menu_pulldown.l5 + 0)
.s26:
3d43 : a9 13 __ LDA #$13
.s1049:
3d45 : 85 5a __ STA T6 + 0 
.s6:
3d47 : 20 8f 35 JSR $358f ; (vdcwin_win_free.s0 + 0)
3d4a : a5 5a __ LDA T6 + 0 
3d4c : 85 1b __ STA ACCU + 0 
.s1001:
3d4e : 18 __ __ CLC
3d4f : a5 23 __ LDA SP + 0 ; (ypos + 0)
3d51 : 69 0a __ ADC #$0a
3d53 : 85 23 __ STA SP + 0 ; (ypos + 0)
3d55 : 90 02 __ BCC $3d59 ; (menu_pulldown.s1001 + 11)
3d57 : e6 24 __ INC SP + 1 ; (menunumber + 0)
3d59 : a2 0b __ LDX #$0b
3d5b : bd c4 bf LDA $bfc4,x ; (nouns + 67)
3d5e : 95 53 __ STA T0 + 0,x 
3d60 : ca __ __ DEX
3d61 : 10 f8 __ BPL $3d5b ; (menu_pulldown.s1001 + 13)
3d63 : 60 __ __ RTS
.s51:
3d64 : c9 9d __ CMP #$9d
3d66 : f0 03 __ BEQ $3d6b ; (menu_pulldown.s21 + 0)
3d68 : 4c 93 3c JMP $3c93 ; (menu_pulldown.l5 + 0)
.s21:
3d6b : a5 54 __ LDA T1 + 0 
3d6d : d0 03 __ BNE $3d72 ; (menu_pulldown.s22 + 0)
3d6f : 4c 93 3c JMP $3c93 ; (menu_pulldown.l5 + 0)
.s22:
3d72 : a9 12 __ LDA #$12
3d74 : d0 cf __ BNE $3d45 ; (menu_pulldown.s1049 + 0)
.s29:
3d76 : a9 88 __ LDA #$88
3d78 : a0 02 __ LDY #$02
3d7a : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3d7c : a9 60 __ LDA #$60
3d7e : c8 __ __ INY
3d7f : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3d81 : a9 cb __ LDA #$cb
3d83 : c8 __ __ INY
3d84 : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3d86 : a9 38 __ LDA #$38
3d88 : c8 __ __ INY
3d89 : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3d8b : a5 5a __ LDA T6 + 0 
3d8d : 85 1b __ STA ACCU + 0 
3d8f : a9 00 __ LDA #$00
3d91 : 85 1c __ STA ACCU + 1 
3d93 : a9 11 __ LDA #$11
3d95 : 20 b3 59 JSR $59b3 ; (mul16by8 + 0)
3d98 : 38 __ __ SEC
3d99 : a5 05 __ LDA WORK + 2 
3d9b : e9 11 __ SBC #$11
3d9d : aa __ __ TAX
3d9e : a5 06 __ LDA WORK + 3 
3da0 : e9 00 __ SBC #$00
3da2 : 85 45 __ STA T11 + 1 
3da4 : 8a __ __ TXA
3da5 : 18 __ __ CLC
3da6 : 65 55 __ ADC T2 + 0 
3da8 : a0 06 __ LDY #$06
3daa : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3dac : a5 45 __ LDA T11 + 1 
3dae : 65 56 __ ADC T2 + 1 
3db0 : c8 __ __ INY
3db1 : 91 23 __ STA (SP + 0),y ; (ypos + 0)
3db3 : 20 56 2f JSR $2f56 ; (sprintf.s0 + 0)
3db6 : a9 88 __ LDA #$88
3db8 : 85 17 __ STA P10 
3dba : a9 60 __ LDA #$60
3dbc : 85 18 __ STA P11 
3dbe : a9 c6 __ LDA #$c6
3dc0 : 8d f0 bf STA $bff0 ; (sstack + 0)
3dc3 : ad f9 bf LDA $bff9 ; (sstack + 9)
3dc6 : 85 15 __ STA P8 
3dc8 : 18 __ __ CLC
3dc9 : a5 5a __ LDA T6 + 0 
3dcb : 65 57 __ ADC T3 + 0 
3dcd : 38 __ __ SEC
3dce : e9 01 __ SBC #$01
3dd0 : 85 16 __ STA P9 
3dd2 : 20 72 2e JSR $2e72 ; (vdc_prints_attr.s0 + 0)
3dd5 : a5 5b __ LDA T8 + 0 
3dd7 : c9 91 __ CMP #$91
3dd9 : d0 0e __ BNE $3de9 ; (menu_pulldown.s31 + 0)
.s30:
3ddb : c6 5a __ DEC T6 + 0 
3ddd : f0 03 __ BEQ $3de2 ; (menu_pulldown.s33 + 0)
3ddf : 4c 93 3c JMP $3c93 ; (menu_pulldown.l5 + 0)
.s33:
3de2 : a5 58 __ LDA T4 + 0 
.s1048:
3de4 : 85 5a __ STA T6 + 0 
3de6 : 4c 93 3c JMP $3c93 ; (menu_pulldown.l5 + 0)
.s31:
3de9 : e6 5a __ INC T6 + 0 
3deb : a5 58 __ LDA T4 + 0 
3ded : c5 5a __ CMP T6 + 0 
3def : 90 03 __ BCC $3df4 ; (menu_pulldown.s36 + 0)
3df1 : 4c 93 3c JMP $3c93 ; (menu_pulldown.l5 + 0)
.s36:
3df4 : a9 01 __ LDA #$01
3df6 : 90 ec __ BCC $3de4 ; (menu_pulldown.s1048 + 0)
.s44:
3df8 : c9 0d __ CMP #$0d
3dfa : d0 03 __ BNE $3dff ; (menu_pulldown.s45 + 0)
3dfc : 4c 47 3d JMP $3d47 ; (menu_pulldown.s6 + 0)
.s45:
3dff : b0 16 __ BCS $3e17 ; (menu_pulldown.s46 + 0)
.s47:
3e01 : c9 03 __ CMP #$03
3e03 : f0 03 __ BEQ $3e08 ; (menu_pulldown.s16 + 0)
3e05 : 4c 93 3c JMP $3c93 ; (menu_pulldown.l5 + 0)
.s16:
3e08 : ad fc bf LDA $bffc ; (sstack + 12)
3e0b : c9 01 __ CMP #$01
3e0d : f0 03 __ BEQ $3e12 ; (menu_pulldown.s17 + 0)
3e0f : 4c 93 3c JMP $3c93 ; (menu_pulldown.l5 + 0)
.s17:
3e12 : a9 00 __ LDA #$00
3e14 : 4c 45 3d JMP $3d45 ; (menu_pulldown.s1049 + 0)
.s46:
3e17 : c9 11 __ CMP #$11
3e19 : d0 03 __ BNE $3e1e ; (menu_pulldown.s46 + 7)
3e1b : 4c 76 3d JMP $3d76 ; (menu_pulldown.s29 + 0)
3e1e : 4c 93 3c JMP $3c93 ; (menu_pulldown.l5 + 0)
--------------------------------------------------------------------
settings_screenmode: ; settings_screenmode()->void
.s1000:
3e21 : a5 53 __ LDA T0 + 0 
3e23 : 8d c2 bf STA $bfc2 ; (nouns + 65)
3e26 : a5 54 __ LDA T2 + 0 
3e28 : 8d c3 bf STA $bfc3 ; (nouns + 66)
.s0:
3e2b : a9 f0 __ LDA #$f0
3e2d : 8d f4 bf STA $bff4 ; (sstack + 4)
3e30 : a9 08 __ LDA #$08
3e32 : 8d f5 bf STA $bff5 ; (sstack + 5)
3e35 : 8d f6 bf STA $bff6 ; (sstack + 6)
3e38 : a9 1e __ LDA #$1e
3e3a : 8d f7 bf STA $bff7 ; (sstack + 7)
3e3d : a9 0a __ LDA #$0a
3e3f : 8d f8 bf STA $bff8 ; (sstack + 8)
3e42 : ad 66 60 LDA $6066 ; (vdc_state + 7)
3e45 : 85 53 __ STA T0 + 0 
3e47 : a9 8d __ LDA #$8d
3e49 : 8d 66 60 STA $6066 ; (vdc_state + 7)
3e4c : 20 d7 30 JSR $30d7 ; (vdcwin_win_new.s1000 + 0)
3e4f : a9 0a __ LDA #$0a
3e51 : 8d f1 bf STA $bff1 ; (sstack + 1)
3e54 : a9 09 __ LDA #$09
3e56 : 8d f2 bf STA $bff2 ; (sstack + 2)
3e59 : a9 d6 __ LDA #$d6
3e5b : 8d f3 bf STA $bff3 ; (sstack + 3)
3e5e : a9 38 __ LDA #$38
3e60 : 8d f4 bf STA $bff4 ; (sstack + 4)
3e63 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
3e66 : a9 19 __ LDA #$19
3e68 : 8d f9 bf STA $bff9 ; (sstack + 9)
3e6b : a9 0b __ LDA #$0b
3e6d : 8d fa bf STA $bffa ; (sstack + 10)
3e70 : a9 07 __ LDA #$07
3e72 : 8d fb bf STA $bffb ; (sstack + 11)
3e75 : a9 01 __ LDA #$01
3e77 : 8d fc bf STA $bffc ; (sstack + 12)
3e7a : 20 c0 3b JSR $3bc0 ; (menu_pulldown.s1000 + 0)
3e7d : a5 1b __ LDA ACCU + 0 
3e7f : 85 54 __ STA T2 + 0 
3e81 : 20 8f 35 JSR $358f ; (vdcwin_win_free.s0 + 0)
3e84 : a4 54 __ LDY T2 + 0 
3e86 : f0 07 __ BEQ $3e8f ; (settings_screenmode.s3 + 0)
.s1:
3e88 : 88 __ __ DEY
3e89 : 8c f6 bf STY $bff6 ; (sstack + 6)
3e8c : 20 2d 2c JSR $2c2d ; (vdc_set_mode.s0 + 0)
.s3:
3e8f : a5 53 __ LDA T0 + 0 
3e91 : 8d 66 60 STA $6066 ; (vdc_state + 7)
.s1001:
3e94 : ad c2 bf LDA $bfc2 ; (nouns + 65)
3e97 : 85 53 __ STA T0 + 0 
3e99 : ad c3 bf LDA $bfc3 ; (nouns + 66)
3e9c : 85 54 __ STA T2 + 0 
3e9e : 60 __ __ RTS
--------------------------------------------------------------------
settings_versioninfo: ; settings_versioninfo()->void
.s1000:
3e9f : a5 53 __ LDA T0 + 0 
3ea1 : 8d d1 bf STA $bfd1 ; (wrapbuffer + 59)
3ea4 : 38 __ __ SEC
3ea5 : a5 23 __ LDA SP + 0 
3ea7 : e9 08 __ SBC #$08
3ea9 : 85 23 __ STA SP + 0 
3eab : b0 02 __ BCS $3eaf ; (settings_versioninfo.s0 + 0)
3ead : c6 24 __ DEC SP + 1 
.s0:
3eaf : a9 f0 __ LDA #$f0
3eb1 : 8d f4 bf STA $bff4 ; (sstack + 4)
3eb4 : a9 05 __ LDA #$05
3eb6 : 8d f5 bf STA $bff5 ; (sstack + 5)
3eb9 : 8d f6 bf STA $bff6 ; (sstack + 6)
3ebc : a9 3c __ LDA #$3c
3ebe : 8d f7 bf STA $bff7 ; (sstack + 7)
3ec1 : a9 0f __ LDA #$0f
3ec3 : 8d f8 bf STA $bff8 ; (sstack + 8)
3ec6 : ad 66 60 LDA $6066 ; (vdc_state + 7)
3ec9 : 85 53 __ STA T0 + 0 
3ecb : a9 8d __ LDA #$8d
3ecd : 8d 66 60 STA $6066 ; (vdc_state + 7)
3ed0 : 20 d7 30 JSR $30d7 ; (vdcwin_win_new.s1000 + 0)
3ed3 : a9 01 __ LDA #$01
3ed5 : 20 e9 38 JSR $38e9 ; (vdc_underline.s0 + 0)
3ed8 : a9 06 __ LDA #$06
3eda : 8d f1 bf STA $bff1 ; (sstack + 1)
3edd : 8d f2 bf STA $bff2 ; (sstack + 2)
3ee0 : a9 00 __ LDA #$00
3ee2 : 8d f3 bf STA $bff3 ; (sstack + 3)
3ee5 : a9 40 __ LDA #$40
3ee7 : 8d f4 bf STA $bff4 ; (sstack + 4)
3eea : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
3eed : a9 00 __ LDA #$00
3eef : 20 e9 38 JSR $38e9 ; (vdc_underline.s0 + 0)
3ef2 : a9 06 __ LDA #$06
3ef4 : 8d f1 bf STA $bff1 ; (sstack + 1)
3ef7 : a9 08 __ LDA #$08
3ef9 : 8d f2 bf STA $bff2 ; (sstack + 2)
3efc : a9 e8 __ LDA #$e8
3efe : 8d f3 bf STA $bff3 ; (sstack + 3)
3f01 : a9 3f __ LDA #$3f
3f03 : 8d f4 bf STA $bff4 ; (sstack + 4)
3f06 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
3f09 : a9 06 __ LDA #$06
3f0b : 8d f1 bf STA $bff1 ; (sstack + 1)
3f0e : a9 09 __ LDA #$09
3f10 : 8d f2 bf STA $bff2 ; (sstack + 2)
3f13 : a9 20 __ LDA #$20
3f15 : 8d f3 bf STA $bff3 ; (sstack + 3)
3f18 : a9 40 __ LDA #$40
3f1a : 8d f4 bf STA $bff4 ; (sstack + 4)
3f1d : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
3f20 : a9 88 __ LDA #$88
3f22 : a0 02 __ LDY #$02
3f24 : 91 23 __ STA (SP + 0),y 
3f26 : a9 60 __ LDA #$60
3f28 : c8 __ __ INY
3f29 : 91 23 __ STA (SP + 0),y 
3f2b : a9 3e __ LDA #$3e
3f2d : c8 __ __ INY
3f2e : 91 23 __ STA (SP + 0),y 
3f30 : a9 40 __ LDA #$40
3f32 : c8 __ __ INY
3f33 : 91 23 __ STA (SP + 0),y 
3f35 : a9 4a __ LDA #$4a
3f37 : c8 __ __ INY
3f38 : 91 23 __ STA (SP + 0),y 
3f3a : a9 40 __ LDA #$40
3f3c : c8 __ __ INY
3f3d : 91 23 __ STA (SP + 0),y 
3f3f : 20 56 2f JSR $2f56 ; (sprintf.s0 + 0)
3f42 : a9 06 __ LDA #$06
3f44 : 8d f1 bf STA $bff1 ; (sstack + 1)
3f47 : a9 0a __ LDA #$0a
3f49 : 8d f2 bf STA $bff2 ; (sstack + 2)
3f4c : a9 88 __ LDA #$88
3f4e : 8d f3 bf STA $bff3 ; (sstack + 3)
3f51 : a9 60 __ LDA #$60
3f53 : 8d f4 bf STA $bff4 ; (sstack + 4)
3f56 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
3f59 : a9 06 __ LDA #$06
3f5b : 8d f1 bf STA $bff1 ; (sstack + 1)
3f5e : a9 0c __ LDA #$0c
3f60 : 8d f2 bf STA $bff2 ; (sstack + 2)
3f63 : a9 5c __ LDA #$5c
3f65 : 8d f3 bf STA $bff3 ; (sstack + 3)
3f68 : a9 40 __ LDA #$40
3f6a : 8d f4 bf STA $bff4 ; (sstack + 4)
3f6d : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
3f70 : a9 06 __ LDA #$06
3f72 : 8d f1 bf STA $bff1 ; (sstack + 1)
3f75 : a9 0d __ LDA #$0d
3f77 : 8d f2 bf STA $bff2 ; (sstack + 2)
3f7a : a9 73 __ LDA #$73
3f7c : 8d f3 bf STA $bff3 ; (sstack + 3)
3f7f : a9 40 __ LDA #$40
3f81 : 8d f4 bf STA $bff4 ; (sstack + 4)
3f84 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
3f87 : a9 06 __ LDA #$06
3f89 : 8d f1 bf STA $bff1 ; (sstack + 1)
3f8c : a9 0e __ LDA #$0e
3f8e : 8d f2 bf STA $bff2 ; (sstack + 2)
3f91 : a9 a3 __ LDA #$a3
3f93 : 8d f3 bf STA $bff3 ; (sstack + 3)
3f96 : a9 40 __ LDA #$40
3f98 : 8d f4 bf STA $bff4 ; (sstack + 4)
3f9b : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
3f9e : a9 06 __ LDA #$06
3fa0 : 8d f1 bf STA $bff1 ; (sstack + 1)
3fa3 : a9 10 __ LDA #$10
3fa5 : 8d f2 bf STA $bff2 ; (sstack + 2)
3fa8 : a9 ca __ LDA #$ca
3faa : 8d f3 bf STA $bff3 ; (sstack + 3)
3fad : a9 40 __ LDA #$40
3faf : 8d f4 bf STA $bff4 ; (sstack + 4)
3fb2 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
3fb5 : a9 06 __ LDA #$06
3fb7 : 8d f1 bf STA $bff1 ; (sstack + 1)
3fba : a9 12 __ LDA #$12
3fbc : 8d f2 bf STA $bff2 ; (sstack + 2)
3fbf : a9 e7 __ LDA #$e7
3fc1 : 8d f3 bf STA $bff3 ; (sstack + 3)
3fc4 : a9 40 __ LDA #$40
3fc6 : 8d f4 bf STA $bff4 ; (sstack + 4)
3fc9 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
3fcc : 20 f0 29 JSR $29f0 ; (getch.s0 + 0)
3fcf : 20 8f 35 JSR $358f ; (vdcwin_win_free.s0 + 0)
3fd2 : a5 53 __ LDA T0 + 0 
3fd4 : 8d 66 60 STA $6066 ; (vdc_state + 7)
.s1001:
3fd7 : 18 __ __ CLC
3fd8 : a5 23 __ LDA SP + 0 
3fda : 69 08 __ ADC #$08
3fdc : 85 23 __ STA SP + 0 
3fde : 90 02 __ BCC $3fe2 ; (settings_versioninfo.s1001 + 11)
3fe0 : e6 24 __ INC SP + 1 
3fe2 : ad d1 bf LDA $bfd1 ; (wrapbuffer + 59)
3fe5 : 85 53 __ STA T0 + 0 
3fe7 : 60 __ __ RTS
--------------------------------------------------------------------
3fe8 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 64 45 4d 4f : oSCAR64 vdc dEMO
3ff8 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
3ff9 : __ __ __ BYT 43 48 41 52 53 31 00                            : CHARS1.
--------------------------------------------------------------------
4000 : __ __ __ BYT 76 45 52 53 49 4f 4e 20 49 4e 46 4f 52 4d 41 54 : vERSION INFORMAT
4010 : __ __ __ BYT 49 4f 4e 20 41 4e 44 20 43 52 45 44 49 54 53 00 : ION AND CREDITS.
--------------------------------------------------------------------
4020 : __ __ __ BYT 77 52 49 54 54 45 4e 20 49 4e 20 32 30 32 34 20 : wRITTEN IN 2024 
4030 : __ __ __ BYT 42 59 20 78 41 4e 44 45 52 20 6d 4f 4c 00       : BY xANDER mOL.
--------------------------------------------------------------------
403e : __ __ __ BYT 76 45 52 53 49 4f 4e 3a 20 25 53 00             : vERSION: %S.
--------------------------------------------------------------------
404a : __ __ __ BYT 56 30 31 2d 32 30 32 34 30 32 31 34 2d 31 34 31 : V01-20240214-141
405a : __ __ __ BYT 38 00                                           : 8.
--------------------------------------------------------------------
405c : __ __ __ BYT 6d 55 53 49 43 20 42 59 20 6e 4f 52 44 49 53 43 : mUSIC BY nORDISC
406c : __ __ __ BYT 48 53 4f 55 4e 44 00                            : HSOUND.
--------------------------------------------------------------------
4073 : __ __ __ BYT 66 55 4c 4c 20 53 4f 55 52 43 45 20 43 4f 44 45 : fULL SOURCE CODE
4083 : __ __ __ BYT 2c 20 44 4f 43 55 4d 45 4e 54 41 54 49 4f 4e 20 : , DOCUMENTATION 
4093 : __ __ __ BYT 41 4e 44 20 43 52 45 44 49 54 53 20 41 54 3a 00 : AND CREDITS AT:.
--------------------------------------------------------------------
40a3 : __ __ __ BYT 48 54 54 50 53 3a 2f 2f 47 49 54 48 55 42 2e 43 : HTTPS://GITHUB.C
40b3 : __ __ __ BYT 4f 4d 2f 58 41 48 4d 4f 4c 2f 6f 53 43 41 52 36 : OM/XAHMOL/oSCAR6
40c3 : __ __ __ BYT 34 74 45 53 54 2f 00                            : 4tEST/.
--------------------------------------------------------------------
40ca : __ __ __ BYT 28 63 29 20 32 30 32 34 2c 20 69 64 52 45 41 4d : (c) 2024, idREAM
40da : __ __ __ BYT 54 69 4e 38 62 49 54 53 2e 43 4f 4d 00          : TiN8bITS.COM.
--------------------------------------------------------------------
40e7 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 54 4f 20 43 : pRESS A KEY TO C
40f7 : __ __ __ BYT 4f 4e 54 49 4e 55 45 2e 00                      : ONTINUE..
--------------------------------------------------------------------
windows_windowstacking: ; windows_windowstacking()->void
.s1000:
4100 : a5 53 __ LDA T0 + 0 
4102 : 8d 3d bf STA $bf3d ; (windows_windowstacking@stack + 0)
4105 : a5 54 __ LDA T4 + 0 
4107 : 8d 3e bf STA $bf3e ; (windows_windowstacking@stack + 1)
.s0:
410a : ad 08 dc LDA $dc08 
410d : 18 __ __ CLC
410e : 6d 09 dc ADC $dc09 
4111 : a8 __ __ TAY
4112 : a9 00 __ LDA #$00
4114 : 85 53 __ STA T0 + 0 
4116 : 2a __ __ ROL
4117 : aa __ __ TAX
4118 : 98 __ __ TYA
4119 : 69 01 __ ADC #$01
411b : 8d fe 38 STA $38fe ; (seed + 0)
411e : 90 01 __ BCC $4121 ; (windows_windowstacking.s1007 + 0)
.s1006:
4120 : e8 __ __ INX
.s1007:
4121 : 8e ff 38 STX $38ff ; (seed + 1)
.l1:
4124 : a9 28 __ LDA #$28
4126 : 8d f7 bf STA $bff7 ; (sstack + 7)
4129 : a5 53 __ LDA T0 + 0 
412b : 29 01 __ AND #$01
412d : 09 f0 __ ORA #$f0
412f : 8d f4 bf STA $bff4 ; (sstack + 4)
4132 : a5 53 __ LDA T0 + 0 
4134 : 0a __ __ ASL
4135 : 0a __ __ ASL
4136 : 18 __ __ CLC
4137 : 65 53 __ ADC T0 + 0 
4139 : 18 __ __ CLC
413a : 69 05 __ ADC #$05
413c : 8d f5 bf STA $bff5 ; (sstack + 5)
413f : a5 53 __ LDA T0 + 0 
4141 : 0a __ __ ASL
4142 : 18 __ __ CLC
4143 : 65 53 __ ADC T0 + 0 
4145 : 18 __ __ CLC
4146 : 69 05 __ ADC #$05
4148 : 8d f6 bf STA $bff6 ; (sstack + 6)
414b : ad 64 60 LDA $6064 ; (vdc_state + 5)
414e : 85 1b __ STA ACCU + 0 
4150 : ad 65 60 LDA $6065 ; (vdc_state + 6)
4153 : 85 1c __ STA ACCU + 1 
4155 : a9 03 __ LDA #$03
4157 : 85 03 __ STA WORK + 0 
4159 : a9 00 __ LDA #$00
415b : 85 04 __ STA WORK + 1 
415d : 20 15 5a JSR $5a15 ; (divmod + 0)
4160 : a5 1b __ LDA ACCU + 0 
4162 : 8d f8 bf STA $bff8 ; (sstack + 8)
4165 : 20 d7 30 JSR $30d7 ; (vdcwin_win_new.s1000 + 0)
4168 : a9 64 __ LDA #$64
416a : 85 54 __ STA T4 + 0 
.l4:
416c : 20 9f 42 JSR $429f ; (rand.s0 + 0)
416f : a9 0f __ LDA #$0f
4171 : 85 03 __ STA WORK + 0 
4173 : a9 00 __ LDA #$00
4175 : 85 04 __ STA WORK + 1 
4177 : 20 15 5a JSR $5a15 ; (divmod + 0)
417a : 18 __ __ CLC
417b : a5 05 __ LDA WORK + 2 
417d : 69 01 __ ADC #$01
417f : 20 91 42 JSR $4291 ; (vdc_textcolor.s1000 + 0)
4182 : a9 88 __ LDA #$88
4184 : 8d f5 bf STA $bff5 ; (sstack + 5)
4187 : a9 60 __ LDA #$60
4189 : 8d f6 bf STA $bff6 ; (sstack + 6)
418c : 20 c6 42 JSR $42c6 ; (generateSentence.s1000 + 0)
418f : a9 88 __ LDA #$88
4191 : 8d fe bf STA $bffe ; (sstack + 14)
4194 : a9 60 __ LDA #$60
4196 : 8d ff bf STA $bfff ; (sstack + 15)
4199 : ad 5c 60 LDA $605c ; (winCfg + 5)
419c : 85 1b __ STA ACCU + 0 
419e : a9 00 __ LDA #$00
41a0 : 85 1c __ STA ACCU + 1 
41a2 : a9 0d __ LDA #$0d
41a4 : 20 b3 59 JSR $59b3 ; (mul16by8 + 0)
41a7 : 18 __ __ CLC
41a8 : a9 cf __ LDA #$cf
41aa : 65 05 __ ADC WORK + 2 
41ac : 8d fc bf STA $bffc ; (sstack + 12)
41af : a9 60 __ LDA #$60
41b1 : 69 00 __ ADC #$00
41b3 : 8d fd bf STA $bffd ; (sstack + 13)
41b6 : 20 e9 43 JSR $43e9 ; (vdcwin_printwrap.s1000 + 0)
41b9 : ac 5c 60 LDY $605c ; (winCfg + 5)
41bc : be 36 5b LDX $5b36,y ; (__multab13L + 0)
41bf : bd d3 60 LDA $60d3,x ; (linebuffer + 75)
41c2 : f0 19 __ BEQ $41dd ; (windows_windowstacking.s51 + 0)
.s7:
41c4 : 86 43 __ STX T2 + 0 
41c6 : a9 20 __ LDA #$20
41c8 : 8d f9 bf STA $bff9 ; (sstack + 9)
41cb : 18 __ __ CLC
41cc : a9 cf __ LDA #$cf
41ce : 65 43 __ ADC T2 + 0 
41d0 : 8d f7 bf STA $bff7 ; (sstack + 7)
41d3 : a9 60 __ LDA #$60
41d5 : 69 00 __ ADC #$00
41d7 : 8d f8 bf STA $bff8 ; (sstack + 8)
41da : 20 54 49 JSR $4954 ; (vdcwin_put_char.s1000 + 0)
.s51:
41dd : c6 54 __ DEC T4 + 0 
41df : d0 8b __ BNE $416c ; (windows_windowstacking.l4 + 0)
.s6:
41e1 : 20 f0 29 JSR $29f0 ; (getch.s0 + 0)
41e4 : a9 0d __ LDA #$0d
41e6 : 20 91 42 JSR $4291 ; (vdc_textcolor.s1000 + 0)
41e9 : e6 53 __ INC T0 + 0 
41eb : ad 5c 60 LDA $605c ; (winCfg + 5)
41ee : c9 03 __ CMP #$03
41f0 : b0 03 __ BCS $41f5 ; (windows_windowstacking.l10 + 0)
41f2 : 4c 24 41 JMP $4124 ; (windows_windowstacking.l1 + 0)
.l10:
41f5 : 20 8f 35 JSR $358f ; (vdcwin_win_free.s0 + 0)
41f8 : a9 64 __ LDA #$64
41fa : 85 53 __ STA T0 + 0 
.l13:
41fc : 20 9f 42 JSR $429f ; (rand.s0 + 0)
41ff : a9 0f __ LDA #$0f
4201 : 85 03 __ STA WORK + 0 
4203 : a9 00 __ LDA #$00
4205 : 85 04 __ STA WORK + 1 
4207 : 20 15 5a JSR $5a15 ; (divmod + 0)
420a : 18 __ __ CLC
420b : a5 05 __ LDA WORK + 2 
420d : 69 01 __ ADC #$01
420f : 20 91 42 JSR $4291 ; (vdc_textcolor.s1000 + 0)
4212 : a9 88 __ LDA #$88
4214 : 8d f5 bf STA $bff5 ; (sstack + 5)
4217 : a9 60 __ LDA #$60
4219 : 8d f6 bf STA $bff6 ; (sstack + 6)
421c : 20 c6 42 JSR $42c6 ; (generateSentence.s1000 + 0)
421f : a9 88 __ LDA #$88
4221 : 8d fe bf STA $bffe ; (sstack + 14)
4224 : a9 60 __ LDA #$60
4226 : 8d ff bf STA $bfff ; (sstack + 15)
4229 : ad 5c 60 LDA $605c ; (winCfg + 5)
422c : 85 1b __ STA ACCU + 0 
422e : a9 00 __ LDA #$00
4230 : 85 1c __ STA ACCU + 1 
4232 : a9 0d __ LDA #$0d
4234 : 20 b3 59 JSR $59b3 ; (mul16by8 + 0)
4237 : 18 __ __ CLC
4238 : a9 cf __ LDA #$cf
423a : 65 05 __ ADC WORK + 2 
423c : 8d fc bf STA $bffc ; (sstack + 12)
423f : a9 60 __ LDA #$60
4241 : 69 00 __ ADC #$00
4243 : 8d fd bf STA $bffd ; (sstack + 13)
4246 : 20 e9 43 JSR $43e9 ; (vdcwin_printwrap.s1000 + 0)
4249 : ac 5c 60 LDY $605c ; (winCfg + 5)
424c : be 36 5b LDX $5b36,y ; (__multab13L + 0)
424f : bd d3 60 LDA $60d3,x ; (linebuffer + 75)
4252 : f0 19 __ BEQ $426d ; (windows_windowstacking.s52 + 0)
.s16:
4254 : 86 43 __ STX T2 + 0 
4256 : a9 20 __ LDA #$20
4258 : 8d f9 bf STA $bff9 ; (sstack + 9)
425b : 18 __ __ CLC
425c : a9 cf __ LDA #$cf
425e : 65 43 __ ADC T2 + 0 
4260 : 8d f7 bf STA $bff7 ; (sstack + 7)
4263 : a9 60 __ LDA #$60
4265 : 69 00 __ ADC #$00
4267 : 8d f8 bf STA $bff8 ; (sstack + 8)
426a : 20 54 49 JSR $4954 ; (vdcwin_put_char.s1000 + 0)
.s52:
426d : c6 53 __ DEC T0 + 0 
426f : d0 8b __ BNE $41fc ; (windows_windowstacking.l13 + 0)
.s15:
4271 : 20 f0 29 JSR $29f0 ; (getch.s0 + 0)
4274 : a9 0d __ LDA #$0d
4276 : 20 91 42 JSR $4291 ; (vdc_textcolor.s1000 + 0)
4279 : a9 01 __ LDA #$01
427b : cd 5c 60 CMP $605c ; (winCfg + 5)
427e : b0 03 __ BCS $4283 ; (windows_windowstacking.s11 + 0)
4280 : 4c f5 41 JMP $41f5 ; (windows_windowstacking.l10 + 0)
.s11:
4283 : 20 8f 35 JSR $358f ; (vdcwin_win_free.s0 + 0)
.s1001:
4286 : ad 3d bf LDA $bf3d ; (windows_windowstacking@stack + 0)
4289 : 85 53 __ STA T0 + 0 
428b : ad 3e bf LDA $bf3e ; (windows_windowstacking@stack + 1)
428e : 85 54 __ STA T4 + 0 
4290 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_textcolor: ; vdc_textcolor(u8)->void
.s1000:
4291 : 85 0d __ STA P0 ; (color + 0)
.s0:
4293 : ad 66 60 LDA $6066 ; (vdc_state + 7)
4296 : 29 f0 __ AND #$f0
4298 : 18 __ __ CLC
4299 : 65 0d __ ADC P0 ; (color + 0)
429b : 8d 66 60 STA $6066 ; (vdc_state + 7)
.s1001:
429e : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
.s0:
429f : ad ff 38 LDA $38ff ; (seed + 1)
42a2 : 4a __ __ LSR
42a3 : ad fe 38 LDA $38fe ; (seed + 0)
42a6 : 6a __ __ ROR
42a7 : aa __ __ TAX
42a8 : a9 00 __ LDA #$00
42aa : 6a __ __ ROR
42ab : 4d fe 38 EOR $38fe ; (seed + 0)
42ae : 85 1b __ STA ACCU + 0 
42b0 : 8a __ __ TXA
42b1 : 4d ff 38 EOR $38ff ; (seed + 1)
42b4 : 85 1c __ STA ACCU + 1 
42b6 : 4a __ __ LSR
42b7 : 45 1b __ EOR ACCU + 0 
42b9 : 8d fe 38 STA $38fe ; (seed + 0)
42bc : 85 1b __ STA ACCU + 0 
42be : 45 1c __ EOR ACCU + 1 
42c0 : 8d ff 38 STA $38ff ; (seed + 1)
42c3 : 85 1c __ STA ACCU + 1 
.s1001:
42c5 : 60 __ __ RTS
--------------------------------------------------------------------
generateSentence: ; generateSentence(u8*)->void
.s1000:
42c6 : a2 03 __ LDX #$03
42c8 : b5 53 __ LDA T1 + 0,x 
42ca : 9d 41 bf STA $bf41,x ; (generateSentence@stack + 0)
42cd : ca __ __ DEX
42ce : 10 f8 __ BPL $42c8 ; (generateSentence.s1000 + 2)
42d0 : 38 __ __ SEC
42d1 : a5 23 __ LDA SP + 0 
42d3 : e9 0e __ SBC #$0e
42d5 : 85 23 __ STA SP + 0 
42d7 : b0 02 __ BCS $42db ; (generateSentence.s0 + 0)
42d9 : c6 24 __ DEC SP + 1 
.s0:
42db : a2 08 __ LDX #$08
.l1002:
42dd : bd b1 5b LDA $5bb1,x ; (pulldown_options + 7)
42e0 : 9d cb bf STA $bfcb,x ; (nouns + 74)
42e3 : ca __ __ DEX
42e4 : d0 f7 __ BNE $42dd ; (generateSentence.l1002 + 0)
.s1003:
42e6 : a2 4b __ LDX #$4b
.l1004:
42e8 : bd 07 60 LDA $6007,x ; (pulldown_titles + 815)
42eb : 9d 80 bf STA $bf80,x ; (verbs + 29)
42ee : ca __ __ DEX
42ef : d0 f7 __ BNE $42e8 ; (generateSentence.l1004 + 0)
.s1005:
42f1 : a2 1e __ LDX #$1e
.l1006:
42f3 : bd b9 5b LDA $5bb9,x 
42f6 : 9d 62 bf STA $bf62,x ; (adjectives + 29)
42f9 : ca __ __ DEX
42fa : d0 f7 __ BNE $42f3 ; (generateSentence.l1006 + 0)
.s1007:
42fc : a2 1e __ LDX #$1e
.l1008:
42fe : bd d7 5b LDA $5bd7,x 
4301 : 9d 44 bf STA $bf44,x ; (generateSentence@stack + 3)
4304 : ca __ __ DEX
4305 : d0 f7 __ BNE $42fe ; (generateSentence.l1008 + 0)
.s1009:
4307 : 20 9f 42 JSR $429f ; (rand.s0 + 0)
430a : a5 1b __ LDA ACCU + 0 
430c : 85 50 __ STA T0 + 0 
430e : 20 9f 42 JSR $429f ; (rand.s0 + 0)
4311 : a5 1b __ LDA ACCU + 0 
4313 : 85 53 __ STA T1 + 0 
4315 : a5 1c __ LDA ACCU + 1 
4317 : 85 54 __ STA T1 + 1 
4319 : 20 9f 42 JSR $429f ; (rand.s0 + 0)
431c : a5 1b __ LDA ACCU + 0 
431e : 85 55 __ STA T2 + 0 
4320 : a5 1c __ LDA ACCU + 1 
4322 : 85 56 __ STA T2 + 1 
4324 : 20 9f 42 JSR $429f ; (rand.s0 + 0)
4327 : ad f5 bf LDA $bff5 ; (sstack + 5)
432a : 85 45 __ STA T4 + 0 
432c : ad f6 bf LDA $bff6 ; (sstack + 6)
432f : 85 46 __ STA T4 + 1 
4331 : a9 00 __ LDA #$00
4333 : 85 04 __ STA WORK + 1 
4335 : a8 __ __ TAY
4336 : 91 45 __ STA (T4 + 0),y 
4338 : a5 45 __ LDA T4 + 0 
433a : a0 02 __ LDY #$02
433c : 91 23 __ STA (SP + 0),y 
433e : a5 46 __ LDA T4 + 1 
4340 : c8 __ __ INY
4341 : 91 23 __ STA (SP + 0),y 
4343 : a9 dc __ LDA #$dc
4345 : c8 __ __ INY
4346 : 91 23 __ STA (SP + 0),y 
4348 : a9 43 __ LDA #$43
434a : c8 __ __ INY
434b : 84 03 __ STY WORK + 0 
434d : 91 23 __ STA (SP + 0),y 
434f : a5 50 __ LDA T0 + 0 
4351 : 29 01 __ AND #$01
4353 : 0a __ __ ASL
4354 : 0a __ __ ASL
4355 : 69 cc __ ADC #$cc
4357 : c8 __ __ INY
4358 : 91 23 __ STA (SP + 0),y 
435a : a9 bf __ LDA #$bf
435c : 69 00 __ ADC #$00
435e : c8 __ __ INY
435f : 91 23 __ STA (SP + 0),y 
4361 : 20 15 5a JSR $5a15 ; (divmod + 0)
4364 : a6 05 __ LDX WORK + 2 
4366 : bd 51 5b LDA $5b51,x ; (__multab6L + 0)
4369 : 18 __ __ CLC
436a : 69 45 __ ADC #$45
436c : a0 08 __ LDY #$08
436e : 91 23 __ STA (SP + 0),y 
4370 : a9 bf __ LDA #$bf
4372 : 69 00 __ ADC #$00
4374 : c8 __ __ INY
4375 : 91 23 __ STA (SP + 0),y 
4377 : a5 53 __ LDA T1 + 0 
4379 : 85 1b __ STA ACCU + 0 
437b : a5 54 __ LDA T1 + 1 
437d : 85 1c __ STA ACCU + 1 
437f : a9 05 __ LDA #$05
4381 : 85 03 __ STA WORK + 0 
4383 : a9 00 __ LDA #$00
4385 : 85 04 __ STA WORK + 1 
4387 : 20 15 5a JSR $5a15 ; (divmod + 0)
438a : a6 05 __ LDX WORK + 2 
438c : bd 56 5b LDA $5b56,x ; (__multab15L + 0)
438f : 18 __ __ CLC
4390 : 69 81 __ ADC #$81
4392 : a0 0a __ LDY #$0a
4394 : 91 23 __ STA (SP + 0),y 
4396 : a9 bf __ LDA #$bf
4398 : 69 00 __ ADC #$00
439a : c8 __ __ INY
439b : 91 23 __ STA (SP + 0),y 
439d : a5 55 __ LDA T2 + 0 
439f : 85 1b __ STA ACCU + 0 
43a1 : a5 56 __ LDA T2 + 1 
43a3 : 85 1c __ STA ACCU + 1 
43a5 : a9 05 __ LDA #$05
43a7 : 85 03 __ STA WORK + 0 
43a9 : a9 00 __ LDA #$00
43ab : 85 04 __ STA WORK + 1 
43ad : 20 15 5a JSR $5a15 ; (divmod + 0)
43b0 : a6 05 __ LDX WORK + 2 
43b2 : bd 51 5b LDA $5b51,x ; (__multab6L + 0)
43b5 : 18 __ __ CLC
43b6 : 69 63 __ ADC #$63
43b8 : a0 0c __ LDY #$0c
43ba : 91 23 __ STA (SP + 0),y 
43bc : a9 bf __ LDA #$bf
43be : 69 00 __ ADC #$00
43c0 : c8 __ __ INY
43c1 : 91 23 __ STA (SP + 0),y 
43c3 : 20 56 2f JSR $2f56 ; (sprintf.s0 + 0)
.s1001:
43c6 : 18 __ __ CLC
43c7 : a5 23 __ LDA SP + 0 
43c9 : 69 0e __ ADC #$0e
43cb : 85 23 __ STA SP + 0 
43cd : 90 02 __ BCC $43d1 ; (generateSentence.s1001 + 11)
43cf : e6 24 __ INC SP + 1 
43d1 : a2 03 __ LDX #$03
43d3 : bd 41 bf LDA $bf41,x ; (generateSentence@stack + 0)
43d6 : 95 53 __ STA T1 + 0,x 
43d8 : ca __ __ DEX
43d9 : 10 f8 __ BPL $43d3 ; (generateSentence.s1001 + 13)
43db : 60 __ __ RTS
--------------------------------------------------------------------
43dc : __ __ __ BYT 25 53 20 25 53 20 25 53 20 25 53 2e 00          : %S %S %S %S..
--------------------------------------------------------------------
vdcwin_printwrap: ; vdcwin_printwrap(struct VDCWin*,const u8*)->void
.s1000:
43e9 : a2 06 __ LDX #$06
43eb : b5 53 __ LDA T0 + 0,x 
43ed : 9d 8e bf STA $bf8e,x ; (nouns + 13)
43f0 : ca __ __ DEX
43f1 : 10 f8 __ BPL $43eb ; (vdcwin_printwrap.s1000 + 2)
43f3 : 38 __ __ SEC
43f4 : a5 23 __ LDA SP + 0 
43f6 : e9 06 __ SBC #$06
43f8 : 85 23 __ STA SP + 0 
43fa : b0 02 __ BCS $43fe ; (vdcwin_printwrap.s0 + 0)
43fc : c6 24 __ DEC SP + 1 
.s0:
43fe : ad fe bf LDA $bffe ; (sstack + 14)
4401 : 85 0d __ STA P0 
4403 : ad ff bf LDA $bfff ; (sstack + 15)
4406 : 85 0e __ STA P1 
4408 : 20 de 2e JSR $2ede ; (strlen.s0 + 0)
440b : a5 1b __ LDA ACCU + 0 
440d : f0 3b __ BEQ $444a ; (vdcwin_printwrap.s1001 + 0)
.s30:
440f : 85 53 __ STA T0 + 0 
4411 : a9 00 __ LDA #$00
4413 : 85 57 __ STA T3 + 0 
4415 : 85 45 __ STA T6 + 0 
4417 : a9 ff __ LDA #$ff
4419 : 85 59 __ STA T4 + 1 
441b : 85 44 __ STA T5 + 1 
441d : ad fc bf LDA $bffc ; (sstack + 12)
4420 : 85 55 __ STA T2 + 0 
4422 : ad fd bf LDA $bffd ; (sstack + 13)
4425 : 85 56 __ STA T2 + 1 
4427 : a0 02 __ LDY #$02
4429 : b1 55 __ LDA (T2 + 0),y 
442b : 85 54 __ STA T1 + 0 
.l4:
442d : a5 57 __ LDA T3 + 0 
442f : c5 53 __ CMP T0 + 0 
4431 : b0 0d __ BCS $4440 ; (vdcwin_printwrap.s7 + 0)
.l9:
4433 : 24 44 __ BIT T5 + 1 
4435 : 10 09 __ BPL $4440 ; (vdcwin_printwrap.s7 + 0)
.s8:
4437 : a5 45 __ LDA T6 + 0 
4439 : c9 50 __ CMP #$50
443b : b0 03 __ BCS $4440 ; (vdcwin_printwrap.s7 + 0)
443d : 4c 41 45 JMP $4541 ; (vdcwin_printwrap.s6 + 0)
.s7:
4440 : a6 45 __ LDX T6 + 0 
4442 : d0 1c __ BNE $4460 ; (vdcwin_printwrap.s19 + 0)
.s1:
4444 : a5 57 __ LDA T3 + 0 
4446 : c5 53 __ CMP T0 + 0 
4448 : 90 e9 __ BCC $4433 ; (vdcwin_printwrap.l9 + 0)
.s1001:
444a : 18 __ __ CLC
444b : a5 23 __ LDA SP + 0 
444d : 69 06 __ ADC #$06
444f : 85 23 __ STA SP + 0 
4451 : 90 02 __ BCC $4455 ; (vdcwin_printwrap.s1001 + 11)
4453 : e6 24 __ INC SP + 1 
4455 : a2 06 __ LDX #$06
4457 : bd 8e bf LDA $bf8e,x ; (nouns + 13)
445a : 95 53 __ STA T0 + 0,x 
445c : ca __ __ DEX
445d : 10 f8 __ BPL $4457 ; (vdcwin_printwrap.s1001 + 13)
445f : 60 __ __ RTS
.s19:
4460 : a9 00 __ LDA #$00
4462 : 9d 96 bf STA $bf96,x ; (nouns + 21)
4465 : a9 96 __ LDA #$96
4467 : 85 0d __ STA P0 
4469 : a9 bf __ LDA #$bf
446b : 85 0e __ STA P1 
446d : 20 de 2e JSR $2ede ; (strlen.s0 + 0)
4470 : ad fc bf LDA $bffc ; (sstack + 12)
4473 : 85 58 __ STA T4 + 0 
4475 : ad fd bf LDA $bffd ; (sstack + 13)
4478 : 85 59 __ STA T4 + 1 
.l22:
447a : a0 02 __ LDY #$02
447c : b1 58 __ LDA (T4 + 0),y 
447e : c5 1b __ CMP ACCU + 0 
4480 : 90 54 __ BCC $44d6 ; (vdcwin_printwrap.s23 + 0)
.s24:
4482 : a0 04 __ LDY #$04
4484 : b1 58 __ LDA (T4 + 0),y 
4486 : 18 __ __ CLC
4487 : 65 1b __ ADC ACCU + 0 
4489 : b0 06 __ BCS $4491 ; (vdcwin_printwrap.s25 + 0)
.s1010:
448b : c5 54 __ CMP T1 + 0 
448d : 90 1a __ BCC $44a9 ; (vdcwin_printwrap.s27 + 0)
.s1018:
448f : f0 18 __ BEQ $44a9 ; (vdcwin_printwrap.s27 + 0)
.s25:
4491 : a5 58 __ LDA T4 + 0 
4493 : a0 02 __ LDY #$02
4495 : 91 23 __ STA (SP + 0),y 
4497 : a5 59 __ LDA T4 + 1 
4499 : c8 __ __ INY
449a : 91 23 __ STA (SP + 0),y 
449c : a9 fd __ LDA #$fd
449e : c8 __ __ INY
449f : 91 23 __ STA (SP + 0),y 
44a1 : a9 2f __ LDA #$2f
44a3 : c8 __ __ INY
44a4 : 91 23 __ STA (SP + 0),y 
44a6 : 20 6d 45 JSR $456d ; (vdcwin_printline.s1000 + 0)
.s27:
44a9 : ad fc bf LDA $bffc ; (sstack + 12)
44ac : a0 02 __ LDY #$02
44ae : 91 23 __ STA (SP + 0),y 
44b0 : ad fd bf LDA $bffd ; (sstack + 13)
44b3 : c8 __ __ INY
44b4 : 91 23 __ STA (SP + 0),y 
44b6 : a9 96 __ LDA #$96
44b8 : c8 __ __ INY
44b9 : 91 23 __ STA (SP + 0),y 
44bb : a9 bf __ LDA #$bf
44bd : c8 __ __ INY
44be : 91 23 __ STA (SP + 0),y 
44c0 : 20 23 46 JSR $4623 ; (vdcwin_put_string.s1000 + 0)
44c3 : a5 57 __ LDA T3 + 0 
44c5 : c5 53 __ CMP T0 + 0 
44c7 : b0 81 __ BCS $444a ; (vdcwin_printwrap.s1001 + 0)
.s49:
44c9 : a9 00 __ LDA #$00
44cb : 85 45 __ STA T6 + 0 
44cd : a9 ff __ LDA #$ff
44cf : 85 44 __ STA T5 + 1 
44d1 : 85 59 __ STA T4 + 1 
44d3 : 4c 2d 44 JMP $442d ; (vdcwin_printwrap.l4 + 0)
.s23:
44d6 : a5 58 __ LDA T4 + 0 
44d8 : 91 23 __ STA (SP + 0),y 
44da : a5 59 __ LDA T4 + 1 
44dc : c8 __ __ INY
44dd : 91 23 __ STA (SP + 0),y 
44df : a9 fd __ LDA #$fd
44e1 : c8 __ __ INY
44e2 : 91 23 __ STA (SP + 0),y 
44e4 : a9 2f __ LDA #$2f
44e6 : c8 __ __ INY
44e7 : 91 23 __ STA (SP + 0),y 
44e9 : 20 6d 45 JSR $456d ; (vdcwin_printline.s1000 + 0)
44ec : ad fc bf LDA $bffc ; (sstack + 12)
44ef : 85 55 __ STA T2 + 0 
44f1 : 8d f7 bf STA $bff7 ; (sstack + 7)
44f4 : ad fd bf LDA $bffd ; (sstack + 13)
44f7 : 85 56 __ STA T2 + 1 
44f9 : 8d f8 bf STA $bff8 ; (sstack + 8)
44fc : a0 02 __ LDY #$02
44fe : b1 55 __ LDA (T2 + 0),y 
4500 : 8d fb bf STA $bffb ; (sstack + 11)
4503 : a9 96 __ LDA #$96
4505 : 8d f9 bf STA $bff9 ; (sstack + 9)
4508 : a9 bf __ LDA #$bf
450a : 8d fa bf STA $bffa ; (sstack + 10)
450d : 20 5d 48 JSR $485d ; (vdcwin_put_chars.s1000 + 0)
4510 : a9 96 __ LDA #$96
4512 : 85 0d __ STA P0 
4514 : a9 bf __ LDA #$bf
4516 : 85 0e __ STA P1 
4518 : ad fc bf LDA $bffc ; (sstack + 12)
451b : 85 43 __ STA T5 + 0 
451d : ad fd bf LDA $bffd ; (sstack + 13)
4520 : 85 44 __ STA T5 + 1 
4522 : a0 02 __ LDY #$02
4524 : b1 43 __ LDA (T5 + 0),y 
4526 : 18 __ __ CLC
4527 : 69 96 __ ADC #$96
4529 : 85 43 __ STA T5 + 0 
452b : a9 bf __ LDA #$bf
452d : 69 00 __ ADC #$00
452f : 85 44 __ STA T5 + 1 
4531 : a0 ff __ LDY #$ff
.l1012:
4533 : c8 __ __ INY
4534 : b1 43 __ LDA (T5 + 0),y 
4536 : 99 96 bf STA $bf96,y ; (nouns + 21)
4539 : d0 f8 __ BNE $4533 ; (vdcwin_printwrap.l1012 + 0)
.s1013:
453b : 20 de 2e JSR $2ede ; (strlen.s0 + 0)
453e : 4c 7a 44 JMP $447a ; (vdcwin_printwrap.l22 + 0)
.s6:
4541 : ad fe bf LDA $bffe ; (sstack + 14)
4544 : 85 49 __ STA T9 + 0 
4546 : ad ff bf LDA $bfff ; (sstack + 15)
4549 : 85 4a __ STA T9 + 1 
454b : a4 57 __ LDY T3 + 0 
454d : b1 49 __ LDA (T9 + 0),y 
454f : a6 45 __ LDX T6 + 0 
4551 : 9d 96 bf STA $bf96,x ; (nouns + 21)
4554 : c9 20 __ CMP #$20
4556 : d0 06 __ BNE $455e ; (vdcwin_printwrap.s10 + 0)
.s16:
4558 : a9 00 __ LDA #$00
455a : 85 44 __ STA T5 + 1 
455c : f0 08 __ BEQ $4566 ; (vdcwin_printwrap.s53 + 0)
.s10:
455e : 24 59 __ BIT T4 + 1 
4560 : 10 04 __ BPL $4566 ; (vdcwin_printwrap.s53 + 0)
.s13:
4562 : a9 00 __ LDA #$00
4564 : 85 59 __ STA T4 + 1 
.s53:
4566 : e6 57 __ INC T3 + 0 
4568 : e6 45 __ INC T6 + 0 
456a : 4c 2d 44 JMP $442d ; (vdcwin_printwrap.l4 + 0)
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
456d : a5 53 __ LDA T0 + 0 
456f : 8d ec bf STA $bfec ; (buffer + 12)
4572 : a5 54 __ LDA T0 + 1 
4574 : 8d ed bf STA $bfed ; (buffer + 13)
4577 : a5 55 __ LDA T1 + 0 
4579 : 8d ee bf STA $bfee ; (buffer + 14)
457c : 38 __ __ SEC
457d : a5 23 __ LDA SP + 0 
457f : e9 06 __ SBC #$06
4581 : 85 23 __ STA SP + 0 
4583 : b0 02 __ BCS $4587 ; (vdcwin_printline.s0 + 0)
4585 : c6 24 __ DEC SP + 1 
.s0:
4587 : a0 08 __ LDY #$08
4589 : b1 23 __ LDA (SP + 0),y 
458b : 85 53 __ STA T0 + 0 
458d : a0 02 __ LDY #$02
458f : 91 23 __ STA (SP + 0),y 
4591 : a0 09 __ LDY #$09
4593 : b1 23 __ LDA (SP + 0),y 
4595 : 85 54 __ STA T0 + 1 
4597 : a0 03 __ LDY #$03
4599 : 91 23 __ STA (SP + 0),y 
459b : a0 0a __ LDY #$0a
459d : b1 23 __ LDA (SP + 0),y 
459f : a0 04 __ LDY #$04
45a1 : 91 23 __ STA (SP + 0),y 
45a3 : a0 0b __ LDY #$0b
45a5 : b1 23 __ LDA (SP + 0),y 
45a7 : a0 05 __ LDY #$05
45a9 : 91 23 __ STA (SP + 0),y 
45ab : 20 23 46 JSR $4623 ; (vdcwin_put_string.s1000 + 0)
45ae : a9 00 __ LDA #$00
45b0 : a0 04 __ LDY #$04
45b2 : 91 53 __ STA (T0 + 0),y 
45b4 : 88 __ __ DEY
45b5 : b1 53 __ LDA (T0 + 0),y 
45b7 : 85 55 __ STA T1 + 0 
45b9 : 38 __ __ SEC
45ba : e9 01 __ SBC #$01
45bc : 85 44 __ STA T3 + 0 
45be : a0 05 __ LDY #$05
45c0 : b1 53 __ LDA (T0 + 0),y 
45c2 : 90 0b __ BCC $45cf ; (vdcwin_printline.s2 + 0)
.s1002:
45c4 : aa __ __ TAX
45c5 : e4 44 __ CPX T3 + 0 
45c7 : b0 06 __ BCS $45cf ; (vdcwin_printline.s2 + 0)
.s1:
45c9 : e8 __ __ INX
45ca : 8a __ __ TXA
45cb : 91 53 __ STA (T0 + 0),y 
45cd : 90 39 __ BCC $4608 ; (vdcwin_printline.s1001 + 0)
.s2:
45cf : a5 53 __ LDA T0 + 0 
45d1 : 8d f4 bf STA $bff4 ; (sstack + 4)
45d4 : a5 54 __ LDA T0 + 1 
45d6 : 8d f5 bf STA $bff5 ; (sstack + 5)
45d9 : a9 01 __ LDA #$01
45db : 8d f6 bf STA $bff6 ; (sstack + 6)
45de : 20 1d 47 JSR $471d ; (vdcwin_scroll_up.s0 + 0)
45e1 : a9 20 __ LDA #$20
45e3 : 8d f3 bf STA $bff3 ; (sstack + 3)
45e6 : a9 01 __ LDA #$01
45e8 : 8d f5 bf STA $bff5 ; (sstack + 5)
45eb : a0 00 __ LDY #$00
45ed : b1 53 __ LDA (T0 + 0),y 
45ef : 8d f1 bf STA $bff1 ; (sstack + 1)
45f2 : a0 02 __ LDY #$02
45f4 : b1 53 __ LDA (T0 + 0),y 
45f6 : 8d f4 bf STA $bff4 ; (sstack + 4)
45f9 : 88 __ __ DEY
45fa : b1 53 __ LDA (T0 + 0),y 
45fc : 18 __ __ CLC
45fd : 65 55 __ ADC T1 + 0 
45ff : 38 __ __ SEC
4600 : e9 01 __ SBC #$01
4602 : 8d f2 bf STA $bff2 ; (sstack + 2)
4605 : 20 ee 21 JSR $21ee ; (vdc_clear.s0 + 0)
.s1001:
4608 : 18 __ __ CLC
4609 : a5 23 __ LDA SP + 0 
460b : 69 06 __ ADC #$06
460d : 85 23 __ STA SP + 0 
460f : 90 02 __ BCC $4613 ; (vdcwin_printline.s1001 + 11)
4611 : e6 24 __ INC SP + 1 
4613 : ad ec bf LDA $bfec ; (buffer + 12)
4616 : 85 53 __ STA T0 + 0 
4618 : ad ed bf LDA $bfed ; (buffer + 13)
461b : 85 54 __ STA T0 + 1 
461d : ad ee bf LDA $bfee ; (buffer + 14)
4620 : 85 55 __ STA T1 + 0 
4622 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->u8
.s1000:
4623 : 38 __ __ SEC
4624 : a5 23 __ LDA SP + 0 
4626 : e9 0c __ SBC #$0c
4628 : 85 23 __ STA SP + 0 
462a : b0 02 __ BCS $462e ; (vdcwin_put_string.s1000 + 11)
462c : c6 24 __ DEC SP + 1 
462e : a0 0a __ LDY #$0a
4630 : a2 04 __ LDX #$04
4632 : b5 53 __ LDA T0 + 0,x 
4634 : 91 23 __ STA (SP + 0),y 
4636 : 88 __ __ DEY
4637 : ca __ __ DEX
4638 : 10 f8 __ BPL $4632 ; (vdcwin_put_string.s1000 + 15)
.s0:
463a : a0 0f __ LDY #$0f
463c : b1 23 __ LDA (SP + 0),y 
463e : 85 54 __ STA T0 + 1 
4640 : 8d f1 bf STA $bff1 ; (sstack + 1)
4643 : 88 __ __ DEY
4644 : b1 23 __ LDA (SP + 0),y 
4646 : 85 53 __ STA T0 + 0 
4648 : 8d f0 bf STA $bff0 ; (sstack + 0)
464b : a0 04 __ LDY #$04
464d : b1 53 __ LDA (T0 + 0),y 
464f : 85 57 __ STA T3 + 0 
4651 : 8d f2 bf STA $bff2 ; (sstack + 2)
4654 : c8 __ __ INY
4655 : b1 53 __ LDA (T0 + 0),y 
4657 : 85 56 __ STA T2 + 0 
4659 : 8d f3 bf STA $bff3 ; (sstack + 3)
465c : a0 10 __ LDY #$10
465e : b1 23 __ LDA (SP + 0),y 
4660 : 8d f4 bf STA $bff4 ; (sstack + 4)
4663 : c8 __ __ INY
4664 : b1 23 __ LDA (SP + 0),y 
4666 : 8d f5 bf STA $bff5 ; (sstack + 5)
4669 : 20 cc 46 JSR $46cc ; (vdcwin_putat_string.s0 + 0)
466c : 18 __ __ CLC
466d : a5 1b __ LDA ACCU + 0 
466f : 65 57 __ ADC T3 + 0 
4671 : a0 04 __ LDY #$04
4673 : 91 53 __ STA (T0 + 0),y 
4675 : a0 02 __ LDY #$02
4677 : d1 53 __ CMP (T0 + 0),y 
4679 : 90 39 __ BCC $46b4 ; (vdcwin_put_string.s1001 + 0)
.s1:
467b : a9 00 __ LDA #$00
467d : a0 04 __ LDY #$04
467f : 91 53 __ STA (T0 + 0),y 
4681 : a5 56 __ LDA T2 + 0 
4683 : 69 00 __ ADC #$00
4685 : c8 __ __ INY
4686 : 91 53 __ STA (T0 + 0),y 
4688 : a0 03 __ LDY #$03
468a : d1 53 __ CMP (T0 + 0),y 
468c : d0 26 __ BNE $46b4 ; (vdcwin_put_string.s1001 + 0)
.s4:
468e : a5 1b __ LDA ACCU + 0 
4690 : 85 55 __ STA T1 + 0 
4692 : a5 56 __ LDA T2 + 0 
4694 : a0 05 __ LDY #$05
4696 : 91 53 __ STA (T0 + 0),y 
4698 : a5 53 __ LDA T0 + 0 
469a : a0 02 __ LDY #$02
469c : 91 23 __ STA (SP + 0),y 
469e : a5 54 __ LDA T0 + 1 
46a0 : c8 __ __ INY
46a1 : 91 23 __ STA (SP + 0),y 
46a3 : a9 fd __ LDA #$fd
46a5 : c8 __ __ INY
46a6 : 91 23 __ STA (SP + 0),y 
46a8 : a9 2f __ LDA #$2f
46aa : c8 __ __ INY
46ab : 91 23 __ STA (SP + 0),y 
46ad : 20 6d 45 JSR $456d ; (vdcwin_printline.s1000 + 0)
46b0 : a5 55 __ LDA T1 + 0 
46b2 : 85 1b __ STA ACCU + 0 
.s1001:
46b4 : a0 0a __ LDY #$0a
46b6 : a2 04 __ LDX #$04
46b8 : b1 23 __ LDA (SP + 0),y 
46ba : 95 53 __ STA T0 + 0,x 
46bc : 88 __ __ DEY
46bd : ca __ __ DEX
46be : 10 f8 __ BPL $46b8 ; (vdcwin_put_string.s1001 + 4)
46c0 : 18 __ __ CLC
46c1 : a5 23 __ LDA SP + 0 
46c3 : 69 0c __ ADC #$0c
46c5 : 85 23 __ STA SP + 0 
46c7 : 90 02 __ BCC $46cb ; (vdcwin_put_string.s1001 + 23)
46c9 : e6 24 __ INC SP + 1 
46cb : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_string: ; vdcwin_putat_string(struct VDCWin*,u8,u8,const u8*)->u8
.s0:
46cc : a9 00 __ LDA #$00
46ce : 85 45 __ STA T0 + 0 
46d0 : ad f4 bf LDA $bff4 ; (sstack + 4)
46d3 : 85 46 __ STA T1 + 0 
46d5 : ad f5 bf LDA $bff5 ; (sstack + 5)
46d8 : 85 47 __ STA T1 + 1 
46da : 4c 14 47 JMP $4714 ; (vdcwin_putat_string.l1 + 0)
.s2:
46dd : 4a __ __ LSR
46de : 4a __ __ LSR
46df : 4a __ __ LSR
46e0 : 4a __ __ LSR
46e1 : 4a __ __ LSR
46e2 : aa __ __ TAX
46e3 : bd f6 5b LDA $5bf6,x ; (p2smap + 0)
46e6 : 51 46 __ EOR (T1 + 0),y 
46e8 : 85 16 __ STA P9 
46ea : ad f0 bf LDA $bff0 ; (sstack + 0)
46ed : 85 48 __ STA T3 + 0 
46ef : ad f1 bf LDA $bff1 ; (sstack + 1)
46f2 : 85 49 __ STA T3 + 1 
46f4 : ad f2 bf LDA $bff2 ; (sstack + 2)
46f7 : 18 __ __ CLC
46f8 : a0 00 __ LDY #$00
46fa : 71 48 __ ADC (T3 + 0),y 
46fc : 18 __ __ CLC
46fd : 65 45 __ ADC T0 + 0 
46ff : 85 14 __ STA P7 
4701 : ad f3 bf LDA $bff3 ; (sstack + 3)
4704 : 18 __ __ CLC
4705 : c8 __ __ INY
4706 : 71 48 __ ADC (T3 + 0),y 
4708 : 85 15 __ STA P8 
470a : ad 66 60 LDA $6066 ; (vdc_state + 7)
470d : 85 17 __ STA P10 
470f : 20 28 35 JSR $3528 ; (vdc_printc.s0 + 0)
4712 : e6 45 __ INC T0 + 0 
.l1:
4714 : a4 45 __ LDY T0 + 0 
4716 : b1 46 __ LDA (T1 + 0),y 
4718 : d0 c3 __ BNE $46dd ; (vdcwin_putat_string.s2 + 0)
.s3:
471a : 84 1b __ STY ACCU + 0 ; (x + 0)
.s1001:
471c : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_up: ; vdcwin_scroll_up(struct VDCWin*,u8)->void
.s0:
471d : ad 62 60 LDA $6062 ; (vdc_state + 3)
4720 : 85 1b __ STA ACCU + 0 
4722 : ad 63 60 LDA $6063 ; (vdc_state + 4)
4725 : 85 1c __ STA ACCU + 1 
4727 : ad f6 bf LDA $bff6 ; (sstack + 6)
472a : 85 46 __ STA T1 + 0 
472c : 20 b3 59 JSR $59b3 ; (mul16by8 + 0)
472f : a5 05 __ LDA WORK + 2 
4731 : 85 47 __ STA T2 + 0 
4733 : a5 06 __ LDA WORK + 3 
4735 : 85 48 __ STA T2 + 1 
4737 : a9 00 __ LDA #$00
4739 : 85 45 __ STA T0 + 0 
473b : ad f4 bf LDA $bff4 ; (sstack + 4)
473e : 85 49 __ STA T3 + 0 
4740 : ad f5 bf LDA $bff5 ; (sstack + 5)
4743 : 85 4a __ STA T3 + 1 
4745 : a0 02 __ LDY #$02
4747 : b1 49 __ LDA (T3 + 0),y 
4749 : 85 4b __ STA T4 + 0 
474b : a0 06 __ LDY #$06
474d : b1 49 __ LDA (T3 + 0),y 
474f : 85 4c __ STA T5 + 0 
4751 : c8 __ __ INY
4752 : b1 49 __ LDA (T3 + 0),y 
4754 : 85 4d __ STA T5 + 1 
4756 : c8 __ __ INY
4757 : b1 49 __ LDA (T3 + 0),y 
4759 : 85 4e __ STA T6 + 0 
475b : c8 __ __ INY
475c : b1 49 __ LDA (T3 + 0),y 
.l1:
475e : 85 4f __ STA T6 + 1 
4760 : a0 03 __ LDY #$03
4762 : b1 49 __ LDA (T3 + 0),y 
4764 : 38 __ __ SEC
4765 : e5 46 __ SBC T1 + 0 
4767 : 90 06 __ BCC $476f ; (vdcwin_scroll_up.s2 + 0)
.s1002:
4769 : c5 45 __ CMP T0 + 0 
476b : 90 63 __ BCC $47d0 ; (vdcwin_scroll_up.s1001 + 0)
.s1004:
476d : f0 61 __ BEQ $47d0 ; (vdcwin_scroll_up.s1001 + 0)
.s2:
476f : a5 4c __ LDA T5 + 0 
4771 : 85 16 __ STA P9 
4773 : 18 __ __ CLC
4774 : 65 47 __ ADC T2 + 0 
4776 : 8d f0 bf STA $bff0 ; (sstack + 0)
4779 : a5 4d __ LDA T5 + 1 
477b : 85 17 __ STA P10 
477d : 65 48 __ ADC T2 + 1 
477f : 8d f1 bf STA $bff1 ; (sstack + 1)
4782 : a5 4b __ LDA T4 + 0 
4784 : 8d f2 bf STA $bff2 ; (sstack + 2)
4787 : a9 00 __ LDA #$00
4789 : 8d f3 bf STA $bff3 ; (sstack + 3)
478c : 20 d1 47 JSR $47d1 ; (vdc_block_copy.s0 + 0)
478f : a5 4b __ LDA T4 + 0 
4791 : 8d f2 bf STA $bff2 ; (sstack + 2)
4794 : a9 00 __ LDA #$00
4796 : 8d f3 bf STA $bff3 ; (sstack + 3)
4799 : a5 4e __ LDA T6 + 0 
479b : 85 16 __ STA P9 
479d : 18 __ __ CLC
479e : 65 47 __ ADC T2 + 0 
47a0 : 8d f0 bf STA $bff0 ; (sstack + 0)
47a3 : a5 4f __ LDA T6 + 1 
47a5 : 85 17 __ STA P10 
47a7 : 65 48 __ ADC T2 + 1 
47a9 : 8d f1 bf STA $bff1 ; (sstack + 1)
47ac : 20 d1 47 JSR $47d1 ; (vdc_block_copy.s0 + 0)
47af : ad 62 60 LDA $6062 ; (vdc_state + 3)
47b2 : 18 __ __ CLC
47b3 : 65 4c __ ADC T5 + 0 
47b5 : 85 4c __ STA T5 + 0 
47b7 : ad 63 60 LDA $6063 ; (vdc_state + 4)
47ba : 65 4d __ ADC T5 + 1 
47bc : 85 4d __ STA T5 + 1 
47be : 18 __ __ CLC
47bf : a5 16 __ LDA P9 
47c1 : 6d 62 60 ADC $6062 ; (vdc_state + 3)
47c4 : 85 4e __ STA T6 + 0 
47c6 : a5 4f __ LDA T6 + 1 
47c8 : 6d 63 60 ADC $6063 ; (vdc_state + 4)
47cb : e6 45 __ INC T0 + 0 
47cd : 4c 5e 47 JMP $475e ; (vdcwin_scroll_up.l1 + 0)
.s1001:
47d0 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_block_copy: ; vdc_block_copy(u16,u16,u16)->void
.s0:
47d1 : ad f2 bf LDA $bff2 ; (sstack + 2)
47d4 : 85 44 __ STA T1 + 0 
47d6 : ad f3 bf LDA $bff3 ; (sstack + 3)
47d9 : f0 2c __ BEQ $4807 ; (vdc_block_copy.s4 + 0)
.s2:
47db : 85 43 __ STA T0 + 0 
47dd : a9 ff __ LDA #$ff
47df : 85 15 __ STA P8 
47e1 : a5 16 __ LDA P9 ; (dest + 0)
47e3 : 85 11 __ STA P4 
.l1002:
47e5 : a5 17 __ LDA P10 ; (dest + 1)
47e7 : 85 12 __ STA P5 
47e9 : ad f0 bf LDA $bff0 ; (sstack + 0)
47ec : 85 13 __ STA P6 
47ee : ad f1 bf LDA $bff1 ; (sstack + 1)
47f1 : 85 14 __ STA P7 
47f3 : 20 20 48 JSR $4820 ; (vdc_block_copy_page.s0 + 0)
47f6 : e6 17 __ INC P10 ; (dest + 1)
47f8 : a6 14 __ LDX P7 
47fa : e8 __ __ INX
47fb : 8e f1 bf STX $bff1 ; (sstack + 1)
47fe : a5 13 __ LDA P6 
4800 : 8d f0 bf STA $bff0 ; (sstack + 0)
4803 : c6 43 __ DEC T0 + 0 
4805 : d0 de __ BNE $47e5 ; (vdc_block_copy.l1002 + 0)
.s4:
4807 : a5 44 __ LDA T1 + 0 
4809 : 85 15 __ STA P8 
480b : a5 16 __ LDA P9 ; (dest + 0)
480d : 85 11 __ STA P4 
480f : a5 17 __ LDA P10 ; (dest + 1)
4811 : 85 12 __ STA P5 
4813 : ad f0 bf LDA $bff0 ; (sstack + 0)
4816 : 85 13 __ STA P6 
4818 : ad f1 bf LDA $bff1 ; (sstack + 1)
481b : 85 14 __ STA P7 
481d : 4c 20 48 JMP $4820 ; (vdc_block_copy_page.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy_page: ; vdc_block_copy_page(u16,u16,u8)->void
.s0:
4820 : a5 11 __ LDA P4 ; (dest + 0)
4822 : 85 0f __ STA P2 
4824 : a5 12 __ LDA P5 ; (dest + 1)
4826 : 85 10 __ STA P3 
4828 : 20 a2 21 JSR $21a2 ; (vdc_mem_addr.s0 + 0)
482b : a9 18 __ LDA #$18
482d : 85 0d __ STA P0 
482f : 20 1e 21 JSR $211e ; (vdc_reg_read.s0 + 0)
4832 : 09 80 __ ORA #$80
4834 : 85 0e __ STA P1 
4836 : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
4839 : a9 20 __ LDA #$20
483b : 85 0d __ STA P0 
483d : a5 14 __ LDA P7 ; (src + 1)
483f : 85 0e __ STA P1 
4841 : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
4844 : e6 0d __ INC P0 
4846 : a5 13 __ LDA P6 ; (src + 0)
4848 : 85 0e __ STA P1 
484a : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
484d : a9 1f __ LDA #$1f
484f : 8d 00 d6 STA $d600 
4852 : a9 1e __ LDA #$1e
4854 : 85 0d __ STA P0 
4856 : a5 15 __ LDA P8 ; (length + 0)
4858 : 85 0e __ STA P1 
485a : 4c 0e 21 JMP $210e ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdcwin_put_chars: ; vdcwin_put_chars(struct VDCWin*,const u8*,u8)->void
.s1000:
485d : a2 04 __ LDX #$04
485f : b5 53 __ LDA T0 + 0,x 
4861 : 9d e7 bf STA $bfe7,x ; (vp_fill + 29)
4864 : ca __ __ DEX
4865 : 10 f8 __ BPL $485f ; (vdcwin_put_chars.s1000 + 2)
4867 : 38 __ __ SEC
4868 : a5 23 __ LDA SP + 0 ; (chars + 1)
486a : e9 06 __ SBC #$06
486c : 85 23 __ STA SP + 0 ; (chars + 1)
486e : b0 02 __ BCS $4872 ; (vdcwin_put_chars.s0 + 0)
4870 : c6 24 __ DEC SP + 1 ; (num + 0)
.s0:
4872 : ad f7 bf LDA $bff7 ; (sstack + 7)
4875 : 85 53 __ STA T0 + 0 
4877 : 8d f0 bf STA $bff0 ; (sstack + 0)
487a : ad f8 bf LDA $bff8 ; (sstack + 8)
487d : 85 54 __ STA T0 + 1 
487f : 8d f1 bf STA $bff1 ; (sstack + 1)
4882 : a0 04 __ LDY #$04
4884 : b1 53 __ LDA (T0 + 0),y 
4886 : 85 55 __ STA T1 + 0 
4888 : 8d f2 bf STA $bff2 ; (sstack + 2)
488b : c8 __ __ INY
488c : b1 53 __ LDA (T0 + 0),y 
488e : 85 56 __ STA T2 + 0 
4890 : 8d f3 bf STA $bff3 ; (sstack + 3)
4893 : ad f9 bf LDA $bff9 ; (sstack + 9)
4896 : 8d f4 bf STA $bff4 ; (sstack + 4)
4899 : ad fa bf LDA $bffa ; (sstack + 10)
489c : 8d f5 bf STA $bff5 ; (sstack + 5)
489f : ad fb bf LDA $bffb ; (sstack + 11)
48a2 : 85 57 __ STA T4 + 0 
48a4 : 8d f6 bf STA $bff6 ; (sstack + 6)
48a7 : 20 00 49 JSR $4900 ; (vdcwin_putat_chars.s0 + 0)
48aa : 18 __ __ CLC
48ab : a5 57 __ LDA T4 + 0 
48ad : 65 55 __ ADC T1 + 0 
48af : a0 04 __ LDY #$04
48b1 : 91 53 __ STA (T0 + 0),y 
48b3 : a0 02 __ LDY #$02
48b5 : d1 53 __ CMP (T0 + 0),y 
48b7 : 90 31 __ BCC $48ea ; (vdcwin_put_chars.s1001 + 0)
.s1:
48b9 : a9 00 __ LDA #$00
48bb : a0 04 __ LDY #$04
48bd : 91 53 __ STA (T0 + 0),y 
48bf : a5 56 __ LDA T2 + 0 
48c1 : 69 00 __ ADC #$00
48c3 : c8 __ __ INY
48c4 : 91 53 __ STA (T0 + 0),y 
48c6 : a0 03 __ LDY #$03
48c8 : d1 53 __ CMP (T0 + 0),y 
48ca : d0 1e __ BNE $48ea ; (vdcwin_put_chars.s1001 + 0)
.s4:
48cc : a5 56 __ LDA T2 + 0 
48ce : a0 05 __ LDY #$05
48d0 : 91 53 __ STA (T0 + 0),y 
48d2 : a5 53 __ LDA T0 + 0 
48d4 : a0 02 __ LDY #$02
48d6 : 91 23 __ STA (SP + 0),y ; (chars + 1)
48d8 : a5 54 __ LDA T0 + 1 
48da : c8 __ __ INY
48db : 91 23 __ STA (SP + 0),y ; (chars + 1)
48dd : a9 fd __ LDA #$fd
48df : c8 __ __ INY
48e0 : 91 23 __ STA (SP + 0),y ; (chars + 1)
48e2 : a9 2f __ LDA #$2f
48e4 : c8 __ __ INY
48e5 : 91 23 __ STA (SP + 0),y ; (chars + 1)
48e7 : 20 6d 45 JSR $456d ; (vdcwin_printline.s1000 + 0)
.s1001:
48ea : 18 __ __ CLC
48eb : a5 23 __ LDA SP + 0 ; (chars + 1)
48ed : 69 06 __ ADC #$06
48ef : 85 23 __ STA SP + 0 ; (chars + 1)
48f1 : 90 02 __ BCC $48f5 ; (vdcwin_put_chars.s1001 + 11)
48f3 : e6 24 __ INC SP + 1 ; (num + 0)
48f5 : a2 04 __ LDX #$04
48f7 : bd e7 bf LDA $bfe7,x ; (vp_fill + 29)
48fa : 95 53 __ STA T0 + 0,x 
48fc : ca __ __ DEX
48fd : 10 f8 __ BPL $48f7 ; (vdcwin_put_chars.s1001 + 13)
48ff : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_chars: ; vdcwin_putat_chars(struct VDCWin*,u8,u8,const u8*,u8)->void
.s0:
4900 : ad f6 bf LDA $bff6 ; (sstack + 6)
4903 : f0 4e __ BEQ $4953 ; (vdcwin_putat_chars.s1001 + 0)
.s7:
4905 : 85 45 __ STA T0 + 0 
4907 : ad f4 bf LDA $bff4 ; (sstack + 4)
490a : 85 47 __ STA T4 + 0 
490c : ad f5 bf LDA $bff5 ; (sstack + 5)
490f : 85 48 __ STA T4 + 1 
4911 : ad f0 bf LDA $bff0 ; (sstack + 0)
4914 : 85 49 __ STA T5 + 0 
4916 : ad f1 bf LDA $bff1 ; (sstack + 1)
4919 : 85 4a __ STA T5 + 1 
491b : a0 00 __ LDY #$00
.l1004:
491d : 84 46 __ STY T1 + 0 
491f : b1 47 __ LDA (T4 + 0),y 
4921 : 4a __ __ LSR
4922 : 4a __ __ LSR
4923 : 4a __ __ LSR
4924 : 4a __ __ LSR
4925 : 4a __ __ LSR
4926 : aa __ __ TAX
4927 : bd f6 5b LDA $5bf6,x ; (p2smap + 0)
492a : 51 47 __ EOR (T4 + 0),y 
492c : 85 16 __ STA P9 
492e : a0 00 __ LDY #$00
4930 : b1 49 __ LDA (T5 + 0),y 
4932 : 18 __ __ CLC
4933 : 6d f2 bf ADC $bff2 ; (sstack + 2)
4936 : 18 __ __ CLC
4937 : 65 46 __ ADC T1 + 0 
4939 : 85 14 __ STA P7 
493b : c8 __ __ INY
493c : b1 49 __ LDA (T5 + 0),y 
493e : 18 __ __ CLC
493f : 6d f3 bf ADC $bff3 ; (sstack + 3)
4942 : 85 15 __ STA P8 
4944 : ad 66 60 LDA $6066 ; (vdc_state + 7)
4947 : 85 17 __ STA P10 
4949 : 20 28 35 JSR $3528 ; (vdc_printc.s0 + 0)
494c : a4 46 __ LDY T1 + 0 
494e : c8 __ __ INY
494f : c4 45 __ CPY T0 + 0 
4951 : 90 ca __ BCC $491d ; (vdcwin_putat_chars.l1004 + 0)
.s1001:
4953 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_char: ; vdcwin_put_char(struct VDCWin*,u8)->void
.s1000:
4954 : a2 03 __ LDX #$03
4956 : b5 53 __ LDA T0 + 0,x 
4958 : 9d e8 bf STA $bfe8,x ; (vp_fill + 30)
495b : ca __ __ DEX
495c : 10 f8 __ BPL $4956 ; (vdcwin_put_char.s1000 + 2)
495e : 38 __ __ SEC
495f : a5 23 __ LDA SP + 0 
4961 : e9 06 __ SBC #$06
4963 : 85 23 __ STA SP + 0 
4965 : b0 02 __ BCS $4969 ; (vdcwin_put_char.s0 + 0)
4967 : c6 24 __ DEC SP + 1 
.s0:
4969 : ad f7 bf LDA $bff7 ; (sstack + 7)
496c : 85 53 __ STA T0 + 0 
496e : 8d f0 bf STA $bff0 ; (sstack + 0)
4971 : ad f8 bf LDA $bff8 ; (sstack + 8)
4974 : 85 54 __ STA T0 + 1 
4976 : 8d f1 bf STA $bff1 ; (sstack + 1)
4979 : a0 04 __ LDY #$04
497b : b1 53 __ LDA (T0 + 0),y 
497d : 85 55 __ STA T1 + 0 
497f : 8d f2 bf STA $bff2 ; (sstack + 2)
4982 : c8 __ __ INY
4983 : b1 53 __ LDA (T0 + 0),y 
4985 : 85 56 __ STA T2 + 0 
4987 : 8d f3 bf STA $bff3 ; (sstack + 3)
498a : ad f9 bf LDA $bff9 ; (sstack + 9)
498d : 8d f4 bf STA $bff4 ; (sstack + 4)
4990 : 20 e9 49 JSR $49e9 ; (vdcwin_putat_char.s0 + 0)
4993 : a6 55 __ LDX T1 + 0 
4995 : e8 __ __ INX
4996 : 8a __ __ TXA
4997 : a0 04 __ LDY #$04
4999 : 91 53 __ STA (T0 + 0),y 
499b : a0 02 __ LDY #$02
499d : d1 53 __ CMP (T0 + 0),y 
499f : d0 32 __ BNE $49d3 ; (vdcwin_put_char.s1001 + 0)
.s1:
49a1 : a9 00 __ LDA #$00
49a3 : a0 04 __ LDY #$04
49a5 : 91 53 __ STA (T0 + 0),y 
49a7 : 18 __ __ CLC
49a8 : a5 56 __ LDA T2 + 0 
49aa : 69 01 __ ADC #$01
49ac : c8 __ __ INY
49ad : 91 53 __ STA (T0 + 0),y 
49af : a0 03 __ LDY #$03
49b1 : d1 53 __ CMP (T0 + 0),y 
49b3 : d0 1e __ BNE $49d3 ; (vdcwin_put_char.s1001 + 0)
.s4:
49b5 : a5 56 __ LDA T2 + 0 
49b7 : a0 05 __ LDY #$05
49b9 : 91 53 __ STA (T0 + 0),y 
49bb : a5 53 __ LDA T0 + 0 
49bd : a0 02 __ LDY #$02
49bf : 91 23 __ STA (SP + 0),y 
49c1 : a5 54 __ LDA T0 + 1 
49c3 : c8 __ __ INY
49c4 : 91 23 __ STA (SP + 0),y 
49c6 : a9 fd __ LDA #$fd
49c8 : c8 __ __ INY
49c9 : 91 23 __ STA (SP + 0),y 
49cb : a9 2f __ LDA #$2f
49cd : c8 __ __ INY
49ce : 91 23 __ STA (SP + 0),y 
49d0 : 20 6d 45 JSR $456d ; (vdcwin_printline.s1000 + 0)
.s1001:
49d3 : 18 __ __ CLC
49d4 : a5 23 __ LDA SP + 0 
49d6 : 69 06 __ ADC #$06
49d8 : 85 23 __ STA SP + 0 
49da : 90 02 __ BCC $49de ; (vdcwin_put_char.s1001 + 11)
49dc : e6 24 __ INC SP + 1 
49de : a2 03 __ LDX #$03
49e0 : bd e8 bf LDA $bfe8,x ; (vp_fill + 30)
49e3 : 95 53 __ STA T0 + 0,x 
49e5 : ca __ __ DEX
49e6 : 10 f8 __ BPL $49e0 ; (vdcwin_put_char.s1001 + 13)
49e8 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_char: ; vdcwin_putat_char(struct VDCWin*,u8,u8,u8)->void
.s0:
49e9 : ad f4 bf LDA $bff4 ; (sstack + 4)
49ec : 4a __ __ LSR
49ed : 4a __ __ LSR
49ee : 4a __ __ LSR
49ef : 4a __ __ LSR
49f0 : 4a __ __ LSR
49f1 : aa __ __ TAX
49f2 : bd f6 5b LDA $5bf6,x ; (p2smap + 0)
49f5 : 4d f4 bf EOR $bff4 ; (sstack + 4)
49f8 : 85 16 __ STA P9 
49fa : ad f0 bf LDA $bff0 ; (sstack + 0)
49fd : 85 45 __ STA T1 + 0 
49ff : ad f1 bf LDA $bff1 ; (sstack + 1)
4a02 : 85 46 __ STA T1 + 1 
4a04 : ad f2 bf LDA $bff2 ; (sstack + 2)
4a07 : 18 __ __ CLC
4a08 : a0 00 __ LDY #$00
4a0a : 71 45 __ ADC (T1 + 0),y 
4a0c : 85 14 __ STA P7 
4a0e : ad f3 bf LDA $bff3 ; (sstack + 3)
4a11 : 18 __ __ CLC
4a12 : c8 __ __ INY
4a13 : 71 45 __ ADC (T1 + 0),y 
4a15 : 85 15 __ STA P8 
4a17 : ad 66 60 LDA $6066 ; (vdc_state + 7)
4a1a : 85 17 __ STA P10 
4a1c : 4c 28 35 JMP $3528 ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
viewport_demo: ; viewport_demo(u8)->void
.s1000:
4a1f : a2 03 __ LDX #$03
4a21 : b5 53 __ LDA T0 + 0,x 
4a23 : 9d 9e bf STA $bf9e,x ; (nouns + 29)
4a26 : ca __ __ DEX
4a27 : 10 f8 __ BPL $4a21 ; (viewport_demo.s1000 + 2)
.s0:
4a29 : a9 00 __ LDA #$00
4a2b : 8d fa bf STA $bffa ; (sstack + 10)
4a2e : 8d fb bf STA $bffb ; (sstack + 11)
4a31 : ad fc bf LDA $bffc ; (sstack + 12)
4a34 : 85 53 __ STA T0 + 0 
4a36 : 8d f9 bf STA $bff9 ; (sstack + 9)
4a39 : 20 d0 4b JSR $4bd0 ; (screen_switch.s1000 + 0)
4a3c : a5 1b __ LDA ACCU + 0 
4a3e : d0 0b __ BNE $4a4b ; (viewport_demo.s3 + 0)
.s1001:
4a40 : a2 03 __ LDX #$03
4a42 : bd 9e bf LDA $bf9e,x ; (nouns + 29)
4a45 : 95 53 __ STA T0 + 0,x 
4a47 : ca __ __ DEX
4a48 : 10 f8 __ BPL $4a42 ; (viewport_demo.s1001 + 2)
4a4a : 60 __ __ RTS
.s3:
4a4b : a9 00 __ LDA #$00
4a4d : 8d f1 bf STA $bff1 ; (sstack + 1)
4a50 : a9 03 __ LDA #$03
4a52 : 8d f2 bf STA $bff2 ; (sstack + 2)
4a55 : a9 8c __ LDA #$8c
4a57 : 8d f3 bf STA $bff3 ; (sstack + 3)
4a5a : a9 4d __ LDA #$4d
4a5c : 8d f4 bf STA $bff4 ; (sstack + 4)
4a5f : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
4a62 : a9 05 __ LDA #$05
4a64 : 85 11 __ STA P4 
4a66 : 85 12 __ STA P5 
4a68 : a9 46 __ LDA #$46
4a6a : 85 13 __ STA P6 
4a6c : a9 ba __ LDA #$ba
4a6e : 85 0f __ STA P2 
4a70 : a9 bf __ LDA #$bf
4a72 : 85 10 __ STA P3 
4a74 : ad 64 60 LDA $6064 ; (vdc_state + 5)
4a77 : 38 __ __ SEC
4a78 : e9 07 __ SBC #$07
4a7a : 85 54 __ STA T3 + 0 
4a7c : 85 14 __ STA P7 
4a7e : ad 65 60 LDA $6065 ; (vdc_state + 6)
4a81 : e9 00 __ SBC #$00
4a83 : 85 55 __ STA T3 + 1 
4a85 : 20 bf 32 JSR $32bf ; (vdcwin_init.s0 + 0)
4a88 : a9 ba __ LDA #$ba
4a8a : 8d f1 bf STA $bff1 ; (sstack + 1)
4a8d : a9 bf __ LDA #$bf
4a8f : 8d f2 bf STA $bff2 ; (sstack + 2)
4a92 : a9 f0 __ LDA #$f0
4a94 : 8d f3 bf STA $bff3 ; (sstack + 3)
4a97 : 20 10 33 JSR $3310 ; (vdcwin_border_clear.s0 + 0)
4a9a : a9 7f __ LDA #$7f
4a9c : 85 17 __ STA P10 
4a9e : a9 46 __ LDA #$46
4aa0 : 8d f6 bf STA $bff6 ; (sstack + 6)
4aa3 : a5 54 __ LDA T3 + 0 
4aa5 : 8d f8 bf STA $bff8 ; (sstack + 8)
4aa8 : a5 55 __ LDA T3 + 1 
4aaa : 8d f9 bf STA $bff9 ; (sstack + 9)
4aad : a9 05 __ LDA #$05
4aaf : 8d fa bf STA $bffa ; (sstack + 10)
4ab2 : 8d fb bf STA $bffb ; (sstack + 11)
4ab5 : a9 a5 __ LDA #$a5
4ab7 : 85 15 __ STA P8 
4ab9 : a9 bf __ LDA #$bf
4abb : 85 16 __ STA P9 
4abd : a9 00 __ LDA #$00
4abf : 8d f7 bf STA $bff7 ; (sstack + 7)
4ac2 : 8d f0 bf STA $bff0 ; (sstack + 0)
4ac5 : a9 40 __ LDA #$40
4ac7 : 8d f1 bf STA $bff1 ; (sstack + 1)
4aca : a5 53 __ LDA T0 + 0 
4acc : 0a __ __ ASL
4acd : 85 54 __ STA T3 + 0 
4acf : 85 56 __ STA T4 + 0 
4ad1 : aa __ __ TAX
4ad2 : bd 53 60 LDA $6053,x ; (screenset + 0)
4ad5 : 8d f2 bf STA $bff2 ; (sstack + 2)
4ad8 : bd 54 60 LDA $6054,x ; (screenset + 1)
4adb : 8d f4 bf STA $bff4 ; (sstack + 4)
4ade : a9 00 __ LDA #$00
4ae0 : 8d f3 bf STA $bff3 ; (sstack + 3)
4ae3 : 8d f5 bf STA $bff5 ; (sstack + 5)
4ae6 : 20 e1 37 JSR $37e1 ; (vdcwin_viewport_init.s0 + 0)
4ae9 : a9 a5 __ LDA #$a5
4aeb : 8d f0 bf STA $bff0 ; (sstack + 0)
4aee : a9 bf __ LDA #$bf
4af0 : 8d f1 bf STA $bff1 ; (sstack + 1)
4af3 : 20 37 39 JSR $3937 ; (vdcwin_cpy_viewport.s0 + 0)
.l5:
4af6 : 20 f0 29 JSR $29f0 ; (getch.s0 + 0)
4af9 : 85 53 __ STA T0 + 0 
4afb : a9 00 __ LDA #$00
4afd : 85 43 __ STA T1 + 0 
4aff : a5 53 __ LDA T0 + 0 
4b01 : c9 57 __ CMP #$57
4b03 : f0 04 __ BEQ $4b09 ; (viewport_demo.s10 + 0)
.s11:
4b05 : c9 91 __ CMP #$91
4b07 : d0 11 __ BNE $4b1a ; (viewport_demo.s9 + 0)
.s10:
4b09 : ad ae bf LDA $bfae ; (nouns + 45)
4b0c : 0d af bf ORA $bfaf ; (nouns + 46)
4b0f : f0 09 __ BEQ $4b1a ; (viewport_demo.s9 + 0)
.s7:
4b11 : a9 08 __ LDA #$08
4b13 : 85 43 __ STA T1 + 0 
4b15 : a5 53 __ LDA T0 + 0 
4b17 : 4c 20 4b JMP $4b20 ; (viewport_demo.s16 + 0)
.s9:
4b1a : a5 53 __ LDA T0 + 0 
4b1c : c9 53 __ CMP #$53
4b1e : f0 04 __ BEQ $4b24 ; (viewport_demo.s15 + 0)
.s16:
4b20 : c9 11 __ CMP #$11
4b22 : d0 2f __ BNE $4b53 ; (viewport_demo.s14 + 0)
.s15:
4b24 : a6 54 __ LDX T3 + 0 
4b26 : bd 54 60 LDA $6054,x ; (screenset + 1)
4b29 : 38 __ __ SEC
4b2a : ed 64 60 SBC $6064 ; (vdc_state + 5)
4b2d : a8 __ __ TAY
4b2e : a9 00 __ LDA #$00
4b30 : ed 65 60 SBC $6065 ; (vdc_state + 6)
4b33 : aa __ __ TAX
4b34 : 98 __ __ TYA
4b35 : 18 __ __ CLC
4b36 : 69 06 __ ADC #$06
4b38 : 85 1b __ STA ACCU + 0 
4b3a : 90 01 __ BCC $4b3d ; (viewport_demo.s1027 + 0)
.s1026:
4b3c : e8 __ __ INX
.s1027:
4b3d : 86 1c __ STX ACCU + 1 
4b3f : ad af bf LDA $bfaf ; (nouns + 46)
4b42 : c5 1c __ CMP ACCU + 1 
4b44 : d0 05 __ BNE $4b4b ; (viewport_demo.s1017 + 0)
.s1016:
4b46 : ad ae bf LDA $bfae ; (nouns + 45)
4b49 : c5 1b __ CMP ACCU + 0 
.s1017:
4b4b : b0 06 __ BCS $4b53 ; (viewport_demo.s14 + 0)
.s12:
4b4d : a5 43 __ LDA T1 + 0 
4b4f : 09 04 __ ORA #$04
4b51 : 85 43 __ STA T1 + 0 
.s14:
4b53 : a5 53 __ LDA T0 + 0 
4b55 : c9 41 __ CMP #$41
4b57 : f0 04 __ BEQ $4b5d ; (viewport_demo.s20 + 0)
.s21:
4b59 : c9 9d __ CMP #$9d
4b5b : d0 0e __ BNE $4b6b ; (viewport_demo.s19 + 0)
.s20:
4b5d : ad ac bf LDA $bfac ; (nouns + 43)
4b60 : 0d ad bf ORA $bfad ; (nouns + 44)
4b63 : f0 06 __ BEQ $4b6b ; (viewport_demo.s19 + 0)
.s17:
4b65 : a5 43 __ LDA T1 + 0 
4b67 : 09 01 __ ORA #$01
4b69 : 85 43 __ STA T1 + 0 
.s19:
4b6b : a5 53 __ LDA T0 + 0 
4b6d : c9 44 __ CMP #$44
4b6f : f0 04 __ BEQ $4b75 ; (viewport_demo.s25 + 0)
.s26:
4b71 : c9 1d __ CMP #$1d
4b73 : d0 24 __ BNE $4b99 ; (viewport_demo.s24 + 0)
.s25:
4b75 : a6 56 __ LDX T4 + 0 
4b77 : bd 53 60 LDA $6053,x ; (screenset + 0)
4b7a : 38 __ __ SEC
4b7b : e9 47 __ SBC #$47
4b7d : 85 1b __ STA ACCU + 0 
4b7f : a9 00 __ LDA #$00
4b81 : e9 00 __ SBC #$00
4b83 : 85 1c __ STA ACCU + 1 
4b85 : ad ad bf LDA $bfad ; (nouns + 44)
4b88 : c5 1c __ CMP ACCU + 1 
4b8a : d0 05 __ BNE $4b91 ; (viewport_demo.s1007 + 0)
.s1006:
4b8c : ad ac bf LDA $bfac ; (nouns + 43)
4b8f : c5 1b __ CMP ACCU + 0 
.s1007:
4b91 : b0 06 __ BCS $4b99 ; (viewport_demo.s24 + 0)
.s22:
4b93 : a5 43 __ LDA T1 + 0 
4b95 : 09 02 __ ORA #$02
4b97 : 90 04 __ BCC $4b9d ; (viewport_demo.s27 + 0)
.s24:
4b99 : a5 43 __ LDA T1 + 0 
4b9b : f0 10 __ BEQ $4bad ; (viewport_demo.s29 + 0)
.s27:
4b9d : 8d f9 bf STA $bff9 ; (sstack + 9)
4ba0 : a9 a5 __ LDA #$a5
4ba2 : 8d f7 bf STA $bff7 ; (sstack + 7)
4ba5 : a9 bf __ LDA #$bf
4ba7 : 8d f8 bf STA $bff8 ; (sstack + 8)
4baa : 20 c1 4d JSR $4dc1 ; (vdcwin_viewportscroll.s1000 + 0)
.s29:
4bad : a5 53 __ LDA T0 + 0 
4baf : c9 1b __ CMP #$1b
4bb1 : f0 07 __ BEQ $4bba ; (viewport_demo.s6 + 0)
.s30:
4bb3 : c9 03 __ CMP #$03
4bb5 : f0 03 __ BEQ $4bba ; (viewport_demo.s6 + 0)
4bb7 : 4c f6 4a JMP $4af6 ; (viewport_demo.l5 + 0)
.s6:
4bba : a9 01 __ LDA #$01
4bbc : 8d fa bf STA $bffa ; (sstack + 10)
4bbf : a9 00 __ LDA #$00
4bc1 : 8d fb bf STA $bffb ; (sstack + 11)
4bc4 : ad fc bf LDA $bffc ; (sstack + 12)
4bc7 : 8d f9 bf STA $bff9 ; (sstack + 9)
4bca : 20 d0 4b JSR $4bd0 ; (screen_switch.s1000 + 0)
4bcd : 4c 40 4a JMP $4a40 ; (viewport_demo.s1001 + 0)
--------------------------------------------------------------------
screen_switch: ; screen_switch(u8,u8,u8)->u8
.s1000:
4bd0 : a5 53 __ LDA T1 + 0 
4bd2 : 8d ce bf STA $bfce ; (wrapbuffer + 56)
4bd5 : a5 54 __ LDA T2 + 0 
4bd7 : 8d cf bf STA $bfcf ; (wrapbuffer + 57)
4bda : a5 55 __ LDA T3 + 0 
4bdc : 8d d0 bf STA $bfd0 ; (wrapbuffer + 58)
.s0:
4bdf : a9 00 __ LDA #$00
4be1 : 8d f1 bf STA $bff1 ; (sstack + 1)
4be4 : a9 02 __ LDA #$02
4be6 : 8d f2 bf STA $bff2 ; (sstack + 2)
4be9 : a9 20 __ LDA #$20
4beb : 8d f3 bf STA $bff3 ; (sstack + 3)
4bee : a9 50 __ LDA #$50
4bf0 : 8d f4 bf STA $bff4 ; (sstack + 4)
4bf3 : ae 64 60 LDX $6064 ; (vdc_state + 5)
4bf6 : ca __ __ DEX
4bf7 : ca __ __ DEX
4bf8 : 8e f5 bf STX $bff5 ; (sstack + 5)
4bfb : 20 ee 21 JSR $21ee ; (vdc_clear.s0 + 0)
4bfe : a9 00 __ LDA #$00
4c00 : 8d f1 bf STA $bff1 ; (sstack + 1)
4c03 : a9 03 __ LDA #$03
4c05 : 8d f2 bf STA $bff2 ; (sstack + 2)
4c08 : a9 12 __ LDA #$12
4c0a : 8d f3 bf STA $bff3 ; (sstack + 3)
4c0d : a9 4d __ LDA #$4d
4c0f : 8d f4 bf STA $bff4 ; (sstack + 4)
4c12 : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
4c15 : a9 01 __ LDA #$01
4c17 : 85 53 __ STA T1 + 0 
4c19 : a9 00 __ LDA #$00
4c1b : cd f9 bf CMP $bff9 ; (sstack + 9)
4c1e : 2a __ __ ROL
4c1f : 85 55 __ STA T3 + 0 
4c21 : d0 0a __ BNE $4c2d ; (screen_switch.s1 + 0)
.s4:
4c23 : ad f9 bf LDA $bff9 ; (sstack + 9)
4c26 : c9 02 __ CMP #$02
4c28 : f0 03 __ BEQ $4c2d ; (screen_switch.s1 + 0)
4c2a : 4c af 4c JMP $4caf ; (screen_switch.s3 + 0)
.s1:
4c2d : 20 97 14 JSR $1497 ; (sid_pausemusic.s0 + 0)
4c30 : a9 01 __ LDA #$01
4c32 : 85 10 __ STA P3 
4c34 : ad fe 5b LDA $5bfe ; (bootdevice + 0)
4c37 : 85 54 __ STA T2 + 0 
4c39 : 85 0f __ STA P2 
4c3b : a9 00 __ LDA #$00
4c3d : 85 11 __ STA P4 
4c3f : a9 40 __ LDA #$40
4c41 : 85 12 __ STA P5 
4c43 : ad fa bf LDA $bffa ; (sstack + 10)
4c46 : f0 07 __ BEQ $4c4f ; (screen_switch.s6 + 0)
.s5:
4c48 : a9 2f __ LDA #$2f
4c4a : a0 e2 __ LDY #$e2
4c4c : 4c 95 4c JMP $4c95 ; (screen_switch.s29 + 0)
.s6:
4c4f : a5 55 __ LDA T3 + 0 
4c51 : f0 03 __ BEQ $4c56 ; (screen_switch.s12 + 0)
4c53 : 4c df 4c JMP $4cdf ; (screen_switch.s11 + 0)
.s12:
4c56 : a9 73 __ LDA #$73
4c58 : 85 13 __ STA P6 
4c5a : a9 4d __ LDA #$4d
4c5c : 85 14 __ STA P7 
4c5e : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
4c61 : a5 1b __ LDA ACCU + 0 
4c63 : d0 05 __ BNE $4c6a ; (screen_switch.s22 + 0)
.s20:
4c65 : 20 1f 30 JSR $301f ; (menu_fileerrormessage.s1000 + 0)
4c68 : c6 53 __ DEC T1 + 0 
.s22:
4c6a : a9 00 __ LDA #$00
4c6c : 8d f1 bf STA $bff1 ; (sstack + 1)
4c6f : a9 04 __ LDA #$04
4c71 : 8d f2 bf STA $bff2 ; (sstack + 2)
4c74 : a9 7b __ LDA #$7b
4c76 : 8d f3 bf STA $bff3 ; (sstack + 3)
4c79 : a9 4d __ LDA #$4d
4c7b : 8d f4 bf STA $bff4 ; (sstack + 4)
4c7e : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
4c81 : a5 54 __ LDA T2 + 0 
4c83 : 85 0f __ STA P2 
4c85 : a9 01 __ LDA #$01
4c87 : 85 10 __ STA P3 
4c89 : a9 00 __ LDA #$00
4c8b : 85 11 __ STA P4 
4c8d : a9 a0 __ LDA #$a0
4c8f : 85 12 __ STA P5 
4c91 : a9 3f __ LDA #$3f
4c93 : a0 f9 __ LDY #$f9
.s29:
4c95 : 84 13 __ STY P6 
4c97 : 85 14 __ STA P7 
4c99 : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
4c9c : a5 1b __ LDA ACCU + 0 
4c9e : d0 0c __ BNE $4cac ; (screen_switch.s35 + 0)
.s8:
4ca0 : 20 1f 30 JSR $301f ; (menu_fileerrormessage.s1000 + 0)
4ca3 : 20 97 14 JSR $1497 ; (sid_pausemusic.s0 + 0)
4ca6 : a9 00 __ LDA #$00
4ca8 : 85 53 __ STA T1 + 0 
4caa : f0 03 __ BEQ $4caf ; (screen_switch.s3 + 0)
.s35:
4cac : 20 97 14 JSR $1497 ; (sid_pausemusic.s0 + 0)
.s3:
4caf : a9 00 __ LDA #$00
4cb1 : 8d f1 bf STA $bff1 ; (sstack + 1)
4cb4 : a9 03 __ LDA #$03
4cb6 : 8d f2 bf STA $bff2 ; (sstack + 2)
4cb9 : a9 20 __ LDA #$20
4cbb : 8d f3 bf STA $bff3 ; (sstack + 3)
4cbe : a9 50 __ LDA #$50
4cc0 : 8d f4 bf STA $bff4 ; (sstack + 4)
4cc3 : a9 02 __ LDA #$02
4cc5 : 8d f5 bf STA $bff5 ; (sstack + 5)
4cc8 : 20 ee 21 JSR $21ee ; (vdc_clear.s0 + 0)
4ccb : a5 53 __ LDA T1 + 0 
4ccd : 85 1b __ STA ACCU + 0 
.s1001:
4ccf : ad ce bf LDA $bfce ; (wrapbuffer + 56)
4cd2 : 85 53 __ STA T1 + 0 
4cd4 : ad cf bf LDA $bfcf ; (wrapbuffer + 57)
4cd7 : 85 54 __ STA T2 + 0 
4cd9 : ad d0 bf LDA $bfd0 ; (wrapbuffer + 58)
4cdc : 85 55 __ STA T3 + 0 
4cde : 60 __ __ RTS
.s11:
4cdf : a9 27 __ LDA #$27
4ce1 : 85 13 __ STA P6 
4ce3 : a9 4d __ LDA #$4d
4ce5 : 85 14 __ STA P7 
4ce7 : 20 63 13 JSR $1363 ; (bnk_load.s0 + 0)
4cea : a5 1b __ LDA ACCU + 0 
4cec : d0 05 __ BNE $4cf3 ; (screen_switch.s31 + 0)
.s14:
4cee : 20 1f 30 JSR $301f ; (menu_fileerrormessage.s1000 + 0)
4cf1 : c6 53 __ DEC T1 + 0 
.s31:
4cf3 : ad fb bf LDA $bffb ; (sstack + 11)
4cf6 : d0 b4 __ BNE $4cac ; (screen_switch.s35 + 0)
.s17:
4cf8 : 8d f1 bf STA $bff1 ; (sstack + 1)
4cfb : ae 64 60 LDX $6064 ; (vdc_state + 5)
4cfe : ca __ __ DEX
4cff : 8e f2 bf STX $bff2 ; (sstack + 2)
4d02 : a9 2f __ LDA #$2f
4d04 : 8d f3 bf STA $bff3 ; (sstack + 3)
4d07 : a9 4d __ LDA #$4d
4d09 : 8d f4 bf STA $bff4 ; (sstack + 4)
4d0c : 20 55 2e JSR $2e55 ; (vdc_prints.s0 + 0)
4d0f : 4c ac 4c JMP $4cac ; (screen_switch.s35 + 0)
--------------------------------------------------------------------
4d12 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 53 43 52 45 45 4e 20 44 : lOADING SCREEN D
4d22 : __ __ __ BYT 41 54 41 2e 00                                  : ATA..
--------------------------------------------------------------------
4d27 : __ __ __ BYT 53 43 52 45 45 4e 31 00                         : SCREEN1.
--------------------------------------------------------------------
4d2f : __ __ __ BYT 70 45 54 53 43 49 49 20 41 52 54 20 43 52 45 44 : pETSCII ART CRED
4d3f : __ __ __ BYT 49 54 3a 20 27 6c 4f 56 45 20 49 53 20 54 48 45 : IT: 'lOVE IS THE
4d4f : __ __ __ BYT 20 44 52 55 47 27 20 61 54 4c 41 4e 54 49 53 2c :  DRUG' aTLANTIS,
4d5f : __ __ __ BYT 20 32 30 32 33 2c 20 61 52 54 20 42 59 20 6c 4f :  2023, aRT BY lO
4d6f : __ __ __ BYT 42 4f 2e 00                                     : BO..
--------------------------------------------------------------------
4d73 : __ __ __ BYT 53 43 52 45 45 4e 33 00                         : SCREEN3.
--------------------------------------------------------------------
4d7b : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 43 48 41 52 53 45 54 2e : lOADING CHARSET.
4d8b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4d8c : __ __ __ BYT 6d 4f 56 45 20 42 59 20 77 2c 61 2c 73 2c 64 20 : mOVE BY w,a,s,d 
4d9c : __ __ __ BYT 4f 52 20 43 55 52 53 4f 52 20 4b 45 59 53 2e 20 : OR CURSOR KEYS. 
4dac : __ __ __ BYT 65 73 63 20 4f 52 20 73 74 6f 70 20 54 4f 20 45 : esc OR stop TO E
4dbc : __ __ __ BYT 58 49 54 2e 00                                  : XIT..
--------------------------------------------------------------------
vdcwin_viewportscroll: ; vdcwin_viewportscroll(struct VDCViewport*,u8)->void
.s1000:
4dc1 : a5 53 __ LDA T0 + 0 
4dc3 : 8d c4 bf STA $bfc4 ; (nouns + 67)
4dc6 : a5 54 __ LDA T0 + 1 
4dc8 : 8d c5 bf STA $bfc5 ; (nouns + 68)
4dcb : a5 55 __ LDA T2 + 0 
4dcd : 8d c6 bf STA $bfc6 ; (nouns + 69)
.s0:
4dd0 : ad f7 bf LDA $bff7 ; (sstack + 7)
4dd3 : 85 53 __ STA T0 + 0 
4dd5 : ad f8 bf LDA $bff8 ; (sstack + 8)
4dd8 : 85 54 __ STA T0 + 1 
4dda : a9 ca __ LDA #$ca
4ddc : 85 1f __ STA ADDR + 0 
4dde : a9 bf __ LDA #$bf
4de0 : 85 20 __ STA ADDR + 1 ; (viewport + 0)
4de2 : a0 14 __ LDY #$14
.l1002:
4de4 : b1 53 __ LDA (T0 + 0),y 
4de6 : 99 ca bf STA $bfca,y ; (nouns + 73)
4de9 : 88 __ __ DEY
4dea : 10 f8 __ BPL $4de4 ; (vdcwin_viewportscroll.l1002 + 0)
.s1003:
4dec : ad f9 bf LDA $bff9 ; (sstack + 9)
4def : 85 55 __ STA T2 + 0 
4df1 : 4a __ __ LSR
4df2 : 90 54 __ BCC $4e48 ; (vdcwin_viewportscroll.s14 + 0)
.s1:
4df4 : a9 01 __ LDA #$01
4df6 : 8d f6 bf STA $bff6 ; (sstack + 6)
4df9 : a5 53 __ LDA T0 + 0 
4dfb : 69 0a __ ADC #$0a
4dfd : 8d f4 bf STA $bff4 ; (sstack + 4)
4e00 : a5 54 __ LDA T0 + 1 
4e02 : 69 00 __ ADC #$00
4e04 : 8d f5 bf STA $bff5 ; (sstack + 5)
4e07 : 20 89 4f JSR $4f89 ; (vdcwin_scroll_right.s1000 + 0)
4e0a : a9 01 __ LDA #$01
4e0c : 85 13 __ STA P6 
4e0e : a0 0b __ LDY #$0b
4e10 : b1 53 __ LDA (T0 + 0),y 
4e12 : 85 11 __ STA P4 
4e14 : c8 __ __ INY
4e15 : b1 53 __ LDA (T0 + 0),y 
4e17 : 85 12 __ STA P5 
4e19 : a0 0e __ LDY #$0e
4e1b : b1 53 __ LDA (T0 + 0),y 
4e1d : 85 14 __ STA P7 
4e1f : ad d1 bf LDA $bfd1 ; (wrapbuffer + 59)
4e22 : 18 __ __ CLC
4e23 : 69 ff __ ADC #$ff
4e25 : 8d d1 bf STA $bfd1 ; (wrapbuffer + 59)
4e28 : b0 03 __ BCS $4e2d ; (vdcwin_viewportscroll.s1005 + 0)
.s1004:
4e2a : ce d2 bf DEC $bfd2 ; (wrapbuffer + 60)
.s1005:
4e2d : 18 __ __ CLC
4e2e : a0 07 __ LDY #$07
4e30 : b1 53 __ LDA (T0 + 0),y 
4e32 : 69 ff __ ADC #$ff
4e34 : 91 53 __ STA (T0 + 0),y 
4e36 : c8 __ __ INY
4e37 : b1 53 __ LDA (T0 + 0),y 
4e39 : 69 ff __ ADC #$ff
4e3b : 91 53 __ STA (T0 + 0),y 
4e3d : a9 d5 __ LDA #$d5
4e3f : 85 0f __ STA P2 
4e41 : a9 bf __ LDA #$bf
4e43 : 85 10 __ STA P3 
4e45 : 20 bf 32 JSR $32bf ; (vdcwin_init.s0 + 0)
.s14:
4e48 : a5 55 __ LDA T2 + 0 
4e4a : 29 02 __ AND #$02
4e4c : f0 5f __ BEQ $4ead ; (vdcwin_viewportscroll.s15 + 0)
.s4:
4e4e : a9 01 __ LDA #$01
4e50 : 8d f6 bf STA $bff6 ; (sstack + 6)
4e53 : 18 __ __ CLC
4e54 : a5 53 __ LDA T0 + 0 
4e56 : 69 0b __ ADC #$0b
4e58 : 8d f4 bf STA $bff4 ; (sstack + 4)
4e5b : a5 54 __ LDA T0 + 1 
4e5d : 69 00 __ ADC #$00
4e5f : 8d f5 bf STA $bff5 ; (sstack + 5)
4e62 : 20 1e 51 JSR $511e ; (vdcwin_scroll_left.s0 + 0)
4e65 : a9 01 __ LDA #$01
4e67 : 85 13 __ STA P6 
4e69 : a0 0c __ LDY #$0c
4e6b : b1 53 __ LDA (T0 + 0),y 
4e6d : 85 12 __ STA P5 
4e6f : a0 0e __ LDY #$0e
4e71 : b1 53 __ LDA (T0 + 0),y 
4e73 : 85 14 __ STA P7 
4e75 : 88 __ __ DEY
4e76 : b1 53 __ LDA (T0 + 0),y 
4e78 : 85 43 __ STA T1 + 0 
4e7a : 18 __ __ CLC
4e7b : 6d d1 bf ADC $bfd1 ; (wrapbuffer + 59)
4e7e : 8d d1 bf STA $bfd1 ; (wrapbuffer + 59)
4e81 : 90 03 __ BCC $4e86 ; (vdcwin_viewportscroll.s1007 + 0)
.s1006:
4e83 : ee d2 bf INC $bfd2 ; (wrapbuffer + 60)
.s1007:
4e86 : 18 __ __ CLC
4e87 : a0 07 __ LDY #$07
4e89 : b1 53 __ LDA (T0 + 0),y 
4e8b : 69 01 __ ADC #$01
4e8d : 91 53 __ STA (T0 + 0),y 
4e8f : c8 __ __ INY
4e90 : b1 53 __ LDA (T0 + 0),y 
4e92 : 69 00 __ ADC #$00
4e94 : 91 53 __ STA (T0 + 0),y 
4e96 : a9 d5 __ LDA #$d5
4e98 : 85 0f __ STA P2 
4e9a : a9 bf __ LDA #$bf
4e9c : 85 10 __ STA P3 
4e9e : a0 0b __ LDY #$0b
4ea0 : b1 53 __ LDA (T0 + 0),y 
4ea2 : 18 __ __ CLC
4ea3 : 65 43 __ ADC T1 + 0 
4ea5 : 38 __ __ SEC
4ea6 : e9 01 __ SBC #$01
4ea8 : 85 11 __ STA P4 
4eaa : 20 bf 32 JSR $32bf ; (vdcwin_init.s0 + 0)
.s15:
4ead : a5 55 __ LDA T2 + 0 
4eaf : 29 08 __ AND #$08
4eb1 : f0 54 __ BEQ $4f07 ; (vdcwin_viewportscroll.s16 + 0)
.s7:
4eb3 : a9 01 __ LDA #$01
4eb5 : 8d f6 bf STA $bff6 ; (sstack + 6)
4eb8 : 18 __ __ CLC
4eb9 : a5 53 __ LDA T0 + 0 
4ebb : 69 0b __ ADC #$0b
4ebd : 8d f4 bf STA $bff4 ; (sstack + 4)
4ec0 : a5 54 __ LDA T0 + 1 
4ec2 : 69 00 __ ADC #$00
4ec4 : 8d f5 bf STA $bff5 ; (sstack + 5)
4ec7 : 20 9a 52 JSR $529a ; (vdcwin_scroll_down.s0 + 0)
4eca : a9 01 __ LDA #$01
4ecc : 85 14 __ STA P7 
4ece : a0 0b __ LDY #$0b
4ed0 : b1 53 __ LDA (T0 + 0),y 
4ed2 : 85 11 __ STA P4 
4ed4 : c8 __ __ INY
4ed5 : b1 53 __ LDA (T0 + 0),y 
4ed7 : 85 12 __ STA P5 
4ed9 : c8 __ __ INY
4eda : b1 53 __ LDA (T0 + 0),y 
4edc : 85 13 __ STA P6 
4ede : ad d3 bf LDA $bfd3 ; (wrapbuffer + 61)
4ee1 : 18 __ __ CLC
4ee2 : 69 ff __ ADC #$ff
4ee4 : 8d d3 bf STA $bfd3 ; (wrapbuffer + 61)
4ee7 : b0 03 __ BCS $4eec ; (vdcwin_viewportscroll.s1009 + 0)
.s1008:
4ee9 : ce d4 bf DEC $bfd4 ; (wrapbuffer + 62)
.s1009:
4eec : 18 __ __ CLC
4eed : a0 09 __ LDY #$09
4eef : b1 53 __ LDA (T0 + 0),y 
4ef1 : 69 ff __ ADC #$ff
4ef3 : 91 53 __ STA (T0 + 0),y 
4ef5 : c8 __ __ INY
4ef6 : b1 53 __ LDA (T0 + 0),y 
4ef8 : 69 ff __ ADC #$ff
4efa : 91 53 __ STA (T0 + 0),y 
4efc : a9 d5 __ LDA #$d5
4efe : 85 0f __ STA P2 
4f00 : a9 bf __ LDA #$bf
4f02 : 85 10 __ STA P3 
4f04 : 20 bf 32 JSR $32bf ; (vdcwin_init.s0 + 0)
.s16:
4f07 : a5 55 __ LDA T2 + 0 
4f09 : 29 04 __ AND #$04
4f0b : f0 5f __ BEQ $4f6c ; (vdcwin_viewportscroll.s12 + 0)
.s10:
4f0d : a9 01 __ LDA #$01
4f0f : 8d f6 bf STA $bff6 ; (sstack + 6)
4f12 : 18 __ __ CLC
4f13 : a5 53 __ LDA T0 + 0 
4f15 : 69 0b __ ADC #$0b
4f17 : 8d f4 bf STA $bff4 ; (sstack + 4)
4f1a : a5 54 __ LDA T0 + 1 
4f1c : 69 00 __ ADC #$00
4f1e : 8d f5 bf STA $bff5 ; (sstack + 5)
4f21 : 20 1d 47 JSR $471d ; (vdcwin_scroll_up.s0 + 0)
4f24 : a9 01 __ LDA #$01
4f26 : 85 14 __ STA P7 
4f28 : a0 0b __ LDY #$0b
4f2a : b1 53 __ LDA (T0 + 0),y 
4f2c : 85 11 __ STA P4 
4f2e : a0 0d __ LDY #$0d
4f30 : b1 53 __ LDA (T0 + 0),y 
4f32 : 85 13 __ STA P6 
4f34 : c8 __ __ INY
4f35 : b1 53 __ LDA (T0 + 0),y 
4f37 : 85 43 __ STA T1 + 0 
4f39 : 18 __ __ CLC
4f3a : 6d d3 bf ADC $bfd3 ; (wrapbuffer + 61)
4f3d : 8d d3 bf STA $bfd3 ; (wrapbuffer + 61)
4f40 : 90 03 __ BCC $4f45 ; (vdcwin_viewportscroll.s1011 + 0)
.s1010:
4f42 : ee d4 bf INC $bfd4 ; (wrapbuffer + 62)
.s1011:
4f45 : 18 __ __ CLC
4f46 : a0 09 __ LDY #$09
4f48 : b1 53 __ LDA (T0 + 0),y 
4f4a : 69 01 __ ADC #$01
4f4c : 91 53 __ STA (T0 + 0),y 
4f4e : c8 __ __ INY
4f4f : b1 53 __ LDA (T0 + 0),y 
4f51 : 69 00 __ ADC #$00
4f53 : 91 53 __ STA (T0 + 0),y 
4f55 : a9 d5 __ LDA #$d5
4f57 : 85 0f __ STA P2 
4f59 : a9 bf __ LDA #$bf
4f5b : 85 10 __ STA P3 
4f5d : a0 0c __ LDY #$0c
4f5f : b1 53 __ LDA (T0 + 0),y 
4f61 : 18 __ __ CLC
4f62 : 65 43 __ ADC T1 + 0 
4f64 : 38 __ __ SEC
4f65 : e9 01 __ SBC #$01
4f67 : 85 12 __ STA P5 
4f69 : 20 bf 32 JSR $32bf ; (vdcwin_init.s0 + 0)
.s12:
4f6c : a9 ca __ LDA #$ca
4f6e : 8d f0 bf STA $bff0 ; (sstack + 0)
4f71 : a9 bf __ LDA #$bf
4f73 : 8d f1 bf STA $bff1 ; (sstack + 1)
4f76 : 20 37 39 JSR $3937 ; (vdcwin_cpy_viewport.s0 + 0)
.s1001:
4f79 : ad c4 bf LDA $bfc4 ; (nouns + 67)
4f7c : 85 53 __ STA T0 + 0 
4f7e : ad c5 bf LDA $bfc5 ; (nouns + 68)
4f81 : 85 54 __ STA T0 + 1 
4f83 : ad c6 bf LDA $bfc6 ; (nouns + 69)
4f86 : 85 55 __ STA T2 + 0 
4f88 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_right: ; vdcwin_scroll_right(struct VDCWin*,u8)->void
.s1000:
4f89 : a5 53 __ LDA T9 + 0 
4f8b : 8d ea bf STA $bfea ; (buffer + 10)
4f8e : a5 54 __ LDA T9 + 1 
4f90 : 8d eb bf STA $bfeb ; (buffer + 11)
.s0:
4f93 : ad f4 bf LDA $bff4 ; (sstack + 4)
4f96 : 85 46 __ STA T0 + 0 
4f98 : ad f5 bf LDA $bff5 ; (sstack + 5)
4f9b : 85 47 __ STA T0 + 1 
4f9d : ad f6 bf LDA $bff6 ; (sstack + 6)
4fa0 : 85 4a __ STA T3 + 0 
4fa2 : 38 __ __ SEC
4fa3 : a0 02 __ LDY #$02
4fa5 : b1 46 __ LDA (T0 + 0),y 
4fa7 : e5 4a __ SBC T3 + 0 
4fa9 : 85 49 __ STA T2 + 0 
4fab : a9 00 __ LDA #$00
4fad : 85 48 __ STA T1 + 0 
4faf : a0 06 __ LDY #$06
4fb1 : b1 46 __ LDA (T0 + 0),y 
4fb3 : 85 4b __ STA T4 + 0 
4fb5 : c8 __ __ INY
4fb6 : b1 46 __ LDA (T0 + 0),y 
4fb8 : 85 4c __ STA T4 + 1 
4fba : c8 __ __ INY
4fbb : b1 46 __ LDA (T0 + 0),y 
4fbd : 85 4d __ STA T5 + 0 
4fbf : c8 __ __ INY
4fc0 : b1 46 __ LDA (T0 + 0),y 
.l1:
4fc2 : 85 4e __ STA T5 + 1 
4fc4 : a5 48 __ LDA T1 + 0 
4fc6 : a0 03 __ LDY #$03
4fc8 : d1 46 __ CMP (T0 + 0),y 
4fca : 90 0b __ BCC $4fd7 ; (vdcwin_scroll_right.s2 + 0)
.s1001:
4fcc : ad ea bf LDA $bfea ; (buffer + 10)
4fcf : 85 53 __ STA T9 + 0 
4fd1 : ad eb bf LDA $bfeb ; (buffer + 11)
4fd4 : 85 54 __ STA T9 + 1 
4fd6 : 60 __ __ RTS
.s2:
4fd7 : a5 4b __ LDA T4 + 0 
4fd9 : 65 4a __ ADC T3 + 0 
4fdb : 85 4f __ STA T7 + 0 
4fdd : a5 4c __ LDA T4 + 1 
4fdf : 69 00 __ ADC #$00
4fe1 : 85 50 __ STA T7 + 1 
4fe3 : 18 __ __ CLC
4fe4 : a5 4a __ LDA T3 + 0 
4fe6 : 65 4d __ ADC T5 + 0 
4fe8 : 85 51 __ STA T8 + 0 
4fea : a9 00 __ LDA #$00
4fec : 65 4e __ ADC T5 + 1 
4fee : 85 52 __ STA T8 + 1 
4ff0 : ad 60 60 LDA $6060 ; (vdc_state + 1)
4ff3 : d0 0f __ BNE $5004 ; (vdcwin_scroll_right.s7 + 0)
.s9:
4ff5 : cc 6c 60 CPY $606c ; (vdc_state + 13)
4ff8 : d0 05 __ BNE $4fff ; (vdcwin_scroll_right.s1003 + 0)
.s1002:
4ffa : a9 ff __ LDA #$ff
4ffc : cd 6b 60 CMP $606b ; (vdc_state + 12)
.s1003:
4fff : b0 03 __ BCS $5004 ; (vdcwin_scroll_right.s7 + 0)
5001 : 4c 89 50 JMP $5089 ; (vdcwin_scroll_right.s6 + 0)
.s7:
5004 : a5 4b __ LDA T4 + 0 
5006 : 8d f0 bf STA $bff0 ; (sstack + 0)
5009 : a5 4c __ LDA T4 + 1 
500b : 8d f1 bf STA $bff1 ; (sstack + 1)
500e : ad 6b 60 LDA $606b ; (vdc_state + 12)
5011 : 85 53 __ STA T9 + 0 
5013 : 85 16 __ STA P9 
5015 : ad 6c 60 LDA $606c ; (vdc_state + 13)
5018 : 85 54 __ STA T9 + 1 
501a : 85 17 __ STA P10 
501c : a5 49 __ LDA T2 + 0 
501e : 8d f2 bf STA $bff2 ; (sstack + 2)
5021 : a9 00 __ LDA #$00
5023 : 8d f3 bf STA $bff3 ; (sstack + 3)
5026 : 20 d1 47 JSR $47d1 ; (vdc_block_copy.s0 + 0)
5029 : a5 4f __ LDA T7 + 0 
502b : 85 16 __ STA P9 
502d : a5 50 __ LDA T7 + 1 
502f : 85 17 __ STA P10 
5031 : a5 53 __ LDA T9 + 0 
5033 : 8d f0 bf STA $bff0 ; (sstack + 0)
5036 : a5 54 __ LDA T9 + 1 
5038 : 8d f1 bf STA $bff1 ; (sstack + 1)
503b : a5 49 __ LDA T2 + 0 
503d : 8d f2 bf STA $bff2 ; (sstack + 2)
5040 : a9 00 __ LDA #$00
5042 : 8d f3 bf STA $bff3 ; (sstack + 3)
5045 : 20 d1 47 JSR $47d1 ; (vdc_block_copy.s0 + 0)
5048 : a5 53 __ LDA T9 + 0 
504a : 85 16 __ STA P9 
504c : a5 54 __ LDA T9 + 1 
504e : 85 17 __ STA P10 
5050 : a5 4d __ LDA T5 + 0 
5052 : 8d f0 bf STA $bff0 ; (sstack + 0)
5055 : a5 4e __ LDA T5 + 1 
5057 : 8d f1 bf STA $bff1 ; (sstack + 1)
505a : a5 49 __ LDA T2 + 0 
505c : 8d f2 bf STA $bff2 ; (sstack + 2)
505f : a9 00 __ LDA #$00
5061 : 8d f3 bf STA $bff3 ; (sstack + 3)
5064 : 20 d1 47 JSR $47d1 ; (vdc_block_copy.s0 + 0)
5067 : a5 51 __ LDA T8 + 0 
5069 : 85 16 __ STA P9 
506b : a5 52 __ LDA T8 + 1 
506d : 85 17 __ STA P10 
506f : a5 53 __ LDA T9 + 0 
5071 : 8d f0 bf STA $bff0 ; (sstack + 0)
5074 : a5 54 __ LDA T9 + 1 
5076 : 8d f1 bf STA $bff1 ; (sstack + 1)
5079 : a5 49 __ LDA T2 + 0 
507b : 8d f2 bf STA $bff2 ; (sstack + 2)
507e : a9 00 __ LDA #$00
5080 : 8d f3 bf STA $bff3 ; (sstack + 3)
5083 : 20 d1 47 JSR $47d1 ; (vdc_block_copy.s0 + 0)
5086 : 4c fd 50 JMP $50fd ; (vdcwin_scroll_right.s5 + 0)
.s6:
5089 : a9 0e __ LDA #$0e
508b : 85 13 __ STA P6 
508d : a5 4b __ LDA T4 + 0 
508f : 85 16 __ STA P9 
5091 : a5 4c __ LDA T4 + 1 
5093 : 85 17 __ STA P10 
5095 : a9 88 __ LDA #$88
5097 : 85 14 __ STA P7 
5099 : a9 60 __ LDA #$60
509b : 85 15 __ STA P8 
509d : a5 49 __ LDA T2 + 0 
509f : 8d f0 bf STA $bff0 ; (sstack + 0)
50a2 : a9 00 __ LDA #$00
50a4 : 8d f1 bf STA $bff1 ; (sstack + 1)
50a7 : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
50aa : a5 4f __ LDA T7 + 0 
50ac : 85 11 __ STA P4 
50ae : a5 50 __ LDA T7 + 1 
50b0 : 85 12 __ STA P5 
50b2 : a9 88 __ LDA #$88
50b4 : 85 14 __ STA P7 
50b6 : a9 60 __ LDA #$60
50b8 : 85 15 __ STA P8 
50ba : a5 49 __ LDA T2 + 0 
50bc : 85 16 __ STA P9 
50be : a9 00 __ LDA #$00
50c0 : 85 17 __ STA P10 
50c2 : 20 ee 13 JSR $13ee ; (bnk_cpytovdc.s0 + 0)
50c5 : a9 88 __ LDA #$88
50c7 : 85 14 __ STA P7 
50c9 : a9 60 __ LDA #$60
50cb : 85 15 __ STA P8 
50cd : a5 4d __ LDA T5 + 0 
50cf : 85 16 __ STA P9 
50d1 : a5 4e __ LDA T5 + 1 
50d3 : 85 17 __ STA P10 
50d5 : a5 49 __ LDA T2 + 0 
50d7 : 8d f0 bf STA $bff0 ; (sstack + 0)
50da : a9 00 __ LDA #$00
50dc : 8d f1 bf STA $bff1 ; (sstack + 1)
50df : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
50e2 : a5 51 __ LDA T8 + 0 
50e4 : 85 11 __ STA P4 
50e6 : a5 52 __ LDA T8 + 1 
50e8 : 85 12 __ STA P5 
50ea : a9 88 __ LDA #$88
50ec : 85 14 __ STA P7 
50ee : a9 60 __ LDA #$60
50f0 : 85 15 __ STA P8 
50f2 : a5 49 __ LDA T2 + 0 
50f4 : 85 16 __ STA P9 
50f6 : a9 00 __ LDA #$00
50f8 : 85 17 __ STA P10 
50fa : 20 ee 13 JSR $13ee ; (bnk_cpytovdc.s0 + 0)
.s5:
50fd : ad 62 60 LDA $6062 ; (vdc_state + 3)
5100 : 18 __ __ CLC
5101 : 65 4b __ ADC T4 + 0 
5103 : 85 4b __ STA T4 + 0 
5105 : ad 63 60 LDA $6063 ; (vdc_state + 4)
5108 : 65 4c __ ADC T4 + 1 
510a : 85 4c __ STA T4 + 1 
510c : 18 __ __ CLC
510d : a5 4d __ LDA T5 + 0 
510f : 6d 62 60 ADC $6062 ; (vdc_state + 3)
5112 : 85 4d __ STA T5 + 0 
5114 : a5 4e __ LDA T5 + 1 
5116 : 6d 63 60 ADC $6063 ; (vdc_state + 4)
5119 : e6 48 __ INC T1 + 0 
511b : 4c c2 4f JMP $4fc2 ; (vdcwin_scroll_right.l1 + 0)
--------------------------------------------------------------------
vdcwin_scroll_left: ; vdcwin_scroll_left(struct VDCWin*,u8)->void
.s0:
511e : ad f4 bf LDA $bff4 ; (sstack + 4)
5121 : 85 46 __ STA T0 + 0 
5123 : ad f5 bf LDA $bff5 ; (sstack + 5)
5126 : 85 47 __ STA T0 + 1 
5128 : ad f6 bf LDA $bff6 ; (sstack + 6)
512b : 85 4a __ STA T3 + 0 
512d : 38 __ __ SEC
512e : a0 02 __ LDY #$02
5130 : b1 46 __ LDA (T0 + 0),y 
5132 : e5 4a __ SBC T3 + 0 
5134 : 85 49 __ STA T2 + 0 
5136 : a9 00 __ LDA #$00
5138 : 85 48 __ STA T1 + 0 
513a : a0 06 __ LDY #$06
513c : b1 46 __ LDA (T0 + 0),y 
513e : 85 4b __ STA T4 + 0 
5140 : c8 __ __ INY
5141 : b1 46 __ LDA (T0 + 0),y 
5143 : 85 4c __ STA T4 + 1 
5145 : c8 __ __ INY
5146 : b1 46 __ LDA (T0 + 0),y 
5148 : 85 4d __ STA T5 + 0 
514a : c8 __ __ INY
514b : b1 46 __ LDA (T0 + 0),y 
.l1:
514d : 85 4e __ STA T5 + 1 
514f : a5 48 __ LDA T1 + 0 
5151 : a0 03 __ LDY #$03
5153 : d1 46 __ CMP (T0 + 0),y 
5155 : 90 01 __ BCC $5158 ; (vdcwin_scroll_left.s2 + 0)
.s1001:
5157 : 60 __ __ RTS
.s2:
5158 : a5 4b __ LDA T4 + 0 
515a : 65 4a __ ADC T3 + 0 
515c : aa __ __ TAX
515d : a5 4c __ LDA T4 + 1 
515f : 69 00 __ ADC #$00
5161 : 85 50 __ STA T7 + 1 
5163 : 18 __ __ CLC
5164 : a5 4a __ LDA T3 + 0 
5166 : 65 4d __ ADC T5 + 0 
5168 : 85 51 __ STA T8 + 0 
516a : a9 00 __ LDA #$00
516c : 65 4e __ ADC T5 + 1 
516e : 85 52 __ STA T8 + 1 
5170 : ad 60 60 LDA $6060 ; (vdc_state + 1)
5173 : d0 0f __ BNE $5184 ; (vdcwin_scroll_left.s7 + 0)
.s9:
5175 : cc 6c 60 CPY $606c ; (vdc_state + 13)
5178 : d0 05 __ BNE $517f ; (vdcwin_scroll_left.s1003 + 0)
.s1002:
517a : a9 ff __ LDA #$ff
517c : cd 6b 60 CMP $606b ; (vdc_state + 12)
.s1003:
517f : b0 03 __ BCS $5184 ; (vdcwin_scroll_left.s7 + 0)
5181 : 4c 07 52 JMP $5207 ; (vdcwin_scroll_left.s6 + 0)
.s7:
5184 : 8e f0 bf STX $bff0 ; (sstack + 0)
5187 : a5 50 __ LDA T7 + 1 
5189 : 8d f1 bf STA $bff1 ; (sstack + 1)
518c : ad 6b 60 LDA $606b ; (vdc_state + 12)
518f : 85 4f __ STA T7 + 0 
5191 : 85 16 __ STA P9 
5193 : ad 6c 60 LDA $606c ; (vdc_state + 13)
5196 : 85 50 __ STA T7 + 1 
5198 : 85 17 __ STA P10 
519a : a5 49 __ LDA T2 + 0 
519c : 8d f2 bf STA $bff2 ; (sstack + 2)
519f : a9 00 __ LDA #$00
51a1 : 8d f3 bf STA $bff3 ; (sstack + 3)
51a4 : 20 d1 47 JSR $47d1 ; (vdc_block_copy.s0 + 0)
51a7 : a5 4b __ LDA T4 + 0 
51a9 : 85 16 __ STA P9 
51ab : a5 4c __ LDA T4 + 1 
51ad : 85 17 __ STA P10 
51af : a5 4f __ LDA T7 + 0 
51b1 : 8d f0 bf STA $bff0 ; (sstack + 0)
51b4 : a5 50 __ LDA T7 + 1 
51b6 : 8d f1 bf STA $bff1 ; (sstack + 1)
51b9 : a5 49 __ LDA T2 + 0 
51bb : 8d f2 bf STA $bff2 ; (sstack + 2)
51be : a9 00 __ LDA #$00
51c0 : 8d f3 bf STA $bff3 ; (sstack + 3)
51c3 : 20 d1 47 JSR $47d1 ; (vdc_block_copy.s0 + 0)
51c6 : a5 4f __ LDA T7 + 0 
51c8 : 85 16 __ STA P9 
51ca : a5 50 __ LDA T7 + 1 
51cc : 85 17 __ STA P10 
51ce : a5 51 __ LDA T8 + 0 
51d0 : 8d f0 bf STA $bff0 ; (sstack + 0)
51d3 : a5 52 __ LDA T8 + 1 
51d5 : 8d f1 bf STA $bff1 ; (sstack + 1)
51d8 : a5 49 __ LDA T2 + 0 
51da : 8d f2 bf STA $bff2 ; (sstack + 2)
51dd : a9 00 __ LDA #$00
51df : 8d f3 bf STA $bff3 ; (sstack + 3)
51e2 : 20 d1 47 JSR $47d1 ; (vdc_block_copy.s0 + 0)
51e5 : a5 4d __ LDA T5 + 0 
51e7 : 85 16 __ STA P9 
51e9 : a5 4e __ LDA T5 + 1 
51eb : 85 17 __ STA P10 
51ed : a5 4f __ LDA T7 + 0 
51ef : 8d f0 bf STA $bff0 ; (sstack + 0)
51f2 : a5 50 __ LDA T7 + 1 
51f4 : 8d f1 bf STA $bff1 ; (sstack + 1)
51f7 : a5 49 __ LDA T2 + 0 
51f9 : 8d f2 bf STA $bff2 ; (sstack + 2)
51fc : a9 00 __ LDA #$00
51fe : 8d f3 bf STA $bff3 ; (sstack + 3)
5201 : 20 d1 47 JSR $47d1 ; (vdc_block_copy.s0 + 0)
5204 : 4c 79 52 JMP $5279 ; (vdcwin_scroll_left.s5 + 0)
.s6:
5207 : 86 16 __ STX P9 
5209 : a9 0e __ LDA #$0e
520b : 85 13 __ STA P6 
520d : a5 50 __ LDA T7 + 1 
520f : 85 17 __ STA P10 
5211 : a9 88 __ LDA #$88
5213 : 85 14 __ STA P7 
5215 : a9 60 __ LDA #$60
5217 : 85 15 __ STA P8 
5219 : a5 49 __ LDA T2 + 0 
521b : 8d f0 bf STA $bff0 ; (sstack + 0)
521e : a9 00 __ LDA #$00
5220 : 8d f1 bf STA $bff1 ; (sstack + 1)
5223 : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
5226 : a5 4b __ LDA T4 + 0 
5228 : 85 11 __ STA P4 
522a : a5 4c __ LDA T4 + 1 
522c : 85 12 __ STA P5 
522e : a9 88 __ LDA #$88
5230 : 85 14 __ STA P7 
5232 : a9 60 __ LDA #$60
5234 : 85 15 __ STA P8 
5236 : a5 49 __ LDA T2 + 0 
5238 : 85 16 __ STA P9 
523a : a9 00 __ LDA #$00
523c : 85 17 __ STA P10 
523e : 20 ee 13 JSR $13ee ; (bnk_cpytovdc.s0 + 0)
5241 : a9 88 __ LDA #$88
5243 : 85 14 __ STA P7 
5245 : a9 60 __ LDA #$60
5247 : 85 15 __ STA P8 
5249 : a5 51 __ LDA T8 + 0 
524b : 85 16 __ STA P9 
524d : a5 52 __ LDA T8 + 1 
524f : 85 17 __ STA P10 
5251 : a5 49 __ LDA T2 + 0 
5253 : 8d f0 bf STA $bff0 ; (sstack + 0)
5256 : a9 00 __ LDA #$00
5258 : 8d f1 bf STA $bff1 ; (sstack + 1)
525b : 20 94 13 JSR $1394 ; (bnk_cpyfromvdc.s0 + 0)
525e : a5 4d __ LDA T5 + 0 
5260 : 85 11 __ STA P4 
5262 : a5 4e __ LDA T5 + 1 
5264 : 85 12 __ STA P5 
5266 : a9 88 __ LDA #$88
5268 : 85 14 __ STA P7 
526a : a9 60 __ LDA #$60
526c : 85 15 __ STA P8 
526e : a5 49 __ LDA T2 + 0 
5270 : 85 16 __ STA P9 
5272 : a9 00 __ LDA #$00
5274 : 85 17 __ STA P10 
5276 : 20 ee 13 JSR $13ee ; (bnk_cpytovdc.s0 + 0)
.s5:
5279 : ad 62 60 LDA $6062 ; (vdc_state + 3)
527c : 18 __ __ CLC
527d : 65 4b __ ADC T4 + 0 
527f : 85 4b __ STA T4 + 0 
5281 : ad 63 60 LDA $6063 ; (vdc_state + 4)
5284 : 65 4c __ ADC T4 + 1 
5286 : 85 4c __ STA T4 + 1 
5288 : 18 __ __ CLC
5289 : a5 4d __ LDA T5 + 0 
528b : 6d 62 60 ADC $6062 ; (vdc_state + 3)
528e : 85 4d __ STA T5 + 0 
5290 : a5 4e __ LDA T5 + 1 
5292 : 6d 63 60 ADC $6063 ; (vdc_state + 4)
5295 : e6 48 __ INC T1 + 0 
5297 : 4c 4d 51 JMP $514d ; (vdcwin_scroll_left.l1 + 0)
--------------------------------------------------------------------
vdcwin_scroll_down: ; vdcwin_scroll_down(struct VDCWin*,u8)->void
.s0:
529a : ad f4 bf LDA $bff4 ; (sstack + 4)
529d : 85 45 __ STA T0 + 0 
529f : ad f5 bf LDA $bff5 ; (sstack + 5)
52a2 : 85 46 __ STA T0 + 1 
52a4 : ad 62 60 LDA $6062 ; (vdc_state + 3)
52a7 : 85 1b __ STA ACCU + 0 
52a9 : ad 63 60 LDA $6063 ; (vdc_state + 4)
52ac : 85 1c __ STA ACCU + 1 
52ae : a0 03 __ LDY #$03
52b0 : b1 45 __ LDA (T0 + 0),y 
52b2 : 20 b3 59 JSR $59b3 ; (mul16by8 + 0)
52b5 : a0 06 __ LDY #$06
52b7 : b1 45 __ LDA (T0 + 0),y 
52b9 : 18 __ __ CLC
52ba : 65 05 __ ADC WORK + 2 
52bc : 85 4c __ STA T4 + 0 
52be : c8 __ __ INY
52bf : b1 45 __ LDA (T0 + 0),y 
52c1 : 65 06 __ ADC WORK + 3 
52c3 : 85 4d __ STA T4 + 1 
52c5 : c8 __ __ INY
52c6 : b1 45 __ LDA (T0 + 0),y 
52c8 : 18 __ __ CLC
52c9 : 65 05 __ ADC WORK + 2 
52cb : 85 48 __ STA T2 + 0 
52cd : c8 __ __ INY
52ce : b1 45 __ LDA (T0 + 0),y 
52d0 : 65 06 __ ADC WORK + 3 
52d2 : 85 49 __ STA T2 + 1 
52d4 : ad 62 60 LDA $6062 ; (vdc_state + 3)
52d7 : 85 1b __ STA ACCU + 0 
52d9 : ad 63 60 LDA $6063 ; (vdc_state + 4)
52dc : 85 1c __ STA ACCU + 1 
52de : ad f6 bf LDA $bff6 ; (sstack + 6)
52e1 : 85 4e __ STA T5 + 0 
52e3 : 20 b3 59 JSR $59b3 ; (mul16by8 + 0)
52e6 : a5 05 __ LDA WORK + 2 
52e8 : 85 4a __ STA T3 + 0 
52ea : a5 06 __ LDA WORK + 3 
52ec : 85 4b __ STA T3 + 1 
52ee : a9 00 __ LDA #$00
52f0 : 85 47 __ STA T1 + 0 
52f2 : a0 02 __ LDY #$02
52f4 : b1 45 __ LDA (T0 + 0),y 
52f6 : 85 4f __ STA T6 + 0 
.l1:
52f8 : a0 03 __ LDY #$03
52fa : b1 45 __ LDA (T0 + 0),y 
52fc : 38 __ __ SEC
52fd : e5 4e __ SBC T5 + 0 
52ff : 90 06 __ BCC $5307 ; (vdcwin_scroll_down.s2 + 0)
.s1002:
5301 : c5 47 __ CMP T1 + 0 
5303 : 90 6b __ BCC $5370 ; (vdcwin_scroll_down.s1001 + 0)
.s1004:
5305 : f0 69 __ BEQ $5370 ; (vdcwin_scroll_down.s1001 + 0)
.s2:
5307 : ad 62 60 LDA $6062 ; (vdc_state + 3)
530a : 85 50 __ STA T8 + 0 
530c : ad 63 60 LDA $6063 ; (vdc_state + 4)
530f : 85 51 __ STA T8 + 1 
5311 : 38 __ __ SEC
5312 : a5 4c __ LDA T4 + 0 
5314 : e5 50 __ SBC T8 + 0 
5316 : 85 16 __ STA P9 
5318 : 85 4c __ STA T4 + 0 
531a : a5 4d __ LDA T4 + 1 
531c : e5 51 __ SBC T8 + 1 
531e : 85 17 __ STA P10 
5320 : 85 4d __ STA T4 + 1 
5322 : 38 __ __ SEC
5323 : a5 16 __ LDA P9 
5325 : e5 4a __ SBC T3 + 0 
5327 : 8d f0 bf STA $bff0 ; (sstack + 0)
532a : a5 17 __ LDA P10 
532c : e5 4b __ SBC T3 + 1 
532e : 8d f1 bf STA $bff1 ; (sstack + 1)
5331 : a5 4f __ LDA T6 + 0 
5333 : 8d f2 bf STA $bff2 ; (sstack + 2)
5336 : a9 00 __ LDA #$00
5338 : 8d f3 bf STA $bff3 ; (sstack + 3)
533b : 20 d1 47 JSR $47d1 ; (vdc_block_copy.s0 + 0)
533e : a5 4f __ LDA T6 + 0 
5340 : 8d f2 bf STA $bff2 ; (sstack + 2)
5343 : a9 00 __ LDA #$00
5345 : 8d f3 bf STA $bff3 ; (sstack + 3)
5348 : 38 __ __ SEC
5349 : a5 48 __ LDA T2 + 0 
534b : e5 50 __ SBC T8 + 0 
534d : 85 48 __ STA T2 + 0 
534f : 85 16 __ STA P9 
5351 : a5 49 __ LDA T2 + 1 
5353 : e5 51 __ SBC T8 + 1 
5355 : 85 49 __ STA T2 + 1 
5357 : 85 17 __ STA P10 
5359 : 38 __ __ SEC
535a : a5 16 __ LDA P9 
535c : e5 4a __ SBC T3 + 0 
535e : 8d f0 bf STA $bff0 ; (sstack + 0)
5361 : a5 17 __ LDA P10 
5363 : e5 4b __ SBC T3 + 1 
5365 : 8d f1 bf STA $bff1 ; (sstack + 1)
5368 : 20 d1 47 JSR $47d1 ; (vdc_block_copy.s0 + 0)
536b : e6 47 __ INC T1 + 0 
536d : 4c f8 52 JMP $52f8 ; (vdcwin_scroll_down.l1 + 0)
.s1001:
5370 : 60 __ __ RTS
--------------------------------------------------------------------
scroll_fullscreen_smooth: ; scroll_fullscreen_smooth(u8)->void
.s1000:
5371 : a5 53 __ LDA T0 + 0 
5373 : 8d bf bf STA $bfbf ; (nouns + 62)
.s0:
5376 : a9 00 __ LDA #$00
5378 : 8d fa bf STA $bffa ; (sstack + 10)
537b : a9 01 __ LDA #$01
537d : 8d fb bf STA $bffb ; (sstack + 11)
5380 : ad fc bf LDA $bffc ; (sstack + 12)
5383 : 85 53 __ STA T0 + 0 
5385 : 8d f9 bf STA $bff9 ; (sstack + 9)
5388 : 20 d0 4b JSR $4bd0 ; (screen_switch.s1000 + 0)
538b : a9 7f __ LDA #$7f
538d : 8d c0 bf STA $bfc0 ; (nouns + 63)
5390 : a9 00 __ LDA #$00
5392 : 8d c1 bf STA $bfc1 ; (nouns + 64)
5395 : a9 40 __ LDA #$40
5397 : 8d c2 bf STA $bfc2 ; (nouns + 65)
539a : a5 53 __ LDA T0 + 0 
539c : 0a __ __ ASL
539d : aa __ __ TAX
539e : bd 53 60 LDA $6053,x ; (screenset + 0)
53a1 : 8d c3 bf STA $bfc3 ; (nouns + 66)
53a4 : bd 54 60 LDA $6054,x ; (screenset + 1)
53a7 : 8d c4 bf STA $bfc4 ; (nouns + 67)
53aa : a9 c0 __ LDA #$c0
53ac : 8d f7 bf STA $bff7 ; (sstack + 7)
53af : a9 bf __ LDA #$bf
53b1 : 8d f8 bf STA $bff8 ; (sstack + 8)
53b4 : ad 61 60 LDA $6061 ; (vdc_state + 2)
53b7 : 8d f9 bf STA $bff9 ; (sstack + 9)
53ba : 20 65 54 JSR $5465 ; (vdc_softscroll_init.s1000 + 0)
53bd : a5 1b __ LDA ACCU + 0 
53bf : d0 17 __ BNE $53d8 ; (scroll_fullscreen_smooth.l4 + 0)
.s3:
53c1 : a9 01 __ LDA #$01
53c3 : 8d fa bf STA $bffa ; (sstack + 10)
53c6 : 8d fb bf STA $bffb ; (sstack + 11)
53c9 : ad fc bf LDA $bffc ; (sstack + 12)
53cc : 8d f9 bf STA $bff9 ; (sstack + 9)
53cf : 20 d0 4b JSR $4bd0 ; (screen_switch.s1000 + 0)
.s1001:
53d2 : ad bf bf LDA $bfbf ; (nouns + 62)
53d5 : 85 53 __ STA T0 + 0 
53d7 : 60 __ __ RTS
.l4:
53d8 : 20 f0 29 JSR $29f0 ; (getch.s0 + 0)
53db : 85 53 __ STA T0 + 0 
53dd : c9 57 __ CMP #$57
53df : f0 04 __ BEQ $53e5 ; (scroll_fullscreen_smooth.s6 + 0)
.s9:
53e1 : c9 91 __ CMP #$91
53e3 : d0 12 __ BNE $53f7 ; (scroll_fullscreen_smooth.s8 + 0)
.s6:
53e5 : a9 02 __ LDA #$02
53e7 : 85 15 __ STA P8 
53e9 : a9 c0 __ LDA #$c0
53eb : 85 13 __ STA P6 
53ed : a9 bf __ LDA #$bf
53ef : 85 14 __ STA P7 
53f1 : 20 c1 55 JSR $55c1 ; (vdc_softscroll_up.l73 + 0)
53f4 : 4c fb 53 JMP $53fb ; (scroll_fullscreen_smooth.s13 + 0)
.s8:
53f7 : c9 53 __ CMP #$53
53f9 : f0 06 __ BEQ $5401 ; (scroll_fullscreen_smooth.s10 + 0)
.s13:
53fb : a5 53 __ LDA T0 + 0 
53fd : c9 11 __ CMP #$11
53ff : d0 11 __ BNE $5412 ; (scroll_fullscreen_smooth.s12 + 0)
.s10:
5401 : a9 02 __ LDA #$02
5403 : 85 15 __ STA P8 
5405 : a9 c0 __ LDA #$c0
5407 : 85 13 __ STA P6 
5409 : a9 bf __ LDA #$bf
540b : 85 14 __ STA P7 
540d : 20 6a 56 JSR $566a ; (vdc_softscroll_down.l48 + 0)
5410 : a5 53 __ LDA T0 + 0 
.s12:
5412 : c9 41 __ CMP #$41
5414 : f0 04 __ BEQ $541a ; (scroll_fullscreen_smooth.s14 + 0)
.s17:
5416 : c9 9d __ CMP #$9d
5418 : d0 0f __ BNE $5429 ; (scroll_fullscreen_smooth.s16 + 0)
.s14:
541a : a9 02 __ LDA #$02
541c : 85 15 __ STA P8 
541e : a9 c0 __ LDA #$c0
5420 : 85 13 __ STA P6 
5422 : a9 bf __ LDA #$bf
5424 : 85 14 __ STA P7 
5426 : 20 25 57 JSR $5725 ; (vdc_softscroll_left.s0 + 0)
.s16:
5429 : a5 53 __ LDA T0 + 0 
542b : c9 44 __ CMP #$44
542d : f0 04 __ BEQ $5433 ; (scroll_fullscreen_smooth.s18 + 0)
.s21:
542f : c9 1d __ CMP #$1d
5431 : d0 12 __ BNE $5445 ; (scroll_fullscreen_smooth.s20 + 0)
.s18:
5433 : a9 02 __ LDA #$02
5435 : 85 15 __ STA P8 
5437 : a9 c0 __ LDA #$c0
5439 : 85 13 __ STA P6 
543b : a9 bf __ LDA #$bf
543d : 85 14 __ STA P7 
543f : 20 d6 57 JSR $57d6 ; (vdc_softscroll_right.s0 + 0)
5442 : 4c 49 54 JMP $5449 ; (scroll_fullscreen_smooth.s22 + 0)
.s20:
5445 : c9 1b __ CMP #$1b
5447 : f0 06 __ BEQ $544f ; (scroll_fullscreen_smooth.s5 + 0)
.s22:
5449 : a5 53 __ LDA T0 + 0 
544b : c9 03 __ CMP #$03
544d : d0 89 __ BNE $53d8 ; (scroll_fullscreen_smooth.l4 + 0)
.s5:
544f : a9 c0 __ LDA #$c0
5451 : 8d f7 bf STA $bff7 ; (sstack + 7)
5454 : a9 bf __ LDA #$bf
5456 : 8d f8 bf STA $bff8 ; (sstack + 8)
5459 : ad 61 60 LDA $6061 ; (vdc_state + 2)
545c : 8d f9 bf STA $bff9 ; (sstack + 9)
545f : 20 a0 58 JSR $58a0 ; (vdc_softscroll_exit.s1000 + 0)
5462 : 4c c1 53 JMP $53c1 ; (scroll_fullscreen_smooth.s3 + 0)
--------------------------------------------------------------------
vdc_softscroll_init: ; vdc_softscroll_init(struct VDCSoftScrollSettings*,u8)->u8
.s1000:
5465 : a2 05 __ LDX #$05
5467 : b5 53 __ LDA T2 + 0,x 
5469 : 9d e9 bf STA $bfe9,x ; (vp_fill + 31)
546c : ca __ __ DEX
546d : 10 f8 __ BPL $5467 ; (vdc_softscroll_init.s1000 + 2)
.s0:
546f : ad f7 bf LDA $bff7 ; (sstack + 7)
5472 : 85 51 __ STA T0 + 0 
5474 : ad f8 bf LDA $bff8 ; (sstack + 8)
5477 : 85 52 __ STA T0 + 1 
5479 : a0 04 __ LDY #$04
547b : b1 51 __ LDA (T0 + 0),y 
547d : 85 1b __ STA ACCU + 0 
547f : a9 00 __ LDA #$00
5481 : 85 1c __ STA ACCU + 1 
5483 : 88 __ __ DEY
5484 : b1 51 __ LDA (T0 + 0),y 
5486 : 85 53 __ STA T2 + 0 
5488 : 20 b3 59 JSR $59b3 ; (mul16by8 + 0)
548b : a5 05 __ LDA WORK + 2 
548d : 85 55 __ STA T3 + 0 
548f : 0a __ __ ASL
5490 : aa __ __ TAX
5491 : a5 06 __ LDA WORK + 3 
5493 : 85 56 __ STA T3 + 1 
5495 : 2a __ __ ROL
5496 : a8 __ __ TAY
5497 : 8a __ __ TXA
5498 : 18 __ __ CLC
5499 : 69 30 __ ADC #$30
549b : 85 57 __ STA T4 + 0 
549d : 90 01 __ BCC $54a0 ; (vdc_softscroll_init.s1007 + 0)
.s1006:
549f : c8 __ __ INY
.s1007:
54a0 : 84 58 __ STY T4 + 1 
54a2 : a9 20 __ LDA #$20
54a4 : c5 58 __ CMP T4 + 1 
54a6 : d0 04 __ BNE $54ac ; (vdc_softscroll_init.s1005 + 0)
.s1004:
54a8 : a9 00 __ LDA #$00
54aa : c5 57 __ CMP T4 + 0 
.s1005:
54ac : b0 05 __ BCS $54b3 ; (vdc_softscroll_init.s4 + 0)
.s5:
54ae : ad 60 60 LDA $6060 ; (vdc_state + 1)
54b1 : f0 0c __ BEQ $54bf ; (vdc_softscroll_init.s1 + 0)
.s4:
54b3 : a9 e0 __ LDA #$e0
54b5 : c5 58 __ CMP T4 + 1 
54b7 : d0 04 __ BNE $54bd ; (vdc_softscroll_init.s1003 + 0)
.s1002:
54b9 : a9 00 __ LDA #$00
54bb : c5 57 __ CMP T4 + 0 
.s1003:
54bd : b0 05 __ BCS $54c4 ; (vdc_softscroll_init.s3 + 0)
.s1:
54bf : a9 00 __ LDA #$00
54c1 : 4c b4 55 JMP $55b4 ; (vdc_softscroll_init.s1001 + 0)
.s3:
54c4 : ad f9 bf LDA $bff9 ; (sstack + 9)
54c7 : 8d f6 bf STA $bff6 ; (sstack + 6)
54ca : 20 2d 2c JSR $2c2d ; (vdc_set_mode.s0 + 0)
54cd : a9 00 __ LDA #$00
54cf : 8d 67 60 STA $6067 ; (vdc_state + 8)
54d2 : 8d 6f 60 STA $606f ; (vdc_state + 16)
54d5 : 8d 70 60 STA $6070 ; (vdc_state + 17)
54d8 : 8d 71 60 STA $6071 ; (vdc_state + 18)
54db : a9 20 __ LDA #$20
54dd : 8d 68 60 STA $6068 ; (vdc_state + 9)
54e0 : a9 10 __ LDA #$10
54e2 : 8d 72 60 STA $6072 ; (vdc_state + 19)
54e5 : 18 __ __ CLC
54e6 : a5 56 __ LDA T3 + 1 
54e8 : 69 20 __ ADC #$20
54ea : 85 58 __ STA T4 + 1 
54ec : 8d 6a 60 STA $606a ; (vdc_state + 11)
54ef : a5 55 __ LDA T3 + 0 
54f1 : 8d 69 60 STA $6069 ; (vdc_state + 10)
54f4 : 38 __ __ SEC
54f5 : a5 53 __ LDA T2 + 0 
54f7 : ed 62 60 SBC $6062 ; (vdc_state + 3)
54fa : 85 53 __ STA T2 + 0 
54fc : 8d 77 60 STA $6077 ; (vdc_state + 24)
54ff : 20 40 2d JSR $2d40 ; (vdc_set_multab.s0 + 0)
5502 : 20 d2 21 JSR $21d2 ; (vdc_cls.s0 + 0)
5505 : a9 00 __ LDA #$00
5507 : 85 0f __ STA P2 
5509 : 85 10 __ STA P3 
550b : 20 ce 2d JSR $2dce ; (vdc_set_charset_address.s0 + 0)
550e : 20 e2 2d JSR $2de2 ; (vdc_restore_charsets.s0 + 0)
5511 : a9 00 __ LDA #$00
5513 : 85 0f __ STA P2 
5515 : a9 20 __ LDA #$20
5517 : 85 10 __ STA P3 
5519 : a5 55 __ LDA T3 + 0 
551b : 85 11 __ STA P4 
551d : a5 58 __ LDA T4 + 1 
551f : 85 12 __ STA P5 
5521 : 20 a6 2d JSR $2da6 ; (vdc_set_disp_address.s0 + 0)
5524 : a9 1b __ LDA #$1b
5526 : 85 0d __ STA P0 
5528 : a5 53 __ LDA T2 + 0 
552a : 85 0e __ STA P1 
552c : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
552f : a9 20 __ LDA #$20
5531 : 85 12 __ STA P5 
5533 : a5 11 __ LDA P4 
5535 : 85 16 __ STA P9 
5537 : a5 56 __ LDA T3 + 1 
5539 : 85 17 __ STA P10 
553b : a0 00 __ LDY #$00
553d : 84 11 __ STY P4 
553f : b1 51 __ LDA (T0 + 0),y 
5541 : 85 13 __ STA P6 
5543 : c8 __ __ INY
5544 : b1 51 __ LDA (T0 + 0),y 
5546 : 85 53 __ STA T2 + 0 
5548 : 85 14 __ STA P7 
554a : c8 __ __ INY
554b : b1 51 __ LDA (T0 + 0),y 
554d : 85 54 __ STA T2 + 1 
554f : 85 15 __ STA P8 
5551 : 20 ee 13 JSR $13ee ; (bnk_cpytovdc.s0 + 0)
5554 : a5 16 __ LDA P9 
5556 : 85 11 __ STA P4 
5558 : a5 58 __ LDA T4 + 1 
555a : 85 12 __ STA P5 
555c : 18 __ __ CLC
555d : a5 53 __ LDA T2 + 0 
555f : 65 16 __ ADC P9 
5561 : aa __ __ TAX
5562 : a5 56 __ LDA T3 + 1 
5564 : 85 17 __ STA P10 
5566 : 65 54 __ ADC T2 + 1 
5568 : a8 __ __ TAY
5569 : 8a __ __ TXA
556a : 18 __ __ CLC
556b : 69 30 __ ADC #$30
556d : 85 14 __ STA P7 
556f : 90 01 __ BCC $5572 ; (vdc_softscroll_init.s1009 + 0)
.s1008:
5571 : c8 __ __ INY
.s1009:
5572 : 84 15 __ STY P8 
5574 : 20 ee 13 JSR $13ee ; (bnk_cpytovdc.s0 + 0)
5577 : a9 00 __ LDA #$00
5579 : a0 05 __ LDY #$05
557b : 91 51 __ STA (T0 + 0),y 
557d : c8 __ __ INY
557e : 91 51 __ STA (T0 + 0),y 
5580 : c8 __ __ INY
5581 : 91 51 __ STA (T0 + 0),y 
5583 : c8 __ __ INY
5584 : 91 51 __ STA (T0 + 0),y 
5586 : a9 18 __ LDA #$18
5588 : 20 1e 21 JSR $211e ; (vdc_reg_read.s0 + 0)
558b : 29 f0 __ AND #$f0
558d : a0 09 __ LDY #$09
558f : 91 51 __ STA (T0 + 0),y 
5591 : a9 19 __ LDA #$19
5593 : 20 1e 21 JSR $211e ; (vdc_reg_read.s0 + 0)
5596 : 29 0f __ AND #$0f
5598 : a0 0d __ LDY #$0d
559a : 91 51 __ STA (T0 + 0),y 
559c : a9 19 __ LDA #$19
559e : 20 1e 21 JSR $211e ; (vdc_reg_read.s0 + 0)
55a1 : aa __ __ TAX
55a2 : a9 00 __ LDA #$00
55a4 : a0 0b __ LDY #$0b
55a6 : 91 51 __ STA (T0 + 0),y 
55a8 : c8 __ __ INY
55a9 : 91 51 __ STA (T0 + 0),y 
55ab : 8a __ __ TXA
55ac : 29 f0 __ AND #$f0
55ae : a0 0a __ LDY #$0a
55b0 : 91 51 __ STA (T0 + 0),y 
55b2 : a9 01 __ LDA #$01
.s1001:
55b4 : 85 1b __ STA ACCU + 0 
55b6 : a2 05 __ LDX #$05
55b8 : bd e9 bf LDA $bfe9,x ; (vp_fill + 31)
55bb : 95 53 __ STA T2 + 0,x 
55bd : ca __ __ DEX
55be : 10 f8 __ BPL $55b8 ; (vdc_softscroll_init.s1001 + 4)
55c0 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_softscroll_up: ; vdc_softscroll_up(struct VDCSoftScrollSettings*,u8)->void
.l73:
55c1 : ad 00 d6 LDA $d600 
55c4 : 29 20 __ AND #$20
55c6 : f0 f9 __ BEQ $55c1 ; (vdc_softscroll_up.l73 + 0)
.l6:
55c8 : ad 00 d6 LDA $d600 
55cb : 29 20 __ AND #$20
55cd : d0 f9 __ BNE $55c8 ; (vdc_softscroll_up.l6 + 0)
.s1:
55cf : a5 15 __ LDA P8 ; (step + 0)
55d1 : 38 __ __ SEC
55d2 : e9 01 __ SBC #$01
55d4 : aa __ __ TAX
55d5 : a9 00 __ LDA #$00
55d7 : a0 07 __ LDY #$07
55d9 : e9 00 __ SBC #$00
55db : 30 74 __ BMI $5651 ; (vdc_softscroll_up.s8 + 0)
.s1004:
55dd : c9 00 __ CMP #$00
55df : d0 05 __ BNE $55e6 ; (vdc_softscroll_up.s9 + 0)
.s1002:
55e1 : 8a __ __ TXA
55e2 : d1 13 __ CMP (P6),y ; (settings + 0)
55e4 : 90 6b __ BCC $5651 ; (vdc_softscroll_up.s8 + 0)
.s9:
55e6 : a0 0c __ LDY #$0c
55e8 : b1 13 __ LDA (P6),y ; (settings + 0)
55ea : d0 01 __ BNE $55ed ; (vdc_softscroll_up.s11 + 0)
.s1001:
55ec : 60 __ __ RTS
.s11:
55ed : aa __ __ TAX
55ee : 38 __ __ SEC
55ef : a9 08 __ LDA #$08
55f1 : e5 15 __ SBC P8 ; (step + 0)
55f3 : a0 07 __ LDY #$07
55f5 : 91 13 __ STA (P6),y ; (settings + 0)
55f7 : ca __ __ DEX
55f8 : 8a __ __ TXA
55f9 : a0 0c __ LDY #$0c
55fb : 91 13 __ STA (P6),y ; (settings + 0)
55fd : a0 03 __ LDY #$03
55ff : b1 13 __ LDA (P6),y ; (settings + 0)
5601 : 85 1b __ STA ACCU + 0 
5603 : 38 __ __ SEC
5604 : a0 05 __ LDY #$05
5606 : b1 13 __ LDA (P6),y ; (settings + 0)
5608 : e5 1b __ SBC ACCU + 0 
560a : 85 43 __ STA T1 + 0 
560c : 91 13 __ STA (P6),y ; (settings + 0)
560e : c8 __ __ INY
560f : b1 13 __ LDA (P6),y ; (settings + 0)
5611 : e9 00 __ SBC #$00
5613 : 85 44 __ STA T1 + 1 
5615 : 91 13 __ STA (P6),y ; (settings + 0)
.l77:
5617 : ad 00 d6 LDA $d600 
561a : 29 20 __ AND #$20
561c : d0 f9 __ BNE $5617 ; (vdc_softscroll_up.l77 + 0)
.s14:
561e : a9 18 __ LDA #$18
5620 : 85 0d __ STA P0 
5622 : a0 09 __ LDY #$09
5624 : b1 13 __ LDA (P6),y ; (settings + 0)
5626 : 18 __ __ CLC
5627 : a0 07 __ LDY #$07
5629 : 71 13 __ ADC (P6),y ; (settings + 0)
562b : 85 0e __ STA P1 
562d : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
5630 : ad 67 60 LDA $6067 ; (vdc_state + 8)
5633 : 18 __ __ CLC
5634 : 65 43 __ ADC T1 + 0 
5636 : 85 0f __ STA P2 
5638 : ad 68 60 LDA $6068 ; (vdc_state + 9)
563b : 65 44 __ ADC T1 + 1 
563d : 85 10 __ STA P3 
563f : ad 69 60 LDA $6069 ; (vdc_state + 10)
5642 : 18 __ __ CLC
5643 : 65 43 __ ADC T1 + 0 
5645 : 85 11 __ STA P4 
5647 : ad 6a 60 LDA $606a ; (vdc_state + 11)
564a : 65 44 __ ADC T1 + 1 
564c : 85 12 __ STA P5 
564e : 4c a6 2d JMP $2da6 ; (vdc_set_disp_address.s0 + 0)
.s8:
5651 : b1 13 __ LDA (P6),y ; (settings + 0)
5653 : 38 __ __ SEC
5654 : e5 15 __ SBC P8 ; (step + 0)
5656 : 85 43 __ STA T1 + 0 
5658 : 91 13 __ STA (P6),y ; (settings + 0)
565a : a9 18 __ LDA #$18
565c : 85 0d __ STA P0 
565e : a0 09 __ LDY #$09
5660 : b1 13 __ LDA (P6),y ; (settings + 0)
5662 : 18 __ __ CLC
5663 : 65 43 __ ADC T1 + 0 
5665 : 85 0e __ STA P1 
5667 : 4c 0e 21 JMP $210e ; (vdc_reg_write.s0 + 0)
--------------------------------------------------------------------
vdc_softscroll_down: ; vdc_softscroll_down(struct VDCSoftScrollSettings*,u8)->void
.l48:
566a : ad 00 d6 LDA $d600 
566d : 29 20 __ AND #$20
566f : f0 f9 __ BEQ $566a ; (vdc_softscroll_down.l48 + 0)
.l6:
5671 : ad 00 d6 LDA $d600 
5674 : 29 20 __ AND #$20
5676 : d0 f9 __ BNE $5671 ; (vdc_softscroll_down.l6 + 0)
.s1:
5678 : a5 15 __ LDA P8 ; (step + 0)
567a : 18 __ __ CLC
567b : a0 07 __ LDY #$07
567d : 71 13 __ ADC (P6),y ; (settings + 0)
567f : 85 43 __ STA T2 + 0 
5681 : 91 13 __ STA (P6),y ; (settings + 0)
5683 : 38 __ __ SEC
5684 : a9 08 __ LDA #$08
5686 : e5 15 __ SBC P8 ; (step + 0)
5688 : aa __ __ TAX
5689 : a9 00 __ LDA #$00
568b : e9 00 __ SBC #$00
568d : 30 18 __ BMI $56a7 ; (vdc_softscroll_down.s8 + 0)
.s1006:
568f : c9 00 __ CMP #$00
5691 : d0 04 __ BNE $5697 ; (vdc_softscroll_down.s9 + 0)
.s1004:
5693 : e4 43 __ CPX T2 + 0 
5695 : 90 10 __ BCC $56a7 ; (vdc_softscroll_down.s8 + 0)
.s9:
5697 : a9 18 __ LDA #$18
5699 : 85 0d __ STA P0 
569b : a0 09 __ LDY #$09
569d : b1 13 __ LDA (P6),y ; (settings + 0)
569f : 18 __ __ CLC
56a0 : 65 43 __ ADC T2 + 0 
56a2 : 85 0e __ STA P1 
56a4 : 4c 0e 21 JMP $210e ; (vdc_reg_write.s0 + 0)
.s8:
56a7 : a0 04 __ LDY #$04
56a9 : b1 13 __ LDA (P6),y ; (settings + 0)
56ab : 38 __ __ SEC
56ac : ed 64 60 SBC $6064 ; (vdc_state + 5)
56af : aa __ __ TAX
56b0 : a9 00 __ LDA #$00
56b2 : ed 65 60 SBC $6065 ; (vdc_state + 6)
56b5 : 85 1c __ STA ACCU + 1 
56b7 : 8a __ __ TXA
56b8 : 38 __ __ SEC
56b9 : e9 01 __ SBC #$01
56bb : 85 1b __ STA ACCU + 0 
56bd : a0 0c __ LDY #$0c
56bf : b1 13 __ LDA (P6),y ; (settings + 0)
56c1 : aa __ __ TAX
56c2 : a5 1c __ LDA ACCU + 1 
56c4 : e9 00 __ SBC #$00
56c6 : d0 0d __ BNE $56d5 ; (vdc_softscroll_down.s11 + 0)
.s1002:
56c8 : e4 1b __ CPX ACCU + 0 
56ca : 90 09 __ BCC $56d5 ; (vdc_softscroll_down.s11 + 0)
.s12:
56cc : a5 43 __ LDA T2 + 0 
56ce : e5 15 __ SBC P8 ; (step + 0)
56d0 : a0 07 __ LDY #$07
56d2 : 91 13 __ STA (P6),y ; (settings + 0)
.s1001:
56d4 : 60 __ __ RTS
.s11:
56d5 : a9 00 __ LDA #$00
56d7 : a0 07 __ LDY #$07
56d9 : 91 13 __ STA (P6),y ; (settings + 0)
56db : a9 18 __ LDA #$18
56dd : 85 0d __ STA P0 
56df : a0 09 __ LDY #$09
56e1 : b1 13 __ LDA (P6),y ; (settings + 0)
56e3 : 85 0e __ STA P1 
56e5 : e8 __ __ INX
56e6 : 8a __ __ TXA
56e7 : a0 0c __ LDY #$0c
56e9 : 91 13 __ STA (P6),y ; (settings + 0)
56eb : a0 03 __ LDY #$03
56ed : b1 13 __ LDA (P6),y ; (settings + 0)
56ef : 18 __ __ CLC
56f0 : a0 05 __ LDY #$05
56f2 : 71 13 __ ADC (P6),y ; (settings + 0)
56f4 : 85 43 __ STA T2 + 0 
56f6 : 91 13 __ STA (P6),y ; (settings + 0)
56f8 : c8 __ __ INY
56f9 : b1 13 __ LDA (P6),y ; (settings + 0)
56fb : 69 00 __ ADC #$00
56fd : 85 44 __ STA T2 + 1 
56ff : 91 13 __ STA (P6),y ; (settings + 0)
5701 : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
5704 : ad 67 60 LDA $6067 ; (vdc_state + 8)
5707 : 18 __ __ CLC
5708 : 65 43 __ ADC T2 + 0 
570a : 85 0f __ STA P2 
570c : ad 68 60 LDA $6068 ; (vdc_state + 9)
570f : 65 44 __ ADC T2 + 1 
5711 : 85 10 __ STA P3 
5713 : ad 69 60 LDA $6069 ; (vdc_state + 10)
5716 : 18 __ __ CLC
5717 : 65 43 __ ADC T2 + 0 
5719 : 85 11 __ STA P4 
571b : ad 6a 60 LDA $606a ; (vdc_state + 11)
571e : 65 44 __ ADC T2 + 1 
5720 : 85 12 __ STA P5 
5722 : 4c a6 2d JMP $2da6 ; (vdc_set_disp_address.s0 + 0)
--------------------------------------------------------------------
vdc_softscroll_left: ; vdc_softscroll_left(struct VDCSoftScrollSettings*,u8)->void
.s0:
5725 : a5 15 __ LDA P8 ; (step + 0)
5727 : 18 __ __ CLC
5728 : a0 08 __ LDY #$08
572a : 71 13 __ ADC (P6),y ; (settings + 0)
572c : 85 43 __ STA T2 + 0 
572e : 91 13 __ STA (P6),y ; (settings + 0)
5730 : 98 __ __ TYA
5731 : 38 __ __ SEC
5732 : e5 15 __ SBC P8 ; (step + 0)
5734 : aa __ __ TAX
5735 : a9 00 __ LDA #$00
5737 : e9 00 __ SBC #$00
5739 : 30 08 __ BMI $5743 ; (vdc_softscroll_left.s1 + 0)
.s1004:
573b : c9 00 __ CMP #$00
573d : d0 16 __ BNE $5755 ; (vdc_softscroll_left.s80 + 0)
.s1002:
573f : e4 43 __ CPX T2 + 0 
5741 : b0 12 __ BCS $5755 ; (vdc_softscroll_left.s80 + 0)
.s1:
5743 : a0 0d __ LDY #$0d
5745 : b1 13 __ LDA (P6),y ; (settings + 0)
5747 : 85 43 __ STA T2 + 0 
5749 : aa __ __ TAX
574a : a0 0b __ LDY #$0b
574c : b1 13 __ LDA (P6),y ; (settings + 0)
574e : d0 15 __ BNE $5765 ; (vdc_softscroll_left.s4 + 0)
.s5:
5750 : 8a __ __ TXA
5751 : a0 08 __ LDY #$08
5753 : 91 13 __ STA (P6),y ; (settings + 0)
.s80:
5755 : a0 0a __ LDY #$0a
5757 : b1 13 __ LDA (P6),y ; (settings + 0)
5759 : 18 __ __ CLC
575a : 65 43 __ ADC T2 + 0 
.s3:
575c : 85 0e __ STA P1 
575e : a9 19 __ LDA #$19
5760 : 85 0d __ STA P0 
5762 : 4c 0e 21 JMP $210e ; (vdc_reg_write.s0 + 0)
.s4:
5765 : 86 1b __ STX ACCU + 0 
5767 : 85 45 __ STA T5 + 0 
5769 : a9 00 __ LDA #$00
576b : 85 1c __ STA ACCU + 1 
576d : 85 04 __ STA WORK + 1 
576f : a5 15 __ LDA P8 ; (step + 0)
5771 : 85 03 __ STA WORK + 0 
5773 : 20 15 5a JSR $5a15 ; (divmod + 0)
5776 : a5 05 __ LDA WORK + 2 
5778 : a0 08 __ LDY #$08
577a : 91 13 __ STA (P6),y ; (settings + 0)
577c : 18 __ __ CLC
577d : a5 45 __ LDA T5 + 0 
577f : 69 ff __ ADC #$ff
5781 : a0 0b __ LDY #$0b
5783 : 91 13 __ STA (P6),y ; (settings + 0)
5785 : 18 __ __ CLC
5786 : a0 05 __ LDY #$05
5788 : b1 13 __ LDA (P6),y ; (settings + 0)
578a : 69 ff __ ADC #$ff
578c : 85 43 __ STA T2 + 0 
578e : 91 13 __ STA (P6),y ; (settings + 0)
5790 : c8 __ __ INY
5791 : b1 13 __ LDA (P6),y ; (settings + 0)
5793 : 69 ff __ ADC #$ff
5795 : 85 44 __ STA T2 + 1 
5797 : 91 13 __ STA (P6),y ; (settings + 0)
.l75:
5799 : ad 00 d6 LDA $d600 
579c : 29 20 __ AND #$20
579e : d0 f9 __ BNE $5799 ; (vdc_softscroll_left.l75 + 0)
.s7:
57a0 : ad 67 60 LDA $6067 ; (vdc_state + 8)
57a3 : 18 __ __ CLC
57a4 : 65 43 __ ADC T2 + 0 
57a6 : 85 0f __ STA P2 
57a8 : ad 68 60 LDA $6068 ; (vdc_state + 9)
57ab : 65 44 __ ADC T2 + 1 
57ad : 85 10 __ STA P3 
57af : ad 69 60 LDA $6069 ; (vdc_state + 10)
57b2 : 18 __ __ CLC
57b3 : 65 43 __ ADC T2 + 0 
57b5 : 85 11 __ STA P4 
57b7 : ad 6a 60 LDA $606a ; (vdc_state + 11)
57ba : 65 44 __ ADC T2 + 1 
57bc : 85 12 __ STA P5 
57be : 20 a6 2d JSR $2da6 ; (vdc_set_disp_address.s0 + 0)
.l77:
57c1 : ad 00 d6 LDA $d600 
57c4 : 29 20 __ AND #$20
57c6 : f0 f9 __ BEQ $57c1 ; (vdc_softscroll_left.l77 + 0)
.l15:
57c8 : ad 00 d6 LDA $d600 
57cb : 29 20 __ AND #$20
57cd : d0 f9 __ BNE $57c8 ; (vdc_softscroll_left.l15 + 0)
.s10:
57cf : a0 0a __ LDY #$0a
57d1 : b1 13 __ LDA (P6),y ; (settings + 0)
57d3 : 4c 5c 57 JMP $575c ; (vdc_softscroll_left.s3 + 0)
--------------------------------------------------------------------
vdc_softscroll_right: ; vdc_softscroll_right(struct VDCSoftScrollSettings*,u8)->void
.s0:
57d6 : a5 15 __ LDA P8 ; (step + 0)
57d8 : 38 __ __ SEC
57d9 : e9 01 __ SBC #$01
57db : aa __ __ TAX
57dc : a9 00 __ LDA #$00
57de : a0 08 __ LDY #$08
57e0 : e9 00 __ SBC #$00
57e2 : 10 03 __ BPL $57e7 ; (vdc_softscroll_right.s1006 + 0)
57e4 : 4c 96 58 JMP $5896 ; (vdc_softscroll_right.s1 + 0)
.s1006:
57e7 : c9 00 __ CMP #$00
57e9 : d0 08 __ BNE $57f3 ; (vdc_softscroll_right.s2 + 0)
.s1004:
57eb : 8a __ __ TXA
57ec : d1 13 __ CMP (P6),y ; (settings + 0)
57ee : b0 03 __ BCS $57f3 ; (vdc_softscroll_right.s2 + 0)
57f0 : 4c 96 58 JMP $5896 ; (vdc_softscroll_right.s1 + 0)
.s2:
57f3 : a0 03 __ LDY #$03
57f5 : b1 13 __ LDA (P6),y ; (settings + 0)
57f7 : 38 __ __ SEC
57f8 : ed 62 60 SBC $6062 ; (vdc_state + 3)
57fb : 85 1b __ STA ACCU + 0 
57fd : a9 00 __ LDA #$00
57ff : ed 63 60 SBC $6063 ; (vdc_state + 4)
5802 : 85 1c __ STA ACCU + 1 
5804 : a0 0b __ LDY #$0b
5806 : b1 13 __ LDA (P6),y ; (settings + 0)
5808 : 85 43 __ STA T0 + 0 
580a : 18 __ __ CLC
580b : 69 01 __ ADC #$01
580d : aa __ __ TAX
580e : a9 00 __ LDA #$00
5810 : 2a __ __ ROL
5811 : c5 1c __ CMP ACCU + 1 
5813 : d0 02 __ BNE $5817 ; (vdc_softscroll_right.s1003 + 0)
.s1002:
5815 : e4 1b __ CPX ACCU + 0 
.s1003:
5817 : 90 01 __ BCC $581a ; (vdc_softscroll_right.s7 + 0)
.s1001:
5819 : 60 __ __ RTS
.s7:
581a : a0 0d __ LDY #$0d
581c : b1 13 __ LDA (P6),y ; (settings + 0)
581e : 85 1b __ STA ACCU + 0 
5820 : a9 00 __ LDA #$00
5822 : 85 1c __ STA ACCU + 1 
5824 : 85 04 __ STA WORK + 1 
5826 : a5 15 __ LDA P8 ; (step + 0)
5828 : 85 03 __ STA WORK + 0 
582a : 20 15 5a JSR $5a15 ; (divmod + 0)
582d : 38 __ __ SEC
582e : a9 08 __ LDA #$08
5830 : e5 15 __ SBC P8 ; (step + 0)
5832 : 18 __ __ CLC
5833 : 65 05 __ ADC WORK + 2 
5835 : a0 08 __ LDY #$08
5837 : 91 13 __ STA (P6),y ; (settings + 0)
5839 : a6 43 __ LDX T0 + 0 
583b : e8 __ __ INX
583c : 8a __ __ TXA
583d : a0 0b __ LDY #$0b
583f : 91 13 __ STA (P6),y ; (settings + 0)
5841 : 18 __ __ CLC
5842 : a0 05 __ LDY #$05
5844 : b1 13 __ LDA (P6),y ; (settings + 0)
5846 : 69 01 __ ADC #$01
5848 : 85 44 __ STA T1 + 0 
584a : 91 13 __ STA (P6),y ; (settings + 0)
584c : c8 __ __ INY
584d : b1 13 __ LDA (P6),y ; (settings + 0)
584f : 69 00 __ ADC #$00
5851 : 85 45 __ STA T1 + 1 
5853 : 91 13 __ STA (P6),y ; (settings + 0)
.l86:
5855 : ad 00 d6 LDA $d600 
5858 : 29 20 __ AND #$20
585a : d0 f9 __ BNE $5855 ; (vdc_softscroll_right.l86 + 0)
.s10:
585c : ad 67 60 LDA $6067 ; (vdc_state + 8)
585f : 18 __ __ CLC
5860 : 65 44 __ ADC T1 + 0 
5862 : 85 0f __ STA P2 
5864 : ad 68 60 LDA $6068 ; (vdc_state + 9)
5867 : 65 45 __ ADC T1 + 1 
5869 : 85 10 __ STA P3 
586b : ad 69 60 LDA $6069 ; (vdc_state + 10)
586e : 18 __ __ CLC
586f : 65 44 __ ADC T1 + 0 
5871 : 85 11 __ STA P4 
5873 : ad 6a 60 LDA $606a ; (vdc_state + 11)
5876 : 65 45 __ ADC T1 + 1 
5878 : 85 12 __ STA P5 
587a : 20 a6 2d JSR $2da6 ; (vdc_set_disp_address.s0 + 0)
.l83:
587d : ad 00 d6 LDA $d600 
5880 : 29 20 __ AND #$20
5882 : f0 f9 __ BEQ $587d ; (vdc_softscroll_right.l83 + 0)
.s166:
5884 : a9 19 __ LDA #$19
5886 : 85 0d __ STA P0 
5888 : a0 0a __ LDY #$0a
588a : b1 13 __ LDA (P6),y ; (settings + 0)
588c : 18 __ __ CLC
588d : a0 08 __ LDY #$08
588f : 71 13 __ ADC (P6),y ; (settings + 0)
5891 : 85 0e __ STA P1 
5893 : 4c 0e 21 JMP $210e ; (vdc_reg_write.s0 + 0)
.s1:
5896 : b1 13 __ LDA (P6),y ; (settings + 0)
5898 : 38 __ __ SEC
5899 : e5 15 __ SBC P8 ; (step + 0)
589b : 91 13 __ STA (P6),y ; (settings + 0)
589d : 4c 7d 58 JMP $587d ; (vdc_softscroll_right.l83 + 0)
--------------------------------------------------------------------
vdc_softscroll_exit: ; vdc_softscroll_exit(struct VDCSoftScrollSettings*,u8)->void
.s1000:
58a0 : a5 53 __ LDA T0 + 0 
58a2 : 8d ee bf STA $bfee ; (buffer + 14)
58a5 : a5 54 __ LDA T0 + 1 
58a7 : 8d ef bf STA $bfef ; (buffer + 15)
.s0:
58aa : 20 d2 21 JSR $21d2 ; (vdc_cls.s0 + 0)
58ad : a9 1b __ LDA #$1b
58af : 85 0d __ STA P0 
58b1 : a9 00 __ LDA #$00
58b3 : 85 0e __ STA P1 
58b5 : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
58b8 : a9 18 __ LDA #$18
58ba : 85 0d __ STA P0 
58bc : ad f7 bf LDA $bff7 ; (sstack + 7)
58bf : 85 53 __ STA T0 + 0 
58c1 : ad f8 bf LDA $bff8 ; (sstack + 8)
58c4 : 85 54 __ STA T0 + 1 
58c6 : a0 09 __ LDY #$09
58c8 : b1 53 __ LDA (T0 + 0),y 
58ca : 85 0e __ STA P1 
58cc : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
58cf : e6 0d __ INC P0 
58d1 : a0 0a __ LDY #$0a
58d3 : b1 53 __ LDA (T0 + 0),y 
58d5 : 18 __ __ CLC
58d6 : a0 0d __ LDY #$0d
58d8 : 71 53 __ ADC (T0 + 0),y 
58da : 85 0e __ STA P1 
58dc : 20 0e 21 JSR $210e ; (vdc_reg_write.s0 + 0)
58df : ad f9 bf LDA $bff9 ; (sstack + 9)
58e2 : 8d f6 bf STA $bff6 ; (sstack + 6)
58e5 : 20 2d 2c JSR $2c2d ; (vdc_set_mode.s0 + 0)
.s1001:
58e8 : ad ee bf LDA $bfee ; (buffer + 14)
58eb : 85 53 __ STA T0 + 0 
58ed : ad ef bf LDA $bfef ; (buffer + 15)
58f0 : 85 54 __ STA T0 + 1 
58f2 : 60 __ __ RTS
--------------------------------------------------------------------
charset_demo: ; charset_demo()->void
.s0:
58f3 : a9 00 __ LDA #$00
58f5 : 8d f1 bf STA $bff1 ; (sstack + 1)
58f8 : a9 02 __ LDA #$02
58fa : 8d f2 bf STA $bff2 ; (sstack + 2)
58fd : a9 20 __ LDA #$20
58ff : 8d f3 bf STA $bff3 ; (sstack + 3)
5902 : a9 50 __ LDA #$50
5904 : 8d f4 bf STA $bff4 ; (sstack + 4)
5907 : ae 64 60 LDX $6064 ; (vdc_state + 5)
590a : ca __ __ DEX
590b : ca __ __ DEX
590c : 8e f5 bf STX $bff5 ; (sstack + 5)
590f : 20 ee 21 JSR $21ee ; (vdc_clear.s0 + 0)
5912 : a9 02 __ LDA #$02
5914 : 8d f9 bf STA $bff9 ; (sstack + 9)
5917 : a9 00 __ LDA #$00
5919 : 8d fa bf STA $bffa ; (sstack + 10)
591c : 8d fb bf STA $bffb ; (sstack + 11)
591f : 20 d0 4b JSR $4bd0 ; (screen_switch.s1000 + 0)
5922 : a9 7f __ LDA #$7f
5924 : 85 17 __ STA P10 
5926 : a9 50 __ LDA #$50
5928 : 8d f2 bf STA $bff2 ; (sstack + 2)
592b : 8d f6 bf STA $bff6 ; (sstack + 6)
592e : a9 00 __ LDA #$00
5930 : 8d f0 bf STA $bff0 ; (sstack + 0)
5933 : 8d f3 bf STA $bff3 ; (sstack + 3)
5936 : 8d f5 bf STA $bff5 ; (sstack + 5)
5939 : 8d f7 bf STA $bff7 ; (sstack + 7)
593c : 8d fa bf STA $bffa ; (sstack + 10)
593f : a9 19 __ LDA #$19
5941 : 8d f4 bf STA $bff4 ; (sstack + 4)
5944 : a9 b9 __ LDA #$b9
5946 : 85 15 __ STA P8 
5948 : a9 bf __ LDA #$bf
594a : 85 16 __ STA P9 
594c : a9 40 __ LDA #$40
594e : 8d f1 bf STA $bff1 ; (sstack + 1)
5951 : ad 64 60 LDA $6064 ; (vdc_state + 5)
5954 : 38 __ __ SEC
5955 : e9 02 __ SBC #$02
5957 : 8d f8 bf STA $bff8 ; (sstack + 8)
595a : ad 65 60 LDA $6065 ; (vdc_state + 6)
595d : 85 44 __ STA T1 + 1 
595f : e9 00 __ SBC #$00
5961 : 8d f9 bf STA $bff9 ; (sstack + 9)
5964 : 46 44 __ LSR T1 + 1 
5966 : ad 64 60 LDA $6064 ; (vdc_state + 5)
5969 : 6a __ __ ROR
596a : 38 __ __ SEC
596b : e9 0a __ SBC #$0a
596d : 8d fb bf STA $bffb ; (sstack + 11)
5970 : 20 e1 37 JSR $37e1 ; (vdcwin_viewport_init.s0 + 0)
5973 : a9 b9 __ LDA #$b9
5975 : 8d f0 bf STA $bff0 ; (sstack + 0)
5978 : a9 bf __ LDA #$bf
597a : 8d f1 bf STA $bff1 ; (sstack + 1)
597d : 20 37 39 JSR $3937 ; (vdcwin_cpy_viewport.s0 + 0)
5980 : 20 f0 29 JSR $29f0 ; (getch.s0 + 0)
5983 : a9 02 __ LDA #$02
5985 : 8d f9 bf STA $bff9 ; (sstack + 9)
5988 : a9 01 __ LDA #$01
598a : 8d fa bf STA $bffa ; (sstack + 10)
598d : a9 00 __ LDA #$00
598f : 8d fb bf STA $bffb ; (sstack + 11)
5992 : 4c d0 4b JMP $4bd0 ; (screen_switch.s1000 + 0)
--------------------------------------------------------------------
5995 : __ __ __ BYT 4d 55 53 49 43 25 55 00                         : MUSIC%U.
--------------------------------------------------------------------
vdc_exit: ; vdc_exit()->void
.s0:
599d : a9 00 __ LDA #$00
599f : 20 0e 2c JSR $2c0e ; (fastmode.s0 + 0)
59a2 : a9 00 __ LDA #$00
59a4 : 8d f6 bf STA $bff6 ; (sstack + 6)
59a7 : 20 2d 2c JSR $2c2d ; (vdc_set_mode.s0 + 0)
59aa : 20 d2 21 JSR $21d2 ; (vdc_cls.s0 + 0)
59ad : a9 04 __ LDA #$04
59af : 8d 06 d5 STA $d506 
.s1001:
59b2 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
59b3 : a0 00 __ LDY #$00
59b5 : 84 06 __ STY WORK + 3 
59b7 : 4a __ __ LSR
59b8 : 90 0d __ BCC $59c7 ; (mul16by8 + 20)
59ba : aa __ __ TAX
59bb : 18 __ __ CLC
59bc : 98 __ __ TYA
59bd : 65 1b __ ADC ACCU + 0 
59bf : a8 __ __ TAY
59c0 : a5 06 __ LDA WORK + 3 
59c2 : 65 1c __ ADC ACCU + 1 
59c4 : 85 06 __ STA WORK + 3 
59c6 : 8a __ __ TXA
59c7 : 06 1b __ ASL ACCU + 0 
59c9 : 26 1c __ ROL ACCU + 1 
59cb : 4a __ __ LSR
59cc : b0 ec __ BCS $59ba ; (mul16by8 + 7)
59ce : d0 f7 __ BNE $59c7 ; (mul16by8 + 20)
59d0 : 84 05 __ STY WORK + 2 
59d2 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
59d3 : a0 00 __ LDY #$00
59d5 : 84 06 __ STY WORK + 3 
59d7 : a5 03 __ LDA WORK + 0 
59d9 : a6 04 __ LDX WORK + 1 
59db : f0 1c __ BEQ $59f9 ; (mul16 + 38)
59dd : 38 __ __ SEC
59de : 6a __ __ ROR
59df : 90 0d __ BCC $59ee ; (mul16 + 27)
59e1 : aa __ __ TAX
59e2 : 18 __ __ CLC
59e3 : 98 __ __ TYA
59e4 : 65 1b __ ADC ACCU + 0 
59e6 : a8 __ __ TAY
59e7 : a5 06 __ LDA WORK + 3 
59e9 : 65 1c __ ADC ACCU + 1 
59eb : 85 06 __ STA WORK + 3 
59ed : 8a __ __ TXA
59ee : 06 1b __ ASL ACCU + 0 
59f0 : 26 1c __ ROL ACCU + 1 
59f2 : 4a __ __ LSR
59f3 : 90 f9 __ BCC $59ee ; (mul16 + 27)
59f5 : d0 ea __ BNE $59e1 ; (mul16 + 14)
59f7 : a5 04 __ LDA WORK + 1 
59f9 : 4a __ __ LSR
59fa : 90 0d __ BCC $5a09 ; (mul16 + 54)
59fc : aa __ __ TAX
59fd : 18 __ __ CLC
59fe : 98 __ __ TYA
59ff : 65 1b __ ADC ACCU + 0 
5a01 : a8 __ __ TAY
5a02 : a5 06 __ LDA WORK + 3 
5a04 : 65 1c __ ADC ACCU + 1 
5a06 : 85 06 __ STA WORK + 3 
5a08 : 8a __ __ TXA
5a09 : 06 1b __ ASL ACCU + 0 
5a0b : 26 1c __ ROL ACCU + 1 
5a0d : 4a __ __ LSR
5a0e : b0 ec __ BCS $59fc ; (mul16 + 41)
5a10 : d0 f7 __ BNE $5a09 ; (mul16 + 54)
5a12 : 84 05 __ STY WORK + 2 
5a14 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
5a15 : a5 1c __ LDA ACCU + 1 
5a17 : d0 31 __ BNE $5a4a ; (divmod + 53)
5a19 : a5 04 __ LDA WORK + 1 
5a1b : d0 1e __ BNE $5a3b ; (divmod + 38)
5a1d : 85 06 __ STA WORK + 3 
5a1f : a2 04 __ LDX #$04
5a21 : 06 1b __ ASL ACCU + 0 
5a23 : 2a __ __ ROL
5a24 : c5 03 __ CMP WORK + 0 
5a26 : 90 02 __ BCC $5a2a ; (divmod + 21)
5a28 : e5 03 __ SBC WORK + 0 
5a2a : 26 1b __ ROL ACCU + 0 
5a2c : 2a __ __ ROL
5a2d : c5 03 __ CMP WORK + 0 
5a2f : 90 02 __ BCC $5a33 ; (divmod + 30)
5a31 : e5 03 __ SBC WORK + 0 
5a33 : 26 1b __ ROL ACCU + 0 
5a35 : ca __ __ DEX
5a36 : d0 eb __ BNE $5a23 ; (divmod + 14)
5a38 : 85 05 __ STA WORK + 2 
5a3a : 60 __ __ RTS
5a3b : a5 1b __ LDA ACCU + 0 
5a3d : 85 05 __ STA WORK + 2 
5a3f : a5 1c __ LDA ACCU + 1 
5a41 : 85 06 __ STA WORK + 3 
5a43 : a9 00 __ LDA #$00
5a45 : 85 1b __ STA ACCU + 0 
5a47 : 85 1c __ STA ACCU + 1 
5a49 : 60 __ __ RTS
5a4a : a5 04 __ LDA WORK + 1 
5a4c : d0 1f __ BNE $5a6d ; (divmod + 88)
5a4e : a5 03 __ LDA WORK + 0 
5a50 : 30 1b __ BMI $5a6d ; (divmod + 88)
5a52 : a9 00 __ LDA #$00
5a54 : 85 06 __ STA WORK + 3 
5a56 : a2 10 __ LDX #$10
5a58 : 06 1b __ ASL ACCU + 0 
5a5a : 26 1c __ ROL ACCU + 1 
5a5c : 2a __ __ ROL
5a5d : c5 03 __ CMP WORK + 0 
5a5f : 90 02 __ BCC $5a63 ; (divmod + 78)
5a61 : e5 03 __ SBC WORK + 0 
5a63 : 26 1b __ ROL ACCU + 0 
5a65 : 26 1c __ ROL ACCU + 1 
5a67 : ca __ __ DEX
5a68 : d0 f2 __ BNE $5a5c ; (divmod + 71)
5a6a : 85 05 __ STA WORK + 2 
5a6c : 60 __ __ RTS
5a6d : a9 00 __ LDA #$00
5a6f : 85 05 __ STA WORK + 2 
5a71 : 85 06 __ STA WORK + 3 
5a73 : 84 02 __ STY $02 
5a75 : a0 10 __ LDY #$10
5a77 : 18 __ __ CLC
5a78 : 26 1b __ ROL ACCU + 0 
5a7a : 26 1c __ ROL ACCU + 1 
5a7c : 26 05 __ ROL WORK + 2 
5a7e : 26 06 __ ROL WORK + 3 
5a80 : 38 __ __ SEC
5a81 : a5 05 __ LDA WORK + 2 
5a83 : e5 03 __ SBC WORK + 0 
5a85 : aa __ __ TAX
5a86 : a5 06 __ LDA WORK + 3 
5a88 : e5 04 __ SBC WORK + 1 
5a8a : 90 04 __ BCC $5a90 ; (divmod + 123)
5a8c : 86 05 __ STX WORK + 2 
5a8e : 85 06 __ STA WORK + 3 
5a90 : 88 __ __ DEY
5a91 : d0 e5 __ BNE $5a78 ; (divmod + 99)
5a93 : 26 1b __ ROL ACCU + 0 
5a95 : 26 1c __ ROL ACCU + 1 
5a97 : a4 02 __ LDY $02 
5a99 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
5a9a : 84 02 __ STY $02 
5a9c : a0 20 __ LDY #$20
5a9e : a9 00 __ LDA #$00
5aa0 : 85 07 __ STA WORK + 4 
5aa2 : 85 08 __ STA WORK + 5 
5aa4 : 85 09 __ STA WORK + 6 
5aa6 : 85 0a __ STA WORK + 7 
5aa8 : a5 05 __ LDA WORK + 2 
5aaa : 05 06 __ ORA WORK + 3 
5aac : d0 39 __ BNE $5ae7 ; (divmod32 + 77)
5aae : 18 __ __ CLC
5aaf : 26 1b __ ROL ACCU + 0 
5ab1 : 26 1c __ ROL ACCU + 1 
5ab3 : 26 1d __ ROL ACCU + 2 
5ab5 : 26 1e __ ROL ACCU + 3 
5ab7 : 26 07 __ ROL WORK + 4 
5ab9 : 26 08 __ ROL WORK + 5 
5abb : 90 0c __ BCC $5ac9 ; (divmod32 + 47)
5abd : a5 07 __ LDA WORK + 4 
5abf : e5 03 __ SBC WORK + 0 
5ac1 : aa __ __ TAX
5ac2 : a5 08 __ LDA WORK + 5 
5ac4 : e5 04 __ SBC WORK + 1 
5ac6 : 38 __ __ SEC
5ac7 : b0 0c __ BCS $5ad5 ; (divmod32 + 59)
5ac9 : 38 __ __ SEC
5aca : a5 07 __ LDA WORK + 4 
5acc : e5 03 __ SBC WORK + 0 
5ace : aa __ __ TAX
5acf : a5 08 __ LDA WORK + 5 
5ad1 : e5 04 __ SBC WORK + 1 
5ad3 : 90 04 __ BCC $5ad9 ; (divmod32 + 63)
5ad5 : 86 07 __ STX WORK + 4 
5ad7 : 85 08 __ STA WORK + 5 
5ad9 : 88 __ __ DEY
5ada : d0 d3 __ BNE $5aaf ; (divmod32 + 21)
5adc : 26 1b __ ROL ACCU + 0 
5ade : 26 1c __ ROL ACCU + 1 
5ae0 : 26 1d __ ROL ACCU + 2 
5ae2 : 26 1e __ ROL ACCU + 3 
5ae4 : a4 02 __ LDY $02 
5ae6 : 60 __ __ RTS
5ae7 : 18 __ __ CLC
5ae8 : 26 1b __ ROL ACCU + 0 
5aea : 26 1c __ ROL ACCU + 1 
5aec : 26 1d __ ROL ACCU + 2 
5aee : 26 1e __ ROL ACCU + 3 
5af0 : 26 07 __ ROL WORK + 4 
5af2 : 26 08 __ ROL WORK + 5 
5af4 : 26 09 __ ROL WORK + 6 
5af6 : 26 0a __ ROL WORK + 7 
5af8 : a5 07 __ LDA WORK + 4 
5afa : c5 03 __ CMP WORK + 0 
5afc : a5 08 __ LDA WORK + 5 
5afe : e5 04 __ SBC WORK + 1 
5b00 : a5 09 __ LDA WORK + 6 
5b02 : e5 05 __ SBC WORK + 2 
5b04 : a5 0a __ LDA WORK + 7 
5b06 : e5 06 __ SBC WORK + 3 
5b08 : 90 18 __ BCC $5b22 ; (divmod32 + 136)
5b0a : a5 07 __ LDA WORK + 4 
5b0c : e5 03 __ SBC WORK + 0 
5b0e : 85 07 __ STA WORK + 4 
5b10 : a5 08 __ LDA WORK + 5 
5b12 : e5 04 __ SBC WORK + 1 
5b14 : 85 08 __ STA WORK + 5 
5b16 : a5 09 __ LDA WORK + 6 
5b18 : e5 05 __ SBC WORK + 2 
5b1a : 85 09 __ STA WORK + 6 
5b1c : a5 0a __ LDA WORK + 7 
5b1e : e5 06 __ SBC WORK + 3 
5b20 : 85 0a __ STA WORK + 7 
5b22 : 88 __ __ DEY
5b23 : d0 c3 __ BNE $5ae8 ; (divmod32 + 78)
5b25 : 26 1b __ ROL ACCU + 0 
5b27 : 26 1c __ ROL ACCU + 1 
5b29 : 26 1d __ ROL ACCU + 2 
5b2b : 26 1e __ ROL ACCU + 3 
5b2d : a4 02 __ LDY $02 
5b2f : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
5b30 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
__multab13L:
5b36 : __ __ __ BYT 00 0d 1a 27                                     : ...'
--------------------------------------------------------------------
__multab9L:
5b3a : __ __ __ BYT 00 09 12 1b 24 2d 36                            : ....$-6
--------------------------------------------------------------------
__multab102L:
5b41 : __ __ __ BYT 00 66 cc 32 98 fe 64 ca                         : .f.2..d.
--------------------------------------------------------------------
__multab102H:
5b49 : __ __ __ BYT 00 00 00 01 01 01 02 02                         : ........
--------------------------------------------------------------------
__multab6L:
5b51 : __ __ __ BYT 00 06 0c 12 18                                  : .....
--------------------------------------------------------------------
__multab15L:
5b56 : __ __ __ BYT 00 0f 1e 2d 3c                                  : ...-<
--------------------------------------------------------------------
winStyles:
5b5b : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
5b6b : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
menubar:
5b6d : __ __ __ BYT 73 45 54 54 49 4e 47 53 00 77 49 4e 44 4f 57 53 : sETTINGS.wINDOWS
5b7d : __ __ __ BYT 00 00 76 49 45 57 50 4f 52 54 00 73 43 52 4f 4c : ..vIEWPORT.sCROL
5b8d : __ __ __ BYT 4c 00 00 00 63 48 41 52 53 45 54 00 00 6d 55 53 : L...cHARSET..mUS
5b9d : __ __ __ BYT 49 43 00 00 00 00 00 00 00 00 00 00 01          : IC...........
--------------------------------------------------------------------
pulldown_options:
5baa : __ __ __ BYT 03 02 02 02 01 04 02 06                         : ........
--------------------------------------------------------------------
5bb2 : __ __ __ BYT 74 48 45 00 61 00 00 00                         : tHE.a...
--------------------------------------------------------------------
5bba : __ __ __ BYT 46 4c 49 45 53 00 4a 55 4d 50 53 00 53 4c 45 45 : FLIES.JUMPS.SLEE
5bca : __ __ __ BYT 50 53 45 41 54 53 00 00 57 41 4c 4b 53 00       : PSEATS..WALKS.
--------------------------------------------------------------------
5bd8 : __ __ __ BYT 42 49 47 00 00 00 53 4d 41 4c 4c 00 41 4e 47 52 : BIG...SMALL.ANGR
5be8 : __ __ __ BYT 59 00 57 45 54 00 00 00 48 41 50 50 59 00       : Y.WET...HAPPY.
--------------------------------------------------------------------
p2smap:
5bf6 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
bootdevice:
5bfe : __ __ __ BSS	1
--------------------------------------------------------------------
vdc_modes:
5c00 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
5c10 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
5c20 : __ __ __ BYT e7 24 7e ff 50 00 32 00 00 00 00 00 10 00 40 00 : .$~.P.2.......@.
5c30 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
5c40 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
5c50 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
5c60 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
5c70 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
5c80 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
5c90 : __ __ __ BYT 50 00 32 00 00 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
5ca0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
5cb0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
5cc0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
5cd0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
pulldown_titles:
5cd8 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 00 00 00 00 00 00 : sCREENMODE......
5ce8 : __ __ __ BYT 00 69 4e 46 4f 20 20 20 20 20 20 00 00 00 00 00 : .iNFO      .....
5cf8 : __ __ __ BYT 00 00 65 58 49 54 20 20 20 20 20 20 00 00 00 00 : ..eXIT      ....
5d08 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5d18 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5d28 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5d38 : __ __ __ BYT 00 00 00 00 00 00 77 49 4e 44 4f 57 20 4f 4e 20 : ......wINDOW ON 
5d48 : __ __ __ BYT 57 49 4e 44 4f 57 00 74 45 58 54 20 45 4e 54 52 : WINDOW.tEXT ENTR
5d58 : __ __ __ BYT 59 20 20 20 20 20 20 00 00 00 00 00 00 00 00 00 : Y      .........
5d68 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5d78 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5d88 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5d98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 73 43 52 45 : ............sCRE
5da8 : __ __ __ BYT 45 4e 20 31 00 00 00 00 00 00 00 00 00 73 43 52 : EN 1.........sCR
5db8 : __ __ __ BYT 45 45 4e 20 32 00 00 00 00 00 00 00 00 00 00 00 : EEN 2...........
5dc8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5dd8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5de8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5df8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5e08 : __ __ __ BYT 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 31 00 00 : ..fULLSCREEN 1..
5e18 : __ __ __ BYT 00 00 00 66 55 4c 4c 53 43 52 45 45 4e 20 32 00 : ...fULLSCREEN 2.
5e28 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5e38 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5e48 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5e58 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5e68 : __ __ __ BYT 00 00 00 00 00 00 00 00 63 48 41 52 53 45 54 20 : ........cHARSET 
5e78 : __ __ __ BYT 44 45 4d 4f 00 00 00 00 00 00 00 00 00 00 00 00 : DEMO............
5e88 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5e98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5ea8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5eb8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5ec8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 75 4c : ..............uL
5ed8 : __ __ __ BYT 54 49 4d 41 54 45 20 61 58 45 4c 20 66 00 00 66 : TIMATE aXEL f..f
5ee8 : __ __ __ BYT 41 44 45 44 20 20 20 20 20 20 20 20 20 20 00 00 : ADED          ..
5ef8 : __ __ __ BYT 73 54 4f 50 20 4d 55 53 49 43 20 20 20 20 20 00 : sTOP MUSIC     .
5f08 : __ __ __ BYT 00 72 45 53 54 41 52 54 20 4d 55 53 49 43 20 20 : .rESTART MUSIC  
5f18 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5f28 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5f38 : __ __ __ BYT 00 00 00 00 79 45 53 00 00 00 00 00 00 00 00 00 : ....yES.........
5f48 : __ __ __ BYT 00 00 00 00 00 6e 4f 20 00 00 00 00 00 00 00 00 : .....nO ........
5f58 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5f68 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5f78 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5f88 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5f98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 70 61 6c 20 20 38 : ..........pal  8
5fa8 : __ __ __ BYT 30 58 32 35 00 00 00 00 00 00 00 70 61 6c 20 20 : 0X25.......pal  
5fb8 : __ __ __ BYT 38 30 58 35 30 00 00 00 00 00 00 00 70 61 6c 20 : 80X50.......pal 
5fc8 : __ __ __ BYT 20 38 30 58 37 30 00 00 00 00 00 00 00 6e 74 73 :  80X70.......nts
5fd8 : __ __ __ BYT 63 20 38 30 58 32 35 00 00 00 00 00 00 00 6e 74 : c 80X25.......nt
5fe8 : __ __ __ BYT 73 63 20 38 30 58 35 30 00 00 00 00 00 00 00 6e : sc 80X50.......n
5ff8 : __ __ __ BYT 74 73 63 20 38 30 58 36 30 00 00 00 00 00 00 00 : tsc 80X60.......
--------------------------------------------------------------------
6008 : __ __ __ BYT 42 4c 55 45 20 4a 41 59 00 00 00 00 00 00 00 43 : BLUE JAY.......C
6018 : __ __ __ BYT 41 52 44 49 4e 41 4c 00 00 00 00 00 00 00 45 41 : ARDINAL.......EA
6028 : __ __ __ BYT 53 54 45 52 4e 20 50 48 4f 45 42 45 00 47 52 41 : STERN PHOEBE.GRA
6038 : __ __ __ BYT 43 4b 4c 45 00 00 00 00 00 00 00 00 53 41 4e 44 : CKLE........SAND
6048 : __ __ __ BYT 48 49 4c 4c 20 43 52 41 4e 45 00                : HILL CRANE.
--------------------------------------------------------------------
screenset:
6053 : __ __ __ BYT 50 96 a0 4b                                     : P..K
--------------------------------------------------------------------
winCfg:
6057 : __ __ __ BSS	8
--------------------------------------------------------------------
vdc_state:
605f : __ __ __ BSS	25
--------------------------------------------------------------------
krnio_pstatus:
6078 : __ __ __ BSS	16
--------------------------------------------------------------------
linebuffer:
6088 : __ __ __ BSS	81
--------------------------------------------------------------------
windows:
60d9 : __ __ __ BSS	39
--------------------------------------------------------------------
multab:
6100 : __ __ __ BSS	144
--------------------------------------------------------------------
bnk_redef_charset: ; bnk_redef_charset(u16,u8,u8*,u16)->void
.s0:
01:1300 : ad 00 ff LDA $ff00 
01:1303 : 85 43 __ STA T0 + 0 
01:1305 : a9 0e __ LDA #$0e
01:1307 : 8d 00 ff STA $ff00 
01:130a : a5 11 __ LDA P4 ; (vdcdest + 0)
01:130c : 85 0f __ STA P2 
01:130e : a5 12 __ LDA P5 ; (vdcdest + 1)
01:1310 : 85 10 __ STA P3 
01:1312 : 20 a2 21 JSR $21a2 ; (vdc_mem_addr.s0 + 0)
01:1315 : a5 16 __ LDA P9 ; (size + 0)
01:1317 : 05 17 __ ORA P10 ; (size + 1)
01:1319 : d0 06 __ BNE $1321 ; (bnk_redef_charset.l2 + 0)
.s3:
01:131b : a5 43 __ LDA T0 + 0 
01:131d : 8d 00 ff STA $ff00 
.s1001:
01:1320 : 60 __ __ RTS
.l2:
01:1321 : a2 08 __ LDX #$08
.l5:
01:1323 : a5 13 __ LDA P6 ; (scr + 0)
01:1325 : 8d 00 ff STA $ff00 
01:1328 : a0 00 __ LDY #$00
01:132a : b1 14 __ LDA (P7),y ; (sp + 0)
01:132c : a8 __ __ TAY
01:132d : e6 14 __ INC P7 ; (sp + 0)
01:132f : d0 02 __ BNE $1333 ; (bnk_redef_charset.s1012 + 0)
.s1011:
01:1331 : e6 15 __ INC P8 ; (sp + 1)
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
01:1352 : a5 16 __ LDA P9 ; (size + 0)
01:1354 : d0 02 __ BNE $1358 ; (bnk_redef_charset.s1007 + 0)
.s1006:
01:1356 : c6 17 __ DEC P10 ; (size + 1)
.s1007:
01:1358 : c6 16 __ DEC P9 ; (size + 0)
01:135a : d0 c5 __ BNE $1321 ; (bnk_redef_charset.l2 + 0)
.s1008:
01:135c : a5 17 __ LDA P10 ; (size + 1)
01:135e : d0 c1 __ BNE $1321 ; (bnk_redef_charset.l2 + 0)
01:1360 : 4c 1b 13 JMP $131b ; (bnk_redef_charset.s3 + 0)
--------------------------------------------------------------------
bnk_load: ; bnk_load(u8,u8,const u8*,const u8*)->bool
.s0:
01:1363 : a9 00 __ LDA #$00
01:1365 : 85 0e __ STA P1 
01:1367 : a5 10 __ LDA P3 ; (bank + 0)
01:1369 : 85 0d __ STA P0 
01:136b : 20 7c 2b JSR $2b7c ; (krnio_setbnk.s0 + 0)
01:136e : a5 13 __ LDA P6 ; (fname + 0)
01:1370 : 85 0d __ STA P0 
01:1372 : a5 14 __ LDA P7 ; (fname + 1)
01:1374 : 85 0e __ STA P1 
01:1376 : 20 84 2b JSR $2b84 ; (krnio_setnam.s0 + 0)
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
01:1397 : 85 45 __ STA T1 + 0 
01:1399 : ad f0 bf LDA $bff0 ; (sstack + 0)
01:139c : 0d f1 bf ORA $bff1 ; (sstack + 1)
01:139f : f0 47 __ BEQ $13e8 ; (bnk_cpyfromvdc.s3 + 0)
.l2:
01:13a1 : a9 0e __ LDA #$0e
01:13a3 : 8d 00 ff STA $ff00 
01:13a6 : a5 16 __ LDA P9 ; (vdcsrc + 0)
01:13a8 : 85 11 __ STA P4 
01:13aa : 18 __ __ CLC
01:13ab : 69 01 __ ADC #$01
01:13ad : 85 16 __ STA P9 ; (vdcsrc + 0)
01:13af : a5 17 __ LDA P10 ; (vdcsrc + 1)
01:13b1 : 85 12 __ STA P5 
01:13b3 : 69 00 __ ADC #$00
01:13b5 : 85 17 __ STA P10 ; (vdcsrc + 1)
01:13b7 : 20 bc 21 JSR $21bc ; (vdc_mem_read_at.s0 + 0)
01:13ba : a5 13 __ LDA P6 ; (dcr + 0)
01:13bc : 8d 00 ff STA $ff00 
01:13bf : a5 14 __ LDA P7 ; (dp + 0)
01:13c1 : 85 43 __ STA T0 + 0 
01:13c3 : 18 __ __ CLC
01:13c4 : 69 01 __ ADC #$01
01:13c6 : 85 14 __ STA P7 ; (dp + 0)
01:13c8 : a5 15 __ LDA P8 ; (dp + 1)
01:13ca : 85 44 __ STA T0 + 1 
01:13cc : 69 00 __ ADC #$00
01:13ce : 85 15 __ STA P8 ; (dp + 1)
01:13d0 : a5 1b __ LDA ACCU + 0 
01:13d2 : a0 00 __ LDY #$00
01:13d4 : 91 43 __ STA (T0 + 0),y 
01:13d6 : ad f0 bf LDA $bff0 ; (sstack + 0)
01:13d9 : d0 03 __ BNE $13de ; (bnk_cpyfromvdc.s1003 + 0)
.s1002:
01:13db : ce f1 bf DEC $bff1 ; (sstack + 1)
.s1003:
01:13de : ce f0 bf DEC $bff0 ; (sstack + 0)
01:13e1 : d0 be __ BNE $13a1 ; (bnk_cpyfromvdc.l2 + 0)
.s1004:
01:13e3 : ad f1 bf LDA $bff1 ; (sstack + 1)
01:13e6 : d0 b9 __ BNE $13a1 ; (bnk_cpyfromvdc.l2 + 0)
.s3:
01:13e8 : a5 45 __ LDA T1 + 0 
01:13ea : 8d 00 ff STA $ff00 
.s1001:
01:13ed : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpytovdc: ; bnk_cpytovdc(u16,u8,u8*,u16)->void
.s0:
01:13ee : ad 00 ff LDA $ff00 
01:13f1 : 85 43 __ STA T0 + 0 
01:13f3 : a9 0e __ LDA #$0e
01:13f5 : 8d 00 ff STA $ff00 
01:13f8 : a5 11 __ LDA P4 ; (vdcdest + 0)
01:13fa : 85 0f __ STA P2 
01:13fc : a5 12 __ LDA P5 ; (vdcdest + 1)
01:13fe : 85 10 __ STA P3 
01:1400 : 20 a2 21 JSR $21a2 ; (vdc_mem_addr.s0 + 0)
01:1403 : a5 16 __ LDA P9 ; (size + 0)
01:1405 : 05 17 __ ORA P10 ; (size + 1)
01:1407 : d0 06 __ BNE $140f ; (bnk_cpytovdc.s1008 + 0)
.s3:
01:1409 : a5 43 __ LDA T0 + 0 
01:140b : 8d 00 ff STA $ff00 
.s1001:
01:140e : 60 __ __ RTS
.s1008:
01:140f : a6 16 __ LDX P9 ; (size + 0)
.l2:
01:1411 : a5 13 __ LDA P6 ; (scr + 0)
01:1413 : 8d 00 ff STA $ff00 
01:1416 : a0 00 __ LDY #$00
01:1418 : b1 14 __ LDA (P7),y ; (sp + 0)
01:141a : a8 __ __ TAY
01:141b : e6 14 __ INC P7 ; (sp + 0)
01:141d : d0 02 __ BNE $1421 ; (bnk_cpytovdc.s1010 + 0)
.s1009:
01:141f : e6 15 __ INC P8 ; (sp + 1)
.s1010:
01:1421 : a9 0e __ LDA #$0e
01:1423 : 8d 00 ff STA $ff00 
.l52:
01:1426 : 2c 00 d6 BIT $d600 
01:1429 : 10 fb __ BPL $1426 ; (bnk_cpytovdc.l52 + 0)
.s6:
01:142b : 8c 01 d6 STY $d601 
01:142e : 8a __ __ TXA
01:142f : d0 02 __ BNE $1433 ; (bnk_cpytovdc.s1005 + 0)
.s1004:
01:1431 : c6 17 __ DEC P10 ; (size + 1)
.s1005:
01:1433 : ca __ __ DEX
01:1434 : d0 db __ BNE $1411 ; (bnk_cpytovdc.l2 + 0)
.s1006:
01:1436 : a5 17 __ LDA P10 ; (size + 1)
01:1438 : d0 d7 __ BNE $1411 ; (bnk_cpytovdc.l2 + 0)
01:143a : 4c 09 14 JMP $1409 ; (bnk_cpytovdc.s3 + 0)
--------------------------------------------------------------------
sid_startmusic: ; sid_startmusic()->void
.s0:
01:143d : ad 00 ff LDA $ff00 
01:1440 : 85 43 __ STA T0 + 0 
01:1442 : a9 7e __ LDA #$7e
01:1444 : 8d 00 ff STA $ff00 
01:1447 : 78 __ __ SEI
01:1448 : a9 7e __ LDA #$7e
01:144a : 8d 00 ff STA $ff00 
01:144d : a9 00 __ LDA #$00
01:144f : 20 00 20 JSR $2000 ; (main.s13 + 1)
01:1452 : ad 14 03 LDA $0314 
01:1455 : 8d e0 14 STA $14e0 ; (sid_irq + 0)
01:1458 : a9 6f __ LDA #$6f
01:145a : 8d 14 03 STA $0314 
01:145d : ad 15 03 LDA $0315 
01:1460 : 8d e1 14 STA $14e1 ; (sid_irq + 1)
01:1463 : a9 14 __ LDA #$14
01:1465 : 8d 15 03 STA $0315 
01:1468 : 58 __ __ CLI
01:1469 : a5 43 __ LDA T0 + 0 
01:146b : 8d 00 ff STA $ff00 
.s1001:
01:146e : 60 __ __ RTS
--------------------------------------------------------------------
sid_interrupt: ; sid_interrupt
01:146f : ad e2 14 LDA $14e2 ; (sid_pause + 0)
01:1472 : d0 20 __ BNE $1494 ; (sid_interrupt + 37)
01:1474 : ad 00 ff LDA $ff00 
01:1477 : 8d e3 14 STA $14e3 ; (sid_oldcr + 0)
01:147a : a9 7e __ LDA #$7e
01:147c : 8d 00 ff STA $ff00 
01:147f : 20 03 20 JSR $2003 ; (main.s13 + 4)
01:1482 : ad e3 14 LDA $14e3 ; (sid_oldcr + 0)
01:1485 : 8d 00 ff STA $ff00 
01:1488 : ad e0 14 LDA $14e0 ; (sid_irq + 0)
01:148b : 8d 95 14 STA $1495 ; (sid_interrupt + 38)
01:148e : ad e1 14 LDA $14e1 ; (sid_irq + 1)
01:1491 : 8d 96 14 STA $1496 ; (sid_interrupt + 39)
01:1494 : 4c 65 fa JMP $fa65 
--------------------------------------------------------------------
sid_pausemusic: ; sid_pausemusic()->void
.s0:
01:1497 : 4c 9a 14 JMP $149a ; (sid_resetsid.s0 + 0)
--------------------------------------------------------------------
sid_resetsid: ; sid_resetsid()->void
.s0:
01:149a : a2 18 __ LDX #$18
01:149c : a9 00 __ LDA #$00
01:149e : 9d 00 d4 STA $d400,x 
01:14a1 : ca __ __ DEX
01:14a2 : 10 fa __ BPL $149e ; (sid_resetsid.s0 + 4)
01:14a4 : a9 08 __ LDA #$08
01:14a6 : 8d 04 d4 STA $d404 
01:14a9 : 8d 0b d4 STA $d40b 
01:14ac : 8d 12 d4 STA $d412 
01:14af : a2 03 __ LDX #$03
01:14b1 : 2c 11 d0 BIT $d011 
01:14b4 : 10 fb __ BPL $14b1 ; (sid_resetsid.s0 + 23)
01:14b6 : 2c 11 d0 BIT $d011 
01:14b9 : 30 fb __ BMI $14b6 ; (sid_resetsid.s0 + 28)
01:14bb : ca __ __ DEX
01:14bc : 10 f3 __ BPL $14b1 ; (sid_resetsid.s0 + 23)
01:14be : a9 00 __ LDA #$00
01:14c0 : 8d 04 d4 STA $d404 
01:14c3 : 8d 0b d4 STA $d40b 
01:14c6 : 8d 12 d4 STA $d412 
01:14c9 : a9 00 __ LDA #$00
01:14cb : 8d 18 d4 STA $d418 
.s1001:
01:14ce : 60 __ __ RTS
--------------------------------------------------------------------
sid_stopmusic: ; sid_stopmusic()->void
.s0:
01:14cf : 78 __ __ SEI
01:14d0 : ae e0 14 LDX $14e0 ; (sid_irq + 0)
01:14d3 : ac e1 14 LDY $14e1 ; (sid_irq + 1)
01:14d6 : 8e 14 03 STX $0314 
01:14d9 : 8c 15 03 STY $0315 
01:14dc : 58 __ __ CLI
01:14dd : 4c 9a 14 JMP $149a ; (sid_resetsid.s0 + 0)
--------------------------------------------------------------------
sid_irq:
01:14e0 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
sid_pause:
01:14e2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sid_oldcr:
01:14e3 : __ __ __ BYT 00                                              : .
