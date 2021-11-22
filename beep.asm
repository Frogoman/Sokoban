; ---------------------------------------------
; ZX Spectrum Sound Example
; Square wave creation with changing cycle time
; Daniel León - AOC - UFV 2021
; ---------------------------------------------

	DEVICE ZXSPECTRUM48
	SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION

	org $8000		; Programa Ubicado en $8000
	di 				; Deshabilitar interrupciones
	ld sp,0 		; Puntero de pila en la parte alta de la memoria

inicio:          
	ld d, 16  		; 16 es el valor para poner el altavoz a 1 (bit 5 --> 0010000)
	ld e,0 			; 0 pone el altavoz a 0. Los dos tienen el "efecto secundario" de poner el borde en negro
	ld h, 0         ; h va cambiando de valor para decidir el tiempo de ciclo

bucleExt:           ; se va variando el tiempo de ciclo cargándolo en b
	dec h   		; se disminuye en una iteración el tiempo de medio ciclo
	ld b,h
bucleInt:           
	ld a,d 			; Conectar el altavoz
	out ($FE),a
paus: djnz paus     ; Esperar el tiempo marcado por h (medio ciclo en valor 1)
	ld a,e          ; Desconectar el altavoz
	out ($FE),a
	ld b,h
paus2: djnz paus2   ; Esperar el tiempo marcado por h (medio ciclo en valor 0)
	jr bucleExt     ; Ciclar infinitamente