@echo off

rem 寻找桌面路径
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do (
	set desk=%%j
)

rem 定义源路径
set source=%CD%
rem 定义目标文件路径
set target=%source%\Bleach vs. Naruto.exe
rem 定义快捷方式路径
set lnkPath=%desk%\死神vs火影 竞技改.lnk

rem 定义临时vbs脚本路径
set script="%TEMP%\bvn-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

rem 写入到vbs脚本
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %script%
echo sLinkFile = "%lnkPath%" >> %script%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %script%
echo oLink.TargetPath = "%target%" >> %script%
echo oLink.WorkingDirectory = "%source%" >> %script%
echo oLink.Save >> %script%

rem 执行vbs脚本
cscript /nologo %script%
rem 删除vbs脚本
del %script%
