@echo OFF

echo stop openmrs
set PWD=%CD%
cd %TOMCAT_HOME%\bin 2>NUL
call shutdown.bat
cd /d %PWD%
rem cls

echo backup current database
mysqldump -u root -proot openmrs > backup\openmrs-%HOSTNAME%.sql"

echo backup current modules
move "%OPENMRS_HOME%\modules\*.omod" backup\

echo update modules
copy ..\modules\*.omod "%OPENMRS_HOME%\modules"

echo update metadata
mysql -u root -proot openmrs < ..\metadata\dump_addresshierarchy.sql
mysql -u root -proot openmrs < ..\metadata\dump_concepts.sql
mysql -u root -proot openmrs < ..\metadata\dump_custom.sql
mysql -u root -proot openmrs < ..\metadata\dump_forms.sql
mysql -u root -proot openmrs < ..\metadata\dump_locations.sql
mysql -u root -proot openmrs < ..\metadata\dump_misc.sql
mysql -u root -proot openmrs < ..\metadata\dump_reports.sql
mysql -u root -proot openmrs < ..\metadata\dump_scheduler.sql
mysql -u root -proot openmrs < ..\metadata\dump_users.sql

echo misc

echo.
echo Update done. Check above line for any error.
echo.
pause