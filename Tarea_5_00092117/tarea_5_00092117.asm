org 	100h

section .text

	call 	grafico	

	xor 	si, si
	xor 	di, di

	;VERTICALES
	mov 	si, 100d 
	mov 	di, 50d 
	mov		bl, 150d
	call 	linea_v
	mov	si, 120d 
	mov 	di, 110d 
	mov	bl, 130d
	call 	linea_v
	mov	si, 150d 
	mov 	di, 90d
	mov	bl, 110d
	call 	linea_v
	mov	si, 120d 
	mov 	di, 70d 
	mov	bl, 90d
	call 	linea_v
	mov	si, 170d 
	mov 	di, 50d 
	mov	bl, 70d
	call 	linea_v
	mov	si, 170d 
	mov 	di, 130d 
	mov	bl, 150d
	call 	linea_v

	;HORIZONTALES
	mov	si, 120d 
	mov 	di, 130d 
	mov	bl, 170d
	call 	linea_h
	mov	si, 120d 
	mov 	di, 110d 
	mov	bl, 150d
	call 	linea_h
	mov	si, 120d 
	mov 	di, 90d 
	mov	bl, 150d
	call 	linea_h
	mov	si, 120d 
	mov 	di, 70d 
	mov	bl, 170d
	call 	linea_h
	mov	si, 100d 
	mov 	di, 50d 
	mov	bl, 170d
	call 	linea_h
	mov	si, 100d 
	mov 	di, 150d 
	mov	bl, 170d
	call 	linea_h
	call 	kb		

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1111b
	int 	10h
	ret
kb: 	mov	ah, 00h
	int 	16h
	ret
linea_v: 
lupi_v:	mov 	cx, si 
	mov	dx, 0d 
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, bx
	jne 	lupi_v
	ret
linea_h:
lupi_h:	mov 	cx, 0d 
	add 	cx, si
	mov	dx, di 
	call 	pixel
	inc 	si
	cmp 	si, bx
	jne 	lupi_h
	ret
