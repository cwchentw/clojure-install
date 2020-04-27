@echo off
rem Build script for Clojure on Windows
rem Copyright (c) 2020 Michael Chen
rem Licensed under MIT

rem Place the script at the scripts/ subdirectory of of a local Clojure repo.

rem *TODO* Use system Maven to compile Clojure

set script_path=%~dp0
set rootdir=%script_path%..\

cd %rootdir% || (
    echo Failed to go to %rootdir% >&2
    exit /B 1
)

rem Check whether PowerShell is available.
powershell -Help 1>nul 2>&1 || (
    echo No PowerShell on the system >&2
    exit /B 1
)

powershell -Command "Get-Command -Name Invoke-WebRequest -ErrorAction SilentlyContinue" 1>nul 2>&1

if not "%ERRORLEVEL%" == "0" (
    echo Invoke-WebRequest cmdlet is not supported on the system >&2
    exit /B 1
)

rem Download Maven.
powershell -Command "Invoke-WebRequest -Uri https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip -OutFile %rootdir%apache-maven-3.6.3-bin.zip"

if not exist %rootdir%apache-maven-3.6.3-bin.zip (
    echo Failed to download %rootdir%apache-maven-3.6.3-bin.zip >&2
    exit /B 1
)

rem Unzip Maven.
powershell -Command "Expand-Archive -Path %rootdir%apache-maven-3.6.3-bin.zip -DestinationPath %rootdir% "

if not exist %rootdir%apache-maven-3.6.3 (
    echo Failed to extract maven to %rootdir%apache-maven-3.6.3 >&2
    exit /B 1
)

set mvn=%rootdir%apache-maven-3.6.3\bin\mvn.cmd

%mvn% -Plocal -Dmaven.test.skip=true package
