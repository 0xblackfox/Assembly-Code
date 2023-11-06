; loops-with-function.asm
; prompts user to enter num, print all the numbers from 0 upto that number

format PE console
entry start

include 'win32a.inc'

; Maximum size of input string we are willing to take:
MAX_INPUT_SIZE = 16

; ------------------------------------------------

section '.data' data readable writeable
    enter_num      db 'Enter a number: ',0
    output_msg     db '%d',0dh,0ah,0
    counter        dd  0
; ------------------------------------------------

section '.bss' readable writeable
    input_handle    dd  ?
    bytes_read      dd  ?
    max_number      dd  ?
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

    ; Keep the resulting number:
    mov     dword [max_number],eax

    ;----- loop start -----
    xor     ecx, ecx         ; set loop counter ecx = 0
    xor     edx, edx         ; set current num edx = 0
my_loop:
    inc     ecx
    cmp     ecx, dword [max_number] ; check if we have hit the max number
    ja      exit_prog               ; if max_number, we exit the loop
    inc     edx                     ; else we increment current num
    push    ecx                     ; save ecx register
    push    edx                     ; save edx register
    call    print_cur_num           ; then print the current number
    pop     edx
    pop     ecx
    jmp     my_loop
    ;----- loop end -----

print_cur_num:
    push    ebp
    mov     ebp, esp
    push    edx
    push    output_msg
    call    [printf]
    add     esp, 4*2
    pop     ebp
    ret

exit_prog:
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