/**************************************************************************
 *
 * FILE  ops6502.h
 * Copyright (c) 2015, 2017 Daniel Kahlin <daniel@kahlin.net>
 * Written by Daniel Kahlin <daniel@kahlin.net>
 *
 * DESCRIPTION
 *
 ******/
#ifndef OPS6502_H
#define OPS6502_H


#define OP_ADR(p, ad) { *p++ = (ad) & 0xff; *p++ = ((ad) >> 8) & 0xff; }

#define MNE_CLD(p) { *p++ = 0xd8; }
#define MNE_CLI(p) { *p++ = 0x58; }
#define MNE_SED(p) { *p++ = 0xf8; }
#define MNE_SEI(p) { *p++ = 0x78; }
#define MNE_LDAI(p, imm) { *p++ = 0xa9; *p++ = imm; }
#define MNE_STAZ(p, zp) { *p++ = 0x85; *p++ = zp; }
#define MNE_JMP(p, ad) { *p++ = 0x4c; OP_ADR(p, ad); }

#define MNE_TAX(p) { *p++ = 0xaa; }
#define MNE_TSX(p) { *p++ = 0xba; }
#define MNE_TAY(p) { *p++ = 0xa8; }
#define MNE_TXA(p) { *p++ = 0x8a; }
#define MNE_TXS(p) { *p++ = 0x9a; }
#define MNE_TYA(p) { *p++ = 0x98; }


#define MNE_BCS(p, offs) { *p++ = 0xb0; *p++ = offs - 2; }
#define MNE_BNE(p, offs) { *p++ = 0xd0; *p++ = offs - 2; }

#define MNE_LDAI(p, imm) { *p++ = 0xa9; *p++ = imm; }
#define MNE_LDXI(p, imm) { *p++ = 0xa2; *p++ = imm; }
#define MNE_LDYI(p, imm) { *p++ = 0xa0; *p++ = imm; }
#define MNE_LDAX(p, ad) { *p++ = 0xbd; OP_ADR(p, ad); }
#define MNE_LDAY(p, ad) { *p++ = 0xb9; OP_ADR(p, ad); }
#define MNE_STAX(p, ad) { *p++ = 0x9d; OP_ADR(p, ad); }
#define MNE_STAZX(p, zp) { *p++ = 0x95; *p++ = zp; }
#define MNE_STAY(p, ad) { *p++ = 0x99; OP_ADR(p, ad); }
#define MNE_DEX(p) { *p++ = 0xca; }
#define MNE_DEY(p) { *p++ = 0x88; }
#define MNE_INX(p) { *p++ = 0xe8; }
#define MNE_INY(p) { *p++ = 0xc8; }
#define MNE_CPXI(p, imm) { *p++ = 0xe0; *p++ = imm; }
#define MNE_CPYI(p, imm) { *p++ = 0xc0; *p++ = imm; }

#define MNE_INC(p, ad) { *p++ = 0xee; OP_ADR(p, ad); }
#define MNE_DEC(p, ad) { *p++ = 0xce; OP_ADR(p, ad); }

/* special X/Y optional */
#define MNE_LDXYI(p, imm, xy) if (xy) MNE_LDXI(p, imm) else MNE_LDYI(p, imm)
#define MNE_LDAXY(p, ad, xy) if (xy) MNE_LDAX(p, ad) else MNE_LDAY(p, ad)
#define MNE_STAXY(p, ad, xy) if (xy) MNE_STAX(p, ad) else MNE_STAY(p, ad)
#define MNE_DEXY(p, xy) if (xy) MNE_DEX(p) else MNE_DEY(p)
#define MNE_INXY(p, xy) if (xy) MNE_INX(p) else MNE_INY(p)
#define MNE_CPXYI(p, imm, xy) if (xy) MNE_CPXI(p, imm) else MNE_CPYI(p, imm)


#endif /* OPS6502_H */
/* eof */
