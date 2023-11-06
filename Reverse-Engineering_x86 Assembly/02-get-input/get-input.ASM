; get-input.asm
; prompts user to enter name, then prints Hello name

format PE console
entry start

include 'win32a.inc'

; Maximum size of input string we are willing to take:
MAX_INPUT_SIZE = 16

; ------------------------------------------------

section '.data' data readable writeable
    enter_name     db 'Enter your name: ',0
    output_msg     db 'Hello %s',0

; ------------------------------------------------

section '.bss' readable writeable
    input_handle    dd  ?
    bytes_read      dd  ?
    input_str       db  MAX_INPUT_SIZE+1 dup (?)
    ; Note: + 1 to leave room for the zero terminator.

; ------------------------------------------------

section '.text' code readable executable

start:
    ; Prompts user to enter name
    push  enter_name
    call  [printf]
    add   esp, 4

    ; Obtain input handle:
    push    STD_INPUT_HANDLE 
    call    [GetStdHandle]
    mov     dword [input_handle],eax

    ; Read a line from the console:
    push    0                           ; lpPverlapped
    push    bytes_read                  ; lpNumberOfBytesRead
    push    MAX_INPUT_SIZE              ; nNumberOfBytesToRead
    push    input_str                   ; lpBuffer
    push    dword [input_handle]        ; hFile
    call    [ReadFile]

    ; Prints the message
    push  input_str
    push  output_msg
    call  [printf]
    add   esp, 4*2

    push  0
    call  [ExitProcess]

; -------------------------------------------------

section '.idata' import data readable

library  kernel32, 'kernel32.dll',\
         msvcrt, 'msvcrt.dll'

import   kernel32,\
         ExitProcess, 'ExitProcess',\
         GetStdHandle,'GetStdHandle',\
         ReadFile,'ReadFile'

import   msvcrt,\
         printf,'printf'