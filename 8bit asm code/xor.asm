.model small
.stack 100h
.code
main proc
    mov bh,0101b
    xor bh,0010b
    ADD bh,48
    mov ah,2
    mov dl,bh
    int 21h
    mov ah,4ch
    int 21h
    main endp
end main