@echo off
echo.
echo This will create a full database dump useful for (remote) troubleshooting.
echo. 
echo Press Ctrl-C to abort or
pause

mysqldump -u root -pGot2LuvYa openmrs > "%USERPROFILE%\Desktop\openmrs-%COMPUTERNAME%.sql"
7za a -pGot2LuvYa "%USERPROFILE%\Desktop\openmrs-%COMPUTERNAME%.zip" "%USERPROFILE%\Desktop\openmrs-%COMPUTERNAME%.sql"
del "%USERPROFILE%\Desktop\openmrs-%COMPUTERNAME%.sql"

echo.
echo Database dump done. echo Take the file openmrs-%COMPUTERNAME%.sql 
echo from the Desktop and give it to someone else.
echo. 
pause