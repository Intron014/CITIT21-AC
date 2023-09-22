	.data
vector: .space 40
	.text
	daddi 	R1,R0,0		; i en R1
	daddi	R12,R0,0	; puntero en R12

WHILE:
	slti 	R2,R1,10	; Si i<10 --> R2==1
	beqz	R2,FIN		
	sw		R1,vector(R12); i almacena en mem(vector+R12)
	daddi	R1,R1,1		; i++
	daddi	R12,R12,4	; puntero+=4
	j		WHILE

FIN:
	halt
