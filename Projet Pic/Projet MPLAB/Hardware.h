#ifndef __HARDWARE_H
#define __HARDWARE_H


// DEFINE
// LED allumée
#define LED_ON 1
// LED éteinte
#define LED_OFF 0

#define Input_Port		 1
#define Output_Port		 0

#define Led				 PORTJbits.RJ0
#define Led_Config		 TRISJbits.TRISJ0
 




/******************************************************************
** 	        		  FUNCTION PROTOTYPES	    	  			 **
******************************************************************/

void Config_Hardware(void);

#endif
