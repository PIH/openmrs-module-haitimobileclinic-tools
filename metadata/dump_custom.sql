# custom SQL scripts that can apply any change to the DB
# be careful as they need to be able to be run repeatedly

# removing ht locale as default OpenMRS doesnt seem to include creole
# for the patientregistration the ht localization was copied to french locale
update user_property set property_value='fr' where property='defaultLocale' and property_value='ht';
update user_property set property_value='en_US' where property='defaultLocale' and property_value='en';
update user_property set property_value='en_US' where property='defaultLocale' and property_value='en_UK';

# rename Mobile Clinic Dossier Number to Numero de dossier clinique mobile
update global_property set property_value = 'Numero de dossier clinique mobile' WHERE property = 'haitimobileclinic.primaryIdentifierType';
update patient_identifier_type set name = 'Numero de dossier clinique mobile'  where patient_identifier_type_id = 14;

# clean out report history as previously existing reports might have been deleted
delete from reporting_report_request;
