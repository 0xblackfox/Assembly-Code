;2-digit-division
.model small
.stack 100h
.data
msg1 db 0dh,0ah,"enter the first number: $"
msg2 db 0dh,0ah,"enter the Second number: $" 
msg3 db 0dh,0ah,"Result: $"
msg4 db 0dh,0ah,"Quotient: $"
msg5 db 0dh,0ah,"Reminder : $" 
num1 db ?
num2 db ?
result db ?
quo db ?
rem db ?
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

mov al,num1
mov bl,num2
div bl
mov quo,al
mov rem,ah
 


lea dx,msg4
mov ah,09
int 21h 

mov al,quo    ; al = 80 / 10  == 08
mov bl,10000B
xor ah,ah
div bl 
and al,0fh     ; 08  + 30 == 38
add al,30h 


mov dl,al
mov ah,2
int 21h

mov al,quo
mov bl,10000B
xor ah,ah
and al,0fh
add al,30h
          

mov dl,al
mov ah,2
int 21h 



lea dx,msg5
mov ah,09
int 21h 


mov al,rem    ; al = 80 / 10  == 08
mov bl,10000B
xor ah,ah
div bl 
and al,0fh     ; 08  + 30 == 38
add al,30h 


mov dl,al
mov ah,2
int 21h

mov al,rem
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