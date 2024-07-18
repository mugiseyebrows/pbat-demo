@echo off
rem This file is generated from env_policy1.pbat, all edits will be lost
set PATH=C:\Program Files\Git\mingw64\bin;C:\Program Files\Git\mingw32\bin;C:\Windows\System32;C:\Program Files\Git\usr\bin;C:\Windows
where curl
where patch
where rm
where bash
goto main_end
curl -L -o foo.zip http://example.com/foo.zip
patch -i test
:main_end