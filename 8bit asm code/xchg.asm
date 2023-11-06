.MODEL SMALL
.STACK 100H
.DATA


.CODE

MAIN PROC  
     
                  
      MOV BL,53
      MOV BH,55
      
      XCHG BH,BL
      
      MOV AH,2
      MOV DL,BH
      INT 21H     
      
      MOV AH,2 
      MOV DL,BL
      INT 21H  
      
      
      MOV AH,4CH
      INT 21H
       
      
       
        
       MAIN ENDP

END MAIN AIN 