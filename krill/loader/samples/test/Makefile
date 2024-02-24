
D71 = d71
#D71 = d64 # use this if ONLY_1541_AND_COMPATIBLE != 0

ifeq ($(PLATFORM),)
_PLATFORM_     = c64
else ifeq ($(PLATFORM),c128)
_PLATFORM_     = c128
else ifeq ($(PLATFORM),c16)
_PLATFORM_     = c16
else ifeq ($(PLATFORM),c116)
_PLATFORM_     = c16
else ifeq ($(PLATFORM),plus4)
_PLATFORM_     = c16
else
_PLATFORM_     = $(PLATFORM)
endif

ifeq ($(USE_VICE),)
USE_VICE       = 0
endif


ifneq ($(_PLATFORM_),c64)
ifneq ($(_PLATFORM_),c128)
ifneq ($(_PLATFORM_),c16)
$(error invalid platform $(_PLATFORM_) specified)
endif
endif
endif


ARCH           = $(shell uname | tr "[a-z]" "[A-Z]" | tr -c -d "[A-Z]")
HOME          := $(shell echo ~)

ifneq ($(findstring CYGWINNT,$(ARCH)),)
    ifeq (CYGWINNT,$(ARCH))
ARCH           = WIN32
    else
ARCH           = WIN64
    endif
endif
ifneq ($(findstring DARWIN,$(ARCH)),)
ARCH           = MACOSX
endif


ifeq ($(_PLATFORM_),c16)
    ifeq ($(USE_VICE),0)
        ifneq ($(findstring WIN,$(ARCH)),)
USE_PLUS4EMU   = 0
USE_YAPE       = 1
        else
USE_PLUS4EMU   = 1
USE_YAPE       = 0
        endif
    else
USE_PLUS4EMU   = 0
USE_YAPE       = 0
    endif
else
USE_PLUS4EMU   = 0
USE_YAPE       = 0
endif


ifeq ($(_PLATFORM_),c16)
    ifeq ($(ARCH),MACOSX)
    # MacOSX, these programs must be installed as applications
VICE           = xplus4
VICE128        = $(VICE)
PLUS4EMU       = open /Applications/plus4emu.app --args # -cfg "$(HOME)/Library/Application Support/plus4emu/config/P4_64k_NTSC.cfg"
    else
VICE           = xplus4
PLUS4EMU       = plus4emu
        ifeq ($(ARCH),WIN64)
YAPE           = YapeWin64
        else
YAPE           = Yape
        endif
    endif
else ifeq ($(_PLATFORM_),c128)
VICE           = x128
VICE128        = x128
else
VICE           = x64sc
VICE128        = x128
endif

ifeq ($(_PLATFORM_),c16)
# for testing, VICE only
DRIVE9TYPE     = 1551
else
DRIVE9TYPE     = 0
endif

ifneq ($(USE_PLUS4EMU),0)
EMU41          = $(PLUS4EMU) floppy.a.driveType=0 floppy.b.driveType=1 -disk
EMU51          = $(PLUS4EMU) floppy.a.driveType=1 floppy.b.driveType=1 -disk # C-16 only
else
EMU41          = $(VICE) -drive8type 1541 -drive9type $(DRIVE9TYPE) -autostart
EMU51          = $(VICE) -drive8type 1551 -drive9type $(DRIVE9TYPE) -autostart # C-16 only
endif
# the following mode is only supported by VICE and YAPE
EMU81          = $(VICE) -drive8type 1581 -drive9type $(DRIVE9TYPE) -autostart
# the following modes are only supported by VICE
EMU42          = $(VICE) -drive8type 1542 -drive9type $(DRIVE9TYPE) -autostart # 1541-II
EMU70          = $(VICE) -drive8type 1570 -drive9type $(DRIVE9TYPE) -autostart
EMU71          = $(VICE) -drive8type 1571 -drive9type $(DRIVE9TYPE) -autostart
EMU7141        = $(VICE) -drive8type 1571 -drive9type $(DRIVE9TYPE) -autostart # 1571 with .d64
EMU73          = $(VICE128) -drive8type 1573 -drive9type 0 -autostart # 1571CR
EMU7341        = $(VICE128) -drive8type 1573 -drive9type 0 -autostart # 1571CR with .d64
EMU2000        = $(VICE) -drive8type 2000 -drive9type 0 -autostart
EMU4000        = $(VICE) -drive8type 4000 -drive9type 0 -autostart

