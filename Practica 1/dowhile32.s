	.data
vectorA: .word32 0,3,2,3,4,5,6,7
vectorB: .word32 7,6,5,4,3,2,1,1
vectorSum: .space 32

	.text
main:	daddi	r1,r0,32	; i = 8
dwhile:	daddi	r1,r1,-4
	lw	r2,vectorA(r1)
	lw	r3,vectorB(r1)
	dadd	r4,r2,r3
	sw	r4,vectorSum(r1)
	bnez	r1,dwhile
	halt
