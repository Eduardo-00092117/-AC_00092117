org	100h

section .text
        
	call     texto
        call     cursor
        call     phrase

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

valida:	call    texto
        call    cursor
	call	op
	cmp 	al, 01h
	je	pru
	cmp 	al, 02h
	je	pru
	cmp 	al, 03h
	je	pru
	int 	20h

pru:	int 20h

op:	mov	ax, [300h]
	mov 	bl, [305h]
	div	bl
	mov 	[300h], al
	ret

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb:	mov	ah, 1h
	int 	21h	
	ret

w_strng:mov	ah, 13h
	mov 	al, 01h 
	mov 	bh, 00h ;
	mov	bl, 01000110b
	mov	cx, si
	mov	dl, 43d
	mov	dh, 17d	
	push 	cs 
	pop	es
	mov	bp, 300h
	int 	10h
	ret

cursor: mov	ah, 01h
        mov     ch, 00000000b
        mov     cl, 00001110b
        int     10h
        ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 01000000b
	mov 	cx, 1h
	int 	10h
	ret

m_cursr:mov     ah, 02h
        mov     dx, di
        mov     dh, 0d
        mov     bh, 0h
        int     10h
        ret

phrase:	mov	di, 0d
lupi2:  mov    	cl, [msg1+di]
        call   	m_cursr
        call   	w_char
        inc    	di
        cmp    	di, len1
        jb    	lupi2
        ret

phrase2:mov	di, 0d
lupi3:  mov    	cl, [msg2+di]
        call   	m_cursr
        call   	w_char
        inc    	di
        cmp    	di, len2
        jb    	lupi3
        

phrase3:mov	di, 0d
lupi4:  mov    	cl, [msg3+di]
        call   	m_cursr
        call   	w_char
        inc    	di
        cmp    	di, len3
        jb    	lupi4
        

phrase4:mov	di, 0d
lupi5:  mov    	cl, [msg4+di]
        call   	m_cursr
        call   	w_char
        inc    	di
        cmp    	di, len4
        jb    	lupi5
        

phrase5:mov	di, 0d
lupi6:  mov    	cl, [msg5+di]
        call   	m_cursr
        call   	w_char
        inc    	di
        cmp    	di, len5
        jb    	lupi6
	int 	20h
        

phrase6:mov	di, 0d
lupi7:  mov    	cl, [msg6+di]
        call   	m_cursr
        call   	w_char
        inc    	di
        cmp    	di, len6
        jb    	lupi7
        

phrase7:mov	di, 0d
lupi8:  mov    	cl, [msg7+di]
        call   	m_cursr
        call   	w_char
        inc    	di
        cmp    	di, len7
        jb    	lupi8
        

phrase8:mov	di, 0d
lupi9:  mov    	cl, [msg8+di]
        call   	m_cursr
        call   	w_char
        inc    	di
        cmp    	di, len8
        jb    	lupi9
        

phrase9:mov	di, 0d
lupi10: mov    	cl, [msg9+di]
        call   	m_cursr
        call   	w_char
        inc    	di
        cmp    	di, len9
        jb    	lupi10
	int 	20h
        

phrase10:mov	di, 0d
lupi11: mov    	cl, [msg10+di]
        call   	m_cursr
        call   	w_char
        inc    	di
        cmp    	di, len10
        jb    	lupi11

phrase11:mov	di, 0d
lupi12: mov    	cl, [msg11+di]
        call   	m_cursr
        call   	w_char
        inc    	di
        cmp    	di, len11
        jb    	lupi12
        

section .data

msg1	db	"Escriba una palabra de 5 caracteres"
len1    	equ    	$-msg1
msg2	db	"Perfecto solo Dios"
len2    	equ    	$-msg2
msg3	db	"Siempre me esfuerzo"
len3    	equ    	$-msg3
msg4	db	"Colocho"
len4    	equ    	$-msg4
msg5	db	"Muy bien"
len5    	equ    	$-msg5
msg6	db	"Peor es nada"
len6    	equ    	$-msg6
msg7	db	"En el segundo"
len7    	equ    	$-msg7
msg8	db	"Me recupero"
len8    	equ    	$-msg8
msg9	db	"Hay salud"
len9    	equ    	$-msg9
msg10	db	"Aun se pasa"
len10    	equ    	$-msg10
msg11	db	"Solo necesito el 0"
len11    	equ    	$-msg11