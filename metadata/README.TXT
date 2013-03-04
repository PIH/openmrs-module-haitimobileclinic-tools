This directory contains the relevant OpenMRS metadata to prepare a fresh 
OpenMRS 1.9.2 installation with the necessary data elements.

Initially the data was 'forked' from the zanmi production server (Feb 2013),
but changes to the metadata were necessary. A Metadata Sharing Package was not
yet created.

The file openmrs_full.sql contains a full dump of an empty OpenMRS database.
This can be used to set up a complete new runtime system or dev env. In case 
of updating an already existing database the individual dump-XXX SQL scripts
can be used. The files can be re-created through the Bash script
_dump_metadata.sh under a Bash shell from a full OpenMRS installation.

Note that the updater under the dir ../updater also uses these files to update
the metadata.

In case you need to wipe out a database with existing patients and encounters,
you *might* be lucky and get away with these SQL commands:
CREATE TEMPORARY TABLE patient_ids AS (SELECT patient_id FROM patient);
delete from name_phonetics where person_name_id in (select person_name_id from person_name where person_id in (select patient_id from patient_ids));
delete from person_name where person_id in (select patient_id from patient_ids);
delete from person_attribute where person_id in (select patient_id from patient_ids);
delete from person_address where person_id in (select patient_id from patient_ids);
delete from obs;
delete from encounter_provider;
delete from encounter;
delete from patient where patient_id in (select patient_id from patient_ids);
delete from person where person_id in (select patient_id from patient_ids);


