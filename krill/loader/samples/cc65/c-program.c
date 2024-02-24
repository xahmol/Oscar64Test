
#include <6502.h>
#include <c64.h>
#include <string.h>

static unsigned char irq_stack[64];

static void *COLOURS = (void *) 0x5c00;
static void *BITMAP  = (void *) 0x6000;

static char status;

static void
install_loader(void)
{
  asm("jsr install");
}

static int
load_file(const char *filename)
{
  static char lo;
  static char hi;

  lo = (int) filename;
  hi = ((int) filename) >> 8;

  asm("ldx %v\n" /* lo */
      "ldy %v\n" /* hi */
      "jsr loadraw\n"
      "bcs err\n"
      "lda #0\n"
      "err:\n"
      "sta %v\n" /* status */
      , lo, hi, status);

  return status;
}

static unsigned char
handle_irq(void)
{
  ++VIC.bordercolor;
  --VIC.bordercolor;

  VIC.irr = 1;

  return IRQ_HANDLED;
}

static void
init(void)
{
  memset(COLOURS, 0xfb, 25 * 40);
  memset(BITMAP, 0, 25 * 40 * 8);

  CIA1.icr = 0x7f;

  CIA2.pra = 2;

  set_irq(&handle_irq, irq_stack, sizeof irq_stack);

  VIC.ctrl1 = 0x3b;
  VIC.addr = 0x78;
  VIC.rasterline = 0x20;

  VIC.irr = 1;
  VIC.imr = 1;
}

static void
error(void)
{
  do {
    ++VIC.bordercolor;
    VIC.bordercolor = status;
  } while (1);
}

void
main(void)
{
  install_loader();

  init();

  do {
    if (load_file("pic1") != 0) {
      error();
    }
    ++VIC.bordercolor;

    if (load_file("pic2") != 0) {
      error();
    }
    ++VIC.bordercolor;
  } while (1);
}
