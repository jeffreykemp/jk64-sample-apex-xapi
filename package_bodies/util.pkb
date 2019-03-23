create or replace package body util is
/*******************************************************************************
 Generic validation and whatnot
*******************************************************************************/

scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

-- holds validation errors
g_err msg_array;

-- validation error attributes
g_label_map        str_map;
g_item_name_map    str_map;
g_region_id        number;
g_column_alias_map str_map;

non_date_char exception;
pragma exception_init (non_date_char, -01830);

non_numeric_char exception;
pragma exception_init (non_numeric_char, -01858);

does_not_match_format_string exception;
pragma exception_init (does_not_match_format_string, -01861);

-- derive date/time format for a date or timestamp item
function d_item_format (p_name in varchar2) return varchar2 is
begin
  return case
         when p_name like '%/_' || col_suffix_date escape '/'
           then nvl(apex_application.g_date_format, date_format)
         when p_name like '%/_' || col_suffix_datetime escape '/'
           then nvl(apex_application.g_date_time_format, datetime_format)
         when p_name like '%/_' || col_suffix_timestamp escape '/'
           then nvl(apex_application.g_timestamp_format, timestamp_format)
         when p_name like '%/_' || col_suffix_timestamp_tz escape '/'
           then nvl(apex_application.g_timestamp_tz_format, timestamp_tz_format)
         end;
end d_item_format;

procedure add_validation_result
  (msg         in varchar2
  ,label       in varchar2
  ,column_name in varchar2
  ) is
  scope        logger_logs.scope%type := scope_prefix || 'add_validation_result';
  params       logger.tab_param;
  l_label      varchar2(4000);
  item_name    varchar2(4000);
  column_alias varchar2(4000);
  l_msg        varchar2(32767) := msg;
  row_num      number          := nv('APEX$ROW_NUM');
begin
  logger.append_param(params, 'msg', msg);
  logger.append_param(params, 'label', label);
  logger.append_param(params, 'column_name', column_name);
  logger.log('START', scope, null, params);

  if instr(l_msg, '#label#') > 0 and label is not null then
    l_msg := replace(l_msg, '#label#', label);
  end if;
  if instr(l_msg, '#label#') > 0 and column_name is not null and g_label_map.exists(column_name) then
    l_msg := replace(l_msg, '#label#', g_label_map(column_name));
  end if;
  if instr(l_msg, '#label#') > 0 and column_name is not null then
    l_msg := replace(l_msg, '#label#', user_friendly_label(identifier => column_name));
  end if;

  g_err(nvl(g_err.last,0)+1) := l_msg;

  if g_region_id is not null and row_num is not null then

    if column_name is not null and g_column_alias_map.exists(column_name) then
      column_alias := g_column_alias_map(column_name);
    elsif column_name is not null then
      column_alias := column_name;
    end if;

    apex_error.add_error
      (p_message          => l_msg
      ,p_display_location => apex_error.c_inline_with_field_and_notif
      ,p_region_id        => g_region_id
      ,p_column_alias     => column_alias
      ,p_row_num          => row_num);

  else

    if column_name is not null then
      if g_item_name_map.exists(column_name) then
        item_name := g_item_name_map(column_name);
      elsif apex_application.g_flow_step_id is not null then
        item_name := 'P' || apex_application.g_flow_step_id || '_' || column_name;
      end if;
    end if;

    if item_name is not null then

      apex_error.add_error
        (p_message          => l_msg
        ,p_display_location => apex_error.c_inline_with_field_and_notif
        ,p_page_item_name   => item_name);

    elsif apex_application.g_flow_step_id is not null then

      apex_error.add_error
        (p_message          => l_msg
        ,p_display_location => apex_error.c_inline_in_notification);

    end if;

  end if;

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end add_validation_result;

function error_msg
  (err_code in varchar2
  ,op       in varchar2 := null
  ) return error_messages.err_message%type
  result_cache is
  scope  logger_logs.scope%type := scope_prefix || 'error_msg';
  params logger.tab_param;
  m      error_messages.err_message%type;
begin
  logger.append_param(params, 'err_code', err_code);
  logger.append_param(params, 'op', op);
  logger.log('START', scope, null, params);

  assert(err_code is not null, 'err_code cannot be null (' || scope || ')', scope);

  select err.err_message
  into   m
  from   error_messages err
  where  err.err_code = error_msg.err_code;
  
  m := replace(m, '#OP#', op);

  logger.log('END', scope, 'm=' || m, params);
  return m;
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end error_msg;

