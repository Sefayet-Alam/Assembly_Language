.MODEL SMALL
.STACK 100H
.DATA     
    STR1 DB "Enter a number: $"
    STR2 DB "Output: $" 
    STR3 DB "Odd. $"
    STR4 DB "Even. $"
    NEWLINE DB 10,13,"$"
    A DB ? ;first number 
    B DB 2 ;second number
.CODE
MAIN PROC
;initialize DS
    MOV AX,@DATA
    MOV DS,AX
    
    ;First integer input:
    LEA DX,STR1;LEA=Load Effective Address
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    SUB AL,30H  
    INT 21H
    MOV BL,AL
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H 
    
    LEA DX,STR2;LEA=Load Effective Address
    MOV AH,9
    INT 21H 
    
    MOV AX,0
    MOV AL,BL
    DIV B
         
     

    
    CMP AH,0
    JE L1
    
    LEA DX,STR3;LEA=Load Effective Address
    MOV AH,9
    INT 21H 
    JMP F
    
    L1: 
    
    LEA DX,STR4;LEA=Load Effective Address
    MOV AH,9
    INT 21H
    
    F:
    
     
    MOV AH,4CH
    INT 21H    
    
    
MAIN ENDP
END MAIN