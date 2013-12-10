;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Mar 16 2013) (UNIX)
; This file was generated Wed Mar 27 15:09:44 2013
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f97j60

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _ConfigTimer0
	global _ConfigButtons
	global _ConfigLed
	global _UpdateTime
	global _IsItTime
	global _UpdateLCD
	global _SwitchLedState
	global _ConvertTime
	global _DisplayWORD
	global _DisplayString
	global _strlcpy
	global _hours
	global _minutes
	global _seconds
	global _milliSec
	global _alarmHours
	global _alarmMinutes
	global _stateMenu
	global _alarmStatus
	global _alarmDelay
	global _alarmCheck
	global _LCDPrint
	global _h
	global _m
	global _s
	global _hA
	global _mA
	global _alarmState
	global _main
	global _HighPriorityInterrupt
	global _LowPriorityInterrupt

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrget1
	extern __gptrput1
	extern _EBSTCONbits
	extern _MISTATbits
	extern _EFLOCONbits
	extern _MACON1bits
	extern _MACON2bits
	extern _MACON3bits
	extern _MACON4bits
	extern _MACLCON1bits
	extern _MACLCON2bits
	extern _MICONbits
	extern _MICMDbits
	extern _EWOLIEbits
	extern _EWOLIRbits
	extern _ERXFCONbits
	extern _EIEbits
	extern _ESTATbits
	extern _ECON2bits
	extern _EIRbits
	extern _EDATAbits
	extern _SSP2CON2bits
	extern _SSP2CON1bits
	extern _SSP2STATbits
	extern _ECCP2DELbits
	extern _ECCP2ASbits
	extern _ECCP3DELbits
	extern _ECCP3ASbits
	extern _RCSTA2bits
	extern _TXSTA2bits
	extern _CCP5CONbits
	extern _CCP4CONbits
	extern _T4CONbits
	extern _ECCP1DELbits
	extern _BAUDCON2bits
	extern _BAUDCTL2bits
	extern _BAUDCONbits
	extern _BAUDCON1bits
	extern _BAUDCTLbits
	extern _BAUDCTL1bits
	extern _PORTAbits
	extern _PORTBbits
	extern _PORTCbits
	extern _PORTDbits
	extern _PORTEbits
	extern _PORTFbits
	extern _PORTGbits
	extern _PORTHbits
	extern _PORTJbits
	extern _LATAbits
	extern _LATBbits
	extern _LATCbits
	extern _LATDbits
	extern _LATEbits
	extern _LATFbits
	extern _LATGbits
	extern _LATHbits
	extern _LATJbits
	extern _DDRAbits
	extern _TRISAbits
	extern _DDRBbits
	extern _TRISBbits
	extern _DDRCbits
	extern _TRISCbits
	extern _DDRDbits
	extern _TRISDbits
	extern _DDREbits
	extern _TRISEbits
	extern _DDRFbits
	extern _TRISFbits
	extern _DDRGbits
	extern _TRISGbits
	extern _DDRHbits
	extern _TRISHbits
	extern _DDRJbits
	extern _TRISJbits
	extern _OSCTUNEbits
	extern _MEMCONbits
	extern _PIE1bits
	extern _PIR1bits
	extern _IPR1bits
	extern _PIE2bits
	extern _PIR2bits
	extern _IPR2bits
	extern _PIE3bits
	extern _PIR3bits
	extern _IPR3bits
	extern _EECON1bits
	extern _RCSTAbits
	extern _RCSTA1bits
	extern _TXSTAbits
	extern _TXSTA1bits
	extern _PSPCONbits
	extern _T3CONbits
	extern _CMCONbits
	extern _CVRCONbits
	extern _ECCP1ASbits
	extern _CCP3CONbits
	extern _ECCP3CONbits
	extern _CCP2CONbits
	extern _ECCP2CONbits
	extern _CCP1CONbits
	extern _ECCP1CONbits
	extern _ADCON2bits
	extern _ADCON1bits
	extern _ADCON0bits
	extern _SSP1CON2bits
	extern _SSPCON2bits
	extern _SSP1CON1bits
	extern _SSPCON1bits
	extern _SSP1STATbits
	extern _SSPSTATbits
	extern _T2CONbits
	extern _T1CONbits
	extern _RCONbits
	extern _WDTCONbits
	extern _ECON1bits
	extern _OSCCONbits
	extern _T0CONbits
	extern _STATUSbits
	extern _INTCON3bits
	extern _INTCON2bits
	extern _INTCONbits
	extern _STKPTRbits
	extern _stdin
	extern _stdout
	extern _LCDText
	extern _MAADR5
	extern _MAADR6
	extern _MAADR3
	extern _MAADR4
	extern _MAADR1
	extern _MAADR2
	extern _EBSTSD
	extern _EBSTCON
	extern _EBSTCS
	extern _EBSTCSL
	extern _EBSTCSH
	extern _MISTAT
	extern _EFLOCON
	extern _EPAUS
	extern _EPAUSL
	extern _EPAUSH
	extern _MACON1
	extern _MACON2
	extern _MACON3
	extern _MACON4
	extern _MABBIPG
	extern _MAIPG
	extern _MAIPGL
	extern _MAIPGH
	extern _MACLCON1
	extern _MACLCON2
	extern _MAMXFL
	extern _MAMXFLL
	extern _MAMXFLH
	extern _MICON
	extern _MICMD
	extern _MIREGADR
	extern _MIWR
	extern _MIWRL
	extern _MIWRH
	extern _MIRD
	extern _MIRDL
	extern _MIRDH
	extern _EHT0
	extern _EHT1
	extern _EHT2
	extern _EHT3
	extern _EHT4
	extern _EHT5
	extern _EHT6
	extern _EHT7
	extern _EPMM0
	extern _EPMM1
	extern _EPMM2
	extern _EPMM3
	extern _EPMM4
	extern _EPMM5
	extern _EPMM6
	extern _EPMM7
	extern _EPMCS
	extern _EPMCSL
	extern _EPMCSH
	extern _EPMO
	extern _EPMOL
	extern _EPMOH
	extern _EWOLIE
	extern _EWOLIR
	extern _ERXFCON
	extern _EPKTCNT
	extern _EWRPT
	extern _EWRPTL
	extern _EWRPTH
	extern _ETXST
	extern _ETXSTL
	extern _ETXSTH
	extern _ETXND
	extern _ETXNDL
	extern _ETXNDH
	extern _ERXST
	extern _ERXSTL
	extern _ERXSTH
	extern _ERXND
	extern _ERXNDL
	extern _ERXNDH
	extern _ERXRDPT
	extern _ERXRDPTL
	extern _ERXRDPTH
	extern _ERXWRPT
	extern _ERXWRPTL
	extern _ERXWRPTH
	extern _EDMAST
	extern _EDMASTL
	extern _EDMASTH
	extern _EDMAND
	extern _EDMANDL
	extern _EDMANDH
	extern _EDMADST
	extern _EDMADSTL
	extern _EDMADSTH
	extern _EDMACS
	extern _EDMACSL
	extern _EDMACSH
	extern _EIE
	extern _ESTAT
	extern _ECON2
	extern _EIR
	extern _EDATA
	extern _SSP2CON2
	extern _SSP2CON1
	extern _SSP2STAT
	extern _SSP2ADD
	extern _SSP2BUF
	extern _ECCP2DEL
	extern _ECCP2AS
	extern _ECCP3DEL
	extern _ECCP3AS
	extern _RCSTA2
	extern _TXSTA2
	extern _TXREG2
	extern _RCREG2
	extern _SPBRG2
	extern _CCP5CON
	extern _CCPR5
	extern _CCPR5L
	extern _CCPR5H
	extern _CCP4CON
	extern _CCPR4
	extern _CCPR4L
	extern _CCPR4H
	extern _T4CON
	extern _PR4
	extern _TMR4
	extern _ECCP1DEL
	extern _ERDPT
	extern _ERDPTL
	extern _ERDPTH
	extern _BAUDCON2
	extern _BAUDCTL2
	extern _SPBRGH2
	extern _BAUDCON
	extern _BAUDCON1
	extern _BAUDCTL
	extern _BAUDCTL1
	extern _SPBRGH
	extern _SPBRGH1
	extern _PORTA
	extern _PORTB
	extern _PORTC
	extern _PORTD
	extern _PORTE
	extern _PORTF
	extern _PORTG
	extern _PORTH
	extern _PORTJ
	extern _LATA
	extern _LATB
	extern _LATC
	extern _LATD
	extern _LATE
	extern _LATF
	extern _LATG
	extern _LATH
	extern _LATJ
	extern _DDRA
	extern _TRISA
	extern _DDRB
	extern _TRISB
	extern _DDRC
	extern _TRISC
	extern _DDRD
	extern _TRISD
	extern _DDRE
	extern _TRISE
	extern _DDRF
	extern _TRISF
	extern _DDRG
	extern _TRISG
	extern _DDRH
	extern _TRISH
	extern _DDRJ
	extern _TRISJ
	extern _OSCTUNE
	extern _MEMCON
	extern _PIE1
	extern _PIR1
	extern _IPR1
	extern _PIE2
	extern _PIR2
	extern _IPR2
	extern _PIE3
	extern _PIR3
	extern _IPR3
	extern _EECON1
	extern _EECON2
	extern _RCSTA
	extern _RCSTA1
	extern _TXSTA
	extern _TXSTA1
	extern _TXREG
	extern _TXREG1
	extern _RCREG
	extern _RCREG1
	extern _SPBRG
	extern _SPBRG1
	extern _PSPCON
	extern _T3CON
	extern _TMR3L
	extern _TMR3H
	extern _CMCON
	extern _CVRCON
	extern _ECCP1AS
	extern _CCP3CON
	extern _ECCP3CON
	extern _CCPR3
	extern _CCPR3L
	extern _CCPR3H
	extern _CCP2CON
	extern _ECCP2CON
	extern _CCPR2
	extern _CCPR2L
	extern _CCPR2H
	extern _CCP1CON
	extern _ECCP1CON
	extern _CCPR1
	extern _CCPR1L
	extern _CCPR1H
	extern _ADCON2
	extern _ADCON1
	extern _ADCON0
	extern _ADRES
	extern _ADRESL
	extern _ADRESH
	extern _SSP1CON2
	extern _SSPCON2
	extern _SSP1CON1
	extern _SSPCON1
	extern _SSP1STAT
	extern _SSPSTAT
	extern _SSP1ADD
	extern _SSPADD
	extern _SSP1BUF
	extern _SSPBUF
	extern _T2CON
	extern _PR2
	extern _TMR2
	extern _T1CON
	extern _TMR1L
	extern _TMR1H
	extern _RCON
	extern _WDTCON
	extern _ECON1
	extern _OSCCON
	extern _T0CON
	extern _TMR0L
	extern _TMR0H
	extern _STATUS
	extern _FSR2L
	extern _FSR2H
	extern _PLUSW2
	extern _PREINC2
	extern _POSTDEC2
	extern _POSTINC2
	extern _INDF2
	extern _BSR
	extern _FSR1L
	extern _FSR1H
	extern _PLUSW1
	extern _PREINC1
	extern _POSTDEC1
	extern _POSTINC1
	extern _INDF1
	extern _WREG
	extern _FSR0L
	extern _FSR0H
	extern _PLUSW0
	extern _PREINC0
	extern _POSTDEC0
	extern _POSTINC0
	extern _INDF0
	extern _INTCON3
	extern _INTCON2
	extern _INTCON
	extern _PROD
	extern _PRODL
	extern _PRODH
	extern _TABLAT
	extern _TBLPTR
	extern _TBLPTRL
	extern _TBLPTRH
	extern _TBLPTRU
	extern _PC
	extern _PCL
	extern _PCLATH
	extern _PCLATU
	extern _STKPTR
	extern _TOS
	extern _TOSL
	extern _TOSH
	extern _TOSU
	extern _sprintf
	extern _ultoa
	extern _strlen
	extern _LCDInit
	extern _LCDUpdate
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
BSR	equ	0xfe0
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1
r0x0d	res	1
r0x0e	res	1
r0x0f	res	1
r0x10	res	1
r0x11	res	1
r0x12	res	1
r0x13	res	1
r0x14	res	1
r0x15	res	1

