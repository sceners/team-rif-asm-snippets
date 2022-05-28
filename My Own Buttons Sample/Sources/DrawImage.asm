
.code

; -------------------------------------------------------------------------

.data?

_Mytxt      db 256 dup (?)

; -------------------------------------------------------------------------

.code

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

DrawImage PROC hWnd:DWORD, lParam:LPARAM
    LOCAL hMemDC:DWORD
    LOCAL hFont:DWORD
    LOCAL XPos:DWORD
    LOCAL YPos:DWORD

    push esi
    mov esi, lParam
    assume esi:ptr DRAWITEMSTRUCT

    ; The size ain't significant due to this... It simply fix the size to 100 to avoid some MemoryDlg headaches :)
    ; ------------------------------------------------------------------------------------------------------------

    invoke SetWindowPos, FUNC (GetDlgItem, hWnd, [esi].CtlID), 0, 0, 0, 100, 100, SWP_NOZORDER or SWP_NOMOVE

    ; Here we create a default font
    ; -----------------------------

    invoke CreateFont, 14, 8, 0, 0, FW_DONTCARE, FALSE, FALSE, FALSE,\ 
                       DEFAULT_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,\ 
                       DEFAULT_QUALITY, FF_DONTCARE, SADD ("Arial")
    mov hFont, eax

    ; We create a virtual DC
    ; ----------------------

    invoke CreateCompatibleDC, [esi].hdc
    mov hMemDC, eax

    ; The image id depends of if the button is selected or not
    ; --------------------------------------------------------

    .IF ([esi].itemState & ODS_SELECTED)
        invoke BitmapFromResource, NULL, 1001

    .ELSE
        invoke BitmapFromResource, NULL, 1000

    .ENDIF

    ; We put the button on the virtual DC and paint it (with gray 818181h as transparency)
    ; ------------------------------------------------------------------------------------

    invoke SelectObject, hMemDC, eax
    invoke TransparentBlt, [esi].hdc, [esi].rcItem.left, [esi].rcItem.top,\
                            100, 100, hMemDC, 0, 0, 100, 100, 00818181h

    ; We put the font on the virtual DC
    ; ---------------------------------

    invoke SelectObject, hMemDC, hFont

    ; The text and shadow positions depends of if the button is selected or not
    ; -------------------------------------------------------------------------

    .IF ([esi].itemState & ODS_SELECTED)
        mov eax, [esi].rcItem.left
        add eax, 102
        mov [esi].rcItem.right, eax
        mov eax, [esi].rcItem.top
        add eax, 102
        mov [esi].rcItem.bottom, eax
        mov XPos, 2
        mov YPos, 3

    .ELSE
        mov eax, [esi].rcItem.left
        add eax, 100
        mov [esi].rcItem.right, eax
        mov eax, [esi].rcItem.top
        add eax, 100
        mov [esi].rcItem.bottom, eax
        mov XPos, 4
        mov YPos, 6

    .ENDIF

    ; We retreive the text from the control and show it with a shadow
    ; ---------------------------------------------------------------

    invoke GetDlgItemText, hWnd, [esi].CtlID, ADDR _Mytxt, 255
    inc eax
    invoke DrwShdTxt, [esi].hdc, ADDR [esi].rcItem, ADDR _Mytxt, eax, DT_SINGLELINE or DT_CENTER or DT_VCENTER,\
                      White, Black, XPos, YPos

    ; Merci et au revoir :)
    ; ---------------------

    invoke DeleteDC, hMemDC

    pop esi
    assume esi:nothing

    mov eax, TRUE
    ret

DrawImage endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

