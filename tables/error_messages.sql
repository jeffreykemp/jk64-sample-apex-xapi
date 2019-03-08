begin deploy.create_table(table_name => 'error_messages', table_ddl => q'[
create table #NAME#
  (err_code    varchar2(30 char)  not null
  ,err_message varchar2(500 char) not null
  )]', add_audit_cols => false);
end;
/

begin deploy.add_constraint(constraint_name => 'error_messages_pk', constraint_ddl => q'[alter table error_messages add constraint #NAME# primary key ( err_code )]'); end;
/
begin deploy.add_constraint(constraint_name => 'err_code_upper_ck', constraint_ddl => q'[alter table error_messages add constraint #NAME# check ( err_code = upper(err_code) )]'); end;
/