udata_test_0	udata
_stateMenu	res	2

udata_test_1	udata
_hours	res	2

udata_test_2	udata
_minutes	res	2

udata_test_3	udata
_seconds	res	2

udata_test_4	udata
_alarmHours	res	2

udata_test_5	udata
_alarmMinutes	res	2

udata_test_6	udata
_alarmStatus	res	2

udata_test_7	udata
_alarmCheck	res	2

udata_test_8	udata
_milliSec	res	2

udata_test_9	udata
_alarmDelay	res	2

udata_test_10	udata
_h	res	3

udata_test_11	udata
_m	res	3

udata_test_12	udata
_s	res	3

udata_test_13	udata
_hA	res	3

udata_test_14	udata
_mA	res	3

udata_test_15	udata
_alarmState	res	9

udata_test_16	udata
_LCDPrint	res	32

udata_test_17	udata
_DisplayWORD_WDigit_1_1	res	6

;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_test_ivec_0x1_HighPriorityInterrupt	code	0X000008
ivec_0x1_HighPriorityInterrupt:
	GOTO	_HighPriorityInterrupt

; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_test_ivec_0x2_LowPriorityInterrupt	code	0X000018
ivec_0x2_LowPriorityInterrupt:
	GOTO	_LowPriorityInterrupt

; I code from now on!
; ; Starting pCode block
S_test__main	code
_main:
	BANKSEL	_stateMenu
;	.line	69; test.c	stateMenu = STANDARD_STATE;
	CLRF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	70; test.c	INTCONbits.GIE = 1; // Activation générale des interruptions
	BSF	_INTCONbits, 7
;	.line	71; test.c	RCONbits.IPEN = 1; //interrupts priority enable
	BSF	_RCONbits, 7
;	.line	72; test.c	INTCONbits.PEIE = 1; // Enable low priority interrupts
	BSF	_INTCONbits, 6
;	.line	73; test.c	LCDInit(); // initialisation du LCD
	CALL	_LCDInit
	BANKSEL	_hours
;	.line	74; test.c	hours = 0;
	CLRF	_hours, B
	BANKSEL	(_hours + 1)
	CLRF	(_hours + 1), B
	BANKSEL	_minutes
;	.line	75; test.c	minutes = 0;
	CLRF	_minutes, B
	BANKSEL	(_minutes + 1)
	CLRF	(_minutes + 1), B
	BANKSEL	_seconds
;	.line	76; test.c	seconds = 0;
	CLRF	_seconds, B
	BANKSEL	(_seconds + 1)
	CLRF	(_seconds + 1), B
	BANKSEL	_alarmHours
;	.line	77; test.c	alarmHours = 0;
	CLRF	_alarmHours, B
	BANKSEL	(_alarmHours + 1)
	CLRF	(_alarmHours + 1), B
	BANKSEL	_alarmMinutes
;	.line	78; test.c	alarmMinutes = 0;
	CLRF	_alarmMinutes, B
	BANKSEL	(_alarmMinutes + 1)
	CLRF	(_alarmMinutes + 1), B
	BANKSEL	_alarmStatus
;	.line	79; test.c	alarmStatus = 0;
	CLRF	_alarmStatus, B
	BANKSEL	(_alarmStatus + 1)
	CLRF	(_alarmStatus + 1), B
	BANKSEL	_alarmCheck
