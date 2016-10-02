@echo off

::
:: --------------------------------------------------------
::   BatFramework - The framework in batch for everything
::
::   bframe.bat is the starting point of your application
::   You call it as soon as it starts and make things go!
::        Such as any tools in the bframe framework.
:: --------------------------------------------------------
::
:: ARGS:
::
::bframe.bat [-silent <on/off>] [-id <program id>]
::        -silent <on/off> : This determines whether the BatFramework while yo
::ur application is runnins is completely silent. The only thing that isn't si
::lent is throw.bat, because it has to throw an error and warn the user.
::
::        -id <program id> : This is the program ID of your program. If an err
::or occurs, they can restart the program just fine if you included "call load
::snapshot.bat" after the variable initialization. This can help save progress
:: when an error happens.
::

set bframe_running=true
set bframe_inuse=no
set bframe_silent=false

::Raw "while.bat" code
::as to remove dependencies
:while
if "%~1" == "" goto :outofscope

if "%~1" == "-id" (
	set bframe_programid=%~2
	shift
)

if "%~1" == "-silent" (
	shift
	if "%~2" == "on" (
		set bframe_silent=true
	) else if "%~2" == "off" (
		set bframe_silent=false
	)
)

if "%~1" == "" goto :outofscope
shift
goto :while
:outofscope

::
::
::

if "%bframe_silent%" == "false" (
	echo.BatFramework - Initializing...
	echo.[Path Enabled: %bframe_path%]
	echo.[Silence: %bframe_silent%]
	echo.[Program Id: %bframe_programid%]
)

exit /b