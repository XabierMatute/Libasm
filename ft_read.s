section .text
global ft_read

ft_read:
    mov rax, 0      ; rax (acumulador/output/tipo de llamada) = 0
    syscall         ; Invocar syscall(0 read)
    ret             ; return rax(acumulador/output/read return value)