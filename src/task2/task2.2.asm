%include "asm_io.inc"

section .data
    array        times 100 dd 0
    startPoint   db "enter a starting number: ", 0
    endingPoint  db "enter a final number: ", 0
    invalidRange db "sorry, invalid range.", 0

section .text
global asm_main
asm_main:
    push    ebp
    mov     ebp, esp

    ; fill array 1–100
    mov     ecx, 100
    lea     edi, [array]
    mov     ebx, 1
fillLoop:
    mov     [edi], ebx
    add     edi, 4
    inc     ebx
    loop    fillLoop

    ; read start
    mov     eax, startPoint
    call    print_string
    call    read_int
    mov     ebx, eax        ; start

    ; read end
    mov     eax, endingPoint
    call    print_string
    call    read_int
    mov     edx, eax        ; end

    ; check invalid range
    cmp     ebx, 1
    jl      invalid
    cmp     edx, 100
    jg      invalid
    cmp     ebx, edx
    jg      invalid

    ; calculate sum
    lea     esi, [array]
    mov     eax, ebx
    dec     eax
    imul    eax, 4
    add     esi, eax

    mov     ecx, edx
    sub     ecx, ebx
    inc     ecx
    xor     eax, eax

sumLoop:
    add     eax, [esi]
    add     esi, 4
    loop    sumLoop

    call    print_int
    call    print_nl
    jmp     done

invalid:
    mov     eax, invalidRange
    call    print_string
    call    print_nl

done:
    xor     eax, eax
    mov     esp, ebp
    pop     ebp
    ret
