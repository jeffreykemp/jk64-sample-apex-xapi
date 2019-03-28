begin deploy.create_table(table_name => 'user_roles', table_ddl => q'[
create table #name#
  (app_user           varchar2(100 char) not null
  ,security_group_id  number default on null <%SECURITY_GROUP_ID> not null
  ,role_code          varchar2(100 char) not null
  ,last_login_dt      date
  ,deleted_y          varchar2(1)
  )]');
end;
/

begin deploy.add_constraint(constraint_name => 'user_roles_pk', constraint_ddl => q'[alter table user_roles add constraint #name# primary key ( app_user, security_group_id, role_code )]'); end;
/
begin deploy.add_constraint(constraint_name => 'user_roles_deleted_ck', constraint_ddl => q'[alter table user_roles add constraint #name# check ( deleted_y = 'Y' )]'); end;
/

--insert into user_roles (app_user,security_group_id,role_code)values ('JEFF',11111,'ADMIN');

exec gen_tapis.journal_table('user_roles');
exec gen_tapis.journal_trigger('user_roles');