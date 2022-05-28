
.486                                                            ; Jeu d'insruction du 486
.model flat, stdcall
option casemap : none

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

include \masm32\include\windows.inc                             ; Les principales includes

include \masm32\include\kernel32.inc
 includelib \masm32\lib\kernel32.lib

include \masm32\include\user32.inc
 includelib \masm32\lib\user32.lib

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.data

Httr        db "Hexadecimal", 0
Ottr        db "Octal", 0
Tttr        db "Decimal", 0
Yttr        db "Binary", 0

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.data?

hInstance   HINSTANCE ?                         ; Instance
Buffer      dd ?

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.code

start:
    
    invoke GetModuleHandle, NULL                ; Routine principale
    mov hInstance, eax

;====================================================================

                                                .RADIX (16)             ; Use hexadecimal as default

    mov byte ptr Buffer, 30
    invoke MessageBox, NULL, ADDR Buffer, ADDR Httr, MB_OK

;-------------------------------------------------------------------

                                                .RADIX (8)              ; Use octal as default

    mov byte ptr Buffer, 60
    invoke MessageBox, NULL, ADDR Buffer, ADDR Ottr, MB_OK

;-------------------------------------------------------------------

                                                .RADIX (10)             ; Use decimal as default

    mov byte ptr Buffer, 48
    invoke MessageBox, NULL, ADDR Buffer, ADDR Tttr, MB_OK

;-------------------------------------------------------------------

                                                .RADIX (2)              ; Use binary as default

    mov byte ptr Buffer, 110000
    invoke MessageBox, NULL, ADDR Buffer, ADDR Yttr, MB_OK

;====================================================================

    invoke ExitProcess, NULL

end start