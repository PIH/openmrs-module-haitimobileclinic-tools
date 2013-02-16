@echo off
echo.
echo This will reset the changeloglock table from OpenMRS.
echo Only invoke this if you are requested to do so!
echo.
echo Press Ctrl-C to abort or
pause
mysql -u openmrs -pPW openmrs -e "delete from liquibasechangeloglock;"
pause