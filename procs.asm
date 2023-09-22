
global DumpChar

section .data
 
   ; This table is used for ASCII character translation, into the ASCII
	; portion of the hex dump line, via XLAT or ordinary memory lookup.
	; All printable characters “play through“ as themselves. The high 128
	; characters are translated to ASCII period (2Eh). The non-printable
	; characters in the low 128 are also translated to ASCII period, as is
	; char 127.
	DotXlat:
			db 2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh
			db 2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh
			db 20h,21h,22h,23h,24h,25h,26h,27h,28h,29h,2Ah,2Bh,2Ch,2Dh,2Eh,2Fh
			db 30h,31h,32h,33h,34h,35h,36h,37h,38h,39h,3Ah,3Bh,3Ch,3Dh,3Eh,3Fh
			db 40h,41h,42h,43h,44h,45h,46h,47h,48h,49h,4Ah,4Bh,4Ch,4Dh,4Eh,4Fh
			db 50h,51h,52h,53h,54h,55h,56h,57h,58h,59h,5Ah,5Bh,5Ch,5Dh,5Eh,5Fh
			db 60h,61h,62h,63h,64h,65h,66h,67h,68h,69h,6Ah,6Bh,6Ch,6Dh,6Eh,6Fh
			db 70h,71h,72h,73h,74h,75h,76h,77h,78h,79h,7Ah,7Bh,7Ch,7Dh,7Eh,2Eh
			db 2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh
			db 2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh
			db 2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh
			db 2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh
			db 2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh
			db 2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh
			db 2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh
			db 2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh,2Eh


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


    TextChar:
        


        

