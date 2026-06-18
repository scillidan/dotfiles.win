@echo off
REM

REM Add the following into System's PATH and ensure them on the top
rem C:\Users\User\Scoop\apps\git\current\bin;
rem C:\Users\User\Scoop\apps\git\current\usr\bin;
rem C:\Users\User\Scoop\shims

REM Add the following into user's PATH
rem EDITOR=subl
rem BROWSER=brave/librewolf
rem PIPX_HOME="%USERHOME%/.pipx"
rem PIPX_BIN_DIR="%USERHOME%/.local/bin"

REM Sys
set "LC_ALL=en_US.utf8"
set "LANG=en_US.utf8"
set "CHANGE_LOG_NAME=User"
set "SYS_ARCH=64"

REM CUDA
set "NVCC_FLAGS=-allow-unsupported-compiler"
rem set "LD_LIBRARY_PATH=TensorRT\8.5.1.7\lib"
set "_use_new_zipfile_serialization=False"

REM Lib
set "PYENV=%USERHOME%\.pyenv\pyenv-win"
set "PYENV_ROOT=%USERHOME%\.pyenv\pyenv-win"
set "PYENV_HOME=%USERHOME%\.pyenv\pyenv-win"
set "RUSTUP_DIST_SERVER=https://mirror.sjtu.edu.cn/rust-static"
set "RUSTUP_UPDATE_ROOT=https://mirror.sjtu.edu.cn/rust-static/rustup"
set "RBENV_USE_MIRROR=CN"
set "RBENV_ROOT=%USERHOME%\Local\Lib\rbenv"
REM Lib for Opt
set "NODE_OPTIONS=--max_old_space_size=2048"
rem set "NODE_ENV=development node postcss"
rem set "PUPPETEER_SKIP_DOWNLOAD=true"
rem set "PUPPETEER_PRODUCT=firefox npm install"
set "PUPPETEER_EXECUTABLE_PATH=%LocalAppData%\ms-playwright\chromium-1117\chrome-win\chrome.exe"
set "DENO_INSTALL=%LocalAppData%\deno"
set "PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python"
set "RUST_BACKTRACE=full"
set "RUSTFLAGS=--cfg tracing_unstable"
set "CARGO_HTTP_CHECK_REVOKE=false"
set "GOSUMDB=sum.golang.org"
REM set "ANDROID_NDK_HOME=%USERHOME%\Local\Lib\android-ndk"

REM bat
set "BAT_STYLE=numbers,changes"

REM forgit
set "FORGIT_CHECKOUT_BRANCH_BRANCH_GIT_OPTS=--sort=-committerdate"

REM moor
set "MOOR=--no-linenumbers"

REM clink-gizmos
rem set "FZF_RG_EDITOR=nvim"
set "FZF_RG_FZF_OPTIONS=--multi"
set "FZF_RG_RG_OPTIONS=--hidden --follow"

REM Zellij
set "ZELLIJ_CONFIG_DIR=%USERHOME%/Share/dotfiles/.config/zellij/config"
set "ZELLIJ_CONFIG_FILE=%USERHOME%/Share/dotfiles/.config/zellij/config/config.kdl"

REM scripts
set "CDS_TERMINAL=wezterm"

set CLINK_PATH=^
%    =%%USERHOME%\Local\Source\clink\clink-gizmos;^
%    =%%USERHOME%\Local\Source\clink\clink-zoxide;^
%    =%%CLINK_PATH%

set PATH=^
%    =%%USERHOME%\Local\Lib\keypirinha-sdk\cmd;^
%    =%%PATH%
