
; -------------------------------------------------------------------------
;
; the Dr. rED mEAT proudly presents :
;           My Own Buttons
;
; How to use the BM_OWNERDRAW to make beautiful buttons :)
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

; д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д

include include.inc

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

.code

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

start:

    invoke GetModuleHandle, NULL                                            ; Routine principale
    mov hInstance, eax

    call main

    invoke ExitProcess, eax

; д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д

main proc USES ebx

    Dialog "My Own Buttons - mEAT / RIF", "Tahoma", 10,\
            WS_SYSMENU or DS_CENTER or WS_MINIMIZEBOX	or WS_BORDER,\
            2,\
            10, 10, 110, 65,\
            2048

    DlgButton "About", BS_OWNERDRAW,  0, 0, 1, 1, 500                       ; Wd and Ht ignored (can't be 0 however)
    DlgButton "Exit",  BS_OWNERDRAW, 52, 0, 1, 1, 501

    CallModalDialog hInstance, 0, WndProc, NULL
    ret

main endp

; д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д

WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM

    .IF (uMsg == WM_DESTROY) || (uMsg == WM_CLOSE)
        invoke EndDialog, hWnd, NULL

    .ELSEIF (uMsg == WM_INITDIALOG)
        invoke LoadIcon, hInstance, 500
        invoke SendMessage, hWnd, WM_SETICON, ICON_SMALL, eax

    .ELSEIF (uMsg == WM_DRAWITEM)
        invoke DrawImage, hWnd, lParam                                      ; Thanks to Canterwood for your template

    .ELSEIF (uMsg == WM_COMMAND)
        mov eax, wParam
        movzx eax, ax

        .IF (ax == 500)
            invoke ShellAbout, hWnd, SADD ("My Own Buttons - meat / RIF 2004"), SADD ("RESISTANCE IS FUTILE"), 1

        .ELSEIF (ax == 501)
            invoke EndDialog, hWnd, NULL

        .ENDIF

    .ENDIF

    xor eax, eax
    ret

WndProc endp

; д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д=ў=д

end start

; -------------------------------------------------------------------------
; from the Dr. rED mEAT's MASM32 template v 4.5
; -------------------------------------------------------------------------
