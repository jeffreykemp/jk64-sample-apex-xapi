create or replace PACKAGE GEN_TAPIS AS
/*******************************************************************************
 DDL generator
 12-NOV-2014 Jeffrey Kemp - initial version
 02-FEB-2016 Jeffrey Kemp - major enhancements
 03-NOV-2016 Jeffrey Kemp - adapted for oddgen (SQL Developer plugin)

 Generates code, e.g. for journal tables, triggers, table API packages and Apex
 API packages.

 Uses metadata from Oracle data dictionary to generate code, including some
 guesses based on object naming conventions.

 Templates are retrieved from the TEMPLATES package by default. Other packages
 may be used.
 
 TEMPLATE SYNTAX
 
 Refer to https://bitbucket.org/jk64/jk64-sample-apex-tapi/wiki/Template%20Syntax

 ASSUMPTIONS

 1. All tables and columns are named non-case-sensitive, i.e. no double-quote
    delimiters required.
 2. (APEX API) All columns are max 26 chars long (in order to accommodate Apex
    "P99_.." naming convention)
 
 If any of the above do not hold true, the TAPI will probably need to be
 manually adjusted to work. All TAPIs generated should be reviewed prior to
 use anyway.
*******************************************************************************/

TYPE key_value_array IS TABLE OF VARCHAR2(32767) INDEX BY VARCHAR2(4000);
null_kv_array key_value_array;

-- oddgen PL/SQL data types
SUBTYPE string_type IS VARCHAR2(1000 CHAR);
SUBTYPE param_type IS VARCHAR2(60 CHAR);
TYPE t_string IS TABLE OF string_type;
TYPE t_param IS TABLE OF string_type INDEX BY param_type;
TYPE t_lov IS TABLE OF t_string INDEX BY param_type;

-- oddgen api routines
FUNCTION get_name RETURN VARCHAR2;
FUNCTION get_description RETURN VARCHAR2;
FUNCTION get_object_types RETURN t_string;
FUNCTION get_object_names(in_object_type IN VARCHAR2) RETURN t_string;
FUNCTION get_params (in_object_type IN VARCHAR2,in_object_name IN VARCHAR2) RETURN t_param;
FUNCTION get_ordered_params(in_object_type IN VARCHAR2, in_object_name IN VARCHAR2) RETURN t_string;
FUNCTION get_lov (in_object_type IN VARCHAR2,in_object_name IN VARCHAR2,in_params IN t_param) RETURN t_lov;
FUNCTION generate (in_object_type IN VARCHAR2,in_object_name IN VARCHAR2,in_params IN t_param) RETURN CLOB;

-- Evaluate the given template, attempt to execute it
-- template_name - may be the name of a template (taken from the default
--                 TEMPLATES package) or a template from a specified alternate
--                 package (e.g. MYTEMPLATES.TEMPLATENAME)
-- If raise_ddl_exceptions is false, the procedure will merely log any errors
-- if the DDL fails rather than raise them.
PROCEDURE gen
  (template_name        IN VARCHAR2
  ,table_name           IN VARCHAR2
  ,placeholders         IN key_value_array := null_kv_array
  ,raise_ddl_exceptions IN BOOLEAN := TRUE);

-- returns template as CLOB (does not execute)
FUNCTION gen
  (template_name        IN VARCHAR2
  ,table_name           IN VARCHAR2
  ,placeholders         IN key_value_array := null_kv_array
  ) RETURN CLOB;

-- Creates or Alters the journal table to match the given table
-- NOTE: does not alter journal table columns - so if you modify a column in the
-- table, you need to make the same change to the journal table yourself
PROCEDURE journal_table
  (table_name           IN VARCHAR2
  ,raise_ddl_exceptions IN BOOLEAN := TRUE
  ,journal_indexes      IN BOOLEAN := FALSE);

-- Creates or re-creates the journal trigger
PROCEDURE journal_trigger
  (table_name           IN VARCHAR2
  ,raise_ddl_exceptions IN BOOLEAN := TRUE);

-- Recreate/alter all journal tables and triggers
PROCEDURE all_journals
  (journal_triggers IN BOOLEAN := TRUE
  ,journal_indexes  IN BOOLEAN := FALSE);

-- Regenerate all TAPIs
PROCEDURE all_tapis (table_name IN VARCHAR2 := NULL);

-- Regenerate all Apex APIs
PROCEDURE all_apexapis (table_name IN VARCHAR2 := NULL);

-- Regenerate all APIs and journal for the table.
PROCEDURE all_apis
  (table_name      IN VARCHAR2
  ,journal_indexes IN BOOLEAN := FALSE
  ,apex_api        IN BOOLEAN := TRUE);

END GEN_TAPIS;
