
# Target
SYS = c128e

# Just the usual way to find out if we're
# using cmd.exe to execute make rules.
ifneq ($(shell echo),)
  CMD_EXE = 1
endif

ifdef CMD_EXE
  NULLDEV = nul:
  DEL = -del /f
  RMDIR = rmdir /s /q
else
  NULLDEV = /dev/null
  DEL = $(RM)
  RMDIR = $(RM) -r
endif

# Tooling paths
CC = /home/xahmol/oscar64/bin/oscar64

# Application names
MAIN = vdctest

# Build versioning
VERSION_MAJOR = 0
VERSION_MINOR = 1
VERSION_TIMESTAMP = $(shell date "+%Y%m%d-%H%M")
VERSION = v$(VERSION_MAJOR)$(VERSION_MINOR)-$(VERSION_TIMESTAMP)

# Common compile flags
CFLAGS  = -i=include -tm=$(SYS) -O2 -dNOFLOAT -dVERSION="\"$(VERSION)\""

# Fastload compile flag definitoons
FLOSSIECFLAGS = -dFLOSSIEC -dFLOSSIEC_BORDER=1 -dFLOSSIEC_NODISPLAY=1 -dFLOSSIEC_NOIRQ=0 -dFLOSSIEC_CODE=bcode1 -dFLOSSIEC_BSS=bbss1

# Sources
MAINSRC = src/main.c

# Hostname of Ultimate II+ target for deployment. Edit for proper IP and usb number
ULTHOST = ftp://192.168.1.19/usb1/temp/
ULTHOST2 = ftp://192.168.1.31/usb1/temp/

