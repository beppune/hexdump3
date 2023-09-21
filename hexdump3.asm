
;	Program:	Hexdump3
;	Author:		Giuseppe Manzo
;	Updated:	2023-09-23
;
;	compile with:
;		nasm  -f elf32 -g  -o hexdump3.o hexdump3.asm
;		ld  -m  elf_i386  -o hexdump3 hexdump3.o
;

global _start
extern DumpChar

section .data

	DumpLin: db " 00 00 00 00"
	DUMPLEN		equ $-DumpLin

section .text

_start:

	nop

		mov eax, 0FAh
		mov edi, DumpLin

		call DumpChar

		mov eax, 4
		mov ebx, 1
		mov ecx, DumpLin
		mov edx, DUMPLEN
		int 80h

Exit:	mov eax, 1		; sys_exit
		mov ebx, 0		; exit with value 0
		int 80h			; kernel

	nop

