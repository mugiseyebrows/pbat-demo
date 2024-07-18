@echo off
rem This file is generated from test2.pbat, all edits will be lost
set PATH=C:\Program Files\Git\mingw64\bin;C:\Program Files\Git\mingw32\bin;C:\Windows\System32;C:\mingw1120_64\bin;C:\Program Files\Git\usr\bin;%PATH%
if not exist foo curl -L -o foo http://example/foo
echo fn1
echo fn3
patch -i this
echo baz