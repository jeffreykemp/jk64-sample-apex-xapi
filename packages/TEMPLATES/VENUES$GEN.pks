create or replace package VENUES$GEN is
/*******************************************************************************
 Code templates specific to the VENUES table
 Note: no package body is required.
*******************************************************************************/

--avoid compilation of the template code
$if false $then

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE TAPI_PACKAGE_BODY_VAL>

  UTIL.val_lat_lng (val => rv.map_position, column_name => C_MAP_POSITION);

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE TAPI_PACKAGE_BODY_COPY>

  nr.name := SUBSTR(nr.name || ' (copy)', 1, 100);

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

$end
end VENUES$GEN;
/

SHOW ERRORS