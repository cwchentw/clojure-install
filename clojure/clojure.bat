@echo off
rem Alias to official Clojure cli tool.
rem Copyright (c) 2020 Michael Chen.
rem Licensed under MIT.


powershell -Command "Get-Command -Name Invoke-Clojure -ErrorAction SilentlyContinue" 1>nul 2>&1
if "%ERRORLEVEL%" == "0" (
    powershell -Command Invoke-Clojure %*
    exit /B %ERRORLEVEL%
) else (
    echo No official Clojure cli tool on the system >&2
    exit /B 1
)
