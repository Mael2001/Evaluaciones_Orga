#set byte [0x10000000] = ["The sum of squares is: ", 0]
call main

; Exit program
mov eax, 10
int 0x80

main:
    ;int arr[] = {10, 43, 41, 5, 45, 50, 22, 86, 10, 20, 55, 52, 65}
    sub esp, 52
    mov dword[esp+0], 10
    mov dword[esp+4], 43
    mov dword[esp+8], 41
    mov dword[esp+12], 5
    mov dword[esp+16], 45
    mov dword[esp+20], 50
    mov dword[esp+24], 22
    mov dword[esp+28], 86
    mov dword[esp+32], 10
    mov dword[esp+36], 20
    mov dword[esp+40], 55
    mov dword[esp+44], 52
    mov dword[esp+48], 65
    push esp
    ;pushear el array

    ;int size = sizeof(arr)/sizeof(arr[0]);
    push 13

    ;int s = sum(arr, size)
    call sum
    ;balancear
    add esp,8

    ;set para imprimir
    mov edi, eax
    mov eax, 4

    ;imprimir
    #set ebx = 0x10000000
    int 0x80

    ;imprimir suma
    mov eax, 1
    mov ebx, edi
    int 0x80
    ;imprime salto de linea
    mov eax, 11
    mov ebx, 10
    int 0x80
    add esp, 52
    

    ;termina programa
    jmp salir
sum:
    mov edi, 0 ;int sum = 0
    mov edx, 0 ;int i=0

    for_sum:
        ;for (int i = 0; i < size; i++)
        cmp edx, dword[esp+4]
        jge end_for

        
        ;sacar arr[i]
        mov ebx, dword[esp+8]
        mov eax, dword[ebx + edx * 4]
        mov esi, eax

        ;mult arr[i]
        mul esi

        ;sum+=
        add edi, eax

        ;i+=1
        inc edx

        ;ciclo
        jmp for_sum
        
    ;termina for
    end_for:
        ;mueve la sum a eax
        mov eax, edi
        
        ret

salir: