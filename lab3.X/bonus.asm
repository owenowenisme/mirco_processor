List p=18f4520
#include<pic18f4520.inc>
    CONFIG OSC = INTIO67
    CONFIG WDT = OFF
    org 0x00 
    
    movlw 0xFF
    movwf 0x00
    
    movlw 0xF1
    movwf 0x01
    
    movlw 0x0F
    movwf 0x02

    movff 0x00, 0x03
    movff 0x01, 0x04
    
    MOVLW   8           
    MOVWF   0x10        

check_loop:
    BTFSC   0x03, 7     
    GOTO    check_pow_of_two_0     
    DECF    0x02      
    RLNCF   0x03    
    DECFSZ  0x10     
    GOTO    check_loop  
    
    MOVLW   8           
    MOVWF   0x10       

check_loop2:
    BTFSC   0x04, 7    
    GOTO    check_pow_of_two_0      
    DECF    0x02       
    RLNCF   0x04     
    DECFSZ  0x10   
    GOTO    check_loop2  

    CLRF 0x06 
    
    MOVLW   8         
    MOVWF   0x10        
    
check_pow_of_two_0:
    BTFSC   0x03, 7     
    INCF    0x06       
    RLNCF   0x03    
    DECFSZ  0x10    
    GOTO    check_pow_of_two_0  
    
    
    
    MOVLW   8          
    MOVWF   0x10       
    
check_pow_of_two_1:
    BTFSC   0x04, 7     
    INCF    0x06      
    RLNCF   0x04 
    DECFSZ  0x10     
    GOTO    check_pow_of_two_1  
    
finish:
    movlw 0x02
    CPFSLT 0x06
	INCF 0x02
	
CLRF 0x06
CLRF 0x03
CLRF 0x04
CLRF 0x10
CLRF 0x11
end