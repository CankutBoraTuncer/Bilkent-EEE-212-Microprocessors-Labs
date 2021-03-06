ORG 0000h

	LJMP MAIN

ORG 0003h

	LJMP E0INT

ORG 000Bh

	LJMP T0INT

ORG 0100h
MAIN:
	BASETIMER EQU 30H        ; The Second Counter
	OUTPUT BIT P1.1          ; The Output Pin
	SETB IT0		 ; The Interrupt Mode Falling Edge
	MOV TMOD, #00010001b     ; The timer configurations: T1 8-bit, T0 16-bit
	MOV IE, #10000011b       ; The interrupt is targetted to Timer 0 Interrupt
	MOV P1,#00H

	TIMER:                   ; The timer configurations: 50ms/3CB0H
		CLR TF0
		MOV TH0,#03CH
		MOV TL0,#0B0H
		SETB TR0

LOOP:	ACALL C5
	ACALL D5
	ACALL E5
	ACALL F5
	ACALL G5
	ACALL A5
	ACALL B5
	ACALL C6
	SJMP LOOP
;----------------------------------------------------------------------;
C5:
	JZ C5CONT
	CLR A
	SJMP C5EXIT
C5CONT:	CLR TF1
	SETB OUTPUT
	MOV TH1,#0FCH
	MOV TL1,#040H
	SETB TR1
	JNB TF1,$
	CLR OUTPUT
	CLR TF1
	MOV TH1,#0FCH
	MOV TL1,#040H
	JNB TF1,$
	SJMP C5
C5EXIT: RET
;----------------------------------------------------------------------;
D5:	JZ D5CONT
	CLR A
	SJMP D5EXIT
D5CONT:	CLR TF1
	SETB OUTPUT
	MOV TH1,#0FCH
	MOV TL1,#0ADH
	SETB TR1
	JNB TF1,$
	CLR OUTPUT
	CLR TF1
	MOV TH1,#0FCH
	MOV TL1,#0ADH
	JNB TF1,$
	SJMP D5
D5EXIT: RET	
;----------------------------------------------------------------------;
E5:	
	JZ E5CONT
	CLR A
	SJMP E5EXIT
E5CONT:	CLR TF1
	SETB OUTPUT
	MOV TH1,#0FDH
	MOV TL1,#009H
	SETB TR1
	JNB TF1,$
	CLR OUTPUT
	CLR TF1
	MOV TH1,#0FDH
	MOV TL1,#009H
	JNB TF1,$
	SJMP E5
E5EXIT: RET
;----------------------------------------------------------------------;
F5:	JZ F5CONT
	CLR A
	SJMP F5EXIT
F5CONT:	CLR TF1
	SETB OUTPUT
	MOV TH1,#0FDH
	MOV TL1,#034H
	SETB TR1
	JNB TF1,$
	CLR OUTPUT
	CLR TF1
	MOV TH1,#0FDH
	MOV TL1,#034H
	JNB TF1,$
	SJMP F5
F5EXIT: RET	
;----------------------------------------------------------------------;
G5:	JZ G5CONT
	CLR A
	SJMP G5EXIT
G5CONT:	CLR TF1
	SETB OUTPUT
	MOV TH1,#0FDH
	MOV TL1,#082H
	SETB TR1
	JNB TF1,$
	CLR OUTPUT
	CLR TF1
	MOV TH1,#0FDH
	MOV TL1,#082H
	JNB TF1,$
	SJMP G5
G5EXIT: RET	
;----------------------------------------------------------------------;
A5:	JZ A5CONT
	CLR A
	SJMP A5EXIT
A5CONT:	CLR TF1
	SETB OUTPUT
	MOV TH1,#0FDH
	MOV TL1,#0C8H
	SETB TR1
	JNB TF1,$
	CLR OUTPUT
	CLR TF1
	MOV TH1,#0FDH
	MOV TL1,#0C8H
	JNB TF1,$
	SJMP A5
A5EXIT: RET	
;----------------------------------------------------------------------;
B5:	JZ B5CONT
	CLR A
	SJMP B5EXIT
B5CONT:	CLR TF1
	SETB OUTPUT
	MOV TH1,#0FEH
	MOV TL1,#006H
	SETB TR1
	JNB TF1,$
	CLR OUTPUT
	CLR TF1
	MOV TH1,#0FEH
	MOV TL1,#006H
	JNB TF1,$
	SJMP B5
B5EXIT: RET	
;----------------------------------------------------------------------;
C6:	JZ C6CONT
	CLR A 
	SJMP C6EXIT
C6CONT:	CLR TF1
	SETB OUTPUT
	MOV TH1,#0FEH
	MOV TL1,#022H
	SETB TR1
	JNB TF1,$
	CLR OUTPUT
	CLR TF1
	MOV TH1,#0FEH
	MOV TL1,#022H
	JNB TF1,$
	SJMP C6
C6EXIT: RET
;----------------------------------------------------------------------;
T0INT:
	CLR TF0
	MOV TH0,#03CH
	MOV TL0,#0B0H
	INC R7
	CJNE R7, #20D, SECOND
	INC BASETIMER
	MOV R7, #00H
	MOV A, #01H
	SETB TF1
SECOND:	RETI

E0INT:
	CLR OUTPUT
	JNB IE0, $
	CLR IE0
	RETI
END

























