@echo off
rem cmd.exe AutoRun guard for the Zellij migration (P3).
rem
rem Keeps the previous conda hook for every cmd.exe, then sets up Clink only in
rem interactive Zellij panes. Zellij sets the ZELLIJ env var for every pane, so
rem plain cmd.exe and scripts outside Zellij stay untouched.
rem
rem Deliberately does not call init.cmd: user_env.cmd rewrites PATH and breaks
rem yq/refrenv in this nested context. Only the pieces the pane needs are run.
rem
rem Installed as HKCU\Software\Microsoft\Command Processor\AutoRun.
rem Rollback: see Share/dotfiles/.config/zellij/README.md (P3 revision).

if exist "C:\Users\User\Scoop\apps\miniforge3\current\condabin\conda_hook.bat" call "C:\Users\User\Scoop\apps\miniforge3\current\condabin\conda_hook.bat"

if not defined ZELLIJ exit /b 0
if defined CLINK_NOAUTORUN exit /b 0

rem Skip non-interactive cmd /c so scripts inside a pane are not injected.
echo "%CMDCMDLINE%" | findstr /i /c:"/c" >nul && exit /b 0

if not defined CLINK_DOTFILES set "CLINK_DOTFILES=%USERHOME%\Share\dotfiles.win\Scoop\clink"
set "CLINK_INPUTRC=%CLINK_DOTFILES%"
if exist "%CLINK_DOTFILES%\user_aliases.cmd" call "%CLINK_DOTFILES%\user_aliases.cmd"

set "CLINK_EXE="
for /f "delims=" %%f in ('where clink 2^>nul') do (
    set "CLINK_EXE=%%f"
    goto :found_clink
)
:found_clink
if defined CLINK_EXE "%CLINK_EXE%" inject --quiet --profile "%CLINK_DOTFILES%"
exit /b 0
