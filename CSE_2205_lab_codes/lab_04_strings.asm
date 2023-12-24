.MODEL SMALL
.STACK 100H
.DATA      
    STR1 DB "Hello$"
    STR2 DB "World$"    
.CODE
MAIN PROC
;initialize DS
    MOV AX,@DATA
    MOV DS,AX
;print hello
    LEA DX,STR1
    MOV AH,9
    INT 21H
;print newline    
    MOV DX, 10
    MOV AH, 2
    INT 21H
    MOV DX, 13
    MOV AH, 2
    INT 21H
;print world
    LEA DX,STR2
    MOV AH,9
    INT 21H    
MAIN ENDP
END MAIN