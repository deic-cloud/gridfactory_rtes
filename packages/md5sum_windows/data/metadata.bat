@ECHO OFF

REM Usage: metadata [file]
REM Output: METADATA: outputFileBytes = [bytes]
REM         METADATA: outputFileChecksum = md5:[md5_checksum]
            

REM The full name (all arguments)
SET FULLNAME="%*"
FOR /f "tokens=* delims=;" %%i in (%FULLNAME%) DO (ECHO METADATA: outputFileSize = %%~zi)

REM strip off double quotes
ECHO %FULLNAME% | grep \"\" 1>NUL 2>NUL
IF %ERRORLEVEL%==1 GOTO skipStrip
ECHO "%FULLNAME%" | ssed -R s/""//g > fName
SET /p FULLNAME=<fName
DEL fName  1>NUL 2>NUL
:skipStrip

REM Find the unqualified file name
ECHO %FULLNAME% | ssed -R "s/.*\\([ \w]+)\W*$/\1/g" | ssed -R s/"(.*)"/\1/g > fName
SET /p FNAME=<fName
DEL fName 1>NUL 2>NUL

md5sums.exe -n -b %FULLNAME% | grep "%FNAME%" | ssed -R "s|%FNAME% *|METADATA: outputFileChecksum = md5:|"
