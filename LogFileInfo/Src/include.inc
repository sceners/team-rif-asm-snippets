
.486                                                            ; Jeu d'insruction du 486
.model flat, stdcall
option casemap : none

; д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д

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

; д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д

WndProc PROTO :DWORD,:DWORD,:DWORD,:DWORD                                  ; Prototypes
Attributes PROTO :DWORD, :DWORD, :DWORD
ClearBuffer PROTO :DWORD
Algo PROTO :DWORD

; д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д

.data

About       db "by $KORBUT / [ RiF 2k4 ]", 0

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

.data?

hInstance   HINSTANCE ?                                                    ; Instance
hWndCheck   HANDLE ?
hIcon       HANDLE ?

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

.const

bCheck      = 1000                                                         ; Identificateurs
bQuit       = 1001
eNom        = 2000
eSerial     = 2001
eStatic     = 2002

; д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д

; -------------------------------------------------------------------------
; EOF
; -------------------------------------------------------------------------
