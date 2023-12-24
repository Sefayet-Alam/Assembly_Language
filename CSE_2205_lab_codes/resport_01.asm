.MODEL SMALL
.STACK 100H
.DATA
    A DW 15
    B DW 4
    SUM DW ?
.CODE
MAIN PROC
;initialize DS
    MOV AX,@DATA
    MOV DS,AX
;add the numbers
    MOV AX,A
    SUB AX,B
    ;MOV SUM,AX
    AAA ;adjust after addition
    MOV BX,AX
    MOV DL,BH
    ADD DL,48
    MOV AH,2
    INT 21H 
    MOV DL,BL
    ADD DL,48
    MOV AH,2
    INT 21H
MAIN ENDP
END MAIN