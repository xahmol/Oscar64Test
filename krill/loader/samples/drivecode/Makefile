
NAME          = drivecode
_PLATFORM_    = c64

VICE          = x64sc
EMU           = $(VICE) -drive8type 1541 -drive9type 0 -autostart
EMU71         = $(VICE) -drive8type 1571 -drive9type 0 -autostart
EMU81         = $(VICE) -drive8type 1581 -drive9type 0 -autostart

AS            = cl65
AS_FLAGS      = -Wa -I../../build -Wa -I../../include -u __EXEHDR__

CC1541        = ../../tools/cc1541/cc1541 -v
CC1541_SOURCE = ../../tools/cc1541

PRINTF        = printf

RM            = rm -f
CP            = cp
MV            = mv
CAT           = cat

BUILDDIR      = ../../build
INTERMDIR     = ../../build/intermediate
LOADER_SRC    = ../../src
LOADER        = $(BUILDDIR)/customdrivecode-$(_PLATFORM_).prg

RESOURCESDIR  = ../resources
TEST          = $(RESOURCESDIR)/test.prg
PIC1          = $(INTERMDIR)/pic1.prg

SOURCE        = $(NAME).s
LOADERCFG     = loaderconfig.inc
ASSEMBLE      = $(INTERMDIR)/$(NAME)-uncompressed-$(_PLATFORM_).prg
DISKIMAGE     = $(BUILDDIR)/$(NAME)-$(_PLATFORM_).d64
DISKIMAGE81   = $(BUILDDIR)/$(NAME)-$(_PLATFORM_).d81

$(DISKIMAGE) $(DISKIMAGE81): $(ASSEMBLE) $(PIC1) $(CC1541)
	$(RM) $@
	$(CC1541) -n "normal is boring" -i plush \
	-f $(NAME) -w $< \
	-f "pic1" -w $(PIC1) \
	$@

$(ASSEMBLE): $(SOURCE) $(LOADER)
	$(AS) $(AS_FLAGS) -C c64-asm.cfg -Wa -DPLATFORM=64 -o $@ $<

$(LOADER): $(LOADERCFG)
	make -C $(LOADER_SRC) EXTCONFIGPATH=../samples/$(NAME) PLATFORM=$(_PLATFORM_) PROJECT=$(NAME) INSTALL=0d00 RESIDENT=0900 ZP=04 TRANSIENT=0a00 ZP=04 customdrivecode

$(INTERMDIR)/%.prg: $(RESOURCESDIR)/%.bin
	$(PRINTF) '\000\140' | $(CAT) - $? > $@ # octal 140 = hex 60

run: $(DISKIMAGE)
	$(EMU) $(realpath $^)

run71: $(DISKIMAGE)
	$(EMU71) $(realpath $^)

run81: $(DISKIMAGE81)
	$(EMU81) $(realpath $^)

clean:
	-$(RM) *.o $(PIC1) $(ASSEMBLE) $(DISKIMAGE) $(BUILDDIR)/loadersymbols-c64.prg $(BUILDDIR)/install-c64.prg $(BUILDDIR)/loader-c64.prg  $(BUILDDIR)/customdrivecode-c64.prg


$(CC1541): $(CC1541_SOURCE)/cc1541.c
	$(MAKE) -C $(CC1541_SOURCE) cc1541
