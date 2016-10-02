@echo off

::Internally used program
::
:: <! Would reccommend not using this in your projects !>

::Part of the BatFramework

::ARGS
::
::safedel.bat - Part of the BatFramework
::safedel.bat <delete>
::        -delete : The file to safely delete.
::
::This BatFramework file is an internal file that via a weird bug I have yet t
::o understand, onyl deletes files in the tmp directory.


if "%~1" == "" goto :eof

if NOT EXIST "%~1" goto :end

del /f /s /q "%~1" > tmp\safedel%random%~2random%.txt

:end