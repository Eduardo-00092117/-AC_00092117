org	100h

section .text
        
	call    texto
        mov     dx, msg11
        call 	w_strng
	call 	kb
	xor 	si, si
lupi:	call 	kb
	cmp 	al, "$"
	je	valida
	mov	bx, 5d
	sub     al, 30h
	add	[300h], al
	inc 	si
	mov 	[305h], si 
	jmp 	lupi

valida:	mov 	dx, nl
        call    w_strng
        call	op
	cmp 	al, 01d
	je	mensa1
	cmp 	al, 02d
	je	mensa2
	cmp 	al, 03d
	je	mensa3
        cmp 	al, 04d
	je	mensa4
        cmp 	al, 05d
	je	mensa5
        cmp 	al, 06d
	je	mensa6
        cmp 	al, 07d
	je	mensa7
        cmp 	al, 08d
	je	mensa8
        cmp 	al, 09d
	je	mensa9
        cmp 	al, 10d
	je	mensa10
	int 	20h

mensa1: mov 	dx, msg1
        jmp     mensa

mensa2: mov 	dx, msg2
        jmp     mensa

mensa3: mov 	dx, msg3
        jmp     mensa

mensa4: mov 	dx, msg4
        jmp     mensa

mensa5: mov 	dx, msg5
        jmp     mensa

mensa6: mov 	dx, msg6
        jmp     mensa

mensa7: mov 	dx, msg7
        jmp     mensa

mensa8: mov 	dx, msg8
        jmp     mensa

mensa9: mov 	dx, msg9
        jmp     mensa

mensa10: mov 	dx, msg10
        jmp     mensa

pru:	int 20h

op:	mov	ax, [300h]
	mov 	bl, [305h]
	div	bl
	mov 	[300h], al
	ret

mensa:  call 	w_strng
	call 	kb
	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb:	mov	ah, 1h
	int 	21h	
	ret

w_strng:mov	ah, 09h
	int 	21h
	ret        

section .data

msg10	db	"Perfecto solo Dios$"
msg9	db	"Siempre me esfuerzo$"
msg8	db	"Colocho$"
msg7	db	"Muy bien$"
msg6	db	"Peor es nada$"
msg5	db	"En el segundo$"
msg4	db	"Me recupero$"
msg3	db	"Hay salud$"
msg2	db	"Aun se pasa$"
msg1	db	"Solo necesito el 0$"
msg11	db	"Ingrese su numero de carnet y presione e para terminarlo: $"
nl	db 	0xA, 0xD, "$"