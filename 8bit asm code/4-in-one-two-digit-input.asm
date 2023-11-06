.MODEL SMALL
.STACK 200
.DATA 
    RADIX DB 10     
    TEMP DB 10 DUP(?)
    CRLF    DB  0DH,0AH,'$'
    PROMPT1 DB  'Input the 1st 2digit number: ','$'
    PROMPT2 DB  'Input the 2nd 2digit number: ','$'
    PROMPT3 DB  'The sum of two numbers is: ','$' 
    PROMPT4 DB  'The difference of two numbers is: ','$'
    PROMPT5 DB  'The product of two numbers is: ','$'
    PROMPT6 DB  'The quotient of two numbers is: ','$'
    PROMPT7 DB  'The remainder of two numbers is: ','$'
    NUM1    DB  ?
    NUM2    DB  ? 
    NUM3    DB  ?
    SUM     DB  ?  
    DIFF    DB  ?
    PROD    DB  ?
    QUO     DB  ?
    REM     DB  ?    

.CODE
.STARTUP
    LEA DX,PROMPT1 
    MOV AH,09H      
    INT 21H 

    MOV AH, 01H   ; input 1
    INT 21H
    SUB AL, 30H
    MOV CH, AL 
    MOV AH, 01H
    INT 21H

    SUB AL, 30H
    MOV CL, AL 
    MOV AL, 10000B 
    MUL CH 
    XOR AH, AH
    OR AL, CL   
    MOV NUM1, AL
    MOV AL, 00H 

    LEA DX,CRLF
    MOV AH,09H
    INT 21H 

    LEA DX,PROMPT2
    MOV AH,09H
    INT 21H  

    MOV AH, 01H   ;input 2
    INT 21H
    SUB AL, 30H
    MOV CH, AL 
    MOV AH, 01H
    INT 21H

    SUB AL, 30H
    MOV CL, AL 
    MOV AL, 10000B 
    MUL CH 
    XOR AH, AH 
    OR AL, CL   
    MOV NUM2, AL

    ADD AL, NUM1 
    DAA
    ADD SUM, AL  

    LEA DX,CRLF
    MOV AH,09H
    INT 21H 

    LEA DX,PROMPT3  ; SUM output start
    MOV AH,09H
    INT 21H


    MOV AL, SUM   
    XOR AH, AH
    MOV BL, 10000B
    DIV BL
    AND AL, 0FH 
    ADD AL, 30H 

    LEA DL, AL  
    MOV AH, 02H
    INT 21H

    MOV AL, SUM
    XOR AH, AH   
    AND AL, 0FH
    ADD AL, 30H 

    LEA DL, AL
    MOV AH,02H   
    INT 21H  

    MOV AL,00H
    MOV AL,NUM1
    SUB AL,NUM2
    DAS
    MOV DIFF,AL 

    LEA DX,CRLF
    MOV AH,09H
    INT 21H       ; SUM end

    LEA DX,PROMPT4
    MOV AH,09H
    INT 21H

    MOV AL, DIFF 
    XOR AH, AH 
    MOV BL, 10000B
    DIV BL 
    AND AL, 0FH
    ADD AL, 30H

    LEA DL, AL  
    MOV AH, 02H
    INT 21H

    MOV AL, DIFF 
    XOR AH, AH  
    AND AL, 0FH
    ADD AL, 30H

    LEA DL, AL
    MOV AH,02H     
    INT 21H                

    LEA DX,CRLF
    MOV AH,09H
    INT 21H

    LEA DX,PROMPT5
    MOV AH,09H
    INT 21H

    MOV AL, 00H
    MOV DL, 00H
    MOV AL, NUM1
    MOV DL, NUM2
    MUL DL 

    MOV PROD, AL   

    MOV CX, 00H 
    XOR BH, BH 
    XOR SI, SI   

    DISPX1:
    MOV DX, 00 
    DIV BX 
    MOV TEMP[SI], DL 
    INC SI
    INC CX 
    OR AX, AX 
    JNZ DISPX1
    DEC SI

    MOV AL, PROD
    DISPX2:
    MOV DL, TEMP [SI]
    MOV AH, 06H 
    ADD DL, 30H 
    INT 21H
    DEC SI
    DEC CX 
    JNZ DISPX2        

    MOV AX,00H 
    MOV BX,00H
    MOV AL,NUM1
    MOV BH,NUM2
    DIV BH
    MOV QUO,AL 
    MOV REM,AH

    LEA DX,CRLF
    MOV AH,09H
    INT 21H

    LEA DX,PROMPT6
    MOV AH,09H
    INT 21H

    MOV AL, QUO
    XOR AH, AH 
    MOV BL, 10000B
    DIV BL 
    AND AL, 0FH
    ADD AL, 30H

    LEA DL, AL 
    MOV AH, 02H 
    INT 21H

    MOV AL, QUO 
    XOR AH, AH 
    AND AL, 0FH
    ADD AL, 30H

    LEA DL, AL
    MOV AH,02H  
    INT 21H   

    LEA DX,CRLF
    MOV AH,09H
    INT 21H

    LEA DX,PROMPT7
    MOV AH,09H
    INT 21H     

    MOV AL, REM 
    XOR AH, AH 
    MOV BL, 10000B
    DIV BL 
    AND AL, 0FH 
    ADD AL, 30H 

    LEA DL, AL  
    MOV AH, 02H 
    INT 21H

    MOV AL, REM 
    XOR AH, AH   
    AND AL, 0FH
    ADD AL, 30H

    LEA DL, AL
    MOV AH,02H   
    INT 21H               

.EXIT                 
END