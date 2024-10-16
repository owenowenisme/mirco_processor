List p=18f4520
#include<pic18f4520.inc>
    CONFIG OSC = INTIO67
    CONFIG WDT = OFF
    org 0x00 

    #define temp1H 0x10
    #define temp1L 0x11
    #define temp2H 0x12
    #define temp2L 0x13
    #define ansH 0x00
    #define ansL 0x01
    #define n 0x30
    
    
    swapyy macro aa, bb
	movff aa, WREG
	movff bb, aa
	movwf bb
	endm
    
    init:
    	movlw 10 ; n = ?
	movwf n 
    
	CLRF temp1H
	CLRF temp1L
	CLRF temp2H
	CLRF temp2L
	movlw 0x01
	movwf temp2L
    
    main:
	rcall fib
	decfsz n
	    goto main
	movff temp1L, ansL
	movff temp1H, ansH
	goto finish
	
    fib:
	swapyy temp1L, temp2L
	swapyy temp1H, temp2H
	movff temp2L,WREG
	addwf temp1L
	movff temp2H,WREG
	addwfc temp1H
	return
	
    finish:
	end  