/*******************************************************************************
                               PUBLIC INTERFACE
*******************************************************************************/

procedure assert
  (testcond  in boolean
  ,assertion in varchar2
  ,scope     in varchar2) is
begin

  if not testcond then

    logger.log_permanent('Assertion failed: ' || assertion, scope);

    raise_application_error(assertion_errcode,
         'Sorry, system has encountered a problem - please notify Support (assertion failed: '
      || assertion || ' in ' || scope || ')');

  end if;

end assert;

-- Wrapper for apex set session value.
-- WARNING: the new value will not be visible to the session immediately (i.e.
-- you shouldn't use v() to examine the value after calling sv). It's best to
-- wait until the end of the call before doing all the calls to sv.
procedure sv
  (p_name  in varchar2
  ,p_value in varchar2) as
begin
  apex_util.set_session_state
    (p_name   => p_name
    ,p_value  => p_value
    ,p_commit => false);
end sv;

-- Uses item naming conventions to automatically choose
-- format for TO_CHAR conversion
procedure sd
  (p_name  in varchar2
  ,p_value in date
  ,p_fmt   in varchar2 := null /*override auto-selected format*/) as
begin
  sv(p_name  => p_name
    ,p_value => to_char(p_value
                       ,coalesce(p_fmt
                                ,d_item_format(p_name => p_name)
                                ,nvl(apex_application.g_date_format
                                ,date_format)))
    );
end sd;

-- Uses item naming conventions to automatically choose
-- format for TO_CHAR conversion
procedure st
  (p_name  in varchar2
  ,p_value in timestamp
  ,p_fmt   in varchar2 := null /*override auto-selected format*/) as
begin
  sv(p_name  => p_name
    ,p_value => to_char(p_value
                       ,coalesce(p_fmt
                                ,d_item_format(p_name => p_name)
                                ,nvl(apex_application.g_timestamp_format
                                ,timestamp_format)))
    );
end st;

function dv
  (p_name in varchar2
  ,p_fmt  in varchar2 := null /*override auto-selected format*/
  ) return date is
begin
  return to_date(v(p_name)
                ,coalesce(p_fmt
                         ,d_item_format(p_name => p_name)
                         ,nvl(apex_application.g_date_format
                         ,date_format)));
end dv;

function client_info return varchar2 is
  client_info_str varchar2(100);
begin
  dbms_application_info.read_client_info
    (client_info => client_info_str);
  return client_info_str;
end client_info;

function num_val (val in varchar2) return number deterministic is
begin
  return to_number(replace(val,','));
exception
  when others then
    return null;
end num_val;

function date_val (val in varchar2) return date deterministic is
begin
  return to_date(val, nvl(apex_application.g_date_format, date_format));
exception
  when others then
    begin
      return to_date(val, date_format_alt);
    exception
      when others then
        return null;
    end;
end date_val;

function datetime_val (val in varchar2) return date deterministic is
begin
  return to_date(val, nvl(apex_application.g_date_time_format, datetime_format));
exception
  when others then
    begin
      return to_date(val, datetime_format_alt);
    exception
      when others then
        return null;
    end;
end datetime_val;

-- convert a string to a timestamp
function timestamp_val (val in varchar2) return timestamp deterministic is
begin
  return to_timestamp(val, nvl(apex_application.g_timestamp_format, timestamp_format));
exception
  when others then
    begin
      return to_date(val, timestamp_format_alt);
    exception
      when others then
        return null;
    end;
end timestamp_val;

-- convert a string to a timestamp-with-time-zone
function timestamp_tz_val (val in varchar2) return timestamp with time zone deterministic is
begin
  return to_timestamp(val, nvl(apex_application.g_timestamp_tz_format, timestamp_tz_format));
exception
  when others then
    begin
      return to_date(val, timestamp_format_alt);
    exception
      when others then
        return null;
    end;
end timestamp_tz_val;

procedure reset_val is
begin
  g_label_map.delete;
  g_item_name_map.delete;
  g_column_alias_map.delete;
  g_region_id := null;
end reset_val;

procedure pre_val
  (label_map     in str_map /*map column name to user-friendly label*/
  ,item_name_map in str_map /*map column name to Apex page item*/
  ) is
begin
  reset_val;
  g_label_map     := label_map;
  g_item_name_map := item_name_map;
end pre_val;

-- call after running validation
procedure post_val is
  scope  logger_logs.scope%type := scope_prefix || 'post_val';
  params logger.tab_param;
begin
  logger.log('START', scope, null, params);

  reset_val;

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end post_val;

procedure val_cond
  (cond        in boolean := false
  ,msg         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null
  ) is
begin
  if not cond then
    add_validation_result
      (msg         => msg
      ,label       => label
      ,column_name => column_name);
  end if;
end val_cond;

procedure val_not_null
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null) is
begin
  if val is null then
    add_validation_result
      (msg         => '#label# must be specified'
      ,label       => label
      ,column_name => column_name);
  end if;