ifneq ($(USE_PLUS4EMU),0)
EMU941         = $(PLUS4EMU) floppy.a.driveType=0 floppy.b.driveType=0 -disk
EMU951         = $(PLUS4EMU) floppy.a.driveType=1 floppy.b.driveType=0 -disk # C-16 only
else
EMU941         = $(VICE) -drive8type 1541 -drive9type 1541 -autostart
EMU94171       = $(VICE) -drive8type 1541 -drive9type 1571 -autostart
EMU94181       = $(VICE) -drive8type 1541 -drive9type 1581 -autostart
EMU951         = $(VICE) -drive8type 1551 -drive9type 1541 -autostart # C-16 only
endif
# the following modes are only supported by VICE
EMU942         = $(VICE) -drive8type 1542 -drive9type 1541 -autostart # 1541-II
EMU970         = $(VICE) -drive8type 1570 -drive9type 1541 -autostart
EMU971         = $(VICE) -drive8type 1571 -drive9type 1571 -autostart
EMU97141       = $(VICE) -drive8type 1571 -drive9type 1541 -autostart # 1571 with .d64
EMU973         = $(VICE128) -drive8type 1573 -drive9type 1541 -autostart # 1571CR
EMU97341       = $(VICE128) -drive8type 1573 -drive9type 1541 -autostart # 1571CR with .d64
EMU981         = $(VICE) -drive8type 1581 -drive9type 1541 -drive10type 1541 -drive11type 1571 -autostart
EMU92000       = $(VICE) -drive8type 2000 -drive9type 1541 -autostart
EMU94000       = $(VICE) -drive8type 4000 -drive9type 1541 -autostart


ECHO           = echo
PRINTF         = printf
TAIL           = tail

MAKE           = make
CP             = cp
MV             = mv
RM             = rm -rf
MKDIR          = mkdir
CAT            = cat

AS             = ca65
LD             = ld65
C1541          = c1541

CC1541         = ../../tools/cc1541/cc1541
#CC1541         = ../../tools/cc1541/repo4/cc1541/cc1541
CC1541_SOURCE  = ../../tools/cc1541


BITNAX         = ../../tools/bitnax-07a8c67/lz

B2             = ../../tools/b2/b2.exe
B2_SOURCE      = ../../tools/b2

EXO            = ../../tools/exomizer-3.1/src/exomizer
EXO_SOURCE     = ../../tools/exomizer-3.1/src

DOYNAX_LZ      = ../../tools/doynamite1.1/lz

LC             = ../../tools/wcrush/wcrush/wcrush
LCSPEED        = 6
LC_SOURCE      = ../../tools/wcrush

LZSA2          = ../../tools/lzsa/lzsa
LZSA2_SOURCE   = ../../tools/lzsa

NC             = ../../tools/nucrunch-1.0.1/target/release/nucrunch
NC_SOURCE      = ../../tools/nucrunch-1.0.1

PU             = ../../tools/pucrunch/pucrunch
PU_SOURCE      = ../../tools/pucrunch

SUBSIZER       = ../../tools/subsizer-0.7pre1/subsizer
SUBSIZER_SRC   = ../../tools/subsizer-0.7pre1/src

TC             = python ../../tools/tinycrunch_v1.2/tc_encode.py

TS             = python3 ../../tools/tscrunch/tscrunch.py

ZX0            = ../../tools/dali/dali
ZX0_SRC        = ../../tools/dali

