; Programa que calcula el factorial del numero, mayor
; que cero, almacenado en Num. El calculo se realiza
; mediante iteraciones y el resultado se almacena en Res.

	.data

Num:	.byte	0
Res:	.word	0

	.text

	lb	r1,Num(r0)
	bnez 	r1,proce
	daddi 	r2,r0,1
	sd 	r2,Res(r0)
	halt
proce:	daddi	r2,r0,1
sigue:	dmul	r2,r2,r1	
	daddi	r1,r1,-1
	bnez	r1,sigue
	sd	r2,Res(r0)
	halt
