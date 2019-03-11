create or replace package templates as
/*******************************************************************************
 Code templates used by GENERATE (no package body)
 09-FEB-2016 Jeffrey Kemp
 Each template starts with <%TEMPLATE name> and ends with <%END TEMPLATE>
 For syntax, refer to:
 https://bitbucket.org/jk64/jk64-sample-apex-tapi/wiki/Template%20Syntax
 Warning: don't put # at start of a line or it may fail in SQL*Plus.
*******************************************************************************/

journal_tab_suffix  constant varchar2(30) := '$JN';
journal_trg_suffix  constant varchar2(30) := '$TRG';
tapi_suffix         constant varchar2(30) := '$TAPI';
lov_vw_suffix       constant varchar2(30) := '_VW';

-- column lists
audit_columns_list     constant varchar2(100) := 'CREATED_DT,CREATED_BY,LAST_UPDATED_DT,LAST_UPDATED_BY';
generated_columns_list constant varchar2(100) := audit_columns_list||',VERSION_ID';

lob_datatypes_list     constant varchar2(100) := 'BLOB,BFILE,CLOB,NCLOB,XMLTYPE';

--avoid compilation of the template code
$if false $then
--(these borders are just to visually separate the templates, they're not significant)
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- This journal trigger performs reasonably well for bulk inserts/updates/
-- deletes by keeping the changed records in a small array and flushing only
-- after 100 records. The number 100 is a compromise between not allowing too
-- many concurrent sessions from using lots of memory, while not doing too many
-- small-array inserts into the journal table.
-- In the degenerate case (where the application is doing single-row DML) it
-- adds only minimal overhead.
<%TEMPLATE create_journal_trigger>
create or replace trigger <%TRIGGER>
  for insert or update or delete on <%TABLE>
  when (sys_context('<%CONTEXT>','<%TRIGGER>') is null)
  compound trigger
/*******************************************************************************
 Journal Trigger - DO NOT EDIT
 <%SYSDATE> - Generated by <%USER>
*******************************************************************************/

  flush_threshold constant binary_integer := 100;
  type jnl_t is table of <%JOURNAL>%rowtype
    index by binary_integer;
  jnls jnl_t;

  procedure flush_array (arr in out jnl_t) is
  begin
    forall i in 1..arr.count
      insert into <%JOURNAL> values arr(i);
    arr.delete;
  end flush_array;

  before each row is
  begin
    if updating then
      :new.last_updated_by := <%CONTEXT_APP_USER>;
      :new.last_updated_dt := sysdate;
      :new.version_id      := :old.version_id + 1;
    end if;
  end before each row;

  after each row is
    r <%JOURNAL>%rowtype;
  begin
    if inserting or updating then
      <%COLUMNS>
      r.#col#... := :new.#col#;~
      <%END>
      if inserting then
        r.jn$action := 'I';
      elsif updating then
        r.jn$action := 'U';
      end if;
    elsif deleting then
      <%COLUMNS>
      r.#col#... := :old.#col#;~
      <%END>
      r.jn$action := 'D';
    end if;
    r.jn$timestamp := systimestamp;
    r.jn$action_by := <%CONTEXT_APP_USER>;
    jnls(nvl(jnls.last,0) + 1) := r;
    if jnls.count >= flush_threshold then
      flush_array(arr => jnls);
    end if;
  end after each row;

  after statement is
  begin
    flush_array(arr => jnls);
  end after statement;

end <%TRIGGER>;
<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE tapi_package_spec>
create or replace package <%tapi> as
/*******************************************************************************
 Table API for <%TABLE>
 <%SYSDATE> - Generated by <%USER>
*******************************************************************************/

/******************************* USAGE NOTES ***********************************
 Only call the single-row methods when only one row needs to be processed.
 Always call the bulk methods when more than one row needs to be processed.

 If a method is not perfectly suited to the task at hand (e.g. you want to
 update just two columns but all we have is a "update everything!" method),
 add a new one.

 Don't call a "get" function if you need to then correlate the results
 from other "get" functions - instead, put all the logic into a view.
*******************************************************************************/

cursor cur is
  select x.*
        ,x.rowid as "ROWID"
  from   <%TABLE> x;
subtype rowtype is cur%rowtype;
type arraytype is table of rowtype index by binary_integer;

type rvtype is record
  (<%COLUMNS EXCLUDING AUDIT INCLUDING ROWID>
   #col#... varchar2(4000)~
   #col#... <%TABLE>.#col#%type{ID}~
   #col#... <%TABLE>.#col#%type{BLOB}~
   #col#... <%TABLE>.#col#%type{CLOB}~
   #col#... <%TABLE>.#col#%type{XMLTYPE}~
   #col#... varchar2(20){ROWID}~
  ,<%END>);
type rvarraytype is table of rvtype index by binary_integer;

procedure append_params
  (params in out logger.tab_param
  ,r      in rowtype);

procedure append_params
  (params in out logger.tab_param
  ,rv     in rvtype);

-- return a mapping of column name -> user-friendly label
function label_map return util.str_map;

-- validate the row (returns an error message if invalid)
function val (rv in rvtype) return varchar2;

-- insert a row
function ins (rv in rvtype) return rowtype;

-- insert multiple rows, array may be sparse; returns no. records inserted
function bulk_ins (arr in rvarraytype) return number;

-- update a row
function upd (rv in rvtype) return rowtype;

-- update multiple rows, array may be sparse; returns no. records updated
function bulk_upd (arr in rvarraytype) return number;

-- delete a row
procedure del (rv in rvtype);

-- delete multiple rows; array may be sparse; returns no. records deleted
function bulk_del (arr in rvarraytype) return number;
<%IF SOFT_DELETE>
-- undelete a row
procedure undel (rv in rvtype);

-- undelete multiple rows; array may be sparse; returns no. records deleted
function bulk_undel (arr in rvarraytype) return number;

-- permanently delete rows marked as deleted
procedure purge_recyclebin;
<%END IF>
-- convert an rvtype to a rowtype
function to_rowtype (rv in rvtype) return rowtype;

-- convert a rowtype to an rvtype
function to_rvtype (r in rowtype) return rvtype;

-- get a row (raise NO_DATA_FOUND if not found; returns default record if parameter is null)
function get (<%COLUMNS ONLY IDENTITY INCLUDING ROWID>
              #col# in <%TABLE>.#col#%type~
              p_#col# in varchar2{ROWID}~
             ,<%END>) return rowtype;

-- convert to a copy
function copy (r in rowtype) return rowtype;

-- Use these procedures to disable and re-enable the journal trigger just for
-- this session (to disable for all sessions, just disable the database trigger
-- instead).
procedure disable_journal_trigger;
procedure enable_journal_trigger;

end <%tapi>;
<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE tapi_package_body>
create or replace package body <%tapi> as
/*******************************************************************************
 Table API for <%TABLE>
 <%SYSDATE> - Generated by <%USER>
*******************************************************************************/

scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

-- column name constants
<%COLUMNS EXCLUDING GENERATED>
C_#COL28#... constant varchar2(30) := '#COL#';~
<%END>

procedure lost_upd (rv in rvtype) is
  scope              logger_logs.scope%type := scope_prefix || 'lost_upd';
  params             logger.tab_param;
  db_last_updated_by <%TABLE>.last_updated_by%type;
  db_last_updated_dt <%TABLE>.last_updated_dt%type;
begin
  append_params (params, rv);
  logger.log('START', scope, null, params);

  select x.last_updated_by
        ,x.last_updated_dt
  into   db_last_updated_by
        ,db_last_updated_dt
  from   <%TABLE> x
  where  <%COLUMNS ONLY SURROGATE_KEY INCLUDING ROWID>
         x.#col#... = rv.#col#~
  and    <%END>;

  util.raise_lost_update
    (updated_by => db_last_updated_by
    ,updated_dt => db_last_updated_dt
    ,scope      => scope
    ,params     => params);
exception
  when no_data_found then
    util.raise_error('LOST_UPDATE_DEL', scope, params);
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end lost_upd;

/*******************************************************************************
                               PUBLIC INTERFACE
*******************************************************************************/

procedure append_params
  (params in out logger.tab_param
  ,r      in rowtype) is
begin
  <%COLUMNS INCLUDING ROWID>
  logger.append_param(params, 'r.#col#',... r.#col#);~
  logger.append_param(params, 'r.#col#.len',... dbms_lob.getlength(r.#col#));{LOB}~
  <%END>
end append_params;

procedure append_params
  (params in out logger.tab_param
  ,rv     in rvtype) is
begin
  <%COLUMNS EXCLUDING AUDIT INCLUDING ROWID>
  logger.append_param(params, 'rv.#col#',... rv.#col#);~
  logger.append_param(params, 'rv.#col#.len',... dbms_lob.getlength(rv.#col#));{LOB}~
  <%END>
end append_params;

function rec
  (<%COLUMNS INCLUDING ROWID EXCLUDING GENERATED>
   #col#... in <%TABLE>.#col#%type... := null~
   #col#... in varchar2 := null{ROWID}~
  ,<%END>
  ) return rowtype is
  scope  logger_logs.scope%type := scope_prefix || 'rec';
  params logger.tab_param;
  r      rowtype;
begin
  logger.log('START', scope, null, params);
  
  <%COLUMNS INCLUDING ROWID EXCLUDING GENERATED>
  r.#col#... := #col#;~
  <%END>

  append_params(params, r);
  logger.log('END', scope, null, params);
  return r;
exception
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end rec;

-- return an rvtype with the given values
function rv
  (<%COLUMNS EXCLUDING AUDIT INCLUDING ROWID>
   #col#... in varchar2 := null~
   #col#... in <%TABLE>.#col#%type... := null{ID}~
   #col#... in <%TABLE>.#col#%type... := null{LOB}~
   #col#... in varchar2 := null{ROWID}~
  ,<%END>
  ) return rvtype is
  scope  logger_logs.scope%type := scope_prefix || 'rv';
  params logger.tab_param;
  rv     rvtype;
begin
  logger.log('START', scope, null, params);

  <%COLUMNS EXCLUDING AUDIT INCLUDING ROWID>
  rv.#col#... := #col#;~
  <%END>

  append_params(params, rv);
  logger.log('END', scope, null, params);
  return rv;
exception
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end rv;

function label_map return util.str_map is
  scope logger_logs.scope%type := scope_prefix || 'label_map';
  params  logger.tab_param;
  lm      util.str_map;
begin
  logger.log('START', scope, null, params);

  <%COLUMNS EXCLUDING GENERATED>
  lm(C_#COL28#)... := '#Label#';~
  <%END>

  logger.log('END', scope, null, params);
  return lm;
exception
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end label_map;

function val (rv in rvtype) return varchar2 is
  -- Validates the record but without reference to any other rows or tables
  -- (i.e. avoid any queries in here).
  -- Unique and referential integrity should be validated via suitable db
  -- constraints (violations will be raised when the ins/upd/del is attempted).
  -- Complex cross-record validations should usually be performed by a XAPI
  -- prior to the call to the TAPI.
  scope  logger_logs.scope%type := scope_prefix || 'val';
  params logger.tab_param;
begin
  append_params(params, rv);
  logger.log('START', scope, null, params);

  <%COLUMNS EXCLUDING NULLABLE,GENERATED,SURROGATE_KEY,IDENTITY,LOBS,DEFAULT_ON_NULL,VIRTUAL>
  util.val_not_null (val => rv.#col#, column_name => C_#COL28#);~
  <%END>
  <%COLUMNS EXCLUDING GENERATED,SURROGATE_KEY,IDENTITY,LOBS,VIRTUAL>
  util.val_y (val => rv.#col#, column_name => C_#COL28#);{Y}~
  util.val_yn (val => rv.#col#, column_name => C_#COL28#);{YN}~
  util.val_code (val => rv.#col#, column_name => C_#COL28#);{CODE}~
  util.val_max_len (val => rv.#col#, len => #maxlen#, column_name => C_#COL28#);{VARCHAR2}~
  util.val_numeric (val => rv.#col#, column_name => C_#COL28#);{NUMBER}~
  util.val_date (val => rv.#col#, column_name => C_#COL28#);{DATE}~
  util.val_datetime (val => rv.#col#, column_name => C_#COL28#);{DATETIME}~
  util.val_timestamp (val => rv.#col#, column_name => C_#COL28#);{TIMESTAMP}~
  util.val_timestamp_tz (val => rv.#col#, column_name => C_#COL28#);{TIMESTAMP_TZ}~
  ~
  <%END>

  logger.log('END', scope, null, params);
  return util.first_error;
exception
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end val;

procedure bulk_val (arr in rvarraytype) is
  scope     logger_logs.scope%type := scope_prefix || 'bulk_val';
  params    logger.tab_param;
  i         binary_integer;
  error_msg varchar2(32767);
begin
  logger.append_param(params, 'arr.count', arr.count);
  logger.log('START', scope, null, params);

  i := arr.first;
  loop
    exit when i is null;

    error_msg := val (rv => arr(i));

    -- raise the error on the first record with any error (stop validating
    -- subsequent records)
    if error_msg is not null then
      util.raise_error(error_msg || ' (row ' || i || ')', scope, params);
    end if;

    i := arr.next(i);
  end loop;

  logger.log('END', scope, null, params);
exception
  when dup_val_on_index then
    util.raise_dup_val_on_index (scope, params);
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end bulk_val;

function ins (rv in rvtype) return rowtype is
  scope     logger_logs.scope%type := scope_prefix || 'ins';
  params    logger.tab_param;
  lr        rvtype := rv;
  r         rowtype;
  error_msg varchar2(32767);
begin
  append_params(params, rv);
  logger.log('START', scope, null, params);

  error_msg := val (rv => rv);

  if error_msg is not null then
    util.raise_error(error_msg, scope, params);
  end if;
  
  lr := rv;

  insert into <%TABLE>
        (<%COLUMNS EXCLUDING GENERATED,IDENTITY,VIRTUAL>
        #col#~
        ,<%END>)
  values(<%COLUMNS EXCLUDING GENERATED,IDENTITY,VIRTUAL>
         lr.#col#~
         util.num_val(lr.#col#){NUMBER}~
         util.date_val(lr.#col#){DATE}~
         util.datetime_val(lr.#col#){DATETIME}~
         util.timestamp_val(lr.#col#){TIMESTAMP}~
         util.timestamp_tz_val(lr.#col#){TIMESTAMP_TZ}~
        ,<%END>)
  returning
         <%COLUMNS INCLUDING ROWID>
         #col#~
        ,<%END>
  into   <%COLUMNS INCLUDING ROWID>
         r.#col#~
        ,<%END>;

  logger.log('insert <%TABLE>: ' || sql%rowcount, scope, null, params);

  append_params(params, r);
  logger.log('END', scope, null, params);
  return r;
exception
  when dup_val_on_index then
    util.raise_dup_val_on_index (scope, params);
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end ins;

function bulk_ins (arr in rvarraytype) return number is
  scope    logger_logs.scope%type := scope_prefix || 'bulk_ins';
  params   logger.tab_param;
  lr       rvarraytype := arr;
  rowcount number;
begin
  logger.append_param(params, 'arr.COUNT', arr.count);
  logger.log('START', scope, null, params);

  bulk_val(arr);

  lr := arr;

  forall i in indices of arr
    insert into <%TABLE>
           (<%COLUMNS EXCLUDING GENERATED,IDENTITY,VIRTUAL>
            #col#~
           ,<%END>)
    values (<%COLUMNS EXCLUDING GENERATED,IDENTITY,VIRTUAL>
            lr(i).#col#~
            util.num_val(lr(i).#col#){NUMBER}~
            util.date_val(lr(i).#col#){DATE}~
            util.datetime_val(lr(i).#col#){DATETIME}~
            util.timestamp_val(lr(i).#col#){TIMESTAMP}~
            util.timestamp_tz_val(lr(i).#col#){TIMESTAMP_TZ}~
           ,<%END>);

  rowcount := sql%rowcount;

  logger.log('insert <%TABLE>: ' || rowcount, scope, null, params);

  logger.log('END', scope, 'rowcount=' || rowcount, params);
  return rowcount;
exception
  when dup_val_on_index then
    util.raise_dup_val_on_index (scope, params);
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end bulk_ins;

function upd (rv in rvtype) return rowtype is
  scope     logger_logs.scope%type := scope_prefix || 'upd';
  params    logger.tab_param;
  lr        rvtype := rv;
  r         rowtype;
  error_msg varchar2(32767);
begin
  append_params(params, rv);
  logger.log('START', scope, null, params);

  <%COLUMNS ONLY IDENTITY,VERSION_ID INCLUDING ROWID>
  assert(rv.#col# is not null, '#col# cannot be null', scope);~
  <%END>

  error_msg := val (rv => rv);

  if error_msg is not null then
    util.raise_error(error_msg, scope, params);
  end if;

  lr := rv;

  update <%TABLE> x
  set    <%COLUMNS EXCLUDING GENERATED,IDENTITY,VIRTUAL>
         x.#col#... = lr.#col#~
         x.#col#... = util.num_val(lr.#col#){NUMBER}~
         x.#col#... = util.date_val(lr.#col#){DATE}~
         x.#col#... = util.datetime_val(lr.#col#){DATETIME}~
         x.#col#... = util.timestamp_val(lr.#col#){TIMESTAMP}~
         x.#col#... = util.timestamp_tz_val(lr.#col#){TIMESTAMP_TZ}}~
        ,<%END>
  where  <%COLUMNS ONLY IDENTITY,VERSION_ID INCLUDING ROWID>
         x.#col#... = lr.#col#~
  and    <%END>
  returning
         <%COLUMNS INCLUDING ROWID>
         #col#~
        ,<%END>
  into   <%COLUMNS INCLUDING ROWID>
         r.#col#~
        ,<%END>;

  if sql%notfound then
    raise util.lost_update;
  end if;

  logger.log('update <%TABLE>: ' || sql%rowcount, scope, null, params);

  append_params(params, r);
  logger.log('END', scope, null, params);
  return r;
exception
  when dup_val_on_index then
    util.raise_dup_val_on_index (scope, params);
  when util.ref_constraint_violation then
    util.raise_ref_con_violation (scope, params);
  when util.lost_update then
    lost_upd (rv => rv);
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end upd;

function bulk_upd (arr in rvarraytype) return number is
  scope    logger_logs.scope%type := scope_prefix || 'bulk_upd';
  params   logger.tab_param;
  lr       rvarraytype := arr;
  rowcount number;
begin
  logger.append_param(params, 'arr.count', arr.count);
  logger.log('START', scope, null, params);

  bulk_val(arr);

  lr := arr;

  forall i in indices of arr
    update <%TABLE> x
    set    <%COLUMNS EXCLUDING GENERATED,IDENTITY,VIRTUAL>
           x.#col#... = lr(i).#col#~
           x.#col#... = util.num_val(lr(i).#col#){NUMBER}~
           x.#col#... = util.date_val(lr(i).#col#){DATE}~
           x.#col#... = util.datetime_val(lr(i).#col#){DATETIME}~
           x.#col#... = util.timestamp_val(lr(i).#col#){TIMESTAMP}~
           x.#col#... = util.timestamp_tz_val(lr(i).#col#){TIMESTAMP_TZ}~
          ,<%END>
    where  <%COLUMNS ONLY IDENTITY INCLUDING ROWID>
           x.#col#... = lr(i).#col#~
    and    <%END>;

  rowcount := sql%rowcount;

  logger.log('update <%TABLE>: ' || rowcount, scope, null, params);

  logger.log('END', scope, null, params);
  return rowcount;
exception
  when dup_val_on_index then
    util.raise_dup_val_on_index (scope, params);
  when util.ref_constraint_violation then
    util.raise_ref_con_violation (scope, params);
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end bulk_upd;

procedure del (rv in rvtype) is
  scope  logger_logs.scope%type := scope_prefix || 'del';
  params logger.tab_param;
  lr rvtype := rv;
begin
  append_params(params, rv);
  logger.log('START', scope, null, params);

  <%COLUMNS ONLY IDENTITY,VERSION_ID INCLUDING ROWID>
  assert(rv.#col# is not null, '#col# cannot be null', scope);~
  <%END>

  lr := rv;

<%IF SOFT_DELETE>
  update <%TABLE> x
  set    x.deleted_y = 'Y'
  where  <%COLUMNS ONLY IDENTITY,VERSION_ID INCLUDING ROWID>
         x.#col#... = lr.#col#~
  and    <%END>;

  if sql%notfound then
    raise util.lost_update;
  end if;

  logger.log('update <%TABLE>.deleted_y=Y: ' || sql%rowcount, scope, null, params);
<%ELSE>
  delete <%TABLE> x
  where  <%COLUMNS ONLY IDENTITY,VERSION_ID INCLUDING ROWID>
         x.#col#... = lr.#col#~
  and    <%END>;

  if sql%notfound then
    raise util.lost_update;
  end if;

  logger.log('delete <%TABLE>: ' || sql%rowcount, scope, null, params);
<%END IF>

  logger.log('END', scope, null, params);
exception
  when util.ref_constraint_violation then
    util.raise_del_ref_con_violation (scope, params);
  when util.lost_update then
    lost_upd (rv => rv);
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end del;

function bulk_del (arr in rvarraytype) return number is
  scope    logger_logs.scope%type := scope_prefix || 'bulk_del';
  params   logger.tab_param;
  lr       rvarraytype := arr;
  rowcount number;
begin
  logger.append_param(params, 'arr.count', arr.count);
  logger.log('START', scope, null, params);

  lr := arr;

<%IF SOFT_DELETE>
  forall i in indices of arr
    update <%TABLE> x
    set    x.deleted_y = 'Y'
    where  <%COLUMNS ONLY IDENTITY INCLUDING ROWID>
           x.#col#... = lr(i).#col#~
    and    <%END>;

  rowcount := sql%rowcount;

  logger.log('update <%TABLE>.deleted_y=Y: ' || rowcount, scope, null, params);
<%ELSE>
  forall i in indices of arr
    delete <%TABLE> x
    where  <%COLUMNS ONLY IDENTITY INCLUDING ROWID>
           x.#col#... = lr(i).#col#~
    and    <%END>;

  rowcount := sql%rowcount;

  logger.log('delete <%TABLE>: ' || rowcount, scope, null, params);
<%END IF>

  logger.log('END', scope, 'rowcount=' || rowcount, params);
  return rowcount;
exception
  when util.ref_constraint_violation then
    util.raise_del_ref_con_violation (scope, params);
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end bulk_del;

<%IF SOFT_DELETE>
function undel (rv in rvtype) return rowtype is
  scope     logger_logs.scope%type := scope_prefix || 'undel';
  params    logger.tab_param;
  lr        rvtype := rv;
  r         rowtype;
  error_msg varchar2(32767);
begin
  append_params(params, rv);
  logger.log('START', scope, null, params);

  <%COLUMNS ONLY IDENTITY,VERSION_ID INCLUDING ROWID>
  assert(rv.#col# is not null, '#col# cannot be null', scope);~
  <%END>

  lr := rv;

  update <%TABLE> x
  set    x.deleted_y = null
  where  <%COLUMNS ONLY IDENTITY,VERSION_ID INCLUDING ROWID>
         x.#col#... = lr.#col#~
  and    <%END>
  returning
         <%COLUMNS INCLUDING ROWID>
         #col#~
        ,<%END>
  into   <%COLUMNS INCLUDING ROWID>
         r.#col#~
        ,<%END>;

  if sql%notfound then
    raise util.lost_update;
  end if;

  logger.log('update <%TABLE>.deleted_y=null: ' || sql%rowcount, scope, null, params);

  append_params(params, r);
  logger.log('END', scope, null, params);
  return r;
exception
  when util.lost_update then
    lost_upd (rv => rv);
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end undel;

function bulk_undel (arr in rvarraytype) return number is
  scope    logger_logs.scope%type := scope_prefix || 'bulk_undel';
  params   logger.tab_param;
  lr       rvarraytype := arr;
  rowcount number;
begin
  logger.append_param(params, 'arr.count', arr.count);
  logger.log('START', scope, null, params);

  lr := arr;

  forall i in indices of arr
    update <%TABLE> x
    set    x.deleted_y = null
    where  <%COLUMNS ONLY IDENTITY INCLUDING ROWID>
           x.#col#... = lr(i).#col#~
    and    <%END>;

  rowcount := sql%rowcount;

  logger.log('update <%TABLE>.deleted_y=null: ' || rowcount, scope, null, params);

  logger.log('END', scope, null, params);
  return rowcount;
exception
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end bulk_undel;
<%END IF>

-- convert an rvtype to a rowtype, no validation (exceptions may be raised on
-- datatype conversion errors), no audit columns
function to_rowtype (rv in rvtype) return rowtype is
  scope  logger_logs.scope%type := scope_prefix || 'to_rowtype';
  params logger.tab_param;
  r      rowtype;
begin
  append_params(params, rv);
  logger.log('START', scope, null, params);

  <%COLUMNS EXCLUDING AUDIT>
  r.#col#... := rv.#col#;~
  r.#col#... := to_char(rv.#col#, util.date_format);{DATE}~
  r.#col#... := to_char(rv.#col#, util.datetime_format);{DATETIME}~
  r.#col#... := to_char(rv.#col#, util.timestamp_format);{TIMESTAMP}~
  r.#col#... := to_char(rv.#col#, util.timestamp_tz_format);{TIMESTAMP_TZ}~
  <%END>

  append_params(params, r);
  logger.log('END', scope, null, params);
  return r;
exception
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end to_rowtype;

-- convert a rowtype to an rvtype
function to_rvtype (r in rowtype) return rvtype is
  scope  logger_logs.scope%type := scope_prefix || 'to_rvtype';
  params logger.tab_param;
  rv     rvtype;
begin
  append_params(params, r);
  logger.log('START', scope, null, params);

  <%COLUMNS EXCLUDING AUDIT INCLUDING ROWID>
  rv.#col#... := r.#col#;~
  rv.#col#... := util.date_val(r.#col#);{DATE}~
  rv.#col#... := util.datetime_val(r.#col#);{DATETIME}~
  rv.#col#... := util.timestamp_val(r.#col#);{TIMESTAMP}~
  rv.#col#... := util.timestamp_tz_val(r.#col#);{TIMESTAMP_TZ}~
  <%END>

  append_params(params, rv);
  logger.log('END', scope, null, params);
  return rv;
exception
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end to_rvtype;

function get (<%COLUMNS ONLY IDENTITY INCLUDING ROWID>
              #col# in <%TABLE>.#col#%type~
              p_#col# in varchar2{ROWID}~
             ,<%END>) return rowtype is
  scope   logger_logs.scope%type := scope_prefix || 'get';
  params  logger.tab_param;
  r       rowtype;
begin
  <%COLUMNS ONLY IDENTITY INCLUDING ROWID>
  logger.append_param(params, '#col#', #col#);~
  logger.append_param(params, 'p_#col#', p_#col#);{ROWID}~
  <%END>
  logger.log('START', scope, null, params);

  if <%COLUMNS ONLY IDENTITY INCLUDING ROWID>#col# is not null~p_#col# is not null{ROWID}~
  or <%END> then
  
    select <%COLUMNS INCLUDING ROWID>
           x.#col#~
          ,<%END>
    into   <%COLUMNS INCLUDING ROWID>
           r.#col#~
          ,<%END>
    from   <%TABLE> x
    where  <%COLUMNS ONLY IDENTITY INCLUDING ROWID>
           x.#col#... = get.#col#~
           x.#col#... = get.p_rowid{ROWID}~
    and    <%END>;

  else

    -- set up default record
    <%COLUMNS ONLY DEFAULT_VALUE EXCLUDING GENERATED,IDENTITY,VIRTUAL>
    r.#col#... := #data_default#;~
    null;{NONE}~
    <%END>

  end if;

  append_params(params, r);
  logger.log('END', scope, null, params);
  return r;
exception
  when no_data_found then
    logger.log_error('No Data Found', scope, null, params);
    raise;
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end get;

function copy (r in rowtype) return rowtype is
  scope  logger_logs.scope%type := scope_prefix || 'copy';
  params logger.tab_param;
  nr     rowtype;
begin
  append_params(params, r);
  logger.log('START', scope, null, params);
  
  nr := r;

  <%COLUMNS ONLY GENERATED,IDENTITY,ROWID,DELETED_Y>
  nr.#col#... := null;~
  <%END>

  append_params(params, nr);
  logger.log('END', scope, null, params);
  return nr;
exception
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end copy;

-- may be used to disable and re-enable the journal trigger for this session
procedure disable_journal_trigger is
  scope  logger_logs.scope%type := scope_prefix || 'disable_journal_trigger';
  params logger.tab_param;
begin
  logger.log('START', scope, null, params);

  security.disable_journal_trigger('<%TRIGGER>');

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end disable_journal_trigger;

procedure enable_journal_trigger is
  scope  logger_logs.scope%type := scope_prefix || 'enable_journal_trigger';
  params logger.tab_param;
begin
  logger.log('START', scope, null, params);

  security.enable_journal_trigger('<%TRIGGER>');

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end enable_journal_trigger;

end <%tapi>;
<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE create_lov_view>
create or replace view <%VIEW> as
select <%COLUMNS EXCLUDING GENERATED>
       #col#~
      ,<%END>
      <%COLUMNS ONLY START_DATE>
      ,case
       when end_date < trunc(sysdate) then 'EXPIRED'
       when start_date >= trunc(sysdate) then 'FUTURE'
       end as inactive_code
       <%END>
      ,<%COLUMNS EXCLUDING PK,GENERATED,SORT_ORDER,START_DATE,END_DATE,ID,Y,CODE,VIRTUAL>
       #col#~
       || ' ' || <%END>
       <%COLUMNS ONLY VISIBLE_Y,START_DATE,ENABLED_Y,DELETED_Y>
       ~
       || case when visible_y is null then '*' end{VISIBLE_Y}~
       || case when enabled_y is null then ' (DISABLED)' end{ENABLED_Y}~
       || case when deleted_y = 'Y' then ' (DELETED)' end{DELETED_Y}~
       || case when end_date < trunc(sysdate) then ' (EXPIRED)'
               when start_date >= trunc(sysdate) then ' (FUTURE)'
          end{START_DATE}~
       <%END> as lov_name
      ,row_number() over
         (order by <%COLUMNS ONLY DELETED_Y>
            deleted_y nulls first
           ,<%END><%COLUMNS ONLY START_DATE>
            case
            when end_date < trunc(sysdate) then 2
            when start_date >= trunc(sysdate) then 1
            else 0
            end
           ,<%END><%COLUMNS ONLY ENABLED_Y>
            enabled_y nulls last
           ,<%END>sort_order
           ,<%COLUMNS EXCLUDING PK,GENERATED,SORT_ORDER,START_DATE,END_DATE,ID,Y,CODE,VIRTUAL>
            #col#~
           ,<%END>) as lov_sort_order
from <%TABLE>;
<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE codesamples>

-- The following are code samples to copy-and-paste as needed.

-- Put this in a Form Validation Process
<%tapi>.val (rv => <%tapi>.rvtype
  (<%COLUMNS EXCLUDING AUDIT INCLUDING ROWID>
   rv.#col#... => :P1_#COL28#;~
  ,<%END>));

-- Put this in a Form DML Process
procedure process is
  rv     <%tapi>.rvtype;
  r      <%tapi>.rowtype;
begin
  rv := <%tapi>.rvtype
    (<%COLUMNS EXCLUDING AUDIT INCLUDING ROWID>
     rv.#col#... => :P1_#COL28#;~
    ,<%END>);
  case
  when :REQUEST = 'CREATE' then
    r := <%tapi>.ins (rv => rv);
    util.success('<%Entity> created.');
  when :REQUEST like 'SAVE%' then
    r := <%tapi>.upd (rv => rv);
    util.success('<%Entity> updated.'
      || case when :REQUEST = 'SAVE_COPY' then ' Ready to create new <%entity>.' end);
  when :REQUEST = 'DELETE' then
    <%tapi>.del (rv => rv);
    util.clear_page_cache;
    util.success('<%Entity> deleted.');
<%IF SOFT_DELETE>
  when :REQUEST = 'UNDELETE' then
    <%tapi>.undel (rv => rv);
    util.success('<%Entity> undeleted.');
<%END IF>
  else
    null;
  end case;
  if :REQUEST != 'DELETE' then
    <%COLUMNS INCLUDING ROWID EXCLUDING LOBS>
    :P1_#COL28#... := r.#col#;~
    <%END>
  end if;
end;

-- Put this in an Interactive Grid validation "PL/SQL Function (returning Error
-- Text)" For Created and Modified Rows
<%tapi>.val (rv => <%tapi>.rvtype
  (<%COLUMNS EXCLUDING AUDIT>
   #col#... => :#COL#~
  ,<%END>));

-- Put this in an "Interactive Grid - Automatic Row Processing (DML)" process
-- with Target Type = PL/SQL Code
declare
  rv <%tapi>.rvtype;
begin
  rv := <%tapi>.rvtype
    (<%COLUMNS EXCLUDING AUDIT INCLUDING ROWID>
     #col#... => :#COL#~
    ,<%END>);    
  case :APEX$ROW_STATUS
  when 'I' then
    r := <%tapi>.ins (rv => rv);    
    -- Interactive Grid needs the new PK in order to find the new record
    <%COLUMNS ONLY IDENTITY INCLUDING ROWID>
    :#COL#... := r.#col#;~
    <%END>
  when 'U' then
    r := <%tapi>.upd (rv => rv);
  when 'D' then
    <%tapi>.del (rv => rv);
  end case;
end;

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

$end
end templates;
/