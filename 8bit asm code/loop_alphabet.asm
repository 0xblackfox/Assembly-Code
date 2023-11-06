.model small
.stack 100h
.data 
 a db 'loop $'
 .code
  main proc
    mov ax,@data
    mov ds,ax
     
     mov ah,9
     lea dx,a
     int 21h
     
      mov cx,26
      mov ah,2
      mov dl,'A'
      
      Start:
      
       int 21h
       inc dl
       loop Start
       
       exit:
       mov ah,4ch
       int 21h
       main endp
        end main