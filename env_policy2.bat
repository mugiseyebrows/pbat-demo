@echo off
rem This file is generated from env_policy2.pbat, all edits will be lost
set PATH=C:\Windows;C:\Windows\System32
if exist "C:\Program Files\Git\usr\bin\patch.exe" set PATCH=C:\Program Files\Git\usr\bin\patch.exe
if not defined PATCH (
echo PATCH not found
exit /b
)
if exist "C:\Program Files\Git\mingw32\bin\curl.exe" set CURL=C:\Program Files\Git\mingw32\bin\curl.exe
if exist "C:\Program Files\Git\mingw64\bin\curl.exe" set CURL=C:\Program Files\Git\mingw64\bin\curl.exe
if exist "C:\Windows\System32\curl.exe" set CURL=C:\Windows\System32\curl.exe
if not defined CURL (
echo CURL not found
exit /b
)
where curl
where patch
where rm
where bash
goto main_end
"%CURL%" -L -o foo.zip http://example.com/foo.zip
"%PATCH%" -i test
:main_end