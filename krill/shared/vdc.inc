; MOS8563/8568

.ifndef _VDC_INC_
_VDC_INC_ = 1

VDC_SR = $d600; Status Register
VRT    = %00100000; vertical retrace

VDC_CR = $d600; Configuration Register
FG_BG  = $1a; Foreground Colour/Background Colour
RED    = $08

VDC_DR = $d601; Data Register

.endif; !_VDC_INC_
