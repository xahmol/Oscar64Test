
NAME          = benchmark
BENCH        ?= BITFIRE
LOADERCPU    ?= 100
ALIGNED      ?= 0
_PLATFORM_    = c64

export LOG

BUILDDIR      = ../../build
DISKIMAGE     = $(BUILDDIR)/$(NAME)-$(LOADERCPU)-$(_PLATFORM_).d64

default: $(DISKIMAGE)

run_bitfire:
	make run BENCH=BITFIRE

run_spindle_code:
	make run BENCH=SPINDLE_CODE

run_spindle_graphics:
	make run BENCH=SPINDLE_GRAPHICS

perfbench_bitfire:
	make perfbench BENCH=BITFIRE

perfbench_spindle_code:
	make perfbench BENCH=SPINDLE_CODE

perfbench_spindle_graphics:
	make perfbench BENCH=SPINDLE_GRAPHICS

perfbench: LOG=1
perfbench:
	rm -f benchmark.log
	make clean
	make run LOADERCPU=100
	make run LOADERCPU=90
	make run LOADERCPU=80
	make run LOADERCPU=70
	make run LOADERCPU=60
	make run LOADERCPU=50
	make run LOADERCPU=40
	make run LOADERCPU=30
	make run LOADERCPU=20
	make run LOADERCPU=10
	$(MAKE_TEX) < benchmark.log

perftest: LOG=1
perftest:
	rm -f benchmark.log
	make clean
	make run LOADERCPU=100
	$(MAKE_TEX) < benchmark.log

ifeq "$(BENCH)" "BITFIRE"
MONCOMMANDS := benchmark-bitfire.mon
MAKE_TEX    := ./make-tex-graph-bitfire.lua
else
MONCOMMANDS := benchmark-spindle.mon
ifeq "$(BENCH)" "SPINDLE_CODE"
MAKE_TEX    := ./make-tex-graph-spindle-code.lua
else
MAKE_TEX    := ./make-tex-graph-spindle-graphics.lua
endif
endif

ifeq "$(LOG)" "1"
VICE          = x64sc +saveres -warp -minimized -autostartprgmode 1 +cart -debugcart -monlogname benchmark.log -moncommands $(MONCOMMANDS)
else
VICE          = x64sc
endif
EMU           = $(VICE) -drive8type 1541 -drive9type 0 -8
EMU71         = $(VICE) -drive8type 1571 -drive9type 0 -8
EMU81         = $(VICE) -drive8type 1581 -drive9type 0 -8

AS            = cl65
AS_FLAGS      = -Wa -I../../build -u __EXEHDR__

CC1541        = ../../tools/cc1541/cc1541 -v
#CC1541         = ../../tools/cc1541/repo4/cc1541/cc1541 -v
CC1541_SOURCE = ../../tools/cc1541

B2            = ../../tools/b2/b2.exe
B2_SOURCE     = ../../tools/b2

BITNAX        = ../../tools/bitnax-07a8c67/lz

DOYNAX_LZ     = ../../tools/doynamite1.1/lz

EXO           = ../../tools/exomizer-3.1/src/exomizer
EXO_SOURCE    = ../../tools/exomizer-3.1/src

LC            = ../../tools/wcrush/wcrush/wcrush
LCSPEED       = 6
LC_SOURCE     = ../../tools/wcrush

LZSA2         = ../../tools/lzsa/lzsa
LZSA2_SOURCE  = ../../tools/lzsa

NC            = ../../tools/nucrunch-1.0.1/target/release/nucrunch
NC_SOURCE     = ../../tools/nucrunch-1.0.1

PU            = ../../tools/pucrunch/pucrunch
PU_SOURCE     = ../../tools/pucrunch

SUBSIZER      = ../../tools/subsizer-0.7pre1/subsizer
SUBSIZER_SRC  = ../../tools/subsizer-0.7pre1/src

TC            = python ../../tools/tinycrunch_v1.2/tc_encode.py

TS_ENCODER    = ../../tools/tscrunch/tscrunch.py
TS            = python3 $(TS_ENCODER)

