
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

iinvoke MACRO fn:REQ,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12, \
                     p13,p14,p15,p16,p17,p18,p19,p20,p21,p22
    LOCAL _fn
    .data
        _fn dd fn

    .code

    FOR arg,<p22,p21,p20,p19,p18,p17,p16,p15,p14,p13,\
             p12,p11,p10,p9,p8,p7,p6,p5,p4,p3,p2,p1>
      IFNB <arg>    ;; If not blank
        push arg    ;; push parameter
      ENDIF
    ENDM

    call _fn

ENDM

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

.data

Titre       db "Tip Of The Day :", 0
String      db "Il faut croire ce que tu crois,", 10, 13
            db "Si tu crois ce que tu crois,", 10, 13
            db "Personne au monde ne peut te bouger !", 0

_GetModuleHandle    dd GetModuleHandle

; -------------------------------------------------------------------------

.data?

hInstance   HINSTANCE ?

; -------------------------------------------------------------------------

.code

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

start:

    push 0
    call _GetModuleHandle                                       ; without MACRO
    mov hInstance, eax

    iinvoke MessageBox, 0, offset String, offset Titre, MB_OK   ; with MACRO

    iinvoke ExitProcess, 0
    ret

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

end start

; -------------------------------------------------------------------------
; from the Dr. rED mEAT's MASM32 template v 4.5
; -------------------------------------------------------------------------
