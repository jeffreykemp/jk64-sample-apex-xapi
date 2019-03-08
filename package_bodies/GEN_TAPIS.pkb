create or replace package body gen_tapis as

scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

-- default template source
templates_package      constant varchar2(30) := 'TEMPLATES';

-- structural tokens
template_token         constant varchar2(30) := '<%TEMPLATE ';
end_template_token     constant varchar2(30) := '<%END TEMPLATE>';
columns_token          constant varchar2(30) := '<%COLUMNS';
end_token              constant varchar2(30) := '<%END>';
if_token               constant varchar2(30) := '<%IF ';
else_token             constant varchar2(30) := '<%ELSE>';
endif_token            constant varchar2(30) := '<%END IF>';
include_token          constant varchar2(30) := '<%INCLUDE ';

-- option marker tokens
including_token        constant varchar2(30) := 'INCLUDING';
excluding_token        constant varchar2(30) := 'EXCLUDING';
only_token             constant varchar2(30) := 'ONLY';

-- option value tokens
audit_token            constant varchar2(30) := 'AUDIT';
default_value_token    constant varchar2(30) := 'DEFAULT_VALUE';
generated_token        constant varchar2(30) := 'GENERATED';
nullable_token         constant varchar2(30) := 'NULLABLE';
lob_token              constant varchar2(30) := 'LOB';
lobs_token             constant varchar2(30) := 'LOBS';
code_token             constant varchar2(30) := 'CODE';
y_token                constant varchar2(30) := 'Y';
id_token               constant varchar2(30) := 'ID';
pk_token               constant varchar2(30) := 'PK';
rowid_token            constant varchar2(30) := 'ROWID';
virtual_token          constant varchar2(30) := 'VIRTUAL';
default_on_null_token  constant varchar2(30) := 'DEFAULT_ON_NULL';
identity_token         constant varchar2(30) := 'IDENTITY';
soft_delete_token      constant varchar2(30) := 'SOFT_DELETE';

-- infinite loop protection
maxiterations          constant integer := 10000;

-- max string from an APEX item value
maxlen_apex            constant integer := 4000;

--oddgen parameters
oddgen_gen_tapi        constant varchar2(100) := 'Generate Table API?';
oddgen_gen_apexapi     constant varchar2(100) := 'Generate APEX API?';
oddgen_execute         constant varchar2(100) := 'Execute?';
oddgen_jnl_table       constant varchar2(100) := 'Create/Alter Journal Table?';
oddgen_jnl_trigger     constant varchar2(100) := 'Create Journal Trigger?';
oddgen_jnl_indexes     constant varchar2(100) := 'Create Journal Indexes?';

type str_array       is table of varchar2(32767) index by binary_integer;
type num_array       is table of number          index by binary_integer;

g_pk_cols     varchar2(4000);
g_pk_cols_tab varchar2(30);
g_surkey_tab  varchar2(30);
g_surkey_col  varchar2(30);
g_surkey_seq  varchar2(30);

g_cond_cache  key_value_array;
g_cols_cache  key_value_array;
g_col_hits    integer;
g_col_misses  integer;

/*******************************************************************************
                               FORWARD DECLARATIONS
*******************************************************************************/

procedure evaluate_all
  (template_spec in varchar2
  ,table_name    in varchar2
  ,placeholders  in key_value_array := null_kv_array
  ,buf           in out nocopy clob
  ,recursing     in boolean         := false
  );

/*******************************************************************************
                               PRIVATE METHODS
*******************************************************************************/

procedure reset_package_globals is
  scope  logger_logs.scope%type := scope_prefix || 'reset_package_globals';
  params logger.tab_param;
begin
  logger.log('START', scope, null, params);

  g_pk_cols     := null;
  g_pk_cols_tab := null;
  g_surkey_tab  := null;
  g_surkey_col  := null;
  g_surkey_seq  := null;
  g_cond_cache.delete;
  g_cols_cache.delete;
  g_col_hits    := 0;
  g_col_misses  := 0;

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end reset_package_globals;

procedure process_placeholders
  (placeholders in key_value_array
  ,buf          in out nocopy clob
  ) is
  scope  logger_logs.scope%type := scope_prefix || 'process_placeholders';
  params logger.tab_param;
  key    varchar2(4000);
