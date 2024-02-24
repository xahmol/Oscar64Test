# Makefile for subsizer

# configuration
CPPFLAGS += -MMD -MP
CFLAGS= -O3 -march=native -Wall

# top level targets
all:	subdirs subsizer

# source files
SRC = subsizer.c \
      params.c match.c pathfinder.c universal.c bits-base.c \
      crunch_normal.c \
      buffer.c memory.c \
      histogram.c \
      bitfunc.c \
      message.c \
      utils.c \
      global.c

# targets
subsizer:	$(SRC:%.c=%.o) sfx/sfx.o
	$(CC) $(CFLAGS) -o $@ $^ -lm
	cp $@ ..

# clean
clean:	subdirs
	rm -f *~ \#*\#
	rm -f *.o
	rm -f *.d
	rm -f a.out
	rm -f subsizer

# handle dependencies
-include $(SRC:%.c=%.d)

# handle sub directories
export CC LD CPPFLAGS CFLAGS
subdirs:
	$(MAKE) -C sfx $(MAKECMDGOALS)

# eof
