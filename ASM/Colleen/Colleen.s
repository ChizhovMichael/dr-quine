global _main
global _get_str
extern _printf

section .data
program: db "global _main%2$cglobal _get_str%2$cextern _printf%2$c%2$csection .data%2$cprogram: db %3$c%1$s%3$c, 0%2$c%2$c%4$c Manual: https://habr.com/ru/post/128191/%2$c%2$csection .text%2$c_get_str:%2$c%5$clea rsi, [rel program]%2$c%5$cret%2$c%2$csection .text%2$c_main:%2$c%5$c%4$c One of the comments must be present in the main function%2$c%5$cpush rbp%2$c%5$clea rdi, [rel program]%2$c%5$ccall _get_str%2$c%5$cmov rdx, 10%2$c%5$cmov rcx, 34%2$c%5$cmov r8, 59%2$c%5$cmov r9, 9%2$c%2$c%5$cmov rax, 0%2$c%5$ccall _printf%2$c%2$c%5$cpop rbp%2$c%5$cmov rax, 0%2$c%5$cret", 0

; Manual: https://habr.com/ru/post/128191/

section .text
_get_str:
	lea rsi, [rel program]
	ret

section .text
_main:
	; One of the comments must be present in the main function
	push rbp
	lea rdi, [rel program]
	call _get_str
	mov rdx, 10
	mov rcx, 34
	mov r8, 59
	mov r9, 9

	mov rax, 0
	call _printf

	pop rbp
	mov rax, 0
	ret