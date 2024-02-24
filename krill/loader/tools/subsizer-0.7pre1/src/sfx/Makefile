# Makefile

# top level targets
all:	sfx.o

# source files
SRC = detect_start.c generate_sfx.c fold.c

# targets
sfx.o:	$(SRC:%.c=%.o)
	$(LD) -r $^ -o $@
# clean
clean:
	rm -f *~ \#*\#
	rm -f *.o
	rm -f *.d
	rm -f a.out

# handle dependencies
-include $(SRC:%.c=%.d)

# eof
