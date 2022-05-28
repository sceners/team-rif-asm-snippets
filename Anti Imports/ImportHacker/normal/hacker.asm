
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

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

.data?

hInstance   HINSTANCE ?
buffer      db 10 dup (?)

; -------------------------------------------------------------------------

.data

ttr         db "tadaaa !!!", 0
filter      db "Magie : %08lXh", 0

; -------------------------------------------------------------------------

.code

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

start:

    SwapFunc ExitProcess, Beep

    invoke GetModuleHandle, NULL                                            ; Routine principale
    mov hInstance, eax

    mov eax, MessageBox             ; eax -> table des sauts
    mov eax, [eax+2]                ; eax -> IAT
    push eax
    mov eax, [eax]                  ; recup l'addr de la fn (RVA HintName remplacée pas Windows)

    mov ebx, GetModuleHandle        ; ebx -> table des sauts
    mov ebx, [ebx+2]                ; ebx -> IAT
    push ebx
    mov ebx, [ebx]                  ; recup l'addr de la fn (RVA HintName remplacée pas Windows)

    pop ecx
    pop edx
    mov [ecx], eax
    mov [edx], ebx

    push NULL
    call MessageBox

    invoke wsprintf, ADDR buffer, ADDR filter, eax

    push 0
    push 0
    call ExitProcess

    push MB_ICONEXCLAMATION
    push offset ttr
    push offset buffer
    push 0
    call GetModuleHandle            ; Dieu Est Grand :)

    push 0
    call Beep
    ret

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

end start

; -------------------------------------------------------------------------
; from the Dr. rED mEAT's MASM32 template v 4.5
; -------------------------------------------------------------------------
