; Calculadora em assembly
; Permite ao usuário fazer cálculos básicos
; usando as operações de adição, subtração,
; multiplicação e divisão

.section .data

prompt db "Insira a primeira operação: ", 0
input1 db "", 0

prompt2 db "Insira a segunda operação: ", 0
input2 db "", 0

result db "Resultado: ", 0
output db "", 0

.section .bss

num1 resb 4
num2 resb 4
res resb 4

.section .text

.global _start

_start:

; imprime o primeiro prompt
movl $4, %eax        ; system call number (sys_write)
movl $1, %ebx        ; file handle (stdout)
movl $prompt, %ecx   ; pointer to message
movl $15, %edx       ; message length
int $0x80            ; call kernel

; lê a primeira operação
movl $3, %eax        ; system call number (sys_read)
movl $0, %ebx        ; file handle (stdin)
movl $input1, %ecx   ; pointer to buffer
movl $4, %edx        ; buffer length
int $0x80            ; call kernel

; converte a primeira operação para um número inteiro
movl $input1, %esi   ; pointer to string
movl $num1, %edi     ; pointer to result
call atoi            ; convert string to integer

; imprime o segundo prompt
movl $4, %eax        ; system call number (sys_write)
movl $1, %ebx        ; file handle (stdout)
movl $prompt2, %ecx  ; pointer to message
movl $16, %edx       ; message length
int $0x80            ; call kernel

; lê a segunda operação
movl $3, %eax        ; system call number (sys_read)
movl $0, %ebx        ; file handle (stdin)
movl $input2, %ecx   ; pointer to buffer
movl $4, %edx        ; buffer length
int $0x80            ; call kernel

; converte a segunda operação para um número inteiro
movl $input2, %esi   ; pointer to string
movl $num2, %edi     ; pointer to result
call atoi            ; convert string to integer

; faz a operação escolhida pelo usuário
movl $num1, %eax     ; first operand
movl $num2, %ebx     ; second operand
movl $input1, %ecx   ; pointer to operator

; verifica qual operação deve
