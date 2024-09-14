	org 0000h
	ld b,01000100b	;numero binario en bcd
	ld a,b ;se inicializan variables
	ld h,0 ;reincia h
	ld l,a ; carga el valor bcd en l
	and 0xF0 ; aisla los 4 bits mas altos
	rrca ;rota a la derecha 4 bits
	rrca
	rrca
	rrca
	ld h,a
	ld a,l
	and 0x0F
	add a,h
	ld c,0
	ld d,0
calc_root:
	inc c
	ld d,c
	ld a,c
	ld e,c
	xor a
mult_loop:
	add a,e
	dec d
	jp nz,mult_loop

	cp b
	jr z,stop
	jr nc, round
	jp calc_root
round:
	dec c
stop:
	halt
end