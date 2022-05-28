
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

; д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д

.data?

hInstance   HINSTANCE ?                                                    ; Instance
hMenu       HANDLE ?
hList       HANDLE ?
ListIndex   dd ?
buffer      db 501 dup (?)

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

.data

ColName     db "Name", 0
ColDiz      db "Diz", 0

txt1        db "What", 0
txt2        db "The", 0
txt3        db "Fuck ?!", 0

diz1        db "2004", 0
diz2        db "rif", 0
diz3        db "meat", 0

mnu1        db "What's that ?", 0
mnu2        db "Kill !", 0

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

.const

lList       = 1000

mItem1      = 2000
mItem2      = 2001

; д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д

; -------------------------------------------------------------------------
; EOF
; -------------------------------------------------------------------------
