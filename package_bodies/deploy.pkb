create or replace package body deploy as
/*******************************************************************************
 Deployment Routines
 2-DEC-2014 Jeffrey Kemp
*******************************************************************************/

journal_table_suffix constant varchar2(30) := '$JN';
context_app_user     constant varchar2(100) := q'[coalesce(sys_context('apex$session','app_user'),sys_context('userenv','session_user'))]';

procedure msg(v in varchar2) is
begin
  dbms_output.put_line(v);
end msg;

procedure assert
  (testcond  in boolean
  ,assertion in varchar2) is
begin
  if not testcond then
    msg(assertion);
    raise_application_error(-20100, 'Assertion failed: ' || assertion);
  end if;
end assert;

procedure exec_ddl (ddl in varchar2) is
begin
  assert(ddl is not null, 'exec_ddl(1): ddl cannot be null');
  execute immediate ddl;
end exec_ddl;

procedure exec_ddl (ddl in clob) is
begin
  assert(ddl is not null, 'exec_ddl(2): ddl cannot be null');
  execute immediate ddl;
end exec_ddl;

function exec_qry (qry in varchar2) return number is
  n number;
begin
  assert(qry is not null, 'exec_qry: qry cannot be null');
  execute immediate qry into n;
  return n;
end exec_qry;

function table_exists (table_name in varchar2) return boolean is
  v_found number;
begin
  assert(table_name is not null, 'table_exists: table_name cannot be null');
  select 1 into v_found
  from   user_tables t
  where  t.table_name = upper(table_exists.table_name);
  return true;
exception
  when no_data_found then
    return false;
end table_exists;

function column_exists
  (table_name     in varchar2
  ,column_name    in varchar2
  ) return boolean is
  v_found number;
begin
  assert(table_name is not null, 'column_exists: table_name cannot be null');
  assert(column_name is not null, 'column_exists: column_name cannot be null');
  select 1 into v_found
  from   user_tab_columns c
  where  c.table_name = upper(column_exists.table_name)
  and    c.column_name = upper(column_exists.column_name);
  return true;
exception
  when no_data_found then
    return false;
end column_exists;

function column_data_type
  (table_name     in varchar2
  ,column_name    in varchar2
  ) return varchar2 is
  data_type user_tab_columns.data_type%type;
begin
  assert(table_name is not null, 'column_data_type: table_name cannot be null');
  assert(column_name is not null, 'column_data_type: column_name cannot be null');
  select c.data_type
  into   data_type
  from   user_tab_columns c
  where  c.table_name = upper(column_data_type.table_name)
  and    c.column_name = upper(column_data_type.column_name);
  return data_type;
end column_data_type;

function constraint_exists (constraint_name in varchar2) return boolean is
  v_found number;
begin
  assert(constraint_name is not null, 'constraint_name cannot be null');
  select 1 into v_found
  from   user_constraints c
  where  c.constraint_name = upper(constraint_exists.constraint_name);
  return true;
exception
  when no_data_found then
    return false;
end constraint_exists;

function job_exists (job_name in varchar2) return boolean is
  v_found number;
begin
  assert(job_name is not null, 'job_exists: job_name cannot be null');
  select 1 into v_found
  from   user_scheduler_jobs t
  where  t.job_name = upper(job_exists.job_name);
  return true;
exception
  when no_data_found then
    return false;
end job_exists;

procedure add_column
  (table_name        in varchar2
  ,column_name       in varchar2
  ,column_definition in varchar2
  ,not_null_value    in varchar2 := null
  ) is
begin
  assert(table_name is not null, 'add_column: table_name cannot be null');
  assert(column_name is not null, 'add_column: column_name cannot be null');
  assert(column_definition is not null, 'add_column: column_definition cannot be null');
  exec_ddl('alter table ' || dbms_assert.simple_sql_name(table_name)
           || ' add ' || dbms_assert.simple_sql_name(column_name)
           || ' ' || column_definition);
  if not_null_value is not null then
    exec_ddl('update ' || dbms_assert.simple_sql_name(table_name) || ' x'
             || ' set ' || dbms_assert.simple_sql_name(column_name)
             || '=' || not_null_value
             || ' where ' || dbms_assert.simple_sql_name(column_name) || ' is null');
    exec_ddl('alter table ' || dbms_assert.simple_sql_name(table_name) || ' modify ' || dbms_assert.simple_sql_name(column_name) || ' not null');
  end if;
