
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
ASSETS = -f=assets/screen.prg

# Hostname of Ultimate II+ target for deployment. Edit for proper IP and usb number
ULTHOST = ftp://192.168.1.19/usb1/temp/
ULTHOST2 = ftp://192.168.1.31/usb1/temp

########################################

.SUFFIXES:
.PHONY: all clean deploy vice
all: $(MAIN).prg

# Building main program
$(MAIN).prg: $(MAINSRC)
	$(CC) $(CFLAGS) -n -d64=build/$(MAIN).d64 $(ASSETS) $<

# Cleaning repo of build files
clean:
	$(DEL) build/*.* 2>$(NULLDEV)

# To deploy software to UII+ enter make deploy. Obviously C128 needs to powered on with UII+ and USB drive connected.
deploy: $(MAIN).prg
	wput -u build/$(MAIN).d64 $(ULTHOST)
#	wput -u build/$(MAIN).prg $(ULTHOST2)

# To run software using VICE x128
vice: $(MAIN).prg
	x128 build/$(MAIN).d64