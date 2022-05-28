
; -------------------------------------------------------------------------
;
; the Dr. rED mEAT proudly presents :
;      Serial Database Sample
;
; ::( cODED IN MASM32 v8 STYLe )::
;   ::( RESiSTANCE IS FUTiLE )::
;
; "1664 mm : t'as vu l'calibre ? Plutôt mourrir qu'vivre pas libre..."
; Gérard Baste (Svinkels)
;
; -------------------------------------------------------------------------
;
; mailto: redmeatrif@yahoo.fr
; url:    http://www.rif.fr.fm
;
; -------------------------------------------------------------------------

include include.inc
include windowsX.inc

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

.const

TVM_SETBKCOLOR         equ  TV_FIRST + 29       ; tnx 2 Ewayne Wagner for this undocumented stuff !
TVM_SETTEXTCOLOR       equ  TV_FIRST + 30
TVM_SETLINECOLOR       equ  TV_FIRST + 40
TVM_SETINSERTMARKCOLOR equ  TV_FIRST + 37

; -------------------------------------------------------------------------

.data?

hInstance   HINSTANCE ?
hBrush      dd ?
hFont       dd ?
hTree       dd ?
Alpha       dd ?
Alpha2      db 10 dup (?)
Count       dd ?
buffer      db 101 dup (?)
buffer2     db 101 dup (?)
hFile       dd ?
hMapping    dd ?
pMapping    dd ?
shift       dd ?
tvins       TV_INSERTSTRUCT <?>
tvitem      TVITEM <?>

; -------------------------------------------------------------------------

.data

FontName    db "Tahoma", 0
_0To9       db "0-9", 0
_Spe        db "! Misc !", 0
database    db "db.txt", 0
pabien      db "Fucked up !", 0
missdb      db "Can't open the database !", 10, 13
            db "Check if its present in the current directory", 0
diz         db "Here is a short sample of s/n db", 13, 10
            db "See the help file for further infos...", 13, 10, 13, 10
            db "THIS CURRENT PACKAGE DOES NOT CONTAIN ANY VALID S/N !", 13, 10, 13, 10
            db "the Dr. rED mEAT / RIF", 0

; -------------------------------------------------------------------------

.code

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

start:

    invoke GetModuleHandle, NULL                                             ; Routine principale
    mov hInstance, eax

    call main

    invoke UnmapViewOfFile, pMapping
    invoke CloseHandle, hMapping
    invoke CloseHandle, hFile
    invoke ExitProcess, eax

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

main proc
    LOCAL icce : INITCOMMONCONTROLSEX

    mov icce.dwSize, SIZEOF INITCOMMONCONTROLSEX
    mov icce.dwICC, ICC_WIN95_CLASSES
    invoke InitCommonControlsEx, ADDR icce

    Dialog "Serial Database Sample - Dr. rED mEAT / RESiSTANCE IS FUTiLE 2oo4", "Tahoma", 10,\
            WS_SYSMENU or DS_CENTER or WS_MINIMIZEBOX	or WS_BORDER or DS_SYSMODAL,\
            10,\
            10, 10, 400, 200,\
            2048

    DlgEdit ES_MULTILINE or ES_READONLY or ES_WANTRETURN or ES_AUTOHSCROLL or WS_TABSTOP or ES_CENTER,\
            173, 89, 224, 98, eInfo

    DlgStatic ".: S/n db Sample :.",  SS_CENTER, 173,  1, 224, 34, sName
    DlgStatic "Version :",            NULL, 173, 45, 69, 11, sver
    DlgStatic "1.0",                  NULL, 225, 45, 150, 11, sVer
    DlgStatic "Company :",            NULL, 173, 56, 69, 11, scomp
    DlgStatic "RIF",                  NULL, 225, 56, 150, 11, sComp
    DlgStatic "Url :",                NULL, 173, 67, 69, 11, surl
    DlgStatic "http://www.rif.fr.fm", SS_NOTIFY, 225, 67, 150, 11, sUrl         ; tnx 2 nxrv for the SS_NOTIFY style !
    DlgStatic "Infos :",              NULL, 173, 78, 69, 11, sinfo

    DlgTreeView WS_BORDER or TVS_HASLINES or TVS_HASBUTTONS or TVS_LINESATROOT, 1, 1, 170, 186, lList

    CallModalDialog hInstance, 0, WndProc, NULL
    ret

main endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
    LOCAL LogBrush : LOGBRUSH
    LOCAL LogFont  : LOGFONT
    LOCAL rect     : RECT

    SWITCH (uMsg)
    CASE (WM_CLOSE)
        invoke EndDialog, hWnd, NULL

    CASE (WM_INITDIALOG)

        invoke splash, hWnd

        invoke LoadIcon, hInstance, 1
        invoke SendMessage, hWnd, WM_SETICON, ICON_SMALL, eax

        invoke GetDlgItem, hWnd, lList
        mov hTree, eax

        TreeView_DeleteAllItems eax
        mov byte ptr [Alpha], 'A'
        mov Count, 0

; -------------------------------------------------------------------------
; Insertions des items ds le treeview
; -------------------------------------------------------------------------

@@:     mov tvins.hParent, NULL
        mov tvins.hInsertAfter, TVI_LAST
        mov tvins.item._mask, TVIF_TEXT or TVIF_PARAM
        mov tvins.item.lParam, 1789                     ; flag de parent
        mov tvins.item.cChildren, 1

        .IF (Count == 26)
            mov tvins.item.pszText, offset _0To9
        .ELSEIF (Count == 27)
            mov tvins.item.pszText, offset _Spe
        .ELSE
            mov tvins.item.pszText, offset Alpha
        .ENDIF

        TreeView_InsertItem hTree, ADDR tvins
        inc byte ptr [Alpha]
        inc Count
        cmp Count, 28
        jne @B

; -------------------------------------------------------------------------
; Assignation des fonts et couleurs du tree view
; -------------------------------------------------------------------------

        invoke SendMessage, hTree, TVM_SETBKCOLOR, 0, 0
        invoke SendMessage, hTree, TVM_SETTEXTCOLOR, 0, 0000B0F0h
        invoke SendMessage, hTree, TVM_SETLINECOLOR, 0, 00FFFFFFh
        invoke SendMessage, hTree, TVM_SETINSERTMARK, 0, 000080C0h

        invoke CreateFont, 24, 12, 0, 0, FW_DEMIBOLD, FALSE, FALSE, FALSE,\ 
                            DEFAULT_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,\ 
                            DEFAULT_QUALITY, FF_DONTCARE, ADDR FontName
        invoke SendDlgItemMessage, hWnd, sName, WM_SETFONT, eax, TRUE

        invoke CreateFont, 14, 8, 0, 0, FW_DEMIBOLD, FALSE, FALSE, FALSE,\ 
                            DEFAULT_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,\ 
                            DEFAULT_QUALITY, FF_DONTCARE, ADDR FontName
        mov hFont, eax
        invoke SendDlgItemMessage, hWnd, sver, WM_SETFONT, eax, TRUE
        invoke SendDlgItemMessage, hWnd, scomp, WM_SETFONT, hFont, TRUE
        invoke SendDlgItemMessage, hWnd, surl, WM_SETFONT, hFont, TRUE
        invoke SendDlgItemMessage, hWnd, sinfo, WM_SETFONT, hFont, TRUE
        invoke SendDlgItemMessage, hWnd, eInfo, WM_SETFONT, hFont, TRUE

        invoke CreateFont, 0, 0, 0, 0, 0, FALSE, TRUE, FALSE,\ 
                            DEFAULT_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,\ 
                            DEFAULT_QUALITY, FF_DONTCARE, ADDR FontName
        invoke SendDlgItemMessage, hWnd, sUrl, WM_SETFONT, eax, TRUE

; -------------------------------------------------------------------------
; Chargement de la database
; -------------------------------------------------------------------------

        invoke CreateFile, ADDR database, GENERIC_READ, FILE_SHARE_READ,\
                            NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL,\
                            NULL
        mov hFile, eax
        .IF (eax == -1)
            invoke MessageBox, hWnd, ADDR missdb, ADDR pabien, MB_ICONINFORMATION
            invoke EndDialog, hWnd, NULL
        .ENDIF

        invoke CreateFileMapping, eax, NULL, PAGE_READONLY, 0, 0, 0
        mov hMapping, eax

        invoke MapViewOfFile, eax, FILE_MAP_READ, 0, 0, 0
        mov pMapping, eax

        invoke ListAll, hWnd

        invoke SetDlgItemText, hWnd, eInfo, ADDR diz
        invoke SetFocus, hTree

