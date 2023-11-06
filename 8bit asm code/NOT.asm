                                                           .model small
.stack 100h
.code
main proc
    
    MOV BH,11110011B
    NOT BH
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN