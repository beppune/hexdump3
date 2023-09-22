
hexdump3:	hexdump3.o procs.o
	ld  -m  elf_i386  -o hexdump3 hexdump3.o procs.o

hexdump3.o:	hexdump3.asm
	nasm  -f elf32 -g  -o hexdump3.o hexdump3.asm

procs.o:	procs.asm
	nasm  -f elf32 -g  -o procs.o procs.asm

clean:
	rm hexdump3 hexdump3.o procs.o

ifneq ($(EDITOR),)
e:
	${EDITOR} hexdump3.asm
endif

run: hexdump3
	./hexdump3
