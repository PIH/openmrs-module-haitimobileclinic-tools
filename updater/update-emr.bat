@echo OFF
goto :START
:START

rem try to update through git
git pull

rem invoke the initial child server sync
call update-emr-after-git.bat
