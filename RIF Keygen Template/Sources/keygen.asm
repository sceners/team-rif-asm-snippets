
; -------------------------------------------------------------------------
;
; the Dr. rED mEAT proudly presents :
; Keygen Template - CHALLENGE EDiTiON
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
include Xbutton.asm
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

    Dialog "meat's Keygen Template", "Lucida Console", 9,\
            WS_POPUP or DS_SYSMODAL,\
            4,\
            10, 10, 10, 10,\
            1024

    DlgStatic " ", SS_BITMAP, 0, 0, 1, 1, eStatic

    DlgStatic " ", SS_CENTER, 1, 60, 169, 10, eStatic2

    DlgEdit ES_AUTOHSCROLL or ES_CENTER or WS_TABSTOP, 1, 82, 169, 10, eNom
    DlgEdit ES_AUTOHSCROLL or ES_CENTER or WS_TABSTOP, 1, 94, 169, 10, eSerial

    CallModalDialog hInstance, 0, WndProc, NULL
    ret

main endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
    LOCAL Wtx:DWORD
    LOCAL Wty:DWORD

    .IF (uMsg == WM_DESTROY) || (uMsg == WM_CLOSE)
@@:     invoke ExitProcess, NULL

    .ELSEIF (uMsg == WM_INITDIALOG)
        invoke BitmapFromResource, hInstance, Bmp
        invoke SendDlgItemMessage, hWnd, eStatic, STM_SETIMAGE, IMAGE_BITMAP, eax

        invoke SetDlgItemText, hWnd, eStatic2, ADDR Keygen4
        invoke SetDlgItemText, hWnd, eNom, ADDR YourName
        invoke GetDlgItem, hWnd, eSerial
        invoke SetFocus, eax

        invoke Beep, 0, 0
        invoke Algo, hWnd
        mov AdrOut, eax
        invoke SetTimer, hWnd, Time, 1, NULL

        invoke GetSystemMetrics, SM_CXSCREEN
        invoke TopXY, 300, eax
        mov Wtx, eax

        invoke GetSystemMetrics, SM_CYSCREEN
        invoke TopXY, 300, eax
        mov Wty, eax

        invoke SetWindowPos, hWnd, 0, Wtx, Wty, 300, 300, SWP_NOZORDER

        invoke XButton, hWnd, 20, 250, 1790, 1791, bDoIt
        invoke XButton, hWnd, 120, 250, 1792, 1793, bExit
        invoke XButton, hWnd, 220, 250, 1794, 1795, bAbout

    .ELSEIF (uMsg == WM_LBUTTONDOWN)
        invoke SendMessage, hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0

    .ELSEIF (uMsg == WM_TIMER)
        invoke TimerProc, hWnd

    .ELSEIF (uMsg == WM_CTLCOLOREDIT) || (uMsg == WM_CTLCOLORSTATIC)
        invoke GetDlgCtrlID, lParam
            .IF (eax == eNom)
                push 0FFFFFFh
            .ELSEIF (eax == eSerial)
                push 0BFE860h
            .ELSEIF (eax == eStatic2)
                push 0FFFFFFh
            .ELSE
                xor eax, eax
                ret
            .ENDIF

            pop eax
            invoke SetTextColor, wParam, eax
            invoke SetBkColor, wParam, 0
            invoke GetStockObject, BLACK_BRUSH
            ret

    .ELSEIF (uMsg == WM_COMMAND)
        mov eax, wParam

        .IF (ax == bDoIt)
            .IF !(count)
                invoke Beep, 0, 0
                invoke Algo, hWnd
                mov AdrOut, eax
                invoke SetTimer, hWnd, Time, 1, NULL
            .ENDIF

        .ELSEIF (ax == bExit)
            jmp @B

        .ELSEIF (ax == bAbout)
            invoke Beep, 0, 0
            invoke about, hWnd

        .ENDIF

    .ENDIF

    xor eax, eax
    ret

WndProc endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

about proc hWnd:HWND

    Dialog "About", "Lucida Console", 9,\
            WS_POPUP or DS_SYSMODAL,\
            3,\
            10, 10, 10, 10,\
            1024

    DlgStatic " ", SS_BITMAP, 0, 0, 1, 1, eStatic

    DlgStatic " ", SS_CENTER, 0, 15, 171, 80, eStatic2

    DlgStatic " ", SS_BITMAP, 2, 2, 1, 1, eStatic3

    CallModalDialog hInstance, 0, AbtProc, NULL
    ret

about endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

AbtProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
    LOCAL Wtx:DWORD
    LOCAL Wty:DWORD

    .IF (uMsg == WM_DESTROY) || (uMsg == WM_CLOSE)
@@:     invoke EndDialog, hWnd, NULL

    .ELSEIF (uMsg == WM_INITDIALOG)
        invoke BitmapFromResource, hInstance, 1788
        invoke SendDlgItemMessage, hWnd, eStatic, STM_SETIMAGE, IMAGE_BITMAP, eax

        invoke BitmapFromResource, hInstance, 8000
        invoke SendDlgItemMessage, hWnd, eStatic3, STM_SETIMAGE, IMAGE_BITMAP, eax

        invoke SetDlgItemText, hWnd, eStatic2, ADDR About

        invoke GetSystemMetrics, SM_CXSCREEN
        invoke TopXY, 300, eax
        mov Wtx, eax

        invoke GetSystemMetrics, SM_CYSCREEN
        invoke TopXY, 200, eax
        mov Wty, eax

        invoke SetWindowPos, hWnd, 0, Wtx, Wty, 300, 200, SWP_NOZORDER

        invoke XButton, hWnd, 20, 150, 1796, 1797, bMail
        invoke XButton, hWnd, 120, 150, 1798, 1799, bVisit
        invoke XButton, hWnd, 220, 150, 1792, 1793, bExit

        mov Total, 0
        mov count2, 0
        mov direct, 0
        invoke SetTimer, hWnd, Time2, 100, NULL

    .ELSEIF (uMsg == WM_LBUTTONDOWN)
        invoke SendMessage, hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0

    .ELSEIF (uMsg == WM_TIMER)
        invoke TimerProc2, hWnd

    .ELSEIF (uMsg == WM_CTLCOLORSTATIC)
        invoke SetTextColor, wParam, 0FFFFFFh
        invoke SetBkColor, wParam, 0
        invoke GetStockObject, NULL_BRUSH
        ret

    .ELSEIF (uMsg == WM_COMMAND)
        mov eax, wParam

        .IF (ax == bMail)
            invoke ShellExecute, NULL, NULL, ADDR YourMail, NULL, NULL, NULL

        .ELSEIF (ax == bVisit)
            invoke ShellExecute, NULL, NULL, ADDR YourSite, NULL, NULL, NULL

        .ELSEIF (ax == bExit)
            jmp @B

        .ENDIF

    .ENDIF

    xor eax, eax
    ret

AbtProc endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

TimerProc proc hWnd:HWND

        .IF !(count) && !(decount)

            mov esi, AdrOut
@@:         cmp byte ptr [esi], 0
            je Begin
            sub byte ptr [esi], Key
            inc esi
            jmp @B

        .ENDIF

Begin:  mov esi, AdrOut
        add esi, count
        inc byte ptr [esi]
        cmp decount, Key-1
        jne @F

        inc count
        cmp byte ptr [esi+1], 0
        je Finish
        mov decount, 0
        jmp Set

@@:     inc decount
Set:    invoke SetDlgItemText, hWnd, eSerial, AdrOut
        ret

Finish: invoke SetDlgItemText, hWnd, eSerial, AdrOut
        invoke KillTimer, hWnd, Time
        mov decount, 0
        mov count, 0

    ret

TimerProc endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

TimerProc2 proc hWnd:HWND

    inc Total
    mov eax, count2
    add eax, 8000
    invoke BitmapFromResource, hInstance, eax
    invoke SendDlgItemMessage, hWnd, eStatic3, STM_SETIMAGE, IMAGE_BITMAP, eax

        .IF !(direct)
            inc count2

            .IF (count2 == 06)
                mov direct, 1
            .ENDIF

        .ELSEIF (Total == 19)
            invoke KillTimer, hWnd, Time2

        .ELSE
            dec count2
            .IF !(count2)
                mov direct, 0
            .ENDIF

        .ENDIF

    ret

TimerProc2 endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

TopXY proc wDim:DWORD, sDim:DWORD

    shr sDim, 1      ; divide screen dimension by 2
    shr wDim, 1      ; divide window dimension by 2
    mov eax, wDim    ; copy window dimension into eax
    sub sDim, eax    ; sub half win dimension from half screen dimension

    mov eax, sDim
    ret

TopXY endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

end start

; -------------------------------------------------------------------------
; from the Dr. rED mEAT's MASM32 template v 4.7
; -------------------------------------------------------------------------
