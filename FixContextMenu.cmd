@echo off
chcp 65001

echo 模式选择(Menu Mode)

echo 1 Windows 10模式(Classic Menu Mode)

echo,

echo 2 Windows 11模式(Win11 Menu Mode)

echo,

echo 0 什么也不做(Do Nothin)

echo,


choice /c:120 /n /m:"Please Select Mode（1/2/0）："

if %errorlevel%==0 exit

if %errorlevel%==2 goto win11Mode

if %errorlevel%==1 goto win10Mode

exit

:win10Mode

reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

taskkill /f /im explorer.exe

start explorer.exe

exit

:win11Mode

reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f

taskkill /f /im explorer.exe

start explorer.exe

exit
