
; -------------------------------------------------------------------------
;
; the Dr. rED mEAT proudly presents :
;     Oh ! It's just a sample :)
;
; ::( cODED IN MASM32 v8 STYLe )::
;   ::( RESiSTANCE IS FUTiLE )::
;
; -------------------------------------------------------------------------
;
; mailto: redmeat_rif@yahoo.fr
; url:    http://www.rif.fr.fm
;
; -------------------------------------------------------------------------

include include.inc

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

SwapFunc MACRO fn1:REQ, fn2:REQ

    mov eax, fn1
    mov eax, [eax+2]
    push eax
    mov eax, [eax]

    mov ebx, fn2
    mov ebx, [ebx+2]
    push ebx
    mov ebx, [ebx]

    pop ecx
    pop edx
    mov [ecx], eax
    mov [edx], ebx

ENDM

ainvoke MACRO fn:REQ,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12, \
                     p13,p14,p15,p16,p17,p18,p19,p20,p21,p22

    mov eax, fn
    mov eax, [eax+2]
    mov eax, [eax]

    FOR arg,<p22,p21,p20,p19,p18,p17,p16,p15,p14,p13,\
             p12,p11,p10,p9,p8,p7,p6,p5,p4,p3,p2,p1>
      IFNB <arg>    ;; If not blank
        push arg    ;; push parameter
      ENDIF
    ENDM

    call eax

ENDM

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

.data?

hInstance   HINSTANCE ?
buffer      db 10 dup (?)

; -------------------------------------------------------------------------

.data

ttr         db "Pinaise !!!", 0
filter      db "Ca va bien ? : %08lXh", 0

; -------------------------------------------------------------------------

.code

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

start:

    SwapFunc ExitProcess, Beep
    SwapFunc GetModuleHandle, MessageBox

    ainvoke MessageBox, NULL
    invoke wsprintf, ADDR buffer, ADDR filter, eax

    ainvoke ExitProcess, 0, 0
    ainvoke GetModuleHandle, 0, offset buffer, offset ttr, MB_ICONEXCLAMATION

    ainvoke Beep, 0             ; God Is Tall :)
    ret

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

end start

; -------------------------------------------------------------------------
; from the Dr. rED mEAT's MASM32 template v 4.5
; -------------------------------------------------------------------------
