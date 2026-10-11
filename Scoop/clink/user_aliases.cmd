@echo off
setlocal enabledelayedexpansion

for %%f in (
	"%USERHOME%\Share\dotfiles\.config\alias.yaml"
	"%USERHOME%\Share\dotfiles\.config\alias-scripts.yaml"
	"%USERHOME%\Share\dotfiles.win\.config\alias.yaml"
	"%USERHOME%\Share\dotfiles.win\.config\alias-scripts.yaml"
) do if exist "%%f" (
	for /f "tokens=1,2 delims=@" %%a in ('yq -o props "... comments = """"" --properties-separator="@" "%%f"') do (
		if "%%a" NEQ "" (
			set "m=%%b"
			set "m=!m:$USERHOME=%USERHOME%!"
			doskey %%a=!m! $*
		)
	)
)