.MODEL SMALL
.STACK 100H
.DATA     
    A DW 9
    B DB 2     
    PROD DB ?
     
.CODE
MAIN PROC
;initialize DS
    MOV AX,@DATA
    MOV DS,AX
         
    MOV AX,A
    DIV B
          

    
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