.MODEL SMALL
.STACK 100H
.DATA 
    STR0 DB "The string is: $"    
    STR1 DB "SefaYEt_Alam$"
    VOWELS DB "AEIOUaeiou$"
    CONSONANTS DB "BCDFGHJKLMNPQRSTVWXYZbcdfghijklmnpqrstuvwxyz$"  
    STR4 DB "Vowel count=$"
    STR5 DB "Consonant count=$" 
    NEWLINE DB 10,13,"$" 
    VCNT DB 0
    CCNT DB 0
    Iter DB 0
    LEN DB 12 
   
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    CLD
    
    
    LEA DX,STR0
    MOV AH,9
    INT 21H
    
    LEA DX,STR1
    MOV AH,9
    INT 21H
    
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H 
    
    XOR SI,SI
    LEA SI,STR1  

    
    L1:
    
    LODSB
    LEA DI,VOWELS
    MOV CX,10
    REPNE SCASB
    JNE is_consonant
    INC VCNT
    JMP done
    
    is_consonant:
    LEA DI,CONSONANTS
    MOV CX,42
    REPNE SCASB
    JNE done
    INC CCNT
    
    
    done:
    INC Iter
    CMP Iter,12
    JNE L1
    
    ;Output
    LEA DX,STR4
    MOV AH,9
    INT 21H
    
    XOR DX,DX
    MOV DL,VCNT
    ADD DL,48
    MOV AH,2
    INT 21H
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H 
   
    
    LEA DX,STR5
    MOV AH,9
    INT 21H
    
    
    XOR DX,DX
    MOV DL,CCNT
    ADD DL,48
    MOV AH,2
    INT 21H  
    
    
    FINISH:

   
    
MAIN ENDP
END MAIN



