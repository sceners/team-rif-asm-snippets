
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

Decdat MACRO varname, text:VARARG
;-----------------------------------------------------
; Param  : The variable name and its text
; Output : NONE
; Desc   : Declare a string into the .data section
;-----------------------------------------------------

.data

varname db text, 0

.code

ENDM

;-------------------------------------------------------------------

Deccod MACRO varname, text:VARARG
;-----------------------------------------------------
; Param  : The variable name and its text
; Output : NONE
; Desc   : Declare a string into the current section
;-----------------------------------------------------

jmp @F

varname db text, 0

@@:

ENDM

;-------------------------------------------------------------------

Decbuf MACRO varname, type, count
;-----------------------------------------------------
; Param  : The variable name, its type and its count
; Output : NONE
; Desc   : Declare a buffer into the .data? section
;-----------------------------------------------------

.data?

varname type count dup (?)

.code

ENDM

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

Decdat MyMsg, "Salut gazier !"
Decdat MyTtr, "Dr. rED mEAT"

    invoke MessageBox, NULL, ADDR MyMsg, ADDR MyTtr, MB_ICONEXCLAMATION

Deccod MyMsg2, "Aillo waurlde"
Deccod MyTtr2, ".:|[ RIF 2k2 ]|:."

    invoke MessageBox, NULL, ADDR MyMsg2, ADDR MyTtr2, MB_ICONINFORMATION

Decbuf Buffer, db, 10
Decbuf Buffer2, dw, 10
Decbuf Buffer3, dd, 10

    mov eax, SIZEOF Buffer
    mov ebx, SIZEOF Buffer2
    mov ecx, SIZEOF Buffer3

Decdat Filter, "Buffer  : %u bytes", 10, 13,\
               "Buffer2 : %u bytes", 10, 13,\
               "Buffer3 : %u bytes", 0

Decbuf RealBuffer, db, SIZEOF Filter

    invoke wsprintf, ADDR RealBuffer, ADDR Filter, eax, ebx, ecx

    invoke MessageBox, NULL, ADDR RealBuffer, ADDR MyTtr2, MB_OK

;====================================================================

    invoke ExitProcess, NULL

end start