.text        
.global _start
_start:
    mov r0,#2
    mov r3,#7
    sub r3,r3,r0
    sub r6,r3,r2
    sub r1,r6,#1
    mov r6,#3
    sub r5,r6,#7


    mov r7, #1
    swi 0      
