create or replace package EVENTS$GEN is
/*******************************************************************************
 Code templates specific to the EVENTS table
 Note: no package body is required.
*******************************************************************************/

rv_additional_columns CONSTANT VARCHAR2(4000) := 'REPEAT_IND';

--avoid compilation of the template code
$if false $then

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE TAPI_PACKAGE_SPEC_DEC>

/*Repeat Types*/
DAILY    CONSTANT VARCHAR2(100) := 'DAILY';
WEEKLY   CONSTANT VARCHAR2(100) := 'WEEKLY';
MONTHLY  CONSTANT VARCHAR2(100) := 'MONTHLY';
ANNUALLY CONSTANT VARCHAR2(100) := 'ANNUALLY';

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE TAPI_PACKAGE_SPEC_METHODS>

PROCEDURE upd_venue_id
  (venue_id_old IN venues.venue_id%TYPE
  ,venue_id_new IN venues.venue_id%TYPE);

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE TAPI_PACKAGE_BODY_DEC>

C_REPEAT_IND CONSTANT VARCHAR2(30) := 'REPEAT_IND';

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE TAPI_PACKAGE_BODY_LABEL_MAP>

  lm(C_REPEAT_IND) := 'Repeat';
  
<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE TAPI_PACKAGE_BODY_VAL>

  UTIL.val_ind (val => rv.repeat_ind, column_name => C_REPEAT_IND);
  UTIL.val_integer (val => rv.repeat_interval, range_low => 1, column_name => C_REPEAT_INTERVAL);
  UTIL.val_domain
    (val          => rv.repeat
    ,valid_values => t_str_array(DAILY, WEEKLY, MONTHLY, ANNUALLY)
    ,column_name  => C_REPEAT);
  IF rv.repeat_ind = 'Y' THEN
    UTIL.val_not_null (val => rv.repeat, column_name => C_REPEAT);
    UTIL.val_not_null (val => rv.repeat_interval, column_name => C_REPEAT_INTERVAL);
  END IF;
  UTIL.val_datetime_range
    (start_dt => rv.start_dt
    ,end_dt   => rv.end_dt
    ,label    => 'Event Date/Time Range');

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE TAPI_PACKAGE_BODY_TO_RVTYPE>

  rv.repeat_ind := CASE WHEN r.repeat IS NOT NULL THEN 'Y' END;

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE TAPI_PACKAGE_BODY_COPY>

  nr.title := SUBSTR(nr.title || ' (copy)', 1, 100);

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE TAPI_PACKAGE_BODY_METHODS>

PROCEDURE upd_venue_id
  (venue_id_old IN venues.venue_id%TYPE
  ,venue_id_new IN venues.venue_id%TYPE) IS
  scope  logger_logs.scope%type := scope_prefix || 'upd_venue_id';
  params logger.tab_param;
BEGIN
  logger.append_param(params, 'venue_id_old', venue_id_old);
  logger.append_param(params, 'venue_id_new', venue_id_new);
  logger.log('START', scope, null, params);

  assert(venue_id_old IS NOT NULL, 'venue_id_old cannot be null', scope);

  UPDATE events e
  SET    e.venue_id = upd_venue_id.venue_id_new
  WHERE  e.venue_id = upd_venue_id.venue_id_old;

  logger.log('UPDATE events: ' || SQL%ROWCOUNT, scope, null, params);

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN UTIL.application_error THEN
    logger.log_error('Application Error', scope, null, params);
    RAISE;
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END upd_venue_id;

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE APEXAPI_PACKAGE_SPEC_METHODS>

-- calendar drag-and-drop handler
PROCEDURE drag_drop
  (event_id  IN events.event_id%TYPE
  ,repeat_no IN NUMBER
  ,start_dt  IN DATE
  ,end_dt    IN DATE);

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE APEXAPI_PACKAGE_BODY_DEC>

