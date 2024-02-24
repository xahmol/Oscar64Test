
NOWORKINGCOPY      = $(shell svn info > /dev/null 2>&1; echo $$?)
SVNVERSION         = svnversion
ifeq ($(NOWORKINGCOPY),0)
VERSION            = $(shell $(SVNVERSION) | tr -d [:cntrl:])
else
VERSION            = $(shell $(GREP) -oP 'VERSION_STRING "\K[^"]+' ./version.inc)
endif

CD                 = cd
PRINTF             = printf
MKDIR              = mkdir
GREP               = grep
ZIP                = zip -9 --must-match
ZIP_NO_PATHS       = $(ZIP) -j
ifneq ($(VERSION),)
ZIPFILE            = loader-v$(VERSION).zip
LOADERTEST         = loadertest-v$(VERSION).zip
else
ZIPFILE            = loader.zip
LOADERTEST         = loadertest.zip
endif


SHAREDFOLDER       = shared
LOADERFOLDER       = $(notdir $(shell pwd))
DOCSFOLDER         = $(LOADERFOLDER)/docs
SRCFOLDER          = $(LOADERFOLDER)/src
INCFOLDER          = $(LOADERFOLDER)/include
SAMPLESFOLDER      = $(LOADERFOLDER)/samples
BUILDFOLDER        = $(LOADERFOLDER)/build
TOOLSFOLDER        = $(LOADERFOLDER)/tools

ZIPLIST           += $(LOADERFOLDER)/README

ZIPLIST           += $(SHAREDFOLDER)/standard.inc
ZIPLIST           += $(SHAREDFOLDER)/cpu.inc
ZIPLIST           += $(SHAREDFOLDER)/vic.inc
ZIPLIST           += $(SHAREDFOLDER)/cia.inc
ZIPLIST           += $(SHAREDFOLDER)/mmu.inc
ZIPLIST           += $(SHAREDFOLDER)/vdc.inc
ZIPLIST           += $(SHAREDFOLDER)/ted.inc
ZIPLIST           += $(SHAREDFOLDER)/pio.inc
ZIPLIST           += $(SHAREDFOLDER)/via.inc
ZIPLIST           += $(SHAREDFOLDER)/kernal.inc
ZIPLIST           += $(SHAREDFOLDER)/basic.inc
ZIPLIST           += $(SHAREDFOLDER)/float.inc

ZIPLIST           += $(LOADERFOLDER)/Makefile
ZIPLIST           += $(LOADERFOLDER)/version.inc

ZIPLIST           += $(DOCSFOLDER)/Prerequisites.txt
ZIPLIST           += $(DOCSFOLDER)/Protocol.txt

DECOMPFOLDER       = decompress
DRIVESFOLDER       = drives
HALFOLDER          = hal
ZIPLIST           += $(SRCFOLDER)/Makefile
ZIPLIST           += $(SRCFOLDER)/make-linkfile.pl
ZIPLIST           += $(SRCFOLDER)/make-loadersymbolsinc.pl
ZIPLIST           += $(SRCFOLDER)/$(DECOMPFOLDER)/b2decomp.s
ZIPLIST           += $(SRCFOLDER)/$(DECOMPFOLDER)/bitnaxdecomp.s
ZIPLIST           += $(SRCFOLDER)/$(DECOMPFOLDER)/doynaxdecomp.s
ZIPLIST           += $(SRCFOLDER)/$(DECOMPFOLDER)/exodecomp.s
ZIPLIST           += $(SRCFOLDER)/$(DECOMPFOLDER)/lcdecomp.s
ZIPLIST           += $(SRCFOLDER)/$(DECOMPFOLDER)/lzsa2decomp.s
ZIPLIST           += $(SRCFOLDER)/$(DECOMPFOLDER)/ncdecomp.s
ZIPLIST           += $(SRCFOLDER)/$(DECOMPFOLDER)/pudecomp.s
ZIPLIST           += $(SRCFOLDER)/$(DECOMPFOLDER)/subsizerdecomp.s
ZIPLIST           += $(SRCFOLDER)/$(DECOMPFOLDER)/tcdecomp.s
ZIPLIST           += $(SRCFOLDER)/$(DECOMPFOLDER)/tsdecomp.s
ZIPLIST           += $(SRCFOLDER)/$(DECOMPFOLDER)/zx0decomp.s
ZIPLIST           += $(SRCFOLDER)/$(DRIVESFOLDER)/drivecode-common.inc
ZIPLIST           += $(SRCFOLDER)/$(DRIVESFOLDER)/drivecode1541.s
ZIPLIST           += $(SRCFOLDER)/$(DRIVESFOLDER)/drivecode1571.s
ZIPLIST           += $(SRCFOLDER)/$(DRIVESFOLDER)/drivecode1581.s
ZIPLIST           += $(SRCFOLDER)/$(HALFOLDER)/hal.inc
ZIPLIST           += $(SRCFOLDER)/$(HALFOLDER)/hal-c64-c128.inc
ZIPLIST           += $(SRCFOLDER)/$(HALFOLDER)/hal-c16.inc
ZIPLIST           += $(SRCFOLDER)/install.s
ZIPLIST           += $(SRCFOLDER)/resident.s
ZIPLIST           += $(SRCFOLDER)/customdrivecode.s
ZIPLIST           += $(SRCFOLDER)/save.s

