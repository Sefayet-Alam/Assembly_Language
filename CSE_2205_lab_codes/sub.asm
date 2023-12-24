.MODEL SMALL
.STACK 100H
.DATA
    A DW 5
    B DW 3
    SUB DW ?
.CODE
MAIN PROC
;initialize DS
    MOV AX,@DATA
    MOV DS,AX
;add the numbers
    MOV AX,A
    ADD AX,B
    MOV SUM,AX
    MOV DX,AX
    ADD DX,48
    MOV AH,2
    INT 21H
MAIN ENDP
END MAIN