CONV           = ../../tools/compressedfileconverter.pl

LOADER         = ../../src
LDRBIN         = ../../build
LDRINC         = ../../include

BUILDDIR       = ../../build
INTERMDIR      = ../../build/intermediate

RESOURCESDIR   = ../resources


AS_FLAGS       = -I $(LDRINC) -I ../../../shared
PU_FLAGS       = -d -l 0x1300 -x 0x1300 -i 0
ifeq ($(_PLATFORM_),c16)
AS_FLAGS      += -t c16 -D PLATFORM=16
PU_FLAGS      += -c16
else ifeq ($(_PLATFORM_),c128)
AS_FLAGS      += -t c128 -D PLATFORM=128
PU_FLAGS      += -c128
else
AS_FLAGS      += -t c64 -D PLATFORM=64
PU_FLAGS      += -c64 -g 0x37
endif

EXTENSION_            := prg
EXTENSION_BITNAX      := bnx
EXTENSION_BYTEBOOZER2 := b2
EXTENSION_DOYNAX_LZ   := dnx
EXTENSION_EXOMIZER    := exo
EXTENSION_LEVELCRUSH  := lc
EXTENSION_LZSA2       := lzsa2
EXTENSION_NUCRUNCH    := nc
EXTENSION_PUCRUNCH    := pu
EXTENSION_SUBSIZER    := ssz
EXTENSION_TINYCRUNCH  := tc
EXTENSION_TSCRUNCH    := ts
EXTENSION_ZX0         := zx0

COMPRESSOR := $(shell grep -v 'DECOMPRESSORS::NONE' ../../include/config.inc | grep 'DECOMPRESSORS::' | sed 's/.*DECOMPRESSORS::\([^; ]*\).*/\1/')
COMPEXT    := $(EXTENSION_$(COMPRESSOR))


default: all

tellarch:
	@$(ECHO) $(ARCH)


$(BUILDDIR):
	$(MKDIR) $@

$(INTERMDIR):
	$(MKDIR) $@


SHAREDDEPS     = $(LOADER)/Makefile \
                 $(LDRINC)/config.inc

LOADERDEPS     = $(SHAREDDEPS) \
                 $(LOADER)/decompress/bitnaxdecomp.s \
                 $(LOADER)/decompress/b2decomp.s \
                 $(LOADER)/decompress/doynaxdecomp.s \
                 $(LOADER)/decompress/exodecomp.s \
                 $(LOADER)/decompress/lcdecomp.s \
                 $(LOADER)/decompress/lzsa2decomp.s \
                 $(LOADER)/decompress/ncdecomp.s \
                 $(LOADER)/decompress/pudecomp.s \
                 $(LOADER)/decompress/subsizerdecomp.s \
                 $(LOADER)/decompress/tcdecomp.s \
                 $(LOADER)/decompress/tsdecomp.s \
                 $(LOADER)/decompress/zx0decomp.s \
                 $(LOADER)/drives/drivecode-common.inc $(LOADER)/drives/drivecode1541.s $(LOADER)/drives/drivecode1571.s $(LOADER)/drives/drivecode1581.s \
                 $(LOADER)/hal/hal.inc $(LOADER)/hal/hal-c64-c128.inc $(LOADER)/hal/hal-c16.inc \
                 $(LOADER)/install.s \
                 $(LOADER)/resident.s \
                 $(LOADER)/customdrivecode.s \
                 $(LOADER)/save.s \
                 $(LDRINC)/loader.inc

DISKIMAGEDEPS  = Makefile $(CC1541) \
                 $(INTERMDIR)/test-$(_PLATFORM_).prg \
                 $(INTERMDIR)/pic1.prg          $(INTERMDIR)/pic2.prg \
                 $(INTERMDIR)/pic1hi.prg        $(INTERMDIR)/pic2hi.prg \
                 $(INTERMDIR)/pic1.$(COMPEXT)   $(INTERMDIR)/pic2.$(COMPEXT) \
                 $(INTERMDIR)/pic1hi.$(COMPEXT) $(INTERMDIR)/pic2hi.$(COMPEXT)


