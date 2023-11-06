; keygen-template
; by CrackingLessons.com

format PE console
entry start

include 'win32a.inc' 

; Maximum size of input string we are willing to take:
MAX_INPUT_SIZE = 4

; ===============================================
section '.data' data readable writeable
    enter_fname   db  'Please Enter a firstname: ',0
    serial_key    db  '%s-%d-%d-%d',0

; ===============================================
section '.bss' readable writeable
    input_handle    dd  ?
    bytes_read      dd  ?
    input_str       db  MAX_INPUT_SIZE+1 dup (?)
    ; Note: + 1 to leave room for the zero terminator.

    ; A structure to hold the system time.
    systime     SYSTEMTIME  ?
; ===============================================
section '.text' code readable executable

start:
    ; Obtain input handle:
    push    STD_INPUT_HANDLE 
    call    [GetStdHandle]
    mov     dword [input_handle],eax

    ; Print 'Enter a first name...' to the user:
    push    enter_fname
    call    [printf]
    add     esp,4

     ; Read a line from the console:
    push    0                           ; lpPverlapped
    push    bytes_read                  ; lpNumberOfBytesRead
    push    MAX_INPUT_SIZE              ; nNumberOfBytesToRead
    push    input_str                   ; lpBuffer
    push    dword [input_handle]        ; hFile
    call    [ReadFile]

    ; Get the system time into the systime structure:
    push    systime             ; lpSystemTime
    call    [GetLocalTime]

    ; --- Replace below code with yours ---
    movzx   eax, word[systime.wYear]
    movzx   ebx, word [systime.wMonth]
    movzx   ecx, word [systime.wDay]
    ; --- end Replace ---

    ; print out serial key
    push ecx
    push ebx
    push eax
    push input_str
    push serial_key
    call [printf]
    add esp, 4*5 ;4 bytes x 5 pushes - to clean the stack

    ; Exit program:
    push    0
    call    [ExitProcess]

; ===============================================
section '.idata' import data readable

library kernel32,'kernel32.dll',\
        msvcrt,'msvcrt.dll'
 
import  kernel32,\
        ExitProcess,'ExitProcess',\
        GetStdHandle,'GetStdHandle',\
        ReadFile,'ReadFile',\
        GetLocalTime,'GetLocalTime'

import  msvcrt,\
        printf,'printf'
