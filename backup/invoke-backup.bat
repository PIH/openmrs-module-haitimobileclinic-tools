@echo off

set LOGFILE=backup.log
set HOSTNAME=%COMPUTERNAME%
set BACKUP-DIR=emr-backup-%HOSTNAME%
set EMR_HOME=C:\Documents and Settings\Administrator\Application Data\OpenMRS
set TOMCAT_HOME=%EMR_HOME%\apache-tomcat-6.0.36
set TIMESTAMP=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%-%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%

echo.
echo Starting EMR backup. Please connect USB flash drive.
set /p BACKUP-DRIVE="Enter drive letter of USB flash drive: " %=%
set BACKUP-PATH=%BACKUP-DRIVE%:\%BACKUP-DIR%\%TIMESTAMP%

IF exist %BACKUP-DRIVE%:\ goto BACKUP

echo.
echo Could not access path %BACKUP-PATH%. 
echo.
echo Reconnect USB flash drive and specify the correct drive letter. Exiting now.
echo.
pause
goto END

:BACKUP

echo.
echo About to start EMR backup to %BACKUP-PATH%
echo.
echo Press CTRL-C to cancel.
echo.
pause
echo.

echo ------- >> %LOGFILE%
echo Sync preparation started >> %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%

echo Step 1: Stop OpenMRS localhost
set PWD=%CD%
cd "%TOMCAT_HOME%\bin" 2>NUL
call shutdown.bat
cd /d %PWD%
cls

echo Step 1: Stop OpenMRS localhost

echo Step 2: Delete old backups
mkdir %BACKUP-DRIVE%:\%BACKUP-DIR%
rd /q /s "%BACKUP-PATH%" 2>NUL
mkdir "%BACKUP-PATH%"

echo Step 3: Dump database
mysqldump -u root -pGot2LuvYa openmrs > openmrs.sql

echo Step 4: Compress and encrypt database
7za a -pGot2LuvYa database-dump.zip openmrs.sql >NUL

echo Step 5: Copy database to flash
copy database-dump.zip "%BACKUP-PATH%" >NUL

echo Step 6: Cleanup
rem Apache temp stuff, dump files, ...
rd /q /s "%TOMCAT_HOME%\temp" 2>NUL
mkdir "%TOMCAT_HOME%\temp"
rd /q /s "%TOMCAT_HOME%\work" 2>NUL
mkdir "%TOMCAT_HOME%\work"
rd /q /s "%TOMCAT_HOME%\webapps\openmrs" 2>NUL
rd /q /s "..\..\database-dump" 2>NUL
mkdir "..\..\database-dump"
del openmrs.sql
del database-dump.zip

echo Step 7: Copy runtime environment to flash
xcopy /e /c /q /y "%EMR_HOME%" "%BACKUP-PATH%" >NUL

echo.
echo Backup finished, unmount and unplug the USB flash drive now.
echo.
echo MAKE SURE THAT THERE ARE NO ADDITIONAL ERRORS INDICATED ABOVE!
echo.
pause

:END