all: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64 \
     $(BUILDDIR)/loadertest-$(_PLATFORM_).d71 \
     $(BUILDDIR)/loadertest-$(_PLATFORM_).d81


$(LDRBIN)/loader-$(_PLATFORM_).lib: $(LOADERDEPS) | $(BUILDDIR) $(INTERMDIR)
	$(MAKE) -C $(LOADER) lib


../../version.inc:
	$(MAKE) -C ../.. version.inc

.PHONY: datetime.inc
datetime.inc:
	$(ECHO) ".define DATETIME \"`date -R | cut -d ' ' -f 1-5`\"" > $@

$(INTERMDIR)/test-$(_PLATFORM_).o: test.s datetime.inc $(LDRBIN)/loader-$(_PLATFORM_).lib ../../version.inc Makefile | $(BUILDDIR) $(INTERMDIR)
	$(AS) $(AS_FLAGS) -o $@ $<

$(INTERMDIR)/test-$(_PLATFORM_)-uncompressed.prg: Linkfile $(INTERMDIR)/test-$(_PLATFORM_).o $(LDRBIN)/loader-$(_PLATFORM_).lib
	$(LD) -o $@ $(INTERMDIR)/test-$(_PLATFORM_).o -C Linkfile -vm -m $@.map -Ln $@.lbl $(LDRBIN)/loader-$(_PLATFORM_).lib

$(INTERMDIR)/test-$(_PLATFORM_).prg: $(INTERMDIR)/test-$(_PLATFORM_)-uncompressed.prg $(PU)
	$(PU) $(PU_FLAGS) $< $@


$(INTERMDIR)/pic1hi.prg: $(RESOURCESDIR)/pic1.bin
	$(PRINTF) '\000\300' | $(CAT) - $? > $@ # octal 300 = hex c0

$(INTERMDIR)/pic2hi.prg: $(RESOURCESDIR)/pic2.bin
	$(PRINTF) '\000\300' | $(CAT) - $? > $@ # octal 300 = hex c0

$(INTERMDIR)/%.prg: $(RESOURCESDIR)/%.bin
	$(PRINTF) '\000\140' | $(CAT) - $? > $@ # octal 140 = hex 60

# Rules to compress data files
$(INTERMDIR)/%.b2: $(INTERMDIR)/%.prg $(B2)
	$(B2) $<
	$(MV) $<.b2 $@

$(INTERMDIR)/%.bnx: $(INTERMDIR)/%.prg $(BITNAX)
	$(BITNAX) --bitfire -o $@ $<

$(INTERMDIR)/%.dnx: $(INTERMDIR)/%.prg $(DOYNAX_LZ)
	$(DOYNAX_LZ) -o $@ $<

$(INTERMDIR)/%.exo: $(INTERMDIR)/%.prg $(EXO)
	$(EXO) mem -f $< -o $@

$(INTERMDIR)/%.lc: $(INTERMDIR)/%.prg $(LC)
	$(LC) $(LCSPEED) $< $@
	$(CONV) lc $< $@ $@

$(INTERMDIR)/%.lzsa2: $(INTERMDIR)/%.prg $(LZSA2)
	$(LZSA2) -f 2 $< $@

$(INTERMDIR)/%.nc: $(INTERMDIR)/%.prg $(NC)
	$(NC) $< --auto -o $@

$(INTERMDIR)/%.pu: $(INTERMDIR)/%.prg $(PU)
	$(PU) -c0 -x 0 $< $@

$(INTERMDIR)/%.ssz: $(INTERMDIR)/%.prg $(SUBSIZER)
	$(SUBSIZER) -m -f -o $@ $<

$(INTERMDIR)/%.tc: $(INTERMDIR)/%.prg
	$(TC) --inPlace $< $@

