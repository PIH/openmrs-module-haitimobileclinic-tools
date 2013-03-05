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
move "%EMR_HOME%\modules\*.omod" backup\

echo.
echo update modules
copy ..\modules\*.omod "%EMR_HOME%\modules"

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
rem hack to wait for 30 secs to give tomcat time to really shut down
ping -n 30 127.0.0.1 >nul
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