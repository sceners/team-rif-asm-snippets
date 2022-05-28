
; -------------------------------------------------------------------------
;
; the Dr. rED mEAT proudly presents :
; -----------------------------------
;
; Utilisation sommaire des instructions FPU
; Conversion Euro / Franc
;
; Si vous voulez comprendre le comportement : dщbuggez avec Olly !
;
; .:( WRiTTEN IN PuRE ASSEMBLY ):.
;
; -------------------------------------------------------------------------
;
; mailto: redmeat_rif@yahoo.fr
; url:    http://www.rif.fr.fm
;
; -------------------------------------------------------------------------

include include.inc

; д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д

.data

MyVar1      dq 0.0                                                          ; Buffer Montant EUR
MyVar2      dq 6.55957                                                      ; Devise FRF

string      db "meat's FPU sample", 0
string2     db "Entrez le montant en Euro р convertir", 0

filter      db "EUR : %s", 10, 13
            db "FRF : %s", 0

; -------------------------------------------------------------------------

.data?

hInstance   HINSTANCE ?

buffer      db 128 dup (?)
buffer2     db 20 dup (?)
buffer3     db 20 dup (?)

; -------------------------------------------------------------------------

.code

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

start:

    invoke GetModuleHandle, NULL
    mov hInstance, eax

    invoke GetTextInput, NULL, hInstance, NULL, ADDR string, ADDR string2, ADDR buffer

        .IF (byte ptr [buffer])
            invoke StrToFloat, ADDR buffer, ADDR MyVar1 ; Convertion Str/Flt

            fld MyVar2                                  ; Push MyVar2
            fld MyVar1                                  ; Push MyVar2
                                                        ; 
                                                        ; st(0) = MyVar1
                                                        ; st(1) = MyVar2 (Comme une pile de st(0) р st(7))

            fmulp st(1), st(0)                          ; st(0) *= st(1)

            fstp MyVar1                                 ; Pop MyVar1

            invoke FloatToStr2, MyVar1, ADDR buffer2    ; Convertion Flt/Str

            invoke lstrcpy, ADDR buffer3, ADDR buffer
            invoke wsprintf, ADDR buffer, ADDR filter, ADDR buffer3, ADDR buffer2

            invoke MessageBox, NULL, ADDR buffer, ADDR string, MB_OK
        .ENDIF

    invoke ExitProcess, NULL

; д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д

end start

; -------------------------------------------------------------------------
; from the Dr. rED mEAT's MASM32 template v 4.5
; -------------------------------------------------------------------------
