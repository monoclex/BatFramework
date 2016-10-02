@echo off

::Part of the BatFramework

::ARGS
::
::savesnapshot.bat - Part of the BatFramework
::savesnapshot.bat
::
::Saves a snapshot of the program, saving all of the variables and loading them at the program's runtime.

::Save Snapshot

call safedel.bat "snapshot%bframe_temp_id%_raw.txt"

::Create Raw File
set>tmp/snapshot%bframe_temp_id%_raw.txt

::Create Snapshot File
@echo.@if "%%bframe_silent%%" == "false" @echo.Loading Snapshot...>"snapshot/snapshot%bframe_programid%.bat"

for /f "tokens=* delims= " %%f in ( tmp/snapshot%bframe_temp_id%_raw.txt ) do (
    
    @echo.@set %%f>>"snapshot/snapshot%bframe_programid%.bat"
    
)

@echo.@if "%%bframe_silent%%" == "false" @echo.Snapshot Loaded.>>"snapshot/snapshot%bframe_programid%.bat"