;Write a program to display the remaining time in three digits using three sevensegment displays.
;For example, if the ;remaining time is currently 20.1 minutes, then
;we would be displaying 201 on the three seven segment displays. We would then
;observe 201, 200, 199, … , 001, 000. You need to write the delay subroutine in such a
;way that when the program is simulated, the time display should be updated at every
;0.1 min approximately. Note that the actual 8051 delays and the delays one would
;get when simulations are performed, may be quite different. Remaining time
;initialization will be done within the code (largest value 99.9 minutes). When the
;remaining time hits zero, display blinking characters of your own design.

ORG 0000h

; THE MAIN
;------------------------------------------------------------------------------------;
MOV A,#09h
MOV R1,#09H                              ; R1 holds the 2nd 7segment index
MOV R2,#08h                              ; R2 holds the 3rd 7segment index

MOV P1,#3Fh                              ; Initial number for 1st 7segment
MOV P2,#3Fh                              ; Initial number for 2nd 7segment
MOV P3,#06h                             ; Initial number for 3rd 7segment


MOV DPTR,#ARRAY                          ; Initializing the array

ACALL SEGMENTDRIVER                      ; Calling the 7segment driver

; THE SUBROUTINE SEGMENTDRIVER
;------------------------------------------------------------------------------------;
SEGMENTDRIVER: 
;-------------------------------;
;This is where the 1st 7segment is driven
;-------------------------------;
BACK: PUSH ACC

MOVC A,@A+DPTR
MOV P1,A

LCALL DELAY

POP ACC
INC A
;-------------------------------;
;This is where the 2nd 7segment is driven
;-------------------------------;
CJNE A,#0Ah,BACK
INC R1
MOV A,R1 

MOVC A,@A+DPTR
MOV P2,A
CLR A 
;-------------------------------;
;This is where the 3rd 7segment is driven
;-------------------------------;
CJNE R1,#0Ah,BACK

MOV R1,#00h


INC R2
MOV A,R2

MOVC A,@A+DPTR
MOV P3,A
CLR A
;-------------------------------;
;This is where the end timer animation is driven
;-------------------------------;
CJNE R2,#0Ah,BACK

ANIMATE:MOV P1, #11100011b
MOV P2, #00011100b
MOV P3, #11100011b
ACALL LONGDELAY
MOV P1, #01000000b
MOV P2, #01011100b
MOV P3, #01000000b
ACALL LONGDELAY
SJMP ANIMATE

RET


; THE SUBROUTINE DELAY
;------------------------------------------------------------------------------------;
DELAY: MOV R5,#21d
MOV R6,#21d

BACK2:DJNZ R6,BACK2
BACK3:DJNZ R5,BACK3
RET

; THE SUBROUTINE LONGDELAY
;------------------------------------------------------------------------------------;
LONGDELAY: MOV R5,#250d
MOV R6,#250d

BACK4:DJNZ R6,BACK4
BACK5:DJNZ R5,BACK5
RET


ORG 1000h
ARRAY: DB 6Fh,7Fh,07h,7Dh,6Dh,66h,4Fh,5Bh,06h,3Fh
END 