# ZIP file contents
ZIP = oscar64_vdcdemo_$(VERSION).zip
README = README.pdf
ZIPLIST = build/flossiec/*.* build/krill/*.* build/standard/*.* $(README)
PRGLIST = -write vdctest.prg vdctest -write vdctestlmc.prg vdctestlmc
KRILLLIST = -write install-c128.prg install-c128 -write loader-c128.prg loader-c128 
ASSETS = -write screen1.prg screen1 -write screen2.prg screen2 -write screen3.prg screen3 -write music1.prg music1 -write music2.prg music2 -write chars1.prg chars1 -write chars2.prg chars2

########################################

.SUFFIXES:
.PHONY: all clean deploy vice
all: $(MAIN).prg bootsect.bin loader-c128.prg d64 d71 d81 $(ZIP)

$(MAIN).prg: $(MAINSRC)
	$(CC) $(CFLAGS) $(FLOSSIECFLAGS) -n -o=build/flossiec/$(MAIN).prg $<
	$(CC) $(CFLAGS) -dKRILL -n -o=build/krill/$(MAIN).prg $<
	$(CC) $(CFLAGS) -n -o=build/standard/$(MAIN).prg $<

bootsect.bin: $(MAIN).prg
	$(CC) -tf=bin -rt=src/bootsect.c -o=build/standard/bootsect.bin
	cp build/standard/bootsect.bin build/krill
	cp build/standard/bootsect.bin build/flossiec
	cp assets/screen*.prg build/standard
	cp assets/music*.prg build/standard
	cp assets/chars*.prg build/standard
	cp assets/screen*.prg build/krill
	cp assets/music*.prg build/krill
	cp assets/chars*.prg build/krill
	cp assets/screen*.prg build/flossiec
	cp assets/music*.prg build/flossiec
	cp assets/chars*.prg build/flossiec

loader-c128.prg:
	cd krill/loader/; $(DEL) build/*.* 2>$(NULLDEV)
	cd krill/loader/; make PLATFORM=c128 prg INSTALL=A000 RESIDENT=0b00 ZP=f5 PROJECT=
	cd krill/loader/; $(RMDIR) build/intermediate 2>$(NULLDEV)
	cd krill/loader/; $(DEL) build/transient*.* 2>$(NULLDEV)
	cp krill/loader/build/*.prg build/krill

d64:	bootsect.bin loader-c128.prg
	c1541 -cd build/krill -format "$(MAIN),xm" d64 $(MAIN)-krill.d64
	c1541 -cd build/krill -attach $(MAIN)-krill.d64 -bwrite bootsect.bin 1 0
	c1541 -cd build/krill -attach $(MAIN)-krill.d64 -bpoke 18 0 4 $14 %11111110
	c1541 -cd build/krill -attach $(MAIN)-krill.d64 -bam 1 1
	c1541 -cd build/krill -attach $(MAIN)-krill.d64 $(PRGLIST) $(KRILLLIST) $(ASSETS)
	c1541 -cd build/standard -format "$(MAIN),xm" d64 $(MAIN)-stnd.d64
	c1541 -cd build/standard -attach $(MAIN)-stnd.d64 -bwrite bootsect.bin 1 0
	c1541 -cd build/standard -attach $(MAIN)-stnd.d64 -bpoke 18 0 4 $14 %11111110
	c1541 -cd build/standard -attach $(MAIN)-stnd.d64 -bam 1 1
	c1541 -cd build/standard -attach $(MAIN)-stnd.d64 $(PRGLIST) $(ASSETS)
	c1541 -cd build/flossiec -format "$(MAIN),xm" d64 $(MAIN)-fl.d64
	c1541 -cd build/flossiec -attach $(MAIN)-fl.d64 -bwrite bootsect.bin 1 0
	c1541 -cd build/flossiec -attach $(MAIN)-fl.d64 -bpoke 18 0 4 $14 %11111110
	c1541 -cd build/flossiec -attach $(MAIN)-fl.d64 -bam 1 1
	c1541 -cd build/flossiec -attach $(MAIN)-fl.d64 $(PRGLIST) $(ASSETS)


d71:	bootsect.bin
	c1541 -cd build/krill -format "$(MAIN),xm" d71 $(MAIN)-krill.d71
	c1541 -cd build/krill -attach $(MAIN)-krill.d71 -bwrite bootsect.bin 1 0
	c1541 -cd build/krill -attach $(MAIN)-krill.d71 -bpoke 18 0 4 $14 %11111110
	c1541 -cd build/krill -attach $(MAIN)-krill.d71 -bam 1 1
	c1541 -cd build/krill -attach $(MAIN)-krill.d71 $(PRGLIST) $(KRILLLIST) $(ASSETS)
	c1541 -cd build/standard -format "$(MAIN),xm" d71 $(MAIN)-stnd.d71
	c1541 -cd build/standard -attach $(MAIN)-stnd.d71 -bwrite bootsect.bin 1 0
	c1541 -cd build/standard -attach $(MAIN)-stnd.d71 -bpoke 18 0 4 $14 %11111110
	c1541 -cd build/standard -attach $(MAIN)-stnd.d71 -bam 1 1
	c1541 -cd build/standard -attach $(MAIN)-stnd.d71 $(PRGLIST) $(ASSETS)

d81:	bootsect.bin
	c1541 -cd build/krill -format "$(MAIN),xm" d81 $(MAIN)-krill.d81
	c1541 -cd build/krill -attach $(MAIN)-krill.d81 -bwrite bootsect.bin 1 0
	c1541 -cd build/krill -attach $(MAIN)-krill.d81 -bpoke 40 1 16 $27 %11111110
	c1541 -cd build/krill -attach $(MAIN)-krill.d81 -bam 1 1
	c1541 -cd build/krill -attach $(MAIN)-krill.d81 $(PRGLIST) $(KRILLLIST) $(ASSETS)
	c1541 -cd build/standard -format "$(MAIN),xm" d81 $(MAIN)-stnd.d81
	c1541 -cd build/standard -attach $(MAIN)-stnd.d81 -bwrite bootsect.bin 1 0
	c1541 -cd build/standard -attach $(MAIN)-stnd.d81 -bpoke 40 1 16 $27 %11111110
	c1541 -cd build/standard -attach $(MAIN)-stnd.d81 -bam 1 1
	c1541 -cd build/standard -attach $(MAIN)-stnd.d81 $(PRGLIST) $(ASSETS)

# Creating ZIP file for distribution
$(ZIP):
	zip -j $(ZIP) build/flossiec/*.d* build/krill/*.d* build/standard/*.d* $(README)

# Cleaning repo of build files
clean:
	$(DEL) build/krill/*.* 2>$(NULLDEV)
	$(DEL) build/flossiec/*.* 2>$(NULLDEV)
	$(DEL) build/standard/*.* 2>$(NULLDEV)
	$(DEL) krill/loader/build/*.* 2>$(NULLDEV)

# To deploy software to UII+ enter make deploy. Obviously C128 needs to powered on with UII+ and USB drive connected.
deploy:
	wput -u build/standard/*.prg build/standard/$(MAIN)-stnd.d* build/flossiec/$(MAIN)-fl.d* build/krill/$(MAIN)-krill.d* $(ULTHOST)
#	wput -u build/standard/*.prg build/standard/$(MAIN).d* build/flossiec/$(MAIN).d* build/krill/$(MAIN).d*  $(ULTHOST2)

# To run software using VICE x128
vice: $(MAIN).d64 $(MAIN).d71 $(MAIN).d81
	x128 build/flossiec/$(MAIN).d81