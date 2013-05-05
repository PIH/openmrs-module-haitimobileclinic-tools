Setting up environment
======================
The setup of a runtime/production environment for a Windows 7 installation is described in the separate 'Installation Guide'. The development environment follows a typical OpenMRS dev installation. This module was developed on a MacOS X system. Note that the automated 'Update EMR' process only works for a Win 7 installation.

For the initial setup of the OpenMRS DB a clean OpenMRS installation with an empty DB is recommended. Afterwards the metadata as described below can be applied to it. Double check with the installation guide to make sure the system is configured through the global properties. Alternatively grab one of the 4 production systems (one for each location) and use the preconfigured DB from there. 

Deploying new versions ('Update EMR')
=====================================
Almost all elements of the OpenMRS installation can be updated remotely through the 'Update EMR' process. All these elements are kept in various folders of this git repository.

webapp
------
The whole OpenMRS webapp can be updated by placing a newer version in the webapp folder. Note that potential schema migration should be given a second thought.

modules
-------
The set of all required modules (both custom and OpenMRS build-in) is deployed form the modules folder. Note that potential schema migration should be given a second thought.

metadata
--------
To ensure a consistent set of metadata the relevant parts can be 'externalized' from a dev/staging system and then be automatically delivery and deployed to the production systems. For this the specific dumps of the metadata tables are created and stored in the metadata directory through the bash script _/dump_metadata.sh (so far used under MacOS X).

metadata - Concept dictionary
-----------------------------

metadata - Providers
--------------------
On every system providers can by manually added. Additionally a list of providers can be delivered to all systems through the update process. Check the file metadata/providers_2013_april.sql for an example.

metadata - Reports
------------------
Most of the reports originated from the Lacolline installation and were adapted to the needs of this project. Most used report elements (mainly report definitions and data sets) that are currently used are marked with an _ as a prefix of the name. The other elements remained unchanged and most likely will require some tweaks if there will be the need to make them available as well. Apart from this reports are distributed through the EMR update process as well.

metadata - HTML Forms
---------------------
The source of the HTML Forms is intended to be kept as separate files in the folder 'openmrs-forms'. However they are not automatically applied during installation/update from there, but taken from the MySQL dump files. As a consequence it might be that the files in the openmrs-forms folder are outdated as it is too easy to forget to manually update the files. Maybe it makes sense to remove them from the filesystem.

metadata - Address hierarchy
----------------------------
During startup of the module the HaitiMobileClinicActivator imports the specified CSV file with the address hierarchy. This should only happen once and should be done from the 'master'/development system which is used to update the other metadata elements as well. Afterwards the usual update way distributes the new address hierarchy to the systems.

Implementation notes
====================

Backup / Restore
----------------
A scripted (Windows batch file) backup/restore process is available on every system. With this a quick dump of the whole OpenMRS installation folder including a dump of the DB can be stored on a flash drive.

Session defaults
----------------
A few data entry elements are stored in the HTTP session and are typically automatically added to any encounter saved. This is either done explicitly through the code of the custom Point-of-Care part, or they are added as readonly fields to the HTML forms and with this implicitly are stored. All session variables are prefixed with a "session" string and store the
- Date
- Mobile Clinic Location Name (determined by the Address Hierarchy), LocationAddressHierarchyId
- GPS coordinates (for north and west)
- Name and ID of static facility
- ChwName1, ChwName2, ChwName3
- NecName1, NecName2

Additional scripts
------------------
A few scripts mainly to ease remote support are installed.
- delete_all_patients.bat: Removes all patient related data from a system. This is useful for e.g. training/testing purpoe if the system needs to go back to 'point zero'. Of course this should not be done with a production system; at least not without running a backup first.
- open_mysql_shell.bat: Opens an MySQL shell with admin rights (helpful if someone needs to copy/paste SQL code on request).

