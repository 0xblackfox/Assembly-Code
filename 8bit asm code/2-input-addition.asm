;2-digit-addition
.model small
.stack 100h
.data

m1 db 10,13, "Enter the first number : $"
m2 db 10,13, "Enter the second number : $"
result db 10,13, "Result : $"

.code
start:
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,m1
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    sub bh,30h
    
    mov ah,1
    int 21h
    mov bl,al
    sub bl,30h
    
    mov ah,9
    lea dx,m2
    int 21h
    
    mov ah,1
    int 21h
    mov ch,al
    sub ch,30h
    
    mov ah,1
    int 21h
    mov cl,al
    sub cl,30h
    
    add bl,cl
    mov al,bl
    mov ah,00h
    aaa 
    
    mov cl,al
    mov bl,ah
    add bl,bh
    add bl,ch
    
    mov al,bl
    mov ah,00h
    aaa
    
    mov bx,ax
    
   
    mov ah,09
     lea dx,result
    int 21h
    
    mov ah,2
   
    
    mov dl,bh
    add dl,30h
    int 21h 
     mov dl,bl
    add dl,30h
    int 21h
    
    mov dl,cl
    add dl,30h
    int 21h
    
    mov ah,4ch
    int 21h
ends
end start