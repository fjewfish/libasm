global _ft_strdup
	extern __errno_locarion
	extern _ft_strlen
	extern _ft_strcpy
	extern _malloc
section .text
_ft_strdup:
	push rdi
	call _ft_strlen
	inc rax
	mov rdi, rax
	call _malloc
	pop rdi
	cmp rax, 0
	jz	.return_err
	mov rsi, rdi
	mov rdi, rax
	call _ft_strcpy
	ret

.return_err:
	mov rdi, 12
	_
