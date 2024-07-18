@echo off
rem This file is generated from test3.pbat, all edits will be lost
set PATH=C:\Program Files\Git\mingw64\bin;C:\Program Files\Git\mingw32\bin;C:\Windows\System32;C:\Program Files\CMake\bin;C:\Program Files\7-Zip;%PATH%
if not exist foo curl -L -o foo http://example/foo
echo fn1
7z x -y bar
echo fn2
echo baz