create or replace package EVENT_TYPES$GEN is
/*******************************************************************************
 Code templates specific to the EVENT_TYPES table
 Note: no package body is required.
*******************************************************************************/

--avoid compilation of the template code
$if false $then

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE TAPI_PACKAGE_BODY_LABEL_MAP>

  lm(C_CALENDAR_CSS) := 'Calendar Style';
  
<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE TAPI_PACKAGE_BODY_VAL>

  UTIL.val_cond
    (cond        => rv.event_type = UPPER(rv.event_type)
    ,msg         => 'Event Type Code must be all uppercase'
    ,column_name => C_EVENT_TYPE);
  UTIL.val_cond
    (cond        => rv.event_type = TRANSLATE(rv.event_type,'X -:','X___')
    ,msg         => 'Event Type Code cannot include spaces, dashes (-) or colons (:)'
    ,column_name => C_EVENT_TYPE);
  UTIL.val_date_range
    (start_date => rv.start_date
    ,end_date   => rv.end_date
    ,label      => 'Event Types Date Range');

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE TAPI_PACKAGE_BODY_COPY>

  nr.event_type := SUBSTR(nr.event_type || '_COPY', 1, 100);
  nr.name       := SUBSTR(nr.name || ' (copy)', 1, 200);

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

$end
end EVENT_TYPES$GEN;
/

SHOW ERRORS