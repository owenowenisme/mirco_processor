List p=18f4520
#include<pic18f4520.inc>
    CONFIG OSC = INTIO67
    CONFIG WDT = OFF
    org 0x00 ;PC = 0x00
    
setup:
    LFSR 0, 0x100
    LFSR 1, 0x116
    movlw 0x00 
    movwf INDF0
    movlw 0x01
    movwf INDF1
    
main:    
    movlw 0x00
    addwf POSTINC0,W
    addwf INDF1,W
    movwf INDF0
    
    movlw 0x00 
    addwf POSTDEC1,W
    addwf INDF0,W
    movwf INDF1
    
    movlw 0x00
    addwf POSTINC0,W
    addwf INDF1,W
    movwf INDF0
    
    movlw 0x00 
    addwf POSTDEC1,W
    addwf INDF0,W
    movwf INDF1
    
    movlw 0x00
    addwf POSTINC0,W
    addwf INDF1,W
    movwf INDF0
    
    movlw 0x00 
    addwf POSTDEC1,W
    addwf INDF0,W
    movwf INDF1
    
    movlw 0x00
    addwf POSTINC0,W
    addwf INDF1,W
    movwf INDF0
    
    movlw 0x00 
    addwf POSTDEC1,W
    addwf INDF0,W
    movwf INDF1
    
    movlw 0x00
    addwf POSTINC0,W
    addwf INDF1,W
    movwf INDF0
    
    movlw 0x00 
    addwf POSTDEC1,W
    addwf INDF0,W
    movwf INDF1
    
    movlw 0x00
    addwf POSTINC0,W
    addwf INDF1,W
    movwf INDF0
    
    movlw 0x00 
    addwf POSTDEC1,W
    addwf INDF0,W
    movwf INDF1

    
finish:
    end