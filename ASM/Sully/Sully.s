global _main
extern _strchr
extern _strcmp
extern _sprintf
extern _fopen
extern _fprintf
extern _fclose
extern _execv

section .bss
name resb 100
file resb 100
exec resb 100

section .data
Sully.s: db "Sully.s", 0
File: db __FILE__, 0
Sully_d: db "Sully_%d", 0
Sully_d.s: db "Sully_%d.s", 0
Exec: db "nasm -f macho64 %s.s && gcc %s.o -o %s && ./%s && rm -f *.o", 0
permission: db 119, 0
program: db "global _main%4$cextern _strchr%4$cextern _strcmp%4$cextern _sprintf%4$cextern _fopen%4$cextern _fprintf%4$cextern _fclose%4$cextern _execv%4$c%4$csection .bss%4$cname resb 100%4$cfile resb 100%4$cexec resb 100%4$c%4$csection .data%4$cSully.s: db %3$cSully.s%3$c, 0%4$cFile: db __FILE__, 0%4$cSully_d: db %3$cSully_%%d%3$c, 0%4$cSully_d.s: db %3$cSully_%%d.s%3$c, 0%4$cExec: db %3$cnasm -f macho64 %%s.s && gcc %%s.o -o %%s && ./%%s && rm -f *.o%3$c, 0%4$cpermission: db 119, 0%4$cprogram: db %3$c%1$s%3$c, 0%4$cpath: db %3$c/bin/sh%3$c, 0%4$carg1: db %3$csh%3$c, 0%4$carg2: db %3$c-c%3$c, 0%4$ccmd: dq arg1, arg2, exec, 0%4$c%4$csegment .text%4$c_main:%4$cpush rcx%4$cxor rax, rax%4$cxor rbx, rbx%4$cxor rcx, rcx%4$cmov rcx, %2$c%4$ccall sully_cmp%4$ccmp rcx, 0%4$cjl .exit%4$ccall sprintf_name%4$ccall sprintf_file%4$ccall sprintf_exec%4$ccall sully_file%4$ccall sully_exec%4$c.exit:%4$cpop rcx%4$cmov rax, 0%4$cret%4$c%4$csully_cmp:%4$cpush rcx%4$cxor rdi, rdi%4$clea rdi, [rel File]%4$cmov rsi, 0%4$ccall _strchr%4$cxor rdi, rdi%4$cxor rsi, rsi%4$clea rdi, [rax - 7]%4$clea rsi, [rel Sully.s]%4$ccall _strcmp%4$ccmp rax, 0%4$cjne .prev%4$cpop rcx%4$cret%4$c.prev:%4$cpop rcx%4$cdec rcx%4$cret%4$c%4$csprintf_name:%4$cxor rax, rax%4$cmov rax, rcx%4$cpush rcx%4$cxor rdi, rdi%4$cxor rsi, rsi%4$clea rdi, [rel name]%4$clea rsi, [rel Sully_d]%4$cmov rdx, rax%4$ccall _sprintf%4$cxor rcx, rcx%4$cmov rax, 0%4$cpop rcx%4$cret%4$c%4$csprintf_file:%4$cxor rax, rax%4$cmov rax, rcx%4$cpush rcx%4$cxor rdi, rdi%4$cxor rsi, rsi%4$clea rdi, [rel file]%4$clea rsi, [rel Sully_d.s]%4$cmov rdx, rax%4$ccall _sprintf%4$cxor rcx, rcx%4$cmov rax, 0%4$cpop rcx%4$cret%4$c%4$csprintf_exec:%4$cpush rcx%4$cxor rdi, rdi%4$cxor rsi, rsi%4$clea rdi, [rel exec]%4$clea rsi, [rel Exec]%4$clea rdx, [rel name]%4$clea rcx, [rel name]%4$clea r8, [rel name]%4$clea r9, [rel name]%4$ccall _sprintf%4$cxor rcx, rcx%4$cmov rax, 0%4$cpop rcx%4$cret%4$c%4$csully_file:%4$cxor rbx, rbx%4$cmov rbx, rcx%4$cpush rcx%4$cxor rdi, rdi%4$cxor rsi, rsi%4$clea rdi, [rel file]%4$clea rsi, [rel permission]%4$ccall _fopen%4$cjc .error%4$cxor rbp, rbp%4$cmov rbp, rax%4$cxor rdi, rdi%4$cxor rsi, rsi%4$cmov rdi, rax%4$clea rsi, [rel program]%4$clea rdx, [rel program]%4$cmov rcx, rbx%4$cadd rcx, %3$c0%3$c%4$cmov r8, 34%4$cmov r9, 10%4$cmov rax, 0%4$ccall _fprintf%4$cxor rdi, rdi%4$cmov rdi, rbp%4$ccall _fclose%4$cxor rcx, rcx%4$cmov rax, 0%4$cpop rcx%4$cret%4$c.error:%4$cret%4$c%4$csully_exec:%4$cpush rcx%4$cxor rdi, rdi%4$cxor rsi, rsi%4$clea rdi, [rel path]%4$clea rsi, [rel cmd]%4$cmov rax, 0%4$ccall _execv%4$cxor rcx, rcx%4$cmov rax, 0%4$cpop rcx%4$cret", 0
path: db "/bin/sh", 0
arg1: db "sh", 0
arg2: db "-c", 0
cmd: dq arg1, arg2, exec, 0

