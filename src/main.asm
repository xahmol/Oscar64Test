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
1c13 : 8e bf 46 STX $46bf ; (spentry + 0)
1c16 : a9 91 __ LDA #$91
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 47 __ LDA #$47
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 47 __ LDA #$47
1c21 : e9 47 __ SBC #$47
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
1c35 : a9 e2 __ LDA #$e2
1c37 : e9 91 __ SBC #$91
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
1c50 : a9 43 __ LDA #$43
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
1c80 : a2 06 __ LDX #$06
1c82 : b5 53 __ LDA T1 + 0,x 
1c84 : 9d 45 bf STA $bf45,x ; (main@stack + 0)
1c87 : ca __ __ DEX
1c88 : 10 f8 __ BPL $1c82 ; (main.s1000 + 2)
1c8a : 38 __ __ SEC
1c8b : a5 23 __ LDA SP + 0 
1c8d : e9 0e __ SBC #$0e
1c8f : 85 23 __ STA SP + 0 
1c91 : b0 02 __ BCS $1c95 ; (main.s0 + 0)
1c93 : c6 24 __ DEC SP + 1 
.s0:
1c95 : a2 51 __ LDX #$51
.l1002:
1c97 : bd ff 46 LDA $46ff,x 
1c9a : 9d 5a bf STA $bf5a,x ; (filename + 14)
1c9d : ca __ __ DEX
1c9e : d0 f7 __ BNE $1c97 ; (main.l1002 + 0)
.s1003:
1ca0 : a2 0f __ LDX #$0f
.l1004:
1ca2 : bd bf 46 LDA $46bf,x ; (spentry + 0)
1ca5 : 9d 4b bf STA $bf4b,x ; (main@stack + 6)
1ca8 : ca __ __ DEX
1ca9 : d0 f7 __ BNE $1ca2 ; (main.l1004 + 0)
.s1005:
1cab : 86 52 __ STX T0 + 0 
1cad : 86 53 __ STX T1 + 0 
1caf : a9 1a __ LDA #$1a
1cb1 : 8d 00 d6 STA $d600 
.l7400:
1cb4 : 2c 00 d6 BIT $d600 
1cb7 : 10 fb __ BPL $1cb4 ; (main.l7400 + 0)
.s9:
1cb9 : ad 01 d6 LDA $d601 
1cbc : 29 f0 __ AND #$f0
1cbe : a8 __ __ TAY
1cbf : a9 1a __ LDA #$1a
1cc1 : 8d 00 d6 STA $d600 
.l7402:
1cc4 : 2c 00 d6 BIT $d600 
1cc7 : 10 fb __ BPL $1cc4 ; (main.l7402 + 0)
.s15:
1cc9 : 8c 01 d6 STY $d601 
1ccc : 8d 00 d6 STA $d600 
.l7404:
1ccf : 2c 00 d6 BIT $d600 
1cd2 : 10 fb __ BPL $1ccf ; (main.l7404 + 0)
.s22:
1cd4 : ad 01 d6 LDA $d601 
1cd7 : 29 0f __ AND #$0f
1cd9 : 09 d0 __ ORA #$d0
1cdb : a8 __ __ TAY
1cdc : a9 1a __ LDA #$1a
1cde : 8d 00 d6 STA $d600 
.l7406:
1ce1 : 2c 00 d6 BIT $d600 
1ce4 : 10 fb __ BPL $1ce1 ; (main.l7406 + 0)
.s28:
1ce6 : 8c 01 d6 STY $d601 
1ce9 : a9 8d __ LDA #$8d
1ceb : 8d d7 46 STA $46d7 ; (vdc_state + 7)
1cee : a9 1c __ LDA #$1c
1cf0 : 8d 00 d6 STA $d600 
.l7408:
1cf3 : 2c 00 d6 BIT $d600 
1cf6 : 10 fb __ BPL $1cf3 ; (main.l7408 + 0)
.s34:
1cf8 : ad 01 d6 LDA $d601 
1cfb : a8 __ __ TAY
1cfc : 09 10 __ ORA #$10
1cfe : 85 55 __ STA T3 + 0 
1d00 : a9 1c __ LDA #$1c
1d02 : 8d 00 d6 STA $d600 
.l7410:
1d05 : 2c 00 d6 BIT $d600 
1d08 : 10 fb __ BPL $1d05 ; (main.l7410 + 0)
.s41:
1d0a : a5 55 __ LDA T3 + 0 
1d0c : 8d 01 d6 STA $d601 
1d0f : a9 12 __ LDA #$12
1d11 : 8d 00 d6 STA $d600 
.l7412:
1d14 : 2c 00 d6 BIT $d600 
1d17 : 10 fb __ BPL $1d14 ; (main.l7412 + 0)
.s48:
1d19 : a9 1f __ LDA #$1f
1d1b : 8d 01 d6 STA $d601 
1d1e : a9 13 __ LDA #$13
1d20 : 8d 00 d6 STA $d600 
.l7414:
1d23 : 2c 00 d6 BIT $d600 
1d26 : 10 fb __ BPL $1d23 ; (main.l7414 + 0)
.s53:
1d28 : a9 ff __ LDA #$ff
1d2a : 8d 01 d6 STA $d601 
1d2d : a9 1f __ LDA #$1f
1d2f : 8d 00 d6 STA $d600 
.l7416:
1d32 : 2c 00 d6 BIT $d600 
1d35 : 10 fb __ BPL $1d32 ; (main.l7416 + 0)
.s57:
1d37 : 8e 01 d6 STX $d601 
1d3a : a9 12 __ LDA #$12
1d3c : 8d 00 d6 STA $d600 
.l7418:
1d3f : 2c 00 d6 BIT $d600 
1d42 : 10 fb __ BPL $1d3f ; (main.l7418 + 0)
.s64:
1d44 : a9 9f __ LDA #$9f
1d46 : 8d 01 d6 STA $d601 
1d49 : a9 13 __ LDA #$13
1d4b : 8d 00 d6 STA $d600 
.l7420:
1d4e : 2c 00 d6 BIT $d600 
1d51 : 10 fb __ BPL $1d4e ; (main.l7420 + 0)
.s69:
1d53 : a9 ff __ LDA #$ff
1d55 : 8d 01 d6 STA $d601 
1d58 : a9 1f __ LDA #$1f
1d5a : 8d 00 d6 STA $d600 
.l7422:
1d5d : 2c 00 d6 BIT $d600 
1d60 : 10 fb __ BPL $1d5d ; (main.l7422 + 0)
.s73:
1d62 : a9 ff __ LDA #$ff
1d64 : 8d 01 d6 STA $d601 
1d67 : a9 12 __ LDA #$12
1d69 : 8d 00 d6 STA $d600 
.l7424:
1d6c : 2c 00 d6 BIT $d600 
1d6f : 10 fb __ BPL $1d6c ; (main.l7424 + 0)
.s80:
1d71 : a9 1f __ LDA #$1f
1d73 : 8d 01 d6 STA $d601 
1d76 : a9 13 __ LDA #$13
1d78 : 8d 00 d6 STA $d600 
.l7426:
1d7b : 2c 00 d6 BIT $d600 
1d7e : 10 fb __ BPL $1d7b ; (main.l7426 + 0)
.s85:
1d80 : a9 ff __ LDA #$ff
1d82 : 8d 01 d6 STA $d601 
1d85 : a9 1f __ LDA #$1f
1d87 : 8d 00 d6 STA $d600 
.l7428:
1d8a : 2c 00 d6 BIT $d600 
1d8d : 10 fb __ BPL $1d8a ; (main.l7428 + 0)
.s89:
1d8f : ad 01 d6 LDA $d601 
1d92 : f0 04 __ BEQ $1d98 ; (main.s1487 + 0)
.s1488:
1d94 : a9 10 __ LDA #$10
1d96 : d0 02 __ BNE $1d9a ; (main.s1489 + 0)
.s1487:
1d98 : a9 40 __ LDA #$40
.s1489:
1d9a : 8d d0 46 STA $46d0 ; (vdc_state + 0)
1d9d : a9 1c __ LDA #$1c
1d9f : 8d 00 d6 STA $d600 
.l7431:
1da2 : 2c 00 d6 BIT $d600 
1da5 : 10 fb __ BPL $1da2 ; (main.l7431 + 0)
.s96:
1da7 : 86 54 __ STX T2 + 0 
1da9 : 8c 01 d6 STY $d601 
1dac : ad d3 46 LDA $46d3 ; (vdc_state + 3)
1daf : 85 55 __ STA T3 + 0 
1db1 : ad d5 46 LDA $46d5 ; (vdc_state + 5)
1db4 : 85 58 __ STA T5 + 0 
.l99:
1db6 : a5 54 __ LDA T2 + 0 
1db8 : c5 58 __ CMP T5 + 0 
1dba : b0 03 __ BCS $1dbf ; (main.s29 + 0)
1dbc : 4c 5a 32 JMP $325a ; (main.s100 + 0)
.s29:
1dbf : 24 d7 __ BIT $d7 
1dc1 : 30 17 __ BMI $1dda ; (main.s7458 + 0)
.s177:
1dc3 : a9 97 __ LDA #$97
1dc5 : a0 02 __ LDY #$02
1dc7 : 91 23 __ STA (SP + 0),y 
1dc9 : a9 39 __ LDA #$39
1dcb : c8 __ __ INY
1dcc : 91 23 __ STA (SP + 0),y 
1dce : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
1dd1 : 20 c2 39 JSR $39c2 ; (getch.s0 + 0)
1dd4 : 20 01 3a JSR $3a01 ; (clrscr.s0 + 0)
1dd7 : 20 05 3a JSR $3a05 ; (screen_setmode.s0 + 0)
.s7458:
1dda : a5 ba __ LDA $ba 
1ddc : d0 02 __ BNE $1de0 ; (main.s185 + 0)
.s183:
1dde : a9 08 __ LDA #$08
.s185:
1de0 : 85 54 __ STA T2 + 0 
1de2 : 85 f7 __ STA $f7 ; (bootdevice + 0)
1de4 : a9 0d __ LDA #$0d
1de6 : a0 02 __ LDY #$02
1de8 : 91 23 __ STA (SP + 0),y 
1dea : a9 3a __ LDA #$3a
1dec : c8 __ __ INY
1ded : 91 23 __ STA (SP + 0),y 
1def : a5 54 __ LDA T2 + 0 
1df1 : c8 __ __ INY
1df2 : 91 23 __ STA (SP + 0),y 
1df4 : a9 00 __ LDA #$00
1df6 : c8 __ __ INY
1df7 : 91 23 __ STA (SP + 0),y 
1df9 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
1dfc : a9 06 __ LDA #$06
1dfe : 8d 06 d5 STA $d506 
1e01 : a9 1d __ LDA #$1d
1e03 : a0 02 __ LDY #$02
1e05 : 91 23 __ STA (SP + 0),y 
1e07 : a9 3a __ LDA #$3a
1e09 : c8 __ __ INY
1e0a : 91 23 __ STA (SP + 0),y 
1e0c : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
1e0f : a9 00 __ LDA #$00
1e11 : 85 0d __ STA P0 
1e13 : 85 0e __ STA P1 
1e15 : 20 3c 3a JSR $3a3c ; (krnio_setbnk.s0 + 0)
1e18 : a9 37 __ LDA #$37
1e1a : 85 0d __ STA P0 
1e1c : a9 3a __ LDA #$3a
1e1e : 85 0e __ STA P1 
1e20 : 20 4c 3a JSR $3a4c ; (krnio_setnam.s0 + 0)
1e23 : a9 01 __ LDA #$01
1e25 : 85 0d __ STA P0 
1e27 : 85 0f __ STA P2 
1e29 : a5 54 __ LDA T2 + 0 
1e2b : 85 0e __ STA P1 
1e2d : 20 62 3a JSR $3a62 ; (krnio_load.s0 + 0)
1e30 : 09 00 __ ORA #$00
1e32 : d0 19 __ BNE $1e4d ; (main.s192 + 0)
.s188:
1e34 : a9 7f __ LDA #$7f
1e36 : a0 02 __ LDY #$02
1e38 : 91 23 __ STA (SP + 0),y 
1e3a : a9 3a __ LDA #$3a
1e3c : c8 __ __ INY
1e3d : 91 23 __ STA (SP + 0),y 
1e3f : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
1e42 : a9 01 __ LDA #$01
1e44 : 85 0d __ STA P0 
1e46 : a9 00 __ LDA #$00
1e48 : 85 0e __ STA P1 
1e4a : 20 9d 3a JSR $3a9d ; (exit.s0 + 0)
.s192:
1e4d : a9 01 __ LDA #$01
1e4f : 8d 30 d0 STA $d030 
1e52 : a9 00 __ LDA #$00
1e54 : 85 16 __ STA P9 
1e56 : ad 11 d0 LDA $d011 
1e59 : 29 6f __ AND #$6f
1e5b : 8d 11 d0 STA $d011 
1e5e : 20 b2 3a JSR $3ab2 ; (vdc_set_mode.s1000 + 0)
1e61 : a9 5a __ LDA #$5a
1e63 : a0 02 __ LDY #$02
1e65 : 91 23 __ STA (SP + 0),y 
1e67 : a9 3f __ LDA #$3f
1e69 : c8 __ __ INY
1e6a : 91 23 __ STA (SP + 0),y 
1e6c : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
1e6f : a9 6d __ LDA #$6d
1e71 : a0 02 __ LDY #$02
1e73 : 91 23 __ STA (SP + 0),y 
1e75 : a9 3f __ LDA #$3f
1e77 : c8 __ __ INY
1e78 : 91 23 __ STA (SP + 0),y 
1e7a : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
1e7d : a9 50 __ LDA #$50
1e7f : 85 11 __ STA P4 
1e81 : a9 78 __ LDA #$78
1e83 : 85 12 __ STA P5 
1e85 : a9 3f __ LDA #$3f
1e87 : 85 13 __ STA P6 
1e89 : 20 00 13 JSR $1300 ; (bnk_load@proxy + 0)
1e8c : a5 1b __ LDA ACCU + 0 
1e8e : d0 0e __ BNE $1e9e ; (main.s377 + 0)
.s375:
1e90 : a9 7f __ LDA #$7f
1e92 : a0 02 __ LDY #$02
1e94 : 91 23 __ STA (SP + 0),y 
1e96 : a9 3f __ LDA #$3f
1e98 : c8 __ __ INY
1e99 : 91 23 __ STA (SP + 0),y 
1e9b : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
.s377:
1e9e : a9 8d __ LDA #$8d
1ea0 : a0 02 __ LDY #$02
1ea2 : 91 23 __ STA (SP + 0),y 
1ea4 : a9 3f __ LDA #$3f
1ea6 : c8 __ __ INY
1ea7 : 91 23 __ STA (SP + 0),y 
1ea9 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
1eac : a9 30 __ LDA #$30
1eae : 85 11 __ STA P4 
1eb0 : a9 a1 __ LDA #$a1
1eb2 : 85 12 __ STA P5 
1eb4 : a9 3f __ LDA #$3f
1eb6 : 85 13 __ STA P6 
1eb8 : 20 00 13 JSR $1300 ; (bnk_load@proxy + 0)
1ebb : a5 1b __ LDA ACCU + 0 
1ebd : d0 0e __ BNE $1ecd ; (main.s380 + 0)
.s378:
1ebf : a9 7f __ LDA #$7f
1ec1 : a0 02 __ LDY #$02
1ec3 : 91 23 __ STA (SP + 0),y 
1ec5 : a9 3f __ LDA #$3f
1ec7 : c8 __ __ INY
1ec8 : 91 23 __ STA (SP + 0),y 
1eca : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
.s380:
1ecd : a9 a9 __ LDA #$a9
1ecf : a0 02 __ LDY #$02
1ed1 : 91 23 __ STA (SP + 0),y 
1ed3 : a9 3f __ LDA #$3f
1ed5 : c8 __ __ INY
1ed6 : 91 23 __ STA (SP + 0),y 
1ed8 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
1edb : a9 40 __ LDA #$40
1edd : 85 11 __ STA P4 
1edf : a9 be __ LDA #$be
1ee1 : 85 12 __ STA P5 
1ee3 : a9 3f __ LDA #$3f
1ee5 : 85 13 __ STA P6 
1ee7 : 20 00 13 JSR $1300 ; (bnk_load@proxy + 0)
1eea : a5 1b __ LDA ACCU + 0 
1eec : d0 0e __ BNE $1efc ; (main.s383 + 0)
.s381:
1eee : a9 7f __ LDA #$7f
1ef0 : a0 02 __ LDY #$02
1ef2 : 91 23 __ STA (SP + 0),y 
1ef4 : a9 3f __ LDA #$3f
1ef6 : c8 __ __ INY
1ef7 : 91 23 __ STA (SP + 0),y 
1ef9 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
.s383:
1efc : a9 30 __ LDA #$30
1efe : 85 10 __ STA P3 
1f00 : ad e0 46 LDA $46e0 ; (vdc_state + 16)
1f03 : 85 0d __ STA P0 
1f05 : ad e1 46 LDA $46e1 ; (vdc_state + 17)
1f08 : 85 0e __ STA P1 
1f0a : 20 39 13 JSR $1339 ; (bnk_redef_charset@proxy + 0)
1f0d : a9 40 __ LDA #$40
1f0f : 85 10 __ STA P3 
1f11 : ad e2 46 LDA $46e2 ; (vdc_state + 18)
1f14 : 85 0d __ STA P0 
1f16 : ad e3 46 LDA $46e3 ; (vdc_state + 19)
1f19 : 85 0e __ STA P1 
1f1b : 20 39 13 JSR $1339 ; (bnk_redef_charset@proxy + 0)
1f1e : 20 c2 39 JSR $39c2 ; (getch.s0 + 0)
1f21 : a9 c6 __ LDA #$c6
1f23 : a0 02 __ LDY #$02
1f25 : 91 23 __ STA (SP + 0),y 
1f27 : a9 3f __ LDA #$3f
1f29 : c8 __ __ INY
1f2a : 91 23 __ STA (SP + 0),y 
1f2c : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
1f2f : a9 00 __ LDA #$00
1f31 : 85 0d __ STA P0 
1f33 : 85 0e __ STA P1 
1f35 : 20 3c 3a JSR $3a3c ; (krnio_setbnk.s0 + 0)
1f38 : 20 44 3a JSR $3a44 ; (krnio_setnam@proxy + 0)
1f3b : a9 01 __ LDA #$01
1f3d : 85 0d __ STA P0 
1f3f : 85 0f __ STA P2 
1f41 : a5 54 __ LDA T2 + 0 
1f43 : 85 0e __ STA P1 
1f45 : a9 d3 __ LDA #$d3
1f47 : a0 02 __ LDY #$02
1f49 : 91 23 __ STA (SP + 0),y 
1f4b : a9 3f __ LDA #$3f
1f4d : c8 __ __ INY
1f4e : 91 23 __ STA (SP + 0),y 
1f50 : 20 ea 3f JSR $3fea ; (krnio_open.s0 + 0)
1f53 : a0 04 __ LDY #$04
1f55 : 91 23 __ STA (SP + 0),y 
1f57 : a9 00 __ LDA #$00
1f59 : c8 __ __ INY
1f5a : 91 23 __ STA (SP + 0),y 
1f5c : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
1f5f : a9 12 __ LDA #$12
1f61 : a0 02 __ LDY #$02
1f63 : 91 23 __ STA (SP + 0),y 
1f65 : a9 40 __ LDA #$40
1f67 : c8 __ __ INY
1f68 : 91 23 __ STA (SP + 0),y 
1f6a : ad e7 46 LDA $46e7 ; (krnio_pstatus + 1)
1f6d : c8 __ __ INY
1f6e : 91 23 __ STA (SP + 0),y 
1f70 : a9 00 __ LDA #$00
1f72 : c8 __ __ INY
1f73 : 91 23 __ STA (SP + 0),y 
1f75 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
1f78 : a9 29 __ LDA #$29
1f7a : a0 02 __ LDY #$02
1f7c : 91 23 __ STA (SP + 0),y 
1f7e : a9 40 __ LDA #$40
1f80 : c8 __ __ INY
1f81 : 91 23 __ STA (SP + 0),y 
1f83 : a9 01 __ LDA #$01
1f85 : 20 41 40 JSR $4041 ; (krnio_chkout.s1000 + 0)
1f88 : 09 00 __ ORA #$00
1f8a : d0 08 __ BNE $1f94 ; (main.s385 + 0)
.s386:
1f8c : a9 ff __ LDA #$ff
1f8e : a0 04 __ LDY #$04
1f90 : 91 23 __ STA (SP + 0),y 
1f92 : d0 1c __ BNE $1fb0 ; (main.s384 + 0)
.s385:
1f94 : a2 00 __ LDX #$00
.l1466:
1f96 : 86 55 __ STX T3 + 0 
1f98 : bd 5b bf LDA $bf5b,x ; (testdata + 0)
1f9b : 20 53 40 JSR $4053 ; (krnio_chrout.s1000 + 0)
1f9e : a6 55 __ LDX T3 + 0 
1fa0 : e8 __ __ INX
1fa1 : e0 51 __ CPX #$51
1fa3 : 90 f1 __ BCC $1f96 ; (main.l1466 + 0)
.s391:
1fa5 : 20 61 40 JSR $4061 ; (krnio_clrchn.s0 + 0)
1fa8 : a9 51 __ LDA #$51
1faa : a0 04 __ LDY #$04
1fac : 91 23 __ STA (SP + 0),y 
1fae : a9 00 __ LDA #$00
.s384:
1fb0 : a0 05 __ LDY #$05
1fb2 : 91 23 __ STA (SP + 0),y 
1fb4 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
1fb7 : a9 65 __ LDA #$65
1fb9 : a0 02 __ LDY #$02
1fbb : 91 23 __ STA (SP + 0),y 
1fbd : a9 40 __ LDA #$40
1fbf : c8 __ __ INY
1fc0 : 91 23 __ STA (SP + 0),y 
1fc2 : ad e7 46 LDA $46e7 ; (krnio_pstatus + 1)
1fc5 : c8 __ __ INY
1fc6 : 91 23 __ STA (SP + 0),y 
1fc8 : a9 00 __ LDA #$00
1fca : c8 __ __ INY
1fcb : 91 23 __ STA (SP + 0),y 
1fcd : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
1fd0 : a9 01 __ LDA #$01
1fd2 : 20 7d 40 JSR $407d ; (krnio_close.s1000 + 0)
1fd5 : a9 00 __ LDA #$00
1fd7 : 85 0f __ STA P2 
1fd9 : 85 10 __ STA P3 
1fdb : 85 12 __ STA P5 
1fdd : 20 85 40 JSR $4085 ; (memset@proxy + 0)
1fe0 : a9 ad __ LDA #$ad
1fe2 : a0 02 __ LDY #$02
1fe4 : 91 23 __ STA (SP + 0),y 
1fe6 : a9 40 __ LDA #$40
1fe8 : c8 __ __ INY
1fe9 : 91 23 __ STA (SP + 0),y 
1feb : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
1fee : a9 00 __ LDA #$00
1ff0 : 85 0d __ STA P0 
1ff2 : 85 0e __ STA P1 
1ff4 : 20 3c 3a JSR $3a3c ; (krnio_setbnk.s0 + 0)
1ff7 : 20 44 3a JSR $3a44 ; (krnio_setnam@proxy + 0)
1ffa : a9 01 __ LDA #$01
1ffc : 85 0d __ STA P0 
1ffe : a5 54 __ LDA T2 + 0 
2000 : 85 0e __ STA P1 
2002 : a9 00 __ LDA #$00
2004 : 85 0f __ STA P2 
2006 : a9 d3 __ LDA #$d3
2008 : a0 02 __ LDY #$02
200a : 91 23 __ STA (SP + 0),y 
200c : a9 3f __ LDA #$3f
200e : c8 __ __ INY
200f : 91 23 __ STA (SP + 0),y 
2011 : 20 ea 3f JSR $3fea ; (krnio_open.s0 + 0)
2014 : a0 04 __ LDY #$04
2016 : 91 23 __ STA (SP + 0),y 
2018 : a9 00 __ LDA #$00
201a : c8 __ __ INY
201b : 91 23 __ STA (SP + 0),y 
201d : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
2020 : a9 12 __ LDA #$12
2022 : a0 02 __ LDY #$02
2024 : 91 23 __ STA (SP + 0),y 
2026 : a9 40 __ LDA #$40
2028 : c8 __ __ INY
2029 : 91 23 __ STA (SP + 0),y 
202b : ad e7 46 LDA $46e7 ; (krnio_pstatus + 1)
202e : c8 __ __ INY
202f : 91 23 __ STA (SP + 0),y 
2031 : a9 00 __ LDA #$00
2033 : c8 __ __ INY
2034 : 91 23 __ STA (SP + 0),y 
2036 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
2039 : a9 b9 __ LDA #$b9
203b : a0 02 __ LDY #$02
203d : 91 23 __ STA (SP + 0),y 
203f : a9 40 __ LDA #$40
2041 : c8 __ __ INY
2042 : 91 23 __ STA (SP + 0),y 
2044 : ad e7 46 LDA $46e7 ; (krnio_pstatus + 1)
2047 : c9 40 __ CMP #$40
2049 : d0 04 __ BNE $204f ; (main.s397 + 0)
.s395:
204b : a9 00 __ LDA #$00
204d : f0 0e __ BEQ $205d ; (main.s1474 + 0)
.s397:
204f : a9 01 __ LDA #$01
2051 : 20 d0 40 JSR $40d0 ; (krnio_chkin.s1000 + 0)
2054 : 09 00 __ ORA #$00
2056 : f0 03 __ BEQ $205b ; (main.s400 + 0)
2058 : 4c 1f 32 JMP $321f ; (main.s399 + 0)
.s400:
205b : a9 ff __ LDA #$ff
.s1474:
205d : 85 55 __ STA T3 + 0 
205f : 85 56 __ STA T3 + 1 
.s394:
2061 : a5 55 __ LDA T3 + 0 
2063 : a0 04 __ LDY #$04
2065 : 91 23 __ STA (SP + 0),y 
2067 : a5 56 __ LDA T3 + 1 
2069 : c8 __ __ INY
206a : 91 23 __ STA (SP + 0),y 
206c : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
206f : a9 00 __ LDA #$00
2071 : a0 02 __ LDY #$02
2073 : 91 23 __ STA (SP + 0),y 
2075 : a9 41 __ LDA #$41
2077 : c8 __ __ INY
2078 : 91 23 __ STA (SP + 0),y 
207a : ad e7 46 LDA $46e7 ; (krnio_pstatus + 1)
207d : c8 __ __ INY
207e : 91 23 __ STA (SP + 0),y 
2080 : a9 00 __ LDA #$00
2082 : c8 __ __ INY
2083 : 91 23 __ STA (SP + 0),y 
2085 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
2088 : a9 01 __ LDA #$01
208a : 20 7d 40 JSR $407d ; (krnio_close.s1000 + 0)
208d : a9 17 __ LDA #$17
208f : a0 02 __ LDY #$02
2091 : 91 23 __ STA (SP + 0),y 
2093 : a9 41 __ LDA #$41
2095 : c8 __ __ INY
2096 : 91 23 __ STA (SP + 0),y 
2098 : a9 5b __ LDA #$5b
209a : c8 __ __ INY
209b : 91 23 __ STA (SP + 0),y 
209d : a9 bf __ LDA #$bf
209f : c8 __ __ INY
20a0 : 91 23 __ STA (SP + 0),y 
20a2 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
20a5 : 20 c2 39 JSR $39c2 ; (getch.s0 + 0)
20a8 : a9 5b __ LDA #$5b
20aa : 85 0d __ STA P0 
20ac : a9 bf __ LDA #$bf
20ae : 85 0e __ STA P1 
20b0 : a9 00 __ LDA #$00
20b2 : 85 0f __ STA P2 
20b4 : 85 10 __ STA P3 
20b6 : 85 12 __ STA P5 
20b8 : a9 51 __ LDA #$51
20ba : 85 11 __ STA P4 
20bc : 20 91 40 JSR $4091 ; (memset.s0 + 0)
20bf : a2 ff __ LDX #$ff
.l1006:
20c1 : e8 __ __ INX
20c2 : bd 26 41 LDA $4126,x 
20c5 : 9d 5b bf STA $bf5b,x ; (testdata + 0)
20c8 : d0 f7 __ BNE $20c1 ; (main.l1006 + 0)
.s1007:
20ca : a2 ff __ LDX #$ff
.l1008:
20cc : e8 __ __ INX
20cd : bd fa 40 LDA $40fa,x 
20d0 : 9d 4c bf STA $bf4c,x ; (filename + 0)
20d3 : d0 f7 __ BNE $20cc ; (main.l1008 + 0)
.s1009:
20d5 : a9 c6 __ LDA #$c6
20d7 : a0 02 __ LDY #$02
20d9 : 91 23 __ STA (SP + 0),y 
20db : a9 3f __ LDA #$3f
20dd : c8 __ __ INY
20de : 91 23 __ STA (SP + 0),y 
20e0 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
20e3 : a9 00 __ LDA #$00
20e5 : 85 55 __ STA T3 + 0 
20e7 : 85 0d __ STA P0 
20e9 : 85 0e __ STA P1 
20eb : 20 3c 3a JSR $3a3c ; (krnio_setbnk.s0 + 0)
20ee : 20 44 3a JSR $3a44 ; (krnio_setnam@proxy + 0)
20f1 : a9 5b __ LDA #$5b
20f3 : 85 0e __ STA P1 
20f5 : a9 bf __ LDA #$bf
20f7 : 85 0f __ STA P2 
20f9 : a9 40 __ LDA #$40
20fb : a0 02 __ LDY #$02
20fd : 91 23 __ STA (SP + 0),y 
20ff : a9 41 __ LDA #$41
2101 : c8 __ __ INY
2102 : 91 23 __ STA (SP + 0),y 
2104 : a5 f7 __ LDA $f7 ; (bootdevice + 0)
2106 : 85 54 __ STA T2 + 0 
2108 : 85 0d __ STA P0 
210a : ad 5b bf LDA $bf5b ; (testdata + 0)
210d : f0 0c __ BEQ $211b ; (main.s419 + 0)
.s418:
210f : a2 00 __ LDX #$00
.l1468:
2111 : bd 5c bf LDA $bf5c,x ; (testdata + 1)
2114 : e8 __ __ INX
2115 : 09 00 __ ORA #$00
2117 : d0 f8 __ BNE $2111 ; (main.l1468 + 0)
.s1469:
2119 : 86 55 __ STX T3 + 0 
.s419:
211b : 18 __ __ CLC
211c : a9 5b __ LDA #$5b
211e : 65 55 __ ADC T3 + 0 
2120 : 85 10 __ STA P3 
2122 : a9 bf __ LDA #$bf
2124 : 69 00 __ ADC #$00
2126 : 85 11 __ STA P4 
2128 : 20 57 41 JSR $4157 ; (krnio_save.s0 + 0)
212b : a0 04 __ LDY #$04
212d : 91 23 __ STA (SP + 0),y 
212f : a9 00 __ LDA #$00
2131 : c8 __ __ INY
2132 : 91 23 __ STA (SP + 0),y 
2134 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
2137 : a9 65 __ LDA #$65
2139 : a0 02 __ LDY #$02
213b : 91 23 __ STA (SP + 0),y 
213d : a9 40 __ LDA #$40
213f : c8 __ __ INY
2140 : 91 23 __ STA (SP + 0),y 
2142 : ad e7 46 LDA $46e7 ; (krnio_pstatus + 1)
2145 : c8 __ __ INY
2146 : 91 23 __ STA (SP + 0),y 
2148 : a9 00 __ LDA #$00
214a : c8 __ __ INY
214b : 91 23 __ STA (SP + 0),y 
214d : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
2150 : a9 00 __ LDA #$00
2152 : 85 0f __ STA P2 
2154 : 85 10 __ STA P3 
2156 : 85 12 __ STA P5 
2158 : 20 85 40 JSR $4085 ; (memset@proxy + 0)
215b : a9 74 __ LDA #$74
215d : a0 02 __ LDY #$02
215f : 91 23 __ STA (SP + 0),y 
2161 : a9 41 __ LDA #$41
2163 : c8 __ __ INY
2164 : 91 23 __ STA (SP + 0),y 
2166 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
2169 : a9 00 __ LDA #$00
216b : 85 0d __ STA P0 
216d : 85 0e __ STA P1 
216f : 20 3c 3a JSR $3a3c ; (krnio_setbnk.s0 + 0)
2172 : 20 44 3a JSR $3a44 ; (krnio_setnam@proxy + 0)
2175 : a9 01 __ LDA #$01
2177 : 85 0d __ STA P0 
2179 : 85 0f __ STA P2 
217b : a5 54 __ LDA T2 + 0 
217d : 85 0e __ STA P1 
217f : a9 80 __ LDA #$80
2181 : a0 02 __ LDY #$02
2183 : 91 23 __ STA (SP + 0),y 
2185 : a9 41 __ LDA #$41
2187 : c8 __ __ INY
2188 : 91 23 __ STA (SP + 0),y 
218a : 20 62 3a JSR $3a62 ; (krnio_load.s0 + 0)
218d : a0 04 __ LDY #$04
218f : 91 23 __ STA (SP + 0),y 
2191 : a9 00 __ LDA #$00
2193 : c8 __ __ INY
2194 : 91 23 __ STA (SP + 0),y 
2196 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
2199 : a9 65 __ LDA #$65
219b : a0 02 __ LDY #$02
219d : 91 23 __ STA (SP + 0),y 
219f : a9 40 __ LDA #$40
21a1 : c8 __ __ INY
21a2 : 91 23 __ STA (SP + 0),y 
21a4 : ad e7 46 LDA $46e7 ; (krnio_pstatus + 1)
21a7 : c8 __ __ INY
21a8 : 91 23 __ STA (SP + 0),y 
21aa : a9 00 __ LDA #$00
21ac : c8 __ __ INY
21ad : 91 23 __ STA (SP + 0),y 
21af : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
21b2 : a9 5b __ LDA #$5b
21b4 : a0 04 __ LDY #$04
21b6 : 91 23 __ STA (SP + 0),y 
21b8 : a9 bf __ LDA #$bf
21ba : c8 __ __ INY
21bb : 91 23 __ STA (SP + 0),y 
21bd : a9 17 __ LDA #$17
21bf : a0 02 __ LDY #$02
21c1 : 91 23 __ STA (SP + 0),y 
21c3 : a9 41 __ LDA #$41
21c5 : c8 __ __ INY
21c6 : 91 23 __ STA (SP + 0),y 
21c8 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
21cb : 20 c2 39 JSR $39c2 ; (getch.s0 + 0)
21ce : a2 ff __ LDX #$ff
.l1010:
21d0 : e8 __ __ INX
21d1 : bd 97 41 LDA $4197,x 
21d4 : 9d 5b bf STA $bf5b,x ; (testdata + 0)
21d7 : d0 f7 __ BNE $21d0 ; (main.l1010 + 0)
.s1011:
21d9 : a9 60 __ LDA #$60
21db : 20 a9 13 JSR $13a9 ; (bnk_writeb.s1000 + 0)
21de : a9 60 __ LDA #$60
21e0 : 85 0d __ STA P0 
21e2 : 85 0e __ STA P1 
21e4 : 20 b9 13 JSR $13b9 ; (bnk_writew.s0 + 0)
21e7 : a9 60 __ LDA #$60
21e9 : a0 04 __ LDY #$04
21eb : 91 23 __ STA (SP + 0),y 
21ed : a9 00 __ LDA #$00
21ef : c8 __ __ INY
21f0 : 91 23 __ STA (SP + 0),y 
21f2 : a9 a5 __ LDA #$a5
21f4 : a0 02 __ LDY #$02
21f6 : 91 23 __ STA (SP + 0),y 
21f8 : a9 41 __ LDA #$41
21fa : c8 __ __ INY
21fb : 91 23 __ STA (SP + 0),y 
21fd : 20 cf 13 JSR $13cf ; (bnk_readb.s0 + 0)
2200 : a0 06 __ LDY #$06
2202 : 91 23 __ STA (SP + 0),y 
2204 : a9 00 __ LDA #$00
2206 : c8 __ __ INY
2207 : 91 23 __ STA (SP + 0),y 
2209 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
220c : a9 60 __ LDA #$60
220e : a0 04 __ LDY #$04
2210 : 91 23 __ STA (SP + 0),y 
2212 : c8 __ __ INY
2213 : 91 23 __ STA (SP + 0),y 
2215 : a9 c7 __ LDA #$c7
2217 : a0 02 __ LDY #$02
2219 : 91 23 __ STA (SP + 0),y 
221b : a9 41 __ LDA #$41
221d : c8 __ __ INY
221e : 91 23 __ STA (SP + 0),y 
2220 : 20 de 13 JSR $13de ; (bnk_readw.s0 + 0)
2223 : a5 1b __ LDA ACCU + 0 
2225 : a0 06 __ LDY #$06
2227 : 91 23 __ STA (SP + 0),y 
2229 : a5 1c __ LDA ACCU + 1 
222b : c8 __ __ INY
222c : 91 23 __ STA (SP + 0),y 
222e : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
2231 : a9 7f __ LDA #$7f
2233 : 85 0d __ STA P0 
2235 : a9 0e __ LDA #$0e
2237 : 85 10 __ STA P3 
2239 : a9 5b __ LDA #$5b
223b : 85 11 __ STA P4 
223d : a9 bf __ LDA #$bf
223f : 85 12 __ STA P5 
2241 : a9 00 __ LDA #$00
2243 : 85 13 __ STA P6 
2245 : 85 0e __ STA P1 
2247 : 85 56 __ STA T3 + 1 
2249 : a9 d0 __ LDA #$d0
224b : 85 0f __ STA P2 
224d : ad 5b bf LDA $bf5b ; (testdata + 0)
2250 : f0 13 __ BEQ $2265 ; (main.s424 + 0)
.s1477:
2252 : a0 00 __ LDY #$00
.l423:
2254 : 98 __ __ TYA
2255 : aa __ __ TAX
2256 : 18 __ __ CLC
2257 : 69 01 __ ADC #$01
2259 : a8 __ __ TAY
225a : 90 02 __ BCC $225e ; (main.s1491 + 0)
.s1490:
225c : e6 56 __ INC T3 + 1 
.s1491:
225e : bd 5c bf LDA $bf5c,x ; (testdata + 1)
2261 : d0 f1 __ BNE $2254 ; (main.l423 + 0)
.s1478:
2263 : 84 13 __ STY P6 
.s424:
2265 : 20 f4 13 JSR $13f4 ; (bnk_memcpy@proxy + 0)
2268 : a9 0e __ LDA #$0e
226a : 85 0d __ STA P0 
226c : a9 7f __ LDA #$7f
226e : 85 10 __ STA P3 
2270 : a9 91 __ LDA #$91
2272 : 85 0e __ STA P1 
2274 : a9 47 __ LDA #$47
2276 : 85 0f __ STA P2 
2278 : a9 00 __ LDA #$00
227a : 85 13 __ STA P6 
227c : 85 11 __ STA P4 
227e : 85 56 __ STA T3 + 1 
2280 : a9 d0 __ LDA #$d0
2282 : 85 12 __ STA P5 
2284 : ad 5b bf LDA $bf5b ; (testdata + 0)
2287 : f0 13 __ BEQ $229c ; (main.s429 + 0)
.s1479:
2289 : a0 00 __ LDY #$00
.l428:
228b : 98 __ __ TYA
228c : aa __ __ TAX
228d : 18 __ __ CLC
228e : 69 01 __ ADC #$01
2290 : a8 __ __ TAY
2291 : 90 02 __ BCC $2295 ; (main.s1493 + 0)
.s1492:
2293 : e6 56 __ INC T3 + 1 
.s1493:
2295 : bd 5c bf LDA $bf5c,x ; (testdata + 1)
2298 : d0 f1 __ BNE $228b ; (main.l428 + 0)
.s1480:
229a : 84 13 __ STY P6 
.s429:
229c : 20 f4 13 JSR $13f4 ; (bnk_memcpy@proxy + 0)
229f : a9 00 __ LDA #$00
22a1 : a0 02 __ LDY #$02
22a3 : 91 23 __ STA (SP + 0),y 
22a5 : a9 42 __ LDA #$42
22a7 : c8 __ __ INY
22a8 : 91 23 __ STA (SP + 0),y 
22aa : a9 5b __ LDA #$5b
22ac : c8 __ __ INY
22ad : 91 23 __ STA (SP + 0),y 
22af : a9 bf __ LDA #$bf
22b1 : c8 __ __ INY
22b2 : 91 23 __ STA (SP + 0),y 
22b4 : a9 91 __ LDA #$91
22b6 : c8 __ __ INY
22b7 : 91 23 __ STA (SP + 0),y 
22b9 : a9 47 __ LDA #$47
22bb : c8 __ __ INY
22bc : 91 23 __ STA (SP + 0),y 
22be : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
22c1 : ad d8 46 LDA $46d8 ; (vdc_state + 8)
22c4 : 85 55 __ STA T3 + 0 
22c6 : 85 0d __ STA P0 
22c8 : ad d9 46 LDA $46d9 ; (vdc_state + 9)
22cb : 85 56 __ STA T3 + 1 
22cd : 85 0e __ STA P1 
22cf : a9 00 __ LDA #$00
22d1 : 85 11 __ STA P4 
22d3 : 85 0f __ STA P2 
22d5 : 85 59 __ STA T5 + 1 
22d7 : a9 d0 __ LDA #$d0
22d9 : 85 10 __ STA P3 
22db : ad 5b bf LDA $bf5b ; (testdata + 0)
22de : f0 13 __ BEQ $22f3 ; (main.s434 + 0)
.s1481:
22e0 : a0 00 __ LDY #$00
.l433:
22e2 : 98 __ __ TYA
22e3 : aa __ __ TAX
22e4 : 18 __ __ CLC
22e5 : 69 01 __ ADC #$01
22e7 : a8 __ __ TAY
22e8 : 90 02 __ BCC $22ec ; (main.s1495 + 0)
.s1494:
22ea : e6 59 __ INC T5 + 1 
.s1495:
22ec : bd 5c bf LDA $bf5c,x ; (testdata + 1)
22ef : d0 f1 __ BNE $22e2 ; (main.l433 + 0)
.s1482:
22f1 : 84 11 __ STY P4 
.s434:
22f3 : a5 59 __ LDA T5 + 1 
22f5 : 85 12 __ STA P5 
22f7 : 20 3a 14 JSR $143a ; (bnk_cpytovdc.s0 + 0)
22fa : a5 55 __ LDA T3 + 0 
22fc : 85 0f __ STA P2 
22fe : a5 56 __ LDA T3 + 1 
2300 : 85 10 __ STA P3 
2302 : 20 9c 14 JSR $149c ; (bnk_cpyfromvdc.s0 + 0)
2305 : 20 c2 39 JSR $39c2 ; (getch.s0 + 0)
2308 : a9 00 __ LDA #$00
230a : 85 54 __ STA T2 + 0 
230c : ad d3 46 LDA $46d3 ; (vdc_state + 3)
230f : 85 55 __ STA T3 + 0 
2311 : ad d5 46 LDA $46d5 ; (vdc_state + 5)
2314 : 85 58 __ STA T5 + 0 
.l438:
2316 : a5 54 __ LDA T2 + 0 
2318 : c5 58 __ CMP T5 + 0 
231a : a9 00 __ LDA #$00
231c : 2a __ __ ROL
231d : 49 01 __ EOR #$01
231f : f0 03 __ BEQ $2324 ; (main.s436 + 0)
2321 : 4c 3f 31 JMP $313f ; (main.s439 + 0)
.s436:
2324 : ad d8 46 LDA $46d8 ; (vdc_state + 8)
2327 : 85 0d __ STA P0 
2329 : ad d9 46 LDA $46d9 ; (vdc_state + 9)
232c : 85 0e __ STA P1 
232e : a9 d0 __ LDA #$d0
2330 : 85 11 __ STA P4 
2332 : a9 07 __ LDA #$07
2334 : 85 12 __ STA P5 
2336 : a9 00 __ LDA #$00
2338 : 85 54 __ STA T2 + 0 
233a : 85 0f __ STA P2 
233c : a9 20 __ LDA #$20
233e : 85 10 __ STA P3 
2340 : 20 3a 14 JSR $143a ; (bnk_cpytovdc.s0 + 0)
2343 : 20 c2 39 JSR $39c2 ; (getch.s0 + 0)
2346 : ad d3 46 LDA $46d3 ; (vdc_state + 3)
2349 : 85 55 __ STA T3 + 0 
234b : ad d5 46 LDA $46d5 ; (vdc_state + 5)
234e : 85 58 __ STA T5 + 0 
.l513:
2350 : a5 54 __ LDA T2 + 0 
2352 : c5 58 __ CMP T5 + 0 
2354 : b0 03 __ BCS $2359 ; (main.s511 + 0)
2356 : 4c 5f 30 JMP $305f ; (main.s514 + 0)
.s511:
2359 : a9 00 __ LDA #$00
235b : 85 54 __ STA T2 + 0 
.l592:
235d : ad d9 46 LDA $46d9 ; (vdc_state + 9)
2360 : 85 58 __ STA T5 + 0 
2362 : a9 12 __ LDA #$12
2364 : 8d 00 d6 STA $d600 
2367 : ac d8 46 LDY $46d8 ; (vdc_state + 8)
.l7523:
236a : 2c 00 d6 BIT $d600 
236d : 10 fb __ BPL $236a ; (main.l7523 + 0)
.s602:
236f : a5 58 __ LDA T5 + 0 
2371 : 8d 01 d6 STA $d601 
2374 : a9 13 __ LDA #$13
2376 : 8d 00 d6 STA $d600 
.l7525:
2379 : 2c 00 d6 BIT $d600 
237c : 10 fb __ BPL $2379 ; (main.l7525 + 0)
.s607:
237e : 8c 01 d6 STY $d601 
2381 : a9 1f __ LDA #$1f
2383 : 8d 00 d6 STA $d600 
.l7527:
2386 : 2c 00 d6 BIT $d600 
2389 : 10 fb __ BPL $2386 ; (main.l7527 + 0)
.s611:
238b : a9 20 __ LDA #$20
238d : 8d 01 d6 STA $d601 
2390 : a9 18 __ LDA #$18
2392 : 8d 00 d6 STA $d600 
.l7529:
2395 : 2c 00 d6 BIT $d600 
2398 : 10 fb __ BPL $2395 ; (main.l7529 + 0)
.s617:
239a : ad 01 d6 LDA $d601 
239d : 29 7f __ AND #$7f
239f : aa __ __ TAX
23a0 : a9 18 __ LDA #$18
23a2 : 8d 00 d6 STA $d600 
.l7531:
23a5 : 2c 00 d6 BIT $d600 
23a8 : 10 fb __ BPL $23a5 ; (main.l7531 + 0)
.s623:
23aa : 8e 01 d6 STX $d601 
23ad : a9 1e __ LDA #$1e
23af : 8d 00 d6 STA $d600 
.l7533:
23b2 : 2c 00 d6 BIT $d600 
23b5 : 10 fb __ BPL $23b2 ; (main.l7533 + 0)
.s628:
23b7 : a9 4e __ LDA #$4e
23b9 : 8d 01 d6 STA $d601 
23bc : ad db 46 LDA $46db ; (vdc_state + 11)
23bf : 85 45 __ STA T7 + 0 
23c1 : a9 12 __ LDA #$12
23c3 : 8d 00 d6 STA $d600 
23c6 : ae da 46 LDX $46da ; (vdc_state + 10)
.l7535:
23c9 : 2c 00 d6 BIT $d600 
23cc : 10 fb __ BPL $23c9 ; (main.l7535 + 0)
.s635:
23ce : a5 45 __ LDA T7 + 0 
23d0 : 8d 01 d6 STA $d601 
23d3 : a9 13 __ LDA #$13
23d5 : 8d 00 d6 STA $d600 
.l7537:
23d8 : 2c 00 d6 BIT $d600 
23db : 10 fb __ BPL $23d8 ; (main.l7537 + 0)
.s640:
23dd : 8e 01 d6 STX $d601 
23e0 : a9 1f __ LDA #$1f
23e2 : 8d 00 d6 STA $d600 
.l7539:
23e5 : 2c 00 d6 BIT $d600 
23e8 : 10 fb __ BPL $23e5 ; (main.l7539 + 0)
.s644:
23ea : a9 c5 __ LDA #$c5
23ec : 8d 01 d6 STA $d601 
23ef : a9 18 __ LDA #$18
23f1 : 8d 00 d6 STA $d600 
.l7541:
23f4 : 2c 00 d6 BIT $d600 
23f7 : 10 fb __ BPL $23f4 ; (main.l7541 + 0)
.s650:
23f9 : ad 01 d6 LDA $d601 
23fc : 29 7f __ AND #$7f
23fe : aa __ __ TAX
23ff : a9 18 __ LDA #$18
2401 : 8d 00 d6 STA $d600 
.l7543:
2404 : 2c 00 d6 BIT $d600 
2407 : 10 fb __ BPL $2404 ; (main.l7543 + 0)
.s656:
2409 : 8e 01 d6 STX $d601 
240c : a9 1e __ LDA #$1e
240e : 8d 00 d6 STA $d600 
.l7545:
2411 : 2c 00 d6 BIT $d600 
2414 : 10 fb __ BPL $2411 ; (main.l7545 + 0)
.s661:
2416 : a9 4e __ LDA #$4e
2418 : 8d 01 d6 STA $d601 
241b : ad d7 46 LDA $46d7 ; (vdc_state + 7)
241e : 29 f0 __ AND #$f0
2420 : 09 45 __ ORA #$45
2422 : 8d d7 46 STA $46d7 ; (vdc_state + 7)
2425 : a2 00 __ LDX #$00
.l1470:
2427 : bd e8 41 LDA $41e8,x 
242a : e8 __ __ INX
242b : 09 00 __ ORA #$00
242d : d0 f8 __ BNE $2427 ; (main.l1470 + 0)
.s1471:
242f : 86 43 __ STX T6 + 0 
2431 : a9 12 __ LDA #$12
2433 : 8d 00 d6 STA $d600 
.l7548:
2436 : 2c 00 d6 BIT $d600 
2439 : 10 fb __ BPL $2436 ; (main.l7548 + 0)
.s677:
243b : a5 58 __ LDA T5 + 0 
243d : 8d 01 d6 STA $d601 
2440 : a9 13 __ LDA #$13
2442 : 8d 00 d6 STA $d600 
.l7550:
2445 : 2c 00 d6 BIT $d600 
2448 : 10 fb __ BPL $2445 ; (main.l7550 + 0)
.s682:
244a : 8c 01 d6 STY $d601 
244d : a9 1f __ LDA #$1f
244f : 8d 00 d6 STA $d600 
2452 : 8a __ __ TXA
2453 : f0 46 __ BEQ $249b ; (main.s687 + 0)
.s1661:
2455 : a2 00 __ LDX #$00
.l685:
2457 : bd e7 41 LDA $41e7,x 
245a : c9 20 __ CMP #$20
245c : b0 04 __ BCS $2462 ; (main.s691 + 0)
.s690:
245e : 09 80 __ ORA #$80
2460 : 90 2b __ BCC $248d ; (main.s1475 + 0)
.s691:
2462 : a8 __ __ TAY
2463 : c9 40 __ CMP #$40
2465 : 90 04 __ BCC $246b ; (main.s694 + 0)
.s696:
2467 : c9 60 __ CMP #$60
2469 : 90 11 __ BCC $247c ; (main.s693 + 0)
.s694:
246b : c9 60 __ CMP #$60
246d : 90 05 __ BCC $2474 ; (main.s698 + 0)
.s697:
246f : e9 20 __ SBC #$20
2471 : 4c 8d 24 JMP $248d ; (main.s1475 + 0)
.s698:
2474 : c9 a0 __ CMP #$a0
2476 : 90 0a __ BCC $2482 ; (main.s706 + 0)
.s708:
2478 : c9 c0 __ CMP #$c0
247a : b0 06 __ BCS $2482 ; (main.s706 + 0)
.s693:
247c : 38 __ __ SEC
247d : e9 40 __ SBC #$40
247f : 4c 8d 24 JMP $248d ; (main.s1475 + 0)
.s706:
2482 : c9 c0 __ CMP #$c0
2484 : 90 08 __ BCC $248e ; (main.l7554 + 0)
.s712:
2486 : c9 ff __ CMP #$ff
2488 : b0 04 __ BCS $248e ; (main.l7554 + 0)
.s709:
248a : 38 __ __ SEC
248b : e9 80 __ SBC #$80
.s1475:
248d : a8 __ __ TAY
.l7554:
248e : 2c 00 d6 BIT $d600 
2491 : 10 fb __ BPL $248e ; (main.l7554 + 0)
.s718:
2493 : 8c 01 d6 STY $d601 
2496 : e8 __ __ INX
2497 : e4 43 __ CPX T6 + 0 
2499 : 90 bc __ BCC $2457 ; (main.l685 + 0)
.s687:
249b : a9 12 __ LDA #$12
249d : 8d 00 d6 STA $d600 
24a0 : a6 43 __ LDX T6 + 0 
24a2 : ca __ __ DEX
24a3 : 86 58 __ STX T5 + 0 
24a5 : ad db 46 LDA $46db ; (vdc_state + 11)
24a8 : ae d7 46 LDX $46d7 ; (vdc_state + 7)
24ab : ac da 46 LDY $46da ; (vdc_state + 10)
.l7557:
24ae : 2c 00 d6 BIT $d600 
24b1 : 10 fb __ BPL $24ae ; (main.l7557 + 0)
.s725:
24b3 : 8d 01 d6 STA $d601 
24b6 : a9 13 __ LDA #$13
24b8 : 8d 00 d6 STA $d600 
.l7559:
24bb : 2c 00 d6 BIT $d600 
24be : 10 fb __ BPL $24bb ; (main.l7559 + 0)
.s730:
24c0 : 8c 01 d6 STY $d601 
24c3 : a9 1f __ LDA #$1f
24c5 : 8d 00 d6 STA $d600 
.l7561:
24c8 : 2c 00 d6 BIT $d600 
24cb : 10 fb __ BPL $24c8 ; (main.l7561 + 0)
.s734:
24cd : 8e 01 d6 STX $d601 
24d0 : a9 18 __ LDA #$18
24d2 : 8d 00 d6 STA $d600 
.l7563:
24d5 : 2c 00 d6 BIT $d600 
24d8 : 10 fb __ BPL $24d5 ; (main.l7563 + 0)
.s740:
24da : ad 01 d6 LDA $d601 
24dd : 29 7f __ AND #$7f
24df : a8 __ __ TAY
24e0 : a9 18 __ LDA #$18
24e2 : 8d 00 d6 STA $d600 
.l7565:
24e5 : 2c 00 d6 BIT $d600 
24e8 : 10 fb __ BPL $24e5 ; (main.l7565 + 0)
.s746:
24ea : 8c 01 d6 STY $d601 
24ed : a9 1e __ LDA #$1e
24ef : 8d 00 d6 STA $d600 
.l7567:
24f2 : 2c 00 d6 BIT $d600 
24f5 : 10 fb __ BPL $24f2 ; (main.l7567 + 0)
.s751:
24f7 : a5 58 __ LDA T5 + 0 
24f9 : 8d 01 d6 STA $d601 
24fc : 8a __ __ TXA
24fd : 29 b0 __ AND #$b0
24ff : 09 0d __ ORA #$0d
2501 : 8d d7 46 STA $46d7 ; (vdc_state + 7)
2504 : a9 91 __ LDA #$91
2506 : a0 02 __ LDY #$02
2508 : 91 23 __ STA (SP + 0),y 
250a : a9 47 __ LDA #$47
250c : c8 __ __ INY
250d : 91 23 __ STA (SP + 0),y 
250f : a9 48 __ LDA #$48
2511 : c8 __ __ INY
2512 : 91 23 __ STA (SP + 0),y 
2514 : a9 45 __ LDA #$45
2516 : c8 __ __ INY
2517 : 91 23 __ STA (SP + 0),y 
2519 : ad d0 46 LDA $46d0 ; (vdc_state + 0)
251c : c8 __ __ INY
251d : 91 23 __ STA (SP + 0),y 
251f : a9 00 __ LDA #$00
2521 : c8 __ __ INY
2522 : 91 23 __ STA (SP + 0),y 
2524 : ad d3 46 LDA $46d3 ; (vdc_state + 3)
2527 : 85 55 __ STA T3 + 0 
2529 : c8 __ __ INY
252a : 91 23 __ STA (SP + 0),y 
252c : ad d4 46 LDA $46d4 ; (vdc_state + 4)
252f : 85 56 __ STA T3 + 1 
2531 : c8 __ __ INY
2532 : 91 23 __ STA (SP + 0),y 
2534 : ad d5 46 LDA $46d5 ; (vdc_state + 5)
2537 : c8 __ __ INY
2538 : 91 23 __ STA (SP + 0),y 
253a : ad d6 46 LDA $46d6 ; (vdc_state + 6)
253d : c8 __ __ INY
253e : 91 23 __ STA (SP + 0),y 
2540 : ad d1 46 LDA $46d1 ; (vdc_state + 1)
2543 : d0 07 __ BNE $254c ; (main.s3534 + 0)
.s3535:
2545 : a9 41 __ LDA #$41
2547 : a2 fc __ LDX #$fc
2549 : 4c 50 25 JMP $2550 ; (main.s3536 + 0)
.s3534:
254c : a9 41 __ LDA #$41
254e : a2 f8 __ LDX #$f8
.s3536:
2550 : 85 59 __ STA T5 + 1 
2552 : 8a __ __ TXA
2553 : a0 0c __ LDY #$0c
2555 : 91 23 __ STA (SP + 0),y 
2557 : a5 59 __ LDA T5 + 1 
2559 : c8 __ __ INY
255a : 91 23 __ STA (SP + 0),y 
255c : 20 22 42 JSR $4222 ; (sprintf.s1000 + 0)
255f : 06 55 __ ASL T3 + 0 
2561 : 26 56 __ ROL T3 + 1 
2563 : a9 00 __ LDA #$00
2565 : 85 58 __ STA T5 + 0 
2567 : ad 91 47 LDA $4791 ; (linebuffer + 0)
256a : f0 0c __ BEQ $2578 ; (main.s760 + 0)
.s759:
256c : a2 00 __ LDX #$00
.l1472:
256e : bd 92 47 LDA $4792,x ; (linebuffer + 1)
2571 : e8 __ __ INX
2572 : 09 00 __ ORA #$00
2574 : d0 f8 __ BNE $256e ; (main.l1472 + 0)
.s1473:
2576 : 86 58 __ STX T5 + 0 
.s760:
2578 : ad d8 46 LDA $46d8 ; (vdc_state + 8)
257b : 18 __ __ CLC
257c : 65 55 __ ADC T3 + 0 
257e : aa __ __ TAX
257f : a9 12 __ LDA #$12
2581 : 8d 00 d6 STA $d600 
2584 : ad d9 46 LDA $46d9 ; (vdc_state + 9)
2587 : 65 56 __ ADC T3 + 1 
.l7572:
2589 : 2c 00 d6 BIT $d600 
258c : 10 fb __ BPL $2589 ; (main.l7572 + 0)
.s767:
258e : 8d 01 d6 STA $d601 
2591 : a9 13 __ LDA #$13
2593 : 8d 00 d6 STA $d600 
.l7574:
2596 : 2c 00 d6 BIT $d600 
2599 : 10 fb __ BPL $2596 ; (main.l7574 + 0)
.s772:
259b : 8e 01 d6 STX $d601 
259e : a9 1f __ LDA #$1f
25a0 : 8d 00 d6 STA $d600 
25a3 : a5 58 __ LDA T5 + 0 
25a5 : f0 62 __ BEQ $2609 ; (main.s777 + 0)
.s1650:
25a7 : a2 00 __ LDX #$00
.l775:
25a9 : bd 91 47 LDA $4791,x ; (linebuffer + 0)
25ac : c9 20 __ CMP #$20
25ae : b0 05 __ BCS $25b5 ; (main.s781 + 0)
.s780:
25b0 : 69 80 __ ADC #$80
25b2 : 4c fb 25 JMP $25fb ; (main.s1476 + 0)
.s781:
25b5 : a8 __ __ TAY
25b6 : c9 40 __ CMP #$40
25b8 : 90 04 __ BCC $25be ; (main.s784 + 0)
.s786:
25ba : c9 60 __ CMP #$60
25bc : 90 23 __ BCC $25e1 ; (main.s783 + 0)
.s784:
25be : c9 60 __ CMP #$60
25c0 : 90 0a __ BCC $25cc ; (main.s788 + 0)
.s790:
25c2 : 09 00 __ ORA #$00
25c4 : 30 06 __ BMI $25cc ; (main.s788 + 0)
.s787:
25c6 : 38 __ __ SEC
25c7 : e9 20 __ SBC #$20
25c9 : 4c fb 25 JMP $25fb ; (main.s1476 + 0)
.s788:
25cc : c9 80 __ CMP #$80
25ce : 90 09 __ BCC $25d9 ; (main.s792 + 0)
.s794:
25d0 : c9 a0 __ CMP #$a0
25d2 : b0 05 __ BCS $25d9 ; (main.s792 + 0)
.s791:
25d4 : 69 40 __ ADC #$40
25d6 : 4c fb 25 JMP $25fb ; (main.s1476 + 0)
.s792:
25d9 : c9 a0 __ CMP #$a0
25db : 90 0a __ BCC $25e7 ; (main.s796 + 0)
.s798:
25dd : c9 c0 __ CMP #$c0
25df : b0 06 __ BCS $25e7 ; (main.s796 + 0)
.s783:
25e1 : 38 __ __ SEC
25e2 : e9 40 __ SBC #$40
25e4 : 4c fb 25 JMP $25fb ; (main.s1476 + 0)
.s796:
25e7 : c9 c0 __ CMP #$c0
25e9 : 90 0a __ BCC $25f5 ; (main.s800 + 0)
.s802:
25eb : c9 ff __ CMP #$ff
25ed : b0 06 __ BCS $25f5 ; (main.s800 + 0)
.s799:
25ef : 38 __ __ SEC
25f0 : e9 80 __ SBC #$80
25f2 : 4c fb 25 JMP $25fb ; (main.s1476 + 0)
.s800:
25f5 : c9 ff __ CMP #$ff
25f7 : d0 03 __ BNE $25fc ; (main.l7578 + 0)
.s803:
25f9 : a9 5e __ LDA #$5e
.s1476:
25fb : a8 __ __ TAY
.l7578:
25fc : 2c 00 d6 BIT $d600 
25ff : 10 fb __ BPL $25fc ; (main.l7578 + 0)
.s808:
2601 : 8c 01 d6 STY $d601 
2604 : e8 __ __ INX
2605 : e4 58 __ CPX T5 + 0 
2607 : 90 a0 __ BCC $25a9 ; (main.l775 + 0)
.s777:
2609 : a9 12 __ LDA #$12
260b : 8d 00 d6 STA $d600 
260e : c6 58 __ DEC T5 + 0 
2610 : 18 __ __ CLC
2611 : a5 55 __ LDA T3 + 0 
2613 : 6d da 46 ADC $46da ; (vdc_state + 10)
2616 : a8 __ __ TAY
2617 : a5 56 __ LDA T3 + 1 
2619 : 6d db 46 ADC $46db ; (vdc_state + 11)
261c : ae d7 46 LDX $46d7 ; (vdc_state + 7)
.l7581:
261f : 2c 00 d6 BIT $d600 
2622 : 10 fb __ BPL $261f ; (main.l7581 + 0)
.s815:
2624 : 8d 01 d6 STA $d601 
2627 : a9 13 __ LDA #$13
2629 : 8d 00 d6 STA $d600 
.l7583:
262c : 2c 00 d6 BIT $d600 
262f : 10 fb __ BPL $262c ; (main.l7583 + 0)
.s820:
2631 : 8c 01 d6 STY $d601 
2634 : a9 1f __ LDA #$1f
2636 : 8d 00 d6 STA $d600 
.l7585:
2639 : 2c 00 d6 BIT $d600 
263c : 10 fb __ BPL $2639 ; (main.l7585 + 0)
.s824:
263e : 8e 01 d6 STX $d601 
2641 : a9 18 __ LDA #$18
2643 : 8d 00 d6 STA $d600 
.l7587:
2646 : 2c 00 d6 BIT $d600 
2649 : 10 fb __ BPL $2646 ; (main.l7587 + 0)
.s830:
264b : ad 01 d6 LDA $d601 
264e : 29 7f __ AND #$7f
2650 : aa __ __ TAX
2651 : a9 18 __ LDA #$18
2653 : 8d 00 d6 STA $d600 
.l7589:
2656 : 2c 00 d6 BIT $d600 
2659 : 10 fb __ BPL $2656 ; (main.l7589 + 0)
.s836:
265b : 8e 01 d6 STX $d601 
265e : a9 1e __ LDA #$1e
2660 : 8d 00 d6 STA $d600 
.l7591:
2663 : 2c 00 d6 BIT $d600 
2666 : 10 fb __ BPL $2663 ; (main.l7591 + 0)
.s841:
2668 : a5 58 __ LDA T5 + 0 
266a : 8d 01 d6 STA $d601 
266d : ad d3 46 LDA $46d3 ; (vdc_state + 3)
2670 : 0a __ __ ASL
2671 : aa __ __ TAX
2672 : a9 12 __ LDA #$12
2674 : 8d 00 d6 STA $d600 
2677 : ad d4 46 LDA $46d4 ; (vdc_state + 4)
267a : 2a __ __ ROL
267b : a8 __ __ TAY
267c : 8a __ __ TXA
267d : 18 __ __ CLC
267e : 6d d3 46 ADC $46d3 ; (vdc_state + 3)
2681 : aa __ __ TAX
2682 : 98 __ __ TYA
2683 : 6d d4 46 ADC $46d4 ; (vdc_state + 4)
2686 : a8 __ __ TAY
2687 : 8a __ __ TXA
2688 : 18 __ __ CLC
2689 : 69 04 __ ADC #$04
268b : 85 45 __ STA T7 + 0 
268d : 98 __ __ TYA
268e : 69 00 __ ADC #$00
2690 : 85 46 __ STA T7 + 1 
2692 : 18 __ __ CLC
2693 : a5 45 __ LDA T7 + 0 
2695 : 6d d8 46 ADC $46d8 ; (vdc_state + 8)
2698 : 85 47 __ STA T8 + 0 
269a : a5 46 __ LDA T7 + 1 
269c : 6d d9 46 ADC $46d9 ; (vdc_state + 9)
.l7593:
269f : 2c 00 d6 BIT $d600 
26a2 : 10 fb __ BPL $269f ; (main.l7593 + 0)
.s851:
26a4 : 8d 01 d6 STA $d601 
26a7 : a9 13 __ LDA #$13
26a9 : 8d 00 d6 STA $d600 
.l7595:
26ac : 2c 00 d6 BIT $d600 
26af : 10 fb __ BPL $26ac ; (main.l7595 + 0)
.s856:
26b1 : a5 47 __ LDA T8 + 0 
26b3 : 8d 01 d6 STA $d601 
26b6 : a9 1f __ LDA #$1f
26b8 : 8d 00 d6 STA $d600 
.l7597:
26bb : 2c 00 d6 BIT $d600 
26be : 10 fb __ BPL $26bb ; (main.l7597 + 0)
.s860:
26c0 : a9 6c __ LDA #$6c
26c2 : 8d 01 d6 STA $d601 
26c5 : a9 12 __ LDA #$12
26c7 : 8d 00 d6 STA $d600 
26ca : 18 __ __ CLC
26cb : a5 45 __ LDA T7 + 0 
26cd : 6d da 46 ADC $46da ; (vdc_state + 10)
26d0 : 85 45 __ STA T7 + 0 
26d2 : a5 46 __ LDA T7 + 1 
26d4 : 6d db 46 ADC $46db ; (vdc_state + 11)
.l7599:
26d7 : 2c 00 d6 BIT $d600 
26da : 10 fb __ BPL $26d7 ; (main.l7599 + 0)
.s867:
26dc : 8d 01 d6 STA $d601 
26df : a9 13 __ LDA #$13
26e1 : 8d 00 d6 STA $d600 
.l7601:
26e4 : 2c 00 d6 BIT $d600 
26e7 : 10 fb __ BPL $26e4 ; (main.l7601 + 0)
.s872:
26e9 : a5 45 __ LDA T7 + 0 
26eb : 8d 01 d6 STA $d601 
26ee : a9 1f __ LDA #$1f
26f0 : 8d 00 d6 STA $d600 
.l7603:
26f3 : 2c 00 d6 BIT $d600 
26f6 : 10 fb __ BPL $26f3 ; (main.l7603 + 0)
.s876:
26f8 : a9 09 __ LDA #$09
26fa : 8d 01 d6 STA $d601 
26fd : a9 12 __ LDA #$12
26ff : 8d 00 d6 STA $d600 
2702 : 8a __ __ TXA
2703 : 18 __ __ CLC
2704 : 69 05 __ ADC #$05
2706 : 85 45 __ STA T7 + 0 
2708 : 98 __ __ TYA
2709 : 69 00 __ ADC #$00
270b : 85 46 __ STA T7 + 1 
270d : 18 __ __ CLC
270e : a5 45 __ LDA T7 + 0 
2710 : 6d d8 46 ADC $46d8 ; (vdc_state + 8)
2713 : 85 47 __ STA T8 + 0 
2715 : a5 46 __ LDA T7 + 1 
2717 : 6d d9 46 ADC $46d9 ; (vdc_state + 9)
.l7605:
271a : 2c 00 d6 BIT $d600 
271d : 10 fb __ BPL $271a ; (main.l7605 + 0)
.s886:
271f : 8d 01 d6 STA $d601 
2722 : a9 13 __ LDA #$13
2724 : 8d 00 d6 STA $d600 
.l7607:
2727 : 2c 00 d6 BIT $d600 
272a : 10 fb __ BPL $2727 ; (main.l7607 + 0)
.s891:
272c : a5 47 __ LDA T8 + 0 
272e : 8d 01 d6 STA $d601 
2731 : a9 1f __ LDA #$1f
2733 : 8d 00 d6 STA $d600 
.l7609:
2736 : 2c 00 d6 BIT $d600 
2739 : 10 fb __ BPL $2736 ; (main.l7609 + 0)
.s895:
273b : a9 62 __ LDA #$62
273d : 8d 01 d6 STA $d601 
2740 : a9 18 __ LDA #$18
2742 : 8d 00 d6 STA $d600 
.l7611:
2745 : 2c 00 d6 BIT $d600 
2748 : 10 fb __ BPL $2745 ; (main.l7611 + 0)
.s901:
274a : ad 01 d6 LDA $d601 
274d : 29 7f __ AND #$7f
274f : 85 47 __ STA T8 + 0 
2751 : a9 18 __ LDA #$18
2753 : 8d 00 d6 STA $d600 
.l7613:
2756 : 2c 00 d6 BIT $d600 
2759 : 10 fb __ BPL $2756 ; (main.l7613 + 0)
.s907:
275b : a5 47 __ LDA T8 + 0 
275d : 8d 01 d6 STA $d601 
2760 : a9 1e __ LDA #$1e
2762 : 8d 00 d6 STA $d600 
.l7615:
2765 : 2c 00 d6 BIT $d600 
2768 : 10 fb __ BPL $2765 ; (main.l7615 + 0)
.s912:
276a : a9 45 __ LDA #$45
276c : 8d 01 d6 STA $d601 
276f : a9 12 __ LDA #$12
2771 : 8d 00 d6 STA $d600 
2774 : 18 __ __ CLC
2775 : a5 45 __ LDA T7 + 0 
2777 : 6d da 46 ADC $46da ; (vdc_state + 10)
277a : 85 45 __ STA T7 + 0 
277c : a5 46 __ LDA T7 + 1 
277e : 6d db 46 ADC $46db ; (vdc_state + 11)
.l7617:
2781 : 2c 00 d6 BIT $d600 
2784 : 10 fb __ BPL $2781 ; (main.l7617 + 0)
.s919:
2786 : 8d 01 d6 STA $d601 
2789 : a9 13 __ LDA #$13
278b : 8d 00 d6 STA $d600 
.l7619:
278e : 2c 00 d6 BIT $d600 
2791 : 10 fb __ BPL $278e ; (main.l7619 + 0)
.s924:
2793 : a5 45 __ LDA T7 + 0 
2795 : 8d 01 d6 STA $d601 
2798 : a9 1f __ LDA #$1f
279a : 8d 00 d6 STA $d600 
.l7621:
279d : 2c 00 d6 BIT $d600 
27a0 : 10 fb __ BPL $279d ; (main.l7621 + 0)
.s928:
27a2 : a9 09 __ LDA #$09
27a4 : 8d 01 d6 STA $d601 
27a7 : a9 18 __ LDA #$18
27a9 : 8d 00 d6 STA $d600 
.l7623:
27ac : 2c 00 d6 BIT $d600 
27af : 10 fb __ BPL $27ac ; (main.l7623 + 0)
.s934:
27b1 : ad 01 d6 LDA $d601 
27b4 : 29 7f __ AND #$7f
27b6 : 85 45 __ STA T7 + 0 
27b8 : a9 18 __ LDA #$18
27ba : 8d 00 d6 STA $d600 
.l7625:
27bd : 2c 00 d6 BIT $d600 
27c0 : 10 fb __ BPL $27bd ; (main.l7625 + 0)
.s940:
27c2 : a5 45 __ LDA T7 + 0 
27c4 : 8d 01 d6 STA $d601 
27c7 : a9 1e __ LDA #$1e
27c9 : 8d 00 d6 STA $d600 
.l7627:
27cc : 2c 00 d6 BIT $d600 
27cf : 10 fb __ BPL $27cc ; (main.l7627 + 0)
.s945:
27d1 : a9 45 __ LDA #$45
27d3 : 8d 01 d6 STA $d601 
27d6 : a9 12 __ LDA #$12
27d8 : 8d 00 d6 STA $d600 
27db : 8a __ __ TXA
27dc : 18 __ __ CLC
27dd : 69 4b __ ADC #$4b
27df : aa __ __ TAX
27e0 : 90 01 __ BCC $27e3 ; (main.s1497 + 0)
.s1496:
27e2 : c8 __ __ INY
.s1497:
27e3 : 18 __ __ CLC
27e4 : 6d d8 46 ADC $46d8 ; (vdc_state + 8)
27e7 : 85 58 __ STA T5 + 0 
27e9 : 98 __ __ TYA
27ea : 6d d9 46 ADC $46d9 ; (vdc_state + 9)
.l7629:
27ed : 2c 00 d6 BIT $d600 
27f0 : 10 fb __ BPL $27ed ; (main.l7629 + 0)
.s955:
27f2 : 8d 01 d6 STA $d601 
27f5 : a9 13 __ LDA #$13
27f7 : 8d 00 d6 STA $d600 
.l7631:
27fa : 2c 00 d6 BIT $d600 
27fd : 10 fb __ BPL $27fa ; (main.l7631 + 0)
.s960:
27ff : a5 58 __ LDA T5 + 0 
2801 : 8d 01 d6 STA $d601 
2804 : a9 1f __ LDA #$1f
2806 : 8d 00 d6 STA $d600 
.l7633:
2809 : 2c 00 d6 BIT $d600 
280c : 10 fb __ BPL $2809 ; (main.l7633 + 0)
.s964:
280e : a9 7b __ LDA #$7b
2810 : 8d 01 d6 STA $d601 
2813 : a9 12 __ LDA #$12
2815 : 8d 00 d6 STA $d600 
2818 : 8a __ __ TXA
2819 : 18 __ __ CLC
281a : 6d da 46 ADC $46da ; (vdc_state + 10)
281d : aa __ __ TAX
281e : 98 __ __ TYA
281f : 6d db 46 ADC $46db ; (vdc_state + 11)
.l7635:
2822 : 2c 00 d6 BIT $d600 
2825 : 10 fb __ BPL $2822 ; (main.l7635 + 0)
.s971:
2827 : 8d 01 d6 STA $d601 
282a : a9 13 __ LDA #$13
282c : 8d 00 d6 STA $d600 
.l7637:
282f : 2c 00 d6 BIT $d600 
2832 : 10 fb __ BPL $282f ; (main.l7637 + 0)
.s976:
2834 : 8e 01 d6 STX $d601 
2837 : a9 1f __ LDA #$1f
2839 : 8d 00 d6 STA $d600 
.l7639:
283c : 2c 00 d6 BIT $d600 
283f : 10 fb __ BPL $283c ; (main.l7639 + 0)
.s980:
2841 : a9 09 __ LDA #$09
2843 : 8d 01 d6 STA $d601 
2846 : ad d5 46 LDA $46d5 ; (vdc_state + 5)
2849 : 38 __ __ SEC
284a : e9 05 __ SBC #$05
284c : 85 55 __ STA T3 + 0 
284e : a9 04 __ LDA #$04
2850 : 85 57 __ STA T4 + 0 
.l982:
2852 : 18 __ __ CLC
2853 : a5 55 __ LDA T3 + 0 
2855 : 69 04 __ ADC #$04
2857 : 90 03 __ BCC $285c ; (main.s1192 + 0)
2859 : 4c d4 2f JMP $2fd4 ; (main.s983 + 0)
.s1192:
285c : c5 57 __ CMP T4 + 0 
285e : 90 05 __ BCC $2865 ; (main.s981 + 0)
.s1498:
2860 : f0 03 __ BEQ $2865 ; (main.s981 + 0)
2862 : 4c d4 2f JMP $2fd4 ; (main.s983 + 0)
.s981:
2865 : ad d5 46 LDA $46d5 ; (vdc_state + 5)
2868 : 38 __ __ SEC
2869 : e9 05 __ SBC #$05
286b : 85 55 __ STA T3 + 0 
286d : a9 04 __ LDA #$04
286f : 85 57 __ STA T4 + 0 
.l1022:
2871 : 18 __ __ CLC
2872 : a5 55 __ LDA T3 + 0 
2874 : 69 04 __ ADC #$04
2876 : 85 45 __ STA T7 + 0 
2878 : ad d3 46 LDA $46d3 ; (vdc_state + 3)
287b : 85 58 __ STA T5 + 0 
287d : ad d4 46 LDA $46d4 ; (vdc_state + 4)
2880 : 85 59 __ STA T5 + 1 
2882 : ad d8 46 LDA $46d8 ; (vdc_state + 8)
2885 : 85 43 __ STA T6 + 0 
2887 : ad d9 46 LDA $46d9 ; (vdc_state + 9)
288a : 85 44 __ STA T6 + 1 
288c : 90 03 __ BCC $2891 ; (main.s1178 + 0)
288e : 4c 4d 2f JMP $2f4d ; (main.s1023 + 0)
.s1178:
2891 : a5 57 __ LDA T4 + 0 
2893 : c5 45 __ CMP T7 + 0 
2895 : b0 03 __ BCS $289a ; (main.s1021 + 0)
2897 : 4c 4d 2f JMP $2f4d ; (main.s1023 + 0)
.s1021:
289a : a9 12 __ LDA #$12
289c : 8d 00 d6 STA $d600 
289f : ad d5 46 LDA $46d5 ; (vdc_state + 5)
28a2 : e9 01 __ SBC #$01
28a4 : 85 55 __ STA T3 + 0 
28a6 : ad d6 46 LDA $46d6 ; (vdc_state + 6)
28a9 : e9 00 __ SBC #$00
28ab : 85 56 __ STA T3 + 1 
28ad : a5 58 __ LDA T5 + 0 
28af : 85 1b __ STA ACCU + 0 
28b1 : a5 59 __ LDA T5 + 1 
28b3 : 85 1c __ STA ACCU + 1 
28b5 : a5 55 __ LDA T3 + 0 
28b7 : 20 84 45 JSR $4584 ; (mul16by8 + 0)
28ba : 18 __ __ CLC
28bb : a5 05 __ LDA WORK + 2 
28bd : 69 04 __ ADC #$04
28bf : aa __ __ TAX
28c0 : a5 06 __ LDA WORK + 3 
28c2 : 69 00 __ ADC #$00
28c4 : a8 __ __ TAY
28c5 : 8a __ __ TXA
28c6 : 18 __ __ CLC
28c7 : 65 43 __ ADC T6 + 0 
28c9 : 85 49 __ STA T9 + 0 
28cb : 98 __ __ TYA
28cc : 65 44 __ ADC T6 + 1 
.l7667:
28ce : 2c 00 d6 BIT $d600 
28d1 : 10 fb __ BPL $28ce ; (main.l7667 + 0)
.s1070:
28d3 : 8d 01 d6 STA $d601 
28d6 : a9 13 __ LDA #$13
28d8 : 8d 00 d6 STA $d600 
.l7669:
28db : 2c 00 d6 BIT $d600 
28de : 10 fb __ BPL $28db ; (main.l7669 + 0)
.s1075:
28e0 : a5 49 __ LDA T9 + 0 
28e2 : 8d 01 d6 STA $d601 
28e5 : a9 1f __ LDA #$1f
28e7 : 8d 00 d6 STA $d600 
.l7671:
28ea : 2c 00 d6 BIT $d600 
28ed : 10 fb __ BPL $28ea ; (main.l7671 + 0)
.s1079:
28ef : a9 7c __ LDA #$7c
28f1 : 8d 01 d6 STA $d601 
28f4 : a9 12 __ LDA #$12
28f6 : 8d 00 d6 STA $d600 
28f9 : 8a __ __ TXA
28fa : 18 __ __ CLC
28fb : 6d da 46 ADC $46da ; (vdc_state + 10)
28fe : aa __ __ TAX
28ff : 98 __ __ TYA
2900 : 6d db 46 ADC $46db ; (vdc_state + 11)
.l7673:
2903 : 2c 00 d6 BIT $d600 
2906 : 10 fb __ BPL $2903 ; (main.l7673 + 0)
.s1086:
2908 : 8d 01 d6 STA $d601 
290b : a9 13 __ LDA #$13
290d : 8d 00 d6 STA $d600 
.l7675:
2910 : 2c 00 d6 BIT $d600 
2913 : 10 fb __ BPL $2910 ; (main.l7675 + 0)
.s1091:
2915 : 8e 01 d6 STX $d601 
2918 : a9 1f __ LDA #$1f
291a : 8d 00 d6 STA $d600 
.l7677:
291d : 2c 00 d6 BIT $d600 
2920 : 10 fb __ BPL $291d ; (main.l7677 + 0)
.s1095:
2922 : a9 09 __ LDA #$09
2924 : 8d 01 d6 STA $d601 
2927 : a9 12 __ LDA #$12
2929 : 8d 00 d6 STA $d600 
292c : 18 __ __ CLC
292d : a5 05 __ LDA WORK + 2 
292f : 69 05 __ ADC #$05
2931 : aa __ __ TAX
2932 : a5 06 __ LDA WORK + 3 
2934 : 69 00 __ ADC #$00
2936 : a8 __ __ TAY
2937 : 8a __ __ TXA
2938 : 18 __ __ CLC
2939 : 65 43 __ ADC T6 + 0 
293b : 85 4c __ STA T11 + 0 
293d : 98 __ __ TYA
293e : 65 44 __ ADC T6 + 1 
.l7679:
2940 : 2c 00 d6 BIT $d600 
2943 : 10 fb __ BPL $2940 ; (main.l7679 + 0)
.s1105:
2945 : 8d 01 d6 STA $d601 
2948 : a9 13 __ LDA #$13
294a : 8d 00 d6 STA $d600 
.l7681:
294d : 2c 00 d6 BIT $d600 
2950 : 10 fb __ BPL $294d ; (main.l7681 + 0)
.s1110:
2952 : a5 4c __ LDA T11 + 0 
2954 : 8d 01 d6 STA $d601 
2957 : a9 1f __ LDA #$1f
2959 : 8d 00 d6 STA $d600 
.l7683:
295c : 2c 00 d6 BIT $d600 
295f : 10 fb __ BPL $295c ; (main.l7683 + 0)
.s1114:
2961 : a9 e2 __ LDA #$e2
2963 : 8d 01 d6 STA $d601 
2966 : a9 18 __ LDA #$18
2968 : 8d 00 d6 STA $d600 
.l7685:
296b : 2c 00 d6 BIT $d600 
296e : 10 fb __ BPL $296b ; (main.l7685 + 0)
.s1120:
2970 : ad 01 d6 LDA $d601 
2973 : 29 7f __ AND #$7f
2975 : 85 4c __ STA T11 + 0 
2977 : a9 18 __ LDA #$18
2979 : 8d 00 d6 STA $d600 
.l7687:
297c : 2c 00 d6 BIT $d600 
297f : 10 fb __ BPL $297c ; (main.l7687 + 0)
.s1126:
2981 : a5 4c __ LDA T11 + 0 
2983 : 8d 01 d6 STA $d601 
2986 : a9 1e __ LDA #$1e
2988 : 8d 00 d6 STA $d600 
.l7689:
298b : 2c 00 d6 BIT $d600 
298e : 10 fb __ BPL $298b ; (main.l7689 + 0)
.s1131:
2990 : a9 45 __ LDA #$45
2992 : 8d 01 d6 STA $d601 
2995 : a9 12 __ LDA #$12
2997 : 8d 00 d6 STA $d600 
299a : 8a __ __ TXA
299b : 18 __ __ CLC
299c : 6d da 46 ADC $46da ; (vdc_state + 10)
299f : aa __ __ TAX
29a0 : 98 __ __ TYA
29a1 : 6d db 46 ADC $46db ; (vdc_state + 11)
.l7691:
29a4 : 2c 00 d6 BIT $d600 
29a7 : 10 fb __ BPL $29a4 ; (main.l7691 + 0)
.s1138:
29a9 : 8d 01 d6 STA $d601 
29ac : a9 13 __ LDA #$13
29ae : 8d 00 d6 STA $d600 
.l7693:
29b1 : 2c 00 d6 BIT $d600 
29b4 : 10 fb __ BPL $29b1 ; (main.l7693 + 0)
.s1143:
29b6 : 8e 01 d6 STX $d601 
29b9 : a9 1f __ LDA #$1f
29bb : 8d 00 d6 STA $d600 
.l7695:
29be : 2c 00 d6 BIT $d600 
29c1 : 10 fb __ BPL $29be ; (main.l7695 + 0)
.s1147:
29c3 : a9 09 __ LDA #$09
29c5 : 8d 01 d6 STA $d601 
29c8 : a9 18 __ LDA #$18
29ca : 8d 00 d6 STA $d600 
.l7697:
29cd : 2c 00 d6 BIT $d600 
29d0 : 10 fb __ BPL $29cd ; (main.l7697 + 0)
.s1153:
29d2 : ad 01 d6 LDA $d601 
29d5 : 29 7f __ AND #$7f
29d7 : aa __ __ TAX
29d8 : a9 18 __ LDA #$18
29da : 8d 00 d6 STA $d600 
.l7699:
29dd : 2c 00 d6 BIT $d600 
29e0 : 10 fb __ BPL $29dd ; (main.l7699 + 0)
.s1159:
29e2 : 8e 01 d6 STX $d601 
29e5 : a9 1e __ LDA #$1e
29e7 : 8d 00 d6 STA $d600 
.l7701:
29ea : 2c 00 d6 BIT $d600 
29ed : 10 fb __ BPL $29ea ; (main.l7701 + 0)
.s1164:
29ef : a9 45 __ LDA #$45
29f1 : 8d 01 d6 STA $d601 
29f4 : a9 12 __ LDA #$12
29f6 : 8d 00 d6 STA $d600 
29f9 : 18 __ __ CLC
29fa : a5 05 __ LDA WORK + 2 
29fc : 69 4b __ ADC #$4b
29fe : aa __ __ TAX
29ff : a5 06 __ LDA WORK + 3 
2a01 : 69 00 __ ADC #$00
2a03 : a8 __ __ TAY
2a04 : 8a __ __ TXA
2a05 : 18 __ __ CLC
2a06 : 65 43 __ ADC T6 + 0 
2a08 : 85 47 __ STA T8 + 0 
2a0a : 98 __ __ TYA
2a0b : 65 44 __ ADC T6 + 1 
.l7703:
2a0d : 2c 00 d6 BIT $d600 
2a10 : 10 fb __ BPL $2a0d ; (main.l7703 + 0)
.s1174:
2a12 : 8d 01 d6 STA $d601 
2a15 : a9 13 __ LDA #$13
2a17 : 8d 00 d6 STA $d600 
.l7705:
2a1a : 2c 00 d6 BIT $d600 
2a1d : 10 fb __ BPL $2a1a ; (main.l7705 + 0)
.s1179:
2a1f : a5 47 __ LDA T8 + 0 
2a21 : 8d 01 d6 STA $d601 
2a24 : a9 1f __ LDA #$1f
2a26 : 8d 00 d6 STA $d600 
.l7707:
2a29 : 2c 00 d6 BIT $d600 
2a2c : 10 fb __ BPL $2a29 ; (main.l7707 + 0)
.s1183:
2a2e : a9 7e __ LDA #$7e
2a30 : 8d 01 d6 STA $d601 
2a33 : a9 12 __ LDA #$12
2a35 : 8d 00 d6 STA $d600 
2a38 : 8a __ __ TXA
2a39 : 18 __ __ CLC
2a3a : 6d da 46 ADC $46da ; (vdc_state + 10)
2a3d : aa __ __ TAX
2a3e : 98 __ __ TYA
2a3f : 6d db 46 ADC $46db ; (vdc_state + 11)
.l7709:
2a42 : 2c 00 d6 BIT $d600 
2a45 : 10 fb __ BPL $2a42 ; (main.l7709 + 0)
.s1190:
2a47 : 8d 01 d6 STA $d601 
2a4a : a9 13 __ LDA #$13
2a4c : 8d 00 d6 STA $d600 
.l7711:
2a4f : 2c 00 d6 BIT $d600 
2a52 : 10 fb __ BPL $2a4f ; (main.l7711 + 0)
.s1195:
2a54 : 8e 01 d6 STX $d601 
2a57 : a9 1f __ LDA #$1f
2a59 : 8d 00 d6 STA $d600 
.l7713:
2a5c : 2c 00 d6 BIT $d600 
2a5f : 10 fb __ BPL $2a5c ; (main.l7713 + 0)
.s1199:
2a61 : a9 09 __ LDA #$09
2a63 : 8d 01 d6 STA $d601 
2a66 : a5 56 __ LDA T3 + 1 
2a68 : d0 06 __ BNE $2a70 ; (main.s1592 + 0)
.s1117:
2a6a : a9 04 __ LDA #$04
2a6c : c5 55 __ CMP T3 + 0 
2a6e : b0 0f __ BCS $2a7f ; (main.s1203 + 0)
.s1592:
2a70 : a5 58 __ LDA T5 + 0 
2a72 : 85 55 __ STA T3 + 0 
2a74 : a5 59 __ LDA T5 + 1 
2a76 : 85 56 __ STA T3 + 1 
2a78 : a9 04 __ LDA #$04
2a7a : 85 57 __ STA T4 + 0 
2a7c : 4c 80 2e JMP $2e80 ; (main.l1201 + 0)
.s1203:
2a7f : ad d5 46 LDA $46d5 ; (vdc_state + 5)
2a82 : e9 05 __ SBC #$05
2a84 : 85 55 __ STA T3 + 0 
2a86 : ad d6 46 LDA $46d6 ; (vdc_state + 6)
2a89 : e9 00 __ SBC #$00
2a8b : 05 55 __ ORA T3 + 0 
2a8d : f0 03 __ BEQ $2a92 ; (main.s588 + 0)
2a8f : 4c d0 2b JMP $2bd0 ; (main.s1584 + 0)
.s588:
2a92 : e6 54 __ INC T2 + 0 
2a94 : a5 54 __ LDA T2 + 0 
2a96 : c9 02 __ CMP #$02
2a98 : b0 0f __ BCS $2aa9 ; (main.s589 + 0)
.s587:
2a9a : 09 00 __ ORA #$00
2a9c : d0 03 __ BNE $2aa1 ; (main.s590 + 0)
2a9e : 4c 5d 23 JMP $235d ; (main.l592 + 0)
.s590:
2aa1 : 85 16 __ STA P9 
2aa3 : 20 b2 3a JSR $3ab2 ; (vdc_set_mode.s1000 + 0)
2aa6 : 4c 5d 23 JMP $235d ; (main.l592 + 0)
.s589:
2aa9 : a9 00 __ LDA #$00
2aab : 85 52 __ STA T0 + 0 
2aad : 8d 30 d0 STA $d030 
2ab0 : 85 16 __ STA P9 
2ab2 : ad 11 d0 LDA $d011 
2ab5 : 29 7f __ AND #$7f
2ab7 : 09 10 __ ORA #$10
2ab9 : 8d 11 d0 STA $d011 
2abc : 20 b2 3a JSR $3ab2 ; (vdc_set_mode.s1000 + 0)
2abf : ad d3 46 LDA $46d3 ; (vdc_state + 3)
2ac2 : 85 55 __ STA T3 + 0 
2ac4 : ad d5 46 LDA $46d5 ; (vdc_state + 5)
2ac7 : 85 58 __ STA T5 + 0 
.l1420:
2ac9 : a5 52 __ LDA T0 + 0 
2acb : c5 58 __ CMP T5 + 0 
2acd : 90 21 __ BCC $2af0 ; (main.s1421 + 0)
.s1418:
2acf : a9 04 __ LDA #$04
2ad1 : 8d 06 d5 STA $d506 
2ad4 : a9 00 __ LDA #$00
2ad6 : 85 1b __ STA ACCU + 0 
2ad8 : 85 1c __ STA ACCU + 1 
.s1001:
2ada : 18 __ __ CLC
2adb : a5 23 __ LDA SP + 0 
2add : 69 0e __ ADC #$0e
2adf : 85 23 __ STA SP + 0 
2ae1 : 90 02 __ BCC $2ae5 ; (main.s1001 + 11)
2ae3 : e6 24 __ INC SP + 1 
2ae5 : a2 06 __ LDX #$06
2ae7 : bd 45 bf LDA $bf45,x ; (main@stack + 0)
2aea : 95 53 __ STA T1 + 0,x 
2aec : ca __ __ DEX
2aed : 10 f8 __ BPL $2ae7 ; (main.s1001 + 13)
2aef : 60 __ __ RTS
.s1421:
2af0 : ad d3 46 LDA $46d3 ; (vdc_state + 3)
2af3 : 85 1b __ STA ACCU + 0 
2af5 : ad d4 46 LDA $46d4 ; (vdc_state + 4)
2af8 : 85 1c __ STA ACCU + 1 
2afa : ad d7 46 LDA $46d7 ; (vdc_state + 7)
2afd : 85 53 __ STA T1 + 0 
2aff : a9 12 __ LDA #$12
2b01 : 8d 00 d6 STA $d600 
2b04 : a6 55 __ LDX T3 + 0 
2b06 : ca __ __ DEX
2b07 : 86 47 __ STX T8 + 0 
2b09 : a5 52 __ LDA T0 + 0 
2b0b : 20 84 45 JSR $4584 ; (mul16by8 + 0)
2b0e : 18 __ __ CLC
2b0f : a5 05 __ LDA WORK + 2 
2b11 : 6d d8 46 ADC $46d8 ; (vdc_state + 8)
2b14 : aa __ __ TAX
2b15 : a5 06 __ LDA WORK + 3 
2b17 : 6d d9 46 ADC $46d9 ; (vdc_state + 9)
.l7790:
2b1a : 2c 00 d6 BIT $d600 
2b1d : 10 fb __ BPL $2b1a ; (main.l7790 + 0)
.s1433:
2b1f : 8d 01 d6 STA $d601 
2b22 : a9 13 __ LDA #$13
2b24 : 8d 00 d6 STA $d600 
.l7792:
2b27 : 2c 00 d6 BIT $d600 
2b2a : 10 fb __ BPL $2b27 ; (main.l7792 + 0)
.s1438:
2b2c : 8e 01 d6 STX $d601 
2b2f : a9 1f __ LDA #$1f
2b31 : 8d 00 d6 STA $d600 
.l7794:
2b34 : 2c 00 d6 BIT $d600 
2b37 : 10 fb __ BPL $2b34 ; (main.l7794 + 0)
.s1442:
2b39 : a9 20 __ LDA #$20
2b3b : 8d 01 d6 STA $d601 
2b3e : a9 18 __ LDA #$18
2b40 : 8d 00 d6 STA $d600 
.l7796:
2b43 : 2c 00 d6 BIT $d600 
2b46 : 10 fb __ BPL $2b43 ; (main.l7796 + 0)
.s1448:
2b48 : ad 01 d6 LDA $d601 
2b4b : 29 7f __ AND #$7f
2b4d : aa __ __ TAX
2b4e : a9 18 __ LDA #$18
2b50 : 8d 00 d6 STA $d600 
.l7798:
2b53 : 2c 00 d6 BIT $d600 
2b56 : 10 fb __ BPL $2b53 ; (main.l7798 + 0)
.s1454:
2b58 : 8e 01 d6 STX $d601 
2b5b : a9 1e __ LDA #$1e
2b5d : 8d 00 d6 STA $d600 
.l7800:
2b60 : 2c 00 d6 BIT $d600 
2b63 : 10 fb __ BPL $2b60 ; (main.l7800 + 0)
.s1459:
2b65 : a5 47 __ LDA T8 + 0 
2b67 : 8d 01 d6 STA $d601 
2b6a : ad da 46 LDA $46da ; (vdc_state + 10)
2b6d : 18 __ __ CLC
2b6e : 65 05 __ ADC WORK + 2 
2b70 : aa __ __ TAX
2b71 : a9 12 __ LDA #$12
2b73 : 8d 00 d6 STA $d600 
2b76 : ad db 46 LDA $46db ; (vdc_state + 11)
2b79 : 65 06 __ ADC WORK + 3 
.l7802:
2b7b : 2c 00 d6 BIT $d600 
2b7e : 10 fb __ BPL $2b7b ; (main.l7802 + 0)
.s1466:
2b80 : 8d 01 d6 STA $d601 
2b83 : a9 13 __ LDA #$13
2b85 : 8d 00 d6 STA $d600 
.l7804:
2b88 : 2c 00 d6 BIT $d600 
2b8b : 10 fb __ BPL $2b88 ; (main.l7804 + 0)
.s1471:
2b8d : 8e 01 d6 STX $d601 
2b90 : a9 1f __ LDA #$1f
2b92 : 8d 00 d6 STA $d600 
.l7806:
2b95 : 2c 00 d6 BIT $d600 
2b98 : 10 fb __ BPL $2b95 ; (main.l7806 + 0)
.s1475:
2b9a : a5 53 __ LDA T1 + 0 
2b9c : 8d 01 d6 STA $d601 
2b9f : a9 18 __ LDA #$18
2ba1 : 8d 00 d6 STA $d600 
.l7808:
2ba4 : 2c 00 d6 BIT $d600 
2ba7 : 10 fb __ BPL $2ba4 ; (main.l7808 + 0)
.s1481:
2ba9 : ad 01 d6 LDA $d601 
2bac : 29 7f __ AND #$7f
2bae : aa __ __ TAX
2baf : a9 18 __ LDA #$18
2bb1 : 8d 00 d6 STA $d600 
.l7810:
2bb4 : 2c 00 d6 BIT $d600 
2bb7 : 10 fb __ BPL $2bb4 ; (main.l7810 + 0)
.s1487:
2bb9 : 8e 01 d6 STX $d601 
2bbc : a9 1e __ LDA #$1e
2bbe : 8d 00 d6 STA $d600 
.l7812:
2bc1 : 2c 00 d6 BIT $d600 
2bc4 : 10 fb __ BPL $2bc1 ; (main.l7812 + 0)
.s1492:
2bc6 : a5 47 __ LDA T8 + 0 
2bc8 : 8d 01 d6 STA $d601 
2bcb : e6 52 __ INC T0 + 0 
2bcd : 4c c9 2a JMP $2ac9 ; (main.l1420 + 0)
.s1584:
2bd0 : ad d3 46 LDA $46d3 ; (vdc_state + 3)
2bd3 : 0a __ __ ASL
2bd4 : 85 55 __ STA T3 + 0 
2bd6 : ad d4 46 LDA $46d4 ; (vdc_state + 4)
2bd9 : 2a __ __ ROL
2bda : 06 55 __ ASL T3 + 0 
2bdc : 2a __ __ ROL
2bdd : aa __ __ TAX
2bde : 18 __ __ CLC
2bdf : a5 55 __ LDA T3 + 0 
2be1 : 69 05 __ ADC #$05
2be3 : 85 55 __ STA T3 + 0 
2be5 : 90 01 __ BCC $2be8 ; (main.s1500 + 0)
.s1499:
2be7 : e8 __ __ INX
.s1500:
2be8 : 86 56 __ STX T3 + 1 
2bea : a9 00 __ LDA #$00
2bec : 85 57 __ STA T4 + 0 
.l1249:
2bee : 20 c2 39 JSR $39c2 ; (getch.s0 + 0)
2bf1 : ad d5 46 LDA $46d5 ; (vdc_state + 5)
2bf4 : 38 __ __ SEC
2bf5 : e9 06 __ SBC #$06
2bf7 : f0 23 __ BEQ $2c1c ; (main.s1252 + 0)
.s1583:
2bf9 : aa __ __ TAX
2bfa : ad d8 46 LDA $46d8 ; (vdc_state + 8)
2bfd : 18 __ __ CLC
2bfe : 65 55 __ ADC T3 + 0 
2c00 : 85 58 __ STA T5 + 0 
2c02 : a8 __ __ TAY
2c03 : ad d9 46 LDA $46d9 ; (vdc_state + 9)
2c06 : 65 56 __ ADC T3 + 1 
2c08 : 85 59 __ STA T5 + 1 
2c0a : ad d3 46 LDA $46d3 ; (vdc_state + 3)
2c0d : 18 __ __ CLC
2c0e : 65 58 __ ADC T5 + 0 
2c10 : 85 43 __ STA T6 + 0 
2c12 : ad d4 46 LDA $46d4 ; (vdc_state + 4)
2c15 : 65 59 __ ADC T5 + 1 
2c17 : 85 44 __ STA T6 + 1 
2c19 : 4c e8 2d JMP $2de8 ; (main.l1254 + 0)
.s1252:
2c1c : ad d5 46 LDA $46d5 ; (vdc_state + 5)
2c1f : 38 __ __ SEC
2c20 : e9 06 __ SBC #$06
2c22 : f0 03 __ BEQ $2c27 ; (main.s1298 + 0)
2c24 : 4c 30 2d JMP $2d30 ; (main.s1575 + 0)
.s1298:
2c27 : ad d3 46 LDA $46d3 ; (vdc_state + 3)
2c2a : 85 1b __ STA ACCU + 0 
2c2c : ad d4 46 LDA $46d4 ; (vdc_state + 4)
2c2f : 85 1c __ STA ACCU + 1 
2c31 : ad d6 46 LDA $46d6 ; (vdc_state + 6)
2c34 : 85 44 __ STA T6 + 1 
2c36 : a9 12 __ LDA #$12
2c38 : 8d 00 d6 STA $d600 
2c3b : ad d5 46 LDA $46d5 ; (vdc_state + 5)
2c3e : 85 43 __ STA T6 + 0 
2c40 : 38 __ __ SEC
2c41 : e9 02 __ SBC #$02
2c43 : 20 84 45 JSR $4584 ; (mul16by8 + 0)
2c46 : 18 __ __ CLC
2c47 : a5 05 __ LDA WORK + 2 
2c49 : 69 05 __ ADC #$05
2c4b : 85 58 __ STA T5 + 0 
2c4d : a5 06 __ LDA WORK + 3 
2c4f : 69 00 __ ADC #$00
2c51 : 85 59 __ STA T5 + 1 
2c53 : 18 __ __ CLC
2c54 : a5 58 __ LDA T5 + 0 
2c56 : 6d d8 46 ADC $46d8 ; (vdc_state + 8)
2c59 : aa __ __ TAX
2c5a : a5 59 __ LDA T5 + 1 
2c5c : 6d d9 46 ADC $46d9 ; (vdc_state + 9)
.l7764:
2c5f : 2c 00 d6 BIT $d600 
2c62 : 10 fb __ BPL $2c5f ; (main.l7764 + 0)
.s1353:
2c64 : 8d 01 d6 STA $d601 
2c67 : a9 13 __ LDA #$13
2c69 : 8d 00 d6 STA $d600 
.l7766:
2c6c : 2c 00 d6 BIT $d600 
2c6f : 10 fb __ BPL $2c6c ; (main.l7766 + 0)
.s1358:
2c71 : 8e 01 d6 STX $d601 
2c74 : a9 1f __ LDA #$1f
2c76 : 8d 00 d6 STA $d600 
.l7768:
2c79 : 2c 00 d6 BIT $d600 
2c7c : 10 fb __ BPL $2c79 ; (main.l7768 + 0)
.s1362:
2c7e : a9 20 __ LDA #$20
2c80 : 8d 01 d6 STA $d601 
2c83 : a9 18 __ LDA #$18
2c85 : 8d 00 d6 STA $d600 
.l7770:
2c88 : 2c 00 d6 BIT $d600 
2c8b : 10 fb __ BPL $2c88 ; (main.l7770 + 0)
.s1368:
2c8d : ad 01 d6 LDA $d601 
2c90 : 29 7f __ AND #$7f
2c92 : aa __ __ TAX
2c93 : a9 18 __ LDA #$18
2c95 : 8d 00 d6 STA $d600 
.l7772:
2c98 : 2c 00 d6 BIT $d600 
2c9b : 10 fb __ BPL $2c98 ; (main.l7772 + 0)
.s1374:
2c9d : 8e 01 d6 STX $d601 
2ca0 : a9 1e __ LDA #$1e
2ca2 : 8d 00 d6 STA $d600 
.l7774:
2ca5 : 2c 00 d6 BIT $d600 
2ca8 : 10 fb __ BPL $2ca5 ; (main.l7774 + 0)
.s1379:
2caa : a9 45 __ LDA #$45
2cac : 8d 01 d6 STA $d601 
2caf : ad da 46 LDA $46da ; (vdc_state + 10)
2cb2 : 18 __ __ CLC
2cb3 : 65 58 __ ADC T5 + 0 
2cb5 : aa __ __ TAX
2cb6 : a9 12 __ LDA #$12
2cb8 : 8d 00 d6 STA $d600 
2cbb : ad db 46 LDA $46db ; (vdc_state + 11)
2cbe : 65 59 __ ADC T5 + 1 
.l7776:
2cc0 : 2c 00 d6 BIT $d600 
2cc3 : 10 fb __ BPL $2cc0 ; (main.l7776 + 0)
.s1386:
2cc5 : 8d 01 d6 STA $d601 
2cc8 : a9 13 __ LDA #$13
2cca : 8d 00 d6 STA $d600 
.l7778:
2ccd : 2c 00 d6 BIT $d600 
2cd0 : 10 fb __ BPL $2ccd ; (main.l7778 + 0)
.s1391:
2cd2 : 8e 01 d6 STX $d601 
2cd5 : a9 1f __ LDA #$1f
2cd7 : 8d 00 d6 STA $d600 
.l7780:
2cda : 2c 00 d6 BIT $d600 
2cdd : 10 fb __ BPL $2cda ; (main.l7780 + 0)
.s1395:
2cdf : a9 0d __ LDA #$0d
2ce1 : 8d 01 d6 STA $d601 
2ce4 : a9 18 __ LDA #$18
2ce6 : 8d 00 d6 STA $d600 
.l7782:
2ce9 : 2c 00 d6 BIT $d600 
2cec : 10 fb __ BPL $2ce9 ; (main.l7782 + 0)
.s1401:
2cee : ad 01 d6 LDA $d601 
2cf1 : 29 7f __ AND #$7f
2cf3 : aa __ __ TAX
2cf4 : a9 18 __ LDA #$18
2cf6 : 8d 00 d6 STA $d600 
.l7784:
2cf9 : 2c 00 d6 BIT $d600 
2cfc : 10 fb __ BPL $2cf9 ; (main.l7784 + 0)
.s1407:
2cfe : 8e 01 d6 STX $d601 
2d01 : a9 1e __ LDA #$1e
2d03 : 8d 00 d6 STA $d600 
.l7786:
2d06 : 2c 00 d6 BIT $d600 
2d09 : 10 fb __ BPL $2d06 ; (main.l7786 + 0)
.s1412:
2d0b : a9 45 __ LDA #$45
2d0d : 8d 01 d6 STA $d601 
2d10 : 38 __ __ SEC
2d11 : a5 43 __ LDA T6 + 0 
2d13 : e9 05 __ SBC #$05
2d15 : 85 58 __ STA T5 + 0 
2d17 : a5 44 __ LDA T6 + 1 
2d19 : e9 00 __ SBC #$00
2d1b : e6 57 __ INC T4 + 0 
2d1d : 09 00 __ ORA #$00
2d1f : f0 03 __ BEQ $2d24 ; (main.s1045 + 0)
2d21 : 4c ee 2b JMP $2bee ; (main.l1249 + 0)
.s1045:
2d24 : a5 57 __ LDA T4 + 0 
2d26 : c5 58 __ CMP T5 + 0 
2d28 : b0 03 __ BCS $2d2d ; (main.s1045 + 9)
2d2a : 4c ee 2b JMP $2bee ; (main.l1249 + 0)
2d2d : 4c 92 2a JMP $2a92 ; (main.s588 + 0)
.s1575:
2d30 : aa __ __ TAX
2d31 : ad da 46 LDA $46da ; (vdc_state + 10)
2d34 : 18 __ __ CLC
2d35 : 65 55 __ ADC T3 + 0 
2d37 : 85 58 __ STA T5 + 0 
2d39 : a8 __ __ TAY
2d3a : ad db 46 LDA $46db ; (vdc_state + 11)
2d3d : 65 56 __ ADC T3 + 1 
2d3f : 85 59 __ STA T5 + 1 
2d41 : ad d3 46 LDA $46d3 ; (vdc_state + 3)
2d44 : 18 __ __ CLC
2d45 : 65 58 __ ADC T5 + 0 
2d47 : 85 43 __ STA T6 + 0 
2d49 : ad d4 46 LDA $46d4 ; (vdc_state + 4)
2d4c : 65 59 __ ADC T5 + 1 
2d4e : 85 44 __ STA T6 + 1 
.l1300:
2d50 : a9 12 __ LDA #$12
2d52 : 8d 00 d6 STA $d600 
.l7749:
2d55 : 2c 00 d6 BIT $d600 
2d58 : 10 fb __ BPL $2d55 ; (main.l7749 + 0)
.s1309:
2d5a : a5 59 __ LDA T5 + 1 
2d5c : 8d 01 d6 STA $d601 
2d5f : a9 13 __ LDA #$13
2d61 : 8d 00 d6 STA $d600 
.l7751:
2d64 : 2c 00 d6 BIT $d600 
2d67 : 10 fb __ BPL $2d64 ; (main.l7751 + 0)
.s1314:
2d69 : 8c 01 d6 STY $d601 
2d6c : a9 1f __ LDA #$1f
2d6e : 8d 00 d6 STA $d600 
2d71 : a9 18 __ LDA #$18
2d73 : 8d 00 d6 STA $d600 
.l7753:
2d76 : 2c 00 d6 BIT $d600 
2d79 : 10 fb __ BPL $2d76 ; (main.l7753 + 0)
.s1321:
2d7b : ad 01 d6 LDA $d601 
2d7e : 09 80 __ ORA #$80
2d80 : 85 45 __ STA T7 + 0 
2d82 : a9 18 __ LDA #$18
2d84 : 8d 00 d6 STA $d600 
.l7755:
2d87 : 2c 00 d6 BIT $d600 
2d8a : 10 fb __ BPL $2d87 ; (main.l7755 + 0)
.s1327:
2d8c : a5 45 __ LDA T7 + 0 
2d8e : 8d 01 d6 STA $d601 
2d91 : a9 20 __ LDA #$20
2d93 : 8d 00 d6 STA $d600 
.l7757:
2d96 : 2c 00 d6 BIT $d600 
2d99 : 10 fb __ BPL $2d96 ; (main.l7757 + 0)
.s1332:
2d9b : a5 44 __ LDA T6 + 1 
2d9d : 8d 01 d6 STA $d601 
2da0 : a9 21 __ LDA #$21
2da2 : 8d 00 d6 STA $d600 
.l7759:
2da5 : 2c 00 d6 BIT $d600 
2da8 : 10 fb __ BPL $2da5 ; (main.l7759 + 0)
.s1337:
2daa : a5 43 __ LDA T6 + 0 
2dac : 8d 01 d6 STA $d601 
2daf : a9 1f __ LDA #$1f
2db1 : 8d 00 d6 STA $d600 
2db4 : a9 1e __ LDA #$1e
2db6 : 8d 00 d6 STA $d600 
.l7761:
2db9 : 2c 00 d6 BIT $d600 
2dbc : 10 fb __ BPL $2db9 ; (main.l7761 + 0)
.s1343:
2dbe : a9 46 __ LDA #$46
2dc0 : 8d 01 d6 STA $d601 
2dc3 : ad d3 46 LDA $46d3 ; (vdc_state + 3)
2dc6 : 18 __ __ CLC
2dc7 : 65 43 __ ADC T6 + 0 
2dc9 : 85 43 __ STA T6 + 0 
2dcb : ad d4 46 LDA $46d4 ; (vdc_state + 4)
2dce : 65 44 __ ADC T6 + 1 
2dd0 : 85 44 __ STA T6 + 1 
2dd2 : 98 __ __ TYA
2dd3 : 18 __ __ CLC
2dd4 : 6d d3 46 ADC $46d3 ; (vdc_state + 3)
2dd7 : a8 __ __ TAY
2dd8 : a5 59 __ LDA T5 + 1 
2dda : 6d d4 46 ADC $46d4 ; (vdc_state + 4)
2ddd : 85 59 __ STA T5 + 1 
2ddf : ca __ __ DEX
2de0 : f0 03 __ BEQ $2de5 ; (main.s1343 + 39)
2de2 : 4c 50 2d JMP $2d50 ; (main.l1300 + 0)
2de5 : 4c 27 2c JMP $2c27 ; (main.s1298 + 0)
.l1254:
2de8 : a9 12 __ LDA #$12
2dea : 8d 00 d6 STA $d600 
.l7733:
2ded : 2c 00 d6 BIT $d600 
2df0 : 10 fb __ BPL $2ded ; (main.l7733 + 0)
.s1263:
2df2 : a5 59 __ LDA T5 + 1 
2df4 : 8d 01 d6 STA $d601 
2df7 : a9 13 __ LDA #$13
2df9 : 8d 00 d6 STA $d600 
.l7735:
2dfc : 2c 00 d6 BIT $d600 
2dff : 10 fb __ BPL $2dfc ; (main.l7735 + 0)
.s1268:
2e01 : 8c 01 d6 STY $d601 
2e04 : a9 1f __ LDA #$1f
2e06 : 8d 00 d6 STA $d600 
2e09 : a9 18 __ LDA #$18
2e0b : 8d 00 d6 STA $d600 
.l7737:
2e0e : 2c 00 d6 BIT $d600 
2e11 : 10 fb __ BPL $2e0e ; (main.l7737 + 0)
.s1275:
2e13 : ad 01 d6 LDA $d601 
2e16 : 09 80 __ ORA #$80
2e18 : 85 45 __ STA T7 + 0 
2e1a : a9 18 __ LDA #$18
2e1c : 8d 00 d6 STA $d600 
.l7739:
2e1f : 2c 00 d6 BIT $d600 
2e22 : 10 fb __ BPL $2e1f ; (main.l7739 + 0)
.s1281:
2e24 : a5 45 __ LDA T7 + 0 
2e26 : 8d 01 d6 STA $d601 
2e29 : a9 20 __ LDA #$20
2e2b : 8d 00 d6 STA $d600 
.l7741:
2e2e : 2c 00 d6 BIT $d600 
2e31 : 10 fb __ BPL $2e2e ; (main.l7741 + 0)
.s1286:
2e33 : a5 44 __ LDA T6 + 1 
2e35 : 8d 01 d6 STA $d601 
2e38 : a9 21 __ LDA #$21
2e3a : 8d 00 d6 STA $d600 
.l7743:
2e3d : 2c 00 d6 BIT $d600 
2e40 : 10 fb __ BPL $2e3d ; (main.l7743 + 0)
.s1291:
2e42 : a5 43 __ LDA T6 + 0 
2e44 : 8d 01 d6 STA $d601 
2e47 : a9 1f __ LDA #$1f
2e49 : 8d 00 d6 STA $d600 
2e4c : a9 1e __ LDA #$1e
2e4e : 8d 00 d6 STA $d600 
.l7745:
2e51 : 2c 00 d6 BIT $d600 
2e54 : 10 fb __ BPL $2e51 ; (main.l7745 + 0)
.s1297:
2e56 : a9 46 __ LDA #$46
2e58 : 8d 01 d6 STA $d601 
2e5b : ad d3 46 LDA $46d3 ; (vdc_state + 3)
2e5e : 18 __ __ CLC
2e5f : 65 43 __ ADC T6 + 0 
2e61 : 85 43 __ STA T6 + 0 
2e63 : ad d4 46 LDA $46d4 ; (vdc_state + 4)
2e66 : 65 44 __ ADC T6 + 1 
2e68 : 85 44 __ STA T6 + 1 
2e6a : 98 __ __ TYA
2e6b : 18 __ __ CLC
2e6c : 6d d3 46 ADC $46d3 ; (vdc_state + 3)
2e6f : a8 __ __ TAY
2e70 : a5 59 __ LDA T5 + 1 
2e72 : 6d d4 46 ADC $46d4 ; (vdc_state + 4)
2e75 : 85 59 __ STA T5 + 1 
2e77 : ca __ __ DEX
2e78 : f0 03 __ BEQ $2e7d ; (main.s1297 + 39)
2e7a : 4c e8 2d JMP $2de8 ; (main.l1254 + 0)
2e7d : 4c 1c 2c JMP $2c1c ; (main.s1252 + 0)
.l1201:
2e80 : a5 55 __ LDA T3 + 0 
2e82 : 85 1b __ STA ACCU + 0 
2e84 : a5 56 __ LDA T3 + 1 
2e86 : 85 1c __ STA ACCU + 1 
2e88 : a5 57 __ LDA T4 + 0 
2e8a : 20 84 45 JSR $4584 ; (mul16by8 + 0)
2e8d : a5 05 __ LDA WORK + 2 
2e8f : 85 58 __ STA T5 + 0 
2e91 : a5 06 __ LDA WORK + 3 
2e93 : 85 59 __ STA T5 + 1 
2e95 : a0 05 __ LDY #$05
2e97 : a6 53 __ LDX T1 + 0 
.l1205:
2e99 : 86 4c __ STX T11 + 0 
2e9b : a9 12 __ LDA #$12
2e9d : 8d 00 d6 STA $d600 
2ea0 : a5 52 __ LDA T0 + 0 
2ea2 : 85 50 __ STA T13 + 0 
2ea4 : 98 __ __ TYA
2ea5 : 18 __ __ CLC
2ea6 : 65 58 __ ADC T5 + 0 
2ea8 : 85 45 __ STA T7 + 0 
2eaa : a9 00 __ LDA #$00
2eac : 65 59 __ ADC T5 + 1 
2eae : 85 46 __ STA T7 + 1 
2eb0 : 18 __ __ CLC
2eb1 : a5 45 __ LDA T7 + 0 
2eb3 : 65 43 __ ADC T6 + 0 
2eb5 : 85 47 __ STA T8 + 0 
2eb7 : a5 46 __ LDA T7 + 1 
2eb9 : 65 44 __ ADC T6 + 1 
2ebb : e6 52 __ INC T0 + 0 
2ebd : e8 __ __ INX
.l7716:
2ebe : 2c 00 d6 BIT $d600 
2ec1 : 10 fb __ BPL $2ebe ; (main.l7716 + 0)
.s1217:
2ec3 : 8d 01 d6 STA $d601 
2ec6 : a9 13 __ LDA #$13
2ec8 : 8d 00 d6 STA $d600 
.l7718:
2ecb : 2c 00 d6 BIT $d600 
2ece : 10 fb __ BPL $2ecb ; (main.l7718 + 0)
.s1222:
2ed0 : a5 47 __ LDA T8 + 0 
2ed2 : 8d 01 d6 STA $d601 
2ed5 : a9 1f __ LDA #$1f
2ed7 : 8d 00 d6 STA $d600 
.l7720:
2eda : 2c 00 d6 BIT $d600 
2edd : 10 fb __ BPL $2eda ; (main.l7720 + 0)
.s1226:
2edf : a5 50 __ LDA T13 + 0 
2ee1 : 8d 01 d6 STA $d601 
2ee4 : ad da 46 LDA $46da ; (vdc_state + 10)
2ee7 : 18 __ __ CLC
2ee8 : 65 45 __ ADC T7 + 0 
2eea : 85 45 __ STA T7 + 0 
2eec : a9 12 __ LDA #$12
2eee : 8d 00 d6 STA $d600 
2ef1 : ad db 46 LDA $46db ; (vdc_state + 11)
2ef4 : 65 46 __ ADC T7 + 1 
.l7722:
2ef6 : 2c 00 d6 BIT $d600 
2ef9 : 10 fb __ BPL $2ef6 ; (main.l7722 + 0)
.s1233:
2efb : 8d 01 d6 STA $d601 
2efe : a9 13 __ LDA #$13
2f00 : 8d 00 d6 STA $d600 
.l7724:
2f03 : 2c 00 d6 BIT $d600 
2f06 : 10 fb __ BPL $2f03 ; (main.l7724 + 0)
.s1238:
2f08 : a5 45 __ LDA T7 + 0 
2f0a : 8d 01 d6 STA $d601 
2f0d : a9 1f __ LDA #$1f
2f0f : 8d 00 d6 STA $d600 
.l7726:
2f12 : 2c 00 d6 BIT $d600 
2f15 : 10 fb __ BPL $2f12 ; (main.l7726 + 0)
.s1242:
2f17 : a5 4c __ LDA T11 + 0 
2f19 : 8d 01 d6 STA $d601 
2f1c : e0 10 __ CPX #$10
2f1e : 90 02 __ BCC $2f22 ; (main.s5161 + 0)
.s1243:
2f20 : a2 00 __ LDX #$00
.s5161:
2f22 : c8 __ __ INY
2f23 : c0 4b __ CPY #$4b
2f25 : b0 03 __ BCS $2f2a ; (main.s1202 + 0)
2f27 : 4c 99 2e JMP $2e99 ; (main.l1205 + 0)
.s1202:
2f2a : 86 53 __ STX T1 + 0 
2f2c : ad d5 46 LDA $46d5 ; (vdc_state + 5)
2f2f : e9 01 __ SBC #$01
2f31 : 85 58 __ STA T5 + 0 
2f33 : ad d6 46 LDA $46d6 ; (vdc_state + 6)
2f36 : e9 00 __ SBC #$00
2f38 : e6 57 __ INC T4 + 0 
2f3a : 09 00 __ ORA #$00
2f3c : f0 03 __ BEQ $2f41 ; (main.s1099 + 0)
2f3e : 4c 80 2e JMP $2e80 ; (main.l1201 + 0)
.s1099:
2f41 : a5 57 __ LDA T4 + 0 
2f43 : c5 58 __ CMP T5 + 0 
2f45 : b0 03 __ BCS $2f4a ; (main.s1099 + 9)
2f47 : 4c 80 2e JMP $2e80 ; (main.l1201 + 0)
2f4a : 4c 7f 2a JMP $2a7f ; (main.s1203 + 0)
.s1023:
2f4d : a9 12 __ LDA #$12
2f4f : 8d 00 d6 STA $d600 
2f52 : a5 58 __ LDA T5 + 0 
2f54 : 85 1b __ STA ACCU + 0 
2f56 : a5 59 __ LDA T5 + 1 
2f58 : 85 1c __ STA ACCU + 1 
2f5a : a5 57 __ LDA T4 + 0 
2f5c : 20 84 45 JSR $4584 ; (mul16by8 + 0)
2f5f : 18 __ __ CLC
2f60 : a5 05 __ LDA WORK + 2 
2f62 : 69 4b __ ADC #$4b
2f64 : 85 58 __ STA T5 + 0 
2f66 : a5 06 __ LDA WORK + 3 
2f68 : 69 00 __ ADC #$00
2f6a : 85 59 __ STA T5 + 1 
2f6c : 18 __ __ CLC
2f6d : a5 58 __ LDA T5 + 0 
2f6f : 65 43 __ ADC T6 + 0 
2f71 : aa __ __ TAX
2f72 : a5 59 __ LDA T5 + 1 
2f74 : 65 44 __ ADC T6 + 1 
.l7655:
2f76 : 2c 00 d6 BIT $d600 
2f79 : 10 fb __ BPL $2f76 ; (main.l7655 + 0)
.s1035:
2f7b : 8d 01 d6 STA $d601 
2f7e : a9 13 __ LDA #$13
2f80 : 8d 00 d6 STA $d600 
.l7657:
2f83 : 2c 00 d6 BIT $d600 
2f86 : 10 fb __ BPL $2f83 ; (main.l7657 + 0)
.s1040:
2f88 : 8e 01 d6 STX $d601 
2f8b : a9 1f __ LDA #$1f
2f8d : 8d 00 d6 STA $d600 
.l7659:
2f90 : 2c 00 d6 BIT $d600 
2f93 : 10 fb __ BPL $2f90 ; (main.l7659 + 0)
.s1044:
2f95 : a9 61 __ LDA #$61
2f97 : 8d 01 d6 STA $d601 
2f9a : ad da 46 LDA $46da ; (vdc_state + 10)
2f9d : 18 __ __ CLC
2f9e : 65 58 __ ADC T5 + 0 
2fa0 : aa __ __ TAX
2fa1 : a9 12 __ LDA #$12
2fa3 : 8d 00 d6 STA $d600 
2fa6 : ad db 46 LDA $46db ; (vdc_state + 11)
2fa9 : 65 59 __ ADC T5 + 1 
.l7661:
2fab : 2c 00 d6 BIT $d600 
2fae : 10 fb __ BPL $2fab ; (main.l7661 + 0)
.s1051:
2fb0 : 8d 01 d6 STA $d601 
2fb3 : a9 13 __ LDA #$13
2fb5 : 8d 00 d6 STA $d600 
.l7663:
2fb8 : 2c 00 d6 BIT $d600 
2fbb : 10 fb __ BPL $2fb8 ; (main.l7663 + 0)
.s1056:
2fbd : 8e 01 d6 STX $d601 
2fc0 : a9 1f __ LDA #$1f
2fc2 : 8d 00 d6 STA $d600 
.l7665:
2fc5 : 2c 00 d6 BIT $d600 
2fc8 : 10 fb __ BPL $2fc5 ; (main.l7665 + 0)
.s1060:
2fca : a9 09 __ LDA #$09
2fcc : 8d 01 d6 STA $d601 
2fcf : e6 57 __ INC T4 + 0 
2fd1 : 4c 71 28 JMP $2871 ; (main.l1022 + 0)
.s983:
2fd4 : ad d3 46 LDA $46d3 ; (vdc_state + 3)
2fd7 : 85 1b __ STA ACCU + 0 
2fd9 : ad d4 46 LDA $46d4 ; (vdc_state + 4)
2fdc : 85 1c __ STA ACCU + 1 
2fde : a9 12 __ LDA #$12
2fe0 : 8d 00 d6 STA $d600 
2fe3 : a5 57 __ LDA T4 + 0 
2fe5 : 20 84 45 JSR $4584 ; (mul16by8 + 0)
2fe8 : 18 __ __ CLC
2fe9 : a5 05 __ LDA WORK + 2 
2feb : 69 04 __ ADC #$04
2fed : 85 58 __ STA T5 + 0 
2fef : a5 06 __ LDA WORK + 3 
2ff1 : 69 00 __ ADC #$00
2ff3 : 85 59 __ STA T5 + 1 
2ff5 : 18 __ __ CLC
2ff6 : a5 58 __ LDA T5 + 0 
2ff8 : 6d d8 46 ADC $46d8 ; (vdc_state + 8)
2ffb : aa __ __ TAX
2ffc : a5 59 __ LDA T5 + 1 
2ffe : 6d d9 46 ADC $46d9 ; (vdc_state + 9)
.l7642:
3001 : 2c 00 d6 BIT $d600 
3004 : 10 fb __ BPL $3001 ; (main.l7642 + 0)
.s995:
3006 : 8d 01 d6 STA $d601 
3009 : a9 13 __ LDA #$13
300b : 8d 00 d6 STA $d600 
.l7644:
300e : 2c 00 d6 BIT $d600 
3011 : 10 fb __ BPL $300e ; (main.l7644 + 0)
.s1000:
3013 : 8e 01 d6 STX $d601 
3016 : a9 1f __ LDA #$1f
3018 : 8d 00 d6 STA $d600 
.l7646:
301b : 2c 00 d6 BIT $d600 
301e : 10 fb __ BPL $301b ; (main.l7646 + 0)
.s1004:
3020 : a9 e1 __ LDA #$e1
3022 : 8d 01 d6 STA $d601 
3025 : ad da 46 LDA $46da ; (vdc_state + 10)
3028 : 18 __ __ CLC
3029 : 65 58 __ ADC T5 + 0 
302b : aa __ __ TAX
302c : a9 12 __ LDA #$12
302e : 8d 00 d6 STA $d600 
3031 : ad db 46 LDA $46db ; (vdc_state + 11)
3034 : 65 59 __ ADC T5 + 1 
.l7648:
3036 : 2c 00 d6 BIT $d600 
3039 : 10 fb __ BPL $3036 ; (main.l7648 + 0)
.s1011:
303b : 8d 01 d6 STA $d601 
303e : a9 13 __ LDA #$13
3040 : 8d 00 d6 STA $d600 
.l7650:
3043 : 2c 00 d6 BIT $d600 
3046 : 10 fb __ BPL $3043 ; (main.l7650 + 0)
.s1016:
3048 : 8e 01 d6 STX $d601 
304b : a9 1f __ LDA #$1f
304d : 8d 00 d6 STA $d600 
.l7652:
3050 : 2c 00 d6 BIT $d600 
3053 : 10 fb __ BPL $3050 ; (main.l7652 + 0)
.s1020:
3055 : a9 09 __ LDA #$09
3057 : 8d 01 d6 STA $d601 
305a : e6 57 __ INC T4 + 0 
305c : 4c 52 28 JMP $2852 ; (main.l982 + 0)
.s514:
305f : ad d3 46 LDA $46d3 ; (vdc_state + 3)
3062 : 85 1b __ STA ACCU + 0 
3064 : ad d4 46 LDA $46d4 ; (vdc_state + 4)
3067 : 85 1c __ STA ACCU + 1 
3069 : ad d7 46 LDA $46d7 ; (vdc_state + 7)
306c : 85 57 __ STA T4 + 0 
306e : a9 12 __ LDA #$12
3070 : 8d 00 d6 STA $d600 
3073 : a6 55 __ LDX T3 + 0 
3075 : ca __ __ DEX
3076 : 86 47 __ STX T8 + 0 
3078 : a5 54 __ LDA T2 + 0 
307a : 20 84 45 JSR $4584 ; (mul16by8 + 0)
307d : 18 __ __ CLC
307e : a5 05 __ LDA WORK + 2 
3080 : 6d d8 46 ADC $46d8 ; (vdc_state + 8)
3083 : aa __ __ TAX
3084 : a5 06 __ LDA WORK + 3 
3086 : 6d d9 46 ADC $46d9 ; (vdc_state + 9)
.l7499:
3089 : 2c 00 d6 BIT $d600 
308c : 10 fb __ BPL $3089 ; (main.l7499 + 0)
.s526:
308e : 8d 01 d6 STA $d601 
3091 : a9 13 __ LDA #$13
3093 : 8d 00 d6 STA $d600 
.l7501:
3096 : 2c 00 d6 BIT $d600 
3099 : 10 fb __ BPL $3096 ; (main.l7501 + 0)
.s531:
309b : 8e 01 d6 STX $d601 
309e : a9 1f __ LDA #$1f
30a0 : 8d 00 d6 STA $d600 
.l7503:
30a3 : 2c 00 d6 BIT $d600 
30a6 : 10 fb __ BPL $30a3 ; (main.l7503 + 0)
.s535:
30a8 : a9 20 __ LDA #$20
30aa : 8d 01 d6 STA $d601 
30ad : a9 18 __ LDA #$18
30af : 8d 00 d6 STA $d600 
.l7505:
30b2 : 2c 00 d6 BIT $d600 
30b5 : 10 fb __ BPL $30b2 ; (main.l7505 + 0)
.s541:
30b7 : ad 01 d6 LDA $d601 
30ba : 29 7f __ AND #$7f
30bc : aa __ __ TAX
30bd : a9 18 __ LDA #$18
30bf : 8d 00 d6 STA $d600 
.l7507:
30c2 : 2c 00 d6 BIT $d600 
30c5 : 10 fb __ BPL $30c2 ; (main.l7507 + 0)
.s547:
30c7 : 8e 01 d6 STX $d601 
30ca : a9 1e __ LDA #$1e
30cc : 8d 00 d6 STA $d600 
.l7509:
30cf : 2c 00 d6 BIT $d600 
30d2 : 10 fb __ BPL $30cf ; (main.l7509 + 0)
.s552:
30d4 : a5 47 __ LDA T8 + 0 
30d6 : 8d 01 d6 STA $d601 
30d9 : ad da 46 LDA $46da ; (vdc_state + 10)
30dc : 18 __ __ CLC
30dd : 65 05 __ ADC WORK + 2 
30df : aa __ __ TAX
30e0 : a9 12 __ LDA #$12
30e2 : 8d 00 d6 STA $d600 
30e5 : ad db 46 LDA $46db ; (vdc_state + 11)
30e8 : 65 06 __ ADC WORK + 3 
.l7511:
30ea : 2c 00 d6 BIT $d600 
30ed : 10 fb __ BPL $30ea ; (main.l7511 + 0)
.s559:
30ef : 8d 01 d6 STA $d601 
30f2 : a9 13 __ LDA #$13
30f4 : 8d 00 d6 STA $d600 
.l7513:
30f7 : 2c 00 d6 BIT $d600 
30fa : 10 fb __ BPL $30f7 ; (main.l7513 + 0)
.s564:
30fc : 8e 01 d6 STX $d601 
30ff : a9 1f __ LDA #$1f
3101 : 8d 00 d6 STA $d600 
.l7515:
3104 : 2c 00 d6 BIT $d600 
3107 : 10 fb __ BPL $3104 ; (main.l7515 + 0)
.s568:
3109 : a5 57 __ LDA T4 + 0 
310b : 8d 01 d6 STA $d601 
310e : a9 18 __ LDA #$18
3110 : 8d 00 d6 STA $d600 
.l7517:
3113 : 2c 00 d6 BIT $d600 
3116 : 10 fb __ BPL $3113 ; (main.l7517 + 0)
.s574:
3118 : ad 01 d6 LDA $d601 
311b : 29 7f __ AND #$7f
311d : aa __ __ TAX
311e : a9 18 __ LDA #$18
3120 : 8d 00 d6 STA $d600 
.l7519:
3123 : 2c 00 d6 BIT $d600 
3126 : 10 fb __ BPL $3123 ; (main.l7519 + 0)
.s580:
3128 : 8e 01 d6 STX $d601 
312b : a9 1e __ LDA #$1e
312d : 8d 00 d6 STA $d600 
.l7521:
3130 : 2c 00 d6 BIT $d600 
3133 : 10 fb __ BPL $3130 ; (main.l7521 + 0)
.s585:
3135 : a5 47 __ LDA T8 + 0 
3137 : 8d 01 d6 STA $d601 
313a : e6 54 __ INC T2 + 0 
313c : 4c 50 23 JMP $2350 ; (main.l513 + 0)
.s439:
313f : ad d3 46 LDA $46d3 ; (vdc_state + 3)
3142 : 85 1b __ STA ACCU + 0 
3144 : ad d4 46 LDA $46d4 ; (vdc_state + 4)
3147 : 85 1c __ STA ACCU + 1 
3149 : ad d7 46 LDA $46d7 ; (vdc_state + 7)
314c : 85 57 __ STA T4 + 0 
314e : a9 12 __ LDA #$12
3150 : 8d 00 d6 STA $d600 
3153 : a6 55 __ LDX T3 + 0 
3155 : ca __ __ DEX
3156 : 86 47 __ STX T8 + 0 
3158 : a5 54 __ LDA T2 + 0 
315a : 20 84 45 JSR $4584 ; (mul16by8 + 0)
315d : 18 __ __ CLC
315e : a5 05 __ LDA WORK + 2 
3160 : 6d d8 46 ADC $46d8 ; (vdc_state + 8)
3163 : aa __ __ TAX
3164 : a5 06 __ LDA WORK + 3 
3166 : 6d d9 46 ADC $46d9 ; (vdc_state + 9)
.l7475:
3169 : 2c 00 d6 BIT $d600 
316c : 10 fb __ BPL $3169 ; (main.l7475 + 0)
.s451:
316e : 8d 01 d6 STA $d601 
3171 : a9 13 __ LDA #$13
3173 : 8d 00 d6 STA $d600 
.l7477:
3176 : 2c 00 d6 BIT $d600 
3179 : 10 fb __ BPL $3176 ; (main.l7477 + 0)
.s456:
317b : 8e 01 d6 STX $d601 
317e : a9 1f __ LDA #$1f
3180 : 8d 00 d6 STA $d600 
.l7479:
3183 : 2c 00 d6 BIT $d600 
3186 : 10 fb __ BPL $3183 ; (main.l7479 + 0)
.s460:
3188 : a9 20 __ LDA #$20
318a : 8d 01 d6 STA $d601 
318d : a9 18 __ LDA #$18
318f : 8d 00 d6 STA $d600 
.l7481:
3192 : 2c 00 d6 BIT $d600 
3195 : 10 fb __ BPL $3192 ; (main.l7481 + 0)
.s466:
3197 : ad 01 d6 LDA $d601 
319a : 29 7f __ AND #$7f
319c : aa __ __ TAX
319d : a9 18 __ LDA #$18
319f : 8d 00 d6 STA $d600 
.l7483:
31a2 : 2c 00 d6 BIT $d600 
31a5 : 10 fb __ BPL $31a2 ; (main.l7483 + 0)
.s472:
31a7 : 8e 01 d6 STX $d601 
31aa : a9 1e __ LDA #$1e
31ac : 8d 00 d6 STA $d600 
.l7485:
31af : 2c 00 d6 BIT $d600 
31b2 : 10 fb __ BPL $31af ; (main.l7485 + 0)
.s477:
31b4 : a5 47 __ LDA T8 + 0 
31b6 : 8d 01 d6 STA $d601 
31b9 : ad da 46 LDA $46da ; (vdc_state + 10)
31bc : 18 __ __ CLC
31bd : 65 05 __ ADC WORK + 2 
31bf : aa __ __ TAX
31c0 : a9 12 __ LDA #$12
31c2 : 8d 00 d6 STA $d600 
31c5 : ad db 46 LDA $46db ; (vdc_state + 11)
31c8 : 65 06 __ ADC WORK + 3 
.l7487:
31ca : 2c 00 d6 BIT $d600 
31cd : 10 fb __ BPL $31ca ; (main.l7487 + 0)
.s484:
31cf : 8d 01 d6 STA $d601 
31d2 : a9 13 __ LDA #$13
31d4 : 8d 00 d6 STA $d600 
.l7489:
31d7 : 2c 00 d6 BIT $d600 
31da : 10 fb __ BPL $31d7 ; (main.l7489 + 0)
.s489:
31dc : 8e 01 d6 STX $d601 
31df : a9 1f __ LDA #$1f
31e1 : 8d 00 d6 STA $d600 
.l7491:
31e4 : 2c 00 d6 BIT $d600 
31e7 : 10 fb __ BPL $31e4 ; (main.l7491 + 0)
.s493:
31e9 : a5 57 __ LDA T4 + 0 
31eb : 8d 01 d6 STA $d601 
31ee : a9 18 __ LDA #$18
31f0 : 8d 00 d6 STA $d600 
.l7493:
31f3 : 2c 00 d6 BIT $d600 
31f6 : 10 fb __ BPL $31f3 ; (main.l7493 + 0)
.s499:
31f8 : ad 01 d6 LDA $d601 
31fb : 29 7f __ AND #$7f
31fd : aa __ __ TAX
31fe : a9 18 __ LDA #$18
3200 : 8d 00 d6 STA $d600 
.l7495:
3203 : 2c 00 d6 BIT $d600 
3206 : 10 fb __ BPL $3203 ; (main.l7495 + 0)
.s505:
3208 : 8e 01 d6 STX $d601 
320b : a9 1e __ LDA #$1e
320d : 8d 00 d6 STA $d600 
.l7497:
3210 : 2c 00 d6 BIT $d600 
3213 : 10 fb __ BPL $3210 ; (main.l7497 + 0)
.s510:
3215 : a5 47 __ LDA T8 + 0 
3217 : 8d 01 d6 STA $d601 
321a : e6 54 __ INC T2 + 0 
321c : 4c 16 23 JMP $2316 ; (main.l438 + 0)
.s399:
321f : a9 00 __ LDA #$00
3221 : 85 55 __ STA T3 + 0 
3223 : 85 56 __ STA T3 + 1 
.l403:
3225 : 20 e4 40 JSR $40e4 ; (krnio_chrin.s0 + 0)
3228 : a5 1b __ LDA ACCU + 0 
322a : 85 58 __ STA T5 + 0 
322c : 20 ee 40 JSR $40ee ; (krnio_status.s0 + 0)
322f : 8d e7 46 STA $46e7 ; (krnio_pstatus + 1)
3232 : 09 00 __ ORA #$00
3234 : f0 07 __ BEQ $323d ; (main.s407 + 0)
.s408:
3236 : ad e7 46 LDA $46e7 ; (krnio_pstatus + 1)
3239 : c9 40 __ CMP #$40
323b : d0 17 __ BNE $3254 ; (main.s404 + 0)
.s407:
323d : a5 58 __ LDA T5 + 0 
323f : a6 55 __ LDX T3 + 0 
3241 : e8 __ __ INX
3242 : 86 55 __ STX T3 + 0 
3244 : 9d 5a bf STA $bf5a,x ; (filename + 14)
3247 : a9 00 __ LDA #$00
3249 : 85 56 __ STA T3 + 1 
324b : ad e7 46 LDA $46e7 ; (krnio_pstatus + 1)
324e : d0 04 __ BNE $3254 ; (main.s404 + 0)
.s402:
3250 : e0 51 __ CPX #$51
3252 : 90 d1 __ BCC $3225 ; (main.l403 + 0)
.s404:
3254 : 20 61 40 JSR $4061 ; (krnio_clrchn.s0 + 0)
3257 : 4c 61 20 JMP $2061 ; (main.s394 + 0)
.s100:
325a : ad d3 46 LDA $46d3 ; (vdc_state + 3)
325d : 85 1b __ STA ACCU + 0 
325f : ad d4 46 LDA $46d4 ; (vdc_state + 4)
3262 : 85 1c __ STA ACCU + 1 
3264 : ad d7 46 LDA $46d7 ; (vdc_state + 7)
3267 : 85 57 __ STA T4 + 0 
3269 : a9 12 __ LDA #$12
326b : 8d 00 d6 STA $d600 
326e : a6 55 __ LDX T3 + 0 
3270 : ca __ __ DEX
3271 : 86 47 __ STX T8 + 0 
3273 : a5 54 __ LDA T2 + 0 
3275 : 20 84 45 JSR $4584 ; (mul16by8 + 0)
3278 : 18 __ __ CLC
3279 : a5 05 __ LDA WORK + 2 
327b : 6d d8 46 ADC $46d8 ; (vdc_state + 8)
327e : aa __ __ TAX
327f : a5 06 __ LDA WORK + 3 
3281 : 6d d9 46 ADC $46d9 ; (vdc_state + 9)
.l7433:
3284 : 2c 00 d6 BIT $d600 
3287 : 10 fb __ BPL $3284 ; (main.l7433 + 0)
.s112:
3289 : 8d 01 d6 STA $d601 
328c : a9 13 __ LDA #$13
328e : 8d 00 d6 STA $d600 
.l7435:
3291 : 2c 00 d6 BIT $d600 
3294 : 10 fb __ BPL $3291 ; (main.l7435 + 0)
.s117:
3296 : 8e 01 d6 STX $d601 
3299 : a9 1f __ LDA #$1f
329b : 8d 00 d6 STA $d600 
.l7437:
329e : 2c 00 d6 BIT $d600 
32a1 : 10 fb __ BPL $329e ; (main.l7437 + 0)
.s121:
32a3 : a9 20 __ LDA #$20
32a5 : 8d 01 d6 STA $d601 
32a8 : a9 18 __ LDA #$18
32aa : 8d 00 d6 STA $d600 
.l7439:
32ad : 2c 00 d6 BIT $d600 
32b0 : 10 fb __ BPL $32ad ; (main.l7439 + 0)
.s127:
32b2 : ad 01 d6 LDA $d601 
32b5 : 29 7f __ AND #$7f
32b7 : aa __ __ TAX
32b8 : a9 18 __ LDA #$18
32ba : 8d 00 d6 STA $d600 
.l7441:
32bd : 2c 00 d6 BIT $d600 
32c0 : 10 fb __ BPL $32bd ; (main.l7441 + 0)
.s133:
32c2 : 8e 01 d6 STX $d601 
32c5 : a9 1e __ LDA #$1e
32c7 : 8d 00 d6 STA $d600 
.l7443:
32ca : 2c 00 d6 BIT $d600 
32cd : 10 fb __ BPL $32ca ; (main.l7443 + 0)
.s138:
32cf : a5 47 __ LDA T8 + 0 
32d1 : 8d 01 d6 STA $d601 
32d4 : ad da 46 LDA $46da ; (vdc_state + 10)
32d7 : 18 __ __ CLC
32d8 : 65 05 __ ADC WORK + 2 
32da : aa __ __ TAX
32db : a9 12 __ LDA #$12
32dd : 8d 00 d6 STA $d600 
32e0 : ad db 46 LDA $46db ; (vdc_state + 11)
32e3 : 65 06 __ ADC WORK + 3 
.l7445:
32e5 : 2c 00 d6 BIT $d600 
32e8 : 10 fb __ BPL $32e5 ; (main.l7445 + 0)
.s145:
32ea : 8d 01 d6 STA $d601 
32ed : a9 13 __ LDA #$13
32ef : 8d 00 d6 STA $d600 
.l7447:
32f2 : 2c 00 d6 BIT $d600 
32f5 : 10 fb __ BPL $32f2 ; (main.l7447 + 0)
.s150:
32f7 : 8e 01 d6 STX $d601 
32fa : a9 1f __ LDA #$1f
32fc : 8d 00 d6 STA $d600 
.l7449:
32ff : 2c 00 d6 BIT $d600 
3302 : 10 fb __ BPL $32ff ; (main.l7449 + 0)
.s154:
3304 : a5 57 __ LDA T4 + 0 
3306 : 8d 01 d6 STA $d601 
3309 : a9 18 __ LDA #$18
330b : 8d 00 d6 STA $d600 
.l7451:
330e : 2c 00 d6 BIT $d600 
3311 : 10 fb __ BPL $330e ; (main.l7451 + 0)
.s160:
3313 : ad 01 d6 LDA $d601 
3316 : 29 7f __ AND #$7f
3318 : aa __ __ TAX
3319 : a9 18 __ LDA #$18
331b : 8d 00 d6 STA $d600 
.l7453:
331e : 2c 00 d6 BIT $d600 
3321 : 10 fb __ BPL $331e ; (main.l7453 + 0)
.s166:
3323 : 8e 01 d6 STX $d601 
3326 : a9 1e __ LDA #$1e
3328 : 8d 00 d6 STA $d600 
.l7455:
332b : 2c 00 d6 BIT $d600 
332e : 10 fb __ BPL $332b ; (main.l7455 + 0)
.s171:
3330 : a5 47 __ LDA T8 + 0 
3332 : 8d 01 d6 STA $d601 
3335 : e6 54 __ INC T2 + 0 
3337 : 4c b6 1d JMP $1db6 ; (main.l99 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
333a : a2 03 __ LDX #$03
333c : b5 53 __ LDA T8 + 0,x 
333e : 9d b2 bf STA $bfb2,x ; (printf@stack + 0)
3341 : ca __ __ DEX
3342 : 10 f8 __ BPL $333c ; (printf.s1000 + 2)
.s0:
3344 : 18 __ __ CLC
3345 : a5 23 __ LDA SP + 0 
3347 : 69 04 __ ADC #$04
3349 : 85 47 __ STA T0 + 0 
334b : a5 24 __ LDA SP + 1 
334d : 69 00 __ ADC #$00
334f : 85 48 __ STA T0 + 1 
3351 : a9 00 __ LDA #$00
3353 : 85 49 __ STA T2 + 0 
3355 : a0 02 __ LDY #$02
3357 : b1 23 __ LDA (SP + 0),y 
3359 : 85 4a __ STA T3 + 0 
335b : c8 __ __ INY
335c : b1 23 __ LDA (SP + 0),y 
335e : 85 4b __ STA T3 + 1 
.l2:
3360 : a0 00 __ LDY #$00
3362 : b1 4a __ LDA (T3 + 0),y 
3364 : d0 1e __ BNE $3384 ; (printf.s3 + 0)
.s4:
3366 : a6 49 __ LDX T2 + 0 
3368 : 9d be bf STA $bfbe,x ; (buff + 0)
336b : 8a __ __ TXA
336c : f0 0b __ BEQ $3379 ; (printf.s1001 + 0)
.s117:
336e : a9 be __ LDA #$be
3370 : 85 0d __ STA P0 ; (fmt + 0)
3372 : a9 bf __ LDA #$bf
3374 : 85 0e __ STA P1 ; (fmt + 1)
3376 : 20 8a 36 JSR $368a ; (puts.s0 + 0)
.s1001:
3379 : a2 03 __ LDX #$03
337b : bd b2 bf LDA $bfb2,x ; (printf@stack + 0)
337e : 95 53 __ STA T8 + 0,x 
3380 : ca __ __ DEX
3381 : 10 f8 __ BPL $337b ; (printf.s1001 + 2)
3383 : 60 __ __ RTS
.s3:
3384 : c9 25 __ CMP #$25
3386 : f0 28 __ BEQ $33b0 ; (printf.s5 + 0)
.s6:
3388 : a6 49 __ LDX T2 + 0 
338a : 9d be bf STA $bfbe,x ; (buff + 0)
338d : e6 4a __ INC T3 + 0 
338f : d0 02 __ BNE $3393 ; (printf.s1098 + 0)
.s1097:
3391 : e6 4b __ INC T3 + 1 
.s1098:
3393 : e8 __ __ INX
3394 : 86 49 __ STX T2 + 0 
3396 : e0 28 __ CPX #$28
3398 : 90 c6 __ BCC $3360 ; (printf.l2 + 0)
.s111:
339a : a9 be __ LDA #$be
339c : 85 0d __ STA P0 ; (fmt + 0)
339e : a9 bf __ LDA #$bf
33a0 : 85 0e __ STA P1 ; (fmt + 1)
33a2 : 98 __ __ TYA
33a3 : 9d be bf STA $bfbe,x ; (buff + 0)
33a6 : 20 8a 36 JSR $368a ; (puts.s0 + 0)
33a9 : a9 00 __ LDA #$00
.s1068:
33ab : 85 49 __ STA T2 + 0 
33ad : 4c 60 33 JMP $3360 ; (printf.l2 + 0)
.s5:
33b0 : a5 49 __ LDA T2 + 0 
33b2 : f0 15 __ BEQ $33c9 ; (printf.s10 + 0)
.s8:
33b4 : a9 be __ LDA #$be
33b6 : 85 0d __ STA P0 ; (fmt + 0)
33b8 : a9 bf __ LDA #$bf
33ba : 85 0e __ STA P1 ; (fmt + 1)
33bc : 98 __ __ TYA
33bd : a6 49 __ LDX T2 + 0 
33bf : 9d be bf STA $bfbe,x ; (buff + 0)
33c2 : 20 8a 36 JSR $368a ; (puts.s0 + 0)
33c5 : a9 00 __ LDA #$00
33c7 : 85 49 __ STA T2 + 0 
.s10:
33c9 : a9 0a __ LDA #$0a
33cb : 8d b9 bf STA $bfb9 ; (si + 3)
33ce : a9 00 __ LDA #$00
33d0 : 8d ba bf STA $bfba ; (si + 4)
33d3 : 8d bb bf STA $bfbb ; (si + 5)
33d6 : 8d bc bf STA $bfbc ; (si + 6)
33d9 : 8d bd bf STA $bfbd ; (si + 7)
33dc : a0 01 __ LDY #$01
33de : b1 4a __ LDA (T3 + 0),y 
33e0 : aa __ __ TAX
33e1 : a9 20 __ LDA #$20
33e3 : 8d b6 bf STA $bfb6 ; (si + 0)
33e6 : a9 00 __ LDA #$00
33e8 : 8d b7 bf STA $bfb7 ; (si + 1)
33eb : a9 ff __ LDA #$ff
33ed : 8d b8 bf STA $bfb8 ; (si + 2)
33f0 : 18 __ __ CLC
33f1 : a5 4a __ LDA T3 + 0 
33f3 : 69 02 __ ADC #$02
.l15:
33f5 : 85 4a __ STA T3 + 0 
33f7 : 90 02 __ BCC $33fb ; (printf.s1080 + 0)
.s1079:
33f9 : e6 4b __ INC T3 + 1 
.s1080:
33fb : 8a __ __ TXA
33fc : e0 2b __ CPX #$2b
33fe : d0 08 __ BNE $3408 ; (printf.s18 + 0)
.s17:
3400 : a9 01 __ LDA #$01
3402 : 8d bb bf STA $bfbb ; (si + 5)
3405 : 4c 7d 36 JMP $367d ; (printf.s246 + 0)
.s18:
3408 : c9 30 __ CMP #$30
340a : d0 06 __ BNE $3412 ; (printf.s21 + 0)
.s20:
340c : 8d b6 bf STA $bfb6 ; (si + 0)
340f : 4c 7d 36 JMP $367d ; (printf.s246 + 0)
.s21:
3412 : e0 23 __ CPX #$23
3414 : d0 08 __ BNE $341e ; (printf.s24 + 0)
.s23:
3416 : a9 01 __ LDA #$01
3418 : 8d bd bf STA $bfbd ; (si + 7)
341b : 4c 7d 36 JMP $367d ; (printf.s246 + 0)
.s24:
341e : e0 2d __ CPX #$2d
3420 : d0 08 __ BNE $342a ; (printf.s16 + 0)
.s26:
3422 : a9 01 __ LDA #$01
3424 : 8d bc bf STA $bfbc ; (si + 6)
3427 : 4c 7d 36 JMP $367d ; (printf.s246 + 0)
.s16:
342a : 85 4c __ STA T4 + 0 
342c : e0 30 __ CPX #$30
342e : 90 53 __ BCC $3483 ; (printf.s32 + 0)
.s33:
3430 : e0 3a __ CPX #$3a
3432 : b0 4f __ BCS $3483 ; (printf.s32 + 0)
.s30:
3434 : a9 00 __ LDA #$00
3436 : 85 4d __ STA T6 + 0 
3438 : 85 4e __ STA T6 + 1 
343a : e0 3a __ CPX #$3a
343c : b0 40 __ BCS $347e ; (printf.s36 + 0)
.l35:
343e : a5 4d __ LDA T6 + 0 
3440 : 0a __ __ ASL
3441 : 85 1b __ STA ACCU + 0 
3443 : a5 4e __ LDA T6 + 1 
3445 : 2a __ __ ROL
3446 : 06 1b __ ASL ACCU + 0 
3448 : 2a __ __ ROL
3449 : aa __ __ TAX
344a : 18 __ __ CLC
344b : a5 1b __ LDA ACCU + 0 
344d : 65 4d __ ADC T6 + 0 
344f : 85 4d __ STA T6 + 0 
3451 : 8a __ __ TXA
3452 : 65 4e __ ADC T6 + 1 
3454 : 06 4d __ ASL T6 + 0 
3456 : 2a __ __ ROL
3457 : aa __ __ TAX
3458 : 18 __ __ CLC
3459 : a5 4d __ LDA T6 + 0 
345b : 65 4c __ ADC T4 + 0 
345d : 90 01 __ BCC $3460 ; (printf.s1094 + 0)
.s1093:
345f : e8 __ __ INX
.s1094:
3460 : 38 __ __ SEC
3461 : e9 30 __ SBC #$30
3463 : 85 4d __ STA T6 + 0 
3465 : 8a __ __ TXA
3466 : e9 00 __ SBC #$00
3468 : 85 4e __ STA T6 + 1 
346a : a0 00 __ LDY #$00
346c : b1 4a __ LDA (T3 + 0),y 
346e : 85 4c __ STA T4 + 0 
3470 : e6 4a __ INC T3 + 0 
3472 : d0 02 __ BNE $3476 ; (printf.s1096 + 0)
.s1095:
3474 : e6 4b __ INC T3 + 1 
.s1096:
3476 : c9 30 __ CMP #$30
3478 : 90 04 __ BCC $347e ; (printf.s36 + 0)
.s37:
347a : c9 3a __ CMP #$3a
347c : 90 c0 __ BCC $343e ; (printf.l35 + 0)
.s36:
347e : a5 4d __ LDA T6 + 0 
3480 : 8d b7 bf STA $bfb7 ; (si + 1)
.s32:
3483 : a5 4c __ LDA T4 + 0 
3485 : c9 2e __ CMP #$2e
3487 : d0 51 __ BNE $34da ; (printf.s40 + 0)
.s38:
3489 : a9 00 __ LDA #$00
348b : 85 4d __ STA T6 + 0 
.l231:
348d : 85 4e __ STA T6 + 1 
348f : a0 00 __ LDY #$00
3491 : b1 4a __ LDA (T3 + 0),y 
3493 : 85 4c __ STA T4 + 0 
3495 : e6 4a __ INC T3 + 0 
3497 : d0 02 __ BNE $349b ; (printf.s1082 + 0)
.s1081:
3499 : e6 4b __ INC T3 + 1 
.s1082:
349b : c9 30 __ CMP #$30
349d : 90 04 __ BCC $34a3 ; (printf.s43 + 0)
.s44:
349f : c9 3a __ CMP #$3a
34a1 : 90 0a __ BCC $34ad ; (printf.s42 + 0)
.s43:
34a3 : a5 4d __ LDA T6 + 0 
34a5 : 8d b8 bf STA $bfb8 ; (si + 2)
34a8 : a5 4c __ LDA T4 + 0 
34aa : 4c da 34 JMP $34da ; (printf.s40 + 0)
.s42:
34ad : a5 4d __ LDA T6 + 0 
34af : 0a __ __ ASL
34b0 : 85 1b __ STA ACCU + 0 
34b2 : a5 4e __ LDA T6 + 1 
34b4 : 2a __ __ ROL
34b5 : 06 1b __ ASL ACCU + 0 
34b7 : 2a __ __ ROL
34b8 : aa __ __ TAX
34b9 : 18 __ __ CLC
34ba : a5 1b __ LDA ACCU + 0 
34bc : 65 4d __ ADC T6 + 0 
34be : 85 4d __ STA T6 + 0 
34c0 : 8a __ __ TXA
34c1 : 65 4e __ ADC T6 + 1 
34c3 : 06 4d __ ASL T6 + 0 
34c5 : 2a __ __ ROL
34c6 : aa __ __ TAX
34c7 : 18 __ __ CLC
34c8 : a5 4d __ LDA T6 + 0 
34ca : 65 4c __ ADC T4 + 0 
34cc : 90 01 __ BCC $34cf ; (printf.s1092 + 0)
.s1091:
34ce : e8 __ __ INX
.s1092:
34cf : 38 __ __ SEC
34d0 : e9 30 __ SBC #$30
34d2 : 85 4d __ STA T6 + 0 
34d4 : 8a __ __ TXA
34d5 : e9 00 __ SBC #$00
34d7 : 4c 8d 34 JMP $348d ; (printf.l231 + 0)
.s40:
34da : c9 64 __ CMP #$64
34dc : f0 04 __ BEQ $34e2 ; (printf.s45 + 0)
.s48:
34de : c9 44 __ CMP #$44
34e0 : d0 05 __ BNE $34e7 ; (printf.s46 + 0)
.s45:
34e2 : a9 01 __ LDA #$01
34e4 : 4c 56 36 JMP $3656 ; (printf.s247 + 0)
.s46:
34e7 : c9 75 __ CMP #$75
34e9 : d0 03 __ BNE $34ee ; (printf.s52 + 0)
34eb : 4c 54 36 JMP $3654 ; (printf.s269 + 0)
.s52:
34ee : c9 55 __ CMP #$55
34f0 : d0 03 __ BNE $34f5 ; (printf.s50 + 0)
34f2 : 4c 54 36 JMP $3654 ; (printf.s269 + 0)
.s50:
34f5 : c9 78 __ CMP #$78
34f7 : f0 04 __ BEQ $34fd ; (printf.s53 + 0)
.s56:
34f9 : c9 58 __ CMP #$58
34fb : d0 0d __ BNE $350a ; (printf.s54 + 0)
.s53:
34fd : a9 10 __ LDA #$10
34ff : 8d b9 bf STA $bfb9 ; (si + 3)
3502 : a9 00 __ LDA #$00
3504 : 8d ba bf STA $bfba ; (si + 4)
3507 : 4c 54 36 JMP $3654 ; (printf.s269 + 0)
.s54:
350a : c9 6c __ CMP #$6c
350c : d0 03 __ BNE $3511 ; (printf.s60 + 0)
350e : 4c e6 35 JMP $35e6 ; (printf.s57 + 0)
.s60:
3511 : c9 4c __ CMP #$4c
3513 : d0 03 __ BNE $3518 ; (printf.s58 + 0)
3515 : 4c e6 35 JMP $35e6 ; (printf.s57 + 0)
.s58:
3518 : c9 73 __ CMP #$73
351a : f0 39 __ BEQ $3555 ; (printf.s73 + 0)
.s76:
351c : c9 53 __ CMP #$53
351e : f0 35 __ BEQ $3555 ; (printf.s73 + 0)
.s74:
3520 : c9 63 __ CMP #$63
3522 : f0 15 __ BEQ $3539 ; (printf.s104 + 0)
.s107:
3524 : c9 43 __ CMP #$43
3526 : f0 11 __ BEQ $3539 ; (printf.s104 + 0)
.s105:
3528 : 09 00 __ ORA #$00
352a : d0 03 __ BNE $352f ; (printf.s108 + 0)
352c : 4c 60 33 JMP $3360 ; (printf.l2 + 0)
.s108:
352f : a6 49 __ LDX T2 + 0 
3531 : 9d be bf STA $bfbe,x ; (buff + 0)
3534 : e6 49 __ INC T2 + 0 
3536 : 4c 60 33 JMP $3360 ; (printf.l2 + 0)
.s104:
3539 : a0 00 __ LDY #$00
353b : b1 47 __ LDA (T0 + 0),y 
353d : a6 49 __ LDX T2 + 0 
353f : 9d be bf STA $bfbe,x ; (buff + 0)
3542 : e6 49 __ INC T2 + 0 
.s244:
3544 : 18 __ __ CLC
3545 : a5 47 __ LDA T0 + 0 
3547 : 69 02 __ ADC #$02
3549 : 85 47 __ STA T0 + 0 
354b : b0 03 __ BCS $3550 ; (printf.s1083 + 0)
354d : 4c 60 33 JMP $3360 ; (printf.l2 + 0)
.s1083:
3550 : e6 48 __ INC T0 + 1 
3552 : 4c 60 33 JMP $3360 ; (printf.l2 + 0)
.s73:
3555 : a0 00 __ LDY #$00
3557 : 84 4c __ STY T4 + 0 
3559 : b1 47 __ LDA (T0 + 0),y 
355b : 85 4d __ STA T6 + 0 
355d : c8 __ __ INY
355e : b1 47 __ LDA (T0 + 0),y 
3560 : 85 4e __ STA T6 + 1 
3562 : 18 __ __ CLC
3563 : a5 47 __ LDA T0 + 0 
3565 : 69 02 __ ADC #$02
3567 : 85 47 __ STA T0 + 0 
3569 : 90 02 __ BCC $356d ; (printf.s1090 + 0)
.s1089:
356b : e6 48 __ INC T0 + 1 
.s1090:
356d : ad b7 bf LDA $bfb7 ; (si + 1)
3570 : f0 0d __ BEQ $357f ; (printf.s79 + 0)
.s1071:
3572 : a0 00 __ LDY #$00
3574 : b1 4d __ LDA (T6 + 0),y 
3576 : f0 05 __ BEQ $357d ; (printf.s1072 + 0)
.l81:
3578 : c8 __ __ INY
3579 : b1 4d __ LDA (T6 + 0),y 
357b : d0 fb __ BNE $3578 ; (printf.l81 + 0)
.s1072:
357d : 84 4c __ STY T4 + 0 
.s79:
357f : ad bc bf LDA $bfbc ; (si + 6)
3582 : d0 1a __ BNE $359e ; (printf.s85 + 0)
.s1075:
3584 : a4 4c __ LDY T4 + 0 
3586 : cc b7 bf CPY $bfb7 ; (si + 1)
3589 : a6 49 __ LDX T2 + 0 
358b : b0 0d __ BCS $359a ; (printf.s1076 + 0)
.l87:
358d : ad b6 bf LDA $bfb6 ; (si + 0)
3590 : 9d be bf STA $bfbe,x ; (buff + 0)
3593 : c8 __ __ INY
3594 : cc b7 bf CPY $bfb7 ; (si + 1)
3597 : e8 __ __ INX
3598 : 90 f3 __ BCC $358d ; (printf.l87 + 0)
.s1076:
359a : 86 49 __ STX T2 + 0 
359c : 84 4c __ STY T4 + 0 
.s85:
359e : a5 49 __ LDA T2 + 0 
35a0 : f0 16 __ BEQ $35b8 ; (printf.s238 + 0)
.s92:
35a2 : a9 be __ LDA #$be
35a4 : 85 0d __ STA P0 ; (fmt + 0)
35a6 : a9 bf __ LDA #$bf
35a8 : 85 0e __ STA P1 ; (fmt + 1)
35aa : a9 00 __ LDA #$00
35ac : a6 49 __ LDX T2 + 0 
35ae : 9d be bf STA $bfbe,x ; (buff + 0)
35b1 : 20 8a 36 JSR $368a ; (puts.s0 + 0)
35b4 : a9 00 __ LDA #$00
35b6 : 85 49 __ STA T2 + 0 
.s238:
35b8 : a5 4d __ LDA T6 + 0 
35ba : 85 0d __ STA P0 ; (fmt + 0)
35bc : a5 4e __ LDA T6 + 1 
35be : 85 0e __ STA P1 ; (fmt + 1)
35c0 : 20 8a 36 JSR $368a ; (puts.s0 + 0)
35c3 : ad bc bf LDA $bfbc ; (si + 6)
35c6 : d0 03 __ BNE $35cb ; (printf.s1073 + 0)
35c8 : 4c 60 33 JMP $3360 ; (printf.l2 + 0)
.s1073:
35cb : a4 4c __ LDY T4 + 0 
35cd : cc b7 bf CPY $bfb7 ; (si + 1)
35d0 : a2 00 __ LDX #$00
35d2 : b0 0d __ BCS $35e1 ; (printf.s1074 + 0)
.l102:
35d4 : ad b6 bf LDA $bfb6 ; (si + 0)
35d7 : 9d be bf STA $bfbe,x ; (buff + 0)
35da : c8 __ __ INY
35db : cc b7 bf CPY $bfb7 ; (si + 1)
35de : e8 __ __ INX
35df : 90 f3 __ BCC $35d4 ; (printf.l102 + 0)
.s1074:
35e1 : 86 49 __ STX T2 + 0 
35e3 : 4c 60 33 JMP $3360 ; (printf.l2 + 0)
.s57:
35e6 : a0 00 __ LDY #$00
35e8 : b1 47 __ LDA (T0 + 0),y 
35ea : 85 53 __ STA T8 + 0 
35ec : c8 __ __ INY
35ed : b1 47 __ LDA (T0 + 0),y 
35ef : 85 54 __ STA T8 + 1 
35f1 : c8 __ __ INY
35f2 : b1 47 __ LDA (T0 + 0),y 
35f4 : 85 55 __ STA T8 + 2 
35f6 : c8 __ __ INY
35f7 : b1 47 __ LDA (T0 + 0),y 
35f9 : 85 56 __ STA T8 + 3 
35fb : 18 __ __ CLC
35fc : a5 47 __ LDA T0 + 0 
35fe : 69 04 __ ADC #$04
3600 : 85 47 __ STA T0 + 0 
3602 : 90 02 __ BCC $3606 ; (printf.s1086 + 0)
.s1085:
3604 : e6 48 __ INC T0 + 1 
.s1086:
3606 : a0 00 __ LDY #$00
3608 : b1 4a __ LDA (T3 + 0),y 
360a : aa __ __ TAX
360b : e6 4a __ INC T3 + 0 
360d : d0 02 __ BNE $3611 ; (printf.s1088 + 0)
.s1087:
360f : e6 4b __ INC T3 + 1 
.s1088:
3611 : 8a __ __ TXA
3612 : e0 64 __ CPX #$64
3614 : f0 04 __ BEQ $361a ; (printf.s61 + 0)
.s64:
3616 : c9 44 __ CMP #$44
3618 : d0 04 __ BNE $361e ; (printf.s62 + 0)
.s61:
361a : a9 01 __ LDA #$01
361c : d0 1c __ BNE $363a ; (printf.s245 + 0)
.s62:
361e : c9 75 __ CMP #$75
3620 : f0 17 __ BEQ $3639 ; (printf.s268 + 0)
.s68:
3622 : c9 55 __ CMP #$55
3624 : f0 13 __ BEQ $3639 ; (printf.s268 + 0)
.s66:
3626 : c9 78 __ CMP #$78
3628 : f0 07 __ BEQ $3631 ; (printf.s69 + 0)
.s72:
362a : c9 58 __ CMP #$58
362c : f0 03 __ BEQ $3631 ; (printf.s69 + 0)
362e : 4c 60 33 JMP $3360 ; (printf.l2 + 0)
.s69:
3631 : 8c ba bf STY $bfba ; (si + 4)
3634 : a9 10 __ LDA #$10
3636 : 8d b9 bf STA $bfb9 ; (si + 3)
.s268:
3639 : 98 __ __ TYA
.s245:
363a : 85 15 __ STA P8 
363c : a9 be __ LDA #$be
363e : 85 0f __ STA P2 ; (fmt + 2)
3640 : a9 bf __ LDA #$bf
3642 : 85 10 __ STA P3 ; (fmt + 3)
3644 : a9 b6 __ LDA #$b6
3646 : 85 0d __ STA P0 ; (fmt + 0)
3648 : a9 bf __ LDA #$bf
364a : 85 0e __ STA P1 ; (fmt + 1)
364c : 20 14 38 JSR $3814 ; (nforml@proxy + 0)
364f : a5 1b __ LDA ACCU + 0 
3651 : 4c ab 33 JMP $33ab ; (printf.s1068 + 0)
.s269:
3654 : a9 00 __ LDA #$00
.s247:
3656 : 85 13 __ STA P6 
3658 : a9 be __ LDA #$be
365a : 85 0f __ STA P2 ; (fmt + 2)
365c : a9 bf __ LDA #$bf
365e : 85 10 __ STA P3 ; (fmt + 3)
3660 : a0 00 __ LDY #$00
3662 : b1 47 __ LDA (T0 + 0),y 
3664 : 85 11 __ STA P4 
3666 : c8 __ __ INY
3667 : b1 47 __ LDA (T0 + 0),y 
3669 : 85 12 __ STA P5 
366b : a9 b6 __ LDA #$b6
366d : 85 0d __ STA P0 ; (fmt + 0)
366f : a9 bf __ LDA #$bf
3671 : 85 0e __ STA P1 ; (fmt + 1)
3673 : 20 df 36 JSR $36df ; (nformi.s0 + 0)
3676 : a5 1b __ LDA ACCU + 0 
3678 : 85 49 __ STA T2 + 0 
367a : 4c 44 35 JMP $3544 ; (printf.s244 + 0)
.s246:
367d : a0 00 __ LDY #$00
367f : b1 4a __ LDA (T3 + 0),y 
3681 : aa __ __ TAX
3682 : 18 __ __ CLC
3683 : a5 4a __ LDA T3 + 0 
3685 : 69 01 __ ADC #$01
3687 : 4c f5 33 JMP $33f5 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
368a : a0 00 __ LDY #$00
368c : b1 0d __ LDA (P0),y 
368e : f0 0b __ BEQ $369b ; (puts.s1001 + 0)
3690 : 20 9c 36 JSR $369c ; (putpch + 0)
3693 : e6 0d __ INC P0 
3695 : d0 f3 __ BNE $368a ; (puts.s0 + 0)
3697 : e6 0e __ INC P1 
3699 : d0 ef __ BNE $368a ; (puts.s0 + 0)
.s1001:
369b : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
369c : ae cf 46 LDX $46cf ; (giocharmap + 0)
369f : e0 01 __ CPX #$01
36a1 : 90 26 __ BCC $36c9 ; (putpch + 45)
36a3 : c9 0a __ CMP #$0a
36a5 : d0 02 __ BNE $36a9 ; (putpch + 13)
36a7 : a9 0d __ LDA #$0d
36a9 : c9 09 __ CMP #$09
36ab : f0 1f __ BEQ $36cc ; (putpch + 48)
36ad : e0 02 __ CPX #$02
36af : 90 18 __ BCC $36c9 ; (putpch + 45)
36b1 : c9 41 __ CMP #$41
36b3 : 90 14 __ BCC $36c9 ; (putpch + 45)
36b5 : c9 7b __ CMP #$7b
36b7 : b0 10 __ BCS $36c9 ; (putpch + 45)
36b9 : c9 61 __ CMP #$61
36bb : b0 04 __ BCS $36c1 ; (putpch + 37)
36bd : c9 5b __ CMP #$5b
36bf : b0 08 __ BCS $36c9 ; (putpch + 45)
36c1 : 49 20 __ EOR #$20
36c3 : e0 03 __ CPX #$03
36c5 : f0 02 __ BEQ $36c9 ; (putpch + 45)
36c7 : 29 df __ AND #$df
36c9 : 4c d2 ff JMP $ffd2 
36cc : 38 __ __ SEC
36cd : 20 f0 ff JSR $fff0 
36d0 : 98 __ __ TYA
36d1 : 29 03 __ AND #$03
36d3 : 49 03 __ EOR #$03
36d5 : aa __ __ TAX
36d6 : a9 20 __ LDA #$20
36d8 : 20 d2 ff JSR $ffd2 
36db : ca __ __ DEX
36dc : 10 fa __ BPL $36d8 ; (putpch + 60)
36de : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
36df : a9 00 __ LDA #$00
36e1 : 85 43 __ STA T0 + 0 
36e3 : a5 13 __ LDA P6 ; (s + 0)
36e5 : f0 13 __ BEQ $36fa ; (nformi.s182 + 0)
.s4:
36e7 : 24 12 __ BIT P5 ; (v + 1)
36e9 : 10 0f __ BPL $36fa ; (nformi.s182 + 0)
.s1:
36eb : 38 __ __ SEC
36ec : a9 00 __ LDA #$00
36ee : e5 11 __ SBC P4 ; (v + 0)
36f0 : 85 11 __ STA P4 ; (v + 0)
36f2 : a9 00 __ LDA #$00
36f4 : e5 12 __ SBC P5 ; (v + 1)
36f6 : 85 12 __ STA P5 ; (v + 1)
36f8 : e6 43 __ INC T0 + 0 
.s182:
36fa : a9 10 __ LDA #$10
36fc : 85 44 __ STA T2 + 0 
36fe : a5 11 __ LDA P4 ; (v + 0)
3700 : 05 12 __ ORA P5 ; (v + 1)
3702 : f0 46 __ BEQ $374a ; (nformi.s7 + 0)
.s42:
3704 : a0 03 __ LDY #$03
3706 : b1 0d __ LDA (P0),y ; (si + 0)
3708 : 85 45 __ STA T4 + 0 
370a : c8 __ __ INY
370b : b1 0d __ LDA (P0),y ; (si + 0)
370d : 85 46 __ STA T4 + 1 
.l6:
370f : a5 11 __ LDA P4 ; (v + 0)
3711 : 85 1b __ STA ACCU + 0 
3713 : a5 12 __ LDA P5 ; (v + 1)
3715 : 85 1c __ STA ACCU + 1 
3717 : a5 45 __ LDA T4 + 0 
3719 : 85 03 __ STA WORK + 0 
371b : a5 46 __ LDA T4 + 1 
371d : 85 04 __ STA WORK + 1 
371f : 20 a4 45 JSR $45a4 ; (divmod + 0)
3722 : a5 06 __ LDA WORK + 3 
3724 : 30 08 __ BMI $372e ; (nformi.s78 + 0)
.s1019:
3726 : d0 0a __ BNE $3732 ; (nformi.s77 + 0)
.s1018:
3728 : a5 05 __ LDA WORK + 2 
372a : c9 0a __ CMP #$0a
372c : b0 04 __ BCS $3732 ; (nformi.s77 + 0)
.s78:
372e : a9 30 __ LDA #$30
3730 : d0 02 __ BNE $3734 ; (nformi.s79 + 0)
.s77:
3732 : a9 37 __ LDA #$37
.s79:
3734 : 18 __ __ CLC
3735 : 65 05 __ ADC WORK + 2 
3737 : c6 44 __ DEC T2 + 0 
3739 : a6 44 __ LDX T2 + 0 
373b : 9d f0 bf STA $bff0,x ; (buffer + 0)
373e : a5 1b __ LDA ACCU + 0 
3740 : 85 11 __ STA P4 ; (v + 0)
3742 : a5 1c __ LDA ACCU + 1 
3744 : 85 12 __ STA P5 ; (v + 1)
3746 : 05 11 __ ORA P4 ; (v + 0)
3748 : d0 c5 __ BNE $370f ; (nformi.l6 + 0)
.s7:
374a : a0 02 __ LDY #$02
374c : b1 0d __ LDA (P0),y ; (si + 0)
374e : c9 ff __ CMP #$ff
3750 : d0 04 __ BNE $3756 ; (nformi.s80 + 0)
.s81:
3752 : a9 0f __ LDA #$0f
3754 : d0 05 __ BNE $375b ; (nformi.s1026 + 0)
.s80:
3756 : 38 __ __ SEC
3757 : a9 10 __ LDA #$10
3759 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
375b : a8 __ __ TAY
375c : c4 44 __ CPY T2 + 0 
375e : b0 0d __ BCS $376d ; (nformi.s10 + 0)
.s9:
3760 : a9 30 __ LDA #$30
.l1027:
3762 : c6 44 __ DEC T2 + 0 
3764 : a6 44 __ LDX T2 + 0 
3766 : 9d f0 bf STA $bff0,x ; (buffer + 0)
3769 : c4 44 __ CPY T2 + 0 
376b : 90 f5 __ BCC $3762 ; (nformi.l1027 + 0)
.s10:
376d : a0 07 __ LDY #$07
376f : b1 0d __ LDA (P0),y ; (si + 0)
3771 : f0 20 __ BEQ $3793 ; (nformi.s13 + 0)
.s14:
3773 : a0 04 __ LDY #$04
3775 : b1 0d __ LDA (P0),y ; (si + 0)
3777 : d0 1a __ BNE $3793 ; (nformi.s13 + 0)
.s1013:
3779 : 88 __ __ DEY
377a : b1 0d __ LDA (P0),y ; (si + 0)
377c : c9 10 __ CMP #$10
377e : d0 13 __ BNE $3793 ; (nformi.s13 + 0)
.s11:
3780 : a9 58 __ LDA #$58
3782 : a6 44 __ LDX T2 + 0 
3784 : 9d ef bf STA $bfef,x ; (buff + 49)
3787 : 8a __ __ TXA
3788 : 18 __ __ CLC
3789 : 69 fe __ ADC #$fe
378b : 85 44 __ STA T2 + 0 
378d : aa __ __ TAX
378e : a9 30 __ LDA #$30
3790 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
3793 : a9 00 __ LDA #$00
3795 : 85 1b __ STA ACCU + 0 
3797 : a5 43 __ LDA T0 + 0 
3799 : f0 06 __ BEQ $37a1 ; (nformi.s16 + 0)
.s15:
379b : c6 44 __ DEC T2 + 0 
379d : a9 2d __ LDA #$2d
379f : d0 0a __ BNE $37ab ; (nformi.s1025 + 0)
.s16:
37a1 : a0 05 __ LDY #$05
37a3 : b1 0d __ LDA (P0),y ; (si + 0)
37a5 : f0 09 __ BEQ $37b0 ; (nformi.s163 + 0)
.s18:
37a7 : c6 44 __ DEC T2 + 0 
37a9 : a9 2b __ LDA #$2b
.s1025:
37ab : a6 44 __ LDX T2 + 0 
37ad : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
37b0 : a0 06 __ LDY #$06
37b2 : b1 0d __ LDA (P0),y ; (si + 0)
37b4 : d0 33 __ BNE $37e9 ; (nformi.s24 + 0)
.l30:
37b6 : a0 01 __ LDY #$01
37b8 : b1 0d __ LDA (P0),y ; (si + 0)
37ba : 18 __ __ CLC
37bb : 65 44 __ ADC T2 + 0 
37bd : b0 04 __ BCS $37c3 ; (nformi.s31 + 0)
.s1006:
37bf : c9 11 __ CMP #$11
37c1 : 90 0d __ BCC $37d0 ; (nformi.s33 + 0)
.s31:
37c3 : c6 44 __ DEC T2 + 0 
37c5 : a0 00 __ LDY #$00
37c7 : b1 0d __ LDA (P0),y ; (si + 0)
37c9 : a6 44 __ LDX T2 + 0 
37cb : 9d f0 bf STA $bff0,x ; (buffer + 0)
37ce : b0 e6 __ BCS $37b6 ; (nformi.l30 + 0)
.s33:
37d0 : a6 44 __ LDX T2 + 0 
37d2 : e0 10 __ CPX #$10
37d4 : b0 0e __ BCS $37e4 ; (nformi.s23 + 0)
.s34:
37d6 : 88 __ __ DEY
.l1022:
37d7 : bd f0 bf LDA $bff0,x ; (buffer + 0)
37da : 91 0f __ STA (P2),y ; (str + 0)
37dc : e8 __ __ INX
37dd : e0 10 __ CPX #$10
37df : c8 __ __ INY
37e0 : 90 f5 __ BCC $37d7 ; (nformi.l1022 + 0)
.s1023:
37e2 : 84 1b __ STY ACCU + 0 
.s23:
37e4 : a9 00 __ LDA #$00
37e6 : 85 1c __ STA ACCU + 1 
.s1001:
37e8 : 60 __ __ RTS
.s24:
37e9 : a6 44 __ LDX T2 + 0 
37eb : e0 10 __ CPX #$10
37ed : b0 1a __ BCS $3809 ; (nformi.l27 + 0)
.s25:
37ef : a0 00 __ LDY #$00
.l1020:
37f1 : bd f0 bf LDA $bff0,x ; (buffer + 0)
37f4 : 91 0f __ STA (P2),y ; (str + 0)
37f6 : e8 __ __ INX
37f7 : e0 10 __ CPX #$10
37f9 : c8 __ __ INY
37fa : 90 f5 __ BCC $37f1 ; (nformi.l1020 + 0)
.s1021:
37fc : 84 1b __ STY ACCU + 0 
37fe : b0 09 __ BCS $3809 ; (nformi.l27 + 0)
.s28:
3800 : 88 __ __ DEY
3801 : b1 0d __ LDA (P0),y ; (si + 0)
3803 : a4 1b __ LDY ACCU + 0 
3805 : 91 0f __ STA (P2),y ; (str + 0)
3807 : e6 1b __ INC ACCU + 0 
.l27:
3809 : a5 1b __ LDA ACCU + 0 
380b : a0 01 __ LDY #$01
380d : d1 0d __ CMP (P0),y ; (si + 0)
380f : 90 ef __ BCC $3800 ; (nformi.s28 + 0)
3811 : 4c e4 37 JMP $37e4 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml@proxy: ; nforml@proxy
3814 : a5 53 __ LDA $53 
3816 : 85 11 __ STA P4 
3818 : a5 54 __ LDA $54 
381a : 85 12 __ STA P5 
381c : a5 55 __ LDA $55 
381e : 85 13 __ STA P6 
3820 : a5 56 __ LDA $56 
3822 : 85 14 __ STA P7 
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
3824 : a9 00 __ LDA #$00
3826 : 85 43 __ STA T0 + 0 
3828 : a5 15 __ LDA P8 ; (s + 0)
382a : f0 21 __ BEQ $384d ; (nforml.s182 + 0)
.s4:
382c : a5 14 __ LDA P7 ; (v + 3)
382e : f0 1d __ BEQ $384d ; (nforml.s182 + 0)
.s1032:
3830 : 10 1b __ BPL $384d ; (nforml.s182 + 0)
.s1:
3832 : 38 __ __ SEC
3833 : a9 00 __ LDA #$00
3835 : e5 11 __ SBC P4 ; (v + 0)
3837 : 85 11 __ STA P4 ; (v + 0)
3839 : a9 00 __ LDA #$00
383b : e5 12 __ SBC P5 ; (v + 1)
383d : 85 12 __ STA P5 ; (v + 1)
383f : a9 00 __ LDA #$00
3841 : e5 13 __ SBC P6 ; (v + 2)
3843 : 85 13 __ STA P6 ; (v + 2)
3845 : a9 00 __ LDA #$00
3847 : e5 14 __ SBC P7 ; (v + 3)
3849 : 85 14 __ STA P7 ; (v + 3)
384b : e6 43 __ INC T0 + 0 
.s182:
384d : a9 10 __ LDA #$10
384f : 85 44 __ STA T2 + 0 
3851 : a5 14 __ LDA P7 ; (v + 3)
3853 : d0 0c __ BNE $3861 ; (nforml.s42 + 0)
.s1024:
3855 : a5 13 __ LDA P6 ; (v + 2)
3857 : d0 08 __ BNE $3861 ; (nforml.s42 + 0)
.s1025:
3859 : a5 12 __ LDA P5 ; (v + 1)
385b : d0 04 __ BNE $3861 ; (nforml.s42 + 0)
.s1026:
385d : c5 11 __ CMP P4 ; (v + 0)
385f : b0 0e __ BCS $386f ; (nforml.s7 + 0)
.s42:
3861 : a0 03 __ LDY #$03
3863 : b1 0d __ LDA (P0),y ; (si + 0)
3865 : 85 45 __ STA T5 + 0 
3867 : c8 __ __ INY
3868 : b1 0d __ LDA (P0),y ; (si + 0)
386a : 85 46 __ STA T5 + 1 
386c : 4c 39 39 JMP $3939 ; (nforml.l6 + 0)
.s7:
386f : a0 02 __ LDY #$02
3871 : b1 0d __ LDA (P0),y ; (si + 0)
3873 : c9 ff __ CMP #$ff
3875 : d0 04 __ BNE $387b ; (nforml.s80 + 0)
.s81:
3877 : a9 0f __ LDA #$0f
3879 : d0 05 __ BNE $3880 ; (nforml.s1039 + 0)
.s80:
387b : 38 __ __ SEC
387c : a9 10 __ LDA #$10
387e : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
3880 : a8 __ __ TAY
3881 : c4 44 __ CPY T2 + 0 
3883 : b0 0d __ BCS $3892 ; (nforml.s10 + 0)
.s9:
3885 : a9 30 __ LDA #$30
.l1040:
3887 : c6 44 __ DEC T2 + 0 
3889 : a6 44 __ LDX T2 + 0 
388b : 9d f0 bf STA $bff0,x ; (buffer + 0)
388e : c4 44 __ CPY T2 + 0 
3890 : 90 f5 __ BCC $3887 ; (nforml.l1040 + 0)
.s10:
3892 : a0 07 __ LDY #$07
3894 : b1 0d __ LDA (P0),y ; (si + 0)
3896 : f0 20 __ BEQ $38b8 ; (nforml.s13 + 0)
.s14:
3898 : a0 04 __ LDY #$04
389a : b1 0d __ LDA (P0),y ; (si + 0)
389c : d0 1a __ BNE $38b8 ; (nforml.s13 + 0)
.s1013:
389e : 88 __ __ DEY
389f : b1 0d __ LDA (P0),y ; (si + 0)
38a1 : c9 10 __ CMP #$10
38a3 : d0 13 __ BNE $38b8 ; (nforml.s13 + 0)
.s11:
38a5 : a9 58 __ LDA #$58
38a7 : a6 44 __ LDX T2 + 0 
38a9 : 9d ef bf STA $bfef,x ; (buff + 49)
38ac : 8a __ __ TXA
38ad : 18 __ __ CLC
38ae : 69 fe __ ADC #$fe
38b0 : 85 44 __ STA T2 + 0 
38b2 : aa __ __ TAX
38b3 : a9 30 __ LDA #$30
38b5 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
38b8 : a9 00 __ LDA #$00
38ba : 85 1b __ STA ACCU + 0 
38bc : a5 43 __ LDA T0 + 0 
38be : f0 06 __ BEQ $38c6 ; (nforml.s16 + 0)
.s15:
38c0 : c6 44 __ DEC T2 + 0 
38c2 : a9 2d __ LDA #$2d
38c4 : d0 0a __ BNE $38d0 ; (nforml.s1038 + 0)
.s16:
38c6 : a0 05 __ LDY #$05
38c8 : b1 0d __ LDA (P0),y ; (si + 0)
38ca : f0 09 __ BEQ $38d5 ; (nforml.s163 + 0)
.s18:
38cc : c6 44 __ DEC T2 + 0 
38ce : a9 2b __ LDA #$2b
.s1038:
38d0 : a6 44 __ LDX T2 + 0 
38d2 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
38d5 : a0 06 __ LDY #$06
38d7 : b1 0d __ LDA (P0),y ; (si + 0)
38d9 : d0 33 __ BNE $390e ; (nforml.s24 + 0)
.l30:
38db : a0 01 __ LDY #$01
38dd : b1 0d __ LDA (P0),y ; (si + 0)
38df : 18 __ __ CLC
38e0 : 65 44 __ ADC T2 + 0 
38e2 : b0 04 __ BCS $38e8 ; (nforml.s31 + 0)
.s1006:
38e4 : c9 11 __ CMP #$11
38e6 : 90 0d __ BCC $38f5 ; (nforml.s33 + 0)
.s31:
38e8 : c6 44 __ DEC T2 + 0 
38ea : a0 00 __ LDY #$00
38ec : b1 0d __ LDA (P0),y ; (si + 0)
38ee : a6 44 __ LDX T2 + 0 
38f0 : 9d f0 bf STA $bff0,x ; (buffer + 0)
38f3 : b0 e6 __ BCS $38db ; (nforml.l30 + 0)
.s33:
38f5 : a6 44 __ LDX T2 + 0 
38f7 : e0 10 __ CPX #$10
38f9 : b0 0e __ BCS $3909 ; (nforml.s23 + 0)
.s34:
38fb : 88 __ __ DEY
.l1035:
38fc : bd f0 bf LDA $bff0,x ; (buffer + 0)
38ff : 91 0f __ STA (P2),y ; (str + 0)
3901 : e8 __ __ INX
3902 : e0 10 __ CPX #$10
3904 : c8 __ __ INY
3905 : 90 f5 __ BCC $38fc ; (nforml.l1035 + 0)
.s1036:
3907 : 84 1b __ STY ACCU + 0 
.s23:
3909 : a9 00 __ LDA #$00
390b : 85 1c __ STA ACCU + 1 
.s1001:
390d : 60 __ __ RTS
.s24:
390e : a6 44 __ LDX T2 + 0 
3910 : e0 10 __ CPX #$10
3912 : b0 1a __ BCS $392e ; (nforml.l27 + 0)
.s25:
3914 : a0 00 __ LDY #$00
.l1033:
3916 : bd f0 bf LDA $bff0,x ; (buffer + 0)
3919 : 91 0f __ STA (P2),y ; (str + 0)
391b : e8 __ __ INX
391c : e0 10 __ CPX #$10
391e : c8 __ __ INY
391f : 90 f5 __ BCC $3916 ; (nforml.l1033 + 0)
.s1034:
3921 : 84 1b __ STY ACCU + 0 
3923 : b0 09 __ BCS $392e ; (nforml.l27 + 0)
.s28:
3925 : 88 __ __ DEY
3926 : b1 0d __ LDA (P0),y ; (si + 0)
3928 : a4 1b __ LDY ACCU + 0 
392a : 91 0f __ STA (P2),y ; (str + 0)
392c : e6 1b __ INC ACCU + 0 
.l27:
392e : a5 1b __ LDA ACCU + 0 
3930 : a0 01 __ LDY #$01
3932 : d1 0d __ CMP (P0),y ; (si + 0)
3934 : 90 ef __ BCC $3925 ; (nforml.s28 + 0)
3936 : 4c 09 39 JMP $3909 ; (nforml.s23 + 0)
.l6:
3939 : a5 11 __ LDA P4 ; (v + 0)
393b : 85 1b __ STA ACCU + 0 
393d : a5 12 __ LDA P5 ; (v + 1)
393f : 85 1c __ STA ACCU + 1 
3941 : a5 13 __ LDA P6 ; (v + 2)
3943 : 85 1d __ STA ACCU + 2 
3945 : a5 14 __ LDA P7 ; (v + 3)
3947 : 85 1e __ STA ACCU + 3 
3949 : a5 45 __ LDA T5 + 0 
394b : 85 03 __ STA WORK + 0 
394d : a5 46 __ LDA T5 + 1 
394f : 85 04 __ STA WORK + 1 
3951 : a9 00 __ LDA #$00
3953 : 85 05 __ STA WORK + 2 
3955 : 85 06 __ STA WORK + 3 
3957 : 20 29 46 JSR $4629 ; (divmod32 + 0)
395a : a5 08 __ LDA WORK + 5 
395c : 30 08 __ BMI $3966 ; (nforml.s78 + 0)
.s1023:
395e : d0 0a __ BNE $396a ; (nforml.s77 + 0)
.s1022:
3960 : a5 07 __ LDA WORK + 4 
3962 : c9 0a __ CMP #$0a
3964 : b0 04 __ BCS $396a ; (nforml.s77 + 0)
.s78:
3966 : a9 30 __ LDA #$30
3968 : d0 02 __ BNE $396c ; (nforml.s79 + 0)
.s77:
396a : a9 37 __ LDA #$37
.s79:
396c : 18 __ __ CLC
396d : 65 07 __ ADC WORK + 4 
396f : c6 44 __ DEC T2 + 0 
3971 : a6 44 __ LDX T2 + 0 
3973 : 9d f0 bf STA $bff0,x ; (buffer + 0)
3976 : a5 1b __ LDA ACCU + 0 
3978 : 85 11 __ STA P4 ; (v + 0)
397a : a5 1c __ LDA ACCU + 1 
397c : 85 12 __ STA P5 ; (v + 1)
397e : a5 1d __ LDA ACCU + 2 
3980 : 85 13 __ STA P6 ; (v + 2)
3982 : a5 1e __ LDA ACCU + 3 
3984 : 85 14 __ STA P7 ; (v + 3)
3986 : d0 b1 __ BNE $3939 ; (nforml.l6 + 0)
.s1018:
3988 : a5 13 __ LDA P6 ; (v + 2)
398a : d0 ad __ BNE $3939 ; (nforml.l6 + 0)
.s1019:
398c : a5 12 __ LDA P5 ; (v + 1)
398e : d0 a9 __ BNE $3939 ; (nforml.l6 + 0)
.s1020:
3990 : c5 11 __ CMP P4 ; (v + 0)
3992 : 90 a5 __ BCC $3939 ; (nforml.l6 + 0)
3994 : 4c 6f 38 JMP $386f ; (nforml.s7 + 0)
--------------------------------------------------------------------
3997 : __ __ __ BYT 73 77 69 74 63 68 20 74 6f 20 38 30 20 63 6f 6c : switch to 80 col
39a7 : __ __ __ BYT 75 6d 6e 20 73 63 72 65 65 6e 0a 61 6e 64 20 70 : umn screen.and p
39b7 : __ __ __ BYT 72 65 73 73 20 6b 65 79 2e 0a 00                : ress key...
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
39c2 : 20 d0 39 JSR $39d0 ; (getpch + 0)
39c5 : c9 00 __ CMP #$00
39c7 : f0 f9 __ BEQ $39c2 ; (getch.s0 + 0)
39c9 : 85 1b __ STA ACCU + 0 
39cb : a9 00 __ LDA #$00
39cd : 85 1c __ STA ACCU + 1 
.s1001:
39cf : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
39d0 : 20 e4 ff JSR $ffe4 
39d3 : ae cf 46 LDX $46cf ; (giocharmap + 0)
39d6 : e0 01 __ CPX #$01
39d8 : 90 26 __ BCC $3a00 ; (getpch + 48)
39da : c9 0d __ CMP #$0d
39dc : d0 02 __ BNE $39e0 ; (getpch + 16)
39de : a9 0a __ LDA #$0a
39e0 : e0 02 __ CPX #$02
39e2 : 90 1c __ BCC $3a00 ; (getpch + 48)
39e4 : c9 db __ CMP #$db
39e6 : b0 18 __ BCS $3a00 ; (getpch + 48)
39e8 : c9 41 __ CMP #$41
39ea : 90 14 __ BCC $3a00 ; (getpch + 48)
39ec : c9 c1 __ CMP #$c1
39ee : 90 02 __ BCC $39f2 ; (getpch + 34)
39f0 : 49 a0 __ EOR #$a0
39f2 : c9 7b __ CMP #$7b
39f4 : b0 0a __ BCS $3a00 ; (getpch + 48)
39f6 : c9 61 __ CMP #$61
39f8 : b0 04 __ BCS $39fe ; (getpch + 46)
39fa : c9 5b __ CMP #$5b
39fc : b0 02 __ BCS $3a00 ; (getpch + 48)
39fe : 49 20 __ EOR #$20
3a00 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
3a01 : 20 81 ff JSR $ff81 
.s1001:
3a04 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
3a05 : 24 d7 __ BIT $d7 
3a07 : 30 03 __ BMI $3a0c ; (screen_setmode.s1001 + 0)
.s6:
3a09 : 20 5f ff JSR $ff5f 
.s1001:
3a0c : 60 __ __ RTS
--------------------------------------------------------------------
3a0d : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
3a1d : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
3a2d : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
3a37 : __ __ __ BYT 4f 56 4c 31 00                                  : OVL1.
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
3a3c : a5 0d __ LDA P0 
3a3e : a6 0e __ LDX P1 
3a40 : 20 68 ff JSR $ff68 
.s1001:
3a43 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam@proxy: ; krnio_setnam@proxy
3a44 : a9 4c __ LDA #$4c
3a46 : 85 0d __ STA P0 
3a48 : a9 bf __ LDA #$bf
3a4a : 85 0e __ STA P1 
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
3a4c : a5 0d __ LDA P0 
3a4e : 05 0e __ ORA P1 
3a50 : f0 08 __ BEQ $3a5a ; (krnio_setnam.s0 + 14)
3a52 : a0 ff __ LDY #$ff
3a54 : c8 __ __ INY
3a55 : b1 0d __ LDA (P0),y 
3a57 : d0 fb __ BNE $3a54 ; (krnio_setnam.s0 + 8)
3a59 : 98 __ __ TYA
3a5a : a6 0d __ LDX P0 
3a5c : a4 0e __ LDY P1 
3a5e : 20 bd ff JSR $ffbd 
.s1001:
3a61 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
3a62 : a5 0d __ LDA P0 
3a64 : a6 0e __ LDX P1 
3a66 : a4 0f __ LDY P2 
3a68 : 20 ba ff JSR $ffba 
3a6b : a9 00 __ LDA #$00
3a6d : a2 00 __ LDX #$00
3a6f : a0 00 __ LDY #$00
3a71 : 20 d5 ff JSR $ffd5 
3a74 : a9 00 __ LDA #$00
3a76 : b0 02 __ BCS $3a7a ; (krnio_load.s0 + 24)
3a78 : a9 01 __ LDA #$01
3a7a : 85 1b __ STA ACCU + 0 
.s1001:
3a7c : a5 1b __ LDA ACCU + 0 
3a7e : 60 __ __ RTS
--------------------------------------------------------------------
3a7f : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
3a8f : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
3a9d : a5 0d __ LDA P0 
3a9f : 85 1b __ STA ACCU + 0 
3aa1 : a5 0e __ LDA P1 
3aa3 : 85 1c __ STA ACCU + 1 
3aa5 : ae bf 46 LDX $46bf ; (spentry + 0)
3aa8 : 9a __ __ TXS
3aa9 : a9 4c __ LDA #$4c
3aab : 85 54 __ STA $54 
3aad : a9 00 __ LDA #$00
3aaf : 85 13 __ STA P6 
.s1001:
3ab1 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
3ab2 : a2 04 __ LDX #$04
3ab4 : b5 53 __ LDA T3 + 0,x 
3ab6 : 9d ac bf STA $bfac,x ; (vdc_set_mode@stack + 0)
3ab9 : ca __ __ DEX
3aba : 10 f8 __ BPL $3ab4 ; (vdc_set_mode.s1000 + 2)
3abc : 38 __ __ SEC
3abd : a5 23 __ LDA SP + 0 
3abf : e9 08 __ SBC #$08
3ac1 : 85 23 __ STA SP + 0 
3ac3 : b0 02 __ BCS $3ac7 ; (vdc_set_mode.s0 + 0)
3ac5 : c6 24 __ DEC SP + 1 
.s0:
3ac7 : a9 00 __ LDA #$00
3ac9 : 85 4f __ STA T0 + 0 
3acb : 38 __ __ SEC
3acc : e5 16 __ SBC P9 ; (mode + 0)
3ace : 29 20 __ AND #$20
3ad0 : 85 50 __ STA T2 + 0 
3ad2 : aa __ __ TAX
3ad3 : 18 __ __ CLC
3ad4 : 69 51 __ ADC #$51
3ad6 : 85 53 __ STA T3 + 0 
3ad8 : a9 47 __ LDA #$47
3ada : 69 00 __ ADC #$00
3adc : 85 54 __ STA T3 + 1 
3ade : bd 55 47 LDA $4755,x ; (vdc_modes + 4)
3ae1 : f0 0a __ BEQ $3aed ; (vdc_set_mode.s3 + 0)
.s4:
3ae3 : ad d0 46 LDA $46d0 ; (vdc_state + 0)
3ae6 : c9 10 __ CMP #$10
3ae8 : d0 03 __ BNE $3aed ; (vdc_set_mode.s3 + 0)
3aea : 4c 6f 3d JMP $3d6f ; (vdc_set_mode.s1001 + 0)
.s3:
3aed : a0 00 __ LDY #$00
3aef : b1 53 __ LDA (T3 + 0),y 
3af1 : 8d d3 46 STA $46d3 ; (vdc_state + 3)
3af4 : c8 __ __ INY
3af5 : b1 53 __ LDA (T3 + 0),y 
3af7 : 8d d4 46 STA $46d4 ; (vdc_state + 4)
3afa : c8 __ __ INY
3afb : b1 53 __ LDA (T3 + 0),y 
3afd : 8d d5 46 STA $46d5 ; (vdc_state + 5)
3b00 : c8 __ __ INY
3b01 : b1 53 __ LDA (T3 + 0),y 
3b03 : 8d d6 46 STA $46d6 ; (vdc_state + 6)
3b06 : a0 09 __ LDY #$09
3b08 : b1 53 __ LDA (T3 + 0),y 
3b0a : 8d dc 46 STA $46dc ; (vdc_state + 12)
3b0d : c8 __ __ INY
3b0e : b1 53 __ LDA (T3 + 0),y 
3b10 : 8d dd 46 STA $46dd ; (vdc_state + 13)
3b13 : c8 __ __ INY
3b14 : b1 53 __ LDA (T3 + 0),y 
3b16 : 8d de 46 STA $46de ; (vdc_state + 14)
3b19 : c8 __ __ INY
3b1a : b1 53 __ LDA (T3 + 0),y 
3b1c : 8d df 46 STA $46df ; (vdc_state + 15)
3b1f : c8 __ __ INY
3b20 : b1 53 __ LDA (T3 + 0),y 
3b22 : 8d e0 46 STA $46e0 ; (vdc_state + 16)
3b25 : c8 __ __ INY
3b26 : b1 53 __ LDA (T3 + 0),y 
3b28 : 8d e1 46 STA $46e1 ; (vdc_state + 17)
3b2b : c8 __ __ INY
3b2c : b1 53 __ LDA (T3 + 0),y 
3b2e : 8d e2 46 STA $46e2 ; (vdc_state + 18)
3b31 : c8 __ __ INY
3b32 : b1 53 __ LDA (T3 + 0),y 
3b34 : 8d e3 46 STA $46e3 ; (vdc_state + 19)
3b37 : c8 __ __ INY
3b38 : b1 53 __ LDA (T3 + 0),y 
3b3a : 8d e4 46 STA $46e4 ; (vdc_state + 20)
3b3d : c8 __ __ INY
3b3e : b1 53 __ LDA (T3 + 0),y 
3b40 : 8d e5 46 STA $46e5 ; (vdc_state + 21)
3b43 : a0 05 __ LDY #$05
3b45 : b1 53 __ LDA (T3 + 0),y 
3b47 : 85 55 __ STA T4 + 0 
3b49 : c8 __ __ INY
3b4a : b1 53 __ LDA (T3 + 0),y 
3b4c : 8d d9 46 STA $46d9 ; (vdc_state + 9)
3b4f : 85 44 __ STA T6 + 0 
3b51 : a5 55 __ LDA T4 + 0 
3b53 : 8d d8 46 STA $46d8 ; (vdc_state + 8)
3b56 : c8 __ __ INY
3b57 : b1 53 __ LDA (T3 + 0),y 
3b59 : 85 57 __ STA T5 + 0 
3b5b : c8 __ __ INY
3b5c : b1 53 __ LDA (T3 + 0),y 
3b5e : 8d db 46 STA $46db ; (vdc_state + 11)
3b61 : a8 __ __ TAY
3b62 : a5 57 __ LDA T5 + 0 
3b64 : 8d da 46 STA $46da ; (vdc_state + 10)
3b67 : a9 0c __ LDA #$0c
3b69 : 8d 00 d6 STA $d600 
.l1515:
3b6c : 2c 00 d6 BIT $d600 
3b6f : 10 fb __ BPL $3b6c ; (vdc_set_mode.l1515 + 0)
.s11:
3b71 : a5 44 __ LDA T6 + 0 
3b73 : 8d 01 d6 STA $d601 
3b76 : a9 0d __ LDA #$0d
3b78 : 8d 00 d6 STA $d600 
.l1517:
3b7b : 2c 00 d6 BIT $d600 
3b7e : 10 fb __ BPL $3b7b ; (vdc_set_mode.l1517 + 0)
.s16:
3b80 : a5 55 __ LDA T4 + 0 
3b82 : 8d 01 d6 STA $d601 
3b85 : a9 14 __ LDA #$14
3b87 : 8d 00 d6 STA $d600 
.l1519:
3b8a : 2c 00 d6 BIT $d600 
3b8d : 10 fb __ BPL $3b8a ; (vdc_set_mode.l1519 + 0)
.s21:
3b8f : 8c 01 d6 STY $d601 
3b92 : a9 15 __ LDA #$15
3b94 : 8d 00 d6 STA $d600 
.l1521:
3b97 : 2c 00 d6 BIT $d600 
3b9a : 10 fb __ BPL $3b97 ; (vdc_set_mode.l1521 + 0)
.s26:
3b9c : a5 57 __ LDA T5 + 0 
3b9e : 8d 01 d6 STA $d601 
3ba1 : bd 5f 47 LDA $475f,x ; (vdc_modes + 14)
3ba4 : 85 56 __ STA T4 + 1 
3ba6 : a9 1c __ LDA #$1c
3ba8 : 8d 00 d6 STA $d600 
.l1523:
3bab : 2c 00 d6 BIT $d600 
3bae : 10 fb __ BPL $3bab ; (vdc_set_mode.l1523 + 0)
.s32:
3bb0 : ad 01 d6 LDA $d601 
3bb3 : 29 1f __ AND #$1f
3bb5 : 85 57 __ STA T5 + 0 
3bb7 : a9 4e __ LDA #$4e
3bb9 : a0 02 __ LDY #$02
3bbb : 91 23 __ STA (SP + 0),y 
3bbd : a9 3f __ LDA #$3f
3bbf : c8 __ __ INY
3bc0 : 91 23 __ STA (SP + 0),y 
3bc2 : a9 1c __ LDA #$1c
3bc4 : 8d 00 d6 STA $d600 
.l1525:
3bc7 : 2c 00 d6 BIT $d600 
3bca : 10 fb __ BPL $3bc7 ; (vdc_set_mode.l1525 + 0)
.s39:
3bcc : ad 01 d6 LDA $d601 
3bcf : a0 04 __ LDY #$04
3bd1 : 91 23 __ STA (SP + 0),y 
3bd3 : a9 00 __ LDA #$00
3bd5 : c8 __ __ INY
3bd6 : 91 23 __ STA (SP + 0),y 
3bd8 : a5 57 __ LDA T5 + 0 
3bda : c8 __ __ INY
3bdb : 91 23 __ STA (SP + 0),y 
3bdd : a9 00 __ LDA #$00
3bdf : c8 __ __ INY
3be0 : 91 23 __ STA (SP + 0),y 
3be2 : 20 3a 33 JSR $333a ; (printf.s1000 + 0)
3be5 : a9 1c __ LDA #$1c
3be7 : 8d 00 d6 STA $d600 
3bea : a5 56 __ LDA T4 + 1 
3bec : 29 e0 __ AND #$e0
3bee : 18 __ __ CLC
3bef : 65 57 __ ADC T5 + 0 
.l1527:
3bf1 : 2c 00 d6 BIT $d600 
3bf4 : 10 fb __ BPL $3bf1 ; (vdc_set_mode.l1527 + 0)
.s46:
3bf6 : 8d 01 d6 STA $d601 
3bf9 : 18 __ __ CLC
3bfa : a9 64 __ LDA #$64
3bfc : 65 50 __ ADC T2 + 0 
3bfe : 85 50 __ STA T2 + 0 
3c00 : a9 47 __ LDA #$47
3c02 : 69 00 __ ADC #$00
3c04 : 85 51 __ STA T2 + 1 
.l47:
3c06 : a4 4f __ LDY T0 + 0 
3c08 : b1 50 __ LDA (T2 + 0),y 
3c0a : 85 46 __ STA T7 + 0 
3c0c : c8 __ __ INY
3c0d : b1 50 __ LDA (T2 + 0),y 
3c0f : aa __ __ TAX
3c10 : a5 46 __ LDA T7 + 0 
3c12 : 8d 00 d6 STA $d600 
3c15 : c8 __ __ INY
3c16 : 84 4f __ STY T0 + 0 
.l1529:
3c18 : 2c 00 d6 BIT $d600 
3c1b : 10 fb __ BPL $3c18 ; (vdc_set_mode.l1529 + 0)
.s53:
3c1d : 8e 01 d6 STX $d601 
3c20 : 18 __ __ CLC
3c21 : a5 53 __ LDA T3 + 0 
3c23 : 65 4f __ ADC T0 + 0 
3c25 : 85 55 __ STA T4 + 0 
3c27 : a5 54 __ LDA T3 + 1 
3c29 : 69 00 __ ADC #$00
3c2b : 85 56 __ STA T4 + 1 
3c2d : a0 13 __ LDY #$13
3c2f : b1 55 __ LDA (T4 + 0),y 
3c31 : c9 ff __ CMP #$ff
3c33 : d0 d1 __ BNE $3c06 ; (vdc_set_mode.l47 + 0)
.s48:
3c35 : a0 04 __ LDY #$04
3c37 : b1 53 __ LDA (T3 + 0),y 
3c39 : f0 05 __ BEQ $3c40 ; (vdc_set_mode.s55 + 0)
.s57:
3c3b : ad d1 46 LDA $46d1 ; (vdc_state + 1)
3c3e : f0 11 __ BEQ $3c51 ; (vdc_set_mode.s54 + 0)
.s55:
3c40 : a9 00 __ LDA #$00
3c42 : 85 4f __ STA T0 + 0 
3c44 : ad d3 46 LDA $46d3 ; (vdc_state + 3)
3c47 : 85 50 __ STA T2 + 0 
3c49 : ad d5 46 LDA $46d5 ; (vdc_state + 5)
3c4c : 85 53 __ STA T3 + 0 
3c4e : 4c 65 3e JMP $3e65 ; (vdc_set_mode.l236 + 0)
.s54:
3c51 : ad d0 46 LDA $46d0 ; (vdc_state + 0)
3c54 : c9 10 __ CMP #$10
3c56 : d0 03 __ BNE $3c5b ; (vdc_set_mode.s62 + 0)
3c58 : 4c 6f 3d JMP $3d6f ; (vdc_set_mode.s1001 + 0)
.s62:
3c5b : ad d1 46 LDA $46d1 ; (vdc_state + 1)
3c5e : f0 03 __ BEQ $3c63 ; (vdc_set_mode.s61 + 0)
3c60 : 4c 6f 3d JMP $3d6f ; (vdc_set_mode.s1001 + 0)
.s61:
3c63 : a9 22 __ LDA #$22
3c65 : 8d 00 d6 STA $d600 
.l1559:
3c68 : 2c 00 d6 BIT $d600 
3c6b : 10 fb __ BPL $3c68 ; (vdc_set_mode.l1559 + 0)
.s69:
3c6d : a9 80 __ LDA #$80
3c6f : 8d 01 d6 STA $d601 
3c72 : a0 ff __ LDY #$ff
3c74 : a2 00 __ LDX #$00
.l72:
3c76 : a9 12 __ LDA #$12
3c78 : 8d 00 d6 STA $d600 
.l1561:
3c7b : 2c 00 d6 BIT $d600 
3c7e : 10 fb __ BPL $3c7b ; (vdc_set_mode.l1561 + 0)
.s81:
3c80 : 8e 01 d6 STX $d601 
3c83 : a9 13 __ LDA #$13
3c85 : 8d 00 d6 STA $d600 
.l1563:
3c88 : 2c 00 d6 BIT $d600 
3c8b : 10 fb __ BPL $3c88 ; (vdc_set_mode.l1563 + 0)
.s86:
3c8d : a9 00 __ LDA #$00
3c8f : 8d 01 d6 STA $d601 
3c92 : a9 1f __ LDA #$1f
3c94 : 8d 00 d6 STA $d600 
.l1565:
3c97 : 2c 00 d6 BIT $d600 
3c9a : 10 fb __ BPL $3c97 ; (vdc_set_mode.l1565 + 0)
.s90:
3c9c : a9 00 __ LDA #$00
3c9e : 8d 01 d6 STA $d601 
3ca1 : a9 18 __ LDA #$18
3ca3 : 8d 00 d6 STA $d600 
.l1567:
3ca6 : 2c 00 d6 BIT $d600 
3ca9 : 10 fb __ BPL $3ca6 ; (vdc_set_mode.l1567 + 0)
.s96:
3cab : ad 01 d6 LDA $d601 
3cae : 29 7f __ AND #$7f
3cb0 : 85 53 __ STA T3 + 0 
3cb2 : a9 18 __ LDA #$18
3cb4 : 8d 00 d6 STA $d600 
.l1569:
3cb7 : 2c 00 d6 BIT $d600 
3cba : 10 fb __ BPL $3cb7 ; (vdc_set_mode.l1569 + 0)
.s102:
3cbc : a5 53 __ LDA T3 + 0 
3cbe : 8d 01 d6 STA $d601 
3cc1 : a9 1e __ LDA #$1e
3cc3 : 8d 00 d6 STA $d600 
.l1571:
3cc6 : 2c 00 d6 BIT $d600 
3cc9 : 10 fb __ BPL $3cc6 ; (vdc_set_mode.l1571 + 0)
.s107:
3ccb : a9 ff __ LDA #$ff
3ccd : 8d 01 d6 STA $d601 
3cd0 : e8 __ __ INX
3cd1 : 88 __ __ DEY
3cd2 : d0 a2 __ BNE $3c76 ; (vdc_set_mode.l72 + 0)
.s74:
3cd4 : a9 12 __ LDA #$12
3cd6 : 8d 00 d6 STA $d600 
.l1574:
3cd9 : 2c 00 d6 BIT $d600 
3cdc : 10 fb __ BPL $3cd9 ; (vdc_set_mode.l1574 + 0)
.s114:
3cde : 8e 01 d6 STX $d601 
3ce1 : a9 13 __ LDA #$13
3ce3 : 8d 00 d6 STA $d600 
.l1576:
3ce6 : 2c 00 d6 BIT $d600 
3ce9 : 10 fb __ BPL $3ce6 ; (vdc_set_mode.l1576 + 0)
.s119:
3ceb : 8c 01 d6 STY $d601 
3cee : a9 1f __ LDA #$1f
3cf0 : 8d 00 d6 STA $d600 
.l1578:
3cf3 : 2c 00 d6 BIT $d600 
3cf6 : 10 fb __ BPL $3cf3 ; (vdc_set_mode.l1578 + 0)
.s123:
3cf8 : 8c 01 d6 STY $d601 
3cfb : a9 18 __ LDA #$18
3cfd : 8d 00 d6 STA $d600 
.l1580:
3d00 : 2c 00 d6 BIT $d600 
3d03 : 10 fb __ BPL $3d00 ; (vdc_set_mode.l1580 + 0)
.s129:
3d05 : ad 01 d6 LDA $d601 
3d08 : 29 7f __ AND #$7f
3d0a : aa __ __ TAX
3d0b : a9 18 __ LDA #$18
3d0d : 8d 00 d6 STA $d600 
.l1582:
3d10 : 2c 00 d6 BIT $d600 
3d13 : 10 fb __ BPL $3d10 ; (vdc_set_mode.l1582 + 0)
.s135:
3d15 : 8e 01 d6 STX $d601 
3d18 : a9 1e __ LDA #$1e
3d1a : 8d 00 d6 STA $d600 
.l1584:
3d1d : 2c 00 d6 BIT $d600 
3d20 : 10 fb __ BPL $3d1d ; (vdc_set_mode.l1584 + 0)
.s140:
3d22 : a9 ff __ LDA #$ff
3d24 : 8d 01 d6 STA $d601 
3d27 : a9 1c __ LDA #$1c
3d29 : 8d 00 d6 STA $d600 
.l1586:
3d2c : 2c 00 d6 BIT $d600 
3d2f : 10 fb __ BPL $3d2c ; (vdc_set_mode.l1586 + 0)
.s146:
3d31 : ad 01 d6 LDA $d601 
3d34 : 09 10 __ ORA #$10
3d36 : aa __ __ TAX
3d37 : a9 1c __ LDA #$1c
3d39 : 8d 00 d6 STA $d600 
.l1588:
3d3c : 2c 00 d6 BIT $d600 
3d3f : 10 fb __ BPL $3d3c ; (vdc_set_mode.l1588 + 0)
.s152:
3d41 : 8e 01 d6 STX $d601 
3d44 : 20 56 3f JSR $3f56 ; (vdc_restore_charsets.s0 + 0)
3d47 : a9 00 __ LDA #$00
3d49 : 85 4f __ STA T0 + 0 
3d4b : ad d3 46 LDA $46d3 ; (vdc_state + 3)
3d4e : 85 50 __ STA T2 + 0 
3d50 : ad d5 46 LDA $46d5 ; (vdc_state + 5)
3d53 : 85 53 __ STA T3 + 0 
.l155:
3d55 : a5 4f __ LDA T0 + 0 
3d57 : c5 53 __ CMP T3 + 0 
3d59 : 90 2a __ BCC $3d85 ; (vdc_set_mode.s156 + 0)
.s153:
3d5b : a9 22 __ LDA #$22
3d5d : 8d 00 d6 STA $d600 
.l1614:
3d60 : 2c 00 d6 BIT $d600 
3d63 : 10 fb __ BPL $3d60 ; (vdc_set_mode.l1614 + 0)
.s233:
3d65 : a9 7d __ LDA #$7d
3d67 : 8d 01 d6 STA $d601 
3d6a : a9 01 __ LDA #$01
3d6c : 8d d1 46 STA $46d1 ; (vdc_state + 1)
.s1001:
3d6f : 18 __ __ CLC
3d70 : a5 23 __ LDA SP + 0 
3d72 : 69 08 __ ADC #$08
3d74 : 85 23 __ STA SP + 0 
3d76 : 90 02 __ BCC $3d7a ; (vdc_set_mode.s1001 + 11)
3d78 : e6 24 __ INC SP + 1 
3d7a : a2 04 __ LDX #$04
3d7c : bd ac bf LDA $bfac,x ; (vdc_set_mode@stack + 0)
3d7f : 95 53 __ STA T3 + 0,x 
3d81 : ca __ __ DEX
3d82 : 10 f8 __ BPL $3d7c ; (vdc_set_mode.s1001 + 13)
3d84 : 60 __ __ RTS
.s156:
3d85 : ad d3 46 LDA $46d3 ; (vdc_state + 3)
3d88 : 85 1b __ STA ACCU + 0 
3d8a : ad d4 46 LDA $46d4 ; (vdc_state + 4)
3d8d : 85 1c __ STA ACCU + 1 
3d8f : ad d7 46 LDA $46d7 ; (vdc_state + 7)
3d92 : 85 43 __ STA T1 + 0 
3d94 : a9 12 __ LDA #$12
3d96 : 8d 00 d6 STA $d600 
3d99 : a6 50 __ LDX T2 + 0 
3d9b : ca __ __ DEX
3d9c : 86 44 __ STX T6 + 0 
3d9e : a5 4f __ LDA T0 + 0 
3da0 : 20 84 45 JSR $4584 ; (mul16by8 + 0)
3da3 : 18 __ __ CLC
3da4 : a5 05 __ LDA WORK + 2 
3da6 : 6d d8 46 ADC $46d8 ; (vdc_state + 8)
3da9 : aa __ __ TAX
3daa : a5 06 __ LDA WORK + 3 
3dac : 6d d9 46 ADC $46d9 ; (vdc_state + 9)
.l1590:
3daf : 2c 00 d6 BIT $d600 
3db2 : 10 fb __ BPL $3daf ; (vdc_set_mode.l1590 + 0)
.s168:
3db4 : 8d 01 d6 STA $d601 
3db7 : a9 13 __ LDA #$13
3db9 : 8d 00 d6 STA $d600 
.l1592:
3dbc : 2c 00 d6 BIT $d600 
3dbf : 10 fb __ BPL $3dbc ; (vdc_set_mode.l1592 + 0)
.s173:
3dc1 : 8e 01 d6 STX $d601 
3dc4 : a9 1f __ LDA #$1f
3dc6 : 8d 00 d6 STA $d600 
.l1594:
3dc9 : 2c 00 d6 BIT $d600 
3dcc : 10 fb __ BPL $3dc9 ; (vdc_set_mode.l1594 + 0)
.s177:
3dce : a9 20 __ LDA #$20
3dd0 : 8d 01 d6 STA $d601 
3dd3 : a9 18 __ LDA #$18
3dd5 : 8d 00 d6 STA $d600 
.l1596:
3dd8 : 2c 00 d6 BIT $d600 
3ddb : 10 fb __ BPL $3dd8 ; (vdc_set_mode.l1596 + 0)
.s183:
3ddd : ad 01 d6 LDA $d601 
3de0 : 29 7f __ AND #$7f
3de2 : aa __ __ TAX
3de3 : a9 18 __ LDA #$18
3de5 : 8d 00 d6 STA $d600 
.l1598:
3de8 : 2c 00 d6 BIT $d600 
3deb : 10 fb __ BPL $3de8 ; (vdc_set_mode.l1598 + 0)
.s189:
3ded : 8e 01 d6 STX $d601 
3df0 : a9 1e __ LDA #$1e
3df2 : 8d 00 d6 STA $d600 
.l1600:
3df5 : 2c 00 d6 BIT $d600 
3df8 : 10 fb __ BPL $3df5 ; (vdc_set_mode.l1600 + 0)
.s194:
3dfa : a5 44 __ LDA T6 + 0 
3dfc : 8d 01 d6 STA $d601 
3dff : ad da 46 LDA $46da ; (vdc_state + 10)
3e02 : 18 __ __ CLC
3e03 : 65 05 __ ADC WORK + 2 
3e05 : aa __ __ TAX
3e06 : a9 12 __ LDA #$12
3e08 : 8d 00 d6 STA $d600 
3e0b : ad db 46 LDA $46db ; (vdc_state + 11)
3e0e : 65 06 __ ADC WORK + 3 
.l1602:
3e10 : 2c 00 d6 BIT $d600 
3e13 : 10 fb __ BPL $3e10 ; (vdc_set_mode.l1602 + 0)
.s201:
3e15 : 8d 01 d6 STA $d601 
3e18 : a9 13 __ LDA #$13
3e1a : 8d 00 d6 STA $d600 
.l1604:
3e1d : 2c 00 d6 BIT $d600 
3e20 : 10 fb __ BPL $3e1d ; (vdc_set_mode.l1604 + 0)
.s206:
3e22 : 8e 01 d6 STX $d601 
3e25 : a9 1f __ LDA #$1f
3e27 : 8d 00 d6 STA $d600 
.l1606:
3e2a : 2c 00 d6 BIT $d600 
3e2d : 10 fb __ BPL $3e2a ; (vdc_set_mode.l1606 + 0)
.s210:
3e2f : a5 43 __ LDA T1 + 0 
3e31 : 8d 01 d6 STA $d601 
3e34 : a9 18 __ LDA #$18
3e36 : 8d 00 d6 STA $d600 
.l1608:
3e39 : 2c 00 d6 BIT $d600 
3e3c : 10 fb __ BPL $3e39 ; (vdc_set_mode.l1608 + 0)
.s216:
3e3e : ad 01 d6 LDA $d601 
3e41 : 29 7f __ AND #$7f
3e43 : aa __ __ TAX
3e44 : a9 18 __ LDA #$18
3e46 : 8d 00 d6 STA $d600 
.l1610:
3e49 : 2c 00 d6 BIT $d600 
3e4c : 10 fb __ BPL $3e49 ; (vdc_set_mode.l1610 + 0)
.s222:
3e4e : 8e 01 d6 STX $d601 
3e51 : a9 1e __ LDA #$1e
3e53 : 8d 00 d6 STA $d600 
.l1612:
3e56 : 2c 00 d6 BIT $d600 
3e59 : 10 fb __ BPL $3e56 ; (vdc_set_mode.l1612 + 0)
.s227:
3e5b : a5 44 __ LDA T6 + 0 
3e5d : 8d 01 d6 STA $d601 
3e60 : e6 4f __ INC T0 + 0 
3e62 : 4c 55 3d JMP $3d55 ; (vdc_set_mode.l155 + 0)
.l236:
3e65 : a5 4f __ LDA T0 + 0 
3e67 : c5 53 __ CMP T3 + 0 
3e69 : 90 03 __ BCC $3e6e ; (vdc_set_mode.s237 + 0)
3e6b : 4c 6f 3d JMP $3d6f ; (vdc_set_mode.s1001 + 0)
.s237:
3e6e : ad d3 46 LDA $46d3 ; (vdc_state + 3)
3e71 : 85 1b __ STA ACCU + 0 
3e73 : ad d4 46 LDA $46d4 ; (vdc_state + 4)
3e76 : 85 1c __ STA ACCU + 1 
3e78 : ad d7 46 LDA $46d7 ; (vdc_state + 7)
3e7b : 85 43 __ STA T1 + 0 
3e7d : a9 12 __ LDA #$12
3e7f : 8d 00 d6 STA $d600 
3e82 : a6 50 __ LDX T2 + 0 
3e84 : ca __ __ DEX
3e85 : 86 44 __ STX T6 + 0 
3e87 : a5 4f __ LDA T0 + 0 
3e89 : 20 84 45 JSR $4584 ; (mul16by8 + 0)
3e8c : 18 __ __ CLC
3e8d : a5 05 __ LDA WORK + 2 
3e8f : 6d d8 46 ADC $46d8 ; (vdc_state + 8)
3e92 : aa __ __ TAX
3e93 : a5 06 __ LDA WORK + 3 
3e95 : 6d d9 46 ADC $46d9 ; (vdc_state + 9)
.l1534:
3e98 : 2c 00 d6 BIT $d600 
3e9b : 10 fb __ BPL $3e98 ; (vdc_set_mode.l1534 + 0)
.s249:
3e9d : 8d 01 d6 STA $d601 
3ea0 : a9 13 __ LDA #$13
3ea2 : 8d 00 d6 STA $d600 
.l1536:
3ea5 : 2c 00 d6 BIT $d600 
3ea8 : 10 fb __ BPL $3ea5 ; (vdc_set_mode.l1536 + 0)
.s254:
3eaa : 8e 01 d6 STX $d601 
3ead : a9 1f __ LDA #$1f
3eaf : 8d 00 d6 STA $d600 
.l1538:
3eb2 : 2c 00 d6 BIT $d600 
3eb5 : 10 fb __ BPL $3eb2 ; (vdc_set_mode.l1538 + 0)
.s258:
3eb7 : a9 20 __ LDA #$20
3eb9 : 8d 01 d6 STA $d601 
3ebc : a9 18 __ LDA #$18
3ebe : 8d 00 d6 STA $d600 
.l1540:
3ec1 : 2c 00 d6 BIT $d600 
3ec4 : 10 fb __ BPL $3ec1 ; (vdc_set_mode.l1540 + 0)
.s264:
3ec6 : ad 01 d6 LDA $d601 
3ec9 : 29 7f __ AND #$7f
3ecb : aa __ __ TAX
3ecc : a9 18 __ LDA #$18
3ece : 8d 00 d6 STA $d600 
.l1542:
3ed1 : 2c 00 d6 BIT $d600 
3ed4 : 10 fb __ BPL $3ed1 ; (vdc_set_mode.l1542 + 0)
.s270:
3ed6 : 8e 01 d6 STX $d601 
3ed9 : a9 1e __ LDA #$1e
3edb : 8d 00 d6 STA $d600 
.l1544:
3ede : 2c 00 d6 BIT $d600 
3ee1 : 10 fb __ BPL $3ede ; (vdc_set_mode.l1544 + 0)
.s275:
3ee3 : a5 44 __ LDA T6 + 0 
3ee5 : 8d 01 d6 STA $d601 
3ee8 : ad da 46 LDA $46da ; (vdc_state + 10)
3eeb : 18 __ __ CLC
3eec : 65 05 __ ADC WORK + 2 
3eee : aa __ __ TAX
3eef : a9 12 __ LDA #$12
3ef1 : 8d 00 d6 STA $d600 
3ef4 : ad db 46 LDA $46db ; (vdc_state + 11)
3ef7 : 65 06 __ ADC WORK + 3 
.l1546:
3ef9 : 2c 00 d6 BIT $d600 
3efc : 10 fb __ BPL $3ef9 ; (vdc_set_mode.l1546 + 0)
.s282:
3efe : 8d 01 d6 STA $d601 
3f01 : a9 13 __ LDA #$13
3f03 : 8d 00 d6 STA $d600 
.l1548:
3f06 : 2c 00 d6 BIT $d600 
3f09 : 10 fb __ BPL $3f06 ; (vdc_set_mode.l1548 + 0)
.s287:
3f0b : 8e 01 d6 STX $d601 
3f0e : a9 1f __ LDA #$1f
3f10 : 8d 00 d6 STA $d600 
.l1550:
3f13 : 2c 00 d6 BIT $d600 
3f16 : 10 fb __ BPL $3f13 ; (vdc_set_mode.l1550 + 0)
.s291:
3f18 : a5 43 __ LDA T1 + 0 
3f1a : 8d 01 d6 STA $d601 
3f1d : a9 18 __ LDA #$18
3f1f : 8d 00 d6 STA $d600 
.l1552:
3f22 : 2c 00 d6 BIT $d600 
3f25 : 10 fb __ BPL $3f22 ; (vdc_set_mode.l1552 + 0)
.s297:
3f27 : ad 01 d6 LDA $d601 
3f2a : 29 7f __ AND #$7f
3f2c : aa __ __ TAX
3f2d : a9 18 __ LDA #$18
3f2f : 8d 00 d6 STA $d600 
.l1554:
3f32 : 2c 00 d6 BIT $d600 
3f35 : 10 fb __ BPL $3f32 ; (vdc_set_mode.l1554 + 0)
.s303:
3f37 : 8e 01 d6 STX $d601 
3f3a : a9 1e __ LDA #$1e
3f3c : 8d 00 d6 STA $d600 
.l1556:
3f3f : 2c 00 d6 BIT $d600 
3f42 : 10 fb __ BPL $3f3f ; (vdc_set_mode.l1556 + 0)
.s308:
3f44 : a5 44 __ LDA T6 + 0 
3f46 : 8d 01 d6 STA $d601 
3f49 : e6 4f __ INC T0 + 0 
3f4b : 4c 65 3e JMP $3e65 ; (vdc_set_mode.l236 + 0)
--------------------------------------------------------------------
3f4e : __ __ __ BYT 25 32 78 20 25 32 78 00                         : %2x %2x.
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
3f56 : 20 62 ff JSR $ff62 
.s1001:
3f59 : 60 __ __ RTS
--------------------------------------------------------------------
3f5a : __ __ __ BYT 0a 0d 4c 4f 41 44 49 4e 47 20 41 53 53 45 54 53 : ..LOADING ASSETS
3f6a : __ __ __ BYT 3a 0a 00                                        : :..
--------------------------------------------------------------------
3f6d : __ __ __ BYT 2d 20 53 43 52 45 45 4e 53 0a 00                : - SCREENS..
--------------------------------------------------------------------
3f78 : __ __ __ BYT 53 43 52 45 45 4e 00                            : SCREEN.
--------------------------------------------------------------------
3f7f : __ __ __ BYT 4c 4f 41 44 20 45 52 52 4f 52 2e 0a 0d 00       : LOAD ERROR....
--------------------------------------------------------------------
3f8d : __ __ __ BYT 2d 20 53 54 41 4e 44 41 52 44 20 43 48 41 52 53 : - STANDARD CHARS
3f9d : __ __ __ BYT 45 54 0a 00                                     : ET..
--------------------------------------------------------------------
3fa1 : __ __ __ BYT 43 48 41 52 53 54 44 00                         : CHARSTD.
--------------------------------------------------------------------
3fa9 : __ __ __ BYT 2d 20 41 4c 54 45 52 4e 41 54 45 20 43 48 41 52 : - ALTERNATE CHAR
3fb9 : __ __ __ BYT 53 45 54 0a 00                                  : SET..
--------------------------------------------------------------------
3fbe : __ __ __ BYT 43 48 41 52 41 4c 54 00                         : CHARALT.
--------------------------------------------------------------------
3fc6 : __ __ __ BYT 57 52 49 54 45 20 44 41 54 41 2e 0a 00          : WRITE DATA...
--------------------------------------------------------------------
3fd3 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 4f 50 45 : RETURN VALUE OPE
3fe3 : __ __ __ BYT 4e 3a 20 25 44 0a 00                            : N: %D..
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
.s0:
3fea : a9 00 __ LDA #$00
3fec : 8d e7 46 STA $46e7 ; (krnio_pstatus + 1)
3fef : a9 00 __ LDA #$00
3ff1 : 85 1b __ STA ACCU + 0 
3ff3 : 85 1c __ STA ACCU + 1 
3ff5 : a5 0d __ LDA P0 
3ff7 : a6 0e __ LDX P1 
3ff9 : a4 0f __ LDY P2 
3ffb : 20 ba ff JSR $ffba 
3ffe : 20 c0 ff JSR $ffc0 
4001 : 90 08 __ BCC $400b ; (krnio_open.s0 + 33)
4003 : a5 0d __ LDA P0 
4005 : 20 c3 ff JSR $ffc3 
4008 : 4c 0f 40 JMP $400f ; (krnio_open.s1001 + 0)
400b : a9 01 __ LDA #$01
400d : 85 1b __ STA ACCU + 0 
.s1001:
400f : a5 1b __ LDA ACCU + 0 
4011 : 60 __ __ RTS
--------------------------------------------------------------------
4012 : __ __ __ BYT 53 54 41 54 55 53 20 41 46 54 45 52 20 4f 50 45 : STATUS AFTER OPE
4022 : __ __ __ BYT 4e 3a 20 25 44 0a 00                            : N: %D..
--------------------------------------------------------------------
4029 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 57 52 49 : RETURN VALUE WRI
4039 : __ __ __ BYT 54 45 3a 20 25 44 0a 00                         : TE: %D..
--------------------------------------------------------------------
krnio_chkout: ; krnio_chkout(u8)->bool
.s1000:
4041 : 85 0d __ STA P0 
.s0:
4043 : a6 0d __ LDX P0 
4045 : 20 c9 ff JSR $ffc9 
4048 : a9 00 __ LDA #$00
404a : b0 02 __ BCS $404e ; (krnio_chkout.s0 + 11)
404c : a9 01 __ LDA #$01
404e : 85 1b __ STA ACCU + 0 
.s1001:
4050 : a5 1b __ LDA ACCU + 0 
4052 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrout: ; krnio_chrout(u8)->void
.s1000:
4053 : 85 0d __ STA P0 
.s0:
4055 : a5 0d __ LDA P0 
4057 : 20 d2 ff JSR $ffd2 
405a : 85 1b __ STA ACCU + 0 
405c : a9 00 __ LDA #$00
405e : 85 1c __ STA ACCU + 1 
.s1001:
4060 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
.s0:
4061 : 20 cc ff JSR $ffcc 
.s1001:
4064 : 60 __ __ RTS
--------------------------------------------------------------------
4065 : __ __ __ BYT 53 54 41 54 55 53 20 41 46 54 45 52 20 57 52 49 : STATUS AFTER WRI
4075 : __ __ __ BYT 54 45 3a 20 25 44 0a 00                         : TE: %D..
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
.s1000:
407d : 85 0d __ STA P0 
.s0:
407f : a5 0d __ LDA P0 
4081 : 20 c3 ff JSR $ffc3 
.s1001:
4084 : 60 __ __ RTS
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
4085 : a9 5b __ LDA #$5b
4087 : 85 0d __ STA P0 
4089 : a9 bf __ LDA #$bf
408b : 85 0e __ STA P1 
408d : a9 51 __ LDA #$51
408f : 85 11 __ STA P4 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
.s0:
4091 : a5 0f __ LDA P2 
4093 : a6 12 __ LDX P5 
4095 : f0 0c __ BEQ $40a3 ; (memset.s0 + 18)
4097 : a0 00 __ LDY #$00
4099 : 91 0d __ STA (P0),y 
409b : c8 __ __ INY
409c : d0 fb __ BNE $4099 ; (memset.s0 + 8)
409e : e6 0e __ INC P1 
40a0 : ca __ __ DEX
40a1 : d0 f6 __ BNE $4099 ; (memset.s0 + 8)
40a3 : a4 11 __ LDY P4 
40a5 : f0 05 __ BEQ $40ac ; (memset.s1001 + 0)
40a7 : 88 __ __ DEY
40a8 : 91 0d __ STA (P0),y 
40aa : d0 fb __ BNE $40a7 ; (memset.s0 + 22)
.s1001:
40ac : 60 __ __ RTS
--------------------------------------------------------------------
40ad : __ __ __ BYT 52 45 41 44 20 44 41 54 41 2e 0a 00             : READ DATA...
--------------------------------------------------------------------
40b9 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 52 45 41 : RETURN VALUE REA
40c9 : __ __ __ BYT 44 3a 20 25 44 0a 00                            : D: %D..
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
.s1000:
40d0 : 85 0d __ STA P0 
.s0:
40d2 : a6 0d __ LDX P0 
40d4 : 20 c6 ff JSR $ffc6 
40d7 : a9 00 __ LDA #$00
40d9 : 85 1c __ STA ACCU + 1 
40db : b0 02 __ BCS $40df ; (krnio_chkin.s0 + 13)
40dd : a9 01 __ LDA #$01
40df : 85 1b __ STA ACCU + 0 
.s1001:
40e1 : a5 1b __ LDA ACCU + 0 
40e3 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->i16
.s0:
40e4 : 20 cf ff JSR $ffcf 
40e7 : 85 1b __ STA ACCU + 0 
40e9 : a9 00 __ LDA #$00
40eb : 85 1c __ STA ACCU + 1 
.s1001:
40ed : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
.s0:
40ee : 20 b7 ff JSR $ffb7 
40f1 : 85 1b __ STA ACCU + 0 
40f3 : a9 00 __ LDA #$00
40f5 : 85 1c __ STA ACCU + 1 
.s1001:
40f7 : a5 1b __ LDA ACCU + 0 
40f9 : 60 __ __ RTS
--------------------------------------------------------------------
40fa : __ __ __ BYT 54 45 53 54 32 00                               : TEST2.
--------------------------------------------------------------------
4100 : __ __ __ BYT 53 54 41 54 55 53 20 41 46 54 45 52 20 52 45 41 : STATUS AFTER REA
4110 : __ __ __ BYT 44 3a 20 25 44 0a 00                            : D: %D..
--------------------------------------------------------------------
4117 : __ __ __ BYT 44 41 54 41 20 52 45 41 44 3a 0a 25 53 0a 00    : DATA READ:.%S..
--------------------------------------------------------------------
4126 : __ __ __ BYT 4e 4f 57 20 41 20 53 41 56 45 20 41 4e 44 20 4c : NOW A SAVE AND L
4136 : __ __ __ BYT 4f 41 44 20 54 45 53 54 2e 00                   : OAD TEST..
--------------------------------------------------------------------
4140 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 53 41 56 : RETURN VALUE SAV
4150 : __ __ __ BYT 45 3a 20 25 44 0a 00                            : E: %D..
--------------------------------------------------------------------
krnio_save: ; krnio_save(u8,const u8*,const u8*)->bool
.s0:
4157 : a9 00 __ LDA #$00
4159 : a6 0d __ LDX P0 
415b : a0 00 __ LDY #$00
415d : 20 ba ff JSR $ffba 
4160 : a9 0e __ LDA #$0e
4162 : a6 10 __ LDX P3 
4164 : a4 11 __ LDY P4 
4166 : 20 d8 ff JSR $ffd8 
4169 : a9 00 __ LDA #$00
416b : b0 02 __ BCS $416f ; (krnio_save.s0 + 24)
416d : a9 01 __ LDA #$01
416f : 85 1b __ STA ACCU + 0 
.s1001:
4171 : a5 1b __ LDA ACCU + 0 
4173 : 60 __ __ RTS
--------------------------------------------------------------------
4174 : __ __ __ BYT 4c 4f 41 44 20 44 41 54 41 2e 0a 00             : LOAD DATA...
--------------------------------------------------------------------
4180 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 4c 4f 41 : RETURN VALUE LOA
4190 : __ __ __ BYT 44 3a 20 25 44 0a 00                            : D: %D..
--------------------------------------------------------------------
4197 : __ __ __ BYT 43 4f 50 59 20 54 45 53 54 49 4e 47 2e 00       : COPY TESTING..
--------------------------------------------------------------------
41a5 : __ __ __ BYT 0a 0d 57 52 49 54 45 20 42 59 54 45 3a 20 25 32 : ..WRITE BYTE: %2
41b5 : __ __ __ BYT 78 20 52 45 41 44 20 42 59 54 45 3a 20 25 32 78 : x READ BYTE: %2x
41c5 : __ __ __ BYT 0a 00                                           : ..
--------------------------------------------------------------------
41c7 : __ __ __ BYT 57 52 49 54 45 20 57 4f 52 44 3a 20 25 34 78 20 : WRITE WORD: %4x 
41d7 : __ __ __ BYT 52 45 41 44 20 57 4f 52 44 3a 20 25 34 78 0a 00 : READ WORD: %4x..
--------------------------------------------------------------------
41e7 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 44 45 4d 4f : oSCAR64 vdc DEMO
41f7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
41f8 : __ __ __ BYT 6f 4e 20 00                                     : oN .
--------------------------------------------------------------------
41fc : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
4200 : __ __ __ BYT 57 52 49 54 45 20 53 54 52 49 4e 47 3a 20 25 53 : WRITE STRING: %S
4210 : __ __ __ BYT 0a 52 45 41 44 20 53 54 52 49 4e 47 3a 20 25 53 : .READ STRING: %S
4220 : __ __ __ BYT 0a 00                                           : ..
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
4222 : a2 03 __ LDX #$03
4224 : b5 53 __ LDA T8 + 0,x 
4226 : 9d e4 bf STA $bfe4,x ; (buff + 38)
4229 : ca __ __ DEX
422a : 10 f8 __ BPL $4224 ; (sprintf.s1000 + 2)
.s0:
422c : 18 __ __ CLC
422d : a5 23 __ LDA SP + 0 
422f : 69 06 __ ADC #$06
4231 : 85 47 __ STA T0 + 0 
4233 : a5 24 __ LDA SP + 1 
4235 : 69 00 __ ADC #$00
4237 : 85 48 __ STA T0 + 1 
4239 : a9 00 __ LDA #$00
423b : 85 43 __ STA T1 + 0 
423d : a0 04 __ LDY #$04
423f : b1 23 __ LDA (SP + 0),y 
4241 : 85 49 __ STA T2 + 0 
4243 : c8 __ __ INY
4244 : b1 23 __ LDA (SP + 0),y 
4246 : 85 4a __ STA T2 + 1 
4248 : a0 02 __ LDY #$02
424a : b1 23 __ LDA (SP + 0),y 
424c : 85 4b __ STA T3 + 0 
424e : c8 __ __ INY
424f : b1 23 __ LDA (SP + 0),y 
4251 : 85 4c __ STA T3 + 1 
.l2:
4253 : a0 00 __ LDY #$00
4255 : b1 49 __ LDA (T2 + 0),y 
4257 : d0 0f __ BNE $4268 ; (sprintf.s3 + 0)
.s4:
4259 : a4 43 __ LDY T1 + 0 
425b : 91 4b __ STA (T3 + 0),y 
.s1001:
425d : a2 03 __ LDX #$03
425f : bd e4 bf LDA $bfe4,x ; (buff + 38)
4262 : 95 53 __ STA T8 + 0,x 
4264 : ca __ __ DEX
4265 : 10 f8 __ BPL $425f ; (sprintf.s1001 + 2)
4267 : 60 __ __ RTS
.s3:
4268 : c9 25 __ CMP #$25
426a : f0 22 __ BEQ $428e ; (sprintf.s5 + 0)
.s6:
426c : a4 43 __ LDY T1 + 0 
426e : 91 4b __ STA (T3 + 0),y 
4270 : e6 49 __ INC T2 + 0 
4272 : d0 02 __ BNE $4276 ; (sprintf.s1102 + 0)
.s1101:
4274 : e6 4a __ INC T2 + 1 
.s1102:
4276 : c8 __ __ INY
4277 : 84 43 __ STY T1 + 0 
4279 : 98 __ __ TYA
427a : c0 28 __ CPY #$28
427c : 90 d5 __ BCC $4253 ; (sprintf.l2 + 0)
.s111:
427e : 18 __ __ CLC
427f : 65 4b __ ADC T3 + 0 
4281 : 85 4b __ STA T3 + 0 
4283 : 90 02 __ BCC $4287 ; (sprintf.s1104 + 0)
.s1103:
4285 : e6 4c __ INC T3 + 1 
.s1104:
4287 : a9 00 __ LDA #$00
.s1068:
4289 : 85 43 __ STA T1 + 0 
428b : 4c 53 42 JMP $4253 ; (sprintf.l2 + 0)
.s5:
428e : 8c ec bf STY $bfec ; (buff + 46)
4291 : 8c ed bf STY $bfed ; (buff + 47)
4294 : 8c ee bf STY $bfee ; (buff + 48)
4297 : 8c ef bf STY $bfef ; (buff + 49)
429a : a9 0a __ LDA #$0a
429c : 8d eb bf STA $bfeb ; (buff + 45)
429f : a5 43 __ LDA T1 + 0 
42a1 : f0 0b __ BEQ $42ae ; (sprintf.s10 + 0)
.s8:
42a3 : 18 __ __ CLC
42a4 : 65 4b __ ADC T3 + 0 
42a6 : 85 4b __ STA T3 + 0 
42a8 : 90 02 __ BCC $42ac ; (sprintf.s1080 + 0)
.s1079:
42aa : e6 4c __ INC T3 + 1 
.s1080:
42ac : 84 43 __ STY T1 + 0 
.s10:
42ae : a0 01 __ LDY #$01
42b0 : b1 49 __ LDA (T2 + 0),y 
42b2 : aa __ __ TAX
42b3 : a9 20 __ LDA #$20
42b5 : 8d e8 bf STA $bfe8 ; (buff + 42)
42b8 : a9 00 __ LDA #$00
42ba : 8d e9 bf STA $bfe9 ; (buff + 43)
42bd : a9 ff __ LDA #$ff
42bf : 8d ea bf STA $bfea ; (buff + 44)
42c2 : 18 __ __ CLC
42c3 : a5 49 __ LDA T2 + 0 
42c5 : 69 02 __ ADC #$02
.l15:
42c7 : 85 49 __ STA T2 + 0 
42c9 : 90 02 __ BCC $42cd ; (sprintf.s1082 + 0)
.s1081:
42cb : e6 4a __ INC T2 + 1 
.s1082:
42cd : 8a __ __ TXA
42ce : e0 2b __ CPX #$2b
42d0 : d0 08 __ BNE $42da ; (sprintf.s18 + 0)
.s17:
42d2 : a9 01 __ LDA #$01
42d4 : 8d ed bf STA $bfed ; (buff + 47)
42d7 : 4c 3b 45 JMP $453b ; (sprintf.s260 + 0)
.s18:
42da : c9 30 __ CMP #$30
42dc : d0 06 __ BNE $42e4 ; (sprintf.s21 + 0)
.s20:
42de : 8d e8 bf STA $bfe8 ; (buff + 42)
42e1 : 4c 3b 45 JMP $453b ; (sprintf.s260 + 0)
.s21:
42e4 : e0 23 __ CPX #$23
42e6 : d0 08 __ BNE $42f0 ; (sprintf.s24 + 0)
.s23:
42e8 : a9 01 __ LDA #$01
42ea : 8d ef bf STA $bfef ; (buff + 49)
42ed : 4c 3b 45 JMP $453b ; (sprintf.s260 + 0)
.s24:
42f0 : e0 2d __ CPX #$2d
42f2 : d0 08 __ BNE $42fc ; (sprintf.s16 + 0)
.s26:
42f4 : a9 01 __ LDA #$01
42f6 : 8d ee bf STA $bfee ; (buff + 48)
42f9 : 4c 3b 45 JMP $453b ; (sprintf.s260 + 0)
.s16:
42fc : 85 45 __ STA T4 + 0 
42fe : e0 30 __ CPX #$30
4300 : 90 53 __ BCC $4355 ; (sprintf.s32 + 0)
.s33:
4302 : e0 3a __ CPX #$3a
4304 : b0 4f __ BCS $4355 ; (sprintf.s32 + 0)
.s30:
4306 : a9 00 __ LDA #$00
4308 : 85 4d __ STA T6 + 0 
430a : 85 4e __ STA T6 + 1 
430c : e0 3a __ CPX #$3a
430e : b0 40 __ BCS $4350 ; (sprintf.s36 + 0)
.l35:
4310 : a5 4d __ LDA T6 + 0 
4312 : 0a __ __ ASL
4313 : 85 1b __ STA ACCU + 0 
4315 : a5 4e __ LDA T6 + 1 
4317 : 2a __ __ ROL
4318 : 06 1b __ ASL ACCU + 0 
431a : 2a __ __ ROL
431b : aa __ __ TAX
431c : 18 __ __ CLC
431d : a5 1b __ LDA ACCU + 0 
431f : 65 4d __ ADC T6 + 0 
4321 : 85 4d __ STA T6 + 0 
4323 : 8a __ __ TXA
4324 : 65 4e __ ADC T6 + 1 
4326 : 06 4d __ ASL T6 + 0 
4328 : 2a __ __ ROL
4329 : aa __ __ TAX
432a : 18 __ __ CLC
432b : a5 4d __ LDA T6 + 0 
432d : 65 45 __ ADC T4 + 0 
432f : 90 01 __ BCC $4332 ; (sprintf.s1098 + 0)
.s1097:
4331 : e8 __ __ INX
.s1098:
4332 : 38 __ __ SEC
4333 : e9 30 __ SBC #$30
4335 : 85 4d __ STA T6 + 0 
4337 : 8a __ __ TXA
4338 : e9 00 __ SBC #$00
433a : 85 4e __ STA T6 + 1 
433c : a0 00 __ LDY #$00
433e : b1 49 __ LDA (T2 + 0),y 
4340 : 85 45 __ STA T4 + 0 
4342 : e6 49 __ INC T2 + 0 
4344 : d0 02 __ BNE $4348 ; (sprintf.s1100 + 0)
.s1099:
4346 : e6 4a __ INC T2 + 1 
.s1100:
4348 : c9 30 __ CMP #$30
434a : 90 04 __ BCC $4350 ; (sprintf.s36 + 0)
.s37:
434c : c9 3a __ CMP #$3a
434e : 90 c0 __ BCC $4310 ; (sprintf.l35 + 0)
.s36:
4350 : a5 4d __ LDA T6 + 0 
4352 : 8d e9 bf STA $bfe9 ; (buff + 43)
.s32:
4355 : a5 45 __ LDA T4 + 0 
4357 : c9 2e __ CMP #$2e
4359 : d0 51 __ BNE $43ac ; (sprintf.s40 + 0)
.s38:
435b : a9 00 __ LDA #$00
435d : 85 4d __ STA T6 + 0 
.l245:
435f : 85 4e __ STA T6 + 1 
4361 : a0 00 __ LDY #$00
4363 : b1 49 __ LDA (T2 + 0),y 
4365 : 85 45 __ STA T4 + 0 
4367 : e6 49 __ INC T2 + 0 
4369 : d0 02 __ BNE $436d ; (sprintf.s1084 + 0)
.s1083:
436b : e6 4a __ INC T2 + 1 
.s1084:
436d : c9 30 __ CMP #$30
436f : 90 04 __ BCC $4375 ; (sprintf.s43 + 0)
.s44:
4371 : c9 3a __ CMP #$3a
4373 : 90 0a __ BCC $437f ; (sprintf.s42 + 0)
.s43:
4375 : a5 4d __ LDA T6 + 0 
4377 : 8d ea bf STA $bfea ; (buff + 44)
437a : a5 45 __ LDA T4 + 0 
437c : 4c ac 43 JMP $43ac ; (sprintf.s40 + 0)
.s42:
437f : a5 4d __ LDA T6 + 0 
4381 : 0a __ __ ASL
4382 : 85 1b __ STA ACCU + 0 
4384 : a5 4e __ LDA T6 + 1 
4386 : 2a __ __ ROL
4387 : 06 1b __ ASL ACCU + 0 
4389 : 2a __ __ ROL
438a : aa __ __ TAX
438b : 18 __ __ CLC
438c : a5 1b __ LDA ACCU + 0 
438e : 65 4d __ ADC T6 + 0 
4390 : 85 4d __ STA T6 + 0 
4392 : 8a __ __ TXA
4393 : 65 4e __ ADC T6 + 1 
4395 : 06 4d __ ASL T6 + 0 
4397 : 2a __ __ ROL
4398 : aa __ __ TAX
4399 : 18 __ __ CLC
439a : a5 4d __ LDA T6 + 0 
439c : 65 45 __ ADC T4 + 0 
439e : 90 01 __ BCC $43a1 ; (sprintf.s1096 + 0)
.s1095:
43a0 : e8 __ __ INX
.s1096:
43a1 : 38 __ __ SEC
43a2 : e9 30 __ SBC #$30
43a4 : 85 4d __ STA T6 + 0 
43a6 : 8a __ __ TXA
43a7 : e9 00 __ SBC #$00
43a9 : 4c 5f 43 JMP $435f ; (sprintf.l245 + 0)
.s40:
43ac : c9 64 __ CMP #$64
43ae : f0 04 __ BEQ $43b4 ; (sprintf.s45 + 0)
.s48:
43b0 : c9 44 __ CMP #$44
43b2 : d0 05 __ BNE $43b9 ; (sprintf.s46 + 0)
.s45:
43b4 : a9 01 __ LDA #$01
43b6 : 4c 14 45 JMP $4514 ; (sprintf.s261 + 0)
.s46:
43b9 : c9 75 __ CMP #$75
43bb : d0 03 __ BNE $43c0 ; (sprintf.s52 + 0)
43bd : 4c 12 45 JMP $4512 ; (sprintf.s285 + 0)
.s52:
43c0 : c9 55 __ CMP #$55
43c2 : d0 03 __ BNE $43c7 ; (sprintf.s50 + 0)
43c4 : 4c 12 45 JMP $4512 ; (sprintf.s285 + 0)
.s50:
43c7 : c9 78 __ CMP #$78
43c9 : f0 04 __ BEQ $43cf ; (sprintf.s53 + 0)
.s56:
43cb : c9 58 __ CMP #$58
43cd : d0 0d __ BNE $43dc ; (sprintf.s54 + 0)
.s53:
43cf : a9 10 __ LDA #$10
43d1 : 8d eb bf STA $bfeb ; (buff + 45)
43d4 : a9 00 __ LDA #$00
43d6 : 8d ec bf STA $bfec ; (buff + 46)
43d9 : 4c 12 45 JMP $4512 ; (sprintf.s285 + 0)
.s54:
43dc : c9 6c __ CMP #$6c
43de : d0 03 __ BNE $43e3 ; (sprintf.s60 + 0)
43e0 : 4c a4 44 JMP $44a4 ; (sprintf.s57 + 0)
.s60:
43e3 : c9 4c __ CMP #$4c
43e5 : d0 03 __ BNE $43ea ; (sprintf.s58 + 0)
43e7 : 4c a4 44 JMP $44a4 ; (sprintf.s57 + 0)
.s58:
43ea : c9 73 __ CMP #$73
43ec : f0 37 __ BEQ $4425 ; (sprintf.s73 + 0)
.s76:
43ee : c9 53 __ CMP #$53
43f0 : f0 33 __ BEQ $4425 ; (sprintf.s73 + 0)
.s74:
43f2 : c9 63 __ CMP #$63
43f4 : f0 14 __ BEQ $440a ; (sprintf.s104 + 0)
.s107:
43f6 : c9 43 __ CMP #$43
43f8 : f0 10 __ BEQ $440a ; (sprintf.s104 + 0)
.s105:
43fa : 09 00 __ ORA #$00
43fc : d0 03 __ BNE $4401 ; (sprintf.s108 + 0)
43fe : 4c 53 42 JMP $4253 ; (sprintf.l2 + 0)
.s108:
4401 : a4 43 __ LDY T1 + 0 
4403 : 91 4b __ STA (T3 + 0),y 
4405 : e6 43 __ INC T1 + 0 
4407 : 4c 53 42 JMP $4253 ; (sprintf.l2 + 0)
.s104:
440a : a0 00 __ LDY #$00
440c : b1 47 __ LDA (T0 + 0),y 
440e : a4 43 __ LDY T1 + 0 
4410 : 91 4b __ STA (T3 + 0),y 
4412 : e6 43 __ INC T1 + 0 
.s258:
4414 : 18 __ __ CLC
4415 : a5 47 __ LDA T0 + 0 
4417 : 69 02 __ ADC #$02
4419 : 85 47 __ STA T0 + 0 
441b : b0 03 __ BCS $4420 ; (sprintf.s1085 + 0)
441d : 4c 53 42 JMP $4253 ; (sprintf.l2 + 0)
.s1085:
4420 : e6 48 __ INC T0 + 1 
4422 : 4c 53 42 JMP $4253 ; (sprintf.l2 + 0)
.s73:
4425 : a0 00 __ LDY #$00
4427 : 84 45 __ STY T4 + 0 
4429 : b1 47 __ LDA (T0 + 0),y 
442b : 85 4d __ STA T6 + 0 
442d : c8 __ __ INY
442e : b1 47 __ LDA (T0 + 0),y 
4430 : 85 4e __ STA T6 + 1 
4432 : 18 __ __ CLC
4433 : a5 47 __ LDA T0 + 0 
4435 : 69 02 __ ADC #$02
4437 : 85 47 __ STA T0 + 0 
4439 : 90 02 __ BCC $443d ; (sprintf.s1092 + 0)
.s1091:
443b : e6 48 __ INC T0 + 1 
.s1092:
443d : ad e9 bf LDA $bfe9 ; (buff + 43)
4440 : f0 0d __ BEQ $444f ; (sprintf.s79 + 0)
.s1071:
4442 : a0 00 __ LDY #$00
4444 : b1 4d __ LDA (T6 + 0),y 
4446 : f0 05 __ BEQ $444d ; (sprintf.s1072 + 0)
.l81:
4448 : c8 __ __ INY
4449 : b1 4d __ LDA (T6 + 0),y 
444b : d0 fb __ BNE $4448 ; (sprintf.l81 + 0)
.s1072:
444d : 84 45 __ STY T4 + 0 
.s79:
444f : ad ee bf LDA $bfee ; (buff + 48)
4452 : d0 19 __ BNE $446d ; (sprintf.l95 + 0)
.s1075:
4454 : a6 45 __ LDX T4 + 0 
4456 : ec e9 bf CPX $bfe9 ; (buff + 43)
4459 : a4 43 __ LDY T1 + 0 
445b : b0 0c __ BCS $4469 ; (sprintf.s1076 + 0)
.l87:
445d : ad e8 bf LDA $bfe8 ; (buff + 42)
4460 : 91 4b __ STA (T3 + 0),y 
4462 : e8 __ __ INX
4463 : ec e9 bf CPX $bfe9 ; (buff + 43)
4466 : c8 __ __ INY
4467 : 90 f4 __ BCC $445d ; (sprintf.l87 + 0)
.s1076:
4469 : 86 45 __ STX T4 + 0 
446b : 84 43 __ STY T1 + 0 
.l95:
446d : a0 00 __ LDY #$00
446f : b1 4d __ LDA (T6 + 0),y 
4471 : f0 0f __ BEQ $4482 ; (sprintf.s91 + 0)
.s96:
4473 : a4 43 __ LDY T1 + 0 
4475 : 91 4b __ STA (T3 + 0),y 
4477 : e6 43 __ INC T1 + 0 
4479 : e6 4d __ INC T6 + 0 
447b : d0 f0 __ BNE $446d ; (sprintf.l95 + 0)
.s1093:
447d : e6 4e __ INC T6 + 1 
447f : 4c 6d 44 JMP $446d ; (sprintf.l95 + 0)
.s91:
4482 : ad ee bf LDA $bfee ; (buff + 48)
4485 : d0 03 __ BNE $448a ; (sprintf.s1073 + 0)
4487 : 4c 53 42 JMP $4253 ; (sprintf.l2 + 0)
.s1073:
448a : a6 45 __ LDX T4 + 0 
448c : ec e9 bf CPX $bfe9 ; (buff + 43)
448f : a4 43 __ LDY T1 + 0 
4491 : b0 0c __ BCS $449f ; (sprintf.s1074 + 0)
.l102:
4493 : ad e8 bf LDA $bfe8 ; (buff + 42)
4496 : 91 4b __ STA (T3 + 0),y 
4498 : e8 __ __ INX
4499 : ec e9 bf CPX $bfe9 ; (buff + 43)
449c : c8 __ __ INY
449d : 90 f4 __ BCC $4493 ; (sprintf.l102 + 0)
.s1074:
449f : 84 43 __ STY T1 + 0 
44a1 : 4c 53 42 JMP $4253 ; (sprintf.l2 + 0)
.s57:
44a4 : a0 00 __ LDY #$00
44a6 : b1 47 __ LDA (T0 + 0),y 
44a8 : 85 53 __ STA T8 + 0 
44aa : c8 __ __ INY
44ab : b1 47 __ LDA (T0 + 0),y 
44ad : 85 54 __ STA T8 + 1 
44af : c8 __ __ INY
44b0 : b1 47 __ LDA (T0 + 0),y 
44b2 : 85 55 __ STA T8 + 2 
44b4 : c8 __ __ INY
44b5 : b1 47 __ LDA (T0 + 0),y 
44b7 : 85 56 __ STA T8 + 3 
44b9 : 18 __ __ CLC
44ba : a5 47 __ LDA T0 + 0 
44bc : 69 04 __ ADC #$04
44be : 85 47 __ STA T0 + 0 
44c0 : 90 02 __ BCC $44c4 ; (sprintf.s1088 + 0)
.s1087:
44c2 : e6 48 __ INC T0 + 1 
.s1088:
44c4 : a0 00 __ LDY #$00
44c6 : b1 49 __ LDA (T2 + 0),y 
44c8 : aa __ __ TAX
44c9 : e6 49 __ INC T2 + 0 
44cb : d0 02 __ BNE $44cf ; (sprintf.s1090 + 0)
.s1089:
44cd : e6 4a __ INC T2 + 1 
.s1090:
44cf : 8a __ __ TXA
44d0 : e0 64 __ CPX #$64
44d2 : f0 04 __ BEQ $44d8 ; (sprintf.s61 + 0)
.s64:
44d4 : c9 44 __ CMP #$44
44d6 : d0 04 __ BNE $44dc ; (sprintf.s62 + 0)
.s61:
44d8 : a9 01 __ LDA #$01
44da : d0 1c __ BNE $44f8 ; (sprintf.s259 + 0)
.s62:
44dc : c9 75 __ CMP #$75
44de : f0 17 __ BEQ $44f7 ; (sprintf.s284 + 0)
.s68:
44e0 : c9 55 __ CMP #$55
44e2 : f0 13 __ BEQ $44f7 ; (sprintf.s284 + 0)
.s66:
44e4 : c9 78 __ CMP #$78
44e6 : f0 07 __ BEQ $44ef ; (sprintf.s69 + 0)
.s72:
44e8 : c9 58 __ CMP #$58
44ea : f0 03 __ BEQ $44ef ; (sprintf.s69 + 0)
44ec : 4c 53 42 JMP $4253 ; (sprintf.l2 + 0)
.s69:
44ef : 8c ec bf STY $bfec ; (buff + 46)
44f2 : a9 10 __ LDA #$10
44f4 : 8d eb bf STA $bfeb ; (buff + 45)
.s284:
44f7 : 98 __ __ TYA
.s259:
44f8 : 85 15 __ STA P8 
44fa : a5 4b __ LDA T3 + 0 
44fc : 85 0f __ STA P2 ; (fmt + 0)
44fe : a5 4c __ LDA T3 + 1 
4500 : 85 10 __ STA P3 ; (fmt + 1)
4502 : a9 e8 __ LDA #$e8
4504 : 85 0d __ STA P0 ; (str + 0)
4506 : a9 bf __ LDA #$bf
4508 : 85 0e __ STA P1 ; (str + 1)
450a : 20 14 38 JSR $3814 ; (nforml@proxy + 0)
450d : a5 1b __ LDA ACCU + 0 
450f : 4c 89 42 JMP $4289 ; (sprintf.s1068 + 0)
.s285:
4512 : a9 00 __ LDA #$00
.s261:
4514 : 85 13 __ STA P6 
4516 : a5 4b __ LDA T3 + 0 
4518 : 85 0f __ STA P2 ; (fmt + 0)
451a : a5 4c __ LDA T3 + 1 
451c : 85 10 __ STA P3 ; (fmt + 1)
451e : a0 00 __ LDY #$00
4520 : b1 47 __ LDA (T0 + 0),y 
4522 : 85 11 __ STA P4 ; (fmt + 2)
4524 : c8 __ __ INY
4525 : b1 47 __ LDA (T0 + 0),y 
4527 : 85 12 __ STA P5 ; (fmt + 3)
4529 : a9 e8 __ LDA #$e8
452b : 85 0d __ STA P0 ; (str + 0)
452d : a9 bf __ LDA #$bf
452f : 85 0e __ STA P1 ; (str + 1)
4531 : 20 df 36 JSR $36df ; (nformi.s0 + 0)
4534 : a5 1b __ LDA ACCU + 0 
4536 : 85 43 __ STA T1 + 0 
4538 : 4c 14 44 JMP $4414 ; (sprintf.s258 + 0)
.s260:
453b : a0 00 __ LDY #$00
453d : b1 49 __ LDA (T2 + 0),y 
453f : aa __ __ TAX
4540 : 18 __ __ CLC
4541 : a5 49 __ LDA T2 + 0 
4543 : 69 01 __ ADC #$01
4545 : 4c c7 42 JMP $42c7 ; (sprintf.l15 + 0)
--------------------------------------------------------------------
4548 : __ __ __ BYT 76 64 63 20 6d 45 4d 4f 52 59 20 64 45 54 45 43 : vdc mEMORY dETEC
4558 : __ __ __ BYT 54 45 44 3a 20 25 44 20 6b 62 2c 20 53 43 52 45 : TED: %D kb, SCRE
4568 : __ __ __ BYT 45 4e 20 53 49 5a 45 3a 20 25 44 58 25 44 2c 20 : EN SIZE: %DX%D, 
4578 : __ __ __ BYT 45 58 54 2e 4d 45 4d 3a 20 25 53 00             : EXT.MEM: %S.
--------------------------------------------------------------------
mul16by8: ; mul16by8
4584 : a0 00 __ LDY #$00
4586 : 84 06 __ STY WORK + 3 
4588 : 4a __ __ LSR
4589 : 90 0d __ BCC $4598 ; (mul16by8 + 20)
458b : aa __ __ TAX
458c : 18 __ __ CLC
458d : 98 __ __ TYA
458e : 65 1b __ ADC ACCU + 0 
4590 : a8 __ __ TAY
4591 : a5 06 __ LDA WORK + 3 
4593 : 65 1c __ ADC ACCU + 1 
4595 : 85 06 __ STA WORK + 3 
4597 : 8a __ __ TXA
4598 : 06 1b __ ASL ACCU + 0 
459a : 26 1c __ ROL ACCU + 1 
459c : 4a __ __ LSR
459d : b0 ec __ BCS $458b ; (mul16by8 + 7)
459f : d0 f7 __ BNE $4598 ; (mul16by8 + 20)
45a1 : 84 05 __ STY WORK + 2 
45a3 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
45a4 : a5 1c __ LDA ACCU + 1 
45a6 : d0 31 __ BNE $45d9 ; (divmod + 53)
45a8 : a5 04 __ LDA WORK + 1 
45aa : d0 1e __ BNE $45ca ; (divmod + 38)
45ac : 85 06 __ STA WORK + 3 
45ae : a2 04 __ LDX #$04
45b0 : 06 1b __ ASL ACCU + 0 
45b2 : 2a __ __ ROL
45b3 : c5 03 __ CMP WORK + 0 
45b5 : 90 02 __ BCC $45b9 ; (divmod + 21)
45b7 : e5 03 __ SBC WORK + 0 
45b9 : 26 1b __ ROL ACCU + 0 
45bb : 2a __ __ ROL
45bc : c5 03 __ CMP WORK + 0 
45be : 90 02 __ BCC $45c2 ; (divmod + 30)
45c0 : e5 03 __ SBC WORK + 0 
45c2 : 26 1b __ ROL ACCU + 0 
45c4 : ca __ __ DEX
45c5 : d0 eb __ BNE $45b2 ; (divmod + 14)
45c7 : 85 05 __ STA WORK + 2 
45c9 : 60 __ __ RTS
45ca : a5 1b __ LDA ACCU + 0 
45cc : 85 05 __ STA WORK + 2 
45ce : a5 1c __ LDA ACCU + 1 
45d0 : 85 06 __ STA WORK + 3 
45d2 : a9 00 __ LDA #$00
45d4 : 85 1b __ STA ACCU + 0 
45d6 : 85 1c __ STA ACCU + 1 
45d8 : 60 __ __ RTS
45d9 : a5 04 __ LDA WORK + 1 
45db : d0 1f __ BNE $45fc ; (divmod + 88)
45dd : a5 03 __ LDA WORK + 0 
45df : 30 1b __ BMI $45fc ; (divmod + 88)
45e1 : a9 00 __ LDA #$00
45e3 : 85 06 __ STA WORK + 3 
45e5 : a2 10 __ LDX #$10
45e7 : 06 1b __ ASL ACCU + 0 
45e9 : 26 1c __ ROL ACCU + 1 
45eb : 2a __ __ ROL
45ec : c5 03 __ CMP WORK + 0 
45ee : 90 02 __ BCC $45f2 ; (divmod + 78)
45f0 : e5 03 __ SBC WORK + 0 
45f2 : 26 1b __ ROL ACCU + 0 
45f4 : 26 1c __ ROL ACCU + 1 
45f6 : ca __ __ DEX
45f7 : d0 f2 __ BNE $45eb ; (divmod + 71)
45f9 : 85 05 __ STA WORK + 2 
45fb : 60 __ __ RTS
45fc : a9 00 __ LDA #$00
45fe : 85 05 __ STA WORK + 2 
4600 : 85 06 __ STA WORK + 3 
4602 : 84 02 __ STY $02 
4604 : a0 10 __ LDY #$10
4606 : 18 __ __ CLC
4607 : 26 1b __ ROL ACCU + 0 
4609 : 26 1c __ ROL ACCU + 1 
460b : 26 05 __ ROL WORK + 2 
460d : 26 06 __ ROL WORK + 3 
460f : 38 __ __ SEC
4610 : a5 05 __ LDA WORK + 2 
4612 : e5 03 __ SBC WORK + 0 
4614 : aa __ __ TAX
4615 : a5 06 __ LDA WORK + 3 
4617 : e5 04 __ SBC WORK + 1 
4619 : 90 04 __ BCC $461f ; (divmod + 123)
461b : 86 05 __ STX WORK + 2 
461d : 85 06 __ STA WORK + 3 
461f : 88 __ __ DEY
4620 : d0 e5 __ BNE $4607 ; (divmod + 99)
4622 : 26 1b __ ROL ACCU + 0 
4624 : 26 1c __ ROL ACCU + 1 
4626 : a4 02 __ LDY $02 
4628 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
4629 : 84 02 __ STY $02 
462b : a0 20 __ LDY #$20
462d : a9 00 __ LDA #$00
462f : 85 07 __ STA WORK + 4 
4631 : 85 08 __ STA WORK + 5 
4633 : 85 09 __ STA WORK + 6 
4635 : 85 0a __ STA WORK + 7 
4637 : a5 05 __ LDA WORK + 2 
4639 : 05 06 __ ORA WORK + 3 
463b : d0 39 __ BNE $4676 ; (divmod32 + 77)
463d : 18 __ __ CLC
463e : 26 1b __ ROL ACCU + 0 
4640 : 26 1c __ ROL ACCU + 1 
4642 : 26 1d __ ROL ACCU + 2 
4644 : 26 1e __ ROL ACCU + 3 
4646 : 26 07 __ ROL WORK + 4 
4648 : 26 08 __ ROL WORK + 5 
464a : 90 0c __ BCC $4658 ; (divmod32 + 47)
464c : a5 07 __ LDA WORK + 4 
464e : e5 03 __ SBC WORK + 0 
4650 : aa __ __ TAX
4651 : a5 08 __ LDA WORK + 5 
4653 : e5 04 __ SBC WORK + 1 
4655 : 38 __ __ SEC
4656 : b0 0c __ BCS $4664 ; (divmod32 + 59)
4658 : 38 __ __ SEC
4659 : a5 07 __ LDA WORK + 4 
465b : e5 03 __ SBC WORK + 0 
465d : aa __ __ TAX
465e : a5 08 __ LDA WORK + 5 
4660 : e5 04 __ SBC WORK + 1 
4662 : 90 04 __ BCC $4668 ; (divmod32 + 63)
4664 : 86 07 __ STX WORK + 4 
4666 : 85 08 __ STA WORK + 5 
4668 : 88 __ __ DEY
4669 : d0 d3 __ BNE $463e ; (divmod32 + 21)
466b : 26 1b __ ROL ACCU + 0 
466d : 26 1c __ ROL ACCU + 1 
466f : 26 1d __ ROL ACCU + 2 
4671 : 26 1e __ ROL ACCU + 3 
4673 : a4 02 __ LDY $02 
4675 : 60 __ __ RTS
4676 : 18 __ __ CLC
4677 : 26 1b __ ROL ACCU + 0 
4679 : 26 1c __ ROL ACCU + 1 
467b : 26 1d __ ROL ACCU + 2 
467d : 26 1e __ ROL ACCU + 3 
467f : 26 07 __ ROL WORK + 4 
4681 : 26 08 __ ROL WORK + 5 
4683 : 26 09 __ ROL WORK + 6 
4685 : 26 0a __ ROL WORK + 7 
4687 : a5 07 __ LDA WORK + 4 
4689 : c5 03 __ CMP WORK + 0 
468b : a5 08 __ LDA WORK + 5 
468d : e5 04 __ SBC WORK + 1 
468f : a5 09 __ LDA WORK + 6 
4691 : e5 05 __ SBC WORK + 2 
4693 : a5 0a __ LDA WORK + 7 
4695 : e5 06 __ SBC WORK + 3 
4697 : 90 18 __ BCC $46b1 ; (divmod32 + 136)
4699 : a5 07 __ LDA WORK + 4 
469b : e5 03 __ SBC WORK + 0 
469d : 85 07 __ STA WORK + 4 
469f : a5 08 __ LDA WORK + 5 
46a1 : e5 04 __ SBC WORK + 1 
46a3 : 85 08 __ STA WORK + 5 
46a5 : a5 09 __ LDA WORK + 6 
46a7 : e5 05 __ SBC WORK + 2 
46a9 : 85 09 __ STA WORK + 6 
46ab : a5 0a __ LDA WORK + 7 
46ad : e5 06 __ SBC WORK + 3 
46af : 85 0a __ STA WORK + 7 
46b1 : 88 __ __ DEY
46b2 : d0 c3 __ BNE $4677 ; (divmod32 + 78)
46b4 : 26 1b __ ROL ACCU + 0 
46b6 : 26 1c __ ROL ACCU + 1 
46b8 : 26 1d __ ROL ACCU + 2 
46ba : 26 1e __ ROL ACCU + 3 
46bc : a4 02 __ LDY $02 
46be : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
46bf : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
46c0 : __ __ __ BYT 54 45 53 54 31 00 00 00 00 00 00 00 00 00 00    : TEST1..........
--------------------------------------------------------------------
giocharmap:
46cf : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
vdc_state:
46d0 : __ __ __ BSS	22
--------------------------------------------------------------------
krnio_pstatus:
46e6 : __ __ __ BSS	16
--------------------------------------------------------------------
4700 : __ __ __ BYT 54 48 49 53 20 49 53 20 41 20 54 45 53 54 20 54 : THIS IS A TEST T
4710 : __ __ __ BYT 4f 20 57 52 49 54 45 20 44 41 54 41 20 54 4f 20 : O WRITE DATA TO 
4720 : __ __ __ BYT 54 48 45 20 44 49 53 4b 2e 00 00 00 00 00 00 00 : THE DISK........
4730 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4740 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4750 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
vdc_modes:
4751 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
4761 : __ __ __ BYT 30 00 40 00 7f 04 26 06 19 07 20 08 fc 09 e7 ff : 0.@...&... .....
4771 : __ __ __ BYT 50 00 32 00 01 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
4781 : __ __ __ BYT 30 00 60 00 80 04 40 06 32 07 3a 08 03 09 07 ff : 0.`...@.2.:.....
--------------------------------------------------------------------
linebuffer:
4791 : __ __ __ BSS	81
--------------------------------------------------------------------
bnk_load@proxy: ; bnk_load@proxy
01:1300 : a5 54 __ LDA $54 
01:1302 : 85 0f __ STA P2 
01:1304 : a9 00 __ LDA #$00
01:1306 : 85 10 __ STA P3 
--------------------------------------------------------------------
bnk_load: ; bnk_load(u8,u8,const u8*,const u8*)->bool
.s0:
01:1308 : a9 01 __ LDA #$01
01:130a : 85 0d __ STA P0 
01:130c : a9 00 __ LDA #$00
01:130e : 85 0e __ STA P1 
01:1310 : 20 3c 3a JSR $3a3c ; (krnio_setbnk.s0 + 0)
01:1313 : a5 12 __ LDA P5 ; (fname + 0)
01:1315 : 85 0d __ STA P0 
01:1317 : a5 13 __ LDA P6 ; (fname + 1)
01:1319 : 85 0e __ STA P1 
01:131b : 20 4c 3a JSR $3a4c ; (krnio_setnam.s0 + 0)
01:131e : a9 01 __ LDA #$01
01:1320 : a6 0f __ LDX P2 
01:1322 : a0 00 __ LDY #$00
01:1324 : 20 ba ff JSR $ffba 
01:1327 : a9 00 __ LDA #$00
01:1329 : a6 10 __ LDX P3 
01:132b : a4 11 __ LDY P4 
01:132d : 20 d5 ff JSR $ffd5 
01:1330 : a9 00 __ LDA #$00
01:1332 : b0 02 __ BCS $1336 ; (bnk_load.s0 + 46)
01:1334 : a9 01 __ LDA #$01
01:1336 : 85 1b __ STA ACCU + 0 
.s1001:
01:1338 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1339 : a9 00 __ LDA #$00
01:133b : 85 0f __ STA P2 
--------------------------------------------------------------------
bnk_redef_charset: ; bnk_redef_charset(u16,u8,u8*,u16)->void
.s0:
01:133d : ad 00 ff LDA $ff00 
01:1340 : 85 1b __ STA ACCU + 0 
01:1342 : a9 0e __ LDA #$0e
01:1344 : 8d 00 ff STA $ff00 
01:1347 : a9 12 __ LDA #$12
01:1349 : 8d 00 d6 STA $d600 
01:134c : a9 00 __ LDA #$00
01:134e : 85 1c __ STA ACCU + 1 
.l166:
01:1350 : 2c 00 d6 BIT $d600 
01:1353 : 10 fb __ BPL $1350 ; (bnk_redef_charset.l166 + 0)
.s6:
01:1355 : a5 0e __ LDA P1 ; (vdcdest + 1)
01:1357 : 8d 01 d6 STA $d601 
01:135a : a9 13 __ LDA #$13
01:135c : 8d 00 d6 STA $d600 
.l168:
01:135f : 2c 00 d6 BIT $d600 
01:1362 : 10 fb __ BPL $135f ; (bnk_redef_charset.l168 + 0)
.s11:
01:1364 : a5 0d __ LDA P0 ; (vdcdest + 0)
01:1366 : 8d 01 d6 STA $d601 
01:1369 : a9 1f __ LDA #$1f
01:136b : 8d 00 d6 STA $d600 
.l14:
01:136e : a2 08 __ LDX #$08
.l17:
01:1370 : a9 7f __ LDA #$7f
01:1372 : 8d 00 ff STA $ff00 
01:1375 : a0 00 __ LDY #$00
01:1377 : b1 0f __ LDA (P2),y ; (sp + 0)
01:1379 : a8 __ __ TAY
01:137a : e6 0f __ INC P2 ; (sp + 0)
01:137c : d0 02 __ BNE $1380 ; (bnk_redef_charset.s1011 + 0)
.s1010:
01:137e : e6 10 __ INC P3 ; (sp + 1)
.s1011:
01:1380 : a9 0e __ LDA #$0e
01:1382 : 8d 00 ff STA $ff00 
.l170:
01:1385 : 2c 00 d6 BIT $d600 
01:1388 : 10 fb __ BPL $1385 ; (bnk_redef_charset.l170 + 0)
.s22:
01:138a : 8c 01 d6 STY $d601 
01:138d : ca __ __ DEX
01:138e : d0 e0 __ BNE $1370 ; (bnk_redef_charset.l17 + 0)
.s19:
01:1390 : a2 08 __ LDX #$08
.l24:
01:1392 : 2c 00 d6 BIT $d600 
01:1395 : 10 fb __ BPL $1392 ; (bnk_redef_charset.l24 + 0)
.s29:
01:1397 : a9 00 __ LDA #$00
01:1399 : 8d 01 d6 STA $d601 
01:139c : ca __ __ DEX
01:139d : d0 f3 __ BNE $1392 ; (bnk_redef_charset.l24 + 0)
.s26:
01:139f : c6 1c __ DEC ACCU + 1 
01:13a1 : d0 cb __ BNE $136e ; (bnk_redef_charset.l14 + 0)
.s15:
01:13a3 : a5 1b __ LDA ACCU + 0 
01:13a5 : 8d 00 ff STA $ff00 
.s1001:
01:13a8 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_writeb: ; bnk_writeb(u8,u8*,u8)->void
.s1000:
01:13a9 : aa __ __ TAX
.s0:
01:13aa : a9 7f __ LDA #$7f
01:13ac : ac 00 ff LDY $ff00 
01:13af : 8d 00 ff STA $ff00 
01:13b2 : 8e 00 d0 STX $d000 
01:13b5 : 8c 00 ff STY $ff00 
.s1001:
01:13b8 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_writew: ; bnk_writew(u8,u16*,u16)->void
.s0:
01:13b9 : a9 7f __ LDA #$7f
01:13bb : ae 00 ff LDX $ff00 
01:13be : 8d 00 ff STA $ff00 
01:13c1 : a5 0d __ LDA P0 ; (w + 0)
01:13c3 : 8d 01 d0 STA $d001 
01:13c6 : a5 0e __ LDA P1 ; (w + 1)
01:13c8 : 8d 02 d0 STA $d002 
01:13cb : 8e 00 ff STX $ff00 
.s1001:
01:13ce : 60 __ __ RTS
--------------------------------------------------------------------
bnk_readb: ; bnk_readb(u8,u8*)->u8
.s0:
01:13cf : a9 7f __ LDA #$7f
01:13d1 : ae 00 ff LDX $ff00 
01:13d4 : 8d 00 ff STA $ff00 
01:13d7 : ad 00 d0 LDA $d000 
01:13da : 8e 00 ff STX $ff00 
.s1001:
01:13dd : 60 __ __ RTS
--------------------------------------------------------------------
bnk_readw: ; bnk_readw(u8,u16*)->u16
.s0:
01:13de : a9 7f __ LDA #$7f
01:13e0 : ae 00 ff LDX $ff00 
01:13e3 : 8d 00 ff STA $ff00 
01:13e6 : ad 01 d0 LDA $d001 
01:13e9 : 85 1b __ STA ACCU + 0 
01:13eb : ad 02 d0 LDA $d002 
01:13ee : 85 1c __ STA ACCU + 1 
01:13f0 : 8e 00 ff STX $ff00 
.s1001:
01:13f3 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_memcpy@proxy: ; bnk_memcpy@proxy
01:13f4 : a5 56 __ LDA $56 
01:13f6 : 85 14 __ STA P7 
--------------------------------------------------------------------
bnk_memcpy: ; bnk_memcpy(u8,u8*,u8,u8*,u16)->void
.s0:
01:13f8 : ad 00 ff LDA $ff00 
01:13fb : 85 1b __ STA ACCU + 0 
01:13fd : a5 13 __ LDA P6 ; (size + 0)
01:13ff : 05 14 __ ORA P7 ; (size + 1)
01:1401 : f0 31 __ BEQ $1434 ; (bnk_memcpy.s3 + 0)
.s4:
01:1403 : a0 00 __ LDY #$00
01:1405 : a5 13 __ LDA P6 ; (size + 0)
01:1407 : f0 02 __ BEQ $140b ; (bnk_memcpy.l1002 + 0)
.s1005:
01:1409 : e6 14 __ INC P7 ; (size + 1)
.l1002:
01:140b : a6 13 __ LDX P6 ; (size + 0)
.l1006:
01:140d : a5 10 __ LDA P3 ; (scr + 0)
01:140f : 8d 00 ff STA $ff00 
01:1412 : b1 11 __ LDA (P4),y ; (sp + 0)
01:1414 : 85 1c __ STA ACCU + 1 
01:1416 : a5 0d __ LDA P0 ; (dcr + 0)
01:1418 : 8d 00 ff STA $ff00 
01:141b : a5 1c __ LDA ACCU + 1 
01:141d : 91 0e __ STA (P1),y ; (dp + 0)
01:141f : e6 11 __ INC P4 ; (sp + 0)
01:1421 : d0 02 __ BNE $1425 ; (bnk_memcpy.s1009 + 0)
.s1008:
01:1423 : e6 12 __ INC P5 ; (sp + 1)
.s1009:
01:1425 : e6 0e __ INC P1 ; (dp + 0)
01:1427 : d0 02 __ BNE $142b ; (bnk_memcpy.s1011 + 0)
.s1010:
01:1429 : e6 0f __ INC P2 ; (dp + 1)
.s1011:
01:142b : ca __ __ DEX
01:142c : d0 df __ BNE $140d ; (bnk_memcpy.l1006 + 0)
.s1007:
01:142e : 86 13 __ STX P6 ; (size + 0)
01:1430 : c6 14 __ DEC P7 ; (size + 1)
01:1432 : d0 d7 __ BNE $140b ; (bnk_memcpy.l1002 + 0)
.s3:
01:1434 : a5 1b __ LDA ACCU + 0 
01:1436 : 8d 00 ff STA $ff00 
.s1001:
01:1439 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpytovdc: ; bnk_cpytovdc(u16,u8,u8*,u16)->void
.s0:
01:143a : ad 00 ff LDA $ff00 
01:143d : 85 1b __ STA ACCU + 0 
01:143f : a9 0e __ LDA #$0e
01:1441 : 8d 00 ff STA $ff00 
01:1444 : a9 12 __ LDA #$12
01:1446 : 8d 00 d6 STA $d600 
.l107:
01:1449 : 2c 00 d6 BIT $d600 
01:144c : 10 fb __ BPL $1449 ; (bnk_cpytovdc.l107 + 0)
.s6:
01:144e : a5 0e __ LDA P1 ; (vdcdest + 1)
01:1450 : 8d 01 d6 STA $d601 
01:1453 : a9 13 __ LDA #$13
01:1455 : 8d 00 d6 STA $d600 
.l109:
01:1458 : 2c 00 d6 BIT $d600 
01:145b : 10 fb __ BPL $1458 ; (bnk_cpytovdc.l109 + 0)
.s11:
01:145d : a5 0d __ LDA P0 ; (vdcdest + 0)
01:145f : 8d 01 d6 STA $d601 
01:1462 : a9 1f __ LDA #$1f
01:1464 : 8d 00 d6 STA $d600 
01:1467 : a6 11 __ LDX P4 ; (size + 0)
.l111:
01:1469 : 8a __ __ TXA
01:146a : 05 12 __ ORA P5 ; (size + 1)
01:146c : d0 06 __ BNE $1474 ; (bnk_cpytovdc.s14 + 0)
.s15:
01:146e : a5 1b __ LDA ACCU + 0 
01:1470 : 8d 00 ff STA $ff00 
.s1001:
01:1473 : 60 __ __ RTS
.s14:
01:1474 : a9 7f __ LDA #$7f
01:1476 : 8d 00 ff STA $ff00 
01:1479 : a0 00 __ LDY #$00
01:147b : b1 0f __ LDA (P2),y ; (sp + 0)
01:147d : a8 __ __ TAY
01:147e : e6 0f __ INC P2 ; (sp + 0)
01:1480 : d0 02 __ BNE $1484 ; (bnk_cpytovdc.s1009 + 0)
.s1008:
01:1482 : e6 10 __ INC P3 ; (sp + 1)
.s1009:
01:1484 : a9 0e __ LDA #$0e
01:1486 : 8d 00 ff STA $ff00 
.l112:
01:1489 : 2c 00 d6 BIT $d600 
01:148c : 10 fb __ BPL $1489 ; (bnk_cpytovdc.l112 + 0)
.s18:
01:148e : 8c 01 d6 STY $d601 
01:1491 : 8a __ __ TXA
01:1492 : 18 __ __ CLC
01:1493 : 69 ff __ ADC #$ff
01:1495 : aa __ __ TAX
01:1496 : b0 d1 __ BCS $1469 ; (bnk_cpytovdc.l111 + 0)
.s1010:
01:1498 : c6 12 __ DEC P5 ; (size + 1)
01:149a : 90 cd __ BCC $1469 ; (bnk_cpytovdc.l111 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc: ; bnk_cpyfromvdc(u8,u8*,u16,u16)->void
.s0:
01:149c : a9 07 __ LDA #$07
01:149e : 85 1c __ STA ACCU + 1 
01:14a0 : a9 00 __ LDA #$00
01:14a2 : 85 43 __ STA T1 + 0 
01:14a4 : a9 20 __ LDA #$20
01:14a6 : 85 44 __ STA T1 + 1 
01:14a8 : ad 00 ff LDA $ff00 
01:14ab : 85 1b __ STA ACCU + 0 
01:14ad : a2 d0 __ LDX #$d0
.l2:
01:14af : a9 0e __ LDA #$0e
01:14b1 : 8d 00 ff STA $ff00 
01:14b4 : a5 0f __ LDA P2 ; (vdcsrc + 0)
01:14b6 : a8 __ __ TAY
01:14b7 : 18 __ __ CLC
01:14b8 : 69 01 __ ADC #$01
01:14ba : 85 0f __ STA P2 ; (vdcsrc + 0)
01:14bc : a5 10 __ LDA P3 ; (vdcsrc + 1)
01:14be : 85 1d __ STA ACCU + 2 
01:14c0 : 69 00 __ ADC #$00
01:14c2 : 85 10 __ STA P3 ; (vdcsrc + 1)
01:14c4 : a9 12 __ LDA #$12
01:14c6 : 8d 00 d6 STA $d600 
.l100:
01:14c9 : 2c 00 d6 BIT $d600 
01:14cc : 10 fb __ BPL $14c9 ; (bnk_cpyfromvdc.l100 + 0)
.s10:
01:14ce : a5 1d __ LDA ACCU + 2 
01:14d0 : 8d 01 d6 STA $d601 
01:14d3 : a9 13 __ LDA #$13
01:14d5 : 8d 00 d6 STA $d600 
.l102:
01:14d8 : 2c 00 d6 BIT $d600 
01:14db : 10 fb __ BPL $14d8 ; (bnk_cpyfromvdc.l102 + 0)
.s15:
01:14dd : 8c 01 d6 STY $d601 
01:14e0 : a9 1f __ LDA #$1f
01:14e2 : 8d 00 d6 STA $d600 
.l104:
01:14e5 : 2c 00 d6 BIT $d600 
01:14e8 : 10 fb __ BPL $14e5 ; (bnk_cpyfromvdc.l104 + 0)
.s19:
01:14ea : a9 7f __ LDA #$7f
01:14ec : ac 01 d6 LDY $d601 
01:14ef : 8d 00 ff STA $ff00 
01:14f2 : 98 __ __ TYA
01:14f3 : a0 00 __ LDY #$00
01:14f5 : 91 43 __ STA (T1 + 0),y 
01:14f7 : e6 43 __ INC T1 + 0 
01:14f9 : d0 02 __ BNE $14fd ; (bnk_cpyfromvdc.s1012 + 0)
.s1011:
01:14fb : e6 44 __ INC T1 + 1 
.s1012:
01:14fd : 8a __ __ TXA
01:14fe : d0 02 __ BNE $1502 ; (bnk_cpyfromvdc.s1009 + 0)
.s1008:
01:1500 : c6 1c __ DEC ACCU + 1 
.s1009:
01:1502 : ca __ __ DEX
01:1503 : d0 aa __ BNE $14af ; (bnk_cpyfromvdc.l2 + 0)
.s1010:
01:1505 : a5 1c __ LDA ACCU + 1 
01:1507 : d0 a6 __ BNE $14af ; (bnk_cpyfromvdc.l2 + 0)
.s3:
01:1509 : a5 1b __ LDA ACCU + 0 
01:150b : 8d 00 ff STA $ff00 
.s1001:
01:150e : 60 __ __ RTS
