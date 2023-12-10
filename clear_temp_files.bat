@echo off
DEL /F /S /Q %Temp%\*.*
DEL /F /S /Q %Tmp%\*.*
rd %temp% /s /q
del /q/f/s %TEMP%*
timeout /t 30