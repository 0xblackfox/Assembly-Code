.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC

MOV AX,@DATA
MOV DS,AX


MOV AH,1
INT 21H    


MOV BL,AL


MOV AH,1
INT 21H  

MOV CL,AL


SUB BL,30H
SUB CL,30H

ADD CL,BL
ADD CL,30H

MOV DL,CL
MOV AH,2
INT 21H

MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN