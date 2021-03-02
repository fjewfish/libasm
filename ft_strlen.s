global ft_strlen
; глобальная метка
;объявление метки для внешней программы
; не просто делает видимой а вставляет в обектный файл инфу видимую для компановщика
; extern метка просто существует
ft_strlen:
	mov rax, -1 ; Move -1 to rax (return value also the count)
loop:
	inc rax
	cmp byte[rdi + rax], 0
	; спецификатор размера
	; bete	word	dword	1,2,4_байта
	; рахименововаем один один БАЙТ памяти
	jne loop
	; jump not ecual
	ret

; !!! обращаться к типу память только один разз за строку
