; add-2-nums.asm
; prompts user to enter 2 nums, adds them, then prints result

format PE console
entry start

include 'win32a.inc'

; Maximum size of input string we are willing to take:
MAX_INPUT_SIZE = 16

; ------------------------------------------------

section '.data' data readable writeable
    enter_num1      db 'Enter 1st number: ',0
    enter_num2      db 'Enter 2nd number: ',0
    output_msg      db 'Result: %d',0
    sum             dd  0
; ------------------------------------------------

section '.bss' readable writeable
    input_handle    dd  ?
    bytes_read      dd  ?
    number1         dd  ?
    number2         dd  ?
    input_str       db  MAX_INPUT_SIZE+1 dup (?)
    ; Note: + 1 to leave room for the zero terminator.

; ------------------------------------------------

section '.text' code readable executable

start:

    ; Obtain input handle:
    push    STD_INPUT_HANDLE 
    call    [GetStdHandle]
    mov     dword [input_handle],eax

    ; Prompts user to enter 1st number
    push  enter_num1
    call  [printf]
    add   esp, 4

    ; Read 1st num from the console:
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

    ; Keep the resulting number:
    mov     dword [number1],eax

    ; Prompts user to enter 1st number
    push  enter_num2
    call  [printf]
    add   esp, 4

    ; Read 2nd num from the console:
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

    ; Keep the resulting number:
    mov     dword [number2],eax

    ; Add the 2 numbers:
    xor     edx, edx
    add     edx, dword[number1]
    add     edx, dword[number2]
    mov     dword[sum], edx

    ; Prints the result
    push  dword [sum]
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
         printf,'printf',\
         strtoul,'strtoul'