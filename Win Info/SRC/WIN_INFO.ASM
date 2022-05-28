
.486                                                            ; Jeu d'insruction du 486
.model flat, stdcall
option casemap : none

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

include \masm32\include\windows.inc                             ; Les principales includes

include \masm32\include\kernel32.inc
 includelib \masm32\lib\kernel32.lib

include \masm32\include\user32.inc
 includelib \masm32\lib\user32.lib

include \masm32\include\masm32.inc
 includelib \masm32\lib\masm32.lib

include redcons.inc
 includelib redcons.lib

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

MainProc    PROTO

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.data

Win32s      db "Microsoft Win32s %d.%d (Build %d)", 0
Win95       db "Microsoft Windows 95 %d.%d (Build %d)", 0
WinNT       db "Microsoft Windows NT %d.%d (Build %d)", 0

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.data?

szVersion   db 80 dup (?)

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

.code

start:

invoke MainProc
invoke ExitProcess, NULL

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

MainProc Proc
    LOCAL osvi:OSVERSIONINFO

;====================================================================

mov osvi.dwOSVersionInfoSize, SIZEOF osvi

invoke GetVersionEx, ADDR osvi

.IF (osvi.dwPlatformId == VER_PLATFORM_WIN32s)

    mov ecx, osvi.dwBuildNumber
    and ecx, 0FFFFh
    
    invoke wsprintf, ADDR szVersion, ADDR Win32s,\
                    osvi.dwMajorVersion,
                    osvi.dwMinorVersion,
                    ecx

.ELSEIF (osvi.dwPlatformId == VER_PLATFORM_WIN32_WINDOWS)

    mov ecx, osvi.dwBuildNumber
    and ecx, 0FFFFh
    
    invoke wsprintf, ADDR szVersion, ADDR Win95,\
                    osvi.dwMajorVersion,
                    osvi.dwMinorVersion,
                    ecx

.ELSEIF (osvi.dwPlatformId == VER_PLATFORM_WIN32_NT)

    mov ecx, osvi.dwBuildNumber
    and ecx, 0FFFFh
    
    invoke wsprintf, ADDR szVersion, ADDR WinNT,\
                    osvi.dwMajorVersion,
                    osvi.dwMinorVersion,
                    ecx

.ENDIF

invoke RetLine

invoke StdOut, ADDR szVersion

;====================================================================

invoke ExitConsole

MainProc Endp

;-------------------------------------------------------------------
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-------------------------------------------------------------------

end start