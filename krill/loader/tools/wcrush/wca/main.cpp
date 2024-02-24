// this pretty much does the same as the taboo depacker on the C64-end
// (aka decrush.tas), except it doesn't run on a C64 but a PC and it's
// sole purpose is to walk through a raw crushed binary and tell you
// how the depacker would interprete the information stored in it.
// or in other words, it's just a debugging aid for the levelcrusher I wrote.

// latest changes: added some sanity checks to keep operations within buffer limits (hopefully)

// Note: does currently only support files crushed with max compression ("speed"=6)

// #include <SDKDDKVer.h> //VS 2013 stuff, remove or change to whatever your dev-tools require
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define maxsize 0xffff

const uint8_t packbits[56] = {
	2, 2, 1, 1, 2, 2, 1, 1,  // worst compression (speed 0)
	3, 1, 2, 2, 3, 1, 2, 2,
	3, 2, 2, 2, 3, 2, 2, 2,
	4, 2, 2, 2, 4, 2, 2, 2,
	4, 2, 2, 3, 4, 2, 2, 2,
	4, 2, 3, 3, 4, 2, 2, 2,
	4, 3, 3, 3, 4, 2, 2, 2 }; // best compression (speed 6)

uint8_t inbuf[maxsize+1];
uint8_t outbuf[maxsize+1]; // dummy output, only there to be able to show repeat byte sequences

uint32_t srcidx, tgtidx, refidx, offset, ctrlbyte;
int32_t chunkofs, len, chunks, chunkwidth, bitnum, columns;
uint64_t fsize; // just in case someone stupid (aka me) tries to run a TB-sized file through the analyzer
int speed = 6;

// show the data bytes currently handled by depacker in somewhat formatted fashion:

void movedata(uint8_t buffer1[], uint8_t buffer2[], uint32_t& idx1, uint32_t& idx2, int32_t len)
{
	columns = 16;
	printf("%04x: ", idx2);
	while (0 < len--) // to filter out negative lens as well, just in case...
	{
		printf(" %02x", buffer1[idx1]);
		buffer2[idx2++] = buffer1[idx1++];
		if (--columns == 8)
			printf(" ");
		if (!columns)
		{
			printf("\n");
			if (len)
				printf("%04x: ", idx2);
			columns = 16;
		}
	}
	printf("\n");
	if (columns != 16)
		printf("\n");
}


// extract control bit from input buffer, return 1 if set, else 0.
// also show value [and address] of current control byte

uint16_t getbit()
{
	if (--bitnum <0)
	{
		ctrlbyte = inbuf[srcidx];
		bitnum = 7;
		printf("(%04X:%02X)", srcidx,ctrlbyte);
		if (srcidx < fsize) // sanity check
			srcidx++;
	}
	return (ctrlbyte &(1<<bitnum))>>bitnum;
}



int main(int argc, char* argv[])
{
	printf("\ncrushfile analyzer v0.1b by manic mailman\n\n");

// some help for the end user if input parameter is missing:

	if (argc < 2)
	{
		printf("usage: wca <raw crushed binary> [speed 0..6]\n");
		printf("example: wca crushed 6 > log.txt\n");
		printf("if no speed is given speed 6 is assumed.\n");
		return 1;
	}

// if filename is provided try to open file, if possible:

	printf("trying to analyze %s...\n\n", argv[1]);
	FILE * infile;
	infile = fopen(argv[1], "rb");
	if (infile == NULL)
	{
		printf("can't open file!\n");
		exit(EXIT_FAILURE);
	}
	fseek(infile, 0, SEEK_END);
	fsize = ftell(infile);
	rewind(infile);

// more error msgs if file is too large or too short to be a valid crushed binary

	if (fsize > maxsize) // if file too large
	{
		printf("file too large!\n");
		exit(EXIT_FAILURE);
	}

	if (fsize < 4)
	{
		printf("nothing to analyze!\n");
		exit(EXIT_FAILURE);
	}
	if (argv[2] != NULL)
		speed = atoi(argv[2]);
	speed = speed * 8;

// could be valid, so here we go:

	ssize_t bytes_read = fread(inbuf, 1, fsize&maxsize, infile);
	(void) bytes_read;
	fclose(infile);
	tgtidx = inbuf[0] + 0x100 * inbuf[1];
	printf("start address: %d/%04X, size: %d bytes.\n\n", tgtidx, tgtidx, (int) fsize);
	srcidx = 2; // skip start address
	bitnum = 0; // to read 1st control byte right away

    do {

//if end of either input data or output buffer reached before reading endmark:

		if (srcidx >= fsize || tgtidx >= maxsize)
		{
			printf("no valid endmark found, aborting.\n");
			exit(EXIT_FAILURE);
		}

// copy uncompressed bytes if control bit == 0, else repeat bytes:

		if (!getbit())
		{
			len = 1;
			while (!getbit() && len < maxsize) // get length of run from stopbit,bit... sequence
				len = len * 2 + getbit();
    		printf(" COPY %04X uncompressed bytes from %04X to %04X\n", len, srcidx, tgtidx);

        	if (tgtidx + len > maxsize) // sanity check
				len = maxsize - tgtidx;
			if (srcidx + len > fsize) // sanity check
				len = fsize&maxsize - srcidx;

			movedata(inbuf, outbuf, srcidx, tgtidx, len);
		}

// repeat a sequence of bytes that has already been decompressed:

		len = 1;
		if (getbit()) // 3+ byte sequence
		{
			chunkofs = speed;
			while (!getbit() && len < 0x100) // get len from stopbit,bit...sequence
				len = len * 2 + getbit();
			len += 2;
		}
		else          // 2+ byte sequence
		{
			chunkofs = speed + 4;
			len++;
		}

// if reference length is valid repeat 2 or more bytes:

        if (len < 0x100)
		{
            offset = 0;
			chunks = 2 * getbit() + getbit(); // get # of bitchunks (2 bits)
			do {
				chunkwidth = packbits[chunkofs + chunks]; // bitwidth of current chunk
				while (chunkwidth--)
					offset = 2 * offset + getbit(); //shift in offset bits of current chunk
				if (chunks) // +1 if more bitchunks remaining
					offset++;
			} while (chunks--);
        	refidx = tgtidx - (offset + len);
			printf(" REPEAT %02X bytes from %04X at %04X (offset %d)\n", len, refidx, tgtidx, offset);

			if (tgtidx + len > maxsize) // sanity check
				len = maxsize - tgtidx;
   			movedata(outbuf, outbuf, refidx, tgtidx, len);
		}

// else depacker has reached end of input data (or crapped out somewhere before)

		else
		{
			printf(" endmark found (%d/%04X)\n", len-2, len-2);
			if (srcidx < fsize)
				printf("warning: endmark is not at end of input data!\n");
		}

	} while (len < 0x100);
	return EXIT_SUCCESS;
}
