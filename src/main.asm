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
1c13 : 8e fe 39 STX $39fe ; (spentry + 0)
1c16 : a9 f7 __ LDA #$f7
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 44 __ LDA #$44
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 45 __ LDA #$45
1c21 : e9 44 __ SBC #$44
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
1c35 : a9 6e __ LDA #$6e
1c37 : e9 f7 __ SBC #$f7
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
1c82 : b5 53 __ LDA T0 + 0,x 
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
1c97 : bd 56 44 LDA $4456,x ; (divmod32 + 149)
1c9a : 9d 5a bf STA $bf5a,x ; (filename + 14)
1c9d : ca __ __ DEX
1c9e : d0 f7 __ BNE $1c97 ; (main.l1002 + 0)
.s1003:
1ca0 : a2 0f __ LDX #$0f
.l1004:
1ca2 : bd a7 44 LDA $44a7,x 
1ca5 : 9d 4b bf STA $bf4b,x ; (main@stack + 6)
1ca8 : ca __ __ DEX
1ca9 : d0 f7 __ BNE $1ca2 ; (main.l1004 + 0)
.s1005:
1cab : a9 bb __ LDA #$bb
1cad : a0 02 __ LDY #$02
1caf : 91 23 __ STA (SP + 0),y 
1cb1 : a9 37 __ LDA #$37
1cb3 : c8 __ __ INY
1cb4 : 91 23 __ STA (SP + 0),y 
1cb6 : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1cb9 : a9 00 __ LDA #$00
1cbb : 85 0d __ STA P0 
1cbd : 85 0e __ STA P1 
1cbf : 20 c8 37 JSR $37c8 ; (krnio_setbnk.s0 + 0)
1cc2 : 20 d0 37 JSR $37d0 ; (krnio_setnam@proxy + 0)
1cc5 : a9 01 __ LDA #$01
1cc7 : 85 0d __ STA P0 
1cc9 : 85 0f __ STA P2 
1ccb : a9 08 __ LDA #$08
1ccd : 85 0e __ STA P1 
1ccf : a9 00 __ LDA #$00
1cd1 : a0 02 __ LDY #$02
1cd3 : 91 23 __ STA (SP + 0),y 
1cd5 : a9 38 __ LDA #$38
1cd7 : c8 __ __ INY
1cd8 : 91 23 __ STA (SP + 0),y 
1cda : 20 17 38 JSR $3817 ; (krnio_open.s0 + 0)
1cdd : a0 04 __ LDY #$04
1cdf : 91 23 __ STA (SP + 0),y 
1ce1 : a9 00 __ LDA #$00
1ce3 : c8 __ __ INY
1ce4 : 91 23 __ STA (SP + 0),y 
1ce6 : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1ce9 : a9 3f __ LDA #$3f
1ceb : a0 02 __ LDY #$02
1ced : 91 23 __ STA (SP + 0),y 
1cef : a9 38 __ LDA #$38
1cf1 : c8 __ __ INY
1cf2 : 91 23 __ STA (SP + 0),y 
1cf4 : ad f8 44 LDA $44f8 ; (krnio_pstatus + 1)
1cf7 : c8 __ __ INY
1cf8 : 91 23 __ STA (SP + 0),y 
1cfa : a9 00 __ LDA #$00
1cfc : c8 __ __ INY
1cfd : 91 23 __ STA (SP + 0),y 
1cff : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1d02 : a9 56 __ LDA #$56
1d04 : a0 02 __ LDY #$02
1d06 : 91 23 __ STA (SP + 0),y 
1d08 : a9 38 __ LDA #$38
1d0a : c8 __ __ INY
1d0b : 91 23 __ STA (SP + 0),y 
1d0d : a9 01 __ LDA #$01
1d0f : 20 6e 38 JSR $386e ; (krnio_chkout.s1000 + 0)
1d12 : aa __ __ TAX
1d13 : a9 00 __ LDA #$00
1d15 : 85 55 __ STA T2 + 0 
1d17 : 85 56 __ STA T3 + 0 
1d19 : 8a __ __ TXA
1d1a : d0 08 __ BNE $1d24 ; (main.s3 + 0)
.s4:
1d1c : a9 ff __ LDA #$ff
1d1e : a0 04 __ LDY #$04
1d20 : 91 23 __ STA (SP + 0),y 
1d22 : d0 1c __ BNE $1d40 ; (main.s2 + 0)
.s3:
1d24 : a2 00 __ LDX #$00
.l1497:
1d26 : 86 53 __ STX T0 + 0 
1d28 : bd 5b bf LDA $bf5b,x ; (testdata + 0)
1d2b : 20 ee 37 JSR $37ee ; (krnio_chrout.s1000 + 0)
1d2e : a6 53 __ LDX T0 + 0 
1d30 : e8 __ __ INX
1d31 : e0 51 __ CPX #$51
1d33 : 90 f1 __ BCC $1d26 ; (main.l1497 + 0)
.s9:
1d35 : 20 fc 37 JSR $37fc ; (krnio_clrchn.s0 + 0)
1d38 : a9 51 __ LDA #$51
1d3a : a0 04 __ LDY #$04
1d3c : 91 23 __ STA (SP + 0),y 
1d3e : a9 00 __ LDA #$00
.s2:
1d40 : a0 05 __ LDY #$05
1d42 : 91 23 __ STA (SP + 0),y 
1d44 : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1d47 : a9 82 __ LDA #$82
1d49 : a0 02 __ LDY #$02
1d4b : 91 23 __ STA (SP + 0),y 
1d4d : a9 38 __ LDA #$38
1d4f : c8 __ __ INY
1d50 : 91 23 __ STA (SP + 0),y 
1d52 : ad f8 44 LDA $44f8 ; (krnio_pstatus + 1)
1d55 : c8 __ __ INY
1d56 : 91 23 __ STA (SP + 0),y 
1d58 : a9 00 __ LDA #$00
1d5a : c8 __ __ INY
1d5b : 91 23 __ STA (SP + 0),y 
1d5d : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1d60 : a9 01 __ LDA #$01
1d62 : 20 9a 38 JSR $389a ; (krnio_close.s1000 + 0)
1d65 : a9 00 __ LDA #$00
1d67 : 85 0f __ STA P2 
1d69 : 85 10 __ STA P3 
1d6b : 85 12 __ STA P5 
1d6d : 20 a2 38 JSR $38a2 ; (memset@proxy + 0)
1d70 : a9 ca __ LDA #$ca
1d72 : a0 02 __ LDY #$02
1d74 : 91 23 __ STA (SP + 0),y 
1d76 : a9 38 __ LDA #$38
1d78 : c8 __ __ INY
1d79 : 91 23 __ STA (SP + 0),y 
1d7b : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1d7e : a9 00 __ LDA #$00
1d80 : 85 0d __ STA P0 
1d82 : 85 0e __ STA P1 
1d84 : 20 c8 37 JSR $37c8 ; (krnio_setbnk.s0 + 0)
1d87 : 20 d0 37 JSR $37d0 ; (krnio_setnam@proxy + 0)
1d8a : a9 01 __ LDA #$01
1d8c : 85 0d __ STA P0 
1d8e : a9 08 __ LDA #$08
1d90 : 85 0e __ STA P1 
1d92 : a9 00 __ LDA #$00
1d94 : 85 0f __ STA P2 
1d96 : a9 00 __ LDA #$00
1d98 : a0 02 __ LDY #$02
1d9a : 91 23 __ STA (SP + 0),y 
1d9c : a9 38 __ LDA #$38
1d9e : c8 __ __ INY
1d9f : 91 23 __ STA (SP + 0),y 
1da1 : 20 17 38 JSR $3817 ; (krnio_open.s0 + 0)
1da4 : a0 04 __ LDY #$04
1da6 : 91 23 __ STA (SP + 0),y 
1da8 : a9 00 __ LDA #$00
1daa : c8 __ __ INY
1dab : 91 23 __ STA (SP + 0),y 
1dad : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1db0 : a9 3f __ LDA #$3f
1db2 : a0 02 __ LDY #$02
1db4 : 91 23 __ STA (SP + 0),y 
1db6 : a9 38 __ LDA #$38
1db8 : c8 __ __ INY
1db9 : 91 23 __ STA (SP + 0),y 
1dbb : ad f8 44 LDA $44f8 ; (krnio_pstatus + 1)
1dbe : c8 __ __ INY
1dbf : 91 23 __ STA (SP + 0),y 
1dc1 : a9 00 __ LDA #$00
1dc3 : c8 __ __ INY
1dc4 : 91 23 __ STA (SP + 0),y 
1dc6 : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1dc9 : a9 d6 __ LDA #$d6
1dcb : a0 02 __ LDY #$02
1dcd : 91 23 __ STA (SP + 0),y 
1dcf : a9 38 __ LDA #$38
1dd1 : c8 __ __ INY
1dd2 : 91 23 __ STA (SP + 0),y 
1dd4 : ad f8 44 LDA $44f8 ; (krnio_pstatus + 1)
1dd7 : c9 40 __ CMP #$40
1dd9 : d0 04 __ BNE $1ddf ; (main.s15 + 0)
.s13:
1ddb : a9 00 __ LDA #$00
1ddd : f0 0e __ BEQ $1ded ; (main.s1507 + 0)
.s15:
1ddf : a9 01 __ LDA #$01
1de1 : 20 ed 38 JSR $38ed ; (krnio_chkin.s1000 + 0)
1de4 : 09 00 __ ORA #$00
1de6 : f0 03 __ BEQ $1deb ; (main.s18 + 0)
1de8 : 4c 23 31 JMP $3123 ; (main.s17 + 0)
.s18:
1deb : a9 ff __ LDA #$ff
.s1507:
1ded : 85 53 __ STA T0 + 0 
1def : 85 54 __ STA T0 + 1 
.s12:
1df1 : a5 53 __ LDA T0 + 0 
1df3 : a0 04 __ LDY #$04
1df5 : 91 23 __ STA (SP + 0),y 
1df7 : a5 54 __ LDA T0 + 1 
1df9 : c8 __ __ INY
1dfa : 91 23 __ STA (SP + 0),y 
1dfc : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1dff : a9 17 __ LDA #$17
1e01 : a0 02 __ LDY #$02
1e03 : 91 23 __ STA (SP + 0),y 
1e05 : a9 39 __ LDA #$39
1e07 : c8 __ __ INY
1e08 : 91 23 __ STA (SP + 0),y 
1e0a : ad f8 44 LDA $44f8 ; (krnio_pstatus + 1)
1e0d : c8 __ __ INY
1e0e : 91 23 __ STA (SP + 0),y 
1e10 : a9 00 __ LDA #$00
1e12 : c8 __ __ INY
1e13 : 91 23 __ STA (SP + 0),y 
1e15 : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1e18 : a9 01 __ LDA #$01
1e1a : 20 9a 38 JSR $389a ; (krnio_close.s1000 + 0)
1e1d : a9 2e __ LDA #$2e
1e1f : a0 02 __ LDY #$02
1e21 : 91 23 __ STA (SP + 0),y 
1e23 : a9 39 __ LDA #$39
1e25 : c8 __ __ INY
1e26 : 91 23 __ STA (SP + 0),y 
1e28 : a9 5b __ LDA #$5b
1e2a : c8 __ __ INY
1e2b : 91 23 __ STA (SP + 0),y 
1e2d : a9 bf __ LDA #$bf
1e2f : c8 __ __ INY
1e30 : 91 23 __ STA (SP + 0),y 
1e32 : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1e35 : 20 3d 39 JSR $393d ; (getch.s0 + 0)
1e38 : a9 5b __ LDA #$5b
1e3a : 85 0d __ STA P0 
1e3c : a9 bf __ LDA #$bf
1e3e : 85 0e __ STA P1 
1e40 : a9 00 __ LDA #$00
1e42 : 85 0f __ STA P2 
1e44 : 85 10 __ STA P3 
1e46 : 85 12 __ STA P5 
1e48 : a9 51 __ LDA #$51
1e4a : 85 11 __ STA P4 
1e4c : 20 ae 38 JSR $38ae ; (memset.s0 + 0)
1e4f : a2 ff __ LDX #$ff
.l1006:
1e51 : e8 __ __ INX
1e52 : bd 7c 39 LDA $397c,x 
1e55 : 9d 5b bf STA $bf5b,x ; (testdata + 0)
1e58 : d0 f7 __ BNE $1e51 ; (main.l1006 + 0)
.s1007:
1e5a : a2 ff __ LDX #$ff
.l1008:
1e5c : e8 __ __ INX
1e5d : bd 96 39 LDA $3996,x 
1e60 : 9d 4c bf STA $bf4c,x ; (filename + 0)
1e63 : d0 f7 __ BNE $1e5c ; (main.l1008 + 0)
.s1009:
1e65 : a9 bb __ LDA #$bb
1e67 : a0 02 __ LDY #$02
1e69 : 91 23 __ STA (SP + 0),y 
1e6b : a9 37 __ LDA #$37
1e6d : c8 __ __ INY
1e6e : 91 23 __ STA (SP + 0),y 
1e70 : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1e73 : a9 00 __ LDA #$00
1e75 : 85 53 __ STA T0 + 0 
1e77 : 85 0d __ STA P0 
1e79 : 85 0e __ STA P1 
1e7b : 20 c8 37 JSR $37c8 ; (krnio_setbnk.s0 + 0)
1e7e : 20 d0 37 JSR $37d0 ; (krnio_setnam@proxy + 0)
1e81 : a9 08 __ LDA #$08
1e83 : 85 0d __ STA P0 
1e85 : a9 5b __ LDA #$5b
1e87 : 85 0e __ STA P1 
1e89 : a9 bf __ LDA #$bf
1e8b : 85 0f __ STA P2 
1e8d : a9 9c __ LDA #$9c
1e8f : a0 02 __ LDY #$02
1e91 : 91 23 __ STA (SP + 0),y 
1e93 : a9 39 __ LDA #$39
1e95 : c8 __ __ INY
1e96 : 91 23 __ STA (SP + 0),y 
1e98 : ad 5b bf LDA $bf5b ; (testdata + 0)
1e9b : f0 0c __ BEQ $1ea9 ; (main.s37 + 0)
.s36:
1e9d : a2 00 __ LDX #$00
.l1499:
1e9f : bd 5c bf LDA $bf5c,x ; (testdata + 1)
1ea2 : e8 __ __ INX
1ea3 : 09 00 __ ORA #$00
1ea5 : d0 f8 __ BNE $1e9f ; (main.l1499 + 0)
.s1500:
1ea7 : 86 53 __ STX T0 + 0 
.s37:
1ea9 : 18 __ __ CLC
1eaa : a9 5b __ LDA #$5b
1eac : 65 53 __ ADC T0 + 0 
1eae : 85 10 __ STA P3 
1eb0 : a9 bf __ LDA #$bf
1eb2 : 69 00 __ ADC #$00
1eb4 : 85 11 __ STA P4 
1eb6 : 20 b3 39 JSR $39b3 ; (krnio_save.s0 + 0)
1eb9 : a0 04 __ LDY #$04
1ebb : 91 23 __ STA (SP + 0),y 
1ebd : a9 00 __ LDA #$00
1ebf : c8 __ __ INY
1ec0 : 91 23 __ STA (SP + 0),y 
1ec2 : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1ec5 : a9 82 __ LDA #$82
1ec7 : a0 02 __ LDY #$02
1ec9 : 91 23 __ STA (SP + 0),y 
1ecb : a9 38 __ LDA #$38
1ecd : c8 __ __ INY
1ece : 91 23 __ STA (SP + 0),y 
1ed0 : ad f8 44 LDA $44f8 ; (krnio_pstatus + 1)
1ed3 : c8 __ __ INY
1ed4 : 91 23 __ STA (SP + 0),y 
1ed6 : a9 00 __ LDA #$00
1ed8 : c8 __ __ INY
1ed9 : 91 23 __ STA (SP + 0),y 
1edb : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1ede : a9 00 __ LDA #$00
1ee0 : 85 0f __ STA P2 
1ee2 : 85 10 __ STA P3 
1ee4 : 85 12 __ STA P5 
1ee6 : 20 a2 38 JSR $38a2 ; (memset@proxy + 0)
1ee9 : a9 e1 __ LDA #$e1
1eeb : a0 02 __ LDY #$02
1eed : 91 23 __ STA (SP + 0),y 
1eef : a9 39 __ LDA #$39
1ef1 : c8 __ __ INY
1ef2 : 91 23 __ STA (SP + 0),y 
1ef4 : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1ef7 : a9 00 __ LDA #$00
1ef9 : 85 0d __ STA P0 
1efb : 85 0e __ STA P1 
1efd : 20 c8 37 JSR $37c8 ; (krnio_setbnk.s0 + 0)
1f00 : 20 d0 37 JSR $37d0 ; (krnio_setnam@proxy + 0)
1f03 : a9 01 __ LDA #$01
1f05 : 85 0d __ STA P0 
1f07 : 85 0f __ STA P2 
1f09 : a9 08 __ LDA #$08
1f0b : 85 0e __ STA P1 
1f0d : a9 00 __ LDA #$00
1f0f : a0 02 __ LDY #$02
1f11 : 91 23 __ STA (SP + 0),y 
1f13 : a9 3a __ LDA #$3a
1f15 : c8 __ __ INY
1f16 : 91 23 __ STA (SP + 0),y 
1f18 : 20 17 3a JSR $3a17 ; (krnio_load.s0 + 0)
1f1b : a0 04 __ LDY #$04
1f1d : 91 23 __ STA (SP + 0),y 
1f1f : a9 00 __ LDA #$00
1f21 : c8 __ __ INY
1f22 : 91 23 __ STA (SP + 0),y 
1f24 : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1f27 : a9 82 __ LDA #$82
1f29 : a0 02 __ LDY #$02
1f2b : 91 23 __ STA (SP + 0),y 
1f2d : a9 38 __ LDA #$38
1f2f : c8 __ __ INY
1f30 : 91 23 __ STA (SP + 0),y 
1f32 : ad f8 44 LDA $44f8 ; (krnio_pstatus + 1)
1f35 : c8 __ __ INY
1f36 : 91 23 __ STA (SP + 0),y 
1f38 : a9 00 __ LDA #$00
1f3a : c8 __ __ INY
1f3b : 91 23 __ STA (SP + 0),y 
1f3d : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1f40 : a9 5b __ LDA #$5b
1f42 : a0 04 __ LDY #$04
1f44 : 91 23 __ STA (SP + 0),y 
1f46 : a9 bf __ LDA #$bf
1f48 : c8 __ __ INY
1f49 : 91 23 __ STA (SP + 0),y 
1f4b : a9 2e __ LDA #$2e
1f4d : a0 02 __ LDY #$02
1f4f : 91 23 __ STA (SP + 0),y 
1f51 : a9 39 __ LDA #$39
1f53 : c8 __ __ INY
1f54 : 91 23 __ STA (SP + 0),y 
1f56 : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
1f59 : 20 3d 39 JSR $393d ; (getch.s0 + 0)
1f5c : a9 1a __ LDA #$1a
1f5e : 8d 00 d6 STA $d600 
.l7656:
1f61 : 2c 00 d6 BIT $d600 
1f64 : 10 fb __ BPL $1f61 ; (main.l7656 + 0)
.s46:
1f66 : ad 01 d6 LDA $d601 
1f69 : 29 f0 __ AND #$f0
1f6b : aa __ __ TAX
1f6c : a9 1a __ LDA #$1a
1f6e : 8d 00 d6 STA $d600 
.l7658:
1f71 : 2c 00 d6 BIT $d600 
1f74 : 10 fb __ BPL $1f71 ; (main.l7658 + 0)
.s52:
1f76 : 8e 01 d6 STX $d601 
1f79 : 8d 00 d6 STA $d600 
.l7660:
1f7c : 2c 00 d6 BIT $d600 
1f7f : 10 fb __ BPL $1f7c ; (main.l7660 + 0)
.s59:
1f81 : ad 01 d6 LDA $d601 
1f84 : 29 0f __ AND #$0f
1f86 : 09 d0 __ ORA #$d0
1f88 : aa __ __ TAX
1f89 : a9 1a __ LDA #$1a
1f8b : 8d 00 d6 STA $d600 
.l7662:
1f8e : 2c 00 d6 BIT $d600 
1f91 : 10 fb __ BPL $1f8e ; (main.l7662 + 0)
.s65:
1f93 : 8e 01 d6 STX $d601 
1f96 : a9 8d __ LDA #$8d
1f98 : 8d 0e 45 STA $450e ; (vdc_state + 7)
1f9b : a9 1c __ LDA #$1c
1f9d : 8d 00 d6 STA $d600 
.l7664:
1fa0 : 2c 00 d6 BIT $d600 
1fa3 : 10 fb __ BPL $1fa0 ; (main.l7664 + 0)
.s71:
1fa5 : ad 01 d6 LDA $d601 
1fa8 : aa __ __ TAX
1fa9 : 09 10 __ ORA #$10
1fab : a8 __ __ TAY
1fac : a9 1c __ LDA #$1c
1fae : 8d 00 d6 STA $d600 
.l7666:
1fb1 : 2c 00 d6 BIT $d600 
1fb4 : 10 fb __ BPL $1fb1 ; (main.l7666 + 0)
.s78:
1fb6 : 8c 01 d6 STY $d601 
1fb9 : a9 12 __ LDA #$12
1fbb : 8d 00 d6 STA $d600 
.l7668:
1fbe : 2c 00 d6 BIT $d600 
1fc1 : 10 fb __ BPL $1fbe ; (main.l7668 + 0)
.s85:
1fc3 : a9 1f __ LDA #$1f
1fc5 : 8d 01 d6 STA $d601 
1fc8 : a9 13 __ LDA #$13
1fca : 8d 00 d6 STA $d600 
.l7670:
1fcd : 2c 00 d6 BIT $d600 
1fd0 : 10 fb __ BPL $1fcd ; (main.l7670 + 0)
.s90:
1fd2 : a9 ff __ LDA #$ff
1fd4 : 8d 01 d6 STA $d601 
1fd7 : a9 1f __ LDA #$1f
1fd9 : 8d 00 d6 STA $d600 
.l7672:
1fdc : 2c 00 d6 BIT $d600 
1fdf : 10 fb __ BPL $1fdc ; (main.l7672 + 0)
.s94:
1fe1 : a9 00 __ LDA #$00
1fe3 : 8d 01 d6 STA $d601 
1fe6 : a9 12 __ LDA #$12
1fe8 : 8d 00 d6 STA $d600 
.l7674:
1feb : 2c 00 d6 BIT $d600 
1fee : 10 fb __ BPL $1feb ; (main.l7674 + 0)
.s101:
1ff0 : a9 9f __ LDA #$9f
1ff2 : 8d 01 d6 STA $d601 
1ff5 : a9 13 __ LDA #$13
1ff7 : 8d 00 d6 STA $d600 
.l7676:
1ffa : 2c 00 d6 BIT $d600 
1ffd : 10 fb __ BPL $1ffa ; (main.l7676 + 0)
.s106:
1fff : a9 ff __ LDA #$ff
2001 : 8d 01 d6 STA $d601 
2004 : a9 1f __ LDA #$1f
2006 : 8d 00 d6 STA $d600 
.l7678:
2009 : 2c 00 d6 BIT $d600 
200c : 10 fb __ BPL $2009 ; (main.l7678 + 0)
.s110:
200e : a9 ff __ LDA #$ff
2010 : 8d 01 d6 STA $d601 
2013 : a9 12 __ LDA #$12
2015 : 8d 00 d6 STA $d600 
.l7680:
2018 : 2c 00 d6 BIT $d600 
201b : 10 fb __ BPL $2018 ; (main.l7680 + 0)
.s117:
201d : a9 1f __ LDA #$1f
201f : 8d 01 d6 STA $d601 
2022 : a9 13 __ LDA #$13
2024 : 8d 00 d6 STA $d600 
.l7682:
2027 : 2c 00 d6 BIT $d600 
202a : 10 fb __ BPL $2027 ; (main.l7682 + 0)
.s122:
202c : a9 ff __ LDA #$ff
202e : 8d 01 d6 STA $d601 
2031 : a9 1f __ LDA #$1f
2033 : 8d 00 d6 STA $d600 
.l7684:
2036 : 2c 00 d6 BIT $d600 
2039 : 10 fb __ BPL $2036 ; (main.l7684 + 0)
.s126:
203b : ad 01 d6 LDA $d601 
203e : f0 04 __ BEQ $2044 ; (main.s1516 + 0)
.s1517:
2040 : a9 10 __ LDA #$10
2042 : d0 02 __ BNE $2046 ; (main.s1518 + 0)
.s1516:
2044 : a9 40 __ LDA #$40
.s1518:
2046 : 8d 07 45 STA $4507 ; (vdc_state + 0)
2049 : a9 1c __ LDA #$1c
204b : 8d 00 d6 STA $d600 
.l7687:
204e : 2c 00 d6 BIT $d600 
2051 : 10 fb __ BPL $204e ; (main.l7687 + 0)
.s133:
2053 : 8e 01 d6 STX $d601 
2056 : a9 00 __ LDA #$00
2058 : 85 52 __ STA T1 + 0 
205a : ad 0a 45 LDA $450a ; (vdc_state + 3)
205d : 85 53 __ STA T0 + 0 
205f : ad 0c 45 LDA $450c ; (vdc_state + 5)
2062 : 85 57 __ STA T4 + 0 
.l136:
2064 : a5 52 __ LDA T1 + 0 
2066 : c5 57 __ CMP T4 + 0 
2068 : b0 03 __ BCS $206d ; (main.s66 + 0)
206a : 4c 43 30 JMP $3043 ; (main.s137 + 0)
.s66:
206d : 24 d7 __ BIT $d7 
206f : 30 17 __ BMI $2088 ; (main.s211 + 0)
.s214:
2071 : a9 3d __ LDA #$3d
2073 : a0 02 __ LDY #$02
2075 : 91 23 __ STA (SP + 0),y 
2077 : a9 3a __ LDA #$3a
2079 : c8 __ __ INY
207a : 91 23 __ STA (SP + 0),y 
207c : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
207f : 20 3d 39 JSR $393d ; (getch.s0 + 0)
2082 : 20 ed 39 JSR $39ed ; (clrscr.s0 + 0)
2085 : 20 f1 39 JSR $39f1 ; (screen_setmode.s0 + 0)
.s211:
2088 : 20 68 3a JSR $3a68 ; (load_overlay.s1000 + 0)
208b : a9 01 __ LDA #$01
208d : 8d 30 d0 STA $d030 
2090 : a9 00 __ LDA #$00
2092 : 85 16 __ STA P9 
2094 : ad 11 d0 LDA $d011 
2097 : 29 6f __ AND #$6f
2099 : 8d 11 d0 STA $d011 
209c : 20 ef 3a JSR $3aef ; (vdc_set_mode.s1000 + 0)
209f : ad 0f 45 LDA $450f ; (vdc_state + 8)
20a2 : 85 53 __ STA T0 + 0 
20a4 : a9 12 __ LDA #$12
20a6 : 8d 00 d6 STA $d600 
20a9 : ae 10 45 LDX $4510 ; (vdc_state + 9)
.l7714:
20ac : 2c 00 d6 BIT $d600 
20af : 10 fb __ BPL $20ac ; (main.l7714 + 0)
.s412:
20b1 : 8e 01 d6 STX $d601 
20b4 : a9 13 __ LDA #$13
20b6 : 8d 00 d6 STA $d600 
.l7716:
20b9 : 2c 00 d6 BIT $d600 
20bc : 10 fb __ BPL $20b9 ; (main.l7716 + 0)
.s417:
20be : a5 53 __ LDA T0 + 0 
20c0 : 8d 01 d6 STA $d601 
20c3 : a9 1f __ LDA #$1f
20c5 : 8d 00 d6 STA $d600 
.l7718:
20c8 : 2c 00 d6 BIT $d600 
20cb : 10 fb __ BPL $20c8 ; (main.l7718 + 0)
.s421:
20cd : a9 00 __ LDA #$00
20cf : 8d 01 d6 STA $d601 
20d2 : a9 18 __ LDA #$18
20d4 : 8d 00 d6 STA $d600 
.l7720:
20d7 : 2c 00 d6 BIT $d600 
20da : 10 fb __ BPL $20d7 ; (main.l7720 + 0)
.s427:
20dc : ad 01 d6 LDA $d601 
20df : 29 7f __ AND #$7f
20e1 : aa __ __ TAX
20e2 : a9 18 __ LDA #$18
20e4 : 8d 00 d6 STA $d600 
.l7722:
20e7 : 2c 00 d6 BIT $d600 
20ea : 10 fb __ BPL $20e7 ; (main.l7722 + 0)
.s433:
20ec : 8e 01 d6 STX $d601 
20ef : a9 1e __ LDA #$1e
20f1 : 8d 00 d6 STA $d600 
.l7724:
20f4 : 2c 00 d6 BIT $d600 
20f7 : 10 fb __ BPL $20f4 ; (main.l7724 + 0)
.s438:
20f9 : a9 4f __ LDA #$4f
20fb : 8d 01 d6 STA $d601 
20fe : a9 12 __ LDA #$12
2100 : 8d 00 d6 STA $d600 
2103 : ac 12 45 LDY $4512 ; (vdc_state + 11)
2106 : ae 11 45 LDX $4511 ; (vdc_state + 10)
.l7726:
2109 : 2c 00 d6 BIT $d600 
210c : 10 fb __ BPL $2109 ; (main.l7726 + 0)
.s445:
210e : 8c 01 d6 STY $d601 
2111 : a9 13 __ LDA #$13
2113 : 8d 00 d6 STA $d600 
.l7728:
2116 : 2c 00 d6 BIT $d600 
2119 : 10 fb __ BPL $2116 ; (main.l7728 + 0)
.s450:
211b : 8e 01 d6 STX $d601 
211e : a9 1f __ LDA #$1f
2120 : 8d 00 d6 STA $d600 
.l7730:
2123 : 2c 00 d6 BIT $d600 
2126 : 10 fb __ BPL $2123 ; (main.l7730 + 0)
.s454:
2128 : a9 05 __ LDA #$05
212a : 8d 01 d6 STA $d601 
212d : a9 18 __ LDA #$18
212f : 8d 00 d6 STA $d600 
.l7732:
2132 : 2c 00 d6 BIT $d600 
2135 : 10 fb __ BPL $2132 ; (main.l7732 + 0)
.s460:
2137 : ad 01 d6 LDA $d601 
213a : 29 7f __ AND #$7f
213c : aa __ __ TAX
213d : a9 18 __ LDA #$18
213f : 8d 00 d6 STA $d600 
.l7734:
2142 : 2c 00 d6 BIT $d600 
2145 : 10 fb __ BPL $2142 ; (main.l7734 + 0)
.s466:
2147 : 8e 01 d6 STX $d601 
214a : a9 1e __ LDA #$1e
214c : 8d 00 d6 STA $d600 
.l7736:
214f : 2c 00 d6 BIT $d600 
2152 : 10 fb __ BPL $214f ; (main.l7736 + 0)
.s471:
2154 : a9 4f __ LDA #$4f
2156 : 8d 01 d6 STA $d601 
2159 : ad 0a 45 LDA $450a ; (vdc_state + 3)
215c : 0a __ __ ASL
215d : 85 57 __ STA T4 + 0 
215f : ad 0b 45 LDA $450b ; (vdc_state + 4)
2162 : 2a __ __ ROL
2163 : 85 58 __ STA T4 + 1 
2165 : a2 00 __ LDX #$00
.l1501:
2167 : bd 01 13 LDA $1301,x 
216a : e8 __ __ INX
216b : 09 00 __ ORA #$00
216d : d0 f8 __ BNE $2167 ; (main.l1501 + 0)
.s1502:
216f : 86 43 __ STX T5 + 0 
2171 : a9 12 __ LDA #$12
2173 : 8d 00 d6 STA $d600 
2176 : 18 __ __ CLC
2177 : a5 57 __ LDA T4 + 0 
2179 : 65 53 __ ADC T0 + 0 
217b : a8 __ __ TAY
217c : a5 58 __ LDA T4 + 1 
217e : 6d 10 45 ADC $4510 ; (vdc_state + 9)
.l7739:
2181 : 2c 00 d6 BIT $d600 
2184 : 10 fb __ BPL $2181 ; (main.l7739 + 0)
.s485:
2186 : 8d 01 d6 STA $d601 
2189 : a9 13 __ LDA #$13
218b : 8d 00 d6 STA $d600 
.l7741:
218e : 2c 00 d6 BIT $d600 
2191 : 10 fb __ BPL $218e ; (main.l7741 + 0)
.s490:
2193 : 8c 01 d6 STY $d601 
2196 : a9 1f __ LDA #$1f
2198 : 8d 00 d6 STA $d600 
219b : 8a __ __ TXA
219c : f0 46 __ BEQ $21e4 ; (main.s495 + 0)
.s1722:
219e : a2 00 __ LDX #$00
.l493:
21a0 : bd 00 13 LDA $1300,x 
21a3 : c9 20 __ CMP #$20
21a5 : b0 04 __ BCS $21ab ; (main.s499 + 0)
.s498:
21a7 : 09 80 __ ORA #$80
21a9 : 90 2b __ BCC $21d6 ; (main.s1508 + 0)
.s499:
21ab : a8 __ __ TAY
21ac : c9 40 __ CMP #$40
21ae : 90 04 __ BCC $21b4 ; (main.s502 + 0)
.s504:
21b0 : c9 60 __ CMP #$60
21b2 : 90 11 __ BCC $21c5 ; (main.s501 + 0)
.s502:
21b4 : c9 60 __ CMP #$60
21b6 : 90 05 __ BCC $21bd ; (main.s506 + 0)
.s505:
21b8 : e9 20 __ SBC #$20
21ba : 4c d6 21 JMP $21d6 ; (main.s1508 + 0)
.s506:
21bd : c9 a0 __ CMP #$a0
21bf : 90 0a __ BCC $21cb ; (main.s514 + 0)
.s516:
21c1 : c9 c0 __ CMP #$c0
21c3 : b0 06 __ BCS $21cb ; (main.s514 + 0)
.s501:
21c5 : 38 __ __ SEC
21c6 : e9 40 __ SBC #$40
21c8 : 4c d6 21 JMP $21d6 ; (main.s1508 + 0)
.s514:
21cb : c9 c0 __ CMP #$c0
21cd : 90 08 __ BCC $21d7 ; (main.l7745 + 0)
.s520:
21cf : c9 ff __ CMP #$ff
21d1 : b0 04 __ BCS $21d7 ; (main.l7745 + 0)
.s517:
21d3 : 38 __ __ SEC
21d4 : e9 80 __ SBC #$80
.s1508:
21d6 : a8 __ __ TAY
.l7745:
21d7 : 2c 00 d6 BIT $d600 
21da : 10 fb __ BPL $21d7 ; (main.l7745 + 0)
.s526:
21dc : 8c 01 d6 STY $d601 
21df : e8 __ __ INX
21e0 : e4 43 __ CPX T5 + 0 
21e2 : 90 bc __ BCC $21a0 ; (main.l493 + 0)
.s495:
21e4 : a9 12 __ LDA #$12
21e6 : 8d 00 d6 STA $d600 
21e9 : c6 43 __ DEC T5 + 0 
21eb : ad 11 45 LDA $4511 ; (vdc_state + 10)
21ee : 18 __ __ CLC
21ef : 65 57 __ ADC T4 + 0 
21f1 : a8 __ __ TAY
21f2 : ad 12 45 LDA $4512 ; (vdc_state + 11)
21f5 : 65 58 __ ADC T4 + 1 
21f7 : ae 0e 45 LDX $450e ; (vdc_state + 7)
.l7748:
21fa : 2c 00 d6 BIT $d600 
21fd : 10 fb __ BPL $21fa ; (main.l7748 + 0)
.s533:
21ff : 8d 01 d6 STA $d601 
2202 : a9 13 __ LDA #$13
2204 : 8d 00 d6 STA $d600 
.l7750:
2207 : 2c 00 d6 BIT $d600 
220a : 10 fb __ BPL $2207 ; (main.l7750 + 0)
.s538:
220c : 8c 01 d6 STY $d601 
220f : a9 1f __ LDA #$1f
2211 : 8d 00 d6 STA $d600 
.l7752:
2214 : 2c 00 d6 BIT $d600 
2217 : 10 fb __ BPL $2214 ; (main.l7752 + 0)
.s542:
2219 : 8e 01 d6 STX $d601 
221c : a9 18 __ LDA #$18
221e : 8d 00 d6 STA $d600 
.l7754:
2221 : 2c 00 d6 BIT $d600 
2224 : 10 fb __ BPL $2221 ; (main.l7754 + 0)
.s548:
2226 : ad 01 d6 LDA $d601 
2229 : 29 7f __ AND #$7f
222b : aa __ __ TAX
222c : a9 18 __ LDA #$18
222e : 8d 00 d6 STA $d600 
.l7756:
2231 : 2c 00 d6 BIT $d600 
2234 : 10 fb __ BPL $2231 ; (main.l7756 + 0)
.s554:
2236 : 8e 01 d6 STX $d601 
2239 : a9 1e __ LDA #$1e
223b : 8d 00 d6 STA $d600 
.l7758:
223e : 2c 00 d6 BIT $d600 
2241 : 10 fb __ BPL $223e ; (main.l7758 + 0)
.s559:
2243 : a5 43 __ LDA T5 + 0 
2245 : 8d 01 d6 STA $d601 
2248 : 20 3d 39 JSR $393d ; (getch.s0 + 0)
224b : a9 00 __ LDA #$00
224d : 85 52 __ STA T1 + 0 
224f : ad 0a 45 LDA $450a ; (vdc_state + 3)
2252 : 85 53 __ STA T0 + 0 
2254 : ad 0c 45 LDA $450c ; (vdc_state + 5)
2257 : 85 57 __ STA T4 + 0 
.l562:
2259 : a5 52 __ LDA T1 + 0 
225b : c5 57 __ CMP T4 + 0 
225d : b0 03 __ BCS $2262 ; (main.s402 + 0)
225f : 4c 63 2f JMP $2f63 ; (main.s563 + 0)
.s402:
2262 : a9 00 __ LDA #$00
2264 : 85 52 __ STA T1 + 0 
.l641:
2266 : ad 10 45 LDA $4510 ; (vdc_state + 9)
2269 : 85 57 __ STA T4 + 0 
226b : a9 12 __ LDA #$12
226d : 8d 00 d6 STA $d600 
2270 : ac 0f 45 LDY $450f ; (vdc_state + 8)
.l7784:
2273 : 2c 00 d6 BIT $d600 
2276 : 10 fb __ BPL $2273 ; (main.l7784 + 0)
.s651:
2278 : a5 57 __ LDA T4 + 0 
227a : 8d 01 d6 STA $d601 
227d : a9 13 __ LDA #$13
227f : 8d 00 d6 STA $d600 
.l7786:
2282 : 2c 00 d6 BIT $d600 
2285 : 10 fb __ BPL $2282 ; (main.l7786 + 0)
.s656:
2287 : 8c 01 d6 STY $d601 
228a : a9 1f __ LDA #$1f
228c : 8d 00 d6 STA $d600 
.l7788:
228f : 2c 00 d6 BIT $d600 
2292 : 10 fb __ BPL $228f ; (main.l7788 + 0)
.s660:
2294 : a9 20 __ LDA #$20
2296 : 8d 01 d6 STA $d601 
2299 : a9 18 __ LDA #$18
229b : 8d 00 d6 STA $d600 
.l7790:
229e : 2c 00 d6 BIT $d600 
22a1 : 10 fb __ BPL $229e ; (main.l7790 + 0)
.s666:
22a3 : ad 01 d6 LDA $d601 
22a6 : 29 7f __ AND #$7f
22a8 : aa __ __ TAX
22a9 : a9 18 __ LDA #$18
22ab : 8d 00 d6 STA $d600 
.l7792:
22ae : 2c 00 d6 BIT $d600 
22b1 : 10 fb __ BPL $22ae ; (main.l7792 + 0)
.s672:
22b3 : 8e 01 d6 STX $d601 
22b6 : a9 1e __ LDA #$1e
22b8 : 8d 00 d6 STA $d600 
.l7794:
22bb : 2c 00 d6 BIT $d600 
22be : 10 fb __ BPL $22bb ; (main.l7794 + 0)
.s677:
22c0 : a9 4e __ LDA #$4e
22c2 : 8d 01 d6 STA $d601 
22c5 : ad 12 45 LDA $4512 ; (vdc_state + 11)
22c8 : 85 45 __ STA T7 + 0 
22ca : a9 12 __ LDA #$12
22cc : 8d 00 d6 STA $d600 
22cf : ae 11 45 LDX $4511 ; (vdc_state + 10)
.l7796:
22d2 : 2c 00 d6 BIT $d600 
22d5 : 10 fb __ BPL $22d2 ; (main.l7796 + 0)
.s684:
22d7 : a5 45 __ LDA T7 + 0 
22d9 : 8d 01 d6 STA $d601 
22dc : a9 13 __ LDA #$13
22de : 8d 00 d6 STA $d600 
.l7798:
22e1 : 2c 00 d6 BIT $d600 
22e4 : 10 fb __ BPL $22e1 ; (main.l7798 + 0)
.s689:
22e6 : 8e 01 d6 STX $d601 
22e9 : a9 1f __ LDA #$1f
22eb : 8d 00 d6 STA $d600 
.l7800:
22ee : 2c 00 d6 BIT $d600 
22f1 : 10 fb __ BPL $22ee ; (main.l7800 + 0)
.s693:
22f3 : a9 c5 __ LDA #$c5
22f5 : 8d 01 d6 STA $d601 
22f8 : a9 18 __ LDA #$18
22fa : 8d 00 d6 STA $d600 
.l7802:
22fd : 2c 00 d6 BIT $d600 
2300 : 10 fb __ BPL $22fd ; (main.l7802 + 0)
.s699:
2302 : ad 01 d6 LDA $d601 
2305 : 29 7f __ AND #$7f
2307 : aa __ __ TAX
2308 : a9 18 __ LDA #$18
230a : 8d 00 d6 STA $d600 
.l7804:
230d : 2c 00 d6 BIT $d600 
2310 : 10 fb __ BPL $230d ; (main.l7804 + 0)
.s705:
2312 : 8e 01 d6 STX $d601 
2315 : a9 1e __ LDA #$1e
2317 : 8d 00 d6 STA $d600 
.l7806:
231a : 2c 00 d6 BIT $d600 
231d : 10 fb __ BPL $231a ; (main.l7806 + 0)
.s710:
231f : a9 4e __ LDA #$4e
2321 : 8d 01 d6 STA $d601 
2324 : ad 0e 45 LDA $450e ; (vdc_state + 7)
2327 : 29 f0 __ AND #$f0
2329 : 09 45 __ ORA #$45
232b : 8d 0e 45 STA $450e ; (vdc_state + 7)
232e : a2 00 __ LDX #$00
.l1503:
2330 : bd 98 3f LDA $3f98,x 
2333 : e8 __ __ INX
2334 : 09 00 __ ORA #$00
2336 : d0 f8 __ BNE $2330 ; (main.l1503 + 0)
.s1504:
2338 : 86 43 __ STX T5 + 0 
233a : a9 12 __ LDA #$12
233c : 8d 00 d6 STA $d600 
.l7809:
233f : 2c 00 d6 BIT $d600 
2342 : 10 fb __ BPL $233f ; (main.l7809 + 0)
.s726:
2344 : a5 57 __ LDA T4 + 0 
2346 : 8d 01 d6 STA $d601 
2349 : a9 13 __ LDA #$13
234b : 8d 00 d6 STA $d600 
.l7811:
234e : 2c 00 d6 BIT $d600 
2351 : 10 fb __ BPL $234e ; (main.l7811 + 0)
.s731:
2353 : 8c 01 d6 STY $d601 
2356 : a9 1f __ LDA #$1f
2358 : 8d 00 d6 STA $d600 
235b : 8a __ __ TXA
235c : f0 46 __ BEQ $23a4 ; (main.s736 + 0)
.s1697:
235e : a2 00 __ LDX #$00
.l734:
2360 : bd 97 3f LDA $3f97,x 
2363 : c9 20 __ CMP #$20
2365 : b0 04 __ BCS $236b ; (main.s740 + 0)
.s739:
2367 : 09 80 __ ORA #$80
2369 : 90 2b __ BCC $2396 ; (main.s1509 + 0)
.s740:
236b : a8 __ __ TAY
236c : c9 40 __ CMP #$40
236e : 90 04 __ BCC $2374 ; (main.s743 + 0)
.s745:
2370 : c9 60 __ CMP #$60
2372 : 90 11 __ BCC $2385 ; (main.s742 + 0)
.s743:
2374 : c9 60 __ CMP #$60
2376 : 90 05 __ BCC $237d ; (main.s747 + 0)
.s746:
2378 : e9 20 __ SBC #$20
237a : 4c 96 23 JMP $2396 ; (main.s1509 + 0)
.s747:
237d : c9 a0 __ CMP #$a0
237f : 90 0a __ BCC $238b ; (main.s755 + 0)
.s757:
2381 : c9 c0 __ CMP #$c0
2383 : b0 06 __ BCS $238b ; (main.s755 + 0)
.s742:
2385 : 38 __ __ SEC
2386 : e9 40 __ SBC #$40
2388 : 4c 96 23 JMP $2396 ; (main.s1509 + 0)
.s755:
238b : c9 c0 __ CMP #$c0
238d : 90 08 __ BCC $2397 ; (main.l7815 + 0)
.s761:
238f : c9 ff __ CMP #$ff
2391 : b0 04 __ BCS $2397 ; (main.l7815 + 0)
.s758:
2393 : 38 __ __ SEC
2394 : e9 80 __ SBC #$80
.s1509:
2396 : a8 __ __ TAY
.l7815:
2397 : 2c 00 d6 BIT $d600 
239a : 10 fb __ BPL $2397 ; (main.l7815 + 0)
.s767:
239c : 8c 01 d6 STY $d601 
239f : e8 __ __ INX
23a0 : e4 43 __ CPX T5 + 0 
23a2 : 90 bc __ BCC $2360 ; (main.l734 + 0)
.s736:
23a4 : a9 12 __ LDA #$12
23a6 : 8d 00 d6 STA $d600 
23a9 : a6 43 __ LDX T5 + 0 
23ab : ca __ __ DEX
23ac : 86 57 __ STX T4 + 0 
23ae : ad 12 45 LDA $4512 ; (vdc_state + 11)
23b1 : ac 11 45 LDY $4511 ; (vdc_state + 10)
23b4 : ae 0e 45 LDX $450e ; (vdc_state + 7)
.l7818:
23b7 : 2c 00 d6 BIT $d600 
23ba : 10 fb __ BPL $23b7 ; (main.l7818 + 0)
.s774:
23bc : 8d 01 d6 STA $d601 
23bf : a9 13 __ LDA #$13
23c1 : 8d 00 d6 STA $d600 
.l7820:
23c4 : 2c 00 d6 BIT $d600 
23c7 : 10 fb __ BPL $23c4 ; (main.l7820 + 0)
.s779:
23c9 : 8c 01 d6 STY $d601 
23cc : a9 1f __ LDA #$1f
23ce : 8d 00 d6 STA $d600 
.l7822:
23d1 : 2c 00 d6 BIT $d600 
23d4 : 10 fb __ BPL $23d1 ; (main.l7822 + 0)
.s783:
23d6 : 8e 01 d6 STX $d601 
23d9 : a9 18 __ LDA #$18
23db : 8d 00 d6 STA $d600 
.l7824:
23de : 2c 00 d6 BIT $d600 
23e1 : 10 fb __ BPL $23de ; (main.l7824 + 0)
.s789:
23e3 : ad 01 d6 LDA $d601 
23e6 : 29 7f __ AND #$7f
23e8 : a8 __ __ TAY
23e9 : a9 18 __ LDA #$18
23eb : 8d 00 d6 STA $d600 
.l7826:
23ee : 2c 00 d6 BIT $d600 
23f1 : 10 fb __ BPL $23ee ; (main.l7826 + 0)
.s795:
23f3 : 8c 01 d6 STY $d601 
23f6 : a9 1e __ LDA #$1e
23f8 : 8d 00 d6 STA $d600 
.l7828:
23fb : 2c 00 d6 BIT $d600 
23fe : 10 fb __ BPL $23fb ; (main.l7828 + 0)
.s800:
2400 : a5 57 __ LDA T4 + 0 
2402 : 8d 01 d6 STA $d601 
2405 : 8a __ __ TXA
2406 : 29 b0 __ AND #$b0
2408 : 09 0d __ ORA #$0d
240a : 8d 0e 45 STA $450e ; (vdc_state + 7)
240d : a9 1d __ LDA #$1d
240f : a0 02 __ LDY #$02
2411 : 91 23 __ STA (SP + 0),y 
2413 : a9 45 __ LDA #$45
2415 : c8 __ __ INY
2416 : 91 23 __ STA (SP + 0),y 
2418 : a9 00 __ LDA #$00
241a : c8 __ __ INY
241b : 91 23 __ STA (SP + 0),y 
241d : a9 43 __ LDA #$43
241f : c8 __ __ INY
2420 : 91 23 __ STA (SP + 0),y 
2422 : ad 07 45 LDA $4507 ; (vdc_state + 0)
2425 : c8 __ __ INY
2426 : 91 23 __ STA (SP + 0),y 
2428 : a9 00 __ LDA #$00
242a : c8 __ __ INY
242b : 91 23 __ STA (SP + 0),y 
242d : ad 0a 45 LDA $450a ; (vdc_state + 3)
2430 : 85 53 __ STA T0 + 0 
2432 : c8 __ __ INY
2433 : 91 23 __ STA (SP + 0),y 
2435 : ad 0b 45 LDA $450b ; (vdc_state + 4)
2438 : 85 54 __ STA T0 + 1 
243a : c8 __ __ INY
243b : 91 23 __ STA (SP + 0),y 
243d : ad 0c 45 LDA $450c ; (vdc_state + 5)
2440 : c8 __ __ INY
2441 : 91 23 __ STA (SP + 0),y 
2443 : ad 0d 45 LDA $450d ; (vdc_state + 6)
2446 : c8 __ __ INY
2447 : 91 23 __ STA (SP + 0),y 
2449 : ad 08 45 LDA $4508 ; (vdc_state + 1)
244c : d0 07 __ BNE $2455 ; (main.s3652 + 0)
.s3653:
244e : a9 42 __ LDA #$42
2450 : a2 d2 __ LDX #$d2
2452 : 4c 59 24 JMP $2459 ; (main.s3654 + 0)
.s3652:
2455 : a9 42 __ LDA #$42
2457 : a2 ce __ LDX #$ce
.s3654:
2459 : 85 58 __ STA T4 + 1 
245b : 8a __ __ TXA
245c : a0 0c __ LDY #$0c
245e : 91 23 __ STA (SP + 0),y 
2460 : a5 58 __ LDA T4 + 1 
2462 : c8 __ __ INY
2463 : 91 23 __ STA (SP + 0),y 
2465 : 20 a8 3f JSR $3fa8 ; (sprintf.s1000 + 0)
2468 : 06 53 __ ASL T0 + 0 
246a : 26 54 __ ROL T0 + 1 
246c : a9 00 __ LDA #$00
246e : 85 57 __ STA T4 + 0 
2470 : ad 1d 45 LDA $451d ; (linebuffer + 0)
2473 : f0 0c __ BEQ $2481 ; (main.s809 + 0)
.s808:
2475 : a2 00 __ LDX #$00
.l1505:
2477 : bd 1e 45 LDA $451e,x ; (linebuffer + 1)
247a : e8 __ __ INX
247b : 09 00 __ ORA #$00
247d : d0 f8 __ BNE $2477 ; (main.l1505 + 0)
.s1506:
247f : 86 57 __ STX T4 + 0 
.s809:
2481 : ad 0f 45 LDA $450f ; (vdc_state + 8)
2484 : 18 __ __ CLC
2485 : 65 53 __ ADC T0 + 0 
2487 : aa __ __ TAX
2488 : a9 12 __ LDA #$12
248a : 8d 00 d6 STA $d600 
248d : ad 10 45 LDA $4510 ; (vdc_state + 9)
2490 : 65 54 __ ADC T0 + 1 
.l7833:
2492 : 2c 00 d6 BIT $d600 
2495 : 10 fb __ BPL $2492 ; (main.l7833 + 0)
.s816:
2497 : 8d 01 d6 STA $d601 
249a : a9 13 __ LDA #$13
249c : 8d 00 d6 STA $d600 
.l7835:
249f : 2c 00 d6 BIT $d600 
24a2 : 10 fb __ BPL $249f ; (main.l7835 + 0)
.s821:
24a4 : 8e 01 d6 STX $d601 
24a7 : a9 1f __ LDA #$1f
24a9 : 8d 00 d6 STA $d600 
24ac : a5 57 __ LDA T4 + 0 
24ae : f0 62 __ BEQ $2512 ; (main.s826 + 0)
.s1686:
24b0 : a2 00 __ LDX #$00
.l824:
24b2 : bd 1d 45 LDA $451d,x ; (linebuffer + 0)
24b5 : c9 20 __ CMP #$20
24b7 : b0 05 __ BCS $24be ; (main.s830 + 0)
.s829:
24b9 : 69 80 __ ADC #$80
24bb : 4c 04 25 JMP $2504 ; (main.s1510 + 0)
.s830:
24be : a8 __ __ TAY
24bf : c9 40 __ CMP #$40
24c1 : 90 04 __ BCC $24c7 ; (main.s833 + 0)
.s835:
24c3 : c9 60 __ CMP #$60
24c5 : 90 23 __ BCC $24ea ; (main.s832 + 0)
.s833:
24c7 : c9 60 __ CMP #$60
24c9 : 90 0a __ BCC $24d5 ; (main.s837 + 0)
.s839:
24cb : 09 00 __ ORA #$00
24cd : 30 06 __ BMI $24d5 ; (main.s837 + 0)
.s836:
24cf : 38 __ __ SEC
24d0 : e9 20 __ SBC #$20
24d2 : 4c 04 25 JMP $2504 ; (main.s1510 + 0)
.s837:
24d5 : c9 80 __ CMP #$80
24d7 : 90 09 __ BCC $24e2 ; (main.s841 + 0)
.s843:
24d9 : c9 a0 __ CMP #$a0
24db : b0 05 __ BCS $24e2 ; (main.s841 + 0)
.s840:
24dd : 69 40 __ ADC #$40
24df : 4c 04 25 JMP $2504 ; (main.s1510 + 0)
.s841:
24e2 : c9 a0 __ CMP #$a0
24e4 : 90 0a __ BCC $24f0 ; (main.s845 + 0)
.s847:
24e6 : c9 c0 __ CMP #$c0
24e8 : b0 06 __ BCS $24f0 ; (main.s845 + 0)
.s832:
24ea : 38 __ __ SEC
24eb : e9 40 __ SBC #$40
24ed : 4c 04 25 JMP $2504 ; (main.s1510 + 0)
.s845:
24f0 : c9 c0 __ CMP #$c0
24f2 : 90 0a __ BCC $24fe ; (main.s849 + 0)
.s851:
24f4 : c9 ff __ CMP #$ff
24f6 : b0 06 __ BCS $24fe ; (main.s849 + 0)
.s848:
24f8 : 38 __ __ SEC
24f9 : e9 80 __ SBC #$80
24fb : 4c 04 25 JMP $2504 ; (main.s1510 + 0)
.s849:
24fe : c9 ff __ CMP #$ff
2500 : d0 03 __ BNE $2505 ; (main.l7839 + 0)
.s852:
2502 : a9 5e __ LDA #$5e
.s1510:
2504 : a8 __ __ TAY
.l7839:
2505 : 2c 00 d6 BIT $d600 
2508 : 10 fb __ BPL $2505 ; (main.l7839 + 0)
.s857:
250a : 8c 01 d6 STY $d601 
250d : e8 __ __ INX
250e : e4 57 __ CPX T4 + 0 
2510 : 90 a0 __ BCC $24b2 ; (main.l824 + 0)
.s826:
2512 : a9 12 __ LDA #$12
2514 : 8d 00 d6 STA $d600 
2517 : c6 57 __ DEC T4 + 0 
2519 : 18 __ __ CLC
251a : a5 53 __ LDA T0 + 0 
251c : 6d 11 45 ADC $4511 ; (vdc_state + 10)
251f : a8 __ __ TAY
2520 : a5 54 __ LDA T0 + 1 
2522 : 6d 12 45 ADC $4512 ; (vdc_state + 11)
2525 : ae 0e 45 LDX $450e ; (vdc_state + 7)
.l7842:
2528 : 2c 00 d6 BIT $d600 
252b : 10 fb __ BPL $2528 ; (main.l7842 + 0)
.s864:
252d : 8d 01 d6 STA $d601 
2530 : a9 13 __ LDA #$13
2532 : 8d 00 d6 STA $d600 
.l7844:
2535 : 2c 00 d6 BIT $d600 
2538 : 10 fb __ BPL $2535 ; (main.l7844 + 0)
.s869:
253a : 8c 01 d6 STY $d601 
253d : a9 1f __ LDA #$1f
253f : 8d 00 d6 STA $d600 
.l7846:
2542 : 2c 00 d6 BIT $d600 
2545 : 10 fb __ BPL $2542 ; (main.l7846 + 0)
.s873:
2547 : 8e 01 d6 STX $d601 
254a : a9 18 __ LDA #$18
254c : 8d 00 d6 STA $d600 
.l7848:
254f : 2c 00 d6 BIT $d600 
2552 : 10 fb __ BPL $254f ; (main.l7848 + 0)
.s879:
2554 : ad 01 d6 LDA $d601 
2557 : 29 7f __ AND #$7f
2559 : aa __ __ TAX
255a : a9 18 __ LDA #$18
255c : 8d 00 d6 STA $d600 
.l7850:
255f : 2c 00 d6 BIT $d600 
2562 : 10 fb __ BPL $255f ; (main.l7850 + 0)
.s885:
2564 : 8e 01 d6 STX $d601 
2567 : a9 1e __ LDA #$1e
2569 : 8d 00 d6 STA $d600 
.l7852:
256c : 2c 00 d6 BIT $d600 
256f : 10 fb __ BPL $256c ; (main.l7852 + 0)
.s890:
2571 : a5 57 __ LDA T4 + 0 
2573 : 8d 01 d6 STA $d601 
2576 : ad 0a 45 LDA $450a ; (vdc_state + 3)
2579 : 0a __ __ ASL
257a : aa __ __ TAX
257b : a9 12 __ LDA #$12
257d : 8d 00 d6 STA $d600 
2580 : ad 0b 45 LDA $450b ; (vdc_state + 4)
2583 : 2a __ __ ROL
2584 : a8 __ __ TAY
2585 : 8a __ __ TXA
2586 : 18 __ __ CLC
2587 : 6d 0a 45 ADC $450a ; (vdc_state + 3)
258a : aa __ __ TAX
258b : 98 __ __ TYA
258c : 6d 0b 45 ADC $450b ; (vdc_state + 4)
258f : a8 __ __ TAY
2590 : 8a __ __ TXA
2591 : 18 __ __ CLC
2592 : 69 04 __ ADC #$04
2594 : 85 45 __ STA T7 + 0 
2596 : 98 __ __ TYA
2597 : 69 00 __ ADC #$00
2599 : 85 46 __ STA T7 + 1 
259b : 18 __ __ CLC
259c : a5 45 __ LDA T7 + 0 
259e : 6d 0f 45 ADC $450f ; (vdc_state + 8)
25a1 : 85 47 __ STA T8 + 0 
25a3 : a5 46 __ LDA T7 + 1 
25a5 : 6d 10 45 ADC $4510 ; (vdc_state + 9)
.l7854:
25a8 : 2c 00 d6 BIT $d600 
25ab : 10 fb __ BPL $25a8 ; (main.l7854 + 0)
.s900:
25ad : 8d 01 d6 STA $d601 
25b0 : a9 13 __ LDA #$13
25b2 : 8d 00 d6 STA $d600 
.l7856:
25b5 : 2c 00 d6 BIT $d600 
25b8 : 10 fb __ BPL $25b5 ; (main.l7856 + 0)
.s905:
25ba : a5 47 __ LDA T8 + 0 
25bc : 8d 01 d6 STA $d601 
25bf : a9 1f __ LDA #$1f
25c1 : 8d 00 d6 STA $d600 
.l7858:
25c4 : 2c 00 d6 BIT $d600 
25c7 : 10 fb __ BPL $25c4 ; (main.l7858 + 0)
.s909:
25c9 : a9 6c __ LDA #$6c
25cb : 8d 01 d6 STA $d601 
25ce : a9 12 __ LDA #$12
25d0 : 8d 00 d6 STA $d600 
25d3 : 18 __ __ CLC
25d4 : a5 45 __ LDA T7 + 0 
25d6 : 6d 11 45 ADC $4511 ; (vdc_state + 10)
25d9 : 85 45 __ STA T7 + 0 
25db : a5 46 __ LDA T7 + 1 
25dd : 6d 12 45 ADC $4512 ; (vdc_state + 11)
.l7860:
25e0 : 2c 00 d6 BIT $d600 
25e3 : 10 fb __ BPL $25e0 ; (main.l7860 + 0)
.s916:
25e5 : 8d 01 d6 STA $d601 
25e8 : a9 13 __ LDA #$13
25ea : 8d 00 d6 STA $d600 
.l7862:
25ed : 2c 00 d6 BIT $d600 
25f0 : 10 fb __ BPL $25ed ; (main.l7862 + 0)
.s921:
25f2 : a5 45 __ LDA T7 + 0 
25f4 : 8d 01 d6 STA $d601 
25f7 : a9 1f __ LDA #$1f
25f9 : 8d 00 d6 STA $d600 
.l7864:
25fc : 2c 00 d6 BIT $d600 
25ff : 10 fb __ BPL $25fc ; (main.l7864 + 0)
.s925:
2601 : a9 09 __ LDA #$09
2603 : 8d 01 d6 STA $d601 
2606 : a9 12 __ LDA #$12
2608 : 8d 00 d6 STA $d600 
260b : 8a __ __ TXA
260c : 18 __ __ CLC
260d : 69 05 __ ADC #$05
260f : 85 45 __ STA T7 + 0 
2611 : 98 __ __ TYA
2612 : 69 00 __ ADC #$00
2614 : 85 46 __ STA T7 + 1 
2616 : 18 __ __ CLC
2617 : a5 45 __ LDA T7 + 0 
2619 : 6d 0f 45 ADC $450f ; (vdc_state + 8)
261c : 85 47 __ STA T8 + 0 
261e : a5 46 __ LDA T7 + 1 
2620 : 6d 10 45 ADC $4510 ; (vdc_state + 9)
.l7866:
2623 : 2c 00 d6 BIT $d600 
2626 : 10 fb __ BPL $2623 ; (main.l7866 + 0)
.s935:
2628 : 8d 01 d6 STA $d601 
262b : a9 13 __ LDA #$13
262d : 8d 00 d6 STA $d600 
.l7868:
2630 : 2c 00 d6 BIT $d600 
2633 : 10 fb __ BPL $2630 ; (main.l7868 + 0)
.s940:
2635 : a5 47 __ LDA T8 + 0 
2637 : 8d 01 d6 STA $d601 
263a : a9 1f __ LDA #$1f
263c : 8d 00 d6 STA $d600 
.l7870:
263f : 2c 00 d6 BIT $d600 
2642 : 10 fb __ BPL $263f ; (main.l7870 + 0)
.s944:
2644 : a9 62 __ LDA #$62
2646 : 8d 01 d6 STA $d601 
2649 : a9 18 __ LDA #$18
264b : 8d 00 d6 STA $d600 
.l7872:
264e : 2c 00 d6 BIT $d600 
2651 : 10 fb __ BPL $264e ; (main.l7872 + 0)
.s950:
2653 : ad 01 d6 LDA $d601 
2656 : 29 7f __ AND #$7f
2658 : 85 47 __ STA T8 + 0 
265a : a9 18 __ LDA #$18
265c : 8d 00 d6 STA $d600 
.l7874:
265f : 2c 00 d6 BIT $d600 
2662 : 10 fb __ BPL $265f ; (main.l7874 + 0)
.s956:
2664 : a5 47 __ LDA T8 + 0 
2666 : 8d 01 d6 STA $d601 
2669 : a9 1e __ LDA #$1e
266b : 8d 00 d6 STA $d600 
.l7876:
266e : 2c 00 d6 BIT $d600 
2671 : 10 fb __ BPL $266e ; (main.l7876 + 0)
.s961:
2673 : a9 45 __ LDA #$45
2675 : 8d 01 d6 STA $d601 
2678 : a9 12 __ LDA #$12
267a : 8d 00 d6 STA $d600 
267d : 18 __ __ CLC
267e : a5 45 __ LDA T7 + 0 
2680 : 6d 11 45 ADC $4511 ; (vdc_state + 10)
2683 : 85 45 __ STA T7 + 0 
2685 : a5 46 __ LDA T7 + 1 
2687 : 6d 12 45 ADC $4512 ; (vdc_state + 11)
.l7878:
268a : 2c 00 d6 BIT $d600 
268d : 10 fb __ BPL $268a ; (main.l7878 + 0)
.s968:
268f : 8d 01 d6 STA $d601 
2692 : a9 13 __ LDA #$13
2694 : 8d 00 d6 STA $d600 
.l7880:
2697 : 2c 00 d6 BIT $d600 
269a : 10 fb __ BPL $2697 ; (main.l7880 + 0)
.s973:
269c : a5 45 __ LDA T7 + 0 
269e : 8d 01 d6 STA $d601 
26a1 : a9 1f __ LDA #$1f
26a3 : 8d 00 d6 STA $d600 
.l7882:
26a6 : 2c 00 d6 BIT $d600 
26a9 : 10 fb __ BPL $26a6 ; (main.l7882 + 0)
.s977:
26ab : a9 09 __ LDA #$09
26ad : 8d 01 d6 STA $d601 
26b0 : a9 18 __ LDA #$18
26b2 : 8d 00 d6 STA $d600 
.l7884:
26b5 : 2c 00 d6 BIT $d600 
26b8 : 10 fb __ BPL $26b5 ; (main.l7884 + 0)
.s983:
26ba : ad 01 d6 LDA $d601 
26bd : 29 7f __ AND #$7f
26bf : 85 45 __ STA T7 + 0 
26c1 : a9 18 __ LDA #$18
26c3 : 8d 00 d6 STA $d600 
.l7886:
26c6 : 2c 00 d6 BIT $d600 
26c9 : 10 fb __ BPL $26c6 ; (main.l7886 + 0)
.s989:
26cb : a5 45 __ LDA T7 + 0 
26cd : 8d 01 d6 STA $d601 
26d0 : a9 1e __ LDA #$1e
26d2 : 8d 00 d6 STA $d600 
.l7888:
26d5 : 2c 00 d6 BIT $d600 
26d8 : 10 fb __ BPL $26d5 ; (main.l7888 + 0)
.s994:
26da : a9 45 __ LDA #$45
26dc : 8d 01 d6 STA $d601 
26df : a9 12 __ LDA #$12
26e1 : 8d 00 d6 STA $d600 
26e4 : 8a __ __ TXA
26e5 : 18 __ __ CLC
26e6 : 69 4b __ ADC #$4b
26e8 : aa __ __ TAX
26e9 : 90 01 __ BCC $26ec ; (main.s1520 + 0)
.s1519:
26eb : c8 __ __ INY
.s1520:
26ec : 18 __ __ CLC
26ed : 6d 0f 45 ADC $450f ; (vdc_state + 8)
26f0 : 85 57 __ STA T4 + 0 
26f2 : 98 __ __ TYA
26f3 : 6d 10 45 ADC $4510 ; (vdc_state + 9)
.l7890:
26f6 : 2c 00 d6 BIT $d600 
26f9 : 10 fb __ BPL $26f6 ; (main.l7890 + 0)
.s1004:
26fb : 8d 01 d6 STA $d601 
26fe : a9 13 __ LDA #$13
2700 : 8d 00 d6 STA $d600 
.l7892:
2703 : 2c 00 d6 BIT $d600 
2706 : 10 fb __ BPL $2703 ; (main.l7892 + 0)
.s1009:
2708 : a5 57 __ LDA T4 + 0 
270a : 8d 01 d6 STA $d601 
270d : a9 1f __ LDA #$1f
270f : 8d 00 d6 STA $d600 
.l7894:
2712 : 2c 00 d6 BIT $d600 
2715 : 10 fb __ BPL $2712 ; (main.l7894 + 0)
.s1013:
2717 : a9 7b __ LDA #$7b
2719 : 8d 01 d6 STA $d601 
271c : a9 12 __ LDA #$12
271e : 8d 00 d6 STA $d600 
2721 : 8a __ __ TXA
2722 : 18 __ __ CLC
2723 : 6d 11 45 ADC $4511 ; (vdc_state + 10)
2726 : aa __ __ TAX
2727 : 98 __ __ TYA
2728 : 6d 12 45 ADC $4512 ; (vdc_state + 11)
.l7896:
272b : 2c 00 d6 BIT $d600 
272e : 10 fb __ BPL $272b ; (main.l7896 + 0)
.s1020:
2730 : 8d 01 d6 STA $d601 
2733 : a9 13 __ LDA #$13
2735 : 8d 00 d6 STA $d600 
.l7898:
2738 : 2c 00 d6 BIT $d600 
273b : 10 fb __ BPL $2738 ; (main.l7898 + 0)
.s1025:
273d : 8e 01 d6 STX $d601 
2740 : a9 1f __ LDA #$1f
2742 : 8d 00 d6 STA $d600 
.l7900:
2745 : 2c 00 d6 BIT $d600 
2748 : 10 fb __ BPL $2745 ; (main.l7900 + 0)
.s1029:
274a : a9 09 __ LDA #$09
274c : 8d 01 d6 STA $d601 
274f : ad 0c 45 LDA $450c ; (vdc_state + 5)
2752 : 38 __ __ SEC
2753 : e9 05 __ SBC #$05
2755 : 85 53 __ STA T0 + 0 
2757 : a9 04 __ LDA #$04
2759 : 85 59 __ STA T6 + 0 
.l1031:
275b : 18 __ __ CLC
275c : a5 53 __ LDA T0 + 0 
275e : 69 04 __ ADC #$04
2760 : 90 03 __ BCC $2765 ; (main.s1185 + 0)
2762 : 4c d8 2e JMP $2ed8 ; (main.s1032 + 0)
.s1185:
2765 : c5 59 __ CMP T6 + 0 
2767 : 90 05 __ BCC $276e ; (main.s1030 + 0)
.s1521:
2769 : f0 03 __ BEQ $276e ; (main.s1030 + 0)
276b : 4c d8 2e JMP $2ed8 ; (main.s1032 + 0)
.s1030:
276e : ad 0c 45 LDA $450c ; (vdc_state + 5)
2771 : 38 __ __ SEC
2772 : e9 05 __ SBC #$05
2774 : 85 53 __ STA T0 + 0 
2776 : a9 04 __ LDA #$04
2778 : 85 59 __ STA T6 + 0 
.l1071:
277a : 18 __ __ CLC
277b : a5 53 __ LDA T0 + 0 
277d : 69 04 __ ADC #$04
277f : 85 45 __ STA T7 + 0 
2781 : ad 0a 45 LDA $450a ; (vdc_state + 3)
2784 : 85 57 __ STA T4 + 0 
2786 : ad 0b 45 LDA $450b ; (vdc_state + 4)
2789 : 85 58 __ STA T4 + 1 
278b : ad 0f 45 LDA $450f ; (vdc_state + 8)
278e : 85 43 __ STA T5 + 0 
2790 : ad 10 45 LDA $4510 ; (vdc_state + 9)
2793 : 85 44 __ STA T5 + 1 
2795 : 90 03 __ BCC $279a ; (main.s1171 + 0)
2797 : 4c 51 2e JMP $2e51 ; (main.s1072 + 0)
.s1171:
279a : a5 59 __ LDA T6 + 0 
279c : c5 45 __ CMP T7 + 0 
279e : b0 03 __ BCS $27a3 ; (main.s1070 + 0)
27a0 : 4c 51 2e JMP $2e51 ; (main.s1072 + 0)
.s1070:
27a3 : a9 12 __ LDA #$12
27a5 : 8d 00 d6 STA $d600 
27a8 : ad 0c 45 LDA $450c ; (vdc_state + 5)
27ab : e9 01 __ SBC #$01
27ad : 85 53 __ STA T0 + 0 
27af : ad 0d 45 LDA $450d ; (vdc_state + 6)
27b2 : e9 00 __ SBC #$00
27b4 : 85 54 __ STA T0 + 1 
27b6 : a5 57 __ LDA T4 + 0 
27b8 : 85 1b __ STA ACCU + 0 
27ba : a5 58 __ LDA T4 + 1 
27bc : 85 1c __ STA ACCU + 1 
27be : a5 53 __ LDA T0 + 0 
27c0 : 20 d6 42 JSR $42d6 ; (mul16by8 + 0)
27c3 : 18 __ __ CLC
27c4 : a5 05 __ LDA WORK + 2 
27c6 : 69 04 __ ADC #$04
27c8 : aa __ __ TAX
27c9 : a5 06 __ LDA WORK + 3 
27cb : 69 00 __ ADC #$00
27cd : a8 __ __ TAY
27ce : 8a __ __ TXA
27cf : 18 __ __ CLC
27d0 : 65 43 __ ADC T5 + 0 
27d2 : 85 49 __ STA T9 + 0 
27d4 : 98 __ __ TYA
27d5 : 65 44 __ ADC T5 + 1 
.l7928:
27d7 : 2c 00 d6 BIT $d600 
27da : 10 fb __ BPL $27d7 ; (main.l7928 + 0)
.s1119:
27dc : 8d 01 d6 STA $d601 
27df : a9 13 __ LDA #$13
27e1 : 8d 00 d6 STA $d600 
.l7930:
27e4 : 2c 00 d6 BIT $d600 
27e7 : 10 fb __ BPL $27e4 ; (main.l7930 + 0)
.s1124:
27e9 : a5 49 __ LDA T9 + 0 
27eb : 8d 01 d6 STA $d601 
27ee : a9 1f __ LDA #$1f
27f0 : 8d 00 d6 STA $d600 
.l7932:
27f3 : 2c 00 d6 BIT $d600 
27f6 : 10 fb __ BPL $27f3 ; (main.l7932 + 0)
.s1128:
27f8 : a9 7c __ LDA #$7c
27fa : 8d 01 d6 STA $d601 
27fd : a9 12 __ LDA #$12
27ff : 8d 00 d6 STA $d600 
2802 : 8a __ __ TXA
2803 : 18 __ __ CLC
2804 : 6d 11 45 ADC $4511 ; (vdc_state + 10)
2807 : aa __ __ TAX
2808 : 98 __ __ TYA
2809 : 6d 12 45 ADC $4512 ; (vdc_state + 11)
.l7934:
280c : 2c 00 d6 BIT $d600 
280f : 10 fb __ BPL $280c ; (main.l7934 + 0)
.s1135:
2811 : 8d 01 d6 STA $d601 
2814 : a9 13 __ LDA #$13
2816 : 8d 00 d6 STA $d600 
.l7936:
2819 : 2c 00 d6 BIT $d600 
281c : 10 fb __ BPL $2819 ; (main.l7936 + 0)
.s1140:
281e : 8e 01 d6 STX $d601 
2821 : a9 1f __ LDA #$1f
2823 : 8d 00 d6 STA $d600 
.l7938:
2826 : 2c 00 d6 BIT $d600 
2829 : 10 fb __ BPL $2826 ; (main.l7938 + 0)
.s1144:
282b : a9 09 __ LDA #$09
282d : 8d 01 d6 STA $d601 
2830 : a9 12 __ LDA #$12
2832 : 8d 00 d6 STA $d600 
2835 : 18 __ __ CLC
2836 : a5 05 __ LDA WORK + 2 
2838 : 69 05 __ ADC #$05
283a : aa __ __ TAX
283b : a5 06 __ LDA WORK + 3 
283d : 69 00 __ ADC #$00
283f : a8 __ __ TAY
2840 : 8a __ __ TXA
2841 : 18 __ __ CLC
2842 : 65 43 __ ADC T5 + 0 
2844 : 85 4c __ STA T11 + 0 
2846 : 98 __ __ TYA
2847 : 65 44 __ ADC T5 + 1 
.l7940:
2849 : 2c 00 d6 BIT $d600 
284c : 10 fb __ BPL $2849 ; (main.l7940 + 0)
.s1154:
284e : 8d 01 d6 STA $d601 
2851 : a9 13 __ LDA #$13
2853 : 8d 00 d6 STA $d600 
.l7942:
2856 : 2c 00 d6 BIT $d600 
2859 : 10 fb __ BPL $2856 ; (main.l7942 + 0)
.s1159:
285b : a5 4c __ LDA T11 + 0 
285d : 8d 01 d6 STA $d601 
2860 : a9 1f __ LDA #$1f
2862 : 8d 00 d6 STA $d600 
.l7944:
2865 : 2c 00 d6 BIT $d600 
2868 : 10 fb __ BPL $2865 ; (main.l7944 + 0)
.s1163:
286a : a9 e2 __ LDA #$e2
286c : 8d 01 d6 STA $d601 
286f : a9 18 __ LDA #$18
2871 : 8d 00 d6 STA $d600 
.l7946:
2874 : 2c 00 d6 BIT $d600 
2877 : 10 fb __ BPL $2874 ; (main.l7946 + 0)
.s1169:
2879 : ad 01 d6 LDA $d601 
287c : 29 7f __ AND #$7f
287e : 85 4c __ STA T11 + 0 
2880 : a9 18 __ LDA #$18
2882 : 8d 00 d6 STA $d600 
.l7948:
2885 : 2c 00 d6 BIT $d600 
2888 : 10 fb __ BPL $2885 ; (main.l7948 + 0)
.s1175:
288a : a5 4c __ LDA T11 + 0 
288c : 8d 01 d6 STA $d601 
288f : a9 1e __ LDA #$1e
2891 : 8d 00 d6 STA $d600 
.l7950:
2894 : 2c 00 d6 BIT $d600 
2897 : 10 fb __ BPL $2894 ; (main.l7950 + 0)
.s1180:
2899 : a9 45 __ LDA #$45
289b : 8d 01 d6 STA $d601 
289e : a9 12 __ LDA #$12
28a0 : 8d 00 d6 STA $d600 
28a3 : 8a __ __ TXA
28a4 : 18 __ __ CLC
28a5 : 6d 11 45 ADC $4511 ; (vdc_state + 10)
28a8 : aa __ __ TAX
28a9 : 98 __ __ TYA
28aa : 6d 12 45 ADC $4512 ; (vdc_state + 11)
.l7952:
28ad : 2c 00 d6 BIT $d600 
28b0 : 10 fb __ BPL $28ad ; (main.l7952 + 0)
.s1187:
28b2 : 8d 01 d6 STA $d601 
28b5 : a9 13 __ LDA #$13
28b7 : 8d 00 d6 STA $d600 
.l7954:
28ba : 2c 00 d6 BIT $d600 
28bd : 10 fb __ BPL $28ba ; (main.l7954 + 0)
.s1192:
28bf : 8e 01 d6 STX $d601 
28c2 : a9 1f __ LDA #$1f
28c4 : 8d 00 d6 STA $d600 
.l7956:
28c7 : 2c 00 d6 BIT $d600 
28ca : 10 fb __ BPL $28c7 ; (main.l7956 + 0)
.s1196:
28cc : a9 09 __ LDA #$09
28ce : 8d 01 d6 STA $d601 
28d1 : a9 18 __ LDA #$18
28d3 : 8d 00 d6 STA $d600 
.l7958:
28d6 : 2c 00 d6 BIT $d600 
28d9 : 10 fb __ BPL $28d6 ; (main.l7958 + 0)
.s1202:
28db : ad 01 d6 LDA $d601 
28de : 29 7f __ AND #$7f
28e0 : aa __ __ TAX
28e1 : a9 18 __ LDA #$18
28e3 : 8d 00 d6 STA $d600 
.l7960:
28e6 : 2c 00 d6 BIT $d600 
28e9 : 10 fb __ BPL $28e6 ; (main.l7960 + 0)
.s1208:
28eb : 8e 01 d6 STX $d601 
28ee : a9 1e __ LDA #$1e
28f0 : 8d 00 d6 STA $d600 
.l7962:
28f3 : 2c 00 d6 BIT $d600 
28f6 : 10 fb __ BPL $28f3 ; (main.l7962 + 0)
.s1213:
28f8 : a9 45 __ LDA #$45
28fa : 8d 01 d6 STA $d601 
28fd : a9 12 __ LDA #$12
28ff : 8d 00 d6 STA $d600 
2902 : 18 __ __ CLC
2903 : a5 05 __ LDA WORK + 2 
2905 : 69 4b __ ADC #$4b
2907 : aa __ __ TAX
2908 : a5 06 __ LDA WORK + 3 
290a : 69 00 __ ADC #$00
290c : a8 __ __ TAY
290d : 8a __ __ TXA
290e : 18 __ __ CLC
290f : 65 43 __ ADC T5 + 0 
2911 : 85 47 __ STA T8 + 0 
2913 : 98 __ __ TYA
2914 : 65 44 __ ADC T5 + 1 
.l7964:
2916 : 2c 00 d6 BIT $d600 
2919 : 10 fb __ BPL $2916 ; (main.l7964 + 0)
.s1223:
291b : 8d 01 d6 STA $d601 
291e : a9 13 __ LDA #$13
2920 : 8d 00 d6 STA $d600 
.l7966:
2923 : 2c 00 d6 BIT $d600 
2926 : 10 fb __ BPL $2923 ; (main.l7966 + 0)
.s1228:
2928 : a5 47 __ LDA T8 + 0 
292a : 8d 01 d6 STA $d601 
292d : a9 1f __ LDA #$1f
292f : 8d 00 d6 STA $d600 
.l7968:
2932 : 2c 00 d6 BIT $d600 
2935 : 10 fb __ BPL $2932 ; (main.l7968 + 0)
.s1232:
2937 : a9 7e __ LDA #$7e
2939 : 8d 01 d6 STA $d601 
293c : a9 12 __ LDA #$12
293e : 8d 00 d6 STA $d600 
2941 : 8a __ __ TXA
2942 : 18 __ __ CLC
2943 : 6d 11 45 ADC $4511 ; (vdc_state + 10)
2946 : aa __ __ TAX
2947 : 98 __ __ TYA
2948 : 6d 12 45 ADC $4512 ; (vdc_state + 11)
.l7970:
294b : 2c 00 d6 BIT $d600 
294e : 10 fb __ BPL $294b ; (main.l7970 + 0)
.s1239:
2950 : 8d 01 d6 STA $d601 
2953 : a9 13 __ LDA #$13
2955 : 8d 00 d6 STA $d600 
.l7972:
2958 : 2c 00 d6 BIT $d600 
295b : 10 fb __ BPL $2958 ; (main.l7972 + 0)
.s1244:
295d : 8e 01 d6 STX $d601 
2960 : a9 1f __ LDA #$1f
2962 : 8d 00 d6 STA $d600 
.l7974:
2965 : 2c 00 d6 BIT $d600 
2968 : 10 fb __ BPL $2965 ; (main.l7974 + 0)
.s1248:
296a : a9 09 __ LDA #$09
296c : 8d 01 d6 STA $d601 
296f : a5 54 __ LDA T0 + 1 
2971 : d0 06 __ BNE $2979 ; (main.s1628 + 0)
.s1110:
2973 : a9 04 __ LDA #$04
2975 : c5 53 __ CMP T0 + 0 
2977 : b0 0f __ BCS $2988 ; (main.s1252 + 0)
.s1628:
2979 : a5 57 __ LDA T4 + 0 
297b : 85 53 __ STA T0 + 0 
297d : a5 58 __ LDA T4 + 1 
297f : 85 54 __ STA T0 + 1 
2981 : a9 04 __ LDA #$04
2983 : 85 59 __ STA T6 + 0 
2985 : 4c 84 2d JMP $2d84 ; (main.l1250 + 0)
.s1252:
2988 : ad 0c 45 LDA $450c ; (vdc_state + 5)
298b : e9 05 __ SBC #$05
298d : 85 53 __ STA T0 + 0 
298f : ad 0d 45 LDA $450d ; (vdc_state + 6)
2992 : e9 00 __ SBC #$00
2994 : 05 53 __ ORA T0 + 0 
2996 : f0 03 __ BEQ $299b ; (main.s637 + 0)
2998 : 4c d4 2a JMP $2ad4 ; (main.s1620 + 0)
.s637:
299b : e6 52 __ INC T1 + 0 
299d : a5 52 __ LDA T1 + 0 
299f : c9 02 __ CMP #$02
29a1 : b0 0f __ BCS $29b2 ; (main.s638 + 0)
.s636:
29a3 : 09 00 __ ORA #$00
29a5 : d0 03 __ BNE $29aa ; (main.s639 + 0)
29a7 : 4c 66 22 JMP $2266 ; (main.l641 + 0)
.s639:
29aa : 85 16 __ STA P9 
29ac : 20 ef 3a JSR $3aef ; (vdc_set_mode.s1000 + 0)
29af : 4c 66 22 JMP $2266 ; (main.l641 + 0)
.s638:
29b2 : a9 00 __ LDA #$00
29b4 : 85 52 __ STA T1 + 0 
29b6 : 8d 30 d0 STA $d030 
29b9 : 85 16 __ STA P9 
29bb : ad 11 d0 LDA $d011 
29be : 29 7f __ AND #$7f
29c0 : 09 10 __ ORA #$10
29c2 : 8d 11 d0 STA $d011 
29c5 : 20 ef 3a JSR $3aef ; (vdc_set_mode.s1000 + 0)
29c8 : ad 0a 45 LDA $450a ; (vdc_state + 3)
29cb : 85 53 __ STA T0 + 0 
29cd : ad 0c 45 LDA $450c ; (vdc_state + 5)
29d0 : 85 57 __ STA T4 + 0 
.l1469:
29d2 : a5 52 __ LDA T1 + 0 
29d4 : c5 57 __ CMP T4 + 0 
29d6 : 90 1c __ BCC $29f4 ; (main.s1470 + 0)
.s1462:
29d8 : a9 00 __ LDA #$00
29da : 85 1b __ STA ACCU + 0 
29dc : 85 1c __ STA ACCU + 1 
.s1001:
29de : 18 __ __ CLC
29df : a5 23 __ LDA SP + 0 
29e1 : 69 0e __ ADC #$0e
29e3 : 85 23 __ STA SP + 0 
29e5 : 90 02 __ BCC $29e9 ; (main.s1001 + 11)
29e7 : e6 24 __ INC SP + 1 
29e9 : a2 06 __ LDX #$06
29eb : bd 45 bf LDA $bf45,x ; (main@stack + 0)
29ee : 95 53 __ STA T0 + 0,x 
29f0 : ca __ __ DEX
29f1 : 10 f8 __ BPL $29eb ; (main.s1001 + 13)
29f3 : 60 __ __ RTS
.s1470:
29f4 : ad 0a 45 LDA $450a ; (vdc_state + 3)
29f7 : 85 1b __ STA ACCU + 0 
29f9 : ad 0b 45 LDA $450b ; (vdc_state + 4)
29fc : 85 1c __ STA ACCU + 1 
29fe : ad 0e 45 LDA $450e ; (vdc_state + 7)
2a01 : 85 55 __ STA T2 + 0 
2a03 : a9 12 __ LDA #$12
2a05 : 8d 00 d6 STA $d600 
2a08 : a6 53 __ LDX T0 + 0 
2a0a : ca __ __ DEX
2a0b : 86 47 __ STX T8 + 0 
2a0d : a5 52 __ LDA T1 + 0 
2a0f : 20 d6 42 JSR $42d6 ; (mul16by8 + 0)
2a12 : 18 __ __ CLC
2a13 : a5 05 __ LDA WORK + 2 
2a15 : 6d 0f 45 ADC $450f ; (vdc_state + 8)
2a18 : aa __ __ TAX
2a19 : a5 06 __ LDA WORK + 3 
2a1b : 6d 10 45 ADC $4510 ; (vdc_state + 9)
.l8051:
2a1e : 2c 00 d6 BIT $d600 
2a21 : 10 fb __ BPL $2a1e ; (main.l8051 + 0)
.s1482:
2a23 : 8d 01 d6 STA $d601 
2a26 : a9 13 __ LDA #$13
2a28 : 8d 00 d6 STA $d600 
.l8053:
2a2b : 2c 00 d6 BIT $d600 
2a2e : 10 fb __ BPL $2a2b ; (main.l8053 + 0)
.s1487:
2a30 : 8e 01 d6 STX $d601 
2a33 : a9 1f __ LDA #$1f
2a35 : 8d 00 d6 STA $d600 
.l8055:
2a38 : 2c 00 d6 BIT $d600 
2a3b : 10 fb __ BPL $2a38 ; (main.l8055 + 0)
.s1491:
2a3d : a9 20 __ LDA #$20
2a3f : 8d 01 d6 STA $d601 
2a42 : a9 18 __ LDA #$18
2a44 : 8d 00 d6 STA $d600 
.l8057:
2a47 : 2c 00 d6 BIT $d600 
2a4a : 10 fb __ BPL $2a47 ; (main.l8057 + 0)
.s1497:
2a4c : ad 01 d6 LDA $d601 
2a4f : 29 7f __ AND #$7f
2a51 : aa __ __ TAX
2a52 : a9 18 __ LDA #$18
2a54 : 8d 00 d6 STA $d600 
.l8059:
2a57 : 2c 00 d6 BIT $d600 
2a5a : 10 fb __ BPL $2a57 ; (main.l8059 + 0)
.s1503:
2a5c : 8e 01 d6 STX $d601 
2a5f : a9 1e __ LDA #$1e
2a61 : 8d 00 d6 STA $d600 
.l8061:
2a64 : 2c 00 d6 BIT $d600 
2a67 : 10 fb __ BPL $2a64 ; (main.l8061 + 0)
.s1508:
2a69 : a5 47 __ LDA T8 + 0 
2a6b : 8d 01 d6 STA $d601 
2a6e : ad 11 45 LDA $4511 ; (vdc_state + 10)
2a71 : 18 __ __ CLC
2a72 : 65 05 __ ADC WORK + 2 
2a74 : aa __ __ TAX
2a75 : a9 12 __ LDA #$12
2a77 : 8d 00 d6 STA $d600 
2a7a : ad 12 45 LDA $4512 ; (vdc_state + 11)
2a7d : 65 06 __ ADC WORK + 3 
.l8063:
2a7f : 2c 00 d6 BIT $d600 
2a82 : 10 fb __ BPL $2a7f ; (main.l8063 + 0)
.s1515:
2a84 : 8d 01 d6 STA $d601 
2a87 : a9 13 __ LDA #$13
2a89 : 8d 00 d6 STA $d600 
.l8065:
2a8c : 2c 00 d6 BIT $d600 
2a8f : 10 fb __ BPL $2a8c ; (main.l8065 + 0)
.s1520:
2a91 : 8e 01 d6 STX $d601 
2a94 : a9 1f __ LDA #$1f
2a96 : 8d 00 d6 STA $d600 
.l8067:
2a99 : 2c 00 d6 BIT $d600 
2a9c : 10 fb __ BPL $2a99 ; (main.l8067 + 0)
.s1524:
2a9e : a5 55 __ LDA T2 + 0 
2aa0 : 8d 01 d6 STA $d601 
2aa3 : a9 18 __ LDA #$18
2aa5 : 8d 00 d6 STA $d600 
.l8069:
2aa8 : 2c 00 d6 BIT $d600 
2aab : 10 fb __ BPL $2aa8 ; (main.l8069 + 0)
.s1530:
2aad : ad 01 d6 LDA $d601 
2ab0 : 29 7f __ AND #$7f
2ab2 : aa __ __ TAX
2ab3 : a9 18 __ LDA #$18
2ab5 : 8d 00 d6 STA $d600 
.l8071:
2ab8 : 2c 00 d6 BIT $d600 
2abb : 10 fb __ BPL $2ab8 ; (main.l8071 + 0)
.s1536:
2abd : 8e 01 d6 STX $d601 
2ac0 : a9 1e __ LDA #$1e
2ac2 : 8d 00 d6 STA $d600 
.l8073:
2ac5 : 2c 00 d6 BIT $d600 
2ac8 : 10 fb __ BPL $2ac5 ; (main.l8073 + 0)
.s1541:
2aca : a5 47 __ LDA T8 + 0 
2acc : 8d 01 d6 STA $d601 
2acf : e6 52 __ INC T1 + 0 
2ad1 : 4c d2 29 JMP $29d2 ; (main.l1469 + 0)
.s1620:
2ad4 : ad 0a 45 LDA $450a ; (vdc_state + 3)
2ad7 : 0a __ __ ASL
2ad8 : 85 53 __ STA T0 + 0 
2ada : ad 0b 45 LDA $450b ; (vdc_state + 4)
2add : 2a __ __ ROL
2ade : 06 53 __ ASL T0 + 0 
2ae0 : 2a __ __ ROL
2ae1 : aa __ __ TAX
2ae2 : 18 __ __ CLC
2ae3 : a5 53 __ LDA T0 + 0 
2ae5 : 69 05 __ ADC #$05
2ae7 : 85 53 __ STA T0 + 0 
2ae9 : 90 01 __ BCC $2aec ; (main.s1523 + 0)
.s1522:
2aeb : e8 __ __ INX
.s1523:
2aec : 86 54 __ STX T0 + 1 
2aee : a9 00 __ LDA #$00
2af0 : 85 59 __ STA T6 + 0 
.l1298:
2af2 : 20 3d 39 JSR $393d ; (getch.s0 + 0)
2af5 : ad 0c 45 LDA $450c ; (vdc_state + 5)
2af8 : 38 __ __ SEC
2af9 : e9 06 __ SBC #$06
2afb : f0 23 __ BEQ $2b20 ; (main.s1301 + 0)
.s1619:
2afd : aa __ __ TAX
2afe : ad 0f 45 LDA $450f ; (vdc_state + 8)
2b01 : 18 __ __ CLC
2b02 : 65 53 __ ADC T0 + 0 
2b04 : 85 57 __ STA T4 + 0 
2b06 : a8 __ __ TAY
2b07 : ad 10 45 LDA $4510 ; (vdc_state + 9)
2b0a : 65 54 __ ADC T0 + 1 
2b0c : 85 58 __ STA T4 + 1 
2b0e : ad 0a 45 LDA $450a ; (vdc_state + 3)
2b11 : 18 __ __ CLC
2b12 : 65 57 __ ADC T4 + 0 
2b14 : 85 43 __ STA T5 + 0 
2b16 : ad 0b 45 LDA $450b ; (vdc_state + 4)
2b19 : 65 58 __ ADC T4 + 1 
2b1b : 85 44 __ STA T5 + 1 
2b1d : 4c ec 2c JMP $2cec ; (main.l1303 + 0)
.s1301:
2b20 : ad 0c 45 LDA $450c ; (vdc_state + 5)
2b23 : 38 __ __ SEC
2b24 : e9 06 __ SBC #$06
2b26 : f0 03 __ BEQ $2b2b ; (main.s1347 + 0)
2b28 : 4c 34 2c JMP $2c34 ; (main.s1611 + 0)
.s1347:
2b2b : ad 0a 45 LDA $450a ; (vdc_state + 3)
2b2e : 85 1b __ STA ACCU + 0 
2b30 : ad 0b 45 LDA $450b ; (vdc_state + 4)
2b33 : 85 1c __ STA ACCU + 1 
2b35 : ad 0d 45 LDA $450d ; (vdc_state + 6)
2b38 : 85 44 __ STA T5 + 1 
2b3a : a9 12 __ LDA #$12
2b3c : 8d 00 d6 STA $d600 
2b3f : ad 0c 45 LDA $450c ; (vdc_state + 5)
2b42 : 85 43 __ STA T5 + 0 
2b44 : 38 __ __ SEC
2b45 : e9 02 __ SBC #$02
2b47 : 20 d6 42 JSR $42d6 ; (mul16by8 + 0)
2b4a : 18 __ __ CLC
2b4b : a5 05 __ LDA WORK + 2 
2b4d : 69 05 __ ADC #$05
2b4f : 85 57 __ STA T4 + 0 
2b51 : a5 06 __ LDA WORK + 3 
2b53 : 69 00 __ ADC #$00
2b55 : 85 58 __ STA T4 + 1 
2b57 : 18 __ __ CLC
2b58 : a5 57 __ LDA T4 + 0 
2b5a : 6d 0f 45 ADC $450f ; (vdc_state + 8)
2b5d : aa __ __ TAX
2b5e : a5 58 __ LDA T4 + 1 
2b60 : 6d 10 45 ADC $4510 ; (vdc_state + 9)
.l8025:
2b63 : 2c 00 d6 BIT $d600 
2b66 : 10 fb __ BPL $2b63 ; (main.l8025 + 0)
.s1402:
2b68 : 8d 01 d6 STA $d601 
2b6b : a9 13 __ LDA #$13
2b6d : 8d 00 d6 STA $d600 
.l8027:
2b70 : 2c 00 d6 BIT $d600 
2b73 : 10 fb __ BPL $2b70 ; (main.l8027 + 0)
.s1407:
2b75 : 8e 01 d6 STX $d601 
2b78 : a9 1f __ LDA #$1f
2b7a : 8d 00 d6 STA $d600 
.l8029:
2b7d : 2c 00 d6 BIT $d600 
2b80 : 10 fb __ BPL $2b7d ; (main.l8029 + 0)
.s1411:
2b82 : a9 20 __ LDA #$20
2b84 : 8d 01 d6 STA $d601 
2b87 : a9 18 __ LDA #$18
2b89 : 8d 00 d6 STA $d600 
.l8031:
2b8c : 2c 00 d6 BIT $d600 
2b8f : 10 fb __ BPL $2b8c ; (main.l8031 + 0)
.s1417:
2b91 : ad 01 d6 LDA $d601 
2b94 : 29 7f __ AND #$7f
2b96 : aa __ __ TAX
2b97 : a9 18 __ LDA #$18
2b99 : 8d 00 d6 STA $d600 
.l8033:
2b9c : 2c 00 d6 BIT $d600 
2b9f : 10 fb __ BPL $2b9c ; (main.l8033 + 0)
.s1423:
2ba1 : 8e 01 d6 STX $d601 
2ba4 : a9 1e __ LDA #$1e
2ba6 : 8d 00 d6 STA $d600 
.l8035:
2ba9 : 2c 00 d6 BIT $d600 
2bac : 10 fb __ BPL $2ba9 ; (main.l8035 + 0)
.s1428:
2bae : a9 45 __ LDA #$45
2bb0 : 8d 01 d6 STA $d601 
2bb3 : ad 11 45 LDA $4511 ; (vdc_state + 10)
2bb6 : 18 __ __ CLC
2bb7 : 65 57 __ ADC T4 + 0 
2bb9 : aa __ __ TAX
2bba : a9 12 __ LDA #$12
2bbc : 8d 00 d6 STA $d600 
2bbf : ad 12 45 LDA $4512 ; (vdc_state + 11)
2bc2 : 65 58 __ ADC T4 + 1 
.l8037:
2bc4 : 2c 00 d6 BIT $d600 
2bc7 : 10 fb __ BPL $2bc4 ; (main.l8037 + 0)
.s1435:
2bc9 : 8d 01 d6 STA $d601 
2bcc : a9 13 __ LDA #$13
2bce : 8d 00 d6 STA $d600 
.l8039:
2bd1 : 2c 00 d6 BIT $d600 
2bd4 : 10 fb __ BPL $2bd1 ; (main.l8039 + 0)
.s1440:
2bd6 : 8e 01 d6 STX $d601 
2bd9 : a9 1f __ LDA #$1f
2bdb : 8d 00 d6 STA $d600 
.l8041:
2bde : 2c 00 d6 BIT $d600 
2be1 : 10 fb __ BPL $2bde ; (main.l8041 + 0)
.s1444:
2be3 : a9 0d __ LDA #$0d
2be5 : 8d 01 d6 STA $d601 
2be8 : a9 18 __ LDA #$18
2bea : 8d 00 d6 STA $d600 
.l8043:
2bed : 2c 00 d6 BIT $d600 
2bf0 : 10 fb __ BPL $2bed ; (main.l8043 + 0)
.s1450:
2bf2 : ad 01 d6 LDA $d601 
2bf5 : 29 7f __ AND #$7f
2bf7 : aa __ __ TAX
2bf8 : a9 18 __ LDA #$18
2bfa : 8d 00 d6 STA $d600 
.l8045:
2bfd : 2c 00 d6 BIT $d600 
2c00 : 10 fb __ BPL $2bfd ; (main.l8045 + 0)
.s1456:
2c02 : 8e 01 d6 STX $d601 
2c05 : a9 1e __ LDA #$1e
2c07 : 8d 00 d6 STA $d600 
.l8047:
2c0a : 2c 00 d6 BIT $d600 
2c0d : 10 fb __ BPL $2c0a ; (main.l8047 + 0)
.s1461:
2c0f : a9 45 __ LDA #$45
2c11 : 8d 01 d6 STA $d601 
2c14 : 38 __ __ SEC
2c15 : a5 43 __ LDA T5 + 0 
2c17 : e9 05 __ SBC #$05
2c19 : 85 57 __ STA T4 + 0 
2c1b : a5 44 __ LDA T5 + 1 
2c1d : e9 00 __ SBC #$00
2c1f : e6 59 __ INC T6 + 0 
2c21 : 09 00 __ ORA #$00
2c23 : f0 03 __ BEQ $2c28 ; (main.s1038 + 0)
2c25 : 4c f2 2a JMP $2af2 ; (main.l1298 + 0)
.s1038:
2c28 : a5 59 __ LDA T6 + 0 
2c2a : c5 57 __ CMP T4 + 0 
2c2c : b0 03 __ BCS $2c31 ; (main.s1038 + 9)
2c2e : 4c f2 2a JMP $2af2 ; (main.l1298 + 0)
2c31 : 4c 9b 29 JMP $299b ; (main.s637 + 0)
.s1611:
2c34 : aa __ __ TAX
2c35 : ad 11 45 LDA $4511 ; (vdc_state + 10)
2c38 : 18 __ __ CLC
2c39 : 65 53 __ ADC T0 + 0 
2c3b : 85 57 __ STA T4 + 0 
2c3d : a8 __ __ TAY
2c3e : ad 12 45 LDA $4512 ; (vdc_state + 11)
2c41 : 65 54 __ ADC T0 + 1 
2c43 : 85 58 __ STA T4 + 1 
2c45 : ad 0a 45 LDA $450a ; (vdc_state + 3)
2c48 : 18 __ __ CLC
2c49 : 65 57 __ ADC T4 + 0 
2c4b : 85 43 __ STA T5 + 0 
2c4d : ad 0b 45 LDA $450b ; (vdc_state + 4)
2c50 : 65 58 __ ADC T4 + 1 
2c52 : 85 44 __ STA T5 + 1 
.l1349:
2c54 : a9 12 __ LDA #$12
2c56 : 8d 00 d6 STA $d600 
.l8010:
2c59 : 2c 00 d6 BIT $d600 
2c5c : 10 fb __ BPL $2c59 ; (main.l8010 + 0)
.s1358:
2c5e : a5 58 __ LDA T4 + 1 
2c60 : 8d 01 d6 STA $d601 
2c63 : a9 13 __ LDA #$13
2c65 : 8d 00 d6 STA $d600 
.l8012:
2c68 : 2c 00 d6 BIT $d600 
2c6b : 10 fb __ BPL $2c68 ; (main.l8012 + 0)
.s1363:
2c6d : 8c 01 d6 STY $d601 
2c70 : a9 1f __ LDA #$1f
2c72 : 8d 00 d6 STA $d600 
2c75 : a9 18 __ LDA #$18
2c77 : 8d 00 d6 STA $d600 
.l8014:
2c7a : 2c 00 d6 BIT $d600 
2c7d : 10 fb __ BPL $2c7a ; (main.l8014 + 0)
.s1370:
2c7f : ad 01 d6 LDA $d601 
2c82 : 09 80 __ ORA #$80
2c84 : 85 45 __ STA T7 + 0 
2c86 : a9 18 __ LDA #$18
2c88 : 8d 00 d6 STA $d600 
.l8016:
2c8b : 2c 00 d6 BIT $d600 
2c8e : 10 fb __ BPL $2c8b ; (main.l8016 + 0)
.s1376:
2c90 : a5 45 __ LDA T7 + 0 
2c92 : 8d 01 d6 STA $d601 
2c95 : a9 20 __ LDA #$20
2c97 : 8d 00 d6 STA $d600 
.l8018:
2c9a : 2c 00 d6 BIT $d600 
2c9d : 10 fb __ BPL $2c9a ; (main.l8018 + 0)
.s1381:
2c9f : a5 44 __ LDA T5 + 1 
2ca1 : 8d 01 d6 STA $d601 
2ca4 : a9 21 __ LDA #$21
2ca6 : 8d 00 d6 STA $d600 
.l8020:
2ca9 : 2c 00 d6 BIT $d600 
2cac : 10 fb __ BPL $2ca9 ; (main.l8020 + 0)
.s1386:
2cae : a5 43 __ LDA T5 + 0 
2cb0 : 8d 01 d6 STA $d601 
2cb3 : a9 1f __ LDA #$1f
2cb5 : 8d 00 d6 STA $d600 
2cb8 : a9 1e __ LDA #$1e
2cba : 8d 00 d6 STA $d600 
.l8022:
2cbd : 2c 00 d6 BIT $d600 
2cc0 : 10 fb __ BPL $2cbd ; (main.l8022 + 0)
.s1392:
2cc2 : a9 46 __ LDA #$46
2cc4 : 8d 01 d6 STA $d601 
2cc7 : ad 0a 45 LDA $450a ; (vdc_state + 3)
2cca : 18 __ __ CLC
2ccb : 65 43 __ ADC T5 + 0 
2ccd : 85 43 __ STA T5 + 0 
2ccf : ad 0b 45 LDA $450b ; (vdc_state + 4)
2cd2 : 65 44 __ ADC T5 + 1 
2cd4 : 85 44 __ STA T5 + 1 
2cd6 : 98 __ __ TYA
2cd7 : 18 __ __ CLC
2cd8 : 6d 0a 45 ADC $450a ; (vdc_state + 3)
2cdb : a8 __ __ TAY
2cdc : a5 58 __ LDA T4 + 1 
2cde : 6d 0b 45 ADC $450b ; (vdc_state + 4)
2ce1 : 85 58 __ STA T4 + 1 
2ce3 : ca __ __ DEX
2ce4 : f0 03 __ BEQ $2ce9 ; (main.s1392 + 39)
2ce6 : 4c 54 2c JMP $2c54 ; (main.l1349 + 0)
2ce9 : 4c 2b 2b JMP $2b2b ; (main.s1347 + 0)
.l1303:
2cec : a9 12 __ LDA #$12
2cee : 8d 00 d6 STA $d600 
.l7994:
2cf1 : 2c 00 d6 BIT $d600 
2cf4 : 10 fb __ BPL $2cf1 ; (main.l7994 + 0)
.s1312:
2cf6 : a5 58 __ LDA T4 + 1 
2cf8 : 8d 01 d6 STA $d601 
2cfb : a9 13 __ LDA #$13
2cfd : 8d 00 d6 STA $d600 
.l7996:
2d00 : 2c 00 d6 BIT $d600 
2d03 : 10 fb __ BPL $2d00 ; (main.l7996 + 0)
.s1317:
2d05 : 8c 01 d6 STY $d601 
2d08 : a9 1f __ LDA #$1f
2d0a : 8d 00 d6 STA $d600 
2d0d : a9 18 __ LDA #$18
2d0f : 8d 00 d6 STA $d600 
.l7998:
2d12 : 2c 00 d6 BIT $d600 
2d15 : 10 fb __ BPL $2d12 ; (main.l7998 + 0)
.s1324:
2d17 : ad 01 d6 LDA $d601 
2d1a : 09 80 __ ORA #$80
2d1c : 85 45 __ STA T7 + 0 
2d1e : a9 18 __ LDA #$18
2d20 : 8d 00 d6 STA $d600 
.l8000:
2d23 : 2c 00 d6 BIT $d600 
2d26 : 10 fb __ BPL $2d23 ; (main.l8000 + 0)
.s1330:
2d28 : a5 45 __ LDA T7 + 0 
2d2a : 8d 01 d6 STA $d601 
2d2d : a9 20 __ LDA #$20
2d2f : 8d 00 d6 STA $d600 
.l8002:
2d32 : 2c 00 d6 BIT $d600 
2d35 : 10 fb __ BPL $2d32 ; (main.l8002 + 0)
.s1335:
2d37 : a5 44 __ LDA T5 + 1 
2d39 : 8d 01 d6 STA $d601 
2d3c : a9 21 __ LDA #$21
2d3e : 8d 00 d6 STA $d600 
.l8004:
2d41 : 2c 00 d6 BIT $d600 
2d44 : 10 fb __ BPL $2d41 ; (main.l8004 + 0)
.s1340:
2d46 : a5 43 __ LDA T5 + 0 
2d48 : 8d 01 d6 STA $d601 
2d4b : a9 1f __ LDA #$1f
2d4d : 8d 00 d6 STA $d600 
2d50 : a9 1e __ LDA #$1e
2d52 : 8d 00 d6 STA $d600 
.l8006:
2d55 : 2c 00 d6 BIT $d600 
2d58 : 10 fb __ BPL $2d55 ; (main.l8006 + 0)
.s1346:
2d5a : a9 46 __ LDA #$46
2d5c : 8d 01 d6 STA $d601 
2d5f : ad 0a 45 LDA $450a ; (vdc_state + 3)
2d62 : 18 __ __ CLC
2d63 : 65 43 __ ADC T5 + 0 
2d65 : 85 43 __ STA T5 + 0 
2d67 : ad 0b 45 LDA $450b ; (vdc_state + 4)
2d6a : 65 44 __ ADC T5 + 1 
2d6c : 85 44 __ STA T5 + 1 
2d6e : 98 __ __ TYA
2d6f : 18 __ __ CLC
2d70 : 6d 0a 45 ADC $450a ; (vdc_state + 3)
2d73 : a8 __ __ TAY
2d74 : a5 58 __ LDA T4 + 1 
2d76 : 6d 0b 45 ADC $450b ; (vdc_state + 4)
2d79 : 85 58 __ STA T4 + 1 
2d7b : ca __ __ DEX
2d7c : f0 03 __ BEQ $2d81 ; (main.s1346 + 39)
2d7e : 4c ec 2c JMP $2cec ; (main.l1303 + 0)
2d81 : 4c 20 2b JMP $2b20 ; (main.s1301 + 0)
.l1250:
2d84 : a5 53 __ LDA T0 + 0 
2d86 : 85 1b __ STA ACCU + 0 
2d88 : a5 54 __ LDA T0 + 1 
2d8a : 85 1c __ STA ACCU + 1 
2d8c : a5 59 __ LDA T6 + 0 
2d8e : 20 d6 42 JSR $42d6 ; (mul16by8 + 0)
2d91 : a5 05 __ LDA WORK + 2 
2d93 : 85 57 __ STA T4 + 0 
2d95 : a5 06 __ LDA WORK + 3 
2d97 : 85 58 __ STA T4 + 1 
2d99 : a6 56 __ LDX T3 + 0 
2d9b : a0 05 __ LDY #$05
.l1254:
2d9d : 86 4c __ STX T11 + 0 
2d9f : a9 12 __ LDA #$12
2da1 : 8d 00 d6 STA $d600 
2da4 : a5 55 __ LDA T2 + 0 
2da6 : 85 50 __ STA T13 + 0 
2da8 : 98 __ __ TYA
2da9 : 18 __ __ CLC
2daa : 65 57 __ ADC T4 + 0 
2dac : 85 45 __ STA T7 + 0 
2dae : a9 00 __ LDA #$00
2db0 : 65 58 __ ADC T4 + 1 
2db2 : 85 46 __ STA T7 + 1 
2db4 : 18 __ __ CLC
2db5 : a5 45 __ LDA T7 + 0 
2db7 : 65 43 __ ADC T5 + 0 
2db9 : 85 47 __ STA T8 + 0 
2dbb : a5 46 __ LDA T7 + 1 
2dbd : 65 44 __ ADC T5 + 1 
2dbf : e6 55 __ INC T2 + 0 
2dc1 : e8 __ __ INX
.l7977:
2dc2 : 2c 00 d6 BIT $d600 
2dc5 : 10 fb __ BPL $2dc2 ; (main.l7977 + 0)
.s1266:
2dc7 : 8d 01 d6 STA $d601 
2dca : a9 13 __ LDA #$13
2dcc : 8d 00 d6 STA $d600 
.l7979:
2dcf : 2c 00 d6 BIT $d600 
2dd2 : 10 fb __ BPL $2dcf ; (main.l7979 + 0)
.s1271:
2dd4 : a5 47 __ LDA T8 + 0 
2dd6 : 8d 01 d6 STA $d601 
2dd9 : a9 1f __ LDA #$1f
2ddb : 8d 00 d6 STA $d600 
.l7981:
2dde : 2c 00 d6 BIT $d600 
2de1 : 10 fb __ BPL $2dde ; (main.l7981 + 0)
.s1275:
2de3 : a5 50 __ LDA T13 + 0 
2de5 : 8d 01 d6 STA $d601 
2de8 : ad 11 45 LDA $4511 ; (vdc_state + 10)
2deb : 18 __ __ CLC
2dec : 65 45 __ ADC T7 + 0 
2dee : 85 45 __ STA T7 + 0 
2df0 : a9 12 __ LDA #$12
2df2 : 8d 00 d6 STA $d600 
2df5 : ad 12 45 LDA $4512 ; (vdc_state + 11)
2df8 : 65 46 __ ADC T7 + 1 
.l7983:
2dfa : 2c 00 d6 BIT $d600 
2dfd : 10 fb __ BPL $2dfa ; (main.l7983 + 0)
.s1282:
2dff : 8d 01 d6 STA $d601 
2e02 : a9 13 __ LDA #$13
2e04 : 8d 00 d6 STA $d600 
.l7985:
2e07 : 2c 00 d6 BIT $d600 
2e0a : 10 fb __ BPL $2e07 ; (main.l7985 + 0)
.s1287:
2e0c : a5 45 __ LDA T7 + 0 
2e0e : 8d 01 d6 STA $d601 
2e11 : a9 1f __ LDA #$1f
2e13 : 8d 00 d6 STA $d600 
.l7987:
2e16 : 2c 00 d6 BIT $d600 
2e19 : 10 fb __ BPL $2e16 ; (main.l7987 + 0)
.s1291:
2e1b : a5 4c __ LDA T11 + 0 
2e1d : 8d 01 d6 STA $d601 
2e20 : e0 10 __ CPX #$10
2e22 : 90 02 __ BCC $2e26 ; (main.s5335 + 0)
.s1292:
2e24 : a2 00 __ LDX #$00
.s5335:
2e26 : c8 __ __ INY
2e27 : c0 4b __ CPY #$4b
2e29 : b0 03 __ BCS $2e2e ; (main.s1251 + 0)
2e2b : 4c 9d 2d JMP $2d9d ; (main.l1254 + 0)
.s1251:
2e2e : 86 56 __ STX T3 + 0 
2e30 : ad 0c 45 LDA $450c ; (vdc_state + 5)
2e33 : e9 01 __ SBC #$01
2e35 : 85 57 __ STA T4 + 0 
2e37 : ad 0d 45 LDA $450d ; (vdc_state + 6)
2e3a : e9 00 __ SBC #$00
2e3c : e6 59 __ INC T6 + 0 
2e3e : 09 00 __ ORA #$00
2e40 : f0 03 __ BEQ $2e45 ; (main.s1092 + 0)
2e42 : 4c 84 2d JMP $2d84 ; (main.l1250 + 0)
.s1092:
2e45 : a5 59 __ LDA T6 + 0 
2e47 : c5 57 __ CMP T4 + 0 
2e49 : b0 03 __ BCS $2e4e ; (main.s1092 + 9)
2e4b : 4c 84 2d JMP $2d84 ; (main.l1250 + 0)
2e4e : 4c 88 29 JMP $2988 ; (main.s1252 + 0)
.s1072:
2e51 : a9 12 __ LDA #$12
2e53 : 8d 00 d6 STA $d600 
2e56 : a5 57 __ LDA T4 + 0 
2e58 : 85 1b __ STA ACCU + 0 
2e5a : a5 58 __ LDA T4 + 1 
2e5c : 85 1c __ STA ACCU + 1 
2e5e : a5 59 __ LDA T6 + 0 
2e60 : 20 d6 42 JSR $42d6 ; (mul16by8 + 0)
2e63 : 18 __ __ CLC
2e64 : a5 05 __ LDA WORK + 2 
2e66 : 69 4b __ ADC #$4b
2e68 : 85 57 __ STA T4 + 0 
2e6a : a5 06 __ LDA WORK + 3 
2e6c : 69 00 __ ADC #$00
2e6e : 85 58 __ STA T4 + 1 
2e70 : 18 __ __ CLC
2e71 : a5 57 __ LDA T4 + 0 
2e73 : 65 43 __ ADC T5 + 0 
2e75 : aa __ __ TAX
2e76 : a5 58 __ LDA T4 + 1 
2e78 : 65 44 __ ADC T5 + 1 
.l7916:
2e7a : 2c 00 d6 BIT $d600 
2e7d : 10 fb __ BPL $2e7a ; (main.l7916 + 0)
.s1084:
2e7f : 8d 01 d6 STA $d601 
2e82 : a9 13 __ LDA #$13
2e84 : 8d 00 d6 STA $d600 
.l7918:
2e87 : 2c 00 d6 BIT $d600 
2e8a : 10 fb __ BPL $2e87 ; (main.l7918 + 0)
.s1089:
2e8c : 8e 01 d6 STX $d601 
2e8f : a9 1f __ LDA #$1f
2e91 : 8d 00 d6 STA $d600 
.l7920:
2e94 : 2c 00 d6 BIT $d600 
2e97 : 10 fb __ BPL $2e94 ; (main.l7920 + 0)
.s1093:
2e99 : a9 61 __ LDA #$61
2e9b : 8d 01 d6 STA $d601 
2e9e : ad 11 45 LDA $4511 ; (vdc_state + 10)
2ea1 : 18 __ __ CLC
2ea2 : 65 57 __ ADC T4 + 0 
2ea4 : aa __ __ TAX
2ea5 : a9 12 __ LDA #$12
2ea7 : 8d 00 d6 STA $d600 
2eaa : ad 12 45 LDA $4512 ; (vdc_state + 11)
2ead : 65 58 __ ADC T4 + 1 
.l7922:
2eaf : 2c 00 d6 BIT $d600 
2eb2 : 10 fb __ BPL $2eaf ; (main.l7922 + 0)
.s1100:
2eb4 : 8d 01 d6 STA $d601 
2eb7 : a9 13 __ LDA #$13
2eb9 : 8d 00 d6 STA $d600 
.l7924:
2ebc : 2c 00 d6 BIT $d600 
2ebf : 10 fb __ BPL $2ebc ; (main.l7924 + 0)
.s1105:
2ec1 : 8e 01 d6 STX $d601 
2ec4 : a9 1f __ LDA #$1f
2ec6 : 8d 00 d6 STA $d600 
.l7926:
2ec9 : 2c 00 d6 BIT $d600 
2ecc : 10 fb __ BPL $2ec9 ; (main.l7926 + 0)
.s1109:
2ece : a9 09 __ LDA #$09
2ed0 : 8d 01 d6 STA $d601 
2ed3 : e6 59 __ INC T6 + 0 
2ed5 : 4c 7a 27 JMP $277a ; (main.l1071 + 0)
.s1032:
2ed8 : ad 0a 45 LDA $450a ; (vdc_state + 3)
2edb : 85 1b __ STA ACCU + 0 
2edd : ad 0b 45 LDA $450b ; (vdc_state + 4)
2ee0 : 85 1c __ STA ACCU + 1 
2ee2 : a9 12 __ LDA #$12
2ee4 : 8d 00 d6 STA $d600 
2ee7 : a5 59 __ LDA T6 + 0 
2ee9 : 20 d6 42 JSR $42d6 ; (mul16by8 + 0)
2eec : 18 __ __ CLC
2eed : a5 05 __ LDA WORK + 2 
2eef : 69 04 __ ADC #$04
2ef1 : 85 57 __ STA T4 + 0 
2ef3 : a5 06 __ LDA WORK + 3 
2ef5 : 69 00 __ ADC #$00
2ef7 : 85 58 __ STA T4 + 1 
2ef9 : 18 __ __ CLC
2efa : a5 57 __ LDA T4 + 0 
2efc : 6d 0f 45 ADC $450f ; (vdc_state + 8)
2eff : aa __ __ TAX
2f00 : a5 58 __ LDA T4 + 1 
2f02 : 6d 10 45 ADC $4510 ; (vdc_state + 9)
.l7903:
2f05 : 2c 00 d6 BIT $d600 
2f08 : 10 fb __ BPL $2f05 ; (main.l7903 + 0)
.s1044:
2f0a : 8d 01 d6 STA $d601 
2f0d : a9 13 __ LDA #$13
2f0f : 8d 00 d6 STA $d600 
.l7905:
2f12 : 2c 00 d6 BIT $d600 
2f15 : 10 fb __ BPL $2f12 ; (main.l7905 + 0)
.s1049:
2f17 : 8e 01 d6 STX $d601 
2f1a : a9 1f __ LDA #$1f
2f1c : 8d 00 d6 STA $d600 
.l7907:
2f1f : 2c 00 d6 BIT $d600 
2f22 : 10 fb __ BPL $2f1f ; (main.l7907 + 0)
.s1053:
2f24 : a9 e1 __ LDA #$e1
2f26 : 8d 01 d6 STA $d601 
2f29 : ad 11 45 LDA $4511 ; (vdc_state + 10)
2f2c : 18 __ __ CLC
2f2d : 65 57 __ ADC T4 + 0 
2f2f : aa __ __ TAX
2f30 : a9 12 __ LDA #$12
2f32 : 8d 00 d6 STA $d600 
2f35 : ad 12 45 LDA $4512 ; (vdc_state + 11)
2f38 : 65 58 __ ADC T4 + 1 
.l7909:
2f3a : 2c 00 d6 BIT $d600 
2f3d : 10 fb __ BPL $2f3a ; (main.l7909 + 0)
.s1060:
2f3f : 8d 01 d6 STA $d601 
2f42 : a9 13 __ LDA #$13
2f44 : 8d 00 d6 STA $d600 
.l7911:
2f47 : 2c 00 d6 BIT $d600 
2f4a : 10 fb __ BPL $2f47 ; (main.l7911 + 0)
.s1065:
2f4c : 8e 01 d6 STX $d601 
2f4f : a9 1f __ LDA #$1f
2f51 : 8d 00 d6 STA $d600 
.l7913:
2f54 : 2c 00 d6 BIT $d600 
2f57 : 10 fb __ BPL $2f54 ; (main.l7913 + 0)
.s1069:
2f59 : a9 09 __ LDA #$09
2f5b : 8d 01 d6 STA $d601 
2f5e : e6 59 __ INC T6 + 0 
2f60 : 4c 5b 27 JMP $275b ; (main.l1031 + 0)
.s563:
2f63 : ad 0a 45 LDA $450a ; (vdc_state + 3)
2f66 : 85 1b __ STA ACCU + 0 
2f68 : ad 0b 45 LDA $450b ; (vdc_state + 4)
2f6b : 85 1c __ STA ACCU + 1 
2f6d : ad 0e 45 LDA $450e ; (vdc_state + 7)
2f70 : 85 59 __ STA T6 + 0 
2f72 : a9 12 __ LDA #$12
2f74 : 8d 00 d6 STA $d600 
2f77 : a6 53 __ LDX T0 + 0 
2f79 : ca __ __ DEX
2f7a : 86 47 __ STX T8 + 0 
2f7c : a5 52 __ LDA T1 + 0 
2f7e : 20 d6 42 JSR $42d6 ; (mul16by8 + 0)
2f81 : 18 __ __ CLC
2f82 : a5 05 __ LDA WORK + 2 
2f84 : 6d 0f 45 ADC $450f ; (vdc_state + 8)
2f87 : aa __ __ TAX
2f88 : a5 06 __ LDA WORK + 3 
2f8a : 6d 10 45 ADC $4510 ; (vdc_state + 9)
.l7760:
2f8d : 2c 00 d6 BIT $d600 
2f90 : 10 fb __ BPL $2f8d ; (main.l7760 + 0)
.s575:
2f92 : 8d 01 d6 STA $d601 
2f95 : a9 13 __ LDA #$13
2f97 : 8d 00 d6 STA $d600 
.l7762:
2f9a : 2c 00 d6 BIT $d600 
2f9d : 10 fb __ BPL $2f9a ; (main.l7762 + 0)
.s580:
2f9f : 8e 01 d6 STX $d601 
2fa2 : a9 1f __ LDA #$1f
2fa4 : 8d 00 d6 STA $d600 
.l7764:
2fa7 : 2c 00 d6 BIT $d600 
2faa : 10 fb __ BPL $2fa7 ; (main.l7764 + 0)
.s584:
2fac : a9 20 __ LDA #$20
2fae : 8d 01 d6 STA $d601 
2fb1 : a9 18 __ LDA #$18
2fb3 : 8d 00 d6 STA $d600 
.l7766:
2fb6 : 2c 00 d6 BIT $d600 
2fb9 : 10 fb __ BPL $2fb6 ; (main.l7766 + 0)
.s590:
2fbb : ad 01 d6 LDA $d601 
2fbe : 29 7f __ AND #$7f
2fc0 : aa __ __ TAX
2fc1 : a9 18 __ LDA #$18
2fc3 : 8d 00 d6 STA $d600 
.l7768:
2fc6 : 2c 00 d6 BIT $d600 
2fc9 : 10 fb __ BPL $2fc6 ; (main.l7768 + 0)
.s596:
2fcb : 8e 01 d6 STX $d601 
2fce : a9 1e __ LDA #$1e
2fd0 : 8d 00 d6 STA $d600 
.l7770:
2fd3 : 2c 00 d6 BIT $d600 
2fd6 : 10 fb __ BPL $2fd3 ; (main.l7770 + 0)
.s601:
2fd8 : a5 47 __ LDA T8 + 0 
2fda : 8d 01 d6 STA $d601 
2fdd : ad 11 45 LDA $4511 ; (vdc_state + 10)
2fe0 : 18 __ __ CLC
2fe1 : 65 05 __ ADC WORK + 2 
2fe3 : aa __ __ TAX
2fe4 : a9 12 __ LDA #$12
2fe6 : 8d 00 d6 STA $d600 
2fe9 : ad 12 45 LDA $4512 ; (vdc_state + 11)
2fec : 65 06 __ ADC WORK + 3 
.l7772:
2fee : 2c 00 d6 BIT $d600 
2ff1 : 10 fb __ BPL $2fee ; (main.l7772 + 0)
.s608:
2ff3 : 8d 01 d6 STA $d601 
2ff6 : a9 13 __ LDA #$13
2ff8 : 8d 00 d6 STA $d600 
.l7774:
2ffb : 2c 00 d6 BIT $d600 
2ffe : 10 fb __ BPL $2ffb ; (main.l7774 + 0)
.s613:
3000 : 8e 01 d6 STX $d601 
3003 : a9 1f __ LDA #$1f
3005 : 8d 00 d6 STA $d600 
.l7776:
3008 : 2c 00 d6 BIT $d600 
300b : 10 fb __ BPL $3008 ; (main.l7776 + 0)
.s617:
300d : a5 59 __ LDA T6 + 0 
300f : 8d 01 d6 STA $d601 
3012 : a9 18 __ LDA #$18
3014 : 8d 00 d6 STA $d600 
.l7778:
3017 : 2c 00 d6 BIT $d600 
301a : 10 fb __ BPL $3017 ; (main.l7778 + 0)
.s623:
301c : ad 01 d6 LDA $d601 
301f : 29 7f __ AND #$7f
3021 : aa __ __ TAX
3022 : a9 18 __ LDA #$18
3024 : 8d 00 d6 STA $d600 
.l7780:
3027 : 2c 00 d6 BIT $d600 
302a : 10 fb __ BPL $3027 ; (main.l7780 + 0)
.s629:
302c : 8e 01 d6 STX $d601 
302f : a9 1e __ LDA #$1e
3031 : 8d 00 d6 STA $d600 
.l7782:
3034 : 2c 00 d6 BIT $d600 
3037 : 10 fb __ BPL $3034 ; (main.l7782 + 0)
.s634:
3039 : a5 47 __ LDA T8 + 0 
303b : 8d 01 d6 STA $d601 
303e : e6 52 __ INC T1 + 0 
3040 : 4c 59 22 JMP $2259 ; (main.l562 + 0)
.s137:
3043 : ad 0a 45 LDA $450a ; (vdc_state + 3)
3046 : 85 1b __ STA ACCU + 0 
3048 : ad 0b 45 LDA $450b ; (vdc_state + 4)
304b : 85 1c __ STA ACCU + 1 
304d : ad 0e 45 LDA $450e ; (vdc_state + 7)
3050 : 85 59 __ STA T6 + 0 
3052 : a9 12 __ LDA #$12
3054 : 8d 00 d6 STA $d600 
3057 : a6 53 __ LDX T0 + 0 
3059 : ca __ __ DEX
305a : 86 47 __ STX T8 + 0 
305c : a5 52 __ LDA T1 + 0 
305e : 20 d6 42 JSR $42d6 ; (mul16by8 + 0)
3061 : 18 __ __ CLC
3062 : a5 05 __ LDA WORK + 2 
3064 : 6d 0f 45 ADC $450f ; (vdc_state + 8)
3067 : aa __ __ TAX
3068 : a5 06 __ LDA WORK + 3 
306a : 6d 10 45 ADC $4510 ; (vdc_state + 9)
.l7689:
306d : 2c 00 d6 BIT $d600 
3070 : 10 fb __ BPL $306d ; (main.l7689 + 0)
.s149:
3072 : 8d 01 d6 STA $d601 
3075 : a9 13 __ LDA #$13
3077 : 8d 00 d6 STA $d600 
.l7691:
307a : 2c 00 d6 BIT $d600 
307d : 10 fb __ BPL $307a ; (main.l7691 + 0)
.s154:
307f : 8e 01 d6 STX $d601 
3082 : a9 1f __ LDA #$1f
3084 : 8d 00 d6 STA $d600 
.l7693:
3087 : 2c 00 d6 BIT $d600 
308a : 10 fb __ BPL $3087 ; (main.l7693 + 0)
.s158:
308c : a9 20 __ LDA #$20
308e : 8d 01 d6 STA $d601 
3091 : a9 18 __ LDA #$18
3093 : 8d 00 d6 STA $d600 
.l7695:
3096 : 2c 00 d6 BIT $d600 
3099 : 10 fb __ BPL $3096 ; (main.l7695 + 0)
.s164:
309b : ad 01 d6 LDA $d601 
309e : 29 7f __ AND #$7f
30a0 : aa __ __ TAX
30a1 : a9 18 __ LDA #$18
30a3 : 8d 00 d6 STA $d600 
.l7697:
30a6 : 2c 00 d6 BIT $d600 
30a9 : 10 fb __ BPL $30a6 ; (main.l7697 + 0)
.s170:
30ab : 8e 01 d6 STX $d601 
30ae : a9 1e __ LDA #$1e
30b0 : 8d 00 d6 STA $d600 
.l7699:
30b3 : 2c 00 d6 BIT $d600 
30b6 : 10 fb __ BPL $30b3 ; (main.l7699 + 0)
.s175:
30b8 : a5 47 __ LDA T8 + 0 
30ba : 8d 01 d6 STA $d601 
30bd : ad 11 45 LDA $4511 ; (vdc_state + 10)
30c0 : 18 __ __ CLC
30c1 : 65 05 __ ADC WORK + 2 
30c3 : aa __ __ TAX
30c4 : a9 12 __ LDA #$12
30c6 : 8d 00 d6 STA $d600 
30c9 : ad 12 45 LDA $4512 ; (vdc_state + 11)
30cc : 65 06 __ ADC WORK + 3 
.l7701:
30ce : 2c 00 d6 BIT $d600 
30d1 : 10 fb __ BPL $30ce ; (main.l7701 + 0)
.s182:
30d3 : 8d 01 d6 STA $d601 
30d6 : a9 13 __ LDA #$13
30d8 : 8d 00 d6 STA $d600 
.l7703:
30db : 2c 00 d6 BIT $d600 
30de : 10 fb __ BPL $30db ; (main.l7703 + 0)
.s187:
30e0 : 8e 01 d6 STX $d601 
30e3 : a9 1f __ LDA #$1f
30e5 : 8d 00 d6 STA $d600 
.l7705:
30e8 : 2c 00 d6 BIT $d600 
30eb : 10 fb __ BPL $30e8 ; (main.l7705 + 0)
.s191:
30ed : a5 59 __ LDA T6 + 0 
30ef : 8d 01 d6 STA $d601 
30f2 : a9 18 __ LDA #$18
30f4 : 8d 00 d6 STA $d600 
.l7707:
30f7 : 2c 00 d6 BIT $d600 
30fa : 10 fb __ BPL $30f7 ; (main.l7707 + 0)
.s197:
30fc : ad 01 d6 LDA $d601 
30ff : 29 7f __ AND #$7f
3101 : aa __ __ TAX
3102 : a9 18 __ LDA #$18
3104 : 8d 00 d6 STA $d600 
.l7709:
3107 : 2c 00 d6 BIT $d600 
310a : 10 fb __ BPL $3107 ; (main.l7709 + 0)
.s203:
310c : 8e 01 d6 STX $d601 
310f : a9 1e __ LDA #$1e
3111 : 8d 00 d6 STA $d600 
.l7711:
3114 : 2c 00 d6 BIT $d600 
3117 : 10 fb __ BPL $3114 ; (main.l7711 + 0)
.s208:
3119 : a5 47 __ LDA T8 + 0 
311b : 8d 01 d6 STA $d601 
311e : e6 52 __ INC T1 + 0 
3120 : 4c 64 20 JMP $2064 ; (main.l136 + 0)
.s17:
3123 : a9 00 __ LDA #$00
3125 : 85 53 __ STA T0 + 0 
3127 : 85 54 __ STA T0 + 1 
.l21:
3129 : 20 01 39 JSR $3901 ; (krnio_chrin.s0 + 0)
312c : a5 1b __ LDA ACCU + 0 
312e : 85 57 __ STA T4 + 0 
3130 : 20 0b 39 JSR $390b ; (krnio_status.s0 + 0)
3133 : 8d f8 44 STA $44f8 ; (krnio_pstatus + 1)
3136 : 09 00 __ ORA #$00
3138 : f0 07 __ BEQ $3141 ; (main.s25 + 0)
.s26:
313a : ad f8 44 LDA $44f8 ; (krnio_pstatus + 1)
313d : c9 40 __ CMP #$40
313f : d0 17 __ BNE $3158 ; (main.s22 + 0)
.s25:
3141 : a5 57 __ LDA T4 + 0 
3143 : a6 53 __ LDX T0 + 0 
3145 : e8 __ __ INX
3146 : 86 53 __ STX T0 + 0 
3148 : 9d 5a bf STA $bf5a,x ; (filename + 14)
314b : a9 00 __ LDA #$00
314d : 85 54 __ STA T0 + 1 
314f : ad f8 44 LDA $44f8 ; (krnio_pstatus + 1)
3152 : d0 04 __ BNE $3158 ; (main.s22 + 0)
.s20:
3154 : e0 51 __ CPX #$51
3156 : 90 d1 __ BCC $3129 ; (main.l21 + 0)
.s22:
3158 : 20 fc 37 JSR $37fc ; (krnio_clrchn.s0 + 0)
315b : 4c f1 1d JMP $1df1 ; (main.s12 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
315e : a2 03 __ LDX #$03
3160 : b5 53 __ LDA T8 + 0,x 
3162 : 9d b2 bf STA $bfb2,x ; (printf@stack + 0)
3165 : ca __ __ DEX
3166 : 10 f8 __ BPL $3160 ; (printf.s1000 + 2)
.s0:
3168 : 18 __ __ CLC
3169 : a5 23 __ LDA SP + 0 
316b : 69 04 __ ADC #$04
316d : 85 47 __ STA T0 + 0 
316f : a5 24 __ LDA SP + 1 
3171 : 69 00 __ ADC #$00
3173 : 85 48 __ STA T0 + 1 
3175 : a9 00 __ LDA #$00
3177 : 85 49 __ STA T2 + 0 
3179 : a0 02 __ LDY #$02
317b : b1 23 __ LDA (SP + 0),y 
317d : 85 4a __ STA T3 + 0 
317f : c8 __ __ INY
3180 : b1 23 __ LDA (SP + 0),y 
3182 : 85 4b __ STA T3 + 1 
.l2:
3184 : a0 00 __ LDY #$00
3186 : b1 4a __ LDA (T3 + 0),y 
3188 : d0 1e __ BNE $31a8 ; (printf.s3 + 0)
.s4:
318a : a6 49 __ LDX T2 + 0 
318c : 9d be bf STA $bfbe,x ; (buff + 0)
318f : 8a __ __ TXA
3190 : f0 0b __ BEQ $319d ; (printf.s1001 + 0)
.s117:
3192 : a9 be __ LDA #$be
3194 : 85 0d __ STA P0 ; (fmt + 0)
3196 : a9 bf __ LDA #$bf
3198 : 85 0e __ STA P1 ; (fmt + 1)
319a : 20 ae 34 JSR $34ae ; (puts.s0 + 0)
.s1001:
319d : a2 03 __ LDX #$03
319f : bd b2 bf LDA $bfb2,x ; (printf@stack + 0)
31a2 : 95 53 __ STA T8 + 0,x 
31a4 : ca __ __ DEX
31a5 : 10 f8 __ BPL $319f ; (printf.s1001 + 2)
31a7 : 60 __ __ RTS
.s3:
31a8 : c9 25 __ CMP #$25
31aa : f0 28 __ BEQ $31d4 ; (printf.s5 + 0)
.s6:
31ac : a6 49 __ LDX T2 + 0 
31ae : 9d be bf STA $bfbe,x ; (buff + 0)
31b1 : e6 4a __ INC T3 + 0 
31b3 : d0 02 __ BNE $31b7 ; (printf.s1098 + 0)
.s1097:
31b5 : e6 4b __ INC T3 + 1 
.s1098:
31b7 : e8 __ __ INX
31b8 : 86 49 __ STX T2 + 0 
31ba : e0 28 __ CPX #$28
31bc : 90 c6 __ BCC $3184 ; (printf.l2 + 0)
.s111:
31be : a9 be __ LDA #$be
31c0 : 85 0d __ STA P0 ; (fmt + 0)
31c2 : a9 bf __ LDA #$bf
31c4 : 85 0e __ STA P1 ; (fmt + 1)
31c6 : 98 __ __ TYA
31c7 : 9d be bf STA $bfbe,x ; (buff + 0)
31ca : 20 ae 34 JSR $34ae ; (puts.s0 + 0)
31cd : a9 00 __ LDA #$00
.s1068:
31cf : 85 49 __ STA T2 + 0 
31d1 : 4c 84 31 JMP $3184 ; (printf.l2 + 0)
.s5:
31d4 : a5 49 __ LDA T2 + 0 
31d6 : f0 15 __ BEQ $31ed ; (printf.s10 + 0)
.s8:
31d8 : a9 be __ LDA #$be
31da : 85 0d __ STA P0 ; (fmt + 0)
31dc : a9 bf __ LDA #$bf
31de : 85 0e __ STA P1 ; (fmt + 1)
31e0 : 98 __ __ TYA
31e1 : a6 49 __ LDX T2 + 0 
31e3 : 9d be bf STA $bfbe,x ; (buff + 0)
31e6 : 20 ae 34 JSR $34ae ; (puts.s0 + 0)
31e9 : a9 00 __ LDA #$00
31eb : 85 49 __ STA T2 + 0 
.s10:
31ed : a9 0a __ LDA #$0a
31ef : 8d b9 bf STA $bfb9 ; (si + 3)
31f2 : a9 00 __ LDA #$00
31f4 : 8d ba bf STA $bfba ; (si + 4)
31f7 : 8d bb bf STA $bfbb ; (si + 5)
31fa : 8d bc bf STA $bfbc ; (si + 6)
31fd : 8d bd bf STA $bfbd ; (si + 7)
3200 : a0 01 __ LDY #$01
3202 : b1 4a __ LDA (T3 + 0),y 
3204 : aa __ __ TAX
3205 : a9 20 __ LDA #$20
3207 : 8d b6 bf STA $bfb6 ; (si + 0)
320a : a9 00 __ LDA #$00
320c : 8d b7 bf STA $bfb7 ; (si + 1)
320f : a9 ff __ LDA #$ff
3211 : 8d b8 bf STA $bfb8 ; (si + 2)
3214 : 18 __ __ CLC
3215 : a5 4a __ LDA T3 + 0 
3217 : 69 02 __ ADC #$02
.l15:
3219 : 85 4a __ STA T3 + 0 
321b : 90 02 __ BCC $321f ; (printf.s1080 + 0)
.s1079:
321d : e6 4b __ INC T3 + 1 
.s1080:
321f : 8a __ __ TXA
3220 : e0 2b __ CPX #$2b
3222 : d0 08 __ BNE $322c ; (printf.s18 + 0)
.s17:
3224 : a9 01 __ LDA #$01
3226 : 8d bb bf STA $bfbb ; (si + 5)
3229 : 4c a1 34 JMP $34a1 ; (printf.s246 + 0)
.s18:
322c : c9 30 __ CMP #$30
322e : d0 06 __ BNE $3236 ; (printf.s21 + 0)
.s20:
3230 : 8d b6 bf STA $bfb6 ; (si + 0)
3233 : 4c a1 34 JMP $34a1 ; (printf.s246 + 0)
.s21:
3236 : e0 23 __ CPX #$23
3238 : d0 08 __ BNE $3242 ; (printf.s24 + 0)
.s23:
323a : a9 01 __ LDA #$01
323c : 8d bd bf STA $bfbd ; (si + 7)
323f : 4c a1 34 JMP $34a1 ; (printf.s246 + 0)
.s24:
3242 : e0 2d __ CPX #$2d
3244 : d0 08 __ BNE $324e ; (printf.s16 + 0)
.s26:
3246 : a9 01 __ LDA #$01
3248 : 8d bc bf STA $bfbc ; (si + 6)
324b : 4c a1 34 JMP $34a1 ; (printf.s246 + 0)
.s16:
324e : 85 4c __ STA T4 + 0 
3250 : e0 30 __ CPX #$30
3252 : 90 53 __ BCC $32a7 ; (printf.s32 + 0)
.s33:
3254 : e0 3a __ CPX #$3a
3256 : b0 4f __ BCS $32a7 ; (printf.s32 + 0)
.s30:
3258 : a9 00 __ LDA #$00
325a : 85 4d __ STA T6 + 0 
325c : 85 4e __ STA T6 + 1 
325e : e0 3a __ CPX #$3a
3260 : b0 40 __ BCS $32a2 ; (printf.s36 + 0)
.l35:
3262 : a5 4d __ LDA T6 + 0 
3264 : 0a __ __ ASL
3265 : 85 1b __ STA ACCU + 0 
3267 : a5 4e __ LDA T6 + 1 
3269 : 2a __ __ ROL
326a : 06 1b __ ASL ACCU + 0 
326c : 2a __ __ ROL
326d : aa __ __ TAX
326e : 18 __ __ CLC
326f : a5 1b __ LDA ACCU + 0 
3271 : 65 4d __ ADC T6 + 0 
3273 : 85 4d __ STA T6 + 0 
3275 : 8a __ __ TXA
3276 : 65 4e __ ADC T6 + 1 
3278 : 06 4d __ ASL T6 + 0 
327a : 2a __ __ ROL
327b : aa __ __ TAX
327c : 18 __ __ CLC
327d : a5 4d __ LDA T6 + 0 
327f : 65 4c __ ADC T4 + 0 
3281 : 90 01 __ BCC $3284 ; (printf.s1094 + 0)
.s1093:
3283 : e8 __ __ INX
.s1094:
3284 : 38 __ __ SEC
3285 : e9 30 __ SBC #$30
3287 : 85 4d __ STA T6 + 0 
3289 : 8a __ __ TXA
328a : e9 00 __ SBC #$00
328c : 85 4e __ STA T6 + 1 
328e : a0 00 __ LDY #$00
3290 : b1 4a __ LDA (T3 + 0),y 
3292 : 85 4c __ STA T4 + 0 
3294 : e6 4a __ INC T3 + 0 
3296 : d0 02 __ BNE $329a ; (printf.s1096 + 0)
.s1095:
3298 : e6 4b __ INC T3 + 1 
.s1096:
329a : c9 30 __ CMP #$30
329c : 90 04 __ BCC $32a2 ; (printf.s36 + 0)
.s37:
329e : c9 3a __ CMP #$3a
32a0 : 90 c0 __ BCC $3262 ; (printf.l35 + 0)
.s36:
32a2 : a5 4d __ LDA T6 + 0 
32a4 : 8d b7 bf STA $bfb7 ; (si + 1)
.s32:
32a7 : a5 4c __ LDA T4 + 0 
32a9 : c9 2e __ CMP #$2e
32ab : d0 51 __ BNE $32fe ; (printf.s40 + 0)
.s38:
32ad : a9 00 __ LDA #$00
32af : 85 4d __ STA T6 + 0 
.l231:
32b1 : 85 4e __ STA T6 + 1 
32b3 : a0 00 __ LDY #$00
32b5 : b1 4a __ LDA (T3 + 0),y 
32b7 : 85 4c __ STA T4 + 0 
32b9 : e6 4a __ INC T3 + 0 
32bb : d0 02 __ BNE $32bf ; (printf.s1082 + 0)
.s1081:
32bd : e6 4b __ INC T3 + 1 
.s1082:
32bf : c9 30 __ CMP #$30
32c1 : 90 04 __ BCC $32c7 ; (printf.s43 + 0)
.s44:
32c3 : c9 3a __ CMP #$3a
32c5 : 90 0a __ BCC $32d1 ; (printf.s42 + 0)
.s43:
32c7 : a5 4d __ LDA T6 + 0 
32c9 : 8d b8 bf STA $bfb8 ; (si + 2)
32cc : a5 4c __ LDA T4 + 0 
32ce : 4c fe 32 JMP $32fe ; (printf.s40 + 0)
.s42:
32d1 : a5 4d __ LDA T6 + 0 
32d3 : 0a __ __ ASL
32d4 : 85 1b __ STA ACCU + 0 
32d6 : a5 4e __ LDA T6 + 1 
32d8 : 2a __ __ ROL
32d9 : 06 1b __ ASL ACCU + 0 
32db : 2a __ __ ROL
32dc : aa __ __ TAX
32dd : 18 __ __ CLC
32de : a5 1b __ LDA ACCU + 0 
32e0 : 65 4d __ ADC T6 + 0 
32e2 : 85 4d __ STA T6 + 0 
32e4 : 8a __ __ TXA
32e5 : 65 4e __ ADC T6 + 1 
32e7 : 06 4d __ ASL T6 + 0 
32e9 : 2a __ __ ROL
32ea : aa __ __ TAX
32eb : 18 __ __ CLC
32ec : a5 4d __ LDA T6 + 0 
32ee : 65 4c __ ADC T4 + 0 
32f0 : 90 01 __ BCC $32f3 ; (printf.s1092 + 0)
.s1091:
32f2 : e8 __ __ INX
.s1092:
32f3 : 38 __ __ SEC
32f4 : e9 30 __ SBC #$30
32f6 : 85 4d __ STA T6 + 0 
32f8 : 8a __ __ TXA
32f9 : e9 00 __ SBC #$00
32fb : 4c b1 32 JMP $32b1 ; (printf.l231 + 0)
.s40:
32fe : c9 64 __ CMP #$64
3300 : f0 04 __ BEQ $3306 ; (printf.s45 + 0)
.s48:
3302 : c9 44 __ CMP #$44
3304 : d0 05 __ BNE $330b ; (printf.s46 + 0)
.s45:
3306 : a9 01 __ LDA #$01
3308 : 4c 7a 34 JMP $347a ; (printf.s247 + 0)
.s46:
330b : c9 75 __ CMP #$75
330d : d0 03 __ BNE $3312 ; (printf.s52 + 0)
330f : 4c 78 34 JMP $3478 ; (printf.s269 + 0)
.s52:
3312 : c9 55 __ CMP #$55
3314 : d0 03 __ BNE $3319 ; (printf.s50 + 0)
3316 : 4c 78 34 JMP $3478 ; (printf.s269 + 0)
.s50:
3319 : c9 78 __ CMP #$78
331b : f0 04 __ BEQ $3321 ; (printf.s53 + 0)
.s56:
331d : c9 58 __ CMP #$58
331f : d0 0d __ BNE $332e ; (printf.s54 + 0)
.s53:
3321 : a9 10 __ LDA #$10
3323 : 8d b9 bf STA $bfb9 ; (si + 3)
3326 : a9 00 __ LDA #$00
3328 : 8d ba bf STA $bfba ; (si + 4)
332b : 4c 78 34 JMP $3478 ; (printf.s269 + 0)
.s54:
332e : c9 6c __ CMP #$6c
3330 : d0 03 __ BNE $3335 ; (printf.s60 + 0)
3332 : 4c 0a 34 JMP $340a ; (printf.s57 + 0)
.s60:
3335 : c9 4c __ CMP #$4c
3337 : d0 03 __ BNE $333c ; (printf.s58 + 0)
3339 : 4c 0a 34 JMP $340a ; (printf.s57 + 0)
.s58:
333c : c9 73 __ CMP #$73
333e : f0 39 __ BEQ $3379 ; (printf.s73 + 0)
.s76:
3340 : c9 53 __ CMP #$53
3342 : f0 35 __ BEQ $3379 ; (printf.s73 + 0)
.s74:
3344 : c9 63 __ CMP #$63
3346 : f0 15 __ BEQ $335d ; (printf.s104 + 0)
.s107:
3348 : c9 43 __ CMP #$43
334a : f0 11 __ BEQ $335d ; (printf.s104 + 0)
.s105:
334c : 09 00 __ ORA #$00
334e : d0 03 __ BNE $3353 ; (printf.s108 + 0)
3350 : 4c 84 31 JMP $3184 ; (printf.l2 + 0)
.s108:
3353 : a6 49 __ LDX T2 + 0 
3355 : 9d be bf STA $bfbe,x ; (buff + 0)
3358 : e6 49 __ INC T2 + 0 
335a : 4c 84 31 JMP $3184 ; (printf.l2 + 0)
.s104:
335d : a0 00 __ LDY #$00
335f : b1 47 __ LDA (T0 + 0),y 
3361 : a6 49 __ LDX T2 + 0 
3363 : 9d be bf STA $bfbe,x ; (buff + 0)
3366 : e6 49 __ INC T2 + 0 
.s244:
3368 : 18 __ __ CLC
3369 : a5 47 __ LDA T0 + 0 
336b : 69 02 __ ADC #$02
336d : 85 47 __ STA T0 + 0 
336f : b0 03 __ BCS $3374 ; (printf.s1083 + 0)
3371 : 4c 84 31 JMP $3184 ; (printf.l2 + 0)
.s1083:
3374 : e6 48 __ INC T0 + 1 
3376 : 4c 84 31 JMP $3184 ; (printf.l2 + 0)
.s73:
3379 : a0 00 __ LDY #$00
337b : 84 4c __ STY T4 + 0 
337d : b1 47 __ LDA (T0 + 0),y 
337f : 85 4d __ STA T6 + 0 
3381 : c8 __ __ INY
3382 : b1 47 __ LDA (T0 + 0),y 
3384 : 85 4e __ STA T6 + 1 
3386 : 18 __ __ CLC
3387 : a5 47 __ LDA T0 + 0 
3389 : 69 02 __ ADC #$02
338b : 85 47 __ STA T0 + 0 
338d : 90 02 __ BCC $3391 ; (printf.s1090 + 0)
.s1089:
338f : e6 48 __ INC T0 + 1 
.s1090:
3391 : ad b7 bf LDA $bfb7 ; (si + 1)
3394 : f0 0d __ BEQ $33a3 ; (printf.s79 + 0)
.s1071:
3396 : a0 00 __ LDY #$00
3398 : b1 4d __ LDA (T6 + 0),y 
339a : f0 05 __ BEQ $33a1 ; (printf.s1072 + 0)
.l81:
339c : c8 __ __ INY
339d : b1 4d __ LDA (T6 + 0),y 
339f : d0 fb __ BNE $339c ; (printf.l81 + 0)
.s1072:
33a1 : 84 4c __ STY T4 + 0 
.s79:
33a3 : ad bc bf LDA $bfbc ; (si + 6)
33a6 : d0 1a __ BNE $33c2 ; (printf.s85 + 0)
.s1075:
33a8 : a4 4c __ LDY T4 + 0 
33aa : cc b7 bf CPY $bfb7 ; (si + 1)
33ad : a6 49 __ LDX T2 + 0 
33af : b0 0d __ BCS $33be ; (printf.s1076 + 0)
.l87:
33b1 : ad b6 bf LDA $bfb6 ; (si + 0)
33b4 : 9d be bf STA $bfbe,x ; (buff + 0)
33b7 : c8 __ __ INY
33b8 : cc b7 bf CPY $bfb7 ; (si + 1)
33bb : e8 __ __ INX
33bc : 90 f3 __ BCC $33b1 ; (printf.l87 + 0)
.s1076:
33be : 86 49 __ STX T2 + 0 
33c0 : 84 4c __ STY T4 + 0 
.s85:
33c2 : a5 49 __ LDA T2 + 0 
33c4 : f0 16 __ BEQ $33dc ; (printf.s238 + 0)
.s92:
33c6 : a9 be __ LDA #$be
33c8 : 85 0d __ STA P0 ; (fmt + 0)
33ca : a9 bf __ LDA #$bf
33cc : 85 0e __ STA P1 ; (fmt + 1)
33ce : a9 00 __ LDA #$00
33d0 : a6 49 __ LDX T2 + 0 
33d2 : 9d be bf STA $bfbe,x ; (buff + 0)
33d5 : 20 ae 34 JSR $34ae ; (puts.s0 + 0)
33d8 : a9 00 __ LDA #$00
33da : 85 49 __ STA T2 + 0 
.s238:
33dc : a5 4d __ LDA T6 + 0 
33de : 85 0d __ STA P0 ; (fmt + 0)
33e0 : a5 4e __ LDA T6 + 1 
33e2 : 85 0e __ STA P1 ; (fmt + 1)
33e4 : 20 ae 34 JSR $34ae ; (puts.s0 + 0)
33e7 : ad bc bf LDA $bfbc ; (si + 6)
33ea : d0 03 __ BNE $33ef ; (printf.s1073 + 0)
33ec : 4c 84 31 JMP $3184 ; (printf.l2 + 0)
.s1073:
33ef : a4 4c __ LDY T4 + 0 
33f1 : cc b7 bf CPY $bfb7 ; (si + 1)
33f4 : a2 00 __ LDX #$00
33f6 : b0 0d __ BCS $3405 ; (printf.s1074 + 0)
.l102:
33f8 : ad b6 bf LDA $bfb6 ; (si + 0)
33fb : 9d be bf STA $bfbe,x ; (buff + 0)
33fe : c8 __ __ INY
33ff : cc b7 bf CPY $bfb7 ; (si + 1)
3402 : e8 __ __ INX
3403 : 90 f3 __ BCC $33f8 ; (printf.l102 + 0)
.s1074:
3405 : 86 49 __ STX T2 + 0 
3407 : 4c 84 31 JMP $3184 ; (printf.l2 + 0)
.s57:
340a : a0 00 __ LDY #$00
340c : b1 47 __ LDA (T0 + 0),y 
340e : 85 53 __ STA T8 + 0 
3410 : c8 __ __ INY
3411 : b1 47 __ LDA (T0 + 0),y 
3413 : 85 54 __ STA T8 + 1 
3415 : c8 __ __ INY
3416 : b1 47 __ LDA (T0 + 0),y 
3418 : 85 55 __ STA T8 + 2 
341a : c8 __ __ INY
341b : b1 47 __ LDA (T0 + 0),y 
341d : 85 56 __ STA T8 + 3 
341f : 18 __ __ CLC
3420 : a5 47 __ LDA T0 + 0 
3422 : 69 04 __ ADC #$04
3424 : 85 47 __ STA T0 + 0 
3426 : 90 02 __ BCC $342a ; (printf.s1086 + 0)
.s1085:
3428 : e6 48 __ INC T0 + 1 
.s1086:
342a : a0 00 __ LDY #$00
342c : b1 4a __ LDA (T3 + 0),y 
342e : aa __ __ TAX
342f : e6 4a __ INC T3 + 0 
3431 : d0 02 __ BNE $3435 ; (printf.s1088 + 0)
.s1087:
3433 : e6 4b __ INC T3 + 1 
.s1088:
3435 : 8a __ __ TXA
3436 : e0 64 __ CPX #$64
3438 : f0 04 __ BEQ $343e ; (printf.s61 + 0)
.s64:
343a : c9 44 __ CMP #$44
343c : d0 04 __ BNE $3442 ; (printf.s62 + 0)
.s61:
343e : a9 01 __ LDA #$01
3440 : d0 1c __ BNE $345e ; (printf.s245 + 0)
.s62:
3442 : c9 75 __ CMP #$75
3444 : f0 17 __ BEQ $345d ; (printf.s268 + 0)
.s68:
3446 : c9 55 __ CMP #$55
3448 : f0 13 __ BEQ $345d ; (printf.s268 + 0)
.s66:
344a : c9 78 __ CMP #$78
344c : f0 07 __ BEQ $3455 ; (printf.s69 + 0)
.s72:
344e : c9 58 __ CMP #$58
3450 : f0 03 __ BEQ $3455 ; (printf.s69 + 0)
3452 : 4c 84 31 JMP $3184 ; (printf.l2 + 0)
.s69:
3455 : 8c ba bf STY $bfba ; (si + 4)
3458 : a9 10 __ LDA #$10
345a : 8d b9 bf STA $bfb9 ; (si + 3)
.s268:
345d : 98 __ __ TYA
.s245:
345e : 85 15 __ STA P8 
3460 : a9 be __ LDA #$be
3462 : 85 0f __ STA P2 ; (fmt + 2)
3464 : a9 bf __ LDA #$bf
3466 : 85 10 __ STA P3 ; (fmt + 3)
3468 : a9 b6 __ LDA #$b6
346a : 85 0d __ STA P0 ; (fmt + 0)
346c : a9 bf __ LDA #$bf
346e : 85 0e __ STA P1 ; (fmt + 1)
3470 : 20 38 36 JSR $3638 ; (nforml@proxy + 0)
3473 : a5 1b __ LDA ACCU + 0 
3475 : 4c cf 31 JMP $31cf ; (printf.s1068 + 0)
.s269:
3478 : a9 00 __ LDA #$00
.s247:
347a : 85 13 __ STA P6 
347c : a9 be __ LDA #$be
347e : 85 0f __ STA P2 ; (fmt + 2)
3480 : a9 bf __ LDA #$bf
3482 : 85 10 __ STA P3 ; (fmt + 3)
3484 : a0 00 __ LDY #$00
3486 : b1 47 __ LDA (T0 + 0),y 
3488 : 85 11 __ STA P4 
348a : c8 __ __ INY
348b : b1 47 __ LDA (T0 + 0),y 
348d : 85 12 __ STA P5 
348f : a9 b6 __ LDA #$b6
3491 : 85 0d __ STA P0 ; (fmt + 0)
3493 : a9 bf __ LDA #$bf
3495 : 85 0e __ STA P1 ; (fmt + 1)
3497 : 20 03 35 JSR $3503 ; (nformi.s0 + 0)
349a : a5 1b __ LDA ACCU + 0 
349c : 85 49 __ STA T2 + 0 
349e : 4c 68 33 JMP $3368 ; (printf.s244 + 0)
.s246:
34a1 : a0 00 __ LDY #$00
34a3 : b1 4a __ LDA (T3 + 0),y 
34a5 : aa __ __ TAX
34a6 : 18 __ __ CLC
34a7 : a5 4a __ LDA T3 + 0 
34a9 : 69 01 __ ADC #$01
34ab : 4c 19 32 JMP $3219 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
34ae : a0 00 __ LDY #$00
34b0 : b1 0d __ LDA (P0),y 
34b2 : f0 0b __ BEQ $34bf ; (puts.s1001 + 0)
34b4 : 20 c0 34 JSR $34c0 ; (putpch + 0)
34b7 : e6 0d __ INC P0 
34b9 : d0 f3 __ BNE $34ae ; (puts.s0 + 0)
34bb : e6 0e __ INC P1 
34bd : d0 ef __ BNE $34ae ; (puts.s0 + 0)
.s1001:
34bf : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
34c0 : ae ff 39 LDX $39ff ; (giocharmap + 0)
34c3 : e0 01 __ CPX #$01
34c5 : 90 26 __ BCC $34ed ; (putpch + 45)
34c7 : c9 0a __ CMP #$0a
34c9 : d0 02 __ BNE $34cd ; (putpch + 13)
34cb : a9 0d __ LDA #$0d
34cd : c9 09 __ CMP #$09
34cf : f0 1f __ BEQ $34f0 ; (putpch + 48)
34d1 : e0 02 __ CPX #$02
34d3 : 90 18 __ BCC $34ed ; (putpch + 45)
34d5 : c9 41 __ CMP #$41
34d7 : 90 14 __ BCC $34ed ; (putpch + 45)
34d9 : c9 7b __ CMP #$7b
34db : b0 10 __ BCS $34ed ; (putpch + 45)
34dd : c9 61 __ CMP #$61
34df : b0 04 __ BCS $34e5 ; (putpch + 37)
34e1 : c9 5b __ CMP #$5b
34e3 : b0 08 __ BCS $34ed ; (putpch + 45)
34e5 : 49 20 __ EOR #$20
34e7 : e0 03 __ CPX #$03
34e9 : f0 02 __ BEQ $34ed ; (putpch + 45)
34eb : 29 df __ AND #$df
34ed : 4c d2 ff JMP $ffd2 
34f0 : 38 __ __ SEC
34f1 : 20 f0 ff JSR $fff0 
34f4 : 98 __ __ TYA
34f5 : 29 03 __ AND #$03
34f7 : 49 03 __ EOR #$03
34f9 : aa __ __ TAX
34fa : a9 20 __ LDA #$20
34fc : 20 d2 ff JSR $ffd2 
34ff : ca __ __ DEX
3500 : 10 fa __ BPL $34fc ; (putpch + 60)
3502 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
3503 : a9 00 __ LDA #$00
3505 : 85 43 __ STA T0 + 0 
3507 : a5 13 __ LDA P6 ; (s + 0)
3509 : f0 13 __ BEQ $351e ; (nformi.s182 + 0)
.s4:
350b : 24 12 __ BIT P5 ; (v + 1)
350d : 10 0f __ BPL $351e ; (nformi.s182 + 0)
.s1:
350f : 38 __ __ SEC
3510 : a9 00 __ LDA #$00
3512 : e5 11 __ SBC P4 ; (v + 0)
3514 : 85 11 __ STA P4 ; (v + 0)
3516 : a9 00 __ LDA #$00
3518 : e5 12 __ SBC P5 ; (v + 1)
351a : 85 12 __ STA P5 ; (v + 1)
351c : e6 43 __ INC T0 + 0 
.s182:
351e : a9 10 __ LDA #$10
3520 : 85 44 __ STA T2 + 0 
3522 : a5 11 __ LDA P4 ; (v + 0)
3524 : 05 12 __ ORA P5 ; (v + 1)
3526 : f0 46 __ BEQ $356e ; (nformi.s7 + 0)
.s42:
3528 : a0 03 __ LDY #$03
352a : b1 0d __ LDA (P0),y ; (si + 0)
352c : 85 45 __ STA T4 + 0 
352e : c8 __ __ INY
352f : b1 0d __ LDA (P0),y ; (si + 0)
3531 : 85 46 __ STA T4 + 1 
.l6:
3533 : a5 11 __ LDA P4 ; (v + 0)
3535 : 85 1b __ STA ACCU + 0 
3537 : a5 12 __ LDA P5 ; (v + 1)
3539 : 85 1c __ STA ACCU + 1 
353b : a5 45 __ LDA T4 + 0 
353d : 85 03 __ STA WORK + 0 
353f : a5 46 __ LDA T4 + 1 
3541 : 85 04 __ STA WORK + 1 
3543 : 20 3c 43 JSR $433c ; (divmod + 0)
3546 : a5 06 __ LDA WORK + 3 
3548 : 30 08 __ BMI $3552 ; (nformi.s78 + 0)
.s1019:
354a : d0 0a __ BNE $3556 ; (nformi.s77 + 0)
.s1018:
354c : a5 05 __ LDA WORK + 2 
354e : c9 0a __ CMP #$0a
3550 : b0 04 __ BCS $3556 ; (nformi.s77 + 0)
.s78:
3552 : a9 30 __ LDA #$30
3554 : d0 02 __ BNE $3558 ; (nformi.s79 + 0)
.s77:
3556 : a9 37 __ LDA #$37
.s79:
3558 : 18 __ __ CLC
3559 : 65 05 __ ADC WORK + 2 
355b : c6 44 __ DEC T2 + 0 
355d : a6 44 __ LDX T2 + 0 
355f : 9d f0 bf STA $bff0,x ; (buffer + 0)
3562 : a5 1b __ LDA ACCU + 0 
3564 : 85 11 __ STA P4 ; (v + 0)
3566 : a5 1c __ LDA ACCU + 1 
3568 : 85 12 __ STA P5 ; (v + 1)
356a : 05 11 __ ORA P4 ; (v + 0)
356c : d0 c5 __ BNE $3533 ; (nformi.l6 + 0)
.s7:
356e : a0 02 __ LDY #$02
3570 : b1 0d __ LDA (P0),y ; (si + 0)
3572 : c9 ff __ CMP #$ff
3574 : d0 04 __ BNE $357a ; (nformi.s80 + 0)
.s81:
3576 : a9 0f __ LDA #$0f
3578 : d0 05 __ BNE $357f ; (nformi.s1026 + 0)
.s80:
357a : 38 __ __ SEC
357b : a9 10 __ LDA #$10
357d : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
357f : a8 __ __ TAY
3580 : c4 44 __ CPY T2 + 0 
3582 : b0 0d __ BCS $3591 ; (nformi.s10 + 0)
.s9:
3584 : a9 30 __ LDA #$30
.l1027:
3586 : c6 44 __ DEC T2 + 0 
3588 : a6 44 __ LDX T2 + 0 
358a : 9d f0 bf STA $bff0,x ; (buffer + 0)
358d : c4 44 __ CPY T2 + 0 
358f : 90 f5 __ BCC $3586 ; (nformi.l1027 + 0)
.s10:
3591 : a0 07 __ LDY #$07
3593 : b1 0d __ LDA (P0),y ; (si + 0)
3595 : f0 20 __ BEQ $35b7 ; (nformi.s13 + 0)
.s14:
3597 : a0 04 __ LDY #$04
3599 : b1 0d __ LDA (P0),y ; (si + 0)
359b : d0 1a __ BNE $35b7 ; (nformi.s13 + 0)
.s1013:
359d : 88 __ __ DEY
359e : b1 0d __ LDA (P0),y ; (si + 0)
35a0 : c9 10 __ CMP #$10
35a2 : d0 13 __ BNE $35b7 ; (nformi.s13 + 0)
.s11:
35a4 : a9 58 __ LDA #$58
35a6 : a6 44 __ LDX T2 + 0 
35a8 : 9d ef bf STA $bfef,x ; (buff + 49)
35ab : 8a __ __ TXA
35ac : 18 __ __ CLC
35ad : 69 fe __ ADC #$fe
35af : 85 44 __ STA T2 + 0 
35b1 : aa __ __ TAX
35b2 : a9 30 __ LDA #$30
35b4 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
35b7 : a9 00 __ LDA #$00
35b9 : 85 1b __ STA ACCU + 0 
35bb : a5 43 __ LDA T0 + 0 
35bd : f0 06 __ BEQ $35c5 ; (nformi.s16 + 0)
.s15:
35bf : c6 44 __ DEC T2 + 0 
35c1 : a9 2d __ LDA #$2d
35c3 : d0 0a __ BNE $35cf ; (nformi.s1025 + 0)
.s16:
35c5 : a0 05 __ LDY #$05
35c7 : b1 0d __ LDA (P0),y ; (si + 0)
35c9 : f0 09 __ BEQ $35d4 ; (nformi.s163 + 0)
.s18:
35cb : c6 44 __ DEC T2 + 0 
35cd : a9 2b __ LDA #$2b
.s1025:
35cf : a6 44 __ LDX T2 + 0 
35d1 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
35d4 : a0 06 __ LDY #$06
35d6 : b1 0d __ LDA (P0),y ; (si + 0)
35d8 : d0 33 __ BNE $360d ; (nformi.s24 + 0)
.l30:
35da : a0 01 __ LDY #$01
35dc : b1 0d __ LDA (P0),y ; (si + 0)
35de : 18 __ __ CLC
35df : 65 44 __ ADC T2 + 0 
35e1 : b0 04 __ BCS $35e7 ; (nformi.s31 + 0)
.s1006:
35e3 : c9 11 __ CMP #$11
35e5 : 90 0d __ BCC $35f4 ; (nformi.s33 + 0)
.s31:
35e7 : c6 44 __ DEC T2 + 0 
35e9 : a0 00 __ LDY #$00
35eb : b1 0d __ LDA (P0),y ; (si + 0)
35ed : a6 44 __ LDX T2 + 0 
35ef : 9d f0 bf STA $bff0,x ; (buffer + 0)
35f2 : b0 e6 __ BCS $35da ; (nformi.l30 + 0)
.s33:
35f4 : a6 44 __ LDX T2 + 0 
35f6 : e0 10 __ CPX #$10
35f8 : b0 0e __ BCS $3608 ; (nformi.s23 + 0)
.s34:
35fa : 88 __ __ DEY
.l1022:
35fb : bd f0 bf LDA $bff0,x ; (buffer + 0)
35fe : 91 0f __ STA (P2),y ; (str + 0)
3600 : e8 __ __ INX
3601 : e0 10 __ CPX #$10
3603 : c8 __ __ INY
3604 : 90 f5 __ BCC $35fb ; (nformi.l1022 + 0)
.s1023:
3606 : 84 1b __ STY ACCU + 0 
.s23:
3608 : a9 00 __ LDA #$00
360a : 85 1c __ STA ACCU + 1 
.s1001:
360c : 60 __ __ RTS
.s24:
360d : a6 44 __ LDX T2 + 0 
360f : e0 10 __ CPX #$10
3611 : b0 1a __ BCS $362d ; (nformi.l27 + 0)
.s25:
3613 : a0 00 __ LDY #$00
.l1020:
3615 : bd f0 bf LDA $bff0,x ; (buffer + 0)
3618 : 91 0f __ STA (P2),y ; (str + 0)
361a : e8 __ __ INX
361b : e0 10 __ CPX #$10
361d : c8 __ __ INY
361e : 90 f5 __ BCC $3615 ; (nformi.l1020 + 0)
.s1021:
3620 : 84 1b __ STY ACCU + 0 
3622 : b0 09 __ BCS $362d ; (nformi.l27 + 0)
.s28:
3624 : 88 __ __ DEY
3625 : b1 0d __ LDA (P0),y ; (si + 0)
3627 : a4 1b __ LDY ACCU + 0 
3629 : 91 0f __ STA (P2),y ; (str + 0)
362b : e6 1b __ INC ACCU + 0 
.l27:
362d : a5 1b __ LDA ACCU + 0 
362f : a0 01 __ LDY #$01
3631 : d1 0d __ CMP (P0),y ; (si + 0)
3633 : 90 ef __ BCC $3624 ; (nformi.s28 + 0)
3635 : 4c 08 36 JMP $3608 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml@proxy: ; nforml@proxy
3638 : a5 53 __ LDA $53 
363a : 85 11 __ STA P4 
363c : a5 54 __ LDA $54 
363e : 85 12 __ STA P5 
3640 : a5 55 __ LDA $55 
3642 : 85 13 __ STA P6 
3644 : a5 56 __ LDA $56 
3646 : 85 14 __ STA P7 
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
3648 : a9 00 __ LDA #$00
364a : 85 43 __ STA T0 + 0 
364c : a5 15 __ LDA P8 ; (s + 0)
364e : f0 21 __ BEQ $3671 ; (nforml.s182 + 0)
.s4:
3650 : a5 14 __ LDA P7 ; (v + 3)
3652 : f0 1d __ BEQ $3671 ; (nforml.s182 + 0)
.s1032:
3654 : 10 1b __ BPL $3671 ; (nforml.s182 + 0)
.s1:
3656 : 38 __ __ SEC
3657 : a9 00 __ LDA #$00
3659 : e5 11 __ SBC P4 ; (v + 0)
365b : 85 11 __ STA P4 ; (v + 0)
365d : a9 00 __ LDA #$00
365f : e5 12 __ SBC P5 ; (v + 1)
3661 : 85 12 __ STA P5 ; (v + 1)
3663 : a9 00 __ LDA #$00
3665 : e5 13 __ SBC P6 ; (v + 2)
3667 : 85 13 __ STA P6 ; (v + 2)
3669 : a9 00 __ LDA #$00
366b : e5 14 __ SBC P7 ; (v + 3)
366d : 85 14 __ STA P7 ; (v + 3)
366f : e6 43 __ INC T0 + 0 
.s182:
3671 : a9 10 __ LDA #$10
3673 : 85 44 __ STA T2 + 0 
3675 : a5 14 __ LDA P7 ; (v + 3)
3677 : d0 0c __ BNE $3685 ; (nforml.s42 + 0)
.s1024:
3679 : a5 13 __ LDA P6 ; (v + 2)
367b : d0 08 __ BNE $3685 ; (nforml.s42 + 0)
.s1025:
367d : a5 12 __ LDA P5 ; (v + 1)
367f : d0 04 __ BNE $3685 ; (nforml.s42 + 0)
.s1026:
3681 : c5 11 __ CMP P4 ; (v + 0)
3683 : b0 0e __ BCS $3693 ; (nforml.s7 + 0)
.s42:
3685 : a0 03 __ LDY #$03
3687 : b1 0d __ LDA (P0),y ; (si + 0)
3689 : 85 45 __ STA T5 + 0 
368b : c8 __ __ INY
368c : b1 0d __ LDA (P0),y ; (si + 0)
368e : 85 46 __ STA T5 + 1 
3690 : 4c 5d 37 JMP $375d ; (nforml.l6 + 0)
.s7:
3693 : a0 02 __ LDY #$02
3695 : b1 0d __ LDA (P0),y ; (si + 0)
3697 : c9 ff __ CMP #$ff
3699 : d0 04 __ BNE $369f ; (nforml.s80 + 0)
.s81:
369b : a9 0f __ LDA #$0f
369d : d0 05 __ BNE $36a4 ; (nforml.s1039 + 0)
.s80:
369f : 38 __ __ SEC
36a0 : a9 10 __ LDA #$10
36a2 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
36a4 : a8 __ __ TAY
36a5 : c4 44 __ CPY T2 + 0 
36a7 : b0 0d __ BCS $36b6 ; (nforml.s10 + 0)
.s9:
36a9 : a9 30 __ LDA #$30
.l1040:
36ab : c6 44 __ DEC T2 + 0 
36ad : a6 44 __ LDX T2 + 0 
36af : 9d f0 bf STA $bff0,x ; (buffer + 0)
36b2 : c4 44 __ CPY T2 + 0 
36b4 : 90 f5 __ BCC $36ab ; (nforml.l1040 + 0)
.s10:
36b6 : a0 07 __ LDY #$07
36b8 : b1 0d __ LDA (P0),y ; (si + 0)
36ba : f0 20 __ BEQ $36dc ; (nforml.s13 + 0)
.s14:
36bc : a0 04 __ LDY #$04
36be : b1 0d __ LDA (P0),y ; (si + 0)
36c0 : d0 1a __ BNE $36dc ; (nforml.s13 + 0)
.s1013:
36c2 : 88 __ __ DEY
36c3 : b1 0d __ LDA (P0),y ; (si + 0)
36c5 : c9 10 __ CMP #$10
36c7 : d0 13 __ BNE $36dc ; (nforml.s13 + 0)
.s11:
36c9 : a9 58 __ LDA #$58
36cb : a6 44 __ LDX T2 + 0 
36cd : 9d ef bf STA $bfef,x ; (buff + 49)
36d0 : 8a __ __ TXA
36d1 : 18 __ __ CLC
36d2 : 69 fe __ ADC #$fe
36d4 : 85 44 __ STA T2 + 0 
36d6 : aa __ __ TAX
36d7 : a9 30 __ LDA #$30
36d9 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
36dc : a9 00 __ LDA #$00
36de : 85 1b __ STA ACCU + 0 
36e0 : a5 43 __ LDA T0 + 0 
36e2 : f0 06 __ BEQ $36ea ; (nforml.s16 + 0)
.s15:
36e4 : c6 44 __ DEC T2 + 0 
36e6 : a9 2d __ LDA #$2d
36e8 : d0 0a __ BNE $36f4 ; (nforml.s1038 + 0)
.s16:
36ea : a0 05 __ LDY #$05
36ec : b1 0d __ LDA (P0),y ; (si + 0)
36ee : f0 09 __ BEQ $36f9 ; (nforml.s163 + 0)
.s18:
36f0 : c6 44 __ DEC T2 + 0 
36f2 : a9 2b __ LDA #$2b
.s1038:
36f4 : a6 44 __ LDX T2 + 0 
36f6 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
36f9 : a0 06 __ LDY #$06
36fb : b1 0d __ LDA (P0),y ; (si + 0)
36fd : d0 33 __ BNE $3732 ; (nforml.s24 + 0)
.l30:
36ff : a0 01 __ LDY #$01
3701 : b1 0d __ LDA (P0),y ; (si + 0)
3703 : 18 __ __ CLC
3704 : 65 44 __ ADC T2 + 0 
3706 : b0 04 __ BCS $370c ; (nforml.s31 + 0)
.s1006:
3708 : c9 11 __ CMP #$11
370a : 90 0d __ BCC $3719 ; (nforml.s33 + 0)
.s31:
370c : c6 44 __ DEC T2 + 0 
370e : a0 00 __ LDY #$00
3710 : b1 0d __ LDA (P0),y ; (si + 0)
3712 : a6 44 __ LDX T2 + 0 
3714 : 9d f0 bf STA $bff0,x ; (buffer + 0)
3717 : b0 e6 __ BCS $36ff ; (nforml.l30 + 0)
.s33:
3719 : a6 44 __ LDX T2 + 0 
371b : e0 10 __ CPX #$10
371d : b0 0e __ BCS $372d ; (nforml.s23 + 0)
.s34:
371f : 88 __ __ DEY
.l1035:
3720 : bd f0 bf LDA $bff0,x ; (buffer + 0)
3723 : 91 0f __ STA (P2),y ; (str + 0)
3725 : e8 __ __ INX
3726 : e0 10 __ CPX #$10
3728 : c8 __ __ INY
3729 : 90 f5 __ BCC $3720 ; (nforml.l1035 + 0)
.s1036:
372b : 84 1b __ STY ACCU + 0 
.s23:
372d : a9 00 __ LDA #$00
372f : 85 1c __ STA ACCU + 1 
.s1001:
3731 : 60 __ __ RTS
.s24:
3732 : a6 44 __ LDX T2 + 0 
3734 : e0 10 __ CPX #$10
3736 : b0 1a __ BCS $3752 ; (nforml.l27 + 0)
.s25:
3738 : a0 00 __ LDY #$00
.l1033:
373a : bd f0 bf LDA $bff0,x ; (buffer + 0)
373d : 91 0f __ STA (P2),y ; (str + 0)
373f : e8 __ __ INX
3740 : e0 10 __ CPX #$10
3742 : c8 __ __ INY
3743 : 90 f5 __ BCC $373a ; (nforml.l1033 + 0)
.s1034:
3745 : 84 1b __ STY ACCU + 0 
3747 : b0 09 __ BCS $3752 ; (nforml.l27 + 0)
.s28:
3749 : 88 __ __ DEY
374a : b1 0d __ LDA (P0),y ; (si + 0)
374c : a4 1b __ LDY ACCU + 0 
374e : 91 0f __ STA (P2),y ; (str + 0)
3750 : e6 1b __ INC ACCU + 0 
.l27:
3752 : a5 1b __ LDA ACCU + 0 
3754 : a0 01 __ LDY #$01
3756 : d1 0d __ CMP (P0),y ; (si + 0)
3758 : 90 ef __ BCC $3749 ; (nforml.s28 + 0)
375a : 4c 2d 37 JMP $372d ; (nforml.s23 + 0)
.l6:
375d : a5 11 __ LDA P4 ; (v + 0)
375f : 85 1b __ STA ACCU + 0 
3761 : a5 12 __ LDA P5 ; (v + 1)
3763 : 85 1c __ STA ACCU + 1 
3765 : a5 13 __ LDA P6 ; (v + 2)
3767 : 85 1d __ STA ACCU + 2 
3769 : a5 14 __ LDA P7 ; (v + 3)
376b : 85 1e __ STA ACCU + 3 
376d : a5 45 __ LDA T5 + 0 
376f : 85 03 __ STA WORK + 0 
3771 : a5 46 __ LDA T5 + 1 
3773 : 85 04 __ STA WORK + 1 
3775 : a9 00 __ LDA #$00
3777 : 85 05 __ STA WORK + 2 
3779 : 85 06 __ STA WORK + 3 
377b : 20 c1 43 JSR $43c1 ; (divmod32 + 0)
377e : a5 08 __ LDA WORK + 5 
3780 : 30 08 __ BMI $378a ; (nforml.s78 + 0)
.s1023:
3782 : d0 0a __ BNE $378e ; (nforml.s77 + 0)
.s1022:
3784 : a5 07 __ LDA WORK + 4 
3786 : c9 0a __ CMP #$0a
3788 : b0 04 __ BCS $378e ; (nforml.s77 + 0)
.s78:
378a : a9 30 __ LDA #$30
378c : d0 02 __ BNE $3790 ; (nforml.s79 + 0)
.s77:
378e : a9 37 __ LDA #$37
.s79:
3790 : 18 __ __ CLC
3791 : 65 07 __ ADC WORK + 4 
3793 : c6 44 __ DEC T2 + 0 
3795 : a6 44 __ LDX T2 + 0 
3797 : 9d f0 bf STA $bff0,x ; (buffer + 0)
379a : a5 1b __ LDA ACCU + 0 
379c : 85 11 __ STA P4 ; (v + 0)
379e : a5 1c __ LDA ACCU + 1 
37a0 : 85 12 __ STA P5 ; (v + 1)
37a2 : a5 1d __ LDA ACCU + 2 
37a4 : 85 13 __ STA P6 ; (v + 2)
37a6 : a5 1e __ LDA ACCU + 3 
37a8 : 85 14 __ STA P7 ; (v + 3)
37aa : d0 b1 __ BNE $375d ; (nforml.l6 + 0)
.s1018:
37ac : a5 13 __ LDA P6 ; (v + 2)
37ae : d0 ad __ BNE $375d ; (nforml.l6 + 0)
.s1019:
37b0 : a5 12 __ LDA P5 ; (v + 1)
37b2 : d0 a9 __ BNE $375d ; (nforml.l6 + 0)
.s1020:
37b4 : c5 11 __ CMP P4 ; (v + 0)
37b6 : 90 a5 __ BCC $375d ; (nforml.l6 + 0)
37b8 : 4c 93 36 JMP $3693 ; (nforml.s7 + 0)
--------------------------------------------------------------------
37bb : __ __ __ BYT 57 52 49 54 45 20 44 41 54 41 2e 0a 00          : WRITE DATA...
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
37c8 : a5 0d __ LDA P0 
37ca : a6 0e __ LDX P1 
37cc : 20 68 ff JSR $ff68 
.s1001:
37cf : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam@proxy: ; krnio_setnam@proxy
37d0 : a9 4c __ LDA #$4c
37d2 : 85 0d __ STA P0 
37d4 : a9 bf __ LDA #$bf
37d6 : 85 0e __ STA P1 
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
37d8 : a5 0d __ LDA P0 
37da : 05 0e __ ORA P1 
37dc : f0 08 __ BEQ $37e6 ; (krnio_setnam.s0 + 14)
37de : a0 ff __ LDY #$ff
37e0 : c8 __ __ INY
37e1 : b1 0d __ LDA (P0),y 
37e3 : d0 fb __ BNE $37e0 ; (krnio_setnam.s0 + 8)
37e5 : 98 __ __ TYA
37e6 : a6 0d __ LDX P0 
37e8 : a4 0e __ LDY P1 
37ea : 20 bd ff JSR $ffbd 
.s1001:
37ed : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrout: ; krnio_chrout(u8)->void
.s1000:
37ee : 85 0d __ STA P0 
.s0:
37f0 : a5 0d __ LDA P0 
37f2 : 20 d2 ff JSR $ffd2 
37f5 : 85 1b __ STA ACCU + 0 
37f7 : a9 00 __ LDA #$00
37f9 : 85 1c __ STA ACCU + 1 
.s1001:
37fb : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
.s0:
37fc : 20 cc ff JSR $ffcc 
.s1001:
37ff : 60 __ __ RTS
--------------------------------------------------------------------
3800 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 4f 50 45 : RETURN VALUE OPE
3810 : __ __ __ BYT 4e 3a 20 25 44 0a 00                            : N: %D..
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
.s0:
3817 : a9 00 __ LDA #$00
3819 : 8d f8 44 STA $44f8 ; (krnio_pstatus + 1)
381c : a9 00 __ LDA #$00
381e : 85 1b __ STA ACCU + 0 
3820 : 85 1c __ STA ACCU + 1 
3822 : a5 0d __ LDA P0 
3824 : a6 0e __ LDX P1 
3826 : a4 0f __ LDY P2 
3828 : 20 ba ff JSR $ffba 
382b : 20 c0 ff JSR $ffc0 
382e : 90 08 __ BCC $3838 ; (krnio_open.s0 + 33)
3830 : a5 0d __ LDA P0 
3832 : 20 c3 ff JSR $ffc3 
3835 : 4c 3c 38 JMP $383c ; (krnio_open.s1001 + 0)
3838 : a9 01 __ LDA #$01
383a : 85 1b __ STA ACCU + 0 
.s1001:
383c : a5 1b __ LDA ACCU + 0 
383e : 60 __ __ RTS
--------------------------------------------------------------------
383f : __ __ __ BYT 53 54 41 54 55 53 20 41 46 54 45 52 20 4f 50 45 : STATUS AFTER OPE
384f : __ __ __ BYT 4e 3a 20 25 44 0a 00                            : N: %D..
--------------------------------------------------------------------
3856 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 57 52 49 : RETURN VALUE WRI
3866 : __ __ __ BYT 54 45 3a 20 25 44 0a 00                         : TE: %D..
--------------------------------------------------------------------
krnio_chkout: ; krnio_chkout(u8)->bool
.s1000:
386e : 85 0d __ STA P0 
.s0:
3870 : a6 0d __ LDX P0 
3872 : 20 c9 ff JSR $ffc9 
3875 : a9 00 __ LDA #$00
3877 : 85 1c __ STA ACCU + 1 
3879 : b0 02 __ BCS $387d ; (krnio_chkout.s0 + 13)
387b : a9 01 __ LDA #$01
387d : 85 1b __ STA ACCU + 0 
.s1001:
387f : a5 1b __ LDA ACCU + 0 
3881 : 60 __ __ RTS
--------------------------------------------------------------------
3882 : __ __ __ BYT 53 54 41 54 55 53 20 41 46 54 45 52 20 57 52 49 : STATUS AFTER WRI
3892 : __ __ __ BYT 54 45 3a 20 25 44 0a 00                         : TE: %D..
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
.s1000:
389a : 85 0d __ STA P0 
.s0:
389c : a5 0d __ LDA P0 
389e : 20 c3 ff JSR $ffc3 
.s1001:
38a1 : 60 __ __ RTS
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
38a2 : a9 5b __ LDA #$5b
38a4 : 85 0d __ STA P0 
38a6 : a9 bf __ LDA #$bf
38a8 : 85 0e __ STA P1 
38aa : a9 51 __ LDA #$51
38ac : 85 11 __ STA P4 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
.s0:
38ae : a5 0f __ LDA P2 
38b0 : a6 12 __ LDX P5 
38b2 : f0 0c __ BEQ $38c0 ; (memset.s0 + 18)
38b4 : a0 00 __ LDY #$00
38b6 : 91 0d __ STA (P0),y 
38b8 : c8 __ __ INY
38b9 : d0 fb __ BNE $38b6 ; (memset.s0 + 8)
38bb : e6 0e __ INC P1 
38bd : ca __ __ DEX
38be : d0 f6 __ BNE $38b6 ; (memset.s0 + 8)
38c0 : a4 11 __ LDY P4 
38c2 : f0 05 __ BEQ $38c9 ; (memset.s1001 + 0)
38c4 : 88 __ __ DEY
38c5 : 91 0d __ STA (P0),y 
38c7 : d0 fb __ BNE $38c4 ; (memset.s0 + 22)
.s1001:
38c9 : 60 __ __ RTS
--------------------------------------------------------------------
38ca : __ __ __ BYT 52 45 41 44 20 44 41 54 41 2e 0a 00             : READ DATA...
--------------------------------------------------------------------
38d6 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 52 45 41 : RETURN VALUE REA
38e6 : __ __ __ BYT 44 3a 20 25 44 0a 00                            : D: %D..
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
.s1000:
38ed : 85 0d __ STA P0 
.s0:
38ef : a6 0d __ LDX P0 
38f1 : 20 c6 ff JSR $ffc6 
38f4 : a9 00 __ LDA #$00
38f6 : 85 1c __ STA ACCU + 1 
38f8 : b0 02 __ BCS $38fc ; (krnio_chkin.s0 + 13)
38fa : a9 01 __ LDA #$01
38fc : 85 1b __ STA ACCU + 0 
.s1001:
38fe : a5 1b __ LDA ACCU + 0 
3900 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->i16
.s0:
3901 : 20 cf ff JSR $ffcf 
3904 : 85 1b __ STA ACCU + 0 
3906 : a9 00 __ LDA #$00
3908 : 85 1c __ STA ACCU + 1 
.s1001:
390a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
.s0:
390b : 20 b7 ff JSR $ffb7 
390e : 85 1b __ STA ACCU + 0 
3910 : a9 00 __ LDA #$00
3912 : 85 1c __ STA ACCU + 1 
.s1001:
3914 : a5 1b __ LDA ACCU + 0 
3916 : 60 __ __ RTS
--------------------------------------------------------------------
3917 : __ __ __ BYT 53 54 41 54 55 53 20 41 46 54 45 52 20 52 45 41 : STATUS AFTER REA
3927 : __ __ __ BYT 44 3a 20 25 44 0a 00                            : D: %D..
--------------------------------------------------------------------
392e : __ __ __ BYT 44 41 54 41 20 52 45 41 44 3a 0a 25 53 0a 00    : DATA READ:.%S..
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
393d : 20 4b 39 JSR $394b ; (getpch + 0)
3940 : c9 00 __ CMP #$00
3942 : f0 f9 __ BEQ $393d ; (getch.s0 + 0)
3944 : 85 1b __ STA ACCU + 0 
3946 : a9 00 __ LDA #$00
3948 : 85 1c __ STA ACCU + 1 
.s1001:
394a : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
394b : 20 e4 ff JSR $ffe4 
394e : ae ff 39 LDX $39ff ; (giocharmap + 0)
3951 : e0 01 __ CPX #$01
3953 : 90 26 __ BCC $397b ; (getpch + 48)
3955 : c9 0d __ CMP #$0d
3957 : d0 02 __ BNE $395b ; (getpch + 16)
3959 : a9 0a __ LDA #$0a
395b : e0 02 __ CPX #$02
395d : 90 1c __ BCC $397b ; (getpch + 48)
395f : c9 db __ CMP #$db
3961 : b0 18 __ BCS $397b ; (getpch + 48)
3963 : c9 41 __ CMP #$41
3965 : 90 14 __ BCC $397b ; (getpch + 48)
3967 : c9 c1 __ CMP #$c1
3969 : 90 02 __ BCC $396d ; (getpch + 34)
396b : 49 a0 __ EOR #$a0
396d : c9 7b __ CMP #$7b
396f : b0 0a __ BCS $397b ; (getpch + 48)
3971 : c9 61 __ CMP #$61
3973 : b0 04 __ BCS $3979 ; (getpch + 46)
3975 : c9 5b __ CMP #$5b
3977 : b0 02 __ BCS $397b ; (getpch + 48)
3979 : 49 20 __ EOR #$20
397b : 60 __ __ RTS
--------------------------------------------------------------------
397c : __ __ __ BYT 4e 4f 57 20 41 20 53 41 56 45 20 41 4e 44 20 4c : NOW A SAVE AND L
398c : __ __ __ BYT 4f 41 44 20 54 45 53 54 2e 00                   : OAD TEST..
--------------------------------------------------------------------
3996 : __ __ __ BYT 54 45 53 54 32 00                               : TEST2.
--------------------------------------------------------------------
399c : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 53 41 56 : RETURN VALUE SAV
39ac : __ __ __ BYT 45 3a 20 25 44 0a 00                            : E: %D..
--------------------------------------------------------------------
krnio_save: ; krnio_save(u8,const u8*,const u8*)->bool
.s0:
39b3 : a5 0e __ LDA P1 
39b5 : 85 1b __ STA ACCU + 0 
39b7 : a5 0f __ LDA P2 
39b9 : 85 1c __ STA ACCU + 1 
39bb : a9 00 __ LDA #$00
39bd : a6 0d __ LDX P0 
39bf : a0 00 __ LDY #$00
39c1 : 20 ba ff JSR $ffba 
39c4 : a9 1b __ LDA #$1b
39c6 : a6 10 __ LDX P3 
39c8 : a4 11 __ LDY P4 
39ca : 20 d8 ff JSR $ffd8 
39cd : a9 00 __ LDA #$00
39cf : 85 1b __ STA ACCU + 0 
39d1 : 85 1c __ STA ACCU + 1 
39d3 : 90 05 __ BCC $39da ; (krnio_save.s0 + 39)
39d5 : a9 00 __ LDA #$00
39d7 : 4c de 39 JMP $39de ; (krnio_save.s1001 + 0)
39da : a9 01 __ LDA #$01
39dc : 85 1b __ STA ACCU + 0 
.s1001:
39de : a5 1b __ LDA ACCU + 0 
39e0 : 60 __ __ RTS
--------------------------------------------------------------------
39e1 : __ __ __ BYT 4c 4f 41 44 20 44 41 54 41 2e 0a 00             : LOAD DATA...
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
39ed : 20 81 ff JSR $ff81 
.s1001:
39f0 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
39f1 : 24 d7 __ BIT $d7 
39f3 : 30 03 __ BMI $39f8 ; (screen_setmode.s1001 + 0)
.s6:
39f5 : 20 5f ff JSR $ff5f 
.s1001:
39f8 : 60 __ __ RTS
--------------------------------------------------------------------
39f9 : __ __ __ BYT 4f 56 4c 31 00                                  : OVL1.
--------------------------------------------------------------------
spentry:
39fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
39ff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
3a00 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 4c 4f 41 : RETURN VALUE LOA
3a10 : __ __ __ BYT 44 3a 20 25 44 0a 00                            : D: %D..
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
3a17 : a9 00 __ LDA #$00
3a19 : 85 1b __ STA ACCU + 0 
3a1b : 85 1c __ STA ACCU + 1 
3a1d : a5 0d __ LDA P0 
3a1f : a6 0e __ LDX P1 
3a21 : a4 0f __ LDY P2 
3a23 : 20 ba ff JSR $ffba 
3a26 : a9 00 __ LDA #$00
3a28 : a2 00 __ LDX #$00
3a2a : a0 00 __ LDY #$00
3a2c : 20 d5 ff JSR $ffd5 
3a2f : 90 05 __ BCC $3a36 ; (krnio_load.s0 + 31)
3a31 : a9 00 __ LDA #$00
3a33 : 4c 3a 3a JMP $3a3a ; (krnio_load.s1001 + 0)
3a36 : a9 01 __ LDA #$01
3a38 : 85 1b __ STA ACCU + 0 
.s1001:
3a3a : a5 1b __ LDA ACCU + 0 
3a3c : 60 __ __ RTS
--------------------------------------------------------------------
3a3d : __ __ __ BYT 73 77 69 74 63 68 20 74 6f 20 38 30 20 63 6f 6c : switch to 80 col
3a4d : __ __ __ BYT 75 6d 6e 20 73 63 72 65 65 6e 0a 61 6e 64 20 70 : umn screen.and p
3a5d : __ __ __ BYT 72 65 73 73 20 6b 65 79 2e 0a 00                : ress key...
--------------------------------------------------------------------
load_overlay: ; load_overlay(const u8*)->void
.s1000:
3a68 : 38 __ __ SEC
3a69 : a5 23 __ LDA SP + 0 
3a6b : e9 04 __ SBC #$04
3a6d : 85 23 __ STA SP + 0 
3a6f : b0 02 __ BCS $3a73 ; (load_overlay.s0 + 0)
3a71 : c6 24 __ DEC SP + 1 
.s0:
3a73 : a9 00 __ LDA #$00
3a75 : 85 0d __ STA P0 
3a77 : 85 0e __ STA P1 
3a79 : 20 c8 37 JSR $37c8 ; (krnio_setbnk.s0 + 0)
3a7c : a9 f9 __ LDA #$f9
3a7e : 85 0d __ STA P0 
3a80 : a9 39 __ LDA #$39
3a82 : 85 0e __ STA P1 
3a84 : 20 d8 37 JSR $37d8 ; (krnio_setnam.s0 + 0)
3a87 : a9 01 __ LDA #$01
3a89 : 85 0d __ STA P0 
3a8b : 85 0f __ STA P2 
3a8d : a9 08 __ LDA #$08
3a8f : 85 0e __ STA P1 
3a91 : 20 17 3a JSR $3a17 ; (krnio_load.s0 + 0)
3a94 : 09 00 __ ORA #$00
3a96 : d0 19 __ BNE $3ab1 ; (load_overlay.s1001 + 0)
.s1:
3a98 : a9 bd __ LDA #$bd
3a9a : a0 02 __ LDY #$02
3a9c : 91 23 __ STA (SP + 0),y 
3a9e : a9 3a __ LDA #$3a
3aa0 : c8 __ __ INY
3aa1 : 91 23 __ STA (SP + 0),y 
3aa3 : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
3aa6 : a9 01 __ LDA #$01
3aa8 : 85 0d __ STA P0 
3aaa : a9 00 __ LDA #$00
3aac : 85 0e __ STA P1 
3aae : 20 da 3a JSR $3ada ; (exit.s0 + 0)
.s1001:
3ab1 : 18 __ __ CLC
3ab2 : a5 23 __ LDA SP + 0 
3ab4 : 69 04 __ ADC #$04
3ab6 : 85 23 __ STA SP + 0 
3ab8 : 90 02 __ BCC $3abc ; (load_overlay.s1001 + 11)
3aba : e6 24 __ INC SP + 1 
3abc : 60 __ __ RTS
--------------------------------------------------------------------
3abd : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
3acd : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 00          : FILE FAILED..
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
3ada : a5 0d __ LDA P0 
3adc : 85 1b __ STA ACCU + 0 
3ade : a5 0e __ LDA P1 
3ae0 : 85 1c __ STA ACCU + 1 
3ae2 : ae fe 39 LDX $39fe ; (spentry + 0)
3ae5 : 9a __ __ TXS
3ae6 : a9 4c __ LDA #$4c
3ae8 : 85 54 __ STA $54 
3aea : a9 00 __ LDA #$00
3aec : 85 13 __ STA P6 
.s1001:
3aee : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
3aef : a2 04 __ LDX #$04
3af1 : b5 53 __ LDA T3 + 0,x 
3af3 : 9d ac bf STA $bfac,x ; (vdc_set_mode@stack + 0)
3af6 : ca __ __ DEX
3af7 : 10 f8 __ BPL $3af1 ; (vdc_set_mode.s1000 + 2)
3af9 : 38 __ __ SEC
3afa : a5 23 __ LDA SP + 0 
3afc : e9 08 __ SBC #$08
3afe : 85 23 __ STA SP + 0 
3b00 : b0 02 __ BCS $3b04 ; (vdc_set_mode.s0 + 0)
3b02 : c6 24 __ DEC SP + 1 
.s0:
3b04 : a9 00 __ LDA #$00
3b06 : 85 4f __ STA T0 + 0 
3b08 : 38 __ __ SEC
3b09 : e5 16 __ SBC P9 ; (mode + 0)
3b0b : 29 20 __ AND #$20
3b0d : 85 50 __ STA T2 + 0 
3b0f : aa __ __ TAX
3b10 : 18 __ __ CLC
3b11 : 69 b7 __ ADC #$b7
3b13 : 85 53 __ STA T3 + 0 
3b15 : a9 44 __ LDA #$44
3b17 : 69 00 __ ADC #$00
3b19 : 85 54 __ STA T3 + 1 
3b1b : bd bb 44 LDA $44bb,x ; (vdc_modes + 4)
3b1e : f0 0a __ BEQ $3b2a ; (vdc_set_mode.s3 + 0)
.s4:
3b20 : ad 07 45 LDA $4507 ; (vdc_state + 0)
3b23 : c9 10 __ CMP #$10
3b25 : d0 03 __ BNE $3b2a ; (vdc_set_mode.s3 + 0)
3b27 : 4c ac 3d JMP $3dac ; (vdc_set_mode.s1001 + 0)
.s3:
3b2a : a0 00 __ LDY #$00
3b2c : b1 53 __ LDA (T3 + 0),y 
3b2e : 8d 0a 45 STA $450a ; (vdc_state + 3)
3b31 : c8 __ __ INY
3b32 : b1 53 __ LDA (T3 + 0),y 
3b34 : 8d 0b 45 STA $450b ; (vdc_state + 4)
3b37 : c8 __ __ INY
3b38 : b1 53 __ LDA (T3 + 0),y 
3b3a : 8d 0c 45 STA $450c ; (vdc_state + 5)
3b3d : c8 __ __ INY
3b3e : b1 53 __ LDA (T3 + 0),y 
3b40 : 8d 0d 45 STA $450d ; (vdc_state + 6)
3b43 : a0 09 __ LDY #$09
3b45 : b1 53 __ LDA (T3 + 0),y 
3b47 : 8d 13 45 STA $4513 ; (vdc_state + 12)
3b4a : c8 __ __ INY
3b4b : b1 53 __ LDA (T3 + 0),y 
3b4d : 8d 14 45 STA $4514 ; (vdc_state + 13)
3b50 : c8 __ __ INY
3b51 : b1 53 __ LDA (T3 + 0),y 
3b53 : 8d 15 45 STA $4515 ; (vdc_state + 14)
3b56 : c8 __ __ INY
3b57 : b1 53 __ LDA (T3 + 0),y 
3b59 : 8d 16 45 STA $4516 ; (vdc_state + 15)
3b5c : c8 __ __ INY
3b5d : b1 53 __ LDA (T3 + 0),y 
3b5f : 8d 17 45 STA $4517 ; (vdc_state + 16)
3b62 : c8 __ __ INY
3b63 : b1 53 __ LDA (T3 + 0),y 
3b65 : 8d 18 45 STA $4518 ; (vdc_state + 17)
3b68 : c8 __ __ INY
3b69 : b1 53 __ LDA (T3 + 0),y 
3b6b : 8d 19 45 STA $4519 ; (vdc_state + 18)
3b6e : c8 __ __ INY
3b6f : b1 53 __ LDA (T3 + 0),y 
3b71 : 8d 1a 45 STA $451a ; (vdc_state + 19)
3b74 : c8 __ __ INY
3b75 : b1 53 __ LDA (T3 + 0),y 
3b77 : 8d 1b 45 STA $451b ; (vdc_state + 20)
3b7a : c8 __ __ INY
3b7b : b1 53 __ LDA (T3 + 0),y 
3b7d : 8d 1c 45 STA $451c ; (vdc_state + 21)
3b80 : a0 05 __ LDY #$05
3b82 : b1 53 __ LDA (T3 + 0),y 
3b84 : 85 55 __ STA T4 + 0 
3b86 : c8 __ __ INY
3b87 : b1 53 __ LDA (T3 + 0),y 
3b89 : 8d 10 45 STA $4510 ; (vdc_state + 9)
3b8c : 85 44 __ STA T6 + 0 
3b8e : a5 55 __ LDA T4 + 0 
3b90 : 8d 0f 45 STA $450f ; (vdc_state + 8)
3b93 : c8 __ __ INY
3b94 : b1 53 __ LDA (T3 + 0),y 
3b96 : 85 57 __ STA T5 + 0 
3b98 : c8 __ __ INY
3b99 : b1 53 __ LDA (T3 + 0),y 
3b9b : 8d 12 45 STA $4512 ; (vdc_state + 11)
3b9e : a8 __ __ TAY
3b9f : a5 57 __ LDA T5 + 0 
3ba1 : 8d 11 45 STA $4511 ; (vdc_state + 10)
3ba4 : a9 0c __ LDA #$0c
3ba6 : 8d 00 d6 STA $d600 
.l1515:
3ba9 : 2c 00 d6 BIT $d600 
3bac : 10 fb __ BPL $3ba9 ; (vdc_set_mode.l1515 + 0)
.s11:
3bae : a5 44 __ LDA T6 + 0 
3bb0 : 8d 01 d6 STA $d601 
3bb3 : a9 0d __ LDA #$0d
3bb5 : 8d 00 d6 STA $d600 
.l1517:
3bb8 : 2c 00 d6 BIT $d600 
3bbb : 10 fb __ BPL $3bb8 ; (vdc_set_mode.l1517 + 0)
.s16:
3bbd : a5 55 __ LDA T4 + 0 
3bbf : 8d 01 d6 STA $d601 
3bc2 : a9 14 __ LDA #$14
3bc4 : 8d 00 d6 STA $d600 
.l1519:
3bc7 : 2c 00 d6 BIT $d600 
3bca : 10 fb __ BPL $3bc7 ; (vdc_set_mode.l1519 + 0)
.s21:
3bcc : 8c 01 d6 STY $d601 
3bcf : a9 15 __ LDA #$15
3bd1 : 8d 00 d6 STA $d600 
.l1521:
3bd4 : 2c 00 d6 BIT $d600 
3bd7 : 10 fb __ BPL $3bd4 ; (vdc_set_mode.l1521 + 0)
.s26:
3bd9 : a5 57 __ LDA T5 + 0 
3bdb : 8d 01 d6 STA $d601 
3bde : bd c5 44 LDA $44c5,x ; (vdc_modes + 14)
3be1 : 85 56 __ STA T4 + 1 
3be3 : a9 1c __ LDA #$1c
3be5 : 8d 00 d6 STA $d600 
.l1523:
3be8 : 2c 00 d6 BIT $d600 
3beb : 10 fb __ BPL $3be8 ; (vdc_set_mode.l1523 + 0)
.s32:
3bed : ad 01 d6 LDA $d601 
3bf0 : 29 1f __ AND #$1f
3bf2 : 85 57 __ STA T5 + 0 
3bf4 : a9 8b __ LDA #$8b
3bf6 : a0 02 __ LDY #$02
3bf8 : 91 23 __ STA (SP + 0),y 
3bfa : a9 3f __ LDA #$3f
3bfc : c8 __ __ INY
3bfd : 91 23 __ STA (SP + 0),y 
3bff : a9 1c __ LDA #$1c
3c01 : 8d 00 d6 STA $d600 
.l1525:
3c04 : 2c 00 d6 BIT $d600 
3c07 : 10 fb __ BPL $3c04 ; (vdc_set_mode.l1525 + 0)
.s39:
3c09 : ad 01 d6 LDA $d601 
3c0c : a0 04 __ LDY #$04
3c0e : 91 23 __ STA (SP + 0),y 
3c10 : a9 00 __ LDA #$00
3c12 : c8 __ __ INY
3c13 : 91 23 __ STA (SP + 0),y 
3c15 : a5 57 __ LDA T5 + 0 
3c17 : c8 __ __ INY
3c18 : 91 23 __ STA (SP + 0),y 
3c1a : a9 00 __ LDA #$00
3c1c : c8 __ __ INY
3c1d : 91 23 __ STA (SP + 0),y 
3c1f : 20 5e 31 JSR $315e ; (printf.s1000 + 0)
3c22 : a9 1c __ LDA #$1c
3c24 : 8d 00 d6 STA $d600 
3c27 : a5 56 __ LDA T4 + 1 
3c29 : 29 e0 __ AND #$e0
3c2b : 18 __ __ CLC
3c2c : 65 57 __ ADC T5 + 0 
.l1527:
3c2e : 2c 00 d6 BIT $d600 
3c31 : 10 fb __ BPL $3c2e ; (vdc_set_mode.l1527 + 0)
.s46:
3c33 : 8d 01 d6 STA $d601 
3c36 : 18 __ __ CLC
3c37 : a9 ca __ LDA #$ca
3c39 : 65 50 __ ADC T2 + 0 
3c3b : 85 50 __ STA T2 + 0 
3c3d : a9 44 __ LDA #$44
3c3f : 69 00 __ ADC #$00
3c41 : 85 51 __ STA T2 + 1 
.l47:
3c43 : a4 4f __ LDY T0 + 0 
3c45 : b1 50 __ LDA (T2 + 0),y 
3c47 : 85 46 __ STA T7 + 0 
3c49 : c8 __ __ INY
3c4a : b1 50 __ LDA (T2 + 0),y 
3c4c : aa __ __ TAX
3c4d : a5 46 __ LDA T7 + 0 
3c4f : 8d 00 d6 STA $d600 
3c52 : c8 __ __ INY
3c53 : 84 4f __ STY T0 + 0 
.l1529:
3c55 : 2c 00 d6 BIT $d600 
3c58 : 10 fb __ BPL $3c55 ; (vdc_set_mode.l1529 + 0)
.s53:
3c5a : 8e 01 d6 STX $d601 
3c5d : 18 __ __ CLC
3c5e : a5 53 __ LDA T3 + 0 
3c60 : 65 4f __ ADC T0 + 0 
3c62 : 85 55 __ STA T4 + 0 
3c64 : a5 54 __ LDA T3 + 1 
3c66 : 69 00 __ ADC #$00
3c68 : 85 56 __ STA T4 + 1 
3c6a : a0 13 __ LDY #$13
3c6c : b1 55 __ LDA (T4 + 0),y 
3c6e : c9 ff __ CMP #$ff
3c70 : d0 d1 __ BNE $3c43 ; (vdc_set_mode.l47 + 0)
.s48:
3c72 : a0 04 __ LDY #$04
3c74 : b1 53 __ LDA (T3 + 0),y 
3c76 : f0 05 __ BEQ $3c7d ; (vdc_set_mode.s55 + 0)
.s57:
3c78 : ad 08 45 LDA $4508 ; (vdc_state + 1)
3c7b : f0 11 __ BEQ $3c8e ; (vdc_set_mode.s54 + 0)
.s55:
3c7d : a9 00 __ LDA #$00
3c7f : 85 4f __ STA T0 + 0 
3c81 : ad 0a 45 LDA $450a ; (vdc_state + 3)
3c84 : 85 50 __ STA T2 + 0 
3c86 : ad 0c 45 LDA $450c ; (vdc_state + 5)
3c89 : 85 53 __ STA T3 + 0 
3c8b : 4c a2 3e JMP $3ea2 ; (vdc_set_mode.l236 + 0)
.s54:
3c8e : ad 07 45 LDA $4507 ; (vdc_state + 0)
3c91 : c9 10 __ CMP #$10
3c93 : d0 03 __ BNE $3c98 ; (vdc_set_mode.s62 + 0)
3c95 : 4c ac 3d JMP $3dac ; (vdc_set_mode.s1001 + 0)
.s62:
3c98 : ad 08 45 LDA $4508 ; (vdc_state + 1)
3c9b : f0 03 __ BEQ $3ca0 ; (vdc_set_mode.s61 + 0)
3c9d : 4c ac 3d JMP $3dac ; (vdc_set_mode.s1001 + 0)
.s61:
3ca0 : a9 22 __ LDA #$22
3ca2 : 8d 00 d6 STA $d600 
.l1559:
3ca5 : 2c 00 d6 BIT $d600 
3ca8 : 10 fb __ BPL $3ca5 ; (vdc_set_mode.l1559 + 0)
.s69:
3caa : a9 80 __ LDA #$80
3cac : 8d 01 d6 STA $d601 
3caf : a0 ff __ LDY #$ff
3cb1 : a2 00 __ LDX #$00
.l72:
3cb3 : a9 12 __ LDA #$12
3cb5 : 8d 00 d6 STA $d600 
.l1561:
3cb8 : 2c 00 d6 BIT $d600 
3cbb : 10 fb __ BPL $3cb8 ; (vdc_set_mode.l1561 + 0)
.s81:
3cbd : 8e 01 d6 STX $d601 
3cc0 : a9 13 __ LDA #$13
3cc2 : 8d 00 d6 STA $d600 
.l1563:
3cc5 : 2c 00 d6 BIT $d600 
3cc8 : 10 fb __ BPL $3cc5 ; (vdc_set_mode.l1563 + 0)
.s86:
3cca : a9 00 __ LDA #$00
3ccc : 8d 01 d6 STA $d601 
3ccf : a9 1f __ LDA #$1f
3cd1 : 8d 00 d6 STA $d600 
.l1565:
3cd4 : 2c 00 d6 BIT $d600 
3cd7 : 10 fb __ BPL $3cd4 ; (vdc_set_mode.l1565 + 0)
.s90:
3cd9 : a9 00 __ LDA #$00
3cdb : 8d 01 d6 STA $d601 
3cde : a9 18 __ LDA #$18
3ce0 : 8d 00 d6 STA $d600 
.l1567:
3ce3 : 2c 00 d6 BIT $d600 
3ce6 : 10 fb __ BPL $3ce3 ; (vdc_set_mode.l1567 + 0)
.s96:
3ce8 : ad 01 d6 LDA $d601 
3ceb : 29 7f __ AND #$7f
3ced : 85 53 __ STA T3 + 0 
3cef : a9 18 __ LDA #$18
3cf1 : 8d 00 d6 STA $d600 
.l1569:
3cf4 : 2c 00 d6 BIT $d600 
3cf7 : 10 fb __ BPL $3cf4 ; (vdc_set_mode.l1569 + 0)
.s102:
3cf9 : a5 53 __ LDA T3 + 0 
3cfb : 8d 01 d6 STA $d601 
3cfe : a9 1e __ LDA #$1e
3d00 : 8d 00 d6 STA $d600 
.l1571:
3d03 : 2c 00 d6 BIT $d600 
3d06 : 10 fb __ BPL $3d03 ; (vdc_set_mode.l1571 + 0)
.s107:
3d08 : a9 ff __ LDA #$ff
3d0a : 8d 01 d6 STA $d601 
3d0d : e8 __ __ INX
3d0e : 88 __ __ DEY
3d0f : d0 a2 __ BNE $3cb3 ; (vdc_set_mode.l72 + 0)
.s74:
3d11 : a9 12 __ LDA #$12
3d13 : 8d 00 d6 STA $d600 
.l1574:
3d16 : 2c 00 d6 BIT $d600 
3d19 : 10 fb __ BPL $3d16 ; (vdc_set_mode.l1574 + 0)
.s114:
3d1b : 8e 01 d6 STX $d601 
3d1e : a9 13 __ LDA #$13
3d20 : 8d 00 d6 STA $d600 
.l1576:
3d23 : 2c 00 d6 BIT $d600 
3d26 : 10 fb __ BPL $3d23 ; (vdc_set_mode.l1576 + 0)
.s119:
3d28 : 8c 01 d6 STY $d601 
3d2b : a9 1f __ LDA #$1f
3d2d : 8d 00 d6 STA $d600 
.l1578:
3d30 : 2c 00 d6 BIT $d600 
3d33 : 10 fb __ BPL $3d30 ; (vdc_set_mode.l1578 + 0)
.s123:
3d35 : 8c 01 d6 STY $d601 
3d38 : a9 18 __ LDA #$18
3d3a : 8d 00 d6 STA $d600 
.l1580:
3d3d : 2c 00 d6 BIT $d600 
3d40 : 10 fb __ BPL $3d3d ; (vdc_set_mode.l1580 + 0)
.s129:
3d42 : ad 01 d6 LDA $d601 
3d45 : 29 7f __ AND #$7f
3d47 : aa __ __ TAX
3d48 : a9 18 __ LDA #$18
3d4a : 8d 00 d6 STA $d600 
.l1582:
3d4d : 2c 00 d6 BIT $d600 
3d50 : 10 fb __ BPL $3d4d ; (vdc_set_mode.l1582 + 0)
.s135:
3d52 : 8e 01 d6 STX $d601 
3d55 : a9 1e __ LDA #$1e
3d57 : 8d 00 d6 STA $d600 
.l1584:
3d5a : 2c 00 d6 BIT $d600 
3d5d : 10 fb __ BPL $3d5a ; (vdc_set_mode.l1584 + 0)
.s140:
3d5f : a9 ff __ LDA #$ff
3d61 : 8d 01 d6 STA $d601 
3d64 : a9 1c __ LDA #$1c
3d66 : 8d 00 d6 STA $d600 
.l1586:
3d69 : 2c 00 d6 BIT $d600 
3d6c : 10 fb __ BPL $3d69 ; (vdc_set_mode.l1586 + 0)
.s146:
3d6e : ad 01 d6 LDA $d601 
3d71 : 09 10 __ ORA #$10
3d73 : aa __ __ TAX
3d74 : a9 1c __ LDA #$1c
3d76 : 8d 00 d6 STA $d600 
.l1588:
3d79 : 2c 00 d6 BIT $d600 
3d7c : 10 fb __ BPL $3d79 ; (vdc_set_mode.l1588 + 0)
.s152:
3d7e : 8e 01 d6 STX $d601 
3d81 : 20 93 3f JSR $3f93 ; (vdc_restore_charsets.s0 + 0)
3d84 : a9 00 __ LDA #$00
3d86 : 85 4f __ STA T0 + 0 
3d88 : ad 0a 45 LDA $450a ; (vdc_state + 3)
3d8b : 85 50 __ STA T2 + 0 
3d8d : ad 0c 45 LDA $450c ; (vdc_state + 5)
3d90 : 85 53 __ STA T3 + 0 
.l155:
3d92 : a5 4f __ LDA T0 + 0 
3d94 : c5 53 __ CMP T3 + 0 
3d96 : 90 2a __ BCC $3dc2 ; (vdc_set_mode.s156 + 0)
.s153:
3d98 : a9 22 __ LDA #$22
3d9a : 8d 00 d6 STA $d600 
.l1614:
3d9d : 2c 00 d6 BIT $d600 
3da0 : 10 fb __ BPL $3d9d ; (vdc_set_mode.l1614 + 0)
.s233:
3da2 : a9 7d __ LDA #$7d
3da4 : 8d 01 d6 STA $d601 
3da7 : a9 01 __ LDA #$01
3da9 : 8d 08 45 STA $4508 ; (vdc_state + 1)
.s1001:
3dac : 18 __ __ CLC
3dad : a5 23 __ LDA SP + 0 
3daf : 69 08 __ ADC #$08
3db1 : 85 23 __ STA SP + 0 
3db3 : 90 02 __ BCC $3db7 ; (vdc_set_mode.s1001 + 11)
3db5 : e6 24 __ INC SP + 1 
3db7 : a2 04 __ LDX #$04
3db9 : bd ac bf LDA $bfac,x ; (vdc_set_mode@stack + 0)
3dbc : 95 53 __ STA T3 + 0,x 
3dbe : ca __ __ DEX
3dbf : 10 f8 __ BPL $3db9 ; (vdc_set_mode.s1001 + 13)
3dc1 : 60 __ __ RTS
.s156:
3dc2 : ad 0a 45 LDA $450a ; (vdc_state + 3)
3dc5 : 85 1b __ STA ACCU + 0 
3dc7 : ad 0b 45 LDA $450b ; (vdc_state + 4)
3dca : 85 1c __ STA ACCU + 1 
3dcc : ad 0e 45 LDA $450e ; (vdc_state + 7)
3dcf : 85 43 __ STA T1 + 0 
3dd1 : a9 12 __ LDA #$12
3dd3 : 8d 00 d6 STA $d600 
3dd6 : a6 50 __ LDX T2 + 0 
3dd8 : ca __ __ DEX
3dd9 : 86 44 __ STX T6 + 0 
3ddb : a5 4f __ LDA T0 + 0 
3ddd : 20 d6 42 JSR $42d6 ; (mul16by8 + 0)
3de0 : 18 __ __ CLC
3de1 : a5 05 __ LDA WORK + 2 
3de3 : 6d 0f 45 ADC $450f ; (vdc_state + 8)
3de6 : aa __ __ TAX
3de7 : a5 06 __ LDA WORK + 3 
3de9 : 6d 10 45 ADC $4510 ; (vdc_state + 9)
.l1590:
3dec : 2c 00 d6 BIT $d600 
3def : 10 fb __ BPL $3dec ; (vdc_set_mode.l1590 + 0)
.s168:
3df1 : 8d 01 d6 STA $d601 
3df4 : a9 13 __ LDA #$13
3df6 : 8d 00 d6 STA $d600 
.l1592:
3df9 : 2c 00 d6 BIT $d600 
3dfc : 10 fb __ BPL $3df9 ; (vdc_set_mode.l1592 + 0)
.s173:
3dfe : 8e 01 d6 STX $d601 
3e01 : a9 1f __ LDA #$1f
3e03 : 8d 00 d6 STA $d600 
.l1594:
3e06 : 2c 00 d6 BIT $d600 
3e09 : 10 fb __ BPL $3e06 ; (vdc_set_mode.l1594 + 0)
.s177:
3e0b : a9 20 __ LDA #$20
3e0d : 8d 01 d6 STA $d601 
3e10 : a9 18 __ LDA #$18
3e12 : 8d 00 d6 STA $d600 
.l1596:
3e15 : 2c 00 d6 BIT $d600 
3e18 : 10 fb __ BPL $3e15 ; (vdc_set_mode.l1596 + 0)
.s183:
3e1a : ad 01 d6 LDA $d601 
3e1d : 29 7f __ AND #$7f
3e1f : aa __ __ TAX
3e20 : a9 18 __ LDA #$18
3e22 : 8d 00 d6 STA $d600 
.l1598:
3e25 : 2c 00 d6 BIT $d600 
3e28 : 10 fb __ BPL $3e25 ; (vdc_set_mode.l1598 + 0)
.s189:
3e2a : 8e 01 d6 STX $d601 
3e2d : a9 1e __ LDA #$1e
3e2f : 8d 00 d6 STA $d600 
.l1600:
3e32 : 2c 00 d6 BIT $d600 
3e35 : 10 fb __ BPL $3e32 ; (vdc_set_mode.l1600 + 0)
.s194:
3e37 : a5 44 __ LDA T6 + 0 
3e39 : 8d 01 d6 STA $d601 
3e3c : ad 11 45 LDA $4511 ; (vdc_state + 10)
3e3f : 18 __ __ CLC
3e40 : 65 05 __ ADC WORK + 2 
3e42 : aa __ __ TAX
3e43 : a9 12 __ LDA #$12
3e45 : 8d 00 d6 STA $d600 
3e48 : ad 12 45 LDA $4512 ; (vdc_state + 11)
3e4b : 65 06 __ ADC WORK + 3 
.l1602:
3e4d : 2c 00 d6 BIT $d600 
3e50 : 10 fb __ BPL $3e4d ; (vdc_set_mode.l1602 + 0)
.s201:
3e52 : 8d 01 d6 STA $d601 
3e55 : a9 13 __ LDA #$13
3e57 : 8d 00 d6 STA $d600 
.l1604:
3e5a : 2c 00 d6 BIT $d600 
3e5d : 10 fb __ BPL $3e5a ; (vdc_set_mode.l1604 + 0)
.s206:
3e5f : 8e 01 d6 STX $d601 
3e62 : a9 1f __ LDA #$1f
3e64 : 8d 00 d6 STA $d600 
.l1606:
3e67 : 2c 00 d6 BIT $d600 
3e6a : 10 fb __ BPL $3e67 ; (vdc_set_mode.l1606 + 0)
.s210:
3e6c : a5 43 __ LDA T1 + 0 
3e6e : 8d 01 d6 STA $d601 
3e71 : a9 18 __ LDA #$18
3e73 : 8d 00 d6 STA $d600 
.l1608:
3e76 : 2c 00 d6 BIT $d600 
3e79 : 10 fb __ BPL $3e76 ; (vdc_set_mode.l1608 + 0)
.s216:
3e7b : ad 01 d6 LDA $d601 
3e7e : 29 7f __ AND #$7f
3e80 : aa __ __ TAX
3e81 : a9 18 __ LDA #$18
3e83 : 8d 00 d6 STA $d600 
.l1610:
3e86 : 2c 00 d6 BIT $d600 
3e89 : 10 fb __ BPL $3e86 ; (vdc_set_mode.l1610 + 0)
.s222:
3e8b : 8e 01 d6 STX $d601 
3e8e : a9 1e __ LDA #$1e
3e90 : 8d 00 d6 STA $d600 
.l1612:
3e93 : 2c 00 d6 BIT $d600 
3e96 : 10 fb __ BPL $3e93 ; (vdc_set_mode.l1612 + 0)
.s227:
3e98 : a5 44 __ LDA T6 + 0 
3e9a : 8d 01 d6 STA $d601 
3e9d : e6 4f __ INC T0 + 0 
3e9f : 4c 92 3d JMP $3d92 ; (vdc_set_mode.l155 + 0)
.l236:
3ea2 : a5 4f __ LDA T0 + 0 
3ea4 : c5 53 __ CMP T3 + 0 
3ea6 : 90 03 __ BCC $3eab ; (vdc_set_mode.s237 + 0)
3ea8 : 4c ac 3d JMP $3dac ; (vdc_set_mode.s1001 + 0)
.s237:
3eab : ad 0a 45 LDA $450a ; (vdc_state + 3)
3eae : 85 1b __ STA ACCU + 0 
3eb0 : ad 0b 45 LDA $450b ; (vdc_state + 4)
3eb3 : 85 1c __ STA ACCU + 1 
3eb5 : ad 0e 45 LDA $450e ; (vdc_state + 7)
3eb8 : 85 43 __ STA T1 + 0 
3eba : a9 12 __ LDA #$12
3ebc : 8d 00 d6 STA $d600 
3ebf : a6 50 __ LDX T2 + 0 
3ec1 : ca __ __ DEX
3ec2 : 86 44 __ STX T6 + 0 
3ec4 : a5 4f __ LDA T0 + 0 
3ec6 : 20 d6 42 JSR $42d6 ; (mul16by8 + 0)
3ec9 : 18 __ __ CLC
3eca : a5 05 __ LDA WORK + 2 
3ecc : 6d 0f 45 ADC $450f ; (vdc_state + 8)
3ecf : aa __ __ TAX
3ed0 : a5 06 __ LDA WORK + 3 
3ed2 : 6d 10 45 ADC $4510 ; (vdc_state + 9)
.l1534:
3ed5 : 2c 00 d6 BIT $d600 
3ed8 : 10 fb __ BPL $3ed5 ; (vdc_set_mode.l1534 + 0)
.s249:
3eda : 8d 01 d6 STA $d601 
3edd : a9 13 __ LDA #$13
3edf : 8d 00 d6 STA $d600 
.l1536:
3ee2 : 2c 00 d6 BIT $d600 
3ee5 : 10 fb __ BPL $3ee2 ; (vdc_set_mode.l1536 + 0)
.s254:
3ee7 : 8e 01 d6 STX $d601 
3eea : a9 1f __ LDA #$1f
3eec : 8d 00 d6 STA $d600 
.l1538:
3eef : 2c 00 d6 BIT $d600 
3ef2 : 10 fb __ BPL $3eef ; (vdc_set_mode.l1538 + 0)
.s258:
3ef4 : a9 20 __ LDA #$20
3ef6 : 8d 01 d6 STA $d601 
3ef9 : a9 18 __ LDA #$18
3efb : 8d 00 d6 STA $d600 
.l1540:
3efe : 2c 00 d6 BIT $d600 
3f01 : 10 fb __ BPL $3efe ; (vdc_set_mode.l1540 + 0)
.s264:
3f03 : ad 01 d6 LDA $d601 
3f06 : 29 7f __ AND #$7f
3f08 : aa __ __ TAX
3f09 : a9 18 __ LDA #$18
3f0b : 8d 00 d6 STA $d600 
.l1542:
3f0e : 2c 00 d6 BIT $d600 
3f11 : 10 fb __ BPL $3f0e ; (vdc_set_mode.l1542 + 0)
.s270:
3f13 : 8e 01 d6 STX $d601 
3f16 : a9 1e __ LDA #$1e
3f18 : 8d 00 d6 STA $d600 
.l1544:
3f1b : 2c 00 d6 BIT $d600 
3f1e : 10 fb __ BPL $3f1b ; (vdc_set_mode.l1544 + 0)
.s275:
3f20 : a5 44 __ LDA T6 + 0 
3f22 : 8d 01 d6 STA $d601 
3f25 : ad 11 45 LDA $4511 ; (vdc_state + 10)
3f28 : 18 __ __ CLC
3f29 : 65 05 __ ADC WORK + 2 
3f2b : aa __ __ TAX
3f2c : a9 12 __ LDA #$12
3f2e : 8d 00 d6 STA $d600 
3f31 : ad 12 45 LDA $4512 ; (vdc_state + 11)
3f34 : 65 06 __ ADC WORK + 3 
.l1546:
3f36 : 2c 00 d6 BIT $d600 
3f39 : 10 fb __ BPL $3f36 ; (vdc_set_mode.l1546 + 0)
.s282:
3f3b : 8d 01 d6 STA $d601 
3f3e : a9 13 __ LDA #$13
3f40 : 8d 00 d6 STA $d600 
.l1548:
3f43 : 2c 00 d6 BIT $d600 
3f46 : 10 fb __ BPL $3f43 ; (vdc_set_mode.l1548 + 0)
.s287:
3f48 : 8e 01 d6 STX $d601 
3f4b : a9 1f __ LDA #$1f
3f4d : 8d 00 d6 STA $d600 
.l1550:
3f50 : 2c 00 d6 BIT $d600 
3f53 : 10 fb __ BPL $3f50 ; (vdc_set_mode.l1550 + 0)
.s291:
3f55 : a5 43 __ LDA T1 + 0 
3f57 : 8d 01 d6 STA $d601 
3f5a : a9 18 __ LDA #$18
3f5c : 8d 00 d6 STA $d600 
.l1552:
3f5f : 2c 00 d6 BIT $d600 
3f62 : 10 fb __ BPL $3f5f ; (vdc_set_mode.l1552 + 0)
.s297:
3f64 : ad 01 d6 LDA $d601 
3f67 : 29 7f __ AND #$7f
3f69 : aa __ __ TAX
3f6a : a9 18 __ LDA #$18
3f6c : 8d 00 d6 STA $d600 
.l1554:
3f6f : 2c 00 d6 BIT $d600 
3f72 : 10 fb __ BPL $3f6f ; (vdc_set_mode.l1554 + 0)
.s303:
3f74 : 8e 01 d6 STX $d601 
3f77 : a9 1e __ LDA #$1e
3f79 : 8d 00 d6 STA $d600 
.l1556:
3f7c : 2c 00 d6 BIT $d600 
3f7f : 10 fb __ BPL $3f7c ; (vdc_set_mode.l1556 + 0)
.s308:
3f81 : a5 44 __ LDA T6 + 0 
3f83 : 8d 01 d6 STA $d601 
3f86 : e6 4f __ INC T0 + 0 
3f88 : 4c a2 3e JMP $3ea2 ; (vdc_set_mode.l236 + 0)
--------------------------------------------------------------------
3f8b : __ __ __ BYT 25 32 78 20 25 32 78 00                         : %2x %2x.
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
3f93 : 20 62 ff JSR $ff62 
.s1001:
3f96 : 60 __ __ RTS
--------------------------------------------------------------------
3f97 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 44 45 4d 4f : oSCAR64 vdc DEMO
3fa7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
3fa8 : a2 03 __ LDX #$03
3faa : b5 53 __ LDA T8 + 0,x 
3fac : 9d e4 bf STA $bfe4,x ; (buff + 38)
3faf : ca __ __ DEX
3fb0 : 10 f8 __ BPL $3faa ; (sprintf.s1000 + 2)
.s0:
3fb2 : 18 __ __ CLC
3fb3 : a5 23 __ LDA SP + 0 
3fb5 : 69 06 __ ADC #$06
3fb7 : 85 47 __ STA T0 + 0 
3fb9 : a5 24 __ LDA SP + 1 
3fbb : 69 00 __ ADC #$00
3fbd : 85 48 __ STA T0 + 1 
3fbf : a9 00 __ LDA #$00
3fc1 : 85 43 __ STA T1 + 0 
3fc3 : a0 04 __ LDY #$04
3fc5 : b1 23 __ LDA (SP + 0),y 
3fc7 : 85 49 __ STA T2 + 0 
3fc9 : c8 __ __ INY
3fca : b1 23 __ LDA (SP + 0),y 
3fcc : 85 4a __ STA T2 + 1 
3fce : a0 02 __ LDY #$02
3fd0 : b1 23 __ LDA (SP + 0),y 
3fd2 : 85 4b __ STA T3 + 0 
3fd4 : c8 __ __ INY
3fd5 : b1 23 __ LDA (SP + 0),y 
3fd7 : 85 4c __ STA T3 + 1 
.l2:
3fd9 : a0 00 __ LDY #$00
3fdb : b1 49 __ LDA (T2 + 0),y 
3fdd : d0 0f __ BNE $3fee ; (sprintf.s3 + 0)
.s4:
3fdf : a4 43 __ LDY T1 + 0 
3fe1 : 91 4b __ STA (T3 + 0),y 
.s1001:
3fe3 : a2 03 __ LDX #$03
3fe5 : bd e4 bf LDA $bfe4,x ; (buff + 38)
3fe8 : 95 53 __ STA T8 + 0,x 
3fea : ca __ __ DEX
3feb : 10 f8 __ BPL $3fe5 ; (sprintf.s1001 + 2)
3fed : 60 __ __ RTS
.s3:
3fee : c9 25 __ CMP #$25
3ff0 : f0 22 __ BEQ $4014 ; (sprintf.s5 + 0)
.s6:
3ff2 : a4 43 __ LDY T1 + 0 
3ff4 : 91 4b __ STA (T3 + 0),y 
3ff6 : e6 49 __ INC T2 + 0 
3ff8 : d0 02 __ BNE $3ffc ; (sprintf.s1102 + 0)
.s1101:
3ffa : e6 4a __ INC T2 + 1 
.s1102:
3ffc : c8 __ __ INY
3ffd : 84 43 __ STY T1 + 0 
3fff : 98 __ __ TYA
4000 : c0 28 __ CPY #$28
4002 : 90 d5 __ BCC $3fd9 ; (sprintf.l2 + 0)
.s111:
4004 : 18 __ __ CLC
4005 : 65 4b __ ADC T3 + 0 
4007 : 85 4b __ STA T3 + 0 
4009 : 90 02 __ BCC $400d ; (sprintf.s1104 + 0)
.s1103:
400b : e6 4c __ INC T3 + 1 
.s1104:
400d : a9 00 __ LDA #$00
.s1068:
400f : 85 43 __ STA T1 + 0 
4011 : 4c d9 3f JMP $3fd9 ; (sprintf.l2 + 0)
.s5:
4014 : 8c ec bf STY $bfec ; (buff + 46)
4017 : 8c ed bf STY $bfed ; (buff + 47)
401a : 8c ee bf STY $bfee ; (buff + 48)
401d : 8c ef bf STY $bfef ; (buff + 49)
4020 : a9 0a __ LDA #$0a
4022 : 8d eb bf STA $bfeb ; (buff + 45)
4025 : a5 43 __ LDA T1 + 0 
4027 : f0 0b __ BEQ $4034 ; (sprintf.s10 + 0)
.s8:
4029 : 18 __ __ CLC
402a : 65 4b __ ADC T3 + 0 
402c : 85 4b __ STA T3 + 0 
402e : 90 02 __ BCC $4032 ; (sprintf.s1080 + 0)
.s1079:
4030 : e6 4c __ INC T3 + 1 
.s1080:
4032 : 84 43 __ STY T1 + 0 
.s10:
4034 : a0 01 __ LDY #$01
4036 : b1 49 __ LDA (T2 + 0),y 
4038 : aa __ __ TAX
4039 : a9 20 __ LDA #$20
403b : 8d e8 bf STA $bfe8 ; (buff + 42)
403e : a9 00 __ LDA #$00
4040 : 8d e9 bf STA $bfe9 ; (buff + 43)
4043 : a9 ff __ LDA #$ff
4045 : 8d ea bf STA $bfea ; (buff + 44)
4048 : 18 __ __ CLC
4049 : a5 49 __ LDA T2 + 0 
404b : 69 02 __ ADC #$02
.l15:
404d : 85 49 __ STA T2 + 0 
404f : 90 02 __ BCC $4053 ; (sprintf.s1082 + 0)
.s1081:
4051 : e6 4a __ INC T2 + 1 
.s1082:
4053 : 8a __ __ TXA
4054 : e0 2b __ CPX #$2b
4056 : d0 08 __ BNE $4060 ; (sprintf.s18 + 0)
.s17:
4058 : a9 01 __ LDA #$01
405a : 8d ed bf STA $bfed ; (buff + 47)
405d : 4c c1 42 JMP $42c1 ; (sprintf.s260 + 0)
.s18:
4060 : c9 30 __ CMP #$30
4062 : d0 06 __ BNE $406a ; (sprintf.s21 + 0)
.s20:
4064 : 8d e8 bf STA $bfe8 ; (buff + 42)
4067 : 4c c1 42 JMP $42c1 ; (sprintf.s260 + 0)
.s21:
406a : e0 23 __ CPX #$23
406c : d0 08 __ BNE $4076 ; (sprintf.s24 + 0)
.s23:
406e : a9 01 __ LDA #$01
4070 : 8d ef bf STA $bfef ; (buff + 49)
4073 : 4c c1 42 JMP $42c1 ; (sprintf.s260 + 0)
.s24:
4076 : e0 2d __ CPX #$2d
4078 : d0 08 __ BNE $4082 ; (sprintf.s16 + 0)
.s26:
407a : a9 01 __ LDA #$01
407c : 8d ee bf STA $bfee ; (buff + 48)
407f : 4c c1 42 JMP $42c1 ; (sprintf.s260 + 0)
.s16:
4082 : 85 45 __ STA T4 + 0 
4084 : e0 30 __ CPX #$30
4086 : 90 53 __ BCC $40db ; (sprintf.s32 + 0)
.s33:
4088 : e0 3a __ CPX #$3a
408a : b0 4f __ BCS $40db ; (sprintf.s32 + 0)
.s30:
408c : a9 00 __ LDA #$00
408e : 85 4d __ STA T6 + 0 
4090 : 85 4e __ STA T6 + 1 
4092 : e0 3a __ CPX #$3a
4094 : b0 40 __ BCS $40d6 ; (sprintf.s36 + 0)
.l35:
4096 : a5 4d __ LDA T6 + 0 
4098 : 0a __ __ ASL
4099 : 85 1b __ STA ACCU + 0 
409b : a5 4e __ LDA T6 + 1 
409d : 2a __ __ ROL
409e : 06 1b __ ASL ACCU + 0 
40a0 : 2a __ __ ROL
40a1 : aa __ __ TAX
40a2 : 18 __ __ CLC
40a3 : a5 1b __ LDA ACCU + 0 
40a5 : 65 4d __ ADC T6 + 0 
40a7 : 85 4d __ STA T6 + 0 
40a9 : 8a __ __ TXA
40aa : 65 4e __ ADC T6 + 1 
40ac : 06 4d __ ASL T6 + 0 
40ae : 2a __ __ ROL
40af : aa __ __ TAX
40b0 : 18 __ __ CLC
40b1 : a5 4d __ LDA T6 + 0 
40b3 : 65 45 __ ADC T4 + 0 
40b5 : 90 01 __ BCC $40b8 ; (sprintf.s1098 + 0)
.s1097:
40b7 : e8 __ __ INX
.s1098:
40b8 : 38 __ __ SEC
40b9 : e9 30 __ SBC #$30
40bb : 85 4d __ STA T6 + 0 
40bd : 8a __ __ TXA
40be : e9 00 __ SBC #$00
40c0 : 85 4e __ STA T6 + 1 
40c2 : a0 00 __ LDY #$00
40c4 : b1 49 __ LDA (T2 + 0),y 
40c6 : 85 45 __ STA T4 + 0 
40c8 : e6 49 __ INC T2 + 0 
40ca : d0 02 __ BNE $40ce ; (sprintf.s1100 + 0)
.s1099:
40cc : e6 4a __ INC T2 + 1 
.s1100:
40ce : c9 30 __ CMP #$30
40d0 : 90 04 __ BCC $40d6 ; (sprintf.s36 + 0)
.s37:
40d2 : c9 3a __ CMP #$3a
40d4 : 90 c0 __ BCC $4096 ; (sprintf.l35 + 0)
.s36:
40d6 : a5 4d __ LDA T6 + 0 
40d8 : 8d e9 bf STA $bfe9 ; (buff + 43)
.s32:
40db : a5 45 __ LDA T4 + 0 
40dd : c9 2e __ CMP #$2e
40df : d0 51 __ BNE $4132 ; (sprintf.s40 + 0)
.s38:
40e1 : a9 00 __ LDA #$00
40e3 : 85 4d __ STA T6 + 0 
.l245:
40e5 : 85 4e __ STA T6 + 1 
40e7 : a0 00 __ LDY #$00
40e9 : b1 49 __ LDA (T2 + 0),y 
40eb : 85 45 __ STA T4 + 0 
40ed : e6 49 __ INC T2 + 0 
40ef : d0 02 __ BNE $40f3 ; (sprintf.s1084 + 0)
.s1083:
40f1 : e6 4a __ INC T2 + 1 
.s1084:
40f3 : c9 30 __ CMP #$30
40f5 : 90 04 __ BCC $40fb ; (sprintf.s43 + 0)
.s44:
40f7 : c9 3a __ CMP #$3a
40f9 : 90 0a __ BCC $4105 ; (sprintf.s42 + 0)
.s43:
40fb : a5 4d __ LDA T6 + 0 
40fd : 8d ea bf STA $bfea ; (buff + 44)
4100 : a5 45 __ LDA T4 + 0 
4102 : 4c 32 41 JMP $4132 ; (sprintf.s40 + 0)
.s42:
4105 : a5 4d __ LDA T6 + 0 
4107 : 0a __ __ ASL
4108 : 85 1b __ STA ACCU + 0 
410a : a5 4e __ LDA T6 + 1 
410c : 2a __ __ ROL
410d : 06 1b __ ASL ACCU + 0 
410f : 2a __ __ ROL
4110 : aa __ __ TAX
4111 : 18 __ __ CLC
4112 : a5 1b __ LDA ACCU + 0 
4114 : 65 4d __ ADC T6 + 0 
4116 : 85 4d __ STA T6 + 0 
4118 : 8a __ __ TXA
4119 : 65 4e __ ADC T6 + 1 
411b : 06 4d __ ASL T6 + 0 
411d : 2a __ __ ROL
411e : aa __ __ TAX
411f : 18 __ __ CLC
4120 : a5 4d __ LDA T6 + 0 
4122 : 65 45 __ ADC T4 + 0 
4124 : 90 01 __ BCC $4127 ; (sprintf.s1096 + 0)
.s1095:
4126 : e8 __ __ INX
.s1096:
4127 : 38 __ __ SEC
4128 : e9 30 __ SBC #$30
412a : 85 4d __ STA T6 + 0 
412c : 8a __ __ TXA
412d : e9 00 __ SBC #$00
412f : 4c e5 40 JMP $40e5 ; (sprintf.l245 + 0)
.s40:
4132 : c9 64 __ CMP #$64
4134 : f0 04 __ BEQ $413a ; (sprintf.s45 + 0)
.s48:
4136 : c9 44 __ CMP #$44
4138 : d0 05 __ BNE $413f ; (sprintf.s46 + 0)
.s45:
413a : a9 01 __ LDA #$01
413c : 4c 9a 42 JMP $429a ; (sprintf.s261 + 0)
.s46:
413f : c9 75 __ CMP #$75
4141 : d0 03 __ BNE $4146 ; (sprintf.s52 + 0)
4143 : 4c 98 42 JMP $4298 ; (sprintf.s285 + 0)
.s52:
4146 : c9 55 __ CMP #$55
4148 : d0 03 __ BNE $414d ; (sprintf.s50 + 0)
414a : 4c 98 42 JMP $4298 ; (sprintf.s285 + 0)
.s50:
414d : c9 78 __ CMP #$78
414f : f0 04 __ BEQ $4155 ; (sprintf.s53 + 0)
.s56:
4151 : c9 58 __ CMP #$58
4153 : d0 0d __ BNE $4162 ; (sprintf.s54 + 0)
.s53:
4155 : a9 10 __ LDA #$10
4157 : 8d eb bf STA $bfeb ; (buff + 45)
415a : a9 00 __ LDA #$00
415c : 8d ec bf STA $bfec ; (buff + 46)
415f : 4c 98 42 JMP $4298 ; (sprintf.s285 + 0)
.s54:
4162 : c9 6c __ CMP #$6c
4164 : d0 03 __ BNE $4169 ; (sprintf.s60 + 0)
4166 : 4c 2a 42 JMP $422a ; (sprintf.s57 + 0)
.s60:
4169 : c9 4c __ CMP #$4c
416b : d0 03 __ BNE $4170 ; (sprintf.s58 + 0)
416d : 4c 2a 42 JMP $422a ; (sprintf.s57 + 0)
.s58:
4170 : c9 73 __ CMP #$73
4172 : f0 37 __ BEQ $41ab ; (sprintf.s73 + 0)
.s76:
4174 : c9 53 __ CMP #$53
4176 : f0 33 __ BEQ $41ab ; (sprintf.s73 + 0)
.s74:
4178 : c9 63 __ CMP #$63
417a : f0 14 __ BEQ $4190 ; (sprintf.s104 + 0)
.s107:
417c : c9 43 __ CMP #$43
417e : f0 10 __ BEQ $4190 ; (sprintf.s104 + 0)
.s105:
4180 : 09 00 __ ORA #$00
4182 : d0 03 __ BNE $4187 ; (sprintf.s108 + 0)
4184 : 4c d9 3f JMP $3fd9 ; (sprintf.l2 + 0)
.s108:
4187 : a4 43 __ LDY T1 + 0 
4189 : 91 4b __ STA (T3 + 0),y 
418b : e6 43 __ INC T1 + 0 
418d : 4c d9 3f JMP $3fd9 ; (sprintf.l2 + 0)
.s104:
4190 : a0 00 __ LDY #$00
4192 : b1 47 __ LDA (T0 + 0),y 
4194 : a4 43 __ LDY T1 + 0 
4196 : 91 4b __ STA (T3 + 0),y 
4198 : e6 43 __ INC T1 + 0 
.s258:
419a : 18 __ __ CLC
419b : a5 47 __ LDA T0 + 0 
419d : 69 02 __ ADC #$02
419f : 85 47 __ STA T0 + 0 
41a1 : b0 03 __ BCS $41a6 ; (sprintf.s1085 + 0)
41a3 : 4c d9 3f JMP $3fd9 ; (sprintf.l2 + 0)
.s1085:
41a6 : e6 48 __ INC T0 + 1 
41a8 : 4c d9 3f JMP $3fd9 ; (sprintf.l2 + 0)
.s73:
41ab : a0 00 __ LDY #$00
41ad : 84 45 __ STY T4 + 0 
41af : b1 47 __ LDA (T0 + 0),y 
41b1 : 85 4d __ STA T6 + 0 
41b3 : c8 __ __ INY
41b4 : b1 47 __ LDA (T0 + 0),y 
41b6 : 85 4e __ STA T6 + 1 
41b8 : 18 __ __ CLC
41b9 : a5 47 __ LDA T0 + 0 
41bb : 69 02 __ ADC #$02
41bd : 85 47 __ STA T0 + 0 
41bf : 90 02 __ BCC $41c3 ; (sprintf.s1092 + 0)
.s1091:
41c1 : e6 48 __ INC T0 + 1 
.s1092:
41c3 : ad e9 bf LDA $bfe9 ; (buff + 43)
41c6 : f0 0d __ BEQ $41d5 ; (sprintf.s79 + 0)
.s1071:
41c8 : a0 00 __ LDY #$00
41ca : b1 4d __ LDA (T6 + 0),y 
41cc : f0 05 __ BEQ $41d3 ; (sprintf.s1072 + 0)
.l81:
41ce : c8 __ __ INY
41cf : b1 4d __ LDA (T6 + 0),y 
41d1 : d0 fb __ BNE $41ce ; (sprintf.l81 + 0)
.s1072:
41d3 : 84 45 __ STY T4 + 0 
.s79:
41d5 : ad ee bf LDA $bfee ; (buff + 48)
41d8 : d0 19 __ BNE $41f3 ; (sprintf.l95 + 0)
.s1075:
41da : a6 45 __ LDX T4 + 0 
41dc : ec e9 bf CPX $bfe9 ; (buff + 43)
41df : a4 43 __ LDY T1 + 0 
41e1 : b0 0c __ BCS $41ef ; (sprintf.s1076 + 0)
.l87:
41e3 : ad e8 bf LDA $bfe8 ; (buff + 42)
41e6 : 91 4b __ STA (T3 + 0),y 
41e8 : e8 __ __ INX
41e9 : ec e9 bf CPX $bfe9 ; (buff + 43)
41ec : c8 __ __ INY
41ed : 90 f4 __ BCC $41e3 ; (sprintf.l87 + 0)
.s1076:
41ef : 86 45 __ STX T4 + 0 
41f1 : 84 43 __ STY T1 + 0 
.l95:
41f3 : a0 00 __ LDY #$00
41f5 : b1 4d __ LDA (T6 + 0),y 
41f7 : f0 0f __ BEQ $4208 ; (sprintf.s91 + 0)
.s96:
41f9 : a4 43 __ LDY T1 + 0 
41fb : 91 4b __ STA (T3 + 0),y 
41fd : e6 43 __ INC T1 + 0 
41ff : e6 4d __ INC T6 + 0 
4201 : d0 f0 __ BNE $41f3 ; (sprintf.l95 + 0)
.s1093:
4203 : e6 4e __ INC T6 + 1 
4205 : 4c f3 41 JMP $41f3 ; (sprintf.l95 + 0)
.s91:
4208 : ad ee bf LDA $bfee ; (buff + 48)
420b : d0 03 __ BNE $4210 ; (sprintf.s1073 + 0)
420d : 4c d9 3f JMP $3fd9 ; (sprintf.l2 + 0)
.s1073:
4210 : a6 45 __ LDX T4 + 0 
4212 : ec e9 bf CPX $bfe9 ; (buff + 43)
4215 : a4 43 __ LDY T1 + 0 
4217 : b0 0c __ BCS $4225 ; (sprintf.s1074 + 0)
.l102:
4219 : ad e8 bf LDA $bfe8 ; (buff + 42)
421c : 91 4b __ STA (T3 + 0),y 
421e : e8 __ __ INX
421f : ec e9 bf CPX $bfe9 ; (buff + 43)
4222 : c8 __ __ INY
4223 : 90 f4 __ BCC $4219 ; (sprintf.l102 + 0)
.s1074:
4225 : 84 43 __ STY T1 + 0 
4227 : 4c d9 3f JMP $3fd9 ; (sprintf.l2 + 0)
.s57:
422a : a0 00 __ LDY #$00
422c : b1 47 __ LDA (T0 + 0),y 
422e : 85 53 __ STA T8 + 0 
4230 : c8 __ __ INY
4231 : b1 47 __ LDA (T0 + 0),y 
4233 : 85 54 __ STA T8 + 1 
4235 : c8 __ __ INY
4236 : b1 47 __ LDA (T0 + 0),y 
4238 : 85 55 __ STA T8 + 2 
423a : c8 __ __ INY
423b : b1 47 __ LDA (T0 + 0),y 
423d : 85 56 __ STA T8 + 3 
423f : 18 __ __ CLC
4240 : a5 47 __ LDA T0 + 0 
4242 : 69 04 __ ADC #$04
4244 : 85 47 __ STA T0 + 0 
4246 : 90 02 __ BCC $424a ; (sprintf.s1088 + 0)
.s1087:
4248 : e6 48 __ INC T0 + 1 
.s1088:
424a : a0 00 __ LDY #$00
424c : b1 49 __ LDA (T2 + 0),y 
424e : aa __ __ TAX
424f : e6 49 __ INC T2 + 0 
4251 : d0 02 __ BNE $4255 ; (sprintf.s1090 + 0)
.s1089:
4253 : e6 4a __ INC T2 + 1 
.s1090:
4255 : 8a __ __ TXA
4256 : e0 64 __ CPX #$64
4258 : f0 04 __ BEQ $425e ; (sprintf.s61 + 0)
.s64:
425a : c9 44 __ CMP #$44
425c : d0 04 __ BNE $4262 ; (sprintf.s62 + 0)
.s61:
425e : a9 01 __ LDA #$01
4260 : d0 1c __ BNE $427e ; (sprintf.s259 + 0)
.s62:
4262 : c9 75 __ CMP #$75
4264 : f0 17 __ BEQ $427d ; (sprintf.s284 + 0)
.s68:
4266 : c9 55 __ CMP #$55
4268 : f0 13 __ BEQ $427d ; (sprintf.s284 + 0)
.s66:
426a : c9 78 __ CMP #$78
426c : f0 07 __ BEQ $4275 ; (sprintf.s69 + 0)
.s72:
426e : c9 58 __ CMP #$58
4270 : f0 03 __ BEQ $4275 ; (sprintf.s69 + 0)
4272 : 4c d9 3f JMP $3fd9 ; (sprintf.l2 + 0)
.s69:
4275 : 8c ec bf STY $bfec ; (buff + 46)
4278 : a9 10 __ LDA #$10
427a : 8d eb bf STA $bfeb ; (buff + 45)
.s284:
427d : 98 __ __ TYA
.s259:
427e : 85 15 __ STA P8 
4280 : a5 4b __ LDA T3 + 0 
4282 : 85 0f __ STA P2 ; (fmt + 0)
4284 : a5 4c __ LDA T3 + 1 
4286 : 85 10 __ STA P3 ; (fmt + 1)
4288 : a9 e8 __ LDA #$e8
428a : 85 0d __ STA P0 ; (str + 0)
428c : a9 bf __ LDA #$bf
428e : 85 0e __ STA P1 ; (str + 1)
4290 : 20 38 36 JSR $3638 ; (nforml@proxy + 0)
4293 : a5 1b __ LDA ACCU + 0 
4295 : 4c 0f 40 JMP $400f ; (sprintf.s1068 + 0)
.s285:
4298 : a9 00 __ LDA #$00
.s261:
429a : 85 13 __ STA P6 
429c : a5 4b __ LDA T3 + 0 
429e : 85 0f __ STA P2 ; (fmt + 0)
42a0 : a5 4c __ LDA T3 + 1 
42a2 : 85 10 __ STA P3 ; (fmt + 1)
42a4 : a0 00 __ LDY #$00
42a6 : b1 47 __ LDA (T0 + 0),y 
42a8 : 85 11 __ STA P4 ; (fmt + 2)
42aa : c8 __ __ INY
42ab : b1 47 __ LDA (T0 + 0),y 
42ad : 85 12 __ STA P5 ; (fmt + 3)
42af : a9 e8 __ LDA #$e8
42b1 : 85 0d __ STA P0 ; (str + 0)
42b3 : a9 bf __ LDA #$bf
42b5 : 85 0e __ STA P1 ; (str + 1)
42b7 : 20 03 35 JSR $3503 ; (nformi.s0 + 0)
42ba : a5 1b __ LDA ACCU + 0 
42bc : 85 43 __ STA T1 + 0 
42be : 4c 9a 41 JMP $419a ; (sprintf.s258 + 0)
.s260:
42c1 : a0 00 __ LDY #$00
42c3 : b1 49 __ LDA (T2 + 0),y 
42c5 : aa __ __ TAX
42c6 : 18 __ __ CLC
42c7 : a5 49 __ LDA T2 + 0 
42c9 : 69 01 __ ADC #$01
42cb : 4c 4d 40 JMP $404d ; (sprintf.l15 + 0)
--------------------------------------------------------------------
42ce : __ __ __ BYT 6f 4e 20 00                                     : oN .
--------------------------------------------------------------------
42d2 : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
mul16by8: ; mul16by8
42d6 : a0 00 __ LDY #$00
42d8 : 84 06 __ STY WORK + 3 
42da : 4a __ __ LSR
42db : 90 0d __ BCC $42ea ; (mul16by8 + 20)
42dd : aa __ __ TAX
42de : 18 __ __ CLC
42df : 98 __ __ TYA
42e0 : 65 1b __ ADC ACCU + 0 
42e2 : a8 __ __ TAY
42e3 : a5 06 __ LDA WORK + 3 
42e5 : 65 1c __ ADC ACCU + 1 
42e7 : 85 06 __ STA WORK + 3 
42e9 : 8a __ __ TXA
42ea : 06 1b __ ASL ACCU + 0 
42ec : 26 1c __ ROL ACCU + 1 
42ee : 4a __ __ LSR
42ef : b0 ec __ BCS $42dd ; (mul16by8 + 7)
42f1 : d0 f7 __ BNE $42ea ; (mul16by8 + 20)
42f3 : 84 05 __ STY WORK + 2 
42f5 : 60 __ __ RTS
--------------------------------------------------------------------
4300 : __ __ __ BYT 76 64 63 20 6d 45 4d 4f 52 59 20 64 45 54 45 43 : vdc mEMORY dETEC
4310 : __ __ __ BYT 54 45 44 3a 20 25 44 20 6b 62 2c 20 53 43 52 45 : TED: %D kb, SCRE
4320 : __ __ __ BYT 45 4e 20 53 49 5a 45 3a 20 25 44 58 25 44 2c 20 : EN SIZE: %DX%D, 
4330 : __ __ __ BYT 45 58 54 2e 4d 45 4d 3a 20 25 53 00             : EXT.MEM: %S.
--------------------------------------------------------------------
divmod: ; divmod
433c : a5 1c __ LDA ACCU + 1 
433e : d0 31 __ BNE $4371 ; (divmod + 53)
4340 : a5 04 __ LDA WORK + 1 
4342 : d0 1e __ BNE $4362 ; (divmod + 38)
4344 : 85 06 __ STA WORK + 3 
4346 : a2 04 __ LDX #$04
4348 : 06 1b __ ASL ACCU + 0 
434a : 2a __ __ ROL
434b : c5 03 __ CMP WORK + 0 
434d : 90 02 __ BCC $4351 ; (divmod + 21)
434f : e5 03 __ SBC WORK + 0 
4351 : 26 1b __ ROL ACCU + 0 
4353 : 2a __ __ ROL
4354 : c5 03 __ CMP WORK + 0 
4356 : 90 02 __ BCC $435a ; (divmod + 30)
4358 : e5 03 __ SBC WORK + 0 
435a : 26 1b __ ROL ACCU + 0 
435c : ca __ __ DEX
435d : d0 eb __ BNE $434a ; (divmod + 14)
435f : 85 05 __ STA WORK + 2 
4361 : 60 __ __ RTS
4362 : a5 1b __ LDA ACCU + 0 
4364 : 85 05 __ STA WORK + 2 
4366 : a5 1c __ LDA ACCU + 1 
4368 : 85 06 __ STA WORK + 3 
436a : a9 00 __ LDA #$00
436c : 85 1b __ STA ACCU + 0 
436e : 85 1c __ STA ACCU + 1 
4370 : 60 __ __ RTS
4371 : a5 04 __ LDA WORK + 1 
4373 : d0 1f __ BNE $4394 ; (divmod + 88)
4375 : a5 03 __ LDA WORK + 0 
4377 : 30 1b __ BMI $4394 ; (divmod + 88)
4379 : a9 00 __ LDA #$00
437b : 85 06 __ STA WORK + 3 
437d : a2 10 __ LDX #$10
437f : 06 1b __ ASL ACCU + 0 
4381 : 26 1c __ ROL ACCU + 1 
4383 : 2a __ __ ROL
4384 : c5 03 __ CMP WORK + 0 
4386 : 90 02 __ BCC $438a ; (divmod + 78)
4388 : e5 03 __ SBC WORK + 0 
438a : 26 1b __ ROL ACCU + 0 
438c : 26 1c __ ROL ACCU + 1 
438e : ca __ __ DEX
438f : d0 f2 __ BNE $4383 ; (divmod + 71)
4391 : 85 05 __ STA WORK + 2 
4393 : 60 __ __ RTS
4394 : a9 00 __ LDA #$00
4396 : 85 05 __ STA WORK + 2 
4398 : 85 06 __ STA WORK + 3 
439a : 84 02 __ STY $02 
439c : a0 10 __ LDY #$10
439e : 18 __ __ CLC
439f : 26 1b __ ROL ACCU + 0 
43a1 : 26 1c __ ROL ACCU + 1 
43a3 : 26 05 __ ROL WORK + 2 
43a5 : 26 06 __ ROL WORK + 3 
43a7 : 38 __ __ SEC
43a8 : a5 05 __ LDA WORK + 2 
43aa : e5 03 __ SBC WORK + 0 
43ac : aa __ __ TAX
43ad : a5 06 __ LDA WORK + 3 
43af : e5 04 __ SBC WORK + 1 
43b1 : 90 04 __ BCC $43b7 ; (divmod + 123)
43b3 : 86 05 __ STX WORK + 2 
43b5 : 85 06 __ STA WORK + 3 
43b7 : 88 __ __ DEY
43b8 : d0 e5 __ BNE $439f ; (divmod + 99)
43ba : 26 1b __ ROL ACCU + 0 
43bc : 26 1c __ ROL ACCU + 1 
43be : a4 02 __ LDY $02 
43c0 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
43c1 : 84 02 __ STY $02 
43c3 : a0 20 __ LDY #$20
43c5 : a9 00 __ LDA #$00
43c7 : 85 07 __ STA WORK + 4 
43c9 : 85 08 __ STA WORK + 5 
43cb : 85 09 __ STA WORK + 6 
43cd : 85 0a __ STA WORK + 7 
43cf : a5 05 __ LDA WORK + 2 
43d1 : 05 06 __ ORA WORK + 3 
43d3 : d0 39 __ BNE $440e ; (divmod32 + 77)
43d5 : 18 __ __ CLC
43d6 : 26 1b __ ROL ACCU + 0 
43d8 : 26 1c __ ROL ACCU + 1 
43da : 26 1d __ ROL ACCU + 2 
43dc : 26 1e __ ROL ACCU + 3 
43de : 26 07 __ ROL WORK + 4 
43e0 : 26 08 __ ROL WORK + 5 
43e2 : 90 0c __ BCC $43f0 ; (divmod32 + 47)
43e4 : a5 07 __ LDA WORK + 4 
43e6 : e5 03 __ SBC WORK + 0 
43e8 : aa __ __ TAX
43e9 : a5 08 __ LDA WORK + 5 
43eb : e5 04 __ SBC WORK + 1 
43ed : 38 __ __ SEC
43ee : b0 0c __ BCS $43fc ; (divmod32 + 59)
43f0 : 38 __ __ SEC
43f1 : a5 07 __ LDA WORK + 4 
43f3 : e5 03 __ SBC WORK + 0 
43f5 : aa __ __ TAX
43f6 : a5 08 __ LDA WORK + 5 
43f8 : e5 04 __ SBC WORK + 1 
43fa : 90 04 __ BCC $4400 ; (divmod32 + 63)
43fc : 86 07 __ STX WORK + 4 
43fe : 85 08 __ STA WORK + 5 
4400 : 88 __ __ DEY
4401 : d0 d3 __ BNE $43d6 ; (divmod32 + 21)
4403 : 26 1b __ ROL ACCU + 0 
4405 : 26 1c __ ROL ACCU + 1 
4407 : 26 1d __ ROL ACCU + 2 
4409 : 26 1e __ ROL ACCU + 3 
440b : a4 02 __ LDY $02 
440d : 60 __ __ RTS
440e : 18 __ __ CLC
440f : 26 1b __ ROL ACCU + 0 
4411 : 26 1c __ ROL ACCU + 1 
4413 : 26 1d __ ROL ACCU + 2 
4415 : 26 1e __ ROL ACCU + 3 
4417 : 26 07 __ ROL WORK + 4 
4419 : 26 08 __ ROL WORK + 5 
441b : 26 09 __ ROL WORK + 6 
441d : 26 0a __ ROL WORK + 7 
441f : a5 07 __ LDA WORK + 4 
4421 : c5 03 __ CMP WORK + 0 
4423 : a5 08 __ LDA WORK + 5 
4425 : e5 04 __ SBC WORK + 1 
4427 : a5 09 __ LDA WORK + 6 
4429 : e5 05 __ SBC WORK + 2 
442b : a5 0a __ LDA WORK + 7 
442d : e5 06 __ SBC WORK + 3 
442f : 90 18 __ BCC $4449 ; (divmod32 + 136)
4431 : a5 07 __ LDA WORK + 4 
4433 : e5 03 __ SBC WORK + 0 
4435 : 85 07 __ STA WORK + 4 
4437 : a5 08 __ LDA WORK + 5 
4439 : e5 04 __ SBC WORK + 1 
443b : 85 08 __ STA WORK + 5 
443d : a5 09 __ LDA WORK + 6 
443f : e5 05 __ SBC WORK + 2 
4441 : 85 09 __ STA WORK + 6 
4443 : a5 0a __ LDA WORK + 7 
4445 : e5 06 __ SBC WORK + 3 
4447 : 85 0a __ STA WORK + 7 
4449 : 88 __ __ DEY
444a : d0 c3 __ BNE $440f ; (divmod32 + 78)
444c : 26 1b __ ROL ACCU + 0 
444e : 26 1c __ ROL ACCU + 1 
4450 : 26 1d __ ROL ACCU + 2 
4452 : 26 1e __ ROL ACCU + 3 
4454 : a4 02 __ LDY $02 
4456 : 60 __ __ RTS
--------------------------------------------------------------------
4457 : __ __ __ BYT 54 48 49 53 20 49 53 20 41 20 54 45 53 54 20 54 : THIS IS A TEST T
4467 : __ __ __ BYT 4f 20 57 52 49 54 45 20 44 41 54 41 20 54 4f 20 : O WRITE DATA TO 
4477 : __ __ __ BYT 54 48 45 20 44 49 53 4b 2e 00 00 00 00 00 00 00 : THE DISK........
4487 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4497 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
44a7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
44a8 : __ __ __ BYT 54 45 53 54 31 00 00 00 00 00 00 00 00 00 00    : TEST1..........
--------------------------------------------------------------------
vdc_modes:
44b7 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
44c7 : __ __ __ BYT 30 00 40 00 7f 04 26 06 19 07 20 08 fc 09 e7 ff : 0.@...&... .....
44d7 : __ __ __ BYT 50 00 32 00 01 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
44e7 : __ __ __ BYT 30 00 60 00 80 04 40 06 32 07 3a 08 03 09 07 ff : 0.`...@.2.:.....
--------------------------------------------------------------------
krnio_pstatus:
44f7 : __ __ __ BSS	16
--------------------------------------------------------------------
vdc_state:
4507 : __ __ __ BSS	22
--------------------------------------------------------------------
linebuffer:
451d : __ __ __ BSS	81
--------------------------------------------------------------------
01:1300 : __ __ __ BYT 74 45 53 54 49 4e 47 20 4c 4f 57 20 43 4f 44 45 : tESTING LOW CODE
01:1310 : __ __ __ BYT 00                                              : .
