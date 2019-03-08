CREATE OR REPLACE PROCEDURE reset_sample_data AS
BEGIN

DELETE events;
DELETE venues;
DELETE hosts;
DELETE event_types;

INSERT ALL
INTO EVENT_TYPES(event_type,name,start_date,end_date,calendar_css) VALUES('FAMILY' ,'Family' ,NULL ,NULL ,'apex-cal-orange')
INTO EVENT_TYPES(event_type,name,start_date,end_date,calendar_css) VALUES('PUBLIC' ,'Public' ,NULL ,NULL ,'apex-cal-bluesky')
INTO EVENT_TYPES(event_type,name,start_date,end_date,calendar_css) VALUES('WORK' ,'Work' ,NULL ,NULL ,'apex-cal-lime')
SELECT NULL FROM DUAL;

INSERT INTO HOSTS(host_id,name) VALUES(host_id_seq.nextval ,'Mrs Bucket' );
INSERT INTO HOSTS(host_id,name) VALUES(host_id_seq.nextval ,'public holiday' );
INSERT INTO HOSTS(host_id,name) VALUES(host_id_seq.nextval ,'Jeff' );
INSERT INTO HOSTS(host_id,name) VALUES(host_id_seq.nextval ,'Oracle' );

INSERT INTO VENUES(venue_id,name,map_position) VALUES(venue_id_seq.nextval ,'Dianella' ,'-31.89883777552968,115.87932586669922' );
INSERT INTO VENUES(venue_id,name,map_position) VALUES(venue_id_seq.nextval ,'Busselton' ,'-33.6449563963605,115.34730434417725' );
INSERT INTO VENUES(venue_id,name,map_position) VALUES(venue_id_seq.nextval ,'Oracle headquarters' ,'-31.95072845508154,115.83491653203964' );

INSERT INTO EVENTS(event_id,host_id,event_type,title,description,venue_id,start_dt,end_dt,repeat,repeat_interval,repeat_until)
VALUES(event_id_seq.nextval ,(select host_id from hosts where name='Mrs Bucket') ,'FAMILY' ,'Candle-lit supper' ,'<p>some descriptive text</p> ' ,(select venue_id from venues where name='Dianella') ,TRUNC(SYSDATE)+19/24,TRUNC(SYSDATE)+23/24,'' ,NULL ,NULL );
INSERT INTO EVENTS(event_id,host_id,event_type,title,description,venue_id,start_dt,end_dt,repeat,repeat_interval,repeat_until)
VALUES(event_id_seq.nextval ,(select host_id from hosts where name='public holiday') ,'PUBLIC' ,'New Year''s Day' ,'' ,NULL ,TO_DATE('2016-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS') ,TO_DATE('2016-01-01 23:59:00','YYYY-MM-DD HH24:MI:SS') ,'ANNUALLY' ,1 ,NULL );
INSERT INTO EVENTS(event_id,host_id,event_type,title,description,venue_id,start_dt,end_dt,repeat,repeat_interval,repeat_until)
VALUES(event_id_seq.nextval ,(select host_id from hosts where name='Jeff') ,'FAMILY' ,'Holiday' ,'' ,(select venue_id from venues where name='Busselton') ,TRUNC(SYSDATE,'MM')+22+3/24,TRUNC(SYSDATE,'MM')+24+23/24 ,'' ,NULL ,NULL );
INSERT INTO EVENTS(event_id,host_id,event_type,title,description,venue_id,start_dt,end_dt,repeat,repeat_interval,repeat_until)
VALUES(event_id_seq.nextval ,(select host_id from hosts where name='Oracle') ,'WORK' ,'All hands meeting' ,'' ,(select venue_id from venues where name='Oracle headquarters') ,TO_DATE('2016-02-02 10:00:00','YYYY-MM-DD HH24:MI:SS') ,TO_DATE('2016-02-02 11:00:00','YYYY-MM-DD HH24:MI:SS') ,'WEEKLY' ,2 ,NULL );

COMMIT;

END reset_sample_data;