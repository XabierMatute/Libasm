global ft_putchar

section .text

ft_putchar:

    mov rsi, 42

    mov rax, 1        ; syscall number for sys_write
    mov rdi, 1        ; file descriptor 1 is stdout
    mov rdx, 1        ; number of bytes to write
    syscall           ; invoke syscall

    ret
