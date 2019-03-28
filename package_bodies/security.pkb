create or replace package body security as
/*******************************************************************************
 APEX Security Package
 12-NOV-2014 Jeffrey Kemp
*******************************************************************************/

scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

trigger_disabled constant varchar2(30) := 'DISABLED';

insufficient_privileges exception;
pragma exception_init (insufficient_privileges, -01031);

function get_app_user return varchar2 is
begin
  return coalesce(sys_context('apex$session','app_user'), v('APP_USER'));
end get_app_user;

function get_app_session return varchar2 is
begin
  return coalesce(sys_context('apex$session','app_session'), v('APP_SESSION'));
end get_app_session;

procedure set_context
  (attribute in varchar2
  ,value     in varchar2
  ,client_id in varchar2 := null) is
  scope  logger_logs.scope%type := scope_prefix || 'set_context';
  params logger.tab_param;
begin
  logger.append_param(params, 'attribute', attribute);
  logger.append_param(params, 'value', value);
  logger.append_param(params, 'client_id', client_id);
  logger.log('START', scope, null, params);

  assert(attribute is not null,'attribute cannot be NULL', scope);

  if value is null then
    dbms_session.clear_context
      (namespace => ctx
      ,attribute => attribute
      ,client_id => nvl(client_id, sys_context('userenv','client_identifier')));
  else
    dbms_session.set_context
      (namespace => ctx
      ,attribute => attribute
      ,value     => value
      ,client_id => nvl(client_id, sys_context('userenv','client_identifier')));
  end if;

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end set_context;

procedure init_db_session
  (app_user   in varchar2
  ,client_id  in varchar2
  ) is
  -- NOTE: do not call any code (e.g. views) which *use* the SYS_CONTEXT that is
  --       setup by this code - we can SET the context variables, but we can't
  --       see them yet
  scope  logger_logs.scope%type := scope_prefix || 'init_db_session';
  params logger.tab_param;
begin
  logger.append_param(params, 'app_user', app_user);
  logger.append_param(params, 'client_id', client_id);
  logger.log('START', scope, null, params);

  assert(app_user is not null,'app_user cannot be NULL', scope);

  -- reset the context
  dbms_session.clear_context
    (namespace => ctx
    ,client_id => client_id);

  --indicate that the session has been initialised
  set_context
    (attribute => 'SESSION_VALID'
    ,value     => 'Y'
    ,client_id => client_id);

  -- context values are useful for queries - instead of calling v('MY_ITEM')
/*
  set_context
    (attribute => 'MY_ITEM'
    ,value     => 'the value'
    ,client_id => client_id);
*/

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end init_db_session;

/*******************************************************************************
                               PUBLIC INTERFACE
*******************************************************************************/

procedure post_auth is
  scope     logger_logs.scope%type := scope_prefix || 'post_auth';
  params    logger.tab_param;
  app_user    varchar2(500);
  app_session varchar2(100);
begin
  app_user    := get_app_user;
  app_session := get_app_session;
  if app_user is not null and app_session is not null then
    dbms_session.set_identifier(app_user || ':' || app_session);
  end if;
  logger.append_param(params, 'apex$session-app_user', sys_context('apex$session','app_user'));
  logger.append_param(params, 'apex$session-session', sys_context('apex$session','session'));
  logger.log('START', scope, null, params);
  
  -- NOTE: do not call any code (e.g. views) which *use* the SYS_CONTEXT that is
  -- setup by this code - we can SET the context variables, but we can't see them yet
  if app_user is not null then
    init_db_session
      (app_user  => app_user
      ,client_id => app_user || ':' || app_session);
  end if;
  
  set_security_group;

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end post_auth;

procedure set_security_group (security_group_id in number := null) is
  scope     logger_logs.scope%type := scope_prefix || 'set_security_group';
  params    logger.tab_param;
  app_user    varchar2(500);
  app_session varchar2(100);
  cursor cur
    (app_user          in varchar2
    ,security_group_id in number) is
    select ur.security_group_id
    from   user_roles ur
    where  ur.app_user = cur.app_user
    and    (ur.security_group_id = cur.security_group_id or cur.security_group_id is null)
    and    ur.deleted_y is null
    order by ur.last_login_dt desc;
  r cur%rowtype;
