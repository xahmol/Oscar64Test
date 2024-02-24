// wcrush v0.3b by CS - a replacement for Taboo's level crusher which unfornately doesn't run in 64bit Windows.

//#include <SDKDDKVer.h> was added by Visual Studio 2013, remove or change to whatever your dev-tools want instead

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define maxsize 65535
#define endmark 511
#define maxref 255

uint8_t inbuf[maxsize + 1]; //our working buffers
uint8_t outbuf[maxsize + 258]; //+ some extra bytes, just in case
uint32_t srcidx, tgtidx, ctrlidx, uncmp, ctrlbit;

void putbit (uint32_t bit);
void storelenbits (uint32_t l, uint32_t stopbit);
void storeoffset (uint32_t offset, uint32_t table);
void storeref(uint32_t offset, uint32_t size, uint32_t table);
void copybytes ();
uint32_t packed (uint32_t end, int speed);

int main(int argc, char* argv[])
{
	printf ("\ncrush for windows v0.3b by CS\n\n");
	int speed = 7;
	if (argv[1] != NULL)
		speed = atoi(argv[1]);
	if (argc < 3 || speed < 0 || speed > 6) // not the expected amount/range of parameters
	{
		printf ("usage: wcrush <speed 0..6> <source name> [target name]\n");
		exit (EXIT_FAILURE);                // not really an error, but returning success only when something got packed seems useful.
	}

	printf ("trying to crush %s...\n\n", argv[2]);
	FILE * infile;
	infile = fopen (argv[2], "rb");
	if (infile == NULL) // file can't be opened for whatever reason:
	{
		printf ("can't open %s!\n", argv[2]);
		exit (EXIT_FAILURE);
	}

    fseek (infile, 0, SEEK_END);
	uint64_t filesize = ftell(infile);
	rewind (infile);
	if (filesize > maxsize) // if file too large
	{
		printf ("file too large!\n");
		exit (EXIT_FAILURE);
	}
	if (filesize < 4) // or too small
	{
		printf("file too small!\n");
		exit(EXIT_FAILURE);
	}

    uint16_t ifsize = filesize & 0xffff;
	ssize_t bytes_read = fread (inbuf, 1, ifsize, infile);
	(void) bytes_read;
	fclose (infile);
	printf ("size of %s: %d bytes.\n", argv[2], ifsize);

	uint16_t ofsize = packed (ifsize, speed);

	if (!ofsize) // something went wrong
	{
		printf("couldn't pack file!\n");
		exit(EXIT_FAILURE);
	}

	outbuf[0] = inbuf[0]; // copy startaddress
	outbuf[1] = inbuf[1];

	printf("crushed size: %d bytes, %d%% left\n", ofsize, 100 * ofsize / ifsize);
	FILE * outfile;
	if (argv[3]!=NULL)
		outfile = fopen(argv[3], "wb");
	else
		outfile = fopen("crushed", "wb");
	if (outfile == NULL) // if file can't be opened for whatever reason:
	{
		printf ("can't open %s!\n", argv[2]);
		exit (EXIT_FAILURE);
	}

    fwrite (outbuf, 1, ofsize, outfile);
	fclose (outfile);
	return EXIT_SUCCESS;
}

uint32_t packed(uint32_t end, int speed)
{
	const uint16_t longmax[7] = { 115, 343, 679, 1359, 2383, 4687 , 9359 };
	const uint16_t shortmax[7] = { 115, 343, 679, 1359, 1359, 1359, 1359 };
	uint16_t previous[maxsize + 1];
	uint16_t last[256];
	uint32_t refidx, distance, bestoffs, bestlen, len, max, table,
			 minlongdst, maxshrtdst, maxlongdst;

	// walk the input data once and create a helper table containing links to the
	// closest match for the byte at current position to speed up packing a bit.

	for (refidx = 0; refidx < 256; refidx++)  // no bytevalue has been found yet
		last[refidx] = 0;
	for (refidx = 0; refidx < end; refidx++)
	{
		previous[refidx] = last[inbuf[refidx]];
		last[inbuf[refidx]] = refidx;
	}

	table = speed * 8; // some speed dependant settings
	minlongdst = longmax[speed];
	maxshrtdst = shortmax[speed];
	maxlongdst = minlongdst + maxref;

	srcidx = 2;		// skip start adress
	ctrlidx = 2;	// dito
	tgtidx = 3;		// to avoid overwriting the 1st contol byte
	uncmp = 0;      // no uncompressable sequence found yet
	ctrlbit = 128;   // first control bit value

	// now comes the (very naively designed) compression loop:

	while (srcidx < end && tgtidx <= maxsize)
	{
		bestlen = 0;		// no match found yet at this position
		refidx = srcidx;

		while ((refidx=previous[refidx]) >= 2 && (distance=srcidx-refidx) <= maxlongdst && bestlen < maxref)
		{
			if (refidx) // quickly skip ahead if not even a single byte match exists
			{
				len = 1;
				if (distance < maxref)	// match must not overlap with output data
					max = distance;
				else					// and can't be more than 255 bytes long.
					max = maxref;
				if (srcidx + max > end)
					max = end - srcidx; // and must no go beyond end of input data

				while (len < max && inbuf[refidx + len] == inbuf[srcidx + len])
					len++;

				if (len > bestlen && distance - len <= minlongdst)
				{
					bestlen = len;
					bestoffs = distance - len;
				}
			}
		}

		if (bestlen > 2 || (bestlen == 2 && bestoffs <= maxshrtdst))
			storeref(bestoffs, bestlen, table); // if a match of 2 or more bytes was found
		else
		{
			uncmp++;
			srcidx++;
		}
	}

	if (srcidx > end || tgtidx > maxsize)
		return 0;	// if something went wrong
	else
	{
		if (uncmp)	// store any remaining uncompressable bytes
			copybytes();
		else
			putbit(1); //or flag reference coming up
		putbit(1);    // flag 3+ byte length
		storelenbits(endmark, 0);
		while (ctrlbit) // make sure the last control bits are written out
			putbit(0);
		return tgtidx;
	}
}

