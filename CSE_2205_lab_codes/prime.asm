.MODEL SMALL
.STACK 100H
.DATA     
    STR1 DB "Enter a number: $"
    STR2 DB "Output: $" 
    STR3 DB "Prime. $"
    STR4 DB "Not prime. $"
    STR5 DB "Neither. $"
    NEWLINE DB 10,13,"$"
    N DB ? ;first number 
   
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX      
    
    ;input
    LEA DX,STR1  
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV N,AL
    
    LEA DX,NEWLINE  
    MOV AH,9
    INT 21H

    LEA DX,STR2
    MOV AH,9
    INT 21H
    
     
    MOV AX,0
    MOV AL,N
    CMP AL,1
    JLE Nei
    
    MOV BL,2
    
    L1:
    CMP BL,N
    JE P
    
    MOV AX,0
    MOV AL,N
    DIV BL
    
    CMP AH,0
    JE _N2
    
    INC BL 
    JMP L1
   
    P:
    LEA DX,STR3
    MOV AH,9
    INT 21H
    JMP F
       
    _N2:

    LEA DX,STR4
    MOV AH,9
    INT 21H
    
    JMP F 
    
    Nei:
    LEA DX,STR5
    MOV AH,9
    INT 21H
    JMP F
    
    F:
    MOV AX,4C00H
    INT 21H   
    
MAIN ENDP
END MAIN

