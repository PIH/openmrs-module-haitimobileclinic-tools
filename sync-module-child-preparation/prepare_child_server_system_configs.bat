rem adjust vars and copy file to prepare_child_server_system_configs.bat

rem specfic env stuff ======================================================
set OPENMRS_PARENT=192.168.6.131
set OPENMRS_HOME_PARENT=/usr/share/openmrs

set OPENMRS_HOME=C:\Users\Apzu-Emr-Lisungwi\AppData\Roaming\OpenMRS
set OPENMRS_HOME_RSYNC=/cygdrive/C/Users/Apzu-Emr-Lisungwi/AppData/Roaming/OpenMRS
set HOME=%HOMEDRIVE%/%HOMEPATH%

rem common env stuff ================================================================
set LOGFILE=sync.log
set SSH_USER=emradmin
set PASSWORD=ItIsATrick
set HOME=%~dp0
set HOSTNAME=%COMPUTERNAME%
set TOMCAT_HOME=..\..\apache-tomcat-6.0.36