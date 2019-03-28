create or replace package security as
/*******************************************************************************
 APEX Security Package
 12-NOV-2014 Jeffrey Kemp
*******************************************************************************/

ctx constant varchar2(30) := sys_context('userenv','current_schema')||'_CTX';
context_security_group_id constant varchar2(100) := replace(q'[sys_context('#CTX#','security_group_id')]','#CTX#',ctx);

-- Authorizations
administrator  constant varchar2(100) := 'Administrator';  -- "god" mode, can modify user security privileges
admin_readonly constant varchar2(100) := 'Admin Read-only';
operator       constant varchar2(100) := 'Operator';
reporting      constant varchar2(100) := 'Reporting';

-- called from APEX after successful authentication
procedure post_auth;

-- switch to a security group; app_user must have a current role for the given security group
-- if parameter is null, the user's last security group is selected, or the one last provisioned
-- if user doesn't have access an exception is raised
procedure set_security_group (security_group_id in number := null);

function has_role (role_code in varchar2) return boolean;

function has_any_role return boolean;

function vpd_policy
  (object_schema in varchar2
  ,object_name in varchar2
  ) return varchar2;

-- use the context to indicate whether a journal trigger is enabled or not
-- Note: default state is all journal triggers are enabled
-- Default client_id means current session
procedure disable_journal_trigger (trigger_name in varchar2, client_id in varchar2 := null);
procedure enable_journal_trigger (trigger_name in varchar2, client_id in varchar2 := null);

-- returns TRUE if this schema can use the context
function context_installed return boolean;

end security;
/