
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

; -------------------------------------------------------------------------

.data

msg     db "J'aime la viande :)", 0
ttr     db "N'ayez plus honte de dire ...", 0
msg2    db "J'ai plus d'idée", 0
ttr2    db "lalalilala", 0

; -------------------------------------------------------------------------

.code

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

start:

    invoke GetModuleHandle, NULL                                            ; Routine principale
    mov hInstance, eax

    mov eax, MessageBox             ; eax -> table des sauts
    mov eax, [eax+2]                ; eax -> IAT
    mov eax, [eax]                  ; recup l'addr de la fn (RVA HintName remplacée pas Windows)

    push MB_ICONEXCLAMATION
    push offset ttr
    push offset msg
    push 0
    call eax                        ; Allah Ouak Bar :)

    ; ----------------------------------------------------------
    ; On peut se la faire avec une macro pour pas se faire chier
    ; ----------------------------------------------------------

    ainvoke MessageBox, 0, offset msg2, offset ttr2, MB_ICONINFORMATION

    invoke ExitProcess, NULL
    ret

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

end start

; -------------------------------------------------------------------------
; from the Dr. rED mEAT's MASM32 template v 4.5
; -------------------------------------------------------------------------
