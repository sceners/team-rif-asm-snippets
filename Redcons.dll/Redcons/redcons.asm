
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

.data

ExitMsg db 10, 13, 10, 13, "Hit Ctrl+C to quit !!!", 0
CRLF    db 10, 13, 0

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.data?



;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.code

LibMain proc hInstDLL:DWORD, reason:DWORD, unused:DWORD

        ret

LibMain Endp

;====================================================================

ExitConsole proc
;-----------------------------------------------------
; Param  : NONE
; Output : NONE
; Desc   : Show a message and do a loop
;-----------------------------------------------------

invoke StdOut, ADDR ExitMsg

@@:
jmp @B

    ret

ExitConsole endp

;====================================================================

ClearBuf proc BufName:DWORD
;-----------------------------------------------------
; Param  : Offset of the buffer to clear
; Output : NONE
; Desc   : Transform a StdIn string (0Dh) to a null
;          terminating char string (00h)
;-----------------------------------------------------

mov edi, BufName

@@:

mov al, byte ptr [edi]
cmp al, 0Dh
je @F
inc edi
jmp @B

@@:

mov byte ptr [edi], 0

    ret

ClearBuf endp

;====================================================================

RetLine proc
;-----------------------------------------------------
; Param  : NONE
; Output : NONE
; Desc   : Put an empty line
;-----------------------------------------------------

invoke StdOut, ADDR CRLF

    ret

RetLine endp

;====================================================================

end LibMain