.MODEL SMALL
.DATA
    STR1 DB "Enter a number from 0 to 9: $"
    STR3 DB "The grade: $"
    NEWLINE DB 10,13,"$"
    A DB ? ;first number
    B DB ? ;second number
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
;First integer input:
    LEA DX,STR1;LEA=Load Effective Address
    MOV AH,9
    INT 21H
    
    MOV AH,1
    SUB AL,30H  
    INT 21H
    MOV A,AL  
    
;New line
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H  
    
        
;print output string 
    LEA DX,STR3
    MOV AH,9
    INT 21H
    
;comparison and output
    
   MOV AL,A
   CMP AL,'8'
   JGE L1
   
   CMP AL,'6'
   JGE L2
   
   CMP AL,'3'
   JGE L3
   
   CMP AL,'0'
   JGE L4    
   
L4:
   MOV DL,'F'
   MOV AH,2
   INT 21H
   JMP F 
   
L3: 
   MOV DL,'C'
   MOV AH,2
   INT 21H
   JMP F
    

L2:
   MOV DL,'B'
   MOV AH,2
   INT 21H
   JMP F  
  
L1:
    
   MOV DL,'A'
   MOV AH,2
   INT 21H
   JMP F
   

;END


F:
   

MOV AH,4CH
INT 21H
      
MAIN ENDP
END MAIN