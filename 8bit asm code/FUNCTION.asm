                INCLUDE "EMU8086.INC"
               .MODEL SMALL
               .STACK 100H
               .CODE
               MAIN PROC    
                
                 CALL FUNCTION
                 PRINTN "addiTIONAL"
                 MOV AH,4CH 
                 INT 21H     
                 MAIN ENDP  
               
               FUNCTION PROC
                PRINTN "HELLO"
                PRINTN "FUNCTION"
                RET
                FUNCTION ENDP