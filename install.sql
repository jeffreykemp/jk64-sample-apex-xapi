PROMPT install.sql

@packages/deploy.pks
@packages/gen_lov_vw.pks
@packages/gen_tapis.pks
@packages/security.pks
@packages/templates.pks
@packages/util.pks

@all_procedures.sql

@package_bodies/deploy.pkb
@package_bodies/gen_lov_vw.pkb
@package_bodies/gen_tapis.pkb
@package_bodies/security.pkb

-- pre-requisite for util package
@tables/error_messages.sql

@package_bodies/util.pkb

@all_tables.sql
@all_views.sql

@gen_all_apis.sql

@data/error_messages.sql

@post_schema.sql

PROMPT Finished.