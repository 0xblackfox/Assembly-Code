.MODEL SMALL
.STACK 100H
.DATA 
  NUM DB 48
  CHAR DB 'A'
  MSG DB "MY NAME IS X86$"  
  
  A DB ?
  B DB ?
 
  
.CODE
MAIN PROC ; int main 
        ;segment                                                          
       ;MOV AH,4CH
        ;INT 21H   
         
        MOV AX, @DATA
        MOV DS,AX
        MOV AH,2   ;DATA DISPLAY      MOV AH,1  INPUT
        
          
        MOV DL,NUM
        INT 21H        ;EXECUTION
        
                  
        MOV AH,2
        MOV DL,10
        INT 21h
        MOV DL,13
        INT 21h
                  
                  
     
        
        MOV AH,2
        MOV DL,CHAR
        INT 21H
        
        
        
                 
        MOV AH,2
        MOV DL,10
        INT 21h
        MOV DL,13
        INT 21h
                
        
        
          
        
        MOV AH,9     ;STRING DISPLAY
        LEA DX,MSG
        INT 21H    
        
      
                     
                     
       
        
       
      
       
        
       MAIN ENDP

END MAIN ;exit<0>