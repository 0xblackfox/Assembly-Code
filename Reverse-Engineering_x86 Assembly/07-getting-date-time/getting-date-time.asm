; getting-date-time.asm
; how to get date and time using GetLocalTime, or, GetSystemTime

format PE console
entry start

include 'win32a.inc' 

; Maximum size of input string we are willing to take:
MAX_INPUT_SIZE = 4

; ===============================================
section '.data' data readable writeable
    date_str    db  '%d-%d-%d-%d:%d:%d',0

; ===============================================
section '.bss' readable writeable
    ; A structure to hold the system time.
    systime     SYSTEMTIME  ?
; ===============================================
section '.text' code readable executable

start:
    ; Get the system time into the systime structure:
    push    systime             ; lpSystemTime
    ;call    [GetLocalTime]
    call    [GetSystemTime]

    ; --- Get the date and time
    movzx   eax, word[systime.wYear]
    movzx   ebx, word [systime.wMonth]
    movzx   ecx, word [systime.wDay]
    movzx   edx, word[systime.wHour]
    movzx   esi, word [systime.wMinute]
    movzx   edi, word [systime.wSecond]


    ; print out the date and time
    push edi
    push esi
    push edx
    push ecx
    push ebx
    push eax
    push date_str
    call [printf]
    add esp, 4*7 ;4 bytes x 7 pushes - to clean the stack

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
        GetLocalTime,'GetLocalTime',\
        GetSystemTime,'GetSystemTime'

import  msvcrt,\
        printf,'printf'