;	.line	80; test.c	alarmCheck = 0;
	CLRF	_alarmCheck, B
	BANKSEL	(_alarmCheck + 1)
	CLRF	(_alarmCheck + 1), B
;	.line	81; test.c	ConfigTimer0();
	CALL	_ConfigTimer0
;	.line	82; test.c	ConfigButtons();
	CALL	_ConfigButtons
;	.line	83; test.c	ConfigLed();
	CALL	_ConfigLed
_00106_DS_:
;	.line	87; test.c	UpdateTime();
	CALL	_UpdateTime
;	.line	88; test.c	IsItTime();
	CALL	_IsItTime
;	.line	89; test.c	UpdateLCD();
	CALL	_UpdateLCD
	BRA	_00106_DS_
	RETURN	

; ; Starting pCode block
S_test__strlcpy	code
_strlcpy:
;	.line	450; test.c	strlcpy(char *dst, const char *src, size_t siz)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, POSTDEC1
	MOVFF	r0x15, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
;	.line	452; test.c	char       *d = dst;
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
;	.line	453; test.c	const char *s = src;
	MOVFF	r0x03, r0x0b
	MOVFF	r0x04, r0x0c
	MOVFF	r0x05, r0x0d
;	.line	454; test.c	size_t      n = siz;
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
;	.line	457; test.c	if (n != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00305_DS_
;	.line	459; test.c	while (--n != 0)
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	MOVFF	r0x05, r0x12
	MOVFF	r0x06, r0x13
	MOVFF	r0x07, r0x14
_00301_DS_:
	MOVLW	0xff
	ADDWF	r0x13, F
	BTFSS	STATUS, 0
	DECF	r0x14, F
	MOVF	r0x13, W
	IORWF	r0x14, W
	BZ	_00320_DS_
;	.line	461; test.c	if ((*d++ = *s++) == '\0')
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget1
	MOVWF	r0x15
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	BTFSC	STATUS, 0
	INCF	r0x12, F
	MOVFF	r0x15, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVF	r0x15, W
	BNZ	_00301_DS_
_00320_DS_:
;	.line	462; test.c	break;
	MOVFF	r0x10, r0x0b
	MOVFF	r0x11, r0x0c
	MOVFF	r0x12, r0x0d
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
	MOVFF	r0x13, r0x0e
	MOVFF	r0x14, r0x0f
_00305_DS_:
;	.line	467; test.c	if (n == 0)
	MOVF	r0x0e, W
	IORWF	r0x0f, W
	BNZ	_00312_DS_
;	.line	469; test.c	if (siz != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00319_DS_
;	.line	470; test.c	*d = '\0';          /* NUL-terminate dst */
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput1
_00319_DS_:
;	.line	471; test.c	while (*s++)
	MOVFF	r0x0b, r0x00
	MOVFF	r0x0c, r0x01
	MOVFF	r0x0d, r0x02
_00308_DS_:
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x06
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVF	r0x06, W
	BNZ	_00308_DS_
	MOVFF	r0x00, r0x0b
	MOVFF	r0x01, r0x0c
	MOVFF	r0x02, r0x0d
_00312_DS_:
;	.line	475; test.c	return (s - src - 1);       /* count does not include NUL */
	MOVF	r0x03, W
	SUBWF	r0x0b, W
	MOVWF	r0x03
	MOVF	r0x04, W
	SUBWFB	r0x0c, W
	MOVWF	r0x04
	MOVLW	0xff
	ADDWF	r0x03, F
	BTFSS	STATUS, 0
	DECF	r0x04, F
	MOVFF	r0x04, PRODL
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x15
	MOVFF	PREINC1, r0x14
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__DisplayString	code
_DisplayString:
;	.line	404; test.c	void DisplayString(BYTE pos, char* text)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	406; test.c	BYTE l= strlen(text)+1;
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_strlen
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVLW	0x03
	ADDWF	FSR1L, F
	INCF	r0x04, F
;	.line	407; test.c	BYTE max= 32-pos;
	MOVF	r0x00, W
	SUBLW	0x20
	MOVWF	r0x05
;	.line	408; test.c	strlcpy((char*)&LCDText[pos], text,(l<max)?l:max );
	CLRF	r0x06
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x06, F
	MOVF	r0x06, W
	MOVWF	r0x06
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x07
	MOVF	r0x05, W
	SUBWF	r0x04, W
	BNC	_00292_DS_
	MOVFF	r0x05, r0x04
_00292_DS_:
	CLRF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_strlcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	409; test.c	LCDUpdate();
	CALL	_LCDUpdate
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__DisplayWORD	code
_DisplayWORD:
;	.line	382; test.c	void DisplayWORD(BYTE pos, WORD w) //WORD is a 16 bits unsigned
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	390; test.c	ultoa(w, WDigit, radix);      
	CLRF	r0x03
	CLRF	r0x04
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_ultoa
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	391; test.c	for(j = 0; j < strlen((char*)WDigit); j++)
	CLRF	r0x01
_00273_DS_:
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	MOVWF	r0x03
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_strlen
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	r0x01, r0x04
	CLRF	r0x05
	MOVF	r0x05, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x03, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00283_DS_
	MOVF	r0x02, W
	SUBWF	r0x04, W
_00283_DS_:
	BC	_00276_DS_
;	.line	393; test.c	LCDText[LCDPos++] = WDigit[j];
	MOVFF	r0x00, r0x02
	INCF	r0x00, F
	CLRF	r0x03
	MOVLW	LOW(_LCDText)
	ADDWF	r0x02, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x03, F
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	ADDWF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	INDF0, r0x04
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, INDF0
;	.line	391; test.c	for(j = 0; j < strlen((char*)WDigit); j++)
	INCF	r0x01, F
	BRA	_00273_DS_
_00276_DS_:
;	.line	395; test.c	if(LCDPos < 32u)
	MOVFF	r0x00, r0x01
	CLRF	r0x02
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00284_DS_
	MOVLW	0x20
	SUBWF	r0x01, W
_00284_DS_:
	BC	_00272_DS_
;	.line	396; test.c	LCDText[LCDPos] = 0;
	CLRF	r0x01
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
_00272_DS_:
;	.line	397; test.c	LCDUpdate();
	CALL	_LCDUpdate
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__LowPriorityInterrupt	code
_LowPriorityInterrupt:
;	.line	292; test.c	void LowPriorityInterrupt(void) __interrupt (2)
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	294; test.c	if (INTCON3bits.INT3F){ //Interrupt Flag BUT1
	BTFSS	_INTCON3bits, 2
	BRA	_00243_DS_
;	.line	295; test.c	switch(stateMenu){
	MOVLW	0x00
	BANKSEL	(_stateMenu + 1)
	SUBWF	(_stateMenu + 1), W, B
	BNZ	_00261_DS_
	MOVLW	0x08
	BANKSEL	_stateMenu
	SUBWF	_stateMenu, W, B
_00261_DS_:
	BTFSC	STATUS, 0
	BRA	_00241_DS_
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	CLRF	r0x02
	BANKSEL	_stateMenu
	RLCF	_stateMenu, W, B
	RLCF	r0x02, F
	RLCF	WREG, W
	RLCF	r0x02, F
	ANDLW	0xfc
	MOVWF	r0x01
	MOVLW	UPPER(_00262_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00262_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00262_DS_)
	ADDWF	r0x01, F
	MOVF	r0x02, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x01, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVWF	PCL
_00262_DS_:
	GOTO	_00233_DS_
	GOTO	_00234_DS_
	GOTO	_00235_DS_
	GOTO	_00236_DS_
	GOTO	_00237_DS_
	GOTO	_00238_DS_
	GOTO	_00239_DS_
	GOTO	_00240_DS_
_00233_DS_:
;	.line	297; test.c	alarmStatus ^=1; // Enable/disable alarm
	MOVLW	0x01
	BANKSEL	_alarmStatus
	XORWF	_alarmStatus, F, B
;	.line	298; test.c	LED0_IO ^= 1;
	CLRF	r0x00
	BTFSC	_LATJbits, 0
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_LATJbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_LATJbits
;	.line	299; test.c	break; 
	BRA	_00241_DS_
_00234_DS_:
;	.line	301; test.c	stateMenu = SET_TIME_MINUTES;
	MOVLW	0x02
	BANKSEL	_stateMenu
	MOVWF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	302; test.c	break;
	BRA	_00241_DS_
_00235_DS_:
	BANKSEL	_minutes
;	.line	304; test.c	minutes++;
	INCF	_minutes, F, B
	BNC	_10299_DS_
	BANKSEL	(_minutes + 1)
	INCF	(_minutes + 1), F, B
_10299_DS_:
;	.line	305; test.c	break;
	BRA	_00241_DS_
_00236_DS_:
	BANKSEL	_hours
;	.line	307; test.c	hours++;
	INCF	_hours, F, B
	BNC	_20300_DS_
	BANKSEL	(_hours + 1)
	INCF	(_hours + 1), F, B
_20300_DS_:
;	.line	308; test.c	break;
	BRA	_00241_DS_
_00237_DS_:
;	.line	310; test.c	stateMenu = SET_ALARMCLOCK_MINUTES;
	MOVLW	0x05
	BANKSEL	_stateMenu
	MOVWF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	311; test.c	break;
	BRA	_00241_DS_
_00238_DS_:
	BANKSEL	_alarmMinutes
;	.line	313; test.c	alarmMinutes++;
	INCF	_alarmMinutes, F, B
	BNC	_30301_DS_
	BANKSEL	(_alarmMinutes + 1)
	INCF	(_alarmMinutes + 1), F, B
_30301_DS_:
;	.line	314; test.c	break;
	BRA	_00241_DS_
_00239_DS_:
	BANKSEL	_alarmHours
;	.line	316; test.c	alarmHours++;
	INCF	_alarmHours, F, B
	BNC	_40302_DS_
	BANKSEL	(_alarmHours + 1)
	INCF	(_alarmHours + 1), F, B
_40302_DS_:
;	.line	317; test.c	break;
	BRA	_00241_DS_
_00240_DS_:
	BANKSEL	_stateMenu
;	.line	319; test.c	stateMenu = STANDARD_STATE;
	CLRF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
	BANKSEL	_alarmStatus
;	.line	320; test.c	alarmStatus = 0;
	CLRF	_alarmStatus, B
	BANKSEL	(_alarmStatus + 1)
	CLRF	(_alarmStatus + 1), B
;	.line	321; test.c	LED0_IO = 0;
	BCF	_LATJbits, 0
;	.line	322; test.c	LED1_IO = 0;
	BCF	_LATJbits, 1
;	.line	323; test.c	LED2_IO = 0;
	BCF	_LATJbits, 2
_00241_DS_:
;	.line	327; test.c	INTCON3bits.INT3F = 0; // clear flag
	BCF	_INTCON3bits, 2
_00243_DS_:
;	.line	330; test.c	if (INTCON3bits.INT1F){ //Interrupt Flag BUT2
	BTFSS	_INTCON3bits, 0
	BRA	_00255_DS_
;	.line	331; test.c	switch(stateMenu){
	MOVLW	0x00
	BANKSEL	(_stateMenu + 1)
	SUBWF	(_stateMenu + 1), W, B
	BNZ	_00265_DS_
	MOVLW	0x08
	BANKSEL	_stateMenu
	SUBWF	_stateMenu, W, B
_00265_DS_:
	BTFSC	STATUS, 0
	BRA	_00252_DS_
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	CLRF	r0x02
	BANKSEL	_stateMenu
	RLCF	_stateMenu, W, B
	RLCF	r0x02, F
	RLCF	WREG, W
	RLCF	r0x02, F
	ANDLW	0xfc
	MOVWF	r0x01
	MOVLW	UPPER(_00266_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00266_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00266_DS_)
	ADDWF	r0x01, F
	MOVF	r0x02, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x01, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVWF	PCL
_00266_DS_:
	GOTO	_00244_DS_
	GOTO	_00245_DS_
	GOTO	_00246_DS_
	GOTO	_00247_DS_
	GOTO	_00248_DS_
	GOTO	_00249_DS_
	GOTO	_00250_DS_
	GOTO	_00251_DS_
_00244_DS_:
;	.line	333; test.c	stateMenu = SET_TIME_MENU;
	MOVLW	0x01
	BANKSEL	_stateMenu
	MOVWF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	334; test.c	break; 
	BRA	_00252_DS_
_00245_DS_:
;	.line	336; test.c	stateMenu = SET_ALARMCLOCK_MENU;
	MOVLW	0x04
	BANKSEL	_stateMenu
	MOVWF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	337; test.c	break;
	BRA	_00252_DS_
_00246_DS_:
;	.line	339; test.c	stateMenu = SET_TIME_HOURS;
	MOVLW	0x03
	BANKSEL	_stateMenu
	MOVWF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	340; test.c	break;
	BRA	_00252_DS_
_00247_DS_:
	BANKSEL	_stateMenu
;	.line	342; test.c	stateMenu = STANDARD_STATE;
	CLRF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
	BANKSEL	_alarmCheck
;	.line	343; test.c	alarmCheck = 0;
	CLRF	_alarmCheck, B
	BANKSEL	(_alarmCheck + 1)
	CLRF	(_alarmCheck + 1), B
;	.line	344; test.c	break;
	BRA	_00252_DS_
_00248_DS_:
	BANKSEL	_stateMenu
;	.line	346; test.c	stateMenu = STANDARD_STATE;
	CLRF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	347; test.c	break;
	BRA	_00252_DS_
_00249_DS_:
;	.line	349; test.c	stateMenu = SET_ALARMCLOCK_HOURS;
	MOVLW	0x06
	BANKSEL	_stateMenu
	MOVWF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	350; test.c	break;
	BRA	_00252_DS_
_00250_DS_:
	BANKSEL	_stateMenu
;	.line	352; test.c	stateMenu = STANDARD_STATE;
	CLRF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
	BANKSEL	_alarmCheck
;	.line	353; test.c	alarmCheck = 0;
	CLRF	_alarmCheck, B
	BANKSEL	(_alarmCheck + 1)
	CLRF	(_alarmCheck + 1), B
;	.line	354; test.c	break;
	BRA	_00252_DS_
_00251_DS_:
	BANKSEL	_stateMenu
;	.line	356; test.c	stateMenu = STANDARD_STATE;
	CLRF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
	BANKSEL	_alarmStatus
;	.line	357; test.c	alarmStatus = 0;
	CLRF	_alarmStatus, B
	BANKSEL	(_alarmStatus + 1)
	CLRF	(_alarmStatus + 1), B
;	.line	358; test.c	LED0_IO = 0;
	BCF	_LATJbits, 0
;	.line	359; test.c	LED1_IO = 0;
	BCF	_LATJbits, 1
;	.line	360; test.c	LED2_IO = 0;
	BCF	_LATJbits, 2
_00252_DS_:
;	.line	364; test.c	INTCON3bits.INT1F = 0; // clear flag
	BCF	_INTCON3bits, 0
_00255_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	MOVFF	PREINC1, WREG
	RETFIE	

; ; Starting pCode block
S_test__HighPriorityInterrupt	code
_HighPriorityInterrupt:
;	.line	276; test.c	void HighPriorityInterrupt(void) __interrupt (1)
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	278; test.c	if (INTCONbits.TMR0IF)
	BTFSS	_INTCONbits, 2
	BRA	_00228_DS_
;	.line	282; test.c	TMR0H = 0xE7; 
	MOVLW	0xe7
	MOVWF	_TMR0H
;	.line	283; test.c	TMR0L = 0x96;
	MOVLW	0x96
	MOVWF	_TMR0L
;	.line	284; test.c	INTCONbits.TMR0IF = 0; // OBLIGATOIRE: Remettre le bit d'interruption à zéro
	BCF	_INTCONbits, 2
	BANKSEL	_milliSec
;	.line	285; test.c	milliSec++;
	INCF	_milliSec, F, B
	BNC	_50303_DS_
	BANKSEL	(_milliSec + 1)
	INCF	(_milliSec + 1), F, B
_50303_DS_:
_00228_DS_:
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	MOVFF	PREINC1, WREG
	RETFIE	

; ; Starting pCode block
S_test__ConvertTime	code
_ConvertTime:
;	.line	265; test.c	void ConvertTime(short time, char* str){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
;	.line	266; test.c	if(time<10){
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00221_DS_
	MOVLW	0x0a
	SUBWF	r0x00, W
_00221_DS_:
	BC	_00216_DS_
;	.line	267; test.c	sprintf(str,"0%u\0",time);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_10)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_10)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_10)
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x08
	ADDWF	FSR1L, F
	BRA	_00218_DS_
_00216_DS_:
;	.line	269; test.c	sprintf(str,"%u\0",time);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_11)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_11)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_11)
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x08
	ADDWF	FSR1L, F
_00218_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__SwitchLedState	code
_SwitchLedState:
;	.line	257; test.c	void SwitchLedState(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	258; test.c	LED1_IO ^= 1;
	CLRF	r0x00
	BTFSC	_LATJbits, 1
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATJbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_LATJbits
;	.line	259; test.c	LED2_IO ^= 1;
	CLRF	r0x00
	BTFSC	_LATJbits, 2
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATJbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_LATJbits
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__UpdateLCD	code
_UpdateLCD:
;	.line	204; test.c	void UpdateLCD(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
;	.line	205; test.c	switch(stateMenu){
	MOVLW	0x00
	BANKSEL	(_stateMenu + 1)
	SUBWF	(_stateMenu + 1), W, B
	BNZ	_00204_DS_
	MOVLW	0x08
	BANKSEL	_stateMenu
	SUBWF	_stateMenu, W, B
_00204_DS_:
	BTFSC	STATUS, 0
	GOTO	_00199_DS_
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	CLRF	r0x10
	BANKSEL	_stateMenu
	RLCF	_stateMenu, W, B
	RLCF	r0x10, F
	RLCF	WREG, W
	RLCF	r0x10, F
	ANDLW	0xfc
	MOVWF	r0x0f
	MOVLW	UPPER(_00205_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00205_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00205_DS_)
	ADDWF	r0x0f, F
	MOVF	r0x10, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x0f, W
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVWF	PCL
_00205_DS_:
	GOTO	_00188_DS_
	GOTO	_00192_DS_
	GOTO	_00193_DS_
	GOTO	_00194_DS_
	GOTO	_00195_DS_
	GOTO	_00196_DS_
	GOTO	_00197_DS_
	GOTO	_00198_DS_
_00188_DS_:
;	.line	207; test.c	ConvertTime(hours, h);
	MOVFF	_hours, r0x00
	MOVFF	(_hours + 1), r0x01
	MOVLW	HIGH(_h)
	MOVWF	r0x03
	MOVLW	LOW(_h)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	208; test.c	ConvertTime(minutes, m);
	MOVFF	_minutes, r0x00
	MOVFF	(_minutes + 1), r0x01
	MOVLW	HIGH(_m)
	MOVWF	r0x03
	MOVLW	LOW(_m)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	209; test.c	ConvertTime(seconds, s);
	MOVFF	_seconds, r0x00
	MOVFF	(_seconds + 1), r0x01
	MOVLW	HIGH(_s)
	MOVWF	r0x03
	MOVLW	LOW(_s)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	210; test.c	ConvertTime(alarmHours, hA);
	MOVFF	_alarmHours, r0x00
	MOVFF	(_alarmHours + 1), r0x01
	MOVLW	HIGH(_hA)
	MOVWF	r0x03
	MOVLW	LOW(_hA)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	211; test.c	ConvertTime(alarmMinutes, mA);
	MOVFF	_alarmMinutes, r0x00
	MOVFF	(_alarmMinutes + 1), r0x01
	MOVLW	HIGH(_mA)
	MOVWF	r0x03
	MOVLW	LOW(_mA)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
	BANKSEL	_alarmStatus
;	.line	212; test.c	if(alarmStatus){
	MOVF	_alarmStatus, W, B
	BANKSEL	(_alarmStatus + 1)
	IORWF	(_alarmStatus + 1), W, B
	BZ	_00190_DS_
;	.line	213; test.c	sprintf(alarmState,"ON %sh%s\0",hA, mA);
	MOVLW	HIGH(_mA)
	MOVWF	r0x01
	MOVLW	LOW(_mA)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_hA)
	MOVWF	r0x04
	MOVLW	LOW(_hA)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_alarmState)
	MOVWF	r0x07
	MOVLW	LOW(_alarmState)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x0c
	ADDWF	FSR1L, F
	BRA	_00191_DS_
_00190_DS_:
;	.line	215; test.c	sprintf(alarmState,"OFF     \0");
	MOVLW	HIGH(_alarmState)
	MOVWF	r0x01
	MOVLW	LOW(_alarmState)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x06
	ADDWF	FSR1L, F
_00191_DS_:
;	.line	217; test.c	sprintf(LCDPrint,"    %s:%s:%s    Alarm %s",h,m,s,alarmState);
	MOVLW	HIGH(_alarmState)
	MOVWF	r0x01
	MOVLW	LOW(_alarmState)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_s)
	MOVWF	r0x04
	MOVLW	LOW(_s)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_m)
	MOVWF	r0x07
	MOVLW	LOW(_m)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	HIGH(_h)
	MOVWF	r0x0a
	MOVLW	LOW(_h)
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
	MOVLW	HIGH(_LCDPrint)
	MOVWF	r0x0d
	MOVLW	LOW(_LCDPrint)
	MOVWF	r0x0c
	MOVLW	0x80
	MOVWF	r0x0e
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x12
	ADDWF	FSR1L, F
;	.line	218; test.c	break;
	GOTO	_00199_DS_
_00192_DS_:
;	.line	220; test.c	sprintf(LCDPrint, "      MENU        Set time ?");
	MOVLW	HIGH(_LCDPrint)
	MOVWF	r0x01
	MOVLW	LOW(_LCDPrint)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	221; test.c	break;
	GOTO	_00199_DS_
_00193_DS_:
;	.line	223; test.c	ConvertTime(hours, h);
	MOVFF	_hours, r0x00
	MOVFF	(_hours + 1), r0x01
	MOVLW	HIGH(_h)
	MOVWF	r0x03
	MOVLW	LOW(_h)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	224; test.c	ConvertTime(minutes, m);
	MOVFF	_minutes, r0x00
	MOVFF	(_minutes + 1), r0x01
	MOVLW	HIGH(_m)
	MOVWF	r0x03
	MOVLW	LOW(_m)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	225; test.c	ConvertTime(seconds, s);
	MOVFF	_seconds, r0x00
	MOVFF	(_seconds + 1), r0x01
	MOVLW	HIGH(_s)
	MOVWF	r0x03
	MOVLW	LOW(_s)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	226; test.c	sprintf(LCDPrint,"Set Minutes     %s:[%s]:%s",h,m,s);
	MOVLW	HIGH(_s)
	MOVWF	r0x01
	MOVLW	LOW(_s)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_m)
	MOVWF	r0x04
	MOVLW	LOW(_m)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_h)
	MOVWF	r0x07
	MOVLW	LOW(_h)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	HIGH(_LCDPrint)
	MOVWF	r0x0a
	MOVLW	LOW(_LCDPrint)
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x0f
	ADDWF	FSR1L, F
