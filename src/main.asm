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
1c13 : 8e ff 3a STX $3aff ; (spentry + 0)
1c16 : a9 db __ LDA #$db
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 45 __ LDA #$45
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 46 __ LDA #$46
1c21 : e9 45 __ SBC #$45
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
1c35 : a9 52 __ LDA #$52
1c37 : e9 db __ SBC #$db
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
1c97 : bd 39 45 LDA $4539,x ; (divmod32 + 149)
1c9a : 9d 5a bf STA $bf5a,x ; (filename + 14)
1c9d : ca __ __ DEX
1c9e : d0 f7 __ BNE $1c97 ; (main.l1002 + 0)
.s1003:
1ca0 : a2 0f __ LDX #$0f
.l1004:
1ca2 : bd 8a 45 LDA $458a,x 
1ca5 : 9d 4b bf STA $bf4b,x ; (main@stack + 6)
1ca8 : ca __ __ DEX
1ca9 : d0 f7 __ BNE $1ca2 ; (main.l1004 + 0)
.s1005:
1cab : a9 a8 __ LDA #$a8
1cad : a0 02 __ LDY #$02
1caf : 91 23 __ STA (SP + 0),y 
1cb1 : a9 38 __ LDA #$38
1cb3 : c8 __ __ INY
1cb4 : 91 23 __ STA (SP + 0),y 
1cb6 : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1cb9 : a9 00 __ LDA #$00
1cbb : 85 0d __ STA P0 
1cbd : 85 0e __ STA P1 
1cbf : 20 b5 38 JSR $38b5 ; (krnio_setbnk.s0 + 0)
1cc2 : 20 bd 38 JSR $38bd ; (krnio_setnam@proxy + 0)
1cc5 : a9 01 __ LDA #$01
1cc7 : 85 0d __ STA P0 
1cc9 : 85 0f __ STA P2 
1ccb : a9 08 __ LDA #$08
1ccd : 85 0e __ STA P1 
1ccf : a9 db __ LDA #$db
1cd1 : a0 02 __ LDY #$02
1cd3 : 91 23 __ STA (SP + 0),y 
1cd5 : a9 38 __ LDA #$38
1cd7 : c8 __ __ INY
1cd8 : 91 23 __ STA (SP + 0),y 
1cda : 20 f2 38 JSR $38f2 ; (krnio_open.s0 + 0)
1cdd : a0 04 __ LDY #$04
1cdf : 91 23 __ STA (SP + 0),y 
1ce1 : a9 00 __ LDA #$00
1ce3 : c8 __ __ INY
1ce4 : 91 23 __ STA (SP + 0),y 
1ce6 : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1ce9 : a9 1a __ LDA #$1a
1ceb : a0 02 __ LDY #$02
1ced : 91 23 __ STA (SP + 0),y 
1cef : a9 39 __ LDA #$39
1cf1 : c8 __ __ INY
1cf2 : 91 23 __ STA (SP + 0),y 
1cf4 : ad dc 45 LDA $45dc ; (krnio_pstatus + 1)
1cf7 : c8 __ __ INY
1cf8 : 91 23 __ STA (SP + 0),y 
1cfa : a9 00 __ LDA #$00
1cfc : c8 __ __ INY
1cfd : 91 23 __ STA (SP + 0),y 
1cff : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1d02 : a9 31 __ LDA #$31
1d04 : a0 02 __ LDY #$02
1d06 : 91 23 __ STA (SP + 0),y 
1d08 : a9 39 __ LDA #$39
1d0a : c8 __ __ INY
1d0b : 91 23 __ STA (SP + 0),y 
1d0d : a9 01 __ LDA #$01
1d0f : 20 49 39 JSR $3949 ; (krnio_chkout.s1000 + 0)
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
.l1466:
1d26 : 86 53 __ STX T0 + 0 
1d28 : bd 5b bf LDA $bf5b,x ; (testdata + 0)
1d2b : 20 5b 39 JSR $395b ; (krnio_chrout.s1000 + 0)
1d2e : a6 53 __ LDX T0 + 0 
1d30 : e8 __ __ INX
1d31 : e0 51 __ CPX #$51
1d33 : 90 f1 __ BCC $1d26 ; (main.l1466 + 0)
.s9:
1d35 : 20 69 39 JSR $3969 ; (krnio_clrchn.s0 + 0)
1d38 : a9 51 __ LDA #$51
1d3a : a0 04 __ LDY #$04
1d3c : 91 23 __ STA (SP + 0),y 
1d3e : a9 00 __ LDA #$00
.s2:
1d40 : a0 05 __ LDY #$05
1d42 : 91 23 __ STA (SP + 0),y 
1d44 : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1d47 : a9 6d __ LDA #$6d
1d49 : a0 02 __ LDY #$02
1d4b : 91 23 __ STA (SP + 0),y 
1d4d : a9 39 __ LDA #$39
1d4f : c8 __ __ INY
1d50 : 91 23 __ STA (SP + 0),y 
1d52 : ad dc 45 LDA $45dc ; (krnio_pstatus + 1)
1d55 : c8 __ __ INY
1d56 : 91 23 __ STA (SP + 0),y 
1d58 : a9 00 __ LDA #$00
1d5a : c8 __ __ INY
1d5b : 91 23 __ STA (SP + 0),y 
1d5d : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1d60 : a9 01 __ LDA #$01
1d62 : 20 85 39 JSR $3985 ; (krnio_close.s1000 + 0)
1d65 : a9 00 __ LDA #$00
1d67 : 85 0f __ STA P2 
1d69 : 85 10 __ STA P3 
1d6b : 85 12 __ STA P5 
1d6d : 20 8d 39 JSR $398d ; (memset@proxy + 0)
1d70 : a9 b5 __ LDA #$b5
1d72 : a0 02 __ LDY #$02
1d74 : 91 23 __ STA (SP + 0),y 
1d76 : a9 39 __ LDA #$39
1d78 : c8 __ __ INY
1d79 : 91 23 __ STA (SP + 0),y 
1d7b : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1d7e : a9 00 __ LDA #$00
1d80 : 85 0d __ STA P0 
1d82 : 85 0e __ STA P1 
1d84 : 20 b5 38 JSR $38b5 ; (krnio_setbnk.s0 + 0)
1d87 : 20 bd 38 JSR $38bd ; (krnio_setnam@proxy + 0)
1d8a : a9 01 __ LDA #$01
1d8c : 85 0d __ STA P0 
1d8e : a9 08 __ LDA #$08
1d90 : 85 0e __ STA P1 
1d92 : a9 00 __ LDA #$00
1d94 : 85 0f __ STA P2 
1d96 : a9 db __ LDA #$db
1d98 : a0 02 __ LDY #$02
1d9a : 91 23 __ STA (SP + 0),y 
1d9c : a9 38 __ LDA #$38
1d9e : c8 __ __ INY
1d9f : 91 23 __ STA (SP + 0),y 
1da1 : 20 f2 38 JSR $38f2 ; (krnio_open.s0 + 0)
1da4 : a0 04 __ LDY #$04
1da6 : 91 23 __ STA (SP + 0),y 
1da8 : a9 00 __ LDA #$00
1daa : c8 __ __ INY
1dab : 91 23 __ STA (SP + 0),y 
1dad : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1db0 : a9 1a __ LDA #$1a
1db2 : a0 02 __ LDY #$02
1db4 : 91 23 __ STA (SP + 0),y 
1db6 : a9 39 __ LDA #$39
1db8 : c8 __ __ INY
1db9 : 91 23 __ STA (SP + 0),y 
1dbb : ad dc 45 LDA $45dc ; (krnio_pstatus + 1)
1dbe : c8 __ __ INY
1dbf : 91 23 __ STA (SP + 0),y 
1dc1 : a9 00 __ LDA #$00
1dc3 : c8 __ __ INY
1dc4 : 91 23 __ STA (SP + 0),y 
1dc6 : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1dc9 : a9 c1 __ LDA #$c1
1dcb : a0 02 __ LDY #$02
1dcd : 91 23 __ STA (SP + 0),y 
1dcf : a9 39 __ LDA #$39
1dd1 : c8 __ __ INY
1dd2 : 91 23 __ STA (SP + 0),y 
1dd4 : ad dc 45 LDA $45dc ; (krnio_pstatus + 1)
1dd7 : c9 40 __ CMP #$40
1dd9 : d0 04 __ BNE $1ddf ; (main.s15 + 0)
.s13:
1ddb : a9 00 __ LDA #$00
1ddd : f0 0e __ BEQ $1ded ; (main.s1474 + 0)
.s15:
1ddf : a9 01 __ LDA #$01
1de1 : 20 d8 39 JSR $39d8 ; (krnio_chkin.s1000 + 0)
1de4 : 09 00 __ ORA #$00
1de6 : f0 03 __ BEQ $1deb ; (main.s18 + 0)
1de8 : 4c 10 32 JMP $3210 ; (main.s17 + 0)
.s18:
1deb : a9 ff __ LDA #$ff
.s1474:
1ded : 85 53 __ STA T0 + 0 
1def : 85 54 __ STA T0 + 1 
.s12:
1df1 : a5 53 __ LDA T0 + 0 
1df3 : a0 04 __ LDY #$04
1df5 : 91 23 __ STA (SP + 0),y 
1df7 : a5 54 __ LDA T0 + 1 
1df9 : c8 __ __ INY
1dfa : 91 23 __ STA (SP + 0),y 
1dfc : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1dff : a9 02 __ LDA #$02
1e01 : a0 02 __ LDY #$02
1e03 : 91 23 __ STA (SP + 0),y 
1e05 : a9 3a __ LDA #$3a
1e07 : c8 __ __ INY
1e08 : 91 23 __ STA (SP + 0),y 
1e0a : ad dc 45 LDA $45dc ; (krnio_pstatus + 1)
1e0d : c8 __ __ INY
1e0e : 91 23 __ STA (SP + 0),y 
1e10 : a9 00 __ LDA #$00
1e12 : c8 __ __ INY
1e13 : 91 23 __ STA (SP + 0),y 
1e15 : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1e18 : a9 01 __ LDA #$01
1e1a : 20 85 39 JSR $3985 ; (krnio_close.s1000 + 0)
1e1d : a9 19 __ LDA #$19
1e1f : a0 02 __ LDY #$02
1e21 : 91 23 __ STA (SP + 0),y 
1e23 : a9 3a __ LDA #$3a
1e25 : c8 __ __ INY
1e26 : 91 23 __ STA (SP + 0),y 
1e28 : a9 5b __ LDA #$5b
1e2a : c8 __ __ INY
1e2b : 91 23 __ STA (SP + 0),y 
1e2d : a9 bf __ LDA #$bf
1e2f : c8 __ __ INY
1e30 : 91 23 __ STA (SP + 0),y 
1e32 : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1e35 : 20 28 3a JSR $3a28 ; (getch.s0 + 0)
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
1e4c : 20 99 39 JSR $3999 ; (memset.s0 + 0)
1e4f : a2 ff __ LDX #$ff
.l1006:
1e51 : e8 __ __ INX
1e52 : bd 67 3a LDA $3a67,x 
1e55 : 9d 5b bf STA $bf5b,x ; (testdata + 0)
1e58 : d0 f7 __ BNE $1e51 ; (main.l1006 + 0)
.s1007:
1e5a : a2 ff __ LDX #$ff
.l1008:
1e5c : e8 __ __ INX
1e5d : bd 81 3a LDA $3a81,x 
1e60 : 9d 4c bf STA $bf4c,x ; (filename + 0)
1e63 : d0 f7 __ BNE $1e5c ; (main.l1008 + 0)
.s1009:
1e65 : a9 a8 __ LDA #$a8
1e67 : a0 02 __ LDY #$02
1e69 : 91 23 __ STA (SP + 0),y 
1e6b : a9 38 __ LDA #$38
1e6d : c8 __ __ INY
1e6e : 91 23 __ STA (SP + 0),y 
1e70 : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1e73 : a9 00 __ LDA #$00
1e75 : 85 53 __ STA T0 + 0 
1e77 : 85 0d __ STA P0 
1e79 : 85 0e __ STA P1 
1e7b : 20 b5 38 JSR $38b5 ; (krnio_setbnk.s0 + 0)
1e7e : 20 bd 38 JSR $38bd ; (krnio_setnam@proxy + 0)
1e81 : a9 08 __ LDA #$08
1e83 : 85 0d __ STA P0 
1e85 : a9 5b __ LDA #$5b
1e87 : 85 0e __ STA P1 
1e89 : a9 bf __ LDA #$bf
1e8b : 85 0f __ STA P2 
1e8d : a9 87 __ LDA #$87
1e8f : a0 02 __ LDY #$02
1e91 : 91 23 __ STA (SP + 0),y 
1e93 : a9 3a __ LDA #$3a
1e95 : c8 __ __ INY
1e96 : 91 23 __ STA (SP + 0),y 
1e98 : ad 5b bf LDA $bf5b ; (testdata + 0)
1e9b : f0 0c __ BEQ $1ea9 ; (main.s37 + 0)
.s36:
1e9d : a2 00 __ LDX #$00
.l1468:
1e9f : bd 5c bf LDA $bf5c,x ; (testdata + 1)
1ea2 : e8 __ __ INX
1ea3 : 09 00 __ ORA #$00
1ea5 : d0 f8 __ BNE $1e9f ; (main.l1468 + 0)
.s1469:
1ea7 : 86 53 __ STX T0 + 0 
.s37:
1ea9 : 18 __ __ CLC
1eaa : a9 5b __ LDA #$5b
1eac : 65 53 __ ADC T0 + 0 
1eae : 85 10 __ STA P3 
1eb0 : a9 bf __ LDA #$bf
1eb2 : 69 00 __ ADC #$00
1eb4 : 85 11 __ STA P4 
1eb6 : 20 9e 3a JSR $3a9e ; (krnio_save.s0 + 0)
1eb9 : a0 04 __ LDY #$04
1ebb : 91 23 __ STA (SP + 0),y 
1ebd : a9 00 __ LDA #$00
1ebf : c8 __ __ INY
1ec0 : 91 23 __ STA (SP + 0),y 
1ec2 : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1ec5 : a9 6d __ LDA #$6d
1ec7 : a0 02 __ LDY #$02
1ec9 : 91 23 __ STA (SP + 0),y 
1ecb : a9 39 __ LDA #$39
1ecd : c8 __ __ INY
1ece : 91 23 __ STA (SP + 0),y 
1ed0 : ad dc 45 LDA $45dc ; (krnio_pstatus + 1)
1ed3 : c8 __ __ INY
1ed4 : 91 23 __ STA (SP + 0),y 
1ed6 : a9 00 __ LDA #$00
1ed8 : c8 __ __ INY
1ed9 : 91 23 __ STA (SP + 0),y 
1edb : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1ede : a9 00 __ LDA #$00
1ee0 : 85 0f __ STA P2 
1ee2 : 85 10 __ STA P3 
1ee4 : 85 12 __ STA P5 
1ee6 : 20 8d 39 JSR $398d ; (memset@proxy + 0)
1ee9 : a9 bb __ LDA #$bb
1eeb : a0 02 __ LDY #$02
1eed : 91 23 __ STA (SP + 0),y 
1eef : a9 3a __ LDA #$3a
1ef1 : c8 __ __ INY
1ef2 : 91 23 __ STA (SP + 0),y 
1ef4 : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1ef7 : a9 00 __ LDA #$00
1ef9 : 85 0d __ STA P0 
1efb : 85 0e __ STA P1 
1efd : 20 b5 38 JSR $38b5 ; (krnio_setbnk.s0 + 0)
1f00 : 20 bd 38 JSR $38bd ; (krnio_setnam@proxy + 0)
1f03 : a9 01 __ LDA #$01
1f05 : 85 0d __ STA P0 
1f07 : 85 0f __ STA P2 
1f09 : a9 08 __ LDA #$08
1f0b : 85 0e __ STA P1 
1f0d : a9 c7 __ LDA #$c7
1f0f : a0 02 __ LDY #$02
1f11 : 91 23 __ STA (SP + 0),y 
1f13 : a9 3a __ LDA #$3a
1f15 : c8 __ __ INY
1f16 : 91 23 __ STA (SP + 0),y 
1f18 : 20 de 3a JSR $3ade ; (krnio_load.s0 + 0)
1f1b : a0 04 __ LDY #$04
1f1d : 91 23 __ STA (SP + 0),y 
1f1f : a9 00 __ LDA #$00
1f21 : c8 __ __ INY
1f22 : 91 23 __ STA (SP + 0),y 
1f24 : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1f27 : a9 6d __ LDA #$6d
1f29 : a0 02 __ LDY #$02
1f2b : 91 23 __ STA (SP + 0),y 
1f2d : a9 39 __ LDA #$39
1f2f : c8 __ __ INY
1f30 : 91 23 __ STA (SP + 0),y 
1f32 : ad dc 45 LDA $45dc ; (krnio_pstatus + 1)
1f35 : c8 __ __ INY
1f36 : 91 23 __ STA (SP + 0),y 
1f38 : a9 00 __ LDA #$00
1f3a : c8 __ __ INY
1f3b : 91 23 __ STA (SP + 0),y 
1f3d : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1f40 : a9 5b __ LDA #$5b
1f42 : a0 04 __ LDY #$04
1f44 : 91 23 __ STA (SP + 0),y 
1f46 : a9 bf __ LDA #$bf
1f48 : c8 __ __ INY
1f49 : 91 23 __ STA (SP + 0),y 
1f4b : a9 19 __ LDA #$19
1f4d : a0 02 __ LDY #$02
1f4f : 91 23 __ STA (SP + 0),y 
1f51 : a9 3a __ LDA #$3a
1f53 : c8 __ __ INY
1f54 : 91 23 __ STA (SP + 0),y 
1f56 : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
1f59 : 20 28 3a JSR $3a28 ; (getch.s0 + 0)
1f5c : a9 1a __ LDA #$1a
1f5e : 8d 00 d6 STA $d600 
.l7391:
1f61 : 2c 00 d6 BIT $d600 
1f64 : 10 fb __ BPL $1f61 ; (main.l7391 + 0)
.s46:
1f66 : ad 01 d6 LDA $d601 
1f69 : 29 f0 __ AND #$f0
1f6b : aa __ __ TAX
1f6c : a9 1a __ LDA #$1a
1f6e : 8d 00 d6 STA $d600 
.l7393:
1f71 : 2c 00 d6 BIT $d600 
1f74 : 10 fb __ BPL $1f71 ; (main.l7393 + 0)
.s52:
1f76 : 8e 01 d6 STX $d601 
1f79 : 8d 00 d6 STA $d600 
.l7395:
1f7c : 2c 00 d6 BIT $d600 
1f7f : 10 fb __ BPL $1f7c ; (main.l7395 + 0)
.s59:
1f81 : ad 01 d6 LDA $d601 
1f84 : 29 0f __ AND #$0f
1f86 : 09 d0 __ ORA #$d0
1f88 : aa __ __ TAX
1f89 : a9 1a __ LDA #$1a
1f8b : 8d 00 d6 STA $d600 
.l7397:
1f8e : 2c 00 d6 BIT $d600 
1f91 : 10 fb __ BPL $1f8e ; (main.l7397 + 0)
.s65:
1f93 : 8e 01 d6 STX $d601 
1f96 : a9 8d __ LDA #$8d
1f98 : 8d f2 45 STA $45f2 ; (vdc_state + 7)
1f9b : a9 1c __ LDA #$1c
1f9d : 8d 00 d6 STA $d600 
.l7399:
1fa0 : 2c 00 d6 BIT $d600 
1fa3 : 10 fb __ BPL $1fa0 ; (main.l7399 + 0)
.s71:
1fa5 : ad 01 d6 LDA $d601 
1fa8 : aa __ __ TAX
1fa9 : 09 10 __ ORA #$10
1fab : a8 __ __ TAY
1fac : a9 1c __ LDA #$1c
1fae : 8d 00 d6 STA $d600 
.l7401:
1fb1 : 2c 00 d6 BIT $d600 
1fb4 : 10 fb __ BPL $1fb1 ; (main.l7401 + 0)
.s78:
1fb6 : 8c 01 d6 STY $d601 
1fb9 : a9 12 __ LDA #$12
1fbb : 8d 00 d6 STA $d600 
.l7403:
1fbe : 2c 00 d6 BIT $d600 
1fc1 : 10 fb __ BPL $1fbe ; (main.l7403 + 0)
.s85:
1fc3 : a9 1f __ LDA #$1f
1fc5 : 8d 01 d6 STA $d601 
1fc8 : a9 13 __ LDA #$13
1fca : 8d 00 d6 STA $d600 
.l7405:
1fcd : 2c 00 d6 BIT $d600 
1fd0 : 10 fb __ BPL $1fcd ; (main.l7405 + 0)
.s90:
1fd2 : a9 ff __ LDA #$ff
1fd4 : 8d 01 d6 STA $d601 
1fd7 : a9 1f __ LDA #$1f
1fd9 : 8d 00 d6 STA $d600 
.l7407:
1fdc : 2c 00 d6 BIT $d600 
1fdf : 10 fb __ BPL $1fdc ; (main.l7407 + 0)
.s94:
1fe1 : a9 00 __ LDA #$00
1fe3 : 8d 01 d6 STA $d601 
1fe6 : a9 12 __ LDA #$12
1fe8 : 8d 00 d6 STA $d600 
.l7409:
1feb : 2c 00 d6 BIT $d600 
1fee : 10 fb __ BPL $1feb ; (main.l7409 + 0)
.s101:
1ff0 : a9 9f __ LDA #$9f
1ff2 : 8d 01 d6 STA $d601 
1ff5 : a9 13 __ LDA #$13
1ff7 : 8d 00 d6 STA $d600 
.l7411:
1ffa : 2c 00 d6 BIT $d600 
1ffd : 10 fb __ BPL $1ffa ; (main.l7411 + 0)
.s106:
1fff : a9 ff __ LDA #$ff
2001 : 8d 01 d6 STA $d601 
2004 : a9 1f __ LDA #$1f
2006 : 8d 00 d6 STA $d600 
.l7413:
2009 : 2c 00 d6 BIT $d600 
200c : 10 fb __ BPL $2009 ; (main.l7413 + 0)
.s110:
200e : a9 ff __ LDA #$ff
2010 : 8d 01 d6 STA $d601 
2013 : a9 12 __ LDA #$12
2015 : 8d 00 d6 STA $d600 
.l7415:
2018 : 2c 00 d6 BIT $d600 
201b : 10 fb __ BPL $2018 ; (main.l7415 + 0)
.s117:
201d : a9 1f __ LDA #$1f
201f : 8d 01 d6 STA $d601 
2022 : a9 13 __ LDA #$13
2024 : 8d 00 d6 STA $d600 
.l7417:
2027 : 2c 00 d6 BIT $d600 
202a : 10 fb __ BPL $2027 ; (main.l7417 + 0)
.s122:
202c : a9 ff __ LDA #$ff
202e : 8d 01 d6 STA $d601 
2031 : a9 1f __ LDA #$1f
2033 : 8d 00 d6 STA $d600 
.l7419:
2036 : 2c 00 d6 BIT $d600 
2039 : 10 fb __ BPL $2036 ; (main.l7419 + 0)
.s126:
203b : ad 01 d6 LDA $d601 
203e : f0 04 __ BEQ $2044 ; (main.s1487 + 0)
.s1488:
2040 : a9 10 __ LDA #$10
2042 : d0 02 __ BNE $2046 ; (main.s1489 + 0)
.s1487:
2044 : a9 40 __ LDA #$40
.s1489:
2046 : 8d eb 45 STA $45eb ; (vdc_state + 0)
2049 : a9 1c __ LDA #$1c
204b : 8d 00 d6 STA $d600 
.l7422:
204e : 2c 00 d6 BIT $d600 
2051 : 10 fb __ BPL $204e ; (main.l7422 + 0)
.s133:
2053 : 8e 01 d6 STX $d601 
2056 : a9 00 __ LDA #$00
2058 : 85 52 __ STA T1 + 0 
205a : ad ee 45 LDA $45ee ; (vdc_state + 3)
205d : 85 53 __ STA T0 + 0 
205f : ad f0 45 LDA $45f0 ; (vdc_state + 5)
2062 : 85 57 __ STA T4 + 0 
.l136:
2064 : a5 52 __ LDA T1 + 0 
2066 : c5 57 __ CMP T4 + 0 
2068 : b0 03 __ BCS $206d ; (main.s66 + 0)
206a : 4c 30 31 JMP $3130 ; (main.s137 + 0)
.s66:
206d : 24 d7 __ BIT $d7 
206f : 30 17 __ BMI $2088 ; (main.s211 + 0)
.s214:
2071 : a9 00 __ LDA #$00
2073 : a0 02 __ LDY #$02
2075 : 91 23 __ STA (SP + 0),y 
2077 : a9 3b __ LDA #$3b
2079 : c8 __ __ INY
207a : 91 23 __ STA (SP + 0),y 
207c : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
207f : 20 28 3a JSR $3a28 ; (getch.s0 + 0)
2082 : 20 fb 3a JSR $3afb ; (clrscr.s0 + 0)
2085 : 20 2b 3b JSR $3b2b ; (screen_setmode.s0 + 0)
.s211:
2088 : a9 06 __ LDA #$06
208a : 8d 06 d5 STA $d506 
208d : a9 00 __ LDA #$00
208f : 85 0d __ STA P0 
2091 : 85 0e __ STA P1 
2093 : 20 b5 38 JSR $38b5 ; (krnio_setbnk.s0 + 0)
2096 : a9 33 __ LDA #$33
2098 : 85 0d __ STA P0 
209a : a9 3b __ LDA #$3b
209c : 85 0e __ STA P1 
209e : 20 c5 38 JSR $38c5 ; (krnio_setnam.s0 + 0)
20a1 : a9 01 __ LDA #$01
20a3 : 85 0d __ STA P0 
20a5 : 85 0f __ STA P2 
20a7 : a9 08 __ LDA #$08
20a9 : 85 0e __ STA P1 
20ab : 20 de 3a JSR $3ade ; (krnio_load.s0 + 0)
20ae : 09 00 __ ORA #$00
20b0 : d0 19 __ BNE $20cb ; (main.s224 + 0)
.s220:
20b2 : a9 38 __ LDA #$38
20b4 : a0 02 __ LDY #$02
20b6 : 91 23 __ STA (SP + 0),y 
20b8 : a9 3b __ LDA #$3b
20ba : c8 __ __ INY
20bb : 91 23 __ STA (SP + 0),y 
20bd : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
20c0 : a9 01 __ LDA #$01
20c2 : 85 0d __ STA P0 
20c4 : a9 00 __ LDA #$00
20c6 : 85 0e __ STA P1 
20c8 : 20 55 3b JSR $3b55 ; (exit.s0 + 0)
.s224:
20cb : a9 01 __ LDA #$01
20cd : 8d 30 d0 STA $d030 
20d0 : a9 00 __ LDA #$00
20d2 : 85 16 __ STA P9 
20d4 : ad 11 d0 LDA $d011 
20d7 : 29 6f __ AND #$6f
20d9 : 8d 11 d0 STA $d011 
20dc : 20 6a 3b JSR $3b6a ; (vdc_set_mode.s1000 + 0)
20df : a2 ff __ LDX #$ff
.l1010:
20e1 : e8 __ __ INX
20e2 : bd 12 40 LDA $4012,x 
20e5 : 9d 5b bf STA $bf5b,x ; (testdata + 0)
20e8 : d0 f7 __ BNE $20e1 ; (main.l1010 + 0)
.s1011:
20ea : a9 60 __ LDA #$60
20ec : 20 00 13 JSR $1300 ; (bnk_writeb.s1000 + 0)
20ef : a9 60 __ LDA #$60
20f1 : 85 0d __ STA P0 
20f3 : 85 0e __ STA P1 
20f5 : 20 10 13 JSR $1310 ; (bnk_writew.s0 + 0)
20f8 : a9 60 __ LDA #$60
20fa : a0 04 __ LDY #$04
20fc : 91 23 __ STA (SP + 0),y 
20fe : a9 00 __ LDA #$00
2100 : c8 __ __ INY
2101 : 91 23 __ STA (SP + 0),y 
2103 : a9 20 __ LDA #$20
2105 : a0 02 __ LDY #$02
2107 : 91 23 __ STA (SP + 0),y 
2109 : a9 40 __ LDA #$40
210b : c8 __ __ INY
210c : 91 23 __ STA (SP + 0),y 
210e : 20 26 13 JSR $1326 ; (bnk_readb.s0 + 0)
2111 : a0 06 __ LDY #$06
2113 : 91 23 __ STA (SP + 0),y 
2115 : a9 00 __ LDA #$00
2117 : c8 __ __ INY
2118 : 91 23 __ STA (SP + 0),y 
211a : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
211d : a9 60 __ LDA #$60
211f : a0 04 __ LDY #$04
2121 : 91 23 __ STA (SP + 0),y 
2123 : c8 __ __ INY
2124 : 91 23 __ STA (SP + 0),y 
2126 : a9 42 __ LDA #$42
2128 : a0 02 __ LDY #$02
212a : 91 23 __ STA (SP + 0),y 
212c : a9 40 __ LDA #$40
212e : c8 __ __ INY
212f : 91 23 __ STA (SP + 0),y 
2131 : 20 35 13 JSR $1335 ; (bnk_readw.s0 + 0)
2134 : a5 1b __ LDA ACCU + 0 
2136 : a0 06 __ LDY #$06
2138 : 91 23 __ STA (SP + 0),y 
213a : a5 1c __ LDA ACCU + 1 
213c : c8 __ __ INY
213d : 91 23 __ STA (SP + 0),y 
213f : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
2142 : a9 7f __ LDA #$7f
2144 : 85 0d __ STA P0 
2146 : a9 0e __ LDA #$0e
2148 : 85 10 __ STA P3 
214a : a9 5b __ LDA #$5b
214c : 85 11 __ STA P4 
214e : a9 bf __ LDA #$bf
2150 : 85 12 __ STA P5 
2152 : a9 00 __ LDA #$00
2154 : 85 13 __ STA P6 
2156 : 85 0e __ STA P1 
2158 : 85 54 __ STA T0 + 1 
215a : a9 d0 __ LDA #$d0
215c : 85 0f __ STA P2 
215e : ad 5b bf LDA $bf5b ; (testdata + 0)
2161 : f0 13 __ BEQ $2176 ; (main.s410 + 0)
.s1477:
2163 : a0 00 __ LDY #$00
.l409:
2165 : 98 __ __ TYA
2166 : aa __ __ TAX
2167 : 18 __ __ CLC
2168 : 69 01 __ ADC #$01
216a : a8 __ __ TAY
216b : 90 02 __ BCC $216f ; (main.s1491 + 0)
.s1490:
216d : e6 54 __ INC T0 + 1 
.s1491:
216f : bd 5c bf LDA $bf5c,x ; (testdata + 1)
2172 : d0 f1 __ BNE $2165 ; (main.l409 + 0)
.s1478:
2174 : 84 13 __ STY P6 
.s410:
2176 : 20 4b 13 JSR $134b ; (bnk_memcpy@proxy + 0)
2179 : a9 0e __ LDA #$0e
217b : 85 0d __ STA P0 
217d : a9 7f __ LDA #$7f
217f : 85 10 __ STA P3 
2181 : a9 01 __ LDA #$01
2183 : 85 0e __ STA P1 
2185 : a9 46 __ LDA #$46
2187 : 85 0f __ STA P2 
2189 : a9 00 __ LDA #$00
218b : 85 13 __ STA P6 
218d : 85 11 __ STA P4 
218f : 85 54 __ STA T0 + 1 
2191 : a9 d0 __ LDA #$d0
2193 : 85 12 __ STA P5 
2195 : ad 5b bf LDA $bf5b ; (testdata + 0)
2198 : f0 13 __ BEQ $21ad ; (main.s415 + 0)
.s1479:
219a : a0 00 __ LDY #$00
.l414:
219c : 98 __ __ TYA
219d : aa __ __ TAX
219e : 18 __ __ CLC
219f : 69 01 __ ADC #$01
21a1 : a8 __ __ TAY
21a2 : 90 02 __ BCC $21a6 ; (main.s1493 + 0)
.s1492:
21a4 : e6 54 __ INC T0 + 1 
.s1493:
21a6 : bd 5c bf LDA $bf5c,x ; (testdata + 1)
21a9 : d0 f1 __ BNE $219c ; (main.l414 + 0)
.s1480:
21ab : 84 13 __ STY P6 
.s415:
21ad : 20 4b 13 JSR $134b ; (bnk_memcpy@proxy + 0)
21b0 : a9 62 __ LDA #$62
21b2 : a0 02 __ LDY #$02
21b4 : 91 23 __ STA (SP + 0),y 
21b6 : a9 40 __ LDA #$40
21b8 : c8 __ __ INY
21b9 : 91 23 __ STA (SP + 0),y 
21bb : a9 5b __ LDA #$5b
21bd : c8 __ __ INY
21be : 91 23 __ STA (SP + 0),y 
21c0 : a9 bf __ LDA #$bf
21c2 : c8 __ __ INY
21c3 : 91 23 __ STA (SP + 0),y 
21c5 : a9 01 __ LDA #$01
21c7 : c8 __ __ INY
21c8 : 91 23 __ STA (SP + 0),y 
21ca : a9 46 __ LDA #$46
21cc : c8 __ __ INY
21cd : 91 23 __ STA (SP + 0),y 
21cf : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
21d2 : ad f3 45 LDA $45f3 ; (vdc_state + 8)
21d5 : 85 53 __ STA T0 + 0 
21d7 : 85 0d __ STA P0 
21d9 : ad f4 45 LDA $45f4 ; (vdc_state + 9)
21dc : 85 54 __ STA T0 + 1 
21de : 85 0e __ STA P1 
21e0 : a9 00 __ LDA #$00
21e2 : 85 11 __ STA P4 
21e4 : 85 0f __ STA P2 
21e6 : 85 58 __ STA T4 + 1 
21e8 : a9 d0 __ LDA #$d0
21ea : 85 10 __ STA P3 
21ec : ad 5b bf LDA $bf5b ; (testdata + 0)
21ef : f0 13 __ BEQ $2204 ; (main.s420 + 0)
.s1481:
21f1 : a0 00 __ LDY #$00
.l419:
21f3 : 98 __ __ TYA
21f4 : aa __ __ TAX
21f5 : 18 __ __ CLC
21f6 : 69 01 __ ADC #$01
21f8 : a8 __ __ TAY
21f9 : 90 02 __ BCC $21fd ; (main.s1495 + 0)
.s1494:
21fb : e6 58 __ INC T4 + 1 
.s1495:
21fd : bd 5c bf LDA $bf5c,x ; (testdata + 1)
2200 : d0 f1 __ BNE $21f3 ; (main.l419 + 0)
.s1482:
2202 : 84 11 __ STY P4 
.s420:
2204 : a5 58 __ LDA T4 + 1 
2206 : 85 12 __ STA P5 
2208 : 20 91 13 JSR $1391 ; (bnk_cpytovdc.s0 + 0)
220b : a5 53 __ LDA T0 + 0 
220d : 85 0f __ STA P2 
220f : a5 54 __ LDA T0 + 1 
2211 : 85 10 __ STA P3 
2213 : 20 ff 13 JSR $13ff ; (bnk_cpyfromvdc.s0 + 0)
2216 : 20 28 3a JSR $3a28 ; (getch.s0 + 0)
2219 : a9 00 __ LDA #$00
221b : 85 52 __ STA T1 + 0 
221d : ad ee 45 LDA $45ee ; (vdc_state + 3)
2220 : 85 53 __ STA T0 + 0 
2222 : ad f0 45 LDA $45f0 ; (vdc_state + 5)
2225 : 85 57 __ STA T4 + 0 
.l424:
2227 : a5 52 __ LDA T1 + 0 
2229 : c5 57 __ CMP T4 + 0 
222b : a9 00 __ LDA #$00
222d : 2a __ __ ROL
222e : 49 01 __ EOR #$01
2230 : f0 03 __ BEQ $2235 ; (main.s422 + 0)
2232 : 4c 50 30 JMP $3050 ; (main.s425 + 0)
.s422:
2235 : ad f3 45 LDA $45f3 ; (vdc_state + 8)
2238 : 85 0d __ STA P0 
223a : ad f4 45 LDA $45f4 ; (vdc_state + 9)
223d : 85 0e __ STA P1 
223f : a9 d0 __ LDA #$d0
2241 : 85 11 __ STA P4 
2243 : a9 07 __ LDA #$07
2245 : 85 12 __ STA P5 
2247 : a9 00 __ LDA #$00
2249 : 85 52 __ STA T1 + 0 
224b : 85 0f __ STA P2 
224d : a9 20 __ LDA #$20
224f : 85 10 __ STA P3 
2251 : 20 91 13 JSR $1391 ; (bnk_cpytovdc.s0 + 0)
2254 : 20 28 3a JSR $3a28 ; (getch.s0 + 0)
2257 : ad ee 45 LDA $45ee ; (vdc_state + 3)
225a : 85 53 __ STA T0 + 0 
225c : ad f0 45 LDA $45f0 ; (vdc_state + 5)
225f : 85 57 __ STA T4 + 0 
.l499:
2261 : a5 52 __ LDA T1 + 0 
2263 : c5 57 __ CMP T4 + 0 
2265 : b0 03 __ BCS $226a ; (main.s497 + 0)
2267 : 4c 70 2f JMP $2f70 ; (main.s500 + 0)
.s497:
226a : a9 00 __ LDA #$00
226c : 85 52 __ STA T1 + 0 
.l578:
226e : ad f4 45 LDA $45f4 ; (vdc_state + 9)
2271 : 85 57 __ STA T4 + 0 
2273 : a9 12 __ LDA #$12
2275 : 8d 00 d6 STA $d600 
2278 : ac f3 45 LDY $45f3 ; (vdc_state + 8)
.l7505:
227b : 2c 00 d6 BIT $d600 
227e : 10 fb __ BPL $227b ; (main.l7505 + 0)
.s588:
2280 : a5 57 __ LDA T4 + 0 
2282 : 8d 01 d6 STA $d601 
2285 : a9 13 __ LDA #$13
2287 : 8d 00 d6 STA $d600 
.l7507:
228a : 2c 00 d6 BIT $d600 
228d : 10 fb __ BPL $228a ; (main.l7507 + 0)
.s593:
228f : 8c 01 d6 STY $d601 
2292 : a9 1f __ LDA #$1f
2294 : 8d 00 d6 STA $d600 
.l7509:
2297 : 2c 00 d6 BIT $d600 
229a : 10 fb __ BPL $2297 ; (main.l7509 + 0)
.s597:
229c : a9 20 __ LDA #$20
229e : 8d 01 d6 STA $d601 
22a1 : a9 18 __ LDA #$18
22a3 : 8d 00 d6 STA $d600 
.l7511:
22a6 : 2c 00 d6 BIT $d600 
22a9 : 10 fb __ BPL $22a6 ; (main.l7511 + 0)
.s603:
22ab : ad 01 d6 LDA $d601 
22ae : 29 7f __ AND #$7f
22b0 : aa __ __ TAX
22b1 : a9 18 __ LDA #$18
22b3 : 8d 00 d6 STA $d600 
.l7513:
22b6 : 2c 00 d6 BIT $d600 
22b9 : 10 fb __ BPL $22b6 ; (main.l7513 + 0)
.s609:
22bb : 8e 01 d6 STX $d601 
22be : a9 1e __ LDA #$1e
22c0 : 8d 00 d6 STA $d600 
.l7515:
22c3 : 2c 00 d6 BIT $d600 
22c6 : 10 fb __ BPL $22c3 ; (main.l7515 + 0)
.s614:
22c8 : a9 4e __ LDA #$4e
22ca : 8d 01 d6 STA $d601 
22cd : ad f6 45 LDA $45f6 ; (vdc_state + 11)
22d0 : 85 45 __ STA T7 + 0 
22d2 : a9 12 __ LDA #$12
22d4 : 8d 00 d6 STA $d600 
22d7 : ae f5 45 LDX $45f5 ; (vdc_state + 10)
.l7517:
22da : 2c 00 d6 BIT $d600 
22dd : 10 fb __ BPL $22da ; (main.l7517 + 0)
.s621:
22df : a5 45 __ LDA T7 + 0 
22e1 : 8d 01 d6 STA $d601 
22e4 : a9 13 __ LDA #$13
22e6 : 8d 00 d6 STA $d600 
.l7519:
22e9 : 2c 00 d6 BIT $d600 
22ec : 10 fb __ BPL $22e9 ; (main.l7519 + 0)
.s626:
22ee : 8e 01 d6 STX $d601 
22f1 : a9 1f __ LDA #$1f
22f3 : 8d 00 d6 STA $d600 
.l7521:
22f6 : 2c 00 d6 BIT $d600 
22f9 : 10 fb __ BPL $22f6 ; (main.l7521 + 0)
.s630:
22fb : a9 c5 __ LDA #$c5
22fd : 8d 01 d6 STA $d601 
2300 : a9 18 __ LDA #$18
2302 : 8d 00 d6 STA $d600 
.l7523:
2305 : 2c 00 d6 BIT $d600 
2308 : 10 fb __ BPL $2305 ; (main.l7523 + 0)
.s636:
230a : ad 01 d6 LDA $d601 
230d : 29 7f __ AND #$7f
230f : aa __ __ TAX
2310 : a9 18 __ LDA #$18
2312 : 8d 00 d6 STA $d600 
.l7525:
2315 : 2c 00 d6 BIT $d600 
2318 : 10 fb __ BPL $2315 ; (main.l7525 + 0)
.s642:
231a : 8e 01 d6 STX $d601 
231d : a9 1e __ LDA #$1e
231f : 8d 00 d6 STA $d600 
.l7527:
2322 : 2c 00 d6 BIT $d600 
2325 : 10 fb __ BPL $2322 ; (main.l7527 + 0)
.s647:
2327 : a9 4e __ LDA #$4e
2329 : 8d 01 d6 STA $d601 
232c : ad f2 45 LDA $45f2 ; (vdc_state + 7)
232f : 29 f0 __ AND #$f0
2331 : 09 45 __ ORA #$45
2333 : 8d f2 45 STA $45f2 ; (vdc_state + 7)
2336 : a2 00 __ LDX #$00
.l1470:
2338 : bd 85 40 LDA $4085,x 
233b : e8 __ __ INX
233c : 09 00 __ ORA #$00
233e : d0 f8 __ BNE $2338 ; (main.l1470 + 0)
.s1471:
2340 : 86 43 __ STX T5 + 0 
2342 : a9 12 __ LDA #$12
2344 : 8d 00 d6 STA $d600 
.l7530:
2347 : 2c 00 d6 BIT $d600 
234a : 10 fb __ BPL $2347 ; (main.l7530 + 0)
.s663:
234c : a5 57 __ LDA T4 + 0 
234e : 8d 01 d6 STA $d601 
2351 : a9 13 __ LDA #$13
2353 : 8d 00 d6 STA $d600 
.l7532:
2356 : 2c 00 d6 BIT $d600 
2359 : 10 fb __ BPL $2356 ; (main.l7532 + 0)
.s668:
235b : 8c 01 d6 STY $d601 
235e : a9 1f __ LDA #$1f
2360 : 8d 00 d6 STA $d600 
2363 : 8a __ __ TXA
2364 : f0 46 __ BEQ $23ac ; (main.s673 + 0)
.s1647:
2366 : a2 00 __ LDX #$00
.l671:
2368 : bd 84 40 LDA $4084,x 
236b : c9 20 __ CMP #$20
236d : b0 04 __ BCS $2373 ; (main.s677 + 0)
.s676:
236f : 09 80 __ ORA #$80
2371 : 90 2b __ BCC $239e ; (main.s1475 + 0)
.s677:
2373 : a8 __ __ TAY
2374 : c9 40 __ CMP #$40
2376 : 90 04 __ BCC $237c ; (main.s680 + 0)
.s682:
2378 : c9 60 __ CMP #$60
237a : 90 11 __ BCC $238d ; (main.s679 + 0)
.s680:
237c : c9 60 __ CMP #$60
237e : 90 05 __ BCC $2385 ; (main.s684 + 0)
.s683:
2380 : e9 20 __ SBC #$20
2382 : 4c 9e 23 JMP $239e ; (main.s1475 + 0)
.s684:
2385 : c9 a0 __ CMP #$a0
2387 : 90 0a __ BCC $2393 ; (main.s692 + 0)
.s694:
2389 : c9 c0 __ CMP #$c0
238b : b0 06 __ BCS $2393 ; (main.s692 + 0)
.s679:
238d : 38 __ __ SEC
238e : e9 40 __ SBC #$40
2390 : 4c 9e 23 JMP $239e ; (main.s1475 + 0)
.s692:
2393 : c9 c0 __ CMP #$c0
2395 : 90 08 __ BCC $239f ; (main.l7536 + 0)
.s698:
2397 : c9 ff __ CMP #$ff
2399 : b0 04 __ BCS $239f ; (main.l7536 + 0)
.s695:
239b : 38 __ __ SEC
239c : e9 80 __ SBC #$80
.s1475:
239e : a8 __ __ TAY
.l7536:
239f : 2c 00 d6 BIT $d600 
23a2 : 10 fb __ BPL $239f ; (main.l7536 + 0)
.s704:
23a4 : 8c 01 d6 STY $d601 
23a7 : e8 __ __ INX
23a8 : e4 43 __ CPX T5 + 0 
23aa : 90 bc __ BCC $2368 ; (main.l671 + 0)
.s673:
23ac : a9 12 __ LDA #$12
23ae : 8d 00 d6 STA $d600 
23b1 : a6 43 __ LDX T5 + 0 
23b3 : ca __ __ DEX
23b4 : 86 57 __ STX T4 + 0 
23b6 : ad f6 45 LDA $45f6 ; (vdc_state + 11)
23b9 : ac f5 45 LDY $45f5 ; (vdc_state + 10)
23bc : ae f2 45 LDX $45f2 ; (vdc_state + 7)
.l7539:
23bf : 2c 00 d6 BIT $d600 
23c2 : 10 fb __ BPL $23bf ; (main.l7539 + 0)
.s711:
23c4 : 8d 01 d6 STA $d601 
23c7 : a9 13 __ LDA #$13
23c9 : 8d 00 d6 STA $d600 
.l7541:
23cc : 2c 00 d6 BIT $d600 
23cf : 10 fb __ BPL $23cc ; (main.l7541 + 0)
.s716:
23d1 : 8c 01 d6 STY $d601 
23d4 : a9 1f __ LDA #$1f
23d6 : 8d 00 d6 STA $d600 
.l7543:
23d9 : 2c 00 d6 BIT $d600 
23dc : 10 fb __ BPL $23d9 ; (main.l7543 + 0)
.s720:
23de : 8e 01 d6 STX $d601 
23e1 : a9 18 __ LDA #$18
23e3 : 8d 00 d6 STA $d600 
.l7545:
23e6 : 2c 00 d6 BIT $d600 
23e9 : 10 fb __ BPL $23e6 ; (main.l7545 + 0)
.s726:
23eb : ad 01 d6 LDA $d601 
23ee : 29 7f __ AND #$7f
23f0 : a8 __ __ TAY
23f1 : a9 18 __ LDA #$18
23f3 : 8d 00 d6 STA $d600 
.l7547:
23f6 : 2c 00 d6 BIT $d600 
23f9 : 10 fb __ BPL $23f6 ; (main.l7547 + 0)
.s732:
23fb : 8c 01 d6 STY $d601 
23fe : a9 1e __ LDA #$1e
2400 : 8d 00 d6 STA $d600 
.l7549:
2403 : 2c 00 d6 BIT $d600 
2406 : 10 fb __ BPL $2403 ; (main.l7549 + 0)
.s737:
2408 : a5 57 __ LDA T4 + 0 
240a : 8d 01 d6 STA $d601 
240d : 8a __ __ TXA
240e : 29 b0 __ AND #$b0
2410 : 09 0d __ ORA #$0d
2412 : 8d f2 45 STA $45f2 ; (vdc_state + 7)
2415 : a9 01 __ LDA #$01
2417 : a0 02 __ LDY #$02
2419 : 91 23 __ STA (SP + 0),y 
241b : a9 46 __ LDA #$46
241d : c8 __ __ INY
241e : 91 23 __ STA (SP + 0),y 
2420 : a9 bb __ LDA #$bb
2422 : c8 __ __ INY
2423 : 91 23 __ STA (SP + 0),y 
2425 : a9 43 __ LDA #$43
2427 : c8 __ __ INY
2428 : 91 23 __ STA (SP + 0),y 
242a : ad eb 45 LDA $45eb ; (vdc_state + 0)
242d : c8 __ __ INY
242e : 91 23 __ STA (SP + 0),y 
2430 : a9 00 __ LDA #$00
2432 : c8 __ __ INY
2433 : 91 23 __ STA (SP + 0),y 
2435 : ad ee 45 LDA $45ee ; (vdc_state + 3)
2438 : 85 53 __ STA T0 + 0 
243a : c8 __ __ INY
243b : 91 23 __ STA (SP + 0),y 
243d : ad ef 45 LDA $45ef ; (vdc_state + 4)
2440 : 85 54 __ STA T0 + 1 
2442 : c8 __ __ INY
2443 : 91 23 __ STA (SP + 0),y 
2445 : ad f0 45 LDA $45f0 ; (vdc_state + 5)
2448 : c8 __ __ INY
2449 : 91 23 __ STA (SP + 0),y 
244b : ad f1 45 LDA $45f1 ; (vdc_state + 6)
244e : c8 __ __ INY
244f : 91 23 __ STA (SP + 0),y 
2451 : ad ec 45 LDA $45ec ; (vdc_state + 1)
2454 : d0 07 __ BNE $245d ; (main.s3520 + 0)
.s3521:
2456 : a9 43 __ LDA #$43
2458 : a2 fb __ LDX #$fb
245a : 4c 61 24 JMP $2461 ; (main.s3522 + 0)
.s3520:
245d : a9 43 __ LDA #$43
245f : a2 f7 __ LDX #$f7
.s3522:
2461 : 85 58 __ STA T4 + 1 
2463 : 8a __ __ TXA
2464 : a0 0c __ LDY #$0c
2466 : 91 23 __ STA (SP + 0),y 
2468 : a5 58 __ LDA T4 + 1 
246a : c8 __ __ INY
246b : 91 23 __ STA (SP + 0),y 
246d : 20 95 40 JSR $4095 ; (sprintf.s1000 + 0)
2470 : 06 53 __ ASL T0 + 0 
2472 : 26 54 __ ROL T0 + 1 
2474 : a9 00 __ LDA #$00
2476 : 85 57 __ STA T4 + 0 
2478 : ad 01 46 LDA $4601 ; (linebuffer + 0)
247b : f0 0c __ BEQ $2489 ; (main.s746 + 0)
.s745:
247d : a2 00 __ LDX #$00
.l1472:
247f : bd 02 46 LDA $4602,x ; (linebuffer + 1)
2482 : e8 __ __ INX
2483 : 09 00 __ ORA #$00
2485 : d0 f8 __ BNE $247f ; (main.l1472 + 0)
.s1473:
2487 : 86 57 __ STX T4 + 0 
.s746:
2489 : ad f3 45 LDA $45f3 ; (vdc_state + 8)
248c : 18 __ __ CLC
248d : 65 53 __ ADC T0 + 0 
248f : aa __ __ TAX
2490 : a9 12 __ LDA #$12
2492 : 8d 00 d6 STA $d600 
2495 : ad f4 45 LDA $45f4 ; (vdc_state + 9)
2498 : 65 54 __ ADC T0 + 1 
.l7554:
249a : 2c 00 d6 BIT $d600 
249d : 10 fb __ BPL $249a ; (main.l7554 + 0)
.s753:
249f : 8d 01 d6 STA $d601 
24a2 : a9 13 __ LDA #$13
24a4 : 8d 00 d6 STA $d600 
.l7556:
24a7 : 2c 00 d6 BIT $d600 
24aa : 10 fb __ BPL $24a7 ; (main.l7556 + 0)
.s758:
24ac : 8e 01 d6 STX $d601 
24af : a9 1f __ LDA #$1f
24b1 : 8d 00 d6 STA $d600 
24b4 : a5 57 __ LDA T4 + 0 
24b6 : f0 62 __ BEQ $251a ; (main.s763 + 0)
.s1636:
24b8 : a2 00 __ LDX #$00
.l761:
24ba : bd 01 46 LDA $4601,x ; (linebuffer + 0)
24bd : c9 20 __ CMP #$20
24bf : b0 05 __ BCS $24c6 ; (main.s767 + 0)
.s766:
24c1 : 69 80 __ ADC #$80
24c3 : 4c 0c 25 JMP $250c ; (main.s1476 + 0)
.s767:
24c6 : a8 __ __ TAY
24c7 : c9 40 __ CMP #$40
24c9 : 90 04 __ BCC $24cf ; (main.s770 + 0)
.s772:
24cb : c9 60 __ CMP #$60
24cd : 90 23 __ BCC $24f2 ; (main.s769 + 0)
.s770:
24cf : c9 60 __ CMP #$60
24d1 : 90 0a __ BCC $24dd ; (main.s774 + 0)
.s776:
24d3 : 09 00 __ ORA #$00
24d5 : 30 06 __ BMI $24dd ; (main.s774 + 0)
.s773:
24d7 : 38 __ __ SEC
24d8 : e9 20 __ SBC #$20
24da : 4c 0c 25 JMP $250c ; (main.s1476 + 0)
.s774:
24dd : c9 80 __ CMP #$80
24df : 90 09 __ BCC $24ea ; (main.s778 + 0)
.s780:
24e1 : c9 a0 __ CMP #$a0
24e3 : b0 05 __ BCS $24ea ; (main.s778 + 0)
.s777:
24e5 : 69 40 __ ADC #$40
24e7 : 4c 0c 25 JMP $250c ; (main.s1476 + 0)
.s778:
24ea : c9 a0 __ CMP #$a0
24ec : 90 0a __ BCC $24f8 ; (main.s782 + 0)
.s784:
24ee : c9 c0 __ CMP #$c0
24f0 : b0 06 __ BCS $24f8 ; (main.s782 + 0)
.s769:
24f2 : 38 __ __ SEC
24f3 : e9 40 __ SBC #$40
24f5 : 4c 0c 25 JMP $250c ; (main.s1476 + 0)
.s782:
24f8 : c9 c0 __ CMP #$c0
24fa : 90 0a __ BCC $2506 ; (main.s786 + 0)
.s788:
24fc : c9 ff __ CMP #$ff
24fe : b0 06 __ BCS $2506 ; (main.s786 + 0)
.s785:
2500 : 38 __ __ SEC
2501 : e9 80 __ SBC #$80
2503 : 4c 0c 25 JMP $250c ; (main.s1476 + 0)
.s786:
2506 : c9 ff __ CMP #$ff
2508 : d0 03 __ BNE $250d ; (main.l7560 + 0)
.s789:
250a : a9 5e __ LDA #$5e
.s1476:
250c : a8 __ __ TAY
.l7560:
250d : 2c 00 d6 BIT $d600 
2510 : 10 fb __ BPL $250d ; (main.l7560 + 0)
.s794:
2512 : 8c 01 d6 STY $d601 
2515 : e8 __ __ INX
2516 : e4 57 __ CPX T4 + 0 
2518 : 90 a0 __ BCC $24ba ; (main.l761 + 0)
.s763:
251a : a9 12 __ LDA #$12
251c : 8d 00 d6 STA $d600 
251f : c6 57 __ DEC T4 + 0 
2521 : 18 __ __ CLC
2522 : a5 53 __ LDA T0 + 0 
2524 : 6d f5 45 ADC $45f5 ; (vdc_state + 10)
2527 : a8 __ __ TAY
2528 : a5 54 __ LDA T0 + 1 
252a : 6d f6 45 ADC $45f6 ; (vdc_state + 11)
252d : ae f2 45 LDX $45f2 ; (vdc_state + 7)
.l7563:
2530 : 2c 00 d6 BIT $d600 
2533 : 10 fb __ BPL $2530 ; (main.l7563 + 0)
.s801:
2535 : 8d 01 d6 STA $d601 
2538 : a9 13 __ LDA #$13
253a : 8d 00 d6 STA $d600 
.l7565:
253d : 2c 00 d6 BIT $d600 
2540 : 10 fb __ BPL $253d ; (main.l7565 + 0)
.s806:
2542 : 8c 01 d6 STY $d601 
2545 : a9 1f __ LDA #$1f
2547 : 8d 00 d6 STA $d600 
.l7567:
254a : 2c 00 d6 BIT $d600 
254d : 10 fb __ BPL $254a ; (main.l7567 + 0)
.s810:
254f : 8e 01 d6 STX $d601 
2552 : a9 18 __ LDA #$18
2554 : 8d 00 d6 STA $d600 
.l7569:
2557 : 2c 00 d6 BIT $d600 
255a : 10 fb __ BPL $2557 ; (main.l7569 + 0)
.s816:
255c : ad 01 d6 LDA $d601 
255f : 29 7f __ AND #$7f
2561 : aa __ __ TAX
2562 : a9 18 __ LDA #$18
2564 : 8d 00 d6 STA $d600 
.l7571:
2567 : 2c 00 d6 BIT $d600 
256a : 10 fb __ BPL $2567 ; (main.l7571 + 0)
.s822:
256c : 8e 01 d6 STX $d601 
256f : a9 1e __ LDA #$1e
2571 : 8d 00 d6 STA $d600 
.l7573:
2574 : 2c 00 d6 BIT $d600 
2577 : 10 fb __ BPL $2574 ; (main.l7573 + 0)
.s827:
2579 : a5 57 __ LDA T4 + 0 
257b : 8d 01 d6 STA $d601 
257e : ad ee 45 LDA $45ee ; (vdc_state + 3)
2581 : 0a __ __ ASL
2582 : aa __ __ TAX
2583 : a9 12 __ LDA #$12
2585 : 8d 00 d6 STA $d600 
2588 : ad ef 45 LDA $45ef ; (vdc_state + 4)
258b : 2a __ __ ROL
258c : a8 __ __ TAY
258d : 8a __ __ TXA
258e : 18 __ __ CLC
258f : 6d ee 45 ADC $45ee ; (vdc_state + 3)
2592 : aa __ __ TAX
2593 : 98 __ __ TYA
2594 : 6d ef 45 ADC $45ef ; (vdc_state + 4)
2597 : a8 __ __ TAY
2598 : 8a __ __ TXA
2599 : 18 __ __ CLC
259a : 69 04 __ ADC #$04
259c : 85 45 __ STA T7 + 0 
259e : 98 __ __ TYA
259f : 69 00 __ ADC #$00
25a1 : 85 46 __ STA T7 + 1 
25a3 : 18 __ __ CLC
25a4 : a5 45 __ LDA T7 + 0 
25a6 : 6d f3 45 ADC $45f3 ; (vdc_state + 8)
25a9 : 85 47 __ STA T8 + 0 
25ab : a5 46 __ LDA T7 + 1 
25ad : 6d f4 45 ADC $45f4 ; (vdc_state + 9)
.l7575:
25b0 : 2c 00 d6 BIT $d600 
25b3 : 10 fb __ BPL $25b0 ; (main.l7575 + 0)
.s837:
25b5 : 8d 01 d6 STA $d601 
25b8 : a9 13 __ LDA #$13
25ba : 8d 00 d6 STA $d600 
.l7577:
25bd : 2c 00 d6 BIT $d600 
25c0 : 10 fb __ BPL $25bd ; (main.l7577 + 0)
.s842:
25c2 : a5 47 __ LDA T8 + 0 
25c4 : 8d 01 d6 STA $d601 
25c7 : a9 1f __ LDA #$1f
25c9 : 8d 00 d6 STA $d600 
.l7579:
25cc : 2c 00 d6 BIT $d600 
25cf : 10 fb __ BPL $25cc ; (main.l7579 + 0)
.s846:
25d1 : a9 6c __ LDA #$6c
25d3 : 8d 01 d6 STA $d601 
25d6 : a9 12 __ LDA #$12
25d8 : 8d 00 d6 STA $d600 
25db : 18 __ __ CLC
25dc : a5 45 __ LDA T7 + 0 
25de : 6d f5 45 ADC $45f5 ; (vdc_state + 10)
25e1 : 85 45 __ STA T7 + 0 
25e3 : a5 46 __ LDA T7 + 1 
25e5 : 6d f6 45 ADC $45f6 ; (vdc_state + 11)
.l7581:
25e8 : 2c 00 d6 BIT $d600 
25eb : 10 fb __ BPL $25e8 ; (main.l7581 + 0)
.s853:
25ed : 8d 01 d6 STA $d601 
25f0 : a9 13 __ LDA #$13
25f2 : 8d 00 d6 STA $d600 
.l7583:
25f5 : 2c 00 d6 BIT $d600 
25f8 : 10 fb __ BPL $25f5 ; (main.l7583 + 0)
.s858:
25fa : a5 45 __ LDA T7 + 0 
25fc : 8d 01 d6 STA $d601 
25ff : a9 1f __ LDA #$1f
2601 : 8d 00 d6 STA $d600 
.l7585:
2604 : 2c 00 d6 BIT $d600 
2607 : 10 fb __ BPL $2604 ; (main.l7585 + 0)
.s862:
2609 : a9 09 __ LDA #$09
260b : 8d 01 d6 STA $d601 
260e : a9 12 __ LDA #$12
2610 : 8d 00 d6 STA $d600 
2613 : 8a __ __ TXA
2614 : 18 __ __ CLC
2615 : 69 05 __ ADC #$05
2617 : 85 45 __ STA T7 + 0 
2619 : 98 __ __ TYA
261a : 69 00 __ ADC #$00
261c : 85 46 __ STA T7 + 1 
261e : 18 __ __ CLC
261f : a5 45 __ LDA T7 + 0 
2621 : 6d f3 45 ADC $45f3 ; (vdc_state + 8)
2624 : 85 47 __ STA T8 + 0 
2626 : a5 46 __ LDA T7 + 1 
2628 : 6d f4 45 ADC $45f4 ; (vdc_state + 9)
.l7587:
262b : 2c 00 d6 BIT $d600 
262e : 10 fb __ BPL $262b ; (main.l7587 + 0)
.s872:
2630 : 8d 01 d6 STA $d601 
2633 : a9 13 __ LDA #$13
2635 : 8d 00 d6 STA $d600 
.l7589:
2638 : 2c 00 d6 BIT $d600 
263b : 10 fb __ BPL $2638 ; (main.l7589 + 0)
.s877:
263d : a5 47 __ LDA T8 + 0 
263f : 8d 01 d6 STA $d601 
2642 : a9 1f __ LDA #$1f
2644 : 8d 00 d6 STA $d600 
.l7591:
2647 : 2c 00 d6 BIT $d600 
264a : 10 fb __ BPL $2647 ; (main.l7591 + 0)
.s881:
264c : a9 62 __ LDA #$62
264e : 8d 01 d6 STA $d601 
2651 : a9 18 __ LDA #$18
2653 : 8d 00 d6 STA $d600 
.l7593:
2656 : 2c 00 d6 BIT $d600 
2659 : 10 fb __ BPL $2656 ; (main.l7593 + 0)
.s887:
265b : ad 01 d6 LDA $d601 
265e : 29 7f __ AND #$7f
2660 : 85 47 __ STA T8 + 0 
2662 : a9 18 __ LDA #$18
2664 : 8d 00 d6 STA $d600 
.l7595:
2667 : 2c 00 d6 BIT $d600 
266a : 10 fb __ BPL $2667 ; (main.l7595 + 0)
.s893:
266c : a5 47 __ LDA T8 + 0 
266e : 8d 01 d6 STA $d601 
2671 : a9 1e __ LDA #$1e
2673 : 8d 00 d6 STA $d600 
.l7597:
2676 : 2c 00 d6 BIT $d600 
2679 : 10 fb __ BPL $2676 ; (main.l7597 + 0)
.s898:
267b : a9 45 __ LDA #$45
267d : 8d 01 d6 STA $d601 
2680 : a9 12 __ LDA #$12
2682 : 8d 00 d6 STA $d600 
2685 : 18 __ __ CLC
2686 : a5 45 __ LDA T7 + 0 
2688 : 6d f5 45 ADC $45f5 ; (vdc_state + 10)
268b : 85 45 __ STA T7 + 0 
268d : a5 46 __ LDA T7 + 1 
268f : 6d f6 45 ADC $45f6 ; (vdc_state + 11)
.l7599:
2692 : 2c 00 d6 BIT $d600 
2695 : 10 fb __ BPL $2692 ; (main.l7599 + 0)
.s905:
2697 : 8d 01 d6 STA $d601 
269a : a9 13 __ LDA #$13
269c : 8d 00 d6 STA $d600 
.l7601:
269f : 2c 00 d6 BIT $d600 
26a2 : 10 fb __ BPL $269f ; (main.l7601 + 0)
.s910:
26a4 : a5 45 __ LDA T7 + 0 
26a6 : 8d 01 d6 STA $d601 
26a9 : a9 1f __ LDA #$1f
26ab : 8d 00 d6 STA $d600 
.l7603:
26ae : 2c 00 d6 BIT $d600 
26b1 : 10 fb __ BPL $26ae ; (main.l7603 + 0)
.s914:
26b3 : a9 09 __ LDA #$09
26b5 : 8d 01 d6 STA $d601 
26b8 : a9 18 __ LDA #$18
26ba : 8d 00 d6 STA $d600 
.l7605:
26bd : 2c 00 d6 BIT $d600 
26c0 : 10 fb __ BPL $26bd ; (main.l7605 + 0)
.s920:
26c2 : ad 01 d6 LDA $d601 
26c5 : 29 7f __ AND #$7f
26c7 : 85 45 __ STA T7 + 0 
26c9 : a9 18 __ LDA #$18
26cb : 8d 00 d6 STA $d600 
.l7607:
26ce : 2c 00 d6 BIT $d600 
26d1 : 10 fb __ BPL $26ce ; (main.l7607 + 0)
.s926:
26d3 : a5 45 __ LDA T7 + 0 
26d5 : 8d 01 d6 STA $d601 
26d8 : a9 1e __ LDA #$1e
26da : 8d 00 d6 STA $d600 
.l7609:
26dd : 2c 00 d6 BIT $d600 
26e0 : 10 fb __ BPL $26dd ; (main.l7609 + 0)
.s931:
26e2 : a9 45 __ LDA #$45
26e4 : 8d 01 d6 STA $d601 
26e7 : a9 12 __ LDA #$12
26e9 : 8d 00 d6 STA $d600 
26ec : 8a __ __ TXA
26ed : 18 __ __ CLC
26ee : 69 4b __ ADC #$4b
26f0 : aa __ __ TAX
26f1 : 90 01 __ BCC $26f4 ; (main.s1497 + 0)
.s1496:
26f3 : c8 __ __ INY
.s1497:
26f4 : 18 __ __ CLC
26f5 : 6d f3 45 ADC $45f3 ; (vdc_state + 8)
26f8 : 85 57 __ STA T4 + 0 
26fa : 98 __ __ TYA
26fb : 6d f4 45 ADC $45f4 ; (vdc_state + 9)
.l7611:
26fe : 2c 00 d6 BIT $d600 
2701 : 10 fb __ BPL $26fe ; (main.l7611 + 0)
.s941:
2703 : 8d 01 d6 STA $d601 
2706 : a9 13 __ LDA #$13
2708 : 8d 00 d6 STA $d600 
.l7613:
270b : 2c 00 d6 BIT $d600 
270e : 10 fb __ BPL $270b ; (main.l7613 + 0)
.s946:
2710 : a5 57 __ LDA T4 + 0 
2712 : 8d 01 d6 STA $d601 
2715 : a9 1f __ LDA #$1f
2717 : 8d 00 d6 STA $d600 
.l7615:
271a : 2c 00 d6 BIT $d600 
271d : 10 fb __ BPL $271a ; (main.l7615 + 0)
.s950:
271f : a9 7b __ LDA #$7b
2721 : 8d 01 d6 STA $d601 
2724 : a9 12 __ LDA #$12
2726 : 8d 00 d6 STA $d600 
2729 : 8a __ __ TXA
272a : 18 __ __ CLC
272b : 6d f5 45 ADC $45f5 ; (vdc_state + 10)
272e : aa __ __ TAX
272f : 98 __ __ TYA
2730 : 6d f6 45 ADC $45f6 ; (vdc_state + 11)
.l7617:
2733 : 2c 00 d6 BIT $d600 
2736 : 10 fb __ BPL $2733 ; (main.l7617 + 0)
.s957:
2738 : 8d 01 d6 STA $d601 
273b : a9 13 __ LDA #$13
273d : 8d 00 d6 STA $d600 
.l7619:
2740 : 2c 00 d6 BIT $d600 
2743 : 10 fb __ BPL $2740 ; (main.l7619 + 0)
.s962:
2745 : 8e 01 d6 STX $d601 
2748 : a9 1f __ LDA #$1f
274a : 8d 00 d6 STA $d600 
.l7621:
274d : 2c 00 d6 BIT $d600 
2750 : 10 fb __ BPL $274d ; (main.l7621 + 0)
.s966:
2752 : a9 09 __ LDA #$09
2754 : 8d 01 d6 STA $d601 
2757 : ad f0 45 LDA $45f0 ; (vdc_state + 5)
275a : 38 __ __ SEC
275b : e9 05 __ SBC #$05
275d : 85 53 __ STA T0 + 0 
275f : a9 04 __ LDA #$04
2761 : 85 59 __ STA T6 + 0 
.l968:
2763 : 18 __ __ CLC
2764 : a5 53 __ LDA T0 + 0 
2766 : 69 04 __ ADC #$04
2768 : 90 03 __ BCC $276d ; (main.s1192 + 0)
276a : 4c e5 2e JMP $2ee5 ; (main.s969 + 0)
.s1192:
276d : c5 59 __ CMP T6 + 0 
276f : 90 05 __ BCC $2776 ; (main.s967 + 0)
.s1498:
2771 : f0 03 __ BEQ $2776 ; (main.s967 + 0)
2773 : 4c e5 2e JMP $2ee5 ; (main.s969 + 0)
.s967:
2776 : ad f0 45 LDA $45f0 ; (vdc_state + 5)
2779 : 38 __ __ SEC
277a : e9 05 __ SBC #$05
277c : 85 53 __ STA T0 + 0 
277e : a9 04 __ LDA #$04
2780 : 85 59 __ STA T6 + 0 
.l1008:
2782 : 18 __ __ CLC
2783 : a5 53 __ LDA T0 + 0 
2785 : 69 04 __ ADC #$04
2787 : 85 45 __ STA T7 + 0 
2789 : ad ee 45 LDA $45ee ; (vdc_state + 3)
278c : 85 57 __ STA T4 + 0 
278e : ad ef 45 LDA $45ef ; (vdc_state + 4)
2791 : 85 58 __ STA T4 + 1 
2793 : ad f3 45 LDA $45f3 ; (vdc_state + 8)
2796 : 85 43 __ STA T5 + 0 
2798 : ad f4 45 LDA $45f4 ; (vdc_state + 9)
279b : 85 44 __ STA T5 + 1 
279d : 90 03 __ BCC $27a2 ; (main.s1178 + 0)
279f : 4c 5e 2e JMP $2e5e ; (main.s1009 + 0)
.s1178:
27a2 : a5 59 __ LDA T6 + 0 
27a4 : c5 45 __ CMP T7 + 0 
27a6 : b0 03 __ BCS $27ab ; (main.s1007 + 0)
27a8 : 4c 5e 2e JMP $2e5e ; (main.s1009 + 0)
.s1007:
27ab : a9 12 __ LDA #$12
27ad : 8d 00 d6 STA $d600 
27b0 : ad f0 45 LDA $45f0 ; (vdc_state + 5)
27b3 : e9 01 __ SBC #$01
27b5 : 85 53 __ STA T0 + 0 
27b7 : ad f1 45 LDA $45f1 ; (vdc_state + 6)
27ba : e9 00 __ SBC #$00
27bc : 85 54 __ STA T0 + 1 
27be : a5 57 __ LDA T4 + 0 
27c0 : 85 1b __ STA ACCU + 0 
27c2 : a5 58 __ LDA T4 + 1 
27c4 : 85 1c __ STA ACCU + 1 
27c6 : a5 53 __ LDA T0 + 0 
27c8 : 20 ff 43 JSR $43ff ; (mul16by8 + 0)
27cb : 18 __ __ CLC
27cc : a5 05 __ LDA WORK + 2 
27ce : 69 04 __ ADC #$04
27d0 : aa __ __ TAX
27d1 : a5 06 __ LDA WORK + 3 
27d3 : 69 00 __ ADC #$00
27d5 : a8 __ __ TAY
27d6 : 8a __ __ TXA
27d7 : 18 __ __ CLC
27d8 : 65 43 __ ADC T5 + 0 
27da : 85 49 __ STA T9 + 0 
27dc : 98 __ __ TYA
27dd : 65 44 __ ADC T5 + 1 
.l7649:
27df : 2c 00 d6 BIT $d600 
27e2 : 10 fb __ BPL $27df ; (main.l7649 + 0)
.s1056:
27e4 : 8d 01 d6 STA $d601 
27e7 : a9 13 __ LDA #$13
27e9 : 8d 00 d6 STA $d600 
.l7651:
27ec : 2c 00 d6 BIT $d600 
27ef : 10 fb __ BPL $27ec ; (main.l7651 + 0)
.s1061:
27f1 : a5 49 __ LDA T9 + 0 
27f3 : 8d 01 d6 STA $d601 
27f6 : a9 1f __ LDA #$1f
27f8 : 8d 00 d6 STA $d600 
.l7653:
27fb : 2c 00 d6 BIT $d600 
27fe : 10 fb __ BPL $27fb ; (main.l7653 + 0)
.s1065:
2800 : a9 7c __ LDA #$7c
2802 : 8d 01 d6 STA $d601 
2805 : a9 12 __ LDA #$12
2807 : 8d 00 d6 STA $d600 
280a : 8a __ __ TXA
280b : 18 __ __ CLC
280c : 6d f5 45 ADC $45f5 ; (vdc_state + 10)
280f : aa __ __ TAX
2810 : 98 __ __ TYA
2811 : 6d f6 45 ADC $45f6 ; (vdc_state + 11)
.l7655:
2814 : 2c 00 d6 BIT $d600 
2817 : 10 fb __ BPL $2814 ; (main.l7655 + 0)
.s1072:
2819 : 8d 01 d6 STA $d601 
281c : a9 13 __ LDA #$13
281e : 8d 00 d6 STA $d600 
.l7657:
2821 : 2c 00 d6 BIT $d600 
2824 : 10 fb __ BPL $2821 ; (main.l7657 + 0)
.s1077:
2826 : 8e 01 d6 STX $d601 
2829 : a9 1f __ LDA #$1f
282b : 8d 00 d6 STA $d600 
.l7659:
282e : 2c 00 d6 BIT $d600 
2831 : 10 fb __ BPL $282e ; (main.l7659 + 0)
.s1081:
2833 : a9 09 __ LDA #$09
2835 : 8d 01 d6 STA $d601 
2838 : a9 12 __ LDA #$12
283a : 8d 00 d6 STA $d600 
283d : 18 __ __ CLC
283e : a5 05 __ LDA WORK + 2 
2840 : 69 05 __ ADC #$05
2842 : aa __ __ TAX
2843 : a5 06 __ LDA WORK + 3 
2845 : 69 00 __ ADC #$00
2847 : a8 __ __ TAY
2848 : 8a __ __ TXA
2849 : 18 __ __ CLC
284a : 65 43 __ ADC T5 + 0 
284c : 85 4c __ STA T11 + 0 
284e : 98 __ __ TYA
284f : 65 44 __ ADC T5 + 1 
.l7661:
2851 : 2c 00 d6 BIT $d600 
2854 : 10 fb __ BPL $2851 ; (main.l7661 + 0)
.s1091:
2856 : 8d 01 d6 STA $d601 
2859 : a9 13 __ LDA #$13
285b : 8d 00 d6 STA $d600 
.l7663:
285e : 2c 00 d6 BIT $d600 
2861 : 10 fb __ BPL $285e ; (main.l7663 + 0)
.s1096:
2863 : a5 4c __ LDA T11 + 0 
2865 : 8d 01 d6 STA $d601 
2868 : a9 1f __ LDA #$1f
286a : 8d 00 d6 STA $d600 
.l7665:
286d : 2c 00 d6 BIT $d600 
2870 : 10 fb __ BPL $286d ; (main.l7665 + 0)
.s1100:
2872 : a9 e2 __ LDA #$e2
2874 : 8d 01 d6 STA $d601 
2877 : a9 18 __ LDA #$18
2879 : 8d 00 d6 STA $d600 
.l7667:
287c : 2c 00 d6 BIT $d600 
287f : 10 fb __ BPL $287c ; (main.l7667 + 0)
.s1106:
2881 : ad 01 d6 LDA $d601 
2884 : 29 7f __ AND #$7f
2886 : 85 4c __ STA T11 + 0 
2888 : a9 18 __ LDA #$18
288a : 8d 00 d6 STA $d600 
.l7669:
288d : 2c 00 d6 BIT $d600 
2890 : 10 fb __ BPL $288d ; (main.l7669 + 0)
.s1112:
2892 : a5 4c __ LDA T11 + 0 
2894 : 8d 01 d6 STA $d601 
2897 : a9 1e __ LDA #$1e
2899 : 8d 00 d6 STA $d600 
.l7671:
289c : 2c 00 d6 BIT $d600 
289f : 10 fb __ BPL $289c ; (main.l7671 + 0)
.s1117:
28a1 : a9 45 __ LDA #$45
28a3 : 8d 01 d6 STA $d601 
28a6 : a9 12 __ LDA #$12
28a8 : 8d 00 d6 STA $d600 
28ab : 8a __ __ TXA
28ac : 18 __ __ CLC
28ad : 6d f5 45 ADC $45f5 ; (vdc_state + 10)
28b0 : aa __ __ TAX
28b1 : 98 __ __ TYA
28b2 : 6d f6 45 ADC $45f6 ; (vdc_state + 11)
.l7673:
28b5 : 2c 00 d6 BIT $d600 
28b8 : 10 fb __ BPL $28b5 ; (main.l7673 + 0)
.s1124:
28ba : 8d 01 d6 STA $d601 
28bd : a9 13 __ LDA #$13
28bf : 8d 00 d6 STA $d600 
.l7675:
28c2 : 2c 00 d6 BIT $d600 
28c5 : 10 fb __ BPL $28c2 ; (main.l7675 + 0)
.s1129:
28c7 : 8e 01 d6 STX $d601 
28ca : a9 1f __ LDA #$1f
28cc : 8d 00 d6 STA $d600 
.l7677:
28cf : 2c 00 d6 BIT $d600 
28d2 : 10 fb __ BPL $28cf ; (main.l7677 + 0)
.s1133:
28d4 : a9 09 __ LDA #$09
28d6 : 8d 01 d6 STA $d601 
28d9 : a9 18 __ LDA #$18
28db : 8d 00 d6 STA $d600 
.l7679:
28de : 2c 00 d6 BIT $d600 
28e1 : 10 fb __ BPL $28de ; (main.l7679 + 0)
.s1139:
28e3 : ad 01 d6 LDA $d601 
28e6 : 29 7f __ AND #$7f
28e8 : aa __ __ TAX
28e9 : a9 18 __ LDA #$18
28eb : 8d 00 d6 STA $d600 
.l7681:
28ee : 2c 00 d6 BIT $d600 
28f1 : 10 fb __ BPL $28ee ; (main.l7681 + 0)
.s1145:
28f3 : 8e 01 d6 STX $d601 
28f6 : a9 1e __ LDA #$1e
28f8 : 8d 00 d6 STA $d600 
.l7683:
28fb : 2c 00 d6 BIT $d600 
28fe : 10 fb __ BPL $28fb ; (main.l7683 + 0)
.s1150:
2900 : a9 45 __ LDA #$45
2902 : 8d 01 d6 STA $d601 
2905 : a9 12 __ LDA #$12
2907 : 8d 00 d6 STA $d600 
290a : 18 __ __ CLC
290b : a5 05 __ LDA WORK + 2 
290d : 69 4b __ ADC #$4b
290f : aa __ __ TAX
2910 : a5 06 __ LDA WORK + 3 
2912 : 69 00 __ ADC #$00
2914 : a8 __ __ TAY
2915 : 8a __ __ TXA
2916 : 18 __ __ CLC
2917 : 65 43 __ ADC T5 + 0 
2919 : 85 47 __ STA T8 + 0 
291b : 98 __ __ TYA
291c : 65 44 __ ADC T5 + 1 
.l7685:
291e : 2c 00 d6 BIT $d600 
2921 : 10 fb __ BPL $291e ; (main.l7685 + 0)
.s1160:
2923 : 8d 01 d6 STA $d601 
2926 : a9 13 __ LDA #$13
2928 : 8d 00 d6 STA $d600 
.l7687:
292b : 2c 00 d6 BIT $d600 
292e : 10 fb __ BPL $292b ; (main.l7687 + 0)
.s1165:
2930 : a5 47 __ LDA T8 + 0 
2932 : 8d 01 d6 STA $d601 
2935 : a9 1f __ LDA #$1f
2937 : 8d 00 d6 STA $d600 
.l7689:
293a : 2c 00 d6 BIT $d600 
293d : 10 fb __ BPL $293a ; (main.l7689 + 0)
.s1169:
293f : a9 7e __ LDA #$7e
2941 : 8d 01 d6 STA $d601 
2944 : a9 12 __ LDA #$12
2946 : 8d 00 d6 STA $d600 
2949 : 8a __ __ TXA
294a : 18 __ __ CLC
294b : 6d f5 45 ADC $45f5 ; (vdc_state + 10)
294e : aa __ __ TAX
294f : 98 __ __ TYA
2950 : 6d f6 45 ADC $45f6 ; (vdc_state + 11)
.l7691:
2953 : 2c 00 d6 BIT $d600 
2956 : 10 fb __ BPL $2953 ; (main.l7691 + 0)
.s1176:
2958 : 8d 01 d6 STA $d601 
295b : a9 13 __ LDA #$13
295d : 8d 00 d6 STA $d600 
.l7693:
2960 : 2c 00 d6 BIT $d600 
2963 : 10 fb __ BPL $2960 ; (main.l7693 + 0)
.s1181:
2965 : 8e 01 d6 STX $d601 
2968 : a9 1f __ LDA #$1f
296a : 8d 00 d6 STA $d600 
.l7695:
296d : 2c 00 d6 BIT $d600 
2970 : 10 fb __ BPL $296d ; (main.l7695 + 0)
.s1185:
2972 : a9 09 __ LDA #$09
2974 : 8d 01 d6 STA $d601 
2977 : a5 54 __ LDA T0 + 1 
2979 : d0 06 __ BNE $2981 ; (main.s1578 + 0)
.s1117:
297b : a9 04 __ LDA #$04
297d : c5 53 __ CMP T0 + 0 
297f : b0 0f __ BCS $2990 ; (main.s1189 + 0)
.s1578:
2981 : a5 57 __ LDA T4 + 0 
2983 : 85 53 __ STA T0 + 0 
2985 : a5 58 __ LDA T4 + 1 
2987 : 85 54 __ STA T0 + 1 
2989 : a9 04 __ LDA #$04
298b : 85 59 __ STA T6 + 0 
298d : 4c 91 2d JMP $2d91 ; (main.l1187 + 0)
.s1189:
2990 : ad f0 45 LDA $45f0 ; (vdc_state + 5)
2993 : e9 05 __ SBC #$05
2995 : 85 53 __ STA T0 + 0 
2997 : ad f1 45 LDA $45f1 ; (vdc_state + 6)
299a : e9 00 __ SBC #$00
299c : 05 53 __ ORA T0 + 0 
299e : f0 03 __ BEQ $29a3 ; (main.s574 + 0)
29a0 : 4c e1 2a JMP $2ae1 ; (main.s1570 + 0)
.s574:
29a3 : e6 52 __ INC T1 + 0 
29a5 : a5 52 __ LDA T1 + 0 
29a7 : c9 02 __ CMP #$02
29a9 : b0 0f __ BCS $29ba ; (main.s575 + 0)
.s573:
29ab : 09 00 __ ORA #$00
29ad : d0 03 __ BNE $29b2 ; (main.s576 + 0)
29af : 4c 6e 22 JMP $226e ; (main.l578 + 0)
.s576:
29b2 : 85 16 __ STA P9 
29b4 : 20 6a 3b JSR $3b6a ; (vdc_set_mode.s1000 + 0)
29b7 : 4c 6e 22 JMP $226e ; (main.l578 + 0)
.s575:
29ba : a9 00 __ LDA #$00
29bc : 85 52 __ STA T1 + 0 
29be : 8d 30 d0 STA $d030 
29c1 : 85 16 __ STA P9 
29c3 : ad 11 d0 LDA $d011 
29c6 : 29 7f __ AND #$7f
29c8 : 09 10 __ ORA #$10
29ca : 8d 11 d0 STA $d011 
29cd : 20 6a 3b JSR $3b6a ; (vdc_set_mode.s1000 + 0)
29d0 : ad ee 45 LDA $45ee ; (vdc_state + 3)
29d3 : 85 53 __ STA T0 + 0 
29d5 : ad f0 45 LDA $45f0 ; (vdc_state + 5)
29d8 : 85 57 __ STA T4 + 0 
.l1406:
29da : a5 52 __ LDA T1 + 0 
29dc : c5 57 __ CMP T4 + 0 
29de : 90 21 __ BCC $2a01 ; (main.s1407 + 0)
.s1404:
29e0 : a9 04 __ LDA #$04
29e2 : 8d 06 d5 STA $d506 
29e5 : a9 00 __ LDA #$00
29e7 : 85 1b __ STA ACCU + 0 
29e9 : 85 1c __ STA ACCU + 1 
.s1001:
29eb : 18 __ __ CLC
29ec : a5 23 __ LDA SP + 0 
29ee : 69 0e __ ADC #$0e
29f0 : 85 23 __ STA SP + 0 
29f2 : 90 02 __ BCC $29f6 ; (main.s1001 + 11)
29f4 : e6 24 __ INC SP + 1 
29f6 : a2 06 __ LDX #$06
29f8 : bd 45 bf LDA $bf45,x ; (main@stack + 0)
29fb : 95 53 __ STA T0 + 0,x 
29fd : ca __ __ DEX
29fe : 10 f8 __ BPL $29f8 ; (main.s1001 + 13)
2a00 : 60 __ __ RTS
.s1407:
2a01 : ad ee 45 LDA $45ee ; (vdc_state + 3)
2a04 : 85 1b __ STA ACCU + 0 
2a06 : ad ef 45 LDA $45ef ; (vdc_state + 4)
2a09 : 85 1c __ STA ACCU + 1 
2a0b : ad f2 45 LDA $45f2 ; (vdc_state + 7)
2a0e : 85 55 __ STA T2 + 0 
2a10 : a9 12 __ LDA #$12
2a12 : 8d 00 d6 STA $d600 
2a15 : a6 53 __ LDX T0 + 0 
2a17 : ca __ __ DEX
2a18 : 86 47 __ STX T8 + 0 
2a1a : a5 52 __ LDA T1 + 0 
2a1c : 20 ff 43 JSR $43ff ; (mul16by8 + 0)
2a1f : 18 __ __ CLC
2a20 : a5 05 __ LDA WORK + 2 
2a22 : 6d f3 45 ADC $45f3 ; (vdc_state + 8)
2a25 : aa __ __ TAX
2a26 : a5 06 __ LDA WORK + 3 
2a28 : 6d f4 45 ADC $45f4 ; (vdc_state + 9)
.l7772:
2a2b : 2c 00 d6 BIT $d600 
2a2e : 10 fb __ BPL $2a2b ; (main.l7772 + 0)
.s1419:
2a30 : 8d 01 d6 STA $d601 
2a33 : a9 13 __ LDA #$13
2a35 : 8d 00 d6 STA $d600 
.l7774:
2a38 : 2c 00 d6 BIT $d600 
2a3b : 10 fb __ BPL $2a38 ; (main.l7774 + 0)
.s1424:
2a3d : 8e 01 d6 STX $d601 
2a40 : a9 1f __ LDA #$1f
2a42 : 8d 00 d6 STA $d600 
.l7776:
2a45 : 2c 00 d6 BIT $d600 
2a48 : 10 fb __ BPL $2a45 ; (main.l7776 + 0)
.s1428:
2a4a : a9 20 __ LDA #$20
2a4c : 8d 01 d6 STA $d601 
2a4f : a9 18 __ LDA #$18
2a51 : 8d 00 d6 STA $d600 
.l7778:
2a54 : 2c 00 d6 BIT $d600 
2a57 : 10 fb __ BPL $2a54 ; (main.l7778 + 0)
.s1434:
2a59 : ad 01 d6 LDA $d601 
2a5c : 29 7f __ AND #$7f
2a5e : aa __ __ TAX
2a5f : a9 18 __ LDA #$18
2a61 : 8d 00 d6 STA $d600 
.l7780:
2a64 : 2c 00 d6 BIT $d600 
2a67 : 10 fb __ BPL $2a64 ; (main.l7780 + 0)
.s1440:
2a69 : 8e 01 d6 STX $d601 
2a6c : a9 1e __ LDA #$1e
2a6e : 8d 00 d6 STA $d600 
.l7782:
2a71 : 2c 00 d6 BIT $d600 
2a74 : 10 fb __ BPL $2a71 ; (main.l7782 + 0)
.s1445:
2a76 : a5 47 __ LDA T8 + 0 
2a78 : 8d 01 d6 STA $d601 
2a7b : ad f5 45 LDA $45f5 ; (vdc_state + 10)
2a7e : 18 __ __ CLC
2a7f : 65 05 __ ADC WORK + 2 
2a81 : aa __ __ TAX
2a82 : a9 12 __ LDA #$12
2a84 : 8d 00 d6 STA $d600 
2a87 : ad f6 45 LDA $45f6 ; (vdc_state + 11)
2a8a : 65 06 __ ADC WORK + 3 
.l7784:
2a8c : 2c 00 d6 BIT $d600 
2a8f : 10 fb __ BPL $2a8c ; (main.l7784 + 0)
.s1452:
2a91 : 8d 01 d6 STA $d601 
2a94 : a9 13 __ LDA #$13
2a96 : 8d 00 d6 STA $d600 
.l7786:
2a99 : 2c 00 d6 BIT $d600 
2a9c : 10 fb __ BPL $2a99 ; (main.l7786 + 0)
.s1457:
2a9e : 8e 01 d6 STX $d601 
2aa1 : a9 1f __ LDA #$1f
2aa3 : 8d 00 d6 STA $d600 
.l7788:
2aa6 : 2c 00 d6 BIT $d600 
2aa9 : 10 fb __ BPL $2aa6 ; (main.l7788 + 0)
.s1461:
2aab : a5 55 __ LDA T2 + 0 
2aad : 8d 01 d6 STA $d601 
2ab0 : a9 18 __ LDA #$18
2ab2 : 8d 00 d6 STA $d600 
.l7790:
2ab5 : 2c 00 d6 BIT $d600 
2ab8 : 10 fb __ BPL $2ab5 ; (main.l7790 + 0)
.s1467:
2aba : ad 01 d6 LDA $d601 
2abd : 29 7f __ AND #$7f
2abf : aa __ __ TAX
2ac0 : a9 18 __ LDA #$18
2ac2 : 8d 00 d6 STA $d600 
.l7792:
2ac5 : 2c 00 d6 BIT $d600 
2ac8 : 10 fb __ BPL $2ac5 ; (main.l7792 + 0)
.s1473:
2aca : 8e 01 d6 STX $d601 
2acd : a9 1e __ LDA #$1e
2acf : 8d 00 d6 STA $d600 
.l7794:
2ad2 : 2c 00 d6 BIT $d600 
2ad5 : 10 fb __ BPL $2ad2 ; (main.l7794 + 0)
.s1478:
2ad7 : a5 47 __ LDA T8 + 0 
2ad9 : 8d 01 d6 STA $d601 
2adc : e6 52 __ INC T1 + 0 
2ade : 4c da 29 JMP $29da ; (main.l1406 + 0)
.s1570:
2ae1 : ad ee 45 LDA $45ee ; (vdc_state + 3)
2ae4 : 0a __ __ ASL
2ae5 : 85 53 __ STA T0 + 0 
2ae7 : ad ef 45 LDA $45ef ; (vdc_state + 4)
2aea : 2a __ __ ROL
2aeb : 06 53 __ ASL T0 + 0 
2aed : 2a __ __ ROL
2aee : aa __ __ TAX
2aef : 18 __ __ CLC
2af0 : a5 53 __ LDA T0 + 0 
2af2 : 69 05 __ ADC #$05
2af4 : 85 53 __ STA T0 + 0 
2af6 : 90 01 __ BCC $2af9 ; (main.s1500 + 0)
.s1499:
2af8 : e8 __ __ INX
.s1500:
2af9 : 86 54 __ STX T0 + 1 
2afb : a9 00 __ LDA #$00
2afd : 85 59 __ STA T6 + 0 
.l1235:
2aff : 20 28 3a JSR $3a28 ; (getch.s0 + 0)
2b02 : ad f0 45 LDA $45f0 ; (vdc_state + 5)
2b05 : 38 __ __ SEC
2b06 : e9 06 __ SBC #$06
2b08 : f0 23 __ BEQ $2b2d ; (main.s1238 + 0)
.s1569:
2b0a : aa __ __ TAX
2b0b : ad f3 45 LDA $45f3 ; (vdc_state + 8)
2b0e : 18 __ __ CLC
2b0f : 65 53 __ ADC T0 + 0 
2b11 : 85 57 __ STA T4 + 0 
2b13 : a8 __ __ TAY
2b14 : ad f4 45 LDA $45f4 ; (vdc_state + 9)
2b17 : 65 54 __ ADC T0 + 1 
2b19 : 85 58 __ STA T4 + 1 
2b1b : ad ee 45 LDA $45ee ; (vdc_state + 3)
2b1e : 18 __ __ CLC
2b1f : 65 57 __ ADC T4 + 0 
2b21 : 85 43 __ STA T5 + 0 
2b23 : ad ef 45 LDA $45ef ; (vdc_state + 4)
2b26 : 65 58 __ ADC T4 + 1 
2b28 : 85 44 __ STA T5 + 1 
2b2a : 4c f9 2c JMP $2cf9 ; (main.l1240 + 0)
.s1238:
2b2d : ad f0 45 LDA $45f0 ; (vdc_state + 5)
2b30 : 38 __ __ SEC
2b31 : e9 06 __ SBC #$06
2b33 : f0 03 __ BEQ $2b38 ; (main.s1284 + 0)
2b35 : 4c 41 2c JMP $2c41 ; (main.s1561 + 0)
.s1284:
2b38 : ad ee 45 LDA $45ee ; (vdc_state + 3)
2b3b : 85 1b __ STA ACCU + 0 
2b3d : ad ef 45 LDA $45ef ; (vdc_state + 4)
2b40 : 85 1c __ STA ACCU + 1 
2b42 : ad f1 45 LDA $45f1 ; (vdc_state + 6)
2b45 : 85 44 __ STA T5 + 1 
2b47 : a9 12 __ LDA #$12
2b49 : 8d 00 d6 STA $d600 
2b4c : ad f0 45 LDA $45f0 ; (vdc_state + 5)
2b4f : 85 43 __ STA T5 + 0 
2b51 : 38 __ __ SEC
2b52 : e9 02 __ SBC #$02
2b54 : 20 ff 43 JSR $43ff ; (mul16by8 + 0)
2b57 : 18 __ __ CLC
2b58 : a5 05 __ LDA WORK + 2 
2b5a : 69 05 __ ADC #$05
2b5c : 85 57 __ STA T4 + 0 
2b5e : a5 06 __ LDA WORK + 3 
2b60 : 69 00 __ ADC #$00
2b62 : 85 58 __ STA T4 + 1 
2b64 : 18 __ __ CLC
2b65 : a5 57 __ LDA T4 + 0 
2b67 : 6d f3 45 ADC $45f3 ; (vdc_state + 8)
2b6a : aa __ __ TAX
2b6b : a5 58 __ LDA T4 + 1 
2b6d : 6d f4 45 ADC $45f4 ; (vdc_state + 9)
.l7746:
2b70 : 2c 00 d6 BIT $d600 
2b73 : 10 fb __ BPL $2b70 ; (main.l7746 + 0)
.s1339:
2b75 : 8d 01 d6 STA $d601 
2b78 : a9 13 __ LDA #$13
2b7a : 8d 00 d6 STA $d600 
.l7748:
2b7d : 2c 00 d6 BIT $d600 
2b80 : 10 fb __ BPL $2b7d ; (main.l7748 + 0)
.s1344:
2b82 : 8e 01 d6 STX $d601 
2b85 : a9 1f __ LDA #$1f
2b87 : 8d 00 d6 STA $d600 
.l7750:
2b8a : 2c 00 d6 BIT $d600 
2b8d : 10 fb __ BPL $2b8a ; (main.l7750 + 0)
.s1348:
2b8f : a9 20 __ LDA #$20
2b91 : 8d 01 d6 STA $d601 
2b94 : a9 18 __ LDA #$18
2b96 : 8d 00 d6 STA $d600 
.l7752:
2b99 : 2c 00 d6 BIT $d600 
2b9c : 10 fb __ BPL $2b99 ; (main.l7752 + 0)
.s1354:
2b9e : ad 01 d6 LDA $d601 
2ba1 : 29 7f __ AND #$7f
2ba3 : aa __ __ TAX
2ba4 : a9 18 __ LDA #$18
2ba6 : 8d 00 d6 STA $d600 
.l7754:
2ba9 : 2c 00 d6 BIT $d600 
2bac : 10 fb __ BPL $2ba9 ; (main.l7754 + 0)
.s1360:
2bae : 8e 01 d6 STX $d601 
2bb1 : a9 1e __ LDA #$1e
2bb3 : 8d 00 d6 STA $d600 
.l7756:
2bb6 : 2c 00 d6 BIT $d600 
2bb9 : 10 fb __ BPL $2bb6 ; (main.l7756 + 0)
.s1365:
2bbb : a9 45 __ LDA #$45
2bbd : 8d 01 d6 STA $d601 
2bc0 : ad f5 45 LDA $45f5 ; (vdc_state + 10)
2bc3 : 18 __ __ CLC
2bc4 : 65 57 __ ADC T4 + 0 
2bc6 : aa __ __ TAX
2bc7 : a9 12 __ LDA #$12
2bc9 : 8d 00 d6 STA $d600 
2bcc : ad f6 45 LDA $45f6 ; (vdc_state + 11)
2bcf : 65 58 __ ADC T4 + 1 
.l7758:
2bd1 : 2c 00 d6 BIT $d600 
2bd4 : 10 fb __ BPL $2bd1 ; (main.l7758 + 0)
.s1372:
2bd6 : 8d 01 d6 STA $d601 
2bd9 : a9 13 __ LDA #$13
2bdb : 8d 00 d6 STA $d600 
.l7760:
2bde : 2c 00 d6 BIT $d600 
2be1 : 10 fb __ BPL $2bde ; (main.l7760 + 0)
.s1377:
2be3 : 8e 01 d6 STX $d601 
2be6 : a9 1f __ LDA #$1f
2be8 : 8d 00 d6 STA $d600 
.l7762:
2beb : 2c 00 d6 BIT $d600 
2bee : 10 fb __ BPL $2beb ; (main.l7762 + 0)
.s1381:
2bf0 : a9 0d __ LDA #$0d
2bf2 : 8d 01 d6 STA $d601 
2bf5 : a9 18 __ LDA #$18
2bf7 : 8d 00 d6 STA $d600 
.l7764:
2bfa : 2c 00 d6 BIT $d600 
2bfd : 10 fb __ BPL $2bfa ; (main.l7764 + 0)
.s1387:
2bff : ad 01 d6 LDA $d601 
2c02 : 29 7f __ AND #$7f
2c04 : aa __ __ TAX
2c05 : a9 18 __ LDA #$18
2c07 : 8d 00 d6 STA $d600 
.l7766:
2c0a : 2c 00 d6 BIT $d600 
2c0d : 10 fb __ BPL $2c0a ; (main.l7766 + 0)
.s1393:
2c0f : 8e 01 d6 STX $d601 
2c12 : a9 1e __ LDA #$1e
2c14 : 8d 00 d6 STA $d600 
.l7768:
2c17 : 2c 00 d6 BIT $d600 
2c1a : 10 fb __ BPL $2c17 ; (main.l7768 + 0)
.s1398:
2c1c : a9 45 __ LDA #$45
2c1e : 8d 01 d6 STA $d601 
2c21 : 38 __ __ SEC
2c22 : a5 43 __ LDA T5 + 0 
2c24 : e9 05 __ SBC #$05
2c26 : 85 57 __ STA T4 + 0 
2c28 : a5 44 __ LDA T5 + 1 
2c2a : e9 00 __ SBC #$00
2c2c : e6 59 __ INC T6 + 0 
2c2e : 09 00 __ ORA #$00
2c30 : f0 03 __ BEQ $2c35 ; (main.s1045 + 0)
2c32 : 4c ff 2a JMP $2aff ; (main.l1235 + 0)
.s1045:
2c35 : a5 59 __ LDA T6 + 0 
2c37 : c5 57 __ CMP T4 + 0 
2c39 : b0 03 __ BCS $2c3e ; (main.s1045 + 9)
2c3b : 4c ff 2a JMP $2aff ; (main.l1235 + 0)
2c3e : 4c a3 29 JMP $29a3 ; (main.s574 + 0)
.s1561:
2c41 : aa __ __ TAX
2c42 : ad f5 45 LDA $45f5 ; (vdc_state + 10)
2c45 : 18 __ __ CLC
2c46 : 65 53 __ ADC T0 + 0 
2c48 : 85 57 __ STA T4 + 0 
2c4a : a8 __ __ TAY
2c4b : ad f6 45 LDA $45f6 ; (vdc_state + 11)
2c4e : 65 54 __ ADC T0 + 1 
2c50 : 85 58 __ STA T4 + 1 
2c52 : ad ee 45 LDA $45ee ; (vdc_state + 3)
2c55 : 18 __ __ CLC
2c56 : 65 57 __ ADC T4 + 0 
2c58 : 85 43 __ STA T5 + 0 
2c5a : ad ef 45 LDA $45ef ; (vdc_state + 4)
2c5d : 65 58 __ ADC T4 + 1 
2c5f : 85 44 __ STA T5 + 1 
.l1286:
2c61 : a9 12 __ LDA #$12
2c63 : 8d 00 d6 STA $d600 
.l7731:
2c66 : 2c 00 d6 BIT $d600 
2c69 : 10 fb __ BPL $2c66 ; (main.l7731 + 0)
.s1295:
2c6b : a5 58 __ LDA T4 + 1 
2c6d : 8d 01 d6 STA $d601 
2c70 : a9 13 __ LDA #$13
2c72 : 8d 00 d6 STA $d600 
.l7733:
2c75 : 2c 00 d6 BIT $d600 
2c78 : 10 fb __ BPL $2c75 ; (main.l7733 + 0)
.s1300:
2c7a : 8c 01 d6 STY $d601 
2c7d : a9 1f __ LDA #$1f
2c7f : 8d 00 d6 STA $d600 
2c82 : a9 18 __ LDA #$18
2c84 : 8d 00 d6 STA $d600 
.l7735:
2c87 : 2c 00 d6 BIT $d600 
2c8a : 10 fb __ BPL $2c87 ; (main.l7735 + 0)
.s1307:
2c8c : ad 01 d6 LDA $d601 
2c8f : 09 80 __ ORA #$80
2c91 : 85 45 __ STA T7 + 0 
2c93 : a9 18 __ LDA #$18
2c95 : 8d 00 d6 STA $d600 
.l7737:
2c98 : 2c 00 d6 BIT $d600 
2c9b : 10 fb __ BPL $2c98 ; (main.l7737 + 0)
.s1313:
2c9d : a5 45 __ LDA T7 + 0 
2c9f : 8d 01 d6 STA $d601 
2ca2 : a9 20 __ LDA #$20
2ca4 : 8d 00 d6 STA $d600 
.l7739:
2ca7 : 2c 00 d6 BIT $d600 
2caa : 10 fb __ BPL $2ca7 ; (main.l7739 + 0)
.s1318:
2cac : a5 44 __ LDA T5 + 1 
2cae : 8d 01 d6 STA $d601 
2cb1 : a9 21 __ LDA #$21
2cb3 : 8d 00 d6 STA $d600 
.l7741:
2cb6 : 2c 00 d6 BIT $d600 
2cb9 : 10 fb __ BPL $2cb6 ; (main.l7741 + 0)
.s1323:
2cbb : a5 43 __ LDA T5 + 0 
2cbd : 8d 01 d6 STA $d601 
2cc0 : a9 1f __ LDA #$1f
2cc2 : 8d 00 d6 STA $d600 
2cc5 : a9 1e __ LDA #$1e
2cc7 : 8d 00 d6 STA $d600 
.l7743:
2cca : 2c 00 d6 BIT $d600 
2ccd : 10 fb __ BPL $2cca ; (main.l7743 + 0)
.s1329:
2ccf : a9 46 __ LDA #$46
2cd1 : 8d 01 d6 STA $d601 
2cd4 : ad ee 45 LDA $45ee ; (vdc_state + 3)
2cd7 : 18 __ __ CLC
2cd8 : 65 43 __ ADC T5 + 0 
2cda : 85 43 __ STA T5 + 0 
2cdc : ad ef 45 LDA $45ef ; (vdc_state + 4)
2cdf : 65 44 __ ADC T5 + 1 
2ce1 : 85 44 __ STA T5 + 1 
2ce3 : 98 __ __ TYA
2ce4 : 18 __ __ CLC
2ce5 : 6d ee 45 ADC $45ee ; (vdc_state + 3)
2ce8 : a8 __ __ TAY
2ce9 : a5 58 __ LDA T4 + 1 
2ceb : 6d ef 45 ADC $45ef ; (vdc_state + 4)
2cee : 85 58 __ STA T4 + 1 
2cf0 : ca __ __ DEX
2cf1 : f0 03 __ BEQ $2cf6 ; (main.s1329 + 39)
2cf3 : 4c 61 2c JMP $2c61 ; (main.l1286 + 0)
2cf6 : 4c 38 2b JMP $2b38 ; (main.s1284 + 0)
.l1240:
2cf9 : a9 12 __ LDA #$12
2cfb : 8d 00 d6 STA $d600 
.l7715:
2cfe : 2c 00 d6 BIT $d600 
2d01 : 10 fb __ BPL $2cfe ; (main.l7715 + 0)
.s1249:
2d03 : a5 58 __ LDA T4 + 1 
2d05 : 8d 01 d6 STA $d601 
2d08 : a9 13 __ LDA #$13
2d0a : 8d 00 d6 STA $d600 
.l7717:
2d0d : 2c 00 d6 BIT $d600 
2d10 : 10 fb __ BPL $2d0d ; (main.l7717 + 0)
.s1254:
2d12 : 8c 01 d6 STY $d601 
2d15 : a9 1f __ LDA #$1f
2d17 : 8d 00 d6 STA $d600 
2d1a : a9 18 __ LDA #$18
2d1c : 8d 00 d6 STA $d600 
.l7719:
2d1f : 2c 00 d6 BIT $d600 
2d22 : 10 fb __ BPL $2d1f ; (main.l7719 + 0)
.s1261:
2d24 : ad 01 d6 LDA $d601 
2d27 : 09 80 __ ORA #$80
2d29 : 85 45 __ STA T7 + 0 
2d2b : a9 18 __ LDA #$18
2d2d : 8d 00 d6 STA $d600 
.l7721:
2d30 : 2c 00 d6 BIT $d600 
2d33 : 10 fb __ BPL $2d30 ; (main.l7721 + 0)
.s1267:
2d35 : a5 45 __ LDA T7 + 0 
2d37 : 8d 01 d6 STA $d601 
2d3a : a9 20 __ LDA #$20
2d3c : 8d 00 d6 STA $d600 
.l7723:
2d3f : 2c 00 d6 BIT $d600 
2d42 : 10 fb __ BPL $2d3f ; (main.l7723 + 0)
.s1272:
2d44 : a5 44 __ LDA T5 + 1 
2d46 : 8d 01 d6 STA $d601 
2d49 : a9 21 __ LDA #$21
2d4b : 8d 00 d6 STA $d600 
.l7725:
2d4e : 2c 00 d6 BIT $d600 
2d51 : 10 fb __ BPL $2d4e ; (main.l7725 + 0)
.s1277:
2d53 : a5 43 __ LDA T5 + 0 
2d55 : 8d 01 d6 STA $d601 
2d58 : a9 1f __ LDA #$1f
2d5a : 8d 00 d6 STA $d600 
2d5d : a9 1e __ LDA #$1e
2d5f : 8d 00 d6 STA $d600 
.l7727:
2d62 : 2c 00 d6 BIT $d600 
2d65 : 10 fb __ BPL $2d62 ; (main.l7727 + 0)
.s1283:
2d67 : a9 46 __ LDA #$46
2d69 : 8d 01 d6 STA $d601 
2d6c : ad ee 45 LDA $45ee ; (vdc_state + 3)
2d6f : 18 __ __ CLC
2d70 : 65 43 __ ADC T5 + 0 
2d72 : 85 43 __ STA T5 + 0 
2d74 : ad ef 45 LDA $45ef ; (vdc_state + 4)
2d77 : 65 44 __ ADC T5 + 1 
2d79 : 85 44 __ STA T5 + 1 
2d7b : 98 __ __ TYA
2d7c : 18 __ __ CLC
2d7d : 6d ee 45 ADC $45ee ; (vdc_state + 3)
2d80 : a8 __ __ TAY
2d81 : a5 58 __ LDA T4 + 1 
2d83 : 6d ef 45 ADC $45ef ; (vdc_state + 4)
2d86 : 85 58 __ STA T4 + 1 
2d88 : ca __ __ DEX
2d89 : f0 03 __ BEQ $2d8e ; (main.s1283 + 39)
2d8b : 4c f9 2c JMP $2cf9 ; (main.l1240 + 0)
2d8e : 4c 2d 2b JMP $2b2d ; (main.s1238 + 0)
.l1187:
2d91 : a5 53 __ LDA T0 + 0 
2d93 : 85 1b __ STA ACCU + 0 
2d95 : a5 54 __ LDA T0 + 1 
2d97 : 85 1c __ STA ACCU + 1 
2d99 : a5 59 __ LDA T6 + 0 
2d9b : 20 ff 43 JSR $43ff ; (mul16by8 + 0)
2d9e : a5 05 __ LDA WORK + 2 
2da0 : 85 57 __ STA T4 + 0 
2da2 : a5 06 __ LDA WORK + 3 
2da4 : 85 58 __ STA T4 + 1 
2da6 : a6 56 __ LDX T3 + 0 
2da8 : a0 05 __ LDY #$05
.l1191:
2daa : 86 4c __ STX T11 + 0 
2dac : a9 12 __ LDA #$12
2dae : 8d 00 d6 STA $d600 
2db1 : a5 55 __ LDA T2 + 0 
2db3 : 85 50 __ STA T13 + 0 
2db5 : 98 __ __ TYA
2db6 : 18 __ __ CLC
2db7 : 65 57 __ ADC T4 + 0 
2db9 : 85 45 __ STA T7 + 0 
2dbb : a9 00 __ LDA #$00
2dbd : 65 58 __ ADC T4 + 1 
2dbf : 85 46 __ STA T7 + 1 
2dc1 : 18 __ __ CLC
2dc2 : a5 45 __ LDA T7 + 0 
2dc4 : 65 43 __ ADC T5 + 0 
2dc6 : 85 47 __ STA T8 + 0 
2dc8 : a5 46 __ LDA T7 + 1 
2dca : 65 44 __ ADC T5 + 1 
2dcc : e6 55 __ INC T2 + 0 
2dce : e8 __ __ INX
.l7698:
2dcf : 2c 00 d6 BIT $d600 
2dd2 : 10 fb __ BPL $2dcf ; (main.l7698 + 0)
.s1203:
2dd4 : 8d 01 d6 STA $d601 
2dd7 : a9 13 __ LDA #$13
2dd9 : 8d 00 d6 STA $d600 
.l7700:
2ddc : 2c 00 d6 BIT $d600 
2ddf : 10 fb __ BPL $2ddc ; (main.l7700 + 0)
.s1208:
2de1 : a5 47 __ LDA T8 + 0 
2de3 : 8d 01 d6 STA $d601 
2de6 : a9 1f __ LDA #$1f
2de8 : 8d 00 d6 STA $d600 
.l7702:
2deb : 2c 00 d6 BIT $d600 
2dee : 10 fb __ BPL $2deb ; (main.l7702 + 0)
.s1212:
2df0 : a5 50 __ LDA T13 + 0 
2df2 : 8d 01 d6 STA $d601 
2df5 : ad f5 45 LDA $45f5 ; (vdc_state + 10)
2df8 : 18 __ __ CLC
2df9 : 65 45 __ ADC T7 + 0 
2dfb : 85 45 __ STA T7 + 0 
2dfd : a9 12 __ LDA #$12
2dff : 8d 00 d6 STA $d600 
2e02 : ad f6 45 LDA $45f6 ; (vdc_state + 11)
2e05 : 65 46 __ ADC T7 + 1 
.l7704:
2e07 : 2c 00 d6 BIT $d600 
2e0a : 10 fb __ BPL $2e07 ; (main.l7704 + 0)
.s1219:
2e0c : 8d 01 d6 STA $d601 
2e0f : a9 13 __ LDA #$13
2e11 : 8d 00 d6 STA $d600 
.l7706:
2e14 : 2c 00 d6 BIT $d600 
2e17 : 10 fb __ BPL $2e14 ; (main.l7706 + 0)
.s1224:
2e19 : a5 45 __ LDA T7 + 0 
2e1b : 8d 01 d6 STA $d601 
2e1e : a9 1f __ LDA #$1f
2e20 : 8d 00 d6 STA $d600 
.l7708:
2e23 : 2c 00 d6 BIT $d600 
2e26 : 10 fb __ BPL $2e23 ; (main.l7708 + 0)
.s1228:
2e28 : a5 4c __ LDA T11 + 0 
2e2a : 8d 01 d6 STA $d601 
2e2d : e0 10 __ CPX #$10
2e2f : 90 02 __ BCC $2e33 ; (main.s5147 + 0)
.s1229:
2e31 : a2 00 __ LDX #$00
.s5147:
2e33 : c8 __ __ INY
2e34 : c0 4b __ CPY #$4b
2e36 : b0 03 __ BCS $2e3b ; (main.s1188 + 0)
2e38 : 4c aa 2d JMP $2daa ; (main.l1191 + 0)
.s1188:
2e3b : 86 56 __ STX T3 + 0 
2e3d : ad f0 45 LDA $45f0 ; (vdc_state + 5)
2e40 : e9 01 __ SBC #$01
2e42 : 85 57 __ STA T4 + 0 
2e44 : ad f1 45 LDA $45f1 ; (vdc_state + 6)
2e47 : e9 00 __ SBC #$00
2e49 : e6 59 __ INC T6 + 0 
2e4b : 09 00 __ ORA #$00
2e4d : f0 03 __ BEQ $2e52 ; (main.s1099 + 0)
2e4f : 4c 91 2d JMP $2d91 ; (main.l1187 + 0)
.s1099:
2e52 : a5 59 __ LDA T6 + 0 
2e54 : c5 57 __ CMP T4 + 0 
2e56 : b0 03 __ BCS $2e5b ; (main.s1099 + 9)
2e58 : 4c 91 2d JMP $2d91 ; (main.l1187 + 0)
2e5b : 4c 90 29 JMP $2990 ; (main.s1189 + 0)
.s1009:
2e5e : a9 12 __ LDA #$12
2e60 : 8d 00 d6 STA $d600 
2e63 : a5 57 __ LDA T4 + 0 
2e65 : 85 1b __ STA ACCU + 0 
2e67 : a5 58 __ LDA T4 + 1 
2e69 : 85 1c __ STA ACCU + 1 
2e6b : a5 59 __ LDA T6 + 0 
2e6d : 20 ff 43 JSR $43ff ; (mul16by8 + 0)
2e70 : 18 __ __ CLC
2e71 : a5 05 __ LDA WORK + 2 
2e73 : 69 4b __ ADC #$4b
2e75 : 85 57 __ STA T4 + 0 
2e77 : a5 06 __ LDA WORK + 3 
2e79 : 69 00 __ ADC #$00
2e7b : 85 58 __ STA T4 + 1 
2e7d : 18 __ __ CLC
2e7e : a5 57 __ LDA T4 + 0 
2e80 : 65 43 __ ADC T5 + 0 
2e82 : aa __ __ TAX
2e83 : a5 58 __ LDA T4 + 1 
2e85 : 65 44 __ ADC T5 + 1 
.l7637:
2e87 : 2c 00 d6 BIT $d600 
2e8a : 10 fb __ BPL $2e87 ; (main.l7637 + 0)
.s1021:
2e8c : 8d 01 d6 STA $d601 
2e8f : a9 13 __ LDA #$13
2e91 : 8d 00 d6 STA $d600 
.l7639:
2e94 : 2c 00 d6 BIT $d600 
2e97 : 10 fb __ BPL $2e94 ; (main.l7639 + 0)
.s1026:
2e99 : 8e 01 d6 STX $d601 
2e9c : a9 1f __ LDA #$1f
2e9e : 8d 00 d6 STA $d600 
.l7641:
2ea1 : 2c 00 d6 BIT $d600 
2ea4 : 10 fb __ BPL $2ea1 ; (main.l7641 + 0)
.s1030:
2ea6 : a9 61 __ LDA #$61
2ea8 : 8d 01 d6 STA $d601 
2eab : ad f5 45 LDA $45f5 ; (vdc_state + 10)
2eae : 18 __ __ CLC
2eaf : 65 57 __ ADC T4 + 0 
2eb1 : aa __ __ TAX
2eb2 : a9 12 __ LDA #$12
2eb4 : 8d 00 d6 STA $d600 
2eb7 : ad f6 45 LDA $45f6 ; (vdc_state + 11)
2eba : 65 58 __ ADC T4 + 1 
.l7643:
2ebc : 2c 00 d6 BIT $d600 
2ebf : 10 fb __ BPL $2ebc ; (main.l7643 + 0)
.s1037:
2ec1 : 8d 01 d6 STA $d601 
2ec4 : a9 13 __ LDA #$13
2ec6 : 8d 00 d6 STA $d600 
.l7645:
2ec9 : 2c 00 d6 BIT $d600 
2ecc : 10 fb __ BPL $2ec9 ; (main.l7645 + 0)
.s1042:
2ece : 8e 01 d6 STX $d601 
2ed1 : a9 1f __ LDA #$1f
2ed3 : 8d 00 d6 STA $d600 
.l7647:
2ed6 : 2c 00 d6 BIT $d600 
2ed9 : 10 fb __ BPL $2ed6 ; (main.l7647 + 0)
.s1046:
2edb : a9 09 __ LDA #$09
2edd : 8d 01 d6 STA $d601 
2ee0 : e6 59 __ INC T6 + 0 
2ee2 : 4c 82 27 JMP $2782 ; (main.l1008 + 0)
.s969:
2ee5 : ad ee 45 LDA $45ee ; (vdc_state + 3)
2ee8 : 85 1b __ STA ACCU + 0 
2eea : ad ef 45 LDA $45ef ; (vdc_state + 4)
2eed : 85 1c __ STA ACCU + 1 
2eef : a9 12 __ LDA #$12
2ef1 : 8d 00 d6 STA $d600 
2ef4 : a5 59 __ LDA T6 + 0 
2ef6 : 20 ff 43 JSR $43ff ; (mul16by8 + 0)
2ef9 : 18 __ __ CLC
2efa : a5 05 __ LDA WORK + 2 
2efc : 69 04 __ ADC #$04
2efe : 85 57 __ STA T4 + 0 
2f00 : a5 06 __ LDA WORK + 3 
2f02 : 69 00 __ ADC #$00
2f04 : 85 58 __ STA T4 + 1 
2f06 : 18 __ __ CLC
2f07 : a5 57 __ LDA T4 + 0 
2f09 : 6d f3 45 ADC $45f3 ; (vdc_state + 8)
2f0c : aa __ __ TAX
2f0d : a5 58 __ LDA T4 + 1 
2f0f : 6d f4 45 ADC $45f4 ; (vdc_state + 9)
.l7624:
2f12 : 2c 00 d6 BIT $d600 
2f15 : 10 fb __ BPL $2f12 ; (main.l7624 + 0)
.s981:
2f17 : 8d 01 d6 STA $d601 
2f1a : a9 13 __ LDA #$13
2f1c : 8d 00 d6 STA $d600 
.l7626:
2f1f : 2c 00 d6 BIT $d600 
2f22 : 10 fb __ BPL $2f1f ; (main.l7626 + 0)
.s986:
2f24 : 8e 01 d6 STX $d601 
2f27 : a9 1f __ LDA #$1f
2f29 : 8d 00 d6 STA $d600 
.l7628:
2f2c : 2c 00 d6 BIT $d600 
2f2f : 10 fb __ BPL $2f2c ; (main.l7628 + 0)
.s990:
2f31 : a9 e1 __ LDA #$e1
2f33 : 8d 01 d6 STA $d601 
2f36 : ad f5 45 LDA $45f5 ; (vdc_state + 10)
2f39 : 18 __ __ CLC
2f3a : 65 57 __ ADC T4 + 0 
2f3c : aa __ __ TAX
2f3d : a9 12 __ LDA #$12
2f3f : 8d 00 d6 STA $d600 
2f42 : ad f6 45 LDA $45f6 ; (vdc_state + 11)
2f45 : 65 58 __ ADC T4 + 1 
.l7630:
2f47 : 2c 00 d6 BIT $d600 
2f4a : 10 fb __ BPL $2f47 ; (main.l7630 + 0)
.s997:
2f4c : 8d 01 d6 STA $d601 
2f4f : a9 13 __ LDA #$13
2f51 : 8d 00 d6 STA $d600 
.l7632:
2f54 : 2c 00 d6 BIT $d600 
2f57 : 10 fb __ BPL $2f54 ; (main.l7632 + 0)
.s1002:
2f59 : 8e 01 d6 STX $d601 
2f5c : a9 1f __ LDA #$1f
2f5e : 8d 00 d6 STA $d600 
.l7634:
2f61 : 2c 00 d6 BIT $d600 
2f64 : 10 fb __ BPL $2f61 ; (main.l7634 + 0)
.s1006:
2f66 : a9 09 __ LDA #$09
2f68 : 8d 01 d6 STA $d601 
2f6b : e6 59 __ INC T6 + 0 
2f6d : 4c 63 27 JMP $2763 ; (main.l968 + 0)
.s500:
2f70 : ad ee 45 LDA $45ee ; (vdc_state + 3)
2f73 : 85 1b __ STA ACCU + 0 
2f75 : ad ef 45 LDA $45ef ; (vdc_state + 4)
2f78 : 85 1c __ STA ACCU + 1 
2f7a : ad f2 45 LDA $45f2 ; (vdc_state + 7)
2f7d : 85 59 __ STA T6 + 0 
2f7f : a9 12 __ LDA #$12
2f81 : 8d 00 d6 STA $d600 
2f84 : a6 53 __ LDX T0 + 0 
2f86 : ca __ __ DEX
2f87 : 86 47 __ STX T8 + 0 
2f89 : a5 52 __ LDA T1 + 0 
2f8b : 20 ff 43 JSR $43ff ; (mul16by8 + 0)
2f8e : 18 __ __ CLC
2f8f : a5 05 __ LDA WORK + 2 
2f91 : 6d f3 45 ADC $45f3 ; (vdc_state + 8)
2f94 : aa __ __ TAX
2f95 : a5 06 __ LDA WORK + 3 
2f97 : 6d f4 45 ADC $45f4 ; (vdc_state + 9)
.l7481:
2f9a : 2c 00 d6 BIT $d600 
2f9d : 10 fb __ BPL $2f9a ; (main.l7481 + 0)
.s512:
2f9f : 8d 01 d6 STA $d601 
2fa2 : a9 13 __ LDA #$13
2fa4 : 8d 00 d6 STA $d600 
.l7483:
2fa7 : 2c 00 d6 BIT $d600 
2faa : 10 fb __ BPL $2fa7 ; (main.l7483 + 0)
.s517:
2fac : 8e 01 d6 STX $d601 
2faf : a9 1f __ LDA #$1f
2fb1 : 8d 00 d6 STA $d600 
.l7485:
2fb4 : 2c 00 d6 BIT $d600 
2fb7 : 10 fb __ BPL $2fb4 ; (main.l7485 + 0)
.s521:
2fb9 : a9 20 __ LDA #$20
2fbb : 8d 01 d6 STA $d601 
2fbe : a9 18 __ LDA #$18
2fc0 : 8d 00 d6 STA $d600 
.l7487:
2fc3 : 2c 00 d6 BIT $d600 
2fc6 : 10 fb __ BPL $2fc3 ; (main.l7487 + 0)
.s527:
2fc8 : ad 01 d6 LDA $d601 
2fcb : 29 7f __ AND #$7f
2fcd : aa __ __ TAX
2fce : a9 18 __ LDA #$18
2fd0 : 8d 00 d6 STA $d600 
.l7489:
2fd3 : 2c 00 d6 BIT $d600 
2fd6 : 10 fb __ BPL $2fd3 ; (main.l7489 + 0)
.s533:
2fd8 : 8e 01 d6 STX $d601 
2fdb : a9 1e __ LDA #$1e
2fdd : 8d 00 d6 STA $d600 
.l7491:
2fe0 : 2c 00 d6 BIT $d600 
2fe3 : 10 fb __ BPL $2fe0 ; (main.l7491 + 0)
.s538:
2fe5 : a5 47 __ LDA T8 + 0 
2fe7 : 8d 01 d6 STA $d601 
2fea : ad f5 45 LDA $45f5 ; (vdc_state + 10)
2fed : 18 __ __ CLC
2fee : 65 05 __ ADC WORK + 2 
2ff0 : aa __ __ TAX
2ff1 : a9 12 __ LDA #$12
2ff3 : 8d 00 d6 STA $d600 
2ff6 : ad f6 45 LDA $45f6 ; (vdc_state + 11)
2ff9 : 65 06 __ ADC WORK + 3 
.l7493:
2ffb : 2c 00 d6 BIT $d600 
2ffe : 10 fb __ BPL $2ffb ; (main.l7493 + 0)
.s545:
3000 : 8d 01 d6 STA $d601 
3003 : a9 13 __ LDA #$13
3005 : 8d 00 d6 STA $d600 
.l7495:
3008 : 2c 00 d6 BIT $d600 
300b : 10 fb __ BPL $3008 ; (main.l7495 + 0)
.s550:
300d : 8e 01 d6 STX $d601 
3010 : a9 1f __ LDA #$1f
3012 : 8d 00 d6 STA $d600 
.l7497:
3015 : 2c 00 d6 BIT $d600 
3018 : 10 fb __ BPL $3015 ; (main.l7497 + 0)
.s554:
301a : a5 59 __ LDA T6 + 0 
301c : 8d 01 d6 STA $d601 
301f : a9 18 __ LDA #$18
3021 : 8d 00 d6 STA $d600 
.l7499:
3024 : 2c 00 d6 BIT $d600 
3027 : 10 fb __ BPL $3024 ; (main.l7499 + 0)
.s560:
3029 : ad 01 d6 LDA $d601 
302c : 29 7f __ AND #$7f
302e : aa __ __ TAX
302f : a9 18 __ LDA #$18
3031 : 8d 00 d6 STA $d600 
.l7501:
3034 : 2c 00 d6 BIT $d600 
3037 : 10 fb __ BPL $3034 ; (main.l7501 + 0)
.s566:
3039 : 8e 01 d6 STX $d601 
303c : a9 1e __ LDA #$1e
303e : 8d 00 d6 STA $d600 
.l7503:
3041 : 2c 00 d6 BIT $d600 
3044 : 10 fb __ BPL $3041 ; (main.l7503 + 0)
.s571:
3046 : a5 47 __ LDA T8 + 0 
3048 : 8d 01 d6 STA $d601 
304b : e6 52 __ INC T1 + 0 
304d : 4c 61 22 JMP $2261 ; (main.l499 + 0)
.s425:
3050 : ad ee 45 LDA $45ee ; (vdc_state + 3)
3053 : 85 1b __ STA ACCU + 0 
3055 : ad ef 45 LDA $45ef ; (vdc_state + 4)
3058 : 85 1c __ STA ACCU + 1 
305a : ad f2 45 LDA $45f2 ; (vdc_state + 7)
305d : 85 59 __ STA T6 + 0 
305f : a9 12 __ LDA #$12
3061 : 8d 00 d6 STA $d600 
3064 : a6 53 __ LDX T0 + 0 
3066 : ca __ __ DEX
3067 : 86 47 __ STX T8 + 0 
3069 : a5 52 __ LDA T1 + 0 
306b : 20 ff 43 JSR $43ff ; (mul16by8 + 0)
306e : 18 __ __ CLC
306f : a5 05 __ LDA WORK + 2 
3071 : 6d f3 45 ADC $45f3 ; (vdc_state + 8)
3074 : aa __ __ TAX
3075 : a5 06 __ LDA WORK + 3 
3077 : 6d f4 45 ADC $45f4 ; (vdc_state + 9)
.l7457:
307a : 2c 00 d6 BIT $d600 
307d : 10 fb __ BPL $307a ; (main.l7457 + 0)
.s437:
307f : 8d 01 d6 STA $d601 
3082 : a9 13 __ LDA #$13
3084 : 8d 00 d6 STA $d600 
.l7459:
3087 : 2c 00 d6 BIT $d600 
308a : 10 fb __ BPL $3087 ; (main.l7459 + 0)
.s442:
308c : 8e 01 d6 STX $d601 
308f : a9 1f __ LDA #$1f
3091 : 8d 00 d6 STA $d600 
.l7461:
3094 : 2c 00 d6 BIT $d600 
3097 : 10 fb __ BPL $3094 ; (main.l7461 + 0)
.s446:
3099 : a9 20 __ LDA #$20
309b : 8d 01 d6 STA $d601 
309e : a9 18 __ LDA #$18
30a0 : 8d 00 d6 STA $d600 
.l7463:
30a3 : 2c 00 d6 BIT $d600 
30a6 : 10 fb __ BPL $30a3 ; (main.l7463 + 0)
.s452:
30a8 : ad 01 d6 LDA $d601 
30ab : 29 7f __ AND #$7f
30ad : aa __ __ TAX
30ae : a9 18 __ LDA #$18
30b0 : 8d 00 d6 STA $d600 
.l7465:
30b3 : 2c 00 d6 BIT $d600 
30b6 : 10 fb __ BPL $30b3 ; (main.l7465 + 0)
.s458:
30b8 : 8e 01 d6 STX $d601 
30bb : a9 1e __ LDA #$1e
30bd : 8d 00 d6 STA $d600 
.l7467:
30c0 : 2c 00 d6 BIT $d600 
30c3 : 10 fb __ BPL $30c0 ; (main.l7467 + 0)
.s463:
30c5 : a5 47 __ LDA T8 + 0 
30c7 : 8d 01 d6 STA $d601 
30ca : ad f5 45 LDA $45f5 ; (vdc_state + 10)
30cd : 18 __ __ CLC
30ce : 65 05 __ ADC WORK + 2 
30d0 : aa __ __ TAX
30d1 : a9 12 __ LDA #$12
30d3 : 8d 00 d6 STA $d600 
30d6 : ad f6 45 LDA $45f6 ; (vdc_state + 11)
30d9 : 65 06 __ ADC WORK + 3 
.l7469:
30db : 2c 00 d6 BIT $d600 
30de : 10 fb __ BPL $30db ; (main.l7469 + 0)
.s470:
30e0 : 8d 01 d6 STA $d601 
30e3 : a9 13 __ LDA #$13
30e5 : 8d 00 d6 STA $d600 
.l7471:
30e8 : 2c 00 d6 BIT $d600 
30eb : 10 fb __ BPL $30e8 ; (main.l7471 + 0)
.s475:
30ed : 8e 01 d6 STX $d601 
30f0 : a9 1f __ LDA #$1f
30f2 : 8d 00 d6 STA $d600 
.l7473:
30f5 : 2c 00 d6 BIT $d600 
30f8 : 10 fb __ BPL $30f5 ; (main.l7473 + 0)
.s479:
30fa : a5 59 __ LDA T6 + 0 
30fc : 8d 01 d6 STA $d601 
30ff : a9 18 __ LDA #$18
3101 : 8d 00 d6 STA $d600 
.l7475:
3104 : 2c 00 d6 BIT $d600 
3107 : 10 fb __ BPL $3104 ; (main.l7475 + 0)
.s485:
3109 : ad 01 d6 LDA $d601 
310c : 29 7f __ AND #$7f
310e : aa __ __ TAX
310f : a9 18 __ LDA #$18
3111 : 8d 00 d6 STA $d600 
.l7477:
3114 : 2c 00 d6 BIT $d600 
3117 : 10 fb __ BPL $3114 ; (main.l7477 + 0)
.s491:
3119 : 8e 01 d6 STX $d601 
311c : a9 1e __ LDA #$1e
311e : 8d 00 d6 STA $d600 
.l7479:
3121 : 2c 00 d6 BIT $d600 
3124 : 10 fb __ BPL $3121 ; (main.l7479 + 0)
.s496:
3126 : a5 47 __ LDA T8 + 0 
3128 : 8d 01 d6 STA $d601 
312b : e6 52 __ INC T1 + 0 
312d : 4c 27 22 JMP $2227 ; (main.l424 + 0)
.s137:
3130 : ad ee 45 LDA $45ee ; (vdc_state + 3)
3133 : 85 1b __ STA ACCU + 0 
3135 : ad ef 45 LDA $45ef ; (vdc_state + 4)
3138 : 85 1c __ STA ACCU + 1 
313a : ad f2 45 LDA $45f2 ; (vdc_state + 7)
313d : 85 59 __ STA T6 + 0 
313f : a9 12 __ LDA #$12
3141 : 8d 00 d6 STA $d600 
3144 : a6 53 __ LDX T0 + 0 
3146 : ca __ __ DEX
3147 : 86 47 __ STX T8 + 0 
3149 : a5 52 __ LDA T1 + 0 
314b : 20 ff 43 JSR $43ff ; (mul16by8 + 0)
314e : 18 __ __ CLC
314f : a5 05 __ LDA WORK + 2 
3151 : 6d f3 45 ADC $45f3 ; (vdc_state + 8)
3154 : aa __ __ TAX
3155 : a5 06 __ LDA WORK + 3 
3157 : 6d f4 45 ADC $45f4 ; (vdc_state + 9)
.l7424:
315a : 2c 00 d6 BIT $d600 
315d : 10 fb __ BPL $315a ; (main.l7424 + 0)
.s149:
315f : 8d 01 d6 STA $d601 
3162 : a9 13 __ LDA #$13
3164 : 8d 00 d6 STA $d600 
.l7426:
3167 : 2c 00 d6 BIT $d600 
316a : 10 fb __ BPL $3167 ; (main.l7426 + 0)
.s154:
316c : 8e 01 d6 STX $d601 
316f : a9 1f __ LDA #$1f
3171 : 8d 00 d6 STA $d600 
.l7428:
3174 : 2c 00 d6 BIT $d600 
3177 : 10 fb __ BPL $3174 ; (main.l7428 + 0)
.s158:
3179 : a9 20 __ LDA #$20
317b : 8d 01 d6 STA $d601 
317e : a9 18 __ LDA #$18
3180 : 8d 00 d6 STA $d600 
.l7430:
3183 : 2c 00 d6 BIT $d600 
3186 : 10 fb __ BPL $3183 ; (main.l7430 + 0)
.s164:
3188 : ad 01 d6 LDA $d601 
318b : 29 7f __ AND #$7f
318d : aa __ __ TAX
318e : a9 18 __ LDA #$18
3190 : 8d 00 d6 STA $d600 
.l7432:
3193 : 2c 00 d6 BIT $d600 
3196 : 10 fb __ BPL $3193 ; (main.l7432 + 0)
.s170:
3198 : 8e 01 d6 STX $d601 
319b : a9 1e __ LDA #$1e
319d : 8d 00 d6 STA $d600 
.l7434:
31a0 : 2c 00 d6 BIT $d600 
31a3 : 10 fb __ BPL $31a0 ; (main.l7434 + 0)
.s175:
31a5 : a5 47 __ LDA T8 + 0 
31a7 : 8d 01 d6 STA $d601 
31aa : ad f5 45 LDA $45f5 ; (vdc_state + 10)
31ad : 18 __ __ CLC
31ae : 65 05 __ ADC WORK + 2 
31b0 : aa __ __ TAX
31b1 : a9 12 __ LDA #$12
31b3 : 8d 00 d6 STA $d600 
31b6 : ad f6 45 LDA $45f6 ; (vdc_state + 11)
31b9 : 65 06 __ ADC WORK + 3 
.l7436:
31bb : 2c 00 d6 BIT $d600 
31be : 10 fb __ BPL $31bb ; (main.l7436 + 0)
.s182:
31c0 : 8d 01 d6 STA $d601 
31c3 : a9 13 __ LDA #$13
31c5 : 8d 00 d6 STA $d600 
.l7438:
31c8 : 2c 00 d6 BIT $d600 
31cb : 10 fb __ BPL $31c8 ; (main.l7438 + 0)
.s187:
31cd : 8e 01 d6 STX $d601 
31d0 : a9 1f __ LDA #$1f
31d2 : 8d 00 d6 STA $d600 
.l7440:
31d5 : 2c 00 d6 BIT $d600 
31d8 : 10 fb __ BPL $31d5 ; (main.l7440 + 0)
.s191:
31da : a5 59 __ LDA T6 + 0 
31dc : 8d 01 d6 STA $d601 
31df : a9 18 __ LDA #$18
31e1 : 8d 00 d6 STA $d600 
.l7442:
31e4 : 2c 00 d6 BIT $d600 
31e7 : 10 fb __ BPL $31e4 ; (main.l7442 + 0)
.s197:
31e9 : ad 01 d6 LDA $d601 
31ec : 29 7f __ AND #$7f
31ee : aa __ __ TAX
31ef : a9 18 __ LDA #$18
31f1 : 8d 00 d6 STA $d600 
.l7444:
31f4 : 2c 00 d6 BIT $d600 
31f7 : 10 fb __ BPL $31f4 ; (main.l7444 + 0)
.s203:
31f9 : 8e 01 d6 STX $d601 
31fc : a9 1e __ LDA #$1e
31fe : 8d 00 d6 STA $d600 
.l7446:
3201 : 2c 00 d6 BIT $d600 
3204 : 10 fb __ BPL $3201 ; (main.l7446 + 0)
.s208:
3206 : a5 47 __ LDA T8 + 0 
3208 : 8d 01 d6 STA $d601 
320b : e6 52 __ INC T1 + 0 
320d : 4c 64 20 JMP $2064 ; (main.l136 + 0)
.s17:
3210 : a9 00 __ LDA #$00
3212 : 85 53 __ STA T0 + 0 
3214 : 85 54 __ STA T0 + 1 
.l21:
3216 : 20 ec 39 JSR $39ec ; (krnio_chrin.s0 + 0)
3219 : a5 1b __ LDA ACCU + 0 
321b : 85 57 __ STA T4 + 0 
321d : 20 f6 39 JSR $39f6 ; (krnio_status.s0 + 0)
3220 : 8d dc 45 STA $45dc ; (krnio_pstatus + 1)
3223 : 09 00 __ ORA #$00
3225 : f0 07 __ BEQ $322e ; (main.s25 + 0)
.s26:
3227 : ad dc 45 LDA $45dc ; (krnio_pstatus + 1)
322a : c9 40 __ CMP #$40
322c : d0 17 __ BNE $3245 ; (main.s22 + 0)
.s25:
322e : a5 57 __ LDA T4 + 0 
3230 : a6 53 __ LDX T0 + 0 
3232 : e8 __ __ INX
3233 : 86 53 __ STX T0 + 0 
3235 : 9d 5a bf STA $bf5a,x ; (filename + 14)
3238 : a9 00 __ LDA #$00
323a : 85 54 __ STA T0 + 1 
323c : ad dc 45 LDA $45dc ; (krnio_pstatus + 1)
323f : d0 04 __ BNE $3245 ; (main.s22 + 0)
.s20:
3241 : e0 51 __ CPX #$51
3243 : 90 d1 __ BCC $3216 ; (main.l21 + 0)
.s22:
3245 : 20 69 39 JSR $3969 ; (krnio_clrchn.s0 + 0)
3248 : 4c f1 1d JMP $1df1 ; (main.s12 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
324b : a2 03 __ LDX #$03
324d : b5 53 __ LDA T8 + 0,x 
324f : 9d b2 bf STA $bfb2,x ; (printf@stack + 0)
3252 : ca __ __ DEX
3253 : 10 f8 __ BPL $324d ; (printf.s1000 + 2)
.s0:
3255 : 18 __ __ CLC
3256 : a5 23 __ LDA SP + 0 
3258 : 69 04 __ ADC #$04
325a : 85 47 __ STA T0 + 0 
325c : a5 24 __ LDA SP + 1 
325e : 69 00 __ ADC #$00
3260 : 85 48 __ STA T0 + 1 
3262 : a9 00 __ LDA #$00
3264 : 85 49 __ STA T2 + 0 
3266 : a0 02 __ LDY #$02
3268 : b1 23 __ LDA (SP + 0),y 
326a : 85 4a __ STA T3 + 0 
326c : c8 __ __ INY
326d : b1 23 __ LDA (SP + 0),y 
326f : 85 4b __ STA T3 + 1 
.l2:
3271 : a0 00 __ LDY #$00
3273 : b1 4a __ LDA (T3 + 0),y 
3275 : d0 1e __ BNE $3295 ; (printf.s3 + 0)
.s4:
3277 : a6 49 __ LDX T2 + 0 
3279 : 9d be bf STA $bfbe,x ; (buff + 0)
327c : 8a __ __ TXA
327d : f0 0b __ BEQ $328a ; (printf.s1001 + 0)
.s117:
327f : a9 be __ LDA #$be
3281 : 85 0d __ STA P0 ; (fmt + 0)
3283 : a9 bf __ LDA #$bf
3285 : 85 0e __ STA P1 ; (fmt + 1)
3287 : 20 9b 35 JSR $359b ; (puts.s0 + 0)
.s1001:
328a : a2 03 __ LDX #$03
328c : bd b2 bf LDA $bfb2,x ; (printf@stack + 0)
328f : 95 53 __ STA T8 + 0,x 
3291 : ca __ __ DEX
3292 : 10 f8 __ BPL $328c ; (printf.s1001 + 2)
3294 : 60 __ __ RTS
.s3:
3295 : c9 25 __ CMP #$25
3297 : f0 28 __ BEQ $32c1 ; (printf.s5 + 0)
.s6:
3299 : a6 49 __ LDX T2 + 0 
329b : 9d be bf STA $bfbe,x ; (buff + 0)
329e : e6 4a __ INC T3 + 0 
32a0 : d0 02 __ BNE $32a4 ; (printf.s1098 + 0)
.s1097:
32a2 : e6 4b __ INC T3 + 1 
.s1098:
32a4 : e8 __ __ INX
32a5 : 86 49 __ STX T2 + 0 
32a7 : e0 28 __ CPX #$28
32a9 : 90 c6 __ BCC $3271 ; (printf.l2 + 0)
.s111:
32ab : a9 be __ LDA #$be
32ad : 85 0d __ STA P0 ; (fmt + 0)
32af : a9 bf __ LDA #$bf
32b1 : 85 0e __ STA P1 ; (fmt + 1)
32b3 : 98 __ __ TYA
32b4 : 9d be bf STA $bfbe,x ; (buff + 0)
32b7 : 20 9b 35 JSR $359b ; (puts.s0 + 0)
32ba : a9 00 __ LDA #$00
.s1068:
32bc : 85 49 __ STA T2 + 0 
32be : 4c 71 32 JMP $3271 ; (printf.l2 + 0)
.s5:
32c1 : a5 49 __ LDA T2 + 0 
32c3 : f0 15 __ BEQ $32da ; (printf.s10 + 0)
.s8:
32c5 : a9 be __ LDA #$be
32c7 : 85 0d __ STA P0 ; (fmt + 0)
32c9 : a9 bf __ LDA #$bf
32cb : 85 0e __ STA P1 ; (fmt + 1)
32cd : 98 __ __ TYA
32ce : a6 49 __ LDX T2 + 0 
32d0 : 9d be bf STA $bfbe,x ; (buff + 0)
32d3 : 20 9b 35 JSR $359b ; (puts.s0 + 0)
32d6 : a9 00 __ LDA #$00
32d8 : 85 49 __ STA T2 + 0 
.s10:
32da : a9 0a __ LDA #$0a
32dc : 8d b9 bf STA $bfb9 ; (si + 3)
32df : a9 00 __ LDA #$00
32e1 : 8d ba bf STA $bfba ; (si + 4)
32e4 : 8d bb bf STA $bfbb ; (si + 5)
32e7 : 8d bc bf STA $bfbc ; (si + 6)
32ea : 8d bd bf STA $bfbd ; (si + 7)
32ed : a0 01 __ LDY #$01
32ef : b1 4a __ LDA (T3 + 0),y 
32f1 : aa __ __ TAX
32f2 : a9 20 __ LDA #$20
32f4 : 8d b6 bf STA $bfb6 ; (si + 0)
32f7 : a9 00 __ LDA #$00
32f9 : 8d b7 bf STA $bfb7 ; (si + 1)
32fc : a9 ff __ LDA #$ff
32fe : 8d b8 bf STA $bfb8 ; (si + 2)
3301 : 18 __ __ CLC
3302 : a5 4a __ LDA T3 + 0 
3304 : 69 02 __ ADC #$02
.l15:
3306 : 85 4a __ STA T3 + 0 
3308 : 90 02 __ BCC $330c ; (printf.s1080 + 0)
.s1079:
330a : e6 4b __ INC T3 + 1 
.s1080:
330c : 8a __ __ TXA
330d : e0 2b __ CPX #$2b
330f : d0 08 __ BNE $3319 ; (printf.s18 + 0)
.s17:
3311 : a9 01 __ LDA #$01
3313 : 8d bb bf STA $bfbb ; (si + 5)
3316 : 4c 8e 35 JMP $358e ; (printf.s246 + 0)
.s18:
3319 : c9 30 __ CMP #$30
331b : d0 06 __ BNE $3323 ; (printf.s21 + 0)
.s20:
331d : 8d b6 bf STA $bfb6 ; (si + 0)
3320 : 4c 8e 35 JMP $358e ; (printf.s246 + 0)
.s21:
3323 : e0 23 __ CPX #$23
3325 : d0 08 __ BNE $332f ; (printf.s24 + 0)
.s23:
3327 : a9 01 __ LDA #$01
3329 : 8d bd bf STA $bfbd ; (si + 7)
332c : 4c 8e 35 JMP $358e ; (printf.s246 + 0)
.s24:
332f : e0 2d __ CPX #$2d
3331 : d0 08 __ BNE $333b ; (printf.s16 + 0)
.s26:
3333 : a9 01 __ LDA #$01
3335 : 8d bc bf STA $bfbc ; (si + 6)
3338 : 4c 8e 35 JMP $358e ; (printf.s246 + 0)
.s16:
333b : 85 4c __ STA T4 + 0 
333d : e0 30 __ CPX #$30
333f : 90 53 __ BCC $3394 ; (printf.s32 + 0)
.s33:
3341 : e0 3a __ CPX #$3a
3343 : b0 4f __ BCS $3394 ; (printf.s32 + 0)
.s30:
3345 : a9 00 __ LDA #$00
3347 : 85 4d __ STA T6 + 0 
3349 : 85 4e __ STA T6 + 1 
334b : e0 3a __ CPX #$3a
334d : b0 40 __ BCS $338f ; (printf.s36 + 0)
.l35:
334f : a5 4d __ LDA T6 + 0 
3351 : 0a __ __ ASL
3352 : 85 1b __ STA ACCU + 0 
3354 : a5 4e __ LDA T6 + 1 
3356 : 2a __ __ ROL
3357 : 06 1b __ ASL ACCU + 0 
3359 : 2a __ __ ROL
335a : aa __ __ TAX
335b : 18 __ __ CLC
335c : a5 1b __ LDA ACCU + 0 
335e : 65 4d __ ADC T6 + 0 
3360 : 85 4d __ STA T6 + 0 
3362 : 8a __ __ TXA
3363 : 65 4e __ ADC T6 + 1 
3365 : 06 4d __ ASL T6 + 0 
3367 : 2a __ __ ROL
3368 : aa __ __ TAX
3369 : 18 __ __ CLC
336a : a5 4d __ LDA T6 + 0 
336c : 65 4c __ ADC T4 + 0 
336e : 90 01 __ BCC $3371 ; (printf.s1094 + 0)
.s1093:
3370 : e8 __ __ INX
.s1094:
3371 : 38 __ __ SEC
3372 : e9 30 __ SBC #$30
3374 : 85 4d __ STA T6 + 0 
3376 : 8a __ __ TXA
3377 : e9 00 __ SBC #$00
3379 : 85 4e __ STA T6 + 1 
337b : a0 00 __ LDY #$00
337d : b1 4a __ LDA (T3 + 0),y 
337f : 85 4c __ STA T4 + 0 
3381 : e6 4a __ INC T3 + 0 
3383 : d0 02 __ BNE $3387 ; (printf.s1096 + 0)
.s1095:
3385 : e6 4b __ INC T3 + 1 
.s1096:
3387 : c9 30 __ CMP #$30
3389 : 90 04 __ BCC $338f ; (printf.s36 + 0)
.s37:
338b : c9 3a __ CMP #$3a
338d : 90 c0 __ BCC $334f ; (printf.l35 + 0)
.s36:
338f : a5 4d __ LDA T6 + 0 
3391 : 8d b7 bf STA $bfb7 ; (si + 1)
.s32:
3394 : a5 4c __ LDA T4 + 0 
3396 : c9 2e __ CMP #$2e
3398 : d0 51 __ BNE $33eb ; (printf.s40 + 0)
.s38:
339a : a9 00 __ LDA #$00
339c : 85 4d __ STA T6 + 0 
.l231:
339e : 85 4e __ STA T6 + 1 
33a0 : a0 00 __ LDY #$00
33a2 : b1 4a __ LDA (T3 + 0),y 
33a4 : 85 4c __ STA T4 + 0 
33a6 : e6 4a __ INC T3 + 0 
33a8 : d0 02 __ BNE $33ac ; (printf.s1082 + 0)
.s1081:
33aa : e6 4b __ INC T3 + 1 
.s1082:
33ac : c9 30 __ CMP #$30
33ae : 90 04 __ BCC $33b4 ; (printf.s43 + 0)
.s44:
33b0 : c9 3a __ CMP #$3a
33b2 : 90 0a __ BCC $33be ; (printf.s42 + 0)
.s43:
33b4 : a5 4d __ LDA T6 + 0 
33b6 : 8d b8 bf STA $bfb8 ; (si + 2)
33b9 : a5 4c __ LDA T4 + 0 
33bb : 4c eb 33 JMP $33eb ; (printf.s40 + 0)
.s42:
33be : a5 4d __ LDA T6 + 0 
33c0 : 0a __ __ ASL
33c1 : 85 1b __ STA ACCU + 0 
33c3 : a5 4e __ LDA T6 + 1 
33c5 : 2a __ __ ROL
33c6 : 06 1b __ ASL ACCU + 0 
33c8 : 2a __ __ ROL
33c9 : aa __ __ TAX
33ca : 18 __ __ CLC
33cb : a5 1b __ LDA ACCU + 0 
33cd : 65 4d __ ADC T6 + 0 
33cf : 85 4d __ STA T6 + 0 
33d1 : 8a __ __ TXA
33d2 : 65 4e __ ADC T6 + 1 
33d4 : 06 4d __ ASL T6 + 0 
33d6 : 2a __ __ ROL
33d7 : aa __ __ TAX
33d8 : 18 __ __ CLC
33d9 : a5 4d __ LDA T6 + 0 
33db : 65 4c __ ADC T4 + 0 
33dd : 90 01 __ BCC $33e0 ; (printf.s1092 + 0)
.s1091:
33df : e8 __ __ INX
.s1092:
33e0 : 38 __ __ SEC
33e1 : e9 30 __ SBC #$30
33e3 : 85 4d __ STA T6 + 0 
33e5 : 8a __ __ TXA
33e6 : e9 00 __ SBC #$00
33e8 : 4c 9e 33 JMP $339e ; (printf.l231 + 0)
.s40:
33eb : c9 64 __ CMP #$64
33ed : f0 04 __ BEQ $33f3 ; (printf.s45 + 0)
.s48:
33ef : c9 44 __ CMP #$44
33f1 : d0 05 __ BNE $33f8 ; (printf.s46 + 0)
.s45:
33f3 : a9 01 __ LDA #$01
33f5 : 4c 67 35 JMP $3567 ; (printf.s247 + 0)
.s46:
33f8 : c9 75 __ CMP #$75
33fa : d0 03 __ BNE $33ff ; (printf.s52 + 0)
33fc : 4c 65 35 JMP $3565 ; (printf.s269 + 0)
.s52:
33ff : c9 55 __ CMP #$55
3401 : d0 03 __ BNE $3406 ; (printf.s50 + 0)
3403 : 4c 65 35 JMP $3565 ; (printf.s269 + 0)
.s50:
3406 : c9 78 __ CMP #$78
3408 : f0 04 __ BEQ $340e ; (printf.s53 + 0)
.s56:
340a : c9 58 __ CMP #$58
340c : d0 0d __ BNE $341b ; (printf.s54 + 0)
.s53:
340e : a9 10 __ LDA #$10
3410 : 8d b9 bf STA $bfb9 ; (si + 3)
3413 : a9 00 __ LDA #$00
3415 : 8d ba bf STA $bfba ; (si + 4)
3418 : 4c 65 35 JMP $3565 ; (printf.s269 + 0)
.s54:
341b : c9 6c __ CMP #$6c
341d : d0 03 __ BNE $3422 ; (printf.s60 + 0)
341f : 4c f7 34 JMP $34f7 ; (printf.s57 + 0)
.s60:
3422 : c9 4c __ CMP #$4c
3424 : d0 03 __ BNE $3429 ; (printf.s58 + 0)
3426 : 4c f7 34 JMP $34f7 ; (printf.s57 + 0)
.s58:
3429 : c9 73 __ CMP #$73
342b : f0 39 __ BEQ $3466 ; (printf.s73 + 0)
.s76:
342d : c9 53 __ CMP #$53
342f : f0 35 __ BEQ $3466 ; (printf.s73 + 0)
.s74:
3431 : c9 63 __ CMP #$63
3433 : f0 15 __ BEQ $344a ; (printf.s104 + 0)
.s107:
3435 : c9 43 __ CMP #$43
3437 : f0 11 __ BEQ $344a ; (printf.s104 + 0)
.s105:
3439 : 09 00 __ ORA #$00
343b : d0 03 __ BNE $3440 ; (printf.s108 + 0)
343d : 4c 71 32 JMP $3271 ; (printf.l2 + 0)
.s108:
3440 : a6 49 __ LDX T2 + 0 
3442 : 9d be bf STA $bfbe,x ; (buff + 0)
3445 : e6 49 __ INC T2 + 0 
3447 : 4c 71 32 JMP $3271 ; (printf.l2 + 0)
.s104:
344a : a0 00 __ LDY #$00
344c : b1 47 __ LDA (T0 + 0),y 
344e : a6 49 __ LDX T2 + 0 
3450 : 9d be bf STA $bfbe,x ; (buff + 0)
3453 : e6 49 __ INC T2 + 0 
.s244:
3455 : 18 __ __ CLC
3456 : a5 47 __ LDA T0 + 0 
3458 : 69 02 __ ADC #$02
345a : 85 47 __ STA T0 + 0 
345c : b0 03 __ BCS $3461 ; (printf.s1083 + 0)
345e : 4c 71 32 JMP $3271 ; (printf.l2 + 0)
.s1083:
3461 : e6 48 __ INC T0 + 1 
3463 : 4c 71 32 JMP $3271 ; (printf.l2 + 0)
.s73:
3466 : a0 00 __ LDY #$00
3468 : 84 4c __ STY T4 + 0 
346a : b1 47 __ LDA (T0 + 0),y 
346c : 85 4d __ STA T6 + 0 
346e : c8 __ __ INY
346f : b1 47 __ LDA (T0 + 0),y 
3471 : 85 4e __ STA T6 + 1 
3473 : 18 __ __ CLC
3474 : a5 47 __ LDA T0 + 0 
3476 : 69 02 __ ADC #$02
3478 : 85 47 __ STA T0 + 0 
347a : 90 02 __ BCC $347e ; (printf.s1090 + 0)
.s1089:
347c : e6 48 __ INC T0 + 1 
.s1090:
347e : ad b7 bf LDA $bfb7 ; (si + 1)
3481 : f0 0d __ BEQ $3490 ; (printf.s79 + 0)
.s1071:
3483 : a0 00 __ LDY #$00
3485 : b1 4d __ LDA (T6 + 0),y 
3487 : f0 05 __ BEQ $348e ; (printf.s1072 + 0)
.l81:
3489 : c8 __ __ INY
348a : b1 4d __ LDA (T6 + 0),y 
348c : d0 fb __ BNE $3489 ; (printf.l81 + 0)
.s1072:
348e : 84 4c __ STY T4 + 0 
.s79:
3490 : ad bc bf LDA $bfbc ; (si + 6)
3493 : d0 1a __ BNE $34af ; (printf.s85 + 0)
.s1075:
3495 : a4 4c __ LDY T4 + 0 
3497 : cc b7 bf CPY $bfb7 ; (si + 1)
349a : a6 49 __ LDX T2 + 0 
349c : b0 0d __ BCS $34ab ; (printf.s1076 + 0)
.l87:
349e : ad b6 bf LDA $bfb6 ; (si + 0)
34a1 : 9d be bf STA $bfbe,x ; (buff + 0)
34a4 : c8 __ __ INY
34a5 : cc b7 bf CPY $bfb7 ; (si + 1)
34a8 : e8 __ __ INX
34a9 : 90 f3 __ BCC $349e ; (printf.l87 + 0)
.s1076:
34ab : 86 49 __ STX T2 + 0 
34ad : 84 4c __ STY T4 + 0 
.s85:
34af : a5 49 __ LDA T2 + 0 
34b1 : f0 16 __ BEQ $34c9 ; (printf.s238 + 0)
.s92:
34b3 : a9 be __ LDA #$be
34b5 : 85 0d __ STA P0 ; (fmt + 0)
34b7 : a9 bf __ LDA #$bf
34b9 : 85 0e __ STA P1 ; (fmt + 1)
34bb : a9 00 __ LDA #$00
34bd : a6 49 __ LDX T2 + 0 
34bf : 9d be bf STA $bfbe,x ; (buff + 0)
34c2 : 20 9b 35 JSR $359b ; (puts.s0 + 0)
34c5 : a9 00 __ LDA #$00
34c7 : 85 49 __ STA T2 + 0 
.s238:
34c9 : a5 4d __ LDA T6 + 0 
34cb : 85 0d __ STA P0 ; (fmt + 0)
34cd : a5 4e __ LDA T6 + 1 
34cf : 85 0e __ STA P1 ; (fmt + 1)
34d1 : 20 9b 35 JSR $359b ; (puts.s0 + 0)
34d4 : ad bc bf LDA $bfbc ; (si + 6)
34d7 : d0 03 __ BNE $34dc ; (printf.s1073 + 0)
34d9 : 4c 71 32 JMP $3271 ; (printf.l2 + 0)
.s1073:
34dc : a4 4c __ LDY T4 + 0 
34de : cc b7 bf CPY $bfb7 ; (si + 1)
34e1 : a2 00 __ LDX #$00
34e3 : b0 0d __ BCS $34f2 ; (printf.s1074 + 0)
.l102:
34e5 : ad b6 bf LDA $bfb6 ; (si + 0)
34e8 : 9d be bf STA $bfbe,x ; (buff + 0)
34eb : c8 __ __ INY
34ec : cc b7 bf CPY $bfb7 ; (si + 1)
34ef : e8 __ __ INX
34f0 : 90 f3 __ BCC $34e5 ; (printf.l102 + 0)
.s1074:
34f2 : 86 49 __ STX T2 + 0 
34f4 : 4c 71 32 JMP $3271 ; (printf.l2 + 0)
.s57:
34f7 : a0 00 __ LDY #$00
34f9 : b1 47 __ LDA (T0 + 0),y 
34fb : 85 53 __ STA T8 + 0 
34fd : c8 __ __ INY
34fe : b1 47 __ LDA (T0 + 0),y 
3500 : 85 54 __ STA T8 + 1 
3502 : c8 __ __ INY
3503 : b1 47 __ LDA (T0 + 0),y 
3505 : 85 55 __ STA T8 + 2 
3507 : c8 __ __ INY
3508 : b1 47 __ LDA (T0 + 0),y 
350a : 85 56 __ STA T8 + 3 
350c : 18 __ __ CLC
350d : a5 47 __ LDA T0 + 0 
350f : 69 04 __ ADC #$04
3511 : 85 47 __ STA T0 + 0 
3513 : 90 02 __ BCC $3517 ; (printf.s1086 + 0)
.s1085:
3515 : e6 48 __ INC T0 + 1 
.s1086:
3517 : a0 00 __ LDY #$00
3519 : b1 4a __ LDA (T3 + 0),y 
351b : aa __ __ TAX
351c : e6 4a __ INC T3 + 0 
351e : d0 02 __ BNE $3522 ; (printf.s1088 + 0)
.s1087:
3520 : e6 4b __ INC T3 + 1 
.s1088:
3522 : 8a __ __ TXA
3523 : e0 64 __ CPX #$64
3525 : f0 04 __ BEQ $352b ; (printf.s61 + 0)
.s64:
3527 : c9 44 __ CMP #$44
3529 : d0 04 __ BNE $352f ; (printf.s62 + 0)
.s61:
352b : a9 01 __ LDA #$01
352d : d0 1c __ BNE $354b ; (printf.s245 + 0)
.s62:
352f : c9 75 __ CMP #$75
3531 : f0 17 __ BEQ $354a ; (printf.s268 + 0)
.s68:
3533 : c9 55 __ CMP #$55
3535 : f0 13 __ BEQ $354a ; (printf.s268 + 0)
.s66:
3537 : c9 78 __ CMP #$78
3539 : f0 07 __ BEQ $3542 ; (printf.s69 + 0)
.s72:
353b : c9 58 __ CMP #$58
353d : f0 03 __ BEQ $3542 ; (printf.s69 + 0)
353f : 4c 71 32 JMP $3271 ; (printf.l2 + 0)
.s69:
3542 : 8c ba bf STY $bfba ; (si + 4)
3545 : a9 10 __ LDA #$10
3547 : 8d b9 bf STA $bfb9 ; (si + 3)
.s268:
354a : 98 __ __ TYA
.s245:
354b : 85 15 __ STA P8 
354d : a9 be __ LDA #$be
354f : 85 0f __ STA P2 ; (fmt + 2)
3551 : a9 bf __ LDA #$bf
3553 : 85 10 __ STA P3 ; (fmt + 3)
3555 : a9 b6 __ LDA #$b6
3557 : 85 0d __ STA P0 ; (fmt + 0)
3559 : a9 bf __ LDA #$bf
355b : 85 0e __ STA P1 ; (fmt + 1)
355d : 20 25 37 JSR $3725 ; (nforml@proxy + 0)
3560 : a5 1b __ LDA ACCU + 0 
3562 : 4c bc 32 JMP $32bc ; (printf.s1068 + 0)
.s269:
3565 : a9 00 __ LDA #$00
.s247:
3567 : 85 13 __ STA P6 
3569 : a9 be __ LDA #$be
356b : 85 0f __ STA P2 ; (fmt + 2)
356d : a9 bf __ LDA #$bf
356f : 85 10 __ STA P3 ; (fmt + 3)
3571 : a0 00 __ LDY #$00
3573 : b1 47 __ LDA (T0 + 0),y 
3575 : 85 11 __ STA P4 
3577 : c8 __ __ INY
3578 : b1 47 __ LDA (T0 + 0),y 
357a : 85 12 __ STA P5 
357c : a9 b6 __ LDA #$b6
357e : 85 0d __ STA P0 ; (fmt + 0)
3580 : a9 bf __ LDA #$bf
3582 : 85 0e __ STA P1 ; (fmt + 1)
3584 : 20 f0 35 JSR $35f0 ; (nformi.s0 + 0)
3587 : a5 1b __ LDA ACCU + 0 
3589 : 85 49 __ STA T2 + 0 
358b : 4c 55 34 JMP $3455 ; (printf.s244 + 0)
.s246:
358e : a0 00 __ LDY #$00
3590 : b1 4a __ LDA (T3 + 0),y 
3592 : aa __ __ TAX
3593 : 18 __ __ CLC
3594 : a5 4a __ LDA T3 + 0 
3596 : 69 01 __ ADC #$01
3598 : 4c 06 33 JMP $3306 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
359b : a0 00 __ LDY #$00
359d : b1 0d __ LDA (P0),y 
359f : f0 0b __ BEQ $35ac ; (puts.s1001 + 0)
35a1 : 20 ad 35 JSR $35ad ; (putpch + 0)
35a4 : e6 0d __ INC P0 
35a6 : d0 f3 __ BNE $359b ; (puts.s0 + 0)
35a8 : e6 0e __ INC P1 
35aa : d0 ef __ BNE $359b ; (puts.s0 + 0)
.s1001:
35ac : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
35ad : ae 9a 45 LDX $459a ; (giocharmap + 0)
35b0 : e0 01 __ CPX #$01
35b2 : 90 26 __ BCC $35da ; (putpch + 45)
35b4 : c9 0a __ CMP #$0a
35b6 : d0 02 __ BNE $35ba ; (putpch + 13)
35b8 : a9 0d __ LDA #$0d
35ba : c9 09 __ CMP #$09
35bc : f0 1f __ BEQ $35dd ; (putpch + 48)
35be : e0 02 __ CPX #$02
35c0 : 90 18 __ BCC $35da ; (putpch + 45)
35c2 : c9 41 __ CMP #$41
35c4 : 90 14 __ BCC $35da ; (putpch + 45)
35c6 : c9 7b __ CMP #$7b
35c8 : b0 10 __ BCS $35da ; (putpch + 45)
35ca : c9 61 __ CMP #$61
35cc : b0 04 __ BCS $35d2 ; (putpch + 37)
35ce : c9 5b __ CMP #$5b
35d0 : b0 08 __ BCS $35da ; (putpch + 45)
35d2 : 49 20 __ EOR #$20
35d4 : e0 03 __ CPX #$03
35d6 : f0 02 __ BEQ $35da ; (putpch + 45)
35d8 : 29 df __ AND #$df
35da : 4c d2 ff JMP $ffd2 
35dd : 38 __ __ SEC
35de : 20 f0 ff JSR $fff0 
35e1 : 98 __ __ TYA
35e2 : 29 03 __ AND #$03
35e4 : 49 03 __ EOR #$03
35e6 : aa __ __ TAX
35e7 : a9 20 __ LDA #$20
35e9 : 20 d2 ff JSR $ffd2 
35ec : ca __ __ DEX
35ed : 10 fa __ BPL $35e9 ; (putpch + 60)
35ef : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
35f0 : a9 00 __ LDA #$00
35f2 : 85 43 __ STA T0 + 0 
35f4 : a5 13 __ LDA P6 ; (s + 0)
35f6 : f0 13 __ BEQ $360b ; (nformi.s182 + 0)
.s4:
35f8 : 24 12 __ BIT P5 ; (v + 1)
35fa : 10 0f __ BPL $360b ; (nformi.s182 + 0)
.s1:
35fc : 38 __ __ SEC
35fd : a9 00 __ LDA #$00
35ff : e5 11 __ SBC P4 ; (v + 0)
3601 : 85 11 __ STA P4 ; (v + 0)
3603 : a9 00 __ LDA #$00
3605 : e5 12 __ SBC P5 ; (v + 1)
3607 : 85 12 __ STA P5 ; (v + 1)
3609 : e6 43 __ INC T0 + 0 
.s182:
360b : a9 10 __ LDA #$10
360d : 85 44 __ STA T2 + 0 
360f : a5 11 __ LDA P4 ; (v + 0)
3611 : 05 12 __ ORA P5 ; (v + 1)
3613 : f0 46 __ BEQ $365b ; (nformi.s7 + 0)
.s42:
3615 : a0 03 __ LDY #$03
3617 : b1 0d __ LDA (P0),y ; (si + 0)
3619 : 85 45 __ STA T4 + 0 
361b : c8 __ __ INY
361c : b1 0d __ LDA (P0),y ; (si + 0)
361e : 85 46 __ STA T4 + 1 
.l6:
3620 : a5 11 __ LDA P4 ; (v + 0)
3622 : 85 1b __ STA ACCU + 0 
3624 : a5 12 __ LDA P5 ; (v + 1)
3626 : 85 1c __ STA ACCU + 1 
3628 : a5 45 __ LDA T4 + 0 
362a : 85 03 __ STA WORK + 0 
362c : a5 46 __ LDA T4 + 1 
362e : 85 04 __ STA WORK + 1 
3630 : 20 1f 44 JSR $441f ; (divmod + 0)
3633 : a5 06 __ LDA WORK + 3 
3635 : 30 08 __ BMI $363f ; (nformi.s78 + 0)
.s1019:
3637 : d0 0a __ BNE $3643 ; (nformi.s77 + 0)
.s1018:
3639 : a5 05 __ LDA WORK + 2 
363b : c9 0a __ CMP #$0a
363d : b0 04 __ BCS $3643 ; (nformi.s77 + 0)
.s78:
363f : a9 30 __ LDA #$30
3641 : d0 02 __ BNE $3645 ; (nformi.s79 + 0)
.s77:
3643 : a9 37 __ LDA #$37
.s79:
3645 : 18 __ __ CLC
3646 : 65 05 __ ADC WORK + 2 
3648 : c6 44 __ DEC T2 + 0 
364a : a6 44 __ LDX T2 + 0 
364c : 9d f0 bf STA $bff0,x ; (buffer + 0)
364f : a5 1b __ LDA ACCU + 0 
3651 : 85 11 __ STA P4 ; (v + 0)
3653 : a5 1c __ LDA ACCU + 1 
3655 : 85 12 __ STA P5 ; (v + 1)
3657 : 05 11 __ ORA P4 ; (v + 0)
3659 : d0 c5 __ BNE $3620 ; (nformi.l6 + 0)
.s7:
365b : a0 02 __ LDY #$02
365d : b1 0d __ LDA (P0),y ; (si + 0)
365f : c9 ff __ CMP #$ff
3661 : d0 04 __ BNE $3667 ; (nformi.s80 + 0)
.s81:
3663 : a9 0f __ LDA #$0f
3665 : d0 05 __ BNE $366c ; (nformi.s1026 + 0)
.s80:
3667 : 38 __ __ SEC
3668 : a9 10 __ LDA #$10
366a : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
366c : a8 __ __ TAY
366d : c4 44 __ CPY T2 + 0 
366f : b0 0d __ BCS $367e ; (nformi.s10 + 0)
.s9:
3671 : a9 30 __ LDA #$30
.l1027:
3673 : c6 44 __ DEC T2 + 0 
3675 : a6 44 __ LDX T2 + 0 
3677 : 9d f0 bf STA $bff0,x ; (buffer + 0)
367a : c4 44 __ CPY T2 + 0 
367c : 90 f5 __ BCC $3673 ; (nformi.l1027 + 0)
.s10:
367e : a0 07 __ LDY #$07
3680 : b1 0d __ LDA (P0),y ; (si + 0)
3682 : f0 20 __ BEQ $36a4 ; (nformi.s13 + 0)
.s14:
3684 : a0 04 __ LDY #$04
3686 : b1 0d __ LDA (P0),y ; (si + 0)
3688 : d0 1a __ BNE $36a4 ; (nformi.s13 + 0)
.s1013:
368a : 88 __ __ DEY
368b : b1 0d __ LDA (P0),y ; (si + 0)
368d : c9 10 __ CMP #$10
368f : d0 13 __ BNE $36a4 ; (nformi.s13 + 0)
.s11:
3691 : a9 58 __ LDA #$58
3693 : a6 44 __ LDX T2 + 0 
3695 : 9d ef bf STA $bfef,x ; (buff + 49)
3698 : 8a __ __ TXA
3699 : 18 __ __ CLC
369a : 69 fe __ ADC #$fe
369c : 85 44 __ STA T2 + 0 
369e : aa __ __ TAX
369f : a9 30 __ LDA #$30
36a1 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
36a4 : a9 00 __ LDA #$00
36a6 : 85 1b __ STA ACCU + 0 
36a8 : a5 43 __ LDA T0 + 0 
36aa : f0 06 __ BEQ $36b2 ; (nformi.s16 + 0)
.s15:
36ac : c6 44 __ DEC T2 + 0 
36ae : a9 2d __ LDA #$2d
36b0 : d0 0a __ BNE $36bc ; (nformi.s1025 + 0)
.s16:
36b2 : a0 05 __ LDY #$05
36b4 : b1 0d __ LDA (P0),y ; (si + 0)
36b6 : f0 09 __ BEQ $36c1 ; (nformi.s163 + 0)
.s18:
36b8 : c6 44 __ DEC T2 + 0 
36ba : a9 2b __ LDA #$2b
.s1025:
36bc : a6 44 __ LDX T2 + 0 
36be : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
36c1 : a0 06 __ LDY #$06
36c3 : b1 0d __ LDA (P0),y ; (si + 0)
36c5 : d0 33 __ BNE $36fa ; (nformi.s24 + 0)
.l30:
36c7 : a0 01 __ LDY #$01
36c9 : b1 0d __ LDA (P0),y ; (si + 0)
36cb : 18 __ __ CLC
36cc : 65 44 __ ADC T2 + 0 
36ce : b0 04 __ BCS $36d4 ; (nformi.s31 + 0)
.s1006:
36d0 : c9 11 __ CMP #$11
36d2 : 90 0d __ BCC $36e1 ; (nformi.s33 + 0)
.s31:
36d4 : c6 44 __ DEC T2 + 0 
36d6 : a0 00 __ LDY #$00
36d8 : b1 0d __ LDA (P0),y ; (si + 0)
36da : a6 44 __ LDX T2 + 0 
36dc : 9d f0 bf STA $bff0,x ; (buffer + 0)
36df : b0 e6 __ BCS $36c7 ; (nformi.l30 + 0)
.s33:
36e1 : a6 44 __ LDX T2 + 0 
36e3 : e0 10 __ CPX #$10
36e5 : b0 0e __ BCS $36f5 ; (nformi.s23 + 0)
.s34:
36e7 : 88 __ __ DEY
.l1022:
36e8 : bd f0 bf LDA $bff0,x ; (buffer + 0)
36eb : 91 0f __ STA (P2),y ; (str + 0)
36ed : e8 __ __ INX
36ee : e0 10 __ CPX #$10
36f0 : c8 __ __ INY
36f1 : 90 f5 __ BCC $36e8 ; (nformi.l1022 + 0)
.s1023:
36f3 : 84 1b __ STY ACCU + 0 
.s23:
36f5 : a9 00 __ LDA #$00
36f7 : 85 1c __ STA ACCU + 1 
.s1001:
36f9 : 60 __ __ RTS
.s24:
36fa : a6 44 __ LDX T2 + 0 
36fc : e0 10 __ CPX #$10
36fe : b0 1a __ BCS $371a ; (nformi.l27 + 0)
.s25:
3700 : a0 00 __ LDY #$00
.l1020:
3702 : bd f0 bf LDA $bff0,x ; (buffer + 0)
3705 : 91 0f __ STA (P2),y ; (str + 0)
3707 : e8 __ __ INX
3708 : e0 10 __ CPX #$10
370a : c8 __ __ INY
370b : 90 f5 __ BCC $3702 ; (nformi.l1020 + 0)
.s1021:
370d : 84 1b __ STY ACCU + 0 
370f : b0 09 __ BCS $371a ; (nformi.l27 + 0)
.s28:
3711 : 88 __ __ DEY
3712 : b1 0d __ LDA (P0),y ; (si + 0)
3714 : a4 1b __ LDY ACCU + 0 
3716 : 91 0f __ STA (P2),y ; (str + 0)
3718 : e6 1b __ INC ACCU + 0 
.l27:
371a : a5 1b __ LDA ACCU + 0 
371c : a0 01 __ LDY #$01
371e : d1 0d __ CMP (P0),y ; (si + 0)
3720 : 90 ef __ BCC $3711 ; (nformi.s28 + 0)
3722 : 4c f5 36 JMP $36f5 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml@proxy: ; nforml@proxy
3725 : a5 53 __ LDA $53 
3727 : 85 11 __ STA P4 
3729 : a5 54 __ LDA $54 
372b : 85 12 __ STA P5 
372d : a5 55 __ LDA $55 
372f : 85 13 __ STA P6 
3731 : a5 56 __ LDA $56 
3733 : 85 14 __ STA P7 
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
3735 : a9 00 __ LDA #$00
3737 : 85 43 __ STA T0 + 0 
3739 : a5 15 __ LDA P8 ; (s + 0)
373b : f0 21 __ BEQ $375e ; (nforml.s182 + 0)
.s4:
373d : a5 14 __ LDA P7 ; (v + 3)
373f : f0 1d __ BEQ $375e ; (nforml.s182 + 0)
.s1032:
3741 : 10 1b __ BPL $375e ; (nforml.s182 + 0)
.s1:
3743 : 38 __ __ SEC
3744 : a9 00 __ LDA #$00
3746 : e5 11 __ SBC P4 ; (v + 0)
3748 : 85 11 __ STA P4 ; (v + 0)
374a : a9 00 __ LDA #$00
374c : e5 12 __ SBC P5 ; (v + 1)
374e : 85 12 __ STA P5 ; (v + 1)
3750 : a9 00 __ LDA #$00
3752 : e5 13 __ SBC P6 ; (v + 2)
3754 : 85 13 __ STA P6 ; (v + 2)
3756 : a9 00 __ LDA #$00
3758 : e5 14 __ SBC P7 ; (v + 3)
375a : 85 14 __ STA P7 ; (v + 3)
375c : e6 43 __ INC T0 + 0 
.s182:
375e : a9 10 __ LDA #$10
3760 : 85 44 __ STA T2 + 0 
3762 : a5 14 __ LDA P7 ; (v + 3)
3764 : d0 0c __ BNE $3772 ; (nforml.s42 + 0)
.s1024:
3766 : a5 13 __ LDA P6 ; (v + 2)
3768 : d0 08 __ BNE $3772 ; (nforml.s42 + 0)
.s1025:
376a : a5 12 __ LDA P5 ; (v + 1)
376c : d0 04 __ BNE $3772 ; (nforml.s42 + 0)
.s1026:
376e : c5 11 __ CMP P4 ; (v + 0)
3770 : b0 0e __ BCS $3780 ; (nforml.s7 + 0)
.s42:
3772 : a0 03 __ LDY #$03
3774 : b1 0d __ LDA (P0),y ; (si + 0)
3776 : 85 45 __ STA T5 + 0 
3778 : c8 __ __ INY
3779 : b1 0d __ LDA (P0),y ; (si + 0)
377b : 85 46 __ STA T5 + 1 
377d : 4c 4a 38 JMP $384a ; (nforml.l6 + 0)
.s7:
3780 : a0 02 __ LDY #$02
3782 : b1 0d __ LDA (P0),y ; (si + 0)
3784 : c9 ff __ CMP #$ff
3786 : d0 04 __ BNE $378c ; (nforml.s80 + 0)
.s81:
3788 : a9 0f __ LDA #$0f
378a : d0 05 __ BNE $3791 ; (nforml.s1039 + 0)
.s80:
378c : 38 __ __ SEC
378d : a9 10 __ LDA #$10
378f : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
3791 : a8 __ __ TAY
3792 : c4 44 __ CPY T2 + 0 
3794 : b0 0d __ BCS $37a3 ; (nforml.s10 + 0)
.s9:
3796 : a9 30 __ LDA #$30
.l1040:
3798 : c6 44 __ DEC T2 + 0 
379a : a6 44 __ LDX T2 + 0 
379c : 9d f0 bf STA $bff0,x ; (buffer + 0)
379f : c4 44 __ CPY T2 + 0 
37a1 : 90 f5 __ BCC $3798 ; (nforml.l1040 + 0)
.s10:
37a3 : a0 07 __ LDY #$07
37a5 : b1 0d __ LDA (P0),y ; (si + 0)
37a7 : f0 20 __ BEQ $37c9 ; (nforml.s13 + 0)
.s14:
37a9 : a0 04 __ LDY #$04
37ab : b1 0d __ LDA (P0),y ; (si + 0)
37ad : d0 1a __ BNE $37c9 ; (nforml.s13 + 0)
.s1013:
37af : 88 __ __ DEY
37b0 : b1 0d __ LDA (P0),y ; (si + 0)
37b2 : c9 10 __ CMP #$10
37b4 : d0 13 __ BNE $37c9 ; (nforml.s13 + 0)
.s11:
37b6 : a9 58 __ LDA #$58
37b8 : a6 44 __ LDX T2 + 0 
37ba : 9d ef bf STA $bfef,x ; (buff + 49)
37bd : 8a __ __ TXA
37be : 18 __ __ CLC
37bf : 69 fe __ ADC #$fe
37c1 : 85 44 __ STA T2 + 0 
37c3 : aa __ __ TAX
37c4 : a9 30 __ LDA #$30
37c6 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
37c9 : a9 00 __ LDA #$00
37cb : 85 1b __ STA ACCU + 0 
37cd : a5 43 __ LDA T0 + 0 
37cf : f0 06 __ BEQ $37d7 ; (nforml.s16 + 0)
.s15:
37d1 : c6 44 __ DEC T2 + 0 
37d3 : a9 2d __ LDA #$2d
37d5 : d0 0a __ BNE $37e1 ; (nforml.s1038 + 0)
.s16:
37d7 : a0 05 __ LDY #$05
37d9 : b1 0d __ LDA (P0),y ; (si + 0)
37db : f0 09 __ BEQ $37e6 ; (nforml.s163 + 0)
.s18:
37dd : c6 44 __ DEC T2 + 0 
37df : a9 2b __ LDA #$2b
.s1038:
37e1 : a6 44 __ LDX T2 + 0 
37e3 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
37e6 : a0 06 __ LDY #$06
37e8 : b1 0d __ LDA (P0),y ; (si + 0)
37ea : d0 33 __ BNE $381f ; (nforml.s24 + 0)
.l30:
37ec : a0 01 __ LDY #$01
37ee : b1 0d __ LDA (P0),y ; (si + 0)
37f0 : 18 __ __ CLC
37f1 : 65 44 __ ADC T2 + 0 
37f3 : b0 04 __ BCS $37f9 ; (nforml.s31 + 0)
.s1006:
37f5 : c9 11 __ CMP #$11
37f7 : 90 0d __ BCC $3806 ; (nforml.s33 + 0)
.s31:
37f9 : c6 44 __ DEC T2 + 0 
37fb : a0 00 __ LDY #$00
37fd : b1 0d __ LDA (P0),y ; (si + 0)
37ff : a6 44 __ LDX T2 + 0 
3801 : 9d f0 bf STA $bff0,x ; (buffer + 0)
3804 : b0 e6 __ BCS $37ec ; (nforml.l30 + 0)
.s33:
3806 : a6 44 __ LDX T2 + 0 
3808 : e0 10 __ CPX #$10
380a : b0 0e __ BCS $381a ; (nforml.s23 + 0)
.s34:
380c : 88 __ __ DEY
.l1035:
380d : bd f0 bf LDA $bff0,x ; (buffer + 0)
3810 : 91 0f __ STA (P2),y ; (str + 0)
3812 : e8 __ __ INX
3813 : e0 10 __ CPX #$10
3815 : c8 __ __ INY
3816 : 90 f5 __ BCC $380d ; (nforml.l1035 + 0)
.s1036:
3818 : 84 1b __ STY ACCU + 0 
.s23:
381a : a9 00 __ LDA #$00
381c : 85 1c __ STA ACCU + 1 
.s1001:
381e : 60 __ __ RTS
.s24:
381f : a6 44 __ LDX T2 + 0 
3821 : e0 10 __ CPX #$10
3823 : b0 1a __ BCS $383f ; (nforml.l27 + 0)
.s25:
3825 : a0 00 __ LDY #$00
.l1033:
3827 : bd f0 bf LDA $bff0,x ; (buffer + 0)
382a : 91 0f __ STA (P2),y ; (str + 0)
382c : e8 __ __ INX
382d : e0 10 __ CPX #$10
382f : c8 __ __ INY
3830 : 90 f5 __ BCC $3827 ; (nforml.l1033 + 0)
.s1034:
3832 : 84 1b __ STY ACCU + 0 
3834 : b0 09 __ BCS $383f ; (nforml.l27 + 0)
.s28:
3836 : 88 __ __ DEY
3837 : b1 0d __ LDA (P0),y ; (si + 0)
3839 : a4 1b __ LDY ACCU + 0 
383b : 91 0f __ STA (P2),y ; (str + 0)
383d : e6 1b __ INC ACCU + 0 
.l27:
383f : a5 1b __ LDA ACCU + 0 
3841 : a0 01 __ LDY #$01
3843 : d1 0d __ CMP (P0),y ; (si + 0)
3845 : 90 ef __ BCC $3836 ; (nforml.s28 + 0)
3847 : 4c 1a 38 JMP $381a ; (nforml.s23 + 0)
.l6:
384a : a5 11 __ LDA P4 ; (v + 0)
384c : 85 1b __ STA ACCU + 0 
384e : a5 12 __ LDA P5 ; (v + 1)
3850 : 85 1c __ STA ACCU + 1 
3852 : a5 13 __ LDA P6 ; (v + 2)
3854 : 85 1d __ STA ACCU + 2 
3856 : a5 14 __ LDA P7 ; (v + 3)
3858 : 85 1e __ STA ACCU + 3 
385a : a5 45 __ LDA T5 + 0 
385c : 85 03 __ STA WORK + 0 
385e : a5 46 __ LDA T5 + 1 
3860 : 85 04 __ STA WORK + 1 
3862 : a9 00 __ LDA #$00
3864 : 85 05 __ STA WORK + 2 
3866 : 85 06 __ STA WORK + 3 
3868 : 20 a4 44 JSR $44a4 ; (divmod32 + 0)
386b : a5 08 __ LDA WORK + 5 
386d : 30 08 __ BMI $3877 ; (nforml.s78 + 0)
.s1023:
386f : d0 0a __ BNE $387b ; (nforml.s77 + 0)
.s1022:
3871 : a5 07 __ LDA WORK + 4 
3873 : c9 0a __ CMP #$0a
3875 : b0 04 __ BCS $387b ; (nforml.s77 + 0)
.s78:
3877 : a9 30 __ LDA #$30
3879 : d0 02 __ BNE $387d ; (nforml.s79 + 0)
.s77:
387b : a9 37 __ LDA #$37
.s79:
387d : 18 __ __ CLC
387e : 65 07 __ ADC WORK + 4 
3880 : c6 44 __ DEC T2 + 0 
3882 : a6 44 __ LDX T2 + 0 
3884 : 9d f0 bf STA $bff0,x ; (buffer + 0)
3887 : a5 1b __ LDA ACCU + 0 
3889 : 85 11 __ STA P4 ; (v + 0)
388b : a5 1c __ LDA ACCU + 1 
388d : 85 12 __ STA P5 ; (v + 1)
388f : a5 1d __ LDA ACCU + 2 
3891 : 85 13 __ STA P6 ; (v + 2)
3893 : a5 1e __ LDA ACCU + 3 
3895 : 85 14 __ STA P7 ; (v + 3)
3897 : d0 b1 __ BNE $384a ; (nforml.l6 + 0)
.s1018:
3899 : a5 13 __ LDA P6 ; (v + 2)
389b : d0 ad __ BNE $384a ; (nforml.l6 + 0)
.s1019:
389d : a5 12 __ LDA P5 ; (v + 1)
389f : d0 a9 __ BNE $384a ; (nforml.l6 + 0)
.s1020:
38a1 : c5 11 __ CMP P4 ; (v + 0)
38a3 : 90 a5 __ BCC $384a ; (nforml.l6 + 0)
38a5 : 4c 80 37 JMP $3780 ; (nforml.s7 + 0)
--------------------------------------------------------------------
38a8 : __ __ __ BYT 57 52 49 54 45 20 44 41 54 41 2e 0a 00          : WRITE DATA...
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
38b5 : a5 0d __ LDA P0 
38b7 : a6 0e __ LDX P1 
38b9 : 20 68 ff JSR $ff68 
.s1001:
38bc : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam@proxy: ; krnio_setnam@proxy
38bd : a9 4c __ LDA #$4c
38bf : 85 0d __ STA P0 
38c1 : a9 bf __ LDA #$bf
38c3 : 85 0e __ STA P1 
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
38c5 : a5 0d __ LDA P0 
38c7 : 05 0e __ ORA P1 
38c9 : f0 08 __ BEQ $38d3 ; (krnio_setnam.s0 + 14)
38cb : a0 ff __ LDY #$ff
38cd : c8 __ __ INY
38ce : b1 0d __ LDA (P0),y 
38d0 : d0 fb __ BNE $38cd ; (krnio_setnam.s0 + 8)
38d2 : 98 __ __ TYA
38d3 : a6 0d __ LDX P0 
38d5 : a4 0e __ LDY P1 
38d7 : 20 bd ff JSR $ffbd 
.s1001:
38da : 60 __ __ RTS
--------------------------------------------------------------------
38db : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 4f 50 45 : RETURN VALUE OPE
38eb : __ __ __ BYT 4e 3a 20 25 44 0a 00                            : N: %D..
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
.s0:
38f2 : a9 00 __ LDA #$00
38f4 : 8d dc 45 STA $45dc ; (krnio_pstatus + 1)
38f7 : a9 00 __ LDA #$00
38f9 : 85 1b __ STA ACCU + 0 
38fb : 85 1c __ STA ACCU + 1 
38fd : a5 0d __ LDA P0 
38ff : a6 0e __ LDX P1 
3901 : a4 0f __ LDY P2 
3903 : 20 ba ff JSR $ffba 
3906 : 20 c0 ff JSR $ffc0 
3909 : 90 08 __ BCC $3913 ; (krnio_open.s0 + 33)
390b : a5 0d __ LDA P0 
390d : 20 c3 ff JSR $ffc3 
3910 : 4c 17 39 JMP $3917 ; (krnio_open.s1001 + 0)
3913 : a9 01 __ LDA #$01
3915 : 85 1b __ STA ACCU + 0 
.s1001:
3917 : a5 1b __ LDA ACCU + 0 
3919 : 60 __ __ RTS
--------------------------------------------------------------------
391a : __ __ __ BYT 53 54 41 54 55 53 20 41 46 54 45 52 20 4f 50 45 : STATUS AFTER OPE
392a : __ __ __ BYT 4e 3a 20 25 44 0a 00                            : N: %D..
--------------------------------------------------------------------
3931 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 57 52 49 : RETURN VALUE WRI
3941 : __ __ __ BYT 54 45 3a 20 25 44 0a 00                         : TE: %D..
--------------------------------------------------------------------
krnio_chkout: ; krnio_chkout(u8)->bool
.s1000:
3949 : 85 0d __ STA P0 
.s0:
394b : a6 0d __ LDX P0 
394d : 20 c9 ff JSR $ffc9 
3950 : a9 00 __ LDA #$00
3952 : b0 02 __ BCS $3956 ; (krnio_chkout.s0 + 11)
3954 : a9 01 __ LDA #$01
3956 : 85 1b __ STA ACCU + 0 
.s1001:
3958 : a5 1b __ LDA ACCU + 0 
395a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrout: ; krnio_chrout(u8)->void
.s1000:
395b : 85 0d __ STA P0 
.s0:
395d : a5 0d __ LDA P0 
395f : 20 d2 ff JSR $ffd2 
3962 : 85 1b __ STA ACCU + 0 
3964 : a9 00 __ LDA #$00
3966 : 85 1c __ STA ACCU + 1 
.s1001:
3968 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
.s0:
3969 : 20 cc ff JSR $ffcc 
.s1001:
396c : 60 __ __ RTS
--------------------------------------------------------------------
396d : __ __ __ BYT 53 54 41 54 55 53 20 41 46 54 45 52 20 57 52 49 : STATUS AFTER WRI
397d : __ __ __ BYT 54 45 3a 20 25 44 0a 00                         : TE: %D..
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
.s1000:
3985 : 85 0d __ STA P0 
.s0:
3987 : a5 0d __ LDA P0 
3989 : 20 c3 ff JSR $ffc3 
.s1001:
398c : 60 __ __ RTS
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
398d : a9 5b __ LDA #$5b
398f : 85 0d __ STA P0 
3991 : a9 bf __ LDA #$bf
3993 : 85 0e __ STA P1 
3995 : a9 51 __ LDA #$51
3997 : 85 11 __ STA P4 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
.s0:
3999 : a5 0f __ LDA P2 
399b : a6 12 __ LDX P5 
399d : f0 0c __ BEQ $39ab ; (memset.s0 + 18)
399f : a0 00 __ LDY #$00
39a1 : 91 0d __ STA (P0),y 
39a3 : c8 __ __ INY
39a4 : d0 fb __ BNE $39a1 ; (memset.s0 + 8)
39a6 : e6 0e __ INC P1 
39a8 : ca __ __ DEX
39a9 : d0 f6 __ BNE $39a1 ; (memset.s0 + 8)
39ab : a4 11 __ LDY P4 
39ad : f0 05 __ BEQ $39b4 ; (memset.s1001 + 0)
39af : 88 __ __ DEY
39b0 : 91 0d __ STA (P0),y 
39b2 : d0 fb __ BNE $39af ; (memset.s0 + 22)
.s1001:
39b4 : 60 __ __ RTS
--------------------------------------------------------------------
39b5 : __ __ __ BYT 52 45 41 44 20 44 41 54 41 2e 0a 00             : READ DATA...
--------------------------------------------------------------------
39c1 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 52 45 41 : RETURN VALUE REA
39d1 : __ __ __ BYT 44 3a 20 25 44 0a 00                            : D: %D..
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
.s1000:
39d8 : 85 0d __ STA P0 
.s0:
39da : a6 0d __ LDX P0 
39dc : 20 c6 ff JSR $ffc6 
39df : a9 00 __ LDA #$00
39e1 : 85 1c __ STA ACCU + 1 
39e3 : b0 02 __ BCS $39e7 ; (krnio_chkin.s0 + 13)
39e5 : a9 01 __ LDA #$01
39e7 : 85 1b __ STA ACCU + 0 
.s1001:
39e9 : a5 1b __ LDA ACCU + 0 
39eb : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->i16
.s0:
39ec : 20 cf ff JSR $ffcf 
39ef : 85 1b __ STA ACCU + 0 
39f1 : a9 00 __ LDA #$00
39f3 : 85 1c __ STA ACCU + 1 
.s1001:
39f5 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
.s0:
39f6 : 20 b7 ff JSR $ffb7 
39f9 : 85 1b __ STA ACCU + 0 
39fb : a9 00 __ LDA #$00
39fd : 85 1c __ STA ACCU + 1 
.s1001:
39ff : a5 1b __ LDA ACCU + 0 
3a01 : 60 __ __ RTS
--------------------------------------------------------------------
3a02 : __ __ __ BYT 53 54 41 54 55 53 20 41 46 54 45 52 20 52 45 41 : STATUS AFTER REA
3a12 : __ __ __ BYT 44 3a 20 25 44 0a 00                            : D: %D..
--------------------------------------------------------------------
3a19 : __ __ __ BYT 44 41 54 41 20 52 45 41 44 3a 0a 25 53 0a 00    : DATA READ:.%S..
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
3a28 : 20 36 3a JSR $3a36 ; (getpch + 0)
3a2b : c9 00 __ CMP #$00
3a2d : f0 f9 __ BEQ $3a28 ; (getch.s0 + 0)
3a2f : 85 1b __ STA ACCU + 0 
3a31 : a9 00 __ LDA #$00
3a33 : 85 1c __ STA ACCU + 1 
.s1001:
3a35 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
3a36 : 20 e4 ff JSR $ffe4 
3a39 : ae 9a 45 LDX $459a ; (giocharmap + 0)
3a3c : e0 01 __ CPX #$01
3a3e : 90 26 __ BCC $3a66 ; (getpch + 48)
3a40 : c9 0d __ CMP #$0d
3a42 : d0 02 __ BNE $3a46 ; (getpch + 16)
3a44 : a9 0a __ LDA #$0a
3a46 : e0 02 __ CPX #$02
3a48 : 90 1c __ BCC $3a66 ; (getpch + 48)
3a4a : c9 db __ CMP #$db
3a4c : b0 18 __ BCS $3a66 ; (getpch + 48)
3a4e : c9 41 __ CMP #$41
3a50 : 90 14 __ BCC $3a66 ; (getpch + 48)
3a52 : c9 c1 __ CMP #$c1
3a54 : 90 02 __ BCC $3a58 ; (getpch + 34)
3a56 : 49 a0 __ EOR #$a0
3a58 : c9 7b __ CMP #$7b
3a5a : b0 0a __ BCS $3a66 ; (getpch + 48)
3a5c : c9 61 __ CMP #$61
3a5e : b0 04 __ BCS $3a64 ; (getpch + 46)
3a60 : c9 5b __ CMP #$5b
3a62 : b0 02 __ BCS $3a66 ; (getpch + 48)
3a64 : 49 20 __ EOR #$20
3a66 : 60 __ __ RTS
--------------------------------------------------------------------
3a67 : __ __ __ BYT 4e 4f 57 20 41 20 53 41 56 45 20 41 4e 44 20 4c : NOW A SAVE AND L
3a77 : __ __ __ BYT 4f 41 44 20 54 45 53 54 2e 00                   : OAD TEST..
--------------------------------------------------------------------
3a81 : __ __ __ BYT 54 45 53 54 32 00                               : TEST2.
--------------------------------------------------------------------
3a87 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 53 41 56 : RETURN VALUE SAV
3a97 : __ __ __ BYT 45 3a 20 25 44 0a 00                            : E: %D..
--------------------------------------------------------------------
krnio_save: ; krnio_save(u8,const u8*,const u8*)->bool
.s0:
3a9e : a9 00 __ LDA #$00
3aa0 : a6 0d __ LDX P0 
3aa2 : a0 00 __ LDY #$00
3aa4 : 20 ba ff JSR $ffba 
3aa7 : a9 0e __ LDA #$0e
3aa9 : a6 10 __ LDX P3 
3aab : a4 11 __ LDY P4 
3aad : 20 d8 ff JSR $ffd8 
3ab0 : a9 00 __ LDA #$00
3ab2 : b0 02 __ BCS $3ab6 ; (krnio_save.s0 + 24)
3ab4 : a9 01 __ LDA #$01
3ab6 : 85 1b __ STA ACCU + 0 
.s1001:
3ab8 : a5 1b __ LDA ACCU + 0 
3aba : 60 __ __ RTS
--------------------------------------------------------------------
3abb : __ __ __ BYT 4c 4f 41 44 20 44 41 54 41 2e 0a 00             : LOAD DATA...
--------------------------------------------------------------------
3ac7 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 4c 4f 41 : RETURN VALUE LOA
3ad7 : __ __ __ BYT 44 3a 20 25 44 0a 00                            : D: %D..
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
3ade : a5 0d __ LDA P0 
3ae0 : a6 0e __ LDX P1 
3ae2 : a4 0f __ LDY P2 
3ae4 : 20 ba ff JSR $ffba 
3ae7 : a9 00 __ LDA #$00
3ae9 : a2 00 __ LDX #$00
3aeb : a0 00 __ LDY #$00
3aed : 20 d5 ff JSR $ffd5 
3af0 : a9 00 __ LDA #$00
3af2 : b0 02 __ BCS $3af6 ; (krnio_load.s0 + 24)
3af4 : a9 01 __ LDA #$01
3af6 : 85 1b __ STA ACCU + 0 
.s1001:
3af8 : a5 1b __ LDA ACCU + 0 
3afa : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
3afb : 20 81 ff JSR $ff81 
.s1001:
3afe : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
3aff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
3b00 : __ __ __ BYT 73 77 69 74 63 68 20 74 6f 20 38 30 20 63 6f 6c : switch to 80 col
3b10 : __ __ __ BYT 75 6d 6e 20 73 63 72 65 65 6e 0a 61 6e 64 20 70 : umn screen.and p
3b20 : __ __ __ BYT 72 65 73 73 20 6b 65 79 2e 0a 00                : ress key...
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
3b2b : 24 d7 __ BIT $d7 
3b2d : 30 03 __ BMI $3b32 ; (screen_setmode.s1001 + 0)
.s6:
3b2f : 20 5f ff JSR $ff5f 
.s1001:
3b32 : 60 __ __ RTS
--------------------------------------------------------------------
3b33 : __ __ __ BYT 4f 56 4c 31 00                                  : OVL1.
--------------------------------------------------------------------
3b38 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
3b48 : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 00          : FILE FAILED..
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
3b55 : a5 0d __ LDA P0 
3b57 : 85 1b __ STA ACCU + 0 
3b59 : a5 0e __ LDA P1 
3b5b : 85 1c __ STA ACCU + 1 
3b5d : ae ff 3a LDX $3aff ; (spentry + 0)
3b60 : 9a __ __ TXS
3b61 : a9 4c __ LDA #$4c
3b63 : 85 54 __ STA $54 
3b65 : a9 00 __ LDA #$00
3b67 : 85 13 __ STA P6 
.s1001:
3b69 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
3b6a : a2 04 __ LDX #$04
3b6c : b5 53 __ LDA T3 + 0,x 
3b6e : 9d ac bf STA $bfac,x ; (vdc_set_mode@stack + 0)
3b71 : ca __ __ DEX
3b72 : 10 f8 __ BPL $3b6c ; (vdc_set_mode.s1000 + 2)
3b74 : 38 __ __ SEC
3b75 : a5 23 __ LDA SP + 0 
3b77 : e9 08 __ SBC #$08
3b79 : 85 23 __ STA SP + 0 
3b7b : b0 02 __ BCS $3b7f ; (vdc_set_mode.s0 + 0)
3b7d : c6 24 __ DEC SP + 1 
.s0:
3b7f : a9 00 __ LDA #$00
3b81 : 85 4f __ STA T0 + 0 
3b83 : 38 __ __ SEC
3b84 : e5 16 __ SBC P9 ; (mode + 0)
3b86 : 29 20 __ AND #$20
3b88 : 85 50 __ STA T2 + 0 
3b8a : aa __ __ TAX
3b8b : 18 __ __ CLC
3b8c : 69 9b __ ADC #$9b
3b8e : 85 53 __ STA T3 + 0 
3b90 : a9 45 __ LDA #$45
3b92 : 69 00 __ ADC #$00
3b94 : 85 54 __ STA T3 + 1 
3b96 : bd 9f 45 LDA $459f,x ; (vdc_modes + 4)
3b99 : f0 0a __ BEQ $3ba5 ; (vdc_set_mode.s3 + 0)
.s4:
3b9b : ad eb 45 LDA $45eb ; (vdc_state + 0)
3b9e : c9 10 __ CMP #$10
3ba0 : d0 03 __ BNE $3ba5 ; (vdc_set_mode.s3 + 0)
3ba2 : 4c 27 3e JMP $3e27 ; (vdc_set_mode.s1001 + 0)
.s3:
3ba5 : a0 00 __ LDY #$00
3ba7 : b1 53 __ LDA (T3 + 0),y 
3ba9 : 8d ee 45 STA $45ee ; (vdc_state + 3)
3bac : c8 __ __ INY
3bad : b1 53 __ LDA (T3 + 0),y 
3baf : 8d ef 45 STA $45ef ; (vdc_state + 4)
3bb2 : c8 __ __ INY
3bb3 : b1 53 __ LDA (T3 + 0),y 
3bb5 : 8d f0 45 STA $45f0 ; (vdc_state + 5)
3bb8 : c8 __ __ INY
3bb9 : b1 53 __ LDA (T3 + 0),y 
3bbb : 8d f1 45 STA $45f1 ; (vdc_state + 6)
3bbe : a0 09 __ LDY #$09
3bc0 : b1 53 __ LDA (T3 + 0),y 
3bc2 : 8d f7 45 STA $45f7 ; (vdc_state + 12)
3bc5 : c8 __ __ INY
3bc6 : b1 53 __ LDA (T3 + 0),y 
3bc8 : 8d f8 45 STA $45f8 ; (vdc_state + 13)
3bcb : c8 __ __ INY
3bcc : b1 53 __ LDA (T3 + 0),y 
3bce : 8d f9 45 STA $45f9 ; (vdc_state + 14)
3bd1 : c8 __ __ INY
3bd2 : b1 53 __ LDA (T3 + 0),y 
3bd4 : 8d fa 45 STA $45fa ; (vdc_state + 15)
3bd7 : c8 __ __ INY
3bd8 : b1 53 __ LDA (T3 + 0),y 
3bda : 8d fb 45 STA $45fb ; (vdc_state + 16)
3bdd : c8 __ __ INY
3bde : b1 53 __ LDA (T3 + 0),y 
3be0 : 8d fc 45 STA $45fc ; (vdc_state + 17)
3be3 : c8 __ __ INY
3be4 : b1 53 __ LDA (T3 + 0),y 
3be6 : 8d fd 45 STA $45fd ; (vdc_state + 18)
3be9 : c8 __ __ INY
3bea : b1 53 __ LDA (T3 + 0),y 
3bec : 8d fe 45 STA $45fe ; (vdc_state + 19)
3bef : c8 __ __ INY
3bf0 : b1 53 __ LDA (T3 + 0),y 
3bf2 : 8d ff 45 STA $45ff ; (vdc_state + 20)
3bf5 : c8 __ __ INY
3bf6 : b1 53 __ LDA (T3 + 0),y 
3bf8 : 8d 00 46 STA $4600 ; (vdc_state + 21)
3bfb : a0 05 __ LDY #$05
3bfd : b1 53 __ LDA (T3 + 0),y 
3bff : 85 55 __ STA T4 + 0 
3c01 : c8 __ __ INY
3c02 : b1 53 __ LDA (T3 + 0),y 
3c04 : 8d f4 45 STA $45f4 ; (vdc_state + 9)
3c07 : 85 44 __ STA T6 + 0 
3c09 : a5 55 __ LDA T4 + 0 
3c0b : 8d f3 45 STA $45f3 ; (vdc_state + 8)
3c0e : c8 __ __ INY
3c0f : b1 53 __ LDA (T3 + 0),y 
3c11 : 85 57 __ STA T5 + 0 
3c13 : c8 __ __ INY
3c14 : b1 53 __ LDA (T3 + 0),y 
3c16 : 8d f6 45 STA $45f6 ; (vdc_state + 11)
3c19 : a8 __ __ TAY
3c1a : a5 57 __ LDA T5 + 0 
3c1c : 8d f5 45 STA $45f5 ; (vdc_state + 10)
3c1f : a9 0c __ LDA #$0c
3c21 : 8d 00 d6 STA $d600 
.l1515:
3c24 : 2c 00 d6 BIT $d600 
3c27 : 10 fb __ BPL $3c24 ; (vdc_set_mode.l1515 + 0)
.s11:
3c29 : a5 44 __ LDA T6 + 0 
3c2b : 8d 01 d6 STA $d601 
3c2e : a9 0d __ LDA #$0d
3c30 : 8d 00 d6 STA $d600 
.l1517:
3c33 : 2c 00 d6 BIT $d600 
3c36 : 10 fb __ BPL $3c33 ; (vdc_set_mode.l1517 + 0)
.s16:
3c38 : a5 55 __ LDA T4 + 0 
3c3a : 8d 01 d6 STA $d601 
3c3d : a9 14 __ LDA #$14
3c3f : 8d 00 d6 STA $d600 
.l1519:
3c42 : 2c 00 d6 BIT $d600 
3c45 : 10 fb __ BPL $3c42 ; (vdc_set_mode.l1519 + 0)
.s21:
3c47 : 8c 01 d6 STY $d601 
3c4a : a9 15 __ LDA #$15
3c4c : 8d 00 d6 STA $d600 
.l1521:
3c4f : 2c 00 d6 BIT $d600 
3c52 : 10 fb __ BPL $3c4f ; (vdc_set_mode.l1521 + 0)
.s26:
3c54 : a5 57 __ LDA T5 + 0 
3c56 : 8d 01 d6 STA $d601 
3c59 : bd a9 45 LDA $45a9,x ; (vdc_modes + 14)
3c5c : 85 56 __ STA T4 + 1 
3c5e : a9 1c __ LDA #$1c
3c60 : 8d 00 d6 STA $d600 
.l1523:
3c63 : 2c 00 d6 BIT $d600 
3c66 : 10 fb __ BPL $3c63 ; (vdc_set_mode.l1523 + 0)
.s32:
3c68 : ad 01 d6 LDA $d601 
3c6b : 29 1f __ AND #$1f
3c6d : 85 57 __ STA T5 + 0 
3c6f : a9 06 __ LDA #$06
3c71 : a0 02 __ LDY #$02
3c73 : 91 23 __ STA (SP + 0),y 
3c75 : a9 40 __ LDA #$40
3c77 : c8 __ __ INY
3c78 : 91 23 __ STA (SP + 0),y 
3c7a : a9 1c __ LDA #$1c
3c7c : 8d 00 d6 STA $d600 
.l1525:
3c7f : 2c 00 d6 BIT $d600 
3c82 : 10 fb __ BPL $3c7f ; (vdc_set_mode.l1525 + 0)
.s39:
3c84 : ad 01 d6 LDA $d601 
3c87 : a0 04 __ LDY #$04
3c89 : 91 23 __ STA (SP + 0),y 
3c8b : a9 00 __ LDA #$00
3c8d : c8 __ __ INY
3c8e : 91 23 __ STA (SP + 0),y 
3c90 : a5 57 __ LDA T5 + 0 
3c92 : c8 __ __ INY
3c93 : 91 23 __ STA (SP + 0),y 
3c95 : a9 00 __ LDA #$00
3c97 : c8 __ __ INY
3c98 : 91 23 __ STA (SP + 0),y 
3c9a : 20 4b 32 JSR $324b ; (printf.s1000 + 0)
3c9d : a9 1c __ LDA #$1c
3c9f : 8d 00 d6 STA $d600 
3ca2 : a5 56 __ LDA T4 + 1 
3ca4 : 29 e0 __ AND #$e0
3ca6 : 18 __ __ CLC
3ca7 : 65 57 __ ADC T5 + 0 
.l1527:
3ca9 : 2c 00 d6 BIT $d600 
3cac : 10 fb __ BPL $3ca9 ; (vdc_set_mode.l1527 + 0)
.s46:
3cae : 8d 01 d6 STA $d601 
3cb1 : 18 __ __ CLC
3cb2 : a9 ae __ LDA #$ae
3cb4 : 65 50 __ ADC T2 + 0 
3cb6 : 85 50 __ STA T2 + 0 
3cb8 : a9 45 __ LDA #$45
3cba : 69 00 __ ADC #$00
3cbc : 85 51 __ STA T2 + 1 
.l47:
3cbe : a4 4f __ LDY T0 + 0 
3cc0 : b1 50 __ LDA (T2 + 0),y 
3cc2 : 85 46 __ STA T7 + 0 
3cc4 : c8 __ __ INY
3cc5 : b1 50 __ LDA (T2 + 0),y 
3cc7 : aa __ __ TAX
3cc8 : a5 46 __ LDA T7 + 0 
3cca : 8d 00 d6 STA $d600 
3ccd : c8 __ __ INY
3cce : 84 4f __ STY T0 + 0 
.l1529:
3cd0 : 2c 00 d6 BIT $d600 
3cd3 : 10 fb __ BPL $3cd0 ; (vdc_set_mode.l1529 + 0)
.s53:
3cd5 : 8e 01 d6 STX $d601 
3cd8 : 18 __ __ CLC
3cd9 : a5 53 __ LDA T3 + 0 
3cdb : 65 4f __ ADC T0 + 0 
3cdd : 85 55 __ STA T4 + 0 
3cdf : a5 54 __ LDA T3 + 1 
3ce1 : 69 00 __ ADC #$00
3ce3 : 85 56 __ STA T4 + 1 
3ce5 : a0 13 __ LDY #$13
3ce7 : b1 55 __ LDA (T4 + 0),y 
3ce9 : c9 ff __ CMP #$ff
3ceb : d0 d1 __ BNE $3cbe ; (vdc_set_mode.l47 + 0)
.s48:
3ced : a0 04 __ LDY #$04
3cef : b1 53 __ LDA (T3 + 0),y 
3cf1 : f0 05 __ BEQ $3cf8 ; (vdc_set_mode.s55 + 0)
.s57:
3cf3 : ad ec 45 LDA $45ec ; (vdc_state + 1)
3cf6 : f0 11 __ BEQ $3d09 ; (vdc_set_mode.s54 + 0)
.s55:
3cf8 : a9 00 __ LDA #$00
3cfa : 85 4f __ STA T0 + 0 
3cfc : ad ee 45 LDA $45ee ; (vdc_state + 3)
3cff : 85 50 __ STA T2 + 0 
3d01 : ad f0 45 LDA $45f0 ; (vdc_state + 5)
3d04 : 85 53 __ STA T3 + 0 
3d06 : 4c 1d 3f JMP $3f1d ; (vdc_set_mode.l236 + 0)
.s54:
3d09 : ad eb 45 LDA $45eb ; (vdc_state + 0)
3d0c : c9 10 __ CMP #$10
3d0e : d0 03 __ BNE $3d13 ; (vdc_set_mode.s62 + 0)
3d10 : 4c 27 3e JMP $3e27 ; (vdc_set_mode.s1001 + 0)
.s62:
3d13 : ad ec 45 LDA $45ec ; (vdc_state + 1)
3d16 : f0 03 __ BEQ $3d1b ; (vdc_set_mode.s61 + 0)
3d18 : 4c 27 3e JMP $3e27 ; (vdc_set_mode.s1001 + 0)
.s61:
3d1b : a9 22 __ LDA #$22
3d1d : 8d 00 d6 STA $d600 
.l1559:
3d20 : 2c 00 d6 BIT $d600 
3d23 : 10 fb __ BPL $3d20 ; (vdc_set_mode.l1559 + 0)
.s69:
3d25 : a9 80 __ LDA #$80
3d27 : 8d 01 d6 STA $d601 
3d2a : a0 ff __ LDY #$ff
3d2c : a2 00 __ LDX #$00
.l72:
3d2e : a9 12 __ LDA #$12
3d30 : 8d 00 d6 STA $d600 
.l1561:
3d33 : 2c 00 d6 BIT $d600 
3d36 : 10 fb __ BPL $3d33 ; (vdc_set_mode.l1561 + 0)
.s81:
3d38 : 8e 01 d6 STX $d601 
3d3b : a9 13 __ LDA #$13
3d3d : 8d 00 d6 STA $d600 
.l1563:
3d40 : 2c 00 d6 BIT $d600 
3d43 : 10 fb __ BPL $3d40 ; (vdc_set_mode.l1563 + 0)
.s86:
3d45 : a9 00 __ LDA #$00
3d47 : 8d 01 d6 STA $d601 
3d4a : a9 1f __ LDA #$1f
3d4c : 8d 00 d6 STA $d600 
.l1565:
3d4f : 2c 00 d6 BIT $d600 
3d52 : 10 fb __ BPL $3d4f ; (vdc_set_mode.l1565 + 0)
.s90:
3d54 : a9 00 __ LDA #$00
3d56 : 8d 01 d6 STA $d601 
3d59 : a9 18 __ LDA #$18
3d5b : 8d 00 d6 STA $d600 
.l1567:
3d5e : 2c 00 d6 BIT $d600 
3d61 : 10 fb __ BPL $3d5e ; (vdc_set_mode.l1567 + 0)
.s96:
3d63 : ad 01 d6 LDA $d601 
3d66 : 29 7f __ AND #$7f
3d68 : 85 53 __ STA T3 + 0 
3d6a : a9 18 __ LDA #$18
3d6c : 8d 00 d6 STA $d600 
.l1569:
3d6f : 2c 00 d6 BIT $d600 
3d72 : 10 fb __ BPL $3d6f ; (vdc_set_mode.l1569 + 0)
.s102:
3d74 : a5 53 __ LDA T3 + 0 
3d76 : 8d 01 d6 STA $d601 
3d79 : a9 1e __ LDA #$1e
3d7b : 8d 00 d6 STA $d600 
.l1571:
3d7e : 2c 00 d6 BIT $d600 
3d81 : 10 fb __ BPL $3d7e ; (vdc_set_mode.l1571 + 0)
.s107:
3d83 : a9 ff __ LDA #$ff
3d85 : 8d 01 d6 STA $d601 
3d88 : e8 __ __ INX
3d89 : 88 __ __ DEY
3d8a : d0 a2 __ BNE $3d2e ; (vdc_set_mode.l72 + 0)
.s74:
3d8c : a9 12 __ LDA #$12
3d8e : 8d 00 d6 STA $d600 
.l1574:
3d91 : 2c 00 d6 BIT $d600 
3d94 : 10 fb __ BPL $3d91 ; (vdc_set_mode.l1574 + 0)
.s114:
3d96 : 8e 01 d6 STX $d601 
3d99 : a9 13 __ LDA #$13
3d9b : 8d 00 d6 STA $d600 
.l1576:
3d9e : 2c 00 d6 BIT $d600 
3da1 : 10 fb __ BPL $3d9e ; (vdc_set_mode.l1576 + 0)
.s119:
3da3 : 8c 01 d6 STY $d601 
3da6 : a9 1f __ LDA #$1f
3da8 : 8d 00 d6 STA $d600 
.l1578:
3dab : 2c 00 d6 BIT $d600 
3dae : 10 fb __ BPL $3dab ; (vdc_set_mode.l1578 + 0)
.s123:
3db0 : 8c 01 d6 STY $d601 
3db3 : a9 18 __ LDA #$18
3db5 : 8d 00 d6 STA $d600 
.l1580:
3db8 : 2c 00 d6 BIT $d600 
3dbb : 10 fb __ BPL $3db8 ; (vdc_set_mode.l1580 + 0)
.s129:
3dbd : ad 01 d6 LDA $d601 
3dc0 : 29 7f __ AND #$7f
3dc2 : aa __ __ TAX
3dc3 : a9 18 __ LDA #$18
3dc5 : 8d 00 d6 STA $d600 
.l1582:
3dc8 : 2c 00 d6 BIT $d600 
3dcb : 10 fb __ BPL $3dc8 ; (vdc_set_mode.l1582 + 0)
.s135:
3dcd : 8e 01 d6 STX $d601 
3dd0 : a9 1e __ LDA #$1e
3dd2 : 8d 00 d6 STA $d600 
.l1584:
3dd5 : 2c 00 d6 BIT $d600 
3dd8 : 10 fb __ BPL $3dd5 ; (vdc_set_mode.l1584 + 0)
.s140:
3dda : a9 ff __ LDA #$ff
3ddc : 8d 01 d6 STA $d601 
3ddf : a9 1c __ LDA #$1c
3de1 : 8d 00 d6 STA $d600 
.l1586:
3de4 : 2c 00 d6 BIT $d600 
3de7 : 10 fb __ BPL $3de4 ; (vdc_set_mode.l1586 + 0)
.s146:
3de9 : ad 01 d6 LDA $d601 
3dec : 09 10 __ ORA #$10
3dee : aa __ __ TAX
3def : a9 1c __ LDA #$1c
3df1 : 8d 00 d6 STA $d600 
.l1588:
3df4 : 2c 00 d6 BIT $d600 
3df7 : 10 fb __ BPL $3df4 ; (vdc_set_mode.l1588 + 0)
.s152:
3df9 : 8e 01 d6 STX $d601 
3dfc : 20 0e 40 JSR $400e ; (vdc_restore_charsets.s0 + 0)
3dff : a9 00 __ LDA #$00
3e01 : 85 4f __ STA T0 + 0 
3e03 : ad ee 45 LDA $45ee ; (vdc_state + 3)
3e06 : 85 50 __ STA T2 + 0 
3e08 : ad f0 45 LDA $45f0 ; (vdc_state + 5)
3e0b : 85 53 __ STA T3 + 0 
.l155:
3e0d : a5 4f __ LDA T0 + 0 
3e0f : c5 53 __ CMP T3 + 0 
3e11 : 90 2a __ BCC $3e3d ; (vdc_set_mode.s156 + 0)
.s153:
3e13 : a9 22 __ LDA #$22
3e15 : 8d 00 d6 STA $d600 
.l1614:
3e18 : 2c 00 d6 BIT $d600 
3e1b : 10 fb __ BPL $3e18 ; (vdc_set_mode.l1614 + 0)
.s233:
3e1d : a9 7d __ LDA #$7d
3e1f : 8d 01 d6 STA $d601 
3e22 : a9 01 __ LDA #$01
3e24 : 8d ec 45 STA $45ec ; (vdc_state + 1)
.s1001:
3e27 : 18 __ __ CLC
3e28 : a5 23 __ LDA SP + 0 
3e2a : 69 08 __ ADC #$08
3e2c : 85 23 __ STA SP + 0 
3e2e : 90 02 __ BCC $3e32 ; (vdc_set_mode.s1001 + 11)
3e30 : e6 24 __ INC SP + 1 
3e32 : a2 04 __ LDX #$04
3e34 : bd ac bf LDA $bfac,x ; (vdc_set_mode@stack + 0)
3e37 : 95 53 __ STA T3 + 0,x 
3e39 : ca __ __ DEX
3e3a : 10 f8 __ BPL $3e34 ; (vdc_set_mode.s1001 + 13)
3e3c : 60 __ __ RTS
.s156:
3e3d : ad ee 45 LDA $45ee ; (vdc_state + 3)
3e40 : 85 1b __ STA ACCU + 0 
3e42 : ad ef 45 LDA $45ef ; (vdc_state + 4)
3e45 : 85 1c __ STA ACCU + 1 
3e47 : ad f2 45 LDA $45f2 ; (vdc_state + 7)
3e4a : 85 43 __ STA T1 + 0 
3e4c : a9 12 __ LDA #$12
3e4e : 8d 00 d6 STA $d600 
3e51 : a6 50 __ LDX T2 + 0 
3e53 : ca __ __ DEX
3e54 : 86 44 __ STX T6 + 0 
3e56 : a5 4f __ LDA T0 + 0 
3e58 : 20 ff 43 JSR $43ff ; (mul16by8 + 0)
3e5b : 18 __ __ CLC
3e5c : a5 05 __ LDA WORK + 2 
3e5e : 6d f3 45 ADC $45f3 ; (vdc_state + 8)
3e61 : aa __ __ TAX
3e62 : a5 06 __ LDA WORK + 3 
3e64 : 6d f4 45 ADC $45f4 ; (vdc_state + 9)
.l1590:
3e67 : 2c 00 d6 BIT $d600 
3e6a : 10 fb __ BPL $3e67 ; (vdc_set_mode.l1590 + 0)
.s168:
3e6c : 8d 01 d6 STA $d601 
3e6f : a9 13 __ LDA #$13
3e71 : 8d 00 d6 STA $d600 
.l1592:
3e74 : 2c 00 d6 BIT $d600 
3e77 : 10 fb __ BPL $3e74 ; (vdc_set_mode.l1592 + 0)
.s173:
3e79 : 8e 01 d6 STX $d601 
3e7c : a9 1f __ LDA #$1f
3e7e : 8d 00 d6 STA $d600 
.l1594:
3e81 : 2c 00 d6 BIT $d600 
3e84 : 10 fb __ BPL $3e81 ; (vdc_set_mode.l1594 + 0)
.s177:
3e86 : a9 20 __ LDA #$20
3e88 : 8d 01 d6 STA $d601 
3e8b : a9 18 __ LDA #$18
3e8d : 8d 00 d6 STA $d600 
.l1596:
3e90 : 2c 00 d6 BIT $d600 
3e93 : 10 fb __ BPL $3e90 ; (vdc_set_mode.l1596 + 0)
.s183:
3e95 : ad 01 d6 LDA $d601 
3e98 : 29 7f __ AND #$7f
3e9a : aa __ __ TAX
3e9b : a9 18 __ LDA #$18
3e9d : 8d 00 d6 STA $d600 
.l1598:
3ea0 : 2c 00 d6 BIT $d600 
3ea3 : 10 fb __ BPL $3ea0 ; (vdc_set_mode.l1598 + 0)
.s189:
3ea5 : 8e 01 d6 STX $d601 
3ea8 : a9 1e __ LDA #$1e
3eaa : 8d 00 d6 STA $d600 
.l1600:
3ead : 2c 00 d6 BIT $d600 
3eb0 : 10 fb __ BPL $3ead ; (vdc_set_mode.l1600 + 0)
.s194:
3eb2 : a5 44 __ LDA T6 + 0 
3eb4 : 8d 01 d6 STA $d601 
3eb7 : ad f5 45 LDA $45f5 ; (vdc_state + 10)
3eba : 18 __ __ CLC
3ebb : 65 05 __ ADC WORK + 2 
3ebd : aa __ __ TAX
3ebe : a9 12 __ LDA #$12
3ec0 : 8d 00 d6 STA $d600 
3ec3 : ad f6 45 LDA $45f6 ; (vdc_state + 11)
3ec6 : 65 06 __ ADC WORK + 3 
.l1602:
3ec8 : 2c 00 d6 BIT $d600 
3ecb : 10 fb __ BPL $3ec8 ; (vdc_set_mode.l1602 + 0)
.s201:
3ecd : 8d 01 d6 STA $d601 
3ed0 : a9 13 __ LDA #$13
3ed2 : 8d 00 d6 STA $d600 
.l1604:
3ed5 : 2c 00 d6 BIT $d600 
3ed8 : 10 fb __ BPL $3ed5 ; (vdc_set_mode.l1604 + 0)
.s206:
3eda : 8e 01 d6 STX $d601 
3edd : a9 1f __ LDA #$1f
3edf : 8d 00 d6 STA $d600 
.l1606:
3ee2 : 2c 00 d6 BIT $d600 
3ee5 : 10 fb __ BPL $3ee2 ; (vdc_set_mode.l1606 + 0)
.s210:
3ee7 : a5 43 __ LDA T1 + 0 
3ee9 : 8d 01 d6 STA $d601 
3eec : a9 18 __ LDA #$18
3eee : 8d 00 d6 STA $d600 
.l1608:
3ef1 : 2c 00 d6 BIT $d600 
3ef4 : 10 fb __ BPL $3ef1 ; (vdc_set_mode.l1608 + 0)
.s216:
3ef6 : ad 01 d6 LDA $d601 
3ef9 : 29 7f __ AND #$7f
3efb : aa __ __ TAX
3efc : a9 18 __ LDA #$18
3efe : 8d 00 d6 STA $d600 
.l1610:
3f01 : 2c 00 d6 BIT $d600 
3f04 : 10 fb __ BPL $3f01 ; (vdc_set_mode.l1610 + 0)
.s222:
3f06 : 8e 01 d6 STX $d601 
3f09 : a9 1e __ LDA #$1e
3f0b : 8d 00 d6 STA $d600 
.l1612:
3f0e : 2c 00 d6 BIT $d600 
3f11 : 10 fb __ BPL $3f0e ; (vdc_set_mode.l1612 + 0)
.s227:
3f13 : a5 44 __ LDA T6 + 0 
3f15 : 8d 01 d6 STA $d601 
3f18 : e6 4f __ INC T0 + 0 
3f1a : 4c 0d 3e JMP $3e0d ; (vdc_set_mode.l155 + 0)
.l236:
3f1d : a5 4f __ LDA T0 + 0 
3f1f : c5 53 __ CMP T3 + 0 
3f21 : 90 03 __ BCC $3f26 ; (vdc_set_mode.s237 + 0)
3f23 : 4c 27 3e JMP $3e27 ; (vdc_set_mode.s1001 + 0)
.s237:
3f26 : ad ee 45 LDA $45ee ; (vdc_state + 3)
3f29 : 85 1b __ STA ACCU + 0 
3f2b : ad ef 45 LDA $45ef ; (vdc_state + 4)
3f2e : 85 1c __ STA ACCU + 1 
3f30 : ad f2 45 LDA $45f2 ; (vdc_state + 7)
3f33 : 85 43 __ STA T1 + 0 
3f35 : a9 12 __ LDA #$12
3f37 : 8d 00 d6 STA $d600 
3f3a : a6 50 __ LDX T2 + 0 
3f3c : ca __ __ DEX
3f3d : 86 44 __ STX T6 + 0 
3f3f : a5 4f __ LDA T0 + 0 
3f41 : 20 ff 43 JSR $43ff ; (mul16by8 + 0)
3f44 : 18 __ __ CLC
3f45 : a5 05 __ LDA WORK + 2 
3f47 : 6d f3 45 ADC $45f3 ; (vdc_state + 8)
3f4a : aa __ __ TAX
3f4b : a5 06 __ LDA WORK + 3 
3f4d : 6d f4 45 ADC $45f4 ; (vdc_state + 9)
.l1534:
3f50 : 2c 00 d6 BIT $d600 
3f53 : 10 fb __ BPL $3f50 ; (vdc_set_mode.l1534 + 0)
.s249:
3f55 : 8d 01 d6 STA $d601 
3f58 : a9 13 __ LDA #$13
3f5a : 8d 00 d6 STA $d600 
.l1536:
3f5d : 2c 00 d6 BIT $d600 
3f60 : 10 fb __ BPL $3f5d ; (vdc_set_mode.l1536 + 0)
.s254:
3f62 : 8e 01 d6 STX $d601 
3f65 : a9 1f __ LDA #$1f
3f67 : 8d 00 d6 STA $d600 
.l1538:
3f6a : 2c 00 d6 BIT $d600 
3f6d : 10 fb __ BPL $3f6a ; (vdc_set_mode.l1538 + 0)
.s258:
3f6f : a9 20 __ LDA #$20
3f71 : 8d 01 d6 STA $d601 
3f74 : a9 18 __ LDA #$18
3f76 : 8d 00 d6 STA $d600 
.l1540:
3f79 : 2c 00 d6 BIT $d600 
3f7c : 10 fb __ BPL $3f79 ; (vdc_set_mode.l1540 + 0)
.s264:
3f7e : ad 01 d6 LDA $d601 
3f81 : 29 7f __ AND #$7f
3f83 : aa __ __ TAX
3f84 : a9 18 __ LDA #$18
3f86 : 8d 00 d6 STA $d600 
.l1542:
3f89 : 2c 00 d6 BIT $d600 
3f8c : 10 fb __ BPL $3f89 ; (vdc_set_mode.l1542 + 0)
.s270:
3f8e : 8e 01 d6 STX $d601 
3f91 : a9 1e __ LDA #$1e
3f93 : 8d 00 d6 STA $d600 
.l1544:
3f96 : 2c 00 d6 BIT $d600 
3f99 : 10 fb __ BPL $3f96 ; (vdc_set_mode.l1544 + 0)
.s275:
3f9b : a5 44 __ LDA T6 + 0 
3f9d : 8d 01 d6 STA $d601 
3fa0 : ad f5 45 LDA $45f5 ; (vdc_state + 10)
3fa3 : 18 __ __ CLC
3fa4 : 65 05 __ ADC WORK + 2 
3fa6 : aa __ __ TAX
3fa7 : a9 12 __ LDA #$12
3fa9 : 8d 00 d6 STA $d600 
3fac : ad f6 45 LDA $45f6 ; (vdc_state + 11)
3faf : 65 06 __ ADC WORK + 3 
.l1546:
3fb1 : 2c 00 d6 BIT $d600 
3fb4 : 10 fb __ BPL $3fb1 ; (vdc_set_mode.l1546 + 0)
.s282:
3fb6 : 8d 01 d6 STA $d601 
3fb9 : a9 13 __ LDA #$13
3fbb : 8d 00 d6 STA $d600 
.l1548:
3fbe : 2c 00 d6 BIT $d600 
3fc1 : 10 fb __ BPL $3fbe ; (vdc_set_mode.l1548 + 0)
.s287:
3fc3 : 8e 01 d6 STX $d601 
3fc6 : a9 1f __ LDA #$1f
3fc8 : 8d 00 d6 STA $d600 
.l1550:
3fcb : 2c 00 d6 BIT $d600 
3fce : 10 fb __ BPL $3fcb ; (vdc_set_mode.l1550 + 0)
.s291:
3fd0 : a5 43 __ LDA T1 + 0 
3fd2 : 8d 01 d6 STA $d601 
3fd5 : a9 18 __ LDA #$18
3fd7 : 8d 00 d6 STA $d600 
.l1552:
3fda : 2c 00 d6 BIT $d600 
3fdd : 10 fb __ BPL $3fda ; (vdc_set_mode.l1552 + 0)
.s297:
3fdf : ad 01 d6 LDA $d601 
3fe2 : 29 7f __ AND #$7f
3fe4 : aa __ __ TAX
3fe5 : a9 18 __ LDA #$18
3fe7 : 8d 00 d6 STA $d600 
.l1554:
3fea : 2c 00 d6 BIT $d600 
3fed : 10 fb __ BPL $3fea ; (vdc_set_mode.l1554 + 0)
.s303:
3fef : 8e 01 d6 STX $d601 
3ff2 : a9 1e __ LDA #$1e
3ff4 : 8d 00 d6 STA $d600 
.l1556:
3ff7 : 2c 00 d6 BIT $d600 
3ffa : 10 fb __ BPL $3ff7 ; (vdc_set_mode.l1556 + 0)
.s308:
3ffc : a5 44 __ LDA T6 + 0 
3ffe : 8d 01 d6 STA $d601 
4001 : e6 4f __ INC T0 + 0 
4003 : 4c 1d 3f JMP $3f1d ; (vdc_set_mode.l236 + 0)
--------------------------------------------------------------------
4006 : __ __ __ BYT 25 32 78 20 25 32 78 00                         : %2x %2x.
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
400e : 20 62 ff JSR $ff62 
.s1001:
4011 : 60 __ __ RTS
--------------------------------------------------------------------
4012 : __ __ __ BYT 43 4f 50 59 20 54 45 53 54 49 4e 47 2e 00       : COPY TESTING..
--------------------------------------------------------------------
4020 : __ __ __ BYT 0a 0d 57 52 49 54 45 20 42 59 54 45 3a 20 25 32 : ..WRITE BYTE: %2
4030 : __ __ __ BYT 78 20 52 45 41 44 20 42 59 54 45 3a 20 25 32 78 : x READ BYTE: %2x
4040 : __ __ __ BYT 0a 00                                           : ..
--------------------------------------------------------------------
4042 : __ __ __ BYT 57 52 49 54 45 20 57 4f 52 44 3a 20 25 34 78 20 : WRITE WORD: %4x 
4052 : __ __ __ BYT 52 45 41 44 20 57 4f 52 44 3a 20 25 34 78 0a 00 : READ WORD: %4x..
--------------------------------------------------------------------
4062 : __ __ __ BYT 57 52 49 54 45 20 53 54 52 49 4e 47 3a 20 25 53 : WRITE STRING: %S
4072 : __ __ __ BYT 0a 52 45 41 44 20 53 54 52 49 4e 47 3a 20 25 53 : .READ STRING: %S
4082 : __ __ __ BYT 0a 00                                           : ..
--------------------------------------------------------------------
4084 : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 44 45 4d 4f : oSCAR64 vdc DEMO
4094 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
4095 : a2 03 __ LDX #$03
4097 : b5 53 __ LDA T8 + 0,x 
4099 : 9d e4 bf STA $bfe4,x ; (buff + 38)
409c : ca __ __ DEX
409d : 10 f8 __ BPL $4097 ; (sprintf.s1000 + 2)
.s0:
409f : 18 __ __ CLC
40a0 : a5 23 __ LDA SP + 0 
40a2 : 69 06 __ ADC #$06
40a4 : 85 47 __ STA T0 + 0 
40a6 : a5 24 __ LDA SP + 1 
40a8 : 69 00 __ ADC #$00
40aa : 85 48 __ STA T0 + 1 
40ac : a9 00 __ LDA #$00
40ae : 85 43 __ STA T1 + 0 
40b0 : a0 04 __ LDY #$04
40b2 : b1 23 __ LDA (SP + 0),y 
40b4 : 85 49 __ STA T2 + 0 
40b6 : c8 __ __ INY
40b7 : b1 23 __ LDA (SP + 0),y 
40b9 : 85 4a __ STA T2 + 1 
40bb : a0 02 __ LDY #$02
40bd : b1 23 __ LDA (SP + 0),y 
40bf : 85 4b __ STA T3 + 0 
40c1 : c8 __ __ INY
40c2 : b1 23 __ LDA (SP + 0),y 
40c4 : 85 4c __ STA T3 + 1 
.l2:
40c6 : a0 00 __ LDY #$00
40c8 : b1 49 __ LDA (T2 + 0),y 
40ca : d0 0f __ BNE $40db ; (sprintf.s3 + 0)
.s4:
40cc : a4 43 __ LDY T1 + 0 
40ce : 91 4b __ STA (T3 + 0),y 
.s1001:
40d0 : a2 03 __ LDX #$03
40d2 : bd e4 bf LDA $bfe4,x ; (buff + 38)
40d5 : 95 53 __ STA T8 + 0,x 
40d7 : ca __ __ DEX
40d8 : 10 f8 __ BPL $40d2 ; (sprintf.s1001 + 2)
40da : 60 __ __ RTS
.s3:
40db : c9 25 __ CMP #$25
40dd : f0 22 __ BEQ $4101 ; (sprintf.s5 + 0)
.s6:
40df : a4 43 __ LDY T1 + 0 
40e1 : 91 4b __ STA (T3 + 0),y 
40e3 : e6 49 __ INC T2 + 0 
40e5 : d0 02 __ BNE $40e9 ; (sprintf.s1102 + 0)
.s1101:
40e7 : e6 4a __ INC T2 + 1 
.s1102:
40e9 : c8 __ __ INY
40ea : 84 43 __ STY T1 + 0 
40ec : 98 __ __ TYA
40ed : c0 28 __ CPY #$28
40ef : 90 d5 __ BCC $40c6 ; (sprintf.l2 + 0)
.s111:
40f1 : 18 __ __ CLC
40f2 : 65 4b __ ADC T3 + 0 
40f4 : 85 4b __ STA T3 + 0 
40f6 : 90 02 __ BCC $40fa ; (sprintf.s1104 + 0)
.s1103:
40f8 : e6 4c __ INC T3 + 1 
.s1104:
40fa : a9 00 __ LDA #$00
.s1068:
40fc : 85 43 __ STA T1 + 0 
40fe : 4c c6 40 JMP $40c6 ; (sprintf.l2 + 0)
.s5:
4101 : 8c ec bf STY $bfec ; (buff + 46)
4104 : 8c ed bf STY $bfed ; (buff + 47)
4107 : 8c ee bf STY $bfee ; (buff + 48)
410a : 8c ef bf STY $bfef ; (buff + 49)
410d : a9 0a __ LDA #$0a
410f : 8d eb bf STA $bfeb ; (buff + 45)
4112 : a5 43 __ LDA T1 + 0 
4114 : f0 0b __ BEQ $4121 ; (sprintf.s10 + 0)
.s8:
4116 : 18 __ __ CLC
4117 : 65 4b __ ADC T3 + 0 
4119 : 85 4b __ STA T3 + 0 
411b : 90 02 __ BCC $411f ; (sprintf.s1080 + 0)
.s1079:
411d : e6 4c __ INC T3 + 1 
.s1080:
411f : 84 43 __ STY T1 + 0 
.s10:
4121 : a0 01 __ LDY #$01
4123 : b1 49 __ LDA (T2 + 0),y 
4125 : aa __ __ TAX
4126 : a9 20 __ LDA #$20
4128 : 8d e8 bf STA $bfe8 ; (buff + 42)
412b : a9 00 __ LDA #$00
412d : 8d e9 bf STA $bfe9 ; (buff + 43)
4130 : a9 ff __ LDA #$ff
4132 : 8d ea bf STA $bfea ; (buff + 44)
4135 : 18 __ __ CLC
4136 : a5 49 __ LDA T2 + 0 
4138 : 69 02 __ ADC #$02
.l15:
413a : 85 49 __ STA T2 + 0 
413c : 90 02 __ BCC $4140 ; (sprintf.s1082 + 0)
.s1081:
413e : e6 4a __ INC T2 + 1 
.s1082:
4140 : 8a __ __ TXA
4141 : e0 2b __ CPX #$2b
4143 : d0 08 __ BNE $414d ; (sprintf.s18 + 0)
.s17:
4145 : a9 01 __ LDA #$01
4147 : 8d ed bf STA $bfed ; (buff + 47)
414a : 4c ae 43 JMP $43ae ; (sprintf.s260 + 0)
.s18:
414d : c9 30 __ CMP #$30
414f : d0 06 __ BNE $4157 ; (sprintf.s21 + 0)
.s20:
4151 : 8d e8 bf STA $bfe8 ; (buff + 42)
4154 : 4c ae 43 JMP $43ae ; (sprintf.s260 + 0)
.s21:
4157 : e0 23 __ CPX #$23
4159 : d0 08 __ BNE $4163 ; (sprintf.s24 + 0)
.s23:
415b : a9 01 __ LDA #$01
415d : 8d ef bf STA $bfef ; (buff + 49)
4160 : 4c ae 43 JMP $43ae ; (sprintf.s260 + 0)
.s24:
4163 : e0 2d __ CPX #$2d
4165 : d0 08 __ BNE $416f ; (sprintf.s16 + 0)
.s26:
4167 : a9 01 __ LDA #$01
4169 : 8d ee bf STA $bfee ; (buff + 48)
416c : 4c ae 43 JMP $43ae ; (sprintf.s260 + 0)
.s16:
416f : 85 45 __ STA T4 + 0 
4171 : e0 30 __ CPX #$30
4173 : 90 53 __ BCC $41c8 ; (sprintf.s32 + 0)
.s33:
4175 : e0 3a __ CPX #$3a
4177 : b0 4f __ BCS $41c8 ; (sprintf.s32 + 0)
.s30:
4179 : a9 00 __ LDA #$00
417b : 85 4d __ STA T6 + 0 
417d : 85 4e __ STA T6 + 1 
417f : e0 3a __ CPX #$3a
4181 : b0 40 __ BCS $41c3 ; (sprintf.s36 + 0)
.l35:
4183 : a5 4d __ LDA T6 + 0 
4185 : 0a __ __ ASL
4186 : 85 1b __ STA ACCU + 0 
4188 : a5 4e __ LDA T6 + 1 
418a : 2a __ __ ROL
418b : 06 1b __ ASL ACCU + 0 
418d : 2a __ __ ROL
418e : aa __ __ TAX
418f : 18 __ __ CLC
4190 : a5 1b __ LDA ACCU + 0 
4192 : 65 4d __ ADC T6 + 0 
4194 : 85 4d __ STA T6 + 0 
4196 : 8a __ __ TXA
4197 : 65 4e __ ADC T6 + 1 
4199 : 06 4d __ ASL T6 + 0 
419b : 2a __ __ ROL
419c : aa __ __ TAX
419d : 18 __ __ CLC
419e : a5 4d __ LDA T6 + 0 
41a0 : 65 45 __ ADC T4 + 0 
41a2 : 90 01 __ BCC $41a5 ; (sprintf.s1098 + 0)
.s1097:
41a4 : e8 __ __ INX
.s1098:
41a5 : 38 __ __ SEC
41a6 : e9 30 __ SBC #$30
41a8 : 85 4d __ STA T6 + 0 
41aa : 8a __ __ TXA
41ab : e9 00 __ SBC #$00
41ad : 85 4e __ STA T6 + 1 
41af : a0 00 __ LDY #$00
41b1 : b1 49 __ LDA (T2 + 0),y 
41b3 : 85 45 __ STA T4 + 0 
41b5 : e6 49 __ INC T2 + 0 
41b7 : d0 02 __ BNE $41bb ; (sprintf.s1100 + 0)
.s1099:
41b9 : e6 4a __ INC T2 + 1 
.s1100:
41bb : c9 30 __ CMP #$30
41bd : 90 04 __ BCC $41c3 ; (sprintf.s36 + 0)
.s37:
41bf : c9 3a __ CMP #$3a
41c1 : 90 c0 __ BCC $4183 ; (sprintf.l35 + 0)
.s36:
41c3 : a5 4d __ LDA T6 + 0 
41c5 : 8d e9 bf STA $bfe9 ; (buff + 43)
.s32:
41c8 : a5 45 __ LDA T4 + 0 
41ca : c9 2e __ CMP #$2e
41cc : d0 51 __ BNE $421f ; (sprintf.s40 + 0)
.s38:
41ce : a9 00 __ LDA #$00
41d0 : 85 4d __ STA T6 + 0 
.l245:
41d2 : 85 4e __ STA T6 + 1 
41d4 : a0 00 __ LDY #$00
41d6 : b1 49 __ LDA (T2 + 0),y 
41d8 : 85 45 __ STA T4 + 0 
41da : e6 49 __ INC T2 + 0 
41dc : d0 02 __ BNE $41e0 ; (sprintf.s1084 + 0)
.s1083:
41de : e6 4a __ INC T2 + 1 
.s1084:
41e0 : c9 30 __ CMP #$30
41e2 : 90 04 __ BCC $41e8 ; (sprintf.s43 + 0)
.s44:
41e4 : c9 3a __ CMP #$3a
41e6 : 90 0a __ BCC $41f2 ; (sprintf.s42 + 0)
.s43:
41e8 : a5 4d __ LDA T6 + 0 
41ea : 8d ea bf STA $bfea ; (buff + 44)
41ed : a5 45 __ LDA T4 + 0 
41ef : 4c 1f 42 JMP $421f ; (sprintf.s40 + 0)
.s42:
41f2 : a5 4d __ LDA T6 + 0 
41f4 : 0a __ __ ASL
41f5 : 85 1b __ STA ACCU + 0 
41f7 : a5 4e __ LDA T6 + 1 
41f9 : 2a __ __ ROL
41fa : 06 1b __ ASL ACCU + 0 
41fc : 2a __ __ ROL
41fd : aa __ __ TAX
41fe : 18 __ __ CLC
41ff : a5 1b __ LDA ACCU + 0 
4201 : 65 4d __ ADC T6 + 0 
4203 : 85 4d __ STA T6 + 0 
4205 : 8a __ __ TXA
4206 : 65 4e __ ADC T6 + 1 
4208 : 06 4d __ ASL T6 + 0 
420a : 2a __ __ ROL
420b : aa __ __ TAX
420c : 18 __ __ CLC
420d : a5 4d __ LDA T6 + 0 
420f : 65 45 __ ADC T4 + 0 
4211 : 90 01 __ BCC $4214 ; (sprintf.s1096 + 0)
.s1095:
4213 : e8 __ __ INX
.s1096:
4214 : 38 __ __ SEC
4215 : e9 30 __ SBC #$30
4217 : 85 4d __ STA T6 + 0 
4219 : 8a __ __ TXA
421a : e9 00 __ SBC #$00
421c : 4c d2 41 JMP $41d2 ; (sprintf.l245 + 0)
.s40:
421f : c9 64 __ CMP #$64
4221 : f0 04 __ BEQ $4227 ; (sprintf.s45 + 0)
.s48:
4223 : c9 44 __ CMP #$44
4225 : d0 05 __ BNE $422c ; (sprintf.s46 + 0)
.s45:
4227 : a9 01 __ LDA #$01
4229 : 4c 87 43 JMP $4387 ; (sprintf.s261 + 0)
.s46:
422c : c9 75 __ CMP #$75
422e : d0 03 __ BNE $4233 ; (sprintf.s52 + 0)
4230 : 4c 85 43 JMP $4385 ; (sprintf.s285 + 0)
.s52:
4233 : c9 55 __ CMP #$55
4235 : d0 03 __ BNE $423a ; (sprintf.s50 + 0)
4237 : 4c 85 43 JMP $4385 ; (sprintf.s285 + 0)
.s50:
423a : c9 78 __ CMP #$78
423c : f0 04 __ BEQ $4242 ; (sprintf.s53 + 0)
.s56:
423e : c9 58 __ CMP #$58
4240 : d0 0d __ BNE $424f ; (sprintf.s54 + 0)
.s53:
4242 : a9 10 __ LDA #$10
4244 : 8d eb bf STA $bfeb ; (buff + 45)
4247 : a9 00 __ LDA #$00
4249 : 8d ec bf STA $bfec ; (buff + 46)
424c : 4c 85 43 JMP $4385 ; (sprintf.s285 + 0)
.s54:
424f : c9 6c __ CMP #$6c
4251 : d0 03 __ BNE $4256 ; (sprintf.s60 + 0)
4253 : 4c 17 43 JMP $4317 ; (sprintf.s57 + 0)
.s60:
4256 : c9 4c __ CMP #$4c
4258 : d0 03 __ BNE $425d ; (sprintf.s58 + 0)
425a : 4c 17 43 JMP $4317 ; (sprintf.s57 + 0)
.s58:
425d : c9 73 __ CMP #$73
425f : f0 37 __ BEQ $4298 ; (sprintf.s73 + 0)
.s76:
4261 : c9 53 __ CMP #$53
4263 : f0 33 __ BEQ $4298 ; (sprintf.s73 + 0)
.s74:
4265 : c9 63 __ CMP #$63
4267 : f0 14 __ BEQ $427d ; (sprintf.s104 + 0)
.s107:
4269 : c9 43 __ CMP #$43
426b : f0 10 __ BEQ $427d ; (sprintf.s104 + 0)
.s105:
426d : 09 00 __ ORA #$00
426f : d0 03 __ BNE $4274 ; (sprintf.s108 + 0)
4271 : 4c c6 40 JMP $40c6 ; (sprintf.l2 + 0)
.s108:
4274 : a4 43 __ LDY T1 + 0 
4276 : 91 4b __ STA (T3 + 0),y 
4278 : e6 43 __ INC T1 + 0 
427a : 4c c6 40 JMP $40c6 ; (sprintf.l2 + 0)
.s104:
427d : a0 00 __ LDY #$00
427f : b1 47 __ LDA (T0 + 0),y 
4281 : a4 43 __ LDY T1 + 0 
4283 : 91 4b __ STA (T3 + 0),y 
4285 : e6 43 __ INC T1 + 0 
.s258:
4287 : 18 __ __ CLC
4288 : a5 47 __ LDA T0 + 0 
428a : 69 02 __ ADC #$02
428c : 85 47 __ STA T0 + 0 
428e : b0 03 __ BCS $4293 ; (sprintf.s1085 + 0)
4290 : 4c c6 40 JMP $40c6 ; (sprintf.l2 + 0)
.s1085:
4293 : e6 48 __ INC T0 + 1 
4295 : 4c c6 40 JMP $40c6 ; (sprintf.l2 + 0)
.s73:
4298 : a0 00 __ LDY #$00
429a : 84 45 __ STY T4 + 0 
429c : b1 47 __ LDA (T0 + 0),y 
429e : 85 4d __ STA T6 + 0 
42a0 : c8 __ __ INY
42a1 : b1 47 __ LDA (T0 + 0),y 
42a3 : 85 4e __ STA T6 + 1 
42a5 : 18 __ __ CLC
42a6 : a5 47 __ LDA T0 + 0 
42a8 : 69 02 __ ADC #$02
42aa : 85 47 __ STA T0 + 0 
42ac : 90 02 __ BCC $42b0 ; (sprintf.s1092 + 0)
.s1091:
42ae : e6 48 __ INC T0 + 1 
.s1092:
42b0 : ad e9 bf LDA $bfe9 ; (buff + 43)
42b3 : f0 0d __ BEQ $42c2 ; (sprintf.s79 + 0)
.s1071:
42b5 : a0 00 __ LDY #$00
42b7 : b1 4d __ LDA (T6 + 0),y 
42b9 : f0 05 __ BEQ $42c0 ; (sprintf.s1072 + 0)
.l81:
42bb : c8 __ __ INY
42bc : b1 4d __ LDA (T6 + 0),y 
42be : d0 fb __ BNE $42bb ; (sprintf.l81 + 0)
.s1072:
42c0 : 84 45 __ STY T4 + 0 
.s79:
42c2 : ad ee bf LDA $bfee ; (buff + 48)
42c5 : d0 19 __ BNE $42e0 ; (sprintf.l95 + 0)
.s1075:
42c7 : a6 45 __ LDX T4 + 0 
42c9 : ec e9 bf CPX $bfe9 ; (buff + 43)
42cc : a4 43 __ LDY T1 + 0 
42ce : b0 0c __ BCS $42dc ; (sprintf.s1076 + 0)
.l87:
42d0 : ad e8 bf LDA $bfe8 ; (buff + 42)
42d3 : 91 4b __ STA (T3 + 0),y 
42d5 : e8 __ __ INX
42d6 : ec e9 bf CPX $bfe9 ; (buff + 43)
42d9 : c8 __ __ INY
42da : 90 f4 __ BCC $42d0 ; (sprintf.l87 + 0)
.s1076:
42dc : 86 45 __ STX T4 + 0 
42de : 84 43 __ STY T1 + 0 
.l95:
42e0 : a0 00 __ LDY #$00
42e2 : b1 4d __ LDA (T6 + 0),y 
42e4 : f0 0f __ BEQ $42f5 ; (sprintf.s91 + 0)
.s96:
42e6 : a4 43 __ LDY T1 + 0 
42e8 : 91 4b __ STA (T3 + 0),y 
42ea : e6 43 __ INC T1 + 0 
42ec : e6 4d __ INC T6 + 0 
42ee : d0 f0 __ BNE $42e0 ; (sprintf.l95 + 0)
.s1093:
42f0 : e6 4e __ INC T6 + 1 
42f2 : 4c e0 42 JMP $42e0 ; (sprintf.l95 + 0)
.s91:
42f5 : ad ee bf LDA $bfee ; (buff + 48)
42f8 : d0 03 __ BNE $42fd ; (sprintf.s1073 + 0)
42fa : 4c c6 40 JMP $40c6 ; (sprintf.l2 + 0)
.s1073:
42fd : a6 45 __ LDX T4 + 0 
42ff : ec e9 bf CPX $bfe9 ; (buff + 43)
4302 : a4 43 __ LDY T1 + 0 
4304 : b0 0c __ BCS $4312 ; (sprintf.s1074 + 0)
.l102:
4306 : ad e8 bf LDA $bfe8 ; (buff + 42)
4309 : 91 4b __ STA (T3 + 0),y 
430b : e8 __ __ INX
430c : ec e9 bf CPX $bfe9 ; (buff + 43)
430f : c8 __ __ INY
4310 : 90 f4 __ BCC $4306 ; (sprintf.l102 + 0)
.s1074:
4312 : 84 43 __ STY T1 + 0 
4314 : 4c c6 40 JMP $40c6 ; (sprintf.l2 + 0)
.s57:
4317 : a0 00 __ LDY #$00
4319 : b1 47 __ LDA (T0 + 0),y 
431b : 85 53 __ STA T8 + 0 
431d : c8 __ __ INY
431e : b1 47 __ LDA (T0 + 0),y 
4320 : 85 54 __ STA T8 + 1 
4322 : c8 __ __ INY
4323 : b1 47 __ LDA (T0 + 0),y 
4325 : 85 55 __ STA T8 + 2 
4327 : c8 __ __ INY
4328 : b1 47 __ LDA (T0 + 0),y 
432a : 85 56 __ STA T8 + 3 
432c : 18 __ __ CLC
432d : a5 47 __ LDA T0 + 0 
432f : 69 04 __ ADC #$04
4331 : 85 47 __ STA T0 + 0 
4333 : 90 02 __ BCC $4337 ; (sprintf.s1088 + 0)
.s1087:
4335 : e6 48 __ INC T0 + 1 
.s1088:
4337 : a0 00 __ LDY #$00
4339 : b1 49 __ LDA (T2 + 0),y 
433b : aa __ __ TAX
433c : e6 49 __ INC T2 + 0 
433e : d0 02 __ BNE $4342 ; (sprintf.s1090 + 0)
.s1089:
4340 : e6 4a __ INC T2 + 1 
.s1090:
4342 : 8a __ __ TXA
4343 : e0 64 __ CPX #$64
4345 : f0 04 __ BEQ $434b ; (sprintf.s61 + 0)
.s64:
4347 : c9 44 __ CMP #$44
4349 : d0 04 __ BNE $434f ; (sprintf.s62 + 0)
.s61:
434b : a9 01 __ LDA #$01
434d : d0 1c __ BNE $436b ; (sprintf.s259 + 0)
.s62:
434f : c9 75 __ CMP #$75
4351 : f0 17 __ BEQ $436a ; (sprintf.s284 + 0)
.s68:
4353 : c9 55 __ CMP #$55
4355 : f0 13 __ BEQ $436a ; (sprintf.s284 + 0)
.s66:
4357 : c9 78 __ CMP #$78
4359 : f0 07 __ BEQ $4362 ; (sprintf.s69 + 0)
.s72:
435b : c9 58 __ CMP #$58
435d : f0 03 __ BEQ $4362 ; (sprintf.s69 + 0)
435f : 4c c6 40 JMP $40c6 ; (sprintf.l2 + 0)
.s69:
4362 : 8c ec bf STY $bfec ; (buff + 46)
4365 : a9 10 __ LDA #$10
4367 : 8d eb bf STA $bfeb ; (buff + 45)
.s284:
436a : 98 __ __ TYA
.s259:
436b : 85 15 __ STA P8 
436d : a5 4b __ LDA T3 + 0 
436f : 85 0f __ STA P2 ; (fmt + 0)
4371 : a5 4c __ LDA T3 + 1 
4373 : 85 10 __ STA P3 ; (fmt + 1)
4375 : a9 e8 __ LDA #$e8
4377 : 85 0d __ STA P0 ; (str + 0)
4379 : a9 bf __ LDA #$bf
437b : 85 0e __ STA P1 ; (str + 1)
437d : 20 25 37 JSR $3725 ; (nforml@proxy + 0)
4380 : a5 1b __ LDA ACCU + 0 
4382 : 4c fc 40 JMP $40fc ; (sprintf.s1068 + 0)
.s285:
4385 : a9 00 __ LDA #$00
.s261:
4387 : 85 13 __ STA P6 
4389 : a5 4b __ LDA T3 + 0 
438b : 85 0f __ STA P2 ; (fmt + 0)
438d : a5 4c __ LDA T3 + 1 
438f : 85 10 __ STA P3 ; (fmt + 1)
4391 : a0 00 __ LDY #$00
4393 : b1 47 __ LDA (T0 + 0),y 
4395 : 85 11 __ STA P4 ; (fmt + 2)
4397 : c8 __ __ INY
4398 : b1 47 __ LDA (T0 + 0),y 
439a : 85 12 __ STA P5 ; (fmt + 3)
439c : a9 e8 __ LDA #$e8
439e : 85 0d __ STA P0 ; (str + 0)
43a0 : a9 bf __ LDA #$bf
43a2 : 85 0e __ STA P1 ; (str + 1)
43a4 : 20 f0 35 JSR $35f0 ; (nformi.s0 + 0)
43a7 : a5 1b __ LDA ACCU + 0 
43a9 : 85 43 __ STA T1 + 0 
43ab : 4c 87 42 JMP $4287 ; (sprintf.s258 + 0)
.s260:
43ae : a0 00 __ LDY #$00
43b0 : b1 49 __ LDA (T2 + 0),y 
43b2 : aa __ __ TAX
43b3 : 18 __ __ CLC
43b4 : a5 49 __ LDA T2 + 0 
43b6 : 69 01 __ ADC #$01
43b8 : 4c 3a 41 JMP $413a ; (sprintf.l15 + 0)
--------------------------------------------------------------------
43bb : __ __ __ BYT 76 64 63 20 6d 45 4d 4f 52 59 20 64 45 54 45 43 : vdc mEMORY dETEC
43cb : __ __ __ BYT 54 45 44 3a 20 25 44 20 6b 62 2c 20 53 43 52 45 : TED: %D kb, SCRE
43db : __ __ __ BYT 45 4e 20 53 49 5a 45 3a 20 25 44 58 25 44 2c 20 : EN SIZE: %DX%D, 
43eb : __ __ __ BYT 45 58 54 2e 4d 45 4d 3a 20 25 53 00             : EXT.MEM: %S.
--------------------------------------------------------------------
43f7 : __ __ __ BYT 6f 4e 20 00                                     : oN .
--------------------------------------------------------------------
43fb : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
mul16by8: ; mul16by8
43ff : a0 00 __ LDY #$00
4401 : 84 06 __ STY WORK + 3 
4403 : 4a __ __ LSR
4404 : 90 0d __ BCC $4413 ; (mul16by8 + 20)
4406 : aa __ __ TAX
4407 : 18 __ __ CLC
4408 : 98 __ __ TYA
4409 : 65 1b __ ADC ACCU + 0 
440b : a8 __ __ TAY
440c : a5 06 __ LDA WORK + 3 
440e : 65 1c __ ADC ACCU + 1 
4410 : 85 06 __ STA WORK + 3 
4412 : 8a __ __ TXA
4413 : 06 1b __ ASL ACCU + 0 
4415 : 26 1c __ ROL ACCU + 1 
4417 : 4a __ __ LSR
4418 : b0 ec __ BCS $4406 ; (mul16by8 + 7)
441a : d0 f7 __ BNE $4413 ; (mul16by8 + 20)
441c : 84 05 __ STY WORK + 2 
441e : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
441f : a5 1c __ LDA ACCU + 1 
4421 : d0 31 __ BNE $4454 ; (divmod + 53)
4423 : a5 04 __ LDA WORK + 1 
4425 : d0 1e __ BNE $4445 ; (divmod + 38)
4427 : 85 06 __ STA WORK + 3 
4429 : a2 04 __ LDX #$04
442b : 06 1b __ ASL ACCU + 0 
442d : 2a __ __ ROL
442e : c5 03 __ CMP WORK + 0 
4430 : 90 02 __ BCC $4434 ; (divmod + 21)
4432 : e5 03 __ SBC WORK + 0 
4434 : 26 1b __ ROL ACCU + 0 
4436 : 2a __ __ ROL
4437 : c5 03 __ CMP WORK + 0 
4439 : 90 02 __ BCC $443d ; (divmod + 30)
443b : e5 03 __ SBC WORK + 0 
443d : 26 1b __ ROL ACCU + 0 
443f : ca __ __ DEX
4440 : d0 eb __ BNE $442d ; (divmod + 14)
4442 : 85 05 __ STA WORK + 2 
4444 : 60 __ __ RTS
4445 : a5 1b __ LDA ACCU + 0 
4447 : 85 05 __ STA WORK + 2 
4449 : a5 1c __ LDA ACCU + 1 
444b : 85 06 __ STA WORK + 3 
444d : a9 00 __ LDA #$00
444f : 85 1b __ STA ACCU + 0 
4451 : 85 1c __ STA ACCU + 1 
4453 : 60 __ __ RTS
4454 : a5 04 __ LDA WORK + 1 
4456 : d0 1f __ BNE $4477 ; (divmod + 88)
4458 : a5 03 __ LDA WORK + 0 
445a : 30 1b __ BMI $4477 ; (divmod + 88)
445c : a9 00 __ LDA #$00
445e : 85 06 __ STA WORK + 3 
4460 : a2 10 __ LDX #$10
4462 : 06 1b __ ASL ACCU + 0 
4464 : 26 1c __ ROL ACCU + 1 
4466 : 2a __ __ ROL
4467 : c5 03 __ CMP WORK + 0 
4469 : 90 02 __ BCC $446d ; (divmod + 78)
446b : e5 03 __ SBC WORK + 0 
446d : 26 1b __ ROL ACCU + 0 
446f : 26 1c __ ROL ACCU + 1 
4471 : ca __ __ DEX
4472 : d0 f2 __ BNE $4466 ; (divmod + 71)
4474 : 85 05 __ STA WORK + 2 
4476 : 60 __ __ RTS
4477 : a9 00 __ LDA #$00
4479 : 85 05 __ STA WORK + 2 
447b : 85 06 __ STA WORK + 3 
447d : 84 02 __ STY $02 
447f : a0 10 __ LDY #$10
4481 : 18 __ __ CLC
4482 : 26 1b __ ROL ACCU + 0 
4484 : 26 1c __ ROL ACCU + 1 
4486 : 26 05 __ ROL WORK + 2 
4488 : 26 06 __ ROL WORK + 3 
448a : 38 __ __ SEC
448b : a5 05 __ LDA WORK + 2 
448d : e5 03 __ SBC WORK + 0 
448f : aa __ __ TAX
4490 : a5 06 __ LDA WORK + 3 
4492 : e5 04 __ SBC WORK + 1 
4494 : 90 04 __ BCC $449a ; (divmod + 123)
4496 : 86 05 __ STX WORK + 2 
4498 : 85 06 __ STA WORK + 3 
449a : 88 __ __ DEY
449b : d0 e5 __ BNE $4482 ; (divmod + 99)
449d : 26 1b __ ROL ACCU + 0 
449f : 26 1c __ ROL ACCU + 1 
44a1 : a4 02 __ LDY $02 
44a3 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
44a4 : 84 02 __ STY $02 
44a6 : a0 20 __ LDY #$20
44a8 : a9 00 __ LDA #$00
44aa : 85 07 __ STA WORK + 4 
44ac : 85 08 __ STA WORK + 5 
44ae : 85 09 __ STA WORK + 6 
44b0 : 85 0a __ STA WORK + 7 
44b2 : a5 05 __ LDA WORK + 2 
44b4 : 05 06 __ ORA WORK + 3 
44b6 : d0 39 __ BNE $44f1 ; (divmod32 + 77)
44b8 : 18 __ __ CLC
44b9 : 26 1b __ ROL ACCU + 0 
44bb : 26 1c __ ROL ACCU + 1 
44bd : 26 1d __ ROL ACCU + 2 
44bf : 26 1e __ ROL ACCU + 3 
44c1 : 26 07 __ ROL WORK + 4 
44c3 : 26 08 __ ROL WORK + 5 
44c5 : 90 0c __ BCC $44d3 ; (divmod32 + 47)
44c7 : a5 07 __ LDA WORK + 4 
44c9 : e5 03 __ SBC WORK + 0 
44cb : aa __ __ TAX
44cc : a5 08 __ LDA WORK + 5 
44ce : e5 04 __ SBC WORK + 1 
44d0 : 38 __ __ SEC
44d1 : b0 0c __ BCS $44df ; (divmod32 + 59)
44d3 : 38 __ __ SEC
44d4 : a5 07 __ LDA WORK + 4 
44d6 : e5 03 __ SBC WORK + 0 
44d8 : aa __ __ TAX
44d9 : a5 08 __ LDA WORK + 5 
44db : e5 04 __ SBC WORK + 1 
44dd : 90 04 __ BCC $44e3 ; (divmod32 + 63)
44df : 86 07 __ STX WORK + 4 
44e1 : 85 08 __ STA WORK + 5 
44e3 : 88 __ __ DEY
44e4 : d0 d3 __ BNE $44b9 ; (divmod32 + 21)
44e6 : 26 1b __ ROL ACCU + 0 
44e8 : 26 1c __ ROL ACCU + 1 
44ea : 26 1d __ ROL ACCU + 2 
44ec : 26 1e __ ROL ACCU + 3 
44ee : a4 02 __ LDY $02 
44f0 : 60 __ __ RTS
44f1 : 18 __ __ CLC
44f2 : 26 1b __ ROL ACCU + 0 
44f4 : 26 1c __ ROL ACCU + 1 
44f6 : 26 1d __ ROL ACCU + 2 
44f8 : 26 1e __ ROL ACCU + 3 
44fa : 26 07 __ ROL WORK + 4 
44fc : 26 08 __ ROL WORK + 5 
44fe : 26 09 __ ROL WORK + 6 
4500 : 26 0a __ ROL WORK + 7 
4502 : a5 07 __ LDA WORK + 4 
4504 : c5 03 __ CMP WORK + 0 
4506 : a5 08 __ LDA WORK + 5 
4508 : e5 04 __ SBC WORK + 1 
450a : a5 09 __ LDA WORK + 6 
450c : e5 05 __ SBC WORK + 2 
450e : a5 0a __ LDA WORK + 7 
4510 : e5 06 __ SBC WORK + 3 
4512 : 90 18 __ BCC $452c ; (divmod32 + 136)
4514 : a5 07 __ LDA WORK + 4 
4516 : e5 03 __ SBC WORK + 0 
4518 : 85 07 __ STA WORK + 4 
451a : a5 08 __ LDA WORK + 5 
451c : e5 04 __ SBC WORK + 1 
451e : 85 08 __ STA WORK + 5 
4520 : a5 09 __ LDA WORK + 6 
4522 : e5 05 __ SBC WORK + 2 
4524 : 85 09 __ STA WORK + 6 
4526 : a5 0a __ LDA WORK + 7 
4528 : e5 06 __ SBC WORK + 3 
452a : 85 0a __ STA WORK + 7 
452c : 88 __ __ DEY
452d : d0 c3 __ BNE $44f2 ; (divmod32 + 78)
452f : 26 1b __ ROL ACCU + 0 
4531 : 26 1c __ ROL ACCU + 1 
4533 : 26 1d __ ROL ACCU + 2 
4535 : 26 1e __ ROL ACCU + 3 
4537 : a4 02 __ LDY $02 
4539 : 60 __ __ RTS
--------------------------------------------------------------------
453a : __ __ __ BYT 54 48 49 53 20 49 53 20 41 20 54 45 53 54 20 54 : THIS IS A TEST T
454a : __ __ __ BYT 4f 20 57 52 49 54 45 20 44 41 54 41 20 54 4f 20 : O WRITE DATA TO 
455a : __ __ __ BYT 54 48 45 20 44 49 53 4b 2e 00 00 00 00 00 00 00 : THE DISK........
456a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
457a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
458a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
458b : __ __ __ BYT 54 45 53 54 31 00 00 00 00 00 00 00 00 00 00    : TEST1..........
--------------------------------------------------------------------
giocharmap:
459a : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
vdc_modes:
459b : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
45ab : __ __ __ BYT 30 00 40 00 7f 04 26 06 19 07 20 08 fc 09 e7 ff : 0.@...&... .....
45bb : __ __ __ BYT 50 00 32 00 01 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
45cb : __ __ __ BYT 30 00 60 00 80 04 40 06 32 07 3a 08 03 09 07 ff : 0.`...@.2.:.....
--------------------------------------------------------------------
krnio_pstatus:
45db : __ __ __ BSS	16
--------------------------------------------------------------------
vdc_state:
45eb : __ __ __ BSS	22
--------------------------------------------------------------------
linebuffer:
4601 : __ __ __ BSS	81
--------------------------------------------------------------------
bnk_writeb: ; bnk_writeb(u8,u8*,u8)->void
.s1000:
01:1300 : aa __ __ TAX
.s0:
01:1301 : a9 7f __ LDA #$7f
01:1303 : ac 00 ff LDY $ff00 
01:1306 : 8d 00 ff STA $ff00 
01:1309 : 8e 00 d0 STX $d000 
01:130c : 8c 00 ff STY $ff00 
.s1001:
01:130f : 60 __ __ RTS
--------------------------------------------------------------------
bnk_writew: ; bnk_writew(u8,u16*,u16)->void
.s0:
01:1310 : a9 7f __ LDA #$7f
01:1312 : ae 00 ff LDX $ff00 
01:1315 : 8d 00 ff STA $ff00 
01:1318 : a5 0d __ LDA P0 ; (w + 0)
01:131a : 8d 01 d0 STA $d001 
01:131d : a5 0e __ LDA P1 ; (w + 1)
01:131f : 8d 02 d0 STA $d002 
01:1322 : 8e 00 ff STX $ff00 
.s1001:
01:1325 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_readb: ; bnk_readb(u8,u8*)->u8
.s0:
01:1326 : a9 7f __ LDA #$7f
01:1328 : ae 00 ff LDX $ff00 
01:132b : 8d 00 ff STA $ff00 
01:132e : ad 00 d0 LDA $d000 
01:1331 : 8e 00 ff STX $ff00 
.s1001:
01:1334 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_readw: ; bnk_readw(u8,u16*)->u16
.s0:
01:1335 : a9 7f __ LDA #$7f
01:1337 : ae 00 ff LDX $ff00 
01:133a : 8d 00 ff STA $ff00 
01:133d : ad 01 d0 LDA $d001 
01:1340 : 85 1b __ STA ACCU + 0 
01:1342 : ad 02 d0 LDA $d002 
01:1345 : 85 1c __ STA ACCU + 1 
01:1347 : 8e 00 ff STX $ff00 
.s1001:
01:134a : 60 __ __ RTS
--------------------------------------------------------------------
bnk_memcpy@proxy: ; bnk_memcpy@proxy
01:134b : a5 54 __ LDA $54 
01:134d : 85 14 __ STA P7 
--------------------------------------------------------------------
bnk_memcpy: ; bnk_memcpy(u8,u8*,u8,u8*,u16)->void
.s0:
01:134f : ad 00 ff LDA $ff00 
01:1352 : 85 1b __ STA ACCU + 0 
01:1354 : a5 13 __ LDA P6 ; (size + 0)
01:1356 : 05 14 __ ORA P7 ; (size + 1)
01:1358 : f0 31 __ BEQ $138b ; (bnk_memcpy.s3 + 0)
.s4:
01:135a : a0 00 __ LDY #$00
01:135c : a5 13 __ LDA P6 ; (size + 0)
01:135e : f0 02 __ BEQ $1362 ; (bnk_memcpy.l1002 + 0)
.s1005:
01:1360 : e6 14 __ INC P7 ; (size + 1)
.l1002:
01:1362 : a6 13 __ LDX P6 ; (size + 0)
.l1006:
01:1364 : a5 10 __ LDA P3 ; (scr + 0)
01:1366 : 8d 00 ff STA $ff00 
01:1369 : b1 11 __ LDA (P4),y ; (sp + 0)
01:136b : 85 1c __ STA ACCU + 1 
01:136d : a5 0d __ LDA P0 ; (dcr + 0)
01:136f : 8d 00 ff STA $ff00 
01:1372 : a5 1c __ LDA ACCU + 1 
01:1374 : 91 0e __ STA (P1),y ; (dp + 0)
01:1376 : e6 11 __ INC P4 ; (sp + 0)
01:1378 : d0 02 __ BNE $137c ; (bnk_memcpy.s1009 + 0)
.s1008:
01:137a : e6 12 __ INC P5 ; (sp + 1)
.s1009:
01:137c : e6 0e __ INC P1 ; (dp + 0)
01:137e : d0 02 __ BNE $1382 ; (bnk_memcpy.s1011 + 0)
.s1010:
01:1380 : e6 0f __ INC P2 ; (dp + 1)
.s1011:
01:1382 : ca __ __ DEX
01:1383 : d0 df __ BNE $1364 ; (bnk_memcpy.l1006 + 0)
.s1007:
01:1385 : 86 13 __ STX P6 ; (size + 0)
01:1387 : c6 14 __ DEC P7 ; (size + 1)
01:1389 : d0 d7 __ BNE $1362 ; (bnk_memcpy.l1002 + 0)
.s3:
01:138b : a5 1b __ LDA ACCU + 0 
01:138d : 8d 00 ff STA $ff00 
.s1001:
01:1390 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpytovdc: ; bnk_cpytovdc(u16,u8,u8*,u16)->void
.s0:
01:1391 : ad 00 ff LDA $ff00 
01:1394 : 85 1c __ STA ACCU + 1 
01:1396 : a6 11 __ LDX P4 ; (size + 0)
.l108:
01:1398 : 8a __ __ TXA
01:1399 : 05 12 __ ORA P5 ; (size + 1)
01:139b : d0 06 __ BNE $13a3 ; (bnk_cpytovdc.s2 + 0)
.s3:
01:139d : a5 1c __ LDA ACCU + 1 
01:139f : 8d 00 ff STA $ff00 
.s1001:
01:13a2 : 60 __ __ RTS
.s2:
01:13a3 : a9 7f __ LDA #$7f
01:13a5 : 8d 00 ff STA $ff00 
01:13a8 : a0 00 __ LDY #$00
01:13aa : b1 0f __ LDA (P2),y ; (sp + 0)
01:13ac : a8 __ __ TAY
01:13ad : e6 0f __ INC P2 ; (sp + 0)
01:13af : d0 02 __ BNE $13b3 ; (bnk_cpytovdc.s1009 + 0)
.s1008:
01:13b1 : e6 10 __ INC P3 ; (sp + 1)
.s1009:
01:13b3 : a9 0e __ LDA #$0e
01:13b5 : 8d 00 ff STA $ff00 
01:13b8 : a5 0d __ LDA P0 ; (vdcdest + 0)
01:13ba : 85 1b __ STA ACCU + 0 
01:13bc : 18 __ __ CLC
01:13bd : 69 01 __ ADC #$01
01:13bf : 85 0d __ STA P0 ; (vdcdest + 0)
01:13c1 : a5 0e __ LDA P1 ; (vdcdest + 1)
01:13c3 : 85 1d __ STA ACCU + 2 
01:13c5 : 69 00 __ ADC #$00
01:13c7 : 85 0e __ STA P1 ; (vdcdest + 1)
01:13c9 : a9 12 __ LDA #$12
01:13cb : 8d 00 d6 STA $d600 
.l109:
01:13ce : 2c 00 d6 BIT $d600 
01:13d1 : 10 fb __ BPL $13ce ; (bnk_cpytovdc.l109 + 0)
.s10:
01:13d3 : a5 1d __ LDA ACCU + 2 
01:13d5 : 8d 01 d6 STA $d601 
01:13d8 : a9 13 __ LDA #$13
01:13da : 8d 00 d6 STA $d600 
.l111:
01:13dd : 2c 00 d6 BIT $d600 
01:13e0 : 10 fb __ BPL $13dd ; (bnk_cpytovdc.l111 + 0)
.s15:
01:13e2 : a5 1b __ LDA ACCU + 0 
01:13e4 : 8d 01 d6 STA $d601 
01:13e7 : a9 1f __ LDA #$1f
01:13e9 : 8d 00 d6 STA $d600 
.l113:
01:13ec : 2c 00 d6 BIT $d600 
01:13ef : 10 fb __ BPL $13ec ; (bnk_cpytovdc.l113 + 0)
.s19:
01:13f1 : 8c 01 d6 STY $d601 
01:13f4 : 8a __ __ TXA
01:13f5 : 18 __ __ CLC
01:13f6 : 69 ff __ ADC #$ff
01:13f8 : aa __ __ TAX
01:13f9 : b0 9d __ BCS $1398 ; (bnk_cpytovdc.l108 + 0)
.s1010:
01:13fb : c6 12 __ DEC P5 ; (size + 1)
01:13fd : 90 99 __ BCC $1398 ; (bnk_cpytovdc.l108 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc: ; bnk_cpyfromvdc(u8,u8*,u16,u16)->void
.s0:
01:13ff : a9 07 __ LDA #$07
01:1401 : 85 1c __ STA ACCU + 1 
01:1403 : a9 00 __ LDA #$00
01:1405 : 85 43 __ STA T1 + 0 
01:1407 : a9 20 __ LDA #$20
01:1409 : 85 44 __ STA T1 + 1 
01:140b : ad 00 ff LDA $ff00 
01:140e : 85 1b __ STA ACCU + 0 
01:1410 : a2 d0 __ LDX #$d0
.l2:
01:1412 : a9 0e __ LDA #$0e
01:1414 : 8d 00 ff STA $ff00 
01:1417 : a5 0f __ LDA P2 ; (vdcsrc + 0)
01:1419 : a8 __ __ TAY
01:141a : 18 __ __ CLC
01:141b : 69 01 __ ADC #$01
01:141d : 85 0f __ STA P2 ; (vdcsrc + 0)
01:141f : a5 10 __ LDA P3 ; (vdcsrc + 1)
01:1421 : 85 1d __ STA ACCU + 2 
01:1423 : 69 00 __ ADC #$00
01:1425 : 85 10 __ STA P3 ; (vdcsrc + 1)
01:1427 : a9 12 __ LDA #$12
01:1429 : 8d 00 d6 STA $d600 
.l100:
01:142c : 2c 00 d6 BIT $d600 
01:142f : 10 fb __ BPL $142c ; (bnk_cpyfromvdc.l100 + 0)
.s10:
01:1431 : a5 1d __ LDA ACCU + 2 
01:1433 : 8d 01 d6 STA $d601 
01:1436 : a9 13 __ LDA #$13
01:1438 : 8d 00 d6 STA $d600 
.l102:
01:143b : 2c 00 d6 BIT $d600 
01:143e : 10 fb __ BPL $143b ; (bnk_cpyfromvdc.l102 + 0)
.s15:
01:1440 : 8c 01 d6 STY $d601 
01:1443 : a9 1f __ LDA #$1f
01:1445 : 8d 00 d6 STA $d600 
.l104:
01:1448 : 2c 00 d6 BIT $d600 
01:144b : 10 fb __ BPL $1448 ; (bnk_cpyfromvdc.l104 + 0)
.s19:
01:144d : a9 7f __ LDA #$7f
01:144f : ac 01 d6 LDY $d601 
01:1452 : 8d 00 ff STA $ff00 
01:1455 : 98 __ __ TYA
01:1456 : a0 00 __ LDY #$00
01:1458 : 91 43 __ STA (T1 + 0),y 
01:145a : e6 43 __ INC T1 + 0 
01:145c : d0 02 __ BNE $1460 ; (bnk_cpyfromvdc.s1012 + 0)
.s1011:
01:145e : e6 44 __ INC T1 + 1 
.s1012:
01:1460 : 8a __ __ TXA
01:1461 : d0 02 __ BNE $1465 ; (bnk_cpyfromvdc.s1009 + 0)
.s1008:
01:1463 : c6 1c __ DEC ACCU + 1 
.s1009:
01:1465 : ca __ __ DEX
01:1466 : d0 aa __ BNE $1412 ; (bnk_cpyfromvdc.l2 + 0)
.s1010:
01:1468 : a5 1c __ LDA ACCU + 1 
01:146a : d0 a6 __ BNE $1412 ; (bnk_cpyfromvdc.l2 + 0)
.s3:
01:146c : a5 1b __ LDA ACCU + 0 
01:146e : 8d 00 ff STA $ff00 
.s1001:
01:1471 : 60 __ __ RTS
