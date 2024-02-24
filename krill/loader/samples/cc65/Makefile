
NAME         = c-program
_PLATFORM_   = c64

EMU          = x64sc
C1541        = c1541

PRINTF       = printf

CAT          = cat

BUILDDIR     = ../../build
INTERMDIR    = ../../build/intermediate
LOADERSRC    = ../../src
LOADER       = $(BUILDDIR)/loader-$(_PLATFORM_).lib

COMPILE      = $(INTERMDIR)/$(NAME)-uncompressed-$(_PLATFORM_).prg
DISKIMAGE    = $(BUILDDIR)/$(NAME)-$(_PLATFORM_).d64

RESOURCESDIR = ../resources
PIC1         = $(INTERMDIR)/pic1.prg
PIC2         = $(INTERMDIR)/pic2.prg

SOURCE       = $(NAME).c

$(LOADER):
	$(MAKE) -C $(LOADERSRC) EXTCONFIGPATH=../samples/cc65 lib

$(COMPILE): $(SOURCE) $(LOADER)
	cl65 -t $(_PLATFORM_) -C ./Linkfile -o $@ $^

$(DISKIMAGE): $(COMPILE) $(PIC1) $(PIC2)
	$(C1541) -format "normal is boring,+h" d64 $@
	$(C1541) -attach $@ \
	 -write $(COMPILE) "$(NAME)" \
	 -write $(PIC1) "pic1" \
	 -write $(PIC2) "pic2"

$(INTERMDIR)/%.prg: $(RESOURCESDIR)/%.bin
	$(PRINTF) '\000\140' | $(CAT) - $? > $@ # octal 140 = hex 60

run: $(DISKIMAGE)
	$(EMU) $(realpath $^)

clean:
	-$(RM) *.o $(PIC1) $(PIC2) $(COMPILE) $(DISKIMAGE) $(LOADER)
