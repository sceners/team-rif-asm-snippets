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
d:\masm32\bin\ml /c /nologo /coff /Cp Process1.asm
d:\masm32\bin\link /SUBSYSTEM:WINDOWS /NOLOGO /SECTION:.text,ERW /LIBPATH:d:\masm32\lib *.obj
del *.obj
pause
cls
