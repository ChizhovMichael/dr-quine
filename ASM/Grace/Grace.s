%macro program 1
global _main
extern _fopen
extern _fprintf
extern _fclose

section .data
program: db %1, 0
name: db "./Grace_kid.s", 0
permission: db 119, 0

section .text
_main:
	push rbp
	lea rdi, [rel name]
	lea rsi, [rel permission]
	call _fopen
	mov rbp, rax
	xor rdi, rdi
	xor rsi, rsi
	mov rdi, rax
	lea rsi, [rel program]
	lea rdx, [rel program]
	mov rcx, 10
	mov r8, 34
	mov r9, 9
	mov rax, 0
	call _fprintf
	xor rdi, rdi
	mov rdi, rbp
	call _fclose
	xor rbp, rbp
	pop rbp
	mov rax, 0
	ret
%endmacro
%define ARG1 "%%macro program 1%2$cglobal _main%2$cextern _fopen%2$cextern _fprintf%2$cextern _fclose%2$c%2$csection .data%2$cprogram: db %%1, 0%2$cname: db %3$c./Grace_kid.s%3$c, 0%2$cpermission: db 119, 0%2$c%2$csection .text%2$c_main:%2$c%4$cpush rbp%2$c%4$clea rdi, [rel name]%2$c%4$clea rsi, [rel permission]%2$c%4$ccall _fopen%2$c%4$cmov rbp, rax%2$c%4$cxor rdi, rdi%2$c%4$cxor rsi, rsi%2$c%4$cmov rdi, rax%2$c%4$clea rsi, [rel program]%2$c%4$clea rdx, [rel program]%2$c%4$cmov rcx, 10%2$c%4$cmov r8, 34%2$c%4$cmov r9, 9%2$c%4$cmov rax, 0%2$c%4$ccall _fprintf%2$c%4$cxor rdi, rdi%2$c%4$cmov rdi, rbp%2$c%4$ccall _fclose%2$c%4$cxor rbp, rbp%2$c%4$cpop rbp%2$c%4$cmov rax, 0%2$c%4$cret%2$c%%endmacro%2$c%%define ARG1 %3$c%1$s%3$c%2$c; This is comment%2$c%%define FX(x) program x%2$cFX(ARG1)"
; This is comment
%define FX(x) program x
FX(ARG1)