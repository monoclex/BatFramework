@echo off

::Part of the BatFramework

::ARGS
::
::while.bat - Part of the BatFramework
::while.bat <determine> <execute>
::
::        -determine : The code to determing if the while loop should continue 
::r end. If you're using a batch file to determing whether to continue or not,
:: returning "0" means to continue and "1" means to stop. If you're not using 
::a batch file, set bframe_temp_RETVAL to "0" and "1" respectively.
::
::        -execute : The code to execute while the while loop is executing.
::
::This BatFramework file allows for while loops to exist.

set bframe_temp_whiledetermine=false
set bframe_temp_RETVAL=undefined

if "%~1" == "" call throw.bat No argument specified in while.bat for determining code.
if "%~2" == "" call throw.bat No argument specified in while.bat for execution code.

if EXIST "%~1" set bframe_temp_whiledetermine=true

:while

::We want to stay within the main code, and not branch off into other if
::statements, as that could cause some trouble with up-to-date variables.

::DETERMINE

if "%bframe_temp_whiledetermine%" == "true" goto :Determine.CallFile
if "%bframe_temp_whiledetermine%" == "false" goto :Determine.ExecuteCode

:Determine.CallFile

::Execute file
call "%~1"

::Determing whether or not
set bframe_temp_errlevel=%errorlevel%
IF "%bframe_temp_errlevel%" == "0" goto :Determine.ContinueCode
IF "%bframe_temp_errlevel%" == "1" goto :outofscope
call throw.bat Errorlevel given (%bframe_temp_errlevel%) does not return 0 or 1.

:Determine.ExecuteCode

::Execute user code
%~1
set bframe_temp_errlevel=%bframe_temp_RETVAL%
set bframe_temp_errlevel=%bframe_temp_errlevel: =%
IF "%bframe_temp_errlevel%" == "0" goto :Determine.ContinueCode
IF "%bframe_temp_errlevel%" == "1" goto :outofscope
call throw.bat Errorlevel given (%bframe_temp_errlevel%) does not return 0 or 1.

::

:Determine.ContinueCode

echo %~1
echo %~2
echo %counter%

::EXECUTE USER CODE

%~2

goto :while

:outofscope