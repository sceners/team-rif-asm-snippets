
; -------------------------------------------------------------------------
;
;     skorbut proudly presents :
;       AntiPatching Example
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

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

.code

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

start:
    invoke GetModuleHandle, NULL                                            ; Routine principale
    mov hInstance, eax

    invoke GetCurrentDirectory, 512, ADDR Directory
    invoke lstrcat, ADDR Directory, ADDR FileFilt
    invoke FindFirstFile, ADDR Directory, ADDR _FILE
    mov hSearch, eax

_Open:
    invoke CreateFile, ADDR [_FILE.cFileName], GENERIC_READ or GENERIC_WRITE,\
                        FILE_SHARE_READ or FILE_SHARE_WRITE, NULL,\
                         OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL

    cmp eax, -1
    jnz _Next

    invoke CopyFile, ADDR [_FILE.cFileName], ADDR Temp, FALSE

    invoke CreateFile, ADDR Temp, GENERIC_READ or GENERIC_WRITE,\
                        FILE_SHARE_READ or FILE_SHARE_WRITE, NULL,\
                         OPEN_EXISTING, FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_TEMPORARY,\
                          NULL
    mov hFile, eax

    invoke Sleep, 1000

    invoke CreateFileMapping, hFile, NULL, PAGE_READWRITE, 0, 0, 0       
    mov hMapping, eax

    invoke MapViewOfFile, hMapping, FILE_MAP_READ or FILE_MAP_WRITE, 0, 0, 0
    mov pMapping, eax

    mov esi, pMapping
    cmp word ptr [esi+7E7h], '**'
    jz @F

_Next:
    invoke FindNextFile, hSearch, ADDR _FILE
    or eax, eax
    jz _End
    jmp _Open

@@: 
    invoke FileTimeToLocalFileTime, ADDR _FILE.ftLastWriteTime, ADDR _FILETIME
    invoke FileTimeToSystemTime, ADDR _FILETIME, ADDR _SYSTEMTIME

    invoke ClearBuffer, ADDR Buffer
        
    mov byte ptr [Buffer], '0'
        
    mov ax, word ptr [_SYSTEMTIME.wDay]
    invoke wsprintf, ADDR Buffer+1, ADDR deci, ax 
              
    mov byte ptr [Buffer+2], '/'
    mov byte ptr [Buffer+3], '0'  
             
    mov ax, word ptr [_SYSTEMTIME.wMonth]
    invoke wsprintf, ADDR Buffer+4, ADDR deci, ax
        
    mov byte ptr [Buffer+5], '/'
        
    mov ax, word ptr [_SYSTEMTIME.wYear]
    invoke wsprintf, ADDR Buffer+6, ADDR deci, ax

    invoke lstrcmp, ADDR Constante, ADDR Buffer
    or eax, eax
    jnz @F
                             
    invoke MessageBox, NULL, ADDR RudeBoy, ADDR Ttl, MB_ICONINFORMATION
    jmp _End

@@:
    invoke MessageBox, NULL, ADDR Fuck, ADDR Ttl, MB_ICONERROR

_End:
    invoke UnmapViewOfFile, pMapping
    invoke CloseHandle, hMapping
    invoke CloseHandle, hFile
    invoke Sleep, 1000
    invoke DeleteFile, ADDR Temp
    invoke FindClose, hSearch
    invoke ExitProcess, 0
    ret    

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

ClearBuffer PROC Buff:DWORD

    mov eax, Buff

@@: 
    or byte ptr [eax], 0
    je @F
    mov byte ptr [eax], 0
    inc eax
    jmp @B

@@: 
    ret

ClearBuffer ENDP

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

end start

; -------------------------------------------------------------------------
; from the Dr. rED mEAT's MASM32 template v 4.7
; -------------------------------------------------------------------------
