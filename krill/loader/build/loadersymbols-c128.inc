; repository version 194, built on Sat, 29 Jun 2024 15:35:23 +0200 for project "loader" using
; make PLATFORM=c128 prg INSTALL=A000 RESIDENT=0b00 ZP=f5 PROJECT=

; configuration
config_ALLOW_2_MHZ_ON_C128      = 0
config_DECOMPRESSOR             = 0; NONE
config_DIRTRACK                 = 18
config_DIRTRACK81               = 40
config_END_ADDRESS_API          = 0
config_FILENAME_MAXLENGTH       = 16
config_FILE_EXISTS_API          = 0
config_INTERNAL                 = 0
config_LOAD_COMPD_API           = 0
config_LOAD_RAW_API             = 1
config_LOAD_TO_API              = 1
config_LOAD_UNDER_D000_DFFF     = 0
config_LOAD_VIA_KERNAL_FALLBACK = 1
config_MEM_DECOMP_API           = 0
config_MEM_DECOMP_TO_API        = 0
config_NTSC_COMPATIBILITY       = 0
config_ONLY_1541_AND_COMPATIBLE = 0
config_PREFER_SPEED_OVER_SIZE   = 0
config_UNINSTALL_API            = 1

; status codes
status_OK                       = $00
status_DEVICE_INCOMPATIBLE      = $fb
status_TOO_MANY_DEVICES         = $fc
status_GENERIC_KERNAL_ERROR     = $fd
status_DEVICE_NOT_PRESENT       = $fe
status_FILE_NOT_FOUND           = $ff

; zeropage $f5-$fd
loader_zp_first                 = $f5
loadaddrlo                      = $f5
loadaddrhi                      = $f6
endaddrlo                       = $f7
endaddrhi                       = $f8
loader_zp_last                  = $fc

; install $a000-$bc74
install                         = $a000

; resident $0b00-$0e9e
loadraw                         = $0b00
uninstall                       = $0e91
