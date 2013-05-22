@echo OFF

echo.
echo Updating the current OpenMRS installation. Internet connection is required.
echo.
echo Only run this on request!
echo.
pause

set HOSTNAME=%COMPUTERNAME%
set BACKUP-DIR=emr-backup-%HOSTNAME%
set EMR_HOME=C:\Users\Informatics\AppData\Roaming\OpenMRS
rem set EMR_HOME=C:\Documents and Settings\Administrator\Application Data\OpenMRS
set TOMCAT_HOME=%EMR_HOME%\apache-tomcat-6.0.36
set TIMESTAMP=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%-%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%
set HOME=%~dp0
set HOSTNAME=%COMPUTERNAME%

rem update through git and throw away all local changes
git fetch --all
git reset --hard origin/master

rem invoke the initial child server sync
call update-emr-after-git.bat
