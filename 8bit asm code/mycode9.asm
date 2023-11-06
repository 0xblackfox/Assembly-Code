
INCLUDE 'EMU8086.INC' 




.MODEL SMALL 
.STACK 100H
.DATA


.CODE

MAIN PROC  
        
        
        
        INC BX
        DEC BX
        
        MOV CX,5
        MOV BX,0
        
        START: 
        
            CMP BX,CX
            JE START:
                PRINTN "ARMAN"
               INC BX
               JNE START
               
        LAST:
        
        PRINTN "THE PROGRAM END" 
        
      
        MOV AH,4CH
        INT 21H
       
        
       MAIN ENDP

END MAIN 