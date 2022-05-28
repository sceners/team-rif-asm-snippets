
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

include \masm32\include\winmm.inc
 includelib \masm32\lib\winmm.lib 

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.data

SoundName   db "CHIMES.wav", 0

Good        db "Sound played successfully !", 0
Goodttr     db "Everything were ok !", 0

Bad         db "An error occured", 0

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.data?

hInstance   HINSTANCE ?                         ; Instance

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.code

start:
    
    invoke GetModuleHandle, NULL                ; Routine principale
    mov hInstance, eax

;====================================================================

    invoke PlaySound, ADDR SoundName, NULL, SND_FILENAME
    .IF eax

        invoke MessageBox, NULL, ADDR Good, ADDR Goodttr, MB_OK

    .ELSE

        invoke MessageBox, NULL, ADDR Bad, NULL, MB_ICONERROR

    .ENDIF

;====================================================================

    invoke ExitProcess, NULL

end start