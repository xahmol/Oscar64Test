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
1c13 : 8e cc 3b STX $3bcc ; (spentry + 0)
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
1c35 : a9 91 __ LDA #$91
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
1c50 : a9 a6 __ LDA #$a6
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
1c80 : a5 53 __ LDA T1 + 0 
1c82 : 8d a8 bf STA $bfa8 ; (main@stack + 0)
1c85 : a5 54 __ LDA T3 + 0 
1c87 : 8d a9 bf STA $bfa9 ; (main@stack + 1)
1c8a : a5 55 __ LDA T3 + 1 
1c8c : 8d aa bf STA $bfaa ; (main@stack + 2)
1c8f : 38 __ __ SEC
1c90 : a5 23 __ LDA SP + 0 
1c92 : e9 08 __ SBC #$08
1c94 : 85 23 __ STA SP + 0 
1c96 : b0 02 __ BCS $1c9a ; (main.s0 + 0)
1c98 : c6 24 __ DEC SP + 1 
.s0:
1c9a : a9 1a __ LDA #$1a
1c9c : 8d 00 d6 STA $d600 
1c9f : a9 00 __ LDA #$00
1ca1 : 85 52 __ STA T0 + 0 
1ca3 : 85 53 __ STA T1 + 0 
.l7053:
1ca5 : 2c 00 d6 BIT $d600 
1ca8 : 10 fb __ BPL $1ca5 ; (main.l7053 + 0)
.s9:
1caa : ad 01 d6 LDA $d601 
1cad : 29 f0 __ AND #$f0
1caf : aa __ __ TAX
1cb0 : a9 1a __ LDA #$1a
1cb2 : 8d 00 d6 STA $d600 
.l7055:
1cb5 : 2c 00 d6 BIT $d600 
1cb8 : 10 fb __ BPL $1cb5 ; (main.l7055 + 0)
.s15:
1cba : 8e 01 d6 STX $d601 
1cbd : 8d 00 d6 STA $d600 
.l7057:
1cc0 : 2c 00 d6 BIT $d600 
1cc3 : 10 fb __ BPL $1cc0 ; (main.l7057 + 0)
.s22:
1cc5 : ad 01 d6 LDA $d601 
1cc8 : 29 0f __ AND #$0f
1cca : 09 d0 __ ORA #$d0
1ccc : aa __ __ TAX
1ccd : a9 1a __ LDA #$1a
1ccf : 8d 00 d6 STA $d600 
.l7059:
1cd2 : 2c 00 d6 BIT $d600 
1cd5 : 10 fb __ BPL $1cd2 ; (main.l7059 + 0)
.s28:
1cd7 : 8e 01 d6 STX $d601 
1cda : a9 8d __ LDA #$8d
1cdc : 8d d5 3b STA $3bd5 ; (vdc_state + 7)
1cdf : a9 1c __ LDA #$1c
1ce1 : 8d 00 d6 STA $d600 
.l7061:
1ce4 : 2c 00 d6 BIT $d600 
1ce7 : 10 fb __ BPL $1ce4 ; (main.l7061 + 0)
.s34:
1ce9 : ad 01 d6 LDA $d601 
1cec : aa __ __ TAX
1ced : 09 10 __ ORA #$10
1cef : a8 __ __ TAY
1cf0 : a9 1c __ LDA #$1c
1cf2 : 8d 00 d6 STA $d600 
.l7063:
1cf5 : 2c 00 d6 BIT $d600 
1cf8 : 10 fb __ BPL $1cf5 ; (main.l7063 + 0)
.s41:
1cfa : 8c 01 d6 STY $d601 
1cfd : a9 12 __ LDA #$12
1cff : 8d 00 d6 STA $d600 
.l7065:
1d02 : 2c 00 d6 BIT $d600 
1d05 : 10 fb __ BPL $1d02 ; (main.l7065 + 0)
.s48:
1d07 : a9 1f __ LDA #$1f
1d09 : 8d 01 d6 STA $d601 
1d0c : a9 13 __ LDA #$13
1d0e : 8d 00 d6 STA $d600 
.l7067:
1d11 : 2c 00 d6 BIT $d600 
1d14 : 10 fb __ BPL $1d11 ; (main.l7067 + 0)
.s53:
1d16 : a9 ff __ LDA #$ff
1d18 : 8d 01 d6 STA $d601 
1d1b : a9 1f __ LDA #$1f
1d1d : 8d 00 d6 STA $d600 
.l7069:
1d20 : 2c 00 d6 BIT $d600 
1d23 : 10 fb __ BPL $1d20 ; (main.l7069 + 0)
.s57:
1d25 : a9 00 __ LDA #$00
1d27 : 8d 01 d6 STA $d601 
1d2a : a9 12 __ LDA #$12
1d2c : 8d 00 d6 STA $d600 
.l7071:
1d2f : 2c 00 d6 BIT $d600 
1d32 : 10 fb __ BPL $1d2f ; (main.l7071 + 0)
.s64:
1d34 : a9 9f __ LDA #$9f
1d36 : 8d 01 d6 STA $d601 
1d39 : a9 13 __ LDA #$13
1d3b : 8d 00 d6 STA $d600 
.l7073:
1d3e : 2c 00 d6 BIT $d600 
1d41 : 10 fb __ BPL $1d3e ; (main.l7073 + 0)
.s69:
1d43 : a9 ff __ LDA #$ff
1d45 : 8d 01 d6 STA $d601 
1d48 : a9 1f __ LDA #$1f
1d4a : 8d 00 d6 STA $d600 
.l7075:
1d4d : 2c 00 d6 BIT $d600 
1d50 : 10 fb __ BPL $1d4d ; (main.l7075 + 0)
.s73:
1d52 : a9 ff __ LDA #$ff
1d54 : 8d 01 d6 STA $d601 
1d57 : a9 12 __ LDA #$12
1d59 : 8d 00 d6 STA $d600 
.l7077:
1d5c : 2c 00 d6 BIT $d600 
1d5f : 10 fb __ BPL $1d5c ; (main.l7077 + 0)
.s80:
1d61 : a9 1f __ LDA #$1f
1d63 : 8d 01 d6 STA $d601 
1d66 : a9 13 __ LDA #$13
1d68 : 8d 00 d6 STA $d600 
.l7079:
1d6b : 2c 00 d6 BIT $d600 
1d6e : 10 fb __ BPL $1d6b ; (main.l7079 + 0)
.s85:
1d70 : a9 ff __ LDA #$ff
1d72 : 8d 01 d6 STA $d601 
1d75 : a9 1f __ LDA #$1f
1d77 : 8d 00 d6 STA $d600 
.l7081:
1d7a : 2c 00 d6 BIT $d600 
1d7d : 10 fb __ BPL $1d7a ; (main.l7081 + 0)
.s89:
1d7f : ad 01 d6 LDA $d601 
1d82 : f0 04 __ BEQ $1d88 ; (main.s1459 + 0)
.s1460:
1d84 : a9 10 __ LDA #$10
1d86 : d0 02 __ BNE $1d8a ; (main.s1461 + 0)
.s1459:
1d88 : a9 40 __ LDA #$40
.s1461:
1d8a : 8d ce 3b STA $3bce ; (vdc_state + 0)
1d8d : a9 1c __ LDA #$1c
1d8f : 8d 00 d6 STA $d600 
.l7084:
1d92 : 2c 00 d6 BIT $d600 
1d95 : 10 fb __ BPL $1d92 ; (main.l7084 + 0)
.s96:
1d97 : 8e 01 d6 STX $d601 
1d9a : a9 00 __ LDA #$00
1d9c : 85 43 __ STA T2 + 0 
1d9e : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
1da1 : 85 54 __ STA T3 + 0 
1da3 : ad d3 3b LDA $3bd3 ; (vdc_state + 5)
1da6 : 85 45 __ STA T5 + 0 
.l99:
1da8 : a5 43 __ LDA T2 + 0 
1daa : c5 45 __ CMP T5 + 0 
1dac : b0 03 __ BCS $1db1 ; (main.s29 + 0)
1dae : 4c d8 2b JMP $2bd8 ; (main.s100 + 0)
.s29:
1db1 : 24 d7 __ BIT $d7 
1db3 : 30 17 __ BMI $1dcc ; (main.s182 + 0)
.s177:
1db5 : a9 15 __ LDA #$15
1db7 : a0 02 __ LDY #$02
1db9 : 91 23 __ STA (SP + 0),y 
1dbb : a9 33 __ LDA #$33
1dbd : c8 __ __ INY
1dbe : 91 23 __ STA (SP + 0),y 
1dc0 : 20 b8 2c JSR $2cb8 ; (printf.s1000 + 0)
1dc3 : 20 40 33 JSR $3340 ; (getch.s0 + 0)
1dc6 : 20 7f 33 JSR $337f ; (clrscr.s0 + 0)
1dc9 : 20 83 33 JSR $3383 ; (screen_setmode.s0 + 0)
.s182:
1dcc : a9 01 __ LDA #$01
1dce : 8d 30 d0 STA $d030 
1dd1 : 85 16 __ STA P9 
1dd3 : ad 11 d0 LDA $d011 
1dd6 : 29 6f __ AND #$6f
1dd8 : 8d 11 d0 STA $d011 
1ddb : 20 8b 33 JSR $338b ; (vdc_set_mode.s1000 + 0)
1dde : ad ce 3b LDA $3bce ; (vdc_state + 0)
1de1 : c9 40 __ CMP #$40
1de3 : f0 03 __ BEQ $1de8 ; (main.s188 + 0)
1de5 : 4c ff 1e JMP $1eff ; (main.s2 + 0)
.s188:
1de8 : ad cf 3b LDA $3bcf ; (vdc_state + 1)
1deb : f0 03 __ BEQ $1df0 ; (main.s192 + 0)
1ded : 4c ff 1e JMP $1eff ; (main.s2 + 0)
.s192:
1df0 : a9 22 __ LDA #$22
1df2 : 8d 00 d6 STA $d600 
.l7397:
1df5 : 2c 00 d6 BIT $d600 
1df8 : 10 fb __ BPL $1df5 ; (main.l7397 + 0)
.s200:
1dfa : a9 80 __ LDA #$80
1dfc : 8d 01 d6 STA $d601 
1dff : a0 ff __ LDY #$ff
1e01 : a2 00 __ LDX #$00
.l203:
1e03 : a9 12 __ LDA #$12
1e05 : 8d 00 d6 STA $d600 
.l7399:
1e08 : 2c 00 d6 BIT $d600 
1e0b : 10 fb __ BPL $1e08 ; (main.l7399 + 0)
.s212:
1e0d : 8e 01 d6 STX $d601 
1e10 : a9 13 __ LDA #$13
1e12 : 8d 00 d6 STA $d600 
.l7401:
1e15 : 2c 00 d6 BIT $d600 
1e18 : 10 fb __ BPL $1e15 ; (main.l7401 + 0)
.s217:
1e1a : a9 00 __ LDA #$00
1e1c : 8d 01 d6 STA $d601 
1e1f : a9 1f __ LDA #$1f
1e21 : 8d 00 d6 STA $d600 
.l7403:
1e24 : 2c 00 d6 BIT $d600 
1e27 : 10 fb __ BPL $1e24 ; (main.l7403 + 0)
.s221:
1e29 : a9 00 __ LDA #$00
1e2b : 8d 01 d6 STA $d601 
1e2e : a9 18 __ LDA #$18
1e30 : 8d 00 d6 STA $d600 
.l7405:
1e33 : 2c 00 d6 BIT $d600 
1e36 : 10 fb __ BPL $1e33 ; (main.l7405 + 0)
.s227:
1e38 : ad 01 d6 LDA $d601 
1e3b : 29 7f __ AND #$7f
1e3d : 85 45 __ STA T5 + 0 
1e3f : a9 18 __ LDA #$18
1e41 : 8d 00 d6 STA $d600 
.l7407:
1e44 : 2c 00 d6 BIT $d600 
1e47 : 10 fb __ BPL $1e44 ; (main.l7407 + 0)
.s233:
1e49 : a5 45 __ LDA T5 + 0 
1e4b : 8d 01 d6 STA $d601 
1e4e : a9 1e __ LDA #$1e
1e50 : 8d 00 d6 STA $d600 
.l7409:
1e53 : 2c 00 d6 BIT $d600 
1e56 : 10 fb __ BPL $1e53 ; (main.l7409 + 0)
.s238:
1e58 : a9 ff __ LDA #$ff
1e5a : 8d 01 d6 STA $d601 
1e5d : e8 __ __ INX
1e5e : 88 __ __ DEY
1e5f : d0 a2 __ BNE $1e03 ; (main.l203 + 0)
.s205:
1e61 : a9 12 __ LDA #$12
1e63 : 8d 00 d6 STA $d600 
.l7412:
1e66 : 2c 00 d6 BIT $d600 
1e69 : 10 fb __ BPL $1e66 ; (main.l7412 + 0)
.s245:
1e6b : 8e 01 d6 STX $d601 
1e6e : a9 13 __ LDA #$13
1e70 : 8d 00 d6 STA $d600 
.l7414:
1e73 : 2c 00 d6 BIT $d600 
1e76 : 10 fb __ BPL $1e73 ; (main.l7414 + 0)
.s250:
1e78 : 8c 01 d6 STY $d601 
1e7b : a9 1f __ LDA #$1f
1e7d : 8d 00 d6 STA $d600 
.l7416:
1e80 : 2c 00 d6 BIT $d600 
1e83 : 10 fb __ BPL $1e80 ; (main.l7416 + 0)
.s254:
1e85 : 8c 01 d6 STY $d601 
1e88 : a9 18 __ LDA #$18
1e8a : 8d 00 d6 STA $d600 
.l7418:
1e8d : 2c 00 d6 BIT $d600 
1e90 : 10 fb __ BPL $1e8d ; (main.l7418 + 0)
.s260:
1e92 : ad 01 d6 LDA $d601 
1e95 : 29 7f __ AND #$7f
1e97 : aa __ __ TAX
1e98 : a9 18 __ LDA #$18
1e9a : 8d 00 d6 STA $d600 
.l7420:
1e9d : 2c 00 d6 BIT $d600 
1ea0 : 10 fb __ BPL $1e9d ; (main.l7420 + 0)
.s266:
1ea2 : 8e 01 d6 STX $d601 
1ea5 : a9 1e __ LDA #$1e
1ea7 : 8d 00 d6 STA $d600 
.l7422:
1eaa : 2c 00 d6 BIT $d600 
1ead : 10 fb __ BPL $1eaa ; (main.l7422 + 0)
.s271:
1eaf : a9 ff __ LDA #$ff
1eb1 : 8d 01 d6 STA $d601 
1eb4 : a9 1c __ LDA #$1c
1eb6 : 8d 00 d6 STA $d600 
.l7424:
1eb9 : 2c 00 d6 BIT $d600 
1ebc : 10 fb __ BPL $1eb9 ; (main.l7424 + 0)
.s277:
1ebe : ad 01 d6 LDA $d601 
1ec1 : 09 10 __ ORA #$10
1ec3 : aa __ __ TAX
1ec4 : a9 1c __ LDA #$1c
1ec6 : 8d 00 d6 STA $d600 
.l7426:
1ec9 : 2c 00 d6 BIT $d600 
1ecc : 10 fb __ BPL $1ec9 ; (main.l7426 + 0)
.s283:
1ece : 8e 01 d6 STX $d601 
1ed1 : 20 3b 37 JSR $373b ; (vdc_restore_charsets.s0 + 0)
1ed4 : a9 00 __ LDA #$00
1ed6 : 85 43 __ STA T2 + 0 
1ed8 : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
1edb : 85 54 __ STA T3 + 0 
1edd : ad d3 3b LDA $3bd3 ; (vdc_state + 5)
1ee0 : 85 45 __ STA T5 + 0 
.l286:
1ee2 : a5 43 __ LDA T2 + 0 
1ee4 : c5 45 __ CMP T5 + 0 
1ee6 : b0 03 __ BCS $1eeb ; (main.s284 + 0)
1ee8 : 4c f8 2a JMP $2af8 ; (main.s287 + 0)
.s284:
1eeb : a9 22 __ LDA #$22
1eed : 8d 00 d6 STA $d600 
.l7452:
1ef0 : 2c 00 d6 BIT $d600 
1ef3 : 10 fb __ BPL $1ef0 ; (main.l7452 + 0)
.s364:
1ef5 : a9 7d __ LDA #$7d
1ef7 : 8d 01 d6 STA $d601 
1efa : a9 01 __ LDA #$01
1efc : 8d cf 3b STA $3bcf ; (vdc_state + 1)
.s2:
1eff : ad d7 3b LDA $3bd7 ; (vdc_state + 9)
1f02 : 85 45 __ STA T5 + 0 
1f04 : a9 12 __ LDA #$12
1f06 : 8d 00 d6 STA $d600 
1f09 : ac d6 3b LDY $3bd6 ; (vdc_state + 8)
.l7113:
1f0c : 2c 00 d6 BIT $d600 
1f0f : 10 fb __ BPL $1f0c ; (main.l7113 + 0)
.s374:
1f11 : a5 45 __ LDA T5 + 0 
1f13 : 8d 01 d6 STA $d601 
1f16 : a9 13 __ LDA #$13
1f18 : 8d 00 d6 STA $d600 
.l7115:
1f1b : 2c 00 d6 BIT $d600 
1f1e : 10 fb __ BPL $1f1b ; (main.l7115 + 0)
.s379:
1f20 : 8c 01 d6 STY $d601 
1f23 : a9 1f __ LDA #$1f
1f25 : 8d 00 d6 STA $d600 
.l7117:
1f28 : 2c 00 d6 BIT $d600 
1f2b : 10 fb __ BPL $1f28 ; (main.l7117 + 0)
.s383:
1f2d : a9 20 __ LDA #$20
1f2f : 8d 01 d6 STA $d601 
1f32 : a9 18 __ LDA #$18
1f34 : 8d 00 d6 STA $d600 
.l7119:
1f37 : 2c 00 d6 BIT $d600 
1f3a : 10 fb __ BPL $1f37 ; (main.l7119 + 0)
.s389:
1f3c : ad 01 d6 LDA $d601 
1f3f : 29 7f __ AND #$7f
1f41 : aa __ __ TAX
1f42 : a9 18 __ LDA #$18
1f44 : 8d 00 d6 STA $d600 
.l7121:
1f47 : 2c 00 d6 BIT $d600 
1f4a : 10 fb __ BPL $1f47 ; (main.l7121 + 0)
.s395:
1f4c : 8e 01 d6 STX $d601 
1f4f : a9 1e __ LDA #$1e
1f51 : 8d 00 d6 STA $d600 
.l7123:
1f54 : 2c 00 d6 BIT $d600 
1f57 : 10 fb __ BPL $1f54 ; (main.l7123 + 0)
.s400:
1f59 : a9 4e __ LDA #$4e
1f5b : 8d 01 d6 STA $d601 
1f5e : ad d9 3b LDA $3bd9 ; (vdc_state + 11)
1f61 : 85 49 __ STA T7 + 0 
1f63 : a9 12 __ LDA #$12
1f65 : 8d 00 d6 STA $d600 
1f68 : ae d8 3b LDX $3bd8 ; (vdc_state + 10)
.l7125:
1f6b : 2c 00 d6 BIT $d600 
1f6e : 10 fb __ BPL $1f6b ; (main.l7125 + 0)
.s407:
1f70 : a5 49 __ LDA T7 + 0 
1f72 : 8d 01 d6 STA $d601 
1f75 : a9 13 __ LDA #$13
1f77 : 8d 00 d6 STA $d600 
.l7127:
1f7a : 2c 00 d6 BIT $d600 
1f7d : 10 fb __ BPL $1f7a ; (main.l7127 + 0)
.s412:
1f7f : 8e 01 d6 STX $d601 
1f82 : a9 1f __ LDA #$1f
1f84 : 8d 00 d6 STA $d600 
.l7129:
1f87 : 2c 00 d6 BIT $d600 
1f8a : 10 fb __ BPL $1f87 ; (main.l7129 + 0)
.s416:
1f8c : a9 c5 __ LDA #$c5
1f8e : 8d 01 d6 STA $d601 
1f91 : a9 18 __ LDA #$18
1f93 : 8d 00 d6 STA $d600 
.l7131:
1f96 : 2c 00 d6 BIT $d600 
1f99 : 10 fb __ BPL $1f96 ; (main.l7131 + 0)
.s422:
1f9b : ad 01 d6 LDA $d601 
1f9e : 29 7f __ AND #$7f
1fa0 : aa __ __ TAX
1fa1 : a9 18 __ LDA #$18
1fa3 : 8d 00 d6 STA $d600 
.l7133:
1fa6 : 2c 00 d6 BIT $d600 
1fa9 : 10 fb __ BPL $1fa6 ; (main.l7133 + 0)
.s428:
1fab : 8e 01 d6 STX $d601 
1fae : a9 1e __ LDA #$1e
1fb0 : 8d 00 d6 STA $d600 
.l7135:
1fb3 : 2c 00 d6 BIT $d600 
1fb6 : 10 fb __ BPL $1fb3 ; (main.l7135 + 0)
.s433:
1fb8 : a9 4e __ LDA #$4e
1fba : 8d 01 d6 STA $d601 
1fbd : ad d5 3b LDA $3bd5 ; (vdc_state + 7)
1fc0 : 29 f0 __ AND #$f0
1fc2 : 09 45 __ ORA #$45
1fc4 : 8d d5 3b STA $3bd5 ; (vdc_state + 7)
1fc7 : a2 00 __ LDX #$00
.l1451:
1fc9 : bd 40 37 LDA $3740,x 
1fcc : e8 __ __ INX
1fcd : 09 00 __ ORA #$00
1fcf : d0 f8 __ BNE $1fc9 ; (main.l1451 + 0)
.s1452:
1fd1 : 86 47 __ STX T6 + 0 
1fd3 : a9 12 __ LDA #$12
1fd5 : 8d 00 d6 STA $d600 
.l7138:
1fd8 : 2c 00 d6 BIT $d600 
1fdb : 10 fb __ BPL $1fd8 ; (main.l7138 + 0)
.s449:
1fdd : a5 45 __ LDA T5 + 0 
1fdf : 8d 01 d6 STA $d601 
1fe2 : a9 13 __ LDA #$13
1fe4 : 8d 00 d6 STA $d600 
.l7140:
1fe7 : 2c 00 d6 BIT $d600 
1fea : 10 fb __ BPL $1fe7 ; (main.l7140 + 0)
.s454:
1fec : 8c 01 d6 STY $d601 
1fef : a9 1f __ LDA #$1f
1ff1 : 8d 00 d6 STA $d600 
1ff4 : 8a __ __ TXA
1ff5 : f0 46 __ BEQ $203d ; (main.s459 + 0)
.s1408:
1ff7 : a2 00 __ LDX #$00
.l457:
1ff9 : bd 3f 37 LDA $373f,x 
1ffc : c9 20 __ CMP #$20
1ffe : b0 04 __ BCS $2004 ; (main.s463 + 0)
.s462:
2000 : 09 80 __ ORA #$80
2002 : 90 2b __ BCC $202f ; (main.s1455 + 0)
.s463:
2004 : a8 __ __ TAY
2005 : c9 40 __ CMP #$40
2007 : 90 04 __ BCC $200d ; (main.s466 + 0)
.s468:
2009 : c9 60 __ CMP #$60
200b : 90 11 __ BCC $201e ; (main.s465 + 0)
.s466:
200d : c9 60 __ CMP #$60
200f : 90 05 __ BCC $2016 ; (main.s470 + 0)
.s469:
2011 : e9 20 __ SBC #$20
2013 : 4c 2f 20 JMP $202f ; (main.s1455 + 0)
.s470:
2016 : c9 a0 __ CMP #$a0
2018 : 90 0a __ BCC $2024 ; (main.s478 + 0)
.s480:
201a : c9 c0 __ CMP #$c0
201c : b0 06 __ BCS $2024 ; (main.s478 + 0)
.s465:
201e : 38 __ __ SEC
201f : e9 40 __ SBC #$40
2021 : 4c 2f 20 JMP $202f ; (main.s1455 + 0)
.s478:
2024 : c9 c0 __ CMP #$c0
2026 : 90 08 __ BCC $2030 ; (main.l7144 + 0)
.s484:
2028 : c9 ff __ CMP #$ff
202a : b0 04 __ BCS $2030 ; (main.l7144 + 0)
.s481:
202c : 38 __ __ SEC
202d : e9 80 __ SBC #$80
.s1455:
202f : a8 __ __ TAY
.l7144:
2030 : 2c 00 d6 BIT $d600 
2033 : 10 fb __ BPL $2030 ; (main.l7144 + 0)
.s490:
2035 : 8c 01 d6 STY $d601 
2038 : e8 __ __ INX
2039 : e4 47 __ CPX T6 + 0 
203b : 90 bc __ BCC $1ff9 ; (main.l457 + 0)
.s459:
203d : a9 12 __ LDA #$12
203f : 8d 00 d6 STA $d600 
2042 : a6 47 __ LDX T6 + 0 
2044 : ca __ __ DEX
2045 : 86 45 __ STX T5 + 0 
2047 : ad d9 3b LDA $3bd9 ; (vdc_state + 11)
204a : ae d5 3b LDX $3bd5 ; (vdc_state + 7)
204d : ac d8 3b LDY $3bd8 ; (vdc_state + 10)
.l7147:
2050 : 2c 00 d6 BIT $d600 
2053 : 10 fb __ BPL $2050 ; (main.l7147 + 0)
.s497:
2055 : 8d 01 d6 STA $d601 
2058 : a9 13 __ LDA #$13
205a : 8d 00 d6 STA $d600 
.l7149:
205d : 2c 00 d6 BIT $d600 
2060 : 10 fb __ BPL $205d ; (main.l7149 + 0)
.s502:
2062 : 8c 01 d6 STY $d601 
2065 : a9 1f __ LDA #$1f
2067 : 8d 00 d6 STA $d600 
.l7151:
206a : 2c 00 d6 BIT $d600 
206d : 10 fb __ BPL $206a ; (main.l7151 + 0)
.s506:
206f : 8e 01 d6 STX $d601 
2072 : a9 18 __ LDA #$18
2074 : 8d 00 d6 STA $d600 
.l7153:
2077 : 2c 00 d6 BIT $d600 
207a : 10 fb __ BPL $2077 ; (main.l7153 + 0)
.s512:
207c : ad 01 d6 LDA $d601 
207f : 29 7f __ AND #$7f
2081 : a8 __ __ TAY
2082 : a9 18 __ LDA #$18
2084 : 8d 00 d6 STA $d600 
.l7155:
2087 : 2c 00 d6 BIT $d600 
208a : 10 fb __ BPL $2087 ; (main.l7155 + 0)
.s518:
208c : 8c 01 d6 STY $d601 
208f : a9 1e __ LDA #$1e
2091 : 8d 00 d6 STA $d600 
.l7157:
2094 : 2c 00 d6 BIT $d600 
2097 : 10 fb __ BPL $2094 ; (main.l7157 + 0)
.s523:
2099 : a5 45 __ LDA T5 + 0 
209b : 8d 01 d6 STA $d601 
209e : 8a __ __ TXA
209f : 29 b0 __ AND #$b0
20a1 : 09 0d __ ORA #$0d
20a3 : 8d d5 3b STA $3bd5 ; (vdc_state + 7)
20a6 : a9 40 __ LDA #$40
20a8 : a0 02 __ LDY #$02
20aa : 91 23 __ STA (SP + 0),y 
20ac : a9 3c __ LDA #$3c
20ae : c8 __ __ INY
20af : 91 23 __ STA (SP + 0),y 
20b1 : a9 76 __ LDA #$76
20b3 : c8 __ __ INY
20b4 : 91 23 __ STA (SP + 0),y 
20b6 : a9 3a __ LDA #$3a
20b8 : c8 __ __ INY
20b9 : 91 23 __ STA (SP + 0),y 
20bb : ad ce 3b LDA $3bce ; (vdc_state + 0)
20be : c8 __ __ INY
20bf : 91 23 __ STA (SP + 0),y 
20c1 : a9 00 __ LDA #$00
20c3 : c8 __ __ INY
20c4 : 91 23 __ STA (SP + 0),y 
20c6 : 20 50 37 JSR $3750 ; (sprintf.s1000 + 0)
20c9 : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
20cc : 0a __ __ ASL
20cd : 85 54 __ STA T3 + 0 
20cf : ad d2 3b LDA $3bd2 ; (vdc_state + 4)
20d2 : 2a __ __ ROL
20d3 : 85 55 __ STA T3 + 1 
20d5 : a9 00 __ LDA #$00
20d7 : 85 45 __ STA T5 + 0 
20d9 : ad 40 3c LDA $3c40 ; (linebuffer + 0)
20dc : f0 0c __ BEQ $20ea ; (main.s532 + 0)
.s531:
20de : a2 00 __ LDX #$00
.l1453:
20e0 : bd 41 3c LDA $3c41,x ; (linebuffer + 1)
20e3 : e8 __ __ INX
20e4 : 09 00 __ ORA #$00
20e6 : d0 f8 __ BNE $20e0 ; (main.l1453 + 0)
.s1454:
20e8 : 86 45 __ STX T5 + 0 
.s532:
20ea : ad d6 3b LDA $3bd6 ; (vdc_state + 8)
20ed : 18 __ __ CLC
20ee : 65 54 __ ADC T3 + 0 
20f0 : aa __ __ TAX
20f1 : a9 12 __ LDA #$12
20f3 : 8d 00 d6 STA $d600 
20f6 : ad d7 3b LDA $3bd7 ; (vdc_state + 9)
20f9 : 65 55 __ ADC T3 + 1 
.l7161:
20fb : 2c 00 d6 BIT $d600 
20fe : 10 fb __ BPL $20fb ; (main.l7161 + 0)
.s539:
2100 : 8d 01 d6 STA $d601 
2103 : a9 13 __ LDA #$13
2105 : 8d 00 d6 STA $d600 
.l7163:
2108 : 2c 00 d6 BIT $d600 
210b : 10 fb __ BPL $2108 ; (main.l7163 + 0)
.s544:
210d : 8e 01 d6 STX $d601 
2110 : a9 1f __ LDA #$1f
2112 : 8d 00 d6 STA $d600 
2115 : a5 45 __ LDA T5 + 0 
2117 : f0 62 __ BEQ $217b ; (main.s549 + 0)
.s1397:
2119 : a2 00 __ LDX #$00
.l547:
211b : bd 40 3c LDA $3c40,x ; (linebuffer + 0)
211e : c9 20 __ CMP #$20
2120 : b0 05 __ BCS $2127 ; (main.s553 + 0)
.s552:
2122 : 69 80 __ ADC #$80
2124 : 4c 6d 21 JMP $216d ; (main.s1456 + 0)
.s553:
2127 : a8 __ __ TAY
2128 : c9 40 __ CMP #$40
212a : 90 04 __ BCC $2130 ; (main.s556 + 0)
.s558:
212c : c9 60 __ CMP #$60
212e : 90 23 __ BCC $2153 ; (main.s555 + 0)
.s556:
2130 : c9 60 __ CMP #$60
2132 : 90 0a __ BCC $213e ; (main.s560 + 0)
.s562:
2134 : 09 00 __ ORA #$00
2136 : 30 06 __ BMI $213e ; (main.s560 + 0)
.s559:
2138 : 38 __ __ SEC
2139 : e9 20 __ SBC #$20
213b : 4c 6d 21 JMP $216d ; (main.s1456 + 0)
.s560:
213e : c9 80 __ CMP #$80
2140 : 90 09 __ BCC $214b ; (main.s564 + 0)
.s566:
2142 : c9 a0 __ CMP #$a0
2144 : b0 05 __ BCS $214b ; (main.s564 + 0)
.s563:
2146 : 69 40 __ ADC #$40
2148 : 4c 6d 21 JMP $216d ; (main.s1456 + 0)
.s564:
214b : c9 a0 __ CMP #$a0
214d : 90 0a __ BCC $2159 ; (main.s568 + 0)
.s570:
214f : c9 c0 __ CMP #$c0
2151 : b0 06 __ BCS $2159 ; (main.s568 + 0)
.s555:
2153 : 38 __ __ SEC
2154 : e9 40 __ SBC #$40
2156 : 4c 6d 21 JMP $216d ; (main.s1456 + 0)
.s568:
2159 : c9 c0 __ CMP #$c0
215b : 90 0a __ BCC $2167 ; (main.s572 + 0)
.s574:
215d : c9 ff __ CMP #$ff
215f : b0 06 __ BCS $2167 ; (main.s572 + 0)
.s571:
2161 : 38 __ __ SEC
2162 : e9 80 __ SBC #$80
2164 : 4c 6d 21 JMP $216d ; (main.s1456 + 0)
.s572:
2167 : c9 ff __ CMP #$ff
2169 : d0 03 __ BNE $216e ; (main.l7167 + 0)
.s575:
216b : a9 5e __ LDA #$5e
.s1456:
216d : a8 __ __ TAY
.l7167:
216e : 2c 00 d6 BIT $d600 
2171 : 10 fb __ BPL $216e ; (main.l7167 + 0)
.s580:
2173 : 8c 01 d6 STY $d601 
2176 : e8 __ __ INX
2177 : e4 45 __ CPX T5 + 0 
2179 : 90 a0 __ BCC $211b ; (main.l547 + 0)
.s549:
217b : a9 12 __ LDA #$12
217d : 8d 00 d6 STA $d600 
2180 : c6 45 __ DEC T5 + 0 
2182 : 18 __ __ CLC
2183 : a5 54 __ LDA T3 + 0 
2185 : 6d d8 3b ADC $3bd8 ; (vdc_state + 10)
2188 : a8 __ __ TAY
2189 : a5 55 __ LDA T3 + 1 
218b : 6d d9 3b ADC $3bd9 ; (vdc_state + 11)
218e : ae d5 3b LDX $3bd5 ; (vdc_state + 7)
.l7170:
2191 : 2c 00 d6 BIT $d600 
2194 : 10 fb __ BPL $2191 ; (main.l7170 + 0)
.s587:
2196 : 8d 01 d6 STA $d601 
2199 : a9 13 __ LDA #$13
219b : 8d 00 d6 STA $d600 
.l7172:
219e : 2c 00 d6 BIT $d600 
21a1 : 10 fb __ BPL $219e ; (main.l7172 + 0)
.s592:
21a3 : 8c 01 d6 STY $d601 
21a6 : a9 1f __ LDA #$1f
21a8 : 8d 00 d6 STA $d600 
.l7174:
21ab : 2c 00 d6 BIT $d600 
21ae : 10 fb __ BPL $21ab ; (main.l7174 + 0)
.s596:
21b0 : 8e 01 d6 STX $d601 
21b3 : a9 18 __ LDA #$18
21b5 : 8d 00 d6 STA $d600 
.l7176:
21b8 : 2c 00 d6 BIT $d600 
21bb : 10 fb __ BPL $21b8 ; (main.l7176 + 0)
.s602:
21bd : ad 01 d6 LDA $d601 
21c0 : 29 7f __ AND #$7f
21c2 : aa __ __ TAX
21c3 : a9 18 __ LDA #$18
21c5 : 8d 00 d6 STA $d600 
.l7178:
21c8 : 2c 00 d6 BIT $d600 
21cb : 10 fb __ BPL $21c8 ; (main.l7178 + 0)
.s608:
21cd : 8e 01 d6 STX $d601 
21d0 : a9 1e __ LDA #$1e
21d2 : 8d 00 d6 STA $d600 
.l7180:
21d5 : 2c 00 d6 BIT $d600 
21d8 : 10 fb __ BPL $21d5 ; (main.l7180 + 0)
.s613:
21da : a5 45 __ LDA T5 + 0 
21dc : 8d 01 d6 STA $d601 
21df : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
21e2 : 0a __ __ ASL
21e3 : aa __ __ TAX
21e4 : a9 12 __ LDA #$12
21e6 : 8d 00 d6 STA $d600 
21e9 : ad d2 3b LDA $3bd2 ; (vdc_state + 4)
21ec : 2a __ __ ROL
21ed : a8 __ __ TAY
21ee : 8a __ __ TXA
21ef : 18 __ __ CLC
21f0 : 6d d1 3b ADC $3bd1 ; (vdc_state + 3)
21f3 : aa __ __ TAX
21f4 : 98 __ __ TYA
21f5 : 6d d2 3b ADC $3bd2 ; (vdc_state + 4)
21f8 : a8 __ __ TAY
21f9 : 8a __ __ TXA
21fa : 18 __ __ CLC
21fb : 69 04 __ ADC #$04
21fd : 85 49 __ STA T7 + 0 
21ff : 98 __ __ TYA
2200 : 69 00 __ ADC #$00
2202 : 85 4a __ STA T7 + 1 
2204 : 18 __ __ CLC
2205 : a5 49 __ LDA T7 + 0 
2207 : 6d d6 3b ADC $3bd6 ; (vdc_state + 8)
220a : 85 4b __ STA T8 + 0 
220c : a5 4a __ LDA T7 + 1 
220e : 6d d7 3b ADC $3bd7 ; (vdc_state + 9)
.l7182:
2211 : 2c 00 d6 BIT $d600 
2214 : 10 fb __ BPL $2211 ; (main.l7182 + 0)
.s623:
2216 : 8d 01 d6 STA $d601 
2219 : a9 13 __ LDA #$13
221b : 8d 00 d6 STA $d600 
.l7184:
221e : 2c 00 d6 BIT $d600 
2221 : 10 fb __ BPL $221e ; (main.l7184 + 0)
.s628:
2223 : a5 4b __ LDA T8 + 0 
2225 : 8d 01 d6 STA $d601 
2228 : a9 1f __ LDA #$1f
222a : 8d 00 d6 STA $d600 
.l7186:
222d : 2c 00 d6 BIT $d600 
2230 : 10 fb __ BPL $222d ; (main.l7186 + 0)
.s632:
2232 : a9 6c __ LDA #$6c
2234 : 8d 01 d6 STA $d601 
2237 : a9 12 __ LDA #$12
2239 : 8d 00 d6 STA $d600 
223c : 18 __ __ CLC
223d : a5 49 __ LDA T7 + 0 
223f : 6d d8 3b ADC $3bd8 ; (vdc_state + 10)
2242 : 85 49 __ STA T7 + 0 
2244 : a5 4a __ LDA T7 + 1 
2246 : 6d d9 3b ADC $3bd9 ; (vdc_state + 11)
.l7188:
2249 : 2c 00 d6 BIT $d600 
224c : 10 fb __ BPL $2249 ; (main.l7188 + 0)
.s639:
224e : 8d 01 d6 STA $d601 
2251 : a9 13 __ LDA #$13
2253 : 8d 00 d6 STA $d600 
.l7190:
2256 : 2c 00 d6 BIT $d600 
2259 : 10 fb __ BPL $2256 ; (main.l7190 + 0)
.s644:
225b : a5 49 __ LDA T7 + 0 
225d : 8d 01 d6 STA $d601 
2260 : a9 1f __ LDA #$1f
2262 : 8d 00 d6 STA $d600 
.l7192:
2265 : 2c 00 d6 BIT $d600 
2268 : 10 fb __ BPL $2265 ; (main.l7192 + 0)
.s648:
226a : a9 09 __ LDA #$09
226c : 8d 01 d6 STA $d601 
226f : a9 12 __ LDA #$12
2271 : 8d 00 d6 STA $d600 
2274 : 8a __ __ TXA
2275 : 18 __ __ CLC
2276 : 69 05 __ ADC #$05
2278 : 85 49 __ STA T7 + 0 
227a : 98 __ __ TYA
227b : 69 00 __ ADC #$00
227d : 85 4a __ STA T7 + 1 
227f : 18 __ __ CLC
2280 : a5 49 __ LDA T7 + 0 
2282 : 6d d6 3b ADC $3bd6 ; (vdc_state + 8)
2285 : 85 4b __ STA T8 + 0 
2287 : a5 4a __ LDA T7 + 1 
2289 : 6d d7 3b ADC $3bd7 ; (vdc_state + 9)
.l7194:
228c : 2c 00 d6 BIT $d600 
228f : 10 fb __ BPL $228c ; (main.l7194 + 0)
.s658:
2291 : 8d 01 d6 STA $d601 
2294 : a9 13 __ LDA #$13
2296 : 8d 00 d6 STA $d600 
.l7196:
2299 : 2c 00 d6 BIT $d600 
229c : 10 fb __ BPL $2299 ; (main.l7196 + 0)
.s663:
229e : a5 4b __ LDA T8 + 0 
22a0 : 8d 01 d6 STA $d601 
22a3 : a9 1f __ LDA #$1f
22a5 : 8d 00 d6 STA $d600 
.l7198:
22a8 : 2c 00 d6 BIT $d600 
22ab : 10 fb __ BPL $22a8 ; (main.l7198 + 0)
.s667:
22ad : a9 62 __ LDA #$62
22af : 8d 01 d6 STA $d601 
22b2 : a9 18 __ LDA #$18
22b4 : 8d 00 d6 STA $d600 
.l7200:
22b7 : 2c 00 d6 BIT $d600 
22ba : 10 fb __ BPL $22b7 ; (main.l7200 + 0)
.s673:
22bc : ad 01 d6 LDA $d601 
22bf : 29 7f __ AND #$7f
22c1 : 85 4b __ STA T8 + 0 
22c3 : a9 18 __ LDA #$18
22c5 : 8d 00 d6 STA $d600 
.l7202:
22c8 : 2c 00 d6 BIT $d600 
22cb : 10 fb __ BPL $22c8 ; (main.l7202 + 0)
.s679:
22cd : a5 4b __ LDA T8 + 0 
22cf : 8d 01 d6 STA $d601 
22d2 : a9 1e __ LDA #$1e
22d4 : 8d 00 d6 STA $d600 
.l7204:
22d7 : 2c 00 d6 BIT $d600 
22da : 10 fb __ BPL $22d7 ; (main.l7204 + 0)
.s684:
22dc : a9 45 __ LDA #$45
22de : 8d 01 d6 STA $d601 
22e1 : a9 12 __ LDA #$12
22e3 : 8d 00 d6 STA $d600 
22e6 : 18 __ __ CLC
22e7 : a5 49 __ LDA T7 + 0 
22e9 : 6d d8 3b ADC $3bd8 ; (vdc_state + 10)
22ec : 85 49 __ STA T7 + 0 
22ee : a5 4a __ LDA T7 + 1 
22f0 : 6d d9 3b ADC $3bd9 ; (vdc_state + 11)
.l7206:
22f3 : 2c 00 d6 BIT $d600 
22f6 : 10 fb __ BPL $22f3 ; (main.l7206 + 0)
.s691:
22f8 : 8d 01 d6 STA $d601 
22fb : a9 13 __ LDA #$13
22fd : 8d 00 d6 STA $d600 
.l7208:
2300 : 2c 00 d6 BIT $d600 
2303 : 10 fb __ BPL $2300 ; (main.l7208 + 0)
.s696:
2305 : a5 49 __ LDA T7 + 0 
2307 : 8d 01 d6 STA $d601 
230a : a9 1f __ LDA #$1f
230c : 8d 00 d6 STA $d600 
.l7210:
230f : 2c 00 d6 BIT $d600 
2312 : 10 fb __ BPL $230f ; (main.l7210 + 0)
.s700:
2314 : a9 09 __ LDA #$09
2316 : 8d 01 d6 STA $d601 
2319 : a9 18 __ LDA #$18
231b : 8d 00 d6 STA $d600 
.l7212:
231e : 2c 00 d6 BIT $d600 
2321 : 10 fb __ BPL $231e ; (main.l7212 + 0)
.s706:
2323 : ad 01 d6 LDA $d601 
2326 : 29 7f __ AND #$7f
2328 : 85 49 __ STA T7 + 0 
232a : a9 18 __ LDA #$18
232c : 8d 00 d6 STA $d600 
.l7214:
232f : 2c 00 d6 BIT $d600 
2332 : 10 fb __ BPL $232f ; (main.l7214 + 0)
.s712:
2334 : a5 49 __ LDA T7 + 0 
2336 : 8d 01 d6 STA $d601 
2339 : a9 1e __ LDA #$1e
233b : 8d 00 d6 STA $d600 
.l7216:
233e : 2c 00 d6 BIT $d600 
2341 : 10 fb __ BPL $233e ; (main.l7216 + 0)
.s717:
2343 : a9 45 __ LDA #$45
2345 : 8d 01 d6 STA $d601 
2348 : a9 12 __ LDA #$12
234a : 8d 00 d6 STA $d600 
234d : 8a __ __ TXA
234e : 18 __ __ CLC
234f : 69 4b __ ADC #$4b
2351 : aa __ __ TAX
2352 : 90 01 __ BCC $2355 ; (main.s1463 + 0)
.s1462:
2354 : c8 __ __ INY
.s1463:
2355 : 18 __ __ CLC
2356 : 6d d6 3b ADC $3bd6 ; (vdc_state + 8)
2359 : 85 45 __ STA T5 + 0 
235b : 98 __ __ TYA
235c : 6d d7 3b ADC $3bd7 ; (vdc_state + 9)
.l7218:
235f : 2c 00 d6 BIT $d600 
2362 : 10 fb __ BPL $235f ; (main.l7218 + 0)
.s727:
2364 : 8d 01 d6 STA $d601 
2367 : a9 13 __ LDA #$13
2369 : 8d 00 d6 STA $d600 
.l7220:
236c : 2c 00 d6 BIT $d600 
236f : 10 fb __ BPL $236c ; (main.l7220 + 0)
.s732:
2371 : a5 45 __ LDA T5 + 0 
2373 : 8d 01 d6 STA $d601 
2376 : a9 1f __ LDA #$1f
2378 : 8d 00 d6 STA $d600 
.l7222:
237b : 2c 00 d6 BIT $d600 
237e : 10 fb __ BPL $237b ; (main.l7222 + 0)
.s736:
2380 : a9 7b __ LDA #$7b
2382 : 8d 01 d6 STA $d601 
2385 : a9 12 __ LDA #$12
2387 : 8d 00 d6 STA $d600 
238a : 8a __ __ TXA
238b : 18 __ __ CLC
238c : 6d d8 3b ADC $3bd8 ; (vdc_state + 10)
238f : aa __ __ TAX
2390 : 98 __ __ TYA
2391 : 6d d9 3b ADC $3bd9 ; (vdc_state + 11)
.l7224:
2394 : 2c 00 d6 BIT $d600 
2397 : 10 fb __ BPL $2394 ; (main.l7224 + 0)
.s743:
2399 : 8d 01 d6 STA $d601 
239c : a9 13 __ LDA #$13
239e : 8d 00 d6 STA $d600 
.l7226:
23a1 : 2c 00 d6 BIT $d600 
23a4 : 10 fb __ BPL $23a1 ; (main.l7226 + 0)
.s748:
23a6 : 8e 01 d6 STX $d601 
23a9 : a9 1f __ LDA #$1f
23ab : 8d 00 d6 STA $d600 
.l7228:
23ae : 2c 00 d6 BIT $d600 
23b1 : 10 fb __ BPL $23ae ; (main.l7228 + 0)
.s752:
23b3 : a9 09 __ LDA #$09
23b5 : 8d 01 d6 STA $d601 
23b8 : a9 04 __ LDA #$04
23ba : 85 43 __ STA T2 + 0 
.l755:
23bc : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
23bf : 85 1b __ STA ACCU + 0 
23c1 : ad d2 3b LDA $3bd2 ; (vdc_state + 4)
23c4 : 85 1c __ STA ACCU + 1 
23c6 : a9 12 __ LDA #$12
23c8 : 8d 00 d6 STA $d600 
23cb : a5 43 __ LDA T2 + 0 
23cd : 20 91 3a JSR $3a91 ; (mul16by8 + 0)
23d0 : 18 __ __ CLC
23d1 : a5 05 __ LDA WORK + 2 
23d3 : 69 04 __ ADC #$04
23d5 : 85 54 __ STA T3 + 0 
23d7 : a5 06 __ LDA WORK + 3 
23d9 : 69 00 __ ADC #$00
23db : 85 55 __ STA T3 + 1 
23dd : 18 __ __ CLC
23de : a5 54 __ LDA T3 + 0 
23e0 : 6d d6 3b ADC $3bd6 ; (vdc_state + 8)
23e3 : aa __ __ TAX
23e4 : a5 55 __ LDA T3 + 1 
23e6 : 6d d7 3b ADC $3bd7 ; (vdc_state + 9)
.l7230:
23e9 : 2c 00 d6 BIT $d600 
23ec : 10 fb __ BPL $23e9 ; (main.l7230 + 0)
.s767:
23ee : 8d 01 d6 STA $d601 
23f1 : a9 13 __ LDA #$13
23f3 : 8d 00 d6 STA $d600 
.l7232:
23f6 : 2c 00 d6 BIT $d600 
23f9 : 10 fb __ BPL $23f6 ; (main.l7232 + 0)
.s772:
23fb : 8e 01 d6 STX $d601 
23fe : a9 1f __ LDA #$1f
2400 : 8d 00 d6 STA $d600 
.l7234:
2403 : 2c 00 d6 BIT $d600 
2406 : 10 fb __ BPL $2403 ; (main.l7234 + 0)
.s776:
2408 : a9 e1 __ LDA #$e1
240a : 8d 01 d6 STA $d601 
240d : ad d8 3b LDA $3bd8 ; (vdc_state + 10)
2410 : 18 __ __ CLC
2411 : 65 54 __ ADC T3 + 0 
2413 : aa __ __ TAX
2414 : a9 12 __ LDA #$12
2416 : 8d 00 d6 STA $d600 
2419 : ad d9 3b LDA $3bd9 ; (vdc_state + 11)
241c : 65 55 __ ADC T3 + 1 
.l7236:
241e : 2c 00 d6 BIT $d600 
2421 : 10 fb __ BPL $241e ; (main.l7236 + 0)
.s783:
2423 : 8d 01 d6 STA $d601 
2426 : a9 13 __ LDA #$13
2428 : 8d 00 d6 STA $d600 
.l7238:
242b : 2c 00 d6 BIT $d600 
242e : 10 fb __ BPL $242b ; (main.l7238 + 0)
.s788:
2430 : 8e 01 d6 STX $d601 
2433 : a9 1f __ LDA #$1f
2435 : 8d 00 d6 STA $d600 
.l7240:
2438 : 2c 00 d6 BIT $d600 
243b : 10 fb __ BPL $2438 ; (main.l7240 + 0)
.s792:
243d : a9 09 __ LDA #$09
243f : 8d 01 d6 STA $d601 
2442 : e6 43 __ INC T2 + 0 
2444 : a5 43 __ LDA T2 + 0 
2446 : c9 18 __ CMP #$18
2448 : b0 03 __ BCS $244d ; (main.s753 + 0)
244a : 4c bc 23 JMP $23bc ; (main.l755 + 0)
.s753:
244d : a9 04 __ LDA #$04
244f : 85 43 __ STA T2 + 0 
.l794:
2451 : ad d6 3b LDA $3bd6 ; (vdc_state + 8)
2454 : 85 45 __ STA T5 + 0 
2456 : ad d7 3b LDA $3bd7 ; (vdc_state + 9)
2459 : 85 46 __ STA T5 + 1 
245b : a9 12 __ LDA #$12
245d : 8d 00 d6 STA $d600 
2460 : a5 43 __ LDA T2 + 0 
2462 : c9 18 __ CMP #$18
2464 : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
2467 : b0 03 __ BCS $246c ; (main.s793 + 0)
2469 : 4c 77 2a JMP $2a77 ; (main.s795 + 0)
.s793:
246c : 0a __ __ ASL
246d : a8 __ __ TAY
246e : ad d2 3b LDA $3bd2 ; (vdc_state + 4)
2471 : 2a __ __ ROL
2472 : aa __ __ TAX
2473 : 98 __ __ TYA
2474 : 18 __ __ CLC
2475 : 6d d1 3b ADC $3bd1 ; (vdc_state + 3)
2478 : 85 54 __ STA T3 + 0 
247a : 8a __ __ TXA
247b : 6d d2 3b ADC $3bd2 ; (vdc_state + 4)
247e : 06 54 __ ASL T3 + 0 
2480 : 2a __ __ ROL
2481 : 06 54 __ ASL T3 + 0 
2483 : 2a __ __ ROL
2484 : 06 54 __ ASL T3 + 0 
2486 : 2a __ __ ROL
2487 : aa __ __ TAX
2488 : a5 54 __ LDA T3 + 0 
248a : 09 04 __ ORA #$04
248c : a8 __ __ TAY
248d : 18 __ __ CLC
248e : 65 45 __ ADC T5 + 0 
2490 : 85 49 __ STA T7 + 0 
2492 : 8a __ __ TXA
2493 : 65 46 __ ADC T5 + 1 
.l841:
2495 : 2c 00 d6 BIT $d600 
2498 : 10 fb __ BPL $2495 ; (main.l841 + 0)
.s842:
249a : 8d 01 d6 STA $d601 
249d : a9 13 __ LDA #$13
249f : 8d 00 d6 STA $d600 
.l7257:
24a2 : 2c 00 d6 BIT $d600 
24a5 : 10 fb __ BPL $24a2 ; (main.l7257 + 0)
.s847:
24a7 : a5 49 __ LDA T7 + 0 
24a9 : 8d 01 d6 STA $d601 
24ac : a9 1f __ LDA #$1f
24ae : 8d 00 d6 STA $d600 
.l7259:
24b1 : 2c 00 d6 BIT $d600 
24b4 : 10 fb __ BPL $24b1 ; (main.l7259 + 0)
.s851:
24b6 : a9 7c __ LDA #$7c
24b8 : 8d 01 d6 STA $d601 
24bb : a9 12 __ LDA #$12
24bd : 8d 00 d6 STA $d600 
24c0 : 98 __ __ TYA
24c1 : 18 __ __ CLC
24c2 : 6d d8 3b ADC $3bd8 ; (vdc_state + 10)
24c5 : a8 __ __ TAY
24c6 : 8a __ __ TXA
24c7 : 6d d9 3b ADC $3bd9 ; (vdc_state + 11)
.l7261:
24ca : 2c 00 d6 BIT $d600 
24cd : 10 fb __ BPL $24ca ; (main.l7261 + 0)
.s858:
24cf : 8d 01 d6 STA $d601 
24d2 : a9 13 __ LDA #$13
24d4 : 8d 00 d6 STA $d600 
.l7263:
24d7 : 2c 00 d6 BIT $d600 
24da : 10 fb __ BPL $24d7 ; (main.l7263 + 0)
.s863:
24dc : 8c 01 d6 STY $d601 
24df : a9 1f __ LDA #$1f
24e1 : 8d 00 d6 STA $d600 
.l7265:
24e4 : 2c 00 d6 BIT $d600 
24e7 : 10 fb __ BPL $24e4 ; (main.l7265 + 0)
.s867:
24e9 : a9 09 __ LDA #$09
24eb : 8d 01 d6 STA $d601 
24ee : a9 12 __ LDA #$12
24f0 : 8d 00 d6 STA $d600 
24f3 : 18 __ __ CLC
24f4 : a5 54 __ LDA T3 + 0 
24f6 : 69 05 __ ADC #$05
24f8 : a8 __ __ TAY
24f9 : 8a __ __ TXA
24fa : 69 00 __ ADC #$00
24fc : 85 48 __ STA T6 + 1 
24fe : 98 __ __ TYA
24ff : 18 __ __ CLC
2500 : 65 45 __ ADC T5 + 0 
2502 : 85 4b __ STA T8 + 0 
2504 : a5 48 __ LDA T6 + 1 
2506 : 65 46 __ ADC T5 + 1 
.l7267:
2508 : 2c 00 d6 BIT $d600 
250b : 10 fb __ BPL $2508 ; (main.l7267 + 0)
.s877:
250d : 8d 01 d6 STA $d601 
2510 : a9 13 __ LDA #$13
2512 : 8d 00 d6 STA $d600 
.l7269:
2515 : 2c 00 d6 BIT $d600 
2518 : 10 fb __ BPL $2515 ; (main.l7269 + 0)
.s882:
251a : a5 4b __ LDA T8 + 0 
251c : 8d 01 d6 STA $d601 
251f : a9 1f __ LDA #$1f
2521 : 8d 00 d6 STA $d600 
.l7271:
2524 : 2c 00 d6 BIT $d600 
2527 : 10 fb __ BPL $2524 ; (main.l7271 + 0)
.s886:
2529 : a9 e2 __ LDA #$e2
252b : 8d 01 d6 STA $d601 
252e : a9 18 __ LDA #$18
2530 : 8d 00 d6 STA $d600 
.l7273:
2533 : 2c 00 d6 BIT $d600 
2536 : 10 fb __ BPL $2533 ; (main.l7273 + 0)
.s892:
2538 : ad 01 d6 LDA $d601 
253b : 29 7f __ AND #$7f
253d : 85 4b __ STA T8 + 0 
253f : a9 18 __ LDA #$18
2541 : 8d 00 d6 STA $d600 
.l7275:
2544 : 2c 00 d6 BIT $d600 
2547 : 10 fb __ BPL $2544 ; (main.l7275 + 0)
.s898:
2549 : a5 4b __ LDA T8 + 0 
254b : 8d 01 d6 STA $d601 
254e : a9 1e __ LDA #$1e
2550 : 8d 00 d6 STA $d600 
.l7277:
2553 : 2c 00 d6 BIT $d600 
2556 : 10 fb __ BPL $2553 ; (main.l7277 + 0)
.s903:
2558 : a9 45 __ LDA #$45
255a : 8d 01 d6 STA $d601 
255d : a9 12 __ LDA #$12
255f : 8d 00 d6 STA $d600 
2562 : 98 __ __ TYA
2563 : 18 __ __ CLC
2564 : 6d d8 3b ADC $3bd8 ; (vdc_state + 10)
2567 : a8 __ __ TAY
2568 : a5 48 __ LDA T6 + 1 
256a : 6d d9 3b ADC $3bd9 ; (vdc_state + 11)
.l7279:
256d : 2c 00 d6 BIT $d600 
2570 : 10 fb __ BPL $256d ; (main.l7279 + 0)
.s910:
2572 : 8d 01 d6 STA $d601 
2575 : a9 13 __ LDA #$13
2577 : 8d 00 d6 STA $d600 
.l7281:
257a : 2c 00 d6 BIT $d600 
257d : 10 fb __ BPL $257a ; (main.l7281 + 0)
.s915:
257f : 8c 01 d6 STY $d601 
2582 : a9 1f __ LDA #$1f
2584 : 8d 00 d6 STA $d600 
.l7283:
2587 : 2c 00 d6 BIT $d600 
258a : 10 fb __ BPL $2587 ; (main.l7283 + 0)
.s919:
258c : a9 09 __ LDA #$09
258e : 8d 01 d6 STA $d601 
2591 : a9 18 __ LDA #$18
2593 : 8d 00 d6 STA $d600 
.l7285:
2596 : 2c 00 d6 BIT $d600 
2599 : 10 fb __ BPL $2596 ; (main.l7285 + 0)
.s925:
259b : ad 01 d6 LDA $d601 
259e : 29 7f __ AND #$7f
25a0 : a8 __ __ TAY
25a1 : a9 18 __ LDA #$18
25a3 : 8d 00 d6 STA $d600 
.l7287:
25a6 : 2c 00 d6 BIT $d600 
25a9 : 10 fb __ BPL $25a6 ; (main.l7287 + 0)
.s931:
25ab : 8c 01 d6 STY $d601 
25ae : a9 1e __ LDA #$1e
25b0 : 8d 00 d6 STA $d600 
.l7289:
25b3 : 2c 00 d6 BIT $d600 
25b6 : 10 fb __ BPL $25b3 ; (main.l7289 + 0)
.s936:
25b8 : a9 45 __ LDA #$45
25ba : 8d 01 d6 STA $d601 
25bd : a9 12 __ LDA #$12
25bf : 8d 00 d6 STA $d600 
25c2 : 18 __ __ CLC
25c3 : a5 54 __ LDA T3 + 0 
25c5 : 69 4b __ ADC #$4b
25c7 : a8 __ __ TAY
25c8 : 90 01 __ BCC $25cb ; (main.s1465 + 0)
.s1464:
25ca : e8 __ __ INX
.s1465:
25cb : 18 __ __ CLC
25cc : 65 45 __ ADC T5 + 0 
25ce : 85 47 __ STA T6 + 0 
25d0 : 8a __ __ TXA
25d1 : 65 46 __ ADC T5 + 1 
.l7291:
25d3 : 2c 00 d6 BIT $d600 
25d6 : 10 fb __ BPL $25d3 ; (main.l7291 + 0)
.s946:
25d8 : 8d 01 d6 STA $d601 
25db : a9 13 __ LDA #$13
25dd : 8d 00 d6 STA $d600 
.l7293:
25e0 : 2c 00 d6 BIT $d600 
25e3 : 10 fb __ BPL $25e0 ; (main.l7293 + 0)
.s951:
25e5 : a5 47 __ LDA T6 + 0 
25e7 : 8d 01 d6 STA $d601 
25ea : a9 1f __ LDA #$1f
25ec : 8d 00 d6 STA $d600 
.l7295:
25ef : 2c 00 d6 BIT $d600 
25f2 : 10 fb __ BPL $25ef ; (main.l7295 + 0)
.s955:
25f4 : a9 7e __ LDA #$7e
25f6 : 8d 01 d6 STA $d601 
25f9 : a9 12 __ LDA #$12
25fb : 8d 00 d6 STA $d600 
25fe : 98 __ __ TYA
25ff : 18 __ __ CLC
2600 : 6d d8 3b ADC $3bd8 ; (vdc_state + 10)
2603 : a8 __ __ TAY
2604 : 8a __ __ TXA
2605 : 6d d9 3b ADC $3bd9 ; (vdc_state + 11)
.l7297:
2608 : 2c 00 d6 BIT $d600 
260b : 10 fb __ BPL $2608 ; (main.l7297 + 0)
.s962:
260d : 8d 01 d6 STA $d601 
2610 : a9 13 __ LDA #$13
2612 : 8d 00 d6 STA $d600 
.l7299:
2615 : 2c 00 d6 BIT $d600 
2618 : 10 fb __ BPL $2615 ; (main.l7299 + 0)
.s967:
261a : 8c 01 d6 STY $d601 
261d : a9 1f __ LDA #$1f
261f : 8d 00 d6 STA $d600 
.l7301:
2622 : 2c 00 d6 BIT $d600 
2625 : 10 fb __ BPL $2622 ; (main.l7301 + 0)
.s971:
2627 : a9 09 __ LDA #$09
2629 : 8d 01 d6 STA $d601 
262c : a5 45 __ LDA T5 + 0 
262e : 85 54 __ STA T3 + 0 
2630 : a5 46 __ LDA T5 + 1 
2632 : 85 55 __ STA T3 + 1 
2634 : a9 04 __ LDA #$04
2636 : 85 43 __ STA T2 + 0 
.l973:
2638 : 85 45 __ STA T5 + 0 
263a : a9 05 __ LDA #$05
263c : 85 44 __ STA T4 + 0 
.l977:
263e : a5 52 __ LDA T0 + 0 
2640 : 85 4f __ STA T10 + 0 
2642 : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
2645 : 85 47 __ STA T6 + 0 
2647 : 85 1b __ STA ACCU + 0 
2649 : ad d2 3b LDA $3bd2 ; (vdc_state + 4)
264c : 85 48 __ STA T6 + 1 
264e : 85 1c __ STA ACCU + 1 
2650 : a9 12 __ LDA #$12
2652 : 8d 00 d6 STA $d600 
2655 : e6 52 __ INC T0 + 0 
2657 : a5 45 __ LDA T5 + 0 
2659 : 20 91 3a JSR $3a91 ; (mul16by8 + 0)
265c : 18 __ __ CLC
265d : a5 44 __ LDA T4 + 0 
265f : 65 05 __ ADC WORK + 2 
2661 : 85 49 __ STA T7 + 0 
2663 : a9 00 __ LDA #$00
2665 : 65 06 __ ADC WORK + 3 
2667 : 85 4a __ STA T7 + 1 
2669 : 18 __ __ CLC
266a : a5 49 __ LDA T7 + 0 
266c : 65 54 __ ADC T3 + 0 
266e : aa __ __ TAX
266f : a5 4a __ LDA T7 + 1 
2671 : 65 55 __ ADC T3 + 1 
2673 : a4 53 __ LDY T1 + 0 
2675 : e6 53 __ INC T1 + 0 
.l7303:
2677 : 2c 00 d6 BIT $d600 
267a : 10 fb __ BPL $2677 ; (main.l7303 + 0)
.s989:
267c : 8d 01 d6 STA $d601 
267f : a9 13 __ LDA #$13
2681 : 8d 00 d6 STA $d600 
.l7305:
2684 : 2c 00 d6 BIT $d600 
2687 : 10 fb __ BPL $2684 ; (main.l7305 + 0)
.s994:
2689 : 8e 01 d6 STX $d601 
268c : a9 1f __ LDA #$1f
268e : 8d 00 d6 STA $d600 
.l7307:
2691 : 2c 00 d6 BIT $d600 
2694 : 10 fb __ BPL $2691 ; (main.l7307 + 0)
.s998:
2696 : a5 4f __ LDA T10 + 0 
2698 : 8d 01 d6 STA $d601 
269b : ad d8 3b LDA $3bd8 ; (vdc_state + 10)
269e : 18 __ __ CLC
269f : 65 49 __ ADC T7 + 0 
26a1 : aa __ __ TAX
26a2 : a9 12 __ LDA #$12
26a4 : 8d 00 d6 STA $d600 
26a7 : ad d9 3b LDA $3bd9 ; (vdc_state + 11)
26aa : 65 4a __ ADC T7 + 1 
.l7309:
26ac : 2c 00 d6 BIT $d600 
26af : 10 fb __ BPL $26ac ; (main.l7309 + 0)
.s1005:
26b1 : 8d 01 d6 STA $d601 
26b4 : a9 13 __ LDA #$13
26b6 : 8d 00 d6 STA $d600 
.l7311:
26b9 : 2c 00 d6 BIT $d600 
26bc : 10 fb __ BPL $26b9 ; (main.l7311 + 0)
.s1010:
26be : 8e 01 d6 STX $d601 
26c1 : a9 1f __ LDA #$1f
26c3 : 8d 00 d6 STA $d600 
.l7313:
26c6 : 2c 00 d6 BIT $d600 
26c9 : 10 fb __ BPL $26c6 ; (main.l7313 + 0)
.s1014:
26cb : 8c 01 d6 STY $d601 
26ce : a5 53 __ LDA T1 + 0 
26d0 : c9 10 __ CMP #$10
26d2 : 90 04 __ BCC $26d8 ; (main.s4857 + 0)
.s1015:
26d4 : a9 00 __ LDA #$00
26d6 : 85 53 __ STA T1 + 0 
.s4857:
26d8 : e6 44 __ INC T4 + 0 
26da : a5 44 __ LDA T4 + 0 
26dc : c9 4b __ CMP #$4b
26de : b0 03 __ BCS $26e3 ; (main.s974 + 0)
26e0 : 4c 3e 26 JMP $263e ; (main.l977 + 0)
.s974:
26e3 : e6 43 __ INC T2 + 0 
26e5 : a5 43 __ LDA T2 + 0 
26e7 : c9 18 __ CMP #$18
26e9 : b0 03 __ BCS $26ee ; (main.s975 + 0)
26eb : 4c 38 26 JMP $2638 ; (main.l973 + 0)
.s975:
26ee : a5 47 __ LDA T6 + 0 
26f0 : 0a __ __ ASL
26f1 : 85 54 __ STA T3 + 0 
26f3 : a5 48 __ LDA T6 + 1 
26f5 : 2a __ __ ROL
26f6 : 06 54 __ ASL T3 + 0 
26f8 : 2a __ __ ROL
26f9 : aa __ __ TAX
26fa : 18 __ __ CLC
26fb : a5 54 __ LDA T3 + 0 
26fd : 69 05 __ ADC #$05
26ff : 85 54 __ STA T3 + 0 
2701 : 90 01 __ BCC $2704 ; (main.s1467 + 0)
.s1466:
2703 : e8 __ __ INX
.s1467:
2704 : 86 55 __ STX T3 + 1 
2706 : a9 14 __ LDA #$14
2708 : 85 52 __ STA T0 + 0 
.l1021:
270a : 20 40 33 JSR $3340 ; (getch.s0 + 0)
270d : ad d6 3b LDA $3bd6 ; (vdc_state + 8)
2710 : 18 __ __ CLC
2711 : 65 54 __ ADC T3 + 0 
2713 : aa __ __ TAX
2714 : ad d7 3b LDA $3bd7 ; (vdc_state + 9)
2717 : 65 55 __ ADC T3 + 1 
2719 : a8 __ __ TAY
271a : 8a __ __ TXA
271b : 18 __ __ CLC
271c : 69 50 __ ADC #$50
271e : 85 47 __ STA T6 + 0 
2720 : 98 __ __ TYA
2721 : 69 00 __ ADC #$00
2723 : 85 48 __ STA T6 + 1 
2725 : a9 13 __ LDA #$13
2727 : 85 53 __ STA T1 + 0 
.l1026:
2729 : a9 12 __ LDA #$12
272b : 8d 00 d6 STA $d600 
.l7318:
272e : 2c 00 d6 BIT $d600 
2731 : 10 fb __ BPL $272e ; (main.l7318 + 0)
.s1035:
2733 : 8c 01 d6 STY $d601 
2736 : a9 13 __ LDA #$13
2738 : 8d 00 d6 STA $d600 
.l7320:
273b : 2c 00 d6 BIT $d600 
273e : 10 fb __ BPL $273b ; (main.l7320 + 0)
.s1040:
2740 : 8e 01 d6 STX $d601 
2743 : a9 1f __ LDA #$1f
2745 : 8d 00 d6 STA $d600 
2748 : a9 18 __ LDA #$18
274a : 8d 00 d6 STA $d600 
.l7322:
274d : 2c 00 d6 BIT $d600 
2750 : 10 fb __ BPL $274d ; (main.l7322 + 0)
.s1047:
2752 : ad 01 d6 LDA $d601 
2755 : 09 80 __ ORA #$80
2757 : 85 49 __ STA T7 + 0 
2759 : a9 18 __ LDA #$18
275b : 8d 00 d6 STA $d600 
.l7324:
275e : 2c 00 d6 BIT $d600 
2761 : 10 fb __ BPL $275e ; (main.l7324 + 0)
.s1053:
2763 : a5 49 __ LDA T7 + 0 
2765 : 8d 01 d6 STA $d601 
2768 : a9 20 __ LDA #$20
276a : 8d 00 d6 STA $d600 
.l7326:
276d : 2c 00 d6 BIT $d600 
2770 : 10 fb __ BPL $276d ; (main.l7326 + 0)
.s1058:
2772 : a5 48 __ LDA T6 + 1 
2774 : 8d 01 d6 STA $d601 
2777 : a9 21 __ LDA #$21
2779 : 8d 00 d6 STA $d600 
.l7328:
277c : 2c 00 d6 BIT $d600 
277f : 10 fb __ BPL $277c ; (main.l7328 + 0)
.s1063:
2781 : a5 47 __ LDA T6 + 0 
2783 : 8d 01 d6 STA $d601 
2786 : a9 1f __ LDA #$1f
2788 : 8d 00 d6 STA $d600 
278b : a9 1e __ LDA #$1e
278d : 8d 00 d6 STA $d600 
.l7330:
2790 : 2c 00 d6 BIT $d600 
2793 : 10 fb __ BPL $2790 ; (main.l7330 + 0)
.s1069:
2795 : a9 46 __ LDA #$46
2797 : 8d 01 d6 STA $d601 
279a : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
279d : 18 __ __ CLC
279e : 65 47 __ ADC T6 + 0 
27a0 : 85 47 __ STA T6 + 0 
27a2 : ad d2 3b LDA $3bd2 ; (vdc_state + 4)
27a5 : 65 48 __ ADC T6 + 1 
27a7 : 85 48 __ STA T6 + 1 
27a9 : 8a __ __ TXA
27aa : 18 __ __ CLC
27ab : 6d d1 3b ADC $3bd1 ; (vdc_state + 3)
27ae : aa __ __ TAX
27af : 98 __ __ TYA
27b0 : 6d d2 3b ADC $3bd2 ; (vdc_state + 4)
27b3 : a8 __ __ TAY
27b4 : c6 53 __ DEC T1 + 0 
27b6 : f0 03 __ BEQ $27bb ; (main.s1024 + 0)
27b8 : 4c 29 27 JMP $2729 ; (main.l1026 + 0)
.s1024:
27bb : ad d8 3b LDA $3bd8 ; (vdc_state + 10)
27be : 18 __ __ CLC
27bf : 65 54 __ ADC T3 + 0 
27c1 : 85 45 __ STA T5 + 0 
27c3 : ad d9 3b LDA $3bd9 ; (vdc_state + 11)
27c6 : 65 55 __ ADC T3 + 1 
27c8 : 85 46 __ STA T5 + 1 
27ca : 18 __ __ CLC
27cb : a5 45 __ LDA T5 + 0 
27cd : 69 50 __ ADC #$50
27cf : 85 47 __ STA T6 + 0 
27d1 : a5 46 __ LDA T5 + 1 
27d3 : 69 00 __ ADC #$00
27d5 : 85 48 __ STA T6 + 1 
27d7 : a2 13 __ LDX #$13
.l1072:
27d9 : a9 12 __ LDA #$12
27db : 8d 00 d6 STA $d600 
.l7333:
27de : 2c 00 d6 BIT $d600 
27e1 : 10 fb __ BPL $27de ; (main.l7333 + 0)
.s1081:
27e3 : a5 46 __ LDA T5 + 1 
27e5 : 8d 01 d6 STA $d601 
27e8 : a9 13 __ LDA #$13
27ea : 8d 00 d6 STA $d600 
.l7335:
27ed : 2c 00 d6 BIT $d600 
27f0 : 10 fb __ BPL $27ed ; (main.l7335 + 0)
.s1086:
27f2 : a5 45 __ LDA T5 + 0 
27f4 : 8d 01 d6 STA $d601 
27f7 : a9 1f __ LDA #$1f
27f9 : 8d 00 d6 STA $d600 
27fc : a9 18 __ LDA #$18
27fe : 8d 00 d6 STA $d600 
.l7337:
2801 : 2c 00 d6 BIT $d600 
2804 : 10 fb __ BPL $2801 ; (main.l7337 + 0)
.s1093:
2806 : ac 01 d6 LDY $d601 
2809 : 8d 00 d6 STA $d600 
280c : 98 __ __ TYA
280d : 09 80 __ ORA #$80
.l7339:
280f : 2c 00 d6 BIT $d600 
2812 : 10 fb __ BPL $280f ; (main.l7339 + 0)
.s1099:
2814 : 8d 01 d6 STA $d601 
2817 : a9 20 __ LDA #$20
2819 : 8d 00 d6 STA $d600 
.l7341:
281c : 2c 00 d6 BIT $d600 
281f : 10 fb __ BPL $281c ; (main.l7341 + 0)
.s1104:
2821 : a5 48 __ LDA T6 + 1 
2823 : 8d 01 d6 STA $d601 
2826 : a9 21 __ LDA #$21
2828 : 8d 00 d6 STA $d600 
.l7343:
282b : 2c 00 d6 BIT $d600 
282e : 10 fb __ BPL $282b ; (main.l7343 + 0)
.s1109:
2830 : a5 47 __ LDA T6 + 0 
2832 : 8d 01 d6 STA $d601 
2835 : a9 1f __ LDA #$1f
2837 : 8d 00 d6 STA $d600 
283a : a9 1e __ LDA #$1e
283c : 8d 00 d6 STA $d600 
.l7345:
283f : 2c 00 d6 BIT $d600 
2842 : 10 fb __ BPL $283f ; (main.l7345 + 0)
.s1115:
2844 : a9 46 __ LDA #$46
2846 : 8d 01 d6 STA $d601 
2849 : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
284c : 18 __ __ CLC
284d : 65 47 __ ADC T6 + 0 
284f : 85 47 __ STA T6 + 0 
2851 : ad d2 3b LDA $3bd2 ; (vdc_state + 4)
2854 : 65 48 __ ADC T6 + 1 
2856 : 85 48 __ STA T6 + 1 
2858 : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
285b : 18 __ __ CLC
285c : 65 45 __ ADC T5 + 0 
285e : 85 45 __ STA T5 + 0 
2860 : ad d2 3b LDA $3bd2 ; (vdc_state + 4)
2863 : 65 46 __ ADC T5 + 1 
2865 : 85 46 __ STA T5 + 1 
2867 : ca __ __ DEX
2868 : f0 03 __ BEQ $286d ; (main.s1070 + 0)
286a : 4c d9 27 JMP $27d9 ; (main.l1072 + 0)
.s1070:
286d : a9 12 __ LDA #$12
286f : 8d 00 d6 STA $d600 
2872 : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
2875 : 85 1b __ STA ACCU + 0 
2877 : ad d2 3b LDA $3bd2 ; (vdc_state + 4)
287a : 85 1c __ STA ACCU + 1 
287c : a9 17 __ LDA #$17
287e : 20 91 3a JSR $3a91 ; (mul16by8 + 0)
2881 : 18 __ __ CLC
2882 : a5 05 __ LDA WORK + 2 
2884 : 69 05 __ ADC #$05
2886 : 85 47 __ STA T6 + 0 
2888 : a5 06 __ LDA WORK + 3 
288a : 69 00 __ ADC #$00
288c : 85 48 __ STA T6 + 1 
288e : 18 __ __ CLC
288f : a5 47 __ LDA T6 + 0 
2891 : 6d d6 3b ADC $3bd6 ; (vdc_state + 8)
2894 : aa __ __ TAX
2895 : a5 48 __ LDA T6 + 1 
2897 : 6d d7 3b ADC $3bd7 ; (vdc_state + 9)
.l7348:
289a : 2c 00 d6 BIT $d600 
289d : 10 fb __ BPL $289a ; (main.l7348 + 0)
.s1125:
289f : 8d 01 d6 STA $d601 
28a2 : a9 13 __ LDA #$13
28a4 : 8d 00 d6 STA $d600 
.l7350:
28a7 : 2c 00 d6 BIT $d600 
28aa : 10 fb __ BPL $28a7 ; (main.l7350 + 0)
.s1130:
28ac : 8e 01 d6 STX $d601 
28af : a9 1f __ LDA #$1f
28b1 : 8d 00 d6 STA $d600 
.l7352:
28b4 : 2c 00 d6 BIT $d600 
28b7 : 10 fb __ BPL $28b4 ; (main.l7352 + 0)
.s1134:
28b9 : a9 20 __ LDA #$20
28bb : 8d 01 d6 STA $d601 
28be : a9 18 __ LDA #$18
28c0 : 8d 00 d6 STA $d600 
.l7354:
28c3 : 2c 00 d6 BIT $d600 
28c6 : 10 fb __ BPL $28c3 ; (main.l7354 + 0)
.s1140:
28c8 : ad 01 d6 LDA $d601 
28cb : 29 7f __ AND #$7f
28cd : aa __ __ TAX
28ce : a9 18 __ LDA #$18
28d0 : 8d 00 d6 STA $d600 
.l7356:
28d3 : 2c 00 d6 BIT $d600 
28d6 : 10 fb __ BPL $28d3 ; (main.l7356 + 0)
.s1146:
28d8 : 8e 01 d6 STX $d601 
28db : a9 1e __ LDA #$1e
28dd : 8d 00 d6 STA $d600 
.l7358:
28e0 : 2c 00 d6 BIT $d600 
28e3 : 10 fb __ BPL $28e0 ; (main.l7358 + 0)
.s1151:
28e5 : a9 45 __ LDA #$45
28e7 : 8d 01 d6 STA $d601 
28ea : ad d8 3b LDA $3bd8 ; (vdc_state + 10)
28ed : 18 __ __ CLC
28ee : 65 47 __ ADC T6 + 0 
28f0 : aa __ __ TAX
28f1 : a9 12 __ LDA #$12
28f3 : 8d 00 d6 STA $d600 
28f6 : ad d9 3b LDA $3bd9 ; (vdc_state + 11)
28f9 : 65 48 __ ADC T6 + 1 
.l7360:
28fb : 2c 00 d6 BIT $d600 
28fe : 10 fb __ BPL $28fb ; (main.l7360 + 0)
.s1158:
2900 : 8d 01 d6 STA $d601 
2903 : a9 13 __ LDA #$13
2905 : 8d 00 d6 STA $d600 
.l7362:
2908 : 2c 00 d6 BIT $d600 
290b : 10 fb __ BPL $2908 ; (main.l7362 + 0)
.s1163:
290d : 8e 01 d6 STX $d601 
2910 : a9 1f __ LDA #$1f
2912 : 8d 00 d6 STA $d600 
.l7364:
2915 : 2c 00 d6 BIT $d600 
2918 : 10 fb __ BPL $2915 ; (main.l7364 + 0)
.s1167:
291a : a9 0d __ LDA #$0d
291c : 8d 01 d6 STA $d601 
291f : a9 18 __ LDA #$18
2921 : 8d 00 d6 STA $d600 
.l7366:
2924 : 2c 00 d6 BIT $d600 
2927 : 10 fb __ BPL $2924 ; (main.l7366 + 0)
.s1173:
2929 : ad 01 d6 LDA $d601 
292c : 29 7f __ AND #$7f
292e : aa __ __ TAX
292f : a9 18 __ LDA #$18
2931 : 8d 00 d6 STA $d600 
.l7368:
2934 : 2c 00 d6 BIT $d600 
2937 : 10 fb __ BPL $2934 ; (main.l7368 + 0)
.s1179:
2939 : 8e 01 d6 STX $d601 
293c : a9 1e __ LDA #$1e
293e : 8d 00 d6 STA $d600 
.l7370:
2941 : 2c 00 d6 BIT $d600 
2944 : 10 fb __ BPL $2941 ; (main.l7370 + 0)
.s1184:
2946 : a9 45 __ LDA #$45
2948 : 8d 01 d6 STA $d601 
294b : c6 52 __ DEC T0 + 0 
294d : f0 03 __ BEQ $2952 ; (main.s1023 + 0)
294f : 4c 0a 27 JMP $270a ; (main.l1021 + 0)
.s1023:
2952 : a9 00 __ LDA #$00
2954 : 8d 30 d0 STA $d030 
2957 : 85 16 __ STA P9 
2959 : ad 11 d0 LDA $d011 
295c : 29 7f __ AND #$7f
295e : 09 10 __ ORA #$10
2960 : 8d 11 d0 STA $d011 
2963 : 20 8b 33 JSR $338b ; (vdc_set_mode.s1000 + 0)
2966 : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
2969 : 85 54 __ STA T3 + 0 
296b : ad d3 3b LDA $3bd3 ; (vdc_state + 5)
296e : 85 45 __ STA T5 + 0 
.l1192:
2970 : a5 52 __ LDA T0 + 0 
2972 : c5 45 __ CMP T5 + 0 
2974 : 90 21 __ BCC $2997 ; (main.s1193 + 0)
.s1185:
2976 : a9 00 __ LDA #$00
2978 : 85 1b __ STA ACCU + 0 
297a : 85 1c __ STA ACCU + 1 
.s1001:
297c : 18 __ __ CLC
297d : a5 23 __ LDA SP + 0 
297f : 69 08 __ ADC #$08
2981 : 85 23 __ STA SP + 0 
2983 : 90 02 __ BCC $2987 ; (main.s1001 + 11)
2985 : e6 24 __ INC SP + 1 
2987 : ad a8 bf LDA $bfa8 ; (main@stack + 0)
298a : 85 53 __ STA T1 + 0 
298c : ad a9 bf LDA $bfa9 ; (main@stack + 1)
298f : 85 54 __ STA T3 + 0 
2991 : ad aa bf LDA $bfaa ; (main@stack + 2)
2994 : 85 55 __ STA T3 + 1 
2996 : 60 __ __ RTS
.s1193:
2997 : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
299a : 85 1b __ STA ACCU + 0 
299c : ad d2 3b LDA $3bd2 ; (vdc_state + 4)
299f : 85 1c __ STA ACCU + 1 
29a1 : ad d5 3b LDA $3bd5 ; (vdc_state + 7)
29a4 : 85 53 __ STA T1 + 0 
29a6 : a9 12 __ LDA #$12
29a8 : 8d 00 d6 STA $d600 
29ab : a6 54 __ LDX T3 + 0 
29ad : ca __ __ DEX
29ae : 86 4b __ STX T8 + 0 
29b0 : a5 52 __ LDA T0 + 0 
29b2 : 20 91 3a JSR $3a91 ; (mul16by8 + 0)
29b5 : 18 __ __ CLC
29b6 : a5 05 __ LDA WORK + 2 
29b8 : 6d d6 3b ADC $3bd6 ; (vdc_state + 8)
29bb : aa __ __ TAX
29bc : a5 06 __ LDA WORK + 3 
29be : 6d d7 3b ADC $3bd7 ; (vdc_state + 9)
.l7373:
29c1 : 2c 00 d6 BIT $d600 
29c4 : 10 fb __ BPL $29c1 ; (main.l7373 + 0)
.s1205:
29c6 : 8d 01 d6 STA $d601 
29c9 : a9 13 __ LDA #$13
29cb : 8d 00 d6 STA $d600 
.l7375:
29ce : 2c 00 d6 BIT $d600 
29d1 : 10 fb __ BPL $29ce ; (main.l7375 + 0)
.s1210:
29d3 : 8e 01 d6 STX $d601 
29d6 : a9 1f __ LDA #$1f
29d8 : 8d 00 d6 STA $d600 
.l7377:
29db : 2c 00 d6 BIT $d600 
29de : 10 fb __ BPL $29db ; (main.l7377 + 0)
.s1214:
29e0 : a9 20 __ LDA #$20
29e2 : 8d 01 d6 STA $d601 
29e5 : a9 18 __ LDA #$18
29e7 : 8d 00 d6 STA $d600 
.l7379:
29ea : 2c 00 d6 BIT $d600 
29ed : 10 fb __ BPL $29ea ; (main.l7379 + 0)
.s1220:
29ef : ad 01 d6 LDA $d601 
29f2 : 29 7f __ AND #$7f
29f4 : aa __ __ TAX
29f5 : a9 18 __ LDA #$18
29f7 : 8d 00 d6 STA $d600 
.l7381:
29fa : 2c 00 d6 BIT $d600 
29fd : 10 fb __ BPL $29fa ; (main.l7381 + 0)
.s1226:
29ff : 8e 01 d6 STX $d601 
2a02 : a9 1e __ LDA #$1e
2a04 : 8d 00 d6 STA $d600 
.l7383:
2a07 : 2c 00 d6 BIT $d600 
2a0a : 10 fb __ BPL $2a07 ; (main.l7383 + 0)
.s1231:
2a0c : a5 4b __ LDA T8 + 0 
2a0e : 8d 01 d6 STA $d601 
2a11 : ad d8 3b LDA $3bd8 ; (vdc_state + 10)
2a14 : 18 __ __ CLC
2a15 : 65 05 __ ADC WORK + 2 
2a17 : aa __ __ TAX
2a18 : a9 12 __ LDA #$12
2a1a : 8d 00 d6 STA $d600 
2a1d : ad d9 3b LDA $3bd9 ; (vdc_state + 11)
2a20 : 65 06 __ ADC WORK + 3 
.l7385:
2a22 : 2c 00 d6 BIT $d600 
2a25 : 10 fb __ BPL $2a22 ; (main.l7385 + 0)
.s1238:
2a27 : 8d 01 d6 STA $d601 
2a2a : a9 13 __ LDA #$13
2a2c : 8d 00 d6 STA $d600 
.l7387:
2a2f : 2c 00 d6 BIT $d600 
2a32 : 10 fb __ BPL $2a2f ; (main.l7387 + 0)
.s1243:
2a34 : 8e 01 d6 STX $d601 
2a37 : a9 1f __ LDA #$1f
2a39 : 8d 00 d6 STA $d600 
.l7389:
2a3c : 2c 00 d6 BIT $d600 
2a3f : 10 fb __ BPL $2a3c ; (main.l7389 + 0)
.s1247:
2a41 : a5 53 __ LDA T1 + 0 
2a43 : 8d 01 d6 STA $d601 
2a46 : a9 18 __ LDA #$18
2a48 : 8d 00 d6 STA $d600 
.l7391:
2a4b : 2c 00 d6 BIT $d600 
2a4e : 10 fb __ BPL $2a4b ; (main.l7391 + 0)
.s1253:
2a50 : ad 01 d6 LDA $d601 
2a53 : 29 7f __ AND #$7f
2a55 : aa __ __ TAX
2a56 : a9 18 __ LDA #$18
2a58 : 8d 00 d6 STA $d600 
.l7393:
2a5b : 2c 00 d6 BIT $d600 
2a5e : 10 fb __ BPL $2a5b ; (main.l7393 + 0)
.s1259:
2a60 : 8e 01 d6 STX $d601 
2a63 : a9 1e __ LDA #$1e
2a65 : 8d 00 d6 STA $d600 
.l7395:
2a68 : 2c 00 d6 BIT $d600 
2a6b : 10 fb __ BPL $2a68 ; (main.l7395 + 0)
.s1264:
2a6d : a5 4b __ LDA T8 + 0 
2a6f : 8d 01 d6 STA $d601 
2a72 : e6 52 __ INC T0 + 0 
2a74 : 4c 70 29 JMP $2970 ; (main.l1192 + 0)
.s795:
2a77 : 85 1b __ STA ACCU + 0 
2a79 : ad d2 3b LDA $3bd2 ; (vdc_state + 4)
2a7c : 85 1c __ STA ACCU + 1 
2a7e : a5 43 __ LDA T2 + 0 
2a80 : 20 91 3a JSR $3a91 ; (mul16by8 + 0)
2a83 : 18 __ __ CLC
2a84 : a5 05 __ LDA WORK + 2 
2a86 : 69 4b __ ADC #$4b
2a88 : 85 54 __ STA T3 + 0 
2a8a : a5 06 __ LDA WORK + 3 
2a8c : 69 00 __ ADC #$00
2a8e : 85 55 __ STA T3 + 1 
2a90 : 18 __ __ CLC
2a91 : a5 54 __ LDA T3 + 0 
2a93 : 65 45 __ ADC T5 + 0 
2a95 : aa __ __ TAX
2a96 : a5 55 __ LDA T3 + 1 
2a98 : 65 46 __ ADC T5 + 1 
.l1450:
2a9a : 2c 00 d6 BIT $d600 
2a9d : 10 fb __ BPL $2a9a ; (main.l1450 + 0)
.s807:
2a9f : 8d 01 d6 STA $d601 
2aa2 : a9 13 __ LDA #$13
2aa4 : 8d 00 d6 STA $d600 
.l7245:
2aa7 : 2c 00 d6 BIT $d600 
2aaa : 10 fb __ BPL $2aa7 ; (main.l7245 + 0)
.s812:
2aac : 8e 01 d6 STX $d601 
2aaf : a9 1f __ LDA #$1f
2ab1 : 8d 00 d6 STA $d600 
.l7247:
2ab4 : 2c 00 d6 BIT $d600 
2ab7 : 10 fb __ BPL $2ab4 ; (main.l7247 + 0)
.s816:
2ab9 : a9 61 __ LDA #$61
2abb : 8d 01 d6 STA $d601 
2abe : ad d8 3b LDA $3bd8 ; (vdc_state + 10)
2ac1 : 18 __ __ CLC
2ac2 : 65 54 __ ADC T3 + 0 
2ac4 : aa __ __ TAX
2ac5 : a9 12 __ LDA #$12
2ac7 : 8d 00 d6 STA $d600 
2aca : ad d9 3b LDA $3bd9 ; (vdc_state + 11)
2acd : 65 55 __ ADC T3 + 1 
.l7249:
2acf : 2c 00 d6 BIT $d600 
2ad2 : 10 fb __ BPL $2acf ; (main.l7249 + 0)
.s823:
2ad4 : 8d 01 d6 STA $d601 
2ad7 : a9 13 __ LDA #$13
2ad9 : 8d 00 d6 STA $d600 
.l7251:
2adc : 2c 00 d6 BIT $d600 
2adf : 10 fb __ BPL $2adc ; (main.l7251 + 0)
.s828:
2ae1 : 8e 01 d6 STX $d601 
2ae4 : a9 1f __ LDA #$1f
2ae6 : 8d 00 d6 STA $d600 
.l7253:
2ae9 : 2c 00 d6 BIT $d600 
2aec : 10 fb __ BPL $2ae9 ; (main.l7253 + 0)
.s832:
2aee : a9 09 __ LDA #$09
2af0 : 8d 01 d6 STA $d601 
2af3 : e6 43 __ INC T2 + 0 
2af5 : 4c 51 24 JMP $2451 ; (main.l794 + 0)
.s287:
2af8 : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
2afb : 85 1b __ STA ACCU + 0 
2afd : ad d2 3b LDA $3bd2 ; (vdc_state + 4)
2b00 : 85 1c __ STA ACCU + 1 
2b02 : ad d5 3b LDA $3bd5 ; (vdc_state + 7)
2b05 : 85 44 __ STA T4 + 0 
2b07 : a9 12 __ LDA #$12
2b09 : 8d 00 d6 STA $d600 
2b0c : a6 54 __ LDX T3 + 0 
2b0e : ca __ __ DEX
2b0f : 86 4b __ STX T8 + 0 
2b11 : a5 43 __ LDA T2 + 0 
2b13 : 20 91 3a JSR $3a91 ; (mul16by8 + 0)
2b16 : 18 __ __ CLC
2b17 : a5 05 __ LDA WORK + 2 
2b19 : 6d d6 3b ADC $3bd6 ; (vdc_state + 8)
2b1c : aa __ __ TAX
2b1d : a5 06 __ LDA WORK + 3 
2b1f : 6d d7 3b ADC $3bd7 ; (vdc_state + 9)
.l7428:
2b22 : 2c 00 d6 BIT $d600 
2b25 : 10 fb __ BPL $2b22 ; (main.l7428 + 0)
.s299:
2b27 : 8d 01 d6 STA $d601 
2b2a : a9 13 __ LDA #$13
2b2c : 8d 00 d6 STA $d600 
.l7430:
2b2f : 2c 00 d6 BIT $d600 
2b32 : 10 fb __ BPL $2b2f ; (main.l7430 + 0)
.s304:
2b34 : 8e 01 d6 STX $d601 
2b37 : a9 1f __ LDA #$1f
2b39 : 8d 00 d6 STA $d600 
.l7432:
2b3c : 2c 00 d6 BIT $d600 
2b3f : 10 fb __ BPL $2b3c ; (main.l7432 + 0)
.s308:
2b41 : a9 20 __ LDA #$20
2b43 : 8d 01 d6 STA $d601 
2b46 : a9 18 __ LDA #$18
2b48 : 8d 00 d6 STA $d600 
.l7434:
2b4b : 2c 00 d6 BIT $d600 
2b4e : 10 fb __ BPL $2b4b ; (main.l7434 + 0)
.s314:
2b50 : ad 01 d6 LDA $d601 
2b53 : 29 7f __ AND #$7f
2b55 : aa __ __ TAX
2b56 : a9 18 __ LDA #$18
2b58 : 8d 00 d6 STA $d600 
.l7436:
2b5b : 2c 00 d6 BIT $d600 
2b5e : 10 fb __ BPL $2b5b ; (main.l7436 + 0)
.s320:
2b60 : 8e 01 d6 STX $d601 
2b63 : a9 1e __ LDA #$1e
2b65 : 8d 00 d6 STA $d600 
.l7438:
2b68 : 2c 00 d6 BIT $d600 
2b6b : 10 fb __ BPL $2b68 ; (main.l7438 + 0)
.s325:
2b6d : a5 4b __ LDA T8 + 0 
2b6f : 8d 01 d6 STA $d601 
2b72 : ad d8 3b LDA $3bd8 ; (vdc_state + 10)
2b75 : 18 __ __ CLC
2b76 : 65 05 __ ADC WORK + 2 
2b78 : aa __ __ TAX
2b79 : a9 12 __ LDA #$12
2b7b : 8d 00 d6 STA $d600 
2b7e : ad d9 3b LDA $3bd9 ; (vdc_state + 11)
2b81 : 65 06 __ ADC WORK + 3 
.l7440:
2b83 : 2c 00 d6 BIT $d600 
2b86 : 10 fb __ BPL $2b83 ; (main.l7440 + 0)
.s332:
2b88 : 8d 01 d6 STA $d601 
2b8b : a9 13 __ LDA #$13
2b8d : 8d 00 d6 STA $d600 
.l7442:
2b90 : 2c 00 d6 BIT $d600 
2b93 : 10 fb __ BPL $2b90 ; (main.l7442 + 0)
.s337:
2b95 : 8e 01 d6 STX $d601 
2b98 : a9 1f __ LDA #$1f
2b9a : 8d 00 d6 STA $d600 
.l7444:
2b9d : 2c 00 d6 BIT $d600 
2ba0 : 10 fb __ BPL $2b9d ; (main.l7444 + 0)
.s341:
2ba2 : a5 44 __ LDA T4 + 0 
2ba4 : 8d 01 d6 STA $d601 
2ba7 : a9 18 __ LDA #$18
2ba9 : 8d 00 d6 STA $d600 
.l7446:
2bac : 2c 00 d6 BIT $d600 
2baf : 10 fb __ BPL $2bac ; (main.l7446 + 0)
.s347:
2bb1 : ad 01 d6 LDA $d601 
2bb4 : 29 7f __ AND #$7f
2bb6 : aa __ __ TAX
2bb7 : a9 18 __ LDA #$18
2bb9 : 8d 00 d6 STA $d600 
.l7448:
2bbc : 2c 00 d6 BIT $d600 
2bbf : 10 fb __ BPL $2bbc ; (main.l7448 + 0)
.s353:
2bc1 : 8e 01 d6 STX $d601 
2bc4 : a9 1e __ LDA #$1e
2bc6 : 8d 00 d6 STA $d600 
.l7450:
2bc9 : 2c 00 d6 BIT $d600 
2bcc : 10 fb __ BPL $2bc9 ; (main.l7450 + 0)
.s358:
2bce : a5 4b __ LDA T8 + 0 
2bd0 : 8d 01 d6 STA $d601 
2bd3 : e6 43 __ INC T2 + 0 
2bd5 : 4c e2 1e JMP $1ee2 ; (main.l286 + 0)
.s100:
2bd8 : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
2bdb : 85 1b __ STA ACCU + 0 
2bdd : ad d2 3b LDA $3bd2 ; (vdc_state + 4)
2be0 : 85 1c __ STA ACCU + 1 
2be2 : ad d5 3b LDA $3bd5 ; (vdc_state + 7)
2be5 : 85 44 __ STA T4 + 0 
2be7 : a9 12 __ LDA #$12
2be9 : 8d 00 d6 STA $d600 
2bec : a6 54 __ LDX T3 + 0 
2bee : ca __ __ DEX
2bef : 86 4b __ STX T8 + 0 
2bf1 : a5 43 __ LDA T2 + 0 
2bf3 : 20 91 3a JSR $3a91 ; (mul16by8 + 0)
2bf6 : 18 __ __ CLC
2bf7 : a5 05 __ LDA WORK + 2 
2bf9 : 6d d6 3b ADC $3bd6 ; (vdc_state + 8)
2bfc : aa __ __ TAX
2bfd : a5 06 __ LDA WORK + 3 
2bff : 6d d7 3b ADC $3bd7 ; (vdc_state + 9)
.l7086:
2c02 : 2c 00 d6 BIT $d600 
2c05 : 10 fb __ BPL $2c02 ; (main.l7086 + 0)
.s112:
2c07 : 8d 01 d6 STA $d601 
2c0a : a9 13 __ LDA #$13
2c0c : 8d 00 d6 STA $d600 
.l7088:
2c0f : 2c 00 d6 BIT $d600 
2c12 : 10 fb __ BPL $2c0f ; (main.l7088 + 0)
.s117:
2c14 : 8e 01 d6 STX $d601 
2c17 : a9 1f __ LDA #$1f
2c19 : 8d 00 d6 STA $d600 
.l7090:
2c1c : 2c 00 d6 BIT $d600 
2c1f : 10 fb __ BPL $2c1c ; (main.l7090 + 0)
.s121:
2c21 : a9 20 __ LDA #$20
2c23 : 8d 01 d6 STA $d601 
2c26 : a9 18 __ LDA #$18
2c28 : 8d 00 d6 STA $d600 
.l7092:
2c2b : 2c 00 d6 BIT $d600 
2c2e : 10 fb __ BPL $2c2b ; (main.l7092 + 0)
.s127:
2c30 : ad 01 d6 LDA $d601 
2c33 : 29 7f __ AND #$7f
2c35 : aa __ __ TAX
2c36 : a9 18 __ LDA #$18
2c38 : 8d 00 d6 STA $d600 
.l7094:
2c3b : 2c 00 d6 BIT $d600 
2c3e : 10 fb __ BPL $2c3b ; (main.l7094 + 0)
.s133:
2c40 : 8e 01 d6 STX $d601 
2c43 : a9 1e __ LDA #$1e
2c45 : 8d 00 d6 STA $d600 
.l7096:
2c48 : 2c 00 d6 BIT $d600 
2c4b : 10 fb __ BPL $2c48 ; (main.l7096 + 0)
.s138:
2c4d : a5 4b __ LDA T8 + 0 
2c4f : 8d 01 d6 STA $d601 
2c52 : ad d8 3b LDA $3bd8 ; (vdc_state + 10)
2c55 : 18 __ __ CLC
2c56 : 65 05 __ ADC WORK + 2 
2c58 : aa __ __ TAX
2c59 : a9 12 __ LDA #$12
2c5b : 8d 00 d6 STA $d600 
2c5e : ad d9 3b LDA $3bd9 ; (vdc_state + 11)
2c61 : 65 06 __ ADC WORK + 3 
.l7098:
2c63 : 2c 00 d6 BIT $d600 
2c66 : 10 fb __ BPL $2c63 ; (main.l7098 + 0)
.s145:
2c68 : 8d 01 d6 STA $d601 
2c6b : a9 13 __ LDA #$13
2c6d : 8d 00 d6 STA $d600 
.l7100:
2c70 : 2c 00 d6 BIT $d600 
2c73 : 10 fb __ BPL $2c70 ; (main.l7100 + 0)
.s150:
2c75 : 8e 01 d6 STX $d601 
2c78 : a9 1f __ LDA #$1f
2c7a : 8d 00 d6 STA $d600 
.l7102:
2c7d : 2c 00 d6 BIT $d600 
2c80 : 10 fb __ BPL $2c7d ; (main.l7102 + 0)
.s154:
2c82 : a5 44 __ LDA T4 + 0 
2c84 : 8d 01 d6 STA $d601 
2c87 : a9 18 __ LDA #$18
2c89 : 8d 00 d6 STA $d600 
.l7104:
2c8c : 2c 00 d6 BIT $d600 
2c8f : 10 fb __ BPL $2c8c ; (main.l7104 + 0)
.s160:
2c91 : ad 01 d6 LDA $d601 
2c94 : 29 7f __ AND #$7f
2c96 : aa __ __ TAX
2c97 : a9 18 __ LDA #$18
2c99 : 8d 00 d6 STA $d600 
.l7106:
2c9c : 2c 00 d6 BIT $d600 
2c9f : 10 fb __ BPL $2c9c ; (main.l7106 + 0)
.s166:
2ca1 : 8e 01 d6 STX $d601 
2ca4 : a9 1e __ LDA #$1e
2ca6 : 8d 00 d6 STA $d600 
.l7108:
2ca9 : 2c 00 d6 BIT $d600 
2cac : 10 fb __ BPL $2ca9 ; (main.l7108 + 0)
.s171:
2cae : a5 4b __ LDA T8 + 0 
2cb0 : 8d 01 d6 STA $d601 
2cb3 : e6 43 __ INC T2 + 0 
2cb5 : 4c a8 1d JMP $1da8 ; (main.l99 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
2cb8 : a2 03 __ LDX #$03
2cba : b5 53 __ LDA T8 + 0,x 
2cbc : 9d b2 bf STA $bfb2,x ; (printf@stack + 0)
2cbf : ca __ __ DEX
2cc0 : 10 f8 __ BPL $2cba ; (printf.s1000 + 2)
.s0:
2cc2 : 18 __ __ CLC
2cc3 : a5 23 __ LDA SP + 0 
2cc5 : 69 04 __ ADC #$04
2cc7 : 85 47 __ STA T0 + 0 
2cc9 : a5 24 __ LDA SP + 1 
2ccb : 69 00 __ ADC #$00
2ccd : 85 48 __ STA T0 + 1 
2ccf : a9 00 __ LDA #$00
2cd1 : 85 49 __ STA T2 + 0 
2cd3 : a0 02 __ LDY #$02
2cd5 : b1 23 __ LDA (SP + 0),y 
2cd7 : 85 4a __ STA T3 + 0 
2cd9 : c8 __ __ INY
2cda : b1 23 __ LDA (SP + 0),y 
2cdc : 85 4b __ STA T3 + 1 
.l2:
2cde : a0 00 __ LDY #$00
2ce0 : b1 4a __ LDA (T3 + 0),y 
2ce2 : d0 1e __ BNE $2d02 ; (printf.s3 + 0)
.s4:
2ce4 : a6 49 __ LDX T2 + 0 
2ce6 : 9d be bf STA $bfbe,x ; (buff + 0)
2ce9 : 8a __ __ TXA
2cea : f0 0b __ BEQ $2cf7 ; (printf.s1001 + 0)
.s117:
2cec : a9 be __ LDA #$be
2cee : 85 0d __ STA P0 ; (fmt + 0)
2cf0 : a9 bf __ LDA #$bf
2cf2 : 85 0e __ STA P1 ; (fmt + 1)
2cf4 : 20 08 30 JSR $3008 ; (puts.s0 + 0)
.s1001:
2cf7 : a2 03 __ LDX #$03
2cf9 : bd b2 bf LDA $bfb2,x ; (printf@stack + 0)
2cfc : 95 53 __ STA T8 + 0,x 
2cfe : ca __ __ DEX
2cff : 10 f8 __ BPL $2cf9 ; (printf.s1001 + 2)
2d01 : 60 __ __ RTS
.s3:
2d02 : c9 25 __ CMP #$25
2d04 : f0 28 __ BEQ $2d2e ; (printf.s5 + 0)
.s6:
2d06 : a6 49 __ LDX T2 + 0 
2d08 : 9d be bf STA $bfbe,x ; (buff + 0)
2d0b : e6 4a __ INC T3 + 0 
2d0d : d0 02 __ BNE $2d11 ; (printf.s1098 + 0)
.s1097:
2d0f : e6 4b __ INC T3 + 1 
.s1098:
2d11 : e8 __ __ INX
2d12 : 86 49 __ STX T2 + 0 
2d14 : e0 28 __ CPX #$28
2d16 : 90 c6 __ BCC $2cde ; (printf.l2 + 0)
.s111:
2d18 : a9 be __ LDA #$be
2d1a : 85 0d __ STA P0 ; (fmt + 0)
2d1c : a9 bf __ LDA #$bf
2d1e : 85 0e __ STA P1 ; (fmt + 1)
2d20 : 98 __ __ TYA
2d21 : 9d be bf STA $bfbe,x ; (buff + 0)
2d24 : 20 08 30 JSR $3008 ; (puts.s0 + 0)
2d27 : a9 00 __ LDA #$00
.s1068:
2d29 : 85 49 __ STA T2 + 0 
2d2b : 4c de 2c JMP $2cde ; (printf.l2 + 0)
.s5:
2d2e : a5 49 __ LDA T2 + 0 
2d30 : f0 15 __ BEQ $2d47 ; (printf.s10 + 0)
.s8:
2d32 : a9 be __ LDA #$be
2d34 : 85 0d __ STA P0 ; (fmt + 0)
2d36 : a9 bf __ LDA #$bf
2d38 : 85 0e __ STA P1 ; (fmt + 1)
2d3a : 98 __ __ TYA
2d3b : a6 49 __ LDX T2 + 0 
2d3d : 9d be bf STA $bfbe,x ; (buff + 0)
2d40 : 20 08 30 JSR $3008 ; (puts.s0 + 0)
2d43 : a9 00 __ LDA #$00
2d45 : 85 49 __ STA T2 + 0 
.s10:
2d47 : a9 0a __ LDA #$0a
2d49 : 8d b9 bf STA $bfb9 ; (si + 3)
2d4c : a9 00 __ LDA #$00
2d4e : 8d ba bf STA $bfba ; (si + 4)
2d51 : 8d bb bf STA $bfbb ; (si + 5)
2d54 : 8d bc bf STA $bfbc ; (si + 6)
2d57 : 8d bd bf STA $bfbd ; (si + 7)
2d5a : a0 01 __ LDY #$01
2d5c : b1 4a __ LDA (T3 + 0),y 
2d5e : aa __ __ TAX
2d5f : a9 20 __ LDA #$20
2d61 : 8d b6 bf STA $bfb6 ; (si + 0)
2d64 : a9 00 __ LDA #$00
2d66 : 8d b7 bf STA $bfb7 ; (si + 1)
2d69 : a9 ff __ LDA #$ff
2d6b : 8d b8 bf STA $bfb8 ; (si + 2)
2d6e : 18 __ __ CLC
2d6f : a5 4a __ LDA T3 + 0 
2d71 : 69 02 __ ADC #$02
.l15:
2d73 : 85 4a __ STA T3 + 0 
2d75 : 90 02 __ BCC $2d79 ; (printf.s1080 + 0)
.s1079:
2d77 : e6 4b __ INC T3 + 1 
.s1080:
2d79 : 8a __ __ TXA
2d7a : e0 2b __ CPX #$2b
2d7c : d0 08 __ BNE $2d86 ; (printf.s18 + 0)
.s17:
2d7e : a9 01 __ LDA #$01
2d80 : 8d bb bf STA $bfbb ; (si + 5)
2d83 : 4c fb 2f JMP $2ffb ; (printf.s246 + 0)
.s18:
2d86 : c9 30 __ CMP #$30
2d88 : d0 06 __ BNE $2d90 ; (printf.s21 + 0)
.s20:
2d8a : 8d b6 bf STA $bfb6 ; (si + 0)
2d8d : 4c fb 2f JMP $2ffb ; (printf.s246 + 0)
.s21:
2d90 : e0 23 __ CPX #$23
2d92 : d0 08 __ BNE $2d9c ; (printf.s24 + 0)
.s23:
2d94 : a9 01 __ LDA #$01
2d96 : 8d bd bf STA $bfbd ; (si + 7)
2d99 : 4c fb 2f JMP $2ffb ; (printf.s246 + 0)
.s24:
2d9c : e0 2d __ CPX #$2d
2d9e : d0 08 __ BNE $2da8 ; (printf.s16 + 0)
.s26:
2da0 : a9 01 __ LDA #$01
2da2 : 8d bc bf STA $bfbc ; (si + 6)
2da5 : 4c fb 2f JMP $2ffb ; (printf.s246 + 0)
.s16:
2da8 : 85 4c __ STA T4 + 0 
2daa : e0 30 __ CPX #$30
2dac : 90 53 __ BCC $2e01 ; (printf.s32 + 0)
.s33:
2dae : e0 3a __ CPX #$3a
2db0 : b0 4f __ BCS $2e01 ; (printf.s32 + 0)
.s30:
2db2 : a9 00 __ LDA #$00
2db4 : 85 4d __ STA T6 + 0 
2db6 : 85 4e __ STA T6 + 1 
2db8 : e0 3a __ CPX #$3a
2dba : b0 40 __ BCS $2dfc ; (printf.s36 + 0)
.l35:
2dbc : a5 4d __ LDA T6 + 0 
2dbe : 0a __ __ ASL
2dbf : 85 1b __ STA ACCU + 0 
2dc1 : a5 4e __ LDA T6 + 1 
2dc3 : 2a __ __ ROL
2dc4 : 06 1b __ ASL ACCU + 0 
2dc6 : 2a __ __ ROL
2dc7 : aa __ __ TAX
2dc8 : 18 __ __ CLC
2dc9 : a5 1b __ LDA ACCU + 0 
2dcb : 65 4d __ ADC T6 + 0 
2dcd : 85 4d __ STA T6 + 0 
2dcf : 8a __ __ TXA
2dd0 : 65 4e __ ADC T6 + 1 
2dd2 : 06 4d __ ASL T6 + 0 
2dd4 : 2a __ __ ROL
2dd5 : aa __ __ TAX
2dd6 : 18 __ __ CLC
2dd7 : a5 4d __ LDA T6 + 0 
2dd9 : 65 4c __ ADC T4 + 0 
2ddb : 90 01 __ BCC $2dde ; (printf.s1094 + 0)
.s1093:
2ddd : e8 __ __ INX
.s1094:
2dde : 38 __ __ SEC
2ddf : e9 30 __ SBC #$30
2de1 : 85 4d __ STA T6 + 0 
2de3 : 8a __ __ TXA
2de4 : e9 00 __ SBC #$00
2de6 : 85 4e __ STA T6 + 1 
2de8 : a0 00 __ LDY #$00
2dea : b1 4a __ LDA (T3 + 0),y 
2dec : 85 4c __ STA T4 + 0 
2dee : e6 4a __ INC T3 + 0 
2df0 : d0 02 __ BNE $2df4 ; (printf.s1096 + 0)
.s1095:
2df2 : e6 4b __ INC T3 + 1 
.s1096:
2df4 : c9 30 __ CMP #$30
2df6 : 90 04 __ BCC $2dfc ; (printf.s36 + 0)
.s37:
2df8 : c9 3a __ CMP #$3a
2dfa : 90 c0 __ BCC $2dbc ; (printf.l35 + 0)
.s36:
2dfc : a5 4d __ LDA T6 + 0 
2dfe : 8d b7 bf STA $bfb7 ; (si + 1)
.s32:
2e01 : a5 4c __ LDA T4 + 0 
2e03 : c9 2e __ CMP #$2e
2e05 : d0 51 __ BNE $2e58 ; (printf.s40 + 0)
.s38:
2e07 : a9 00 __ LDA #$00
2e09 : 85 4d __ STA T6 + 0 
.l231:
2e0b : 85 4e __ STA T6 + 1 
2e0d : a0 00 __ LDY #$00
2e0f : b1 4a __ LDA (T3 + 0),y 
2e11 : 85 4c __ STA T4 + 0 
2e13 : e6 4a __ INC T3 + 0 
2e15 : d0 02 __ BNE $2e19 ; (printf.s1082 + 0)
.s1081:
2e17 : e6 4b __ INC T3 + 1 
.s1082:
2e19 : c9 30 __ CMP #$30
2e1b : 90 04 __ BCC $2e21 ; (printf.s43 + 0)
.s44:
2e1d : c9 3a __ CMP #$3a
2e1f : 90 0a __ BCC $2e2b ; (printf.s42 + 0)
.s43:
2e21 : a5 4d __ LDA T6 + 0 
2e23 : 8d b8 bf STA $bfb8 ; (si + 2)
2e26 : a5 4c __ LDA T4 + 0 
2e28 : 4c 58 2e JMP $2e58 ; (printf.s40 + 0)
.s42:
2e2b : a5 4d __ LDA T6 + 0 
2e2d : 0a __ __ ASL
2e2e : 85 1b __ STA ACCU + 0 
2e30 : a5 4e __ LDA T6 + 1 
2e32 : 2a __ __ ROL
2e33 : 06 1b __ ASL ACCU + 0 
2e35 : 2a __ __ ROL
2e36 : aa __ __ TAX
2e37 : 18 __ __ CLC
2e38 : a5 1b __ LDA ACCU + 0 
2e3a : 65 4d __ ADC T6 + 0 
2e3c : 85 4d __ STA T6 + 0 
2e3e : 8a __ __ TXA
2e3f : 65 4e __ ADC T6 + 1 
2e41 : 06 4d __ ASL T6 + 0 
2e43 : 2a __ __ ROL
2e44 : aa __ __ TAX
2e45 : 18 __ __ CLC
2e46 : a5 4d __ LDA T6 + 0 
2e48 : 65 4c __ ADC T4 + 0 
2e4a : 90 01 __ BCC $2e4d ; (printf.s1092 + 0)
.s1091:
2e4c : e8 __ __ INX
.s1092:
2e4d : 38 __ __ SEC
2e4e : e9 30 __ SBC #$30
2e50 : 85 4d __ STA T6 + 0 
2e52 : 8a __ __ TXA
2e53 : e9 00 __ SBC #$00
2e55 : 4c 0b 2e JMP $2e0b ; (printf.l231 + 0)
.s40:
2e58 : c9 64 __ CMP #$64
2e5a : f0 04 __ BEQ $2e60 ; (printf.s45 + 0)
.s48:
2e5c : c9 44 __ CMP #$44
2e5e : d0 05 __ BNE $2e65 ; (printf.s46 + 0)
.s45:
2e60 : a9 01 __ LDA #$01
2e62 : 4c d4 2f JMP $2fd4 ; (printf.s247 + 0)
.s46:
2e65 : c9 75 __ CMP #$75
2e67 : d0 03 __ BNE $2e6c ; (printf.s52 + 0)
2e69 : 4c d2 2f JMP $2fd2 ; (printf.s269 + 0)
.s52:
2e6c : c9 55 __ CMP #$55
2e6e : d0 03 __ BNE $2e73 ; (printf.s50 + 0)
2e70 : 4c d2 2f JMP $2fd2 ; (printf.s269 + 0)
.s50:
2e73 : c9 78 __ CMP #$78
2e75 : f0 04 __ BEQ $2e7b ; (printf.s53 + 0)
.s56:
2e77 : c9 58 __ CMP #$58
2e79 : d0 0d __ BNE $2e88 ; (printf.s54 + 0)
.s53:
2e7b : a9 10 __ LDA #$10
2e7d : 8d b9 bf STA $bfb9 ; (si + 3)
2e80 : a9 00 __ LDA #$00
2e82 : 8d ba bf STA $bfba ; (si + 4)
2e85 : 4c d2 2f JMP $2fd2 ; (printf.s269 + 0)
.s54:
2e88 : c9 6c __ CMP #$6c
2e8a : d0 03 __ BNE $2e8f ; (printf.s60 + 0)
2e8c : 4c 64 2f JMP $2f64 ; (printf.s57 + 0)
.s60:
2e8f : c9 4c __ CMP #$4c
2e91 : d0 03 __ BNE $2e96 ; (printf.s58 + 0)
2e93 : 4c 64 2f JMP $2f64 ; (printf.s57 + 0)
.s58:
2e96 : c9 73 __ CMP #$73
2e98 : f0 39 __ BEQ $2ed3 ; (printf.s73 + 0)
.s76:
2e9a : c9 53 __ CMP #$53
2e9c : f0 35 __ BEQ $2ed3 ; (printf.s73 + 0)
.s74:
2e9e : c9 63 __ CMP #$63
2ea0 : f0 15 __ BEQ $2eb7 ; (printf.s104 + 0)
.s107:
2ea2 : c9 43 __ CMP #$43
2ea4 : f0 11 __ BEQ $2eb7 ; (printf.s104 + 0)
.s105:
2ea6 : 09 00 __ ORA #$00
2ea8 : d0 03 __ BNE $2ead ; (printf.s108 + 0)
2eaa : 4c de 2c JMP $2cde ; (printf.l2 + 0)
.s108:
2ead : a6 49 __ LDX T2 + 0 
2eaf : 9d be bf STA $bfbe,x ; (buff + 0)
2eb2 : e6 49 __ INC T2 + 0 
2eb4 : 4c de 2c JMP $2cde ; (printf.l2 + 0)
.s104:
2eb7 : a0 00 __ LDY #$00
2eb9 : b1 47 __ LDA (T0 + 0),y 
2ebb : a6 49 __ LDX T2 + 0 
2ebd : 9d be bf STA $bfbe,x ; (buff + 0)
2ec0 : e6 49 __ INC T2 + 0 
.s244:
2ec2 : 18 __ __ CLC
2ec3 : a5 47 __ LDA T0 + 0 
2ec5 : 69 02 __ ADC #$02
2ec7 : 85 47 __ STA T0 + 0 
2ec9 : b0 03 __ BCS $2ece ; (printf.s1083 + 0)
2ecb : 4c de 2c JMP $2cde ; (printf.l2 + 0)
.s1083:
2ece : e6 48 __ INC T0 + 1 
2ed0 : 4c de 2c JMP $2cde ; (printf.l2 + 0)
.s73:
2ed3 : a0 00 __ LDY #$00
2ed5 : 84 4c __ STY T4 + 0 
2ed7 : b1 47 __ LDA (T0 + 0),y 
2ed9 : 85 4d __ STA T6 + 0 
2edb : c8 __ __ INY
2edc : b1 47 __ LDA (T0 + 0),y 
2ede : 85 4e __ STA T6 + 1 
2ee0 : 18 __ __ CLC
2ee1 : a5 47 __ LDA T0 + 0 
2ee3 : 69 02 __ ADC #$02
2ee5 : 85 47 __ STA T0 + 0 
2ee7 : 90 02 __ BCC $2eeb ; (printf.s1090 + 0)
.s1089:
2ee9 : e6 48 __ INC T0 + 1 
.s1090:
2eeb : ad b7 bf LDA $bfb7 ; (si + 1)
2eee : f0 0d __ BEQ $2efd ; (printf.s79 + 0)
.s1071:
2ef0 : a0 00 __ LDY #$00
2ef2 : b1 4d __ LDA (T6 + 0),y 
2ef4 : f0 05 __ BEQ $2efb ; (printf.s1072 + 0)
.l81:
2ef6 : c8 __ __ INY
2ef7 : b1 4d __ LDA (T6 + 0),y 
2ef9 : d0 fb __ BNE $2ef6 ; (printf.l81 + 0)
.s1072:
2efb : 84 4c __ STY T4 + 0 
.s79:
2efd : ad bc bf LDA $bfbc ; (si + 6)
2f00 : d0 1a __ BNE $2f1c ; (printf.s85 + 0)
.s1075:
2f02 : a4 4c __ LDY T4 + 0 
2f04 : cc b7 bf CPY $bfb7 ; (si + 1)
2f07 : a6 49 __ LDX T2 + 0 
2f09 : b0 0d __ BCS $2f18 ; (printf.s1076 + 0)
.l87:
2f0b : ad b6 bf LDA $bfb6 ; (si + 0)
2f0e : 9d be bf STA $bfbe,x ; (buff + 0)
2f11 : c8 __ __ INY
2f12 : cc b7 bf CPY $bfb7 ; (si + 1)
2f15 : e8 __ __ INX
2f16 : 90 f3 __ BCC $2f0b ; (printf.l87 + 0)
.s1076:
2f18 : 86 49 __ STX T2 + 0 
2f1a : 84 4c __ STY T4 + 0 
.s85:
2f1c : a5 49 __ LDA T2 + 0 
2f1e : f0 16 __ BEQ $2f36 ; (printf.s238 + 0)
.s92:
2f20 : a9 be __ LDA #$be
2f22 : 85 0d __ STA P0 ; (fmt + 0)
2f24 : a9 bf __ LDA #$bf
2f26 : 85 0e __ STA P1 ; (fmt + 1)
2f28 : a9 00 __ LDA #$00
2f2a : a6 49 __ LDX T2 + 0 
2f2c : 9d be bf STA $bfbe,x ; (buff + 0)
2f2f : 20 08 30 JSR $3008 ; (puts.s0 + 0)
2f32 : a9 00 __ LDA #$00
2f34 : 85 49 __ STA T2 + 0 
.s238:
2f36 : a5 4d __ LDA T6 + 0 
2f38 : 85 0d __ STA P0 ; (fmt + 0)
2f3a : a5 4e __ LDA T6 + 1 
2f3c : 85 0e __ STA P1 ; (fmt + 1)
2f3e : 20 08 30 JSR $3008 ; (puts.s0 + 0)
2f41 : ad bc bf LDA $bfbc ; (si + 6)
2f44 : d0 03 __ BNE $2f49 ; (printf.s1073 + 0)
2f46 : 4c de 2c JMP $2cde ; (printf.l2 + 0)
.s1073:
2f49 : a4 4c __ LDY T4 + 0 
2f4b : cc b7 bf CPY $bfb7 ; (si + 1)
2f4e : a2 00 __ LDX #$00
2f50 : b0 0d __ BCS $2f5f ; (printf.s1074 + 0)
.l102:
2f52 : ad b6 bf LDA $bfb6 ; (si + 0)
2f55 : 9d be bf STA $bfbe,x ; (buff + 0)
2f58 : c8 __ __ INY
2f59 : cc b7 bf CPY $bfb7 ; (si + 1)
2f5c : e8 __ __ INX
2f5d : 90 f3 __ BCC $2f52 ; (printf.l102 + 0)
.s1074:
2f5f : 86 49 __ STX T2 + 0 
2f61 : 4c de 2c JMP $2cde ; (printf.l2 + 0)
.s57:
2f64 : a0 00 __ LDY #$00
2f66 : b1 47 __ LDA (T0 + 0),y 
2f68 : 85 53 __ STA T8 + 0 
2f6a : c8 __ __ INY
2f6b : b1 47 __ LDA (T0 + 0),y 
2f6d : 85 54 __ STA T8 + 1 
2f6f : c8 __ __ INY
2f70 : b1 47 __ LDA (T0 + 0),y 
2f72 : 85 55 __ STA T8 + 2 
2f74 : c8 __ __ INY
2f75 : b1 47 __ LDA (T0 + 0),y 
2f77 : 85 56 __ STA T8 + 3 
2f79 : 18 __ __ CLC
2f7a : a5 47 __ LDA T0 + 0 
2f7c : 69 04 __ ADC #$04
2f7e : 85 47 __ STA T0 + 0 
2f80 : 90 02 __ BCC $2f84 ; (printf.s1086 + 0)
.s1085:
2f82 : e6 48 __ INC T0 + 1 
.s1086:
2f84 : a0 00 __ LDY #$00
2f86 : b1 4a __ LDA (T3 + 0),y 
2f88 : aa __ __ TAX
2f89 : e6 4a __ INC T3 + 0 
2f8b : d0 02 __ BNE $2f8f ; (printf.s1088 + 0)
.s1087:
2f8d : e6 4b __ INC T3 + 1 
.s1088:
2f8f : 8a __ __ TXA
2f90 : e0 64 __ CPX #$64
2f92 : f0 04 __ BEQ $2f98 ; (printf.s61 + 0)
.s64:
2f94 : c9 44 __ CMP #$44
2f96 : d0 04 __ BNE $2f9c ; (printf.s62 + 0)
.s61:
2f98 : a9 01 __ LDA #$01
2f9a : d0 1c __ BNE $2fb8 ; (printf.s245 + 0)
.s62:
2f9c : c9 75 __ CMP #$75
2f9e : f0 17 __ BEQ $2fb7 ; (printf.s268 + 0)
.s68:
2fa0 : c9 55 __ CMP #$55
2fa2 : f0 13 __ BEQ $2fb7 ; (printf.s268 + 0)
.s66:
2fa4 : c9 78 __ CMP #$78
2fa6 : f0 07 __ BEQ $2faf ; (printf.s69 + 0)
.s72:
2fa8 : c9 58 __ CMP #$58
2faa : f0 03 __ BEQ $2faf ; (printf.s69 + 0)
2fac : 4c de 2c JMP $2cde ; (printf.l2 + 0)
.s69:
2faf : 8c ba bf STY $bfba ; (si + 4)
2fb2 : a9 10 __ LDA #$10
2fb4 : 8d b9 bf STA $bfb9 ; (si + 3)
.s268:
2fb7 : 98 __ __ TYA
.s245:
2fb8 : 85 15 __ STA P8 
2fba : a9 be __ LDA #$be
2fbc : 85 0f __ STA P2 ; (fmt + 2)
2fbe : a9 bf __ LDA #$bf
2fc0 : 85 10 __ STA P3 ; (fmt + 3)
2fc2 : a9 b6 __ LDA #$b6
2fc4 : 85 0d __ STA P0 ; (fmt + 0)
2fc6 : a9 bf __ LDA #$bf
2fc8 : 85 0e __ STA P1 ; (fmt + 1)
2fca : 20 92 31 JSR $3192 ; (nforml@proxy + 0)
2fcd : a5 1b __ LDA ACCU + 0 
2fcf : 4c 29 2d JMP $2d29 ; (printf.s1068 + 0)
.s269:
2fd2 : a9 00 __ LDA #$00
.s247:
2fd4 : 85 13 __ STA P6 
2fd6 : a9 be __ LDA #$be
2fd8 : 85 0f __ STA P2 ; (fmt + 2)
2fda : a9 bf __ LDA #$bf
2fdc : 85 10 __ STA P3 ; (fmt + 3)
2fde : a0 00 __ LDY #$00
2fe0 : b1 47 __ LDA (T0 + 0),y 
2fe2 : 85 11 __ STA P4 
2fe4 : c8 __ __ INY
2fe5 : b1 47 __ LDA (T0 + 0),y 
2fe7 : 85 12 __ STA P5 
2fe9 : a9 b6 __ LDA #$b6
2feb : 85 0d __ STA P0 ; (fmt + 0)
2fed : a9 bf __ LDA #$bf
2fef : 85 0e __ STA P1 ; (fmt + 1)
2ff1 : 20 5d 30 JSR $305d ; (nformi.s0 + 0)
2ff4 : a5 1b __ LDA ACCU + 0 
2ff6 : 85 49 __ STA T2 + 0 
2ff8 : 4c c2 2e JMP $2ec2 ; (printf.s244 + 0)
.s246:
2ffb : a0 00 __ LDY #$00
2ffd : b1 4a __ LDA (T3 + 0),y 
2fff : aa __ __ TAX
3000 : 18 __ __ CLC
3001 : a5 4a __ LDA T3 + 0 
3003 : 69 01 __ ADC #$01
3005 : 4c 73 2d JMP $2d73 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
3008 : a0 00 __ LDY #$00
300a : b1 0d __ LDA (P0),y 
300c : f0 0b __ BEQ $3019 ; (puts.s1001 + 0)
300e : 20 1a 30 JSR $301a ; (putpch + 0)
3011 : e6 0d __ INC P0 
3013 : d0 f3 __ BNE $3008 ; (puts.s0 + 0)
3015 : e6 0e __ INC P1 
3017 : d0 ef __ BNE $3008 ; (puts.s0 + 0)
.s1001:
3019 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
301a : ae cd 3b LDX $3bcd ; (giocharmap + 0)
301d : e0 01 __ CPX #$01
301f : 90 26 __ BCC $3047 ; (putpch + 45)
3021 : c9 0a __ CMP #$0a
3023 : d0 02 __ BNE $3027 ; (putpch + 13)
3025 : a9 0d __ LDA #$0d
3027 : c9 09 __ CMP #$09
3029 : f0 1f __ BEQ $304a ; (putpch + 48)
302b : e0 02 __ CPX #$02
302d : 90 18 __ BCC $3047 ; (putpch + 45)
302f : c9 41 __ CMP #$41
3031 : 90 14 __ BCC $3047 ; (putpch + 45)
3033 : c9 7b __ CMP #$7b
3035 : b0 10 __ BCS $3047 ; (putpch + 45)
3037 : c9 61 __ CMP #$61
3039 : b0 04 __ BCS $303f ; (putpch + 37)
303b : c9 5b __ CMP #$5b
303d : b0 08 __ BCS $3047 ; (putpch + 45)
303f : 49 20 __ EOR #$20
3041 : e0 03 __ CPX #$03
3043 : f0 02 __ BEQ $3047 ; (putpch + 45)
3045 : 29 df __ AND #$df
3047 : 4c d2 ff JMP $ffd2 
304a : 38 __ __ SEC
304b : 20 f0 ff JSR $fff0 
304e : 98 __ __ TYA
304f : 29 03 __ AND #$03
3051 : 49 03 __ EOR #$03
3053 : aa __ __ TAX
3054 : a9 20 __ LDA #$20
3056 : 20 d2 ff JSR $ffd2 
3059 : ca __ __ DEX
305a : 10 fa __ BPL $3056 ; (putpch + 60)
305c : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
305d : a9 00 __ LDA #$00
305f : 85 43 __ STA T0 + 0 
3061 : a5 13 __ LDA P6 ; (s + 0)
3063 : f0 13 __ BEQ $3078 ; (nformi.s182 + 0)
.s4:
3065 : 24 12 __ BIT P5 ; (v + 1)
3067 : 10 0f __ BPL $3078 ; (nformi.s182 + 0)
.s1:
3069 : 38 __ __ SEC
306a : a9 00 __ LDA #$00
306c : e5 11 __ SBC P4 ; (v + 0)
306e : 85 11 __ STA P4 ; (v + 0)
3070 : a9 00 __ LDA #$00
3072 : e5 12 __ SBC P5 ; (v + 1)
3074 : 85 12 __ STA P5 ; (v + 1)
3076 : e6 43 __ INC T0 + 0 
.s182:
3078 : a9 10 __ LDA #$10
307a : 85 44 __ STA T2 + 0 
307c : a5 11 __ LDA P4 ; (v + 0)
307e : 05 12 __ ORA P5 ; (v + 1)
3080 : f0 46 __ BEQ $30c8 ; (nformi.s7 + 0)
.s42:
3082 : a0 03 __ LDY #$03
3084 : b1 0d __ LDA (P0),y ; (si + 0)
3086 : 85 45 __ STA T4 + 0 
3088 : c8 __ __ INY
3089 : b1 0d __ LDA (P0),y ; (si + 0)
308b : 85 46 __ STA T4 + 1 
.l6:
308d : a5 11 __ LDA P4 ; (v + 0)
308f : 85 1b __ STA ACCU + 0 
3091 : a5 12 __ LDA P5 ; (v + 1)
3093 : 85 1c __ STA ACCU + 1 
3095 : a5 45 __ LDA T4 + 0 
3097 : 85 03 __ STA WORK + 0 
3099 : a5 46 __ LDA T4 + 1 
309b : 85 04 __ STA WORK + 1 
309d : 20 b1 3a JSR $3ab1 ; (divmod + 0)
30a0 : a5 06 __ LDA WORK + 3 
30a2 : 30 08 __ BMI $30ac ; (nformi.s78 + 0)
.s1019:
30a4 : d0 0a __ BNE $30b0 ; (nformi.s77 + 0)
.s1018:
30a6 : a5 05 __ LDA WORK + 2 
30a8 : c9 0a __ CMP #$0a
30aa : b0 04 __ BCS $30b0 ; (nformi.s77 + 0)
.s78:
30ac : a9 30 __ LDA #$30
30ae : d0 02 __ BNE $30b2 ; (nformi.s79 + 0)
.s77:
30b0 : a9 37 __ LDA #$37
.s79:
30b2 : 18 __ __ CLC
30b3 : 65 05 __ ADC WORK + 2 
30b5 : c6 44 __ DEC T2 + 0 
30b7 : a6 44 __ LDX T2 + 0 
30b9 : 9d f0 bf STA $bff0,x ; (buffer + 0)
30bc : a5 1b __ LDA ACCU + 0 
30be : 85 11 __ STA P4 ; (v + 0)
30c0 : a5 1c __ LDA ACCU + 1 
30c2 : 85 12 __ STA P5 ; (v + 1)
30c4 : 05 11 __ ORA P4 ; (v + 0)
30c6 : d0 c5 __ BNE $308d ; (nformi.l6 + 0)
.s7:
30c8 : a0 02 __ LDY #$02
30ca : b1 0d __ LDA (P0),y ; (si + 0)
30cc : c9 ff __ CMP #$ff
30ce : d0 04 __ BNE $30d4 ; (nformi.s80 + 0)
.s81:
30d0 : a9 0f __ LDA #$0f
30d2 : d0 05 __ BNE $30d9 ; (nformi.s1026 + 0)
.s80:
30d4 : 38 __ __ SEC
30d5 : a9 10 __ LDA #$10
30d7 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
30d9 : a8 __ __ TAY
30da : c4 44 __ CPY T2 + 0 
30dc : b0 0d __ BCS $30eb ; (nformi.s10 + 0)
.s9:
30de : a9 30 __ LDA #$30
.l1027:
30e0 : c6 44 __ DEC T2 + 0 
30e2 : a6 44 __ LDX T2 + 0 
30e4 : 9d f0 bf STA $bff0,x ; (buffer + 0)
30e7 : c4 44 __ CPY T2 + 0 
30e9 : 90 f5 __ BCC $30e0 ; (nformi.l1027 + 0)
.s10:
30eb : a0 07 __ LDY #$07
30ed : b1 0d __ LDA (P0),y ; (si + 0)
30ef : f0 20 __ BEQ $3111 ; (nformi.s13 + 0)
.s14:
30f1 : a0 04 __ LDY #$04
30f3 : b1 0d __ LDA (P0),y ; (si + 0)
30f5 : d0 1a __ BNE $3111 ; (nformi.s13 + 0)
.s1013:
30f7 : 88 __ __ DEY
30f8 : b1 0d __ LDA (P0),y ; (si + 0)
30fa : c9 10 __ CMP #$10
30fc : d0 13 __ BNE $3111 ; (nformi.s13 + 0)
.s11:
30fe : a9 58 __ LDA #$58
3100 : a6 44 __ LDX T2 + 0 
3102 : 9d ef bf STA $bfef,x ; (buff + 49)
3105 : 8a __ __ TXA
3106 : 18 __ __ CLC
3107 : 69 fe __ ADC #$fe
3109 : 85 44 __ STA T2 + 0 
310b : aa __ __ TAX
310c : a9 30 __ LDA #$30
310e : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
3111 : a9 00 __ LDA #$00
3113 : 85 1b __ STA ACCU + 0 
3115 : a5 43 __ LDA T0 + 0 
3117 : f0 06 __ BEQ $311f ; (nformi.s16 + 0)
.s15:
3119 : c6 44 __ DEC T2 + 0 
311b : a9 2d __ LDA #$2d
311d : d0 0a __ BNE $3129 ; (nformi.s1025 + 0)
.s16:
311f : a0 05 __ LDY #$05
3121 : b1 0d __ LDA (P0),y ; (si + 0)
3123 : f0 09 __ BEQ $312e ; (nformi.s163 + 0)
.s18:
3125 : c6 44 __ DEC T2 + 0 
3127 : a9 2b __ LDA #$2b
.s1025:
3129 : a6 44 __ LDX T2 + 0 
312b : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
312e : a0 06 __ LDY #$06
3130 : b1 0d __ LDA (P0),y ; (si + 0)
3132 : d0 33 __ BNE $3167 ; (nformi.s24 + 0)
.l30:
3134 : a0 01 __ LDY #$01
3136 : b1 0d __ LDA (P0),y ; (si + 0)
3138 : 18 __ __ CLC
3139 : 65 44 __ ADC T2 + 0 
313b : b0 04 __ BCS $3141 ; (nformi.s31 + 0)
.s1006:
313d : c9 11 __ CMP #$11
313f : 90 0d __ BCC $314e ; (nformi.s33 + 0)
.s31:
3141 : c6 44 __ DEC T2 + 0 
3143 : a0 00 __ LDY #$00
3145 : b1 0d __ LDA (P0),y ; (si + 0)
3147 : a6 44 __ LDX T2 + 0 
3149 : 9d f0 bf STA $bff0,x ; (buffer + 0)
314c : b0 e6 __ BCS $3134 ; (nformi.l30 + 0)
.s33:
314e : a6 44 __ LDX T2 + 0 
3150 : e0 10 __ CPX #$10
3152 : b0 0e __ BCS $3162 ; (nformi.s23 + 0)
.s34:
3154 : 88 __ __ DEY
.l1022:
3155 : bd f0 bf LDA $bff0,x ; (buffer + 0)
3158 : 91 0f __ STA (P2),y ; (str + 0)
315a : e8 __ __ INX
315b : e0 10 __ CPX #$10
315d : c8 __ __ INY
315e : 90 f5 __ BCC $3155 ; (nformi.l1022 + 0)
.s1023:
3160 : 84 1b __ STY ACCU + 0 
.s23:
3162 : a9 00 __ LDA #$00
3164 : 85 1c __ STA ACCU + 1 
.s1001:
3166 : 60 __ __ RTS
.s24:
3167 : a6 44 __ LDX T2 + 0 
3169 : e0 10 __ CPX #$10
316b : b0 1a __ BCS $3187 ; (nformi.l27 + 0)
.s25:
316d : a0 00 __ LDY #$00
.l1020:
316f : bd f0 bf LDA $bff0,x ; (buffer + 0)
3172 : 91 0f __ STA (P2),y ; (str + 0)
3174 : e8 __ __ INX
3175 : e0 10 __ CPX #$10
3177 : c8 __ __ INY
3178 : 90 f5 __ BCC $316f ; (nformi.l1020 + 0)
.s1021:
317a : 84 1b __ STY ACCU + 0 
317c : b0 09 __ BCS $3187 ; (nformi.l27 + 0)
.s28:
317e : 88 __ __ DEY
317f : b1 0d __ LDA (P0),y ; (si + 0)
3181 : a4 1b __ LDY ACCU + 0 
3183 : 91 0f __ STA (P2),y ; (str + 0)
3185 : e6 1b __ INC ACCU + 0 
.l27:
3187 : a5 1b __ LDA ACCU + 0 
3189 : a0 01 __ LDY #$01
318b : d1 0d __ CMP (P0),y ; (si + 0)
318d : 90 ef __ BCC $317e ; (nformi.s28 + 0)
318f : 4c 62 31 JMP $3162 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml@proxy: ; nforml@proxy
3192 : a5 53 __ LDA $53 
3194 : 85 11 __ STA P4 
3196 : a5 54 __ LDA $54 
3198 : 85 12 __ STA P5 
319a : a5 55 __ LDA $55 
319c : 85 13 __ STA P6 
319e : a5 56 __ LDA $56 
31a0 : 85 14 __ STA P7 
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
31a2 : a9 00 __ LDA #$00
31a4 : 85 43 __ STA T0 + 0 
31a6 : a5 15 __ LDA P8 ; (s + 0)
31a8 : f0 21 __ BEQ $31cb ; (nforml.s182 + 0)
.s4:
31aa : a5 14 __ LDA P7 ; (v + 3)
31ac : f0 1d __ BEQ $31cb ; (nforml.s182 + 0)
.s1032:
31ae : 10 1b __ BPL $31cb ; (nforml.s182 + 0)
.s1:
31b0 : 38 __ __ SEC
31b1 : a9 00 __ LDA #$00
31b3 : e5 11 __ SBC P4 ; (v + 0)
31b5 : 85 11 __ STA P4 ; (v + 0)
31b7 : a9 00 __ LDA #$00
31b9 : e5 12 __ SBC P5 ; (v + 1)
31bb : 85 12 __ STA P5 ; (v + 1)
31bd : a9 00 __ LDA #$00
31bf : e5 13 __ SBC P6 ; (v + 2)
31c1 : 85 13 __ STA P6 ; (v + 2)
31c3 : a9 00 __ LDA #$00
31c5 : e5 14 __ SBC P7 ; (v + 3)
31c7 : 85 14 __ STA P7 ; (v + 3)
31c9 : e6 43 __ INC T0 + 0 
.s182:
31cb : a9 10 __ LDA #$10
31cd : 85 44 __ STA T2 + 0 
31cf : a5 14 __ LDA P7 ; (v + 3)
31d1 : d0 0c __ BNE $31df ; (nforml.s42 + 0)
.s1024:
31d3 : a5 13 __ LDA P6 ; (v + 2)
31d5 : d0 08 __ BNE $31df ; (nforml.s42 + 0)
.s1025:
31d7 : a5 12 __ LDA P5 ; (v + 1)
31d9 : d0 04 __ BNE $31df ; (nforml.s42 + 0)
.s1026:
31db : c5 11 __ CMP P4 ; (v + 0)
31dd : b0 0e __ BCS $31ed ; (nforml.s7 + 0)
.s42:
31df : a0 03 __ LDY #$03
31e1 : b1 0d __ LDA (P0),y ; (si + 0)
31e3 : 85 45 __ STA T5 + 0 
31e5 : c8 __ __ INY
31e6 : b1 0d __ LDA (P0),y ; (si + 0)
31e8 : 85 46 __ STA T5 + 1 
31ea : 4c b7 32 JMP $32b7 ; (nforml.l6 + 0)
.s7:
31ed : a0 02 __ LDY #$02
31ef : b1 0d __ LDA (P0),y ; (si + 0)
31f1 : c9 ff __ CMP #$ff
31f3 : d0 04 __ BNE $31f9 ; (nforml.s80 + 0)
.s81:
31f5 : a9 0f __ LDA #$0f
31f7 : d0 05 __ BNE $31fe ; (nforml.s1039 + 0)
.s80:
31f9 : 38 __ __ SEC
31fa : a9 10 __ LDA #$10
31fc : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
31fe : a8 __ __ TAY
31ff : c4 44 __ CPY T2 + 0 
3201 : b0 0d __ BCS $3210 ; (nforml.s10 + 0)
.s9:
3203 : a9 30 __ LDA #$30
.l1040:
3205 : c6 44 __ DEC T2 + 0 
3207 : a6 44 __ LDX T2 + 0 
3209 : 9d f0 bf STA $bff0,x ; (buffer + 0)
320c : c4 44 __ CPY T2 + 0 
320e : 90 f5 __ BCC $3205 ; (nforml.l1040 + 0)
.s10:
3210 : a0 07 __ LDY #$07
3212 : b1 0d __ LDA (P0),y ; (si + 0)
3214 : f0 20 __ BEQ $3236 ; (nforml.s13 + 0)
.s14:
3216 : a0 04 __ LDY #$04
3218 : b1 0d __ LDA (P0),y ; (si + 0)
321a : d0 1a __ BNE $3236 ; (nforml.s13 + 0)
.s1013:
321c : 88 __ __ DEY
321d : b1 0d __ LDA (P0),y ; (si + 0)
321f : c9 10 __ CMP #$10
3221 : d0 13 __ BNE $3236 ; (nforml.s13 + 0)
.s11:
3223 : a9 58 __ LDA #$58
3225 : a6 44 __ LDX T2 + 0 
3227 : 9d ef bf STA $bfef,x ; (buff + 49)
322a : 8a __ __ TXA
322b : 18 __ __ CLC
322c : 69 fe __ ADC #$fe
322e : 85 44 __ STA T2 + 0 
3230 : aa __ __ TAX
3231 : a9 30 __ LDA #$30
3233 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
3236 : a9 00 __ LDA #$00
3238 : 85 1b __ STA ACCU + 0 
323a : a5 43 __ LDA T0 + 0 
323c : f0 06 __ BEQ $3244 ; (nforml.s16 + 0)
.s15:
323e : c6 44 __ DEC T2 + 0 
3240 : a9 2d __ LDA #$2d
3242 : d0 0a __ BNE $324e ; (nforml.s1038 + 0)
.s16:
3244 : a0 05 __ LDY #$05
3246 : b1 0d __ LDA (P0),y ; (si + 0)
3248 : f0 09 __ BEQ $3253 ; (nforml.s163 + 0)
.s18:
324a : c6 44 __ DEC T2 + 0 
324c : a9 2b __ LDA #$2b
.s1038:
324e : a6 44 __ LDX T2 + 0 
3250 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
3253 : a0 06 __ LDY #$06
3255 : b1 0d __ LDA (P0),y ; (si + 0)
3257 : d0 33 __ BNE $328c ; (nforml.s24 + 0)
.l30:
3259 : a0 01 __ LDY #$01
325b : b1 0d __ LDA (P0),y ; (si + 0)
325d : 18 __ __ CLC
325e : 65 44 __ ADC T2 + 0 
3260 : b0 04 __ BCS $3266 ; (nforml.s31 + 0)
.s1006:
3262 : c9 11 __ CMP #$11
3264 : 90 0d __ BCC $3273 ; (nforml.s33 + 0)
.s31:
3266 : c6 44 __ DEC T2 + 0 
3268 : a0 00 __ LDY #$00
326a : b1 0d __ LDA (P0),y ; (si + 0)
326c : a6 44 __ LDX T2 + 0 
326e : 9d f0 bf STA $bff0,x ; (buffer + 0)
3271 : b0 e6 __ BCS $3259 ; (nforml.l30 + 0)
.s33:
3273 : a6 44 __ LDX T2 + 0 
3275 : e0 10 __ CPX #$10
3277 : b0 0e __ BCS $3287 ; (nforml.s23 + 0)
.s34:
3279 : 88 __ __ DEY
.l1035:
327a : bd f0 bf LDA $bff0,x ; (buffer + 0)
327d : 91 0f __ STA (P2),y ; (str + 0)
327f : e8 __ __ INX
3280 : e0 10 __ CPX #$10
3282 : c8 __ __ INY
3283 : 90 f5 __ BCC $327a ; (nforml.l1035 + 0)
.s1036:
3285 : 84 1b __ STY ACCU + 0 
.s23:
3287 : a9 00 __ LDA #$00
3289 : 85 1c __ STA ACCU + 1 
.s1001:
328b : 60 __ __ RTS
.s24:
328c : a6 44 __ LDX T2 + 0 
328e : e0 10 __ CPX #$10
3290 : b0 1a __ BCS $32ac ; (nforml.l27 + 0)
.s25:
3292 : a0 00 __ LDY #$00
.l1033:
3294 : bd f0 bf LDA $bff0,x ; (buffer + 0)
3297 : 91 0f __ STA (P2),y ; (str + 0)
3299 : e8 __ __ INX
329a : e0 10 __ CPX #$10
329c : c8 __ __ INY
329d : 90 f5 __ BCC $3294 ; (nforml.l1033 + 0)
.s1034:
329f : 84 1b __ STY ACCU + 0 
32a1 : b0 09 __ BCS $32ac ; (nforml.l27 + 0)
.s28:
32a3 : 88 __ __ DEY
32a4 : b1 0d __ LDA (P0),y ; (si + 0)
32a6 : a4 1b __ LDY ACCU + 0 
32a8 : 91 0f __ STA (P2),y ; (str + 0)
32aa : e6 1b __ INC ACCU + 0 
.l27:
32ac : a5 1b __ LDA ACCU + 0 
32ae : a0 01 __ LDY #$01
32b0 : d1 0d __ CMP (P0),y ; (si + 0)
32b2 : 90 ef __ BCC $32a3 ; (nforml.s28 + 0)
32b4 : 4c 87 32 JMP $3287 ; (nforml.s23 + 0)
.l6:
32b7 : a5 11 __ LDA P4 ; (v + 0)
32b9 : 85 1b __ STA ACCU + 0 
32bb : a5 12 __ LDA P5 ; (v + 1)
32bd : 85 1c __ STA ACCU + 1 
32bf : a5 13 __ LDA P6 ; (v + 2)
32c1 : 85 1d __ STA ACCU + 2 
32c3 : a5 14 __ LDA P7 ; (v + 3)
32c5 : 85 1e __ STA ACCU + 3 
32c7 : a5 45 __ LDA T5 + 0 
32c9 : 85 03 __ STA WORK + 0 
32cb : a5 46 __ LDA T5 + 1 
32cd : 85 04 __ STA WORK + 1 
32cf : a9 00 __ LDA #$00
32d1 : 85 05 __ STA WORK + 2 
32d3 : 85 06 __ STA WORK + 3 
32d5 : 20 36 3b JSR $3b36 ; (divmod32 + 0)
32d8 : a5 08 __ LDA WORK + 5 
32da : 30 08 __ BMI $32e4 ; (nforml.s78 + 0)
.s1023:
32dc : d0 0a __ BNE $32e8 ; (nforml.s77 + 0)
.s1022:
32de : a5 07 __ LDA WORK + 4 
32e0 : c9 0a __ CMP #$0a
32e2 : b0 04 __ BCS $32e8 ; (nforml.s77 + 0)
.s78:
32e4 : a9 30 __ LDA #$30
32e6 : d0 02 __ BNE $32ea ; (nforml.s79 + 0)
.s77:
32e8 : a9 37 __ LDA #$37
.s79:
32ea : 18 __ __ CLC
32eb : 65 07 __ ADC WORK + 4 
32ed : c6 44 __ DEC T2 + 0 
32ef : a6 44 __ LDX T2 + 0 
32f1 : 9d f0 bf STA $bff0,x ; (buffer + 0)
32f4 : a5 1b __ LDA ACCU + 0 
32f6 : 85 11 __ STA P4 ; (v + 0)
32f8 : a5 1c __ LDA ACCU + 1 
32fa : 85 12 __ STA P5 ; (v + 1)
32fc : a5 1d __ LDA ACCU + 2 
32fe : 85 13 __ STA P6 ; (v + 2)
3300 : a5 1e __ LDA ACCU + 3 
3302 : 85 14 __ STA P7 ; (v + 3)
3304 : d0 b1 __ BNE $32b7 ; (nforml.l6 + 0)
.s1018:
3306 : a5 13 __ LDA P6 ; (v + 2)
3308 : d0 ad __ BNE $32b7 ; (nforml.l6 + 0)
.s1019:
330a : a5 12 __ LDA P5 ; (v + 1)
330c : d0 a9 __ BNE $32b7 ; (nforml.l6 + 0)
.s1020:
330e : c5 11 __ CMP P4 ; (v + 0)
3310 : 90 a5 __ BCC $32b7 ; (nforml.l6 + 0)
3312 : 4c ed 31 JMP $31ed ; (nforml.s7 + 0)
--------------------------------------------------------------------
3315 : __ __ __ BYT 73 77 69 74 63 68 20 74 6f 20 38 30 20 63 6f 6c : switch to 80 col
3325 : __ __ __ BYT 75 6d 6e 20 73 63 72 65 65 6e 0a 61 6e 64 20 70 : umn screen.and p
3335 : __ __ __ BYT 72 65 73 73 20 6b 65 79 2e 0a 00                : ress key...
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
3340 : 20 4e 33 JSR $334e ; (getpch + 0)
3343 : c9 00 __ CMP #$00
3345 : f0 f9 __ BEQ $3340 ; (getch.s0 + 0)
3347 : 85 1b __ STA ACCU + 0 
3349 : a9 00 __ LDA #$00
334b : 85 1c __ STA ACCU + 1 
.s1001:
334d : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
334e : 20 e4 ff JSR $ffe4 
3351 : ae cd 3b LDX $3bcd ; (giocharmap + 0)
3354 : e0 01 __ CPX #$01
3356 : 90 26 __ BCC $337e ; (getpch + 48)
3358 : c9 0d __ CMP #$0d
335a : d0 02 __ BNE $335e ; (getpch + 16)
335c : a9 0a __ LDA #$0a
335e : e0 02 __ CPX #$02
3360 : 90 1c __ BCC $337e ; (getpch + 48)
3362 : c9 db __ CMP #$db
3364 : b0 18 __ BCS $337e ; (getpch + 48)
3366 : c9 41 __ CMP #$41
3368 : 90 14 __ BCC $337e ; (getpch + 48)
336a : c9 c1 __ CMP #$c1
336c : 90 02 __ BCC $3370 ; (getpch + 34)
336e : 49 a0 __ EOR #$a0
3370 : c9 7b __ CMP #$7b
3372 : b0 0a __ BCS $337e ; (getpch + 48)
3374 : c9 61 __ CMP #$61
3376 : b0 04 __ BCS $337c ; (getpch + 46)
3378 : c9 5b __ CMP #$5b
337a : b0 02 __ BCS $337e ; (getpch + 48)
337c : 49 20 __ EOR #$20
337e : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
337f : 20 81 ff JSR $ff81 
.s1001:
3382 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
3383 : 24 d7 __ BIT $d7 
3385 : 30 03 __ BMI $338a ; (screen_setmode.s1001 + 0)
.s6:
3387 : 20 5f ff JSR $ff5f 
.s1001:
338a : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
338b : a2 04 __ LDX #$04
338d : b5 53 __ LDA T3 + 0,x 
338f : 9d ac bf STA $bfac,x ; (vdc_set_mode@stack + 0)
3392 : ca __ __ DEX
3393 : 10 f8 __ BPL $338d ; (vdc_set_mode.s1000 + 2)
3395 : 38 __ __ SEC
3396 : a5 23 __ LDA SP + 0 
3398 : e9 08 __ SBC #$08
339a : 85 23 __ STA SP + 0 
339c : b0 02 __ BCS $33a0 ; (vdc_set_mode.s0 + 0)
339e : c6 24 __ DEC SP + 1 
.s0:
33a0 : a9 00 __ LDA #$00
33a2 : 85 4f __ STA T0 + 0 
33a4 : 38 __ __ SEC
33a5 : e5 16 __ SBC P9 ; (mode + 0)
33a7 : 29 20 __ AND #$20
33a9 : 85 50 __ STA T2 + 0 
33ab : aa __ __ TAX
33ac : 18 __ __ CLC
33ad : 69 00 __ ADC #$00
33af : 85 53 __ STA T3 + 0 
33b1 : a9 3c __ LDA #$3c
33b3 : 69 00 __ ADC #$00
33b5 : 85 54 __ STA T3 + 1 
33b7 : bd 04 3c LDA $3c04,x ; (vdc_modes + 4)
33ba : f0 0a __ BEQ $33c6 ; (vdc_set_mode.s3 + 0)
.s4:
33bc : ad ce 3b LDA $3bce ; (vdc_state + 0)
33bf : c9 10 __ CMP #$10
33c1 : d0 03 __ BNE $33c6 ; (vdc_set_mode.s3 + 0)
33c3 : 4c 3d 36 JMP $363d ; (vdc_set_mode.s1001 + 0)
.s3:
33c6 : a0 00 __ LDY #$00
33c8 : b1 53 __ LDA (T3 + 0),y 
33ca : 8d d1 3b STA $3bd1 ; (vdc_state + 3)
33cd : c8 __ __ INY
33ce : b1 53 __ LDA (T3 + 0),y 
33d0 : 8d d2 3b STA $3bd2 ; (vdc_state + 4)
33d3 : c8 __ __ INY
33d4 : b1 53 __ LDA (T3 + 0),y 
33d6 : 8d d3 3b STA $3bd3 ; (vdc_state + 5)
33d9 : c8 __ __ INY
33da : b1 53 __ LDA (T3 + 0),y 
33dc : 8d d4 3b STA $3bd4 ; (vdc_state + 6)
33df : a0 09 __ LDY #$09
33e1 : b1 53 __ LDA (T3 + 0),y 
33e3 : 8d da 3b STA $3bda ; (vdc_state + 12)
33e6 : c8 __ __ INY
33e7 : b1 53 __ LDA (T3 + 0),y 
33e9 : 8d db 3b STA $3bdb ; (vdc_state + 13)
33ec : c8 __ __ INY
33ed : b1 53 __ LDA (T3 + 0),y 
33ef : 8d dc 3b STA $3bdc ; (vdc_state + 14)
33f2 : c8 __ __ INY
33f3 : b1 53 __ LDA (T3 + 0),y 
33f5 : 8d dd 3b STA $3bdd ; (vdc_state + 15)
33f8 : c8 __ __ INY
33f9 : b1 53 __ LDA (T3 + 0),y 
33fb : 8d de 3b STA $3bde ; (vdc_state + 16)
33fe : c8 __ __ INY
33ff : b1 53 __ LDA (T3 + 0),y 
3401 : 8d df 3b STA $3bdf ; (vdc_state + 17)
3404 : c8 __ __ INY
3405 : b1 53 __ LDA (T3 + 0),y 
3407 : 8d e0 3b STA $3be0 ; (vdc_state + 18)
340a : c8 __ __ INY
340b : b1 53 __ LDA (T3 + 0),y 
340d : 8d e1 3b STA $3be1 ; (vdc_state + 19)
3410 : c8 __ __ INY
3411 : b1 53 __ LDA (T3 + 0),y 
3413 : 8d e2 3b STA $3be2 ; (vdc_state + 20)
3416 : c8 __ __ INY
3417 : b1 53 __ LDA (T3 + 0),y 
3419 : 8d e3 3b STA $3be3 ; (vdc_state + 21)
341c : a0 05 __ LDY #$05
341e : b1 53 __ LDA (T3 + 0),y 
3420 : 85 55 __ STA T4 + 0 
3422 : c8 __ __ INY
3423 : b1 53 __ LDA (T3 + 0),y 
3425 : 8d d7 3b STA $3bd7 ; (vdc_state + 9)
3428 : 85 44 __ STA T6 + 0 
342a : a5 55 __ LDA T4 + 0 
342c : 8d d6 3b STA $3bd6 ; (vdc_state + 8)
342f : c8 __ __ INY
3430 : b1 53 __ LDA (T3 + 0),y 
3432 : 85 57 __ STA T5 + 0 
3434 : c8 __ __ INY
3435 : b1 53 __ LDA (T3 + 0),y 
3437 : 8d d9 3b STA $3bd9 ; (vdc_state + 11)
343a : a8 __ __ TAY
343b : a5 57 __ LDA T5 + 0 
343d : 8d d8 3b STA $3bd8 ; (vdc_state + 10)
3440 : a9 0c __ LDA #$0c
3442 : 8d 00 d6 STA $d600 
.l1139:
3445 : 2c 00 d6 BIT $d600 
3448 : 10 fb __ BPL $3445 ; (vdc_set_mode.l1139 + 0)
.s11:
344a : a5 44 __ LDA T6 + 0 
344c : 8d 01 d6 STA $d601 
344f : a9 0d __ LDA #$0d
3451 : 8d 00 d6 STA $d600 
.l1141:
3454 : 2c 00 d6 BIT $d600 
3457 : 10 fb __ BPL $3454 ; (vdc_set_mode.l1141 + 0)
.s16:
3459 : a5 55 __ LDA T4 + 0 
345b : 8d 01 d6 STA $d601 
345e : a9 14 __ LDA #$14
3460 : 8d 00 d6 STA $d600 
.l1143:
3463 : 2c 00 d6 BIT $d600 
3466 : 10 fb __ BPL $3463 ; (vdc_set_mode.l1143 + 0)
.s21:
3468 : 8c 01 d6 STY $d601 
346b : a9 15 __ LDA #$15
346d : 8d 00 d6 STA $d600 
.l1145:
3470 : 2c 00 d6 BIT $d600 
3473 : 10 fb __ BPL $3470 ; (vdc_set_mode.l1145 + 0)
.s26:
3475 : a5 57 __ LDA T5 + 0 
3477 : 8d 01 d6 STA $d601 
347a : bd 0e 3c LDA $3c0e,x ; (vdc_modes + 14)
347d : 85 56 __ STA T4 + 1 
347f : a9 1c __ LDA #$1c
3481 : 8d 00 d6 STA $d600 
.l1147:
3484 : 2c 00 d6 BIT $d600 
3487 : 10 fb __ BPL $3484 ; (vdc_set_mode.l1147 + 0)
.s32:
3489 : ad 01 d6 LDA $d601 
348c : 29 1f __ AND #$1f
348e : 85 57 __ STA T5 + 0 
3490 : a9 33 __ LDA #$33
3492 : a0 02 __ LDY #$02
3494 : 91 23 __ STA (SP + 0),y 
3496 : a9 37 __ LDA #$37
3498 : c8 __ __ INY
3499 : 91 23 __ STA (SP + 0),y 
349b : a9 1c __ LDA #$1c
349d : 8d 00 d6 STA $d600 
.l1149:
34a0 : 2c 00 d6 BIT $d600 
34a3 : 10 fb __ BPL $34a0 ; (vdc_set_mode.l1149 + 0)
.s39:
34a5 : ad 01 d6 LDA $d601 
34a8 : a0 04 __ LDY #$04
34aa : 91 23 __ STA (SP + 0),y 
34ac : a9 00 __ LDA #$00
34ae : c8 __ __ INY
34af : 91 23 __ STA (SP + 0),y 
34b1 : a5 57 __ LDA T5 + 0 
34b3 : c8 __ __ INY
34b4 : 91 23 __ STA (SP + 0),y 
34b6 : a9 00 __ LDA #$00
34b8 : c8 __ __ INY
34b9 : 91 23 __ STA (SP + 0),y 
34bb : 20 b8 2c JSR $2cb8 ; (printf.s1000 + 0)
34be : a9 1c __ LDA #$1c
34c0 : 8d 00 d6 STA $d600 
34c3 : a5 56 __ LDA T4 + 1 
34c5 : 29 e0 __ AND #$e0
34c7 : 18 __ __ CLC
34c8 : 65 57 __ ADC T5 + 0 
.l1151:
34ca : 2c 00 d6 BIT $d600 
34cd : 10 fb __ BPL $34ca ; (vdc_set_mode.l1151 + 0)
.s46:
34cf : 8d 01 d6 STA $d601 
34d2 : 18 __ __ CLC
34d3 : a9 13 __ LDA #$13
34d5 : 65 50 __ ADC T2 + 0 
34d7 : 85 50 __ STA T2 + 0 
34d9 : a9 3c __ LDA #$3c
34db : 69 00 __ ADC #$00
34dd : 85 51 __ STA T2 + 1 
.l47:
34df : a4 4f __ LDY T0 + 0 
34e1 : b1 50 __ LDA (T2 + 0),y 
34e3 : 85 46 __ STA T7 + 0 
34e5 : c8 __ __ INY
34e6 : b1 50 __ LDA (T2 + 0),y 
34e8 : aa __ __ TAX
34e9 : a5 46 __ LDA T7 + 0 
34eb : 8d 00 d6 STA $d600 
34ee : c8 __ __ INY
34ef : 84 4f __ STY T0 + 0 
.l1153:
34f1 : 2c 00 d6 BIT $d600 
34f4 : 10 fb __ BPL $34f1 ; (vdc_set_mode.l1153 + 0)
.s53:
34f6 : 8e 01 d6 STX $d601 
34f9 : 18 __ __ CLC
34fa : a5 53 __ LDA T3 + 0 
34fc : 65 4f __ ADC T0 + 0 
34fe : 85 55 __ STA T4 + 0 
3500 : a5 54 __ LDA T3 + 1 
3502 : 69 00 __ ADC #$00
3504 : 85 56 __ STA T4 + 1 
3506 : a0 13 __ LDY #$13
3508 : b1 55 __ LDA (T4 + 0),y 
350a : c9 ff __ CMP #$ff
350c : d0 d1 __ BNE $34df ; (vdc_set_mode.l47 + 0)
.s48:
350e : a0 04 __ LDY #$04
3510 : b1 53 __ LDA (T3 + 0),y 
3512 : d0 03 __ BNE $3517 ; (vdc_set_mode.s57 + 0)
3514 : 4c 3d 36 JMP $363d ; (vdc_set_mode.s1001 + 0)
.s57:
3517 : ad cf 3b LDA $3bcf ; (vdc_state + 1)
351a : f0 03 __ BEQ $351f ; (vdc_set_mode.s54 + 0)
351c : 4c 3d 36 JMP $363d ; (vdc_set_mode.s1001 + 0)
.s54:
351f : ad ce 3b LDA $3bce ; (vdc_state + 0)
3522 : c9 10 __ CMP #$10
3524 : d0 03 __ BNE $3529 ; (vdc_set_mode.s62 + 0)
3526 : 4c 3d 36 JMP $363d ; (vdc_set_mode.s1001 + 0)
.s62:
3529 : ad cf 3b LDA $3bcf ; (vdc_state + 1)
352c : f0 03 __ BEQ $3531 ; (vdc_set_mode.s61 + 0)
352e : 4c 3d 36 JMP $363d ; (vdc_set_mode.s1001 + 0)
.s61:
3531 : a9 22 __ LDA #$22
3533 : 8d 00 d6 STA $d600 
.l1159:
3536 : 2c 00 d6 BIT $d600 
3539 : 10 fb __ BPL $3536 ; (vdc_set_mode.l1159 + 0)
.s69:
353b : a9 80 __ LDA #$80
353d : 8d 01 d6 STA $d601 
3540 : a0 ff __ LDY #$ff
3542 : a2 00 __ LDX #$00
.l72:
3544 : a9 12 __ LDA #$12
3546 : 8d 00 d6 STA $d600 
.l1161:
3549 : 2c 00 d6 BIT $d600 
354c : 10 fb __ BPL $3549 ; (vdc_set_mode.l1161 + 0)
.s81:
354e : 8e 01 d6 STX $d601 
3551 : a9 13 __ LDA #$13
3553 : 8d 00 d6 STA $d600 
.l1163:
3556 : 2c 00 d6 BIT $d600 
3559 : 10 fb __ BPL $3556 ; (vdc_set_mode.l1163 + 0)
.s86:
355b : a9 00 __ LDA #$00
355d : 8d 01 d6 STA $d601 
3560 : a9 1f __ LDA #$1f
3562 : 8d 00 d6 STA $d600 
.l1165:
3565 : 2c 00 d6 BIT $d600 
3568 : 10 fb __ BPL $3565 ; (vdc_set_mode.l1165 + 0)
.s90:
356a : a9 00 __ LDA #$00
356c : 8d 01 d6 STA $d601 
356f : a9 18 __ LDA #$18
3571 : 8d 00 d6 STA $d600 
.l1167:
3574 : 2c 00 d6 BIT $d600 
3577 : 10 fb __ BPL $3574 ; (vdc_set_mode.l1167 + 0)
.s96:
3579 : ad 01 d6 LDA $d601 
357c : 29 7f __ AND #$7f
357e : 85 53 __ STA T3 + 0 
3580 : a9 18 __ LDA #$18
3582 : 8d 00 d6 STA $d600 
.l1169:
3585 : 2c 00 d6 BIT $d600 
3588 : 10 fb __ BPL $3585 ; (vdc_set_mode.l1169 + 0)
.s102:
358a : a5 53 __ LDA T3 + 0 
358c : 8d 01 d6 STA $d601 
358f : a9 1e __ LDA #$1e
3591 : 8d 00 d6 STA $d600 
.l1171:
3594 : 2c 00 d6 BIT $d600 
3597 : 10 fb __ BPL $3594 ; (vdc_set_mode.l1171 + 0)
.s107:
3599 : a9 ff __ LDA #$ff
359b : 8d 01 d6 STA $d601 
359e : e8 __ __ INX
359f : 88 __ __ DEY
35a0 : d0 a2 __ BNE $3544 ; (vdc_set_mode.l72 + 0)
.s74:
35a2 : a9 12 __ LDA #$12
35a4 : 8d 00 d6 STA $d600 
.l1174:
35a7 : 2c 00 d6 BIT $d600 
35aa : 10 fb __ BPL $35a7 ; (vdc_set_mode.l1174 + 0)
.s114:
35ac : 8e 01 d6 STX $d601 
35af : a9 13 __ LDA #$13
35b1 : 8d 00 d6 STA $d600 
.l1176:
35b4 : 2c 00 d6 BIT $d600 
35b7 : 10 fb __ BPL $35b4 ; (vdc_set_mode.l1176 + 0)
.s119:
35b9 : 8c 01 d6 STY $d601 
35bc : a9 1f __ LDA #$1f
35be : 8d 00 d6 STA $d600 
.l1178:
35c1 : 2c 00 d6 BIT $d600 
35c4 : 10 fb __ BPL $35c1 ; (vdc_set_mode.l1178 + 0)
.s123:
35c6 : 8c 01 d6 STY $d601 
35c9 : a9 18 __ LDA #$18
35cb : 8d 00 d6 STA $d600 
.l1180:
35ce : 2c 00 d6 BIT $d600 
35d1 : 10 fb __ BPL $35ce ; (vdc_set_mode.l1180 + 0)
.s129:
35d3 : ad 01 d6 LDA $d601 
35d6 : 29 7f __ AND #$7f
35d8 : aa __ __ TAX
35d9 : a9 18 __ LDA #$18
35db : 8d 00 d6 STA $d600 
.l1182:
35de : 2c 00 d6 BIT $d600 
35e1 : 10 fb __ BPL $35de ; (vdc_set_mode.l1182 + 0)
.s135:
35e3 : 8e 01 d6 STX $d601 
35e6 : a9 1e __ LDA #$1e
35e8 : 8d 00 d6 STA $d600 
.l1184:
35eb : 2c 00 d6 BIT $d600 
35ee : 10 fb __ BPL $35eb ; (vdc_set_mode.l1184 + 0)
.s140:
35f0 : a9 ff __ LDA #$ff
35f2 : 8d 01 d6 STA $d601 
35f5 : a9 1c __ LDA #$1c
35f7 : 8d 00 d6 STA $d600 
.l1186:
35fa : 2c 00 d6 BIT $d600 
35fd : 10 fb __ BPL $35fa ; (vdc_set_mode.l1186 + 0)
.s146:
35ff : ad 01 d6 LDA $d601 
3602 : 09 10 __ ORA #$10
3604 : aa __ __ TAX
3605 : a9 1c __ LDA #$1c
3607 : 8d 00 d6 STA $d600 
.l1188:
360a : 2c 00 d6 BIT $d600 
360d : 10 fb __ BPL $360a ; (vdc_set_mode.l1188 + 0)
.s152:
360f : 8e 01 d6 STX $d601 
3612 : 20 3b 37 JSR $373b ; (vdc_restore_charsets.s0 + 0)
3615 : a9 00 __ LDA #$00
3617 : 85 4f __ STA T0 + 0 
3619 : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
361c : 85 50 __ STA T2 + 0 
361e : ad d3 3b LDA $3bd3 ; (vdc_state + 5)
3621 : 85 53 __ STA T3 + 0 
.l155:
3623 : a5 4f __ LDA T0 + 0 
3625 : c5 53 __ CMP T3 + 0 
3627 : 90 2a __ BCC $3653 ; (vdc_set_mode.s156 + 0)
.s153:
3629 : a9 22 __ LDA #$22
362b : 8d 00 d6 STA $d600 
.l1214:
362e : 2c 00 d6 BIT $d600 
3631 : 10 fb __ BPL $362e ; (vdc_set_mode.l1214 + 0)
.s233:
3633 : a9 7d __ LDA #$7d
3635 : 8d 01 d6 STA $d601 
3638 : a9 01 __ LDA #$01
363a : 8d cf 3b STA $3bcf ; (vdc_state + 1)
.s1001:
363d : 18 __ __ CLC
363e : a5 23 __ LDA SP + 0 
3640 : 69 08 __ ADC #$08
3642 : 85 23 __ STA SP + 0 
3644 : 90 02 __ BCC $3648 ; (vdc_set_mode.s1001 + 11)
3646 : e6 24 __ INC SP + 1 
3648 : a2 04 __ LDX #$04
364a : bd ac bf LDA $bfac,x ; (vdc_set_mode@stack + 0)
364d : 95 53 __ STA T3 + 0,x 
364f : ca __ __ DEX
3650 : 10 f8 __ BPL $364a ; (vdc_set_mode.s1001 + 13)
3652 : 60 __ __ RTS
.s156:
3653 : ad d1 3b LDA $3bd1 ; (vdc_state + 3)
3656 : 85 1b __ STA ACCU + 0 
3658 : ad d2 3b LDA $3bd2 ; (vdc_state + 4)
365b : 85 1c __ STA ACCU + 1 
365d : ad d5 3b LDA $3bd5 ; (vdc_state + 7)
3660 : 85 43 __ STA T1 + 0 
3662 : a9 12 __ LDA #$12
3664 : 8d 00 d6 STA $d600 
3667 : a6 50 __ LDX T2 + 0 
3669 : ca __ __ DEX
366a : 86 44 __ STX T6 + 0 
366c : a5 4f __ LDA T0 + 0 
366e : 20 91 3a JSR $3a91 ; (mul16by8 + 0)
3671 : 18 __ __ CLC
3672 : a5 05 __ LDA WORK + 2 
3674 : 6d d6 3b ADC $3bd6 ; (vdc_state + 8)
3677 : aa __ __ TAX
3678 : a5 06 __ LDA WORK + 3 
367a : 6d d7 3b ADC $3bd7 ; (vdc_state + 9)
.l1190:
367d : 2c 00 d6 BIT $d600 
3680 : 10 fb __ BPL $367d ; (vdc_set_mode.l1190 + 0)
.s168:
3682 : 8d 01 d6 STA $d601 
3685 : a9 13 __ LDA #$13
3687 : 8d 00 d6 STA $d600 
.l1192:
368a : 2c 00 d6 BIT $d600 
368d : 10 fb __ BPL $368a ; (vdc_set_mode.l1192 + 0)
.s173:
368f : 8e 01 d6 STX $d601 
3692 : a9 1f __ LDA #$1f
3694 : 8d 00 d6 STA $d600 
.l1194:
3697 : 2c 00 d6 BIT $d600 
369a : 10 fb __ BPL $3697 ; (vdc_set_mode.l1194 + 0)
.s177:
369c : a9 20 __ LDA #$20
369e : 8d 01 d6 STA $d601 
36a1 : a9 18 __ LDA #$18
36a3 : 8d 00 d6 STA $d600 
.l1196:
36a6 : 2c 00 d6 BIT $d600 
36a9 : 10 fb __ BPL $36a6 ; (vdc_set_mode.l1196 + 0)
.s183:
36ab : ad 01 d6 LDA $d601 
36ae : 29 7f __ AND #$7f
36b0 : aa __ __ TAX
36b1 : a9 18 __ LDA #$18
36b3 : 8d 00 d6 STA $d600 
.l1198:
36b6 : 2c 00 d6 BIT $d600 
36b9 : 10 fb __ BPL $36b6 ; (vdc_set_mode.l1198 + 0)
.s189:
36bb : 8e 01 d6 STX $d601 
36be : a9 1e __ LDA #$1e
36c0 : 8d 00 d6 STA $d600 
.l1200:
36c3 : 2c 00 d6 BIT $d600 
36c6 : 10 fb __ BPL $36c3 ; (vdc_set_mode.l1200 + 0)
.s194:
36c8 : a5 44 __ LDA T6 + 0 
36ca : 8d 01 d6 STA $d601 
36cd : ad d8 3b LDA $3bd8 ; (vdc_state + 10)
36d0 : 18 __ __ CLC
36d1 : 65 05 __ ADC WORK + 2 
36d3 : aa __ __ TAX
36d4 : a9 12 __ LDA #$12
36d6 : 8d 00 d6 STA $d600 
36d9 : ad d9 3b LDA $3bd9 ; (vdc_state + 11)
36dc : 65 06 __ ADC WORK + 3 
.l1202:
36de : 2c 00 d6 BIT $d600 
36e1 : 10 fb __ BPL $36de ; (vdc_set_mode.l1202 + 0)
.s201:
36e3 : 8d 01 d6 STA $d601 
36e6 : a9 13 __ LDA #$13
36e8 : 8d 00 d6 STA $d600 
.l1204:
36eb : 2c 00 d6 BIT $d600 
36ee : 10 fb __ BPL $36eb ; (vdc_set_mode.l1204 + 0)
.s206:
36f0 : 8e 01 d6 STX $d601 
36f3 : a9 1f __ LDA #$1f
36f5 : 8d 00 d6 STA $d600 
.l1206:
36f8 : 2c 00 d6 BIT $d600 
36fb : 10 fb __ BPL $36f8 ; (vdc_set_mode.l1206 + 0)
.s210:
36fd : a5 43 __ LDA T1 + 0 
36ff : 8d 01 d6 STA $d601 
3702 : a9 18 __ LDA #$18
3704 : 8d 00 d6 STA $d600 
.l1208:
3707 : 2c 00 d6 BIT $d600 
370a : 10 fb __ BPL $3707 ; (vdc_set_mode.l1208 + 0)
.s216:
370c : ad 01 d6 LDA $d601 
370f : 29 7f __ AND #$7f
3711 : aa __ __ TAX
3712 : a9 18 __ LDA #$18
3714 : 8d 00 d6 STA $d600 
.l1210:
3717 : 2c 00 d6 BIT $d600 
371a : 10 fb __ BPL $3717 ; (vdc_set_mode.l1210 + 0)
.s222:
371c : 8e 01 d6 STX $d601 
371f : a9 1e __ LDA #$1e
3721 : 8d 00 d6 STA $d600 
.l1212:
3724 : 2c 00 d6 BIT $d600 
3727 : 10 fb __ BPL $3724 ; (vdc_set_mode.l1212 + 0)
.s227:
3729 : a5 44 __ LDA T6 + 0 
372b : 8d 01 d6 STA $d601 
372e : e6 4f __ INC T0 + 0 
3730 : 4c 23 36 JMP $3623 ; (vdc_set_mode.l155 + 0)
--------------------------------------------------------------------
3733 : __ __ __ BYT 25 32 78 20 25 32 78 00                         : %2x %2x.
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
373b : 20 62 ff JSR $ff62 
.s1001:
373e : 60 __ __ RTS
--------------------------------------------------------------------
373f : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 44 45 4d 4f : oSCAR64 vdc DEMO
374f : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
3750 : a2 03 __ LDX #$03
3752 : b5 53 __ LDA T8 + 0,x 
3754 : 9d e4 bf STA $bfe4,x ; (buff + 38)
3757 : ca __ __ DEX
3758 : 10 f8 __ BPL $3752 ; (sprintf.s1000 + 2)
.s0:
375a : 18 __ __ CLC
375b : a5 23 __ LDA SP + 0 
375d : 69 06 __ ADC #$06
375f : 85 47 __ STA T0 + 0 
3761 : a5 24 __ LDA SP + 1 
3763 : 69 00 __ ADC #$00
3765 : 85 48 __ STA T0 + 1 
3767 : a9 00 __ LDA #$00
3769 : 85 43 __ STA T1 + 0 
376b : a0 04 __ LDY #$04
376d : b1 23 __ LDA (SP + 0),y 
376f : 85 49 __ STA T2 + 0 
3771 : c8 __ __ INY
3772 : b1 23 __ LDA (SP + 0),y 
3774 : 85 4a __ STA T2 + 1 
3776 : a0 02 __ LDY #$02
3778 : b1 23 __ LDA (SP + 0),y 
377a : 85 4b __ STA T3 + 0 
377c : c8 __ __ INY
377d : b1 23 __ LDA (SP + 0),y 
377f : 85 4c __ STA T3 + 1 
.l2:
3781 : a0 00 __ LDY #$00
3783 : b1 49 __ LDA (T2 + 0),y 
3785 : d0 0f __ BNE $3796 ; (sprintf.s3 + 0)
.s4:
3787 : a4 43 __ LDY T1 + 0 
3789 : 91 4b __ STA (T3 + 0),y 
.s1001:
378b : a2 03 __ LDX #$03
378d : bd e4 bf LDA $bfe4,x ; (buff + 38)
3790 : 95 53 __ STA T8 + 0,x 
3792 : ca __ __ DEX
3793 : 10 f8 __ BPL $378d ; (sprintf.s1001 + 2)
3795 : 60 __ __ RTS
.s3:
3796 : c9 25 __ CMP #$25
3798 : f0 22 __ BEQ $37bc ; (sprintf.s5 + 0)
.s6:
379a : a4 43 __ LDY T1 + 0 
379c : 91 4b __ STA (T3 + 0),y 
379e : e6 49 __ INC T2 + 0 
37a0 : d0 02 __ BNE $37a4 ; (sprintf.s1102 + 0)
.s1101:
37a2 : e6 4a __ INC T2 + 1 
.s1102:
37a4 : c8 __ __ INY
37a5 : 84 43 __ STY T1 + 0 
37a7 : 98 __ __ TYA
37a8 : c0 28 __ CPY #$28
37aa : 90 d5 __ BCC $3781 ; (sprintf.l2 + 0)
.s111:
37ac : 18 __ __ CLC
37ad : 65 4b __ ADC T3 + 0 
37af : 85 4b __ STA T3 + 0 
37b1 : 90 02 __ BCC $37b5 ; (sprintf.s1104 + 0)
.s1103:
37b3 : e6 4c __ INC T3 + 1 
.s1104:
37b5 : a9 00 __ LDA #$00
.s1068:
37b7 : 85 43 __ STA T1 + 0 
37b9 : 4c 81 37 JMP $3781 ; (sprintf.l2 + 0)
.s5:
37bc : 8c ec bf STY $bfec ; (buff + 46)
37bf : 8c ed bf STY $bfed ; (buff + 47)
37c2 : 8c ee bf STY $bfee ; (buff + 48)
37c5 : 8c ef bf STY $bfef ; (buff + 49)
37c8 : a9 0a __ LDA #$0a
37ca : 8d eb bf STA $bfeb ; (buff + 45)
37cd : a5 43 __ LDA T1 + 0 
37cf : f0 0b __ BEQ $37dc ; (sprintf.s10 + 0)
.s8:
37d1 : 18 __ __ CLC
37d2 : 65 4b __ ADC T3 + 0 
37d4 : 85 4b __ STA T3 + 0 
37d6 : 90 02 __ BCC $37da ; (sprintf.s1080 + 0)
.s1079:
37d8 : e6 4c __ INC T3 + 1 
.s1080:
37da : 84 43 __ STY T1 + 0 
.s10:
37dc : a0 01 __ LDY #$01
37de : b1 49 __ LDA (T2 + 0),y 
37e0 : aa __ __ TAX
37e1 : a9 20 __ LDA #$20
37e3 : 8d e8 bf STA $bfe8 ; (buff + 42)
37e6 : a9 00 __ LDA #$00
37e8 : 8d e9 bf STA $bfe9 ; (buff + 43)
37eb : a9 ff __ LDA #$ff
37ed : 8d ea bf STA $bfea ; (buff + 44)
37f0 : 18 __ __ CLC
37f1 : a5 49 __ LDA T2 + 0 
37f3 : 69 02 __ ADC #$02
.l15:
37f5 : 85 49 __ STA T2 + 0 
37f7 : 90 02 __ BCC $37fb ; (sprintf.s1082 + 0)
.s1081:
37f9 : e6 4a __ INC T2 + 1 
.s1082:
37fb : 8a __ __ TXA
37fc : e0 2b __ CPX #$2b
37fe : d0 08 __ BNE $3808 ; (sprintf.s18 + 0)
.s17:
3800 : a9 01 __ LDA #$01
3802 : 8d ed bf STA $bfed ; (buff + 47)
3805 : 4c 69 3a JMP $3a69 ; (sprintf.s260 + 0)
.s18:
3808 : c9 30 __ CMP #$30
380a : d0 06 __ BNE $3812 ; (sprintf.s21 + 0)
.s20:
380c : 8d e8 bf STA $bfe8 ; (buff + 42)
380f : 4c 69 3a JMP $3a69 ; (sprintf.s260 + 0)
.s21:
3812 : e0 23 __ CPX #$23
3814 : d0 08 __ BNE $381e ; (sprintf.s24 + 0)
.s23:
3816 : a9 01 __ LDA #$01
3818 : 8d ef bf STA $bfef ; (buff + 49)
381b : 4c 69 3a JMP $3a69 ; (sprintf.s260 + 0)
.s24:
381e : e0 2d __ CPX #$2d
3820 : d0 08 __ BNE $382a ; (sprintf.s16 + 0)
.s26:
3822 : a9 01 __ LDA #$01
3824 : 8d ee bf STA $bfee ; (buff + 48)
3827 : 4c 69 3a JMP $3a69 ; (sprintf.s260 + 0)
.s16:
382a : 85 45 __ STA T4 + 0 
382c : e0 30 __ CPX #$30
382e : 90 53 __ BCC $3883 ; (sprintf.s32 + 0)
.s33:
3830 : e0 3a __ CPX #$3a
3832 : b0 4f __ BCS $3883 ; (sprintf.s32 + 0)
.s30:
3834 : a9 00 __ LDA #$00
3836 : 85 4d __ STA T6 + 0 
3838 : 85 4e __ STA T6 + 1 
383a : e0 3a __ CPX #$3a
383c : b0 40 __ BCS $387e ; (sprintf.s36 + 0)
.l35:
383e : a5 4d __ LDA T6 + 0 
3840 : 0a __ __ ASL
3841 : 85 1b __ STA ACCU + 0 
3843 : a5 4e __ LDA T6 + 1 
3845 : 2a __ __ ROL
3846 : 06 1b __ ASL ACCU + 0 
3848 : 2a __ __ ROL
3849 : aa __ __ TAX
384a : 18 __ __ CLC
384b : a5 1b __ LDA ACCU + 0 
384d : 65 4d __ ADC T6 + 0 
384f : 85 4d __ STA T6 + 0 
3851 : 8a __ __ TXA
3852 : 65 4e __ ADC T6 + 1 
3854 : 06 4d __ ASL T6 + 0 
3856 : 2a __ __ ROL
3857 : aa __ __ TAX
3858 : 18 __ __ CLC
3859 : a5 4d __ LDA T6 + 0 
385b : 65 45 __ ADC T4 + 0 
385d : 90 01 __ BCC $3860 ; (sprintf.s1098 + 0)
.s1097:
385f : e8 __ __ INX
.s1098:
3860 : 38 __ __ SEC
3861 : e9 30 __ SBC #$30
3863 : 85 4d __ STA T6 + 0 
3865 : 8a __ __ TXA
3866 : e9 00 __ SBC #$00
3868 : 85 4e __ STA T6 + 1 
386a : a0 00 __ LDY #$00
386c : b1 49 __ LDA (T2 + 0),y 
386e : 85 45 __ STA T4 + 0 
3870 : e6 49 __ INC T2 + 0 
3872 : d0 02 __ BNE $3876 ; (sprintf.s1100 + 0)
.s1099:
3874 : e6 4a __ INC T2 + 1 
.s1100:
3876 : c9 30 __ CMP #$30
3878 : 90 04 __ BCC $387e ; (sprintf.s36 + 0)
.s37:
387a : c9 3a __ CMP #$3a
387c : 90 c0 __ BCC $383e ; (sprintf.l35 + 0)
.s36:
387e : a5 4d __ LDA T6 + 0 
3880 : 8d e9 bf STA $bfe9 ; (buff + 43)
.s32:
3883 : a5 45 __ LDA T4 + 0 
3885 : c9 2e __ CMP #$2e
3887 : d0 51 __ BNE $38da ; (sprintf.s40 + 0)
.s38:
3889 : a9 00 __ LDA #$00
388b : 85 4d __ STA T6 + 0 
.l245:
388d : 85 4e __ STA T6 + 1 
388f : a0 00 __ LDY #$00
3891 : b1 49 __ LDA (T2 + 0),y 
3893 : 85 45 __ STA T4 + 0 
3895 : e6 49 __ INC T2 + 0 
3897 : d0 02 __ BNE $389b ; (sprintf.s1084 + 0)
.s1083:
3899 : e6 4a __ INC T2 + 1 
.s1084:
389b : c9 30 __ CMP #$30
389d : 90 04 __ BCC $38a3 ; (sprintf.s43 + 0)
.s44:
389f : c9 3a __ CMP #$3a
38a1 : 90 0a __ BCC $38ad ; (sprintf.s42 + 0)
.s43:
38a3 : a5 4d __ LDA T6 + 0 
38a5 : 8d ea bf STA $bfea ; (buff + 44)
38a8 : a5 45 __ LDA T4 + 0 
38aa : 4c da 38 JMP $38da ; (sprintf.s40 + 0)
.s42:
38ad : a5 4d __ LDA T6 + 0 
38af : 0a __ __ ASL
38b0 : 85 1b __ STA ACCU + 0 
38b2 : a5 4e __ LDA T6 + 1 
38b4 : 2a __ __ ROL
38b5 : 06 1b __ ASL ACCU + 0 
38b7 : 2a __ __ ROL
38b8 : aa __ __ TAX
38b9 : 18 __ __ CLC
38ba : a5 1b __ LDA ACCU + 0 
38bc : 65 4d __ ADC T6 + 0 
38be : 85 4d __ STA T6 + 0 
38c0 : 8a __ __ TXA
38c1 : 65 4e __ ADC T6 + 1 
38c3 : 06 4d __ ASL T6 + 0 
38c5 : 2a __ __ ROL
38c6 : aa __ __ TAX
38c7 : 18 __ __ CLC
38c8 : a5 4d __ LDA T6 + 0 
38ca : 65 45 __ ADC T4 + 0 
38cc : 90 01 __ BCC $38cf ; (sprintf.s1096 + 0)
.s1095:
38ce : e8 __ __ INX
.s1096:
38cf : 38 __ __ SEC
38d0 : e9 30 __ SBC #$30
38d2 : 85 4d __ STA T6 + 0 
38d4 : 8a __ __ TXA
38d5 : e9 00 __ SBC #$00
38d7 : 4c 8d 38 JMP $388d ; (sprintf.l245 + 0)
.s40:
38da : c9 64 __ CMP #$64
38dc : f0 04 __ BEQ $38e2 ; (sprintf.s45 + 0)
.s48:
38de : c9 44 __ CMP #$44
38e0 : d0 05 __ BNE $38e7 ; (sprintf.s46 + 0)
.s45:
38e2 : a9 01 __ LDA #$01
38e4 : 4c 42 3a JMP $3a42 ; (sprintf.s261 + 0)
.s46:
38e7 : c9 75 __ CMP #$75
38e9 : d0 03 __ BNE $38ee ; (sprintf.s52 + 0)
38eb : 4c 40 3a JMP $3a40 ; (sprintf.s285 + 0)
.s52:
38ee : c9 55 __ CMP #$55
38f0 : d0 03 __ BNE $38f5 ; (sprintf.s50 + 0)
38f2 : 4c 40 3a JMP $3a40 ; (sprintf.s285 + 0)
.s50:
38f5 : c9 78 __ CMP #$78
38f7 : f0 04 __ BEQ $38fd ; (sprintf.s53 + 0)
.s56:
38f9 : c9 58 __ CMP #$58
38fb : d0 0d __ BNE $390a ; (sprintf.s54 + 0)
.s53:
38fd : a9 10 __ LDA #$10
38ff : 8d eb bf STA $bfeb ; (buff + 45)
3902 : a9 00 __ LDA #$00
3904 : 8d ec bf STA $bfec ; (buff + 46)
3907 : 4c 40 3a JMP $3a40 ; (sprintf.s285 + 0)
.s54:
390a : c9 6c __ CMP #$6c
390c : d0 03 __ BNE $3911 ; (sprintf.s60 + 0)
390e : 4c d2 39 JMP $39d2 ; (sprintf.s57 + 0)
.s60:
3911 : c9 4c __ CMP #$4c
3913 : d0 03 __ BNE $3918 ; (sprintf.s58 + 0)
3915 : 4c d2 39 JMP $39d2 ; (sprintf.s57 + 0)
.s58:
3918 : c9 73 __ CMP #$73
391a : f0 37 __ BEQ $3953 ; (sprintf.s73 + 0)
.s76:
391c : c9 53 __ CMP #$53
391e : f0 33 __ BEQ $3953 ; (sprintf.s73 + 0)
.s74:
3920 : c9 63 __ CMP #$63
3922 : f0 14 __ BEQ $3938 ; (sprintf.s104 + 0)
.s107:
3924 : c9 43 __ CMP #$43
3926 : f0 10 __ BEQ $3938 ; (sprintf.s104 + 0)
.s105:
3928 : 09 00 __ ORA #$00
392a : d0 03 __ BNE $392f ; (sprintf.s108 + 0)
392c : 4c 81 37 JMP $3781 ; (sprintf.l2 + 0)
.s108:
392f : a4 43 __ LDY T1 + 0 
3931 : 91 4b __ STA (T3 + 0),y 
3933 : e6 43 __ INC T1 + 0 
3935 : 4c 81 37 JMP $3781 ; (sprintf.l2 + 0)
.s104:
3938 : a0 00 __ LDY #$00
393a : b1 47 __ LDA (T0 + 0),y 
393c : a4 43 __ LDY T1 + 0 
393e : 91 4b __ STA (T3 + 0),y 
3940 : e6 43 __ INC T1 + 0 
.s258:
3942 : 18 __ __ CLC
3943 : a5 47 __ LDA T0 + 0 
3945 : 69 02 __ ADC #$02
3947 : 85 47 __ STA T0 + 0 
3949 : b0 03 __ BCS $394e ; (sprintf.s1085 + 0)
394b : 4c 81 37 JMP $3781 ; (sprintf.l2 + 0)
.s1085:
394e : e6 48 __ INC T0 + 1 
3950 : 4c 81 37 JMP $3781 ; (sprintf.l2 + 0)
.s73:
3953 : a0 00 __ LDY #$00
3955 : 84 45 __ STY T4 + 0 
3957 : b1 47 __ LDA (T0 + 0),y 
3959 : 85 4d __ STA T6 + 0 
395b : c8 __ __ INY
395c : b1 47 __ LDA (T0 + 0),y 
395e : 85 4e __ STA T6 + 1 
3960 : 18 __ __ CLC
3961 : a5 47 __ LDA T0 + 0 
3963 : 69 02 __ ADC #$02
3965 : 85 47 __ STA T0 + 0 
3967 : 90 02 __ BCC $396b ; (sprintf.s1092 + 0)
.s1091:
3969 : e6 48 __ INC T0 + 1 
.s1092:
396b : ad e9 bf LDA $bfe9 ; (buff + 43)
396e : f0 0d __ BEQ $397d ; (sprintf.s79 + 0)
.s1071:
3970 : a0 00 __ LDY #$00
3972 : b1 4d __ LDA (T6 + 0),y 
3974 : f0 05 __ BEQ $397b ; (sprintf.s1072 + 0)
.l81:
3976 : c8 __ __ INY
3977 : b1 4d __ LDA (T6 + 0),y 
3979 : d0 fb __ BNE $3976 ; (sprintf.l81 + 0)
.s1072:
397b : 84 45 __ STY T4 + 0 
.s79:
397d : ad ee bf LDA $bfee ; (buff + 48)
3980 : d0 19 __ BNE $399b ; (sprintf.l95 + 0)
.s1075:
3982 : a6 45 __ LDX T4 + 0 
3984 : ec e9 bf CPX $bfe9 ; (buff + 43)
3987 : a4 43 __ LDY T1 + 0 
3989 : b0 0c __ BCS $3997 ; (sprintf.s1076 + 0)
.l87:
398b : ad e8 bf LDA $bfe8 ; (buff + 42)
398e : 91 4b __ STA (T3 + 0),y 
3990 : e8 __ __ INX
3991 : ec e9 bf CPX $bfe9 ; (buff + 43)
3994 : c8 __ __ INY
3995 : 90 f4 __ BCC $398b ; (sprintf.l87 + 0)
.s1076:
3997 : 86 45 __ STX T4 + 0 
3999 : 84 43 __ STY T1 + 0 
.l95:
399b : a0 00 __ LDY #$00
399d : b1 4d __ LDA (T6 + 0),y 
399f : f0 0f __ BEQ $39b0 ; (sprintf.s91 + 0)
.s96:
39a1 : a4 43 __ LDY T1 + 0 
39a3 : 91 4b __ STA (T3 + 0),y 
39a5 : e6 43 __ INC T1 + 0 
39a7 : e6 4d __ INC T6 + 0 
39a9 : d0 f0 __ BNE $399b ; (sprintf.l95 + 0)
.s1093:
39ab : e6 4e __ INC T6 + 1 
39ad : 4c 9b 39 JMP $399b ; (sprintf.l95 + 0)
.s91:
39b0 : ad ee bf LDA $bfee ; (buff + 48)
39b3 : d0 03 __ BNE $39b8 ; (sprintf.s1073 + 0)
39b5 : 4c 81 37 JMP $3781 ; (sprintf.l2 + 0)
.s1073:
39b8 : a6 45 __ LDX T4 + 0 
39ba : ec e9 bf CPX $bfe9 ; (buff + 43)
39bd : a4 43 __ LDY T1 + 0 
39bf : b0 0c __ BCS $39cd ; (sprintf.s1074 + 0)
.l102:
39c1 : ad e8 bf LDA $bfe8 ; (buff + 42)
39c4 : 91 4b __ STA (T3 + 0),y 
39c6 : e8 __ __ INX
39c7 : ec e9 bf CPX $bfe9 ; (buff + 43)
39ca : c8 __ __ INY
39cb : 90 f4 __ BCC $39c1 ; (sprintf.l102 + 0)
.s1074:
39cd : 84 43 __ STY T1 + 0 
39cf : 4c 81 37 JMP $3781 ; (sprintf.l2 + 0)
.s57:
39d2 : a0 00 __ LDY #$00
39d4 : b1 47 __ LDA (T0 + 0),y 
39d6 : 85 53 __ STA T8 + 0 
39d8 : c8 __ __ INY
39d9 : b1 47 __ LDA (T0 + 0),y 
39db : 85 54 __ STA T8 + 1 
39dd : c8 __ __ INY
39de : b1 47 __ LDA (T0 + 0),y 
39e0 : 85 55 __ STA T8 + 2 
39e2 : c8 __ __ INY
39e3 : b1 47 __ LDA (T0 + 0),y 
39e5 : 85 56 __ STA T8 + 3 
39e7 : 18 __ __ CLC
39e8 : a5 47 __ LDA T0 + 0 
39ea : 69 04 __ ADC #$04
39ec : 85 47 __ STA T0 + 0 
39ee : 90 02 __ BCC $39f2 ; (sprintf.s1088 + 0)
.s1087:
39f0 : e6 48 __ INC T0 + 1 
.s1088:
39f2 : a0 00 __ LDY #$00
39f4 : b1 49 __ LDA (T2 + 0),y 
39f6 : aa __ __ TAX
39f7 : e6 49 __ INC T2 + 0 
39f9 : d0 02 __ BNE $39fd ; (sprintf.s1090 + 0)
.s1089:
39fb : e6 4a __ INC T2 + 1 
.s1090:
39fd : 8a __ __ TXA
39fe : e0 64 __ CPX #$64
3a00 : f0 04 __ BEQ $3a06 ; (sprintf.s61 + 0)
.s64:
3a02 : c9 44 __ CMP #$44
3a04 : d0 04 __ BNE $3a0a ; (sprintf.s62 + 0)
.s61:
3a06 : a9 01 __ LDA #$01
3a08 : d0 1c __ BNE $3a26 ; (sprintf.s259 + 0)
.s62:
3a0a : c9 75 __ CMP #$75
3a0c : f0 17 __ BEQ $3a25 ; (sprintf.s284 + 0)
.s68:
3a0e : c9 55 __ CMP #$55
3a10 : f0 13 __ BEQ $3a25 ; (sprintf.s284 + 0)
.s66:
3a12 : c9 78 __ CMP #$78
3a14 : f0 07 __ BEQ $3a1d ; (sprintf.s69 + 0)
.s72:
3a16 : c9 58 __ CMP #$58
3a18 : f0 03 __ BEQ $3a1d ; (sprintf.s69 + 0)
3a1a : 4c 81 37 JMP $3781 ; (sprintf.l2 + 0)
.s69:
3a1d : 8c ec bf STY $bfec ; (buff + 46)
3a20 : a9 10 __ LDA #$10
3a22 : 8d eb bf STA $bfeb ; (buff + 45)
.s284:
3a25 : 98 __ __ TYA
.s259:
3a26 : 85 15 __ STA P8 
3a28 : a5 4b __ LDA T3 + 0 
3a2a : 85 0f __ STA P2 ; (fmt + 0)
3a2c : a5 4c __ LDA T3 + 1 
3a2e : 85 10 __ STA P3 ; (fmt + 1)
3a30 : a9 e8 __ LDA #$e8
3a32 : 85 0d __ STA P0 ; (str + 0)
3a34 : a9 bf __ LDA #$bf
3a36 : 85 0e __ STA P1 ; (str + 1)
3a38 : 20 92 31 JSR $3192 ; (nforml@proxy + 0)
3a3b : a5 1b __ LDA ACCU + 0 
3a3d : 4c b7 37 JMP $37b7 ; (sprintf.s1068 + 0)
.s285:
3a40 : a9 00 __ LDA #$00
.s261:
3a42 : 85 13 __ STA P6 
3a44 : a5 4b __ LDA T3 + 0 
3a46 : 85 0f __ STA P2 ; (fmt + 0)
3a48 : a5 4c __ LDA T3 + 1 
3a4a : 85 10 __ STA P3 ; (fmt + 1)
3a4c : a0 00 __ LDY #$00
3a4e : b1 47 __ LDA (T0 + 0),y 
3a50 : 85 11 __ STA P4 ; (fmt + 2)
3a52 : c8 __ __ INY
3a53 : b1 47 __ LDA (T0 + 0),y 
3a55 : 85 12 __ STA P5 ; (fmt + 3)
3a57 : a9 e8 __ LDA #$e8
3a59 : 85 0d __ STA P0 ; (str + 0)
3a5b : a9 bf __ LDA #$bf
3a5d : 85 0e __ STA P1 ; (str + 1)
3a5f : 20 5d 30 JSR $305d ; (nformi.s0 + 0)
3a62 : a5 1b __ LDA ACCU + 0 
3a64 : 85 43 __ STA T1 + 0 
3a66 : 4c 42 39 JMP $3942 ; (sprintf.s258 + 0)
.s260:
3a69 : a0 00 __ LDY #$00
3a6b : b1 49 __ LDA (T2 + 0),y 
3a6d : aa __ __ TAX
3a6e : 18 __ __ CLC
3a6f : a5 49 __ LDA T2 + 0 
3a71 : 69 01 __ ADC #$01
3a73 : 4c f5 37 JMP $37f5 ; (sprintf.l15 + 0)
--------------------------------------------------------------------
3a76 : __ __ __ BYT 76 64 63 20 6d 45 4d 4f 52 59 20 64 45 54 45 43 : vdc mEMORY dETEC
3a86 : __ __ __ BYT 54 45 44 3a 20 25 55 20 6b 62 00                : TED: %U kb.
--------------------------------------------------------------------
mul16by8: ; mul16by8
3a91 : a0 00 __ LDY #$00
3a93 : 84 06 __ STY WORK + 3 
3a95 : 4a __ __ LSR
3a96 : 90 0d __ BCC $3aa5 ; (mul16by8 + 20)
3a98 : aa __ __ TAX
3a99 : 18 __ __ CLC
3a9a : 98 __ __ TYA
3a9b : 65 1b __ ADC ACCU + 0 
3a9d : a8 __ __ TAY
3a9e : a5 06 __ LDA WORK + 3 
3aa0 : 65 1c __ ADC ACCU + 1 
3aa2 : 85 06 __ STA WORK + 3 
3aa4 : 8a __ __ TXA
3aa5 : 06 1b __ ASL ACCU + 0 
3aa7 : 26 1c __ ROL ACCU + 1 
3aa9 : 4a __ __ LSR
3aaa : b0 ec __ BCS $3a98 ; (mul16by8 + 7)
3aac : d0 f7 __ BNE $3aa5 ; (mul16by8 + 20)
3aae : 84 05 __ STY WORK + 2 
3ab0 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
3ab1 : a5 1c __ LDA ACCU + 1 
3ab3 : d0 31 __ BNE $3ae6 ; (divmod + 53)
3ab5 : a5 04 __ LDA WORK + 1 
3ab7 : d0 1e __ BNE $3ad7 ; (divmod + 38)
3ab9 : 85 06 __ STA WORK + 3 
3abb : a2 04 __ LDX #$04
3abd : 06 1b __ ASL ACCU + 0 
3abf : 2a __ __ ROL
3ac0 : c5 03 __ CMP WORK + 0 
3ac2 : 90 02 __ BCC $3ac6 ; (divmod + 21)
3ac4 : e5 03 __ SBC WORK + 0 
3ac6 : 26 1b __ ROL ACCU + 0 
3ac8 : 2a __ __ ROL
3ac9 : c5 03 __ CMP WORK + 0 
3acb : 90 02 __ BCC $3acf ; (divmod + 30)
3acd : e5 03 __ SBC WORK + 0 
3acf : 26 1b __ ROL ACCU + 0 
3ad1 : ca __ __ DEX
3ad2 : d0 eb __ BNE $3abf ; (divmod + 14)
3ad4 : 85 05 __ STA WORK + 2 
3ad6 : 60 __ __ RTS
3ad7 : a5 1b __ LDA ACCU + 0 
3ad9 : 85 05 __ STA WORK + 2 
3adb : a5 1c __ LDA ACCU + 1 
3add : 85 06 __ STA WORK + 3 
3adf : a9 00 __ LDA #$00
3ae1 : 85 1b __ STA ACCU + 0 
3ae3 : 85 1c __ STA ACCU + 1 
3ae5 : 60 __ __ RTS
3ae6 : a5 04 __ LDA WORK + 1 
3ae8 : d0 1f __ BNE $3b09 ; (divmod + 88)
3aea : a5 03 __ LDA WORK + 0 
3aec : 30 1b __ BMI $3b09 ; (divmod + 88)
3aee : a9 00 __ LDA #$00
3af0 : 85 06 __ STA WORK + 3 
3af2 : a2 10 __ LDX #$10
3af4 : 06 1b __ ASL ACCU + 0 
3af6 : 26 1c __ ROL ACCU + 1 
3af8 : 2a __ __ ROL
3af9 : c5 03 __ CMP WORK + 0 
3afb : 90 02 __ BCC $3aff ; (divmod + 78)
3afd : e5 03 __ SBC WORK + 0 
3aff : 26 1b __ ROL ACCU + 0 
3b01 : 26 1c __ ROL ACCU + 1 
3b03 : ca __ __ DEX
3b04 : d0 f2 __ BNE $3af8 ; (divmod + 71)
3b06 : 85 05 __ STA WORK + 2 
3b08 : 60 __ __ RTS
3b09 : a9 00 __ LDA #$00
3b0b : 85 05 __ STA WORK + 2 
3b0d : 85 06 __ STA WORK + 3 
3b0f : 84 02 __ STY $02 
3b11 : a0 10 __ LDY #$10
3b13 : 18 __ __ CLC
3b14 : 26 1b __ ROL ACCU + 0 
3b16 : 26 1c __ ROL ACCU + 1 
3b18 : 26 05 __ ROL WORK + 2 
3b1a : 26 06 __ ROL WORK + 3 
3b1c : 38 __ __ SEC
3b1d : a5 05 __ LDA WORK + 2 
3b1f : e5 03 __ SBC WORK + 0 
3b21 : aa __ __ TAX
3b22 : a5 06 __ LDA WORK + 3 
3b24 : e5 04 __ SBC WORK + 1 
3b26 : 90 04 __ BCC $3b2c ; (divmod + 123)
3b28 : 86 05 __ STX WORK + 2 
3b2a : 85 06 __ STA WORK + 3 
3b2c : 88 __ __ DEY
3b2d : d0 e5 __ BNE $3b14 ; (divmod + 99)
3b2f : 26 1b __ ROL ACCU + 0 
3b31 : 26 1c __ ROL ACCU + 1 
3b33 : a4 02 __ LDY $02 
3b35 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
3b36 : 84 02 __ STY $02 
3b38 : a0 20 __ LDY #$20
3b3a : a9 00 __ LDA #$00
3b3c : 85 07 __ STA WORK + 4 
3b3e : 85 08 __ STA WORK + 5 
3b40 : 85 09 __ STA WORK + 6 
3b42 : 85 0a __ STA WORK + 7 
3b44 : a5 05 __ LDA WORK + 2 
3b46 : 05 06 __ ORA WORK + 3 
3b48 : d0 39 __ BNE $3b83 ; (divmod32 + 77)
3b4a : 18 __ __ CLC
3b4b : 26 1b __ ROL ACCU + 0 
3b4d : 26 1c __ ROL ACCU + 1 
3b4f : 26 1d __ ROL ACCU + 2 
3b51 : 26 1e __ ROL ACCU + 3 
3b53 : 26 07 __ ROL WORK + 4 
3b55 : 26 08 __ ROL WORK + 5 
3b57 : 90 0c __ BCC $3b65 ; (divmod32 + 47)
3b59 : a5 07 __ LDA WORK + 4 
3b5b : e5 03 __ SBC WORK + 0 
3b5d : aa __ __ TAX
3b5e : a5 08 __ LDA WORK + 5 
3b60 : e5 04 __ SBC WORK + 1 
3b62 : 38 __ __ SEC
3b63 : b0 0c __ BCS $3b71 ; (divmod32 + 59)
3b65 : 38 __ __ SEC
3b66 : a5 07 __ LDA WORK + 4 
3b68 : e5 03 __ SBC WORK + 0 
3b6a : aa __ __ TAX
3b6b : a5 08 __ LDA WORK + 5 
3b6d : e5 04 __ SBC WORK + 1 
3b6f : 90 04 __ BCC $3b75 ; (divmod32 + 63)
3b71 : 86 07 __ STX WORK + 4 
3b73 : 85 08 __ STA WORK + 5 
3b75 : 88 __ __ DEY
3b76 : d0 d3 __ BNE $3b4b ; (divmod32 + 21)
3b78 : 26 1b __ ROL ACCU + 0 
3b7a : 26 1c __ ROL ACCU + 1 
3b7c : 26 1d __ ROL ACCU + 2 
3b7e : 26 1e __ ROL ACCU + 3 
3b80 : a4 02 __ LDY $02 
3b82 : 60 __ __ RTS
3b83 : 18 __ __ CLC
3b84 : 26 1b __ ROL ACCU + 0 
3b86 : 26 1c __ ROL ACCU + 1 
3b88 : 26 1d __ ROL ACCU + 2 
3b8a : 26 1e __ ROL ACCU + 3 
3b8c : 26 07 __ ROL WORK + 4 
3b8e : 26 08 __ ROL WORK + 5 
3b90 : 26 09 __ ROL WORK + 6 
3b92 : 26 0a __ ROL WORK + 7 
3b94 : a5 07 __ LDA WORK + 4 
3b96 : c5 03 __ CMP WORK + 0 
3b98 : a5 08 __ LDA WORK + 5 
3b9a : e5 04 __ SBC WORK + 1 
3b9c : a5 09 __ LDA WORK + 6 
3b9e : e5 05 __ SBC WORK + 2 
3ba0 : a5 0a __ LDA WORK + 7 
3ba2 : e5 06 __ SBC WORK + 3 
3ba4 : 90 18 __ BCC $3bbe ; (divmod32 + 136)
3ba6 : a5 07 __ LDA WORK + 4 
3ba8 : e5 03 __ SBC WORK + 0 
3baa : 85 07 __ STA WORK + 4 
3bac : a5 08 __ LDA WORK + 5 
3bae : e5 04 __ SBC WORK + 1 
3bb0 : 85 08 __ STA WORK + 5 
3bb2 : a5 09 __ LDA WORK + 6 
3bb4 : e5 05 __ SBC WORK + 2 
3bb6 : 85 09 __ STA WORK + 6 
3bb8 : a5 0a __ LDA WORK + 7 
3bba : e5 06 __ SBC WORK + 3 
3bbc : 85 0a __ STA WORK + 7 
3bbe : 88 __ __ DEY
3bbf : d0 c3 __ BNE $3b84 ; (divmod32 + 78)
3bc1 : 26 1b __ ROL ACCU + 0 
3bc3 : 26 1c __ ROL ACCU + 1 
3bc5 : 26 1d __ ROL ACCU + 2 
3bc7 : 26 1e __ ROL ACCU + 3 
3bc9 : a4 02 __ LDY $02 
3bcb : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
3bcc : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
3bcd : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
vdc_state:
3bce : __ __ __ BSS	22
--------------------------------------------------------------------
vdc_modes:
3c00 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
3c10 : __ __ __ BYT 30 00 40 00 7f 04 26 06 19 07 20 08 fc 09 e7 ff : 0.@...&... .....
3c20 : __ __ __ BYT 50 00 32 00 01 00 00 00 01 00 40 00 50 00 20 00 : P.2.......@.P. .
3c30 : __ __ __ BYT 30 00 60 00 7f 04 40 06 32 07 3a 08 03 09 07 ff : 0.`...@.2.:.....
--------------------------------------------------------------------
linebuffer:
3c40 : __ __ __ BSS	81
