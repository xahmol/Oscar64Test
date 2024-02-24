
NAME          = save
_PLATFORM_    = c64

VICE          = x64sc
EMU           = $(VICE) -drive8type 1541 -drive9type 0 -autostart
EMU71         = $(VICE) -drive8type 1571 -drive9type 0 -autostart
EMU81         = $(VICE) -drive8type 1581 -drive9type 0 -autostart

AS            = cl65
AS_FLAGS      = -Wa -I../../build -Wa -I../../include -u __EXEHDR__

CC1541        = ../../tools/cc1541/cc1541 -v
CC1541_SOURCE = ../../tools/cc1541

ECHO          = echo

RM            = rm -f
CP            = cp
MV            = mv
CAT           = cat

BUILDDIR      = ../../build
INTERMDIR     = ../../build/intermediate
LOADER_SRC    = ../../src
LOADER        = $(BUILDDIR)/save-$(_PLATFORM_).prg

RESOURCESDIR  = ../resources
TEST          = $(RESOURCESDIR)/test.prg
SAVEFILE      = $(INTERMDIR)/savefile.prg

SOURCE        = $(NAME).s
LOADERCFG     = loaderconfig.inc
ASSEMBLE      = $(INTERMDIR)/$(NAME)-uncompressed-$(_PLATFORM_).prg
DISKIMAGE     = $(BUILDDIR)/$(NAME)-$(_PLATFORM_).d64
DISKIMAGE81   = $(BUILDDIR)/$(NAME)-$(_PLATFORM_).d81

$(DISKIMAGE) $(DISKIMAGE81): $(ASSEMBLE) $(SAVEFILE) $(CC1541)
	$(RM) $@
	$(CC1541) -n "normal is boring" -i plush \
	-f $(NAME) -w $< \
	-f "savefile" -w $(SAVEFILE) \
	$@

$(ASSEMBLE): $(SOURCE) $(LOADER)
	$(AS) $(AS_FLAGS) -C c64-asm.cfg -Wa -DPLATFORM=64 -o $@ $<

$(LOADER): $(LOADERCFG)
	make -C $(LOADER_SRC) EXTCONFIGPATH=../samples/$(NAME) PLATFORM=$(_PLATFORM_) PROJECT=$(NAME) INSTALL=1400 RESIDENT=0900 ZP=04 TRANSIENT=0a00 ZP=04 save

$(SAVEFILE):
	$(ECHO) "plush" > $@

run: $(DISKIMAGE)
	$(EMU) $(realpath $^)

run71: $(DISKIMAGE)
	$(EMU71) $(realpath $^)

run81: $(DISKIMAGE81)
	$(EMU81) $(realpath $^)

clean:
	-$(RM) *.o $(SAVEFILE) $(ASSEMBLE) $(DISKIMAGE) $(BUILDDIR)/loadersymbols-c64.prg $(BUILDDIR)/install-c64.prg $(BUILDDIR)/loader-c64.prg  $(BUILDDIR)/save-c64.prg


$(CC1541): $(CC1541_SOURCE)/cc1541.c
	$(MAKE) -C $(CC1541_SOURCE) cc1541
