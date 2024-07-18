@echo off
rem This file is generated from macros3.pbat, all edits will be lost
if exist time.txt goto generate_end
time /t > time.txt
:generate_end
type time.txt