;	.line	227; test.c	break;
	BRA	_00199_DS_
_00194_DS_:
;	.line	229; test.c	ConvertTime(hours, h);
	MOVFF	_hours, r0x00
	MOVFF	(_hours + 1), r0x01
	MOVLW	HIGH(_h)
	MOVWF	r0x03
	MOVLW	LOW(_h)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	230; test.c	ConvertTime(minutes, m);
	MOVFF	_minutes, r0x00
	MOVFF	(_minutes + 1), r0x01
	MOVLW	HIGH(_m)
	MOVWF	r0x03
	MOVLW	LOW(_m)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	231; test.c	ConvertTime(seconds, s);
	MOVFF	_seconds, r0x00
	MOVFF	(_seconds + 1), r0x01
	MOVLW	HIGH(_s)
	MOVWF	r0x03
	MOVLW	LOW(_s)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	232; test.c	sprintf(LCDPrint,"Set Hours       [%s]:%s:%s",h,m,s);
	MOVLW	HIGH(_s)
	MOVWF	r0x01
	MOVLW	LOW(_s)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_m)
	MOVWF	r0x04
	MOVLW	LOW(_m)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_h)
	MOVWF	r0x07
	MOVLW	LOW(_h)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	HIGH(_LCDPrint)
	MOVWF	r0x0a
	MOVLW	LOW(_LCDPrint)
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_5)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_5)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_5)
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x0f
	ADDWF	FSR1L, F
