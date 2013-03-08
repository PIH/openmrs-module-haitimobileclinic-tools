@echo off
echo.
echo WARNING WARNING WARNING
echo.
echo This will delete every patient record in the database.
echo. 
echo If you don't know what you are doing, you should probably NOT do it!
echo.
echo Press Ctrl-C to abort or
pause
echo.
echo Press Ctrl-C to abort or
pause
mysql -u root -pGot2LuvYa openmrs -e "CREATE TEMPORARY TABLE patient_ids AS (SELECT patient_id FROM patient);"
mysql -u root -pGot2LuvYa openmrs -e "delete from name_phonetics where person_name_id in (select person_name_id from person_name where person_id in (select patient_id from patient_ids));"
mysql -u root -pGot2LuvYa openmrs -e "delete from person_name where person_id in (select patient_id from patient_ids);"
mysql -u root -pGot2LuvYa openmrs -e "delete from person_attribute where person_id in (select patient_id from patient_ids);"
mysql -u root -pGot2LuvYa openmrs -e "delete from person_address where person_id in (select patient_id from patient_ids);"
mysql -u root -pGot2LuvYa openmrs -e "delete from obs;"
mysql -u root -pGot2LuvYa openmrs -e "delete from encounter_provider;"
mysql -u root -pGot2LuvYa openmrs -e "delete from encounter;"
mysql -u root -pGot2LuvYa openmrs -e "delete from patient where patient_id in (select patient_id from patient_ids);"
mysql -u root -pGot2LuvYa openmrs -e "delete from person where person_id in (select patient_id from patient_ids);"
mysql -u root -pGot2LuvYa openmrs -e "DROP TABLE patient_ids;"

pause