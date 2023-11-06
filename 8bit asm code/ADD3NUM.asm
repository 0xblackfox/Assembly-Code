INCLUDE "EMU8086.INC"

.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    
     MOV AH,1
     INT 21H
     MOV BH,AL
                
                PRINTN
                
         MOV AH,1
     INT 21H
     MOV BL,AL  
                      PRINTN
      MOV AH,1
     INT 21H
     MOV CL,AL
     
          ADD BL,BH
          SUB BL,48
          
    MOV CH,BL
    
    ADD CH,CL
    SUB CH,48  
                  PRINTN
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN