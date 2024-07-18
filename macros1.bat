@echo off
rem This file is generated from macros1.pbat, all edits will be lost
set PATH=C:\Program Files\CMake\bin;C:\Program Files\Git\mingw64\bin;C:\Program Files\Git\mingw32\bin;C:\Windows\System32;C:\Program Files\7-Zip;C:\Program Files\Git\usr\bin;%PATH%
:: download
curl -L -o foo.zip http://example.com/foo.zip
:: download unless exists
if not exist bar.zip curl -L -o bar.zip http://example.com/bar.zip
:: unzip
7z x -y foo.zip
:: unzip unless bar exists
if not exist bar 7z x -y bar.zip
:: unzip two files
7z x -y bar.zip part1.txt part2.txt
time /t > time.txt
date /t > date.txt
:: zip two files
7z a -y data.zip time.txt date.txt
if not exist foo mkdir foo
rmdir /s /q bar || echo 1 > NUL
xcopy /s /e /y /i src dst
patch -N -p1 -i ..\patch.patch
del /f /q part1.txt part2.txt