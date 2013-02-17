rem @echo off

set LOGFILE=backup.log
set HOSTNAME=%COMPUTERNAME%
set BACKUP-DIR=emr-backup-%HOSTNAME%
set TOMCAT_HOME=C:\Documents and Settings\Administrator\Application Data\OpenMRS\apache-tomcat-6.0.36

echo.
echo Starting EMR backup. Please connect USB flash drive.
set /p BACKUP-DRIVE="Enter drive letter of USB flash drive: " %=%
set BACKUP-PATH=%BACKUP-DRIVE%:\%BACKUP-DIR%
echo.
echo About to start EMR backup to %BACKUP-PATH%
echo.
echo Press CTRL-C to cancel.
echo.
pause
echo.

IF exist %BACKUP-PATH% goto BACKUP

echo.
echo Could not access path %BACKUP-PATH%. 
echo Reconnect USB flash drive and make sure you have specified the correct drive letter. Exiting now.
echo.
pause
goto END

:BACKUP

echo ------- >> %LOGFILE%
echo Sync preparation started >> %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%

echo Step : Delete old backups

echo Step : Stop OpenMRS localhost
set PWD=%CD%
cd %TOMCAT_HOME%\bin 2>NUL
call shutdown.bat
cd /d %PWD%
rem cls

echo Step : Dump database

echo Step : Compress and encrypt database

echo Step : Copy database to flash

echo Step : Cleanup
rem Apache, dump files, ...
rd /q /s %TOMCAT_HOME%\temp\* 2>NUL
rd /q /s %TOMCAT_HOME%\work\* 2>NUL
rd /q /s ..\..\database-dump\* 2>NUL

echo Step : Copy runtime environment to flash


echo.
echo Backup finished
echo.
echo MAKE THAT THAT THERE ARE NO ADDITIONAL ERRORS INDICATED ABOVE!
echo.
pause

:END
