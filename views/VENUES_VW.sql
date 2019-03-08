create or replace force view venues_vw as 
select vn.venue_id
      ,vn.name
      ,vn.map_position
      ,case when instr(vn.map_position,',') > 0
       then substr(vn.map_position,1,instr(vn.map_position,',')-1)
       end as map_position_lat
      ,case when instr(vn.map_position,',') > 0
       then substr(vn.map_position,instr(vn.map_position,',')+1)
       end as map_position_lng
      ,vm.deleted_y
      ,vn.created_by
      ,vn.created_dt
      ,vn.last_updated_by
      ,vn.last_updated_dt
from   venues vn;