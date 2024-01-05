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
1c0d : ba __ __ TSX
1c0e : 8e 8a 32 STX $328a ; (spentry + 0)
1c11 : a9 00 __ LDA #$00
1c13 : 85 19 __ STA IP + 0 
1c15 : a9 34 __ LDA #$34
1c17 : 85 1a __ STA IP + 1 
1c19 : 38 __ __ SEC
1c1a : a9 34 __ LDA #$34
1c1c : e9 34 __ SBC #$34
1c1e : f0 0f __ BEQ $1c2f ; (startup + 46)
1c20 : aa __ __ TAX
1c21 : a9 00 __ LDA #$00
1c23 : a0 00 __ LDY #$00
1c25 : 91 19 __ STA (IP + 0),y 
1c27 : c8 __ __ INY
1c28 : d0 fb __ BNE $1c25 ; (startup + 36)
1c2a : e6 1a __ INC IP + 1 
1c2c : ca __ __ DEX
1c2d : d0 f6 __ BNE $1c25 ; (startup + 36)
1c2f : 38 __ __ SEC
1c30 : a9 00 __ LDA #$00
1c32 : e9 00 __ SBC #$00
1c34 : f0 08 __ BEQ $1c3e ; (startup + 61)
1c36 : a8 __ __ TAY
1c37 : a9 00 __ LDA #$00
1c39 : 88 __ __ DEY
1c3a : 91 19 __ STA (IP + 0),y 
1c3c : d0 fb __ BNE $1c39 ; (startup + 56)
1c3e : a2 f7 __ LDX #$f7
1c40 : e0 f7 __ CPX #$f7
1c42 : f0 07 __ BEQ $1c4b ; (startup + 74)
1c44 : 95 00 __ STA $00,x 
1c46 : e8 __ __ INX
1c47 : e0 f7 __ CPX #$f7
1c49 : d0 f9 __ BNE $1c44 ; (startup + 67)
1c4b : a9 b0 __ LDA #$b0
1c4d : 85 23 __ STA SP + 0 
1c4f : a9 bf __ LDA #$bf
1c51 : 85 24 __ STA SP + 1 
1c53 : 20 80 1c JSR $1c80 ; (main.s1000 + 0)
1c56 : a9 4c __ LDA #$4c
1c58 : 85 54 __ STA $54 
1c5a : a9 00 __ LDA #$00
1c5c : 85 13 __ STA P6 
1c5e : a9 19 __ LDA #$19
1c60 : 85 16 __ STA P9 
1c62 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
328a : __ __ __ BYT 00                                              : .
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
1c8b : a9 0e __ LDA #$0e
1c8d : 8d 00 ff STA $ff00 
1c90 : a5 d7 __ LDA $d7 
1c92 : 30 17 __ BMI $1cab ; (main.s13 + 0)
.s8:
1c94 : a9 a4 __ LDA #$a4
1c96 : a0 02 __ LDY #$02
1c98 : 91 23 __ STA (SP + 0),y 
1c9a : a9 2d __ LDA #$2d
1c9c : c8 __ __ INY
1c9d : 91 23 __ STA (SP + 0),y 
1c9f : 20 6d 27 JSR $276d ; (printf.s1000 + 0)
1ca2 : 20 cf 2d JSR $2dcf ; (getch.s0 + 0)
1ca5 : 20 0e 2e JSR $2e0e ; (clrscr.s0 + 0)
1ca8 : 20 12 2e JSR $2e12 ; (screen_setmode.s0 + 0)
.s13:
1cab : a9 01 __ LDA #$01
1cad : 8d 30 d0 STA $d030 
1cb0 : ad 11 d0 LDA $d011 
1cb3 : 29 6f __ AND #$6f
1cb5 : 8d 11 d0 STA $d011 
1cb8 : a9 1a __ LDA #$1a
1cba : 8d 00 d6 STA $d600 
.l4409:
1cbd : ad 00 d6 LDA $d600 
1cc0 : 10 fb __ BPL $1cbd ; (main.l4409 + 0)
.s22:
1cc2 : ad 01 d6 LDA $d601 
1cc5 : 29 f0 __ AND #$f0
1cc7 : aa __ __ TAX
1cc8 : a9 1a __ LDA #$1a
1cca : 8d 00 d6 STA $d600 
.l4411:
1ccd : ad 00 d6 LDA $d600 
1cd0 : 10 fb __ BPL $1ccd ; (main.l4411 + 0)
.s28:
1cd2 : 8e 01 d6 STX $d601 
1cd5 : a9 1a __ LDA #$1a
1cd7 : 8d 00 d6 STA $d600 
.l4413:
1cda : ad 00 d6 LDA $d600 
1cdd : 10 fb __ BPL $1cda ; (main.l4413 + 0)
.s35:
1cdf : ad 01 d6 LDA $d601 
1ce2 : 29 0f __ AND #$0f
1ce4 : 09 d0 __ ORA #$d0
1ce6 : aa __ __ TAX
1ce7 : a9 1a __ LDA #$1a
1ce9 : 8d 00 d6 STA $d600 
.l4415:
1cec : ad 00 d6 LDA $d600 
1cef : 10 fb __ BPL $1cec ; (main.l4415 + 0)
.s41:
1cf1 : 8e 01 d6 STX $d601 
1cf4 : a9 8d __ LDA #$8d
1cf6 : 8d 8c 32 STA $328c ; (vdc_text_attr + 0)
1cf9 : a9 00 __ LDA #$00
1cfb : 85 43 __ STA T0 + 0 
.l45:
1cfd : a9 12 __ LDA #$12
1cff : 8d 00 d6 STA $d600 
1d02 : a5 43 __ LDA T0 + 0 
1d04 : 0a __ __ ASL
1d05 : 0a __ __ ASL
1d06 : 65 43 __ ADC T0 + 0 
1d08 : 0a __ __ ASL
1d09 : 0a __ __ ASL
1d0a : 85 4f __ STA T1 + 0 
1d0c : a9 00 __ LDA #$00
1d0e : 2a __ __ ROL
1d0f : 06 4f __ ASL T1 + 0 
1d11 : 2a __ __ ROL
1d12 : 06 4f __ ASL T1 + 0 
1d14 : 2a __ __ ROL
1d15 : 85 50 __ STA T1 + 1 
.l4417:
1d17 : ad 00 d6 LDA $d600 
1d1a : 10 fb __ BPL $1d17 ; (main.l4417 + 0)
.s89:
1d1c : a5 50 __ LDA T1 + 1 
1d1e : 8d 01 d6 STA $d601 
1d21 : a9 13 __ LDA #$13
1d23 : 8d 00 d6 STA $d600 
.l4419:
1d26 : ad 00 d6 LDA $d600 
1d29 : 10 fb __ BPL $1d26 ; (main.l4419 + 0)
.s94:
1d2b : a5 4f __ LDA T1 + 0 
1d2d : 8d 01 d6 STA $d601 
1d30 : a9 1f __ LDA #$1f
1d32 : 8d 00 d6 STA $d600 
.l4421:
1d35 : ad 00 d6 LDA $d600 
1d38 : 10 fb __ BPL $1d35 ; (main.l4421 + 0)
.s98:
1d3a : a9 20 __ LDA #$20
1d3c : 8d 01 d6 STA $d601 
1d3f : a9 18 __ LDA #$18
1d41 : 8d 00 d6 STA $d600 
.l4423:
1d44 : ad 00 d6 LDA $d600 
1d47 : 10 fb __ BPL $1d44 ; (main.l4423 + 0)
.s104:
1d49 : ad 01 d6 LDA $d601 
1d4c : a2 18 __ LDX #$18
1d4e : 8e 00 d6 STX $d600 
1d51 : 29 7f __ AND #$7f
1d53 : a8 __ __ TAY
.l4425:
1d54 : ad 00 d6 LDA $d600 
1d57 : 10 fb __ BPL $1d54 ; (main.l4425 + 0)
.s110:
1d59 : 8c 01 d6 STY $d601 
1d5c : a9 1e __ LDA #$1e
1d5e : 8d 00 d6 STA $d600 
.l4427:
1d61 : ad 00 d6 LDA $d600 
1d64 : 10 fb __ BPL $1d61 ; (main.l4427 + 0)
.s115:
1d66 : a9 4f __ LDA #$4f
1d68 : 8d 01 d6 STA $d601 
1d6b : a9 12 __ LDA #$12
1d6d : 8d 00 d6 STA $d600 
1d70 : 18 __ __ CLC
1d71 : a5 50 __ LDA T1 + 1 
1d73 : 69 08 __ ADC #$08
1d75 : a8 __ __ TAY
.l4429:
1d76 : ad 00 d6 LDA $d600 
1d79 : 10 fb __ BPL $1d76 ; (main.l4429 + 0)
.s122:
1d7b : 8c 01 d6 STY $d601 
1d7e : a9 13 __ LDA #$13
1d80 : 8d 00 d6 STA $d600 
.l4431:
1d83 : ad 00 d6 LDA $d600 
1d86 : 10 fb __ BPL $1d83 ; (main.l4431 + 0)
.s127:
1d88 : a5 4f __ LDA T1 + 0 
1d8a : 8d 01 d6 STA $d601 
1d8d : a9 1f __ LDA #$1f
1d8f : 8d 00 d6 STA $d600 
.l4433:
1d92 : ad 00 d6 LDA $d600 
1d95 : 10 fb __ BPL $1d92 ; (main.l4433 + 0)
.s131:
1d97 : a9 20 __ LDA #$20
1d99 : 8d 01 d6 STA $d601 
1d9c : 8e 00 d6 STX $d600 
.l4435:
1d9f : ad 00 d6 LDA $d600 
1da2 : 10 fb __ BPL $1d9f ; (main.l4435 + 0)
.s137:
1da4 : ad 01 d6 LDA $d601 
1da7 : 8e 00 d6 STX $d600 
1daa : 29 7f __ AND #$7f
1dac : aa __ __ TAX
.l4437:
1dad : ad 00 d6 LDA $d600 
1db0 : 10 fb __ BPL $1dad ; (main.l4437 + 0)
.s143:
1db2 : 8e 01 d6 STX $d601 
1db5 : a9 1e __ LDA #$1e
1db7 : 8d 00 d6 STA $d600 
.l4439:
1dba : ad 00 d6 LDA $d600 
1dbd : 10 fb __ BPL $1dba ; (main.l4439 + 0)
.s148:
1dbf : a9 4f __ LDA #$4f
1dc1 : 8d 01 d6 STA $d601 
1dc4 : e6 43 __ INC T0 + 0 
1dc6 : a5 43 __ LDA T0 + 0 
1dc8 : c9 19 __ CMP #$19
1dca : b0 03 __ BCS $1dcf ; (main.s2 + 0)
1dcc : 4c fd 1c JMP $1cfd ; (main.l45 + 0)
.s2:
1dcf : ad 8c 32 LDA $328c ; (vdc_text_attr + 0)
1dd2 : 29 f0 __ AND #$f0
1dd4 : 09 29 __ ORA #$29
1dd6 : 8d 8c 32 STA $328c ; (vdc_text_attr + 0)
1dd9 : a2 00 __ LDX #$00
.l1384:
1ddb : bd 1b 2e LDA $2e1b,x 
1dde : e8 __ __ INX
1ddf : 09 00 __ ORA #$00
1de1 : d0 f8 __ BNE $1ddb ; (main.l1384 + 0)
.s1385:
1de3 : 86 4f __ STX T1 + 0 
1de5 : a9 12 __ LDA #$12
1de7 : 8d 00 d6 STA $d600 
.l4442:
1dea : ad 00 d6 LDA $d600 
1ded : 10 fb __ BPL $1dea ; (main.l4442 + 0)
.s168:
1def : a9 00 __ LDA #$00
1df1 : 8d 01 d6 STA $d601 
1df4 : a9 13 __ LDA #$13
1df6 : 8d 00 d6 STA $d600 
.l4444:
1df9 : ad 00 d6 LDA $d600 
1dfc : 10 fb __ BPL $1df9 ; (main.l4444 + 0)
.s173:
1dfe : a9 00 __ LDA #$00
1e00 : 8d 01 d6 STA $d601 
1e03 : a9 1f __ LDA #$1f
1e05 : 8d 00 d6 STA $d600 
1e08 : 8a __ __ TXA
1e09 : f0 65 __ BEQ $1e70 ; (main.s178 + 0)
.s1265:
1e0b : a2 00 __ LDX #$00
.l176:
1e0d : bc 1a 2e LDY $2e1a,x 
1e10 : b9 00 33 LDA $3300,y ; (ascToPetTable + 0)
1e13 : c9 20 __ CMP #$20
1e15 : b0 05 __ BCS $1e1c ; (main.s182 + 0)
.s181:
1e17 : 69 80 __ ADC #$80
1e19 : 4c 62 1e JMP $1e62 ; (main.s1392 + 0)
.s182:
1e1c : a8 __ __ TAY
1e1d : c9 40 __ CMP #$40
1e1f : 90 04 __ BCC $1e25 ; (main.s185 + 0)
.s187:
1e21 : c9 60 __ CMP #$60
1e23 : 90 23 __ BCC $1e48 ; (main.s184 + 0)
.s185:
1e25 : c9 60 __ CMP #$60
1e27 : 90 0a __ BCC $1e33 ; (main.s189 + 0)
.s191:
1e29 : 09 00 __ ORA #$00
1e2b : 30 06 __ BMI $1e33 ; (main.s189 + 0)
.s188:
1e2d : 38 __ __ SEC
1e2e : e9 20 __ SBC #$20
1e30 : 4c 62 1e JMP $1e62 ; (main.s1392 + 0)
.s189:
1e33 : c9 80 __ CMP #$80
1e35 : 90 09 __ BCC $1e40 ; (main.s193 + 0)
.s195:
1e37 : c9 a0 __ CMP #$a0
1e39 : b0 05 __ BCS $1e40 ; (main.s193 + 0)
.s192:
1e3b : 69 40 __ ADC #$40
1e3d : 4c 62 1e JMP $1e62 ; (main.s1392 + 0)
.s193:
1e40 : c9 a0 __ CMP #$a0
1e42 : 90 0a __ BCC $1e4e ; (main.s197 + 0)
.s199:
1e44 : c9 c0 __ CMP #$c0
1e46 : b0 06 __ BCS $1e4e ; (main.s197 + 0)
.s184:
1e48 : 38 __ __ SEC
1e49 : e9 40 __ SBC #$40
1e4b : 4c 62 1e JMP $1e62 ; (main.s1392 + 0)
.s197:
1e4e : c9 c0 __ CMP #$c0
1e50 : 90 0a __ BCC $1e5c ; (main.s201 + 0)
.s203:
1e52 : c9 ff __ CMP #$ff
1e54 : b0 06 __ BCS $1e5c ; (main.s201 + 0)
.s200:
1e56 : 38 __ __ SEC
1e57 : e9 80 __ SBC #$80
1e59 : 4c 62 1e JMP $1e62 ; (main.s1392 + 0)
.s201:
1e5c : c9 ff __ CMP #$ff
1e5e : d0 03 __ BNE $1e63 ; (main.l4448 + 0)
.s204:
1e60 : a9 5e __ LDA #$5e
.s1392:
1e62 : a8 __ __ TAY
.l4448:
1e63 : ad 00 d6 LDA $d600 
1e66 : 10 fb __ BPL $1e63 ; (main.l4448 + 0)
.s209:
1e68 : 8c 01 d6 STY $d601 
1e6b : e8 __ __ INX
1e6c : e4 4f __ CPX T1 + 0 
1e6e : 90 9d __ BCC $1e0d ; (main.l176 + 0)
.s178:
1e70 : a9 12 __ LDA #$12
1e72 : 8d 00 d6 STA $d600 
1e75 : c6 4f __ DEC T1 + 0 
1e77 : ae 8c 32 LDX $328c ; (vdc_text_attr + 0)
.l4451:
1e7a : ad 00 d6 LDA $d600 
1e7d : 10 fb __ BPL $1e7a ; (main.l4451 + 0)
.s216:
1e7f : a9 08 __ LDA #$08
1e81 : 8d 01 d6 STA $d601 
1e84 : a9 13 __ LDA #$13
1e86 : 8d 00 d6 STA $d600 
.l4453:
1e89 : ad 00 d6 LDA $d600 
1e8c : 10 fb __ BPL $1e89 ; (main.l4453 + 0)
.s221:
1e8e : a9 00 __ LDA #$00
1e90 : 8d 01 d6 STA $d601 
1e93 : a9 1f __ LDA #$1f
1e95 : 8d 00 d6 STA $d600 
.l4455:
1e98 : ad 00 d6 LDA $d600 
1e9b : 10 fb __ BPL $1e98 ; (main.l4455 + 0)
.s225:
1e9d : 8e 01 d6 STX $d601 
1ea0 : a9 18 __ LDA #$18
1ea2 : 8d 00 d6 STA $d600 
.l4457:
1ea5 : ad 00 d6 LDA $d600 
1ea8 : 10 fb __ BPL $1ea5 ; (main.l4457 + 0)
.s231:
1eaa : ad 01 d6 LDA $d601 
1ead : 29 7f __ AND #$7f
1eaf : a8 __ __ TAY
1eb0 : a9 18 __ LDA #$18
1eb2 : 8d 00 d6 STA $d600 
.l4459:
1eb5 : ad 00 d6 LDA $d600 
1eb8 : 10 fb __ BPL $1eb5 ; (main.l4459 + 0)
.s237:
1eba : 8c 01 d6 STY $d601 
1ebd : a9 1e __ LDA #$1e
1ebf : 8d 00 d6 STA $d600 
.l4461:
1ec2 : ad 00 d6 LDA $d600 
1ec5 : 10 fb __ BPL $1ec2 ; (main.l4461 + 0)
.s242:
1ec7 : a5 4f __ LDA T1 + 0 
1ec9 : 8d 01 d6 STA $d601 
1ecc : 8a __ __ TXA
1ecd : 29 df __ AND #$df
1ecf : 85 4f __ STA T1 + 0 
1ed1 : 8d 8c 32 STA $328c ; (vdc_text_attr + 0)
1ed4 : 20 cf 2d JSR $2dcf ; (getch.s0 + 0)
1ed7 : a9 16 __ LDA #$16
1ed9 : 8d 00 d6 STA $d600 
.l4463:
1edc : ad 00 d6 LDA $d600 
1edf : 10 fb __ BPL $1edc ; (main.l4463 + 0)
.s249:
1ee1 : a9 00 __ LDA #$00
1ee3 : 8d 01 d6 STA $d601 
1ee6 : 20 cf 2d JSR $2dcf ; (getch.s0 + 0)
1ee9 : a9 16 __ LDA #$16
1eeb : 8d 00 d6 STA $d600 
.l4465:
1eee : ad 00 d6 LDA $d600 
1ef1 : 10 fb __ BPL $1eee ; (main.l4465 + 0)
.s255:
1ef3 : a9 7d __ LDA #$7d
1ef5 : 8d 01 d6 STA $d601 
1ef8 : a9 1c __ LDA #$1c
1efa : 8d 00 d6 STA $d600 
.l4467:
1efd : ad 00 d6 LDA $d600 
1f00 : 10 fb __ BPL $1efd ; (main.l4467 + 0)
.s261:
1f02 : ad 01 d6 LDA $d601 
1f05 : aa __ __ TAX
1f06 : 09 10 __ ORA #$10
1f08 : a8 __ __ TAY
1f09 : a9 1c __ LDA #$1c
1f0b : 8d 00 d6 STA $d600 
.l4469:
1f0e : ad 00 d6 LDA $d600 
1f11 : 10 fb __ BPL $1f0e ; (main.l4469 + 0)
.s268:
1f13 : 8c 01 d6 STY $d601 
1f16 : a9 12 __ LDA #$12
1f18 : 8d 00 d6 STA $d600 
.l4471:
1f1b : ad 00 d6 LDA $d600 
1f1e : 10 fb __ BPL $1f1b ; (main.l4471 + 0)
.s275:
1f20 : a9 1f __ LDA #$1f
1f22 : 8d 01 d6 STA $d601 
1f25 : a9 13 __ LDA #$13
1f27 : 8d 00 d6 STA $d600 
.l4473:
1f2a : ad 00 d6 LDA $d600 
1f2d : 10 fb __ BPL $1f2a ; (main.l4473 + 0)
.s280:
1f2f : a9 ff __ LDA #$ff
1f31 : 8d 01 d6 STA $d601 
1f34 : a9 1f __ LDA #$1f
1f36 : 8d 00 d6 STA $d600 
.l4475:
1f39 : ad 00 d6 LDA $d600 
1f3c : 10 fb __ BPL $1f39 ; (main.l4475 + 0)
.s284:
1f3e : a9 00 __ LDA #$00
1f40 : 8d 01 d6 STA $d601 
1f43 : a9 12 __ LDA #$12
1f45 : 8d 00 d6 STA $d600 
.l4477:
1f48 : ad 00 d6 LDA $d600 
1f4b : 10 fb __ BPL $1f48 ; (main.l4477 + 0)
.s291:
1f4d : a9 9f __ LDA #$9f
1f4f : 8d 01 d6 STA $d601 
1f52 : a9 13 __ LDA #$13
1f54 : 8d 00 d6 STA $d600 
.l4479:
1f57 : ad 00 d6 LDA $d600 
1f5a : 10 fb __ BPL $1f57 ; (main.l4479 + 0)
.s296:
1f5c : a9 ff __ LDA #$ff
1f5e : 8d 01 d6 STA $d601 
1f61 : a9 1f __ LDA #$1f
1f63 : 8d 00 d6 STA $d600 
.l4481:
1f66 : ad 00 d6 LDA $d600 
1f69 : 10 fb __ BPL $1f66 ; (main.l4481 + 0)
.s300:
1f6b : a9 ff __ LDA #$ff
1f6d : 8d 01 d6 STA $d601 
1f70 : a9 12 __ LDA #$12
1f72 : 8d 00 d6 STA $d600 
.l4483:
1f75 : ad 00 d6 LDA $d600 
1f78 : 10 fb __ BPL $1f75 ; (main.l4483 + 0)
.s307:
1f7a : a9 1f __ LDA #$1f
1f7c : 8d 01 d6 STA $d601 
1f7f : a9 13 __ LDA #$13
1f81 : 8d 00 d6 STA $d600 
.l4485:
1f84 : ad 00 d6 LDA $d600 
1f87 : 10 fb __ BPL $1f84 ; (main.l4485 + 0)
.s312:
1f89 : a9 ff __ LDA #$ff
1f8b : 8d 01 d6 STA $d601 
1f8e : a9 1f __ LDA #$1f
1f90 : 8d 00 d6 STA $d600 
.l4487:
1f93 : ad 00 d6 LDA $d600 
1f96 : 10 fb __ BPL $1f93 ; (main.l4487 + 0)
.s316:
1f98 : ad 01 d6 LDA $d601 
1f9b : f0 04 __ BEQ $1fa1 ; (main.s1400 + 0)
.s1401:
1f9d : a9 10 __ LDA #$10
1f9f : d0 02 __ BNE $1fa3 ; (main.s1402 + 0)
.s1400:
1fa1 : a9 40 __ LDA #$40
.s1402:
1fa3 : 85 45 __ STA T3 + 0 
1fa5 : a9 1c __ LDA #$1c
1fa7 : 8d 00 d6 STA $d600 
.l4490:
1faa : ad 00 d6 LDA $d600 
1fad : 10 fb __ BPL $1faa ; (main.l4490 + 0)
.s323:
1faf : 8e 01 d6 STX $d601 
1fb2 : a5 4f __ LDA T1 + 0 
1fb4 : 29 f0 __ AND #$f0
1fb6 : 09 0d __ ORA #$0d
1fb8 : 8d 8c 32 STA $328c ; (vdc_text_attr + 0)
1fbb : a9 8d __ LDA #$8d
1fbd : a0 02 __ LDY #$02
1fbf : 91 23 __ STA (SP + 0),y 
1fc1 : a9 32 __ LDA #$32
1fc3 : c8 __ __ INY
1fc4 : 91 23 __ STA (SP + 0),y 
1fc6 : a9 2c __ LDA #$2c
1fc8 : c8 __ __ INY
1fc9 : 91 23 __ STA (SP + 0),y 
1fcb : a9 31 __ LDA #$31
1fcd : c8 __ __ INY
1fce : 91 23 __ STA (SP + 0),y 
1fd0 : a5 45 __ LDA T3 + 0 
1fd2 : c8 __ __ INY
1fd3 : 91 23 __ STA (SP + 0),y 
1fd5 : a9 00 __ LDA #$00
1fd7 : 85 4f __ STA T1 + 0 
1fd9 : c8 __ __ INY
1fda : 91 23 __ STA (SP + 0),y 
1fdc : 20 20 2e JSR $2e20 ; (sprintf.s1000 + 0)
1fdf : ad 8d 32 LDA $328d ; (linebuffer + 0)
1fe2 : f0 0c __ BEQ $1ff0 ; (main.s335 + 0)
.s334:
1fe4 : a2 00 __ LDX #$00
.l1386:
1fe6 : bd 8e 32 LDA $328e,x ; (linebuffer + 1)
1fe9 : e8 __ __ INX
1fea : 09 00 __ ORA #$00
1fec : d0 f8 __ BNE $1fe6 ; (main.l1386 + 0)
.s1387:
1fee : 86 4f __ STX T1 + 0 
.s335:
1ff0 : a9 12 __ LDA #$12
1ff2 : 8d 00 d6 STA $d600 
.l4494:
1ff5 : ad 00 d6 LDA $d600 
1ff8 : 10 fb __ BPL $1ff5 ; (main.l4494 + 0)
.s342:
1ffa : a9 00 __ LDA #$00
1ffc : 8d 01 d6 STA $d601 
1fff : a9 13 __ LDA #$13
2001 : 8d 00 d6 STA $d600 
.l4496:
2004 : ad 00 d6 LDA $d600 
2007 : 10 fb __ BPL $2004 ; (main.l4496 + 0)
.s347:
2009 : a9 a0 __ LDA #$a0
200b : 8d 01 d6 STA $d601 
200e : a9 1f __ LDA #$1f
2010 : 8d 00 d6 STA $d600 
2013 : a5 4f __ LDA T1 + 0 
2015 : f0 65 __ BEQ $207c ; (main.s352 + 0)
.s1240:
2017 : a2 00 __ LDX #$00
.l350:
2019 : bc 8d 32 LDY $328d,x ; (linebuffer + 0)
201c : b9 00 33 LDA $3300,y ; (ascToPetTable + 0)
201f : c9 20 __ CMP #$20
2021 : b0 05 __ BCS $2028 ; (main.s356 + 0)
.s355:
2023 : 69 80 __ ADC #$80
2025 : 4c 6e 20 JMP $206e ; (main.s1393 + 0)
.s356:
2028 : a8 __ __ TAY
2029 : c9 40 __ CMP #$40
202b : 90 04 __ BCC $2031 ; (main.s359 + 0)
.s361:
202d : c9 60 __ CMP #$60
202f : 90 23 __ BCC $2054 ; (main.s358 + 0)
.s359:
2031 : c9 60 __ CMP #$60
2033 : 90 0a __ BCC $203f ; (main.s363 + 0)
.s365:
2035 : 09 00 __ ORA #$00
2037 : 30 06 __ BMI $203f ; (main.s363 + 0)
.s362:
2039 : 38 __ __ SEC
203a : e9 20 __ SBC #$20
203c : 4c 6e 20 JMP $206e ; (main.s1393 + 0)
.s363:
203f : c9 80 __ CMP #$80
2041 : 90 09 __ BCC $204c ; (main.s367 + 0)
.s369:
2043 : c9 a0 __ CMP #$a0
2045 : b0 05 __ BCS $204c ; (main.s367 + 0)
.s366:
2047 : 69 40 __ ADC #$40
2049 : 4c 6e 20 JMP $206e ; (main.s1393 + 0)
.s367:
204c : c9 a0 __ CMP #$a0
204e : 90 0a __ BCC $205a ; (main.s371 + 0)
.s373:
2050 : c9 c0 __ CMP #$c0
2052 : b0 06 __ BCS $205a ; (main.s371 + 0)
.s358:
2054 : 38 __ __ SEC
2055 : e9 40 __ SBC #$40
2057 : 4c 6e 20 JMP $206e ; (main.s1393 + 0)
.s371:
205a : c9 c0 __ CMP #$c0
205c : 90 0a __ BCC $2068 ; (main.s375 + 0)
.s377:
205e : c9 ff __ CMP #$ff
2060 : b0 06 __ BCS $2068 ; (main.s375 + 0)
.s374:
2062 : 38 __ __ SEC
2063 : e9 80 __ SBC #$80
2065 : 4c 6e 20 JMP $206e ; (main.s1393 + 0)
.s375:
2068 : c9 ff __ CMP #$ff
206a : d0 03 __ BNE $206f ; (main.l4500 + 0)
.s378:
206c : a9 5e __ LDA #$5e
.s1393:
206e : a8 __ __ TAY
.l4500:
206f : ad 00 d6 LDA $d600 
2072 : 10 fb __ BPL $206f ; (main.l4500 + 0)
.s383:
2074 : 8c 01 d6 STY $d601 
2077 : e8 __ __ INX
2078 : e4 4f __ CPX T1 + 0 
207a : 90 9d __ BCC $2019 ; (main.l350 + 0)
.s352:
207c : a9 12 __ LDA #$12
207e : 8d 00 d6 STA $d600 
2081 : c6 4f __ DEC T1 + 0 
2083 : ae 8c 32 LDX $328c ; (vdc_text_attr + 0)
.l4503:
2086 : ad 00 d6 LDA $d600 
2089 : 10 fb __ BPL $2086 ; (main.l4503 + 0)
.s390:
208b : a9 08 __ LDA #$08
208d : 8d 01 d6 STA $d601 
2090 : a9 13 __ LDA #$13
2092 : 8d 00 d6 STA $d600 
.l4505:
2095 : ad 00 d6 LDA $d600 
2098 : 10 fb __ BPL $2095 ; (main.l4505 + 0)
.s395:
209a : a9 a0 __ LDA #$a0
209c : 8d 01 d6 STA $d601 
209f : a9 1f __ LDA #$1f
20a1 : 8d 00 d6 STA $d600 
.l4507:
20a4 : ad 00 d6 LDA $d600 
20a7 : 10 fb __ BPL $20a4 ; (main.l4507 + 0)
.s399:
20a9 : 8e 01 d6 STX $d601 
20ac : a9 18 __ LDA #$18
20ae : 8d 00 d6 STA $d600 
.l4509:
20b1 : ad 00 d6 LDA $d600 
20b4 : 10 fb __ BPL $20b1 ; (main.l4509 + 0)
.s405:
20b6 : ad 01 d6 LDA $d601 
20b9 : 29 7f __ AND #$7f
20bb : aa __ __ TAX
20bc : a9 18 __ LDA #$18
20be : 8d 00 d6 STA $d600 
.l4511:
20c1 : ad 00 d6 LDA $d600 
20c4 : 10 fb __ BPL $20c1 ; (main.l4511 + 0)
.s411:
20c6 : 8e 01 d6 STX $d601 
20c9 : a9 1e __ LDA #$1e
20cb : 8d 00 d6 STA $d600 
.l4513:
20ce : ad 00 d6 LDA $d600 
20d1 : 10 fb __ BPL $20ce ; (main.l4513 + 0)
.s416:
20d3 : a5 4f __ LDA T1 + 0 
20d5 : 8d 01 d6 STA $d601 
20d8 : 20 cf 2d JSR $2dcf ; (getch.s0 + 0)
20db : a9 16 __ LDA #$16
20dd : 8d 00 d6 STA $d600 
.l4515:
20e0 : ad 00 d6 LDA $d600 
20e3 : 10 fb __ BPL $20e0 ; (main.l4515 + 0)
.s423:
20e5 : a2 00 __ LDX #$00
20e7 : 8e 01 d6 STX $d601 
20ea : a0 ff __ LDY #$ff
.l426:
20ec : a9 12 __ LDA #$12
20ee : 8d 00 d6 STA $d600 
.l4517:
20f1 : ad 00 d6 LDA $d600 
20f4 : 10 fb __ BPL $20f1 ; (main.l4517 + 0)
.s435:
20f6 : 8e 01 d6 STX $d601 
20f9 : a9 13 __ LDA #$13
20fb : 8d 00 d6 STA $d600 
.l4519:
20fe : ad 00 d6 LDA $d600 
2101 : 10 fb __ BPL $20fe ; (main.l4519 + 0)
.s440:
2103 : a9 00 __ LDA #$00
2105 : 8d 01 d6 STA $d601 
2108 : a9 1f __ LDA #$1f
210a : 8d 00 d6 STA $d600 
.l4521:
210d : ad 00 d6 LDA $d600 
2110 : 10 fb __ BPL $210d ; (main.l4521 + 0)
.s444:
2112 : a9 00 __ LDA #$00
2114 : 8d 01 d6 STA $d601 
2117 : a9 18 __ LDA #$18
2119 : 8d 00 d6 STA $d600 
.l4523:
211c : ad 00 d6 LDA $d600 
211f : 10 fb __ BPL $211c ; (main.l4523 + 0)
.s450:
2121 : ad 01 d6 LDA $d601 
2124 : 29 7f __ AND #$7f
2126 : 85 45 __ STA T3 + 0 
2128 : a9 18 __ LDA #$18
212a : 8d 00 d6 STA $d600 
.l4525:
212d : ad 00 d6 LDA $d600 
2130 : 10 fb __ BPL $212d ; (main.l4525 + 0)
.s456:
2132 : a5 45 __ LDA T3 + 0 
2134 : 8d 01 d6 STA $d601 
2137 : a9 1e __ LDA #$1e
2139 : 8d 00 d6 STA $d600 
.l4527:
213c : ad 00 d6 LDA $d600 
213f : 10 fb __ BPL $213c ; (main.l4527 + 0)
.s461:
2141 : a9 ff __ LDA #$ff
2143 : 8d 01 d6 STA $d601 
2146 : e8 __ __ INX
2147 : 88 __ __ DEY
2148 : d0 a2 __ BNE $20ec ; (main.l426 + 0)
.s428:
214a : a9 12 __ LDA #$12
214c : 8d 00 d6 STA $d600 
.l4530:
214f : ad 00 d6 LDA $d600 
2152 : 10 fb __ BPL $214f ; (main.l4530 + 0)
.s468:
2154 : 8e 01 d6 STX $d601 
2157 : a9 13 __ LDA #$13
2159 : 8d 00 d6 STA $d600 
.l4532:
215c : ad 00 d6 LDA $d600 
215f : 10 fb __ BPL $215c ; (main.l4532 + 0)
.s473:
2161 : 8c 01 d6 STY $d601 
2164 : a9 1f __ LDA #$1f
2166 : 8d 00 d6 STA $d600 
.l4534:
2169 : ad 00 d6 LDA $d600 
216c : 10 fb __ BPL $2169 ; (main.l4534 + 0)
.s477:
216e : 8c 01 d6 STY $d601 
2171 : a9 18 __ LDA #$18
2173 : 8d 00 d6 STA $d600 
.l4536:
2176 : ad 00 d6 LDA $d600 
2179 : 10 fb __ BPL $2176 ; (main.l4536 + 0)
.s483:
217b : ad 01 d6 LDA $d601 
217e : 29 7f __ AND #$7f
2180 : aa __ __ TAX
2181 : a9 18 __ LDA #$18
2183 : 8d 00 d6 STA $d600 
.l4538:
2186 : ad 00 d6 LDA $d600 
2189 : 10 fb __ BPL $2186 ; (main.l4538 + 0)
.s489:
218b : 8e 01 d6 STX $d601 
218e : a9 1e __ LDA #$1e
2190 : 8d 00 d6 STA $d600 
.l4540:
2193 : ad 00 d6 LDA $d600 
2196 : 10 fb __ BPL $2193 ; (main.l4540 + 0)
.s494:
2198 : a9 ff __ LDA #$ff
219a : 8d 01 d6 STA $d601 
219d : a9 1c __ LDA #$1c
219f : 8d 00 d6 STA $d600 
.l4542:
21a2 : ad 00 d6 LDA $d600 
21a5 : 10 fb __ BPL $21a2 ; (main.l4542 + 0)
.s500:
21a7 : ad 01 d6 LDA $d601 
21aa : 09 10 __ ORA #$10
21ac : aa __ __ TAX
21ad : a9 1c __ LDA #$1c
21af : 8d 00 d6 STA $d600 
.l4544:
21b2 : ad 00 d6 LDA $d600 
21b5 : 10 fb __ BPL $21b2 ; (main.l4544 + 0)
.s506:
21b7 : 8e 01 d6 STX $d601 
21ba : 20 44 31 JSR $3144 ; (vdc_restore_charsets.s0 + 0)
21bd : a9 00 __ LDA #$00
21bf : 85 43 __ STA T0 + 0 
.l510:
21c1 : a9 12 __ LDA #$12
21c3 : 8d 00 d6 STA $d600 
21c6 : a5 43 __ LDA T0 + 0 
21c8 : 0a __ __ ASL
21c9 : 0a __ __ ASL
21ca : 65 43 __ ADC T0 + 0 
21cc : 0a __ __ ASL
21cd : 0a __ __ ASL
21ce : 85 4f __ STA T1 + 0 
21d0 : a9 00 __ LDA #$00
21d2 : 2a __ __ ROL
21d3 : 06 4f __ ASL T1 + 0 
21d5 : 2a __ __ ROL
21d6 : 06 4f __ ASL T1 + 0 
21d8 : 2a __ __ ROL
21d9 : 85 50 __ STA T1 + 1 
.l4546:
21db : ad 00 d6 LDA $d600 
21de : 10 fb __ BPL $21db ; (main.l4546 + 0)
.s554:
21e0 : a5 50 __ LDA T1 + 1 
21e2 : 8d 01 d6 STA $d601 
21e5 : a9 13 __ LDA #$13
21e7 : 8d 00 d6 STA $d600 
.l4548:
21ea : ad 00 d6 LDA $d600 
21ed : 10 fb __ BPL $21ea ; (main.l4548 + 0)
.s559:
21ef : a5 4f __ LDA T1 + 0 
21f1 : 8d 01 d6 STA $d601 
21f4 : a9 1f __ LDA #$1f
21f6 : 8d 00 d6 STA $d600 
.l4550:
21f9 : ad 00 d6 LDA $d600 
21fc : 10 fb __ BPL $21f9 ; (main.l4550 + 0)
.s563:
21fe : a9 20 __ LDA #$20
2200 : 8d 01 d6 STA $d601 
2203 : a9 18 __ LDA #$18
2205 : 8d 00 d6 STA $d600 
.l4552:
2208 : ad 00 d6 LDA $d600 
220b : 10 fb __ BPL $2208 ; (main.l4552 + 0)
.s569:
220d : ad 01 d6 LDA $d601 
2210 : a2 18 __ LDX #$18
2212 : 8e 00 d6 STX $d600 
2215 : 29 7f __ AND #$7f
2217 : a8 __ __ TAY
.l4554:
2218 : ad 00 d6 LDA $d600 
221b : 10 fb __ BPL $2218 ; (main.l4554 + 0)
.s575:
221d : 8c 01 d6 STY $d601 
2220 : a9 1e __ LDA #$1e
2222 : 8d 00 d6 STA $d600 
.l4556:
2225 : ad 00 d6 LDA $d600 
2228 : 10 fb __ BPL $2225 ; (main.l4556 + 0)
.s580:
222a : a9 4f __ LDA #$4f
222c : 8d 01 d6 STA $d601 
222f : a9 12 __ LDA #$12
2231 : 8d 00 d6 STA $d600 
2234 : 18 __ __ CLC
2235 : a5 50 __ LDA T1 + 1 
2237 : 69 08 __ ADC #$08
2239 : a8 __ __ TAY
.l4558:
223a : ad 00 d6 LDA $d600 
223d : 10 fb __ BPL $223a ; (main.l4558 + 0)
.s587:
223f : 8c 01 d6 STY $d601 
2242 : a9 13 __ LDA #$13
2244 : 8d 00 d6 STA $d600 
.l4560:
2247 : ad 00 d6 LDA $d600 
224a : 10 fb __ BPL $2247 ; (main.l4560 + 0)
.s592:
224c : a5 4f __ LDA T1 + 0 
224e : 8d 01 d6 STA $d601 
2251 : a9 1f __ LDA #$1f
2253 : 8d 00 d6 STA $d600 
.l4562:
2256 : ad 00 d6 LDA $d600 
2259 : 10 fb __ BPL $2256 ; (main.l4562 + 0)
.s596:
225b : a9 20 __ LDA #$20
225d : 8d 01 d6 STA $d601 
2260 : 8e 00 d6 STX $d600 
.l4564:
2263 : ad 00 d6 LDA $d600 
2266 : 10 fb __ BPL $2263 ; (main.l4564 + 0)
.s602:
2268 : ad 01 d6 LDA $d601 
226b : 8e 00 d6 STX $d600 
226e : 29 7f __ AND #$7f
2270 : aa __ __ TAX
.l4566:
2271 : ad 00 d6 LDA $d600 
2274 : 10 fb __ BPL $2271 ; (main.l4566 + 0)
.s608:
2276 : 8e 01 d6 STX $d601 
2279 : a9 1e __ LDA #$1e
227b : 8d 00 d6 STA $d600 
.l4568:
227e : ad 00 d6 LDA $d600 
2281 : 10 fb __ BPL $227e ; (main.l4568 + 0)
.s613:
2283 : a9 4f __ LDA #$4f
2285 : 8d 01 d6 STA $d601 
2288 : e6 43 __ INC T0 + 0 
228a : a5 43 __ LDA T0 + 0 
228c : c9 19 __ CMP #$19
228e : b0 03 __ BCS $2293 ; (main.s507 + 0)
2290 : 4c c1 21 JMP $21c1 ; (main.l510 + 0)
.s507:
2293 : a9 16 __ LDA #$16
2295 : 8d 00 d6 STA $d600 
.l4570:
2298 : ad 00 d6 LDA $d600 
229b : 10 fb __ BPL $2298 ; (main.l4570 + 0)
.s619:
229d : a9 7d __ LDA #$7d
229f : 8d 01 d6 STA $d601 
22a2 : ad 8c 32 LDA $328c ; (vdc_text_attr + 0)
22a5 : 29 f0 __ AND #$f0
22a7 : 09 45 __ ORA #$45
22a9 : 8d 8c 32 STA $328c ; (vdc_text_attr + 0)
22ac : a2 00 __ LDX #$00
.l1388:
22ae : bd 49 31 LDA $3149,x 
22b1 : e8 __ __ INX
22b2 : 09 00 __ ORA #$00
22b4 : d0 f8 __ BNE $22ae ; (main.l1388 + 0)
.s1389:
22b6 : 86 4f __ STX T1 + 0 
22b8 : a9 12 __ LDA #$12
22ba : 8d 00 d6 STA $d600 
.l4573:
22bd : ad 00 d6 LDA $d600 
22c0 : 10 fb __ BPL $22bd ; (main.l4573 + 0)
.s639:
22c2 : a9 00 __ LDA #$00
22c4 : 8d 01 d6 STA $d601 
22c7 : a9 13 __ LDA #$13
22c9 : 8d 00 d6 STA $d600 
.l4575:
22cc : ad 00 d6 LDA $d600 
22cf : 10 fb __ BPL $22cc ; (main.l4575 + 0)
.s644:
22d1 : a9 00 __ LDA #$00
22d3 : 8d 01 d6 STA $d601 
22d6 : a9 1f __ LDA #$1f
22d8 : 8d 00 d6 STA $d600 
22db : 8a __ __ TXA
22dc : f0 65 __ BEQ $2343 ; (main.s649 + 0)
.s1211:
22de : a2 00 __ LDX #$00
.l647:
22e0 : bc 48 31 LDY $3148,x 
22e3 : b9 00 33 LDA $3300,y ; (ascToPetTable + 0)
22e6 : c9 20 __ CMP #$20
22e8 : b0 05 __ BCS $22ef ; (main.s653 + 0)
.s652:
22ea : 69 80 __ ADC #$80
22ec : 4c 35 23 JMP $2335 ; (main.s1394 + 0)
.s653:
22ef : a8 __ __ TAY
22f0 : c9 40 __ CMP #$40
22f2 : 90 04 __ BCC $22f8 ; (main.s656 + 0)
.s658:
22f4 : c9 60 __ CMP #$60
22f6 : 90 23 __ BCC $231b ; (main.s655 + 0)
.s656:
22f8 : c9 60 __ CMP #$60
22fa : 90 0a __ BCC $2306 ; (main.s660 + 0)
.s662:
22fc : 09 00 __ ORA #$00
22fe : 30 06 __ BMI $2306 ; (main.s660 + 0)
.s659:
2300 : 38 __ __ SEC
2301 : e9 20 __ SBC #$20
2303 : 4c 35 23 JMP $2335 ; (main.s1394 + 0)
.s660:
2306 : c9 80 __ CMP #$80
2308 : 90 09 __ BCC $2313 ; (main.s664 + 0)
.s666:
230a : c9 a0 __ CMP #$a0
230c : b0 05 __ BCS $2313 ; (main.s664 + 0)
.s663:
230e : 69 40 __ ADC #$40
2310 : 4c 35 23 JMP $2335 ; (main.s1394 + 0)
.s664:
2313 : c9 a0 __ CMP #$a0
2315 : 90 0a __ BCC $2321 ; (main.s668 + 0)
.s670:
2317 : c9 c0 __ CMP #$c0
2319 : b0 06 __ BCS $2321 ; (main.s668 + 0)
.s655:
231b : 38 __ __ SEC
231c : e9 40 __ SBC #$40
231e : 4c 35 23 JMP $2335 ; (main.s1394 + 0)
.s668:
2321 : c9 c0 __ CMP #$c0
2323 : 90 0a __ BCC $232f ; (main.s672 + 0)
.s674:
2325 : c9 ff __ CMP #$ff
2327 : b0 06 __ BCS $232f ; (main.s672 + 0)
.s671:
2329 : 38 __ __ SEC
232a : e9 80 __ SBC #$80
232c : 4c 35 23 JMP $2335 ; (main.s1394 + 0)
.s672:
232f : c9 ff __ CMP #$ff
2331 : d0 03 __ BNE $2336 ; (main.l4579 + 0)
.s675:
2333 : a9 5e __ LDA #$5e
.s1394:
2335 : a8 __ __ TAY
.l4579:
2336 : ad 00 d6 LDA $d600 
2339 : 10 fb __ BPL $2336 ; (main.l4579 + 0)
.s680:
233b : 8c 01 d6 STY $d601 
233e : e8 __ __ INX
233f : e4 4f __ CPX T1 + 0 
2341 : 90 9d __ BCC $22e0 ; (main.l647 + 0)
.s649:
2343 : a9 12 __ LDA #$12
2345 : 8d 00 d6 STA $d600 
2348 : c6 4f __ DEC T1 + 0 
234a : ae 8c 32 LDX $328c ; (vdc_text_attr + 0)
.l4582:
234d : ad 00 d6 LDA $d600 
2350 : 10 fb __ BPL $234d ; (main.l4582 + 0)
.s687:
2352 : a9 08 __ LDA #$08
2354 : 8d 01 d6 STA $d601 
2357 : a9 13 __ LDA #$13
2359 : 8d 00 d6 STA $d600 
.l4584:
235c : ad 00 d6 LDA $d600 
235f : 10 fb __ BPL $235c ; (main.l4584 + 0)
.s692:
2361 : a9 00 __ LDA #$00
2363 : 8d 01 d6 STA $d601 
2366 : a9 1f __ LDA #$1f
2368 : 8d 00 d6 STA $d600 
.l4586:
236b : ad 00 d6 LDA $d600 
236e : 10 fb __ BPL $236b ; (main.l4586 + 0)
.s696:
2370 : 8e 01 d6 STX $d601 
2373 : a9 18 __ LDA #$18
2375 : 8d 00 d6 STA $d600 
.l4588:
2378 : ad 00 d6 LDA $d600 
237b : 10 fb __ BPL $2378 ; (main.l4588 + 0)
.s702:
237d : ad 01 d6 LDA $d601 
2380 : 29 7f __ AND #$7f
2382 : a8 __ __ TAY
2383 : a9 18 __ LDA #$18
2385 : 8d 00 d6 STA $d600 
.l4590:
2388 : ad 00 d6 LDA $d600 
238b : 10 fb __ BPL $2388 ; (main.l4590 + 0)
.s708:
238d : 8c 01 d6 STY $d601 
2390 : a9 1e __ LDA #$1e
2392 : 8d 00 d6 STA $d600 
.l4592:
2395 : ad 00 d6 LDA $d600 
2398 : 10 fb __ BPL $2395 ; (main.l4592 + 0)
.s713:
239a : a5 4f __ LDA T1 + 0 
239c : 8d 01 d6 STA $d601 
239f : 8a __ __ TXA
23a0 : 29 b0 __ AND #$b0
23a2 : 09 0d __ ORA #$0d
23a4 : 8d 8c 32 STA $328c ; (vdc_text_attr + 0)
23a7 : 20 cf 2d JSR $2dcf ; (getch.s0 + 0)
23aa : a9 16 __ LDA #$16
23ac : 8d 00 d6 STA $d600 
.l4594:
23af : ad 00 d6 LDA $d600 
23b2 : 10 fb __ BPL $23af ; (main.l4594 + 0)
.s722:
23b4 : a2 00 __ LDX #$00
23b6 : 8e 01 d6 STX $d601 
23b9 : a0 ff __ LDY #$ff
.l725:
23bb : a9 12 __ LDA #$12
23bd : 8d 00 d6 STA $d600 
.l4596:
23c0 : ad 00 d6 LDA $d600 
23c3 : 10 fb __ BPL $23c0 ; (main.l4596 + 0)
.s734:
23c5 : 8e 01 d6 STX $d601 
23c8 : a9 13 __ LDA #$13
23ca : 8d 00 d6 STA $d600 
.l4598:
23cd : ad 00 d6 LDA $d600 
23d0 : 10 fb __ BPL $23cd ; (main.l4598 + 0)
.s739:
23d2 : a9 00 __ LDA #$00
23d4 : 8d 01 d6 STA $d601 
23d7 : a9 1f __ LDA #$1f
23d9 : 8d 00 d6 STA $d600 
.l4600:
23dc : ad 00 d6 LDA $d600 
23df : 10 fb __ BPL $23dc ; (main.l4600 + 0)
.s743:
23e1 : a9 00 __ LDA #$00
23e3 : 8d 01 d6 STA $d601 
23e6 : a9 18 __ LDA #$18
23e8 : 8d 00 d6 STA $d600 
.l4602:
23eb : ad 00 d6 LDA $d600 
23ee : 10 fb __ BPL $23eb ; (main.l4602 + 0)
.s749:
23f0 : ad 01 d6 LDA $d601 
23f3 : 29 7f __ AND #$7f
23f5 : 85 45 __ STA T3 + 0 
23f7 : a9 18 __ LDA #$18
23f9 : 8d 00 d6 STA $d600 
.l4604:
23fc : ad 00 d6 LDA $d600 
23ff : 10 fb __ BPL $23fc ; (main.l4604 + 0)
.s755:
2401 : a5 45 __ LDA T3 + 0 
2403 : 8d 01 d6 STA $d601 
2406 : a9 1e __ LDA #$1e
2408 : 8d 00 d6 STA $d600 
.l4606:
240b : ad 00 d6 LDA $d600 
240e : 10 fb __ BPL $240b ; (main.l4606 + 0)
.s760:
2410 : a9 ff __ LDA #$ff
2412 : 8d 01 d6 STA $d601 
2415 : e8 __ __ INX
2416 : 88 __ __ DEY
2417 : d0 a2 __ BNE $23bb ; (main.l725 + 0)
.s727:
2419 : a9 12 __ LDA #$12
241b : 8d 00 d6 STA $d600 
.l4609:
241e : ad 00 d6 LDA $d600 
2421 : 10 fb __ BPL $241e ; (main.l4609 + 0)
.s767:
2423 : 8e 01 d6 STX $d601 
2426 : a9 13 __ LDA #$13
2428 : 8d 00 d6 STA $d600 
.l4611:
242b : ad 00 d6 LDA $d600 
242e : 10 fb __ BPL $242b ; (main.l4611 + 0)
.s772:
2430 : 8c 01 d6 STY $d601 
2433 : a9 1f __ LDA #$1f
2435 : 8d 00 d6 STA $d600 
.l4613:
2438 : ad 00 d6 LDA $d600 
243b : 10 fb __ BPL $2438 ; (main.l4613 + 0)
.s776:
243d : 8c 01 d6 STY $d601 
2440 : a9 18 __ LDA #$18
2442 : 8d 00 d6 STA $d600 
.l4615:
2445 : ad 00 d6 LDA $d600 
2448 : 10 fb __ BPL $2445 ; (main.l4615 + 0)
.s782:
244a : ad 01 d6 LDA $d601 
244d : 29 7f __ AND #$7f
244f : aa __ __ TAX
2450 : a9 18 __ LDA #$18
2452 : 8d 00 d6 STA $d600 
.l4617:
2455 : ad 00 d6 LDA $d600 
2458 : 10 fb __ BPL $2455 ; (main.l4617 + 0)
.s788:
245a : 8e 01 d6 STX $d601 
245d : a9 1e __ LDA #$1e
245f : 8d 00 d6 STA $d600 
.l4619:
2462 : ad 00 d6 LDA $d600 
2465 : 10 fb __ BPL $2462 ; (main.l4619 + 0)
.s793:
2467 : a9 ff __ LDA #$ff
2469 : 8d 01 d6 STA $d601 
246c : a9 1c __ LDA #$1c
246e : 8d 00 d6 STA $d600 
.l4621:
2471 : ad 00 d6 LDA $d600 
2474 : 10 fb __ BPL $2471 ; (main.l4621 + 0)
.s799:
2476 : ad 01 d6 LDA $d601 
2479 : 29 ef __ AND #$ef
247b : aa __ __ TAX
247c : a9 1c __ LDA #$1c
247e : 8d 00 d6 STA $d600 
.l4623:
2481 : ad 00 d6 LDA $d600 
2484 : 10 fb __ BPL $2481 ; (main.l4623 + 0)
.s805:
2486 : 8e 01 d6 STX $d601 
2489 : 20 44 31 JSR $3144 ; (vdc_restore_charsets.s0 + 0)
248c : a9 00 __ LDA #$00
248e : 85 43 __ STA T0 + 0 
.l809:
2490 : a9 12 __ LDA #$12
2492 : 8d 00 d6 STA $d600 
2495 : a5 43 __ LDA T0 + 0 
2497 : 0a __ __ ASL
2498 : 0a __ __ ASL
2499 : 65 43 __ ADC T0 + 0 
249b : 0a __ __ ASL
249c : 0a __ __ ASL
249d : 85 4f __ STA T1 + 0 
249f : a9 00 __ LDA #$00
24a1 : 2a __ __ ROL
24a2 : 06 4f __ ASL T1 + 0 
24a4 : 2a __ __ ROL
24a5 : 06 4f __ ASL T1 + 0 
24a7 : 2a __ __ ROL
24a8 : 85 50 __ STA T1 + 1 
.l4625:
24aa : ad 00 d6 LDA $d600 
24ad : 10 fb __ BPL $24aa ; (main.l4625 + 0)
.s853:
24af : a5 50 __ LDA T1 + 1 
24b1 : 8d 01 d6 STA $d601 
24b4 : a9 13 __ LDA #$13
24b6 : 8d 00 d6 STA $d600 
.l4627:
24b9 : ad 00 d6 LDA $d600 
24bc : 10 fb __ BPL $24b9 ; (main.l4627 + 0)
.s858:
24be : a5 4f __ LDA T1 + 0 
24c0 : 8d 01 d6 STA $d601 
24c3 : a9 1f __ LDA #$1f
24c5 : 8d 00 d6 STA $d600 
.l4629:
24c8 : ad 00 d6 LDA $d600 
24cb : 10 fb __ BPL $24c8 ; (main.l4629 + 0)
.s862:
24cd : a9 20 __ LDA #$20
24cf : 8d 01 d6 STA $d601 
24d2 : a9 18 __ LDA #$18
24d4 : 8d 00 d6 STA $d600 
.l4631:
24d7 : ad 00 d6 LDA $d600 
24da : 10 fb __ BPL $24d7 ; (main.l4631 + 0)
.s868:
24dc : ad 01 d6 LDA $d601 
24df : a2 18 __ LDX #$18
24e1 : 8e 00 d6 STX $d600 
24e4 : 29 7f __ AND #$7f
24e6 : a8 __ __ TAY
.l4633:
24e7 : ad 00 d6 LDA $d600 
24ea : 10 fb __ BPL $24e7 ; (main.l4633 + 0)
.s874:
24ec : 8c 01 d6 STY $d601 
24ef : a9 1e __ LDA #$1e
24f1 : 8d 00 d6 STA $d600 
.l4635:
24f4 : ad 00 d6 LDA $d600 
24f7 : 10 fb __ BPL $24f4 ; (main.l4635 + 0)
.s879:
24f9 : a9 4f __ LDA #$4f
24fb : 8d 01 d6 STA $d601 
24fe : a9 12 __ LDA #$12
2500 : 8d 00 d6 STA $d600 
2503 : 18 __ __ CLC
2504 : a5 50 __ LDA T1 + 1 
2506 : 69 08 __ ADC #$08
2508 : a8 __ __ TAY
.l4637:
2509 : ad 00 d6 LDA $d600 
250c : 10 fb __ BPL $2509 ; (main.l4637 + 0)
.s886:
250e : 8c 01 d6 STY $d601 
2511 : a9 13 __ LDA #$13
2513 : 8d 00 d6 STA $d600 
.l4639:
2516 : ad 00 d6 LDA $d600 
2519 : 10 fb __ BPL $2516 ; (main.l4639 + 0)
.s891:
251b : a5 4f __ LDA T1 + 0 
251d : 8d 01 d6 STA $d601 
2520 : a9 1f __ LDA #$1f
2522 : 8d 00 d6 STA $d600 
.l4641:
2525 : ad 00 d6 LDA $d600 
2528 : 10 fb __ BPL $2525 ; (main.l4641 + 0)
.s895:
252a : a9 20 __ LDA #$20
252c : 8d 01 d6 STA $d601 
252f : 8e 00 d6 STX $d600 
.l4643:
2532 : ad 00 d6 LDA $d600 
2535 : 10 fb __ BPL $2532 ; (main.l4643 + 0)
.s901:
2537 : ad 01 d6 LDA $d601 
253a : 8e 00 d6 STX $d600 
253d : 29 7f __ AND #$7f
253f : aa __ __ TAX
.l4645:
2540 : ad 00 d6 LDA $d600 
2543 : 10 fb __ BPL $2540 ; (main.l4645 + 0)
.s907:
2545 : 8e 01 d6 STX $d601 
2548 : a9 1e __ LDA #$1e
254a : 8d 00 d6 STA $d600 
.l4647:
254d : ad 00 d6 LDA $d600 
2550 : 10 fb __ BPL $254d ; (main.l4647 + 0)
.s912:
2552 : a9 4f __ LDA #$4f
2554 : 8d 01 d6 STA $d601 
2557 : e6 43 __ INC T0 + 0 
2559 : a5 43 __ LDA T0 + 0 
255b : c9 19 __ CMP #$19
255d : b0 03 __ BCS $2562 ; (main.s806 + 0)
255f : 4c 90 24 JMP $2490 ; (main.l809 + 0)
.s806:
2562 : a9 16 __ LDA #$16
2564 : 8d 00 d6 STA $d600 
.l4649:
2567 : ad 00 d6 LDA $d600 
256a : 10 fb __ BPL $2567 ; (main.l4649 + 0)
.s918:
256c : a9 7d __ LDA #$7d
256e : 8d 01 d6 STA $d601 
2571 : ad 8c 32 LDA $328c ; (vdc_text_attr + 0)
2574 : 09 10 __ ORA #$10
2576 : 8d 8c 32 STA $328c ; (vdc_text_attr + 0)
2579 : a2 00 __ LDX #$00
.l1390:
257b : bd 5d 31 LDA $315d,x 
257e : e8 __ __ INX
257f : 09 00 __ ORA #$00
2581 : d0 f8 __ BNE $257b ; (main.l1390 + 0)
.s1391:
2583 : 86 4f __ STX T1 + 0 
2585 : a9 12 __ LDA #$12
2587 : 8d 00 d6 STA $d600 
.l4652:
258a : ad 00 d6 LDA $d600 
258d : 10 fb __ BPL $258a ; (main.l4652 + 0)
.s937:
258f : a9 00 __ LDA #$00
2591 : 8d 01 d6 STA $d601 
2594 : a9 13 __ LDA #$13
2596 : 8d 00 d6 STA $d600 
.l4654:
2599 : ad 00 d6 LDA $d600 
259c : 10 fb __ BPL $2599 ; (main.l4654 + 0)
.s942:
259e : a9 00 __ LDA #$00
25a0 : 8d 01 d6 STA $d601 
25a3 : a9 1f __ LDA #$1f
25a5 : 8d 00 d6 STA $d600 
25a8 : 8a __ __ TXA
25a9 : f0 65 __ BEQ $2610 ; (main.s947 + 0)
.s1182:
25ab : a2 00 __ LDX #$00
.l945:
25ad : bc 5c 31 LDY $315c,x 
25b0 : b9 00 33 LDA $3300,y ; (ascToPetTable + 0)
25b3 : c9 20 __ CMP #$20
25b5 : b0 05 __ BCS $25bc ; (main.s951 + 0)
.s950:
25b7 : 69 80 __ ADC #$80
25b9 : 4c 02 26 JMP $2602 ; (main.s1395 + 0)
.s951:
25bc : a8 __ __ TAY
25bd : c9 40 __ CMP #$40
25bf : 90 04 __ BCC $25c5 ; (main.s954 + 0)
.s956:
25c1 : c9 60 __ CMP #$60
25c3 : 90 23 __ BCC $25e8 ; (main.s953 + 0)
.s954:
25c5 : c9 60 __ CMP #$60
25c7 : 90 0a __ BCC $25d3 ; (main.s958 + 0)
.s960:
25c9 : 09 00 __ ORA #$00
25cb : 30 06 __ BMI $25d3 ; (main.s958 + 0)
.s957:
25cd : 38 __ __ SEC
25ce : e9 20 __ SBC #$20
25d0 : 4c 02 26 JMP $2602 ; (main.s1395 + 0)
.s958:
25d3 : c9 80 __ CMP #$80
25d5 : 90 09 __ BCC $25e0 ; (main.s962 + 0)
.s964:
25d7 : c9 a0 __ CMP #$a0
25d9 : b0 05 __ BCS $25e0 ; (main.s962 + 0)
.s961:
25db : 69 40 __ ADC #$40
25dd : 4c 02 26 JMP $2602 ; (main.s1395 + 0)
.s962:
25e0 : c9 a0 __ CMP #$a0
25e2 : 90 0a __ BCC $25ee ; (main.s966 + 0)
.s968:
25e4 : c9 c0 __ CMP #$c0
25e6 : b0 06 __ BCS $25ee ; (main.s966 + 0)
.s953:
25e8 : 38 __ __ SEC
25e9 : e9 40 __ SBC #$40
25eb : 4c 02 26 JMP $2602 ; (main.s1395 + 0)
.s966:
25ee : c9 c0 __ CMP #$c0
25f0 : 90 0a __ BCC $25fc ; (main.s970 + 0)
.s972:
25f2 : c9 ff __ CMP #$ff
25f4 : b0 06 __ BCS $25fc ; (main.s970 + 0)
.s969:
25f6 : 38 __ __ SEC
25f7 : e9 80 __ SBC #$80
25f9 : 4c 02 26 JMP $2602 ; (main.s1395 + 0)
.s970:
25fc : c9 ff __ CMP #$ff
25fe : d0 03 __ BNE $2603 ; (main.l4658 + 0)
.s973:
2600 : a9 5e __ LDA #$5e
.s1395:
2602 : a8 __ __ TAY
.l4658:
2603 : ad 00 d6 LDA $d600 
2606 : 10 fb __ BPL $2603 ; (main.l4658 + 0)
.s978:
2608 : 8c 01 d6 STY $d601 
260b : e8 __ __ INX
260c : e4 4f __ CPX T1 + 0 
260e : 90 9d __ BCC $25ad ; (main.l945 + 0)
.s947:
2610 : a9 12 __ LDA #$12
2612 : 8d 00 d6 STA $d600 
2615 : c6 4f __ DEC T1 + 0 
2617 : ae 8c 32 LDX $328c ; (vdc_text_attr + 0)
.l4661:
261a : ad 00 d6 LDA $d600 
261d : 10 fb __ BPL $261a ; (main.l4661 + 0)
.s985:
261f : a9 08 __ LDA #$08
2621 : 8d 01 d6 STA $d601 
2624 : a9 13 __ LDA #$13
2626 : 8d 00 d6 STA $d600 
.l4663:
2629 : ad 00 d6 LDA $d600 
262c : 10 fb __ BPL $2629 ; (main.l4663 + 0)
.s990:
262e : a9 00 __ LDA #$00
2630 : 8d 01 d6 STA $d601 
2633 : a9 1f __ LDA #$1f
2635 : 8d 00 d6 STA $d600 
.l4665:
2638 : ad 00 d6 LDA $d600 
263b : 10 fb __ BPL $2638 ; (main.l4665 + 0)
.s994:
263d : 8e 01 d6 STX $d601 
2640 : a9 18 __ LDA #$18
2642 : 8d 00 d6 STA $d600 
.l4667:
2645 : ad 00 d6 LDA $d600 
2648 : 10 fb __ BPL $2645 ; (main.l4667 + 0)
.s1000:
264a : ad 01 d6 LDA $d601 
264d : 29 7f __ AND #$7f
264f : a8 __ __ TAY
2650 : a9 18 __ LDA #$18
2652 : 8d 00 d6 STA $d600 
.l4669:
2655 : ad 00 d6 LDA $d600 
2658 : 10 fb __ BPL $2655 ; (main.l4669 + 0)
.s1006:
265a : 8c 01 d6 STY $d601 
265d : a9 1e __ LDA #$1e
265f : 8d 00 d6 STA $d600 
.l4671:
2662 : ad 00 d6 LDA $d600 
2665 : 10 fb __ BPL $2662 ; (main.l4671 + 0)
.s1011:
2667 : a5 4f __ LDA T1 + 0 
2669 : 8d 01 d6 STA $d601 
266c : 8a __ __ TXA
266d : 29 ef __ AND #$ef
266f : 8d 8c 32 STA $328c ; (vdc_text_attr + 0)
2672 : 20 cf 2d JSR $2dcf ; (getch.s0 + 0)
2675 : ad 11 d0 LDA $d011 
2678 : 29 7f __ AND #$7f
267a : 09 10 __ ORA #$10
267c : 8d 11 d0 STA $d011 
267f : a9 00 __ LDA #$00
2681 : 8d 30 d0 STA $d030 
2684 : 85 43 __ STA T0 + 0 
.l1021:
2686 : a9 12 __ LDA #$12
2688 : 8d 00 d6 STA $d600 
268b : a5 43 __ LDA T0 + 0 
268d : 0a __ __ ASL
268e : 0a __ __ ASL
268f : 65 43 __ ADC T0 + 0 
2691 : 0a __ __ ASL
2692 : 0a __ __ ASL
2693 : 85 4f __ STA T1 + 0 
2695 : a9 00 __ LDA #$00
2697 : 2a __ __ ROL
2698 : 06 4f __ ASL T1 + 0 
269a : 2a __ __ ROL
269b : 06 4f __ ASL T1 + 0 
269d : 2a __ __ ROL
269e : 85 50 __ STA T1 + 1 
.l4673:
26a0 : ad 00 d6 LDA $d600 
26a3 : 10 fb __ BPL $26a0 ; (main.l4673 + 0)
.s1065:
26a5 : a5 50 __ LDA T1 + 1 
26a7 : 8d 01 d6 STA $d601 
26aa : a9 13 __ LDA #$13
26ac : 8d 00 d6 STA $d600 
.l4675:
26af : ad 00 d6 LDA $d600 
26b2 : 10 fb __ BPL $26af ; (main.l4675 + 0)
.s1070:
26b4 : a5 4f __ LDA T1 + 0 
26b6 : 8d 01 d6 STA $d601 
26b9 : a9 1f __ LDA #$1f
26bb : 8d 00 d6 STA $d600 
.l4677:
26be : ad 00 d6 LDA $d600 
26c1 : 10 fb __ BPL $26be ; (main.l4677 + 0)
.s1074:
26c3 : a9 20 __ LDA #$20
26c5 : 8d 01 d6 STA $d601 
26c8 : a9 18 __ LDA #$18
26ca : 8d 00 d6 STA $d600 
.l4679:
26cd : ad 00 d6 LDA $d600 
26d0 : 10 fb __ BPL $26cd ; (main.l4679 + 0)
.s1080:
26d2 : ad 01 d6 LDA $d601 
26d5 : a2 18 __ LDX #$18
26d7 : 8e 00 d6 STX $d600 
26da : 29 7f __ AND #$7f
26dc : a8 __ __ TAY
.l4681:
26dd : ad 00 d6 LDA $d600 
26e0 : 10 fb __ BPL $26dd ; (main.l4681 + 0)
.s1086:
26e2 : 8c 01 d6 STY $d601 
26e5 : a9 1e __ LDA #$1e
26e7 : 8d 00 d6 STA $d600 
.l4683:
26ea : ad 00 d6 LDA $d600 
26ed : 10 fb __ BPL $26ea ; (main.l4683 + 0)
.s1091:
26ef : a9 4f __ LDA #$4f
26f1 : 8d 01 d6 STA $d601 
26f4 : a9 12 __ LDA #$12
26f6 : 8d 00 d6 STA $d600 
26f9 : 18 __ __ CLC
26fa : a5 50 __ LDA T1 + 1 
26fc : 69 08 __ ADC #$08
26fe : a8 __ __ TAY
.l4685:
26ff : ad 00 d6 LDA $d600 
2702 : 10 fb __ BPL $26ff ; (main.l4685 + 0)
.s1098:
2704 : 8c 01 d6 STY $d601 
2707 : a9 13 __ LDA #$13
2709 : 8d 00 d6 STA $d600 
.l4687:
270c : ad 00 d6 LDA $d600 
270f : 10 fb __ BPL $270c ; (main.l4687 + 0)
.s1103:
2711 : a5 4f __ LDA T1 + 0 
2713 : 8d 01 d6 STA $d601 
2716 : a9 1f __ LDA #$1f
2718 : 8d 00 d6 STA $d600 
.l4689:
271b : ad 00 d6 LDA $d600 
271e : 10 fb __ BPL $271b ; (main.l4689 + 0)
.s1107:
2720 : a9 20 __ LDA #$20
2722 : 8d 01 d6 STA $d601 
2725 : 8e 00 d6 STX $d600 
.l4691:
2728 : ad 00 d6 LDA $d600 
272b : 10 fb __ BPL $2728 ; (main.l4691 + 0)
.s1113:
272d : ad 01 d6 LDA $d601 
2730 : 8e 00 d6 STX $d600 
2733 : 29 7f __ AND #$7f
2735 : aa __ __ TAX
.l4693:
2736 : ad 00 d6 LDA $d600 
2739 : 10 fb __ BPL $2736 ; (main.l4693 + 0)
.s1119:
273b : 8e 01 d6 STX $d601 
273e : a9 1e __ LDA #$1e
2740 : 8d 00 d6 STA $d600 
.l4695:
2743 : ad 00 d6 LDA $d600 
2746 : 10 fb __ BPL $2743 ; (main.l4695 + 0)
.s1124:
2748 : a9 4f __ LDA #$4f
274a : 8d 01 d6 STA $d601 
274d : e6 43 __ INC T0 + 0 
274f : a5 43 __ LDA T0 + 0 
2751 : c9 19 __ CMP #$19
2753 : b0 03 __ BCS $2758 ; (main.s1013 + 0)
2755 : 4c 86 26 JMP $2686 ; (main.l1021 + 0)
.s1013:
2758 : a9 00 __ LDA #$00
275a : 8d 00 ff STA $ff00 
275d : 85 1b __ STA ACCU + 0 
275f : 85 1c __ STA ACCU + 1 
.s1001:
2761 : 18 __ __ CLC
2762 : a5 23 __ LDA SP + 0 
2764 : 69 08 __ ADC #$08
2766 : 85 23 __ STA SP + 0 
2768 : 90 02 __ BCC $276c ; (main.s1001 + 11)
276a : e6 24 __ INC SP + 1 
276c : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
276d : a2 03 __ LDX #$03
276f : b5 53 __ LDA T8 + 0,x 
2771 : 9d b2 bf STA $bfb2,x ; (printf@stack + 0)
2774 : ca __ __ DEX
2775 : 10 f8 __ BPL $276f ; (printf.s1000 + 2)
.s0:
2777 : 18 __ __ CLC
2778 : a5 23 __ LDA SP + 0 
277a : 69 04 __ ADC #$04
277c : 85 47 __ STA T0 + 0 
277e : a5 24 __ LDA SP + 1 
2780 : 69 00 __ ADC #$00
2782 : 85 48 __ STA T0 + 1 
2784 : a9 00 __ LDA #$00
2786 : 85 49 __ STA T2 + 0 
2788 : a0 02 __ LDY #$02
278a : b1 23 __ LDA (SP + 0),y 
278c : 85 4a __ STA T3 + 0 
278e : c8 __ __ INY
278f : b1 23 __ LDA (SP + 0),y 
2791 : 85 4b __ STA T3 + 1 
.l2:
2793 : a0 00 __ LDY #$00
2795 : b1 4a __ LDA (T3 + 0),y 
2797 : d0 1e __ BNE $27b7 ; (printf.s3 + 0)
.s4:
2799 : a6 49 __ LDX T2 + 0 
279b : 9d be bf STA $bfbe,x ; (buff + 0)
279e : 8a __ __ TXA
279f : f0 0b __ BEQ $27ac ; (printf.s1001 + 0)
.s108:
27a1 : a9 be __ LDA #$be
27a3 : 85 0d __ STA P0 ; (fmt + 0)
27a5 : a9 bf __ LDA #$bf
27a7 : 85 0e __ STA P1 ; (fmt + 1)
27a9 : 20 a3 2a JSR $2aa3 ; (puts.s0 + 0)
.s1001:
27ac : a2 03 __ LDX #$03
27ae : bd b2 bf LDA $bfb2,x ; (printf@stack + 0)
27b1 : 95 53 __ STA T8 + 0,x 
27b3 : ca __ __ DEX
27b4 : 10 f8 __ BPL $27ae ; (printf.s1001 + 2)
27b6 : 60 __ __ RTS
.s3:
27b7 : c9 25 __ CMP #$25
27b9 : f0 28 __ BEQ $27e3 ; (printf.s5 + 0)
.s6:
27bb : a6 49 __ LDX T2 + 0 
27bd : 9d be bf STA $bfbe,x ; (buff + 0)
27c0 : e6 4a __ INC T3 + 0 
27c2 : d0 02 __ BNE $27c6 ; (printf.s1080 + 0)
.s1079:
27c4 : e6 4b __ INC T3 + 1 
.s1080:
27c6 : e8 __ __ INX
27c7 : 86 49 __ STX T2 + 0 
27c9 : e0 28 __ CPX #$28
27cb : 90 c6 __ BCC $2793 ; (printf.l2 + 0)
.s102:
27cd : a9 be __ LDA #$be
27cf : 85 0d __ STA P0 ; (fmt + 0)
27d1 : a9 bf __ LDA #$bf
27d3 : 85 0e __ STA P1 ; (fmt + 1)
27d5 : 98 __ __ TYA
27d6 : 9d be bf STA $bfbe,x ; (buff + 0)
27d9 : 20 a3 2a JSR $2aa3 ; (puts.s0 + 0)
27dc : a9 00 __ LDA #$00
.s1050:
27de : 85 49 __ STA T2 + 0 
27e0 : 4c 93 27 JMP $2793 ; (printf.l2 + 0)
.s5:
27e3 : a5 49 __ LDA T2 + 0 
27e5 : f0 15 __ BEQ $27fc ; (printf.s10 + 0)
.s8:
27e7 : a9 be __ LDA #$be
27e9 : 85 0d __ STA P0 ; (fmt + 0)
27eb : a9 bf __ LDA #$bf
27ed : 85 0e __ STA P1 ; (fmt + 1)
27ef : 98 __ __ TYA
27f0 : a6 49 __ LDX T2 + 0 
27f2 : 9d be bf STA $bfbe,x ; (buff + 0)
27f5 : 20 a3 2a JSR $2aa3 ; (puts.s0 + 0)
27f8 : a9 00 __ LDA #$00
27fa : 85 49 __ STA T2 + 0 
.s10:
27fc : a9 0a __ LDA #$0a
27fe : 8d b9 bf STA $bfb9 ; (si + 3)
2801 : a9 00 __ LDA #$00
2803 : 8d ba bf STA $bfba ; (si + 4)
2806 : 8d bb bf STA $bfbb ; (si + 5)
2809 : 8d bc bf STA $bfbc ; (si + 6)
280c : 8d bd bf STA $bfbd ; (si + 7)
280f : a0 01 __ LDY #$01
2811 : b1 4a __ LDA (T3 + 0),y 
2813 : aa __ __ TAX
2814 : a9 20 __ LDA #$20
2816 : 8d b6 bf STA $bfb6 ; (si + 0)
2819 : a9 00 __ LDA #$00
281b : 8d b7 bf STA $bfb7 ; (si + 1)
281e : a9 ff __ LDA #$ff
2820 : 8d b8 bf STA $bfb8 ; (si + 2)
2823 : 18 __ __ CLC
2824 : a5 4a __ LDA T3 + 0 
2826 : 69 02 __ ADC #$02
.l15:
2828 : 85 4a __ STA T3 + 0 
282a : 90 02 __ BCC $282e ; (printf.s1062 + 0)
.s1061:
282c : e6 4b __ INC T3 + 1 
.s1062:
282e : 8a __ __ TXA
282f : e0 2b __ CPX #$2b
2831 : d0 08 __ BNE $283b ; (printf.s18 + 0)
.s17:
2833 : a9 01 __ LDA #$01
2835 : 8d bb bf STA $bfbb ; (si + 5)
2838 : 4c 96 2a JMP $2a96 ; (printf.s210 + 0)
.s18:
283b : c9 30 __ CMP #$30
283d : d0 06 __ BNE $2845 ; (printf.s21 + 0)
.s20:
283f : 8d b6 bf STA $bfb6 ; (si + 0)
2842 : 4c 96 2a JMP $2a96 ; (printf.s210 + 0)
.s21:
2845 : e0 23 __ CPX #$23
2847 : d0 08 __ BNE $2851 ; (printf.s24 + 0)
.s23:
2849 : a9 01 __ LDA #$01
284b : 8d bd bf STA $bfbd ; (si + 7)
284e : 4c 96 2a JMP $2a96 ; (printf.s210 + 0)
.s24:
2851 : e0 2d __ CPX #$2d
2853 : d0 08 __ BNE $285d ; (printf.s16 + 0)
.s26:
2855 : a9 01 __ LDA #$01
2857 : 8d bc bf STA $bfbc ; (si + 6)
285a : 4c 96 2a JMP $2a96 ; (printf.s210 + 0)
.s16:
285d : 86 4c __ STX T4 + 0 
285f : e0 30 __ CPX #$30
2861 : 90 53 __ BCC $28b6 ; (printf.s32 + 0)
.s33:
2863 : e0 3a __ CPX #$3a
2865 : b0 4f __ BCS $28b6 ; (printf.s32 + 0)
.s30:
2867 : a9 00 __ LDA #$00
2869 : 85 4d __ STA T6 + 0 
286b : 85 4e __ STA T6 + 1 
286d : e0 3a __ CPX #$3a
286f : b0 40 __ BCS $28b1 ; (printf.s36 + 0)
.l35:
2871 : a5 4d __ LDA T6 + 0 
2873 : 0a __ __ ASL
2874 : 85 1b __ STA ACCU + 0 
2876 : a5 4e __ LDA T6 + 1 
2878 : 2a __ __ ROL
2879 : 06 1b __ ASL ACCU + 0 
287b : 2a __ __ ROL
287c : aa __ __ TAX
287d : 18 __ __ CLC
287e : a5 1b __ LDA ACCU + 0 
2880 : 65 4d __ ADC T6 + 0 
2882 : 85 4d __ STA T6 + 0 
2884 : 8a __ __ TXA
2885 : 65 4e __ ADC T6 + 1 
2887 : 06 4d __ ASL T6 + 0 
2889 : 2a __ __ ROL
288a : aa __ __ TAX
288b : 18 __ __ CLC
288c : a5 4d __ LDA T6 + 0 
288e : 65 4c __ ADC T4 + 0 
2890 : 90 01 __ BCC $2893 ; (printf.s1076 + 0)
.s1075:
2892 : e8 __ __ INX
.s1076:
2893 : 38 __ __ SEC
2894 : e9 30 __ SBC #$30
2896 : 85 4d __ STA T6 + 0 
2898 : 8a __ __ TXA
2899 : e9 00 __ SBC #$00
289b : 85 4e __ STA T6 + 1 
289d : a0 00 __ LDY #$00
289f : b1 4a __ LDA (T3 + 0),y 
28a1 : 85 4c __ STA T4 + 0 
28a3 : e6 4a __ INC T3 + 0 
28a5 : d0 02 __ BNE $28a9 ; (printf.s1078 + 0)
.s1077:
28a7 : e6 4b __ INC T3 + 1 
.s1078:
28a9 : c9 30 __ CMP #$30
28ab : 90 04 __ BCC $28b1 ; (printf.s36 + 0)
.s37:
28ad : c9 3a __ CMP #$3a
28af : 90 c0 __ BCC $2871 ; (printf.l35 + 0)
.s36:
28b1 : a5 4d __ LDA T6 + 0 
28b3 : 8d b7 bf STA $bfb7 ; (si + 1)
.s32:
28b6 : a5 4c __ LDA T4 + 0 
28b8 : c9 2e __ CMP #$2e
28ba : d0 51 __ BNE $290d ; (printf.s40 + 0)
.s38:
28bc : a9 00 __ LDA #$00
28be : 85 4d __ STA T6 + 0 
.l195:
28c0 : 85 4e __ STA T6 + 1 
28c2 : a0 00 __ LDY #$00
28c4 : b1 4a __ LDA (T3 + 0),y 
28c6 : 85 4c __ STA T4 + 0 
28c8 : e6 4a __ INC T3 + 0 
28ca : d0 02 __ BNE $28ce ; (printf.s1064 + 0)
.s1063:
28cc : e6 4b __ INC T3 + 1 
.s1064:
28ce : c9 30 __ CMP #$30
28d0 : 90 04 __ BCC $28d6 ; (printf.s43 + 0)
.s44:
28d2 : c9 3a __ CMP #$3a
28d4 : 90 0a __ BCC $28e0 ; (printf.s42 + 0)
.s43:
28d6 : a5 4d __ LDA T6 + 0 
28d8 : 8d b8 bf STA $bfb8 ; (si + 2)
28db : a5 4c __ LDA T4 + 0 
28dd : 4c 0d 29 JMP $290d ; (printf.s40 + 0)
.s42:
28e0 : a5 4d __ LDA T6 + 0 
28e2 : 0a __ __ ASL
28e3 : 85 1b __ STA ACCU + 0 
28e5 : a5 4e __ LDA T6 + 1 
28e7 : 2a __ __ ROL
28e8 : 06 1b __ ASL ACCU + 0 
28ea : 2a __ __ ROL
28eb : aa __ __ TAX
28ec : 18 __ __ CLC
28ed : a5 1b __ LDA ACCU + 0 
28ef : 65 4d __ ADC T6 + 0 
28f1 : 85 4d __ STA T6 + 0 
28f3 : 8a __ __ TXA
28f4 : 65 4e __ ADC T6 + 1 
28f6 : 06 4d __ ASL T6 + 0 
28f8 : 2a __ __ ROL
28f9 : aa __ __ TAX
28fa : 18 __ __ CLC
28fb : a5 4d __ LDA T6 + 0 
28fd : 65 4c __ ADC T4 + 0 
28ff : 90 01 __ BCC $2902 ; (printf.s1074 + 0)
.s1073:
2901 : e8 __ __ INX
.s1074:
2902 : 38 __ __ SEC
2903 : e9 30 __ SBC #$30
2905 : 85 4d __ STA T6 + 0 
2907 : 8a __ __ TXA
2908 : e9 00 __ SBC #$00
290a : 4c c0 28 JMP $28c0 ; (printf.l195 + 0)
.s40:
290d : c9 64 __ CMP #$64
290f : d0 05 __ BNE $2916 ; (printf.s46 + 0)
.s45:
2911 : a9 01 __ LDA #$01
2913 : 4c 6f 2a JMP $2a6f ; (printf.s211 + 0)
.s46:
2916 : c9 75 __ CMP #$75
2918 : d0 03 __ BNE $291d ; (printf.s49 + 0)
291a : 4c 6d 2a JMP $2a6d ; (printf.s232 + 0)
.s49:
291d : c9 78 __ CMP #$78
291f : d0 0d __ BNE $292e ; (printf.s52 + 0)
.s51:
2921 : a9 10 __ LDA #$10
2923 : 8d b9 bf STA $bfb9 ; (si + 3)
2926 : a9 00 __ LDA #$00
2928 : 8d ba bf STA $bfba ; (si + 4)
292b : 4c 6d 2a JMP $2a6d ; (printf.s232 + 0)
.s52:
292e : c9 6c __ CMP #$6c
2930 : d0 03 __ BNE $2935 ; (printf.s55 + 0)
2932 : 4c fb 29 JMP $29fb ; (printf.s54 + 0)
.s55:
2935 : c9 73 __ CMP #$73
2937 : f0 31 __ BEQ $296a ; (printf.s66 + 0)
.s67:
2939 : c9 63 __ CMP #$63
293b : f0 11 __ BEQ $294e ; (printf.s96 + 0)
.s97:
293d : 09 00 __ ORA #$00
293f : d0 03 __ BNE $2944 ; (printf.s99 + 0)
2941 : 4c 93 27 JMP $2793 ; (printf.l2 + 0)
.s99:
2944 : a6 49 __ LDX T2 + 0 
2946 : 9d be bf STA $bfbe,x ; (buff + 0)
2949 : e6 49 __ INC T2 + 0 
294b : 4c 93 27 JMP $2793 ; (printf.l2 + 0)
.s96:
294e : a0 00 __ LDY #$00
2950 : b1 47 __ LDA (T0 + 0),y 
2952 : a6 49 __ LDX T2 + 0 
2954 : 9d be bf STA $bfbe,x ; (buff + 0)
2957 : e6 49 __ INC T2 + 0 
.s208:
2959 : 18 __ __ CLC
295a : a5 47 __ LDA T0 + 0 
295c : 69 02 __ ADC #$02
295e : 85 47 __ STA T0 + 0 
2960 : b0 03 __ BCS $2965 ; (printf.s1065 + 0)
2962 : 4c 93 27 JMP $2793 ; (printf.l2 + 0)
.s1065:
2965 : e6 48 __ INC T0 + 1 
2967 : 4c 93 27 JMP $2793 ; (printf.l2 + 0)
.s66:
296a : a0 00 __ LDY #$00
296c : 84 4c __ STY T4 + 0 
296e : b1 47 __ LDA (T0 + 0),y 
2970 : 85 4d __ STA T6 + 0 
2972 : c8 __ __ INY
2973 : b1 47 __ LDA (T0 + 0),y 
2975 : 85 4e __ STA T6 + 1 
2977 : 18 __ __ CLC
2978 : a5 47 __ LDA T0 + 0 
297a : 69 02 __ ADC #$02
297c : 85 47 __ STA T0 + 0 
297e : 90 02 __ BCC $2982 ; (printf.s1072 + 0)
.s1071:
2980 : e6 48 __ INC T0 + 1 
.s1072:
2982 : ad b7 bf LDA $bfb7 ; (si + 1)
2985 : f0 0d __ BEQ $2994 ; (printf.s71 + 0)
.s1053:
2987 : a0 00 __ LDY #$00
2989 : b1 4d __ LDA (T6 + 0),y 
298b : f0 05 __ BEQ $2992 ; (printf.s1054 + 0)
.l73:
298d : c8 __ __ INY
298e : b1 4d __ LDA (T6 + 0),y 
2990 : d0 fb __ BNE $298d ; (printf.l73 + 0)
.s1054:
2992 : 84 4c __ STY T4 + 0 
.s71:
2994 : ad bc bf LDA $bfbc ; (si + 6)
2997 : d0 1a __ BNE $29b3 ; (printf.s77 + 0)
.s1057:
2999 : a4 4c __ LDY T4 + 0 
299b : cc b7 bf CPY $bfb7 ; (si + 1)
299e : a6 49 __ LDX T2 + 0 
29a0 : b0 0d __ BCS $29af ; (printf.s1058 + 0)
.l79:
29a2 : ad b6 bf LDA $bfb6 ; (si + 0)
29a5 : 9d be bf STA $bfbe,x ; (buff + 0)
29a8 : c8 __ __ INY
29a9 : cc b7 bf CPY $bfb7 ; (si + 1)
29ac : e8 __ __ INX
29ad : 90 f3 __ BCC $29a2 ; (printf.l79 + 0)
.s1058:
29af : 86 49 __ STX T2 + 0 
29b1 : 84 4c __ STY T4 + 0 
.s77:
29b3 : a5 49 __ LDA T2 + 0 
29b5 : f0 16 __ BEQ $29cd ; (printf.s202 + 0)
.s84:
29b7 : a9 be __ LDA #$be
29b9 : 85 0d __ STA P0 ; (fmt + 0)
29bb : a9 bf __ LDA #$bf
29bd : 85 0e __ STA P1 ; (fmt + 1)
29bf : a9 00 __ LDA #$00
29c1 : a6 49 __ LDX T2 + 0 
29c3 : 9d be bf STA $bfbe,x ; (buff + 0)
29c6 : 20 a3 2a JSR $2aa3 ; (puts.s0 + 0)
29c9 : a9 00 __ LDA #$00
29cb : 85 49 __ STA T2 + 0 
.s202:
29cd : a5 4d __ LDA T6 + 0 
29cf : 85 0d __ STA P0 ; (fmt + 0)
29d1 : a5 4e __ LDA T6 + 1 
29d3 : 85 0e __ STA P1 ; (fmt + 1)
29d5 : 20 a3 2a JSR $2aa3 ; (puts.s0 + 0)
29d8 : ad bc bf LDA $bfbc ; (si + 6)
29db : d0 03 __ BNE $29e0 ; (printf.s1055 + 0)
29dd : 4c 93 27 JMP $2793 ; (printf.l2 + 0)
.s1055:
29e0 : a4 4c __ LDY T4 + 0 
29e2 : cc b7 bf CPY $bfb7 ; (si + 1)
29e5 : a2 00 __ LDX #$00
29e7 : b0 0d __ BCS $29f6 ; (printf.s1056 + 0)
.l94:
29e9 : ad b6 bf LDA $bfb6 ; (si + 0)
29ec : 9d be bf STA $bfbe,x ; (buff + 0)
29ef : c8 __ __ INY
29f0 : cc b7 bf CPY $bfb7 ; (si + 1)
29f3 : e8 __ __ INX
29f4 : 90 f3 __ BCC $29e9 ; (printf.l94 + 0)
.s1056:
29f6 : 86 49 __ STX T2 + 0 
29f8 : 4c 93 27 JMP $2793 ; (printf.l2 + 0)
.s54:
29fb : a0 00 __ LDY #$00
29fd : b1 47 __ LDA (T0 + 0),y 
29ff : 85 53 __ STA T8 + 0 
2a01 : c8 __ __ INY
2a02 : b1 47 __ LDA (T0 + 0),y 
2a04 : 85 54 __ STA T8 + 1 
2a06 : c8 __ __ INY
2a07 : b1 47 __ LDA (T0 + 0),y 
2a09 : 85 55 __ STA T8 + 2 
2a0b : c8 __ __ INY
2a0c : b1 47 __ LDA (T0 + 0),y 
2a0e : 85 56 __ STA T8 + 3 
2a10 : 18 __ __ CLC
2a11 : a5 47 __ LDA T0 + 0 
2a13 : 69 04 __ ADC #$04
2a15 : 85 47 __ STA T0 + 0 
2a17 : 90 02 __ BCC $2a1b ; (printf.s1068 + 0)
.s1067:
2a19 : e6 48 __ INC T0 + 1 
.s1068:
2a1b : a0 00 __ LDY #$00
2a1d : b1 4a __ LDA (T3 + 0),y 
2a1f : aa __ __ TAX
2a20 : e6 4a __ INC T3 + 0 
2a22 : d0 02 __ BNE $2a26 ; (printf.s1070 + 0)
.s1069:
2a24 : e6 4b __ INC T3 + 1 
.s1070:
2a26 : 8a __ __ TXA
2a27 : e0 64 __ CPX #$64
2a29 : d0 04 __ BNE $2a2f ; (printf.s58 + 0)
.s57:
2a2b : a9 01 __ LDA #$01
2a2d : d0 14 __ BNE $2a43 ; (printf.s209 + 0)
.s58:
2a2f : c9 75 __ CMP #$75
2a31 : f0 0f __ BEQ $2a42 ; (printf.s231 + 0)
.s61:
2a33 : c9 78 __ CMP #$78
2a35 : f0 03 __ BEQ $2a3a ; (printf.s63 + 0)
2a37 : 4c 93 27 JMP $2793 ; (printf.l2 + 0)
.s63:
2a3a : 8c ba bf STY $bfba ; (si + 4)
2a3d : a9 10 __ LDA #$10
2a3f : 8d b9 bf STA $bfb9 ; (si + 3)
.s231:
2a42 : 98 __ __ TYA
.s209:
2a43 : 85 15 __ STA P8 
2a45 : a9 be __ LDA #$be
2a47 : 85 0f __ STA P2 ; (fmt + 2)
2a49 : a9 bf __ LDA #$bf
2a4b : 85 10 __ STA P3 ; (fmt + 3)
2a4d : a5 53 __ LDA T8 + 0 
2a4f : 85 11 __ STA P4 
2a51 : a5 54 __ LDA T8 + 1 
2a53 : 85 12 __ STA P5 
2a55 : a5 55 __ LDA T8 + 2 
2a57 : 85 13 __ STA P6 
2a59 : a5 56 __ LDA T8 + 3 
2a5b : 85 14 __ STA P7 
2a5d : a9 b6 __ LDA #$b6
2a5f : 85 0d __ STA P0 ; (fmt + 0)
2a61 : a9 bf __ LDA #$bf
2a63 : 85 0e __ STA P1 ; (fmt + 1)
2a65 : 20 2f 2c JSR $2c2f ; (nforml.s0 + 0)
2a68 : a5 1b __ LDA ACCU + 0 
2a6a : 4c de 27 JMP $27de ; (printf.s1050 + 0)
.s232:
2a6d : a9 00 __ LDA #$00
.s211:
2a6f : 85 13 __ STA P6 
2a71 : a9 be __ LDA #$be
2a73 : 85 0f __ STA P2 ; (fmt + 2)
2a75 : a9 bf __ LDA #$bf
2a77 : 85 10 __ STA P3 ; (fmt + 3)
2a79 : a0 00 __ LDY #$00
2a7b : b1 47 __ LDA (T0 + 0),y 
2a7d : 85 11 __ STA P4 
2a7f : c8 __ __ INY
2a80 : b1 47 __ LDA (T0 + 0),y 
2a82 : 85 12 __ STA P5 
2a84 : a9 b6 __ LDA #$b6
2a86 : 85 0d __ STA P0 ; (fmt + 0)
2a88 : a9 bf __ LDA #$bf
2a8a : 85 0e __ STA P1 ; (fmt + 1)
2a8c : 20 f8 2a JSR $2af8 ; (nformi.s0 + 0)
2a8f : a5 1b __ LDA ACCU + 0 
2a91 : 85 49 __ STA T2 + 0 
2a93 : 4c 59 29 JMP $2959 ; (printf.s208 + 0)
.s210:
2a96 : a0 00 __ LDY #$00
2a98 : b1 4a __ LDA (T3 + 0),y 
2a9a : aa __ __ TAX
2a9b : 18 __ __ CLC
2a9c : a5 4a __ LDA T3 + 0 
2a9e : 69 01 __ ADC #$01
2aa0 : 4c 28 28 JMP $2828 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
2aa3 : a0 00 __ LDY #$00
2aa5 : b1 0d __ LDA (P0),y 
2aa7 : f0 0b __ BEQ $2ab4 ; (puts.s1001 + 0)
2aa9 : 20 b5 2a JSR $2ab5 ; (putpch + 0)
2aac : e6 0d __ INC P0 
2aae : d0 f3 __ BNE $2aa3 ; (puts.s0 + 0)
2ab0 : e6 0e __ INC P1 
2ab2 : d0 ef __ BNE $2aa3 ; (puts.s0 + 0)
.s1001:
2ab4 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
2ab5 : ae 8b 32 LDX $328b ; (giocharmap + 0)
2ab8 : e0 01 __ CPX #$01
2aba : 90 26 __ BCC $2ae2 ; (putpch + 45)
2abc : c9 0a __ CMP #$0a
2abe : d0 02 __ BNE $2ac2 ; (putpch + 13)
2ac0 : a9 0d __ LDA #$0d
2ac2 : c9 09 __ CMP #$09
2ac4 : f0 1f __ BEQ $2ae5 ; (putpch + 48)
2ac6 : e0 02 __ CPX #$02
2ac8 : 90 18 __ BCC $2ae2 ; (putpch + 45)
2aca : c9 41 __ CMP #$41
2acc : 90 14 __ BCC $2ae2 ; (putpch + 45)
2ace : c9 7b __ CMP #$7b
2ad0 : b0 10 __ BCS $2ae2 ; (putpch + 45)
2ad2 : c9 61 __ CMP #$61
2ad4 : b0 04 __ BCS $2ada ; (putpch + 37)
2ad6 : c9 5b __ CMP #$5b
2ad8 : b0 08 __ BCS $2ae2 ; (putpch + 45)
2ada : 49 20 __ EOR #$20
2adc : e0 03 __ CPX #$03
2ade : f0 02 __ BEQ $2ae2 ; (putpch + 45)
2ae0 : 29 df __ AND #$df
2ae2 : 4c d2 ff JMP $ffd2 
2ae5 : 38 __ __ SEC
2ae6 : 20 f0 ff JSR $fff0 
2ae9 : 98 __ __ TYA
2aea : 29 03 __ AND #$03
2aec : 49 03 __ EOR #$03
2aee : aa __ __ TAX
2aef : a9 20 __ LDA #$20
2af1 : 20 d2 ff JSR $ffd2 
2af4 : ca __ __ DEX
2af5 : 10 fa __ BPL $2af1 ; (putpch + 60)
2af7 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
328b : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
2af8 : a9 00 __ LDA #$00
2afa : 85 43 __ STA T0 + 0 
2afc : a5 13 __ LDA P6 ; (s + 0)
2afe : f0 13 __ BEQ $2b13 ; (nformi.s169 + 0)
.s4:
2b00 : a5 12 __ LDA P5 ; (v + 1)
2b02 : 10 0f __ BPL $2b13 ; (nformi.s169 + 0)
.s1:
2b04 : 38 __ __ SEC
2b05 : a9 00 __ LDA #$00
2b07 : e5 11 __ SBC P4 ; (v + 0)
2b09 : 85 11 __ STA P4 ; (v + 0)
2b0b : a9 00 __ LDA #$00
2b0d : e5 12 __ SBC P5 ; (v + 1)
2b0f : 85 12 __ STA P5 ; (v + 1)
2b11 : e6 43 __ INC T0 + 0 
.s169:
2b13 : a9 10 __ LDA #$10
2b15 : 85 44 __ STA T2 + 0 
2b17 : a5 11 __ LDA P4 ; (v + 0)
2b19 : 05 12 __ ORA P5 ; (v + 1)
2b1b : f0 46 __ BEQ $2b63 ; (nformi.s7 + 0)
.s42:
2b1d : a0 03 __ LDY #$03
2b1f : b1 0d __ LDA (P0),y ; (si + 0)
2b21 : 85 45 __ STA T4 + 0 
2b23 : c8 __ __ INY
2b24 : b1 0d __ LDA (P0),y ; (si + 0)
2b26 : 85 46 __ STA T4 + 1 
.l6:
2b28 : a5 11 __ LDA P4 ; (v + 0)
2b2a : 85 1b __ STA ACCU + 0 
2b2c : a5 12 __ LDA P5 ; (v + 1)
2b2e : 85 1c __ STA ACCU + 1 
2b30 : a5 45 __ LDA T4 + 0 
2b32 : 85 03 __ STA WORK + 0 
2b34 : a5 46 __ LDA T4 + 1 
2b36 : 85 04 __ STA WORK + 1 
2b38 : 20 6f 31 JSR $316f ; (divmod + 0)
2b3b : a5 06 __ LDA WORK + 3 
2b3d : 30 08 __ BMI $2b47 ; (nformi.s78 + 0)
.s1019:
2b3f : d0 0a __ BNE $2b4b ; (nformi.s77 + 0)
.s1018:
2b41 : a5 05 __ LDA WORK + 2 
2b43 : c9 0a __ CMP #$0a
2b45 : b0 04 __ BCS $2b4b ; (nformi.s77 + 0)
.s78:
2b47 : a9 30 __ LDA #$30
2b49 : d0 02 __ BNE $2b4d ; (nformi.s79 + 0)
.s77:
2b4b : a9 37 __ LDA #$37
.s79:
2b4d : 18 __ __ CLC
2b4e : 65 05 __ ADC WORK + 2 
2b50 : c6 44 __ DEC T2 + 0 
2b52 : a6 44 __ LDX T2 + 0 
2b54 : 9d f0 bf STA $bff0,x ; (buffer + 0)
2b57 : a5 1b __ LDA ACCU + 0 
2b59 : 85 11 __ STA P4 ; (v + 0)
2b5b : a5 1c __ LDA ACCU + 1 
2b5d : 85 12 __ STA P5 ; (v + 1)
2b5f : 05 11 __ ORA P4 ; (v + 0)
2b61 : d0 c5 __ BNE $2b28 ; (nformi.l6 + 0)
.s7:
2b63 : a0 02 __ LDY #$02
2b65 : b1 0d __ LDA (P0),y ; (si + 0)
2b67 : c9 ff __ CMP #$ff
2b69 : d0 04 __ BNE $2b6f ; (nformi.s80 + 0)
.s81:
2b6b : a9 0f __ LDA #$0f
2b6d : d0 05 __ BNE $2b74 ; (nformi.s1026 + 0)
.s80:
2b6f : 38 __ __ SEC
2b70 : a9 10 __ LDA #$10
2b72 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
2b74 : a8 __ __ TAY
2b75 : c4 44 __ CPY T2 + 0 
2b77 : b0 0d __ BCS $2b86 ; (nformi.s10 + 0)
.s9:
2b79 : a9 30 __ LDA #$30
.l1027:
2b7b : c6 44 __ DEC T2 + 0 
2b7d : a6 44 __ LDX T2 + 0 
2b7f : 9d f0 bf STA $bff0,x ; (buffer + 0)
2b82 : c4 44 __ CPY T2 + 0 
2b84 : 90 f5 __ BCC $2b7b ; (nformi.l1027 + 0)
.s10:
2b86 : a0 07 __ LDY #$07
2b88 : b1 0d __ LDA (P0),y ; (si + 0)
2b8a : f0 20 __ BEQ $2bac ; (nformi.s13 + 0)
.s14:
2b8c : a0 04 __ LDY #$04
2b8e : b1 0d __ LDA (P0),y ; (si + 0)
2b90 : d0 1a __ BNE $2bac ; (nformi.s13 + 0)
.s1013:
2b92 : 88 __ __ DEY
2b93 : b1 0d __ LDA (P0),y ; (si + 0)
2b95 : c9 10 __ CMP #$10
2b97 : d0 13 __ BNE $2bac ; (nformi.s13 + 0)
.s11:
2b99 : a9 58 __ LDA #$58
2b9b : a6 44 __ LDX T2 + 0 
2b9d : 9d ef bf STA $bfef,x ; (buff + 49)
2ba0 : 8a __ __ TXA
2ba1 : 18 __ __ CLC
2ba2 : 69 fe __ ADC #$fe
2ba4 : 85 44 __ STA T2 + 0 
2ba6 : aa __ __ TAX
2ba7 : a9 30 __ LDA #$30
2ba9 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
2bac : a9 00 __ LDA #$00
2bae : 85 1b __ STA ACCU + 0 
2bb0 : a5 43 __ LDA T0 + 0 
2bb2 : f0 06 __ BEQ $2bba ; (nformi.s16 + 0)
.s15:
2bb4 : c6 44 __ DEC T2 + 0 
2bb6 : a9 2d __ LDA #$2d
2bb8 : d0 0a __ BNE $2bc4 ; (nformi.s1025 + 0)
.s16:
2bba : a0 05 __ LDY #$05
2bbc : b1 0d __ LDA (P0),y ; (si + 0)
2bbe : f0 09 __ BEQ $2bc9 ; (nformi.s151 + 0)
.s18:
2bc0 : c6 44 __ DEC T2 + 0 
2bc2 : a9 2b __ LDA #$2b
.s1025:
2bc4 : a6 44 __ LDX T2 + 0 
2bc6 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s151:
2bc9 : a0 06 __ LDY #$06
2bcb : b1 0d __ LDA (P0),y ; (si + 0)
2bcd : d0 34 __ BNE $2c03 ; (nformi.s24 + 0)
.l30:
2bcf : a0 01 __ LDY #$01
2bd1 : b1 0d __ LDA (P0),y ; (si + 0)
2bd3 : 18 __ __ CLC
2bd4 : 65 44 __ ADC T2 + 0 
2bd6 : b0 04 __ BCS $2bdc ; (nformi.s31 + 0)
.s1006:
2bd8 : c9 11 __ CMP #$11
2bda : 90 0e __ BCC $2bea ; (nformi.s33 + 0)
.s31:
2bdc : c6 44 __ DEC T2 + 0 
2bde : a0 00 __ LDY #$00
2be0 : b1 0d __ LDA (P0),y ; (si + 0)
2be2 : a6 44 __ LDX T2 + 0 
2be4 : 9d f0 bf STA $bff0,x ; (buffer + 0)
2be7 : 4c cf 2b JMP $2bcf ; (nformi.l30 + 0)
.s33:
2bea : a6 44 __ LDX T2 + 0 
2bec : e0 10 __ CPX #$10
2bee : b0 0e __ BCS $2bfe ; (nformi.s23 + 0)
.s34:
2bf0 : 88 __ __ DEY
.l1022:
2bf1 : bd f0 bf LDA $bff0,x ; (buffer + 0)
2bf4 : 91 0f __ STA (P2),y ; (str + 0)
2bf6 : e8 __ __ INX
2bf7 : e0 10 __ CPX #$10
2bf9 : c8 __ __ INY
2bfa : 90 f5 __ BCC $2bf1 ; (nformi.l1022 + 0)
.s1023:
2bfc : 84 1b __ STY ACCU + 0 
.s23:
2bfe : a9 00 __ LDA #$00
2c00 : 85 1c __ STA ACCU + 1 
.s1001:
2c02 : 60 __ __ RTS
.s24:
2c03 : a6 44 __ LDX T2 + 0 
2c05 : e0 10 __ CPX #$10
2c07 : b0 1b __ BCS $2c24 ; (nformi.l27 + 0)
.s25:
2c09 : a0 00 __ LDY #$00
.l1020:
2c0b : bd f0 bf LDA $bff0,x ; (buffer + 0)
2c0e : 91 0f __ STA (P2),y ; (str + 0)
2c10 : e8 __ __ INX
2c11 : e0 10 __ CPX #$10
2c13 : c8 __ __ INY
2c14 : 90 f5 __ BCC $2c0b ; (nformi.l1020 + 0)
.s1021:
2c16 : 84 1b __ STY ACCU + 0 
2c18 : 4c 24 2c JMP $2c24 ; (nformi.l27 + 0)
.s28:
2c1b : 88 __ __ DEY
2c1c : b1 0d __ LDA (P0),y ; (si + 0)
2c1e : a4 1b __ LDY ACCU + 0 
2c20 : 91 0f __ STA (P2),y ; (str + 0)
2c22 : e6 1b __ INC ACCU + 0 
.l27:
2c24 : a5 1b __ LDA ACCU + 0 
2c26 : a0 01 __ LDY #$01
2c28 : d1 0d __ CMP (P0),y ; (si + 0)
2c2a : 90 ef __ BCC $2c1b ; (nformi.s28 + 0)
2c2c : 4c fe 2b JMP $2bfe ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
2c2f : a9 00 __ LDA #$00
2c31 : 85 43 __ STA T0 + 0 
2c33 : a5 15 __ LDA P8 ; (s + 0)
2c35 : f0 21 __ BEQ $2c58 ; (nforml.s169 + 0)
.s4:
2c37 : a5 14 __ LDA P7 ; (v + 3)
2c39 : f0 1d __ BEQ $2c58 ; (nforml.s169 + 0)
.s1032:
2c3b : 10 1b __ BPL $2c58 ; (nforml.s169 + 0)
.s1:
2c3d : 38 __ __ SEC
2c3e : a9 00 __ LDA #$00
2c40 : e5 11 __ SBC P4 ; (v + 0)
2c42 : 85 11 __ STA P4 ; (v + 0)
2c44 : a9 00 __ LDA #$00
2c46 : e5 12 __ SBC P5 ; (v + 1)
2c48 : 85 12 __ STA P5 ; (v + 1)
2c4a : a9 00 __ LDA #$00
2c4c : e5 13 __ SBC P6 ; (v + 2)
2c4e : 85 13 __ STA P6 ; (v + 2)
2c50 : a9 00 __ LDA #$00
2c52 : e5 14 __ SBC P7 ; (v + 3)
2c54 : 85 14 __ STA P7 ; (v + 3)
2c56 : e6 43 __ INC T0 + 0 
.s169:
2c58 : a9 10 __ LDA #$10
2c5a : 85 44 __ STA T2 + 0 
2c5c : a5 14 __ LDA P7 ; (v + 3)
2c5e : d0 0c __ BNE $2c6c ; (nforml.s42 + 0)
.s1024:
2c60 : a5 13 __ LDA P6 ; (v + 2)
2c62 : d0 08 __ BNE $2c6c ; (nforml.s42 + 0)
.s1025:
2c64 : a5 12 __ LDA P5 ; (v + 1)
2c66 : d0 04 __ BNE $2c6c ; (nforml.s42 + 0)
.s1026:
2c68 : c5 11 __ CMP P4 ; (v + 0)
2c6a : b0 0e __ BCS $2c7a ; (nforml.s7 + 0)
.s42:
2c6c : a0 03 __ LDY #$03
2c6e : b1 0d __ LDA (P0),y ; (si + 0)
2c70 : 85 45 __ STA T5 + 0 
2c72 : c8 __ __ INY
2c73 : b1 0d __ LDA (P0),y ; (si + 0)
2c75 : 85 46 __ STA T5 + 1 
2c77 : 4c 46 2d JMP $2d46 ; (nforml.l6 + 0)
.s7:
2c7a : a0 02 __ LDY #$02
2c7c : b1 0d __ LDA (P0),y ; (si + 0)
2c7e : c9 ff __ CMP #$ff
2c80 : d0 04 __ BNE $2c86 ; (nforml.s80 + 0)
.s81:
2c82 : a9 0f __ LDA #$0f
2c84 : d0 05 __ BNE $2c8b ; (nforml.s1039 + 0)
.s80:
2c86 : 38 __ __ SEC
2c87 : a9 10 __ LDA #$10
2c89 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
2c8b : a8 __ __ TAY
2c8c : c4 44 __ CPY T2 + 0 
2c8e : b0 0d __ BCS $2c9d ; (nforml.s10 + 0)
.s9:
2c90 : a9 30 __ LDA #$30
.l1040:
2c92 : c6 44 __ DEC T2 + 0 
2c94 : a6 44 __ LDX T2 + 0 
2c96 : 9d f0 bf STA $bff0,x ; (buffer + 0)
2c99 : c4 44 __ CPY T2 + 0 
2c9b : 90 f5 __ BCC $2c92 ; (nforml.l1040 + 0)
.s10:
2c9d : a0 07 __ LDY #$07
2c9f : b1 0d __ LDA (P0),y ; (si + 0)
2ca1 : f0 20 __ BEQ $2cc3 ; (nforml.s13 + 0)
.s14:
2ca3 : a0 04 __ LDY #$04
2ca5 : b1 0d __ LDA (P0),y ; (si + 0)
2ca7 : d0 1a __ BNE $2cc3 ; (nforml.s13 + 0)
.s1013:
2ca9 : 88 __ __ DEY
2caa : b1 0d __ LDA (P0),y ; (si + 0)
2cac : c9 10 __ CMP #$10
2cae : d0 13 __ BNE $2cc3 ; (nforml.s13 + 0)
.s11:
2cb0 : a9 58 __ LDA #$58
2cb2 : a6 44 __ LDX T2 + 0 
2cb4 : 9d ef bf STA $bfef,x ; (buff + 49)
2cb7 : 8a __ __ TXA
2cb8 : 18 __ __ CLC
2cb9 : 69 fe __ ADC #$fe
2cbb : 85 44 __ STA T2 + 0 
2cbd : aa __ __ TAX
2cbe : a9 30 __ LDA #$30
2cc0 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
2cc3 : a9 00 __ LDA #$00
2cc5 : 85 1b __ STA ACCU + 0 
2cc7 : a5 43 __ LDA T0 + 0 
2cc9 : f0 06 __ BEQ $2cd1 ; (nforml.s16 + 0)
.s15:
2ccb : c6 44 __ DEC T2 + 0 
2ccd : a9 2d __ LDA #$2d
2ccf : d0 0a __ BNE $2cdb ; (nforml.s1038 + 0)
.s16:
2cd1 : a0 05 __ LDY #$05
2cd3 : b1 0d __ LDA (P0),y ; (si + 0)
2cd5 : f0 09 __ BEQ $2ce0 ; (nforml.s151 + 0)
.s18:
2cd7 : c6 44 __ DEC T2 + 0 
2cd9 : a9 2b __ LDA #$2b
.s1038:
2cdb : a6 44 __ LDX T2 + 0 
2cdd : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s151:
2ce0 : a0 06 __ LDY #$06
2ce2 : b1 0d __ LDA (P0),y ; (si + 0)
2ce4 : d0 34 __ BNE $2d1a ; (nforml.s24 + 0)
.l30:
2ce6 : a0 01 __ LDY #$01
2ce8 : b1 0d __ LDA (P0),y ; (si + 0)
2cea : 18 __ __ CLC
2ceb : 65 44 __ ADC T2 + 0 
2ced : b0 04 __ BCS $2cf3 ; (nforml.s31 + 0)
.s1006:
2cef : c9 11 __ CMP #$11
2cf1 : 90 0e __ BCC $2d01 ; (nforml.s33 + 0)
.s31:
2cf3 : c6 44 __ DEC T2 + 0 
2cf5 : a0 00 __ LDY #$00
2cf7 : b1 0d __ LDA (P0),y ; (si + 0)
2cf9 : a6 44 __ LDX T2 + 0 
2cfb : 9d f0 bf STA $bff0,x ; (buffer + 0)
2cfe : 4c e6 2c JMP $2ce6 ; (nforml.l30 + 0)
.s33:
2d01 : a6 44 __ LDX T2 + 0 
2d03 : e0 10 __ CPX #$10
2d05 : b0 0e __ BCS $2d15 ; (nforml.s23 + 0)
.s34:
2d07 : 88 __ __ DEY
.l1035:
2d08 : bd f0 bf LDA $bff0,x ; (buffer + 0)
2d0b : 91 0f __ STA (P2),y ; (str + 0)
2d0d : e8 __ __ INX
2d0e : e0 10 __ CPX #$10
2d10 : c8 __ __ INY
2d11 : 90 f5 __ BCC $2d08 ; (nforml.l1035 + 0)
.s1036:
2d13 : 84 1b __ STY ACCU + 0 
.s23:
2d15 : a9 00 __ LDA #$00
2d17 : 85 1c __ STA ACCU + 1 
.s1001:
2d19 : 60 __ __ RTS
.s24:
2d1a : a6 44 __ LDX T2 + 0 
2d1c : e0 10 __ CPX #$10
2d1e : b0 1b __ BCS $2d3b ; (nforml.l27 + 0)
.s25:
2d20 : a0 00 __ LDY #$00
.l1033:
2d22 : bd f0 bf LDA $bff0,x ; (buffer + 0)
2d25 : 91 0f __ STA (P2),y ; (str + 0)
2d27 : e8 __ __ INX
2d28 : e0 10 __ CPX #$10
2d2a : c8 __ __ INY
2d2b : 90 f5 __ BCC $2d22 ; (nforml.l1033 + 0)
.s1034:
2d2d : 84 1b __ STY ACCU + 0 
2d2f : 4c 3b 2d JMP $2d3b ; (nforml.l27 + 0)
.s28:
2d32 : 88 __ __ DEY
2d33 : b1 0d __ LDA (P0),y ; (si + 0)
2d35 : a4 1b __ LDY ACCU + 0 
2d37 : 91 0f __ STA (P2),y ; (str + 0)
2d39 : e6 1b __ INC ACCU + 0 
.l27:
2d3b : a5 1b __ LDA ACCU + 0 
2d3d : a0 01 __ LDY #$01
2d3f : d1 0d __ CMP (P0),y ; (si + 0)
2d41 : 90 ef __ BCC $2d32 ; (nforml.s28 + 0)
2d43 : 4c 15 2d JMP $2d15 ; (nforml.s23 + 0)
.l6:
2d46 : a5 11 __ LDA P4 ; (v + 0)
2d48 : 85 1b __ STA ACCU + 0 
2d4a : a5 12 __ LDA P5 ; (v + 1)
2d4c : 85 1c __ STA ACCU + 1 
2d4e : a5 13 __ LDA P6 ; (v + 2)
2d50 : 85 1d __ STA ACCU + 2 
2d52 : a5 14 __ LDA P7 ; (v + 3)
2d54 : 85 1e __ STA ACCU + 3 
2d56 : a5 45 __ LDA T5 + 0 
2d58 : 85 03 __ STA WORK + 0 
2d5a : a5 46 __ LDA T5 + 1 
2d5c : 85 04 __ STA WORK + 1 
2d5e : a9 00 __ LDA #$00
2d60 : 85 05 __ STA WORK + 2 
2d62 : 85 06 __ STA WORK + 3 
2d64 : 20 f4 31 JSR $31f4 ; (divmod32 + 0)
2d67 : a5 08 __ LDA WORK + 5 
2d69 : 30 08 __ BMI $2d73 ; (nforml.s78 + 0)
.s1023:
2d6b : d0 0a __ BNE $2d77 ; (nforml.s77 + 0)
.s1022:
2d6d : a5 07 __ LDA WORK + 4 
2d6f : c9 0a __ CMP #$0a
2d71 : b0 04 __ BCS $2d77 ; (nforml.s77 + 0)
.s78:
2d73 : a9 30 __ LDA #$30
2d75 : d0 02 __ BNE $2d79 ; (nforml.s79 + 0)
.s77:
2d77 : a9 37 __ LDA #$37
.s79:
2d79 : 18 __ __ CLC
2d7a : 65 07 __ ADC WORK + 4 
2d7c : c6 44 __ DEC T2 + 0 
2d7e : a6 44 __ LDX T2 + 0 
2d80 : 9d f0 bf STA $bff0,x ; (buffer + 0)
2d83 : a5 1b __ LDA ACCU + 0 
2d85 : 85 11 __ STA P4 ; (v + 0)
2d87 : a5 1c __ LDA ACCU + 1 
2d89 : 85 12 __ STA P5 ; (v + 1)
2d8b : a5 1d __ LDA ACCU + 2 
2d8d : 85 13 __ STA P6 ; (v + 2)
2d8f : a5 1e __ LDA ACCU + 3 
2d91 : 85 14 __ STA P7 ; (v + 3)
2d93 : d0 b1 __ BNE $2d46 ; (nforml.l6 + 0)
.s1018:
2d95 : a5 13 __ LDA P6 ; (v + 2)
2d97 : d0 ad __ BNE $2d46 ; (nforml.l6 + 0)
.s1019:
2d99 : a5 12 __ LDA P5 ; (v + 1)
2d9b : d0 a9 __ BNE $2d46 ; (nforml.l6 + 0)
.s1020:
2d9d : c5 11 __ CMP P4 ; (v + 0)
2d9f : 90 a5 __ BCC $2d46 ; (nforml.l6 + 0)
2da1 : 4c 7a 2c JMP $2c7a ; (nforml.s7 + 0)
--------------------------------------------------------------------
2da4 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2db4 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2dc4 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
2dcf : 20 dd 2d JSR $2ddd ; (getpch + 0)
2dd2 : c9 00 __ CMP #$00
2dd4 : f0 f9 __ BEQ $2dcf ; (getch.s0 + 0)
2dd6 : 85 1b __ STA ACCU + 0 
2dd8 : a9 00 __ LDA #$00
2dda : 85 1c __ STA ACCU + 1 
.s1001:
2ddc : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
2ddd : 20 e4 ff JSR $ffe4 
2de0 : ae 8b 32 LDX $328b ; (giocharmap + 0)
2de3 : e0 01 __ CPX #$01
2de5 : 90 26 __ BCC $2e0d ; (getpch + 48)
2de7 : c9 0d __ CMP #$0d
2de9 : d0 02 __ BNE $2ded ; (getpch + 16)
2deb : a9 0a __ LDA #$0a
2ded : e0 02 __ CPX #$02
2def : 90 1c __ BCC $2e0d ; (getpch + 48)
2df1 : c9 db __ CMP #$db
2df3 : b0 18 __ BCS $2e0d ; (getpch + 48)
2df5 : c9 41 __ CMP #$41
2df7 : 90 14 __ BCC $2e0d ; (getpch + 48)
2df9 : c9 c1 __ CMP #$c1
2dfb : 90 02 __ BCC $2dff ; (getpch + 34)
2dfd : 49 a0 __ EOR #$a0
2dff : c9 7b __ CMP #$7b
2e01 : b0 0a __ BCS $2e0d ; (getpch + 48)
2e03 : c9 61 __ CMP #$61
2e05 : b0 04 __ BCS $2e0b ; (getpch + 46)
2e07 : c9 5b __ CMP #$5b
2e09 : b0 02 __ BCS $2e0d ; (getpch + 48)
2e0b : 49 20 __ EOR #$20
2e0d : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
2e0e : 20 81 ff JSR $ff81 
.s1001:
2e11 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2e12 : a5 d7 __ LDA $d7 
2e14 : 30 03 __ BMI $2e19 ; (screen_setmode.s1001 + 0)
.s6:
2e16 : 20 5f ff JSR $ff5f 
.s1001:
2e19 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_text_attr:
328c : __ __ __ BYT 8d                                              : .
--------------------------------------------------------------------
2e1a : __ __ __ BYT 54 65 73 74 2e 00                               : Test..
--------------------------------------------------------------------
ascToPetTable:
3300 : __ __ __ BYT 00 01 02 03 04 05 06 07 14 20 0d 11 93 0a 0e 0f : ......... ......
3310 : __ __ __ BYT 10 0b 12 13 08 15 16 17 18 19 1a 1b 1c 1d 1e 1f : ................
3320 : __ __ __ BYT 20 21 22 23 24 25 26 27 28 29 2a 2b 2c 2d 2e 2f :  !"#$%&'()*+,-./
3330 : __ __ __ BYT 30 31 32 33 34 35 36 37 38 39 3a 3b 3c 3d 3e 3f : 0123456789:;<=>?
3340 : __ __ __ BYT 40 c1 c2 c3 c4 c5 c6 c7 c8 c9 ca cb cc cd ce cf : @...............
3350 : __ __ __ BYT d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 da 5b 5c 5d 5e 5f : ...........[\]^_
3360 : __ __ __ BYT c0 41 42 43 44 45 46 47 48 49 4a 4b 4c 4d 4e 4f : .ABCDEFGHIJKLMNO
3370 : __ __ __ BYT 50 51 52 53 54 55 56 57 58 59 5a db dc dd de df : PQRSTUVWXYZ.....
3380 : __ __ __ BYT 80 81 82 83 84 85 86 87 88 89 8a 8b 8c 8d 8e 8f : ................
3390 : __ __ __ BYT 90 91 92 0c 94 95 96 97 98 99 9a 9b 9c 9d 9e 9f : ................
33a0 : __ __ __ BYT a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 aa ab ac ad ae af : ................
33b0 : __ __ __ BYT b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 ba bb bc bd be bf : ................
33c0 : __ __ __ BYT 60 61 62 63 64 65 66 67 68 69 6a 6b 6c 6d 6e 6f : `abcdefghijklmno
33d0 : __ __ __ BYT 70 71 72 73 74 75 76 77 78 79 7a 7b 7c 7d 7e 7f : pqrstuvwxyz{|}~.
33e0 : __ __ __ BYT e0 e1 e2 e3 e4 e5 e6 e7 e8 e9 ea eb ec ed ee ef : ................
33f0 : __ __ __ BYT f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 fa fb fc fd fe ff : ................
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
2e20 : a2 03 __ LDX #$03
2e22 : b5 53 __ LDA T8 + 0,x 
2e24 : 9d e4 bf STA $bfe4,x ; (buff + 38)
2e27 : ca __ __ DEX
2e28 : 10 f8 __ BPL $2e22 ; (sprintf.s1000 + 2)
.s0:
2e2a : 18 __ __ CLC
2e2b : a5 23 __ LDA SP + 0 
2e2d : 69 06 __ ADC #$06
2e2f : 85 47 __ STA T0 + 0 
2e31 : a5 24 __ LDA SP + 1 
2e33 : 69 00 __ ADC #$00
2e35 : 85 48 __ STA T0 + 1 
2e37 : a9 00 __ LDA #$00
2e39 : 85 43 __ STA T1 + 0 
2e3b : a0 04 __ LDY #$04
2e3d : b1 23 __ LDA (SP + 0),y 
2e3f : 85 49 __ STA T2 + 0 
2e41 : c8 __ __ INY
2e42 : b1 23 __ LDA (SP + 0),y 
2e44 : 85 4a __ STA T2 + 1 
2e46 : a0 02 __ LDY #$02
2e48 : b1 23 __ LDA (SP + 0),y 
2e4a : 85 4b __ STA T3 + 0 
2e4c : c8 __ __ INY
2e4d : b1 23 __ LDA (SP + 0),y 
2e4f : 85 4c __ STA T3 + 1 
.l2:
2e51 : a0 00 __ LDY #$00
2e53 : b1 49 __ LDA (T2 + 0),y 
2e55 : d0 0f __ BNE $2e66 ; (sprintf.s3 + 0)
.s4:
2e57 : a4 43 __ LDY T1 + 0 
2e59 : 91 4b __ STA (T3 + 0),y 
.s1001:
2e5b : a2 03 __ LDX #$03
2e5d : bd e4 bf LDA $bfe4,x ; (buff + 38)
2e60 : 95 53 __ STA T8 + 0,x 
2e62 : ca __ __ DEX
2e63 : 10 f8 __ BPL $2e5d ; (sprintf.s1001 + 2)
2e65 : 60 __ __ RTS
.s3:
2e66 : c9 25 __ CMP #$25
2e68 : f0 22 __ BEQ $2e8c ; (sprintf.s5 + 0)
.s6:
2e6a : a4 43 __ LDY T1 + 0 
2e6c : 91 4b __ STA (T3 + 0),y 
2e6e : e6 49 __ INC T2 + 0 
2e70 : d0 02 __ BNE $2e74 ; (sprintf.s1084 + 0)
.s1083:
2e72 : e6 4a __ INC T2 + 1 
.s1084:
2e74 : c8 __ __ INY
2e75 : 84 43 __ STY T1 + 0 
2e77 : 98 __ __ TYA
2e78 : c0 28 __ CPY #$28
2e7a : 90 d5 __ BCC $2e51 ; (sprintf.l2 + 0)
.s102:
2e7c : 18 __ __ CLC
2e7d : 65 4b __ ADC T3 + 0 
2e7f : 85 4b __ STA T3 + 0 
2e81 : 90 02 __ BCC $2e85 ; (sprintf.s1086 + 0)
.s1085:
2e83 : e6 4c __ INC T3 + 1 
.s1086:
2e85 : a9 00 __ LDA #$00
.s1050:
2e87 : 85 43 __ STA T1 + 0 
2e89 : 4c 51 2e JMP $2e51 ; (sprintf.l2 + 0)
.s5:
2e8c : 8c ec bf STY $bfec ; (buff + 46)
2e8f : 8c ed bf STY $bfed ; (buff + 47)
2e92 : 8c ee bf STY $bfee ; (buff + 48)
2e95 : 8c ef bf STY $bfef ; (buff + 49)
2e98 : a9 0a __ LDA #$0a
2e9a : 8d eb bf STA $bfeb ; (buff + 45)
2e9d : a5 43 __ LDA T1 + 0 
2e9f : f0 0b __ BEQ $2eac ; (sprintf.s10 + 0)
.s8:
2ea1 : 18 __ __ CLC
2ea2 : 65 4b __ ADC T3 + 0 
2ea4 : 85 4b __ STA T3 + 0 
2ea6 : 90 02 __ BCC $2eaa ; (sprintf.s1062 + 0)
.s1061:
2ea8 : e6 4c __ INC T3 + 1 
.s1062:
2eaa : 84 43 __ STY T1 + 0 
.s10:
2eac : a0 01 __ LDY #$01
2eae : b1 49 __ LDA (T2 + 0),y 
2eb0 : aa __ __ TAX
2eb1 : a9 20 __ LDA #$20
2eb3 : 8d e8 bf STA $bfe8 ; (buff + 42)
2eb6 : a9 00 __ LDA #$00
2eb8 : 8d e9 bf STA $bfe9 ; (buff + 43)
2ebb : a9 ff __ LDA #$ff
2ebd : 8d ea bf STA $bfea ; (buff + 44)
2ec0 : 18 __ __ CLC
2ec1 : a5 49 __ LDA T2 + 0 
2ec3 : 69 02 __ ADC #$02
.l15:
2ec5 : 85 49 __ STA T2 + 0 
2ec7 : 90 02 __ BCC $2ecb ; (sprintf.s1064 + 0)
.s1063:
2ec9 : e6 4a __ INC T2 + 1 
.s1064:
2ecb : 8a __ __ TXA
2ecc : e0 2b __ CPX #$2b
2ece : d0 08 __ BNE $2ed8 ; (sprintf.s18 + 0)
.s17:
2ed0 : a9 01 __ LDA #$01
2ed2 : 8d ed bf STA $bfed ; (buff + 47)
2ed5 : 4c 1f 31 JMP $311f ; (sprintf.s223 + 0)
.s18:
2ed8 : c9 30 __ CMP #$30
2eda : d0 06 __ BNE $2ee2 ; (sprintf.s21 + 0)
.s20:
2edc : 8d e8 bf STA $bfe8 ; (buff + 42)
2edf : 4c 1f 31 JMP $311f ; (sprintf.s223 + 0)
.s21:
2ee2 : e0 23 __ CPX #$23
2ee4 : d0 08 __ BNE $2eee ; (sprintf.s24 + 0)
.s23:
2ee6 : a9 01 __ LDA #$01
2ee8 : 8d ef bf STA $bfef ; (buff + 49)
2eeb : 4c 1f 31 JMP $311f ; (sprintf.s223 + 0)
.s24:
2eee : e0 2d __ CPX #$2d
2ef0 : d0 08 __ BNE $2efa ; (sprintf.s16 + 0)
.s26:
2ef2 : a9 01 __ LDA #$01
2ef4 : 8d ee bf STA $bfee ; (buff + 48)
2ef7 : 4c 1f 31 JMP $311f ; (sprintf.s223 + 0)
.s16:
2efa : 86 45 __ STX T4 + 0 
2efc : e0 30 __ CPX #$30
2efe : 90 53 __ BCC $2f53 ; (sprintf.s32 + 0)
.s33:
2f00 : e0 3a __ CPX #$3a
2f02 : b0 4f __ BCS $2f53 ; (sprintf.s32 + 0)
.s30:
2f04 : a9 00 __ LDA #$00
2f06 : 85 4d __ STA T6 + 0 
2f08 : 85 4e __ STA T6 + 1 
2f0a : e0 3a __ CPX #$3a
2f0c : b0 40 __ BCS $2f4e ; (sprintf.s36 + 0)
.l35:
2f0e : a5 4d __ LDA T6 + 0 
2f10 : 0a __ __ ASL
2f11 : 85 1b __ STA ACCU + 0 
2f13 : a5 4e __ LDA T6 + 1 
2f15 : 2a __ __ ROL
2f16 : 06 1b __ ASL ACCU + 0 
2f18 : 2a __ __ ROL
2f19 : aa __ __ TAX
2f1a : 18 __ __ CLC
2f1b : a5 1b __ LDA ACCU + 0 
2f1d : 65 4d __ ADC T6 + 0 
2f1f : 85 4d __ STA T6 + 0 
2f21 : 8a __ __ TXA
2f22 : 65 4e __ ADC T6 + 1 
2f24 : 06 4d __ ASL T6 + 0 
2f26 : 2a __ __ ROL
2f27 : aa __ __ TAX
2f28 : 18 __ __ CLC
2f29 : a5 4d __ LDA T6 + 0 
2f2b : 65 45 __ ADC T4 + 0 
2f2d : 90 01 __ BCC $2f30 ; (sprintf.s1080 + 0)
.s1079:
2f2f : e8 __ __ INX
.s1080:
2f30 : 38 __ __ SEC
2f31 : e9 30 __ SBC #$30
2f33 : 85 4d __ STA T6 + 0 
2f35 : 8a __ __ TXA
2f36 : e9 00 __ SBC #$00
2f38 : 85 4e __ STA T6 + 1 
2f3a : a0 00 __ LDY #$00
2f3c : b1 49 __ LDA (T2 + 0),y 
2f3e : 85 45 __ STA T4 + 0 
2f40 : e6 49 __ INC T2 + 0 
2f42 : d0 02 __ BNE $2f46 ; (sprintf.s1082 + 0)
.s1081:
2f44 : e6 4a __ INC T2 + 1 
.s1082:
2f46 : c9 30 __ CMP #$30
2f48 : 90 04 __ BCC $2f4e ; (sprintf.s36 + 0)
.s37:
2f4a : c9 3a __ CMP #$3a
2f4c : 90 c0 __ BCC $2f0e ; (sprintf.l35 + 0)
.s36:
2f4e : a5 4d __ LDA T6 + 0 
2f50 : 8d e9 bf STA $bfe9 ; (buff + 43)
.s32:
2f53 : a5 45 __ LDA T4 + 0 
2f55 : c9 2e __ CMP #$2e
2f57 : d0 51 __ BNE $2faa ; (sprintf.s40 + 0)
.s38:
2f59 : a9 00 __ LDA #$00
2f5b : 85 4d __ STA T6 + 0 
.l208:
2f5d : 85 4e __ STA T6 + 1 
2f5f : a0 00 __ LDY #$00
2f61 : b1 49 __ LDA (T2 + 0),y 
2f63 : 85 45 __ STA T4 + 0 
2f65 : e6 49 __ INC T2 + 0 
2f67 : d0 02 __ BNE $2f6b ; (sprintf.s1066 + 0)
.s1065:
2f69 : e6 4a __ INC T2 + 1 
.s1066:
2f6b : c9 30 __ CMP #$30
2f6d : 90 04 __ BCC $2f73 ; (sprintf.s43 + 0)
.s44:
2f6f : c9 3a __ CMP #$3a
2f71 : 90 0a __ BCC $2f7d ; (sprintf.s42 + 0)
.s43:
2f73 : a5 4d __ LDA T6 + 0 
2f75 : 8d ea bf STA $bfea ; (buff + 44)
2f78 : a5 45 __ LDA T4 + 0 
2f7a : 4c aa 2f JMP $2faa ; (sprintf.s40 + 0)
.s42:
2f7d : a5 4d __ LDA T6 + 0 
2f7f : 0a __ __ ASL
2f80 : 85 1b __ STA ACCU + 0 
2f82 : a5 4e __ LDA T6 + 1 
2f84 : 2a __ __ ROL
2f85 : 06 1b __ ASL ACCU + 0 
2f87 : 2a __ __ ROL
2f88 : aa __ __ TAX
2f89 : 18 __ __ CLC
2f8a : a5 1b __ LDA ACCU + 0 
2f8c : 65 4d __ ADC T6 + 0 
2f8e : 85 4d __ STA T6 + 0 
2f90 : 8a __ __ TXA
2f91 : 65 4e __ ADC T6 + 1 
2f93 : 06 4d __ ASL T6 + 0 
2f95 : 2a __ __ ROL
2f96 : aa __ __ TAX
2f97 : 18 __ __ CLC
2f98 : a5 4d __ LDA T6 + 0 
2f9a : 65 45 __ ADC T4 + 0 
2f9c : 90 01 __ BCC $2f9f ; (sprintf.s1078 + 0)
.s1077:
2f9e : e8 __ __ INX
.s1078:
2f9f : 38 __ __ SEC
2fa0 : e9 30 __ SBC #$30
2fa2 : 85 4d __ STA T6 + 0 
2fa4 : 8a __ __ TXA
2fa5 : e9 00 __ SBC #$00
2fa7 : 4c 5d 2f JMP $2f5d ; (sprintf.l208 + 0)
.s40:
2faa : c9 64 __ CMP #$64
2fac : d0 05 __ BNE $2fb3 ; (sprintf.s46 + 0)
.s45:
2fae : a9 01 __ LDA #$01
2fb0 : 4c f8 30 JMP $30f8 ; (sprintf.s224 + 0)
.s46:
2fb3 : c9 75 __ CMP #$75
2fb5 : d0 03 __ BNE $2fba ; (sprintf.s49 + 0)
2fb7 : 4c f6 30 JMP $30f6 ; (sprintf.s247 + 0)
.s49:
2fba : c9 78 __ CMP #$78
2fbc : d0 0d __ BNE $2fcb ; (sprintf.s52 + 0)
.s51:
2fbe : a9 10 __ LDA #$10
2fc0 : 8d eb bf STA $bfeb ; (buff + 45)
2fc3 : a9 00 __ LDA #$00
2fc5 : 8d ec bf STA $bfec ; (buff + 46)
2fc8 : 4c f6 30 JMP $30f6 ; (sprintf.s247 + 0)
.s52:
2fcb : c9 6c __ CMP #$6c
2fcd : d0 03 __ BNE $2fd2 ; (sprintf.s55 + 0)
2fcf : 4c 84 30 JMP $3084 ; (sprintf.s54 + 0)
.s55:
2fd2 : c9 73 __ CMP #$73
2fd4 : f0 2f __ BEQ $3005 ; (sprintf.s66 + 0)
.s67:
2fd6 : c9 63 __ CMP #$63
2fd8 : f0 10 __ BEQ $2fea ; (sprintf.s96 + 0)
.s97:
2fda : 09 00 __ ORA #$00
2fdc : d0 03 __ BNE $2fe1 ; (sprintf.s99 + 0)
2fde : 4c 51 2e JMP $2e51 ; (sprintf.l2 + 0)
.s99:
2fe1 : a4 43 __ LDY T1 + 0 
2fe3 : 91 4b __ STA (T3 + 0),y 
2fe5 : e6 43 __ INC T1 + 0 
2fe7 : 4c 51 2e JMP $2e51 ; (sprintf.l2 + 0)
.s96:
2fea : a0 00 __ LDY #$00
2fec : b1 47 __ LDA (T0 + 0),y 
2fee : a4 43 __ LDY T1 + 0 
2ff0 : 91 4b __ STA (T3 + 0),y 
2ff2 : e6 43 __ INC T1 + 0 
.s221:
2ff4 : 18 __ __ CLC
2ff5 : a5 47 __ LDA T0 + 0 
2ff7 : 69 02 __ ADC #$02
2ff9 : 85 47 __ STA T0 + 0 
2ffb : b0 03 __ BCS $3000 ; (sprintf.s1067 + 0)
2ffd : 4c 51 2e JMP $2e51 ; (sprintf.l2 + 0)
.s1067:
3000 : e6 48 __ INC T0 + 1 
3002 : 4c 51 2e JMP $2e51 ; (sprintf.l2 + 0)
.s66:
3005 : a0 00 __ LDY #$00
3007 : 84 45 __ STY T4 + 0 
3009 : b1 47 __ LDA (T0 + 0),y 
300b : 85 4d __ STA T6 + 0 
300d : c8 __ __ INY
300e : b1 47 __ LDA (T0 + 0),y 
3010 : 85 4e __ STA T6 + 1 
3012 : 18 __ __ CLC
3013 : a5 47 __ LDA T0 + 0 
3015 : 69 02 __ ADC #$02
3017 : 85 47 __ STA T0 + 0 
3019 : 90 02 __ BCC $301d ; (sprintf.s1074 + 0)
.s1073:
301b : e6 48 __ INC T0 + 1 
.s1074:
301d : ad e9 bf LDA $bfe9 ; (buff + 43)
3020 : f0 0d __ BEQ $302f ; (sprintf.s71 + 0)
.s1053:
3022 : a0 00 __ LDY #$00
3024 : b1 4d __ LDA (T6 + 0),y 
3026 : f0 05 __ BEQ $302d ; (sprintf.s1054 + 0)
.l73:
3028 : c8 __ __ INY
3029 : b1 4d __ LDA (T6 + 0),y 
302b : d0 fb __ BNE $3028 ; (sprintf.l73 + 0)
.s1054:
302d : 84 45 __ STY T4 + 0 
.s71:
302f : ad ee bf LDA $bfee ; (buff + 48)
3032 : d0 19 __ BNE $304d ; (sprintf.l87 + 0)
.s1057:
3034 : a6 45 __ LDX T4 + 0 
3036 : ec e9 bf CPX $bfe9 ; (buff + 43)
3039 : a4 43 __ LDY T1 + 0 
303b : b0 0c __ BCS $3049 ; (sprintf.s1058 + 0)
.l79:
303d : ad e8 bf LDA $bfe8 ; (buff + 42)
3040 : 91 4b __ STA (T3 + 0),y 
3042 : e8 __ __ INX
3043 : ec e9 bf CPX $bfe9 ; (buff + 43)
3046 : c8 __ __ INY
3047 : 90 f4 __ BCC $303d ; (sprintf.l79 + 0)
.s1058:
3049 : 86 45 __ STX T4 + 0 
304b : 84 43 __ STY T1 + 0 
.l87:
304d : a0 00 __ LDY #$00
304f : b1 4d __ LDA (T6 + 0),y 
3051 : f0 0f __ BEQ $3062 ; (sprintf.s83 + 0)
.s88:
3053 : a4 43 __ LDY T1 + 0 
3055 : 91 4b __ STA (T3 + 0),y 
3057 : e6 43 __ INC T1 + 0 
3059 : e6 4d __ INC T6 + 0 
305b : d0 f0 __ BNE $304d ; (sprintf.l87 + 0)
.s1075:
305d : e6 4e __ INC T6 + 1 
305f : 4c 4d 30 JMP $304d ; (sprintf.l87 + 0)
.s83:
3062 : ad ee bf LDA $bfee ; (buff + 48)
3065 : d0 03 __ BNE $306a ; (sprintf.s1055 + 0)
3067 : 4c 51 2e JMP $2e51 ; (sprintf.l2 + 0)
.s1055:
306a : a6 45 __ LDX T4 + 0 
306c : ec e9 bf CPX $bfe9 ; (buff + 43)
306f : a4 43 __ LDY T1 + 0 
3071 : b0 0c __ BCS $307f ; (sprintf.s1056 + 0)
.l94:
3073 : ad e8 bf LDA $bfe8 ; (buff + 42)
3076 : 91 4b __ STA (T3 + 0),y 
3078 : e8 __ __ INX
3079 : ec e9 bf CPX $bfe9 ; (buff + 43)
307c : c8 __ __ INY
307d : 90 f4 __ BCC $3073 ; (sprintf.l94 + 0)
.s1056:
307f : 84 43 __ STY T1 + 0 
3081 : 4c 51 2e JMP $2e51 ; (sprintf.l2 + 0)
.s54:
3084 : a0 00 __ LDY #$00
3086 : b1 47 __ LDA (T0 + 0),y 
3088 : 85 53 __ STA T8 + 0 
308a : c8 __ __ INY
308b : b1 47 __ LDA (T0 + 0),y 
308d : 85 54 __ STA T8 + 1 
308f : c8 __ __ INY
3090 : b1 47 __ LDA (T0 + 0),y 
3092 : 85 55 __ STA T8 + 2 
3094 : c8 __ __ INY
3095 : b1 47 __ LDA (T0 + 0),y 
3097 : 85 56 __ STA T8 + 3 
3099 : 18 __ __ CLC
309a : a5 47 __ LDA T0 + 0 
309c : 69 04 __ ADC #$04
309e : 85 47 __ STA T0 + 0 
30a0 : 90 02 __ BCC $30a4 ; (sprintf.s1070 + 0)
.s1069:
30a2 : e6 48 __ INC T0 + 1 
.s1070:
30a4 : a0 00 __ LDY #$00
30a6 : b1 49 __ LDA (T2 + 0),y 
30a8 : aa __ __ TAX
30a9 : e6 49 __ INC T2 + 0 
30ab : d0 02 __ BNE $30af ; (sprintf.s1072 + 0)
.s1071:
30ad : e6 4a __ INC T2 + 1 
.s1072:
30af : 8a __ __ TXA
30b0 : e0 64 __ CPX #$64
30b2 : d0 04 __ BNE $30b8 ; (sprintf.s58 + 0)
.s57:
30b4 : a9 01 __ LDA #$01
30b6 : d0 14 __ BNE $30cc ; (sprintf.s222 + 0)
.s58:
30b8 : c9 75 __ CMP #$75
30ba : f0 0f __ BEQ $30cb ; (sprintf.s246 + 0)
.s61:
30bc : c9 78 __ CMP #$78
30be : f0 03 __ BEQ $30c3 ; (sprintf.s63 + 0)
30c0 : 4c 51 2e JMP $2e51 ; (sprintf.l2 + 0)
.s63:
30c3 : 8c ec bf STY $bfec ; (buff + 46)
30c6 : a9 10 __ LDA #$10
30c8 : 8d eb bf STA $bfeb ; (buff + 45)
.s246:
30cb : 98 __ __ TYA
.s222:
30cc : 85 15 __ STA P8 
30ce : a5 4b __ LDA T3 + 0 
30d0 : 85 0f __ STA P2 ; (fmt + 0)
30d2 : a5 4c __ LDA T3 + 1 
30d4 : 85 10 __ STA P3 ; (fmt + 1)
30d6 : a5 53 __ LDA T8 + 0 
30d8 : 85 11 __ STA P4 ; (fmt + 2)
30da : a5 54 __ LDA T8 + 1 
30dc : 85 12 __ STA P5 ; (fmt + 3)
30de : a5 55 __ LDA T8 + 2 
30e0 : 85 13 __ STA P6 
30e2 : a5 56 __ LDA T8 + 3 
30e4 : 85 14 __ STA P7 
30e6 : a9 e8 __ LDA #$e8
30e8 : 85 0d __ STA P0 ; (str + 0)
30ea : a9 bf __ LDA #$bf
30ec : 85 0e __ STA P1 ; (str + 1)
30ee : 20 2f 2c JSR $2c2f ; (nforml.s0 + 0)
30f1 : a5 1b __ LDA ACCU + 0 
30f3 : 4c 87 2e JMP $2e87 ; (sprintf.s1050 + 0)
.s247:
30f6 : a9 00 __ LDA #$00
.s224:
30f8 : 85 13 __ STA P6 
30fa : a5 4b __ LDA T3 + 0 
30fc : 85 0f __ STA P2 ; (fmt + 0)
30fe : a5 4c __ LDA T3 + 1 
3100 : 85 10 __ STA P3 ; (fmt + 1)
3102 : a0 00 __ LDY #$00
3104 : b1 47 __ LDA (T0 + 0),y 
3106 : 85 11 __ STA P4 ; (fmt + 2)
3108 : c8 __ __ INY
3109 : b1 47 __ LDA (T0 + 0),y 
310b : 85 12 __ STA P5 ; (fmt + 3)
310d : a9 e8 __ LDA #$e8
310f : 85 0d __ STA P0 ; (str + 0)
3111 : a9 bf __ LDA #$bf
3113 : 85 0e __ STA P1 ; (str + 1)
3115 : 20 f8 2a JSR $2af8 ; (nformi.s0 + 0)
3118 : a5 1b __ LDA ACCU + 0 
311a : 85 43 __ STA T1 + 0 
311c : 4c f4 2f JMP $2ff4 ; (sprintf.s221 + 0)
.s223:
311f : a0 00 __ LDY #$00
3121 : b1 49 __ LDA (T2 + 0),y 
3123 : aa __ __ TAX
3124 : 18 __ __ CLC
3125 : a5 49 __ LDA T2 + 0 
3127 : 69 01 __ ADC #$01
3129 : 4c c5 2e JMP $2ec5 ; (sprintf.l15 + 0)
--------------------------------------------------------------------
linebuffer:
328d : __ __ __ BSS	81
--------------------------------------------------------------------
312c : __ __ __ BYT 56 44 43 20 4d 65 6d 6f 72 79 20 44 65 74 65 63 : VDC Memory Detec
313c : __ __ __ BYT 74 65 64 3a 20 25 75 00                         : ted: %u.
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
3144 : 20 62 ff JSR $ff62 
.s1001:
3147 : 60 __ __ RTS
--------------------------------------------------------------------
3148 : __ __ __ BYT 45 78 74 65 6e 64 65 64 20 6d 65 6d 6f 72 79 20 : Extended memory 
3158 : __ __ __ BYT 73 65 74 00                                     : set.
--------------------------------------------------------------------
315c : __ __ __ BYT 44 65 66 61 75 6c 74 20 6d 65 6d 6f 72 79 20 73 : Default memory s
316c : __ __ __ BYT 65 74 00                                        : et.
--------------------------------------------------------------------
divmod: ; divmod
316f : a5 1c __ LDA ACCU + 1 
3171 : d0 31 __ BNE $31a4 ; (divmod + 53)
3173 : a5 04 __ LDA WORK + 1 
3175 : d0 1e __ BNE $3195 ; (divmod + 38)
3177 : 85 06 __ STA WORK + 3 
3179 : a2 04 __ LDX #$04
317b : 06 1b __ ASL ACCU + 0 
317d : 2a __ __ ROL
317e : c5 03 __ CMP WORK + 0 
3180 : 90 02 __ BCC $3184 ; (divmod + 21)
3182 : e5 03 __ SBC WORK + 0 
3184 : 26 1b __ ROL ACCU + 0 
3186 : 2a __ __ ROL
3187 : c5 03 __ CMP WORK + 0 
3189 : 90 02 __ BCC $318d ; (divmod + 30)
318b : e5 03 __ SBC WORK + 0 
318d : 26 1b __ ROL ACCU + 0 
318f : ca __ __ DEX
3190 : d0 eb __ BNE $317d ; (divmod + 14)
3192 : 85 05 __ STA WORK + 2 
3194 : 60 __ __ RTS
3195 : a5 1b __ LDA ACCU + 0 
3197 : 85 05 __ STA WORK + 2 
3199 : a5 1c __ LDA ACCU + 1 
319b : 85 06 __ STA WORK + 3 
319d : a9 00 __ LDA #$00
319f : 85 1b __ STA ACCU + 0 
31a1 : 85 1c __ STA ACCU + 1 
31a3 : 60 __ __ RTS
31a4 : a5 04 __ LDA WORK + 1 
31a6 : d0 1f __ BNE $31c7 ; (divmod + 88)
31a8 : a5 03 __ LDA WORK + 0 
31aa : 30 1b __ BMI $31c7 ; (divmod + 88)
31ac : a9 00 __ LDA #$00
31ae : 85 06 __ STA WORK + 3 
31b0 : a2 10 __ LDX #$10
31b2 : 06 1b __ ASL ACCU + 0 
31b4 : 26 1c __ ROL ACCU + 1 
31b6 : 2a __ __ ROL
31b7 : c5 03 __ CMP WORK + 0 
31b9 : 90 02 __ BCC $31bd ; (divmod + 78)
31bb : e5 03 __ SBC WORK + 0 
31bd : 26 1b __ ROL ACCU + 0 
31bf : 26 1c __ ROL ACCU + 1 
31c1 : ca __ __ DEX
31c2 : d0 f2 __ BNE $31b6 ; (divmod + 71)
31c4 : 85 05 __ STA WORK + 2 
31c6 : 60 __ __ RTS
31c7 : a9 00 __ LDA #$00
31c9 : 85 05 __ STA WORK + 2 
31cb : 85 06 __ STA WORK + 3 
31cd : 84 02 __ STY $02 
31cf : a0 10 __ LDY #$10
31d1 : 18 __ __ CLC
31d2 : 26 1b __ ROL ACCU + 0 
31d4 : 26 1c __ ROL ACCU + 1 
31d6 : 26 05 __ ROL WORK + 2 
31d8 : 26 06 __ ROL WORK + 3 
31da : 38 __ __ SEC
31db : a5 05 __ LDA WORK + 2 
31dd : e5 03 __ SBC WORK + 0 
31df : aa __ __ TAX
31e0 : a5 06 __ LDA WORK + 3 
31e2 : e5 04 __ SBC WORK + 1 
31e4 : 90 04 __ BCC $31ea ; (divmod + 123)
31e6 : 86 05 __ STX WORK + 2 
31e8 : 85 06 __ STA WORK + 3 
31ea : 88 __ __ DEY
31eb : d0 e5 __ BNE $31d2 ; (divmod + 99)
31ed : 26 1b __ ROL ACCU + 0 
31ef : 26 1c __ ROL ACCU + 1 
31f1 : a4 02 __ LDY $02 
31f3 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
31f4 : 84 02 __ STY $02 
31f6 : a0 20 __ LDY #$20
31f8 : a9 00 __ LDA #$00
31fa : 85 07 __ STA WORK + 4 
31fc : 85 08 __ STA WORK + 5 
31fe : 85 09 __ STA WORK + 6 
3200 : 85 0a __ STA WORK + 7 
3202 : a5 05 __ LDA WORK + 2 
3204 : 05 06 __ ORA WORK + 3 
3206 : d0 39 __ BNE $3241 ; (divmod32 + 77)
3208 : 18 __ __ CLC
3209 : 26 1b __ ROL ACCU + 0 
320b : 26 1c __ ROL ACCU + 1 
320d : 26 1d __ ROL ACCU + 2 
320f : 26 1e __ ROL ACCU + 3 
3211 : 26 07 __ ROL WORK + 4 
3213 : 26 08 __ ROL WORK + 5 
3215 : 90 0c __ BCC $3223 ; (divmod32 + 47)
3217 : a5 07 __ LDA WORK + 4 
3219 : e5 03 __ SBC WORK + 0 
321b : aa __ __ TAX
321c : a5 08 __ LDA WORK + 5 
321e : e5 04 __ SBC WORK + 1 
3220 : 38 __ __ SEC
3221 : b0 0c __ BCS $322f ; (divmod32 + 59)
3223 : 38 __ __ SEC
3224 : a5 07 __ LDA WORK + 4 
3226 : e5 03 __ SBC WORK + 0 
3228 : aa __ __ TAX
3229 : a5 08 __ LDA WORK + 5 
322b : e5 04 __ SBC WORK + 1 
322d : 90 04 __ BCC $3233 ; (divmod32 + 63)
322f : 86 07 __ STX WORK + 4 
3231 : 85 08 __ STA WORK + 5 
3233 : 88 __ __ DEY
3234 : d0 d3 __ BNE $3209 ; (divmod32 + 21)
3236 : 26 1b __ ROL ACCU + 0 
3238 : 26 1c __ ROL ACCU + 1 
323a : 26 1d __ ROL ACCU + 2 
323c : 26 1e __ ROL ACCU + 3 
323e : a4 02 __ LDY $02 
3240 : 60 __ __ RTS
3241 : 18 __ __ CLC
3242 : 26 1b __ ROL ACCU + 0 
3244 : 26 1c __ ROL ACCU + 1 
3246 : 26 1d __ ROL ACCU + 2 
3248 : 26 1e __ ROL ACCU + 3 
324a : 26 07 __ ROL WORK + 4 
324c : 26 08 __ ROL WORK + 5 
324e : 26 09 __ ROL WORK + 6 
3250 : 26 0a __ ROL WORK + 7 
3252 : a5 07 __ LDA WORK + 4 
3254 : c5 03 __ CMP WORK + 0 
3256 : a5 08 __ LDA WORK + 5 
3258 : e5 04 __ SBC WORK + 1 
325a : a5 09 __ LDA WORK + 6 
325c : e5 05 __ SBC WORK + 2 
325e : a5 0a __ LDA WORK + 7 
3260 : e5 06 __ SBC WORK + 3 
3262 : 90 18 __ BCC $327c ; (divmod32 + 136)
3264 : a5 07 __ LDA WORK + 4 
3266 : e5 03 __ SBC WORK + 0 
3268 : 85 07 __ STA WORK + 4 
326a : a5 08 __ LDA WORK + 5 
326c : e5 04 __ SBC WORK + 1 
326e : 85 08 __ STA WORK + 5 
3270 : a5 09 __ LDA WORK + 6 
3272 : e5 05 __ SBC WORK + 2 
3274 : 85 09 __ STA WORK + 6 
3276 : a5 0a __ LDA WORK + 7 
3278 : e5 06 __ SBC WORK + 3 
327a : 85 0a __ STA WORK + 7 
327c : 88 __ __ DEY
327d : d0 c3 __ BNE $3242 ; (divmod32 + 78)
327f : 26 1b __ ROL ACCU + 0 
3281 : 26 1c __ ROL ACCU + 1 
3283 : 26 1d __ ROL ACCU + 2 
3285 : 26 1e __ ROL ACCU + 3 
3287 : a4 02 __ LDY $02 
3289 : 60 __ __ RTS
