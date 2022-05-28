
.486                                                            ; Jeu d'insruction du 486
.model flat, stdcall
option casemap : none

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
; Du PROTO pour tous les protugais :)

WndProc   PROTO :DWORD,:DWORD,:DWORD,:DWORD
DrwShdTxt PROTO :DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD
DrawIamge PROTO :DWORD,;DWORD

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

include \masm32\include\windows.inc
include \masm32\include\masm32.inc
include \masm32\include\gdi32.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\advapi32.inc
include \masm32\include\Comctl32.inc
include \masm32\include\comdlg32.inc
include \masm32\include\shell32.inc
include \masm32\include\oleaut32.inc
include \masm32\include\ole32.inc
include \masm32\include\dialogs.inc
include \masm32\include\winmm.inc
include \masm32\include\msimg32.inc

includelib \masm32\lib\masm32.lib
includelib \masm32\lib\gdi32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\advapi32.lib
includelib \masm32\lib\Comctl32.lib
includelib \masm32\lib\comdlg32.lib
includelib \masm32\lib\shell32.lib
includelib \masm32\lib\oleaut32.lib
includelib \masm32\lib\ole32.lib
includelib \masm32\lib\winmm.lib
includelib \masm32\lib\msimg32.lib

include DrwShdTxt.asm
include DrawImage.asm

include \masm32\macros\macros.asm

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

.data?

hInstance   HINSTANCE ?

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

; -------------------------------------------------------------------------
; EOF
; -------------------------------------------------------------------------

