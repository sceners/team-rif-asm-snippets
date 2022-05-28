
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

include \masm32\include\masm32.inc
 includelib \masm32\lib\masm32.lib

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

MainProc    PROTO

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.data

AppName db "Win32 Console Example", 0
String  db "Hello rude boy, I'm in a MessageBox !", 0
String2 db "Hey ! I said 'Hello'", 10, 13, 0
Finish  db 10, 13, "Hit Ctrl+C to quit !!!", 0

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

invoke MainProc
invoke ExitProcess, NULL

;====================================================================

MainProc Proc

invoke MessageBox, NULL, ADDR String, ADDR AppName, NULL
invoke StdOut, ADDR String2

invoke StdOut, ADDR Finish

@@:jmp @B

MainProc Endp

;====================================================================

end start