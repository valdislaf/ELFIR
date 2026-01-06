CXX := g++
CFLAGS := -std=c++20 -O2 -Wall -Wextra -pedantic
NASM := nasm
LD := ld

.PHONY: all clean

all: prog

elfirc: elfirc.cpp
	$(CXX) $(CFLAGS) $< -o $@

out.asm: test.elfir elfirc
	./elfirc test.elfir $@

out.o: out.asm
	$(NASM) -felf64 $< -o $@

runtime.o: runtime.asm
	$(NASM) -felf64 $< -o $@

prog: out.o runtime.o
	$(LD) $^ -o $@
	./prog

clean:
	rm -f elfirc out.asm out.o runtime.o prog