begin
  logger.append_param(params, 'placeholders.COUNT', placeholders.count);
  logger.log('START', scope, null, params);

  key := placeholders.first;

  loop
    exit when key is null;

    buf := replace(buf, key, placeholders(key));

    key := placeholders.next(key);
  end loop;

  -- do newlines last
  buf := replace(buf, '\n', chr(10));

  logger.log('END', scope, 'buf=' || buf, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end process_placeholders;

-- return a new Oracle identifier (<=30 chars) based on an original identifier plus a suffix
function suffix_identifier
  (original in varchar2
  ,suffix   in varchar2
  ) return varchar2 is
begin
  return substr(upper(original), 1, 30 - length(suffix)) || suffix;
end suffix_identifier;

function journal_table_name (table_name in varchar2) return varchar2 is
begin
  return suffix_identifier(original => table_name
                          ,suffix   => templates.journal_tab_suffix);
end journal_table_name;

function journal_trigger_name (table_name in varchar2) return varchar2 is
begin
  return suffix_identifier(original => table_name
                          ,suffix   => templates.journal_trg_suffix);
end journal_trigger_name;

function tapi_package_name (table_name in varchar2) return varchar2 is
begin
  return suffix_identifier(original => table_name
                          ,suffix   => templates.tapi_suffix);
end tapi_package_name;

function apexapi_package_name (table_name in varchar2) return varchar2 is
begin
  return suffix_identifier(original => table_name
                          ,suffix   => templates.apexapi_suffix);
end apexapi_package_name;

function template_package_name (table_name in varchar2) return varchar2 is
begin
  return suffix_identifier(original => table_name
                          ,suffix   => templates.template_suffix);
end template_package_name;

function view_name (table_name in varchar2) return varchar2 is
begin
  return suffix_identifier(original => table_name
                          ,suffix   => templates.lov_vw_suffix);
end view_name;

-- list all the primary key columns for the table
function pk_cols (table_name in varchar2) return varchar2 is
  scope  logger_logs.scope%type := scope_prefix || 'pk_cols';
  params logger.tab_param;
begin
  logger.append_param(params, 'table_name', table_name);
  logger.log('START', scope, null, params);
  
  if g_pk_cols_tab is null or g_pk_cols_tab != table_name then
    g_pk_cols_tab := table_name;
    select listagg(cc.column_name,',') within group (order by cc.column_name)
    into   g_pk_cols
    from   user_constraints cn
    join   user_cons_columns cc
    on     cn.constraint_name = cc.constraint_name
    where  cn.table_name = upper(pk_cols.table_name)
    and    cn.constraint_type = 'P';
  end if;

  logger.log('END', scope, null, params);
  return g_pk_cols;
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end pk_cols;

procedure get_surrogate_key (table_name in varchar2) is
  scope  logger_logs.scope%type := scope_prefix || 'get_surrogate_key';
  params logger.tab_param;
begin
  logger.append_param(params, 'table_name', table_name);
  logger.log('START', scope, null, params);

  if g_surkey_tab is null or g_surkey_tab != table_name then
    g_surkey_tab := table_name;
    -- check to see if there is a surrogate key with a corresponding sequence
    -- e.g. FT_ID would have sequence FT_ID_SEQ
    -- used for assigning ID from sequence
    begin
      select cc.column_name
            ,s.sequence_name
      into   g_surkey_col
            ,g_surkey_seq
      from   user_constraints c
      join   user_cons_columns cc
      on     c.constraint_name = cc.constraint_name
      join   user_sequences s
      on     s.sequence_name = cc.column_name||'_SEQ'
      where  c.table_name = upper(g_surkey_tab)
      and    c.constraint_type = 'P';
    exception
      when no_data_found then
        null;
      when too_many_rows then
        g_surkey_col := null;
        g_surkey_seq := null;
    end;
  end if;

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end get_surrogate_key;

function surrogate_key_column (table_name in varchar2) return varchar2 is
begin
  get_surrogate_key (table_name => table_name);
  return g_surkey_col;
end surrogate_key_column;

function surrogate_key_sequence (table_name in varchar2) return varchar2 is
begin
  get_surrogate_key (table_name => table_name);
  return g_surkey_seq;
end surrogate_key_sequence;

function datatype_code (data_type in varchar2, column_name in varchar2) return varchar2 is
begin
  return case
    when column_name = 'ROWID'
    then 'ROWID'
    when nvl(data_type,'?') in ('?', 'CHAR', 'NCHAR', 'VARCHAR2', 'VARCHAR2', 'NVARCHAR', 'NVARCHAR2')
     and column_name like '%/_' || util.col_suffix_ind escape '/'
    then 'IND'
    when nvl(data_type,'?') in ('?', 'CHAR', 'NCHAR', 'VARCHAR2', 'VARCHAR2', 'NVARCHAR', 'NVARCHAR2')
     and column_name like '%/_' || util.col_suffix_yn escape '/'
    then 'YN'
    when nvl(data_type,'?') in ('?', 'CHAR', 'NCHAR', 'VARCHAR2', 'VARCHAR2', 'NVARCHAR', 'NVARCHAR2')
     and column_name like '%/_' || util.col_suffix_code escape '/'
    then 'CODE'
    when data_type in ('CHAR', 'NCHAR', 'VARCHAR2', 'VARCHAR2', 'NVARCHAR', 'NVARCHAR2')
    then 'VARCHAR2'
    when nvl(data_type,'?') in ('?', 'NUMBER')
     and column_name like '%/_' || util.col_suffix_id escape '/'
    then 'ID'
    when nvl(data_type,'?') in ('?', 'DATE')
     and column_name like '%/_' || util.col_suffix_datetime escape '/'
    then 'DATETIME'
    when data_type like 'TIMESTAMP(%)'                then 'TIMESTAMP'
    when data_type like 'TIMESTAMP(%) WITH TIME ZONE' then 'TIMESTAMP_TZ'
    when data_type is null
     and column_name like '%/_' || util.col_suffix_date escape '/'
    then 'DATE'
    else data_type
    end;
end datatype_code;

function to_csv_inlist (csv in varchar2) return varchar2 is
begin
  return '(''' || replace(csv,',',''',''') || ''')';
end to_csv_inlist;

-- return a string listing all the columns from the table
function cols
  (table_name      in varchar2
  ,template_arr    in key_value_array
  ,sep             in varchar2
  ,cols_where      in varchar2
  ,pseudocolumns   in varchar2
  ,virtual_columns in boolean
  ) return varchar2 is
  scope           logger_logs.scope%type := scope_prefix || 'cols';
  params          logger.tab_param;
  qry             varchar2(32767);
  colname         str_array;
  datatype        str_array;
  maxlen          num_array;
  datadef         str_array;
  basetype        str_array;
  tmp             varchar2(4000);
  buf             varchar2(32767);
  col_uc          varchar2(40);
  col_lc          varchar2(40);
  tablecolumn     varchar2(100);
  surkey_sequence varchar2(30);
  surkey_column   varchar2(30);
  pseudocol       t_str_array;
  idx             number;
  maxcolnamelen   number;
  lob_datatypes_list varchar2(4000);
  datatype_full   varchar2(1000);
begin
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'template_arr.COUNT', template_arr.count);
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
]'  || case when cols_where is not null then ' AND (' || cols_where || ') ' end
    || case when not virtual_columns then q'[ AND virtual_column='NO' ]' end
    || q'[ORDER BY CASE WHEN UTIL.csv_instr(:generated_columns, column_name) > 0 THEN 2 ELSE 1 END, column_id]';

  execute immediate qry
    bulk collect into colname, datatype, maxlen, datadef, basetype
    using upper(table_name), templates.generated_columns_list;
  
  if pseudocolumns is not null then
    pseudocol := csv_util_pkg.csv_to_array(pseudocolumns);
    for i in 1..pseudocol.count loop
      if pseudocol(i) = rowid_token then
        idx := 0; --put rowid as first in list
        basetype(idx) := 'ROWID';
      else
        idx := nvl(colname.last,0) + 1;
        basetype(idx) := 'VARCHAR2(' || maxlen_apex || ')'; -- just default it to whatever
      end if;
      colname(idx) := pseudocol(i);
      datatype(idx) := '';
      maxlen(idx) := null;
      datadef(idx) := '';
    end loop;
  end if;

  if colname.count > 0 then

    for i in colname.first..colname.last loop
      maxcolnamelen := greatest(length(colname(i)), nvl(maxcolnamelen,0));
    end loop;

    surkey_sequence := surrogate_key_sequence(table_name);
    surkey_column   := surrogate_key_column(table_name);

    for i in colname.first..colname.last loop

      -- determine which template to use for this column
      tmp := null;
      -- 1. see if a template exists for this exact table.column
      tablecolumn := upper(table_name) || '.' || upper(colname(i));
      if template_arr.exists(tablecolumn) then
        tmp := template_arr(tablecolumn);
      -- 2. see if a template exists for the column name
      elsif template_arr.exists(upper(colname(i))) then
        tmp := template_arr(upper(colname(i)));
      -- 3. if it's a surrogate key column, see if a template exists for surrogate key
      elsif colname(i) = surkey_column and template_arr.exists(surrogate_key) then
        tmp := template_arr(surrogate_key);
      else
        -- 4. see if a template exists for the column's data type
        datatype(i) := datatype_code(data_type => datatype(i), column_name => colname(i));
        if template_arr.exists(datatype(i)) then
          tmp := template_arr(datatype(i));
        -- 5. if it's a LOB type, see if there is a LOB template
        elsif datatype(i) is not null and util.csv_instr(templates.lob_datatypes_list, datatype(i)) > 0
        and template_arr.exists(lob_token) then
          tmp := template_arr(lob_token);
        -- 6. see if a catch-all template exists
        elsif template_arr.exists('*') then
          tmp := template_arr('*');
        end if;
      end if;

      -- if we found a template to use, use it
      if tmp is not null then
        -- determine if the column name needs to be quoted
        if colname(i) = upper(colname(i))
        and colname(i) = translate(colname(i),' -=+;:[]\{}|'
                                             ,'************') then
          col_uc := upper(colname(i));
          col_lc := lower(colname(i));
        else
          col_uc := '"' || colname(i) || '"';
          col_lc := '"' || colname(i) || '"';
        end if;
        util.append_str(buf
          ,replace(replace(replace(replace(replace(
           replace(replace(replace(replace(replace(
           replace(replace(
             tmp
            ,'#COL#',          col_uc)
            ,'#col#',          col_lc)
            ,'#COL28#',        substr(col_uc,1,28))
            ,'#col28#',        substr(col_lc,1,28))
            ,'#datatype#',     basetype(i))
            ,'#Label#',        util.user_friendly_label(colname(i)))
            ,'#MAXLEN#',       maxlen(i))
            ,'#DATA_DEFAULT#', util.trim_whitespace(datadef(i)))
            ,'#SEQ#',          upper(surkey_sequence))
            ,'#seq#',          lower(surkey_sequence))
            ,'#00i#',          to_char(i,'fm000'))
            ,'...',            rpad(' ',maxcolnamelen-length(colname(i)),' '))
          ,sep => sep);
      end if;

    end loop;

  end if;

  -- if no columns matched the search criteria, use the "NONE" template, if it
  -- was supplied
  if buf is null and template_arr.exists('NONE') then
    buf := template_arr('NONE');
  end if;

  logger.log('END', scope, null, params);
  return buf;
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end cols;

function chunkerize
  (buf    in out nocopy clob
  ,tokens in t_str_array
  ) return str_array is
  scope        logger_logs.scope%type := scope_prefix || 'chunkerize';
  params       logger.tab_param;
  iteration    integer := 0;
  offset       integer := 0;
  next_token   integer;
  next_token1  integer;
  chunk_idx    integer := 0;
  chunks       str_array;

  procedure add_chunk
    (amount in number
    ,offset in number) is
    chnk varchar2(32767);
  begin
    if amount > 32767 then
      raise_application_error(-20000, 'chunkerize: chunk too large (' || amount || ', offset ' || offset || ')');
    end if;
    chnk := util.lob_substr
              (lob_loc => buf
              ,amount  => amount
              ,offset  => offset);
    if chnk is not null then
      chunk_idx := chunk_idx + 1;
      chunks(chunk_idx) := chnk;
    end if;
  end add_chunk;

begin
  logger.append_param(params, 'tokens.COUNT', tokens.count);
  logger.log('START', scope, null, params);

  loop
    iteration := iteration + 1;
    if iteration > 1000 then
      raise_application_error(-20000, 'max iterations');
    end if;

    next_token := null;
    for i in 1..tokens.count loop
      -- search for the next parse token
      next_token1 := dbms_lob.instr
        (lob_loc => buf
        ,pattern => tokens(i)
        ,offset  => offset + 1
        ,nth     => 1);
      if next_token1 > 0 then
        if next_token is null then
          next_token := next_token1;
        else
          next_token := least(next_token, next_token1);
        end if;
      end if;
    end loop;

    if nvl(next_token,0) = 0 then
      add_chunk(amount  => dbms_lob.getlength(buf) - greatest(offset,1) + 1
               ,offset  => greatest(offset,1));
    end if;

    exit when nvl(next_token,0) = 0;

    add_chunk(amount  => next_token - greatest(offset,1)
             ,offset  => greatest(offset,1));

    offset := next_token;

  end loop;

  logger.log('END', scope, 'chunks.COUNT=' || chunks.count, params);
  return chunks;
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end chunkerize;

procedure assemble_chunks
  (chunks in str_array
  ,buf    in out nocopy clob) is
  scope  logger_logs.scope%type := scope_prefix || 'assemble_chunks';
  params logger.tab_param;
  i      binary_integer;
begin
  logger.append_param(params, 'chunks.COUNT', chunks.count);
  logger.log('START', scope, null, params);

  dbms_lob.trim(lob_loc => buf, newlen => 0);
  i := chunks.first;
  loop
    exit when i is null;
    if length(chunks(i)) > 0 then
      dbms_lob.writeappend
        (lob_loc => buf
        ,amount  => length(chunks(i))
        ,buffer  => chunks(i));
    end if;
    i := chunks.next(i);
  end loop;

  logger.log('END', scope, 'LENGTH(buf)=' || dbms_lob.getlength(buf), params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end assemble_chunks;

procedure evaluate_columns
  (table_name in varchar2
  ,buf        in out nocopy clob) is
  scope  logger_logs.scope%type := scope_prefix || 'evaluate_columns';
  params logger.tab_param;
  chunks str_array;

  procedure get_options
    (cmd     in varchar2
    ,include out nocopy varchar2
    ,exclude out nocopy varchar2
    ,only    out nocopy varchar2) is
    arr         t_str_array;
    parse_token varchar2(100);
  begin
    include := '';
    exclude := '';
    only    := '';

    arr := csv_util_pkg.csv_to_array
      (p_csv_line  => cmd
      ,p_separator => ' ');

    for i in 1..arr.count loop
      if arr(i) is not null then
        if arr(i) in (including_token, excluding_token, only_token) then
          parse_token := arr(i);
        else
          case parse_token
          when including_token then util.append_str(include, arr(i), ',');
          when excluding_token then util.append_str(exclude, arr(i), ',');
          when only_token      then util.append_str(only,    arr(i), ',');
          else
            raise_application_error(-20000, 'Unexpected token: ' || arr(i));
          end case;
        end if;
      end if;
    end loop;

  end get_options;

  function expand_column_lists (str in varchar2) return varchar2 is
    buf varchar2(32767) := str;
  begin
    if util.csv_instr(buf, generated_token) > 0 then
      buf := util.csv_replace(buf, generated_token, templates.generated_columns_list);
    end if;
    if util.csv_instr(buf, audit_token) > 0 then
      buf := util.csv_replace(buf, audit_token, templates.audit_columns_list);
    end if;
    if util.csv_instr(buf, pk_token) > 0 then
      buf := util.csv_replace(buf, pk_token, pk_cols(table_name));
    end if;
    if util.csv_instr(buf, surrogate_key) > 0 then
      buf := util.csv_replace(buf, surrogate_key, surrogate_key_column(table_name));
    end if;
    return buf;
  end expand_column_lists;

  function remove_other_tables (str in varchar2) return varchar2 is
    arr t_str_array;
    buf varchar2(32767);
  begin
    arr := csv_util_pkg.csv_to_array(str);
    for i in 1..arr.count loop
      if arr(i) like '%.%' then
        -- only keep the column if it's for this table
        if util.starts_with(arr(i), upper(table_name) || '.') then
          util.append_str(buf, util.replace_prefix(arr(i), upper(table_name) || '.'));
        end if;
      else
        -- no table name; always keep
        util.append_str(buf, arr(i));
      end if;
    end loop;
    return buf;
  end remove_other_tables;

  function evaluate_column_spec (str in varchar2) return varchar2 is
    colcmd        varchar2(32767);
    colptn        varchar2(32767);
    ptn           t_str_array;
    sep           varchar2(4000);
    lhs           varchar2(4000);
    rhs           varchar2(4000);
    tmp           key_value_array;
    include       varchar2(4000);
    exclude       varchar2(4000);
    only          varchar2(4000);
    colswhere     varchar2(4000);
    pseudocolumns varchar2(4000);
    virtuals      boolean := false;
    buf           varchar2(32767);
  begin
    if length(str) <= 4000 and g_cols_cache.exists(str) then
      buf := g_cols_cache(str);
      g_col_hits := g_col_hits + 1;
    else

      util.split_str
        (str   => str
        ,delim => '>'
        ,lhs   => colcmd
        ,rhs   => colptn);

      colcmd := upper(util.trim_whitespace(colcmd));

      get_options
        (cmd     => colcmd
        ,include => include
        ,exclude => exclude
        ,only    => only);

      -- EXCLUDING option
      if util.csv_instr(exclude, nullable_token) > 0 then
        exclude := util.csv_replace(exclude, nullable_token);
        util.append_str(colswhere, q'[nullable='N']', ' AND ');
      end if;
      if util.csv_instr(exclude, default_value_token) > 0 then
        exclude := util.csv_replace(exclude, default_value_token);
        util.append_str(colswhere, 'data_default IS NULL', ' AND ');
      end if;
      if util.csv_instr(exclude, lobs_token) > 0 then
        exclude := util.csv_replace(exclude, lobs_token);
        util.append_str(colswhere, 'data_type NOT IN ' || to_csv_inlist(templates.lob_datatypes_list), ' AND ');
      end if;
      if util.csv_instr(exclude, code_token) > 0 then
        exclude := util.csv_replace(exclude, code_token);
        util.append_str(colswhere, 'column_name NOT LIKE ''%\_CODE'' escape ''\''', ' AND ');
      end if;
      if util.csv_instr(exclude, id_token) > 0 then
        exclude := util.csv_replace(exclude, id_token);
        util.append_str(colswhere, 'column_name NOT LIKE ''%\_ID'' escape ''\''', ' AND ');
      end if;
      if util.csv_instr(exclude, ind_token) > 0 then
        exclude := util.csv_replace(exclude, ind_token);
        util.append_str(colswhere, 'column_name NOT LIKE ''%\_IND'' escape ''\''', ' AND ');
      end if;
$if dbms_db_version.version >= 12 $then
      if util.csv_instr(exclude, default_on_null_token) > 0 then
        exclude := util.csv_replace(exclude, default_on_null_token);
        util.append_str(colswhere, q'[default_on_null='NO']', ' AND ');
      end if;
      if util.csv_instr(exclude, identity_token) > 0 then
        exclude := util.csv_replace(exclude, identity_token);
        util.append_str(colswhere, q'[identity_column='NO']', ' AND ');
      end if;
$end
      exclude := expand_column_lists(exclude);
      if exclude is not null then
        -- if any table-specific columns are in the list, remove them if they're
        -- not for this table
        exclude := remove_other_tables(exclude);
        util.append_str(colswhere, 'column_name NOT IN ' || to_csv_inlist(exclude), ' AND ');
      end if;

      -- INCLUDING option
      if util.csv_instr(include, virtual_token) > 0 then
        virtuals := true;
        include := util.csv_replace(include, virtual_token);
      end if;
      -- if the table uses a surrogate key, don't include ROWID
      if util.csv_instr(include, rowid_token) > 0
      and surrogate_key_column (table_name => table_name) is not null then
        include := util.csv_replace(include, rowid_token);
      end if;

      if include is not null then
        -- if any table-specific columns are in the list, remove them if they're
        -- not for this table
        include := remove_other_tables(include);
        pseudocolumns := include;
      end if;

      -- ONLY option
      if util.csv_instr(only, nullable_token) > 0 then
        only := util.csv_replace(only, nullable_token);
        util.append_str(colswhere, q'[nullable='Y']', ' AND ');
      end if;
      if util.csv_instr(only, default_value_token) > 0 then
        only := util.csv_replace(only, default_value_token);
        util.append_str(colswhere, 'data_default IS NOT NULL', ' AND ');
      end if;
      if util.csv_instr(only, lobs_token) > 0 then
        only := util.csv_replace(only, lobs_token);
        util.append_str(colswhere, 'data_type IN ' || to_csv_inlist(templates.lob_datatypes_list), ' AND ');
      end if;
      if util.csv_instr(only, code_token) > 0 then
        only := util.csv_replace(only, code_token);
        util.append_str(colswhere, 'column_name LIKE ''%\_CODE'' escape ''\''', ' AND ');
      end if;
      if util.csv_instr(only, id_token) > 0 then
        only := util.csv_replace(only, id_token);
        util.append_str(colswhere, 'column_name LIKE ''%\_ID'' escape ''\''', ' AND ');
      end if;
      if util.csv_instr(only, ind_token) > 0 then
        only := util.csv_replace(only, ind_token);
        util.append_str(colswhere, 'column_name LIKE ''%\_IND'' escape ''\''', ' AND ');
      end if;
      if util.csv_instr(only, virtual_token) > 0 then
        only := util.csv_replace(only, virtual_token);
        virtuals := true;
        util.append_str(colswhere, q'[virtual_column='YES']', ' AND ');
      end if;
      if util.csv_instr(only, surrogate_key) > 0
      and util.csv_replace(only, surrogate_key) is null
      and surrogate_key_column (table_name => table_name) is null then
        only := util.csv_replace(only, surrogate_key);
        if only is null then
          util.append_str(colswhere, '1=2'/*no surrogate key*/, ' AND ');
        end if;
      end if;
$if dbms_db_version.version >= 12 $then
      if util.csv_instr(only, default_on_null_token) > 0 then
        only := util.csv_replace(only, default_on_null_token);
        util.append_str(colswhere, q'[default_on_null='YES']', ' AND ');
      end if;
      if util.csv_instr(only, identity_token) > 0 then
        only := util.csv_replace(only, identity_token);
        util.append_str(colswhere, q'[identity_column='YES']', ' AND ');
      end if;
$end
      only := expand_column_lists(only);
      if only is not null then
        -- if any table-specific columns are in the list, remove them if they're
        -- not for this table
        only := remove_other_tables(only);
        util.append_str(colswhere, 'column_name IN ' || to_csv_inlist(only), ' AND ');
      end if;

      ptn := csv_util_pkg.csv_to_array
        (p_csv_line  => colptn
        ,p_separator => '~');
      for i in 1..ptn.count loop
        if ptn(i) like '%{%}' then
          -- we have found a targetted template
          util.split_str(ptn(i), '{', lhs, rhs);
          rhs := rtrim(rhs,'}');
          tmp(rhs) := util.trim_whitespace(lhs);
        elsif not tmp.exists('*') then
          -- first non-targeted template is the default template
          tmp('*') := util.trim_whitespace(ptn(i));
        else
          -- last non-targetted template is the separator (delimiter) template
          sep := ptn(i);
        end if;
      end loop;

      buf := cols(table_name      => table_name
                 ,template_arr    => tmp
                 ,sep             => sep
                 ,cols_where      => colswhere
                 ,pseudocolumns   => pseudocolumns
                 ,virtual_columns => virtuals);

      if length(str) <= 4000 then
        g_cols_cache(str) := buf;
        g_col_misses := g_col_misses + 1;
      end if;

    end if;

    return buf;
  end evaluate_column_spec;

begin
  logger.append_param(params, 'table_name', table_name);
  logger.log('START', scope, null, params);

  chunks := chunkerize
    (buf    => buf
    ,tokens => t_str_array(columns_token, end_token));

  for i in 1..chunks.count loop
    if util.starts_with(chunks(i), columns_token) then
      chunks(i) := util.replace_prefix(chunks(i), columns_token);
      chunks(i) := evaluate_column_spec (str => chunks(i));
    elsif util.starts_with(chunks(i), end_token) then
      chunks(i) := util.replace_prefix(chunks(i), end_token);
    end if;
  end loop;

  assemble_chunks
    (chunks => chunks
    ,buf    => buf);

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end evaluate_columns;

function lobs_exist (table_name in varchar2) return boolean is
  scope  logger_logs.scope%type := scope_prefix || 'lobs_exist';
  params logger.tab_param;
  dummy  number;
begin
  logger.append_param(params, 'table_name', table_name);
  logger.log('START', scope, null, params);

  select 1 into dummy
  from   user_tab_columns t
  where  t.table_name = upper(lobs_exist.table_name)
  and    t.data_type in ('BLOB','CLOB','XMLTYPE')
  and rownum = 1;

  logger.log('END', scope, 'TRUE', params);
  return true;
exception
  when no_data_found then
    logger.log('END', scope, 'FALSE', params);
    return false;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end lobs_exist;

procedure evaluate_ifs
  (table_name in varchar2
  ,buf        in out nocopy clob) is
  scope     logger_logs.scope%type := scope_prefix || 'evaluate_ifs';
  params    logger.tab_param;
  iteration integer;
  chunks    str_array;
  idx       binary_integer;

  function evaluate_if_spec (chunk_id in binary_integer) return boolean is
    if_spec varchar2(4000);
    res     boolean;
    resid   varchar2(32767);
  begin
    util.split_str
      (str   => chunks(chunk_id)
      ,delim => '>'
      ,lhs   => if_spec
      ,rhs   => resid);
    if_spec := upper(if_spec);
    chunks(chunk_id) := resid;
    if g_cond_cache.exists(if_spec) then
      res := g_cond_cache(if_spec) = 'TRUE';
    else
      case
      when if_spec = rowid_token then
        res := surrogate_key_column (table_name => table_name) is null;
      when if_spec = lobs_token then
        res := lobs_exist (table_name => table_name);
      when if_spec = soft_delete_token then
        res := deploy.column_exists(table_name => table_name, column_name => 'DELETED_Y');
      when if_spec like 'DBMS/_%' escape '/' then
        res := deploy.is_granted
          (owner       => 'SYS'
          ,object_name => if_spec
          ,privilege   => 'EXECUTE');
      else
        res := upper(if_spec) = upper(table_name);
      end case;
      g_cond_cache(if_spec) := case when res then 'TRUE' else 'FALSE' end;
    end if;
    return res;
  end evaluate_if_spec;
begin
  logger.append_param(params, 'table_name', table_name);
  logger.log('START', scope, null, params);

  chunks := chunkerize
    (buf    => buf
    ,tokens => t_str_array(if_token, else_token, endif_token));

  iteration := 0;
  idx := chunks.first;
  loop
    iteration := iteration + 1;
    if iteration > 100 then
      raise_application_error(-20000, 'max iterations');
    end if;
    exit when idx is null;

    if util.starts_with(chunks(idx), if_token) then
      chunks(idx) := util.replace_prefix(chunks(idx), if_token);
      if evaluate_if_spec(idx) then
        if chunks.next(idx) is not null then
          if util.starts_with(chunks(chunks.next(idx)), else_token) then
            chunks.delete(chunks.next(idx));
          elsif util.starts_with(chunks(chunks.next(idx)), if_token) then
            raise_application_error(-20000, 'Sorry, nested $IFs are not supported');
          end if;
        end if;
      else
        chunks.delete(idx);
      end if;
    elsif util.starts_with(chunks(idx), else_token) then
      chunks(idx) := util.replace_prefix(chunks(idx), else_token);
      if chunks.next(idx) is not null then
        if util.starts_with(chunks(chunks.next(idx)), else_token) then
          raise_application_error(-20000, 'Unexpected ' || else_token);
        elsif util.starts_with(chunks(chunks.next(idx)), if_token) then
          raise_application_error(-20000, 'Sorry, nested $IFs are not supported');
        end if;
      end if;
    elsif util.starts_with(chunks(idx), endif_token) then
      chunks(idx) := util.replace_prefix(chunks(idx), endif_token);
      if chunks.next(idx) is not null then
        if util.starts_with(chunks(chunks.next(idx)), else_token) then
          raise_application_error(-20000, 'Unexpected ' || else_token);
        end if;
      end if;
    end if;

    idx := chunks.next(idx);
  end loop;

  assemble_chunks
    (chunks => chunks
    ,buf    => buf);

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end evaluate_ifs;

procedure evaluate_includes
  (table_name   in varchar2
  ,placeholders in key_value_array
  ,buf          in out clob) is
  scope     logger_logs.scope%type := scope_prefix || 'evaluate_includes';
  params    logger.tab_param;
  iteration integer;
  chunks    str_array;
  idx       binary_integer;
  nxt       binary_integer;

  procedure evaluate_include (chnk in out varchar2) is
    template_name varchar2(1000);
    resid         varchar2(32767);
    buf           clob;
  begin
    util.split_str
      (str   => chnk
      ,delim => '>'
      ,lhs   => template_name
      ,rhs   => resid);
    evaluate_all
      (template_spec => template_name
      ,table_name    => table_name
      ,placeholders  => placeholders
      ,buf           => buf
      ,recursing     => true);
    -- insert markers so future maintainers know where the code came from (or
    -- where additional custom code may be added)
    chnk := '/**{' || template_name || '}**/' || chr(10)
         || buf
         || '/**{/' || template_name || '}**/' || resid;
  end evaluate_include;
begin
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'placeholders.COUNT', placeholders.count);
  logger.log('START', scope, null, params);

  chunks := chunkerize
    (buf    => buf
    ,tokens => t_str_array(include_token));

  iteration := 0;
  idx := chunks.first;
  loop
    iteration := iteration + 1;
    if iteration > 100 then
      raise_application_error(-20000, 'max iterations');
    end if;
    exit when idx is null;

    if util.starts_with(chunks(idx), include_token) then
      chunks(idx) := util.replace_prefix(chunks(idx), include_token);
      evaluate_include(chunks(idx));
    end if;

    idx := chunks.next(idx);
  end loop;

  assemble_chunks
    (chunks => chunks
    ,buf    => buf);

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end evaluate_includes;

procedure get_template
  (template_spec in varchar2
  ,buf           in out nocopy clob) is
  scope         logger_logs.scope%type := scope_prefix || 'get_template';
  params        logger.tab_param;
  package_name  varchar2(30);
  template_name varchar2(100);
  chunks        str_array;
  patt_start    varchar2(200);
  patt_end      varchar2(200) := end_template_token;
begin
  logger.append_param(params, 'template_spec', template_spec);
  logger.log('START', scope, null, params);

  assert(template_spec is not null, 'template_spec cannot be null', scope);
  assert(instr(template_spec,'.') > 1, 'template_spec must include package name ("' || template_spec || '")', scope);
  
  package_name  := substr(template_spec, 1, instr(template_spec,'.')-1);
  template_name := substr(template_spec, instr(template_spec,'.')+1);
  patt_start    := template_token || template_name || '>';

  -- known issue: does not work if a template only has 1 line
  
  select txt
  bulk collect into chunks
  from (
    select line, txt, start_idx, min(case when end_idx > start_idx then end_idx end) over () as end_idx
    from (
      select s.line
            ,rtrim(s.text) txt
            ,min(case
                 when substr(s.text, 1, length(get_template.patt_start)) = get_template.patt_start
                 then s.line + 1
                 end) over () start_idx
            ,case
             when substr(s.text, 1, length(get_template.patt_end)) = get_template.patt_end
             then s.line - 1
             end end_idx
      from   user_source s
      where  s.name = get_template.package_name
      ) )
  where line between start_idx and end_idx
  order by line;
  
  if chunks.count = 0 then
    raise no_data_found;
  end if;

  assemble_chunks
    (chunks => chunks
    ,buf    => buf);

  logger.log('END', scope, null, params);
exception
  when no_data_found then
    logger.log('Template not found', scope, null, params);
    raise;
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end get_template;

procedure evaluate_all
  (template_spec in varchar2
  ,table_name    in varchar2
  ,placeholders  in key_value_array := null_kv_array
  ,buf           in out nocopy clob
  ,recursing     in boolean         := false
  ) is
  scope    logger_logs.scope%type := scope_prefix || 'evaluate_all';
  params   logger.tab_param;
  ph       key_value_array;
  app_user varchar2(1000) := coalesce(sys_context('APEX$SESSION','APP_USER'),sys_context('USERENV','SESSION_USER'));
begin
  logger.append_param(params, 'template_spec', template_spec);
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'placeholders.COUNT', placeholders.count);
  logger.append_param(params, 'recursing', recursing);
  logger.log('START', scope, null, params);

  assert(template_spec is not null, 'template_spec cannot be null', scope);
  assert(table_name is not null, 'table_name cannot be null', scope);

  assert(instr(template_spec,'.') > 1, 'template_spec must include package name ("' || template_spec || '")', scope);

  if not recursing then
    reset_package_globals;
  end if;

  dbms_lob.createtemporary(buf, true);
  dbms_lob.trim(lob_loc => buf, newlen => 0);

  begin
    get_template
      (template_spec => template_spec
      ,buf           => buf);
  
    ph := placeholders;
  
    ph('<%APEXAPI>')   := upper(apexapi_package_name(table_name));
    ph('<%apexapi>')   := lower(apexapi_package_name(table_name));
    ph('<%CONTEXT>')   := security.ctx;
    ph('<%CONTEXT_APP_USER>') := deploy.context_app_user;
    ph('<%Entities>')  := util.user_friendly_label(table_name); -- assume tables are named in the plural
    ph('<%entities>')  := lower(util.user_friendly_label(table_name));
    ph('<%Entity>')    := util.user_friendly_label(table_name, inflect => util.singular);
    ph('<%entity>')    := lower(util.user_friendly_label(table_name, inflect => util.singular));
    ph('<%JOURNAL>')   := upper(journal_table_name(table_name));
    ph('<%journal>')   := lower(journal_table_name(table_name));
    ph('<%SYSDATE>')   := to_char(sysdate, util.date_format);
    ph('<%SYSDT>')     := to_char(sysdate, util.datetime_format);
    ph('<%TABLE>')     := upper(table_name);
    ph('<%table>')     := lower(table_name);
    ph('<%TAPI>')      := upper(tapi_package_name(table_name));
    ph('<%tapi>')      := lower(tapi_package_name(table_name));
    ph('<%TEMPLATE>')  := upper(template_package_name(table_name));
    ph('<%template>')  := lower(template_package_name(table_name));
    ph('<%TRIGGER>')   := upper(journal_trigger_name(table_name));
    ph('<%trigger>')   := lower(journal_trigger_name(table_name));
    ph('<%USER>')      := upper(app_user);
    ph('<%user>')      := lower(app_user);
    ph('<%VIEW>')      := upper(view_name(table_name));
    ph('<%view>')      := lower(view_name(table_name));
  
    -- some placeholders may include other template code, so process them first
    process_placeholders(placeholders => ph, buf => buf);
  
    evaluate_ifs (table_name => table_name, buf => buf);
  
    evaluate_columns (table_name => table_name, buf => buf);
  
    evaluate_includes
      (table_name   => table_name
      ,placeholders => placeholders
      ,buf          => buf);
    
  exception
    when no_data_found then
      if recursing then
        logger.log('Skipping template (not found)', scope, null, params);
      else
        logger.log_error('Template not found', scope, null, params);
        raise_application_error(-20000, 'Template not found (' || template_spec || ')');
      end if;
  end;

  if not recursing then
    reset_package_globals;
  end if;
  
  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end evaluate_all;

/*******************************************************************************
                               PUBLIC INTERFACE
*******************************************************************************/

function gen
  (template_name        in varchar2
  ,table_name           in varchar2
  ,placeholders         in key_value_array := null_kv_array
  ) return clob is
  scope  logger_logs.scope%type := scope_prefix || 'gen(FUNC)';
  params logger.tab_param;
  buf clob;
begin
  logger.append_param(params, 'template_name', template_name);
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'placeholders.COUNT', placeholders.count);
  logger.log('START', scope, null, params);

  logger.log_info('gen ' || template_name || ' for ' || table_name, scope, null, params);
  dbms_output.put_line('gen ' || template_name || ' for ' || table_name);

  assert(template_name is not null, 'template_name cannot be null', scope);
  assert(table_name is not null, 'table_name cannot be null', scope);

  if not deploy.table_exists(table_name) then
    raise_application_error(-20000, 'Table not found: ' || table_name);
  end if;

  evaluate_all
    (template_spec => case when instr(template_name,'.') = 0
                      then templates_package || '.'
                      end
                   || template_name
    ,table_name    => table_name
    ,placeholders  => placeholders
    ,buf           => buf);

  logger.log('END', scope, buf, params);
  return buf;
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end gen;

procedure gen
  (template_name        in varchar2
  ,table_name           in varchar2
  ,placeholders         in key_value_array := null_kv_array
  ,raise_ddl_exceptions in boolean := true) is
  scope  logger_logs.scope%type := scope_prefix || 'gen(EXEC)';
  params logger.tab_param;
  buf clob;
begin
  logger.append_param(params, 'template_name', template_name);
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'placeholders.COUNT', placeholders.count);
  logger.append_param(params, 'raise_ddl_exceptions', raise_ddl_exceptions);
  logger.log('START', scope, null, params);
  
  buf := gen(template_name => template_name
            ,table_name    => table_name
            ,placeholders  => placeholders);

  begin
    deploy.exec_ddl(buf);
  exception
    when others then
      if raise_ddl_exceptions then
        raise;
      else
        logger.log_error(template_name || ' compile error: ' || sqlerrm, scope, null, params);
        dbms_output.put_line(template_name || ' compile error: ' || sqlerrm);
      end if;
  end;

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end gen;

procedure journal_table
  (table_name           in varchar2
  ,raise_ddl_exceptions in boolean := true
  ,journal_indexes      in boolean := false) is
  scope        logger_logs.scope%type := scope_prefix || 'journal_table';
  params       logger.tab_param;
  jnl_table    varchar2(30);
  jnl_trigger  varchar2(30);
begin
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'raise_ddl_exceptions', raise_ddl_exceptions);
  logger.append_param(params, 'journal_indexes', journal_indexes);
  logger.log('START', scope, null, params);

  logger.log_info('journal_table ' || table_name, scope, null, params);

  assert(table_name is not null, 'table_name cannot be null', scope);

  if not deploy.table_exists(table_name) then
    raise_application_error(-20000, 'Table not found: ' || table_name);
  end if;

  jnl_table   := journal_table_name(table_name);
  jnl_trigger := journal_trigger_name(table_name);

  if not deploy.table_exists(jnl_table) then

    deploy.exec_ddl(replace(replace(
       'CREATE TABLE #JOURNAL# AS SELECT * FROM #TABLE# WHERE 1=0'
       ,'#JOURNAL#', jnl_table)
       ,'#TABLE#',   table_name)
      );

    deploy.exec_ddl(replace(replace(
       'ALTER TABLE #TABLE# ADD #column#'
       ,'#TABLE#',  jnl_table)
       ,'#column#', '(JN$ACTION VARCHAR2(1), JN$TIMESTAMP TIMESTAMP, JN$ACTION_BY VARCHAR2(100))')
      );

    -- the journal table may have some not null constraints; remove them
    for r in (select c.column_name
              from   user_tab_columns c
              where  c.table_name = upper(journal_table.jnl_table)
              and    c.nullable = 'N') loop
      deploy.exec_ddl(replace(replace(
         'ALTER TABLE #TABLE# MODIFY #column# NULL'
         ,'#TABLE#',  jnl_table)
         ,'#column#', r.column_name)
        );
    end loop;

  else

    -- alter journal table to match source table

    -- remove any old columns
    for r in (select c.column_name from user_tab_columns c
              where  c.table_name = upper(journal_table.jnl_table)
              and    c.column_name not in ('JN$ACTION','JN$TIMESTAMP','JN$ACTION_BY')
              minus
              select c.column_name from user_tab_columns c
              where  c.table_name = upper(journal_table.table_name)
             ) loop
      deploy.drop_column(table_name => jnl_table, column_name => r.column_name);
    end loop;

    -- add any new columns
    for r in (select c.column_name
                    ,c.data_type
                     || case
                        when c.data_type in ('CHAR','VARCHAR','VARCHAR2','NCHAR','NVARCHAR2') then
                          '(' || c.char_length || ')'
                        when c.data_type = 'NUMBER' then
                          case when c.data_precision is not null and c.data_scale is not null
                          then '(' || nvl(c.data_precision,0) || ',' || nvl(c.data_scale,0) || ')'
                          else '(' || c.data_length || ')'
                          end
                        end
                     as col_def
              from   user_tab_columns c
              where  c.table_name = upper(journal_table.table_name)
              order by column_id) loop
      deploy.add_column
        (table_name        => jnl_table
        ,column_name       => r.column_name
        ,column_definition => r.col_def
        );
    end loop;

    -- increase max length for altered columns
    for r in (select c.column_name
                    ,c.data_type || '(' || c.char_length || ')'
                     as col_def
              from   user_tab_columns c
              where  c.table_name = upper(journal_table.table_name)
              and    c.data_type in ('CHAR','VARCHAR','VARCHAR2','NCHAR','NVARCHAR2')
              and    c.char_length > (select j.char_length
                                      from   user_tab_columns j
                                      where  j.table_name = upper(journal_table.jnl_table)
                                      and    j.column_name = c.column_name)
              order by column_id) loop
      deploy.exec_ddl(replace(replace(replace(
        'ALTER TABLE #JOURNAL# MODIFY #column# #col_def#'
       ,'#JOURNAL#', jnl_table)
       ,'#column#',  r.column_name)
       ,'#col_def#', r.col_def)
        );
    end loop;

    -- add jn columns if not already there
    deploy.add_column(jnl_table, 'JN$ACTION',    'VARCHAR2(1)');
    deploy.add_column(jnl_table, 'JN$TIMESTAMP', 'TIMESTAMP');
    deploy.add_column(jnl_table, 'JN$ACTION_BY', 'VARCHAR2(100)');

  end if;

  if journal_indexes then
    deploy.create_index
      (index_name   => jnl_table || '$IX1'
      ,index_target => jnl_table || '(' || pk_cols(table_name) || ',VERSION_ID)');
    deploy.create_index
      (index_name   => jnl_table || '$IX2'
      ,index_target => jnl_table || '(' || pk_cols(table_name) || ',JN$TIMESTAMP)');
  end if;

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end journal_table;

procedure journal_trigger
  (table_name           in varchar2
  ,raise_ddl_exceptions in boolean := true) is
  scope        logger_logs.scope%type := scope_prefix || 'journal_trigger';
  params       logger.tab_param;
begin
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'raise_ddl_exceptions', raise_ddl_exceptions);
  logger.log('START', scope, null, params);

  logger.log_info('journal_trigger ' || table_name, scope, null, params);

  assert(table_name is not null, 'table_name cannot be null', scope);

  if not deploy.table_exists(table_name) then
    raise_application_error(-20000, 'Table not found: ' || table_name);
  end if;

  gen
    (template_name        => 'CREATE_JOURNAL_TRIGGER'
    ,table_name           => table_name
    ,raise_ddl_exceptions => raise_ddl_exceptions);

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end journal_trigger;

procedure all_journals
  (journal_triggers in boolean := true
  ,journal_indexes  in boolean := false) is
  scope  logger_logs.scope%type := scope_prefix || 'all_journals';
  params logger.tab_param;
begin
  logger.append_param(params, 'journal_triggers', journal_triggers);
  logger.append_param(params, 'journal_indexes', journal_indexes);
  logger.log('START', scope, null, params);

  for r in (
    select t.table_name
    from   user_tables t
    where  t.table_name not like '%'||templates.journal_tab_suffix
    order by t.table_name
    ) loop

    journal_table
      (table_name           => r.table_name
      ,raise_ddl_exceptions => false
      ,journal_indexes      => journal_indexes);

    if journal_triggers then
      journal_trigger
        (table_name           => r.table_name
        ,raise_ddl_exceptions => false);
    end if;

  end loop;

  deploy.dbms_output_errors(object_type => 'TRIGGER');

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end all_journals;

procedure all_tapis (table_name in varchar2 := null) is
  scope  logger_logs.scope%type := scope_prefix || 'all_tapis';
  params logger.tab_param;
begin
  logger.append_param(params, 'table_name', table_name);
  logger.log('START', scope, null, params);

  for r in (
    select t.table_name
    from   user_tables t
    where  (all_tapis.table_name is null
            and t.table_name not like '%'||templates.journal_tab_suffix)
    or     t.table_name = upper(all_tapis.table_name)
    order by t.table_name
    ) loop

    gen
      (template_name => 'TAPI_PACKAGE_SPEC'
      ,table_name    => r.table_name
      ,raise_ddl_exceptions => false);

    gen
      (template_name => 'TAPI_PACKAGE_BODY'
      ,table_name    => r.table_name
      ,raise_ddl_exceptions => false);

  end loop;

  if table_name is null then
    deploy.dbms_output_errors(object_type => 'PACKAGE');
    deploy.dbms_output_errors(object_type => 'PACKAGE BODY');
  end if;

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end all_tapis;

procedure all_apexapis (table_name in varchar2 := null) is
  scope  logger_logs.scope%type := scope_prefix || 'all_apexapis';
  params logger.tab_param;
begin
  logger.append_param(params, 'table_name', table_name);
  logger.log('START', scope, null, params);

  for r in (
    select t.table_name
    from   user_tables t
    where  (all_apexapis.table_name is null
            and t.table_name not like '%'||templates.journal_tab_suffix)
    or     t.table_name = upper(all_apexapis.table_name)
    order by t.table_name
    ) loop

    gen
      (template_name => 'APEXAPI_PACKAGE_SPEC'
      ,table_name    => r.table_name
      ,raise_ddl_exceptions => false);

    gen
      (template_name => 'APEXAPI_PACKAGE_BODY'
      ,table_name    => r.table_name
      ,raise_ddl_exceptions => false);

  end loop;

  if table_name is null then
    deploy.dbms_output_errors(object_type => 'PACKAGE');
    deploy.dbms_output_errors(object_type => 'PACKAGE BODY');
  end if;

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end all_apexapis;

procedure all_apis
  (table_name      in varchar2
  ,journal_indexes in boolean := false
  ,apex_api        in boolean := true) is
  scope  logger_logs.scope%type := scope_prefix || 'all_apis';
  params logger.tab_param;
begin
  logger.append_param(params, 'table_name', table_name);
  logger.append_param(params, 'journal_indexes', journal_indexes);
  logger.append_param(params, 'apex_api', apex_api);
  logger.log('START', scope, null, params);
  
  -- the journal table is needed by the tapi
  journal_table
    (table_name      => table_name
    ,journal_indexes => false);
  
  all_tapis (table_name => table_name);

  -- the journal trigger needs the tapi
  journal_trigger (table_name => table_name);

  if apex_api then
    all_apexapis (table_name => table_name);
  end if;

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end all_apis;

function get_name return varchar2 is
begin
  return 'TAPI / APEX API';
end get_name;

function get_description return varchar2 is
begin
  return 'Table API and/or APEX API generator';
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
  order by object_name;
  return l_object_names;
end get_object_names;

function get_params
  (in_object_type in varchar2
  ,in_object_name in varchar2
  ) return t_param is
  l_params t_param;
begin
  l_params(oddgen_gen_tapi) := 'Yes';
  l_params(oddgen_gen_apexapi) := 'Yes';
  l_params(oddgen_execute) := 'No';
  l_params(oddgen_jnl_table) := 'No';
  l_params(oddgen_jnl_trigger) := 'No';
  l_params(oddgen_jnl_indexes) := 'No';
  return l_params;
end get_params;

function get_ordered_params(in_object_type in varchar2, in_object_name in varchar2)
  return t_string is
begin
  return new t_string(oddgen_execute
                     ,oddgen_jnl_table
                     ,oddgen_jnl_trigger
                     ,oddgen_jnl_indexes
                     ,oddgen_gen_tapi
                     ,oddgen_gen_apexapi
                     );
end get_ordered_params;

function get_lov
  (in_object_type in varchar2
  ,in_object_name in varchar2
  ,in_params      in t_param
  ) return t_lov is
  l_lov t_lov;
begin
  l_lov(oddgen_gen_tapi) := new t_string('Yes', 'No');
  l_lov(oddgen_gen_apexapi) := new t_string('Yes', 'No');
  l_lov(oddgen_execute) := new t_string('Yes', 'No');
  if in_params(oddgen_execute) = 'No' then
    l_lov(oddgen_jnl_table) := new t_string('No');
    l_lov(oddgen_jnl_trigger) := new t_string('No');
    l_lov(oddgen_jnl_indexes) := new t_string('No');
  else
    l_lov(oddgen_jnl_table) := new t_string('Yes', 'No');
    l_lov(oddgen_jnl_trigger) := new t_string('Yes', 'No');
    if in_params(oddgen_jnl_table) = 'Yes' then
      l_lov(oddgen_jnl_indexes) := new t_string('Yes', 'No');
    else
      l_lov(oddgen_jnl_indexes) := new t_string('No');
    end if;
  end if;
  return l_lov;
end get_lov;

function generate
  (in_object_type in varchar2
  ,in_object_name in varchar2
  ,in_params      in t_param
  ) return clob is
  scope  logger_logs.scope%type := scope_prefix || 'generate';
  params logger.tab_param;
  buf clob := '/*Generated ' || to_char(sysdate,'DD/MM/YYYY HH:MIpm') || '*/' || chr(10);
  ddl clob;
  post_script constant varchar2(1000) := '/' || chr(10) || 'SHOW ERRORS' || chr(10) || chr(10);
  
  procedure process_template (template_name in varchar2) is
  begin
    ddl := gen
      (template_name => template_name
      ,table_name    => in_object_name);
    if in_params(oddgen_execute) = 'Yes' then
      begin
        deploy.exec_ddl(ddl);
        buf := buf || 'Success: ' || template_name || ' ' || in_object_name || chr(10);
      exception
        when others then
          buf := buf || 'FAILED: ' || template_name || ' ' || in_object_name || chr(10);
          buf := buf || ddl || '/' || chr(10) || sqlerrm || chr(10);
      end;
    else
      buf := buf || ddl || post_script;
    end if;
  end process_template;

begin
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
  return buf;
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end generate;

end gen_tapis;
/

show errors