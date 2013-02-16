#!/bin/bash

USER=root
PASSWD=xian
OPENMRS=openmrs

PATH=$PATH:/usr/local/mysql/bin

TABLES="address_hierarchy_address_to_entry_map address_hierarchy_entry address_hierarchy_level"
for t in $TABLES; do
	echo $t
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set creator=1;"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set changed_by=1"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set retired_by=1;"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set voided_by=1;"
done

TABLES="concept concept_answer concept_class concept_complex concept_datatype concept_description concept_map_type concept_name concept_name_tag concept_name_tag_map concept_numeric concept_proposal concept_proposal_tag_map concept_reference_map concept_reference_source concept_reference_term concept_reference_term_map concept_set concept_set_derived concept_state_conversion concept_stop_word"
for t in $TABLES; do
	echo $t
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set creator=1;"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set changed_by=1"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set retired_by=1;"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set voided_by=1;"
done

# CAREFUL: Need to update concept index after import through Admin UI???

TABLES="location location_attribute location_attribute_type location_tag location_tag_map"
for t in $TABLES; do
	echo $t
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set creator=1;"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set changed_by=1"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set retired_by=1;"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set voided_by=1;"
done

TABLES="patient_identifier_type person_attribute_type program program_workflow program_workflow_state encounter_type order_type relationship_type provider_attribute_type provider_attribute reporting_report_design reporting_report_design_resource serialized_object visit_attribute_type visit_type role role_role role_privilege privilege"
for t in $TABLES; do
	echo $t
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set creator=1;"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set changed_by=1"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set retired_by=1;"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set voided_by=1;"
done

TABLES="reporting_report_design reporting_report_design_resource serialized_object"
for t in $TABLES; do
	echo $t
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set creator=1;"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set changed_by=1"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set retired_by=1;"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set voided_by=1;"
done

TABLES="idgen_auto_generation_option idgen_id_pool idgen_identifier_source idgen_log_entry idgen_pooled_identifier idgen_remote_source idgen_reserved_identifier idgen_seq_id_gen"
for t in $TABLES; do
	echo $t
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set creator=1;"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set changed_by=1"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set retired_by=1;"
	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set voided_by=1;"
done

#TABLES="users"
#for t in $TABLES; do
#	echo $t
#	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set creator=1;"
#	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set changed_by=1"
#	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set retired_by=1;"
#	mysql -u $USER -p$PASSWD $OPENMRS -e "update $t set voided_by=1;"
#done

#update users set password="b2c794a43e09e30cf3ef47b18e34e3e52278e186ade589cca4ec8ab364c82949a9b16f888558dfddea63dd59130122b918353d3f16d789ac8362a536853958c4", salt="686d0b526460213b28d035526835c72379e1a0f885020a9fddf85618be0808b5a396de3cad8a462aa06be0805772fd210f455b05a6f032ea9442f41d23011a5f" where username="admin";
#update users set retired=true where username not in ("admin", "cneumann")

#retire every Person Attribute Type except Telephone Number
