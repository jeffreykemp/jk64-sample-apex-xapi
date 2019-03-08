create or replace package security as
/*******************************************************************************
 APEX Security Package
 12-NOV-2014 Jeffrey Kemp
*******************************************************************************/

ctx constant varchar2(30) := 'APP_CTX';

-- Authorizations
administrator  constant varchar2(100) := 'Administrator';  -- "god" mode, can modify user security privileges
admin_readonly constant varchar2(100) := 'Admin Read-only';
operator       constant varchar2(100) := 'Operator';
reporting      constant varchar2(100) := 'Reporting';

-- called from APEX after successful authentication
procedure post_auth;

-- use the context to indicate whether a journal trigger is enabled or not
-- Note: default state is all journal triggers are enabled
-- Default client_id means current session
procedure disable_journal_trigger (trigger_name in varchar2, client_id in varchar2 := null);
procedure enable_journal_trigger (trigger_name in varchar2, client_id in varchar2 := null);

-- returns TRUE if this schema can use the context
function context_installed return boolean;

end security;
