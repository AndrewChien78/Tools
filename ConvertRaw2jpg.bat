ECHO ON
REM This file allows the use of the Freeware Easy2Convert http://www.easy2convert.com/ to convert Panasonic Raw REM Pentax PEF files to jpg.
REM Please put the raw2jpg.exe file in the Windows PATH file
REM Change the directory after "IN" to the required SOURCE DIRECTORY, the directory after "-o" to the required REM TARGET DIRECTORY

:: setup subdirectories
SET photodir=%cd%
SET subdir1=%photodir%\jpg
SET subdir2=%photodir%\jpg_sm
MD "%subdir1%"
MD "%subdir2%"
SET /a counterVar=1
FOR %%y IN (*.raw *.pef) DO 
	(
	raw2jpg -i %y -o '%subdir2%' --width=1920 --height=1080 --keep-aspect-ratio
	counterVar=counterVar+1 
	TIMEOUT 2 /NOBREAK
	echo %counter%
	)

:: References
:: For Loop Counter
:: https://stackoverflow.com/questions/13243015/add-counter-value-in-windows-cmd-script
:: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/for
:: https://stackoverflow.com/questions/2913231/how-do-i-increment-a-dos-variable-in-a-for-f-loop
