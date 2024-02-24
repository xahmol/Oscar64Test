TEST = test/test.prg
FTEST = test/ftest.prg
TESTBIN = test/testbin.prg
FTESTBIN = test/ftestbin.prg
CLFLAGS = -C c64-asm.cfg -u __EXEHDR__ --cpu 6502X
RUNNER = x64sc

all: $(TEST) $(FTEST) $(TESTBIN) $(FTESTBIN) tc_boot.prg

release: tc_boot.prg bmp.prg bmp.bin

run: $(TEST)
	$(RUNNER) $<

frun: $(FTEST)
	$(RUNNER) $<

runbin: $(TESTBIN)
	$(RUNNER) $<

frunbin: $(FTESTBIN)
	$(RUNNER) $<

tc_boot.prg: tc_boot.s tc_decode_f.s
	cl65 $(CLFLAGS) -o $@ tc_boot.s

$(TEST): test/test.s tc_decode.s test/params.inc crunched.prg test/cbmcat
	cl65 $(CLFLAGS) -o test/decode.prg test/test.s tc_decode.s -Ln test/test.sym
	#cl65 $(CLFLAGS) --asm-define TC_BLOCK_INTERFACE -o test/decode.prg test/test.s tc_decode.s -Ln test/test.sym
	python test/cbmcat test/decode.prg crunched.prg >$@

$(FTEST): test/test.s tc_decode_f.s test/params.inc crunched.prg test/cbmcat
	cl65 $(CLFLAGS) -o test/fdecode.prg test/test.s tc_decode_f.s -Ln test/ftest.sym
	#cl65 $(CLFLAGS) --asm-define TC_BLOCK_INTERFACE -o test/fdecode.prg test/test.s tc_decode_f.s -Ln test/ftest.sym
	python test/cbmcat test/fdecode.prg crunched.prg >$@

$(TESTBIN): test/testbin.s tc_decode.s crunched.bin
	cl65 $(CLFLAGS) --asm-define TC_NO_HEADER -o $@ test/testbin.s tc_decode.s -Ln test/testbin.sym

$(FTESTBIN): test/test.s tc_decode_f.s crunched.bin
	cl65 $(CLFLAGS) --asm-define TC_NO_HEADER -o $@ test/testbin.s tc_decode_f.s -Ln test/ftestbin.sym

bmp.prg bmp.bin: test/mkbmp.py
	python $<

test/params.inc crunched.prg: tc_encode.py bmp.prg Makefile
	python $< -vi bmp.prg crunched.prg -p test/params.inc

crunched.bin: tc_encode.py bmp.bin Makefile
	python $< -vr bmp.bin crunched.bin

clean:
	$(RM) -rf *.{prg,o,sym} test/*.{prg,o,sym,inc} *.bin
