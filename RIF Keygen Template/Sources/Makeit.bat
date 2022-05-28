\masm32\bin\rc.exe /v rc.rc
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
\masm32\bin\ml /c /nologo /coff /Cp Keygen.asm
\masm32\bin\link /SUBSYSTEM:WINDOWS /NOLOGO /SECTION:.text,ERW /LIBPATH:c:\masm32\lib *.obj rc.res
del *.res
del *.obj
pause
cls
