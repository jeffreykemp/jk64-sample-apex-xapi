PROMPT Package Body GEN_LOV_VW
create or replace package body gen_lov_vw as

scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

/*******************************************************************************
                               PUBLIC INTERFACE
*******************************************************************************/

function get_name return varchar2 is
begin
  return 'LOV View';
end get_name;

function get_description return varchar2 is
begin
  return 'Generate LOV View for a reference table';
end get_description;

function get_object_types return t_string is
begin
  return new t_string('TABLE');
end get_object_types;

function get_object_names(in_object_type in varchar2) return t_string is
  l_object_names t_string;
begin
  select object_name bulk collect into l_object_names
  from   user_objects t
  where  object_type = in_object_type
  and    object_name not like '%$%'
  and    generated = 'N'
  and exists (
    select null
    from   user_tab_columns c
    where  c.table_name = t.object_name
    and    c.column_name in ('SORT_ORDER','START_DATE','END_DATE','ENABLED_Y')
    )
  order by object_name;
  return l_object_names;
end get_object_names;

function generate
  (in_object_type in varchar2
  ,in_object_name in varchar2
  ,in_params      in t_param
  ) return clob is
  scope  logger_logs.scope%type := scope_prefix || 'generate';
  params logger.tab_param;
  buf clob;
begin
  logger.append_param(params, 'in_object_type', in_object_type);
  logger.append_param(params, 'in_object_name', in_object_name);
  logger.append_param(params, 'in_params.count', in_params.count);
  logger.log('START', scope, null, params);
  
  buf := gen_tapis.gen
    (template_name => 'create_lov_view'
    ,table_name    => in_object_name);
  
  logger.log('END', scope, buf, params);
  return buf;
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end generate;

end gen_lov_vw;
/

show errors
