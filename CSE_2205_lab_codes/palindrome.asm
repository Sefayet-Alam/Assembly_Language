.MODEL SMALL
.STACK 100H
.DATA 
    STR0 DB "The strings are: $"    
    STR1 DB "ACDGGDCA$"  
    STR  DB "OUTPUT: $"
    STR3 DB "NOT PALINDROME! $"
    STR4 DB "PALINDROME! $"
    NEWLINE DB 10,13,"$" 
    Iter DB 0
    LEN DB 6 
   
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX 
    CLD
    
    LEA DX,STR0
    MOV AH,9
    INT 21H
    
    LEA DX,STR1
    MOV AH,9
    INT 21H
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
    
    LEA DX,STR
    MOV AH,9
    INT 21H
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
    
    LEA SI,STR1
    LEA DI,STR1+5
    
    MOV CX,8
    L1:
    CMPSB
    JNE no
    SUB DI,2
    LOOP L1
    
    
    
    LEA DX,STR4
    MOV AH,9
    INT 21H
    JMP FINISH
 
    no:
    LEA DX,STR3
    MOV AH,9
    INT 21H
    
   
    
       
    
    
    FINISH:

   
    
MAIN ENDP
END MAIN



