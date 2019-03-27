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
audit_columns_list     constant varchar2(100) := 'DB$CREATED_DT,DB$CREATED_BY,DB$LAST_UPDATED_DT,DB$LAST_UPDATED_BY';
generated_columns_list constant varchar2(200) := audit_columns_list||',DB$SECURITY_GROUP_ID,DB$GLOBAL_Y,DB$SRC_ID,DB$SRC_VERSION_ID,DB$VERSION_ID';

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
create or replace trigger <%trigger>
  for insert or update or delete on <%table>
  when (sys_context('<%CONTEXT>','<%TRIGGER>') is null)
  compound trigger
/*******************************************************************************
 Journal Trigger - DO NOT EDIT
 <%SYSDATE> - Generated by <%USER>
*******************************************************************************/

  flush_threshold constant binary_integer := 100;
  type jnl_t is table of <%journal>%rowtype
    index by binary_integer;
  jnls jnl_t;

  procedure flush_array (arr in out jnl_t) is
  begin
    forall i in 1..arr.count
      insert into <%journal> values arr(i);
    arr.delete;
  end flush_array;

  before each row is
  begin
    if updating then
      :new.db$last_updated_by := <%CONTEXT_APP_USER>;
      :new.db$last_updated_dt := sysdate;
      :new.db$version_id      := :old.db$version_id + 1;
    end if;
  end before each row;

  after each row is
    r <%journal>%rowtype;
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

end <%trigger>;
<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE tapi_package_spec>
create or replace package <%tapi> as
/*******************************************************************************
 Table API for <%table>
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
  from   <%table> x;
subtype t_row is cur%rowtype;
type t_array is table of t_row index by binary_integer;

type t_rv is record
  (<%COLUMNS EXCLUDING AUDIT,DB$SECURITY_GROUP_ID INCLUDING ROWID>
   #col#... varchar2(4000)~
   #col#... <%table>.#col#%type{ID}~
   #col#... <%table>.#col#%type{LOB}~
   #col#... varchar2(20){ROWID}~
  ,<%END>);
type t_rvarray is table of t_rv index by binary_integer;

procedure append_params
  (params in out logger.tab_param
  ,r      in t_row);

procedure append_params
  (params in out logger.tab_param
  ,rv     in t_rv);

-- validate the row (returns an error message if invalid)
function val (rv in t_rv) return varchar2;

-- insert a row
function ins (rv in t_rv) return t_row;

-- insert multiple rows, array may be sparse
procedure bulk_ins (arr in t_rvarray);

-- update a row
function upd (rv in t_rv) return t_row;

-- update multiple rows, array may be sparse
procedure bulk_upd (arr in t_rvarray);

-- delete a row
procedure del (rv in t_rv);

-- delete multiple rows; array may be sparse
procedure bulk_del (arr in t_rvarray);
<%IF SOFT_DELETE>
-- undelete a row
function undel (rv in t_rv) return t_row;

-- undelete multiple rows; array may be sparse
procedure bulk_undel (arr in t_rvarray);
<%END IF>
-- convert an t_rv to a t_row
function to_row (rv in t_rv) return t_row;

-- convert a t_row to an t_rv
function to_rv (r in t_row) return t_rv;

-- get a row (raise NO_DATA_FOUND if not found; returns default record if parameter is null)
function get (<%COLUMNS ONLY SURROGATE_KEY,IDENTITY INCLUDING ROWID>
              #col# in <%table>.#col#%type~
              p_#col# in varchar2{ROWID}~
             ,<%END>) return t_row;

-- convert to a copy
function copy (r in t_row) return t_row;

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
 Table API for <%table>
 <%SYSDATE> - Generated by <%USER>
*******************************************************************************/

scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

-- column name constants
<%COLUMNS EXCLUDING GENERATED>
C_#COL28#... constant varchar2(30) := '#COL#';~
<%END>

procedure lost_upd (rv in t_rv) is
  scope              logger_logs.scope%type := scope_prefix || 'lost_upd';
  params             logger.tab_param;
  db_last_updated_by <%table>.db$last_updated_by%type;
  db_last_updated_dt <%table>.db$last_updated_dt%type;