exception
  when others then
    if sqlcode not in (-01430 /*column being added already exists in table*/
                      ,-01442 /*column to be modified to NOT NULL is already NOT NULL*/
                      ) then
      raise;
    end if;
end add_column;

-- this should use the same logic as used by the GENERATE package but we want
-- this package to be able to stand alone (i.e. to be deployed and runnable
-- before any other package in the schema)
function journal_table (table_name in varchar2) return varchar2 is
begin
  assert(table_name is not null, 'journal_table: table_name cannot be null');
  return substr(table_name,1,30-length(JOURNAL_TABLE_SUFFIX)) || JOURNAL_TABLE_SUFFIX;
end journal_table;

procedure rename_column
  (table_name    in varchar2
  ,old_name      in varchar2
  ,new_name      in varchar2) is
begin
  assert(table_name is not null, 'rename_column: table_name cannot be null');
  assert(old_name is not null, 'rename_column: old_name cannot be null');
  assert(new_name is not null, 'rename_column: new_name cannot be null');
  if column_exists(table_name, old_name)
  and not column_exists(table_name, new_name) then
    exec_ddl('alter table ' || dbms_assert.simple_sql_name(table_name) || ' rename column ' || dbms_assert.simple_sql_name(old_name) || ' to ' || dbms_assert.simple_sql_name(new_name));
  end if;
  -- rename the column in the journal table, too
  begin
    exec_ddl('alter table ' || dbms_assert.simple_sql_name(journal_table(table_name)) || ' rename column ' || dbms_assert.simple_sql_name(old_name) || ' to ' || dbms_assert.simple_sql_name(new_name));
  exception
    when others then
      if sqlcode != -942 /*table or view does not exist*/ then
        raise;
      end if;
  end;
end rename_column;

-- alter a column's data type by renaming the existing column to a temp name,
-- add the new column, copy the data across (using transformation expression
-- provided) and then drop the temp column
procedure alter_column
  (table_name    in varchar2
  ,column_name   in varchar2
  ,new_data_type in varchar2
  ,transform_exp in varchar2 := '#VAL#' -- e.g. 'TO_NUMBER(#VAL#) * 100'
  ,not_null      in boolean := false
  ) is
begin
  assert(table_name is not null, 'alter_column: table_name cannot be null');
  assert(column_name is not null, 'alter_column: column_name cannot be null');
  assert(new_data_type is not null, 'alter_column: new_data_type cannot be null');
  assert(transform_exp is not null, 'alter_column: transform_exp cannot be null');
  if column_data_type
    (table_name  => table_name
    ,column_name => column_name) != upper(new_data_type) then
    exec_ddl('alter table ' || dbms_assert.simple_sql_name(table_name) || ' rename column ' || dbms_assert.simple_sql_name(column_name) || ' to temp$col');
    exec_ddl('alter table ' || dbms_assert.simple_sql_name(table_name) || ' add ' || dbms_assert.simple_sql_name(column_name) || ' ' || new_data_type);
    exec_ddl('update ' || dbms_assert.simple_sql_name(table_name) || ' set ' || dbms_assert.simple_sql_name(column_name) || '=' || replace(transform_exp,'#VAL#','temp$col'));
    exec_ddl('alter table ' || dbms_assert.simple_sql_name(table_name) || ' drop column temp$col cascade constraints'); -- caller's responsibility to recreate any constraints
    if not_null then
      exec_ddl('alter table ' || dbms_assert.simple_sql_name(table_name) || ' modify ' || dbms_assert.simple_sql_name(column_name) || ' not null');
    end if;
  end if;
end alter_column;

procedure rename_constraint
  (table_name    in varchar2
  ,old_name      in varchar2
  ,new_name      in varchar2) is
