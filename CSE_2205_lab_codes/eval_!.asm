.MODEL SMALL
.STACK 100H
.DATA
    STR1 DB "Enter first number: $"
    STR2 DB 0AH,0DH,"Enter second number: $"
    STR3 DB 0AH,0DH,"Product: $"      
    A DB 3
    B DB 5      
    PROD DB ?
     
.CODE
MAIN PROC
;initialize DS
    MOV AX,@DATA
    MOV DS,AX
         
    ;input A
    LEA DX,STR1
    MOV AH,9
    INT 21H
    
    MOV AH, 1 ;Input
    INT 21H   

    SUB AL, 30H;Input adjustment
    MOV A, AL 
    
    ;input B 
    LEA DX,STR2
    MOV AH,9
    INT 21H  
    
    MOV AH, 1;input second variable
    INT 21H
    SUB AL, 30H;input adjustment
    MOV B, AL
    MOV AL,A
    MUL B
    AAM
    
    MOV BX,AX
    MOV AH, 1;input second variable
    INT 21H
    SUB AL, 30H;input adjustment
    MOV B, AL
    
    
    ;Output
    LEA DX,STR3
    MOV AH,9
    INT 21H
    
    MOV DL,BH
    ADD DL,48
    
    MOV AH,2
    INT 21H
    MOV DL,BL
    ADD DL,48
    
    MOV AH,2
    INT 21H
    
     
    
    
    
MAIN ENDP
END MAIN