end val_not_null;

procedure val_max_len
  (val         in varchar2
  ,len         in number
  ,label       in varchar2 := null
  ,column_name in varchar2 := null
  ) is
begin
  if length(val) > len then
    add_validation_result
      (msg         => '#label# cannot be more than ' || len || ' characters (' || length(val) || ')'
      ,label       => label
      ,column_name => column_name);
  end if;
end val_max_len;

procedure val_y
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null
  ) is
begin
  val_cond
    (cond        => val = 'Y'
    ,msg         => '#label# must be Y or null'
    ,label       => label
    ,column_name => column_name);
end val_y;

procedure val_yn
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null
  ) is
begin
  val_cond
    (cond        => val in ('Y','N')
    ,msg         => '#label# must be Y or N'
    ,label       => label
    ,column_name => column_name);
end val_yn;

procedure val_numeric
  (val         in varchar2
  ,range_low   in number   := null
  ,range_high  in number   := null
  ,label       in varchar2 := null
  ,column_name in varchar2 := null
  ) is
  v number;
begin

  if val is not null then
  
    v := num_val(val);
    
    val_cond
      (cond        => v is not null
      ,msg         => '#label# must be a valid number'
      ,label       => label
      ,column_name => column_name);
  
    val_cond
      (cond        => v >= range_low
      ,msg         => '#label# cannot be less than ' || range_low
      ,label       => label
      ,column_name => column_name);
  
    val_cond
      (cond        => v <= range_high
      ,msg         => '#label# cannot be greater than than ' || range_high
      ,label       => label
      ,column_name => column_name);

  end if;

end val_numeric;

procedure val_integer
  (val         in varchar2
  ,range_low   in number := null
  ,range_high  in number := null
  ,label       in varchar2 := null
  ,column_name in varchar2 := null
  ) is
  v number;
begin

  if val is not null then
  
    v := num_val(val);
    
    val_cond
      (cond        => v is not null
      ,msg         => '#label# must be a valid number'
      ,label       => label
      ,column_name => column_name);
  
    val_cond
      (cond        => v >= range_low
      ,msg         => '#label# cannot be less than ' || range_low
      ,label       => label
      ,column_name => column_name);
  
    val_cond
      (cond        => v <= range_high
      ,msg         => '#label# cannot be greater than than ' || range_high
      ,label       => label
      ,column_name => column_name);
  
    val_cond
      (cond        => v = trunc(v)
      ,msg         => '#label# cannot have a fractional value'
      ,label       => label
      ,column_name => column_name);

  end if;

end val_integer;

procedure val_date
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null
  ) is
  v date;
begin

  if val is not null then
  
    v := date_val(val);
    
    val_cond
      (cond        => v is not null
      ,msg         => '#label# must be a valid date in the format ' || date_format
      ,label       => label
      ,column_name => column_name);

  end if;

end val_date;

-- general-purpose DATETIME validator
procedure val_datetime
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null
  ) is
  v date;
begin

  if val is not null then

    v := datetime_val(val);
    
    val_cond
      (cond        => v is not null
      ,msg         => '#label# must be a valid date/time in the format ' || datetime_format
      ,label       => label
      ,column_name => column_name);

  end if;

end val_datetime;

-- general-purpose TIMESTAMP validator
procedure val_timestamp
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null
  ) is
  v date;
begin

  if val is not null then
  
    v := timestamp_val(val);

    val_cond
      (cond        => v is not null
      ,msg         => '#label# must be a valid timestamp in the format ' || timestamp_format
      ,label       => label
      ,column_name => column_name);

  end if;

end val_timestamp;

