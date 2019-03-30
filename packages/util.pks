create or replace package util is
/*******************************************************************************
 Generic validation and whatnot routines
*******************************************************************************/

date_format             constant varchar2(100) := 'DD-MON-YYYY';
date_format_alt         constant varchar2(100) := 'MON-DD-YYYY';
datetime_format         constant varchar2(100) := 'DD-MON-YYYY HH:MI:SSPM';
datetime_format_alt     constant varchar2(100) := 'DD-MON-YYYY HH:MIPM';
timestamp_format        constant varchar2(100) := 'DD-MON-YYYY HH24:MI:SS.FF';
timestamp_format_alt    constant varchar2(100) := 'DD-MON-YYYY HH24:MI:SS';
timestamp_tz_format     constant varchar2(100) := 'DD-MON-YYYY HH24:MI:SS.FF TZH:TZM';
time24h_format          constant varchar2(100) := 'HH24:MI';
time12h_format          constant varchar2(100) := 'HH:MIPM';
time24h_ss_format       constant varchar2(100) := 'HH24:MI:SS';
apex_cal_dt_format      constant varchar2(100) := 'YYYYMMDDHHMIPM';

-- column naming conventions for certain data types
col_suffix_code         constant varchar2(30) := 'CODE'; /*a "code" is an alphanumeric 100-char string with no punctuation except for underscores*/
col_suffix_id           constant varchar2(30) := 'ID';
col_suffix_date         constant varchar2(30) := 'DATE';
col_suffix_datetime     constant varchar2(30) := 'DT';
col_suffix_timestamp    constant varchar2(30) := 'TS';
col_suffix_timestamp_tz constant varchar2(30) := 'TSZ'; /*timestamp with time zone*/
col_suffix_y            constant varchar2(30) := 'Y'; /*indicator (Y or null)*/
col_suffix_yn           constant varchar2(30) := 'YN'; /*indicator (Y or N)*/

code_max_len            constant integer := 100;

-- validation routine action types
return_errors           constant varchar2(30) := 'RETURN_ERRORS'; /* return error messages separated by */
register_apex_error     constant varchar2(30) := 'REGISTER_APEX_ERROR';

-- default CSV separator
csv_sep                 constant varchar2(1) := ',';

-- user-friendly label inflections
singular                constant varchar2(30) := 'SINGULAR';
plural                  constant varchar2(30) := 'PLURAL';

-- known non-null "invalid" ID value
magic_id_value constant number := -1;

lost_update exception;

application_error exception;
application_errcode constant number := -20000;
pragma exception_init (application_error, -20000);

assertion_failed exception;
assertion_errcode constant number := -20100;
pragma exception_init (assertion_failed, -20100);

ref_constraint_violation exception;
ref_constraint_errcode constant number := -02292;
pragma exception_init (ref_constraint_violation, -02292);

type num_array   is table of number          index by binary_integer;
type v20_array   is table of varchar2(20)    index by binary_integer;
type v4000_array is table of varchar2(4000)  index by binary_integer;
type v32k_array  is table of varchar2(32767) index by binary_integer;
subtype msg_array is v32k_array;

-- Wrapper for apex_util.set_session_state.
procedure sv
  (p_name  in varchar2
  ,p_value in varchar2);

-- Set Session State for DATE and DATETIME.
-- Uses item naming conventions to automatically choose
-- format for TO_CHAR conversion.
procedure sd
  (p_name  in varchar2
  ,p_value in date
  ,p_fmt   in varchar2 := null /*override auto-selected format*/);

-- Set Session State for TIMESTAMP and TIMESTAMP_TZ
-- Uses item naming conventions to automatically choose
-- format for TO_CHAR conversion.
procedure st
  (p_name  in varchar2
  ,p_value in timestamp
  ,p_fmt   in varchar2 := null /*override auto-selected format*/);

-- get a date, datetime or timestamp from an APEX item
-- format used is based on name convention
function dv
  (p_name in varchar2
  ,p_fmt  in varchar2 := null /*override auto-selected format*/
  ) return date;

 -- get dbms_application_info client_info
function client_info return varchar2;

-- convert a string to a number
function num_val (val in varchar2) return number deterministic;

-- convert a string to a date
function date_val (val in varchar2) return date deterministic;

-- convert a string to a datetime
function datetime_val (val in varchar2) return date deterministic;

-- convert a string to a timestamp
function timestamp_val (val in varchar2) return timestamp deterministic;

-- convert a string to a timestamp-with-time-zone
function timestamp_tz_val (val in varchar2) return timestamp with time zone deterministic;

-- if cond is FALSE, add msg to error list
-- (if cond is NULL (unknown), does not add error)
procedure val_cond
  (cond        in boolean  := false
  ,msg         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null);

-- general-purpose NOT NULL validator
procedure val_not_null
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null);

-- general-purpose MAXIMUM LENGTH validator
procedure val_max_len
  (val         in varchar2
  ,len         in number
  ,label       in varchar2 := null
  ,column_name in varchar2 := null);

-- general-purpose NUMERIC validator
procedure val_numeric
  (val         in varchar2
  ,range_low   in number   := null
  ,range_high  in number   := null
  ,label       in varchar2 := null
  ,column_name in varchar2 := null);

