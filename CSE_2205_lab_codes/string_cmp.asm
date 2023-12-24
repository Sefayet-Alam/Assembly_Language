.MODEL SMALL
.STACK 100H
.DATA 
    STR0 DB "The strings are: $"    
    STR1 DB "SefaYEt_Alam$"  
    STR2 DB "SefaYEt_Alam$"
    STR  DB "OUTPUT: $"
    STR3 DB "NOT SAME! $"
    STR4 DB "SAME! $"
    NEWLINE DB 10,13,"$" 
    Iter DB 0
    LEN DB 12 
   
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX 
    CLD
    
    LEA DX,STR0
    MOV AH,9
    INT 21H
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
    
    LEA DX,STR1
    MOV AH,9
    INT 21H
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
    
    
    LEA DX,STR2
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
    LEA DI,STR2
    
    MOV CX,4
    REPE CMPSB
    JZ YES
    
    
    NO:
    
    LEA DX,STR3
    MOV AH,9
    INT 21H
    JMP FINISH
    
    
    YES:
    LEA DX,STR4
    MOV AH,9
    INT 21H
       
    
    
    FINISH:

   
    
MAIN ENDP
END MAIN



