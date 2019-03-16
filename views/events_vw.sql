create or replace force view events_vw as
select e.event_id
      ,e.event_type
      ,et.name || case when et.deleted_y = 'Y' then ' (DELETED)' end event_type_name
      ,e.host_id
      ,h.name || case when h.deleted_y = 'Y' then ' (DELETED)' end as host_name
      ,e.title || case when e.deleted_y = 'Y' then ' (DELETED)' end as title
      ,e.description
      ,e.venue_id
      ,vn.name || case when vn.deleted_y = 'Y' then ' (DELETED)' end as venue
      ,e.start_dt
      ,e.end_dt
      ,e.duration_days
      ,case
       when coalesce(e.repeat_until, e.end_dt, e.start_dt) >= trunc(sysdate)
       then 'Y'
       end as current_ind -- not past
      ,case when e.repeat is not null then 'Y' end as repeat_ind
      ,e.repeat
      ,initcap(e.repeat) as repeat_desc
      ,e.repeat_interval
      ,e.repeat_until
      ,e.repeat_no
      ,e.this_start_dt
      ,nvl(e.this_end_dt
          ,e.this_start_dt + case when e.this_start_dt = trunc(e.this_start_dt) then 0.99999 else 1/24 end) as this_end_dt
      ,et.calendar_css
      ,e.deleted_y
      ,e.created_by
      ,e.created_dt
      ,e.last_updated_by
      ,e.last_updated_dt
from   (select e.*
              ,nvl(e.end_dt, e.start_dt) - e.start_dt duration_days
              ,case e.repeat
               when 'DAILY'    then e.start_dt + r * e.repeat_interval
               when 'WEEKLY'   then e.start_dt + (r * e.repeat_interval * 7)
               when 'MONTHLY'  then add_months(e.start_dt, r * e.repeat_interval)
               when 'ANNUALLY' then add_months(e.start_dt, r * e.repeat_interval * 12)
               else e.start_dt
               end as this_start_dt
              ,case e.repeat
               when 'DAILY'    then e.end_dt + r * e.repeat_interval
               when 'WEEKLY'   then e.end_dt + (r * e.repeat_interval * 7)
               when 'MONTHLY'  then add_months(e.end_dt, r * e.repeat_interval)
               when 'ANNUALLY' then add_months(e.end_dt, r * e.repeat_interval * 12)
               else e.end_dt
               end as this_end_dt
              ,r as repeat_no
        from   events e
              ,(select rownum-1 r from dual connect by level <= 999)
        where  (e.repeat is null and r = 0)
        or     e.repeat is not null
       ) e
join   event_types et on et.event_type = e.event_type
join   hosts h on h.host_id = e.host_id
left join venues vn on vn.venue_id = e.venue_id
where  (e.repeat_until is null or e.this_start_dt <= e.repeat_until or e.repeat_no = 0);
