create or replace PACKAGE BODY GEN_TAPIS AS

scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

-- default template source
TEMPLATES_PACKAGE      CONSTANT VARCHAR2(30) := 'TEMPLATES';

-- structural tokens
TEMPLATE_TOKEN         CONSTANT VARCHAR2(30) := '<%TEMPLATE ';
END_TEMPLATE_TOKEN     CONSTANT VARCHAR2(30) := '<%END TEMPLATE>';
COLUMNS_TOKEN          CONSTANT VARCHAR2(30) := '<%COLUMNS';
END_TOKEN              CONSTANT VARCHAR2(30) := '<%END>';
IF_TOKEN               CONSTANT VARCHAR2(30) := '<%IF ';
ELSE_TOKEN             CONSTANT VARCHAR2(30) := '<%ELSE>';
ENDIF_TOKEN            CONSTANT VARCHAR2(30) := '<%END IF>';
INCLUDE_TOKEN          CONSTANT VARCHAR2(30) := '<%INCLUDE ';

-- option marker tokens
INCLUDING_TOKEN        CONSTANT VARCHAR2(30) := 'INCLUDING';
EXCLUDING_TOKEN        CONSTANT VARCHAR2(30) := 'EXCLUDING';
ONLY_TOKEN             CONSTANT VARCHAR2(30) := 'ONLY';

-- option value tokens
AUDIT_TOKEN            CONSTANT VARCHAR2(30) := 'AUDIT';
DEFAULT_VALUE_TOKEN    CONSTANT VARCHAR2(30) := 'DEFAULT_VALUE';
GENERATED_TOKEN        CONSTANT VARCHAR2(30) := 'GENERATED';
NULLABLE_TOKEN         CONSTANT VARCHAR2(30) := 'NULLABLE';
LOB_TOKEN              CONSTANT VARCHAR2(30) := 'LOB';
LOBS_TOKEN             CONSTANT VARCHAR2(30) := 'LOBS';
CODE_TOKEN             CONSTANT VARCHAR2(30) := 'CODE';
IND_TOKEN              CONSTANT VARCHAR2(30) := 'IND';
ID_TOKEN               CONSTANT VARCHAR2(30) := 'ID';
PK_TOKEN               CONSTANT VARCHAR2(30) := 'PK';
ROWID_TOKEN            CONSTANT VARCHAR2(30) := 'ROWID';
VIRTUAL_TOKEN          CONSTANT VARCHAR2(30) := 'VIRTUAL';
SECURITY_CONTEXT_TOKEN CONSTANT VARCHAR2(30) := 'SECURITY_CONTEXT';
SURROGATE_KEY          CONSTANT VARCHAR2(30) := 'SURROGATE_KEY';
DEFAULT_ON_NULL_TOKEN  CONSTANT VARCHAR2(30) := 'DEFAULT_ON_NULL'; --12c
IDENTITY_TOKEN         CONSTANT VARCHAR2(30) := 'IDENTITY'; --12c

-- infinite loop protection
MAXITERATIONS          CONSTANT INTEGER := 10000;

-- max string from an Apex item value
MAXLEN_APEX            CONSTANT INTEGER := 4000;

--oddgen parameters
oddgen_gen_tapi        constant varchar2(100) := 'Generate Table API?';
oddgen_gen_apexapi     constant varchar2(100) := 'Generate Apex API?';
oddgen_execute         constant varchar2(100) := 'Execute?';
oddgen_jnl_table       constant varchar2(100) := 'Create/Alter Journal Table?';
oddgen_jnl_trigger     constant varchar2(100) := 'Create Journal Trigger?';
oddgen_jnl_indexes     constant varchar2(100) := 'Create Journal Indexes?';

TYPE str_array       IS TABLE OF VARCHAR2(32767) INDEX BY BINARY_INTEGER;
TYPE num_array       IS TABLE OF NUMBER          INDEX BY BINARY_INTEGER;

g_pk_cols     VARCHAR2(4000);
g_pk_cols_tab VARCHAR2(30);
g_surkey_tab  VARCHAR2(30);
g_surkey_col  VARCHAR2(30);
g_surkey_seq  VARCHAR2(30);

g_cond_cache  key_value_array;
g_cols_cache  key_value_array;
g_col_hits    INTEGER;
g_col_misses  INTEGER;

/*******************************************************************************
                               FORWARD DECLARATIONS
*******************************************************************************/

PROCEDURE evaluate_all
  (template_spec IN VARCHAR2
  ,table_name    IN VARCHAR2
  ,placeholders  IN key_value_array := null_kv_array
  ,buf           IN OUT NOCOPY CLOB
  ,recursing     IN BOOLEAN         := FALSE
  );

/*******************************************************************************
                               PRIVATE METHODS
*******************************************************************************/

PROCEDURE reset_package_globals IS
  scope  logger_logs.scope%type := scope_prefix || 'reset_package_globals';
  params logger.tab_param;
BEGIN
  logger.log('START', scope, null, params);

  g_pk_cols     := NULL;
  g_pk_cols_tab := NULL;
  g_surkey_tab  := NULL;
  g_surkey_col  := NULL;
  g_surkey_seq  := NULL;
  g_cond_cache.DELETE;
  g_cols_cache.DELETE;
  g_col_hits    := 0;
  g_col_misses  := 0;

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END reset_package_globals;

PROCEDURE process_placeholders
  (placeholders IN key_value_array
  ,buf          IN OUT NOCOPY CLOB
  ) IS
  scope  logger_logs.scope%type := scope_prefix || 'process_placeholders';
  params logger.tab_param;
  key    VARCHAR2(4000);
