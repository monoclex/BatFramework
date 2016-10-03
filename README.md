# BatFramework
BatFramework - The framework in batch to make life a little better.

# Uses
The possibilities are endless. BatFramework provides a framework that allows you to make your batch files more powerful.

# Using it
Just copy everything from BatFramework into your local directory. From there, you should start off by calling `bframe.bat`

```
call bframe.bat -silent off -id INSERT_ID
```

From there, you can start using all of the features availible.

# Documentation
Documentation is availible in every batch file specified.
Here is the documentation from every file:


### array.bat
```

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

```
### bframe.bat
```

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

```
### list.bat
```

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

```
### loadsnapshot.bat
```

::Part of the BatFramework

::ARGS
::
::loadsnapshot.bat - Part of the BatFramework
::loadsnapshot.bat
::
::This batch file loads variables into memory from the last snapshot if an err
::or happened.
::

```
### numcheck
```

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

```
### savesnapshot.bat
```

::Part of the BatFramework

::ARGS
::
::savesnapshot.bat - Part of the BatFramework
::savesnapshot.bat
::
::Saves a snapshot of the program, saving all of the variables and loading them at the program's runtime.

::Save Snapshot

```
### scrub.bat
```

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

```
### throw.bat
```

::Part of the BatFramework

::ARGS
::
::throw.bat - Part of the BatFramework
::throw.bat [What to pause on, and not continue and exit all scripts relevant 
::to it..
::
::This BatFramework file allows you to throw an exception, save a snapshot an
::d stop the program.

```
### tobat.bat
```

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

```
### while.bat
```

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

```
