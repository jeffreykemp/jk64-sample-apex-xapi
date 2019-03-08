CREATE OR REPLACE FORCE VIEW event_types_vw AS
SELECT et.event_type
      ,et.name
      ,et.name
	     || CASE
	        WHEN et.start_date > SYSDATE
		        OR et.end_date < TRUNC(SYSDATE)
	        THEN ' (INACTIVE)'
		      END AS description
	    ,CASE
	     WHEN (et.start_date IS NULL OR et.start_date <= SYSDATE)
        AND (et.end_date IS NULL OR et.end_date >= TRUNC(SYSDATE))
	     THEN 'Y'
	     END AS active_ind
      ,et.created_by
      ,et.created_dt
      ,et.last_updated_by
      ,et.last_updated_dt
FROM   event_types et;