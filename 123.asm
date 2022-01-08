.model small
.stack 100h
.data
checkCount db ?
tmp db ?
in db "Xin moi ban nhap: $"
.code
main proc
    mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,in
    int 21h
    while:
        
        mov ah,1
        int 21h
        mov checkCount,0
        
        cmp al,27
        je checkEnd
        divide:
            mov ah,0
            
            mov bl,10
            div bl
            
            mov bl,ah
            push bx
            inc checkCount
            
            cmp al,0
            jne divide
        
            printNumber:
            pop dx
            add dx,30h
            dec checkCount
            mov ah,2
            int 21h
            
            cmp checkCount,0
            jne printNumber
    jmp while
    checkEnd:
    mov ah,4ch
    int 21h
main endp
end main