// encode a 2 or more bytes long repetition into output data

void storeref(uint32_t offset, uint32_t size, uint32_t table)
{
	if (uncmp) // if there's a run of incompressible bytes to encode first
		copybytes ();
	else
		putbit(1); // signal repetition ahead
	if (size == 2)
	{
		putbit(0); // flag length = 2
		storeoffset(offset, table + 4);
	}
	else
	{
		putbit(1); // flag length = 3 or more
		if (size == 3)
			putbit(1); //only stopbit required
		else
			storelenbits(size - 2, 1);
		storeoffset(offset, table);
	}
	srcidx += size; // skip the input data that is repeated
}

void storeoffset(uint32_t offset, uint32_t table)
{
	const uint8_t packbits[56] = {
		2, 2, 1, 1, 2, 2, 1, 1,  // worst compression (speed 0)
		3, 1, 2, 2, 3, 1, 2, 2,
		3, 2, 2, 2, 3, 2, 2, 2,
		4, 2, 2, 2, 4, 2, 2, 2,
		4, 2, 2, 3, 4, 2, 2, 2,
		4, 2, 3, 3, 4, 2, 2, 2,
		4, 3, 3, 3, 4, 2, 2, 2 }; // best compression (speed 6)

	uint16_t bits = 0;
	uint16_t largest = 0;
	int16_t chunk = -1; // required to end up with the right amount of chunks after calculation
	uint16_t subst = 0;
	while (offset >= largest) // while can't be stored with current amount of bits:
	{
		subst = largest;  //for offset correction
		bits += packbits[++chunk + table]; //add another bitchunk
		largest += (1 << bits); // 2^packbits[chunk0]+2^(bits+packbits[chunk1])+...
	}
	offset -= subst; // cause depacker adds 1 to partial result for every extra bitchunk
	putbit(chunk & 2);
	putbit(chunk & 1);
	bits = 1 << bits;
	while (bits /= 2)
		putbit(offset&bits);
}

// copy an uncompressable byte sequence from input to output data:

void copybytes()
{
	putbit(0); // flag run of uncompressed bytes
	storelenbits(uncmp, 1);
	while (uncmp)
		outbuf[tgtidx++] = inbuf[srcidx - uncmp--];
}

// this will create the stopbit/bit sequence which the unpacker uses to calculate lengths.
// final stopbit is an extra parameter as the end mark doesn't need it.
// the twobyte-flag is also NOT included, add it manually BEFORE calling this function.
// apart from that it actually works, so note to me: DON'T TOUCH IT ANYMORE!

void storelenbits(uint32_t len, uint32_t stopbit)
{
	uint16_t msbval = 1;
	uint16_t tmp = len;
	while (tmp /= 2)
		msbval *= 2; //find out msb of length
	tmp = len - msbval; //then remove it, see unpacker mechanics for details
	while (msbval /= 2) // store remaining length bits:
	{
		putbit(0); // stopbit 0 to signal another length bit is following
		putbit(tmp & msbval); // shift in length bit
	}
	if (stopbit)
		putbit(1);
}

// collect control bits and store them at the next unused outbuf position.
// IMPORTANT: The correct order of operations is to not add the control byte
// to output data when it is full but when it is full AND another bit should
// be added! The difference is subtle and may or may not derail the depacker,
// depending on the payload, so when errors occur after depacking in a rather
// random fashion make sure to check this routine first:

void putbit(uint32_t bit)
{

	if (!ctrlbit) // byte full?
	{
		ctrlidx = tgtidx++;
		outbuf[ctrlidx] = 0; // reinit control byte
		ctrlbit = 128;
	}
	if (bit)
		outbuf[ctrlidx] |= ctrlbit;
	ctrlbit /= 2;
}