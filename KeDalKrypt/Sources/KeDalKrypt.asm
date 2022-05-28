
; -------------------------------------------------------------------------
;
; the Dr. rED mEAT proudly presents :
;  KeDalKrypt - DalKrypt's Decryptor
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

.data?

hInstance       HINSTANCE ?
ofn             OPENFILENAME <?>
PESTarget       PES_TARGET <?>
pPEHead         dd ?
pSecTab         dd ?
FileName        db MAX_PATH dup (?)
NbSec           dd ?
ImgBase         dd ?

; -------------------------------------------------------------------------

.data

Filter          db "DalKrypt 1.0 Krypted files (*.exe)", 0, "*.exe", 0, 0
ofnTtr          db "KeDalKrypt v1.0 - meat / RIF 2004", 0
PasMZ           db "Le fichier est même pas MZ :(", 0
PasPE           db "Le fichier est même pas PE :(", 0
CBon            db "Fichier décrypté avec succès", 0

; -------------------------------------------------------------------------

.code

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

start:

    invoke GetModuleHandle, NULL
    mov hInstance, eax

    mov ofn.lStructSize, SIZEOF ofn
    mov ofn.lpstrFilter, offset Filter
    mov ofn.lpstrFile, offset FileName
    mov ofn.nMaxFile, MAX_PATH
    mov ofn.lpstrTitle, offset ofnTtr
    mov ofn.Flags, OFN_FILEMUSTEXIST or OFN_PATHMUSTEXIST or OFN_LONGNAMES or OFN_EXPLORER or OFN_HIDEREADONLY
    invoke GetOpenFileName, ADDR ofn                            ; Selection du fichier cible

    lea eax, FileName
    mov PESTarget.pFileName, eax
    invoke LoadTarget, ADDR PESTarget                           ; Chargement de la cible
        .IF (eax == FALSE)
            invoke ExitProcess, NULL
        .ENDIF

    invoke CheckMZ, PESTarget.pMZHead                           ; Verif. du flag 'MZ'
       .IF !(eax)
            invoke MessageBox, NULL, ADDR PasMZ, ADDR ofnTtr, MB_ICONINFORMATION
            invoke ExitProcess, NULL
       .ENDIF

    invoke GotoPEHead, PESTarget.pMZHead                        ; Recup. l'adresse du PE Header
    mov pPEHead, eax

    invoke CheckPE, pPEHead                                     ; Verif. du flag 'PE'
       .IF !(eax)
            invoke MessageBox, NULL, ADDR PasPE, ADDR ofnTtr, MB_ICONINFORMATION
            invoke ExitProcess, NULL
       .ENDIF

    invoke GetImgBase, pPEHead                                  ; Recup. de l'Image Base (pour soustraire à l'OEP)
    mov ImgBase, eax

    invoke GetNbSec, pPEHead                                    ; Recup. du nombre de sections
    dec eax                                                     ; Fix NbSec !
    mov NbSec, eax

    invoke GotoSecTab, pPEHead                                  ; Recup. l'adresse de la table de sections
    mov pSecTab, eax

    invoke GetRawOff, pSecTab, NbSec                            ; Recup. de la RawOffset du loader
    add eax, PESTarget.pMZHead                                  ; Pour avoir acces aux données mappées
    mov eax, [eax+7]                                            ; Loader+07 = OEP
    sub eax, ImgBase                                            ; RVA = VA - IMAGEBASE

    invoke SetNEP, pPEHead, eax                                 ; OEP fixé !

    invoke GetRawSize, pSecTab, 0                               ; Recup. de la RawSize de la section kryptée
    inc eax                                                     ; Fix !
    mov ebx, eax
    invoke GetRawOff, pSecTab, 0                                ; Recup. de la RawOffset de la section kryptée
    add eax, PESTarget.pMZHead                                  ; Pour avoir acces aux données mappées

@@: mov dl, [eax+ebx]                                           ; Routine de décryption
    sub dl, 7                                                   ; Rippée directement du loader !
    xor dl, 4
    mov [eax+ebx], dl
    dec ebx
    or ebx, ebx
    jne @B

    inc NbSec                                                   ; De-Fix NbSec :) !
    invoke DeleteSection, ADDR PESTarget, pSecTab, NbSec        ; Supprime le loader

    invoke UnloadTarget, ADDR PESTarget                         ; Déchargement de la cible

    invoke MessageBox, NULL, ADDR CBon, ADDR ofnTtr, MB_ICONINFORMATION
    invoke ExitProcess, NULL

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

end start

; -------------------------------------------------------------------------
; from the Dr. rED mEAT's MASM32 template v 4.5
; -------------------------------------------------------------------------