-- general-purpose TIMESTAMP WITH TIMEZONE validator
procedure val_timestamp_tz
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null
  ) is
  v date;
begin

  if val is not null then

    v := timestamp_tz_val(val);
    
    val_cond
      (cond        => v is not null
      ,msg         => '#label# must be a valid timestamp in the format ' || timestamp_tz_format
      ,label       => label
      ,column_name => column_name);

  end if;

end val_timestamp_tz;

-- general-purpose date range validator
procedure val_date_range
  (start_date  in varchar2
  ,end_date    in varchar2
  ,label       in varchar2
  ) is
begin

  val_cond
    (cond        => date_val(start_date) <= date_val(end_date)
    ,msg         => '#label# cannot end prior to the start date'
    ,label       => label
    ,column_name => '');

end val_date_range;

-- general-purpose date range validator
procedure val_datetime_range
  (start_dt in varchar2
  ,end_dt   in varchar2
  ,label    in varchar2
  ) is
begin

  val_cond
    (cond        => datetime_val(start_dt) <= datetime_val(end_dt)
    ,msg         => '#label# cannot end prior to the start'
    ,label       => label
    ,column_name => '');

end val_datetime_range;

procedure val_domain
  (val          in varchar2
  ,valid_values in apex_t_varchar2
  ,label        in varchar2 := null
  ,column_name  in varchar2 := null
  ) is
  scope logger_logs.scope%type := scope_prefix || 'val_domain';
begin

  if val is not null then

    assert(valid_values.count > 0, 'valid_values must contain at least one value', scope);

    val_cond
      (cond        => val member of valid_values
      ,msg         => '#label#: "' || val || '" is not valid'
      ,label       => label
      ,column_name => column_name);

  end if;

end val_domain;

procedure val_lat_lng
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null
  ) is
  lat varchar2(4000);
  lng varchar2(4000);
begin

  if val is not null then

    val_cond
      (cond        => instr(val,',') > 0
      ,msg         => '#label# must be in the format lat,long'
      ,label       => label
      ,column_name => column_name);

    if instr(val,',') > 0 then

      lat := substr(val, 1, instr(val,',')-1);
      lng := substr(val, instr(val,',')+1);

      val_numeric
        (val         => lat
        ,range_low   => -90
        ,range_high  => 90
        ,label       => '#label# latitude'
        ,column_name => column_name);

      val_numeric
        (val         => lng
        ,range_low   => -180
        ,range_high  => 180
        ,label       => '#label# longitude'
        ,column_name => column_name);

    end if;

  end if;

end val_lat_lng;

procedure val_code
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null
  ) is
begin

  val_max_len
    (val         => val
    ,len         => code_max_len
    ,label       => label
    ,column_name => column_name);

  val_cond
    (cond        => regexp_substr(val, '[A-Za-z0-9_]', '') is null
    ,msg         => '#label# must contain only alphanumeric characters or underscores'
    ,label       => label
    ,column_name => column_name);

end val_code;

function first_error return varchar2 is
begin
  if g_err.first is not null then
    return g_err(g_err.first);
  else
    return null;
  end if;
end first_error;

function err_arr return msg_array is
begin
  return g_err;
end err_arr;

function errors_list
  (pre_list      in varchar2 := '<ul>'
  ,pre_item      in varchar2 := '<li>'
  ,between_items in varchar2 := ''
  ,post_item     in varchar2 := '</li>'
  ,post_list     in varchar2 := '</ul>'
  ,max_len       in number   := 4000
  ) return varchar2 is
  buf varchar2(32767);
  str varchar2(32767);
  idx number;
  margin number;
begin
  if g_err.count > 0 then
    margin := length(pre_list) + length(post_list) + 20;
    idx := g_err.first;
    loop
      exit when idx is null;
      if buf is not null then
        str := between_items;
      end if;
      str := str || pre_item || g_err(idx) || post_item;
      if length(buf) + length(str) + margin > max_len then
        buf := buf
            || '+ '
            || case when (g_err.count - idx + 1) = 1
               then 'one other'
               else (g_err.count - idx + 1) || ' others'
               end;
        exit;
      else
        buf := buf || str;
      end if;
      idx := g_err.next(idx);
    end loop;
    buf := pre_list || buf || post_list;
  end if;
  return buf;
end errors_list;

