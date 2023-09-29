	.data
vectorA: .byte 1,2,5,3,2,7,9,6
vectorB: .byte 1,2,5,3,2,7,9,6
vectorSum: .space 8

	.text
init:
	daddi	r1,r0,0		; i = 0
	daddi	r2,r0,8		; Inicializar el 8
for:	
	slt	r3,r1,r2	; Si i<8 r3=1, else r3=0
	beqz	r3,end		; Si r3=0 --> end
	
	lb	r4,vectorA(r1)	; r4 = vectorA[i]
	lb	r5,vectorB(r1)	; r5 = vectorB[i]
	dadd	r6,r4,r5	; r6 = r4 + r5
	sb	r6,vectorSum(r1)
	
	daddi	r1,r1,1		; i++
	j	for		; for again
end:
	halt
