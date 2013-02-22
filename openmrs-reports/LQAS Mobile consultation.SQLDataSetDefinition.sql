# SQL DataSet Definition: Mobile Clinic LQAS

# Parameters: startDate, endDate
# make sure to remove everything before the SELECT lines within OpenMRS !
#set @startDate='2013-01-01';
#set @endDate='2013-03-01';
SELECT 
  '' as 'Dossier Found? Y/N', 
  'todo # dossier', 
  date(pc.encounter_datetime) as 'Visit Date', 
  cd1n.name as 'Coded 1', cd2n.name  as 'Coded 2', cd3n.name  as 'Coded 3', cd4n.name  as 'Coded 4', nc1.value_text  as 'Non-Coded 1', nc2.value_text  as 'Non-Coded 2', 
  hivn.name as 'HIV Test', hivrn.name as 'HIV Test Result',
  CASE # quick way to see if one encounter has 5 obs for TB screening
    WHEN (select count(*) from obs o, concept c where o.encounter_id=pc.encounter_id and o.concept_id = c.concept_id and c.uuid in ('0bde4475-8d22-4f60-9c5d-7df16f41f7fd', '8710cce2-0070-408f-9961-40312d0b976d', 'b838aeb3-9df4-4bca-aa43-3cd5de29801a','3f5d6a62-4dbc-4ef9-8264-29ef15f53b31', '84d4ac55-e1ac-4bc0-ae42-7bd7c028cd4a')) = 5 THEN 'YES'
    ELSE 'NO'
  END as 'TB screening complete',
  'todo as Dossier', 
  concat(un.given_name, " ", un.family_name) as 'Data Clerk who entered diagnosis', 
  concat(cln.given_name, " ", cln.family_name) as 'Clinician who saw patient'
#SELECT '' as 'Dossier Found? Y/N', d.identifier as '# Dossier', date(pc.encounter_datetime) as 'Visit Date', cd1n.name as 'Coded 1', cd2n.name  as 'Coded 2', cd3n.name  as 'Coded 3', cd4n.name  as 'Coded 4', nc1.value_text  as 'Non-Coded 1', nc2.value_text  as 'Non-Coded 2', hivn.name as 'HIV Test','' as 'Dossier', concat(un.given_name, " ", un.family_name) as 'Data Clerk who entered diagnosis', concat(cln.given_name, " ", cln.family_name) as 'Clinician who saw patient'

FROM patient p

INNER JOIN encounter pc ON p.patient_id = pc.patient_id AND pc.encounter_type = (SELECT encounter_type_id FROM encounter_type where uuid = 'fec6f3ed-6a3c-4c47-8982-a28f96befb5b') AND pc.voided = 0 AND pc.encounter_datetime BETWEEN @startDate AND @endDate # mobile clinic consultation

# INNER JOIN patient_identifier d ON p.patient_id = d.patient_id AND d.identifier_type = (SELECT patient_identifier_type_id FROM patient_identifier_type WHERE uuid = 'e66645eb-03a8-4991-b4ce-e87318e37566') AND d.voided = 0

LEFT OUTER JOIN obs cd1 ON pc.encounter_id = cd1.encounter_id AND cd1.concept_id = (SELECT concept_id FROM concept WHERE uuid = '12e1caf5-0886-4ce3-95d7-77183d8e9892') AND cd1.voided = 0
LEFT OUTER JOIN concept_name cd1n ON cd1.value_coded = cd1n.concept_id AND cd1n.locale = 'fr'

LEFT OUTER JOIN obs cd2 ON pc.encounter_id = cd2.encounter_id AND cd2.concept_id = (SELECT concept_id FROM concept WHERE uuid = '12e1caf5-0886-4ce3-95d7-77183d8e9892') AND cd2.voided = 0 AND cd2.obs_id != cd1.obs_id
LEFT OUTER JOIN concept_name cd2n ON cd2.value_coded = cd2n.concept_id AND cd2n.locale = 'fr'

LEFT OUTER JOIN obs cd3 ON pc.encounter_id = cd3.encounter_id AND cd3.concept_id = (SELECT concept_id FROM concept WHERE uuid = '12e1caf5-0886-4ce3-95d7-77183d8e9892') AND cd3.voided = 0 AND cd3.obs_id NOT IN (cd1.obs_id, cd2.obs_id)
LEFT OUTER JOIN concept_name cd3n ON cd3.value_coded = cd3n.concept_id AND cd3n.locale = 'fr'

LEFT OUTER JOIN obs cd4 ON pc.encounter_id = cd4.encounter_id AND cd4.concept_id = (SELECT concept_id FROM concept WHERE uuid = '12e1caf5-0886-4ce3-95d7-77183d8e9892') AND cd4.voided = 0 AND cd4.obs_id NOT IN (cd1.obs_id, cd2.obs_id, cd3.obs_id)
LEFT OUTER JOIN concept_name cd4n ON cd4.value_coded = cd4n.concept_id AND cd4n.locale = 'fr'

LEFT OUTER JOIN obs nc1 ON pc.encounter_id = nc1.encounter_id AND nc1.concept_id = (SELECT concept_id FROM concept WHERE uuid = '84e003b6-04f7-40ae-b31b-90a973dd7b04') AND nc1.voided = 0

LEFT OUTER JOIN obs nc2 ON pc.encounter_id = nc2.encounter_id AND nc2.concept_id = (SELECT concept_id FROM concept WHERE uuid = '84e003b6-04f7-40ae-b31b-90a973dd7b04') AND nc2.voided = 0 AND nc2.obs_id != nc1.obs_id

LEFT OUTER JOIN obs hiv ON pc.encounter_id = hiv.encounter_id AND hiv.concept_id = (SELECT concept_id FROM concept WHERE uuid = 'ebe8c03d-4d42-4129-820b-a9ebfe30e910') AND hiv.voided = 0 # HIV Test
LEFT OUTER JOIN concept_name hivn ON hiv.value_coded = hivn.concept_id AND hivn.locale = 'fr'

LEFT OUTER JOIN obs hivr ON pc.encounter_id = hivr.encounter_id AND hivr.concept_id = (SELECT concept_id FROM concept WHERE uuid = '31c49556-0370-102d-b0e3-001ec94a0cc1') AND hivr.voided = 0 # HIV status
LEFT OUTER JOIN concept_name hivrn ON hivr.value_coded = hivrn.concept_id AND hivrn.locale = 'fr'

INNER JOIN encounter_provider enpr ON pc.encounter_id = enpr.encounter_id AND enpr.voided = 0

INNER JOIN users u ON enpr.creator = u.user_id

INNER JOIN person_name un ON u.person_id = un.person_id

INNER JOIN provider pr ON enpr.provider_id = pr.provider_id

INNER JOIN person_name cln ON pr.person_id = cln.person_id

WHERE p.voided = 0

GROUP BY pc.encounter_id

ORDER BY RAND()
LIMIT 25;
