.MODEL SMALL
.STACK 100H
.DATA     
    STR1 DB "Enter a hexadecimal input: $"
    STR2 DB "binary output: $" 
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
    MOV BX,0
    
           
    input_:
    XOR AX,AX
    MOV AH,1
    INT 21H
    
    CMP AL,0Dh
    JE break
    
    CMP AL,'9'
    JG t1 
    SUB AL,30H
    JMP shift
    t1:
    SUB AL,31H
    SUB AL,6H
        
    shift: 
    SHL BX,4
    OR BX,AX 
    
    JMP input_    
    
    break:
    
      
    
    ;LEA DX,NEWLINE
    ;MOV AH,9
    ;INT 21H 
    
    ;MOV DX,0
    ;MOV DL,BL
    ;ADD DL,48  
    ;MOV AH,2
    ;INT 21H
    
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

