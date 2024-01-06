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
1c13 : 8e ef 35 STX $35ef ; (spentry + 0)
1c16 : a9 f3 __ LDA #$f3
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 35 __ LDA #$35
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 36 __ LDA #$36
1c21 : e9 35 __ SBC #$35
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
1c37 : e9 f3 __ SBC #$f3
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
1c50 : a9 b0 __ LDA #$b0
1c52 : 85 23 __ STA SP + 0 
1c54 : a9 bf __ LDA #$bf
1c56 : 85 24 __ STA SP + 1 
1c58 : 20 80 1c JSR $1c80 ; (main.s1000 + 0)
1c5b : a9 4c __ LDA #$4c
1c5d : 85 54 __ STA $54 
1c5f : a9 00 __ LDA #$00
1c61 : 85 13 __ STA P6 
1c63 : a9 19 __ LDA #$19
1c65 : 85 16 __ STA P9 
1c67 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
.s1000:
1c80 : 38 __ __ SEC
1c81 : a5 23 __ LDA SP + 0 
1c83 : e9 08 __ SBC #$08
1c85 : 85 23 __ STA SP + 0 
1c87 : b0 02 __ BCS $1c8b ; (main.s0 + 0)
1c89 : c6 24 __ DEC SP + 1 
.s0:
1c8b : a9 1a __ LDA #$1a
1c8d : 8d 00 d6 STA $d600 
1c90 : a9 00 __ LDA #$00
1c92 : 85 4f __ STA T0 + 0 
.l7513:
1c94 : 2c 00 d6 BIT $d600 
1c97 : 10 fb __ BPL $1c94 ; (main.l7513 + 0)
.s9:
1c99 : ad 01 d6 LDA $d601 
1c9c : 29 f0 __ AND #$f0
1c9e : aa __ __ TAX
1c9f : a9 1a __ LDA #$1a
1ca1 : 8d 00 d6 STA $d600 
.l7515:
1ca4 : 2c 00 d6 BIT $d600 
1ca7 : 10 fb __ BPL $1ca4 ; (main.l7515 + 0)
.s15:
1ca9 : 8e 01 d6 STX $d601 
1cac : 8d 00 d6 STA $d600 
.l7517:
1caf : 2c 00 d6 BIT $d600 
1cb2 : 10 fb __ BPL $1caf ; (main.l7517 + 0)
.s22:
1cb4 : ad 01 d6 LDA $d601 
1cb7 : 29 0f __ AND #$0f
1cb9 : 09 d0 __ ORA #$d0
1cbb : aa __ __ TAX
1cbc : a9 1a __ LDA #$1a
1cbe : 8d 00 d6 STA $d600 
.l7519:
1cc1 : 2c 00 d6 BIT $d600 
1cc4 : 10 fb __ BPL $1cc1 ; (main.l7519 + 0)
.s28:
1cc6 : 8e 01 d6 STX $d601 
1cc9 : a9 8d __ LDA #$8d
1ccb : 8d f0 35 STA $35f0 ; (vdc_text_attr + 0)
1cce : a9 1c __ LDA #$1c
1cd0 : 8d 00 d6 STA $d600 
.l7521:
1cd3 : 2c 00 d6 BIT $d600 
1cd6 : 10 fb __ BPL $1cd3 ; (main.l7521 + 0)
.s34:
1cd8 : ad 01 d6 LDA $d601 
1cdb : aa __ __ TAX
1cdc : 09 10 __ ORA #$10
1cde : a8 __ __ TAY
1cdf : a9 1c __ LDA #$1c
1ce1 : 8d 00 d6 STA $d600 
.l7523:
1ce4 : 2c 00 d6 BIT $d600 
1ce7 : 10 fb __ BPL $1ce4 ; (main.l7523 + 0)
.s41:
1ce9 : 8c 01 d6 STY $d601 
1cec : a9 12 __ LDA #$12
1cee : 8d 00 d6 STA $d600 
.l7525:
1cf1 : 2c 00 d6 BIT $d600 
1cf4 : 10 fb __ BPL $1cf1 ; (main.l7525 + 0)
.s48:
1cf6 : a9 1f __ LDA #$1f
1cf8 : 8d 01 d6 STA $d601 
1cfb : a9 13 __ LDA #$13
1cfd : 8d 00 d6 STA $d600 
.l7527:
1d00 : 2c 00 d6 BIT $d600 
1d03 : 10 fb __ BPL $1d00 ; (main.l7527 + 0)
.s53:
1d05 : a9 ff __ LDA #$ff
1d07 : 8d 01 d6 STA $d601 
1d0a : a9 1f __ LDA #$1f
1d0c : 8d 00 d6 STA $d600 
.l7529:
1d0f : 2c 00 d6 BIT $d600 
1d12 : 10 fb __ BPL $1d0f ; (main.l7529 + 0)
.s57:
1d14 : a9 00 __ LDA #$00
1d16 : 8d 01 d6 STA $d601 
1d19 : a9 12 __ LDA #$12
1d1b : 8d 00 d6 STA $d600 
.l7531:
1d1e : 2c 00 d6 BIT $d600 
1d21 : 10 fb __ BPL $1d1e ; (main.l7531 + 0)
.s64:
1d23 : a9 9f __ LDA #$9f
1d25 : 8d 01 d6 STA $d601 
1d28 : a9 13 __ LDA #$13
1d2a : 8d 00 d6 STA $d600 
.l7533:
1d2d : 2c 00 d6 BIT $d600 
1d30 : 10 fb __ BPL $1d2d ; (main.l7533 + 0)
.s69:
1d32 : a9 ff __ LDA #$ff
1d34 : 8d 01 d6 STA $d601 
1d37 : a9 1f __ LDA #$1f
1d39 : 8d 00 d6 STA $d600 
.l7535:
1d3c : 2c 00 d6 BIT $d600 
1d3f : 10 fb __ BPL $1d3c ; (main.l7535 + 0)
.s73:
1d41 : a9 ff __ LDA #$ff
1d43 : 8d 01 d6 STA $d601 
1d46 : a9 12 __ LDA #$12
1d48 : 8d 00 d6 STA $d600 
.l7537:
1d4b : 2c 00 d6 BIT $d600 
1d4e : 10 fb __ BPL $1d4b ; (main.l7537 + 0)
.s80:
1d50 : a9 1f __ LDA #$1f
1d52 : 8d 01 d6 STA $d601 
1d55 : a9 13 __ LDA #$13
1d57 : 8d 00 d6 STA $d600 
.l7539:
1d5a : 2c 00 d6 BIT $d600 
1d5d : 10 fb __ BPL $1d5a ; (main.l7539 + 0)
.s85:
1d5f : a9 ff __ LDA #$ff
1d61 : 8d 01 d6 STA $d601 
1d64 : a9 1f __ LDA #$1f
1d66 : 8d 00 d6 STA $d600 
.l7541:
1d69 : 2c 00 d6 BIT $d600 
1d6c : 10 fb __ BPL $1d69 ; (main.l7541 + 0)
.s89:
1d6e : ad 01 d6 LDA $d601 
1d71 : f0 04 __ BEQ $1d77 ; (main.s1462 + 0)
.s1463:
1d73 : a9 10 __ LDA #$10
1d75 : d0 02 __ BNE $1d79 ; (main.s1464 + 0)
.s1462:
1d77 : a9 40 __ LDA #$40
.s1464:
1d79 : 8d f1 35 STA $35f1 ; (vdc_memsize + 0)
1d7c : a9 1c __ LDA #$1c
1d7e : 8d 00 d6 STA $d600 
.l7544:
1d81 : 2c 00 d6 BIT $d600 
1d84 : 10 fb __ BPL $1d81 ; (main.l7544 + 0)
.s96:
1d86 : 8e 01 d6 STX $d601 
1d89 : a9 00 __ LDA #$00
1d8b : 85 43 __ STA T2 + 0 
.l100:
1d8d : a9 12 __ LDA #$12
1d8f : 8d 00 d6 STA $d600 
1d92 : a5 43 __ LDA T2 + 0 
1d94 : 0a __ __ ASL
1d95 : 0a __ __ ASL
1d96 : 65 43 __ ADC T2 + 0 
1d98 : 0a __ __ ASL
1d99 : 0a __ __ ASL
1d9a : 85 44 __ STA T3 + 0 
1d9c : a9 00 __ LDA #$00
1d9e : 2a __ __ ROL
1d9f : 06 44 __ ASL T3 + 0 
1da1 : 2a __ __ ROL
1da2 : 06 44 __ ASL T3 + 0 
1da4 : 2a __ __ ROL
1da5 : 85 45 __ STA T3 + 1 
1da7 : ae f0 35 LDX $35f0 ; (vdc_text_attr + 0)
.l7546:
1daa : 2c 00 d6 BIT $d600 
1dad : 10 fb __ BPL $1daa ; (main.l7546 + 0)
.s116:
1daf : 8d 01 d6 STA $d601 
1db2 : a9 13 __ LDA #$13
1db4 : 8d 00 d6 STA $d600 
.l7548:
1db7 : 2c 00 d6 BIT $d600 
1dba : 10 fb __ BPL $1db7 ; (main.l7548 + 0)
.s121:
1dbc : a5 44 __ LDA T3 + 0 
1dbe : 8d 01 d6 STA $d601 
1dc1 : a9 1f __ LDA #$1f
1dc3 : 8d 00 d6 STA $d600 
.l7550:
1dc6 : 2c 00 d6 BIT $d600 
1dc9 : 10 fb __ BPL $1dc6 ; (main.l7550 + 0)
.s125:
1dcb : a9 20 __ LDA #$20
1dcd : 8d 01 d6 STA $d601 
1dd0 : a9 18 __ LDA #$18
1dd2 : 8d 00 d6 STA $d600 
.l7552:
1dd5 : 2c 00 d6 BIT $d600 
1dd8 : 10 fb __ BPL $1dd5 ; (main.l7552 + 0)
.s131:
1dda : ad 01 d6 LDA $d601 
1ddd : 29 7f __ AND #$7f
1ddf : a8 __ __ TAY
1de0 : a9 18 __ LDA #$18
1de2 : 8d 00 d6 STA $d600 
.l7554:
1de5 : 2c 00 d6 BIT $d600 
1de8 : 10 fb __ BPL $1de5 ; (main.l7554 + 0)
.s137:
1dea : 8c 01 d6 STY $d601 
1ded : a9 1e __ LDA #$1e
1def : 8d 00 d6 STA $d600 
.l7556:
1df2 : 2c 00 d6 BIT $d600 
1df5 : 10 fb __ BPL $1df2 ; (main.l7556 + 0)
.s142:
1df7 : a9 4f __ LDA #$4f
1df9 : 8d 01 d6 STA $d601 
1dfc : a9 12 __ LDA #$12
1dfe : 8d 00 d6 STA $d600 
1e01 : 18 __ __ CLC
1e02 : a5 45 __ LDA T3 + 1 
1e04 : 69 08 __ ADC #$08
.l7558:
1e06 : 2c 00 d6 BIT $d600 
1e09 : 10 fb __ BPL $1e06 ; (main.l7558 + 0)
.s149:
1e0b : 8d 01 d6 STA $d601 
1e0e : a9 13 __ LDA #$13
1e10 : 8d 00 d6 STA $d600 
.l7560:
1e13 : 2c 00 d6 BIT $d600 
1e16 : 10 fb __ BPL $1e13 ; (main.l7560 + 0)
.s154:
1e18 : a5 44 __ LDA T3 + 0 
1e1a : 8d 01 d6 STA $d601 
1e1d : a9 1f __ LDA #$1f
1e1f : 8d 00 d6 STA $d600 
.l7562:
1e22 : 2c 00 d6 BIT $d600 
1e25 : 10 fb __ BPL $1e22 ; (main.l7562 + 0)
.s158:
1e27 : 8e 01 d6 STX $d601 
1e2a : a9 18 __ LDA #$18
1e2c : 8d 00 d6 STA $d600 
.l7564:
1e2f : 2c 00 d6 BIT $d600 
1e32 : 10 fb __ BPL $1e2f ; (main.l7564 + 0)
.s164:
1e34 : 8d 00 d6 STA $d600 
1e37 : ad 01 d6 LDA $d601 
1e3a : 29 7f __ AND #$7f
.l7566:
1e3c : 2c 00 d6 BIT $d600 
1e3f : 10 fb __ BPL $1e3c ; (main.l7566 + 0)
.s170:
1e41 : 8d 01 d6 STA $d601 
1e44 : a9 1e __ LDA #$1e
1e46 : 8d 00 d6 STA $d600 
.l7568:
1e49 : 2c 00 d6 BIT $d600 
1e4c : 10 fb __ BPL $1e49 ; (main.l7568 + 0)
.s175:
1e4e : a9 4f __ LDA #$4f
1e50 : 8d 01 d6 STA $d601 
1e53 : e6 43 __ INC T2 + 0 
1e55 : a5 43 __ LDA T2 + 0 
1e57 : c9 19 __ CMP #$19
1e59 : b0 03 __ BCS $1e5e ; (main.s29 + 0)
1e5b : 4c 8d 1d JMP $1d8d ; (main.l100 + 0)
.s29:
1e5e : ad f1 35 LDA $35f1 ; (vdc_memsize + 0)
1e61 : c9 40 __ CMP #$40
1e63 : d0 03 __ BNE $1e68 ; (main.s7628 + 0)
1e65 : 4c e0 28 JMP $28e0 ; (main.s176 + 0)
.s7628:
1e68 : 24 d7 __ BIT $d7 
1e6a : 30 17 __ BMI $1e83 ; (main.s364 + 0)
.s359:
1e6c : a9 0c __ LDA #$0c
1e6e : a0 02 __ LDY #$02
1e70 : 91 23 __ STA (SP + 0),y 
1e72 : a9 31 __ LDA #$31
1e74 : c8 __ __ INY
1e75 : 91 23 __ STA (SP + 0),y 
1e77 : 20 af 2a JSR $2aaf ; (printf.s1000 + 0)
1e7a : 20 37 31 JSR $3137 ; (getch.s0 + 0)
1e7d : 20 76 31 JSR $3176 ; (clrscr.s0 + 0)
1e80 : 20 7a 31 JSR $317a ; (screen_setmode.s0 + 0)
.s364:
1e83 : a9 01 __ LDA #$01
1e85 : 8d 30 d0 STA $d030 
1e88 : ad 11 d0 LDA $d011 
1e8b : 29 6f __ AND #$6f
1e8d : 8d 11 d0 STA $d011 
1e90 : a9 12 __ LDA #$12
1e92 : 8d 00 d6 STA $d600 
.l7629:
1e95 : 2c 00 d6 BIT $d600 
1e98 : 10 fb __ BPL $1e95 ; (main.l7629 + 0)
.s380:
1e9a : a9 00 __ LDA #$00
1e9c : 8d 01 d6 STA $d601 
1e9f : a9 13 __ LDA #$13
1ea1 : 8d 00 d6 STA $d600 
.l7631:
1ea4 : 2c 00 d6 BIT $d600 
1ea7 : 10 fb __ BPL $1ea4 ; (main.l7631 + 0)
.s385:
1ea9 : a9 00 __ LDA #$00
1eab : 8d 01 d6 STA $d601 
1eae : a9 1f __ LDA #$1f
1eb0 : 8d 00 d6 STA $d600 
.l7633:
1eb3 : 2c 00 d6 BIT $d600 
1eb6 : 10 fb __ BPL $1eb3 ; (main.l7633 + 0)
.s389:
1eb8 : a9 20 __ LDA #$20
1eba : 8d 01 d6 STA $d601 
1ebd : a9 18 __ LDA #$18
1ebf : 8d 00 d6 STA $d600 
.l7635:
1ec2 : 2c 00 d6 BIT $d600 
1ec5 : 10 fb __ BPL $1ec2 ; (main.l7635 + 0)
.s395:
1ec7 : ad 01 d6 LDA $d601 
1eca : 29 7f __ AND #$7f
1ecc : aa __ __ TAX
1ecd : a9 18 __ LDA #$18
1ecf : 8d 00 d6 STA $d600 
.l7637:
1ed2 : 2c 00 d6 BIT $d600 
1ed5 : 10 fb __ BPL $1ed2 ; (main.l7637 + 0)
.s401:
1ed7 : 8e 01 d6 STX $d601 
1eda : a9 1e __ LDA #$1e
1edc : 8d 00 d6 STA $d600 
.l7639:
1edf : 2c 00 d6 BIT $d600 
1ee2 : 10 fb __ BPL $1edf ; (main.l7639 + 0)
.s406:
1ee4 : a9 4e __ LDA #$4e
1ee6 : 8d 01 d6 STA $d601 
1ee9 : a9 12 __ LDA #$12
1eeb : 8d 00 d6 STA $d600 
.l7641:
1eee : 2c 00 d6 BIT $d600 
1ef1 : 10 fb __ BPL $1eee ; (main.l7641 + 0)
.s413:
1ef3 : a9 08 __ LDA #$08
1ef5 : 8d 01 d6 STA $d601 
1ef8 : a9 13 __ LDA #$13
1efa : 8d 00 d6 STA $d600 
.l7643:
1efd : 2c 00 d6 BIT $d600 
1f00 : 10 fb __ BPL $1efd ; (main.l7643 + 0)
.s418:
1f02 : a9 00 __ LDA #$00
1f04 : 8d 01 d6 STA $d601 
1f07 : a9 1f __ LDA #$1f
1f09 : 8d 00 d6 STA $d600 
.l7645:
1f0c : 2c 00 d6 BIT $d600 
1f0f : 10 fb __ BPL $1f0c ; (main.l7645 + 0)
.s422:
1f11 : a9 c5 __ LDA #$c5
1f13 : 8d 01 d6 STA $d601 
1f16 : a9 18 __ LDA #$18
1f18 : 8d 00 d6 STA $d600 
.l7647:
1f1b : 2c 00 d6 BIT $d600 
1f1e : 10 fb __ BPL $1f1b ; (main.l7647 + 0)
.s428:
1f20 : ad 01 d6 LDA $d601 
1f23 : 29 7f __ AND #$7f
1f25 : aa __ __ TAX
1f26 : a9 18 __ LDA #$18
1f28 : 8d 00 d6 STA $d600 
.l7649:
1f2b : 2c 00 d6 BIT $d600 
1f2e : 10 fb __ BPL $1f2b ; (main.l7649 + 0)
.s434:
1f30 : 8e 01 d6 STX $d601 
1f33 : a9 1e __ LDA #$1e
1f35 : 8d 00 d6 STA $d600 
.l7651:
1f38 : 2c 00 d6 BIT $d600 
1f3b : 10 fb __ BPL $1f38 ; (main.l7651 + 0)
.s439:
1f3d : a9 4e __ LDA #$4e
1f3f : 8d 01 d6 STA $d601 
1f42 : ad f0 35 LDA $35f0 ; (vdc_text_attr + 0)
1f45 : 29 f0 __ AND #$f0
1f47 : 09 45 __ ORA #$45
1f49 : 8d f0 35 STA $35f0 ; (vdc_text_attr + 0)
1f4c : a2 00 __ LDX #$00
.l1452:
1f4e : bd 83 31 LDA $3183,x 
1f51 : e8 __ __ INX
1f52 : 09 00 __ ORA #$00
1f54 : d0 f8 __ BNE $1f4e ; (main.l1452 + 0)
.s1453:
1f56 : 86 44 __ STX T3 + 0 
1f58 : a9 12 __ LDA #$12
1f5a : 8d 00 d6 STA $d600 
.l7654:
1f5d : 2c 00 d6 BIT $d600 
1f60 : 10 fb __ BPL $1f5d ; (main.l7654 + 0)
.s459:
1f62 : a9 00 __ LDA #$00
1f64 : 8d 01 d6 STA $d601 
1f67 : a9 13 __ LDA #$13
1f69 : 8d 00 d6 STA $d600 
.l7656:
1f6c : 2c 00 d6 BIT $d600 
1f6f : 10 fb __ BPL $1f6c ; (main.l7656 + 0)
.s464:
1f71 : a9 00 __ LDA #$00
1f73 : 8d 01 d6 STA $d601 
1f76 : a9 1f __ LDA #$1f
1f78 : 8d 00 d6 STA $d600 
1f7b : 8a __ __ TXA
1f7c : f0 46 __ BEQ $1fc4 ; (main.s469 + 0)
.s1482:
1f7e : a2 00 __ LDX #$00
.l467:
1f80 : bd 82 31 LDA $3182,x 
1f83 : c9 20 __ CMP #$20
1f85 : b0 04 __ BCS $1f8b ; (main.s473 + 0)
.s472:
1f87 : 09 80 __ ORA #$80
1f89 : 90 2b __ BCC $1fb6 ; (main.s1456 + 0)
.s473:
1f8b : a8 __ __ TAY
1f8c : c9 40 __ CMP #$40
1f8e : 90 04 __ BCC $1f94 ; (main.s476 + 0)
.s478:
1f90 : c9 60 __ CMP #$60
1f92 : 90 11 __ BCC $1fa5 ; (main.s475 + 0)
.s476:
1f94 : c9 60 __ CMP #$60
1f96 : 90 05 __ BCC $1f9d ; (main.s480 + 0)
.s479:
1f98 : e9 20 __ SBC #$20
1f9a : 4c b6 1f JMP $1fb6 ; (main.s1456 + 0)
.s480:
1f9d : c9 a0 __ CMP #$a0
1f9f : 90 0a __ BCC $1fab ; (main.s488 + 0)
.s490:
1fa1 : c9 c0 __ CMP #$c0
1fa3 : b0 06 __ BCS $1fab ; (main.s488 + 0)
.s475:
1fa5 : 38 __ __ SEC
1fa6 : e9 40 __ SBC #$40
1fa8 : 4c b6 1f JMP $1fb6 ; (main.s1456 + 0)
.s488:
1fab : c9 c0 __ CMP #$c0
1fad : 90 08 __ BCC $1fb7 ; (main.l7660 + 0)
.s494:
1faf : c9 ff __ CMP #$ff
1fb1 : b0 04 __ BCS $1fb7 ; (main.l7660 + 0)
.s491:
1fb3 : 38 __ __ SEC
1fb4 : e9 80 __ SBC #$80
.s1456:
1fb6 : a8 __ __ TAY
.l7660:
1fb7 : 2c 00 d6 BIT $d600 
1fba : 10 fb __ BPL $1fb7 ; (main.l7660 + 0)
.s500:
1fbc : 8c 01 d6 STY $d601 
1fbf : e8 __ __ INX
1fc0 : e4 44 __ CPX T3 + 0 
1fc2 : 90 bc __ BCC $1f80 ; (main.l467 + 0)
.s469:
1fc4 : a9 12 __ LDA #$12
1fc6 : 8d 00 d6 STA $d600 
1fc9 : c6 44 __ DEC T3 + 0 
1fcb : ae f0 35 LDX $35f0 ; (vdc_text_attr + 0)
.l7663:
1fce : 2c 00 d6 BIT $d600 
1fd1 : 10 fb __ BPL $1fce ; (main.l7663 + 0)
.s507:
1fd3 : a9 08 __ LDA #$08
1fd5 : 8d 01 d6 STA $d601 
1fd8 : a9 13 __ LDA #$13
1fda : 8d 00 d6 STA $d600 
.l7665:
1fdd : 2c 00 d6 BIT $d600 
1fe0 : 10 fb __ BPL $1fdd ; (main.l7665 + 0)
.s512:
1fe2 : a9 00 __ LDA #$00
1fe4 : 8d 01 d6 STA $d601 
1fe7 : a9 1f __ LDA #$1f
1fe9 : 8d 00 d6 STA $d600 
.l7667:
1fec : 2c 00 d6 BIT $d600 
1fef : 10 fb __ BPL $1fec ; (main.l7667 + 0)
.s516:
1ff1 : 8e 01 d6 STX $d601 
1ff4 : a9 18 __ LDA #$18
1ff6 : 8d 00 d6 STA $d600 
.l7669:
1ff9 : 2c 00 d6 BIT $d600 
1ffc : 10 fb __ BPL $1ff9 ; (main.l7669 + 0)
.s522:
1ffe : ad 01 d6 LDA $d601 
2001 : 29 7f __ AND #$7f
2003 : a8 __ __ TAY
2004 : a9 18 __ LDA #$18
2006 : 8d 00 d6 STA $d600 
.l7671:
2009 : 2c 00 d6 BIT $d600 
200c : 10 fb __ BPL $2009 ; (main.l7671 + 0)
.s528:
200e : 8c 01 d6 STY $d601 
2011 : a9 1e __ LDA #$1e
2013 : 8d 00 d6 STA $d600 
.l7673:
2016 : 2c 00 d6 BIT $d600 
2019 : 10 fb __ BPL $2016 ; (main.l7673 + 0)
.s533:
201b : a5 44 __ LDA T3 + 0 
201d : 8d 01 d6 STA $d601 
2020 : 8a __ __ TXA
2021 : 29 b0 __ AND #$b0
2023 : 09 0d __ ORA #$0d
2025 : 8d f0 35 STA $35f0 ; (vdc_text_attr + 0)
2028 : a9 00 __ LDA #$00
202a : a0 02 __ LDY #$02
202c : 91 23 __ STA (SP + 0),y 
202e : a9 36 __ LDA #$36
2030 : c8 __ __ INY
2031 : 91 23 __ STA (SP + 0),y 
2033 : a9 b9 __ LDA #$b9
2035 : c8 __ __ INY
2036 : 91 23 __ STA (SP + 0),y 
2038 : a9 34 __ LDA #$34
203a : c8 __ __ INY
203b : 91 23 __ STA (SP + 0),y 
203d : ad f1 35 LDA $35f1 ; (vdc_memsize + 0)
2040 : c8 __ __ INY
2041 : 91 23 __ STA (SP + 0),y 
2043 : a9 00 __ LDA #$00
2045 : c8 __ __ INY
2046 : 91 23 __ STA (SP + 0),y 
2048 : 20 93 31 JSR $3193 ; (sprintf.s1000 + 0)
204b : a9 00 __ LDA #$00
204d : 85 44 __ STA T3 + 0 
204f : ad 00 36 LDA $3600 ; (linebuffer + 0)
2052 : f0 0c __ BEQ $2060 ; (main.s546 + 0)
.s545:
2054 : a2 00 __ LDX #$00
.l1454:
2056 : bd 01 36 LDA $3601,x ; (linebuffer + 1)
2059 : e8 __ __ INX
205a : 09 00 __ ORA #$00
205c : d0 f8 __ BNE $2056 ; (main.l1454 + 0)
.s1455:
205e : 86 44 __ STX T3 + 0 
.s546:
2060 : a9 12 __ LDA #$12
2062 : 8d 00 d6 STA $d600 
.l7677:
2065 : 2c 00 d6 BIT $d600 
2068 : 10 fb __ BPL $2065 ; (main.l7677 + 0)
.s553:
206a : a9 00 __ LDA #$00
206c : 8d 01 d6 STA $d601 
206f : a9 13 __ LDA #$13
2071 : 8d 00 d6 STA $d600 
.l7679:
2074 : 2c 00 d6 BIT $d600 
2077 : 10 fb __ BPL $2074 ; (main.l7679 + 0)
.s558:
2079 : a9 a0 __ LDA #$a0
207b : 8d 01 d6 STA $d601 
207e : a9 1f __ LDA #$1f
2080 : 8d 00 d6 STA $d600 
2083 : a5 44 __ LDA T3 + 0 
2085 : f0 62 __ BEQ $20e9 ; (main.s563 + 0)
.s1471:
2087 : a2 00 __ LDX #$00
.l561:
2089 : bd 00 36 LDA $3600,x ; (linebuffer + 0)
208c : c9 20 __ CMP #$20
208e : b0 05 __ BCS $2095 ; (main.s567 + 0)
.s566:
2090 : 69 80 __ ADC #$80
2092 : 4c db 20 JMP $20db ; (main.s1457 + 0)
.s567:
2095 : a8 __ __ TAY
2096 : c9 40 __ CMP #$40
2098 : 90 04 __ BCC $209e ; (main.s570 + 0)
.s572:
209a : c9 60 __ CMP #$60
209c : 90 23 __ BCC $20c1 ; (main.s569 + 0)
.s570:
209e : c9 60 __ CMP #$60
20a0 : 90 0a __ BCC $20ac ; (main.s574 + 0)
.s576:
20a2 : 09 00 __ ORA #$00
20a4 : 30 06 __ BMI $20ac ; (main.s574 + 0)
.s573:
20a6 : 38 __ __ SEC
20a7 : e9 20 __ SBC #$20
20a9 : 4c db 20 JMP $20db ; (main.s1457 + 0)
.s574:
20ac : c9 80 __ CMP #$80
20ae : 90 09 __ BCC $20b9 ; (main.s578 + 0)
.s580:
20b0 : c9 a0 __ CMP #$a0
20b2 : b0 05 __ BCS $20b9 ; (main.s578 + 0)
.s577:
20b4 : 69 40 __ ADC #$40
20b6 : 4c db 20 JMP $20db ; (main.s1457 + 0)
.s578:
20b9 : c9 a0 __ CMP #$a0
20bb : 90 0a __ BCC $20c7 ; (main.s582 + 0)
.s584:
20bd : c9 c0 __ CMP #$c0
20bf : b0 06 __ BCS $20c7 ; (main.s582 + 0)
.s569:
20c1 : 38 __ __ SEC
20c2 : e9 40 __ SBC #$40
20c4 : 4c db 20 JMP $20db ; (main.s1457 + 0)
.s582:
20c7 : c9 c0 __ CMP #$c0
20c9 : 90 0a __ BCC $20d5 ; (main.s586 + 0)
.s588:
20cb : c9 ff __ CMP #$ff
20cd : b0 06 __ BCS $20d5 ; (main.s586 + 0)
.s585:
20cf : 38 __ __ SEC
20d0 : e9 80 __ SBC #$80
20d2 : 4c db 20 JMP $20db ; (main.s1457 + 0)
.s586:
20d5 : c9 ff __ CMP #$ff
20d7 : d0 03 __ BNE $20dc ; (main.l7683 + 0)
.s589:
20d9 : a9 5e __ LDA #$5e
.s1457:
20db : a8 __ __ TAY
.l7683:
20dc : 2c 00 d6 BIT $d600 
20df : 10 fb __ BPL $20dc ; (main.l7683 + 0)
.s594:
20e1 : 8c 01 d6 STY $d601 
20e4 : e8 __ __ INX
20e5 : e4 44 __ CPX T3 + 0 
20e7 : 90 a0 __ BCC $2089 ; (main.l561 + 0)
.s563:
20e9 : a9 12 __ LDA #$12
20eb : 8d 00 d6 STA $d600 
20ee : c6 44 __ DEC T3 + 0 
20f0 : ae f0 35 LDX $35f0 ; (vdc_text_attr + 0)
.l7686:
20f3 : 2c 00 d6 BIT $d600 
20f6 : 10 fb __ BPL $20f3 ; (main.l7686 + 0)
.s601:
20f8 : a9 08 __ LDA #$08
20fa : 8d 01 d6 STA $d601 
20fd : a9 13 __ LDA #$13
20ff : 8d 00 d6 STA $d600 
.l7688:
2102 : 2c 00 d6 BIT $d600 
2105 : 10 fb __ BPL $2102 ; (main.l7688 + 0)
.s606:
2107 : a9 a0 __ LDA #$a0
2109 : 8d 01 d6 STA $d601 
210c : a9 1f __ LDA #$1f
210e : 8d 00 d6 STA $d600 
.l7690:
2111 : 2c 00 d6 BIT $d600 
2114 : 10 fb __ BPL $2111 ; (main.l7690 + 0)
.s610:
2116 : 8e 01 d6 STX $d601 
2119 : a9 18 __ LDA #$18
211b : 8d 00 d6 STA $d600 
.l7692:
211e : 2c 00 d6 BIT $d600 
2121 : 10 fb __ BPL $211e ; (main.l7692 + 0)
.s616:
2123 : ad 01 d6 LDA $d601 
2126 : 29 7f __ AND #$7f
2128 : aa __ __ TAX
2129 : a9 18 __ LDA #$18
212b : 8d 00 d6 STA $d600 
.l7694:
212e : 2c 00 d6 BIT $d600 
2131 : 10 fb __ BPL $212e ; (main.l7694 + 0)
.s622:
2133 : 8e 01 d6 STX $d601 
2136 : a9 1e __ LDA #$1e
2138 : 8d 00 d6 STA $d600 
.l7696:
213b : 2c 00 d6 BIT $d600 
213e : 10 fb __ BPL $213b ; (main.l7696 + 0)
.s627:
2140 : a5 44 __ LDA T3 + 0 
2142 : 8d 01 d6 STA $d601 
2145 : a9 12 __ LDA #$12
2147 : 8d 00 d6 STA $d600 
.l7698:
214a : 2c 00 d6 BIT $d600 
214d : 10 fb __ BPL $214a ; (main.l7698 + 0)
.s641:
214f : a9 00 __ LDA #$00
2151 : 8d 01 d6 STA $d601 
2154 : a9 13 __ LDA #$13
2156 : 8d 00 d6 STA $d600 
.l7700:
2159 : 2c 00 d6 BIT $d600 
215c : 10 fb __ BPL $2159 ; (main.l7700 + 0)
.s646:
215e : a9 f4 __ LDA #$f4
2160 : 8d 01 d6 STA $d601 
2163 : a9 1f __ LDA #$1f
2165 : 8d 00 d6 STA $d600 
.l7702:
2168 : 2c 00 d6 BIT $d600 
216b : 10 fb __ BPL $2168 ; (main.l7702 + 0)
.s650:
216d : a9 6c __ LDA #$6c
216f : 8d 01 d6 STA $d601 
2172 : a9 12 __ LDA #$12
2174 : 8d 00 d6 STA $d600 
.l7704:
2177 : 2c 00 d6 BIT $d600 
217a : 10 fb __ BPL $2177 ; (main.l7704 + 0)
.s657:
217c : a9 08 __ LDA #$08
217e : 8d 01 d6 STA $d601 
2181 : a9 13 __ LDA #$13
2183 : 8d 00 d6 STA $d600 
.l7706:
2186 : 2c 00 d6 BIT $d600 
2189 : 10 fb __ BPL $2186 ; (main.l7706 + 0)
.s662:
218b : a9 f4 __ LDA #$f4
218d : 8d 01 d6 STA $d601 
2190 : a9 1f __ LDA #$1f
2192 : 8d 00 d6 STA $d600 
.l7708:
2195 : 2c 00 d6 BIT $d600 
2198 : 10 fb __ BPL $2195 ; (main.l7708 + 0)
.s666:
219a : a9 09 __ LDA #$09
219c : 8d 01 d6 STA $d601 
219f : a9 12 __ LDA #$12
21a1 : 8d 00 d6 STA $d600 
.l7710:
21a4 : 2c 00 d6 BIT $d600 
21a7 : 10 fb __ BPL $21a4 ; (main.l7710 + 0)
.s680:
21a9 : a9 00 __ LDA #$00
21ab : 8d 01 d6 STA $d601 
21ae : a9 13 __ LDA #$13
21b0 : 8d 00 d6 STA $d600 
.l7712:
21b3 : 2c 00 d6 BIT $d600 
21b6 : 10 fb __ BPL $21b3 ; (main.l7712 + 0)
.s685:
21b8 : a9 f5 __ LDA #$f5
21ba : 8d 01 d6 STA $d601 
21bd : a9 1f __ LDA #$1f
21bf : 8d 00 d6 STA $d600 
.l7714:
21c2 : 2c 00 d6 BIT $d600 
21c5 : 10 fb __ BPL $21c2 ; (main.l7714 + 0)
.s689:
21c7 : a9 62 __ LDA #$62
21c9 : 8d 01 d6 STA $d601 
21cc : a9 18 __ LDA #$18
21ce : 8d 00 d6 STA $d600 
.l7716:
21d1 : 2c 00 d6 BIT $d600 
21d4 : 10 fb __ BPL $21d1 ; (main.l7716 + 0)
.s695:
21d6 : ad 01 d6 LDA $d601 
21d9 : 29 7f __ AND #$7f
21db : aa __ __ TAX
21dc : a9 18 __ LDA #$18
21de : 8d 00 d6 STA $d600 
.l7718:
21e1 : 2c 00 d6 BIT $d600 
21e4 : 10 fb __ BPL $21e1 ; (main.l7718 + 0)
.s701:
21e6 : 8e 01 d6 STX $d601 
21e9 : a9 1e __ LDA #$1e
21eb : 8d 00 d6 STA $d600 
.l7720:
21ee : 2c 00 d6 BIT $d600 
21f1 : 10 fb __ BPL $21ee ; (main.l7720 + 0)
.s706:
21f3 : a9 45 __ LDA #$45
21f5 : 8d 01 d6 STA $d601 
21f8 : a9 12 __ LDA #$12
21fa : 8d 00 d6 STA $d600 
.l7722:
21fd : 2c 00 d6 BIT $d600 
2200 : 10 fb __ BPL $21fd ; (main.l7722 + 0)
.s713:
2202 : a9 08 __ LDA #$08
2204 : 8d 01 d6 STA $d601 
2207 : a9 13 __ LDA #$13
2209 : 8d 00 d6 STA $d600 
.l7724:
220c : 2c 00 d6 BIT $d600 
220f : 10 fb __ BPL $220c ; (main.l7724 + 0)
.s718:
2211 : a9 f5 __ LDA #$f5
2213 : 8d 01 d6 STA $d601 
2216 : a9 1f __ LDA #$1f
2218 : 8d 00 d6 STA $d600 
.l7726:
221b : 2c 00 d6 BIT $d600 
221e : 10 fb __ BPL $221b ; (main.l7726 + 0)
.s722:
2220 : a9 09 __ LDA #$09
2222 : 8d 01 d6 STA $d601 
2225 : a9 18 __ LDA #$18
2227 : 8d 00 d6 STA $d600 
.l7728:
222a : 2c 00 d6 BIT $d600 
222d : 10 fb __ BPL $222a ; (main.l7728 + 0)
.s728:
222f : ad 01 d6 LDA $d601 
2232 : 29 7f __ AND #$7f
2234 : aa __ __ TAX
2235 : a9 18 __ LDA #$18
2237 : 8d 00 d6 STA $d600 
.l7730:
223a : 2c 00 d6 BIT $d600 
223d : 10 fb __ BPL $223a ; (main.l7730 + 0)
.s734:
223f : 8e 01 d6 STX $d601 
2242 : a9 1e __ LDA #$1e
2244 : 8d 00 d6 STA $d600 
.l7732:
2247 : 2c 00 d6 BIT $d600 
224a : 10 fb __ BPL $2247 ; (main.l7732 + 0)
.s739:
224c : a9 45 __ LDA #$45
224e : 8d 01 d6 STA $d601 
2251 : a9 12 __ LDA #$12
2253 : 8d 00 d6 STA $d600 
.l7734:
2256 : 2c 00 d6 BIT $d600 
2259 : 10 fb __ BPL $2256 ; (main.l7734 + 0)
.s753:
225b : a9 01 __ LDA #$01
225d : 8d 01 d6 STA $d601 
2260 : a9 13 __ LDA #$13
2262 : 8d 00 d6 STA $d600 
.l7736:
2265 : 2c 00 d6 BIT $d600 
2268 : 10 fb __ BPL $2265 ; (main.l7736 + 0)
.s758:
226a : a9 3b __ LDA #$3b
226c : 8d 01 d6 STA $d601 
226f : a9 1f __ LDA #$1f
2271 : 8d 00 d6 STA $d600 
.l7738:
2274 : 2c 00 d6 BIT $d600 
2277 : 10 fb __ BPL $2274 ; (main.l7738 + 0)
.s762:
2279 : a9 7b __ LDA #$7b
227b : 8d 01 d6 STA $d601 
227e : a9 12 __ LDA #$12
2280 : 8d 00 d6 STA $d600 
.l7740:
2283 : 2c 00 d6 BIT $d600 
2286 : 10 fb __ BPL $2283 ; (main.l7740 + 0)
.s769:
2288 : a9 09 __ LDA #$09
228a : 8d 01 d6 STA $d601 
228d : a9 13 __ LDA #$13
228f : 8d 00 d6 STA $d600 
.l7742:
2292 : 2c 00 d6 BIT $d600 
2295 : 10 fb __ BPL $2292 ; (main.l7742 + 0)
.s774:
2297 : a9 3b __ LDA #$3b
2299 : 8d 01 d6 STA $d601 
229c : a9 1f __ LDA #$1f
229e : 8d 00 d6 STA $d600 
.l7744:
22a1 : 2c 00 d6 BIT $d600 
22a4 : 10 fb __ BPL $22a1 ; (main.l7744 + 0)
.s778:
22a6 : a9 09 __ LDA #$09
22a8 : 8d 01 d6 STA $d601 
22ab : a9 04 __ LDA #$04
22ad : 85 43 __ STA T2 + 0 
.l781:
22af : a9 12 __ LDA #$12
22b1 : 8d 00 d6 STA $d600 
22b4 : a5 43 __ LDA T2 + 0 
22b6 : 0a __ __ ASL
22b7 : 85 1b __ STA ACCU + 0 
22b9 : a9 00 __ LDA #$00
22bb : 2a __ __ ROL
22bc : 06 1b __ ASL ACCU + 0 
22be : 2a __ __ ROL
22bf : aa __ __ TAX
22c0 : a5 1b __ LDA ACCU + 0 
22c2 : 65 43 __ ADC T2 + 0 
22c4 : 85 44 __ STA T3 + 0 
22c6 : 8a __ __ TXA
22c7 : 69 00 __ ADC #$00
22c9 : 06 44 __ ASL T3 + 0 
22cb : 2a __ __ ROL
22cc : 06 44 __ ASL T3 + 0 
22ce : 2a __ __ ROL
22cf : 06 44 __ ASL T3 + 0 
22d1 : 2a __ __ ROL
22d2 : 06 44 __ ASL T3 + 0 
22d4 : 2a __ __ ROL
22d5 : aa __ __ TAX
22d6 : a5 44 __ LDA T3 + 0 
22d8 : 09 04 __ ORA #$04
22da : 85 44 __ STA T3 + 0 
22dc : e0 07 __ CPX #$07
22de : d0 02 __ BNE $22e2 ; (main.s1175 + 0)
.s1174:
22e0 : c9 d0 __ CMP #$d0
.s1175:
22e2 : 90 04 __ BCC $22e8 ; (main.l7747 + 0)
.s787:
22e4 : a2 ff __ LDX #$ff
22e6 : 86 44 __ STX T3 + 0 
.l7747:
22e8 : 2c 00 d6 BIT $d600 
22eb : 10 fb __ BPL $22e8 ; (main.l7747 + 0)
.s797:
22ed : 8e 01 d6 STX $d601 
22f0 : a9 13 __ LDA #$13
22f2 : 8d 00 d6 STA $d600 
.l7749:
22f5 : 2c 00 d6 BIT $d600 
22f8 : 10 fb __ BPL $22f5 ; (main.l7749 + 0)
.s802:
22fa : a5 44 __ LDA T3 + 0 
22fc : 8d 01 d6 STA $d601 
22ff : a9 1f __ LDA #$1f
2301 : 8d 00 d6 STA $d600 
.l7751:
2304 : 2c 00 d6 BIT $d600 
2307 : 10 fb __ BPL $2304 ; (main.l7751 + 0)
.s806:
2309 : a9 e1 __ LDA #$e1
230b : 8d 01 d6 STA $d601 
230e : a9 12 __ LDA #$12
2310 : 8d 00 d6 STA $d600 
2313 : 8a __ __ TXA
2314 : 18 __ __ CLC
2315 : 69 08 __ ADC #$08
.l7753:
2317 : 2c 00 d6 BIT $d600 
231a : 10 fb __ BPL $2317 ; (main.l7753 + 0)
.s813:
231c : 8d 01 d6 STA $d601 
231f : a9 13 __ LDA #$13
2321 : 8d 00 d6 STA $d600 
.l7755:
2324 : 2c 00 d6 BIT $d600 
2327 : 10 fb __ BPL $2324 ; (main.l7755 + 0)
.s818:
2329 : a5 44 __ LDA T3 + 0 
232b : 8d 01 d6 STA $d601 
232e : a9 1f __ LDA #$1f
2330 : 8d 00 d6 STA $d600 
.l7757:
2333 : 2c 00 d6 BIT $d600 
2336 : 10 fb __ BPL $2333 ; (main.l7757 + 0)
.s822:
2338 : a9 09 __ LDA #$09
233a : 8d 01 d6 STA $d601 
233d : e6 43 __ INC T2 + 0 
233f : a5 43 __ LDA T2 + 0 
2341 : c9 18 __ CMP #$18
2343 : b0 03 __ BCS $2348 ; (main.s779 + 0)
2345 : 4c af 22 JMP $22af ; (main.l781 + 0)
.s779:
2348 : a9 04 __ LDA #$04
234a : 85 43 __ STA T2 + 0 
.l824:
234c : a9 12 __ LDA #$12
234e : 8d 00 d6 STA $d600 
2351 : a5 43 __ LDA T2 + 0 
2353 : c9 18 __ CMP #$18
2355 : b0 03 __ BCS $235a ; (main.l7772 + 0)
2357 : 4c 50 28 JMP $2850 ; (main.s825 + 0)
.l7772:
235a : 2c 00 d6 BIT $d600 
235d : 10 fb __ BPL $235a ; (main.l7772 + 0)
.s880:
235f : a9 07 __ LDA #$07
2361 : 8d 01 d6 STA $d601 
2364 : a9 13 __ LDA #$13
2366 : 8d 00 d6 STA $d600 
.l7774:
2369 : 2c 00 d6 BIT $d600 
236c : 10 fb __ BPL $2369 ; (main.l7774 + 0)
.s885:
236e : a9 84 __ LDA #$84
2370 : 8d 01 d6 STA $d601 
2373 : a9 1f __ LDA #$1f
2375 : 8d 00 d6 STA $d600 
.l7776:
2378 : 2c 00 d6 BIT $d600 
237b : 10 fb __ BPL $2378 ; (main.l7776 + 0)
.s889:
237d : a9 7c __ LDA #$7c
237f : 8d 01 d6 STA $d601 
2382 : a9 12 __ LDA #$12
2384 : 8d 00 d6 STA $d600 
.l7778:
2387 : 2c 00 d6 BIT $d600 
238a : 10 fb __ BPL $2387 ; (main.l7778 + 0)
.s896:
238c : a9 0f __ LDA #$0f
238e : 8d 01 d6 STA $d601 
2391 : a9 13 __ LDA #$13
2393 : 8d 00 d6 STA $d600 
.l7780:
2396 : 2c 00 d6 BIT $d600 
2399 : 10 fb __ BPL $2396 ; (main.l7780 + 0)
.s901:
239b : a9 84 __ LDA #$84
239d : 8d 01 d6 STA $d601 
23a0 : a9 1f __ LDA #$1f
23a2 : 8d 00 d6 STA $d600 
.l7782:
23a5 : 2c 00 d6 BIT $d600 
23a8 : 10 fb __ BPL $23a5 ; (main.l7782 + 0)
.s905:
23aa : a9 09 __ LDA #$09
23ac : 8d 01 d6 STA $d601 
23af : a9 12 __ LDA #$12
23b1 : 8d 00 d6 STA $d600 
.l7784:
23b4 : 2c 00 d6 BIT $d600 
23b7 : 10 fb __ BPL $23b4 ; (main.l7784 + 0)
.s919:
23b9 : a9 07 __ LDA #$07
23bb : 8d 01 d6 STA $d601 
23be : a9 13 __ LDA #$13
23c0 : 8d 00 d6 STA $d600 
.l7786:
23c3 : 2c 00 d6 BIT $d600 
23c6 : 10 fb __ BPL $23c3 ; (main.l7786 + 0)
.s924:
23c8 : a9 85 __ LDA #$85
23ca : 8d 01 d6 STA $d601 
23cd : a9 1f __ LDA #$1f
23cf : 8d 00 d6 STA $d600 
.l7788:
23d2 : 2c 00 d6 BIT $d600 
23d5 : 10 fb __ BPL $23d2 ; (main.l7788 + 0)
.s928:
23d7 : a9 e2 __ LDA #$e2
23d9 : 8d 01 d6 STA $d601 
23dc : a9 18 __ LDA #$18
23de : 8d 00 d6 STA $d600 
.l7790:
23e1 : 2c 00 d6 BIT $d600 
23e4 : 10 fb __ BPL $23e1 ; (main.l7790 + 0)
.s934:
23e6 : ad 01 d6 LDA $d601 
23e9 : 29 7f __ AND #$7f
23eb : aa __ __ TAX
23ec : a9 18 __ LDA #$18
23ee : 8d 00 d6 STA $d600 
.l7792:
23f1 : 2c 00 d6 BIT $d600 
23f4 : 10 fb __ BPL $23f1 ; (main.l7792 + 0)
.s940:
23f6 : 8e 01 d6 STX $d601 
23f9 : a9 1e __ LDA #$1e
23fb : 8d 00 d6 STA $d600 
.l7794:
23fe : 2c 00 d6 BIT $d600 
2401 : 10 fb __ BPL $23fe ; (main.l7794 + 0)
.s945:
2403 : a9 45 __ LDA #$45
2405 : 8d 01 d6 STA $d601 
2408 : a9 12 __ LDA #$12
240a : 8d 00 d6 STA $d600 
.l7796:
240d : 2c 00 d6 BIT $d600 
2410 : 10 fb __ BPL $240d ; (main.l7796 + 0)
.s952:
2412 : a9 0f __ LDA #$0f
2414 : 8d 01 d6 STA $d601 
2417 : a9 13 __ LDA #$13
2419 : 8d 00 d6 STA $d600 
.l7798:
241c : 2c 00 d6 BIT $d600 
241f : 10 fb __ BPL $241c ; (main.l7798 + 0)
.s957:
2421 : a9 85 __ LDA #$85
2423 : 8d 01 d6 STA $d601 
2426 : a9 1f __ LDA #$1f
2428 : 8d 00 d6 STA $d600 
.l7800:
242b : 2c 00 d6 BIT $d600 
242e : 10 fb __ BPL $242b ; (main.l7800 + 0)
.s961:
2430 : a9 09 __ LDA #$09
2432 : 8d 01 d6 STA $d601 
2435 : a9 18 __ LDA #$18
2437 : 8d 00 d6 STA $d600 
.l7802:
243a : 2c 00 d6 BIT $d600 
243d : 10 fb __ BPL $243a ; (main.l7802 + 0)
.s967:
243f : ad 01 d6 LDA $d601 
2442 : 29 7f __ AND #$7f
2444 : aa __ __ TAX
2445 : a9 18 __ LDA #$18
2447 : 8d 00 d6 STA $d600 
.l7804:
244a : 2c 00 d6 BIT $d600 
244d : 10 fb __ BPL $244a ; (main.l7804 + 0)
.s973:
244f : 8e 01 d6 STX $d601 
2452 : a9 1e __ LDA #$1e
2454 : 8d 00 d6 STA $d600 
.l7806:
2457 : 2c 00 d6 BIT $d600 
245a : 10 fb __ BPL $2457 ; (main.l7806 + 0)
.s978:
245c : a9 45 __ LDA #$45
245e : 8d 01 d6 STA $d601 
2461 : a9 12 __ LDA #$12
2463 : 8d 00 d6 STA $d600 
.l7808:
2466 : 2c 00 d6 BIT $d600 
2469 : 10 fb __ BPL $2466 ; (main.l7808 + 0)
.s992:
246b : a9 07 __ LDA #$07
246d : 8d 01 d6 STA $d601 
2470 : a9 13 __ LDA #$13
2472 : 8d 00 d6 STA $d600 
.l7810:
2475 : 2c 00 d6 BIT $d600 
2478 : 10 fb __ BPL $2475 ; (main.l7810 + 0)
.s997:
247a : a9 cb __ LDA #$cb
247c : 8d 01 d6 STA $d601 
247f : a9 1f __ LDA #$1f
2481 : 8d 00 d6 STA $d600 
.l7812:
2484 : 2c 00 d6 BIT $d600 
2487 : 10 fb __ BPL $2484 ; (main.l7812 + 0)
.s1001:
2489 : a9 7e __ LDA #$7e
248b : 8d 01 d6 STA $d601 
248e : a9 12 __ LDA #$12
2490 : 8d 00 d6 STA $d600 
.l7814:
2493 : 2c 00 d6 BIT $d600 
2496 : 10 fb __ BPL $2493 ; (main.l7814 + 0)
.s1008:
2498 : a9 0f __ LDA #$0f
249a : 8d 01 d6 STA $d601 
249d : a9 13 __ LDA #$13
249f : 8d 00 d6 STA $d600 
.l7816:
24a2 : 2c 00 d6 BIT $d600 
24a5 : 10 fb __ BPL $24a2 ; (main.l7816 + 0)
.s1013:
24a7 : a9 cb __ LDA #$cb
24a9 : 8d 01 d6 STA $d601 
24ac : a9 1f __ LDA #$1f
24ae : 8d 00 d6 STA $d600 
.l7818:
24b1 : 2c 00 d6 BIT $d600 
24b4 : 10 fb __ BPL $24b1 ; (main.l7818 + 0)
.s1017:
24b6 : a9 09 __ LDA #$09
24b8 : 8d 01 d6 STA $d601 
24bb : a9 40 __ LDA #$40
24bd : 85 44 __ STA T3 + 0 
24bf : a9 01 __ LDA #$01
24c1 : 85 45 __ STA T3 + 1 
24c3 : a9 14 __ LDA #$14
24c5 : 85 43 __ STA T2 + 0 
24c7 : a0 00 __ LDY #$00
.l1019:
24c9 : a2 05 __ LDX #$05
.l1023:
24cb : a9 12 __ LDA #$12
24cd : 8d 00 d6 STA $d600 
24d0 : 8a __ __ TXA
24d1 : 18 __ __ CLC
24d2 : 65 44 __ ADC T3 + 0 
24d4 : 85 47 __ STA T5 + 0 
24d6 : a9 00 __ LDA #$00
24d8 : 65 45 __ ADC T3 + 1 
24da : 85 48 __ STA T5 + 1 
24dc : c9 07 __ CMP #$07
24de : d0 04 __ BNE $24e4 ; (main.s1097 + 0)
.s1096:
24e0 : a5 47 __ LDA T5 + 0 
24e2 : c9 d0 __ CMP #$d0
.s1097:
24e4 : 90 06 __ BCC $24ec ; (main.s1027 + 0)
.s1029:
24e6 : a9 ff __ LDA #$ff
24e8 : 85 47 __ STA T5 + 0 
24ea : 85 48 __ STA T5 + 1 
.s1027:
24ec : 84 4a __ STY T7 + 0 
24ee : a5 4f __ LDA T0 + 0 
24f0 : 85 49 __ STA T6 + 0 
24f2 : e6 4f __ INC T0 + 0 
24f4 : c8 __ __ INY
.l7821:
24f5 : 2c 00 d6 BIT $d600 
24f8 : 10 fb __ BPL $24f5 ; (main.l7821 + 0)
.s1039:
24fa : a5 48 __ LDA T5 + 1 
24fc : 8d 01 d6 STA $d601 
24ff : a9 13 __ LDA #$13
2501 : 8d 00 d6 STA $d600 
.l7823:
2504 : 2c 00 d6 BIT $d600 
2507 : 10 fb __ BPL $2504 ; (main.l7823 + 0)
.s1044:
2509 : a5 47 __ LDA T5 + 0 
250b : 8d 01 d6 STA $d601 
250e : a9 1f __ LDA #$1f
2510 : 8d 00 d6 STA $d600 
.l7825:
2513 : 2c 00 d6 BIT $d600 
2516 : 10 fb __ BPL $2513 ; (main.l7825 + 0)
.s1048:
2518 : a5 49 __ LDA T6 + 0 
251a : 8d 01 d6 STA $d601 
251d : a9 12 __ LDA #$12
251f : 8d 00 d6 STA $d600 
2522 : 18 __ __ CLC
2523 : a5 48 __ LDA T5 + 1 
2525 : 69 08 __ ADC #$08
.l7827:
2527 : 2c 00 d6 BIT $d600 
252a : 10 fb __ BPL $2527 ; (main.l7827 + 0)
.s1055:
252c : 8d 01 d6 STA $d601 
252f : a9 13 __ LDA #$13
2531 : 8d 00 d6 STA $d600 
.l7829:
2534 : 2c 00 d6 BIT $d600 
2537 : 10 fb __ BPL $2534 ; (main.l7829 + 0)
.s1060:
2539 : a5 47 __ LDA T5 + 0 
253b : 8d 01 d6 STA $d601 
253e : a9 1f __ LDA #$1f
2540 : 8d 00 d6 STA $d600 
.l7831:
2543 : 2c 00 d6 BIT $d600 
2546 : 10 fb __ BPL $2543 ; (main.l7831 + 0)
.s1064:
2548 : a5 4a __ LDA T7 + 0 
254a : 8d 01 d6 STA $d601 
254d : c0 10 __ CPY #$10
254f : 90 02 __ BCC $2553 ; (main.s4919 + 0)
.s1065:
2551 : a0 00 __ LDY #$00
.s4919:
2553 : e8 __ __ INX
2554 : e0 4b __ CPX #$4b
2556 : b0 03 __ BCS $255b ; (main.s1020 + 0)
2558 : 4c cb 24 JMP $24cb ; (main.l1023 + 0)
.s1020:
255b : a5 44 __ LDA T3 + 0 
255d : 69 4f __ ADC #$4f
255f : 85 44 __ STA T3 + 0 
2561 : 90 02 __ BCC $2565 ; (main.s1466 + 0)
.s1465:
2563 : e6 45 __ INC T3 + 1 
.s1466:
2565 : c6 43 __ DEC T2 + 0 
2567 : f0 03 __ BEQ $256c ; (main.s1021 + 0)
2569 : 4c c9 24 JMP $24c9 ; (main.l1019 + 0)
.s1021:
256c : a9 14 __ LDA #$14
256e : 85 4f __ STA T0 + 0 
.l1075:
2570 : 20 37 31 JSR $3137 ; (getch.s0 + 0)
2573 : a9 95 __ LDA #$95
2575 : 85 47 __ STA T5 + 0 
2577 : a9 13 __ LDA #$13
2579 : 85 1b __ STA ACCU + 0 
257b : a0 01 __ LDY #$01
257d : 84 48 __ STY T5 + 1 
257f : a2 45 __ LDX #$45
.l1080:
2581 : a9 12 __ LDA #$12
2583 : 8d 00 d6 STA $d600 
.l7836:
2586 : 2c 00 d6 BIT $d600 
2589 : 10 fb __ BPL $2586 ; (main.l7836 + 0)
.s1089:
258b : 8c 01 d6 STY $d601 
258e : a9 13 __ LDA #$13
2590 : 8d 00 d6 STA $d600 
.l7838:
2593 : 2c 00 d6 BIT $d600 
2596 : 10 fb __ BPL $2593 ; (main.l7838 + 0)
.s1094:
2598 : 8e 01 d6 STX $d601 
259b : a9 1f __ LDA #$1f
259d : 8d 00 d6 STA $d600 
25a0 : a9 18 __ LDA #$18
25a2 : 8d 00 d6 STA $d600 
.l7840:
25a5 : 2c 00 d6 BIT $d600 
25a8 : 10 fb __ BPL $25a5 ; (main.l7840 + 0)
.s1101:
25aa : ad 01 d6 LDA $d601 
25ad : 09 80 __ ORA #$80
25af : 85 4a __ STA T7 + 0 
25b1 : a9 18 __ LDA #$18
25b3 : 8d 00 d6 STA $d600 
.l7842:
25b6 : 2c 00 d6 BIT $d600 
25b9 : 10 fb __ BPL $25b6 ; (main.l7842 + 0)
.s1107:
25bb : a5 4a __ LDA T7 + 0 
25bd : 8d 01 d6 STA $d601 
25c0 : a9 20 __ LDA #$20
25c2 : 8d 00 d6 STA $d600 
.l7844:
25c5 : 2c 00 d6 BIT $d600 
25c8 : 10 fb __ BPL $25c5 ; (main.l7844 + 0)
.s1112:
25ca : a5 48 __ LDA T5 + 1 
25cc : 8d 01 d6 STA $d601 
25cf : a9 21 __ LDA #$21
25d1 : 8d 00 d6 STA $d600 
.l7846:
25d4 : 2c 00 d6 BIT $d600 
25d7 : 10 fb __ BPL $25d4 ; (main.l7846 + 0)
.s1117:
25d9 : a5 47 __ LDA T5 + 0 
25db : 8d 01 d6 STA $d601 
25de : a9 1f __ LDA #$1f
25e0 : 8d 00 d6 STA $d600 
25e3 : a9 1e __ LDA #$1e
25e5 : 8d 00 d6 STA $d600 
.l7848:
25e8 : 2c 00 d6 BIT $d600 
25eb : 10 fb __ BPL $25e8 ; (main.l7848 + 0)
.s1123:
25ed : a9 46 __ LDA #$46
25ef : 8d 01 d6 STA $d601 
25f2 : 18 __ __ CLC
25f3 : a5 47 __ LDA T5 + 0 
25f5 : 69 50 __ ADC #$50
25f7 : 85 47 __ STA T5 + 0 
25f9 : 90 02 __ BCC $25fd ; (main.s1468 + 0)
.s1467:
25fb : e6 48 __ INC T5 + 1 
.s1468:
25fd : 8a __ __ TXA
25fe : 18 __ __ CLC
25ff : 69 50 __ ADC #$50
2601 : aa __ __ TAX
2602 : 90 01 __ BCC $2605 ; (main.s1470 + 0)
.s1469:
2604 : c8 __ __ INY
.s1470:
2605 : c6 1b __ DEC ACCU + 0 
2607 : f0 03 __ BEQ $260c ; (main.s1078 + 0)
2609 : 4c 81 25 JMP $2581 ; (main.l1080 + 0)
.s1078:
260c : a9 95 __ LDA #$95
260e : 85 47 __ STA T5 + 0 
2610 : a9 13 __ LDA #$13
2612 : 85 1b __ STA ACCU + 0 
2614 : a0 09 __ LDY #$09
2616 : 84 48 __ STY T5 + 1 
2618 : a2 45 __ LDX #$45
.l1126:
261a : a9 12 __ LDA #$12
261c : 8d 00 d6 STA $d600 
.l7851:
261f : 2c 00 d6 BIT $d600 
2622 : 10 fb __ BPL $261f ; (main.l7851 + 0)
.s1135:
2624 : 8c 01 d6 STY $d601 
2627 : a9 13 __ LDA #$13
2629 : 8d 00 d6 STA $d600 
.l7853:
262c : 2c 00 d6 BIT $d600 
262f : 10 fb __ BPL $262c ; (main.l7853 + 0)
.s1140:
2631 : 8e 01 d6 STX $d601 
2634 : a9 1f __ LDA #$1f
2636 : 8d 00 d6 STA $d600 
2639 : a9 18 __ LDA #$18
263b : 8d 00 d6 STA $d600 
.l7855:
263e : 2c 00 d6 BIT $d600 
2641 : 10 fb __ BPL $263e ; (main.l7855 + 0)
.s1147:
2643 : ad 01 d6 LDA $d601 
2646 : 09 80 __ ORA #$80
2648 : 85 4a __ STA T7 + 0 
264a : a9 18 __ LDA #$18
264c : 8d 00 d6 STA $d600 
.l7857:
264f : 2c 00 d6 BIT $d600 
2652 : 10 fb __ BPL $264f ; (main.l7857 + 0)
.s1153:
2654 : a5 4a __ LDA T7 + 0 
2656 : 8d 01 d6 STA $d601 
2659 : a9 20 __ LDA #$20
265b : 8d 00 d6 STA $d600 
.l7859:
265e : 2c 00 d6 BIT $d600 
2661 : 10 fb __ BPL $265e ; (main.l7859 + 0)
.s1158:
2663 : a5 48 __ LDA T5 + 1 
2665 : 8d 01 d6 STA $d601 
2668 : a9 21 __ LDA #$21
266a : 8d 00 d6 STA $d600 
.l7861:
266d : 2c 00 d6 BIT $d600 
2670 : 10 fb __ BPL $266d ; (main.l7861 + 0)
.s1163:
2672 : a5 47 __ LDA T5 + 0 
2674 : 8d 01 d6 STA $d601 
2677 : a9 1f __ LDA #$1f
2679 : 8d 00 d6 STA $d600 
267c : a9 1e __ LDA #$1e
267e : 8d 00 d6 STA $d600 
.l7863:
2681 : 2c 00 d6 BIT $d600 
2684 : 10 fb __ BPL $2681 ; (main.l7863 + 0)
.s1169:
2686 : a9 46 __ LDA #$46
2688 : 8d 01 d6 STA $d601 
268b : 18 __ __ CLC
268c : a5 47 __ LDA T5 + 0 
268e : 69 50 __ ADC #$50
2690 : 85 47 __ STA T5 + 0 
2692 : 90 02 __ BCC $2696 ; (main.s1472 + 0)
.s1471:
2694 : e6 48 __ INC T5 + 1 
.s1472:
2696 : 8a __ __ TXA
2697 : 18 __ __ CLC
2698 : 69 50 __ ADC #$50
269a : aa __ __ TAX
269b : 90 01 __ BCC $269e ; (main.s1474 + 0)
.s1473:
269d : c8 __ __ INY
.s1474:
269e : c6 1b __ DEC ACCU + 0 
26a0 : f0 03 __ BEQ $26a5 ; (main.s1124 + 0)
26a2 : 4c 1a 26 JMP $261a ; (main.l1126 + 0)
.s1124:
26a5 : a9 12 __ LDA #$12
26a7 : 8d 00 d6 STA $d600 
.l7866:
26aa : 2c 00 d6 BIT $d600 
26ad : 10 fb __ BPL $26aa ; (main.l7866 + 0)
.s1183:
26af : a9 07 __ LDA #$07
26b1 : 8d 01 d6 STA $d601 
26b4 : a9 13 __ LDA #$13
26b6 : 8d 00 d6 STA $d600 
.l7868:
26b9 : 2c 00 d6 BIT $d600 
26bc : 10 fb __ BPL $26b9 ; (main.l7868 + 0)
.s1188:
26be : a9 35 __ LDA #$35
26c0 : 8d 01 d6 STA $d601 
26c3 : a9 1f __ LDA #$1f
26c5 : 8d 00 d6 STA $d600 
.l7870:
26c8 : 2c 00 d6 BIT $d600 
26cb : 10 fb __ BPL $26c8 ; (main.l7870 + 0)
.s1192:
26cd : a9 20 __ LDA #$20
26cf : 8d 01 d6 STA $d601 
26d2 : a9 18 __ LDA #$18
26d4 : 8d 00 d6 STA $d600 
.l7872:
26d7 : 2c 00 d6 BIT $d600 
26da : 10 fb __ BPL $26d7 ; (main.l7872 + 0)
.s1198:
26dc : ad 01 d6 LDA $d601 
26df : 29 7f __ AND #$7f
26e1 : aa __ __ TAX
26e2 : a9 18 __ LDA #$18
26e4 : 8d 00 d6 STA $d600 
.l7874:
26e7 : 2c 00 d6 BIT $d600 
26ea : 10 fb __ BPL $26e7 ; (main.l7874 + 0)
.s1204:
26ec : 8e 01 d6 STX $d601 
26ef : a9 1e __ LDA #$1e
26f1 : 8d 00 d6 STA $d600 
.l7876:
26f4 : 2c 00 d6 BIT $d600 
26f7 : 10 fb __ BPL $26f4 ; (main.l7876 + 0)
.s1209:
26f9 : a9 45 __ LDA #$45
26fb : 8d 01 d6 STA $d601 
26fe : a9 12 __ LDA #$12
2700 : 8d 00 d6 STA $d600 
.l7878:
2703 : 2c 00 d6 BIT $d600 
2706 : 10 fb __ BPL $2703 ; (main.l7878 + 0)
.s1216:
2708 : a9 0f __ LDA #$0f
270a : 8d 01 d6 STA $d601 
270d : a9 13 __ LDA #$13
270f : 8d 00 d6 STA $d600 
.l7880:
2712 : 2c 00 d6 BIT $d600 
2715 : 10 fb __ BPL $2712 ; (main.l7880 + 0)
.s1221:
2717 : a9 35 __ LDA #$35
2719 : 8d 01 d6 STA $d601 
271c : a9 1f __ LDA #$1f
271e : 8d 00 d6 STA $d600 
.l7882:
2721 : 2c 00 d6 BIT $d600 
2724 : 10 fb __ BPL $2721 ; (main.l7882 + 0)
.s1225:
2726 : a9 0d __ LDA #$0d
2728 : 8d 01 d6 STA $d601 
272b : a9 18 __ LDA #$18
272d : 8d 00 d6 STA $d600 
.l7884:
2730 : 2c 00 d6 BIT $d600 
2733 : 10 fb __ BPL $2730 ; (main.l7884 + 0)
.s1231:
2735 : ad 01 d6 LDA $d601 
2738 : 29 7f __ AND #$7f
273a : aa __ __ TAX
273b : a9 18 __ LDA #$18
273d : 8d 00 d6 STA $d600 
.l7886:
2740 : 2c 00 d6 BIT $d600 
2743 : 10 fb __ BPL $2740 ; (main.l7886 + 0)
.s1237:
2745 : 8e 01 d6 STX $d601 
2748 : a9 1e __ LDA #$1e
274a : 8d 00 d6 STA $d600 
.l7888:
274d : 2c 00 d6 BIT $d600 
2750 : 10 fb __ BPL $274d ; (main.l7888 + 0)
.s1242:
2752 : a9 45 __ LDA #$45
2754 : 8d 01 d6 STA $d601 
2757 : c6 4f __ DEC T0 + 0 
2759 : f0 03 __ BEQ $275e ; (main.s1077 + 0)
275b : 4c 70 25 JMP $2570 ; (main.l1075 + 0)
.s1077:
275e : a9 00 __ LDA #$00
2760 : 8d 30 d0 STA $d030 
2763 : ad 11 d0 LDA $d011 
2766 : 29 7f __ AND #$7f
2768 : 09 10 __ ORA #$10
276a : 8d 11 d0 STA $d011 
.l1250:
276d : a5 4f __ LDA T0 + 0 
276f : c9 19 __ CMP #$19
2771 : 90 12 __ BCC $2785 ; (main.s1251 + 0)
.s1243:
2773 : a9 00 __ LDA #$00
2775 : 85 1b __ STA ACCU + 0 
2777 : 85 1c __ STA ACCU + 1 
.s1001:
2779 : 18 __ __ CLC
277a : a5 23 __ LDA SP + 0 
277c : 69 08 __ ADC #$08
277e : 85 23 __ STA SP + 0 
2780 : 90 02 __ BCC $2784 ; (main.s1001 + 11)
2782 : e6 24 __ INC SP + 1 
2784 : 60 __ __ RTS
.s1251:
2785 : a9 12 __ LDA #$12
2787 : 8d 00 d6 STA $d600 
278a : a5 4f __ LDA T0 + 0 
278c : 0a __ __ ASL
278d : 0a __ __ ASL
278e : 65 4f __ ADC T0 + 0 
2790 : 0a __ __ ASL
2791 : 0a __ __ ASL
2792 : 85 44 __ STA T3 + 0 
2794 : a9 00 __ LDA #$00
2796 : 2a __ __ ROL
2797 : 06 44 __ ASL T3 + 0 
2799 : 2a __ __ ROL
279a : 06 44 __ ASL T3 + 0 
279c : 2a __ __ ROL
279d : 85 45 __ STA T3 + 1 
279f : ac f0 35 LDY $35f0 ; (vdc_text_attr + 0)
.l7891:
27a2 : 2c 00 d6 BIT $d600 
27a5 : 10 fb __ BPL $27a2 ; (main.l7891 + 0)
.s1267:
27a7 : 8d 01 d6 STA $d601 
27aa : a9 13 __ LDA #$13
27ac : 8d 00 d6 STA $d600 
.l7893:
27af : 2c 00 d6 BIT $d600 
27b2 : 10 fb __ BPL $27af ; (main.l7893 + 0)
.s1272:
27b4 : a5 44 __ LDA T3 + 0 
27b6 : 8d 01 d6 STA $d601 
27b9 : a9 1f __ LDA #$1f
27bb : 8d 00 d6 STA $d600 
.l7895:
27be : 2c 00 d6 BIT $d600 
27c1 : 10 fb __ BPL $27be ; (main.l7895 + 0)
.s1276:
27c3 : a9 20 __ LDA #$20
27c5 : 8d 01 d6 STA $d601 
27c8 : a9 18 __ LDA #$18
27ca : 8d 00 d6 STA $d600 
.l7897:
27cd : 2c 00 d6 BIT $d600 
27d0 : 10 fb __ BPL $27cd ; (main.l7897 + 0)
.s1282:
27d2 : ad 01 d6 LDA $d601 
27d5 : 29 7f __ AND #$7f
27d7 : aa __ __ TAX
27d8 : a9 18 __ LDA #$18
27da : 8d 00 d6 STA $d600 
.l7899:
27dd : 2c 00 d6 BIT $d600 
27e0 : 10 fb __ BPL $27dd ; (main.l7899 + 0)
.s1288:
27e2 : 8e 01 d6 STX $d601 
27e5 : a9 1e __ LDA #$1e
27e7 : 8d 00 d6 STA $d600 
.l7901:
27ea : 2c 00 d6 BIT $d600 
27ed : 10 fb __ BPL $27ea ; (main.l7901 + 0)
.s1293:
27ef : a9 4f __ LDA #$4f
27f1 : 8d 01 d6 STA $d601 
27f4 : a9 12 __ LDA #$12
27f6 : 8d 00 d6 STA $d600 
27f9 : 18 __ __ CLC
27fa : a5 45 __ LDA T3 + 1 
27fc : 69 08 __ ADC #$08
.l7903:
27fe : 2c 00 d6 BIT $d600 
2801 : 10 fb __ BPL $27fe ; (main.l7903 + 0)
.s1300:
2803 : 8d 01 d6 STA $d601 
2806 : a9 13 __ LDA #$13
2808 : 8d 00 d6 STA $d600 
.l7905:
280b : 2c 00 d6 BIT $d600 
280e : 10 fb __ BPL $280b ; (main.l7905 + 0)
.s1305:
2810 : a5 44 __ LDA T3 + 0 
2812 : 8d 01 d6 STA $d601 
2815 : a9 1f __ LDA #$1f
2817 : 8d 00 d6 STA $d600 
.l7907:
281a : 2c 00 d6 BIT $d600 
281d : 10 fb __ BPL $281a ; (main.l7907 + 0)
.s1309:
281f : 8c 01 d6 STY $d601 
2822 : a9 18 __ LDA #$18
2824 : 8d 00 d6 STA $d600 
.l7909:
2827 : 2c 00 d6 BIT $d600 
282a : 10 fb __ BPL $2827 ; (main.l7909 + 0)
.s1315:
282c : 8d 00 d6 STA $d600 
282f : ad 01 d6 LDA $d601 
2832 : 29 7f __ AND #$7f
.l7911:
2834 : 2c 00 d6 BIT $d600 
2837 : 10 fb __ BPL $2834 ; (main.l7911 + 0)
.s1321:
2839 : 8d 01 d6 STA $d601 
283c : a9 1e __ LDA #$1e
283e : 8d 00 d6 STA $d600 
.l7913:
2841 : 2c 00 d6 BIT $d600 
2844 : 10 fb __ BPL $2841 ; (main.l7913 + 0)
.s1326:
2846 : a9 4f __ LDA #$4f
2848 : 8d 01 d6 STA $d601 
284b : e6 4f __ INC T0 + 0 
284d : 4c 6d 27 JMP $276d ; (main.l1250 + 0)
.s825:
2850 : 0a __ __ ASL
2851 : 85 1b __ STA ACCU + 0 
2853 : a9 00 __ LDA #$00
2855 : 2a __ __ ROL
2856 : 06 1b __ ASL ACCU + 0 
2858 : 2a __ __ ROL
2859 : aa __ __ TAX
285a : a5 1b __ LDA ACCU + 0 
285c : 65 43 __ ADC T2 + 0 
285e : 85 44 __ STA T3 + 0 
2860 : 8a __ __ TXA
2861 : 69 00 __ ADC #$00
2863 : 06 44 __ ASL T3 + 0 
2865 : 2a __ __ ROL
2866 : 06 44 __ ASL T3 + 0 
2868 : 2a __ __ ROL
2869 : 06 44 __ ASL T3 + 0 
286b : 2a __ __ ROL
286c : 06 44 __ ASL T3 + 0 
286e : 2a __ __ ROL
286f : aa __ __ TAX
2870 : 18 __ __ CLC
2871 : a5 44 __ LDA T3 + 0 
2873 : 69 4b __ ADC #$4b
2875 : 85 44 __ STA T3 + 0 
2877 : 90 01 __ BCC $287a ; (main.s1476 + 0)
.s1475:
2879 : e8 __ __ INX
.s1476:
287a : e0 07 __ CPX #$07
287c : d0 02 __ BNE $2880 ; (main.s1159 + 0)
.s1158:
287e : c9 d0 __ CMP #$d0
.s1159:
2880 : 90 04 __ BCC $2886 ; (main.l7760 + 0)
.s831:
2882 : a2 ff __ LDX #$ff
2884 : 86 44 __ STX T3 + 0 
.l7760:
2886 : 2c 00 d6 BIT $d600 
2889 : 10 fb __ BPL $2886 ; (main.l7760 + 0)
.s841:
288b : 8e 01 d6 STX $d601 
288e : a9 13 __ LDA #$13
2890 : 8d 00 d6 STA $d600 
.l7762:
2893 : 2c 00 d6 BIT $d600 
2896 : 10 fb __ BPL $2893 ; (main.l7762 + 0)
.s846:
2898 : a5 44 __ LDA T3 + 0 
289a : 8d 01 d6 STA $d601 
289d : a9 1f __ LDA #$1f
289f : 8d 00 d6 STA $d600 
.l7764:
28a2 : 2c 00 d6 BIT $d600 
28a5 : 10 fb __ BPL $28a2 ; (main.l7764 + 0)
.s850:
28a7 : a9 61 __ LDA #$61
28a9 : 8d 01 d6 STA $d601 
28ac : a9 12 __ LDA #$12
28ae : 8d 00 d6 STA $d600 
28b1 : 8a __ __ TXA
28b2 : 18 __ __ CLC
28b3 : 69 08 __ ADC #$08
.l7766:
28b5 : 2c 00 d6 BIT $d600 
28b8 : 10 fb __ BPL $28b5 ; (main.l7766 + 0)
.s857:
28ba : 8d 01 d6 STA $d601 
28bd : a9 13 __ LDA #$13
28bf : 8d 00 d6 STA $d600 
.l7768:
28c2 : 2c 00 d6 BIT $d600 
28c5 : 10 fb __ BPL $28c2 ; (main.l7768 + 0)
.s862:
28c7 : a5 44 __ LDA T3 + 0 
28c9 : 8d 01 d6 STA $d601 
28cc : a9 1f __ LDA #$1f
28ce : 8d 00 d6 STA $d600 
.l7770:
28d1 : 2c 00 d6 BIT $d600 
28d4 : 10 fb __ BPL $28d1 ; (main.l7770 + 0)
.s866:
28d6 : a9 09 __ LDA #$09
28d8 : 8d 01 d6 STA $d601 
28db : e6 43 __ INC T2 + 0 
28dd : 4c 4c 23 JMP $234c ; (main.l824 + 0)
.s176:
28e0 : a9 22 __ LDA #$22
28e2 : 8d 00 d6 STA $d600 
.l7571:
28e5 : 2c 00 d6 BIT $d600 
28e8 : 10 fb __ BPL $28e5 ; (main.l7571 + 0)
.s185:
28ea : a9 80 __ LDA #$80
28ec : 8d 01 d6 STA $d601 
28ef : a0 ff __ LDY #$ff
28f1 : a2 00 __ LDX #$00
.l188:
28f3 : a9 12 __ LDA #$12
28f5 : 8d 00 d6 STA $d600 
.l7573:
28f8 : 2c 00 d6 BIT $d600 
28fb : 10 fb __ BPL $28f8 ; (main.l7573 + 0)
.s197:
28fd : 8e 01 d6 STX $d601 
2900 : a9 13 __ LDA #$13
2902 : 8d 00 d6 STA $d600 
.l7575:
2905 : 2c 00 d6 BIT $d600 
2908 : 10 fb __ BPL $2905 ; (main.l7575 + 0)
.s202:
290a : a9 00 __ LDA #$00
290c : 8d 01 d6 STA $d601 
290f : a9 1f __ LDA #$1f
2911 : 8d 00 d6 STA $d600 
.l7577:
2914 : 2c 00 d6 BIT $d600 
2917 : 10 fb __ BPL $2914 ; (main.l7577 + 0)
.s206:
2919 : a9 00 __ LDA #$00
291b : 8d 01 d6 STA $d601 
291e : a9 18 __ LDA #$18
2920 : 8d 00 d6 STA $d600 
.l7579:
2923 : 2c 00 d6 BIT $d600 
2926 : 10 fb __ BPL $2923 ; (main.l7579 + 0)
.s212:
2928 : ad 01 d6 LDA $d601 
292b : 29 7f __ AND #$7f
292d : 85 47 __ STA T5 + 0 
292f : a9 18 __ LDA #$18
2931 : 8d 00 d6 STA $d600 
.l7581:
2934 : 2c 00 d6 BIT $d600 
2937 : 10 fb __ BPL $2934 ; (main.l7581 + 0)
.s218:
2939 : a5 47 __ LDA T5 + 0 
293b : 8d 01 d6 STA $d601 
293e : a9 1e __ LDA #$1e
2940 : 8d 00 d6 STA $d600 
.l7583:
2943 : 2c 00 d6 BIT $d600 
2946 : 10 fb __ BPL $2943 ; (main.l7583 + 0)
.s223:
2948 : a9 ff __ LDA #$ff
294a : 8d 01 d6 STA $d601 
294d : e8 __ __ INX
294e : 88 __ __ DEY
294f : d0 a2 __ BNE $28f3 ; (main.l188 + 0)
.s190:
2951 : a9 12 __ LDA #$12
2953 : 8d 00 d6 STA $d600 
.l7586:
2956 : 2c 00 d6 BIT $d600 
2959 : 10 fb __ BPL $2956 ; (main.l7586 + 0)
.s230:
295b : 8e 01 d6 STX $d601 
295e : a9 13 __ LDA #$13
2960 : 8d 00 d6 STA $d600 
.l7588:
2963 : 2c 00 d6 BIT $d600 
2966 : 10 fb __ BPL $2963 ; (main.l7588 + 0)
.s235:
2968 : 8c 01 d6 STY $d601 
296b : a9 1f __ LDA #$1f
296d : 8d 00 d6 STA $d600 
.l7590:
2970 : 2c 00 d6 BIT $d600 
2973 : 10 fb __ BPL $2970 ; (main.l7590 + 0)
.s239:
2975 : 8c 01 d6 STY $d601 
2978 : a9 18 __ LDA #$18
297a : 8d 00 d6 STA $d600 
.l7592:
297d : 2c 00 d6 BIT $d600 
2980 : 10 fb __ BPL $297d ; (main.l7592 + 0)
.s245:
2982 : ad 01 d6 LDA $d601 
2985 : 29 7f __ AND #$7f
2987 : aa __ __ TAX
2988 : a9 18 __ LDA #$18
298a : 8d 00 d6 STA $d600 
.l7594:
298d : 2c 00 d6 BIT $d600 
2990 : 10 fb __ BPL $298d ; (main.l7594 + 0)
.s251:
2992 : 8e 01 d6 STX $d601 
2995 : a9 1e __ LDA #$1e
2997 : 8d 00 d6 STA $d600 
.l7596:
299a : 2c 00 d6 BIT $d600 
299d : 10 fb __ BPL $299a ; (main.l7596 + 0)
.s256:
299f : a9 ff __ LDA #$ff
29a1 : 8d 01 d6 STA $d601 
29a4 : a9 1c __ LDA #$1c
29a6 : 8d 00 d6 STA $d600 
.l7598:
29a9 : 2c 00 d6 BIT $d600 
29ac : 10 fb __ BPL $29a9 ; (main.l7598 + 0)
.s262:
29ae : ad 01 d6 LDA $d601 
29b1 : 09 10 __ ORA #$10
29b3 : aa __ __ TAX
29b4 : a9 1c __ LDA #$1c
29b6 : 8d 00 d6 STA $d600 
.l7600:
29b9 : 2c 00 d6 BIT $d600 
29bc : 10 fb __ BPL $29b9 ; (main.l7600 + 0)
.s268:
29be : 8e 01 d6 STX $d601 
29c1 : 20 ab 2a JSR $2aab ; (vdc_restore_charsets.s0 + 0)
29c4 : a9 00 __ LDA #$00
29c6 : 85 43 __ STA T2 + 0 
.l272:
29c8 : a9 12 __ LDA #$12
29ca : 8d 00 d6 STA $d600 
29cd : a5 43 __ LDA T2 + 0 
29cf : 0a __ __ ASL
29d0 : 0a __ __ ASL
29d1 : 65 43 __ ADC T2 + 0 
29d3 : 0a __ __ ASL
29d4 : 0a __ __ ASL
29d5 : 85 44 __ STA T3 + 0 
29d7 : a9 00 __ LDA #$00
29d9 : 2a __ __ ROL
29da : 06 44 __ ASL T3 + 0 
29dc : 2a __ __ ROL
29dd : 06 44 __ ASL T3 + 0 
29df : 2a __ __ ROL
29e0 : 85 45 __ STA T3 + 1 
29e2 : ae f0 35 LDX $35f0 ; (vdc_text_attr + 0)
.l7602:
29e5 : 2c 00 d6 BIT $d600 
29e8 : 10 fb __ BPL $29e5 ; (main.l7602 + 0)
.s288:
29ea : 8d 01 d6 STA $d601 
29ed : a9 13 __ LDA #$13
29ef : 8d 00 d6 STA $d600 
.l7604:
29f2 : 2c 00 d6 BIT $d600 
29f5 : 10 fb __ BPL $29f2 ; (main.l7604 + 0)
.s293:
29f7 : a5 44 __ LDA T3 + 0 
29f9 : 8d 01 d6 STA $d601 
29fc : a9 1f __ LDA #$1f
29fe : 8d 00 d6 STA $d600 
.l7606:
2a01 : 2c 00 d6 BIT $d600 
2a04 : 10 fb __ BPL $2a01 ; (main.l7606 + 0)
.s297:
2a06 : a9 20 __ LDA #$20
2a08 : 8d 01 d6 STA $d601 
2a0b : a9 18 __ LDA #$18
2a0d : 8d 00 d6 STA $d600 
.l7608:
2a10 : 2c 00 d6 BIT $d600 
2a13 : 10 fb __ BPL $2a10 ; (main.l7608 + 0)
.s303:
2a15 : ad 01 d6 LDA $d601 
2a18 : 29 7f __ AND #$7f
2a1a : a8 __ __ TAY
2a1b : a9 18 __ LDA #$18
2a1d : 8d 00 d6 STA $d600 
.l7610:
2a20 : 2c 00 d6 BIT $d600 
2a23 : 10 fb __ BPL $2a20 ; (main.l7610 + 0)
.s309:
2a25 : 8c 01 d6 STY $d601 
2a28 : a9 1e __ LDA #$1e
2a2a : 8d 00 d6 STA $d600 
.l7612:
2a2d : 2c 00 d6 BIT $d600 
2a30 : 10 fb __ BPL $2a2d ; (main.l7612 + 0)
.s314:
2a32 : a9 4f __ LDA #$4f
2a34 : 8d 01 d6 STA $d601 
2a37 : a9 12 __ LDA #$12
2a39 : 8d 00 d6 STA $d600 
2a3c : 18 __ __ CLC
2a3d : a5 45 __ LDA T3 + 1 
2a3f : 69 08 __ ADC #$08
.l7614:
2a41 : 2c 00 d6 BIT $d600 
2a44 : 10 fb __ BPL $2a41 ; (main.l7614 + 0)
.s321:
2a46 : 8d 01 d6 STA $d601 
2a49 : a9 13 __ LDA #$13
2a4b : 8d 00 d6 STA $d600 
.l7616:
2a4e : 2c 00 d6 BIT $d600 
2a51 : 10 fb __ BPL $2a4e ; (main.l7616 + 0)
.s326:
2a53 : a5 44 __ LDA T3 + 0 
2a55 : 8d 01 d6 STA $d601 
2a58 : a9 1f __ LDA #$1f
2a5a : 8d 00 d6 STA $d600 
.l7618:
2a5d : 2c 00 d6 BIT $d600 
2a60 : 10 fb __ BPL $2a5d ; (main.l7618 + 0)
.s330:
2a62 : 8e 01 d6 STX $d601 
2a65 : a9 18 __ LDA #$18
2a67 : 8d 00 d6 STA $d600 
.l7620:
2a6a : 2c 00 d6 BIT $d600 
2a6d : 10 fb __ BPL $2a6a ; (main.l7620 + 0)
.s336:
2a6f : 8d 00 d6 STA $d600 
2a72 : ad 01 d6 LDA $d601 
2a75 : 29 7f __ AND #$7f
.l7622:
2a77 : 2c 00 d6 BIT $d600 
2a7a : 10 fb __ BPL $2a77 ; (main.l7622 + 0)
.s342:
2a7c : 8d 01 d6 STA $d601 
2a7f : a9 1e __ LDA #$1e
2a81 : 8d 00 d6 STA $d600 
.l7624:
2a84 : 2c 00 d6 BIT $d600 
2a87 : 10 fb __ BPL $2a84 ; (main.l7624 + 0)
.s347:
2a89 : a9 4f __ LDA #$4f
2a8b : 8d 01 d6 STA $d601 
2a8e : e6 43 __ INC T2 + 0 
2a90 : a5 43 __ LDA T2 + 0 
2a92 : c9 19 __ CMP #$19
2a94 : b0 03 __ BCS $2a99 ; (main.s269 + 0)
2a96 : 4c c8 29 JMP $29c8 ; (main.l272 + 0)
.s269:
2a99 : a9 22 __ LDA #$22
2a9b : 8d 00 d6 STA $d600 
.l7626:
2a9e : 2c 00 d6 BIT $d600 
2aa1 : 10 fb __ BPL $2a9e ; (main.l7626 + 0)
.s353:
2aa3 : a9 7d __ LDA #$7d
2aa5 : 8d 01 d6 STA $d601 
2aa8 : 4c 68 1e JMP $1e68 ; (main.s7628 + 0)
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
2aab : 20 62 ff JSR $ff62 
.s1001:
2aae : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
2aaf : a2 03 __ LDX #$03
2ab1 : b5 53 __ LDA T8 + 0,x 
2ab3 : 9d b2 bf STA $bfb2,x ; (printf@stack + 0)
2ab6 : ca __ __ DEX
2ab7 : 10 f8 __ BPL $2ab1 ; (printf.s1000 + 2)
.s0:
2ab9 : 18 __ __ CLC
2aba : a5 23 __ LDA SP + 0 
2abc : 69 04 __ ADC #$04
2abe : 85 47 __ STA T0 + 0 
2ac0 : a5 24 __ LDA SP + 1 
2ac2 : 69 00 __ ADC #$00
2ac4 : 85 48 __ STA T0 + 1 
2ac6 : a9 00 __ LDA #$00
2ac8 : 85 49 __ STA T2 + 0 
2aca : a0 02 __ LDY #$02
2acc : b1 23 __ LDA (SP + 0),y 
2ace : 85 4a __ STA T3 + 0 
2ad0 : c8 __ __ INY
2ad1 : b1 23 __ LDA (SP + 0),y 
2ad3 : 85 4b __ STA T3 + 1 
.l2:
2ad5 : a0 00 __ LDY #$00
2ad7 : b1 4a __ LDA (T3 + 0),y 
2ad9 : d0 1e __ BNE $2af9 ; (printf.s3 + 0)
.s4:
2adb : a6 49 __ LDX T2 + 0 
2add : 9d be bf STA $bfbe,x ; (buff + 0)
2ae0 : 8a __ __ TXA
2ae1 : f0 0b __ BEQ $2aee ; (printf.s1001 + 0)
.s117:
2ae3 : a9 be __ LDA #$be
2ae5 : 85 0d __ STA P0 ; (fmt + 0)
2ae7 : a9 bf __ LDA #$bf
2ae9 : 85 0e __ STA P1 ; (fmt + 1)
2aeb : 20 ff 2d JSR $2dff ; (puts.s0 + 0)
.s1001:
2aee : a2 03 __ LDX #$03
2af0 : bd b2 bf LDA $bfb2,x ; (printf@stack + 0)
2af3 : 95 53 __ STA T8 + 0,x 
2af5 : ca __ __ DEX
2af6 : 10 f8 __ BPL $2af0 ; (printf.s1001 + 2)
2af8 : 60 __ __ RTS
.s3:
2af9 : c9 25 __ CMP #$25
2afb : f0 28 __ BEQ $2b25 ; (printf.s5 + 0)
.s6:
2afd : a6 49 __ LDX T2 + 0 
2aff : 9d be bf STA $bfbe,x ; (buff + 0)
2b02 : e6 4a __ INC T3 + 0 
2b04 : d0 02 __ BNE $2b08 ; (printf.s1098 + 0)
.s1097:
2b06 : e6 4b __ INC T3 + 1 
.s1098:
2b08 : e8 __ __ INX
2b09 : 86 49 __ STX T2 + 0 
2b0b : e0 28 __ CPX #$28
2b0d : 90 c6 __ BCC $2ad5 ; (printf.l2 + 0)
.s111:
2b0f : a9 be __ LDA #$be
2b11 : 85 0d __ STA P0 ; (fmt + 0)
2b13 : a9 bf __ LDA #$bf
2b15 : 85 0e __ STA P1 ; (fmt + 1)
2b17 : 98 __ __ TYA
2b18 : 9d be bf STA $bfbe,x ; (buff + 0)
2b1b : 20 ff 2d JSR $2dff ; (puts.s0 + 0)
2b1e : a9 00 __ LDA #$00
.s1068:
2b20 : 85 49 __ STA T2 + 0 
2b22 : 4c d5 2a JMP $2ad5 ; (printf.l2 + 0)
.s5:
2b25 : a5 49 __ LDA T2 + 0 
2b27 : f0 15 __ BEQ $2b3e ; (printf.s10 + 0)
.s8:
2b29 : a9 be __ LDA #$be
2b2b : 85 0d __ STA P0 ; (fmt + 0)
2b2d : a9 bf __ LDA #$bf
2b2f : 85 0e __ STA P1 ; (fmt + 1)
2b31 : 98 __ __ TYA
2b32 : a6 49 __ LDX T2 + 0 
2b34 : 9d be bf STA $bfbe,x ; (buff + 0)
2b37 : 20 ff 2d JSR $2dff ; (puts.s0 + 0)
2b3a : a9 00 __ LDA #$00
2b3c : 85 49 __ STA T2 + 0 
.s10:
2b3e : a9 0a __ LDA #$0a
2b40 : 8d b9 bf STA $bfb9 ; (si + 3)
2b43 : a9 00 __ LDA #$00
2b45 : 8d ba bf STA $bfba ; (si + 4)
2b48 : 8d bb bf STA $bfbb ; (si + 5)
2b4b : 8d bc bf STA $bfbc ; (si + 6)
2b4e : 8d bd bf STA $bfbd ; (si + 7)
2b51 : a0 01 __ LDY #$01
2b53 : b1 4a __ LDA (T3 + 0),y 
2b55 : aa __ __ TAX
2b56 : a9 20 __ LDA #$20
2b58 : 8d b6 bf STA $bfb6 ; (si + 0)
2b5b : a9 00 __ LDA #$00
2b5d : 8d b7 bf STA $bfb7 ; (si + 1)
2b60 : a9 ff __ LDA #$ff
2b62 : 8d b8 bf STA $bfb8 ; (si + 2)
2b65 : 18 __ __ CLC
2b66 : a5 4a __ LDA T3 + 0 
2b68 : 69 02 __ ADC #$02
.l15:
2b6a : 85 4a __ STA T3 + 0 
2b6c : 90 02 __ BCC $2b70 ; (printf.s1080 + 0)
.s1079:
2b6e : e6 4b __ INC T3 + 1 
.s1080:
2b70 : 8a __ __ TXA
2b71 : e0 2b __ CPX #$2b
2b73 : d0 08 __ BNE $2b7d ; (printf.s18 + 0)
.s17:
2b75 : a9 01 __ LDA #$01
2b77 : 8d bb bf STA $bfbb ; (si + 5)
2b7a : 4c f2 2d JMP $2df2 ; (printf.s246 + 0)
.s18:
2b7d : c9 30 __ CMP #$30
2b7f : d0 06 __ BNE $2b87 ; (printf.s21 + 0)
.s20:
2b81 : 8d b6 bf STA $bfb6 ; (si + 0)
2b84 : 4c f2 2d JMP $2df2 ; (printf.s246 + 0)
.s21:
2b87 : e0 23 __ CPX #$23
2b89 : d0 08 __ BNE $2b93 ; (printf.s24 + 0)
.s23:
2b8b : a9 01 __ LDA #$01
2b8d : 8d bd bf STA $bfbd ; (si + 7)
2b90 : 4c f2 2d JMP $2df2 ; (printf.s246 + 0)
.s24:
2b93 : e0 2d __ CPX #$2d
2b95 : d0 08 __ BNE $2b9f ; (printf.s16 + 0)
.s26:
2b97 : a9 01 __ LDA #$01
2b99 : 8d bc bf STA $bfbc ; (si + 6)
2b9c : 4c f2 2d JMP $2df2 ; (printf.s246 + 0)
.s16:
2b9f : 85 4c __ STA T4 + 0 
2ba1 : e0 30 __ CPX #$30
2ba3 : 90 53 __ BCC $2bf8 ; (printf.s32 + 0)
.s33:
2ba5 : e0 3a __ CPX #$3a
2ba7 : b0 4f __ BCS $2bf8 ; (printf.s32 + 0)
.s30:
2ba9 : a9 00 __ LDA #$00
2bab : 85 4d __ STA T6 + 0 
2bad : 85 4e __ STA T6 + 1 
2baf : e0 3a __ CPX #$3a
2bb1 : b0 40 __ BCS $2bf3 ; (printf.s36 + 0)
.l35:
2bb3 : a5 4d __ LDA T6 + 0 
2bb5 : 0a __ __ ASL
2bb6 : 85 1b __ STA ACCU + 0 
2bb8 : a5 4e __ LDA T6 + 1 
2bba : 2a __ __ ROL
2bbb : 06 1b __ ASL ACCU + 0 
2bbd : 2a __ __ ROL
2bbe : aa __ __ TAX
2bbf : 18 __ __ CLC
2bc0 : a5 1b __ LDA ACCU + 0 
2bc2 : 65 4d __ ADC T6 + 0 
2bc4 : 85 4d __ STA T6 + 0 
2bc6 : 8a __ __ TXA
2bc7 : 65 4e __ ADC T6 + 1 
2bc9 : 06 4d __ ASL T6 + 0 
2bcb : 2a __ __ ROL
2bcc : aa __ __ TAX
2bcd : 18 __ __ CLC
2bce : a5 4d __ LDA T6 + 0 
2bd0 : 65 4c __ ADC T4 + 0 
2bd2 : 90 01 __ BCC $2bd5 ; (printf.s1094 + 0)
.s1093:
2bd4 : e8 __ __ INX
.s1094:
2bd5 : 38 __ __ SEC
2bd6 : e9 30 __ SBC #$30
2bd8 : 85 4d __ STA T6 + 0 
2bda : 8a __ __ TXA
2bdb : e9 00 __ SBC #$00
2bdd : 85 4e __ STA T6 + 1 
2bdf : a0 00 __ LDY #$00
2be1 : b1 4a __ LDA (T3 + 0),y 
2be3 : 85 4c __ STA T4 + 0 
2be5 : e6 4a __ INC T3 + 0 
2be7 : d0 02 __ BNE $2beb ; (printf.s1096 + 0)
.s1095:
2be9 : e6 4b __ INC T3 + 1 
.s1096:
2beb : c9 30 __ CMP #$30
2bed : 90 04 __ BCC $2bf3 ; (printf.s36 + 0)
.s37:
2bef : c9 3a __ CMP #$3a
2bf1 : 90 c0 __ BCC $2bb3 ; (printf.l35 + 0)
.s36:
2bf3 : a5 4d __ LDA T6 + 0 
2bf5 : 8d b7 bf STA $bfb7 ; (si + 1)
.s32:
2bf8 : a5 4c __ LDA T4 + 0 
2bfa : c9 2e __ CMP #$2e
2bfc : d0 51 __ BNE $2c4f ; (printf.s40 + 0)
.s38:
2bfe : a9 00 __ LDA #$00
2c00 : 85 4d __ STA T6 + 0 
.l231:
2c02 : 85 4e __ STA T6 + 1 
2c04 : a0 00 __ LDY #$00
2c06 : b1 4a __ LDA (T3 + 0),y 
2c08 : 85 4c __ STA T4 + 0 
2c0a : e6 4a __ INC T3 + 0 
2c0c : d0 02 __ BNE $2c10 ; (printf.s1082 + 0)
.s1081:
2c0e : e6 4b __ INC T3 + 1 
.s1082:
2c10 : c9 30 __ CMP #$30
2c12 : 90 04 __ BCC $2c18 ; (printf.s43 + 0)
.s44:
2c14 : c9 3a __ CMP #$3a
2c16 : 90 0a __ BCC $2c22 ; (printf.s42 + 0)
.s43:
2c18 : a5 4d __ LDA T6 + 0 
2c1a : 8d b8 bf STA $bfb8 ; (si + 2)
2c1d : a5 4c __ LDA T4 + 0 
2c1f : 4c 4f 2c JMP $2c4f ; (printf.s40 + 0)
.s42:
2c22 : a5 4d __ LDA T6 + 0 
2c24 : 0a __ __ ASL
2c25 : 85 1b __ STA ACCU + 0 
2c27 : a5 4e __ LDA T6 + 1 
2c29 : 2a __ __ ROL
2c2a : 06 1b __ ASL ACCU + 0 
2c2c : 2a __ __ ROL
2c2d : aa __ __ TAX
2c2e : 18 __ __ CLC
2c2f : a5 1b __ LDA ACCU + 0 
2c31 : 65 4d __ ADC T6 + 0 
2c33 : 85 4d __ STA T6 + 0 
2c35 : 8a __ __ TXA
2c36 : 65 4e __ ADC T6 + 1 
2c38 : 06 4d __ ASL T6 + 0 
2c3a : 2a __ __ ROL
2c3b : aa __ __ TAX
2c3c : 18 __ __ CLC
2c3d : a5 4d __ LDA T6 + 0 
2c3f : 65 4c __ ADC T4 + 0 
2c41 : 90 01 __ BCC $2c44 ; (printf.s1092 + 0)
.s1091:
2c43 : e8 __ __ INX
.s1092:
2c44 : 38 __ __ SEC
2c45 : e9 30 __ SBC #$30
2c47 : 85 4d __ STA T6 + 0 
2c49 : 8a __ __ TXA
2c4a : e9 00 __ SBC #$00
2c4c : 4c 02 2c JMP $2c02 ; (printf.l231 + 0)
.s40:
2c4f : c9 64 __ CMP #$64
2c51 : f0 04 __ BEQ $2c57 ; (printf.s45 + 0)
.s48:
2c53 : c9 44 __ CMP #$44
2c55 : d0 05 __ BNE $2c5c ; (printf.s46 + 0)
.s45:
2c57 : a9 01 __ LDA #$01
2c59 : 4c cb 2d JMP $2dcb ; (printf.s247 + 0)
.s46:
2c5c : c9 75 __ CMP #$75
2c5e : d0 03 __ BNE $2c63 ; (printf.s52 + 0)
2c60 : 4c c9 2d JMP $2dc9 ; (printf.s269 + 0)
.s52:
2c63 : c9 55 __ CMP #$55
2c65 : d0 03 __ BNE $2c6a ; (printf.s50 + 0)
2c67 : 4c c9 2d JMP $2dc9 ; (printf.s269 + 0)
.s50:
2c6a : c9 78 __ CMP #$78
2c6c : f0 04 __ BEQ $2c72 ; (printf.s53 + 0)
.s56:
2c6e : c9 58 __ CMP #$58
2c70 : d0 0d __ BNE $2c7f ; (printf.s54 + 0)
.s53:
2c72 : a9 10 __ LDA #$10
2c74 : 8d b9 bf STA $bfb9 ; (si + 3)
2c77 : a9 00 __ LDA #$00
2c79 : 8d ba bf STA $bfba ; (si + 4)
2c7c : 4c c9 2d JMP $2dc9 ; (printf.s269 + 0)
.s54:
2c7f : c9 6c __ CMP #$6c
2c81 : d0 03 __ BNE $2c86 ; (printf.s60 + 0)
2c83 : 4c 5b 2d JMP $2d5b ; (printf.s57 + 0)
.s60:
2c86 : c9 4c __ CMP #$4c
2c88 : d0 03 __ BNE $2c8d ; (printf.s58 + 0)
2c8a : 4c 5b 2d JMP $2d5b ; (printf.s57 + 0)
.s58:
2c8d : c9 73 __ CMP #$73
2c8f : f0 39 __ BEQ $2cca ; (printf.s73 + 0)
.s76:
2c91 : c9 53 __ CMP #$53
2c93 : f0 35 __ BEQ $2cca ; (printf.s73 + 0)
.s74:
2c95 : c9 63 __ CMP #$63
2c97 : f0 15 __ BEQ $2cae ; (printf.s104 + 0)
.s107:
2c99 : c9 43 __ CMP #$43
2c9b : f0 11 __ BEQ $2cae ; (printf.s104 + 0)
.s105:
2c9d : 09 00 __ ORA #$00
2c9f : d0 03 __ BNE $2ca4 ; (printf.s108 + 0)
2ca1 : 4c d5 2a JMP $2ad5 ; (printf.l2 + 0)
.s108:
2ca4 : a6 49 __ LDX T2 + 0 
2ca6 : 9d be bf STA $bfbe,x ; (buff + 0)
2ca9 : e6 49 __ INC T2 + 0 
2cab : 4c d5 2a JMP $2ad5 ; (printf.l2 + 0)
.s104:
2cae : a0 00 __ LDY #$00
2cb0 : b1 47 __ LDA (T0 + 0),y 
2cb2 : a6 49 __ LDX T2 + 0 
2cb4 : 9d be bf STA $bfbe,x ; (buff + 0)
2cb7 : e6 49 __ INC T2 + 0 
.s244:
2cb9 : 18 __ __ CLC
2cba : a5 47 __ LDA T0 + 0 
2cbc : 69 02 __ ADC #$02
2cbe : 85 47 __ STA T0 + 0 
2cc0 : b0 03 __ BCS $2cc5 ; (printf.s1083 + 0)
2cc2 : 4c d5 2a JMP $2ad5 ; (printf.l2 + 0)
.s1083:
2cc5 : e6 48 __ INC T0 + 1 
2cc7 : 4c d5 2a JMP $2ad5 ; (printf.l2 + 0)
.s73:
2cca : a0 00 __ LDY #$00
2ccc : 84 4c __ STY T4 + 0 
2cce : b1 47 __ LDA (T0 + 0),y 
2cd0 : 85 4d __ STA T6 + 0 
2cd2 : c8 __ __ INY
2cd3 : b1 47 __ LDA (T0 + 0),y 
2cd5 : 85 4e __ STA T6 + 1 
2cd7 : 18 __ __ CLC
2cd8 : a5 47 __ LDA T0 + 0 
2cda : 69 02 __ ADC #$02
2cdc : 85 47 __ STA T0 + 0 
2cde : 90 02 __ BCC $2ce2 ; (printf.s1090 + 0)
.s1089:
2ce0 : e6 48 __ INC T0 + 1 
.s1090:
2ce2 : ad b7 bf LDA $bfb7 ; (si + 1)
2ce5 : f0 0d __ BEQ $2cf4 ; (printf.s79 + 0)
.s1071:
2ce7 : a0 00 __ LDY #$00
2ce9 : b1 4d __ LDA (T6 + 0),y 
2ceb : f0 05 __ BEQ $2cf2 ; (printf.s1072 + 0)
.l81:
2ced : c8 __ __ INY
2cee : b1 4d __ LDA (T6 + 0),y 
2cf0 : d0 fb __ BNE $2ced ; (printf.l81 + 0)
.s1072:
2cf2 : 84 4c __ STY T4 + 0 
.s79:
2cf4 : ad bc bf LDA $bfbc ; (si + 6)
2cf7 : d0 1a __ BNE $2d13 ; (printf.s85 + 0)
.s1075:
2cf9 : a4 4c __ LDY T4 + 0 
2cfb : cc b7 bf CPY $bfb7 ; (si + 1)
2cfe : a6 49 __ LDX T2 + 0 
2d00 : b0 0d __ BCS $2d0f ; (printf.s1076 + 0)
.l87:
2d02 : ad b6 bf LDA $bfb6 ; (si + 0)
2d05 : 9d be bf STA $bfbe,x ; (buff + 0)
2d08 : c8 __ __ INY
2d09 : cc b7 bf CPY $bfb7 ; (si + 1)
2d0c : e8 __ __ INX
2d0d : 90 f3 __ BCC $2d02 ; (printf.l87 + 0)
.s1076:
2d0f : 86 49 __ STX T2 + 0 
2d11 : 84 4c __ STY T4 + 0 
.s85:
2d13 : a5 49 __ LDA T2 + 0 
2d15 : f0 16 __ BEQ $2d2d ; (printf.s238 + 0)
.s92:
2d17 : a9 be __ LDA #$be
2d19 : 85 0d __ STA P0 ; (fmt + 0)
2d1b : a9 bf __ LDA #$bf
2d1d : 85 0e __ STA P1 ; (fmt + 1)
2d1f : a9 00 __ LDA #$00
2d21 : a6 49 __ LDX T2 + 0 
2d23 : 9d be bf STA $bfbe,x ; (buff + 0)
2d26 : 20 ff 2d JSR $2dff ; (puts.s0 + 0)
2d29 : a9 00 __ LDA #$00
2d2b : 85 49 __ STA T2 + 0 
.s238:
2d2d : a5 4d __ LDA T6 + 0 
2d2f : 85 0d __ STA P0 ; (fmt + 0)
2d31 : a5 4e __ LDA T6 + 1 
2d33 : 85 0e __ STA P1 ; (fmt + 1)
2d35 : 20 ff 2d JSR $2dff ; (puts.s0 + 0)
2d38 : ad bc bf LDA $bfbc ; (si + 6)
2d3b : d0 03 __ BNE $2d40 ; (printf.s1073 + 0)
2d3d : 4c d5 2a JMP $2ad5 ; (printf.l2 + 0)
.s1073:
2d40 : a4 4c __ LDY T4 + 0 
2d42 : cc b7 bf CPY $bfb7 ; (si + 1)
2d45 : a2 00 __ LDX #$00
2d47 : b0 0d __ BCS $2d56 ; (printf.s1074 + 0)
.l102:
2d49 : ad b6 bf LDA $bfb6 ; (si + 0)
2d4c : 9d be bf STA $bfbe,x ; (buff + 0)
2d4f : c8 __ __ INY
2d50 : cc b7 bf CPY $bfb7 ; (si + 1)
2d53 : e8 __ __ INX
2d54 : 90 f3 __ BCC $2d49 ; (printf.l102 + 0)
.s1074:
2d56 : 86 49 __ STX T2 + 0 
2d58 : 4c d5 2a JMP $2ad5 ; (printf.l2 + 0)
.s57:
2d5b : a0 00 __ LDY #$00
2d5d : b1 47 __ LDA (T0 + 0),y 
2d5f : 85 53 __ STA T8 + 0 
2d61 : c8 __ __ INY
2d62 : b1 47 __ LDA (T0 + 0),y 
2d64 : 85 54 __ STA T8 + 1 
2d66 : c8 __ __ INY
2d67 : b1 47 __ LDA (T0 + 0),y 
2d69 : 85 55 __ STA T8 + 2 
2d6b : c8 __ __ INY
2d6c : b1 47 __ LDA (T0 + 0),y 
2d6e : 85 56 __ STA T8 + 3 
2d70 : 18 __ __ CLC
2d71 : a5 47 __ LDA T0 + 0 
2d73 : 69 04 __ ADC #$04
2d75 : 85 47 __ STA T0 + 0 
2d77 : 90 02 __ BCC $2d7b ; (printf.s1086 + 0)
.s1085:
2d79 : e6 48 __ INC T0 + 1 
.s1086:
2d7b : a0 00 __ LDY #$00
2d7d : b1 4a __ LDA (T3 + 0),y 
2d7f : aa __ __ TAX
2d80 : e6 4a __ INC T3 + 0 
2d82 : d0 02 __ BNE $2d86 ; (printf.s1088 + 0)
.s1087:
2d84 : e6 4b __ INC T3 + 1 
.s1088:
2d86 : 8a __ __ TXA
2d87 : e0 64 __ CPX #$64
2d89 : f0 04 __ BEQ $2d8f ; (printf.s61 + 0)
.s64:
2d8b : c9 44 __ CMP #$44
2d8d : d0 04 __ BNE $2d93 ; (printf.s62 + 0)
.s61:
2d8f : a9 01 __ LDA #$01
2d91 : d0 1c __ BNE $2daf ; (printf.s245 + 0)
.s62:
2d93 : c9 75 __ CMP #$75
2d95 : f0 17 __ BEQ $2dae ; (printf.s268 + 0)
.s68:
2d97 : c9 55 __ CMP #$55
2d99 : f0 13 __ BEQ $2dae ; (printf.s268 + 0)
.s66:
2d9b : c9 78 __ CMP #$78
2d9d : f0 07 __ BEQ $2da6 ; (printf.s69 + 0)
.s72:
2d9f : c9 58 __ CMP #$58
2da1 : f0 03 __ BEQ $2da6 ; (printf.s69 + 0)
2da3 : 4c d5 2a JMP $2ad5 ; (printf.l2 + 0)
.s69:
2da6 : 8c ba bf STY $bfba ; (si + 4)
2da9 : a9 10 __ LDA #$10
2dab : 8d b9 bf STA $bfb9 ; (si + 3)
.s268:
2dae : 98 __ __ TYA
.s245:
2daf : 85 15 __ STA P8 
2db1 : a9 be __ LDA #$be
2db3 : 85 0f __ STA P2 ; (fmt + 2)
2db5 : a9 bf __ LDA #$bf
2db7 : 85 10 __ STA P3 ; (fmt + 3)
2db9 : a9 b6 __ LDA #$b6
2dbb : 85 0d __ STA P0 ; (fmt + 0)
2dbd : a9 bf __ LDA #$bf
2dbf : 85 0e __ STA P1 ; (fmt + 1)
2dc1 : 20 89 2f JSR $2f89 ; (nforml@proxy + 0)
2dc4 : a5 1b __ LDA ACCU + 0 
2dc6 : 4c 20 2b JMP $2b20 ; (printf.s1068 + 0)
.s269:
2dc9 : a9 00 __ LDA #$00
.s247:
2dcb : 85 13 __ STA P6 
2dcd : a9 be __ LDA #$be
2dcf : 85 0f __ STA P2 ; (fmt + 2)
2dd1 : a9 bf __ LDA #$bf
2dd3 : 85 10 __ STA P3 ; (fmt + 3)
2dd5 : a0 00 __ LDY #$00
2dd7 : b1 47 __ LDA (T0 + 0),y 
2dd9 : 85 11 __ STA P4 
2ddb : c8 __ __ INY
2ddc : b1 47 __ LDA (T0 + 0),y 
2dde : 85 12 __ STA P5 
2de0 : a9 b6 __ LDA #$b6
2de2 : 85 0d __ STA P0 ; (fmt + 0)
2de4 : a9 bf __ LDA #$bf
2de6 : 85 0e __ STA P1 ; (fmt + 1)
2de8 : 20 54 2e JSR $2e54 ; (nformi.s0 + 0)
2deb : a5 1b __ LDA ACCU + 0 
2ded : 85 49 __ STA T2 + 0 
2def : 4c b9 2c JMP $2cb9 ; (printf.s244 + 0)
.s246:
2df2 : a0 00 __ LDY #$00
2df4 : b1 4a __ LDA (T3 + 0),y 
2df6 : aa __ __ TAX
2df7 : 18 __ __ CLC
2df8 : a5 4a __ LDA T3 + 0 
2dfa : 69 01 __ ADC #$01
2dfc : 4c 6a 2b JMP $2b6a ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
2dff : a0 00 __ LDY #$00
2e01 : b1 0d __ LDA (P0),y 
2e03 : f0 0b __ BEQ $2e10 ; (puts.s1001 + 0)
2e05 : 20 11 2e JSR $2e11 ; (putpch + 0)
2e08 : e6 0d __ INC P0 
2e0a : d0 f3 __ BNE $2dff ; (puts.s0 + 0)
2e0c : e6 0e __ INC P1 
2e0e : d0 ef __ BNE $2dff ; (puts.s0 + 0)
.s1001:
2e10 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
2e11 : ae f2 35 LDX $35f2 ; (giocharmap + 0)
2e14 : e0 01 __ CPX #$01
2e16 : 90 26 __ BCC $2e3e ; (putpch + 45)
2e18 : c9 0a __ CMP #$0a
2e1a : d0 02 __ BNE $2e1e ; (putpch + 13)
2e1c : a9 0d __ LDA #$0d
2e1e : c9 09 __ CMP #$09
2e20 : f0 1f __ BEQ $2e41 ; (putpch + 48)
2e22 : e0 02 __ CPX #$02
2e24 : 90 18 __ BCC $2e3e ; (putpch + 45)
2e26 : c9 41 __ CMP #$41
2e28 : 90 14 __ BCC $2e3e ; (putpch + 45)
2e2a : c9 7b __ CMP #$7b
2e2c : b0 10 __ BCS $2e3e ; (putpch + 45)
2e2e : c9 61 __ CMP #$61
2e30 : b0 04 __ BCS $2e36 ; (putpch + 37)
2e32 : c9 5b __ CMP #$5b
2e34 : b0 08 __ BCS $2e3e ; (putpch + 45)
2e36 : 49 20 __ EOR #$20
2e38 : e0 03 __ CPX #$03
2e3a : f0 02 __ BEQ $2e3e ; (putpch + 45)
2e3c : 29 df __ AND #$df
2e3e : 4c d2 ff JMP $ffd2 
2e41 : 38 __ __ SEC
2e42 : 20 f0 ff JSR $fff0 
2e45 : 98 __ __ TYA
2e46 : 29 03 __ AND #$03
2e48 : 49 03 __ EOR #$03
2e4a : aa __ __ TAX
2e4b : a9 20 __ LDA #$20
2e4d : 20 d2 ff JSR $ffd2 
2e50 : ca __ __ DEX
2e51 : 10 fa __ BPL $2e4d ; (putpch + 60)
2e53 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
2e54 : a9 00 __ LDA #$00
2e56 : 85 43 __ STA T0 + 0 
2e58 : a5 13 __ LDA P6 ; (s + 0)
2e5a : f0 13 __ BEQ $2e6f ; (nformi.s182 + 0)
.s4:
2e5c : 24 12 __ BIT P5 ; (v + 1)
2e5e : 10 0f __ BPL $2e6f ; (nformi.s182 + 0)
.s1:
2e60 : 38 __ __ SEC
2e61 : a9 00 __ LDA #$00
2e63 : e5 11 __ SBC P4 ; (v + 0)
2e65 : 85 11 __ STA P4 ; (v + 0)
2e67 : a9 00 __ LDA #$00
2e69 : e5 12 __ SBC P5 ; (v + 1)
2e6b : 85 12 __ STA P5 ; (v + 1)
2e6d : e6 43 __ INC T0 + 0 
.s182:
2e6f : a9 10 __ LDA #$10
2e71 : 85 44 __ STA T2 + 0 
2e73 : a5 11 __ LDA P4 ; (v + 0)
2e75 : 05 12 __ ORA P5 ; (v + 1)
2e77 : f0 46 __ BEQ $2ebf ; (nformi.s7 + 0)
.s42:
2e79 : a0 03 __ LDY #$03
2e7b : b1 0d __ LDA (P0),y ; (si + 0)
2e7d : 85 45 __ STA T4 + 0 
2e7f : c8 __ __ INY
2e80 : b1 0d __ LDA (P0),y ; (si + 0)
2e82 : 85 46 __ STA T4 + 1 
.l6:
2e84 : a5 11 __ LDA P4 ; (v + 0)
2e86 : 85 1b __ STA ACCU + 0 
2e88 : a5 12 __ LDA P5 ; (v + 1)
2e8a : 85 1c __ STA ACCU + 1 
2e8c : a5 45 __ LDA T4 + 0 
2e8e : 85 03 __ STA WORK + 0 
2e90 : a5 46 __ LDA T4 + 1 
2e92 : 85 04 __ STA WORK + 1 
2e94 : 20 d4 34 JSR $34d4 ; (divmod + 0)
2e97 : a5 06 __ LDA WORK + 3 
2e99 : 30 08 __ BMI $2ea3 ; (nformi.s78 + 0)
.s1019:
2e9b : d0 0a __ BNE $2ea7 ; (nformi.s77 + 0)
.s1018:
2e9d : a5 05 __ LDA WORK + 2 
2e9f : c9 0a __ CMP #$0a
2ea1 : b0 04 __ BCS $2ea7 ; (nformi.s77 + 0)
.s78:
2ea3 : a9 30 __ LDA #$30
2ea5 : d0 02 __ BNE $2ea9 ; (nformi.s79 + 0)
.s77:
2ea7 : a9 37 __ LDA #$37
.s79:
2ea9 : 18 __ __ CLC
2eaa : 65 05 __ ADC WORK + 2 
2eac : c6 44 __ DEC T2 + 0 
2eae : a6 44 __ LDX T2 + 0 
2eb0 : 9d f0 bf STA $bff0,x ; (buffer + 0)
2eb3 : a5 1b __ LDA ACCU + 0 
2eb5 : 85 11 __ STA P4 ; (v + 0)
2eb7 : a5 1c __ LDA ACCU + 1 
2eb9 : 85 12 __ STA P5 ; (v + 1)
2ebb : 05 11 __ ORA P4 ; (v + 0)
2ebd : d0 c5 __ BNE $2e84 ; (nformi.l6 + 0)
.s7:
2ebf : a0 02 __ LDY #$02
2ec1 : b1 0d __ LDA (P0),y ; (si + 0)
2ec3 : c9 ff __ CMP #$ff
2ec5 : d0 04 __ BNE $2ecb ; (nformi.s80 + 0)
.s81:
2ec7 : a9 0f __ LDA #$0f
2ec9 : d0 05 __ BNE $2ed0 ; (nformi.s1026 + 0)
.s80:
2ecb : 38 __ __ SEC
2ecc : a9 10 __ LDA #$10
2ece : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
2ed0 : a8 __ __ TAY
2ed1 : c4 44 __ CPY T2 + 0 
2ed3 : b0 0d __ BCS $2ee2 ; (nformi.s10 + 0)
.s9:
2ed5 : a9 30 __ LDA #$30
.l1027:
2ed7 : c6 44 __ DEC T2 + 0 
2ed9 : a6 44 __ LDX T2 + 0 
2edb : 9d f0 bf STA $bff0,x ; (buffer + 0)
2ede : c4 44 __ CPY T2 + 0 
2ee0 : 90 f5 __ BCC $2ed7 ; (nformi.l1027 + 0)
.s10:
2ee2 : a0 07 __ LDY #$07
2ee4 : b1 0d __ LDA (P0),y ; (si + 0)
2ee6 : f0 20 __ BEQ $2f08 ; (nformi.s13 + 0)
.s14:
2ee8 : a0 04 __ LDY #$04
2eea : b1 0d __ LDA (P0),y ; (si + 0)
2eec : d0 1a __ BNE $2f08 ; (nformi.s13 + 0)
.s1013:
2eee : 88 __ __ DEY
2eef : b1 0d __ LDA (P0),y ; (si + 0)
2ef1 : c9 10 __ CMP #$10
2ef3 : d0 13 __ BNE $2f08 ; (nformi.s13 + 0)
.s11:
2ef5 : a9 58 __ LDA #$58
2ef7 : a6 44 __ LDX T2 + 0 
2ef9 : 9d ef bf STA $bfef,x ; (buff + 49)
2efc : 8a __ __ TXA
2efd : 18 __ __ CLC
2efe : 69 fe __ ADC #$fe
2f00 : 85 44 __ STA T2 + 0 
2f02 : aa __ __ TAX
2f03 : a9 30 __ LDA #$30
2f05 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
2f08 : a9 00 __ LDA #$00
2f0a : 85 1b __ STA ACCU + 0 
2f0c : a5 43 __ LDA T0 + 0 
2f0e : f0 06 __ BEQ $2f16 ; (nformi.s16 + 0)
.s15:
2f10 : c6 44 __ DEC T2 + 0 
2f12 : a9 2d __ LDA #$2d
2f14 : d0 0a __ BNE $2f20 ; (nformi.s1025 + 0)
.s16:
2f16 : a0 05 __ LDY #$05
2f18 : b1 0d __ LDA (P0),y ; (si + 0)
2f1a : f0 09 __ BEQ $2f25 ; (nformi.s163 + 0)
.s18:
2f1c : c6 44 __ DEC T2 + 0 
2f1e : a9 2b __ LDA #$2b
.s1025:
2f20 : a6 44 __ LDX T2 + 0 
2f22 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
2f25 : a0 06 __ LDY #$06
2f27 : b1 0d __ LDA (P0),y ; (si + 0)
2f29 : d0 33 __ BNE $2f5e ; (nformi.s24 + 0)
.l30:
2f2b : a0 01 __ LDY #$01
2f2d : b1 0d __ LDA (P0),y ; (si + 0)
2f2f : 18 __ __ CLC
2f30 : 65 44 __ ADC T2 + 0 
2f32 : b0 04 __ BCS $2f38 ; (nformi.s31 + 0)
.s1006:
2f34 : c9 11 __ CMP #$11
2f36 : 90 0d __ BCC $2f45 ; (nformi.s33 + 0)
.s31:
2f38 : c6 44 __ DEC T2 + 0 
2f3a : a0 00 __ LDY #$00
2f3c : b1 0d __ LDA (P0),y ; (si + 0)
2f3e : a6 44 __ LDX T2 + 0 
2f40 : 9d f0 bf STA $bff0,x ; (buffer + 0)
2f43 : b0 e6 __ BCS $2f2b ; (nformi.l30 + 0)
.s33:
2f45 : a6 44 __ LDX T2 + 0 
2f47 : e0 10 __ CPX #$10
2f49 : b0 0e __ BCS $2f59 ; (nformi.s23 + 0)
.s34:
2f4b : 88 __ __ DEY
.l1022:
2f4c : bd f0 bf LDA $bff0,x ; (buffer + 0)
2f4f : 91 0f __ STA (P2),y ; (str + 0)
2f51 : e8 __ __ INX
2f52 : e0 10 __ CPX #$10
2f54 : c8 __ __ INY
2f55 : 90 f5 __ BCC $2f4c ; (nformi.l1022 + 0)
.s1023:
2f57 : 84 1b __ STY ACCU + 0 
.s23:
2f59 : a9 00 __ LDA #$00
2f5b : 85 1c __ STA ACCU + 1 
.s1001:
2f5d : 60 __ __ RTS
.s24:
2f5e : a6 44 __ LDX T2 + 0 
2f60 : e0 10 __ CPX #$10
2f62 : b0 1a __ BCS $2f7e ; (nformi.l27 + 0)
.s25:
2f64 : a0 00 __ LDY #$00
.l1020:
2f66 : bd f0 bf LDA $bff0,x ; (buffer + 0)
2f69 : 91 0f __ STA (P2),y ; (str + 0)
2f6b : e8 __ __ INX
2f6c : e0 10 __ CPX #$10
2f6e : c8 __ __ INY
2f6f : 90 f5 __ BCC $2f66 ; (nformi.l1020 + 0)
.s1021:
2f71 : 84 1b __ STY ACCU + 0 
2f73 : b0 09 __ BCS $2f7e ; (nformi.l27 + 0)
.s28:
2f75 : 88 __ __ DEY
2f76 : b1 0d __ LDA (P0),y ; (si + 0)
2f78 : a4 1b __ LDY ACCU + 0 
2f7a : 91 0f __ STA (P2),y ; (str + 0)
2f7c : e6 1b __ INC ACCU + 0 
.l27:
2f7e : a5 1b __ LDA ACCU + 0 
2f80 : a0 01 __ LDY #$01
2f82 : d1 0d __ CMP (P0),y ; (si + 0)
2f84 : 90 ef __ BCC $2f75 ; (nformi.s28 + 0)
2f86 : 4c 59 2f JMP $2f59 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml@proxy: ; nforml@proxy
2f89 : a5 53 __ LDA $53 
2f8b : 85 11 __ STA P4 
2f8d : a5 54 __ LDA $54 
2f8f : 85 12 __ STA P5 
2f91 : a5 55 __ LDA $55 
2f93 : 85 13 __ STA P6 
2f95 : a5 56 __ LDA $56 
2f97 : 85 14 __ STA P7 
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
2f99 : a9 00 __ LDA #$00
2f9b : 85 43 __ STA T0 + 0 
2f9d : a5 15 __ LDA P8 ; (s + 0)
2f9f : f0 21 __ BEQ $2fc2 ; (nforml.s182 + 0)
.s4:
2fa1 : a5 14 __ LDA P7 ; (v + 3)
2fa3 : f0 1d __ BEQ $2fc2 ; (nforml.s182 + 0)
.s1032:
2fa5 : 10 1b __ BPL $2fc2 ; (nforml.s182 + 0)
.s1:
2fa7 : 38 __ __ SEC
2fa8 : a9 00 __ LDA #$00
2faa : e5 11 __ SBC P4 ; (v + 0)
2fac : 85 11 __ STA P4 ; (v + 0)
2fae : a9 00 __ LDA #$00
2fb0 : e5 12 __ SBC P5 ; (v + 1)
2fb2 : 85 12 __ STA P5 ; (v + 1)
2fb4 : a9 00 __ LDA #$00
2fb6 : e5 13 __ SBC P6 ; (v + 2)
2fb8 : 85 13 __ STA P6 ; (v + 2)
2fba : a9 00 __ LDA #$00
2fbc : e5 14 __ SBC P7 ; (v + 3)
2fbe : 85 14 __ STA P7 ; (v + 3)
2fc0 : e6 43 __ INC T0 + 0 
.s182:
2fc2 : a9 10 __ LDA #$10
2fc4 : 85 44 __ STA T2 + 0 
2fc6 : a5 14 __ LDA P7 ; (v + 3)
2fc8 : d0 0c __ BNE $2fd6 ; (nforml.s42 + 0)
.s1024:
2fca : a5 13 __ LDA P6 ; (v + 2)
2fcc : d0 08 __ BNE $2fd6 ; (nforml.s42 + 0)
.s1025:
2fce : a5 12 __ LDA P5 ; (v + 1)
2fd0 : d0 04 __ BNE $2fd6 ; (nforml.s42 + 0)
.s1026:
2fd2 : c5 11 __ CMP P4 ; (v + 0)
2fd4 : b0 0e __ BCS $2fe4 ; (nforml.s7 + 0)
.s42:
2fd6 : a0 03 __ LDY #$03
2fd8 : b1 0d __ LDA (P0),y ; (si + 0)
2fda : 85 45 __ STA T5 + 0 
2fdc : c8 __ __ INY
2fdd : b1 0d __ LDA (P0),y ; (si + 0)
2fdf : 85 46 __ STA T5 + 1 
2fe1 : 4c ae 30 JMP $30ae ; (nforml.l6 + 0)
.s7:
2fe4 : a0 02 __ LDY #$02
2fe6 : b1 0d __ LDA (P0),y ; (si + 0)
2fe8 : c9 ff __ CMP #$ff
2fea : d0 04 __ BNE $2ff0 ; (nforml.s80 + 0)
.s81:
2fec : a9 0f __ LDA #$0f
2fee : d0 05 __ BNE $2ff5 ; (nforml.s1039 + 0)
.s80:
2ff0 : 38 __ __ SEC
2ff1 : a9 10 __ LDA #$10
2ff3 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
2ff5 : a8 __ __ TAY
2ff6 : c4 44 __ CPY T2 + 0 
2ff8 : b0 0d __ BCS $3007 ; (nforml.s10 + 0)
.s9:
2ffa : a9 30 __ LDA #$30
.l1040:
2ffc : c6 44 __ DEC T2 + 0 
2ffe : a6 44 __ LDX T2 + 0 
3000 : 9d f0 bf STA $bff0,x ; (buffer + 0)
3003 : c4 44 __ CPY T2 + 0 
3005 : 90 f5 __ BCC $2ffc ; (nforml.l1040 + 0)
.s10:
3007 : a0 07 __ LDY #$07
3009 : b1 0d __ LDA (P0),y ; (si + 0)
300b : f0 20 __ BEQ $302d ; (nforml.s13 + 0)
.s14:
300d : a0 04 __ LDY #$04
300f : b1 0d __ LDA (P0),y ; (si + 0)
3011 : d0 1a __ BNE $302d ; (nforml.s13 + 0)
.s1013:
3013 : 88 __ __ DEY
3014 : b1 0d __ LDA (P0),y ; (si + 0)
3016 : c9 10 __ CMP #$10
3018 : d0 13 __ BNE $302d ; (nforml.s13 + 0)
.s11:
301a : a9 58 __ LDA #$58
301c : a6 44 __ LDX T2 + 0 
301e : 9d ef bf STA $bfef,x ; (buff + 49)
3021 : 8a __ __ TXA
3022 : 18 __ __ CLC
3023 : 69 fe __ ADC #$fe
3025 : 85 44 __ STA T2 + 0 
3027 : aa __ __ TAX
3028 : a9 30 __ LDA #$30
302a : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
302d : a9 00 __ LDA #$00
302f : 85 1b __ STA ACCU + 0 
3031 : a5 43 __ LDA T0 + 0 
3033 : f0 06 __ BEQ $303b ; (nforml.s16 + 0)
.s15:
3035 : c6 44 __ DEC T2 + 0 
3037 : a9 2d __ LDA #$2d
3039 : d0 0a __ BNE $3045 ; (nforml.s1038 + 0)
.s16:
303b : a0 05 __ LDY #$05
303d : b1 0d __ LDA (P0),y ; (si + 0)
303f : f0 09 __ BEQ $304a ; (nforml.s163 + 0)
.s18:
3041 : c6 44 __ DEC T2 + 0 
3043 : a9 2b __ LDA #$2b
.s1038:
3045 : a6 44 __ LDX T2 + 0 
3047 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
304a : a0 06 __ LDY #$06
304c : b1 0d __ LDA (P0),y ; (si + 0)
304e : d0 33 __ BNE $3083 ; (nforml.s24 + 0)
.l30:
3050 : a0 01 __ LDY #$01
3052 : b1 0d __ LDA (P0),y ; (si + 0)
3054 : 18 __ __ CLC
3055 : 65 44 __ ADC T2 + 0 
3057 : b0 04 __ BCS $305d ; (nforml.s31 + 0)
.s1006:
3059 : c9 11 __ CMP #$11
305b : 90 0d __ BCC $306a ; (nforml.s33 + 0)
.s31:
305d : c6 44 __ DEC T2 + 0 
305f : a0 00 __ LDY #$00
3061 : b1 0d __ LDA (P0),y ; (si + 0)
3063 : a6 44 __ LDX T2 + 0 
3065 : 9d f0 bf STA $bff0,x ; (buffer + 0)
3068 : b0 e6 __ BCS $3050 ; (nforml.l30 + 0)
.s33:
306a : a6 44 __ LDX T2 + 0 
306c : e0 10 __ CPX #$10
306e : b0 0e __ BCS $307e ; (nforml.s23 + 0)
.s34:
3070 : 88 __ __ DEY
.l1035:
3071 : bd f0 bf LDA $bff0,x ; (buffer + 0)
3074 : 91 0f __ STA (P2),y ; (str + 0)
3076 : e8 __ __ INX
3077 : e0 10 __ CPX #$10
3079 : c8 __ __ INY
307a : 90 f5 __ BCC $3071 ; (nforml.l1035 + 0)
.s1036:
307c : 84 1b __ STY ACCU + 0 
.s23:
307e : a9 00 __ LDA #$00
3080 : 85 1c __ STA ACCU + 1 
.s1001:
3082 : 60 __ __ RTS
.s24:
3083 : a6 44 __ LDX T2 + 0 
3085 : e0 10 __ CPX #$10
3087 : b0 1a __ BCS $30a3 ; (nforml.l27 + 0)
.s25:
3089 : a0 00 __ LDY #$00
.l1033:
308b : bd f0 bf LDA $bff0,x ; (buffer + 0)
308e : 91 0f __ STA (P2),y ; (str + 0)
3090 : e8 __ __ INX
3091 : e0 10 __ CPX #$10
3093 : c8 __ __ INY
3094 : 90 f5 __ BCC $308b ; (nforml.l1033 + 0)
.s1034:
3096 : 84 1b __ STY ACCU + 0 
3098 : b0 09 __ BCS $30a3 ; (nforml.l27 + 0)
.s28:
309a : 88 __ __ DEY
309b : b1 0d __ LDA (P0),y ; (si + 0)
309d : a4 1b __ LDY ACCU + 0 
309f : 91 0f __ STA (P2),y ; (str + 0)
30a1 : e6 1b __ INC ACCU + 0 
.l27:
30a3 : a5 1b __ LDA ACCU + 0 
30a5 : a0 01 __ LDY #$01
30a7 : d1 0d __ CMP (P0),y ; (si + 0)
30a9 : 90 ef __ BCC $309a ; (nforml.s28 + 0)
30ab : 4c 7e 30 JMP $307e ; (nforml.s23 + 0)
.l6:
30ae : a5 11 __ LDA P4 ; (v + 0)
30b0 : 85 1b __ STA ACCU + 0 
30b2 : a5 12 __ LDA P5 ; (v + 1)
30b4 : 85 1c __ STA ACCU + 1 
30b6 : a5 13 __ LDA P6 ; (v + 2)
30b8 : 85 1d __ STA ACCU + 2 
30ba : a5 14 __ LDA P7 ; (v + 3)
30bc : 85 1e __ STA ACCU + 3 
30be : a5 45 __ LDA T5 + 0 
30c0 : 85 03 __ STA WORK + 0 
30c2 : a5 46 __ LDA T5 + 1 
30c4 : 85 04 __ STA WORK + 1 
30c6 : a9 00 __ LDA #$00
30c8 : 85 05 __ STA WORK + 2 
30ca : 85 06 __ STA WORK + 3 
30cc : 20 59 35 JSR $3559 ; (divmod32 + 0)
30cf : a5 08 __ LDA WORK + 5 
30d1 : 30 08 __ BMI $30db ; (nforml.s78 + 0)
.s1023:
30d3 : d0 0a __ BNE $30df ; (nforml.s77 + 0)
.s1022:
30d5 : a5 07 __ LDA WORK + 4 
30d7 : c9 0a __ CMP #$0a
30d9 : b0 04 __ BCS $30df ; (nforml.s77 + 0)
.s78:
30db : a9 30 __ LDA #$30
30dd : d0 02 __ BNE $30e1 ; (nforml.s79 + 0)
.s77:
30df : a9 37 __ LDA #$37
.s79:
30e1 : 18 __ __ CLC
30e2 : 65 07 __ ADC WORK + 4 
30e4 : c6 44 __ DEC T2 + 0 
30e6 : a6 44 __ LDX T2 + 0 
30e8 : 9d f0 bf STA $bff0,x ; (buffer + 0)
30eb : a5 1b __ LDA ACCU + 0 
30ed : 85 11 __ STA P4 ; (v + 0)
30ef : a5 1c __ LDA ACCU + 1 
30f1 : 85 12 __ STA P5 ; (v + 1)
30f3 : a5 1d __ LDA ACCU + 2 
30f5 : 85 13 __ STA P6 ; (v + 2)
30f7 : a5 1e __ LDA ACCU + 3 
30f9 : 85 14 __ STA P7 ; (v + 3)
30fb : d0 b1 __ BNE $30ae ; (nforml.l6 + 0)
.s1018:
30fd : a5 13 __ LDA P6 ; (v + 2)
30ff : d0 ad __ BNE $30ae ; (nforml.l6 + 0)
.s1019:
3101 : a5 12 __ LDA P5 ; (v + 1)
3103 : d0 a9 __ BNE $30ae ; (nforml.l6 + 0)
.s1020:
3105 : c5 11 __ CMP P4 ; (v + 0)
3107 : 90 a5 __ BCC $30ae ; (nforml.l6 + 0)
3109 : 4c e4 2f JMP $2fe4 ; (nforml.s7 + 0)
--------------------------------------------------------------------
310c : __ __ __ BYT 73 77 69 74 63 68 20 74 6f 20 38 30 20 63 6f 6c : switch to 80 col
311c : __ __ __ BYT 75 6d 6e 20 73 63 72 65 65 6e 0a 61 6e 64 20 70 : umn screen.and p
312c : __ __ __ BYT 72 65 73 73 20 6b 65 79 2e 0a 00                : ress key...
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
3137 : 20 45 31 JSR $3145 ; (getpch + 0)
313a : c9 00 __ CMP #$00
313c : f0 f9 __ BEQ $3137 ; (getch.s0 + 0)
313e : 85 1b __ STA ACCU + 0 
3140 : a9 00 __ LDA #$00
3142 : 85 1c __ STA ACCU + 1 
.s1001:
3144 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
3145 : 20 e4 ff JSR $ffe4 
3148 : ae f2 35 LDX $35f2 ; (giocharmap + 0)
314b : e0 01 __ CPX #$01
314d : 90 26 __ BCC $3175 ; (getpch + 48)
314f : c9 0d __ CMP #$0d
3151 : d0 02 __ BNE $3155 ; (getpch + 16)
3153 : a9 0a __ LDA #$0a
3155 : e0 02 __ CPX #$02
3157 : 90 1c __ BCC $3175 ; (getpch + 48)
3159 : c9 db __ CMP #$db
315b : b0 18 __ BCS $3175 ; (getpch + 48)
315d : c9 41 __ CMP #$41
315f : 90 14 __ BCC $3175 ; (getpch + 48)
3161 : c9 c1 __ CMP #$c1
3163 : 90 02 __ BCC $3167 ; (getpch + 34)
3165 : 49 a0 __ EOR #$a0
3167 : c9 7b __ CMP #$7b
3169 : b0 0a __ BCS $3175 ; (getpch + 48)
316b : c9 61 __ CMP #$61
316d : b0 04 __ BCS $3173 ; (getpch + 46)
316f : c9 5b __ CMP #$5b
3171 : b0 02 __ BCS $3175 ; (getpch + 48)
3173 : 49 20 __ EOR #$20
3175 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
3176 : 20 81 ff JSR $ff81 
.s1001:
3179 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
317a : 24 d7 __ BIT $d7 
317c : 30 03 __ BMI $3181 ; (screen_setmode.s1001 + 0)
.s6:
317e : 20 5f ff JSR $ff5f 
.s1001:
3181 : 60 __ __ RTS
--------------------------------------------------------------------
3182 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 44 45 4d 4f : oSCAR64 vdc DEMO
3192 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
3193 : a2 03 __ LDX #$03
3195 : b5 53 __ LDA T8 + 0,x 
3197 : 9d e4 bf STA $bfe4,x ; (buff + 38)
319a : ca __ __ DEX
319b : 10 f8 __ BPL $3195 ; (sprintf.s1000 + 2)
.s0:
319d : 18 __ __ CLC
319e : a5 23 __ LDA SP + 0 
31a0 : 69 06 __ ADC #$06
31a2 : 85 47 __ STA T0 + 0 
31a4 : a5 24 __ LDA SP + 1 
31a6 : 69 00 __ ADC #$00
31a8 : 85 48 __ STA T0 + 1 
31aa : a9 00 __ LDA #$00
31ac : 85 43 __ STA T1 + 0 
31ae : a0 04 __ LDY #$04
31b0 : b1 23 __ LDA (SP + 0),y 
31b2 : 85 49 __ STA T2 + 0 
31b4 : c8 __ __ INY
31b5 : b1 23 __ LDA (SP + 0),y 
31b7 : 85 4a __ STA T2 + 1 
31b9 : a0 02 __ LDY #$02
31bb : b1 23 __ LDA (SP + 0),y 
31bd : 85 4b __ STA T3 + 0 
31bf : c8 __ __ INY
31c0 : b1 23 __ LDA (SP + 0),y 
31c2 : 85 4c __ STA T3 + 1 
.l2:
31c4 : a0 00 __ LDY #$00
31c6 : b1 49 __ LDA (T2 + 0),y 
31c8 : d0 0f __ BNE $31d9 ; (sprintf.s3 + 0)
.s4:
31ca : a4 43 __ LDY T1 + 0 
31cc : 91 4b __ STA (T3 + 0),y 
.s1001:
31ce : a2 03 __ LDX #$03
31d0 : bd e4 bf LDA $bfe4,x ; (buff + 38)
31d3 : 95 53 __ STA T8 + 0,x 
31d5 : ca __ __ DEX
31d6 : 10 f8 __ BPL $31d0 ; (sprintf.s1001 + 2)
31d8 : 60 __ __ RTS
.s3:
31d9 : c9 25 __ CMP #$25
31db : f0 22 __ BEQ $31ff ; (sprintf.s5 + 0)
.s6:
31dd : a4 43 __ LDY T1 + 0 
31df : 91 4b __ STA (T3 + 0),y 
31e1 : e6 49 __ INC T2 + 0 
31e3 : d0 02 __ BNE $31e7 ; (sprintf.s1102 + 0)
.s1101:
31e5 : e6 4a __ INC T2 + 1 
.s1102:
31e7 : c8 __ __ INY
31e8 : 84 43 __ STY T1 + 0 
31ea : 98 __ __ TYA
31eb : c0 28 __ CPY #$28
31ed : 90 d5 __ BCC $31c4 ; (sprintf.l2 + 0)
.s111:
31ef : 18 __ __ CLC
31f0 : 65 4b __ ADC T3 + 0 
31f2 : 85 4b __ STA T3 + 0 
31f4 : 90 02 __ BCC $31f8 ; (sprintf.s1104 + 0)
.s1103:
31f6 : e6 4c __ INC T3 + 1 
.s1104:
31f8 : a9 00 __ LDA #$00
.s1068:
31fa : 85 43 __ STA T1 + 0 
31fc : 4c c4 31 JMP $31c4 ; (sprintf.l2 + 0)
.s5:
31ff : 8c ec bf STY $bfec ; (buff + 46)
3202 : 8c ed bf STY $bfed ; (buff + 47)
3205 : 8c ee bf STY $bfee ; (buff + 48)
3208 : 8c ef bf STY $bfef ; (buff + 49)
320b : a9 0a __ LDA #$0a
320d : 8d eb bf STA $bfeb ; (buff + 45)
3210 : a5 43 __ LDA T1 + 0 
3212 : f0 0b __ BEQ $321f ; (sprintf.s10 + 0)
.s8:
3214 : 18 __ __ CLC
3215 : 65 4b __ ADC T3 + 0 
3217 : 85 4b __ STA T3 + 0 
3219 : 90 02 __ BCC $321d ; (sprintf.s1080 + 0)
.s1079:
321b : e6 4c __ INC T3 + 1 
.s1080:
321d : 84 43 __ STY T1 + 0 
.s10:
321f : a0 01 __ LDY #$01
3221 : b1 49 __ LDA (T2 + 0),y 
3223 : aa __ __ TAX
3224 : a9 20 __ LDA #$20
3226 : 8d e8 bf STA $bfe8 ; (buff + 42)
3229 : a9 00 __ LDA #$00
322b : 8d e9 bf STA $bfe9 ; (buff + 43)
322e : a9 ff __ LDA #$ff
3230 : 8d ea bf STA $bfea ; (buff + 44)
3233 : 18 __ __ CLC
3234 : a5 49 __ LDA T2 + 0 
3236 : 69 02 __ ADC #$02
.l15:
3238 : 85 49 __ STA T2 + 0 
323a : 90 02 __ BCC $323e ; (sprintf.s1082 + 0)
.s1081:
323c : e6 4a __ INC T2 + 1 
.s1082:
323e : 8a __ __ TXA
323f : e0 2b __ CPX #$2b
3241 : d0 08 __ BNE $324b ; (sprintf.s18 + 0)
.s17:
3243 : a9 01 __ LDA #$01
3245 : 8d ed bf STA $bfed ; (buff + 47)
3248 : 4c ac 34 JMP $34ac ; (sprintf.s260 + 0)
.s18:
324b : c9 30 __ CMP #$30
324d : d0 06 __ BNE $3255 ; (sprintf.s21 + 0)
.s20:
324f : 8d e8 bf STA $bfe8 ; (buff + 42)
3252 : 4c ac 34 JMP $34ac ; (sprintf.s260 + 0)
.s21:
3255 : e0 23 __ CPX #$23
3257 : d0 08 __ BNE $3261 ; (sprintf.s24 + 0)
.s23:
3259 : a9 01 __ LDA #$01
325b : 8d ef bf STA $bfef ; (buff + 49)
325e : 4c ac 34 JMP $34ac ; (sprintf.s260 + 0)
.s24:
3261 : e0 2d __ CPX #$2d
3263 : d0 08 __ BNE $326d ; (sprintf.s16 + 0)
.s26:
3265 : a9 01 __ LDA #$01
3267 : 8d ee bf STA $bfee ; (buff + 48)
326a : 4c ac 34 JMP $34ac ; (sprintf.s260 + 0)
.s16:
326d : 85 45 __ STA T4 + 0 
326f : e0 30 __ CPX #$30
3271 : 90 53 __ BCC $32c6 ; (sprintf.s32 + 0)
.s33:
3273 : e0 3a __ CPX #$3a
3275 : b0 4f __ BCS $32c6 ; (sprintf.s32 + 0)
.s30:
3277 : a9 00 __ LDA #$00
3279 : 85 4d __ STA T6 + 0 
327b : 85 4e __ STA T6 + 1 
327d : e0 3a __ CPX #$3a
327f : b0 40 __ BCS $32c1 ; (sprintf.s36 + 0)
.l35:
3281 : a5 4d __ LDA T6 + 0 
3283 : 0a __ __ ASL
3284 : 85 1b __ STA ACCU + 0 
3286 : a5 4e __ LDA T6 + 1 
3288 : 2a __ __ ROL
3289 : 06 1b __ ASL ACCU + 0 
328b : 2a __ __ ROL
328c : aa __ __ TAX
328d : 18 __ __ CLC
328e : a5 1b __ LDA ACCU + 0 
3290 : 65 4d __ ADC T6 + 0 
3292 : 85 4d __ STA T6 + 0 
3294 : 8a __ __ TXA
3295 : 65 4e __ ADC T6 + 1 
3297 : 06 4d __ ASL T6 + 0 
3299 : 2a __ __ ROL
329a : aa __ __ TAX
329b : 18 __ __ CLC
329c : a5 4d __ LDA T6 + 0 
329e : 65 45 __ ADC T4 + 0 
32a0 : 90 01 __ BCC $32a3 ; (sprintf.s1098 + 0)
.s1097:
32a2 : e8 __ __ INX
.s1098:
32a3 : 38 __ __ SEC
32a4 : e9 30 __ SBC #$30
32a6 : 85 4d __ STA T6 + 0 
32a8 : 8a __ __ TXA
32a9 : e9 00 __ SBC #$00
32ab : 85 4e __ STA T6 + 1 
32ad : a0 00 __ LDY #$00
32af : b1 49 __ LDA (T2 + 0),y 
32b1 : 85 45 __ STA T4 + 0 
32b3 : e6 49 __ INC T2 + 0 
32b5 : d0 02 __ BNE $32b9 ; (sprintf.s1100 + 0)
.s1099:
32b7 : e6 4a __ INC T2 + 1 
.s1100:
32b9 : c9 30 __ CMP #$30
32bb : 90 04 __ BCC $32c1 ; (sprintf.s36 + 0)
.s37:
32bd : c9 3a __ CMP #$3a
32bf : 90 c0 __ BCC $3281 ; (sprintf.l35 + 0)
.s36:
32c1 : a5 4d __ LDA T6 + 0 
32c3 : 8d e9 bf STA $bfe9 ; (buff + 43)
.s32:
32c6 : a5 45 __ LDA T4 + 0 
32c8 : c9 2e __ CMP #$2e
32ca : d0 51 __ BNE $331d ; (sprintf.s40 + 0)
.s38:
32cc : a9 00 __ LDA #$00
32ce : 85 4d __ STA T6 + 0 
.l245:
32d0 : 85 4e __ STA T6 + 1 
32d2 : a0 00 __ LDY #$00
32d4 : b1 49 __ LDA (T2 + 0),y 
32d6 : 85 45 __ STA T4 + 0 
32d8 : e6 49 __ INC T2 + 0 
32da : d0 02 __ BNE $32de ; (sprintf.s1084 + 0)
.s1083:
32dc : e6 4a __ INC T2 + 1 
.s1084:
32de : c9 30 __ CMP #$30
32e0 : 90 04 __ BCC $32e6 ; (sprintf.s43 + 0)
.s44:
32e2 : c9 3a __ CMP #$3a
32e4 : 90 0a __ BCC $32f0 ; (sprintf.s42 + 0)
.s43:
32e6 : a5 4d __ LDA T6 + 0 
32e8 : 8d ea bf STA $bfea ; (buff + 44)
32eb : a5 45 __ LDA T4 + 0 
32ed : 4c 1d 33 JMP $331d ; (sprintf.s40 + 0)
.s42:
32f0 : a5 4d __ LDA T6 + 0 
32f2 : 0a __ __ ASL
32f3 : 85 1b __ STA ACCU + 0 
32f5 : a5 4e __ LDA T6 + 1 
32f7 : 2a __ __ ROL
32f8 : 06 1b __ ASL ACCU + 0 
32fa : 2a __ __ ROL
32fb : aa __ __ TAX
32fc : 18 __ __ CLC
32fd : a5 1b __ LDA ACCU + 0 
32ff : 65 4d __ ADC T6 + 0 
3301 : 85 4d __ STA T6 + 0 
3303 : 8a __ __ TXA
3304 : 65 4e __ ADC T6 + 1 
3306 : 06 4d __ ASL T6 + 0 
3308 : 2a __ __ ROL
3309 : aa __ __ TAX
330a : 18 __ __ CLC
330b : a5 4d __ LDA T6 + 0 
330d : 65 45 __ ADC T4 + 0 
330f : 90 01 __ BCC $3312 ; (sprintf.s1096 + 0)
.s1095:
3311 : e8 __ __ INX
.s1096:
3312 : 38 __ __ SEC
3313 : e9 30 __ SBC #$30
3315 : 85 4d __ STA T6 + 0 
3317 : 8a __ __ TXA
3318 : e9 00 __ SBC #$00
331a : 4c d0 32 JMP $32d0 ; (sprintf.l245 + 0)
.s40:
331d : c9 64 __ CMP #$64
331f : f0 04 __ BEQ $3325 ; (sprintf.s45 + 0)
.s48:
3321 : c9 44 __ CMP #$44
3323 : d0 05 __ BNE $332a ; (sprintf.s46 + 0)
.s45:
3325 : a9 01 __ LDA #$01
3327 : 4c 85 34 JMP $3485 ; (sprintf.s261 + 0)
.s46:
332a : c9 75 __ CMP #$75
332c : d0 03 __ BNE $3331 ; (sprintf.s52 + 0)
332e : 4c 83 34 JMP $3483 ; (sprintf.s285 + 0)
.s52:
3331 : c9 55 __ CMP #$55
3333 : d0 03 __ BNE $3338 ; (sprintf.s50 + 0)
3335 : 4c 83 34 JMP $3483 ; (sprintf.s285 + 0)
.s50:
3338 : c9 78 __ CMP #$78
333a : f0 04 __ BEQ $3340 ; (sprintf.s53 + 0)
.s56:
333c : c9 58 __ CMP #$58
333e : d0 0d __ BNE $334d ; (sprintf.s54 + 0)
.s53:
3340 : a9 10 __ LDA #$10
3342 : 8d eb bf STA $bfeb ; (buff + 45)
3345 : a9 00 __ LDA #$00
3347 : 8d ec bf STA $bfec ; (buff + 46)
334a : 4c 83 34 JMP $3483 ; (sprintf.s285 + 0)
.s54:
334d : c9 6c __ CMP #$6c
334f : d0 03 __ BNE $3354 ; (sprintf.s60 + 0)
3351 : 4c 15 34 JMP $3415 ; (sprintf.s57 + 0)
.s60:
3354 : c9 4c __ CMP #$4c
3356 : d0 03 __ BNE $335b ; (sprintf.s58 + 0)
3358 : 4c 15 34 JMP $3415 ; (sprintf.s57 + 0)
.s58:
335b : c9 73 __ CMP #$73
335d : f0 37 __ BEQ $3396 ; (sprintf.s73 + 0)
.s76:
335f : c9 53 __ CMP #$53
3361 : f0 33 __ BEQ $3396 ; (sprintf.s73 + 0)
.s74:
3363 : c9 63 __ CMP #$63
3365 : f0 14 __ BEQ $337b ; (sprintf.s104 + 0)
.s107:
3367 : c9 43 __ CMP #$43
3369 : f0 10 __ BEQ $337b ; (sprintf.s104 + 0)
.s105:
336b : 09 00 __ ORA #$00
336d : d0 03 __ BNE $3372 ; (sprintf.s108 + 0)
336f : 4c c4 31 JMP $31c4 ; (sprintf.l2 + 0)
.s108:
3372 : a4 43 __ LDY T1 + 0 
3374 : 91 4b __ STA (T3 + 0),y 
3376 : e6 43 __ INC T1 + 0 
3378 : 4c c4 31 JMP $31c4 ; (sprintf.l2 + 0)
.s104:
337b : a0 00 __ LDY #$00
337d : b1 47 __ LDA (T0 + 0),y 
337f : a4 43 __ LDY T1 + 0 
3381 : 91 4b __ STA (T3 + 0),y 
3383 : e6 43 __ INC T1 + 0 
.s258:
3385 : 18 __ __ CLC
3386 : a5 47 __ LDA T0 + 0 
3388 : 69 02 __ ADC #$02
338a : 85 47 __ STA T0 + 0 
338c : b0 03 __ BCS $3391 ; (sprintf.s1085 + 0)
338e : 4c c4 31 JMP $31c4 ; (sprintf.l2 + 0)
.s1085:
3391 : e6 48 __ INC T0 + 1 
3393 : 4c c4 31 JMP $31c4 ; (sprintf.l2 + 0)
.s73:
3396 : a0 00 __ LDY #$00
3398 : 84 45 __ STY T4 + 0 
339a : b1 47 __ LDA (T0 + 0),y 
339c : 85 4d __ STA T6 + 0 
339e : c8 __ __ INY
339f : b1 47 __ LDA (T0 + 0),y 
33a1 : 85 4e __ STA T6 + 1 
33a3 : 18 __ __ CLC
33a4 : a5 47 __ LDA T0 + 0 
33a6 : 69 02 __ ADC #$02
33a8 : 85 47 __ STA T0 + 0 
33aa : 90 02 __ BCC $33ae ; (sprintf.s1092 + 0)
.s1091:
33ac : e6 48 __ INC T0 + 1 
.s1092:
33ae : ad e9 bf LDA $bfe9 ; (buff + 43)
33b1 : f0 0d __ BEQ $33c0 ; (sprintf.s79 + 0)
.s1071:
33b3 : a0 00 __ LDY #$00
33b5 : b1 4d __ LDA (T6 + 0),y 
33b7 : f0 05 __ BEQ $33be ; (sprintf.s1072 + 0)
.l81:
33b9 : c8 __ __ INY
33ba : b1 4d __ LDA (T6 + 0),y 
33bc : d0 fb __ BNE $33b9 ; (sprintf.l81 + 0)
.s1072:
33be : 84 45 __ STY T4 + 0 
.s79:
33c0 : ad ee bf LDA $bfee ; (buff + 48)
33c3 : d0 19 __ BNE $33de ; (sprintf.l95 + 0)
.s1075:
33c5 : a6 45 __ LDX T4 + 0 
33c7 : ec e9 bf CPX $bfe9 ; (buff + 43)
33ca : a4 43 __ LDY T1 + 0 
33cc : b0 0c __ BCS $33da ; (sprintf.s1076 + 0)
.l87:
33ce : ad e8 bf LDA $bfe8 ; (buff + 42)
33d1 : 91 4b __ STA (T3 + 0),y 
33d3 : e8 __ __ INX
33d4 : ec e9 bf CPX $bfe9 ; (buff + 43)
33d7 : c8 __ __ INY
33d8 : 90 f4 __ BCC $33ce ; (sprintf.l87 + 0)
.s1076:
33da : 86 45 __ STX T4 + 0 
33dc : 84 43 __ STY T1 + 0 
.l95:
33de : a0 00 __ LDY #$00
33e0 : b1 4d __ LDA (T6 + 0),y 
33e2 : f0 0f __ BEQ $33f3 ; (sprintf.s91 + 0)
.s96:
33e4 : a4 43 __ LDY T1 + 0 
33e6 : 91 4b __ STA (T3 + 0),y 
33e8 : e6 43 __ INC T1 + 0 
33ea : e6 4d __ INC T6 + 0 
33ec : d0 f0 __ BNE $33de ; (sprintf.l95 + 0)
.s1093:
33ee : e6 4e __ INC T6 + 1 
33f0 : 4c de 33 JMP $33de ; (sprintf.l95 + 0)
.s91:
33f3 : ad ee bf LDA $bfee ; (buff + 48)
33f6 : d0 03 __ BNE $33fb ; (sprintf.s1073 + 0)
33f8 : 4c c4 31 JMP $31c4 ; (sprintf.l2 + 0)
.s1073:
33fb : a6 45 __ LDX T4 + 0 
33fd : ec e9 bf CPX $bfe9 ; (buff + 43)
3400 : a4 43 __ LDY T1 + 0 
3402 : b0 0c __ BCS $3410 ; (sprintf.s1074 + 0)
.l102:
3404 : ad e8 bf LDA $bfe8 ; (buff + 42)
3407 : 91 4b __ STA (T3 + 0),y 
3409 : e8 __ __ INX
340a : ec e9 bf CPX $bfe9 ; (buff + 43)
340d : c8 __ __ INY
340e : 90 f4 __ BCC $3404 ; (sprintf.l102 + 0)
.s1074:
3410 : 84 43 __ STY T1 + 0 
3412 : 4c c4 31 JMP $31c4 ; (sprintf.l2 + 0)
.s57:
3415 : a0 00 __ LDY #$00
3417 : b1 47 __ LDA (T0 + 0),y 
3419 : 85 53 __ STA T8 + 0 
341b : c8 __ __ INY
341c : b1 47 __ LDA (T0 + 0),y 
341e : 85 54 __ STA T8 + 1 
3420 : c8 __ __ INY
3421 : b1 47 __ LDA (T0 + 0),y 
3423 : 85 55 __ STA T8 + 2 
3425 : c8 __ __ INY
3426 : b1 47 __ LDA (T0 + 0),y 
3428 : 85 56 __ STA T8 + 3 
342a : 18 __ __ CLC
342b : a5 47 __ LDA T0 + 0 
342d : 69 04 __ ADC #$04
342f : 85 47 __ STA T0 + 0 
3431 : 90 02 __ BCC $3435 ; (sprintf.s1088 + 0)
.s1087:
3433 : e6 48 __ INC T0 + 1 
.s1088:
3435 : a0 00 __ LDY #$00
3437 : b1 49 __ LDA (T2 + 0),y 
3439 : aa __ __ TAX
343a : e6 49 __ INC T2 + 0 
343c : d0 02 __ BNE $3440 ; (sprintf.s1090 + 0)
.s1089:
343e : e6 4a __ INC T2 + 1 
.s1090:
3440 : 8a __ __ TXA
3441 : e0 64 __ CPX #$64
3443 : f0 04 __ BEQ $3449 ; (sprintf.s61 + 0)
.s64:
3445 : c9 44 __ CMP #$44
3447 : d0 04 __ BNE $344d ; (sprintf.s62 + 0)
.s61:
3449 : a9 01 __ LDA #$01
344b : d0 1c __ BNE $3469 ; (sprintf.s259 + 0)
.s62:
344d : c9 75 __ CMP #$75
344f : f0 17 __ BEQ $3468 ; (sprintf.s284 + 0)
.s68:
3451 : c9 55 __ CMP #$55
3453 : f0 13 __ BEQ $3468 ; (sprintf.s284 + 0)
.s66:
3455 : c9 78 __ CMP #$78
3457 : f0 07 __ BEQ $3460 ; (sprintf.s69 + 0)
.s72:
3459 : c9 58 __ CMP #$58
345b : f0 03 __ BEQ $3460 ; (sprintf.s69 + 0)
345d : 4c c4 31 JMP $31c4 ; (sprintf.l2 + 0)
.s69:
3460 : 8c ec bf STY $bfec ; (buff + 46)
3463 : a9 10 __ LDA #$10
3465 : 8d eb bf STA $bfeb ; (buff + 45)
.s284:
3468 : 98 __ __ TYA
.s259:
3469 : 85 15 __ STA P8 
346b : a5 4b __ LDA T3 + 0 
346d : 85 0f __ STA P2 ; (fmt + 0)
346f : a5 4c __ LDA T3 + 1 
3471 : 85 10 __ STA P3 ; (fmt + 1)
3473 : a9 e8 __ LDA #$e8
3475 : 85 0d __ STA P0 ; (str + 0)
3477 : a9 bf __ LDA #$bf
3479 : 85 0e __ STA P1 ; (str + 1)
347b : 20 89 2f JSR $2f89 ; (nforml@proxy + 0)
347e : a5 1b __ LDA ACCU + 0 
3480 : 4c fa 31 JMP $31fa ; (sprintf.s1068 + 0)
.s285:
3483 : a9 00 __ LDA #$00
.s261:
3485 : 85 13 __ STA P6 
3487 : a5 4b __ LDA T3 + 0 
3489 : 85 0f __ STA P2 ; (fmt + 0)
348b : a5 4c __ LDA T3 + 1 
348d : 85 10 __ STA P3 ; (fmt + 1)
348f : a0 00 __ LDY #$00
3491 : b1 47 __ LDA (T0 + 0),y 
3493 : 85 11 __ STA P4 ; (fmt + 2)
3495 : c8 __ __ INY
3496 : b1 47 __ LDA (T0 + 0),y 
3498 : 85 12 __ STA P5 ; (fmt + 3)
349a : a9 e8 __ LDA #$e8
349c : 85 0d __ STA P0 ; (str + 0)
349e : a9 bf __ LDA #$bf
34a0 : 85 0e __ STA P1 ; (str + 1)
34a2 : 20 54 2e JSR $2e54 ; (nformi.s0 + 0)
34a5 : a5 1b __ LDA ACCU + 0 
34a7 : 85 43 __ STA T1 + 0 
34a9 : 4c 85 33 JMP $3385 ; (sprintf.s258 + 0)
.s260:
34ac : a0 00 __ LDY #$00
34ae : b1 49 __ LDA (T2 + 0),y 
34b0 : aa __ __ TAX
34b1 : 18 __ __ CLC
34b2 : a5 49 __ LDA T2 + 0 
34b4 : 69 01 __ ADC #$01
34b6 : 4c 38 32 JMP $3238 ; (sprintf.l15 + 0)
--------------------------------------------------------------------
34b9 : __ __ __ BYT 76 64 63 20 6d 45 4d 4f 52 59 20 64 45 54 45 43 : vdc mEMORY dETEC
34c9 : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 00                : TED: %U kb.
--------------------------------------------------------------------
divmod: ; divmod
34d4 : a5 1c __ LDA ACCU + 1 
34d6 : d0 31 __ BNE $3509 ; (divmod + 53)
34d8 : a5 04 __ LDA WORK + 1 
34da : d0 1e __ BNE $34fa ; (divmod + 38)
34dc : 85 06 __ STA WORK + 3 
34de : a2 04 __ LDX #$04
34e0 : 06 1b __ ASL ACCU + 0 
34e2 : 2a __ __ ROL
34e3 : c5 03 __ CMP WORK + 0 
34e5 : 90 02 __ BCC $34e9 ; (divmod + 21)
34e7 : e5 03 __ SBC WORK + 0 
34e9 : 26 1b __ ROL ACCU + 0 
34eb : 2a __ __ ROL
34ec : c5 03 __ CMP WORK + 0 
34ee : 90 02 __ BCC $34f2 ; (divmod + 30)
34f0 : e5 03 __ SBC WORK + 0 
34f2 : 26 1b __ ROL ACCU + 0 
34f4 : ca __ __ DEX
34f5 : d0 eb __ BNE $34e2 ; (divmod + 14)
34f7 : 85 05 __ STA WORK + 2 
34f9 : 60 __ __ RTS
34fa : a5 1b __ LDA ACCU + 0 
34fc : 85 05 __ STA WORK + 2 
34fe : a5 1c __ LDA ACCU + 1 
3500 : 85 06 __ STA WORK + 3 
3502 : a9 00 __ LDA #$00
3504 : 85 1b __ STA ACCU + 0 
3506 : 85 1c __ STA ACCU + 1 
3508 : 60 __ __ RTS
3509 : a5 04 __ LDA WORK + 1 
350b : d0 1f __ BNE $352c ; (divmod + 88)
350d : a5 03 __ LDA WORK + 0 
350f : 30 1b __ BMI $352c ; (divmod + 88)
3511 : a9 00 __ LDA #$00
3513 : 85 06 __ STA WORK + 3 
3515 : a2 10 __ LDX #$10
3517 : 06 1b __ ASL ACCU + 0 
3519 : 26 1c __ ROL ACCU + 1 
351b : 2a __ __ ROL
351c : c5 03 __ CMP WORK + 0 
351e : 90 02 __ BCC $3522 ; (divmod + 78)
3520 : e5 03 __ SBC WORK + 0 
3522 : 26 1b __ ROL ACCU + 0 
3524 : 26 1c __ ROL ACCU + 1 
3526 : ca __ __ DEX
3527 : d0 f2 __ BNE $351b ; (divmod + 71)
3529 : 85 05 __ STA WORK + 2 
352b : 60 __ __ RTS
352c : a9 00 __ LDA #$00
352e : 85 05 __ STA WORK + 2 
3530 : 85 06 __ STA WORK + 3 
3532 : 84 02 __ STY $02 
3534 : a0 10 __ LDY #$10
3536 : 18 __ __ CLC
3537 : 26 1b __ ROL ACCU + 0 
3539 : 26 1c __ ROL ACCU + 1 
353b : 26 05 __ ROL WORK + 2 
353d : 26 06 __ ROL WORK + 3 
353f : 38 __ __ SEC
3540 : a5 05 __ LDA WORK + 2 
3542 : e5 03 __ SBC WORK + 0 
3544 : aa __ __ TAX
3545 : a5 06 __ LDA WORK + 3 
3547 : e5 04 __ SBC WORK + 1 
3549 : 90 04 __ BCC $354f ; (divmod + 123)
354b : 86 05 __ STX WORK + 2 
354d : 85 06 __ STA WORK + 3 
354f : 88 __ __ DEY
3550 : d0 e5 __ BNE $3537 ; (divmod + 99)
3552 : 26 1b __ ROL ACCU + 0 
3554 : 26 1c __ ROL ACCU + 1 
3556 : a4 02 __ LDY $02 
3558 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
3559 : 84 02 __ STY $02 
355b : a0 20 __ LDY #$20
355d : a9 00 __ LDA #$00
355f : 85 07 __ STA WORK + 4 
3561 : 85 08 __ STA WORK + 5 
3563 : 85 09 __ STA WORK + 6 
3565 : 85 0a __ STA WORK + 7 
3567 : a5 05 __ LDA WORK + 2 
3569 : 05 06 __ ORA WORK + 3 
356b : d0 39 __ BNE $35a6 ; (divmod32 + 77)
356d : 18 __ __ CLC
356e : 26 1b __ ROL ACCU + 0 
3570 : 26 1c __ ROL ACCU + 1 
3572 : 26 1d __ ROL ACCU + 2 
3574 : 26 1e __ ROL ACCU + 3 
3576 : 26 07 __ ROL WORK + 4 
3578 : 26 08 __ ROL WORK + 5 
357a : 90 0c __ BCC $3588 ; (divmod32 + 47)
357c : a5 07 __ LDA WORK + 4 
357e : e5 03 __ SBC WORK + 0 
3580 : aa __ __ TAX
3581 : a5 08 __ LDA WORK + 5 
3583 : e5 04 __ SBC WORK + 1 
3585 : 38 __ __ SEC
3586 : b0 0c __ BCS $3594 ; (divmod32 + 59)
3588 : 38 __ __ SEC
3589 : a5 07 __ LDA WORK + 4 
358b : e5 03 __ SBC WORK + 0 
358d : aa __ __ TAX
358e : a5 08 __ LDA WORK + 5 
3590 : e5 04 __ SBC WORK + 1 
3592 : 90 04 __ BCC $3598 ; (divmod32 + 63)
3594 : 86 07 __ STX WORK + 4 
3596 : 85 08 __ STA WORK + 5 
3598 : 88 __ __ DEY
3599 : d0 d3 __ BNE $356e ; (divmod32 + 21)
359b : 26 1b __ ROL ACCU + 0 
359d : 26 1c __ ROL ACCU + 1 
359f : 26 1d __ ROL ACCU + 2 
35a1 : 26 1e __ ROL ACCU + 3 
35a3 : a4 02 __ LDY $02 
35a5 : 60 __ __ RTS
35a6 : 18 __ __ CLC
35a7 : 26 1b __ ROL ACCU + 0 
35a9 : 26 1c __ ROL ACCU + 1 
35ab : 26 1d __ ROL ACCU + 2 
35ad : 26 1e __ ROL ACCU + 3 
35af : 26 07 __ ROL WORK + 4 
35b1 : 26 08 __ ROL WORK + 5 
35b3 : 26 09 __ ROL WORK + 6 
35b5 : 26 0a __ ROL WORK + 7 
35b7 : a5 07 __ LDA WORK + 4 
35b9 : c5 03 __ CMP WORK + 0 
35bb : a5 08 __ LDA WORK + 5 
35bd : e5 04 __ SBC WORK + 1 
35bf : a5 09 __ LDA WORK + 6 
35c1 : e5 05 __ SBC WORK + 2 
35c3 : a5 0a __ LDA WORK + 7 
35c5 : e5 06 __ SBC WORK + 3 
35c7 : 90 18 __ BCC $35e1 ; (divmod32 + 136)
35c9 : a5 07 __ LDA WORK + 4 
35cb : e5 03 __ SBC WORK + 0 
35cd : 85 07 __ STA WORK + 4 
35cf : a5 08 __ LDA WORK + 5 
35d1 : e5 04 __ SBC WORK + 1 
35d3 : 85 08 __ STA WORK + 5 
35d5 : a5 09 __ LDA WORK + 6 
35d7 : e5 05 __ SBC WORK + 2 
35d9 : 85 09 __ STA WORK + 6 
35db : a5 0a __ LDA WORK + 7 
35dd : e5 06 __ SBC WORK + 3 
35df : 85 0a __ STA WORK + 7 
35e1 : 88 __ __ DEY
35e2 : d0 c3 __ BNE $35a7 ; (divmod32 + 78)
35e4 : 26 1b __ ROL ACCU + 0 
35e6 : 26 1c __ ROL ACCU + 1 
35e8 : 26 1d __ ROL ACCU + 2 
35ea : 26 1e __ ROL ACCU + 3 
35ec : a4 02 __ LDY $02 
35ee : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
35ef : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
vdc_text_attr:
35f0 : __ __ __ BYT 8d                                              : .
--------------------------------------------------------------------
vdc_memsize:
35f1 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
35f2 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
linebuffer:
3600 : __ __ __ BSS	81
