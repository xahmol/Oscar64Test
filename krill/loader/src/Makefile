
INSTALL     ?= 1000
RESIDENT    ?= 0200
TRANSIENT   ?= 4000
ZP          ?= e0

export _PLATFORM_ INSTALL RESIDENT TRANSIENT ZP

ifeq ($(PLATFORM),)
_PLATFORM_   = c64
else ifeq ($(PLATFORM),c128)
_PLATFORM_   = c128
else ifeq ($(PLATFORM),c16)
_PLATFORM_   = c16
else ifeq ($(PLATFORM),c116)
_PLATFORM_   = c16
else ifeq ($(PLATFORM),plus4)
_PLATFORM_   = c16
else
_PLATFORM_   = $(PLATFORM)
endif

ifneq ($(_PLATFORM_),c64)
ifneq ($(_PLATFORM_),c128)
ifneq ($(_PLATFORM_),c16)
$(error invalid platform $(_PLATFORM_) specified)
endif
endif
endif


TOP         ?= .

SVNVERSION   = svnversion
ifneq ($(wildcard ../../.svn/format),)
VERSION      = $(shell $(SVNVERSION) | tr -d [:cntrl:])
else
VERSION      = $(shell $(GREP) -oP 'VERSION_STRING "\K[^"]+' ../version.inc)
endif

CD           = cd
ECHO         = echo
PRINTF       = printf
CAT          = cat
CP           = cp
MV           = mv
RM           = rm -f
MKDIR        = mkdir
RMDIR        = rmdir
GREP         = grep

AS           = ca65
LD           = ld65
AR           = ar65
VICE         = x64
C1541        = c1541

PERL         = perl
ZIP          = zip -9

INCDIR       = $(TOP)/../../shared
LDRINC       = $(TOP)/../include

DECOMPDIR    = $(TOP)/decompress
DRIVESDIR    = $(TOP)/drives
HALDIR       = $(TOP)/hal

BUILDDIR     = $(TOP)/../build
INTERMDIR    = $(TOP)/../build/intermediate

ifneq ($(EXTCONFIGPATH),)
CONFIG       = $(EXTCONFIGPATH)/loaderconfig.inc
else
CONFIG       = $(LDRINC)/config.inc
endif

INSTALLDEPS  = $(CONFIG) $(BUILDDIR) $(INTERMDIR) \
               $(DRIVESDIR)/drivecode-common.inc $(DRIVESDIR)/drivecode1541.s $(DRIVESDIR)/drivecode1571.s $(DRIVESDIR)/drivecode1581.s \
               $(HALDIR)/hal.inc $(HALDIR)/hal-c64-c128.inc $(HALDIR)/hal-c16.inc \
               install.s \
               $(LDRINC)/loader.inc \
               $(TOP)/../version.inc Makefile

RESIDENTDEPS = $(CONFIG) $(BUILDDIR) $(INTERMDIR) \
               $(DECOMPDIR)/bitnaxdecomp.s \
               $(DECOMPDIR)/b2decomp.s \
               $(DECOMPDIR)/doynaxdecomp.s \
               $(DECOMPDIR)/exodecomp.s \
               $(DECOMPDIR)/lcdecomp.s \
               $(DECOMPDIR)/lzsa2decomp.s \
               $(DECOMPDIR)/ncdecomp.s \
               $(DECOMPDIR)/pudecomp.s \
               $(DECOMPDIR)/subsizerdecomp.s \
               $(DECOMPDIR)/tcdecomp.s \
               $(DECOMPDIR)/zx0decomp.s \
               $(HALDIR)/hal.inc $(HALDIR)/hal-c64-c128.inc $(HALDIR)/hal-c16.inc \
               resident.s \
               customdrivecode.s \
               save.s \
               $(LDRINC)/loader.inc \
               $(TOP)/../version.inc Makefile

