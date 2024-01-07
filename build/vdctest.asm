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
1c13 : 8e eb 3b STX $3beb ; (spentry + 0)
1c16 : a9 40 __ LDA #$40
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 3c __ LDA #$3c
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 3c __ LDA #$3c
1c21 : e9 3c __ SBC #$3c
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
1c35 : a9 a7 __ LDA #$a7
1c37 : e9 40 __ SBC #$40
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
1c50 : a9 a3 __ LDA #$a3
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
1c80 : a2 04 __ LDX #$04
1c82 : b5 53 __ LDA T1 + 0,x 
1c84 : 9d a5 bf STA $bfa5,x ; (main@stack + 0)
1c87 : ca __ __ DEX
1c88 : 10 f8 __ BPL $1c82 ; (main.s1000 + 2)
1c8a : 38 __ __ SEC
1c8b : a5 23 __ LDA SP + 0 
1c8d : e9 0e __ SBC #$0e
1c8f : 85 23 __ STA SP + 0 
1c91 : b0 02 __ BCS $1c95 ; (main.s0 + 0)
1c93 : c6 24 __ DEC SP + 1 
.s0:
1c95 : a9 1a __ LDA #$1a
1c97 : 8d 00 d6 STA $d600 
1c9a : a9 00 __ LDA #$00
1c9c : 85 52 __ STA T0 + 0 
1c9e : 85 53 __ STA T1 + 0 
.l6292:
1ca0 : 2c 00 d6 BIT $d600 
1ca3 : 10 fb __ BPL $1ca0 ; (main.l6292 + 0)
.s9:
1ca5 : ad 01 d6 LDA $d601 
1ca8 : 29 f0 __ AND #$f0
1caa : aa __ __ TAX
1cab : a9 1a __ LDA #$1a
1cad : 8d 00 d6 STA $d600 
.l6294:
1cb0 : 2c 00 d6 BIT $d600 
1cb3 : 10 fb __ BPL $1cb0 ; (main.l6294 + 0)
.s15:
1cb5 : 8e 01 d6 STX $d601 
1cb8 : 8d 00 d6 STA $d600 
.l6296:
1cbb : 2c 00 d6 BIT $d600 
1cbe : 10 fb __ BPL $1cbb ; (main.l6296 + 0)
.s22:
1cc0 : ad 01 d6 LDA $d601 
1cc3 : 29 0f __ AND #$0f
1cc5 : 09 d0 __ ORA #$d0
1cc7 : aa __ __ TAX
1cc8 : a9 1a __ LDA #$1a
1cca : 8d 00 d6 STA $d600 
.l6298:
1ccd : 2c 00 d6 BIT $d600 
1cd0 : 10 fb __ BPL $1ccd ; (main.l6298 + 0)
.s28:
1cd2 : 8e 01 d6 STX $d601 
1cd5 : a9 8d __ LDA #$8d
1cd7 : 8d 47 3c STA $3c47 ; (vdc_state + 7)
1cda : a9 1c __ LDA #$1c
1cdc : 8d 00 d6 STA $d600 
.l6300:
1cdf : 2c 00 d6 BIT $d600 
1ce2 : 10 fb __ BPL $1cdf ; (main.l6300 + 0)
.s34:
1ce4 : ad 01 d6 LDA $d601 
1ce7 : aa __ __ TAX
1ce8 : 09 10 __ ORA #$10
1cea : a8 __ __ TAY
1ceb : a9 1c __ LDA #$1c
1ced : 8d 00 d6 STA $d600 
.l6302:
1cf0 : 2c 00 d6 BIT $d600 
1cf3 : 10 fb __ BPL $1cf0 ; (main.l6302 + 0)
.s41:
1cf5 : 8c 01 d6 STY $d601 
1cf8 : a9 12 __ LDA #$12
1cfa : 8d 00 d6 STA $d600 
.l6304:
1cfd : 2c 00 d6 BIT $d600 
1d00 : 10 fb __ BPL $1cfd ; (main.l6304 + 0)
.s48:
1d02 : a9 1f __ LDA #$1f
1d04 : 8d 01 d6 STA $d601 
1d07 : a9 13 __ LDA #$13
1d09 : 8d 00 d6 STA $d600 
.l6306:
1d0c : 2c 00 d6 BIT $d600 
1d0f : 10 fb __ BPL $1d0c ; (main.l6306 + 0)
.s53:
1d11 : a9 ff __ LDA #$ff
1d13 : 8d 01 d6 STA $d601 
1d16 : a9 1f __ LDA #$1f
1d18 : 8d 00 d6 STA $d600 
.l6308:
1d1b : 2c 00 d6 BIT $d600 
1d1e : 10 fb __ BPL $1d1b ; (main.l6308 + 0)
.s57:
1d20 : a9 00 __ LDA #$00
1d22 : 8d 01 d6 STA $d601 
1d25 : a9 12 __ LDA #$12
1d27 : 8d 00 d6 STA $d600 
.l6310:
1d2a : 2c 00 d6 BIT $d600 
1d2d : 10 fb __ BPL $1d2a ; (main.l6310 + 0)
.s64:
1d2f : a9 9f __ LDA #$9f
1d31 : 8d 01 d6 STA $d601 
1d34 : a9 13 __ LDA #$13
1d36 : 8d 00 d6 STA $d600 
.l6312:
1d39 : 2c 00 d6 BIT $d600 
1d3c : 10 fb __ BPL $1d39 ; (main.l6312 + 0)
.s69:
1d3e : a9 ff __ LDA #$ff
1d40 : 8d 01 d6 STA $d601 
1d43 : a9 1f __ LDA #$1f
1d45 : 8d 00 d6 STA $d600 
.l6314:
1d48 : 2c 00 d6 BIT $d600 
1d4b : 10 fb __ BPL $1d48 ; (main.l6314 + 0)
.s73:
1d4d : a9 ff __ LDA #$ff
1d4f : 8d 01 d6 STA $d601 
1d52 : a9 12 __ LDA #$12
1d54 : 8d 00 d6 STA $d600 
.l6316:
1d57 : 2c 00 d6 BIT $d600 
1d5a : 10 fb __ BPL $1d57 ; (main.l6316 + 0)
.s80:
1d5c : a9 1f __ LDA #$1f
1d5e : 8d 01 d6 STA $d601 
1d61 : a9 13 __ LDA #$13
1d63 : 8d 00 d6 STA $d600 
.l6318:
1d66 : 2c 00 d6 BIT $d600 
1d69 : 10 fb __ BPL $1d66 ; (main.l6318 + 0)
.s85:
1d6b : a9 ff __ LDA #$ff
1d6d : 8d 01 d6 STA $d601 
1d70 : a9 1f __ LDA #$1f
1d72 : 8d 00 d6 STA $d600 
.l6320:
1d75 : 2c 00 d6 BIT $d600 
1d78 : 10 fb __ BPL $1d75 ; (main.l6320 + 0)
.s89:
1d7a : ad 01 d6 LDA $d601 
1d7d : f0 04 __ BEQ $1d83 ; (main.s1403 + 0)
.s1404:
1d7f : a9 10 __ LDA #$10
1d81 : d0 02 __ BNE $1d85 ; (main.s1405 + 0)
.s1403:
1d83 : a9 40 __ LDA #$40
.s1405:
1d85 : 8d 40 3c STA $3c40 ; (vdc_state + 0)
1d88 : a9 1c __ LDA #$1c
1d8a : 8d 00 d6 STA $d600 
.l6323:
1d8d : 2c 00 d6 BIT $d600 
1d90 : 10 fb __ BPL $1d8d ; (main.l6323 + 0)
.s96:
1d92 : 8e 01 d6 STX $d601 
1d95 : a9 00 __ LDA #$00
1d97 : 85 54 __ STA T2 + 0 
1d99 : ad 43 3c LDA $3c43 ; (vdc_state + 3)
1d9c : 85 55 __ STA T3 + 0 
1d9e : ad 45 3c LDA $3c45 ; (vdc_state + 5)
1da1 : 85 43 __ STA T5 + 0 
.l99:
1da3 : a5 54 __ LDA T2 + 0 
1da5 : c5 43 __ CMP T5 + 0 
1da7 : b0 03 __ BCS $1dac ; (main.s29 + 0)
1da9 : 4c da 2a JMP $2ada ; (main.s100 + 0)
.s29:
1dac : 24 d7 __ BIT $d7 
1dae : 30 17 __ BMI $1dc7 ; (main.s182 + 0)
.s177:
1db0 : a9 17 __ LDA #$17
1db2 : a0 02 __ LDY #$02
1db4 : 91 23 __ STA (SP + 0),y 
1db6 : a9 32 __ LDA #$32
1db8 : c8 __ __ INY
1db9 : 91 23 __ STA (SP + 0),y 
1dbb : 20 ba 2b JSR $2bba ; (printf.s1000 + 0)
1dbe : 20 42 32 JSR $3242 ; (getch.s0 + 0)
1dc1 : 20 81 32 JSR $3281 ; (clrscr.s0 + 0)
1dc4 : 20 85 32 JSR $3285 ; (screen_setmode.s0 + 0)
.s182:
1dc7 : a9 01 __ LDA #$01
1dc9 : 8d 30 d0 STA $d030 
1dcc : a9 00 __ LDA #$00
1dce : 85 16 __ STA P9 
1dd0 : ad 11 d0 LDA $d011 
1dd3 : 29 6f __ AND #$6f
1dd5 : 8d 11 d0 STA $d011 
1dd8 : 20 8d 32 JSR $328d ; (vdc_set_mode.s1000 + 0)
1ddb : a9 00 __ LDA #$00
1ddd : 85 54 __ STA T2 + 0 
.l371:
1ddf : ad 49 3c LDA $3c49 ; (vdc_state + 9)
1de2 : 85 43 __ STA T5 + 0 
1de4 : a9 12 __ LDA #$12
1de6 : 8d 00 d6 STA $d600 
1de9 : ac 48 3c LDY $3c48 ; (vdc_state + 8)
.l6350:
1dec : 2c 00 d6 BIT $d600 
1def : 10 fb __ BPL $1dec ; (main.l6350 + 0)
.s381:
1df1 : a5 43 __ LDA T5 + 0 
1df3 : 8d 01 d6 STA $d601 
1df6 : a9 13 __ LDA #$13
1df8 : 8d 00 d6 STA $d600 
.l6352:
1dfb : 2c 00 d6 BIT $d600 
1dfe : 10 fb __ BPL $1dfb ; (main.l6352 + 0)
.s386:
1e00 : 8c 01 d6 STY $d601 
1e03 : a9 1f __ LDA #$1f
1e05 : 8d 00 d6 STA $d600 
.l6354:
1e08 : 2c 00 d6 BIT $d600 
1e0b : 10 fb __ BPL $1e08 ; (main.l6354 + 0)
.s390:
1e0d : a9 20 __ LDA #$20
1e0f : 8d 01 d6 STA $d601 
1e12 : a9 18 __ LDA #$18
1e14 : 8d 00 d6 STA $d600 
.l6356:
1e17 : 2c 00 d6 BIT $d600 
1e1a : 10 fb __ BPL $1e17 ; (main.l6356 + 0)
.s396:
1e1c : ad 01 d6 LDA $d601 
1e1f : 29 7f __ AND #$7f
1e21 : aa __ __ TAX
1e22 : a9 18 __ LDA #$18
1e24 : 8d 00 d6 STA $d600 
.l6358:
1e27 : 2c 00 d6 BIT $d600 
1e2a : 10 fb __ BPL $1e27 ; (main.l6358 + 0)
.s402:
1e2c : 8e 01 d6 STX $d601 
1e2f : a9 1e __ LDA #$1e
1e31 : 8d 00 d6 STA $d600 
.l6360:
1e34 : 2c 00 d6 BIT $d600 
1e37 : 10 fb __ BPL $1e34 ; (main.l6360 + 0)
.s407:
1e39 : a9 4e __ LDA #$4e
1e3b : 8d 01 d6 STA $d601 
1e3e : ad 4b 3c LDA $3c4b ; (vdc_state + 11)
1e41 : 85 47 __ STA T7 + 0 
1e43 : a9 12 __ LDA #$12
1e45 : 8d 00 d6 STA $d600 
1e48 : ae 4a 3c LDX $3c4a ; (vdc_state + 10)
.l6362:
1e4b : 2c 00 d6 BIT $d600 
1e4e : 10 fb __ BPL $1e4b ; (main.l6362 + 0)
.s414:
1e50 : a5 47 __ LDA T7 + 0 
1e52 : 8d 01 d6 STA $d601 
1e55 : a9 13 __ LDA #$13
1e57 : 8d 00 d6 STA $d600 
.l6364:
1e5a : 2c 00 d6 BIT $d600 
1e5d : 10 fb __ BPL $1e5a ; (main.l6364 + 0)
.s419:
1e5f : 8e 01 d6 STX $d601 
1e62 : a9 1f __ LDA #$1f
1e64 : 8d 00 d6 STA $d600 
.l6366:
1e67 : 2c 00 d6 BIT $d600 
1e6a : 10 fb __ BPL $1e67 ; (main.l6366 + 0)
.s423:
1e6c : a9 c5 __ LDA #$c5
1e6e : 8d 01 d6 STA $d601 
1e71 : a9 18 __ LDA #$18
1e73 : 8d 00 d6 STA $d600 
.l6368:
1e76 : 2c 00 d6 BIT $d600 
1e79 : 10 fb __ BPL $1e76 ; (main.l6368 + 0)
.s429:
1e7b : ad 01 d6 LDA $d601 
1e7e : 29 7f __ AND #$7f
1e80 : aa __ __ TAX
1e81 : a9 18 __ LDA #$18
1e83 : 8d 00 d6 STA $d600 
.l6370:
1e86 : 2c 00 d6 BIT $d600 
1e89 : 10 fb __ BPL $1e86 ; (main.l6370 + 0)
.s435:
1e8b : 8e 01 d6 STX $d601 
1e8e : a9 1e __ LDA #$1e
1e90 : 8d 00 d6 STA $d600 
.l6372:
1e93 : 2c 00 d6 BIT $d600 
1e96 : 10 fb __ BPL $1e93 ; (main.l6372 + 0)
.s440:
1e98 : a9 4e __ LDA #$4e
1e9a : 8d 01 d6 STA $d601 
1e9d : ad 47 3c LDA $3c47 ; (vdc_state + 7)
1ea0 : 29 f0 __ AND #$f0
1ea2 : 09 45 __ ORA #$45
1ea4 : 8d 47 3c STA $3c47 ; (vdc_state + 7)
1ea7 : a2 00 __ LDX #$00
.l1393:
1ea9 : bd 36 37 LDA $3736,x 
1eac : e8 __ __ INX
1ead : 09 00 __ ORA #$00
1eaf : d0 f8 __ BNE $1ea9 ; (main.l1393 + 0)
.s1394:
1eb1 : 86 45 __ STX T6 + 0 
1eb3 : a9 12 __ LDA #$12
1eb5 : 8d 00 d6 STA $d600 
.l6375:
1eb8 : 2c 00 d6 BIT $d600 
1ebb : 10 fb __ BPL $1eb8 ; (main.l6375 + 0)
.s456:
1ebd : a5 43 __ LDA T5 + 0 
1ebf : 8d 01 d6 STA $d601 
1ec2 : a9 13 __ LDA #$13
1ec4 : 8d 00 d6 STA $d600 
.l6377:
1ec7 : 2c 00 d6 BIT $d600 
1eca : 10 fb __ BPL $1ec7 ; (main.l6377 + 0)
.s461:
1ecc : 8c 01 d6 STY $d601 
1ecf : a9 1f __ LDA #$1f
1ed1 : 8d 00 d6 STA $d600 
1ed4 : 8a __ __ TXA
1ed5 : f0 46 __ BEQ $1f1d ; (main.s466 + 0)
.s1415:
1ed7 : a2 00 __ LDX #$00
.l464:
1ed9 : bd 35 37 LDA $3735,x 
1edc : c9 20 __ CMP #$20
1ede : b0 04 __ BCS $1ee4 ; (main.s470 + 0)
.s469:
1ee0 : 09 80 __ ORA #$80
1ee2 : 90 2b __ BCC $1f0f ; (main.s1397 + 0)
.s470:
1ee4 : a8 __ __ TAY
1ee5 : c9 40 __ CMP #$40
1ee7 : 90 04 __ BCC $1eed ; (main.s473 + 0)
.s475:
1ee9 : c9 60 __ CMP #$60
1eeb : 90 11 __ BCC $1efe ; (main.s472 + 0)
.s473:
1eed : c9 60 __ CMP #$60
1eef : 90 05 __ BCC $1ef6 ; (main.s477 + 0)
.s476:
1ef1 : e9 20 __ SBC #$20
1ef3 : 4c 0f 1f JMP $1f0f ; (main.s1397 + 0)
.s477:
1ef6 : c9 a0 __ CMP #$a0
1ef8 : 90 0a __ BCC $1f04 ; (main.s485 + 0)
.s487:
1efa : c9 c0 __ CMP #$c0
1efc : b0 06 __ BCS $1f04 ; (main.s485 + 0)
.s472:
1efe : 38 __ __ SEC
1eff : e9 40 __ SBC #$40
1f01 : 4c 0f 1f JMP $1f0f ; (main.s1397 + 0)
.s485:
1f04 : c9 c0 __ CMP #$c0
1f06 : 90 08 __ BCC $1f10 ; (main.l6381 + 0)
.s491:
1f08 : c9 ff __ CMP #$ff
1f0a : b0 04 __ BCS $1f10 ; (main.l6381 + 0)
.s488:
1f0c : 38 __ __ SEC
1f0d : e9 80 __ SBC #$80
.s1397:
1f0f : a8 __ __ TAY
.l6381:
1f10 : 2c 00 d6 BIT $d600 
1f13 : 10 fb __ BPL $1f10 ; (main.l6381 + 0)
.s497:
1f15 : 8c 01 d6 STY $d601 
1f18 : e8 __ __ INX
1f19 : e4 45 __ CPX T6 + 0 
1f1b : 90 bc __ BCC $1ed9 ; (main.l464 + 0)
.s466:
1f1d : a9 12 __ LDA #$12
1f1f : 8d 00 d6 STA $d600 
1f22 : a6 45 __ LDX T6 + 0 
1f24 : ca __ __ DEX
1f25 : 86 43 __ STX T5 + 0 
1f27 : ad 4b 3c LDA $3c4b ; (vdc_state + 11)
1f2a : ae 47 3c LDX $3c47 ; (vdc_state + 7)
1f2d : ac 4a 3c LDY $3c4a ; (vdc_state + 10)
.l6384:
1f30 : 2c 00 d6 BIT $d600 
1f33 : 10 fb __ BPL $1f30 ; (main.l6384 + 0)
.s504:
1f35 : 8d 01 d6 STA $d601 
1f38 : a9 13 __ LDA #$13
1f3a : 8d 00 d6 STA $d600 
.l6386:
1f3d : 2c 00 d6 BIT $d600 
1f40 : 10 fb __ BPL $1f3d ; (main.l6386 + 0)
.s509:
1f42 : 8c 01 d6 STY $d601 
1f45 : a9 1f __ LDA #$1f
1f47 : 8d 00 d6 STA $d600 
.l6388:
1f4a : 2c 00 d6 BIT $d600 
1f4d : 10 fb __ BPL $1f4a ; (main.l6388 + 0)
.s513:
1f4f : 8e 01 d6 STX $d601 
1f52 : a9 18 __ LDA #$18
1f54 : 8d 00 d6 STA $d600 
.l6390:
1f57 : 2c 00 d6 BIT $d600 
1f5a : 10 fb __ BPL $1f57 ; (main.l6390 + 0)
.s519:
1f5c : ad 01 d6 LDA $d601 
1f5f : 29 7f __ AND #$7f
1f61 : a8 __ __ TAY
1f62 : a9 18 __ LDA #$18
1f64 : 8d 00 d6 STA $d600 
.l6392:
1f67 : 2c 00 d6 BIT $d600 
1f6a : 10 fb __ BPL $1f67 ; (main.l6392 + 0)
.s525:
1f6c : 8c 01 d6 STY $d601 
1f6f : a9 1e __ LDA #$1e
1f71 : 8d 00 d6 STA $d600 
.l6394:
1f74 : 2c 00 d6 BIT $d600 
1f77 : 10 fb __ BPL $1f74 ; (main.l6394 + 0)
.s530:
1f79 : a5 43 __ LDA T5 + 0 
1f7b : 8d 01 d6 STA $d601 
1f7e : 8a __ __ TXA
1f7f : 29 b0 __ AND #$b0
1f81 : 09 0d __ ORA #$0d
1f83 : 8d 47 3c STA $3c47 ; (vdc_state + 7)
1f86 : a9 56 __ LDA #$56
1f88 : a0 02 __ LDY #$02
1f8a : 91 23 __ STA (SP + 0),y 
1f8c : a9 3c __ LDA #$3c
1f8e : c8 __ __ INY
1f8f : 91 23 __ STA (SP + 0),y 
1f91 : a9 6c __ LDA #$6c
1f93 : c8 __ __ INY
1f94 : 91 23 __ STA (SP + 0),y 
1f96 : a9 3a __ LDA #$3a
1f98 : c8 __ __ INY
1f99 : 91 23 __ STA (SP + 0),y 
1f9b : ad 40 3c LDA $3c40 ; (vdc_state + 0)
1f9e : c8 __ __ INY
1f9f : 91 23 __ STA (SP + 0),y 
1fa1 : a9 00 __ LDA #$00
1fa3 : c8 __ __ INY
1fa4 : 91 23 __ STA (SP + 0),y 
1fa6 : ad 43 3c LDA $3c43 ; (vdc_state + 3)
1fa9 : 85 55 __ STA T3 + 0 
1fab : c8 __ __ INY
1fac : 91 23 __ STA (SP + 0),y 
1fae : ad 44 3c LDA $3c44 ; (vdc_state + 4)
1fb1 : 85 56 __ STA T3 + 1 
1fb3 : c8 __ __ INY
1fb4 : 91 23 __ STA (SP + 0),y 
1fb6 : ad 45 3c LDA $3c45 ; (vdc_state + 5)
1fb9 : c8 __ __ INY
1fba : 91 23 __ STA (SP + 0),y 
1fbc : ad 46 3c LDA $3c46 ; (vdc_state + 6)
1fbf : c8 __ __ INY
1fc0 : 91 23 __ STA (SP + 0),y 
1fc2 : ad 41 3c LDA $3c41 ; (vdc_state + 1)
1fc5 : d0 07 __ BNE $1fce ; (main.s3007 + 0)
.s3008:
1fc7 : a9 3a __ LDA #$3a
1fc9 : a2 ac __ LDX #$ac
1fcb : 4c d2 1f JMP $1fd2 ; (main.s3009 + 0)
.s3007:
1fce : a9 3a __ LDA #$3a
1fd0 : a2 a8 __ LDX #$a8
.s3009:
1fd2 : 85 44 __ STA T5 + 1 
1fd4 : 8a __ __ TXA
1fd5 : a0 0c __ LDY #$0c
1fd7 : 91 23 __ STA (SP + 0),y 
1fd9 : a5 44 __ LDA T5 + 1 
1fdb : c8 __ __ INY
1fdc : 91 23 __ STA (SP + 0),y 
1fde : 20 46 37 JSR $3746 ; (sprintf.s1000 + 0)
1fe1 : 06 55 __ ASL T3 + 0 
1fe3 : 26 56 __ ROL T3 + 1 
1fe5 : a9 00 __ LDA #$00
1fe7 : 85 43 __ STA T5 + 0 
1fe9 : ad 56 3c LDA $3c56 ; (linebuffer + 0)
1fec : f0 0c __ BEQ $1ffa ; (main.s539 + 0)
.s538:
1fee : a2 00 __ LDX #$00
.l1395:
1ff0 : bd 57 3c LDA $3c57,x ; (linebuffer + 1)
1ff3 : e8 __ __ INX
1ff4 : 09 00 __ ORA #$00
1ff6 : d0 f8 __ BNE $1ff0 ; (main.l1395 + 0)
.s1396:
1ff8 : 86 43 __ STX T5 + 0 
.s539:
1ffa : ad 48 3c LDA $3c48 ; (vdc_state + 8)
1ffd : 18 __ __ CLC
1ffe : 65 55 __ ADC T3 + 0 
2000 : aa __ __ TAX
2001 : a9 12 __ LDA #$12
2003 : 8d 00 d6 STA $d600 
2006 : ad 49 3c LDA $3c49 ; (vdc_state + 9)
2009 : 65 56 __ ADC T3 + 1 
.l6399:
200b : 2c 00 d6 BIT $d600 
200e : 10 fb __ BPL $200b ; (main.l6399 + 0)
.s546:
2010 : 8d 01 d6 STA $d601 
2013 : a9 13 __ LDA #$13
2015 : 8d 00 d6 STA $d600 
.l6401:
2018 : 2c 00 d6 BIT $d600 
201b : 10 fb __ BPL $2018 ; (main.l6401 + 0)
.s551:
201d : 8e 01 d6 STX $d601 
2020 : a9 1f __ LDA #$1f
2022 : 8d 00 d6 STA $d600 
2025 : a5 43 __ LDA T5 + 0 
2027 : f0 62 __ BEQ $208b ; (main.s556 + 0)
.s1404:
2029 : a2 00 __ LDX #$00
.l554:
202b : bd 56 3c LDA $3c56,x ; (linebuffer + 0)
202e : c9 20 __ CMP #$20
2030 : b0 05 __ BCS $2037 ; (main.s560 + 0)
.s559:
2032 : 69 80 __ ADC #$80
2034 : 4c 7d 20 JMP $207d ; (main.s1398 + 0)
.s560:
2037 : a8 __ __ TAY
2038 : c9 40 __ CMP #$40
203a : 90 04 __ BCC $2040 ; (main.s563 + 0)
.s565:
203c : c9 60 __ CMP #$60
203e : 90 23 __ BCC $2063 ; (main.s562 + 0)
.s563:
2040 : c9 60 __ CMP #$60
2042 : 90 0a __ BCC $204e ; (main.s567 + 0)
.s569:
2044 : 09 00 __ ORA #$00
2046 : 30 06 __ BMI $204e ; (main.s567 + 0)
.s566:
2048 : 38 __ __ SEC
2049 : e9 20 __ SBC #$20
204b : 4c 7d 20 JMP $207d ; (main.s1398 + 0)
.s567:
204e : c9 80 __ CMP #$80
2050 : 90 09 __ BCC $205b ; (main.s571 + 0)
.s573:
2052 : c9 a0 __ CMP #$a0
2054 : b0 05 __ BCS $205b ; (main.s571 + 0)
.s570:
2056 : 69 40 __ ADC #$40
2058 : 4c 7d 20 JMP $207d ; (main.s1398 + 0)
.s571:
205b : c9 a0 __ CMP #$a0
205d : 90 0a __ BCC $2069 ; (main.s575 + 0)
.s577:
205f : c9 c0 __ CMP #$c0
2061 : b0 06 __ BCS $2069 ; (main.s575 + 0)
.s562:
2063 : 38 __ __ SEC
2064 : e9 40 __ SBC #$40
2066 : 4c 7d 20 JMP $207d ; (main.s1398 + 0)
.s575:
2069 : c9 c0 __ CMP #$c0
206b : 90 0a __ BCC $2077 ; (main.s579 + 0)
.s581:
206d : c9 ff __ CMP #$ff
206f : b0 06 __ BCS $2077 ; (main.s579 + 0)
.s578:
2071 : 38 __ __ SEC
2072 : e9 80 __ SBC #$80
2074 : 4c 7d 20 JMP $207d ; (main.s1398 + 0)
.s579:
2077 : c9 ff __ CMP #$ff
2079 : d0 03 __ BNE $207e ; (main.l6405 + 0)
.s582:
207b : a9 5e __ LDA #$5e
.s1398:
207d : a8 __ __ TAY
.l6405:
207e : 2c 00 d6 BIT $d600 
2081 : 10 fb __ BPL $207e ; (main.l6405 + 0)
.s587:
2083 : 8c 01 d6 STY $d601 
2086 : e8 __ __ INX
2087 : e4 43 __ CPX T5 + 0 
2089 : 90 a0 __ BCC $202b ; (main.l554 + 0)
.s556:
208b : a9 12 __ LDA #$12
208d : 8d 00 d6 STA $d600 
2090 : c6 43 __ DEC T5 + 0 
2092 : 18 __ __ CLC
2093 : a5 55 __ LDA T3 + 0 
2095 : 6d 4a 3c ADC $3c4a ; (vdc_state + 10)
2098 : a8 __ __ TAY
2099 : a5 56 __ LDA T3 + 1 
209b : 6d 4b 3c ADC $3c4b ; (vdc_state + 11)
209e : ae 47 3c LDX $3c47 ; (vdc_state + 7)
.l6408:
20a1 : 2c 00 d6 BIT $d600 
20a4 : 10 fb __ BPL $20a1 ; (main.l6408 + 0)
.s594:
20a6 : 8d 01 d6 STA $d601 
20a9 : a9 13 __ LDA #$13
20ab : 8d 00 d6 STA $d600 
.l6410:
20ae : 2c 00 d6 BIT $d600 
20b1 : 10 fb __ BPL $20ae ; (main.l6410 + 0)
.s599:
20b3 : 8c 01 d6 STY $d601 
20b6 : a9 1f __ LDA #$1f
20b8 : 8d 00 d6 STA $d600 
.l6412:
20bb : 2c 00 d6 BIT $d600 
20be : 10 fb __ BPL $20bb ; (main.l6412 + 0)
.s603:
20c0 : 8e 01 d6 STX $d601 
20c3 : a9 18 __ LDA #$18
20c5 : 8d 00 d6 STA $d600 
.l6414:
20c8 : 2c 00 d6 BIT $d600 
20cb : 10 fb __ BPL $20c8 ; (main.l6414 + 0)
.s609:
20cd : ad 01 d6 LDA $d601 
20d0 : 29 7f __ AND #$7f
20d2 : aa __ __ TAX
20d3 : a9 18 __ LDA #$18
20d5 : 8d 00 d6 STA $d600 
.l6416:
20d8 : 2c 00 d6 BIT $d600 
20db : 10 fb __ BPL $20d8 ; (main.l6416 + 0)
.s615:
20dd : 8e 01 d6 STX $d601 
20e0 : a9 1e __ LDA #$1e
20e2 : 8d 00 d6 STA $d600 
.l6418:
20e5 : 2c 00 d6 BIT $d600 
20e8 : 10 fb __ BPL $20e5 ; (main.l6418 + 0)
.s620:
20ea : a5 43 __ LDA T5 + 0 
20ec : 8d 01 d6 STA $d601 
20ef : ad 43 3c LDA $3c43 ; (vdc_state + 3)
20f2 : 0a __ __ ASL
20f3 : aa __ __ TAX
20f4 : a9 12 __ LDA #$12
20f6 : 8d 00 d6 STA $d600 
20f9 : ad 44 3c LDA $3c44 ; (vdc_state + 4)
20fc : 2a __ __ ROL
20fd : a8 __ __ TAY
20fe : 8a __ __ TXA
20ff : 18 __ __ CLC
2100 : 6d 43 3c ADC $3c43 ; (vdc_state + 3)
2103 : aa __ __ TAX
2104 : 98 __ __ TYA
2105 : 6d 44 3c ADC $3c44 ; (vdc_state + 4)
2108 : a8 __ __ TAY
2109 : 8a __ __ TXA
210a : 18 __ __ CLC
210b : 69 04 __ ADC #$04
210d : 85 47 __ STA T7 + 0 
210f : 98 __ __ TYA
2110 : 69 00 __ ADC #$00
2112 : 85 48 __ STA T7 + 1 
2114 : 18 __ __ CLC
2115 : a5 47 __ LDA T7 + 0 
2117 : 6d 48 3c ADC $3c48 ; (vdc_state + 8)
211a : 85 49 __ STA T8 + 0 
211c : a5 48 __ LDA T7 + 1 
211e : 6d 49 3c ADC $3c49 ; (vdc_state + 9)
.l6420:
2121 : 2c 00 d6 BIT $d600 
2124 : 10 fb __ BPL $2121 ; (main.l6420 + 0)
.s630:
2126 : 8d 01 d6 STA $d601 
2129 : a9 13 __ LDA #$13
212b : 8d 00 d6 STA $d600 
.l6422:
212e : 2c 00 d6 BIT $d600 
2131 : 10 fb __ BPL $212e ; (main.l6422 + 0)
.s635:
2133 : a5 49 __ LDA T8 + 0 
2135 : 8d 01 d6 STA $d601 
2138 : a9 1f __ LDA #$1f
213a : 8d 00 d6 STA $d600 
.l6424:
213d : 2c 00 d6 BIT $d600 
2140 : 10 fb __ BPL $213d ; (main.l6424 + 0)
.s639:
2142 : a9 6c __ LDA #$6c
2144 : 8d 01 d6 STA $d601 
2147 : a9 12 __ LDA #$12
2149 : 8d 00 d6 STA $d600 
214c : 18 __ __ CLC
214d : a5 47 __ LDA T7 + 0 
214f : 6d 4a 3c ADC $3c4a ; (vdc_state + 10)
2152 : 85 47 __ STA T7 + 0 
2154 : a5 48 __ LDA T7 + 1 
2156 : 6d 4b 3c ADC $3c4b ; (vdc_state + 11)
.l6426:
2159 : 2c 00 d6 BIT $d600 
215c : 10 fb __ BPL $2159 ; (main.l6426 + 0)
.s646:
215e : 8d 01 d6 STA $d601 
2161 : a9 13 __ LDA #$13
2163 : 8d 00 d6 STA $d600 
.l6428:
2166 : 2c 00 d6 BIT $d600 
2169 : 10 fb __ BPL $2166 ; (main.l6428 + 0)
.s651:
216b : a5 47 __ LDA T7 + 0 
216d : 8d 01 d6 STA $d601 
2170 : a9 1f __ LDA #$1f
2172 : 8d 00 d6 STA $d600 
.l6430:
2175 : 2c 00 d6 BIT $d600 
2178 : 10 fb __ BPL $2175 ; (main.l6430 + 0)
.s655:
217a : a9 09 __ LDA #$09
217c : 8d 01 d6 STA $d601 
217f : a9 12 __ LDA #$12
2181 : 8d 00 d6 STA $d600 
2184 : 8a __ __ TXA
2185 : 18 __ __ CLC
2186 : 69 05 __ ADC #$05
2188 : 85 47 __ STA T7 + 0 
218a : 98 __ __ TYA
218b : 69 00 __ ADC #$00
218d : 85 48 __ STA T7 + 1 
218f : 18 __ __ CLC
2190 : a5 47 __ LDA T7 + 0 
2192 : 6d 48 3c ADC $3c48 ; (vdc_state + 8)
2195 : 85 49 __ STA T8 + 0 
2197 : a5 48 __ LDA T7 + 1 
2199 : 6d 49 3c ADC $3c49 ; (vdc_state + 9)
.l6432:
219c : 2c 00 d6 BIT $d600 
219f : 10 fb __ BPL $219c ; (main.l6432 + 0)
.s665:
21a1 : 8d 01 d6 STA $d601 
21a4 : a9 13 __ LDA #$13
21a6 : 8d 00 d6 STA $d600 
.l6434:
21a9 : 2c 00 d6 BIT $d600 
21ac : 10 fb __ BPL $21a9 ; (main.l6434 + 0)
.s670:
21ae : a5 49 __ LDA T8 + 0 
21b0 : 8d 01 d6 STA $d601 
21b3 : a9 1f __ LDA #$1f
21b5 : 8d 00 d6 STA $d600 
.l6436:
21b8 : 2c 00 d6 BIT $d600 
21bb : 10 fb __ BPL $21b8 ; (main.l6436 + 0)
.s674:
21bd : a9 62 __ LDA #$62
21bf : 8d 01 d6 STA $d601 
21c2 : a9 18 __ LDA #$18
21c4 : 8d 00 d6 STA $d600 
.l6438:
21c7 : 2c 00 d6 BIT $d600 
21ca : 10 fb __ BPL $21c7 ; (main.l6438 + 0)
.s680:
21cc : ad 01 d6 LDA $d601 
21cf : 29 7f __ AND #$7f
21d1 : 85 49 __ STA T8 + 0 
21d3 : a9 18 __ LDA #$18
21d5 : 8d 00 d6 STA $d600 
.l6440:
21d8 : 2c 00 d6 BIT $d600 
21db : 10 fb __ BPL $21d8 ; (main.l6440 + 0)
.s686:
21dd : a5 49 __ LDA T8 + 0 
21df : 8d 01 d6 STA $d601 
21e2 : a9 1e __ LDA #$1e
21e4 : 8d 00 d6 STA $d600 
.l6442:
21e7 : 2c 00 d6 BIT $d600 
21ea : 10 fb __ BPL $21e7 ; (main.l6442 + 0)
.s691:
21ec : a9 45 __ LDA #$45
21ee : 8d 01 d6 STA $d601 
21f1 : a9 12 __ LDA #$12
21f3 : 8d 00 d6 STA $d600 
21f6 : 18 __ __ CLC
21f7 : a5 47 __ LDA T7 + 0 
21f9 : 6d 4a 3c ADC $3c4a ; (vdc_state + 10)
21fc : 85 47 __ STA T7 + 0 
21fe : a5 48 __ LDA T7 + 1 
2200 : 6d 4b 3c ADC $3c4b ; (vdc_state + 11)
.l6444:
2203 : 2c 00 d6 BIT $d600 
2206 : 10 fb __ BPL $2203 ; (main.l6444 + 0)
.s698:
2208 : 8d 01 d6 STA $d601 
220b : a9 13 __ LDA #$13
220d : 8d 00 d6 STA $d600 
.l6446:
2210 : 2c 00 d6 BIT $d600 
2213 : 10 fb __ BPL $2210 ; (main.l6446 + 0)
.s703:
2215 : a5 47 __ LDA T7 + 0 
2217 : 8d 01 d6 STA $d601 
221a : a9 1f __ LDA #$1f
221c : 8d 00 d6 STA $d600 
.l6448:
221f : 2c 00 d6 BIT $d600 
2222 : 10 fb __ BPL $221f ; (main.l6448 + 0)
.s707:
2224 : a9 09 __ LDA #$09
2226 : 8d 01 d6 STA $d601 
2229 : a9 18 __ LDA #$18
222b : 8d 00 d6 STA $d600 
.l6450:
222e : 2c 00 d6 BIT $d600 
2231 : 10 fb __ BPL $222e ; (main.l6450 + 0)
.s713:
2233 : ad 01 d6 LDA $d601 
2236 : 29 7f __ AND #$7f
2238 : 85 47 __ STA T7 + 0 
223a : a9 18 __ LDA #$18
223c : 8d 00 d6 STA $d600 
.l6452:
223f : 2c 00 d6 BIT $d600 
2242 : 10 fb __ BPL $223f ; (main.l6452 + 0)
.s719:
2244 : a5 47 __ LDA T7 + 0 
2246 : 8d 01 d6 STA $d601 
2249 : a9 1e __ LDA #$1e
224b : 8d 00 d6 STA $d600 
.l6454:
224e : 2c 00 d6 BIT $d600 
2251 : 10 fb __ BPL $224e ; (main.l6454 + 0)
.s724:
2253 : a9 45 __ LDA #$45
2255 : 8d 01 d6 STA $d601 
2258 : a9 12 __ LDA #$12
225a : 8d 00 d6 STA $d600 
225d : 8a __ __ TXA
225e : 18 __ __ CLC
225f : 69 4b __ ADC #$4b
2261 : aa __ __ TAX
2262 : 90 01 __ BCC $2265 ; (main.s1407 + 0)
.s1406:
2264 : c8 __ __ INY
.s1407:
2265 : 18 __ __ CLC
2266 : 6d 48 3c ADC $3c48 ; (vdc_state + 8)
2269 : 85 43 __ STA T5 + 0 
226b : 98 __ __ TYA
226c : 6d 49 3c ADC $3c49 ; (vdc_state + 9)
.l6456:
226f : 2c 00 d6 BIT $d600 
2272 : 10 fb __ BPL $226f ; (main.l6456 + 0)
.s734:
2274 : 8d 01 d6 STA $d601 
2277 : a9 13 __ LDA #$13
2279 : 8d 00 d6 STA $d600 
.l6458:
227c : 2c 00 d6 BIT $d600 
227f : 10 fb __ BPL $227c ; (main.l6458 + 0)
.s739:
2281 : a5 43 __ LDA T5 + 0 
2283 : 8d 01 d6 STA $d601 
2286 : a9 1f __ LDA #$1f
2288 : 8d 00 d6 STA $d600 
.l6460:
228b : 2c 00 d6 BIT $d600 
228e : 10 fb __ BPL $228b ; (main.l6460 + 0)
.s743:
2290 : a9 7b __ LDA #$7b
2292 : 8d 01 d6 STA $d601 
2295 : a9 12 __ LDA #$12
2297 : 8d 00 d6 STA $d600 
229a : 8a __ __ TXA
229b : 18 __ __ CLC
229c : 6d 4a 3c ADC $3c4a ; (vdc_state + 10)
229f : aa __ __ TAX
22a0 : 98 __ __ TYA
22a1 : 6d 4b 3c ADC $3c4b ; (vdc_state + 11)
.l6462:
22a4 : 2c 00 d6 BIT $d600 
22a7 : 10 fb __ BPL $22a4 ; (main.l6462 + 0)
.s750:
22a9 : 8d 01 d6 STA $d601 
22ac : a9 13 __ LDA #$13
22ae : 8d 00 d6 STA $d600 
.l6464:
22b1 : 2c 00 d6 BIT $d600 
22b4 : 10 fb __ BPL $22b1 ; (main.l6464 + 0)
.s755:
22b6 : 8e 01 d6 STX $d601 
22b9 : a9 1f __ LDA #$1f
22bb : 8d 00 d6 STA $d600 
.l6466:
22be : 2c 00 d6 BIT $d600 
22c1 : 10 fb __ BPL $22be ; (main.l6466 + 0)
.s759:
22c3 : a9 09 __ LDA #$09
22c5 : 8d 01 d6 STA $d601 
22c8 : ad 45 3c LDA $3c45 ; (vdc_state + 5)
22cb : 38 __ __ SEC
22cc : e9 05 __ SBC #$05
22ce : 85 55 __ STA T3 + 0 
22d0 : a9 04 __ LDA #$04
22d2 : 85 57 __ STA T4 + 0 
.l761:
22d4 : 18 __ __ CLC
22d5 : a5 55 __ LDA T3 + 0 
22d7 : 69 04 __ ADC #$04
22d9 : 90 03 __ BCC $22de ; (main.s1177 + 0)
22db : 4c 4f 2a JMP $2a4f ; (main.s762 + 0)
.s1177:
22de : c5 57 __ CMP T4 + 0 
22e0 : 90 05 __ BCC $22e7 ; (main.s760 + 0)
.s1408:
22e2 : f0 03 __ BEQ $22e7 ; (main.s760 + 0)
22e4 : 4c 4f 2a JMP $2a4f ; (main.s762 + 0)
.s760:
22e7 : ad 45 3c LDA $3c45 ; (vdc_state + 5)
22ea : 38 __ __ SEC
22eb : e9 05 __ SBC #$05
22ed : 85 55 __ STA T3 + 0 
22ef : a9 04 __ LDA #$04
22f1 : 85 57 __ STA T4 + 0 
.l801:
22f3 : 18 __ __ CLC
22f4 : a5 55 __ LDA T3 + 0 
22f6 : 69 04 __ ADC #$04
22f8 : 85 47 __ STA T7 + 0 
22fa : ad 43 3c LDA $3c43 ; (vdc_state + 3)
22fd : 85 43 __ STA T5 + 0 
22ff : ad 44 3c LDA $3c44 ; (vdc_state + 4)
2302 : 85 44 __ STA T5 + 1 
2304 : ad 48 3c LDA $3c48 ; (vdc_state + 8)
2307 : 85 45 __ STA T6 + 0 
2309 : ad 49 3c LDA $3c49 ; (vdc_state + 9)
230c : 85 46 __ STA T6 + 1 
230e : 90 03 __ BCC $2313 ; (main.s1163 + 0)
2310 : 4c c8 29 JMP $29c8 ; (main.s802 + 0)
.s1163:
2313 : a5 57 __ LDA T4 + 0 
2315 : c5 47 __ CMP T7 + 0 
2317 : b0 03 __ BCS $231c ; (main.s800 + 0)
2319 : 4c c8 29 JMP $29c8 ; (main.s802 + 0)
.s800:
231c : a9 12 __ LDA #$12
231e : 8d 00 d6 STA $d600 
2321 : ad 45 3c LDA $3c45 ; (vdc_state + 5)
2324 : e9 01 __ SBC #$01
2326 : 85 55 __ STA T3 + 0 
2328 : ad 46 3c LDA $3c46 ; (vdc_state + 6)
232b : e9 00 __ SBC #$00
232d : 85 56 __ STA T3 + 1 
232f : a5 43 __ LDA T5 + 0 
2331 : 85 1b __ STA ACCU + 0 
2333 : a5 44 __ LDA T5 + 1 
2335 : 85 1c __ STA ACCU + 1 
2337 : a5 55 __ LDA T3 + 0 
2339 : 20 b0 3a JSR $3ab0 ; (mul16by8 + 0)
233c : 18 __ __ CLC
233d : a5 05 __ LDA WORK + 2 
233f : 69 04 __ ADC #$04
2341 : aa __ __ TAX
2342 : a5 06 __ LDA WORK + 3 
2344 : 69 00 __ ADC #$00
2346 : a8 __ __ TAY
2347 : 8a __ __ TXA
2348 : 18 __ __ CLC
2349 : 65 45 __ ADC T6 + 0 
234b : 85 4b __ STA T9 + 0 
234d : 98 __ __ TYA
234e : 65 46 __ ADC T6 + 1 
.l6494:
2350 : 2c 00 d6 BIT $d600 
2353 : 10 fb __ BPL $2350 ; (main.l6494 + 0)
.s849:
2355 : 8d 01 d6 STA $d601 
2358 : a9 13 __ LDA #$13
235a : 8d 00 d6 STA $d600 
.l6496:
235d : 2c 00 d6 BIT $d600 
2360 : 10 fb __ BPL $235d ; (main.l6496 + 0)
.s854:
2362 : a5 4b __ LDA T9 + 0 
2364 : 8d 01 d6 STA $d601 
2367 : a9 1f __ LDA #$1f
2369 : 8d 00 d6 STA $d600 
.l6498:
236c : 2c 00 d6 BIT $d600 
236f : 10 fb __ BPL $236c ; (main.l6498 + 0)
.s858:
2371 : a9 7c __ LDA #$7c
2373 : 8d 01 d6 STA $d601 
2376 : a9 12 __ LDA #$12
2378 : 8d 00 d6 STA $d600 
237b : 8a __ __ TXA
237c : 18 __ __ CLC
237d : 6d 4a 3c ADC $3c4a ; (vdc_state + 10)
2380 : aa __ __ TAX
2381 : 98 __ __ TYA
2382 : 6d 4b 3c ADC $3c4b ; (vdc_state + 11)
.l6500:
2385 : 2c 00 d6 BIT $d600 
2388 : 10 fb __ BPL $2385 ; (main.l6500 + 0)
.s865:
238a : 8d 01 d6 STA $d601 
238d : a9 13 __ LDA #$13
238f : 8d 00 d6 STA $d600 
.l6502:
2392 : 2c 00 d6 BIT $d600 
2395 : 10 fb __ BPL $2392 ; (main.l6502 + 0)
.s870:
2397 : 8e 01 d6 STX $d601 
239a : a9 1f __ LDA #$1f
239c : 8d 00 d6 STA $d600 
.l6504:
239f : 2c 00 d6 BIT $d600 
23a2 : 10 fb __ BPL $239f ; (main.l6504 + 0)
.s874:
23a4 : a9 09 __ LDA #$09
23a6 : 8d 01 d6 STA $d601 
23a9 : a9 12 __ LDA #$12
23ab : 8d 00 d6 STA $d600 
23ae : 18 __ __ CLC
23af : a5 05 __ LDA WORK + 2 
23b1 : 69 05 __ ADC #$05
23b3 : aa __ __ TAX
23b4 : a5 06 __ LDA WORK + 3 
23b6 : 69 00 __ ADC #$00
23b8 : a8 __ __ TAY
23b9 : 8a __ __ TXA
23ba : 18 __ __ CLC
23bb : 65 45 __ ADC T6 + 0 
23bd : 85 4e __ STA T11 + 0 
23bf : 98 __ __ TYA
23c0 : 65 46 __ ADC T6 + 1 
.l6506:
23c2 : 2c 00 d6 BIT $d600 
23c5 : 10 fb __ BPL $23c2 ; (main.l6506 + 0)
.s884:
23c7 : 8d 01 d6 STA $d601 
23ca : a9 13 __ LDA #$13
23cc : 8d 00 d6 STA $d600 
.l6508:
23cf : 2c 00 d6 BIT $d600 
23d2 : 10 fb __ BPL $23cf ; (main.l6508 + 0)
.s889:
23d4 : a5 4e __ LDA T11 + 0 
23d6 : 8d 01 d6 STA $d601 
23d9 : a9 1f __ LDA #$1f
23db : 8d 00 d6 STA $d600 
.l6510:
23de : 2c 00 d6 BIT $d600 
23e1 : 10 fb __ BPL $23de ; (main.l6510 + 0)
.s893:
23e3 : a9 e2 __ LDA #$e2
23e5 : 8d 01 d6 STA $d601 
23e8 : a9 18 __ LDA #$18
23ea : 8d 00 d6 STA $d600 
.l6512:
23ed : 2c 00 d6 BIT $d600 
23f0 : 10 fb __ BPL $23ed ; (main.l6512 + 0)
.s899:
23f2 : ad 01 d6 LDA $d601 
23f5 : 29 7f __ AND #$7f
23f7 : 85 4e __ STA T11 + 0 
23f9 : a9 18 __ LDA #$18
23fb : 8d 00 d6 STA $d600 
.l6514:
23fe : 2c 00 d6 BIT $d600 
2401 : 10 fb __ BPL $23fe ; (main.l6514 + 0)
.s905:
2403 : a5 4e __ LDA T11 + 0 
2405 : 8d 01 d6 STA $d601 
2408 : a9 1e __ LDA #$1e
240a : 8d 00 d6 STA $d600 
.l6516:
240d : 2c 00 d6 BIT $d600 
2410 : 10 fb __ BPL $240d ; (main.l6516 + 0)
.s910:
2412 : a9 45 __ LDA #$45
2414 : 8d 01 d6 STA $d601 
2417 : a9 12 __ LDA #$12
2419 : 8d 00 d6 STA $d600 
241c : 8a __ __ TXA
241d : 18 __ __ CLC
241e : 6d 4a 3c ADC $3c4a ; (vdc_state + 10)
2421 : aa __ __ TAX
2422 : 98 __ __ TYA
2423 : 6d 4b 3c ADC $3c4b ; (vdc_state + 11)
.l6518:
2426 : 2c 00 d6 BIT $d600 
2429 : 10 fb __ BPL $2426 ; (main.l6518 + 0)
.s917:
242b : 8d 01 d6 STA $d601 
242e : a9 13 __ LDA #$13
2430 : 8d 00 d6 STA $d600 
.l6520:
2433 : 2c 00 d6 BIT $d600 
2436 : 10 fb __ BPL $2433 ; (main.l6520 + 0)
.s922:
2438 : 8e 01 d6 STX $d601 
243b : a9 1f __ LDA #$1f
243d : 8d 00 d6 STA $d600 
.l6522:
2440 : 2c 00 d6 BIT $d600 
2443 : 10 fb __ BPL $2440 ; (main.l6522 + 0)
.s926:
2445 : a9 09 __ LDA #$09
2447 : 8d 01 d6 STA $d601 
244a : a9 18 __ LDA #$18
244c : 8d 00 d6 STA $d600 
.l6524:
244f : 2c 00 d6 BIT $d600 
2452 : 10 fb __ BPL $244f ; (main.l6524 + 0)
.s932:
2454 : ad 01 d6 LDA $d601 
2457 : 29 7f __ AND #$7f
2459 : aa __ __ TAX
245a : a9 18 __ LDA #$18
245c : 8d 00 d6 STA $d600 
.l6526:
245f : 2c 00 d6 BIT $d600 
2462 : 10 fb __ BPL $245f ; (main.l6526 + 0)
.s938:
2464 : 8e 01 d6 STX $d601 
2467 : a9 1e __ LDA #$1e
2469 : 8d 00 d6 STA $d600 
.l6528:
246c : 2c 00 d6 BIT $d600 
246f : 10 fb __ BPL $246c ; (main.l6528 + 0)
.s943:
2471 : a9 45 __ LDA #$45
2473 : 8d 01 d6 STA $d601 
2476 : a9 12 __ LDA #$12
2478 : 8d 00 d6 STA $d600 
247b : 18 __ __ CLC
247c : a5 05 __ LDA WORK + 2 
247e : 69 4b __ ADC #$4b
2480 : aa __ __ TAX
2481 : a5 06 __ LDA WORK + 3 
2483 : 69 00 __ ADC #$00
2485 : a8 __ __ TAY
2486 : 8a __ __ TXA
2487 : 18 __ __ CLC
2488 : 65 45 __ ADC T6 + 0 
248a : 85 49 __ STA T8 + 0 
248c : 98 __ __ TYA
248d : 65 46 __ ADC T6 + 1 
.l6530:
248f : 2c 00 d6 BIT $d600 
2492 : 10 fb __ BPL $248f ; (main.l6530 + 0)
.s953:
2494 : 8d 01 d6 STA $d601 
2497 : a9 13 __ LDA #$13
2499 : 8d 00 d6 STA $d600 
.l6532:
249c : 2c 00 d6 BIT $d600 
249f : 10 fb __ BPL $249c ; (main.l6532 + 0)
.s958:
24a1 : a5 49 __ LDA T8 + 0 
24a3 : 8d 01 d6 STA $d601 
24a6 : a9 1f __ LDA #$1f
24a8 : 8d 00 d6 STA $d600 
.l6534:
24ab : 2c 00 d6 BIT $d600 
24ae : 10 fb __ BPL $24ab ; (main.l6534 + 0)
.s962:
24b0 : a9 7e __ LDA #$7e
24b2 : 8d 01 d6 STA $d601 
24b5 : a9 12 __ LDA #$12
24b7 : 8d 00 d6 STA $d600 
24ba : 8a __ __ TXA
24bb : 18 __ __ CLC
24bc : 6d 4a 3c ADC $3c4a ; (vdc_state + 10)
24bf : aa __ __ TAX
24c0 : 98 __ __ TYA
24c1 : 6d 4b 3c ADC $3c4b ; (vdc_state + 11)
.l6536:
24c4 : 2c 00 d6 BIT $d600 
24c7 : 10 fb __ BPL $24c4 ; (main.l6536 + 0)
.s969:
24c9 : 8d 01 d6 STA $d601 
24cc : a9 13 __ LDA #$13
24ce : 8d 00 d6 STA $d600 
.l6538:
24d1 : 2c 00 d6 BIT $d600 
24d4 : 10 fb __ BPL $24d1 ; (main.l6538 + 0)
.s974:
24d6 : 8e 01 d6 STX $d601 
24d9 : a9 1f __ LDA #$1f
24db : 8d 00 d6 STA $d600 
.l6540:
24de : 2c 00 d6 BIT $d600 
24e1 : 10 fb __ BPL $24de ; (main.l6540 + 0)
.s978:
24e3 : a9 09 __ LDA #$09
24e5 : 8d 01 d6 STA $d601 
24e8 : a5 56 __ LDA T3 + 1 
24ea : d0 06 __ BNE $24f2 ; (main.s1346 + 0)
.s1102:
24ec : a9 04 __ LDA #$04
24ee : c5 55 __ CMP T3 + 0 
24f0 : b0 0f __ BCS $2501 ; (main.s982 + 0)
.s1346:
24f2 : a5 43 __ LDA T5 + 0 
24f4 : 85 55 __ STA T3 + 0 
24f6 : a5 44 __ LDA T5 + 1 
24f8 : 85 56 __ STA T3 + 1 
24fa : a9 04 __ LDA #$04
24fc : 85 57 __ STA T4 + 0 
24fe : 4c fb 28 JMP $28fb ; (main.l980 + 0)
.s982:
2501 : ad 45 3c LDA $3c45 ; (vdc_state + 5)
2504 : e9 05 __ SBC #$05
2506 : 85 55 __ STA T3 + 0 
2508 : ad 46 3c LDA $3c46 ; (vdc_state + 6)
250b : e9 00 __ SBC #$00
250d : 05 55 __ ORA T3 + 0 
250f : f0 03 __ BEQ $2514 ; (main.s367 + 0)
2511 : 4c 4d 26 JMP $264d ; (main.s1338 + 0)
.s367:
2514 : e6 54 __ INC T2 + 0 
2516 : a5 54 __ LDA T2 + 0 
2518 : c9 02 __ CMP #$02
251a : b0 0f __ BCS $252b ; (main.s368 + 0)
.s366:
251c : 09 00 __ ORA #$00
251e : d0 03 __ BNE $2523 ; (main.s369 + 0)
2520 : 4c df 1d JMP $1ddf ; (main.l371 + 0)
.s369:
2523 : 85 16 __ STA P9 
2525 : 20 8d 32 JSR $328d ; (vdc_set_mode.s1000 + 0)
2528 : 4c df 1d JMP $1ddf ; (main.l371 + 0)
.s368:
252b : a9 00 __ LDA #$00
252d : 85 52 __ STA T0 + 0 
252f : 8d 30 d0 STA $d030 
2532 : 85 16 __ STA P9 
2534 : ad 11 d0 LDA $d011 
2537 : 29 7f __ AND #$7f
2539 : 09 10 __ ORA #$10
253b : 8d 11 d0 STA $d011 
253e : 20 8d 32 JSR $328d ; (vdc_set_mode.s1000 + 0)
2541 : ad 43 3c LDA $3c43 ; (vdc_state + 3)
2544 : 85 55 __ STA T3 + 0 
2546 : ad 45 3c LDA $3c45 ; (vdc_state + 5)
2549 : 85 43 __ STA T5 + 0 
.l1199:
254b : a5 52 __ LDA T0 + 0 
254d : c5 43 __ CMP T5 + 0 
254f : 90 1c __ BCC $256d ; (main.s1200 + 0)
.s1192:
2551 : a9 00 __ LDA #$00
2553 : 85 1b __ STA ACCU + 0 
2555 : 85 1c __ STA ACCU + 1 
.s1001:
2557 : 18 __ __ CLC
2558 : a5 23 __ LDA SP + 0 
255a : 69 0e __ ADC #$0e
255c : 85 23 __ STA SP + 0 
255e : 90 02 __ BCC $2562 ; (main.s1001 + 11)
2560 : e6 24 __ INC SP + 1 
2562 : a2 04 __ LDX #$04
2564 : bd a5 bf LDA $bfa5,x ; (main@stack + 0)
2567 : 95 53 __ STA T1 + 0,x 
2569 : ca __ __ DEX
256a : 10 f8 __ BPL $2564 ; (main.s1001 + 13)
256c : 60 __ __ RTS
.s1200:
256d : ad 43 3c LDA $3c43 ; (vdc_state + 3)
2570 : 85 1b __ STA ACCU + 0 
2572 : ad 44 3c LDA $3c44 ; (vdc_state + 4)
2575 : 85 1c __ STA ACCU + 1 
2577 : ad 47 3c LDA $3c47 ; (vdc_state + 7)
257a : 85 53 __ STA T1 + 0 
257c : a9 12 __ LDA #$12
257e : 8d 00 d6 STA $d600 
2581 : a6 55 __ LDX T3 + 0 
2583 : ca __ __ DEX
2584 : 86 49 __ STX T8 + 0 
2586 : a5 52 __ LDA T0 + 0 
2588 : 20 b0 3a JSR $3ab0 ; (mul16by8 + 0)
258b : 18 __ __ CLC
258c : a5 05 __ LDA WORK + 2 
258e : 6d 48 3c ADC $3c48 ; (vdc_state + 8)
2591 : aa __ __ TAX
2592 : a5 06 __ LDA WORK + 3 
2594 : 6d 49 3c ADC $3c49 ; (vdc_state + 9)
.l6617:
2597 : 2c 00 d6 BIT $d600 
259a : 10 fb __ BPL $2597 ; (main.l6617 + 0)
.s1212:
259c : 8d 01 d6 STA $d601 
259f : a9 13 __ LDA #$13
25a1 : 8d 00 d6 STA $d600 
.l6619:
25a4 : 2c 00 d6 BIT $d600 
25a7 : 10 fb __ BPL $25a4 ; (main.l6619 + 0)
.s1217:
25a9 : 8e 01 d6 STX $d601 
25ac : a9 1f __ LDA #$1f
25ae : 8d 00 d6 STA $d600 
.l6621:
25b1 : 2c 00 d6 BIT $d600 
25b4 : 10 fb __ BPL $25b1 ; (main.l6621 + 0)
.s1221:
25b6 : a9 20 __ LDA #$20
25b8 : 8d 01 d6 STA $d601 
25bb : a9 18 __ LDA #$18
25bd : 8d 00 d6 STA $d600 
.l6623:
25c0 : 2c 00 d6 BIT $d600 
25c3 : 10 fb __ BPL $25c0 ; (main.l6623 + 0)
.s1227:
25c5 : ad 01 d6 LDA $d601 
25c8 : 29 7f __ AND #$7f
25ca : aa __ __ TAX
25cb : a9 18 __ LDA #$18
25cd : 8d 00 d6 STA $d600 
.l6625:
25d0 : 2c 00 d6 BIT $d600 
25d3 : 10 fb __ BPL $25d0 ; (main.l6625 + 0)
.s1233:
25d5 : 8e 01 d6 STX $d601 
25d8 : a9 1e __ LDA #$1e
25da : 8d 00 d6 STA $d600 
.l6627:
25dd : 2c 00 d6 BIT $d600 
25e0 : 10 fb __ BPL $25dd ; (main.l6627 + 0)
.s1238:
25e2 : a5 49 __ LDA T8 + 0 
25e4 : 8d 01 d6 STA $d601 
25e7 : ad 4a 3c LDA $3c4a ; (vdc_state + 10)
25ea : 18 __ __ CLC
25eb : 65 05 __ ADC WORK + 2 
25ed : aa __ __ TAX
25ee : a9 12 __ LDA #$12
25f0 : 8d 00 d6 STA $d600 
25f3 : ad 4b 3c LDA $3c4b ; (vdc_state + 11)
25f6 : 65 06 __ ADC WORK + 3 
.l6629:
25f8 : 2c 00 d6 BIT $d600 
25fb : 10 fb __ BPL $25f8 ; (main.l6629 + 0)
.s1245:
25fd : 8d 01 d6 STA $d601 
2600 : a9 13 __ LDA #$13
2602 : 8d 00 d6 STA $d600 
.l6631:
2605 : 2c 00 d6 BIT $d600 
2608 : 10 fb __ BPL $2605 ; (main.l6631 + 0)
.s1250:
260a : 8e 01 d6 STX $d601 
260d : a9 1f __ LDA #$1f
260f : 8d 00 d6 STA $d600 
.l6633:
2612 : 2c 00 d6 BIT $d600 
2615 : 10 fb __ BPL $2612 ; (main.l6633 + 0)
.s1254:
2617 : a5 53 __ LDA T1 + 0 
2619 : 8d 01 d6 STA $d601 
261c : a9 18 __ LDA #$18
261e : 8d 00 d6 STA $d600 
.l6635:
2621 : 2c 00 d6 BIT $d600 
2624 : 10 fb __ BPL $2621 ; (main.l6635 + 0)
.s1260:
2626 : ad 01 d6 LDA $d601 
2629 : 29 7f __ AND #$7f
262b : aa __ __ TAX
262c : a9 18 __ LDA #$18
262e : 8d 00 d6 STA $d600 
.l6637:
2631 : 2c 00 d6 BIT $d600 
2634 : 10 fb __ BPL $2631 ; (main.l6637 + 0)
.s1266:
2636 : 8e 01 d6 STX $d601 
2639 : a9 1e __ LDA #$1e
263b : 8d 00 d6 STA $d600 
.l6639:
263e : 2c 00 d6 BIT $d600 
2641 : 10 fb __ BPL $263e ; (main.l6639 + 0)
.s1271:
2643 : a5 49 __ LDA T8 + 0 
2645 : 8d 01 d6 STA $d601 
2648 : e6 52 __ INC T0 + 0 
264a : 4c 4b 25 JMP $254b ; (main.l1199 + 0)
.s1338:
264d : ad 43 3c LDA $3c43 ; (vdc_state + 3)
2650 : 0a __ __ ASL
2651 : 85 55 __ STA T3 + 0 
2653 : ad 44 3c LDA $3c44 ; (vdc_state + 4)
2656 : 2a __ __ ROL
2657 : 06 55 __ ASL T3 + 0 
2659 : 2a __ __ ROL
265a : aa __ __ TAX
265b : 18 __ __ CLC
265c : a5 55 __ LDA T3 + 0 
265e : 69 05 __ ADC #$05
2660 : 85 55 __ STA T3 + 0 
2662 : 90 01 __ BCC $2665 ; (main.s1410 + 0)
.s1409:
2664 : e8 __ __ INX
.s1410:
2665 : 86 56 __ STX T3 + 1 
2667 : a9 00 __ LDA #$00
2669 : 85 57 __ STA T4 + 0 
.l1028:
266b : 20 42 32 JSR $3242 ; (getch.s0 + 0)
266e : ad 45 3c LDA $3c45 ; (vdc_state + 5)
2671 : 38 __ __ SEC
2672 : e9 06 __ SBC #$06
2674 : f0 25 __ BEQ $269b ; (main.s1031 + 0)
.s1337:
2676 : 85 4d __ STA T10 + 0 
2678 : ad 48 3c LDA $3c48 ; (vdc_state + 8)
267b : 18 __ __ CLC
267c : 65 55 __ ADC T3 + 0 
267e : 85 43 __ STA T5 + 0 
2680 : aa __ __ TAX
2681 : ad 49 3c LDA $3c49 ; (vdc_state + 9)
2684 : 65 56 __ ADC T3 + 1 
2686 : 85 44 __ STA T5 + 1 
2688 : a8 __ __ TAY
2689 : ad 43 3c LDA $3c43 ; (vdc_state + 3)
268c : 18 __ __ CLC
268d : 65 43 __ ADC T5 + 0 
268f : 85 45 __ STA T6 + 0 
2691 : ad 44 3c LDA $3c44 ; (vdc_state + 4)
2694 : 65 44 __ ADC T5 + 1 
2696 : 85 46 __ STA T6 + 1 
2698 : 4c 66 28 JMP $2866 ; (main.l1033 + 0)
.s1031:
269b : ad 45 3c LDA $3c45 ; (vdc_state + 5)
269e : 38 __ __ SEC
269f : e9 06 __ SBC #$06
26a1 : f0 03 __ BEQ $26a6 ; (main.s1077 + 0)
26a3 : 4c af 27 JMP $27af ; (main.s1329 + 0)
.s1077:
26a6 : ad 43 3c LDA $3c43 ; (vdc_state + 3)
26a9 : 85 1b __ STA ACCU + 0 
26ab : ad 44 3c LDA $3c44 ; (vdc_state + 4)
26ae : 85 1c __ STA ACCU + 1 
26b0 : ad 46 3c LDA $3c46 ; (vdc_state + 6)
26b3 : 85 46 __ STA T6 + 1 
26b5 : a9 12 __ LDA #$12
26b7 : 8d 00 d6 STA $d600 
26ba : ad 45 3c LDA $3c45 ; (vdc_state + 5)
26bd : 85 45 __ STA T6 + 0 
26bf : 38 __ __ SEC
26c0 : e9 02 __ SBC #$02
26c2 : 20 b0 3a JSR $3ab0 ; (mul16by8 + 0)
26c5 : 18 __ __ CLC
26c6 : a5 05 __ LDA WORK + 2 
26c8 : 69 05 __ ADC #$05
26ca : 85 43 __ STA T5 + 0 
26cc : a5 06 __ LDA WORK + 3 
26ce : 69 00 __ ADC #$00
26d0 : 85 44 __ STA T5 + 1 
26d2 : 18 __ __ CLC
26d3 : a5 43 __ LDA T5 + 0 
26d5 : 6d 48 3c ADC $3c48 ; (vdc_state + 8)
26d8 : aa __ __ TAX
26d9 : a5 44 __ LDA T5 + 1 
26db : 6d 49 3c ADC $3c49 ; (vdc_state + 9)
.l6591:
26de : 2c 00 d6 BIT $d600 
26e1 : 10 fb __ BPL $26de ; (main.l6591 + 0)
.s1132:
26e3 : 8d 01 d6 STA $d601 
26e6 : a9 13 __ LDA #$13
26e8 : 8d 00 d6 STA $d600 
.l6593:
26eb : 2c 00 d6 BIT $d600 
26ee : 10 fb __ BPL $26eb ; (main.l6593 + 0)
.s1137:
26f0 : 8e 01 d6 STX $d601 
26f3 : a9 1f __ LDA #$1f
26f5 : 8d 00 d6 STA $d600 
.l6595:
26f8 : 2c 00 d6 BIT $d600 
26fb : 10 fb __ BPL $26f8 ; (main.l6595 + 0)
.s1141:
26fd : a9 20 __ LDA #$20
26ff : 8d 01 d6 STA $d601 
2702 : a9 18 __ LDA #$18
2704 : 8d 00 d6 STA $d600 
.l6597:
2707 : 2c 00 d6 BIT $d600 
270a : 10 fb __ BPL $2707 ; (main.l6597 + 0)
.s1147:
270c : ad 01 d6 LDA $d601 
270f : 29 7f __ AND #$7f
2711 : aa __ __ TAX
2712 : a9 18 __ LDA #$18
2714 : 8d 00 d6 STA $d600 
.l6599:
2717 : 2c 00 d6 BIT $d600 
271a : 10 fb __ BPL $2717 ; (main.l6599 + 0)
.s1153:
271c : 8e 01 d6 STX $d601 
271f : a9 1e __ LDA #$1e
2721 : 8d 00 d6 STA $d600 
.l6601:
2724 : 2c 00 d6 BIT $d600 
2727 : 10 fb __ BPL $2724 ; (main.l6601 + 0)
.s1158:
2729 : a9 45 __ LDA #$45
272b : 8d 01 d6 STA $d601 
272e : ad 4a 3c LDA $3c4a ; (vdc_state + 10)
2731 : 18 __ __ CLC
2732 : 65 43 __ ADC T5 + 0 
2734 : aa __ __ TAX
2735 : a9 12 __ LDA #$12
2737 : 8d 00 d6 STA $d600 
273a : ad 4b 3c LDA $3c4b ; (vdc_state + 11)
273d : 65 44 __ ADC T5 + 1 
.l6603:
273f : 2c 00 d6 BIT $d600 
2742 : 10 fb __ BPL $273f ; (main.l6603 + 0)
.s1165:
2744 : 8d 01 d6 STA $d601 
2747 : a9 13 __ LDA #$13
2749 : 8d 00 d6 STA $d600 
.l6605:
274c : 2c 00 d6 BIT $d600 
274f : 10 fb __ BPL $274c ; (main.l6605 + 0)
.s1170:
2751 : 8e 01 d6 STX $d601 
2754 : a9 1f __ LDA #$1f
2756 : 8d 00 d6 STA $d600 
.l6607:
2759 : 2c 00 d6 BIT $d600 
275c : 10 fb __ BPL $2759 ; (main.l6607 + 0)
.s1174:
275e : a9 0d __ LDA #$0d
2760 : 8d 01 d6 STA $d601 
2763 : a9 18 __ LDA #$18
2765 : 8d 00 d6 STA $d600 
.l6609:
2768 : 2c 00 d6 BIT $d600 
276b : 10 fb __ BPL $2768 ; (main.l6609 + 0)
.s1180:
276d : ad 01 d6 LDA $d601 
2770 : 29 7f __ AND #$7f
2772 : aa __ __ TAX
2773 : a9 18 __ LDA #$18
2775 : 8d 00 d6 STA $d600 
.l6611:
2778 : 2c 00 d6 BIT $d600 
277b : 10 fb __ BPL $2778 ; (main.l6611 + 0)
.s1186:
277d : 8e 01 d6 STX $d601 
2780 : a9 1e __ LDA #$1e
2782 : 8d 00 d6 STA $d600 
.l6613:
2785 : 2c 00 d6 BIT $d600 
2788 : 10 fb __ BPL $2785 ; (main.l6613 + 0)
.s1191:
278a : a9 45 __ LDA #$45
278c : 8d 01 d6 STA $d601 
278f : 38 __ __ SEC
2790 : a5 45 __ LDA T6 + 0 
2792 : e9 05 __ SBC #$05
2794 : 85 43 __ STA T5 + 0 
2796 : a5 46 __ LDA T6 + 1 
2798 : e9 00 __ SBC #$00
279a : e6 57 __ INC T4 + 0 
279c : 09 00 __ ORA #$00
279e : f0 03 __ BEQ $27a3 ; (main.s1030 + 0)
27a0 : 4c 6b 26 JMP $266b ; (main.l1028 + 0)
.s1030:
27a3 : a5 57 __ LDA T4 + 0 
27a5 : c5 43 __ CMP T5 + 0 
27a7 : b0 03 __ BCS $27ac ; (main.s1030 + 9)
27a9 : 4c 6b 26 JMP $266b ; (main.l1028 + 0)
27ac : 4c 14 25 JMP $2514 ; (main.s367 + 0)
.s1329:
27af : 85 4d __ STA T10 + 0 
27b1 : ad 4a 3c LDA $3c4a ; (vdc_state + 10)
27b4 : 18 __ __ CLC
27b5 : 65 55 __ ADC T3 + 0 
27b7 : 85 43 __ STA T5 + 0 
27b9 : aa __ __ TAX
27ba : ad 4b 3c LDA $3c4b ; (vdc_state + 11)
27bd : 65 56 __ ADC T3 + 1 
27bf : 85 44 __ STA T5 + 1 
27c1 : a8 __ __ TAY
27c2 : ad 43 3c LDA $3c43 ; (vdc_state + 3)
27c5 : 18 __ __ CLC
27c6 : 65 43 __ ADC T5 + 0 
27c8 : 85 45 __ STA T6 + 0 
27ca : ad 44 3c LDA $3c44 ; (vdc_state + 4)
27cd : 65 44 __ ADC T5 + 1 
27cf : 85 46 __ STA T6 + 1 
.l1079:
27d1 : a9 12 __ LDA #$12
27d3 : 8d 00 d6 STA $d600 
.l6576:
27d6 : 2c 00 d6 BIT $d600 
27d9 : 10 fb __ BPL $27d6 ; (main.l6576 + 0)
.s1088:
27db : 8c 01 d6 STY $d601 
27de : a9 13 __ LDA #$13
27e0 : 8d 00 d6 STA $d600 
.l6578:
27e3 : 2c 00 d6 BIT $d600 
27e6 : 10 fb __ BPL $27e3 ; (main.l6578 + 0)
.s1093:
27e8 : 8e 01 d6 STX $d601 
27eb : a9 1f __ LDA #$1f
27ed : 8d 00 d6 STA $d600 
27f0 : a9 18 __ LDA #$18
27f2 : 8d 00 d6 STA $d600 
.l6580:
27f5 : 2c 00 d6 BIT $d600 
27f8 : 10 fb __ BPL $27f5 ; (main.l6580 + 0)
.s1100:
27fa : ad 01 d6 LDA $d601 
27fd : 09 80 __ ORA #$80
27ff : 85 47 __ STA T7 + 0 
2801 : a9 18 __ LDA #$18
2803 : 8d 00 d6 STA $d600 
.l6582:
2806 : 2c 00 d6 BIT $d600 
2809 : 10 fb __ BPL $2806 ; (main.l6582 + 0)
.s1106:
280b : a5 47 __ LDA T7 + 0 
280d : 8d 01 d6 STA $d601 
2810 : a9 20 __ LDA #$20
2812 : 8d 00 d6 STA $d600 
.l6584:
2815 : 2c 00 d6 BIT $d600 
2818 : 10 fb __ BPL $2815 ; (main.l6584 + 0)
.s1111:
281a : a5 46 __ LDA T6 + 1 
281c : 8d 01 d6 STA $d601 
281f : a9 21 __ LDA #$21
2821 : 8d 00 d6 STA $d600 
.l6586:
2824 : 2c 00 d6 BIT $d600 
2827 : 10 fb __ BPL $2824 ; (main.l6586 + 0)
.s1116:
2829 : a5 45 __ LDA T6 + 0 
282b : 8d 01 d6 STA $d601 
282e : a9 1f __ LDA #$1f
2830 : 8d 00 d6 STA $d600 
2833 : a9 1e __ LDA #$1e
2835 : 8d 00 d6 STA $d600 
.l6588:
2838 : 2c 00 d6 BIT $d600 
283b : 10 fb __ BPL $2838 ; (main.l6588 + 0)
.s1122:
283d : a9 46 __ LDA #$46
283f : 8d 01 d6 STA $d601 
2842 : ad 43 3c LDA $3c43 ; (vdc_state + 3)
2845 : 18 __ __ CLC
2846 : 65 45 __ ADC T6 + 0 
2848 : 85 45 __ STA T6 + 0 
284a : ad 44 3c LDA $3c44 ; (vdc_state + 4)
284d : 65 46 __ ADC T6 + 1 
284f : 85 46 __ STA T6 + 1 
2851 : 8a __ __ TXA
2852 : 18 __ __ CLC
2853 : 6d 43 3c ADC $3c43 ; (vdc_state + 3)
2856 : aa __ __ TAX
2857 : 98 __ __ TYA
2858 : 6d 44 3c ADC $3c44 ; (vdc_state + 4)
285b : a8 __ __ TAY
285c : c6 4d __ DEC T10 + 0 
285e : f0 03 __ BEQ $2863 ; (main.s1122 + 38)
2860 : 4c d1 27 JMP $27d1 ; (main.l1079 + 0)
2863 : 4c a6 26 JMP $26a6 ; (main.s1077 + 0)
.l1033:
2866 : a9 12 __ LDA #$12
2868 : 8d 00 d6 STA $d600 
.l6560:
286b : 2c 00 d6 BIT $d600 
286e : 10 fb __ BPL $286b ; (main.l6560 + 0)
.s1042:
2870 : 8c 01 d6 STY $d601 
2873 : a9 13 __ LDA #$13
2875 : 8d 00 d6 STA $d600 
.l6562:
2878 : 2c 00 d6 BIT $d600 
287b : 10 fb __ BPL $2878 ; (main.l6562 + 0)
.s1047:
287d : 8e 01 d6 STX $d601 
2880 : a9 1f __ LDA #$1f
2882 : 8d 00 d6 STA $d600 
2885 : a9 18 __ LDA #$18
2887 : 8d 00 d6 STA $d600 
.l6564:
288a : 2c 00 d6 BIT $d600 
288d : 10 fb __ BPL $288a ; (main.l6564 + 0)
.s1054:
288f : ad 01 d6 LDA $d601 
2892 : 09 80 __ ORA #$80
2894 : 85 47 __ STA T7 + 0 
2896 : a9 18 __ LDA #$18
2898 : 8d 00 d6 STA $d600 
.l6566:
289b : 2c 00 d6 BIT $d600 
289e : 10 fb __ BPL $289b ; (main.l6566 + 0)
.s1060:
28a0 : a5 47 __ LDA T7 + 0 
28a2 : 8d 01 d6 STA $d601 
28a5 : a9 20 __ LDA #$20
28a7 : 8d 00 d6 STA $d600 
.l6568:
28aa : 2c 00 d6 BIT $d600 
28ad : 10 fb __ BPL $28aa ; (main.l6568 + 0)
.s1065:
28af : a5 46 __ LDA T6 + 1 
28b1 : 8d 01 d6 STA $d601 
28b4 : a9 21 __ LDA #$21
28b6 : 8d 00 d6 STA $d600 
.l6570:
28b9 : 2c 00 d6 BIT $d600 
28bc : 10 fb __ BPL $28b9 ; (main.l6570 + 0)
.s1070:
28be : a5 45 __ LDA T6 + 0 
28c0 : 8d 01 d6 STA $d601 
28c3 : a9 1f __ LDA #$1f
28c5 : 8d 00 d6 STA $d600 
28c8 : a9 1e __ LDA #$1e
28ca : 8d 00 d6 STA $d600 
.l6572:
28cd : 2c 00 d6 BIT $d600 
28d0 : 10 fb __ BPL $28cd ; (main.l6572 + 0)
.s1076:
28d2 : a9 46 __ LDA #$46
28d4 : 8d 01 d6 STA $d601 
28d7 : ad 43 3c LDA $3c43 ; (vdc_state + 3)
28da : 18 __ __ CLC
28db : 65 45 __ ADC T6 + 0 
28dd : 85 45 __ STA T6 + 0 
28df : ad 44 3c LDA $3c44 ; (vdc_state + 4)
28e2 : 65 46 __ ADC T6 + 1 
28e4 : 85 46 __ STA T6 + 1 
28e6 : 8a __ __ TXA
28e7 : 18 __ __ CLC
28e8 : 6d 43 3c ADC $3c43 ; (vdc_state + 3)
28eb : aa __ __ TAX
28ec : 98 __ __ TYA
28ed : 6d 44 3c ADC $3c44 ; (vdc_state + 4)
28f0 : a8 __ __ TAY
28f1 : c6 4d __ DEC T10 + 0 
28f3 : f0 03 __ BEQ $28f8 ; (main.s1076 + 38)
28f5 : 4c 66 28 JMP $2866 ; (main.l1033 + 0)
28f8 : 4c 9b 26 JMP $269b ; (main.s1031 + 0)
.l980:
28fb : a5 55 __ LDA T3 + 0 
28fd : 85 1b __ STA ACCU + 0 
28ff : a5 56 __ LDA T3 + 1 
2901 : 85 1c __ STA ACCU + 1 
2903 : a5 57 __ LDA T4 + 0 
2905 : 20 b0 3a JSR $3ab0 ; (mul16by8 + 0)
2908 : a5 05 __ LDA WORK + 2 
290a : 85 43 __ STA T5 + 0 
290c : a5 06 __ LDA WORK + 3 
290e : 85 44 __ STA T5 + 1 
2910 : a0 05 __ LDY #$05
2912 : a6 53 __ LDX T1 + 0 
.l984:
2914 : 86 4e __ STX T11 + 0 
2916 : a9 12 __ LDA #$12
2918 : 8d 00 d6 STA $d600 
291b : a5 52 __ LDA T0 + 0 
291d : 85 1b __ STA ACCU + 0 
291f : 98 __ __ TYA
2920 : 18 __ __ CLC
2921 : 65 43 __ ADC T5 + 0 
2923 : 85 47 __ STA T7 + 0 
2925 : a9 00 __ LDA #$00
2927 : 65 44 __ ADC T5 + 1 
2929 : 85 48 __ STA T7 + 1 
292b : 18 __ __ CLC
292c : a5 47 __ LDA T7 + 0 
292e : 65 45 __ ADC T6 + 0 
2930 : 85 49 __ STA T8 + 0 
2932 : a5 48 __ LDA T7 + 1 
2934 : 65 46 __ ADC T6 + 1 
2936 : e6 52 __ INC T0 + 0 
2938 : e8 __ __ INX
.l6543:
2939 : 2c 00 d6 BIT $d600 
293c : 10 fb __ BPL $2939 ; (main.l6543 + 0)
.s996:
293e : 8d 01 d6 STA $d601 
2941 : a9 13 __ LDA #$13
2943 : 8d 00 d6 STA $d600 
.l6545:
2946 : 2c 00 d6 BIT $d600 
2949 : 10 fb __ BPL $2946 ; (main.l6545 + 0)
.s1001:
294b : a5 49 __ LDA T8 + 0 
294d : 8d 01 d6 STA $d601 
2950 : a9 1f __ LDA #$1f
2952 : 8d 00 d6 STA $d600 
.l6547:
2955 : 2c 00 d6 BIT $d600 
2958 : 10 fb __ BPL $2955 ; (main.l6547 + 0)
.s1005:
295a : a5 1b __ LDA ACCU + 0 
295c : 8d 01 d6 STA $d601 
295f : ad 4a 3c LDA $3c4a ; (vdc_state + 10)
2962 : 18 __ __ CLC
2963 : 65 47 __ ADC T7 + 0 
2965 : 85 47 __ STA T7 + 0 
2967 : a9 12 __ LDA #$12
2969 : 8d 00 d6 STA $d600 
296c : ad 4b 3c LDA $3c4b ; (vdc_state + 11)
296f : 65 48 __ ADC T7 + 1 
.l6549:
2971 : 2c 00 d6 BIT $d600 
2974 : 10 fb __ BPL $2971 ; (main.l6549 + 0)
.s1012:
2976 : 8d 01 d6 STA $d601 
2979 : a9 13 __ LDA #$13
297b : 8d 00 d6 STA $d600 
.l6551:
297e : 2c 00 d6 BIT $d600 
2981 : 10 fb __ BPL $297e ; (main.l6551 + 0)
.s1017:
2983 : a5 47 __ LDA T7 + 0 
2985 : 8d 01 d6 STA $d601 
2988 : a9 1f __ LDA #$1f
298a : 8d 00 d6 STA $d600 
.l6553:
298d : 2c 00 d6 BIT $d600 
2990 : 10 fb __ BPL $298d ; (main.l6553 + 0)
.s1021:
2992 : a5 4e __ LDA T11 + 0 
2994 : 8d 01 d6 STA $d601 
2997 : e0 10 __ CPX #$10
2999 : 90 02 __ BCC $299d ; (main.s4390 + 0)
.s1022:
299b : a2 00 __ LDX #$00
.s4390:
299d : c8 __ __ INY
299e : c0 4b __ CPY #$4b
29a0 : b0 03 __ BCS $29a5 ; (main.s981 + 0)
29a2 : 4c 14 29 JMP $2914 ; (main.l984 + 0)
.s981:
29a5 : 86 53 __ STX T1 + 0 
29a7 : ad 45 3c LDA $3c45 ; (vdc_state + 5)
29aa : e9 01 __ SBC #$01
29ac : 85 43 __ STA T5 + 0 
29ae : ad 46 3c LDA $3c46 ; (vdc_state + 6)
29b1 : e9 00 __ SBC #$00
29b3 : e6 57 __ INC T4 + 0 
29b5 : 09 00 __ ORA #$00
29b7 : f0 03 __ BEQ $29bc ; (main.s1084 + 0)
29b9 : 4c fb 28 JMP $28fb ; (main.l980 + 0)
.s1084:
29bc : a5 57 __ LDA T4 + 0 
29be : c5 43 __ CMP T5 + 0 
29c0 : b0 03 __ BCS $29c5 ; (main.s1084 + 9)
29c2 : 4c fb 28 JMP $28fb ; (main.l980 + 0)
29c5 : 4c 01 25 JMP $2501 ; (main.s982 + 0)
.s802:
29c8 : a9 12 __ LDA #$12
29ca : 8d 00 d6 STA $d600 
29cd : a5 43 __ LDA T5 + 0 
29cf : 85 1b __ STA ACCU + 0 
29d1 : a5 44 __ LDA T5 + 1 
29d3 : 85 1c __ STA ACCU + 1 
29d5 : a5 57 __ LDA T4 + 0 
29d7 : 20 b0 3a JSR $3ab0 ; (mul16by8 + 0)
29da : 18 __ __ CLC
29db : a5 05 __ LDA WORK + 2 
29dd : 69 4b __ ADC #$4b
29df : 85 43 __ STA T5 + 0 
29e1 : a5 06 __ LDA WORK + 3 
29e3 : 69 00 __ ADC #$00
29e5 : 85 44 __ STA T5 + 1 
29e7 : 18 __ __ CLC
29e8 : a5 43 __ LDA T5 + 0 
29ea : 65 45 __ ADC T6 + 0 
29ec : aa __ __ TAX
29ed : a5 44 __ LDA T5 + 1 
29ef : 65 46 __ ADC T6 + 1 
.l6482:
29f1 : 2c 00 d6 BIT $d600 
29f4 : 10 fb __ BPL $29f1 ; (main.l6482 + 0)
.s814:
29f6 : 8d 01 d6 STA $d601 
29f9 : a9 13 __ LDA #$13
29fb : 8d 00 d6 STA $d600 
.l6484:
29fe : 2c 00 d6 BIT $d600 
2a01 : 10 fb __ BPL $29fe ; (main.l6484 + 0)
.s819:
2a03 : 8e 01 d6 STX $d601 
2a06 : a9 1f __ LDA #$1f
2a08 : 8d 00 d6 STA $d600 
.l6486:
2a0b : 2c 00 d6 BIT $d600 
2a0e : 10 fb __ BPL $2a0b ; (main.l6486 + 0)
.s823:
2a10 : a9 61 __ LDA #$61
2a12 : 8d 01 d6 STA $d601 
2a15 : ad 4a 3c LDA $3c4a ; (vdc_state + 10)
2a18 : 18 __ __ CLC
2a19 : 65 43 __ ADC T5 + 0 
2a1b : aa __ __ TAX
2a1c : a9 12 __ LDA #$12
2a1e : 8d 00 d6 STA $d600 
2a21 : ad 4b 3c LDA $3c4b ; (vdc_state + 11)
2a24 : 65 44 __ ADC T5 + 1 
.l6488:
2a26 : 2c 00 d6 BIT $d600 
2a29 : 10 fb __ BPL $2a26 ; (main.l6488 + 0)
.s830:
2a2b : 8d 01 d6 STA $d601 
2a2e : a9 13 __ LDA #$13
2a30 : 8d 00 d6 STA $d600 
.l6490:
2a33 : 2c 00 d6 BIT $d600 
2a36 : 10 fb __ BPL $2a33 ; (main.l6490 + 0)
.s835:
2a38 : 8e 01 d6 STX $d601 
2a3b : a9 1f __ LDA #$1f
2a3d : 8d 00 d6 STA $d600 
.l6492:
2a40 : 2c 00 d6 BIT $d600 
2a43 : 10 fb __ BPL $2a40 ; (main.l6492 + 0)
.s839:
2a45 : a9 09 __ LDA #$09
2a47 : 8d 01 d6 STA $d601 
2a4a : e6 57 __ INC T4 + 0 
2a4c : 4c f3 22 JMP $22f3 ; (main.l801 + 0)
.s762:
2a4f : ad 43 3c LDA $3c43 ; (vdc_state + 3)
2a52 : 85 1b __ STA ACCU + 0 
2a54 : ad 44 3c LDA $3c44 ; (vdc_state + 4)
2a57 : 85 1c __ STA ACCU + 1 
2a59 : a9 12 __ LDA #$12
2a5b : 8d 00 d6 STA $d600 
2a5e : a5 57 __ LDA T4 + 0 
2a60 : 20 b0 3a JSR $3ab0 ; (mul16by8 + 0)
2a63 : 18 __ __ CLC
2a64 : a5 05 __ LDA WORK + 2 
2a66 : 69 04 __ ADC #$04
2a68 : 85 43 __ STA T5 + 0 
2a6a : a5 06 __ LDA WORK + 3 
2a6c : 69 00 __ ADC #$00
2a6e : 85 44 __ STA T5 + 1 
2a70 : 18 __ __ CLC
2a71 : a5 43 __ LDA T5 + 0 
2a73 : 6d 48 3c ADC $3c48 ; (vdc_state + 8)
2a76 : aa __ __ TAX
2a77 : a5 44 __ LDA T5 + 1 
2a79 : 6d 49 3c ADC $3c49 ; (vdc_state + 9)
.l6469:
2a7c : 2c 00 d6 BIT $d600 
2a7f : 10 fb __ BPL $2a7c ; (main.l6469 + 0)
.s774:
2a81 : 8d 01 d6 STA $d601 
2a84 : a9 13 __ LDA #$13
2a86 : 8d 00 d6 STA $d600 
.l6471:
2a89 : 2c 00 d6 BIT $d600 
2a8c : 10 fb __ BPL $2a89 ; (main.l6471 + 0)
.s779:
2a8e : 8e 01 d6 STX $d601 
2a91 : a9 1f __ LDA #$1f
2a93 : 8d 00 d6 STA $d600 
.l6473:
2a96 : 2c 00 d6 BIT $d600 
2a99 : 10 fb __ BPL $2a96 ; (main.l6473 + 0)
.s783:
2a9b : a9 e1 __ LDA #$e1
2a9d : 8d 01 d6 STA $d601 
2aa0 : ad 4a 3c LDA $3c4a ; (vdc_state + 10)
2aa3 : 18 __ __ CLC
2aa4 : 65 43 __ ADC T5 + 0 
2aa6 : aa __ __ TAX
2aa7 : a9 12 __ LDA #$12
2aa9 : 8d 00 d6 STA $d600 
2aac : ad 4b 3c LDA $3c4b ; (vdc_state + 11)
2aaf : 65 44 __ ADC T5 + 1 
.l6475:
2ab1 : 2c 00 d6 BIT $d600 
2ab4 : 10 fb __ BPL $2ab1 ; (main.l6475 + 0)
.s790:
2ab6 : 8d 01 d6 STA $d601 
2ab9 : a9 13 __ LDA #$13
2abb : 8d 00 d6 STA $d600 
.l6477:
2abe : 2c 00 d6 BIT $d600 
2ac1 : 10 fb __ BPL $2abe ; (main.l6477 + 0)
.s795:
2ac3 : 8e 01 d6 STX $d601 
2ac6 : a9 1f __ LDA #$1f
2ac8 : 8d 00 d6 STA $d600 
.l6479:
2acb : 2c 00 d6 BIT $d600 
2ace : 10 fb __ BPL $2acb ; (main.l6479 + 0)
.s799:
2ad0 : a9 09 __ LDA #$09
2ad2 : 8d 01 d6 STA $d601 
2ad5 : e6 57 __ INC T4 + 0 
2ad7 : 4c d4 22 JMP $22d4 ; (main.l761 + 0)
.s100:
2ada : ad 43 3c LDA $3c43 ; (vdc_state + 3)
2add : 85 1b __ STA ACCU + 0 
2adf : ad 44 3c LDA $3c44 ; (vdc_state + 4)
2ae2 : 85 1c __ STA ACCU + 1 
2ae4 : ad 47 3c LDA $3c47 ; (vdc_state + 7)
2ae7 : 85 57 __ STA T4 + 0 
2ae9 : a9 12 __ LDA #$12
2aeb : 8d 00 d6 STA $d600 
2aee : a6 55 __ LDX T3 + 0 
2af0 : ca __ __ DEX
2af1 : 86 49 __ STX T8 + 0 
2af3 : a5 54 __ LDA T2 + 0 
2af5 : 20 b0 3a JSR $3ab0 ; (mul16by8 + 0)
2af8 : 18 __ __ CLC
2af9 : a5 05 __ LDA WORK + 2 
2afb : 6d 48 3c ADC $3c48 ; (vdc_state + 8)
2afe : aa __ __ TAX
2aff : a5 06 __ LDA WORK + 3 
2b01 : 6d 49 3c ADC $3c49 ; (vdc_state + 9)
.l6325:
2b04 : 2c 00 d6 BIT $d600 
2b07 : 10 fb __ BPL $2b04 ; (main.l6325 + 0)
.s112:
2b09 : 8d 01 d6 STA $d601 
2b0c : a9 13 __ LDA #$13
2b0e : 8d 00 d6 STA $d600 
.l6327:
2b11 : 2c 00 d6 BIT $d600 
2b14 : 10 fb __ BPL $2b11 ; (main.l6327 + 0)
.s117:
2b16 : 8e 01 d6 STX $d601 
2b19 : a9 1f __ LDA #$1f
2b1b : 8d 00 d6 STA $d600 
.l6329:
2b1e : 2c 00 d6 BIT $d600 
2b21 : 10 fb __ BPL $2b1e ; (main.l6329 + 0)
.s121:
2b23 : a9 20 __ LDA #$20
2b25 : 8d 01 d6 STA $d601 
2b28 : a9 18 __ LDA #$18
2b2a : 8d 00 d6 STA $d600 
.l6331:
2b2d : 2c 00 d6 BIT $d600 
2b30 : 10 fb __ BPL $2b2d ; (main.l6331 + 0)
.s127:
2b32 : ad 01 d6 LDA $d601 
2b35 : 29 7f __ AND #$7f
2b37 : aa __ __ TAX
2b38 : a9 18 __ LDA #$18
2b3a : 8d 00 d6 STA $d600 
.l6333:
2b3d : 2c 00 d6 BIT $d600 
2b40 : 10 fb __ BPL $2b3d ; (main.l6333 + 0)
.s133:
2b42 : 8e 01 d6 STX $d601 
2b45 : a9 1e __ LDA #$1e
2b47 : 8d 00 d6 STA $d600 
.l6335:
2b4a : 2c 00 d6 BIT $d600 
2b4d : 10 fb __ BPL $2b4a ; (main.l6335 + 0)
.s138:
2b4f : a5 49 __ LDA T8 + 0 
2b51 : 8d 01 d6 STA $d601 
2b54 : ad 4a 3c LDA $3c4a ; (vdc_state + 10)
2b57 : 18 __ __ CLC
2b58 : 65 05 __ ADC WORK + 2 
2b5a : aa __ __ TAX
2b5b : a9 12 __ LDA #$12
2b5d : 8d 00 d6 STA $d600 
2b60 : ad 4b 3c LDA $3c4b ; (vdc_state + 11)
2b63 : 65 06 __ ADC WORK + 3 
.l6337:
2b65 : 2c 00 d6 BIT $d600 
2b68 : 10 fb __ BPL $2b65 ; (main.l6337 + 0)
.s145:
2b6a : 8d 01 d6 STA $d601 
2b6d : a9 13 __ LDA #$13
2b6f : 8d 00 d6 STA $d600 
.l6339:
2b72 : 2c 00 d6 BIT $d600 
2b75 : 10 fb __ BPL $2b72 ; (main.l6339 + 0)
.s150:
2b77 : 8e 01 d6 STX $d601 
2b7a : a9 1f __ LDA #$1f
2b7c : 8d 00 d6 STA $d600 
.l6341:
2b7f : 2c 00 d6 BIT $d600 
2b82 : 10 fb __ BPL $2b7f ; (main.l6341 + 0)
.s154:
2b84 : a5 57 __ LDA T4 + 0 
2b86 : 8d 01 d6 STA $d601 
2b89 : a9 18 __ LDA #$18
2b8b : 8d 00 d6 STA $d600 
.l6343:
2b8e : 2c 00 d6 BIT $d600 
2b91 : 10 fb __ BPL $2b8e ; (main.l6343 + 0)
.s160:
2b93 : ad 01 d6 LDA $d601 
2b96 : 29 7f __ AND #$7f
2b98 : aa __ __ TAX
2b99 : a9 18 __ LDA #$18
2b9b : 8d 00 d6 STA $d600 
.l6345:
2b9e : 2c 00 d6 BIT $d600 
2ba1 : 10 fb __ BPL $2b9e ; (main.l6345 + 0)
.s166:
2ba3 : 8e 01 d6 STX $d601 
2ba6 : a9 1e __ LDA #$1e
2ba8 : 8d 00 d6 STA $d600 
.l6347:
2bab : 2c 00 d6 BIT $d600 
2bae : 10 fb __ BPL $2bab ; (main.l6347 + 0)
.s171:
2bb0 : a5 49 __ LDA T8 + 0 
2bb2 : 8d 01 d6 STA $d601 
2bb5 : e6 54 __ INC T2 + 0 
2bb7 : 4c a3 1d JMP $1da3 ; (main.l99 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
2bba : a2 03 __ LDX #$03
2bbc : b5 53 __ LDA T8 + 0,x 
2bbe : 9d b2 bf STA $bfb2,x ; (printf@stack + 0)
2bc1 : ca __ __ DEX
2bc2 : 10 f8 __ BPL $2bbc ; (printf.s1000 + 2)
.s0:
2bc4 : 18 __ __ CLC
2bc5 : a5 23 __ LDA SP + 0 
2bc7 : 69 04 __ ADC #$04
2bc9 : 85 47 __ STA T0 + 0 
2bcb : a5 24 __ LDA SP + 1 
2bcd : 69 00 __ ADC #$00
2bcf : 85 48 __ STA T0 + 1 
2bd1 : a9 00 __ LDA #$00
2bd3 : 85 49 __ STA T2 + 0 
2bd5 : a0 02 __ LDY #$02
2bd7 : b1 23 __ LDA (SP + 0),y 
2bd9 : 85 4a __ STA T3 + 0 
2bdb : c8 __ __ INY
2bdc : b1 23 __ LDA (SP + 0),y 
2bde : 85 4b __ STA T3 + 1 
.l2:
2be0 : a0 00 __ LDY #$00
2be2 : b1 4a __ LDA (T3 + 0),y 
2be4 : d0 1e __ BNE $2c04 ; (printf.s3 + 0)
.s4:
2be6 : a6 49 __ LDX T2 + 0 
2be8 : 9d be bf STA $bfbe,x ; (buff + 0)
2beb : 8a __ __ TXA
2bec : f0 0b __ BEQ $2bf9 ; (printf.s1001 + 0)
.s117:
2bee : a9 be __ LDA #$be
2bf0 : 85 0d __ STA P0 ; (fmt + 0)
2bf2 : a9 bf __ LDA #$bf
2bf4 : 85 0e __ STA P1 ; (fmt + 1)
2bf6 : 20 0a 2f JSR $2f0a ; (puts.s0 + 0)
.s1001:
2bf9 : a2 03 __ LDX #$03
2bfb : bd b2 bf LDA $bfb2,x ; (printf@stack + 0)
2bfe : 95 53 __ STA T8 + 0,x 
2c00 : ca __ __ DEX
2c01 : 10 f8 __ BPL $2bfb ; (printf.s1001 + 2)
2c03 : 60 __ __ RTS
.s3:
2c04 : c9 25 __ CMP #$25
2c06 : f0 28 __ BEQ $2c30 ; (printf.s5 + 0)
.s6:
2c08 : a6 49 __ LDX T2 + 0 
2c0a : 9d be bf STA $bfbe,x ; (buff + 0)
2c0d : e6 4a __ INC T3 + 0 
2c0f : d0 02 __ BNE $2c13 ; (printf.s1098 + 0)
.s1097:
2c11 : e6 4b __ INC T3 + 1 
.s1098:
2c13 : e8 __ __ INX
2c14 : 86 49 __ STX T2 + 0 
2c16 : e0 28 __ CPX #$28
2c18 : 90 c6 __ BCC $2be0 ; (printf.l2 + 0)
.s111:
2c1a : a9 be __ LDA #$be
2c1c : 85 0d __ STA P0 ; (fmt + 0)
2c1e : a9 bf __ LDA #$bf
2c20 : 85 0e __ STA P1 ; (fmt + 1)
2c22 : 98 __ __ TYA
2c23 : 9d be bf STA $bfbe,x ; (buff + 0)
2c26 : 20 0a 2f JSR $2f0a ; (puts.s0 + 0)
2c29 : a9 00 __ LDA #$00
.s1068:
2c2b : 85 49 __ STA T2 + 0 
2c2d : 4c e0 2b JMP $2be0 ; (printf.l2 + 0)
.s5:
2c30 : a5 49 __ LDA T2 + 0 
2c32 : f0 15 __ BEQ $2c49 ; (printf.s10 + 0)
.s8:
2c34 : a9 be __ LDA #$be
2c36 : 85 0d __ STA P0 ; (fmt + 0)
2c38 : a9 bf __ LDA #$bf
2c3a : 85 0e __ STA P1 ; (fmt + 1)
2c3c : 98 __ __ TYA
2c3d : a6 49 __ LDX T2 + 0 
2c3f : 9d be bf STA $bfbe,x ; (buff + 0)
2c42 : 20 0a 2f JSR $2f0a ; (puts.s0 + 0)
2c45 : a9 00 __ LDA #$00
2c47 : 85 49 __ STA T2 + 0 
.s10:
2c49 : a9 0a __ LDA #$0a
2c4b : 8d b9 bf STA $bfb9 ; (si + 3)
2c4e : a9 00 __ LDA #$00
2c50 : 8d ba bf STA $bfba ; (si + 4)
2c53 : 8d bb bf STA $bfbb ; (si + 5)
2c56 : 8d bc bf STA $bfbc ; (si + 6)
2c59 : 8d bd bf STA $bfbd ; (si + 7)
2c5c : a0 01 __ LDY #$01
2c5e : b1 4a __ LDA (T3 + 0),y 
2c60 : aa __ __ TAX
2c61 : a9 20 __ LDA #$20
2c63 : 8d b6 bf STA $bfb6 ; (si + 0)
2c66 : a9 00 __ LDA #$00
2c68 : 8d b7 bf STA $bfb7 ; (si + 1)
2c6b : a9 ff __ LDA #$ff
2c6d : 8d b8 bf STA $bfb8 ; (si + 2)
2c70 : 18 __ __ CLC
2c71 : a5 4a __ LDA T3 + 0 
2c73 : 69 02 __ ADC #$02
.l15:
2c75 : 85 4a __ STA T3 + 0 
2c77 : 90 02 __ BCC $2c7b ; (printf.s1080 + 0)
.s1079:
2c79 : e6 4b __ INC T3 + 1 
.s1080:
2c7b : 8a __ __ TXA
2c7c : e0 2b __ CPX #$2b
2c7e : d0 08 __ BNE $2c88 ; (printf.s18 + 0)
.s17:
2c80 : a9 01 __ LDA #$01
2c82 : 8d bb bf STA $bfbb ; (si + 5)
2c85 : 4c fd 2e JMP $2efd ; (printf.s246 + 0)
.s18:
2c88 : c9 30 __ CMP #$30
2c8a : d0 06 __ BNE $2c92 ; (printf.s21 + 0)
.s20:
2c8c : 8d b6 bf STA $bfb6 ; (si + 0)
2c8f : 4c fd 2e JMP $2efd ; (printf.s246 + 0)
.s21:
2c92 : e0 23 __ CPX #$23
2c94 : d0 08 __ BNE $2c9e ; (printf.s24 + 0)
.s23:
2c96 : a9 01 __ LDA #$01
2c98 : 8d bd bf STA $bfbd ; (si + 7)
2c9b : 4c fd 2e JMP $2efd ; (printf.s246 + 0)
.s24:
2c9e : e0 2d __ CPX #$2d
2ca0 : d0 08 __ BNE $2caa ; (printf.s16 + 0)
.s26:
2ca2 : a9 01 __ LDA #$01
2ca4 : 8d bc bf STA $bfbc ; (si + 6)
2ca7 : 4c fd 2e JMP $2efd ; (printf.s246 + 0)
.s16:
2caa : 85 4c __ STA T4 + 0 
2cac : e0 30 __ CPX #$30
2cae : 90 53 __ BCC $2d03 ; (printf.s32 + 0)
.s33:
2cb0 : e0 3a __ CPX #$3a
2cb2 : b0 4f __ BCS $2d03 ; (printf.s32 + 0)
.s30:
2cb4 : a9 00 __ LDA #$00
2cb6 : 85 4d __ STA T6 + 0 
2cb8 : 85 4e __ STA T6 + 1 
2cba : e0 3a __ CPX #$3a
2cbc : b0 40 __ BCS $2cfe ; (printf.s36 + 0)
.l35:
2cbe : a5 4d __ LDA T6 + 0 
2cc0 : 0a __ __ ASL
2cc1 : 85 1b __ STA ACCU + 0 
2cc3 : a5 4e __ LDA T6 + 1 
2cc5 : 2a __ __ ROL
2cc6 : 06 1b __ ASL ACCU + 0 
2cc8 : 2a __ __ ROL
2cc9 : aa __ __ TAX
2cca : 18 __ __ CLC
2ccb : a5 1b __ LDA ACCU + 0 
2ccd : 65 4d __ ADC T6 + 0 
2ccf : 85 4d __ STA T6 + 0 
2cd1 : 8a __ __ TXA
2cd2 : 65 4e __ ADC T6 + 1 
2cd4 : 06 4d __ ASL T6 + 0 
2cd6 : 2a __ __ ROL
2cd7 : aa __ __ TAX
2cd8 : 18 __ __ CLC
2cd9 : a5 4d __ LDA T6 + 0 
2cdb : 65 4c __ ADC T4 + 0 
2cdd : 90 01 __ BCC $2ce0 ; (printf.s1094 + 0)
.s1093:
2cdf : e8 __ __ INX
.s1094:
2ce0 : 38 __ __ SEC
2ce1 : e9 30 __ SBC #$30
2ce3 : 85 4d __ STA T6 + 0 
2ce5 : 8a __ __ TXA
2ce6 : e9 00 __ SBC #$00
2ce8 : 85 4e __ STA T6 + 1 
2cea : a0 00 __ LDY #$00
2cec : b1 4a __ LDA (T3 + 0),y 
2cee : 85 4c __ STA T4 + 0 
2cf0 : e6 4a __ INC T3 + 0 
2cf2 : d0 02 __ BNE $2cf6 ; (printf.s1096 + 0)
.s1095:
2cf4 : e6 4b __ INC T3 + 1 
.s1096:
2cf6 : c9 30 __ CMP #$30
2cf8 : 90 04 __ BCC $2cfe ; (printf.s36 + 0)
.s37:
2cfa : c9 3a __ CMP #$3a
2cfc : 90 c0 __ BCC $2cbe ; (printf.l35 + 0)
.s36:
2cfe : a5 4d __ LDA T6 + 0 
2d00 : 8d b7 bf STA $bfb7 ; (si + 1)
.s32:
2d03 : a5 4c __ LDA T4 + 0 
2d05 : c9 2e __ CMP #$2e
2d07 : d0 51 __ BNE $2d5a ; (printf.s40 + 0)
.s38:
2d09 : a9 00 __ LDA #$00
2d0b : 85 4d __ STA T6 + 0 
.l231:
2d0d : 85 4e __ STA T6 + 1 
2d0f : a0 00 __ LDY #$00
2d11 : b1 4a __ LDA (T3 + 0),y 
2d13 : 85 4c __ STA T4 + 0 
2d15 : e6 4a __ INC T3 + 0 
2d17 : d0 02 __ BNE $2d1b ; (printf.s1082 + 0)
.s1081:
2d19 : e6 4b __ INC T3 + 1 
.s1082:
2d1b : c9 30 __ CMP #$30
2d1d : 90 04 __ BCC $2d23 ; (printf.s43 + 0)
.s44:
2d1f : c9 3a __ CMP #$3a
2d21 : 90 0a __ BCC $2d2d ; (printf.s42 + 0)
.s43:
2d23 : a5 4d __ LDA T6 + 0 
2d25 : 8d b8 bf STA $bfb8 ; (si + 2)
2d28 : a5 4c __ LDA T4 + 0 
2d2a : 4c 5a 2d JMP $2d5a ; (printf.s40 + 0)
.s42:
2d2d : a5 4d __ LDA T6 + 0 
2d2f : 0a __ __ ASL
2d30 : 85 1b __ STA ACCU + 0 
2d32 : a5 4e __ LDA T6 + 1 
2d34 : 2a __ __ ROL
2d35 : 06 1b __ ASL ACCU + 0 
2d37 : 2a __ __ ROL
2d38 : aa __ __ TAX
2d39 : 18 __ __ CLC
2d3a : a5 1b __ LDA ACCU + 0 
2d3c : 65 4d __ ADC T6 + 0 
2d3e : 85 4d __ STA T6 + 0 
2d40 : 8a __ __ TXA
2d41 : 65 4e __ ADC T6 + 1 
2d43 : 06 4d __ ASL T6 + 0 
2d45 : 2a __ __ ROL
2d46 : aa __ __ TAX
2d47 : 18 __ __ CLC
2d48 : a5 4d __ LDA T6 + 0 
2d4a : 65 4c __ ADC T4 + 0 
2d4c : 90 01 __ BCC $2d4f ; (printf.s1092 + 0)
.s1091:
2d4e : e8 __ __ INX
.s1092:
2d4f : 38 __ __ SEC
2d50 : e9 30 __ SBC #$30
2d52 : 85 4d __ STA T6 + 0 
2d54 : 8a __ __ TXA
2d55 : e9 00 __ SBC #$00
2d57 : 4c 0d 2d JMP $2d0d ; (printf.l231 + 0)
.s40:
2d5a : c9 64 __ CMP #$64
2d5c : f0 04 __ BEQ $2d62 ; (printf.s45 + 0)
.s48:
2d5e : c9 44 __ CMP #$44
2d60 : d0 05 __ BNE $2d67 ; (printf.s46 + 0)
.s45:
2d62 : a9 01 __ LDA #$01
2d64 : 4c d6 2e JMP $2ed6 ; (printf.s247 + 0)
.s46:
2d67 : c9 75 __ CMP #$75
2d69 : d0 03 __ BNE $2d6e ; (printf.s52 + 0)
2d6b : 4c d4 2e JMP $2ed4 ; (printf.s269 + 0)
.s52:
2d6e : c9 55 __ CMP #$55
2d70 : d0 03 __ BNE $2d75 ; (printf.s50 + 0)
2d72 : 4c d4 2e JMP $2ed4 ; (printf.s269 + 0)
.s50:
2d75 : c9 78 __ CMP #$78
2d77 : f0 04 __ BEQ $2d7d ; (printf.s53 + 0)
.s56:
2d79 : c9 58 __ CMP #$58
2d7b : d0 0d __ BNE $2d8a ; (printf.s54 + 0)
.s53:
2d7d : a9 10 __ LDA #$10
2d7f : 8d b9 bf STA $bfb9 ; (si + 3)
2d82 : a9 00 __ LDA #$00
2d84 : 8d ba bf STA $bfba ; (si + 4)
2d87 : 4c d4 2e JMP $2ed4 ; (printf.s269 + 0)
.s54:
2d8a : c9 6c __ CMP #$6c
2d8c : d0 03 __ BNE $2d91 ; (printf.s60 + 0)
2d8e : 4c 66 2e JMP $2e66 ; (printf.s57 + 0)
.s60:
2d91 : c9 4c __ CMP #$4c
2d93 : d0 03 __ BNE $2d98 ; (printf.s58 + 0)
2d95 : 4c 66 2e JMP $2e66 ; (printf.s57 + 0)
.s58:
2d98 : c9 73 __ CMP #$73
2d9a : f0 39 __ BEQ $2dd5 ; (printf.s73 + 0)
.s76:
2d9c : c9 53 __ CMP #$53
2d9e : f0 35 __ BEQ $2dd5 ; (printf.s73 + 0)
.s74:
2da0 : c9 63 __ CMP #$63
2da2 : f0 15 __ BEQ $2db9 ; (printf.s104 + 0)
.s107:
2da4 : c9 43 __ CMP #$43
2da6 : f0 11 __ BEQ $2db9 ; (printf.s104 + 0)
.s105:
2da8 : 09 00 __ ORA #$00
2daa : d0 03 __ BNE $2daf ; (printf.s108 + 0)
2dac : 4c e0 2b JMP $2be0 ; (printf.l2 + 0)
.s108:
2daf : a6 49 __ LDX T2 + 0 
2db1 : 9d be bf STA $bfbe,x ; (buff + 0)
2db4 : e6 49 __ INC T2 + 0 
2db6 : 4c e0 2b JMP $2be0 ; (printf.l2 + 0)
.s104:
2db9 : a0 00 __ LDY #$00
2dbb : b1 47 __ LDA (T0 + 0),y 
2dbd : a6 49 __ LDX T2 + 0 
2dbf : 9d be bf STA $bfbe,x ; (buff + 0)
2dc2 : e6 49 __ INC T2 + 0 
.s244:
2dc4 : 18 __ __ CLC
2dc5 : a5 47 __ LDA T0 + 0 
2dc7 : 69 02 __ ADC #$02
2dc9 : 85 47 __ STA T0 + 0 
2dcb : b0 03 __ BCS $2dd0 ; (printf.s1083 + 0)
2dcd : 4c e0 2b JMP $2be0 ; (printf.l2 + 0)
.s1083:
2dd0 : e6 48 __ INC T0 + 1 
2dd2 : 4c e0 2b JMP $2be0 ; (printf.l2 + 0)
.s73:
2dd5 : a0 00 __ LDY #$00
2dd7 : 84 4c __ STY T4 + 0 
2dd9 : b1 47 __ LDA (T0 + 0),y 
2ddb : 85 4d __ STA T6 + 0 
2ddd : c8 __ __ INY
2dde : b1 47 __ LDA (T0 + 0),y 
2de0 : 85 4e __ STA T6 + 1 
2de2 : 18 __ __ CLC
2de3 : a5 47 __ LDA T0 + 0 
2de5 : 69 02 __ ADC #$02
2de7 : 85 47 __ STA T0 + 0 
2de9 : 90 02 __ BCC $2ded ; (printf.s1090 + 0)
.s1089:
2deb : e6 48 __ INC T0 + 1 
.s1090:
2ded : ad b7 bf LDA $bfb7 ; (si + 1)
2df0 : f0 0d __ BEQ $2dff ; (printf.s79 + 0)
.s1071:
2df2 : a0 00 __ LDY #$00
2df4 : b1 4d __ LDA (T6 + 0),y 
2df6 : f0 05 __ BEQ $2dfd ; (printf.s1072 + 0)
.l81:
2df8 : c8 __ __ INY
2df9 : b1 4d __ LDA (T6 + 0),y 
2dfb : d0 fb __ BNE $2df8 ; (printf.l81 + 0)
.s1072:
2dfd : 84 4c __ STY T4 + 0 
.s79:
2dff : ad bc bf LDA $bfbc ; (si + 6)
2e02 : d0 1a __ BNE $2e1e ; (printf.s85 + 0)
.s1075:
2e04 : a4 4c __ LDY T4 + 0 
2e06 : cc b7 bf CPY $bfb7 ; (si + 1)
2e09 : a6 49 __ LDX T2 + 0 
2e0b : b0 0d __ BCS $2e1a ; (printf.s1076 + 0)
.l87:
2e0d : ad b6 bf LDA $bfb6 ; (si + 0)
2e10 : 9d be bf STA $bfbe,x ; (buff + 0)
2e13 : c8 __ __ INY
2e14 : cc b7 bf CPY $bfb7 ; (si + 1)
2e17 : e8 __ __ INX
2e18 : 90 f3 __ BCC $2e0d ; (printf.l87 + 0)
.s1076:
2e1a : 86 49 __ STX T2 + 0 
2e1c : 84 4c __ STY T4 + 0 
.s85:
2e1e : a5 49 __ LDA T2 + 0 
2e20 : f0 16 __ BEQ $2e38 ; (printf.s238 + 0)
.s92:
2e22 : a9 be __ LDA #$be
2e24 : 85 0d __ STA P0 ; (fmt + 0)
2e26 : a9 bf __ LDA #$bf
2e28 : 85 0e __ STA P1 ; (fmt + 1)
2e2a : a9 00 __ LDA #$00
2e2c : a6 49 __ LDX T2 + 0 
2e2e : 9d be bf STA $bfbe,x ; (buff + 0)
2e31 : 20 0a 2f JSR $2f0a ; (puts.s0 + 0)
2e34 : a9 00 __ LDA #$00
2e36 : 85 49 __ STA T2 + 0 
.s238:
2e38 : a5 4d __ LDA T6 + 0 
2e3a : 85 0d __ STA P0 ; (fmt + 0)
2e3c : a5 4e __ LDA T6 + 1 
2e3e : 85 0e __ STA P1 ; (fmt + 1)
2e40 : 20 0a 2f JSR $2f0a ; (puts.s0 + 0)
2e43 : ad bc bf LDA $bfbc ; (si + 6)
2e46 : d0 03 __ BNE $2e4b ; (printf.s1073 + 0)
2e48 : 4c e0 2b JMP $2be0 ; (printf.l2 + 0)
.s1073:
2e4b : a4 4c __ LDY T4 + 0 
2e4d : cc b7 bf CPY $bfb7 ; (si + 1)
2e50 : a2 00 __ LDX #$00
2e52 : b0 0d __ BCS $2e61 ; (printf.s1074 + 0)
.l102:
2e54 : ad b6 bf LDA $bfb6 ; (si + 0)
2e57 : 9d be bf STA $bfbe,x ; (buff + 0)
2e5a : c8 __ __ INY
2e5b : cc b7 bf CPY $bfb7 ; (si + 1)
2e5e : e8 __ __ INX
2e5f : 90 f3 __ BCC $2e54 ; (printf.l102 + 0)
.s1074:
2e61 : 86 49 __ STX T2 + 0 
2e63 : 4c e0 2b JMP $2be0 ; (printf.l2 + 0)
.s57:
2e66 : a0 00 __ LDY #$00
2e68 : b1 47 __ LDA (T0 + 0),y 
2e6a : 85 53 __ STA T8 + 0 
2e6c : c8 __ __ INY
2e6d : b1 47 __ LDA (T0 + 0),y 
2e6f : 85 54 __ STA T8 + 1 
2e71 : c8 __ __ INY
2e72 : b1 47 __ LDA (T0 + 0),y 
2e74 : 85 55 __ STA T8 + 2 
2e76 : c8 __ __ INY
2e77 : b1 47 __ LDA (T0 + 0),y 
2e79 : 85 56 __ STA T8 + 3 
2e7b : 18 __ __ CLC
2e7c : a5 47 __ LDA T0 + 0 
2e7e : 69 04 __ ADC #$04
2e80 : 85 47 __ STA T0 + 0 
2e82 : 90 02 __ BCC $2e86 ; (printf.s1086 + 0)
.s1085:
2e84 : e6 48 __ INC T0 + 1 
.s1086:
2e86 : a0 00 __ LDY #$00
2e88 : b1 4a __ LDA (T3 + 0),y 
2e8a : aa __ __ TAX
2e8b : e6 4a __ INC T3 + 0 
2e8d : d0 02 __ BNE $2e91 ; (printf.s1088 + 0)
.s1087:
2e8f : e6 4b __ INC T3 + 1 
.s1088:
2e91 : 8a __ __ TXA
2e92 : e0 64 __ CPX #$64
2e94 : f0 04 __ BEQ $2e9a ; (printf.s61 + 0)
.s64:
2e96 : c9 44 __ CMP #$44
2e98 : d0 04 __ BNE $2e9e ; (printf.s62 + 0)
.s61:
2e9a : a9 01 __ LDA #$01
2e9c : d0 1c __ BNE $2eba ; (printf.s245 + 0)
.s62:
2e9e : c9 75 __ CMP #$75
2ea0 : f0 17 __ BEQ $2eb9 ; (printf.s268 + 0)
.s68:
2ea2 : c9 55 __ CMP #$55
2ea4 : f0 13 __ BEQ $2eb9 ; (printf.s268 + 0)
.s66:
2ea6 : c9 78 __ CMP #$78
2ea8 : f0 07 __ BEQ $2eb1 ; (printf.s69 + 0)
.s72:
2eaa : c9 58 __ CMP #$58
2eac : f0 03 __ BEQ $2eb1 ; (printf.s69 + 0)
2eae : 4c e0 2b JMP $2be0 ; (printf.l2 + 0)
.s69:
2eb1 : 8c ba bf STY $bfba ; (si + 4)
2eb4 : a9 10 __ LDA #$10
2eb6 : 8d b9 bf STA $bfb9 ; (si + 3)
.s268:
2eb9 : 98 __ __ TYA
.s245:
2eba : 85 15 __ STA P8 
2ebc : a9 be __ LDA #$be
2ebe : 85 0f __ STA P2 ; (fmt + 2)
2ec0 : a9 bf __ LDA #$bf
2ec2 : 85 10 __ STA P3 ; (fmt + 3)
2ec4 : a9 b6 __ LDA #$b6
2ec6 : 85 0d __ STA P0 ; (fmt + 0)
2ec8 : a9 bf __ LDA #$bf
2eca : 85 0e __ STA P1 ; (fmt + 1)
2ecc : 20 94 30 JSR $3094 ; (nforml@proxy + 0)
2ecf : a5 1b __ LDA ACCU + 0 
2ed1 : 4c 2b 2c JMP $2c2b ; (printf.s1068 + 0)
.s269:
2ed4 : a9 00 __ LDA #$00
.s247:
2ed6 : 85 13 __ STA P6 
2ed8 : a9 be __ LDA #$be
2eda : 85 0f __ STA P2 ; (fmt + 2)
2edc : a9 bf __ LDA #$bf
2ede : 85 10 __ STA P3 ; (fmt + 3)
2ee0 : a0 00 __ LDY #$00
2ee2 : b1 47 __ LDA (T0 + 0),y 
2ee4 : 85 11 __ STA P4 
2ee6 : c8 __ __ INY
2ee7 : b1 47 __ LDA (T0 + 0),y 
2ee9 : 85 12 __ STA P5 
2eeb : a9 b6 __ LDA #$b6
2eed : 85 0d __ STA P0 ; (fmt + 0)
2eef : a9 bf __ LDA #$bf
2ef1 : 85 0e __ STA P1 ; (fmt + 1)
2ef3 : 20 5f 2f JSR $2f5f ; (nformi.s0 + 0)
2ef6 : a5 1b __ LDA ACCU + 0 
2ef8 : 85 49 __ STA T2 + 0 
2efa : 4c c4 2d JMP $2dc4 ; (printf.s244 + 0)
.s246:
2efd : a0 00 __ LDY #$00
2eff : b1 4a __ LDA (T3 + 0),y 
2f01 : aa __ __ TAX
2f02 : 18 __ __ CLC
2f03 : a5 4a __ LDA T3 + 0 
2f05 : 69 01 __ ADC #$01
2f07 : 4c 75 2c JMP $2c75 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
2f0a : a0 00 __ LDY #$00
2f0c : b1 0d __ LDA (P0),y 
2f0e : f0 0b __ BEQ $2f1b ; (puts.s1001 + 0)
2f10 : 20 1c 2f JSR $2f1c ; (putpch + 0)
2f13 : e6 0d __ INC P0 
2f15 : d0 f3 __ BNE $2f0a ; (puts.s0 + 0)
2f17 : e6 0e __ INC P1 
2f19 : d0 ef __ BNE $2f0a ; (puts.s0 + 0)
.s1001:
2f1b : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
2f1c : ae ec 3b LDX $3bec ; (giocharmap + 0)
2f1f : e0 01 __ CPX #$01
2f21 : 90 26 __ BCC $2f49 ; (putpch + 45)
2f23 : c9 0a __ CMP #$0a
2f25 : d0 02 __ BNE $2f29 ; (putpch + 13)
2f27 : a9 0d __ LDA #$0d
2f29 : c9 09 __ CMP #$09
2f2b : f0 1f __ BEQ $2f4c ; (putpch + 48)
2f2d : e0 02 __ CPX #$02
2f2f : 90 18 __ BCC $2f49 ; (putpch + 45)
2f31 : c9 41 __ CMP #$41
2f33 : 90 14 __ BCC $2f49 ; (putpch + 45)
2f35 : c9 7b __ CMP #$7b
2f37 : b0 10 __ BCS $2f49 ; (putpch + 45)
2f39 : c9 61 __ CMP #$61
2f3b : b0 04 __ BCS $2f41 ; (putpch + 37)
2f3d : c9 5b __ CMP #$5b
2f3f : b0 08 __ BCS $2f49 ; (putpch + 45)
2f41 : 49 20 __ EOR #$20
2f43 : e0 03 __ CPX #$03
2f45 : f0 02 __ BEQ $2f49 ; (putpch + 45)
2f47 : 29 df __ AND #$df
2f49 : 4c d2 ff JMP $ffd2 
2f4c : 38 __ __ SEC
2f4d : 20 f0 ff JSR $fff0 
2f50 : 98 __ __ TYA
2f51 : 29 03 __ AND #$03
2f53 : 49 03 __ EOR #$03
2f55 : aa __ __ TAX
2f56 : a9 20 __ LDA #$20
2f58 : 20 d2 ff JSR $ffd2 
2f5b : ca __ __ DEX
2f5c : 10 fa __ BPL $2f58 ; (putpch + 60)
2f5e : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
2f5f : a9 00 __ LDA #$00
2f61 : 85 43 __ STA T0 + 0 
2f63 : a5 13 __ LDA P6 ; (s + 0)
2f65 : f0 13 __ BEQ $2f7a ; (nformi.s182 + 0)
.s4:
2f67 : 24 12 __ BIT P5 ; (v + 1)
2f69 : 10 0f __ BPL $2f7a ; (nformi.s182 + 0)
.s1:
2f6b : 38 __ __ SEC
2f6c : a9 00 __ LDA #$00
2f6e : e5 11 __ SBC P4 ; (v + 0)
2f70 : 85 11 __ STA P4 ; (v + 0)
2f72 : a9 00 __ LDA #$00
2f74 : e5 12 __ SBC P5 ; (v + 1)
2f76 : 85 12 __ STA P5 ; (v + 1)
2f78 : e6 43 __ INC T0 + 0 
.s182:
2f7a : a9 10 __ LDA #$10
2f7c : 85 44 __ STA T2 + 0 
2f7e : a5 11 __ LDA P4 ; (v + 0)
2f80 : 05 12 __ ORA P5 ; (v + 1)
2f82 : f0 46 __ BEQ $2fca ; (nformi.s7 + 0)
.s42:
2f84 : a0 03 __ LDY #$03
2f86 : b1 0d __ LDA (P0),y ; (si + 0)
2f88 : 85 45 __ STA T4 + 0 
2f8a : c8 __ __ INY
2f8b : b1 0d __ LDA (P0),y ; (si + 0)
2f8d : 85 46 __ STA T4 + 1 
.l6:
2f8f : a5 11 __ LDA P4 ; (v + 0)
2f91 : 85 1b __ STA ACCU + 0 
2f93 : a5 12 __ LDA P5 ; (v + 1)
2f95 : 85 1c __ STA ACCU + 1 
2f97 : a5 45 __ LDA T4 + 0 
2f99 : 85 03 __ STA WORK + 0 
2f9b : a5 46 __ LDA T4 + 1 
2f9d : 85 04 __ STA WORK + 1 
2f9f : 20 d0 3a JSR $3ad0 ; (divmod + 0)
2fa2 : a5 06 __ LDA WORK + 3 
2fa4 : 30 08 __ BMI $2fae ; (nformi.s78 + 0)
.s1019:
2fa6 : d0 0a __ BNE $2fb2 ; (nformi.s77 + 0)
.s1018:
2fa8 : a5 05 __ LDA WORK + 2 
2faa : c9 0a __ CMP #$0a
2fac : b0 04 __ BCS $2fb2 ; (nformi.s77 + 0)
.s78:
2fae : a9 30 __ LDA #$30
2fb0 : d0 02 __ BNE $2fb4 ; (nformi.s79 + 0)
.s77:
2fb2 : a9 37 __ LDA #$37
.s79:
2fb4 : 18 __ __ CLC
2fb5 : 65 05 __ ADC WORK + 2 
2fb7 : c6 44 __ DEC T2 + 0 
2fb9 : a6 44 __ LDX T2 + 0 
2fbb : 9d f0 bf STA $bff0,x ; (buffer + 0)
2fbe : a5 1b __ LDA ACCU + 0 
2fc0 : 85 11 __ STA P4 ; (v + 0)
2fc2 : a5 1c __ LDA ACCU + 1 
2fc4 : 85 12 __ STA P5 ; (v + 1)
2fc6 : 05 11 __ ORA P4 ; (v + 0)
2fc8 : d0 c5 __ BNE $2f8f ; (nformi.l6 + 0)
.s7:
2fca : a0 02 __ LDY #$02
2fcc : b1 0d __ LDA (P0),y ; (si + 0)
2fce : c9 ff __ CMP #$ff
2fd0 : d0 04 __ BNE $2fd6 ; (nformi.s80 + 0)
.s81:
2fd2 : a9 0f __ LDA #$0f
2fd4 : d0 05 __ BNE $2fdb ; (nformi.s1026 + 0)
.s80:
2fd6 : 38 __ __ SEC
2fd7 : a9 10 __ LDA #$10
2fd9 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
2fdb : a8 __ __ TAY
2fdc : c4 44 __ CPY T2 + 0 
2fde : b0 0d __ BCS $2fed ; (nformi.s10 + 0)
.s9:
2fe0 : a9 30 __ LDA #$30
.l1027:
2fe2 : c6 44 __ DEC T2 + 0 
2fe4 : a6 44 __ LDX T2 + 0 
2fe6 : 9d f0 bf STA $bff0,x ; (buffer + 0)
2fe9 : c4 44 __ CPY T2 + 0 
2feb : 90 f5 __ BCC $2fe2 ; (nformi.l1027 + 0)
.s10:
2fed : a0 07 __ LDY #$07
2fef : b1 0d __ LDA (P0),y ; (si + 0)
2ff1 : f0 20 __ BEQ $3013 ; (nformi.s13 + 0)
.s14:
2ff3 : a0 04 __ LDY #$04
2ff5 : b1 0d __ LDA (P0),y ; (si + 0)
2ff7 : d0 1a __ BNE $3013 ; (nformi.s13 + 0)
.s1013:
2ff9 : 88 __ __ DEY
2ffa : b1 0d __ LDA (P0),y ; (si + 0)
2ffc : c9 10 __ CMP #$10
2ffe : d0 13 __ BNE $3013 ; (nformi.s13 + 0)
.s11:
3000 : a9 58 __ LDA #$58
3002 : a6 44 __ LDX T2 + 0 
3004 : 9d ef bf STA $bfef,x ; (buff + 49)
3007 : 8a __ __ TXA
3008 : 18 __ __ CLC
3009 : 69 fe __ ADC #$fe
300b : 85 44 __ STA T2 + 0 
300d : aa __ __ TAX
300e : a9 30 __ LDA #$30
3010 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
3013 : a9 00 __ LDA #$00
3015 : 85 1b __ STA ACCU + 0 
3017 : a5 43 __ LDA T0 + 0 
3019 : f0 06 __ BEQ $3021 ; (nformi.s16 + 0)
.s15:
301b : c6 44 __ DEC T2 + 0 
301d : a9 2d __ LDA #$2d
301f : d0 0a __ BNE $302b ; (nformi.s1025 + 0)
.s16:
3021 : a0 05 __ LDY #$05
3023 : b1 0d __ LDA (P0),y ; (si + 0)
3025 : f0 09 __ BEQ $3030 ; (nformi.s163 + 0)
.s18:
3027 : c6 44 __ DEC T2 + 0 
3029 : a9 2b __ LDA #$2b
.s1025:
302b : a6 44 __ LDX T2 + 0 
302d : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
3030 : a0 06 __ LDY #$06
3032 : b1 0d __ LDA (P0),y ; (si + 0)
3034 : d0 33 __ BNE $3069 ; (nformi.s24 + 0)
.l30:
3036 : a0 01 __ LDY #$01
3038 : b1 0d __ LDA (P0),y ; (si + 0)
303a : 18 __ __ CLC
303b : 65 44 __ ADC T2 + 0 
303d : b0 04 __ BCS $3043 ; (nformi.s31 + 0)
.s1006:
303f : c9 11 __ CMP #$11
3041 : 90 0d __ BCC $3050 ; (nformi.s33 + 0)
.s31:
3043 : c6 44 __ DEC T2 + 0 
3045 : a0 00 __ LDY #$00
3047 : b1 0d __ LDA (P0),y ; (si + 0)
3049 : a6 44 __ LDX T2 + 0 
304b : 9d f0 bf STA $bff0,x ; (buffer + 0)
304e : b0 e6 __ BCS $3036 ; (nformi.l30 + 0)
.s33:
3050 : a6 44 __ LDX T2 + 0 
3052 : e0 10 __ CPX #$10
3054 : b0 0e __ BCS $3064 ; (nformi.s23 + 0)
.s34:
3056 : 88 __ __ DEY
.l1022:
3057 : bd f0 bf LDA $bff0,x ; (buffer + 0)
305a : 91 0f __ STA (P2),y ; (str + 0)
305c : e8 __ __ INX
305d : e0 10 __ CPX #$10
305f : c8 __ __ INY
3060 : 90 f5 __ BCC $3057 ; (nformi.l1022 + 0)
.s1023:
3062 : 84 1b __ STY ACCU + 0 
.s23:
3064 : a9 00 __ LDA #$00
3066 : 85 1c __ STA ACCU + 1 
.s1001:
3068 : 60 __ __ RTS
.s24:
3069 : a6 44 __ LDX T2 + 0 
306b : e0 10 __ CPX #$10
306d : b0 1a __ BCS $3089 ; (nformi.l27 + 0)
.s25:
306f : a0 00 __ LDY #$00
.l1020:
3071 : bd f0 bf LDA $bff0,x ; (buffer + 0)
3074 : 91 0f __ STA (P2),y ; (str + 0)
3076 : e8 __ __ INX
3077 : e0 10 __ CPX #$10
3079 : c8 __ __ INY
307a : 90 f5 __ BCC $3071 ; (nformi.l1020 + 0)
.s1021:
307c : 84 1b __ STY ACCU + 0 
307e : b0 09 __ BCS $3089 ; (nformi.l27 + 0)
.s28:
3080 : 88 __ __ DEY
3081 : b1 0d __ LDA (P0),y ; (si + 0)
3083 : a4 1b __ LDY ACCU + 0 
3085 : 91 0f __ STA (P2),y ; (str + 0)
3087 : e6 1b __ INC ACCU + 0 
.l27:
3089 : a5 1b __ LDA ACCU + 0 
308b : a0 01 __ LDY #$01
308d : d1 0d __ CMP (P0),y ; (si + 0)
308f : 90 ef __ BCC $3080 ; (nformi.s28 + 0)
3091 : 4c 64 30 JMP $3064 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml@proxy: ; nforml@proxy
3094 : a5 53 __ LDA $53 
3096 : 85 11 __ STA P4 
3098 : a5 54 __ LDA $54 
309a : 85 12 __ STA P5 
309c : a5 55 __ LDA $55 
309e : 85 13 __ STA P6 
30a0 : a5 56 __ LDA $56 
30a2 : 85 14 __ STA P7 
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
30a4 : a9 00 __ LDA #$00
30a6 : 85 43 __ STA T0 + 0 
30a8 : a5 15 __ LDA P8 ; (s + 0)
30aa : f0 21 __ BEQ $30cd ; (nforml.s182 + 0)
.s4:
30ac : a5 14 __ LDA P7 ; (v + 3)
30ae : f0 1d __ BEQ $30cd ; (nforml.s182 + 0)
.s1032:
30b0 : 10 1b __ BPL $30cd ; (nforml.s182 + 0)
.s1:
30b2 : 38 __ __ SEC
30b3 : a9 00 __ LDA #$00
30b5 : e5 11 __ SBC P4 ; (v + 0)
30b7 : 85 11 __ STA P4 ; (v + 0)
30b9 : a9 00 __ LDA #$00
30bb : e5 12 __ SBC P5 ; (v + 1)
30bd : 85 12 __ STA P5 ; (v + 1)
30bf : a9 00 __ LDA #$00
30c1 : e5 13 __ SBC P6 ; (v + 2)
30c3 : 85 13 __ STA P6 ; (v + 2)
30c5 : a9 00 __ LDA #$00
30c7 : e5 14 __ SBC P7 ; (v + 3)
30c9 : 85 14 __ STA P7 ; (v + 3)
30cb : e6 43 __ INC T0 + 0 
.s182:
30cd : a9 10 __ LDA #$10
30cf : 85 44 __ STA T2 + 0 
30d1 : a5 14 __ LDA P7 ; (v + 3)
30d3 : d0 0c __ BNE $30e1 ; (nforml.s42 + 0)
.s1024:
30d5 : a5 13 __ LDA P6 ; (v + 2)
30d7 : d0 08 __ BNE $30e1 ; (nforml.s42 + 0)
.s1025:
30d9 : a5 12 __ LDA P5 ; (v + 1)
30db : d0 04 __ BNE $30e1 ; (nforml.s42 + 0)
.s1026:
30dd : c5 11 __ CMP P4 ; (v + 0)
30df : b0 0e __ BCS $30ef ; (nforml.s7 + 0)
.s42:
30e1 : a0 03 __ LDY #$03
30e3 : b1 0d __ LDA (P0),y ; (si + 0)
30e5 : 85 45 __ STA T5 + 0 
30e7 : c8 __ __ INY
30e8 : b1 0d __ LDA (P0),y ; (si + 0)
30ea : 85 46 __ STA T5 + 1 
30ec : 4c b9 31 JMP $31b9 ; (nforml.l6 + 0)
.s7:
30ef : a0 02 __ LDY #$02
30f1 : b1 0d __ LDA (P0),y ; (si + 0)
30f3 : c9 ff __ CMP #$ff
30f5 : d0 04 __ BNE $30fb ; (nforml.s80 + 0)
.s81:
30f7 : a9 0f __ LDA #$0f
30f9 : d0 05 __ BNE $3100 ; (nforml.s1039 + 0)
.s80:
30fb : 38 __ __ SEC
30fc : a9 10 __ LDA #$10
30fe : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
3100 : a8 __ __ TAY
3101 : c4 44 __ CPY T2 + 0 
3103 : b0 0d __ BCS $3112 ; (nforml.s10 + 0)
.s9:
3105 : a9 30 __ LDA #$30
.l1040:
3107 : c6 44 __ DEC T2 + 0 
3109 : a6 44 __ LDX T2 + 0 
310b : 9d f0 bf STA $bff0,x ; (buffer + 0)
310e : c4 44 __ CPY T2 + 0 
3110 : 90 f5 __ BCC $3107 ; (nforml.l1040 + 0)
.s10:
3112 : a0 07 __ LDY #$07
3114 : b1 0d __ LDA (P0),y ; (si + 0)
3116 : f0 20 __ BEQ $3138 ; (nforml.s13 + 0)
.s14:
3118 : a0 04 __ LDY #$04
311a : b1 0d __ LDA (P0),y ; (si + 0)
311c : d0 1a __ BNE $3138 ; (nforml.s13 + 0)
.s1013:
311e : 88 __ __ DEY
311f : b1 0d __ LDA (P0),y ; (si + 0)
3121 : c9 10 __ CMP #$10
3123 : d0 13 __ BNE $3138 ; (nforml.s13 + 0)
.s11:
3125 : a9 58 __ LDA #$58
3127 : a6 44 __ LDX T2 + 0 
3129 : 9d ef bf STA $bfef,x ; (buff + 49)
312c : 8a __ __ TXA
312d : 18 __ __ CLC
312e : 69 fe __ ADC #$fe
3130 : 85 44 __ STA T2 + 0 
3132 : aa __ __ TAX
3133 : a9 30 __ LDA #$30
3135 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
3138 : a9 00 __ LDA #$00
313a : 85 1b __ STA ACCU + 0 
313c : a5 43 __ LDA T0 + 0 
313e : f0 06 __ BEQ $3146 ; (nforml.s16 + 0)
.s15:
3140 : c6 44 __ DEC T2 + 0 
3142 : a9 2d __ LDA #$2d
3144 : d0 0a __ BNE $3150 ; (nforml.s1038 + 0)
.s16:
3146 : a0 05 __ LDY #$05
3148 : b1 0d __ LDA (P0),y ; (si + 0)
314a : f0 09 __ BEQ $3155 ; (nforml.s163 + 0)
.s18:
314c : c6 44 __ DEC T2 + 0 
314e : a9 2b __ LDA #$2b
.s1038:
3150 : a6 44 __ LDX T2 + 0 
3152 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
3155 : a0 06 __ LDY #$06
3157 : b1 0d __ LDA (P0),y ; (si + 0)
3159 : d0 33 __ BNE $318e ; (nforml.s24 + 0)
.l30:
315b : a0 01 __ LDY #$01
315d : b1 0d __ LDA (P0),y ; (si + 0)
315f : 18 __ __ CLC
3160 : 65 44 __ ADC T2 + 0 
3162 : b0 04 __ BCS $3168 ; (nforml.s31 + 0)
.s1006:
3164 : c9 11 __ CMP #$11
3166 : 90 0d __ BCC $3175 ; (nforml.s33 + 0)
.s31:
3168 : c6 44 __ DEC T2 + 0 
316a : a0 00 __ LDY #$00
316c : b1 0d __ LDA (P0),y ; (si + 0)
316e : a6 44 __ LDX T2 + 0 
3170 : 9d f0 bf STA $bff0,x ; (buffer + 0)
3173 : b0 e6 __ BCS $315b ; (nforml.l30 + 0)
.s33:
3175 : a6 44 __ LDX T2 + 0 
3177 : e0 10 __ CPX #$10
3179 : b0 0e __ BCS $3189 ; (nforml.s23 + 0)
.s34:
317b : 88 __ __ DEY
.l1035:
317c : bd f0 bf LDA $bff0,x ; (buffer + 0)
317f : 91 0f __ STA (P2),y ; (str + 0)
3181 : e8 __ __ INX
3182 : e0 10 __ CPX #$10
3184 : c8 __ __ INY
3185 : 90 f5 __ BCC $317c ; (nforml.l1035 + 0)
.s1036:
3187 : 84 1b __ STY ACCU + 0 
.s23:
3189 : a9 00 __ LDA #$00
318b : 85 1c __ STA ACCU + 1 
.s1001:
318d : 60 __ __ RTS
.s24:
318e : a6 44 __ LDX T2 + 0 
3190 : e0 10 __ CPX #$10
3192 : b0 1a __ BCS $31ae ; (nforml.l27 + 0)
.s25:
3194 : a0 00 __ LDY #$00
.l1033:
3196 : bd f0 bf LDA $bff0,x ; (buffer + 0)
3199 : 91 0f __ STA (P2),y ; (str + 0)
319b : e8 __ __ INX
319c : e0 10 __ CPX #$10
319e : c8 __ __ INY
319f : 90 f5 __ BCC $3196 ; (nforml.l1033 + 0)
.s1034:
31a1 : 84 1b __ STY ACCU + 0 
31a3 : b0 09 __ BCS $31ae ; (nforml.l27 + 0)
.s28:
31a5 : 88 __ __ DEY
31a6 : b1 0d __ LDA (P0),y ; (si + 0)
31a8 : a4 1b __ LDY ACCU + 0 
31aa : 91 0f __ STA (P2),y ; (str + 0)
31ac : e6 1b __ INC ACCU + 0 
.l27:
31ae : a5 1b __ LDA ACCU + 0 
31b0 : a0 01 __ LDY #$01
31b2 : d1 0d __ CMP (P0),y ; (si + 0)
31b4 : 90 ef __ BCC $31a5 ; (nforml.s28 + 0)
31b6 : 4c 89 31 JMP $3189 ; (nforml.s23 + 0)
.l6:
31b9 : a5 11 __ LDA P4 ; (v + 0)
31bb : 85 1b __ STA ACCU + 0 
31bd : a5 12 __ LDA P5 ; (v + 1)
31bf : 85 1c __ STA ACCU + 1 
31c1 : a5 13 __ LDA P6 ; (v + 2)
31c3 : 85 1d __ STA ACCU + 2 
31c5 : a5 14 __ LDA P7 ; (v + 3)
31c7 : 85 1e __ STA ACCU + 3 
31c9 : a5 45 __ LDA T5 + 0 
31cb : 85 03 __ STA WORK + 0 
31cd : a5 46 __ LDA T5 + 1 
31cf : 85 04 __ STA WORK + 1 
31d1 : a9 00 __ LDA #$00
31d3 : 85 05 __ STA WORK + 2 
31d5 : 85 06 __ STA WORK + 3 
31d7 : 20 55 3b JSR $3b55 ; (divmod32 + 0)
31da : a5 08 __ LDA WORK + 5 
31dc : 30 08 __ BMI $31e6 ; (nforml.s78 + 0)
.s1023:
31de : d0 0a __ BNE $31ea ; (nforml.s77 + 0)
.s1022:
31e0 : a5 07 __ LDA WORK + 4 
31e2 : c9 0a __ CMP #$0a
31e4 : b0 04 __ BCS $31ea ; (nforml.s77 + 0)
.s78:
31e6 : a9 30 __ LDA #$30
31e8 : d0 02 __ BNE $31ec ; (nforml.s79 + 0)
.s77:
31ea : a9 37 __ LDA #$37
.s79:
31ec : 18 __ __ CLC
31ed : 65 07 __ ADC WORK + 4 
31ef : c6 44 __ DEC T2 + 0 
31f1 : a6 44 __ LDX T2 + 0 
31f3 : 9d f0 bf STA $bff0,x ; (buffer + 0)
31f6 : a5 1b __ LDA ACCU + 0 
31f8 : 85 11 __ STA P4 ; (v + 0)
31fa : a5 1c __ LDA ACCU + 1 
31fc : 85 12 __ STA P5 ; (v + 1)
31fe : a5 1d __ LDA ACCU + 2 
3200 : 85 13 __ STA P6 ; (v + 2)
3202 : a5 1e __ LDA ACCU + 3 
3204 : 85 14 __ STA P7 ; (v + 3)
3206 : d0 b1 __ BNE $31b9 ; (nforml.l6 + 0)
.s1018:
3208 : a5 13 __ LDA P6 ; (v + 2)
320a : d0 ad __ BNE $31b9 ; (nforml.l6 + 0)
.s1019:
320c : a5 12 __ LDA P5 ; (v + 1)
320e : d0 a9 __ BNE $31b9 ; (nforml.l6 + 0)
.s1020:
3210 : c5 11 __ CMP P4 ; (v + 0)
3212 : 90 a5 __ BCC $31b9 ; (nforml.l6 + 0)
3214 : 4c ef 30 JMP $30ef ; (nforml.s7 + 0)
--------------------------------------------------------------------
3217 : __ __ __ BYT 73 77 69 74 63 68 20 74 6f 20 38 30 20 63 6f 6c : switch to 80 col
3227 : __ __ __ BYT 75 6d 6e 20 73 63 72 65 65 6e 0a 61 6e 64 20 70 : umn screen.and p
3237 : __ __ __ BYT 72 65 73 73 20 6b 65 79 2e 0a 00                : ress key...
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
3242 : 20 50 32 JSR $3250 ; (getpch + 0)
3245 : c9 00 __ CMP #$00
3247 : f0 f9 __ BEQ $3242 ; (getch.s0 + 0)
3249 : 85 1b __ STA ACCU + 0 
324b : a9 00 __ LDA #$00
324d : 85 1c __ STA ACCU + 1 
.s1001:
324f : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
3250 : 20 e4 ff JSR $ffe4 
3253 : ae ec 3b LDX $3bec ; (giocharmap + 0)
3256 : e0 01 __ CPX #$01
3258 : 90 26 __ BCC $3280 ; (getpch + 48)
325a : c9 0d __ CMP #$0d
325c : d0 02 __ BNE $3260 ; (getpch + 16)
325e : a9 0a __ LDA #$0a
3260 : e0 02 __ CPX #$02
3262 : 90 1c __ BCC $3280 ; (getpch + 48)
3264 : c9 db __ CMP #$db
3266 : b0 18 __ BCS $3280 ; (getpch + 48)
3268 : c9 41 __ CMP #$41
326a : 90 14 __ BCC $3280 ; (getpch + 48)
326c : c9 c1 __ CMP #$c1
326e : 90 02 __ BCC $3272 ; (getpch + 34)
3270 : 49 a0 __ EOR #$a0
3272 : c9 7b __ CMP #$7b
3274 : b0 0a __ BCS $3280 ; (getpch + 48)
3276 : c9 61 __ CMP #$61
3278 : b0 04 __ BCS $327e ; (getpch + 46)
327a : c9 5b __ CMP #$5b
327c : b0 02 __ BCS $3280 ; (getpch + 48)
327e : 49 20 __ EOR #$20
3280 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
3281 : 20 81 ff JSR $ff81 
.s1001:
3284 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
3285 : 24 d7 __ BIT $d7 
3287 : 30 03 __ BMI $328c ; (screen_setmode.s1001 + 0)
.s6:
3289 : 20 5f ff JSR $ff5f 
.s1001:
328c : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
328d : a2 04 __ LDX #$04
328f : b5 53 __ LDA T3 + 0,x 
3291 : 9d ac bf STA $bfac,x ; (vdc_set_mode@stack + 0)
3294 : ca __ __ DEX
3295 : 10 f8 __ BPL $328f ; (vdc_set_mode.s1000 + 2)
3297 : 38 __ __ SEC
3298 : a5 23 __ LDA SP + 0 
329a : e9 08 __ SBC #$08
329c : 85 23 __ STA SP + 0 
329e : b0 02 __ BCS $32a2 ; (vdc_set_mode.s0 + 0)
32a0 : c6 24 __ DEC SP + 1 
.s0:
32a2 : a9 00 __ LDA #$00
32a4 : 85 4f __ STA T0 + 0 
32a6 : 38 __ __ SEC
32a7 : e5 16 __ SBC P9 ; (mode + 0)
32a9 : 29 20 __ AND #$20
32ab : 85 50 __ STA T2 + 0 
32ad : aa __ __ TAX
32ae : 18 __ __ CLC
32af : 69 00 __ ADC #$00
32b1 : 85 53 __ STA T3 + 0 
32b3 : a9 3c __ LDA #$3c
32b5 : 69 00 __ ADC #$00
32b7 : 85 54 __ STA T3 + 1 
32b9 : bd 04 3c LDA $3c04,x ; (vdc_modes + 4)
32bc : f0 0a __ BEQ $32c8 ; (vdc_set_mode.s3 + 0)
.s4:
32be : ad 40 3c LDA $3c40 ; (vdc_state + 0)
32c1 : c9 10 __ CMP #$10
32c3 : d0 03 __ BNE $32c8 ; (vdc_set_mode.s3 + 0)
32c5 : 4c 4a 35 JMP $354a ; (vdc_set_mode.s1001 + 0)
.s3:
32c8 : a0 00 __ LDY #$00
32ca : b1 53 __ LDA (T3 + 0),y 
32cc : 8d 43 3c STA $3c43 ; (vdc_state + 3)
32cf : c8 __ __ INY
32d0 : b1 53 __ LDA (T3 + 0),y 
32d2 : 8d 44 3c STA $3c44 ; (vdc_state + 4)
32d5 : c8 __ __ INY
32d6 : b1 53 __ LDA (T3 + 0),y 
32d8 : 8d 45 3c STA $3c45 ; (vdc_state + 5)
32db : c8 __ __ INY
32dc : b1 53 __ LDA (T3 + 0),y 
32de : 8d 46 3c STA $3c46 ; (vdc_state + 6)
32e1 : a0 09 __ LDY #$09
32e3 : b1 53 __ LDA (T3 + 0),y 
32e5 : 8d 4c 3c STA $3c4c ; (vdc_state + 12)
32e8 : c8 __ __ INY
32e9 : b1 53 __ LDA (T3 + 0),y 
32eb : 8d 4d 3c STA $3c4d ; (vdc_state + 13)
32ee : c8 __ __ INY
32ef : b1 53 __ LDA (T3 + 0),y 
32f1 : 8d 4e 3c STA $3c4e ; (vdc_state + 14)
32f4 : c8 __ __ INY
32f5 : b1 53 __ LDA (T3 + 0),y 
32f7 : 8d 4f 3c STA $3c4f ; (vdc_state + 15)
32fa : c8 __ __ INY
32fb : b1 53 __ LDA (T3 + 0),y 
32fd : 8d 50 3c STA $3c50 ; (vdc_state + 16)
3300 : c8 __ __ INY
3301 : b1 53 __ LDA (T3 + 0),y 
3303 : 8d 51 3c STA $3c51 ; (vdc_state + 17)
3306 : c8 __ __ INY
3307 : b1 53 __ LDA (T3 + 0),y 
3309 : 8d 52 3c STA $3c52 ; (vdc_state + 18)
330c : c8 __ __ INY
330d : b1 53 __ LDA (T3 + 0),y 
330f : 8d 53 3c STA $3c53 ; (vdc_state + 19)
3312 : c8 __ __ INY
3313 : b1 53 __ LDA (T3 + 0),y 
3315 : 8d 54 3c STA $3c54 ; (vdc_state + 20)
3318 : c8 __ __ INY
3319 : b1 53 __ LDA (T3 + 0),y 
331b : 8d 55 3c STA $3c55 ; (vdc_state + 21)
331e : a0 05 __ LDY #$05
3320 : b1 53 __ LDA (T3 + 0),y 
3322 : 85 55 __ STA T4 + 0 
3324 : c8 __ __ INY
3325 : b1 53 __ LDA (T3 + 0),y 
3327 : 8d 49 3c STA $3c49 ; (vdc_state + 9)
332a : 85 44 __ STA T6 + 0 
332c : a5 55 __ LDA T4 + 0 
332e : 8d 48 3c STA $3c48 ; (vdc_state + 8)
3331 : c8 __ __ INY
3332 : b1 53 __ LDA (T3 + 0),y 
3334 : 85 57 __ STA T5 + 0 
3336 : c8 __ __ INY
3337 : b1 53 __ LDA (T3 + 0),y 
3339 : 8d 4b 3c STA $3c4b ; (vdc_state + 11)
333c : a8 __ __ TAY
333d : a5 57 __ LDA T5 + 0 
333f : 8d 4a 3c STA $3c4a ; (vdc_state + 10)
3342 : a9 0c __ LDA #$0c
3344 : 8d 00 d6 STA $d600 
.l1515:
3347 : 2c 00 d6 BIT $d600 
334a : 10 fb __ BPL $3347 ; (vdc_set_mode.l1515 + 0)
.s11:
334c : a5 44 __ LDA T6 + 0 
334e : 8d 01 d6 STA $d601 
3351 : a9 0d __ LDA #$0d
3353 : 8d 00 d6 STA $d600 
.l1517:
3356 : 2c 00 d6 BIT $d600 
3359 : 10 fb __ BPL $3356 ; (vdc_set_mode.l1517 + 0)
.s16:
335b : a5 55 __ LDA T4 + 0 
335d : 8d 01 d6 STA $d601 
3360 : a9 14 __ LDA #$14
3362 : 8d 00 d6 STA $d600 
.l1519:
3365 : 2c 00 d6 BIT $d600 
3368 : 10 fb __ BPL $3365 ; (vdc_set_mode.l1519 + 0)
.s21:
336a : 8c 01 d6 STY $d601 
336d : a9 15 __ LDA #$15
336f : 8d 00 d6 STA $d600 
.l1521:
3372 : 2c 00 d6 BIT $d600 
3375 : 10 fb __ BPL $3372 ; (vdc_set_mode.l1521 + 0)
.s26:
3377 : a5 57 __ LDA T5 + 0 
3379 : 8d 01 d6 STA $d601 
337c : bd 0e 3c LDA $3c0e,x ; (vdc_modes + 14)
337f : 85 56 __ STA T4 + 1 
3381 : a9 1c __ LDA #$1c
3383 : 8d 00 d6 STA $d600 
.l1523:
3386 : 2c 00 d6 BIT $d600 
3389 : 10 fb __ BPL $3386 ; (vdc_set_mode.l1523 + 0)
.s32:
338b : ad 01 d6 LDA $d601 
338e : 29 1f __ AND #$1f
3390 : 85 57 __ STA T5 + 0 
3392 : a9 29 __ LDA #$29
3394 : a0 02 __ LDY #$02
3396 : 91 23 __ STA (SP + 0),y 
3398 : a9 37 __ LDA #$37
339a : c8 __ __ INY
339b : 91 23 __ STA (SP + 0),y 
339d : a9 1c __ LDA #$1c
339f : 8d 00 d6 STA $d600 
.l1525:
33a2 : 2c 00 d6 BIT $d600 
33a5 : 10 fb __ BPL $33a2 ; (vdc_set_mode.l1525 + 0)
.s39:
33a7 : ad 01 d6 LDA $d601 
33aa : a0 04 __ LDY #$04
33ac : 91 23 __ STA (SP + 0),y 
33ae : a9 00 __ LDA #$00
33b0 : c8 __ __ INY
33b1 : 91 23 __ STA (SP + 0),y 
33b3 : a5 57 __ LDA T5 + 0 
33b5 : c8 __ __ INY
33b6 : 91 23 __ STA (SP + 0),y 
33b8 : a9 00 __ LDA #$00
33ba : c8 __ __ INY
33bb : 91 23 __ STA (SP + 0),y 
33bd : 20 ba 2b JSR $2bba ; (printf.s1000 + 0)
33c0 : a9 1c __ LDA #$1c
33c2 : 8d 00 d6 STA $d600 
33c5 : a5 56 __ LDA T4 + 1 
33c7 : 29 e0 __ AND #$e0
33c9 : 18 __ __ CLC
33ca : 65 57 __ ADC T5 + 0 
.l1527:
33cc : 2c 00 d6 BIT $d600 
33cf : 10 fb __ BPL $33cc ; (vdc_set_mode.l1527 + 0)
.s46:
33d1 : 8d 01 d6 STA $d601 
33d4 : 18 __ __ CLC
33d5 : a9 13 __ LDA #$13
33d7 : 65 50 __ ADC T2 + 0 
33d9 : 85 50 __ STA T2 + 0 
33db : a9 3c __ LDA #$3c
33dd : 69 00 __ ADC #$00
33df : 85 51 __ STA T2 + 1 
.l47:
33e1 : a4 4f __ LDY T0 + 0 
33e3 : b1 50 __ LDA (T2 + 0),y 
33e5 : 85 46 __ STA T7 + 0 
33e7 : c8 __ __ INY
33e8 : b1 50 __ LDA (T2 + 0),y 
33ea : aa __ __ TAX
33eb : a5 46 __ LDA T7 + 0 
33ed : 8d 00 d6 STA $d600 
33f0 : c8 __ __ INY
33f1 : 84 4f __ STY T0 + 0 
.l1529:
33f3 : 2c 00 d6 BIT $d600 
33f6 : 10 fb __ BPL $33f3 ; (vdc_set_mode.l1529 + 0)
.s53:
33f8 : 8e 01 d6 STX $d601 
33fb : 18 __ __ CLC
33fc : a5 53 __ LDA T3 + 0 
33fe : 65 4f __ ADC T0 + 0 
3400 : 85 55 __ STA T4 + 0 
3402 : a5 54 __ LDA T3 + 1 
3404 : 69 00 __ ADC #$00
3406 : 85 56 __ STA T4 + 1 
3408 : a0 13 __ LDY #$13
340a : b1 55 __ LDA (T4 + 0),y 
340c : c9 ff __ CMP #$ff
340e : d0 d1 __ BNE $33e1 ; (vdc_set_mode.l47 + 0)
.s48:
3410 : a0 04 __ LDY #$04
3412 : b1 53 __ LDA (T3 + 0),y 
3414 : f0 05 __ BEQ $341b ; (vdc_set_mode.s55 + 0)
.s57:
3416 : ad 41 3c LDA $3c41 ; (vdc_state + 1)
3419 : f0 11 __ BEQ $342c ; (vdc_set_mode.s54 + 0)
.s55:
341b : a9 00 __ LDA #$00
341d : 85 4f __ STA T0 + 0 
341f : ad 43 3c LDA $3c43 ; (vdc_state + 3)
3422 : 85 50 __ STA T2 + 0 
3424 : ad 45 3c LDA $3c45 ; (vdc_state + 5)
3427 : 85 53 __ STA T3 + 0 
3429 : 4c 40 36 JMP $3640 ; (vdc_set_mode.l236 + 0)
.s54:
342c : ad 40 3c LDA $3c40 ; (vdc_state + 0)
342f : c9 10 __ CMP #$10
3431 : d0 03 __ BNE $3436 ; (vdc_set_mode.s62 + 0)
3433 : 4c 4a 35 JMP $354a ; (vdc_set_mode.s1001 + 0)
.s62:
3436 : ad 41 3c LDA $3c41 ; (vdc_state + 1)
3439 : f0 03 __ BEQ $343e ; (vdc_set_mode.s61 + 0)
343b : 4c 4a 35 JMP $354a ; (vdc_set_mode.s1001 + 0)
.s61:
343e : a9 22 __ LDA #$22
3440 : 8d 00 d6 STA $d600 
.l1559:
3443 : 2c 00 d6 BIT $d600 
3446 : 10 fb __ BPL $3443 ; (vdc_set_mode.l1559 + 0)
.s69:
3448 : a9 80 __ LDA #$80
344a : 8d 01 d6 STA $d601 
344d : a0 ff __ LDY #$ff
344f : a2 00 __ LDX #$00
.l72:
3451 : a9 12 __ LDA #$12
3453 : 8d 00 d6 STA $d600 
.l1561:
3456 : 2c 00 d6 BIT $d600 
3459 : 10 fb __ BPL $3456 ; (vdc_set_mode.l1561 + 0)
.s81:
345b : 8e 01 d6 STX $d601 
345e : a9 13 __ LDA #$13
3460 : 8d 00 d6 STA $d600 
.l1563:
3463 : 2c 00 d6 BIT $d600 
3466 : 10 fb __ BPL $3463 ; (vdc_set_mode.l1563 + 0)
.s86:
3468 : a9 00 __ LDA #$00
346a : 8d 01 d6 STA $d601 
346d : a9 1f __ LDA #$1f
346f : 8d 00 d6 STA $d600 
.l1565:
3472 : 2c 00 d6 BIT $d600 
3475 : 10 fb __ BPL $3472 ; (vdc_set_mode.l1565 + 0)
.s90:
3477 : a9 00 __ LDA #$00
3479 : 8d 01 d6 STA $d601 
347c : a9 18 __ LDA #$18
347e : 8d 00 d6 STA $d600 
.l1567:
3481 : 2c 00 d6 BIT $d600 
3484 : 10 fb __ BPL $3481 ; (vdc_set_mode.l1567 + 0)
.s96:
3486 : ad 01 d6 LDA $d601 
3489 : 29 7f __ AND #$7f
348b : 85 53 __ STA T3 + 0 
348d : a9 18 __ LDA #$18
348f : 8d 00 d6 STA $d600 
.l1569:
3492 : 2c 00 d6 BIT $d600 
3495 : 10 fb __ BPL $3492 ; (vdc_set_mode.l1569 + 0)
.s102:
3497 : a5 53 __ LDA T3 + 0 
3499 : 8d 01 d6 STA $d601 
349c : a9 1e __ LDA #$1e
349e : 8d 00 d6 STA $d600 
.l1571:
34a1 : 2c 00 d6 BIT $d600 
34a4 : 10 fb __ BPL $34a1 ; (vdc_set_mode.l1571 + 0)
.s107:
34a6 : a9 ff __ LDA #$ff
34a8 : 8d 01 d6 STA $d601 
34ab : e8 __ __ INX
34ac : 88 __ __ DEY
34ad : d0 a2 __ BNE $3451 ; (vdc_set_mode.l72 + 0)
.s74:
34af : a9 12 __ LDA #$12
34b1 : 8d 00 d6 STA $d600 
.l1574:
34b4 : 2c 00 d6 BIT $d600 
34b7 : 10 fb __ BPL $34b4 ; (vdc_set_mode.l1574 + 0)
.s114:
34b9 : 8e 01 d6 STX $d601 
34bc : a9 13 __ LDA #$13
34be : 8d 00 d6 STA $d600 
.l1576:
34c1 : 2c 00 d6 BIT $d600 
34c4 : 10 fb __ BPL $34c1 ; (vdc_set_mode.l1576 + 0)
.s119:
34c6 : 8c 01 d6 STY $d601 
34c9 : a9 1f __ LDA #$1f
34cb : 8d 00 d6 STA $d600 
.l1578:
34ce : 2c 00 d6 BIT $d600 
34d1 : 10 fb __ BPL $34ce ; (vdc_set_mode.l1578 + 0)
.s123:
34d3 : 8c 01 d6 STY $d601 
34d6 : a9 18 __ LDA #$18
34d8 : 8d 00 d6 STA $d600 
.l1580:
34db : 2c 00 d6 BIT $d600 
34de : 10 fb __ BPL $34db ; (vdc_set_mode.l1580 + 0)
.s129:
34e0 : ad 01 d6 LDA $d601 
34e3 : 29 7f __ AND #$7f
34e5 : aa __ __ TAX
34e6 : a9 18 __ LDA #$18
34e8 : 8d 00 d6 STA $d600 
.l1582:
34eb : 2c 00 d6 BIT $d600 
34ee : 10 fb __ BPL $34eb ; (vdc_set_mode.l1582 + 0)
.s135:
34f0 : 8e 01 d6 STX $d601 
34f3 : a9 1e __ LDA #$1e
34f5 : 8d 00 d6 STA $d600 
.l1584:
34f8 : 2c 00 d6 BIT $d600 
34fb : 10 fb __ BPL $34f8 ; (vdc_set_mode.l1584 + 0)
.s140:
34fd : a9 ff __ LDA #$ff
34ff : 8d 01 d6 STA $d601 
3502 : a9 1c __ LDA #$1c
3504 : 8d 00 d6 STA $d600 
.l1586:
3507 : 2c 00 d6 BIT $d600 
350a : 10 fb __ BPL $3507 ; (vdc_set_mode.l1586 + 0)
.s146:
350c : ad 01 d6 LDA $d601 
350f : 09 10 __ ORA #$10
3511 : aa __ __ TAX
3512 : a9 1c __ LDA #$1c
3514 : 8d 00 d6 STA $d600 
.l1588:
3517 : 2c 00 d6 BIT $d600 
351a : 10 fb __ BPL $3517 ; (vdc_set_mode.l1588 + 0)
.s152:
351c : 8e 01 d6 STX $d601 
351f : 20 31 37 JSR $3731 ; (vdc_restore_charsets.s0 + 0)
3522 : a9 00 __ LDA #$00
3524 : 85 4f __ STA T0 + 0 
3526 : ad 43 3c LDA $3c43 ; (vdc_state + 3)
3529 : 85 50 __ STA T2 + 0 
352b : ad 45 3c LDA $3c45 ; (vdc_state + 5)
352e : 85 53 __ STA T3 + 0 
.l155:
3530 : a5 4f __ LDA T0 + 0 
3532 : c5 53 __ CMP T3 + 0 
3534 : 90 2a __ BCC $3560 ; (vdc_set_mode.s156 + 0)
.s153:
3536 : a9 22 __ LDA #$22
3538 : 8d 00 d6 STA $d600 
.l1614:
353b : 2c 00 d6 BIT $d600 
353e : 10 fb __ BPL $353b ; (vdc_set_mode.l1614 + 0)
.s233:
3540 : a9 7d __ LDA #$7d
3542 : 8d 01 d6 STA $d601 
3545 : a9 01 __ LDA #$01
3547 : 8d 41 3c STA $3c41 ; (vdc_state + 1)
.s1001:
354a : 18 __ __ CLC
354b : a5 23 __ LDA SP + 0 
354d : 69 08 __ ADC #$08
354f : 85 23 __ STA SP + 0 
3551 : 90 02 __ BCC $3555 ; (vdc_set_mode.s1001 + 11)
3553 : e6 24 __ INC SP + 1 
3555 : a2 04 __ LDX #$04
3557 : bd ac bf LDA $bfac,x ; (vdc_set_mode@stack + 0)
355a : 95 53 __ STA T3 + 0,x 
355c : ca __ __ DEX
355d : 10 f8 __ BPL $3557 ; (vdc_set_mode.s1001 + 13)
355f : 60 __ __ RTS
.s156:
3560 : ad 43 3c LDA $3c43 ; (vdc_state + 3)
3563 : 85 1b __ STA ACCU + 0 
3565 : ad 44 3c LDA $3c44 ; (vdc_state + 4)
3568 : 85 1c __ STA ACCU + 1 
356a : ad 47 3c LDA $3c47 ; (vdc_state + 7)
356d : 85 43 __ STA T1 + 0 
356f : a9 12 __ LDA #$12
3571 : 8d 00 d6 STA $d600 
3574 : a6 50 __ LDX T2 + 0 
3576 : ca __ __ DEX
3577 : 86 44 __ STX T6 + 0 
3579 : a5 4f __ LDA T0 + 0 
357b : 20 b0 3a JSR $3ab0 ; (mul16by8 + 0)
357e : 18 __ __ CLC
357f : a5 05 __ LDA WORK + 2 
3581 : 6d 48 3c ADC $3c48 ; (vdc_state + 8)
3584 : aa __ __ TAX
3585 : a5 06 __ LDA WORK + 3 
3587 : 6d 49 3c ADC $3c49 ; (vdc_state + 9)
.l1590:
358a : 2c 00 d6 BIT $d600 
358d : 10 fb __ BPL $358a ; (vdc_set_mode.l1590 + 0)
.s168:
358f : 8d 01 d6 STA $d601 
3592 : a9 13 __ LDA #$13
3594 : 8d 00 d6 STA $d600 
.l1592:
3597 : 2c 00 d6 BIT $d600 
359a : 10 fb __ BPL $3597 ; (vdc_set_mode.l1592 + 0)
.s173:
359c : 8e 01 d6 STX $d601 
359f : a9 1f __ LDA #$1f
35a1 : 8d 00 d6 STA $d600 
.l1594:
35a4 : 2c 00 d6 BIT $d600 
35a7 : 10 fb __ BPL $35a4 ; (vdc_set_mode.l1594 + 0)
.s177:
35a9 : a9 20 __ LDA #$20
35ab : 8d 01 d6 STA $d601 
35ae : a9 18 __ LDA #$18
35b0 : 8d 00 d6 STA $d600 
.l1596:
35b3 : 2c 00 d6 BIT $d600 
35b6 : 10 fb __ BPL $35b3 ; (vdc_set_mode.l1596 + 0)
.s183:
35b8 : ad 01 d6 LDA $d601 
35bb : 29 7f __ AND #$7f
35bd : aa __ __ TAX
35be : a9 18 __ LDA #$18
35c0 : 8d 00 d6 STA $d600 
.l1598:
35c3 : 2c 00 d6 BIT $d600 
35c6 : 10 fb __ BPL $35c3 ; (vdc_set_mode.l1598 + 0)
.s189:
35c8 : 8e 01 d6 STX $d601 
35cb : a9 1e __ LDA #$1e
35cd : 8d 00 d6 STA $d600 
.l1600:
35d0 : 2c 00 d6 BIT $d600 
35d3 : 10 fb __ BPL $35d0 ; (vdc_set_mode.l1600 + 0)
.s194:
35d5 : a5 44 __ LDA T6 + 0 
35d7 : 8d 01 d6 STA $d601 
35da : ad 4a 3c LDA $3c4a ; (vdc_state + 10)
35dd : 18 __ __ CLC
35de : 65 05 __ ADC WORK + 2 
35e0 : aa __ __ TAX
35e1 : a9 12 __ LDA #$12
35e3 : 8d 00 d6 STA $d600 
35e6 : ad 4b 3c LDA $3c4b ; (vdc_state + 11)
35e9 : 65 06 __ ADC WORK + 3 
.l1602:
35eb : 2c 00 d6 BIT $d600 
35ee : 10 fb __ BPL $35eb ; (vdc_set_mode.l1602 + 0)
.s201:
35f0 : 8d 01 d6 STA $d601 
35f3 : a9 13 __ LDA #$13
35f5 : 8d 00 d6 STA $d600 
.l1604:
35f8 : 2c 00 d6 BIT $d600 
35fb : 10 fb __ BPL $35f8 ; (vdc_set_mode.l1604 + 0)
.s206:
35fd : 8e 01 d6 STX $d601 
3600 : a9 1f __ LDA #$1f
3602 : 8d 00 d6 STA $d600 
.l1606:
3605 : 2c 00 d6 BIT $d600 
3608 : 10 fb __ BPL $3605 ; (vdc_set_mode.l1606 + 0)
.s210:
360a : a5 43 __ LDA T1 + 0 
360c : 8d 01 d6 STA $d601 
360f : a9 18 __ LDA #$18
3611 : 8d 00 d6 STA $d600 
.l1608:
3614 : 2c 00 d6 BIT $d600 
3617 : 10 fb __ BPL $3614 ; (vdc_set_mode.l1608 + 0)
.s216:
3619 : ad 01 d6 LDA $d601 
361c : 29 7f __ AND #$7f
361e : aa __ __ TAX
361f : a9 18 __ LDA #$18
3621 : 8d 00 d6 STA $d600 
.l1610:
3624 : 2c 00 d6 BIT $d600 
3627 : 10 fb __ BPL $3624 ; (vdc_set_mode.l1610 + 0)
.s222:
3629 : 8e 01 d6 STX $d601 
362c : a9 1e __ LDA #$1e
362e : 8d 00 d6 STA $d600 
.l1612:
3631 : 2c 00 d6 BIT $d600 
3634 : 10 fb __ BPL $3631 ; (vdc_set_mode.l1612 + 0)
.s227:
3636 : a5 44 __ LDA T6 + 0 
3638 : 8d 01 d6 STA $d601 
363b : e6 4f __ INC T0 + 0 
363d : 4c 30 35 JMP $3530 ; (vdc_set_mode.l155 + 0)
.l236:
3640 : a5 4f __ LDA T0 + 0 
3642 : c5 53 __ CMP T3 + 0 
3644 : 90 03 __ BCC $3649 ; (vdc_set_mode.s237 + 0)
3646 : 4c 4a 35 JMP $354a ; (vdc_set_mode.s1001 + 0)
.s237:
3649 : ad 43 3c LDA $3c43 ; (vdc_state + 3)
364c : 85 1b __ STA ACCU + 0 
364e : ad 44 3c LDA $3c44 ; (vdc_state + 4)
3651 : 85 1c __ STA ACCU + 1 
3653 : ad 47 3c LDA $3c47 ; (vdc_state + 7)
3656 : 85 43 __ STA T1 + 0 
3658 : a9 12 __ LDA #$12
365a : 8d 00 d6 STA $d600 
365d : a6 50 __ LDX T2 + 0 
365f : ca __ __ DEX
3660 : 86 44 __ STX T6 + 0 
3662 : a5 4f __ LDA T0 + 0 
3664 : 20 b0 3a JSR $3ab0 ; (mul16by8 + 0)
3667 : 18 __ __ CLC
3668 : a5 05 __ LDA WORK + 2 
366a : 6d 48 3c ADC $3c48 ; (vdc_state + 8)
366d : aa __ __ TAX
366e : a5 06 __ LDA WORK + 3 
3670 : 6d 49 3c ADC $3c49 ; (vdc_state + 9)
.l1534:
3673 : 2c 00 d6 BIT $d600 
3676 : 10 fb __ BPL $3673 ; (vdc_set_mode.l1534 + 0)
.s249:
3678 : 8d 01 d6 STA $d601 
367b : a9 13 __ LDA #$13
367d : 8d 00 d6 STA $d600 
.l1536:
3680 : 2c 00 d6 BIT $d600 
3683 : 10 fb __ BPL $3680 ; (vdc_set_mode.l1536 + 0)
.s254:
3685 : 8e 01 d6 STX $d601 
3688 : a9 1f __ LDA #$1f
368a : 8d 00 d6 STA $d600 
.l1538:
368d : 2c 00 d6 BIT $d600 
3690 : 10 fb __ BPL $368d ; (vdc_set_mode.l1538 + 0)
.s258:
3692 : a9 20 __ LDA #$20
3694 : 8d 01 d6 STA $d601 
3697 : a9 18 __ LDA #$18
3699 : 8d 00 d6 STA $d600 
.l1540:
369c : 2c 00 d6 BIT $d600 
369f : 10 fb __ BPL $369c ; (vdc_set_mode.l1540 + 0)
.s264:
36a1 : ad 01 d6 LDA $d601 
36a4 : 29 7f __ AND #$7f
36a6 : aa __ __ TAX
36a7 : a9 18 __ LDA #$18
36a9 : 8d 00 d6 STA $d600 
.l1542:
36ac : 2c 00 d6 BIT $d600 
36af : 10 fb __ BPL $36ac ; (vdc_set_mode.l1542 + 0)
.s270:
36b1 : 8e 01 d6 STX $d601 
36b4 : a9 1e __ LDA #$1e
36b6 : 8d 00 d6 STA $d600 
.l1544:
36b9 : 2c 00 d6 BIT $d600 
36bc : 10 fb __ BPL $36b9 ; (vdc_set_mode.l1544 + 0)
.s275:
36be : a5 44 __ LDA T6 + 0 
36c0 : 8d 01 d6 STA $d601 
36c3 : ad 4a 3c LDA $3c4a ; (vdc_state + 10)
36c6 : 18 __ __ CLC
36c7 : 65 05 __ ADC WORK + 2 
36c9 : aa __ __ TAX
36ca : a9 12 __ LDA #$12
36cc : 8d 00 d6 STA $d600 
36cf : ad 4b 3c LDA $3c4b ; (vdc_state + 11)
36d2 : 65 06 __ ADC WORK + 3 
.l1546:
36d4 : 2c 00 d6 BIT $d600 
36d7 : 10 fb __ BPL $36d4 ; (vdc_set_mode.l1546 + 0)
.s282:
36d9 : 8d 01 d6 STA $d601 
36dc : a9 13 __ LDA #$13
36de : 8d 00 d6 STA $d600 
.l1548:
36e1 : 2c 00 d6 BIT $d600 
36e4 : 10 fb __ BPL $36e1 ; (vdc_set_mode.l1548 + 0)
.s287:
36e6 : 8e 01 d6 STX $d601 
36e9 : a9 1f __ LDA #$1f
36eb : 8d 00 d6 STA $d600 
.l1550:
36ee : 2c 00 d6 BIT $d600 
36f1 : 10 fb __ BPL $36ee ; (vdc_set_mode.l1550 + 0)
.s291:
36f3 : a5 43 __ LDA T1 + 0 
36f5 : 8d 01 d6 STA $d601 
36f8 : a9 18 __ LDA #$18
36fa : 8d 00 d6 STA $d600 
.l1552:
36fd : 2c 00 d6 BIT $d600 
3700 : 10 fb __ BPL $36fd ; (vdc_set_mode.l1552 + 0)
.s297:
3702 : ad 01 d6 LDA $d601 
3705 : 29 7f __ AND #$7f
3707 : aa __ __ TAX
3708 : a9 18 __ LDA #$18
370a : 8d 00 d6 STA $d600 
.l1554:
370d : 2c 00 d6 BIT $d600 
3710 : 10 fb __ BPL $370d ; (vdc_set_mode.l1554 + 0)
.s303:
3712 : 8e 01 d6 STX $d601 
3715 : a9 1e __ LDA #$1e
3717 : 8d 00 d6 STA $d600 
.l1556:
371a : 2c 00 d6 BIT $d600 
371d : 10 fb __ BPL $371a ; (vdc_set_mode.l1556 + 0)
.s308:
371f : a5 44 __ LDA T6 + 0 
3721 : 8d 01 d6 STA $d601 
3724 : e6 4f __ INC T0 + 0 
3726 : 4c 40 36 JMP $3640 ; (vdc_set_mode.l236 + 0)
--------------------------------------------------------------------
3729 : __ __ __ BYT 25 32 78 20 25 32 78 00                         : %2x %2x.
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
3731 : 20 62 ff JSR $ff62 
.s1001:
3734 : 60 __ __ RTS
--------------------------------------------------------------------
3735 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 44 45 4d 4f : oSCAR64 vdc DEMO
3745 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
3746 : a2 03 __ LDX #$03
3748 : b5 53 __ LDA T8 + 0,x 
374a : 9d e4 bf STA $bfe4,x ; (buff + 38)
374d : ca __ __ DEX
374e : 10 f8 __ BPL $3748 ; (sprintf.s1000 + 2)
.s0:
3750 : 18 __ __ CLC
3751 : a5 23 __ LDA SP + 0 
3753 : 69 06 __ ADC #$06
3755 : 85 47 __ STA T0 + 0 
3757 : a5 24 __ LDA SP + 1 
3759 : 69 00 __ ADC #$00
375b : 85 48 __ STA T0 + 1 
375d : a9 00 __ LDA #$00
375f : 85 43 __ STA T1 + 0 
3761 : a0 04 __ LDY #$04
3763 : b1 23 __ LDA (SP + 0),y 
3765 : 85 49 __ STA T2 + 0 
3767 : c8 __ __ INY
3768 : b1 23 __ LDA (SP + 0),y 
376a : 85 4a __ STA T2 + 1 
376c : a0 02 __ LDY #$02
376e : b1 23 __ LDA (SP + 0),y 
3770 : 85 4b __ STA T3 + 0 
3772 : c8 __ __ INY
3773 : b1 23 __ LDA (SP + 0),y 
3775 : 85 4c __ STA T3 + 1 
.l2:
3777 : a0 00 __ LDY #$00
3779 : b1 49 __ LDA (T2 + 0),y 
377b : d0 0f __ BNE $378c ; (sprintf.s3 + 0)
.s4:
377d : a4 43 __ LDY T1 + 0 
377f : 91 4b __ STA (T3 + 0),y 
.s1001:
3781 : a2 03 __ LDX #$03
3783 : bd e4 bf LDA $bfe4,x ; (buff + 38)
3786 : 95 53 __ STA T8 + 0,x 
3788 : ca __ __ DEX
3789 : 10 f8 __ BPL $3783 ; (sprintf.s1001 + 2)
378b : 60 __ __ RTS
.s3:
378c : c9 25 __ CMP #$25
378e : f0 22 __ BEQ $37b2 ; (sprintf.s5 + 0)
.s6:
3790 : a4 43 __ LDY T1 + 0 
3792 : 91 4b __ STA (T3 + 0),y 
3794 : e6 49 __ INC T2 + 0 
3796 : d0 02 __ BNE $379a ; (sprintf.s1102 + 0)
.s1101:
3798 : e6 4a __ INC T2 + 1 
.s1102:
379a : c8 __ __ INY
379b : 84 43 __ STY T1 + 0 
379d : 98 __ __ TYA
379e : c0 28 __ CPY #$28
37a0 : 90 d5 __ BCC $3777 ; (sprintf.l2 + 0)
.s111:
37a2 : 18 __ __ CLC
37a3 : 65 4b __ ADC T3 + 0 
37a5 : 85 4b __ STA T3 + 0 
37a7 : 90 02 __ BCC $37ab ; (sprintf.s1104 + 0)
.s1103:
37a9 : e6 4c __ INC T3 + 1 
.s1104:
37ab : a9 00 __ LDA #$00
.s1068:
37ad : 85 43 __ STA T1 + 0 
37af : 4c 77 37 JMP $3777 ; (sprintf.l2 + 0)
.s5:
37b2 : 8c ec bf STY $bfec ; (buff + 46)
37b5 : 8c ed bf STY $bfed ; (buff + 47)
37b8 : 8c ee bf STY $bfee ; (buff + 48)
37bb : 8c ef bf STY $bfef ; (buff + 49)
37be : a9 0a __ LDA #$0a
37c0 : 8d eb bf STA $bfeb ; (buff + 45)
37c3 : a5 43 __ LDA T1 + 0 
37c5 : f0 0b __ BEQ $37d2 ; (sprintf.s10 + 0)
.s8:
37c7 : 18 __ __ CLC
37c8 : 65 4b __ ADC T3 + 0 
37ca : 85 4b __ STA T3 + 0 
37cc : 90 02 __ BCC $37d0 ; (sprintf.s1080 + 0)
.s1079:
37ce : e6 4c __ INC T3 + 1 
.s1080:
37d0 : 84 43 __ STY T1 + 0 
.s10:
37d2 : a0 01 __ LDY #$01
37d4 : b1 49 __ LDA (T2 + 0),y 
37d6 : aa __ __ TAX
37d7 : a9 20 __ LDA #$20
37d9 : 8d e8 bf STA $bfe8 ; (buff + 42)
37dc : a9 00 __ LDA #$00
37de : 8d e9 bf STA $bfe9 ; (buff + 43)
37e1 : a9 ff __ LDA #$ff
37e3 : 8d ea bf STA $bfea ; (buff + 44)
37e6 : 18 __ __ CLC
37e7 : a5 49 __ LDA T2 + 0 
37e9 : 69 02 __ ADC #$02
.l15:
37eb : 85 49 __ STA T2 + 0 
37ed : 90 02 __ BCC $37f1 ; (sprintf.s1082 + 0)
.s1081:
37ef : e6 4a __ INC T2 + 1 
.s1082:
37f1 : 8a __ __ TXA
37f2 : e0 2b __ CPX #$2b
37f4 : d0 08 __ BNE $37fe ; (sprintf.s18 + 0)
.s17:
37f6 : a9 01 __ LDA #$01
37f8 : 8d ed bf STA $bfed ; (buff + 47)
37fb : 4c 5f 3a JMP $3a5f ; (sprintf.s260 + 0)
.s18:
37fe : c9 30 __ CMP #$30
3800 : d0 06 __ BNE $3808 ; (sprintf.s21 + 0)
.s20:
3802 : 8d e8 bf STA $bfe8 ; (buff + 42)
3805 : 4c 5f 3a JMP $3a5f ; (sprintf.s260 + 0)
.s21:
3808 : e0 23 __ CPX #$23
380a : d0 08 __ BNE $3814 ; (sprintf.s24 + 0)
.s23:
380c : a9 01 __ LDA #$01
380e : 8d ef bf STA $bfef ; (buff + 49)
3811 : 4c 5f 3a JMP $3a5f ; (sprintf.s260 + 0)
.s24:
3814 : e0 2d __ CPX #$2d
3816 : d0 08 __ BNE $3820 ; (sprintf.s16 + 0)
.s26:
3818 : a9 01 __ LDA #$01
381a : 8d ee bf STA $bfee ; (buff + 48)
381d : 4c 5f 3a JMP $3a5f ; (sprintf.s260 + 0)
.s16:
3820 : 85 45 __ STA T4 + 0 
3822 : e0 30 __ CPX #$30
3824 : 90 53 __ BCC $3879 ; (sprintf.s32 + 0)
.s33:
3826 : e0 3a __ CPX #$3a
3828 : b0 4f __ BCS $3879 ; (sprintf.s32 + 0)
.s30:
382a : a9 00 __ LDA #$00
382c : 85 4d __ STA T6 + 0 
382e : 85 4e __ STA T6 + 1 
3830 : e0 3a __ CPX #$3a
3832 : b0 40 __ BCS $3874 ; (sprintf.s36 + 0)
.l35:
3834 : a5 4d __ LDA T6 + 0 
3836 : 0a __ __ ASL
3837 : 85 1b __ STA ACCU + 0 
3839 : a5 4e __ LDA T6 + 1 
383b : 2a __ __ ROL
383c : 06 1b __ ASL ACCU + 0 
383e : 2a __ __ ROL
383f : aa __ __ TAX
3840 : 18 __ __ CLC
3841 : a5 1b __ LDA ACCU + 0 
3843 : 65 4d __ ADC T6 + 0 
3845 : 85 4d __ STA T6 + 0 
3847 : 8a __ __ TXA
3848 : 65 4e __ ADC T6 + 1 
384a : 06 4d __ ASL T6 + 0 
384c : 2a __ __ ROL
384d : aa __ __ TAX
384e : 18 __ __ CLC
384f : a5 4d __ LDA T6 + 0 
3851 : 65 45 __ ADC T4 + 0 
3853 : 90 01 __ BCC $3856 ; (sprintf.s1098 + 0)
.s1097:
3855 : e8 __ __ INX
.s1098:
3856 : 38 __ __ SEC
3857 : e9 30 __ SBC #$30
3859 : 85 4d __ STA T6 + 0 
385b : 8a __ __ TXA
385c : e9 00 __ SBC #$00
385e : 85 4e __ STA T6 + 1 
3860 : a0 00 __ LDY #$00
3862 : b1 49 __ LDA (T2 + 0),y 
3864 : 85 45 __ STA T4 + 0 
3866 : e6 49 __ INC T2 + 0 
3868 : d0 02 __ BNE $386c ; (sprintf.s1100 + 0)
.s1099:
386a : e6 4a __ INC T2 + 1 
.s1100:
386c : c9 30 __ CMP #$30
386e : 90 04 __ BCC $3874 ; (sprintf.s36 + 0)
.s37:
3870 : c9 3a __ CMP #$3a
3872 : 90 c0 __ BCC $3834 ; (sprintf.l35 + 0)
.s36:
3874 : a5 4d __ LDA T6 + 0 
3876 : 8d e9 bf STA $bfe9 ; (buff + 43)
.s32:
3879 : a5 45 __ LDA T4 + 0 
387b : c9 2e __ CMP #$2e
387d : d0 51 __ BNE $38d0 ; (sprintf.s40 + 0)
.s38:
387f : a9 00 __ LDA #$00
3881 : 85 4d __ STA T6 + 0 
.l245:
3883 : 85 4e __ STA T6 + 1 
3885 : a0 00 __ LDY #$00
3887 : b1 49 __ LDA (T2 + 0),y 
3889 : 85 45 __ STA T4 + 0 
388b : e6 49 __ INC T2 + 0 
388d : d0 02 __ BNE $3891 ; (sprintf.s1084 + 0)
.s1083:
388f : e6 4a __ INC T2 + 1 
.s1084:
3891 : c9 30 __ CMP #$30
3893 : 90 04 __ BCC $3899 ; (sprintf.s43 + 0)
.s44:
3895 : c9 3a __ CMP #$3a
3897 : 90 0a __ BCC $38a3 ; (sprintf.s42 + 0)
.s43:
3899 : a5 4d __ LDA T6 + 0 
389b : 8d ea bf STA $bfea ; (buff + 44)
389e : a5 45 __ LDA T4 + 0 
38a0 : 4c d0 38 JMP $38d0 ; (sprintf.s40 + 0)
.s42:
38a3 : a5 4d __ LDA T6 + 0 
38a5 : 0a __ __ ASL
38a6 : 85 1b __ STA ACCU + 0 
38a8 : a5 4e __ LDA T6 + 1 
38aa : 2a __ __ ROL
38ab : 06 1b __ ASL ACCU + 0 
38ad : 2a __ __ ROL
38ae : aa __ __ TAX
38af : 18 __ __ CLC
38b0 : a5 1b __ LDA ACCU + 0 
38b2 : 65 4d __ ADC T6 + 0 
38b4 : 85 4d __ STA T6 + 0 
38b6 : 8a __ __ TXA
38b7 : 65 4e __ ADC T6 + 1 
38b9 : 06 4d __ ASL T6 + 0 
38bb : 2a __ __ ROL
38bc : aa __ __ TAX
38bd : 18 __ __ CLC
38be : a5 4d __ LDA T6 + 0 
38c0 : 65 45 __ ADC T4 + 0 
38c2 : 90 01 __ BCC $38c5 ; (sprintf.s1096 + 0)
.s1095:
38c4 : e8 __ __ INX
.s1096:
38c5 : 38 __ __ SEC
38c6 : e9 30 __ SBC #$30
38c8 : 85 4d __ STA T6 + 0 
38ca : 8a __ __ TXA
38cb : e9 00 __ SBC #$00
38cd : 4c 83 38 JMP $3883 ; (sprintf.l245 + 0)
.s40:
38d0 : c9 64 __ CMP #$64
38d2 : f0 04 __ BEQ $38d8 ; (sprintf.s45 + 0)
.s48:
38d4 : c9 44 __ CMP #$44
38d6 : d0 05 __ BNE $38dd ; (sprintf.s46 + 0)
.s45:
38d8 : a9 01 __ LDA #$01
38da : 4c 38 3a JMP $3a38 ; (sprintf.s261 + 0)
.s46:
38dd : c9 75 __ CMP #$75
38df : d0 03 __ BNE $38e4 ; (sprintf.s52 + 0)
38e1 : 4c 36 3a JMP $3a36 ; (sprintf.s285 + 0)
.s52:
38e4 : c9 55 __ CMP #$55
38e6 : d0 03 __ BNE $38eb ; (sprintf.s50 + 0)
38e8 : 4c 36 3a JMP $3a36 ; (sprintf.s285 + 0)
.s50:
38eb : c9 78 __ CMP #$78
38ed : f0 04 __ BEQ $38f3 ; (sprintf.s53 + 0)
.s56:
38ef : c9 58 __ CMP #$58
38f1 : d0 0d __ BNE $3900 ; (sprintf.s54 + 0)
.s53:
38f3 : a9 10 __ LDA #$10
38f5 : 8d eb bf STA $bfeb ; (buff + 45)
38f8 : a9 00 __ LDA #$00
38fa : 8d ec bf STA $bfec ; (buff + 46)
38fd : 4c 36 3a JMP $3a36 ; (sprintf.s285 + 0)
.s54:
3900 : c9 6c __ CMP #$6c
3902 : d0 03 __ BNE $3907 ; (sprintf.s60 + 0)
3904 : 4c c8 39 JMP $39c8 ; (sprintf.s57 + 0)
.s60:
3907 : c9 4c __ CMP #$4c
3909 : d0 03 __ BNE $390e ; (sprintf.s58 + 0)
390b : 4c c8 39 JMP $39c8 ; (sprintf.s57 + 0)
.s58:
390e : c9 73 __ CMP #$73
3910 : f0 37 __ BEQ $3949 ; (sprintf.s73 + 0)
.s76:
3912 : c9 53 __ CMP #$53
3914 : f0 33 __ BEQ $3949 ; (sprintf.s73 + 0)
.s74:
3916 : c9 63 __ CMP #$63
3918 : f0 14 __ BEQ $392e ; (sprintf.s104 + 0)
.s107:
391a : c9 43 __ CMP #$43
391c : f0 10 __ BEQ $392e ; (sprintf.s104 + 0)
.s105:
391e : 09 00 __ ORA #$00
3920 : d0 03 __ BNE $3925 ; (sprintf.s108 + 0)
3922 : 4c 77 37 JMP $3777 ; (sprintf.l2 + 0)
.s108:
3925 : a4 43 __ LDY T1 + 0 
3927 : 91 4b __ STA (T3 + 0),y 
3929 : e6 43 __ INC T1 + 0 
392b : 4c 77 37 JMP $3777 ; (sprintf.l2 + 0)
.s104:
392e : a0 00 __ LDY #$00
3930 : b1 47 __ LDA (T0 + 0),y 
3932 : a4 43 __ LDY T1 + 0 
3934 : 91 4b __ STA (T3 + 0),y 
3936 : e6 43 __ INC T1 + 0 
.s258:
3938 : 18 __ __ CLC
3939 : a5 47 __ LDA T0 + 0 
393b : 69 02 __ ADC #$02
393d : 85 47 __ STA T0 + 0 
393f : b0 03 __ BCS $3944 ; (sprintf.s1085 + 0)
3941 : 4c 77 37 JMP $3777 ; (sprintf.l2 + 0)
.s1085:
3944 : e6 48 __ INC T0 + 1 
3946 : 4c 77 37 JMP $3777 ; (sprintf.l2 + 0)
.s73:
3949 : a0 00 __ LDY #$00
394b : 84 45 __ STY T4 + 0 
394d : b1 47 __ LDA (T0 + 0),y 
394f : 85 4d __ STA T6 + 0 
3951 : c8 __ __ INY
3952 : b1 47 __ LDA (T0 + 0),y 
3954 : 85 4e __ STA T6 + 1 
3956 : 18 __ __ CLC
3957 : a5 47 __ LDA T0 + 0 
3959 : 69 02 __ ADC #$02
395b : 85 47 __ STA T0 + 0 
395d : 90 02 __ BCC $3961 ; (sprintf.s1092 + 0)
.s1091:
395f : e6 48 __ INC T0 + 1 
.s1092:
3961 : ad e9 bf LDA $bfe9 ; (buff + 43)
3964 : f0 0d __ BEQ $3973 ; (sprintf.s79 + 0)
.s1071:
3966 : a0 00 __ LDY #$00
3968 : b1 4d __ LDA (T6 + 0),y 
396a : f0 05 __ BEQ $3971 ; (sprintf.s1072 + 0)
.l81:
396c : c8 __ __ INY
396d : b1 4d __ LDA (T6 + 0),y 
396f : d0 fb __ BNE $396c ; (sprintf.l81 + 0)
.s1072:
3971 : 84 45 __ STY T4 + 0 
.s79:
3973 : ad ee bf LDA $bfee ; (buff + 48)
3976 : d0 19 __ BNE $3991 ; (sprintf.l95 + 0)
.s1075:
3978 : a6 45 __ LDX T4 + 0 
397a : ec e9 bf CPX $bfe9 ; (buff + 43)
397d : a4 43 __ LDY T1 + 0 
397f : b0 0c __ BCS $398d ; (sprintf.s1076 + 0)
.l87:
3981 : ad e8 bf LDA $bfe8 ; (buff + 42)
3984 : 91 4b __ STA (T3 + 0),y 
3986 : e8 __ __ INX
3987 : ec e9 bf CPX $bfe9 ; (buff + 43)
398a : c8 __ __ INY
398b : 90 f4 __ BCC $3981 ; (sprintf.l87 + 0)
.s1076:
398d : 86 45 __ STX T4 + 0 
398f : 84 43 __ STY T1 + 0 
.l95:
3991 : a0 00 __ LDY #$00
3993 : b1 4d __ LDA (T6 + 0),y 
3995 : f0 0f __ BEQ $39a6 ; (sprintf.s91 + 0)
.s96:
3997 : a4 43 __ LDY T1 + 0 
3999 : 91 4b __ STA (T3 + 0),y 
399b : e6 43 __ INC T1 + 0 
399d : e6 4d __ INC T6 + 0 
399f : d0 f0 __ BNE $3991 ; (sprintf.l95 + 0)
.s1093:
39a1 : e6 4e __ INC T6 + 1 
39a3 : 4c 91 39 JMP $3991 ; (sprintf.l95 + 0)
.s91:
39a6 : ad ee bf LDA $bfee ; (buff + 48)
39a9 : d0 03 __ BNE $39ae ; (sprintf.s1073 + 0)
39ab : 4c 77 37 JMP $3777 ; (sprintf.l2 + 0)
.s1073:
39ae : a6 45 __ LDX T4 + 0 
39b0 : ec e9 bf CPX $bfe9 ; (buff + 43)
39b3 : a4 43 __ LDY T1 + 0 
39b5 : b0 0c __ BCS $39c3 ; (sprintf.s1074 + 0)
.l102:
39b7 : ad e8 bf LDA $bfe8 ; (buff + 42)
39ba : 91 4b __ STA (T3 + 0),y 
39bc : e8 __ __ INX
39bd : ec e9 bf CPX $bfe9 ; (buff + 43)
39c0 : c8 __ __ INY
39c1 : 90 f4 __ BCC $39b7 ; (sprintf.l102 + 0)
.s1074:
39c3 : 84 43 __ STY T1 + 0 
39c5 : 4c 77 37 JMP $3777 ; (sprintf.l2 + 0)
.s57:
39c8 : a0 00 __ LDY #$00
39ca : b1 47 __ LDA (T0 + 0),y 
39cc : 85 53 __ STA T8 + 0 
39ce : c8 __ __ INY
39cf : b1 47 __ LDA (T0 + 0),y 
39d1 : 85 54 __ STA T8 + 1 
39d3 : c8 __ __ INY
39d4 : b1 47 __ LDA (T0 + 0),y 
39d6 : 85 55 __ STA T8 + 2 
39d8 : c8 __ __ INY
39d9 : b1 47 __ LDA (T0 + 0),y 
39db : 85 56 __ STA T8 + 3 
39dd : 18 __ __ CLC
39de : a5 47 __ LDA T0 + 0 
39e0 : 69 04 __ ADC #$04
39e2 : 85 47 __ STA T0 + 0 
39e4 : 90 02 __ BCC $39e8 ; (sprintf.s1088 + 0)
.s1087:
39e6 : e6 48 __ INC T0 + 1 
.s1088:
39e8 : a0 00 __ LDY #$00
39ea : b1 49 __ LDA (T2 + 0),y 
39ec : aa __ __ TAX
39ed : e6 49 __ INC T2 + 0 
39ef : d0 02 __ BNE $39f3 ; (sprintf.s1090 + 0)
.s1089:
39f1 : e6 4a __ INC T2 + 1 
.s1090:
39f3 : 8a __ __ TXA
39f4 : e0 64 __ CPX #$64
39f6 : f0 04 __ BEQ $39fc ; (sprintf.s61 + 0)
.s64:
39f8 : c9 44 __ CMP #$44
39fa : d0 04 __ BNE $3a00 ; (sprintf.s62 + 0)
.s61:
39fc : a9 01 __ LDA #$01
39fe : d0 1c __ BNE $3a1c ; (sprintf.s259 + 0)
.s62:
3a00 : c9 75 __ CMP #$75
3a02 : f0 17 __ BEQ $3a1b ; (sprintf.s284 + 0)
.s68:
3a04 : c9 55 __ CMP #$55
3a06 : f0 13 __ BEQ $3a1b ; (sprintf.s284 + 0)
.s66:
3a08 : c9 78 __ CMP #$78
3a0a : f0 07 __ BEQ $3a13 ; (sprintf.s69 + 0)
.s72:
3a0c : c9 58 __ CMP #$58
3a0e : f0 03 __ BEQ $3a13 ; (sprintf.s69 + 0)
3a10 : 4c 77 37 JMP $3777 ; (sprintf.l2 + 0)
.s69:
3a13 : 8c ec bf STY $bfec ; (buff + 46)
3a16 : a9 10 __ LDA #$10
3a18 : 8d eb bf STA $bfeb ; (buff + 45)
.s284:
3a1b : 98 __ __ TYA
.s259:
3a1c : 85 15 __ STA P8 
3a1e : a5 4b __ LDA T3 + 0 
3a20 : 85 0f __ STA P2 ; (fmt + 0)
3a22 : a5 4c __ LDA T3 + 1 
3a24 : 85 10 __ STA P3 ; (fmt + 1)
3a26 : a9 e8 __ LDA #$e8
3a28 : 85 0d __ STA P0 ; (str + 0)
3a2a : a9 bf __ LDA #$bf
3a2c : 85 0e __ STA P1 ; (str + 1)
3a2e : 20 94 30 JSR $3094 ; (nforml@proxy + 0)
3a31 : a5 1b __ LDA ACCU + 0 
3a33 : 4c ad 37 JMP $37ad ; (sprintf.s1068 + 0)
.s285:
3a36 : a9 00 __ LDA #$00
.s261:
3a38 : 85 13 __ STA P6 
3a3a : a5 4b __ LDA T3 + 0 
3a3c : 85 0f __ STA P2 ; (fmt + 0)
3a3e : a5 4c __ LDA T3 + 1 
3a40 : 85 10 __ STA P3 ; (fmt + 1)
3a42 : a0 00 __ LDY #$00
3a44 : b1 47 __ LDA (T0 + 0),y 
3a46 : 85 11 __ STA P4 ; (fmt + 2)
3a48 : c8 __ __ INY
3a49 : b1 47 __ LDA (T0 + 0),y 
3a4b : 85 12 __ STA P5 ; (fmt + 3)
3a4d : a9 e8 __ LDA #$e8
3a4f : 85 0d __ STA P0 ; (str + 0)
3a51 : a9 bf __ LDA #$bf
3a53 : 85 0e __ STA P1 ; (str + 1)
3a55 : 20 5f 2f JSR $2f5f ; (nformi.s0 + 0)
3a58 : a5 1b __ LDA ACCU + 0 
3a5a : 85 43 __ STA T1 + 0 
3a5c : 4c 38 39 JMP $3938 ; (sprintf.s258 + 0)
.s260:
3a5f : a0 00 __ LDY #$00
3a61 : b1 49 __ LDA (T2 + 0),y 
3a63 : aa __ __ TAX
3a64 : 18 __ __ CLC
3a65 : a5 49 __ LDA T2 + 0 
3a67 : 69 01 __ ADC #$01
3a69 : 4c eb 37 JMP $37eb ; (sprintf.l15 + 0)
--------------------------------------------------------------------
3a6c : __ __ __ BYT 76 64 63 20 6d 45 4d 4f 52 59 20 64 45 54 45 43 : vdc mEMORY dETEC
3a7c : __ __ __ BYT 54 45 44 3a 20 25 44 20 6b 62 2c 20 53 43 52 45 : TED: %D kb, SCRE
3a8c : __ __ __ BYT 45 4e 20 53 49 5a 45 3a 20 25 44 58 25 44 2c 20 : EN SIZE: %DX%D, 
3a9c : __ __ __ BYT 45 58 54 2e 4d 45 4d 3a 20 25 53 00             : EXT.MEM: %S.
--------------------------------------------------------------------
3aa8 : __ __ __ BYT 6f 4e 20 00                                     : oN .
--------------------------------------------------------------------
3aac : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
mul16by8: ; mul16by8
3ab0 : a0 00 __ LDY #$00
3ab2 : 84 06 __ STY WORK + 3 
3ab4 : 4a __ __ LSR
3ab5 : 90 0d __ BCC $3ac4 ; (mul16by8 + 20)
3ab7 : aa __ __ TAX
3ab8 : 18 __ __ CLC
3ab9 : 98 __ __ TYA
3aba : 65 1b __ ADC ACCU + 0 
3abc : a8 __ __ TAY
3abd : a5 06 __ LDA WORK + 3 
3abf : 65 1c __ ADC ACCU + 1 
3ac1 : 85 06 __ STA WORK + 3 
3ac3 : 8a __ __ TXA
3ac4 : 06 1b __ ASL ACCU + 0 
3ac6 : 26 1c __ ROL ACCU + 1 
3ac8 : 4a __ __ LSR
3ac9 : b0 ec __ BCS $3ab7 ; (mul16by8 + 7)
3acb : d0 f7 __ BNE $3ac4 ; (mul16by8 + 20)
3acd : 84 05 __ STY WORK + 2 
3acf : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
3ad0 : a5 1c __ LDA ACCU + 1 
3ad2 : d0 31 __ BNE $3b05 ; (divmod + 53)
3ad4 : a5 04 __ LDA WORK + 1 
3ad6 : d0 1e __ BNE $3af6 ; (divmod + 38)
3ad8 : 85 06 __ STA WORK + 3 
3ada : a2 04 __ LDX #$04
3adc : 06 1b __ ASL ACCU + 0 
3ade : 2a __ __ ROL
3adf : c5 03 __ CMP WORK + 0 
3ae1 : 90 02 __ BCC $3ae5 ; (divmod + 21)
3ae3 : e5 03 __ SBC WORK + 0 
3ae5 : 26 1b __ ROL ACCU + 0 
3ae7 : 2a __ __ ROL
3ae8 : c5 03 __ CMP WORK + 0 
3aea : 90 02 __ BCC $3aee ; (divmod + 30)
3aec : e5 03 __ SBC WORK + 0 
3aee : 26 1b __ ROL ACCU + 0 
3af0 : ca __ __ DEX
3af1 : d0 eb __ BNE $3ade ; (divmod + 14)
3af3 : 85 05 __ STA WORK + 2 
3af5 : 60 __ __ RTS
3af6 : a5 1b __ LDA ACCU + 0 
3af8 : 85 05 __ STA WORK + 2 
3afa : a5 1c __ LDA ACCU + 1 
3afc : 85 06 __ STA WORK + 3 
3afe : a9 00 __ LDA #$00
3b00 : 85 1b __ STA ACCU + 0 
3b02 : 85 1c __ STA ACCU + 1 
3b04 : 60 __ __ RTS
3b05 : a5 04 __ LDA WORK + 1 
3b07 : d0 1f __ BNE $3b28 ; (divmod + 88)
3b09 : a5 03 __ LDA WORK + 0 
3b0b : 30 1b __ BMI $3b28 ; (divmod + 88)
3b0d : a9 00 __ LDA #$00
3b0f : 85 06 __ STA WORK + 3 
3b11 : a2 10 __ LDX #$10
3b13 : 06 1b __ ASL ACCU + 0 
3b15 : 26 1c __ ROL ACCU + 1 
3b17 : 2a __ __ ROL
3b18 : c5 03 __ CMP WORK + 0 
3b1a : 90 02 __ BCC $3b1e ; (divmod + 78)
3b1c : e5 03 __ SBC WORK + 0 
3b1e : 26 1b __ ROL ACCU + 0 
3b20 : 26 1c __ ROL ACCU + 1 
3b22 : ca __ __ DEX
3b23 : d0 f2 __ BNE $3b17 ; (divmod + 71)
3b25 : 85 05 __ STA WORK + 2 
3b27 : 60 __ __ RTS
3b28 : a9 00 __ LDA #$00
3b2a : 85 05 __ STA WORK + 2 
3b2c : 85 06 __ STA WORK + 3 
3b2e : 84 02 __ STY $02 
3b30 : a0 10 __ LDY #$10
3b32 : 18 __ __ CLC
3b33 : 26 1b __ ROL ACCU + 0 
3b35 : 26 1c __ ROL ACCU + 1 
3b37 : 26 05 __ ROL WORK + 2 
3b39 : 26 06 __ ROL WORK + 3 
3b3b : 38 __ __ SEC
3b3c : a5 05 __ LDA WORK + 2 
3b3e : e5 03 __ SBC WORK + 0 
3b40 : aa __ __ TAX
3b41 : a5 06 __ LDA WORK + 3 
3b43 : e5 04 __ SBC WORK + 1 
3b45 : 90 04 __ BCC $3b4b ; (divmod + 123)
3b47 : 86 05 __ STX WORK + 2 
3b49 : 85 06 __ STA WORK + 3 
3b4b : 88 __ __ DEY
3b4c : d0 e5 __ BNE $3b33 ; (divmod + 99)
3b4e : 26 1b __ ROL ACCU + 0 
3b50 : 26 1c __ ROL ACCU + 1 
3b52 : a4 02 __ LDY $02 
3b54 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
3b55 : 84 02 __ STY $02 
3b57 : a0 20 __ LDY #$20
3b59 : a9 00 __ LDA #$00
3b5b : 85 07 __ STA WORK + 4 
3b5d : 85 08 __ STA WORK + 5 
3b5f : 85 09 __ STA WORK + 6 
3b61 : 85 0a __ STA WORK + 7 
3b63 : a5 05 __ LDA WORK + 2 
3b65 : 05 06 __ ORA WORK + 3 
3b67 : d0 39 __ BNE $3ba2 ; (divmod32 + 77)
3b69 : 18 __ __ CLC
3b6a : 26 1b __ ROL ACCU + 0 
3b6c : 26 1c __ ROL ACCU + 1 
3b6e : 26 1d __ ROL ACCU + 2 
3b70 : 26 1e __ ROL ACCU + 3 
3b72 : 26 07 __ ROL WORK + 4 
3b74 : 26 08 __ ROL WORK + 5 
3b76 : 90 0c __ BCC $3b84 ; (divmod32 + 47)
3b78 : a5 07 __ LDA WORK + 4 
3b7a : e5 03 __ SBC WORK + 0 
3b7c : aa __ __ TAX
3b7d : a5 08 __ LDA WORK + 5 
3b7f : e5 04 __ SBC WORK + 1 
3b81 : 38 __ __ SEC
3b82 : b0 0c __ BCS $3b90 ; (divmod32 + 59)
3b84 : 38 __ __ SEC
3b85 : a5 07 __ LDA WORK + 4 
3b87 : e5 03 __ SBC WORK + 0 
3b89 : aa __ __ TAX
3b8a : a5 08 __ LDA WORK + 5 
3b8c : e5 04 __ SBC WORK + 1 
3b8e : 90 04 __ BCC $3b94 ; (divmod32 + 63)
3b90 : 86 07 __ STX WORK + 4 
3b92 : 85 08 __ STA WORK + 5 
3b94 : 88 __ __ DEY
3b95 : d0 d3 __ BNE $3b6a ; (divmod32 + 21)
3b97 : 26 1b __ ROL ACCU + 0 
3b99 : 26 1c __ ROL ACCU + 1 
3b9b : 26 1d __ ROL ACCU + 2 
3b9d : 26 1e __ ROL ACCU + 3 
3b9f : a4 02 __ LDY $02 
3ba1 : 60 __ __ RTS
3ba2 : 18 __ __ CLC
3ba3 : 26 1b __ ROL ACCU + 0 
3ba5 : 26 1c __ ROL ACCU + 1 
3ba7 : 26 1d __ ROL ACCU + 2 
3ba9 : 26 1e __ ROL ACCU + 3 
3bab : 26 07 __ ROL WORK + 4 
3bad : 26 08 __ ROL WORK + 5 
3baf : 26 09 __ ROL WORK + 6 
3bb1 : 26 0a __ ROL WORK + 7 
3bb3 : a5 07 __ LDA WORK + 4 
3bb5 : c5 03 __ CMP WORK + 0 
3bb7 : a5 08 __ LDA WORK + 5 
3bb9 : e5 04 __ SBC WORK + 1 
3bbb : a5 09 __ LDA WORK + 6 
3bbd : e5 05 __ SBC WORK + 2 
3bbf : a5 0a __ LDA WORK + 7 
3bc1 : e5 06 __ SBC WORK + 3 
3bc3 : 90 18 __ BCC $3bdd ; (divmod32 + 136)
3bc5 : a5 07 __ LDA WORK + 4 
3bc7 : e5 03 __ SBC WORK + 0 
3bc9 : 85 07 __ STA WORK + 4 
3bcb : a5 08 __ LDA WORK + 5 
3bcd : e5 04 __ SBC WORK + 1 
3bcf : 85 08 __ STA WORK + 5 
3bd1 : a5 09 __ LDA WORK + 6 
3bd3 : e5 05 __ SBC WORK + 2 
3bd5 : 85 09 __ STA WORK + 6 
3bd7 : a5 0a __ LDA WORK + 7 
3bd9 : e5 06 __ SBC WORK + 3 
3bdb : 85 0a __ STA WORK + 7 
3bdd : 88 __ __ DEY
3bde : d0 c3 __ BNE $3ba3 ; (divmod32 + 78)
3be0 : 26 1b __ ROL ACCU + 0 
3be2 : 26 1c __ ROL ACCU + 1 
3be4 : 26 1d __ ROL ACCU + 2 
3be6 : 26 1e __ ROL ACCU + 3 
3be8 : a4 02 __ LDY $02 
3bea : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
3beb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
3bec : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
vdc_modes:
3c00 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
3c10 : __ __ __ BYT 30 00 40 00 7f 04 26 06 19 07 20 08 fc 09 e7 ff : 0.@...&... .....
3c20 : __ __ __ BYT 50 00 32 00 01 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
3c30 : __ __ __ BYT 30 00 60 00 80 04 40 06 32 07 3a 08 03 09 07 ff : 0.`...@.2.:.....
--------------------------------------------------------------------
vdc_state:
3c40 : __ __ __ BSS	22
--------------------------------------------------------------------
linebuffer:
3c56 : __ __ __ BSS	81
