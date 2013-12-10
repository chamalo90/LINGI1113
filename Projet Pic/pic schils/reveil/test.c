/*
Julien Bergiers
Arnaud Schils
----------------

f_pic = 26,2 MHz
inst/s = 6550000

Avec prescaler 128, overflow toutes les 1,2807s du tmr0
Valeur initiale du tmr0 doit etre: (65536/12807) * 2807 = 14364

*/

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

#define INIT 0
#define SHOW_TIME 1
#define CONFIG_CLOCK 2
#define CONFIG_ALARM 3
#define CONFIG_CLOCK_HOUR 4
#define CONFIG_CLOCK_MINUTE 5
#define CONFIG_ALARM_ON_OFF 6
#define CONFIG_ALARM_HOUR 7
#define CONFIG_ALARM_MINUTE 8

void DisplayString(BYTE pos, char* text);
void DisplayWORD(BYTE pos, WORD w);
void DisplayIPValue(DWORD IPdw);
size_t strlcpy(char *dst, const char *src, size_t siz);
void update_lcd();
void convert_value(int value, char* r);

int ring_today = 0;
int alarm_set = 0;
int alarm_ring = 0;
int state = 0;

int hour = 0;
int minute = 0;
int second = 0;
int alarm_hour = 0;
int alarm_minute = 0;
int blink = 1;

void high_isrr (void) interrupt 1{

	if(INTCONbits.T0IF){
	 
		TMR0L = LOW(14364);
		TMR0H = HIGH(14364);
		 
		INTCONbits.T0IF = 0;
		
		blink^=1;
		update_lcd();
		
		if(alarm_ring){ LED1_IO ^= 1; LED2_IO ^= 1; }
		else{ LED1_IO = 0; LED2_IO = 0; }
		if(state == SHOW_TIME) LED0_IO ^=1;
		else LED0_IO = 0;

		if(state == SHOW_TIME) check_alarm();
		if(state != CONFIG_CLOCK_HOUR && state!=CONFIG_CLOCK_MINUTE) add_second();
		
		INTCON3bits.INT1F  = 0;   //clear INT1 flag
	}
	// Up button (Menu/Next)
	else if(INTCON3bits.INT1F){

		// State: SHOW TIME -> CONFIG CLOCK
		if(state == SHOW_TIME){			

			if(alarm_ring){

				alarm_set = 0; 
				alarm_ring = 0;

			}else state = CONFIG_CLOCK;

			update_lcd();

		// State: CONFIG CLOCK -> CONFIG ALARM
		}else if(state == CONFIG_CLOCK){			

			state = CONFIG_ALARM;
			update_lcd();

		// State: CONFIG ALARM -> SHOW TIME
		}else if(state == CONFIG_ALARM){			

			state = SHOW_TIME;
			update_lcd();

		// State: CONFIG CLOCK HOUR -> CONFIG CLOCK MINUTE
		}else if(state == CONFIG_CLOCK_HOUR){			

			state = CONFIG_CLOCK_MINUTE;
			update_lcd();

		// State: CONFIG CLOCK MINUTE -> SHOW TIME
		}else if(state == CONFIG_CLOCK_MINUTE){		

			ring_today = 0;
			second = 0;
			state = SHOW_TIME;
			update_lcd();

		// State: CONFIG ALARM ON/OFF -> CONFIG ALARM HOUR
		}else if(state == CONFIG_ALARM_ON_OFF){			

			if(alarm_set) state = CONFIG_ALARM_HOUR;
			else state = SHOW_TIME;
			
			update_lcd();

 		// State: CONFIG ALARM HOUR -> CONFIG ALARM MINUTE
		}else if(state == CONFIG_ALARM_HOUR){			

			state = CONFIG_ALARM_MINUTE;
			update_lcd();
 
		// State: CONFIG ALARM MINUTE -> SHOW TIME
		}else if(state == CONFIG_ALARM_MINUTE){		

			ring_today = 0;
			state = SHOW_TIME;
			update_lcd();

		}

		// Clear INT1 flag
        	INTCON3bits.INT1F = 0;		
	 
	// Down button (Add/Choose)
	}else if(INTCON3bits.INT3F == 1){	

		// State: SHOW TIME
		if(state==SHOW_TIME){

			alarm_ring = 0;
			if(alarm_set) alarm_set = 0;
			else alarm_set = 1;
			update_lcd();

		// State: CONFIG CLOCK -> CONFIG CLOCK HOUR
		}else if(state == CONFIG_CLOCK){			

			state = CONFIG_CLOCK_HOUR;
			update_lcd();

		// State: CONFIG ALARM -> CONFIG ALARM ON/OFF
		}else if(state == CONFIG_ALARM){			

			state = CONFIG_ALARM_ON_OFF;
			update_lcd();

		// State: CONFIG CLOCK HOUR -> HOUR++
		}else if(state == CONFIG_CLOCK_HOUR){			

			hour++;
			if(hour>=24) hour = 0;

			update_lcd();

		// State: CONFIG CLOCK MINUTE -> MINUTE++
		}else if(state == CONFIG_CLOCK_MINUTE){		

			minute++;
			if(minute>=60) minute = 0;

			update_lcd();

		// State: CONFIG ALARM ON/OFF -> ALARM_SET=ON/OFF
		}else if(state == CONFIG_ALARM_ON_OFF){			

			if(alarm_set) alarm_set = 0;
			else alarm_set = 1;
			update_lcd();

		// State: CONFIG ALARM HOUR -> ALARM_HOUR++
		}else if(state == CONFIG_ALARM_HOUR){			

			alarm_hour++;
			if(alarm_hour>=24) alarm_hour = 0;

			update_lcd();

		// State: CONFIG ALARM MINUTE -> ALARM_MINUTE++
		}else if(state == CONFIG_ALARM_MINUTE){		

			alarm_minute++;
			if(alarm_minute>=60) alarm_minute = 0;

			update_lcd();

		}
		
		// Clear INT3 flag
		INTCON3bits.INT3F  = 0;		

	}

}

