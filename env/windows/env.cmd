@echo off
REM set build os
SET BUILD_OS=windows

REM set java home
if defined JAVA_HOME (echo Using predefined JAVA_HOME %JAVA_HOME%) else (set JAVA_HOME=%DEV_HOME%\tools\jdk1.6)

REM set aspectj home
if defined ASPECTJ_HOME (echo Using predefined ASPECTJ_HOME %ASPECTJ_HOME%) else (set ASPECTJ_HOME=%DEV_HOME%\tools\aspectj)

REM set ant home, args and opts build settings
if defined ANT_HOME (echo Using predefined ANT_HOME %ANT_HOME%) else (set ANT_HOME=%DEV_HOME%\tools\apache-ant)
SET ANT_OPTS=-Xmx1024m -XX:MaxPermSize=256m
REM SET ANT_ARGS=-lib %GLOBAL_BUILD_HOME%\tools\jdepend\lib

REM set cvs path for windows
REM SET CVS_PATH=%DEV_HOME%\tools\cvs
