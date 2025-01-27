global ft_strcmp

section .text

ft_strcmp:
    mov rax, 0        ; rax(acumulador/output) = 0          / i = 0

.check_null:          ; check_null():
    cmp byte [rdi], 0 ; if not byte rdi(destino/input) is 0 / if !(*s == 0)
    jne .incrementate ; go to incrementate                  / incrementate()
    ret               ; return rax(acumulador/output)       / return i

.incrementate:        ; incrementate():
    inc rax           ; rax(acumulador)++                   / i++
    inc rdi           ; rdi(destino/input)++                / s++
    jmp .check_null   ; go to check_null                    / check_null()
