#define __18F97J60
#define __SDCC__
#define THIS_INCLUDES_THE_MAIN_FUNCTION
#include "Include/HardwareProfile.h"

#include <string.h>
#include <stdlib.h>

#include "Include/LCDBlocking.h"
#include "Include/TCPIP_Stack/Delay.h"

#define LOW(a)     (a & 0xFF)
#define HIGH(a)    ((a>>8) & 0xFF)
void InitDisplay(void);
void ConfigTimer0(void);
void ConfigTimer1(void);
void LaunchTest(void);

void DisplayString(BYTE pos, char* text);
void DisplayWORD(BYTE pos, WORD w);
void DisplayIPValue(DWORD IPdw);
size_t strlcpy(char *dst, const char *src, size_t siz);

unsigned int Timer0_value;
char displayString[32];
 
void main(void)
{

	InitDisplay();
	ConfigTimer0();
	ConfigTimer1();
	DisplayString(0, "Starting Test !");
	LaunchTest();
}

/*************
Function Init Display
*********************/
void InitDisplay(void){
	LCDInit();
}

/**************
Config Timer0
Le timer0 doit compter le plus lentement possible pour ne pas overflow avant le Timer1
On doit donc :
- utiliser tous les bits de comptage disponibles
- compter avec la clock du microchip
- activer le prescaler
- le régler pour diviser le comptage par 256
/!\ on ne l'active en "même temps" (une instruction prêt) que le Timer1, une fois les réglages terminés.
*****************/
void ConfigTimer0(void){
	T0CONbits.T08BIT = 0; 	//Utilisation des 16 bits du TIMER0	
	T0CONbits.T0CS = 0; // Comptage à partir de l'horloge
	T0CONbits.PSA = 0; // activation du prescaler
	T0CONbits.T0PS0 = 1; // diviseur par 256 
	T0CONbits.T0PS1 = 1;
	T0CONbits.T0PS2 = 1;
	TMR0L = 0; // on compte à partir de zero
	TMR0H = 0;
}

/****************
Config Timer1
Le timer1 lance une interruption à 1 sec si son oscillateur propre fait l'incrémentation.
On doit donc :
- compter sur 8-bits
- compter avec l'oscillateur
- désactiver le prescaler
- allumer l'oscillateur
*******************/
void ConfigTimer1(void){
	T1CONbits.RD16 = 0; // Utilisation de 8 bits
	T1CONbits.T1RUN = 0; // Utilise l'oscillateur du TMR1
	T1CONbits.T1CKPS0 = 0; // désactiver le prescaler (1:1)
	T1CONbits.T1CKPS1 = 0;
	T1CONbits.T1OSCEN = 1; // Active l'oscillateur
	T1CONbits.TMR1CS = 1; // Utilise la clock de l'oscillateur.
	TMR1H = 0x80; // On commence à la moitié de la valeur max sinon le timer compte 2 secondes.
}

/******************
Launching Test
- Activer tous les bits d'interruption necessaires
- Allumer la led
- Lancer le timer0 et le timer1.
******************/
void LaunchTest(){
	INTCONbits.GIE = 1; // Global interrupt enable
	RCONbits.IPEN = 1; //interrupts priority enable

	PIE1bits.TMR1IE = 1; //enable timer1 interrupt
	IPR1bits.TMR1IP	= 1; //timer1 interrupt set to high priority
	PIR1bits.TMR1IF = 0; //clear timer1 flag bit
	
	T1CONbits.TMR1ON = 1; // Start timer1
	T0CONbits.TMR0ON = 1; // Start timer0
}

// ********************  HighPriorityInterrupt *******************************
// 	ICI: GESTION DES INTERRUPTIONS DE HAUTE PRIORITE 
// ****************************************************************************
void HighPriorityInterrupt(void) interrupt 1
{
	Timer0_value = (TMR0H << 8) + TMR0L; // get counted value from Timer0


	if (PIR1bits.TMR1IF) //Check flag of Timer1 interrupt 
	{
		T0CONbits.TMR0ON = 0; // Stops Timer0
		T1CONbits.TMR1ON = 0; // Stops Timer1

		sprintf(displayString, "Val: %u",Timer0_value);
		DisplayString(0,displayString);
	}
}
 
/*************************************************
 Function DisplayWORD:
 writes a WORD in hexa on the position indicated by
 pos. 
 - pos=0 -> 1st line of the LCD
 - pos=16 -> 2nd line of the LCD

 __SDCC__ only: for debugging
*************************************************/
#if defined(__SDCC__)
void DisplayWORD(BYTE pos, WORD w) //WORD is a 16 bits unsigned
{
    BYTE WDigit[6]; //enough for a  number < 65636: 5 digits + \0
    BYTE j;
    BYTE LCDPos=0;  //write on first line of LCD
    unsigned radix=10; //type expected by sdcc's ultoa()

    LCDPos=pos;
    ultoa(w, WDigit, radix);      
    for(j = 0; j < strlen((char*)WDigit); j++)
    {
       LCDText[LCDPos++] = WDigit[j];
    }
    if(LCDPos < 32u)
       LCDText[LCDPos] = 0;
    LCDUpdate();
}
/*************************************************
 Function DisplayString: 
 Writes an IP address to string to the LCD display
 starting at pos
*************************************************/
void DisplayString(BYTE pos, char* text)
{
   BYTE l= strlen(text)+1;
   BYTE max= 32-pos;
   strlcpy((char*)&LCDText[pos], text,(l<max)?l:max );
   LCDUpdate();

}
#endif


/*-------------------------------------------------------------------------
 *
 * strlcpy.c
 *    strncpy done right
 *
 * This file was taken from OpenBSD and is used on platforms that don't
 * provide strlcpy().  The OpenBSD copyright terms follow.
 *-------------------------------------------------------------------------
 */

/*  $OpenBSD: strlcpy.c,v 1.11 2006/05/05 15:27:38 millert Exp $    */

/*
 * Copyright (c) 1998 Todd C. Miller <Todd.Miller@courtesan.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
 
/*
 * Copy src to string dst of size siz.  At most siz-1 characters
 * will be copied.  Always NUL terminates (unless siz == 0).
 * Returns strlen(src); if retval >= siz, truncation occurred.
 * Function creation history:  http://www.gratisoft.us/todd/papers/strlcpy.html
 */
size_t
strlcpy(char *dst, const char *src, size_t siz)
{
    char       *d = dst;
    const char *s = src;
    size_t      n = siz;

    /* Copy as many bytes as will fit */
    if (n != 0)
    {
        while (--n != 0)
        {
            if ((*d++ = *s++) == '\0')
                break;
        }
    }

    /* Not enough room in dst, add NUL and traverse rest of src */
    if (n == 0)
    {
        if (siz != 0)
            *d = '\0';          /* NUL-terminate dst */
        while (*s++)
            ;
    }

    return (s - src - 1);       /* count does not include NUL */
}
