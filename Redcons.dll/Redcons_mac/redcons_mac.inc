
;====================================================================
; redcons.dll by the Dr. rED mEAT .:|[RIF 2k2]|:.
;
; How to make macro...
;====================================================================

ExitConsole MACRO
;-----------------------------------------------------
; Param  : NONE
; Output : NONE
; Desc   : Show a message and do a loop
;-----------------------------------------------------
    LOCAL ExitMsg

.data

ExitMsg db 10, 13, 10, 13, "Hit Ctrl+C to quit !!!", 0

.code

invoke StdOut, ADDR ExitMsg

@@:
jmp @B

ENDM

;====================================================================

ClearBuf MACRO BufName
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

ENDM

;====================================================================

RetLine MACRO
;-----------------------------------------------------
; Param  : NONE
; Output : NONE
; Desc   : Put an empty line
;-----------------------------------------------------
    LOCAL CRLF

.data

CRLF    db 10, 13, 0

.code

invoke StdOut, ADDR CRLF

ENDM

;====================================================================
