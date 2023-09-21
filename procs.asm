
global DumpChar

section .text

	; DumpChar:		Put an Hex representation of byte into given position
	; UPDATED:		21/09/2023
	; INPUT:		AL:		byte to be represented
	;				EDI:	base position of position into representation string
	; OUTPUT:		None
	; MODIFIES:		bytes at [edi + 2] and [edi + 1]
	DumpChar:
		push ebx				; save ebx value
		
		xor ebx, ebx			; zero ebx

		mov bl, al				; copy given byte to al
		and bl, 0Fh				; and byte to get Least Significant Nybble
		mov bl, [HexStr + ebx]	; move matching byte of bl value into bl
		mov [edi + 2], bl		; move LSN char into string position

		mov bl, al				; copy given byte into al
		shr bl, 4				; shift bl 4 btes to right to get Most Significant Nybble
		mov bl, [HexStr + ebx]	; move matching byte of bl value into bl
		mov [edi + 1], bl		; move MSN char into string position

		pop ebx					; restore ebx
		
		ret						; return from procedire
		HexStr: db "0123456789ABCDEF"