ZIPLIST           += $(INCFOLDER)/config.inc
ZIPLIST           += $(INCFOLDER)/loader.inc

BENCHMARKFOLDER    = benchmark
CC65FOLDER         = cc65
DRIVECODEFOLDER    = drivecode
MINEXAMPLEFOLDER   = minexample
RESOURCESFOLDER    = resources
SAVEFOLDER         = save
STANDALONEFOLDER   = standalone
TESTFOLDER         = test
TURNDISKFOLDER     = turndisk
ZIPLIST           += $(SAMPLESFOLDER)/$(BENCHMARKFOLDER)/Makefile
ZIPLIST           += $(SAMPLESFOLDER)/$(BENCHMARKFOLDER)/benchmark.s
ZIPLIST           += $(SAMPLESFOLDER)/$(BENCHMARKFOLDER)/loaderconfig.inc
ZIPLIST           += $(SAMPLESFOLDER)/$(BENCHMARKFOLDER)/benchmark-bitfire.mon
ZIPLIST           += $(SAMPLESFOLDER)/$(BENCHMARKFOLDER)/benchmark-spindle.mon
ZIPLIST           += $(SAMPLESFOLDER)/$(BENCHMARKFOLDER)/make-tex-graph-bitfire.lua
ZIPLIST           += $(SAMPLESFOLDER)/$(BENCHMARKFOLDER)/make-tex-graph-spindle-code.lua
ZIPLIST           += $(SAMPLESFOLDER)/$(BENCHMARKFOLDER)/make-tex-graph-spindle-graphics.lua
ZIPLIST           += $(SAMPLESFOLDER)/$(CC65FOLDER)/Makefile
ZIPLIST           += $(SAMPLESFOLDER)/$(CC65FOLDER)/c-program.c
ZIPLIST           += $(SAMPLESFOLDER)/$(CC65FOLDER)/Linkfile
ZIPLIST           += $(SAMPLESFOLDER)/$(CC65FOLDER)/loaderconfig.inc
ZIPLIST           += $(SAMPLESFOLDER)/$(DRIVECODEFOLDER)/Makefile
ZIPLIST           += $(SAMPLESFOLDER)/$(DRIVECODEFOLDER)/drivecode.s
ZIPLIST           += $(SAMPLESFOLDER)/$(DRIVECODEFOLDER)/loaderconfig.inc
ZIPLIST           += $(SAMPLESFOLDER)/$(MINEXAMPLEFOLDER)/Makefile
ZIPLIST           += $(SAMPLESFOLDER)/$(MINEXAMPLEFOLDER)/minexample.s
ZIPLIST           += $(SAMPLESFOLDER)/$(MINEXAMPLEFOLDER)/loaderconfig.inc
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/pic1.bin
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/pic2.bin
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/bootblock.bin
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/oxyron_oneder.prg
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/doom_c128.prg
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/threeve.prg
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/skew1.prg
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/test
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/a
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/b
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/c
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/d
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/e
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/f
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/g
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/h
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/i
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/j
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/k
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/l
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/m
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/n
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/o
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/p
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/q
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/r
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/x
ZIPLIST           += $(SAMPLESFOLDER)/$(RESOURCESFOLDER)/y
ZIPLIST           += $(SAMPLESFOLDER)/$(SAVEFOLDER)/Makefile
ZIPLIST           += $(SAMPLESFOLDER)/$(SAVEFOLDER)/save.s
ZIPLIST           += $(SAMPLESFOLDER)/$(SAVEFOLDER)/loaderconfig.inc
ZIPLIST           += $(SAMPLESFOLDER)/$(STANDALONEFOLDER)/Makefile
ZIPLIST           += $(SAMPLESFOLDER)/$(STANDALONEFOLDER)/Linkfile-c64
ZIPLIST           += $(SAMPLESFOLDER)/$(STANDALONEFOLDER)/Linkfile-c128
ZIPLIST           += $(SAMPLESFOLDER)/$(STANDALONEFOLDER)/Linkfile-c16
ZIPLIST           += $(SAMPLESFOLDER)/$(STANDALONEFOLDER)/standalone.s
ZIPLIST           += $(SAMPLESFOLDER)/$(STANDALONEFOLDER)/loaderconfig.inc
ZIPLIST           += $(SAMPLESFOLDER)/$(TESTFOLDER)/Makefile
ZIPLIST           += $(SAMPLESFOLDER)/$(TESTFOLDER)/Linkfile
ZIPLIST           += $(SAMPLESFOLDER)/$(TESTFOLDER)/test.s
ZIPLIST           += $(SAMPLESFOLDER)/$(TURNDISKFOLDER)/Makefile
ZIPLIST           += $(SAMPLESFOLDER)/$(TURNDISKFOLDER)/Linkfile
ZIPLIST           += $(SAMPLESFOLDER)/$(TURNDISKFOLDER)/turndisk.s
ZIPLIST           += $(SAMPLESFOLDER)/$(TURNDISKFOLDER)/loaderconfig.inc

