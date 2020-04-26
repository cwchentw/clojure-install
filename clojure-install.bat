@echo off
rem Clojure Installer for Windows
rem Copyright (c) 2020 Michael Chen
rem Licensed under MIT


rem Check whether Git is available.
git --version 1>nul 2>&1 || (
    echo No Git on the system >&2
    exit /B 1
)

rem Get prefix from user input.
set prefix=%1

rem Fallback to default prefix.
if "x%prefix%" == "x" (
    set prefix=%USERPROFILE%
)

if "%prefix:~-1%" neq "\" (
    set prefix=%prefix%\
)

set clojure_root=%prefix%clojure\

rem Save current working directory.
set cwd=%CD%

if exist %clojure_root% (
    cd %clojure_root%
    rem Update a local Clojure repo if it exists.
    git pull
) else (
    rem Clone a Clojure repo if it doesn't exist.
    git clone https://github.com/clojure/clojure.git %clojure_root%
    cd %clojure_root%
)

rem Check whether PowerShell is available.
powershell -Help >nul 2>&1 || (
    set no_powershell=1
)

rem Download clojure.bat
if "%no_powershell%" == "1" (
    echo No PowerShell on the system >&2
    exit /B 1
)

powershell -Command ^
    "Invoke-WebRequest -Uri https://raw.githubusercontent.com/cwchentw/clojure-install/master/clojure/clojure.bat -OutFile %clojure_root%clojure.bat"

rem Check whether clojure.bat exists.
if not exist %clojure_root%clojure.bat (
    echo Failed to download clojure.bat >&2
    exit /B 1
)

mkdir scripts

rem Download build.bat
powershell -Command ^
    "Invoke-WebRequest -Uri https://raw.githubusercontent.com/cwchentw/clojure-install/master/clojure/build.bat -OutFile %clojure_root%\scripts\build.bat"

rem Check whether build.bat exists.
if not exist %clojure_root%\scripts\build.bat (
    echo Failed to download build.bat >&2
    exit /B 1
)

rem Download clean.bat
powershell -Command ^
    "Invoke-WebRequest -Uri https://raw.githubusercontent.com/cwchentw/clojure-install/master/clojure/clean.bat -OutFile %clojure_root%\scripts\clean.bat"

rem Check whether clean.bat exists.
if not exist %clojure_root%scripts\clean.bat (
    echo Failed to download clean.bat >&2
    exit /B 1
)

call %clojure_root%\scripts\clean.bat
call %clojure_root%\scripts\build.bat

echo Remember to add %clojure_root% to PATH variable

cd %cwd%
