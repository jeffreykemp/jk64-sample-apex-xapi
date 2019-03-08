PROMPT Package GEN_LOV_VW
CREATE OR REPLACE PACKAGE GEN_LOV_VW AS
/*******************************************************************************
 Generate LOV view for a table
*******************************************************************************/

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
FUNCTION generate (in_object_type IN VARCHAR2,in_object_name IN VARCHAR2,in_params IN t_param) RETURN CLOB;

END GEN_LOV_VW;
/

SHOW ERRORS