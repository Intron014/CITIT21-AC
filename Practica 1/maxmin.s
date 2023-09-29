	.data
vector: .byte	1,2,3,4,5,6,7,0
number: .byte	8
	.text
	; CNT --> r1
	; MIN --> r3
	; MAX --> r4
	; CURRENT r5
	; CMP --> r8
	; AUX --> r9
	; 8 ----> r15
init:
	daddi	r15,r0,number
	daddi	r1,r0,0		
	lb	r5,vector(r1)	
	daddi	r3,r5,0	
	daddi	r1,r1,1
	lb	r5,vector(r1)
	slt	r8,r3,r5
	bnez	r8,cnt1
	; Cambiamos MAX por MIN
	daddi	r4,r3,0
	daddi	r3,r5,0
cnt1:
	daddi	r1,r1,1
	slt	r8,r1,r15
	beqz	r8,end
	lb	r5,vector(r1)
	slt	r8,r5,r3
	bnez	r8,cnt2
	daddi	r3,r5,0
cnt2:
	slt	r8,r4,r5
	bnez	r8,cnt3
	daddi	r4,r5,0
cnt3:
	j cnt1
end:
	halt