; -------------------------------------------------------------------------
; A pu... :)
; -------------------------------------------------------------------------

    CASE (WM_ERASEBKGND)
        mov LogBrush.lbStyle, BS_SOLID
        mov LogBrush.lbColor, 0
        invoke CreateBrushIndirect, ADDR LogBrush
        mov hBrush, eax
        invoke GetClientRect, hWnd, ADDR rect
        invoke FillRect, wParam, ADDR rect, hBrush
        mov eax, TRUE
        ret

    CASE (WM_CTLCOLORSTATIC)
        invoke GetDlgCtrlID, lParam

@@:     .IF (eax == sUrl || eax == sName)
            invoke SetTextColor, wParam, 000080C0h
        .ELSEIF (eax == eInfo)
            invoke SetTextColor, wParam, 0000B0F0h
        .ELSE
            invoke SetTextColor, wParam, 00FFFFFFh
        .ENDIF

        invoke SetBkColor, wParam, 0
        invoke GetStockObject, BLACK_BRUSH
        ret

    CASE (WM_CTLCOLOREDIT)
        invoke GetDlgCtrlID, lParam
        .IF (eax != lList)
            jmp @B
        .ENDIF

    CASE (WM_NOTIFY)
        mov eax, lParam
        .IF ([eax.NMHDR].code == TVN_SELCHANGED)
            mov eax, [eax].NM_TREEVIEW.itemNew.hItem
            mov tvitem.hItem, eax
            mov tvitem._mask, TVIF_TEXT or TVIF_PARAM
            mov tvitem.pszText, offset buffer2
            mov tvitem.cchTextMax, SIZEOF buffer2
            TreeView_GetItem hTree, ADDR tvitem
            .IF (tvitem.lParam != 1789)                     ; si pas parent
                invoke GetInfoz, hWnd, ADDR buffer2
            .ENDIF
        .ENDIF

    CASE (WM_COMMAND)
        mov eax, wParam
        movzx eax, ax

        SWITCH (eax)
        CASE (sUrl)
            invoke GetDlgItemText, hWnd, sUrl, ADDR buffer, 100
            .IF (eax)
                invoke ShellExecute, NULL, NULL, ADDR buffer, NULL, NULL, NULL
            .ENDIF

        ENDSW
    ENDSW

    xor eax, eax
    ret

WndProc endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

GetInfoz PROC hWnd:DWORD, lpText:DWORD

; - - - - - - - - - - - - - - - - - -
; Recherche du Name
; - - - - - - - - - - - - - - - - - -

        mov shift, 0

_nop:   invoke RtlZeroMemory, ADDR buffer, SIZEOF buffer

        mov eax, pMapping
        add eax, shift

        .WHILE (dword ptr [eax] != 'maN_')
            inc shift
            inc eax
        .ENDW

        add eax, 4
        add shift, 4

        .WHILE (byte ptr [eax] == ' ')
            inc shift
            inc eax
        .ENDW

        xor ecx, ecx

        .WHILE (byte ptr [eax] != 0Dh && byte ptr [eax] != 0Ah)
            mov bl, byte ptr [eax]
            mov [buffer+ecx], bl
            inc shift
            inc eax
            inc ecx
        .ENDW

        invoke lstrcmp, ADDR buffer, lpText
        or eax, eax
        jne _nop

        invoke SetDlgItemText, hWnd, sName, ADDR buffer

; - - - - - - - - - - - - - - - - - -
; Recherche de la version
; - - - - - - - - - - - - - - - - - -

        invoke RtlZeroMemory, ADDR buffer, SIZEOF buffer
        mov eax, pMapping
        add eax, shift

        .WHILE (dword ptr [eax] != 'reV_')
            inc eax
        .ENDW

        add eax, 4

        .WHILE (byte ptr [eax] == ' ')
            inc eax
        .ENDW

        xor ecx, ecx

        .WHILE (byte ptr [eax] != 0Dh && byte ptr [eax] != 0Ah)
            mov bl, byte ptr [eax]
            mov [buffer+ecx], bl
            inc eax
            inc ecx
        .ENDW

        invoke SetDlgItemText, hWnd, sVer, ADDR buffer

