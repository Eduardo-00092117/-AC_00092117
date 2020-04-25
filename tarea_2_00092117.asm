	org	100h

; --------------------Ejercicio 1----------------------------------

	mov ax, 0d
	add ax, 9d
	add ax, 2d
	add ax, 1d
	add ax, 1d
	add ax, 7d
	mov bx, 5d
	div bx

	mov cl, "M"
	mov [200h], cl
	mov cl, "e"
	mov [201h], cl

	mov cl, "r"
        mov [203h], cl
	mov cl, "e"
        mov [204h], cl
	mov cl, "c"
        mov [205h], cl
	mov cl, "u"
        mov [206h], cl
	mov cl, "p"
        mov [207h], cl
	mov cl, "e"
        mov [208h], cl
	mov cl, "r"
        mov [209h], cl
	mov cl, "o"
        mov [20Ah], cl

; --------------------Ejercicio 2----------------------------------

	mov ax, 2d
	mov bx, 2d
	mov cx, 0d;
	mov SI, 0d
	
cs3:	mul bx
	mov [SI + 210h], ax
	inc cx
	inc SI

	cmp ax, 0100h
	jb cs3

	inc SI 

cs4:	mul bx
	mov [SI + 210h], ax
	inc cx
	inc SI
	inc SI

	cmp cx, 000Bh
	jb cs4

; --------------------Ejercicio 3----------------------------------

	mov ax, 0d
	mov bx, 1d
	mov dx, 0d
	mov [220h], ax
	mov [221h], bx
	mov SI, 0d
	mov cx, 0000h

	add ax, bx
	mov [222h], ax
	
cso:	mov dx, ax
	add ax, bx
	mov bx, dx 
	mov [SI + 223h], ax
	inc SI
	inc cx

	cmp ax, 0100h
	jb cso

cs2:	inc SI
	mov dx, ax
	add ax, bx
	mov bx, dx 
	mov [SI + 223h], ax
	inc SI
	inc cx

	cmp cx, 000Dh
	jb cs2

	int 20h