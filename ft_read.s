section .text
global ft_read
extern __errno_location	; includes ___error but for linux

ft_read:
    mov rax, 0      ; rax (acumulador/output/tipo de llamada) = 0
    syscall         ; Invocar syscall(0 read)

    cmp rax, 0      ; if rax(acumulador/output/read return value) < 0
    jge .piola      ; go to piola

    neg rax         ; rax = -rax
    mov rdi, rax    ; rdi = rax
    call __errno_location ; Establecer errno
    mov [rax], rdi  ; Establecer errno
    ret             ; return rax(acumulador/output/read return value)

.piola:
    ret             ; return rax(acumulador/output/read return value)