void timer0_conf(){
	T0CONbits.T08BIT = 0;  //use timer0 16-bit counter
	T0CONbits.T0CS = 0;  //use timer0 instruction cycle clock
	INTCONbits.TMR0IE = 1; // enable timer0 interrupt
	T0CONbits.PSA = 0;  //enable timer0 prescaler
	
	T0CONbits.T0PS2 = 1;
	T0CONbits.T0PS1 = 1;
	T0CONbits.T0PS0 = 0;
	
	TMR0L = LOW(14364);
	TMR0H = HIGH(14364);
}

void main(void){

	timer0_conf();	
	
	LED0_TRIS = 0; //configure 1st led pin as output (yellow)
	LED1_TRIS = 0; //configure 2nd led pin as output (red)
	LED2_TRIS = 0; //configure 3rd led pin as output (red)

	RCONbits.IPEN      = 1;   //enable interrupts priority levels
	INTCON2bits.INTEDG1= 0;   //INT1 interrupts on falling edge
	INTCONbits.GIE     = 1;   //enable high priority interrupts

	INTCON3bits.INT1E  = 1;   //enable INT1 interrupt (button 2)
	INTCON3bits.INT1F  = 0;   //clear INT1 flag

	INTCON3bits.INT3E  = 1;   //enable INT1 interrupt (button 2)
	INTCON3bits.INT3F  = 0;   //clear INT1 flag

    LCDInit();
          
	state = CONFIG_CLOCK_HOUR;   
	blink^=1;
	update_lcd();      
	T0CONbits.TMR0ON = 1;
}

void check_alarm(){

	if(alarm_set && !ring_today && hour == alarm_hour && minute == alarm_minute){

		alarm_ring = 1;
		ring_today = 1;

	}

}

void update_lcd(){

	char lcd[32];

	char h[3];
	char m[3];
	char s[3];
	char a_h[3];
	char a_m[3];
	
	// State: INIT
	if(state==0){		

		sprintf(lcd, " STARTING...    ");

	// State: SHOW TIME
	}else if(state==SHOW_TIME){	

		convert_value(hour, h);
		convert_value(minute, m);
		convert_value(second, s);


		if(alarm_ring){

			if(blink) sprintf(lcd, 	" !! %s:%s:%s !!  WAKE UP! DUDE! ", h, m, s);
			else sprintf(lcd, 	"    %s:%s:%s     WAKE UP! DUDE! ", h, m, s);

		}else if(alarm_set){
			
			convert_value(alarm_hour, a_h);
			convert_value(alarm_minute, a_m);
			sprintf(lcd, "    %s:%s:%s     ALARM  [%s:%s]", h, m, s, a_h, a_m);

		}else{

			sprintf(lcd, "    %s:%s:%s       ALARM: OFF", h, m, s);

		}

	// State: CONFIG CLOCK
	}else if(state == CONFIG_CLOCK){	

		sprintf(lcd, "      MENU        CHANGE CLOCK?");

	// State: CONFIG ALARM
	}else if(state == CONFIG_ALARM){	

		sprintf(lcd, "      MENU        CHANGE ALARM?");

	// State: CONFIG CLOCK HOUR
	}else if(state == CONFIG_CLOCK_HOUR){	

		convert_value(hour, h);
		convert_value(minute, m);

		if(blink) sprintf(lcd, "SET CLOCK:          [%s]: %s", h, m);
		else sprintf(lcd, "SET CLOCK:           %s : %s", h, m);	

	// State: CONFIG CLOCK MINUTE
	}else if(state == CONFIG_CLOCK_MINUTE){	

		convert_value(hour, h);
		convert_value(minute, m);

		if(blink) sprintf(lcd, "SET CLOCK:           %s :[%s]", h, m);
		else sprintf(lcd, "SET CLOCK:           %s : %s", h, m);	

	// State: CONFIG ALARM ON/OFF
	}else if(state == CONFIG_ALARM_ON_OFF){	

		if(alarm_set) sprintf(lcd, "SET ALARM:            [ON ]");
		else sprintf(lcd, "SET ALARM:            [OFF]");	

	// State: CONFIG ALARM HOUR
	}else if(state == CONFIG_ALARM_HOUR){	

		convert_value(alarm_hour, h);
		convert_value(alarm_minute, m);

		if(blink) sprintf(lcd, "SET ALARM:          [%s]: %s", h, m);
		else sprintf(lcd, "SET ALARM:           %s : %s", h, m);	

	// State: CONFIG ALARM MINUTE
	}else if(state == CONFIG_ALARM_MINUTE){	

		convert_value(alarm_hour, h);
		convert_value(alarm_minute, m);

		if(blink) sprintf(lcd, "SET ALARM:           %s :[%s]", h, m);
		else sprintf(lcd, "SET ALARM:           %s : %s", h, m);	

	}
	
	DisplayString (0, lcd);

}

void add_second(){

	second++;
	if(second>=60){
		second = 0;		
		add_minute();
	}

}

void add_minute(){

	minute++;
	if(minute>=60){
		minute = 0;		
		add_hour();
	}

}

void add_hour(){

	hour++;
	if(hour>=24){ 
		hour = 0;		
		ring_today = 0;
	}

}
 
void convert_value(int value, char* r){

	if(value<=9) sprintf(r, "0%d", value);
	else sprintf(r, "%d", value);

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

