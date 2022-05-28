
; -------------------------------------------------------------------------
;
; the Dr. rED mEAT proudly presents :
;      Popup on ListView sample
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
include windowsx.inc

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
    LOCAL icce:INITCOMMONCONTROLSEX

    mov icce.dwSize, SIZEOF INITCOMMONCONTROLSEX
    mov icce.dwICC, ICC_LISTVIEW_CLASSES
    invoke InitCommonControlsEx, ADDR icce

    Dialog "Popup on ListView", "Arial", 10,\
            WS_OVERLAPPED or WS_SYSMENU or DS_CENTER,\
            1,\
            50, 50, 105, 80,\
            1024

    DlgListView WS_BORDER or LVS_REPORT or LVS_NOSORTHEADER or LVS_SINGLESEL or LVS_SHOWSELALWAYS, 1, 1, 100, 50, lList

    CallModalDialog hInstance, 0, WndProc, NULL
    ret

main endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
    LOCAL tvitem:LVITEM
    LOCAL tvcol:LVCOLUMN
    LOCAL Coord:POINT

    .IF (uMsg == WM_DESTROY) || (uMsg == WM_CLOSE)
        invoke EndDialog, hWnd, NULL

    .ELSEIF (uMsg == WM_INITDIALOG)
        invoke GetDlgItem, hWnd, lList
        mov hList, eax

        ; -Definitions des colonnes------------------------------------------------
        mov tvcol.imask, LVCF_FMT or LVCF_WIDTH or LVCF_TEXT or LVCF_SUBITEM
        mov tvcol.fmt, LVCFMT_LEFT
        mov tvcol.lx, 73
        mov tvcol.pszText, offset ColName
        ListView_InsertColumn hList, 0, ADDR tvcol  ; Colonne 1

        mov tvcol.pszText, offset ColDiz
        ListView_InsertColumn hList, 1, ADDR tvcol  ; Colonne 2

        ; -Insertion des textes----------------------------------------------------
        mov tvitem.imask, LVIF_TEXT
        mov tvitem.iItem, 0
        mov tvitem.iSubItem, 0
        mov tvitem.pszText, offset txt1
        inc tvitem.lParam
        ListView_InsertItem hList, ADDR tvitem      ; Item 0 | SubItem 0

        mov tvitem.pszText, offset diz1
        inc tvitem.iSubItem
        ListView_SetItem hList, ADDR tvitem         ; Item 0 | SubItem 1

        mov tvitem.iItem, 1
        mov tvitem.iSubItem, 0
        mov tvitem.pszText, offset txt2
        inc tvitem.lParam
        ListView_InsertItem hList, ADDR tvitem      ; Item 1 | SubItem 0

        mov tvitem.pszText, offset diz2
        inc tvitem.iSubItem
        ListView_SetItem hList, ADDR tvitem         ; Item 1 | SubItem 1

        mov tvitem.iItem, 2
        mov tvitem.iSubItem, 0
        mov tvitem.pszText, offset txt3
        inc tvitem.lParam
        ListView_InsertItem hList, ADDR tvitem      ; Item 2 | SubItem 0

        mov tvitem.pszText, offset diz3
        inc tvitem.iSubItem
        ListView_SetItem hList, ADDR tvitem         ; Item 2 | SubItem 1

        ; -Creation du menu--------------------------------------------------------
        invoke CreatePopupMenu
        mov hMenu, eax
        invoke AppendMenu, hMenu, MF_STRING, mItem1, ADDR mnu1
        invoke AppendMenu, hMenu, MF_STRING, mItem2, ADDR mnu2

        ; -------------------------------------------------------------------------

    .ELSEIF (uMsg == WM_NOTIFY)
        mov eax, lParam
        .IF ([eax.NMHDR].code == NM_RCLICK)
            mov eax, [eax].NM_LISTVIEW.iItem
            .IF (eax != -1)
                mov ListIndex, eax
                invoke GetCursorPos, ADDR Coord
                invoke TrackPopupMenu, hMenu, TPM_LEFTALIGN, Coord.x, Coord.y, NULL, hWnd, NULL
            .ENDIF
        .ENDIF

    .ELSEIF (uMsg == WM_COMMAND)
        mov eax, wParam
        .IF (ax == mItem1)
            ListView_GetItemText hList, ListIndex, 1, offset buffer, 49
            invoke MessageBox, hWnd, ADDR buffer, ADDR ColDiz, MB_OK

        .ELSEIF (ax == mItem2)
            ListView_DeleteItem hList, ListIndex

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
