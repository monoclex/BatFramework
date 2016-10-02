@echo off

::Part of the BatFramework

::ARGS
::
::scrub.bat - Part of the BatFramework
::scrub.bat -snapshot
::        -snapshot : If this is placed as an argument, all snapshots will be
:: removed from disk.
::
::This batch file cleans up all parts of BatFramework, removing all un-needed 
::stuff in memory.
::

set bframe_scrub_snapshot=false

if "%~1" == "-snapshot" set bframe_scrub_snapshot=true

if defined bframe_running goto :BatFrameworkRunning

:BatFrameworkNotRunning
::BatFramework is not running, or we're not in silent mode..
echo.[ Scrub.bat - Scrubbing BatFramework... ]
echo.Cleaning up temporary files...
cd tmp
if "%cd:~-3%" == "tmp" (
	del /F /Q *.*
	cd..
) else (
	echo.Not in tmp directory! ^( %cd% ^)
)
if "%bframe_scrub_snapshot%" == "true" goto :CleanSnapshot
:DoneCleaningSnapshot

echo.Removing all instances of bframe_temp variables...

::An up-to-date list of bframe_temp variables
set "bframe_temp_id="
set "bframe_temp_retthrow="
set "bframe_temp_whiledetermine="
set "bframe_temp_RETVAL="
set "bframe_temp_errlevel="
set "bframe_temp_determine"

echo.BatFramework has been scrubbed.

goto :eof

:BatFrameworkRunning

if NOT "%bframe_silent%" == "true" goto :BatFrameworkNotRunning

::We will do the cleaning silently.
cd tmp
if "%cd:~-3%" == "tmp" (
	del /F /Q *.*
	cd..
)
if "%bframe_scrub_snapshot%" == "true" goto :CleanSnapshot.NotRun
:DoneCleaningSnapshot.NotRun

::An up-to-date list of bframe_temp variables
set "bframe_temp_id="
set "bframe_temp_retthrow="
set "bframe_temp_whiledetermine="
set "bframe_temp_RETVAL="
set "bframe_temp_errlevel="
set "bframe_temp_determine"

goto :eof

:CleanSnapshot

echo.Cleaning up snapshots...
chdir snapshot
if "%cd:~-8%" == "snapshot" (
	del /F /Q *.*
	cd..
) else (
	echo.Not in snapshot directory! ^( %cd% ^)
)
	
goto :DoneCleaningSnapshot

:CleanSnapshot.NotRun

chdir snapshot
if "%cd:~-8%" == "snapshot" (
	del /F /Q *.*
	cd..
)
	
goto :DoneCleaningSnapshot.NotRun