begin
  append_params (params, rv);
  logger.log('START', scope, null, params);

  select x.db$last_updated_by
        ,x.db$last_updated_dt
  into   db_last_updated_by
        ,db_last_updated_dt
  from   <%table> x
  where  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY INCLUDING ROWID>
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
  ,r      in t_row) is
begin
  <%COLUMNS INCLUDING ROWID>
  logger.append_param(params, 'r.#col#',... r.#col#);~
  logger.append_param(params, 'r.#col#.len', dbms_lob.getlength(r.#col#));{LOB}~
  <%END>
end append_params;

procedure append_params
  (params in out logger.tab_param
  ,rv     in t_rv) is
begin
  <%COLUMNS EXCLUDING AUDIT,DB$SECURITY_GROUP_ID INCLUDING ROWID>
  logger.append_param(params, 'rv.#col#',... rv.#col#);~
  logger.append_param(params, 'rv.#col#.len', dbms_lob.getlength(rv.#col#));{LOB}~
  <%END>
end append_params;

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
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end label_map;

function val (rv in t_rv) return varchar2 is
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

procedure bulk_val (arr in t_rvarray) is
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

function ins (rv in t_rv) return t_row is
  scope     logger_logs.scope%type := scope_prefix || 'ins';
  params    logger.tab_param;
  r         t_row;
  error_msg varchar2(32767);
begin
  append_params(params, rv);
  logger.log('START', scope, null, params);

  error_msg := val (rv => rv);

  if error_msg is not null then
    util.raise_error(error_msg, scope, params);
  end if;

  insert into <%table>
        (<%COLUMNS EXCLUDING GENERATED,SURROGATE_KEY,IDENTITY,VIRTUAL>
        #col#~
        ,<%END>)
  values(<%COLUMNS EXCLUDING GENERATED,SURROGATE_KEY,IDENTITY,VIRTUAL>
         rv.#col#~
         util.num_val(rv.#col#){NUMBER}~
         util.date_val(rv.#col#){DATE}~
         util.datetime_val(rv.#col#){DATETIME}~
         util.timestamp_val(rv.#col#){TIMESTAMP}~
         util.timestamp_tz_val(rv.#col#){TIMESTAMP_TZ}~
        ,<%END>)
  returning
         <%COLUMNS INCLUDING ROWID>
         #col#~
        ,<%END>
  into   <%COLUMNS INCLUDING ROWID>
         r.#col#~
        ,<%END>;

  logger.log('insert <%table>: ' || sql%rowcount, scope, null, params);

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

procedure bulk_ins (arr in t_rvarray) is
  scope    logger_logs.scope%type := scope_prefix || 'bulk_ins';
  params   logger.tab_param;
begin
  logger.append_param(params, 'arr.COUNT', arr.count);
  logger.log('START', scope, null, params);

  bulk_val(arr);

  forall i in indices of arr
    insert into <%table>
           (<%COLUMNS EXCLUDING GENERATED,SURROGATE_KEY,IDENTITY,VIRTUAL>
            #col#~
           ,<%END>)
    values (<%COLUMNS EXCLUDING GENERATED,SURROGATE_KEY,IDENTITY,VIRTUAL>
            arr(i).#col#~
            util.num_val(arr(i).#col#){NUMBER}~
            util.date_val(arr(i).#col#){DATE}~
            util.datetime_val(arr(i).#col#){DATETIME}~
            util.timestamp_val(arr(i).#col#){TIMESTAMP}~
            util.timestamp_tz_val(arr(i).#col#){TIMESTAMP_TZ}~
           ,<%END>);

  logger.log('insert <%table>: ' || sql%rowcount, scope, null, params);

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
end bulk_ins;

function upd (rv in t_rv) return t_row is
  scope     logger_logs.scope%type := scope_prefix || 'upd';
  params    logger.tab_param;
  r         t_row;
  error_msg varchar2(32767);
begin
  append_params(params, rv);
  logger.log('START', scope, null, params);

  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY,VERSION_ID INCLUDING ROWID>
  assert(rv.#col# is not null, '#col# cannot be null', scope);~
  <%END>

  error_msg := val (rv => rv);

  if error_msg is not null then
    util.raise_error(error_msg, scope, params);
  end if;

  update <%table> x
  set    <%COLUMNS EXCLUDING GENERATED,SURROGATE_KEY,IDENTITY,VIRTUAL>
         x.#col#... = rv.#col#~
         x.#col#... = util.num_val(rv.#col#){NUMBER}~
         x.#col#... = util.date_val(rv.#col#){DATE}~
         x.#col#... = util.datetime_val(rv.#col#){DATETIME}~
         x.#col#... = util.timestamp_val(rv.#col#){TIMESTAMP}~
         x.#col#... = util.timestamp_tz_val(rv.#col#){TIMESTAMP_TZ}}~
        ,<%END>
  where  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY,VERSION_ID INCLUDING ROWID>
         x.#col#... = rv.#col#~
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

  logger.log('update <%table>: ' || sql%rowcount, scope, null, params);

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

procedure bulk_upd (arr in t_rvarray) is
  scope    logger_logs.scope%type := scope_prefix || 'bulk_upd';
  params   logger.tab_param;
begin
  logger.append_param(params, 'arr.count', arr.count);
  logger.log('START', scope, null, params);

  bulk_val(arr);

  forall i in indices of arr
    update <%table> x
    set    <%COLUMNS EXCLUDING GENERATED,SURROGATE_KEY,IDENTITY,VIRTUAL>
           x.#col#... = arr(i).#col#~
           x.#col#... = util.num_val(arr(i).#col#){NUMBER}~
           x.#col#... = util.date_val(arr(i).#col#){DATE}~
           x.#col#... = util.datetime_val(arr(i).#col#){DATETIME}~
           x.#col#... = util.timestamp_val(arr(i).#col#){TIMESTAMP}~
           x.#col#... = util.timestamp_tz_val(arr(i).#col#){TIMESTAMP_TZ}~
          ,<%END>
    where  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY INCLUDING ROWID>
           x.#col#... = arr(i).#col#~
    and    <%END>;

  logger.log('update <%table>: ' || sql%rowcount, scope, null, params);

  logger.log('END', scope, null, params);
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

procedure del (rv in t_rv) is
  scope  logger_logs.scope%type := scope_prefix || 'del';
  params logger.tab_param;
begin
  append_params(params, rv);
  logger.log('START', scope, null, params);

  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY,VERSION_ID INCLUDING ROWID>
  assert(rv.#col# is not null, '#col# cannot be null', scope);~
  <%END>

<%IF SOFT_DELETE>
  update <%table> x
  set    x.deleted_y = 'Y'
  where  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY,VERSION_ID INCLUDING ROWID>
         x.#col#... = rv.#col#~
  and    <%END>;

  if sql%notfound then
    raise util.lost_update;
  end if;

  logger.log('update <%table>.deleted_y=Y: ' || sql%rowcount, scope, null, params);
<%ELSE>
  delete <%table> x
  where  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY,VERSION_ID INCLUDING ROWID>
         x.#col#... = rv.#col#~
  and    <%END>;

  if sql%notfound then
    raise util.lost_update;
  end if;

  logger.log('delete <%table>: ' || sql%rowcount, scope, null, params);
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

procedure bulk_del (arr in t_rvarray) is
  scope    logger_logs.scope%type := scope_prefix || 'bulk_del';
  params   logger.tab_param;
begin
  logger.append_param(params, 'arr.count', arr.count);
  logger.log('START', scope, null, params);

<%IF SOFT_DELETE>
  forall i in indices of arr
    update <%table> x
    set    x.deleted_y = 'Y'
    where  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY INCLUDING ROWID>
           x.#col#... = arr(i).#col#~
    and    <%END>;

  logger.log('update <%table>.deleted_y=Y: ' || sql%rowcount, scope, null, params);
<%ELSE>
  forall i in indices of arr
    delete <%table> x
    where  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY INCLUDING ROWID>
           x.#col#... = arr(i).#col#~
    and    <%END>;

  logger.log('delete <%table>: ' || sql%rowcount, scope, null, params);
<%END IF>

  logger.log('END', scope, null, params);
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
function undel (rv in t_rv) return t_row is
  scope     logger_logs.scope%type := scope_prefix || 'undel';
  params    logger.tab_param;
  r         t_row;
  error_msg varchar2(32767);
begin
  append_params(params, rv);
  logger.log('START', scope, null, params);

  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY,VERSION_ID INCLUDING ROWID>
  assert(rv.#col# is not null, '#col# cannot be null', scope);~
  <%END>

  update <%table> x
  set    x.deleted_y = null
  where  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY,VERSION_ID INCLUDING ROWID>
         x.#col#... = rv.#col#~
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

  logger.log('update <%table>.deleted_y=null: ' || sql%rowcount, scope, null, params);

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

procedure bulk_undel (arr in t_rvarray) is
  scope    logger_logs.scope%type := scope_prefix || 'bulk_undel';
  params   logger.tab_param;
begin
  logger.append_param(params, 'arr.count', arr.count);
  logger.log('START', scope, null, params);

  forall i in indices of arr
    update <%table> x
    set    x.deleted_y = null
    where  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY INCLUDING ROWID>
           x.#col#... = arr(i).#col#~
    and    <%END>;

  logger.log('update <%table>.deleted_y=null: ' || sql%rowcount, scope, null, params);

  logger.log('END', scope, null, params);
exception
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end bulk_undel;
<%END IF>

-- convert an t_rv to a t_row, no validation (exceptions may be raised on
-- datatype conversion errors), no audit columns
function to_row (rv in t_rv) return t_row is
  scope  logger_logs.scope%type := scope_prefix || 'to_row';
  params logger.tab_param;
  r      t_row;
begin
  append_params(params, rv);
  logger.log('START', scope, null, params);

  <%COLUMNS EXCLUDING AUDIT,DB$SECURITY_GROUP_ID>
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
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end to_row;

-- convert a t_row to an t_rv
function to_rv (r in t_row) return t_rv is
  scope  logger_logs.scope%type := scope_prefix || 'to_rv';
  params logger.tab_param;
  rv     t_rv;
begin
  append_params(params, r);
  logger.log('START', scope, null, params);

  <%COLUMNS EXCLUDING AUDIT,DB$SECURITY_GROUP_ID INCLUDING ROWID>
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
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end to_rv;

function get (<%COLUMNS ONLY SURROGATE_KEY,IDENTITY INCLUDING ROWID>
              #col# in <%table>.#col#%type~
              p_#col# in varchar2{ROWID}~
             ,<%END>) return t_row is
  scope   logger_logs.scope%type := scope_prefix || 'get';
  params  logger.tab_param;
  r       t_row;
begin
  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY INCLUDING ROWID>
  logger.append_param(params, '#col#', #col#);~
  logger.append_param(params, 'p_#col#', p_#col#);{ROWID}~
  <%END>
  logger.log('START', scope, null, params);

  if <%COLUMNS ONLY SURROGATE_KEY,IDENTITY INCLUDING ROWID>#col# is not null~p_#col# is not null{ROWID}~
  or <%END> then
  
    select <%COLUMNS INCLUDING ROWID>
           x.#col#~
          ,<%END>
    into   <%COLUMNS INCLUDING ROWID>
           r.#col#~
          ,<%END>
    from   <%table> x
    where  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY INCLUDING ROWID>
           x.#col#... = get.#col#~
           x.#col#... = get.p_rowid{ROWID}~
    and    <%END>;

  else

    -- set up default record
    <%COLUMNS ONLY DEFAULT_VALUE EXCLUDING GENERATED,SURROGATE_KEY,IDENTITY,VIRTUAL>
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
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end get;

function copy (r in t_row) return t_row is
  scope  logger_logs.scope%type := scope_prefix || 'copy';
  params logger.tab_param;
  nr     t_row;
begin
  append_params(params, r);
  logger.log('START', scope, null, params);
  
  nr := r;

  <%COLUMNS ONLY GENERATED,SURROGATE_KEY,IDENTITY,ROWID,DELETED_Y EXCLUDING DB$SRC_ID,DB$SRC_VERSION_ID>
  nr.#col#... := null;~
  <%END>

  <%COLUMNS ONLY SURROGATE_KEY,IDENTITY>
  nr.db$src_id         := r.#col#;
  nr.db$src_version_id := r.db$version_id;~
  <%END>

  append_params(params, nr);
  logger.log('END', scope, null, params);
  return nr;
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end copy;

-- may be used to disable and re-enable the journal trigger for this session
procedure disable_journal_trigger is
begin
  security.disable_journal_trigger('<%TRIGGER>');
end disable_journal_trigger;

procedure enable_journal_trigger is
begin
  security.enable_journal_trigger('<%TRIGGER>');
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
from <%table>;
<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE codesamples>

-- The following are code samples to copy-and-paste as needed.

-- e.g. generate a t_row record; remove any columns not needed
r := <%tapi>.t_row
  (<%COLUMNS EXCLUDING AUDIT,DB$SECURITY_GROUP_ID INCLUDING ROWID>
   #col#... => null --#col#~
  ,<%END>);

-- e.g. put this in a Form Page Load Process
declare
  r <%tapi>.t_row;
begin
  r := <%tapi>.get(<%COLUMNS ONLY SURROGATE_KEY,IDENTITY INCLUDING ROWID>#col#... => :P1_#COL28#~p_#col#... => :P1_#COL28#{ROWID}~, <%END>);
  <%COLUMNS INCLUDING ROWID EXCLUDING LOBS>
  :P1_#COL28#... := r.#col#;~
  :P1_#COL28#... := to_char(r.#col#, util.date_format);{DATE}~
  :P1_#COL28#... := to_char(r.#col#, util.datetime_format);{DATETIME}~
  :P1_#COL28#... := to_char(r.#col#, util.timestamp_format);{TIMESTAMP}~
  :P1_#COL28#... := to_char(r.#col#, util.timestamp_tz_format);{TIMESTAMP_TZ}~
  <%END>
end;

-- e.g. put this in a Form Validation Process returning Error Text
return <%tapi>.val (rv => <%tapi>.rvtype
  (<%COLUMNS EXCLUDING AUDIT,DB$SECURITY_GROUP_ID INCLUDING ROWID>
   #col#... => :P1_#COL28#~
  ,<%END>));

-- e.g. put this in a Form DML Process
declare
  rv <%tapi>.t_rv;
  r  <%tapi>.t_row;
begin
  rv := <%tapi>.t_rv
    (<%COLUMNS EXCLUDING AUDIT,DB$SECURITY_GROUP_ID INCLUDING ROWID>
     #col#... => :P1_#COL28#~
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
    r := <%tapi>.undel (rv => rv);
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

-- e.g. put this in an Interactive Grid validation "PL/SQL Function (returning Error
-- Text)" For Created and Modified Rows
<%tapi>.val (rv => <%tapi>.t_rv
  (<%COLUMNS EXCLUDING AUDIT,DB$SECURITY_GROUP_ID>
   #col#... => :#COL#~
  ,<%END>));

-- e.g. put this in an "Interactive Grid - Automatic Row Processing (DML)" process
-- with Target Type = PL/SQL Code
declare
  rv <%tapi>.t_rv;
begin
  rv := <%tapi>.t_rv
    (<%COLUMNS EXCLUDING AUDIT,DB$SECURITY_GROUP_ID INCLUDING ROWID>
     #col#... => :#COL#~
    ,<%END>);    
  case :APEX$ROW_STATUS
  when 'I' then
    r := <%tapi>.ins (rv => rv);    
    -- Interactive Grid needs the new PK in order to find the new record
    <%COLUMNS ONLY SURROGATE_KEY,IDENTITY INCLUDING ROWID>
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