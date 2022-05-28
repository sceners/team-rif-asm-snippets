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
d:\masm32\bin\ml /c /nologo /coff /Cp Process1.asm
d:\masm32\bin\link /SUBSYSTEM:WINDOWS /NOLOGO /SECTION:.text,ERW /LIBPATH:d:\masm32\lib *.obj
del *.obj
pause
cls