procedure raise_error
  (err_msg in varchar2
  ,scope   in varchar2
  ,params  in logger.tab_param := logger.gc_empty_tab_param) is
  buf varchar2(4000) := substr(err_msg, 1, 4000);
begin

  if length(err_msg) <= 30 then
    buf := nvl(error_msg(err_code => err_msg), err_msg);
  end if;

  logger.log_error(buf, scope, null, params);

  raise_application_error(application_errcode, substr(buf, 1, 2048));

end raise_error;

procedure raise_lost_update
  (updated_by in varchar2
  ,updated_dt in date
  ,scope   in varchar2
  ,params  in logger.tab_param := logger.gc_empty_tab_param) is
begin

  raise_error('Another user ('
    || updated_by
    || ') has modified this record ('
    || to_char(updated_dt,'fmDD Mon HHfm:MIpm')
    ,scope  => scope
    ,params => params);

end raise_lost_update;

-- parse constraint name from an Oracle error message
function err_constraint_name return varchar2 is
  buf varchar2(4000) := sqlerrm;
begin

  if instr(buf,'(') > 0 and instr(buf,')') > 0 then

    -- extract constraint name, e.g. "SCOTT.EMP_UK" from
    -- "ORA-00001: unique constraint violated (SCOTT.EMP_UK)"
    buf := substr(buf
                 ,instr(buf,'(') + 1
                 ,instr(buf,')') - instr(buf,'(') - 1 );

    -- chop off schema name, e.g. "EMP_UK"
    buf := substr(buf, instr(buf,'.')+1);

  end if;

  return buf;
end err_constraint_name;

procedure raise_dup_val_on_index 
  (scope   in varchar2
  ,params  in logger.tab_param := logger.gc_empty_tab_param) is
  buf varchar2(32767);
begin

  buf := err_constraint_name;

  -- if the buffer has >30 chars, it can't be a constraint name
  if length(buf) <= 30 then

  	buf := nvl(error_msg(err_code => buf)
	            ,'Unique constraint violated: a matching record already exists (' || buf || ')');

  end if;

  raise_error(buf, scope, params);

end raise_dup_val_on_index;

procedure raise_ref_con_violation 
  (scope   in varchar2
  ,params  in logger.tab_param := logger.gc_empty_tab_param) is
  buf varchar2(32767);
begin

  buf := err_constraint_name;

  -- if the buffer has >30 chars, it can't be a constraint name
  if length(buf) <= 30 then

    buf := nvl(error_msg(err_code => buf
	                      ,op       => 'modified as requested')
	            ,'This record cannot be modified as requested as other data refers to it (' || buf || ')');

  end if;

  raise_error(buf, scope, params);

end raise_ref_con_violation;

procedure raise_del_ref_con_violation 
  (scope   in varchar2
  ,params  in logger.tab_param := logger.gc_empty_tab_param) is
  buf varchar2(32767);
begin

  buf := err_constraint_name;

  -- if the buffer has >30 chars, it can't be a constraint name
  if length(buf) <= 30 then

    buf := nvl(error_msg(err_code => buf
	                      ,op       => 'deleted')
	            ,'This record cannot be deleted as other data refers to it (' || buf || ')');

  end if;

  raise_error(buf, scope, params);

end raise_del_ref_con_violation;

procedure success (i_msg in varchar2) is
  scope  logger_logs.scope%type := scope_prefix || 'success';
  params logger.tab_param;
begin
  logger.append_param(params, 'i_msg', i_msg);
  logger.log('START', scope, null, params);

  if apex_application.g_print_success_message is not null then
    apex_application.g_print_success_message
      := apex_application.g_print_success_message || '<br>';
  end if;
  apex_application.g_print_success_message
    := apex_application.g_print_success_message || i_msg;

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end success;

-- searches g_f01 for the selected index
function selected (ind in number) return boolean is
begin
  if apex_application.g_f01.count > 0 then
    for i in 1..apex_application.g_f01.count loop
      if apex_application.g_f01(i) = ind then
        return true;
      end if;
    end loop;
  end if;
  return false;
end selected;

procedure clear_page_cache is
begin
  apex_util.clear_page_cache(apex_application.g_flow_id);
end clear_page_cache;

function apex_error_handler
  (p_error in apex_error.t_error
  ) return apex_error.t_error_result is
  scope  logger_logs.scope%type := scope_prefix || 'apex_error_handler';
  params logger.tab_param;
  r      apex_error.t_error_result;
