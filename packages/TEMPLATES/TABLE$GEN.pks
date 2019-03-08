create or replace package TABLE$GEN is
/*******************************************************************************
 Code templates specific to the TABLE table
 Note: no package body is required.
*******************************************************************************/

--avoid compilation of the template code
$if false $then

-- Notes on using this template:
-- 1. To add custom code to a particular section below, uncomment the <%TEMPLATE
--    and <%END TEMPLATE> lines and add your code.
-- 2. Make sure to include a blank line after <%TEMPLATE and a blank line
--    before <%END TEMPLATE> (this works around a bug in the generator).

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package spec type/constant declarations
--<%TEMPLATE TAPI_PACKAGE_SPEC_DEC>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package spec method declarations
--<%TEMPLATE TAPI_PACKAGE_SPEC_METHODS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package body type/constant declarations
--<%TEMPLATE TAPI_PACKAGE_BODY_DEC>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI extra label mappings, e.g.
--   lm(C_MYCOLUMN) := 'My Column';
--<%TEMPLATE TAPI_PACKAGE_BODY_LABEL_MAP>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI extra validations, e.g.
--   UTIL.val_cond (cond => ..., msg => '...');
--   UTIL.val_not_null (val => rv.col, column_name => C_COL);
--   UTIL.val_date_range (start_date => rv.start_date, end_date => rv.end_date, label => 'Start/End Dates');
--   UTIL.val_domain (val => rv.col, valid_values => t_str_array('X','Y','Z'), column_name => C_COL);
--<%TEMPLATE TAPI_PACKAGE_BODY_VAL>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI pre-insert steps (record to insert is lr), e.g.
--   lr.col := 'xyz';
--<%TEMPLATE TAPI_PACKAGE_BODY_PRE_INS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI post-insert steps (inserted record is r)
--<%TEMPLATE TAPI_PACKAGE_BODY_POST_INS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI pre-bulk insert steps (array of records is lr)
--<%TEMPLATE TAPI_PACKAGE_BODY_PRE_BULK_INS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI post-bulk insert steps
--<%TEMPLATE TAPI_PACKAGE_BODY_POST_BULK_INS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI pre-update steps (record to update is lr), e.g.
--   lr.col := 'xyz';
--<%TEMPLATE TAPI_PACKAGE_BODY_PRE_UPD>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI post-update steps (updated record is r)
--<%TEMPLATE TAPI_PACKAGE_BODY_POST_UPD>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI pre-bulk update steps (array of records is lr)
--<%TEMPLATE TAPI_PACKAGE_BODY_PRE_BULK_UPD>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI post-bulk update steps
--<%TEMPLATE TAPI_PACKAGE_BODY_POST_BULK_UPD>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI pre-delete steps (record to delete is lr)
--<%TEMPLATE TAPI_PACKAGE_BODY_PRE_DEL>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI post-delete steps
--<%TEMPLATE TAPI_PACKAGE_BODY_POST_DEL>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI pre-bulk delete steps (array of records is lr)
--<%TEMPLATE TAPI_PACKAGE_BODY_PRE_BULK_DEL>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI post-bulk delete steps
--<%TEMPLATE TAPI_PACKAGE_BODY_POST_BULK_DEL>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI additional code when converting a rowtype (r) to an rvtype (rv), e.g.
--   rv.col := TRIM(r.col);
--<%TEMPLATE TAPI_PACKAGE_BODY_TO_RVTYPE>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI additional code when setting up a default new record, e.g.
--   r.col := 'xyz';
--<%TEMPLATE TAPI_PACKAGE_BODY_SET_DEFAULT>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI additional code when copying a record (r) to a new one (nr), e.g.
--   nr.name := SUBSTR(r.name || ' (copy)', 1, 100);
--<%TEMPLATE TAPI_PACKAGE_BODY_COPY>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- TAPI package body methods
--<%TEMPLATE TAPI_PACKAGE_BODY_METHODS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package spec type/constant declarations
--<%TEMPLATE APEXAPI_PACKAGE_SPEC_DEC>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package spec method declarations
--<%TEMPLATE APEXAPI_PACKAGE_SPEC_METHODS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body type/constant declarations
--<%TEMPLATE APEXAPI_PACKAGE_BODY_DEC>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API additional steps when setting page session state
--<%TEMPLATE APEXAPI_PACKAGE_APEX_SET>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API additional steps when getting identifier from session state
--<%TEMPLATE APEXAPI_PACKAGE_APEX_GET_PK>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API additional steps when getting record from session state
--<%TEMPLATE APEXAPI_PACKAGE_APEX_GET>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API additional steps when loading a page
--<%TEMPLATE APEXAPI_PACKAGE_LOAD>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API additional steps when validating a page
--<%TEMPLATE APEXAPI_PACKAGE_VAL>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API pre-insert steps
--<%TEMPLATE APEXAPI_PACKAGE_PRE_INS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API post-insert steps
--<%TEMPLATE APEXAPI_PACKAGE_POST_INS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API pre-update steps
--<%TEMPLATE APEXAPI_PACKAGE_PRE_UPD>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API post-update steps
--<%TEMPLATE APEXAPI_PACKAGE_POST_UPD>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API pre-delete steps
--<%TEMPLATE APEXAPI_PACKAGE_PRE_DEL>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API pre-delete steps
--<%TEMPLATE APEXAPI_PACKAGE_POST_DEL>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API pre-insert (tabular/grid) steps
--<%TEMPLATE APEXAPI_PACKAGE_PRE_INS_MR>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API post-insert (tabular/grid) steps
--<%TEMPLATE APEXAPI_PACKAGE_POST_INS_MR>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API pre-update (tabular/grid) steps
--<%TEMPLATE APEXAPI_PACKAGE_PRE_UPD_MR>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API post-update (tabular/grid) steps
--<%TEMPLATE APEXAPI_PACKAGE_POST_UPD_MR>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API pre-delete (tabular/grid) steps
--<%TEMPLATE APEXAPI_PACKAGE_PRE_DEL_MR>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API post-delete (tabular/grid) steps
--<%TEMPLATE APEXAPI_PACKAGE_POST_DEL_MR>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

-- Apex API package body methods
--<%TEMPLATE APEXAPI_PACKAGE_BODY_METHODS>
--<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

$end
end TABLE$GEN;
/

SHOW ERRORS