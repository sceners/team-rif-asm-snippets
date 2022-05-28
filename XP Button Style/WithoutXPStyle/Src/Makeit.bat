\masm32\bin\rc.exe /v rsrc.rc
@echo off
echo.
echo      ‹‹‹‹‹‹‹‹‹‹‹‹‹   ‹‹‹‹‹‹   ‹‹‹‹‹‹‹‹‹‹‹‹‹
echo    ∞ €≤€€€€ﬂ€≤€€€€ ∞ €≤€€€€ ∞ €≤€€€€ﬂ€≤€€€€
echo    ± €≤€€€€ €±€€€€ ± ﬂﬂﬂﬂﬂﬂ ± €≤€€€€ ﬂﬂﬂﬂﬂﬂ
echo    ≤ €≤€€€€ €∞€€€€ ≤ ‹‹‹‹‹‹ ≤ €≤€€€€‹€€€€€€
echo    € €≤€€€€ ﬂﬂﬂﬂﬂﬂ € €≤€€€€ € €≤€€€€ﬂﬂﬂﬂﬂﬂﬂ
echo    € €≤€€€€        € €≤€€€€ € €≤€€€€
echo    € €±€€€€        € €±€€€€ € €±€€€€
echo    € €∞€€€€        € €∞€€€€ € €∞€€€€
echo    € ﬂﬂﬂﬂﬂﬂ        € ﬂﬂﬂﬂﬂﬂ € ﬂﬂﬂﬂﬂﬂ
echo    ﬂﬂﬂﬂﬂﬂﬂ         ﬂﬂﬂﬂﬂﬂﬂ  ﬂﬂﬂﬂﬂﬂﬂ
echo.
c:\masm32\bin\ml /c /nologo /coff /Cp pbddemo.asm
c:\masm32\bin\link /SUBSYSTEM:WINDOWS /NOLOGO /SECTION:.text,ERW /LIBPATH:c:\masm32\lib *.obj rsrc.res
del *.res
del *.obj
pause
cls