begin
  assert(table_name is not null, 'table_name cannot be null');
  assert(old_name is not null, 'old_name cannot be null');
  assert(new_name is not null, 'new_name cannot be null');
  if not constraint_exists(new_name) then
    exec_ddl('alter table '||dbms_assert.simple_sql_name(table_name)||' rename constraint ' || dbms_assert.simple_sql_name(old_name) || ' to ' || dbms_assert.simple_sql_name(new_name));
  end if;
end rename_constraint;

procedure create_table
  (table_name     in varchar2
  ,table_ddl      in varchar2
  ,add_audit_cols in boolean := true) is
  -- warning: has sql injection vulnerability
begin
  assert(table_name is not null, 'create_table: table_name cannot be null');
  assert(table_ddl is not null, 'create_table: table_ddl cannot be null');
  assert(instr(lower(table_ddl),'#name#') > 0, 'create_table: table_ddl should use #NAME# or #name# for table name');
  begin
    exec_ddl(replace(replace(table_ddl
      ,'#NAME#',dbms_assert.simple_sql_name(table_name))
      ,'#name#',lower(dbms_assert.simple_sql_name(table_name))));
    msg('Table created: ' || table_name);
  exception
    when others then
      if sqlcode not in (-942,-955) then
        raise;
      end if;
  end;
  if add_audit_cols then
    deploy.add_audit_cols(table_name);
  end if;
end create_table;

procedure create_mview
  (mview_name      in varchar2
  ,mview_qry       in varchar2
  ,mview_options   in varchar2 := MVIEW_DEFAULT_OPTIONS
  ,drop_and_create in boolean := false) is
begin
  assert(mview_name is not null, 'create_mview: mview_name cannot be null');
  assert(mview_qry is not null, 'create_mview: mview_qry cannot be null');
  if drop_and_create then
    drop_mview(mview_name);
  end if;
  exec_ddl('create materialized view ' || dbms_assert.simple_sql_name(mview_name) || ' ' || mview_options || ' as ' || mview_qry);
  msg('MView created: ' || mview_name);
exception
  when others then
    if sqlcode != -12006 then
      raise;
    end if;
end create_mview;

procedure create_sequence
  (sequence_name in varchar2
  ,sequence_ddl  in varchar2 := null
  ) is
begin
  assert(sequence_name is not null, 'create_sequence: sequence_name cannot be null');
  assert(instr(lower(sequence_ddl),'#name#') > 0, 'add_sequence: sequence_ddl must use #NAME# or #name# for sequence name');
  exec_ddl(replace(replace(nvl(sequence_ddl,'create sequence #NAME#')
          ,'#NAME#',dbms_assert.simple_sql_name(sequence_name))
          ,'#name#',dbms_assert.simple_sql_name(lower(sequence_name))));
  msg('Sequence created: ' || sequence_name);
exception
  when others then
    if sqlcode != -955 then
      raise;
    end if;
end create_sequence;

procedure add_constraint
  (constraint_name in varchar2
  ,constraint_ddl  in varchar2) is
begin
  assert(constraint_name is not null, 'add_constraint: constraint_name cannot be null');
  assert(constraint_ddl is not null, 'add_constraint: constraint_ddl cannot be null');
  assert(instr(lower(constraint_ddl),'#name#') > 0, 'add_constraint: constraint_ddl must use #NAME# or #name# for constraint name');
  exec_ddl(replace(replace(constraint_ddl
    ,'#NAME#',dbms_assert.simple_sql_name(constraint_name))
    ,'#name#',lower(dbms_assert.simple_sql_name(constraint_name))));
  msg('Constraint created: ' || constraint_name);
exception
  when others then
    if sqlcode not in (-2260,-2261,-2264, -2275) then
      raise;
    end if;
end add_constraint;

procedure create_index
  (index_name   in varchar2
  ,index_target in varchar2) is
begin
  assert(index_name is not null, 'create_index: index_name cannot be null');
  assert(index_target is not null, 'create_index: index_target cannot be null');
  exec_ddl('create index ' || dbms_assert.simple_sql_name(index_name) || ' on ' || index_target);
  msg('Index created: ' || index_name);
exception
  when others then
    if sqlcode != -955 then
      raise;
    end if;
end create_index;

procedure create_unique_index
  (index_name   in varchar2
  ,index_target in varchar2) is
