.text        
.global _start
_start:
   mov r1,#2
   mov r3,#8
   add r2,r1,r3
   add r1,r5,#1
   add r5,r5,r2
   adds r5,r5,#7 
    
    mov r7, #1
    swi 0      
