create or replace procedure reset_sample_data as
begin

delete events;
delete venues;
delete hosts;
delete event_types;

insert all
into event_types(event_type_code,name,calendar_css) values('FAMILY','Family','apex-cal-orange')
into event_types(event_type_code,name,calendar_css) values('PUBLIC','Public','apex-cal-bluesky')
into event_types(event_type_code,name,calendar_css) values('WORK','Work','apex-cal-lime')
select null from dual;

insert into hosts(name) values('Mrs Bucket');
insert into hosts(name) values('public holiday');
insert into hosts(name) values('Jeff');
insert into hosts(name) values('Oracle');

insert into venues(name,map_position) values('Dianella','-31.89883777552968,115.87932586669922' );
insert into venues(name,map_position) values('Busselton','-33.6449563963605,115.34730434417725' );
insert into venues(name,map_position) values('Oracle headquarters','-31.95072845508154,115.83491653203964' );

insert into events(host_id,event_type_code,title,description,venue_id,start_dt,end_dt,repeat,repeat_interval,repeat_until)
values((select host_id from hosts where name='Mrs Bucket') ,'FAMILY' ,'Candle-lit supper' ,'<p>some descriptive text</p> ' ,(select venue_id from venues where name='Dianella') ,trunc(sysdate)+19/24,trunc(sysdate)+23/24,'' ,null ,null );
insert into events(host_id,event_type_code,title,description,venue_id,start_dt,end_dt,repeat,repeat_interval,repeat_until)
values((select host_id from hosts where name='public holiday') ,'PUBLIC' ,'New Year''s Day' ,'' ,null ,trunc(sysdate,'Y'),trunc(sysdate,'Y')+0.99999,'ANNUALLY' ,1 ,null );
insert into events(host_id,event_type_code,title,description,venue_id,start_dt,end_dt,repeat,repeat_interval,repeat_until)
values((select host_id from hosts where name='Jeff') ,'FAMILY' ,'Holiday' ,'' ,(select venue_id from venues where name='Busselton') ,trunc(sysdate,'MM')+22+3/24,trunc(sysdate,'MM')+24+23/24 ,'' ,null ,null );
insert into events(host_id,event_type_code,title,description,venue_id,start_dt,end_dt,repeat,repeat_interval,repeat_until)
values((select host_id from hosts where name='Oracle') ,'WORK' ,'All hands meeting' ,'' ,(select venue_id from venues where name='Oracle headquarters') ,trunc(sysdate-7)+10/24,trunc(sysdate-7)+11/24,'WEEKLY' ,2 ,null );

commit;

end reset_sample_data;