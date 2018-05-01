/* ================================================================
||   Program Name: create_nds6.sql
||   Date:         2013-07-25
||   Book:         Oracle Database 12c PL/SQL Programming
||   Chapter #:    Chapter 13
||   Author Name:  Michael McLaughlin
|| ----------------------------------------------------------------
||   Contents:
||   ---------
||   This script demonstrates DBMS_SQL querying a row return. 
|| ================================================================*/

-- Unremark for debugging script.
SET ECHO ON
SET FEEDBACK ON
SET PAGESIZE 49999
SET SERVEROUTPUT ON SIZE 1000000

DECLARE
  -- Define explicit record structure.
  target  CLOB;
  source  VARCHAR2(2000) := 'A Mel Brooks classic movie!';
  movie   VARCHAR2(60) := 'Young Frankenstein';
  stmt    VARCHAR2(2000);
BEGIN
  -- Set statement.
  stmt := 'BEGIN '
       || 'UPDATE  item '
       || 'SET     item_desc = empty_clob() '
       || 'WHERE   item_id = '
       || '          (SELECT item_id '
       || '           FROM   item '
       || '           WHERE  item_title = :input) '
       || 'RETURNING item_desc INTO :descriptor;'
       || 'END;';

  EXECUTE IMMEDIATE stmt USING movie, IN OUT target;
  dbms_lob.writeappend(target,LENGTH(source),source);
  COMMIT;
END;
/

SELECT item_desc FROM item WHERE item_title = 'Young Frankenstein';

