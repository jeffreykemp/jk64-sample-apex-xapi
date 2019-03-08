create or replace package HOSTS$GEN is
/*******************************************************************************
 Code templates specific to the HOSTS table
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
end HOSTS$GEN;
/

SHOW ERRORS