ZX0           = ../../tools/dali/dali
ZX0_SRC       = ../../tools/dali

CONV          = ../../tools/compressedfileconverter.pl

RM            = rm -f
CP            = cp
MV            = mv

INTERMDIR     = ../../build/intermediate
LOADER_SRC    = ../../src
LOADER        = $(BUILDDIR)/loader-$(_PLATFORM_).prg

RESOURCESDIR  = ../resources
TEST          = $(RESOURCESDIR)/test.prg

SOURCE        = $(NAME).s
LOADERCFG     = loaderconfig.inc
ASSEMBLE      = $(INTERMDIR)/$(NAME)-$(LOADERCPU)-uncompressed-$(_PLATFORM_).prg
DISKIMAGE81   = $(BUILDDIR)/$(NAME)-$(_PLATFORM_).d81

EXTENSION_NONE        := prg
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

COMPRESSOR  := $(shell grep -m 1 'DECOMPRESSORS::' $(LOADERCFG) | sed 's/.*DECOMPRESSORS::\([^; ]*\).*/\1/')
COMPEXT     := $(EXTENSION_$(COMPRESSOR))

BENCH_IDX_BITFIRE = 0
FILENAMES_BITFIRE = test a b c d e f g h i j k l m n o p q r
MINTRACKS_BITFIRE   =  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
INTERLEAVES_BITFIRE =  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
#INTERLEAVES_BITFIRE =  -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4
#INTERLEAVES_BITFIRE =  -4 -4 -4 -4 -4 -4 -4 -3 -3 -3 -3 -3 -3 -3 -3 -3 -3 -3 -3

BENCH_IDX_SPINDLE_CODE = 1
FILENAMES_SPINDLE_CODE = test x0 x1 x2 x3 x4 x5 x6 x7
MINTRACKS_SPINDLE_CODE   =  1  1  1  1  1  1  1  1  1
INTERLEAVES_SPINDLE_CODE =  4  4  4  4  4  4  4  4  4

BENCH_IDX_SPINDLE_GRAPHICS = 2
FILENAMES_SPINDLE_GRAPHICS = test y0 y1 y2 y3 y4 y5 y6 y7
MINTRACKS_SPINDLE_GRAPHICS   =  1  1  1  1  1  1  1  1  1
INTERLEAVES_SPINDLE_GRAPHICS =  4  4  4  4  4  4  4  4  4

FILES        = $(patsubst %, $(INTERMDIR)/%.$(COMPEXT), $(FILENAMES_$(BENCH)))
IMAGEFILES__ = $(foreach filename, $(FILENAMES_$(BENCH)),$(patsubst %,^-f^"%",$(filename).$(COMPEXT))$(patsubst %,^-w^$(INTERMDIR)/%.$(COMPEXT),$(filename)))
IMAGEFILES_  = $(subst "test.$(COMPEXT)","test", $(IMAGEFILES__))
IMAGEFILES   = $(subst ^, ,$(join $(addprefix -r^,$(MINTRACKS_$(BENCH))),$(join $(addprefix ^-S^,$(INTERLEAVES_$(BENCH))),$(patsubst %,^%,$(IMAGEFILES_)))))
IMAGEFILES81 = $(subst ^, ,$(join $(addprefix -r^,$(MINTRACKS_$(BENCH))),$(patsubst %,^%,$(IMAGEFILES_))))

ifeq "$(COMPRESSOR)" "NONE"
$(DISKIMAGE): $(ASSEMBLE) $(FILES) $(CC1541)
	$(RM) $@
	$(CC1541) -n "normal is boring" -i plush -4 \
	$(IMAGEFILES) \
	-f test-loopfile -l test \
	-f test-loopfile2 -l test \
	$@
else
$(DISKIMAGE): $(ASSEMBLE) $(FILES) $(CC1541)
	$(RM) $@
	$(CC1541) -n "normal is boring" -i plush \
	$(IMAGEFILES) \
	-f test-loopfile -l test \
	-S 4 -r 29 -e -f $(NAME) -w $< \
	-g $(basename $@).g64 \
	$@
