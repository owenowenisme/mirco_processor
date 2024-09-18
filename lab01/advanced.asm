List p=18f4520
#include<pic18f4520.inc>
    CONFIG OSC = INTIO67
    CONFIG WDT = OFF
    org 0x00 
    
    CLRF 0x002
    CLRF 0x003
    
    MOVLW 0b10101010
    MOVWF 0x000
    MOVLW 0b01111101
    MOVWF 0x001
    
    MOVLW 0b01010101 & 0b11110000
    MOVWF 0x002
    MOVLW 0b01111101 & 0b00001111
    ADDWF 0x002
    
    MOVLW 0x08
    MOVWF 0x004 
    
    Loop:
        RRNCF 0x002
        BTFSS 0x002,0
	INCF 0x003
	DECFSZ 0x004
        GOTO Loop
    end            
