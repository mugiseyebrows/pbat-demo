@echo off
rem This file is generated from advanced1.pbat, all edits will be lost
set PATH=C:\compiler;C:\Program Files\Git\mingw64\bin;C:\Program Files\Git\mingw32\bin;C:\Windows\System32;C:\Program Files\7-Zip;C:\Program Files\CMake\bin;C:\Program Files\Meson;C:\Program Files\Git\cmd;%PATH%
if exist C:\compiler\cl.exe goto install_compiler_end
if not exist compiler.zip curl -L -o compiler.zip https://example.com/compiler.zip
if not exist C:\compiler\cl.exe 7z x -y -oC:\compiler compiler.zip
:install_compiler_end
if not exist lib git clone https://example.com/lib.git
pushd lib
    cmake -D CMAKE_INSTALL_PREFIX=C:/example ..
    cmake --build .
    cmake --install .
popd
if not exist build mkdir build
pushd build
    cmake -D CMAKE_PREFIX_PATH=C:/example ..
    cmake --build .
popd
7z a -y app.zip build\app.exe C:\example\bin\example.dll