
global DumpChar

section .text

	DumpChar:
		push ebx
		
		xor ebx, ebx

		mov bl, al
		and bl, 0Fh
		mov bl, [HexStr + ebx]
		mov [edi + 2], bl

		mov bl, al
		shr bl, 4
		mov bl, [HexStr + ebx]
		mov [edi + 1], bl

		pop ebx
		
		ret
		HexStr: db "0123456789ABCDEF"