$(INTERMDIR)/%.ts: $(INTERMDIR)/%.prg
	$(TS) -i $< $@

$(INTERMDIR)/%.zx0: $(INTERMDIR)/%.prg $(ZX0)
	$(ZX0) -o $@ $<


ifneq ($(_PLATFORM_),c16)
APPLY_EXTRAS = -r 19 -f "skew1" -w $(RESOURCESDIR)/skew1.prg
endif

ifeq ($(_PLATFORM_),c128)
DISKIMAGEDEPS += $(RESOURCESDIR)/bootblock.bin
APPLY_BOOTBLOCK = $(TAIL) -c +257 $@ | $(CAT) $(RESOURCESDIR)/bootblock.bin - > $@.boot && $(RM) $@ && $(MV) $@.boot $@
endif

ifeq ($(_PLATFORM_),c16)
INTERLEAVE = 4
D64SS1   = 2
D64SS2   = 12
D64SS3   = 16
D64SS4   = 8
D64FSNT1 = 3
D64FSNT2 = 13
else
INTERLEAVE = 4
D64SS1   = 8
D64SS2   = 15
D64SS3   = 14
D64SS4   = 11
D64FSNT1 = 1
D64FSNT2 = 8
endif

$(BUILDDIR)/loadertest-$(_PLATFORM_).d64 $(BUILDDIR)/loadertest-$(_PLATFORM_).g64: $(DISKIMAGEDEPS)
	$(CC1541) -v -n "normal is boring" -i plush -d 10 -g $(basename $@).g64 \
	 \
	 -f "loader test" -s 8 -r 19 -w $(INTERMDIR)/test-$(_PLATFORM_).prg \
	 $(APPLY_EXTRAS) \
	 \
	 -r 2 -S $(INTERLEAVE) \
	 -f r1-raw -b $(D64SS1) -F $(D64FSNT1) -E -w $(INTERMDIR)/pic1.prg \
	 -f r2-raw -b $(D64SS2) -F $(D64FSNT2) -E -w $(INTERMDIR)/pic2.prg \
	 -f p1-pak -b $(D64SS3)                -E -w $(INTERMDIR)/pic1.$(COMPEXT) \
	 -f p2-pak -b $(D64SS4)                -E -w $(INTERMDIR)/pic2.$(COMPEXT) \
	 -f lf-loopfile -l r1-raw \
	 \
	 -r 24 -S 4 \
	 -f ab-pic1hiram.bin                      -w $(INTERMDIR)/pic1hi.prg \
	 -f bb-pic2hiram.bin                      -w $(INTERMDIR)/pic2hi.prg \
	 -r 30 -f ap-pic1hiram.pak                -w $(INTERMDIR)/pic1hi.$(COMPEXT) \
	 -r 34 -f bp-pic2hiram.pak                -w $(INTERMDIR)/pic2hi.$(COMPEXT) \
	 -f lg-loopfile -l ab-pic1hiram.bin \
	 \
	$(basename $@).d64
	$(APPLY_BOOTBLOCK)
	@echo Using $(COMPRESSOR) $(COMPEXT)

ifeq ($(_PLATFORM_),c128)
D71RT1 = 14
D71RT2 = 14 # 16
D71SS1 = 13
D71SS2 = 18
else
D71RT1 = 22
D71RT2 = 24
D71SS1 = 5
D71SS2 = 8
endif

