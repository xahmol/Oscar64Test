; Compiled with 1.29.247
--------------------------------------------------------------------
startup: ; startup
0b00 : 43 __ __ INV
0b01 : 42 __ __ INV
0b02 : 4d 00 00 EOR $0000 
0b05 : 00 __ __ BRK
0b06 : 00 __ __ BRK
0b07 : 56 44 __ LSR $44,x 
0b09 : 43 __ __ INV
0b0a : 54 __ __ INV
0b0b : 45 53 __ EOR $53 
0b0d : 54 __ __ INV
0b0e : 00 __ __ BRK
0b0f : 00 __ __ BRK
0b10 : a5 ba __ LDA $ba 
0b12 : 29 03 __ AND #$03
0b14 : a8 __ __ TAY
0b15 : b9 62 0b LDA $0b62,y ; (startup + 98)
0b18 : aa __ __ TAX
0b19 : b9 66 0b LDA $0b66,y ; (startup + 102)
0b1c : a8 __ __ TAY
0b1d : 4c a5 af JMP $afa5 
0b20 : 52 __ __ INV
0b21 : 55 4e __ EOR $4e,x 
0b23 : 22 __ __ INV
0b24 : 56 44 __ LSR $44,x 
0b26 : 43 __ __ INV
0b27 : 54 __ __ INV
0b28 : 45 53 __ EOR $53 
0b2a : 54 __ __ INV
0b2b : 22 __ __ INV
0b2c : 2c 55 38 BIT $3855 
0b2f : 00 __ __ BRK
0b30 : 52 __ __ INV
0b31 : 55 4e __ EOR $4e,x 
0b33 : 22 __ __ INV
0b34 : 56 44 __ LSR $44,x 
0b36 : 43 __ __ INV
0b37 : 54 __ __ INV
0b38 : 45 53 __ EOR $53 
0b3a : 54 __ __ INV
0b3b : 22 __ __ INV
0b3c : 2c 55 39 BIT $3955 
0b3f : 00 __ __ BRK
0b40 : 52 __ __ INV
0b41 : 55 4e __ EOR $4e,x 
0b43 : 22 __ __ INV
0b44 : 56 44 __ LSR $44,x 
0b46 : 43 __ __ INV
0b47 : 54 __ __ INV
0b48 : 45 53 __ EOR $53 
0b4a : 54 __ __ INV
0b4b : 22 __ __ INV
0b4c : 2c 55 31 BIT $3155 
0b4f : 30 00 __ BMI $0b51 ; (startup + 81)
0b51 : 52 __ __ INV
0b52 : 55 4e __ EOR $4e,x 
0b54 : 22 __ __ INV
0b55 : 56 44 __ LSR $44,x 
0b57 : 43 __ __ INV
0b58 : 54 __ __ INV
0b59 : 45 53 __ EOR $53 
0b5b : 54 __ __ INV
0b5c : 22 __ __ INV
0b5d : 2c 55 31 BIT $3155 
0b60 : 31 00 __ AND ($00),y 
0b62 : 1f __ __ INV
0b63 : 2f __ __ INV
0b64 : 3f __ __ INV
0b65 : 50 0b __ BVC $0b72 
0b67 : 0b __ __ INV
0b68 : 0b __ __ INV
0b69 : 0b __ __ INV
0b6a : 60 __ __ RTS
--------------------------------------------------------------------
pad:
0bff : __ __ __ BYT 00                                              : .
