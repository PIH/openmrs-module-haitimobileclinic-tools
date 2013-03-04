rem @echo OFF

rem load environment for a particular system
call server_configs.bat

rem stop openmrs
set PWD=%CD%
cd %TOMCAT_HOME%\bin 2>NUL
call shutdown.bat
cd /d %PWD%
cls

rem backup current database
mysqldump -u root -proot openmrs > backup\openmrs-%HOSTNAME%.sql"

rem backup current modules
move OPENMRS_HOME\modules\*.omod backup

rem modules
copy ../modules %OPENMRS_HOME%\modules

rem metadata
mysql -u root -proot openmrs < ..\metadata\dump_addresshierarchy.sql
mysql -u root -proot openmrs < ..\metadata\dump_concepts.sql
mysql -u root -proot openmrs < ..\metadata\dump_custom.sql
mysql -u root -proot openmrs < ..\metadata\dump_forms.sql
mysql -u root -proot openmrs < ..\metadata\dump_locations.sql
mysql -u root -proot openmrs < ..\metadata\dump_misc.sql
mysql -u root -proot openmrs < ..\metadata\dump_reports.sql
mysql -u root -proot openmrs < ..\metadata\dump_scheduler.sql
mysql -u root -proot openmrs < ..\metadata\dump_users.sql

rem misc