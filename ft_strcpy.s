global ft_strcpy

section .text

ft_strcpy:
    push rdi           ; push rdi(destino/output)           / pile.push(dup(rdi))

.copy_loop:            ; copy_loop():
    mov al, [rsi]      ; al = byte en rsi (fuente/input)    / al = *src
    mov [rdi], al      ; byte en rdi (destino/"output") = al/ *dest = al
    inc rsi            ; rsi (fuente/input)++               / src++
    inc rdi            ; rdi (destino/output)++             / dest++
    cmp byte al, 0     ; if byte al is 0                    / if (al == 0)
    jnz .copy_loop     ; go to copy_loop                    / if (al != 0) goto copy_loop
    pop rax            ; pop rdi(destino/output) on rax     / rax = pile.pop() = rdi
    ret                ; return rax(acumulador/output)      / return