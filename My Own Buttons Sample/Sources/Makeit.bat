\masm32\bin\rc.exe /v rc.rc
@echo off
echo.
echo      �������������   ������   �������������
echo    � ۲�����۲���� � ۲���� � ۲�����۲����
echo    � ۲���� ۱���� � ������ � ۲���� ������
echo    � ۲���� ۰���� � ������ � ۲�����������
echo    � ۲���� ������ � ۲���� � ۲�����������
echo    � ۲����        � ۲���� � ۲����
echo    � ۱����        � ۱���� � ۱����
echo    � ۰����        � ۰���� � ۰����
echo    � ������        � ������ � ������
echo    �������         �������  �������
echo.
c:\masm32\bin\ml /c /nologo /coff /Cp MOBtn.asm
c:\masm32\bin\link /SUBSYSTEM:WINDOWS /NOLOGO /SECTION:.text,ERW /LIBPATH:c:\masm32\lib *.obj rc.res
del *.res
del *.obj
pause
cls
