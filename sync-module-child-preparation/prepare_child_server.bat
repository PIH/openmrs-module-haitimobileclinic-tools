@echo OFF
goto :START

umbrella script to allow safely on-the-fly updates via git of these scripts.
windows allows, but doesn't like in many circumstances that an already
running script is updated/modified. this script's purpose is to have a stable
and hopefully never changing layout so that itself will never be updated.

:START

rem try to update through git
git pull

rem invoke the initial child server sync
call prepare_child_server_sync.bat
