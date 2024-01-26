
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

CC = /home/xahmol/oscar64/bin/oscar64

# Application names
MAIN = vdctest

# Common compile flags
CFLAGS  = -i=include -tm=$(SYS) -O3s -dNOFLOAT

# Sources
MAINSRC = src/main.c

# Assets to include on disk
ASSETS = -f=assets/screen1.prg -f=assets/screen2.prg

# Hostname of Ultimate II+ target for deployment. Edit for proper IP and usb number
ULTHOST = ftp://192.168.1.19/usb1/temp/
ULTHOST2 = ftp://192.168.1.31/usb1/temp/

########################################

.SUFFIXES:
.PHONY: all clean deploy vice
all: temp extract floppies

# Building temp .d64
temp: $(MAINSRC)
	$(CC) $(CFLAGS) -n -o=build/$(MAIN).prg -d64=build/temp/temp.d64 $(ASSETS) $<

extract:	temp
	cl65 -t c128 -C bootsect-ca65.cfg src/bootsect.s
	mv bootsect.bin build/temp/
	c1541 -cd build/temp/ -attach temp.d64 -extract

$(MAIN).d64:	extract
	c1541 -cd build/temp/ -format "$(MAIN),xm" d64 $(MAIN).d64
	c1541 -cd build/temp/ -attach $(MAIN).d64 -bwrite bootsect.bin 1 0
	c1541 -cd build/temp/ -attach $(MAIN).d64 -bpoke 18 0 4 $14 %11111110
	c1541 -cd build/temp/ -attach $(MAIN).d64 -bam 1 1
	c1541 -cd build/temp/ -attach $(MAIN).d64 -write vdctest vdctest
	c1541 -cd build/temp/ -attach $(MAIN).d64 -write vdctestlmc vdctestlmc
	c1541 -cd build/temp/ -attach $(MAIN).d64 -write screen1 screen1
	c1541 -cd build/temp/ -attach $(MAIN).d64 -write screen2 screen2

$(MAIN).d71:	extract
	c1541 -cd build/temp/ -format "$(MAIN),xm" d71 $(MAIN).d71
	c1541 -cd build/temp/ -attach $(MAIN).d71 -bwrite bootsect.bin 1 0
	c1541 -cd build/temp/ -attach $(MAIN).d71 -bpoke 18 0 4 $14 %11111110
	c1541 -cd build/temp/ -attach $(MAIN).d71 -bam 1 1
	c1541 -cd build/temp/ -attach $(MAIN).d71 -write vdctest vdctest
	c1541 -cd build/temp/ -attach $(MAIN).d71 -write vdctestlmc vdctestlmc
	c1541 -cd build/temp/ -attach $(MAIN).d71 -write screen1 screen1
	c1541 -cd build/temp/ -attach $(MAIN).d71 -write screen2 screen2

$(MAIN).d81:	extract
	c1541 -cd build/temp/ -format "$(MAIN),xm" d81 $(MAIN).d81
	c1541 -cd build/temp/ -attach $(MAIN).d81 -bwrite bootsect.bin 1 0
	c1541 -cd build/temp/ -attach $(MAIN).d81 -bpoke 40 1 16 $27 %11111110
	c1541 -cd build/temp/ -attach $(MAIN).d81 -bam 1 1
	c1541 -cd build/temp/ -attach $(MAIN).d81 -write vdctest vdctest
	c1541 -cd build/temp/ -attach $(MAIN).d81 -write vdctestlmc vdctestlmc
	c1541 -cd build/temp/ -attach $(MAIN).d81 -write screen1 screen1
	c1541 -cd build/temp/ -attach $(MAIN).d81 -write screen2 screen2

floppies: $(MAIN).d64 $(MAIN).d71 $(MAIN).d81
	cp build/temp/$(MAIN).d* build/
	$(DEL) build/temp/*.* 2>$(NULLDEV)
	$(DEL) build/temp/* 2>$(NULLDEV) 

# Cleaning repo of build files
clean:
	$(DEL) build/*.* 2>$(NULLDEV)

# To deploy software to UII+ enter make deploy. Obviously C128 needs to powered on with UII+ and USB drive connected.
deploy: floppies
	wput -u build/$(MAIN).d* $(ULTHOST)
#	wput -u build/$(MAIN).d64 $(ULTHOST2)

# To run software using VICE x128
vice: floppies
	x128 build/$(MAIN).d81