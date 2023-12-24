.MODEL SMALL
.DATA
    STR1 DB "Enter the first number: $"
    STR2 DB "Enter the second number: $"
    STR3 DB "Remainder: $"
    STR4 DB "Quotient: $"
    NEWLINE DB 10,13,"$"
    A DW ? ;first number
    B DB ? ;second number
    ;REM DB ? ;stores the remainder
    ;QUO DB ?; stores the quotient
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
    MOV AH,0
    MOV A,AX
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
       
;Division
    MOV AX,A 
    DIV B  
    MOV BX,AX 
        
;print Remainder
    LEA DX,STR3
    MOV AH,9
    INT 21H
        

;In BH there stores remainder
    
    MOV DL,BH
    ADD DL,48
    MOV AH,2
    INT 21H
    
;New line
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
        
;print quotient
    LEA DX,STR4
    MOV AH,9
    INT 21H
;In BH there stores result, print result    
    MOV DL,BL
    ADD DL,48
    MOV AH,2
    INT 21H
    
    
;END
MOV AH,4CH
INT 21H
      
MAIN ENDP
END MAIN