begin
  logger.append_param(params,'security_group_id',security_group_id);
  logger.log('START', scope, null, params);
  
  app_user    := get_app_user;
  app_session := get_app_session;
  
  --check if user has access to the selected security group; or select one if it is null
  open cur (app_user, security_group_id);
  fetch cur into r;
  close cur;
  
  if r.security_group_id is null and security_group_id is not null then
    raise_application_error(-20000, 'user does not have access to security group (' || app_user || ',' || security_group_id || ')');
  end if;
  
  set_context
    (attribute => 'security_group_id'
    ,value     => r.security_group_id
    ,client_id => app_user || ':' || app_session);

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end set_security_group;

function has_role (role_code in varchar2) return boolean is
  scope     logger_logs.scope%type := scope_prefix || 'has_role';
  params    logger.tab_param;
  app_user  varchar2(500);
  dummy number;
begin
  logger.append_param(params,'role_code',role_code);
  logger.log('START', scope, null, params);
  
  app_user := get_app_user;
  
  select 1 into dummy
  from  user_roles ur
  where ur.app_user = has_role.app_user
  and   (ur.role_code in (has_role.role_code,'ADMIN')
         or
         ur.role_code = 'OPERATOR' and has_role.role_code = 'REPORTING')
  and   ur.deleted_y is null
  and rownum = 1;

  logger.log('END', scope, null, params);
  return true;
exception
  when no_data_found then
    logger.log('END [no_data_found]', scope, null, params);
    return false;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end has_role;

function has_any_role return boolean is
  scope     logger_logs.scope%type := scope_prefix || 'has_any_role';
  params    logger.tab_param;
  app_user  varchar2(500);
  dummy number;
begin
  logger.log('START', scope, null, params);
  
  app_user := get_app_user;
  
  select 1 into dummy
  from  user_roles ur
  where ur.app_user = has_any_role.app_user
  and   ur.deleted_y is null
  and rownum = 1;

  logger.log('END', scope, null, params);
  return true;
exception
  when no_data_found then
    logger.log('END [no_data_found]', scope, null, params);
    return false;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end has_any_role;

function vpd_policy
  (object_schema in varchar2
  ,object_name in varchar2
  ) return varchar2 is
begin
  return 'db$security_group_id='
      || context_security_group_id
      || q'[ or db$global_y='Y']';
end vpd_policy;

procedure disable_journal_trigger
  (trigger_name in varchar2
  ,client_id    in varchar2 := null) is
  scope  logger_logs.scope%type := scope_prefix || 'disable_journal_trigger';
  params logger.tab_param;
begin
  logger.append_param(params, 'trigger_name', trigger_name);
  logger.append_param(params, 'client_id', client_id);
  logger.log('START', scope, null, params);

  -- set the context to any non-null value
  set_context
    (attribute => trigger_name
    ,value     => trigger_disabled
    ,client_id => client_id);

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end disable_journal_trigger;

procedure enable_journal_trigger
  (trigger_name in varchar2
  ,client_id    in varchar2 := null) is
  scope  logger_logs.scope%type := scope_prefix || 'enable_journal_trigger';
  params logger.tab_param;
begin
  logger.append_param(params, 'trigger_name', trigger_name);
  logger.append_param(params, 'client_id', client_id);
  logger.log('START', scope, null, params);

  -- clear the context
  set_context
    (attribute => trigger_name
    ,value     => null
    ,client_id => client_id);

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end enable_journal_trigger;

function context_installed return boolean is
  scope  logger_logs.scope%type := scope_prefix || 'context_installed';
  params logger.tab_param;
begin
  logger.log('START', scope, null, params);

  set_context
    (attribute => 'TEST'
    ,value     => null);

  logger.log('END', scope, null, params);
  return true;
exception
  when insufficient_privileges then
    dbms_output.put_line('Context not installed (' || ctx || ') [' || sqlerrm || '], ok');
    logger.log('END', scope, null, params);
    return false;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end context_installed;

end security;
/

show errors