/*
 *  TinyCrunch 1.2
 *  Christopher Jam
 *  September 2018
 */

About
=====

TinyCrunch is a small, fast LZ codec originally thrown together in a hurry for
Jam Ball 2. It's since been considerably refined.

While the basic design of three byte aligned fixed length token formats remains
the same, there is now a 100 byte decoder for when space is even tighter, a
faster decoder (tc_decode_f.s) for use in self extracting files, and optional
'next block' callbacks for fastload integration. Last but not least, it can
also now output self extracting .prgs, for any file north of $0200.


Requirements
============

Generating self extracting .prgs only requires python (tested on 2.7 and 3.6)

Building the tests, or modifying the boot file used by sfx mode requires ca65.

Rebuilding bmp.prg/bmp.bin (the bitmap displayed by the tests) would require Numpy,
but the .prg and .bin are included in case you have python and ca65 but don't want
to install any more python libraries to run the example code.


Installation Notes
==================

Wherever you put tc_encode.py, make sure it's accompanied by tc_boot.prg


Usage
=====

python tc_encode.py -h for argument descriptions. Note that you must specify
precisely one of output start address, output end address, in-place compression,
self extracting, or raw (headerless) mode.

The data files produced by the first three options can be decoded with either
of the tc_decode*.s routines by calling decode with A and X set to the low and
high bytes respectively of the address of the data to decrunch.

cf SFX notes below for the self extracting option.

The fifth option (-r) just reads & writes blocks of binary data with no load address.
The output file contains no header at all, so it's the caller's responsibility to
set the source and destination zero page pointers to source address and one less
than destination address respectively. Cf test/testbin.s for example usage, and
don't forget to define TC_NO_HEADER when assembling.

In this mode the small decruncher is a mere 79 bytes long. Note that in-place
decompression is not supported in this instance, as the datastream is null terminated
and there's no header to save the final byte.


SFX notes
=========

Simple sfx example:

    python tc_encode.py -vx input.prg output.prg

Input files can range anywhere from $0200 to $ffff

IO area and interrupts are disabled during decrunch, and restored before
jumping to start address (default $080d)

The SFX boot overwrites memory from $00fa to $01ba, and four bytes of stack
($01f3-$1f6). The rest of low memory is undisturbed.


Test targets
============

make run
 - to test the compact decruncher.
   Uncomment the TC_BLOCK_INTERFACE line in the Makefile to test the block interface too.

make frun
 - to test the fast decruncher.
   Uncomment the TC_BLOCK_INTERFACE line in the Makefile to test the block interface too.

make runbin
 - to test the headerless compact decruncher.

make frunbin
 - to test the headerless fast decruncher.


Change Notes
============

1.1
  - adds raw (headerless) mode, and warns on dissonant file extensions

1.1.1
  - ensures test code runs with more versions of cl65 than were originally tested against
  - documents the test targets

1.2
  - added small per-token costs to the cost function to (eg) discourage pairs of two byte copies
    wherever a 4 byte copy would provide the same ratio.  Improves decrunch speed by 10-20%


Acknowledgements
================

Thanks to Krill for much assistance getting the small decrunch down to 100 bytes,
as well as general testing and feature requests.

Thanks to iAN CooG for beta testing the self extracting file functionality.
Thanks to groepaz for assistence with cc65 usage.

Any remaining bugs are mine.


