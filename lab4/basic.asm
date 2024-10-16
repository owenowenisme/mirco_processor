List p=18f4520
#include<pic18f4520.inc>
    CONFIG OSC = INTIO67
    CONFIG WDT = OFF
    org 0x00 
    
    submul macro xh, xl, yh, yl
	movff yl, WREG
	subwf xl, W
	movwf 0x01
	movff yh, WREG
	subwfb xh, W
	movwf 0x00
	movff 0x00, WREG
	mulwf 0x01
	movff PRODH, 0x02
	movff PRODL, 0x03
	
	endm
	
    movlw 0x02; 
    movwf 0x20;xh
    movlw 0x0C; 
    movwf 0x21;xl
    movlw 0x00; 
    movwf 0x22;yh
    movlw 0x0F; 
    movwf 0x23;yl
    
    submul 0x20, 0x21, 0x22, 0x23
    
    finish:
	end