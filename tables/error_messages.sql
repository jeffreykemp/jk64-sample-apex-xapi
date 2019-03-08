BEGIN DEPLOY.create_table(table_name => 'ERROR_MESSAGES', table_ddl => q'[
CREATE TABLE #NAME#
  (err_code    VARCHAR2(30 CHAR)  NOT NULL
  ,err_message VARCHAR2(500 CHAR) NOT NULL
  )
]', add_audit_cols => FALSE);
END;
/

BEGIN DEPLOY.add_constraint(constraint_name => 'ERROR_MESSAGES_PK', constraint_ddl => q'[ALTER TABLE error_messages ADD CONSTRAINT #NAME# PRIMARY KEY ( err_code )]'); END;
/
BEGIN DEPLOY.add_constraint(constraint_name => 'ERR_CODE_UPPER_CK', constraint_ddl => q'[ALTER TABLE error_messages ADD CONSTRAINT #NAME# CHECK ( err_code = UPPER(err_code) )]'); END;
/