; - - - - - - - - - - - - - - - - - -
; Recherche de la compagnie
; - - - - - - - - - - - - - - - - - -

        invoke RtlZeroMemory, ADDR buffer, SIZEOF buffer
        mov eax, pMapping
        add eax, shift

        .WHILE (dword ptr [eax] != 'pmC_')
            inc eax
        .ENDW

        add eax, 4

        .WHILE (byte ptr [eax] == ' ')
            inc eax
        .ENDW

        xor ecx, ecx

        .WHILE (byte ptr [eax] != 0Dh && byte ptr [eax] != 0Ah)
            mov bl, byte ptr [eax]
            mov [buffer+ecx], bl
            inc eax
            inc ecx
        .ENDW

        invoke SetDlgItemText, hWnd, sComp, ADDR buffer

; - - - - - - - - - - - - - - - - - -
; Recherche de l'URL
; - - - - - - - - - - - - - - - - - -

        invoke RtlZeroMemory, ADDR buffer, SIZEOF buffer
        mov eax, pMapping
        add eax, shift

        .WHILE (dword ptr [eax] != 'lrU_')
            inc eax
        .ENDW

        add eax, 4

        .WHILE (byte ptr [eax] == ' ')
            inc eax
        .ENDW

        xor ecx, ecx

        .WHILE (byte ptr [eax] != 0Dh && byte ptr [eax] != 0Ah)
            mov bl, byte ptr [eax]
            mov [buffer+ecx], bl
            inc eax
            inc ecx
        .ENDW

        invoke SetDlgItemText, hWnd, sUrl, ADDR buffer

; - - - - - - - - - - - - - - - - - -
; Recherche des infos
; - - - - - - - - - - - - - - - - - -

        invoke RtlZeroMemory, ADDR buffer, SIZEOF buffer
        mov eax, pMapping
        add eax, shift

        .WHILE (dword ptr [eax] != 'ofN_')
            inc eax
        .ENDW

        add eax, 4

        .WHILE (byte ptr [eax] == ' ')
            inc eax
        .ENDW

        xor ecx, ecx

        .WHILE (dword ptr [eax] != 'dnE_')
            mov bl, byte ptr [eax]
            .IF (bl == 0Dh || bl == 0Ah)
                mov word ptr [buffer+ecx], 0A0Dh
                add eax, 2
                add ecx, 2
                .WHILE (byte ptr [eax] == ' ')
                    inc eax
                .ENDW
            .ELSE
                mov [buffer+ecx], bl
                inc eax
                inc ecx
            .ENDIF
        .ENDW

        invoke SetDlgItemText, hWnd, eInfo, ADDR buffer
        ret

GetInfoz endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

ListAll PROC hWnd:DWORD

; - - - - - - - - - - - - - - - - - -
; Recherche du Name
; - - - - - - - - - - - - - - - - - -

        mov shift, 0

_yop:   invoke RtlZeroMemory, ADDR buffer, SIZEOF buffer

        mov eax, pMapping
        add eax, shift

        .WHILE (dword ptr [eax] != 'maN_')
            inc shift
            inc eax
        .ENDW

        add eax, 4
        add shift, 4

        .WHILE (byte ptr [eax] == ' ')
            inc shift
            inc eax
        .ENDW

        xor ecx, ecx

        .WHILE (byte ptr [eax] != 0Dh && byte ptr [eax] != 0Ah)
            mov bl, byte ptr [eax]
            mov [buffer+ecx], bl
            inc shift
            inc eax
            inc ecx
        .ENDW

