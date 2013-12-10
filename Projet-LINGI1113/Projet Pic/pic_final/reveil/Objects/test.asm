;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Mar 13 2012) (UNIX)
; This file was generated Mon Mar 26 15:39:16 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f97j60

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _update_lcd
	global _convert_value
	global _DisplayWORD
	global _DisplayString
	global _strlcpy
	global _ring_today
	global _alarm_set
	global _alarm_ring
	global _state
	global _hour
	global _minute
	global _second
	global _alarm_hour
	global _alarm_minute
	global _blink
	global _high_isrr
	global _check_alarm
	global _add_second
	global _timer0_conf
	global _main
	global _add_minute
	global _add_hour

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


	idata
_ring_today	db	0x00, 0x00
_alarm_set	db	0x00, 0x00
_alarm_ring	db	0x00, 0x00
_state	db	0x00, 0x00
_hour	db	0x00, 0x00
_minute	db	0x00, 0x00
_second	db	0x00, 0x00
_alarm_hour	db	0x00, 0x00
_alarm_minute	db	0x00, 0x00
_blink	db	0x01, 0x00


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
_update_lcd_lcd_1_1	res	32

udata_test_1	udata
_update_lcd_h_1_1	res	3

udata_test_2	udata
_update_lcd_m_1_1	res	3

udata_test_3	udata
_update_lcd_s_1_1	res	3

udata_test_4	udata
_update_lcd_a_h_1_1	res	3

udata_test_5	udata
_update_lcd_a_m_1_1	res	3

udata_test_6	udata
_DisplayWORD_WDigit_1_1	res	6

;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_test_ivec_0x1_high_isrr	code	0X000008
ivec_0x1_high_isrr:
	GOTO	_high_isrr

; I code from now on!
; ; Starting pCode block
S_test__main	code
_main:
;	.line	233; test.c	timer0_conf();	
	CALL	_timer0_conf
;	.line	235; test.c	LED0_TRIS = 0; //configure 1st led pin as output (yellow)
	BCF	_TRISJbits, 0
;	.line	236; test.c	LED1_TRIS = 0; //configure 2nd led pin as output (red)
	BCF	_TRISJbits, 1
;	.line	237; test.c	LED2_TRIS = 0; //configure 3rd led pin as output (red)
	BCF	_TRISJbits, 2
;	.line	239; test.c	RCONbits.IPEN      = 1;   //enable interrupts priority levels
	BSF	_RCONbits, 7
;	.line	240; test.c	INTCON2bits.INTEDG1= 0;   //INT1 interrupts on falling edge
	BCF	_INTCON2bits, 5
;	.line	241; test.c	INTCONbits.GIE     = 1;   //enable high priority interrupts
	BSF	_INTCONbits, 7
;	.line	243; test.c	INTCON3bits.INT1E  = 1;   //enable INT1 interrupt (button 2)
	BSF	_INTCON3bits, 3
;	.line	244; test.c	INTCON3bits.INT1F  = 0;   //clear INT1 flag
	BCF	_INTCON3bits, 0
;	.line	246; test.c	INTCON3bits.INT3E  = 1;   //enable INT1 interrupt (button 2)
	BSF	_INTCON3bits, 5
;	.line	247; test.c	INTCON3bits.INT3F  = 0;   //clear INT1 flag
	BCF	_INTCON3bits, 2
;	.line	249; test.c	LCDInit();
	CALL	_LCDInit
;	.line	251; test.c	state = CONFIG_CLOCK_HOUR;   
	MOVLW	0x04
	BANKSEL	_state
	MOVWF	_state, B
	BANKSEL	(_state + 1)
	CLRF	(_state + 1), B
;	.line	252; test.c	blink^=1;
	MOVLW	0x01
	BANKSEL	_blink
	XORWF	_blink, F, B
;	.line	253; test.c	update_lcd();      
	CALL	_update_lcd
;	.line	254; test.c	T0CONbits.TMR0ON = 1;
	BSF	_T0CONbits, 7
	RETURN	

; ; Starting pCode block
S_test__strlcpy	code
_strlcpy:
;	.line	481; test.c	strlcpy(char *dst, const char *src, size_t siz)
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
;	.line	483; test.c	char       *d = dst;
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
;	.line	484; test.c	const char *s = src;
	MOVFF	r0x03, r0x0b
	MOVFF	r0x04, r0x0c
	MOVFF	r0x05, r0x0d
;	.line	485; test.c	size_t      n = siz;
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
;	.line	488; test.c	if (n != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00469_DS_
;	.line	490; test.c	while (--n != 0)
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	MOVFF	r0x05, r0x12
	MOVFF	r0x06, r0x13
	MOVFF	r0x07, r0x14
_00465_DS_:
	MOVLW	0xff
	ADDWF	r0x13, F
	BTFSS	STATUS, 0
	DECF	r0x14, F
	MOVF	r0x13, W
	IORWF	r0x14, W
	BZ	_00484_DS_
;	.line	492; test.c	if ((*d++ = *s++) == '\0')
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
	BNZ	_00465_DS_
_00484_DS_:
;	.line	493; test.c	break;
	MOVFF	r0x10, r0x0b
	MOVFF	r0x11, r0x0c
	MOVFF	r0x12, r0x0d
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
	MOVFF	r0x13, r0x0e
	MOVFF	r0x14, r0x0f
_00469_DS_:
;	.line	498; test.c	if (n == 0)
	MOVF	r0x0e, W
	IORWF	r0x0f, W
	BNZ	_00476_DS_
;	.line	500; test.c	if (siz != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00483_DS_
;	.line	501; test.c	*d = '\0';          /* NUL-terminate dst */
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput1
_00483_DS_:
;	.line	502; test.c	while (*s++)
	MOVFF	r0x0b, r0x00
	MOVFF	r0x0c, r0x01
	MOVFF	r0x0d, r0x02
_00472_DS_:
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
	BNZ	_00472_DS_
	MOVFF	r0x00, r0x0b
	MOVFF	r0x01, r0x0c
	MOVFF	r0x02, r0x0d
_00476_DS_:
;	.line	508; test.c	return (s - src - 1);       /* count does not include NUL */
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
;	.line	435; test.c	void DisplayString(BYTE pos, char* text)
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
;	.line	437; test.c	BYTE l= strlen(text)+1;
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
;	.line	438; test.c	BYTE max= 32-pos;
	MOVF	r0x00, W
	SUBLW	0x20
	MOVWF	r0x05
;	.line	439; test.c	strlcpy((char*)&LCDText[pos], text,(l<max)?l:max );
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
	BNC	_00456_DS_
	MOVFF	r0x05, r0x04
_00456_DS_:
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
;	.line	440; test.c	LCDUpdate();
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
;	.line	413; test.c	void DisplayWORD(BYTE pos, WORD w) //WORD is a 16 bits unsigned
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
;	.line	421; test.c	ultoa(w, WDigit, radix);      
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
;	.line	422; test.c	for(j = 0; j < strlen((char*)WDigit); j++)
	CLRF	r0x01
_00437_DS_:
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
	BNZ	_00447_DS_
	MOVF	r0x02, W
	SUBWF	r0x04, W
_00447_DS_:
	BC	_00440_DS_
;	.line	424; test.c	LCDText[LCDPos++] = WDigit[j];
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
;	.line	422; test.c	for(j = 0; j < strlen((char*)WDigit); j++)
	INCF	r0x01, F
	BRA	_00437_DS_
_00440_DS_:
;	.line	426; test.c	if(LCDPos < 32u)
	MOVFF	r0x00, r0x01
	CLRF	r0x02
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00448_DS_
	MOVLW	0x20
	SUBWF	r0x01, W
_00448_DS_:
	BC	_00436_DS_
;	.line	427; test.c	LCDText[LCDPos] = 0;
	CLRF	r0x01
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
_00436_DS_:
;	.line	428; test.c	LCDUpdate();
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
S_test__convert_value	code
_convert_value:
;	.line	396; test.c	void convert_value(int value, char* r){
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
;	.line	398; test.c	if(value<=9) sprintf(r, "0%d", value);
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00430_DS_
	MOVLW	0x0a
	SUBWF	r0x00, W
_00430_DS_:
	BC	_00425_DS_
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_15)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_15)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_15)
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
	BRA	_00427_DS_
