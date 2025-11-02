%include "asm_io.inc"

segment .data
ask_name       db "What is your name? ", 0
number_times   db "How many times do you want the welcome message? ", 0
too_large      db "too large", 0
too_small      db "too small", 0
welcome        db "welcome, ", 0

segment .bss
username resb 64
count    resd 1

segment .text
global asm_main

asm_main:
    mov eax, ask_name
    call print_string

    mov edi, username
.read_name_loop:
    call read_char
    cmp al, 10
    je .done_read_name
    mov [edi], al
    inc edi
    jmp .read_name_loop
.done_read_name:
    mov byte [edi], 0

.read_number:
    mov eax, number_times
    call print_string

    call read_int
    cmp eax, 50
    jl .read_number
    cmp eax, 100
    jg .read_number
    mov [count], eax

    mov ecx, [count]
Welcomeloop:
    mov eax, welcome
    call print_string
    mov eax, username
    call print_string
    call print_nl
    loop Welcomeloop

    mov eax, 0
    ret
