@echo off

echo.
echo About to prepare the remote server. Press CTRL-C to cancel.
echo.
echo Connect to 'Over-the-Air OpenMRS Sync' before continue.
pause
echo.

rem load environment for a particular system
call prepare_child_server_system_configs.bat

rem sanity checks for local uncommitted sync_records =========================
mysql -u openmrs -ppa55ionFruit openmrs_lisungwi -e "select record_id from sync_record where state <> 'COMMITTED';" > sync_record.dump
set count=0
for /f "usebackq delims=" %%a in (sync_record.dump) do set /a count+=1
del sync_record.dump
if %count% LSS 2 goto no_sync_records_found
echo Unsynchronized changes in child server available >> %LOGFILE%
echo ERROR checking clean child server. 
echo Local, unsynchronized changes are present on this child server.
echo Make sure to synchronize first.
echo 1. Synchronize through OpenMRS Child server
echo 2. Run prepare_child_server again
echo.
echo Exiting now
echo.
pause
exit 0

:no_sync_records_found

echo.
echo Starting remote server preparation
echo ------- >> %LOGFILE%
echo Sync preparation started >> %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%

rem stop openmrs =============================================================
echo Step 1/7: Stopping OpenMRS localhost
set PWD=%CD%
cd ..\apache-tomcat-5.5.33\bin 2>NUL
call shutdown.bat
cd /d %PWD%
cls

: fake messages to clear screen
echo.
echo Starting remote server preparation
echo Step 1/7: Stopping OpenMRS localhost

rem clear sync records =======================================================
echo Step 2/7: Clear sync records on parent server
plink -i %SSH_PPK% -P %SSH_PORT% %SSH_USER%@%SSH_SERVER% "mysql -u openmrs -ppa55ionFruit openmrs -e 'delete from sync_server_record; delete from sync_record; delete from sync_import;' "

rem dump parent DB ===========================================================
echo Step 3/7: Dump parent db on parent server
plink -i %SSH_PPK% -P %SSH_PORT% %SSH_USER%@%SSH_SERVER% "test -e /tmp/sync-preparation-%HOSTNAME%.sql || mysqldump -u openmrs -ppa55ionFruit openmrs -q -e --single-transaction --ignore-table=openmrs.global_property --ignore-table=openmrs.sync_class --ignore-table=openmrs.sync_server --ignore-table=openmrs.sync_server_class > /tmp/sync-preparation-%HOSTNAME%.sql"

rem copy to child ====================================================
echo Step 4/7: Copy db from parent server (without progress indication)
rem : copy uncompressed dump via rsync, try x times to get the file
FOR %%i IN (1 2 3 4 5) DO (
  rsync --quiet -rltDyzP --partial -e "ssh -i %SSH_PPK_OPENSSH% -p %SSH_PORT%" %SSH_USER%@%SSH_SERVER%:/tmp/sync-preparation-%HOSTNAME%.sql sync-preparation-%HOSTNAME%.sql
  IF "%ERRORLEVEL%" == "0" GOTO IMPORT
)
: error rsyncing file, print message and stop
echo ERROR while downloading file, check network and try again >> %LOGFILE%
echo.
echo DON'T CONTINUE TO WORK WITH THIS SERVER!
echo.
echo Exiting now
echo.
pause
exit 1

:IMPORT
rem copy modules =============================================================
echo Step 5/7: Copy new modules from parent server
rsync --quiet --delete -rltDyzP --partial -e "ssh -i %SSH_PPK_OPENSSH% -p %SSH_PORT%" %SSH_USER%@%SSH_SERVER%:%OPENMRS_HOME_PARENT%/modules/ "%OPENMRS_HOME_RSYNC%/modules"

rem import file ==============================================================
echo Step 6/7: Import db to localhost
mysql -u openmrs -ppa55ionFruit openmrs_lisungwi < sync-preparation-%HOSTNAME%.sql
IF "%ERRORLEVEL%" == "0" GOTO OK

echo ERROR during sync preparation >> %LOGFILE%
echo.
echo DON'T CONTINUE TO WORK WITH THIS SERVER!
echo.
pause
exit 1

:OK

rem cleanup ==================================================================
echo Step 7/7: Clean up
plink -i %SSH_PPK% -P %SSH_PORT% %SSH_USER%@%SSH_SERVER% "rm /tmp/sync-preparation-%HOSTNAME%.*"
rem Not sure, but it seems like Tomcat shutdown is not able to remove webapp temps, DIY as I fear there might be some drawbacks
rd /q /s ..\apache-tomcat-5.5.33\temp\* 2>NUL

rem ready and done ===========================================================
echo.
echo Sync preparation finished
echo.
echo ONLY CONTINUE TO WORK IF THERE ARE NO ERRORS ABOVE!
echo Sync preparation finished >> %LOGFILE%
echo.
echo Disconnect from 'Over-the-Air OpenMRS Sync' now.

pause
