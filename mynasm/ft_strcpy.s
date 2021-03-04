global _ft_strcpy
extern _ft_strlen
section .text
; dst = rdi, src = rsi
_ft_strcpy:
	push rdi
	mov rdi, rsi
	call _ft_strlen
	mov rcx, rax
	pop rdi
	mov rax, rdi
	rep movsb
	mov byte [rdi], 0	; rdi was increse by movsb, so we are at end of the copied string
	ret
