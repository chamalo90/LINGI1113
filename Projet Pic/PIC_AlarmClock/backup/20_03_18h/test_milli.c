/*
*	Projet PIC 2013 - Groupe 7
*	Julien Colmonts 	4163-08-00
*	Vincent Van Ouytsel 	1989-09-00
*/


#define __18F97J60
#define __SDCC__
#define THIS_INCLUDES_THE_MAIN_FUNCTION
#include "Include/HardwareProfile.h"
c
#include <string.h>
#include <stdlib.h>

#include "Include/LCDBlocking.h"
#include "Include/TCPIP_Stack/Delay.h"
#define LOW(a)     (a & 0xFF)
#define HIGH(a)    ((a>>8) & 0xFF)

/** PROGRAM STATES **/
#define STANDARD_STATE 0 // State showing current time & enable switch ON/OFF for alarm clock
#define SET_TIME_MENU 1 // First menu option, used to set time
#define SET_TIME_MINUTES 2 // SET_TIME chosen, setting minutes
#define SET_TIME_HOURS 3 // SET_TIME chosen, SET_TIME_MINUTES finished, setting hours
#define SET_ALARMCLOCK_MENU 4 // Second menu option, used to set alarm clock
#define SET_ALARMCLOCK_MINUTES 5 // SET_ALARMCLOCK chosen, setting minutes
#define SET_ALARMCLOCK_HOURS 6 // SET_ALARMCLOCK chosen, SET_ALARMCLOCK_MINUTES finished, setting hours
#define RINGING 7
/** END PROGRAM STATES **/


void ConfigTimer0(void);
void ConfigButtons(void);
void ConfigLed(void);

void UpdateTime(void);
void IsItTime(void);
void UpdateLCD(void);
void UpdateTimeStrings();
void ledAlarm(void);
void ConvertTime(short time, char* s);
void StartTimer1(void);

void DisplayString(BYTE pos, char* text);
void DisplayWORD(BYTE pos, WORD w);
void DisplayIPValue(DWORD IPdw);

size_t strlcpy(char *dst, const char *src, size_t siz);
unsigned short hours;
unsigned short minutes;
unsigned short seconds;
unsigned short milliSec;
unsigned short alarmHours;
unsigned short alarmMinutes;

unsigned short stateMenu;
unsigned short alarmStatus;
char LCDPrint[32];
char h[3];
char m[3];
char s[3];
char hA[3];
char mA[3];
char alarmState[9];

void main(void)
   {
	stateMenu = STANDARD_STATE;
	INTCONbits.GIE = 1; // Activation générale des interruptions
	RCONbits.IPEN = 1; //interrupts priority enable
	LCDInit(); // initialisation du LCD
	hours = 0;
	minutes = 0;
	seconds = 0;
	alarmHours = 0;
	alarmMinutes = 0;
	alarmStatus = 0;
	ConfigTimer0();
	ConfigButtons();
	ConfigLed();

   	while(1)
   	{
		UpdateTime();
		IsItTime();
		UpdateLCD();
		if(stateMenu == RINGING) ledAlarm();
   	}
}

/**************
Config Timer0
Le timer0 doit compter les secondes.
Fréquence théorique 25 MHz 
On doit donc :
- utiliser tous les bits de comptage disponibles
- compter avec la du microchip
*****************/
void ConfigTimer0(void){

	INTCON2bits.TMR0IP = 1; // Priorité Haute
	INTCONbits.TMR0IE = 1;	// Activation interruption Timer 0
	INTCONbits.TMR0IF = 0; // clear timer0 flag

	//Overflow toutes les s
	//Utilisation des 16 bits du TIMER0	
	T0CONbits.T08BIT = 0;		
	//Une incrémentation du TIMER0 dure 4 x période d'horlode (instruction machine)
	T0CONbits.T0CS = 0;	
	/* Une période d'horlode dure 40 nS (1/freq) --> une opération machine dure 4 x 40 nS = 160nS
	Il faut 1e9 s / 160 = 6250000 incrémentation du TIMER0 !! >> 65535

	Si diviseur par 256 --> 6250000 / 256 = 24414,0625 >> ok (Attention erreur d'arrondi)
	L'erreur = 0.0625 x 40 ns = 2.5 ns à chaque cycle de comptage. */
	T0CONbits.PSA = 0;
	T0CONbits.T0PS0 = 0; //Pas de diviseur
	T0CONbits.T0PS1 = 0;
	T0CONbits.T0PS2 = 0;
	//Valeur initiale du TIMER0 = 65536 - 24414 =  41122 (0XA0A2)
	TMR0H = 0xE7;
	TMR0L = 0x96;
	//Activation du TIMER0
	T0CONbits.TMR0ON = 1;
}

