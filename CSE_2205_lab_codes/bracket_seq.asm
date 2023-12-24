.MODEL SMALL
.STACK 100H
.DATA     
    STR1 DB "Enter a bracket sequence: $"
    STR2 DB "Output: $"
    STR3 DB "Valid$"  
    STR4 DB "Not Valid!$" 
    NEWLINE DB 10,13,"$" 
    ANS DW 0
    P DB 0 ;checker
   
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX      
    
    PUSH '$'
    
    LEA DX,STR1
    MOV AH,9
    INT 21h
    
    ;take input
    
    L1:    
    MOV AH,1
    INT 21h    
    CMP AL,0Dh
    JE check_last
    
    ;compare if opening bracket
    CMP AL,'('
    JE STK_ADD
    CMP AL,'{'    
    JE STK_ADD
    CMP AL,'['    
    JE STK_ADD
    
    ;compare if closing bracket
    CMP AL,')'    
    JE IS_VALID
    CMP AL,'}'    
    JE IS_VALID2
    CMP AL,']'    
    JE IS_VALID3
    JMP L1
    
    STK_ADD:
    XOR BX,BX    
    MOV BL,AL
    PUSH BX    
    JMP L1
    
    IS_VALID:
    POP BX
    CMP BX,'('    
    JE L1
    JNE not_
        
    IS_VALID2:
    POP BX
    CMP BX,'{'    
    JE L1
    JNE not_  
      
    IS_VALID3:    
    POP BX
    CMP BX,'['    
    JE L1
    JNE not_
        
    check_last:    
    POP BX    
    CMP BL,'('
    JE not_
    CMP BL,'{'
    JE not_    
    CMP bl,'['
    JE not_
    JMP F    
  
    
    not_:
    ;print not_valid
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H  
    
    LEA DX,STR2
    MOV AH,9
    INT 21H
    
    LEA DX,STR4
    MOV AH,9
    INT 21H
  
    JMP FINISH
        
    F: 
    ;print valid 
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
      
    LEA DX,STR2
    MOV AH,9
    INT 21H
    
    LEA DX,STR3
    MOV AH,9
    INT 21H
    
    FINISH:

   
    
MAIN ENDP
END MAIN

