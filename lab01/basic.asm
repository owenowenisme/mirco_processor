List p=18f4520
    #include<pic18f4520.inc>
    CONFIG OSC = INTIO67
    CONFIG WDT = OFF
    org 0x00 
    
    MOVLW 0x01
    MOVWF 0x000
    MOVLW 0x02
    MOVWF 0x001
    ADDWF 0x000,W
    MOVWF 0x002
    
    MOVLW 0x04
    MOVWF 0x010
    MOVLW 0x03
    MOVWF 0x011
    SUBWF 0x010,W
    MOVWF 0x012
    
    equal:
	CPFSEQ 0x002
	GOTO bigger
	GOTO equal_ops

    bigger:
	CPFSGT 0x002
	GOTO smaller_ops
	GOTO bigger_ops

    equal_ops:
	MOVLW 0xBB
	MOVWF 0x020
	GOTO finish
	
    bigger_ops:
	MOVLW 0xAA
	MOVWF 0x020
	GOTO finish
	
    smaller_ops:
	MOVLW 0xCC
	MOVWF 0x020
	GOTO finish

    finish:
	end