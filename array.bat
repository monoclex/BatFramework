@echo off

::Part of the BatFramework

::ARGS
::
::array.bat - Part of the BatFramework
::array.bat <command> <params for command>
::
::        -command : The command to execute. This command is relevent to arra
::y.bat only. A list of commands is provided below.
::
::        -params for command : The parameters for the command specified.
::
::Commands:
:: -create : Creates an array. If the array already exists within scope, it w
::ill be set to the array already existing, and returns an errorlevel of 2 if 
:: so. Returns 0 if all went swell. The parameters for create are:
::     <name> : The name of the array.
::     <length> : The length of the array.
::     <initializer value> : The value to initialize all values with. Leave b
::lank if you want a blank initializer value.
::
:: -delete : Deltes an array. All records of the array will be lost. The para
::meters for delete are:
::     <name> : The name of the array.
::
:: -set : Sets an item within an array. The array count starts at 0.
::     <name> : The name of the array.
::     <position> : The position of which you're setting the array.
::     <value> : The value to set into the array.
::
:: -get : Gets an item within the array. The file to read from is "retval.txt
::", use "set /p GETITEMVAL=<retval.txt" to get the value.
::     <name> : The name of the array
::     <position> : The position the value is located in
::
::This BatFramework file turns any item (like example.exe) into a batch file, 
::and the batch file will re-create the executable or whatever file you speci
::fied as an input file. All you have to do is call "example.bat" and it'll c
::reate example.exe
::

set bframe_temp_RETVAL=0

::Raw "while.bat" code
::as to remove dependencies
:while
if "%~1" == "" goto :outofscope

if "%~1" == "-create" goto :Code.Create
:Code.Create.Done

if "%~1" == "-delete" goto :Code.Delete
:Code.Delete.Done

if "%~1" == "-set" goto :Code.Set
:Code.Set.Done

if "%~1" == "-get" goto :Code.Get
:Code.Get.Done

if "%~1" == "" goto :outofscope
shift
goto :while
:outofscope
goto :end

:Code.Set
::Do error checking
if "%~2" == "" call throw.bat An array was not specified.
if "%~3" == "" call throw.bat A position within the array was not specified.
call numcheck.bat "%~3"
if %errorlevel% == 1 call throw.bat The position within the array that was specified was not a number (%~3)
if NOT EXIST "array/%~2.bat" call throw.bat An array being called to did not exist.
setlocal
call "array/%~2.bat"
if %~3 GEQ %count%  call throw.bat The position specified within the array was bigger than the size of the array (Count: %count%, Position: %~3)

setlocal enabledelayedexpansion

::Add a line to the array if it's not already there, as to save 
::space.
if NOT "![%~3]!" == "%~4" @echo.set "[%~3]=%~4" >>"array/%~2.bat"

endlocal
::Shift values
if NOT "%~2" == "" shift
if NOT "%~2" == "" shift
if NOT "%~2" == "" shift
endlocal
goto :Code.Set.Done
:Code.Create
::Do error checking
if "%~2" == "" call throw.bat An array was not specified
if EXIST "array\%~2.bat" goto :Code.Create.LoadIntoMemory
if "%~3" == "" call throw.bat The length of the array was not specified.

set /a bframe_temp_determine=%~3 - 1

::Create array file
@echo.@set count=%~3>>"array/%~2.bat"
for /l %%a IN (0, 1, %bframe_temp_determine%) do (
	@echo.@set [%%a]=%~4>>"array/%~2.bat"
)

set bframe_temp_RETVAL=%bframe_temp_RETVAL%0
if NOT "%~2" == "" shift
if NOT "%~2" == "" shift
if NOT "%~2" == "" shift
goto :Code.Create.Done
:Code.Create.LoadIntoMemory
::We do nothing since it already exists, but remember to return 2!
set bframe_temp_RETVAL=%bframe_temp_RETVAL%2
goto :Code.Create.Done
:Code.Delete
if "%~2" == "" call throw.bat The array specified does not exist
del /f /a "array\%~2.bat"
goto :Code.Delete.Done
:Code.Get
::Error Checking
if "%~2" == "" call throw.bat An array was not specified.
if "%~3" == "" call throw.bat A position within the array was not specified.
if NOT EXIST "array/%~2.bat" call throw.bat An array being called to did not exist.
setlocal
call "array/%~2.bat"
if %~3 GEQ %count%  call throw.bat The position specified within the array was bigger than the size of the array (Count: %count%, Position: %~3)

setlocal enabledelayedexpansion
::Put the result into a file
echo.![%~3]!>"retval.txt"
endlocal
if NOT "%~2" == "" shift
if NOT "%~2" == "" shift
endlocal
goto :Code.Get.Done

:end
exit /b %bframe_temp_RETVAL%