;	.line	233; test.c	break;
	BRA	_00199_DS_
_00195_DS_:
;	.line	235; test.c	sprintf(LCDPrint, "      MENU      Set Alarmclock?");
	MOVLW	HIGH(_LCDPrint)
	MOVWF	r0x01
	MOVLW	LOW(_LCDPrint)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_6)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_6)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_6)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	236; test.c	break;
	BRA	_00199_DS_
_00196_DS_:
;	.line	238; test.c	ConvertTime(alarmHours, h);
	MOVFF	_alarmHours, r0x00
	MOVFF	(_alarmHours + 1), r0x01
	MOVLW	HIGH(_h)
	MOVWF	r0x03
	MOVLW	LOW(_h)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	239; test.c	ConvertTime(alarmMinutes, m);
	MOVFF	_alarmMinutes, r0x00
	MOVFF	(_alarmMinutes + 1), r0x01
	MOVLW	HIGH(_m)
	MOVWF	r0x03
	MOVLW	LOW(_m)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	240; test.c	sprintf(LCDPrint,"Set Alarm Min    %s:[%s]",h,m);
	MOVLW	HIGH(_m)
	MOVWF	r0x01
	MOVLW	LOW(_m)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_h)
	MOVWF	r0x04
	MOVLW	LOW(_h)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_LCDPrint)
	MOVWF	r0x07
	MOVLW	LOW(_LCDPrint)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_7)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_7)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_7)
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x0c
	ADDWF	FSR1L, F
