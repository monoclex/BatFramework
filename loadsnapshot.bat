@echo off

::Part of the BatFramework

::ARGS
::
::loadsnapshot.bat - Part of the BatFramework
::loadsnapshot.bat
::
::This batch file loads variables into memory from the last snapshot if an err
::or happened.
::

if EXIST snapshot\snapshot%bframe_programid%.bat ( call snapshot\snapshot%bframe_programid%.bat )