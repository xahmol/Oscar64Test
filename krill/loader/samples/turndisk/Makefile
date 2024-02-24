
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
EMU70        = $(PLUS4EMU) -disk
else
EMU          = $(VICE) -drive8type 1541 -drive9type 0 -autostart
EMU70        = $(VICE) -drive8type 1570 -drive9type 0 -autostart
endif


ECHO         = echo
PRINTF       = printf

AS           = ca65
LD           = ld65
PU           = ../../tools/pucrunch/pucrunch
C1541        = c1541

MKDIR        = mkdir -p
RM           = rm -f
ifeq ($(ARCH),MACOSX)
RMDIR        = rmdir # XXX TODO xargs to remove .DS_Store
else
RMDIR        = rmdir
endif
CAT          = cat


.PHONY: default loader assemble link compress diskimages run clean distclean wipe
.PHONY: tellarch


BUILDDIR     = ../../build
INTERMDIR    = ../../build/intermediate
LOADER_SRC   = ../../src
LOADER       = $(BUILDDIR)/loader-$(_PLATFORM_).lib

RESOURCESDIR = ../resources
PIC1         = $(INTERMDIR)/pic1.bin
PIC2         = $(INTERMDIR)/pic2.bin

NAME         = turndisk

SOURCE       = $(NAME).s
LOADERCFG    = loaderconfig.inc
ASSEMBLE     = $(INTERMDIR)/$(NAME)-$(_PLATFORM_).o
LINK         = $(INTERMDIR)/$(NAME)-uncompressed-$(_PLATFORM_).prg
COMPRESS     = $(INTERMDIR)/$(NAME)-$(_PLATFORM_).prg
DISKIMAGE_A  = $(BUILDDIR)/$(NAME)-$(_PLATFORM_)-a.d64
DISKIMAGE_B  = $(BUILDDIR)/$(NAME)-$(_PLATFORM_)-b.d64
DISKIMAGES   = $(DISKIMAGE_A) $(DISKIMAGE_B)

AS_FLAGS     = -I ../../../shared -I ../../include -I $(LOADER) -D EXTCONFIGPATH
PU_FLAGS     = -d -l 0x1c00 -x 0x1c00 -i 0 


default: diskimages


tellarch:
	@$(ECHO) $(ARCH)

.PHONY: $(LOADER)
loader: $(LOADER)

$(LOADER): $(LOADERCFG)
	make -C $(LOADER_SRC) EXTCONFIGPATH=../samples/$(NAME) lib


assemble: $(ASSEMBLE)

$(ASSEMBLE): $(SOURCE) $(LOADERCFG)
	$(MKDIR) $(BUILDDIR)
	$(MKDIR) $(INTERMDIR)
ifeq ($(_PLATFORM_),c64)
	$(AS) $(AS_FLAGS) -t c64 -D PLATFORM=64 -o $@ $<
else ifeq ($(_PLATFORM_),c128)
	$(AS) $(AS_FLAGS) -t c128 -D PLATFORM=128 -o $@ $<
else
	$(AS) $(AS_FLAGS) -t c16 -D PLATFORM=16 -o $@ $<
endif


link: $(LINK)

$(LINK): Linkfile $(ASSEMBLE) $(LOADER)
	$(LD) -o $@ -C $^


compress: $(COMPRESS)

$(COMPRESS): $(LINK)
ifeq ($(_PLATFORM_),c64)
	$(PU) $(PU_FLAGS) -c64 -g 0x37 $^ $@
else ifeq ($(_PLATFORM_),c128)
	$(PU) $(PU_FLAGS) -c128 $^ $@
else
	$(PU) $(PU_FLAGS) -c16 $^ $@
endif


diskimages: $(DISKIMAGES)

$(DISKIMAGE_A): $(COMPRESS) $(PIC1)
	$(C1541) -format "normal is boring,+h" d64 $@
	$(C1541) -attach $@ \
	 -write $(COMPRESS) "$(NAME)" \
	 -write $(PIC1) "pic1"

$(DISKIMAGE_B): $(PIC2)
	$(C1541) -format "normal is boring,+h" d64 $@
	$(C1541) -attach $@ \
	 -write $(COMPRESS) "$(NAME)" \
	 -write $(PIC2) "pic2"


ifneq ($(USE_YAPE),0)
run: diskimages
	$(YAPE) "..\..\build\$(DISKIMAGE_A)"

run70: diskimages
	$(YAPE) "..\..\build\$(DISKIMAGE_A)"
else
run: diskimages
	$(EMU) $(realpath $(DISKIMAGE_A))

run70: diskimages
	$(EMU70) $(realpath $(DISKIMAGE_A))
endif


$(INTERMDIR)/%.bin: $(RESOURCESDIR)/%.bin
	$(PRINTF) '\000\140' | $(CAT) - $? > $@ # octal 140 = hex 60


clean:
	-$(RM) $(INTERMDIR)/$(NAME)-c64.o $(INTERMDIR)/$(NAME)-uncompressed-c64.prg $(INTERMDIR)/$(NAME)-c64.prg $(BUILDDIR)/$(NAME)-c64-a.d64 $(BUILDDIR)/$(NAME)-c64-b.d64
	-$(RM) $(INTERMDIR)/$(NAME)-c128.o $(INTERMDIR)/$(NAME)-uncompressed-c128.prg $(INTERMDIR)/$(NAME)-c128.prg $(BUILDDIR)/$(NAME)-c128-a.d64 $(BUILDDIR)/$(NAME)-c128-b.d64
	-$(RM) $(INTERMDIR)/$(NAME)-c64.o $(INTERMDIR)/$(NAME)-uncompressed-c16.prg $(INTERMDIR)/$(NAME)-c16.prg $(BUILDDIR)/$(NAME)-c16-a.d64 $(BUILDDIR)/$(NAME)-c16-b.d64
	-$(RMDIR) $(INTERMDIR)
	-$(RMDIR) $(BUILDDIR)

distclean:
	-$(MAKE) -C $(LOADER_SRC) clean

wipe: distclean clean
