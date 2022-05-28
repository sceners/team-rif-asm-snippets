
.486                                                            ; Jeu d'insruction du 486
.model flat, stdcall
option casemap : none

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

include \masm32\include\windows.inc
include \masm32\include\masm32.inc
include \masm32\include\gdi32.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\Comctl32.inc
include \masm32\include\comdlg32.inc
include \masm32\include\shell32.inc
include \masm32\include\oleaut32.inc
include \masm32\include\ole32.inc
include \masm32\include\dialogs.inc

includelib \masm32\lib\masm32.lib
includelib \masm32\lib\gdi32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\Comctl32.lib
includelib \masm32\lib\comdlg32.lib
includelib \masm32\lib\shell32.lib
includelib \masm32\lib\oleaut32.lib
includelib \masm32\lib\ole32.lib

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

WndProc PROTO :DWORD,:DWORD,:DWORD,:DWORD                                  ; Prototypes
about PROTO :DWORD
AbtProc PROTO :DWORD,:DWORD,:DWORD,:DWORD
TimerProc PROTO :DWORD
TimerProc2 PROTO :DWORD
TopXY PROTO :DWORD,:DWORD
Algo PROTO :DWORD
XButton PROTO :DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD                     ; Rip from MASM32lib and gif support added
BmpButnProc PROTO :DWORD,:DWORD,:DWORD,:DWORD

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

.data?

hInstance   HINSTANCE ?                                                    ; Instance
hIcon       HANDLE ?
AdrOut      dd ?
count       dd ?
decount     db ?
count2      dd ?
direct      dd ?
Total       dd ?

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

.const

bDoIt       = 1000                                                         ; Identificateurs
bExit       = 1001
bAbout      = 1002

bMail       = 1003
bVisit      = 1004

eNom        = 2000
eSerial     = 2001
eStatic     = 2002
eStatic2    = 2003
eStatic3    = 2004

Bmp         = 1789
Time        = 1790
Time2       = 1791
Key         = 2

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

; -------------------------------------------------------------------------
; EOF
; -------------------------------------------------------------------------
