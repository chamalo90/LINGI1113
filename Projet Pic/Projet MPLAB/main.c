// Exercice 1

// INCLUDES

// LIBRAIRIE STANDARD MPLABC18
#include <p18cxxx.h>
#include <p18f97j60.h>

#include <delays.h>

// LIBRAIRIE PERSONNELLE
#include "Hardware.h"
#include "My_TIMERS.h"

// DIRECTIVES COMPILATIONS
/*
#pragma config LVP = OFF  //Programmation in situ (ICSP) en basse tension
#pragma config PWRTEN = OFF //Timer de démarrage
#pragma config WDTEN = OFF  //Chien de garde désactivé
#pragma config BOREN = OFF  //Détection de fluctuation d'alimentation (Brown-out) 
#pragma config IESO = OFF	//apres PWRT et POR voir datasheet page42
*/
//DEFINE 

//VARIABLES GLOBALES

//FONCTIONS INTERNES
void HAUTEPRIORITEInterrupt(void);
void BASSEPRIORITEInterrupt(void);



// ************* PLACEMENT DU CODE DE L'INTERRUPTION  HAUTE PRIORITE  *************
// 		On déclare que lors d'une interruption on doit exécuter 
// 		le code de la fonction HAUTEPRIORITEInterrupt
// ********************************************************************************
#pragma code toto=0x0008
void tata(void)
 {
  _asm GOTO HAUTEPRIORITEInterrupt _endasm		
 }
#pragma code // retour à la zone de code


// ************* PLACEMENT DU CODE DE L'INTERRUPTION  BASSE PRIORITE  *************
// 		On déclare que lors d'une interruption on doit exécuter 
// 		le code de la fonction BASSEPRIORITEInterrupt
// ********************************************************************************
#pragma code tutu=0x0018
void titi(void)
 {
  _asm GOTO BASSEPRIORITEInterrupt _endasm		
 }
#pragma code // retour à la zone de code




// PROGRAMME PRINCIPAL
void main()
{   
	//CONFIGURATION HARDWARE PCB_2012_2013
		Config_Hardware();
		Led = LED_OFF; 			// Led off au démarrage
	//CONFIGURATION TIMER0 + Interruption Haute
		TIMER0_1s();
		INTCON2bits.TMR0IP = 1; // Priorité Haute
		INTCONbits.TMR0IE = 1;	// Activation interruption Timer 0
		INTCONbits.GIE = 1;		// Activation générale des interruptions

	//ETAT INITIAL LED
		Led = 0;	// Led éteinte
	

	//-----------------------------------
	// MAIN LOOP 
	//-----------------------------------
  	while(1)
	{
	
		Delay1TCY();
		//Delay1TCY();
	}
}

	
// ********************  HAUTEPRIORITEInterrupt *******************************
// 				ICI: GESTION DES INTERRUPTIONS DE HAUTE PRIORITE 
// ****************************************************************************
#pragma interrupt HAUTEPRIORITEInterrupt 
void HAUTEPRIORITEInterrupt(void)
{
 // *****************************************
 // INTERRUPTION DE TIMER0 (toutes les 1s)
 // *****************************************
 if (INTCONbits.TMR0IF) 
  {
		Led = !Led;	//On inverse l'état de la LED
		// Recharger la valeur de départ du timer0 pour 1s
		TMR0H = 0xA0;
		TMR0L = 0xA2;
		INTCONbits.TMR0IF = 0; // OBLIGATOIRE: Remettre le bit d'interruption à zéro	
  }
}



 
// ******************** BASSEPRIORITEInterrupt ********************************
// 				ICI: GESTION DES INTERRUPTIONS DE BASSE PRIORITE 
// ****************************************************************************
#pragma interrupt BASSEPRIORITEInterrupt 
void BASSEPRIORITEInterrupt(void)
{
 
}









