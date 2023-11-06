
INCLUDE 'EMU8086.INC' 




.MODEL SMALL 
.STACK 100H
.DATA


.CODE

MAIN PROC  
        
        START:
        
      
         PRINTN "HELLO WORLD"   ;JUST PRINT  WITH NEW LINE
         PRINT "BYE WORLD"      ;JUST PRINT  WITHOUT NEW LINE
         PRINT "  THANK YOU"
       
        
       MAIN ENDP

END MAIN 