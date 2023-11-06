.text        
.global _start
_start:

    mov r1,#1
    mov r2,#4
    mul r4,r2,r1
    mul r5,r2,r6
    mul r1,r2,r0
    mov r7, #1
    swi 0        
        
