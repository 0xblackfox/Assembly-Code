INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H   

.CODE

MAIN PROC
         
         MOV BH,1111B
         AND BH,0101B
         
         ADD BH,48
         
         MOV AH,2
         MOV DL,BH
         INT 21H
         
         
       
 
           
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    END  MAIN      
          
         