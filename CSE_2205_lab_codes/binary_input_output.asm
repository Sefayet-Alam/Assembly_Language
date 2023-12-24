.MODEL SMALL
.STACK 100H
.DATA     
    STR1 DB "Enter a binary number: $"
    STR2 DB "Output: $" 
    NEWLINE DB 10,13,"$"
    N DB ? ;first number 
   
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX      
    
    LEA DX,STR1
    MOV AH,9
    INT 21H
    
    XOR AX,AX
    MOV BL,0
           
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
    
    LEA DX,STR2
    MOV AH,9
    INT 21H
    
    MOV CX,8
     
    output:
    
    SHL BL,1
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
   
    
    F:
    MOV AX,4C00H
    INT 21H   
    
MAIN ENDP
END MAIN

