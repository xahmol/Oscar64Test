#include <petscii.h>

#pragma section( startup, 0 )
#pragma region( startup, 0x0b00, 0x0bff, , , {startup})
#pragma region( main, 0x0bff, 0x0c00, , , {code, bss, heap, data})
#pragma heapsize(0)

#define executable "vdctest"

__export char pad[1] = {0};

__asm startup
{
	byt	"cbm"

	byt 0, 0

	byt 0
	byt 0

	byt executable, 0

	byt 0

    lda $BA
    and #3
    tay

    lda CMD_LO,y
    tax
    lda CMD_HI,Y
    tay

    jmp $AFA5

CMD_8:
  	byt "run", $22, executable, $22, ",u8", $00
CMD_9:
  	byt "run", $22, executable, $22, ",u9", $00
CMD_10:
  	byt "run", $22, executable, $22, ",u10", $00
CMD_11:
  	byt "run", $22, executable, $22, ",u11", $00

CMD_LO:
	byt <[CMD_8 - 1], <[CMD_9 - 1], <[CMD_10 - 1], <[CMD_11 - 1]
CMD_HI:
	byt >[CMD_8 - 1], >[CMD_9 - 1], >[CMD_10 - 1], >[CMD_11 - 1]

}

#pragma startup(startup)