section .text
global ft_write

ft_write:
    mov rax, 1      ; rax(acumulador/output/tipo de llamada) = 1

    syscall         ; invoke syscall(1 write)

    ret             ; return rax(acumulador/output/write return value)