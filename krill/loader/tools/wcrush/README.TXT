WHAT THIS IS ALL ABOUT:

Crush for Windows was developed as a replacement for Taboo's crush.exe levelcrusher, which unfortunately doesn't work on 64 bit Windows without ugly tricks like using DosBox etc.
The binaries included work on Windows 98SE and Windows 8.1 64 bit, so they should (maybe) work on all Windows versions that came in between (hopefully).


WHY EVEN USE THIS:

No idea, really, as ALZ and Exomizer pack much better, and even Pucrunch beats it. But crush is quite fast and the depacker is easy to understand and thus easy to customize, and can be made pretty tiny, too. Apart from that you might want to use it just for nostalgic reasons if you are one of those guys.


WARNING:

This early vesrion may have lots of bugs and could make your PC catch fire and/or explode, use at your own risk!

This is also the first PC program I wrote after a 20 hiatus, and the first somewhat complex C(++) program I ever wrote, too, googling every second instruction in the process, so the source code will likely make seasoned C-programmers cringe - read it at your own risk, too!

The working principles of the packer were derived from analysing the C64-end depacker and my implementation of the resulting compression algorithm is pretty naive and inefficient, making wcrush up to 6 or 7 times slower than the original. On a 1300MHz Celeron the worst case still took just ca. 0.3 seconds to pack though, so on more modern PCs the speed-difference might not be that notable.


USAGE:

wcrush <speed> <input file> [output file]

where <speed> must range from 0 (the worst compression) to 6 (the best), and <input file> must be a binary that is neither shorter than 4 bytes nor longer than 65535 bytes. If no output filename is specified the output file will be named "crushed".


INCLUDED IN THIS RELEASE:

[wcrush]:
Windows binary and source code

[decrush]
a slightly modified and heavily commented version of the original C64-end depacker by Taboo, that is a bit slower, but fits in the stack up to ca. $1d8 for depacking of extra large files. Does not handle $01, $d030 etc. after depacking, do that in the payload or use the original Taboo depacker instead. Assemble with 64Tass/6502Tass 1.31 or later.

[wca]
Windows binary and source code of the crushfile analyzer, a tool that prints out how the depacker on the C64 would handle a crushed binary. Numbers in brackets (eg. "(0080:2f)") are the last address(es) and value(s) of the control bytes read between perfoming the previous and the current action. The sole purpose of this hackjob was to compare the outputs of original crush and wcrush to aid my debugging efforts, it is just included for fun.


ADDITIONAL CREDITS AND THANKS:

Taboo for the original crush & decrush.tas
Groepaz/Hitman for the makefile
stackoverflow.com and cplusplus.com for without those sites I would have been completely lost.


That's all, thanks for reading and have a nice day,

CS.
