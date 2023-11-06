INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
   MOV BX,50
    
    CMP BX,100
    JGE IF1
    
    CMP BX,80
    JGE IF2
    
    CMP BX,60
    JGE IF3
           
    CMP BX,40
    JGE IF4
    
    JMP ELSE
    
    IF1:
    PRINTN "NUMBER IS GREATER THAN 100"      
    JMP EXIT
    
    IF2:
    PRINTN "NUMBER IS GREATER THAN 80"
    JMP EXIT
    
    IF3:
    PRINTN "NUMBER IS GREATER THAN 60"
    JMP EXIT
    
    IF4:
    PRINTN "NUMBER IS GREATER THAN 40"
    JMP EXIT
    
    ELSE:
    PRINTN "NUMBER IS LESS THAN 40"
           
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    END  MAIN      
    