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
