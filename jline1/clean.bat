@echo off
rem Clean script for jline 1.x on Windows
rem Copyright (c) 2020 Michael Chen
rem Licensed under MIT

rem Place the script at the root path of of a local jline 1.x repo.

set rootdir=%~dp0

if exist %rootdir%apache-maven-3.6.3-bin.zip del /S %rootdir%apache-maven-3.6.3-bin.zip
if exist %rootdir%apache-maven-3.6.3 rmdir /S /Q %rootdir%apache-maven-3.6.3

