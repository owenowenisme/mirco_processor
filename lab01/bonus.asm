List p=18f4520
#include<pic18f4520.inc>
    CONFIG OSC = INTIO67
    CONFIG WDT = OFF
    org 0x00 
    
    CLRF 0x000
    CLRF 0x001
    
    MOVLW 0b10000001
    MOVWF 0x000
    MOVLW 0x05
    MOVWF 0x001
    

    GOTO mul_of_two
    Loop:
        RRNCF 0x000
	MOVLW 0b10000001
	CPFSEQ 0x000
	GOTO mul_of_two
	GOTO finish
	
    mul_of_two:
	BTFSS 0x000, 0
	GOTO mul_of_four
	GOTO nothing
    mul_of_four:
	BTFSS 0x000, 1
	GOTO add_2
	GOTO add_1
    
    add_2:
	INCF 0x001
	INCF 0x001
	GOTO Loop
    add_1:
	INCF 0x001
	GOTO Loop
    nothing:
	DECF 0x001
	GOTO Loop
	
    finish:
	end  
