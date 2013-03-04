@echo OFF

rem load environment for this particular system
call server_configs.bat

rem try to update through git
git pull

rem invoke the initial child server sync
call update-emr-after-git.bat
