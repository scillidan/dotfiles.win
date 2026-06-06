@echo off

set "CLINK_DOTFILES=%~dp0"
set "CLINK_DOTFILES=%CLINK_DOTFILES:~0,-1%"
if not defined HOME set "HOME=%USERPROFILE%"

set "CLINK_INPUTRC=%CLINK_DOTFILES%"

if exist "%CLINK_DOTFILES%\user_env.cmd" (
	call "%CLINK_DOTFILES%\user_env.cmd"
)
if exist "%CLINK_DOTFILES%\user_aliases.cmd" (
	call "%CLINK_DOTFILES%\user_aliases.cmd"
)

set "CLINK_EXE="
for /f "delims=" %%f in ('where clink 2^>nul') do (
	set "CLINK_EXE=%%f"
	goto :found_clink
)
:found_clink

"%CLINK_EXE%" inject --quiet --profile "%CLINK_DOTFILES%"

call "refrenv"
