;1-digit-division
.model small
.stack 100h
.data
msg1 db 0ah,0dh,"Enter the first number: $" ; d = 013 a = 10  
msg2 db 0ah,0dh,"Enter the Second number: $"
msg3 db 0ah,0dh,"Quotient: $" 
msg4 db 0ah,0dh,"Reminder: $"
num1 db ?
num2 db ? 
quo db ?
rem db ?
result db ?
ends
.code
start:

mov ax,data
mov ds,ax

lea dx,msg1
mov ah,09
int 21h

mov ah,01   ; al = 5   input
int 21h 

sub al,30h
mov num1,al

lea dx,msg1
mov ah,09
int 21h

mov ah,01   ; input
int 21h 

sub al,30h  
mov num2,al  ; 3

mov ax,00h
mov bx,00h
mov al,num1
mov bl,num2

div bl  

add al,30h
add ah,30h
mov quo,al
mov rem,ah

xor ah,ah

lea dx,msg3
mov ah,09
int 21h 

mov dl,quo
mov ah,2
int 21h

lea dx,msg4
mov ah,09
int 21h 

mov dl,rem
mov ah,2
int 21h


mov ah,4ch 
int 21h



ends
end start