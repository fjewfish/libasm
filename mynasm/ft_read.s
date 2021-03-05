global _ft_read
	extern  ___error
section .text
_ft_read:                                  ; rdi = file descriptor, rsi = string, rdx = byte count
            mov         rax, 0x2000003      ; BSD / MacOS calling convention unlike Linux
            syscall
            jc          .return_err               ; error sets carry flag, rax = errno
            ret
.return_err:
            mov         r15, rax            ; save errno
            call        ___error            ; retrieve address to errno
            mov         [rax], r15          ; put errno in return value of __error (pointer to errno)
            mov         rax, -1
            ret