begin
  assert(index_name is not null, 'create_unique_index: index_name cannot be null');
  assert(index_target is not null, 'create_unique_index: index_target cannot be null');
  exec_ddl('create unique index ' || dbms_assert.simple_sql_name(index_name) || ' on ' || index_target);
  msg('Index (unique) created: ' || index_name);
exception
  when others then
    if sqlcode != -955 then
      raise;
    end if;
end create_unique_index;

procedure create_dblink
  (dblink_name    in varchar2
  ,dblink_user    in varchar2
  ,dblink_pwd     in varchar2
  ,connect_string in varchar2) is
begin
  assert(dblink_name is not null, 'create_dblink: dblink_name cannot be null');
  assert(dblink_user is not null, 'create_dblink: dblink_user cannot be null');
  assert(dblink_pwd is not null, 'create_dblink: dblink_pwd cannot be null');
  assert(connect_string is not null, 'create_dblink: connect_string cannot be null');
  msg('dblink_name    = ' || dblink_name);
  msg('dblink_user    = ' || dblink_user);
  msg('connect_string = ' || connect_string);
  if dblink_user is null then
    raise_application_error(-20000, 'DB Link User is required');
  end if;
  if dblink_pwd is null then
    raise_application_error(-20000, 'DB Link Password is required');
  end if;
  exec_ddl(replace(replace(replace(replace(
    q'[create database link #NAME# connect to #USER# identified by "#PWD#" using '#CONNECT#']'
    ,'#NAME#',    dbms_assert.simple_sql_name(dblink_name))
    ,'#USER#',    dbms_assert.simple_sql_name(dblink_user))
    ,'#PWD#',     dblink_pwd)
    ,'#CONNECT#', connect_string));
  msg('DB Link created: ' || dblink_name);
exception
  when others then
    if sqlcode != -2011 then
      raise;
    end if;
end create_dblink;

procedure drop_sequence (sequence_name in varchar2) is
begin
  assert(sequence_name is not null, 'drop_sequence: sequence_name cannot be null');
  exec_ddl('drop sequence ' || dbms_assert.simple_sql_name(sequence_name));
  msg('Sequence dropped: ' || sequence_name);
exception
  when others then
    if sqlcode != -2289 then
      raise;
    end if;
end drop_sequence;

procedure drop_table
  (table_name in varchar2
  ,purge      in boolean := false) is
begin
  assert(table_name is not null, 'drop_table: table_name cannot be null');
  exec_ddl('drop table ' || dbms_assert.simple_sql_name(table_name) || ' cascade constraints ' || case when purge then ' purge' end);
  msg('Table dropped: ' || table_name);
exception
  when others then
    if sqlcode != -942 then
      raise;
    end if;
end drop_table;

procedure drop_trigger (trigger_name in varchar2) is
begin
  assert(trigger_name is not null, 'drop_trigger: trigger_name cannot be null');
  exec_ddl('drop trigger ' || dbms_assert.simple_sql_name(trigger_name));
  msg('Trigger dropped: ' || trigger_name);
exception
  when others then
    if sqlcode != -4080 then
      raise;
    end if;
end drop_trigger;

procedure drop_index (index_name in varchar2) is
begin
  assert(index_name is not null, 'drop_index: index_name cannot be null');
  exec_ddl('drop index ' || dbms_assert.simple_sql_name(index_name));
  msg('Index dropped: ' || index_name);
exception
  when others then
    if sqlcode != -1418 then
      raise;
    end if;
end drop_index;

procedure drop_column
  (table_name  in varchar2
  ,column_name in varchar2) is
begin
  assert(table_name is not null, 'drop_column: table_name cannot be null');
  assert(column_name is not null, 'drop_column: column_name cannot be null');
  exec_ddl('alter table ' || dbms_assert.simple_sql_name(table_name) || ' drop column ' || dbms_assert.simple_sql_name(column_name));
  msg('Column dropped: ' || column_name);
exception
  when others then
    if sqlcode != -904 then
      raise;
    end if;
end drop_column;

