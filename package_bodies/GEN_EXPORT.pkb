PROMPT Package Body GEN_EXPORT
CREATE OR REPLACE PACKAGE BODY GEN_EXPORT AS

scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

--oddgen parameters
oddgen_format          constant varchar2(100) := 'Format';
oddgen_exclude         constant varchar2(100) := 'Exclude column(s)';
oddgen_commit_count    constant varchar2(100) := 'Commit every N records (blank for no commit)';
oddgen_prompts         constant varchar2(100) := 'Prompts after each commit';
oddgen_header          constant varchar2(100) := 'Header column format';

/*******************************************************************************
                               PUBLIC INTERFACE
*******************************************************************************/

FUNCTION get_name RETURN VARCHAR2 IS
BEGIN
  RETURN 'Data Export';
END get_name;

FUNCTION get_description RETURN VARCHAR2 IS
BEGIN
  RETURN 'Export data from a table';
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
  ORDER BY object_name;
  RETURN l_object_names;
END get_object_names;

FUNCTION get_params
  (in_object_type IN VARCHAR2
  ,in_object_name IN VARCHAR2
  ) RETURN t_param IS
  l_params t_param;
BEGIN
  l_params(oddgen_format) := 'Insert';
  l_params(oddgen_exclude) := 'GENERATED';
  l_params(oddgen_commit_count) := '1000';
  l_params(oddgen_prompts) := default_prompts;
  l_params(oddgen_header) := '#Label#';
  RETURN l_params;
END get_params;

FUNCTION get_ordered_params(in_object_type IN VARCHAR2, in_object_name IN VARCHAR2)
  RETURN t_string IS
BEGIN
  RETURN NEW t_string(oddgen_format
                     ,oddgen_exclude
                     ,oddgen_commit_count
                     ,oddgen_prompts
                     ,oddgen_header);
END get_ordered_params;

FUNCTION get_lov
  (in_object_type IN VARCHAR2
  ,in_object_name IN VARCHAR2
  ,in_params      IN t_param
  ) RETURN t_lov IS
  l_lov t_lov;
BEGIN
  l_lov(oddgen_format) := NEW t_string('Insert','CSV');
  case in_params(oddgen_format)
  when 'Insert' then
    l_lov(oddgen_header) := NEW t_string('');
    l_lov(oddgen_commit_count) := NEW t_string('10','50','100','200','500','1000','10000','100000');
  when 'CSV' then
    l_lov(oddgen_commit_count) := NEW t_string('');
    l_lov(oddgen_header) := NEW t_string('#COL#','#col#','#Label#','#LABEL#','#label#');
  end case;
  RETURN l_lov;
END get_lov;

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
  
  case in_params(oddgen_format)
  when 'Insert' then
  
    for r in (
      select column_value
      from table(
        gen_export.export_inserts
          (table_name      => in_object_name
          ,exclude         => in_params(oddgen_exclude)
          ,commit_count    => in_params(oddgen_commit_count)
          ,prompts         => in_params(oddgen_prompts)
          ))
      ) loop
      
      buf := buf || r.column_value || CHR(10);
      
    end loop;
  
  when 'CSV' then

    for r in (
      select column_value
      from table(
        gen_export.export_csv
          (table_name => in_object_name
          ,header     => in_params(oddgen_header)
          ,exclude    => in_params(oddgen_exclude)
          ))
      ) loop
      
      buf := buf || r.column_value || CHR(10);
      
    end loop;
  
  end case;
 
  logger.log('END', scope, buf, params);
  RETURN buf;
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END generate;

-- export table data as "INSERT ALL INTO tab(col1,col2,..)VALUES(val1,val2,..).."
FUNCTION export_inserts
  (table_name      IN VARCHAR2
  ,exclude         IN VARCHAR2 := NULL
  ,commit_count    IN NUMBER   := 1000 -- commit after this many INSERT statements
  ,prompts         IN VARCHAR2 := default_prompts
  ) RETURN t_str_array PIPELINED IS
  scope           logger_logs.scope%type := scope_prefix || 'export_inserts';
  params          logger.tab_param;
  placeholders    gen_tapis.key_value_array;
  buf             VARCHAR2(32767);
  arr             t_str_array;
  n_arr           t_str_array;
  t_arr           t_str_array;
  cur             SYS_REFCURSOR;
  statement_count INTEGER := 0;
