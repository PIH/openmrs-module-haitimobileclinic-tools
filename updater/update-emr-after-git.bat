@echo OFF

echo.
echo stop openmrs
set PWD=%CD%
cd %TOMCAT_HOME%\bin 2>NUL
call shutdown.bat
cd /d %PWD%
rem cls

echo.
echo backup current database
mysqldump -u root -proot openmrs > backup\openmrs-%HOSTNAME%.sql"

echo.
echo backup current modules
move "%OPENMRS_HOME%\modules\*.omod" backup\

echo.
echo update modules
copy ..\modules\*.omod "%OPENMRS_HOME%\modules"

echo.
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

echo.
echo cleanup tomcat stuff
rd /q /s "%TOMCAT_HOME%\work\"
mkdir "%TOMCAT_HOME%\work\"
rd /q /s "%TOMCAT_HOME%\temp\"
mkdir "%TOMCAT_HOME%\temp\" 

echo.
echo misc

echo.
echo Update done. Check above line for any error.
echo.
pause