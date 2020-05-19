    org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
	call 	phrase2
	call 	phrase3
	call 	phrase4
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
	ADD	dl, 17d ;Añadir el offset de la columna
	mov 	dh, 5d ; fila
	mov 	bh, 0h
	int 	10h
	ret

m_cursr2:mov 	ah, 02h
	mov 	dx, di  ; columna
	ADD	dl, 05d ;Añadir el offset de la columna
	mov 	dh, 10d ; fila
	mov 	bh, 0h
	int 	10h
	ret

m_cursr3:mov 	ah, 02h
	mov 	dx, di  ; columna
	ADD	dl, 29d ;Añadir el offset de la columna
	mov 	dh, 15d ; fila
	mov 	bh, 0h
	int 	10h
	ret

m_cursr4:mov 	ah, 02h
	mov 	dx, di  ; columna
	ADD	dl, 05d ;Añadir el offset de la columna
	mov 	dh, 18d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 0d
lupi:	mov 	cl, [msg+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
	ret

phrase2:	mov 	di, 0d
lupi2:	mov 	cl, [msg2+di]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lupi2
	ret

phrase3:	mov di, 0d
lupi3:	mov 	cl, [msg3+di]
	call    m_cursr3
	call 	w_char
	inc	di
	cmp 	di, len4
	jb	lupi3
	ret

phrase4:	mov di, 0d
lupi4:	mov 	cl, [msg4+di]
	call    m_cursr4
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lupi4
	ret


section .data
msg	db 	"Cada vez que pienso en ti,"
len 	equ	$-msg

msg2	db 	"mis ojos rompen en llanto"
len3 	equ	$-msg2

msg3	db 	"y muy triste me pregunto,"
len4 	equ	$-msg3

msg4	db 	"¿por que te quiero tanto?"
len2 	equ	$-msg4
