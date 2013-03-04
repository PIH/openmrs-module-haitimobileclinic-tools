rem adjust vars and copy file to prepare_child_server_system_configs.bat

rem specfic env stuff ======================================================
set SSH_SERVER=195.200.93.58
set SSH_PPK=c:\Users\Apzu-Emr-Lisungwi\AppData\Roaming\OpenMRS\sync-module-child-preparation\192.168.1.7.ppk_putty
set SSH_PPK_OPENSSH=/cygdrive/c/Users/Apzu-Emr-Lisungwi/AppData/Roaming/OpenMRS/sync-module-child-preparation/192.168.1.7.ppk_openssh
set SSH_PORT=8999
set OPENMRS_HOME_PARENT=/usr/share/openmrs
set OPENMRS_HOME=C:\Users\Apzu-Emr-Lisungwi\AppData\Roaming\OpenMRS
set OPENMRS_HOME_RSYNC=/cygdrive/C/Users/Apzu-Emr-Lisungwi/AppData/Roaming/OpenMRS
set HOME=%HOMEDRIVE%/%HOMEPATH%

rem common env stuff ================================================================
set PATH=%PATH%;"C:\Program Files\MySQL\MySQL Server 5.1\bin";C:\MySQL5\bin
set SSH_USER=emradmin
set LOGFILE=sync.log
set PASSWORD=ItIsATrick
set HOME=%~dp0
set HOSTNAME=%COMPUTERNAME%
