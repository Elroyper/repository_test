@echo off

rem Ѱ������·��
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do (
	set desk=%%j
)

rem ����Դ·��
set source=%CD%
rem ����Ŀ���ļ�·��
set target=%source%\Bleach vs. Naruto.exe
rem �����ݷ�ʽ·��
set lnkPath=%desk%\����vs��Ӱ ������.lnk

rem ������ʱvbs�ű�·��
set script="%TEMP%\bvn-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

rem д�뵽vbs�ű�
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %script%
echo sLinkFile = "%lnkPath%" >> %script%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %script%
echo oLink.TargetPath = "%target%" >> %script%
echo oLink.WorkingDirectory = "%source%" >> %script%
echo oLink.Save >> %script%

rem ִ��vbs�ű�
cscript /nologo %script%
rem ɾ��vbs�ű�
del %script%
