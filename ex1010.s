	.data
	.org 0x200

vector: .word32 0,1,2,3,4,5,6,7
Suma: .word32 0

	.text

MAIN:
	daddi R1,R0,32
	dadd R4,R0,R0
	
DOWHILE:
	daddi R1,R1,-4
	lw R2,vector(R1)
	dadd R4,R4,R2
	bnez R1,DOWHILE
	sw R4,Suma(R0)
	halt