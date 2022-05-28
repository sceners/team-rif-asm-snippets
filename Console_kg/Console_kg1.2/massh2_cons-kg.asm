
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

Prompt  db "+=========================================+", 10, 13
        db "| Dr. rED mEAT proudly presents           |", 10, 13
        db "+=========================================+", 10, 13
        db "|               Massh^CookieCrK Crackme 2 |", 10, 13
        db "+=========================================+", 10, 13
        db "| W I N 3 2   K E Y G E N                 |", 10, 13
        db "+===============================[RIF 2k2]=+", 10, 13, 10, 13, 0

Entern  db "Please enter your name : ", 0
Serial  db "Your serial is         : ", 0
             
Finish  db 10, 13, 10, 13, "Hit Ctrl+C to quit !!!", 0

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.data?

hInstance   HINSTANCE ?                         ; Instance

Bufser      db 50 dup (?)
Buffer      db 50 dup (?)

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.code

start:

invoke MainProc
invoke ExitProcess, NULL

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

MainProc Proc

;====================================================================

invoke StdOut, ADDR Prompt
invoke StdOut, ADDR Entern
invoke StdIn, ADDR Buffer, 50

lea edi, Buffer

@@:

mov al, byte ptr [edi]
cmp al, 0Dh
je @F
inc edi
jmp @B

@@:

mov byte ptr [edi], 0

lea esi, Buffer
lea edi, Bufser

@@:

movzx ebx, byte ptr [esi]
or ebx, ebx
je @F
and ebx, 0Fh
shr bl, 1
mov dl, bl
add dl, 30h
mov byte ptr [edi], dl
inc esi
inc edi
jmp @B

@@:

invoke StdOut, ADDR Serial
invoke StdOut, ADDR Bufser

;====================================================================

invoke StdOut, ADDR Finish

@@:

jmp @B

MainProc Endp

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

end start