ZIPLIST           += $(TOOLSFOLDER)/compressedfileconverter.pl

CC1541FOLDER       = cc1541
ZIPLIST           += $(TOOLSFOLDER)/$(CC1541FOLDER)/LICENSE.txt
ZIPLIST           += $(TOOLSFOLDER)/$(CC1541FOLDER)/README.md
ZIPLIST           += $(TOOLSFOLDER)/$(CC1541FOLDER)/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(CC1541FOLDER)/cc1541.c
ZIPLIST           += $(TOOLSFOLDER)/$(CC1541FOLDER)/cc1541.1.txt.in
ZIPLIST           += $(TOOLSFOLDER)/$(CC1541FOLDER)/cc1541.sln
ZIPLIST           += $(TOOLSFOLDER)/$(CC1541FOLDER)/cc1541.vcxproj
ZIPLIST           += $(TOOLSFOLDER)/$(CC1541FOLDER)/cc1541.vcxproj.filters
ZIPLIST           += $(TOOLSFOLDER)/$(CC1541FOLDER)/test_cc1541.c
ZIPLIST           += $(TOOLSFOLDER)/$(CC1541FOLDER)/test_cc1541.vcxproj
ZIPLIST           += $(TOOLSFOLDER)/$(CC1541FOLDER)/test_cc1541.vcxproj.filters
ZIPLIST           += $(TOOLSFOLDER)/$(CC1541FOLDER)/transwarp\ v0.84.prg
ZIPLIST           += $(TOOLSFOLDER)/$(CC1541FOLDER)/transwarp\ v0.86.prg

B2FOLDER           = b2
ZIPLIST           += $(TOOLSFOLDER)/$(B2FOLDER)/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(B2FOLDER)/bb.c
ZIPLIST           += $(TOOLSFOLDER)/$(B2FOLDER)/bb.h
ZIPLIST           += $(TOOLSFOLDER)/$(B2FOLDER)/cruncher.c
ZIPLIST           += $(TOOLSFOLDER)/$(B2FOLDER)/cruncher.h
ZIPLIST           += $(TOOLSFOLDER)/$(B2FOLDER)/file.c
ZIPLIST           += $(TOOLSFOLDER)/$(B2FOLDER)/file.h
ZIPLIST           += $(TOOLSFOLDER)/$(B2FOLDER)/Decruncher.inc

ZIPLIST           += $(TOOLSFOLDER)/bitnax-07a8c67/lz.c

