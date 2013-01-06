@echo off
REM   Opens a shell under windows and sets the environment for the build 

REM   set global build home path
if defined DEV_HOME (echo Using predefined DEV_HOME %DEV_HOME%) else (set DEV_HOME=d:\dev)
set GLOBAL_BUILD_HOME=%~dp0
if %GLOBAL_BUILD_HOME:~-1%==\ set GLOBAL_BUILD_HOME=%GLOBAL_BUILD_HOME:~0,-1% 
set USER_BUILD_HOME=%HOME%\GlobalBuild
	
if not exist "%GLOBAL_BUILD_HOME%\env\windows\env.cmd" goto noenv
  echo INFO: Loading environment from '%GLOBAL_BUILD_HOME%\env\windows\env.cmd'
  call "%GLOBAL_BUILD_HOME%\env\windows\env.cmd" %1
  goto afterenv
:noenv
  echo WARNING: '%GLOBAL_BUILD_HOME%\env\windows\env.cmd' not found!
  echo WARNING: Not a valid build environment!
:afterenv

if not exist "%USER_BUILD_HOME%\build_env.cmd" goto nouserenv
  echo INFO: Loading user specific environment from '%USER_BUILD_HOME%\build_env.cmd'
  call "%USER_BUILD_HOME%\build_env.cmd"
  goto afteruserenv
:nouserenv
  echo INFO: no user specific environment found
:afteruserenv

set PATH=%ANT_HOME%\bin;%ASPECTJ_HOME%\bin;%JAVA_HOME%\bin;%CVS_PATH%;%PATH%

if "%1"=="newshell" ( start cmd.exe )
