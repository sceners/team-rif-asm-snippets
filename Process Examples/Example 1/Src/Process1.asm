
; -------------------------------------------------------------------------
;
;     $KORBUT proudly presents :         
;        Process Example #1        
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

    Dialog "Process Example #1 - $KORBUT", "Arial", 10,\
            WS_OVERLAPPED or WS_SYSMENU or DS_CENTER,\
            1,\
            50, 50, 220, 220,\
            1024

    DlgListView WS_BORDER or LVS_REPORT or LVS_NOSORTHEADER or LVS_SINGLESEL or LVS_SHOWSELALWAYS, 1, 1, 214, 205, lList

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
        mov tvcol.lx, 500
        mov tvcol.pszText, offset ColName
        ListView_InsertColumn hList, 0, ADDR tvcol  ; Colonne 1

        pushad

        mov ebx, dword ptr [0BFFC9C24h]
        mov ecx, [ebx]
        xor esi, esi

_Loop:
        mov edi, dword ptr [ecx+4*esi]
        or edi, edi
        jz @F

        push ecx
        mov ebx, dword ptr [edi+0Ch]
    
        ; -Insertion des textes----------------------------------------------------
        mov tvitem.imask, LVIF_TEXT
        mov tvitem.iItem, esi
        mov tvitem.iSubItem, 0
        
        push [edi+0Ch]
        pop tvitem.pszText

        inc tvitem.lParam
        ListView_InsertItem hList, ADDR tvitem      ; Item 0 | SubItem 0
        
        ; -------------------------------------------------------------------------
               
        pop ecx
        inc esi
        jmp _Loop

@@:
        popad

        ; -Creation du menu--------------------------------------------------------
        invoke CreatePopupMenu
        mov hMenu, eax
        invoke AppendMenu, hMenu, MF_STRING, mItem1, ADDR mnu1
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
            ListView_GetItemText hList, ListIndex, 0, offset buffer, 49
            invoke MessageBox, hWnd, ADDR buffer, ADDR ColName, MB_OK

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
