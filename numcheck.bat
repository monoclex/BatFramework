@echo off

::Part of the BatFramework

::ARGS
::
::numcheck.bat - Part of the BatFramework
::numcheck.bat <object>
::
::        -object : The object to determine whether or not it's a number.
::
::This BatFramework file returns a 0 if the object specified is a number.
::If it's not a number, it'll return 1.
::

if "%~1" == "" call throw.bat No number specified.

set bframe_temp_determine=%~1

:loop

if NOT "%bframe_temp_determine:~0,1%" == "0" (
	if NOT "%bframe_temp_determine:~0,1%" == "1" (
		if NOT "%bframe_temp_determine:~0,1%" == "2" (
			if NOT "%bframe_temp_determine:~0,1%" == "3" (
				if NOT "%bframe_temp_determine:~0,1%" == "4" (
					if NOT "%bframe_temp_determine:~0,1%" == "5" (
						if NOT "%bframe_temp_determine:~0,1%" == "6" (
							if NOT "%bframe_temp_determine:~0,1%" == "7" (
								if NOT "%bframe_temp_determine:~0,1%" == "8" (
									if NOT "%bframe_temp_determine:~0,1%" == "9" (
										exit /b 1
									)
								)
							)
						)
					)
				)
			)
		)
	)
)

set bframe_temp_determine=%bframe_temp_determine:~1%

if "%bframe_temp_determine%" == "" goto :outofscope
goto :loop
:outofscope

exit /b 0