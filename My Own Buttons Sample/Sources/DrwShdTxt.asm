
include \masm32\macros\macros.asm

.code

; ------------------------------------------------------------------------------
; You should add the following prototype :
; DrwShdTxt PROTO :DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD
; ------------------------------------------------------------------------------

.data?

__Buffer    db 256 dup (?)
__LenBuf    dd ?

.code

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤

DrwShdTxt PROC hDC:DWORD, rect:DWORD, lpBuffer:DWORD, LenBuf:DWORD, Flag:DWORD, TxtCol:DWORD, ShadCol:DWORD, XShd:DWORD, YShd:DWORD

        invoke MultiByteToWideChar, CP_ACP, MB_PRECOMPOSED, lpBuffer, -1, ADDR __Buffer, LenBuf
        dec eax
        mov __LenBuf, eax

        LoadProcAddress "ComCtl32.dll", "DrawShadowText"
        .IF (eax)

            Scall eax, hDC, offset __Buffer, __LenBuf, rect, Flag, TxtCol, ShadCol, XShd, YShd

        .ELSE

            dec LenBuf

            invoke SetBkMode, hDC, TRANSPARENT

            invoke SetTextColor, hDC, ShadCol
            invoke DrawText, hDC, lpBuffer, LenBuf, rect, Flag

            mov eax, rect
            assume eax:ptr RECT
            mov ebx, XShd
            sub [eax].left, ebx
            mov ebx, YShd
            sub [eax].top, ebx
            assume eax:nothing

            mov rect, eax

            invoke SetTextColor, hDC, TxtCol
            invoke DrawText, hDC, lpBuffer, LenBuf, rect, Flag

        .ENDIF

        ret

DrwShdTxt endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
