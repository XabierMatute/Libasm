global ft_strcmp

section .text

ft_strcmp:
    mov rax, 0        ; rax(acumulador/output) = 0          / i = 0

.check_diff:          ; check_diff():
    mov al, [rdi]     ; al = byte en rdi (fuente/input)    / al = *s
    mov bl, [rsi]     ; bl = byte en rsi (fuente/input)    / bl = *s
    cmp al, bl        ; if byte al == bl                   / if (al == bl)
    je .check_null    ; go to check_null                   / check_null()
    jmp .ret_diff     ; go to ret_diff                     / ret_diff()

.check_null:          ; check_null():
    cmp byte [rdi], 0 ; if not byte rdi(destino/input) is 0 / if !(*s == 0)
    jne .incrementate ; go to incrementate                  / incrementate()
    ret               ; return rax(acumulador/output)       / return i (0)

.incrementate:        ; incrementate():
    inc rdi           ; rdi(destino/input)++                / s++
    inc rsi           ; rsi(source/input)++                / s++
    jmp .check_diff   ; go to check_null                    / check_null()

.ret_diff:
    sub al, bl         ; al = al - bl                       / al -= bl
    movsx rax, al      ; rax = al                           / i = al
    ret                ; return rax(acumulador/output)      / return i