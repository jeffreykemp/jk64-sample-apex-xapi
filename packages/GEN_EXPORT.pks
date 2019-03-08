PROMPT Package GEN_EXPORT
CREATE OR REPLACE PACKAGE GEN_EXPORT AS
/*******************************************************************************
 Export data from a table
*******************************************************************************/

default_prompts constant varchar2(100) := 'PROMPT {pct}% inserted {table}: {n} of {total}';

-- oddgen PL/SQL data types
SUBTYPE string_type IS VARCHAR2(1000 CHAR);
SUBTYPE param_type IS VARCHAR2(60 CHAR);
TYPE t_string IS TABLE OF string_type;
TYPE t_param IS TABLE OF string_type INDEX BY param_type;
TYPE t_lov IS TABLE OF t_string INDEX BY param_type;

-- oddgen api routines
FUNCTION get_name RETURN VARCHAR2;
FUNCTION get_description RETURN VARCHAR2;
FUNCTION get_object_types RETURN t_string;
FUNCTION get_object_names(in_object_type IN VARCHAR2) RETURN t_string;
FUNCTION get_params (in_object_type IN VARCHAR2,in_object_name IN VARCHAR2) RETURN t_param;
FUNCTION get_ordered_params(in_object_type IN VARCHAR2, in_object_name IN VARCHAR2) RETURN t_string;
FUNCTION get_lov (in_object_type IN VARCHAR2,in_object_name IN VARCHAR2,in_params IN t_param) RETURN t_lov;
FUNCTION generate (in_object_type IN VARCHAR2,in_object_name IN VARCHAR2,in_params IN t_param) RETURN CLOB;

-- returns the data from a smallish table as a series of INTO statements
--    SELECT * FROM TABLE(gen_tapis.export_data('MYTABLE',exclude=>'GENERATED,LOBS'));
FUNCTION export_inserts
  (table_name      IN VARCHAR2
  ,exclude         IN VARCHAR2 := NULL
  ,commit_count    IN NUMBER   := 1000 -- commit after this many INSERT statements; NULL to include no commit
  ,prompts         IN VARCHAR2 := default_prompts
  ) RETURN t_str_array PIPELINED;

-- returns the data in CSV file format
-- header = '#Label#' - first record will be a header line filled with friendly
--                      column labels
-- header = '#col#'   - first record will be a header line filled with column
--                      names
-- header = null      - no header record will be returned
FUNCTION export_csv
  (table_name IN VARCHAR2
  ,header     IN VARCHAR2 := '#Label#'
  ,exclude    IN VARCHAR2 := NULL
  ) RETURN t_str_array PIPELINED;

END GEN_EXPORT;
/

SHOW ERRORS