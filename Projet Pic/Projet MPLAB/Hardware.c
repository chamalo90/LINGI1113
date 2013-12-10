#include "Hardware.h"
#include <p18cxxx.h>
#include <p18f97j60.h>

void Config_Hardware(void)
{
	
	//CONFIGURATION I/O
		
		// Configuration LED (RC2)
			Led_Config = Output_Port;		// Led en sortie	
	
}