@echo off
rem Wrapper for Clojure on Windows
rem Copyright (c) 2020 Michael Chen
rem Licensed under MIT

rem Place clojure.bat at the root path of a local Clojure repo.

rem Check whether Java is available.
java -version 1>nul 2>&1 || (
    echo No Java on the system >&2
    exit /B 1
)

set cwd=%CD%
set rootdir=%~dp0

rem Set extra classpath as needed.
if "x%CLASSPATH%" == "x" (
    set extra_classpath=";."
) else (
    set extra_classpath=";%CLASSPATH%;."
)

rem Check whether compiled Clojure is available.
rem If Clojure is not available, compile it from scratch
if not exist %rootdir%clojure.jar (
    echo No compiled Clojure on the system >&2
    echo Compile Clojure from scratch >&2

    call %rootdir%scripts\clean.bat
    call %rootdir%scripts\build.bat
    cd %cwd%

    echo Restart Clojure >&2
    exit /B 0
)

rem Run Clojure
java -cp %rootdir%clojure.jar%extra_classpath% clojure.main %*