procedure drop_dblink (dblink_name in varchar2) is
begin
  assert(dblink_name is not null, 'drop_dblink: dblink_name cannot be null');
  exec_ddl('drop database link ' || dbms_assert.simple_sql_name(dblink_name));
  msg('DB Link dropped: ' || dblink_name);
exception
  when others then
    if sqlcode != -2024 then
      raise;
    end if;
end drop_dblink;

procedure drop_view (view_name in varchar2) is
begin
  assert(view_name is not null, 'drop_view: view_name cannot be null');
  exec_ddl('drop view ' || dbms_assert.simple_sql_name(view_name));
  msg('View dropped: ' || view_name);
exception
  when others then
    if sqlcode != -942 then
      raise;
    end if;
end drop_view;

procedure drop_mview (mview_name in varchar2) is
begin
  assert(mview_name is not null, 'drop_mview: mview_name cannot be null');
  exec_ddl('drop materialized view ' || dbms_assert.simple_sql_name(mview_name));
  msg('MView dropped: ' || mview_name);
exception
  when others then
    if sqlcode != -12003 then
      raise;
    end if;
end drop_mview;

procedure drop_type
  (type_name in varchar2
  ,force     in boolean := false) is
begin
  assert(type_name is not null, 'drop_type: type_name cannot be null');
  exec_ddl('drop type ' || dbms_assert.simple_sql_name(type_name) || case when force then ' force' end);
  msg('Type dropped: ' || type_name);
exception
  when others then
    if sqlcode != -4043 then
      raise;
    end if;
end drop_type;

procedure drop_constraint
  (table_name      in varchar2
  ,constraint_name in varchar2) is
begin
  assert(table_name is not null, 'drop_constraint: table_name cannot be null');
  assert(constraint_name is not null, 'drop_constraint: constraint_name cannot be null');
  exec_ddl('alter table ' || dbms_assert.simple_sql_name(table_name) || ' drop constraint ' || dbms_assert.simple_sql_name(constraint_name));
  msg('Constraint dropped: ' || constraint_name);
exception
  when others then
    if sqlcode != -2443 then
      raise;
    end if;
end drop_constraint;

procedure drop_all_constraints
  (table_name      in varchar2 := null
  ,constraint_type in varchar2 := null) is
begin
  assert(table_name is not null, 'table_name cannot be null');
  assert(constraint_type is not null, 'constraint_type cannot be null');
  for r in (select c.table_name
                  ,c.constraint_name
            from   user_constraints c
            where  (c.table_name = upper(drop_all_constraints.table_name) or drop_all_constraints.table_name is null)
            and    (c.constraint_type = upper(drop_all_constraints.constraint_type) or drop_all_constraints.constraint_type is null)
            order by 1,2
           ) loop
    exec_ddl('alter table ' || r.table_name || ' drop constraint ' || r.constraint_name);
    msg('Drop FK Constraint: ' || r.table_name || '.' || r.constraint_name);
  end loop;
end drop_all_constraints;

procedure drop_fk_constraints (table_name in varchar2 := null) is
begin
  assert(table_name is not null, 'drop_fk_constraints: table_name cannot be null');
  for r in (select c.table_name
                  ,c.constraint_name
            from   user_constraints c
            where  (c.table_name = upper(drop_fk_constraints.table_name)
                    or drop_fk_constraints.table_name is null)
            and    c.constraint_type = 'R'
            order by 2
           ) loop
    exec_ddl('alter table ' || r.table_name || ' drop constraint ' || r.constraint_name);
    msg('Drop FK Constraint: ' || table_name || '.' || r.constraint_name);
  end loop;
end drop_fk_constraints;

procedure drop_job (job_name in varchar2) is
begin
  assert(job_name is not null, 'drop_job: job_name cannot be null');
  dbms_scheduler.drop_job(job_name);
  msg('Drop job: ' || job_name);
exception
  when others then
    if sqlcode != -27475 then
      raise;
    end if;
end drop_job;

procedure drop_all_jobs is
begin
  for r in (select job_name from user_scheduler_jobs) loop
    drop_job(r.job_name);
  end loop;
end drop_all_jobs;

function apex_major_version return integer is
  ret apex_release.version_no%type;
