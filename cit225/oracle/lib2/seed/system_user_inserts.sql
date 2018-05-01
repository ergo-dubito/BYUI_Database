-- ------------------------------------------------------------------
--  Program Name:   system_user_inserts.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  26-Jan-2018
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ------------------------------------------------------------------
-- This creates tables, sequences, indexes, and constraints necessary
-- to begin lesson #3. Demonstrates proper process and syntax.
-- ------------------------------------------------------------------

-- Insert statement demonstrates a mandatory-only column override signature.
-- ------------------------------------------------------------------
-- TIP: When a comment ends the last line, you must use a forward slash on
--      on the next line to run the statement rather than a semicolon.
-- ------------------------------------------------------------------

-- --------------------------------------------------------
--  Step #1
--  --------
--  Insert three new DBAs into the system_user table.
-- --------------------------------------------------------
INSERT
INTO system_user
( system_user_id
, system_user_name
, system_user_group_id
, system_user_type
, last_name
, first_name
, created_by
, creation_date
, last_updated_by
, last_update_date)
VALUES
( system_user_s1.nextval                          -- system_user_id
,'DBA3'                                           -- system_user_name
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'SYSTEM_USER'
  AND      common_lookup_type = 'DBA')            -- system_user_group_id            
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'SYSTEM_USER'
  AND      common_lookup_type = 'SYSTEM_GROUP')   -- system_user_type
,'Adams'                                          -- last_name
,'Samuel'                                         -- middle_name
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
, SYSDATE                                         -- creation_date
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
, SYSDATE                                         -- last_update_date
);

INSERT
INTO system_user
( system_user_id
, system_user_name
, system_user_group_id
, system_user_type
, last_name
, first_name
, created_by
, creation_date
, last_updated_by
, last_update_date)
VALUES
( system_user_s1.nextval                          -- system_user_id
,'DBA4'                                           -- system_user_name
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'SYSTEM_USER'
  AND      common_lookup_type = 'DBA')            -- system_user_group_id            
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'SYSTEM_USER'
  AND      common_lookup_type = 'SYSTEM_GROUP')   -- system_user_type
,'Henry'                                          -- last_name
,'Patrick'                                        -- middle_name
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
, SYSDATE                                         -- creation_date
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
, SYSDATE                                         -- last_update_date
);

INSERT
INTO system_user
( system_user_id
, system_user_name
, system_user_group_id
, system_user_type
, last_name
, first_name
, created_by
, creation_date
, last_updated_by
, last_update_date)
VALUES
( system_user_s1.nextval                          -- system_user_id
,'DBA5'                                           -- system_user_name
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'SYSTEM_USER'
  AND      common_lookup_type = 'DBA')            -- system_user_group_id            
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'SYSTEM_USER'
  AND      common_lookup_type = 'SYSTEM_GROUP')   -- system_user_type
,'Manmohan'                                       -- last_name
,'Puri'                                           -- middle_name
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
, SYSDATE                                         -- creation_date
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
, SYSDATE                                         -- last_update_date
);

-- --------------------------------------------------------
--  Step #2
--  --------
--  Display inserted rows from the system_user table.
-- --------------------------------------------------------
SET NULL '<Null>'
COL system_user_lab_id        FORMAT  9999
COL system_user_group_id  FORMAT  9999
COL system_user_type      FORMAT  9999
COL system_user_name      FORMAT  A10
COL full_user_name        FORMAT  A30
SELECT   system_user_lab_id
,        system_user_group_id
,        system_user_type
,        system_user_name
,        CASE
           WHEN last_name IS NOT NULL THEN
             last_name || ', ' || first_name || ' ' || middle_name
         END AS full_user_name
FROM     system_user_lab;

-- Commit inserts.
COMMIT;

