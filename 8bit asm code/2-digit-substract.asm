; 2-digit-substract
.model small
.stack 100h
.data
msg1 db 0dh,0ah,"enter the first number: $"
msg2 db 0dh,0ah,"enter the Second number: $" 
msg3 db 0dh,0ah,"Result: $"
num1 db ?
num2 db ?
result db ?
ends

.code
start: 
mov ax,data
mov ds,ax

lea dx,msg1
mov ah,09
int 21h 

mov ah,01
int 21h
sub al,30h
mov ch,al
mov ah,01
int 21h
sub al,30h
mov cl,al  

mov al,10000B 
mul ch
add al,cl
mov num1,al 

lea dx,msg2
mov ah,09
int 21h 

mov ah,01
int 21h
sub al,30h
mov ch,al
mov ah,01
int 21h
sub al,30h
mov cl,al 

mov al,10000B
mul ch
add al,cl
mov num2,al 

mov al,00H
mov al,num1
sub al,num2
das
mov result,al 


lea dx,msg3
mov ah,09
int 21h 

mov al,result    ; al = 80 / 10  == 08
mov bl,10000B
xor ah,ah
div bl 
and al,0fh     ; 08  + 30 == 38
add al,30h 


mov dl,al
mov ah,2
int 21h

mov al,result
mov bl,10000B
xor ah,ah
and al,0fh
add al,30h
          

mov dl,al
mov ah,2
int 21h
 
 
 

mov ah,4ch
int 21h

ends
end start