-- general-purpose INTEGER validator
procedure val_integer
  (val         in varchar2
  ,range_low   in number   := null
  ,range_high  in number   := null
  ,label       in varchar2 := null
  ,column_name in varchar2 := null);

-- general-purpose DATE validator
procedure val_date
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null);

-- general-purpose DATETIME validator
procedure val_datetime
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null);

-- general-purpose TIMESTAMP validator
procedure val_timestamp
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null);

-- general-purpose TIMESTAMP WITH TIMEZONE validator
procedure val_timestamp_tz
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null);

-- general-purpose INDICATOR (Y or null) validator
procedure val_y
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null);

-- general-purpose YES/NO (Y or N) validator
procedure val_yn
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null);

-- general-purpose date range validator
procedure val_date_range
  (start_date in varchar2
  ,end_date   in varchar2
  ,label      in varchar2);

-- general-purpose date/time range validator
procedure val_datetime_range
  (start_dt in varchar2
  ,end_dt   in varchar2
  ,label    in varchar2);

-- validate against a list of values
procedure val_domain
  (val          in varchar2
  ,valid_values in apex_t_varchar2
  ,label        in varchar2 := null
  ,column_name  in varchar2 := null);

-- validate a Lat,Long pair
procedure val_lat_lng
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null);

-- validate a "code" (alphanumeric/underscore string)
procedure val_code
  (val         in varchar2
  ,label       in varchar2 := null
  ,column_name in varchar2 := null);

-- returns NULL if there are no errors
function first_error return varchar2;

-- returns array of error messages
function err_arr return msg_array;

-- returns list of error messages, formatted
-- if string will exceed max_len, it will append "+ n more"
function errors_list
  (pre_list      in varchar2 := '<ul>'
  ,pre_item      in varchar2 := '<li>'
  ,between_items in varchar2 := ''
  ,post_item     in varchar2 := '</li>'
  ,post_list     in varchar2 := '</ul>'
  ,max_len       in number   := 4000
  ) return varchar2;

procedure assert
  (testcond  in boolean
  ,assertion in varchar2
  ,scope     in varchar2);

procedure raise_error
  (err_msg in varchar2
  ,scope   in varchar2
  ,params  in logger.tab_param := logger.gc_empty_tab_param);

procedure raise_lost_update
  (updated_by in varchar2
  ,updated_dt in date
  ,scope      in varchar2
  ,params     in logger.tab_param := logger.gc_empty_tab_param);

procedure raise_dup_val_on_index
  (scope  in varchar2
  ,params in logger.tab_param := logger.gc_empty_tab_param);

-- when ORA-02292 is raised on an update
procedure raise_ref_con_violation
  (scope  in varchar2
  ,params in logger.tab_param := logger.gc_empty_tab_param);

-- when ORA-02292 is raised on a delete
procedure raise_del_ref_con_violation
  (scope  in varchar2
  ,params in logger.tab_param := logger.gc_empty_tab_param);

procedure success (i_msg in varchar2);

-- searches g_f01 for the selected index
function selected (ind in number) return boolean;

procedure clear_page_cache;

function apex_error_handler (p_error in apex_error.t_error) return apex_error.t_error_result;

-- if the current user doesn't have the given authorisation, raise an exception
procedure check_authorization (authorization_name in varchar2);

-- return the current application ID
function apex_app_id return number;

-- return the current page ID
function apex_page_id return number;

-- append various apex-related parameters
procedure append_apex_params (params in out logger.tab_param);

-- append str to buf, append sep if buf is not empty
procedure append_str
  (buf in out varchar2
  ,str in varchar2
  ,sep in varchar2 := csv_sep);

procedure split_str
  (str   in varchar2
  ,delim in varchar2
  ,lhs   out varchar2
  ,rhs   out varchar2);

function csv_replace
  (csv   in varchar2
  ,token in varchar2
  ,val   in varchar2 := ''
  ,sep   in varchar2 := csv_sep
  ) return varchar2;

function csv_instr
  (csv   in varchar2
  ,token in varchar2
  ,sep   in varchar2 := csv_sep
  ) return integer;

-- returns TRUE if the string has the given prefix
function starts_with (str in varchar2, prefix in varchar2) return boolean;

-- returns TRUE if the string has the given suffix
function ends_with (str in varchar2, suffix in varchar2) return boolean;

-- if the given prefix is found at the start of the string, replace it
-- (otherwise, return string unchanged)
function replace_prefix
  (str        in varchar2
  ,prefix     in varchar2
  ,prefix_new in varchar2 := null /*null to remove*/
  ) return varchar2;

-- if the given suffix is found at the end of the string, replace it
-- (otherwise, return string unchanged)
function replace_suffix
  (str        in varchar2
  ,suffix     in varchar2
  ,suffix_new in varchar2 := null /*null to remove*/
  ) return varchar2;

-- trim any amount of whitespace characters from the start and end of the string
function trim_whitespace (str in varchar2) return varchar2;

-- generate a user-friendly label for the given identifier
function user_friendly_label
  (identifier in varchar2
  ,inflect    in varchar2 := null /*e.g. SINGULAR, PLURAL*/
  ) return varchar2;

-- wrapper for DBMS_LOB.substr to avoid bug in 11.2.0.2
function lob_substr
  (lob_loc in clob character set any_cs
  ,amount  in integer := 32767
  ,offset  in integer := 1
  ) return varchar2 character set lob_loc%charset;

end util;
/