-- At the top of each package body
scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

-- Sample procedure usage
procedure todo_proc_name
  (param1_mandatory in varchar2
  ,param2_optional  in varchar2
  ,param3_out       out varchar2) is
  scope  logger_logs.scope%type := scope_prefix || 'todo_proc_name';
  params logger.tab_param;
begin
  logger.append_param(params, 'param1_mandatory', param1_mandatory);
  logger.append_param(params, 'param2_optional', param2_optional);
  logger.log('START', scope, null, params);

  assert(param1_mandatory is not null, 'param1_mandatory cannot be null', scope);

  ... your procedure logic ...

  logger.append_param(params, 'param3_out', param3_out);
  logger.log('END', scope, null, params);
exception
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end todo_proc_name;

-- Sample function usage
function todo_func_name
  (param1_mandatory in varchar2
  ,param2_optional  in varchar2
  ) return ret_type is
  scope  logger_logs.scope%type := scope_prefix || 'todo_func_name';
  params logger.tab_param;
  ret    ret_type;
begin
  logger.append_param(params, 'param1_mandatory', param1_mandatory);
  logger.append_param(params, 'param2_optional', param2_optional);
  logger.log('START', scope, null, params);

  assert(param1_mandatory is not null, 'param1_mandatory cannot be null', scope);

  ... your procedure logic ...

  logger.append_param(params, 'ret.attr1', ret.attr1);
  logger.append_param(params, 'ret.attr2', ret.attr2);
  logger.log('END', scope, null, params);
  return ret;
exception
  when util.application_error then
    logger.log_error('Application Error', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end todo_func_name;
