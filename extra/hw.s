section .text
global hw

hw:
    mov rax, 1        ; write(
    mov rdi, 1        ;   STDOUT_FILENO,
    lea rsi, [rel msg];   "Holi mundo!\n",
    mov rdx, msglen   ;   sizeof("Holi mundo!\n")
    syscall           ; );

    ret

section .rodata
    msg: db "Holi mundo!", 10
    msglen: equ $ - msg