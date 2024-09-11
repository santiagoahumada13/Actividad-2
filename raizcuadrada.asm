	org 0000h
	ld b,0x4	;numero binario en bcd
	ld a,b ;se inicializan variables
	call bcd_bin

	ld d,a
	ld c,0x00

calc_raiz:
	ld e,c
	call mult

	cp d ; compara el resultado con el umero original en d
	jr z, done ;si el resultado coincide, la raiz esta en c
	jr nc, try ;isi el resultado es mayor, es la respuesta
try:
	inc c ;incrementa c para probar el siguiente numero
	jr calc_raiz ;repite ciclo
done:
	halt ;detiene del programa
mult:
	ld a,0x00 ;inicializa a para la suma
	ld b,e ;carga e en b como multiplicador
	ld l,e ; carga e en l como multiplicando
mult_loop:
	add a,l ;suma a con l
	djnz mult_loop ;decrementa b y repite si b no es igual a 0
	ret
;subrutina para convertir bcd a binario
bcd_bin:
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
	ret
end