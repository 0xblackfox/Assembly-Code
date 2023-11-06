.model small
.stack 100h
.code
main proc
    mov bh,1111b
    AND bh,0100b
    ADD bh,48
    mov ah,2
    mov dl,bh
    int 21h
    mov ah,4ch
    int 21h
    main endp
end main