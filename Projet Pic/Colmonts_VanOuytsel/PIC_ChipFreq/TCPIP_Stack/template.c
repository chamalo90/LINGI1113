#define __18F97J60
#define __SDCC__
#include <pic18f97j60.h> //ML

#include "../Include/TCPIPConfig.h"
#include "../Include/TCPIP_Stack/TCPIP.h"

for(iml=0;iml<6;iml++)  //ML
   Cache.MACAddr.v[iml] = packet.SenderMACAddr.v[iml]; //ML

	memcpy(&(packet.TargetMACAddr), (void*)&(Target.MACAddr), sizeof(MAC_ADDR)); 
