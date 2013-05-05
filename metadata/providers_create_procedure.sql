-- stored procedure to only insert a provider record if it does not yet exist
-- note that a conditional insert occurs based on the global property default_location_id

-- unfortunately the internal provider_ids will not be unique across the 4 disconnected laptops
-- any later attempt to unify the systems again needs to re-consolidate the providers and all 
-- foreign key relations. i couldn't find a better way because person_ids and users_ids are
-- evolving in different ways on the different laptops.
 
DROP PROCEDURE IF EXISTS create_provider_for_location;

DELIMITER //

CREATE PROCEDURE create_provider_for_location(firstname VARCHAR(50), lastname VARCHAR(50), location_id INT(11))
BEGIN
  DECLARE default_location_id INT(11);
  	
  select l.location_id INTO default_location_id from location l, global_property gp where l.name = gp.property_value AND gp.property='default_location';

  IF location_id = -1 OR location_id = default_location_id THEN
    IF NOT EXISTS
      (
        SELECT * FROM person p, person_name pn, provider pr 
        WHERE pn.given_name = firstname AND pn.family_name = lastname AND p.person_id = pn.person_id AND p.person_id = pr.person_id AND p.voided=0 AND pn.voided=0 AND pr.retired=0
      )
    THEN
      START TRANSACTION;
      set @person_id := (select max(person_id)+1 from person);
      set @person_name_id := (select max(person_name_id)+1 from person_name);
      set @provider_id := (select max(provider_id)+1 from provider);

      INSERT INTO `person` VALUES (@person_id,'M',NULL,0,0,NULL,NULL,1,'2013-04-28 14:17:47',NULL,NULL,0,NULL,NULL,NULL,uuid());
      INSERT INTO `person_name` VALUES (@person_name_id,1,@person_id,NULL,firstname,NULL,NULL,lastname,NULL,NULL,NULL,1,'2013-04-28 14:17:47',0,NULL,NULL,NULL,NULL,NULL,uuid());
      INSERT INTO `provider` VALUES (@provider_id,@person_id,NULL,NULL,1,'2013-04-28 14:17:47',NULL,NULL,0,NULL,NULL,NULL,uuid());
      COMMIT;
    END IF;
  END IF;
END//

DELIMITER ;
