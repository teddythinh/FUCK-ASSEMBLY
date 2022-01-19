include mylib.mac
Code Segment
Assume cs: Code
Org 100h
Start:
@write ?Input n = ?
Call input
@endline
mov cx,ax
mov bx,1
lap: mov ax,bx
mul bx
inc bx
cmp ax,cx
jb lap
je cp
@write ?Not a square number?
jmp thoat
cp: @write ?The input is a square number?
out:
int 20h
include proc.asm
Code Ends
End Start
