\masm32\bin\rc.exe /v rc.rc
@echo off
echo.
echo	                                �
echo	      �
echo	 �   �               �              �  �
echo	��ܰ��������۰    �����    ���������۰��� redmeat!
echo	����۲��������    �����    ����۲��������
echo	�����   ������             �����   ����۲
echo	�����   ����۲    �����    ����۰   ���۰
echo	����۰ ����۲     �����    �����۰  �����
echo	������ �����      �����      �����
echo	 ����� ����۰     �����     �����۰����۰
echo	 ����۰�����۰    �����    ��������۲����
echo	 ������ �����۰   �����   ����۲�����
echo	  �����  �����۰  �����  ����۲�
echo	  ����۰  �����۰ ����� ����۲�   RESISTANCE IS FUTILE
echo	  ������   ������ ����� �����
echo	   �����    ����� ����� ����۱
echo	   �����   ����۲ ����� ����۰
echo	          ����۲� ����� �����۰
echo	          ����۰  �����  �����۰
echo.
\masm32\bin\ml /c /nologo /coff /Cp AntiPatching.asm
\masm32\bin\link /SUBSYSTEM:WINDOWS /NOLOGO /SECTION:.text,ERW /LIBPATH:\masm32\lib *.obj rc.res
del *.obj
del *.res
pause
cls
