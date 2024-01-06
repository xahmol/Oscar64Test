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
1c0e : 8e 0a 36 STX $360a ; (spentry + 0)
1c11 : a9 00 __ LDA #$00
1c13 : 85 19 __ STA IP + 0 
1c15 : a9 38 __ LDA #$38
1c17 : 85 1a __ STA IP + 1 
1c19 : 38 __ __ SEC
1c1a : a9 38 __ LDA #$38
1c1c : e9 38 __ SBC #$38
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
360a : __ __ __ BYT 00                                              : .
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
1c90 : a9 1a __ LDA #$1a
1c92 : 8d 00 d6 STA $d600 
1c95 : a9 00 __ LDA #$00
1c97 : 85 4f __ STA T0 + 0 
.l5898:
1c99 : ad 00 d6 LDA $d600 
1c9c : 10 fb __ BPL $1c99 ; (main.l5898 + 0)
.s9:
1c9e : ad 01 d6 LDA $d601 
1ca1 : 29 f0 __ AND #$f0
1ca3 : aa __ __ TAX
1ca4 : a9 1a __ LDA #$1a
1ca6 : 8d 00 d6 STA $d600 
.l5900:
1ca9 : ad 00 d6 LDA $d600 
1cac : 10 fb __ BPL $1ca9 ; (main.l5900 + 0)
.s15:
1cae : 8e 01 d6 STX $d601 
1cb1 : a9 1a __ LDA #$1a
1cb3 : 8d 00 d6 STA $d600 
.l5902:
1cb6 : ad 00 d6 LDA $d600 
1cb9 : 10 fb __ BPL $1cb6 ; (main.l5902 + 0)
.s22:
1cbb : ad 01 d6 LDA $d601 
1cbe : 29 0f __ AND #$0f
1cc0 : 09 d0 __ ORA #$d0
1cc2 : aa __ __ TAX
1cc3 : a9 1a __ LDA #$1a
1cc5 : 8d 00 d6 STA $d600 
.l5904:
1cc8 : ad 00 d6 LDA $d600 
1ccb : 10 fb __ BPL $1cc8 ; (main.l5904 + 0)
.s28:
1ccd : 8e 01 d6 STX $d601 
1cd0 : a9 8d __ LDA #$8d
1cd2 : 8d 0b 36 STA $360b ; (vdc_text_attr + 0)
1cd5 : a9 1c __ LDA #$1c
1cd7 : 8d 00 d6 STA $d600 
.l5906:
1cda : ad 00 d6 LDA $d600 
1cdd : 10 fb __ BPL $1cda ; (main.l5906 + 0)
.s34:
1cdf : ad 01 d6 LDA $d601 
1ce2 : aa __ __ TAX
1ce3 : 09 10 __ ORA #$10
1ce5 : a8 __ __ TAY
1ce6 : a9 1c __ LDA #$1c
1ce8 : 8d 00 d6 STA $d600 
.l5908:
1ceb : ad 00 d6 LDA $d600 
1cee : 10 fb __ BPL $1ceb ; (main.l5908 + 0)
.s41:
1cf0 : 8c 01 d6 STY $d601 
1cf3 : a9 12 __ LDA #$12
1cf5 : 8d 00 d6 STA $d600 
.l5910:
1cf8 : ad 00 d6 LDA $d600 
1cfb : 10 fb __ BPL $1cf8 ; (main.l5910 + 0)
.s48:
1cfd : a9 1f __ LDA #$1f
1cff : 8d 01 d6 STA $d601 
1d02 : a9 13 __ LDA #$13
1d04 : 8d 00 d6 STA $d600 
.l5912:
1d07 : ad 00 d6 LDA $d600 
1d0a : 10 fb __ BPL $1d07 ; (main.l5912 + 0)
.s53:
1d0c : a9 ff __ LDA #$ff
1d0e : 8d 01 d6 STA $d601 
1d11 : a9 1f __ LDA #$1f
1d13 : 8d 00 d6 STA $d600 
.l5914:
1d16 : ad 00 d6 LDA $d600 
1d19 : 10 fb __ BPL $1d16 ; (main.l5914 + 0)
.s57:
1d1b : a9 00 __ LDA #$00
1d1d : 8d 01 d6 STA $d601 
1d20 : a9 12 __ LDA #$12
1d22 : 8d 00 d6 STA $d600 
.l5916:
1d25 : ad 00 d6 LDA $d600 
1d28 : 10 fb __ BPL $1d25 ; (main.l5916 + 0)
.s64:
1d2a : a9 9f __ LDA #$9f
1d2c : 8d 01 d6 STA $d601 
1d2f : a9 13 __ LDA #$13
1d31 : 8d 00 d6 STA $d600 
.l5918:
1d34 : ad 00 d6 LDA $d600 
1d37 : 10 fb __ BPL $1d34 ; (main.l5918 + 0)
.s69:
1d39 : a9 ff __ LDA #$ff
1d3b : 8d 01 d6 STA $d601 
1d3e : a9 1f __ LDA #$1f
1d40 : 8d 00 d6 STA $d600 
.l5920:
1d43 : ad 00 d6 LDA $d600 
1d46 : 10 fb __ BPL $1d43 ; (main.l5920 + 0)
.s73:
1d48 : a9 ff __ LDA #$ff
1d4a : 8d 01 d6 STA $d601 
1d4d : a9 12 __ LDA #$12
1d4f : 8d 00 d6 STA $d600 
.l5922:
1d52 : ad 00 d6 LDA $d600 
1d55 : 10 fb __ BPL $1d52 ; (main.l5922 + 0)
.s80:
1d57 : a9 1f __ LDA #$1f
1d59 : 8d 01 d6 STA $d601 
1d5c : a9 13 __ LDA #$13
1d5e : 8d 00 d6 STA $d600 
.l5924:
1d61 : ad 00 d6 LDA $d600 
1d64 : 10 fb __ BPL $1d61 ; (main.l5924 + 0)
.s85:
1d66 : a9 ff __ LDA #$ff
1d68 : 8d 01 d6 STA $d601 
1d6b : a9 1f __ LDA #$1f
1d6d : 8d 00 d6 STA $d600 
.l5926:
1d70 : ad 00 d6 LDA $d600 
1d73 : 10 fb __ BPL $1d70 ; (main.l5926 + 0)
.s89:
1d75 : ad 01 d6 LDA $d601 
1d78 : f0 04 __ BEQ $1d7e ; (main.s1470 + 0)
.s1471:
1d7a : a9 10 __ LDA #$10
1d7c : d0 02 __ BNE $1d80 ; (main.s1472 + 0)
.s1470:
1d7e : a9 40 __ LDA #$40
.s1472:
1d80 : 8d 0c 36 STA $360c ; (vdc_memsize + 0)
1d83 : a9 1c __ LDA #$1c
1d85 : 8d 00 d6 STA $d600 
.l5929:
1d88 : ad 00 d6 LDA $d600 
1d8b : 10 fb __ BPL $1d88 ; (main.l5929 + 0)
.s96:
1d8d : 8e 01 d6 STX $d601 
1d90 : a9 00 __ LDA #$00
1d92 : 85 43 __ STA T2 + 0 
.l100:
1d94 : a9 12 __ LDA #$12
1d96 : 8d 00 d6 STA $d600 
1d99 : a5 43 __ LDA T2 + 0 
1d9b : 0a __ __ ASL
1d9c : 0a __ __ ASL
1d9d : 65 43 __ ADC T2 + 0 
1d9f : 0a __ __ ASL
1da0 : 0a __ __ ASL
1da1 : 85 44 __ STA T3 + 0 
1da3 : a9 00 __ LDA #$00
1da5 : 2a __ __ ROL
1da6 : 06 44 __ ASL T3 + 0 
1da8 : 2a __ __ ROL
1da9 : 06 44 __ ASL T3 + 0 
1dab : 2a __ __ ROL
1dac : 85 45 __ STA T3 + 1 
1dae : ae 0b 36 LDX $360b ; (vdc_text_attr + 0)
.l5931:
1db1 : ad 00 d6 LDA $d600 
1db4 : 10 fb __ BPL $1db1 ; (main.l5931 + 0)
.s116:
1db6 : a5 45 __ LDA T3 + 1 
1db8 : 8d 01 d6 STA $d601 
1dbb : a9 13 __ LDA #$13
1dbd : 8d 00 d6 STA $d600 
.l5933:
1dc0 : ad 00 d6 LDA $d600 
1dc3 : 10 fb __ BPL $1dc0 ; (main.l5933 + 0)
.s121:
1dc5 : a5 44 __ LDA T3 + 0 
1dc7 : 8d 01 d6 STA $d601 
1dca : a9 1f __ LDA #$1f
1dcc : 8d 00 d6 STA $d600 
.l5935:
1dcf : ad 00 d6 LDA $d600 
1dd2 : 10 fb __ BPL $1dcf ; (main.l5935 + 0)
.s125:
1dd4 : a9 20 __ LDA #$20
1dd6 : 8d 01 d6 STA $d601 
1dd9 : a9 18 __ LDA #$18
1ddb : 8d 00 d6 STA $d600 
.l5937:
1dde : ad 00 d6 LDA $d600 
1de1 : 10 fb __ BPL $1dde ; (main.l5937 + 0)
.s131:
1de3 : ad 01 d6 LDA $d601 
1de6 : 29 7f __ AND #$7f
1de8 : a8 __ __ TAY
1de9 : a9 18 __ LDA #$18
1deb : 8d 00 d6 STA $d600 
.l5939:
1dee : ad 00 d6 LDA $d600 
1df1 : 10 fb __ BPL $1dee ; (main.l5939 + 0)
.s137:
1df3 : 8c 01 d6 STY $d601 
1df6 : a9 1e __ LDA #$1e
1df8 : 8d 00 d6 STA $d600 
.l5941:
1dfb : ad 00 d6 LDA $d600 
1dfe : 10 fb __ BPL $1dfb ; (main.l5941 + 0)
.s142:
1e00 : a9 4f __ LDA #$4f
1e02 : 8d 01 d6 STA $d601 
1e05 : a9 12 __ LDA #$12
1e07 : 8d 00 d6 STA $d600 
1e0a : 18 __ __ CLC
1e0b : a5 45 __ LDA T3 + 1 
1e0d : 69 08 __ ADC #$08
1e0f : a8 __ __ TAY
.l5943:
1e10 : ad 00 d6 LDA $d600 
1e13 : 10 fb __ BPL $1e10 ; (main.l5943 + 0)
.s149:
1e15 : 8c 01 d6 STY $d601 
1e18 : a9 13 __ LDA #$13
1e1a : 8d 00 d6 STA $d600 
.l5945:
1e1d : ad 00 d6 LDA $d600 
1e20 : 10 fb __ BPL $1e1d ; (main.l5945 + 0)
.s154:
1e22 : a5 44 __ LDA T3 + 0 
1e24 : 8d 01 d6 STA $d601 
1e27 : a9 1f __ LDA #$1f
1e29 : 8d 00 d6 STA $d600 
.l5947:
1e2c : ad 00 d6 LDA $d600 
1e2f : 10 fb __ BPL $1e2c ; (main.l5947 + 0)
.s158:
1e31 : 8e 01 d6 STX $d601 
1e34 : a9 18 __ LDA #$18
1e36 : 8d 00 d6 STA $d600 
.l5949:
1e39 : ad 00 d6 LDA $d600 
1e3c : 10 fb __ BPL $1e39 ; (main.l5949 + 0)
.s164:
1e3e : a9 18 __ LDA #$18
1e40 : 8d 00 d6 STA $d600 
1e43 : ad 01 d6 LDA $d601 
1e46 : 29 7f __ AND #$7f
1e48 : aa __ __ TAX
.l5951:
1e49 : ad 00 d6 LDA $d600 
1e4c : 10 fb __ BPL $1e49 ; (main.l5951 + 0)
.s170:
1e4e : 8e 01 d6 STX $d601 
1e51 : a9 1e __ LDA #$1e
1e53 : 8d 00 d6 STA $d600 
.l5953:
1e56 : ad 00 d6 LDA $d600 
1e59 : 10 fb __ BPL $1e56 ; (main.l5953 + 0)
.s175:
1e5b : a9 4f __ LDA #$4f
1e5d : 8d 01 d6 STA $d601 
1e60 : e6 43 __ INC T2 + 0 
1e62 : a5 43 __ LDA T2 + 0 
1e64 : c9 19 __ CMP #$19
1e66 : b0 03 __ BCS $1e6b ; (main.s29 + 0)
1e68 : 4c 94 1d JMP $1d94 ; (main.l100 + 0)
.s29:
1e6b : ad 0c 36 LDA $360c ; (vdc_memsize + 0)
1e6e : c9 40 __ CMP #$40
1e70 : d0 03 __ BNE $1e75 ; (main.s6013 + 0)
1e72 : 4c 35 29 JMP $2935 ; (main.s176 + 0)
.s6013:
1e75 : a5 d7 __ LDA $d7 
1e77 : 30 17 __ BMI $1e90 ; (main.s364 + 0)
.s359:
1e79 : a9 41 __ LDA #$41
1e7b : a0 02 __ LDY #$02
1e7d : 91 23 __ STA (SP + 0),y 
1e7f : a9 31 __ LDA #$31
1e81 : c8 __ __ INY
1e82 : 91 23 __ STA (SP + 0),y 
1e84 : 20 0a 2b JSR $2b0a ; (printf.s1000 + 0)
1e87 : 20 6c 31 JSR $316c ; (getch.s0 + 0)
1e8a : 20 ab 31 JSR $31ab ; (clrscr.s0 + 0)
1e8d : 20 af 31 JSR $31af ; (screen_setmode.s0 + 0)
.s364:
1e90 : a9 01 __ LDA #$01
1e92 : 8d 30 d0 STA $d030 
1e95 : ad 11 d0 LDA $d011 
1e98 : 29 6f __ AND #$6f
1e9a : 8d 11 d0 STA $d011 
1e9d : a9 12 __ LDA #$12
1e9f : 8d 00 d6 STA $d600 
.l6014:
1ea2 : ad 00 d6 LDA $d600 
1ea5 : 10 fb __ BPL $1ea2 ; (main.l6014 + 0)
.s380:
1ea7 : a9 00 __ LDA #$00
1ea9 : 8d 01 d6 STA $d601 
1eac : a9 13 __ LDA #$13
1eae : 8d 00 d6 STA $d600 
.l6016:
1eb1 : ad 00 d6 LDA $d600 
1eb4 : 10 fb __ BPL $1eb1 ; (main.l6016 + 0)
.s385:
1eb6 : a9 00 __ LDA #$00
1eb8 : 8d 01 d6 STA $d601 
1ebb : a9 1f __ LDA #$1f
1ebd : 8d 00 d6 STA $d600 
.l6018:
1ec0 : ad 00 d6 LDA $d600 
1ec3 : 10 fb __ BPL $1ec0 ; (main.l6018 + 0)
.s389:
1ec5 : a9 20 __ LDA #$20
1ec7 : 8d 01 d6 STA $d601 
1eca : a9 18 __ LDA #$18
1ecc : 8d 00 d6 STA $d600 
.l6020:
1ecf : ad 00 d6 LDA $d600 
1ed2 : 10 fb __ BPL $1ecf ; (main.l6020 + 0)
.s395:
1ed4 : ad 01 d6 LDA $d601 
1ed7 : 29 7f __ AND #$7f
1ed9 : aa __ __ TAX
1eda : a9 18 __ LDA #$18
1edc : 8d 00 d6 STA $d600 
.l6022:
1edf : ad 00 d6 LDA $d600 
1ee2 : 10 fb __ BPL $1edf ; (main.l6022 + 0)
.s401:
1ee4 : 8e 01 d6 STX $d601 
1ee7 : a9 1e __ LDA #$1e
1ee9 : 8d 00 d6 STA $d600 
.l6024:
1eec : ad 00 d6 LDA $d600 
1eef : 10 fb __ BPL $1eec ; (main.l6024 + 0)
.s406:
1ef1 : a9 4e __ LDA #$4e
1ef3 : 8d 01 d6 STA $d601 
1ef6 : a9 12 __ LDA #$12
1ef8 : 8d 00 d6 STA $d600 
.l6026:
1efb : ad 00 d6 LDA $d600 
1efe : 10 fb __ BPL $1efb ; (main.l6026 + 0)
.s413:
1f00 : a9 08 __ LDA #$08
1f02 : 8d 01 d6 STA $d601 
1f05 : a9 13 __ LDA #$13
1f07 : 8d 00 d6 STA $d600 
.l6028:
1f0a : ad 00 d6 LDA $d600 
1f0d : 10 fb __ BPL $1f0a ; (main.l6028 + 0)
.s418:
1f0f : a9 00 __ LDA #$00
1f11 : 8d 01 d6 STA $d601 
1f14 : a9 1f __ LDA #$1f
1f16 : 8d 00 d6 STA $d600 
.l6030:
1f19 : ad 00 d6 LDA $d600 
1f1c : 10 fb __ BPL $1f19 ; (main.l6030 + 0)
.s422:
1f1e : a9 c5 __ LDA #$c5
1f20 : 8d 01 d6 STA $d601 
1f23 : a9 18 __ LDA #$18
1f25 : 8d 00 d6 STA $d600 
.l6032:
1f28 : ad 00 d6 LDA $d600 
1f2b : 10 fb __ BPL $1f28 ; (main.l6032 + 0)
.s428:
1f2d : ad 01 d6 LDA $d601 
1f30 : 29 7f __ AND #$7f
1f32 : aa __ __ TAX
1f33 : a9 18 __ LDA #$18
1f35 : 8d 00 d6 STA $d600 
.l6034:
1f38 : ad 00 d6 LDA $d600 
1f3b : 10 fb __ BPL $1f38 ; (main.l6034 + 0)
.s434:
1f3d : 8e 01 d6 STX $d601 
1f40 : a9 1e __ LDA #$1e
1f42 : 8d 00 d6 STA $d600 
.l6036:
1f45 : ad 00 d6 LDA $d600 
1f48 : 10 fb __ BPL $1f45 ; (main.l6036 + 0)
.s439:
1f4a : a9 4e __ LDA #$4e
1f4c : 8d 01 d6 STA $d601 
1f4f : ad 0b 36 LDA $360b ; (vdc_text_attr + 0)
1f52 : 29 f0 __ AND #$f0
1f54 : 09 45 __ ORA #$45
1f56 : 8d 0b 36 STA $360b ; (vdc_text_attr + 0)
1f59 : a2 00 __ LDX #$00
.l1460:
1f5b : bd b8 31 LDA $31b8,x 
1f5e : e8 __ __ INX
1f5f : 09 00 __ ORA #$00
1f61 : d0 f8 __ BNE $1f5b ; (main.l1460 + 0)
.s1461:
1f63 : 86 44 __ STX T3 + 0 
1f65 : a9 12 __ LDA #$12
1f67 : 8d 00 d6 STA $d600 
.l6039:
1f6a : ad 00 d6 LDA $d600 
1f6d : 10 fb __ BPL $1f6a ; (main.l6039 + 0)
.s459:
1f6f : a9 00 __ LDA #$00
1f71 : 8d 01 d6 STA $d601 
1f74 : a9 13 __ LDA #$13
1f76 : 8d 00 d6 STA $d600 
.l6041:
1f79 : ad 00 d6 LDA $d600 
1f7c : 10 fb __ BPL $1f79 ; (main.l6041 + 0)
.s464:
1f7e : a9 00 __ LDA #$00
1f80 : 8d 01 d6 STA $d601 
1f83 : a9 1f __ LDA #$1f
1f85 : 8d 00 d6 STA $d600 
1f88 : 8a __ __ TXA
1f89 : f0 65 __ BEQ $1ff0 ; (main.s469 + 0)
.s1482:
1f8b : a2 00 __ LDX #$00
.l467:
1f8d : bc b7 31 LDY $31b7,x 
1f90 : b9 00 37 LDA $3700,y ; (ascToPetTable + 0)
1f93 : c9 20 __ CMP #$20
1f95 : b0 05 __ BCS $1f9c ; (main.s473 + 0)
.s472:
1f97 : 69 80 __ ADC #$80
1f99 : 4c e2 1f JMP $1fe2 ; (main.s1464 + 0)
.s473:
1f9c : a8 __ __ TAY
1f9d : c9 40 __ CMP #$40
1f9f : 90 04 __ BCC $1fa5 ; (main.s476 + 0)
.s478:
1fa1 : c9 60 __ CMP #$60
1fa3 : 90 23 __ BCC $1fc8 ; (main.s475 + 0)
.s476:
1fa5 : c9 60 __ CMP #$60
1fa7 : 90 0a __ BCC $1fb3 ; (main.s480 + 0)
.s482:
1fa9 : 09 00 __ ORA #$00
1fab : 30 06 __ BMI $1fb3 ; (main.s480 + 0)
.s479:
1fad : 38 __ __ SEC
1fae : e9 20 __ SBC #$20
1fb0 : 4c e2 1f JMP $1fe2 ; (main.s1464 + 0)
.s480:
1fb3 : c9 80 __ CMP #$80
1fb5 : 90 09 __ BCC $1fc0 ; (main.s484 + 0)
.s486:
1fb7 : c9 a0 __ CMP #$a0
1fb9 : b0 05 __ BCS $1fc0 ; (main.s484 + 0)
.s483:
1fbb : 69 40 __ ADC #$40
1fbd : 4c e2 1f JMP $1fe2 ; (main.s1464 + 0)
.s484:
1fc0 : c9 a0 __ CMP #$a0
1fc2 : 90 0a __ BCC $1fce ; (main.s488 + 0)
.s490:
1fc4 : c9 c0 __ CMP #$c0
1fc6 : b0 06 __ BCS $1fce ; (main.s488 + 0)
.s475:
1fc8 : 38 __ __ SEC
1fc9 : e9 40 __ SBC #$40
1fcb : 4c e2 1f JMP $1fe2 ; (main.s1464 + 0)
.s488:
1fce : c9 c0 __ CMP #$c0
1fd0 : 90 0a __ BCC $1fdc ; (main.s492 + 0)
.s494:
1fd2 : c9 ff __ CMP #$ff
1fd4 : b0 06 __ BCS $1fdc ; (main.s492 + 0)
.s491:
1fd6 : 38 __ __ SEC
1fd7 : e9 80 __ SBC #$80
1fd9 : 4c e2 1f JMP $1fe2 ; (main.s1464 + 0)
.s492:
1fdc : c9 ff __ CMP #$ff
1fde : d0 03 __ BNE $1fe3 ; (main.l6045 + 0)
.s495:
1fe0 : a9 5e __ LDA #$5e
.s1464:
1fe2 : a8 __ __ TAY
.l6045:
1fe3 : ad 00 d6 LDA $d600 
1fe6 : 10 fb __ BPL $1fe3 ; (main.l6045 + 0)
.s500:
1fe8 : 8c 01 d6 STY $d601 
1feb : e8 __ __ INX
1fec : e4 44 __ CPX T3 + 0 
1fee : 90 9d __ BCC $1f8d ; (main.l467 + 0)
.s469:
1ff0 : a9 12 __ LDA #$12
1ff2 : 8d 00 d6 STA $d600 
1ff5 : c6 44 __ DEC T3 + 0 
1ff7 : ae 0b 36 LDX $360b ; (vdc_text_attr + 0)
.l6048:
1ffa : ad 00 d6 LDA $d600 
1ffd : 10 fb __ BPL $1ffa ; (main.l6048 + 0)
.s507:
1fff : a9 08 __ LDA #$08
2001 : 8d 01 d6 STA $d601 
2004 : a9 13 __ LDA #$13
2006 : 8d 00 d6 STA $d600 
.l6050:
2009 : ad 00 d6 LDA $d600 
200c : 10 fb __ BPL $2009 ; (main.l6050 + 0)
.s512:
200e : a9 00 __ LDA #$00
2010 : 8d 01 d6 STA $d601 
2013 : a9 1f __ LDA #$1f
2015 : 8d 00 d6 STA $d600 
.l6052:
2018 : ad 00 d6 LDA $d600 
201b : 10 fb __ BPL $2018 ; (main.l6052 + 0)
.s516:
201d : 8e 01 d6 STX $d601 
2020 : a9 18 __ LDA #$18
2022 : 8d 00 d6 STA $d600 
.l6054:
2025 : ad 00 d6 LDA $d600 
2028 : 10 fb __ BPL $2025 ; (main.l6054 + 0)
.s522:
202a : ad 01 d6 LDA $d601 
202d : 29 7f __ AND #$7f
202f : a8 __ __ TAY
2030 : a9 18 __ LDA #$18
2032 : 8d 00 d6 STA $d600 
.l6056:
2035 : ad 00 d6 LDA $d600 
2038 : 10 fb __ BPL $2035 ; (main.l6056 + 0)
.s528:
203a : 8c 01 d6 STY $d601 
203d : a9 1e __ LDA #$1e
203f : 8d 00 d6 STA $d600 
.l6058:
2042 : ad 00 d6 LDA $d600 
2045 : 10 fb __ BPL $2042 ; (main.l6058 + 0)
.s533:
2047 : a5 44 __ LDA T3 + 0 
2049 : 8d 01 d6 STA $d601 
204c : 8a __ __ TXA
204d : 29 b0 __ AND #$b0
204f : 09 0d __ ORA #$0d
2051 : 8d 0b 36 STA $360b ; (vdc_text_attr + 0)
2054 : a9 0e __ LDA #$0e
2056 : a0 02 __ LDY #$02
2058 : 91 23 __ STA (SP + 0),y 
205a : a9 36 __ LDA #$36
205c : c8 __ __ INY
205d : 91 23 __ STA (SP + 0),y 
205f : a9 d4 __ LDA #$d4
2061 : c8 __ __ INY
2062 : 91 23 __ STA (SP + 0),y 
2064 : a9 34 __ LDA #$34
2066 : c8 __ __ INY
2067 : 91 23 __ STA (SP + 0),y 
2069 : ad 0c 36 LDA $360c ; (vdc_memsize + 0)
206c : c8 __ __ INY
206d : 91 23 __ STA (SP + 0),y 
206f : a9 00 __ LDA #$00
2071 : c8 __ __ INY
2072 : 91 23 __ STA (SP + 0),y 
2074 : 20 c8 31 JSR $31c8 ; (sprintf.s1000 + 0)
2077 : a9 00 __ LDA #$00
2079 : 85 44 __ STA T3 + 0 
207b : ad 0e 36 LDA $360e ; (linebuffer + 0)
207e : f0 0c __ BEQ $208c ; (main.s546 + 0)
.s545:
2080 : a2 00 __ LDX #$00
.l1462:
2082 : bd 0f 36 LDA $360f,x ; (linebuffer + 1)
2085 : e8 __ __ INX
2086 : 09 00 __ ORA #$00
2088 : d0 f8 __ BNE $2082 ; (main.l1462 + 0)
.s1463:
208a : 86 44 __ STX T3 + 0 
.s546:
208c : a9 12 __ LDA #$12
208e : 8d 00 d6 STA $d600 
.l6062:
2091 : ad 00 d6 LDA $d600 
2094 : 10 fb __ BPL $2091 ; (main.l6062 + 0)
.s553:
2096 : a9 00 __ LDA #$00
2098 : 8d 01 d6 STA $d601 
209b : a9 13 __ LDA #$13
209d : 8d 00 d6 STA $d600 
.l6064:
20a0 : ad 00 d6 LDA $d600 
20a3 : 10 fb __ BPL $20a0 ; (main.l6064 + 0)
.s558:
20a5 : a9 a0 __ LDA #$a0
20a7 : 8d 01 d6 STA $d601 
20aa : a9 1f __ LDA #$1f
20ac : 8d 00 d6 STA $d600 
20af : a5 44 __ LDA T3 + 0 
20b1 : f0 65 __ BEQ $2118 ; (main.s563 + 0)
.s1471:
20b3 : a2 00 __ LDX #$00
.l561:
20b5 : bc 0e 36 LDY $360e,x ; (linebuffer + 0)
20b8 : b9 00 37 LDA $3700,y ; (ascToPetTable + 0)
20bb : c9 20 __ CMP #$20
20bd : b0 05 __ BCS $20c4 ; (main.s567 + 0)
.s566:
20bf : 69 80 __ ADC #$80
20c1 : 4c 0a 21 JMP $210a ; (main.s1465 + 0)
.s567:
20c4 : a8 __ __ TAY
20c5 : c9 40 __ CMP #$40
20c7 : 90 04 __ BCC $20cd ; (main.s570 + 0)
.s572:
20c9 : c9 60 __ CMP #$60
20cb : 90 23 __ BCC $20f0 ; (main.s569 + 0)
.s570:
20cd : c9 60 __ CMP #$60
20cf : 90 0a __ BCC $20db ; (main.s574 + 0)
.s576:
20d1 : 09 00 __ ORA #$00
20d3 : 30 06 __ BMI $20db ; (main.s574 + 0)
.s573:
20d5 : 38 __ __ SEC
20d6 : e9 20 __ SBC #$20
20d8 : 4c 0a 21 JMP $210a ; (main.s1465 + 0)
.s574:
20db : c9 80 __ CMP #$80
20dd : 90 09 __ BCC $20e8 ; (main.s578 + 0)
.s580:
20df : c9 a0 __ CMP #$a0
20e1 : b0 05 __ BCS $20e8 ; (main.s578 + 0)
.s577:
20e3 : 69 40 __ ADC #$40
20e5 : 4c 0a 21 JMP $210a ; (main.s1465 + 0)
.s578:
20e8 : c9 a0 __ CMP #$a0
20ea : 90 0a __ BCC $20f6 ; (main.s582 + 0)
.s584:
20ec : c9 c0 __ CMP #$c0
20ee : b0 06 __ BCS $20f6 ; (main.s582 + 0)
.s569:
20f0 : 38 __ __ SEC
20f1 : e9 40 __ SBC #$40
20f3 : 4c 0a 21 JMP $210a ; (main.s1465 + 0)
.s582:
20f6 : c9 c0 __ CMP #$c0
20f8 : 90 0a __ BCC $2104 ; (main.s586 + 0)
.s588:
20fa : c9 ff __ CMP #$ff
20fc : b0 06 __ BCS $2104 ; (main.s586 + 0)
.s585:
20fe : 38 __ __ SEC
20ff : e9 80 __ SBC #$80
2101 : 4c 0a 21 JMP $210a ; (main.s1465 + 0)
.s586:
2104 : c9 ff __ CMP #$ff
2106 : d0 03 __ BNE $210b ; (main.l6068 + 0)
.s589:
2108 : a9 5e __ LDA #$5e
.s1465:
210a : a8 __ __ TAY
.l6068:
210b : ad 00 d6 LDA $d600 
210e : 10 fb __ BPL $210b ; (main.l6068 + 0)
.s594:
2110 : 8c 01 d6 STY $d601 
2113 : e8 __ __ INX
2114 : e4 44 __ CPX T3 + 0 
2116 : 90 9d __ BCC $20b5 ; (main.l561 + 0)
.s563:
2118 : a9 12 __ LDA #$12
211a : 8d 00 d6 STA $d600 
211d : c6 44 __ DEC T3 + 0 
211f : ae 0b 36 LDX $360b ; (vdc_text_attr + 0)
.l6071:
2122 : ad 00 d6 LDA $d600 
2125 : 10 fb __ BPL $2122 ; (main.l6071 + 0)
.s601:
2127 : a9 08 __ LDA #$08
2129 : 8d 01 d6 STA $d601 
212c : a9 13 __ LDA #$13
212e : 8d 00 d6 STA $d600 
.l6073:
2131 : ad 00 d6 LDA $d600 
2134 : 10 fb __ BPL $2131 ; (main.l6073 + 0)
.s606:
2136 : a9 a0 __ LDA #$a0
2138 : 8d 01 d6 STA $d601 
213b : a9 1f __ LDA #$1f
213d : 8d 00 d6 STA $d600 
.l6075:
2140 : ad 00 d6 LDA $d600 
2143 : 10 fb __ BPL $2140 ; (main.l6075 + 0)
.s610:
2145 : 8e 01 d6 STX $d601 
2148 : a9 18 __ LDA #$18
214a : 8d 00 d6 STA $d600 
.l6077:
214d : ad 00 d6 LDA $d600 
2150 : 10 fb __ BPL $214d ; (main.l6077 + 0)
.s616:
2152 : ad 01 d6 LDA $d601 
2155 : 29 7f __ AND #$7f
2157 : aa __ __ TAX
2158 : a9 18 __ LDA #$18
215a : 8d 00 d6 STA $d600 
.l6079:
215d : ad 00 d6 LDA $d600 
2160 : 10 fb __ BPL $215d ; (main.l6079 + 0)
.s622:
2162 : 8e 01 d6 STX $d601 
2165 : a9 1e __ LDA #$1e
2167 : 8d 00 d6 STA $d600 
.l6081:
216a : ad 00 d6 LDA $d600 
216d : 10 fb __ BPL $216a ; (main.l6081 + 0)
.s627:
216f : a5 44 __ LDA T3 + 0 
2171 : 8d 01 d6 STA $d601 
2174 : a9 12 __ LDA #$12
2176 : 8d 00 d6 STA $d600 
.l6083:
2179 : ad 00 d6 LDA $d600 
217c : 10 fb __ BPL $2179 ; (main.l6083 + 0)
.s641:
217e : a9 00 __ LDA #$00
2180 : 8d 01 d6 STA $d601 
2183 : a9 13 __ LDA #$13
2185 : 8d 00 d6 STA $d600 
.l6085:
2188 : ad 00 d6 LDA $d600 
218b : 10 fb __ BPL $2188 ; (main.l6085 + 0)
.s646:
218d : a9 f4 __ LDA #$f4
218f : 8d 01 d6 STA $d601 
2192 : a9 1f __ LDA #$1f
2194 : 8d 00 d6 STA $d600 
.l6087:
2197 : ad 00 d6 LDA $d600 
219a : 10 fb __ BPL $2197 ; (main.l6087 + 0)
.s650:
219c : a9 6c __ LDA #$6c
219e : 8d 01 d6 STA $d601 
21a1 : a9 12 __ LDA #$12
21a3 : 8d 00 d6 STA $d600 
.l6089:
21a6 : ad 00 d6 LDA $d600 
21a9 : 10 fb __ BPL $21a6 ; (main.l6089 + 0)
.s657:
21ab : a9 08 __ LDA #$08
21ad : 8d 01 d6 STA $d601 
21b0 : a9 13 __ LDA #$13
21b2 : 8d 00 d6 STA $d600 
.l6091:
21b5 : ad 00 d6 LDA $d600 
21b8 : 10 fb __ BPL $21b5 ; (main.l6091 + 0)
.s662:
21ba : a9 f4 __ LDA #$f4
21bc : 8d 01 d6 STA $d601 
21bf : a9 1f __ LDA #$1f
21c1 : 8d 00 d6 STA $d600 
.l6093:
21c4 : ad 00 d6 LDA $d600 
21c7 : 10 fb __ BPL $21c4 ; (main.l6093 + 0)
.s666:
21c9 : a9 09 __ LDA #$09
21cb : 8d 01 d6 STA $d601 
21ce : a9 12 __ LDA #$12
21d0 : 8d 00 d6 STA $d600 
.l6095:
21d3 : ad 00 d6 LDA $d600 
21d6 : 10 fb __ BPL $21d3 ; (main.l6095 + 0)
.s680:
21d8 : a9 00 __ LDA #$00
21da : 8d 01 d6 STA $d601 
21dd : a9 13 __ LDA #$13
21df : 8d 00 d6 STA $d600 
.l6097:
21e2 : ad 00 d6 LDA $d600 
21e5 : 10 fb __ BPL $21e2 ; (main.l6097 + 0)
.s685:
21e7 : a9 f5 __ LDA #$f5
21e9 : 8d 01 d6 STA $d601 
21ec : a9 1f __ LDA #$1f
21ee : 8d 00 d6 STA $d600 
.l6099:
21f1 : ad 00 d6 LDA $d600 
21f4 : 10 fb __ BPL $21f1 ; (main.l6099 + 0)
.s689:
21f6 : a9 62 __ LDA #$62
21f8 : 8d 01 d6 STA $d601 
21fb : a9 18 __ LDA #$18
21fd : 8d 00 d6 STA $d600 
.l6101:
2200 : ad 00 d6 LDA $d600 
2203 : 10 fb __ BPL $2200 ; (main.l6101 + 0)
.s695:
2205 : ad 01 d6 LDA $d601 
2208 : 29 7f __ AND #$7f
220a : aa __ __ TAX
220b : a9 18 __ LDA #$18
220d : 8d 00 d6 STA $d600 
.l6103:
2210 : ad 00 d6 LDA $d600 
2213 : 10 fb __ BPL $2210 ; (main.l6103 + 0)
.s701:
2215 : 8e 01 d6 STX $d601 
2218 : a9 1e __ LDA #$1e
221a : 8d 00 d6 STA $d600 
.l6105:
221d : ad 00 d6 LDA $d600 
2220 : 10 fb __ BPL $221d ; (main.l6105 + 0)
.s706:
2222 : a9 45 __ LDA #$45
2224 : 8d 01 d6 STA $d601 
2227 : a9 12 __ LDA #$12
2229 : 8d 00 d6 STA $d600 
.l6107:
222c : ad 00 d6 LDA $d600 
222f : 10 fb __ BPL $222c ; (main.l6107 + 0)
.s713:
2231 : a9 08 __ LDA #$08
2233 : 8d 01 d6 STA $d601 
2236 : a9 13 __ LDA #$13
2238 : 8d 00 d6 STA $d600 
.l6109:
223b : ad 00 d6 LDA $d600 
223e : 10 fb __ BPL $223b ; (main.l6109 + 0)
.s718:
2240 : a9 f5 __ LDA #$f5
2242 : 8d 01 d6 STA $d601 
2245 : a9 1f __ LDA #$1f
2247 : 8d 00 d6 STA $d600 
.l6111:
224a : ad 00 d6 LDA $d600 
224d : 10 fb __ BPL $224a ; (main.l6111 + 0)
.s722:
224f : a9 09 __ LDA #$09
2251 : 8d 01 d6 STA $d601 
2254 : a9 18 __ LDA #$18
2256 : 8d 00 d6 STA $d600 
.l6113:
2259 : ad 00 d6 LDA $d600 
225c : 10 fb __ BPL $2259 ; (main.l6113 + 0)
.s728:
225e : ad 01 d6 LDA $d601 
2261 : 29 7f __ AND #$7f
2263 : aa __ __ TAX
2264 : a9 18 __ LDA #$18
2266 : 8d 00 d6 STA $d600 
.l6115:
2269 : ad 00 d6 LDA $d600 
226c : 10 fb __ BPL $2269 ; (main.l6115 + 0)
.s734:
226e : 8e 01 d6 STX $d601 
2271 : a9 1e __ LDA #$1e
2273 : 8d 00 d6 STA $d600 
.l6117:
2276 : ad 00 d6 LDA $d600 
2279 : 10 fb __ BPL $2276 ; (main.l6117 + 0)
.s739:
227b : a9 45 __ LDA #$45
227d : 8d 01 d6 STA $d601 
2280 : a9 12 __ LDA #$12
2282 : 8d 00 d6 STA $d600 
.l6119:
2285 : ad 00 d6 LDA $d600 
2288 : 10 fb __ BPL $2285 ; (main.l6119 + 0)
.s753:
228a : a9 01 __ LDA #$01
228c : 8d 01 d6 STA $d601 
228f : a9 13 __ LDA #$13
2291 : 8d 00 d6 STA $d600 
.l6121:
2294 : ad 00 d6 LDA $d600 
2297 : 10 fb __ BPL $2294 ; (main.l6121 + 0)
.s758:
2299 : a9 3b __ LDA #$3b
229b : 8d 01 d6 STA $d601 
229e : a9 1f __ LDA #$1f
22a0 : 8d 00 d6 STA $d600 
.l6123:
22a3 : ad 00 d6 LDA $d600 
22a6 : 10 fb __ BPL $22a3 ; (main.l6123 + 0)
.s762:
22a8 : a9 7b __ LDA #$7b
22aa : 8d 01 d6 STA $d601 
22ad : a9 12 __ LDA #$12
22af : 8d 00 d6 STA $d600 
.l6125:
22b2 : ad 00 d6 LDA $d600 
22b5 : 10 fb __ BPL $22b2 ; (main.l6125 + 0)
.s769:
22b7 : a9 09 __ LDA #$09
22b9 : 8d 01 d6 STA $d601 
22bc : a9 13 __ LDA #$13
22be : 8d 00 d6 STA $d600 
.l6127:
22c1 : ad 00 d6 LDA $d600 
22c4 : 10 fb __ BPL $22c1 ; (main.l6127 + 0)
.s774:
22c6 : a9 3b __ LDA #$3b
22c8 : 8d 01 d6 STA $d601 
22cb : a9 1f __ LDA #$1f
22cd : 8d 00 d6 STA $d600 
.l6129:
22d0 : ad 00 d6 LDA $d600 
22d3 : 10 fb __ BPL $22d0 ; (main.l6129 + 0)
.s778:
22d5 : a9 09 __ LDA #$09
22d7 : 8d 01 d6 STA $d601 
22da : a9 04 __ LDA #$04
22dc : 85 43 __ STA T2 + 0 
.l781:
22de : a9 12 __ LDA #$12
22e0 : 8d 00 d6 STA $d600 
22e3 : a5 43 __ LDA T2 + 0 
22e5 : 0a __ __ ASL
22e6 : 85 1b __ STA ACCU + 0 
22e8 : a9 00 __ LDA #$00
22ea : 2a __ __ ROL
22eb : 06 1b __ ASL ACCU + 0 
22ed : 2a __ __ ROL
22ee : aa __ __ TAX
22ef : a5 1b __ LDA ACCU + 0 
22f1 : 65 43 __ ADC T2 + 0 
22f3 : 85 44 __ STA T3 + 0 
22f5 : 8a __ __ TXA
22f6 : 69 00 __ ADC #$00
22f8 : 06 44 __ ASL T3 + 0 
22fa : 2a __ __ ROL
22fb : 06 44 __ ASL T3 + 0 
22fd : 2a __ __ ROL
22fe : 06 44 __ ASL T3 + 0 
2300 : 2a __ __ ROL
2301 : 06 44 __ ASL T3 + 0 
2303 : 2a __ __ ROL
2304 : aa __ __ TAX
2305 : a5 44 __ LDA T3 + 0 
2307 : 09 04 __ ORA #$04
2309 : 85 44 __ STA T3 + 0 
230b : e0 07 __ CPX #$07
230d : d0 02 __ BNE $2311 ; (main.s1177 + 0)
.s1176:
230f : c9 d0 __ CMP #$d0
.s1177:
2311 : 90 04 __ BCC $2317 ; (main.l6132 + 0)
.s787:
2313 : a2 ff __ LDX #$ff
2315 : 86 44 __ STX T3 + 0 
.l6132:
2317 : ad 00 d6 LDA $d600 
231a : 10 fb __ BPL $2317 ; (main.l6132 + 0)
.s797:
231c : 8e 01 d6 STX $d601 
231f : a9 13 __ LDA #$13
2321 : 8d 00 d6 STA $d600 
.l6134:
2324 : ad 00 d6 LDA $d600 
2327 : 10 fb __ BPL $2324 ; (main.l6134 + 0)
.s802:
2329 : a5 44 __ LDA T3 + 0 
232b : 8d 01 d6 STA $d601 
232e : a9 1f __ LDA #$1f
2330 : 8d 00 d6 STA $d600 
.l6136:
2333 : ad 00 d6 LDA $d600 
2336 : 10 fb __ BPL $2333 ; (main.l6136 + 0)
.s806:
2338 : a9 e1 __ LDA #$e1
233a : 8d 01 d6 STA $d601 
233d : a9 12 __ LDA #$12
233f : 8d 00 d6 STA $d600 
2342 : 8a __ __ TXA
2343 : 18 __ __ CLC
2344 : 69 08 __ ADC #$08
2346 : a8 __ __ TAY
.l6138:
2347 : ad 00 d6 LDA $d600 
234a : 10 fb __ BPL $2347 ; (main.l6138 + 0)
.s813:
234c : 8c 01 d6 STY $d601 
234f : a9 13 __ LDA #$13
2351 : 8d 00 d6 STA $d600 
.l6140:
2354 : ad 00 d6 LDA $d600 
2357 : 10 fb __ BPL $2354 ; (main.l6140 + 0)
.s818:
2359 : a5 44 __ LDA T3 + 0 
235b : 8d 01 d6 STA $d601 
235e : a9 1f __ LDA #$1f
2360 : 8d 00 d6 STA $d600 
.l6142:
2363 : ad 00 d6 LDA $d600 
2366 : 10 fb __ BPL $2363 ; (main.l6142 + 0)
.s822:
2368 : a9 09 __ LDA #$09
236a : 8d 01 d6 STA $d601 
236d : e6 43 __ INC T2 + 0 
236f : a5 43 __ LDA T2 + 0 
2371 : c9 18 __ CMP #$18
2373 : b0 03 __ BCS $2378 ; (main.s779 + 0)
2375 : 4c de 22 JMP $22de ; (main.l781 + 0)
.s779:
2378 : a9 04 __ LDA #$04
237a : 85 43 __ STA T2 + 0 
.l824:
237c : a9 12 __ LDA #$12
237e : 8d 00 d6 STA $d600 
2381 : a5 43 __ LDA T2 + 0 
2383 : c9 18 __ CMP #$18
2385 : b0 03 __ BCS $238a ; (main.l6157 + 0)
2387 : 4c a4 28 JMP $28a4 ; (main.s825 + 0)
.l6157:
238a : ad 00 d6 LDA $d600 
238d : 10 fb __ BPL $238a ; (main.l6157 + 0)
.s880:
238f : a9 07 __ LDA #$07
2391 : 8d 01 d6 STA $d601 
2394 : a9 13 __ LDA #$13
2396 : 8d 00 d6 STA $d600 
.l6159:
2399 : ad 00 d6 LDA $d600 
239c : 10 fb __ BPL $2399 ; (main.l6159 + 0)
.s885:
239e : a9 84 __ LDA #$84
23a0 : 8d 01 d6 STA $d601 
23a3 : a9 1f __ LDA #$1f
23a5 : 8d 00 d6 STA $d600 
.l6161:
23a8 : ad 00 d6 LDA $d600 
23ab : 10 fb __ BPL $23a8 ; (main.l6161 + 0)
.s889:
23ad : a9 7c __ LDA #$7c
23af : 8d 01 d6 STA $d601 
23b2 : a9 12 __ LDA #$12
23b4 : 8d 00 d6 STA $d600 
.l6163:
23b7 : ad 00 d6 LDA $d600 
23ba : 10 fb __ BPL $23b7 ; (main.l6163 + 0)
.s896:
23bc : a9 0f __ LDA #$0f
23be : 8d 01 d6 STA $d601 
23c1 : a9 13 __ LDA #$13
23c3 : 8d 00 d6 STA $d600 
.l6165:
23c6 : ad 00 d6 LDA $d600 
23c9 : 10 fb __ BPL $23c6 ; (main.l6165 + 0)
.s901:
23cb : a9 84 __ LDA #$84
23cd : 8d 01 d6 STA $d601 
23d0 : a9 1f __ LDA #$1f
23d2 : 8d 00 d6 STA $d600 
.l6167:
23d5 : ad 00 d6 LDA $d600 
23d8 : 10 fb __ BPL $23d5 ; (main.l6167 + 0)
.s905:
23da : a9 09 __ LDA #$09
23dc : 8d 01 d6 STA $d601 
23df : a9 12 __ LDA #$12
23e1 : 8d 00 d6 STA $d600 
.l6169:
23e4 : ad 00 d6 LDA $d600 
23e7 : 10 fb __ BPL $23e4 ; (main.l6169 + 0)
.s919:
23e9 : a9 07 __ LDA #$07
23eb : 8d 01 d6 STA $d601 
23ee : a9 13 __ LDA #$13
23f0 : 8d 00 d6 STA $d600 
.l6171:
23f3 : ad 00 d6 LDA $d600 
23f6 : 10 fb __ BPL $23f3 ; (main.l6171 + 0)
.s924:
23f8 : a9 85 __ LDA #$85
23fa : 8d 01 d6 STA $d601 
23fd : a9 1f __ LDA #$1f
23ff : 8d 00 d6 STA $d600 
.l6173:
2402 : ad 00 d6 LDA $d600 
2405 : 10 fb __ BPL $2402 ; (main.l6173 + 0)
.s928:
2407 : a9 e2 __ LDA #$e2
2409 : 8d 01 d6 STA $d601 
240c : a9 18 __ LDA #$18
240e : 8d 00 d6 STA $d600 
.l6175:
2411 : ad 00 d6 LDA $d600 
2414 : 10 fb __ BPL $2411 ; (main.l6175 + 0)
.s934:
2416 : ad 01 d6 LDA $d601 
2419 : 29 7f __ AND #$7f
241b : aa __ __ TAX
241c : a9 18 __ LDA #$18
241e : 8d 00 d6 STA $d600 
.l6177:
2421 : ad 00 d6 LDA $d600 
2424 : 10 fb __ BPL $2421 ; (main.l6177 + 0)
.s940:
2426 : 8e 01 d6 STX $d601 
2429 : a9 1e __ LDA #$1e
242b : 8d 00 d6 STA $d600 
.l6179:
242e : ad 00 d6 LDA $d600 
2431 : 10 fb __ BPL $242e ; (main.l6179 + 0)
.s945:
2433 : a9 45 __ LDA #$45
2435 : 8d 01 d6 STA $d601 
2438 : a9 12 __ LDA #$12
243a : 8d 00 d6 STA $d600 
.l6181:
243d : ad 00 d6 LDA $d600 
2440 : 10 fb __ BPL $243d ; (main.l6181 + 0)
.s952:
2442 : a9 0f __ LDA #$0f
2444 : 8d 01 d6 STA $d601 
2447 : a9 13 __ LDA #$13
2449 : 8d 00 d6 STA $d600 
.l6183:
244c : ad 00 d6 LDA $d600 
244f : 10 fb __ BPL $244c ; (main.l6183 + 0)
.s957:
2451 : a9 85 __ LDA #$85
2453 : 8d 01 d6 STA $d601 
2456 : a9 1f __ LDA #$1f
2458 : 8d 00 d6 STA $d600 
.l6185:
245b : ad 00 d6 LDA $d600 
245e : 10 fb __ BPL $245b ; (main.l6185 + 0)
.s961:
2460 : a9 09 __ LDA #$09
2462 : 8d 01 d6 STA $d601 
2465 : a9 18 __ LDA #$18
2467 : 8d 00 d6 STA $d600 
.l6187:
246a : ad 00 d6 LDA $d600 
246d : 10 fb __ BPL $246a ; (main.l6187 + 0)
.s967:
246f : ad 01 d6 LDA $d601 
2472 : 29 7f __ AND #$7f
2474 : aa __ __ TAX
2475 : a9 18 __ LDA #$18
2477 : 8d 00 d6 STA $d600 
.l6189:
247a : ad 00 d6 LDA $d600 
247d : 10 fb __ BPL $247a ; (main.l6189 + 0)
.s973:
247f : 8e 01 d6 STX $d601 
2482 : a9 1e __ LDA #$1e
2484 : 8d 00 d6 STA $d600 
.l6191:
2487 : ad 00 d6 LDA $d600 
248a : 10 fb __ BPL $2487 ; (main.l6191 + 0)
.s978:
248c : a9 45 __ LDA #$45
248e : 8d 01 d6 STA $d601 
2491 : a9 12 __ LDA #$12
2493 : 8d 00 d6 STA $d600 
.l6193:
2496 : ad 00 d6 LDA $d600 
2499 : 10 fb __ BPL $2496 ; (main.l6193 + 0)
.s992:
249b : a9 07 __ LDA #$07
249d : 8d 01 d6 STA $d601 
24a0 : a9 13 __ LDA #$13
24a2 : 8d 00 d6 STA $d600 
.l6195:
24a5 : ad 00 d6 LDA $d600 
24a8 : 10 fb __ BPL $24a5 ; (main.l6195 + 0)
.s997:
24aa : a9 cb __ LDA #$cb
24ac : 8d 01 d6 STA $d601 
24af : a9 1f __ LDA #$1f
24b1 : 8d 00 d6 STA $d600 
.l6197:
24b4 : ad 00 d6 LDA $d600 
24b7 : 10 fb __ BPL $24b4 ; (main.l6197 + 0)
.s1001:
24b9 : a9 7e __ LDA #$7e
24bb : 8d 01 d6 STA $d601 
24be : a9 12 __ LDA #$12
24c0 : 8d 00 d6 STA $d600 
.l6199:
24c3 : ad 00 d6 LDA $d600 
24c6 : 10 fb __ BPL $24c3 ; (main.l6199 + 0)
.s1008:
24c8 : a9 0f __ LDA #$0f
24ca : 8d 01 d6 STA $d601 
24cd : a9 13 __ LDA #$13
24cf : 8d 00 d6 STA $d600 
.l6201:
24d2 : ad 00 d6 LDA $d600 
24d5 : 10 fb __ BPL $24d2 ; (main.l6201 + 0)
.s1013:
24d7 : a9 cb __ LDA #$cb
24d9 : 8d 01 d6 STA $d601 
24dc : a9 1f __ LDA #$1f
24de : 8d 00 d6 STA $d600 
.l6203:
24e1 : ad 00 d6 LDA $d600 
24e4 : 10 fb __ BPL $24e1 ; (main.l6203 + 0)
.s1017:
24e6 : a9 09 __ LDA #$09
24e8 : 8d 01 d6 STA $d601 
24eb : a9 04 __ LDA #$04
24ed : 85 43 __ STA T2 + 0 
24ef : a0 00 __ LDY #$00
.l1019:
24f1 : a2 05 __ LDX #$05
.l1023:
24f3 : a9 12 __ LDA #$12
24f5 : 8d 00 d6 STA $d600 
24f8 : a5 43 __ LDA T2 + 0 
24fa : 0a __ __ ASL
24fb : 85 1b __ STA ACCU + 0 
24fd : a9 00 __ LDA #$00
24ff : 2a __ __ ROL
2500 : 06 1b __ ASL ACCU + 0 
2502 : 2a __ __ ROL
2503 : 85 1c __ STA ACCU + 1 
2505 : a5 1b __ LDA ACCU + 0 
2507 : 65 43 __ ADC T2 + 0 
2509 : 85 44 __ STA T3 + 0 
250b : a5 1c __ LDA ACCU + 1 
250d : 69 00 __ ADC #$00
250f : 06 44 __ ASL T3 + 0 
2511 : 2a __ __ ROL
2512 : 06 44 __ ASL T3 + 0 
2514 : 2a __ __ ROL
2515 : 06 44 __ ASL T3 + 0 
2517 : 2a __ __ ROL
2518 : 06 44 __ ASL T3 + 0 
251a : 2a __ __ ROL
251b : 85 45 __ STA T3 + 1 
251d : 8a __ __ TXA
251e : 18 __ __ CLC
251f : 65 44 __ ADC T3 + 0 
2521 : 85 44 __ STA T3 + 0 
2523 : a9 00 __ LDA #$00
2525 : 65 45 __ ADC T3 + 1 
2527 : 85 45 __ STA T3 + 1 
2529 : c9 07 __ CMP #$07
252b : d0 04 __ BNE $2531 ; (main.s1099 + 0)
.s1098:
252d : a5 44 __ LDA T3 + 0 
252f : c9 d0 __ CMP #$d0
.s1099:
2531 : 90 06 __ BCC $2539 ; (main.s1027 + 0)
.s1029:
2533 : a9 ff __ LDA #$ff
2535 : 85 44 __ STA T3 + 0 
2537 : 85 45 __ STA T3 + 1 
.s1027:
2539 : 84 47 __ STY T5 + 0 
253b : a5 4f __ LDA T0 + 0 
253d : 85 49 __ STA T6 + 0 
253f : e6 4f __ INC T0 + 0 
2541 : c8 __ __ INY
.l6206:
2542 : ad 00 d6 LDA $d600 
2545 : 10 fb __ BPL $2542 ; (main.l6206 + 0)
.s1039:
2547 : a5 45 __ LDA T3 + 1 
2549 : 8d 01 d6 STA $d601 
254c : a9 13 __ LDA #$13
254e : 8d 00 d6 STA $d600 
.l6208:
2551 : ad 00 d6 LDA $d600 
2554 : 10 fb __ BPL $2551 ; (main.l6208 + 0)
.s1044:
2556 : a5 44 __ LDA T3 + 0 
2558 : 8d 01 d6 STA $d601 
255b : a9 1f __ LDA #$1f
255d : 8d 00 d6 STA $d600 
.l6210:
2560 : ad 00 d6 LDA $d600 
2563 : 10 fb __ BPL $2560 ; (main.l6210 + 0)
.s1048:
2565 : a5 49 __ LDA T6 + 0 
2567 : 8d 01 d6 STA $d601 
256a : a9 12 __ LDA #$12
256c : 8d 00 d6 STA $d600 
256f : 18 __ __ CLC
2570 : a5 45 __ LDA T3 + 1 
2572 : 69 08 __ ADC #$08
2574 : 85 4a __ STA T7 + 0 
.l6212:
2576 : ad 00 d6 LDA $d600 
2579 : 10 fb __ BPL $2576 ; (main.l6212 + 0)
.s1055:
257b : a5 4a __ LDA T7 + 0 
257d : 8d 01 d6 STA $d601 
2580 : a9 13 __ LDA #$13
2582 : 8d 00 d6 STA $d600 
.l6214:
2585 : ad 00 d6 LDA $d600 
2588 : 10 fb __ BPL $2585 ; (main.l6214 + 0)
.s1060:
258a : a5 44 __ LDA T3 + 0 
258c : 8d 01 d6 STA $d601 
258f : a9 1f __ LDA #$1f
2591 : 8d 00 d6 STA $d600 
.l6216:
2594 : ad 00 d6 LDA $d600 
2597 : 10 fb __ BPL $2594 ; (main.l6216 + 0)
.s1064:
2599 : a5 47 __ LDA T5 + 0 
259b : 8d 01 d6 STA $d601 
259e : c0 10 __ CPY #$10
25a0 : 90 02 __ BCC $25a4 ; (main.s6219 + 0)
.s1065:
25a2 : a0 00 __ LDY #$00
.s6219:
25a4 : e8 __ __ INX
25a5 : e0 4b __ CPX #$4b
25a7 : b0 03 __ BCS $25ac ; (main.s1020 + 0)
25a9 : 4c f3 24 JMP $24f3 ; (main.l1023 + 0)
.s1020:
25ac : e6 43 __ INC T2 + 0 
25ae : a5 43 __ LDA T2 + 0 
25b0 : c9 18 __ CMP #$18
25b2 : b0 03 __ BCS $25b7 ; (main.s1021 + 0)
25b4 : 4c f1 24 JMP $24f1 ; (main.l1019 + 0)
.s1021:
25b7 : a9 14 __ LDA #$14
25b9 : 85 4f __ STA T0 + 0 
.l1075:
25bb : 20 6c 31 JSR $316c ; (getch.s0 + 0)
25be : a9 95 __ LDA #$95
25c0 : 85 47 __ STA T5 + 0 
25c2 : a9 13 __ LDA #$13
25c4 : 85 1b __ STA ACCU + 0 
25c6 : a0 01 __ LDY #$01
25c8 : 84 48 __ STY T5 + 1 
25ca : a2 45 __ LDX #$45
.l1080:
25cc : a9 12 __ LDA #$12
25ce : 8d 00 d6 STA $d600 
.l6221:
25d1 : ad 00 d6 LDA $d600 
25d4 : 10 fb __ BPL $25d1 ; (main.l6221 + 0)
.s1089:
25d6 : 8c 01 d6 STY $d601 
25d9 : a9 13 __ LDA #$13
25db : 8d 00 d6 STA $d600 
.l6223:
25de : ad 00 d6 LDA $d600 
25e1 : 10 fb __ BPL $25de ; (main.l6223 + 0)
.s1094:
25e3 : 8e 01 d6 STX $d601 
25e6 : a9 1f __ LDA #$1f
25e8 : 8d 00 d6 STA $d600 
25eb : a9 18 __ LDA #$18
25ed : 8d 00 d6 STA $d600 
.l6225:
25f0 : ad 00 d6 LDA $d600 
25f3 : 10 fb __ BPL $25f0 ; (main.l6225 + 0)
.s1101:
25f5 : ad 01 d6 LDA $d601 
25f8 : 09 80 __ ORA #$80
25fa : 85 4a __ STA T7 + 0 
25fc : a9 18 __ LDA #$18
25fe : 8d 00 d6 STA $d600 
.l6227:
2601 : ad 00 d6 LDA $d600 
2604 : 10 fb __ BPL $2601 ; (main.l6227 + 0)
.s1107:
2606 : a5 4a __ LDA T7 + 0 
2608 : 8d 01 d6 STA $d601 
260b : a9 20 __ LDA #$20
260d : 8d 00 d6 STA $d600 
.l6229:
2610 : ad 00 d6 LDA $d600 
2613 : 10 fb __ BPL $2610 ; (main.l6229 + 0)
.s1112:
2615 : a5 48 __ LDA T5 + 1 
2617 : 8d 01 d6 STA $d601 
261a : a9 21 __ LDA #$21
261c : 8d 00 d6 STA $d600 
.l6231:
261f : ad 00 d6 LDA $d600 
2622 : 10 fb __ BPL $261f ; (main.l6231 + 0)
.s1117:
2624 : a5 47 __ LDA T5 + 0 
2626 : 8d 01 d6 STA $d601 
2629 : a9 1f __ LDA #$1f
262b : 8d 00 d6 STA $d600 
262e : a9 1e __ LDA #$1e
2630 : 8d 00 d6 STA $d600 
.l6233:
2633 : ad 00 d6 LDA $d600 
2636 : 10 fb __ BPL $2633 ; (main.l6233 + 0)
.s1123:
2638 : a9 46 __ LDA #$46
263a : 8d 01 d6 STA $d601 
263d : 18 __ __ CLC
263e : a5 47 __ LDA T5 + 0 
2640 : 69 50 __ ADC #$50
2642 : 85 47 __ STA T5 + 0 
2644 : 90 02 __ BCC $2648 ; (main.s1474 + 0)
.s1473:
2646 : e6 48 __ INC T5 + 1 
.s1474:
2648 : 8a __ __ TXA
2649 : 18 __ __ CLC
264a : 69 50 __ ADC #$50
264c : aa __ __ TAX
264d : 90 01 __ BCC $2650 ; (main.s1476 + 0)
.s1475:
264f : c8 __ __ INY
.s1476:
2650 : c6 1b __ DEC ACCU + 0 
2652 : f0 03 __ BEQ $2657 ; (main.s1078 + 0)
2654 : 4c cc 25 JMP $25cc ; (main.l1080 + 0)
.s1078:
2657 : a9 95 __ LDA #$95
2659 : 85 47 __ STA T5 + 0 
265b : a9 13 __ LDA #$13
265d : 85 1b __ STA ACCU + 0 
265f : a0 09 __ LDY #$09
2661 : 84 48 __ STY T5 + 1 
2663 : a2 45 __ LDX #$45
.l1126:
2665 : a9 12 __ LDA #$12
2667 : 8d 00 d6 STA $d600 
.l6236:
266a : ad 00 d6 LDA $d600 
266d : 10 fb __ BPL $266a ; (main.l6236 + 0)
.s1135:
266f : 8c 01 d6 STY $d601 
2672 : a9 13 __ LDA #$13
2674 : 8d 00 d6 STA $d600 
.l6238:
2677 : ad 00 d6 LDA $d600 
267a : 10 fb __ BPL $2677 ; (main.l6238 + 0)
.s1140:
267c : 8e 01 d6 STX $d601 
267f : a9 1f __ LDA #$1f
2681 : 8d 00 d6 STA $d600 
2684 : a9 18 __ LDA #$18
2686 : 8d 00 d6 STA $d600 
.l6240:
2689 : ad 00 d6 LDA $d600 
268c : 10 fb __ BPL $2689 ; (main.l6240 + 0)
.s1147:
268e : ad 01 d6 LDA $d601 
2691 : 09 80 __ ORA #$80
2693 : 85 4a __ STA T7 + 0 
2695 : a9 18 __ LDA #$18
2697 : 8d 00 d6 STA $d600 
.l6242:
269a : ad 00 d6 LDA $d600 
269d : 10 fb __ BPL $269a ; (main.l6242 + 0)
.s1153:
269f : a5 4a __ LDA T7 + 0 
26a1 : 8d 01 d6 STA $d601 
26a4 : a9 20 __ LDA #$20
26a6 : 8d 00 d6 STA $d600 
.l6244:
26a9 : ad 00 d6 LDA $d600 
26ac : 10 fb __ BPL $26a9 ; (main.l6244 + 0)
.s1158:
26ae : a5 48 __ LDA T5 + 1 
26b0 : 8d 01 d6 STA $d601 
26b3 : a9 21 __ LDA #$21
26b5 : 8d 00 d6 STA $d600 
.l6246:
26b8 : ad 00 d6 LDA $d600 
26bb : 10 fb __ BPL $26b8 ; (main.l6246 + 0)
.s1163:
26bd : a5 47 __ LDA T5 + 0 
26bf : 8d 01 d6 STA $d601 
26c2 : a9 1f __ LDA #$1f
26c4 : 8d 00 d6 STA $d600 
26c7 : a9 1e __ LDA #$1e
26c9 : 8d 00 d6 STA $d600 
.l6248:
26cc : ad 00 d6 LDA $d600 
26cf : 10 fb __ BPL $26cc ; (main.l6248 + 0)
.s1169:
26d1 : a9 46 __ LDA #$46
26d3 : 8d 01 d6 STA $d601 
26d6 : 18 __ __ CLC
26d7 : a5 47 __ LDA T5 + 0 
26d9 : 69 50 __ ADC #$50
26db : 85 47 __ STA T5 + 0 
26dd : 90 02 __ BCC $26e1 ; (main.s1478 + 0)
.s1477:
26df : e6 48 __ INC T5 + 1 
.s1478:
26e1 : 8a __ __ TXA
26e2 : 18 __ __ CLC
26e3 : 69 50 __ ADC #$50
26e5 : aa __ __ TAX
26e6 : 90 01 __ BCC $26e9 ; (main.s1480 + 0)
.s1479:
26e8 : c8 __ __ INY
.s1480:
26e9 : c6 1b __ DEC ACCU + 0 
26eb : f0 03 __ BEQ $26f0 ; (main.s1124 + 0)
26ed : 4c 65 26 JMP $2665 ; (main.l1126 + 0)
.s1124:
26f0 : a9 12 __ LDA #$12
26f2 : 8d 00 d6 STA $d600 
.l6251:
26f5 : ad 00 d6 LDA $d600 
26f8 : 10 fb __ BPL $26f5 ; (main.l6251 + 0)
.s1183:
26fa : a9 07 __ LDA #$07
26fc : 8d 01 d6 STA $d601 
26ff : a9 13 __ LDA #$13
2701 : 8d 00 d6 STA $d600 
.l6253:
2704 : ad 00 d6 LDA $d600 
2707 : 10 fb __ BPL $2704 ; (main.l6253 + 0)
.s1188:
2709 : a9 35 __ LDA #$35
270b : 8d 01 d6 STA $d601 
270e : a9 1f __ LDA #$1f
2710 : 8d 00 d6 STA $d600 
.l6255:
2713 : ad 00 d6 LDA $d600 
2716 : 10 fb __ BPL $2713 ; (main.l6255 + 0)
.s1192:
2718 : a9 20 __ LDA #$20
271a : 8d 01 d6 STA $d601 
271d : a9 18 __ LDA #$18
271f : 8d 00 d6 STA $d600 
.l6257:
2722 : ad 00 d6 LDA $d600 
2725 : 10 fb __ BPL $2722 ; (main.l6257 + 0)
.s1198:
2727 : ad 01 d6 LDA $d601 
272a : 29 7f __ AND #$7f
272c : aa __ __ TAX
272d : a9 18 __ LDA #$18
272f : 8d 00 d6 STA $d600 
.l6259:
2732 : ad 00 d6 LDA $d600 
2735 : 10 fb __ BPL $2732 ; (main.l6259 + 0)
.s1204:
2737 : 8e 01 d6 STX $d601 
273a : a9 1e __ LDA #$1e
273c : 8d 00 d6 STA $d600 
.l6261:
273f : ad 00 d6 LDA $d600 
2742 : 10 fb __ BPL $273f ; (main.l6261 + 0)
.s1209:
2744 : a9 45 __ LDA #$45
2746 : 8d 01 d6 STA $d601 
2749 : a9 12 __ LDA #$12
274b : 8d 00 d6 STA $d600 
.l6263:
274e : ad 00 d6 LDA $d600 
2751 : 10 fb __ BPL $274e ; (main.l6263 + 0)
.s1216:
2753 : a9 0f __ LDA #$0f
2755 : 8d 01 d6 STA $d601 
2758 : a9 13 __ LDA #$13
275a : 8d 00 d6 STA $d600 
.l6265:
275d : ad 00 d6 LDA $d600 
2760 : 10 fb __ BPL $275d ; (main.l6265 + 0)
.s1221:
2762 : a9 35 __ LDA #$35
2764 : 8d 01 d6 STA $d601 
2767 : a9 1f __ LDA #$1f
2769 : 8d 00 d6 STA $d600 
.l6267:
276c : ad 00 d6 LDA $d600 
276f : 10 fb __ BPL $276c ; (main.l6267 + 0)
.s1225:
2771 : a9 0d __ LDA #$0d
2773 : 8d 01 d6 STA $d601 
2776 : a9 18 __ LDA #$18
2778 : 8d 00 d6 STA $d600 
.l6269:
277b : ad 00 d6 LDA $d600 
277e : 10 fb __ BPL $277b ; (main.l6269 + 0)
.s1231:
2780 : ad 01 d6 LDA $d601 
2783 : 29 7f __ AND #$7f
2785 : aa __ __ TAX
2786 : a9 18 __ LDA #$18
2788 : 8d 00 d6 STA $d600 
.l6271:
278b : ad 00 d6 LDA $d600 
278e : 10 fb __ BPL $278b ; (main.l6271 + 0)
.s1237:
2790 : 8e 01 d6 STX $d601 
2793 : a9 1e __ LDA #$1e
2795 : 8d 00 d6 STA $d600 
.l6273:
2798 : ad 00 d6 LDA $d600 
279b : 10 fb __ BPL $2798 ; (main.l6273 + 0)
.s1242:
279d : a9 45 __ LDA #$45
279f : 8d 01 d6 STA $d601 
27a2 : c6 4f __ DEC T0 + 0 
27a4 : f0 03 __ BEQ $27a9 ; (main.s1077 + 0)
27a6 : 4c bb 25 JMP $25bb ; (main.l1075 + 0)
.s1077:
27a9 : a9 00 __ LDA #$00
27ab : 8d 30 d0 STA $d030 
27ae : ad 11 d0 LDA $d011 
27b1 : 29 7f __ AND #$7f
27b3 : 09 10 __ ORA #$10
27b5 : 8d 11 d0 STA $d011 
.l1250:
27b8 : a5 4f __ LDA T0 + 0 
27ba : c9 19 __ CMP #$19
27bc : 90 15 __ BCC $27d3 ; (main.s1251 + 0)
.s1243:
27be : a9 00 __ LDA #$00
27c0 : 8d 00 ff STA $ff00 
27c3 : 85 1b __ STA ACCU + 0 
27c5 : 85 1c __ STA ACCU + 1 
.s1001:
27c7 : 18 __ __ CLC
27c8 : a5 23 __ LDA SP + 0 
27ca : 69 08 __ ADC #$08
27cc : 85 23 __ STA SP + 0 
27ce : 90 02 __ BCC $27d2 ; (main.s1001 + 11)
27d0 : e6 24 __ INC SP + 1 
27d2 : 60 __ __ RTS
.s1251:
27d3 : a9 12 __ LDA #$12
27d5 : 8d 00 d6 STA $d600 
27d8 : a5 4f __ LDA T0 + 0 
27da : 0a __ __ ASL
27db : 0a __ __ ASL
27dc : 65 4f __ ADC T0 + 0 
27de : 0a __ __ ASL
27df : 0a __ __ ASL
27e0 : 85 44 __ STA T3 + 0 
27e2 : a9 00 __ LDA #$00
27e4 : 2a __ __ ROL
27e5 : 06 44 __ ASL T3 + 0 
27e7 : 2a __ __ ROL
27e8 : 06 44 __ ASL T3 + 0 
27ea : 2a __ __ ROL
27eb : 85 45 __ STA T3 + 1 
27ed : ac 0b 36 LDY $360b ; (vdc_text_attr + 0)
.l6276:
27f0 : ad 00 d6 LDA $d600 
27f3 : 10 fb __ BPL $27f0 ; (main.l6276 + 0)
.s1267:
27f5 : a5 45 __ LDA T3 + 1 
27f7 : 8d 01 d6 STA $d601 
27fa : a9 13 __ LDA #$13
27fc : 8d 00 d6 STA $d600 
.l6278:
27ff : ad 00 d6 LDA $d600 
2802 : 10 fb __ BPL $27ff ; (main.l6278 + 0)
.s1272:
2804 : a5 44 __ LDA T3 + 0 
2806 : 8d 01 d6 STA $d601 
2809 : a9 1f __ LDA #$1f
280b : 8d 00 d6 STA $d600 
.l6280:
280e : ad 00 d6 LDA $d600 
2811 : 10 fb __ BPL $280e ; (main.l6280 + 0)
.s1276:
2813 : a9 20 __ LDA #$20
2815 : 8d 01 d6 STA $d601 
2818 : a9 18 __ LDA #$18
281a : 8d 00 d6 STA $d600 
.l6282:
281d : ad 00 d6 LDA $d600 
2820 : 10 fb __ BPL $281d ; (main.l6282 + 0)
.s1282:
2822 : ad 01 d6 LDA $d601 
2825 : 29 7f __ AND #$7f
2827 : aa __ __ TAX
2828 : a9 18 __ LDA #$18
282a : 8d 00 d6 STA $d600 
.l6284:
282d : ad 00 d6 LDA $d600 
2830 : 10 fb __ BPL $282d ; (main.l6284 + 0)
.s1288:
2832 : 8e 01 d6 STX $d601 
2835 : a9 1e __ LDA #$1e
2837 : 8d 00 d6 STA $d600 
.l6286:
283a : ad 00 d6 LDA $d600 
283d : 10 fb __ BPL $283a ; (main.l6286 + 0)
.s1293:
283f : a9 4f __ LDA #$4f
2841 : 8d 01 d6 STA $d601 
2844 : a9 12 __ LDA #$12
2846 : 8d 00 d6 STA $d600 
2849 : 18 __ __ CLC
284a : a5 45 __ LDA T3 + 1 
284c : 69 08 __ ADC #$08
284e : aa __ __ TAX
.l6288:
284f : ad 00 d6 LDA $d600 
2852 : 10 fb __ BPL $284f ; (main.l6288 + 0)
.s1300:
2854 : 8e 01 d6 STX $d601 
2857 : a9 13 __ LDA #$13
2859 : 8d 00 d6 STA $d600 
.l6290:
285c : ad 00 d6 LDA $d600 
285f : 10 fb __ BPL $285c ; (main.l6290 + 0)
.s1305:
2861 : a5 44 __ LDA T3 + 0 
2863 : 8d 01 d6 STA $d601 
2866 : a9 1f __ LDA #$1f
2868 : 8d 00 d6 STA $d600 
.l6292:
286b : ad 00 d6 LDA $d600 
286e : 10 fb __ BPL $286b ; (main.l6292 + 0)
.s1309:
2870 : 8c 01 d6 STY $d601 
2873 : a9 18 __ LDA #$18
2875 : 8d 00 d6 STA $d600 
.l6294:
2878 : ad 00 d6 LDA $d600 
287b : 10 fb __ BPL $2878 ; (main.l6294 + 0)
.s1315:
287d : a9 18 __ LDA #$18
287f : 8d 00 d6 STA $d600 
2882 : ad 01 d6 LDA $d601 
2885 : 29 7f __ AND #$7f
2887 : aa __ __ TAX
.l6296:
2888 : ad 00 d6 LDA $d600 
288b : 10 fb __ BPL $2888 ; (main.l6296 + 0)
.s1321:
288d : 8e 01 d6 STX $d601 
2890 : a9 1e __ LDA #$1e
2892 : 8d 00 d6 STA $d600 
.l6298:
2895 : ad 00 d6 LDA $d600 
2898 : 10 fb __ BPL $2895 ; (main.l6298 + 0)
.s1326:
289a : a9 4f __ LDA #$4f
289c : 8d 01 d6 STA $d601 
289f : e6 4f __ INC T0 + 0 
28a1 : 4c b8 27 JMP $27b8 ; (main.l1250 + 0)
.s825:
28a4 : 0a __ __ ASL
28a5 : 85 1b __ STA ACCU + 0 
28a7 : a9 00 __ LDA #$00
28a9 : 2a __ __ ROL
28aa : 06 1b __ ASL ACCU + 0 
28ac : 2a __ __ ROL
28ad : aa __ __ TAX
28ae : a5 1b __ LDA ACCU + 0 
28b0 : 65 43 __ ADC T2 + 0 
28b2 : 85 44 __ STA T3 + 0 
28b4 : 8a __ __ TXA
28b5 : 69 00 __ ADC #$00
28b7 : 06 44 __ ASL T3 + 0 
28b9 : 2a __ __ ROL
28ba : 06 44 __ ASL T3 + 0 
28bc : 2a __ __ ROL
28bd : 06 44 __ ASL T3 + 0 
28bf : 2a __ __ ROL
28c0 : 06 44 __ ASL T3 + 0 
28c2 : 2a __ __ ROL
28c3 : aa __ __ TAX
28c4 : 18 __ __ CLC
28c5 : a5 44 __ LDA T3 + 0 
28c7 : 69 4b __ ADC #$4b
28c9 : 85 44 __ STA T3 + 0 
28cb : 90 01 __ BCC $28ce ; (main.s1482 + 0)
.s1481:
28cd : e8 __ __ INX
.s1482:
28ce : e0 07 __ CPX #$07
28d0 : d0 02 __ BNE $28d4 ; (main.s1161 + 0)
.s1160:
28d2 : c9 d0 __ CMP #$d0
.s1161:
28d4 : 90 04 __ BCC $28da ; (main.l6145 + 0)
.s831:
28d6 : a2 ff __ LDX #$ff
28d8 : 86 44 __ STX T3 + 0 
.l6145:
28da : ad 00 d6 LDA $d600 
28dd : 10 fb __ BPL $28da ; (main.l6145 + 0)
.s841:
28df : 8e 01 d6 STX $d601 
28e2 : a9 13 __ LDA #$13
28e4 : 8d 00 d6 STA $d600 
.l6147:
28e7 : ad 00 d6 LDA $d600 
28ea : 10 fb __ BPL $28e7 ; (main.l6147 + 0)
.s846:
28ec : a5 44 __ LDA T3 + 0 
28ee : 8d 01 d6 STA $d601 
28f1 : a9 1f __ LDA #$1f
28f3 : 8d 00 d6 STA $d600 
.l6149:
28f6 : ad 00 d6 LDA $d600 
28f9 : 10 fb __ BPL $28f6 ; (main.l6149 + 0)
.s850:
28fb : a9 61 __ LDA #$61
28fd : 8d 01 d6 STA $d601 
2900 : a9 12 __ LDA #$12
2902 : 8d 00 d6 STA $d600 
2905 : 8a __ __ TXA
2906 : 18 __ __ CLC
2907 : 69 08 __ ADC #$08
2909 : a8 __ __ TAY
.l6151:
290a : ad 00 d6 LDA $d600 
290d : 10 fb __ BPL $290a ; (main.l6151 + 0)
.s857:
290f : 8c 01 d6 STY $d601 
2912 : a9 13 __ LDA #$13
2914 : 8d 00 d6 STA $d600 
.l6153:
2917 : ad 00 d6 LDA $d600 
291a : 10 fb __ BPL $2917 ; (main.l6153 + 0)
.s862:
291c : a5 44 __ LDA T3 + 0 
291e : 8d 01 d6 STA $d601 
2921 : a9 1f __ LDA #$1f
2923 : 8d 00 d6 STA $d600 
.l6155:
2926 : ad 00 d6 LDA $d600 
2929 : 10 fb __ BPL $2926 ; (main.l6155 + 0)
.s866:
292b : a9 09 __ LDA #$09
292d : 8d 01 d6 STA $d601 
2930 : e6 43 __ INC T2 + 0 
2932 : 4c 7c 23 JMP $237c ; (main.l824 + 0)
.s176:
2935 : a9 22 __ LDA #$22
2937 : 8d 00 d6 STA $d600 
.l5956:
293a : ad 00 d6 LDA $d600 
293d : 10 fb __ BPL $293a ; (main.l5956 + 0)
.s185:
293f : a9 80 __ LDA #$80
2941 : 8d 01 d6 STA $d601 
2944 : a0 ff __ LDY #$ff
2946 : a2 00 __ LDX #$00
.l188:
2948 : a9 12 __ LDA #$12
294a : 8d 00 d6 STA $d600 
.l5958:
294d : ad 00 d6 LDA $d600 
2950 : 10 fb __ BPL $294d ; (main.l5958 + 0)
.s197:
2952 : 8e 01 d6 STX $d601 
2955 : a9 13 __ LDA #$13
2957 : 8d 00 d6 STA $d600 
.l5960:
295a : ad 00 d6 LDA $d600 
295d : 10 fb __ BPL $295a ; (main.l5960 + 0)
.s202:
295f : a9 00 __ LDA #$00
2961 : 8d 01 d6 STA $d601 
2964 : a9 1f __ LDA #$1f
2966 : 8d 00 d6 STA $d600 
.l5962:
2969 : ad 00 d6 LDA $d600 
296c : 10 fb __ BPL $2969 ; (main.l5962 + 0)
.s206:
296e : a9 00 __ LDA #$00
2970 : 8d 01 d6 STA $d601 
2973 : a9 18 __ LDA #$18
2975 : 8d 00 d6 STA $d600 
.l5964:
2978 : ad 00 d6 LDA $d600 
297b : 10 fb __ BPL $2978 ; (main.l5964 + 0)
.s212:
297d : ad 01 d6 LDA $d601 
2980 : 29 7f __ AND #$7f
2982 : 85 47 __ STA T5 + 0 
2984 : a9 18 __ LDA #$18
2986 : 8d 00 d6 STA $d600 
.l5966:
2989 : ad 00 d6 LDA $d600 
298c : 10 fb __ BPL $2989 ; (main.l5966 + 0)
.s218:
298e : a5 47 __ LDA T5 + 0 
2990 : 8d 01 d6 STA $d601 
2993 : a9 1e __ LDA #$1e
2995 : 8d 00 d6 STA $d600 
.l5968:
2998 : ad 00 d6 LDA $d600 
299b : 10 fb __ BPL $2998 ; (main.l5968 + 0)
.s223:
299d : a9 ff __ LDA #$ff
299f : 8d 01 d6 STA $d601 
29a2 : e8 __ __ INX
29a3 : 88 __ __ DEY
29a4 : d0 a2 __ BNE $2948 ; (main.l188 + 0)
.s190:
29a6 : a9 12 __ LDA #$12
29a8 : 8d 00 d6 STA $d600 
.l5971:
29ab : ad 00 d6 LDA $d600 
29ae : 10 fb __ BPL $29ab ; (main.l5971 + 0)
.s230:
29b0 : 8e 01 d6 STX $d601 
29b3 : a9 13 __ LDA #$13
29b5 : 8d 00 d6 STA $d600 
.l5973:
29b8 : ad 00 d6 LDA $d600 
29bb : 10 fb __ BPL $29b8 ; (main.l5973 + 0)
.s235:
29bd : 8c 01 d6 STY $d601 
29c0 : a9 1f __ LDA #$1f
29c2 : 8d 00 d6 STA $d600 
.l5975:
29c5 : ad 00 d6 LDA $d600 
29c8 : 10 fb __ BPL $29c5 ; (main.l5975 + 0)
.s239:
29ca : 8c 01 d6 STY $d601 
29cd : a9 18 __ LDA #$18
29cf : 8d 00 d6 STA $d600 
.l5977:
29d2 : ad 00 d6 LDA $d600 
29d5 : 10 fb __ BPL $29d2 ; (main.l5977 + 0)
.s245:
29d7 : ad 01 d6 LDA $d601 
29da : 29 7f __ AND #$7f
29dc : aa __ __ TAX
29dd : a9 18 __ LDA #$18
29df : 8d 00 d6 STA $d600 
.l5979:
29e2 : ad 00 d6 LDA $d600 
29e5 : 10 fb __ BPL $29e2 ; (main.l5979 + 0)
.s251:
29e7 : 8e 01 d6 STX $d601 
29ea : a9 1e __ LDA #$1e
29ec : 8d 00 d6 STA $d600 
.l5981:
29ef : ad 00 d6 LDA $d600 
29f2 : 10 fb __ BPL $29ef ; (main.l5981 + 0)
.s256:
29f4 : a9 ff __ LDA #$ff
29f6 : 8d 01 d6 STA $d601 
29f9 : a9 1c __ LDA #$1c
29fb : 8d 00 d6 STA $d600 
.l5983:
29fe : ad 00 d6 LDA $d600 
2a01 : 10 fb __ BPL $29fe ; (main.l5983 + 0)
.s262:
2a03 : ad 01 d6 LDA $d601 
2a06 : 09 10 __ ORA #$10
2a08 : aa __ __ TAX
2a09 : a9 1c __ LDA #$1c
2a0b : 8d 00 d6 STA $d600 
.l5985:
2a0e : ad 00 d6 LDA $d600 
2a11 : 10 fb __ BPL $2a0e ; (main.l5985 + 0)
.s268:
2a13 : 8e 01 d6 STX $d601 
2a16 : 20 06 2b JSR $2b06 ; (vdc_restore_charsets.s0 + 0)
2a19 : a9 00 __ LDA #$00
2a1b : 85 43 __ STA T2 + 0 
.l272:
2a1d : a9 12 __ LDA #$12
2a1f : 8d 00 d6 STA $d600 
2a22 : a5 43 __ LDA T2 + 0 
2a24 : 0a __ __ ASL
2a25 : 0a __ __ ASL
2a26 : 65 43 __ ADC T2 + 0 
2a28 : 0a __ __ ASL
2a29 : 0a __ __ ASL
2a2a : 85 44 __ STA T3 + 0 
2a2c : a9 00 __ LDA #$00
2a2e : 2a __ __ ROL
2a2f : 06 44 __ ASL T3 + 0 
2a31 : 2a __ __ ROL
2a32 : 06 44 __ ASL T3 + 0 
2a34 : 2a __ __ ROL
2a35 : 85 45 __ STA T3 + 1 
2a37 : ae 0b 36 LDX $360b ; (vdc_text_attr + 0)
.l5987:
2a3a : ad 00 d6 LDA $d600 
2a3d : 10 fb __ BPL $2a3a ; (main.l5987 + 0)
.s288:
2a3f : a5 45 __ LDA T3 + 1 
2a41 : 8d 01 d6 STA $d601 
2a44 : a9 13 __ LDA #$13
2a46 : 8d 00 d6 STA $d600 
.l5989:
2a49 : ad 00 d6 LDA $d600 
2a4c : 10 fb __ BPL $2a49 ; (main.l5989 + 0)
.s293:
2a4e : a5 44 __ LDA T3 + 0 
2a50 : 8d 01 d6 STA $d601 
2a53 : a9 1f __ LDA #$1f
2a55 : 8d 00 d6 STA $d600 
.l5991:
2a58 : ad 00 d6 LDA $d600 
2a5b : 10 fb __ BPL $2a58 ; (main.l5991 + 0)
.s297:
2a5d : a9 20 __ LDA #$20
2a5f : 8d 01 d6 STA $d601 
2a62 : a9 18 __ LDA #$18
2a64 : 8d 00 d6 STA $d600 
.l5993:
2a67 : ad 00 d6 LDA $d600 
2a6a : 10 fb __ BPL $2a67 ; (main.l5993 + 0)
.s303:
2a6c : ad 01 d6 LDA $d601 
2a6f : 29 7f __ AND #$7f
2a71 : a8 __ __ TAY
2a72 : a9 18 __ LDA #$18
2a74 : 8d 00 d6 STA $d600 
.l5995:
2a77 : ad 00 d6 LDA $d600 
2a7a : 10 fb __ BPL $2a77 ; (main.l5995 + 0)
.s309:
2a7c : 8c 01 d6 STY $d601 
2a7f : a9 1e __ LDA #$1e
2a81 : 8d 00 d6 STA $d600 
.l5997:
2a84 : ad 00 d6 LDA $d600 
2a87 : 10 fb __ BPL $2a84 ; (main.l5997 + 0)
.s314:
2a89 : a9 4f __ LDA #$4f
2a8b : 8d 01 d6 STA $d601 
2a8e : a9 12 __ LDA #$12
2a90 : 8d 00 d6 STA $d600 
2a93 : 18 __ __ CLC
2a94 : a5 45 __ LDA T3 + 1 
2a96 : 69 08 __ ADC #$08
2a98 : a8 __ __ TAY
.l5999:
2a99 : ad 00 d6 LDA $d600 
2a9c : 10 fb __ BPL $2a99 ; (main.l5999 + 0)
.s321:
2a9e : 8c 01 d6 STY $d601 
2aa1 : a9 13 __ LDA #$13
2aa3 : 8d 00 d6 STA $d600 
.l6001:
2aa6 : ad 00 d6 LDA $d600 
2aa9 : 10 fb __ BPL $2aa6 ; (main.l6001 + 0)
.s326:
2aab : a5 44 __ LDA T3 + 0 
2aad : 8d 01 d6 STA $d601 
2ab0 : a9 1f __ LDA #$1f
2ab2 : 8d 00 d6 STA $d600 
.l6003:
2ab5 : ad 00 d6 LDA $d600 
2ab8 : 10 fb __ BPL $2ab5 ; (main.l6003 + 0)
.s330:
2aba : 8e 01 d6 STX $d601 
2abd : a9 18 __ LDA #$18
2abf : 8d 00 d6 STA $d600 
.l6005:
2ac2 : ad 00 d6 LDA $d600 
2ac5 : 10 fb __ BPL $2ac2 ; (main.l6005 + 0)
.s336:
2ac7 : a9 18 __ LDA #$18
2ac9 : 8d 00 d6 STA $d600 
2acc : ad 01 d6 LDA $d601 
2acf : 29 7f __ AND #$7f
2ad1 : aa __ __ TAX
.l6007:
2ad2 : ad 00 d6 LDA $d600 
2ad5 : 10 fb __ BPL $2ad2 ; (main.l6007 + 0)
.s342:
2ad7 : 8e 01 d6 STX $d601 
2ada : a9 1e __ LDA #$1e
2adc : 8d 00 d6 STA $d600 
.l6009:
2adf : ad 00 d6 LDA $d600 
2ae2 : 10 fb __ BPL $2adf ; (main.l6009 + 0)
.s347:
2ae4 : a9 4f __ LDA #$4f
2ae6 : 8d 01 d6 STA $d601 
2ae9 : e6 43 __ INC T2 + 0 
2aeb : a5 43 __ LDA T2 + 0 
2aed : c9 19 __ CMP #$19
2aef : b0 03 __ BCS $2af4 ; (main.s269 + 0)
2af1 : 4c 1d 2a JMP $2a1d ; (main.l272 + 0)
.s269:
2af4 : a9 22 __ LDA #$22
2af6 : 8d 00 d6 STA $d600 
.l6011:
2af9 : ad 00 d6 LDA $d600 
2afc : 10 fb __ BPL $2af9 ; (main.l6011 + 0)
.s353:
2afe : a9 7d __ LDA #$7d
2b00 : 8d 01 d6 STA $d601 
2b03 : 4c 75 1e JMP $1e75 ; (main.s6013 + 0)
--------------------------------------------------------------------
vdc_text_attr:
360b : __ __ __ BYT 8d                                              : .
--------------------------------------------------------------------
vdc_memsize:
360c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
2b06 : 20 62 ff JSR $ff62 
.s1001:
2b09 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
2b0a : a2 03 __ LDX #$03
2b0c : b5 53 __ LDA T8 + 0,x 
2b0e : 9d b2 bf STA $bfb2,x ; (printf@stack + 0)
2b11 : ca __ __ DEX
2b12 : 10 f8 __ BPL $2b0c ; (printf.s1000 + 2)
.s0:
2b14 : 18 __ __ CLC
2b15 : a5 23 __ LDA SP + 0 
2b17 : 69 04 __ ADC #$04
2b19 : 85 47 __ STA T0 + 0 
2b1b : a5 24 __ LDA SP + 1 
2b1d : 69 00 __ ADC #$00
2b1f : 85 48 __ STA T0 + 1 
2b21 : a9 00 __ LDA #$00
2b23 : 85 49 __ STA T2 + 0 
2b25 : a0 02 __ LDY #$02
2b27 : b1 23 __ LDA (SP + 0),y 
2b29 : 85 4a __ STA T3 + 0 
2b2b : c8 __ __ INY
2b2c : b1 23 __ LDA (SP + 0),y 
2b2e : 85 4b __ STA T3 + 1 
.l2:
2b30 : a0 00 __ LDY #$00
2b32 : b1 4a __ LDA (T3 + 0),y 
2b34 : d0 1e __ BNE $2b54 ; (printf.s3 + 0)
.s4:
2b36 : a6 49 __ LDX T2 + 0 
2b38 : 9d be bf STA $bfbe,x ; (buff + 0)
2b3b : 8a __ __ TXA
2b3c : f0 0b __ BEQ $2b49 ; (printf.s1001 + 0)
.s108:
2b3e : a9 be __ LDA #$be
2b40 : 85 0d __ STA P0 ; (fmt + 0)
2b42 : a9 bf __ LDA #$bf
2b44 : 85 0e __ STA P1 ; (fmt + 1)
2b46 : 20 40 2e JSR $2e40 ; (puts.s0 + 0)
.s1001:
2b49 : a2 03 __ LDX #$03
2b4b : bd b2 bf LDA $bfb2,x ; (printf@stack + 0)
2b4e : 95 53 __ STA T8 + 0,x 
2b50 : ca __ __ DEX
2b51 : 10 f8 __ BPL $2b4b ; (printf.s1001 + 2)
2b53 : 60 __ __ RTS
.s3:
2b54 : c9 25 __ CMP #$25
2b56 : f0 28 __ BEQ $2b80 ; (printf.s5 + 0)
.s6:
2b58 : a6 49 __ LDX T2 + 0 
2b5a : 9d be bf STA $bfbe,x ; (buff + 0)
2b5d : e6 4a __ INC T3 + 0 
2b5f : d0 02 __ BNE $2b63 ; (printf.s1080 + 0)
.s1079:
2b61 : e6 4b __ INC T3 + 1 
.s1080:
2b63 : e8 __ __ INX
2b64 : 86 49 __ STX T2 + 0 
2b66 : e0 28 __ CPX #$28
2b68 : 90 c6 __ BCC $2b30 ; (printf.l2 + 0)
.s102:
2b6a : a9 be __ LDA #$be
2b6c : 85 0d __ STA P0 ; (fmt + 0)
2b6e : a9 bf __ LDA #$bf
2b70 : 85 0e __ STA P1 ; (fmt + 1)
2b72 : 98 __ __ TYA
2b73 : 9d be bf STA $bfbe,x ; (buff + 0)
2b76 : 20 40 2e JSR $2e40 ; (puts.s0 + 0)
2b79 : a9 00 __ LDA #$00
.s1050:
2b7b : 85 49 __ STA T2 + 0 
2b7d : 4c 30 2b JMP $2b30 ; (printf.l2 + 0)
.s5:
2b80 : a5 49 __ LDA T2 + 0 
2b82 : f0 15 __ BEQ $2b99 ; (printf.s10 + 0)
.s8:
2b84 : a9 be __ LDA #$be
2b86 : 85 0d __ STA P0 ; (fmt + 0)
2b88 : a9 bf __ LDA #$bf
2b8a : 85 0e __ STA P1 ; (fmt + 1)
2b8c : 98 __ __ TYA
2b8d : a6 49 __ LDX T2 + 0 
2b8f : 9d be bf STA $bfbe,x ; (buff + 0)
2b92 : 20 40 2e JSR $2e40 ; (puts.s0 + 0)
2b95 : a9 00 __ LDA #$00
2b97 : 85 49 __ STA T2 + 0 
.s10:
2b99 : a9 0a __ LDA #$0a
2b9b : 8d b9 bf STA $bfb9 ; (si + 3)
2b9e : a9 00 __ LDA #$00
2ba0 : 8d ba bf STA $bfba ; (si + 4)
2ba3 : 8d bb bf STA $bfbb ; (si + 5)
2ba6 : 8d bc bf STA $bfbc ; (si + 6)
2ba9 : 8d bd bf STA $bfbd ; (si + 7)
2bac : a0 01 __ LDY #$01
2bae : b1 4a __ LDA (T3 + 0),y 
2bb0 : aa __ __ TAX
2bb1 : a9 20 __ LDA #$20
2bb3 : 8d b6 bf STA $bfb6 ; (si + 0)
2bb6 : a9 00 __ LDA #$00
2bb8 : 8d b7 bf STA $bfb7 ; (si + 1)
2bbb : a9 ff __ LDA #$ff
2bbd : 8d b8 bf STA $bfb8 ; (si + 2)
2bc0 : 18 __ __ CLC
2bc1 : a5 4a __ LDA T3 + 0 
2bc3 : 69 02 __ ADC #$02
.l15:
2bc5 : 85 4a __ STA T3 + 0 
2bc7 : 90 02 __ BCC $2bcb ; (printf.s1062 + 0)
.s1061:
2bc9 : e6 4b __ INC T3 + 1 
.s1062:
2bcb : 8a __ __ TXA
2bcc : e0 2b __ CPX #$2b
2bce : d0 08 __ BNE $2bd8 ; (printf.s18 + 0)
.s17:
2bd0 : a9 01 __ LDA #$01
2bd2 : 8d bb bf STA $bfbb ; (si + 5)
2bd5 : 4c 33 2e JMP $2e33 ; (printf.s210 + 0)
.s18:
2bd8 : c9 30 __ CMP #$30
2bda : d0 06 __ BNE $2be2 ; (printf.s21 + 0)
.s20:
2bdc : 8d b6 bf STA $bfb6 ; (si + 0)
2bdf : 4c 33 2e JMP $2e33 ; (printf.s210 + 0)
.s21:
2be2 : e0 23 __ CPX #$23
2be4 : d0 08 __ BNE $2bee ; (printf.s24 + 0)
.s23:
2be6 : a9 01 __ LDA #$01
2be8 : 8d bd bf STA $bfbd ; (si + 7)
2beb : 4c 33 2e JMP $2e33 ; (printf.s210 + 0)
.s24:
2bee : e0 2d __ CPX #$2d
2bf0 : d0 08 __ BNE $2bfa ; (printf.s16 + 0)
.s26:
2bf2 : a9 01 __ LDA #$01
2bf4 : 8d bc bf STA $bfbc ; (si + 6)
2bf7 : 4c 33 2e JMP $2e33 ; (printf.s210 + 0)
.s16:
2bfa : 86 4c __ STX T4 + 0 
2bfc : e0 30 __ CPX #$30
2bfe : 90 53 __ BCC $2c53 ; (printf.s32 + 0)
.s33:
2c00 : e0 3a __ CPX #$3a
2c02 : b0 4f __ BCS $2c53 ; (printf.s32 + 0)
.s30:
2c04 : a9 00 __ LDA #$00
2c06 : 85 4d __ STA T6 + 0 
2c08 : 85 4e __ STA T6 + 1 
2c0a : e0 3a __ CPX #$3a
2c0c : b0 40 __ BCS $2c4e ; (printf.s36 + 0)
.l35:
2c0e : a5 4d __ LDA T6 + 0 
2c10 : 0a __ __ ASL
2c11 : 85 1b __ STA ACCU + 0 
2c13 : a5 4e __ LDA T6 + 1 
2c15 : 2a __ __ ROL
2c16 : 06 1b __ ASL ACCU + 0 
2c18 : 2a __ __ ROL
2c19 : aa __ __ TAX
2c1a : 18 __ __ CLC
2c1b : a5 1b __ LDA ACCU + 0 
2c1d : 65 4d __ ADC T6 + 0 
2c1f : 85 4d __ STA T6 + 0 
2c21 : 8a __ __ TXA
2c22 : 65 4e __ ADC T6 + 1 
2c24 : 06 4d __ ASL T6 + 0 
2c26 : 2a __ __ ROL
2c27 : aa __ __ TAX
2c28 : 18 __ __ CLC
2c29 : a5 4d __ LDA T6 + 0 
2c2b : 65 4c __ ADC T4 + 0 
2c2d : 90 01 __ BCC $2c30 ; (printf.s1076 + 0)
.s1075:
2c2f : e8 __ __ INX
.s1076:
2c30 : 38 __ __ SEC
2c31 : e9 30 __ SBC #$30
2c33 : 85 4d __ STA T6 + 0 
2c35 : 8a __ __ TXA
2c36 : e9 00 __ SBC #$00
2c38 : 85 4e __ STA T6 + 1 
2c3a : a0 00 __ LDY #$00
2c3c : b1 4a __ LDA (T3 + 0),y 
2c3e : 85 4c __ STA T4 + 0 
2c40 : e6 4a __ INC T3 + 0 
2c42 : d0 02 __ BNE $2c46 ; (printf.s1078 + 0)
.s1077:
2c44 : e6 4b __ INC T3 + 1 
.s1078:
2c46 : c9 30 __ CMP #$30
2c48 : 90 04 __ BCC $2c4e ; (printf.s36 + 0)
.s37:
2c4a : c9 3a __ CMP #$3a
2c4c : 90 c0 __ BCC $2c0e ; (printf.l35 + 0)
.s36:
2c4e : a5 4d __ LDA T6 + 0 
2c50 : 8d b7 bf STA $bfb7 ; (si + 1)
.s32:
2c53 : a5 4c __ LDA T4 + 0 
2c55 : c9 2e __ CMP #$2e
2c57 : d0 51 __ BNE $2caa ; (printf.s40 + 0)
.s38:
2c59 : a9 00 __ LDA #$00
2c5b : 85 4d __ STA T6 + 0 
.l195:
2c5d : 85 4e __ STA T6 + 1 
2c5f : a0 00 __ LDY #$00
2c61 : b1 4a __ LDA (T3 + 0),y 
2c63 : 85 4c __ STA T4 + 0 
2c65 : e6 4a __ INC T3 + 0 
2c67 : d0 02 __ BNE $2c6b ; (printf.s1064 + 0)
.s1063:
2c69 : e6 4b __ INC T3 + 1 
.s1064:
2c6b : c9 30 __ CMP #$30
2c6d : 90 04 __ BCC $2c73 ; (printf.s43 + 0)
.s44:
2c6f : c9 3a __ CMP #$3a
2c71 : 90 0a __ BCC $2c7d ; (printf.s42 + 0)
.s43:
2c73 : a5 4d __ LDA T6 + 0 
2c75 : 8d b8 bf STA $bfb8 ; (si + 2)
2c78 : a5 4c __ LDA T4 + 0 
2c7a : 4c aa 2c JMP $2caa ; (printf.s40 + 0)
.s42:
2c7d : a5 4d __ LDA T6 + 0 
2c7f : 0a __ __ ASL
2c80 : 85 1b __ STA ACCU + 0 
2c82 : a5 4e __ LDA T6 + 1 
2c84 : 2a __ __ ROL
2c85 : 06 1b __ ASL ACCU + 0 
2c87 : 2a __ __ ROL
2c88 : aa __ __ TAX
2c89 : 18 __ __ CLC
2c8a : a5 1b __ LDA ACCU + 0 
2c8c : 65 4d __ ADC T6 + 0 
2c8e : 85 4d __ STA T6 + 0 
2c90 : 8a __ __ TXA
2c91 : 65 4e __ ADC T6 + 1 
2c93 : 06 4d __ ASL T6 + 0 
2c95 : 2a __ __ ROL
2c96 : aa __ __ TAX
2c97 : 18 __ __ CLC
2c98 : a5 4d __ LDA T6 + 0 
2c9a : 65 4c __ ADC T4 + 0 
2c9c : 90 01 __ BCC $2c9f ; (printf.s1074 + 0)
.s1073:
2c9e : e8 __ __ INX
.s1074:
2c9f : 38 __ __ SEC
2ca0 : e9 30 __ SBC #$30
2ca2 : 85 4d __ STA T6 + 0 
2ca4 : 8a __ __ TXA
2ca5 : e9 00 __ SBC #$00
2ca7 : 4c 5d 2c JMP $2c5d ; (printf.l195 + 0)
.s40:
2caa : c9 64 __ CMP #$64
2cac : d0 05 __ BNE $2cb3 ; (printf.s46 + 0)
.s45:
2cae : a9 01 __ LDA #$01
2cb0 : 4c 0c 2e JMP $2e0c ; (printf.s211 + 0)
.s46:
2cb3 : c9 75 __ CMP #$75
2cb5 : d0 03 __ BNE $2cba ; (printf.s49 + 0)
2cb7 : 4c 0a 2e JMP $2e0a ; (printf.s232 + 0)
.s49:
2cba : c9 78 __ CMP #$78
2cbc : d0 0d __ BNE $2ccb ; (printf.s52 + 0)
.s51:
2cbe : a9 10 __ LDA #$10
2cc0 : 8d b9 bf STA $bfb9 ; (si + 3)
2cc3 : a9 00 __ LDA #$00
2cc5 : 8d ba bf STA $bfba ; (si + 4)
2cc8 : 4c 0a 2e JMP $2e0a ; (printf.s232 + 0)
.s52:
2ccb : c9 6c __ CMP #$6c
2ccd : d0 03 __ BNE $2cd2 ; (printf.s55 + 0)
2ccf : 4c 98 2d JMP $2d98 ; (printf.s54 + 0)
.s55:
2cd2 : c9 73 __ CMP #$73
2cd4 : f0 31 __ BEQ $2d07 ; (printf.s66 + 0)
.s67:
2cd6 : c9 63 __ CMP #$63
2cd8 : f0 11 __ BEQ $2ceb ; (printf.s96 + 0)
.s97:
2cda : 09 00 __ ORA #$00
2cdc : d0 03 __ BNE $2ce1 ; (printf.s99 + 0)
2cde : 4c 30 2b JMP $2b30 ; (printf.l2 + 0)
.s99:
2ce1 : a6 49 __ LDX T2 + 0 
2ce3 : 9d be bf STA $bfbe,x ; (buff + 0)
2ce6 : e6 49 __ INC T2 + 0 
2ce8 : 4c 30 2b JMP $2b30 ; (printf.l2 + 0)
.s96:
2ceb : a0 00 __ LDY #$00
2ced : b1 47 __ LDA (T0 + 0),y 
2cef : a6 49 __ LDX T2 + 0 
2cf1 : 9d be bf STA $bfbe,x ; (buff + 0)
2cf4 : e6 49 __ INC T2 + 0 
.s208:
2cf6 : 18 __ __ CLC
2cf7 : a5 47 __ LDA T0 + 0 
2cf9 : 69 02 __ ADC #$02
2cfb : 85 47 __ STA T0 + 0 
2cfd : b0 03 __ BCS $2d02 ; (printf.s1065 + 0)
2cff : 4c 30 2b JMP $2b30 ; (printf.l2 + 0)
.s1065:
2d02 : e6 48 __ INC T0 + 1 
2d04 : 4c 30 2b JMP $2b30 ; (printf.l2 + 0)
.s66:
2d07 : a0 00 __ LDY #$00
2d09 : 84 4c __ STY T4 + 0 
2d0b : b1 47 __ LDA (T0 + 0),y 
2d0d : 85 4d __ STA T6 + 0 
2d0f : c8 __ __ INY
2d10 : b1 47 __ LDA (T0 + 0),y 
2d12 : 85 4e __ STA T6 + 1 
2d14 : 18 __ __ CLC
2d15 : a5 47 __ LDA T0 + 0 
2d17 : 69 02 __ ADC #$02
2d19 : 85 47 __ STA T0 + 0 
2d1b : 90 02 __ BCC $2d1f ; (printf.s1072 + 0)
.s1071:
2d1d : e6 48 __ INC T0 + 1 
.s1072:
2d1f : ad b7 bf LDA $bfb7 ; (si + 1)
2d22 : f0 0d __ BEQ $2d31 ; (printf.s71 + 0)
.s1053:
2d24 : a0 00 __ LDY #$00
2d26 : b1 4d __ LDA (T6 + 0),y 
2d28 : f0 05 __ BEQ $2d2f ; (printf.s1054 + 0)
.l73:
2d2a : c8 __ __ INY
2d2b : b1 4d __ LDA (T6 + 0),y 
2d2d : d0 fb __ BNE $2d2a ; (printf.l73 + 0)
.s1054:
2d2f : 84 4c __ STY T4 + 0 
.s71:
2d31 : ad bc bf LDA $bfbc ; (si + 6)
2d34 : d0 1a __ BNE $2d50 ; (printf.s77 + 0)
.s1057:
2d36 : a4 4c __ LDY T4 + 0 
2d38 : cc b7 bf CPY $bfb7 ; (si + 1)
2d3b : a6 49 __ LDX T2 + 0 
2d3d : b0 0d __ BCS $2d4c ; (printf.s1058 + 0)
.l79:
2d3f : ad b6 bf LDA $bfb6 ; (si + 0)
2d42 : 9d be bf STA $bfbe,x ; (buff + 0)
2d45 : c8 __ __ INY
2d46 : cc b7 bf CPY $bfb7 ; (si + 1)
2d49 : e8 __ __ INX
2d4a : 90 f3 __ BCC $2d3f ; (printf.l79 + 0)
.s1058:
2d4c : 86 49 __ STX T2 + 0 
2d4e : 84 4c __ STY T4 + 0 
.s77:
2d50 : a5 49 __ LDA T2 + 0 
2d52 : f0 16 __ BEQ $2d6a ; (printf.s202 + 0)
.s84:
2d54 : a9 be __ LDA #$be
2d56 : 85 0d __ STA P0 ; (fmt + 0)
2d58 : a9 bf __ LDA #$bf
2d5a : 85 0e __ STA P1 ; (fmt + 1)
2d5c : a9 00 __ LDA #$00
2d5e : a6 49 __ LDX T2 + 0 
2d60 : 9d be bf STA $bfbe,x ; (buff + 0)
2d63 : 20 40 2e JSR $2e40 ; (puts.s0 + 0)
2d66 : a9 00 __ LDA #$00
2d68 : 85 49 __ STA T2 + 0 
.s202:
2d6a : a5 4d __ LDA T6 + 0 
2d6c : 85 0d __ STA P0 ; (fmt + 0)
2d6e : a5 4e __ LDA T6 + 1 
2d70 : 85 0e __ STA P1 ; (fmt + 1)
2d72 : 20 40 2e JSR $2e40 ; (puts.s0 + 0)
2d75 : ad bc bf LDA $bfbc ; (si + 6)
2d78 : d0 03 __ BNE $2d7d ; (printf.s1055 + 0)
2d7a : 4c 30 2b JMP $2b30 ; (printf.l2 + 0)
.s1055:
2d7d : a4 4c __ LDY T4 + 0 
2d7f : cc b7 bf CPY $bfb7 ; (si + 1)
2d82 : a2 00 __ LDX #$00
2d84 : b0 0d __ BCS $2d93 ; (printf.s1056 + 0)
.l94:
2d86 : ad b6 bf LDA $bfb6 ; (si + 0)
2d89 : 9d be bf STA $bfbe,x ; (buff + 0)
2d8c : c8 __ __ INY
2d8d : cc b7 bf CPY $bfb7 ; (si + 1)
2d90 : e8 __ __ INX
2d91 : 90 f3 __ BCC $2d86 ; (printf.l94 + 0)
.s1056:
2d93 : 86 49 __ STX T2 + 0 
2d95 : 4c 30 2b JMP $2b30 ; (printf.l2 + 0)
.s54:
2d98 : a0 00 __ LDY #$00
2d9a : b1 47 __ LDA (T0 + 0),y 
2d9c : 85 53 __ STA T8 + 0 
2d9e : c8 __ __ INY
2d9f : b1 47 __ LDA (T0 + 0),y 
2da1 : 85 54 __ STA T8 + 1 
2da3 : c8 __ __ INY
2da4 : b1 47 __ LDA (T0 + 0),y 
2da6 : 85 55 __ STA T8 + 2 
2da8 : c8 __ __ INY
2da9 : b1 47 __ LDA (T0 + 0),y 
2dab : 85 56 __ STA T8 + 3 
2dad : 18 __ __ CLC
2dae : a5 47 __ LDA T0 + 0 
2db0 : 69 04 __ ADC #$04
2db2 : 85 47 __ STA T0 + 0 
2db4 : 90 02 __ BCC $2db8 ; (printf.s1068 + 0)
.s1067:
2db6 : e6 48 __ INC T0 + 1 
.s1068:
2db8 : a0 00 __ LDY #$00
2dba : b1 4a __ LDA (T3 + 0),y 
2dbc : aa __ __ TAX
2dbd : e6 4a __ INC T3 + 0 
2dbf : d0 02 __ BNE $2dc3 ; (printf.s1070 + 0)
.s1069:
2dc1 : e6 4b __ INC T3 + 1 
.s1070:
2dc3 : 8a __ __ TXA
2dc4 : e0 64 __ CPX #$64
2dc6 : d0 04 __ BNE $2dcc ; (printf.s58 + 0)
.s57:
2dc8 : a9 01 __ LDA #$01
2dca : d0 14 __ BNE $2de0 ; (printf.s209 + 0)
.s58:
2dcc : c9 75 __ CMP #$75
2dce : f0 0f __ BEQ $2ddf ; (printf.s231 + 0)
.s61:
2dd0 : c9 78 __ CMP #$78
2dd2 : f0 03 __ BEQ $2dd7 ; (printf.s63 + 0)
2dd4 : 4c 30 2b JMP $2b30 ; (printf.l2 + 0)
.s63:
2dd7 : 8c ba bf STY $bfba ; (si + 4)
2dda : a9 10 __ LDA #$10
2ddc : 8d b9 bf STA $bfb9 ; (si + 3)
.s231:
2ddf : 98 __ __ TYA
.s209:
2de0 : 85 15 __ STA P8 
2de2 : a9 be __ LDA #$be
2de4 : 85 0f __ STA P2 ; (fmt + 2)
2de6 : a9 bf __ LDA #$bf
2de8 : 85 10 __ STA P3 ; (fmt + 3)
2dea : a5 53 __ LDA T8 + 0 
2dec : 85 11 __ STA P4 
2dee : a5 54 __ LDA T8 + 1 
2df0 : 85 12 __ STA P5 
2df2 : a5 55 __ LDA T8 + 2 
2df4 : 85 13 __ STA P6 
2df6 : a5 56 __ LDA T8 + 3 
2df8 : 85 14 __ STA P7 
2dfa : a9 b6 __ LDA #$b6
2dfc : 85 0d __ STA P0 ; (fmt + 0)
2dfe : a9 bf __ LDA #$bf
2e00 : 85 0e __ STA P1 ; (fmt + 1)
2e02 : 20 cc 2f JSR $2fcc ; (nforml.s0 + 0)
2e05 : a5 1b __ LDA ACCU + 0 
2e07 : 4c 7b 2b JMP $2b7b ; (printf.s1050 + 0)
.s232:
2e0a : a9 00 __ LDA #$00
.s211:
2e0c : 85 13 __ STA P6 
2e0e : a9 be __ LDA #$be
2e10 : 85 0f __ STA P2 ; (fmt + 2)
2e12 : a9 bf __ LDA #$bf
2e14 : 85 10 __ STA P3 ; (fmt + 3)
2e16 : a0 00 __ LDY #$00
2e18 : b1 47 __ LDA (T0 + 0),y 
2e1a : 85 11 __ STA P4 
2e1c : c8 __ __ INY
2e1d : b1 47 __ LDA (T0 + 0),y 
2e1f : 85 12 __ STA P5 
2e21 : a9 b6 __ LDA #$b6
2e23 : 85 0d __ STA P0 ; (fmt + 0)
2e25 : a9 bf __ LDA #$bf
2e27 : 85 0e __ STA P1 ; (fmt + 1)
2e29 : 20 95 2e JSR $2e95 ; (nformi.s0 + 0)
2e2c : a5 1b __ LDA ACCU + 0 
2e2e : 85 49 __ STA T2 + 0 
2e30 : 4c f6 2c JMP $2cf6 ; (printf.s208 + 0)
.s210:
2e33 : a0 00 __ LDY #$00
2e35 : b1 4a __ LDA (T3 + 0),y 
2e37 : aa __ __ TAX
2e38 : 18 __ __ CLC
2e39 : a5 4a __ LDA T3 + 0 
2e3b : 69 01 __ ADC #$01
2e3d : 4c c5 2b JMP $2bc5 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
2e40 : a0 00 __ LDY #$00
2e42 : b1 0d __ LDA (P0),y 
2e44 : f0 0b __ BEQ $2e51 ; (puts.s1001 + 0)
2e46 : 20 52 2e JSR $2e52 ; (putpch + 0)
2e49 : e6 0d __ INC P0 
2e4b : d0 f3 __ BNE $2e40 ; (puts.s0 + 0)
2e4d : e6 0e __ INC P1 
2e4f : d0 ef __ BNE $2e40 ; (puts.s0 + 0)
.s1001:
2e51 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
2e52 : ae 0d 36 LDX $360d ; (giocharmap + 0)
2e55 : e0 01 __ CPX #$01
2e57 : 90 26 __ BCC $2e7f ; (putpch + 45)
2e59 : c9 0a __ CMP #$0a
2e5b : d0 02 __ BNE $2e5f ; (putpch + 13)
2e5d : a9 0d __ LDA #$0d
2e5f : c9 09 __ CMP #$09
2e61 : f0 1f __ BEQ $2e82 ; (putpch + 48)
2e63 : e0 02 __ CPX #$02
2e65 : 90 18 __ BCC $2e7f ; (putpch + 45)
2e67 : c9 41 __ CMP #$41
2e69 : 90 14 __ BCC $2e7f ; (putpch + 45)
2e6b : c9 7b __ CMP #$7b
2e6d : b0 10 __ BCS $2e7f ; (putpch + 45)
2e6f : c9 61 __ CMP #$61
2e71 : b0 04 __ BCS $2e77 ; (putpch + 37)
2e73 : c9 5b __ CMP #$5b
2e75 : b0 08 __ BCS $2e7f ; (putpch + 45)
2e77 : 49 20 __ EOR #$20
2e79 : e0 03 __ CPX #$03
2e7b : f0 02 __ BEQ $2e7f ; (putpch + 45)
2e7d : 29 df __ AND #$df
2e7f : 4c d2 ff JMP $ffd2 
2e82 : 38 __ __ SEC
2e83 : 20 f0 ff JSR $fff0 
2e86 : 98 __ __ TYA
2e87 : 29 03 __ AND #$03
2e89 : 49 03 __ EOR #$03
2e8b : aa __ __ TAX
2e8c : a9 20 __ LDA #$20
2e8e : 20 d2 ff JSR $ffd2 
2e91 : ca __ __ DEX
2e92 : 10 fa __ BPL $2e8e ; (putpch + 60)
2e94 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
360d : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
2e95 : a9 00 __ LDA #$00
2e97 : 85 43 __ STA T0 + 0 
2e99 : a5 13 __ LDA P6 ; (s + 0)
2e9b : f0 13 __ BEQ $2eb0 ; (nformi.s169 + 0)
.s4:
2e9d : a5 12 __ LDA P5 ; (v + 1)
2e9f : 10 0f __ BPL $2eb0 ; (nformi.s169 + 0)
.s1:
2ea1 : 38 __ __ SEC
2ea2 : a9 00 __ LDA #$00
2ea4 : e5 11 __ SBC P4 ; (v + 0)
2ea6 : 85 11 __ STA P4 ; (v + 0)
2ea8 : a9 00 __ LDA #$00
2eaa : e5 12 __ SBC P5 ; (v + 1)
2eac : 85 12 __ STA P5 ; (v + 1)
2eae : e6 43 __ INC T0 + 0 
.s169:
2eb0 : a9 10 __ LDA #$10
2eb2 : 85 44 __ STA T2 + 0 
2eb4 : a5 11 __ LDA P4 ; (v + 0)
2eb6 : 05 12 __ ORA P5 ; (v + 1)
2eb8 : f0 46 __ BEQ $2f00 ; (nformi.s7 + 0)
.s42:
2eba : a0 03 __ LDY #$03
2ebc : b1 0d __ LDA (P0),y ; (si + 0)
2ebe : 85 45 __ STA T4 + 0 
2ec0 : c8 __ __ INY
2ec1 : b1 0d __ LDA (P0),y ; (si + 0)
2ec3 : 85 46 __ STA T4 + 1 
.l6:
2ec5 : a5 11 __ LDA P4 ; (v + 0)
2ec7 : 85 1b __ STA ACCU + 0 
2ec9 : a5 12 __ LDA P5 ; (v + 1)
2ecb : 85 1c __ STA ACCU + 1 
2ecd : a5 45 __ LDA T4 + 0 
2ecf : 85 03 __ STA WORK + 0 
2ed1 : a5 46 __ LDA T4 + 1 
2ed3 : 85 04 __ STA WORK + 1 
2ed5 : 20 ef 34 JSR $34ef ; (divmod + 0)
2ed8 : a5 06 __ LDA WORK + 3 
2eda : 30 08 __ BMI $2ee4 ; (nformi.s78 + 0)
.s1019:
2edc : d0 0a __ BNE $2ee8 ; (nformi.s77 + 0)
.s1018:
2ede : a5 05 __ LDA WORK + 2 
2ee0 : c9 0a __ CMP #$0a
2ee2 : b0 04 __ BCS $2ee8 ; (nformi.s77 + 0)
.s78:
2ee4 : a9 30 __ LDA #$30
2ee6 : d0 02 __ BNE $2eea ; (nformi.s79 + 0)
.s77:
2ee8 : a9 37 __ LDA #$37
.s79:
2eea : 18 __ __ CLC
2eeb : 65 05 __ ADC WORK + 2 
2eed : c6 44 __ DEC T2 + 0 
2eef : a6 44 __ LDX T2 + 0 
2ef1 : 9d f0 bf STA $bff0,x ; (buffer + 0)
2ef4 : a5 1b __ LDA ACCU + 0 
2ef6 : 85 11 __ STA P4 ; (v + 0)
2ef8 : a5 1c __ LDA ACCU + 1 
2efa : 85 12 __ STA P5 ; (v + 1)
2efc : 05 11 __ ORA P4 ; (v + 0)
2efe : d0 c5 __ BNE $2ec5 ; (nformi.l6 + 0)
.s7:
2f00 : a0 02 __ LDY #$02
2f02 : b1 0d __ LDA (P0),y ; (si + 0)
2f04 : c9 ff __ CMP #$ff
2f06 : d0 04 __ BNE $2f0c ; (nformi.s80 + 0)
.s81:
2f08 : a9 0f __ LDA #$0f
2f0a : d0 05 __ BNE $2f11 ; (nformi.s1026 + 0)
.s80:
2f0c : 38 __ __ SEC
2f0d : a9 10 __ LDA #$10
2f0f : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
2f11 : a8 __ __ TAY
2f12 : c4 44 __ CPY T2 + 0 
2f14 : b0 0d __ BCS $2f23 ; (nformi.s10 + 0)
.s9:
2f16 : a9 30 __ LDA #$30
.l1027:
2f18 : c6 44 __ DEC T2 + 0 
2f1a : a6 44 __ LDX T2 + 0 
2f1c : 9d f0 bf STA $bff0,x ; (buffer + 0)
2f1f : c4 44 __ CPY T2 + 0 
2f21 : 90 f5 __ BCC $2f18 ; (nformi.l1027 + 0)
.s10:
2f23 : a0 07 __ LDY #$07
2f25 : b1 0d __ LDA (P0),y ; (si + 0)
2f27 : f0 20 __ BEQ $2f49 ; (nformi.s13 + 0)
.s14:
2f29 : a0 04 __ LDY #$04
2f2b : b1 0d __ LDA (P0),y ; (si + 0)
2f2d : d0 1a __ BNE $2f49 ; (nformi.s13 + 0)
.s1013:
2f2f : 88 __ __ DEY
2f30 : b1 0d __ LDA (P0),y ; (si + 0)
2f32 : c9 10 __ CMP #$10
2f34 : d0 13 __ BNE $2f49 ; (nformi.s13 + 0)
.s11:
2f36 : a9 58 __ LDA #$58
2f38 : a6 44 __ LDX T2 + 0 
2f3a : 9d ef bf STA $bfef,x ; (buff + 49)
2f3d : 8a __ __ TXA
2f3e : 18 __ __ CLC
2f3f : 69 fe __ ADC #$fe
2f41 : 85 44 __ STA T2 + 0 
2f43 : aa __ __ TAX
2f44 : a9 30 __ LDA #$30
2f46 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
2f49 : a9 00 __ LDA #$00
2f4b : 85 1b __ STA ACCU + 0 
2f4d : a5 43 __ LDA T0 + 0 
2f4f : f0 06 __ BEQ $2f57 ; (nformi.s16 + 0)
.s15:
2f51 : c6 44 __ DEC T2 + 0 
2f53 : a9 2d __ LDA #$2d
2f55 : d0 0a __ BNE $2f61 ; (nformi.s1025 + 0)
.s16:
2f57 : a0 05 __ LDY #$05
2f59 : b1 0d __ LDA (P0),y ; (si + 0)
2f5b : f0 09 __ BEQ $2f66 ; (nformi.s151 + 0)
.s18:
2f5d : c6 44 __ DEC T2 + 0 
2f5f : a9 2b __ LDA #$2b
.s1025:
2f61 : a6 44 __ LDX T2 + 0 
2f63 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s151:
2f66 : a0 06 __ LDY #$06
2f68 : b1 0d __ LDA (P0),y ; (si + 0)
2f6a : d0 34 __ BNE $2fa0 ; (nformi.s24 + 0)
.l30:
2f6c : a0 01 __ LDY #$01
2f6e : b1 0d __ LDA (P0),y ; (si + 0)
2f70 : 18 __ __ CLC
2f71 : 65 44 __ ADC T2 + 0 
2f73 : b0 04 __ BCS $2f79 ; (nformi.s31 + 0)
.s1006:
2f75 : c9 11 __ CMP #$11
2f77 : 90 0e __ BCC $2f87 ; (nformi.s33 + 0)
.s31:
2f79 : c6 44 __ DEC T2 + 0 
2f7b : a0 00 __ LDY #$00
2f7d : b1 0d __ LDA (P0),y ; (si + 0)
2f7f : a6 44 __ LDX T2 + 0 
2f81 : 9d f0 bf STA $bff0,x ; (buffer + 0)
2f84 : 4c 6c 2f JMP $2f6c ; (nformi.l30 + 0)
.s33:
2f87 : a6 44 __ LDX T2 + 0 
2f89 : e0 10 __ CPX #$10
2f8b : b0 0e __ BCS $2f9b ; (nformi.s23 + 0)
.s34:
2f8d : 88 __ __ DEY
.l1022:
2f8e : bd f0 bf LDA $bff0,x ; (buffer + 0)
2f91 : 91 0f __ STA (P2),y ; (str + 0)
2f93 : e8 __ __ INX
2f94 : e0 10 __ CPX #$10
2f96 : c8 __ __ INY
2f97 : 90 f5 __ BCC $2f8e ; (nformi.l1022 + 0)
.s1023:
2f99 : 84 1b __ STY ACCU + 0 
.s23:
2f9b : a9 00 __ LDA #$00
2f9d : 85 1c __ STA ACCU + 1 
.s1001:
2f9f : 60 __ __ RTS
.s24:
2fa0 : a6 44 __ LDX T2 + 0 
2fa2 : e0 10 __ CPX #$10
2fa4 : b0 1b __ BCS $2fc1 ; (nformi.l27 + 0)
.s25:
2fa6 : a0 00 __ LDY #$00
.l1020:
2fa8 : bd f0 bf LDA $bff0,x ; (buffer + 0)
2fab : 91 0f __ STA (P2),y ; (str + 0)
2fad : e8 __ __ INX
2fae : e0 10 __ CPX #$10
2fb0 : c8 __ __ INY
2fb1 : 90 f5 __ BCC $2fa8 ; (nformi.l1020 + 0)
.s1021:
2fb3 : 84 1b __ STY ACCU + 0 
2fb5 : 4c c1 2f JMP $2fc1 ; (nformi.l27 + 0)
.s28:
2fb8 : 88 __ __ DEY
2fb9 : b1 0d __ LDA (P0),y ; (si + 0)
2fbb : a4 1b __ LDY ACCU + 0 
2fbd : 91 0f __ STA (P2),y ; (str + 0)
2fbf : e6 1b __ INC ACCU + 0 
.l27:
2fc1 : a5 1b __ LDA ACCU + 0 
2fc3 : a0 01 __ LDY #$01
2fc5 : d1 0d __ CMP (P0),y ; (si + 0)
2fc7 : 90 ef __ BCC $2fb8 ; (nformi.s28 + 0)
2fc9 : 4c 9b 2f JMP $2f9b ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
2fcc : a9 00 __ LDA #$00
2fce : 85 43 __ STA T0 + 0 
2fd0 : a5 15 __ LDA P8 ; (s + 0)
2fd2 : f0 21 __ BEQ $2ff5 ; (nforml.s169 + 0)
.s4:
2fd4 : a5 14 __ LDA P7 ; (v + 3)
2fd6 : f0 1d __ BEQ $2ff5 ; (nforml.s169 + 0)
.s1032:
2fd8 : 10 1b __ BPL $2ff5 ; (nforml.s169 + 0)
.s1:
2fda : 38 __ __ SEC
2fdb : a9 00 __ LDA #$00
2fdd : e5 11 __ SBC P4 ; (v + 0)
2fdf : 85 11 __ STA P4 ; (v + 0)
2fe1 : a9 00 __ LDA #$00
2fe3 : e5 12 __ SBC P5 ; (v + 1)
2fe5 : 85 12 __ STA P5 ; (v + 1)
2fe7 : a9 00 __ LDA #$00
2fe9 : e5 13 __ SBC P6 ; (v + 2)
2feb : 85 13 __ STA P6 ; (v + 2)
2fed : a9 00 __ LDA #$00
2fef : e5 14 __ SBC P7 ; (v + 3)
2ff1 : 85 14 __ STA P7 ; (v + 3)
2ff3 : e6 43 __ INC T0 + 0 
.s169:
2ff5 : a9 10 __ LDA #$10
2ff7 : 85 44 __ STA T2 + 0 
2ff9 : a5 14 __ LDA P7 ; (v + 3)
2ffb : d0 0c __ BNE $3009 ; (nforml.s42 + 0)
.s1024:
2ffd : a5 13 __ LDA P6 ; (v + 2)
2fff : d0 08 __ BNE $3009 ; (nforml.s42 + 0)
.s1025:
3001 : a5 12 __ LDA P5 ; (v + 1)
3003 : d0 04 __ BNE $3009 ; (nforml.s42 + 0)
.s1026:
3005 : c5 11 __ CMP P4 ; (v + 0)
3007 : b0 0e __ BCS $3017 ; (nforml.s7 + 0)
.s42:
3009 : a0 03 __ LDY #$03
300b : b1 0d __ LDA (P0),y ; (si + 0)
300d : 85 45 __ STA T5 + 0 
300f : c8 __ __ INY
3010 : b1 0d __ LDA (P0),y ; (si + 0)
3012 : 85 46 __ STA T5 + 1 
3014 : 4c e3 30 JMP $30e3 ; (nforml.l6 + 0)
.s7:
3017 : a0 02 __ LDY #$02
3019 : b1 0d __ LDA (P0),y ; (si + 0)
301b : c9 ff __ CMP #$ff
301d : d0 04 __ BNE $3023 ; (nforml.s80 + 0)
.s81:
301f : a9 0f __ LDA #$0f
3021 : d0 05 __ BNE $3028 ; (nforml.s1039 + 0)
.s80:
3023 : 38 __ __ SEC
3024 : a9 10 __ LDA #$10
3026 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
3028 : a8 __ __ TAY
3029 : c4 44 __ CPY T2 + 0 
302b : b0 0d __ BCS $303a ; (nforml.s10 + 0)
.s9:
302d : a9 30 __ LDA #$30
.l1040:
302f : c6 44 __ DEC T2 + 0 
3031 : a6 44 __ LDX T2 + 0 
3033 : 9d f0 bf STA $bff0,x ; (buffer + 0)
3036 : c4 44 __ CPY T2 + 0 
3038 : 90 f5 __ BCC $302f ; (nforml.l1040 + 0)
.s10:
303a : a0 07 __ LDY #$07
303c : b1 0d __ LDA (P0),y ; (si + 0)
303e : f0 20 __ BEQ $3060 ; (nforml.s13 + 0)
.s14:
3040 : a0 04 __ LDY #$04
3042 : b1 0d __ LDA (P0),y ; (si + 0)
3044 : d0 1a __ BNE $3060 ; (nforml.s13 + 0)
.s1013:
3046 : 88 __ __ DEY
3047 : b1 0d __ LDA (P0),y ; (si + 0)
3049 : c9 10 __ CMP #$10
304b : d0 13 __ BNE $3060 ; (nforml.s13 + 0)
.s11:
304d : a9 58 __ LDA #$58
304f : a6 44 __ LDX T2 + 0 
3051 : 9d ef bf STA $bfef,x ; (buff + 49)
3054 : 8a __ __ TXA
3055 : 18 __ __ CLC
3056 : 69 fe __ ADC #$fe
3058 : 85 44 __ STA T2 + 0 
305a : aa __ __ TAX
305b : a9 30 __ LDA #$30
305d : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
3060 : a9 00 __ LDA #$00
3062 : 85 1b __ STA ACCU + 0 
3064 : a5 43 __ LDA T0 + 0 
3066 : f0 06 __ BEQ $306e ; (nforml.s16 + 0)
.s15:
3068 : c6 44 __ DEC T2 + 0 
306a : a9 2d __ LDA #$2d
306c : d0 0a __ BNE $3078 ; (nforml.s1038 + 0)
.s16:
306e : a0 05 __ LDY #$05
3070 : b1 0d __ LDA (P0),y ; (si + 0)
3072 : f0 09 __ BEQ $307d ; (nforml.s151 + 0)
.s18:
3074 : c6 44 __ DEC T2 + 0 
3076 : a9 2b __ LDA #$2b
.s1038:
3078 : a6 44 __ LDX T2 + 0 
307a : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s151:
307d : a0 06 __ LDY #$06
307f : b1 0d __ LDA (P0),y ; (si + 0)
3081 : d0 34 __ BNE $30b7 ; (nforml.s24 + 0)
.l30:
3083 : a0 01 __ LDY #$01
3085 : b1 0d __ LDA (P0),y ; (si + 0)
3087 : 18 __ __ CLC
3088 : 65 44 __ ADC T2 + 0 
308a : b0 04 __ BCS $3090 ; (nforml.s31 + 0)
.s1006:
308c : c9 11 __ CMP #$11
308e : 90 0e __ BCC $309e ; (nforml.s33 + 0)
.s31:
3090 : c6 44 __ DEC T2 + 0 
3092 : a0 00 __ LDY #$00
3094 : b1 0d __ LDA (P0),y ; (si + 0)
3096 : a6 44 __ LDX T2 + 0 
3098 : 9d f0 bf STA $bff0,x ; (buffer + 0)
309b : 4c 83 30 JMP $3083 ; (nforml.l30 + 0)
.s33:
309e : a6 44 __ LDX T2 + 0 
30a0 : e0 10 __ CPX #$10
30a2 : b0 0e __ BCS $30b2 ; (nforml.s23 + 0)
.s34:
30a4 : 88 __ __ DEY
.l1035:
30a5 : bd f0 bf LDA $bff0,x ; (buffer + 0)
30a8 : 91 0f __ STA (P2),y ; (str + 0)
30aa : e8 __ __ INX
30ab : e0 10 __ CPX #$10
30ad : c8 __ __ INY
30ae : 90 f5 __ BCC $30a5 ; (nforml.l1035 + 0)
.s1036:
30b0 : 84 1b __ STY ACCU + 0 
.s23:
30b2 : a9 00 __ LDA #$00
30b4 : 85 1c __ STA ACCU + 1 
.s1001:
30b6 : 60 __ __ RTS
.s24:
30b7 : a6 44 __ LDX T2 + 0 
30b9 : e0 10 __ CPX #$10
30bb : b0 1b __ BCS $30d8 ; (nforml.l27 + 0)
.s25:
30bd : a0 00 __ LDY #$00
.l1033:
30bf : bd f0 bf LDA $bff0,x ; (buffer + 0)
30c2 : 91 0f __ STA (P2),y ; (str + 0)
30c4 : e8 __ __ INX
30c5 : e0 10 __ CPX #$10
30c7 : c8 __ __ INY
30c8 : 90 f5 __ BCC $30bf ; (nforml.l1033 + 0)
.s1034:
30ca : 84 1b __ STY ACCU + 0 
30cc : 4c d8 30 JMP $30d8 ; (nforml.l27 + 0)
.s28:
30cf : 88 __ __ DEY
30d0 : b1 0d __ LDA (P0),y ; (si + 0)
30d2 : a4 1b __ LDY ACCU + 0 
30d4 : 91 0f __ STA (P2),y ; (str + 0)
30d6 : e6 1b __ INC ACCU + 0 
.l27:
30d8 : a5 1b __ LDA ACCU + 0 
30da : a0 01 __ LDY #$01
30dc : d1 0d __ CMP (P0),y ; (si + 0)
30de : 90 ef __ BCC $30cf ; (nforml.s28 + 0)
30e0 : 4c b2 30 JMP $30b2 ; (nforml.s23 + 0)
.l6:
30e3 : a5 11 __ LDA P4 ; (v + 0)
30e5 : 85 1b __ STA ACCU + 0 
30e7 : a5 12 __ LDA P5 ; (v + 1)
30e9 : 85 1c __ STA ACCU + 1 
30eb : a5 13 __ LDA P6 ; (v + 2)
30ed : 85 1d __ STA ACCU + 2 
30ef : a5 14 __ LDA P7 ; (v + 3)
30f1 : 85 1e __ STA ACCU + 3 
30f3 : a5 45 __ LDA T5 + 0 
30f5 : 85 03 __ STA WORK + 0 
30f7 : a5 46 __ LDA T5 + 1 
30f9 : 85 04 __ STA WORK + 1 
30fb : a9 00 __ LDA #$00
30fd : 85 05 __ STA WORK + 2 
30ff : 85 06 __ STA WORK + 3 
3101 : 20 74 35 JSR $3574 ; (divmod32 + 0)
3104 : a5 08 __ LDA WORK + 5 
3106 : 30 08 __ BMI $3110 ; (nforml.s78 + 0)
.s1023:
3108 : d0 0a __ BNE $3114 ; (nforml.s77 + 0)
.s1022:
310a : a5 07 __ LDA WORK + 4 
310c : c9 0a __ CMP #$0a
310e : b0 04 __ BCS $3114 ; (nforml.s77 + 0)
.s78:
3110 : a9 30 __ LDA #$30
3112 : d0 02 __ BNE $3116 ; (nforml.s79 + 0)
.s77:
3114 : a9 37 __ LDA #$37
.s79:
3116 : 18 __ __ CLC
3117 : 65 07 __ ADC WORK + 4 
3119 : c6 44 __ DEC T2 + 0 
311b : a6 44 __ LDX T2 + 0 
311d : 9d f0 bf STA $bff0,x ; (buffer + 0)
3120 : a5 1b __ LDA ACCU + 0 
3122 : 85 11 __ STA P4 ; (v + 0)
3124 : a5 1c __ LDA ACCU + 1 
3126 : 85 12 __ STA P5 ; (v + 1)
3128 : a5 1d __ LDA ACCU + 2 
312a : 85 13 __ STA P6 ; (v + 2)
312c : a5 1e __ LDA ACCU + 3 
312e : 85 14 __ STA P7 ; (v + 3)
3130 : d0 b1 __ BNE $30e3 ; (nforml.l6 + 0)
.s1018:
3132 : a5 13 __ LDA P6 ; (v + 2)
3134 : d0 ad __ BNE $30e3 ; (nforml.l6 + 0)
.s1019:
3136 : a5 12 __ LDA P5 ; (v + 1)
3138 : d0 a9 __ BNE $30e3 ; (nforml.l6 + 0)
.s1020:
313a : c5 11 __ CMP P4 ; (v + 0)
313c : 90 a5 __ BCC $30e3 ; (nforml.l6 + 0)
313e : 4c 17 30 JMP $3017 ; (nforml.s7 + 0)
--------------------------------------------------------------------
3141 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
3151 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
3161 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
316c : 20 7a 31 JSR $317a ; (getpch + 0)
316f : c9 00 __ CMP #$00
3171 : f0 f9 __ BEQ $316c ; (getch.s0 + 0)
3173 : 85 1b __ STA ACCU + 0 
3175 : a9 00 __ LDA #$00
3177 : 85 1c __ STA ACCU + 1 
.s1001:
3179 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
317a : 20 e4 ff JSR $ffe4 
317d : ae 0d 36 LDX $360d ; (giocharmap + 0)
3180 : e0 01 __ CPX #$01
3182 : 90 26 __ BCC $31aa ; (getpch + 48)
3184 : c9 0d __ CMP #$0d
3186 : d0 02 __ BNE $318a ; (getpch + 16)
3188 : a9 0a __ LDA #$0a
318a : e0 02 __ CPX #$02
318c : 90 1c __ BCC $31aa ; (getpch + 48)
318e : c9 db __ CMP #$db
3190 : b0 18 __ BCS $31aa ; (getpch + 48)
3192 : c9 41 __ CMP #$41
3194 : 90 14 __ BCC $31aa ; (getpch + 48)
3196 : c9 c1 __ CMP #$c1
3198 : 90 02 __ BCC $319c ; (getpch + 34)
319a : 49 a0 __ EOR #$a0
319c : c9 7b __ CMP #$7b
319e : b0 0a __ BCS $31aa ; (getpch + 48)
31a0 : c9 61 __ CMP #$61
31a2 : b0 04 __ BCS $31a8 ; (getpch + 46)
31a4 : c9 5b __ CMP #$5b
31a6 : b0 02 __ BCS $31aa ; (getpch + 48)
31a8 : 49 20 __ EOR #$20
31aa : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
31ab : 20 81 ff JSR $ff81 
.s1001:
31ae : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
31af : a5 d7 __ LDA $d7 
31b1 : 30 03 __ BMI $31b6 ; (screen_setmode.s1001 + 0)
.s6:
31b3 : 20 5f ff JSR $ff5f 
.s1001:
31b6 : 60 __ __ RTS
--------------------------------------------------------------------
31b7 : __ __ __ BYT 4f 73 63 61 72 36 34 20 56 44 43 20 64 65 6d 6f : Oscar64 VDC demo
31c7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
ascToPetTable:
3700 : __ __ __ BYT 00 01 02 03 04 05 06 07 14 20 0d 11 93 0a 0e 0f : ......... ......
3710 : __ __ __ BYT 10 0b 12 13 08 15 16 17 18 19 1a 1b 1c 1d 1e 1f : ................
3720 : __ __ __ BYT 20 21 22 23 24 25 26 27 28 29 2a 2b 2c 2d 2e 2f :  !"#$%&'()*+,-./
3730 : __ __ __ BYT 30 31 32 33 34 35 36 37 38 39 3a 3b 3c 3d 3e 3f : 0123456789:;<=>?
3740 : __ __ __ BYT 40 c1 c2 c3 c4 c5 c6 c7 c8 c9 ca cb cc cd ce cf : @...............
3750 : __ __ __ BYT d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 da 5b 5c 5d 5e 5f : ...........[\]^_
3760 : __ __ __ BYT c0 41 42 43 44 45 46 47 48 49 4a 4b 4c 4d 4e 4f : .ABCDEFGHIJKLMNO
3770 : __ __ __ BYT 50 51 52 53 54 55 56 57 58 59 5a db dc dd de df : PQRSTUVWXYZ.....
3780 : __ __ __ BYT 80 81 82 83 84 85 86 87 88 89 8a 8b 8c 8d 8e 8f : ................
3790 : __ __ __ BYT 90 91 92 0c 94 95 96 97 98 99 9a 9b 9c 9d 9e 9f : ................
37a0 : __ __ __ BYT a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 aa ab ac ad ae af : ................
37b0 : __ __ __ BYT b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 ba bb bc bd be bf : ................
37c0 : __ __ __ BYT 60 61 62 63 64 65 66 67 68 69 6a 6b 6c 6d 6e 6f : `abcdefghijklmno
37d0 : __ __ __ BYT 70 71 72 73 74 75 76 77 78 79 7a 7b 7c 7d 7e 7f : pqrstuvwxyz{|}~.
37e0 : __ __ __ BYT e0 e1 e2 e3 e4 e5 e6 e7 e8 e9 ea eb ec ed ee ef : ................
37f0 : __ __ __ BYT f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 fa fb fc fd fe ff : ................
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s1000:
31c8 : a2 03 __ LDX #$03
31ca : b5 53 __ LDA T8 + 0,x 
31cc : 9d e4 bf STA $bfe4,x ; (buff + 38)
31cf : ca __ __ DEX
31d0 : 10 f8 __ BPL $31ca ; (sprintf.s1000 + 2)
.s0:
31d2 : 18 __ __ CLC
31d3 : a5 23 __ LDA SP + 0 
31d5 : 69 06 __ ADC #$06
31d7 : 85 47 __ STA T0 + 0 
31d9 : a5 24 __ LDA SP + 1 
31db : 69 00 __ ADC #$00
31dd : 85 48 __ STA T0 + 1 
31df : a9 00 __ LDA #$00
31e1 : 85 43 __ STA T1 + 0 
31e3 : a0 04 __ LDY #$04
31e5 : b1 23 __ LDA (SP + 0),y 
31e7 : 85 49 __ STA T2 + 0 
31e9 : c8 __ __ INY
31ea : b1 23 __ LDA (SP + 0),y 
31ec : 85 4a __ STA T2 + 1 
31ee : a0 02 __ LDY #$02
31f0 : b1 23 __ LDA (SP + 0),y 
31f2 : 85 4b __ STA T3 + 0 
31f4 : c8 __ __ INY
31f5 : b1 23 __ LDA (SP + 0),y 
31f7 : 85 4c __ STA T3 + 1 
.l2:
31f9 : a0 00 __ LDY #$00
31fb : b1 49 __ LDA (T2 + 0),y 
31fd : d0 0f __ BNE $320e ; (sprintf.s3 + 0)
.s4:
31ff : a4 43 __ LDY T1 + 0 
3201 : 91 4b __ STA (T3 + 0),y 
.s1001:
3203 : a2 03 __ LDX #$03
3205 : bd e4 bf LDA $bfe4,x ; (buff + 38)
3208 : 95 53 __ STA T8 + 0,x 
320a : ca __ __ DEX
320b : 10 f8 __ BPL $3205 ; (sprintf.s1001 + 2)
320d : 60 __ __ RTS
.s3:
320e : c9 25 __ CMP #$25
3210 : f0 22 __ BEQ $3234 ; (sprintf.s5 + 0)
.s6:
3212 : a4 43 __ LDY T1 + 0 
3214 : 91 4b __ STA (T3 + 0),y 
3216 : e6 49 __ INC T2 + 0 
3218 : d0 02 __ BNE $321c ; (sprintf.s1084 + 0)
.s1083:
321a : e6 4a __ INC T2 + 1 
.s1084:
321c : c8 __ __ INY
321d : 84 43 __ STY T1 + 0 
321f : 98 __ __ TYA
3220 : c0 28 __ CPY #$28
3222 : 90 d5 __ BCC $31f9 ; (sprintf.l2 + 0)
.s102:
3224 : 18 __ __ CLC
3225 : 65 4b __ ADC T3 + 0 
3227 : 85 4b __ STA T3 + 0 
3229 : 90 02 __ BCC $322d ; (sprintf.s1086 + 0)
.s1085:
322b : e6 4c __ INC T3 + 1 
.s1086:
322d : a9 00 __ LDA #$00
.s1050:
322f : 85 43 __ STA T1 + 0 
3231 : 4c f9 31 JMP $31f9 ; (sprintf.l2 + 0)
.s5:
3234 : 8c ec bf STY $bfec ; (buff + 46)
3237 : 8c ed bf STY $bfed ; (buff + 47)
323a : 8c ee bf STY $bfee ; (buff + 48)
323d : 8c ef bf STY $bfef ; (buff + 49)
3240 : a9 0a __ LDA #$0a
3242 : 8d eb bf STA $bfeb ; (buff + 45)
3245 : a5 43 __ LDA T1 + 0 
3247 : f0 0b __ BEQ $3254 ; (sprintf.s10 + 0)
.s8:
3249 : 18 __ __ CLC
324a : 65 4b __ ADC T3 + 0 
324c : 85 4b __ STA T3 + 0 
324e : 90 02 __ BCC $3252 ; (sprintf.s1062 + 0)
.s1061:
3250 : e6 4c __ INC T3 + 1 
.s1062:
3252 : 84 43 __ STY T1 + 0 
.s10:
3254 : a0 01 __ LDY #$01
3256 : b1 49 __ LDA (T2 + 0),y 
3258 : aa __ __ TAX
3259 : a9 20 __ LDA #$20
325b : 8d e8 bf STA $bfe8 ; (buff + 42)
325e : a9 00 __ LDA #$00
3260 : 8d e9 bf STA $bfe9 ; (buff + 43)
3263 : a9 ff __ LDA #$ff
3265 : 8d ea bf STA $bfea ; (buff + 44)
3268 : 18 __ __ CLC
3269 : a5 49 __ LDA T2 + 0 
326b : 69 02 __ ADC #$02
.l15:
326d : 85 49 __ STA T2 + 0 
326f : 90 02 __ BCC $3273 ; (sprintf.s1064 + 0)
.s1063:
3271 : e6 4a __ INC T2 + 1 
.s1064:
3273 : 8a __ __ TXA
3274 : e0 2b __ CPX #$2b
3276 : d0 08 __ BNE $3280 ; (sprintf.s18 + 0)
.s17:
3278 : a9 01 __ LDA #$01
327a : 8d ed bf STA $bfed ; (buff + 47)
327d : 4c c7 34 JMP $34c7 ; (sprintf.s223 + 0)
.s18:
3280 : c9 30 __ CMP #$30
3282 : d0 06 __ BNE $328a ; (sprintf.s21 + 0)
.s20:
3284 : 8d e8 bf STA $bfe8 ; (buff + 42)
3287 : 4c c7 34 JMP $34c7 ; (sprintf.s223 + 0)
.s21:
328a : e0 23 __ CPX #$23
328c : d0 08 __ BNE $3296 ; (sprintf.s24 + 0)
.s23:
328e : a9 01 __ LDA #$01
3290 : 8d ef bf STA $bfef ; (buff + 49)
3293 : 4c c7 34 JMP $34c7 ; (sprintf.s223 + 0)
.s24:
3296 : e0 2d __ CPX #$2d
3298 : d0 08 __ BNE $32a2 ; (sprintf.s16 + 0)
.s26:
329a : a9 01 __ LDA #$01
329c : 8d ee bf STA $bfee ; (buff + 48)
329f : 4c c7 34 JMP $34c7 ; (sprintf.s223 + 0)
.s16:
32a2 : 86 45 __ STX T4 + 0 
32a4 : e0 30 __ CPX #$30
32a6 : 90 53 __ BCC $32fb ; (sprintf.s32 + 0)
.s33:
32a8 : e0 3a __ CPX #$3a
32aa : b0 4f __ BCS $32fb ; (sprintf.s32 + 0)
.s30:
32ac : a9 00 __ LDA #$00
32ae : 85 4d __ STA T6 + 0 
32b0 : 85 4e __ STA T6 + 1 
32b2 : e0 3a __ CPX #$3a
32b4 : b0 40 __ BCS $32f6 ; (sprintf.s36 + 0)
.l35:
32b6 : a5 4d __ LDA T6 + 0 
32b8 : 0a __ __ ASL
32b9 : 85 1b __ STA ACCU + 0 
32bb : a5 4e __ LDA T6 + 1 
32bd : 2a __ __ ROL
32be : 06 1b __ ASL ACCU + 0 
32c0 : 2a __ __ ROL
32c1 : aa __ __ TAX
32c2 : 18 __ __ CLC
32c3 : a5 1b __ LDA ACCU + 0 
32c5 : 65 4d __ ADC T6 + 0 
32c7 : 85 4d __ STA T6 + 0 
32c9 : 8a __ __ TXA
32ca : 65 4e __ ADC T6 + 1 
32cc : 06 4d __ ASL T6 + 0 
32ce : 2a __ __ ROL
32cf : aa __ __ TAX
32d0 : 18 __ __ CLC
32d1 : a5 4d __ LDA T6 + 0 
32d3 : 65 45 __ ADC T4 + 0 
32d5 : 90 01 __ BCC $32d8 ; (sprintf.s1080 + 0)
.s1079:
32d7 : e8 __ __ INX
.s1080:
32d8 : 38 __ __ SEC
32d9 : e9 30 __ SBC #$30
32db : 85 4d __ STA T6 + 0 
32dd : 8a __ __ TXA
32de : e9 00 __ SBC #$00
32e0 : 85 4e __ STA T6 + 1 
32e2 : a0 00 __ LDY #$00
32e4 : b1 49 __ LDA (T2 + 0),y 
32e6 : 85 45 __ STA T4 + 0 
32e8 : e6 49 __ INC T2 + 0 
32ea : d0 02 __ BNE $32ee ; (sprintf.s1082 + 0)
.s1081:
32ec : e6 4a __ INC T2 + 1 
.s1082:
32ee : c9 30 __ CMP #$30
32f0 : 90 04 __ BCC $32f6 ; (sprintf.s36 + 0)
.s37:
32f2 : c9 3a __ CMP #$3a
32f4 : 90 c0 __ BCC $32b6 ; (sprintf.l35 + 0)
.s36:
32f6 : a5 4d __ LDA T6 + 0 
32f8 : 8d e9 bf STA $bfe9 ; (buff + 43)
.s32:
32fb : a5 45 __ LDA T4 + 0 
32fd : c9 2e __ CMP #$2e
32ff : d0 51 __ BNE $3352 ; (sprintf.s40 + 0)
.s38:
3301 : a9 00 __ LDA #$00
3303 : 85 4d __ STA T6 + 0 
.l208:
3305 : 85 4e __ STA T6 + 1 
3307 : a0 00 __ LDY #$00
3309 : b1 49 __ LDA (T2 + 0),y 
330b : 85 45 __ STA T4 + 0 
330d : e6 49 __ INC T2 + 0 
330f : d0 02 __ BNE $3313 ; (sprintf.s1066 + 0)
.s1065:
3311 : e6 4a __ INC T2 + 1 
.s1066:
3313 : c9 30 __ CMP #$30
3315 : 90 04 __ BCC $331b ; (sprintf.s43 + 0)
.s44:
3317 : c9 3a __ CMP #$3a
3319 : 90 0a __ BCC $3325 ; (sprintf.s42 + 0)
.s43:
331b : a5 4d __ LDA T6 + 0 
331d : 8d ea bf STA $bfea ; (buff + 44)
3320 : a5 45 __ LDA T4 + 0 
3322 : 4c 52 33 JMP $3352 ; (sprintf.s40 + 0)
.s42:
3325 : a5 4d __ LDA T6 + 0 
3327 : 0a __ __ ASL
3328 : 85 1b __ STA ACCU + 0 
332a : a5 4e __ LDA T6 + 1 
332c : 2a __ __ ROL
332d : 06 1b __ ASL ACCU + 0 
332f : 2a __ __ ROL
3330 : aa __ __ TAX
3331 : 18 __ __ CLC
3332 : a5 1b __ LDA ACCU + 0 
3334 : 65 4d __ ADC T6 + 0 
3336 : 85 4d __ STA T6 + 0 
3338 : 8a __ __ TXA
3339 : 65 4e __ ADC T6 + 1 
333b : 06 4d __ ASL T6 + 0 
333d : 2a __ __ ROL
333e : aa __ __ TAX
333f : 18 __ __ CLC
3340 : a5 4d __ LDA T6 + 0 
3342 : 65 45 __ ADC T4 + 0 
3344 : 90 01 __ BCC $3347 ; (sprintf.s1078 + 0)
.s1077:
3346 : e8 __ __ INX
.s1078:
3347 : 38 __ __ SEC
3348 : e9 30 __ SBC #$30
334a : 85 4d __ STA T6 + 0 
334c : 8a __ __ TXA
334d : e9 00 __ SBC #$00
334f : 4c 05 33 JMP $3305 ; (sprintf.l208 + 0)
.s40:
3352 : c9 64 __ CMP #$64
3354 : d0 05 __ BNE $335b ; (sprintf.s46 + 0)
.s45:
3356 : a9 01 __ LDA #$01
3358 : 4c a0 34 JMP $34a0 ; (sprintf.s224 + 0)
.s46:
335b : c9 75 __ CMP #$75
335d : d0 03 __ BNE $3362 ; (sprintf.s49 + 0)
335f : 4c 9e 34 JMP $349e ; (sprintf.s247 + 0)
.s49:
3362 : c9 78 __ CMP #$78
3364 : d0 0d __ BNE $3373 ; (sprintf.s52 + 0)
.s51:
3366 : a9 10 __ LDA #$10
3368 : 8d eb bf STA $bfeb ; (buff + 45)
336b : a9 00 __ LDA #$00
336d : 8d ec bf STA $bfec ; (buff + 46)
3370 : 4c 9e 34 JMP $349e ; (sprintf.s247 + 0)
.s52:
3373 : c9 6c __ CMP #$6c
3375 : d0 03 __ BNE $337a ; (sprintf.s55 + 0)
3377 : 4c 2c 34 JMP $342c ; (sprintf.s54 + 0)
.s55:
337a : c9 73 __ CMP #$73
337c : f0 2f __ BEQ $33ad ; (sprintf.s66 + 0)
.s67:
337e : c9 63 __ CMP #$63
3380 : f0 10 __ BEQ $3392 ; (sprintf.s96 + 0)
.s97:
3382 : 09 00 __ ORA #$00
3384 : d0 03 __ BNE $3389 ; (sprintf.s99 + 0)
3386 : 4c f9 31 JMP $31f9 ; (sprintf.l2 + 0)
.s99:
3389 : a4 43 __ LDY T1 + 0 
338b : 91 4b __ STA (T3 + 0),y 
338d : e6 43 __ INC T1 + 0 
338f : 4c f9 31 JMP $31f9 ; (sprintf.l2 + 0)
.s96:
3392 : a0 00 __ LDY #$00
3394 : b1 47 __ LDA (T0 + 0),y 
3396 : a4 43 __ LDY T1 + 0 
3398 : 91 4b __ STA (T3 + 0),y 
339a : e6 43 __ INC T1 + 0 
.s221:
339c : 18 __ __ CLC
339d : a5 47 __ LDA T0 + 0 
339f : 69 02 __ ADC #$02
33a1 : 85 47 __ STA T0 + 0 
33a3 : b0 03 __ BCS $33a8 ; (sprintf.s1067 + 0)
33a5 : 4c f9 31 JMP $31f9 ; (sprintf.l2 + 0)
.s1067:
33a8 : e6 48 __ INC T0 + 1 
33aa : 4c f9 31 JMP $31f9 ; (sprintf.l2 + 0)
.s66:
33ad : a0 00 __ LDY #$00
33af : 84 45 __ STY T4 + 0 
33b1 : b1 47 __ LDA (T0 + 0),y 
33b3 : 85 4d __ STA T6 + 0 
33b5 : c8 __ __ INY
33b6 : b1 47 __ LDA (T0 + 0),y 
33b8 : 85 4e __ STA T6 + 1 
33ba : 18 __ __ CLC
33bb : a5 47 __ LDA T0 + 0 
33bd : 69 02 __ ADC #$02
33bf : 85 47 __ STA T0 + 0 
33c1 : 90 02 __ BCC $33c5 ; (sprintf.s1074 + 0)
.s1073:
33c3 : e6 48 __ INC T0 + 1 
.s1074:
33c5 : ad e9 bf LDA $bfe9 ; (buff + 43)
33c8 : f0 0d __ BEQ $33d7 ; (sprintf.s71 + 0)
.s1053:
33ca : a0 00 __ LDY #$00
33cc : b1 4d __ LDA (T6 + 0),y 
33ce : f0 05 __ BEQ $33d5 ; (sprintf.s1054 + 0)
.l73:
33d0 : c8 __ __ INY
33d1 : b1 4d __ LDA (T6 + 0),y 
33d3 : d0 fb __ BNE $33d0 ; (sprintf.l73 + 0)
.s1054:
33d5 : 84 45 __ STY T4 + 0 
.s71:
33d7 : ad ee bf LDA $bfee ; (buff + 48)
33da : d0 19 __ BNE $33f5 ; (sprintf.l87 + 0)
.s1057:
33dc : a6 45 __ LDX T4 + 0 
33de : ec e9 bf CPX $bfe9 ; (buff + 43)
33e1 : a4 43 __ LDY T1 + 0 
33e3 : b0 0c __ BCS $33f1 ; (sprintf.s1058 + 0)
.l79:
33e5 : ad e8 bf LDA $bfe8 ; (buff + 42)
33e8 : 91 4b __ STA (T3 + 0),y 
33ea : e8 __ __ INX
33eb : ec e9 bf CPX $bfe9 ; (buff + 43)
33ee : c8 __ __ INY
33ef : 90 f4 __ BCC $33e5 ; (sprintf.l79 + 0)
.s1058:
33f1 : 86 45 __ STX T4 + 0 
33f3 : 84 43 __ STY T1 + 0 
.l87:
33f5 : a0 00 __ LDY #$00
33f7 : b1 4d __ LDA (T6 + 0),y 
33f9 : f0 0f __ BEQ $340a ; (sprintf.s83 + 0)
.s88:
33fb : a4 43 __ LDY T1 + 0 
33fd : 91 4b __ STA (T3 + 0),y 
33ff : e6 43 __ INC T1 + 0 
3401 : e6 4d __ INC T6 + 0 
3403 : d0 f0 __ BNE $33f5 ; (sprintf.l87 + 0)
.s1075:
3405 : e6 4e __ INC T6 + 1 
3407 : 4c f5 33 JMP $33f5 ; (sprintf.l87 + 0)
.s83:
340a : ad ee bf LDA $bfee ; (buff + 48)
340d : d0 03 __ BNE $3412 ; (sprintf.s1055 + 0)
340f : 4c f9 31 JMP $31f9 ; (sprintf.l2 + 0)
.s1055:
3412 : a6 45 __ LDX T4 + 0 
3414 : ec e9 bf CPX $bfe9 ; (buff + 43)
3417 : a4 43 __ LDY T1 + 0 
3419 : b0 0c __ BCS $3427 ; (sprintf.s1056 + 0)
.l94:
341b : ad e8 bf LDA $bfe8 ; (buff + 42)
341e : 91 4b __ STA (T3 + 0),y 
3420 : e8 __ __ INX
3421 : ec e9 bf CPX $bfe9 ; (buff + 43)
3424 : c8 __ __ INY
3425 : 90 f4 __ BCC $341b ; (sprintf.l94 + 0)
.s1056:
3427 : 84 43 __ STY T1 + 0 
3429 : 4c f9 31 JMP $31f9 ; (sprintf.l2 + 0)
.s54:
342c : a0 00 __ LDY #$00
342e : b1 47 __ LDA (T0 + 0),y 
3430 : 85 53 __ STA T8 + 0 
3432 : c8 __ __ INY
3433 : b1 47 __ LDA (T0 + 0),y 
3435 : 85 54 __ STA T8 + 1 
3437 : c8 __ __ INY
3438 : b1 47 __ LDA (T0 + 0),y 
343a : 85 55 __ STA T8 + 2 
343c : c8 __ __ INY
343d : b1 47 __ LDA (T0 + 0),y 
343f : 85 56 __ STA T8 + 3 
3441 : 18 __ __ CLC
3442 : a5 47 __ LDA T0 + 0 
3444 : 69 04 __ ADC #$04
3446 : 85 47 __ STA T0 + 0 
3448 : 90 02 __ BCC $344c ; (sprintf.s1070 + 0)
.s1069:
344a : e6 48 __ INC T0 + 1 
.s1070:
344c : a0 00 __ LDY #$00
344e : b1 49 __ LDA (T2 + 0),y 
3450 : aa __ __ TAX
3451 : e6 49 __ INC T2 + 0 
3453 : d0 02 __ BNE $3457 ; (sprintf.s1072 + 0)
.s1071:
3455 : e6 4a __ INC T2 + 1 
.s1072:
3457 : 8a __ __ TXA
3458 : e0 64 __ CPX #$64
345a : d0 04 __ BNE $3460 ; (sprintf.s58 + 0)
.s57:
345c : a9 01 __ LDA #$01
345e : d0 14 __ BNE $3474 ; (sprintf.s222 + 0)
.s58:
3460 : c9 75 __ CMP #$75
3462 : f0 0f __ BEQ $3473 ; (sprintf.s246 + 0)
.s61:
3464 : c9 78 __ CMP #$78
3466 : f0 03 __ BEQ $346b ; (sprintf.s63 + 0)
3468 : 4c f9 31 JMP $31f9 ; (sprintf.l2 + 0)
.s63:
346b : 8c ec bf STY $bfec ; (buff + 46)
346e : a9 10 __ LDA #$10
3470 : 8d eb bf STA $bfeb ; (buff + 45)
.s246:
3473 : 98 __ __ TYA
.s222:
3474 : 85 15 __ STA P8 
3476 : a5 4b __ LDA T3 + 0 
3478 : 85 0f __ STA P2 ; (fmt + 0)
347a : a5 4c __ LDA T3 + 1 
347c : 85 10 __ STA P3 ; (fmt + 1)
347e : a5 53 __ LDA T8 + 0 
3480 : 85 11 __ STA P4 ; (fmt + 2)
3482 : a5 54 __ LDA T8 + 1 
3484 : 85 12 __ STA P5 ; (fmt + 3)
3486 : a5 55 __ LDA T8 + 2 
3488 : 85 13 __ STA P6 
348a : a5 56 __ LDA T8 + 3 
348c : 85 14 __ STA P7 
348e : a9 e8 __ LDA #$e8
3490 : 85 0d __ STA P0 ; (str + 0)
3492 : a9 bf __ LDA #$bf
3494 : 85 0e __ STA P1 ; (str + 1)
3496 : 20 cc 2f JSR $2fcc ; (nforml.s0 + 0)
3499 : a5 1b __ LDA ACCU + 0 
349b : 4c 2f 32 JMP $322f ; (sprintf.s1050 + 0)
.s247:
349e : a9 00 __ LDA #$00
.s224:
34a0 : 85 13 __ STA P6 
34a2 : a5 4b __ LDA T3 + 0 
34a4 : 85 0f __ STA P2 ; (fmt + 0)
34a6 : a5 4c __ LDA T3 + 1 
34a8 : 85 10 __ STA P3 ; (fmt + 1)
34aa : a0 00 __ LDY #$00
34ac : b1 47 __ LDA (T0 + 0),y 
34ae : 85 11 __ STA P4 ; (fmt + 2)
34b0 : c8 __ __ INY
34b1 : b1 47 __ LDA (T0 + 0),y 
34b3 : 85 12 __ STA P5 ; (fmt + 3)
34b5 : a9 e8 __ LDA #$e8
34b7 : 85 0d __ STA P0 ; (str + 0)
34b9 : a9 bf __ LDA #$bf
34bb : 85 0e __ STA P1 ; (str + 1)
34bd : 20 95 2e JSR $2e95 ; (nformi.s0 + 0)
34c0 : a5 1b __ LDA ACCU + 0 
34c2 : 85 43 __ STA T1 + 0 
34c4 : 4c 9c 33 JMP $339c ; (sprintf.s221 + 0)
.s223:
34c7 : a0 00 __ LDY #$00
34c9 : b1 49 __ LDA (T2 + 0),y 
34cb : aa __ __ TAX
34cc : 18 __ __ CLC
34cd : a5 49 __ LDA T2 + 0 
34cf : 69 01 __ ADC #$01
34d1 : 4c 6d 32 JMP $326d ; (sprintf.l15 + 0)
--------------------------------------------------------------------
linebuffer:
360e : __ __ __ BSS	81
--------------------------------------------------------------------
34d4 : __ __ __ BYT 56 44 43 20 4d 65 6d 6f 72 79 20 44 65 74 65 63 : VDC Memory Detec
34e4 : __ __ __ BYT 74 65 64 3a 20 25 75 20 4b 42 00                : ted: %u KB.
--------------------------------------------------------------------
divmod: ; divmod
34ef : a5 1c __ LDA ACCU + 1 
34f1 : d0 31 __ BNE $3524 ; (divmod + 53)
34f3 : a5 04 __ LDA WORK + 1 
34f5 : d0 1e __ BNE $3515 ; (divmod + 38)
34f7 : 85 06 __ STA WORK + 3 
34f9 : a2 04 __ LDX #$04
34fb : 06 1b __ ASL ACCU + 0 
34fd : 2a __ __ ROL
34fe : c5 03 __ CMP WORK + 0 
3500 : 90 02 __ BCC $3504 ; (divmod + 21)
3502 : e5 03 __ SBC WORK + 0 
3504 : 26 1b __ ROL ACCU + 0 
3506 : 2a __ __ ROL
3507 : c5 03 __ CMP WORK + 0 
3509 : 90 02 __ BCC $350d ; (divmod + 30)
350b : e5 03 __ SBC WORK + 0 
350d : 26 1b __ ROL ACCU + 0 
350f : ca __ __ DEX
3510 : d0 eb __ BNE $34fd ; (divmod + 14)
3512 : 85 05 __ STA WORK + 2 
3514 : 60 __ __ RTS
3515 : a5 1b __ LDA ACCU + 0 
3517 : 85 05 __ STA WORK + 2 
3519 : a5 1c __ LDA ACCU + 1 
351b : 85 06 __ STA WORK + 3 
351d : a9 00 __ LDA #$00
351f : 85 1b __ STA ACCU + 0 
3521 : 85 1c __ STA ACCU + 1 
3523 : 60 __ __ RTS
3524 : a5 04 __ LDA WORK + 1 
3526 : d0 1f __ BNE $3547 ; (divmod + 88)
3528 : a5 03 __ LDA WORK + 0 
352a : 30 1b __ BMI $3547 ; (divmod + 88)
352c : a9 00 __ LDA #$00
352e : 85 06 __ STA WORK + 3 
3530 : a2 10 __ LDX #$10
3532 : 06 1b __ ASL ACCU + 0 
3534 : 26 1c __ ROL ACCU + 1 
3536 : 2a __ __ ROL
3537 : c5 03 __ CMP WORK + 0 
3539 : 90 02 __ BCC $353d ; (divmod + 78)
353b : e5 03 __ SBC WORK + 0 
353d : 26 1b __ ROL ACCU + 0 
353f : 26 1c __ ROL ACCU + 1 
3541 : ca __ __ DEX
3542 : d0 f2 __ BNE $3536 ; (divmod + 71)
3544 : 85 05 __ STA WORK + 2 
3546 : 60 __ __ RTS
3547 : a9 00 __ LDA #$00
3549 : 85 05 __ STA WORK + 2 
354b : 85 06 __ STA WORK + 3 
354d : 84 02 __ STY $02 
354f : a0 10 __ LDY #$10
3551 : 18 __ __ CLC
3552 : 26 1b __ ROL ACCU + 0 
3554 : 26 1c __ ROL ACCU + 1 
3556 : 26 05 __ ROL WORK + 2 
3558 : 26 06 __ ROL WORK + 3 
355a : 38 __ __ SEC
355b : a5 05 __ LDA WORK + 2 
355d : e5 03 __ SBC WORK + 0 
355f : aa __ __ TAX
3560 : a5 06 __ LDA WORK + 3 
3562 : e5 04 __ SBC WORK + 1 
3564 : 90 04 __ BCC $356a ; (divmod + 123)
3566 : 86 05 __ STX WORK + 2 
3568 : 85 06 __ STA WORK + 3 
356a : 88 __ __ DEY
356b : d0 e5 __ BNE $3552 ; (divmod + 99)
356d : 26 1b __ ROL ACCU + 0 
356f : 26 1c __ ROL ACCU + 1 
3571 : a4 02 __ LDY $02 
3573 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
3574 : 84 02 __ STY $02 
3576 : a0 20 __ LDY #$20
3578 : a9 00 __ LDA #$00
357a : 85 07 __ STA WORK + 4 
357c : 85 08 __ STA WORK + 5 
357e : 85 09 __ STA WORK + 6 
3580 : 85 0a __ STA WORK + 7 
3582 : a5 05 __ LDA WORK + 2 
3584 : 05 06 __ ORA WORK + 3 
3586 : d0 39 __ BNE $35c1 ; (divmod32 + 77)
3588 : 18 __ __ CLC
3589 : 26 1b __ ROL ACCU + 0 
358b : 26 1c __ ROL ACCU + 1 
358d : 26 1d __ ROL ACCU + 2 
358f : 26 1e __ ROL ACCU + 3 
3591 : 26 07 __ ROL WORK + 4 
3593 : 26 08 __ ROL WORK + 5 
3595 : 90 0c __ BCC $35a3 ; (divmod32 + 47)
3597 : a5 07 __ LDA WORK + 4 
3599 : e5 03 __ SBC WORK + 0 
359b : aa __ __ TAX
359c : a5 08 __ LDA WORK + 5 
359e : e5 04 __ SBC WORK + 1 
35a0 : 38 __ __ SEC
35a1 : b0 0c __ BCS $35af ; (divmod32 + 59)
35a3 : 38 __ __ SEC
35a4 : a5 07 __ LDA WORK + 4 
35a6 : e5 03 __ SBC WORK + 0 
35a8 : aa __ __ TAX
35a9 : a5 08 __ LDA WORK + 5 
35ab : e5 04 __ SBC WORK + 1 
35ad : 90 04 __ BCC $35b3 ; (divmod32 + 63)
35af : 86 07 __ STX WORK + 4 
35b1 : 85 08 __ STA WORK + 5 
35b3 : 88 __ __ DEY
35b4 : d0 d3 __ BNE $3589 ; (divmod32 + 21)
35b6 : 26 1b __ ROL ACCU + 0 
35b8 : 26 1c __ ROL ACCU + 1 
35ba : 26 1d __ ROL ACCU + 2 
35bc : 26 1e __ ROL ACCU + 3 
35be : a4 02 __ LDY $02 
35c0 : 60 __ __ RTS
35c1 : 18 __ __ CLC
35c2 : 26 1b __ ROL ACCU + 0 
35c4 : 26 1c __ ROL ACCU + 1 
35c6 : 26 1d __ ROL ACCU + 2 
35c8 : 26 1e __ ROL ACCU + 3 
35ca : 26 07 __ ROL WORK + 4 
35cc : 26 08 __ ROL WORK + 5 
35ce : 26 09 __ ROL WORK + 6 
35d0 : 26 0a __ ROL WORK + 7 
35d2 : a5 07 __ LDA WORK + 4 
35d4 : c5 03 __ CMP WORK + 0 
35d6 : a5 08 __ LDA WORK + 5 
35d8 : e5 04 __ SBC WORK + 1 
35da : a5 09 __ LDA WORK + 6 
35dc : e5 05 __ SBC WORK + 2 
35de : a5 0a __ LDA WORK + 7 
35e0 : e5 06 __ SBC WORK + 3 
35e2 : 90 18 __ BCC $35fc ; (divmod32 + 136)
35e4 : a5 07 __ LDA WORK + 4 
35e6 : e5 03 __ SBC WORK + 0 
35e8 : 85 07 __ STA WORK + 4 
35ea : a5 08 __ LDA WORK + 5 
35ec : e5 04 __ SBC WORK + 1 
35ee : 85 08 __ STA WORK + 5 
35f0 : a5 09 __ LDA WORK + 6 
35f2 : e5 05 __ SBC WORK + 2 
35f4 : 85 09 __ STA WORK + 6 
35f6 : a5 0a __ LDA WORK + 7 
35f8 : e5 06 __ SBC WORK + 3 
35fa : 85 0a __ STA WORK + 7 
35fc : 88 __ __ DEY
35fd : d0 c3 __ BNE $35c2 ; (divmod32 + 78)
35ff : 26 1b __ ROL ACCU + 0 
3601 : 26 1c __ ROL ACCU + 1 
3603 : 26 1d __ ROL ACCU + 2 
3605 : 26 1e __ ROL ACCU + 3 
3607 : a4 02 __ LDY $02 
3609 : 60 __ __ RTS
