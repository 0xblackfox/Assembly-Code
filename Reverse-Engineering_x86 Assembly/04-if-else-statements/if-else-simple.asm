; if-else-simple.asm
; prompts user to enter num, convert to number, tests it, and makes decision

format PE console
entry start

include 'win32a.inc'

; Maximum size of input string we are willing to take:
MAX_INPUT_SIZE = 16

; ------------------------------------------------

section '.data' data readable writeable
    enter_num      db 'Enter a number: ',0
    msg1           db 'You entered 5',0
    msg2           db 'Not 5',0
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
    push  enter_num
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

    ; Convert string to number:
    push    10                          ; base
    push    0                           ; endptr
    push    input_str                   ; nptr
    call    [strtoul]
    add     esp,4*3

    ;--- start if-else ---
    cmp     eax, 5
    jz      equal_5      ;--if eax == 5
    mov     esi, msg2    ;-- else
    jmp     output_result
equal_5:
    mov     esi, msg1
    ;------end if-else ---

output_result:
    ; Prints the result
    push    esi
    call    [printf]
    add     esp, 4

    push    0
    call    [ExitProcess]

; -------------------------------------------------

section '.idata' import data readable

library  kernel32, 'kernel32.dll',\
         msvcrt, 'msvcrt.dll'

import   kernel32,\
         ExitProcess, 'ExitProcess',\
         GetStdHandle,'GetStdHandle',\
         ReadFile,'ReadFile'

import   msvcrt,\
         printf,'printf',\
         strtoul,'strtoul'