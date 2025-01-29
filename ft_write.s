section .text
global ft_write
extern __errno_location	; includes ___error but for linux

ft_write:
    mov rax, 1      ; rax(acumulador/output/tipo de llamada) = 1

    syscall         ; Invocar syscall(1 write)

    cmp rax, 0      ; if rax(acumulador/output/write return value) < 0
    jge .piola      ; go to piola

    neg rax         ; rax = -rax
    mov rdi, rax    ; rdi = rax
    call __errno_location ; Establecer errno
    mov [rax], rdi  ; Establecer errno
    ret             ; return rax(acumulador/output/write return value)

.piola:
    ret             ; return rax(acumulador/output/write return value)