BINDEPS      = $(BUILDDIR)/loadersymbols-$(_PLATFORM_).inc $(BUILDDIR)/loader-$(_PLATFORM_).prg $(CONFIG)

# allow undocumented opcodes
ifeq ($(_PLATFORM_),c64)
AS_FLAGS     = --cpu 6502X
else ifeq ($(_PLATFORM_),c128)
AS_FLAGS     = --cpu 6502X
else ifeq ($(_PLATFORM_),c16)
AS_FLAGS     = --cpu 6502X
else
# do not allow undocumented opcodes
AS_FLAGS     = --cpu 6502
endif

AS_FLAGS    += -g # include symbols in object files
ifeq ($(_PLATFORM_),c16)
AS_FLAGS    += -t c16 -D PLATFORM=16
else ifeq ($(_PLATFORM_),c128)
AS_FLAGS    += -t c128 -D PLATFORM=128
else
AS_FLAGS    += -t c64 -D PLATFORM=64
endif
AS_FLAGS    += -I $(TOP)/. -I $(INCDIR) -I $(LDRINC)
ifneq ($(EXTCONFIGPATH),)
AS_FLAGS    += -D EXTCONFIGPATH -I $(EXTCONFIGPATH)
endif

.PHONY: lib prg bin binary prgzip binzip binaryzip customdrivecode save

default: prg

all: lib prg

# use these targets to build loader-<PLATFORM>.prg and install-<PLATFORM>.prg along with loadersymbols-<PLATFORM>.inc
prg bin binary: $(BINDEPS)
	@$(ECHO) "Usage: $(MAKE) prg INSTALL=<install hexaddress> RESIDENT=<core hexaddress> ZP=<zp hexaddress> [PROJECT=<project>]"
	@$(ECHO) "INSTALL=\$$$(INSTALL)"
	@$(ECHO) "RESIDENT=\$$$(RESIDENT)"
	@$(ECHO) "ZP=\$$$(ZP)"
	@$(ECHO) "PROJECT=$(PROJECT)"
	$(CAT) $(BUILDDIR)/loadersymbols-$(_PLATFORM_).inc

prgzip binzip binaryzip: $(BUILDDIR)/loader-$(_PLATFORM_).zip

customdrivecode: $(BUILDDIR)/customdrivecode-$(_PLATFORM_).prg
	@$(ECHO) "Usage: $(MAKE) customdrivecode INSTALL=<install hexaddress> RESIDENT=<core hexaddress> TRANSIENT=<plug-ins hexaddress> ZP=<zp hexaddress> [PROJECT=<project>]"
	@$(ECHO) "INSTALL=\$$$(INSTALL)"
	@$(ECHO) "RESIDENT=\$$$(RESIDENT)"
	@$(ECHO) "TRANSIENT=\$$$(TRANSIENT)"
	@$(ECHO) "ZP=\$$$(ZP)"
	@$(ECHO) "PROJECT=$(PROJECT)"
	$(CAT) $(BUILDDIR)/loadersymbols-$(_PLATFORM_).inc

save: $(BUILDDIR)/save-$(_PLATFORM_).prg
	@$(ECHO) "Usage: $(MAKE) save INSTALL=<install hexaddress> RESIDENT=<core hexaddress> TRANSIENT=<plug-ins hexaddress> ZP=<zp hexaddress> [PROJECT=<project>]"
	@$(ECHO) "INSTALL=\$$$(INSTALL)"
	@$(ECHO) "RESIDENT=\$$$(RESIDENT)"
	@$(ECHO) "TRANSIENT=\$$$(TRANSIENT)"
	@$(ECHO) "ZP=\$$$(ZP)"
	@$(ECHO) "PROJECT=$(PROJECT)"
	$(CAT) $(BUILDDIR)/loadersymbols-$(_PLATFORM_).inc

lib: $(BUILDDIR)/loader-$(_PLATFORM_).lib


$(TOP)/../version.inc:
	$(MAKE) -C $(TOP)/.. version.inc


# directory targets

