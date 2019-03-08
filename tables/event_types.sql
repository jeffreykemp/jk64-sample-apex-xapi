begin deploy.create_table(table_name => 'event_types', table_ddl => q'[
create table #name#
  (event_type   varchar2(100 char) not null
  ,name         varchar2(200 char) not null
  ,calendar_css varchar2(100 char)
  ,start_date   date
  ,end_date     date
  )]');
end;
/

begin deploy.add_constraint(constraint_name => 'event_types_pk', constraint_ddl => q'[alter table event_types add constraint #NAME# primary key ( event_type )]'); end;
/
begin deploy.add_constraint(constraint_name => 'event_type_ck', constraint_ddl => q'[alter table event_types add constraint #NAME# check ( event_type = upper(translate(event_type,'X -:','X___')) )]'); end;
/
begin deploy.add_constraint(constraint_name => 'event_type_name_uk', constraint_ddl => q'[alter table event_types add constraint #NAME# unique ( name )]'); end;
/
begin deploy.add_constraint(constraint_name => 'event_type_date_range_ck', constraint_ddl => q'[alter table event_types add constraint #NAME# check ( start_date <= end_date )]'); end;
/
