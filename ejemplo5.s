	.data
x:	.word32 4
resul:	.word32 0
	.text
	lw		R1,x(R0)	; x en R1
	jal		fact
	sw		R24,resul(R0)
	halt
	
fact:
	daddi	R2,R0,2		; i en R2
	daddi	R3,R0,1		; fact en R3
	daddi	R4,R0,1		; UNO en R4
	slt		R5,R4,R1	; Si UNO<X entonces R5=1
	beqz	R5,FIN
FOR:
	slt		R6,R1,R2	; Si x<i entonces R6=1
	bnez	R6,FIN
	dmul	R3,R3,R2	; fact = fact*i
	daddi	R2,R2,1		; i++
	j FOR
FIN:
	dadd	R24,R0,R3	; fact to R24
	jr		R31
	halt