DOYNAXLZFOLDER     = doynamite1.1
ZIPLIST           += $(TOOLSFOLDER)/$(DOYNAXLZFOLDER)/readme.txt
ZIPLIST           += $(TOOLSFOLDER)/$(DOYNAXLZFOLDER)/decrunch.asm
ZIPLIST           += $(TOOLSFOLDER)/$(DOYNAXLZFOLDER)/lz.c
ZIPLIST           += $(TOOLSFOLDER)/$(DOYNAXLZFOLDER)/sfx.asm
ZIPLIST           += $(TOOLSFOLDER)/$(DOYNAXLZFOLDER)/test.asm
ZIPLIST           += $(TOOLSFOLDER)/$(DOYNAXLZFOLDER)/simple/decrunch.asm
ZIPLIST           += $(TOOLSFOLDER)/$(DOYNAXLZFOLDER)/simple/lz.c
ZIPLIST           += $(TOOLSFOLDER)/$(DOYNAXLZFOLDER)/krill/doynaxdecomp.s

EXOFOLDER          = exomizer-3.1
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/changelog.txt
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exo20info.txt
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exo31info.txt
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exobasic10b2.txt
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/Makefile.test
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/Makefile.testP16
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/6502emu.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/6502emu.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/areatrace.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/areatrace.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/asm.tab.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/asm.tab.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/asm.y
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/asm.yy
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/b2buf.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/bas_main.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/bprg_actions.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/bprg_link_patch.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/bprg_renumber.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/bprg_trampoline.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/bprg.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/bprg.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/buf_io.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/buf_io.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/buf.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/buf.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/callback.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/chunkpool.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/chunkpool.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/common.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/desfx.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/desfx.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/exo_helper.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/exo_helper.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/exo_main.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/exo_raw.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/exo_util.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/exo_util.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/exodec.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/exodec.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/expr.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/expr.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/flags.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/getflag.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/getflag.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/int.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/lex.yy.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/log.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/log.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/map.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/map.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/match.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/match.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/named_buffer.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/named_buffer.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/optimal.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/optimal.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/output.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/output.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/parse.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/parse.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/pc.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/pc.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/perf.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/perf.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/progress.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/progress.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/radix.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/radix.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/search.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/search.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/vec.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/vec.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/table.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/table.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/src/sfxdecr.s
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/README_exo3.txt
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/c64.cfg
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/data.bin
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/exodecrunch.s
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/exostreamdecr1.s
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/exostreamdecr2.s
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/main.s
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/main1.s
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/main2.s
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/testrun.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/acme/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/acme/exodecrunch.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/acme/main.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/acme/split/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/acme/split/main.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/acme/split/data.asm.template
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/dasm/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/dasm/exodecrunch.s
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/dasm/main.s
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/dasm/split/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/dasm/split/main.s
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/dasm/split/data.s.template
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/perf/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/perf/data.raw
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/split/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/split/main.s
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/exodecrs/split/data.s.template
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/exodecr.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/exodecr.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/exodecrunch.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/exodecrunch.h
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/main.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/main2.c
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/test1.bin
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/test2.bin
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/test3.bin
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/test4.bin
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/6809/exo2_final.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/6809/exo2_puls.txt
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/6809/README_exo3.txt
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/8080/P43/deexo.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/8080/P43E/deexo.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/8080/P47T4/deexo.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/8080/README.txt
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/8086/P47/deexo.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/8086/README.txt
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/thumb2/speed.S
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/thumb2/universal.S
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/thumb2/README.txt
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/z80/deexoopt_b0.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/z80/deexoopt_b1.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/z80/deexoopt_b2.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/z80/deexoopt_b3.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/z80/deexoopt_b4.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/z80/deexoopt_f0.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/z80/deexoopt_f1.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/z80/deexoopt_f2.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/z80/deexoopt_f3.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/z80/deexoopt_f4.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/z80/deexoopt.asm
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/z80/readme.txt
ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/rawdecrs/z80/lgpl-2.1.txt
#ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/win32/exobasic.exe
#ZIPLIST           += $(TOOLSFOLDER)/$(EXOFOLDER)/win32/exomizer.exe

