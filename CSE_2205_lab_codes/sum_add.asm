.MODEL SMALL
.STACK 100H
.DATA
    A DW 5
    B DW 3
    ANS DW ?
    SUM DW ? 
.CODE
MAIN PROC
;initialize DS
    MOV AX,@DATA
    MOV DS,AX
;Substract B from A
    MOV AX,A
    SUB AX,B
    MOV ANS,AX
    MOV DX,AX
    ADD DX,48
    MOV AH,2
    INT 21H
    MOV AX,A
    ADD AX,B
    MOV SUM,AX
    MOV DX,SUM
    ADD DX,48
    MOV AH,2
    INT 21H
MAIN ENDP
END MAIN