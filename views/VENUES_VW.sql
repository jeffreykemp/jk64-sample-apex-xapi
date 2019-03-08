CREATE OR REPLACE FORCE VIEW VENUES_VW AS 
SELECT vn.venue_id
      ,vn.name
      ,vn.map_position
      ,CASE WHEN INSTR(vn.map_position,',') > 0
       THEN SUBSTR(vn.map_position,1,INSTR(vn.map_position,',')-1)
       END AS map_position_lat
      ,CASE WHEN INSTR(vn.map_position,',') > 0
       THEN SUBSTR(vn.map_position,INSTR(vn.map_position,',')+1)
       END AS map_position_lng
      ,vn.created_by
      ,vn.created_dt
      ,vn.last_updated_by
      ,vn.last_updated_dt
FROM venues vn;