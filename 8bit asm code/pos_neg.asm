INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA


.CODE
  MAIN PROC
    MOV BX,10 
    
    CMP BX,0
    
    JL IF
    JGE ELSE
    
    IF:
    PRINTN "THE NUMBER IS NEGETIVE"
    JMP END_IF
    
    ELSE:
    PRINTN "THE NUMBER IS POSITIVE"
    JMP END_IF
    
    END_IF:
    
    
  MOV AH,4CH
  INT 21H  
  MAIN ENDP
  
END MAIN