LZSAFOLDER         = lzsa
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/README.md
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/.gitignore
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/BlockFormat_LZSA1.md
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/BlockFormat_LZSA2.md
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/LICENSE
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/LICENSE.cc0.md
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/LICENSE.zlib.md
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/StreamFormat.md
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/pareto_graph.png
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/lzsa.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/matchfinder.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/matchfinder.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/shrink_block_v1.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/shrink_block_v1.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/shrink_block_v2.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/shrink_block_v2.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/shrink_block_v2_zx0_encoding.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/shrink_context.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/shrink_context.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/shrink_inmem.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/shrink_inmem.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/shrink_streaming.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/shrink_streaming.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/stream.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/stream.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/dictionary.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/dictionary.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/expand_block_v1.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/expand_block_v1.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/expand_block_v2.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/expand_block_v2.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/expand_context.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/expand_context.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/expand_inmem.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/expand_inmem.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/expand_streaming.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/expand_streaming.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/format.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/frame.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/frame.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/lib.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/.gitignore
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/CHANGELOG.md
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/CMakeLists.txt
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/CMakeModules
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/CMakeModules/AppendCompilerFlags.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/CMakeModules/CheckFunctionKeywords.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/CMakeModules/CheckLFS.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/CMakeModules/ProjectCPack.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/CMakeModules/cmake_uninstall.cmake.in
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/LICENSE
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/README.md
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/VERSION.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/examples/CMakeLists.txt
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/examples/bwt.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/examples/mksary.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/examples/sasearch.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/examples/suftest.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/examples/unbwt.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/include/CMakeLists.txt
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/include/config.h.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/include/divsufsort.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/include/divsufsort.h.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/include/divsufsort_config.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/include/divsufsort_private.h
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/include/lfs.h.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/lib/CMakeLists.txt
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/lib/divsufsort.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/lib/divsufsort_utils.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/lib/sssort.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/lib/trsort.c
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/pkgconfig/CMakeLists.txt
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/src/libdivsufsort/pkgconfig/libdivsufsort.pc.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/VS2017/.gitignore
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/VS2017/lzsa.sln
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/VS2017/lzsa.vcxproj
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/VS2017/lzsa.vcxproj.filters
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/VS2017/lzsa.vcxproj.user
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/Xcode/lzsa.xcodeproj
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/Xcode/lzsa.xcodeproj/project.pbxproj
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6502
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6502/decompress_fast_v1.asm
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6502/decompress_fast_v2.asm
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6502/decompress_faster_v1.asm
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6502/decompress_faster_v2.asm
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6502/decompress_small_v1.asm
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6502/decompress_small_v2.asm
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/65816/decompress_v1.asm
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/65816/decompress_v2.asm
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6809/unlzsa1-6309.s
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6809/unlzsa1.s
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6809/unlzsa1b-6309.s
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6809/unlzsa1b.s
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6809/unlzsa2-6309.s
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6809/unlzsa2.s
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6809/unlzsa2b-6309.s
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/6809/unlzsa2b.s
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/8088/LZSA1FTA.ASM
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/8088/LZSA1JMP.ASM
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/8088/LZSA2FTA.ASM
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/8088/decompress_small_v1.S
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/8088/decompress_small_v2.S
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/8088/decompress_speed_v1.S
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/8088/decompress_speed_v2.S
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/x86/decompress_small_v1.asm
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/x86/decompress_small_v2.asm
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/z80/unlzsa1_fast.asm
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/z80/unlzsa1_small.asm
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/z80/unlzsa2_fast.asm
ZIPLIST           += $(TOOLSFOLDER)/$(LZSAFOLDER)/asm/z80/unlzsa2_small.asm

NCFOLDER           = nucrunch-1.0.1
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/MANIFEST
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/Cargo.toml
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/readme.txt
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/decrunch.a65
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/rdecrunch.a65
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/boot.s
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/sboot.s
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/decrunch.s
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/rdecrunch.s
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/srdecrunch.s
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/src/boot.rs
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/src/lib.rs
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/src/main.rs
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/test/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/test/cbmcat
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/test/crc8.py
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/test/mkrings.py
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/test/gentest.py
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/test/testbed_ca65.s
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/test/testbed.a65
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/test/rtestbed.a65
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/test/sea_test.s
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/test/startaddr
ZIPLIST           += $(TOOLSFOLDER)/$(NCFOLDER)/test/endaddr

