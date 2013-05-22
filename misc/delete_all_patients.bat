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
echo Really sure you want to continue???
echo.
echo Press Ctrl-C to abort or
pause
mysql -u root -pGot2LuvYa openmrs -e "CREATE TEMPORARY TABLE patient_ids AS (SELECT patient_id FROM patient); delete from name_phonetics where person_name_id in (select person_name_id from person_name where person_id in (select patient_id from patient_ids)); delete from person_name where person_id in (select patient_id from patient_ids); delete from person_attribute where person_id in (select patient_id from patient_ids); delete from person_address where person_id in (select patient_id from patient_ids); delete from obs; delete from encounter_provider; delete from encounter; delete from patient_identifier; delete from patient where patient_id in (select patient_id from patient_ids); delete from person where person_id in (select patient_id from patient_ids); DROP TABLE patient_ids; update idgen_seq_id_gen set next_sequence_value=1 where id=1;"

pause