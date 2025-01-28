section .text
    global ft_strdup
    extern malloc

ft_strdup:
    ; Solicitar 1 byte de memoria usando malloc
    mov rdi, 1          
    call malloc wrt ..plt 
    ret