BEGIN
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'exclude', exclude);
  logger.append_param(params, 'commit_count', commit_count);
  logger.append_param(params, 'prompts', prompts);
  logger.log('START', scope, null, params);

  assert(table_name IS NOT NULL, 'table_name cannot be null', scope);

  IF NOT DEPLOY.table_exists(table_name) THEN
    RAISE_APPLICATION_ERROR(-20000, 'Table not found: ' || table_name);
  END IF;

  placeholders('<%columnspec>') := CASE WHEN exclude IS NOT NULL THEN 'EXCLUDING '||exclude END;
  placeholders(CHR(10)) := ' ';

  buf := gen_tapis.gen
    (template_name => 'EXPORT_INSERT'
    ,table_name    => table_name
    ,placeholders  => placeholders);
  
  buf := 'SELECT q, ROWNUM n, COUNT(*) OVER () as t FROM (' || buf || ')';

  OPEN cur FOR buf;
  LOOP

    FETCH cur
      BULK COLLECT INTO arr, n_arr, t_arr
      LIMIT NVL(commit_count, 1000);

    EXIT WHEN arr.COUNT = 0;

    FOR i IN 1..arr.COUNT LOOP
      PIPE ROW(arr(i));
    END LOOP;

    IF prompts IS NOT NULL THEN
      PIPE ROW (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(prompts
        ,'{table}', LOWER(table_name))
        ,'{TABLE}', UPPER(table_name))
        ,'{n}',     n_arr(n_arr.LAST))
        ,'{total}', t_arr(t_arr.LAST))
        ,'{pct}',   to_char(100*to_number(n_arr(n_arr.LAST))/to_number(t_arr(t_arr.LAST)),'fm990'))
        );
    END IF;

    IF commit_count IS NOT NULL THEN
      PIPE ROW ('COMMIT;');
    END IF;
    
  END LOOP;
  CLOSE cur;

  logger.log('END', scope, null, params);
  RETURN;
EXCEPTION
  WHEN NO_DATA_NEEDED THEN
    logger.log('END NO_DATA_NEEDED', scope, null, params);
    RAISE;
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END export_inserts;

FUNCTION export_csv
  (table_name IN VARCHAR2
  ,header     IN VARCHAR2 := '#Label#'
  ,exclude    IN VARCHAR2 := NULL
  ) RETURN t_str_array PIPELINED IS
  scope        logger_logs.scope%type := scope_prefix || 'export_csv';
  params       logger.tab_param;
  placeholders gen_tapis.key_value_array;
  buf          VARCHAR2(32767);
  arr          t_str_array;
  cur          SYS_REFCURSOR;
BEGIN
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'header', header);
  logger.append_param(params, 'exclude', exclude);
  logger.log('START', scope, null, params);

  assert(table_name IS NOT NULL, 'table_name cannot be null', scope);

  IF NOT DEPLOY.table_exists(table_name) THEN
    RAISE_APPLICATION_ERROR(-20000, 'Table not found: ' || table_name);
  END IF;

  placeholders('<%columnspec>') := CASE WHEN exclude IS NOT NULL THEN 'EXCLUDING '||exclude END;
  placeholders(CHR(10)) := ' ';
  placeholders('99999') := RPAD('9',30,'9');
  placeholders('#HEADER#') := header;

  IF header IS NOT NULL THEN

    buf := gen_tapis.gen
      (template_name => 'EXPORT_CSV_HEADER'
      ,table_name    => table_name
      ,placeholders  => placeholders);

    PIPE ROW(TRIM(buf));

  END IF;

  buf := gen_tapis.gen
    (template_name => 'EXPORT_CSV'
    ,table_name    => table_name
    ,placeholders  => placeholders);

  OPEN cur FOR buf;
  LOOP

    FETCH cur
      BULK COLLECT INTO arr
      LIMIT 100;

    EXIT WHEN arr.COUNT = 0;

    FOR i IN 1..arr.COUNT LOOP
      PIPE ROW(arr(i));
    END LOOP;

  END LOOP;
  CLOSE cur;

  logger.log('END', scope, null, params);
  RETURN;
EXCEPTION
  WHEN NO_DATA_NEEDED THEN
    logger.log('END NO_DATA_NEEDED', scope, null, params);
    RAISE;
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END export_csv;

END GEN_EXPORT;
/

SHOW ERRORS