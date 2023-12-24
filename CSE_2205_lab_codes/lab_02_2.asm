.MODEL SMALL
.STACK 100H
.DATA
A DW 3
B DW 9
OUTPUT DW 0
.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX
MOV AX, A
SUB AX, B

NEG AX      
;Properly negates the value

MOV BX, AX
MOV DX, '-'  
;puts '-' before the value


MOV AH, 2 ;output
INT 21H
MOV DL, BL
ADD DL, '0'
INT 21H