; - - - - - - - - - - - - - - - - - -
; Stockage du Name dans le Tree View (ca se corse :)
; - - - - - - - - - - - - - - - - - -

        movzx ebx, byte ptr [buffer]
        mov [Alpha], ebx
        invoke CharUpperBuff, ADDR Alpha, 4                     ; converti le perms char du name en maj (pr comparaison)

        mov tvitem._mask, TVIF_TEXT                             ; (initialisation de la structure)
        mov tvitem.pszText, offset Alpha2
        mov tvitem.cchTextMax, SIZEOF Alpha2

        TreeView_GetRoot hTree                                  ; recup le txt du prems item du tree view
        mov tvitem.hItem, eax                                   ; on stock l'handle du root
        TreeView_GetItem hTree, ADDR tvitem                     ; hop ! structure remplie !

@@:     mov eax, tvitem.pszText
        movzx eax, byte ptr [eax]                               ; comparaison pour classement
        mov ebx, [Alpha]
        .IF (eax == ebx) || ((eax == '0') && (ebx >= '0' && ebx <= '9')) || (eax == '!')
            jmp @F
        .ENDIF

        TreeView_GetNextVisible hTree, tvitem.hItem             ; nada ! On continue avec l'item suivant
        mov tvitem.hItem, eax                                   ; handle stocké !
        TreeView_GetItem hTree, ADDR tvitem                     ; hop !
        jmp @B

@@:     mov eax, tvitem.hItem                                   ; yeah !
        mov tvins.hParent, eax                                  ; l'handle de l'item est le parent de notre new item
        mov tvins.hInsertAfter, TVI_SORT                        ; tri alpha
        mov tvins.item._mask, TVIF_TEXT
        mov tvins.item.pszText, offset buffer
        TreeView_InsertItem hTree, ADDR tvins                   ; on insert !

; - - - - - - - - - - - - - - - - - -
; Verif du prochain tag
; - - - - - - - - - - - - - - - - - -

        mov eax, pMapping
        add eax, shift

        .WHILE (dword ptr [eax] != 'dnE_')
            inc eax
        .ENDW

        add eax, 4
        invoke GetNextTag, eax
        .IF (eax == 'foE_')
            ret
        .ELSE
            jmp _yop
        .ENDIF

ListAll endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

GetNextTag PROC strt:DWORD

        mov eax, strt

_back:  .WHILE (byte ptr [eax] != '_')
            inc eax
        .ENDW

        .IF (dword ptr [eax] != 'maN_')
            .IF (dword ptr [eax] != 'reV_')
                .IF (dword ptr [eax] != 'pmC_')
                    .IF (dword ptr [eax] != 'lrU_')
                        .IF (dword ptr [eax] != 'ofN_')
                            .IF (dword ptr [eax] != 'dnE_')
                                .IF (dword ptr [eax] != 'foE_')
                                    add eax, 4
                                    jmp _back
                                .ENDIF
                            .ENDIF
                        .ENDIF
                    .ENDIF
                .ENDIF
            .ENDIF
        .ENDIF

        mov eax, [eax]
        ret

GetNextTag endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

splash PROC hWnd:HWND

    Dialog " ", "Tahoma", 10,\
            WS_POPUP or DS_SYSMODAL,\
            1,\
            10, 10, 1, 1,\
            1024

    DlgStatic " ", SS_BITMAP, 0, 0, 1, 1, eImg

    CallModalDialog hInstance, hWnd, SplProc, NULL
    ret

splash endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

SplProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
    LOCAL Wtx:DWORD
    LOCAL Wty:DWORD

    SWITCH (uMsg)
    CASE (WM_INITDIALOG)
        invoke BitmapFromResource, hInstance, Img
        invoke SendDlgItemMessage, hWnd, eImg, STM_SETIMAGE, IMAGE_BITMAP, eax

        invoke GetSystemMetrics, SM_CXSCREEN
        invoke TopXY, 454, eax
        mov Wtx, eax

        invoke GetSystemMetrics, SM_CYSCREEN
        invoke TopXY, 340, eax
        mov Wty, eax

        invoke SetWindowPos, hWnd, 0, Wtx, Wty, 454, 340, SWP_NOZORDER

        invoke SetTimer, hWnd, Timer, 3000, NULL

    CASE (WM_TIMER)
        invoke EndDialog, hWnd, NULL

    ENDSW

    xor eax, eax
    ret

SplProc endp

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