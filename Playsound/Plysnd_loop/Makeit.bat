
@echo off
REM +-------------------------+
REM Created by the Dr. rED mEAT
REM +-------------------------+
REM crafted by $KORBUT
echo.
echo.
c:\masm32\bin\rc.exe /v rc.rc
c:\masm32\bin\ml /c /coff /Cp *.asm
c:\masm32\bin\link /SUBSYSTEM:WINDOWS /LIBPATH:c:\masm32\lib *.obj rc.res
del *.obj
del *.res
echo.
echo.
pause
cls
