create or replace force view event_types_vw as
select et.event_type
      ,et.name
      ,et.name || case when et.deleted_y = 'Y' then ' (DELETED)' end as description
	    ,et.deleted_y
      ,et.created_by
      ,et.created_dt
      ,et.last_updated_by
      ,et.last_updated_dt
from   event_types et;
