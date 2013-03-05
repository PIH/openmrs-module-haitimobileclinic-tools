@echo off

set HOSTNAME=%COMPUTERNAME%
set EMR_HOME=C:\Users\Informatics\AppData\Roaming\OpenMRS
set TOMCAT_HOME=%EMR_HOME%\apache-tomcat-6.0.36

echo.
echo Starting EMR restore.
echo.
echo THIS WILL OVERWRITE AN EXISTING INSTALLATION AND ITS DATA
echo.
echo Make sure that you really want to restore and replace everything.
echo.
pause

echo Stop OpenMRS localhost
set PWD=%CD%
cd /d "%TOMCAT_HOME%\bin" 2>NUL
call shutdown.bat
cd /d %PWD%
cls
echo Stop OpenMRS localhost
rem hack to wait for 30 secs to give tomcat time to really shut down
ping -n 30 127.0.0.1 >nul

IF NOT exist "%EMR_HOME%\" goto RESTORE

rd /q /s "%EMR_HOME%"

:RESTORE
echo.
echo Copying files to hard drive
mkdir "%EMR_HOME%"
echo openmrs-runtime.properties > xcopy_excluded.txt
xcopy /e /c /q /y /h /exclude:xcopy_excluded.txt ..\..\*.* "%EMR_HOME%\"
cd "%EMR_HOME%"

echo.
echo Unpack and load database
7za x -pGot2LuvYa -o"%EMR_HOME%" "%EMR_HOME%\database-dump.zip"
mysql -u root -pGot2LuvYa openmrs < "%EMR_HOME%\openmrs.sql"

del "%EMR_HOME%\openmrs.sql"

echo.
echo Restore finished, unmount and unplug the USB flash drive now.
echo.
echo MAKE SURE THAT THERE ARE NO ADDITIONAL ERRORS INDICATED ABOVE!
echo.
pause
