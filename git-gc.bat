echo off
setlocal
call %~dp0gc-settings.cmd

FOR /D %%D in (%CD%) DO (
  IF EXIST %%D\.git (
    ECHO == %%D
    echo.
    pushd %%D
    %GIT% git gc
    popd
  )
  ECHO.
)
PAUSE
