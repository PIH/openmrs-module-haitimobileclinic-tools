#!/bin/bash

USER=root
PASSWD=xian
OPENMRS=openmrs_zanmi

PATH=$PATH:/usr/local/mysql/bin

mysqldump -u $USER -p$PASSWD $OPENMRS -r /tmp/dump_addresshierarchy.sql --tables address_hierarchy_address_to_entry_map address_hierarchy_entry address_hierarchy_level

mysqldump -u $USER -p$PASSWD $OPENMRS -r /tmp/dump_concepts.sql --tables concept concept_answer concept_class concept_complex concept_datatype concept_description concept_map_type concept_name concept_name_tag concept_name_tag_map concept_numeric concept_proposal concept_proposal_tag_map concept_reference_map concept_reference_source concept_reference_term concept_reference_term_map concept_set concept_set_derived concept_state_conversion concept_stop_word 

mysqldump -u $USER -p$PASSWD $OPENMRS -r /tmp/dump_locations.sql --tables location location_attribute location_attribute_type location_tag location_tag_map

mysqldump -u $USER -p$PASSWD $OPENMRS -r /tmp/dump_div.sql --tables patient_identifier_type person_attribute_type program program_workflow program_workflow_state encounter_type order_type relationship_type provider_attribute_type provider_attribute reporting_report_design reporting_report_design_resource serialized_object visit_attribute_type visit_type role role_role role_privilege privilege 

mysqldump -u $USER -p$PASSWD $OPENMRS -r /tmp/dump_reports.sql --tables reporting_report_design reporting_report_design_resource serialized_object
sed 's/<creator id=\\\"[0-9]\{1,6\}\\\" uuid=\\\".\{36\}\\\"/<creator id=\\\"1\\\" uuid=\\\"5fbd8100-6f68-11e2-afaa-82871dfc9909\\\"/g' /tmp/dump_reports.sql > /tmp/dump_reports_cleaned1.sql
sed 's/<changedBy id=\\\"[0-9]\{1,6\}\\\" uuid=\\\".\{36\}\\\"/<changedBy id=\\\"1\\\" uuid=\\\"5fbd8100-6f68-11e2-afaa-82871dfc9909\\\"/g' /tmp/dump_reports_cleaned1.sql > /tmp/dump_reports_cleaned2.sql
sed 's/<changedBy reference=\\\"[0-9]\{1,6\}\\\"/<changedBy reference=\\\"1\\\"/g' /tmp/dump_reports_cleaned2.sql > /tmp/dump_reports_cleaned3.sql

# mysqldump -u $USER -p$PASSWD $OPENMRS -r /tmp/dump_users.sql --tables users

mysqldump -u $USER -p$PASSWD $OPENMRS -r /tmp/dump_idgen.sql --tables idgen_auto_generation_option idgen_id_pool idgen_identifier_source idgen_log_entry idgen_pooled_identifier idgen_remote_source idgen_reserved_identifier idgen_seq_id_gen
