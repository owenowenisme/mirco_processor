List p=18f4520
#include<pic18f4520.inc>
    CONFIG OSC = INTIO67
    CONFIG WDT = OFF
    org 0x00 

    #define mult_result1 0x20
    #define mult_result2 0x21
    #define mult_result3 0x22
    #define mult_result4 0x23
    #define mult_AL 0x01
    #define mult_AH 0x00
    #define mult_BL 0x11
    #define mult_BH 0x10
setup:
    clrf mult_result1
    clrf mult_result2
    clrf mult_result3
    clrf mult_result4
    movlw 0x77
    movwf mult_AH    
    movlw 0x77	
    movwf mult_AL
    movlw 0x56
    movwf mult_BH
    movlw 0x78
    movwf mult_BL
    
multiplier:                    
    movf    mult_AL, W        
    mulwf   mult_BL     
    movff   PRODL, mult_result4   
    movff   PRODH, mult_result3   
    
    movf    mult_AL, W
    mulwf   mult_BH
    movf    PRODL, W
    addwf mult_result3
    movf    PRODH, W
    addwfc mult_result2
   
    movf    mult_BL, W
    mulwf   mult_AH
    movf    PRODL, W
    addwf mult_result3
    movf    PRODH, W
    addwfc mult_result2

    movf    mult_AH, W
    mulwf   mult_BH
    
    movf    PRODH, W
    addwfc mult_result1
    movf    PRODL, W
    addwf mult_result2
    
    movlw 0x00
    addwfc  mult_result1
    

    
end
    