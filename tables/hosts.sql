begin deploy.create_table(table_name => 'hosts', table_ddl => q'[
create table #name#
  (host_id   integer generated by default on null as identity not null
  ,name      varchar2(100 char) not null
  ,deleted_y varchar2(1)
  )]');
end;
/

begin deploy.add_constraint(constraint_name => 'hosts_pk', constraint_ddl => q'[alter table hosts add constraint #NAME# primary key ( host_id )]'); end;
/
begin deploy.add_constraint(constraint_name => 'host_name_uk', constraint_ddl => q'[alter table hosts add constraint #NAME# unique ( name )]'); end;
/
begin deploy.add_constraint(constraint_name => 'host_deleted_ck', constraint_ddl => q'[alter table hosts add constraint #NAME# check ( deleted_y = 'Y' )]'); end;
/
