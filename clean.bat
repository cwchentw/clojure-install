@echo off
rem Clean script for Clojure on Windows
rem Copyright (c) 2020 Michael Chen
rem Licensed under MIT

rem Place clojure.bat, build.bat and clean.bat at the root path of a local Clojure repo.

set rootdir=%~dp0

if exist %rootdir%clojure.jar del /S %rootdir%clojure.jar
if exist %rootdir%apache-maven-3.6.3-bin.zip del /S %rootdir%apache-maven-3.6.3-bin.zip
if exist %rootdir%apache-maven-3.6.3 rmdir /S /Q %rootdir%apache-maven-3.6.3
