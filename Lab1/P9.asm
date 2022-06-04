ORG 0000H

	MOV SCON, #50H
	MOV TMOD, #00100000B
	
	MOV TH1, #253D
	SETB TR1
	
	MOV DPTR, #WORD
LOOP:	CLR A
	MOVC A, @A+DPTR
	JZ EXIT
	MOV 30H, A
	MOV SBUF, 30H
	CJNE A, #'L',RESET
	clr TI
	JNB TI, $
	SJMP LOOP
RESET:	MOV DPTR, #WORD
	JNB TI, $
	SJMP LOOP

EXIT:	CLR A




ORG 1000H
WORD: DB 'LEVEL',0
