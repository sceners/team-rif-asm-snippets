
@echo off
REM +-------------------------+
REM Created by the Dr. rED mEAT
REM +-------------------------+
REM crafted by $KORBUT
echo.
echo.

c:\masm32\bin\ml /c /coff /Cp redcons.asm
c:\masm32\bin\link /SUBSYSTEM:WINDOWS /DLL /DEF:redcons.def *.obj

del *.obj

echo.
echo.
pause
cls
