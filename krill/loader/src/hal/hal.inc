
.ifndef _HAL_INC_
_HAL_INC_ = 1

.if PLATFORM = diskio::platform::COMMODORE_16
    .include "hal/hal-c16.inc"
.else; PLATFORM <> diskio::platform::COMMODORE_16
    .include "hal/hal-c64-c128.inc"
.endif; PLATFORM <> diskio::platform::COMMODORE_16


.macro DO_UNINSTALL
            .local waituninst

            SET_IO_KERNAL
waituninst: SET_FLAGS_N_DATA_V_CLK
            bpl waituninst
            bvc waituninst
.endmacro

; block ready queries are the same for the loader's and KERNAL's protocols

.macro BRANCH_IF_BLOCK_READY to
            SET_FLAGS_N_DATA_V_CLK
            bvs to
.endmacro

.macro BRANCH_IF_BLOCK_NOT_READY to
            SET_FLAGS_N_DATA_V_CLK
            bvc to
.endmacro

.endif; !_HAL_INC_