/******************************
Config Buttons
BUTTON 2 used to MENU/OK
BUTTON 1 used to increment/next
**************************/
void ConfigButtons(){
	INTCON3bits.INT1IP = 0; // Low priority interrupt for up butt
	INTCON2bits.INT3IP = 0; // Low priority interrupt for down butt
	INTCON2bits.INTEDG1 = 0; // Interrupt on falling edge
	INTCON2bits.INTEDG3 = 0; // Interrupt on falling edge
	INTCON3bits.INT3F = 0; // clear flag
	INTCON3bits.INT1F = 0; // clear flag	
	INTCON3bits.INT1E = 1; // Up button interrupt enable
	INTCON3bits.INT3E = 1; // Down button interrupt enable
	
}

void ConfigLed(){
	//Configure LED as output
	LED0_TRIS = 0;
	LED1_TRIS = 0;
	LED2_TRIS = 0;

	LED0_IO = 0;
	LED1_IO = 0;
	LED2_IO = 0;
}

/****************
Update Time
******************/
void UpdateTime(){
	if(milliSec>=1000){
		milliSec -= 1000;
		seconds++;
	}
	if(seconds>=60)
	{	
		seconds = 0;
		minutes++;
	}
	if(minutes == 60){
		minutes = 0;
		hours++;
	}
	if(hours > 23){
		hours = 0;
	}
	if(alarmMinutes == 60){
		alarmMinutes = 0;
	}
	if(alarmHours>23){
		alarmHours = 0;	
	}
}

void IsItTime(){
//ATTENTION, defaut si on pousse sur le bouton 1 au temps 0, alors true, pcq valeurs égales à l'intialisation
	if(alarmStatus & (hours == alarmHours) & (minutes == alarmMinutes)){
		stateMenu = RINGING;
	}
}

/**************
Update LCD
*****************/
void UpdateLCD(){
	switch(stateMenu){
		case STANDARD_STATE: 
			ConvertTime(hours, h);
			ConvertTime(minutes, m);
			ConvertTime(seconds, s);
			ConvertTime(alarmHours, hA);
			ConvertTime(alarmMinutes, mA);
		//	UpdateTimeStrings();
			if(alarmStatus){
				//sprintf(alarmState,"ON \0");
				sprintf(alarmState,"ON %sh%s\0",hA, mA);
			}else{
				sprintf(alarmState,"OFF     \0");
			}
			sprintf(LCDPrint,"    %s:%s:%s    Alarm %s",h,m,s,alarmState);
			break;
		case SET_TIME_MENU:
			sprintf(LCDPrint, "      MENU        Set time ?");
			break;
		case SET_TIME_MINUTES:
			ConvertTime(hours, h);
			ConvertTime(minutes, m);
			ConvertTime(seconds, s);
		//	UpdateTimeStrings();
			sprintf(LCDPrint,"Set Minutes     %s:[%s]:%s",h,m,s);
			break;
		case SET_TIME_HOURS :
			ConvertTime(hours, h);
			ConvertTime(minutes, m);
			ConvertTime(seconds, s);
		//	UpdateTimeStrings();
			sprintf(LCDPrint,"Set Hours       [%s]:%s:%s",h,m,s);
			break;
		case SET_ALARMCLOCK_MENU :			
			sprintf(LCDPrint, "      MENU      Set Alarmclock?");
			break;
		case SET_ALARMCLOCK_MINUTES :
			ConvertTime(alarmHours, h);
			ConvertTime(alarmMinutes, m);
			sprintf(LCDPrint,"Set Alarm Min    %s:[%s]",h,m);
			break;
		case SET_ALARMCLOCK_HOURS :
			ConvertTime(alarmHours, h);
			ConvertTime(alarmMinutes, m);
			sprintf(LCDPrint,"Set Alarm Hours  [%s]:%s",h,m);
			break;
		case RINGING :
			ConvertTime(hours, h);
			ConvertTime(minutes, m);
			ConvertTime(seconds, s);
		//	UpdateTimeStrings();
			sprintf(LCDPrint, "   It's Time !      %s:%s:%s",h,m,s);
			break;
	}
	DisplayString(0, LCDPrint);
}

