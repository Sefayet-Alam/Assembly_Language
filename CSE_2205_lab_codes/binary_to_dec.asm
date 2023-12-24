.MODEL SMALL
.STACK 100H
.DATA     
    STR1 DB "Enter a binary number: $"
    STR2 DB "Output: $" 
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
    
    XOR CX,CX
    XOR AX,AX

    
    calc:
    
    SHR BL,1
    JNC continue
    
    
    MOV AL,1
    MOV CL,P
    SHL AL,CL
      
    ADD ANS,AX
     
    jmp Continue
       
       
    Continue:
    INC P
    
    CMP P,8
    JL calc
    
    XOR AX,AX
    MOV AX,ANS
    
    AAA
    
    MOV BX,AX
    
    MOV DL,BH
    ADD DL,48
    MOV AH,2
    INT 21H
    
    MOV DL,BL
    ADD DL,48
    MOV AH,2
    INT 21H
     
    F:
    MOV AX,4C00H
    INT 21H   
    
MAIN ENDP
END MAIN

