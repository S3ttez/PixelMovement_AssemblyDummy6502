.org $8000

LDX #$FF            ; Setup standard
TXS
start:          

 LDA #01            ; Drawing the red cell
 STA $0200, X


 LDA $4000          ; Controllers for the movement
 CMP #$01
 BEQ UP
 CMP #$08
 BEQ RIGHT
 CMP #$02
 BEQ DOWN
 CMP #$04
 BEQ LEFT

 JMP start


UP:                 ; Movement y+ 
 JSR CLEAN_PIXEL
 TXA
 SBC #$10
 TAX 
 JMP start

RIGHT:              ; Movement x+
 JSR CLEAN_PIXEL
 INX
 JMP start

DOWN:               ; Movement y-
 JSR CLEAN_PIXEL
 DEX
 TXA
 ADC #$10
 TAX
 JMP start

LEFT:               ; Movement x-
 JSR CLEAN_PIXEL
 DEX
 JMP start

CLEAN_PIXEL:        ; Cleaning the last position of the red cell
 LDA #0
 STA $0200, X
 RTS
 JMP start

.goto $FFFA
.dw start
.dw start
.dw start
