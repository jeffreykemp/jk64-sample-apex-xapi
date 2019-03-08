CREATE OR REPLACE PACKAGE BODY GEN_TEMPLATE_PKG AS

scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

c_template_pkg constant varchar2(32767) := q'[PROMPT Template Package {{TEMPLATEPKG}}
create or replace PACKAGE {{TEMPLATEPKG}} AS
/*******************************************************************************
 Code templates for {{TABLE}}
 Jeffrey Kemp {{SYSDATE}}
 Each template starts with <%TEMPLATE [name]> and ends with <%END TEMPLATE>
 Empty templates may be safely omitted
 For syntax, refer to:
 https://bitbucket.org/jk64/jk64-sample-apex-tapi/wiki/Template%20Syntax
*******************************************************************************/

--avoid compilation of the template code
$if false $then
--(these borders are just to visually separate the templates, they're not significant)
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package spec extra type/constant declarations
--<%TEMPLATE TAPI_PACKAGE_SPEC_DEC>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package spec extra method declarations
--<%TEMPLATE TAPI_PACKAGE_SPEC_METHODS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package body private methods / declarations
--<%TEMPLATE TAPI_PACKAGE_BODY_DEC>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package body extra validations; record is "rv"
--<%TEMPLATE TAPI_PACKAGE_BODY_VAL>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package body pre-insert (single row); record to insert is "lr"
--<%TEMPLATE TAPI_PACKAGE_BODY_PRE_INS>
--<%END TEMPLATE>

-- TAPI package body post-insert (single row); record inserted is "r"
--<%TEMPLATE TAPI_PACKAGE_BODY_POST_INS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package body pre-insert (bulk); array to insert is "lr"
--<%TEMPLATE TAPI_PACKAGE_BODY_PRE_BULK_INS>
--<%END TEMPLATE>

-- TAPI package body post-insert (bulk)
--<%TEMPLATE TAPI_PACKAGE_BODY_POST_BULK_INS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package body pre-update (single row); record to update is "lr"
--<%TEMPLATE TAPI_PACKAGE_BODY_PRE_UPD>
--<%END TEMPLATE>

-- TAPI package body post-update (single row); updated record is "r"
--<%TEMPLATE TAPI_PACKAGE_BODY_POST_UPD>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package body pre-update (bulk); array to update is "lr"
--<%TEMPLATE TAPI_PACKAGE_BODY_PRE_BULK_UPD>
--<%END TEMPLATE>

-- TAPI package body post-update (bulk)
--<%TEMPLATE TAPI_PACKAGE_BODY_POST_BULK_UPD>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package body pre-delete (single row); record to delete is "lr"
--<%TEMPLATE TAPI_PACKAGE_BODY_PRE_DEL>
--<%END TEMPLATE>

-- TAPI package body post-delete (single row)
--<%TEMPLATE TAPI_PACKAGE_BODY_POST_DEL>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package body pre-delete (bulk); array to delete is "lr"
--<%TEMPLATE TAPI_PACKAGE_BODY_PRE_BULK_DEL>
--<%END TEMPLATE>

-- TAPI package body post-delete (bulk)
--<%TEMPLATE TAPI_PACKAGE_BODY_POST_BULK_DEL>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package body set default values for new record; record is "r"
--<%TEMPLATE TAPI_PACKAGE_BODY_SET_DEFAULT>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package body set values for copied record; record is "nr"
--<%TEMPLATE TAPI_PACKAGE_BODY_COPY>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package body extra methods
--<%TEMPLATE TAPI_PACKAGE_BODY_METHODS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package spec extra type/constant declarations
--<%TEMPLATE APEXAPI_PACKAGE_SPEC_DEC>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package spec extra method declarations
--<%TEMPLATE APEXAPI_PACKAGE_SPEC_METHODS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body forward method declarations
--<%TEMPLATE APEXAPI_PACKAGE_BODY_DEC>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body apex_set code to run before setting item values;
-- record is "r"
--<%TEMPLATE APEXAPI_PACKAGE_APEX_PRE_SET>
--<%END TEMPLATE>

-- Apex API package body apex_set extra code; record is "r"
--<%TEMPLATE APEXAPI_PACKAGE_APEX_SET>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body apex_get code to run before getting item values;
-- record is "rv"
--<%TEMPLATE APEXAPI_PACKAGE_APEX_PRE_GET>
--<%END TEMPLATE>

-- Apex API package body apex_get extra code; record is "rv"
--<%TEMPLATE APEXAPI_PACKAGE_APEX_GET>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body apex_get_pk extra code; record is "rv"
--<%TEMPLATE APEXAPI_PACKAGE_APEX_GET_PK>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body extra code before loading data for a page
--<%TEMPLATE APEXAPI_PACKAGE_PRE_LOAD>
--<%END TEMPLATE>

-- Apex API package body extra code for loading data for a page; record is "r"
--<%TEMPLATE APEXAPI_PACKAGE_LOAD>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

--If any page item does not match the column name, add it here so that error
--messages are associated with the apex item:
--<%TEMPLATE APEXAPI_PACKAGE_ITEMMAP>
--    item_name_map(C_COLUMN) := p || 'ITEMNAME';
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body extra code for validating a page; record is "rv"
--<%TEMPLATE APEXAPI_PACKAGE_VAL>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

--If any column alias is different to the column name, assign it here so that
--error messages are associated with the tabular form column:
--<%TEMPLATE APEXAPI_PACKAGE_COLUMNMAP>
--    column_alias_map(C_COLUMN) := 'ALIAS';
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body page process procedure extra declarations
--<%TEMPLATE APEXAPI_PACKAGE_PROCESS_DEC>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body extra code before processing a CREATE; record is "rv"
--<%TEMPLATE APEXAPI_PACKAGE_PRE_INS>
--<%END TEMPLATE>

-- Apex API package body extra code after processing a CREATE; record is "r"
--<%TEMPLATE APEXAPI_PACKAGE_POST_INS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body extra code before processing a SAVE; record is "rv"
--<%TEMPLATE APEXAPI_PACKAGE_PRE_UPD>
--<%END TEMPLATE>

-- Apex API package body extra code after processing a SAVE; record is "r"
--<%TEMPLATE APEXAPI_PACKAGE_POST_UPD>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body extra code before processing a DELETE; record is "rv"
--<%TEMPLATE APEXAPI_PACKAGE_PRE_DEL>
--<%END TEMPLATE>

-- Apex API package body extra code after processing a DELETE; record is "rv"
--<%TEMPLATE APEXAPI_PACKAGE_POST_DEL>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body other processes, e.g. start with
--   WHEN APEX_APPLICATION.g_request = 'MY_BUTTON' THEN ...
--<%TEMPLATE APEXAPI_PACKAGE_OTHER_PROCESS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body extra code after processing a tabular form row; record is "r"
--<%TEMPLATE APEXAPI_PACKAGE_POST_APPLY_ROW>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body extra methods
--<%TEMPLATE APEXAPI_PACKAGE_BODY_METHODS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

$end
END {{TEMPLATEPKG}};
/

SHOW ERRORS
]';

