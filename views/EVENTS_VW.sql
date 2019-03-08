CREATE OR REPLACE FORCE VIEW events_vw AS
SELECT e.event_id
      ,e.event_type
      ,et.name event_type_name
      ,e.host_id
      ,h.name AS host_name
      ,e.title
      ,e.description
      ,e.venue_id
      ,vn.name AS venue
      ,e.start_dt
      ,e.end_dt
      ,e.duration_days
      ,CASE
       WHEN COALESCE(e.repeat_until, e.end_dt, e.start_dt) >= TRUNC(SYSDATE)
       THEN 'Y'
       END AS current_ind -- not past
      ,CASE WHEN e.repeat IS NOT NULL THEN 'Y' END AS repeat_ind
      ,e.repeat
      ,INITCAP(e.repeat) AS repeat_desc
      ,e.repeat_interval
      ,e.repeat_until
      ,e.repeat_no
      ,e.this_start_dt
      ,NVL(e.this_end_dt
          ,e.this_start_dt + CASE WHEN e.this_start_dt = TRUNC(e.this_start_dt) THEN 0.99999 ELSE 1/24 END) AS this_end_dt
      ,et.calendar_css
      ,e.created_by
      ,e.created_dt
      ,e.last_updated_by
      ,e.last_updated_dt
FROM   (SELECT e.*
              ,NVL(e.end_dt, e.start_dt) - e.start_dt duration_days
              ,CASE e.repeat
               WHEN 'DAILY'    THEN e.start_dt + r * e.repeat_interval
               WHEN 'WEEKLY'   THEN e.start_dt + (r * e.repeat_interval * 7)
               WHEN 'MONTHLY'  THEN ADD_MONTHS(e.start_dt, r * e.repeat_interval)
               WHEN 'ANNUALLY' THEN ADD_MONTHS(e.start_dt, r * e.repeat_interval * 12)
               ELSE e.start_dt
               END AS this_start_dt
              ,CASE e.repeat
               WHEN 'DAILY'    THEN e.end_dt + r * e.repeat_interval
               WHEN 'WEEKLY'   THEN e.end_dt + (r * e.repeat_interval * 7)
               WHEN 'MONTHLY'  THEN ADD_MONTHS(e.end_dt, r * e.repeat_interval)
               WHEN 'ANNUALLY' THEN ADD_MONTHS(e.end_dt, r * e.repeat_interval * 12)
               ELSE e.end_dt
               END AS this_end_dt
              ,r AS repeat_no
        FROM   events e
              ,(SELECT ROWNUM-1 r FROM DUAL CONNECT BY LEVEL <= 999)
        WHERE  (e.repeat IS NULL AND r = 0)
        OR     e.repeat IS NOT NULL
       ) e
JOIN   event_types et
ON     et.event_type = e.event_type
JOIN   hosts h
ON     h.host_id = e.host_id
LEFT JOIN venues vn
ON     vn.venue_id = e.venue_id
WHERE  (e.repeat_until IS NULL OR e.this_start_dt <= e.repeat_until OR e.repeat_no = 0);