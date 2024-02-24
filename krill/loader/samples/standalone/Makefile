
ifeq ($(PLATFORM),)
_PLATFORM_   = c64
else ifeq ($(PLATFORM),c116)
_PLATFORM_   = c16
else ifeq ($(PLATFORM),plus4)
_PLATFORM_   = c16
else
_PLATFORM_   = $(PLATFORM)
endif

ifeq ($(NO_VICE),)
NO_VICE      = 0
endif


ifneq ($(_PLATFORM_),c64)
ifneq ($(_PLATFORM_),c128)
ifneq ($(_PLATFORM_),c16)
$(error invalid platform $(_PLATFORM_) specified)
endif
endif
endif


ARCH         = $(shell uname | tr "[a-z]" "[A-Z]" | tr -c -d "[A-Z]")

ifneq ($(findstring CYGWINNT,$(ARCH)),)
    ifeq (CYGWINNT,$(ARCH))
ARCH         = WIN32
    else
ARCH         = WIN64
    endif
endif
ifneq ($(findstring DARWIN,$(ARCH)),)
ARCH         = MACOSX
endif


ifeq ($(_PLATFORM_),c16)
    ifneq ($(NO_VICE),0)
        ifneq ($(findstring WIN,$(ARCH)),)
USE_PLUS4EMU = 0
USE_YAPE     = 1
        else
USE_PLUS4EMU = 1
USE_YAPE     = 0
        endif
    else
USE_PLUS4EMU = 0
USE_YAPE     = 0
    endif
else
USE_PLUS4EMU = 0
USE_YAPE     = 0
endif


ifeq ($(_PLATFORM_),c16)
    ifeq ($(ARCH),MACOSX)
    # MacOSX, these programs must be installed as applications
VICE         = xplus4
PLUS4EMU     = open /Applications/plus4emu.app --args
    else
VICE         = xplus4
PLUS4EMU     = plus4emu
        ifeq ($(ARCH),WIN64)
YAPE         = YapeWin64
        else
YAPE         = Yape
        endif
    endif
else
    ifeq ($(_PLATFORM_),c128)
VICE         = x128
    else
VICE         = x64
    endif
endif


ifneq ($(USE_PLUS4EMU),0)
EMU          = $(PLUS4EMU) -disk
else
EMU          = $(VICE) -drive8type 1541 -drive9type 0 -autostart
endif
EMU70        = $(VICE) -drive8type 1570 -drive9type 0 -autostart


ECHO         = echo
PRINTF       = printf

AS           = ca65
LD           = ld65
PU           = ../../tools/pucrunch/pucrunch
PU_SOURCE    = ../../tools/pucrunch
CC1541       = ../../tools/cc1541

MKDIR        = mkdir -p
RM           = rm -f
ifeq ($(ARCH),MACOSX)
RMDIR        = rmdir # XXX TODO xargs to remove .DS_Store
else
RMDIR        = rmdir
endif
CAT          = cat


.PHONY: default loader assemble link compress diskimage run clean distclean wipe
.PHONY: tellarch


BUILDDIR     = ../../build
INTERMDIR    = ../../build/intermediate
LOADER_SRC   = ../../src
LOADER       = $(BUILDDIR)/loader-$(_PLATFORM_).lib

RESOURCESDIR = ../resources
PIC1         = $(INTERMDIR)/pic1.bin
PIC2         = $(INTERMDIR)/pic2.bin

ifeq ($(_PLATFORM_),c16)
STARTTRACK   = 25
STARTSECTOR  = 13
INTERLEAVE   = 3
SKEW         = 13
DEMO         = $(RESOURCESDIR)/threeve.prg
DEMONAME     = "threeve"
else ifeq ($(_PLATFORM_),c128)
STARTTRACK   = 19
STARTSECTOR  = 0
INTERLEAVE   = 3
SKEW         = 13
DEMO         = $(RESOURCESDIR)/doom_c128.prg
DEMONAME     = "doom c128"
else
STARTTRACK   = 18
STARTSECTOR  = 16
INTERLEAVE   = 3
SKEW         = 1
DEMO         = $(RESOURCESDIR)/oxyron_oneder.prg
DEMONAME     = "oneder      /oxy"
endif

NAME         = standalone

