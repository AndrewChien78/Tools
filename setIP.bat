@ECHO off
cls
rem This batch program sets the Static IP configuration for SAINS Stutong Office
rem Date: 3 Jan 2019
rem Taken from this link https://superuser.com/questions/361038/how-to-change-ip-address-using-script-on-windows
rem For more details refer to the link above
rem Note: This batch file assumes that the network adaptior name is "local area connection"

:start
ECHO.
ECHO ***Note: Please run this batch file in Adminstrator mode***
ECHO.
ECHO 0. Show current "Ethernet" configuration
ECHO 1. Change Connection1 Static IP (SAINS Stutong - Andrew Chien)
ECHO 2. Change Connection2 Static IP 
ECHO 3. Change Connection3 Static IP 
ECHO 4. Obtain an IP address automatically
ECHO 5. Exit
ECHO.
set choice=
set /p choice=Type the number to print text. Choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='0' goto con0
if '%choice%'=='1' goto con1
if '%choice%'=='2' goto con2
if '%choice%'=='3' goto con3
if '%choice%'=='4' goto autosearch
if '%choice%'=='5' goto end
ECHO "%choice%" is not valid, try again
ECHO.
goto start

:con0
ECHO.
ECHO Showing current "Ethernet" configuration
netsh interface ip show config "Ethernet"
goto start

:con1
ECHO Connecting Connection 1
ECHO OFF
netsh interface ip set address name="Ethernet" static address=10.17.13.72 255.255.255.0 10.17.13.1 
netsh interface ip set dnsservers "Ethernet" static address=172.18.64.65 validate=no
netsh interface ip add dnsservers name="Ethernet" addr=172.18.24.115 index=2 validate=no
ECHO.
ECHO Showing current "Ethernet" configuration
ECHO.
ECHO ***Don't worry, IP address will be set eventhough it doesn't show up on the first show config command. Just re-run the Show current config command again***
netsh interface ip show config "Ethernet"
goto end

:con2
ECHO Connecting Connection 2
netsh interface ip set address "Local Area Connection2" static 192.168.0.10 255.255.255.0 192.168.0.1 
goto end

:con3
ECHO Connecting Connection 3
netsh interface ip set address "Local Area Connection3" static 192.168.0.10 255.255.255.0 192.168.0.1 
goto end

:autosearch
ECHO obtaining auto IP
netsh interface ip set address "Ethernet" dhcp
netsh interface ip set dns "Ethernet" dhcp
ECHO.
ECHO Showing current "Ethernet" configuration
netsh interface ip show config "Ethernet"
goto end

:bye
ECHO BYE
goto end

:end