$(BUILDDIR):
	$(MKDIR) $@

$(INTERMDIR):
	$(MKDIR) $@


# object targets

$(INTERMDIR)/install-$(_PLATFORM_).o: $(INSTALLDEPS)
	$(AS) $(AS_FLAGS) -I $(INTERMDIR) -o $@ install.s # allow undocumented opcodes for drive code

$(INTERMDIR)/customdrivecode-$(_PLATFORM_).o: $(RESIDENTDEPS)
	$(AS) $(AS_FLAGS) -o $@ customdrivecode.s

$(INTERMDIR)/save-$(_PLATFORM_).o: $(RESIDENTDEPS)
	$(AS) $(AS_FLAGS) -o $@ save.s

$(INTERMDIR)/resident-$(_PLATFORM_).o: $(RESIDENTDEPS)
	$(AS) $(AS_FLAGS) -o $@ resident.s


# binary targets

.PHONY: $(INTERMDIR)/binary.link
.PHONY: $(BUILDDIR)/loader-$(_PLATFORM_).prg $(INTERMDIR)/loader-nonreloc-$(_PLATFORM_).o
.PHONY: $(BUILDDIR)/install-$(_PLATFORM_).prg $(INTERMDIR)/install-nonreloc-$(_PLATFORM_).o
.PHONY: $(BUILDDIR)/customdrivecode-$(_PLATFORM_).prg $(INTERMDIR)/customdrivecode-nonreloc-$(_PLATFORM_).o
.PHONY: $(BUILDDIR)/save-$(_PLATFORM_).prg $(INTERMDIR)/save-nonreloc-$(_PLATFORM_).o
.PHONY: $(INTERMDIR)/loader.map $(BUILDDIR)/loadersymbols-$(_PLATFORM_).inc

$(INTERMDIR)/loader-nonreloc-$(_PLATFORM_).o: $(RESIDENTDEPS)
	$(AS) $(AS_FLAGS) -D RESIADDR=0x$(RESIDENT) -o $@ resident.s

$(INTERMDIR)/install-nonreloc-$(_PLATFORM_).o: $(RESIDENTDEPS)
	$(AS) $(AS_FLAGS) -D INSTADDR=0x$(INSTALL) -o $@ install.s

$(INTERMDIR)/binary.link: Makefile
	$(PERL) make-linkfile.pl $(_PLATFORM_) $(ZP) $(INSTALL) $(RESIDENT) $(TRANSIENT) > $@
	$(CAT) $@

$(BUILDDIR)/loader-$(_PLATFORM_).prg: $(INTERMDIR)/loader-nonreloc-$(_PLATFORM_).o $(INTERMDIR)/install-nonreloc-$(_PLATFORM_).o $(INTERMDIR)/binary.link
	$(LD) -C $(INTERMDIR)/binary.link -vm -m $(INTERMDIR)/loader-$(_PLATFORM_).map $(INTERMDIR)/loader-nonreloc-$(_PLATFORM_).o $(INTERMDIR)/install-nonreloc-$(_PLATFORM_).o
	$(RM) a.out

$(BUILDDIR)/install-$(_PLATFORM_).prg: $(BUILDDIR)/loader-$(_PLATFORM_).prg

$(INTERMDIR)/loader-$(_PLATFORM_).map: $(BUILDDIR)/install-$(_PLATFORM_).prg


$(INTERMDIR)/customdrivecode-nonreloc-$(_PLATFORM_).o: customdrivecode.s
	$(AS) $(AS_FLAGS) -D TRNSADDR=0x$(TRANSIENT) -o $@ $^

