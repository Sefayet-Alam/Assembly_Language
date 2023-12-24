.MODEL SMALL
.STACK 100H
.DATA     
    STR1 DB "Enter a character: $"
    STR2 DB "Output: $"
    STR3 DB "Invalid input.. $" 
    NEWLINE DB 10,13,"$"
    A DB ? ;first character 
    B DB ? ;second character
.CODE
MAIN PROC
;initialize DS
    MOV AX,@DATA
    MOV DS,AX
    
   
    LEA DX,STR1;LEA=Load Effective Addre[ss
    MOV AH,9
    INT 21H 
    
    MOV AH,1  
    INT 21H
    MOV BL,AL
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H 
    
    LEA DX,STR2;LEA=Load Effective Address
    MOV AH,9
    INT 21H 
    
    CMP BL,'a'
    JGE L1 
    
    JMP L3
    
    L1:   
    CMP BL,'z'
    JLE L2
    
    JMP L3
    
    L2:
    SUB BL,32
    MOV DL,BL
    MOV AH,2
    INT 21H 
    JMP F
    
    L3:
    CMP BL,'A'
    JGE L4
    
    JMP I 
    
    L4:
    CMP BL,'Z'
    JLE L5 
    
    JMP I
    
    L5: 
    ADD BL,32
    MOV DL,BL
    MOV AH,2
    INT 21H 
    JMP F   
    
    I: 
    LEA DX,STR3;LEA=Load Effective Address
    MOV AH,9
    INT 21H
    
    F:
    
     
    MOV AH,4CH
    INT 21H    
    
    
MAIN ENDP
END MAIN