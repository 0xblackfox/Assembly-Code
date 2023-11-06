.global _start

_start:
     mov   r0, #2  /* set up r0 */
     push  {r0}    /* save r0 onto the stack */
     mov   r0, #3  /* overwrite r0 */
     pop   {r0,r1}    /* restore r0 to it's initial state */
     bx    lr      /* finish the program */
