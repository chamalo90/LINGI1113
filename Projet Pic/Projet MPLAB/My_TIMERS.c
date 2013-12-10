#include <p18cxxx.h>
#include <p18f97j60.h>
#include "My_TIMERS.h"

void TIMER0_1s(void)
{
	//Overflow toutes les s
	//Utilisation des 16 bits du TIMER0	
	T0CONbits.T08BIT = 0;		
	//Une incrémentation du TIMER0 dure 4 x période d'horlode (instruction machine)
	T0CONbits.T0CS = 0;	
	/* Une période d'horlode dure 40 nS --> une opération machine dure 4 x 40 nS = 160nS
	Il faut 1e9 / 160 = 6250000 incrémentation du TIMER0 !! >> 65535

	Si diviseur par 256 --> 6250000 / 256 = 24414,0625 >> ok (Attention erreur d'arrondi)
	L'erreur = 0.0625 x 40 ns = 2.5 ns à chaque cycle de comptage. */
	T0CONbits.PSA = 0;
	T0CONbits.T0PS = 0b111; 	// diviseur par 256 
	//Valeur initiale du TIMER0 = 65536 - 24414 =  41122 (0XA0A2)
	TMR0H = 0xA0;
	TMR0L = 0xA2;
	//Activation du TIMER0
	T0CONbits.TMR0ON = 1;		
}
