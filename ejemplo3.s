	.data
i:	.word32 0
j:	.word32 0
	.text
	lw		R1,i(R0)	; i en R1
	lw		R2,j(R0)	; j en R2
	
WHILE:
	slti	R3,R1,10	; Si R1<10 --> R3==1
	beqz	R3,FIN		; Si R3==0 --> Salto a FIN
	daddi 	R2,R2,5		; j = j+5
	daddi	R1,R1,1		; i = i+1
	j		WHILE

FIN:
	sw		R1,i(R0)
	sw		R2,j(R0)
	halt
