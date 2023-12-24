.MODEL SMALL
.STACK 100H
.DATA     
    STR1 DB "Enter a string: $"
    STR2 DB "Reverse is: $" 
    NEWLINE DB 10,13,"$" 
    ANS DW 0
    P DB 0 ;checker
   
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX  
    
    
   
    LEA DX,STR1
    MOV AH,9
    INT 21h      
    
    MOV BX,'$'
    PUSH BX   
    
    input_:
    MOV AH,1
    INT 21h
    CMP AL,0Dh
    JE break
    XOR BX,BX
    MOV BL,AL
    PUSH BX
    JMP input_
    
    break:  
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21h
     
    LEA DX,STR2
    MOV AH,9
    INT 21h 
    
    output_:
    POP BX
    CMP BX,'$'
    JE FINISH
    MOV DX,BX
    MOV AH,2
    INT 21h
    JMP output_
   
   
    
    FINISH:  
   
    
MAIN ENDP
END MAIN
     