PUFOLDER           = pucrunch
ZIPLIST           += $(TOOLSFOLDER)/$(PUFOLDER)/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(PUFOLDER)/smakefile
ZIPLIST           += $(TOOLSFOLDER)/$(PUFOLDER)/pucrunch.c
ZIPLIST           += $(TOOLSFOLDER)/$(PUFOLDER)/pucrunch.h
ZIPLIST           += $(TOOLSFOLDER)/$(PUFOLDER)/uncrunch.asm
ZIPLIST           += $(TOOLSFOLDER)/$(PUFOLDER)/uncrunch-z80.asm
ZIPLIST           += $(TOOLSFOLDER)/$(PUFOLDER)/sa_uncrunch.asm
ZIPLIST           += $(TOOLSFOLDER)/$(PUFOLDER)/cbmcombine.c

SUBSIZERFOLDER     = subsizer-0.7pre1
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/README.txt
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/LICENSE.txt
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/bitfunc.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/bitfunc.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/bits-base.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/bits-base.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/buffer.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/buffer.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/crunch_normal.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/crunch_normal.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/global.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/global.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/histogram.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/histogram.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/match.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/match.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/memory.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/memory.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/message.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/message.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/params.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/params.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/pathfinder.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/pathfinder.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/subsizer.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/universal.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/universal.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/utils.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/utils.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/sfx/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/sfx/decrunch_normal_dirty.asm
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/sfx/decrunch_normal.asm
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/sfx/decrunchers_data.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/sfx/decrunchers.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/sfx/detect_start.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/sfx/detect_start.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/sfx/fold.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/sfx/fold.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/sfx/generate_sfx.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/sfx/generate_sfx.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/sfx/mach_c64.c
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/sfx/mach_c64.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src/sfx/ops6502.h
ZIPLIST           += $(TOOLSFOLDER)/$(SUBSIZERFOLDER)/standalone/decrunch_normal.asm

TCFOLDER           = tinycrunch_v1.2
ZIPLIST           += $(TOOLSFOLDER)/$(TCFOLDER)/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(TCFOLDER)/readme.txt
ZIPLIST           += $(TOOLSFOLDER)/$(TCFOLDER)/bmp.bin
ZIPLIST           += $(TOOLSFOLDER)/$(TCFOLDER)/bmp.prg
ZIPLIST           += $(TOOLSFOLDER)/$(TCFOLDER)/tc_boot.prg
ZIPLIST           += $(TOOLSFOLDER)/$(TCFOLDER)/tc_boot.s
ZIPLIST           += $(TOOLSFOLDER)/$(TCFOLDER)/tc_decode.s
ZIPLIST           += $(TOOLSFOLDER)/$(TCFOLDER)/tc_decode_f.s
ZIPLIST           += $(TOOLSFOLDER)/$(TCFOLDER)/tc_encode.py
ZIPLIST           += $(TOOLSFOLDER)/$(TCFOLDER)/test/cbmcat
ZIPLIST           += $(TOOLSFOLDER)/$(TCFOLDER)/test/mkbmp.py
ZIPLIST           += $(TOOLSFOLDER)/$(TCFOLDER)/test/test.s
ZIPLIST           += $(TOOLSFOLDER)/$(TCFOLDER)/test/testbin.s

TSCRUNCHFOLDER     = tscrunch
ZIPLIST           += $(TOOLSFOLDER)/$(TSCRUNCHFOLDER)/decrunch.asm
ZIPLIST           += $(TOOLSFOLDER)/$(TSCRUNCHFOLDER)/decrunch_extreme.asm
ZIPLIST           += $(TOOLSFOLDER)/$(TSCRUNCHFOLDER)/decrunch_small.asm
ZIPLIST           += $(TOOLSFOLDER)/$(TSCRUNCHFOLDER)/readme.txt
ZIPLIST           += $(TOOLSFOLDER)/$(TSCRUNCHFOLDER)/tscrunch.go
ZIPLIST           += $(TOOLSFOLDER)/$(TSCRUNCHFOLDER)/tscrunch.py

