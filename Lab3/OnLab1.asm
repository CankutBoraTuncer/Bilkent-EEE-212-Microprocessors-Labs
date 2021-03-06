;As your first on-lab assignment, you are going to implement a subroutine called COUNTDOWN that counts down starting ;from the initial time with given intervals.

ORG 0000H

ACALL COUNTDOWN                     ;Calling the countdown

COUNTDOWN:
MOV R1,#50D                         ;The current time
MOV R2,#10D                         ;The update interval
MOV A,#00D                          ;The counter
MOV R7,01H                          ;Initilize the R7

COUNT:
CJNE A, 02H, NEXT                   ;If the counter is equal to the interval then update R7
MOV R7,01H
CLR A				    ;Reset the counter
NEXT:ACALL DELAY                    ;Wait
INC A                           
DJNZ R1,COUNT                       ;The countdown
RET 

DELAY:                              ;1ms delay
MOV R5,#250d
MOV R6,#250d
BACK4:DJNZ R6,BACK4
BACK5:DJNZ R5,BACK5
RET

END 