SOURCE       = $(NAME).s
LOADERCFG    = loaderconfig.inc
ASSEMBLE     = $(INTERMDIR)/$(NAME)-$(_PLATFORM_).o
LINK         = $(INTERMDIR)/$(NAME)-uncompressed-$(_PLATFORM_).prg
COMPRESS     = $(INTERMDIR)/$(NAME)-$(_PLATFORM_).prg
DISKIMAGE    = $(BUILDDIR)/$(NAME)-$(_PLATFORM_).d64

AS_FLAGS     = -I ../../../shared -I ../../include -I $(LOADER) -D EXTCONFIGPATH

PU_FLAGS     = -d -l 0x1c01 -x 0x1c01 -i 1


default: diskimage


tellarch:
	@$(ECHO) $(ARCH)


loader: $(LOADER)

$(LOADER): $(LOADERCFG)
	make -C $(LOADER_SRC) EXTCONFIGPATH=../samples/$(NAME) lib


assemble: $(ASSEMBLE)

$(ASSEMBLE): $(SOURCE) $(LOADERCFG)
	$(MKDIR) $(BUILDDIR)
	$(MKDIR) $(INTERMDIR)
ifeq ($(_PLATFORM_),c64)
	$(AS) $(AS_FLAGS) -t c64 -Wa -D PLATFORM=64 -o $@ $<
else ifeq ($(_PLATFORM_),c128)
	$(AS) $(AS_FLAGS) -t c128 -Wa -DPLATFORM=128 -o $@ $<
else
	$(AS) $(AS_FLAGS) -t c16 -Wa -D PLATFORM=16 -o $@ $<
endif


link: $(LINK)

$(LINK): Linkfile-$(_PLATFORM_) $(ASSEMBLE) $(LOADER)
	$(LD) -o $@ -C $^


compress: $(COMPRESS)

$(COMPRESS): $(LINK) $(PU)
ifeq ($(_PLATFORM_),c64)
	$(PU) $(PU_FLAGS) -c64 -g 0x37 $< $@
else ifeq ($(_PLATFORM_),c128)
	$(PU) $(PU_FLAGS) -c128 $< $@
else
	$(PU) $(PU_FLAGS) -c16 $< $@
endif


diskimage: $(DISKIMAGE)

$(DISKIMAGE): $(COMPRESS) $(DEMO) $(PIC1) $(PIC2) $(CC1541)/cc1541
	$(CC1541)/cc1541 -v -n "normal is boring" -i plush -S $(INTERLEAVE) -t \
	 \
	 -f "standalone" -s 8 -w $(COMPRESS) \
	 \
	 -f $(DEMONAME) -r $(STARTTRACK) -b $(STARTSECTOR) -F -$(SKEW) -w $(DEMO) \
	 -f pic1 -r 18 -E -w $(PIC1) \
	 -f pic2 -r 18 -E -w $(PIC2) \
	 \
	$@

ifneq ($(USE_YAPE),0)
run: $(DISKIMAGE)
	$(YAPE) "..\..\build\$(NAME)-$(_PLATFORM_).d64"
else
run: $(DISKIMAGE)
ifneq ($(USE_PLUS4EMU),0)
	$(EMU) $(realpath $^)
else
	$(EMU) $(realpath $^):standalone
endif
run70: $(DISKIMAGE)
	$(EMU70) $(realpath $^):standalone
endif


$(INTERMDIR)/%.bin: $(RESOURCESDIR)/%.bin
	$(PRINTF) '\000\140' | $(CAT) - $? > $@ # octal 140 = hex 60

$(CC1541)/cc1541: $(CC1541)/cc1541.c
	$(MAKE) -C $(CC1541) cc1541

clean:
	-$(RM) $(ASSEMBLE) $(LINK) $(COMPRESS) $(DISKIMAGE)
	-$(RM) -rf $(INTERMDIR)
	-$(RM) $(BUILDDIR)/loader-c64.lib
	-$(RM) $(BUILDDIR)/loader-c128.lib
	-$(RM) $(BUILDDIR)/loader-c16.lib
	-$(RMDIR) $(BUILDDIR)

distclean:
	-$(MAKE) -C $(LOADER_SRC) clean
	$(MAKE) -C $(CC1541) clean

wipe: distclean clean

$(PU):
	$(MAKE) -C $(PU_SOURCE)
