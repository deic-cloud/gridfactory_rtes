@ECHO OFF

IF "%1"=="0" GOTO EOF

IF "%1"=="1" SET PATH=%BASEDIR%;%PATH% & GOTO EOF

IF "%1"=="2" GOTO EOF

SET ERRORLEVEL=1

:EOF {End-of-file}
