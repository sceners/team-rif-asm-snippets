
; -------------------------------------------------------------------------
;
;     $KORBUT proudly presents :
;        LogFileInfo Sample
;
; ::( cODED IN MASM32 v8 STYLe )::
;   ::( RESiSTANCE IS FUTiLE )::
;
; -------------------------------------------------------------------------
;
; mailto: skorbut_rif@yahoo.fr
; url:    http://www.rif.fr.fm
;
; -------------------------------------------------------------------------

include include.inc
include Algo.asm

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

.code

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

start:

    invoke GetModuleHandle, NULL                                            ; Routine principale
    mov hInstance, eax

    call main

    invoke ExitProcess, eax

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

main proc

    Dialog " : LogFileInfo by $KORBUT / RiF :", "Lucida Console", 10,\
            WS_OVERLAPPED or WS_SYSMENU or DS_CENTER,\
            5,\
            50, 50, 250, 70,\
            1024

    DlgStatic " ", SS_CENTER, 1, 1, 243, 10, eStatic

    DlgEdit ES_AUTOHSCROLL or ES_CENTER or WS_TABSTOP or WS_BORDER, 02, 12, 243, 10, eNom
    DlgStatic " ", SS_CENTER, 12, 24, 223, 10, eSerial

    DlgButton "&Log That !", BS_FLAT or WS_TABSTOP or BS_DEFPUSHBUTTON, 002+44, 34+2, 50, 15, bCheck
    DlgButton "&See Ya !", BS_FLAT or WS_TABSTOP,                        106+44, 34+2, 50, 15, bQuit

    CallModalDialog hInstance, 0, WndProc, NULL
    ret

main endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM

    .IF (uMsg == WM_DESTROY) || (uMsg == WM_CLOSE)
        invoke EndDialog, hWnd, NULL

    .ELSEIF (uMsg == WM_INITDIALOG)
        invoke LoadIcon, hInstance, 1
        mov hIcon, eax
        invoke SendMessage, hWnd, WM_SETICON, 1, eax
        invoke SetDlgItemText, hWnd, eStatic, ADDR About
        invoke GetDlgItem, hWnd, eNom
        invoke EnableWindow, eax, FALSE
        invoke GetDlgItem, hWnd, eStatic
        invoke EnableWindow, eax, FALSE
        invoke GetDlgItem, hWnd, eSerial
        invoke EnableWindow, eax, FALSE
        invoke GetDlgItem, hWnd, bCheck
        mov hWndCheck, eax

    .ELSEIF (uMsg == WM_COMMAND)
        mov eax, wParam

        .IF (ax == bCheck)
            invoke Algo, hWnd
            invoke EnableWindow, hWndCheck, FALSE

@@:     .ELSEIF (ax == bQuit)
            invoke ExitProcess, NULL

        .ENDIF

    .ENDIF

    xor eax, eax
    ret

WndProc endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

end start

; -------------------------------------------------------------------------
; from the Dr. rED mEAT's MASM32 template v 4.7
; -------------------------------------------------------------------------
