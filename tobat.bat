@echo off

::Part of the BatFramework

::ARGS
::
::tobat.bat - Part of the BatFramework
::tobat.bat <input file> <output batch file>
::
::        -input file : This is the file to specify that goes in. What happens
:: to the file, is that it then turns into a batch file, and goes out as <outp
::ut batch file>.
::
::        -output file (Optional) : This is the name of the output batch file.
::Name it something like "output.bat" or something. If nothing is specified, i
::t will just add a .bat extention to the input file's input.
::
::This BatFramework file turns any item (like example.exe) into a batch file, 
::and the batch file will re-create the executable or whatever file you speci
::fied as an input file. All you have to do is call "example.bat" and it'll c
::reate example.exe
::

set bframe_temp_outputfile=%~nx2
if "%~nx1" == "" call throw.bat No argument specified for an input file.
if "%~nx2" == "" set bframe_temp_outputfile=%~nx1.bat
set bframe_temp_outputfile=%bframe_temp_outputfile: =_%
if NOT EXIST "%~nx1" call throw.bat The input file specified doesn't exist.

if EXIST "%bframe_temp_outputfile%" del /f /q %bframe_temp_outputfile%

if "%bframe_silent%" == "true" ( echo.x>tmp\null.txt ) else ( echo.Getting base64 encoding of file... )

certutil -encode "%~nx1" "tmp\%bframe_temp_outputfile%.b64"

if "%bframe_silent%" == "true" ( echo.x>tmp\null.txt) else ( echo.Converting base64 encoding to batch... )

@echo.@echo.[ BatFramework tobat.bat ]>"%bframe_temp_outputfile%"
@echo.@echo.Creating ^"%~nx1^"...>>"%bframe_temp_outputfile%"
@echo.@if EXIST ^"%~nx1^" del /f /a ^"%~nx1^">>"%bframe_temp_outputfile%"
@echo.@if EXIST ^"%~nx1.b64^" del /f /a ^"%~nx1.b64^">>"%bframe_temp_outputfile%"
@echo.@set x=^>^>^"%~nx1.b64^">>"%bframe_temp_outputfile%"

for /f "tokens=* delims= " %%f in ( tmp/%bframe_temp_outputfile%.b64 ) do (
    
	if NOT "%%f" == "-----BEGIN CERTIFICATE-----" (
		if NOT "%%f" == "-----END CERTIFICATE-----" (
			@echo.@echo.%%f%%x%%>>"%bframe_temp_outputfile%"
		)
	)
	
)

@echo.@echo.Decoding file...>>"%bframe_temp_outputfile%"
@echo.@certutil -decode ^"%~nx1.b64^" ^"%~nx1^">>"%bframe_temp_outputfile%"
@echo.@echo.Deleting old file...>>"%bframe_temp_outputfile%"
@echo.@del /f /a ^"%~nx1.b64^">>"%bframe_temp_outputfile%"
@echo.@echo.Conversion Successfull.>>"%bframe_temp_outputfile%"

echo.Conversion complete.