endif
#	-w $(RESOURCESDIR)/room_0031.prg \
#	-w $(RESOURCESDIR)/0031.zx0.prg \
#	-w $(RESOURCESDIR)/zb \

$(DISKIMAGE81): $(ASSEMBLE) $(FILES) $(CC1541)
	$(RM) $@
	$(CC1541) -n "normal is boring" -i plush \
	-r 39 -f $(NAME) -w $< \
	$(IMAGEFILES81) \
	$@

$(ASSEMBLE): $(SOURCE) $(LOADER)
	$(AS) $(AS_FLAGS) -C c64-asm.cfg -Wa -DPLATFORM=64 -Wa -DBENCHMARK=$(BENCH_IDX_$(BENCH)) -Wa -DLOADERCPU=$(LOADERCPU) -o $@ $<

$(LOADER): $(LOADERCFG)
	make -C $(LOADER_SRC) EXTCONFIGPATH=../samples/$(NAME) PLATFORM=$(_PLATFORM_) PROJECT=$(NAME) INSTALL=0f00 RESIDENT=0a00 ZP=02 prg

run: $(DISKIMAGE)
ifeq "$(ALIGNED)" "0"
	$(EMU) $(realpath $^) $(ASSEMBLE)
else
	$(EMU) $(basename $(realpath $^)).g64 $(ASSEMBLE)
endif

run71 run70: $(DISKIMAGE)
	$(EMU71) $(realpath $^) $(ASSEMBLE)

run81: $(DISKIMAGE81)
	$(EMU81) $(realpath $^) $(ASSEMBLE)

clean:
	-$(RM) *.o $(ASSEMBLE) $(DISKIMAGE) $(BUILDDIR)/loadersymbols-c64.prg $(BUILDDIR)/install-c64.prg $(BUILDDIR)/loader-c64.prg \
	$(INTERMDIR)/test.prg \
	$(INTERMDIR)/*.b2 $(INTERMDIR)/*.bnx  $(INTERMDIR)/*.dnx $(INTERMDIR)/*.exo $(INTERMDIR)/*.lc $(INTERMDIR)/*.lzsa2 $(INTERMDIR)/*.nc $(INTERMDIR)/*.pu $(INTERMDIR)/*.ssz $(INTERMDIR)/*.tc $(INTERMDIR)/*.ts $(INTERMDIR)/*.zx0


$(CC1541): $(CC1541_SOURCE)/cc1541.c
	$(MAKE) -C $(CC1541_SOURCE) cc1541


$(INTERMDIR)/%.prg: $(RESOURCESDIR)/%
	$(CP) $^ $@

EXTENSIONS := prg bnx b2 dnx exo lc lzsa2 nc pu ssz tc ts zx0

define COPY
$(INTERMDIR)/x%.$(1): $(INTERMDIR)/x.$(1)
	$(CP) $$^ $$@

$(INTERMDIR)/y%.$(1): $(INTERMDIR)/y.$(1)
	$(CP) $$^ $$@
endef

$(foreach extension,$(EXTENSIONS),$(eval $(call COPY,$(extension))))

$(INTERMDIR)/%.b2: $(INTERMDIR)/%.prg $(B2)
	$(B2) $<
	$(MV) $<.b2 $@

$(INTERMDIR)/%.bnx: $(INTERMDIR)/%.prg $(BITNAX)
	$(BITNAX) --bitfire -o $@ $<

$(INTERMDIR)/%.dnx: $(INTERMDIR)/%.prg $(DOYNAX_LZ)
	$(DOYNAX_LZ) -o $@ $<
	$(CONV) dnx $< $@ $@

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

$(INTERMDIR)/%.ts: $(INTERMDIR)/%.prg $(TS_ENCODER)
	$(TS) -i $< $@

$(INTERMDIR)/%.zx0: $(INTERMDIR)/%.prg $(ZX0)
	$(ZX0) -o $@ $<

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

$(TS):
	$(BUILD_TS)

$(ZX0):
	$(MAKE) -C $(ZX0_SRC)
