.MODEL SMALL
.DATA
    STR1 DB "Enter the first number: $"
    STR2 DB "Enter the second number: $"
    STR3 DB "The greater one: $"
    NEWLINE DB 10,13,"$"
    A DB ? ;first number
    B DB ? ;second number
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
;First character input:
    LEA DX,STR1;LEA=Load Effective Address
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV A,AL
;New line
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H  
;Second character input:
    LEA DX,STR2
    MOV AH,9
    INT 21H
    
    MOV AH,1 
    INT 21H
    MOV B,AL
    
;New line
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H 
        
    
        
;prit output string 
    LEA DX,STR3
    MOV AH,9
    INT 21H
    
;comparison and output
   MOV AL,A
   MOV BL,B
   CMP AL,BL
   JGE L1
   
   MOV DL,BL
   MOV AH,2
   INT 21H
   JMP L2
   
   
L1:
   MOV DL,AL
   MOV AH,2
   INT 21H
   
L2:
    
    
;END
MOV AH,4CH
INT 21H
      
MAIN ENDP
END MAIN