/*void UpdateTimeStrings(){
	ConvertTime(hours, h);
	ConvertTime(minutes, m);
	ConvertTime(seconds, s);
}*/

void ledAlarm(){
	LED1_IO ^= 1;
	LED2_IO ^= 1;
}

/**************
Convert Time
**************/
void ConvertTime(short time, char* str){
	if(time<10){
		sprintf(str,"0%u\0",time);
	}else{
		sprintf(str,"%u\0",time);
	}
}

/****************
Config Timer1
On souhaite compter 0,5 secondes.
Il s'agit du temps d'attente entre chaque pression d'un bouton.
*******************/
/*void StartTimer1(void){
	T1CONbits.RD16 = 0; // Utilisation de 8 bits
	T1CONbits.T1RUN = 0; // Utilise l'oscillateur du TMR1
	T1CONbits.T1CKPS0 = 0; // désactiver le prescaler (1:1)
	T1CONbits.T1CKPS1 = 0;
	T1CONbits.T1OSCEN = 1; // Active l'oscillateur
	T1CONbits.TMR1CS = 1; // Utilise la clock de l'oscillateur.
	TMR1H = 0xC0; // On commence aux 3/4 de la valeur pour ne compter que 0,5 sec.

	PIE1bits.TMR1IE = 1; //enable timer1 interrupt
	IPR1bits.TMR1IP	= 1; //timer1 interrupt set to high priority
	PIR1bits.TMR1IF = 0; //clear timer1 flag bit

	T1CONbits.TMR1ON = 1;
}*/

/********************  HighPriorityInterrupt *******************************
ICI: GESTION DES INTERRUPTIONS DE HAUTE PRIORITE 
*************************************************************************/
void HighPriorityInterrupt(void) __interrupt (1)
{
	if (INTCONbits.TMR0IF)
	 //Check flag of Timer0 interrupt 
	{
		// Recharger la valeur de départ du timer0 pour 1s
		TMR0H = 0xE7; 
		TMR0L = 0x96;
		INTCONbits.TMR0IF = 0; // OBLIGATOIRE: Remettre le bit d'interruption à zéro
		milliSec++;
	}
	if (INTCON3bits.INT3F){ //Interupt Flag BUT1
		switch(stateMenu){
			case STANDARD_STATE:
				alarmStatus ^=1; // Enable/disable alarm
				LED0_IO ^= 1;
						break; // ADD SMTHNG TO STOP ALARM :)
			case SET_TIME_MENU:
				stateMenu = SET_TIME_MINUTES;
				break;
			case SET_TIME_MINUTES:
				minutes++;
				break;
			case SET_TIME_HOURS :
				hours++;
				break;
			case SET_ALARMCLOCK_MENU :
				stateMenu = SET_ALARMCLOCK_MINUTES;
				break;
			case SET_ALARMCLOCK_MINUTES :
				alarmMinutes++;
				break;
			case SET_ALARMCLOCK_HOURS :
				alarmHours++;
				break;
			case RINGING :
				stateMenu = STANDARD_STATE;
				alarmStatus = 0;
				LED0_IO = 0;
				LED1_IO = 0;
				LED2_IO = 0;
				break;
		}
		//Start Timer1
		//StartTimer1();
		
		INTCON3bits.INT3F = 0; // clear flag
		
	}
	if (INTCON3bits.INT1F){ //Interupt Flag BUT2
		switch(stateMenu){
			case STANDARD_STATE:
				stateMenu = SET_TIME_MENU;
				break; // ADD SMTHNG TO STOP ALARM :)
			case SET_TIME_MENU:
				stateMenu = SET_ALARMCLOCK_MENU;
				break;
			case SET_TIME_MINUTES:
				stateMenu = SET_TIME_HOURS;
				break;
			case SET_TIME_HOURS :
				stateMenu = STANDARD_STATE;
				break;
			case SET_ALARMCLOCK_MENU :
				stateMenu = STANDARD_STATE;
				break;
			case SET_ALARMCLOCK_MINUTES :
				stateMenu = SET_ALARMCLOCK_HOURS;
				break;
			case SET_ALARMCLOCK_HOURS :
				stateMenu = STANDARD_STATE;
				break;
			case RINGING :
				stateMenu = STANDARD_STATE;
				alarmStatus = 0;
				LED0_IO = 0;
				LED1_IO = 0;
				LED2_IO = 0;
				break;
		}
		// Start timer3
		//StartTimer1();
		INTCON3bits.INT1F = 0; // clear flag
	}


}

