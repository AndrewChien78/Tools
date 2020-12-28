REM This file allows the use of the Freeware Easy2Convert http://www.easy2convert.com/ to convert Panasonic Raw and Pentax PEF files to jpg.
REM Please put the raw2jpg.exe file in the Windows PATH file
REM Change the directory after "IN" to the required SOURCE DIRECTORY, the directory after "-o" to the required TARGET DIRECTORY

FOR %y IN (E:\Photo\2015\*) DO (
	raw2jpg -i %y -o E:\Photo\2015\jpg\
	TIMEOUT 2 /NOBREAK)
  
