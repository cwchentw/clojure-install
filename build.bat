@echo off
rem Build script for Clojure on Windows
rem Copyright (c) 2020 Michael Chen
rem Licensed under MIT

rem Place clojure.bat, build.bat and clean.bat at the root path of Clojure repo.

rem *TODO* Use system Maven to compile Clojure

set rootdir=%~dp0

rem Check whether PowerShell is available.
powershell -Help 1>nul 2>&1 || (
    echo No PowerShell on the system >&2
    exit /B 1
)

rem Download Maven.
powershell -Command "Invoke-WebRequest -Uri https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip -OutFile %rootdir%apache-maven-3.6.3-bin.zip"

rem Unzip Maven.
powershell -Command "Expand-Archive -Path %rootdir%apache-maven-3.6.3-bin.zip -DestinationPath %rootdir% "

set mvn=%rootdir%\apache-maven-3.6.3\bin\mvn.cmd

cd %rootdir%
%mvn% -Plocal -Dmaven.test.skip=true package
