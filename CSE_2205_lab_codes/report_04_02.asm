.MODEL SMALL
.DATA
    STR1 DB "Enter the first number: $"
    STR2 DB "Enter the second number: $"
    STR3 DB "PRODUCT: $"
    NEWLINE DB 10,13,"$"
    A DB ? ;first number
    B DB ? ;second number
    RESULT DB ? ;stores the respult
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
;First number input:
    LEA DX,STR1;LEA=Load Effective Address
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,30H ;conversion to integer from ascii
    MOV A,AL
;New line
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H  
;Second number input:
    LEA DX,STR2
    MOV AH,9
    INT 21H
    
    MOV AH,1 
    INT 21H
    SUB AL,30H
    MOV B,AL  

;New line
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
        
;Output
    LEA DX,STR3
    MOV AH,9
    INT 21H
        
;multiplication
    MOV AL,A
    MUL B
    AAM 
    
    MOV BX,AX
    MOV DL,BH
    ADD DL,48
    MOV AH,2
    INT 21H
    
    MOV DL,BL
    ADD DL,48
    MOV AH,2
    INT 21H
    
    
;END
MOV AH,4CH
INT 21H
      
MAIN ENDP
END MAIN