;	.line	241; test.c	break;
	BRA	_00199_DS_
_00197_DS_:
;	.line	243; test.c	ConvertTime(alarmHours, h);
	MOVFF	_alarmHours, r0x00
	MOVFF	(_alarmHours + 1), r0x01
	MOVLW	HIGH(_h)
	MOVWF	r0x03
	MOVLW	LOW(_h)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	244; test.c	ConvertTime(alarmMinutes, m);
	MOVFF	_alarmMinutes, r0x00
	MOVFF	(_alarmMinutes + 1), r0x01
	MOVLW	HIGH(_m)
	MOVWF	r0x03
	MOVLW	LOW(_m)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	245; test.c	sprintf(LCDPrint,"Set Alarm Hours  [%s]:%s",h,m);
	MOVLW	HIGH(_m)
	MOVWF	r0x01
	MOVLW	LOW(_m)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_h)
	MOVWF	r0x04
	MOVLW	LOW(_h)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_LCDPrint)
	MOVWF	r0x07
	MOVLW	LOW(_LCDPrint)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_8)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_8)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_8)
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x0c
	ADDWF	FSR1L, F
;	.line	246; test.c	break;
	BRA	_00199_DS_
_00198_DS_:
;	.line	248; test.c	ConvertTime(hours, h);
	MOVFF	_hours, r0x00
	MOVFF	(_hours + 1), r0x01
	MOVLW	HIGH(_h)
	MOVWF	r0x03
	MOVLW	LOW(_h)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	249; test.c	ConvertTime(minutes, m);
	MOVFF	_minutes, r0x00
	MOVFF	(_minutes + 1), r0x01
	MOVLW	HIGH(_m)
	MOVWF	r0x03
	MOVLW	LOW(_m)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	250; test.c	ConvertTime(seconds, s);
	MOVFF	_seconds, r0x00
	MOVFF	(_seconds + 1), r0x01
	MOVLW	HIGH(_s)
	MOVWF	r0x03
	MOVLW	LOW(_s)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ConvertTime
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	251; test.c	sprintf(LCDPrint, "   It's Time !      %s:%s:%s",h,m,s);
	MOVLW	HIGH(_s)
	MOVWF	r0x01
	MOVLW	LOW(_s)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_m)
	MOVWF	r0x04
	MOVLW	LOW(_m)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_h)
	MOVWF	r0x07
	MOVLW	LOW(_h)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	HIGH(_LCDPrint)
	MOVWF	r0x0a
	MOVLW	LOW(_LCDPrint)
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_9)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_9)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_9)
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x0f
	ADDWF	FSR1L, F
_00199_DS_:
;	.line	254; test.c	DisplayString(0, LCDPrint);
	MOVLW	HIGH(_LCDPrint)
	MOVWF	r0x01
	MOVLW	LOW(_LCDPrint)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__IsItTime	code