$(BUILDDIR)/customdrivecode-$(_PLATFORM_).prg: $(INTERMDIR)/binary.link $(INTERMDIR)/customdrivecode-nonreloc-$(_PLATFORM_).o $(INTERMDIR)/loader-nonreloc-$(_PLATFORM_).o $(INTERMDIR)/install-nonreloc-$(_PLATFORM_).o
	$(LD) -vm -m $(INTERMDIR)/loader-$(_PLATFORM_).map -C $^
	$(MV) $(BUILDDIR)/transient-$(_PLATFORM_).prg $@
	$(PERL) make-loadersymbolsinc.pl $(VERSION) $(_PROJECT_) $(INTERMDIR)/loader-$(_PLATFORM_).map > $(BUILDDIR)/loadersymbols-$(_PLATFORM_).inc

$(INTERMDIR)/save-nonreloc-$(_PLATFORM_).o: save.s
	$(AS) $(AS_FLAGS) -D TRNSADDR=0x$(TRANSIENT) -o $@ $^

$(BUILDDIR)/save-$(_PLATFORM_).prg: $(INTERMDIR)/binary.link $(INTERMDIR)/save-nonreloc-$(_PLATFORM_).o $(INTERMDIR)/customdrivecode-$(_PLATFORM_).o $(INTERMDIR)/loader-nonreloc-$(_PLATFORM_).o $(INTERMDIR)/install-nonreloc-$(_PLATFORM_).o
	$(LD) -vm -m $(INTERMDIR)/loader-$(_PLATFORM_).map -C $^
	$(MV) $(BUILDDIR)/transient-$(_PLATFORM_).prg $@
	$(PERL) make-loadersymbolsinc.pl $(VERSION) $(_PROJECT_) $(INTERMDIR)/loader-$(_PLATFORM_).map > $(BUILDDIR)/loadersymbols-$(_PLATFORM_).inc

ifeq ($(PROJECT),)
_PROJECT_ = loader
else
_PROJECT_ = $(PROJECT)
endif

$(BUILDDIR)/loadersymbols-$(_PLATFORM_).inc: $(INTERMDIR)/loader-$(_PLATFORM_).map
	$(PERL) make-loadersymbolsinc.pl $(VERSION) $(_PROJECT_) $^ > $@

$(BUILDDIR)/loader-$(_PLATFORM_).zip: $(BINDEPS)
	$(CD) $(BUILDDIR) \
	 && $(CP) $(BUILDDIR)/loader-$(_PLATFORM_).prg $(INTERMDIR)/loader.prg && $(ZIP) -j $@ $(INTERMDIR)/loader.prg \
	 && $(CP) $(BUILDDIR)/install-$(_PLATFORM_).prg $(INTERMDIR)/install.prg && $(ZIP) -j $@ $(INTERMDIR)/install.prg \
	 && $(CP) $(BUILDDIR)/loadersymbols-$(_PLATFORM_).inc $(INTERMDIR)/loadersymbols.inc && $(ZIP) -j $@ $(INTERMDIR)/loadersymbols.inc


# loader-$(_PLATFORM_).lib library target

$(BUILDDIR)/loader-$(_PLATFORM_).lib: $(INTERMDIR)/resident-$(_PLATFORM_).o $(INTERMDIR)/install-$(_PLATFORM_).o $(INTERMDIR)/customdrivecode-$(_PLATFORM_).o $(INTERMDIR)/save-$(_PLATFORM_).o
	$(AR) a $@ $^


clean:
	-$(RM) \
	 $(INTERMDIR)/* \
	 $(BUILDDIR)/loader-c64.lib \
	 $(BUILDDIR)/loader-c64.prg $(BUILDDIR)/install-c64.prg $(BUILDDIR)/loadersymbols-c64.inc \
	 $(BUILDDIR)/loader-c128.lib \
	 $(BUILDDIR)/loader-c128.prg $(BUILDDIR)/install-c128.prg $(BUILDDIR)/loadersymbols-c128.inc \
	 $(BUILDDIR)/loader-c16.lib \
	 $(BUILDDIR)/loader-c16.prg $(BUILDDIR)/install-c16.prg $(BUILDDIR)/loadersymbols-c16.inc
	-$(RMDIR) $(INTERMDIR)