_00425_DS_:
;	.line	399; test.c	else sprintf(r, "%d", value);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_16)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_16)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_16)
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
_00427_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__add_hour	code
_add_hour:
;	.line	386; test.c	void add_hour(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	_hour
;	.line	388; test.c	hour++;
	INCF	_hour, F, B
	BNC	_10463_DS_
	BANKSEL	(_hour + 1)
	INCF	(_hour + 1), F, B
_10463_DS_:
	BANKSEL	(_hour + 1)
;	.line	389; test.c	if(hour>=24){ 
	MOVF	(_hour + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00419_DS_
	MOVLW	0x18
	BANKSEL	_hour
	SUBWF	_hour, W, B
_00419_DS_:
	BNC	_00416_DS_
	BANKSEL	_hour
;	.line	390; test.c	hour = 0;		
	CLRF	_hour, B
	BANKSEL	(_hour + 1)
	CLRF	(_hour + 1), B
	BANKSEL	_ring_today
;	.line	391; test.c	ring_today = 0;
	CLRF	_ring_today, B
	BANKSEL	(_ring_today + 1)
	CLRF	(_ring_today + 1), B
_00416_DS_:
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__add_minute	code
_add_minute:
;	.line	376; test.c	void add_minute(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	_minute
;	.line	378; test.c	minute++;
	INCF	_minute, F, B
	BNC	_20464_DS_
	BANKSEL	(_minute + 1)
	INCF	(_minute + 1), F, B
_20464_DS_:
	BANKSEL	(_minute + 1)
;	.line	379; test.c	if(minute>=60){
	MOVF	(_minute + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00409_DS_
	MOVLW	0x3c
	BANKSEL	_minute
	SUBWF	_minute, W, B
_00409_DS_:
	BNC	_00406_DS_
	BANKSEL	_minute
;	.line	380; test.c	minute = 0;		
	CLRF	_minute, B
	BANKSEL	(_minute + 1)
	CLRF	(_minute + 1), B
;	.line	381; test.c	add_hour();
	CALL	_add_hour
_00406_DS_:
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__add_second	code
_add_second:
;	.line	366; test.c	void add_second(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	_second
;	.line	368; test.c	second++;
	INCF	_second, F, B
	BNC	_30465_DS_
	BANKSEL	(_second + 1)
	INCF	(_second + 1), F, B
_30465_DS_:
	BANKSEL	(_second + 1)
;	.line	369; test.c	if(second>=60){
	MOVF	(_second + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00399_DS_
	MOVLW	0x3c
	BANKSEL	_second
	SUBWF	_second, W, B
_00399_DS_:
	BNC	_00396_DS_
	BANKSEL	_second
;	.line	370; test.c	second = 0;		
	CLRF	_second, B
	BANKSEL	(_second + 1)
	CLRF	(_second + 1), B
;	.line	371; test.c	add_minute();
	CALL	_add_minute
_00396_DS_:
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__update_lcd	code
_update_lcd:
;	.line	268; test.c	void update_lcd(){
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
	BANKSEL	_state
;	.line	279; test.c	if(state==0){		
	MOVF	_state, W, B
	BANKSEL	(_state + 1)
	IORWF	(_state + 1), W, B
	BNZ	_00353_DS_
;	.line	281; test.c	sprintf(lcd, " STARTING...    ");
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_lcd_1_1)
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
	GOTO	_00354_DS_
_00353_DS_:
	BANKSEL	_state
;	.line	284; test.c	}else if(state==SHOW_TIME){	
	MOVF	_state, W, B
	XORLW	0x01
	BNZ	_00374_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00375_DS_
_00374_DS_:
	BRA	_00350_DS_
_00375_DS_:
;	.line	286; test.c	convert_value(hour, h);
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_hour + 1)
	MOVF	(_hour + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_hour
	MOVF	_hour, W, B
	MOVWF	POSTDEC1
	CALL	_convert_value
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	287; test.c	convert_value(minute, m);
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_minute + 1)
	MOVF	(_minute + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_minute
	MOVF	_minute, W, B
	MOVWF	POSTDEC1
	CALL	_convert_value
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	288; test.c	convert_value(second, s);
	MOVLW	HIGH(_update_lcd_s_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_s_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_second + 1)
	MOVF	(_second + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_second
	MOVF	_second, W, B
	MOVWF	POSTDEC1
	CALL	_convert_value
	MOVLW	0x05
	ADDWF	FSR1L, F
	BANKSEL	_alarm_ring
;	.line	291; test.c	if(alarm_ring){
	MOVF	_alarm_ring, W, B
	BANKSEL	(_alarm_ring + 1)
	IORWF	(_alarm_ring + 1), W, B
	BTFSC	STATUS, 2
	BRA	_00312_DS_
	BANKSEL	_blink
;	.line	293; test.c	if(blink) sprintf(lcd, 	" !! %s:%s:%s !!  WAKE UP! DUDE! ", h, m, s);
	MOVF	_blink, W, B
	BANKSEL	(_blink + 1)
	IORWF	(_blink + 1), W, B
	BTFSC	STATUS, 2
	BRA	_00306_DS_
	MOVLW	HIGH(_update_lcd_s_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_s_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x0a
	MOVLW	LOW(_update_lcd_lcd_1_1)
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
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
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
	GOTO	_00354_DS_
_00306_DS_:
;	.line	294; test.c	else sprintf(lcd, 	"    %s:%s:%s     WAKE UP! DUDE! ", h, m, s);
	MOVLW	HIGH(_update_lcd_s_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_s_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x0a
	MOVLW	LOW(_update_lcd_lcd_1_1)
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
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
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
	GOTO	_00354_DS_
_00312_DS_:
	BANKSEL	_alarm_set
;	.line	296; test.c	}else if(alarm_set){
	MOVF	_alarm_set, W, B
	BANKSEL	(_alarm_set + 1)
	IORWF	(_alarm_set + 1), W, B
	BTFSC	STATUS, 2
	BRA	_00309_DS_
;	.line	298; test.c	convert_value(alarm_hour, a_h);
	MOVLW	HIGH(_update_lcd_a_h_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_a_h_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_alarm_hour + 1)
	MOVF	(_alarm_hour + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_alarm_hour
	MOVF	_alarm_hour, W, B
	MOVWF	POSTDEC1
	CALL	_convert_value
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	299; test.c	convert_value(alarm_minute, a_m);
	MOVLW	HIGH(_update_lcd_a_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_a_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_alarm_minute + 1)
	MOVF	(_alarm_minute + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_alarm_minute
	MOVF	_alarm_minute, W, B
	MOVWF	POSTDEC1
	CALL	_convert_value
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	300; test.c	sprintf(lcd, "    %s:%s:%s     ALARM  [%s:%s]", h, m, s, a_h, a_m);
	MOVLW	HIGH(_update_lcd_a_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_a_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_update_lcd_a_h_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_update_lcd_a_h_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_update_lcd_s_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_update_lcd_s_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x0a
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x0d
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x0c
	MOVLW	0x80
	MOVWF	r0x0e
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x10
	MOVLW	LOW(_update_lcd_lcd_1_1)
	MOVWF	r0x0f
	MOVLW	0x80
	MOVWF	r0x11
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
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x15
	ADDWF	FSR1L, F
	GOTO	_00354_DS_
_00309_DS_:
;	.line	304; test.c	sprintf(lcd, "    %s:%s:%s       ALARM: OFF", h, m, s);
	MOVLW	HIGH(_update_lcd_s_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_s_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x0a
	MOVLW	LOW(_update_lcd_lcd_1_1)
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
	GOTO	_00354_DS_
_00350_DS_:
	BANKSEL	_state
;	.line	309; test.c	}else if(state == CONFIG_CLOCK){	
	MOVF	_state, W, B
	XORLW	0x02
	BNZ	_00376_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00377_DS_
_00376_DS_:
	BRA	_00347_DS_
_00377_DS_:
;	.line	311; test.c	sprintf(lcd, "      MENU        CHANGE CLOCK?");
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_lcd_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_5)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_5)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_5)
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
	GOTO	_00354_DS_
_00347_DS_:
	BANKSEL	_state
;	.line	314; test.c	}else if(state == CONFIG_ALARM){	
	MOVF	_state, W, B
	XORLW	0x03
	BNZ	_00378_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00379_DS_
_00378_DS_:
	BRA	_00344_DS_
_00379_DS_:
;	.line	316; test.c	sprintf(lcd, "      MENU        CHANGE ALARM?");
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_lcd_1_1)
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
	GOTO	_00354_DS_
_00344_DS_:
	BANKSEL	_state
;	.line	319; test.c	}else if(state == CONFIG_CLOCK_HOUR){	
	MOVF	_state, W, B
	XORLW	0x04
	BNZ	_00380_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00381_DS_
_00380_DS_:
	BRA	_00341_DS_
_00381_DS_:
;	.line	321; test.c	convert_value(hour, h);
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_hour + 1)
	MOVF	(_hour + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_hour
	MOVF	_hour, W, B
	MOVWF	POSTDEC1
	CALL	_convert_value
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	322; test.c	convert_value(minute, m);
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_minute + 1)
	MOVF	(_minute + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_minute
	MOVF	_minute, W, B
	MOVWF	POSTDEC1
	CALL	_convert_value
	MOVLW	0x05
	ADDWF	FSR1L, F
	BANKSEL	_blink
;	.line	324; test.c	if(blink) sprintf(lcd, "SET CLOCK:          [%s]: %s", h, m);
	MOVF	_blink, W, B
	BANKSEL	(_blink + 1)
	IORWF	(_blink + 1), W, B
	BZ	_00315_DS_
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_update_lcd_lcd_1_1)
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
	GOTO	_00354_DS_
_00315_DS_:
;	.line	325; test.c	else sprintf(lcd, "SET CLOCK:           %s : %s", h, m);	
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_update_lcd_lcd_1_1)
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
	GOTO	_00354_DS_
_00341_DS_:
	BANKSEL	_state
;	.line	328; test.c	}else if(state == CONFIG_CLOCK_MINUTE){	
	MOVF	_state, W, B
	XORLW	0x05
	BNZ	_00382_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00383_DS_
_00382_DS_:
	BRA	_00338_DS_
_00383_DS_:
;	.line	330; test.c	convert_value(hour, h);
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_hour + 1)
	MOVF	(_hour + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_hour
	MOVF	_hour, W, B
	MOVWF	POSTDEC1
	CALL	_convert_value
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	331; test.c	convert_value(minute, m);
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_minute + 1)
	MOVF	(_minute + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_minute
	MOVF	_minute, W, B
	MOVWF	POSTDEC1
	CALL	_convert_value
	MOVLW	0x05
	ADDWF	FSR1L, F
	BANKSEL	_blink
;	.line	333; test.c	if(blink) sprintf(lcd, "SET CLOCK:           %s :[%s]", h, m);
	MOVF	_blink, W, B
	BANKSEL	(_blink + 1)
	IORWF	(_blink + 1), W, B
	BZ	_00318_DS_
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_update_lcd_lcd_1_1)
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
	MOVLW	UPPER(__str_9)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_9)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_9)
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
	BRA	_00354_DS_
_00318_DS_:
;	.line	334; test.c	else sprintf(lcd, "SET CLOCK:           %s : %s", h, m);	
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_update_lcd_lcd_1_1)
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
	BRA	_00354_DS_
_00338_DS_:
	BANKSEL	_state
;	.line	337; test.c	}else if(state == CONFIG_ALARM_ON_OFF){	
	MOVF	_state, W, B
	XORLW	0x06
	BNZ	_00384_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00385_DS_
_00384_DS_:
	BRA	_00335_DS_
_00385_DS_:
	BANKSEL	_alarm_set
;	.line	339; test.c	if(alarm_set) sprintf(lcd, "SET ALARM:            [ON ]");
	MOVF	_alarm_set, W, B
	BANKSEL	(_alarm_set + 1)
	IORWF	(_alarm_set + 1), W, B
	BZ	_00321_DS_
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_lcd_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_10)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_10)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_10)
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
	BRA	_00354_DS_
_00321_DS_:
;	.line	340; test.c	else sprintf(lcd, "SET ALARM:            [OFF]");	
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_lcd_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_11)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_11)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_11)
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
	BRA	_00354_DS_
_00335_DS_:
	BANKSEL	_state
;	.line	343; test.c	}else if(state == CONFIG_ALARM_HOUR){	
	MOVF	_state, W, B
	XORLW	0x07
	BNZ	_00386_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00387_DS_
_00386_DS_:
	BRA	_00332_DS_
_00387_DS_:
;	.line	345; test.c	convert_value(alarm_hour, h);
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_alarm_hour + 1)
	MOVF	(_alarm_hour + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_alarm_hour
	MOVF	_alarm_hour, W, B
	MOVWF	POSTDEC1
	CALL	_convert_value
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	346; test.c	convert_value(alarm_minute, m);
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_alarm_minute + 1)
	MOVF	(_alarm_minute + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_alarm_minute
	MOVF	_alarm_minute, W, B
	MOVWF	POSTDEC1
	CALL	_convert_value
	MOVLW	0x05
	ADDWF	FSR1L, F
	BANKSEL	_blink
;	.line	348; test.c	if(blink) sprintf(lcd, "SET ALARM:          [%s]: %s", h, m);
	MOVF	_blink, W, B
	BANKSEL	(_blink + 1)
	IORWF	(_blink + 1), W, B
	BZ	_00324_DS_
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_update_lcd_lcd_1_1)
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
	MOVLW	UPPER(__str_12)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_12)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_12)
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
	BRA	_00354_DS_
