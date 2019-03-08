begin deploy.create_table(table_name => 'emps', table_ddl => q'[
create table #NAME#
  (emp_id       integer generated by default on null as identity not null
	,name         varchar2(100 char) not null
	,emp_type     varchar2(20 char) not null default on null 'SALARIED'
	,start_date   date
	,end_date     date
	,foo_tsz      timestamp(6) with time zone
	,bar_ts       timestamp(6)
	,life_history clob
  ,deleted_y    varchar2(1)
  )]');
end;
/

begin deploy.add_constraint(constraint_name => 'emps_pk', constraint_ddl => q'[alter table emps add constraint #NAME# primary key ( emp_id )]'); end;
/
begin deploy.add_constraint(constraint_name => 'emps_name_uk', constraint_ddl => q'[alter table emps add constraint #NAME# unique (name)]'); end;
/
begin deploy.add_constraint(constraint_name => 'emps_type_ck', constraint_ddl => q'[alter table emps add constraint #NAME# check ( emp_type in ('SALARIED','CONTRACTOR')]'); end;
/
begin deploy.add_constraint(constraint_name => 'emps_date_range_ck', constraint_ddl => q'[alter table emps add constraint #NAME# check ( start_date <= end_date )]'); end;
/
begin deploy.add_constraint(constraint_name => 'emps_deleted_ck', constraint_ddl => q'[alter table emps add constraint #NAME# check ( deleted_y = 'Y' )]'); end;
/