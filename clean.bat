@echo off
rem Clean script for Clojure on Windows
rem Copyright (c) 2020 Michael Chen
rem Licensed under MIT

rem Place clojure.bat, build.bat and clean.bat at the root path of Clojure repo.

set rootdir=%~dp0

del /S %rootdir%clojure.jar %rootdir%apache-maven-3.6.3-bin.zip
rmdir /S /Q %rootdir%apache-maven-3.6.3