_00324_DS_:
;	.line	349; test.c	else sprintf(lcd, "SET ALARM:           %s : %s", h, m);	
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_update_lcd_lcd_1_1)
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
	MOVLW	UPPER(__str_13)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_13)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_13)
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
	BRA	_00354_DS_
_00332_DS_:
	BANKSEL	_state
;	.line	352; test.c	}else if(state == CONFIG_ALARM_MINUTE){	
	MOVF	_state, W, B
	XORLW	0x08
	BNZ	_00388_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00389_DS_
_00388_DS_:
	BRA	_00354_DS_
_00389_DS_:
;	.line	354; test.c	convert_value(alarm_hour, h);
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_alarm_hour + 1)
	MOVF	(_alarm_hour + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_alarm_hour
	MOVF	_alarm_hour, W, B
	MOVWF	POSTDEC1
	CALL	_convert_value
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	355; test.c	convert_value(alarm_minute, m);
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_alarm_minute + 1)
	MOVF	(_alarm_minute + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_alarm_minute
	MOVF	_alarm_minute, W, B
	MOVWF	POSTDEC1
	CALL	_convert_value
	MOVLW	0x05
	ADDWF	FSR1L, F
	BANKSEL	_blink
;	.line	357; test.c	if(blink) sprintf(lcd, "SET ALARM:           %s :[%s]", h, m);
	MOVF	_blink, W, B
	BANKSEL	(_blink + 1)
	IORWF	(_blink + 1), W, B
	BZ	_00327_DS_
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_update_lcd_lcd_1_1)
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
	MOVLW	UPPER(__str_14)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_14)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_14)
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
	BRA	_00354_DS_
