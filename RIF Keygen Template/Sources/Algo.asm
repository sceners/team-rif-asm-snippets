
.code

; д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д

Algo PROC hWnd:HWND

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

.data

Keygen4     db "Dr. rED mEAT kEYmE #1", 0                           ; Name of the target
YourName    db "tHA lAST mEAT / [R!F]", 0                           ; Cracker's name
About       db "RIF 2k3 proudly presents", 10, 13                   ; About text
            db "=----------------------=", 10, 13, 10, 13
            db "Keygen for Dr. rED mEAT kEYmE #1", 10, 13, 10, 13
            db "code && gfx : meat", 0
YourMail    db "mailto:redmeat_rif@yahoo.fr", 0                     ; Cracker's mail
YourSite    db "http://www.rif.fr.fm", 0                            ; Cracker's website URL
Empty       db "Doh ! Ya forgot yer name ?", 0                      ; NONAME string

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

.data?

UserName    db 50 dup (?)

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

.code

        invoke GetDlgItemText, hWnd, eNom, ADDR UserName, 49
        or eax, eax

        .IF (ZERO?)

            lea eax, Empty                                                  ; eax = return value

        .ELSE

; -------------------------------------------------------------------------
; Put yer fuckin' algo here
; -------------------------------------------------------------------------

@@:         lea eax, UserName
            push eax

@@:         mov bl, [eax]
            or bl, bl
            je @F
            add bl, 1
            mov [eax], bl
            inc eax
            jmp @B

@@:         pop eax                                                         ; eax = return value

        .ENDIF

    ret

Algo endp

; д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д

; -------------------------------------------------------------------------
; EOF
; -------------------------------------------------------------------------
