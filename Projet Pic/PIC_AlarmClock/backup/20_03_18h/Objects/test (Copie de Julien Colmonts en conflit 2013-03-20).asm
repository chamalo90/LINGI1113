;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Mar 16 2013) (UNIX)
; This file was generated Wed Mar 20 11:30:04 2013
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f97j60

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _ringToday
	global _ConfigTimer0
	global _ConfigButtons
	global _UpdateTime
	global _UpdateLCD
	global _ConvertTime
	global _StartTimer1
	global _DisplayWORD
	global _DisplayString
	global _strlcpy
	global _hours
	global _minutes
	global _seconds
	global _alarmHours
	global _alarmMinutes
	global _stateMenu
	global _alarmStatus
	global _LCDPrint
	global _h
	global _m
	global _s
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
_ringToday	res	2

udata_test_1	udata
_stateMenu	res	2

udata_test_2	udata
_hours	res	2

udata_test_3	udata
_minutes	res	2

udata_test_4	udata
_seconds	res	2

udata_test_5	udata
_alarmHours	res	2

udata_test_6	udata
_alarmMinutes	res	2

udata_test_7	udata
_alarmStatus	res	2

udata_test_8	udata
_h	res	3

udata_test_9	udata
_m	res	3

udata_test_10	udata
_s	res	3

udata_test_11	udata
_alarmState	res	3

udata_test_12	udata
_LCDPrint	res	32

udata_test_13	udata
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
;	.line	52; test.c	stateMenu = STANDARD_STATE;
	CLRF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	53; test.c	INTCONbits.GIE = 1; // Activation générale des interruptions
	BSF	_INTCONbits, 7
;	.line	54; test.c	RCONbits.IPEN = 1; //interrupts priority enable
	BSF	_RCONbits, 7
;	.line	55; test.c	LCDInit(); // initialisation du LCD
	CALL	_LCDInit
	BANKSEL	_hours
;	.line	56; test.c	hours = 0;
	CLRF	_hours, B
	BANKSEL	(_hours + 1)
	CLRF	(_hours + 1), B
	BANKSEL	_minutes
;	.line	57; test.c	minutes = 0;
	CLRF	_minutes, B
	BANKSEL	(_minutes + 1)
	CLRF	(_minutes + 1), B
	BANKSEL	_seconds
;	.line	58; test.c	seconds = 0;
	CLRF	_seconds, B
	BANKSEL	(_seconds + 1)
	CLRF	(_seconds + 1), B
	BANKSEL	_alarmHours
;	.line	59; test.c	alarmHours = 0;
	CLRF	_alarmHours, B
	BANKSEL	(_alarmHours + 1)
	CLRF	(_alarmHours + 1), B
	BANKSEL	_alarmMinutes
;	.line	60; test.c	alarmMinutes = 0;
	CLRF	_alarmMinutes, B
	BANKSEL	(_alarmMinutes + 1)
	CLRF	(_alarmMinutes + 1), B
	BANKSEL	_alarmStatus
;	.line	61; test.c	alarmStatus = 0;
	CLRF	_alarmStatus, B
	BANKSEL	(_alarmStatus + 1)
	CLRF	(_alarmStatus + 1), B
;	.line	62; test.c	ConfigTimer0();
	CALL	_ConfigTimer0
;	.line	63; test.c	ConfigButtons();
	CALL	_ConfigButtons
_00106_DS_:
;	.line	67; test.c	UpdateTime();
	CALL	_UpdateTime
;	.line	68; test.c	UpdateLCD();
	CALL	_UpdateLCD
	BRA	_00106_DS_
	RETURN	

; ; Starting pCode block
S_test__strlcpy	code
_strlcpy:
;	.line	385; test.c	strlcpy(char *dst, const char *src, size_t siz)
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
;	.line	387; test.c	char       *d = dst;
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
;	.line	388; test.c	const char *s = src;
	MOVFF	r0x03, r0x0b
	MOVFF	r0x04, r0x0c
	MOVFF	r0x05, r0x0d
