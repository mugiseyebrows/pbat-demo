@echo off
rem This file is generated from test1.pbat, all edits will be lost
set PATH=C:\Program Files\Git\mingw64\bin;C:\Program Files\Git\mingw32\bin;C:\Windows\System32;C:\Program Files\CMake\bin;C:\Program Files\7-Zip;C:\mingw1120_64\bin;C:\Program Files\Git\usr\bin;path\to\bin;%PATH%
if not exist foo curl -L -o foo http://example/foo
echo fn1
7z x -y bar
cmake test
echo fn2
if exist uuu goto fn3_end
echo fn3
patch -i this
:fn3_end
echo baz