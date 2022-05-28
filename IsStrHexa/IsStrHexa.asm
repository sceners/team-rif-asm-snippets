;-----------------------------------------------------------------
;
; Dr. rED mEAT proudly presents :
; IsStrHexa (a library for MASM32)
;
; ::|( A NEW KIND OF MEDECINE )|::
;
;-----------------------------------------------------------------
; BOOL IsStrHexa(
;   LPCTSTR String     	// String to test  
;  );
;
; invoke IsStrHexa, ADDR MyString
;
; If the string contains non-hexa chars, eax is zero.
; If the string only contains hexa chars, eax is non-zero. 
;-----------------------------------------------------------------

.386
.model flat, stdcall
option casemap :none

.code

;###############################################################\
;)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
;###############################################################/

IsStrHexa PROC String:DWORD

    mov eax, String

@@: mov dl, byte ptr [eax]
    or dl, dl
    je @F
        .IF (dl < 30h || dl > 39h) && (dl < 41h || dl > 46h) && (dl < 61h || dl > 66h)
            xor eax, eax
            jmp @F 
        .ENDIF
        inc eax
        jmp @B

@@: ret

IsStrHexa ENDP

;###############################################################\
;)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
;###############################################################/

end
