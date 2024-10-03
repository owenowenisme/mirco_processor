List p=18f4520
#include<pic18f4520.inc>
    CONFIG OSC = INTIO67
    CONFIG WDT = OFF
    org 0x00 
    
    MOVLW 0xC8
    MOVWF TRISA
    RLCF TRISA
    RRCF TRISA
    
    btfsc TRISA, 6 ; if bit 6 is 1 set the bit 7 to 1 for arithmetic right shift
	goto set_one
	goto set_zero
    set_one:
	bsf TRISA, 7
	goto finish
    set_zero: 
	bcf TRISA, 7
	goto finish
	
    finish:
	end