begin
  logger.append_param(params, 'p_error.message', p_error.message);
  logger.append_param(params, 'p_error.additional_info', p_error.additional_info);
  logger.append_param(params, 'p_error.display_location', p_error.display_location);
  logger.append_param(params, 'p_error.association_type', p_error.association_type);
  logger.append_param(params, 'p_error.page_item_name', p_error.page_item_name);
  logger.append_param(params, 'p_error.region_id', p_error.region_id);
  logger.append_param(params, 'p_error.column_alias', p_error.column_alias);
  logger.append_param(params, 'p_error.row_num', p_error.row_num);
  logger.append_param(params, 'p_error.apex_error_code', p_error.apex_error_code);
  logger.append_param(params, 'p_error.is_internal_error', p_error.is_internal_error);
  logger.append_param(params, 'p_error.is_common_runtime_error', p_error.is_common_runtime_error); --Apex 5
  logger.append_param(params, 'p_error.original_message', p_error.original_message); --Apex 5
  logger.append_param(params, 'p_error.original_additional_info', p_error.original_additional_info); --Apex 5
  logger.append_param(params, 'p_error.ora_sqlcode', p_error.ora_sqlcode);
  logger.append_param(params, 'p_error.ora_sqlerrm', p_error.ora_sqlerrm);
  logger.append_param(params, 'p_error.error_backtrace', p_error.error_backtrace);
  logger.append_param(params, 'p_error.error_statement', p_error.error_statement); --Apex 5
  logger.append_param(params, 'p_error.component.type', p_error.component.type);
  logger.append_param(params, 'p_error.component.id', p_error.component.id);
  logger.append_param(params, 'p_error.component.id', p_error.component.name);
  logger.log('START', scope, null, params);

  r := apex_error.init_error_result (p_error => p_error);

  -- An internal error raised by APEX, like an invalid statement or code which
  -- can't be executed.
  if p_error.is_internal_error then  

    logger.log('Apex internal error', scope, null, params);

    case p_error.apex_error_code
    when 'APEX.AUTHORIZATION.ACCESS_DENIED' then

      -- Access Denied errors raised by application or page authorization should
      -- still show up with the original error message
      null;

    when 'APEX.VALIDATION.UNHANDLED_ERROR' then

      -- this can be triggered by assertion failures as well as internal Oracle
      -- errors, e.g. raised from page validations

      r.message := 'Sorry, the system has encountered a problem - please notify Support (' || p_error.ora_sqlerrm || ')';

      r.display_location := apex_error.c_inline_in_notification;

    when 'APEX.AJAX_SERVER_ERROR' then

      r.message := replace_prefix(p_error.ora_sqlerrm, 'ORA-20000: ');

      r.display_location := apex_error.c_inline_in_notification;

    else

      r.message := 'Sorry, the system has encountered a problem - please notify Support (' || p_error.apex_error_code || ')';

      r.display_location := apex_error.c_inline_in_notification;

    end case;

  else

    -- Always show the error as inline error
    r.display_location := case
                          when r.display_location = apex_error.c_on_error_page
                          then apex_error.c_inline_in_notification
                          else r.display_location
                          end;

    -- if the sqlcode is null, it's probably a normal validation error
    if p_error.ora_sqlcode is not null then

      case p_error.ora_sqlcode
      when application_errcode then
        -- leave message unchanged
        null;

      else
        r.message := 'Sorry, the system has encountered a problem - please notify Support (' || r.message || ')';

      end case;

    end if;

  end if;

  logger.append_param(params, 't_error_result.message', r.message);
  logger.append_param(params, 't_error_result.additional_info', r.additional_info);
  logger.append_param(params, 't_error_result.display_location', r.display_location);
  logger.append_param(params, 't_error_result.page_item_name', r.page_item_name);
  logger.append_param(params, 't_error_result.column_alias', r.column_alias);
  logger.log('END', scope, null, params);
  return r;
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end apex_error_handler;

function get_authorization_error_msg (authorization_name in varchar2) return varchar2 is
  scope  logger_logs.scope%type := scope_prefix || 'get_authorization_error_msg';
  params logger.tab_param;
  msg varchar2(4000);