;	.line	389; test.c	size_t      n = siz;
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
;	.line	392; test.c	if (n != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00255_DS_
;	.line	394; test.c	while (--n != 0)
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	MOVFF	r0x05, r0x12
	MOVFF	r0x06, r0x13
	MOVFF	r0x07, r0x14
_00251_DS_:
	MOVLW	0xff
	ADDWF	r0x13, F
	BTFSS	STATUS, 0
	DECF	r0x14, F
	MOVF	r0x13, W
	IORWF	r0x14, W
	BZ	_00270_DS_
;	.line	396; test.c	if ((*d++ = *s++) == '\0')
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
	BNZ	_00251_DS_
_00270_DS_:
;	.line	397; test.c	break;
	MOVFF	r0x10, r0x0b
	MOVFF	r0x11, r0x0c
	MOVFF	r0x12, r0x0d
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
	MOVFF	r0x13, r0x0e
	MOVFF	r0x14, r0x0f
_00255_DS_:
;	.line	402; test.c	if (n == 0)
	MOVF	r0x0e, W
	IORWF	r0x0f, W
	BNZ	_00262_DS_
;	.line	404; test.c	if (siz != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00269_DS_
;	.line	405; test.c	*d = '\0';          /* NUL-terminate dst */
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput1
_00269_DS_:
;	.line	406; test.c	while (*s++)
	MOVFF	r0x0b, r0x00
	MOVFF	r0x0c, r0x01
	MOVFF	r0x0d, r0x02
_00258_DS_:
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
	BNZ	_00258_DS_
	MOVFF	r0x00, r0x0b
	MOVFF	r0x01, r0x0c
	MOVFF	r0x02, r0x0d
_00262_DS_:
;	.line	410; test.c	return (s - src - 1);       /* count does not include NUL */
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
;	.line	339; test.c	void DisplayString(BYTE pos, char* text)
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
;	.line	341; test.c	BYTE l= strlen(text)+1;
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
;	.line	342; test.c	BYTE max= 32-pos;
	MOVF	r0x00, W
	SUBLW	0x20
	MOVWF	r0x05
;	.line	343; test.c	strlcpy((char*)&LCDText[pos], text,(l<max)?l:max );
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
	BNC	_00242_DS_
	MOVFF	r0x05, r0x04
_00242_DS_:
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
;	.line	344; test.c	LCDUpdate();
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
;	.line	317; test.c	void DisplayWORD(BYTE pos, WORD w) //WORD is a 16 bits unsigned
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
;	.line	325; test.c	ultoa(w, WDigit, radix);      
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
;	.line	326; test.c	for(j = 0; j < strlen((char*)WDigit); j++)
	CLRF	r0x01
_00223_DS_:
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
	BNZ	_00233_DS_
	MOVF	r0x02, W
	SUBWF	r0x04, W
_00233_DS_:
	BC	_00226_DS_
;	.line	328; test.c	LCDText[LCDPos++] = WDigit[j];
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
;	.line	326; test.c	for(j = 0; j < strlen((char*)WDigit); j++)
	INCF	r0x01, F
	BRA	_00223_DS_
_00226_DS_:
;	.line	330; test.c	if(LCDPos < 32u)
	MOVFF	r0x00, r0x01
	CLRF	r0x02
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00234_DS_
	MOVLW	0x20
	SUBWF	r0x01, W
_00234_DS_:
	BC	_00222_DS_
;	.line	331; test.c	LCDText[LCDPos] = 0;
	CLRF	r0x01
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
_00222_DS_:
;	.line	332; test.c	LCDUpdate();
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
;	.line	243; test.c	void LowPriorityInterrupt(void) __interrupt (2)
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
;	.line	245; test.c	if (INTCON3bits.INT3F){ //Interupt Flag BUT1
	BTFSS	_INTCON3bits, 2
	BRA	_00195_DS_
;	.line	246; test.c	switch(stateMenu){
	MOVLW	0x00
	BANKSEL	(_stateMenu + 1)
	SUBWF	(_stateMenu + 1), W, B
	BNZ	_00212_DS_
	MOVLW	0x07
	BANKSEL	_stateMenu
	SUBWF	_stateMenu, W, B
_00212_DS_:
	BTFSC	STATUS, 0
	BRA	_00193_DS_
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	CLRF	r0x01
	BANKSEL	_stateMenu
	RLCF	_stateMenu, W, B
	RLCF	r0x01, F
	RLCF	WREG, W
	RLCF	r0x01, F
	ANDLW	0xfc
	MOVWF	r0x00
	MOVLW	UPPER(_00213_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00213_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00213_DS_)
	ADDWF	r0x00, F
	MOVF	r0x01, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVWF	PCL
_00213_DS_:
	GOTO	_00186_DS_
	GOTO	_00187_DS_
	GOTO	_00188_DS_
	GOTO	_00189_DS_
	GOTO	_00190_DS_
	GOTO	_00191_DS_
	GOTO	_00192_DS_
_00186_DS_:
;	.line	247; test.c	case STANDARD_STATE: alarmStatus ^=1; // Enable/disable alarm
	MOVLW	0x01
	BANKSEL	_alarmStatus
	XORWF	_alarmStatus, F, B
;	.line	248; test.c	break; // ADD SMTHNG TO STOP ALARM :)
	BRA	_00193_DS_
_00187_DS_:
;	.line	249; test.c	case SET_TIME_MENU: stateMenu = SET_TIME_MINUTES;
	MOVLW	0x02
	BANKSEL	_stateMenu
	MOVWF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	250; test.c	break;
	BRA	_00193_DS_
_00188_DS_:
	BANKSEL	_minutes
;	.line	251; test.c	case SET_TIME_MINUTES: minutes++;
	INCF	_minutes, F, B
	BNC	_10249_DS_
	BANKSEL	(_minutes + 1)
	INCF	(_minutes + 1), F, B
_10249_DS_:
;	.line	252; test.c	break;
	BRA	_00193_DS_
_00189_DS_:
	BANKSEL	_hours
;	.line	253; test.c	case SET_TIME_HOURS : hours++;
	INCF	_hours, F, B
	BNC	_20250_DS_
	BANKSEL	(_hours + 1)
	INCF	(_hours + 1), F, B
_20250_DS_:
;	.line	254; test.c	break;
	BRA	_00193_DS_
_00190_DS_:
;	.line	255; test.c	case SET_ALARMCLOCK_MENU : stateMenu = SET_ALARMCLOCK_MINUTES;
	MOVLW	0x05
	BANKSEL	_stateMenu
	MOVWF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	256; test.c	break;
	BRA	_00193_DS_
_00191_DS_:
	BANKSEL	_alarmMinutes
;	.line	257; test.c	case SET_ALARMCLOCK_MINUTES : alarmMinutes++;
	INCF	_alarmMinutes, F, B
	BNC	_30251_DS_
	BANKSEL	(_alarmMinutes + 1)
	INCF	(_alarmMinutes + 1), F, B
_30251_DS_:
;	.line	258; test.c	break;
	BRA	_00193_DS_
_00192_DS_:
	BANKSEL	_alarmHours
;	.line	259; test.c	case SET_ALARMCLOCK_HOURS : alarmHours++;
	INCF	_alarmHours, F, B
	BNC	_40252_DS_
	BANKSEL	(_alarmHours + 1)
	INCF	(_alarmHours + 1), F, B
_40252_DS_:
_00193_DS_:
;	.line	265; test.c	INTCON3bits.INT3F = 0; // clear flag
	BCF	_INTCON3bits, 2
_00195_DS_:
;	.line	268; test.c	if (INTCON3bits.INT1F){ //Interupt Flag BUT2
	BTFSS	_INTCON3bits, 0
	BRA	_00206_DS_
;	.line	269; test.c	switch(stateMenu){
	MOVLW	0x00
	BANKSEL	(_stateMenu + 1)
	SUBWF	(_stateMenu + 1), W, B
	BNZ	_00215_DS_
	MOVLW	0x07
	BANKSEL	_stateMenu
	SUBWF	_stateMenu, W, B
_00215_DS_:
	BTFSC	STATUS, 0
	BRA	_00203_DS_
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	CLRF	r0x01
	BANKSEL	_stateMenu
	RLCF	_stateMenu, W, B
	RLCF	r0x01, F
	RLCF	WREG, W
	RLCF	r0x01, F
	ANDLW	0xfc
	MOVWF	r0x00
	MOVLW	UPPER(_00216_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00216_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00216_DS_)
	ADDWF	r0x00, F
	MOVF	r0x01, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVWF	PCL
_00216_DS_:
	GOTO	_00196_DS_
	GOTO	_00197_DS_
	GOTO	_00198_DS_
	GOTO	_00199_DS_
	GOTO	_00200_DS_
	GOTO	_00201_DS_
	GOTO	_00202_DS_
_00196_DS_:
;	.line	270; test.c	case STANDARD_STATE: stateMenu = SET_TIME_MENU;
	MOVLW	0x01
	BANKSEL	_stateMenu
	MOVWF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	271; test.c	break; // ADD SMTHNG TO STOP ALARM :)
	BRA	_00203_DS_
_00197_DS_:
;	.line	272; test.c	case SET_TIME_MENU: stateMenu = SET_ALARMCLOCK_MENU;
	MOVLW	0x04
	BANKSEL	_stateMenu
	MOVWF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	273; test.c	break;
	BRA	_00203_DS_
_00198_DS_:
;	.line	274; test.c	case SET_TIME_MINUTES: stateMenu = SET_TIME_HOURS;
	MOVLW	0x03
	BANKSEL	_stateMenu
	MOVWF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	275; test.c	break;
	BRA	_00203_DS_
_00199_DS_:
	BANKSEL	_stateMenu
;	.line	276; test.c	case SET_TIME_HOURS : stateMenu = STANDARD_STATE;
	CLRF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	277; test.c	break;
	BRA	_00203_DS_
_00200_DS_:
	BANKSEL	_stateMenu
;	.line	278; test.c	case SET_ALARMCLOCK_MENU : stateMenu = STANDARD_STATE;
	CLRF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	279; test.c	break;
	BRA	_00203_DS_
_00201_DS_:
;	.line	280; test.c	case SET_ALARMCLOCK_MINUTES : stateMenu = SET_ALARMCLOCK_HOURS;
	MOVLW	0x06
	BANKSEL	_stateMenu
	MOVWF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
;	.line	281; test.c	break;
	BRA	_00203_DS_
_00202_DS_:
	BANKSEL	_stateMenu
;	.line	282; test.c	case SET_ALARMCLOCK_HOURS : stateMenu = STANDARD_STATE;
	CLRF	_stateMenu, B
	BANKSEL	(_stateMenu + 1)
	CLRF	(_stateMenu + 1), B
_00203_DS_:
;	.line	287; test.c	INTCON3bits.INT1F = 0; // clear flag
	BCF	_INTCON3bits, 0
_00206_DS_:
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
;	.line	225; test.c	void HighPriorityInterrupt(void) __interrupt (1)
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
;	.line	227; test.c	if (INTCONbits.TMR0IF)
	BTFSS	_INTCONbits, 2
	BRA	_00181_DS_
;	.line	231; test.c	TMR0H = 0xA0; 
	MOVLW	0xa0
	MOVWF	_TMR0H
;	.line	232; test.c	TMR0L = 0xA2;
	MOVLW	0xa2
	MOVWF	_TMR0L
;	.line	233; test.c	INTCONbits.TMR0IF = 0; // OBLIGATOIRE: Remettre le bit d'interruption à zéro
	BCF	_INTCONbits, 2
	BANKSEL	_seconds
;	.line	234; test.c	seconds++;
	INCF	_seconds, F, B
	BNC	_50253_DS_
	BANKSEL	(_seconds + 1)
	INCF	(_seconds + 1), F, B
_50253_DS_:
_00181_DS_:
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
S_test__StartTimer1	code
_StartTimer1:
;	.line	206; test.c	void StartTimer1(void){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	207; test.c	T1CONbits.RD16 = 0; // Utilisation de 8 bits
	BCF	_T1CONbits, 7
;	.line	208; test.c	T1CONbits.T1RUN = 0; // Utilise l'oscillateur du TMR1
	BCF	_T1CONbits, 6
;	.line	209; test.c	T1CONbits.T1CKPS0 = 0; // désactiver le prescaler (1:1)
	BCF	_T1CONbits, 4
;	.line	210; test.c	T1CONbits.T1CKPS1 = 0;
	BCF	_T1CONbits, 5
;	.line	211; test.c	T1CONbits.T1OSCEN = 1; // Active l'oscillateur
	BSF	_T1CONbits, 3
;	.line	212; test.c	T1CONbits.TMR1CS = 1; // Utilise la clock de l'oscillateur.
	BSF	_T1CONbits, 1
;	.line	213; test.c	TMR1H = 0xC0; // On commence aux 3/4 de la valeur pour ne compter que 0,5 sec.
	MOVLW	0xc0
	MOVWF	_TMR1H
;	.line	215; test.c	PIE1bits.TMR1IE = 1; //enable timer1 interrupt
	BSF	_PIE1bits, 0
;	.line	216; test.c	IPR1bits.TMR1IP	= 1; //timer1 interrupt set to high priority
	BSF	_IPR1bits, 0
;	.line	217; test.c	PIR1bits.TMR1IF = 0; //clear timer1 flag bit
	BCF	_PIR1bits, 0
;	.line	219; test.c	T1CONbits.TMR1ON = 1;
	BSF	_T1CONbits, 0
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__ConvertTime	code
_ConvertTime:
;	.line	193; test.c	void ConvertTime(short time, char* str){
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
;	.line	194; test.c	if(time<10){
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00169_DS_
	MOVLW	0x0a
	SUBWF	r0x00, W
_00169_DS_:
	BC	_00164_DS_
;	.line	195; test.c	sprintf(str,"0%u\0",time);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_9)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_9)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_9)
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
	BRA	_00166_DS_
_00164_DS_:
;	.line	197; test.c	sprintf(str,"%u\0",time);
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
_00166_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__UpdateLCD	code
_UpdateLCD:
;	.line	145; test.c	void UpdateLCD(){
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
;	.line	146; test.c	switch(stateMenu){
	MOVLW	0x00
	BANKSEL	(_stateMenu + 1)
	SUBWF	(_stateMenu + 1), W, B
	BNZ	_00157_DS_
	MOVLW	0x07
	BANKSEL	_stateMenu
	SUBWF	_stateMenu, W, B
_00157_DS_:
	BTFSC	STATUS, 0
	GOTO	_00152_DS_
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
	MOVLW	UPPER(_00158_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00158_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00158_DS_)
	ADDWF	r0x0f, F
	MOVF	r0x10, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x0f, W
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVWF	PCL
_00158_DS_:
	GOTO	_00142_DS_
	GOTO	_00146_DS_
	GOTO	_00147_DS_
	GOTO	_00148_DS_
	GOTO	_00149_DS_
	GOTO	_00150_DS_
	GOTO	_00151_DS_
_00142_DS_:
;	.line	148; test.c	ConvertTime(hours, h);
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
;	.line	149; test.c	ConvertTime(minutes, m);
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
;	.line	150; test.c	ConvertTime(seconds, s);
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
	BANKSEL	_alarmStatus
;	.line	151; test.c	if(alarmStatus){
	MOVF	_alarmStatus, W, B
	BANKSEL	(_alarmStatus + 1)
	IORWF	(_alarmStatus + 1), W, B
	BZ	_00144_DS_
;	.line	152; test.c	sprintf(alarmState,"ON ");
	MOVLW	HIGH(_alarmState)
	MOVWF	r0x01
	MOVLW	LOW(_alarmState)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
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
	BRA	_00145_DS_
_00144_DS_:
;	.line	154; test.c	sprintf(alarmState,"OFF");
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
_00145_DS_:
;	.line	156; test.c	sprintf(LCDPrint,"    %s:%s:%s    Alarm %s",h,m,s,alarmState);
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
;	.line	157; test.c	break;
	BRA	_00152_DS_
_00146_DS_:
;	.line	159; test.c	sprintf(LCDPrint, "      MENU        Set time ?");
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
;	.line	160; test.c	break;
	BRA	_00152_DS_
_00147_DS_:
;	.line	162; test.c	ConvertTime(hours, h);
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
;	.line	163; test.c	ConvertTime(minutes, m);
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
;	.line	164; test.c	ConvertTime(seconds, s);
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
;	.line	165; test.c	sprintf(LCDPrint,"Set Minutes     %s:[%s]:%s",h,m,s);
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
;	.line	166; test.c	break;
	BRA	_00152_DS_
_00148_DS_:
;	.line	168; test.c	ConvertTime(hours, h);
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
;	.line	169; test.c	ConvertTime(minutes, m);
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
;	.line	170; test.c	ConvertTime(seconds, s);
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
;	.line	171; test.c	sprintf(LCDPrint,"Set Hours       [%s]:%s:%s",h,m,s);
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
;	.line	172; test.c	break;
	BRA	_00152_DS_
_00149_DS_:
;	.line	174; test.c	sprintf(LCDPrint, "      MENU      Set Alarmclock?");
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
;	.line	175; test.c	break;
	BRA	_00152_DS_
_00150_DS_:
;	.line	177; test.c	ConvertTime(alarmHours, h);
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
;	.line	178; test.c	ConvertTime(alarmMinutes, m);
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
;	.line	179; test.c	sprintf(LCDPrint,"Set Alarm Min    %s:[%s]",h,m);
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
;	.line	180; test.c	break;
	BRA	_00152_DS_
_00151_DS_:
;	.line	182; test.c	ConvertTime(alarmHours, h);
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
;	.line	183; test.c	ConvertTime(alarmMinutes, m);
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
;	.line	184; test.c	sprintf(LCDPrint,"Set Alarm Hours  [%s]:%s",h,m);
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
_00152_DS_:
;	.line	187; test.c	DisplayString(0, LCDPrint);
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
S_test__UpdateTime	code
_UpdateTime:
;	.line	127; test.c	void UpdateTime(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	128; test.c	if(seconds>=60)
	MOVLW	0x00
	BANKSEL	(_seconds + 1)
	SUBWF	(_seconds + 1), W, B
	BNZ	_00134_DS_
	MOVLW	0x3c
	BANKSEL	_seconds
	SUBWF	_seconds, W, B
_00134_DS_:
	BNC	_00124_DS_
;	.line	130; test.c	seconds = seconds - 60; // si une interruption a empêché l'update pendant + d'une seconde.
	MOVLW	0xc4
	BANKSEL	_seconds
	ADDWF	_seconds, F, B
	BC	_60254_DS_
	BANKSEL	(_seconds + 1)
	DECF	(_seconds + 1), F, B
_60254_DS_:
	BANKSEL	_minutes
;	.line	131; test.c	minutes++;
	INCF	_minutes, F, B
	BNC	_70255_DS_
	BANKSEL	(_minutes + 1)
	INCF	(_minutes + 1), F, B
_70255_DS_:
_00124_DS_:
	BANKSEL	_minutes
;	.line	133; test.c	if(minutes == 60){
	MOVF	_minutes, W, B
	XORLW	0x3c
	BNZ	_00135_DS_
	BANKSEL	(_minutes + 1)
	MOVF	(_minutes + 1), W, B
	BZ	_00136_DS_
_00135_DS_:
	BRA	_00126_DS_
_00136_DS_:
	BANKSEL	_minutes
;	.line	134; test.c	minutes = 0;
	CLRF	_minutes, B
	BANKSEL	(_minutes + 1)
	CLRF	(_minutes + 1), B
	BANKSEL	_hours
;	.line	135; test.c	hours++;
	INCF	_hours, F, B
	BNC	_80256_DS_
	BANKSEL	(_hours + 1)
	INCF	(_hours + 1), F, B
_80256_DS_:
_00126_DS_:
;	.line	137; test.c	if(hours > 23){
	MOVLW	0x00
	BANKSEL	(_hours + 1)
	SUBWF	(_hours + 1), W, B
	BNZ	_00137_DS_
	MOVLW	0x18
	BANKSEL	_hours
	SUBWF	_hours, W, B
_00137_DS_:
	BNC	_00129_DS_
	BANKSEL	_hours
;	.line	138; test.c	hours = 0;
	CLRF	_hours, B
	BANKSEL	(_hours + 1)
	CLRF	(_hours + 1), B
_00129_DS_:
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__ConfigButtons	code
_ConfigButtons:
;	.line	112; test.c	void ConfigButtons(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	113; test.c	INTCON3bits.INT1IP = 0; // Low priority interrupt for up butt
	BCF	_INTCON3bits, 6
;	.line	114; test.c	INTCON2bits.INT3IP = 0; // Low priority interrupt for down butt
	BCF	_INTCON2bits, 1
;	.line	115; test.c	INTCON2bits.INTEDG1 = 0; // Interrupt on falling edge
	BCF	_INTCON2bits, 5
;	.line	116; test.c	INTCON2bits.INTEDG3 = 0; // Interrupt on falling edge
	BCF	_INTCON2bits, 3
;	.line	117; test.c	INTCON3bits.INT3F = 0; // clear flag
	BCF	_INTCON3bits, 2
;	.line	118; test.c	INTCON3bits.INT1F = 0; // clear flag	
	BCF	_INTCON3bits, 0
;	.line	119; test.c	INTCON3bits.INT1E = 1; // Up button interrupt enable
	BSF	_INTCON3bits, 3
;	.line	120; test.c	INTCON3bits.INT3E = 1; // Down button interrupt enable
	BSF	_INTCON3bits, 5
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__ConfigTimer0	code
_ConfigTimer0:
;	.line	80; test.c	void ConfigTimer0(void){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	82; test.c	INTCON2bits.TMR0IP = 1; // Priorité Haute
	BSF	_INTCON2bits, 2
;	.line	83; test.c	INTCONbits.TMR0IE = 1;	// Activation interruption Timer 0
	BSF	_INTCONbits, 5
;	.line	84; test.c	INTCONbits.TMR0IF = 0; // clear timer0 flag
	BCF	_INTCONbits, 2
;	.line	88; test.c	T0CONbits.T08BIT = 0;		
	BCF	_T0CONbits, 6
;	.line	90; test.c	T0CONbits.T0CS = 0;	
	BCF	_T0CONbits, 5
;	.line	96; test.c	T0CONbits.PSA = 0;
	BCF	_T0CONbits, 3
;	.line	97; test.c	T0CONbits.T0PS0 = 1; // diviseur par 256 
	BSF	_T0CONbits, 0
;	.line	98; test.c	T0CONbits.T0PS1 = 1;
	BSF	_T0CONbits, 1
;	.line	99; test.c	T0CONbits.T0PS2 = 1;
	BSF	_T0CONbits, 2
;	.line	101; test.c	TMR0H = 0xA0;
	MOVLW	0xa0
	MOVWF	_TMR0H
;	.line	102; test.c	TMR0L = 0xA2;
	MOVLW	0xa2
	MOVWF	_TMR0L
;	.line	104; test.c	T0CONbits.TMR0ON = 1;
	BSF	_T0CONbits, 7
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
__str_0:
	DB	0x4f, 0x4e, 0x20, 0x00
; ; Starting pCode block
__str_1:
	DB	0x4f, 0x46, 0x46, 0x00
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
	DB	0x30, 0x25, 0x75, 0x00, 0x00
; ; Starting pCode block
__str_10:
	DB	0x25, 0x75, 0x00, 0x00


; Statistics:
; code size:	 3770 (0x0eba) bytes ( 2.88%)
;           	 1885 (0x075d) words
; udata size:	   66 (0x0042) bytes ( 1.72%)
; access size:	   22 (0x0016) bytes


	end
