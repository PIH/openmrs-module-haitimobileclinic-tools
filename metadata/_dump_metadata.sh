#!/bin/bash

USER=root
PASSWD=xian
OPENMRS=openmrs

mysqldump -u $USER -p$PASSWD $OPENMRS -r dump_addresshierarchy.sql --skip-dump-date --tables address_hierarchy_address_to_entry_map address_hierarchy_entry address_hierarchy_level

mysqldump -u $USER -p$PASSWD $OPENMRS -r dump_concepts.sql --skip-dump-date --tables concept concept_answer concept_class concept_complex concept_datatype concept_description concept_map_type concept_name concept_name_tag concept_name_tag_map concept_numeric concept_proposal concept_proposal_tag_map concept_reference_map concept_reference_source concept_reference_term concept_reference_term_map concept_set concept_set_derived concept_state_conversion concept_stop_word concept_word

mysqldump -u $USER -p$PASSWD $OPENMRS -r dump_locations.sql --skip-dump-date --tables location location_attribute location_attribute_type location_tag location_tag_map

mysqldump -u $USER -p$PASSWD $OPENMRS -r dump_misc.sql --skip-dump-date --tables person_attribute_type program program_workflow program_workflow_state encounter_type order_type relationship_type provider_attribute_type provider_attribute visit_attribute_type visit_type role role_role role_privilege privilege 

mysqldump -u $USER -p$PASSWD $OPENMRS -r dump_reports.sql --skip-dump-date --tables reporting_report_design reporting_report_design_resource serialized_object
grep -l "<changedBy reference=" dump_reports.sql

if [ $? -ne 1 ]; then
  echo "Looks like we found a <changedBy reference= in serialized_object."
  echo "Unsure where this came from (and what it might mean), but it seems"
  echo "that at least the installed production systems don't like this"
  echo "and break during de-serialization."
  echo ""
  echo "Either this is read by someone who has a clue what's going on, or"
  echo "manually apply this replacement to dump_reports.sql:"
  echo "  <changedBy reference=\"2\"/>"
  echo "  -->"
  echo "  <changedBy id=\"3\" uuid=\"00102b99-320d-47fa-95cb-8bb44908265\"/>"
  echo ""
  echo "In any case simply DO NOT continue to use this metadata dump."
  echo ""
fi 

mysqldump -u $USER -p$PASSWD $OPENMRS -r dump_roles.sql --skip-dump-date --tables role role_privilege role_role

mysqldump -u $USER -p$PASSWD $OPENMRS -r dump_scheduler.sql --skip-dump-date --tables scheduler_task_config scheduler_task_config_property

mysqldump -u $USER -p$PASSWD $OPENMRS -r dump_forms.sql --skip-dump-date --tables form htmlformentry_html_form

mysqldump -u $USER -p$PASSWD $OPENMRS -r dump_identifiers.sql --skip-dump-date --tables patient_identifier_type idgen_auto_generation_option idgen_id_pool idgen_identifier_source idgen_pooled_identifier idgen_remote_source idgen_reserved_identifier
