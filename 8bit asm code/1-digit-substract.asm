.model small
.stack 100h


.data 
num1 DB ?
num2 DB ?
result DB ?
msg1 DB 10,13,"Enter first number to add : $"
msg2 DB 10,13,"Enter second number to add : $"
msg3 DB 10,13,"Result of the addition : $"
ends

.code

start:
mov ax,data
mov ds,ax

lea dx,msg1
mov ah,9
int 21h

mov ah,1
int 21h

sub al,30h
mov num1,al


lea dx,msg2
mov ah,9
int 21h

mov ah,1
int 21h

sub al,30h
mov num2,al 
            

lea dx,msg3
mov ah,9
int 21h 

mov bh,num1
mov bl,num2
sub bh,bl
add bh,30h


mov dl,bh

mov ah,2
int 21h


mov ah,4ch
int 21h

ends
end start