CXX := g++
CFLAGS := -std=c++20 -O2 -Wall -Wextra -pedantic
NASM := nasm
LD := ld

.PHONY: all clean freestanding

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

out_freestanding.asm: test_freestanding.elfir elfirc
	./elfirc --freestanding test_freestanding.elfir $@

out_freestanding.o: out_freestanding.asm
	$(NASM) -felf64 $< -o $@

prog_freestanding: out_freestanding.o
	$(LD) -e _start $< -o $@

freestanding: prog_freestanding

clean:
	rm -f elfirc out.asm out.o runtime.o prog out_freestanding.asm out_freestanding.o prog_freestanding
