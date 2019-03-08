PROMPT Package Body GEN_LOV_VW
CREATE OR REPLACE PACKAGE BODY GEN_LOV_VW AS

scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

/*******************************************************************************
                               PUBLIC INTERFACE
*******************************************************************************/

FUNCTION get_name RETURN VARCHAR2 IS
BEGIN
  RETURN 'LOV View';
END get_name;

FUNCTION get_description RETURN VARCHAR2 IS
BEGIN
  RETURN 'Generate LOV View for a reference table';
END get_description;

FUNCTION get_object_types RETURN t_string IS
BEGIN
  RETURN NEW t_string('TABLE');
END get_object_types;

FUNCTION get_object_names(in_object_type IN VARCHAR2) RETURN t_string IS
  l_object_names t_string;
BEGIN
  SELECT object_name BULK COLLECT INTO l_object_names
  FROM   user_objects t
  WHERE  object_type = in_object_type
  AND    object_name not like '%$%'
  AND    generated = 'N'
  and exists (
    select null
    from   user_tab_columns c
    where  c.table_name = t.object_name
    and    c.column_name in ('SORT_ORDER','START_DATE','END_DATE','ENABLED_IND')
    )
  ORDER BY object_name;
  RETURN l_object_names;
END get_object_names;

FUNCTION generate
  (in_object_type IN VARCHAR2
  ,in_object_name IN VARCHAR2
  ,in_params      IN t_param
  ) RETURN CLOB IS
  scope  logger_logs.scope%type := scope_prefix || 'generate';
  params logger.tab_param;
  buf clob;
BEGIN
  logger.append_param(params, 'in_object_type', in_object_type);
  logger.append_param(params, 'in_object_name', in_object_name);
  logger.append_param(params, 'in_params.count', in_params.count);
  logger.log('START', scope, null, params);
  
  buf := gen_tapis.gen
    (template_name => 'CREATE_LOV_VIEW'
    ,table_name    => in_object_name);
  
  logger.log('END', scope, buf, params);
  RETURN buf;
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END generate;

END GEN_LOV_VW;
/

SHOW ERRORS