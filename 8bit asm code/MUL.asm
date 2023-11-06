                INCLUDE "EMU8086.INC"
               .MODEL SMALL
               .STACK 100H
               .CODE
               MAIN PROC    
                
                 CALL MULTI

                 MOV AH,4CH 
                 INT 21H     
                 MAIN ENDP  
                                   
                          
             MULTI PROC 
                
                PRINTN "FIRST NUMBER" 
               
                MOV AH,1
                INT 21H 
                MOV BL,AL
                SUB BL,48     
                
                PRINTN  
                PRINTN "SECOND NUMBER" 
            
                MOV AH,1
                INT 21H 
                MOV CL,AL
                SUB CL,48   
                PRINTN
               
                 MOV DL,0
                 FOR:
                 CMP CL,0
                 JE END
                 SHR CL,1
                 JNC CHECK
                 ADD DL,BL
                 
                 
                 CHECK:
                 SHL BL,1
                 JMP FOR: 
                 
                 END: 
                 MOV AH,2
                 INT 21H 
                 
                 MOV AH,2
                 MOV DL,07
                 INT 21H
                 
                 MULTI ENDP 
             
                    END MAIN
             