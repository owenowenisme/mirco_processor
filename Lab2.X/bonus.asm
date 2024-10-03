List p=18f4520
#include<pic18f4520.inc>
    CONFIG OSC = INTIO67
    CONFIG WDT = OFF
    org 0x00 ;PC = 0x00
    
setup:
    movlw 0x33
    movwf 0x09
    
    movlw 0x00
    movwf 0x11
    
    
    LFSR 0, 0x000
    
    movlw 0x00
    movwf POSTINC0 
    movlw 0x11
    movwf POSTINC0 
    movlw 0x22
    movwf POSTINC0 
    movlw 0x33
    movwf POSTINC0 
    movlw 0x44
    movwf POSTINC0 
    movlw 0x55
    movwf POSTINC0 
    movlw 0x66
    movwf POSTINC0 
    
    movlw 0x10
    
    LFSR 0, 0x000; l
    LFSR 1, 0x006; r
    LFSR 2, 0x003; mid

    
main:
    movf FSR0L,W
    CPFSLT FSR1L
    goto checker
    goto finish
    

checker:
    movff INDF2, 0x22
    movf INDF2,w
    CPFSEQ 0x09
    goto not_found
    goto found
    
    
not_found:
    movf INDF2,w
    CPFSGT 0x09
    goto left
    goto right

right:
    INCF FSR2L
    movff FSR2L,FSR0L
    movf  FSR0L,W
    addwf FSR1L,W
    
    goto divide
    
 left:
    DECF FSR2L
    movff FSR2L,FSR1L
    movf  FSR0L,W
    addwf FSR2L,W
    
    goto divide
    
divide:
    rrncf WREG
    ANDWF 0x16, w
    movwf 0x18
    
    movwf FSR2L
    goto main
  
found:
    movlw 0xFF 
    movwf 0x11
finish:
    
    end


