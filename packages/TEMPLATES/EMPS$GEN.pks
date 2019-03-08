create or replace package EMPS$GEN is
/*******************************************************************************
 Code templates specific to the EMPS table
 Note: no package body is required.
*******************************************************************************/

--avoid compilation of the template code
$if false $then

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE TAPI_PACKAGE_BODY_COPY>

  nr.name := SUBSTR(nr.name || ' (copy)', 1, 100);

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

$end
end EMPS$GEN;
/

SHOW ERRORS