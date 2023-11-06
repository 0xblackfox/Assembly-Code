.model small
.stack 100h
.data
         a db  " input 1 $"
         b db " input 2 $"
         c db "result $"
  .code 
  main proc
           
         mov   ax,@data
         mov ds,ax
         
         mov ah,9
         lea dx,a
         int 21h
         
         mov ah,1
         int 21h
         mov bh,al
         
         mov ah,9
         lea dx,b
         int 21h
         
         mov ah,1
         int 21h
         mov bl,al 
         
            mov ah,9
         lea dx,c
         int 21h 
         
         add  bh,bl
         sub bh,48
         
         mov ah,2
         mov dl,bh
         int 21h
         
         exit:
         mov ah,4ch
         int 21h
         main endp
  end main