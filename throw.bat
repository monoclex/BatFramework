@echo off

::Part of the BatFramework

::ARGS
::
::throw.bat - Part of the BatFramework
::throw.bat [What to pause on, and not continue and exit all scripts relevant to it..
::
::This BatFramework file allows you to throw an exception, save a snapshot and stop the program.


set "bframe_temp_id=%bframe_programid%%random%%random%"
set "bframe_temp_retthrow="

cls
echo [ERROR THROWN]

::Raw "while.bat" code
::As to remove dependencies
:while
if "%~1" == "" goto :outofscope
if "%bframe_temp_retthrow%" == "" ( set "bframe_temp_retthrow=%~1" ) else ( set "bframe_temp_retthrow=%bframe_temp_retthrow% %~1" )
shift
goto :while
:outofscope

::Display Details

echo.
echo.Details: "%bframe_temp_retthrow%"
echo.
echo.Application Halted.
echo.
echo.Saving a snapshot of all variables in use...

call savesnapshot.bat

echo.Snapshot Saved.
echo.
echo.Press any key to quit application.

pause

exit