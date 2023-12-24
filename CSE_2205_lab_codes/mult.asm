.MODEL SMALL
.STACK 100H
.DATA      
    A DB 3
    B DB 5
     
.CODE
MAIN PROC
;initialize DS
    MOV AX,@DATA
    MOV DS,AX
;multiplication
    MOV AL,A
    MOV AH,0
    MUL B 
    AAM
    MOV BX,AX
    MOV DL,AH
    ADD DL,48
    MOV AH,2
    INT 21H 
    MOV DL,BL
    ADD DL,48
    MOV AH,2
    INT 21H
MAIN ENDP
END MAIN