WCRUSHFOLDER       = wcrush
ZIPLIST           += $(TOOLSFOLDER)/$(WCRUSHFOLDER)/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(WCRUSHFOLDER)/LICENSE.TXT
ZIPLIST           += $(TOOLSFOLDER)/$(WCRUSHFOLDER)/README.TXT
ZIPLIST           += $(TOOLSFOLDER)/$(WCRUSHFOLDER)/decrush/decrush.tas
ZIPLIST           += $(TOOLSFOLDER)/$(WCRUSHFOLDER)/wca/main.cpp
#ZIPLIST           += $(TOOLSFOLDER)/$(WCRUSHFOLDER)/wca/wca.exe
ZIPLIST           += $(TOOLSFOLDER)/$(WCRUSHFOLDER)/wcrush/main.cpp
#ZIPLIST           += $(TOOLSFOLDER)/$(WCRUSHFOLDER)/wcrush/wcrush.exe

ZX0FOLDER          = dali
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/dali.c
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/depack.asm
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/dzx0_dali.asm
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/dzx0_orig_zx0_v1.asm
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/dzx0_orig_zx0_v2.asm
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/sfx_fast.asm
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/sfx_small.asm
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/sfx.asm
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/testfile.lz
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/Makefile
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/LICENSE
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/LICENSE.cc0.md
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/LICENSE.zlib.md
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/README.md
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/asm/6502/zx0_6502.asm
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/asm/8088/unzx0_8088.S
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/asm/68000/unzx0_68000.S
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/asm/HuC6280/unpack-zx0.asm
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/asm/Z80/unzx0v1_fast.asm
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/salvador.c
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/shrink.h
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/expand.h
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/matchfinder.c
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/matchfinder.h
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libsalvador.h
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/format.h
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/shrink.c
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/expand.c
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/lib
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/lib/sssort.c
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/lib/trsort.c
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/lib/divsufsort.c
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/lib/divsufsort_utils.c
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/lib/CMakeLists.txt
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/CHANGELOG.md
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/pkgconfig
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/pkgconfig/CMakeLists.txt
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/pkgconfig/libdivsufsort.pc.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/CMakeModules
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/CMakeModules/ProjectCPack.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/CMakeModules/CheckFunctionKeywords.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/CMakeModules/cmake_uninstall.cmake.in
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/CMakeModules/AppendCompilerFlags.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/CMakeModules/CheckLFS.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/README.md
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/CMakeLists.txt
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/examples
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/examples/suftest.c
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/examples/unbwt.c
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/examples/mksary.c
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/examples/sasearch.c
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/examples/CMakeLists.txt
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/examples/bwt.c
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/LICENSE
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/include
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/include/divsufsort_config.h
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/include/divsufsort_private.h
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/include/lfs.h.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/include/config.h.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/include/CMakeLists.txt
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/include/divsufsort.h.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/include/divsufsort.h
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/src/libdivsufsort/VERSION.cmake
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/VS2019
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/VS2019/salvador.vcxproj.user
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/VS2019/salvador.vcxproj
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/VS2019/salvador.sln
ZIPLIST           += $(TOOLSFOLDER)/$(ZX0FOLDER)/salvador/VS2019/salvador.vcxproj.filters


DISKIMAGES         = $(BUILDFOLDER)/loadertest-c64.d64
DISKIMAGES        += $(BUILDFOLDER)/loadertest-c64.d71
DISKIMAGES        += $(BUILDFOLDER)/loadertest-c64.d81
DISKIMAGES        += $(BUILDFOLDER)/loader-c64.prg
DISKIMAGES        += $(BUILDFOLDER)/install-c64.prg
DISKIMAGES        += $(BUILDFOLDER)/loadersymbols-c64.inc

DISKIMAGES        += $(BUILDFOLDER)/loadertest-c128.d64
DISKIMAGES        += $(BUILDFOLDER)/loadertest-c128.d71
DISKIMAGES        += $(BUILDFOLDER)/loadertest-c128.d81
DISKIMAGES        += $(BUILDFOLDER)/loader-c128.prg
DISKIMAGES        += $(BUILDFOLDER)/install-c128.prg
DISKIMAGES        += $(BUILDFOLDER)/loadersymbols-c128.inc