/******************** BASSEPRIORITEInterrupt ********************************
ICI: GESTION DES INTERRUPTIONS DE BASSE PRIORITE 
****************************************************************************/
void LowPriorityInterrupt(void) __interrupt (2)
{
/*	if (INTCON3bits.INT3F){ //Interupt Flag BUT1
		switch(stateMenu){
			case STANDARD_STATE:
				alarmStatus ^=1; // Enable/disable alarm
				LED0_IO ^= 1;
						break; // ADD SMTHNG TO STOP ALARM :)
			case SET_TIME_MENU:
				stateMenu = SET_TIME_MINUTES;
				break;
			case SET_TIME_MINUTES:
				minutes++;
				break;
			case SET_TIME_HOURS :
				hours++;
				break;
			case SET_ALARMCLOCK_MENU :
				stateMenu = SET_ALARMCLOCK_MINUTES;
				break;
			case SET_ALARMCLOCK_MINUTES :
				alarmMinutes++;
				break;
			case SET_ALARMCLOCK_HOURS :
				alarmHours++;
				break;
			case RINGING :
				stateMenu = STANDARD_STATE;
				alarmStatus = 0;
				LED0_IO = 0;
				LED1_IO = 0;
				LED2_IO = 0;
				break;
		}
		//Start Timer1
		//StartTimer1();
		
		INTCON3bits.INT3F = 0; // clear flag
		
	}
	if (INTCON3bits.INT1F){ //Interupt Flag BUT2
		switch(stateMenu){
			case STANDARD_STATE:
				stateMenu = SET_TIME_MENU;
				break; // ADD SMTHNG TO STOP ALARM :)
			case SET_TIME_MENU:
				stateMenu = SET_ALARMCLOCK_MENU;
				break;
			case SET_TIME_MINUTES:
				stateMenu = SET_TIME_HOURS;
				break;
			case SET_TIME_HOURS :
				stateMenu = STANDARD_STATE;
				break;
			case SET_ALARMCLOCK_MENU :
				stateMenu = STANDARD_STATE;
				break;
			case SET_ALARMCLOCK_MINUTES :
				stateMenu = SET_ALARMCLOCK_HOURS;
				break;
			case SET_ALARMCLOCK_HOURS :
				stateMenu = STANDARD_STATE;
				break;
			case RINGING :
				stateMenu = STANDARD_STATE;
				alarmStatus = 0;
				LED0_IO = 0;
				LED1_IO = 0;
				LED2_IO = 0;
				break;
		}
		// Start timer3
		//StartTimer1();
		INTCON3bits.INT1F = 0; // clear flag
	}

	/*if (PIR1bits.TMR1IF && INTCON3bits.INT1IF){
		//Timer1 let the delay of pression the button.
		//After waiting, reset button flag
		T1CONbits.TMR1ON = 0; // Stop timer1
		INTCON3bits.INT1IF = 0;
	}
	if (PIR1bits.TMR1IF && INTCON3bits.INT3IF){
		//Timer1 let the delay of pression the button.
		//After waiting, reset button flag
		T1CONbits.TMR1ON = 0; // Stop timer1
		INTCON3bits.INT3IF = 0;
	}*/

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
