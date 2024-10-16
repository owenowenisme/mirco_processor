List p=18f4520
#include<pic18f4520.inc>
    CONFIG OSC = INTIO67
    CONFIG WDT = OFF
    org 0x00 

    #define a1 0x00
    #define a2 0x01
    #define a3 0x02
    #define b1 0x10
    #define b2 0x11
    #define b3 0x12
    #define c1 0x20
    #define c2 0x21
    #define c3 0x22
    #define tmp1 0x30
    #define tmp2 0x31
    #define tmp1 0x32
    
    
    main: 
    movlw 0x03
    movwf a1
    movlw 0x04
    movwf a2
    movlw 0x05
    movwf a3
    movlw 0x06
    movwf b1
    movlw 0x07
    movwf b2
    movlw 0x08
    movwf b3
    
    rcall cross
    goto finish
    
    cross:
    movff a2, WREG
    mulwf b3
    movff PRODL,tmp1
    movff a3, WREG
    mulwf b2
    movff PRODL,tmp2
    
    movff tmp2, WREG
    subwf tmp1, W
    
    movwf c1
    
    movff a3, WREG
    mulwf b1
    movff PRODL,tmp1
    movff a1, WREG
    mulwf b3
    movff PRODL,tmp2
    
    movff tmp2, WREG
    subwf tmp1, W
    
    movwf c2
    
    movff a1, WREG
    mulwf b2
    movff PRODL,tmp1
    movff a2, WREG
    mulwf b1
    movff PRODL,tmp2
    
    movff tmp2, WREG
    subwf tmp1, W
    
    movwf c3
    return
    
    finish:
    end            