_IsItTime:
;	.line	192; test.c	void IsItTime(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	193; test.c	if(alarmStatus & (hours == alarmHours) & (minutes == alarmMinutes) & stateMenu != SET_ALARMCLOCK_MINUTES & stateMenu != SET_ALARMCLOCK_HOURS & !alarmCheck){
	CLRF	r0x00
	BANKSEL	_hours
	MOVF	_hours, W, B
	BANKSEL	_alarmHours
	XORWF	_alarmHours, W, B
	BNZ	_00174_DS_
	BANKSEL	(_hours + 1)
	MOVF	(_hours + 1), W, B
	BANKSEL	(_alarmHours + 1)
	XORWF	(_alarmHours + 1), W, B
	BNZ	_00174_DS_
	INCF	r0x00, F
_00174_DS_:
	CLRF	r0x01
	BTFSC	r0x00, 7
	SETF	r0x01
	BANKSEL	_alarmStatus
	MOVF	_alarmStatus, W, B
	ANDWF	r0x00, F
	BANKSEL	(_alarmStatus + 1)
	MOVF	(_alarmStatus + 1), W, B
	ANDWF	r0x01, F
	CLRF	r0x02
	BANKSEL	_minutes
	MOVF	_minutes, W, B
	BANKSEL	_alarmMinutes
	XORWF	_alarmMinutes, W, B
	BNZ	_00177_DS_
	BANKSEL	(_minutes + 1)
	MOVF	(_minutes + 1), W, B
	BANKSEL	(_alarmMinutes + 1)
	XORWF	(_alarmMinutes + 1), W, B
	BNZ	_00177_DS_
	INCF	r0x02, F
_00177_DS_:
	CLRF	r0x03
	BTFSC	r0x02, 7
	SETF	r0x03
	MOVF	r0x02, W
	ANDWF	r0x00, F
	MOVF	r0x03, W
	ANDWF	r0x01, F
	CLRF	r0x02
	BANKSEL	_stateMenu
	MOVF	_stateMenu, W, B
	XORLW	0x05
	BNZ	_00180_DS_
	BANKSEL	(_stateMenu + 1)
	MOVF	(_stateMenu + 1), W, B
	BNZ	_00180_DS_
	INCF	r0x02, F
_00180_DS_:
	MOVF	r0x02, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x02
	RLCF	r0x02, F
	CLRF	r0x03
	MOVF	r0x02, W
	ANDWF	r0x00, F
	MOVF	r0x03, W
	ANDWF	r0x01, F
	CLRF	r0x02
	BANKSEL	_stateMenu
	MOVF	_stateMenu, W, B
	XORLW	0x06
	BNZ	_00183_DS_
	BANKSEL	(_stateMenu + 1)
	MOVF	(_stateMenu + 1), W, B
	BNZ	_00183_DS_
	INCF	r0x02, F
_00183_DS_:
	MOVF	r0x02, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x02
	RLCF	r0x02, F
	CLRF	r0x03
	MOVF	r0x02, W
	ANDWF	r0x00, F
	MOVF	r0x03, W
	ANDWF	r0x01, F
	BANKSEL	_alarmCheck
	MOVF	_alarmCheck, W, B
	BANKSEL	(_alarmCheck + 1)
	IORWF	(_alarmCheck + 1), W, B
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x02
	RLCF	r0x02, F
	CLRF	r0x03
	MOVF	r0x02, W
	ANDWF	r0x00, F
	MOVF	r0x03, W
	ANDWF	r0x01, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BZ	_00170_DS_
;	.line	194; test.c	stateMenu = RINGING;
	MOVLW	0x07
	BANKSEL	_stateMenu
	MOVWF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	195; test.c	alarmDelay = 30;
	MOVLW	0x1e
	BANKSEL	_alarmDelay
	MOVWF	_alarmDelay, B
	BANKSEL	(_alarmDelay + 1)
	CLRF	(_alarmDelay + 1), B
;	.line	196; test.c	alarmCheck = 1;
	MOVLW	0x01
	BANKSEL	_alarmCheck
	MOVWF	_alarmCheck, B
	BANKSEL	(_alarmCheck + 1)
	CLRF	(_alarmCheck + 1), B
_00170_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__UpdateTime	code
_UpdateTime:
;	.line	151; test.c	void UpdateTime(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	152; test.c	if(milliSec>=1000){
	MOVLW	0x03
	BANKSEL	(_milliSec + 1)
	SUBWF	(_milliSec + 1), W, B
	BNZ	_00154_DS_
	MOVLW	0xe8
	BANKSEL	_milliSec
	SUBWF	_milliSec, W, B
_00154_DS_:
	BTFSS	STATUS, 0
	BRA	_00133_DS_
;	.line	153; test.c	milliSec -= 1000; // if didn't update for some ms, don't set millisec to 0, just 
	MOVLW	0x18
	BANKSEL	_milliSec
	ADDWF	_milliSec, F, B
	MOVLW	0xfc
	BANKSEL	(_milliSec + 1)
	ADDWFC	(_milliSec + 1), F, B
	BANKSEL	_seconds
;	.line	154; test.c	seconds++;
	INCF	_seconds, F, B
	BNC	_60304_DS_
	BANKSEL	(_seconds + 1)
	INCF	(_seconds + 1), F, B
_60304_DS_:
	BANKSEL	_stateMenu
;	.line	155; test.c	if(stateMenu == RINGING){ 
	MOVF	_stateMenu, W, B
	XORLW	0x07
	BNZ	_00155_DS_
	BANKSEL	(_stateMenu + 1)
	MOVF	(_stateMenu + 1), W, B
	BZ	_00156_DS_
_00155_DS_:
	BRA	_00129_DS_
_00156_DS_:
;	.line	156; test.c	SwitchLedState();
	CALL	_SwitchLedState
;	.line	157; test.c	alarmDelay--;
	MOVLW	0xff
	BANKSEL	_alarmDelay
	ADDWF	_alarmDelay, F, B
	BC	_70305_DS_
	BANKSEL	(_alarmDelay + 1)
	DECF	(_alarmDelay + 1), F, B
_70305_DS_:
_00129_DS_:
	BANKSEL	_alarmDelay
;	.line	159; test.c	if(alarmDelay == 0){ // stops alarm & put settings on OFF, switch off leds.
	MOVF	_alarmDelay, W, B
	BANKSEL	(_alarmDelay + 1)
	IORWF	(_alarmDelay + 1), W, B
	BNZ	_00133_DS_
;	.line	160; test.c	alarmDelay = 30;
	MOVLW	0x1e
	BANKSEL	_alarmDelay
	MOVWF	_alarmDelay, B
	BANKSEL	(_alarmDelay + 1)
	CLRF	(_alarmDelay + 1), B
	BANKSEL	_stateMenu
;	.line	161; test.c	stateMenu = STANDARD_STATE;
	CLRF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
	BANKSEL	_alarmStatus
;	.line	162; test.c	alarmStatus = 0;
	CLRF	_alarmStatus, B
	BANKSEL	(_alarmStatus + 1)
	CLRF	(_alarmStatus + 1), B
;	.line	163; test.c	LED0_IO = 0;
	BCF	_LATJbits, 0
;	.line	164; test.c	LED1_IO = 0;
	BCF	_LATJbits, 1
;	.line	165; test.c	LED2_IO = 0;
	BCF	_LATJbits, 2
_00133_DS_:
;	.line	168; test.c	if(seconds>=60)
	MOVLW	0x00
	BANKSEL	(_seconds + 1)
	SUBWF	(_seconds + 1), W, B
	BNZ	_00157_DS_
	MOVLW	0x3c
	BANKSEL	_seconds
	SUBWF	_seconds, W, B
_00157_DS_:
	BNC	_00135_DS_
	BANKSEL	_seconds
;	.line	170; test.c	seconds = 0;
	CLRF	_seconds, B
	BANKSEL	(_seconds + 1)
	CLRF	(_seconds + 1), B
	BANKSEL	_minutes
;	.line	171; test.c	minutes++;
	INCF	_minutes, F, B
	BNC	_80306_DS_
	BANKSEL	(_minutes + 1)
	INCF	(_minutes + 1), F, B
_80306_DS_:
_00135_DS_:
	BANKSEL	_minutes
;	.line	173; test.c	if(minutes == 60){
	MOVF	_minutes, W, B
	XORLW	0x3c
	BNZ	_00158_DS_
	BANKSEL	(_minutes + 1)
	MOVF	(_minutes + 1), W, B
	BZ	_00159_DS_
_00158_DS_:
	BRA	_00137_DS_
_00159_DS_:
	BANKSEL	_minutes
;	.line	174; test.c	minutes = 0;
	CLRF	_minutes, B
	BANKSEL	(_minutes + 1)
	CLRF	(_minutes + 1), B
	BANKSEL	_hours
;	.line	175; test.c	hours++;
	INCF	_hours, F, B
	BNC	_90307_DS_
	BANKSEL	(_hours + 1)
	INCF	(_hours + 1), F, B
_90307_DS_:
_00137_DS_:
;	.line	177; test.c	if(hours > 23){
	MOVLW	0x00
	BANKSEL	(_hours + 1)
	SUBWF	(_hours + 1), W, B
	BNZ	_00160_DS_
	MOVLW	0x18
	BANKSEL	_hours
	SUBWF	_hours, W, B
_00160_DS_:
	BNC	_00139_DS_
	BANKSEL	_hours
;	.line	178; test.c	hours = 0;
	CLRF	_hours, B
	BANKSEL	(_hours + 1)
	CLRF	(_hours + 1), B
	BANKSEL	_alarmCheck
;	.line	179; test.c	alarmCheck = 0;
	CLRF	_alarmCheck, B
	BANKSEL	(_alarmCheck + 1)
	CLRF	(_alarmCheck + 1), B
_00139_DS_:
	BANKSEL	_alarmMinutes
;	.line	181; test.c	if(alarmMinutes == 60){
	MOVF	_alarmMinutes, W, B
	XORLW	0x3c
	BNZ	_00161_DS_
	BANKSEL	(_alarmMinutes + 1)
	MOVF	(_alarmMinutes + 1), W, B
	BZ	_00162_DS_
_00161_DS_:
	BRA	_00141_DS_
_00162_DS_:
	BANKSEL	_alarmMinutes
;	.line	182; test.c	alarmMinutes = 0;
	CLRF	_alarmMinutes, B
	BANKSEL	(_alarmMinutes + 1)
	CLRF	(_alarmMinutes + 1), B
_00141_DS_:
;	.line	184; test.c	if(alarmHours>23){
	MOVLW	0x00
	BANKSEL	(_alarmHours + 1)
	SUBWF	(_alarmHours + 1), W, B
	BNZ	_00163_DS_
	MOVLW	0x18
	BANKSEL	_alarmHours
	SUBWF	_alarmHours, W, B
_00163_DS_:
	BNC	_00144_DS_
	BANKSEL	_alarmHours
;	.line	185; test.c	alarmHours = 0;	
	CLRF	_alarmHours, B
	BANKSEL	(_alarmHours + 1)
	CLRF	(_alarmHours + 1), B
_00144_DS_:
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__ConfigLed	code
_ConfigLed:
;	.line	137; test.c	void ConfigLed(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	139; test.c	LED0_TRIS = 0;
	BCF	_TRISJbits, 0
;	.line	140; test.c	LED1_TRIS = 0;
	BCF	_TRISJbits, 1
;	.line	141; test.c	LED2_TRIS = 0;
	BCF	_TRISJbits, 2
;	.line	143; test.c	LED0_IO = 0;
	BCF	_LATJbits, 0
;	.line	144; test.c	LED1_IO = 0;
	BCF	_LATJbits, 1
;	.line	145; test.c	LED2_IO = 0;
	BCF	_LATJbits, 2
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__ConfigButtons	code
_ConfigButtons:
;	.line	125; test.c	void ConfigButtons(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	126; test.c	INTCON3bits.INT1IP = 0; // Low priority interrupt for up butt
	BCF	_INTCON3bits, 6
;	.line	127; test.c	INTCON2bits.INT3IP = 0; // Low priority interrupt for down butt
	BCF	_INTCON2bits, 1
;	.line	128; test.c	INTCON2bits.INTEDG1 = 0; // Interrupt on falling edge
	BCF	_INTCON2bits, 5
;	.line	129; test.c	INTCON2bits.INTEDG3 = 0; // Interrupt on falling edge
	BCF	_INTCON2bits, 3
;	.line	130; test.c	INTCON3bits.INT3F = 0; // clear flag
	BCF	_INTCON3bits, 2
;	.line	131; test.c	INTCON3bits.INT1F = 0; // clear flag	
	BCF	_INTCON3bits, 0
;	.line	132; test.c	INTCON3bits.INT1E = 1; // Up button interrupt enable
	BSF	_INTCON3bits, 3
;	.line	133; test.c	INTCON3bits.INT3E = 1; // Down button interrupt enable
	BSF	_INTCON3bits, 5
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__ConfigTimer0	code
_ConfigTimer0:
;	.line	99; test.c	void ConfigTimer0(void){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	101; test.c	INTCON2bits.TMR0IP = 1; // Priorité Haute
	BSF	_INTCON2bits, 2
;	.line	102; test.c	INTCONbits.TMR0IE = 1;	// Activation interruption Timer 0
	BSF	_INTCONbits, 5
;	.line	103; test.c	INTCONbits.TMR0IF = 0; // clear timer0 flag
	BCF	_INTCONbits, 2
;	.line	107; test.c	T0CONbits.T08BIT = 0;		
	BCF	_T0CONbits, 6
;	.line	109; test.c	T0CONbits.T0CS = 0;	
	BCF	_T0CONbits, 5
;	.line	112; test.c	T0CONbits.PSA = 1;
	BSF	_T0CONbits, 3
;	.line	114; test.c	TMR0H = 0xE7;
	MOVLW	0xe7
	MOVWF	_TMR0H
;	.line	115; test.c	TMR0L = 0x96;
	MOVLW	0x96
	MOVWF	_TMR0L
;	.line	117; test.c	T0CONbits.TMR0ON = 1;
	BSF	_T0CONbits, 7
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
__str_0:
	DB	0x4f, 0x4e, 0x20, 0x25, 0x73, 0x68, 0x25, 0x73, 0x00, 0x00
; ; Starting pCode block
__str_1:
	DB	0x4f, 0x46, 0x46, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00
; ; Starting pCode block
__str_2:
	DB	0x20, 0x20, 0x20, 0x20, 0x25, 0x73, 0x3a, 0x25, 0x73, 0x3a, 0x25, 0x73
	DB	0x20, 0x20, 0x20, 0x20, 0x41, 0x6c, 0x61, 0x72, 0x6d, 0x20, 0x25, 0x73
	DB	0x00
; ; Starting pCode block
__str_3:
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x4d, 0x45, 0x4e, 0x55, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x53, 0x65, 0x74, 0x20, 0x74, 0x69
	DB	0x6d, 0x65, 0x20, 0x3f, 0x00
; ; Starting pCode block
__str_4:
	DB	0x53, 0x65, 0x74, 0x20, 0x4d, 0x69, 0x6e, 0x75, 0x74, 0x65, 0x73, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x25, 0x73, 0x3a, 0x5b, 0x25, 0x73, 0x5d, 0x3a
	DB	0x25, 0x73, 0x00
; ; Starting pCode block
__str_5:
	DB	0x53, 0x65, 0x74, 0x20, 0x48, 0x6f, 0x75, 0x72, 0x73, 0x20, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x5b, 0x25, 0x73, 0x5d, 0x3a, 0x25, 0x73, 0x3a
	DB	0x25, 0x73, 0x00
; ; Starting pCode block
__str_6:
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x4d, 0x45, 0x4e, 0x55, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x53, 0x65, 0x74, 0x20, 0x41, 0x6c, 0x61, 0x72
	DB	0x6d, 0x63, 0x6c, 0x6f, 0x63, 0x6b, 0x3f, 0x00
; ; Starting pCode block
__str_7:
	DB	0x53, 0x65, 0x74, 0x20, 0x41, 0x6c, 0x61, 0x72, 0x6d, 0x20, 0x4d, 0x69
	DB	0x6e, 0x20, 0x20, 0x20, 0x20, 0x25, 0x73, 0x3a, 0x5b, 0x25, 0x73, 0x5d
	DB	0x00
; ; Starting pCode block
__str_8:
	DB	0x53, 0x65, 0x74, 0x20, 0x41, 0x6c, 0x61, 0x72, 0x6d, 0x20, 0x48, 0x6f
	DB	0x75, 0x72, 0x73, 0x20, 0x20, 0x5b, 0x25, 0x73, 0x5d, 0x3a, 0x25, 0x73
	DB	0x00
; ; Starting pCode block
__str_9:
	DB	0x20, 0x20, 0x20, 0x49, 0x74, 0x27, 0x73, 0x20, 0x54, 0x69, 0x6d, 0x65
	DB	0x20, 0x21, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x25, 0x73, 0x3a, 0x25
	DB	0x73, 0x3a, 0x25, 0x73, 0x00
; ; Starting pCode block
__str_10:
	DB	0x30, 0x25, 0x75, 0x00, 0x00
; ; Starting pCode block
__str_11:
	DB	0x25, 0x75, 0x00, 0x00


; Statistics:
; code size:	 4806 (0x12c6) bytes ( 3.67%)
;           	 2403 (0x0963) words
; udata size:	   82 (0x0052) bytes ( 2.14%)
; access size:	   22 (0x0016) bytes


	end
