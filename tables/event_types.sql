begin deploy.create_table(table_name => 'event_types', table_ddl => q'[
create table #name#
  (event_type_code varchar2(100 char) not null
  ,name            varchar2(200 char) not null
  ,calendar_css    varchar2(100 char)
  ,deleted_y       varchar2(1)
  )]');
end;
/

begin deploy.add_constraint(constraint_name => 'event_types_pk', constraint_ddl => q'[alter table event_types add constraint #name# primary key ( event_type_code )]'); end;
/
begin deploy.add_constraint(constraint_name => 'event_type_ck', constraint_ddl => q'[alter table event_types add constraint #name# check ( event_type_code = upper(translate(event_type_code,'X -:','X___')) )]'); end;
/
begin deploy.add_constraint(constraint_name => 'event_type_name_uk', constraint_ddl => q'[alter table event_types add constraint #name# unique ( name )]'); end;
/
begin deploy.add_constraint(constraint_name => 'event_type_deleted_ck', constraint_ddl => q'[alter table event_types add constraint #name# check ( deleted_y = 'Y' )]'); end;
/