begin
  -- e.g. extract "5" from "5.0.2.00.07"
  select substr(version_no, 1, instr(version_no,'.')-1)
  into   ret
  from   apex_release;
  return to_number(ret);
end apex_major_version;

procedure add_audit_cols (table_name in varchar2) is
begin
  assert(table_name is not null, 'add_audit_cols: table_name cannot be null');
  add_column
    (table_name        => table_name
    ,column_name       => 'created_by'
    ,column_definition => 'varchar2(100 char) default on null ' || context_app_user
    ,not_null_value    => context_app_user);
  add_column
    (table_name        => table_name
    ,column_name       => 'created_dt'
    ,column_definition => 'date default on null sysdate'
    ,not_null_value    => 'sysdate');
  add_column
    (table_name        => table_name
    ,column_name       => 'last_updated_by'
    ,column_definition => 'varchar2(100 char) default on null ' || context_app_user
    ,not_null_value    => context_app_user);
  add_column
    (table_name        => table_name
    ,column_name       => 'last_updated_dt'
    ,column_definition => 'date default on null sysdate'
    ,not_null_value    => 'sysdate');
  add_column
    (table_name        => table_name
    ,column_name       => 'version_id'
    ,column_definition => 'integer default on null 1'
    ,not_null_value    => '1');
  -- for audit columns that already existed, make sure their defaults are set
  exec_ddl('alter table ' || dbms_assert.simple_sql_name(table_name) || ' modify created_by default on null ' || context_app_user);
  exec_ddl('alter table ' || dbms_assert.simple_sql_name(table_name) || ' modify created_dt default on null sysdate');
  exec_ddl('alter table ' || dbms_assert.simple_sql_name(table_name) || ' modify last_updated_by default on null ' || context_app_user);
  exec_ddl('alter table ' || dbms_assert.simple_sql_name(table_name) || ' modify last_updated_dt default on null sysdate');
  exec_ddl('alter table ' || dbms_assert.simple_sql_name(table_name) || ' modify version_id default on null 1');
end add_audit_cols;

procedure disable_constraints
  (table_name      in varchar2 := null
  ,constraint_type in varchar2 := null) is
begin
  for r in (select uc.table_name
                  ,uc.constraint_name
                  ,uc.constraint_type
            from   user_constraints uc
            where  (uc.table_name = disable_constraints.table_name
                    or disable_constraints.table_name is null)
            and    (uc.constraint_type = disable_constraints.constraint_type
                    or disable_constraints.constraint_type is null)
            and    uc.status = 'ENABLED'
           ) loop
    exec_ddl('alter table ' || r.table_name || ' disable constraint ' || r.constraint_name || case when r.constraint_type='P' then ' cascade' end);
  end loop;
end disable_constraints;

procedure enable_constraints
  (table_name      in varchar2 := null
  ,constraint_type in varchar2 := null) is
  count_errors number;
begin
  for r in (select uc.table_name
                  ,uc.constraint_name
            from   user_constraints uc
            where  (uc.table_name = enable_constraints.table_name
                    or enable_constraints.table_name is null)
            and    (uc.constraint_type = enable_constraints.constraint_type
                    or enable_constraints.constraint_type is null)
            and    uc.status = 'DISABLED'
            order by case when uc.constraint_type in ('P','U') then 1 else 2 end
           ) loop
    begin
      exec_ddl('alter table ' || r.table_name || ' enable constraint ' || r.constraint_name);
    exception
      when others then
        if sqlcode = -02298 /*cannot validate - parent keys not found*/ then
          count_errors := count_errors + 1;
          msg(r.table_name || ' ' || r.constraint_name || ': cannot validate - parent keys not found');
        else
          raise;
        end if;
    end;
  end loop;
  if count_errors > 0 then
    raise_application_error(-20001, 'One or more constraints could not be enabled (parent keys not found)');
  end if;
end enable_constraints;

procedure reset_sequence
  (sequence_name in varchar2
  ,next_value    in number) is
  curr_value number;
  diff       number;
  min_value  user_sequences.min_value%type;
