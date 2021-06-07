This directory contains the sql changelogs needed to alter the courses schema objects.
Two files in specific need some explaining
    *initial_setup.sql
    *liquibase_properties

Initial setup.sql needs to be run by an administrator ONCE and prior to the first run of 'liquibase update'.  
It creates the three groups needed for the courses projects and the courses schema.  It then adds a user to the 
SA group.  This user will be used to run the upgrades.
    * courses_sa is the owning account which is used for all creates/grants.
    * courses_reader has read only permissions to all object
    * courses_writer has insert, select, update, delete on all objects

liquibase_properties.  This is used by the liquibase scripts.  It contains the jdbc driver location.  All
other data is fed through the command line
