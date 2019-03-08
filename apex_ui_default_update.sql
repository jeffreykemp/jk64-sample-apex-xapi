begin util.setup_apex_session; end;
/

begin generate.ad_columns; commit; end;
/

begin
  APEX_UI_DEFAULT_UPDATE.synch_table(p_table_name => 'EMPS');
  APEX_UI_DEFAULT_UPDATE.upd_table
    (p_table_name          => 'EMPS'
    ,p_form_region_title   => 'Employee Details'
    ,p_report_region_title => 'Employees');
  APEX_UI_DEFAULT_UPDATE.del_column (p_table_name => 'EMPS', p_column_name => 'CREATED_BY');
  APEX_UI_DEFAULT_UPDATE.del_column (p_table_name => 'EMPS', p_column_name => 'CREATED_DT');
  APEX_UI_DEFAULT_UPDATE.del_column (p_table_name => 'EMPS', p_column_name => 'LAST_UPDATED_BY');
  APEX_UI_DEFAULT_UPDATE.del_column (p_table_name => 'EMPS', p_column_name => 'LAST_UPDATED_DT');
  APEX_UI_DEFAULT_UPDATE.del_column (p_table_name => 'EMPS', p_column_name => 'VERSION_ID');
  APEX_UI_DEFAULT_UPDATE.del_column (p_table_name => 'EMPS', p_column_name => 'EMP_ID');
  APEX_UI_DEFAULT_UPDATE.upd_column
    (p_table_name        => 'EMPS'
    ,p_column_name       => 'NAME'
    ,p_label             => 'Name'
    ,p_help_text         => 'Enter the name of the employee.'
    ,p_display_in_form   => 'Y'
    ,p_default_value     => ''
    ,p_required          => 'Y'
    ,p_display_width     => 60
    ,p_max_width         => 400
    ,p_height            => 1
    ,p_display_in_report => 'Y'
    ,p_alignment         => 'L'
    );
  APEX_UI_DEFAULT_UPDATE.upd_column
    (p_table_name        => 'EMPS'
    ,p_column_name       => 'EMP_TYPE'
    ,p_label             => 'Employee Type'
    ,p_help_text         => 'Select the employee type.'
    ,p_display_in_form   => 'Y'
    ,p_default_value     => 'SALARIED'
    ,p_required          => 'Y'
    ,p_display_width     => 60
    ,p_max_width         => 80
    ,p_height            => 1
    ,p_display_in_report => 'Y'
    ,p_alignment         => 'L'
    );
  commit;
end;
/