$(BUILDDIR)/loadertest-$(_PLATFORM_).d71: $(DISKIMAGEDEPS)
	$(CC1541) -v -n "normal is boring" -i plush -d 17 -S $(INTERLEAVE) \
	 -f "loader test"    -s 8 -r 11                        -w $(INTERMDIR)/test-$(_PLATFORM_).prg \
	 \
	 -f r1-raw           -r $(D71RT1) -b $(D71SS1) -F -17 -c -w $(INTERMDIR)/pic1.prg \
	 -f r2-raw           -r $(D71RT1) -b $(D71SS2) -F -17 -c -w $(INTERMDIR)/pic2.prg \
	 -f p1-pak           -r $(D71RT2) -b 6              -c -w $(INTERMDIR)/pic1.$(COMPEXT) \
	 -f p2-pak           -r $(D71RT2)                   -c -w $(INTERMDIR)/pic2.$(COMPEXT) \
	 -f lf-loopfile      -l r1-raw \
	 \
	 -f ab-pic1hiram.bin -r 29                          -c -w $(INTERMDIR)/pic1hi.prg \
	 -f bb-pic2hiram.bin -r 29                          -c -w $(INTERMDIR)/pic2hi.prg \
	 -f ap-pic1hiram.pak -r 31                          -c -w $(INTERMDIR)/pic1hi.$(COMPEXT) \
	 -f bp-pic2hiram.pak -r 31                          -c -w $(INTERMDIR)/pic2hi.$(COMPEXT) \
	 -f lg-loopfile      -l ab-pic1hiram.bin \
	 \
	$@
	$(APPLY_BOOTBLOCK)
	@echo Using $(COMPRESSOR) $(COMPEXT)

$(BUILDDIR)/loadertest-$(_PLATFORM_).d81: $(DISKIMAGEDEPS)
	$(CC1541) -v -n "normal is boring" -i plush -d 39 \
	 -f "loader test" -r 11 -w $(INTERMDIR)/test-$(_PLATFORM_).prg \
	 \
	 -r 3 \
	 -f r1-raw -w $(INTERMDIR)/pic1.prg \
	 -f r2-raw -w $(INTERMDIR)/pic2.prg \
	 -f p1-pak -w $(INTERMDIR)/pic1.$(COMPEXT) \
	 -f p2-pak -w $(INTERMDIR)/pic2.$(COMPEXT) \
	 -f lf-loopfile -l r1-raw \
	 \
	 -r 6 \
	 -f ab-pic1hiram.bin -w $(INTERMDIR)/pic1hi.prg \
	 -f bb-pic2hiram.bin -w $(INTERMDIR)/pic2hi.prg \
	 -f ap-pic1hiram.pak -w $(INTERMDIR)/pic1hi.$(COMPEXT) \
	 -f bp-pic2hiram.pak -w $(INTERMDIR)/pic2hi.$(COMPEXT) \
	 -f lg-loopfile -l ab-pic1hiram.bin \
	 \
	$@
	$(APPLY_BOOTBLOCK)
	@echo Using $(COMPRESSOR) $(COMPEXT)


.PHONY: run run41 run51 run41ii run42 run70 run71 run7141 run73 run7341 run81 run2000 run4000
.PHONY: run9 run941 run94171 run94181 run951 run941ii run942 run970 run971 run97141 run973 run97341 run981 run92000 run94000

ifneq ($(USE_YAPE),0)
run run41 run51: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(YAPE) "..\..\build\loadertest-$(_PLATFORM_).d64"
else
run run41: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(EMU41) $(realpath $^)

run51: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(EMU51) $(realpath $^)
endif

run41ii run42: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(EMU42) $(realpath $^)

run70: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(EMU70) $(realpath $^)

run71: $(BUILDDIR)/loadertest-$(_PLATFORM_).$(D71)
	$(EMU71) $(realpath $^)

run7141: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(EMU7141) $(realpath $^)

run73: $(BUILDDIR)/loadertest-$(_PLATFORM_).$(D71)
	$(EMU73) $(realpath $^)

run7341: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(EMU7341) $(realpath $^)

ifneq ($(USE_YAPE),0)
run81: $(BUILDDIR)/loadertest-$(_PLATFORM_).d81
	$(YAPE) "..\..\build\loadertest-$(_PLATFORM_).d81"
else
run81: $(BUILDDIR)/loadertest-$(_PLATFORM_).d81
	$(EMU81) $(realpath $^)
endif

