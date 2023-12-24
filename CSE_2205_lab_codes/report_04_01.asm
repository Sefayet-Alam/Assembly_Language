.MODEL SMALL
.STACK 100H
.DATA
     STR1 DB "Hello ,everymeow$"
     STR2 DB "How are you? Fine, thank you$"
MAIN PROC
;initialize DS
    MOV AX,@DATA
    MOV DS,AX
;print first string 
    LEA DX,STR1
    MOV AH,9
    INT 21H
;print newline
    MOV DX,10
    MOV AH,2
    INT 21H
    MOV DX,13
    MOV AH,2
    INT 21H
;print second string
    LEA DX,STR2
    MOV AH,9
    INT 21H
;end process
    MAIN ENDP
    END MAIN
      