begin
  assert(sequence_name is not null, 'reset_sequence(1): sequence_name cannot be null');
  assert(next_value is not null, 'reset_sequence(1): next_value cannot be null');

  select us.min_value
  into   min_value
  from   user_sequences us
  where  us.sequence_name = reset_sequence.sequence_name;

  curr_value := exec_qry('select ' || dbms_assert.simple_sql_name(sequence_name) || '.nextval from DUAL');

  if next_value < min_value then
    diff := min_value - curr_value;
  else
    diff := next_value - curr_value - 1;
  end if;

  if diff = 0
  or curr_value + diff < min_value then
    return;
  end if;

  msg('reset_sequence ' || sequence_name || ' next=' || next_value || ' curr=' || curr_value || ' diff=' || diff || ' min=' || min_value);

  exec_ddl('alter sequence ' || dbms_assert.simple_sql_name(sequence_name) || ' increment by ' || diff || ' minvalue ' || min_value);

  diff := exec_qry('select ' || dbms_assert.simple_sql_name(sequence_name) || '.nextval from DUAL');

  exec_ddl('alter sequence ' || dbms_assert.simple_sql_name(sequence_name) || ' increment by 1 minvalue ' || min_value);

end reset_sequence;

procedure reset_sequence
  (sequence_name  in varchar2
  ,table_name     in varchar2
  ,id_column_name in varchar2) is
  max_id number;
begin
  assert(sequence_name is not null, 'reset_sequence(2): sequence_name cannot be null');
  assert(table_name is not null, 'reset_sequence(2): table_name cannot be null');
  assert(id_column_name is not null, 'reset_sequence(2): id_column_name cannot be null');

  max_id := exec_qry('select max(' || dbms_assert.simple_sql_name(id_column_name) || ') from ' || dbms_assert.simple_sql_name(table_name));

  msg('reset_sequence ' || sequence_name || ' ' || dbms_assert.simple_sql_name(table_name) || '.' || id_column_name || '=' || max_id);

  reset_sequence
    (sequence_name => sequence_name
    ,next_value    => nvl(max_id+1, 1));

end reset_sequence;

function is_granted
  (owner       in varchar2
  ,object_name in varchar2
  ,privilege   in varchar2
  ) return boolean is
  dummy number;
begin
  assert(owner is not null, 'is_granted: owner cannot be null');
  assert(object_name is not null, 'is_granted: object_name cannot be null');
  assert(privilege is not null, 'is_granted: privilege cannot be null');

  select 1 into dummy
  from   all_tab_privs_recd p
  where  p.owner = upper(is_granted.owner)
  and    p.table_name = upper(is_granted.object_name)
  and    p.grantee in ('PUBLIC',user)
  and    p.privilege = is_granted.privilege;

  return true;

exception
  when no_data_found then
    return false;
end is_granted;

function invalid_object_count (object_type in varchar2 := null) return number is
  cnt number;
begin
  select count(*) into cnt
  from user_objects o
  where (o.object_type = upper(invalid_object_count.object_type) or invalid_object_count.object_type is null)
  and o.status = 'INVALID';
  return cnt;
end invalid_object_count;

procedure dbms_output_errors
  (object_type in varchar2 := null
  ,object_name in varchar2 := null) is
begin
  assert(object_type is not null, 'dbms_output_errors: object_type cannot be null');
  assert(object_name is not null, 'dbms_output_errors: object_name cannot be null');
  for r in (
    select e.type
          ,e.name
          ,e.attribute
          ,e.line
          ,e.position
          ,e.text
          ,row_number() over (partition by e.type, e.name order by e.sequence) rn
    from   user_errors e
    where  e.type = nvl(upper(dbms_output_errors.object_type), e.type)
    and    e.name = nvl(upper(dbms_output_errors.object_name), e.name)
    and    e.attribute = 'ERROR'
    order by e.type, e.name, e.sequence) loop
    if r.rn = 1 then
      dbms_output.put_line('===================================================');
      dbms_output.put_line('Compilation errors for ' || r.type || ' ' || r.name);
      dbms_output.put_line('===================================================');
    end if;
    dbms_output.put_line(initcap(r.attribute) || '(' || r.line || ',' || r.position || '): ' || r.text);
  end loop;
end dbms_output_errors;

end deploy;
/
