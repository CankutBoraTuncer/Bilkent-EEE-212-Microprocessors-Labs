ORG 0000h
MOV SP,#4Fh
SETB RS1
MOV DPTR,#EEE212
MOV 78h,#04
MOV 11h,#0FEh
MOV R1,#40h
PUSH 11h
MOV A,#03
BACK: PUSH ACC
MOVC A,@A+DPTR
MOV @R1,A
POP ACC
INC A
INC R1
DJNZ 78h,BACK 
INC SP
POP 50h
LJMP FORWARD

ORG 0234h
FORWARD: ACALL FINISH 
BACK2: POP 50h
NOP
HERE: SJMP HERE

ORG 0500h
FINISH: SETB 12h
SETB 12
RET ; no RET is used

ORG 1A00h
DB 50
EEE212: DB '5678',88h,45,10010000b
END
