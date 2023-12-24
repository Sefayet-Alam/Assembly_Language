.MODEL SMALL
.STACK 100H
.DATA     
    STR1 DB "Output Array: $" 
    NEWLINE DB 10,13,"$"
    AR DB 5,5,5,5,5  
       DB 5,5,5,5,5 
       DB 5,5,5,5,5 
       DB 5,5,5,5,5 
       DB 5,5,5,5,5
    SPACE DB " $"  
    CNT DB 5
   
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX      
    
    LEA DX,STR1
    MOV AH,9
    INT 21H 
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H 
    
    
    
    
    MOV BX,0
    MOV SI,4 
    MOV CX,5 
    colc:
    MOV AR[BX][SI],0
    ADD BX,5
    loop colc
    
    
    MOV BX,0
    MOV SI,20 
    MOV CX,5
    rowc:
    MOV AR[BX][SI],0
    INC BX
    loop rowc
    
               
  
    
    
    XOR BX,BX
    XOR SI,SI
    XOR CX,CX 
    
    print_:
        XOR SI,SI
        MOV CX,5  
        inner_:
            XOR AX,AX
            XOR DX,DX
            MOV AL,AR[BX][SI]
            MOV DX,AX
            ADD DX,48
            MOV AH,2
            INT 21H 
            
            LEA DX,SPACE
            MOV AH,9
            INT 21H 
            INC SI
            loop inner_
            
           
         ADD BX,5
         
         LEA DX,NEWLINE
         MOV AH,9
         INT 21H
         
         CMP BX,25      
         JNE print_
                
    
    F:
    MOV AX,4C00H
    INT 21H   
    
MAIN ENDP
END MAIN

