@echo OFF

IF NOT EXIST server_configs.bat (
  echo.
  echo ERROR
  echo.
  echo File server_configs.bat does NOT exists. Use server_configs-example.bat
  echo as a template and change vaues as needed.
  echo.
  echo Exiting now.
  echo.
  pause
  exit 1
)

rem load environment for this particular system
call server_configs.bat

rem try to update through git
git pull

rem invoke the initial child server sync
call update-emr-after-git.bat
