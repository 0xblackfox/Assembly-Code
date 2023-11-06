.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC  
    
    MOV AH,1H ; input
    INT 21H 

    
    MOV BH,AL 
              


    MOV AH,2H   ; output 
    MOV DL,BH
    INT 21H
    
    MOV AH,4CH ; EXIT
    INT 21H  


    
    
    
    MAIN ENDP
END MAIN