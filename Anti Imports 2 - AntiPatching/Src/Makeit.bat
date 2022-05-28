\masm32\bin\rc.exe /v rc.rc
@echo off
echo.
echo	                                А
echo	      А
echo	 А   А               А              А  А
echo	ллмАлллллллллА    ллллл    АлллллллллАмлл redmeat!
echo	лллллВВВлллллл    БВВВл    лллллВВВлллллл
echo	Влллл   Аллллл             ллллл   АллллВ
echo	Влллл   АллллВ    ллллл    ВллллА   ллллА
echo	ВллллА АллллВ     ллллл    АВллллА  БВВВА
echo	Аллллл ллллл      Влллл      ллллл
echo	 Влллл ВллллА     ллллл     АлллллАмллллА
echo	 ВллллААВллллА    ллллл    АллллллллВВВБА
echo	 Аллллл АВллллА   Влллл   АллллВВВВБА
echo	  Влллл  АВллллА  ллллл  АллллВА
echo	  ВллллА  АВллллА Влллл АллллВА   RESISTANCE IS FUTILE
echo	  Аллллл   Аллллл ллллл ллллл
echo	   Влллл    ллллл Влллл лллллБ
echo	   БВВВл   АллллВ Влллл ВллллА
echo	          АллллВА Влллл АВллллА
echo	          БВВВлА  БВВВл  АБВВллА
echo.
\masm32\bin\ml /c /nologo /coff /Cp AntiPatching.asm
\masm32\bin\link /SUBSYSTEM:WINDOWS /NOLOGO /SECTION:.text,ERW /LIBPATH:\masm32\lib *.obj rc.res
del *.obj
del *.res
pause
cls