DISKIMAGES        += $(BUILDFOLDER)/loadertest-c16.d64
DISKIMAGES        += $(BUILDFOLDER)/loadertest-c16.d71
DISKIMAGES        += $(BUILDFOLDER)/loadertest-c16.d81
DISKIMAGES        += $(BUILDFOLDER)/loader-c16.prg
DISKIMAGES        += $(BUILDFOLDER)/install-c16.prg
DISKIMAGES        += $(BUILDFOLDER)/loadersymbols-c16.inc

ZIPLIST           += $(DISKIMAGES)


default: prg

loader:
	$(MAKE) -C src

prg bin binary:
	$(MAKE) -C src prg

lib library:
	$(MAKE) -C src lib

prg-c64:
	$(MAKE) -C src PLATFORM=c64 prg

prg-c128:
	$(MAKE) -C src PLATFORM=c128 prg

prg-c16:
	$(MAKE) -C src PLATFORM=c16 prg

run:
	$(CD) ..; $(MAKE) -C $(SAMPLESFOLDER)/$(TESTFOLDER) run

$(BUILDFOLDER)/loadertest-c64.d64:
	$(CD) ..; $(MAKE) -C $(SAMPLESFOLDER)/$(TESTFOLDER) all

$(BUILDFOLDER)/loadertest-c128.d64:
	$(CD) ..; $(MAKE) -C $(SAMPLESFOLDER)/$(TESTFOLDER) PLATFORM=c128 all

$(BUILDFOLDER)/loadertest-c16.d64:
	$(CD) ..; $(MAKE) -C $(SAMPLESFOLDER)/$(TESTFOLDER) PLATFORM=c16 all

zip: prg-c64 prg-c128 prg-c16 $(BUILDFOLDER)/loadertest-c64.d64 $(BUILDFOLDER)/loadertest-c128.d64 $(BUILDFOLDER)/loadertest-c16.d64 version.inc
	$(CD) ..; $(ZIP) $(ZIPFILE) $(ZIPLIST)

loadertest: $(BUILDFOLDER)/loadertest-c64.d64 $(BUILDFOLDER)/loadertest-c128.d64 $(BUILDFOLDER)/loadertest-c16.d64 version.inc
	$(CD) ..; $(ZIP_NO_PATHS) $(LOADERTEST) $(DISKIMAGES)

.PHONY: tools cc1541 bitnax b2 doynax exomizer levelcrush lzsa2 nucrunch pucrunch subsizer zx0
tools: cc1541 bitnax b2 doynax exomizer levelcrush lzsa2 nucrunch pucrunch subsizer zx0

bitnax:
	$(CC) ../$(TOOLSFOLDER)/bitnax-07a8c67/lz.c -o tools/bitnax-07a8c67/lz

b2:
	$(MAKE) -C ../$(TOOLSFOLDER)/$(B2FOLDER)

doynax:
	$(CC) ../$(TOOLSFOLDER)/$(DOYNAXLZFOLDER)/lz.c -o ../$(TOOLSFOLDER)/$(DOYNAXLZFOLDER)/lz

exomizer:
	$(MAKE) -C ../$(TOOLSFOLDER)/$(EXOFOLDER)/src

levelcrush:
	$(MAKE) -C ../$(TOOLSFOLDER)/$(WCRUSHFOLDER)

lzsa2:
	$(MAKE) -C ../$(TOOLSFOLDER)/$(LZSAFOLDER)

nucrunch:	
	$(MAKE) -C ../$(TOOLSFOLDER)/$(NCFOLDER)

pucrunch:
	$(MAKE) -C ../$(TOOLSFOLDER)/$(PUFOLDER)

subsizer:
	$(MAKE) -C ../$(TOOLSFOLDER)/$(SUBSIZERFOLDER)/src

zx0:
	$(MAKE) -C ../$(TOOLSFOLDER)/$(ZX0FOLDER)

cc1541:
	$(MAKE) -C ../$(TOOLSFOLDER)/$(CC1541FOLDER)

ifeq ($(NOWORKINGCOPY),0)
version.inc: ../.svn/entries
	$(PRINTF) '.define REPOSITORY_VERSION ' > $@
	-$(PRINTF) '%d' $(VERSION) >> $@
	$(PRINTF) '\n' >> $@
	$(PRINTF) '.define REPOSITORY_VERSION_STRING "' >> $@
	$(PRINTF) '%s' $(VERSION) >> $@
	$(PRINTF) '"\n' >> $@
endif
