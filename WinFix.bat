@echo off
color 0A
title WinFix script

echo This script was made by Syr0nix.
echo This script needs to be run as an administrator. It will attempt to fix common Windows issues.
echo Are you sure you want to proceed? (Y/N)
set /p userinp=Choice: 
set userinp=%userinp:~0,1%
if /I "%userinp%" EQU "Y" goto :start
echo Exiting script...
exit /b

:start
setlocal enabledelayedexpansion
for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    echo Checking drive %%i: - procedure 1 of 5
    if exist %%i:\ (
        echo Drive %%i: is available, running CHKDSK now...
        chkdsk %%i: /scan
        echo If it finds some problems, run chkdsk %%i: /f
        echo Cleaning drive %%i:...
        del /F /S /Q %%i:\*Temp\*
        echo Optimizing drive %%i:...
        defrag %%i: /U /V
    ) else (
        echo Drive %%i: is not available or offline, skipping to the next drive.
    )
)
endlocal

echo Cleaning Temp and Tmp folders - procedure 2 of 5
DEL /F /S /Q %Temp%\*.*
DEL /F /S /Q %Tmp%\*.*
rd %temp% /s /q
del /q/f/s %TEMP%*

echo Windows component files check - procedure 3 of 5
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
Dism.exe /online /Cleanup-Image /SPSuperseded

echo Checking the integrity of the Windows image - procedure 4 of 5
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth

echo Running System file check - procedure 5 of 5
sfc /scannow
echo If SFC found some errors and could not repair, re-run the script after a reboot.

echo Press any key to close this program...
pause >null
