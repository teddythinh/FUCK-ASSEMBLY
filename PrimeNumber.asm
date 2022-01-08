.MODEL SMALL

.stack 100H

.DATA                                                   ; Khu vuc tao bien

    VAL1    DB  ?                                       ; Tao bien Byte (chua 1 byte), VAL1 la 1 bien, "?" nghia la bien do chua duoc khoi tao.
    NL1     DB  0AH,0DH, 'XIN MOI NHAP SO: ','$'        ; in ra man hinh, $ nghia la dang o dia chi hien tai dua theo chuong trinh assembly.
    NL2     DB  0AH,0DH, 'KHONG PHAI SO NGUYEN TO','$'  ; in ra man hinh, $ nghia la dang o dia chi hien tai dua theo chuong trinh assembly.
    NL3     DB  0AH,0DH, 'LA SO NGUYEN TO','$'          ; in ra man hinh, $ nghia la dang o dia chi hien tai dua theo chuong trinh assembly.

    .CODE                                               ; Bat dau code.

MAIN:

    MOV AX,@DATA                                        ; DATA la khu vuc bien o tren, di chuyen DATA den AX.
    MOV DS,AX                                           ; di chuyen AX den DS, AX duoc goi la khu vuc khoi tao bien va tat ca bien trong khu vuc duoc su dung toi.

    LEA DX,NL1                                          ; di chuyen NL1 nhan data vao DX.
    MOV AH,09H                                          ; di chuyen chuoi the vao AH.
    INT 21H                                             ; nhap va xuat bi ngung de nhap vao, chung duoc tim thay o DOS Interrupt.

    MOV AH,01H                                          ; doc ki tu va di chuyen vao AH.
    INT 21H                                             ; nhap va xuat bi ngung de nhap vao, chung duoc tim thay o DOS Interrupt.
    SUB AL,30H                                          ; tru di 30H tu gia tri nhap vao.
    MOV VAL1,AL                                         ; luu ket qua vao nhan VAL1.

    MOV AH,00                                           ; xoa AH.

    MOV CL,2                                            ; CL su dung de tranh truong hop lap vo tan.
    DIV CL                                              ; chia ket qua cho CL va luu gia tri so thuong cua ket qua vao CL va so du vao CH.
    MOV CL,AL                                           ; move AL to CL.

LBL1:

    CMP CL,1                                            ; so sanh neu gia tri cua CL la 1.
    JBE LBL3                                            ; nhay neu CL = 1 hoac CL = 0.

    MOV AH,00                                           ; xoa AH.
    MOV AL,VAL1                                         ; di chuyen gia tri trong VAL1 den AL.
    DIV CL                                              ; chia vong lap.
    CMP AH,00                                           ; kiem tra neu AH la 0.
    JZ LBL2                                             ; (nhay neu bang 0) neu gia tri la CMP thi tra ve false, nhay den LBL2, khong thi tiep tuc.
    DEC CL                                              ; tru gia tri di cho 1.
    JMP LBL1             

LBL2:

    MOV AH,09H                                          ; di chuyen chuoi den AH.
    LEA DX,NL2                                          ; bang voi - MOV DX, offset NL2.
    INT 21H                                             ; nhap va xuat bi ngung de nhap vao, chung duoc tim thay o DOS Interrupt.
    JMP EXIT                                            ; nhay den nhan EXIT.

LBL3:

    MOV AH,09H                                          ; di chuyen chuoi den AH.
    LEA DX,NL3                                          ; bang voi - MOV DX, offset NL3.
    INT 21H                                             ; nhap va xuat bi ngung de nhap vao, chung duoc tim thay o DOS Interrupt.

EXIT:

    MOV AH,4CH                                          ; thoat khoi chuong trinh
    INT 21H                                             ; nhap va xuat bi ngung de nhap vao, chung duoc tim thay o DOS Interrupt.

    END MAIN                                            ; cau lenh ngung code trong khu vuc code