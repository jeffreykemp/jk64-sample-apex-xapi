create or replace force view event_types_vw as
select et.event_type_code
      ,et.name
      ,et.name || case when et.deleted_y = 'Y' then ' (DELETED)' end as description
	    ,et.deleted_y
      ,et.db$created_by
      ,et.db$created_dt
      ,et.db$last_updated_by
      ,et.db$last_updated_dt
from   event_types et;
