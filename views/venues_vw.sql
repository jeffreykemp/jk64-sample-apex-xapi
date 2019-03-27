create or replace force view venues_vw as 
select vn.venue_id
      ,vn.name || case when vn.deleted_y='Y' then ' (DELETED)' end as name
      ,vn.map_position
      ,case when instr(vn.map_position,',') > 0
       then substr(vn.map_position,1,instr(vn.map_position,',')-1)
       end as map_position_lat
      ,case when instr(vn.map_position,',') > 0
       then substr(vn.map_position,instr(vn.map_position,',')+1)
       end as map_position_lng
      ,vn.deleted_y
      ,vn.db$created_by
      ,vn.db$created_dt
      ,vn.db$last_updated_by
      ,vn.db$last_updated_dt
from   venues vn;
