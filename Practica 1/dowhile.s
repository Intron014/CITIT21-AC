	.data

	.org 0x200
vectorA: .byte 0,1,2,3,4,5,6,7
vectorB: .byte 7,6,5,4,3,2,1,1
vectorSum: .space 8
matriz: .space 4
matriz:	.byte 0x0, 0x1, 0x2, 0x3	

	.text
main:	daddi	r1,r0,8	; i = 8
dwhile:	daddi	r1,r1,-1
	lb	r2,vectorA(r1)
	lb	r3,vectorB(r1)
	dadd	r4,r2,r3
	sb	r4,vectorSum(r1)
	bnez	r1,dwhile
	halt
