List p=18f4520
#include<pic18f4520.inc>
    CONFIG OSC = INTIO67
    CONFIG WDT = OFF
    org 0x00 ;PC = 0x00
    
setup:
    LFSR 0, 0x100
    
    movlw 0xFF
    movwf POSTINC0 
    movlw 0xFE
    movwf POSTINC0 
    movlw 0xFD
    movwf POSTINC0 
    movlw 0xFC
    movwf POSTINC0 
    movlw 0xFB
    movwf POSTINC0 
    movlw 0xFA
    movwf POSTINC0 
    movlw 0xF9
    movwf POSTINC0 
    
    movlw 0x07
    movwf 0x300
    
main:
    LFSR 0, 0x100
    LFSR 1, 0x101
    movlw 0x00
    addwf 0x300,w
    movwf 0x301
    DECFSZ 0x300
    goto outer_loop
    goto finish
    
outer_loop:
    DECFSZ 0x301
    goto inner_loop
    goto main

inner_loop:
    movlw 0x00
    addwf INDF0,w
    CPFSLT INDF1
    goto no_swap
    goto swap
    

swap:
    xorwf INDF1,w
    xorwf INDF1
    xorwf POSTINC1,w
    movwf POSTINC0
   
    goto outer_loop

no_swap:
    INCF FSR0L
    INCF FSR1L

    goto outer_loop
    
finish:
    end


