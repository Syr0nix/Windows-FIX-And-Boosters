@echo off
color 0A
title WinFix script

echo This script was made by 
echo This script needs to be run as an administrator. It will attempt to fix common Windows issues And Speed up GamePlay.
echo Are you sure you want to proceed? (Y/N)
set /p userinp=Choice: 
set userinp=%userinp:~0,1%
if /I "%userinp%" EQU "Y" goto :start
echo Exiting script...
exit /b

:start
setlocal enabledelayedexpansion
for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    echo Checking drive %%i: - procedure 1 of 11
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

echo Cleaning Temp and Tmp folders - procedure 2 of 9
DEL /F /S /Q %Temp%\*.*
DEL /F /S /Q %Tmp%\*.*
rd %temp% /s /q
del /q/f/s %TEMP%*

echo Windows component files check - procedure 3 of 9
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
Dism.exe /online /Cleanup-Image /SPSuperseded

echo Checking the integrity of the Windows image - procedure 4 of 9
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth

echo Running System file check - procedure 5 of 9
sfc /scannow
echo If SFC found some errors and could not repair, re-run the script after a reboot.

echo Modifying network settings - procedure 6 of 9

echo This script is modifying some network settings.
netsh interface tcp set global autotuning=high
netsh int ipv4 set subinterface "Ethernet" mtu=1500 store=persistent
netsh int ipv6 set subinterface "Ethernet" mtu=1500 store=persistent
netsh int ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh int ipv6 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh int ipv4 set subinterface "Bluetooth" mtu=1500 store=persistent
netsh int ipv6 set subinterface "Bluetooth" mtu=1500 store=persistent
netsh interface 6to4 set state disabled
netsh int isatap set state disable
netsh int tcp set global timestamps=disabled
netsh int tcp set heuristics disabled
netsh int tcp set global chimney=disabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global rsc=disabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set security mpp=disabled
netsh int tcp set security profiles=disabled
netsh int ip set global icmpredirects=disabled
netsh int tcp set security mpp=disabled profiles=disabled
netsh int ip set global multicastforwarding=disabled
netsh int tcp set supplemental internet congestionprovider=ctcp
netsh interface teredo set state disabled
netsh winsock reset
netsh int isatap set state disable
netsh int ip set global taskoffload=disabled
netsh int ip set global neighborcachelimit=4096
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
PowerShell Disable-NetAdapterLso -Name "*"
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterPowerManagement -Name $adapter.Name -ErrorAction SilentlyContinue}"
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterLso -Name $adapter.Name -ErrorAction SilentlyContinue}"

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "8760" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "8760" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_SZ /d "ffffffff" /f
echo.
echo procedure 7 of 9
echo "Releasing the current IP address..." 
ipconfig /release
timeout 5
echo "Acquiring a new IP address..."
ipconfig /renew
timeout 5
echo "Flushing the DNS resolver cache..."
ipconfig /flushdns
timeout 5


echo Cleaning Prefetch files - procedure 9 of 9
del /q/f/s %WINDIR%\Prefetch\*.*

echo Press any key to close this program...
pause >null