begin
  logger.append_param(params, 'authorization_name', authorization_name);
  logger.log('START', scope, null, params);

  assert(authorization_name is not null, 'authorization_name cannot be null', scope);

  select a.error_message
  into   msg
  from   apex_application_authorization a
  where  a.application_id = apex_application.g_flow_id
  and    a.authorization_scheme_name = get_authorization_error_msg.authorization_name;

  logger.log('END', scope, 'msg=' || msg, params);
  return msg;
exception
  when no_data_found then
    logger.log('No authorization error message found; return generic user message', scope, null, params);
    return 'Only those with ' || authorization_name || ' role may access this function.';
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end get_authorization_error_msg;

procedure check_authorization (authorization_name in varchar2) is
  scope  logger_logs.scope%type := scope_prefix || 'check_authorization';
  params logger.tab_param;
begin
  logger.append_param(params, 'authorization_name', authorization_name);
  logger.log('START', scope, null, params);

  assert(authorization_name is not null, 'authorization_name cannot be null', scope);

  if not apex_authorization.is_authorized
    (p_authorization_name => authorization_name) then

    raise_error (get_authorization_error_msg(authorization_name), scope, params);

  end if;

  logger.log('END', scope, null, params);
exception
  when others then
    logger.log_error('Unhandled Exception', scope, null, params);
    raise;
end check_authorization;

function apex_app_id return number is
begin
  return apex_application.g_flow_id;
end apex_app_id;

function apex_page_id return number is
begin
  return apex_application.g_flow_step_id;
end apex_page_id;

procedure append_apex_params (params in out logger.tab_param) is
begin
  logger.append_param(params, 'app_id', apex_app_id);
  logger.append_param(params, 'page_id', apex_page_id);
  logger.append_param(params, 'request', apex_application.g_request);
end append_apex_params;

procedure append_str
  (buf in out varchar2
  ,str in varchar2
  ,sep in varchar2 := csv_sep
  ) is
begin
  buf := buf || case when buf is not null then sep end || str;
end append_str;

procedure split_str
  (str   in varchar2
  ,delim in varchar2
  ,lhs   out varchar2
  ,rhs   out varchar2) is
  pos integer;
begin
  pos := instr(str, delim);
  if pos = 0 then
    lhs := str;
  else
    if pos > 1 then
      lhs := substr(str, 1, pos - 1);
    end if;
    rhs := substr(str, pos + length(delim));
  end if;
end split_str;

function csv_replace
  (csv   in varchar2
  ,token in varchar2
  ,val   in varchar2 := ''
  ,sep   in varchar2 := csv_sep
  ) return varchar2 is
  scope  logger_logs.scope%type := scope_prefix || 'csv_replace';
begin
  assert(token is not null, 'token cannot be null', scope);
  return trim(sep from replace(sep||csv||sep
                              ,sep||token||sep
                              ,case when val is not null then sep||val||sep else sep end));
end csv_replace;

function csv_instr
  (csv   in varchar2
  ,token in varchar2
  ,sep   in varchar2 := csv_sep
  ) return integer is
  scope  logger_logs.scope%type := scope_prefix || 'csv_instr';
begin
  assert(token is not null, 'token cannot be null', scope);
  return instr(sep||csv||sep, sep||token||sep);
end csv_instr;

function starts_with (str in varchar2, prefix in varchar2) return boolean is
  scope  logger_logs.scope%type := scope_prefix || 'starts_with';
begin
  assert(prefix is not null, 'prefix cannot be null', scope);
  return substr(str, 1, length(prefix)) = prefix;
end starts_with;

function ends_with (str in varchar2, suffix in varchar2) return boolean is
  scope  logger_logs.scope%type := scope_prefix || 'ends_with';
begin
  assert(suffix is not null, 'suffix cannot be null', scope);
  return substr(str, -length(suffix)) = suffix;
end ends_with;

function replace_prefix
  (str        in varchar2
  ,prefix     in varchar2
  ,prefix_new in varchar2 := null
  ) return varchar2 is
begin
  if starts_with(str, prefix) then
    return prefix_new || substr(str, length(prefix) + 1);
  else
    return str;
  end if;
end replace_prefix;

function replace_suffix
  (str        in varchar2
  ,suffix     in varchar2
  ,suffix_new in varchar2 := null
  ) return varchar2 is
begin
  if ends_with(str, suffix) then
    return substr(str, 1, length(str) - length(suffix)) || suffix_new;
  else
    return str;
  end if;
end replace_suffix;

