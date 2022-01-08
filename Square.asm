include mylib.mac
Code Segment
Assume cs: Code
Org 100h
Start:
@write ?Nhap so n = ?
Call nhap_so
@xuongdong
mov cx,ax
mov bx,1
lap: mov ax,bx
mul bx
inc bx
cmp ax,cx
jb lap
je cp
@write ?Ko phai so chinh
phuong?
jmp thoat
cp: @write ?So da nhap la so
chinh phuong?
thoat:
int 20h
include proc.asm
Code Ends
End Start