create or replace package gen_tapis as
/*******************************************************************************
 DDL generator
 12-NOV-2014 Jeffrey Kemp - initial version
 02-FEB-2016 Jeffrey Kemp - major enhancements
 03-NOV-2016 Jeffrey Kemp - adapted for oddgen (SQL Developer plugin)

 Generates code, e.g. for journal tables, triggers, table API packages.

 Uses metadata from Oracle data dictionary to generate code, including some
 guesses based on object naming conventions.

 Templates are retrieved from the TEMPLATES package.
 
 TEMPLATE SYNTAX
 
 Refer to https://bitbucket.org/jk64/jk64-sample-apex-tapi/wiki/Template%20Syntax

 ASSUMPTIONS

 1. All identifiers are named non-case-sensitive, i.e. no double-quote
    delimiters required.
 
*******************************************************************************/

type key_value_array is table of varchar2(32767) index by varchar2(4000);
null_kv_array key_value_array;

-- oddgen PL/SQL data types
subtype string_type is varchar2(1000 char);
subtype param_type is varchar2(60 char);
type t_string is table of string_type;
type t_param is table of string_type index by param_type;
type t_lov is table of t_string index by param_type;

-- oddgen api routines
function get_name return varchar2;
function get_description return varchar2;
function get_object_types return t_string;
function get_object_names(in_object_type in varchar2) return t_string;
function get_params (in_object_type in varchar2,in_object_name in varchar2) return t_param;
function get_ordered_params(in_object_type in varchar2, in_object_name in varchar2) return t_string;
function get_lov (in_object_type in varchar2,in_object_name in varchar2,in_params in t_param) return t_lov;
function generate (in_object_type in varchar2,in_object_name in varchar2,in_params in t_param) return clob;

-- list all the primary key columns for the table
function pk_cols (table_name in varchar2) return varchar2 result_cache;

-- return the column name for a surrogate key column associated with a sequence (by naming convention)
-- e.g. EMP_ID is single-column primary key and sequence EMP_ID_SEQ exists
function surrogate_key_column (table_name in varchar2) return varchar2 result_cache;
-- return the sequence name for a surrogate key column
function surrogate_key_sequence (table_name in varchar2) return varchar2 result_cache;

-- Evaluate the given template, attempt to execute it
-- template_name - may be the name of a template (taken from the default
--                 TEMPLATES package) or a template from a specified alternate
--                 package (e.g. MYTEMPLATES.TEMPLATENAME)
-- If raise_ddl_exceptions is false, the procedure will merely log any errors
-- if the DDL fails rather than raise them.
procedure gen
  (template_name        in varchar2
  ,table_name           in varchar2
  ,placeholders         in key_value_array := null_kv_array
  ,raise_ddl_exceptions in boolean := true);

-- returns template as CLOB (does not execute)
function gen
  (template_name        in varchar2
  ,table_name           in varchar2
  ,placeholders         in key_value_array := null_kv_array
  ) return clob;

-- Creates or Alters the journal table to match the given table
-- NOTE: does not alter journal table columns - so if you modify a column in the
-- table, you need to make the same change to the journal table yourself
procedure journal_table
  (table_name           in varchar2
  ,raise_ddl_exceptions in boolean := true);

-- Creates or re-creates the journal trigger
procedure journal_trigger
  (table_name           in varchar2
  ,raise_ddl_exceptions in boolean := true);

-- Recreate/alter all journal tables and triggers
procedure all_journals (journal_triggers in boolean := true);

-- Regenerate TAPI for a table (or for all tables)
procedure all_tapis (table_name in varchar2 := null);

end gen_tapis;
/
