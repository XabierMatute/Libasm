section .text
	global	ft_strdup
	extern	malloc			; # include malloc
	extern	ft_strlen       ; # include ft_strlen
	extern	ft_strcpy       ; # include ft_strcpy

ft_strdup:					; char *ft_strdup(const char *src) rdi = src
    ; mov rsi, rdi          ; esto no vale hay que hacer push pop
	push	rdi				; pile.push(src)
	call	ft_strlen		; rax = ft_strlen(src)
	inc		rax				; rax++
	mov		rdi, rax		; rdi = rax 
	call	malloc	wrt ..plt; rax = malloc(rax) = malloc(strlen(src) + 1)
	cmp		rax, 0			; if rax == 0 
	je		.null			; return null
	pop		rsi				; rsi = pile.pop() = src
	mov		rdi, rax		; rdi = rax
	call	ft_strcpy		; rax = ft_strcpy(rdi, rsi)
	ret						; returns rax

.null:
	ret						; returns rax (0)