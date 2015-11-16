@echo off
setlocal
call %~dp0gc-settings.cmd

for %%i in ("%cd%") do set TASK_NAME=%%~ni
set TASK_NAME=%TASK_NAME%-git-gc

schtasks /delete ^
/tn %TASK_NAME% ^
/f

schtasks /create ^
/sc daily ^
/tn %TASK_NAME% ^
/tr %GIT_GC_BAT% ^
/st %TASK_TIME% ^
/ru %USER% ^
/rp %PWS% ^
/v1

endlocal

pause