C_REPEAT_IND    CONSTANT VARCHAR2(30) := 'REPEAT_IND';
C_START_DT_TIME CONSTANT VARCHAR2(30) := 'START_DT_TIME';
C_END_DT_TIME   CONSTANT VARCHAR2(30) := 'END_DT_TIME';
C_EVENT_IDENT   CONSTANT VARCHAR2(30) := 'EVENT_IDENT';
C_HOST_NAME     CONSTANT VARCHAR2(30) := 'HOST_NAME';
C_VENUE_NAME    CONSTANT VARCHAR2(30) := 'VENUE_NAME';

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE APEXAPI_PACKAGE_APEX_SET>

  sd(p||C_START_DT,          r.start_dt, UTIL.DATE_FORMAT);
  sv(p||C_START_DT_TIME,     TO_CHAR(r.start_dt, UTIL.TIME12H_FORMAT));
  sd(p||C_END_DT,            r.end_dt, UTIL.DATE_FORMAT);
  sv(p||C_END_DT_TIME,       TO_CHAR(r.end_dt, UTIL.TIME12H_FORMAT));
  sv(p||C_REPEAT_IND,        CASE WHEN r.repeat IS NOT NULL THEN 'Y' END);

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE APEXAPI_PACKAGE_APEX_GET>

  rv.repeat_ind  := v(p||C_REPEAT_IND);

  rv.start_dt        := v(p||C_START_DT) || ' ' || v(p||C_START_DT_TIME);
  rv.end_dt          := v(p||C_END_DT) || CASE WHEN v(p||C_END_DT) IS NOT NULL THEN ' ' || v(p||C_END_DT_TIME) END;
  rv.repeat          := CASE WHEN rv.repeat_ind = 'Y' THEN v(p||C_REPEAT) END;
  rv.repeat_interval := CASE WHEN rv.repeat_ind = 'Y' THEN v(p||C_REPEAT_INTERVAL) END;
  rv.repeat_until    := CASE WHEN rv.repeat_ind = 'Y' THEN v(p||C_REPEAT_UNTIL) END;

  IF UTIL.apex_page_id = 9
  AND rv.version_id IS NULL THEN
    IF rv.host_id IS NULL
    AND v(p||C_HOST_NAME) IS NOT NULL THEN
      rv.host_id := UTIL.MAGIC_ID_VALUE; --indicate that host will be created, don't trigger not-null validation
    END IF;
    IF rv.venue_id IS NULL
    AND v(p||C_VENUE_NAME) IS NOT NULL THEN
      rv.venue_id := UTIL.MAGIC_ID_VALUE; --indicate that host will be created, don't trigger not-null validation
    END IF;
  END IF;

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE APEXAPI_PACKAGE_APEX_GET_PK>

  DECLARE
    event_ident VARCHAR2(100);
  BEGIN
    IF NVL(APEX_APPLICATION.g_request,'X') != 'COPY' THEN
      IF UTIL.apex_page_id = 2 THEN
        event_ident := v(p||C_EVENT_IDENT);
        IF INSTR(event_ident, '-') > 0 THEN
          rv.event_id := TO_NUMBER(SUBSTR(event_ident, 1, INSTR(event_ident, '-')-1));
        END IF;
      END IF;
    END IF;
  END;

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE APEXAPI_PACKAGE_LOAD>

  IF NVL(APEX_APPLICATION.g_request,'X') != 'COPY' THEN
    IF UTIL.apex_page_id = 9 THEN
      -- get start/end dates for a new event from the calendar
      -- Note: for some reason the apex calendar won't use 24h time format
      r.start_dt := UTIL.dv(p||'NEW_'||C_START_DT,UTIL.APEX_CAL_DT_FORMAT);
      r.end_dt   := UTIL.dv(p||'NEW_'||C_END_DT,UTIL.APEX_CAL_DT_FORMAT);
    END IF;
  END IF;

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE APEXAPI_PACKAGE_VAL>

    IF rv.host_id = UTIL.MAGIC_ID_VALUE THEN
      dummy := HOSTS$TAPI.val
        (rv => HOSTS$TAPI.rv(name => v(p||C_HOST_NAME)));
    END IF;

    IF rv.venue_id = UTIL.MAGIC_ID_VALUE THEN
      dummy := VENUES$TAPI.val
        (rv => VENUES$TAPI.rv(name => v(p||C_VENUE_NAME)));
    END IF;

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE APEXAPI_PACKAGE_PRE_INS>

    IF rv.host_id = UTIL.MAGIC_ID_VALUE THEN
      DECLARE
        hostrv    HOSTS$TAPI.rvtype;
        host      HOSTS$TAPI.rowtype;
      BEGIN
        hostrv.name := v(p||C_HOST_NAME);
        host := HOSTS$TAPI.ins(rv => hostrv);
        UTIL.success('Host created.');
        rv.host_id := host.host_id;
      END;
    END IF;

    IF rv.venue_id = UTIL.MAGIC_ID_VALUE THEN
      DECLARE
        venrv VENUES$TAPI.rvtype;
        ven   VENUES$TAPI.rowtype;
      BEGIN
        venrv.name := v(p||C_VENUE_NAME);
        ven := VENUES$TAPI.ins(rv => venrv);
        UTIL.success('Venue created.');
        rv.venue_id := ven.venue_id;
      END;
    END IF;

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

