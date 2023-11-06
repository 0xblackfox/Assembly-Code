INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H   

.DATA
     N DB ?
     SUM DB 0
.CODE

MAIN PROC
        
        MOV AX,@DATA
        MOV DS,AX
        
        PRINTN "ENTER N"
        
        MOV AH,1
        INT 21H 
        SUB AL,48
        
        MOV N,AL
        
           MOV BL,1
           
           START:
           
           CMP BL,N
          JG EXIT_LOOP
          ADD SUM,BL
          INC BL
          JMP START
            
            EXIT_LOOP:  
           PRINTN "THE SUM IS "
              
          MOV AH,2
          MOV DL,SUM
          INT 21H 
          
 
           
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    END  MAIN      
          
         