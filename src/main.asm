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
1c13 : 8e 33 42 STX $4233 ; (spentry + 0)
1c16 : a9 d5 __ LDA #$d5
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 42 __ LDA #$42
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 43 __ LDA #$43
1c21 : e9 42 __ SBC #$42
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
1c37 : e9 d5 __ SBC #$d5
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
1c97 : bd 33 42 LDA $4233,x ; (spentry + 0)
1c9a : 9d 5a bf STA $bf5a,x ; (filename + 14)
1c9d : ca __ __ DEX
1c9e : d0 f7 __ BNE $1c97 ; (main.l1002 + 0)
.s1003:
1ca0 : a2 0f __ LDX #$0f
.l1004:
1ca2 : bd 84 42 LDA $4284,x 
1ca5 : 9d 4b bf STA $bf4b,x ; (main@stack + 6)
1ca8 : ca __ __ DEX
1ca9 : d0 f7 __ BNE $1ca2 ; (main.l1004 + 0)
.s1005:
1cab : a9 b6 __ LDA #$b6
1cad : a0 02 __ LDY #$02
1caf : 91 23 __ STA (SP + 0),y 
1cb1 : a9 35 __ LDA #$35
1cb3 : c8 __ __ INY
1cb4 : 91 23 __ STA (SP + 0),y 
1cb6 : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1cb9 : a9 00 __ LDA #$00
1cbb : 85 0d __ STA P0 
1cbd : 85 0e __ STA P1 
1cbf : 20 c3 35 JSR $35c3 ; (krnio_setbnk.s0 + 0)
1cc2 : 20 cb 35 JSR $35cb ; (krnio_setnam@proxy + 0)
1cc5 : a9 01 __ LDA #$01
1cc7 : 85 0d __ STA P0 
1cc9 : 85 0f __ STA P2 
1ccb : a9 08 __ LDA #$08
1ccd : 85 0e __ STA P1 
1ccf : a9 e9 __ LDA #$e9
1cd1 : a0 02 __ LDY #$02
1cd3 : 91 23 __ STA (SP + 0),y 
1cd5 : a9 35 __ LDA #$35
1cd7 : c8 __ __ INY
1cd8 : 91 23 __ STA (SP + 0),y 
1cda : 20 00 36 JSR $3600 ; (krnio_open.s0 + 0)
1cdd : a0 04 __ LDY #$04
1cdf : 91 23 __ STA (SP + 0),y 
1ce1 : a9 00 __ LDA #$00
1ce3 : c8 __ __ INY
1ce4 : 91 23 __ STA (SP + 0),y 
1ce6 : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1ce9 : a9 28 __ LDA #$28
1ceb : a0 02 __ LDY #$02
1ced : 91 23 __ STA (SP + 0),y 
1cef : a9 36 __ LDA #$36
1cf1 : c8 __ __ INY
1cf2 : 91 23 __ STA (SP + 0),y 
1cf4 : ad d6 42 LDA $42d6 ; (krnio_pstatus + 1)
1cf7 : c8 __ __ INY
1cf8 : 91 23 __ STA (SP + 0),y 
1cfa : a9 00 __ LDA #$00
1cfc : c8 __ __ INY
1cfd : 91 23 __ STA (SP + 0),y 
1cff : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1d02 : a9 3f __ LDA #$3f
1d04 : a0 02 __ LDY #$02
1d06 : 91 23 __ STA (SP + 0),y 
1d08 : a9 36 __ LDA #$36
1d0a : c8 __ __ INY
1d0b : 91 23 __ STA (SP + 0),y 
1d0d : a9 01 __ LDA #$01
1d0f : 20 57 36 JSR $3657 ; (krnio_chkout.s1000 + 0)
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
.l1409:
1d26 : 86 53 __ STX T0 + 0 
1d28 : bd 5b bf LDA $bf5b,x ; (testdata + 0)
1d2b : 20 6b 36 JSR $366b ; (krnio_chrout.s1000 + 0)
1d2e : a6 53 __ LDX T0 + 0 
1d30 : e8 __ __ INX
1d31 : e0 51 __ CPX #$51
1d33 : 90 f1 __ BCC $1d26 ; (main.l1409 + 0)
.s9:
1d35 : 20 79 36 JSR $3679 ; (krnio_clrchn.s0 + 0)
1d38 : a9 51 __ LDA #$51
1d3a : a0 04 __ LDY #$04
1d3c : 91 23 __ STA (SP + 0),y 
1d3e : a9 00 __ LDA #$00
.s2:
1d40 : a0 05 __ LDY #$05
1d42 : 91 23 __ STA (SP + 0),y 
1d44 : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1d47 : a9 7d __ LDA #$7d
1d49 : a0 02 __ LDY #$02
1d4b : 91 23 __ STA (SP + 0),y 
1d4d : a9 36 __ LDA #$36
1d4f : c8 __ __ INY
1d50 : 91 23 __ STA (SP + 0),y 
1d52 : ad d6 42 LDA $42d6 ; (krnio_pstatus + 1)
1d55 : c8 __ __ INY
1d56 : 91 23 __ STA (SP + 0),y 
1d58 : a9 00 __ LDA #$00
1d5a : c8 __ __ INY
1d5b : 91 23 __ STA (SP + 0),y 
1d5d : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1d60 : a9 01 __ LDA #$01
1d62 : 20 95 36 JSR $3695 ; (krnio_close.s1000 + 0)
1d65 : a9 00 __ LDA #$00
1d67 : 85 0f __ STA P2 
1d69 : 85 10 __ STA P3 
1d6b : 85 12 __ STA P5 
1d6d : 20 9d 36 JSR $369d ; (memset@proxy + 0)
1d70 : a9 c5 __ LDA #$c5
1d72 : a0 02 __ LDY #$02
1d74 : 91 23 __ STA (SP + 0),y 
1d76 : a9 36 __ LDA #$36
1d78 : c8 __ __ INY
1d79 : 91 23 __ STA (SP + 0),y 
1d7b : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1d7e : a9 00 __ LDA #$00
1d80 : 85 0d __ STA P0 
1d82 : 85 0e __ STA P1 
1d84 : 20 c3 35 JSR $35c3 ; (krnio_setbnk.s0 + 0)
1d87 : 20 cb 35 JSR $35cb ; (krnio_setnam@proxy + 0)
1d8a : a9 01 __ LDA #$01
1d8c : 85 0d __ STA P0 
1d8e : a9 08 __ LDA #$08
1d90 : 85 0e __ STA P1 
1d92 : a9 00 __ LDA #$00
1d94 : 85 0f __ STA P2 
1d96 : a9 e9 __ LDA #$e9
1d98 : a0 02 __ LDY #$02
1d9a : 91 23 __ STA (SP + 0),y 
1d9c : a9 35 __ LDA #$35
1d9e : c8 __ __ INY
1d9f : 91 23 __ STA (SP + 0),y 
1da1 : 20 00 36 JSR $3600 ; (krnio_open.s0 + 0)
1da4 : a0 04 __ LDY #$04
1da6 : 91 23 __ STA (SP + 0),y 
1da8 : a9 00 __ LDA #$00
1daa : c8 __ __ INY
1dab : 91 23 __ STA (SP + 0),y 
1dad : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1db0 : a9 28 __ LDA #$28
1db2 : a0 02 __ LDY #$02
1db4 : 91 23 __ STA (SP + 0),y 
1db6 : a9 36 __ LDA #$36
1db8 : c8 __ __ INY
1db9 : 91 23 __ STA (SP + 0),y 
1dbb : ad d6 42 LDA $42d6 ; (krnio_pstatus + 1)
1dbe : c8 __ __ INY
1dbf : 91 23 __ STA (SP + 0),y 
1dc1 : a9 00 __ LDA #$00
1dc3 : c8 __ __ INY
1dc4 : 91 23 __ STA (SP + 0),y 
1dc6 : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1dc9 : a9 d1 __ LDA #$d1
1dcb : a0 02 __ LDY #$02
1dcd : 91 23 __ STA (SP + 0),y 
1dcf : a9 36 __ LDA #$36
1dd1 : c8 __ __ INY
1dd2 : 91 23 __ STA (SP + 0),y 
1dd4 : ad d6 42 LDA $42d6 ; (krnio_pstatus + 1)
1dd7 : c9 40 __ CMP #$40
1dd9 : d0 04 __ BNE $1ddf ; (main.s15 + 0)
.s13:
1ddb : a9 00 __ LDA #$00
1ddd : f0 0e __ BEQ $1ded ; (main.s1417 + 0)
.s15:
1ddf : a9 01 __ LDA #$01
1de1 : 20 e8 36 JSR $36e8 ; (krnio_chkin.s1000 + 0)
1de4 : 09 00 __ ORA #$00
1de6 : f0 03 __ BEQ $1deb ; (main.s18 + 0)
1de8 : 4c 1e 2f JMP $2f1e ; (main.s17 + 0)
.s18:
1deb : a9 ff __ LDA #$ff
.s1417:
1ded : 85 53 __ STA T0 + 0 
1def : 85 54 __ STA T0 + 1 
.s12:
1df1 : a5 53 __ LDA T0 + 0 
1df3 : a0 04 __ LDY #$04
1df5 : 91 23 __ STA (SP + 0),y 
1df7 : a5 54 __ LDA T0 + 1 
1df9 : c8 __ __ INY
1dfa : 91 23 __ STA (SP + 0),y 
1dfc : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1dff : a9 12 __ LDA #$12
1e01 : a0 02 __ LDY #$02
1e03 : 91 23 __ STA (SP + 0),y 
1e05 : a9 37 __ LDA #$37
1e07 : c8 __ __ INY
1e08 : 91 23 __ STA (SP + 0),y 
1e0a : ad d6 42 LDA $42d6 ; (krnio_pstatus + 1)
1e0d : c8 __ __ INY
1e0e : 91 23 __ STA (SP + 0),y 
1e10 : a9 00 __ LDA #$00
1e12 : c8 __ __ INY
1e13 : 91 23 __ STA (SP + 0),y 
1e15 : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1e18 : a9 01 __ LDA #$01
1e1a : 20 95 36 JSR $3695 ; (krnio_close.s1000 + 0)
1e1d : a9 29 __ LDA #$29
1e1f : a0 02 __ LDY #$02
1e21 : 91 23 __ STA (SP + 0),y 
1e23 : a9 37 __ LDA #$37
1e25 : c8 __ __ INY
1e26 : 91 23 __ STA (SP + 0),y 
1e28 : a9 5b __ LDA #$5b
1e2a : c8 __ __ INY
1e2b : 91 23 __ STA (SP + 0),y 
1e2d : a9 bf __ LDA #$bf
1e2f : c8 __ __ INY
1e30 : 91 23 __ STA (SP + 0),y 
1e32 : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1e35 : 20 38 37 JSR $3738 ; (getch.s0 + 0)
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
1e4c : 20 a9 36 JSR $36a9 ; (memset.s0 + 0)
1e4f : a2 ff __ LDX #$ff
.l1006:
1e51 : e8 __ __ INX
1e52 : bd 77 37 LDA $3777,x 
1e55 : 9d 5b bf STA $bf5b,x ; (testdata + 0)
1e58 : d0 f7 __ BNE $1e51 ; (main.l1006 + 0)
.s1007:
1e5a : a2 ff __ LDX #$ff
.l1008:
1e5c : e8 __ __ INX
1e5d : bd 91 37 LDA $3791,x 
1e60 : 9d 4c bf STA $bf4c,x ; (filename + 0)
1e63 : d0 f7 __ BNE $1e5c ; (main.l1008 + 0)
.s1009:
1e65 : a9 b6 __ LDA #$b6
1e67 : a0 02 __ LDY #$02
1e69 : 91 23 __ STA (SP + 0),y 
1e6b : a9 35 __ LDA #$35
1e6d : c8 __ __ INY
1e6e : 91 23 __ STA (SP + 0),y 
1e70 : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1e73 : a9 00 __ LDA #$00
1e75 : 85 53 __ STA T0 + 0 
1e77 : 85 0d __ STA P0 
1e79 : 85 0e __ STA P1 
1e7b : 20 c3 35 JSR $35c3 ; (krnio_setbnk.s0 + 0)
1e7e : 20 cb 35 JSR $35cb ; (krnio_setnam@proxy + 0)
1e81 : a9 08 __ LDA #$08
1e83 : 85 0d __ STA P0 
1e85 : a9 5b __ LDA #$5b
1e87 : 85 0e __ STA P1 
1e89 : a9 bf __ LDA #$bf
1e8b : 85 0f __ STA P2 
1e8d : a9 97 __ LDA #$97
1e8f : a0 02 __ LDY #$02
1e91 : 91 23 __ STA (SP + 0),y 
1e93 : a9 37 __ LDA #$37
1e95 : c8 __ __ INY
1e96 : 91 23 __ STA (SP + 0),y 
1e98 : ad 5b bf LDA $bf5b ; (testdata + 0)
1e9b : f0 0c __ BEQ $1ea9 ; (main.s37 + 0)
.s36:
1e9d : a2 00 __ LDX #$00
.l1411:
1e9f : bd 5c bf LDA $bf5c,x ; (testdata + 1)
1ea2 : e8 __ __ INX
1ea3 : 09 00 __ ORA #$00
1ea5 : d0 f8 __ BNE $1e9f ; (main.l1411 + 0)
.s1412:
1ea7 : 86 53 __ STX T0 + 0 
.s37:
1ea9 : 18 __ __ CLC
1eaa : a9 5b __ LDA #$5b
1eac : 65 53 __ ADC T0 + 0 
1eae : 85 10 __ STA P3 
1eb0 : a9 bf __ LDA #$bf
1eb2 : 69 00 __ ADC #$00
1eb4 : 85 11 __ STA P4 
1eb6 : 20 ae 37 JSR $37ae ; (krnio_save.s0 + 0)
1eb9 : a0 04 __ LDY #$04
1ebb : 91 23 __ STA (SP + 0),y 
1ebd : a9 00 __ LDA #$00
1ebf : c8 __ __ INY
1ec0 : 91 23 __ STA (SP + 0),y 
1ec2 : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1ec5 : a9 7d __ LDA #$7d
1ec7 : a0 02 __ LDY #$02
1ec9 : 91 23 __ STA (SP + 0),y 
1ecb : a9 36 __ LDA #$36
1ecd : c8 __ __ INY
1ece : 91 23 __ STA (SP + 0),y 
1ed0 : ad d6 42 LDA $42d6 ; (krnio_pstatus + 1)
1ed3 : c8 __ __ INY
1ed4 : 91 23 __ STA (SP + 0),y 
1ed6 : a9 00 __ LDA #$00
1ed8 : c8 __ __ INY
1ed9 : 91 23 __ STA (SP + 0),y 
1edb : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1ede : a9 00 __ LDA #$00
1ee0 : 85 0f __ STA P2 
1ee2 : 85 10 __ STA P3 
1ee4 : 85 12 __ STA P5 
1ee6 : 20 9d 36 JSR $369d ; (memset@proxy + 0)
1ee9 : a9 dc __ LDA #$dc
1eeb : a0 02 __ LDY #$02
1eed : 91 23 __ STA (SP + 0),y 
1eef : a9 37 __ LDA #$37
1ef1 : c8 __ __ INY
1ef2 : 91 23 __ STA (SP + 0),y 
1ef4 : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1ef7 : a9 00 __ LDA #$00
1ef9 : 85 0d __ STA P0 
1efb : 85 0e __ STA P1 
1efd : 20 c3 35 JSR $35c3 ; (krnio_setbnk.s0 + 0)
1f00 : 20 cb 35 JSR $35cb ; (krnio_setnam@proxy + 0)
1f03 : a9 01 __ LDA #$01
1f05 : 85 0d __ STA P0 
1f07 : 85 0f __ STA P2 
1f09 : a9 08 __ LDA #$08
1f0b : 85 0e __ STA P1 
1f0d : a9 e8 __ LDA #$e8
1f0f : a0 02 __ LDY #$02
1f11 : 91 23 __ STA (SP + 0),y 
1f13 : a9 37 __ LDA #$37
1f15 : c8 __ __ INY
1f16 : 91 23 __ STA (SP + 0),y 
1f18 : 20 ff 37 JSR $37ff ; (krnio_load.s0 + 0)
1f1b : a0 04 __ LDY #$04
1f1d : 91 23 __ STA (SP + 0),y 
1f1f : a9 00 __ LDA #$00
1f21 : c8 __ __ INY
1f22 : 91 23 __ STA (SP + 0),y 
1f24 : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1f27 : a9 7d __ LDA #$7d
1f29 : a0 02 __ LDY #$02
1f2b : 91 23 __ STA (SP + 0),y 
1f2d : a9 36 __ LDA #$36
1f2f : c8 __ __ INY
1f30 : 91 23 __ STA (SP + 0),y 
1f32 : ad d6 42 LDA $42d6 ; (krnio_pstatus + 1)
1f35 : c8 __ __ INY
1f36 : 91 23 __ STA (SP + 0),y 
1f38 : a9 00 __ LDA #$00
1f3a : c8 __ __ INY
1f3b : 91 23 __ STA (SP + 0),y 
1f3d : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1f40 : a9 5b __ LDA #$5b
1f42 : a0 04 __ LDY #$04
1f44 : 91 23 __ STA (SP + 0),y 
1f46 : a9 bf __ LDA #$bf
1f48 : c8 __ __ INY
1f49 : 91 23 __ STA (SP + 0),y 
1f4b : a9 29 __ LDA #$29
1f4d : a0 02 __ LDY #$02
1f4f : 91 23 __ STA (SP + 0),y 
1f51 : a9 37 __ LDA #$37
1f53 : c8 __ __ INY
1f54 : 91 23 __ STA (SP + 0),y 
1f56 : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
1f59 : 20 38 37 JSR $3738 ; (getch.s0 + 0)
1f5c : a9 1a __ LDA #$1a
1f5e : 8d 00 d6 STA $d600 
.l6413:
1f61 : 2c 00 d6 BIT $d600 
1f64 : 10 fb __ BPL $1f61 ; (main.l6413 + 0)
.s46:
1f66 : ad 01 d6 LDA $d601 
1f69 : 29 f0 __ AND #$f0
1f6b : aa __ __ TAX
1f6c : a9 1a __ LDA #$1a
1f6e : 8d 00 d6 STA $d600 
.l6415:
1f71 : 2c 00 d6 BIT $d600 
1f74 : 10 fb __ BPL $1f71 ; (main.l6415 + 0)
.s52:
1f76 : 8e 01 d6 STX $d601 
1f79 : 8d 00 d6 STA $d600 
.l6417:
1f7c : 2c 00 d6 BIT $d600 
1f7f : 10 fb __ BPL $1f7c ; (main.l6417 + 0)
.s59:
1f81 : ad 01 d6 LDA $d601 
1f84 : 29 0f __ AND #$0f
1f86 : 09 d0 __ ORA #$d0
1f88 : aa __ __ TAX
1f89 : a9 1a __ LDA #$1a
1f8b : 8d 00 d6 STA $d600 
.l6419:
1f8e : 2c 00 d6 BIT $d600 
1f91 : 10 fb __ BPL $1f8e ; (main.l6419 + 0)
.s65:
1f93 : 8e 01 d6 STX $d601 
1f96 : a9 8d __ LDA #$8d
1f98 : 8d ec 42 STA $42ec ; (vdc_state + 7)
1f9b : a9 1c __ LDA #$1c
1f9d : 8d 00 d6 STA $d600 
.l6421:
1fa0 : 2c 00 d6 BIT $d600 
1fa3 : 10 fb __ BPL $1fa0 ; (main.l6421 + 0)
.s71:
1fa5 : ad 01 d6 LDA $d601 
1fa8 : aa __ __ TAX
1fa9 : 09 10 __ ORA #$10
1fab : a8 __ __ TAY
1fac : a9 1c __ LDA #$1c
1fae : 8d 00 d6 STA $d600 
.l6423:
1fb1 : 2c 00 d6 BIT $d600 
1fb4 : 10 fb __ BPL $1fb1 ; (main.l6423 + 0)
.s78:
1fb6 : 8c 01 d6 STY $d601 
1fb9 : a9 12 __ LDA #$12
1fbb : 8d 00 d6 STA $d600 
.l6425:
1fbe : 2c 00 d6 BIT $d600 
1fc1 : 10 fb __ BPL $1fbe ; (main.l6425 + 0)
.s85:
1fc3 : a9 1f __ LDA #$1f
1fc5 : 8d 01 d6 STA $d601 
1fc8 : a9 13 __ LDA #$13
1fca : 8d 00 d6 STA $d600 
.l6427:
1fcd : 2c 00 d6 BIT $d600 
1fd0 : 10 fb __ BPL $1fcd ; (main.l6427 + 0)
.s90:
1fd2 : a9 ff __ LDA #$ff
1fd4 : 8d 01 d6 STA $d601 
1fd7 : a9 1f __ LDA #$1f
1fd9 : 8d 00 d6 STA $d600 
.l6429:
1fdc : 2c 00 d6 BIT $d600 
1fdf : 10 fb __ BPL $1fdc ; (main.l6429 + 0)
.s94:
1fe1 : a9 00 __ LDA #$00
1fe3 : 8d 01 d6 STA $d601 
1fe6 : a9 12 __ LDA #$12
1fe8 : 8d 00 d6 STA $d600 
.l6431:
1feb : 2c 00 d6 BIT $d600 
1fee : 10 fb __ BPL $1feb ; (main.l6431 + 0)
.s101:
1ff0 : a9 9f __ LDA #$9f
1ff2 : 8d 01 d6 STA $d601 
1ff5 : a9 13 __ LDA #$13
1ff7 : 8d 00 d6 STA $d600 
.l6433:
1ffa : 2c 00 d6 BIT $d600 
1ffd : 10 fb __ BPL $1ffa ; (main.l6433 + 0)
.s106:
1fff : a9 ff __ LDA #$ff
2001 : 8d 01 d6 STA $d601 
2004 : a9 1f __ LDA #$1f
2006 : 8d 00 d6 STA $d600 
.l6435:
2009 : 2c 00 d6 BIT $d600 
200c : 10 fb __ BPL $2009 ; (main.l6435 + 0)
.s110:
200e : a9 ff __ LDA #$ff
2010 : 8d 01 d6 STA $d601 
2013 : a9 12 __ LDA #$12
2015 : 8d 00 d6 STA $d600 
.l6437:
2018 : 2c 00 d6 BIT $d600 
201b : 10 fb __ BPL $2018 ; (main.l6437 + 0)
.s117:
201d : a9 1f __ LDA #$1f
201f : 8d 01 d6 STA $d601 
2022 : a9 13 __ LDA #$13
2024 : 8d 00 d6 STA $d600 
.l6439:
2027 : 2c 00 d6 BIT $d600 
202a : 10 fb __ BPL $2027 ; (main.l6439 + 0)
.s122:
202c : a9 ff __ LDA #$ff
202e : 8d 01 d6 STA $d601 
2031 : a9 1f __ LDA #$1f
2033 : 8d 00 d6 STA $d600 
.l6441:
2036 : 2c 00 d6 BIT $d600 
2039 : 10 fb __ BPL $2036 ; (main.l6441 + 0)
.s126:
203b : ad 01 d6 LDA $d601 
203e : f0 04 __ BEQ $2044 ; (main.s1424 + 0)
.s1425:
2040 : a9 10 __ LDA #$10
2042 : d0 02 __ BNE $2046 ; (main.s1426 + 0)
.s1424:
2044 : a9 40 __ LDA #$40
.s1426:
2046 : 8d e5 42 STA $42e5 ; (vdc_state + 0)
2049 : a9 1c __ LDA #$1c
204b : 8d 00 d6 STA $d600 
.l6444:
204e : 2c 00 d6 BIT $d600 
2051 : 10 fb __ BPL $204e ; (main.l6444 + 0)
.s133:
2053 : 8e 01 d6 STX $d601 
2056 : a9 00 __ LDA #$00
2058 : 85 52 __ STA T1 + 0 
205a : ad e8 42 LDA $42e8 ; (vdc_state + 3)
205d : 85 53 __ STA T0 + 0 
205f : ad ea 42 LDA $42ea ; (vdc_state + 5)
2062 : 85 57 __ STA T4 + 0 
.l136:
2064 : a5 52 __ LDA T1 + 0 
2066 : c5 57 __ CMP T4 + 0 
2068 : b0 03 __ BCS $206d ; (main.s66 + 0)
206a : 4c 3e 2e JMP $2e3e ; (main.s137 + 0)
.s66:
206d : 24 d7 __ BIT $d7 
206f : 30 17 __ BMI $2088 ; (main.s211 + 0)
.s214:
2071 : a9 25 __ LDA #$25
2073 : a0 02 __ LDY #$02
2075 : 91 23 __ STA (SP + 0),y 
2077 : a9 38 __ LDA #$38
2079 : c8 __ __ INY
207a : 91 23 __ STA (SP + 0),y 
207c : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
207f : 20 38 37 JSR $3738 ; (getch.s0 + 0)
2082 : 20 50 38 JSR $3850 ; (clrscr.s0 + 0)
2085 : 20 54 38 JSR $3854 ; (screen_setmode.s0 + 0)
.s211:
2088 : a9 06 __ LDA #$06
208a : 8d 06 d5 STA $d506 
208d : a9 00 __ LDA #$00
208f : 85 0d __ STA P0 
2091 : 85 0e __ STA P1 
2093 : 20 c3 35 JSR $35c3 ; (krnio_setbnk.s0 + 0)
2096 : a9 5c __ LDA #$5c
2098 : 85 0d __ STA P0 
209a : a9 38 __ LDA #$38
209c : 85 0e __ STA P1 
209e : 20 d3 35 JSR $35d3 ; (krnio_setnam.s0 + 0)
20a1 : a9 01 __ LDA #$01
20a3 : 85 0d __ STA P0 
20a5 : 85 0f __ STA P2 
20a7 : a9 08 __ LDA #$08
20a9 : 85 0e __ STA P1 
20ab : 20 ff 37 JSR $37ff ; (krnio_load.s0 + 0)
20ae : 09 00 __ ORA #$00
20b0 : d0 19 __ BNE $20cb ; (main.s224 + 0)
.s220:
20b2 : a9 61 __ LDA #$61
20b4 : a0 02 __ LDY #$02
20b6 : 91 23 __ STA (SP + 0),y 
20b8 : a9 38 __ LDA #$38
20ba : c8 __ __ INY
20bb : 91 23 __ STA (SP + 0),y 
20bd : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
20c0 : a9 01 __ LDA #$01
20c2 : 85 0d __ STA P0 
20c4 : a9 00 __ LDA #$00
20c6 : 85 0e __ STA P1 
20c8 : 20 7e 38 JSR $387e ; (exit.s0 + 0)
.s224:
20cb : a9 01 __ LDA #$01
20cd : 8d 30 d0 STA $d030 
20d0 : a9 00 __ LDA #$00
20d2 : 85 16 __ STA P9 
20d4 : ad 11 d0 LDA $d011 
20d7 : 29 6f __ AND #$6f
20d9 : 8d 11 d0 STA $d011 
20dc : 20 93 38 JSR $3893 ; (vdc_set_mode.s1000 + 0)
20df : a9 60 __ LDA #$60
20e1 : 85 0d __ STA P0 
20e3 : 20 00 13 JSR $1300 ; (bnk_writeb.s1000 + 0)
20e6 : a9 60 __ LDA #$60
20e8 : 85 0e __ STA P1 
20ea : 20 10 13 JSR $1310 ; (bnk_writew.s0 + 0)
20ed : a9 60 __ LDA #$60
20ef : a0 04 __ LDY #$04
20f1 : 91 23 __ STA (SP + 0),y 
20f3 : a9 00 __ LDA #$00
20f5 : c8 __ __ INY
20f6 : 91 23 __ STA (SP + 0),y 
20f8 : a9 3b __ LDA #$3b
20fa : a0 02 __ LDY #$02
20fc : 91 23 __ STA (SP + 0),y 
20fe : a9 3d __ LDA #$3d
2100 : c8 __ __ INY
2101 : 91 23 __ STA (SP + 0),y 
2103 : 20 26 13 JSR $1326 ; (bnk_readb.s0 + 0)
2106 : a0 06 __ LDY #$06
2108 : 91 23 __ STA (SP + 0),y 
210a : a9 00 __ LDA #$00
210c : 85 52 __ STA T1 + 0 
210e : c8 __ __ INY
210f : 91 23 __ STA (SP + 0),y 
2111 : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
2114 : a9 60 __ LDA #$60
2116 : a0 04 __ LDY #$04
2118 : 91 23 __ STA (SP + 0),y 
211a : c8 __ __ INY
211b : 91 23 __ STA (SP + 0),y 
211d : a9 5d __ LDA #$5d
211f : a0 02 __ LDY #$02
2121 : 91 23 __ STA (SP + 0),y 
2123 : a9 3d __ LDA #$3d
2125 : c8 __ __ INY
2126 : 91 23 __ STA (SP + 0),y 
2128 : 20 35 13 JSR $1335 ; (bnk_readw.s0 + 0)
212b : a5 1b __ LDA ACCU + 0 
212d : a0 06 __ LDY #$06
212f : 91 23 __ STA (SP + 0),y 
2131 : a5 1c __ LDA ACCU + 1 
2133 : c8 __ __ INY
2134 : 91 23 __ STA (SP + 0),y 
2136 : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
2139 : 20 38 37 JSR $3738 ; (getch.s0 + 0)
.l413:
213c : ad ee 42 LDA $42ee ; (vdc_state + 9)
213f : 85 57 __ STA T4 + 0 
2141 : a9 12 __ LDA #$12
2143 : 8d 00 d6 STA $d600 
2146 : ac ed 42 LDY $42ed ; (vdc_state + 8)
.l6472:
2149 : 2c 00 d6 BIT $d600 
214c : 10 fb __ BPL $2149 ; (main.l6472 + 0)
.s423:
214e : a5 57 __ LDA T4 + 0 
2150 : 8d 01 d6 STA $d601 
2153 : a9 13 __ LDA #$13
2155 : 8d 00 d6 STA $d600 
.l6474:
2158 : 2c 00 d6 BIT $d600 
215b : 10 fb __ BPL $2158 ; (main.l6474 + 0)
.s428:
215d : 8c 01 d6 STY $d601 
2160 : a9 1f __ LDA #$1f
2162 : 8d 00 d6 STA $d600 
.l6476:
2165 : 2c 00 d6 BIT $d600 
2168 : 10 fb __ BPL $2165 ; (main.l6476 + 0)
.s432:
216a : a9 20 __ LDA #$20
216c : 8d 01 d6 STA $d601 
216f : a9 18 __ LDA #$18
2171 : 8d 00 d6 STA $d600 
.l6478:
2174 : 2c 00 d6 BIT $d600 
2177 : 10 fb __ BPL $2174 ; (main.l6478 + 0)
.s438:
2179 : ad 01 d6 LDA $d601 
217c : 29 7f __ AND #$7f
217e : aa __ __ TAX
217f : a9 18 __ LDA #$18
2181 : 8d 00 d6 STA $d600 
.l6480:
2184 : 2c 00 d6 BIT $d600 
2187 : 10 fb __ BPL $2184 ; (main.l6480 + 0)
.s444:
2189 : 8e 01 d6 STX $d601 
218c : a9 1e __ LDA #$1e
218e : 8d 00 d6 STA $d600 
.l6482:
2191 : 2c 00 d6 BIT $d600 
2194 : 10 fb __ BPL $2191 ; (main.l6482 + 0)
.s449:
2196 : a9 4e __ LDA #$4e
2198 : 8d 01 d6 STA $d601 
219b : ad f0 42 LDA $42f0 ; (vdc_state + 11)
219e : 85 45 __ STA T7 + 0 
21a0 : a9 12 __ LDA #$12
21a2 : 8d 00 d6 STA $d600 
21a5 : ae ef 42 LDX $42ef ; (vdc_state + 10)
.l6484:
21a8 : 2c 00 d6 BIT $d600 
21ab : 10 fb __ BPL $21a8 ; (main.l6484 + 0)
.s456:
21ad : a5 45 __ LDA T7 + 0 
21af : 8d 01 d6 STA $d601 
21b2 : a9 13 __ LDA #$13
21b4 : 8d 00 d6 STA $d600 
.l6486:
21b7 : 2c 00 d6 BIT $d600 
21ba : 10 fb __ BPL $21b7 ; (main.l6486 + 0)
.s461:
21bc : 8e 01 d6 STX $d601 
21bf : a9 1f __ LDA #$1f
21c1 : 8d 00 d6 STA $d600 
.l6488:
21c4 : 2c 00 d6 BIT $d600 
21c7 : 10 fb __ BPL $21c4 ; (main.l6488 + 0)
.s465:
21c9 : a9 c5 __ LDA #$c5
21cb : 8d 01 d6 STA $d601 
21ce : a9 18 __ LDA #$18
21d0 : 8d 00 d6 STA $d600 
.l6490:
21d3 : 2c 00 d6 BIT $d600 
21d6 : 10 fb __ BPL $21d3 ; (main.l6490 + 0)
.s471:
21d8 : ad 01 d6 LDA $d601 
21db : 29 7f __ AND #$7f
21dd : aa __ __ TAX
21de : a9 18 __ LDA #$18
21e0 : 8d 00 d6 STA $d600 
.l6492:
21e3 : 2c 00 d6 BIT $d600 
21e6 : 10 fb __ BPL $21e3 ; (main.l6492 + 0)
.s477:
21e8 : 8e 01 d6 STX $d601 
21eb : a9 1e __ LDA #$1e
21ed : 8d 00 d6 STA $d600 
.l6494:
21f0 : 2c 00 d6 BIT $d600 
21f3 : 10 fb __ BPL $21f0 ; (main.l6494 + 0)
.s482:
21f5 : a9 4e __ LDA #$4e
21f7 : 8d 01 d6 STA $d601 
21fa : ad ec 42 LDA $42ec ; (vdc_state + 7)
21fd : 29 f0 __ AND #$f0
21ff : 09 45 __ ORA #$45
2201 : 8d ec 42 STA $42ec ; (vdc_state + 7)
2204 : a2 00 __ LDX #$00
.l1413:
2206 : bd 7e 3d LDA $3d7e,x 
2209 : e8 __ __ INX
220a : 09 00 __ ORA #$00
220c : d0 f8 __ BNE $2206 ; (main.l1413 + 0)
.s1414:
220e : 86 43 __ STX T5 + 0 
2210 : a9 12 __ LDA #$12
2212 : 8d 00 d6 STA $d600 
.l6497:
2215 : 2c 00 d6 BIT $d600 
2218 : 10 fb __ BPL $2215 ; (main.l6497 + 0)
.s498:
221a : a5 57 __ LDA T4 + 0 
221c : 8d 01 d6 STA $d601 
221f : a9 13 __ LDA #$13
2221 : 8d 00 d6 STA $d600 
.l6499:
2224 : 2c 00 d6 BIT $d600 
2227 : 10 fb __ BPL $2224 ; (main.l6499 + 0)
.s503:
2229 : 8c 01 d6 STY $d601 
222c : a9 1f __ LDA #$1f
222e : 8d 00 d6 STA $d600 
2231 : 8a __ __ TXA
2232 : f0 46 __ BEQ $227a ; (main.s508 + 0)
.s1458:
2234 : a2 00 __ LDX #$00
.l506:
2236 : bd 7d 3d LDA $3d7d,x 
2239 : c9 20 __ CMP #$20
223b : b0 04 __ BCS $2241 ; (main.s512 + 0)
.s511:
223d : 09 80 __ ORA #$80
223f : 90 2b __ BCC $226c ; (main.s1418 + 0)
.s512:
2241 : a8 __ __ TAY
2242 : c9 40 __ CMP #$40
2244 : 90 04 __ BCC $224a ; (main.s515 + 0)
.s517:
2246 : c9 60 __ CMP #$60
2248 : 90 11 __ BCC $225b ; (main.s514 + 0)
.s515:
224a : c9 60 __ CMP #$60
224c : 90 05 __ BCC $2253 ; (main.s519 + 0)
.s518:
224e : e9 20 __ SBC #$20
2250 : 4c 6c 22 JMP $226c ; (main.s1418 + 0)
.s519:
2253 : c9 a0 __ CMP #$a0
2255 : 90 0a __ BCC $2261 ; (main.s527 + 0)
.s529:
2257 : c9 c0 __ CMP #$c0
2259 : b0 06 __ BCS $2261 ; (main.s527 + 0)
.s514:
225b : 38 __ __ SEC
225c : e9 40 __ SBC #$40
225e : 4c 6c 22 JMP $226c ; (main.s1418 + 0)
.s527:
2261 : c9 c0 __ CMP #$c0
2263 : 90 08 __ BCC $226d ; (main.l6503 + 0)
.s533:
2265 : c9 ff __ CMP #$ff
2267 : b0 04 __ BCS $226d ; (main.l6503 + 0)
.s530:
2269 : 38 __ __ SEC
226a : e9 80 __ SBC #$80
.s1418:
226c : a8 __ __ TAY
.l6503:
226d : 2c 00 d6 BIT $d600 
2270 : 10 fb __ BPL $226d ; (main.l6503 + 0)
.s539:
2272 : 8c 01 d6 STY $d601 
2275 : e8 __ __ INX
2276 : e4 43 __ CPX T5 + 0 
2278 : 90 bc __ BCC $2236 ; (main.l506 + 0)
.s508:
227a : a9 12 __ LDA #$12
227c : 8d 00 d6 STA $d600 
227f : a6 43 __ LDX T5 + 0 
2281 : ca __ __ DEX
2282 : 86 57 __ STX T4 + 0 
2284 : ad f0 42 LDA $42f0 ; (vdc_state + 11)
2287 : ac ef 42 LDY $42ef ; (vdc_state + 10)
228a : ae ec 42 LDX $42ec ; (vdc_state + 7)
.l6506:
228d : 2c 00 d6 BIT $d600 
2290 : 10 fb __ BPL $228d ; (main.l6506 + 0)
.s546:
2292 : 8d 01 d6 STA $d601 
2295 : a9 13 __ LDA #$13
2297 : 8d 00 d6 STA $d600 
.l6508:
229a : 2c 00 d6 BIT $d600 
229d : 10 fb __ BPL $229a ; (main.l6508 + 0)
.s551:
229f : 8c 01 d6 STY $d601 
22a2 : a9 1f __ LDA #$1f
22a4 : 8d 00 d6 STA $d600 
.l6510:
22a7 : 2c 00 d6 BIT $d600 
22aa : 10 fb __ BPL $22a7 ; (main.l6510 + 0)
.s555:
22ac : 8e 01 d6 STX $d601 
22af : a9 18 __ LDA #$18
22b1 : 8d 00 d6 STA $d600 
.l6512:
22b4 : 2c 00 d6 BIT $d600 
22b7 : 10 fb __ BPL $22b4 ; (main.l6512 + 0)
.s561:
22b9 : ad 01 d6 LDA $d601 
22bc : 29 7f __ AND #$7f
22be : a8 __ __ TAY
22bf : a9 18 __ LDA #$18
22c1 : 8d 00 d6 STA $d600 
.l6514:
22c4 : 2c 00 d6 BIT $d600 
22c7 : 10 fb __ BPL $22c4 ; (main.l6514 + 0)
.s567:
22c9 : 8c 01 d6 STY $d601 
22cc : a9 1e __ LDA #$1e
22ce : 8d 00 d6 STA $d600 
.l6516:
22d1 : 2c 00 d6 BIT $d600 
22d4 : 10 fb __ BPL $22d1 ; (main.l6516 + 0)
.s572:
22d6 : a5 57 __ LDA T4 + 0 
22d8 : 8d 01 d6 STA $d601 
22db : 8a __ __ TXA
22dc : 29 b0 __ AND #$b0
22de : 09 0d __ ORA #$0d
22e0 : 8d ec 42 STA $42ec ; (vdc_state + 7)
22e3 : a9 00 __ LDA #$00
22e5 : a0 02 __ LDY #$02
22e7 : 91 23 __ STA (SP + 0),y 
22e9 : a9 43 __ LDA #$43
22eb : c8 __ __ INY
22ec : 91 23 __ STA (SP + 0),y 
22ee : a9 b4 __ LDA #$b4
22f0 : c8 __ __ INY
22f1 : 91 23 __ STA (SP + 0),y 
22f3 : a9 40 __ LDA #$40
22f5 : c8 __ __ INY
22f6 : 91 23 __ STA (SP + 0),y 
22f8 : ad e5 42 LDA $42e5 ; (vdc_state + 0)
22fb : c8 __ __ INY
22fc : 91 23 __ STA (SP + 0),y 
22fe : a9 00 __ LDA #$00
2300 : c8 __ __ INY
2301 : 91 23 __ STA (SP + 0),y 
2303 : ad e8 42 LDA $42e8 ; (vdc_state + 3)
2306 : 85 53 __ STA T0 + 0 
2308 : c8 __ __ INY
2309 : 91 23 __ STA (SP + 0),y 
230b : ad e9 42 LDA $42e9 ; (vdc_state + 4)
230e : 85 54 __ STA T0 + 1 
2310 : c8 __ __ INY
2311 : 91 23 __ STA (SP + 0),y 
2313 : ad ea 42 LDA $42ea ; (vdc_state + 5)
2316 : c8 __ __ INY
2317 : 91 23 __ STA (SP + 0),y 
2319 : ad eb 42 LDA $42eb ; (vdc_state + 6)
231c : c8 __ __ INY
231d : 91 23 __ STA (SP + 0),y 
231f : ad e6 42 LDA $42e6 ; (vdc_state + 1)
2322 : d0 07 __ BNE $232b ; (main.s3075 + 0)
.s3076:
2324 : a9 40 __ LDA #$40
2326 : a2 f4 __ LDX #$f4
2328 : 4c 2f 23 JMP $232f ; (main.s3077 + 0)
.s3075:
232b : a9 40 __ LDA #$40
232d : a2 f0 __ LDX #$f0
.s3077:
232f : 85 58 __ STA T4 + 1 
2331 : 8a __ __ TXA
2332 : a0 0c __ LDY #$0c
2334 : 91 23 __ STA (SP + 0),y 
2336 : a5 58 __ LDA T4 + 1 
2338 : c8 __ __ INY
2339 : 91 23 __ STA (SP + 0),y 
233b : 20 8e 3d JSR $3d8e ; (sprintf.s1000 + 0)
233e : 06 53 __ ASL T0 + 0 
2340 : 26 54 __ ROL T0 + 1 
2342 : a9 00 __ LDA #$00
2344 : 85 57 __ STA T4 + 0 
2346 : ad 00 43 LDA $4300 ; (linebuffer + 0)
2349 : f0 0c __ BEQ $2357 ; (main.s581 + 0)
.s580:
234b : a2 00 __ LDX #$00
.l1415:
234d : bd 01 43 LDA $4301,x ; (linebuffer + 1)
2350 : e8 __ __ INX
2351 : 09 00 __ ORA #$00
2353 : d0 f8 __ BNE $234d ; (main.l1415 + 0)
.s1416:
2355 : 86 57 __ STX T4 + 0 
.s581:
2357 : ad ed 42 LDA $42ed ; (vdc_state + 8)
235a : 18 __ __ CLC
235b : 65 53 __ ADC T0 + 0 
235d : aa __ __ TAX
235e : a9 12 __ LDA #$12
2360 : 8d 00 d6 STA $d600 
2363 : ad ee 42 LDA $42ee ; (vdc_state + 9)
2366 : 65 54 __ ADC T0 + 1 
.l6521:
2368 : 2c 00 d6 BIT $d600 
236b : 10 fb __ BPL $2368 ; (main.l6521 + 0)
.s588:
236d : 8d 01 d6 STA $d601 
2370 : a9 13 __ LDA #$13
2372 : 8d 00 d6 STA $d600 
.l6523:
2375 : 2c 00 d6 BIT $d600 
2378 : 10 fb __ BPL $2375 ; (main.l6523 + 0)
.s593:
237a : 8e 01 d6 STX $d601 
237d : a9 1f __ LDA #$1f
237f : 8d 00 d6 STA $d600 
2382 : a5 57 __ LDA T4 + 0 
2384 : f0 62 __ BEQ $23e8 ; (main.s598 + 0)
.s1447:
2386 : a2 00 __ LDX #$00
.l596:
2388 : bd 00 43 LDA $4300,x ; (linebuffer + 0)
238b : c9 20 __ CMP #$20
238d : b0 05 __ BCS $2394 ; (main.s602 + 0)
.s601:
238f : 69 80 __ ADC #$80
2391 : 4c da 23 JMP $23da ; (main.s1419 + 0)
.s602:
2394 : a8 __ __ TAY
2395 : c9 40 __ CMP #$40
2397 : 90 04 __ BCC $239d ; (main.s605 + 0)
.s607:
2399 : c9 60 __ CMP #$60
239b : 90 23 __ BCC $23c0 ; (main.s604 + 0)
.s605:
239d : c9 60 __ CMP #$60
239f : 90 0a __ BCC $23ab ; (main.s609 + 0)
.s611:
23a1 : 09 00 __ ORA #$00
23a3 : 30 06 __ BMI $23ab ; (main.s609 + 0)
.s608:
23a5 : 38 __ __ SEC
23a6 : e9 20 __ SBC #$20
23a8 : 4c da 23 JMP $23da ; (main.s1419 + 0)
.s609:
23ab : c9 80 __ CMP #$80
23ad : 90 09 __ BCC $23b8 ; (main.s613 + 0)
.s615:
23af : c9 a0 __ CMP #$a0
23b1 : b0 05 __ BCS $23b8 ; (main.s613 + 0)
.s612:
23b3 : 69 40 __ ADC #$40
23b5 : 4c da 23 JMP $23da ; (main.s1419 + 0)
.s613:
23b8 : c9 a0 __ CMP #$a0
23ba : 90 0a __ BCC $23c6 ; (main.s617 + 0)
.s619:
23bc : c9 c0 __ CMP #$c0
23be : b0 06 __ BCS $23c6 ; (main.s617 + 0)
.s604:
23c0 : 38 __ __ SEC
23c1 : e9 40 __ SBC #$40
23c3 : 4c da 23 JMP $23da ; (main.s1419 + 0)
.s617:
23c6 : c9 c0 __ CMP #$c0
23c8 : 90 0a __ BCC $23d4 ; (main.s621 + 0)
.s623:
23ca : c9 ff __ CMP #$ff
23cc : b0 06 __ BCS $23d4 ; (main.s621 + 0)
.s620:
23ce : 38 __ __ SEC
23cf : e9 80 __ SBC #$80
23d1 : 4c da 23 JMP $23da ; (main.s1419 + 0)
.s621:
23d4 : c9 ff __ CMP #$ff
23d6 : d0 03 __ BNE $23db ; (main.l6527 + 0)
.s624:
23d8 : a9 5e __ LDA #$5e
.s1419:
23da : a8 __ __ TAY
.l6527:
23db : 2c 00 d6 BIT $d600 
23de : 10 fb __ BPL $23db ; (main.l6527 + 0)
.s629:
23e0 : 8c 01 d6 STY $d601 
23e3 : e8 __ __ INX
23e4 : e4 57 __ CPX T4 + 0 
23e6 : 90 a0 __ BCC $2388 ; (main.l596 + 0)
.s598:
23e8 : a9 12 __ LDA #$12
23ea : 8d 00 d6 STA $d600 
23ed : c6 57 __ DEC T4 + 0 
23ef : 18 __ __ CLC
23f0 : a5 53 __ LDA T0 + 0 
23f2 : 6d ef 42 ADC $42ef ; (vdc_state + 10)
23f5 : a8 __ __ TAY
23f6 : a5 54 __ LDA T0 + 1 
23f8 : 6d f0 42 ADC $42f0 ; (vdc_state + 11)
23fb : ae ec 42 LDX $42ec ; (vdc_state + 7)
.l6530:
23fe : 2c 00 d6 BIT $d600 
2401 : 10 fb __ BPL $23fe ; (main.l6530 + 0)
.s636:
2403 : 8d 01 d6 STA $d601 
2406 : a9 13 __ LDA #$13
2408 : 8d 00 d6 STA $d600 
.l6532:
240b : 2c 00 d6 BIT $d600 
240e : 10 fb __ BPL $240b ; (main.l6532 + 0)
.s641:
2410 : 8c 01 d6 STY $d601 
2413 : a9 1f __ LDA #$1f
2415 : 8d 00 d6 STA $d600 
.l6534:
2418 : 2c 00 d6 BIT $d600 
241b : 10 fb __ BPL $2418 ; (main.l6534 + 0)
.s645:
241d : 8e 01 d6 STX $d601 
2420 : a9 18 __ LDA #$18
2422 : 8d 00 d6 STA $d600 
.l6536:
2425 : 2c 00 d6 BIT $d600 
2428 : 10 fb __ BPL $2425 ; (main.l6536 + 0)
.s651:
242a : ad 01 d6 LDA $d601 
242d : 29 7f __ AND #$7f
242f : aa __ __ TAX
2430 : a9 18 __ LDA #$18
2432 : 8d 00 d6 STA $d600 
.l6538:
2435 : 2c 00 d6 BIT $d600 
2438 : 10 fb __ BPL $2435 ; (main.l6538 + 0)
.s657:
243a : 8e 01 d6 STX $d601 
243d : a9 1e __ LDA #$1e
243f : 8d 00 d6 STA $d600 
.l6540:
2442 : 2c 00 d6 BIT $d600 
2445 : 10 fb __ BPL $2442 ; (main.l6540 + 0)
.s662:
2447 : a5 57 __ LDA T4 + 0 
2449 : 8d 01 d6 STA $d601 
244c : ad e8 42 LDA $42e8 ; (vdc_state + 3)
244f : 0a __ __ ASL
2450 : aa __ __ TAX
2451 : a9 12 __ LDA #$12
2453 : 8d 00 d6 STA $d600 
2456 : ad e9 42 LDA $42e9 ; (vdc_state + 4)
2459 : 2a __ __ ROL
245a : a8 __ __ TAY
245b : 8a __ __ TXA
245c : 18 __ __ CLC
245d : 6d e8 42 ADC $42e8 ; (vdc_state + 3)
2460 : aa __ __ TAX
2461 : 98 __ __ TYA
2462 : 6d e9 42 ADC $42e9 ; (vdc_state + 4)
2465 : a8 __ __ TAY
2466 : 8a __ __ TXA
2467 : 18 __ __ CLC
2468 : 69 04 __ ADC #$04
246a : 85 45 __ STA T7 + 0 
246c : 98 __ __ TYA
246d : 69 00 __ ADC #$00
246f : 85 46 __ STA T7 + 1 
2471 : 18 __ __ CLC
2472 : a5 45 __ LDA T7 + 0 
2474 : 6d ed 42 ADC $42ed ; (vdc_state + 8)
2477 : 85 47 __ STA T8 + 0 
2479 : a5 46 __ LDA T7 + 1 
247b : 6d ee 42 ADC $42ee ; (vdc_state + 9)
.l6542:
247e : 2c 00 d6 BIT $d600 
2481 : 10 fb __ BPL $247e ; (main.l6542 + 0)
.s672:
2483 : 8d 01 d6 STA $d601 
2486 : a9 13 __ LDA #$13
2488 : 8d 00 d6 STA $d600 
.l6544:
248b : 2c 00 d6 BIT $d600 
248e : 10 fb __ BPL $248b ; (main.l6544 + 0)
.s677:
2490 : a5 47 __ LDA T8 + 0 
2492 : 8d 01 d6 STA $d601 
2495 : a9 1f __ LDA #$1f
2497 : 8d 00 d6 STA $d600 
.l6546:
249a : 2c 00 d6 BIT $d600 
249d : 10 fb __ BPL $249a ; (main.l6546 + 0)
.s681:
249f : a9 6c __ LDA #$6c
24a1 : 8d 01 d6 STA $d601 
24a4 : a9 12 __ LDA #$12
24a6 : 8d 00 d6 STA $d600 
24a9 : 18 __ __ CLC
24aa : a5 45 __ LDA T7 + 0 
24ac : 6d ef 42 ADC $42ef ; (vdc_state + 10)
24af : 85 45 __ STA T7 + 0 
24b1 : a5 46 __ LDA T7 + 1 
24b3 : 6d f0 42 ADC $42f0 ; (vdc_state + 11)
.l6548:
24b6 : 2c 00 d6 BIT $d600 
24b9 : 10 fb __ BPL $24b6 ; (main.l6548 + 0)
.s688:
24bb : 8d 01 d6 STA $d601 
24be : a9 13 __ LDA #$13
24c0 : 8d 00 d6 STA $d600 
.l6550:
24c3 : 2c 00 d6 BIT $d600 
24c6 : 10 fb __ BPL $24c3 ; (main.l6550 + 0)
.s693:
24c8 : a5 45 __ LDA T7 + 0 
24ca : 8d 01 d6 STA $d601 
24cd : a9 1f __ LDA #$1f
24cf : 8d 00 d6 STA $d600 
.l6552:
24d2 : 2c 00 d6 BIT $d600 
24d5 : 10 fb __ BPL $24d2 ; (main.l6552 + 0)
.s697:
24d7 : a9 09 __ LDA #$09
24d9 : 8d 01 d6 STA $d601 
24dc : a9 12 __ LDA #$12
24de : 8d 00 d6 STA $d600 
24e1 : 8a __ __ TXA
24e2 : 18 __ __ CLC
24e3 : 69 05 __ ADC #$05
24e5 : 85 45 __ STA T7 + 0 
24e7 : 98 __ __ TYA
24e8 : 69 00 __ ADC #$00
24ea : 85 46 __ STA T7 + 1 
24ec : 18 __ __ CLC
24ed : a5 45 __ LDA T7 + 0 
24ef : 6d ed 42 ADC $42ed ; (vdc_state + 8)
24f2 : 85 47 __ STA T8 + 0 
24f4 : a5 46 __ LDA T7 + 1 
24f6 : 6d ee 42 ADC $42ee ; (vdc_state + 9)
.l6554:
24f9 : 2c 00 d6 BIT $d600 
24fc : 10 fb __ BPL $24f9 ; (main.l6554 + 0)
.s707:
24fe : 8d 01 d6 STA $d601 
2501 : a9 13 __ LDA #$13
2503 : 8d 00 d6 STA $d600 
.l6556:
2506 : 2c 00 d6 BIT $d600 
2509 : 10 fb __ BPL $2506 ; (main.l6556 + 0)
.s712:
250b : a5 47 __ LDA T8 + 0 
250d : 8d 01 d6 STA $d601 
2510 : a9 1f __ LDA #$1f
2512 : 8d 00 d6 STA $d600 
.l6558:
2515 : 2c 00 d6 BIT $d600 
2518 : 10 fb __ BPL $2515 ; (main.l6558 + 0)
.s716:
251a : a9 62 __ LDA #$62
251c : 8d 01 d6 STA $d601 
251f : a9 18 __ LDA #$18
2521 : 8d 00 d6 STA $d600 
.l6560:
2524 : 2c 00 d6 BIT $d600 
2527 : 10 fb __ BPL $2524 ; (main.l6560 + 0)
.s722:
2529 : ad 01 d6 LDA $d601 
252c : 29 7f __ AND #$7f
252e : 85 47 __ STA T8 + 0 
2530 : a9 18 __ LDA #$18
2532 : 8d 00 d6 STA $d600 
.l6562:
2535 : 2c 00 d6 BIT $d600 
2538 : 10 fb __ BPL $2535 ; (main.l6562 + 0)
.s728:
253a : a5 47 __ LDA T8 + 0 
253c : 8d 01 d6 STA $d601 
253f : a9 1e __ LDA #$1e
2541 : 8d 00 d6 STA $d600 
.l6564:
2544 : 2c 00 d6 BIT $d600 
2547 : 10 fb __ BPL $2544 ; (main.l6564 + 0)
.s733:
2549 : a9 45 __ LDA #$45
254b : 8d 01 d6 STA $d601 
254e : a9 12 __ LDA #$12
2550 : 8d 00 d6 STA $d600 
2553 : 18 __ __ CLC
2554 : a5 45 __ LDA T7 + 0 
2556 : 6d ef 42 ADC $42ef ; (vdc_state + 10)
2559 : 85 45 __ STA T7 + 0 
255b : a5 46 __ LDA T7 + 1 
255d : 6d f0 42 ADC $42f0 ; (vdc_state + 11)
.l6566:
2560 : 2c 00 d6 BIT $d600 
2563 : 10 fb __ BPL $2560 ; (main.l6566 + 0)
.s740:
2565 : 8d 01 d6 STA $d601 
2568 : a9 13 __ LDA #$13
256a : 8d 00 d6 STA $d600 
.l6568:
256d : 2c 00 d6 BIT $d600 
2570 : 10 fb __ BPL $256d ; (main.l6568 + 0)
.s745:
2572 : a5 45 __ LDA T7 + 0 
2574 : 8d 01 d6 STA $d601 
2577 : a9 1f __ LDA #$1f
2579 : 8d 00 d6 STA $d600 
.l6570:
257c : 2c 00 d6 BIT $d600 
257f : 10 fb __ BPL $257c ; (main.l6570 + 0)
.s749:
2581 : a9 09 __ LDA #$09
2583 : 8d 01 d6 STA $d601 
2586 : a9 18 __ LDA #$18
2588 : 8d 00 d6 STA $d600 
.l6572:
258b : 2c 00 d6 BIT $d600 
258e : 10 fb __ BPL $258b ; (main.l6572 + 0)
.s755:
2590 : ad 01 d6 LDA $d601 
2593 : 29 7f __ AND #$7f
2595 : 85 45 __ STA T7 + 0 
2597 : a9 18 __ LDA #$18
2599 : 8d 00 d6 STA $d600 
.l6574:
259c : 2c 00 d6 BIT $d600 
259f : 10 fb __ BPL $259c ; (main.l6574 + 0)
.s761:
25a1 : a5 45 __ LDA T7 + 0 
25a3 : 8d 01 d6 STA $d601 
25a6 : a9 1e __ LDA #$1e
25a8 : 8d 00 d6 STA $d600 
.l6576:
25ab : 2c 00 d6 BIT $d600 
25ae : 10 fb __ BPL $25ab ; (main.l6576 + 0)
.s766:
25b0 : a9 45 __ LDA #$45
25b2 : 8d 01 d6 STA $d601 
25b5 : a9 12 __ LDA #$12
25b7 : 8d 00 d6 STA $d600 
25ba : 8a __ __ TXA
25bb : 18 __ __ CLC
25bc : 69 4b __ ADC #$4b
25be : aa __ __ TAX
25bf : 90 01 __ BCC $25c2 ; (main.s1428 + 0)
.s1427:
25c1 : c8 __ __ INY
.s1428:
25c2 : 18 __ __ CLC
25c3 : 6d ed 42 ADC $42ed ; (vdc_state + 8)
25c6 : 85 57 __ STA T4 + 0 
25c8 : 98 __ __ TYA
25c9 : 6d ee 42 ADC $42ee ; (vdc_state + 9)
.l6578:
25cc : 2c 00 d6 BIT $d600 
25cf : 10 fb __ BPL $25cc ; (main.l6578 + 0)
.s776:
25d1 : 8d 01 d6 STA $d601 
25d4 : a9 13 __ LDA #$13
25d6 : 8d 00 d6 STA $d600 
.l6580:
25d9 : 2c 00 d6 BIT $d600 
25dc : 10 fb __ BPL $25d9 ; (main.l6580 + 0)
.s781:
25de : a5 57 __ LDA T4 + 0 
25e0 : 8d 01 d6 STA $d601 
25e3 : a9 1f __ LDA #$1f
25e5 : 8d 00 d6 STA $d600 
.l6582:
25e8 : 2c 00 d6 BIT $d600 
25eb : 10 fb __ BPL $25e8 ; (main.l6582 + 0)
.s785:
25ed : a9 7b __ LDA #$7b
25ef : 8d 01 d6 STA $d601 
25f2 : a9 12 __ LDA #$12
25f4 : 8d 00 d6 STA $d600 
25f7 : 8a __ __ TXA
25f8 : 18 __ __ CLC
25f9 : 6d ef 42 ADC $42ef ; (vdc_state + 10)
25fc : aa __ __ TAX
25fd : 98 __ __ TYA
25fe : 6d f0 42 ADC $42f0 ; (vdc_state + 11)
.l6584:
2601 : 2c 00 d6 BIT $d600 
2604 : 10 fb __ BPL $2601 ; (main.l6584 + 0)
.s792:
2606 : 8d 01 d6 STA $d601 
2609 : a9 13 __ LDA #$13
260b : 8d 00 d6 STA $d600 
.l6586:
260e : 2c 00 d6 BIT $d600 
2611 : 10 fb __ BPL $260e ; (main.l6586 + 0)
.s797:
2613 : 8e 01 d6 STX $d601 
2616 : a9 1f __ LDA #$1f
2618 : 8d 00 d6 STA $d600 
.l6588:
261b : 2c 00 d6 BIT $d600 
261e : 10 fb __ BPL $261b ; (main.l6588 + 0)
.s801:
2620 : a9 09 __ LDA #$09
2622 : 8d 01 d6 STA $d601 
2625 : ad ea 42 LDA $42ea ; (vdc_state + 5)
2628 : 38 __ __ SEC
2629 : e9 05 __ SBC #$05
262b : 85 53 __ STA T0 + 0 
262d : a9 04 __ LDA #$04
262f : 85 59 __ STA T6 + 0 
.l803:
2631 : 18 __ __ CLC
2632 : a5 53 __ LDA T0 + 0 
2634 : 69 04 __ ADC #$04
2636 : 90 03 __ BCC $263b ; (main.s1185 + 0)
2638 : 4c b3 2d JMP $2db3 ; (main.s804 + 0)
.s1185:
263b : c5 59 __ CMP T6 + 0 
263d : 90 05 __ BCC $2644 ; (main.s802 + 0)
.s1429:
263f : f0 03 __ BEQ $2644 ; (main.s802 + 0)
2641 : 4c b3 2d JMP $2db3 ; (main.s804 + 0)
.s802:
2644 : ad ea 42 LDA $42ea ; (vdc_state + 5)
2647 : 38 __ __ SEC
2648 : e9 05 __ SBC #$05
264a : 85 53 __ STA T0 + 0 
264c : a9 04 __ LDA #$04
264e : 85 59 __ STA T6 + 0 
.l843:
2650 : 18 __ __ CLC
2651 : a5 53 __ LDA T0 + 0 
2653 : 69 04 __ ADC #$04
2655 : 85 45 __ STA T7 + 0 
2657 : ad e8 42 LDA $42e8 ; (vdc_state + 3)
265a : 85 57 __ STA T4 + 0 
265c : ad e9 42 LDA $42e9 ; (vdc_state + 4)
265f : 85 58 __ STA T4 + 1 
2661 : ad ed 42 LDA $42ed ; (vdc_state + 8)
2664 : 85 43 __ STA T5 + 0 
2666 : ad ee 42 LDA $42ee ; (vdc_state + 9)
2669 : 85 44 __ STA T5 + 1 
266b : 90 03 __ BCC $2670 ; (main.s1171 + 0)
266d : 4c 2c 2d JMP $2d2c ; (main.s844 + 0)
.s1171:
2670 : a5 59 __ LDA T6 + 0 
2672 : c5 45 __ CMP T7 + 0 
2674 : b0 03 __ BCS $2679 ; (main.s842 + 0)
2676 : 4c 2c 2d JMP $2d2c ; (main.s844 + 0)
.s842:
2679 : a9 12 __ LDA #$12
267b : 8d 00 d6 STA $d600 
267e : ad ea 42 LDA $42ea ; (vdc_state + 5)
2681 : e9 01 __ SBC #$01
2683 : 85 53 __ STA T0 + 0 
2685 : ad eb 42 LDA $42eb ; (vdc_state + 6)
2688 : e9 00 __ SBC #$00
268a : 85 54 __ STA T0 + 1 
268c : a5 57 __ LDA T4 + 0 
268e : 85 1b __ STA ACCU + 0 
2690 : a5 58 __ LDA T4 + 1 
2692 : 85 1c __ STA ACCU + 1 
2694 : a5 53 __ LDA T0 + 0 
2696 : 20 f8 40 JSR $40f8 ; (mul16by8 + 0)
2699 : 18 __ __ CLC
269a : a5 05 __ LDA WORK + 2 
269c : 69 04 __ ADC #$04
269e : aa __ __ TAX
269f : a5 06 __ LDA WORK + 3 
26a1 : 69 00 __ ADC #$00
26a3 : a8 __ __ TAY
26a4 : 8a __ __ TXA
26a5 : 18 __ __ CLC
26a6 : 65 43 __ ADC T5 + 0 
26a8 : 85 49 __ STA T9 + 0 
26aa : 98 __ __ TYA
26ab : 65 44 __ ADC T5 + 1 
.l6616:
26ad : 2c 00 d6 BIT $d600 
26b0 : 10 fb __ BPL $26ad ; (main.l6616 + 0)
.s891:
26b2 : 8d 01 d6 STA $d601 
26b5 : a9 13 __ LDA #$13
26b7 : 8d 00 d6 STA $d600 
.l6618:
26ba : 2c 00 d6 BIT $d600 
26bd : 10 fb __ BPL $26ba ; (main.l6618 + 0)
.s896:
26bf : a5 49 __ LDA T9 + 0 
26c1 : 8d 01 d6 STA $d601 
26c4 : a9 1f __ LDA #$1f
26c6 : 8d 00 d6 STA $d600 
.l6620:
26c9 : 2c 00 d6 BIT $d600 
26cc : 10 fb __ BPL $26c9 ; (main.l6620 + 0)
.s900:
26ce : a9 7c __ LDA #$7c
26d0 : 8d 01 d6 STA $d601 
26d3 : a9 12 __ LDA #$12
26d5 : 8d 00 d6 STA $d600 
26d8 : 8a __ __ TXA
26d9 : 18 __ __ CLC
26da : 6d ef 42 ADC $42ef ; (vdc_state + 10)
26dd : aa __ __ TAX
26de : 98 __ __ TYA
26df : 6d f0 42 ADC $42f0 ; (vdc_state + 11)
.l6622:
26e2 : 2c 00 d6 BIT $d600 
26e5 : 10 fb __ BPL $26e2 ; (main.l6622 + 0)
.s907:
26e7 : 8d 01 d6 STA $d601 
26ea : a9 13 __ LDA #$13
26ec : 8d 00 d6 STA $d600 
.l6624:
26ef : 2c 00 d6 BIT $d600 
26f2 : 10 fb __ BPL $26ef ; (main.l6624 + 0)
.s912:
26f4 : 8e 01 d6 STX $d601 
26f7 : a9 1f __ LDA #$1f
26f9 : 8d 00 d6 STA $d600 
.l6626:
26fc : 2c 00 d6 BIT $d600 
26ff : 10 fb __ BPL $26fc ; (main.l6626 + 0)
.s916:
2701 : a9 09 __ LDA #$09
2703 : 8d 01 d6 STA $d601 
2706 : a9 12 __ LDA #$12
2708 : 8d 00 d6 STA $d600 
270b : 18 __ __ CLC
270c : a5 05 __ LDA WORK + 2 
270e : 69 05 __ ADC #$05
2710 : aa __ __ TAX
2711 : a5 06 __ LDA WORK + 3 
2713 : 69 00 __ ADC #$00
2715 : a8 __ __ TAY
2716 : 8a __ __ TXA
2717 : 18 __ __ CLC
2718 : 65 43 __ ADC T5 + 0 
271a : 85 4c __ STA T11 + 0 
271c : 98 __ __ TYA
271d : 65 44 __ ADC T5 + 1 
.l6628:
271f : 2c 00 d6 BIT $d600 
2722 : 10 fb __ BPL $271f ; (main.l6628 + 0)
.s926:
2724 : 8d 01 d6 STA $d601 
2727 : a9 13 __ LDA #$13
2729 : 8d 00 d6 STA $d600 
.l6630:
272c : 2c 00 d6 BIT $d600 
272f : 10 fb __ BPL $272c ; (main.l6630 + 0)
.s931:
2731 : a5 4c __ LDA T11 + 0 
2733 : 8d 01 d6 STA $d601 
2736 : a9 1f __ LDA #$1f
2738 : 8d 00 d6 STA $d600 
.l6632:
273b : 2c 00 d6 BIT $d600 
273e : 10 fb __ BPL $273b ; (main.l6632 + 0)
.s935:
2740 : a9 e2 __ LDA #$e2
2742 : 8d 01 d6 STA $d601 
2745 : a9 18 __ LDA #$18
2747 : 8d 00 d6 STA $d600 
.l6634:
274a : 2c 00 d6 BIT $d600 
274d : 10 fb __ BPL $274a ; (main.l6634 + 0)
.s941:
274f : ad 01 d6 LDA $d601 
2752 : 29 7f __ AND #$7f
2754 : 85 4c __ STA T11 + 0 
2756 : a9 18 __ LDA #$18
2758 : 8d 00 d6 STA $d600 
.l6636:
275b : 2c 00 d6 BIT $d600 
275e : 10 fb __ BPL $275b ; (main.l6636 + 0)
.s947:
2760 : a5 4c __ LDA T11 + 0 
2762 : 8d 01 d6 STA $d601 
2765 : a9 1e __ LDA #$1e
2767 : 8d 00 d6 STA $d600 
.l6638:
276a : 2c 00 d6 BIT $d600 
276d : 10 fb __ BPL $276a ; (main.l6638 + 0)
.s952:
276f : a9 45 __ LDA #$45
2771 : 8d 01 d6 STA $d601 
2774 : a9 12 __ LDA #$12
2776 : 8d 00 d6 STA $d600 
2779 : 8a __ __ TXA
277a : 18 __ __ CLC
277b : 6d ef 42 ADC $42ef ; (vdc_state + 10)
277e : aa __ __ TAX
277f : 98 __ __ TYA
2780 : 6d f0 42 ADC $42f0 ; (vdc_state + 11)
.l6640:
2783 : 2c 00 d6 BIT $d600 
2786 : 10 fb __ BPL $2783 ; (main.l6640 + 0)
.s959:
2788 : 8d 01 d6 STA $d601 
278b : a9 13 __ LDA #$13
278d : 8d 00 d6 STA $d600 
.l6642:
2790 : 2c 00 d6 BIT $d600 
2793 : 10 fb __ BPL $2790 ; (main.l6642 + 0)
.s964:
2795 : 8e 01 d6 STX $d601 
2798 : a9 1f __ LDA #$1f
279a : 8d 00 d6 STA $d600 
.l6644:
279d : 2c 00 d6 BIT $d600 
27a0 : 10 fb __ BPL $279d ; (main.l6644 + 0)
.s968:
27a2 : a9 09 __ LDA #$09
27a4 : 8d 01 d6 STA $d601 
27a7 : a9 18 __ LDA #$18
27a9 : 8d 00 d6 STA $d600 
.l6646:
27ac : 2c 00 d6 BIT $d600 
27af : 10 fb __ BPL $27ac ; (main.l6646 + 0)
.s974:
27b1 : ad 01 d6 LDA $d601 
27b4 : 29 7f __ AND #$7f
27b6 : aa __ __ TAX
27b7 : a9 18 __ LDA #$18
27b9 : 8d 00 d6 STA $d600 
.l6648:
27bc : 2c 00 d6 BIT $d600 
27bf : 10 fb __ BPL $27bc ; (main.l6648 + 0)
.s980:
27c1 : 8e 01 d6 STX $d601 
27c4 : a9 1e __ LDA #$1e
27c6 : 8d 00 d6 STA $d600 
.l6650:
27c9 : 2c 00 d6 BIT $d600 
27cc : 10 fb __ BPL $27c9 ; (main.l6650 + 0)
.s985:
27ce : a9 45 __ LDA #$45
27d0 : 8d 01 d6 STA $d601 
27d3 : a9 12 __ LDA #$12
27d5 : 8d 00 d6 STA $d600 
27d8 : 18 __ __ CLC
27d9 : a5 05 __ LDA WORK + 2 
27db : 69 4b __ ADC #$4b
27dd : aa __ __ TAX
27de : a5 06 __ LDA WORK + 3 
27e0 : 69 00 __ ADC #$00
27e2 : a8 __ __ TAY
27e3 : 8a __ __ TXA
27e4 : 18 __ __ CLC
27e5 : 65 43 __ ADC T5 + 0 
27e7 : 85 47 __ STA T8 + 0 
27e9 : 98 __ __ TYA
27ea : 65 44 __ ADC T5 + 1 
.l6652:
27ec : 2c 00 d6 BIT $d600 
27ef : 10 fb __ BPL $27ec ; (main.l6652 + 0)
.s995:
27f1 : 8d 01 d6 STA $d601 
27f4 : a9 13 __ LDA #$13
27f6 : 8d 00 d6 STA $d600 
.l6654:
27f9 : 2c 00 d6 BIT $d600 
27fc : 10 fb __ BPL $27f9 ; (main.l6654 + 0)
.s1000:
27fe : a5 47 __ LDA T8 + 0 
2800 : 8d 01 d6 STA $d601 
2803 : a9 1f __ LDA #$1f
2805 : 8d 00 d6 STA $d600 
.l6656:
2808 : 2c 00 d6 BIT $d600 
280b : 10 fb __ BPL $2808 ; (main.l6656 + 0)
.s1004:
280d : a9 7e __ LDA #$7e
280f : 8d 01 d6 STA $d601 
2812 : a9 12 __ LDA #$12
2814 : 8d 00 d6 STA $d600 
2817 : 8a __ __ TXA
2818 : 18 __ __ CLC
2819 : 6d ef 42 ADC $42ef ; (vdc_state + 10)
281c : aa __ __ TAX
281d : 98 __ __ TYA
281e : 6d f0 42 ADC $42f0 ; (vdc_state + 11)
.l6658:
2821 : 2c 00 d6 BIT $d600 
2824 : 10 fb __ BPL $2821 ; (main.l6658 + 0)
.s1011:
2826 : 8d 01 d6 STA $d601 
2829 : a9 13 __ LDA #$13
282b : 8d 00 d6 STA $d600 
.l6660:
282e : 2c 00 d6 BIT $d600 
2831 : 10 fb __ BPL $282e ; (main.l6660 + 0)
.s1016:
2833 : 8e 01 d6 STX $d601 
2836 : a9 1f __ LDA #$1f
2838 : 8d 00 d6 STA $d600 
.l6662:
283b : 2c 00 d6 BIT $d600 
283e : 10 fb __ BPL $283b ; (main.l6662 + 0)
.s1020:
2840 : a9 09 __ LDA #$09
2842 : 8d 01 d6 STA $d601 
2845 : a5 54 __ LDA T0 + 1 
2847 : d0 06 __ BNE $284f ; (main.s1389 + 0)
.s1110:
2849 : a9 04 __ LDA #$04
284b : c5 53 __ CMP T0 + 0 
284d : b0 0f __ BCS $285e ; (main.s1024 + 0)
.s1389:
284f : a5 57 __ LDA T4 + 0 
2851 : 85 53 __ STA T0 + 0 
2853 : a5 58 __ LDA T4 + 1 
2855 : 85 54 __ STA T0 + 1 
2857 : a9 04 __ LDA #$04
2859 : 85 59 __ STA T6 + 0 
285b : 4c 5f 2c JMP $2c5f ; (main.l1022 + 0)
.s1024:
285e : ad ea 42 LDA $42ea ; (vdc_state + 5)
2861 : e9 05 __ SBC #$05
2863 : 85 53 __ STA T0 + 0 
2865 : ad eb 42 LDA $42eb ; (vdc_state + 6)
2868 : e9 00 __ SBC #$00
286a : 05 53 __ ORA T0 + 0 
286c : f0 03 __ BEQ $2871 ; (main.s409 + 0)
286e : 4c af 29 JMP $29af ; (main.s1381 + 0)
.s409:
2871 : e6 52 __ INC T1 + 0 
2873 : a5 52 __ LDA T1 + 0 
2875 : c9 02 __ CMP #$02
2877 : b0 0f __ BCS $2888 ; (main.s410 + 0)
.s408:
2879 : 09 00 __ ORA #$00
287b : d0 03 __ BNE $2880 ; (main.s411 + 0)
287d : 4c 3c 21 JMP $213c ; (main.l413 + 0)
.s411:
2880 : 85 16 __ STA P9 
2882 : 20 93 38 JSR $3893 ; (vdc_set_mode.s1000 + 0)
2885 : 4c 3c 21 JMP $213c ; (main.l413 + 0)
.s410:
2888 : a9 00 __ LDA #$00
288a : 85 52 __ STA T1 + 0 
288c : 8d 30 d0 STA $d030 
288f : 85 16 __ STA P9 
2891 : ad 11 d0 LDA $d011 
2894 : 29 7f __ AND #$7f
2896 : 09 10 __ ORA #$10
2898 : 8d 11 d0 STA $d011 
289b : 20 93 38 JSR $3893 ; (vdc_set_mode.s1000 + 0)
289e : ad e8 42 LDA $42e8 ; (vdc_state + 3)
28a1 : 85 53 __ STA T0 + 0 
28a3 : ad ea 42 LDA $42ea ; (vdc_state + 5)
28a6 : 85 57 __ STA T4 + 0 
.l1241:
28a8 : a5 52 __ LDA T1 + 0 
28aa : c5 57 __ CMP T4 + 0 
28ac : 90 21 __ BCC $28cf ; (main.s1242 + 0)
.s1239:
28ae : a9 04 __ LDA #$04
28b0 : 8d 06 d5 STA $d506 
28b3 : a9 00 __ LDA #$00
28b5 : 85 1b __ STA ACCU + 0 
28b7 : 85 1c __ STA ACCU + 1 
.s1001:
28b9 : 18 __ __ CLC
28ba : a5 23 __ LDA SP + 0 
28bc : 69 0e __ ADC #$0e
28be : 85 23 __ STA SP + 0 
28c0 : 90 02 __ BCC $28c4 ; (main.s1001 + 11)
28c2 : e6 24 __ INC SP + 1 
28c4 : a2 06 __ LDX #$06
28c6 : bd 45 bf LDA $bf45,x ; (main@stack + 0)
28c9 : 95 53 __ STA T0 + 0,x 
28cb : ca __ __ DEX
28cc : 10 f8 __ BPL $28c6 ; (main.s1001 + 13)
28ce : 60 __ __ RTS
.s1242:
28cf : ad e8 42 LDA $42e8 ; (vdc_state + 3)
28d2 : 85 1b __ STA ACCU + 0 
28d4 : ad e9 42 LDA $42e9 ; (vdc_state + 4)
28d7 : 85 1c __ STA ACCU + 1 
28d9 : ad ec 42 LDA $42ec ; (vdc_state + 7)
28dc : 85 55 __ STA T2 + 0 
28de : a9 12 __ LDA #$12
28e0 : 8d 00 d6 STA $d600 
28e3 : a6 53 __ LDX T0 + 0 
28e5 : ca __ __ DEX
28e6 : 86 47 __ STX T8 + 0 
28e8 : a5 52 __ LDA T1 + 0 
28ea : 20 f8 40 JSR $40f8 ; (mul16by8 + 0)
28ed : 18 __ __ CLC
28ee : a5 05 __ LDA WORK + 2 
28f0 : 6d ed 42 ADC $42ed ; (vdc_state + 8)
28f3 : aa __ __ TAX
28f4 : a5 06 __ LDA WORK + 3 
28f6 : 6d ee 42 ADC $42ee ; (vdc_state + 9)
.l6739:
28f9 : 2c 00 d6 BIT $d600 
28fc : 10 fb __ BPL $28f9 ; (main.l6739 + 0)
.s1254:
28fe : 8d 01 d6 STA $d601 
2901 : a9 13 __ LDA #$13
2903 : 8d 00 d6 STA $d600 
.l6741:
2906 : 2c 00 d6 BIT $d600 
2909 : 10 fb __ BPL $2906 ; (main.l6741 + 0)
.s1259:
290b : 8e 01 d6 STX $d601 
290e : a9 1f __ LDA #$1f
2910 : 8d 00 d6 STA $d600 
.l6743:
2913 : 2c 00 d6 BIT $d600 
2916 : 10 fb __ BPL $2913 ; (main.l6743 + 0)
.s1263:
2918 : a9 20 __ LDA #$20
291a : 8d 01 d6 STA $d601 
291d : a9 18 __ LDA #$18
291f : 8d 00 d6 STA $d600 
.l6745:
2922 : 2c 00 d6 BIT $d600 
2925 : 10 fb __ BPL $2922 ; (main.l6745 + 0)
.s1269:
2927 : ad 01 d6 LDA $d601 
292a : 29 7f __ AND #$7f
292c : aa __ __ TAX
292d : a9 18 __ LDA #$18
292f : 8d 00 d6 STA $d600 
.l6747:
2932 : 2c 00 d6 BIT $d600 
2935 : 10 fb __ BPL $2932 ; (main.l6747 + 0)
.s1275:
2937 : 8e 01 d6 STX $d601 
293a : a9 1e __ LDA #$1e
293c : 8d 00 d6 STA $d600 
.l6749:
293f : 2c 00 d6 BIT $d600 
2942 : 10 fb __ BPL $293f ; (main.l6749 + 0)
.s1280:
2944 : a5 47 __ LDA T8 + 0 
2946 : 8d 01 d6 STA $d601 
2949 : ad ef 42 LDA $42ef ; (vdc_state + 10)
294c : 18 __ __ CLC
294d : 65 05 __ ADC WORK + 2 
294f : aa __ __ TAX
2950 : a9 12 __ LDA #$12
2952 : 8d 00 d6 STA $d600 
2955 : ad f0 42 LDA $42f0 ; (vdc_state + 11)
2958 : 65 06 __ ADC WORK + 3 
.l6751:
295a : 2c 00 d6 BIT $d600 
295d : 10 fb __ BPL $295a ; (main.l6751 + 0)
.s1287:
295f : 8d 01 d6 STA $d601 
2962 : a9 13 __ LDA #$13
2964 : 8d 00 d6 STA $d600 
.l6753:
2967 : 2c 00 d6 BIT $d600 
296a : 10 fb __ BPL $2967 ; (main.l6753 + 0)
.s1292:
296c : 8e 01 d6 STX $d601 
296f : a9 1f __ LDA #$1f
2971 : 8d 00 d6 STA $d600 
.l6755:
2974 : 2c 00 d6 BIT $d600 
2977 : 10 fb __ BPL $2974 ; (main.l6755 + 0)
.s1296:
2979 : a5 55 __ LDA T2 + 0 
297b : 8d 01 d6 STA $d601 
297e : a9 18 __ LDA #$18
2980 : 8d 00 d6 STA $d600 
.l6757:
2983 : 2c 00 d6 BIT $d600 
2986 : 10 fb __ BPL $2983 ; (main.l6757 + 0)
.s1302:
2988 : ad 01 d6 LDA $d601 
298b : 29 7f __ AND #$7f
298d : aa __ __ TAX
298e : a9 18 __ LDA #$18
2990 : 8d 00 d6 STA $d600 
.l6759:
2993 : 2c 00 d6 BIT $d600 
2996 : 10 fb __ BPL $2993 ; (main.l6759 + 0)
.s1308:
2998 : 8e 01 d6 STX $d601 
299b : a9 1e __ LDA #$1e
299d : 8d 00 d6 STA $d600 
.l6761:
29a0 : 2c 00 d6 BIT $d600 
29a3 : 10 fb __ BPL $29a0 ; (main.l6761 + 0)
.s1313:
29a5 : a5 47 __ LDA T8 + 0 
29a7 : 8d 01 d6 STA $d601 
29aa : e6 52 __ INC T1 + 0 
29ac : 4c a8 28 JMP $28a8 ; (main.l1241 + 0)
.s1381:
29af : ad e8 42 LDA $42e8 ; (vdc_state + 3)
29b2 : 0a __ __ ASL
29b3 : 85 53 __ STA T0 + 0 
29b5 : ad e9 42 LDA $42e9 ; (vdc_state + 4)
29b8 : 2a __ __ ROL
29b9 : 06 53 __ ASL T0 + 0 
29bb : 2a __ __ ROL
29bc : aa __ __ TAX
29bd : 18 __ __ CLC
29be : a5 53 __ LDA T0 + 0 
29c0 : 69 05 __ ADC #$05
29c2 : 85 53 __ STA T0 + 0 
29c4 : 90 01 __ BCC $29c7 ; (main.s1431 + 0)
.s1430:
29c6 : e8 __ __ INX
.s1431:
29c7 : 86 54 __ STX T0 + 1 
29c9 : a9 00 __ LDA #$00
29cb : 85 59 __ STA T6 + 0 
.l1070:
29cd : 20 38 37 JSR $3738 ; (getch.s0 + 0)
29d0 : ad ea 42 LDA $42ea ; (vdc_state + 5)
29d3 : 38 __ __ SEC
29d4 : e9 06 __ SBC #$06
29d6 : f0 23 __ BEQ $29fb ; (main.s1073 + 0)
.s1380:
29d8 : aa __ __ TAX
29d9 : ad ed 42 LDA $42ed ; (vdc_state + 8)
29dc : 18 __ __ CLC
29dd : 65 53 __ ADC T0 + 0 
29df : 85 57 __ STA T4 + 0 
29e1 : a8 __ __ TAY
29e2 : ad ee 42 LDA $42ee ; (vdc_state + 9)
29e5 : 65 54 __ ADC T0 + 1 
29e7 : 85 58 __ STA T4 + 1 
29e9 : ad e8 42 LDA $42e8 ; (vdc_state + 3)
29ec : 18 __ __ CLC
29ed : 65 57 __ ADC T4 + 0 
29ef : 85 43 __ STA T5 + 0 
29f1 : ad e9 42 LDA $42e9 ; (vdc_state + 4)
29f4 : 65 58 __ ADC T4 + 1 
29f6 : 85 44 __ STA T5 + 1 
29f8 : 4c c7 2b JMP $2bc7 ; (main.l1075 + 0)
.s1073:
29fb : ad ea 42 LDA $42ea ; (vdc_state + 5)
29fe : 38 __ __ SEC
29ff : e9 06 __ SBC #$06
2a01 : f0 03 __ BEQ $2a06 ; (main.s1119 + 0)
2a03 : 4c 0f 2b JMP $2b0f ; (main.s1372 + 0)
.s1119:
2a06 : ad e8 42 LDA $42e8 ; (vdc_state + 3)
2a09 : 85 1b __ STA ACCU + 0 
2a0b : ad e9 42 LDA $42e9 ; (vdc_state + 4)
2a0e : 85 1c __ STA ACCU + 1 
2a10 : ad eb 42 LDA $42eb ; (vdc_state + 6)
2a13 : 85 44 __ STA T5 + 1 
2a15 : a9 12 __ LDA #$12
2a17 : 8d 00 d6 STA $d600 
2a1a : ad ea 42 LDA $42ea ; (vdc_state + 5)
2a1d : 85 43 __ STA T5 + 0 
2a1f : 38 __ __ SEC
2a20 : e9 02 __ SBC #$02
2a22 : 20 f8 40 JSR $40f8 ; (mul16by8 + 0)
2a25 : 18 __ __ CLC
2a26 : a5 05 __ LDA WORK + 2 
2a28 : 69 05 __ ADC #$05
2a2a : 85 57 __ STA T4 + 0 
2a2c : a5 06 __ LDA WORK + 3 
2a2e : 69 00 __ ADC #$00
2a30 : 85 58 __ STA T4 + 1 
2a32 : 18 __ __ CLC
2a33 : a5 57 __ LDA T4 + 0 
2a35 : 6d ed 42 ADC $42ed ; (vdc_state + 8)
2a38 : aa __ __ TAX
2a39 : a5 58 __ LDA T4 + 1 
2a3b : 6d ee 42 ADC $42ee ; (vdc_state + 9)
.l6713:
2a3e : 2c 00 d6 BIT $d600 
2a41 : 10 fb __ BPL $2a3e ; (main.l6713 + 0)
.s1174:
2a43 : 8d 01 d6 STA $d601 
2a46 : a9 13 __ LDA #$13
2a48 : 8d 00 d6 STA $d600 
.l6715:
2a4b : 2c 00 d6 BIT $d600 
2a4e : 10 fb __ BPL $2a4b ; (main.l6715 + 0)
.s1179:
2a50 : 8e 01 d6 STX $d601 
2a53 : a9 1f __ LDA #$1f
2a55 : 8d 00 d6 STA $d600 
.l6717:
2a58 : 2c 00 d6 BIT $d600 
2a5b : 10 fb __ BPL $2a58 ; (main.l6717 + 0)
.s1183:
2a5d : a9 20 __ LDA #$20
2a5f : 8d 01 d6 STA $d601 
2a62 : a9 18 __ LDA #$18
2a64 : 8d 00 d6 STA $d600 
.l6719:
2a67 : 2c 00 d6 BIT $d600 
2a6a : 10 fb __ BPL $2a67 ; (main.l6719 + 0)
.s1189:
2a6c : ad 01 d6 LDA $d601 
2a6f : 29 7f __ AND #$7f
2a71 : aa __ __ TAX
2a72 : a9 18 __ LDA #$18
2a74 : 8d 00 d6 STA $d600 
.l6721:
2a77 : 2c 00 d6 BIT $d600 
2a7a : 10 fb __ BPL $2a77 ; (main.l6721 + 0)
.s1195:
2a7c : 8e 01 d6 STX $d601 
2a7f : a9 1e __ LDA #$1e
2a81 : 8d 00 d6 STA $d600 
.l6723:
2a84 : 2c 00 d6 BIT $d600 
2a87 : 10 fb __ BPL $2a84 ; (main.l6723 + 0)
.s1200:
2a89 : a9 45 __ LDA #$45
2a8b : 8d 01 d6 STA $d601 
2a8e : ad ef 42 LDA $42ef ; (vdc_state + 10)
2a91 : 18 __ __ CLC
2a92 : 65 57 __ ADC T4 + 0 
2a94 : aa __ __ TAX
2a95 : a9 12 __ LDA #$12
2a97 : 8d 00 d6 STA $d600 
2a9a : ad f0 42 LDA $42f0 ; (vdc_state + 11)
2a9d : 65 58 __ ADC T4 + 1 
.l6725:
2a9f : 2c 00 d6 BIT $d600 
2aa2 : 10 fb __ BPL $2a9f ; (main.l6725 + 0)
.s1207:
2aa4 : 8d 01 d6 STA $d601 
2aa7 : a9 13 __ LDA #$13
2aa9 : 8d 00 d6 STA $d600 
.l6727:
2aac : 2c 00 d6 BIT $d600 
2aaf : 10 fb __ BPL $2aac ; (main.l6727 + 0)
.s1212:
2ab1 : 8e 01 d6 STX $d601 
2ab4 : a9 1f __ LDA #$1f
2ab6 : 8d 00 d6 STA $d600 
.l6729:
2ab9 : 2c 00 d6 BIT $d600 
2abc : 10 fb __ BPL $2ab9 ; (main.l6729 + 0)
.s1216:
2abe : a9 0d __ LDA #$0d
2ac0 : 8d 01 d6 STA $d601 
2ac3 : a9 18 __ LDA #$18
2ac5 : 8d 00 d6 STA $d600 
.l6731:
2ac8 : 2c 00 d6 BIT $d600 
2acb : 10 fb __ BPL $2ac8 ; (main.l6731 + 0)
.s1222:
2acd : ad 01 d6 LDA $d601 
2ad0 : 29 7f __ AND #$7f
2ad2 : aa __ __ TAX
2ad3 : a9 18 __ LDA #$18
2ad5 : 8d 00 d6 STA $d600 
.l6733:
2ad8 : 2c 00 d6 BIT $d600 
2adb : 10 fb __ BPL $2ad8 ; (main.l6733 + 0)
.s1228:
2add : 8e 01 d6 STX $d601 
2ae0 : a9 1e __ LDA #$1e
2ae2 : 8d 00 d6 STA $d600 
.l6735:
2ae5 : 2c 00 d6 BIT $d600 
2ae8 : 10 fb __ BPL $2ae5 ; (main.l6735 + 0)
.s1233:
2aea : a9 45 __ LDA #$45
2aec : 8d 01 d6 STA $d601 
2aef : 38 __ __ SEC
2af0 : a5 43 __ LDA T5 + 0 
2af2 : e9 05 __ SBC #$05
2af4 : 85 57 __ STA T4 + 0 
2af6 : a5 44 __ LDA T5 + 1 
2af8 : e9 00 __ SBC #$00
2afa : e6 59 __ INC T6 + 0 
2afc : 09 00 __ ORA #$00
2afe : f0 03 __ BEQ $2b03 ; (main.s1038 + 0)
2b00 : 4c cd 29 JMP $29cd ; (main.l1070 + 0)
.s1038:
2b03 : a5 59 __ LDA T6 + 0 
2b05 : c5 57 __ CMP T4 + 0 
2b07 : b0 03 __ BCS $2b0c ; (main.s1038 + 9)
2b09 : 4c cd 29 JMP $29cd ; (main.l1070 + 0)
2b0c : 4c 71 28 JMP $2871 ; (main.s409 + 0)
.s1372:
2b0f : aa __ __ TAX
2b10 : ad ef 42 LDA $42ef ; (vdc_state + 10)
2b13 : 18 __ __ CLC
2b14 : 65 53 __ ADC T0 + 0 
2b16 : 85 57 __ STA T4 + 0 
2b18 : a8 __ __ TAY
2b19 : ad f0 42 LDA $42f0 ; (vdc_state + 11)
2b1c : 65 54 __ ADC T0 + 1 
2b1e : 85 58 __ STA T4 + 1 
2b20 : ad e8 42 LDA $42e8 ; (vdc_state + 3)
2b23 : 18 __ __ CLC
2b24 : 65 57 __ ADC T4 + 0 
2b26 : 85 43 __ STA T5 + 0 
2b28 : ad e9 42 LDA $42e9 ; (vdc_state + 4)
2b2b : 65 58 __ ADC T4 + 1 
2b2d : 85 44 __ STA T5 + 1 
.l1121:
2b2f : a9 12 __ LDA #$12
2b31 : 8d 00 d6 STA $d600 
.l6698:
2b34 : 2c 00 d6 BIT $d600 
2b37 : 10 fb __ BPL $2b34 ; (main.l6698 + 0)
.s1130:
2b39 : a5 58 __ LDA T4 + 1 
2b3b : 8d 01 d6 STA $d601 
2b3e : a9 13 __ LDA #$13
2b40 : 8d 00 d6 STA $d600 
.l6700:
2b43 : 2c 00 d6 BIT $d600 
2b46 : 10 fb __ BPL $2b43 ; (main.l6700 + 0)
.s1135:
2b48 : 8c 01 d6 STY $d601 
2b4b : a9 1f __ LDA #$1f
2b4d : 8d 00 d6 STA $d600 
2b50 : a9 18 __ LDA #$18
2b52 : 8d 00 d6 STA $d600 
.l6702:
2b55 : 2c 00 d6 BIT $d600 
2b58 : 10 fb __ BPL $2b55 ; (main.l6702 + 0)
.s1142:
2b5a : ad 01 d6 LDA $d601 
2b5d : 09 80 __ ORA #$80
2b5f : 85 45 __ STA T7 + 0 
2b61 : a9 18 __ LDA #$18
2b63 : 8d 00 d6 STA $d600 
.l6704:
2b66 : 2c 00 d6 BIT $d600 
2b69 : 10 fb __ BPL $2b66 ; (main.l6704 + 0)
.s1148:
2b6b : a5 45 __ LDA T7 + 0 
2b6d : 8d 01 d6 STA $d601 
2b70 : a9 20 __ LDA #$20
2b72 : 8d 00 d6 STA $d600 
.l6706:
2b75 : 2c 00 d6 BIT $d600 
2b78 : 10 fb __ BPL $2b75 ; (main.l6706 + 0)
.s1153:
2b7a : a5 44 __ LDA T5 + 1 
2b7c : 8d 01 d6 STA $d601 
2b7f : a9 21 __ LDA #$21
2b81 : 8d 00 d6 STA $d600 
.l6708:
2b84 : 2c 00 d6 BIT $d600 
2b87 : 10 fb __ BPL $2b84 ; (main.l6708 + 0)
.s1158:
2b89 : a5 43 __ LDA T5 + 0 
2b8b : 8d 01 d6 STA $d601 
2b8e : a9 1f __ LDA #$1f
2b90 : 8d 00 d6 STA $d600 
2b93 : a9 1e __ LDA #$1e
2b95 : 8d 00 d6 STA $d600 
.l6710:
2b98 : 2c 00 d6 BIT $d600 
2b9b : 10 fb __ BPL $2b98 ; (main.l6710 + 0)
.s1164:
2b9d : a9 46 __ LDA #$46
2b9f : 8d 01 d6 STA $d601 
2ba2 : ad e8 42 LDA $42e8 ; (vdc_state + 3)
2ba5 : 18 __ __ CLC
2ba6 : 65 43 __ ADC T5 + 0 
2ba8 : 85 43 __ STA T5 + 0 
2baa : ad e9 42 LDA $42e9 ; (vdc_state + 4)
2bad : 65 44 __ ADC T5 + 1 
2baf : 85 44 __ STA T5 + 1 
2bb1 : 98 __ __ TYA
2bb2 : 18 __ __ CLC
2bb3 : 6d e8 42 ADC $42e8 ; (vdc_state + 3)
2bb6 : a8 __ __ TAY
2bb7 : a5 58 __ LDA T4 + 1 
2bb9 : 6d e9 42 ADC $42e9 ; (vdc_state + 4)
2bbc : 85 58 __ STA T4 + 1 
2bbe : ca __ __ DEX
2bbf : f0 03 __ BEQ $2bc4 ; (main.s1164 + 39)
2bc1 : 4c 2f 2b JMP $2b2f ; (main.l1121 + 0)
2bc4 : 4c 06 2a JMP $2a06 ; (main.s1119 + 0)
.l1075:
2bc7 : a9 12 __ LDA #$12
2bc9 : 8d 00 d6 STA $d600 
.l6682:
2bcc : 2c 00 d6 BIT $d600 
2bcf : 10 fb __ BPL $2bcc ; (main.l6682 + 0)
.s1084:
2bd1 : a5 58 __ LDA T4 + 1 
2bd3 : 8d 01 d6 STA $d601 
2bd6 : a9 13 __ LDA #$13
2bd8 : 8d 00 d6 STA $d600 
.l6684:
2bdb : 2c 00 d6 BIT $d600 
2bde : 10 fb __ BPL $2bdb ; (main.l6684 + 0)
.s1089:
2be0 : 8c 01 d6 STY $d601 
2be3 : a9 1f __ LDA #$1f
2be5 : 8d 00 d6 STA $d600 
2be8 : a9 18 __ LDA #$18
2bea : 8d 00 d6 STA $d600 
.l6686:
2bed : 2c 00 d6 BIT $d600 
2bf0 : 10 fb __ BPL $2bed ; (main.l6686 + 0)
.s1096:
2bf2 : ad 01 d6 LDA $d601 
2bf5 : 09 80 __ ORA #$80
2bf7 : 85 45 __ STA T7 + 0 
2bf9 : a9 18 __ LDA #$18
2bfb : 8d 00 d6 STA $d600 
.l6688:
2bfe : 2c 00 d6 BIT $d600 
2c01 : 10 fb __ BPL $2bfe ; (main.l6688 + 0)
.s1102:
2c03 : a5 45 __ LDA T7 + 0 
2c05 : 8d 01 d6 STA $d601 
2c08 : a9 20 __ LDA #$20
2c0a : 8d 00 d6 STA $d600 
.l6690:
2c0d : 2c 00 d6 BIT $d600 
2c10 : 10 fb __ BPL $2c0d ; (main.l6690 + 0)
.s1107:
2c12 : a5 44 __ LDA T5 + 1 
2c14 : 8d 01 d6 STA $d601 
2c17 : a9 21 __ LDA #$21
2c19 : 8d 00 d6 STA $d600 
.l6692:
2c1c : 2c 00 d6 BIT $d600 
2c1f : 10 fb __ BPL $2c1c ; (main.l6692 + 0)
.s1112:
2c21 : a5 43 __ LDA T5 + 0 
2c23 : 8d 01 d6 STA $d601 
2c26 : a9 1f __ LDA #$1f
2c28 : 8d 00 d6 STA $d600 
2c2b : a9 1e __ LDA #$1e
2c2d : 8d 00 d6 STA $d600 
.l6694:
2c30 : 2c 00 d6 BIT $d600 
2c33 : 10 fb __ BPL $2c30 ; (main.l6694 + 0)
.s1118:
2c35 : a9 46 __ LDA #$46
2c37 : 8d 01 d6 STA $d601 
2c3a : ad e8 42 LDA $42e8 ; (vdc_state + 3)
2c3d : 18 __ __ CLC
2c3e : 65 43 __ ADC T5 + 0 
2c40 : 85 43 __ STA T5 + 0 
2c42 : ad e9 42 LDA $42e9 ; (vdc_state + 4)
2c45 : 65 44 __ ADC T5 + 1 
2c47 : 85 44 __ STA T5 + 1 
2c49 : 98 __ __ TYA
2c4a : 18 __ __ CLC
2c4b : 6d e8 42 ADC $42e8 ; (vdc_state + 3)
2c4e : a8 __ __ TAY
2c4f : a5 58 __ LDA T4 + 1 
2c51 : 6d e9 42 ADC $42e9 ; (vdc_state + 4)
2c54 : 85 58 __ STA T4 + 1 
2c56 : ca __ __ DEX
2c57 : f0 03 __ BEQ $2c5c ; (main.s1118 + 39)
2c59 : 4c c7 2b JMP $2bc7 ; (main.l1075 + 0)
2c5c : 4c fb 29 JMP $29fb ; (main.s1073 + 0)
.l1022:
2c5f : a5 53 __ LDA T0 + 0 
2c61 : 85 1b __ STA ACCU + 0 
2c63 : a5 54 __ LDA T0 + 1 
2c65 : 85 1c __ STA ACCU + 1 
2c67 : a5 59 __ LDA T6 + 0 
2c69 : 20 f8 40 JSR $40f8 ; (mul16by8 + 0)
2c6c : a5 05 __ LDA WORK + 2 
2c6e : 85 57 __ STA T4 + 0 
2c70 : a5 06 __ LDA WORK + 3 
2c72 : 85 58 __ STA T4 + 1 
2c74 : a6 56 __ LDX T3 + 0 
2c76 : a0 05 __ LDY #$05
.l1026:
2c78 : 86 4c __ STX T11 + 0 
2c7a : a9 12 __ LDA #$12
2c7c : 8d 00 d6 STA $d600 
2c7f : a5 55 __ LDA T2 + 0 
2c81 : 85 50 __ STA T13 + 0 
2c83 : 98 __ __ TYA
2c84 : 18 __ __ CLC
2c85 : 65 57 __ ADC T4 + 0 
2c87 : 85 45 __ STA T7 + 0 
2c89 : a9 00 __ LDA #$00
2c8b : 65 58 __ ADC T4 + 1 
2c8d : 85 46 __ STA T7 + 1 
2c8f : 18 __ __ CLC
2c90 : a5 45 __ LDA T7 + 0 
2c92 : 65 43 __ ADC T5 + 0 
2c94 : 85 47 __ STA T8 + 0 
2c96 : a5 46 __ LDA T7 + 1 
2c98 : 65 44 __ ADC T5 + 1 
2c9a : e6 55 __ INC T2 + 0 
2c9c : e8 __ __ INX
.l6665:
2c9d : 2c 00 d6 BIT $d600 
2ca0 : 10 fb __ BPL $2c9d ; (main.l6665 + 0)
.s1038:
2ca2 : 8d 01 d6 STA $d601 
2ca5 : a9 13 __ LDA #$13
2ca7 : 8d 00 d6 STA $d600 
.l6667:
2caa : 2c 00 d6 BIT $d600 
2cad : 10 fb __ BPL $2caa ; (main.l6667 + 0)
.s1043:
2caf : a5 47 __ LDA T8 + 0 
2cb1 : 8d 01 d6 STA $d601 
2cb4 : a9 1f __ LDA #$1f
2cb6 : 8d 00 d6 STA $d600 
.l6669:
2cb9 : 2c 00 d6 BIT $d600 
2cbc : 10 fb __ BPL $2cb9 ; (main.l6669 + 0)
.s1047:
2cbe : a5 50 __ LDA T13 + 0 
2cc0 : 8d 01 d6 STA $d601 
2cc3 : ad ef 42 LDA $42ef ; (vdc_state + 10)
2cc6 : 18 __ __ CLC
2cc7 : 65 45 __ ADC T7 + 0 
2cc9 : 85 45 __ STA T7 + 0 
2ccb : a9 12 __ LDA #$12
2ccd : 8d 00 d6 STA $d600 
2cd0 : ad f0 42 LDA $42f0 ; (vdc_state + 11)
2cd3 : 65 46 __ ADC T7 + 1 
.l6671:
2cd5 : 2c 00 d6 BIT $d600 
2cd8 : 10 fb __ BPL $2cd5 ; (main.l6671 + 0)
.s1054:
2cda : 8d 01 d6 STA $d601 
2cdd : a9 13 __ LDA #$13
2cdf : 8d 00 d6 STA $d600 
.l6673:
2ce2 : 2c 00 d6 BIT $d600 
2ce5 : 10 fb __ BPL $2ce2 ; (main.l6673 + 0)
.s1059:
2ce7 : a5 45 __ LDA T7 + 0 
2ce9 : 8d 01 d6 STA $d601 
2cec : a9 1f __ LDA #$1f
2cee : 8d 00 d6 STA $d600 
.l6675:
2cf1 : 2c 00 d6 BIT $d600 
2cf4 : 10 fb __ BPL $2cf1 ; (main.l6675 + 0)
.s1063:
2cf6 : a5 4c __ LDA T11 + 0 
2cf8 : 8d 01 d6 STA $d601 
2cfb : e0 10 __ CPX #$10
2cfd : 90 02 __ BCC $2d01 ; (main.s4478 + 0)
.s1064:
2cff : a2 00 __ LDX #$00
.s4478:
2d01 : c8 __ __ INY
2d02 : c0 4b __ CPY #$4b
2d04 : b0 03 __ BCS $2d09 ; (main.s1023 + 0)
2d06 : 4c 78 2c JMP $2c78 ; (main.l1026 + 0)
.s1023:
2d09 : 86 56 __ STX T3 + 0 
2d0b : ad ea 42 LDA $42ea ; (vdc_state + 5)
2d0e : e9 01 __ SBC #$01
2d10 : 85 57 __ STA T4 + 0 
2d12 : ad eb 42 LDA $42eb ; (vdc_state + 6)
2d15 : e9 00 __ SBC #$00
2d17 : e6 59 __ INC T6 + 0 
2d19 : 09 00 __ ORA #$00
2d1b : f0 03 __ BEQ $2d20 ; (main.s1092 + 0)
2d1d : 4c 5f 2c JMP $2c5f ; (main.l1022 + 0)
.s1092:
2d20 : a5 59 __ LDA T6 + 0 
2d22 : c5 57 __ CMP T4 + 0 
2d24 : b0 03 __ BCS $2d29 ; (main.s1092 + 9)
2d26 : 4c 5f 2c JMP $2c5f ; (main.l1022 + 0)
2d29 : 4c 5e 28 JMP $285e ; (main.s1024 + 0)
.s844:
2d2c : a9 12 __ LDA #$12
2d2e : 8d 00 d6 STA $d600 
2d31 : a5 57 __ LDA T4 + 0 
2d33 : 85 1b __ STA ACCU + 0 
2d35 : a5 58 __ LDA T4 + 1 
2d37 : 85 1c __ STA ACCU + 1 
2d39 : a5 59 __ LDA T6 + 0 
2d3b : 20 f8 40 JSR $40f8 ; (mul16by8 + 0)
2d3e : 18 __ __ CLC
2d3f : a5 05 __ LDA WORK + 2 
2d41 : 69 4b __ ADC #$4b
2d43 : 85 57 __ STA T4 + 0 
2d45 : a5 06 __ LDA WORK + 3 
2d47 : 69 00 __ ADC #$00
2d49 : 85 58 __ STA T4 + 1 
2d4b : 18 __ __ CLC
2d4c : a5 57 __ LDA T4 + 0 
2d4e : 65 43 __ ADC T5 + 0 
2d50 : aa __ __ TAX
2d51 : a5 58 __ LDA T4 + 1 
2d53 : 65 44 __ ADC T5 + 1 
.l6604:
2d55 : 2c 00 d6 BIT $d600 
2d58 : 10 fb __ BPL $2d55 ; (main.l6604 + 0)
.s856:
2d5a : 8d 01 d6 STA $d601 
2d5d : a9 13 __ LDA #$13
2d5f : 8d 00 d6 STA $d600 
.l6606:
2d62 : 2c 00 d6 BIT $d600 
2d65 : 10 fb __ BPL $2d62 ; (main.l6606 + 0)
.s861:
2d67 : 8e 01 d6 STX $d601 
2d6a : a9 1f __ LDA #$1f
2d6c : 8d 00 d6 STA $d600 
.l6608:
2d6f : 2c 00 d6 BIT $d600 
2d72 : 10 fb __ BPL $2d6f ; (main.l6608 + 0)
.s865:
2d74 : a9 61 __ LDA #$61
2d76 : 8d 01 d6 STA $d601 
2d79 : ad ef 42 LDA $42ef ; (vdc_state + 10)
2d7c : 18 __ __ CLC
2d7d : 65 57 __ ADC T4 + 0 
2d7f : aa __ __ TAX
2d80 : a9 12 __ LDA #$12
2d82 : 8d 00 d6 STA $d600 
2d85 : ad f0 42 LDA $42f0 ; (vdc_state + 11)
2d88 : 65 58 __ ADC T4 + 1 
.l6610:
2d8a : 2c 00 d6 BIT $d600 
2d8d : 10 fb __ BPL $2d8a ; (main.l6610 + 0)
.s872:
2d8f : 8d 01 d6 STA $d601 
2d92 : a9 13 __ LDA #$13
2d94 : 8d 00 d6 STA $d600 
.l6612:
2d97 : 2c 00 d6 BIT $d600 
2d9a : 10 fb __ BPL $2d97 ; (main.l6612 + 0)
.s877:
2d9c : 8e 01 d6 STX $d601 
2d9f : a9 1f __ LDA #$1f
2da1 : 8d 00 d6 STA $d600 
.l6614:
2da4 : 2c 00 d6 BIT $d600 
2da7 : 10 fb __ BPL $2da4 ; (main.l6614 + 0)
.s881:
2da9 : a9 09 __ LDA #$09
2dab : 8d 01 d6 STA $d601 
2dae : e6 59 __ INC T6 + 0 
2db0 : 4c 50 26 JMP $2650 ; (main.l843 + 0)
.s804:
2db3 : ad e8 42 LDA $42e8 ; (vdc_state + 3)
2db6 : 85 1b __ STA ACCU + 0 
2db8 : ad e9 42 LDA $42e9 ; (vdc_state + 4)
2dbb : 85 1c __ STA ACCU + 1 
2dbd : a9 12 __ LDA #$12
2dbf : 8d 00 d6 STA $d600 
2dc2 : a5 59 __ LDA T6 + 0 
2dc4 : 20 f8 40 JSR $40f8 ; (mul16by8 + 0)
2dc7 : 18 __ __ CLC
2dc8 : a5 05 __ LDA WORK + 2 
2dca : 69 04 __ ADC #$04
2dcc : 85 57 __ STA T4 + 0 
2dce : a5 06 __ LDA WORK + 3 
2dd0 : 69 00 __ ADC #$00
2dd2 : 85 58 __ STA T4 + 1 
2dd4 : 18 __ __ CLC
2dd5 : a5 57 __ LDA T4 + 0 
2dd7 : 6d ed 42 ADC $42ed ; (vdc_state + 8)
2dda : aa __ __ TAX
2ddb : a5 58 __ LDA T4 + 1 
2ddd : 6d ee 42 ADC $42ee ; (vdc_state + 9)
.l6591:
2de0 : 2c 00 d6 BIT $d600 
2de3 : 10 fb __ BPL $2de0 ; (main.l6591 + 0)
.s816:
2de5 : 8d 01 d6 STA $d601 
2de8 : a9 13 __ LDA #$13
2dea : 8d 00 d6 STA $d600 
.l6593:
2ded : 2c 00 d6 BIT $d600 
2df0 : 10 fb __ BPL $2ded ; (main.l6593 + 0)
.s821:
2df2 : 8e 01 d6 STX $d601 
2df5 : a9 1f __ LDA #$1f
2df7 : 8d 00 d6 STA $d600 
.l6595:
2dfa : 2c 00 d6 BIT $d600 
2dfd : 10 fb __ BPL $2dfa ; (main.l6595 + 0)
.s825:
2dff : a9 e1 __ LDA #$e1
2e01 : 8d 01 d6 STA $d601 
2e04 : ad ef 42 LDA $42ef ; (vdc_state + 10)
2e07 : 18 __ __ CLC
2e08 : 65 57 __ ADC T4 + 0 
2e0a : aa __ __ TAX
2e0b : a9 12 __ LDA #$12
2e0d : 8d 00 d6 STA $d600 
2e10 : ad f0 42 LDA $42f0 ; (vdc_state + 11)
2e13 : 65 58 __ ADC T4 + 1 
.l6597:
2e15 : 2c 00 d6 BIT $d600 
2e18 : 10 fb __ BPL $2e15 ; (main.l6597 + 0)
.s832:
2e1a : 8d 01 d6 STA $d601 
2e1d : a9 13 __ LDA #$13
2e1f : 8d 00 d6 STA $d600 
.l6599:
2e22 : 2c 00 d6 BIT $d600 
2e25 : 10 fb __ BPL $2e22 ; (main.l6599 + 0)
.s837:
2e27 : 8e 01 d6 STX $d601 
2e2a : a9 1f __ LDA #$1f
2e2c : 8d 00 d6 STA $d600 
.l6601:
2e2f : 2c 00 d6 BIT $d600 
2e32 : 10 fb __ BPL $2e2f ; (main.l6601 + 0)
.s841:
2e34 : a9 09 __ LDA #$09
2e36 : 8d 01 d6 STA $d601 
2e39 : e6 59 __ INC T6 + 0 
2e3b : 4c 31 26 JMP $2631 ; (main.l803 + 0)
.s137:
2e3e : ad e8 42 LDA $42e8 ; (vdc_state + 3)
2e41 : 85 1b __ STA ACCU + 0 
2e43 : ad e9 42 LDA $42e9 ; (vdc_state + 4)
2e46 : 85 1c __ STA ACCU + 1 
2e48 : ad ec 42 LDA $42ec ; (vdc_state + 7)
2e4b : 85 59 __ STA T6 + 0 
2e4d : a9 12 __ LDA #$12
2e4f : 8d 00 d6 STA $d600 
2e52 : a6 53 __ LDX T0 + 0 
2e54 : ca __ __ DEX
2e55 : 86 47 __ STX T8 + 0 
2e57 : a5 52 __ LDA T1 + 0 
2e59 : 20 f8 40 JSR $40f8 ; (mul16by8 + 0)
2e5c : 18 __ __ CLC
2e5d : a5 05 __ LDA WORK + 2 
2e5f : 6d ed 42 ADC $42ed ; (vdc_state + 8)
2e62 : aa __ __ TAX
2e63 : a5 06 __ LDA WORK + 3 
2e65 : 6d ee 42 ADC $42ee ; (vdc_state + 9)
.l6446:
2e68 : 2c 00 d6 BIT $d600 
2e6b : 10 fb __ BPL $2e68 ; (main.l6446 + 0)
.s149:
2e6d : 8d 01 d6 STA $d601 
2e70 : a9 13 __ LDA #$13
2e72 : 8d 00 d6 STA $d600 
.l6448:
2e75 : 2c 00 d6 BIT $d600 
2e78 : 10 fb __ BPL $2e75 ; (main.l6448 + 0)
.s154:
2e7a : 8e 01 d6 STX $d601 
2e7d : a9 1f __ LDA #$1f
2e7f : 8d 00 d6 STA $d600 
.l6450:
2e82 : 2c 00 d6 BIT $d600 
2e85 : 10 fb __ BPL $2e82 ; (main.l6450 + 0)
.s158:
2e87 : a9 20 __ LDA #$20
2e89 : 8d 01 d6 STA $d601 
2e8c : a9 18 __ LDA #$18
2e8e : 8d 00 d6 STA $d600 
.l6452:
2e91 : 2c 00 d6 BIT $d600 
2e94 : 10 fb __ BPL $2e91 ; (main.l6452 + 0)
.s164:
2e96 : ad 01 d6 LDA $d601 
2e99 : 29 7f __ AND #$7f
2e9b : aa __ __ TAX
2e9c : a9 18 __ LDA #$18
2e9e : 8d 00 d6 STA $d600 
.l6454:
2ea1 : 2c 00 d6 BIT $d600 
2ea4 : 10 fb __ BPL $2ea1 ; (main.l6454 + 0)
.s170:
2ea6 : 8e 01 d6 STX $d601 
2ea9 : a9 1e __ LDA #$1e
2eab : 8d 00 d6 STA $d600 
.l6456:
2eae : 2c 00 d6 BIT $d600 
2eb1 : 10 fb __ BPL $2eae ; (main.l6456 + 0)
.s175:
2eb3 : a5 47 __ LDA T8 + 0 
2eb5 : 8d 01 d6 STA $d601 
2eb8 : ad ef 42 LDA $42ef ; (vdc_state + 10)
2ebb : 18 __ __ CLC
2ebc : 65 05 __ ADC WORK + 2 
2ebe : aa __ __ TAX
2ebf : a9 12 __ LDA #$12
2ec1 : 8d 00 d6 STA $d600 
2ec4 : ad f0 42 LDA $42f0 ; (vdc_state + 11)
2ec7 : 65 06 __ ADC WORK + 3 
.l6458:
2ec9 : 2c 00 d6 BIT $d600 
2ecc : 10 fb __ BPL $2ec9 ; (main.l6458 + 0)
.s182:
2ece : 8d 01 d6 STA $d601 
2ed1 : a9 13 __ LDA #$13
2ed3 : 8d 00 d6 STA $d600 
.l6460:
2ed6 : 2c 00 d6 BIT $d600 
2ed9 : 10 fb __ BPL $2ed6 ; (main.l6460 + 0)
.s187:
2edb : 8e 01 d6 STX $d601 
2ede : a9 1f __ LDA #$1f
2ee0 : 8d 00 d6 STA $d600 
.l6462:
2ee3 : 2c 00 d6 BIT $d600 
2ee6 : 10 fb __ BPL $2ee3 ; (main.l6462 + 0)
.s191:
2ee8 : a5 59 __ LDA T6 + 0 
2eea : 8d 01 d6 STA $d601 
2eed : a9 18 __ LDA #$18
2eef : 8d 00 d6 STA $d600 
.l6464:
2ef2 : 2c 00 d6 BIT $d600 
2ef5 : 10 fb __ BPL $2ef2 ; (main.l6464 + 0)
.s197:
2ef7 : ad 01 d6 LDA $d601 
2efa : 29 7f __ AND #$7f
2efc : aa __ __ TAX
2efd : a9 18 __ LDA #$18
2eff : 8d 00 d6 STA $d600 
.l6466:
2f02 : 2c 00 d6 BIT $d600 
2f05 : 10 fb __ BPL $2f02 ; (main.l6466 + 0)
.s203:
2f07 : 8e 01 d6 STX $d601 
2f0a : a9 1e __ LDA #$1e
2f0c : 8d 00 d6 STA $d600 
.l6468:
2f0f : 2c 00 d6 BIT $d600 
2f12 : 10 fb __ BPL $2f0f ; (main.l6468 + 0)
.s208:
2f14 : a5 47 __ LDA T8 + 0 
2f16 : 8d 01 d6 STA $d601 
2f19 : e6 52 __ INC T1 + 0 
2f1b : 4c 64 20 JMP $2064 ; (main.l136 + 0)
.s17:
2f1e : a9 00 __ LDA #$00
2f20 : 85 53 __ STA T0 + 0 
2f22 : 85 54 __ STA T0 + 1 
.l21:
2f24 : 20 fc 36 JSR $36fc ; (krnio_chrin.s0 + 0)
2f27 : a5 1b __ LDA ACCU + 0 
2f29 : 85 57 __ STA T4 + 0 
2f2b : 20 06 37 JSR $3706 ; (krnio_status.s0 + 0)
2f2e : 8d d6 42 STA $42d6 ; (krnio_pstatus + 1)
2f31 : 09 00 __ ORA #$00
2f33 : f0 07 __ BEQ $2f3c ; (main.s25 + 0)
.s26:
2f35 : ad d6 42 LDA $42d6 ; (krnio_pstatus + 1)
2f38 : c9 40 __ CMP #$40
2f3a : d0 17 __ BNE $2f53 ; (main.s22 + 0)
.s25:
2f3c : a5 57 __ LDA T4 + 0 
2f3e : a6 53 __ LDX T0 + 0 
2f40 : e8 __ __ INX
2f41 : 86 53 __ STX T0 + 0 
2f43 : 9d 5a bf STA $bf5a,x ; (filename + 14)
2f46 : a9 00 __ LDA #$00
2f48 : 85 54 __ STA T0 + 1 
2f4a : ad d6 42 LDA $42d6 ; (krnio_pstatus + 1)
2f4d : d0 04 __ BNE $2f53 ; (main.s22 + 0)
.s20:
2f4f : e0 51 __ CPX #$51
2f51 : 90 d1 __ BCC $2f24 ; (main.l21 + 0)
.s22:
2f53 : 20 79 36 JSR $3679 ; (krnio_clrchn.s0 + 0)
2f56 : 4c f1 1d JMP $1df1 ; (main.s12 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
2f59 : a2 03 __ LDX #$03
2f5b : b5 53 __ LDA T8 + 0,x 
2f5d : 9d b2 bf STA $bfb2,x ; (printf@stack + 0)
2f60 : ca __ __ DEX
2f61 : 10 f8 __ BPL $2f5b ; (printf.s1000 + 2)
.s0:
2f63 : 18 __ __ CLC
2f64 : a5 23 __ LDA SP + 0 
2f66 : 69 04 __ ADC #$04
2f68 : 85 47 __ STA T0 + 0 
2f6a : a5 24 __ LDA SP + 1 
2f6c : 69 00 __ ADC #$00
2f6e : 85 48 __ STA T0 + 1 
2f70 : a9 00 __ LDA #$00
2f72 : 85 49 __ STA T2 + 0 
2f74 : a0 02 __ LDY #$02
2f76 : b1 23 __ LDA (SP + 0),y 
2f78 : 85 4a __ STA T3 + 0 
2f7a : c8 __ __ INY
2f7b : b1 23 __ LDA (SP + 0),y 
2f7d : 85 4b __ STA T3 + 1 
.l2:
2f7f : a0 00 __ LDY #$00
2f81 : b1 4a __ LDA (T3 + 0),y 
2f83 : d0 1e __ BNE $2fa3 ; (printf.s3 + 0)
.s4:
2f85 : a6 49 __ LDX T2 + 0 
2f87 : 9d be bf STA $bfbe,x ; (buff + 0)
2f8a : 8a __ __ TXA
2f8b : f0 0b __ BEQ $2f98 ; (printf.s1001 + 0)
.s117:
2f8d : a9 be __ LDA #$be
2f8f : 85 0d __ STA P0 ; (fmt + 0)
2f91 : a9 bf __ LDA #$bf
2f93 : 85 0e __ STA P1 ; (fmt + 1)
2f95 : 20 a9 32 JSR $32a9 ; (puts.s0 + 0)
.s1001:
2f98 : a2 03 __ LDX #$03
2f9a : bd b2 bf LDA $bfb2,x ; (printf@stack + 0)
2f9d : 95 53 __ STA T8 + 0,x 
2f9f : ca __ __ DEX
2fa0 : 10 f8 __ BPL $2f9a ; (printf.s1001 + 2)
2fa2 : 60 __ __ RTS
.s3:
2fa3 : c9 25 __ CMP #$25
2fa5 : f0 28 __ BEQ $2fcf ; (printf.s5 + 0)
.s6:
2fa7 : a6 49 __ LDX T2 + 0 
2fa9 : 9d be bf STA $bfbe,x ; (buff + 0)
2fac : e6 4a __ INC T3 + 0 
2fae : d0 02 __ BNE $2fb2 ; (printf.s1098 + 0)
.s1097:
2fb0 : e6 4b __ INC T3 + 1 
.s1098:
2fb2 : e8 __ __ INX
2fb3 : 86 49 __ STX T2 + 0 
2fb5 : e0 28 __ CPX #$28
2fb7 : 90 c6 __ BCC $2f7f ; (printf.l2 + 0)
.s111:
2fb9 : a9 be __ LDA #$be
2fbb : 85 0d __ STA P0 ; (fmt + 0)
2fbd : a9 bf __ LDA #$bf
2fbf : 85 0e __ STA P1 ; (fmt + 1)
2fc1 : 98 __ __ TYA
2fc2 : 9d be bf STA $bfbe,x ; (buff + 0)
2fc5 : 20 a9 32 JSR $32a9 ; (puts.s0 + 0)
2fc8 : a9 00 __ LDA #$00
.s1068:
2fca : 85 49 __ STA T2 + 0 
2fcc : 4c 7f 2f JMP $2f7f ; (printf.l2 + 0)
.s5:
2fcf : a5 49 __ LDA T2 + 0 
2fd1 : f0 15 __ BEQ $2fe8 ; (printf.s10 + 0)
.s8:
2fd3 : a9 be __ LDA #$be
2fd5 : 85 0d __ STA P0 ; (fmt + 0)
2fd7 : a9 bf __ LDA #$bf
2fd9 : 85 0e __ STA P1 ; (fmt + 1)
2fdb : 98 __ __ TYA
2fdc : a6 49 __ LDX T2 + 0 
2fde : 9d be bf STA $bfbe,x ; (buff + 0)
2fe1 : 20 a9 32 JSR $32a9 ; (puts.s0 + 0)
2fe4 : a9 00 __ LDA #$00
2fe6 : 85 49 __ STA T2 + 0 
.s10:
2fe8 : a9 0a __ LDA #$0a
2fea : 8d b9 bf STA $bfb9 ; (si + 3)
2fed : a9 00 __ LDA #$00
2fef : 8d ba bf STA $bfba ; (si + 4)
2ff2 : 8d bb bf STA $bfbb ; (si + 5)
2ff5 : 8d bc bf STA $bfbc ; (si + 6)
2ff8 : 8d bd bf STA $bfbd ; (si + 7)
2ffb : a0 01 __ LDY #$01
2ffd : b1 4a __ LDA (T3 + 0),y 
2fff : aa __ __ TAX
3000 : a9 20 __ LDA #$20
3002 : 8d b6 bf STA $bfb6 ; (si + 0)
3005 : a9 00 __ LDA #$00
3007 : 8d b7 bf STA $bfb7 ; (si + 1)
300a : a9 ff __ LDA #$ff
300c : 8d b8 bf STA $bfb8 ; (si + 2)
300f : 18 __ __ CLC
3010 : a5 4a __ LDA T3 + 0 
3012 : 69 02 __ ADC #$02
.l15:
3014 : 85 4a __ STA T3 + 0 
3016 : 90 02 __ BCC $301a ; (printf.s1080 + 0)
.s1079:
3018 : e6 4b __ INC T3 + 1 
.s1080:
301a : 8a __ __ TXA
301b : e0 2b __ CPX #$2b
301d : d0 08 __ BNE $3027 ; (printf.s18 + 0)
.s17:
301f : a9 01 __ LDA #$01
3021 : 8d bb bf STA $bfbb ; (si + 5)
3024 : 4c 9c 32 JMP $329c ; (printf.s246 + 0)
.s18:
3027 : c9 30 __ CMP #$30
3029 : d0 06 __ BNE $3031 ; (printf.s21 + 0)
.s20:
302b : 8d b6 bf STA $bfb6 ; (si + 0)
302e : 4c 9c 32 JMP $329c ; (printf.s246 + 0)
.s21:
3031 : e0 23 __ CPX #$23
3033 : d0 08 __ BNE $303d ; (printf.s24 + 0)
.s23:
3035 : a9 01 __ LDA #$01
3037 : 8d bd bf STA $bfbd ; (si + 7)
303a : 4c 9c 32 JMP $329c ; (printf.s246 + 0)
.s24:
303d : e0 2d __ CPX #$2d
303f : d0 08 __ BNE $3049 ; (printf.s16 + 0)
.s26:
3041 : a9 01 __ LDA #$01
3043 : 8d bc bf STA $bfbc ; (si + 6)
3046 : 4c 9c 32 JMP $329c ; (printf.s246 + 0)
.s16:
3049 : 85 4c __ STA T4 + 0 
304b : e0 30 __ CPX #$30
304d : 90 53 __ BCC $30a2 ; (printf.s32 + 0)
.s33:
304f : e0 3a __ CPX #$3a
3051 : b0 4f __ BCS $30a2 ; (printf.s32 + 0)
.s30:
3053 : a9 00 __ LDA #$00
3055 : 85 4d __ STA T6 + 0 
3057 : 85 4e __ STA T6 + 1 
3059 : e0 3a __ CPX #$3a
305b : b0 40 __ BCS $309d ; (printf.s36 + 0)
.l35:
305d : a5 4d __ LDA T6 + 0 
305f : 0a __ __ ASL
3060 : 85 1b __ STA ACCU + 0 
3062 : a5 4e __ LDA T6 + 1 
3064 : 2a __ __ ROL
3065 : 06 1b __ ASL ACCU + 0 
3067 : 2a __ __ ROL
3068 : aa __ __ TAX
3069 : 18 __ __ CLC
306a : a5 1b __ LDA ACCU + 0 
306c : 65 4d __ ADC T6 + 0 
306e : 85 4d __ STA T6 + 0 
3070 : 8a __ __ TXA
3071 : 65 4e __ ADC T6 + 1 
3073 : 06 4d __ ASL T6 + 0 
3075 : 2a __ __ ROL
3076 : aa __ __ TAX
3077 : 18 __ __ CLC
3078 : a5 4d __ LDA T6 + 0 
307a : 65 4c __ ADC T4 + 0 
307c : 90 01 __ BCC $307f ; (printf.s1094 + 0)
.s1093:
307e : e8 __ __ INX
.s1094:
307f : 38 __ __ SEC
3080 : e9 30 __ SBC #$30
3082 : 85 4d __ STA T6 + 0 
3084 : 8a __ __ TXA
3085 : e9 00 __ SBC #$00
3087 : 85 4e __ STA T6 + 1 
3089 : a0 00 __ LDY #$00
308b : b1 4a __ LDA (T3 + 0),y 
308d : 85 4c __ STA T4 + 0 
308f : e6 4a __ INC T3 + 0 
3091 : d0 02 __ BNE $3095 ; (printf.s1096 + 0)
.s1095:
3093 : e6 4b __ INC T3 + 1 
.s1096:
3095 : c9 30 __ CMP #$30
3097 : 90 04 __ BCC $309d ; (printf.s36 + 0)
.s37:
3099 : c9 3a __ CMP #$3a
309b : 90 c0 __ BCC $305d ; (printf.l35 + 0)
.s36:
309d : a5 4d __ LDA T6 + 0 
309f : 8d b7 bf STA $bfb7 ; (si + 1)
.s32:
30a2 : a5 4c __ LDA T4 + 0 
30a4 : c9 2e __ CMP #$2e
30a6 : d0 51 __ BNE $30f9 ; (printf.s40 + 0)
.s38:
30a8 : a9 00 __ LDA #$00
30aa : 85 4d __ STA T6 + 0 
.l231:
30ac : 85 4e __ STA T6 + 1 
30ae : a0 00 __ LDY #$00
30b0 : b1 4a __ LDA (T3 + 0),y 
30b2 : 85 4c __ STA T4 + 0 
30b4 : e6 4a __ INC T3 + 0 
30b6 : d0 02 __ BNE $30ba ; (printf.s1082 + 0)
.s1081:
30b8 : e6 4b __ INC T3 + 1 
.s1082:
30ba : c9 30 __ CMP #$30
30bc : 90 04 __ BCC $30c2 ; (printf.s43 + 0)
.s44:
30be : c9 3a __ CMP #$3a
30c0 : 90 0a __ BCC $30cc ; (printf.s42 + 0)
.s43:
30c2 : a5 4d __ LDA T6 + 0 
30c4 : 8d b8 bf STA $bfb8 ; (si + 2)
30c7 : a5 4c __ LDA T4 + 0 
30c9 : 4c f9 30 JMP $30f9 ; (printf.s40 + 0)
.s42:
30cc : a5 4d __ LDA T6 + 0 
30ce : 0a __ __ ASL
30cf : 85 1b __ STA ACCU + 0 
30d1 : a5 4e __ LDA T6 + 1 
30d3 : 2a __ __ ROL
30d4 : 06 1b __ ASL ACCU + 0 
30d6 : 2a __ __ ROL
30d7 : aa __ __ TAX
30d8 : 18 __ __ CLC
30d9 : a5 1b __ LDA ACCU + 0 
30db : 65 4d __ ADC T6 + 0 
30dd : 85 4d __ STA T6 + 0 
30df : 8a __ __ TXA
30e0 : 65 4e __ ADC T6 + 1 
30e2 : 06 4d __ ASL T6 + 0 
30e4 : 2a __ __ ROL
30e5 : aa __ __ TAX
30e6 : 18 __ __ CLC
30e7 : a5 4d __ LDA T6 + 0 
30e9 : 65 4c __ ADC T4 + 0 
30eb : 90 01 __ BCC $30ee ; (printf.s1092 + 0)
.s1091:
30ed : e8 __ __ INX
.s1092:
30ee : 38 __ __ SEC
30ef : e9 30 __ SBC #$30
30f1 : 85 4d __ STA T6 + 0 
30f3 : 8a __ __ TXA
30f4 : e9 00 __ SBC #$00
30f6 : 4c ac 30 JMP $30ac ; (printf.l231 + 0)
.s40:
30f9 : c9 64 __ CMP #$64
30fb : f0 04 __ BEQ $3101 ; (printf.s45 + 0)
.s48:
30fd : c9 44 __ CMP #$44
30ff : d0 05 __ BNE $3106 ; (printf.s46 + 0)
.s45:
3101 : a9 01 __ LDA #$01
3103 : 4c 75 32 JMP $3275 ; (printf.s247 + 0)
.s46:
3106 : c9 75 __ CMP #$75
3108 : d0 03 __ BNE $310d ; (printf.s52 + 0)
310a : 4c 73 32 JMP $3273 ; (printf.s269 + 0)
.s52:
310d : c9 55 __ CMP #$55
310f : d0 03 __ BNE $3114 ; (printf.s50 + 0)
3111 : 4c 73 32 JMP $3273 ; (printf.s269 + 0)
.s50:
3114 : c9 78 __ CMP #$78
3116 : f0 04 __ BEQ $311c ; (printf.s53 + 0)
.s56:
3118 : c9 58 __ CMP #$58
311a : d0 0d __ BNE $3129 ; (printf.s54 + 0)
.s53:
311c : a9 10 __ LDA #$10
311e : 8d b9 bf STA $bfb9 ; (si + 3)
3121 : a9 00 __ LDA #$00
3123 : 8d ba bf STA $bfba ; (si + 4)
3126 : 4c 73 32 JMP $3273 ; (printf.s269 + 0)
.s54:
3129 : c9 6c __ CMP #$6c
312b : d0 03 __ BNE $3130 ; (printf.s60 + 0)
312d : 4c 05 32 JMP $3205 ; (printf.s57 + 0)
.s60:
3130 : c9 4c __ CMP #$4c
3132 : d0 03 __ BNE $3137 ; (printf.s58 + 0)
3134 : 4c 05 32 JMP $3205 ; (printf.s57 + 0)
.s58:
3137 : c9 73 __ CMP #$73
3139 : f0 39 __ BEQ $3174 ; (printf.s73 + 0)
.s76:
313b : c9 53 __ CMP #$53
313d : f0 35 __ BEQ $3174 ; (printf.s73 + 0)
.s74:
313f : c9 63 __ CMP #$63
3141 : f0 15 __ BEQ $3158 ; (printf.s104 + 0)
.s107:
3143 : c9 43 __ CMP #$43
3145 : f0 11 __ BEQ $3158 ; (printf.s104 + 0)
.s105:
3147 : 09 00 __ ORA #$00
3149 : d0 03 __ BNE $314e ; (printf.s108 + 0)
314b : 4c 7f 2f JMP $2f7f ; (printf.l2 + 0)
.s108:
314e : a6 49 __ LDX T2 + 0 
3150 : 9d be bf STA $bfbe,x ; (buff + 0)
3153 : e6 49 __ INC T2 + 0 
3155 : 4c 7f 2f JMP $2f7f ; (printf.l2 + 0)
.s104:
3158 : a0 00 __ LDY #$00
315a : b1 47 __ LDA (T0 + 0),y 
315c : a6 49 __ LDX T2 + 0 
315e : 9d be bf STA $bfbe,x ; (buff + 0)
3161 : e6 49 __ INC T2 + 0 
.s244:
3163 : 18 __ __ CLC
3164 : a5 47 __ LDA T0 + 0 
3166 : 69 02 __ ADC #$02
3168 : 85 47 __ STA T0 + 0 
316a : b0 03 __ BCS $316f ; (printf.s1083 + 0)
316c : 4c 7f 2f JMP $2f7f ; (printf.l2 + 0)
.s1083:
316f : e6 48 __ INC T0 + 1 
3171 : 4c 7f 2f JMP $2f7f ; (printf.l2 + 0)
.s73:
3174 : a0 00 __ LDY #$00
3176 : 84 4c __ STY T4 + 0 
3178 : b1 47 __ LDA (T0 + 0),y 
317a : 85 4d __ STA T6 + 0 
317c : c8 __ __ INY
317d : b1 47 __ LDA (T0 + 0),y 
317f : 85 4e __ STA T6 + 1 
3181 : 18 __ __ CLC
3182 : a5 47 __ LDA T0 + 0 
3184 : 69 02 __ ADC #$02
3186 : 85 47 __ STA T0 + 0 
3188 : 90 02 __ BCC $318c ; (printf.s1090 + 0)
.s1089:
318a : e6 48 __ INC T0 + 1 
.s1090:
318c : ad b7 bf LDA $bfb7 ; (si + 1)
318f : f0 0d __ BEQ $319e ; (printf.s79 + 0)
.s1071:
3191 : a0 00 __ LDY #$00
3193 : b1 4d __ LDA (T6 + 0),y 
3195 : f0 05 __ BEQ $319c ; (printf.s1072 + 0)
.l81:
3197 : c8 __ __ INY
3198 : b1 4d __ LDA (T6 + 0),y 
319a : d0 fb __ BNE $3197 ; (printf.l81 + 0)
.s1072:
319c : 84 4c __ STY T4 + 0 
.s79:
319e : ad bc bf LDA $bfbc ; (si + 6)
31a1 : d0 1a __ BNE $31bd ; (printf.s85 + 0)
.s1075:
31a3 : a4 4c __ LDY T4 + 0 
31a5 : cc b7 bf CPY $bfb7 ; (si + 1)
31a8 : a6 49 __ LDX T2 + 0 
31aa : b0 0d __ BCS $31b9 ; (printf.s1076 + 0)
.l87:
31ac : ad b6 bf LDA $bfb6 ; (si + 0)
31af : 9d be bf STA $bfbe,x ; (buff + 0)
31b2 : c8 __ __ INY
31b3 : cc b7 bf CPY $bfb7 ; (si + 1)
31b6 : e8 __ __ INX
31b7 : 90 f3 __ BCC $31ac ; (printf.l87 + 0)
.s1076:
31b9 : 86 49 __ STX T2 + 0 
31bb : 84 4c __ STY T4 + 0 
.s85:
31bd : a5 49 __ LDA T2 + 0 
31bf : f0 16 __ BEQ $31d7 ; (printf.s238 + 0)
.s92:
31c1 : a9 be __ LDA #$be
31c3 : 85 0d __ STA P0 ; (fmt + 0)
31c5 : a9 bf __ LDA #$bf
31c7 : 85 0e __ STA P1 ; (fmt + 1)
31c9 : a9 00 __ LDA #$00
31cb : a6 49 __ LDX T2 + 0 
31cd : 9d be bf STA $bfbe,x ; (buff + 0)
31d0 : 20 a9 32 JSR $32a9 ; (puts.s0 + 0)
31d3 : a9 00 __ LDA #$00
31d5 : 85 49 __ STA T2 + 0 
.s238:
31d7 : a5 4d __ LDA T6 + 0 
31d9 : 85 0d __ STA P0 ; (fmt + 0)
31db : a5 4e __ LDA T6 + 1 
31dd : 85 0e __ STA P1 ; (fmt + 1)
31df : 20 a9 32 JSR $32a9 ; (puts.s0 + 0)
31e2 : ad bc bf LDA $bfbc ; (si + 6)
31e5 : d0 03 __ BNE $31ea ; (printf.s1073 + 0)
31e7 : 4c 7f 2f JMP $2f7f ; (printf.l2 + 0)
.s1073:
31ea : a4 4c __ LDY T4 + 0 
31ec : cc b7 bf CPY $bfb7 ; (si + 1)
31ef : a2 00 __ LDX #$00
31f1 : b0 0d __ BCS $3200 ; (printf.s1074 + 0)
.l102:
31f3 : ad b6 bf LDA $bfb6 ; (si + 0)
31f6 : 9d be bf STA $bfbe,x ; (buff + 0)
31f9 : c8 __ __ INY
31fa : cc b7 bf CPY $bfb7 ; (si + 1)
31fd : e8 __ __ INX
31fe : 90 f3 __ BCC $31f3 ; (printf.l102 + 0)
.s1074:
3200 : 86 49 __ STX T2 + 0 
3202 : 4c 7f 2f JMP $2f7f ; (printf.l2 + 0)
.s57:
3205 : a0 00 __ LDY #$00
3207 : b1 47 __ LDA (T0 + 0),y 
3209 : 85 53 __ STA T8 + 0 
320b : c8 __ __ INY
320c : b1 47 __ LDA (T0 + 0),y 
320e : 85 54 __ STA T8 + 1 
3210 : c8 __ __ INY
3211 : b1 47 __ LDA (T0 + 0),y 
3213 : 85 55 __ STA T8 + 2 
3215 : c8 __ __ INY
3216 : b1 47 __ LDA (T0 + 0),y 
3218 : 85 56 __ STA T8 + 3 
321a : 18 __ __ CLC
321b : a5 47 __ LDA T0 + 0 
321d : 69 04 __ ADC #$04
321f : 85 47 __ STA T0 + 0 
3221 : 90 02 __ BCC $3225 ; (printf.s1086 + 0)
.s1085:
3223 : e6 48 __ INC T0 + 1 
.s1086:
3225 : a0 00 __ LDY #$00
3227 : b1 4a __ LDA (T3 + 0),y 
3229 : aa __ __ TAX
322a : e6 4a __ INC T3 + 0 
322c : d0 02 __ BNE $3230 ; (printf.s1088 + 0)
.s1087:
322e : e6 4b __ INC T3 + 1 
.s1088:
3230 : 8a __ __ TXA
3231 : e0 64 __ CPX #$64
3233 : f0 04 __ BEQ $3239 ; (printf.s61 + 0)
.s64:
3235 : c9 44 __ CMP #$44
3237 : d0 04 __ BNE $323d ; (printf.s62 + 0)
.s61:
3239 : a9 01 __ LDA #$01
323b : d0 1c __ BNE $3259 ; (printf.s245 + 0)
.s62:
323d : c9 75 __ CMP #$75
323f : f0 17 __ BEQ $3258 ; (printf.s268 + 0)
.s68:
3241 : c9 55 __ CMP #$55
3243 : f0 13 __ BEQ $3258 ; (printf.s268 + 0)
.s66:
3245 : c9 78 __ CMP #$78
3247 : f0 07 __ BEQ $3250 ; (printf.s69 + 0)
.s72:
3249 : c9 58 __ CMP #$58
324b : f0 03 __ BEQ $3250 ; (printf.s69 + 0)
324d : 4c 7f 2f JMP $2f7f ; (printf.l2 + 0)
.s69:
3250 : 8c ba bf STY $bfba ; (si + 4)
3253 : a9 10 __ LDA #$10
3255 : 8d b9 bf STA $bfb9 ; (si + 3)
.s268:
3258 : 98 __ __ TYA
.s245:
3259 : 85 15 __ STA P8 
325b : a9 be __ LDA #$be
325d : 85 0f __ STA P2 ; (fmt + 2)
325f : a9 bf __ LDA #$bf
3261 : 85 10 __ STA P3 ; (fmt + 3)
3263 : a9 b6 __ LDA #$b6
3265 : 85 0d __ STA P0 ; (fmt + 0)
3267 : a9 bf __ LDA #$bf
3269 : 85 0e __ STA P1 ; (fmt + 1)
326b : 20 33 34 JSR $3433 ; (nforml@proxy + 0)
326e : a5 1b __ LDA ACCU + 0 
3270 : 4c ca 2f JMP $2fca ; (printf.s1068 + 0)
.s269:
3273 : a9 00 __ LDA #$00
.s247:
3275 : 85 13 __ STA P6 
3277 : a9 be __ LDA #$be
3279 : 85 0f __ STA P2 ; (fmt + 2)
327b : a9 bf __ LDA #$bf
327d : 85 10 __ STA P3 ; (fmt + 3)
327f : a0 00 __ LDY #$00
3281 : b1 47 __ LDA (T0 + 0),y 
3283 : 85 11 __ STA P4 
3285 : c8 __ __ INY
3286 : b1 47 __ LDA (T0 + 0),y 
3288 : 85 12 __ STA P5 
328a : a9 b6 __ LDA #$b6
328c : 85 0d __ STA P0 ; (fmt + 0)
328e : a9 bf __ LDA #$bf
3290 : 85 0e __ STA P1 ; (fmt + 1)
3292 : 20 fe 32 JSR $32fe ; (nformi.s0 + 0)
3295 : a5 1b __ LDA ACCU + 0 
3297 : 85 49 __ STA T2 + 0 
3299 : 4c 63 31 JMP $3163 ; (printf.s244 + 0)
.s246:
329c : a0 00 __ LDY #$00
329e : b1 4a __ LDA (T3 + 0),y 
32a0 : aa __ __ TAX
32a1 : 18 __ __ CLC
32a2 : a5 4a __ LDA T3 + 0 
32a4 : 69 01 __ ADC #$01
32a6 : 4c 14 30 JMP $3014 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
32a9 : a0 00 __ LDY #$00
32ab : b1 0d __ LDA (P0),y 
32ad : f0 0b __ BEQ $32ba ; (puts.s1001 + 0)
32af : 20 bb 32 JSR $32bb ; (putpch + 0)
32b2 : e6 0d __ INC P0 
32b4 : d0 f3 __ BNE $32a9 ; (puts.s0 + 0)
32b6 : e6 0e __ INC P1 
32b8 : d0 ef __ BNE $32a9 ; (puts.s0 + 0)
.s1001:
32ba : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
32bb : ae 94 42 LDX $4294 ; (giocharmap + 0)
32be : e0 01 __ CPX #$01
32c0 : 90 26 __ BCC $32e8 ; (putpch + 45)
32c2 : c9 0a __ CMP #$0a
32c4 : d0 02 __ BNE $32c8 ; (putpch + 13)
32c6 : a9 0d __ LDA #$0d
32c8 : c9 09 __ CMP #$09
32ca : f0 1f __ BEQ $32eb ; (putpch + 48)
32cc : e0 02 __ CPX #$02
32ce : 90 18 __ BCC $32e8 ; (putpch + 45)
32d0 : c9 41 __ CMP #$41
32d2 : 90 14 __ BCC $32e8 ; (putpch + 45)
32d4 : c9 7b __ CMP #$7b
32d6 : b0 10 __ BCS $32e8 ; (putpch + 45)
32d8 : c9 61 __ CMP #$61
32da : b0 04 __ BCS $32e0 ; (putpch + 37)
32dc : c9 5b __ CMP #$5b
32de : b0 08 __ BCS $32e8 ; (putpch + 45)
32e0 : 49 20 __ EOR #$20
32e2 : e0 03 __ CPX #$03
32e4 : f0 02 __ BEQ $32e8 ; (putpch + 45)
32e6 : 29 df __ AND #$df
32e8 : 4c d2 ff JMP $ffd2 
32eb : 38 __ __ SEC
32ec : 20 f0 ff JSR $fff0 
32ef : 98 __ __ TYA
32f0 : 29 03 __ AND #$03
32f2 : 49 03 __ EOR #$03
32f4 : aa __ __ TAX
32f5 : a9 20 __ LDA #$20
32f7 : 20 d2 ff JSR $ffd2 
32fa : ca __ __ DEX
32fb : 10 fa __ BPL $32f7 ; (putpch + 60)
32fd : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
32fe : a9 00 __ LDA #$00
3300 : 85 43 __ STA T0 + 0 
3302 : a5 13 __ LDA P6 ; (s + 0)
3304 : f0 13 __ BEQ $3319 ; (nformi.s182 + 0)
.s4:
3306 : 24 12 __ BIT P5 ; (v + 1)
3308 : 10 0f __ BPL $3319 ; (nformi.s182 + 0)
.s1:
330a : 38 __ __ SEC
330b : a9 00 __ LDA #$00
330d : e5 11 __ SBC P4 ; (v + 0)
330f : 85 11 __ STA P4 ; (v + 0)
3311 : a9 00 __ LDA #$00
3313 : e5 12 __ SBC P5 ; (v + 1)
3315 : 85 12 __ STA P5 ; (v + 1)
3317 : e6 43 __ INC T0 + 0 
.s182:
3319 : a9 10 __ LDA #$10
331b : 85 44 __ STA T2 + 0 
331d : a5 11 __ LDA P4 ; (v + 0)
331f : 05 12 __ ORA P5 ; (v + 1)
3321 : f0 46 __ BEQ $3369 ; (nformi.s7 + 0)
.s42:
3323 : a0 03 __ LDY #$03
3325 : b1 0d __ LDA (P0),y ; (si + 0)
3327 : 85 45 __ STA T4 + 0 
3329 : c8 __ __ INY
332a : b1 0d __ LDA (P0),y ; (si + 0)
332c : 85 46 __ STA T4 + 1 
.l6:
332e : a5 11 __ LDA P4 ; (v + 0)
3330 : 85 1b __ STA ACCU + 0 
3332 : a5 12 __ LDA P5 ; (v + 1)
3334 : 85 1c __ STA ACCU + 1 
3336 : a5 45 __ LDA T4 + 0 
3338 : 85 03 __ STA WORK + 0 
333a : a5 46 __ LDA T4 + 1 
333c : 85 04 __ STA WORK + 1 
333e : 20 18 41 JSR $4118 ; (divmod + 0)
3341 : a5 06 __ LDA WORK + 3 
3343 : 30 08 __ BMI $334d ; (nformi.s78 + 0)
.s1019:
3345 : d0 0a __ BNE $3351 ; (nformi.s77 + 0)
.s1018:
3347 : a5 05 __ LDA WORK + 2 
3349 : c9 0a __ CMP #$0a
334b : b0 04 __ BCS $3351 ; (nformi.s77 + 0)
.s78:
334d : a9 30 __ LDA #$30
334f : d0 02 __ BNE $3353 ; (nformi.s79 + 0)
.s77:
3351 : a9 37 __ LDA #$37
.s79:
3353 : 18 __ __ CLC
3354 : 65 05 __ ADC WORK + 2 
3356 : c6 44 __ DEC T2 + 0 
3358 : a6 44 __ LDX T2 + 0 
335a : 9d f0 bf STA $bff0,x ; (buffer + 0)
335d : a5 1b __ LDA ACCU + 0 
335f : 85 11 __ STA P4 ; (v + 0)
3361 : a5 1c __ LDA ACCU + 1 
3363 : 85 12 __ STA P5 ; (v + 1)
3365 : 05 11 __ ORA P4 ; (v + 0)
3367 : d0 c5 __ BNE $332e ; (nformi.l6 + 0)
.s7:
3369 : a0 02 __ LDY #$02
336b : b1 0d __ LDA (P0),y ; (si + 0)
336d : c9 ff __ CMP #$ff
336f : d0 04 __ BNE $3375 ; (nformi.s80 + 0)
.s81:
3371 : a9 0f __ LDA #$0f
3373 : d0 05 __ BNE $337a ; (nformi.s1026 + 0)
.s80:
3375 : 38 __ __ SEC
3376 : a9 10 __ LDA #$10
3378 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
337a : a8 __ __ TAY
337b : c4 44 __ CPY T2 + 0 
337d : b0 0d __ BCS $338c ; (nformi.s10 + 0)
.s9:
337f : a9 30 __ LDA #$30
.l1027:
3381 : c6 44 __ DEC T2 + 0 
3383 : a6 44 __ LDX T2 + 0 
3385 : 9d f0 bf STA $bff0,x ; (buffer + 0)
3388 : c4 44 __ CPY T2 + 0 
338a : 90 f5 __ BCC $3381 ; (nformi.l1027 + 0)
.s10:
338c : a0 07 __ LDY #$07
338e : b1 0d __ LDA (P0),y ; (si + 0)
3390 : f0 20 __ BEQ $33b2 ; (nformi.s13 + 0)
.s14:
3392 : a0 04 __ LDY #$04
3394 : b1 0d __ LDA (P0),y ; (si + 0)
3396 : d0 1a __ BNE $33b2 ; (nformi.s13 + 0)
.s1013:
3398 : 88 __ __ DEY
3399 : b1 0d __ LDA (P0),y ; (si + 0)
339b : c9 10 __ CMP #$10
339d : d0 13 __ BNE $33b2 ; (nformi.s13 + 0)
.s11:
339f : a9 58 __ LDA #$58
33a1 : a6 44 __ LDX T2 + 0 
33a3 : 9d ef bf STA $bfef,x ; (buff + 49)
33a6 : 8a __ __ TXA
33a7 : 18 __ __ CLC
33a8 : 69 fe __ ADC #$fe
33aa : 85 44 __ STA T2 + 0 
33ac : aa __ __ TAX
33ad : a9 30 __ LDA #$30
33af : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
33b2 : a9 00 __ LDA #$00
33b4 : 85 1b __ STA ACCU + 0 
33b6 : a5 43 __ LDA T0 + 0 
33b8 : f0 06 __ BEQ $33c0 ; (nformi.s16 + 0)
.s15:
33ba : c6 44 __ DEC T2 + 0 
33bc : a9 2d __ LDA #$2d
33be : d0 0a __ BNE $33ca ; (nformi.s1025 + 0)
.s16:
33c0 : a0 05 __ LDY #$05
33c2 : b1 0d __ LDA (P0),y ; (si + 0)
33c4 : f0 09 __ BEQ $33cf ; (nformi.s163 + 0)
.s18:
33c6 : c6 44 __ DEC T2 + 0 
33c8 : a9 2b __ LDA #$2b
.s1025:
33ca : a6 44 __ LDX T2 + 0 
33cc : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
33cf : a0 06 __ LDY #$06
33d1 : b1 0d __ LDA (P0),y ; (si + 0)
33d3 : d0 33 __ BNE $3408 ; (nformi.s24 + 0)
.l30:
33d5 : a0 01 __ LDY #$01
33d7 : b1 0d __ LDA (P0),y ; (si + 0)
33d9 : 18 __ __ CLC
33da : 65 44 __ ADC T2 + 0 
33dc : b0 04 __ BCS $33e2 ; (nformi.s31 + 0)
.s1006:
33de : c9 11 __ CMP #$11
33e0 : 90 0d __ BCC $33ef ; (nformi.s33 + 0)
.s31:
33e2 : c6 44 __ DEC T2 + 0 
33e4 : a0 00 __ LDY #$00
33e6 : b1 0d __ LDA (P0),y ; (si + 0)
33e8 : a6 44 __ LDX T2 + 0 
33ea : 9d f0 bf STA $bff0,x ; (buffer + 0)
33ed : b0 e6 __ BCS $33d5 ; (nformi.l30 + 0)
.s33:
33ef : a6 44 __ LDX T2 + 0 
33f1 : e0 10 __ CPX #$10
33f3 : b0 0e __ BCS $3403 ; (nformi.s23 + 0)
.s34:
33f5 : 88 __ __ DEY
.l1022:
33f6 : bd f0 bf LDA $bff0,x ; (buffer + 0)
33f9 : 91 0f __ STA (P2),y ; (str + 0)
33fb : e8 __ __ INX
33fc : e0 10 __ CPX #$10
33fe : c8 __ __ INY
33ff : 90 f5 __ BCC $33f6 ; (nformi.l1022 + 0)
.s1023:
3401 : 84 1b __ STY ACCU + 0 
.s23:
3403 : a9 00 __ LDA #$00
3405 : 85 1c __ STA ACCU + 1 
.s1001:
3407 : 60 __ __ RTS
.s24:
3408 : a6 44 __ LDX T2 + 0 
340a : e0 10 __ CPX #$10
340c : b0 1a __ BCS $3428 ; (nformi.l27 + 0)
.s25:
340e : a0 00 __ LDY #$00
.l1020:
3410 : bd f0 bf LDA $bff0,x ; (buffer + 0)
3413 : 91 0f __ STA (P2),y ; (str + 0)
3415 : e8 __ __ INX
3416 : e0 10 __ CPX #$10
3418 : c8 __ __ INY
3419 : 90 f5 __ BCC $3410 ; (nformi.l1020 + 0)
.s1021:
341b : 84 1b __ STY ACCU + 0 
341d : b0 09 __ BCS $3428 ; (nformi.l27 + 0)
.s28:
341f : 88 __ __ DEY
3420 : b1 0d __ LDA (P0),y ; (si + 0)
3422 : a4 1b __ LDY ACCU + 0 
3424 : 91 0f __ STA (P2),y ; (str + 0)
3426 : e6 1b __ INC ACCU + 0 
.l27:
3428 : a5 1b __ LDA ACCU + 0 
342a : a0 01 __ LDY #$01
342c : d1 0d __ CMP (P0),y ; (si + 0)
342e : 90 ef __ BCC $341f ; (nformi.s28 + 0)
3430 : 4c 03 34 JMP $3403 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml@proxy: ; nforml@proxy
3433 : a5 53 __ LDA $53 
3435 : 85 11 __ STA P4 
3437 : a5 54 __ LDA $54 
3439 : 85 12 __ STA P5 
343b : a5 55 __ LDA $55 
343d : 85 13 __ STA P6 
343f : a5 56 __ LDA $56 
3441 : 85 14 __ STA P7 
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
3443 : a9 00 __ LDA #$00
3445 : 85 43 __ STA T0 + 0 
3447 : a5 15 __ LDA P8 ; (s + 0)
3449 : f0 21 __ BEQ $346c ; (nforml.s182 + 0)
.s4:
344b : a5 14 __ LDA P7 ; (v + 3)
344d : f0 1d __ BEQ $346c ; (nforml.s182 + 0)
.s1032:
344f : 10 1b __ BPL $346c ; (nforml.s182 + 0)
.s1:
3451 : 38 __ __ SEC
3452 : a9 00 __ LDA #$00
3454 : e5 11 __ SBC P4 ; (v + 0)
3456 : 85 11 __ STA P4 ; (v + 0)
3458 : a9 00 __ LDA #$00
345a : e5 12 __ SBC P5 ; (v + 1)
345c : 85 12 __ STA P5 ; (v + 1)
345e : a9 00 __ LDA #$00
3460 : e5 13 __ SBC P6 ; (v + 2)
3462 : 85 13 __ STA P6 ; (v + 2)
3464 : a9 00 __ LDA #$00
3466 : e5 14 __ SBC P7 ; (v + 3)
3468 : 85 14 __ STA P7 ; (v + 3)
346a : e6 43 __ INC T0 + 0 
.s182:
346c : a9 10 __ LDA #$10
346e : 85 44 __ STA T2 + 0 
3470 : a5 14 __ LDA P7 ; (v + 3)
3472 : d0 0c __ BNE $3480 ; (nforml.s42 + 0)
.s1024:
3474 : a5 13 __ LDA P6 ; (v + 2)
3476 : d0 08 __ BNE $3480 ; (nforml.s42 + 0)
.s1025:
3478 : a5 12 __ LDA P5 ; (v + 1)
347a : d0 04 __ BNE $3480 ; (nforml.s42 + 0)
.s1026:
347c : c5 11 __ CMP P4 ; (v + 0)
347e : b0 0e __ BCS $348e ; (nforml.s7 + 0)
.s42:
3480 : a0 03 __ LDY #$03
3482 : b1 0d __ LDA (P0),y ; (si + 0)
3484 : 85 45 __ STA T5 + 0 
3486 : c8 __ __ INY
3487 : b1 0d __ LDA (P0),y ; (si + 0)
3489 : 85 46 __ STA T5 + 1 
348b : 4c 58 35 JMP $3558 ; (nforml.l6 + 0)
.s7:
348e : a0 02 __ LDY #$02
3490 : b1 0d __ LDA (P0),y ; (si + 0)
3492 : c9 ff __ CMP #$ff
3494 : d0 04 __ BNE $349a ; (nforml.s80 + 0)
.s81:
3496 : a9 0f __ LDA #$0f
3498 : d0 05 __ BNE $349f ; (nforml.s1039 + 0)
.s80:
349a : 38 __ __ SEC
349b : a9 10 __ LDA #$10
349d : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
349f : a8 __ __ TAY
34a0 : c4 44 __ CPY T2 + 0 
34a2 : b0 0d __ BCS $34b1 ; (nforml.s10 + 0)
.s9:
34a4 : a9 30 __ LDA #$30
.l1040:
34a6 : c6 44 __ DEC T2 + 0 
34a8 : a6 44 __ LDX T2 + 0 
34aa : 9d f0 bf STA $bff0,x ; (buffer + 0)
34ad : c4 44 __ CPY T2 + 0 
34af : 90 f5 __ BCC $34a6 ; (nforml.l1040 + 0)
.s10:
34b1 : a0 07 __ LDY #$07
34b3 : b1 0d __ LDA (P0),y ; (si + 0)
34b5 : f0 20 __ BEQ $34d7 ; (nforml.s13 + 0)
.s14:
34b7 : a0 04 __ LDY #$04
34b9 : b1 0d __ LDA (P0),y ; (si + 0)
34bb : d0 1a __ BNE $34d7 ; (nforml.s13 + 0)
.s1013:
34bd : 88 __ __ DEY
34be : b1 0d __ LDA (P0),y ; (si + 0)
34c0 : c9 10 __ CMP #$10
34c2 : d0 13 __ BNE $34d7 ; (nforml.s13 + 0)
.s11:
34c4 : a9 58 __ LDA #$58
34c6 : a6 44 __ LDX T2 + 0 
34c8 : 9d ef bf STA $bfef,x ; (buff + 49)
34cb : 8a __ __ TXA
34cc : 18 __ __ CLC
34cd : 69 fe __ ADC #$fe
34cf : 85 44 __ STA T2 + 0 
34d1 : aa __ __ TAX
34d2 : a9 30 __ LDA #$30
34d4 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
34d7 : a9 00 __ LDA #$00
34d9 : 85 1b __ STA ACCU + 0 
34db : a5 43 __ LDA T0 + 0 
34dd : f0 06 __ BEQ $34e5 ; (nforml.s16 + 0)
.s15:
34df : c6 44 __ DEC T2 + 0 
34e1 : a9 2d __ LDA #$2d
34e3 : d0 0a __ BNE $34ef ; (nforml.s1038 + 0)
.s16:
34e5 : a0 05 __ LDY #$05
34e7 : b1 0d __ LDA (P0),y ; (si + 0)
34e9 : f0 09 __ BEQ $34f4 ; (nforml.s163 + 0)
.s18:
34eb : c6 44 __ DEC T2 + 0 
34ed : a9 2b __ LDA #$2b
.s1038:
34ef : a6 44 __ LDX T2 + 0 
34f1 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
34f4 : a0 06 __ LDY #$06
34f6 : b1 0d __ LDA (P0),y ; (si + 0)
34f8 : d0 33 __ BNE $352d ; (nforml.s24 + 0)
.l30:
34fa : a0 01 __ LDY #$01
34fc : b1 0d __ LDA (P0),y ; (si + 0)
34fe : 18 __ __ CLC
34ff : 65 44 __ ADC T2 + 0 
3501 : b0 04 __ BCS $3507 ; (nforml.s31 + 0)
.s1006:
3503 : c9 11 __ CMP #$11
3505 : 90 0d __ BCC $3514 ; (nforml.s33 + 0)
.s31:
3507 : c6 44 __ DEC T2 + 0 
3509 : a0 00 __ LDY #$00
350b : b1 0d __ LDA (P0),y ; (si + 0)
350d : a6 44 __ LDX T2 + 0 
350f : 9d f0 bf STA $bff0,x ; (buffer + 0)
3512 : b0 e6 __ BCS $34fa ; (nforml.l30 + 0)
.s33:
3514 : a6 44 __ LDX T2 + 0 
3516 : e0 10 __ CPX #$10
3518 : b0 0e __ BCS $3528 ; (nforml.s23 + 0)
.s34:
351a : 88 __ __ DEY
.l1035:
351b : bd f0 bf LDA $bff0,x ; (buffer + 0)
351e : 91 0f __ STA (P2),y ; (str + 0)
3520 : e8 __ __ INX
3521 : e0 10 __ CPX #$10
3523 : c8 __ __ INY
3524 : 90 f5 __ BCC $351b ; (nforml.l1035 + 0)
.s1036:
3526 : 84 1b __ STY ACCU + 0 
.s23:
3528 : a9 00 __ LDA #$00
352a : 85 1c __ STA ACCU + 1 
.s1001:
352c : 60 __ __ RTS
.s24:
352d : a6 44 __ LDX T2 + 0 
352f : e0 10 __ CPX #$10
3531 : b0 1a __ BCS $354d ; (nforml.l27 + 0)
.s25:
3533 : a0 00 __ LDY #$00
.l1033:
3535 : bd f0 bf LDA $bff0,x ; (buffer + 0)
3538 : 91 0f __ STA (P2),y ; (str + 0)
353a : e8 __ __ INX
353b : e0 10 __ CPX #$10
353d : c8 __ __ INY
353e : 90 f5 __ BCC $3535 ; (nforml.l1033 + 0)
.s1034:
3540 : 84 1b __ STY ACCU + 0 
3542 : b0 09 __ BCS $354d ; (nforml.l27 + 0)
.s28:
3544 : 88 __ __ DEY
3545 : b1 0d __ LDA (P0),y ; (si + 0)
3547 : a4 1b __ LDY ACCU + 0 
3549 : 91 0f __ STA (P2),y ; (str + 0)
354b : e6 1b __ INC ACCU + 0 
.l27:
354d : a5 1b __ LDA ACCU + 0 
354f : a0 01 __ LDY #$01
3551 : d1 0d __ CMP (P0),y ; (si + 0)
3553 : 90 ef __ BCC $3544 ; (nforml.s28 + 0)
3555 : 4c 28 35 JMP $3528 ; (nforml.s23 + 0)
.l6:
3558 : a5 11 __ LDA P4 ; (v + 0)
355a : 85 1b __ STA ACCU + 0 
355c : a5 12 __ LDA P5 ; (v + 1)
355e : 85 1c __ STA ACCU + 1 
3560 : a5 13 __ LDA P6 ; (v + 2)
3562 : 85 1d __ STA ACCU + 2 
3564 : a5 14 __ LDA P7 ; (v + 3)
3566 : 85 1e __ STA ACCU + 3 
3568 : a5 45 __ LDA T5 + 0 
356a : 85 03 __ STA WORK + 0 
356c : a5 46 __ LDA T5 + 1 
356e : 85 04 __ STA WORK + 1 
3570 : a9 00 __ LDA #$00
3572 : 85 05 __ STA WORK + 2 
3574 : 85 06 __ STA WORK + 3 
3576 : 20 9d 41 JSR $419d ; (divmod32 + 0)
3579 : a5 08 __ LDA WORK + 5 
357b : 30 08 __ BMI $3585 ; (nforml.s78 + 0)
.s1023:
357d : d0 0a __ BNE $3589 ; (nforml.s77 + 0)
.s1022:
357f : a5 07 __ LDA WORK + 4 
3581 : c9 0a __ CMP #$0a
3583 : b0 04 __ BCS $3589 ; (nforml.s77 + 0)
.s78:
3585 : a9 30 __ LDA #$30
3587 : d0 02 __ BNE $358b ; (nforml.s79 + 0)
.s77:
3589 : a9 37 __ LDA #$37
.s79:
358b : 18 __ __ CLC
358c : 65 07 __ ADC WORK + 4 
358e : c6 44 __ DEC T2 + 0 
3590 : a6 44 __ LDX T2 + 0 
3592 : 9d f0 bf STA $bff0,x ; (buffer + 0)
3595 : a5 1b __ LDA ACCU + 0 
3597 : 85 11 __ STA P4 ; (v + 0)
3599 : a5 1c __ LDA ACCU + 1 
359b : 85 12 __ STA P5 ; (v + 1)
359d : a5 1d __ LDA ACCU + 2 
359f : 85 13 __ STA P6 ; (v + 2)
35a1 : a5 1e __ LDA ACCU + 3 
35a3 : 85 14 __ STA P7 ; (v + 3)
35a5 : d0 b1 __ BNE $3558 ; (nforml.l6 + 0)
.s1018:
35a7 : a5 13 __ LDA P6 ; (v + 2)
35a9 : d0 ad __ BNE $3558 ; (nforml.l6 + 0)
.s1019:
35ab : a5 12 __ LDA P5 ; (v + 1)
35ad : d0 a9 __ BNE $3558 ; (nforml.l6 + 0)
.s1020:
35af : c5 11 __ CMP P4 ; (v + 0)
35b1 : 90 a5 __ BCC $3558 ; (nforml.l6 + 0)
35b3 : 4c 8e 34 JMP $348e ; (nforml.s7 + 0)
--------------------------------------------------------------------
35b6 : __ __ __ BYT 57 52 49 54 45 20 44 41 54 41 2e 0a 00          : WRITE DATA...
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
35c3 : a5 0d __ LDA P0 
35c5 : a6 0e __ LDX P1 
35c7 : 20 68 ff JSR $ff68 
.s1001:
35ca : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam@proxy: ; krnio_setnam@proxy
35cb : a9 4c __ LDA #$4c
35cd : 85 0d __ STA P0 
35cf : a9 bf __ LDA #$bf
35d1 : 85 0e __ STA P1 
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
35d3 : a5 0d __ LDA P0 
35d5 : 05 0e __ ORA P1 
35d7 : f0 08 __ BEQ $35e1 ; (krnio_setnam.s0 + 14)
35d9 : a0 ff __ LDY #$ff
35db : c8 __ __ INY
35dc : b1 0d __ LDA (P0),y 
35de : d0 fb __ BNE $35db ; (krnio_setnam.s0 + 8)
35e0 : 98 __ __ TYA
35e1 : a6 0d __ LDX P0 
35e3 : a4 0e __ LDY P1 
35e5 : 20 bd ff JSR $ffbd 
.s1001:
35e8 : 60 __ __ RTS
--------------------------------------------------------------------
35e9 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 4f 50 45 : RETURN VALUE OPE
35f9 : __ __ __ BYT 4e 3a 20 25 44 0a 00                            : N: %D..
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
.s0:
3600 : a9 00 __ LDA #$00
3602 : 8d d6 42 STA $42d6 ; (krnio_pstatus + 1)
3605 : a9 00 __ LDA #$00
3607 : 85 1b __ STA ACCU + 0 
3609 : 85 1c __ STA ACCU + 1 
360b : a5 0d __ LDA P0 
360d : a6 0e __ LDX P1 
360f : a4 0f __ LDY P2 
3611 : 20 ba ff JSR $ffba 
3614 : 20 c0 ff JSR $ffc0 
3617 : 90 08 __ BCC $3621 ; (krnio_open.s0 + 33)
3619 : a5 0d __ LDA P0 
361b : 20 c3 ff JSR $ffc3 
361e : 4c 25 36 JMP $3625 ; (krnio_open.s1001 + 0)
3621 : a9 01 __ LDA #$01
3623 : 85 1b __ STA ACCU + 0 
.s1001:
3625 : a5 1b __ LDA ACCU + 0 
3627 : 60 __ __ RTS
--------------------------------------------------------------------
3628 : __ __ __ BYT 53 54 41 54 55 53 20 41 46 54 45 52 20 4f 50 45 : STATUS AFTER OPE
3638 : __ __ __ BYT 4e 3a 20 25 44 0a 00                            : N: %D..
--------------------------------------------------------------------
363f : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 57 52 49 : RETURN VALUE WRI
364f : __ __ __ BYT 54 45 3a 20 25 44 0a 00                         : TE: %D..
--------------------------------------------------------------------
krnio_chkout: ; krnio_chkout(u8)->bool
.s1000:
3657 : 85 0d __ STA P0 
.s0:
3659 : a6 0d __ LDX P0 
365b : 20 c9 ff JSR $ffc9 
365e : a9 00 __ LDA #$00
3660 : 85 1c __ STA ACCU + 1 
3662 : b0 02 __ BCS $3666 ; (krnio_chkout.s0 + 13)
3664 : a9 01 __ LDA #$01
3666 : 85 1b __ STA ACCU + 0 
.s1001:
3668 : a5 1b __ LDA ACCU + 0 
366a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrout: ; krnio_chrout(u8)->void
.s1000:
366b : 85 0d __ STA P0 
.s0:
366d : a5 0d __ LDA P0 
366f : 20 d2 ff JSR $ffd2 
3672 : 85 1b __ STA ACCU + 0 
3674 : a9 00 __ LDA #$00
3676 : 85 1c __ STA ACCU + 1 
.s1001:
3678 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
.s0:
3679 : 20 cc ff JSR $ffcc 
.s1001:
367c : 60 __ __ RTS
--------------------------------------------------------------------
367d : __ __ __ BYT 53 54 41 54 55 53 20 41 46 54 45 52 20 57 52 49 : STATUS AFTER WRI
368d : __ __ __ BYT 54 45 3a 20 25 44 0a 00                         : TE: %D..
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
.s1000:
3695 : 85 0d __ STA P0 
.s0:
3697 : a5 0d __ LDA P0 
3699 : 20 c3 ff JSR $ffc3 
.s1001:
369c : 60 __ __ RTS
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
369d : a9 5b __ LDA #$5b
369f : 85 0d __ STA P0 
36a1 : a9 bf __ LDA #$bf
36a3 : 85 0e __ STA P1 
36a5 : a9 51 __ LDA #$51
36a7 : 85 11 __ STA P4 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
.s0:
36a9 : a5 0f __ LDA P2 
36ab : a6 12 __ LDX P5 
36ad : f0 0c __ BEQ $36bb ; (memset.s0 + 18)
36af : a0 00 __ LDY #$00
36b1 : 91 0d __ STA (P0),y 
36b3 : c8 __ __ INY
36b4 : d0 fb __ BNE $36b1 ; (memset.s0 + 8)
36b6 : e6 0e __ INC P1 
36b8 : ca __ __ DEX
36b9 : d0 f6 __ BNE $36b1 ; (memset.s0 + 8)
36bb : a4 11 __ LDY P4 
36bd : f0 05 __ BEQ $36c4 ; (memset.s1001 + 0)
36bf : 88 __ __ DEY
36c0 : 91 0d __ STA (P0),y 
36c2 : d0 fb __ BNE $36bf ; (memset.s0 + 22)
.s1001:
36c4 : 60 __ __ RTS
--------------------------------------------------------------------
36c5 : __ __ __ BYT 52 45 41 44 20 44 41 54 41 2e 0a 00             : READ DATA...
--------------------------------------------------------------------
36d1 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 52 45 41 : RETURN VALUE REA
36e1 : __ __ __ BYT 44 3a 20 25 44 0a 00                            : D: %D..
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
.s1000:
36e8 : 85 0d __ STA P0 
.s0:
36ea : a6 0d __ LDX P0 
36ec : 20 c6 ff JSR $ffc6 
36ef : a9 00 __ LDA #$00
36f1 : 85 1c __ STA ACCU + 1 
36f3 : b0 02 __ BCS $36f7 ; (krnio_chkin.s0 + 13)
36f5 : a9 01 __ LDA #$01
36f7 : 85 1b __ STA ACCU + 0 
.s1001:
36f9 : a5 1b __ LDA ACCU + 0 
36fb : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->i16
.s0:
36fc : 20 cf ff JSR $ffcf 
36ff : 85 1b __ STA ACCU + 0 
3701 : a9 00 __ LDA #$00
3703 : 85 1c __ STA ACCU + 1 
.s1001:
3705 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
.s0:
3706 : 20 b7 ff JSR $ffb7 
3709 : 85 1b __ STA ACCU + 0 
370b : a9 00 __ LDA #$00
370d : 85 1c __ STA ACCU + 1 
.s1001:
370f : a5 1b __ LDA ACCU + 0 
3711 : 60 __ __ RTS
--------------------------------------------------------------------
3712 : __ __ __ BYT 53 54 41 54 55 53 20 41 46 54 45 52 20 52 45 41 : STATUS AFTER REA
3722 : __ __ __ BYT 44 3a 20 25 44 0a 00                            : D: %D..
--------------------------------------------------------------------
3729 : __ __ __ BYT 44 41 54 41 20 52 45 41 44 3a 0a 25 53 0a 00    : DATA READ:.%S..
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
3738 : 20 46 37 JSR $3746 ; (getpch + 0)
373b : c9 00 __ CMP #$00
373d : f0 f9 __ BEQ $3738 ; (getch.s0 + 0)
373f : 85 1b __ STA ACCU + 0 
3741 : a9 00 __ LDA #$00
3743 : 85 1c __ STA ACCU + 1 
.s1001:
3745 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
3746 : 20 e4 ff JSR $ffe4 
3749 : ae 94 42 LDX $4294 ; (giocharmap + 0)
374c : e0 01 __ CPX #$01
374e : 90 26 __ BCC $3776 ; (getpch + 48)
3750 : c9 0d __ CMP #$0d
3752 : d0 02 __ BNE $3756 ; (getpch + 16)
3754 : a9 0a __ LDA #$0a
3756 : e0 02 __ CPX #$02
3758 : 90 1c __ BCC $3776 ; (getpch + 48)
375a : c9 db __ CMP #$db
375c : b0 18 __ BCS $3776 ; (getpch + 48)
375e : c9 41 __ CMP #$41
3760 : 90 14 __ BCC $3776 ; (getpch + 48)
3762 : c9 c1 __ CMP #$c1
3764 : 90 02 __ BCC $3768 ; (getpch + 34)
3766 : 49 a0 __ EOR #$a0
3768 : c9 7b __ CMP #$7b
376a : b0 0a __ BCS $3776 ; (getpch + 48)
376c : c9 61 __ CMP #$61
376e : b0 04 __ BCS $3774 ; (getpch + 46)
3770 : c9 5b __ CMP #$5b
3772 : b0 02 __ BCS $3776 ; (getpch + 48)
3774 : 49 20 __ EOR #$20
3776 : 60 __ __ RTS
--------------------------------------------------------------------
3777 : __ __ __ BYT 4e 4f 57 20 41 20 53 41 56 45 20 41 4e 44 20 4c : NOW A SAVE AND L
3787 : __ __ __ BYT 4f 41 44 20 54 45 53 54 2e 00                   : OAD TEST..
--------------------------------------------------------------------
3791 : __ __ __ BYT 54 45 53 54 32 00                               : TEST2.
--------------------------------------------------------------------
3797 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 53 41 56 : RETURN VALUE SAV
37a7 : __ __ __ BYT 45 3a 20 25 44 0a 00                            : E: %D..
--------------------------------------------------------------------
krnio_save: ; krnio_save(u8,const u8*,const u8*)->bool
.s0:
37ae : a5 0e __ LDA P1 
37b0 : 85 1b __ STA ACCU + 0 
37b2 : a5 0f __ LDA P2 
37b4 : 85 1c __ STA ACCU + 1 
37b6 : a9 00 __ LDA #$00
37b8 : a6 0d __ LDX P0 
37ba : a0 00 __ LDY #$00
37bc : 20 ba ff JSR $ffba 
37bf : a9 1b __ LDA #$1b
37c1 : a6 10 __ LDX P3 
37c3 : a4 11 __ LDY P4 
37c5 : 20 d8 ff JSR $ffd8 
37c8 : a9 00 __ LDA #$00
37ca : 85 1b __ STA ACCU + 0 
37cc : 85 1c __ STA ACCU + 1 
37ce : 90 05 __ BCC $37d5 ; (krnio_save.s0 + 39)
37d0 : a9 00 __ LDA #$00
37d2 : 4c d9 37 JMP $37d9 ; (krnio_save.s1001 + 0)
37d5 : a9 01 __ LDA #$01
37d7 : 85 1b __ STA ACCU + 0 
.s1001:
37d9 : a5 1b __ LDA ACCU + 0 
37db : 60 __ __ RTS
--------------------------------------------------------------------
37dc : __ __ __ BYT 4c 4f 41 44 20 44 41 54 41 2e 0a 00             : LOAD DATA...
--------------------------------------------------------------------
37e8 : __ __ __ BYT 52 45 54 55 52 4e 20 56 41 4c 55 45 20 4c 4f 41 : RETURN VALUE LOA
37f8 : __ __ __ BYT 44 3a 20 25 44 0a 00                            : D: %D..
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
37ff : a9 00 __ LDA #$00
3801 : 85 1b __ STA ACCU + 0 
3803 : 85 1c __ STA ACCU + 1 
3805 : a5 0d __ LDA P0 
3807 : a6 0e __ LDX P1 
3809 : a4 0f __ LDY P2 
380b : 20 ba ff JSR $ffba 
380e : a9 00 __ LDA #$00
3810 : a2 00 __ LDX #$00
3812 : a0 00 __ LDY #$00
3814 : 20 d5 ff JSR $ffd5 
3817 : 90 05 __ BCC $381e ; (krnio_load.s0 + 31)
3819 : a9 00 __ LDA #$00
381b : 4c 22 38 JMP $3822 ; (krnio_load.s1001 + 0)
381e : a9 01 __ LDA #$01
3820 : 85 1b __ STA ACCU + 0 
.s1001:
3822 : a5 1b __ LDA ACCU + 0 
3824 : 60 __ __ RTS
--------------------------------------------------------------------
3825 : __ __ __ BYT 73 77 69 74 63 68 20 74 6f 20 38 30 20 63 6f 6c : switch to 80 col
3835 : __ __ __ BYT 75 6d 6e 20 73 63 72 65 65 6e 0a 61 6e 64 20 70 : umn screen.and p
3845 : __ __ __ BYT 72 65 73 73 20 6b 65 79 2e 0a 00                : ress key...
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
3850 : 20 81 ff JSR $ff81 
.s1001:
3853 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
3854 : 24 d7 __ BIT $d7 
3856 : 30 03 __ BMI $385b ; (screen_setmode.s1001 + 0)
.s6:
3858 : 20 5f ff JSR $ff5f 
.s1001:
385b : 60 __ __ RTS
--------------------------------------------------------------------
385c : __ __ __ BYT 4f 56 4c 31 00                                  : OVL1.
--------------------------------------------------------------------
3861 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
3871 : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 00          : FILE FAILED..
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
387e : a5 0d __ LDA P0 
3880 : 85 1b __ STA ACCU + 0 
3882 : a5 0e __ LDA P1 
3884 : 85 1c __ STA ACCU + 1 
3886 : ae 33 42 LDX $4233 ; (spentry + 0)
3889 : 9a __ __ TXS
388a : a9 4c __ LDA #$4c
388c : 85 54 __ STA $54 
388e : a9 00 __ LDA #$00
3890 : 85 13 __ STA P6 
.s1001:
3892 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
3893 : a2 04 __ LDX #$04
3895 : b5 53 __ LDA T3 + 0,x 
3897 : 9d ac bf STA $bfac,x ; (vdc_set_mode@stack + 0)
389a : ca __ __ DEX
389b : 10 f8 __ BPL $3895 ; (vdc_set_mode.s1000 + 2)
389d : 38 __ __ SEC
389e : a5 23 __ LDA SP + 0 
38a0 : e9 08 __ SBC #$08
38a2 : 85 23 __ STA SP + 0 
38a4 : b0 02 __ BCS $38a8 ; (vdc_set_mode.s0 + 0)
38a6 : c6 24 __ DEC SP + 1 
.s0:
38a8 : a9 00 __ LDA #$00
38aa : 85 4f __ STA T0 + 0 
38ac : 38 __ __ SEC
38ad : e5 16 __ SBC P9 ; (mode + 0)
38af : 29 20 __ AND #$20
38b1 : 85 50 __ STA T2 + 0 
38b3 : aa __ __ TAX
38b4 : 18 __ __ CLC
38b5 : 69 95 __ ADC #$95
38b7 : 85 53 __ STA T3 + 0 
38b9 : a9 42 __ LDA #$42
38bb : 69 00 __ ADC #$00
38bd : 85 54 __ STA T3 + 1 
38bf : bd 99 42 LDA $4299,x ; (vdc_modes + 4)
38c2 : f0 0a __ BEQ $38ce ; (vdc_set_mode.s3 + 0)
.s4:
38c4 : ad e5 42 LDA $42e5 ; (vdc_state + 0)
38c7 : c9 10 __ CMP #$10
38c9 : d0 03 __ BNE $38ce ; (vdc_set_mode.s3 + 0)
38cb : 4c 50 3b JMP $3b50 ; (vdc_set_mode.s1001 + 0)
.s3:
38ce : a0 00 __ LDY #$00
38d0 : b1 53 __ LDA (T3 + 0),y 
38d2 : 8d e8 42 STA $42e8 ; (vdc_state + 3)
38d5 : c8 __ __ INY
38d6 : b1 53 __ LDA (T3 + 0),y 
38d8 : 8d e9 42 STA $42e9 ; (vdc_state + 4)
38db : c8 __ __ INY
38dc : b1 53 __ LDA (T3 + 0),y 
38de : 8d ea 42 STA $42ea ; (vdc_state + 5)
38e1 : c8 __ __ INY
38e2 : b1 53 __ LDA (T3 + 0),y 
38e4 : 8d eb 42 STA $42eb ; (vdc_state + 6)
38e7 : a0 09 __ LDY #$09
38e9 : b1 53 __ LDA (T3 + 0),y 
38eb : 8d f1 42 STA $42f1 ; (vdc_state + 12)
38ee : c8 __ __ INY
38ef : b1 53 __ LDA (T3 + 0),y 
38f1 : 8d f2 42 STA $42f2 ; (vdc_state + 13)
38f4 : c8 __ __ INY
38f5 : b1 53 __ LDA (T3 + 0),y 
38f7 : 8d f3 42 STA $42f3 ; (vdc_state + 14)
38fa : c8 __ __ INY
38fb : b1 53 __ LDA (T3 + 0),y 
38fd : 8d f4 42 STA $42f4 ; (vdc_state + 15)
3900 : c8 __ __ INY
3901 : b1 53 __ LDA (T3 + 0),y 
3903 : 8d f5 42 STA $42f5 ; (vdc_state + 16)
3906 : c8 __ __ INY
3907 : b1 53 __ LDA (T3 + 0),y 
3909 : 8d f6 42 STA $42f6 ; (vdc_state + 17)
390c : c8 __ __ INY
390d : b1 53 __ LDA (T3 + 0),y 
390f : 8d f7 42 STA $42f7 ; (vdc_state + 18)
3912 : c8 __ __ INY
3913 : b1 53 __ LDA (T3 + 0),y 
3915 : 8d f8 42 STA $42f8 ; (vdc_state + 19)
3918 : c8 __ __ INY
3919 : b1 53 __ LDA (T3 + 0),y 
391b : 8d f9 42 STA $42f9 ; (vdc_state + 20)
391e : c8 __ __ INY
391f : b1 53 __ LDA (T3 + 0),y 
3921 : 8d fa 42 STA $42fa ; (vdc_state + 21)
3924 : a0 05 __ LDY #$05
3926 : b1 53 __ LDA (T3 + 0),y 
3928 : 85 55 __ STA T4 + 0 
392a : c8 __ __ INY
392b : b1 53 __ LDA (T3 + 0),y 
392d : 8d ee 42 STA $42ee ; (vdc_state + 9)
3930 : 85 44 __ STA T6 + 0 
3932 : a5 55 __ LDA T4 + 0 
3934 : 8d ed 42 STA $42ed ; (vdc_state + 8)
3937 : c8 __ __ INY
3938 : b1 53 __ LDA (T3 + 0),y 
393a : 85 57 __ STA T5 + 0 
393c : c8 __ __ INY
393d : b1 53 __ LDA (T3 + 0),y 
393f : 8d f0 42 STA $42f0 ; (vdc_state + 11)
3942 : a8 __ __ TAY
3943 : a5 57 __ LDA T5 + 0 
3945 : 8d ef 42 STA $42ef ; (vdc_state + 10)
3948 : a9 0c __ LDA #$0c
394a : 8d 00 d6 STA $d600 
.l1515:
394d : 2c 00 d6 BIT $d600 
3950 : 10 fb __ BPL $394d ; (vdc_set_mode.l1515 + 0)
.s11:
3952 : a5 44 __ LDA T6 + 0 
3954 : 8d 01 d6 STA $d601 
3957 : a9 0d __ LDA #$0d
3959 : 8d 00 d6 STA $d600 
.l1517:
395c : 2c 00 d6 BIT $d600 
395f : 10 fb __ BPL $395c ; (vdc_set_mode.l1517 + 0)
.s16:
3961 : a5 55 __ LDA T4 + 0 
3963 : 8d 01 d6 STA $d601 
3966 : a9 14 __ LDA #$14
3968 : 8d 00 d6 STA $d600 
.l1519:
396b : 2c 00 d6 BIT $d600 
396e : 10 fb __ BPL $396b ; (vdc_set_mode.l1519 + 0)
.s21:
3970 : 8c 01 d6 STY $d601 
3973 : a9 15 __ LDA #$15
3975 : 8d 00 d6 STA $d600 
.l1521:
3978 : 2c 00 d6 BIT $d600 
397b : 10 fb __ BPL $3978 ; (vdc_set_mode.l1521 + 0)
.s26:
397d : a5 57 __ LDA T5 + 0 
397f : 8d 01 d6 STA $d601 
3982 : bd a3 42 LDA $42a3,x ; (vdc_modes + 14)
3985 : 85 56 __ STA T4 + 1 
3987 : a9 1c __ LDA #$1c
3989 : 8d 00 d6 STA $d600 
.l1523:
398c : 2c 00 d6 BIT $d600 
398f : 10 fb __ BPL $398c ; (vdc_set_mode.l1523 + 0)
.s32:
3991 : ad 01 d6 LDA $d601 
3994 : 29 1f __ AND #$1f
3996 : 85 57 __ STA T5 + 0 
3998 : a9 2f __ LDA #$2f
399a : a0 02 __ LDY #$02
399c : 91 23 __ STA (SP + 0),y 
399e : a9 3d __ LDA #$3d
39a0 : c8 __ __ INY
39a1 : 91 23 __ STA (SP + 0),y 
39a3 : a9 1c __ LDA #$1c
39a5 : 8d 00 d6 STA $d600 
.l1525:
39a8 : 2c 00 d6 BIT $d600 
39ab : 10 fb __ BPL $39a8 ; (vdc_set_mode.l1525 + 0)
.s39:
39ad : ad 01 d6 LDA $d601 
39b0 : a0 04 __ LDY #$04
39b2 : 91 23 __ STA (SP + 0),y 
39b4 : a9 00 __ LDA #$00
39b6 : c8 __ __ INY
39b7 : 91 23 __ STA (SP + 0),y 
39b9 : a5 57 __ LDA T5 + 0 
39bb : c8 __ __ INY
39bc : 91 23 __ STA (SP + 0),y 
39be : a9 00 __ LDA #$00
39c0 : c8 __ __ INY
39c1 : 91 23 __ STA (SP + 0),y 
39c3 : 20 59 2f JSR $2f59 ; (printf.s1000 + 0)
39c6 : a9 1c __ LDA #$1c
39c8 : 8d 00 d6 STA $d600 
39cb : a5 56 __ LDA T4 + 1 
39cd : 29 e0 __ AND #$e0
39cf : 18 __ __ CLC
39d0 : 65 57 __ ADC T5 + 0 
.l1527:
39d2 : 2c 00 d6 BIT $d600 
39d5 : 10 fb __ BPL $39d2 ; (vdc_set_mode.l1527 + 0)
.s46:
39d7 : 8d 01 d6 STA $d601 
39da : 18 __ __ CLC
39db : a9 a8 __ LDA #$a8
39dd : 65 50 __ ADC T2 + 0 
39df : 85 50 __ STA T2 + 0 
39e1 : a9 42 __ LDA #$42
39e3 : 69 00 __ ADC #$00
39e5 : 85 51 __ STA T2 + 1 
.l47:
39e7 : a4 4f __ LDY T0 + 0 
39e9 : b1 50 __ LDA (T2 + 0),y 
39eb : 85 46 __ STA T7 + 0 
39ed : c8 __ __ INY
39ee : b1 50 __ LDA (T2 + 0),y 
39f0 : aa __ __ TAX
39f1 : a5 46 __ LDA T7 + 0 
39f3 : 8d 00 d6 STA $d600 
39f6 : c8 __ __ INY
39f7 : 84 4f __ STY T0 + 0 
.l1529:
39f9 : 2c 00 d6 BIT $d600 
39fc : 10 fb __ BPL $39f9 ; (vdc_set_mode.l1529 + 0)
.s53:
39fe : 8e 01 d6 STX $d601 
3a01 : 18 __ __ CLC
3a02 : a5 53 __ LDA T3 + 0 
3a04 : 65 4f __ ADC T0 + 0 
3a06 : 85 55 __ STA T4 + 0 
3a08 : a5 54 __ LDA T3 + 1 
3a0a : 69 00 __ ADC #$00
3a0c : 85 56 __ STA T4 + 1 
3a0e : a0 13 __ LDY #$13
3a10 : b1 55 __ LDA (T4 + 0),y 
3a12 : c9 ff __ CMP #$ff
3a14 : d0 d1 __ BNE $39e7 ; (vdc_set_mode.l47 + 0)
.s48:
3a16 : a0 04 __ LDY #$04
3a18 : b1 53 __ LDA (T3 + 0),y 
3a1a : f0 05 __ BEQ $3a21 ; (vdc_set_mode.s55 + 0)
.s57:
3a1c : ad e6 42 LDA $42e6 ; (vdc_state + 1)
3a1f : f0 11 __ BEQ $3a32 ; (vdc_set_mode.s54 + 0)
.s55:
3a21 : a9 00 __ LDA #$00
3a23 : 85 4f __ STA T0 + 0 
3a25 : ad e8 42 LDA $42e8 ; (vdc_state + 3)
3a28 : 85 50 __ STA T2 + 0 
3a2a : ad ea 42 LDA $42ea ; (vdc_state + 5)
3a2d : 85 53 __ STA T3 + 0 
3a2f : 4c 46 3c JMP $3c46 ; (vdc_set_mode.l236 + 0)
.s54:
3a32 : ad e5 42 LDA $42e5 ; (vdc_state + 0)
3a35 : c9 10 __ CMP #$10
3a37 : d0 03 __ BNE $3a3c ; (vdc_set_mode.s62 + 0)
3a39 : 4c 50 3b JMP $3b50 ; (vdc_set_mode.s1001 + 0)
.s62:
3a3c : ad e6 42 LDA $42e6 ; (vdc_state + 1)
3a3f : f0 03 __ BEQ $3a44 ; (vdc_set_mode.s61 + 0)
3a41 : 4c 50 3b JMP $3b50 ; (vdc_set_mode.s1001 + 0)
.s61:
3a44 : a9 22 __ LDA #$22
3a46 : 8d 00 d6 STA $d600 
.l1559:
3a49 : 2c 00 d6 BIT $d600 
3a4c : 10 fb __ BPL $3a49 ; (vdc_set_mode.l1559 + 0)
.s69:
3a4e : a9 80 __ LDA #$80
3a50 : 8d 01 d6 STA $d601 
3a53 : a0 ff __ LDY #$ff
3a55 : a2 00 __ LDX #$00
.l72:
3a57 : a9 12 __ LDA #$12
3a59 : 8d 00 d6 STA $d600 
.l1561:
3a5c : 2c 00 d6 BIT $d600 
3a5f : 10 fb __ BPL $3a5c ; (vdc_set_mode.l1561 + 0)
.s81:
3a61 : 8e 01 d6 STX $d601 
3a64 : a9 13 __ LDA #$13
3a66 : 8d 00 d6 STA $d600 
.l1563:
3a69 : 2c 00 d6 BIT $d600 
3a6c : 10 fb __ BPL $3a69 ; (vdc_set_mode.l1563 + 0)
.s86:
3a6e : a9 00 __ LDA #$00
3a70 : 8d 01 d6 STA $d601 
3a73 : a9 1f __ LDA #$1f
3a75 : 8d 00 d6 STA $d600 
.l1565:
3a78 : 2c 00 d6 BIT $d600 
3a7b : 10 fb __ BPL $3a78 ; (vdc_set_mode.l1565 + 0)
.s90:
3a7d : a9 00 __ LDA #$00
3a7f : 8d 01 d6 STA $d601 
3a82 : a9 18 __ LDA #$18
3a84 : 8d 00 d6 STA $d600 
.l1567:
3a87 : 2c 00 d6 BIT $d600 
3a8a : 10 fb __ BPL $3a87 ; (vdc_set_mode.l1567 + 0)
.s96:
3a8c : ad 01 d6 LDA $d601 
3a8f : 29 7f __ AND #$7f
3a91 : 85 53 __ STA T3 + 0 
3a93 : a9 18 __ LDA #$18
3a95 : 8d 00 d6 STA $d600 
.l1569:
3a98 : 2c 00 d6 BIT $d600 
3a9b : 10 fb __ BPL $3a98 ; (vdc_set_mode.l1569 + 0)
.s102:
3a9d : a5 53 __ LDA T3 + 0 
3a9f : 8d 01 d6 STA $d601 
3aa2 : a9 1e __ LDA #$1e
3aa4 : 8d 00 d6 STA $d600 
.l1571:
3aa7 : 2c 00 d6 BIT $d600 
3aaa : 10 fb __ BPL $3aa7 ; (vdc_set_mode.l1571 + 0)
.s107:
3aac : a9 ff __ LDA #$ff
3aae : 8d 01 d6 STA $d601 
3ab1 : e8 __ __ INX
3ab2 : 88 __ __ DEY
3ab3 : d0 a2 __ BNE $3a57 ; (vdc_set_mode.l72 + 0)
.s74:
3ab5 : a9 12 __ LDA #$12
3ab7 : 8d 00 d6 STA $d600 
.l1574:
3aba : 2c 00 d6 BIT $d600 
3abd : 10 fb __ BPL $3aba ; (vdc_set_mode.l1574 + 0)
.s114:
3abf : 8e 01 d6 STX $d601 
3ac2 : a9 13 __ LDA #$13
3ac4 : 8d 00 d6 STA $d600 
.l1576:
3ac7 : 2c 00 d6 BIT $d600 
3aca : 10 fb __ BPL $3ac7 ; (vdc_set_mode.l1576 + 0)
.s119:
3acc : 8c 01 d6 STY $d601 
3acf : a9 1f __ LDA #$1f
3ad1 : 8d 00 d6 STA $d600 
.l1578:
3ad4 : 2c 00 d6 BIT $d600 
3ad7 : 10 fb __ BPL $3ad4 ; (vdc_set_mode.l1578 + 0)
.s123:
3ad9 : 8c 01 d6 STY $d601 
3adc : a9 18 __ LDA #$18
3ade : 8d 00 d6 STA $d600 
.l1580:
3ae1 : 2c 00 d6 BIT $d600 
3ae4 : 10 fb __ BPL $3ae1 ; (vdc_set_mode.l1580 + 0)
.s129:
3ae6 : ad 01 d6 LDA $d601 
3ae9 : 29 7f __ AND #$7f
3aeb : aa __ __ TAX
3aec : a9 18 __ LDA #$18
3aee : 8d 00 d6 STA $d600 
.l1582:
3af1 : 2c 00 d6 BIT $d600 
3af4 : 10 fb __ BPL $3af1 ; (vdc_set_mode.l1582 + 0)
.s135:
3af6 : 8e 01 d6 STX $d601 
3af9 : a9 1e __ LDA #$1e
3afb : 8d 00 d6 STA $d600 
.l1584:
3afe : 2c 00 d6 BIT $d600 
3b01 : 10 fb __ BPL $3afe ; (vdc_set_mode.l1584 + 0)
.s140:
3b03 : a9 ff __ LDA #$ff
3b05 : 8d 01 d6 STA $d601 
3b08 : a9 1c __ LDA #$1c
3b0a : 8d 00 d6 STA $d600 
.l1586:
3b0d : 2c 00 d6 BIT $d600 
3b10 : 10 fb __ BPL $3b0d ; (vdc_set_mode.l1586 + 0)
.s146:
3b12 : ad 01 d6 LDA $d601 
3b15 : 09 10 __ ORA #$10
3b17 : aa __ __ TAX
3b18 : a9 1c __ LDA #$1c
3b1a : 8d 00 d6 STA $d600 
.l1588:
3b1d : 2c 00 d6 BIT $d600 
3b20 : 10 fb __ BPL $3b1d ; (vdc_set_mode.l1588 + 0)
.s152:
3b22 : 8e 01 d6 STX $d601 
3b25 : 20 37 3d JSR $3d37 ; (vdc_restore_charsets.s0 + 0)
3b28 : a9 00 __ LDA #$00
3b2a : 85 4f __ STA T0 + 0 
3b2c : ad e8 42 LDA $42e8 ; (vdc_state + 3)
3b2f : 85 50 __ STA T2 + 0 
3b31 : ad ea 42 LDA $42ea ; (vdc_state + 5)
3b34 : 85 53 __ STA T3 + 0 
.l155:
3b36 : a5 4f __ LDA T0 + 0 
3b38 : c5 53 __ CMP T3 + 0 
3b3a : 90 2a __ BCC $3b66 ; (vdc_set_mode.s156 + 0)
.s153:
3b3c : a9 22 __ LDA #$22
3b3e : 8d 00 d6 STA $d600 
.l1614:
3b41 : 2c 00 d6 BIT $d600 
3b44 : 10 fb __ BPL $3b41 ; (vdc_set_mode.l1614 + 0)
.s233:
3b46 : a9 7d __ LDA #$7d
3b48 : 8d 01 d6 STA $d601 
3b4b : a9 01 __ LDA #$01
3b4d : 8d e6 42 STA $42e6 ; (vdc_state + 1)
.s1001:
3b50 : 18 __ __ CLC
3b51 : a5 23 __ LDA SP + 0 
3b53 : 69 08 __ ADC #$08
3b55 : 85 23 __ STA SP + 0 
3b57 : 90 02 __ BCC $3b5b ; (vdc_set_mode.s1001 + 11)
3b59 : e6 24 __ INC SP + 1 
3b5b : a2 04 __ LDX #$04
3b5d : bd ac bf LDA $bfac,x ; (vdc_set_mode@stack + 0)
3b60 : 95 53 __ STA T3 + 0,x 
3b62 : ca __ __ DEX
3b63 : 10 f8 __ BPL $3b5d ; (vdc_set_mode.s1001 + 13)
3b65 : 60 __ __ RTS
.s156:
3b66 : ad e8 42 LDA $42e8 ; (vdc_state + 3)
3b69 : 85 1b __ STA ACCU + 0 
3b6b : ad e9 42 LDA $42e9 ; (vdc_state + 4)
3b6e : 85 1c __ STA ACCU + 1 
3b70 : ad ec 42 LDA $42ec ; (vdc_state + 7)
3b73 : 85 43 __ STA T1 + 0 
3b75 : a9 12 __ LDA #$12
3b77 : 8d 00 d6 STA $d600 
3b7a : a6 50 __ LDX T2 + 0 
3b7c : ca __ __ DEX
3b7d : 86 44 __ STX T6 + 0 
3b7f : a5 4f __ LDA T0 + 0 
3b81 : 20 f8 40 JSR $40f8 ; (mul16by8 + 0)
3b84 : 18 __ __ CLC
3b85 : a5 05 __ LDA WORK + 2 
3b87 : 6d ed 42 ADC $42ed ; (vdc_state + 8)
3b8a : aa __ __ TAX
3b8b : a5 06 __ LDA WORK + 3 
3b8d : 6d ee 42 ADC $42ee ; (vdc_state + 9)
.l1590:
3b90 : 2c 00 d6 BIT $d600 
3b93 : 10 fb __ BPL $3b90 ; (vdc_set_mode.l1590 + 0)
.s168:
3b95 : 8d 01 d6 STA $d601 
3b98 : a9 13 __ LDA #$13
3b9a : 8d 00 d6 STA $d600 
.l1592:
3b9d : 2c 00 d6 BIT $d600 
3ba0 : 10 fb __ BPL $3b9d ; (vdc_set_mode.l1592 + 0)
.s173:
3ba2 : 8e 01 d6 STX $d601 
3ba5 : a9 1f __ LDA #$1f
3ba7 : 8d 00 d6 STA $d600 
.l1594:
3baa : 2c 00 d6 BIT $d600 
3bad : 10 fb __ BPL $3baa ; (vdc_set_mode.l1594 + 0)
.s177:
3baf : a9 20 __ LDA #$20
3bb1 : 8d 01 d6 STA $d601 
3bb4 : a9 18 __ LDA #$18
3bb6 : 8d 00 d6 STA $d600 
.l1596:
3bb9 : 2c 00 d6 BIT $d600 
3bbc : 10 fb __ BPL $3bb9 ; (vdc_set_mode.l1596 + 0)
.s183:
3bbe : ad 01 d6 LDA $d601 
3bc1 : 29 7f __ AND #$7f
3bc3 : aa __ __ TAX
3bc4 : a9 18 __ LDA #$18
3bc6 : 8d 00 d6 STA $d600 
.l1598:
3bc9 : 2c 00 d6 BIT $d600 
3bcc : 10 fb __ BPL $3bc9 ; (vdc_set_mode.l1598 + 0)
.s189:
3bce : 8e 01 d6 STX $d601 
3bd1 : a9 1e __ LDA #$1e
3bd3 : 8d 00 d6 STA $d600 
.l1600:
3bd6 : 2c 00 d6 BIT $d600 
3bd9 : 10 fb __ BPL $3bd6 ; (vdc_set_mode.l1600 + 0)
.s194:
3bdb : a5 44 __ LDA T6 + 0 
3bdd : 8d 01 d6 STA $d601 
3be0 : ad ef 42 LDA $42ef ; (vdc_state + 10)
3be3 : 18 __ __ CLC
3be4 : 65 05 __ ADC WORK + 2 
3be6 : aa __ __ TAX
3be7 : a9 12 __ LDA #$12
3be9 : 8d 00 d6 STA $d600 
3bec : ad f0 42 LDA $42f0 ; (vdc_state + 11)
3bef : 65 06 __ ADC WORK + 3 
.l1602:
3bf1 : 2c 00 d6 BIT $d600 
3bf4 : 10 fb __ BPL $3bf1 ; (vdc_set_mode.l1602 + 0)
.s201:
3bf6 : 8d 01 d6 STA $d601 
3bf9 : a9 13 __ LDA #$13
3bfb : 8d 00 d6 STA $d600 
.l1604:
3bfe : 2c 00 d6 BIT $d600 
3c01 : 10 fb __ BPL $3bfe ; (vdc_set_mode.l1604 + 0)
.s206:
3c03 : 8e 01 d6 STX $d601 
3c06 : a9 1f __ LDA #$1f
3c08 : 8d 00 d6 STA $d600 
.l1606:
3c0b : 2c 00 d6 BIT $d600 
3c0e : 10 fb __ BPL $3c0b ; (vdc_set_mode.l1606 + 0)
.s210:
3c10 : a5 43 __ LDA T1 + 0 
3c12 : 8d 01 d6 STA $d601 
3c15 : a9 18 __ LDA #$18
3c17 : 8d 00 d6 STA $d600 
.l1608:
3c1a : 2c 00 d6 BIT $d600 
3c1d : 10 fb __ BPL $3c1a ; (vdc_set_mode.l1608 + 0)
.s216:
3c1f : ad 01 d6 LDA $d601 
3c22 : 29 7f __ AND #$7f
3c24 : aa __ __ TAX
3c25 : a9 18 __ LDA #$18
3c27 : 8d 00 d6 STA $d600 
.l1610:
3c2a : 2c 00 d6 BIT $d600 
3c2d : 10 fb __ BPL $3c2a ; (vdc_set_mode.l1610 + 0)
.s222:
3c2f : 8e 01 d6 STX $d601 
3c32 : a9 1e __ LDA #$1e
3c34 : 8d 00 d6 STA $d600 
.l1612:
3c37 : 2c 00 d6 BIT $d600 
3c3a : 10 fb __ BPL $3c37 ; (vdc_set_mode.l1612 + 0)
.s227:
3c3c : a5 44 __ LDA T6 + 0 
3c3e : 8d 01 d6 STA $d601 
3c41 : e6 4f __ INC T0 + 0 
3c43 : 4c 36 3b JMP $3b36 ; (vdc_set_mode.l155 + 0)
.l236:
3c46 : a5 4f __ LDA T0 + 0 
3c48 : c5 53 __ CMP T3 + 0 
3c4a : 90 03 __ BCC $3c4f ; (vdc_set_mode.s237 + 0)
3c4c : 4c 50 3b JMP $3b50 ; (vdc_set_mode.s1001 + 0)
.s237:
3c4f : ad e8 42 LDA $42e8 ; (vdc_state + 3)
3c52 : 85 1b __ STA ACCU + 0 
3c54 : ad e9 42 LDA $42e9 ; (vdc_state + 4)
3c57 : 85 1c __ STA ACCU + 1 
3c59 : ad ec 42 LDA $42ec ; (vdc_state + 7)
3c5c : 85 43 __ STA T1 + 0 
3c5e : a9 12 __ LDA #$12
3c60 : 8d 00 d6 STA $d600 
3c63 : a6 50 __ LDX T2 + 0 
3c65 : ca __ __ DEX
3c66 : 86 44 __ STX T6 + 0 
3c68 : a5 4f __ LDA T0 + 0 
3c6a : 20 f8 40 JSR $40f8 ; (mul16by8 + 0)
3c6d : 18 __ __ CLC
3c6e : a5 05 __ LDA WORK + 2 
3c70 : 6d ed 42 ADC $42ed ; (vdc_state + 8)
3c73 : aa __ __ TAX
3c74 : a5 06 __ LDA WORK + 3 
3c76 : 6d ee 42 ADC $42ee ; (vdc_state + 9)
.l1534:
3c79 : 2c 00 d6 BIT $d600 
3c7c : 10 fb __ BPL $3c79 ; (vdc_set_mode.l1534 + 0)
.s249:
3c7e : 8d 01 d6 STA $d601 
3c81 : a9 13 __ LDA #$13
3c83 : 8d 00 d6 STA $d600 
.l1536:
3c86 : 2c 00 d6 BIT $d600 
3c89 : 10 fb __ BPL $3c86 ; (vdc_set_mode.l1536 + 0)
.s254:
3c8b : 8e 01 d6 STX $d601 
3c8e : a9 1f __ LDA #$1f
3c90 : 8d 00 d6 STA $d600 
.l1538:
3c93 : 2c 00 d6 BIT $d600 
3c96 : 10 fb __ BPL $3c93 ; (vdc_set_mode.l1538 + 0)
.s258:
3c98 : a9 20 __ LDA #$20
3c9a : 8d 01 d6 STA $d601 
3c9d : a9 18 __ LDA #$18
3c9f : 8d 00 d6 STA $d600 
.l1540:
3ca2 : 2c 00 d6 BIT $d600 
3ca5 : 10 fb __ BPL $3ca2 ; (vdc_set_mode.l1540 + 0)
.s264:
3ca7 : ad 01 d6 LDA $d601 
3caa : 29 7f __ AND #$7f
3cac : aa __ __ TAX
3cad : a9 18 __ LDA #$18
3caf : 8d 00 d6 STA $d600 
.l1542:
3cb2 : 2c 00 d6 BIT $d600 
3cb5 : 10 fb __ BPL $3cb2 ; (vdc_set_mode.l1542 + 0)
.s270:
3cb7 : 8e 01 d6 STX $d601 
3cba : a9 1e __ LDA #$1e
3cbc : 8d 00 d6 STA $d600 
.l1544:
3cbf : 2c 00 d6 BIT $d600 
3cc2 : 10 fb __ BPL $3cbf ; (vdc_set_mode.l1544 + 0)
.s275:
3cc4 : a5 44 __ LDA T6 + 0 
3cc6 : 8d 01 d6 STA $d601 
3cc9 : ad ef 42 LDA $42ef ; (vdc_state + 10)
3ccc : 18 __ __ CLC
3ccd : 65 05 __ ADC WORK + 2 
3ccf : aa __ __ TAX
3cd0 : a9 12 __ LDA #$12
3cd2 : 8d 00 d6 STA $d600 
3cd5 : ad f0 42 LDA $42f0 ; (vdc_state + 11)
3cd8 : 65 06 __ ADC WORK + 3 
.l1546:
3cda : 2c 00 d6 BIT $d600 
3cdd : 10 fb __ BPL $3cda ; (vdc_set_mode.l1546 + 0)
.s282:
3cdf : 8d 01 d6 STA $d601 
3ce2 : a9 13 __ LDA #$13
3ce4 : 8d 00 d6 STA $d600 
.l1548:
3ce7 : 2c 00 d6 BIT $d600 
3cea : 10 fb __ BPL $3ce7 ; (vdc_set_mode.l1548 + 0)
.s287:
3cec : 8e 01 d6 STX $d601 
3cef : a9 1f __ LDA #$1f
3cf1 : 8d 00 d6 STA $d600 
.l1550:
3cf4 : 2c 00 d6 BIT $d600 
3cf7 : 10 fb __ BPL $3cf4 ; (vdc_set_mode.l1550 + 0)
.s291:
3cf9 : a5 43 __ LDA T1 + 0 
3cfb : 8d 01 d6 STA $d601 
3cfe : a9 18 __ LDA #$18
3d00 : 8d 00 d6 STA $d600 
.l1552:
3d03 : 2c 00 d6 BIT $d600 
3d06 : 10 fb __ BPL $3d03 ; (vdc_set_mode.l1552 + 0)
.s297:
3d08 : ad 01 d6 LDA $d601 
3d0b : 29 7f __ AND #$7f
3d0d : aa __ __ TAX
3d0e : a9 18 __ LDA #$18
3d10 : 8d 00 d6 STA $d600 
.l1554:
3d13 : 2c 00 d6 BIT $d600 
3d16 : 10 fb __ BPL $3d13 ; (vdc_set_mode.l1554 + 0)
.s303:
3d18 : 8e 01 d6 STX $d601 
3d1b : a9 1e __ LDA #$1e
3d1d : 8d 00 d6 STA $d600 
.l1556:
3d20 : 2c 00 d6 BIT $d600 
3d23 : 10 fb __ BPL $3d20 ; (vdc_set_mode.l1556 + 0)
.s308:
3d25 : a5 44 __ LDA T6 + 0 
3d27 : 8d 01 d6 STA $d601 
3d2a : e6 4f __ INC T0 + 0 
3d2c : 4c 46 3c JMP $3c46 ; (vdc_set_mode.l236 + 0)
--------------------------------------------------------------------
3d2f : __ __ __ BYT 25 32 78 20 25 32 78 00                         : %2x %2x.
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
3d37 : 20 62 ff JSR $ff62 
.s1001:
3d3a : 60 __ __ RTS
--------------------------------------------------------------------
3d3b : __ __ __ BYT 0a 0d 57 52 49 54 45 20 42 59 54 45 3a 20 25 32 : ..WRITE BYTE: %2
3d4b : __ __ __ BYT 78 20 52 45 41 44 20 42 59 54 45 3a 20 25 32 78 : x READ BYTE: %2x
3d5b : __ __ __ BYT 0a 00                                           : ..
--------------------------------------------------------------------
3d5d : __ __ __ BYT 57 52 49 54 45 20 57 4f 52 44 3a 20 25 34 78 20 : WRITE WORD: %4x 
3d6d : __ __ __ BYT 52 45 41 44 20 57 4f 52 44 3a 20 25 34 78 0a 00 : READ WORD: %4x..
--------------------------------------------------------------------
3d7d : __ __ __ BYT 6f 53 43 41 52 36 34 20 76 64 63 20 44 45 4d 4f : oSCAR64 vdc DEMO
3d8d : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
3d8e : a2 03 __ LDX #$03
3d90 : b5 53 __ LDA T8 + 0,x 
3d92 : 9d e4 bf STA $bfe4,x ; (buff + 38)
3d95 : ca __ __ DEX
3d96 : 10 f8 __ BPL $3d90 ; (sprintf.s1000 + 2)
.s0:
3d98 : 18 __ __ CLC
3d99 : a5 23 __ LDA SP + 0 
3d9b : 69 06 __ ADC #$06
3d9d : 85 47 __ STA T0 + 0 
3d9f : a5 24 __ LDA SP + 1 
3da1 : 69 00 __ ADC #$00
3da3 : 85 48 __ STA T0 + 1 
3da5 : a9 00 __ LDA #$00
3da7 : 85 43 __ STA T1 + 0 
3da9 : a0 04 __ LDY #$04
3dab : b1 23 __ LDA (SP + 0),y 
3dad : 85 49 __ STA T2 + 0 
3daf : c8 __ __ INY
3db0 : b1 23 __ LDA (SP + 0),y 
3db2 : 85 4a __ STA T2 + 1 
3db4 : a0 02 __ LDY #$02
3db6 : b1 23 __ LDA (SP + 0),y 
3db8 : 85 4b __ STA T3 + 0 
3dba : c8 __ __ INY
3dbb : b1 23 __ LDA (SP + 0),y 
3dbd : 85 4c __ STA T3 + 1 
.l2:
3dbf : a0 00 __ LDY #$00
3dc1 : b1 49 __ LDA (T2 + 0),y 
3dc3 : d0 0f __ BNE $3dd4 ; (sprintf.s3 + 0)
.s4:
3dc5 : a4 43 __ LDY T1 + 0 
3dc7 : 91 4b __ STA (T3 + 0),y 
.s1001:
3dc9 : a2 03 __ LDX #$03
3dcb : bd e4 bf LDA $bfe4,x ; (buff + 38)
3dce : 95 53 __ STA T8 + 0,x 
3dd0 : ca __ __ DEX
3dd1 : 10 f8 __ BPL $3dcb ; (sprintf.s1001 + 2)
3dd3 : 60 __ __ RTS
.s3:
3dd4 : c9 25 __ CMP #$25
3dd6 : f0 22 __ BEQ $3dfa ; (sprintf.s5 + 0)
.s6:
3dd8 : a4 43 __ LDY T1 + 0 
3dda : 91 4b __ STA (T3 + 0),y 
3ddc : e6 49 __ INC T2 + 0 
3dde : d0 02 __ BNE $3de2 ; (sprintf.s1102 + 0)
.s1101:
3de0 : e6 4a __ INC T2 + 1 
.s1102:
3de2 : c8 __ __ INY
3de3 : 84 43 __ STY T1 + 0 
3de5 : 98 __ __ TYA
3de6 : c0 28 __ CPY #$28
3de8 : 90 d5 __ BCC $3dbf ; (sprintf.l2 + 0)
.s111:
3dea : 18 __ __ CLC
3deb : 65 4b __ ADC T3 + 0 
3ded : 85 4b __ STA T3 + 0 
3def : 90 02 __ BCC $3df3 ; (sprintf.s1104 + 0)
.s1103:
3df1 : e6 4c __ INC T3 + 1 
.s1104:
3df3 : a9 00 __ LDA #$00
.s1068:
3df5 : 85 43 __ STA T1 + 0 
3df7 : 4c bf 3d JMP $3dbf ; (sprintf.l2 + 0)
.s5:
3dfa : 8c ec bf STY $bfec ; (buff + 46)
3dfd : 8c ed bf STY $bfed ; (buff + 47)
3e00 : 8c ee bf STY $bfee ; (buff + 48)
3e03 : 8c ef bf STY $bfef ; (buff + 49)
3e06 : a9 0a __ LDA #$0a
3e08 : 8d eb bf STA $bfeb ; (buff + 45)
3e0b : a5 43 __ LDA T1 + 0 
3e0d : f0 0b __ BEQ $3e1a ; (sprintf.s10 + 0)
.s8:
3e0f : 18 __ __ CLC
3e10 : 65 4b __ ADC T3 + 0 
3e12 : 85 4b __ STA T3 + 0 
3e14 : 90 02 __ BCC $3e18 ; (sprintf.s1080 + 0)
.s1079:
3e16 : e6 4c __ INC T3 + 1 
.s1080:
3e18 : 84 43 __ STY T1 + 0 
.s10:
3e1a : a0 01 __ LDY #$01
3e1c : b1 49 __ LDA (T2 + 0),y 
3e1e : aa __ __ TAX
3e1f : a9 20 __ LDA #$20
3e21 : 8d e8 bf STA $bfe8 ; (buff + 42)
3e24 : a9 00 __ LDA #$00
3e26 : 8d e9 bf STA $bfe9 ; (buff + 43)
3e29 : a9 ff __ LDA #$ff
3e2b : 8d ea bf STA $bfea ; (buff + 44)
3e2e : 18 __ __ CLC
3e2f : a5 49 __ LDA T2 + 0 
3e31 : 69 02 __ ADC #$02
.l15:
3e33 : 85 49 __ STA T2 + 0 
3e35 : 90 02 __ BCC $3e39 ; (sprintf.s1082 + 0)
.s1081:
3e37 : e6 4a __ INC T2 + 1 
.s1082:
3e39 : 8a __ __ TXA
3e3a : e0 2b __ CPX #$2b
3e3c : d0 08 __ BNE $3e46 ; (sprintf.s18 + 0)
.s17:
3e3e : a9 01 __ LDA #$01
3e40 : 8d ed bf STA $bfed ; (buff + 47)
3e43 : 4c a7 40 JMP $40a7 ; (sprintf.s260 + 0)
.s18:
3e46 : c9 30 __ CMP #$30
3e48 : d0 06 __ BNE $3e50 ; (sprintf.s21 + 0)
.s20:
3e4a : 8d e8 bf STA $bfe8 ; (buff + 42)
3e4d : 4c a7 40 JMP $40a7 ; (sprintf.s260 + 0)
.s21:
3e50 : e0 23 __ CPX #$23
3e52 : d0 08 __ BNE $3e5c ; (sprintf.s24 + 0)
.s23:
3e54 : a9 01 __ LDA #$01
3e56 : 8d ef bf STA $bfef ; (buff + 49)
3e59 : 4c a7 40 JMP $40a7 ; (sprintf.s260 + 0)
.s24:
3e5c : e0 2d __ CPX #$2d
3e5e : d0 08 __ BNE $3e68 ; (sprintf.s16 + 0)
.s26:
3e60 : a9 01 __ LDA #$01
3e62 : 8d ee bf STA $bfee ; (buff + 48)
3e65 : 4c a7 40 JMP $40a7 ; (sprintf.s260 + 0)
.s16:
3e68 : 85 45 __ STA T4 + 0 
3e6a : e0 30 __ CPX #$30
3e6c : 90 53 __ BCC $3ec1 ; (sprintf.s32 + 0)
.s33:
3e6e : e0 3a __ CPX #$3a
3e70 : b0 4f __ BCS $3ec1 ; (sprintf.s32 + 0)
.s30:
3e72 : a9 00 __ LDA #$00
3e74 : 85 4d __ STA T6 + 0 
3e76 : 85 4e __ STA T6 + 1 
3e78 : e0 3a __ CPX #$3a
3e7a : b0 40 __ BCS $3ebc ; (sprintf.s36 + 0)
.l35:
3e7c : a5 4d __ LDA T6 + 0 
3e7e : 0a __ __ ASL
3e7f : 85 1b __ STA ACCU + 0 
3e81 : a5 4e __ LDA T6 + 1 
3e83 : 2a __ __ ROL
3e84 : 06 1b __ ASL ACCU + 0 
3e86 : 2a __ __ ROL
3e87 : aa __ __ TAX
3e88 : 18 __ __ CLC
3e89 : a5 1b __ LDA ACCU + 0 
3e8b : 65 4d __ ADC T6 + 0 
3e8d : 85 4d __ STA T6 + 0 
3e8f : 8a __ __ TXA
3e90 : 65 4e __ ADC T6 + 1 
3e92 : 06 4d __ ASL T6 + 0 
3e94 : 2a __ __ ROL
3e95 : aa __ __ TAX
3e96 : 18 __ __ CLC
3e97 : a5 4d __ LDA T6 + 0 
3e99 : 65 45 __ ADC T4 + 0 
3e9b : 90 01 __ BCC $3e9e ; (sprintf.s1098 + 0)
.s1097:
3e9d : e8 __ __ INX
.s1098:
3e9e : 38 __ __ SEC
3e9f : e9 30 __ SBC #$30
3ea1 : 85 4d __ STA T6 + 0 
3ea3 : 8a __ __ TXA
3ea4 : e9 00 __ SBC #$00
3ea6 : 85 4e __ STA T6 + 1 
3ea8 : a0 00 __ LDY #$00
3eaa : b1 49 __ LDA (T2 + 0),y 
3eac : 85 45 __ STA T4 + 0 
3eae : e6 49 __ INC T2 + 0 
3eb0 : d0 02 __ BNE $3eb4 ; (sprintf.s1100 + 0)
.s1099:
3eb2 : e6 4a __ INC T2 + 1 
.s1100:
3eb4 : c9 30 __ CMP #$30
3eb6 : 90 04 __ BCC $3ebc ; (sprintf.s36 + 0)
.s37:
3eb8 : c9 3a __ CMP #$3a
3eba : 90 c0 __ BCC $3e7c ; (sprintf.l35 + 0)
.s36:
3ebc : a5 4d __ LDA T6 + 0 
3ebe : 8d e9 bf STA $bfe9 ; (buff + 43)
.s32:
3ec1 : a5 45 __ LDA T4 + 0 
3ec3 : c9 2e __ CMP #$2e
3ec5 : d0 51 __ BNE $3f18 ; (sprintf.s40 + 0)
.s38:
3ec7 : a9 00 __ LDA #$00
3ec9 : 85 4d __ STA T6 + 0 
.l245:
3ecb : 85 4e __ STA T6 + 1 
3ecd : a0 00 __ LDY #$00
3ecf : b1 49 __ LDA (T2 + 0),y 
3ed1 : 85 45 __ STA T4 + 0 
3ed3 : e6 49 __ INC T2 + 0 
3ed5 : d0 02 __ BNE $3ed9 ; (sprintf.s1084 + 0)
.s1083:
3ed7 : e6 4a __ INC T2 + 1 
.s1084:
3ed9 : c9 30 __ CMP #$30
3edb : 90 04 __ BCC $3ee1 ; (sprintf.s43 + 0)
.s44:
3edd : c9 3a __ CMP #$3a
3edf : 90 0a __ BCC $3eeb ; (sprintf.s42 + 0)
.s43:
3ee1 : a5 4d __ LDA T6 + 0 
3ee3 : 8d ea bf STA $bfea ; (buff + 44)
3ee6 : a5 45 __ LDA T4 + 0 
3ee8 : 4c 18 3f JMP $3f18 ; (sprintf.s40 + 0)
.s42:
3eeb : a5 4d __ LDA T6 + 0 
3eed : 0a __ __ ASL
3eee : 85 1b __ STA ACCU + 0 
3ef0 : a5 4e __ LDA T6 + 1 
3ef2 : 2a __ __ ROL
3ef3 : 06 1b __ ASL ACCU + 0 
3ef5 : 2a __ __ ROL
3ef6 : aa __ __ TAX
3ef7 : 18 __ __ CLC
3ef8 : a5 1b __ LDA ACCU + 0 
3efa : 65 4d __ ADC T6 + 0 
3efc : 85 4d __ STA T6 + 0 
3efe : 8a __ __ TXA
3eff : 65 4e __ ADC T6 + 1 
3f01 : 06 4d __ ASL T6 + 0 
3f03 : 2a __ __ ROL
3f04 : aa __ __ TAX
3f05 : 18 __ __ CLC
3f06 : a5 4d __ LDA T6 + 0 
3f08 : 65 45 __ ADC T4 + 0 
3f0a : 90 01 __ BCC $3f0d ; (sprintf.s1096 + 0)
.s1095:
3f0c : e8 __ __ INX
.s1096:
3f0d : 38 __ __ SEC
3f0e : e9 30 __ SBC #$30
3f10 : 85 4d __ STA T6 + 0 
3f12 : 8a __ __ TXA
3f13 : e9 00 __ SBC #$00
3f15 : 4c cb 3e JMP $3ecb ; (sprintf.l245 + 0)
.s40:
3f18 : c9 64 __ CMP #$64
3f1a : f0 04 __ BEQ $3f20 ; (sprintf.s45 + 0)
.s48:
3f1c : c9 44 __ CMP #$44
3f1e : d0 05 __ BNE $3f25 ; (sprintf.s46 + 0)
.s45:
3f20 : a9 01 __ LDA #$01
3f22 : 4c 80 40 JMP $4080 ; (sprintf.s261 + 0)
.s46:
3f25 : c9 75 __ CMP #$75
3f27 : d0 03 __ BNE $3f2c ; (sprintf.s52 + 0)
3f29 : 4c 7e 40 JMP $407e ; (sprintf.s285 + 0)
.s52:
3f2c : c9 55 __ CMP #$55
3f2e : d0 03 __ BNE $3f33 ; (sprintf.s50 + 0)
3f30 : 4c 7e 40 JMP $407e ; (sprintf.s285 + 0)
.s50:
3f33 : c9 78 __ CMP #$78
3f35 : f0 04 __ BEQ $3f3b ; (sprintf.s53 + 0)
.s56:
3f37 : c9 58 __ CMP #$58
3f39 : d0 0d __ BNE $3f48 ; (sprintf.s54 + 0)
.s53:
3f3b : a9 10 __ LDA #$10
3f3d : 8d eb bf STA $bfeb ; (buff + 45)
3f40 : a9 00 __ LDA #$00
3f42 : 8d ec bf STA $bfec ; (buff + 46)
3f45 : 4c 7e 40 JMP $407e ; (sprintf.s285 + 0)
.s54:
3f48 : c9 6c __ CMP #$6c
3f4a : d0 03 __ BNE $3f4f ; (sprintf.s60 + 0)
3f4c : 4c 10 40 JMP $4010 ; (sprintf.s57 + 0)
.s60:
3f4f : c9 4c __ CMP #$4c
3f51 : d0 03 __ BNE $3f56 ; (sprintf.s58 + 0)
3f53 : 4c 10 40 JMP $4010 ; (sprintf.s57 + 0)
.s58:
3f56 : c9 73 __ CMP #$73
3f58 : f0 37 __ BEQ $3f91 ; (sprintf.s73 + 0)
.s76:
3f5a : c9 53 __ CMP #$53
3f5c : f0 33 __ BEQ $3f91 ; (sprintf.s73 + 0)
.s74:
3f5e : c9 63 __ CMP #$63
3f60 : f0 14 __ BEQ $3f76 ; (sprintf.s104 + 0)
.s107:
3f62 : c9 43 __ CMP #$43
3f64 : f0 10 __ BEQ $3f76 ; (sprintf.s104 + 0)
.s105:
3f66 : 09 00 __ ORA #$00
3f68 : d0 03 __ BNE $3f6d ; (sprintf.s108 + 0)
3f6a : 4c bf 3d JMP $3dbf ; (sprintf.l2 + 0)
.s108:
3f6d : a4 43 __ LDY T1 + 0 
3f6f : 91 4b __ STA (T3 + 0),y 
3f71 : e6 43 __ INC T1 + 0 
3f73 : 4c bf 3d JMP $3dbf ; (sprintf.l2 + 0)
.s104:
3f76 : a0 00 __ LDY #$00
3f78 : b1 47 __ LDA (T0 + 0),y 
3f7a : a4 43 __ LDY T1 + 0 
3f7c : 91 4b __ STA (T3 + 0),y 
3f7e : e6 43 __ INC T1 + 0 
.s258:
3f80 : 18 __ __ CLC
3f81 : a5 47 __ LDA T0 + 0 
3f83 : 69 02 __ ADC #$02
3f85 : 85 47 __ STA T0 + 0 
3f87 : b0 03 __ BCS $3f8c ; (sprintf.s1085 + 0)
3f89 : 4c bf 3d JMP $3dbf ; (sprintf.l2 + 0)
.s1085:
3f8c : e6 48 __ INC T0 + 1 
3f8e : 4c bf 3d JMP $3dbf ; (sprintf.l2 + 0)
.s73:
3f91 : a0 00 __ LDY #$00
3f93 : 84 45 __ STY T4 + 0 
3f95 : b1 47 __ LDA (T0 + 0),y 
3f97 : 85 4d __ STA T6 + 0 
3f99 : c8 __ __ INY
3f9a : b1 47 __ LDA (T0 + 0),y 
3f9c : 85 4e __ STA T6 + 1 
3f9e : 18 __ __ CLC
3f9f : a5 47 __ LDA T0 + 0 
3fa1 : 69 02 __ ADC #$02
3fa3 : 85 47 __ STA T0 + 0 
3fa5 : 90 02 __ BCC $3fa9 ; (sprintf.s1092 + 0)
.s1091:
3fa7 : e6 48 __ INC T0 + 1 
.s1092:
3fa9 : ad e9 bf LDA $bfe9 ; (buff + 43)
3fac : f0 0d __ BEQ $3fbb ; (sprintf.s79 + 0)
.s1071:
3fae : a0 00 __ LDY #$00
3fb0 : b1 4d __ LDA (T6 + 0),y 
3fb2 : f0 05 __ BEQ $3fb9 ; (sprintf.s1072 + 0)
.l81:
3fb4 : c8 __ __ INY
3fb5 : b1 4d __ LDA (T6 + 0),y 
3fb7 : d0 fb __ BNE $3fb4 ; (sprintf.l81 + 0)
.s1072:
3fb9 : 84 45 __ STY T4 + 0 
.s79:
3fbb : ad ee bf LDA $bfee ; (buff + 48)
3fbe : d0 19 __ BNE $3fd9 ; (sprintf.l95 + 0)
.s1075:
3fc0 : a6 45 __ LDX T4 + 0 
3fc2 : ec e9 bf CPX $bfe9 ; (buff + 43)
3fc5 : a4 43 __ LDY T1 + 0 
3fc7 : b0 0c __ BCS $3fd5 ; (sprintf.s1076 + 0)
.l87:
3fc9 : ad e8 bf LDA $bfe8 ; (buff + 42)
3fcc : 91 4b __ STA (T3 + 0),y 
3fce : e8 __ __ INX
3fcf : ec e9 bf CPX $bfe9 ; (buff + 43)
3fd2 : c8 __ __ INY
3fd3 : 90 f4 __ BCC $3fc9 ; (sprintf.l87 + 0)
.s1076:
3fd5 : 86 45 __ STX T4 + 0 
3fd7 : 84 43 __ STY T1 + 0 
.l95:
3fd9 : a0 00 __ LDY #$00
3fdb : b1 4d __ LDA (T6 + 0),y 
3fdd : f0 0f __ BEQ $3fee ; (sprintf.s91 + 0)
.s96:
3fdf : a4 43 __ LDY T1 + 0 
3fe1 : 91 4b __ STA (T3 + 0),y 
3fe3 : e6 43 __ INC T1 + 0 
3fe5 : e6 4d __ INC T6 + 0 
3fe7 : d0 f0 __ BNE $3fd9 ; (sprintf.l95 + 0)
.s1093:
3fe9 : e6 4e __ INC T6 + 1 
3feb : 4c d9 3f JMP $3fd9 ; (sprintf.l95 + 0)
.s91:
3fee : ad ee bf LDA $bfee ; (buff + 48)
3ff1 : d0 03 __ BNE $3ff6 ; (sprintf.s1073 + 0)
3ff3 : 4c bf 3d JMP $3dbf ; (sprintf.l2 + 0)
.s1073:
3ff6 : a6 45 __ LDX T4 + 0 
3ff8 : ec e9 bf CPX $bfe9 ; (buff + 43)
3ffb : a4 43 __ LDY T1 + 0 
3ffd : b0 0c __ BCS $400b ; (sprintf.s1074 + 0)
.l102:
3fff : ad e8 bf LDA $bfe8 ; (buff + 42)
4002 : 91 4b __ STA (T3 + 0),y 
4004 : e8 __ __ INX
4005 : ec e9 bf CPX $bfe9 ; (buff + 43)
4008 : c8 __ __ INY
4009 : 90 f4 __ BCC $3fff ; (sprintf.l102 + 0)
.s1074:
400b : 84 43 __ STY T1 + 0 
400d : 4c bf 3d JMP $3dbf ; (sprintf.l2 + 0)
.s57:
4010 : a0 00 __ LDY #$00
4012 : b1 47 __ LDA (T0 + 0),y 
4014 : 85 53 __ STA T8 + 0 
4016 : c8 __ __ INY
4017 : b1 47 __ LDA (T0 + 0),y 
4019 : 85 54 __ STA T8 + 1 
401b : c8 __ __ INY
401c : b1 47 __ LDA (T0 + 0),y 
401e : 85 55 __ STA T8 + 2 
4020 : c8 __ __ INY
4021 : b1 47 __ LDA (T0 + 0),y 
4023 : 85 56 __ STA T8 + 3 
4025 : 18 __ __ CLC
4026 : a5 47 __ LDA T0 + 0 
4028 : 69 04 __ ADC #$04
402a : 85 47 __ STA T0 + 0 
402c : 90 02 __ BCC $4030 ; (sprintf.s1088 + 0)
.s1087:
402e : e6 48 __ INC T0 + 1 
.s1088:
4030 : a0 00 __ LDY #$00
4032 : b1 49 __ LDA (T2 + 0),y 
4034 : aa __ __ TAX
4035 : e6 49 __ INC T2 + 0 
4037 : d0 02 __ BNE $403b ; (sprintf.s1090 + 0)
.s1089:
4039 : e6 4a __ INC T2 + 1 
.s1090:
403b : 8a __ __ TXA
403c : e0 64 __ CPX #$64
403e : f0 04 __ BEQ $4044 ; (sprintf.s61 + 0)
.s64:
4040 : c9 44 __ CMP #$44
4042 : d0 04 __ BNE $4048 ; (sprintf.s62 + 0)
.s61:
4044 : a9 01 __ LDA #$01
4046 : d0 1c __ BNE $4064 ; (sprintf.s259 + 0)
.s62:
4048 : c9 75 __ CMP #$75
404a : f0 17 __ BEQ $4063 ; (sprintf.s284 + 0)
.s68:
404c : c9 55 __ CMP #$55
404e : f0 13 __ BEQ $4063 ; (sprintf.s284 + 0)
.s66:
4050 : c9 78 __ CMP #$78
4052 : f0 07 __ BEQ $405b ; (sprintf.s69 + 0)
.s72:
4054 : c9 58 __ CMP #$58
4056 : f0 03 __ BEQ $405b ; (sprintf.s69 + 0)
4058 : 4c bf 3d JMP $3dbf ; (sprintf.l2 + 0)
.s69:
405b : 8c ec bf STY $bfec ; (buff + 46)
405e : a9 10 __ LDA #$10
4060 : 8d eb bf STA $bfeb ; (buff + 45)
.s284:
4063 : 98 __ __ TYA
.s259:
4064 : 85 15 __ STA P8 
4066 : a5 4b __ LDA T3 + 0 
4068 : 85 0f __ STA P2 ; (fmt + 0)
406a : a5 4c __ LDA T3 + 1 
406c : 85 10 __ STA P3 ; (fmt + 1)
406e : a9 e8 __ LDA #$e8
4070 : 85 0d __ STA P0 ; (str + 0)
4072 : a9 bf __ LDA #$bf
4074 : 85 0e __ STA P1 ; (str + 1)
4076 : 20 33 34 JSR $3433 ; (nforml@proxy + 0)
4079 : a5 1b __ LDA ACCU + 0 
407b : 4c f5 3d JMP $3df5 ; (sprintf.s1068 + 0)
.s285:
407e : a9 00 __ LDA #$00
.s261:
4080 : 85 13 __ STA P6 
4082 : a5 4b __ LDA T3 + 0 
4084 : 85 0f __ STA P2 ; (fmt + 0)
4086 : a5 4c __ LDA T3 + 1 
4088 : 85 10 __ STA P3 ; (fmt + 1)
408a : a0 00 __ LDY #$00
408c : b1 47 __ LDA (T0 + 0),y 
408e : 85 11 __ STA P4 ; (fmt + 2)
4090 : c8 __ __ INY
4091 : b1 47 __ LDA (T0 + 0),y 
4093 : 85 12 __ STA P5 ; (fmt + 3)
4095 : a9 e8 __ LDA #$e8
4097 : 85 0d __ STA P0 ; (str + 0)
4099 : a9 bf __ LDA #$bf
409b : 85 0e __ STA P1 ; (str + 1)
409d : 20 fe 32 JSR $32fe ; (nformi.s0 + 0)
40a0 : a5 1b __ LDA ACCU + 0 
40a2 : 85 43 __ STA T1 + 0 
40a4 : 4c 80 3f JMP $3f80 ; (sprintf.s258 + 0)
.s260:
40a7 : a0 00 __ LDY #$00
40a9 : b1 49 __ LDA (T2 + 0),y 
40ab : aa __ __ TAX
40ac : 18 __ __ CLC
40ad : a5 49 __ LDA T2 + 0 
40af : 69 01 __ ADC #$01
40b1 : 4c 33 3e JMP $3e33 ; (sprintf.l15 + 0)
--------------------------------------------------------------------
40b4 : __ __ __ BYT 76 64 63 20 6d 45 4d 4f 52 59 20 64 45 54 45 43 : vdc mEMORY dETEC
40c4 : __ __ __ BYT 54 45 44 3a 20 25 44 20 6b 62 2c 20 53 43 52 45 : TED: %D kb, SCRE
40d4 : __ __ __ BYT 45 4e 20 53 49 5a 45 3a 20 25 44 58 25 44 2c 20 : EN SIZE: %DX%D, 
40e4 : __ __ __ BYT 45 58 54 2e 4d 45 4d 3a 20 25 53 00             : EXT.MEM: %S.
--------------------------------------------------------------------
40f0 : __ __ __ BYT 6f 4e 20 00                                     : oN .
--------------------------------------------------------------------
40f4 : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
mul16by8: ; mul16by8
40f8 : a0 00 __ LDY #$00
40fa : 84 06 __ STY WORK + 3 
40fc : 4a __ __ LSR
40fd : 90 0d __ BCC $410c ; (mul16by8 + 20)
40ff : aa __ __ TAX
4100 : 18 __ __ CLC
4101 : 98 __ __ TYA
4102 : 65 1b __ ADC ACCU + 0 
4104 : a8 __ __ TAY
4105 : a5 06 __ LDA WORK + 3 
4107 : 65 1c __ ADC ACCU + 1 
4109 : 85 06 __ STA WORK + 3 
410b : 8a __ __ TXA
410c : 06 1b __ ASL ACCU + 0 
410e : 26 1c __ ROL ACCU + 1 
4110 : 4a __ __ LSR
4111 : b0 ec __ BCS $40ff ; (mul16by8 + 7)
4113 : d0 f7 __ BNE $410c ; (mul16by8 + 20)
4115 : 84 05 __ STY WORK + 2 
4117 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
4118 : a5 1c __ LDA ACCU + 1 
411a : d0 31 __ BNE $414d ; (divmod + 53)
411c : a5 04 __ LDA WORK + 1 
411e : d0 1e __ BNE $413e ; (divmod + 38)
4120 : 85 06 __ STA WORK + 3 
4122 : a2 04 __ LDX #$04
4124 : 06 1b __ ASL ACCU + 0 
4126 : 2a __ __ ROL
4127 : c5 03 __ CMP WORK + 0 
4129 : 90 02 __ BCC $412d ; (divmod + 21)
412b : e5 03 __ SBC WORK + 0 
412d : 26 1b __ ROL ACCU + 0 
412f : 2a __ __ ROL
4130 : c5 03 __ CMP WORK + 0 
4132 : 90 02 __ BCC $4136 ; (divmod + 30)
4134 : e5 03 __ SBC WORK + 0 
4136 : 26 1b __ ROL ACCU + 0 
4138 : ca __ __ DEX
4139 : d0 eb __ BNE $4126 ; (divmod + 14)
413b : 85 05 __ STA WORK + 2 
413d : 60 __ __ RTS
413e : a5 1b __ LDA ACCU + 0 
4140 : 85 05 __ STA WORK + 2 
4142 : a5 1c __ LDA ACCU + 1 
4144 : 85 06 __ STA WORK + 3 
4146 : a9 00 __ LDA #$00
4148 : 85 1b __ STA ACCU + 0 
414a : 85 1c __ STA ACCU + 1 
414c : 60 __ __ RTS
414d : a5 04 __ LDA WORK + 1 
414f : d0 1f __ BNE $4170 ; (divmod + 88)
4151 : a5 03 __ LDA WORK + 0 
4153 : 30 1b __ BMI $4170 ; (divmod + 88)
4155 : a9 00 __ LDA #$00
4157 : 85 06 __ STA WORK + 3 
4159 : a2 10 __ LDX #$10
415b : 06 1b __ ASL ACCU + 0 
415d : 26 1c __ ROL ACCU + 1 
415f : 2a __ __ ROL
4160 : c5 03 __ CMP WORK + 0 
4162 : 90 02 __ BCC $4166 ; (divmod + 78)
4164 : e5 03 __ SBC WORK + 0 
4166 : 26 1b __ ROL ACCU + 0 
4168 : 26 1c __ ROL ACCU + 1 
416a : ca __ __ DEX
416b : d0 f2 __ BNE $415f ; (divmod + 71)
416d : 85 05 __ STA WORK + 2 
416f : 60 __ __ RTS
4170 : a9 00 __ LDA #$00
4172 : 85 05 __ STA WORK + 2 
4174 : 85 06 __ STA WORK + 3 
4176 : 84 02 __ STY $02 
4178 : a0 10 __ LDY #$10
417a : 18 __ __ CLC
417b : 26 1b __ ROL ACCU + 0 
417d : 26 1c __ ROL ACCU + 1 
417f : 26 05 __ ROL WORK + 2 
4181 : 26 06 __ ROL WORK + 3 
4183 : 38 __ __ SEC
4184 : a5 05 __ LDA WORK + 2 
4186 : e5 03 __ SBC WORK + 0 
4188 : aa __ __ TAX
4189 : a5 06 __ LDA WORK + 3 
418b : e5 04 __ SBC WORK + 1 
418d : 90 04 __ BCC $4193 ; (divmod + 123)
418f : 86 05 __ STX WORK + 2 
4191 : 85 06 __ STA WORK + 3 
4193 : 88 __ __ DEY
4194 : d0 e5 __ BNE $417b ; (divmod + 99)
4196 : 26 1b __ ROL ACCU + 0 
4198 : 26 1c __ ROL ACCU + 1 
419a : a4 02 __ LDY $02 
419c : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
419d : 84 02 __ STY $02 
419f : a0 20 __ LDY #$20
41a1 : a9 00 __ LDA #$00
41a3 : 85 07 __ STA WORK + 4 
41a5 : 85 08 __ STA WORK + 5 
41a7 : 85 09 __ STA WORK + 6 
41a9 : 85 0a __ STA WORK + 7 
41ab : a5 05 __ LDA WORK + 2 
41ad : 05 06 __ ORA WORK + 3 
41af : d0 39 __ BNE $41ea ; (divmod32 + 77)
41b1 : 18 __ __ CLC
41b2 : 26 1b __ ROL ACCU + 0 
41b4 : 26 1c __ ROL ACCU + 1 
41b6 : 26 1d __ ROL ACCU + 2 
41b8 : 26 1e __ ROL ACCU + 3 
41ba : 26 07 __ ROL WORK + 4 
41bc : 26 08 __ ROL WORK + 5 
41be : 90 0c __ BCC $41cc ; (divmod32 + 47)
41c0 : a5 07 __ LDA WORK + 4 
41c2 : e5 03 __ SBC WORK + 0 
41c4 : aa __ __ TAX
41c5 : a5 08 __ LDA WORK + 5 
41c7 : e5 04 __ SBC WORK + 1 
41c9 : 38 __ __ SEC
41ca : b0 0c __ BCS $41d8 ; (divmod32 + 59)
41cc : 38 __ __ SEC
41cd : a5 07 __ LDA WORK + 4 
41cf : e5 03 __ SBC WORK + 0 
41d1 : aa __ __ TAX
41d2 : a5 08 __ LDA WORK + 5 
41d4 : e5 04 __ SBC WORK + 1 
41d6 : 90 04 __ BCC $41dc ; (divmod32 + 63)
41d8 : 86 07 __ STX WORK + 4 
41da : 85 08 __ STA WORK + 5 
41dc : 88 __ __ DEY
41dd : d0 d3 __ BNE $41b2 ; (divmod32 + 21)
41df : 26 1b __ ROL ACCU + 0 
41e1 : 26 1c __ ROL ACCU + 1 
41e3 : 26 1d __ ROL ACCU + 2 
41e5 : 26 1e __ ROL ACCU + 3 
41e7 : a4 02 __ LDY $02 
41e9 : 60 __ __ RTS
41ea : 18 __ __ CLC
41eb : 26 1b __ ROL ACCU + 0 
41ed : 26 1c __ ROL ACCU + 1 
41ef : 26 1d __ ROL ACCU + 2 
41f1 : 26 1e __ ROL ACCU + 3 
41f3 : 26 07 __ ROL WORK + 4 
41f5 : 26 08 __ ROL WORK + 5 
41f7 : 26 09 __ ROL WORK + 6 
41f9 : 26 0a __ ROL WORK + 7 
41fb : a5 07 __ LDA WORK + 4 
41fd : c5 03 __ CMP WORK + 0 
41ff : a5 08 __ LDA WORK + 5 
4201 : e5 04 __ SBC WORK + 1 
4203 : a5 09 __ LDA WORK + 6 
4205 : e5 05 __ SBC WORK + 2 
4207 : a5 0a __ LDA WORK + 7 
4209 : e5 06 __ SBC WORK + 3 
420b : 90 18 __ BCC $4225 ; (divmod32 + 136)
420d : a5 07 __ LDA WORK + 4 
420f : e5 03 __ SBC WORK + 0 
4211 : 85 07 __ STA WORK + 4 
4213 : a5 08 __ LDA WORK + 5 
4215 : e5 04 __ SBC WORK + 1 
4217 : 85 08 __ STA WORK + 5 
4219 : a5 09 __ LDA WORK + 6 
421b : e5 05 __ SBC WORK + 2 
421d : 85 09 __ STA WORK + 6 
421f : a5 0a __ LDA WORK + 7 
4221 : e5 06 __ SBC WORK + 3 
4223 : 85 0a __ STA WORK + 7 
4225 : 88 __ __ DEY
4226 : d0 c3 __ BNE $41eb ; (divmod32 + 78)
4228 : 26 1b __ ROL ACCU + 0 
422a : 26 1c __ ROL ACCU + 1 
422c : 26 1d __ ROL ACCU + 2 
422e : 26 1e __ ROL ACCU + 3 
4230 : a4 02 __ LDY $02 
4232 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
4233 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4234 : __ __ __ BYT 54 48 49 53 20 49 53 20 41 20 54 45 53 54 20 54 : THIS IS A TEST T
4244 : __ __ __ BYT 4f 20 57 52 49 54 45 20 44 41 54 41 20 54 4f 20 : O WRITE DATA TO 
4254 : __ __ __ BYT 54 48 45 20 44 49 53 4b 2e 00 00 00 00 00 00 00 : THE DISK........
4264 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4274 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4284 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4285 : __ __ __ BYT 54 45 53 54 31 00 00 00 00 00 00 00 00 00 00    : TEST1..........
--------------------------------------------------------------------
giocharmap:
4294 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
vdc_modes:
4295 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
42a5 : __ __ __ BYT 30 00 40 00 7f 04 26 06 19 07 20 08 fc 09 e7 ff : 0.@...&... .....
42b5 : __ __ __ BYT 50 00 32 00 01 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
42c5 : __ __ __ BYT 30 00 60 00 80 04 40 06 32 07 3a 08 03 09 07 ff : 0.`...@.2.:.....
--------------------------------------------------------------------
krnio_pstatus:
42d5 : __ __ __ BSS	16
--------------------------------------------------------------------
vdc_state:
42e5 : __ __ __ BSS	22
--------------------------------------------------------------------
linebuffer:
4300 : __ __ __ BSS	81
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
