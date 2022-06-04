;Write an 8051 Assembly Language subroutine MAXMIN that will return the maximum
;and minimum of the unsigned non-zero 8-bit binary numbers located at 1000h in the
;registers R6 and R7, respectively. The array of numbers is written to the ROM with
;the DB directive with 00h at the end, and the array will contain at most 256 numbers. 


ORG 0000h                       ; This is the origin

; THE MAIN
;------------------------------------------------------------------------------------;
MOV R6, #01h;max
MOV R7, #01h;min

ACALL MAXMIN

; THE SUBROUTINE
;------------------------------------------------------------------------------------;
ORG 0100h

MAXMIN: MOV DPTR, #NUMBERS      ; move the data pointer to the array
MOV R1, #00h                    ; the loop counter

LOOP: CLR A
MOVC A, @A+DPTR                 ; load the array data to register A

JZ FIN                          ;Exit if the number is 0

NONZERO:CJNE A, 06h, GREATER    ; if the number is equal to the value at R6 then test for R7 else copy the value to R6
SJMP HERE

GREATER: JC ADDR6
ADDR6: MOV R6, A                ; copy the value of A to R6
SJMP NEXT

HERE: CJNE A, 07h, SMALLER      ; if the number is equal to the value at R7 then jump to NEXT else copy the value to R7
SJMP NEXT

SMALLER: JNC ADDR7
ADDR7: MOV R7,A                 ; copy the value of A to R7
SJMP NEXT

NEXT: INC DPTR                  ; increment the data pointer
DJNZ R1,LOOP                    ; restart the loop
FIN:RET

; THE ARRAY
;------------------------------------------------------------------------------------;
ORG 1000h
NUMBERS: DB 12,15,1,25,250,0

END

