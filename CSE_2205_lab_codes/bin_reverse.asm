.MODEL SMALL
.STACK 100H
.DATA     
    STR1 DB "Enter a binary number: $"
    STR2 DB "Output in decimal: $"
    STR3 DB "Output binary string: $" 
    NEWLINE DB 10,13,"$"
    ANS DW 0
    P DB 0 ;power 
   
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX      
    
    LEA DX,STR1
    MOV AH,9
    INT 21H
    
    XOR AX,AX
    MOV BL,0
    
    ;input binary string 
    
    input_:
    MOV AH,1
    INT 21H
    
    CMP AL,0Dh
    JE break
    
    SUB AL,30H
    
    SHL BL,1
    OR BL,AL 
    
    JMP input_    
    
    break:  
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H 
    
    
    LEA DX,STR3
    MOV AH,9
    INT 21H  
    
    
    ;output binary string
    
    
    MOV CX,8
    
    output:
    
    ROR BL,1;rotates after right shift
    JC one 
    
    MOV DL,'0'
    MOV AH,2
    INT 21H
    JMP continue
    
    one:
    MOV DL,'1'
    MOV AH,2
    INT 21H
    
    continue:
    Loop output
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
    
  
    
     
    F:
    MOV AX,4C00H
    INT 21H   
    
MAIN ENDP
END MAIN

