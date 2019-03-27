create or replace package deploy as
/*******************************************************************************
 Deployment Routines
 02-DEC-2014 Jeffrey Kemp
 08-MAR-2019 Jeffrey Kemp - updated for 18c
 
 WARNING: This package is vulnerable to SQL injection. User-entered data must
          never be passed as parameters to these functions or procedures.
*******************************************************************************/

journal_table_suffix      constant varchar2(30) := '$JN';
context_app_user          constant varchar2(200) := q'[coalesce(sys_context('apex$session','app_user'),sys_context('userenv','session_user'))]';
mview_default_options     constant varchar2(1000) := q'[build deferred refresh complete on demand]';

procedure exec_ddl (ddl in varchar2);

procedure exec_ddl (ddl in clob);

function table_exists (table_name in varchar2) return boolean;

function column_exists
  (table_name     in varchar2
  ,column_name    in varchar2
  ) return boolean;

function constraint_exists (constraint_name in varchar2) return boolean;

function job_exists (job_name in varchar2) return boolean;

procedure create_table
  (table_name        in varchar2
  ,table_ddl         in varchar2
  ,add_standard_cols in boolean := true
  ,setup_vpd         in boolean := true);

procedure create_mview
  (mview_name      in varchar2
  ,mview_qry       in varchar2
  ,mview_options   in varchar2 := MVIEW_DEFAULT_OPTIONS
  ,drop_and_create in boolean := false);

procedure create_sequence
  (sequence_name in varchar2
  ,sequence_ddl  in varchar2 := null); -- null means create the sequence with all default options

-- add a column to a table if it doesn't already exist
-- Set not_null_value to a non-null value to add a "not null" constraint on the column; any existing rows will be updated
-- to "not_null_value".
procedure add_column
  (table_name        in varchar2
  ,column_name       in varchar2
  ,column_definition in varchar2
  ,not_null_value    in varchar2 := null);

-- alter a column's data type by renaming the existing column to a temp name,
-- add the new column, copy the data across (using transformation expression
-- provided) and then drop the temp column
-- WARNING: if there are any multi-column constraints involving the column, it's
-- the caller's responsibility to recreate them afterwards
procedure alter_column
  (table_name    in varchar2
  ,column_name   in varchar2
  ,new_data_type in varchar2
  ,transform_exp in varchar2 := '#VAL#' -- e.g. 'TO_NUMBER(#VAL#) * 100'
  ,not_null      in boolean := false
  );

-- checks if the old column name exists, if it does, renames it; also modifies the journal table if one exists
procedure rename_column
  (table_name    in varchar2
  ,old_name      in varchar2
  ,new_name      in varchar2);

-- checks if the old constraint exists, if it does, renames it
procedure rename_constraint
  (table_name    in varchar2
  ,old_name      in varchar2
  ,new_name      in varchar2);

procedure add_constraint
  (constraint_name in varchar2
  ,constraint_ddl  in varchar2);

procedure create_index
  (index_name   in varchar2
  ,index_target in varchar2);

procedure create_unique_index
  (index_name   in varchar2
  ,index_target in varchar2);

procedure create_dblink
  (dblink_name    in varchar2
  ,dblink_user    in varchar2
  ,dblink_pwd     in varchar2
  ,connect_string in varchar2);

procedure drop_sequence (sequence_name in varchar2);

procedure drop_table
  (table_name in varchar2
  ,purge      in boolean := false);

procedure drop_trigger (trigger_name in varchar2);

procedure drop_index (index_name in varchar2);

procedure drop_column
  (table_name  in varchar2
  ,column_name in varchar2);

procedure drop_dblink (dblink_name in varchar2);

procedure drop_view (view_name in varchar2);

procedure drop_mview (mview_name in varchar2);

procedure drop_type
  (type_name in varchar2
  ,force     in boolean := false);

procedure drop_constraint
  (table_name      in varchar2
  ,constraint_name in varchar2);

procedure drop_all_constraints
  (table_name      in varchar2 := null
  ,constraint_type in varchar2 := null /*(P)rimary, (R)eferential, (U)nique, (C)heck*/);

-- NULL means all fk constraints
procedure drop_fk_constraints (table_name in varchar2 := null);

procedure drop_job (job_name in varchar2);

procedure drop_all_jobs;

-- returns Apex version, e.g. 4, 5, etc.
function apex_major_version return integer;

procedure add_standard_columns
  (table_name in varchar2
  ,vpd        in boolean := true);

procedure add_vpd_policy (table_name in varchar2);

procedure disable_constraints
  (table_name      in varchar2 := null   -- NULL means all enabled constraints
  ,constraint_type in varchar2 := null); -- NULL means all; R for fk constraints

procedure enable_constraints
  (table_name      in varchar2 := null   -- NULL means all disabled constraints
  ,constraint_type in varchar2 := null); -- NULL means all; R for fk constraints

procedure reset_sequence
  (sequence_name in varchar2
  ,next_value    in number);

-- reset the sequence according to the maximum value for the given column in the
-- given table
procedure reset_sequence
  (sequence_name  in varchar2
  ,table_name     in varchar2
  ,id_column_name in varchar2);

-- returns TRUE if this user has the indicated grant on the given object
function is_granted
  (owner          in varchar2
  ,object_name    in varchar2
  ,privilege      in varchar2
  ) return boolean;

-- returns number of invalid objects
function invalid_object_count (object_type in varchar2 := null) return number;

-- list compilation errors to dbms_output
procedure dbms_output_errors
  (object_type in varchar2 := null
  ,object_name in varchar2 := null);

end deploy;