segment .text
_main:
push rcx
xor rax, rax
xor rbx, rbx
xor rcx, rcx
mov rcx, 5
call sully_cmp
cmp rcx, 0
jl .exit
call sprintf_name
call sprintf_file
call sprintf_exec
call sully_file
call sully_exec
.exit:
pop rcx
mov rax, 0
ret

sully_cmp:
push rcx
xor rdi, rdi
lea rdi, [rel File]
mov rsi, 0
call _strchr
xor rdi, rdi
xor rsi, rsi
lea rdi, [rax - 7]
lea rsi, [rel Sully.s]
call _strcmp
cmp rax, 0
jne .prev
pop rcx
ret
.prev:
pop rcx
dec rcx
ret

sprintf_name:
xor rax, rax
mov rax, rcx
push rcx
xor rdi, rdi
xor rsi, rsi
lea rdi, [rel name]
lea rsi, [rel Sully_d]
mov rdx, rax
call _sprintf
xor rcx, rcx
mov rax, 0
pop rcx
ret

sprintf_file:
xor rax, rax
mov rax, rcx
push rcx
xor rdi, rdi
xor rsi, rsi
lea rdi, [rel file]
lea rsi, [rel Sully_d.s]
mov rdx, rax
call _sprintf
xor rcx, rcx
mov rax, 0
pop rcx
ret

sprintf_exec:
push rcx
xor rdi, rdi
xor rsi, rsi
lea rdi, [rel exec]
lea rsi, [rel Exec]
lea rdx, [rel name]
lea rcx, [rel name]
lea r8, [rel name]
lea r9, [rel name]
call _sprintf
xor rcx, rcx
mov rax, 0
pop rcx
ret

sully_file:
xor rbx, rbx
mov rbx, rcx
push rcx
xor rdi, rdi
xor rsi, rsi
lea rdi, [rel file]
lea rsi, [rel permission]
call _fopen
jc .error
xor rbp, rbp
mov rbp, rax
xor rdi, rdi
xor rsi, rsi
mov rdi, rax
lea rsi, [rel program]
lea rdx, [rel program]
mov rcx, rbx
add rcx, "0"
mov r8, 34
mov r9, 10
mov rax, 0
call _fprintf
xor rdi, rdi
mov rdi, rbp
call _fclose
xor rcx, rcx
mov rax, 0
pop rcx
ret
.error:
ret

sully_exec:
push rcx
xor rdi, rdi
xor rsi, rsi
lea rdi, [rel path]
lea rsi, [rel cmd]
mov rax, 0
call _execv
xor rcx, rcx
mov rax, 0
pop rcx
ret