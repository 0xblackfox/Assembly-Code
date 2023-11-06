.model small
.stack 100h
.data

msg1 db 10,13,"Enter 1st number $"
 
result db 10,13,"result $" 
ends 
.code
start:
 mov ax,data  
 mov ds,ax     
 
 lea dx,msg1 
 mov ah,9
 int 21h
 
 mov ah,1   ; 2
 int 21h
 
 mov ch,al ;  1
 
 int 21h
 
 mov cl,al   ; 2
  
    
    lea dx,result
    mov ah,9
    int 21h
    
    mov ah,2 
    mov dl,cl  ;2
    int 21h
      
    mov ah,2
    mov dl,ch ; 1
    int 21h
    
     
 
ends
end start