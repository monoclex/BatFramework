@echo off

::Part of the BatFramework

::ARGS
::
::tobat.bat - Part of the BatFramework
::tobat.bat <input file>
::
::        -input file : This is the file to specify that goes in. What happens
:: to the file, is that it then turns into a batch file, and goes out as the f
::ile name with .bat. You can have as many input files as you want, it'll loop
:: through all of the files.
::
::This BatFramework file turns any item (like example.exe) into a batch file, 
::and the batch file will re-create the executable or whatever file you speci
::fied as an input file. All you have to do is call "example.bat" and it'll c
::reate example.exe
::

mkdir tmp

:loopCreate

if "%~nx1" == "" exit /b 0
set bframe_temp_outputfile=%~nx1.bat
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
@echo.@set x=^^^>^^^>^"%~nx1.b64^">>"%bframe_temp_outputfile%"

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

shift

goto :loopCreate