_00327_DS_:
;	.line	358; test.c	else sprintf(lcd, "SET ALARM:           %s : %s", h, m);	
	MOVLW	HIGH(_update_lcd_m_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_m_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_update_lcd_h_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_update_lcd_h_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_update_lcd_lcd_1_1)
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
	MOVLW	UPPER(__str_13)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_13)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_13)
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
_00354_DS_:
;	.line	362; test.c	DisplayString (0, lcd);
	MOVLW	HIGH(_update_lcd_lcd_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_update_lcd_lcd_1_1)
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
S_test__check_alarm	code
_check_alarm:
;	.line	257; test.c	void check_alarm(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	_alarm_set
;	.line	259; test.c	if(alarm_set && !ring_today && hour == alarm_hour && minute == alarm_minute){
	MOVF	_alarm_set, W, B
	BANKSEL	(_alarm_set + 1)
	IORWF	(_alarm_set + 1), W, B
	BZ	_00291_DS_
	BANKSEL	_ring_today
	MOVF	_ring_today, W, B
	BANKSEL	(_ring_today + 1)
	IORWF	(_ring_today + 1), W, B
	BNZ	_00291_DS_
	BANKSEL	_hour
	MOVF	_hour, W, B
	BANKSEL	_alarm_hour
	XORWF	_alarm_hour, W, B
	BNZ	_00297_DS_
	BANKSEL	(_hour + 1)
	MOVF	(_hour + 1), W, B
	BANKSEL	(_alarm_hour + 1)
	XORWF	(_alarm_hour + 1), W, B
	BZ	_00298_DS_
_00297_DS_:
	BRA	_00291_DS_
_00298_DS_:
	BANKSEL	_minute
	MOVF	_minute, W, B
	BANKSEL	_alarm_minute
	XORWF	_alarm_minute, W, B
	BNZ	_00299_DS_
	BANKSEL	(_minute + 1)
	MOVF	(_minute + 1), W, B
	BANKSEL	(_alarm_minute + 1)
	XORWF	(_alarm_minute + 1), W, B
	BZ	_00300_DS_
_00299_DS_:
	BRA	_00291_DS_
_00300_DS_:
;	.line	261; test.c	alarm_ring = 1;
	MOVLW	0x01
	BANKSEL	_alarm_ring
	MOVWF	_alarm_ring, B
	BANKSEL	(_alarm_ring + 1)
	CLRF	(_alarm_ring + 1), B
;	.line	262; test.c	ring_today = 1;
	MOVLW	0x01
	BANKSEL	_ring_today
	MOVWF	_ring_today, B
	BANKSEL	(_ring_today + 1)
	CLRF	(_ring_today + 1), B
_00291_DS_:
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__timer0_conf	code
_timer0_conf:
;	.line	217; test.c	void timer0_conf(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	218; test.c	T0CONbits.T08BIT = 0;  //use timer0 16-bit counter
	BCF	_T0CONbits, 6
;	.line	219; test.c	T0CONbits.T0CS = 0;  //use timer0 instruction cycle clock
	BCF	_T0CONbits, 5
;	.line	220; test.c	INTCONbits.TMR0IE = 1; // enable timer0 interrupt
	BSF	_INTCONbits, 5
;	.line	221; test.c	T0CONbits.PSA = 0;  //enable timer0 prescaler
	BCF	_T0CONbits, 3
;	.line	223; test.c	T0CONbits.T0PS2 = 1;
	BSF	_T0CONbits, 2
;	.line	224; test.c	T0CONbits.T0PS1 = 1;
	BSF	_T0CONbits, 1
;	.line	225; test.c	T0CONbits.T0PS0 = 0;
	BCF	_T0CONbits, 0
;	.line	227; test.c	TMR0L = LOW(14364);
	MOVLW	0x1c
	MOVWF	_TMR0L
;	.line	228; test.c	TMR0H = HIGH(14364);
	MOVLW	0x38
	MOVWF	_TMR0H
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_test__high_isrr	code
_high_isrr:
;	.line	57; test.c	void high_isrr (void) interrupt 1{
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
	MOVFF	r0x01, POSTDEC1
;	.line	59; test.c	if(INTCONbits.T0IF){
	BTFSS	_INTCONbits, 2
	BRA	_00188_DS_
;	.line	61; test.c	TMR0L = LOW(14364);
	MOVLW	0x1c
	MOVWF	_TMR0L
;	.line	62; test.c	TMR0H = HIGH(14364);
	MOVLW	0x38
	MOVWF	_TMR0H
;	.line	64; test.c	INTCONbits.T0IF = 0;
	BCF	_INTCONbits, 2
;	.line	66; test.c	blink^=1;
	MOVLW	0x01
	BANKSEL	_blink
	XORWF	_blink, F, B
;	.line	67; test.c	update_lcd();
	CALL	_update_lcd
	BANKSEL	_alarm_ring
;	.line	69; test.c	if(alarm_ring){ LED1_IO ^= 1; LED2_IO ^= 1; }
	MOVF	_alarm_ring, W, B
	BANKSEL	(_alarm_ring + 1)
	IORWF	(_alarm_ring + 1), W, B
	BZ	_00106_DS_
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
	BRA	_00107_DS_
_00106_DS_:
;	.line	70; test.c	else{ LED1_IO = 0; LED2_IO = 0; }
	BCF	_LATJbits, 1
	BCF	_LATJbits, 2
_00107_DS_:
;	.line	71; test.c	if(state == SHOW_TIME) LED0_IO ^=1;
	CLRF	r0x00
	BANKSEL	_state
	MOVF	_state, W, B
	XORLW	0x01
	BNZ	_00228_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BNZ	_00228_DS_
	INCF	r0x00, F
_00228_DS_:
	MOVF	r0x00, W
	BZ	_00109_DS_
	CLRF	r0x01
	BTFSC	_LATJbits, 0
	INCF	r0x01, F
	MOVLW	0x01
	XORWF	r0x01, F
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_LATJbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_LATJbits
	BRA	_00110_DS_
_00109_DS_:
;	.line	72; test.c	else LED0_IO = 0;
	BCF	_LATJbits, 0
_00110_DS_:
;	.line	74; test.c	if(state == SHOW_TIME) check_alarm();
	MOVF	r0x00, W
	BZ	_00112_DS_
	CALL	_check_alarm
_00112_DS_:
	BANKSEL	_state
;	.line	75; test.c	if(state != CONFIG_CLOCK_HOUR && state!=CONFIG_CLOCK_MINUTE) add_second();
	MOVF	_state, W, B
	XORLW	0x04
	BNZ	_00231_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00114_DS_
_00231_DS_:
	BANKSEL	_state
	MOVF	_state, W, B
	XORLW	0x05
	BNZ	_00233_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00114_DS_
_00233_DS_:
	CALL	_add_second
_00114_DS_:
;	.line	77; test.c	INTCON3bits.INT1F  = 0;   //clear INT1 flag
	BCF	_INTCON3bits, 0
	BRA	_00190_DS_
_00188_DS_:
;	.line	80; test.c	else if(INTCON3bits.INT1F){
	BTFSS	_INTCON3bits, 0
	BRA	_00185_DS_
	BANKSEL	_state
;	.line	83; test.c	if(state == SHOW_TIME){			
	MOVF	_state, W, B
	XORLW	0x01
	BNZ	_00143_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00235_DS_
_00234_DS_:
	BRA	_00143_DS_
_00235_DS_:
	BANKSEL	_alarm_ring
;	.line	85; test.c	if(alarm_ring){
	MOVF	_alarm_ring, W, B
	BANKSEL	(_alarm_ring + 1)
	IORWF	(_alarm_ring + 1), W, B
	BZ	_00117_DS_
	BANKSEL	_alarm_set
;	.line	87; test.c	alarm_set = 0; 
	CLRF	_alarm_set, B
	BANKSEL	(_alarm_set + 1)
	CLRF	(_alarm_set + 1), B
	BANKSEL	_alarm_ring
;	.line	88; test.c	alarm_ring = 0;
	CLRF	_alarm_ring, B
	BANKSEL	(_alarm_ring + 1)
	CLRF	(_alarm_ring + 1), B
	BRA	_00118_DS_
_00117_DS_:
;	.line	90; test.c	}else state = CONFIG_CLOCK;
	MOVLW	0x02
	BANKSEL	_state
	MOVWF	_state, B
	BANKSEL	(_state + 1)
	CLRF	(_state + 1), B
_00118_DS_:
;	.line	92; test.c	update_lcd();
	CALL	_update_lcd
	BRA	_00144_DS_
_00143_DS_:
	BANKSEL	_state
;	.line	95; test.c	}else if(state == CONFIG_CLOCK){			
	MOVF	_state, W, B
	XORLW	0x02
	BNZ	_00140_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00237_DS_
_00236_DS_:
	BRA	_00140_DS_
_00237_DS_:
;	.line	97; test.c	state = CONFIG_ALARM;
	MOVLW	0x03
	BANKSEL	_state
	MOVWF	_state, B
	BANKSEL	(_state + 1)
	CLRF	(_state + 1), B
;	.line	98; test.c	update_lcd();
	CALL	_update_lcd
	BRA	_00144_DS_
_00140_DS_:
	BANKSEL	_state
;	.line	101; test.c	}else if(state == CONFIG_ALARM){			
	MOVF	_state, W, B
	XORLW	0x03
	BNZ	_00137_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00239_DS_
_00238_DS_:
	BRA	_00137_DS_
_00239_DS_:
;	.line	103; test.c	state = SHOW_TIME;
	MOVLW	0x01
	BANKSEL	_state
	MOVWF	_state, B
	BANKSEL	(_state + 1)
	CLRF	(_state + 1), B
;	.line	104; test.c	update_lcd();
	CALL	_update_lcd
	BRA	_00144_DS_
_00137_DS_:
	BANKSEL	_state
;	.line	107; test.c	}else if(state == CONFIG_CLOCK_HOUR){			
	MOVF	_state, W, B
	XORLW	0x04
	BNZ	_00134_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00241_DS_
_00240_DS_:
	BRA	_00134_DS_
_00241_DS_:
;	.line	109; test.c	state = CONFIG_CLOCK_MINUTE;
	MOVLW	0x05
	BANKSEL	_state
	MOVWF	_state, B
	BANKSEL	(_state + 1)
	CLRF	(_state + 1), B
;	.line	110; test.c	update_lcd();
	CALL	_update_lcd
	BRA	_00144_DS_
_00134_DS_:
	BANKSEL	_state
;	.line	113; test.c	}else if(state == CONFIG_CLOCK_MINUTE){		
	MOVF	_state, W, B
	XORLW	0x05
	BNZ	_00131_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00243_DS_
_00242_DS_:
	BRA	_00131_DS_
_00243_DS_:
	BANKSEL	_ring_today
;	.line	115; test.c	ring_today = 0;
	CLRF	_ring_today, B
	BANKSEL	(_ring_today + 1)
	CLRF	(_ring_today + 1), B
	BANKSEL	_second
;	.line	116; test.c	second = 0;
	CLRF	_second, B
	BANKSEL	(_second + 1)
	CLRF	(_second + 1), B
;	.line	117; test.c	state = SHOW_TIME;
	MOVLW	0x01
	BANKSEL	_state
	MOVWF	_state, B
	BANKSEL	(_state + 1)
	CLRF	(_state + 1), B
;	.line	118; test.c	update_lcd();
	CALL	_update_lcd
	BRA	_00144_DS_
_00131_DS_:
	BANKSEL	_state
;	.line	121; test.c	}else if(state == CONFIG_ALARM_ON_OFF){			
	MOVF	_state, W, B
	XORLW	0x06
	BNZ	_00128_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00245_DS_
_00244_DS_:
	BRA	_00128_DS_
_00245_DS_:
	BANKSEL	_alarm_set
;	.line	123; test.c	if(alarm_set) state = CONFIG_ALARM_HOUR;
	MOVF	_alarm_set, W, B
	BANKSEL	(_alarm_set + 1)
	IORWF	(_alarm_set + 1), W, B
	BZ	_00120_DS_
	MOVLW	0x07
	BANKSEL	_state
	MOVWF	_state, B
	BANKSEL	(_state + 1)
	CLRF	(_state + 1), B
	BRA	_00121_DS_
_00120_DS_:
;	.line	124; test.c	else state = SHOW_TIME;
	MOVLW	0x01
	BANKSEL	_state
	MOVWF	_state, B
	BANKSEL	(_state + 1)
	CLRF	(_state + 1), B
_00121_DS_:
;	.line	126; test.c	update_lcd();
	CALL	_update_lcd
	BRA	_00144_DS_
_00128_DS_:
	BANKSEL	_state
;	.line	129; test.c	}else if(state == CONFIG_ALARM_HOUR){			
	MOVF	_state, W, B
	XORLW	0x07
	BNZ	_00125_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00247_DS_
_00246_DS_:
	BRA	_00125_DS_
_00247_DS_:
;	.line	131; test.c	state = CONFIG_ALARM_MINUTE;
	MOVLW	0x08
	BANKSEL	_state
	MOVWF	_state, B
	BANKSEL	(_state + 1)
	CLRF	(_state + 1), B
;	.line	132; test.c	update_lcd();
	CALL	_update_lcd
	BRA	_00144_DS_
_00125_DS_:
	BANKSEL	_state
;	.line	135; test.c	}else if(state == CONFIG_ALARM_MINUTE){		
	MOVF	_state, W, B
	XORLW	0x08
	BNZ	_00144_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00249_DS_
_00248_DS_:
	BRA	_00144_DS_
_00249_DS_:
	BANKSEL	_ring_today
;	.line	137; test.c	ring_today = 0;
	CLRF	_ring_today, B
	BANKSEL	(_ring_today + 1)
	CLRF	(_ring_today + 1), B
;	.line	138; test.c	state = SHOW_TIME;
	MOVLW	0x01
	BANKSEL	_state
	MOVWF	_state, B
	BANKSEL	(_state + 1)
	CLRF	(_state + 1), B
;	.line	139; test.c	update_lcd();
	CALL	_update_lcd
_00144_DS_:
;	.line	144; test.c	INTCON3bits.INT1F = 0;		
	BCF	_INTCON3bits, 0
	BRA	_00190_DS_
_00185_DS_:
;	.line	147; test.c	}else if(INTCON3bits.INT3F == 1){	
	CLRF	r0x00
	BTFSC	_INTCON3bits, 2
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BZ	_00251_DS_
	BRA	_00190_DS_
_00251_DS_:
	BANKSEL	_state
;	.line	150; test.c	if(state==SHOW_TIME){
	MOVF	_state, W, B
	XORLW	0x01
	BNZ	_00180_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00253_DS_
_00252_DS_:
	BRA	_00180_DS_
_00253_DS_:
	BANKSEL	_alarm_ring
;	.line	152; test.c	alarm_ring = 0;
	CLRF	_alarm_ring, B
	BANKSEL	(_alarm_ring + 1)
	CLRF	(_alarm_ring + 1), B
	BANKSEL	_alarm_set
;	.line	153; test.c	if(alarm_set) alarm_set = 0;
	MOVF	_alarm_set, W, B
	BANKSEL	(_alarm_set + 1)
	IORWF	(_alarm_set + 1), W, B
	BZ	_00146_DS_
	BANKSEL	_alarm_set
	CLRF	_alarm_set, B
	BANKSEL	(_alarm_set + 1)
	CLRF	(_alarm_set + 1), B
	BRA	_00147_DS_
_00146_DS_:
;	.line	154; test.c	else alarm_set = 1;
	MOVLW	0x01
	BANKSEL	_alarm_set
	MOVWF	_alarm_set, B
	BANKSEL	(_alarm_set + 1)
	CLRF	(_alarm_set + 1), B
_00147_DS_:
;	.line	155; test.c	update_lcd();
	CALL	_update_lcd
	BRA	_00181_DS_
_00180_DS_:
	BANKSEL	_state
;	.line	158; test.c	}else if(state == CONFIG_CLOCK){			
	MOVF	_state, W, B
	XORLW	0x02
	BNZ	_00177_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00255_DS_
_00254_DS_:
	BRA	_00177_DS_
_00255_DS_:
;	.line	160; test.c	state = CONFIG_CLOCK_HOUR;
	MOVLW	0x04
	BANKSEL	_state
	MOVWF	_state, B
	BANKSEL	(_state + 1)
	CLRF	(_state + 1), B
;	.line	161; test.c	update_lcd();
	CALL	_update_lcd
	BRA	_00181_DS_
_00177_DS_:
	BANKSEL	_state
;	.line	164; test.c	}else if(state == CONFIG_ALARM){			
	MOVF	_state, W, B
	XORLW	0x03
	BNZ	_00174_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00257_DS_
_00256_DS_:
	BRA	_00174_DS_
_00257_DS_:
;	.line	166; test.c	state = CONFIG_ALARM_ON_OFF;
	MOVLW	0x06
	BANKSEL	_state
	MOVWF	_state, B
	BANKSEL	(_state + 1)
	CLRF	(_state + 1), B
;	.line	167; test.c	update_lcd();
	CALL	_update_lcd
	BRA	_00181_DS_
_00174_DS_:
	BANKSEL	_state
;	.line	170; test.c	}else if(state == CONFIG_CLOCK_HOUR){			
	MOVF	_state, W, B
	XORLW	0x04
	BNZ	_00171_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00259_DS_
_00258_DS_:
	BRA	_00171_DS_
_00259_DS_:
	BANKSEL	_hour
;	.line	172; test.c	hour++;
	INCF	_hour, F, B
	BNC	_40466_DS_
	BANKSEL	(_hour + 1)
	INCF	(_hour + 1), F, B
_40466_DS_:
	BANKSEL	(_hour + 1)
;	.line	173; test.c	if(hour>=24) hour = 0;
	MOVF	(_hour + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00260_DS_
	MOVLW	0x18
	BANKSEL	_hour
	SUBWF	_hour, W, B
_00260_DS_:
	BNC	_00149_DS_
	BANKSEL	_hour
	CLRF	_hour, B
	BANKSEL	(_hour + 1)
	CLRF	(_hour + 1), B
_00149_DS_:
;	.line	175; test.c	update_lcd();
	CALL	_update_lcd
	BRA	_00181_DS_
_00171_DS_:
	BANKSEL	_state
;	.line	178; test.c	}else if(state == CONFIG_CLOCK_MINUTE){		
	MOVF	_state, W, B
	XORLW	0x05
	BNZ	_00168_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00262_DS_
_00261_DS_:
	BRA	_00168_DS_
_00262_DS_:
	BANKSEL	_minute
;	.line	180; test.c	minute++;
	INCF	_minute, F, B
	BNC	_50467_DS_
	BANKSEL	(_minute + 1)
	INCF	(_minute + 1), F, B
_50467_DS_:
	BANKSEL	(_minute + 1)
;	.line	181; test.c	if(minute>=60) minute = 0;
	MOVF	(_minute + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00263_DS_
	MOVLW	0x3c
	BANKSEL	_minute
	SUBWF	_minute, W, B
_00263_DS_:
	BNC	_00151_DS_
	BANKSEL	_minute
	CLRF	_minute, B
	BANKSEL	(_minute + 1)
	CLRF	(_minute + 1), B
_00151_DS_:
;	.line	183; test.c	update_lcd();
	CALL	_update_lcd
	BRA	_00181_DS_
_00168_DS_:
	BANKSEL	_state
;	.line	186; test.c	}else if(state == CONFIG_ALARM_ON_OFF){			
	MOVF	_state, W, B
	XORLW	0x06
	BNZ	_00165_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00265_DS_
_00264_DS_:
	BRA	_00165_DS_
_00265_DS_:
	BANKSEL	_alarm_set
;	.line	188; test.c	if(alarm_set) alarm_set = 0;
	MOVF	_alarm_set, W, B
	BANKSEL	(_alarm_set + 1)
	IORWF	(_alarm_set + 1), W, B
	BZ	_00153_DS_
	BANKSEL	_alarm_set
	CLRF	_alarm_set, B
	BANKSEL	(_alarm_set + 1)
	CLRF	(_alarm_set + 1), B
	BRA	_00154_DS_
_00153_DS_:
;	.line	189; test.c	else alarm_set = 1;
	MOVLW	0x01
	BANKSEL	_alarm_set
	MOVWF	_alarm_set, B
	BANKSEL	(_alarm_set + 1)
	CLRF	(_alarm_set + 1), B
_00154_DS_:
;	.line	190; test.c	update_lcd();
	CALL	_update_lcd
	BRA	_00181_DS_
_00165_DS_:
	BANKSEL	_state
;	.line	193; test.c	}else if(state == CONFIG_ALARM_HOUR){			
	MOVF	_state, W, B
	XORLW	0x07
	BNZ	_00162_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00267_DS_
_00266_DS_:
	BRA	_00162_DS_
_00267_DS_:
	BANKSEL	_alarm_hour
;	.line	195; test.c	alarm_hour++;
	INCF	_alarm_hour, F, B
	BNC	_60468_DS_
	BANKSEL	(_alarm_hour + 1)
	INCF	(_alarm_hour + 1), F, B
_60468_DS_:
	BANKSEL	(_alarm_hour + 1)
;	.line	196; test.c	if(alarm_hour>=24) alarm_hour = 0;
	MOVF	(_alarm_hour + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00268_DS_
	MOVLW	0x18
	BANKSEL	_alarm_hour
	SUBWF	_alarm_hour, W, B
_00268_DS_:
	BNC	_00156_DS_
	BANKSEL	_alarm_hour
	CLRF	_alarm_hour, B
	BANKSEL	(_alarm_hour + 1)
	CLRF	(_alarm_hour + 1), B
_00156_DS_:
;	.line	198; test.c	update_lcd();
	CALL	_update_lcd
	BRA	_00181_DS_
_00162_DS_:
	BANKSEL	_state
;	.line	201; test.c	}else if(state == CONFIG_ALARM_MINUTE){		
	MOVF	_state, W, B
	XORLW	0x08
	BNZ	_00181_DS_
	BANKSEL	(_state + 1)
	MOVF	(_state + 1), W, B
	BZ	_00270_DS_
_00269_DS_:
	BRA	_00181_DS_
_00270_DS_:
	BANKSEL	_alarm_minute
;	.line	203; test.c	alarm_minute++;
	INCF	_alarm_minute, F, B
	BNC	_70469_DS_
	BANKSEL	(_alarm_minute + 1)
	INCF	(_alarm_minute + 1), F, B
_70469_DS_:
	BANKSEL	(_alarm_minute + 1)
;	.line	204; test.c	if(alarm_minute>=60) alarm_minute = 0;
	MOVF	(_alarm_minute + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00271_DS_
	MOVLW	0x3c
	BANKSEL	_alarm_minute
	SUBWF	_alarm_minute, W, B
_00271_DS_:
	BNC	_00158_DS_
	BANKSEL	_alarm_minute
	CLRF	_alarm_minute, B
	BANKSEL	(_alarm_minute + 1)
	CLRF	(_alarm_minute + 1), B
_00158_DS_:
;	.line	206; test.c	update_lcd();
	CALL	_update_lcd
_00181_DS_:
;	.line	211; test.c	INTCON3bits.INT3F  = 0;		
	BCF	_INTCON3bits, 2
_00190_DS_:
	MOVFF	PREINC1, r0x01
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
__str_0:
	DB	0x20, 0x53, 0x54, 0x41, 0x52, 0x54, 0x49, 0x4e, 0x47, 0x2e, 0x2e, 0x2e
	DB	0x20, 0x20, 0x20, 0x20, 0x00
; ; Starting pCode block
__str_1:
	DB	0x20, 0x21, 0x21, 0x20, 0x25, 0x73, 0x3a, 0x25, 0x73, 0x3a, 0x25, 0x73
	DB	0x20, 0x21, 0x21, 0x20, 0x20, 0x57, 0x41, 0x4b, 0x45, 0x20, 0x55, 0x50
	DB	0x21, 0x20, 0x44, 0x55, 0x44, 0x45, 0x21, 0x20, 0x00
; ; Starting pCode block
__str_2:
	DB	0x20, 0x20, 0x20, 0x20, 0x25, 0x73, 0x3a, 0x25, 0x73, 0x3a, 0x25, 0x73
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x57, 0x41, 0x4b, 0x45, 0x20, 0x55, 0x50
	DB	0x21, 0x20, 0x44, 0x55, 0x44, 0x45, 0x21, 0x20, 0x00
; ; Starting pCode block
__str_3:
	DB	0x20, 0x20, 0x20, 0x20, 0x25, 0x73, 0x3a, 0x25, 0x73, 0x3a, 0x25, 0x73
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x41, 0x4c, 0x41, 0x52, 0x4d, 0x20, 0x20
	DB	0x5b, 0x25, 0x73, 0x3a, 0x25, 0x73, 0x5d, 0x00
; ; Starting pCode block
__str_4:
	DB	0x20, 0x20, 0x20, 0x20, 0x25, 0x73, 0x3a, 0x25, 0x73, 0x3a, 0x25, 0x73
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x41, 0x4c, 0x41, 0x52, 0x4d
	DB	0x3a, 0x20, 0x4f, 0x46, 0x46, 0x00
; ; Starting pCode block
__str_5:
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x4d, 0x45, 0x4e, 0x55, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x43, 0x48, 0x41, 0x4e, 0x47, 0x45
	DB	0x20, 0x43, 0x4c, 0x4f, 0x43, 0x4b, 0x3f, 0x00
; ; Starting pCode block
__str_6:
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x4d, 0x45, 0x4e, 0x55, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x43, 0x48, 0x41, 0x4e, 0x47, 0x45
	DB	0x20, 0x41, 0x4c, 0x41, 0x52, 0x4d, 0x3f, 0x00
; ; Starting pCode block
__str_7:
	DB	0x53, 0x45, 0x54, 0x20, 0x43, 0x4c, 0x4f, 0x43, 0x4b, 0x3a, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x5b, 0x25, 0x73, 0x5d
	DB	0x3a, 0x20, 0x25, 0x73, 0x00
; ; Starting pCode block
__str_8:
	DB	0x53, 0x45, 0x54, 0x20, 0x43, 0x4c, 0x4f, 0x43, 0x4b, 0x3a, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x25, 0x73, 0x20
	DB	0x3a, 0x20, 0x25, 0x73, 0x00
; ; Starting pCode block
__str_9:
	DB	0x53, 0x45, 0x54, 0x20, 0x43, 0x4c, 0x4f, 0x43, 0x4b, 0x3a, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x25, 0x73, 0x20
	DB	0x3a, 0x5b, 0x25, 0x73, 0x5d, 0x00
; ; Starting pCode block
__str_10:
	DB	0x53, 0x45, 0x54, 0x20, 0x41, 0x4c, 0x41, 0x52, 0x4d, 0x3a, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x5b, 0x4f
	DB	0x4e, 0x20, 0x5d, 0x00
; ; Starting pCode block
__str_11:
	DB	0x53, 0x45, 0x54, 0x20, 0x41, 0x4c, 0x41, 0x52, 0x4d, 0x3a, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x5b, 0x4f
	DB	0x46, 0x46, 0x5d, 0x00
; ; Starting pCode block
__str_12:
	DB	0x53, 0x45, 0x54, 0x20, 0x41, 0x4c, 0x41, 0x52, 0x4d, 0x3a, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x5b, 0x25, 0x73, 0x5d
	DB	0x3a, 0x20, 0x25, 0x73, 0x00
; ; Starting pCode block
__str_13:
	DB	0x53, 0x45, 0x54, 0x20, 0x41, 0x4c, 0x41, 0x52, 0x4d, 0x3a, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x25, 0x73, 0x20
	DB	0x3a, 0x20, 0x25, 0x73, 0x00
; ; Starting pCode block
__str_14:
	DB	0x53, 0x45, 0x54, 0x20, 0x41, 0x4c, 0x41, 0x52, 0x4d, 0x3a, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x25, 0x73, 0x20
	DB	0x3a, 0x5b, 0x25, 0x73, 0x5d, 0x00
; ; Starting pCode block
__str_15:
	DB	0x30, 0x25, 0x64, 0x00
; ; Starting pCode block
__str_16:
	DB	0x25, 0x64, 0x00


; Statistics:
; code size:	 5194 (0x144a) bytes ( 3.96%)
;           	 2597 (0x0a25) words
; udata size:	   53 (0x0035) bytes ( 1.38%)
; access size:	   22 (0x0016) bytes


	end