function trim_whitespace (str in varchar2) return varchar2 is
begin
  return regexp_replace(str,'(^[[:space:]]*|[[:space:]]*$)');
end trim_whitespace;

function plural_to_singular (str in varchar2) return varchar2 is
  buf varchar2(32767) := str;
begin
  --This logic is intentionally naive, if an identifier doesn't get inflected
  --correctly, just add an exception in for it.
  buf := replace_suffix(buf, 'criteria', 'criterion');
  buf := replace_suffix(buf, 'indices', 'index');
  buf := replace_suffix(buf, 'people', 'person');
  buf := replace_suffix(buf, 'men', 'man');
  buf := replace_suffix(buf, 'children', 'child');
  buf := replace_suffix(buf, 'ies', 'y');
  buf := replace_suffix(buf, 'ses', 's');
  buf := replace_suffix(buf, 'ches', 'ch');
  buf := replace_suffix(buf, 'shes', 'sh');
  buf := replace_suffix(buf, 'xes', 'x');
  buf := replace_suffix(buf, 's');
  return buf;
end plural_to_singular;

function singular_to_plural (str in varchar2) return varchar2 is
  buf varchar2(32767) := str;
begin
  --This logic is intentionally naive, if an identifier doesn't get inflected
  --correctly, just add an exception in for it.
  if ends_with(buf, 'criterion') then buf := replace_suffix(buf, 'criterion', 'criteria');
  elsif ends_with(buf, 'index')  then buf := replace_suffix(buf, 'index', 'indices');
  elsif ends_with(buf, 'person') then buf := replace_suffix(buf, 'person', 'people');
  elsif ends_with(buf, 'man')    then buf := replace_suffix(buf, 'man', 'men');
  elsif ends_with(buf, 'child')  then buf := buf || 'ren';
  elsif ends_with(buf, 'ay')
     or ends_with(buf, 'ey')
     or ends_with(buf, 'iy')
     or ends_with(buf, 'oy')
     or ends_with(buf, 'uy')     then buf := buf || 's';
  elsif ends_with(buf, 'y')      then buf := replace_suffix(buf, 'y', 'ies');
  elsif ends_with(buf, 's')
     or ends_with(buf, 'ch')
     or ends_with(buf, 'sh')
     or ends_with(buf, 'x')      then buf := buf || 'es';
                                 else buf := buf || 's';
  end if;
  return buf;
end singular_to_plural;

function user_friendly_label
  (identifier in varchar2
  ,inflect    in varchar2 := null
  ) return varchar2 is
  lbl varchar2(30) := identifier;
begin
  lbl := replace_suffix(replace_suffix(replace_suffix(
         replace_suffix(replace_suffix(replace_suffix(
         replace_suffix(
         lbl
         , '_' || col_suffix_id)
         , '_' || col_suffix_y)
         , '_' || col_suffix_date)
         , '_' || col_suffix_datetime)
         , '_' || col_suffix_timestamp)
         , '_' || col_suffix_timestamp_tz)
         , '_' || col_suffix_yn);

  lbl := lower(replace(lbl,'_',' '));

  case inflect
  when singular then
    lbl := plural_to_singular(lbl);
  when plural then
    lbl := singular_to_plural(lbl);
  else
    null;
  end case;

  return initcap(lbl);
end user_friendly_label;

function lob_substr
  (lob_loc in clob character set any_cs
  ,amount  in integer := 32767
  ,offset  in integer := 1
  ) return varchar2 character set lob_loc%charset is
  scope  logger_logs.scope%type := scope_prefix || 'lob_substr';
  chunksize constant number := 8000;
  buf       varchar2(32767);
  l_offset  number := offset;
  iteration number := 0;
begin
  assert(amount <= 32767, 'amount cannot be greater than 32767', scope);
  assert(offset >= 1, 'offset cannot be less than 1', scope);
  -- workaround for dbms_lob.substr bug in 11.2.0.2 when amount > 8K
  loop
    iteration := iteration + 1;
    if iteration > 1000 then
      raise_application_error(-20000, 'max iterations');
    end if;
    exit when l_offset > offset + amount;
    buf := buf
         || dbms_lob.substr
              (lob_loc => lob_loc
              ,amount  => least(chunksize, offset+amount-l_offset)
              ,offset  => l_offset);
    l_offset := l_offset + chunksize;
  end loop;
  return buf;
end lob_substr;

end util;
/

show errors