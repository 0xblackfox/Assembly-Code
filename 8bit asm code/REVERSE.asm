
INCLUDE "EMU8086.INC"
  .model small
.stack 100h
.code
main proc 
    
        print "ArmanUr Rashid"
        mov ah,1
        xor cx,cx
        
        input:
        int 21h
        cmp al,0dh
        je exit
        push ax
        inc cx
        jmp input
        
       exit:
       printn
       print "output"
       mov ah,2
    
output:
pop dx
int 21h
loop output

    mov ah,4ch
    int 21h
    main endp
end main