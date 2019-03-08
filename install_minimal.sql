PROMPT install_minimal.sql
-- just creates the code generators and utility packages, no sample tables

@packages/DEPLOY.pks
@packages/GEN_EXPORT.pks
@packages/GEN_LOV_VW.pks
@packages/GEN_TAPIS.pks
@packages/GEN_TEMPLATE_PKG.pks
@packages/SECURITY.pks
@packages/TEMPLATES/TEMPLATES_logger.pks
@packages/UTIL_logger.pks

@all_procedures.sql

@package_bodies/DEPLOY_logger.pkb
@package_bodies/GEN_EXPORT.pkb
@package_bodies/GEN_LOV_VW.pkb
@package_bodies/GEN_TAPIS_logger.pkb
@package_bodies/GEN_TEMPLATE_PKG.pkb
@package_bodies/SECURITY_logger.pkb

-- pre-requisite for UTIL package
@tables/ERROR_MESSAGES.sql

@package_bodies/UTIL_logger.pkb

@data/ERROR_MESSAGES.sql

@post_schema.sql

PROMPT Finished.