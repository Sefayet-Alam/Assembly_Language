.MODEL SMALL
.STACK 100H
.DATA
    A DW 5
    B DW 7
    SUM DW ?
.CODE
MAIN PROC
;initialize DS
    MOV AX,@DATA
    MOV DS,AX
;add the numbers
    MOV AX,A
    SUB AX,B
    NEG AX
    MOV SUM,AX
    MOV DL,'-'
    MOV AH,2
    INT 21H
    MOV DX,SUM
    ADD DX,48
    MOV AH,2
    INT 21H
MAIN ENDP
END MAIN