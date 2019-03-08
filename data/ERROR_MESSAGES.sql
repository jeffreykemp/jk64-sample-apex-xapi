delete error_messages;

insert all
into error_messages values ('LOST_UPDATE_DEL','Another user/session has deleted this record')
into error_messages values ('EXACT_MATCH_TOO_MANY_ROWS','Exact match not found')
into error_messages values ('EXACT_MATCH_NO_DATA_FOUND','No match found')
into error_messages values ('EVENT_NAME_UK','Cannot name the event the same as another')
into error_messages values ('EVENT_TYPE_NAME_UK','Cannot give an event type the same name as another')
into error_messages values ('EVENT_TYPE_FK','This event type cannot be #OP# as one or more events refer to it')
select null from dual;
