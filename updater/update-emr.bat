@echo OFF

set HOSTNAME=%COMPUTERNAME%
set BACKUP-DIR=emr-backup-%HOSTNAME%
rem set EMR_HOME=C:\Users\Informatics\AppData\Roaming\OpenMRS
set EMR_HOME=C:\Documents and Settings\Administrator\Application Data\OpenMRS
set TOMCAT_HOME=%EMR_HOME%\apache-tomcat-6.0.36
set TIMESTAMP=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%-%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%
set HOME=%~dp0
set HOSTNAME=%COMPUTERNAME%

rem try to update through git
git pull

rem invoke the initial child server sync
call update-emr-after-git.bat
