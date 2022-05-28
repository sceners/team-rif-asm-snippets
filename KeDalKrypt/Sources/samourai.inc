; -------------------------------------------------------------------------
; PE Samouraï - Coded by the Dr. rED mEAT / [RIF]
; -------------------------------------------------------------------------

AddSection          PROTO :DWORD,:DWORD,:DWORD
BackUp              PROTO :DWORD
CheckMZ             PROTO :DWORD
CheckPE             PROTO :DWORD
DeleteSection       PROTO :DWORD,:DWORD,:DWORD
FixSizeImg          PROTO :DWORD,:DWORD
GetBaseCode         PROTO :DWORD
GetBaseData         PROTO :DWORD
GetCharac           PROTO :DWORD,:DWORD
GetDirectorySize    PROTO :DWORD,:DWORD
GetDllCharac        PROTO :DWORD
GetFileAln          PROTO :DWORD
GetImgBase          PROTO :DWORD
GetMachine          PROTO :DWORD
GetMagic            PROTO :DWORD
GetNbSec            PROTO :DWORD
GetOEP              PROTO :DWORD
GetPECharac         PROTO :DWORD
GetRawOff           PROTO :DWORD,:DWORD
GetRawSize          PROTO :DWORD,:DWORD
GetSecAln           PROTO :DWORD
GetSecName          PROTO :DWORD,:DWORD
GetSizeImg          PROTO :DWORD
GetSubsystem        PROTO :DWORD
GetVOff             PROTO :DWORD,:DWORD
GetVSize            PROTO :DWORD,:DWORD
GotoDirectory       PROTO :DWORD,:DWORD
GotoPEHead          PROTO :DWORD
GotoSecTab          PROTO :DWORD
LoadTarget          PROTO :DWORD
OffsetToRVA         PROTO :DWORD,:DWORD,:DWORD
PEAlign             PROTO :DWORD,:DWORD
RVAToOffset         PROTO :DWORD,:DWORD,:DWORD
RVAToSec            PROTO :DWORD,:DWORD,:DWORD
SetBaseCode         PROTO :DWORD,:DWORD
SetBaseData         PROTO :DWORD,:DWORD
SetCharac           PROTO :DWORD,:DWORD,:DWORD
SetDirectoryRVA     PROTO :DWORD,:DWORD,:DWORD
SetDirectorySize    PROTO :DWORD,:DWORD,:DWORD
SetDllCharac        PROTO :DWORD,:DWORD
SetFileAln          PROTO :DWORD,:DWORD
SetImgBase          PROTO :DWORD,:DWORD
SetMachine          PROTO :DWORD,:DWORD
SetMagic            PROTO :DWORD,:DWORD
SetNEP              PROTO :DWORD,:DWORD
SetNbSec            PROTO :DWORD,:DWORD
SetPECharac         PROTO :DWORD,:DWORD
SetRawOff           PROTO :DWORD,:DWORD,:DWORD
SetRawSize          PROTO :DWORD,:DWORD,:DWORD
SetSecAln           PROTO :DWORD,:DWORD
SetSecName          PROTO :DWORD,:DWORD,:DWORD
SetSizeImg          PROTO :DWORD,:DWORD
SetSubsystem        PROTO :DWORD,:DWORD
SetVOff             PROTO :DWORD,:DWORD,:DWORD
SetVSize            PROTO :DWORD,:DWORD,:DWORD
UnloadTarget        PROTO :DWORD
GetExportInfo       PROTO :DWORD,:DWORD,:DWORD
SetExportInfo       PROTO :DWORD,:DWORD,:DWORD
GetExport           PROTO :DWORD,:DWORD,:DWORD,:DWORD
SetExport           PROTO :DWORD,:DWORD,:DWORD,:DWORD
GetNbExport         PROTO :DWORD,:DWORD

; -------------------------------------------------------------------------

PES_TARGET STRUCT

    pFileName   dd ?
    FileSize    dd ?
    hFile       dd ?
    hMapping    dd ?
    pMZHead     dd ?

PES_TARGET ENDS

; -------------------------------------------------------------------------

PES_NEWSECTION STRUCT

    NbSec       dd ?    ; Infos required to build a new section
    SecAln      dd ?
    FileAln     dd ?
    SizeImg     dd ?

    SecName     dd ?    ; Infos wished by the user about the section itself
    RawSize     dd ?
    VSize       dd ?
    Charac      dd ?

PES_NEWSECTION ENDS

; -------------------------------------------------------------------------

PES_EXPORTINFO STRUCT

    Charac      dd ?
    TimeDStamp  dd ?
    MajorVer    dd ?
    MinorVer    dd ?
    nName       dd ?    ; Contains the RVA
    nBase       dd ?
    NbOfFunc    dd ?
    NbOfName    dd ?
    AddrOfFunc  dd ?
    AddrOfName  dd ?
    AddrOfNmOrd dd ?

    String      dd ?    ; Contains the direct pointer to an copy

PES_EXPORTINFO ENDS

; -------------------------------------------------------------------------

PES_EXPORT STRUCT

    Address     dd ?
    Name1       dd ?    ; Contains the RVA
    Hint        dd ?

    String      dd ?    ; Contains the direct pointer to an copy

PES_EXPORT ENDS

; -------------------------------------------------------------------------

PES_IMPORTINFO STRUCT

    OFirstTnk   dd ?
    TimeDStamp  dd ?
    Forward     dd ?
    Name1       dd ?    ; Contains the RVA
    FirstTnk    dd ?

    String      dd ?    ; Contains the direct pointer to an copy

PES_IMPORTINFO ENDS

; -------------------------------------------------------------------------

PES_IMPORT STRUCT

    Hint        dd ?
    Name1       dd ?    ; Contains the RVA

    String      dd ?    ; Contains the direct pointer to an copy

PES_IMPORT ENDS

; -------------------------------------------------------------------------

PES_DIRECTORY_EXPORT        = 0
PES_DIRECTORY_IMPORT        = 1
PES_DIRECTORY_RESOURCE      = 2
PES_DIRECTORY_EXCEPTION     = 3
PES_DIRECTORY_SECURITY      = 4
PES_DIRECTORY_BASERELOC     = 5
PES_DIRECTORY_DEBUG         = 6
PES_DIRECTORY_COPYRIGHT     = 7
PES_DIRECTORY_GLOBALPTR     = 8
PES_DIRECTORY_TLS           = 9
PES_DIRECTORY_LOADCONFIG    = 10
PES_DIRECTORY_BOUNDIMPORT   = 11
PES_DIRECTORY_IAT           = 12

; -------------------------------------------------------------------------

