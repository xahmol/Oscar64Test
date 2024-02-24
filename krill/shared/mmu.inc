; MOS8722

.ifndef _MMU_INC_
_MMU_INC_ = 1

MMU_PCRA       = $d501; Preconfiguration Register A
MMU_PCRB       = $d502; Preconfiguration Register B
MMU_PCRC       = $d503; Preconfiguration Register C
MMU_PCRD       = $d504; Preconfiguration Register D

MMU_RCR        = $d506; RAM Configuration Register
VIC_BANK_0     = %00000000
SHARED_RAM_LO  = %00000100
SHARED_RAM_1K  = %00000000
SHARED_RAM_4K  = %00000001
SHARED_RAM_8K  = %00000010
SHARED_RAM_16K = %00000011

MMU_CR         = $ff00; Configuration Register
BANK_0         = %00000000
BANK_1         = %01000000
SYSTEM_ROM     = %00000000
HIGH_RAM       = %00110000 ; $c000-$ffff
BASIC_HI       = %00000000
MID_RAM        = %00001100 ; $8000-$bfff
BASIC_LO       = %00000000
LOW_RAM        = %00000010 ; $4000-$7fff
IO_SPACE       = %00000000
RAM_ROM        = %00000001

MMU_LCRA       = $ff01; Load Configuration Register A
MMU_LCRB       = $ff02; Load Configuration Register B
MMU_LCRC       = $ff03; Load Configuration Register C
MMU_LCRD       = $ff04; Load Configuration Register D

.endif; !_MMU_INC_
