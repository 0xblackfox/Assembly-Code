; hello.asm
; prints 'hello world'

format PE console
entry start

include 'win32a.inc'

; ------------------------------------------------
section '.data' data readable writeable
    hello db 'hello world',0dh,0ah,0

; ------------------------------------------------
section '.text' code readable executable

start:
    push  hello
    call  [printf]
    add   esp, 4

    push  0
    call  [ExitProcess]
; -------------------------------------------------
section '.idata' import data readable

library  kernel32, 'kernel32.dll',\
         msvcrt, 'msvcrt.dll'

import   kernel32,\
         ExitProcess, 'ExitProcess'

import   msvcrt,\
         printf,'printf'