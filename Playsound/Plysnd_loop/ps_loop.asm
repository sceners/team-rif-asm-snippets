
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

SoundName   db "SystemStart", 0

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.data?

hInstance   HINSTANCE ?                         ; Instance
uDeviceID   UINT ?
Vol         dd ?

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.code

start:
    
    invoke GetModuleHandle, NULL                ; Routine principale
    mov hInstance, eax

;====================================================================

    invoke PlaySound, ADDR SoundName, NULL, SND_ASYNC or SND_LOOP
    invoke MessageBox, NULL, ADDR SoundName, ADDR SoundName, MB_OK
    invoke PlaySound, NULL, NULL, 0

;====================================================================

    invoke ExitProcess, NULL

end start