PROMPT Package GEN_LOV_VW
create or replace package gen_lov_vw as
/*******************************************************************************
 Generate LOV view for a table
*******************************************************************************/

-- oddgen PL/SQL data types
subtype string_type is varchar2(1000 char);
subtype param_type is varchar2(60 char);
type t_string is table of string_type;
type t_param is table of string_type index by param_type;
type t_lov is table of t_string index by param_type;

-- oddgen api routines
function get_name return varchar2;
function get_description return varchar2;
function get_object_types return t_string;
function get_object_names(in_object_type in varchar2) return t_string;
function generate (in_object_type in varchar2,in_object_name in varchar2,in_params in t_param) return clob;

end gen_lov_vw;
/

show errors
