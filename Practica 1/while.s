	.data
vectorA: .byte 0,1,2,3,4,5,6,7
vectorB: .byte 2,7,1,5,1,7,2,3
vectorSum: .space 8

	.text
main: 	
	daddi	r1,r0,8	; i = 8
	daddi	r2,r0,0 ; j = 0
while:	
	beqz	r1,end	; while(i>0)
	daddi	r1,r1,-1 ; i--
	lb	r3,vectorA(r2)
	lb	r4,vectorB(r2)
	dadd	r5,r3,r4
	sb	r5,vectorSum(r2)
	daddi	r2,r2,1 ; j++
	j	while
end:	
	halt
