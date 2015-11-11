.globl clock_init

clock_init:
	
	ldr r0, =0x7E00F000
	ldr r1, =0x0000FFFF
	str r1, [r0]

	str r1, [r0, #4]
	str r1, [r0, #8]

#define OTHERS
	@set async mode
	ldr r0, =OTHERS
	ldr r1, [r0]
	bic r1, #0xc0
	str r1, [r0]

loop1:
	ldr r0, =OTHERS
	ldr r1, [r0]
	and r1, #0xf00
	cmp r1, #0
	bne loop1

#define ARM_RATIO	 0
#define HCLKX2_RATIO 1
#define HCLK_RATIO   1
#define PCLK_RATIO   3
#define MPLL_RATIO   0

	ldr r0, =0x7E00F020
	ldr r1, =(ARM_RATIO)|(MPLL_RATIO << 4)(HCLKX2_RATIO << 9)|(PCLK_RATIO << 12)
	str r1, [r0]

#define APLL_CON_VAL 	((1<<31) | (266<<16) | (3<<8) (1))
	ldr r0, =0x7E00F00C
	ldr r1, =APLL_CON_VAL
	str r1, [r0]

#define MPLL_CON_VAL 	((1<<31) | (266<<16) | (3<<8) |(1))
	ldr r0, =0x7E00F010
	ldr r1, =MPLL_CON_VAL
	str r1, [r0]
	
	ldr r0, =0x7E00F01C
	ldr r1, =0x03
	str r1, [r0]

	mov pc, lr
