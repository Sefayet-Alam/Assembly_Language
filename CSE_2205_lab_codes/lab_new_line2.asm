.MODEL SMALL
.STACK 100H
.DATA      
    STR1 DB "Hello",0AH,0DH,"World$"    
.CODE
MAIN PROC
;initialize DS
    MOV AX,@DATA
    MOV DS,AX
;print hello
    LEA DX,STR1
    MOV AH,9
    INT 21H
MAIN ENDP
END MAIN