<%TEMPLATE APEXAPI_PACKAGE_BODY_METHODS>

PROCEDURE drag_drop
  (event_id  IN events.event_id%TYPE
  ,repeat_no IN NUMBER
  ,start_dt  IN DATE
  ,end_dt    IN DATE) IS
  scope        logger_logs.scope%type := scope_prefix || 'drag_drop';
  params       logger.tab_param;
  rv           <%TAPI>.rvtype;
  r            <%TAPI>.rowtype;
  days_offset  NUMBER;
  offset_count NUMBER;
  l_start_dt   DATE;
  l_end_dt     DATE;
BEGIN
  UTIL.append_apex_params(params);
  logger.append_param(params, 'event_id', event_id);
  logger.append_param(params, 'repeat_no', repeat_no);
  logger.append_param(params, 'start_dt', start_dt);
  logger.append_param(params, 'end_dt', end_dt);
  logger.log('START', scope, null, params);

  assert(event_id IS NOT NULL, 'event_id cannot be null', scope);
  assert(repeat_no IS NOT NULL, 'repeat_no cannot be null', scope);

  UTIL.check_authorization(SECURITY.Operator);

  rv := <%TAPI>.to_rvtype(<%TAPI>.get(event_id => event_id));

  offset_count := repeat_no * UTIL.num_val(rv.repeat_interval);

  l_start_dt := CASE rv.repeat
                WHEN EVENTS$TAPI.DAILY THEN start_dt - offset_count
                WHEN EVENTS$TAPI.WEEKLY THEN start_dt - (offset_count * 7)
                WHEN EVENTS$TAPI.MONTHLY THEN ADD_MONTHS(start_dt, -offset_count)
                WHEN EVENTS$TAPI.ANNUALLY THEN ADD_MONTHS(start_dt, -offset_count * 12)
                ELSE start_dt
                END;
  l_end_dt   := CASE rv.repeat
                WHEN EVENTS$TAPI.DAILY THEN end_dt - offset_count
                WHEN EVENTS$TAPI.WEEKLY THEN end_dt - (offset_count * 7)
                WHEN EVENTS$TAPI.MONTHLY THEN ADD_MONTHS(end_dt, -offset_count)
                WHEN EVENTS$TAPI.ANNUALLY THEN ADD_MONTHS(end_dt, -offset_count * 12)
                ELSE end_dt
                END;

  IF rv.repeat_until IS NOT NULL THEN
    days_offset := TRUNC(l_start_dt) - TRUNC(UTIL.datetime_val(rv.start_dt));
    rv.repeat_until := TO_CHAR(UTIL.date_val(rv.repeat_until) + days_offset, UTIL.DATE_FORMAT);
  END IF;

  rv.start_dt := TO_CHAR(l_start_dt, UTIL.DATETIME_FORMAT);
  rv.end_dt   := TO_CHAR(l_end_dt, UTIL.DATETIME_FORMAT);

  r := <%TAPI>.upd(rv);

  logger.log('END', scope, null, params);
EXCEPTION
  WHEN UTIL.application_error THEN
    logger.log_error('Application Error', scope, null, params);
    RAISE;
  WHEN OTHERS THEN
    logger.log_error('Unhandled Exception', scope, null, params);
    RAISE;
END drag_drop;

<%END TEMPLATE>

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

$end
end EVENTS$GEN;
/

SHOW ERRORS