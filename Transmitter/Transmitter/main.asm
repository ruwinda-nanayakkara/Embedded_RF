;
; Transmitter.asm
;
; Created: 2/13/2023 5:59:56 PM
; Author : Ruwinda Nanayakkara
;

.include "m328pdef.inc"

.ORG 0					;location for reset
	JMP	MAIN
.ORG 0x02				;location for external interrupt 0
	JMP	EX0_ISR	
.ORG 0x04
	JMP EX1_ISR

MAIN:
	LDI R20,HIGH(RAMEND)	; Initalizing the stack
	OUT SPH,R20
	LDI R20,LOW(RAMEND)
	OUT SPL,R20
	SBI DDRD,6				;Set PD6/OC0A as output
	CBI DDRD,2				;Set PD2 as input
	CBI DDRD,3				;Set PD3 as input
	LDI	R20,0x00		;make INT0 low level triggered
	STS	EICRA,R20		
	LDI R20,1<<PD2 | 1<<PD3 ;Pull up register enable PORTD
	OUT PORTD,R20
	LDI	R20,1<<INT0 | 1<<INT1		;enable INT0 and INT1
	OUT	EIMSK,R20
	SEI
	LDI R16,0
	OUT TCNT0,R16
	LDI R20,0xBC
	OUT OCR0A,R20
	LDI R20,0x43
	OUT TCCR0A,R20
	LDI R20,0x0D
	OUT TCCR0B,R20
AGAIN:RJMP AGAIN

EX0_ISR:
	LDI R16,0XFF
	OUT TCNT0,R16
	LDI R20,0xFF
	OUT OCR0A,R20
	LDI R20,0x43
	OUT TCCR0A,R20
	LDI R20,0x0D
	OUT TCCR0B,R20
HERE: SBIS PIND,2
	RJMP HERE
	LDI R20,0xBC
	OUT OCR0A,R20
	RETI

EX1_ISR:
	LDI R16,0XFF
	OUT TCNT0,R16
	LDI R20,0xFF
	OUT OCR0A,R20
	LDI R20,0x43
	OUT TCCR0A,R20
	LDI R20,0x0D
	OUT TCCR0B,R20
HERE1: SBIS PIND,3
	RJMP HERE1
	LDI R20,0xBC
	OUT OCR0A,R20
	RETI