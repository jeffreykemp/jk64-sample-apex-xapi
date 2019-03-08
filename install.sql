PROMPT install.sql

@all_types.sql

@packages/CSV_UTIL_PKG.sql
@packages/DEPLOY.pks
@packages/GEN_EXPORT.pks
@packages/GEN_LOV_VW.pks
@packages/GEN_TAPIS.pks
@packages/GEN_TEMPLATE_PKG.pks
@packages/SECURITY.pks
@packages/TEMPLATES.pks
@packages/UTIL.pks

@all_procedures.sql

@package_bodies/CSV_UTIL_PKG.sql
@package_bodies/DEPLOY.pkb
@package_bodies/GEN_EXPORT.pkb
@package_bodies/GEN_LOV_VW.pkb
@package_bodies/GEN_TAPIS_logger.pkb
@package_bodies/GEN_TEMPLATE_PKG.pkb
@package_bodies/SECURITY.pkb

-- pre-requisite for UTIL package
@tables/ERROR_MESSAGES.sql

@package_bodies/UTIL.pkb

@all_sequences.sql
@all_tables.sql
@all_views.sql

@gen_all_apis.sql

@data/ERROR_MESSAGES.sql

@post_schema.sql

PROMPT Finished.