.MODEL SMALL
.STACK 100h
.DATA
    
    AR DB 5,6,4,3,1,2,9,9,9,0
    SZ DW 10  
    STR DB "Smallest : $" 
    STR2 DB "Greatest : $"
    STR1 DB "Output Array: $" 
    NEWLINE DB 10,13,"$"
    SPACE DB " $" 

.CODE

MAIN PROC         
    
    MOV AX,@DATA
    MOV DS,AX
        
    XOR BX,BX
    
    MOV BH,10 
    ;BH stores minimum
    ;BL stores maximum     
    LEA SI,AR      
    MOV CX,SZ
        
    L1:
        CMP [SI],BL
        
        JL is_low
        
        MOV BL,[SI]
         
        is_low:      
        
        CMP [SI],BH
        
        JG continue
        
        MOV BH,[SI]
        
        continue:
          
        INC SI
        
        loop L1
                  
    
    LEA DX,STR
    MOV AH,9
    INT 21H               
   
    
    MOV DL,BH 
    ADD DL,48
    MOV AH,2
    INT 21h 
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
    
    LEA DX,STR2
    MOV AH,9
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