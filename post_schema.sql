commit;

begin dbms_utility.compile_schema(user,false); end;
/

prompt Check for any invalid objects
select object_type, object_name from user_objects where status = 'INVALID';