-- return a new Oracle identifier (<=30 chars) based on an original identifier plus a suffix
FUNCTION suffix_identifier
  (original IN VARCHAR2
  ,suffix   IN VARCHAR2
  ) RETURN VARCHAR2 IS
BEGIN
  RETURN SUBSTR(UPPER(original), 1, 30 - LENGTH(suffix)) || suffix;
END suffix_identifier;

FUNCTION template_package_name (table_name IN VARCHAR2) RETURN VARCHAR2 IS
BEGIN
  RETURN suffix_identifier(original => table_name
                          ,suffix   => TEMPLATES.TEMPLATE_SUFFIX);
END template_package_name;

/*******************************************************************************
                               PUBLIC INTERFACE
*******************************************************************************/

FUNCTION get_name RETURN VARCHAR2 IS
BEGIN
  RETURN 'API Template Package';
END get_name;

FUNCTION get_description RETURN VARCHAR2 IS
BEGIN
  RETURN 'Generate TAPI / Apex API Template Package';
END get_description;

FUNCTION get_object_types RETURN t_string IS
BEGIN
  RETURN NEW t_string('TABLE');
END get_object_types;

FUNCTION get_object_names(in_object_type IN VARCHAR2) RETURN t_string IS
  l_object_names t_string;
BEGIN
  SELECT object_name BULK COLLECT INTO l_object_names
  FROM   user_objects
  WHERE  object_type = in_object_type
  AND    object_name not like '%$%'
  AND    generated = 'N'
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
  
  buf := REPLACE(REPLACE(REPLACE(c_template_pkg
    ,'{{TABLE}}',       upper(in_object_name))
    ,'{{TEMPLATEPKG}}', template_package_name(in_object_name))
    ,'{{SYSDATE}}',     to_char(sysdate,'DD/MM/YYYY'))
    ;
  
  logger.log('END', scope, buf, params);
  RETURN buf;
EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END generate;

END GEN_TEMPLATE_PKG;
/

SHOW ERRORS