run2000: $(BUILDDIR)/loadertest-$(_PLATFORM_).d81
	$(EMU2000) $(realpath $^)

run4000: $(BUILDDIR)/loadertest-$(_PLATFORM_).d81
	$(EMU4000) $(realpath $^)

ifneq ($(USE_YAPE),0)
run9 run941 run951: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(YAPE) /DISK9:"..\..\build\loadertest-$(_PLATFORM_).d64" "..\..\build\loadertest-$(_PLATFORM_).d64"
else
run9 run941: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(EMU941) $(realpath $^)

run94171: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(EMU94171) $(realpath $^)

run94181: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(EMU94181) $(realpath $^)

run951: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(EMU951) $(realpath $^)
endif

run941ii run942: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(EMU942) $(realpath $^)

run970: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(EMU970) $(realpath $^)

run971: $(BUILDDIR)/loadertest-$(_PLATFORM_).$(D71)
	$(EMU971) $(realpath $^)

run97141: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(EMU97141) $(realpath $^)

run973: $(BUILDDIR)/loadertest-$(_PLATFORM_).$(D71)
	$(EMU973) $(realpath $^)

run97341: $(BUILDDIR)/loadertest-$(_PLATFORM_).d64
	$(EMU97341) $(realpath $^)

ifneq ($(USE_YAPE),0)
run981: $(BUILDDIR)/loadertest-$(_PLATFORM_).d81
	$(YAPE) /DISK9:"..\..\build\loadertest-$(_PLATFORM_).d81" "..\..\build\loadertest-$(_PLATFORM_).d81"
else
run981: $(BUILDDIR)/loadertest-$(_PLATFORM_).d81
	$(EMU981) "$(realpath $^):loader test"
endif

run92000: $(BUILDDIR)/loadertest-$(_PLATFORM_).d81
	$(EMU92000) "$(realpath $^):loader test"

run94000: $(BUILDDIR)/loadertest-$(_PLATFORM_).d81
	$(EMU94000) "$(realpath $^):loader test"


clean:
	-$(RM) $(INTERMDIR)
	-$(RM) $(LDRBIN)/loader-c64.lib
	-$(RM) $(LDRBIN)/loader-c128.lib
	-$(RM) $(LDRBIN)/loader-c16.lib

distclean:
	-$(RM) $(BITNAX)
	-$(RM) $(B2)
	-$(RM) $(DOYNAX_LZ)
	-$(RM) $(NC)
	-$(RM) $(PU)
	-$(RM) $(SUBSIZER)
	$(MAKE) -C $(CC1541_SOURCE) clean
	$(MAKE) -C $(EXO_SOURCE) clean
	$(MAKE) -C $(LC_SOURCE) clean
	$(MAKE) -C $(LZSA2_SOURCE) clean
	$(MAKE) -C $(LOADER) clean
	$(MAKE) -C $(NC_SOURCE) clean
	$(MAKE) -C $(SUBSIZER_SRC) clean
	-$(MAKE) -C $(ZX0_SRC) clean

wipe: distclean clean


$(CC1541): $(CC1541_SOURCE)/cc1541.c
	$(MAKE) -C $(CC1541_SOURCE) cc1541


$(BITNAX):
	$(CC) $@.c -o $@

$(B2):
	$(MAKE) -C $(B2_SOURCE)

$(DOYNAX_LZ):
	$(CC) $@.c -o $@

$(EXO):
	$(MAKE) -C $(EXO_SOURCE)

$(LC):
	$(MAKE) -C $(LC_SOURCE)

$(LZSA2):
	$(MAKE) -C $(LZSA2_SOURCE)

$(NC):
	$(MAKE) -C $(NC_SOURCE)

$(PU):
	$(MAKE) -C $(PU_SOURCE)

$(SUBSIZER):
	$(MAKE) -C $(SUBSIZER_SRC)

$(ZX0):
	$(MAKE) -C $(ZX0_SRC)
