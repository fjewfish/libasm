; s1 = rdi, s2 = rsi
global _ft_strcmp
section .text
_ft_strcmp:
	push rdx;
	xor rdx, rdx
.lp:
	mov al, byte [rdi + rdx]
	mov bl, byte [rsi + rdx]
	cmp al, 0
	jz .quit
	cmp bl, 0
	jz .quit
	cmp al, bl
	jnz .quit
	inc rdx
	jmp .lp
.quit:
	pop rdx
	movzx	rax, al			; movzx = copy a register of inferior size in a bigger and fill the other bits with 0, and this register is rax
    movzx	rbx, bl			; same that previous but set it in rbx
    sub		rax, rbx		; stock the difference of rax and rbx in rax; Finaly : do the difference beetween the char at the rdi pointer and the char at the rsi pointer
	ret						; return (rax)