BEGIN
  logger.append_param(params, 'placeholders.COUNT', placeholders.COUNT);
  logger.log('START', scope, null, params);

  key := placeholders.FIRST;

  LOOP
    EXIT WHEN key IS NULL;

    buf := REPLACE(buf, key, placeholders(key));

    key := placeholders.NEXT(key);
  END LOOP;

  -- do newlines last
  buf := REPLACE(buf, '\n', CHR(10));

  logger.log('END', scope, 'buf=' || buf, params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END process_placeholders;

-- return a new Oracle identifier (<=30 chars) based on an original identifier plus a suffix
FUNCTION suffix_identifier
  (original IN VARCHAR2
  ,suffix   IN VARCHAR2
  ) RETURN VARCHAR2 IS
BEGIN
  RETURN SUBSTR(UPPER(original), 1, 30 - LENGTH(suffix)) || suffix;
END suffix_identifier;

FUNCTION journal_table_name (table_name IN VARCHAR2) RETURN VARCHAR2 IS
BEGIN
  RETURN suffix_identifier(original => table_name
                          ,suffix   => TEMPLATES.JOURNAL_TAB_SUFFIX);
END journal_table_name;

FUNCTION journal_trigger_name (table_name IN VARCHAR2) RETURN VARCHAR2 IS
BEGIN
  RETURN suffix_identifier(original => table_name
                          ,suffix   => TEMPLATES.JOURNAL_TRG_SUFFIX);
END journal_trigger_name;

FUNCTION tapi_package_name (table_name IN VARCHAR2) RETURN VARCHAR2 IS
BEGIN
  RETURN suffix_identifier(original => table_name
                          ,suffix   => TEMPLATES.TAPI_SUFFIX);
END tapi_package_name;

FUNCTION apexapi_package_name (table_name IN VARCHAR2) RETURN VARCHAR2 IS
BEGIN
  RETURN suffix_identifier(original => table_name
                          ,suffix   => TEMPLATES.APEXAPI_SUFFIX);
END apexapi_package_name;

FUNCTION template_package_name (table_name IN VARCHAR2) RETURN VARCHAR2 IS
BEGIN
  RETURN suffix_identifier(original => table_name
                          ,suffix   => TEMPLATES.TEMPLATE_SUFFIX);
END template_package_name;

FUNCTION view_name (table_name IN VARCHAR2) RETURN VARCHAR2 IS
BEGIN
  RETURN suffix_identifier(original => table_name
                          ,suffix   => TEMPLATES.LOV_VW_SUFFIX);
END view_name;

-- list all the primary key columns for the table
FUNCTION pk_cols (table_name IN VARCHAR2) RETURN VARCHAR2 IS
  scope  logger_logs.scope%type := scope_prefix || 'pk_cols';
  params logger.tab_param;
BEGIN
  logger.append_param(params, 'table_name', table_name);
  logger.log('START', scope, null, params);
  
  IF g_pk_cols_tab IS NULL OR g_pk_cols_tab != table_name THEN
    g_pk_cols_tab := table_name;
    SELECT LISTAGG(cc.column_name,',') WITHIN GROUP (ORDER BY cc.column_name)
    INTO   g_pk_cols
    FROM   user_constraints cn
    JOIN   user_cons_columns cc
    ON     cn.constraint_name = cc.constraint_name
    WHERE  cn.table_name = UPPER(pk_cols.table_name)
    AND    cn.constraint_type = 'P';
  END IF;

  logger.log('END', scope, null, params);
  RETURN g_pk_cols;
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END pk_cols;

PROCEDURE get_surrogate_key (table_name IN VARCHAR2) IS
  scope  logger_logs.scope%type := scope_prefix || 'get_surrogate_key';
  params logger.tab_param;
BEGIN
  logger.append_param(params, 'table_name', table_name);
  logger.log('START', scope, null, params);

  IF g_surkey_tab IS NULL OR g_surkey_tab != table_name THEN
    g_surkey_tab := table_name;
    -- check to see if there is a surrogate key with a corresponding sequence
    -- e.g. FT_ID would have sequence FT_ID_SEQ
    -- used for assigning ID from sequence
    BEGIN
      SELECT cc.column_name
            ,s.sequence_name
      INTO   g_surkey_col
            ,g_surkey_seq
      FROM   user_constraints c
      JOIN   user_cons_columns cc
      ON     c.constraint_name = cc.constraint_name
      JOIN   user_sequences s
      ON     s.sequence_name = cc.column_name||'_SEQ'
      WHERE  c.table_name = UPPER(g_surkey_tab)
      AND    c.constraint_type = 'P';
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        NULL;
      WHEN TOO_MANY_ROWS THEN
        g_surkey_col := NULL;
        g_surkey_seq := NULL;
    END;
  END IF;

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END get_surrogate_key;

FUNCTION surrogate_key_column (table_name IN VARCHAR2) RETURN VARCHAR2 IS
BEGIN
  get_surrogate_key (table_name => table_name);
  RETURN g_surkey_col;
END surrogate_key_column;

FUNCTION surrogate_key_sequence (table_name IN VARCHAR2) RETURN VARCHAR2 IS
BEGIN
  get_surrogate_key (table_name => table_name);
  RETURN g_surkey_seq;
END surrogate_key_sequence;

FUNCTION datatype_code (data_type IN VARCHAR2, column_name IN VARCHAR2) RETURN VARCHAR2 IS
BEGIN
  RETURN CASE
    WHEN column_name = 'ROWID'
    THEN 'ROWID'
    WHEN NVL(data_type,'?') IN ('?', 'CHAR', 'NCHAR', 'VARCHAR2', 'VARCHAR2', 'NVARCHAR', 'NVARCHAR2')
     AND column_name LIKE '%/_' || UTIL.COL_SUFFIX_IND ESCAPE '/'
    THEN 'IND'
    WHEN NVL(data_type,'?') IN ('?', 'CHAR', 'NCHAR', 'VARCHAR2', 'VARCHAR2', 'NVARCHAR', 'NVARCHAR2')
     AND column_name LIKE '%/_' || UTIL.COL_SUFFIX_YN ESCAPE '/'
    THEN 'YN'
    WHEN NVL(data_type,'?') IN ('?', 'CHAR', 'NCHAR', 'VARCHAR2', 'VARCHAR2', 'NVARCHAR', 'NVARCHAR2')
     AND column_name LIKE '%/_' || UTIL.COL_SUFFIX_CODE ESCAPE '/'
    THEN 'CODE'
    WHEN data_type IN ('CHAR', 'NCHAR', 'VARCHAR2', 'VARCHAR2', 'NVARCHAR', 'NVARCHAR2')
    THEN 'VARCHAR2'
    WHEN NVL(data_type,'?') IN ('?', 'NUMBER')
     AND column_name LIKE '%/_' || UTIL.COL_SUFFIX_ID ESCAPE '/'
    THEN 'ID'
    WHEN NVL(data_type,'?') IN ('?', 'DATE')
     AND column_name LIKE '%/_' || UTIL.COL_SUFFIX_DATETIME ESCAPE '/'
    THEN 'DATETIME'
    WHEN data_type LIKE 'TIMESTAMP(%)'                THEN 'TIMESTAMP'
    WHEN data_type LIKE 'TIMESTAMP(%) WITH TIME ZONE' THEN 'TIMESTAMP_TZ'
    WHEN data_type IS NULL
     AND column_name LIKE '%/_' || UTIL.COL_SUFFIX_DATE ESCAPE '/'
    THEN 'DATE'
    ELSE data_type
    END;
END datatype_code;

FUNCTION to_csv_inlist (csv IN VARCHAR2) RETURN VARCHAR2 IS
BEGIN
  RETURN '(''' || REPLACE(csv,',',''',''') || ''')';
END to_csv_inlist;

-- return a string listing all the columns from the table
FUNCTION cols
  (table_name      IN VARCHAR2
  ,template_arr    IN key_value_array
  ,sep             IN VARCHAR2
  ,cols_where      IN VARCHAR2
  ,pseudocolumns   IN VARCHAR2
  ,virtual_columns IN BOOLEAN
  ) RETURN VARCHAR2 IS
  scope           logger_logs.scope%type := scope_prefix || 'cols';
  params          logger.tab_param;
  qry             VARCHAR2(32767);
  colname         str_array;
  datatype        str_array;
  maxlen          num_array;
  datadef         str_array;
  basetype        str_array;
  tmp             VARCHAR2(4000);
  buf             VARCHAR2(32767);
  col_uc          VARCHAR2(40);
  col_lc          VARCHAR2(40);
  tablecolumn     VARCHAR2(100);
  surkey_sequence VARCHAR2(30);
  surkey_column   VARCHAR2(30);
  pseudocol       t_str_array;
  idx             NUMBER;
  maxcolnamelen   NUMBER;
  lob_datatypes_list VARCHAR2(4000);
  datatype_full   VARCHAR2(1000);
BEGIN
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'template_arr.COUNT', template_arr.COUNT);
  logger.append_param(params, 'sep', sep);
  logger.append_param(params, 'cols_where', cols_where);
  logger.append_param(params, 'pseudocolumns', pseudocolumns);
  logger.append_param(params, 'virtual_columns', virtual_columns);
  logger.log('START', scope, null, params);

  qry := q'[
SELECT column_name
      ,data_type
      ,char_length
      ,data_default
      ,data_type
       || CASE
          WHEN data_type IN ('CHAR','NCHAR','VARCHAR','VARCHAR2','NVARCHAR2')
          THEN '(' || char_length || ' '
            || DECODE(char_used,'B','BYTE','C','CHAR')
            || ')'
          WHEN data_type IN ('NUMBER')
           AND data_precision IS NOT NULL
          THEN '(' || data_precision
            || CASE WHEN data_scale IS NOT NULL THEN ',' || data_scale END
            || ')'
          END
       AS basetype
FROM   user_tab_cols
WHERE  table_name = :table_name
AND    hidden_column = 'NO'
]'  || CASE WHEN cols_where IS NOT NULL THEN ' AND (' || cols_where || ') ' END
    || CASE WHEN NOT virtual_columns THEN q'[ AND virtual_column='NO' ]' END
    || q'[ORDER BY CASE WHEN UTIL.csv_instr(:generated_columns, column_name) > 0 THEN 2 ELSE 1 END, column_id]';

  EXECUTE IMMEDIATE qry
    BULK COLLECT INTO colname, datatype, maxlen, datadef, basetype
    USING UPPER(table_name), TEMPLATES.GENERATED_COLUMNS_LIST;
  
  IF pseudocolumns IS NOT NULL THEN
    pseudocol := CSV_UTIL_PKG.csv_to_array(pseudocolumns);
    FOR i IN 1..pseudocol.COUNT LOOP
      IF pseudocol(i) = ROWID_TOKEN THEN
        idx := 0; --put rowid as first in list
        basetype(idx) := 'ROWID';
      ELSE
        idx := NVL(colname.LAST,0) + 1;
        basetype(idx) := 'VARCHAR2(' || MAXLEN_APEX || ')'; -- just default it to whatever
      END IF;
      colname(idx) := pseudocol(i);
      datatype(idx) := '';
      maxlen(idx) := NULL;
      datadef(idx) := '';
    END LOOP;
  END IF;

  IF colname.COUNT > 0 THEN

    FOR i IN colname.FIRST..colname.LAST LOOP
      maxcolnamelen := GREATEST(LENGTH(colname(i)), NVL(maxcolnamelen,0));
    END LOOP;

    surkey_sequence := surrogate_key_sequence(table_name);
    surkey_column   := surrogate_key_column(table_name);

    FOR i IN colname.FIRST..colname.LAST LOOP

      -- determine which template to use for this column
      tmp := NULL;
      -- 1. see if a template exists for this exact table.column
      tablecolumn := UPPER(table_name) || '.' || UPPER(colname(i));
      IF template_arr.EXISTS(tablecolumn) THEN
        tmp := template_arr(tablecolumn);
      -- 2. see if a template exists for the column name
      ELSIF template_arr.EXISTS(UPPER(colname(i))) THEN
        tmp := template_arr(UPPER(colname(i)));
      -- 3. if it's a surrogate key column, see if a template exists for surrogate key
      ELSIF colname(i) = surkey_column AND template_arr.EXISTS(SURROGATE_KEY) THEN
        tmp := template_arr(SURROGATE_KEY);
      ELSE
        -- 4. see if a template exists for the column's data type
        datatype(i) := datatype_code(data_type => datatype(i), column_name => colname(i));
        IF template_arr.EXISTS(datatype(i)) THEN
          tmp := template_arr(datatype(i));
        -- 5. if it's a LOB type, see if there is a LOB template
        ELSIF datatype(i) IS NOT NULL AND UTIL.csv_instr(TEMPLATES.LOB_DATATYPES_LIST, datatype(i)) > 0
        AND template_arr.EXISTS(LOB_TOKEN) THEN
          tmp := template_arr(LOB_TOKEN);
        -- 6. see if a catch-all template exists
        ELSIF template_arr.EXISTS('*') THEN
          tmp := template_arr('*');
        END IF;
      END IF;

      -- if we found a template to use, use it
      IF tmp IS NOT NULL THEN
        -- determine if the column name needs to be quoted
        IF colname(i) = UPPER(colname(i))
        AND colname(i) = TRANSLATE(colname(i),' -=+;:[]\{}|'
                                             ,'************') THEN
          col_uc := UPPER(colname(i));
          col_lc := LOWER(colname(i));
        ELSE
          col_uc := '"' || colname(i) || '"';
          col_lc := '"' || colname(i) || '"';
        END IF;
        UTIL.append_str(buf
          ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
           REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
           REPLACE(REPLACE(
             tmp
            ,'#COL#',          col_uc)
            ,'#col#',          col_lc)
            ,'#COL28#',        SUBSTR(col_uc,1,28))
            ,'#col28#',        SUBSTR(col_lc,1,28))
            ,'#datatype#',     basetype(i))
            ,'#Label#',        UTIL.user_friendly_label(colname(i)))
            ,'#MAXLEN#',       maxlen(i))
            ,'#DATA_DEFAULT#', UTIL.trim_whitespace(datadef(i)))
            ,'#SEQ#',          UPPER(surkey_sequence))
            ,'#seq#',          LOWER(surkey_sequence))
            ,'#00i#',          TO_CHAR(i,'fm000'))
            ,'...',            RPAD(' ',maxcolnamelen-LENGTH(colname(i)),' '))
          ,sep => sep);
      END IF;

    END LOOP;

  END IF;

  -- if no columns matched the search criteria, use the "NONE" template, if it
  -- was supplied
  IF buf IS NULL AND template_arr.EXISTS('NONE') THEN
    buf := template_arr('NONE');
  END IF;

  logger.log('END', scope, null, params);
  RETURN buf;
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END cols;

FUNCTION chunkerize
  (buf    IN OUT NOCOPY CLOB
  ,tokens IN t_str_array
  ) RETURN str_array IS
  scope        logger_logs.scope%type := scope_prefix || 'chunkerize';
  params       logger.tab_param;
  iteration    INTEGER := 0;
  offset       INTEGER := 0;
  next_token   INTEGER;
  next_token1  INTEGER;
  chunk_idx    INTEGER := 0;
  chunks       str_array;

  PROCEDURE add_chunk
    (amount IN NUMBER
    ,offset IN NUMBER) IS
    chnk VARCHAR2(32767);
  BEGIN
    IF amount > 32767 THEN
      RAISE_APPLICATION_ERROR(-20000, 'chunkerize: chunk too large (' || amount || ', offset ' || offset || ')');
    END IF;
    chnk := UTIL.lob_substr
              (lob_loc => buf
              ,amount  => amount
              ,offset  => offset);
    IF chnk IS NOT NULL THEN
      chunk_idx := chunk_idx + 1;
      chunks(chunk_idx) := chnk;
    END IF;
  END add_chunk;

BEGIN
  logger.append_param(params, 'tokens.COUNT', tokens.COUNT);
  logger.log('START', scope, null, params);

  LOOP
    iteration := iteration + 1;
    IF iteration > 1000 THEN
      RAISE_APPLICATION_ERROR(-20000, 'max iterations');
    END IF;

    next_token := NULL;
    FOR i IN 1..tokens.COUNT LOOP
      -- search for the next parse token
      next_token1 := DBMS_LOB.instr
        (lob_loc => buf
        ,pattern => tokens(i)
        ,offset  => offset + 1
        ,nth     => 1);
      IF next_token1 > 0 THEN
        IF next_token IS NULL THEN
          next_token := next_token1;
        ELSE
          next_token := LEAST(next_token, next_token1);
        END IF;
      END IF;
    END LOOP;

    IF NVL(next_token,0) = 0 THEN
      add_chunk(amount  => DBMS_LOB.getlength(buf) - GREATEST(offset,1) + 1
               ,offset  => GREATEST(offset,1));
    END IF;

    EXIT WHEN NVL(next_token,0) = 0;

    add_chunk(amount  => next_token - GREATEST(offset,1)
             ,offset  => GREATEST(offset,1));

    offset := next_token;

  END LOOP;

  logger.log('END', scope, 'chunks.COUNT=' || chunks.COUNT, params);
  RETURN chunks;
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END chunkerize;

PROCEDURE assemble_chunks
  (chunks IN str_array
  ,buf    IN OUT NOCOPY CLOB) IS
  scope  logger_logs.scope%type := scope_prefix || 'assemble_chunks';
  params logger.tab_param;
  i      BINARY_INTEGER;
BEGIN
  logger.append_param(params, 'chunks.COUNT', chunks.COUNT);
  logger.log('START', scope, null, params);

  DBMS_LOB.trim(lob_loc => buf, newlen => 0);
  i := chunks.FIRST;
  LOOP
    EXIT WHEN i IS NULL;
    IF LENGTH(chunks(i)) > 0 THEN
      DBMS_LOB.writeappend
        (lob_loc => buf
        ,amount  => LENGTH(chunks(i))
        ,buffer  => chunks(i));
    END IF;
    i := chunks.NEXT(i);
  END LOOP;

  logger.log('END', scope, 'LENGTH(buf)=' || DBMS_LOB.getlength(buf), params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END assemble_chunks;

PROCEDURE evaluate_columns
  (table_name IN VARCHAR2
  ,buf        IN OUT NOCOPY CLOB) IS
  scope  logger_logs.scope%type := scope_prefix || 'evaluate_columns';
  params logger.tab_param;
  chunks str_array;

  PROCEDURE get_options
    (cmd     IN VARCHAR2
    ,include OUT NOCOPY VARCHAR2
    ,exclude OUT NOCOPY VARCHAR2
    ,only    OUT NOCOPY VARCHAR2) IS
    arr         t_str_array;
    parse_token VARCHAR2(100);
  BEGIN
    include := '';
    exclude := '';
    only    := '';

    arr := CSV_UTIL_PKG.csv_to_array
      (p_csv_line  => cmd
      ,p_separator => ' ');

    FOR i IN 1..arr.COUNT LOOP
      IF arr(i) IS NOT NULL THEN
        IF arr(i) IN (INCLUDING_TOKEN, EXCLUDING_TOKEN, ONLY_TOKEN) THEN
          parse_token := arr(i);
        ELSE
          CASE parse_token
          WHEN INCLUDING_TOKEN THEN UTIL.append_str(include, arr(i), ',');
          WHEN EXCLUDING_TOKEN THEN UTIL.append_str(exclude, arr(i), ',');
          WHEN ONLY_TOKEN      THEN UTIL.append_str(only,    arr(i), ',');
          ELSE
            RAISE_APPLICATION_ERROR(-20000, 'Unexpected token: ' || arr(i));
          END CASE;
        END IF;
      END IF;
    END LOOP;

  END get_options;

  FUNCTION expand_column_lists (str IN VARCHAR2) RETURN VARCHAR2 IS
    buf VARCHAR2(32767) := str;
  BEGIN
    IF UTIL.csv_instr(buf, GENERATED_TOKEN) > 0 THEN
      buf := UTIL.csv_replace(buf, GENERATED_TOKEN, TEMPLATES.GENERATED_COLUMNS_LIST);
    END IF;
    IF UTIL.csv_instr(buf, AUDIT_TOKEN) > 0 THEN
      buf := UTIL.csv_replace(buf, AUDIT_TOKEN, TEMPLATES.AUDIT_COLUMNS_LIST);
    END IF;
    IF UTIL.csv_instr(buf, PK_TOKEN) > 0 THEN
      buf := UTIL.csv_replace(buf, PK_TOKEN, pk_cols(table_name));
    END IF;
    IF UTIL.csv_instr(buf, SURROGATE_KEY) > 0 THEN
      buf := UTIL.csv_replace(buf, SURROGATE_KEY, surrogate_key_column(table_name));
    END IF;
    RETURN buf;
  END expand_column_lists;

  FUNCTION remove_other_tables (str IN VARCHAR2) RETURN VARCHAR2 IS
    arr t_str_array;
    buf VARCHAR2(32767);
  BEGIN
    arr := CSV_UTIL_PKG.csv_to_array(str);
    FOR i IN 1..arr.COUNT LOOP
      IF arr(i) LIKE '%.%' THEN
        -- only keep the column if it's for this table
        IF UTIL.starts_with(arr(i), UPPER(table_name) || '.') THEN
          UTIL.append_str(buf, UTIL.replace_prefix(arr(i), UPPER(table_name) || '.'));
        END IF;
      ELSE
        -- no table name; always keep
        UTIL.append_str(buf, arr(i));
      END IF;
    END LOOP;
    RETURN buf;
  END remove_other_tables;

  FUNCTION evaluate_column_spec (str IN VARCHAR2) RETURN VARCHAR2 IS
    colcmd        VARCHAR2(32767);
    colptn        VARCHAR2(32767);
    ptn           t_str_array;
    sep           VARCHAR2(4000);
    lhs           VARCHAR2(4000);
    rhs           VARCHAR2(4000);
    tmp           key_value_array;
    include       VARCHAR2(4000);
    exclude       VARCHAR2(4000);
    only          VARCHAR2(4000);
    colswhere     VARCHAR2(4000);
    pseudocolumns VARCHAR2(4000);
    virtuals      BOOLEAN := FALSE;
    buf           VARCHAR2(32767);
  BEGIN
    IF LENGTH(str) <= 4000 AND g_cols_cache.EXISTS(str) THEN
      buf := g_cols_cache(str);
      g_col_hits := g_col_hits + 1;
    ELSE

      UTIL.split_str
        (str   => str
        ,delim => '>'
        ,lhs   => colcmd
        ,rhs   => colptn);

      colcmd := UPPER(UTIL.trim_whitespace(colcmd));

      get_options
        (cmd     => colcmd
        ,include => include
        ,exclude => exclude
        ,only    => only);

      -- EXCLUDING option
      IF UTIL.csv_instr(exclude, NULLABLE_TOKEN) > 0 THEN
        exclude := UTIL.csv_replace(exclude, NULLABLE_TOKEN);
        UTIL.append_str(colswhere, q'[nullable='N']', ' AND ');
      END IF;
      IF UTIL.csv_instr(exclude, DEFAULT_VALUE_TOKEN) > 0 THEN
        exclude := UTIL.csv_replace(exclude, DEFAULT_VALUE_TOKEN);
        UTIL.append_str(colswhere, 'data_default IS NULL', ' AND ');
      END IF;
      IF UTIL.csv_instr(exclude, LOBS_TOKEN) > 0 THEN
        exclude := UTIL.csv_replace(exclude, LOBS_TOKEN);
        UTIL.append_str(colswhere, 'data_type NOT IN ' || to_csv_inlist(TEMPLATES.LOB_DATATYPES_LIST), ' AND ');
      END IF;
      IF UTIL.csv_instr(exclude, CODE_TOKEN) > 0 THEN
        exclude := UTIL.csv_replace(exclude, CODE_TOKEN);
        UTIL.append_str(colswhere, 'column_name NOT LIKE ''%\_CODE'' escape ''\''', ' AND ');
      END IF;
      IF UTIL.csv_instr(exclude, ID_TOKEN) > 0 THEN
        exclude := UTIL.csv_replace(exclude, ID_TOKEN);
        UTIL.append_str(colswhere, 'column_name NOT LIKE ''%\_ID'' escape ''\''', ' AND ');
      END IF;
      IF UTIL.csv_instr(exclude, IND_TOKEN) > 0 THEN
        exclude := UTIL.csv_replace(exclude, IND_TOKEN);
        UTIL.append_str(colswhere, 'column_name NOT LIKE ''%\_IND'' escape ''\''', ' AND ');
      END IF;
$if dbms_db_version.version >= 12 $then
      IF UTIL.csv_instr(exclude, DEFAULT_ON_NULL_TOKEN) > 0 THEN
        exclude := UTIL.csv_replace(exclude, DEFAULT_ON_NULL_TOKEN);
        UTIL.append_str(colswhere, q'[default_on_null='NO']', ' AND ');
      END IF;
      IF UTIL.csv_instr(exclude, IDENTITY_TOKEN) > 0 THEN
        exclude := UTIL.csv_replace(exclude, IDENTITY_TOKEN);
        UTIL.append_str(colswhere, q'[identity_column='NO']', ' AND ');
      END IF;
$end
      exclude := expand_column_lists(exclude);
      IF exclude IS NOT NULL THEN
        -- if any table-specific columns are in the list, remove them if they're
        -- not for this table
        exclude := remove_other_tables(exclude);
        UTIL.append_str(colswhere, 'column_name NOT IN ' || to_csv_inlist(exclude), ' AND ');
      END IF;

      -- INCLUDING option
      IF UTIL.csv_instr(include, VIRTUAL_TOKEN) > 0 THEN
        virtuals := TRUE;
        include := UTIL.csv_replace(include, VIRTUAL_TOKEN);
      END IF;
      -- if the table uses a surrogate key, don't include ROWID
      IF UTIL.csv_instr(include, ROWID_TOKEN) > 0
      AND surrogate_key_column (table_name => table_name) IS NOT NULL THEN
        include := UTIL.csv_replace(include, ROWID_TOKEN);
      END IF;

      IF include IS NOT NULL THEN
        -- if any table-specific columns are in the list, remove them if they're
        -- not for this table
        include := remove_other_tables(include);
        pseudocolumns := include;
      END IF;

      -- ONLY option
      IF UTIL.csv_instr(only, NULLABLE_TOKEN) > 0 THEN
        only := UTIL.csv_replace(only, NULLABLE_TOKEN);
        UTIL.append_str(colswhere, q'[nullable='Y']', ' AND ');
      END IF;
      IF UTIL.csv_instr(only, DEFAULT_VALUE_TOKEN) > 0 THEN
        only := UTIL.csv_replace(only, DEFAULT_VALUE_TOKEN);
        UTIL.append_str(colswhere, 'data_default IS NOT NULL', ' AND ');
      END IF;
      IF UTIL.csv_instr(only, LOBS_TOKEN) > 0 THEN
        only := UTIL.csv_replace(only, LOBS_TOKEN);
        UTIL.append_str(colswhere, 'data_type IN ' || to_csv_inlist(TEMPLATES.LOB_DATATYPES_LIST), ' AND ');
      END IF;
      IF UTIL.csv_instr(only, CODE_TOKEN) > 0 THEN
        only := UTIL.csv_replace(only, CODE_TOKEN);
        UTIL.append_str(colswhere, 'column_name LIKE ''%\_CODE'' escape ''\''', ' AND ');
      END IF;
      IF UTIL.csv_instr(only, ID_TOKEN) > 0 THEN
        only := UTIL.csv_replace(only, ID_TOKEN);
        UTIL.append_str(colswhere, 'column_name LIKE ''%\_ID'' escape ''\''', ' AND ');
      END IF;
      IF UTIL.csv_instr(only, IND_TOKEN) > 0 THEN
        only := UTIL.csv_replace(only, IND_TOKEN);
        UTIL.append_str(colswhere, 'column_name LIKE ''%\_IND'' escape ''\''', ' AND ');
      END IF;
      IF UTIL.csv_instr(only, VIRTUAL_TOKEN) > 0 THEN
        only := UTIL.csv_replace(only, VIRTUAL_TOKEN);
        virtuals := TRUE;
        UTIL.append_str(colswhere, q'[virtual_column='YES']', ' AND ');
      END IF;
      IF UTIL.csv_instr(only, SURROGATE_KEY) > 0
      AND UTIL.csv_replace(only, SURROGATE_KEY) IS NULL
      AND surrogate_key_column (table_name => table_name) IS NULL THEN
        only := UTIL.csv_replace(only, SURROGATE_KEY);
        IF only IS NULL THEN
          UTIL.append_str(colswhere, '1=2'/*no surrogate key*/, ' AND ');
        END IF;
      END IF;
$if dbms_db_version.version >= 12 $then
      IF UTIL.csv_instr(only, DEFAULT_ON_NULL_TOKEN) > 0 THEN
        only := UTIL.csv_replace(only, DEFAULT_ON_NULL_TOKEN);
        UTIL.append_str(colswhere, q'[default_on_null='YES']', ' AND ');
      END IF;
      IF UTIL.csv_instr(only, IDENTITY_TOKEN) > 0 THEN
        only := UTIL.csv_replace(only, IDENTITY_TOKEN);
        UTIL.append_str(colswhere, q'[identity_column='YES']', ' AND ');
      END IF;
$end
      only := expand_column_lists(only);
      IF only IS NOT NULL THEN
        -- if any table-specific columns are in the list, remove them if they're
        -- not for this table
        only := remove_other_tables(only);
        UTIL.append_str(colswhere, 'column_name IN ' || to_csv_inlist(only), ' AND ');
      END IF;

      ptn := CSV_UTIL_PKG.csv_to_array
        (p_csv_line  => colptn
        ,p_separator => '~');
      FOR i IN 1..ptn.COUNT LOOP
        IF ptn(i) LIKE '%{%}' THEN
          -- we have found a targetted template
          UTIL.split_str(ptn(i), '{', lhs, rhs);
          rhs := RTRIM(rhs,'}');
          tmp(rhs) := UTIL.trim_whitespace(lhs);
        ELSIF NOT tmp.EXISTS('*') THEN
          -- first non-targeted template is the default template
          tmp('*') := UTIL.trim_whitespace(ptn(i));
        ELSE
          -- last non-targetted template is the separator (delimiter) template
          sep := ptn(i);
        END IF;
      END LOOP;

      buf := cols(table_name      => table_name
                 ,template_arr    => tmp
                 ,sep             => sep
                 ,cols_where      => colswhere
                 ,pseudocolumns   => pseudocolumns
                 ,virtual_columns => virtuals);

      IF LENGTH(str) <= 4000 THEN
        g_cols_cache(str) := buf;
        g_col_misses := g_col_misses + 1;
      END IF;

    END IF;

    RETURN buf;
  END evaluate_column_spec;

BEGIN
  logger.append_param(params, 'table_name', table_name);
  logger.log('START', scope, null, params);

  chunks := chunkerize
    (buf    => buf
    ,tokens => t_str_array(COLUMNS_TOKEN, END_TOKEN));

  FOR i IN 1..chunks.COUNT LOOP
    IF UTIL.starts_with(chunks(i), COLUMNS_TOKEN) THEN
      chunks(i) := UTIL.replace_prefix(chunks(i), COLUMNS_TOKEN);
      chunks(i) := evaluate_column_spec (str => chunks(i));
    ELSIF UTIL.starts_with(chunks(i), END_TOKEN) THEN
      chunks(i) := UTIL.replace_prefix(chunks(i), END_TOKEN);
    END IF;
  END LOOP;

  assemble_chunks
    (chunks => chunks
    ,buf    => buf);

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END evaluate_columns;

FUNCTION lobs_exist (table_name IN VARCHAR2) RETURN BOOLEAN IS
  scope  logger_logs.scope%type := scope_prefix || 'lobs_exist';
  params logger.tab_param;
  dummy  NUMBER;
BEGIN
  logger.append_param(params, 'table_name', table_name);
  logger.log('START', scope, null, params);

  SELECT 1 INTO dummy
  FROM   user_tab_columns t
  WHERE  t.table_name = UPPER(lobs_exist.table_name)
  AND    t.data_type IN ('BLOB','CLOB','XMLTYPE')
  AND ROWNUM = 1;

  logger.log('END', scope, 'TRUE', params);
  RETURN TRUE;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    logger.log('END', scope, 'FALSE', params);
    RETURN FALSE;
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END lobs_exist;

PROCEDURE evaluate_ifs
  (table_name IN VARCHAR2
  ,buf        IN OUT NOCOPY CLOB) IS
  scope     logger_logs.scope%type := scope_prefix || 'evaluate_ifs';
  params    logger.tab_param;
  iteration INTEGER;
  chunks    str_array;
  idx       BINARY_INTEGER;

  FUNCTION evaluate_if_spec (chunk_id IN BINARY_INTEGER) RETURN BOOLEAN IS
    if_spec VARCHAR2(4000);
    res     BOOLEAN;
    resid   VARCHAR2(32767);
  BEGIN
    UTIL.split_str
      (str   => chunks(chunk_id)
      ,delim => '>'
      ,lhs   => if_spec
      ,rhs   => resid);
    if_spec := UPPER(if_spec);
    chunks(chunk_id) := resid;
    IF g_cond_cache.EXISTS(if_spec) THEN
      res := g_cond_cache(if_spec) = 'TRUE';
    ELSE
      CASE
      WHEN if_spec = ROWID_TOKEN THEN
        res := surrogate_key_column (table_name => table_name) IS NULL;
      WHEN if_spec = LOBS_TOKEN THEN
        res := lobs_exist (table_name => table_name);
      WHEN if_spec LIKE 'DBMS/_%' ESCAPE '/' THEN
        res := DEPLOY.is_granted
          (owner       => 'SYS'
          ,object_name => if_spec
          ,privilege   => 'EXECUTE');
      WHEN if_spec = SECURITY_CONTEXT_TOKEN THEN
        res := SECURITY.context_installed;
      ELSE
        res := UPPER(if_spec) = UPPER(table_name);
      END CASE;
      g_cond_cache(if_spec) := CASE WHEN res THEN 'TRUE' ELSE 'FALSE' END;
    END IF;
    RETURN res;
  END evaluate_if_spec;
BEGIN
  logger.append_param(params, 'table_name', table_name);
  logger.log('START', scope, null, params);

  chunks := chunkerize
    (buf    => buf
    ,tokens => t_str_array(IF_TOKEN, ELSE_TOKEN, ENDIF_TOKEN));

  iteration := 0;
  idx := chunks.FIRST;
  LOOP
    iteration := iteration + 1;
    IF iteration > 100 THEN
      RAISE_APPLICATION_ERROR(-20000, 'max iterations');
    END IF;
    EXIT WHEN idx IS NULL;

    IF UTIL.starts_with(chunks(idx), IF_TOKEN) THEN
      chunks(idx) := UTIL.replace_prefix(chunks(idx), IF_TOKEN);
      IF evaluate_if_spec(idx) THEN
        IF chunks.NEXT(idx) IS NOT NULL THEN
          IF UTIL.starts_with(chunks(chunks.NEXT(idx)), ELSE_TOKEN) THEN
            chunks.DELETE(chunks.NEXT(idx));
          ELSIF UTIL.starts_with(chunks(chunks.NEXT(idx)), IF_TOKEN) THEN
            RAISE_APPLICATION_ERROR(-20000, 'Sorry, nested $IFs are not supported');
          END IF;
        END IF;
      ELSE
        chunks.DELETE(idx);
      END IF;
    ELSIF UTIL.starts_with(chunks(idx), ELSE_TOKEN) THEN
      chunks(idx) := UTIL.replace_prefix(chunks(idx), ELSE_TOKEN);
      IF chunks.NEXT(idx) IS NOT NULL THEN
        IF UTIL.starts_with(chunks(chunks.NEXT(idx)), ELSE_TOKEN) THEN
          RAISE_APPLICATION_ERROR(-20000, 'Unexpected ' || ELSE_TOKEN);
        ELSIF UTIL.starts_with(chunks(chunks.NEXT(idx)), IF_TOKEN) THEN
          RAISE_APPLICATION_ERROR(-20000, 'Sorry, nested $IFs are not supported');
        END IF;
      END IF;
    ELSIF UTIL.starts_with(chunks(idx), ENDIF_TOKEN) THEN
      chunks(idx) := UTIL.replace_prefix(chunks(idx), ENDIF_TOKEN);
      IF chunks.NEXT(idx) IS NOT NULL THEN
        IF UTIL.starts_with(chunks(chunks.NEXT(idx)), ELSE_TOKEN) THEN
          RAISE_APPLICATION_ERROR(-20000, 'Unexpected ' || ELSE_TOKEN);
        END IF;
      END IF;
    END IF;

    idx := chunks.NEXT(idx);
  END LOOP;

  assemble_chunks
    (chunks => chunks
    ,buf    => buf);

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END evaluate_ifs;

PROCEDURE evaluate_includes
  (table_name   IN VARCHAR2
  ,placeholders IN key_value_array
  ,buf          IN OUT CLOB) IS
  scope     logger_logs.scope%type := scope_prefix || 'evaluate_includes';
  params    logger.tab_param;
  iteration INTEGER;
  chunks    str_array;
  idx       BINARY_INTEGER;
  nxt       BINARY_INTEGER;

  PROCEDURE evaluate_include (chnk IN OUT VARCHAR2) IS
    template_name VARCHAR2(1000);
    resid         VARCHAR2(32767);
    buf           CLOB;
  BEGIN
    UTIL.split_str
      (str   => chnk
      ,delim => '>'
      ,lhs   => template_name
      ,rhs   => resid);
    evaluate_all
      (template_spec => template_name
      ,table_name    => table_name
      ,placeholders  => placeholders
      ,buf           => buf
      ,recursing     => TRUE);
    -- insert markers so future maintainers know where the code came from (or
    -- where additional custom code may be added)
    chnk := '/**{' || template_name || '}**/' || CHR(10)
         || buf
         || '/**{/' || template_name || '}**/' || resid;
  END evaluate_include;
BEGIN
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'placeholders.COUNT', placeholders.COUNT);
  logger.log('START', scope, null, params);

  chunks := chunkerize
    (buf    => buf
    ,tokens => t_str_array(INCLUDE_TOKEN));

  iteration := 0;
  idx := chunks.FIRST;
  LOOP
    iteration := iteration + 1;
    IF iteration > 100 THEN
      RAISE_APPLICATION_ERROR(-20000, 'max iterations');
    END IF;
    EXIT WHEN idx IS NULL;

    IF UTIL.starts_with(chunks(idx), INCLUDE_TOKEN) THEN
      chunks(idx) := UTIL.replace_prefix(chunks(idx), INCLUDE_TOKEN);
      evaluate_include(chunks(idx));
    END IF;

    idx := chunks.NEXT(idx);
  END LOOP;

  assemble_chunks
    (chunks => chunks
    ,buf    => buf);

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END evaluate_includes;

PROCEDURE get_template
  (template_spec IN VARCHAR2
  ,buf           IN OUT NOCOPY CLOB) IS
  scope         logger_logs.scope%type := scope_prefix || 'get_template';
  params        logger.tab_param;
  package_name  VARCHAR2(30);
  template_name VARCHAR2(100);
  chunks        str_array;
  patt_start    VARCHAR2(200);
  patt_end      VARCHAR2(200) := END_TEMPLATE_TOKEN;
BEGIN
  logger.append_param(params, 'template_spec', template_spec);
  logger.log('START', scope, null, params);

  assert(template_spec IS NOT NULL, 'template_spec cannot be null', scope);
  assert(INSTR(template_spec,'.') > 1, 'template_spec must include package name ("' || template_spec || '")', scope);
  
  package_name  := SUBSTR(template_spec, 1, INSTR(template_spec,'.')-1);
  template_name := SUBSTR(template_spec, INSTR(template_spec,'.')+1);
  patt_start    := TEMPLATE_TOKEN || template_name || '>';

  -- known issue: does not work if a template only has 1 line
  
  SELECT txt
  BULK COLLECT INTO chunks
  FROM (
    SELECT line, txt, start_idx, MIN(CASE WHEN end_idx > start_idx THEN end_idx END) OVER () AS end_idx
    FROM (
      SELECT s.line
            ,RTRIM(s.text) txt
            ,MIN(CASE
                 WHEN SUBSTR(s.text, 1, LENGTH(get_template.patt_start)) = get_template.patt_start
                 THEN s.line + 1
                 END) OVER () start_idx
            ,CASE
             WHEN SUBSTR(s.text, 1, LENGTH(get_template.patt_end)) = get_template.patt_end
             THEN s.line - 1
             END end_idx
      FROM   user_source s
      WHERE  s.name = get_template.package_name
      ) )
  WHERE line BETWEEN start_idx AND end_idx
  ORDER BY line;
  
  IF chunks.COUNT = 0 THEN
    RAISE NO_DATA_FOUND;
  END IF;

  assemble_chunks
    (chunks => chunks
    ,buf    => buf);

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    logger.log('Template not found', scope, null, params);
    RAISE;
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END get_template;

PROCEDURE evaluate_all
  (template_spec IN VARCHAR2
  ,table_name    IN VARCHAR2
  ,placeholders  IN key_value_array := null_kv_array
  ,buf           IN OUT NOCOPY CLOB
  ,recursing     IN BOOLEAN         := FALSE
  ) IS
  scope    logger_logs.scope%type := scope_prefix || 'evaluate_all';
  params   logger.tab_param;
  ph       key_value_array;
  app_user VARCHAR2(1000) := coalesce(sys_context('APEX$SESSION','APP_USER'),sys_context('USERENV','SESSION_USER'));
BEGIN
  logger.append_param(params, 'template_spec', template_spec);
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'placeholders.COUNT', placeholders.COUNT);
  logger.append_param(params, 'recursing', recursing);
  logger.log('START', scope, null, params);

  assert(template_spec IS NOT NULL, 'template_spec cannot be null', scope);
  assert(table_name IS NOT NULL, 'table_name cannot be null', scope);

  assert(INSTR(template_spec,'.') > 1, 'template_spec must include package name ("' || template_spec || '")', scope);

  IF NOT recursing THEN
    reset_package_globals;
  END IF;

  DBMS_LOB.createtemporary(buf, true);
  DBMS_LOB.trim(lob_loc => buf, newlen => 0);

  BEGIN
    get_template
      (template_spec => template_spec
      ,buf           => buf);
  
    ph := placeholders;
  
    ph('<%APEXAPI>')   := UPPER(apexapi_package_name(table_name));
    ph('<%apexapi>')   := LOWER(apexapi_package_name(table_name));
    ph('<%CONTEXT>')   := SECURITY.CTX;
    ph('<%CONTEXT_APP_USER>') := DEPLOY.context_app_user;
    ph('<%Entities>')  := UTIL.user_friendly_label(table_name); -- assume tables are named in the plural
    ph('<%entities>')  := LOWER(UTIL.user_friendly_label(table_name));
    ph('<%Entity>')    := UTIL.user_friendly_label(table_name, inflect => UTIL.SINGULAR);
    ph('<%entity>')    := LOWER(UTIL.user_friendly_label(table_name, inflect => UTIL.SINGULAR));
    ph('<%JOURNAL>')   := UPPER(journal_table_name(table_name));
    ph('<%journal>')   := LOWER(journal_table_name(table_name));
    ph('<%SYSDATE>')   := TO_CHAR(SYSDATE, UTIL.DATE_FORMAT);
    ph('<%SYSDT>')     := TO_CHAR(SYSDATE, UTIL.DATETIME_FORMAT);
    ph('<%TABLE>')     := UPPER(table_name);
    ph('<%table>')     := LOWER(table_name);
    ph('<%TAPI>')      := UPPER(tapi_package_name(table_name));
    ph('<%tapi>')      := LOWER(tapi_package_name(table_name));
    ph('<%TEMPLATE>')  := UPPER(template_package_name(table_name));
    ph('<%template>')  := LOWER(template_package_name(table_name));
    ph('<%TRIGGER>')   := UPPER(journal_trigger_name(table_name));
    ph('<%trigger>')   := LOWER(journal_trigger_name(table_name));
    ph('<%USER>')      := UPPER(app_user);
    ph('<%user>')      := LOWER(app_user);
    ph('<%VIEW>')      := UPPER(view_name(table_name));
    ph('<%view>')      := LOWER(view_name(table_name));
  
    -- some placeholders may include other template code, so process them first
    process_placeholders(placeholders => ph, buf => buf);
  
    evaluate_ifs (table_name => table_name, buf => buf);
  
    evaluate_columns (table_name => table_name, buf => buf);
  
    evaluate_includes
      (table_name   => table_name
      ,placeholders => placeholders
      ,buf          => buf);
    
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      IF recursing THEN
        logger.log('Skipping template (not found)', scope, null, params);
      ELSE
        logger.log_error('Template not found', scope, null, params);
        RAISE_APPLICATION_ERROR(-20000, 'Template not found (' || template_spec || ')');
      END IF;
  END;

  IF NOT recursing THEN
    reset_package_globals;
  END IF;
  
  logger.log('END', scope, null, params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END evaluate_all;

/*******************************************************************************
                               PUBLIC INTERFACE
*******************************************************************************/

FUNCTION gen
  (template_name        IN VARCHAR2
  ,table_name           IN VARCHAR2
  ,placeholders         IN key_value_array := null_kv_array
  ) RETURN CLOB IS
  scope  logger_logs.scope%type := scope_prefix || 'gen(FUNC)';
  params logger.tab_param;
  buf CLOB;
BEGIN
  logger.append_param(params, 'template_name', template_name);
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'placeholders.COUNT', placeholders.COUNT);
  logger.log('START', scope, null, params);

  logger.log_info('gen ' || template_name || ' for ' || table_name, scope, null, params);
  DBMS_OUTPUT.put_line('gen ' || template_name || ' for ' || table_name);

  assert(template_name IS NOT NULL, 'template_name cannot be null', scope);
  assert(table_name IS NOT NULL, 'table_name cannot be null', scope);

  IF NOT DEPLOY.table_exists(table_name) THEN
    RAISE_APPLICATION_ERROR(-20000, 'Table not found: ' || table_name);
  END IF;

  evaluate_all
    (template_spec => CASE WHEN INSTR(template_name,'.') = 0
                      THEN TEMPLATES_PACKAGE || '.'
                      END
                   || template_name
    ,table_name    => table_name
    ,placeholders  => placeholders
    ,buf           => buf);

  logger.log('END', scope, buf, params);
  RETURN buf;
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END gen;

PROCEDURE gen
  (template_name        IN VARCHAR2
  ,table_name           IN VARCHAR2
  ,placeholders         IN key_value_array := null_kv_array
  ,raise_ddl_exceptions IN BOOLEAN := TRUE) IS
  scope  logger_logs.scope%type := scope_prefix || 'gen(EXEC)';
  params logger.tab_param;
  buf CLOB;
BEGIN
  logger.append_param(params, 'template_name', template_name);
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'placeholders.COUNT', placeholders.COUNT);
  logger.append_param(params, 'raise_ddl_exceptions', raise_ddl_exceptions);
  logger.log('START', scope, null, params);
  
  buf := gen(template_name => template_name
            ,table_name    => table_name
            ,placeholders  => placeholders);

  BEGIN
    DEPLOY.exec_ddl(buf);
  EXCEPTION
    WHEN OTHERS THEN
      IF raise_ddl_exceptions THEN
        RAISE;
      ELSE
        logger.log_error(template_name || ' compile error: ' || SQLERRM, scope, null, params);
        DBMS_OUTPUT.put_line(template_name || ' compile error: ' || SQLERRM);
      END IF;
  END;

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END gen;

PROCEDURE journal_table
  (table_name           IN VARCHAR2
  ,raise_ddl_exceptions IN BOOLEAN := TRUE
  ,journal_indexes      IN BOOLEAN := FALSE) IS
  scope        logger_logs.scope%type := scope_prefix || 'journal_table';
  params       logger.tab_param;
  jnl_table    VARCHAR2(30);
  jnl_trigger  VARCHAR2(30);
BEGIN
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'raise_ddl_exceptions', raise_ddl_exceptions);
  logger.append_param(params, 'journal_indexes', journal_indexes);
  logger.log('START', scope, null, params);

  logger.log_info('journal_table ' || table_name, scope, null, params);

  assert(table_name IS NOT NULL, 'table_name cannot be null', scope);

  IF NOT DEPLOY.table_exists(table_name) THEN
    RAISE_APPLICATION_ERROR(-20000, 'Table not found: ' || table_name);
  END IF;

  jnl_table   := journal_table_name(table_name);
  jnl_trigger := journal_trigger_name(table_name);

  IF NOT DEPLOY.table_exists(jnl_table) THEN

    DEPLOY.exec_ddl(REPLACE(REPLACE(
       'CREATE TABLE #JOURNAL# AS SELECT * FROM #TABLE# WHERE 1=0'
       ,'#JOURNAL#', jnl_table)
       ,'#TABLE#',   table_name)
      );

    DEPLOY.exec_ddl(REPLACE(REPLACE(
       'ALTER TABLE #TABLE# ADD #column#'
       ,'#TABLE#',  jnl_table)
       ,'#column#', '(JN$ACTION VARCHAR2(1), JN$TIMESTAMP TIMESTAMP, JN$ACTION_BY VARCHAR2(100))')
      );

    -- the journal table may have some not null constraints; remove them
    FOR r IN (SELECT c.column_name
              FROM   user_tab_columns c
              WHERE  c.table_name = UPPER(journal_table.jnl_table)
              AND    c.nullable = 'N') LOOP
      DEPLOY.exec_ddl(REPLACE(REPLACE(
         'ALTER TABLE #TABLE# MODIFY #column# NULL'
         ,'#TABLE#',  jnl_table)
         ,'#column#', r.column_name)
        );
    END LOOP;

  ELSE

    -- alter journal table to match source table

    -- remove any old columns
    FOR r IN (SELECT c.column_name FROM user_tab_columns c
              WHERE  c.table_name = UPPER(journal_table.jnl_table)
              AND    c.column_name NOT IN ('JN$ACTION','JN$TIMESTAMP','JN$ACTION_BY')
              MINUS
              SELECT c.column_name FROM user_tab_columns c
              WHERE  c.table_name = UPPER(journal_table.table_name)
             ) LOOP
      DEPLOY.drop_column(table_name => jnl_table, column_name => r.column_name);
    END LOOP;

    -- add any new columns
    FOR r IN (SELECT c.column_name
                    ,c.data_type
                     || case
                        when c.data_type IN ('CHAR','VARCHAR','VARCHAR2','NCHAR','NVARCHAR2') THEN
                          '(' || c.char_length || ')'
                        when c.data_type = 'NUMBER' THEN
                          case when c.data_precision is not null and c.data_scale is not null
                          then '(' || NVL(c.data_precision,0) || ',' || NVL(c.data_scale,0) || ')'
                          else '(' || c.data_length || ')'
                          end
                        end
                     AS col_def
              FROM   user_tab_columns c
              WHERE  c.table_name = UPPER(journal_table.table_name)
              ORDER BY column_id) LOOP
      DEPLOY.add_column
        (table_name        => jnl_table
        ,column_name       => r.column_name
        ,column_definition => r.col_def
        );
    END LOOP;

    -- increase max length for altered columns
    FOR r IN (SELECT c.column_name
                    ,c.data_type || '(' || c.char_length || ')'
                     AS col_def
              FROM   user_tab_columns c
              WHERE  c.table_name = UPPER(journal_table.table_name)
              AND    c.data_type IN ('CHAR','VARCHAR','VARCHAR2','NCHAR','NVARCHAR2')
              AND    c.char_length > (SELECT j.char_length
                                      FROM   user_tab_columns j
                                      WHERE  j.table_name = UPPER(journal_table.jnl_table)
                                      AND    j.column_name = c.column_name)
              ORDER BY column_id) LOOP
      DEPLOY.exec_ddl(REPLACE(REPLACE(REPLACE(
        'ALTER TABLE #JOURNAL# MODIFY #column# #col_def#'
       ,'#JOURNAL#', jnl_table)
       ,'#column#',  r.column_name)
       ,'#col_def#', r.col_def)
        );
    END LOOP;

    -- add jn columns if not already there
    DEPLOY.add_column(jnl_table, 'JN$ACTION',    'VARCHAR2(1)');
    DEPLOY.add_column(jnl_table, 'JN$TIMESTAMP', 'TIMESTAMP');
    DEPLOY.add_column(jnl_table, 'JN$ACTION_BY', 'VARCHAR2(100)');

  END IF;

  IF journal_indexes THEN
    DEPLOY.create_index
      (index_name   => jnl_table || '$IX1'
      ,index_target => jnl_table || '(' || pk_cols(table_name) || ',VERSION_ID)');
    DEPLOY.create_index
      (index_name   => jnl_table || '$IX2'
      ,index_target => jnl_table || '(' || pk_cols(table_name) || ',JN$TIMESTAMP)');
  END IF;

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END journal_table;

PROCEDURE journal_trigger
  (table_name           IN VARCHAR2
  ,raise_ddl_exceptions IN BOOLEAN := TRUE) IS
  scope        logger_logs.scope%type := scope_prefix || 'journal_trigger';
  params       logger.tab_param;
BEGIN
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'raise_ddl_exceptions', raise_ddl_exceptions);
  logger.log('START', scope, null, params);

  logger.log_info('journal_trigger ' || table_name, scope, null, params);

  assert(table_name IS NOT NULL, 'table_name cannot be null', scope);

  IF NOT DEPLOY.table_exists(table_name) THEN
    RAISE_APPLICATION_ERROR(-20000, 'Table not found: ' || table_name);
  END IF;

  gen
    (template_name        => 'CREATE_JOURNAL_TRIGGER'
    ,table_name           => table_name
    ,raise_ddl_exceptions => raise_ddl_exceptions);

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END journal_trigger;

PROCEDURE all_journals
  (journal_triggers IN BOOLEAN := TRUE
  ,journal_indexes  IN BOOLEAN := FALSE) IS
  scope  logger_logs.scope%type := scope_prefix || 'all_journals';
  params logger.tab_param;
BEGIN
  logger.append_param(params, 'journal_triggers', journal_triggers);
  logger.append_param(params, 'journal_indexes', journal_indexes);
  logger.log('START', scope, null, params);

  FOR r IN (
    SELECT t.table_name
    FROM   user_tables t
    WHERE  t.table_name NOT LIKE '%'||TEMPLATES.JOURNAL_TAB_SUFFIX
    ORDER BY t.table_name
    ) LOOP

    journal_table
      (table_name           => r.table_name
      ,raise_ddl_exceptions => FALSE
      ,journal_indexes      => journal_indexes);

    IF journal_triggers THEN
      journal_trigger
        (table_name           => r.table_name
        ,raise_ddl_exceptions => FALSE);
    END IF;

  END LOOP;

  DEPLOY.dbms_output_errors(object_type => 'TRIGGER');

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END all_journals;

PROCEDURE all_tapis (table_name IN VARCHAR2 := NULL) IS
  scope  logger_logs.scope%type := scope_prefix || 'all_tapis';
  params logger.tab_param;
BEGIN
  logger.append_param(params, 'table_name', table_name);
  logger.log('START', scope, null, params);

  FOR r IN (
    SELECT t.table_name
    FROM   user_tables t
    WHERE  (all_tapis.table_name IS NULL
            AND t.table_name NOT LIKE '%'||TEMPLATES.JOURNAL_TAB_SUFFIX)
    OR     t.table_name = UPPER(all_tapis.table_name)
    ORDER BY t.table_name
    ) LOOP

    gen
      (template_name => 'TAPI_PACKAGE_SPEC'
      ,table_name    => r.table_name
      ,raise_ddl_exceptions => FALSE);

    gen
      (template_name => 'TAPI_PACKAGE_BODY'
      ,table_name    => r.table_name
      ,raise_ddl_exceptions => FALSE);

  END LOOP;

  IF table_name IS NULL THEN
    DEPLOY.dbms_output_errors(object_type => 'PACKAGE');
    DEPLOY.dbms_output_errors(object_type => 'PACKAGE BODY');
  END IF;

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END all_tapis;

PROCEDURE all_apexapis (table_name IN VARCHAR2 := NULL) IS
  scope  logger_logs.scope%type := scope_prefix || 'all_apexapis';
  params logger.tab_param;
BEGIN
  logger.append_param(params, 'table_name', table_name);
  logger.log('START', scope, null, params);

  FOR r IN (
    SELECT t.table_name
    FROM   user_tables t
    WHERE  (all_apexapis.table_name IS NULL
            AND t.table_name NOT LIKE '%'||TEMPLATES.JOURNAL_TAB_SUFFIX)
    OR     t.table_name = UPPER(all_apexapis.table_name)
    ORDER BY t.table_name
    ) LOOP

    gen
      (template_name => 'APEXAPI_PACKAGE_SPEC'
      ,table_name    => r.table_name
      ,raise_ddl_exceptions => FALSE);

    gen
      (template_name => 'APEXAPI_PACKAGE_BODY'
      ,table_name    => r.table_name
      ,raise_ddl_exceptions => FALSE);

  END LOOP;

  IF table_name IS NULL THEN
    DEPLOY.dbms_output_errors(object_type => 'PACKAGE');
    DEPLOY.dbms_output_errors(object_type => 'PACKAGE BODY');
  END IF;

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END all_apexapis;

PROCEDURE all_apis
  (table_name      IN VARCHAR2
  ,journal_indexes IN BOOLEAN := FALSE
  ,apex_api        IN BOOLEAN := TRUE) IS
  scope  logger_logs.scope%type := scope_prefix || 'all_apis';
  params logger.tab_param;
BEGIN
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'journal_indexes', journal_indexes);
  logger.append_param(params, 'apex_api', apex_api);
  logger.log('START', scope, null, params);
  
  -- the journal table is needed by the tapi
  journal_table
    (table_name      => table_name
    ,journal_indexes => FALSE);
  
  all_tapis (table_name => table_name);

  -- the journal trigger needs the tapi
  journal_trigger (table_name => table_name);

  IF apex_api THEN
    all_apexapis (table_name => table_name);
  END IF;

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END all_apis;

FUNCTION get_name RETURN VARCHAR2 IS
BEGIN
  RETURN 'TAPI / Apex API';
END get_name;

FUNCTION get_description RETURN VARCHAR2 IS
BEGIN
  RETURN 'Table API and/or Apex API generator';
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
  l_params(oddgen_gen_tapi) := 'Yes';
  l_params(oddgen_gen_apexapi) := 'Yes';
  l_params(oddgen_execute) := 'No';
  l_params(oddgen_jnl_table) := 'No';
  l_params(oddgen_jnl_trigger) := 'No';
  l_params(oddgen_jnl_indexes) := 'No';
  RETURN l_params;
END get_params;

FUNCTION get_ordered_params(in_object_type IN VARCHAR2, in_object_name IN VARCHAR2)
  RETURN t_string IS
BEGIN
  RETURN NEW t_string(oddgen_execute
                     ,oddgen_jnl_table
                     ,oddgen_jnl_trigger
                     ,oddgen_jnl_indexes
                     ,oddgen_gen_tapi
                     ,oddgen_gen_apexapi
                     );
END get_ordered_params;

FUNCTION get_lov
  (in_object_type IN VARCHAR2
  ,in_object_name IN VARCHAR2
  ,in_params      IN t_param
  ) RETURN t_lov IS
  l_lov t_lov;
BEGIN
  l_lov(oddgen_gen_tapi) := NEW t_string('Yes', 'No');
  l_lov(oddgen_gen_apexapi) := NEW t_string('Yes', 'No');
  l_lov(oddgen_execute) := NEW t_string('Yes', 'No');
  if in_params(oddgen_execute) = 'No' then
    l_lov(oddgen_jnl_table) := NEW t_string('No');
    l_lov(oddgen_jnl_trigger) := NEW t_string('No');
    l_lov(oddgen_jnl_indexes) := NEW t_string('No');
  else
    l_lov(oddgen_jnl_table) := NEW t_string('Yes', 'No');
    l_lov(oddgen_jnl_trigger) := NEW t_string('Yes', 'No');
    if in_params(oddgen_jnl_table) = 'Yes' then
      l_lov(oddgen_jnl_indexes) := NEW t_string('Yes', 'No');
    else
      l_lov(oddgen_jnl_indexes) := NEW t_string('No');
    end if;
  end if;
  RETURN l_lov;
END get_lov;

FUNCTION generate
  (in_object_type IN VARCHAR2
  ,in_object_name IN VARCHAR2
  ,in_params      IN t_param
  ) RETURN CLOB IS
  scope  logger_logs.scope%type := scope_prefix || 'generate';
  params logger.tab_param;
  buf clob := '/*Generated ' || to_char(sysdate,'DD/MM/YYYY HH:MIpm') || '*/' || CHR(10);
  ddl clob;
  post_script constant varchar2(1000) := '/' || CHR(10) || 'SHOW ERRORS' || CHR(10) || CHR(10);
  
  procedure process_template (template_name in varchar2) IS
  BEGIN
    ddl := gen
      (template_name => template_name
      ,table_name    => in_object_name);
    if in_params(oddgen_execute) = 'Yes' then
      BEGIN
        DEPLOY.exec_ddl(ddl);
        buf := buf || 'Success: ' || template_name || ' ' || in_object_name || CHR(10);
      EXCEPTION
        WHEN OTHERS THEN
          buf := buf || 'FAILED: ' || template_name || ' ' || in_object_name || CHR(10);
          buf := buf || ddl || '/' || CHR(10) || SQLERRM || CHR(10);
      END;
    else
      buf := buf || ddl || post_script;
    end if;
  END process_template;

BEGIN
  logger.append_param(params, 'in_object_type', in_object_type);
  logger.append_param(params, 'in_object_name', in_object_name);
  logger.append_param(params, 'in_params.count', in_params.count);
  logger.log('START', scope, null, params);

  if in_params(oddgen_jnl_table) = 'Yes' then

    journal_table
      (table_name      => in_object_name
      ,journal_indexes => in_params(oddgen_jnl_indexes) = 'Yes');
  
  end if;

  if in_params(oddgen_gen_tapi) = 'Yes' then
  
    process_template('TAPI_PACKAGE_SPEC');
    
    process_template('TAPI_PACKAGE_BODY');

  end if;

  if in_params(oddgen_jnl_trigger) = 'Yes' then

    journal_trigger (table_name => in_object_name);
  
  end if;
  
  if in_params(oddgen_gen_apexapi) = 'Yes' then
  
    process_template('APEXAPI_PACKAGE_SPEC');
    
    process_template('APEXAPI_PACKAGE_BODY');
  
  end if;

  buf := buf || gen
    (template_name => 'CODESAMPLES'
    ,table_name    => in_object_name);

  logger.log('END', scope, buf, params);
  RETURN buf;
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END generate;

END GEN_TAPIS;
/

SHOW ERRORS