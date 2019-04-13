prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_180200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2018.05.24'
,p_release=>'18.2.0.00.12'
,p_default_workspace_id=>20749515040658038
,p_default_application_id=>560
,p_default_owner=>'SAMPLE'
);
end;
/
 
prompt APPLICATION 560 - Calendar - a sample TAPI Application
--
-- Application Export:
--   Application:     560
--   Name:            Calendar - a sample TAPI Application
--   Date and Time:   19:27 Saturday April 13, 2019
--   Exported By:     JEFF
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         18.2.0.00.12
--   Instance ID:     250138936273502
--

-- Application Statistics:
--   Pages:                     13
--     Items:                   68
--     Validations:              6
--     Processes:               21
--     Regions:                 27
--     Buttons:                 25
--     Dynamic Actions:         24
--   Shared Components:
--     Logic:
--       Build Options:          1
--     Navigation:
--       Lists:                  2
--       Breadcrumbs:            1
--         Entries:              9
--       NavBar Entries:         1
--     Security:
--       Authentication:         2
--       Authorization:          4
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              13
--         Label:                5
--         List:                11
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:               9
--       LOVs:                   3
--       Shortcuts:              1
--       Plug-ins:               1
--     Globalization:
--     Reports:
--     E-Mail:
--   Supporting Objects:  Excluded

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,560)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'SAMPLE')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Calendar - a sample TAPI Application')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'SAMPLE560')
,p_application_group=>18174696082810591
,p_application_group_name=>'Demo'
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'77C0770B67746E81F5231C5603B6ADA69BCE70738F093B797979D3A7C4750527'
,p_checksum_salt_last_reset=>'20160114162421'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DD-MON-YYYY'
,p_date_time_format=>'DD-MON-YYYY HH:MI:SSPM'
,p_timestamp_format=>'DD-MON-YYYY HH24.MI.SSXFF'
,p_timestamp_tz_format=>'DD-MON-YYYY HH.MI.SSXFF PM TZR'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Sample TAPI application built by Jeffrey Kemp, November 2014. http://jeffkemponoracle.com',
'Converted to Apex 5 Universal Theme, January 2016.'))
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(59324475071024006)
,p_populate_roles=>'A'
,p_application_tab_set=>0
,p_logo_image=>'TEXT:Calendar - a sample TAPI Application'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'release 0.8'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'UTIL.apex_error_handler'
,p_last_updated_by=>'JEFF'
,p_last_upd_yyyymmddhh24miss=>'20190413192609'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_menu
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(37801177119919474)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(59565460020166949)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'Add Event'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9:::'
,p_list_item_icon=>'fa-plus'
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
,p_list_item_current_type=>'NEVER'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(46909586603742100)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar'
,p_security_scheme=>wwv_flow_api.id(62246971721848558)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(37801292236919475)
,p_list_item_display_sequence=>12
,p_list_item_link_text=>'Events Report'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-th-list'
,p_parent_list_item_id=>wwv_flow_api.id(46909586603742100)
,p_security_scheme=>wwv_flow_api.id(62246971721848558)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(61168411948993862)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Event Venues'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-map-marker'
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(68525400545712822)
,p_list_item_display_sequence=>32
,p_list_item_link_text=>'Add Venue'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12:::'
,p_list_item_icon=>'fa-plus'
,p_parent_list_item_id=>wwv_flow_api.id(61168411948993862)
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
,p_list_item_current_type=>'NEVER'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(67680887609731944)
,p_list_item_display_sequence=>34
,p_list_item_link_text=>'Grid Edit'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP,13:::'
,p_list_item_icon=>'fa-table'
,p_parent_list_item_id=>wwv_flow_api.id(61168411948993862)
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(37802424942935278)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Event Hosts'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user'
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(37802181009934168)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Event Types'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gears'
,p_security_scheme=>wwv_flow_api.id(62246532293840626)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3,4,7'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_bar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(68678802447047907)
,p_name=>'Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(68679098350047908)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Feedback'
,p_list_item_link_target=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.:102:P102_APPLICATION_ID,P102_PAGE_ID:&APP_ID.,&APP_PAGE_ID.:'
,p_list_item_icon=>'fa-comment'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(68681725127063768)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_icon=>'fa-user'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(68679490071047908)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Logout'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(68681725127063768)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19798058167439769)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'jk64.dev'
,p_list_item_link_target=>'https://jk64.dev'
,p_list_item_icon=>'fa-external-link'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1798672087445012)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'classic'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1798777654445013)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_RICH_TEXT_EDITOR'
,p_attribute_01=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1798859331445013)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attribute_01=>'LEGACY'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1799186639445013)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IG'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(21907668164073789)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'PLUGIN_COM.JK64.SIMPLE_GOOGLE_MAP'
,p_attribute_01=>'AIzaSyDN1n03b7SUyRZAn0hYFqIG5tHcDoy1RQI'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(37707652837888200)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(37820923167349289)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(59306377021023933)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SELECT_LIST'
);
end;
/
prompt --application/shared_components/security/authorizations/any_role
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(21221328438192087)
,p_name=>'Any role'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return security.has_any_role;'
,p_error_message=>'You do not have any access to this application.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/administrator
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(62246532293840626)
,p_name=>'Administrator'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return security.has_role(''ADMIN'');'
,p_error_message=>'Only Administrators may access this function.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/operator
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(62246739341844416)
,p_name=>'Operator'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return security.has_role(''OPERATOR'');'
,p_error_message=>'Only Operators may access this function.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/reporting
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(62246971721848558)
,p_name=>'Reporting'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return security.has_role(''REPORTING'');'
,p_error_message=>'Only those with Reporting role may access this function.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(59324369366024004)
,p_icon_sequence=>200
,p_icon_subtext=>'Logout'
,p_icon_target=>'&LOGOUT_URL.'
,p_icon_image_alt=>'Logout'
,p_icon_height=>32
,p_icon_width=>32
,p_icon_height2=>24
,p_icon_width2=>24
,p_nav_entry_is_feedback_yn=>'N'
,p_cell_colspan=>1
);
end;
/
prompt --application/shared_components/logic/application_items
begin
null;
end;
/
prompt --application/shared_components/logic/application_computations
begin
null;
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs/calendar_css
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(47865337930471093)
,p_lov_name=>'CALENDAR CSS'
,p_lov_query=>'.'||wwv_flow_api.id(47865337930471093)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47865590275471094)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Black'
,p_lov_return_value=>'apex-cal-black'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47865998843471095)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Blue'
,p_lov_return_value=>'apex-cal-blue'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47866311843471096)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Blue Sky'
,p_lov_return_value=>'apex-cal-bluesky'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47866795558471096)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'Brown'
,p_lov_return_value=>'apex-cal-brown'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47867167796471096)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'Cyan'
,p_lov_return_value=>'apex-cal-cyan'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47867577990471096)
,p_lov_disp_sequence=>60
,p_lov_disp_value=>'Dark Blue'
,p_lov_return_value=>'apex-cal-darkblue'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47867913667471097)
,p_lov_disp_sequence=>70
,p_lov_disp_value=>'Gray'
,p_lov_return_value=>'apex-cal-gray'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47868320139471097)
,p_lov_disp_sequence=>80
,p_lov_disp_value=>'Green'
,p_lov_return_value=>'apex-cal-green'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47868730828471097)
,p_lov_disp_sequence=>90
,p_lov_disp_value=>'Lime'
,p_lov_return_value=>'apex-cal-lime'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47869150855471098)
,p_lov_disp_sequence=>100
,p_lov_disp_value=>'Orange'
,p_lov_return_value=>'apex-cal-orange'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47869505408471098)
,p_lov_disp_sequence=>110
,p_lov_disp_value=>'Red'
,p_lov_return_value=>'apex-cal-red'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47869965311471100)
,p_lov_disp_sequence=>120
,p_lov_disp_value=>'Silver'
,p_lov_return_value=>'apex-cal-silver'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47870311996471100)
,p_lov_disp_sequence=>130
,p_lov_disp_value=>'White'
,p_lov_return_value=>'apex-cal-white'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47870773470471100)
,p_lov_disp_sequence=>140
,p_lov_disp_value=>'Yellow'
,p_lov_return_value=>'apex-cal-yellow'
);
end;
/
prompt --application/shared_components/user_interface/lovs/repeat_type
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(47772161036509997)
,p_lov_name=>'REPEAT_TYPE'
,p_lov_query=>'.'||wwv_flow_api.id(47772161036509997)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47772427531509999)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Daily'
,p_lov_return_value=>'DAILY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47773264461510000)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Weekly'
,p_lov_return_value=>'WEEKLY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47773686699510002)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Monthly'
,p_lov_return_value=>'MONTHLY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47774481324510003)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Annually'
,p_lov_return_value=>'ANNUALLY'
);
end;
/
prompt --application/shared_components/user_interface/lovs/venues
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(60336790540422057)
,p_lov_name=>'VENUES'
,p_lov_query=>'SELECT name, venue_id FROM venues ORDER BY 1'
);
end;
/
prompt --application/pages/page_groups
begin
null;
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(59325576592024018)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(21881232567680031)
,p_parent_id=>wwv_flow_api.id(61172716614993888)
,p_short_name=>'Grid Edit'
,p_link=>'f?p=&APP_ID.:13:&SESSION.'
,p_page_id=>13
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(46908085264725888)
,p_short_name=>'Events Calendar'
,p_link=>'f?p=&APP_ID.:8:&SESSION.'
,p_page_id=>8
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(59327269542024029)
,p_parent_id=>wwv_flow_api.id(46908085264725888)
,p_short_name=>'Events List'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(61172716614993888)
,p_parent_id=>wwv_flow_api.id(46908085264725888)
,p_short_name=>'Venues'
,p_link=>'f?p=&APP_ID.:11:&SESSION.'
,p_page_id=>11
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(61173995557993894)
,p_parent_id=>wwv_flow_api.id(61172716614993888)
,p_short_name=>'Venue'
,p_link=>'f?p=&APP_ID.:12:&SESSION.'
,p_page_id=>12
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(64759372604907622)
,p_parent_id=>wwv_flow_api.id(46908085264725888)
,p_short_name=>'Event Types'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(66954968908165628)
,p_parent_id=>wwv_flow_api.id(46908085264725888)
,p_short_name=>'Hosts'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(99773102291529561)
,p_parent_id=>wwv_flow_api.id(59327269542024029)
,p_short_name=>'Event Edit Log'
,p_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
,p_page_id=>14
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(59330586940024078)
,p_parent_id=>wwv_flow_api.id(46908085264725888)
,p_option_sequence=>20
,p_short_name=>'Event Details'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(37710474548902429)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_internal_name=>'LEFT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-side" id="t_Body_side">',
'      #REGION_POSITION_02#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37710790193902433)
,p_page_template_id=>wwv_flow_api.id(37710474548902429)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37711074550902433)
,p_page_template_id=>wwv_flow_api.id(37710474548902429)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37711300869902433)
,p_page_template_id=>wwv_flow_api.id(37710474548902429)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37711683990902434)
,p_page_template_id=>wwv_flow_api.id(37710474548902429)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37711973744902434)
,p_page_template_id=>wwv_flow_api.id(37710474548902429)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37712233614902434)
,p_page_template_id=>wwv_flow_api.id(37710474548902429)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37712565985902434)
,p_page_template_id=>wwv_flow_api.id(37710474548902429)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37712822465902434)
,p_page_template_id=>wwv_flow_api.id(37710474548902429)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_and_right_side_columns
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(37713083105902435)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_internal_name=>'LEFT_AND_RIGHT_SIDE_COLUMNS'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-side" id="t_Body_side">',
'      #REGION_POSITION_02#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37713329152902435)
,p_page_template_id=>wwv_flow_api.id(37713083105902435)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37713650123902435)
,p_page_template_id=>wwv_flow_api.id(37713083105902435)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37713996059902436)
,p_page_template_id=>wwv_flow_api.id(37713083105902435)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37714258090902436)
,p_page_template_id=>wwv_flow_api.id(37713083105902435)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37714537834902436)
,p_page_template_id=>wwv_flow_api.id(37713083105902435)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37714890084902436)
,p_page_template_id=>wwv_flow_api.id(37713083105902435)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37715123961902436)
,p_page_template_id=>wwv_flow_api.id(37713083105902435)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37715498146902436)
,p_page_template_id=>wwv_flow_api.id(37713083105902435)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37715790142902436)
,p_page_template_id=>wwv_flow_api.id(37713083105902435)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/login
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(37715964884902436)
,p_theme_id=>42
,p_name=>'Login'
,p_internal_name=>'LOGIN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!doctype html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="html-login no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="html-login no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="html-login no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="html-login no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="html-login no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody--login no-anim #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #REGION_POSITION_01#',
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  <div class="t-Body-wrap">',
'    <div class="t-Body-col t-Body-col--main">',
'      <div class="t-Login-container">',
'      #BODY#',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37716238179902437)
,p_page_template_id=>wwv_flow_api.id(37715964884902436)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37716557619902437)
,p_page_template_id=>wwv_flow_api.id(37715964884902436)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/master_detail
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(37716744210902437)
,p_theme_id=>42
,p_name=>'Master Detail'
,p_internal_name=>'MASTER_DETAIL'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--masterDetail t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-info" id="t_Body_info">',
'        #REGION_POSITION_02#',
'      </div>',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37717022984902437)
,p_page_template_id=>wwv_flow_api.id(37716744210902437)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37717364061902438)
,p_page_template_id=>wwv_flow_api.id(37716744210902437)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37717645594902438)
,p_page_template_id=>wwv_flow_api.id(37716744210902437)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37717955874902438)
,p_page_template_id=>wwv_flow_api.id(37716744210902437)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37718279965902438)
,p_page_template_id=>wwv_flow_api.id(37716744210902437)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37718565800902438)
,p_page_template_id=>wwv_flow_api.id(37716744210902437)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37718807176902438)
,p_page_template_id=>wwv_flow_api.id(37716744210902437)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37719116197902438)
,p_page_template_id=>wwv_flow_api.id(37716744210902437)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37719447171902440)
,p_page_template_id=>wwv_flow_api.id(37716744210902437)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/minimal_no_navigation
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(37719686823902441)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_internal_name=>'MINIMAL_NO_NAVIGATION'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES# t-PageBody--noNav" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  <div class="t-Body-main">',
'      <div class="t-Body-title" id="t_Body_title">',
'        #REGION_POSITION_01#',
'      </div>',
'      <div class="t-Body-content" id="t_Body_content">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-contentInner">',
'          #BODY#',
'        </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'      </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37719996102902442)
,p_page_template_id=>wwv_flow_api.id(37719686823902441)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37720242139902442)
,p_page_template_id=>wwv_flow_api.id(37719686823902441)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37720581766902442)
,p_page_template_id=>wwv_flow_api.id(37719686823902441)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37720820214902442)
,p_page_template_id=>wwv_flow_api.id(37719686823902441)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37721146744902443)
,p_page_template_id=>wwv_flow_api.id(37719686823902441)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37721417316902443)
,p_page_template_id=>wwv_flow_api.id(37719686823902441)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37721739979902443)
,p_page_template_id=>wwv_flow_api.id(37719686823902441)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(37721993541902443)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_internal_name=>'MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-wrapper">',
'    <div class="t-Dialog-header">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Dialog-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'    </div>',
'    <div class="t-Dialog-footer">',
'      #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'500'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_css_classes=>'t-Dialog--standard'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2098960803539086924
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37722284154902443)
,p_page_template_id=>wwv_flow_api.id(37721993541902443)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37722500178902444)
,p_page_template_id=>wwv_flow_api.id(37721993541902443)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37722872934902444)
,p_page_template_id=>wwv_flow_api.id(37721993541902443)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/right_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(37723017570902444)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_internal_name=>'RIGHT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37723324768902444)
,p_page_template_id=>wwv_flow_api.id(37723017570902444)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37723652537902444)
,p_page_template_id=>wwv_flow_api.id(37723017570902444)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37723954282902444)
,p_page_template_id=>wwv_flow_api.id(37723017570902444)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37724207111902444)
,p_page_template_id=>wwv_flow_api.id(37723017570902444)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37724555525902445)
,p_page_template_id=>wwv_flow_api.id(37723017570902444)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37724812455902445)
,p_page_template_id=>wwv_flow_api.id(37723017570902444)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37725139330902445)
,p_page_template_id=>wwv_flow_api.id(37723017570902444)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37725414602902445)
,p_page_template_id=>wwv_flow_api.id(37723017570902444)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/standard
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(37725602709902445)
,p_theme_id=>42
,p_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'      <div class="t-Body-title" id="t_Body_title">',
'        #REGION_POSITION_01#',
'      </div>',
'      <div class="t-Body-content" id="t_Body_content">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-contentInner">',
'          #BODY#',
'        </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'      </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37725916591902446)
,p_page_template_id=>wwv_flow_api.id(37725602709902445)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37726213364902446)
,p_page_template_id=>wwv_flow_api.id(37725602709902445)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37726549638902446)
,p_page_template_id=>wwv_flow_api.id(37725602709902445)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37726820378902446)
,p_page_template_id=>wwv_flow_api.id(37725602709902445)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37727143887902446)
,p_page_template_id=>wwv_flow_api.id(37725602709902445)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37727426109902446)
,p_page_template_id=>wwv_flow_api.id(37725602709902445)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37727782381902446)
,p_page_template_id=>wwv_flow_api.id(37725602709902445)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>false
);
end;
/
prompt --application/shared_components/user_interface/templates/page/wizard_modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(37727914031902447)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_internal_name=>'WIZARD_MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Wizard t-Wizard--modal">',
'    <div class=" t-Wizard-steps">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Wizard-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'    </div>',
'    <div class="t-Wizard-footer">',
'      #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'480'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_css_classes=>'t-Dialog--wizard'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37728277666902447)
,p_page_template_id=>wwv_flow_api.id(37727914031902447)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37728539710902447)
,p_page_template_id=>wwv_flow_api.id(37727914031902447)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(37728813796902447)
,p_page_template_id=>wwv_flow_api.id(37727914031902447)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/button/icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(37791089566902497)
,p_template_name=>'Icon'
,p_internal_name=>'ICON'
,p_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"><'
||'/span></button>'
,p_hot_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_reference_id=>2347660919680321258
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(37791188892902498)
,p_template_name=>'Text'
,p_internal_name=>'TEXT'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text_with_icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(37791266665902498)
,p_template_name=>'Text with Icon'
,p_internal_name=>'TEXT_WITH_ICON'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>2081382742158699622
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconRight'
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/region/alert
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(37729097191902448)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #BODY#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_internal_name=>'ALERT'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2039236646100190748
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37729348842902449)
,p_plug_template_id=>wwv_flow_api.id(37729097191902448)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(37732121620902452)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/buttons_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(37732339428902452)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ButtonRegion t-Form--floatLeft #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-ButtonRegion-wrap">',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--content">',
'      <h2 class="t-ButtonRegion-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      #BODY#',
'      <div class="t-ButtonRegion-buttons">#CHANGE#</div>',
'    </div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Buttons Container'
,p_internal_name=>'BUTTONS_CONTAINER'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2124982336649579661
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37732682457902452)
,p_plug_template_id=>wwv_flow_api.id(37732339428902452)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37732936765902452)
,p_plug_template_id=>wwv_flow_api.id(37732339428902452)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/carousel_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(37734319759902454)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'   <div class="t-Region-carouselRegions">',
'     #SUB_REGIONS#',
'   </div>',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_internal_name=>'CAROUSEL_CONTAINER'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2865840475322558786
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37734627971902454)
,p_plug_template_id=>wwv_flow_api.id(37734319759902454)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37734951039902454)
,p_plug_template_id=>wwv_flow_api.id(37734319759902454)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/collapsible
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(37741369186902460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems  t-Region-headerItems--controls">',
'    <button class="t-Button t-Button--icon t-Button--hideShow" type="button"></button>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_internal_name=>'COLLAPSIBLE'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2662888092628347716
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37741689528902460)
,p_plug_template_id=>wwv_flow_api.id(37741369186902460)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37741904485902461)
,p_plug_template_id=>wwv_flow_api.id(37741369186902460)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/hero
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(37745726503902464)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-wrap">',
'    <div class="t-HeroRegion-col t-HeroRegion-col--left"><span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'      <h2 class="t-HeroRegion-title">#TITLE#</h2>',
'      #BODY#',
'    </div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form">#SUB_REGIONS#</div><div class="t-HeroRegion-buttons">#NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Hero'
,p_internal_name=>'HERO'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37746057769902464)
,p_plug_template_id=>wwv_flow_api.id(37745726503902464)
,p_name=>'Region Body'
,p_placeholder=>'#BODY#'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_dialog
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(37746295636902465)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-body js-regionDialog-body">',
'#BODY#',
'  </div>',
'  <div class="t-DialogRegion-buttons js-regionDialog-buttons">',
'     <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'       <div class="t-ButtonRegion-wrap">',
'         <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'         <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'       </div>',
'     </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Dialog'
,p_internal_name=>'INLINE_DIALOG'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal:js-draggable:js-resizable'
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2671226943886536762
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37746524682902465)
,p_plug_template_id=>wwv_flow_api.id(37746295636902465)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/interactive_report
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(37748115288902466)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#" role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Interactive Report'
,p_internal_name=>'INTERACTIVE_REPORT'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/login
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(37748740925902466)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-Login-header">',
'    <span class="t-Login-logo #ICON_CSS_CLASSES#"></span>',
'    <h1 class="t-Login-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'  </div>',
'  <div class="t-Login-body">',
'    #BODY#',
'  </div>',
'  <div class="t-Login-buttons">',
'    #NEXT#',
'  </div>',
'  <div class="t-Login-links">',
'    #EDIT##CREATE#',
'  </div>',
'  #SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'Login'
,p_internal_name=>'LOGIN'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37749094197902466)
,p_plug_template_id=>wwv_flow_api.id(37748740925902466)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/standard
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(37749289366902466)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4070912133526059312
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37749556599902467)
,p_plug_template_id=>wwv_flow_api.id(37749289366902466)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37749878222902467)
,p_plug_template_id=>wwv_flow_api.id(37749289366902466)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/tabs_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(37753699237902469)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Tabs Container'
,p_internal_name=>'TABS_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37753914076902469)
,p_plug_template_id=>wwv_flow_api.id(37753699237902469)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37754216762902469)
,p_plug_template_id=>wwv_flow_api.id(37753699237902469)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/title_bar
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(37756253337902470)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#"> ',
'  <div class="t-BreadcrumbRegion-body">',
'    <div class="t-BreadcrumbRegion-breadcrumb">',
'      #BODY#',
'    </div>',
'    <div class="t-BreadcrumbRegion-title">',
'      <h1 class="t-BreadcrumbRegion-titleText">#TITLE#</h1>',
'    </div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'</div>'))
,p_page_plug_template_name=>'Title Bar'
,p_internal_name=>'TITLE_BAR'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2530016523834132090
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/wizard_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(37757299588902471)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Wizard-header">',
'    <h1 class="t-Wizard-title">#TITLE#</h1>',
'    <div class="u-Table t-Wizard-controls">',
'      <div class="u-Table-fit t-Wizard-buttons">#PREVIOUS##CLOSE#</div>',
'      <div class="u-Table-fill t-Wizard-steps">',
'        #BODY#',
'      </div>',
'      <div class="u-Table-fit t-Wizard-buttons">#NEXT#</div>',
'    </div>',
'  </div>',
'  <div class="t-Wizard-body">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Container'
,p_internal_name=>'WIZARD_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(37757502837902472)
,p_plug_template_id=>wwv_flow_api.id(37757299588902471)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/list/badge_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(37774128276902485)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value"><a href="#LINK#" #A03#>#A01#</a></span>',
'</li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value"><a href="#LINK#" #A03#>#A01#</a></span>',
'</li>',
''))
,p_list_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_theme_id=>42
,p_theme_class_id=>3
,p_default_template_options=>'t-BadgeList--responsive'
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed'
,p_list_template_before_rows=>'<ul class="t-BadgeList t-BadgeList--circular #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_reference_id=>2062482847268086664
,p_list_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/cards
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(37777536670902488)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Cards--3cols:t-Cards--featured'
,p_list_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Secondary Information'
,p_a03_label=>'Initials'
,p_a04_label=>'List Item CSS Classes'
,p_reference_id=>2885322685880632508
);
end;
/
prompt --application/shared_components/user_interface/templates/list/links_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(37781719146902490)
,p_list_template_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_name=>'Links List'
,p_internal_name=>'LINKS_LIST'
,p_theme_id=>42
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul class="t-LinksList-list">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_sub_list_item_noncurrent=>'<li class="t-LinksList-item#A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#<'
||'/span></a></li>'
,p_item_templ_curr_w_child=>'<li class="t-LinksList-item is-current is-expanded #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t'
||'-LinksList-badge">#A01#</span></a>#SUB_LISTS#</li>'
,p_item_templ_noncurr_w_child=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'Link Attributes'
,p_a03_label=>'List Item CSS Classes'
,p_reference_id=>4070914341144059318
);
end;
/
prompt --application/shared_components/user_interface/templates/list/media_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(37783399117902491)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item  #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-MediaList--showDesc:t-MediaList--showIcons'
,p_list_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'List Item CSS Classes'
,p_reference_id=>2066548068783481421
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(37785130772902492)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_internal_name=>'MENU_BAR'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  iconType: ''fa'',',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-showSubMenuIcons'
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_reference_id=>2008709236185638887
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_popup
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(37786197244902493)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_internal_name=>'MENU_POPUP'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({ slide: e.hasClass("js-slide")});',
''))
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Data ID'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut'
,p_reference_id=>3492264004432431646
);
end;
/
prompt --application/shared_components/user_interface/templates/list/navigation_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(37786319853902493)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" role="button">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" role="button">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_internal_name=>'NAVIGATION_BAR'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_sub_templ_curr_w_child=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_reference_id=>2846096252961119197
);
end;
/
prompt --application/shared_components/user_interface/templates/list/side_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(37786512675902493)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Side Navigation Menu'
,p_internal_name=>'SIDE_NAVIGATION_MENU'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''body'').addClass(''t-PageBody--leftNav'');',
''))
,p_theme_id=>42
,p_theme_class_id=>19
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&APP_TITLE!ATTR.">',
'<div class="t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&APP_TITLE!ATTR."><ul style="display:none">'))
,p_list_template_after_rows=>'</ul></div></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True/False'
,p_a04_label=>'Title'
,p_reference_id=>2466292414354694776
);
end;
/
prompt --application/shared_components/user_interface/templates/list/tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(37786793689902494)
,p_list_template_current=>'<li class="t-Tabs-item is-active"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-Tabs-item"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_name=>'Tabs'
,p_internal_name=>'TABS'
,p_theme_id=>42
,p_theme_class_id=>7
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>3288206686691809997
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(37788544305902495)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_internal_name=>'TOP_NAVIGATION_MENU'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-tabLike'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True / False'
,p_a03_label=>'Hide'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut Key'
,p_reference_id=>2525307901300239072
);
end;
/
prompt --application/shared_components/user_interface/templates/list/wizard_progress
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(37789513586902495)
,p_list_template_current=>'<li class="t-WizardSteps-step is-active" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></div></li>'
,p_list_template_noncurrent=>'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"><span class="t-Icon a-Icon icon-check"></span></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"'
||'></span></span></div></li>'
,p_list_template_name=>'Wizard Progress'
,p_internal_name=>'WIZARD_PROGRESS'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2 class="u-VisuallyHidden">#CURRENT_PROGRESS#</h2>',
'<ul class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'))
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
end;
/
prompt --application/shared_components/user_interface/templates/report/alerts
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(37758587696902472)
,p_row_template_name=>'Alerts'
,p_internal_name=>'ALERTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--horizontal t-Alert--colorBG t-Alert--defaultIcons t-Alert--#ALERT_TYPE#" role="alert">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title">#ALERT_TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #ALERT_DESC#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      #ALERT_ACTION#',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="t-Alerts">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/badge_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(37758756588902474)
,p_row_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
'  <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList t-BadgeList--circular #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BadgeList--responsive'
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed'
,p_reference_id=>2103197159775914759
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/cards
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(37762113127902476)
,p_row_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <a href="#CARD_LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--3cols:t-Cards--featured'
,p_reference_id=>2973535649510699732
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/comments
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(37766323741902478)
,p_row_template_name=>'Comments'
,p_internal_name=>'COMMENTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Comments-item #COMMENT_MODIFIERS#">',
'    <div class="t-Comments-icon a-MediaBlock-graphic">',
'        <div class="t-Comments-userIcon #ICON_MODIFIER#" aria-hidden="true">#USER_ICON#</div>',
'    </div>',
'    <div class="t-Comments-body a-MediaBlock-content">',
'        <div class="t-Comments-info">',
'            #USER_NAME# &middot; <span class="t-Comments-date">#COMMENT_DATE#</span> <span class="t-Comments-actions">#ACTIONS#</span>',
'        </div>',
'        <div class="t-Comments-comment">',
'            #COMMENT_TEXT##ATTRIBUTE_1##ATTRIBUTE_2##ATTRIBUTE_3##ATTRIBUTE_4#',
'        </div>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Comments #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Comments--chat'
,p_reference_id=>2611722012730764232
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/search_results
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(37767143173902479)
,p_row_template_name=>'Search Results'
,p_internal_name=>'SEARCH_RESULTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition3=>':LABEL_04 is null'
,p_row_template4=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'      <span class="t-SearchResults-misc">#LABEL_04#: #VALUE_04#</span>',
'    </div>',
'  </li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070913431524059316
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/standard
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(37767321981902479)
,p_row_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES#>',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" summary="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_reference_id=>2537207537838287671
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(37767321981902479)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/timeline
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(37769949532902482)
,p_row_template_name=>'Timeline'
,p_internal_name=>'TIMELINE'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <div class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':EVENT_LINK is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <a href="#EVENT_LINK#" class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline">',
''))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_reference_id=>1513373588340069864
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_column
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(37770341234902482)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_COLUMN'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES#>'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068636272681754
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_row
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(37772350147902483)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068321678681753
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/hidden
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(37790585158902496)
,p_template_name=>'Hidden'
,p_internal_name=>'HIDDEN'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--hiddenLabel rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>13
,p_reference_id=>2039339104148359505
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(37790697573902496)
,p_template_name=>'Optional'
,p_internal_name=>'OPTIONAL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>',
''))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>2317154212072806530
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(37790737992902497)
,p_template_name=>'Optional - Above'
,p_internal_name=>'OPTIONAL_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer">'
,p_after_element=>'#ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>3030114864004968404
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(37790866266902497)
,p_template_name=>'Required'
,p_internal_name=>'REQUIRED'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label><span class="t-Form-required"><span class="a-Icon icon-asterisk"></span></span>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>2525313812251712801
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(37790920892902497)
,p_template_name=>'Required - Above'
,p_internal_name=>'REQUIRED_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label><span class="t-Form-required"><span class="a-Icon icon-asterisk"></span></span> #HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer">'
,p_after_element=>'#ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>3030115129444970113
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(37791908169902498)
,p_name=>'Breadcrumb'
,p_internal_name=>'BREADCRUMB'
,p_before_first=>'<ul class="t-Breadcrumb #COMPONENT_CSS_CLASSES#">'
,p_current_page_option=>'<li class="t-Breadcrumb-item is-active"><span class="t-Breadcrumb-label">#NAME#</span></li>'
,p_non_current_page_option=>'<li class="t-Breadcrumb-item"><a href="#LINK#" class="t-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916542570059325
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(37792148769902500)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#FAVICONS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="t-Page t-Page--popupLOV"'
,p_before_field_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="t-Form-field t-Form-searchField"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="t-Button t-Button--hot t-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="t-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
,p_prev_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'380'
,p_result_row_x_of_y=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>100
,p_before_result_set=>'<div class="t-PopupLOV-links">'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>2885398517835871876
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(37792000023902499)
,p_cal_template_name=>'Calendar'
,p_internal_name=>'CALENDAR'
,p_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>',
''))
,p_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_weekly_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="t-ClassicCalendar-dayColumn">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_daily_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="uCal">',
'<h1 class="uMonth">#IMONTH# <span>#YYYY#</span></h1>'))
,p_cust_day_of_week_format=>'<th scope="col" class="uCalDayCol" id="#DY#">#IDAY#</th>'
,p_cust_month_open_format=>'<table class="uCal" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'<div class="uCalFooter"></div>',
'</div>',
''))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_day_open_format=>'<td class="uDay" headers="#DY#"><div class="uDayData">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td class="uDay today" headers="#DY#">'
,p_cust_nonday_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_nonday_open_format=>'<td class="uDay nonday" headers="#DY#">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<span class="uDayTitle weekendday">#DD#</span>'
,p_cust_weekend_open_format=>'<td class="uDay" headers="#DY#">'
,p_cust_weekend_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="uDayData">#DATA#</span>',
'</td>'))
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="uCalHour" id="#TIME#">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="uCal uCalWeekly">',
'<h1 class="uMonth">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="uCalDayCol" id="#DY#">',
'  <span class="visible-desktop">#DD# #IDAY#</span>',
'  <span class="hidden-desktop">#DD# <em>#IDY#</em></span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="uCal">'
,p_cust_wk_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'<div class="uCalFooter"></div>',
'</div>'))
,p_cust_wk_week_open_format=>'<tr>'
,p_cust_wk_week_close_format=>'</tr> '
,p_cust_wk_day_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_wk_day_open_format=>'<td class="uDay" headers="#DY#"><div class="uDayData">'
,p_cust_wk_day_close_format=>'</div></td>'
,p_cust_wk_today_open_format=>'<td class="uDay today" headers="#DY#"><div class="uDayData">'
,p_cust_wk_weekend_open_format=>'<td class="uDay weekend" headers="#DY#"><div class="uDayData">'
,p_cust_wk_weekend_close_format=>'</div></td>'
,p_agenda_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-future">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'<span class="t-ClassicCalendar-event">#DATA#</span>'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916747979059326
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(37792907982902506)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(37725602709902445)
,p_default_dialog_template=>wwv_flow_api.id(37721993541902443)
,p_error_template=>wwv_flow_api.id(37715964884902436)
,p_printer_friendly_template=>wwv_flow_api.id(37725602709902445)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(37715964884902436)
,p_default_button_template=>wwv_flow_api.id(37791188892902498)
,p_default_region_template=>wwv_flow_api.id(37749289366902466)
,p_default_chart_template=>wwv_flow_api.id(37749289366902466)
,p_default_form_template=>wwv_flow_api.id(37749289366902466)
,p_default_reportr_template=>wwv_flow_api.id(37749289366902466)
,p_default_tabform_template=>wwv_flow_api.id(37749289366902466)
,p_default_wizard_template=>wwv_flow_api.id(37749289366902466)
,p_default_menur_template=>wwv_flow_api.id(37756253337902470)
,p_default_listr_template=>wwv_flow_api.id(37749289366902466)
,p_default_irr_template=>wwv_flow_api.id(37748115288902466)
,p_default_report_template=>wwv_flow_api.id(37767321981902479)
,p_default_label_template=>wwv_flow_api.id(37790697573902496)
,p_default_menu_template=>wwv_flow_api.id(37791908169902498)
,p_default_calendar_template=>wwv_flow_api.id(37792000023902499)
,p_default_list_template=>wwv_flow_api.id(37781719146902490)
,p_default_nav_list_template=>wwv_flow_api.id(37788544305902495)
,p_default_top_nav_list_temp=>wwv_flow_api.id(37788544305902495)
,p_default_side_nav_list_temp=>wwv_flow_api.id(37786512675902493)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(37732339428902452)
,p_default_dialogr_template=>wwv_flow_api.id(37732121620902452)
,p_default_option_label=>wwv_flow_api.id(37790697573902496)
,p_default_required_label=>wwv_flow_api.id(37790866266902497)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(37786319853902493)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.0/')
,p_files_version=>86
,p_icon_library=>'FONTAWESOME'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#tooltipManager#MIN#.js?v=#APEX_VERSION#',
'#HAMMERJS_URL#',
'#THEME_IMAGES#js/modernizr-custom#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.0/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(37792391715902502)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(37792530096902502)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>true
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(37792747301902502)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_config=>'{"customCSS":"","vars":{"@g_Accent-BG":"#505f6d","@g_Accent-OG":"#ececec","@g_Body-Title-BG":"#dee1e4","@l_Link-Base":"#337ac0","@g_Body-BG":"#f5f5f5"}}'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A200A202A206A6B36340A202A20202020284F7261636C65204170706C69636174696F6E2045787072657373205468656D65205374796C65290A202A200A202A2054686973204353532066696C65207761732067656E657261746564207573696E6720';
wwv_flow_api.g_varchar2_table(2) := '746865204F7261636C65204170706C69636174696F6E204578707265737320352E30205468656D6520526F6C6C65722E200A202A200A202A2F0A0A2E742D4156504C6973742D76616C7565207B0A2020636F6C6F723A20233636363636363B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(3) := '2D426F64792D696E666F202E742D4156504C6973742D76616C7565207B0A2020636F6C6F723A20233236323632363B0A7D0A2E742D526567696F6E202E742D4156504C6973742D76616C7565207B0A2020636F6C6F723A20233236323632363B0A7D0A2E';
wwv_flow_api.g_varchar2_table(4) := '742D4156504C6973742D6C6162656C207B0A2020636F6C6F723A20233464346434643B0A7D0A2E742D426F64792D696E666F202E742D4156504C6973742D6C6162656C207B0A2020636F6C6F723A20233064306430643B0A7D0A2E742D526567696F6E20';
wwv_flow_api.g_varchar2_table(5) := '2E742D4156504C6973742D6C6162656C207B0A2020636F6C6F723A20233064306430643B0A7D0A0A2E742D416C6572742D2D77697A617264207B0A2020626F726465722D7261646975733A203070783B0A7D0A2E742D416C6572742D2D636F6C6F724247';
wwv_flow_api.g_varchar2_table(6) := '2E742D416C6572742D2D7761726E696E672C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D79656C6C6F77207B0A20206261636B67726F756E642D636F6C6F723A20236666666165353B0A7D0A2E742D416C6572742D2D636F6C6F';
wwv_flow_api.g_varchar2_table(7) := '7242472E742D416C6572742D2D7761726E696E672068322C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D79656C6C6F772068322C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D7761726E696E67206833';
wwv_flow_api.g_varchar2_table(8) := '2C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D79656C6C6F77206833207B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D7761726E696E67202E742D41';
wwv_flow_api.g_varchar2_table(9) := '6C6572742D626F64792C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D79656C6C6F77202E742D416C6572742D626F6479207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D416C6572742D2D636F6C6F7242472E74';
wwv_flow_api.g_varchar2_table(10) := '2D416C6572742D2D73756363657373207B0A20206261636B67726F756E642D636F6C6F723A20236563666265653B0A7D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D737563636573732068322C0A2E742D416C6572742D2D636F';
wwv_flow_api.g_varchar2_table(11) := '6C6F7242472E742D416C6572742D2D73756363657373206833207B0A2020636F6C6F723A20233334333433343B0A7D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D73756363657373202E742D416C6572742D626F6479207B0A20';
wwv_flow_api.g_varchar2_table(12) := '20636F6C6F723A20233734373437343B0A7D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D64616E6765722C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D726564207B0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(13) := '636F6C6F723A20236666656165393B0A7D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D64616E6765722068322C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D7265642068322C0A2E742D416C6572742D';
wwv_flow_api.g_varchar2_table(14) := '2D636F6C6F7242472E742D416C6572742D2D64616E6765722068332C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D726564206833207B0A2020636F6C6F723A20233335333533353B0A7D0A2E742D416C6572742D2D636F6C6F72';
wwv_flow_api.g_varchar2_table(15) := '42472E742D416C6572742D2D64616E676572202E742D416C6572742D626F64792C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D726564202E742D416C6572742D626F6479207B0A2020636F6C6F723A20233734373437343B0A7D';
wwv_flow_api.g_varchar2_table(16) := '0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D696E666F207B0A20206261636B67726F756E642D636F6C6F723A20236433653566373B0A7D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D696E666F206832';
wwv_flow_api.g_varchar2_table(17) := '2C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D696E666F206833207B0A2020636F6C6F723A20233236323632363B0A7D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D696E666F202E742D416C6572742D';
wwv_flow_api.g_varchar2_table(18) := '626F6479207B0A2020636F6C6F723A20233636363636363B0A7D0A0A2E742D416C6572742D2D7761726E696E67202E742D416C6572742D69636F6E2C0A2E742D416C6572742D2D79656C6C6F77202E742D416C6572742D69636F6E207B0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(19) := '723A20236666636330303B0A7D0A0A2E742D416C6572742D2D73756363657373202E742D416C6572742D69636F6E207B0A2020636F6C6F723A20233463643936343B0A7D0A0A2E742D416C6572742D2D696E666F202E742D416C6572742D69636F6E207B';
wwv_flow_api.g_varchar2_table(20) := '0A2020636F6C6F723A20233235373863663B0A7D0A0A2E742D416C6572742D2D64616E676572202E742D416C6572742D69636F6E2C0A2E742D416C6572742D2D726564202E742D416C6572742D69636F6E207B0A2020636F6C6F723A2023653930633030';
wwv_flow_api.g_varchar2_table(21) := '3B0A7D0A2E742D416C6572742D2D77697A617264202E742D416C6572742D696E736574207B0A2020626F726465722D7261646975733A203270783B0A7D0A2E742D416C6572742D2D686F72697A6F6E74616C2C0A2E742D416C6572742D2D77697A617264';
wwv_flow_api.g_varchar2_table(22) := '207B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D426F64792D616C657274202E742D416C6572742D2D7061';
wwv_flow_api.g_varchar2_table(23) := '6765207B0A2020626F782D736861646F773A2030202D3170782030207267626128302C20302C20302C20302E312920696E7365743B0A7D0A2E742D416C6572742D2D706167652E742D416C6572742D2D73756363657373207B0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(24) := '6E642D636F6C6F723A20726762612837342C203137302C2034342C20302E39293B0A7D0A2E742D416C6572742D2D706167652E742D416C6572742D2D73756363657373202E742D49636F6E2C0A2E742D416C6572742D2D706167652E742D416C6572742D';
wwv_flow_api.g_varchar2_table(25) := '2D73756363657373202E742D416C6572742D7469746C65207B0A2020636F6C6F723A20234646463B0A7D0A2E742D416C6572742D2D70616765202E742D427574746F6E2D2D636C6F7365416C657274207B0A2020636F6C6F723A207267626128302C2030';
wwv_flow_api.g_varchar2_table(26) := '2C20302C20302E35293B0A7D0A0A2E742D42616467654C6973742D2D6461736820612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202365366536653620696E7365743B0A';
wwv_flow_api.g_varchar2_table(27) := '7D0A2E742D42616467654C6973742061207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D6974656D3A686F766572202E742D42616467654C6973742D76';
wwv_flow_api.g_varchar2_table(28) := '616C7565207B0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0A7D0A2E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D76616C7565207B0A2020636F6C6F723A20233733373337333B0A';
wwv_flow_api.g_varchar2_table(29) := '2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E312920696E7365743B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D42616467654C6973742D2D6369726375';
wwv_flow_api.g_varchar2_table(30) := '6C6172202E742D42616467654C6973742D76616C75652061207B0A2020626F782D736861646F773A203020302030203170782072676261283131362C203135322C203138352C20302E39332920696E7365743B0A2020636F6C6F723A2023303031616466';
wwv_flow_api.g_varchar2_table(31) := '3B0A7D0A2E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D76616C756520613A686F766572207B0A2020626F782D736861646F773A203020302030203470782072676261283131362C203135322C203138352C20';
wwv_flow_api.g_varchar2_table(32) := '302E39332920696E7365743B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(33) := '2D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D76616C756520613A666F637573207B0A2020626F782D736861646F773A203020302030203270782072676261283131362C203135322C203138352C20302E3138292C';
wwv_flow_api.g_varchar2_table(34) := '203020302030203170782072676261283131362C203135322C203138352C20302E39332920696E7365743B0A7D0A2E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D6C6162656C207B0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(35) := '3733373337333B0A7D0A2E742D42616467654C6973742D2D63697263756C617220612E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A2072676261283131362C2031';
wwv_flow_api.g_varchar2_table(36) := '35322C203138352C20302E3933293B0A20207472616E736974696F6E3A20626F782D736861646F7720302E31732C20636F6C6F7220302E31732C206261636B67726F756E642D636F6C6F7220302E33733B0A7D0A2E742D42616467654C6973742D2D6369';
wwv_flow_api.g_varchar2_table(37) := '7263756C617220612E742D42616467654C6973742D777261703A686F766572202E742D42616467654C6973742D76616C7565207B0A2020626F782D736861646F773A203020302030203470782072676261283131362C203135322C203138352C20302E39';
wwv_flow_api.g_varchar2_table(38) := '332920696E7365743B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020636F6C6F723A20234646463B0A7D0A2E742D42616467654C6973742D2D63697263756C61722E742D42';
wwv_flow_api.g_varchar2_table(39) := '616467654C6973742D2D636F6C6F726564424720612E742D42616467654C6973742D777261703A686F766572202E742D42616467654C6973742D76616C7565207B0A2020626F782D736861646F773A20302030203020387078207267626128302C20302C';
wwv_flow_api.g_varchar2_table(40) := '20302C20302E312920696E7365743B0A7D0A0A2E742D42616467654C6973742D2D666C6F6174202E742D42616467654C6973742D6974656D3A61667465722C0A2E742D42616467654C6973742D2D666C6578202E742D42616467654C6973742D6974656D';
wwv_flow_api.g_varchar2_table(41) := '3A61667465722C0A2E742D42616467654C6973742D2D636F6C73202E742D42616467654C6973742D6974656D3A61667465722C0A2E742D42616467654C6973742D2D6669786564202E742D42616467654C6973742D6974656D3A61667465722C0A2E742D';
wwv_flow_api.g_varchar2_table(42) := '42616467654C6973742D2D737461636B6564202E742D42616467654C6973742D6974656D3A6166746572207B0A20206261636B67726F756E643A20236536653665363B0A7D0A2E742D42616467654C6973742D2D666C6F6174202E742D42616467654C69';
wwv_flow_api.g_varchar2_table(43) := '73742D6974656D3A6265666F72652C0A2E742D42616467654C6973742D2D666C6578202E742D42616467654C6973742D6974656D3A6265666F72652C0A2E742D42616467654C6973742D2D636F6C73202E742D42616467654C6973742D6974656D3A6265';
wwv_flow_api.g_varchar2_table(44) := '666F72652C0A2E742D42616467654C6973742D2D6669786564202E742D42616467654C6973742D6974656D3A6265666F72652C0A2E742D42616467654C6973742D2D737461636B6564202E742D42616467654C6973742D6974656D3A6265666F7265207B';
wwv_flow_api.g_varchar2_table(45) := '0A20206261636B67726F756E643A20236536653665363B0A7D0A2E742D42616467654C6973742D2D626F74746F6D426F72646572207B0A2020626F726465722D626F74746F6D2D636F6C6F723A20236666666666663B0A7D0A0A2E612D42617243686172';
wwv_flow_api.g_varchar2_table(46) := '74202E612D42617243686172742D6974656D3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A7D0A2E742D426F6479202E612D4261724368617274202E612D42617243686172742D6974656D202E612D4261';
wwv_flow_api.g_varchar2_table(47) := '7243686172742D76616C7565207B0A2020636F6C6F723A20233830383038303B0A7D0A2E742D426F64792D7469746C65202E612D4261724368617274202E612D42617243686172742D6974656D202E612D42617243686172742D76616C7565207B0A2020';
wwv_flow_api.g_varchar2_table(48) := '636F6C6F723A20233365336533653B0A7D0A2E742D426F64792D696E666F202E612D4261724368617274202E612D42617243686172742D6974656D202E612D42617243686172742D76616C7565207B0A2020636F6C6F723A20233365336533653B0A7D0A';
wwv_flow_api.g_varchar2_table(49) := '2E742D526567696F6E202E612D4261724368617274202E612D42617243686172742D6974656D202E612D42617243686172742D76616C75652C0A2E742D427574746F6E526567696F6E202E612D4261724368617274202E612D42617243686172742D6974';
wwv_flow_api.g_varchar2_table(50) := '656D202E612D42617243686172742D76616C7565207B0A2020636F6C6F723A20233830383038303B0A7D0A2E612D4261724368617274202E612D42617243686172742D6974656D20696D67207B0A2020626F726465722D7261646975733A203270783B0A';
wwv_flow_api.g_varchar2_table(51) := '7D0A2E612D4261724368617274202E612D42617243686172742D626172207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E303235293B0A7D0A2E612D42617243686172742D2D636C6173736963202E612D';
wwv_flow_api.g_varchar2_table(52) := '42617243686172742D6261722C0A2E612D42617243686172742D2D636C6173736963202E612D42617243686172742D66696C6C6564207B0A2020626F726465722D7261646975733A203170783B0A7D0A2E612D42617243686172742D2D636C6173736963';
wwv_flow_api.g_varchar2_table(53) := '202E612D42617243686172742D6974656D3A686F766572202E612D42617243686172742D626172207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0A7D0A2E612D42617243686172742D2D6D6F';
wwv_flow_api.g_varchar2_table(54) := '6465726E202E612D42617243686172742D6261722C0A2E612D42617243686172742D2D6D6F6465726E202E612D42617243686172742D66696C6C6564207B0A2020626F726465722D7261646975733A203170783B0A7D0A2E612D42617243686172742D2D';
wwv_flow_api.g_varchar2_table(55) := '6D6F6465726E202E612D42617243686172742D6974656D3A686F766572202E612D42617243686172742D626172207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0A7D0A2E612D426172436861';
wwv_flow_api.g_varchar2_table(56) := '72742D66696C6C6564207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A7D0A0A626F64792C0A2E742D426F6479207B0A20206261636B67726F756E643A207267626128323535';
wwv_flow_api.g_varchar2_table(57) := '2C203235352C203235352C2030293B0A2020636F6C6F723A20233430343034303B0A7D0A61207B0A2020636F6C6F723A20233030316164663B0A7D0A2E742D426F64792D7469746C6520612C0A2E742D426F64792D696E666F2061207B0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(58) := '723A20233030313763363B0A7D0A2E742D426F64792D616374696F6E73207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A7D0A2E742D426F64792D7469746C65207B0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(59) := '3966633364623B0A2020636F6C6F723A20233030303030303B0A7D0A2E75692D7769646765742D636F6E74656E74207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D426F6479202E75692D7769646765742D63';
wwv_flow_api.g_varchar2_table(60) := '6F6E74656E74207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D426F64792D7469746C65202E75692D7769646765742D636F6E74656E74207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D426F64792D696E666F202E7569';
wwv_flow_api.g_varchar2_table(61) := '2D7769646765742D636F6E74656E74207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D526567696F6E202E75692D7769646765742D636F6E74656E742C0A2E742D427574746F6E526567696F6E202E75692D7769646765742D636F6E7465';
wwv_flow_api.g_varchar2_table(62) := '6E74207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D426F64792D73696465207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233430343034303B0A7D0A2E617065782D7264732D63';
wwv_flow_api.g_varchar2_table(63) := '6F6E7461696E6572207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D426F64792D696E666F202E617065782D7264732D636F6E7461696E6572207B0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(64) := '20233966633364623B0A7D0A2E742D426F64792D696E666F207B0A20206261636B67726F756E642D636F6C6F723A20233966633364623B0A7D0A2E742D426F64792D7469746C652E6A732D6869646542726561646372756D6273207B0A20206261636B67';
wwv_flow_api.g_varchar2_table(65) := '726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3935293B0A7D0A2E742D426F64792D746F70427574746F6E207B0A2020626F726465722D7261646975733A20313030253B0A20206261636B67726F756E642D636F6C6F723A2072';
wwv_flow_api.g_varchar2_table(66) := '676261283235352C203235352C203235352C2030293B0A7D0A2E742D426F64792D746F70427574746F6E3A616374697665207B0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C2030293B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(67) := '2D426F64792D746F70427574746F6E3A616374697665202E612D49636F6E207B0A2020636F6C6F723A2072676261283233302C203233302C203233302C2030293B0A7D0A2E742D426F64792D746F70427574746F6E202E612D49636F6E207B0A2020636F';
wwv_flow_api.g_varchar2_table(68) := '6C6F723A2072676261283233302C203233302C203233302C2030293B0A7D0A0A2E617065782D736964652D6E6176202E742D426F64792D6E61762C0A2E617065782D736964652D6E6176202E742D426F64792D616374696F6E732C0A2E617065782D7369';
wwv_flow_api.g_varchar2_table(69) := '64652D6E6176202E742D426F64792D7469746C65207B0A2020746F703A20343070783B0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0A20202E617065782D736964652D6E6176202E';
wwv_flow_api.g_varchar2_table(70) := '742D426F64792D7469746C65207B0A202020206C6566743A2032303070783B0A20207D0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0A20202E617065782D736964652D6E6176202E';
wwv_flow_api.g_varchar2_table(71) := '742D426F64792D636F6E74656E74207B0A202020206D617267696E2D6C6566743A2032303070783B0A20207D0A7D0A2E617065782D736964652D6E6176202E742D426F64792D6D61696E207B0A20206D617267696E2D6C6566743A20303B0A7D0A0A2E61';
wwv_flow_api.g_varchar2_table(72) := '7065782D746F702D6E6176202E742D426F64792D616374696F6E73207B0A2020746F703A20383070783B0A7D0A2E617065782D746F702D6E6176202E742D426F64792D7469746C65207B0A2020746F703A20383070783B0A7D0A0A2E742D426F64792D6E';
wwv_flow_api.g_varchar2_table(73) := '6176207B0A202077696474683A2032303070783B0A7D0A0A2E742D426F64792D616374696F6E73207B0A202077696474683A2032303070783B0A7D0A2E742D426F64792D616374696F6E73202E742D427574746F6E2D2D686561646572207B0A20202D77';
wwv_flow_api.g_varchar2_table(74) := '65626B69742D7472616E73666F726D3A207472616E736C6174653364282D343070782C20302C2030293B0A20202D6D732D7472616E73666F726D3A207472616E736C617465282D34307078293B0A20207472616E73666F726D3A207472616E736C617465';
wwv_flow_api.g_varchar2_table(75) := '3364282D343070782C20302C2030293B0A7D0A0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0A20202E742D426F64792D73696465207B0A2020202077696474683A2032343070783B0A20';
wwv_flow_api.g_varchar2_table(76) := '2020206C6566743A20343070783B0A20207D0A7D0A0A2E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0A20206D617267696E2D6C6566743A20343070783B0A20202D7765626B69742D7472';
wwv_flow_api.g_varchar2_table(77) := '616E73666F726D3A207472616E736C61746533642831363070782C20302C2030293B0A20202D6D732D7472616E73666F726D3A207472616E736C617465283136307078293B0A20207472616E73666F726D3A207472616E736C6174653364283136307078';
wwv_flow_api.g_varchar2_table(78) := '2C20302C2030293B0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20343830707829207B0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D7469746C65';
wwv_flow_api.g_varchar2_table(79) := '2C0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D736964652C0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D636F6E74656E74207B0A2020';
wwv_flow_api.g_varchar2_table(80) := '20206D617267696E2D6C6566743A20303B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0A202020206D617267696E2D6C6566743A20303B0A202020202D7765626B6974';
wwv_flow_api.g_varchar2_table(81) := '2D7472616E73666F726D3A207472616E736C61746533642832303070782C20302C2030293B0A202020202D6D732D7472616E73666F726D3A207472616E736C617465283230307078293B0A202020207472616E73666F726D3A207472616E736C61746533';
wwv_flow_api.g_varchar2_table(82) := '642832303070782C20302C2030293B0A20207D0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D';
wwv_flow_api.g_varchar2_table(83) := '50616765426F64792D2D686964654C656674202E742D426F64792D7469746C652C0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D636F6E7465';
wwv_flow_api.g_varchar2_table(84) := '6E742C0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E207B0A202020202D7765626B69742D7472616E73666F726D3A206E6F6E653B';
wwv_flow_api.g_varchar2_table(85) := '0A202020202D6D732D7472616E73666F726D3A206E6F6E653B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C';
wwv_flow_api.g_varchar2_table(86) := '656674202E742D426F64792D7469746C65207B0A202020206C6566743A2032303070783B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64';
wwv_flow_api.g_varchar2_table(87) := '792D636F6E74656E74207B0A202020206D617267696E2D6C6566743A2032303070783B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F6479';
wwv_flow_api.g_varchar2_table(88) := '2D6D61696E207B0A202020206D617267696E2D6C6566743A203070783B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D7469746C652C0A20202E617065782D736964652D6E61762E6A73';
wwv_flow_api.g_varchar2_table(89) := '2D6E6176457870616E646564202E742D426F64792D736964652C0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D636F6E74656E74207B0A202020202D7765626B69742D7472616E73666F726D3A20';
wwv_flow_api.g_varchar2_table(90) := '7472616E736C61746533642832303070782C20302C2030293B0A202020202D6D732D7472616E73666F726D3A207472616E736C617465283230307078293B0A202020207472616E73666F726D3A207472616E736C61746533642832303070782C20302C20';
wwv_flow_api.g_varchar2_table(91) := '30293B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0A202020206D617267696E2D6C6566743A20303B0A20202020';
wwv_flow_api.g_varchar2_table(92) := '2D7765626B69742D7472616E73666F726D3A206E6F6E653B0A202020202D6D732D7472616E73666F726D3A206E6F6E653B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E61764578';
wwv_flow_api.g_varchar2_table(93) := '70616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0A202020206C6566743A20303B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F';
wwv_flow_api.g_varchar2_table(94) := '64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0A202020206D617267696E2D6C6566743A2032383070783B0A202020202D7765626B69742D7472616E73666F726D3A207472616E736C61746533642831363070782C20302C20';
wwv_flow_api.g_varchar2_table(95) := '30293B0A202020202D6D732D7472616E73666F726D3A207472616E736C617465283136307078293B0A202020207472616E73666F726D3A207472616E736C61746533642831363070782C20302C2030293B0A20207D0A7D0A406D65646961206F6E6C7920';
wwv_flow_api.g_varchar2_table(96) := '73637265656E20616E6420286D696E2D77696474683A20393933707829207B0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0A';
wwv_flow_api.g_varchar2_table(97) := '202020206D617267696E2D6C6566743A20303B0A202020202D7765626B69742D7472616E73666F726D3A206E6F6E653B0A202020202D6D732D7472616E73666F726D3A206E6F6E653B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A20';
wwv_flow_api.g_varchar2_table(98) := '202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0A202020202D7765626B69742D7472616E73666F726D3A206E6F6E653B0A202020';
wwv_flow_api.g_varchar2_table(99) := '202D6D732D7472616E73666F726D3A206E6F6E653B0A202020207472616E73666F726D3A206E6F6E653B0A202020206D617267696E2D6C6566743A2032303070783B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E64';
wwv_flow_api.g_varchar2_table(100) := '65642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0A202020206D617267696E2D6C6566743A2034343070783B0A202020202D7765626B69742D7472616E73666F726D3A206E6F6E653B0A202020202D';
wwv_flow_api.g_varchar2_table(101) := '6D732D7472616E73666F726D3A206E6F6E653B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A7D0A0A2E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D6E61762C0A2E617065782D7369';
wwv_flow_api.g_varchar2_table(102) := '64652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D6E6176202E742D547265654E6176207B0A202077696474683A20343070783B0A7D0A2E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D42';
wwv_flow_api.g_varchar2_table(103) := '6F64792D636F6E74656E742C0A2E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C652C0A2E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7369';
wwv_flow_api.g_varchar2_table(104) := '6465207B0A20206D617267696E2D6C6566743A20343070783B0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20343830707829207B0A20202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61';
wwv_flow_api.g_varchar2_table(105) := '70736564202E742D426F64792D6E6176207B0A202020202D7765626B69742D7472616E73666F726D3A207472616E736C61746558282D34307078293B0A202020202D6D732D7472616E73666F726D3A207472616E736C61746558282D34307078293B0A20';
wwv_flow_api.g_varchar2_table(106) := '2020207472616E73666F726D3A207472616E736C61746558282D34307078293B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C652C0A20202E617065782D736964652D6E61';
wwv_flow_api.g_varchar2_table(107) := '762E6A732D6E6176436F6C6C6170736564202E742D426F64792D736964652C0A20202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D636F6E74656E74207B0A202020206D617267696E2D6C6566743A20';
wwv_flow_api.g_varchar2_table(108) := '303B0A20207D0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0A20202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C6520';
wwv_flow_api.g_varchar2_table(109) := '7B0A202020206D617267696E2D6C6566743A20303B0A202020206C6566743A20343070783B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D42';
wwv_flow_api.g_varchar2_table(110) := '6F64792D73696465207B0A202020206D617267696E2D6C6566743A20303B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E';
wwv_flow_api.g_varchar2_table(111) := '74656E74207B0A202020206D617267696E2D6C6566743A2032383070783B0A20207D0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20393933707829207B0A20202E617065782D736964652D6E61762E6A73';
wwv_flow_api.g_varchar2_table(112) := '2D6E6176436F6C6C6170736564202E742D426F64792D73696465207B0A202020206C6566743A20343070783B0A20207D0A7D0A0A2E742D50616765426F64792E6A732D7269676874457870616E646564202E742D426F64792D6D61696E207B0A20206D61';
wwv_flow_api.g_varchar2_table(113) := '7267696E2D72696768743A20303B0A7D0A2E742D50616765426F64792E6A732D7269676874457870616E646564202E742D426F64792D6D61696E2C0A2E742D50616765426F64792E6A732D7269676874457870616E646564202E742D426F64792D6E6176';
wwv_flow_api.g_varchar2_table(114) := '207B0A20202D7765626B69742D7472616E73666F726D3A207472616E736C6174653364282D32303070782C20302C2030293B0A20202D6D732D7472616E73666F726D3A207472616E736C617465282D3230307078293B0A20207472616E73666F726D3A20';
wwv_flow_api.g_varchar2_table(115) := '7472616E736C6174653364282D32303070782C20302C2030293B0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0A20202E742D50616765426F64792E6A732D7269676874457870616E';
wwv_flow_api.g_varchar2_table(116) := '6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E2C0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6E';
wwv_flow_api.g_varchar2_table(117) := '6176207B0A202020202D7765626B69742D7472616E73666F726D3A206E6F6E653B0A202020202D6D732D7472616E73666F726D3A206E6F6E653B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A20202E742D50616765426F64792E6A73';
wwv_flow_api.g_varchar2_table(118) := '2D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E207B0A202020206D617267696E2D72696768743A2032303070783B0A20207D0A20202E742D50616765426F64792E6A732D726967';
wwv_flow_api.g_varchar2_table(119) := '6874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D7469746C65207B0A2020202072696768743A2032303070783B0A20207D0A20202E742D50616765426F64792E6A732D7269676874457870616E646564';
wwv_flow_api.g_varchar2_table(120) := '2E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0A2020202072696768743A20303B0A20207D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E6A732D6E6176436F6C6C617073';
wwv_flow_api.g_varchar2_table(121) := '65642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0A202020206D617267696E2D6C6566743A20303B0A202020206C6566743A20303B0A20207D0A7D0A406D65646961206F6E6C792073637265656E20616E64';
wwv_flow_api.g_varchar2_table(122) := '20286D696E2D77696474683A20393933707829207B0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0A202020206D617267696E2D';
wwv_flow_api.g_varchar2_table(123) := '72696768743A2032303070783B0A20207D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E2C0A20202E742D50616765426F64792E6A73';
wwv_flow_api.g_varchar2_table(124) := '2D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6E6176207B0A202020202D7765626B69742D7472616E73666F726D3A206E6F6E653B0A202020202D6D732D7472616E73666F726D3A206E6F';
wwv_flow_api.g_varchar2_table(125) := '6E653B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0A202020';
wwv_flow_api.g_varchar2_table(126) := '2072696768743A2032303070783B0A20207D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7369646520';
wwv_flow_api.g_varchar2_table(127) := '7B0A202020206C6566743A20343070783B0A20207D0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20393932707829207B0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E74';
wwv_flow_api.g_varchar2_table(128) := '2D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0A202020202D7765626B69742D7472616E73666F726D3A206E6F6E653B0A202020202D6D732D7472616E73666F726D3A206E6F6E653B0A202020207472616E73666F';
wwv_flow_api.g_varchar2_table(129) := '726D3A206E6F6E653B0A20207D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C652C0A20202E742D50616765426F64792E6A732D7269';
wwv_flow_api.g_varchar2_table(130) := '676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D736964652C0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E';
wwv_flow_api.g_varchar2_table(131) := '742D426F64792D636F6E74656E74207B0A202020202D7765626B69742D7472616E73666F726D3A207472616E736C6174653364282D32303070782C20302C2030293B0A202020202D6D732D7472616E73666F726D3A207472616E736C617465282D323030';
wwv_flow_api.g_varchar2_table(132) := '7078293B0A202020207472616E73666F726D3A207472616E736C6174653364282D32303070782C20302C2030293B0A20207D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C65';
wwv_flow_api.g_varchar2_table(133) := '6674202E742D426F64792D73696465207B0A202020206D617267696E2D6C6566743A20343070782021696D706F7274616E743B0A20207D0A7D0A0A2E742D50616765426F64792E6A732D7269676874436F6C6C6170736564202E742D426F64792D6D6169';
wwv_flow_api.g_varchar2_table(134) := '6E207B0A20206D617267696E2D72696768743A203070783B0A7D0A2E742D50616765426F64792E6A732D7269676874436F6C6C6170736564202E742D426F64792D7469746C65207B0A202072696768743A203070783B0A7D0A2E742D50616765426F6479';
wwv_flow_api.g_varchar2_table(135) := '2E6A732D7269676874436F6C6C6170736564202E742D426F64792D616374696F6E73207B0A20202D7765626B69742D7472616E73666F726D3A207472616E736C61746533642832303070782C20302C2030293B0A20202D6D732D7472616E73666F726D3A';
wwv_flow_api.g_varchar2_table(136) := '207472616E736C617465283230307078293B0A20207472616E73666F726D3A207472616E736C61746533642832303070782C20302C2030293B0A7D0A0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A2036343170';
wwv_flow_api.g_varchar2_table(137) := '7829207B0A20202E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0A202020206D617267696E2D6C6566743A2032343070783B0A20207D0A7D0A0A2E742D426F64792D636F6E74656E74496E6E6572207B';
wwv_flow_api.g_varchar2_table(138) := '0A20206D617267696E3A206175746F3B0A20206D61782D77696474683A206175746F3B0A7D0A0A2E742D42726561646372756D622D6974656D3A6166746572207B0A2020636F6C6F723A207267626128302C20302C20302C20302E39393335293B0A7D0A';
wwv_flow_api.g_varchar2_table(139) := '2E742D42726561646372756D622D6974656D202E742D49636F6E3A686F766572207B0A2020636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A7D0A2E742D42726561646372756D62526567696F6E2D2D757365427265';
wwv_flow_api.g_varchar2_table(140) := '61646372756D625469746C65202E742D42726561646372756D622D6974656D3A6C6173742D6368696C64202E742D42726561646372756D622D6C6162656C207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D42726561646372756D625265';
wwv_flow_api.g_varchar2_table(141) := '67696F6E2D7469746C6554657874207B0A2020636F6C6F723A20233030303030303B0A7D0A0A2E742D427574746F6E2C0A2E612D427574746F6E207B0A2020626F726465723A206E6F6E653B0A2020636F6C6F723A20233338333833383B0A2020626163';
wwv_flow_api.g_varchar2_table(142) := '6B67726F756E642D636C69703A2070616464696E672D626F783B0A20206261636B67726F756E642D636F6C6F723A20236638663866383B0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E31323529';
wwv_flow_api.g_varchar2_table(143) := '20696E7365743B0A2020626F726465722D7261646975733A203270783B0A2020746578742D736861646F773A206E6F6E653B0A7D0A2E742D427574746F6E3A686F7665722C0A2E612D427574746F6E3A686F766572207B0A2020626F782D736861646F77';
wwv_flow_api.g_varchar2_table(144) := '3A20302032707820317078207267626128302C20302C20302C20302E3035292C20302030203020317078207267626128302C20302C20302C20302E3132352920696E7365743B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D73696D706C652C';
wwv_flow_api.g_varchar2_table(145) := '0A2E612D427574746F6E2E742D427574746F6E2D2D73696D706C65207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233430343034303B0A2020626F782D736861646F773A20302030203020317078';
wwv_flow_api.g_varchar2_table(146) := '207267626128302C20302C20302C20302E3132352920696E7365743B0A2020746578742D736861646F773A206E6F6E653B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D73696D706C653A686F7665722C0A2E612D427574746F6E2E742D4275';
wwv_flow_api.g_varchar2_table(147) := '74746F6E2D2D73696D706C653A686F7665722C0A2E742D427574746F6E2E742D427574746F6E2D2D73696D706C653A666F6375732C0A2E612D427574746F6E2E742D427574746F6E2D2D73696D706C653A666F6375732C0A2E742D427574746F6E2E742D';
wwv_flow_api.g_varchar2_table(148) := '427574746F6E2D2D73696D706C653A6163746976652C0A2E612D427574746F6E2E742D427574746F6E2D2D73696D706C653A616374697665207B0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0A2020626F782D736861646F77';
wwv_flow_api.g_varchar2_table(149) := '3A20302030203020317078202365366536653620696E7365743B0A7D0A406D656469612073637265656E20616E6420282D6D732D686967682D636F6E74726173743A2061637469766529207B0A20202E742D427574746F6E2C0A20202E612D427574746F';
wwv_flow_api.g_varchar2_table(150) := '6E207B0A20202020626F726465723A2031707820736F6C69643B0A20207D0A7D0A0A2E742D427574746F6E2D2D7072696D6172792C0A2E742D427574746F6E2D2D686F742C0A2E742D427574746F6E2D2D64616E6765722C0A2E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(151) := '7761726E696E672C0A2E742D427574746F6E2D2D73756363657373207B0A2020626F782D736861646F773A2030203020327078207267626128302C20302C20302C20302E30352920696E7365743B0A7D0A2E742D427574746F6E2D2D7072696D6172792E';
wwv_flow_api.g_varchar2_table(152) := '742D427574746F6E2D2D73696D706C652C0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C652C0A2E742D427574746F6E2D2D7761';
wwv_flow_api.g_varchar2_table(153) := '726E696E672E742D427574746F6E2D2D73696D706C652C0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D706C65207B0A2020626F782D736861646F773A2030203020302031707820696E7365743B0A7D0A2E742D4275';
wwv_flow_api.g_varchar2_table(154) := '74746F6E2D2D7072696D6172793A686F7665722C0A2E742D427574746F6E2D2D7761726E696E673A686F766572207B0A2020626F782D736861646F773A20302032707820317078207267626128302C20302C20302C20302E3035292C2030203020302031';
wwv_flow_api.g_varchar2_table(155) := '7078207267626128302C20302C20302C20302E3037352920696E7365743B0A7D0A2E742D427574746F6E2D2D686F743A686F7665722C0A2E742D427574746F6E2D2D64616E6765723A686F7665722C0A2E742D427574746F6E2D2D737563636573733A68';
wwv_flow_api.g_varchar2_table(156) := '6F766572207B0A2020626F782D736861646F773A20302032707820317078207267626128302C20302C20302C20302E31292C20302030203020317078207267626128302C20302C20302C20302E3037352920696E7365743B0A7D0A2E742D427574746F6E';
wwv_flow_api.g_varchar2_table(157) := '3A686F7665722C0A2E612D427574746F6E3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A20207A2D696E6465783A203130303B0A7D0A2E742D427574746F6E3A666F6375732C0A2E612D427574746F6E3A';
wwv_flow_api.g_varchar2_table(158) := '666F637573207B0A20206F75746C696E653A206E6F6E653B0A20207A2D696E6465783A203131303B0A7D0A2E742D427574746F6E3A666F6375732C0A2E612D427574746F6E3A666F6375732C0A2E742D427574746F6E3A6163746976653A666F6375732C';
wwv_flow_api.g_varchar2_table(159) := '0A2E612D427574746F6E3A6163746976653A666F637573207B0A2020626F782D736861646F773A203020302030203170782072676261283131362C203135322C203138352C20302E39332920696E7365742C203020302031707820327078207267626128';
wwv_flow_api.g_varchar2_table(160) := '3131362C203135322C203138352C20302E3235292021696D706F7274616E743B0A7D0A2E742D427574746F6E3A616374697665207B0A20206261636B67726F756E642D636F6C6F723A20236465646564653B0A2020626F782D736861646F773A20302030';
wwv_flow_api.g_varchar2_table(161) := '203020317078207267626128302C20302C20302C20302E322920696E7365742C20302031707820327078207267626128302C20302C20302C20302E32352920696E7365743B0A20207A2D696E6465783A203130303B0A7D0A2E742D427574746F6E3A6163';
wwv_flow_api.g_varchar2_table(162) := '746976653A666F637573207B0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E322920696E7365742C20302031707820327078207267626128302C20302C20302C20302E32352920696E7365742021';
wwv_flow_api.g_varchar2_table(163) := '696D706F7274616E743B0A7D0A2E742D427574746F6E2E69732D6163746976652C0A2E742D427574746F6E2E69732D6163746976653A6163746976652C0A2E742D4D656E75427574746F6E2E69732D616374697665207B0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(164) := '2D636F6C6F723A20236465646564653B0A2020636F6C6F723A20233338333833383B0A2020666F6E742D7765696768743A206E6F726D616C3B0A2020746578742D736861646F773A206E6F6E653B0A20207A2D696E6465783A203130303B0A2020626F78';
wwv_flow_api.g_varchar2_table(165) := '2D736861646F773A20302030203020317078207267626128302C20302C20302C20302E322920696E7365742C20302031707820327078207267626128302C20302C20302C20302E32352920696E7365743B0A7D0A2E742D427574746F6E2E69732D646973';
wwv_flow_api.g_varchar2_table(166) := '61626C65642C0A2E742D427574746F6E2E69732D64697361626C65643A6163746976652C0A2E742D427574746F6E3A64697361626C6564207B0A20206F7061636974793A202E353B0A2020706F696E7465722D6576656E74733A206E6F6E653B0A7D0A0A';
wwv_flow_api.g_varchar2_table(167) := '2E742D427574746F6E2D2D686F742C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D2D686F742C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D707269';
wwv_flow_api.g_varchar2_table(168) := '6F726974792D7072696D617279207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020636F6C6F723A20236666666666663B0A2020746578742D736861646F773A2030202D31';
wwv_flow_api.g_varchar2_table(169) := '70782030207267626128302C20302C20302C20302E31293B0A7D0A2E742D427574746F6E2D2D686F743A686F7665722C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D2D686F743A686F76';
wwv_flow_api.g_varchar2_table(170) := '65722C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172793A686F766572207B0A20206261636B67726F756E642D636F6C6F723A2072676261283135302C203137372C203230322C';
wwv_flow_api.g_varchar2_table(171) := '20302E3933293B0A7D0A2E742D427574746F6E2D2D686F743A6163746976652C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D2D686F743A6163746976652C0A626F647920627574746F6E';
wwv_flow_api.g_varchar2_table(172) := '2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172793A6163746976652C0A2E742D427574746F6E2D2D686F742E69732D6163746976652C0A626F6479202E75692D73746174652D64656661756C742E75692D6275';
wwv_flow_api.g_varchar2_table(173) := '74746F6E2E75692D627574746F6E2D2D686F742E69732D6163746976652C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E69732D6163746976652C0A2E742D427574746F6E';
wwv_flow_api.g_varchar2_table(174) := '2D2D686F742E742D4D656E75427574746F6E2E69732D6163746976652C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D2D686F742E742D4D656E75427574746F6E2E69732D616374697665';
wwv_flow_api.g_varchar2_table(175) := '2C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E742D4D656E75427574746F6E2E69732D616374697665207B0A20206261636B67726F756E642D636F6C6F723A2072676261';
wwv_flow_api.g_varchar2_table(176) := '2838342C203132372C203136362C20302E3933293B0A7D0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D';
wwv_flow_api.g_varchar2_table(177) := '2D686F742E742D427574746F6E2D2D73696D706C652C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E742D427574746F6E2D2D73696D706C65207B0A2020626F782D736861';
wwv_flow_api.g_varchar2_table(178) := '646F773A203020302030203170782072676261283131362C203135322C203138352C20302E39332920696E7365743B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20726762612838382C203130352C20';
wwv_flow_api.g_varchar2_table(179) := '3132302C20302E393635293B0A7D0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C65202E742D49636F6E2C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D2D';
wwv_flow_api.g_varchar2_table(180) := '686F742E742D427574746F6E2D2D73696D706C65202E742D49636F6E2C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E742D427574746F6E2D2D73696D706C65202E742D49';
wwv_flow_api.g_varchar2_table(181) := '636F6E207B0A2020636F6C6F723A20726762612838382C203130352C203132302C20302E393635293B0A7D0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A686F7665722C0A626F6479202E75692D73746174652D6465';
wwv_flow_api.g_varchar2_table(182) := '6661756C742E75692D627574746F6E2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A686F7665722C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D';
wwv_flow_api.g_varchar2_table(183) := '6172792E742D427574746F6E2D2D73696D706C653A686F7665722C0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A666F6375732C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E';
wwv_flow_api.g_varchar2_table(184) := '75692D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A666F6375732C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E742D427574746F6E2D2D7369';
wwv_flow_api.g_varchar2_table(185) := '6D706C653A666F6375732C0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A6163746976652C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D2D686F742E';
wwv_flow_api.g_varchar2_table(186) := '742D427574746F6E2D2D73696D706C653A6163746976652C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E742D427574746F6E2D2D73696D706C653A616374697665207B0A';
wwv_flow_api.g_varchar2_table(187) := '20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020636F6C6F723A20236666666666663B0A2020626F782D736861646F773A203020302030203170782072676261283131362C2031';
wwv_flow_api.g_varchar2_table(188) := '35322C203138352C20302E39332920696E7365743B0A7D0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A686F766572202E742D49636F6E2C0A626F6479202E75692D73746174652D64656661756C742E75692D627574';
wwv_flow_api.g_varchar2_table(189) := '746F6E2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A686F766572202E742D49636F6E2C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E';
wwv_flow_api.g_varchar2_table(190) := '742D427574746F6E2D2D73696D706C653A686F766572202E742D49636F6E2C0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A666F637573202E742D49636F6E2C0A626F6479202E75692D73746174652D64656661756C';
wwv_flow_api.g_varchar2_table(191) := '742E75692D627574746F6E2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A666F637573202E742D49636F6E2C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D';
wwv_flow_api.g_varchar2_table(192) := '7072696D6172792E742D427574746F6E2D2D73696D706C653A666F637573202E742D49636F6E2C0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A616374697665202E742D49636F6E2C0A626F6479202E75692D737461';
wwv_flow_api.g_varchar2_table(193) := '74652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A616374697665202E742D49636F6E2C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E7569';
wwv_flow_api.g_varchar2_table(194) := '2D7072696F726974792D7072696D6172792E742D427574746F6E2D2D73696D706C653A616374697665202E742D49636F6E207B0A2020636F6C6F723A20236666666666663B0A7D0A0A2E742D427574746F6E2D2D7072696D617279207B0A20206261636B';
wwv_flow_api.g_varchar2_table(195) := '67726F756E642D636F6C6F723A2072676261283233352C203234302C203234352C20302E3933293B0A2020636F6C6F723A20233230333134313B0A7D0A2E742D427574746F6E2D2D7072696D6172793A686F766572207B0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(196) := '2D636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D427574746F6E2D2D7072696D6172793A6163746976652C0A2E742D427574746F6E2D2D7072696D6172792E69732D616374697665207B0A2020626163';
wwv_flow_api.g_varchar2_table(197) := '6B67726F756E642D636F6C6F723A2072676261283230312C203231352C203232382C20302E3933293B0A7D0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D73696D706C65207B0A2020626F782D736861646F773A2030203020';
wwv_flow_api.g_varchar2_table(198) := '30203170782072676261283233352C203234302C203234352C20302E39332920696E7365743B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A2072676261283132332C203132352C203132372C20302E39';
wwv_flow_api.g_varchar2_table(199) := '3635293B0A7D0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D73696D706C65202E742D49636F6E207B0A2020636F6C6F723A2072676261283132332C203132352C203132372C20302E393635293B0A7D0A2E742D427574746F';
wwv_flow_api.g_varchar2_table(200) := '6E2D2D7072696D6172792E742D427574746F6E2D2D73696D706C653A686F7665722C0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D73696D706C653A666F6375732C0A2E742D427574746F6E2D2D7072696D6172792E742D42';
wwv_flow_api.g_varchar2_table(201) := '7574746F6E2D2D73696D706C653A616374697665207B0A20206261636B67726F756E642D636F6C6F723A2072676261283233352C203234302C203234352C20302E3933293B0A2020636F6C6F723A20233230333134313B0A2020626F782D736861646F77';
wwv_flow_api.g_varchar2_table(202) := '3A203020302030203170782072676261283233352C203234302C203234352C20302E39332920696E7365743B0A7D0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D73696D706C653A686F766572202E742D49636F6E2C0A2E74';
wwv_flow_api.g_varchar2_table(203) := '2D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D73696D706C653A666F637573202E742D49636F6E2C0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D73696D706C653A616374697665202E742D49636F6E20';
wwv_flow_api.g_varchar2_table(204) := '7B0A2020636F6C6F723A20233230333134313B0A7D0A0A2E742D427574746F6E2D2D64616E676572207B0A20206261636B67726F756E642D636F6C6F723A20236539306330303B0A2020636F6C6F723A20236666656165393B0A7D0A2E742D427574746F';
wwv_flow_api.g_varchar2_table(205) := '6E2D2D64616E6765723A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236666323931643B0A7D0A2E742D427574746F6E2D2D64616E6765723A6163746976652C0A2E742D427574746F6E2D2D64616E6765722E69732D61637469';
wwv_flow_api.g_varchar2_table(206) := '7665207B0A20206261636B67726F756E642D636F6C6F723A20236236303930303B0A7D0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C65207B0A2020626F782D736861646F773A2030203020302031707820236539';
wwv_flow_api.g_varchar2_table(207) := '3063303020696E7365743B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233934323632303B0A7D0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C65202E742D49';
wwv_flow_api.g_varchar2_table(208) := '636F6E207B0A2020636F6C6F723A20233934323632303B0A7D0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C653A686F7665722C0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D70';
wwv_flow_api.g_varchar2_table(209) := '6C653A666F6375732C0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C653A616374697665207B0A20206261636B67726F756E642D636F6C6F723A20236539306330303B0A2020636F6C6F723A20236666656165393B';
wwv_flow_api.g_varchar2_table(210) := '0A2020626F782D736861646F773A20302030203020317078202365393063303020696E7365743B0A7D0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C653A686F766572202E742D49636F6E2C0A2E742D427574746F';
wwv_flow_api.g_varchar2_table(211) := '6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C653A666F637573202E742D49636F6E2C0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C653A616374697665202E742D49636F6E207B0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(212) := '723A20236666656165393B0A7D0A0A2E742D427574746F6E2D2D7761726E696E67207B0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D427574746F6E2D2D7761726E';
wwv_flow_api.g_varchar2_table(213) := '696E673A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236666643633333B0A7D0A2E742D427574746F6E2D2D7761726E696E673A6163746976652C0A2E742D427574746F6E2D2D7761726E696E672E69732D616374697665207B';
wwv_flow_api.g_varchar2_table(214) := '0A20206261636B67726F756E642D636F6C6F723A20236363613330303B0A7D0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C65207B0A2020626F782D736861646F773A2030203020302031707820236666636330';
wwv_flow_api.g_varchar2_table(215) := '3020696E7365743B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233863373330643B0A7D0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C65202E742D49636F';
wwv_flow_api.g_varchar2_table(216) := '6E207B0A2020636F6C6F723A20233863373330643B0A7D0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C653A686F7665722C0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D70';
wwv_flow_api.g_varchar2_table(217) := '6C653A666F6375732C0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C653A616374697665207B0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0A2020636F6C6F723A2023303030303030';
wwv_flow_api.g_varchar2_table(218) := '3B0A2020626F782D736861646F773A20302030203020317078202366666363303020696E7365743B0A7D0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C653A686F766572202E742D49636F6E2C0A2E742D427574';
wwv_flow_api.g_varchar2_table(219) := '746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C653A666F637573202E742D49636F6E2C0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C653A616374697665202E742D49636F6E207B0A2020';
wwv_flow_api.g_varchar2_table(220) := '636F6C6F723A20233030303030303B0A7D0A0A2E742D427574746F6E2D2D73756363657373207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A2020636F6C6F723A20233037316630623B0A7D0A2E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(221) := '737563636573733A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20233736653238383B0A7D0A2E742D427574746F6E2D2D737563636573733A6163746976652C0A2E742D427574746F6E2D2D737563636573732E69732D61637469';
wwv_flow_api.g_varchar2_table(222) := '7665207B0A20206261636B67726F756E642D636F6C6F723A20233261633834353B0A7D0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D706C65207B0A2020626F782D736861646F773A20302030203020317078202334';
wwv_flow_api.g_varchar2_table(223) := '636439363420696E7365743B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233333373933663B0A7D0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D706C65202E74';
wwv_flow_api.g_varchar2_table(224) := '2D49636F6E207B0A2020636F6C6F723A20233333373933663B0A7D0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D706C653A686F7665722C0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(225) := '73696D706C653A666F6375732C0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D706C653A616374697665207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A2020636F6C6F723A20233037';
wwv_flow_api.g_varchar2_table(226) := '316630623B0A2020626F782D736861646F773A20302030203020317078202334636439363420696E7365743B0A7D0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D706C653A686F766572202E742D49636F6E2C0A2E74';
wwv_flow_api.g_varchar2_table(227) := '2D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D706C653A666F637573202E742D49636F6E2C0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D706C653A616374697665202E742D49636F6E20';
wwv_flow_api.g_varchar2_table(228) := '7B0A2020636F6C6F723A20233037316630623B0A7D0A2E742D427574746F6E2D2D70696C6C5374617274207B0A2020626F726465722D746F702D72696768742D7261646975733A20302021696D706F7274616E743B0A2020626F726465722D626F74746F';
wwv_flow_api.g_varchar2_table(229) := '6D2D72696768742D7261646975733A20302021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D70696C6C456E64207B0A2020626F726465722D746F702D6C6566742D7261646975733A20302021696D706F7274616E743B0A2020626F726465';
wwv_flow_api.g_varchar2_table(230) := '722D626F74746F6D2D6C6566742D7261646975733A20302021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D70696C6C207B0A2020626F726465722D7261646975733A20302021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(231) := '6869646553686F772E742D427574746F6E207B0A2020626F726465722D7261646975733A20313030253B0A7D0A2E742D4865616465722D6272616E64696E67202E742D427574746F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E';
wwv_flow_api.g_varchar2_table(232) := '73706172656E743B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D686561646572207B0A20207472616E736974696F6E3A206E6F6E653B0A2020626F726465722D7261646975733A20303B0A7D0A2E742D427574746F6E2E742D427574746F6E';
wwv_flow_api.g_varchar2_table(233) := '2D2D6865616465723A666F6375732C0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A6163746976653A666F637573207B0A2020626F782D736861646F773A203020302030203170782072676261283136372C203139302C20323131';
wwv_flow_api.g_varchar2_table(234) := '2C20302E39332920696E7365742C2030203020317078203270782072676261283136372C203139302C203231312C20302E3235292021696D706F7274616E743B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A686F7665722C';
wwv_flow_api.g_varchar2_table(235) := '0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A666F6375732C0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A616374697665207B0A20206261636B67726F756E642D636F6C6F723A207472616E7370617265';
wwv_flow_api.g_varchar2_table(236) := '6E743B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A686F766572207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E31293B0A7D0A2E742D427574746F6E2E742D427574746F';
wwv_flow_api.g_varchar2_table(237) := '6E2D2D6865616465723A6163746976652C0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A666F6375733A616374697665207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E34293B0A';
wwv_flow_api.g_varchar2_table(238) := '7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E69732D616374697665207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3235293B0A2020626F782D736861646F773A206E6F6E65';
wwv_flow_api.g_varchar2_table(239) := '3B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D686561646572547265653A6265666F7265207B0A2020636F6E74656E743A2027273B0A2020706F736974696F6E3A206162736F6C7574653B0A2020';
wwv_flow_api.g_varchar2_table(240) := '746F703A20303B0A2020626F74746F6D3A20303B0A202072696768743A20303B0A202077696474683A203170783B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E31293B0A7D0A2E742D427574746F6E2E74';
wwv_flow_api.g_varchar2_table(241) := '2D427574746F6E2D2D6865616465722E742D427574746F6E2D2D686561646572547265652E69732D616374697665207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D427574746F6E2E742D42757474';
wwv_flow_api.g_varchar2_table(242) := '6F6E2D2D6865616465722E742D427574746F6E2D2D686561646572547265653A686F7665722C0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D686561646572547265653A666F6375733A686F766572207B';
wwv_flow_api.g_varchar2_table(243) := '0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E33293B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D6865616465725269676874207B0A20206261636B';
wwv_flow_api.g_varchar2_table(244) := '67726F756E642D636F6C6F723A20236632663266323B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D68656164657252696768743A686F766572207B0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(245) := '3A20236439643964393B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D68656164657252696768743A6163746976652C0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D42';
wwv_flow_api.g_varchar2_table(246) := '7574746F6E2D2D68656164657252696768742E69732D616374697665207B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D427574746F6E2D2D6E6176426172202E742D427574746F6E2D6261646765207B0A2020626F726465722D72616469';
wwv_flow_api.g_varchar2_table(247) := '75733A203270783B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3335293B0A7D0A2E742D427574746F6E2D2D68656C70427574746F6E202E612D49636F6E207B0A20206F7061636974793A202E353B0A7D';
wwv_flow_api.g_varchar2_table(248) := '0A2E612D43616C656E6461722D627574746F6E207B0A2020626F726465722D7261646975733A203270783B0A2020636F6C6F723A20233730373037303B0A7D0A0A2E742D427574746F6E2D2D6E6F5549207B0A2020636F6C6F723A20233338333833383B';
wwv_flow_api.g_varchar2_table(249) := '0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D7072696D617279207B0A2020636F6C6F723A2072676261283132332C203132352C203132372C20302E393635292021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(250) := '6E6F55492E742D427574746F6E2D2D7072696D617279202E742D49636F6E207B0A2020636F6C6F723A2072676261283233352C203234302C203234352C20302E3933292021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D';
wwv_flow_api.g_varchar2_table(251) := '427574746F6E2D2D7761726E696E67207B0A2020636F6C6F723A20233863373330642021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D7761726E696E67202E742D49636F6E207B0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(252) := '3A20236666636330302021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D64616E676572207B0A2020636F6C6F723A20233831313330642021696D706F7274616E743B0A7D0A2E742D427574746F6E2D';
wwv_flow_api.g_varchar2_table(253) := '2D6E6F55492E742D427574746F6E2D2D64616E676572202E742D49636F6E207B0A2020636F6C6F723A20236539306330302021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D73756363657373207B0A';
wwv_flow_api.g_varchar2_table(254) := '2020636F6C6F723A20233333373933662021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D73756363657373202E742D49636F6E207B0A2020636F6C6F723A20233463643936342021696D706F727461';
wwv_flow_api.g_varchar2_table(255) := '6E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D686F74207B0A2020636F6C6F723A20726762612836382C2038342C203130302C20302E393635292021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55';
wwv_flow_api.g_varchar2_table(256) := '492E742D427574746F6E2D2D686F74202E742D49636F6E207B0A2020636F6C6F723A2072676261283131362C203135322C203138352C20302E3933292021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D';
wwv_flow_api.g_varchar2_table(257) := '2D7072696D6172792C0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D7761726E696E672C0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D64616E6765722C0A2E742D427574746F6E2D2D6E6F55492E742D427574';
wwv_flow_api.g_varchar2_table(258) := '746F6E2D2D737563636573732C0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D686F74207B0A2020626F782D736861646F773A206E6F6E653B0A7D0A0A2E742D427574746F6E526567696F6E207B0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(259) := '636F6C6F723A20236666666666663B0A2020636F6C6F723A20233030303030303B0A2020626F726465722D7261646975733A203070783B0A7D0A2E742D427574746F6E526567696F6E2D2D6E6F5549207B0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(260) := '3A207472616E73706172656E743B0A7D0A2E742D427574746F6E526567696F6E2D2D77697A6172642C0A2E742D427574746F6E526567696F6E2D2D6469616C6F67526567696F6E207B0A2020626F726465722D7261646975733A20302030203270782032';
wwv_flow_api.g_varchar2_table(261) := '70783B0A7D0A2E742D427574746F6E526567696F6E2D2D6469616C6F67526567696F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D426F6479202E742D427574746F6E526567696F6E2D2D7368';
wwv_flow_api.g_varchar2_table(262) := '6F775469746C65202E742D427574746F6E526567696F6E2D7469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D426F64792D7469746C65202E742D427574746F6E526567696F6E2D2D73686F775469746C65202E742D42757474';
wwv_flow_api.g_varchar2_table(263) := '6F6E526567696F6E2D7469746C65207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D426F64792D696E666F202E742D427574746F6E526567696F6E2D2D73686F775469746C65202E742D427574746F6E526567696F6E2D7469746C65207B';
wwv_flow_api.g_varchar2_table(264) := '0A2020636F6C6F723A20233030303030303B0A7D0A2E742D526567696F6E202E742D427574746F6E526567696F6E2D2D73686F775469746C65202E742D427574746F6E526567696F6E2D7469746C652C0A2E742D427574746F6E526567696F6E202E742D';
wwv_flow_api.g_varchar2_table(265) := '427574746F6E526567696F6E2D2D73686F775469746C65202E742D427574746F6E526567696F6E2D7469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D426F64792D616374696F6E73202E742D427574746F6E526567696F6E20';
wwv_flow_api.g_varchar2_table(266) := '7B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A2020626F726465722D7261646975733A20303B0A7D0A0A2E66632D746F6F6C626172207B0A2020626F726465722D636F6C6F723A20236562656265623B0A202062';
wwv_flow_api.g_varchar2_table(267) := '61636B67726F756E642D636F6C6F723A20236666666666663B0A2020626F726465722D7261646975733A2030707820307078203020303B0A7D0A2E66632D746F6F6C6261722068322C0A2E6663202E66632D62617369632D766965772074642E66632D64';
wwv_flow_api.g_varchar2_table(268) := '61792D6E756D6265722C0A2E6663202E66632D6461792D6E756D626572207B0A2020636F6C6F723A20233030303030303B0A7D0A2E66632D6461792D6865616465722E75692D7769646765742D6865616465722C0A2E66632D76696577202E75692D7769';
wwv_flow_api.g_varchar2_table(269) := '646765742D686561646572207B0A20206261636B67726F756E642D636F6C6F723A20236132643265363B0A2020636F6C6F723A20233432343234653B0A2020626F726465722D636F6C6F723A20233865633965303B0A7D0A6469762E66632D6167656E64';
wwv_flow_api.g_varchar2_table(270) := '614C697374207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020626F726465722D636F6C6F723A20236562656265623B0A2020636F6C6F723A20233030303030303B0A7D0A2E6663202E66632D6167656E64614C697374';
wwv_flow_api.g_varchar2_table(271) := '2D646179486561646572207B0A20206261636B67726F756E642D636F6C6F723A20233761626664623B0A2020636F6C6F723A20233432343234653B0A2020626F726465722D636F6C6F723A20236661666166613B0A7D0A2E6663202E66632D6167656E64';
wwv_flow_api.g_varchar2_table(272) := '614C6973742D646179207B0A2020636F6C6F723A20233432343234653B0A7D0A2E6663202E66632D6167656E64614C6973742D64617465207B0A2020636F6C6F723A20233635363537373B0A7D0A2E6663202E66632D6167656E64614C697374202E6663';
wwv_flow_api.g_varchar2_table(273) := '2D6576656E742D73746172742D74696D652C0A2E6663202E66632D6167656E64614C697374202E66632D6576656E742D616C6C2D646179207B0A2020636F6C6F723A20233236323632363B0A7D0A626F6479202E66632074642E66632D746F6461792C0A';
wwv_flow_api.g_varchar2_table(274) := '626F6479202E6663202E75692D7769646765742D636F6E74656E74207B0A2020626F726465722D636F6C6F723A20236536653665363B0A2020636F6C6F723A20233030303030303B0A7D0A626F6479202E75692D7769646765742D636F6E74656E742E66';
wwv_flow_api.g_varchar2_table(275) := '632D746F6461792E75692D73746174652D686967686C69676874207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A7D0A2E6663202E66632D6167656E64614C6973742D6974656D207B0A2020626F726465722D636F6C6F72';
wwv_flow_api.g_varchar2_table(276) := '3A20236661666166613B0A7D0A0A2E742D436172642D77726170207B0A2020626F726465722D7261646975733A203270783B0A7D0A2E742D436172642D777261703A666F637573207B0A2020626F726465722D636F6C6F723A2072676261283131362C20';
wwv_flow_api.g_varchar2_table(277) := '3135322C203138352C20302E3933293B0A7D0A2E742D436172642D69636F6E202E742D49636F6E207B0A2020636F6C6F723A20234646463B0A7D0A2E742D436172642D64657363207B0A2020636F6C6F723A20233364336433643B0A7D0A2E742D436172';
wwv_flow_api.g_varchar2_table(278) := '64732D2D636F6D70616374202E742D436172642D77726170207B0A20206261636B67726F756E642D636F6C6F723A20236663666366633B0A7D0A2E742D43617264732D2D636F6D70616374202E742D436172642D64657363207B0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(279) := '233633363336333B0A7D0A2E742D436172642D696E666F207B0A2020636F6C6F723A20233633363336333B0A7D0A2E742D436172642D7469746C65207B0A2020636F6C6F723A20233364336433643B0A7D0A2E742D43617264732D2D6261736963202E74';
wwv_flow_api.g_varchar2_table(280) := '2D43617264202E742D436172642D777261702C0A2E742D436172642D2D6261736963202E742D436172642D77726170207B0A20206261636B67726F756E642D636F6C6F723A20236663666366633B0A7D0A2E742D43617264732D2D6261736963202E742D';
wwv_flow_api.g_varchar2_table(281) := '43617264202E742D436172642D69636F6E202E742D49636F6E2C0A2E742D436172642D2D6261736963202E742D436172642D69636F6E202E742D49636F6E207B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(282) := '636F6C6F723A20234130413041303B0A7D0A2E742D43617264732D2D6261736963202E742D43617264202E742D436172642D7469746C65577261702C0A2E742D436172642D2D6261736963202E742D436172642D7469746C6557726170207B0A20206261';
wwv_flow_api.g_varchar2_table(283) := '636B67726F756E642D636F6C6F723A20236236646365623B0A7D0A2E742D43617264732D2D6665617475726564202E742D43617264202E742D436172642D777261702C0A2E742D436172642D2D6665617475726564202E742D436172642D77726170207B';
wwv_flow_api.g_varchar2_table(284) := '0A20206261636B67726F756E642D636F6C6F723A20236663666366633B0A7D0A2E742D43617264732D2D6665617475726564202E742D43617264202E742D436172642D69636F6E202E742D49636F6E2C0A2E742D436172642D2D6665617475726564202E';
wwv_flow_api.g_varchar2_table(285) := '742D436172642D69636F6E202E742D49636F6E207B0A2020626F726465722D7261646975733A2031303070783B0A2020636F6C6F723A20234646463B0A20206261636B67726F756E642D636F6C6F723A20234130413041303B0A7D0A2E742D4361726473';
wwv_flow_api.g_varchar2_table(286) := '2D2D6665617475726564202E742D43617264202E742D436172642D626F64792C0A2E742D436172642D2D6665617475726564202E742D436172642D626F6479207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D';
wwv_flow_api.g_varchar2_table(287) := '0A0A2E742D436C617373696343616C656E6461722D6D6F6E74685469746C65207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D436C617373696343616C656E6461722D646179436F6C756D6E207B0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(288) := '6C6F723A20236661666166613B0A2020766572746963616C2D616C69676E3A20746F703B0A2020626F726465722D636F6C6F723A20236632663266323B0A2020636F6C6F723A20233236323632363B0A7D0A2E742D436C617373696343616C656E646172';
wwv_flow_api.g_varchar2_table(289) := '2D646179207B0A2020626F726465722D636F6C6F723A20236632663266323B0A7D0A2E742D436C617373696343616C656E6461722D6461792E69732D696E616374697665202E742D436C617373696343616C656E6461722D64617465207B0A20206F7061';
wwv_flow_api.g_varchar2_table(290) := '636974793A202E353B0A7D0A2E742D436C617373696343616C656E6461722D6461792E69732D7765656B656E642C0A2E742D436C617373696343616C656E6461722D6461792E69732D696E616374697665207B0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(291) := '6F723A20236663666366633B0A7D0A2E742D436C617373696343616C656E6461722D6461792E69732D746F646179202E742D436C617373696343616C656E6461722D64617465207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131';
wwv_flow_api.g_varchar2_table(292) := '362C203135322C203138352C20302E3933293B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D436C617373696343616C656E6461722D64617465207B0A2020636F6C6F723A2023343034303430';
wwv_flow_api.g_varchar2_table(293) := '3B0A7D0A2E742D436C617373696343616C656E6461722D6576656E74207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A7D0A2E742D436C617373696343616C656E6461722D6576656E74207B0A2020636F6C6F723A202330';
wwv_flow_api.g_varchar2_table(294) := '30303030303B0A7D0A2E742D436C617373696343616C656E6461722D6576656E742061207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020636F6C6F723A20726762612832';
wwv_flow_api.g_varchar2_table(295) := '35352C203235352C203235352C20302E3933293B0A7D0A2E742D436C617373696343616C656E6461722D2D7765656B6C79202E742D436C617373696343616C656E6461722D74696D65436F6C2C0A2E742D436C617373696343616C656E6461722D2D6461';
wwv_flow_api.g_varchar2_table(296) := '696C79202E742D436C617373696343616C656E6461722D74696D65436F6C207B0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0A7D0A2E742D436C617373696343616C656E6461722D2D7765656B6C79202E742D436C61737369';
wwv_flow_api.g_varchar2_table(297) := '6343616C656E6461722D6461794576656E74732C0A2E742D436C617373696343616C656E6461722D2D6461696C79202E742D436C617373696343616C656E6461722D6461794576656E7473207B0A2020636F6C6F723A20233030303030303B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(298) := '2D436C617373696343616C656E6461722D2D7765656B6C79202E742D436C617373696343616C656E6461722D6461794576656E747320612C0A2E742D436C617373696343616C656E6461722D2D6461696C79202E742D436C617373696343616C656E6461';
wwv_flow_api.g_varchar2_table(299) := '722D6461794576656E74732061207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D';
wwv_flow_api.g_varchar2_table(300) := '0A2E742D436C617373696343616C656E6461722D2D7765656B6C79202E742D436C617373696343616C656E6461722D6461792E69732D746F6461792C0A2E742D436C617373696343616C656E6461722D2D6461696C79202E742D436C617373696343616C';
wwv_flow_api.g_varchar2_table(301) := '656E6461722D6461792E69732D746F646179207B0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D436C617373696343616C656E6461722D6C697374207B0A2020626F';
wwv_flow_api.g_varchar2_table(302) := '726465722D636F6C6F723A20236632663266323B0A7D0A2E742D436C617373696343616C656E6461722D6C6973745469746C652C0A2E742D436C617373696343616C656E6461722D6C6973744576656E74207B0A2020626F726465722D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(303) := '236632663266323B0A7D0A2E742D436C617373696343616C656E6461722D6C6973745469746C65207B0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0A2020636F6C6F723A20233236323632363B0A7D0A2E742D436C61737369';
wwv_flow_api.g_varchar2_table(304) := '6343616C656E6461722D6C6973744576656E74207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D436F6D6D656E74732D7573657249636F6E2C0A2E742D436F6D6D656E74732D75736572496D67207B0A2020626F726465722D7261646975';
wwv_flow_api.g_varchar2_table(305) := '733A20313030253B0A7D0A2E742D436F6D6D656E74732D7573657249636F6E207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D436F6D6D656E74732D696E666F207B0A2020636F6C6F723A2023363636363636';
wwv_flow_api.g_varchar2_table(306) := '3B0A7D0A2E742D436F6D6D656E74732D636F6D6D656E74207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D436F6D6D656E74732D2D63686174202E742D436F6D6D656E74732D696E666F207B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(307) := '723A20236666666666663B0A2020626F726465722D7261646975733A2032707820327078203020303B0A2020626F726465722D636F6C6F723A20236536653665363B0A7D0A2E742D436F6D6D656E74732D2D63686174202E742D436F6D6D656E74732D69';
wwv_flow_api.g_varchar2_table(308) := '6E666F3A6166746572207B0A2020626F726465722D636F6C6F723A2072676261283234382C203234382C203234382C2030293B0A2020626F726465722D72696768742D636F6C6F723A20236666666666663B0A7D0A2E742D436F6D6D656E74732D2D6368';
wwv_flow_api.g_varchar2_table(309) := '6174202E742D436F6D6D656E74732D696E666F3A6265666F7265207B0A2020626F726465722D636F6C6F723A2072676261283233322C203233322C203233322C2030293B0A2020626F726465722D72696768742D636F6C6F723A20236536653665363B0A';
wwv_flow_api.g_varchar2_table(310) := '7D0A2E742D436F6D6D656E74732D2D63686174202E742D436F6D6D656E74732D636F6D6D656E74207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020626F726465722D7261646975733A2030203020327078203270783B';
wwv_flow_api.g_varchar2_table(311) := '0A2020626F726465722D636F6C6F723A20236536653665363B0A7D0A2E742D436F6E66696750616E656C2D61626F7574207B0A20206261636B67726F756E642D636F6C6F723A20236666663765303B0A2020636F6C6F723A20233536353635363B0A7D0A';
wwv_flow_api.g_varchar2_table(312) := '2E742D436F6E66696750616E656C2D69636F6E207B0A2020626F726465722D7261646975733A20313030253B0A20206261636B67726F756E642D636F6C6F723A20234130413041303B0A2020636F6C6F723A20234646463B0A7D0A2E742D436F6E666967';
wwv_flow_api.g_varchar2_table(313) := '50616E656C2D69636F6E2E69732D656E61626C6564207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A7D0A2E742D436F6E66696750616E656C2D69636F6E2E69732D64697361626C6564207B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(314) := '642D636F6C6F723A20236539306330303B0A7D0A2E742D436F6E66696750616E656C2D73657474696E672C0A2E742D436F6E66696750616E656C2D737461747573207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D436F6E66696750616E';
wwv_flow_api.g_varchar2_table(315) := '656C2D737461747573207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D436F6E66696750616E656C2D617474724C696E6B207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D436F6E66696750616E656C2D617474724C696E';
wwv_flow_api.g_varchar2_table(316) := '6B3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0A7D0A2E742D436F6E66696750616E656C2D6174747256616C7565207B0A2020636F6C6F723A20233030316164663B0A7D0A';
wwv_flow_api.g_varchar2_table(317) := '0A2E742D4469616C6F67526567696F6E2D626F6479207B0A20206261636B67726F756E643A202D7765626B69742D6C696E6561722D6772616469656E742823666666666666203330252C2023666666666666292C202D7765626B69742D6C696E6561722D';
wwv_flow_api.g_varchar2_table(318) := '6772616469656E7428236666666666662C20236666666666662037302529203020313030252C202D7765626B69742D6C696E6561722D6772616469656E74287267626128302C20302C20302C20302E3035292C207267626128302C20302C20302C203029';
wwv_flow_api.g_varchar2_table(319) := '292C202D7765626B69742D6C696E6561722D6772616469656E74287267626128302C20302C20302C2030292C207267626128302C20302C20302C20302E303529293B0A20206261636B67726F756E643A202D6F2D6C696E6561722D6772616469656E7428';
wwv_flow_api.g_varchar2_table(320) := '23666666666666203330252C2023666666666666292C202D6F2D6C696E6561722D6772616469656E7428236666666666662C20236666666666662037302529203020313030252C202D6F2D6C696E6561722D6772616469656E74287267626128302C2030';
wwv_flow_api.g_varchar2_table(321) := '2C20302C20302E3035292C207267626128302C20302C20302C203029292C202D6F2D6C696E6561722D6772616469656E74287267626128302C20302C20302C2030292C207267626128302C20302C20302C20302E303529293B0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(322) := '6E643A206C696E6561722D6772616469656E742823666666666666203330252C2023666666666666292C206C696E6561722D6772616469656E7428236666666666662C20236666666666662037302529203020313030252C206C696E6561722D67726164';
wwv_flow_api.g_varchar2_table(323) := '69656E74287267626128302C20302C20302C20302E3035292C207267626128302C20302C20302C203029292C206C696E6561722D6772616469656E74287267626128302C20302C20302C2030292C207267626128302C20302C20302C20302E3035292920';
wwv_flow_api.g_varchar2_table(324) := '3020313030253B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A0A2E742D466F6F7465722C0A2E742D466F6F7465722061207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D466F726D2D696E707574436F';
wwv_flow_api.g_varchar2_table(325) := '6E7461696E65723A6265666F7265207B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D466F726D2D6669656C642C0A2E742D466F726D2D73656C6563742C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075745B747970';
wwv_flow_api.g_varchar2_table(326) := '653D2274657874225D2C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E73656C6563746C6973742C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E7965735F6E6F2C0A2E742D466F726D2D69';
wwv_flow_api.g_varchar2_table(327) := '6E707574436F6E7461696E657220696E7075742E746578745F6669656C642C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E70617373776F72642C0A2E742D466F726D2D696E707574436F6E7461696E657220746578746172';
wwv_flow_api.g_varchar2_table(328) := '65612E74657874617265612C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E646174657069636B65722C0A2E742D466F726D2D696E707574436F6E7461696E6572207370616E2E646973706C61795F6F6E6C792C0A2E742D46';
wwv_flow_api.g_varchar2_table(329) := '6F726D2D696E707574436F6E7461696E657220696E7075742E706F7075705F6C6F762C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563745B6D756C7469706C655D2C0A2E742D466F726D2D74657874617265612C0A2E752D5446';
wwv_flow_api.g_varchar2_table(330) := '2D6974656D2D2D746578742C0A2E752D54462D6974656D2D2D74657874617265612C0A2E752D54462D6974656D2D2D646174657069636B65722C0A2E752D54462D6974656D2D2D73656C656374207B0A2020626F726465722D7261646975733A20307078';
wwv_flow_api.g_varchar2_table(331) := '3B0A2020636F6C6F723A20233333333333333B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A2020626F726465722D636F6C6F723A20236439643964393B0A7D0A2E742D466F726D2D6669656C643A666F6375732C0A2E742D';
wwv_flow_api.g_varchar2_table(332) := '466F726D2D73656C6563743A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075745B747970653D2274657874225D3A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E7365';
wwv_flow_api.g_varchar2_table(333) := '6C6563746C6973743A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E7965735F6E6F3A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E746578745F6669656C643A';
wwv_flow_api.g_varchar2_table(334) := '666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E70617373776F72643A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E65722074657874617265612E74657874617265613A666F6375732C0A';
wwv_flow_api.g_varchar2_table(335) := '2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E646174657069636B65723A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E6572207370616E2E646973706C61795F6F6E6C793A666F6375732C0A2E742D466F';
wwv_flow_api.g_varchar2_table(336) := '726D2D696E707574436F6E7461696E657220696E7075742E706F7075705F6C6F763A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563745B6D756C7469706C655D3A666F6375732C0A2E742D466F726D2D74657874';
wwv_flow_api.g_varchar2_table(337) := '617265613A666F6375732C0A2E752D54462D6974656D2D2D746578743A666F6375732C0A2E752D54462D6974656D2D2D74657874617265613A666F6375732C0A2E752D54462D6974656D2D2D646174657069636B65723A666F6375732C0A2E752D54462D';
wwv_flow_api.g_varchar2_table(338) := '6974656D2D2D73656C6563743A666F637573207B0A20206261636B67726F756E642D636F6C6F723A20236666666666662021696D706F7274616E743B0A2020626F726465722D636F6C6F723A2072676261283131362C203135322C203138352C20302E39';
wwv_flow_api.g_varchar2_table(339) := '33292021696D706F7274616E743B0A7D0A2E742D466F726D2D6669656C643A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D73656C6563743A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574436F6E7461';
wwv_flow_api.g_varchar2_table(340) := '696E657220696E7075745B747970653D2274657874225D3A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E73656C6563746C6973743A666F6375733A3A2D6D732D76616C75652C';
wwv_flow_api.g_varchar2_table(341) := '0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E7965735F6E6F3A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E746578745F6669656C643A666F6375';
wwv_flow_api.g_varchar2_table(342) := '733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E70617373776F72643A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574436F6E7461696E65722074657874617265';
wwv_flow_api.g_varchar2_table(343) := '612E74657874617265613A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E646174657069636B65723A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574';
wwv_flow_api.g_varchar2_table(344) := '436F6E7461696E6572207370616E2E646973706C61795F6F6E6C793A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E706F7075705F6C6F763A666F6375733A3A2D6D732D76616C75';
wwv_flow_api.g_varchar2_table(345) := '652C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563745B6D756C7469706C655D3A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D74657874617265613A666F6375733A3A2D6D732D76616C75652C0A2E752D54';
wwv_flow_api.g_varchar2_table(346) := '462D6974656D2D2D746578743A666F6375733A3A2D6D732D76616C75652C0A2E752D54462D6974656D2D2D74657874617265613A666F6375733A3A2D6D732D76616C75652C0A2E752D54462D6974656D2D2D646174657069636B65723A666F6375733A3A';
wwv_flow_api.g_varchar2_table(347) := '2D6D732D76616C75652C0A2E752D54462D6974656D2D2D73656C6563743A666F6375733A3A2D6D732D76616C7565207B0A2020636F6C6F723A20233333333333333B0A20200A7D0A2E742D466F726D2D6669656C643A686F7665722C0A2E742D466F726D';
wwv_flow_api.g_varchar2_table(348) := '2D73656C6563743A686F7665722C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075745B747970653D2274657874225D3A686F7665722C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E73656C656374';
wwv_flow_api.g_varchar2_table(349) := '6C6973743A686F7665722C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E7965735F6E6F3A686F7665722C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E746578745F6669656C643A686F7665';
wwv_flow_api.g_varchar2_table(350) := '722C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E70617373776F72643A686F7665722C0A2E742D466F726D2D696E707574436F6E7461696E65722074657874617265612E74657874617265613A686F7665722C0A2E742D46';
wwv_flow_api.g_varchar2_table(351) := '6F726D2D696E707574436F6E7461696E657220696E7075742E646174657069636B65723A686F7665722C0A2E742D466F726D2D696E707574436F6E7461696E6572207370616E2E646973706C61795F6F6E6C793A686F7665722C0A2E742D466F726D2D69';
wwv_flow_api.g_varchar2_table(352) := '6E707574436F6E7461696E657220696E7075742E706F7075705F6C6F763A686F7665722C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563745B6D756C7469706C655D3A686F7665722C0A2E742D466F726D2D7465787461726561';
wwv_flow_api.g_varchar2_table(353) := '3A686F7665722C0A2E752D54462D6974656D2D2D746578743A686F7665722C0A2E752D54462D6974656D2D2D74657874617265613A686F7665722C0A2E752D54462D6974656D2D2D646174657069636B65723A686F7665722C0A2E752D54462D6974656D';
wwv_flow_api.g_varchar2_table(354) := '2D2D73656C6563743A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075743A3A2D7765626B69742D696E7075742D706C616365686F6C';
wwv_flow_api.g_varchar2_table(355) := '646572207B0A2020636F6C6F723A20233030303030303B0A20206F7061636974793A202E35353B0A7D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075743A3A2D6D6F7A2D706C616365686F6C646572207B0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(356) := '233030303030303B0A20206F7061636974793A202E35353B0A7D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075743A2D6D732D696E7075742D706C616365686F6C646572207B0A2020636F6C6F723A20233030303030303B0A2020';
wwv_flow_api.g_varchar2_table(357) := '6F7061636974793A202E35353B0A7D0A2E742D466F726D20696E7075742E66696C65207B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D466F726D2D696E707574436F6E7461696E6572207370616E2E646973706C61795F6F6E6C79207B0A';
wwv_flow_api.g_varchar2_table(358) := '2020626F726465722D636F6C6F723A207472616E73706172656E743B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D466F726D2D73656C6563742C0A2E742D466F726D2D696E707574436F6E7461696E';
wwv_flow_api.g_varchar2_table(359) := '65722073656C6563742E73656C6563746C6973742C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E7965735F6E6F207B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D466F726D2D6669656C642D2D72656164';
wwv_flow_api.g_varchar2_table(360) := '4F6E6C79207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D466F726D2D726164696F4C6162656C2C0A2E742D466F726D2D696E707574436F6E7461696E6572202E726164696F5F67726F7570206C61';
wwv_flow_api.g_varchar2_table(361) := '62656C2C0A2E742D466F726D2D636865636B626F784C6162656C2C0A2E742D466F726D2D696E707574436F6E7461696E6572202E636865636B626F785F67726F7570206C6162656C2C0A2E742D466F726D2D6C6162656C207B0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(362) := '3064306430643B0A7D0A2E742D466F726D2D6572726F72207B0A2020636F6C6F723A20234539323032303B0A7D0A2E742D466F726D2D706F737454657874207B0A2020636F6C6F723A20233863386338633B0A7D0A2E742D466F726D2D2D736561726368';
wwv_flow_api.g_varchar2_table(363) := '20696E7075742E742D466F726D2D7365617263684669656C64207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D4865726F526567696F6E2D666F726D20696E7075';
wwv_flow_api.g_varchar2_table(364) := '745B747970653D746578745D2E742D466F726D2D7365617263684669656C64207B0A20206261636B67726F756E642D636F6C6F723A20236334646165393B0A2020626F726465722D636F6C6F723A20233761616363643B0A7D0A2E742D4865726F526567';
wwv_flow_api.g_varchar2_table(365) := '696F6E2D666F726D20696E7075745B747970653D746578745D2E742D466F726D2D7365617263684669656C643A666F637573207B0A20206261636B67726F756E642D636F6C6F723A20236666666666662021696D706F7274616E743B0A2020626F726465';
wwv_flow_api.g_varchar2_table(366) := '722D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933292021696D706F7274616E743B0A7D0A2E742D4865726F526567696F6E2D666F726D20696E7075745B747970653D746578745D2E742D466F726D2D7365617263684669';
wwv_flow_api.g_varchar2_table(367) := '656C643A3A2D7765626B69742D696E7075742D706C616365686F6C646572207B0A2020636F6C6F723A20233030303030303B0A20206F7061636974793A202E35353B0A7D0A2E742D4865726F526567696F6E2D666F726D20696E7075745B747970653D74';
wwv_flow_api.g_varchar2_table(368) := '6578745D2E742D466F726D2D7365617263684669656C643A3A2D6D6F7A2D706C616365686F6C646572207B0A2020636F6C6F723A20233030303030303B0A20206F7061636974793A202E35353B0A7D0A2E742D4865726F526567696F6E2D666F726D2069';
wwv_flow_api.g_varchar2_table(369) := '6E7075745B747970653D746578745D2E742D466F726D2D7365617263684669656C643A2D6D732D696E7075742D706C616365686F6C646572207B0A2020636F6C6F723A20233030303030303B0A20206F7061636974793A202E35353B0A7D0A2E742D466F';
wwv_flow_api.g_varchar2_table(370) := '726D2D696E707574436F6E7461696E657220696E7075742E686173446174657069636B65722C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E706F7075705F6C6F76207B0A2020626F726465722D746F702D72696768742D72';
wwv_flow_api.g_varchar2_table(371) := '61646975733A20303B0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A20303B0A7D0A2E612D427574746F6E2E612D427574746F6E2D2D63616C656E6461722C0A2E612D427574746F6E2E612D427574746F6E2D2D706F707570';
wwv_flow_api.g_varchar2_table(372) := '4C4F56207B0A2020626F726465722D746F702D6C6566742D7261646975733A20303B0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A20303B0A2020626F726465722D746F702D72696768742D7261646975733A203070783B0A20';
wwv_flow_api.g_varchar2_table(373) := '20626F726465722D626F74746F6D2D72696768742D7261646975733A203070783B0A7D0A0A2E742D4865616465722D6272616E64696E67207B0A20206261636B67726F756E642D636F6C6F723A20233235346437323B0A7D0A2E742D4865616465722D6C';
wwv_flow_api.g_varchar2_table(374) := '6F676F2D6C696E6B2C0A2E742D486561646572202E742D427574746F6E2E742D427574746F6E2D2D6865616465722E69732D6163746976652C0A2E742D486561646572202E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574';
wwv_flow_api.g_varchar2_table(375) := '746F6E2D2D686561646572207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D4865616465722D6C6F676F2D6C696E6B3A686F7665722C0A2E742D486561646572202E742D427574746F6E2E742D427574746F6E2D2D6865616465722E6973';
wwv_flow_api.g_varchar2_table(376) := '2D6163746976653A686F7665722C0A2E742D486561646572202E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D6865616465723A686F766572207B0A2020746578742D6465636F726174696F6E3A206E6F6E65';
wwv_flow_api.g_varchar2_table(377) := '3B0A7D0A2E742D4865616465722D6C6F676F2D6C696E6B3A666F6375732C0A2E742D4865616465722D6C6F676F2D6C696E6B3A6163746976653A666F637573207B0A20206F75746C696E653A206E6F6E653B0A2020626F782D736861646F773A20302030';
wwv_flow_api.g_varchar2_table(378) := '2030203170782072676261283136372C203139302C203231312C20302E39332920696E7365742C2030203020317078203270782072676261283136372C203139302C203231312C20302E3235292021696D706F7274616E743B0A7D0A2E742D4865616465';
wwv_flow_api.g_varchar2_table(379) := '722D6E6176207B0A20206261636B67726F756E642D636F6C6F723A20726762612835382C203130332C203134332C20302E3933293B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D3A686F766572207B0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(380) := '6E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A2020626F726465722D7261646975733A2031';
wwv_flow_api.g_varchar2_table(381) := '3030253B0A7D0A2E742D486561646572202E612D4D656E752E612D4D656E752D2D746F70203E202E612D4D656E752D636F6E74656E74207B0A2020626F726465722D746F702D77696474683A20303B0A7D0A2E742D486561646572202E612D4D656E752D';
wwv_flow_api.g_varchar2_table(382) := '636F6E74656E74207B0A2020626F782D736861646F773A20302032707820367078207267626128302C20302C20302C20302E3135293B0A7D0A2E742D4865616465722D6E61762D6C697374207B0A20206261636B67726F756E642D636F6C6F723A207472';
wwv_flow_api.g_varchar2_table(383) := '616E73706172656E743B0A7D0A2E742D4865726F526567696F6E207B0A20206261636B67726F756E642D636F6C6F723A20233966633364623B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D4865726F526567696F6E2D7469746C65207B0A';
wwv_flow_api.g_varchar2_table(384) := '2020636F6C6F723A20233030303030303B0A7D0A2E742D4865726F526567696F6E2D69636F6E207B0A2020626F726465722D7261646975733A203470783B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138';
wwv_flow_api.g_varchar2_table(385) := '352C20302E3933293B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D4865726F526567696F6E2D2D6665617475726564207B0A20206261636B67726F756E642D636F6C6F723A207472616E7370';
wwv_flow_api.g_varchar2_table(386) := '6172656E743B0A7D0A2E742D4865726F526567696F6E2D2D66656174757265642C0A2E742D4865726F526567696F6E2D2D6665617475726564202E742D4865726F526567696F6E2D7469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A';
wwv_flow_api.g_varchar2_table(387) := '0A2E612D495252207B0A2020626F726465722D7261646975733A203070783B0A2020626F726465722D636F6C6F723A20236536653665363B0A7D0A2E612D495252202E612D4952522D706167696E6174696F6E2D6C6162656C207B0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(388) := '20233733373337333B0A7D0A2E612D4952522D7265706F727453756D6D6172792D76616C7565207B0A2020636F6C6F723A20233430343034303B0A7D0A2E612D4952522D636F6E74726F6C73436F6E7461696E6572207B0A2020626F726465722D746F70';
wwv_flow_api.g_varchar2_table(389) := '2D636F6C6F723A20236635663566353B0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0A7D0A2E612D4952522D66756C6C56696577207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E612D';
wwv_flow_api.g_varchar2_table(390) := '4952522D627574746F6E2E612D4952522D627574746F6E2D2D636F6E74726F6C73207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E612D4952522D736F7274576964676574207B0A2020626F782D736861';
wwv_flow_api.g_varchar2_table(391) := '646F773A20302032707820347078207267626128302C20302C20302C20302E31293B0A7D0A2E612D4952522D746F6F6C626172207B0A20206261636B67726F756E643A206C696E6561722D6772616469656E7428236465656666362C2023623664636562';
wwv_flow_api.g_varchar2_table(392) := '293B0A2020626F726465722D636F6C6F723A20233865633965303B0A7D0A2E612D5265706F72742D70657263656E7443686172742D66696C6C207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20';
wwv_flow_api.g_varchar2_table(393) := '302E3933293B0A7D0A2E612D5265706F72742D70657263656E744368617274207B0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E612D4952522D627574746F6E2D2D636F';
wwv_flow_api.g_varchar2_table(394) := '6C536561726368207B0A20202D7765626B69742D626F726465722D746F702D72696768742D7261646975733A203070782021696D706F7274616E743B0A20202D7765626B69742D626F726465722D626F74746F6D2D72696768742D7261646975733A2030';
wwv_flow_api.g_varchar2_table(395) := '70782021696D706F7274616E743B0A20202D6D6F7A2D626F726465722D7261646975732D746F7072696768743A20307078202021696D706F7274616E743B0A20202D6D6F7A2D626F726465722D7261646975732D626F74746F6D72696768743A20307078';
wwv_flow_api.g_varchar2_table(396) := '2021696D706F7274616E743B0A2020626F726465722D746F702D72696768742D7261646975733A203070782021696D706F7274616E743B0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A203070782021696D706F7274616E74';
wwv_flow_api.g_varchar2_table(397) := '3B0A7D0A2E612D4952522D69636F6E566965775461626C652C0A2E612D4952522D6368617274566965772C0A2E612D4952522D7069766F74566965772C0A2E612D4952522D67726F75704279566965772C0A2E612D4952522D64657461696C5669657720';
wwv_flow_api.g_varchar2_table(398) := '7B0A2020626F726465722D746F702D636F6C6F723A20236635663566353B0A7D0A2E612D4952522D746F6F6C6261722D2D73696E676C65526F77207B0A2020626F726465722D626F74746F6D2D636F6C6F723A20236630663066303B0A7D0A2E612D4952';
wwv_flow_api.g_varchar2_table(399) := '522D686561646572207B0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0A2020626F726465722D746F703A2031707820736F6C696420236536653665363B0A2020626F782D736861646F773A20696E7365742031707820302030';
wwv_flow_api.g_varchar2_table(400) := '203020236536653665363B0A7D0A2E612D4952522D6865616465723A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A7D0A2E612D4952522D6865616465722E69732D616374697665207B0A20206261636B67';
wwv_flow_api.g_varchar2_table(401) := '726F756E642D636F6C6F723A20233462373239353B0A2020626F726465722D626F74746F6D3A206E6F6E653B0A7D0A2E612D4952522D6865616465722E69732D6163746976652061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E612D4952';
wwv_flow_api.g_varchar2_table(402) := '522D6865616465722E69732D616374697665202E612D4952522D686561646572536F7274207B0A2020636F6C6F723A20236666666666663B0A7D0A2E612D4952522D6865616465722D2D67726F7570207B0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(403) := '3A20236635663566353B0A7D0A2E612D4952522D7461626C65207472207464207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233430343034303B0A7D0A2E612D4952522D7461626C65207B0A2020';
wwv_flow_api.g_varchar2_table(404) := '626F726465722D636F6C6C617073653A2073657061726174653B0A7D0A2E612D4952522D7461626C652074723A686F766572207464207B0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0A7D0A2E742D4952522D726567696F6E';
wwv_flow_api.g_varchar2_table(405) := '2D2D6E6F426F7264657273202E612D495252207B0A2020626F726465722D7261646975733A203070783B0A7D0A626F6479202E612D4952522D736F72745769646765742D726F7773207B0A2020636F6C6F723A20236666666666663B0A2020626F726465';
wwv_flow_api.g_varchar2_table(406) := '722D746F703A2031707820736F6C696420233235336335313B0A20206261636B67726F756E643A20233335353637343B0A7D0A626F6479202E612D4952522D736F72745769646765742D726F77207B0A2020636F6C6F723A20236666666666663B0A2020';
wwv_flow_api.g_varchar2_table(407) := '626F782D736861646F773A2030202D3170782030202334623732393520696E7365743B0A7D0A2E612D4952522D736F72745769646765742D736561726368203E202E612D4952522D736F72745769646765742D7365617263684669656C642C0A2E612D49';
wwv_flow_api.g_varchar2_table(408) := '52522D736F72745769646765742D736561726368203E202E612D4952522D736F72745769646765742D7365617263684669656C645B747970653D2274657874225D207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E643A20';
wwv_flow_api.g_varchar2_table(409) := '233462373239353B0A7D0A2E612D4952522D736F72745769646765742D726F773A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20233462373239353B0A7D0A626F6479202E612D4952522D627574746F6E2E612D4952522D736F72';
wwv_flow_api.g_varchar2_table(410) := '745769646765742D627574746F6E2C0A626F6479202E612D4952522D627574746F6E2E612D4952522D736F72745769646765742D627574746F6E3A6163746976653A666F637573207B0A2020636F6C6F723A2072676261283235352C203235352C203235';
wwv_flow_api.g_varchar2_table(411) := '352C20302E39293B0A20206261636B67726F756E642D636F6C6F723A20233462373239353B0A7D0A626F6479202E612D4952522D627574746F6E2E612D4952522D736F72745769646765742D627574746F6E3A686F7665722C0A626F6479202E612D4952';
wwv_flow_api.g_varchar2_table(412) := '522D627574746F6E2E612D4952522D736F72745769646765742D627574746F6E3A6163746976653A666F6375733A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20233633386362303B0A7D0A2E612D4952522D736F727457696467';
wwv_flow_api.g_varchar2_table(413) := '65742D616374696F6E73207B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420233235336335313B0A7D0A2E612D4952522D736F72745769646765742D616374696F6E732D6974656D207B0A2020626F726465722D72696768743A20';
wwv_flow_api.g_varchar2_table(414) := '6E6F6E653B0A7D0A2E612D4952522D736F7274576964676574207B0A2020626F726465723A206E6F6E653B0A7D0A2E612D4952522D7461626C65207464207B0A2020626F726465722D6C6566743A2031707820736F6C696420236632663266323B0A2020';
wwv_flow_api.g_varchar2_table(415) := '626F726465722D746F703A2031707820736F6C696420236632663266323B0A7D0A2E612D4952522D736F72745769646765742D7365617263684C6162656C207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E39293B0A';
wwv_flow_api.g_varchar2_table(416) := '7D0A2E612D4952522D736F72745769646765742D7365617263684C6162656C3A6265666F7265207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E35293B0A7D0A2E612D4952522D6865616465724C696E6B3A666F6375';
wwv_flow_api.g_varchar2_table(417) := '73207B0A2020626F782D736861646F773A203020302030203270782072676261283131362C203135322C203138352C20302E39332920696E7365743B0A7D0A2E612D4952522D7365617263682D6669656C643A666F637573207B0A2020626F726465722D';
wwv_flow_api.g_varchar2_table(418) := '636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020626F782D736861646F773A203020302030203170782072676261283131362C203135322C203138352C20302E39332920696E7365742C202D3270782030203020';
wwv_flow_api.g_varchar2_table(419) := '72676261283131362C203135322C203138352C20302E39332920696E7365742C20327078203020302072676261283131362C203135322C203138352C20302E39332920696E7365742C203020302032707820302072676261283131362C203135322C2031';
wwv_flow_api.g_varchar2_table(420) := '38352C20302E35293B0A7D0A2E612D4952522D73696E676C65526F772D6E616D652C0A2E612D4952522D73696E676C65526F772D76616C7565207B0A2020626F726465722D626F74746F6D2D636F6C6F723A20236630663066303B0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(421) := '20233430343034303B0A7D0A2E612D4952522D73696E676C65526F772D76616C7565207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E612D4952522D73696E676C65526F772D726F773A686F766572202E612D4952';
wwv_flow_api.g_varchar2_table(422) := '522D73696E676C65526F772D76616C7565207B0A20206261636B67726F756E642D636F6C6F723A20236637663766373B0A7D0A2E612D4952522D73696E676C65526F772D6E616D65207B0A20206261636B67726F756E642D636F6C6F723A202366376637';
wwv_flow_api.g_varchar2_table(423) := '66373B0A7D0A2E612D4952522D73696E676C65526F772D726F773A686F766572202E612D4952522D73696E676C65526F772D6E616D65207B0A20206261636B67726F756E642D636F6C6F723A20236630663066303B0A7D0A2E612D4952522D627574746F';
wwv_flow_api.g_varchar2_table(424) := '6E2E612D4952522D627574746F6E2D2D706167696E6174696F6E3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A7D0A2E612D4952522D7265706F727453756D';
wwv_flow_api.g_varchar2_table(425) := '6D6172792D6C6162656C2C0A2E612D4952522D636F6E74726F6C734C6162656C207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A';
wwv_flow_api.g_varchar2_table(426) := '20373639707829207B0A20202E69732D6D6178696D697A65642E742D4952522D726567696F6E202E742D6668742D7468656164202E612D4952522D686561646572207B0A20202020626F726465722D626F74746F6D3A2031707820736F6C696420236536';
wwv_flow_api.g_varchar2_table(427) := '653665363B0A20207D0A7D0A0A2E742D4C696E6B734C6973742D6974656D2C0A2E742D4C696E6B734C6973742D6C696E6B207B0A2020626F726465722D636F6C6F723A20236536653665363B0A7D0A2E742D4C696E6B734C6973742D69636F6E207B0A20';
wwv_flow_api.g_varchar2_table(428) := '20636F6C6F723A20236439643964393B0A7D0A2E742D4C696E6B734C6973742D6C696E6B3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A7D0A2E742D4C696E6B734C6973742D6C696E6B3A666F63757320';
wwv_flow_api.g_varchar2_table(429) := '7B0A2020626F782D736861646F773A203020302030203170782072676261283131362C203135322C203138352C20302E39332920696E7365743B0A7D0A0A2E742D4C696E6B734C6973742D2D73686F774172726F77202E742D4C696E6B734C6973742D6C';
wwv_flow_api.g_varchar2_table(430) := '696E6B3A6265666F7265207B0A2020636F6C6F723A20236439643964393B0A7D0A0A2E742D4C696E6B734C6973742D2D73686F774261646765202E742D4C696E6B734C6973742D6261646765207B0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(431) := '6635663566353B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D4C696E6B734C6973742D2D73686F774261646765202E742D4C696E6B734C6973742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D6261646765207B0A202062';
wwv_flow_api.g_varchar2_table(432) := '61636B67726F756E642D636F6C6F723A20236562656265623B0A7D0A2E742D4C696E6B734C6973742D2D73686F774261646765202E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564203E202E742D4C696E6B734C6973742D6C696E';
wwv_flow_api.g_varchar2_table(433) := '6B202E742D4C696E6B734C6973742D6261646765207B0A20206261636B67726F756E642D636F6C6F723A20236266626662663B0A7D0A0A2E742D4C696E6B734C6973742D2D627269676874486F766572202E742D4C696E6B734C6973742D6974656D2E69';
wwv_flow_api.g_varchar2_table(434) := '732D657870616E646564202E742D4C696E6B734C6973742D6C696E6B3A686F7665723A6265666F7265207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E35293B0A7D0A2E742D4C696E6B734C6973742D2D6272696768';
wwv_flow_api.g_varchar2_table(435) := '74486F766572202E742D4C696E6B734C6973742D6C696E6B3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020636F6C6F723A2072676261283235352C2032';
wwv_flow_api.g_varchar2_table(436) := '35352C203235352C20302E3933293B0A7D0A2E742D4C696E6B734C6973742D2D627269676874486F766572202E742D4C696E6B734C6973742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D69636F6E207B0A2020636F6C6F723A20726762';
wwv_flow_api.g_varchar2_table(437) := '61283235352C203235352C203235352C20302E3735293B0A7D0A2E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A20234643464346433B0A20206261636B67726F756E643A';
wwv_flow_api.g_varchar2_table(438) := '206C696E6561722D6772616469656E74287267626128302C20302C20302C20302E303135292C207267626128302C20302C20302C203029292C206C696E6561722D6772616469656E74287267626128302C20302C20302C2030292C207267626128302C20';
wwv_flow_api.g_varchar2_table(439) := '302C20302C20302E30313529293B0A7D0A2E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564202E742D4C696E6B734C6973742D6C696E6B3A686F7665723A6265666F7265207B0A2020636F6C6F723A2072676261283131362C2031';
wwv_flow_api.g_varchar2_table(440) := '35322C203138352C20302E3933293B0A7D0A2E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564202E742D4C696E6B734C6973742D6C696E6B3A6265666F7265207B0A2020636F6C6F723A207267626128302C20302C20302C20302E';
wwv_flow_api.g_varchar2_table(441) := '3235293B0A7D0A2E742D4C696E6B734C6973742D2D73686F774261646765202E742D4C696E6B734C6973742D6261646765207B0A2020626F726465722D7261646975733A203470783B0A7D0A2E742D4C696E6B734C6973742D2D69636F6E4F6E6C79202E';
wwv_flow_api.g_varchar2_table(442) := '742D4C696E6B734C6973742D69636F6E207B0A2020626F726465722D7261646975733A20313030253B0A7D0A2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C6973742D6C6162656C207B0A2020636F6C6F723A2023333333';
wwv_flow_api.g_varchar2_table(443) := '3333333B0A7D0A2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C6973742D69636F6E207B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C';
wwv_flow_api.g_varchar2_table(444) := '6973742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D69636F6E2C0A2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C6973742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D6C6162656C2C0A';
wwv_flow_api.g_varchar2_table(445) := '2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C6973742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D6261646765207B0A2020636F6C6F723A20233430343034303B0A7D0A0A2E742D4C6F67696E2D69636F';
wwv_flow_api.g_varchar2_table(446) := '6E56616C69646174696F6E207B0A20206261636B67726F756E643A20233463643936343B0A2020636F6C6F723A2077686974653B0A7D0A626F6479202E742D4C6F67696E2D7469746C65207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D';
wwv_flow_api.g_varchar2_table(447) := '4C6F67696E2D726567696F6E207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D4C6F67696E2D6C6F676F2E6661207B0A2020636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B';
wwv_flow_api.g_varchar2_table(448) := '0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20343830707829207B0A20202E742D50616765426F64792D2D6C6F67696E2C0A20202E742D50616765426F64792D2D6C6F67696E202E742D426F6479207B0A';
wwv_flow_api.g_varchar2_table(449) := '202020206261636B67726F756E642D636F6C6F723A20236666666666663B0A20207D0A7D0A0A2E742D4D656469614C6973742D6974656D207B0A2020626F726465722D636F6C6F723A20236439643964393B0A7D0A2E742D4D656469614C6973742D2D68';
wwv_flow_api.g_varchar2_table(450) := '6F72697A6F6E74616C202E742D4D656469614C6973742D6974656D207B0A2020626F726465722D72696768743A2031707820736F6C696420236439643964393B0A7D0A0A612E742D4D656469614C6973742D6974656D57726170207B0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(451) := '3A20233030316164663B0A7D0A612E742D4D656469614C6973742D6974656D577261703A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0A2020636F6C6F723A20233030316164663B0A7D0A612E742D4D6564';
wwv_flow_api.g_varchar2_table(452) := '69614C6973742D6974656D577261703A666F637573207B0A2020626F782D736861646F773A203020302030203170782072676261283131362C203135322C203138352C20302E39332920696E7365743B0A7D0A2E742D4D656469614C6973742D6974656D';
wwv_flow_api.g_varchar2_table(453) := '57726170207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D4D656469614C6973742D62616467652C0A2E742D4D656469614C6973742D64657363207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D4D656469614C6973742D';
wwv_flow_api.g_varchar2_table(454) := '69636F6E207B0A2020636F6C6F723A20236439643964393B0A7D0A2E742D4D656469614C6973742D2D636F6C73202E742D4D656469614C6973742D6974656D3A6265666F72652C0A2E742D4D656469614C6973742D2D636F6C73202E742D4D656469614C';
wwv_flow_api.g_varchar2_table(455) := '6973742D6974656D3A6166746572207B0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0A7D0A2E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933';
wwv_flow_api.g_varchar2_table(456) := '293B0A20206C696E652D6865696768743A20323070783B0A7D0A2E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C207B0A2020646973706C61793A20696E6C696E652D626C6F636B3B0A202070616464696E673A';
wwv_flow_api.g_varchar2_table(457) := '2038707820303B0A2020766572746963616C2D616C69676E3A20746F703B0A20206D617267696E2D72696768743A203870783B0A20206D617267696E2D6C6566743A202D3470783B0A7D0A2E612D4D656E754261722D6974656D207B0A20206261636B67';
wwv_flow_api.g_varchar2_table(458) := '726F756E643A20726762612835312C2039302C203132352C20302E3933293B0A2020626F726465722D72696768743A2031707820736F6C696420726762612836352C203131362C203136312C20302E3933293B0A2020626F726465722D6C6566743A2031';
wwv_flow_api.g_varchar2_table(459) := '707820736F6C696420726762612836352C203131362C203136312C20302E3933293B0A20206D617267696E2D6C6566743A202D3170783B0A7D0A2E612D4D656E754261722D6974656D3A66697273742D6368696C64207B0A20206D617267696E2D6C6566';
wwv_flow_api.g_varchar2_table(460) := '743A20303B0A7D0A2E612D4D656E754261722D6974656D2E612D4D656E752D2D73706C6974203E202E612D4D656E752D7375624D656E75436F6C2C0A2E612D4D656E754261722E752D72746C202E612D4D656E754261722D6974656D2E612D4D656E752D';
wwv_flow_api.g_varchar2_table(461) := '2D73706C6974203E202E612D4D656E752D7375624D656E75436F6C207B0A2020626F726465723A206E6F6E653B0A20206D617267696E2D72696768743A20303B0A202070616464696E673A203870782038707820387078203470783B0A7D0A2E612D4D65';
wwv_flow_api.g_varchar2_table(462) := '6E754261722D6974656D2E69732D64697361626C6564202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E35293B0A7D0A2E612D4D656E754261722D6974656D3A686F766572';
wwv_flow_api.g_varchar2_table(463) := '207B0A20206261636B67726F756E642D636F6C6F723A20726762612836352C203131362C203136312C20302E3933293B0A7D0A2E612D4D656E754261722D6974656D2E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(464) := '20726762612836352C203131362C203136312C20302E3933293B0A7D0A0A2E612D4D656E752D636F6E74656E74207B0A2020626F726465722D7261646975733A203270783B0A7D0A2E612D4D656E75202E612D4D656E752D6974656D207B0A2020636F6C';
wwv_flow_api.g_varchar2_table(465) := '6F723A20233430343034303B0A7D0A2E612D4D656E752D6974656D536570202E612D4D656E752D68536570617261746F72207B0A2020626F726465722D636F6C6F723A20236536653665363B0A7D0A2E612D4D656E752D2D63757272656E74207B0A2020';
wwv_flow_api.g_varchar2_table(466) := '6261636B67726F756E642D636F6C6F723A20726762612839302C203134322C203138382C20302E3933293B0A7D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D64697361626C65642E69732D666F6375736564207B0A20206261636B6772';
wwv_flow_api.g_varchar2_table(467) := '6F756E642D636F6C6F723A20236666666666663B0A7D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D64697361626C65642E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E752D7375624D656E75436F';
wwv_flow_api.g_varchar2_table(468) := '6C207B0A2020636F6C6F723A20233430343034303B0A7D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D64697361626C65642E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E752D616363656C207B0A';
wwv_flow_api.g_varchar2_table(469) := '2020636F6C6F723A20233830383038303B0A7D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D666F63757365642C0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564207B0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(470) := '2D636F6C6F723A20726762612835312C2039302C203132352C20302E3933293B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D666F637573';
wwv_flow_api.g_varchar2_table(471) := '6564203E202E612D4D656E752D696E6E6572202E612D4D656E752D737461747573436F6C2C0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564203E202E612D4D656E752D696E6E6572202E612D4D656E752D7374617475';
wwv_flow_api.g_varchar2_table(472) := '73436F6C2C0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E752D7375624D656E75436F6C2C0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D6578';
wwv_flow_api.g_varchar2_table(473) := '70616E646564203E202E612D4D656E752D696E6E6572202E612D4D656E752D7375624D656E75436F6C2C0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E752D61';
wwv_flow_api.g_varchar2_table(474) := '6363656C2C0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564203E202E612D4D656E752D696E6E6572202E612D4D656E752D616363656C207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20';
wwv_flow_api.g_varchar2_table(475) := '302E3933293B0A7D0A2E612D4D656E75202E612D4D656E752D616363656C207B0A2020636F6C6F723A20726762612836342C2036342C2036342C20302E3735293B0A7D0A2E612D4D656E752D636F6E74656E74207B0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(476) := '6F6C6F723A2072676261283235352C203235352C203235352C20302E3935293B0A2020626F726465722D636F6C6F723A20236536653665363B0A2020626F782D736861646F773A20302031707820327078207267626128302C20302C20302C20302E3035';
wwv_flow_api.g_varchar2_table(477) := '293B0A7D0A2E612D4D656E75426172207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D486561646572202E612D4D656E75426172207B0A20206261636B67726F756E642D636F6C6F723A2072676261';
wwv_flow_api.g_varchar2_table(478) := '2835312C2039302C203132352C20302E3933293B0A7D0A2E742D526567696F6E207B0A20200A7D0A2E742D526567696F6E202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A20233333333333333B0A20206C696E652D686569676874';
wwv_flow_api.g_varchar2_table(479) := '3A20323070783B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C207B0A2020646973706C61793A20696E6C696E652D626C6F636B3B0A202070616464696E673A203870782030';
wwv_flow_api.g_varchar2_table(480) := '3B0A2020766572746963616C2D616C69676E3A20746F703B0A20206D617267696E2D72696768743A203870783B0A20206D617267696E2D6C6566743A202D3470783B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D207B0A202062';
wwv_flow_api.g_varchar2_table(481) := '61636B67726F756E643A20236632663266323B0A2020626F726465722D72696768743A2031707820736F6C696420236439643964393B0A2020626F726465722D6C6566743A2031707820736F6C696420236439643964393B0A20206D617267696E2D6C65';
wwv_flow_api.g_varchar2_table(482) := '66743A202D3170783B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D3A66697273742D6368696C64207B0A20206D617267696E2D6C6566743A20303B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E612D';
wwv_flow_api.g_varchar2_table(483) := '4D656E752D2D73706C6974203E202E612D4D656E752D7375624D656E75436F6C2C0A2E742D526567696F6E202E612D4D656E754261722E752D72746C202E612D4D656E754261722D6974656D2E612D4D656E752D2D73706C6974203E202E612D4D656E75';
wwv_flow_api.g_varchar2_table(484) := '2D7375624D656E75436F6C207B0A2020626F726465723A206E6F6E653B0A20206D617267696E2D72696768743A20303B0A202070616464696E673A203870782038707820387078203470783B0A7D0A2E742D526567696F6E202E612D4D656E754261722D';
wwv_flow_api.g_varchar2_table(485) := '6974656D2E69732D64697361626C6564202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A20726762612835312C2035312C2035312C20302E35293B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D3A686F7665';
wwv_flow_api.g_varchar2_table(486) := '72207B0A20206261636B67726F756E642D636F6C6F723A20236439643964393B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A202364396439';
wwv_flow_api.g_varchar2_table(487) := '64393B0A7D0A2E742D526567696F6E202E612D4D656E752D636F6E74656E74207B0A2020626F726465722D7261646975733A203270783B0A7D0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D207B0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(488) := '233037313631623B0A7D0A2E742D526567696F6E202E612D4D656E752D6974656D536570202E612D4D656E752D68536570617261746F72207B0A2020626F726465722D636F6C6F723A20233865633965303B0A7D0A2E742D526567696F6E202E612D4D65';
wwv_flow_api.g_varchar2_table(489) := '6E752D2D63757272656E74207B0A20206261636B67726F756E642D636F6C6F723A20236266626662663B0A7D0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D64697361626C65642E69732D666F6375736564207B';
wwv_flow_api.g_varchar2_table(490) := '0A20206261636B67726F756E642D636F6C6F723A20236236646365623B0A7D0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D64697361626C65642E69732D666F6375736564203E202E612D4D656E752D696E6E65';
wwv_flow_api.g_varchar2_table(491) := '72202E612D4D656E752D7375624D656E75436F6C207B0A2020636F6C6F723A20233131313131313B0A7D0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D64697361626C65642E69732D666F6375736564203E202E';
wwv_flow_api.g_varchar2_table(492) := '612D4D656E752D696E6E6572202E612D4D656E752D616363656C207B0A2020636F6C6F723A20233531353135313B0A7D0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D666F63757365642C0A2E742D526567696F';
wwv_flow_api.g_varchar2_table(493) := '6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D526567696F6E202E612D4D';
wwv_flow_api.g_varchar2_table(494) := '656E75202E612D4D656E752D6974656D2E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E752D737461747573436F6C2C0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D657870';
wwv_flow_api.g_varchar2_table(495) := '616E646564203E202E612D4D656E752D696E6E6572202E612D4D656E752D737461747573436F6C2C0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E';
wwv_flow_api.g_varchar2_table(496) := '612D4D656E752D7375624D656E75436F6C2C0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564203E202E612D4D656E752D696E6E6572202E612D4D656E752D7375624D656E75436F6C2C0A2E74';
wwv_flow_api.g_varchar2_table(497) := '2D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E752D616363656C2C0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D697465';
wwv_flow_api.g_varchar2_table(498) := '6D2E69732D657870616E646564203E202E612D4D656E752D696E6E6572202E612D4D656E752D616363656C207B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D616363656C207B0A';
wwv_flow_api.g_varchar2_table(499) := '2020636F6C6F723A207267626128372C2032322C2032372C20302E3735293B0A7D0A2E742D526567696F6E202E612D4D656E752D636F6E74656E74207B0A20206261636B67726F756E642D636F6C6F723A2072676261283138322C203232302C20323335';
wwv_flow_api.g_varchar2_table(500) := '2C20302E3935293B0A2020626F726465722D636F6C6F723A20233865633965303B0A2020626F782D736861646F773A20302031707820327078207267626128302C20302C20302C20302E3035293B0A7D0A0A2E742D486561646572207B0A20200A20200A';
wwv_flow_api.g_varchar2_table(501) := '20200A20200A20200A20200A7D0A2E742D486561646572202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A2020766572746963616C2D616C69676E3A20746F70';
wwv_flow_api.g_varchar2_table(502) := '3B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D207B0A2020766572746963616C2D616C69676E3A20746F703B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D2E69732D666F63757365642C0A2E742D4865';
wwv_flow_api.g_varchar2_table(503) := '61646572202E612D4D656E754261722D6974656D3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20726762612837332C203132392C203137392C20302E3933292021696D706F7274616E743B0A7D0A2E742D486561646572202E61';
wwv_flow_api.g_varchar2_table(504) := '2D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742C0A2E742D486561646572202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564207B0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(505) := '6F6C6F723A20726762612837332C203132392C203137392C20302E3933292021696D706F7274616E743B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74202E612D4D656E754261722D6C61';
wwv_flow_api.g_varchar2_table(506) := '62656C2C0A2E742D486561646572202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A2072676261283235352C203235352C';
wwv_flow_api.g_varchar2_table(507) := '203235352C20302E3933292021696D706F7274616E743B0A2020666F6E742D7765696768743A20626F6C643B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D2E69732D657870616E6465642C0A2E742D486561646572202E612D4D';
wwv_flow_api.g_varchar2_table(508) := '656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A20726762612837332C203132392C203137392C20302E3933292021696D706F7274616E743B0A7D';
wwv_flow_api.g_varchar2_table(509) := '0A2E742D486561646572202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E38293B0A2020626F726465';
wwv_flow_api.g_varchar2_table(510) := '722D636F6C6F723A20726762612839302C203134322C203138382C20302E3933293B0A2020626F726465722D7261646975733A20313030253B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E';
wwv_flow_api.g_varchar2_table(511) := '742E69732D666F6375736564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E2C0A2E742D486561646572202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C3A686F766572202E612D49';
wwv_flow_api.g_varchar2_table(512) := '636F6E207B0A20206261636B67726F756E642D636F6C6F723A2072676261283132362C203136372C203230332C20302E3933293B0A2020626F726465722D636F6C6F723A2072676261283132362C203136372C203230332C20302E3933293B0A2020636F';
wwv_flow_api.g_varchar2_table(513) := '6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74203E202E612D4D656E752D7375624D656E75436F6C202E612D';
wwv_flow_api.g_varchar2_table(514) := '49636F6E207B0A2020636F6C6F723A2072676261283134342C203137392C203231302C20302E3933293B0A2020626F726465722D636F6C6F723A2072676261283134342C203137392C203231302C20302E3933293B0A7D0A2E742D486561646572202E61';
wwv_flow_api.g_varchar2_table(515) := '2D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A2072676261283235';
wwv_flow_api.g_varchar2_table(516) := '352C203235352C203235352C20302E3933293B0A2020626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A2020636F6C6F723A20726762612836342C2036342C2036342C20302E3933293B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(517) := '2D486561646572202E612D4D656E754261722D6974656D2E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A2072676261283230362C20323231';
wwv_flow_api.g_varchar2_table(518) := '2C203233352C20302E3933293B0A2020626F726465722D636F6C6F723A2072676261283230362C203232312C203233352C20302E3933293B0A2020636F6C6F723A20726762612834332C2037372C203130372C20302E3933293B0A7D0A2E742D48656164';
wwv_flow_api.g_varchar2_table(519) := '6572202E612D4D656E752D636F6E74656E74207B0A2020626F726465722D77696474683A20303B0A20206261636B67726F756E642D636F6C6F723A20726762612837332C203132392C203137392C20302E3933293B0A7D0A2E742D486561646572202E61';
wwv_flow_api.g_varchar2_table(520) := '2D4D656E75202E612D4D656E752D6974656D207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D486561646572202E612D4D656E752D616363656C207B0A2020636F6C6F723A20726762612832';
wwv_flow_api.g_varchar2_table(521) := '35352C203235352C203235352C20302E3735293B0A7D0A2E742D486561646572202E612D4D656E75202E612D4D656E752D6974656D2E69732D666F63757365642C0A2E742D486561646572202E612D4D656E75202E612D4D656E752D6974656D2E69732D';
wwv_flow_api.g_varchar2_table(522) := '657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A20726762612836352C203131362C203136312C20302E3933292021696D706F7274616E743B0A7D0A2E742D426F6479207B0A20200A20200A20200A20200A20200A20200A7D0A';
wwv_flow_api.g_varchar2_table(523) := '2E742D426F6479202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A20233430343034303B0A2020766572746963616C2D616C69676E3A20746F703B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D207B0A20207665';
wwv_flow_api.g_varchar2_table(524) := '72746963616C2D616C69676E3A20746F703B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D2E69732D666F63757365642C0A2E742D426F6479202E612D4D656E754261722D6974656D3A686F766572207B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(525) := '642D636F6C6F723A2072676261283233302C203233302C203233302C2030292021696D706F7274616E743B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742C0A2E742D426F6479202E612D4D65';
wwv_flow_api.g_varchar2_table(526) := '6E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564207B0A20206261636B67726F756E642D636F6C6F723A2072676261283233302C203233302C203233302C2030292021696D706F7274616E743B0A7D0A2E742D';
wwv_flow_api.g_varchar2_table(527) := '426F6479202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74202E612D4D656E754261722D6C6162656C2C0A2E742D426F6479202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F';
wwv_flow_api.g_varchar2_table(528) := '6375736564202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A20233430343034302021696D706F7274616E743B0A2020666F6E742D7765696768743A20626F6C643B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D';
wwv_flow_api.g_varchar2_table(529) := '2E69732D657870616E6465642C0A2E742D426F6479202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A2072676261283233302C203233';
wwv_flow_api.g_varchar2_table(530) := '302C203233302C2030292021696D706F7274616E743B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A2020636F6C6F723A20726762612836342C203634';
wwv_flow_api.g_varchar2_table(531) := '2C2036342C20302E38293B0A2020626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C2030293B0A2020626F726465722D7261646975733A20313030253B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D';
wwv_flow_api.g_varchar2_table(532) := '2E612D4D656E752D2D63757272656E742E69732D666F6375736564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E2C0A2E742D426F6479202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E7543';
wwv_flow_api.g_varchar2_table(533) := '6F6C3A686F766572202E612D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A2072676261283139312C203139312C203139312C2030293B0A2020626F726465722D636F6C6F723A2072676261283139312C203139312C203139312C2030';
wwv_flow_api.g_varchar2_table(534) := '293B0A2020636F6C6F723A207267626128302C20302C20302C2030293B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E';
wwv_flow_api.g_varchar2_table(535) := '207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C2030293B0A2020626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C2030293B0A7D0A2E742D426F6479202E612D4D656E754261722D697465';
wwv_flow_api.g_varchar2_table(536) := '6D2E612D4D656E752D2D63757272656E742E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A20233430343034303B0A2020626F726465722D63';
wwv_flow_api.g_varchar2_table(537) := '6F6C6F723A20233430343034303B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D2E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E20';
wwv_flow_api.g_varchar2_table(538) := '7B0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C2030293B0A2020626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C2030293B0A2020636F6C6F723A207267626128';
wwv_flow_api.g_varchar2_table(539) := '3233302C203233302C203233302C2030293B0A7D0A2E742D426F6479202E612D4D656E752D636F6E74656E74207B0A2020626F726465722D77696474683A20303B0A20206261636B67726F756E642D636F6C6F723A2072676261283233302C203233302C';
wwv_flow_api.g_varchar2_table(540) := '203233302C2030293B0A7D0A2E742D426F6479202E612D4D656E75202E612D4D656E752D6974656D207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D426F6479202E612D4D656E752D616363656C207B0A2020636F6C6F723A2072676261';
wwv_flow_api.g_varchar2_table(541) := '2836342C2036342C2036342C20302E3735293B0A7D0A2E742D426F6479202E612D4D656E75202E612D4D656E752D6974656D2E69732D666F63757365642C0A2E742D426F6479202E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E';
wwv_flow_api.g_varchar2_table(542) := '646564207B0A20206261636B67726F756E642D636F6C6F723A2072676261283234322C203234322C203234322C2030292021696D706F7274616E743B0A7D0A2E742D426F6479202E612D4D656E75426172203E20756C207B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(543) := '642D636F6C6F723A20236536653665363B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D207B0A2020626F726465722D636F6C6F723A2072676261283233302C203233302C203233302C2030293B0A7D0A2E742D426F6479202E612D4D';
wwv_flow_api.g_varchar2_table(544) := '656E754261722D6974656D2E69732D666F6375736564207B0A2020626F782D736861646F773A206E6F6E653B0A7D0A2E742D526567696F6E207B0A20200A20200A20200A20200A20200A20200A7D0A2E742D526567696F6E202E612D4D656E754261722D';
wwv_flow_api.g_varchar2_table(545) := '6C6162656C207B0A2020636F6C6F723A20233030303030303B0A2020766572746963616C2D616C69676E3A20746F703B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D207B0A2020766572746963616C2D616C69676E3A20746F70';
wwv_flow_api.g_varchar2_table(546) := '3B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E69732D666F63757365642C0A2E742D526567696F6E202E612D4D656E754261722D6974656D3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A2023653665';
wwv_flow_api.g_varchar2_table(547) := '3665362021696D706F7274616E743B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742C0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E612D4D656E752D2D6375727265';
wwv_flow_api.g_varchar2_table(548) := '6E742E69732D666F6375736564207B0A20206261636B67726F756E642D636F6C6F723A20236536653665362021696D706F7274616E743B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E7420';
wwv_flow_api.g_varchar2_table(549) := '2E612D4D656E754261722D6C6162656C2C0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(550) := '3030303030302021696D706F7274616E743B0A2020666F6E742D7765696768743A20626F6C643B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E69732D657870616E6465642C0A2E742D526567696F6E202E612D4D656E754261';
wwv_flow_api.g_varchar2_table(551) := '722D6974656D2E612D4D656E752D2D63757272656E742E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A20236536653665362021696D706F7274616E743B0A7D0A2E742D526567696F6E202E612D4D656E754261722D';
wwv_flow_api.g_varchar2_table(552) := '6974656D203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A2020636F6C6F723A207267626128302C20302C20302C20302E38293B0A2020626F726465722D636F6C6F723A20236666666666663B0A2020626F726465722D72';
wwv_flow_api.g_varchar2_table(553) := '61646975733A20313030253B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E2C0A2E74';
wwv_flow_api.g_varchar2_table(554) := '2D526567696F6E202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C3A686F766572202E612D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A20236266626662663B0A2020626F726465722D63';
wwv_flow_api.g_varchar2_table(555) := '6F6C6F723A20236266626662663B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74203E202E612D4D656E752D7375624D656E75436F6C202E61';
wwv_flow_api.g_varchar2_table(556) := '2D49636F6E207B0A2020636F6C6F723A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D6578';
wwv_flow_api.g_varchar2_table(557) := '70616E646564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A20233030303030303B0A2020626F726465722D636F6C6F723A20233030303030303B0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(558) := '20236266626662663B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(559) := '20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A2020636F6C6F723A20236536653665363B0A7D0A2E742D526567696F6E202E612D4D656E752D636F6E74656E74207B0A2020626F726465722D77696474683A2030';
wwv_flow_api.g_varchar2_table(560) := '3B0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0A7D0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D526567696F6E202E612D4D';
wwv_flow_api.g_varchar2_table(561) := '656E752D616363656C207B0A2020636F6C6F723A207267626128302C20302C20302C20302E3735293B0A7D0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D666F63757365642C0A2E742D526567696F6E202E612D';
wwv_flow_api.g_varchar2_table(562) := '4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A20236632663266322021696D706F7274616E743B0A7D0A2E742D526567696F6E202E612D4D656E75426172203E20756C20';
wwv_flow_api.g_varchar2_table(563) := '7B0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D207B0A2020626F726465722D636F6C6F723A20236536653665363B0A7D0A2E742D526567696F6E202E61';
wwv_flow_api.g_varchar2_table(564) := '2D4D656E754261722D6974656D2E69732D666F6375736564207B0A2020626F782D736861646F773A206E6F6E653B0A7D0A2E742D4865616465722D757365724D656E75202E612D4D656E752D636F6E74656E74207B0A2020626F726465722D7769647468';
wwv_flow_api.g_varchar2_table(565) := '3A20303B0A20206261636B67726F756E642D636F6C6F723A20726762612837332C203132392C203137392C20302E3933293B0A7D0A2E742D4865616465722D757365724D656E75202E612D4D656E752D6974656D2E69732D666F63757365642C0A2E742D';
wwv_flow_api.g_varchar2_table(566) := '4865616465722D757365724D656E75202E612D4D656E752D6974656D2E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A20726762612836352C203131362C203136312C20302E3933292021696D706F7274616E743B0A';
wwv_flow_api.g_varchar2_table(567) := '7D0A2E742D4865616465722D757365724D656E752E612D4D656E75202E612D4D656E752D6974656D202E612D4D656E752D6C6162656C207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A20202D7765626B';
wwv_flow_api.g_varchar2_table(568) := '69742D666F6E742D736D6F6F7468696E673A20616E7469616C69617365643B0A7D0A0A2E742D4E617669676174696F6E4261722D6D656E75202E612D4D656E752D636F6E74656E74207B0A2020626F726465722D7261646975733A203020302032707820';
wwv_flow_api.g_varchar2_table(569) := '3270783B0A20206261636B67726F756E642D636F6C6F723A20726762612836372C203130312C203133322C20302E3933293B0A2020626F726465722D77696474683A20303B0A7D0A2E742D4E617669676174696F6E4261722D6D656E75202E612D4D656E';
wwv_flow_api.g_varchar2_table(570) := '752D6974656D2E69732D666F63757365642C0A2E742D4E617669676174696F6E4261722D6D656E75202E612D4D656E752D6974656D2E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A20726762612838342C20313237';
wwv_flow_api.g_varchar2_table(571) := '2C203136362C20302E3933292021696D706F7274616E743B0A7D0A2E742D4E617669676174696F6E4261722D6D656E75202E612D4D656E752D6974656D2E69732D666F6375736564203E202E612D4D656E752D6C6162656C2C0A2E742D4E617669676174';
wwv_flow_api.g_varchar2_table(572) := '696F6E4261722D6D656E75202E612D4D656E752D6974656D2E69732D657870616E646564203E202E612D4D656E752D6C6162656C207B0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0A7D0A2E742D4E617669676174696F6E42';
wwv_flow_api.g_varchar2_table(573) := '61722D6D656E75202E612D4D656E752D6974656D202E612D4D656E752D6C6162656C2C0A2E742D4E617669676174696F6E4261722D6D656E752E612D4D656E75202E612D4D656E752D6974656D20612C0A2E742D4E617669676174696F6E4261722D6D65';
wwv_flow_api.g_varchar2_table(574) := '6E752E612D4D656E75202E612D4D656E752D6974656D202E612D4D656E752D737461747573436F6C207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933292021696D706F7274616E743B0A7D0A0A2E742D506F7075';
wwv_flow_api.g_varchar2_table(575) := '704C4F562D6C696E6B7320613A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20233030316164663B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D506F7075704C4F562D726573756C74735365742074723A686F7665';
wwv_flow_api.g_varchar2_table(576) := '72207464207B0A20206261636B67726F756E642D636F6C6F723A20234543463246422021696D706F7274616E743B0A7D0A2E742D506F7075704C4F562D726573756C74735365742074723A6E74682D6368696C6428326E29207464207B0A20206261636B';
wwv_flow_api.g_varchar2_table(577) := '67726F756E642D636F6C6F723A20234641464146413B0A7D0A2E742D506F7075704C4F562D726573756C74735365742D6C696E6B2C0A2E75692D7769646765742D636F6E74656E7420612E742D506F7075704C4F562D726573756C74735365742D6C696E';
wwv_flow_api.g_varchar2_table(578) := '6B207B0A2020636F6C6F723A20233030316164663B0A7D0A2E742D506167652D2D706F7075704C4F56207B0A20206261636B67726F756E642D636F6C6F723A20234646463B0A7D0A2E742D506F7075704C4F562D616374696F6E73207B0A20206261636B';
wwv_flow_api.g_varchar2_table(579) := '67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D426F6479202E742D506F7075704C4F562D6C696E6B732061207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D426F64792D7469746C65202E742D506F7075704C4F56';
wwv_flow_api.g_varchar2_table(580) := '2D6C696E6B732061207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D426F64792D696E666F202E742D506F7075704C4F562D6C696E6B732061207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D526567696F6E202E742D50';
wwv_flow_api.g_varchar2_table(581) := '6F7075704C4F562D6C696E6B7320612C0A2E742D427574746F6E526567696F6E202E742D506F7075704C4F562D6C696E6B732061207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D506F7075704C4F562D6C696E6B7320613A686F766572';
wwv_flow_api.g_varchar2_table(582) := '207B0A20206261636B67726F756E642D636F6C6F723A20233133326666663B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D426F6479202E742D506F7075704C4F562D706167696E6174696F6E207B0A2020636F6C6F723A20233830383038';
wwv_flow_api.g_varchar2_table(583) := '303B0A7D0A2E742D426F64792D7469746C65202E742D506F7075704C4F562D706167696E6174696F6E207B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D426F64792D696E666F202E742D506F7075704C4F562D706167696E6174696F6E20';
wwv_flow_api.g_varchar2_table(584) := '7B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D526567696F6E202E742D506F7075704C4F562D706167696E6174696F6E2C0A2E742D427574746F6E526567696F6E202E742D506F7075704C4F562D706167696E6174696F6E207B0A202063';
wwv_flow_api.g_varchar2_table(585) := '6F6C6F723A20233830383038303B0A7D0A0A2E742D526567696F6E207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D426F6479202E6669656C64646174612062207B0A2020636F6C6F723A2023343034303430';
wwv_flow_api.g_varchar2_table(586) := '3B0A7D0A2E742D426F64792D7469746C65202E6669656C64646174612062207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D426F64792D696E666F202E6669656C64646174612062207B0A2020636F6C6F723A20233030303030303B0A7D';
wwv_flow_api.g_varchar2_table(587) := '0A2E742D526567696F6E202E6669656C646461746120622C0A2E742D427574746F6E526567696F6E202E6669656C64646174612062207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D526567696F6E2D686561646572207B0A2020626163';
wwv_flow_api.g_varchar2_table(588) := '6B67726F756E642D636F6C6F723A20236236646365623B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420233865633965303B0A7D0A2E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D52';
wwv_flow_api.g_varchar2_table(589) := '6567696F6E2D686561646572202E742D427574746F6E2D2D6E6F5549207B0A2020636F6C6F723A20233432343234653B0A7D0A2E742D426F64792D616374696F6E73202E742D526567696F6E2D686561646572207B0A20206261636B67726F756E643A20';
wwv_flow_api.g_varchar2_table(590) := '7472616E73706172656E743B0A7D0A2E742D526567696F6E2D2D737461636B6564207B0A2020626F726465722D7261646975733A20302021696D706F7274616E743B0A7D0A2E742D526567696F6E2D2D737461636B6564203E202E742D526567696F6E2D';
wwv_flow_api.g_varchar2_table(591) := '686561646572207B0A2020626F726465722D7261646975733A20302021696D706F7274616E743B0A7D0A2E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572207B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(592) := '723A20236666666666663B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420236536653665363B0A7D0A2E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D74';
wwv_flow_api.g_varchar2_table(593) := '69746C652C0A2E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F5549207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D526567696F6E2D2D616363656E74';
wwv_flow_api.g_varchar2_table(594) := '31203E202E742D526567696F6E2D6865616465722C0A2E742D526567696F6E2D2D616363656E74312E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572207B0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(595) := '20236666326435353B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420236666363037653B0A7D0A2E742D526567696F6E2D2D616363656E7431203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C';
wwv_flow_api.g_varchar2_table(596) := '652C0A2E742D526567696F6E2D2D616363656E74312E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E7431203E202E74';
wwv_flow_api.g_varchar2_table(597) := '2D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0A2E742D526567696F6E2D2D616363656E74312E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(598) := '6E6F5549207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D526567696F6E2D2D616363656E7432203E202E742D526567696F6E2D6865616465722C0A2E742D526567696F6E2D2D616363656E74322E742D526567696F6E2D2D6E6F426F72';
wwv_flow_api.g_varchar2_table(599) := '646572203E202E742D526567696F6E2D686561646572207B0A20206261636B67726F756E642D636F6C6F723A20233030376166663B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420233333393566663B0A7D0A2E742D526567696F';
wwv_flow_api.g_varchar2_table(600) := '6E2D2D616363656E7432203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E74322E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561';
wwv_flow_api.g_varchar2_table(601) := '646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E7432203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0A2E742D526567696F6E2D2D616363656E74322E742D526567';
wwv_flow_api.g_varchar2_table(602) := '696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F5549207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D526567696F6E2D2D616363656E7433203E202E742D526567696F';
wwv_flow_api.g_varchar2_table(603) := '6E2D6865616465722C0A2E742D526567696F6E2D2D616363656E74332E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572207B0A20206261636B67726F756E642D636F6C6F723A20236666393530303B0A2020';
wwv_flow_api.g_varchar2_table(604) := '626F726465722D626F74746F6D3A2031707820736F6C696420236666616133333B0A7D0A2E742D526567696F6E2D2D616363656E7433203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E';
wwv_flow_api.g_varchar2_table(605) := '2D2D616363656E74332E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E7433203E202E742D526567696F6E2D68656164';
wwv_flow_api.g_varchar2_table(606) := '6572202E742D427574746F6E2D2D6E6F55492C0A2E742D526567696F6E2D2D616363656E74332E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F5549207B0A2020636F6C';
wwv_flow_api.g_varchar2_table(607) := '6F723A20236666666666663B0A7D0A2E742D526567696F6E2D2D616363656E7434203E202E742D526567696F6E2D6865616465722C0A2E742D526567696F6E2D2D616363656E74342E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567';
wwv_flow_api.g_varchar2_table(608) := '696F6E2D686561646572207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420233261633834353B0A7D0A2E742D526567696F6E2D2D616363656E7434203E';
wwv_flow_api.g_varchar2_table(609) := '202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E74342E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D526567696F';
wwv_flow_api.g_varchar2_table(610) := '6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E7434203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0A2E742D526567696F6E2D2D616363656E74342E742D526567696F6E2D2D6E6F426F726465';
wwv_flow_api.g_varchar2_table(611) := '72203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F5549207B0A2020636F6C6F723A20233037316630623B0A7D0A2E742D526567696F6E2D2D616363656E7435203E202E742D526567696F6E2D6865616465722C0A2E74';
wwv_flow_api.g_varchar2_table(612) := '2D526567696F6E2D2D616363656E74352E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572207B0A20206261636B67726F756E642D636F6C6F723A20233865386539333B0A2020626F726465722D626F74746F';
wwv_flow_api.g_varchar2_table(613) := '6D3A2031707820736F6C696420236138613861633B0A7D0A2E742D526567696F6E2D2D616363656E7435203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E74352E742D';
wwv_flow_api.g_varchar2_table(614) := '526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E7435203E202E742D526567696F6E2D686561646572202E742D427574746F6E';
wwv_flow_api.g_varchar2_table(615) := '2D2D6E6F55492C0A2E742D526567696F6E2D2D616363656E74352E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F5549207B0A2020636F6C6F723A20236666666666663B';
wwv_flow_api.g_varchar2_table(616) := '0A7D0A2E742D526567696F6E2D686561646572207B0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A20302021696D706F7274616E743B0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A20302021696D';
wwv_flow_api.g_varchar2_table(617) := '706F7274616E743B0A7D0A2E742D526567696F6E2068322E742D526567696F6E2D7469746C65207B0A2020636F6C6F723A20233432343234653B0A7D0A2E742D526567696F6E2D626F6479207B0A2020636F6C6F723A20233030303030303B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(618) := '2D526567696F6E2D2D6869646553686F772E69732D636F6C6C6170736564207B0A2020626F726465722D626F74746F6D2D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D526567696F6E2D2D7363726F6C6C426F6479203E202E742D5265';
wwv_flow_api.g_varchar2_table(619) := '67696F6E2D626F647957726170203E202E742D526567696F6E2D626F6479207B0A20206261636B67726F756E643A206C696E6561722D6772616469656E742823666666666666203330252C2072676261283235352C203235352C203235352C203029292C';
wwv_flow_api.g_varchar2_table(620) := '206C696E6561722D6772616469656E742872676261283235352C203235352C203235352C2030292C20236666666666662037302529203020313030252C206C696E6561722D6772616469656E74287267626128302C20302C20302C20302E303235292C20';
wwv_flow_api.g_varchar2_table(621) := '7267626128302C20302C20302C203029292C206C696E6561722D6772616469656E74287267626128302C20302C20302C2030292C207267626128302C20302C20302C20302E3032352929203020313030253B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(622) := '723A20236666666666663B0A7D0A2E742D426F64792D616374696F6E73202E742D526567696F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D426F64792D616374696F6E73202E742D52656769';
wwv_flow_api.g_varchar2_table(623) := '6F6E2D686561646572207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D426F64792D73696465202E742D526567696F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172';
wwv_flow_api.g_varchar2_table(624) := '656E743B0A7D0A2E742D526567696F6E2C0A2E742D526567696F6E2D686561646572207B0A2020626F726465722D7261646975733A203070783B0A7D0A2E742D526567696F6E2D2D6E6F4247207B0A20206261636B67726F756E642D636F6C6F723A2074';
wwv_flow_api.g_varchar2_table(625) := '72616E73706172656E743B0A7D0A2E742D426F64792D616374696F6E73202E742D526567696F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E6170';
wwv_flow_api.g_varchar2_table(626) := '65782D7264732D627574746F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E642D636F6C6F723A207267626128302C2030';
wwv_flow_api.g_varchar2_table(627) := '2C20302C20302E3235293B0A2020636F6C6F723A20234646463B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E617065782D7264732D627574746F6E3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20726762612830';
wwv_flow_api.g_varchar2_table(628) := '2C20302C20302C20302E35293B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E617065782D7264732D627574746F6E3A6163746976652C0A2E742D526567696F6E2D2D6361726F7573656C202E617065782D7264732D627574746F6E3A6163';
wwv_flow_api.g_varchar2_table(629) := '746976653A666F637573207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3735293B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E617065782D7264732D6E6578742D726567696F6E207B0A';
wwv_flow_api.g_varchar2_table(630) := '2020626F726465722D7261646975733A2032707820302030203270783B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E617065782D7264732D70726576696F75732D726567696F6E207B0A2020626F726465722D7261646975733A20302032';
wwv_flow_api.g_varchar2_table(631) := '70782032707820303B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E612D526567696F6E2D6361726F7573656C4E61764974656D2E617065782D7264732D73656C6563746564202E612D526567696F6E2D6361726F7573656C4C696E6B207B';
wwv_flow_api.g_varchar2_table(632) := '0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3435293B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E612D526567696F6E2D6361726F7573656C4E61764974656D2E617065782D7264732D73';
wwv_flow_api.g_varchar2_table(633) := '656C6563746564202E612D526567696F6E2D6361726F7573656C4C696E6B3A666F637573207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A7D0A2E742D526567696F6E2D2D63';
wwv_flow_api.g_varchar2_table(634) := '61726F7573656C202E612D526567696F6E2D6361726F7573656C4C696E6B207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3135293B0A2020626F726465722D7261646975733A20313030253B0A7D0A0A';
wwv_flow_api.g_varchar2_table(635) := '2E742D5265706F72742D63656C6C2C0A2E742D5265706F72742D636F6C48656164207B0A2020626F726465722D6C6566743A2031707820736F6C696420236536653665363B0A2020626F726465722D746F703A2031707820736F6C696420236536653665';
wwv_flow_api.g_varchar2_table(636) := '363B0A7D0A2E742D5265706F72742D7265706F7274207472202E742D5265706F72742D63656C6C3A6C6173742D6368696C642C0A2E742D5265706F72742D7265706F7274207472202E742D5265706F72742D636F6C486561643A6C6173742D6368696C64';
wwv_flow_api.g_varchar2_table(637) := '207B0A2020626F726465722D72696768743A2031707820736F6C696420236536653665363B0A7D0A2E742D5265706F72742D7265706F72742074723A6C6173742D6368696C64202E742D5265706F72742D63656C6C207B0A2020626F726465722D626F74';
wwv_flow_api.g_varchar2_table(638) := '746F6D3A2031707820736F6C696420236536653665363B0A7D0A2E742D5265706F7274202E69732D737475636B202E742D5265706F72742D636F6C48656164207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A2020626F72';
wwv_flow_api.g_varchar2_table(639) := '6465722D626F74746F6D3A2031707820736F6C696420236536653665363B0A7D0A2E742D5265706F72742D2D726F77486967686C69676874202E742D5265706F72742D7265706F72742074723A686F766572202E742D5265706F72742D63656C6C2C0A2E';
wwv_flow_api.g_varchar2_table(640) := '742D5265706F72742D2D726F77486967686C69676874202E742D5265706F72742D7265706F72742074723A6E74682D6368696C64286F6464293A686F766572202E742D5265706F72742D63656C6C207B0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(641) := '20236661666166612021696D706F7274616E743B0A7D0A2E742D5265706F72742D2D737461746963526F77436F6C6F7273202E742D5265706F72742D7265706F72742074723A6E74682D6368696C64286F646429202E742D5265706F72742D63656C6C20';
wwv_flow_api.g_varchar2_table(642) := '7B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A0A2E742D5265706F72742D2D616C74526F777344656661756C74202E742D5265706F72742D7265706F72742074723A6E74682D6368696C64286F646429202E';
wwv_flow_api.g_varchar2_table(643) := '742D5265706F72742D63656C6C207B0A20206261636B67726F756E642D636F6C6F723A20236663666366633B0A7D0A0A2E742D5265706F72742D706167696E6174696F6E5465787420622C0A2E742D5265706F72742D706167696E6174696F6E54657874';
wwv_flow_api.g_varchar2_table(644) := '20613A686F766572207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D53';
wwv_flow_api.g_varchar2_table(645) := '6F6369616C466F6F746572207B0A202070616464696E672D746F703A20343870783B0A202070616464696E672D626F74746F6D3A20323470783B0A7D0A2E742D536F6369616C466F6F746572202E726F77207B0A202070616464696E672D746F703A2038';
wwv_flow_api.g_varchar2_table(646) := '70783B0A7D0A2E742D536F6369616C466F6F746572202E636F6C207B0A202070616464696E672D626F74746F6D3A203870783B0A2020746578742D616C69676E3A2063656E7465723B0A20207472616E736974696F6E3A20616C6C202E32733B0A7D0A2E';
wwv_flow_api.g_varchar2_table(647) := '742D536F6369616C466F6F746572202E636F6C3A686F766572207B0A20202D7765626B69742D7472616E73666F726D3A207472616E736C61746559282D387078293B0A20202D6D6F7A2D7472616E73666F726D3A207472616E736C61746559282D387078';
wwv_flow_api.g_varchar2_table(648) := '293B0A20202D6D732D7472616E73666F726D3A207472616E736C61746559282D387078293B0A20202D6F2D7472616E73666F726D3A207472616E736C61746559282D387078293B0A20207472616E73666F726D3A207472616E736C61746559282D387078';
wwv_flow_api.g_varchar2_table(649) := '293B0A2020626F782D736861646F773A203070782038707820347078202D347078207267626128302C20302C20302C20302E3035293B0A7D0A2E742D536F6369616C466F6F7465722061207B0A20207472616E736974696F6E3A20616C6C202E32733B0A';
wwv_flow_api.g_varchar2_table(650) := '2020646973706C61793A20626C6F636B3B0A2020746578742D6465636F726174696F6E3A206E6F6E653B0A2020746578742D616C69676E3A2063656E7465723B0A2020636F6C6F723A20726762612836342C2036342C2036342C20302E38293B0A7D0A2E';
wwv_flow_api.g_varchar2_table(651) := '742D536F6369616C466F6F7465722061202E742D49636F6E207B0A2020646973706C61793A20626C6F636B3B0A20206D617267696E3A2030206175746F3B0A2020636F6C6F723A20726762612836342C2036342C2036342C20302E34293B0A7D0A2E742D';
wwv_flow_api.g_varchar2_table(652) := '536F6369616C466F6F7465722061202E6661207B0A2020666F6E742D73697A653A20323870783B0A202077696474683A20333270783B0A20206865696768743A20333270783B0A20206C696E652D6865696768743A20333270783B0A2020746578742D61';
wwv_flow_api.g_varchar2_table(653) := '6C69676E3A2063656E7465723B0A7D0A2E742D536F6369616C466F6F7465722061202E612D49636F6E207B0A202077696474683A20333270783B0A20206865696768743A20333270783B0A20206C696E652D6865696768743A20333270783B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(654) := '2D536F6369616C466F6F7465722061202E612D49636F6E3A6265666F7265207B0A2020666F6E742D73697A653A20333270783B0A7D0A2E742D536F6369616C466F6F74657220613A686F7665722C0A2E742D536F6369616C466F6F74657220613A686F76';
wwv_flow_api.g_varchar2_table(655) := '6572202E742D49636F6E207B0A2020636F6C6F723A20233030316164663B0A7D0A2E742D536561726368526573756C74732D64657363207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D536561726368526573756C74732D64617465207B';
wwv_flow_api.g_varchar2_table(656) := '0A2020636F6C6F723A20233733373337333B0A7D0A2E742D536561726368526573756C74732D6D697363207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D526567696F6E202E742D536561726368526573756C74732D64657363207B0A20';
wwv_flow_api.g_varchar2_table(657) := '20636F6C6F723A20233430343034303B0A7D0A2E742D526567696F6E202E742D536561726368526573756C74732D64617465207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D526567696F6E202E742D536561726368526573756C74732D';
wwv_flow_api.g_varchar2_table(658) := '6D697363207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D5374617475734C6973742D626C6F636B486561646572207B0A2020636F6C6F723A20233430343034303B0A20206261636B67726F756E642D636F6C6F723A2023623664636562';
wwv_flow_api.g_varchar2_table(659) := '3B0A7D0A2E742D5374617475734C6973742D68656164657254657874416C742C0A2E742D5374617475734C6973742D617474722C0A2E742D5374617475734C6973742D7465787444657363207B0A2020636F6C6F723A20233733373337333B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(660) := '2D5374617475734C6973742D6974656D5469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D5374617475734C6973742D2D6461746573202E742D5374617475734C6973742D6D61726B6572207B0A2020636F6C6F723A20233730';
wwv_flow_api.g_varchar2_table(661) := '373037303B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E642D636F6C6F723A20234646463B0A7D0A2E742D5374617475734C6973742D2D6461746573202E742D5374617475734C6973742D6D61726B65723A6166';
wwv_flow_api.g_varchar2_table(662) := '746572207B0A20206261636B67726F756E642D636F6C6F723A20234130413041303B0A2020626F726465722D7261646975733A2032707820327078203020303B0A7D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C';
wwv_flow_api.g_varchar2_table(663) := '6973742D6D61726B6572207B0A2020626F726465722D7261646975733A20323470783B0A20206261636B67726F756E642D636F6C6F723A20236666663B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D5374617475734C6973742D2D62756C';
wwv_flow_api.g_varchar2_table(664) := '6C657473202E742D5374617475734C6973742D6974656D2E69732D636F6D706C657465202E742D5374617475734C6973742D6D61726B6572207B0A20206261636B67726F756E642D636F6C6F723A20233730373037303B0A7D0A2E742D5374617475734C';
wwv_flow_api.g_varchar2_table(665) := '6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D64616E676572202E742D5374617475734C6973742D6D61726B65722C0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C697374';
wwv_flow_api.g_varchar2_table(666) := '2D6974656D2E69732D6572726F72202E742D5374617475734C6973742D6D61726B6572207B0A20206261636B67726F756E642D636F6C6F723A20236666336233303B0A7D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475';
wwv_flow_api.g_varchar2_table(667) := '734C6973742D6974656D2E69732D6F70656E202E742D5374617475734C6973742D6D61726B6572207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A7D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D53';
wwv_flow_api.g_varchar2_table(668) := '74617475734C6973742D6974656D2E69732D7761726E696E67202E742D5374617475734C6973742D6D61726B6572207B0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0A7D0A2E742D5374617475734C6973742D2D62756C6C65';
wwv_flow_api.g_varchar2_table(669) := '7473202E742D5374617475734C6973742D6974656D2E69732D6E756C6C202E742D5374617475734C6973742D6D61726B6572207B0A20206261636B67726F756E642D636F6C6F723A20234630463046303B0A7D0A2E742D5374617475734C6973742D2D62';
wwv_flow_api.g_varchar2_table(670) := '756C6C657473202E742D5374617475734C6973742D6974656D2E69732D6E756C6C202E742D5374617475734C6973742D6D61726B6572207B0A2020636F6C6F723A20234130413041303B0A7D0A0A2E742D546162732D2D73696D706C65202E742D546162';
wwv_flow_api.g_varchar2_table(671) := '732D6974656D2E69732D616374697665202E742D546162732D6C696E6B2C0A2E617065782D726473202E617065782D7264732D73656C65637465642061207B0A2020626F782D736861646F773A2030202D32707820302072676261283138342C20323032';
wwv_flow_api.g_varchar2_table(672) := '2C203231392C20302E39332920696E7365743B0A7D0A2E742D546162732D2D73696D706C65202E742D546162732D6C696E6B3A666F6375732C0A2E617065782D72647320613A666F637573207B0A2020626F782D736861646F773A203020302030203270';
wwv_flow_api.g_varchar2_table(673) := '782072676261283138342C203230322C203231392C20302E39332920696E7365743B0A7D0A2E742D546162732D2D70696C6C207B0A20206261636B67726F756E643A206C696E6561722D6772616469656E7428236666666666662C202366346634663429';
wwv_flow_api.g_varchar2_table(674) := '3B0A2020626F726465722D7261646975733A203270783B0A7D0A2E742D426F6479202E742D546162732D2D70696C6C202E742D49636F6E207B0A2020636F6C6F723A20233830383038303B0A7D0A2E742D426F64792D7469746C65202E742D546162732D';
wwv_flow_api.g_varchar2_table(675) := '2D70696C6C202E742D49636F6E207B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D426F64792D696E666F202E742D546162732D2D70696C6C202E742D49636F6E207B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D52656769';
wwv_flow_api.g_varchar2_table(676) := '6F6E202E742D546162732D2D70696C6C202E742D49636F6E2C0A2E742D427574746F6E526567696F6E202E742D546162732D2D70696C6C202E742D49636F6E207B0A2020636F6C6F723A20233830383038303B0A7D0A2E742D426F6479202E742D546162';
wwv_flow_api.g_varchar2_table(677) := '732D2D70696C6C202E742D546162732D6C696E6B207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D426F64792D7469746C65202E742D546162732D2D70696C6C202E742D546162732D6C696E6B207B0A2020636F6C6F723A202330303030';
wwv_flow_api.g_varchar2_table(678) := '30303B0A7D0A2E742D426F64792D696E666F202E742D546162732D2D70696C6C202E742D546162732D6C696E6B207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D526567696F6E202E742D546162732D2D70696C6C202E742D546162732D';
wwv_flow_api.g_varchar2_table(679) := '6C696E6B2C0A2E742D427574746F6E526567696F6E202E742D546162732D2D70696C6C202E742D546162732D6C696E6B207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D546162732D2D70696C6C202E742D546162732D6C696E6B3A686F';
wwv_flow_api.g_varchar2_table(680) := '766572207B0A20206261636B67726F756E642D636F6C6F723A20234646463B0A7D0A2E742D546162732D2D70696C6C202E742D546162732D6C696E6B3A666F637573207B0A2020626F726465722D636F6C6F723A20233436393646433B0A7D0A2E742D54';
wwv_flow_api.g_varchar2_table(681) := '6162732D2D70696C6C202E742D546162732D6C696E6B3A616374697665207B0A20206261636B67726F756E642D636F6C6F723A20234630463046303B0A7D0A2E742D546162732D2D70696C6C202E742D546162732D6974656D3A66697273742D6368696C';
wwv_flow_api.g_varchar2_table(682) := '64202E742D546162732D6C696E6B207B0A2020626F726465722D7261646975733A2032707820302030203270783B0A7D0A2E742D546162732D2D70696C6C202E742D546162732D6974656D2E69732D616374697665202E742D546162732D6C696E6B207B';
wwv_flow_api.g_varchar2_table(683) := '0A20206261636B67726F756E642D636F6C6F723A20234646463B0A7D0A2E742D546162732D2D73696D706C65202E742D49636F6E207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D546162732D2D73696D706C65202E742D546162732D6C';
wwv_flow_api.g_varchar2_table(684) := '696E6B2C0A2E617065782D7264732061207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D546162732D2D73696D706C65202E742D546162732D6C696E6B3A686F7665722C0A2E617065782D72647320613A686F766572207B0A2020626163';
wwv_flow_api.g_varchar2_table(685) := '6B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E303235293B0A7D0A2E742D546162732D2D73696D706C65202E742D546162732D6C696E6B3A6163746976652C0A2E617065782D72647320613A616374697665207B0A202062';
wwv_flow_api.g_varchar2_table(686) := '61636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3135293B0A7D0A2E742D426F6479202E742D546162732D2D73696D706C65202E742D546162732D6C696E6B2C0A2E742D426F6479202E617065782D7264732061207B0A';
wwv_flow_api.g_varchar2_table(687) := '2020636F6C6F723A20233430343034303B0A7D0A2E742D426F64792D7469746C65202E742D546162732D2D73696D706C65202E742D546162732D6C696E6B2C0A2E742D426F64792D7469746C65202E617065782D72647320612C0A2E742D426F64792D69';
wwv_flow_api.g_varchar2_table(688) := '6E666F202E742D546162732D2D73696D706C65202E742D546162732D6C696E6B2C0A2E742D426F64792D696E666F202E617065782D7264732061207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D526567696F6E202E742D546162732D2D';
wwv_flow_api.g_varchar2_table(689) := '73696D706C65202E742D546162732D6C696E6B2C0A2E742D526567696F6E202E617065782D7264732061207B0A2020636F6C6F723A20233430343034303B0A7D0A2E617065782D7264732D686F7665722E6C6566742061207B0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(690) := '6E643A202D7765626B69742D6C696E6561722D6772616469656E74286C6566742C2023396663336462203530252C2072676261283235352C203235352C203235352C2030292031303025293B0A20200A20206261636B67726F756E643A206C696E656172';
wwv_flow_api.g_varchar2_table(691) := '2D6772616469656E7428746F2072696768742C2023396663336462203530252C2072676261283235352C203235352C203235352C2030292031303025293B0A20200A7D0A2E617065782D7264732D686F7665722E72696768742061207B0A20206261636B';
wwv_flow_api.g_varchar2_table(692) := '67726F756E643A202D7765626B69742D6C696E6561722D6772616469656E74286C6566742C20233966633364622030252C2072676261283235352C203235352C203235352C2030292031252C202339666333646220353025293B0A20200A20206261636B';
wwv_flow_api.g_varchar2_table(693) := '67726F756E643A206C696E6561722D6772616469656E7428746F2072696768742C20233966633364622030252C2072676261283235352C203235352C203235352C2030292031252C202339666333646220353025293B0A20200A7D0A0A2E612D54616743';
wwv_flow_api.g_varchar2_table(694) := '6C6F75642D6C696E6B207B0A2020626F726465722D636F6C6F723A20236632663266323B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E643A20236661666166613B0A20207472616E736974696F6E3A206261636B';
wwv_flow_api.g_varchar2_table(695) := '67726F756E642D636F6C6F7220302E32732C20626F726465722D636F6C6F7220302E32732C20626F782D736861646F7720302E32732C20636F6C6F7220302E32733B0A2020636F6C6F723A20233030313964613B0A7D0A2E612D546167436C6F75642D6C';
wwv_flow_api.g_varchar2_table(696) := '696E6B207370616E207B0A20207472616E736974696F6E3A20636F6C6F72202E32733B0A7D0A2E612D546167436C6F75642D6C696E6B3A686F766572207B0A2020746578742D6465636F726174696F6E3A206E6F6E653B0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(697) := '2D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020626F726465722D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020636F6C6F723A2072676261283235352C20323535';
wwv_flow_api.g_varchar2_table(698) := '2C203235352C20302E3933293B0A2020626F782D736861646F773A203020302030203270782072676261283131362C203135322C203138352C20302E39332920696E7365743B0A7D0A2E612D546167436C6F75642D6C696E6B3A686F766572207370616E';
wwv_flow_api.g_varchar2_table(699) := '207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E612D546167436C6F75642D636F756E74207B0A2020636F6C6F723A20233636363636363B0A2020666F6E742D7765696768743A203230303B0A7D';
wwv_flow_api.g_varchar2_table(700) := '0A2E742D54696D656C696E65207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D54696D656C696E652D757365726E616D652C0A2E742D54696D656C696E652D646174652C0A2E742D54696D656C696E652D64657363207B0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(701) := '723A20233733373337333B0A7D0A2E742D54696D656C696E652D77726170207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D54696D656C696E652D74797065207B0A20206261636B67726F756E642D636F6C6F723A20236136643465373B';
wwv_flow_api.g_varchar2_table(702) := '0A2020636F6C6F723A20233432343234653B0A7D0A2E742D54696D656C696E652D747970652E69732D6E6577207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A2020636F6C6F723A20234646463B0A7D0A2E742D54696D65';
wwv_flow_api.g_varchar2_table(703) := '6C696E652D747970652E69732D75706461746564207B0A20206261636B67726F756E642D636F6C6F723A20233235373863663B0A2020636F6C6F723A20234646463B0A7D0A2E742D54696D656C696E652D747970652E69732D72656D6F766564207B0A20';
wwv_flow_api.g_varchar2_table(704) := '206261636B67726F756E642D636F6C6F723A20236539306330303B0A2020636F6C6F723A20234646463B0A7D0A2E742D54696D656C696E652D777261703A666F637573207B0A20206F75746C696E653A206E6F6E653B0A2020626F782D736861646F773A';
wwv_flow_api.g_varchar2_table(705) := '203020302030203170782072676261283131362C203135322C203138352C20302E39332920696E7365743B0A7D0A2E742D50616765426F64792D2D6C6566744E6176202E742D426F64792D6E6176207B0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(706) := '20726762612835382C203130332C203134332C20302E3933293B0A7D0A2E742D526567696F6E207B0A20200A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69';
wwv_flow_api.g_varchar2_table(707) := '732D666F6375736564207B0A2020626F782D736861646F773A20302030203020317078202365386538653820696E7365743B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965';
wwv_flow_api.g_varchar2_table(708) := '772D726F772E69732D63757272656E742C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D73656C65637465642C0A2E742D526567696F6E202E612D547265';
wwv_flow_api.g_varchar2_table(709) := '65566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564207B0A20206261636B67726F756E642D636F6C6F723A20236637663766373B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(710) := '2D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C';
wwv_flow_api.g_varchar2_table(711) := '6576656C2E69732D636F6C6C61707369626C65203E202E612D54726565566965772D726F772C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(712) := '20236666666666663B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572207B0A20206261636B67726F756E642D636F6C6F723A2023663066';
wwv_flow_api.g_varchar2_table(713) := '3066302021696D706F7274616E743B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D746F67676C65';
wwv_flow_api.g_varchar2_table(714) := '2C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C65207B0A2020636F6C6F723A207267626128302C20302C20302C20302E';
wwv_flow_api.g_varchar2_table(715) := '3735293B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D746F67676C653A686F7665722C0A2E742D';
wwv_flow_api.g_varchar2_table(716) := '526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C653A686F766572207B0A2020636F6C6F723A20233030303030302021696D706F7274';
wwv_flow_api.g_varchar2_table(717) := '616E743B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572207B0A2020636F6C6F723A20233030303030302021696D706F727461';
wwv_flow_api.g_varchar2_table(718) := '6E743B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D526567696F6E202E612D5472';
wwv_flow_api.g_varchar2_table(719) := '6565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E66612C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74';
wwv_flow_api.g_varchar2_table(720) := '656E74202E612D49636F6E207B0A2020636F6C6F723A207267626128302C20302C20302C20302E3935293B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E7465';
wwv_flow_api.g_varchar2_table(721) := '6E742E69732D686F766572202E66612C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70202E66612C0A2E742D5265';
wwv_flow_api.g_varchar2_table(722) := '67696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572202E612D49636F6E2C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F';
wwv_flow_api.g_varchar2_table(723) := '704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70202E612D49636F6E207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D';
wwv_flow_api.g_varchar2_table(724) := '2D746F704C6576656C202E612D54726565566965772D6C6162656C207B0A2020636F6C6F723A20696E68657269743B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D63';
wwv_flow_api.g_varchar2_table(725) := '6F6E74656E742E69732D63757272656E742C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D73656C65637465642C0A2E742D526567696F6E202E';
wwv_flow_api.g_varchar2_table(726) := '612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D526567696F6E202E612D547265';
wwv_flow_api.g_varchar2_table(727) := '65566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D746F67676C65207B0A2020636F6C6F723A207267626128302C20302C20302C20302E3735293B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F6465';
wwv_flow_api.g_varchar2_table(728) := '2D2D746F704C6576656C202E612D54726565566965772D746F67676C653A686F766572207B0A2020636F6C6F723A20233030303030302021696D706F7274616E743B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F70';
wwv_flow_api.g_varchar2_table(729) := '4C6576656C202E612D54726565566965772D726F77207B0A20207472616E736974696F6E3A206261636B67726F756E642D636F6C6F7220302E31733B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E';
wwv_flow_api.g_varchar2_table(730) := '69732D636F6C6C61707369626C65203E202E612D54726565566965772D726F772E69732D73656C65637465642C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65203E20';
wwv_flow_api.g_varchar2_table(731) := '2E612D54726565566965772D726F772E69732D666F6375736564207B0A20206261636B67726F756E642D636F6C6F723A20236637663766373B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E61';
wwv_flow_api.g_varchar2_table(732) := '2D54726565566965772D726F772E69732D666F6375736564207B0A2020626F782D736861646F773A2030203020302031707820726762612831312C203132332C203232382C20302E39332920696E7365743B0A7D0A2E742D547265654E6176202E612D54';
wwv_flow_api.g_varchar2_table(733) := '726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D5472656556696577';
wwv_flow_api.g_varchar2_table(734) := '2D726F772E69732D73656C65637465642C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C656374656420';
wwv_flow_api.g_varchar2_table(735) := '7B0A20206261636B67726F756E642D636F6C6F723A20726762612831302C203130372C203139392C20302E3933293B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D';
wwv_flow_api.g_varchar2_table(736) := '726F772E69732D63757272656E742D2D746F702C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65203E202E612D54726565566965772D726F772C0A2E742D54726565';
wwv_flow_api.g_varchar2_table(737) := '4E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0A20206261636B67726F756E642D636F6C6F723A207267626128392C2039392C203138342C20302E3933293B0A7D0A2E742D547265654E6176202E612D54726565';
wwv_flow_api.g_varchar2_table(738) := '566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572207B0A20206261636B67726F756E642D636F6C6F723A20726762612831302C203131352C203231332C20302E3933292021696D706F727461';
wwv_flow_api.g_varchar2_table(739) := '6E743B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D746F67676C652C0A2E742D547265654E61';
wwv_flow_api.g_varchar2_table(740) := '76202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C65207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3638293B';
wwv_flow_api.g_varchar2_table(741) := '0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D746F67676C653A686F7665722C0A2E742D547265';
wwv_flow_api.g_varchar2_table(742) := '654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C653A686F766572207B0A2020636F6C6F723A2072676261283235352C203235352C203235';
wwv_flow_api.g_varchar2_table(743) := '352C20302E3933292021696D706F7274616E743B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572207B0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(744) := '2072676261283235352C203235352C203235352C20302E3933292021696D706F7274616E743B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74207B';
wwv_flow_api.g_varchar2_table(745) := '0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E6661';
wwv_flow_api.g_varchar2_table(746) := '2C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E612D49636F6E207B0A2020636F6C6F723A2072676261283137302C203230372C203235352C2030';
wwv_flow_api.g_varchar2_table(747) := '2E3933293B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572202E66612C0A2E742D547265654E6176202E612D547265655669';
wwv_flow_api.g_varchar2_table(748) := '65772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70202E66612C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D';
wwv_flow_api.g_varchar2_table(749) := '54726565566965772D636F6E74656E742E69732D686F766572202E612D49636F6E2C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272';
wwv_flow_api.g_varchar2_table(750) := '656E742D2D746F70202E612D49636F6E207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D5472';
wwv_flow_api.g_varchar2_table(751) := '6565566965772D6C6162656C207B0A2020636F6C6F723A20696E68657269743B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272';
wwv_flow_api.g_varchar2_table(752) := '656E742C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D73656C65637465642C0A2E742D547265654E6176202E612D54726565566965772D6E';
wwv_flow_api.g_varchar2_table(753) := '6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D547265654E6176';
wwv_flow_api.g_varchar2_table(754) := '202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D746F67676C65207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3638293B0A7D0A2E742D547265654E6176202E61';
wwv_flow_api.g_varchar2_table(755) := '2D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D746F67676C653A686F766572207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933292021696D706F7274616E743B0A7D';
wwv_flow_api.g_varchar2_table(756) := '0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F77207B0A20207472616E736974696F6E3A206261636B67726F756E642D636F6C6F7220302E31733B0A7D0A2E742D54';
wwv_flow_api.g_varchar2_table(757) := '7265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D636F6E74656E74202E66612C0A2E742D547265654E6176202E612D54726565566965772D6E6F64';
wwv_flow_api.g_varchar2_table(758) := '652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D636F6E74656E74202E612D49636F6E207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D5472';
wwv_flow_api.g_varchar2_table(759) := '65654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D636F6E74656E74207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C2030';
wwv_flow_api.g_varchar2_table(760) := '2E3933293B0A7D0A0A2E742D4469616C6F672D2D77697A617264207B0A2020626F726465723A20236536653665363B0A7D0A2E742D57697A617264207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020626F726465722D';
wwv_flow_api.g_varchar2_table(761) := '7261646975733A203270783B0A7D0A2E742D57697A617264202E742D57697A6172642D7469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A626F6479202E742D57697A6172642D2D6D6F64616C207B0A20206261636B67726F756E643A';
wwv_flow_api.g_varchar2_table(762) := '20236666666666663B0A7D0A626F6479202E742D57697A6172642D2D6D6F64616C202E742D57697A6172642D626F6479207B0A20206261636B67726F756E643A206C696E6561722D6772616469656E742823666666666666203430252C20726762612832';
wwv_flow_api.g_varchar2_table(763) := '35352C203235352C203235352C203029292C206C696E6561722D6772616469656E742872676261283235352C203235352C203235352C2030292C20236666666666662036302529203020313030252C206C696E6561722D6772616469656E742872676261';
wwv_flow_api.g_varchar2_table(764) := '28302C20302C20302C20302E303235292C207267626128302C20302C20302C203029292C206C696E6561722D6772616469656E74287267626128302C20302C20302C2030292C207267626128302C20302C20302C20302E3032352929203020313030253B';
wwv_flow_api.g_varchar2_table(765) := '0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A626F6479202E742D57697A6172642D2D6D6F64616C202E742D526567696F6E207B0A20206261636B67726F756E643A20236666666666663B0A7D0A2E742D57697A617264';
wwv_flow_api.g_varchar2_table(766) := '207B0A2020626F726465722D636F6C6F723A20236536653665363B0A7D0A2E742D57697A617264202E742D57697A6172642D686561646572207B0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0A2020626F726465722D636F6C';
wwv_flow_api.g_varchar2_table(767) := '6F723A20236564656465643B0A7D0A2E742D57697A61726453746570732D777261703A6166746572207B0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0A7D0A2E742D57697A61726453746570732D73746570202E742D57697A';
wwv_flow_api.g_varchar2_table(768) := '61726453746570732D6D61726B6572207B0A20206261636B67726F756E642D636F6C6F723A20236363636363633B0A7D0A2E742D57697A61726453746570732D737465702E69732D636F6D706C657465202E742D57697A61726453746570732D6D61726B';
wwv_flow_api.g_varchar2_table(769) := '6572207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A2020636F6C6F723A20234646463B0A7D0A2E742D57697A61726453746570732D737465702E69732D616374697665202E742D57697A61726453746570732D6D61726B';
wwv_flow_api.g_varchar2_table(770) := '6572207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A7D0A2E742D57697A61726453746570732D6C6162656C207B0A2020636F6C6F723A20233636363636363B0A7D0A2E742D';
wwv_flow_api.g_varchar2_table(771) := '57697A61726453746570732D737465702E69732D616374697665202E742D57697A61726453746570732D6C6162656C207B0A2020636F6C6F723A20233430343034303B0A7D0A0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D7469';
wwv_flow_api.g_varchar2_table(772) := '746C65626172207B0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A20303B0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A20303B0A20206261636B67726F756E642D636F6C6F723A20726762612832';
wwv_flow_api.g_varchar2_table(773) := '35352C203235352C203235352C2030293B0A7D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D7469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F';
wwv_flow_api.g_varchar2_table(774) := '672D7469746C656261722D636C6F7365207B0A2020626F726465722D7261646975733A20313030253B0A7D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D627574746F6E70616E65207B0A2020626F726465722D746F702D636F6C';
wwv_flow_api.g_varchar2_table(775) := '6F723A20234630463046303B0A7D0A0A626F6479202E75692D7769646765742D636F6E74656E74207B0A2020626F726465722D636F6C6F723A20236562656265623B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F';
wwv_flow_api.g_varchar2_table(776) := '6C6F723A20233030303030303B0A7D0A626F6479202E75692D7769646765742D636F6E74656E742061207B0A2020636F6C6F723A20233030316164663B0A7D0A626F6479202E75692D7769646765742D686561646572207B0A2020626F726465722D636F';
wwv_flow_api.g_varchar2_table(777) := '6C6F723A20236562656265623B0A20206261636B67726F756E642D636F6C6F723A20236236646365623B0A2020636F6C6F723A20233432343234653B0A7D0A626F6479202E75692D7769646765742D6865616465722061207B0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(778) := '3432343234653B0A7D0A0A626F6479202E75692D73746174652D64656661756C742C0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D64656661756C742C0A626F6479202E75692D7769646765742D686561646572';
wwv_flow_api.g_varchar2_table(779) := '202E75692D73746174652D64656661756C74207B0A20206261636B67726F756E642D636F6C6F723A20236638663866383B0A2020636F6C6F723A20233338333833383B0A7D0A626F6479202E75692D73746174652D64656661756C7420612C0A626F6479';
wwv_flow_api.g_varchar2_table(780) := '202E75692D73746174652D64656661756C7420613A6C696E6B2C0A626F6479202E75692D73746174652D64656661756C7420613A766973697465642C0A626F6479202E75692D73746174652D61637469766520612C0A626F6479202E75692D7374617465';
wwv_flow_api.g_varchar2_table(781) := '2D61637469766520613A6C696E6B2C0A626F6479202E75692D73746174652D61637469766520613A76697369746564207B0A2020636F6C6F723A20233030316164663B0A7D0A626F6479202E75692D73746174652D686F7665722C0A626F6479202E7569';
wwv_flow_api.g_varchar2_table(782) := '2D7769646765742D636F6E74656E74202E75692D73746174652D686F7665722C0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236666666666';
wwv_flow_api.g_varchar2_table(783) := '663B0A2020636F6C6F723A20233338333833383B0A7D0A626F6479202E75692D73746174652D666F6375732C0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D666F6375732C0A626F6479202E75692D7769646765';
wwv_flow_api.g_varchar2_table(784) := '742D686561646572202E75692D73746174652D666F637573207B0A2020626F782D736861646F773A203020302030203170782072676261283131362C203135322C203138352C20302E39332920696E7365742C2030203020317078203270782072676261';
wwv_flow_api.g_varchar2_table(785) := '283131362C203135322C203138352C20302E3235292021696D706F7274616E743B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233338333833383B0A7D0A626F6479202E75692D646174657069636B';
wwv_flow_api.g_varchar2_table(786) := '6572202E75692D646174657069636B65722D627574746F6E70616E6520627574746F6E3A666F637573207B0A20206F75746C696E653A206E6F6E653B0A2020626F782D736861646F773A203020302030203170782072676261283131362C203135322C20';
wwv_flow_api.g_varchar2_table(787) := '3138352C20302E39332920696E7365742C2030203020317078203270782072676261283131362C203135322C203138352C20302E3235292021696D706F7274616E743B0A7D0A626F6479202E75692D73746174652D686F76657220612C0A626F6479202E';
wwv_flow_api.g_varchar2_table(788) := '75692D73746174652D686F76657220613A686F7665722C0A626F6479202E75692D73746174652D686F76657220613A6C696E6B2C0A626F6479202E75692D73746174652D686F76657220613A766973697465642C0A626F6479202E75692D73746174652D';
wwv_flow_api.g_varchar2_table(789) := '666F63757320612C0A626F6479202E75692D73746174652D666F63757320613A686F7665722C0A626F6479202E75692D73746174652D666F63757320613A6C696E6B2C0A626F6479202E75692D73746174652D666F63757320613A76697369746564207B';
wwv_flow_api.g_varchar2_table(790) := '0A2020636F6C6F723A20233030316164663B0A7D0A626F6479202E75692D73746174652D6163746976652C0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D6163746976652C0A626F6479202E75692D7769646765';
wwv_flow_api.g_varchar2_table(791) := '742D686561646572202E75692D73746174652D616374697665207B0A20206261636B67726F756E642D636F6C6F723A20236465646564653B0A2020636F6C6F723A20233338333833383B0A7D0A0A626F6479202E75692D73746174652D686967686C6967';
wwv_flow_api.g_varchar2_table(792) := '68742C0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D686967686C696768742C0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D686967686C69676874207B0A20206261636B';
wwv_flow_api.g_varchar2_table(793) := '67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A2020636F6C6F723A20233430343034303B0A7D0A626F6479202E75692D73746174652D686967686C6967687420612C0A626F6479202E75692D7769';
wwv_flow_api.g_varchar2_table(794) := '646765742D636F6E74656E74202E75692D73746174652D686967686C6967687420612C0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D686967686C696768742061207B0A2020636F6C6F723A20233430343034303B';
wwv_flow_api.g_varchar2_table(795) := '0A7D0A626F6479202E75692D73746174652D6572726F722C0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D6572726F722C0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D65';
wwv_flow_api.g_varchar2_table(796) := '72726F72207B0A20206261636B67726F756E642D636F6C6F723A20236539306330303B0A2020636F6C6F723A20236666656165393B0A7D0A626F6479202E75692D73746174652D6572726F7220612C0A626F6479202E75692D7769646765742D636F6E74';
wwv_flow_api.g_varchar2_table(797) := '656E74202E75692D73746174652D6572726F7220612C0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D6572726F722061207B0A2020636F6C6F723A20236666656165393B0A7D0A626F6479202E75692D7374617465';
wwv_flow_api.g_varchar2_table(798) := '2D6572726F722D746578742C0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D6572726F722D746578742C0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D6572726F722D7465';
wwv_flow_api.g_varchar2_table(799) := '7874207B0A2020636F6C6F723A20236539306330303B0A7D0A0A626F6479202E75692D646174657069636B6572207464207370616E2E75692D73746174652D64656661756C742C0A626F6479202E75692D646174657069636B657220746420612E75692D';
wwv_flow_api.g_varchar2_table(800) := '73746174652D64656661756C74207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A2020636F6C6F723A20233030303030303B0A7D0A626F6479202E75692D646174657069636B6572207464207370616E2E75692D';
wwv_flow_api.g_varchar2_table(801) := '73746174652D64656661756C742E75692D73746174652D6163746976652C0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D64656661756C742E75692D73746174652D616374697665207B0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(802) := '756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A2020666F6E742D7765696768743A20626F6C643B0A7D0A626F64';
wwv_flow_api.g_varchar2_table(803) := '79202E75692D646174657069636B6572207464207370616E2E75692D73746174652D64656661756C742E75692D73746174652D6163746976652E75692D73746174652D686F7665722C0A626F6479202E75692D646174657069636B657220746420612E75';
wwv_flow_api.g_varchar2_table(804) := '692D73746174652D64656661756C742E75692D73746174652D6163746976652E75692D73746174652D686F766572207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933292021696D706F';
wwv_flow_api.g_varchar2_table(805) := '7274616E743B0A7D0A626F6479202E75692D646174657069636B6572207464207370616E2E75692D73746174652D64656661756C742E75692D73746174652D686F7665722C0A626F6479202E75692D646174657069636B657220746420612E75692D7374';
wwv_flow_api.g_varchar2_table(806) := '6174652D64656661756C742E75692D73746174652D686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236632663266322021696D706F7274616E743B0A7D0A626F6479202E75692D646174657069636B6572207464207370616E2E75';
wwv_flow_api.g_varchar2_table(807) := '692D73746174652D64656661756C743A666F6375732C0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D64656661756C743A666F637573207B0A20206F75746C696E653A206E6F6E653B0A2020626F782D73686164';
wwv_flow_api.g_varchar2_table(808) := '6F773A203020302030203170782072676261283131362C203135322C203138352C20302E39332920696E7365742C2030203020317078203270782072676261283131362C203135322C203138352C20302E3235292021696D706F7274616E743B0A7D0A62';
wwv_flow_api.g_varchar2_table(809) := '6F6479202E75692D646174657069636B6572207464207370616E2E75692D73746174652D64656661756C742E75692D73746174652D686967686C696768742C0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D6465';
wwv_flow_api.g_varchar2_table(810) := '6661756C742E75692D73746174652D686967686C69676874207B0A20206261636B67726F756E642D636F6C6F723A20236562656265623B0A7D0A626F6479202E75692D646174657069636B6572207468207B0A2020636F6C6F723A20233430343034303B';
wwv_flow_api.g_varchar2_table(811) := '0A7D0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D6865616465722C0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D627574746F6E70616E6520627574746F6E2C0A';
wwv_flow_api.g_varchar2_table(812) := '626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D6E6578742C0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D70726576207B0A2020626F726465722D7261646975733A20';
wwv_flow_api.g_varchar2_table(813) := '3270783B0A7D0A0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D7469746C65626172207B0A20206261636B67726F756E642D636F6C6F723A20236236646365623B0A2020626F726465722D626F74746F6D3A2031707820736F6C69';
wwv_flow_api.g_varchar2_table(814) := '6420233865633965303B0A7D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D7469746C65207B0A2020636F6C6F723A20233432343234653B0A7D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D636F6E7465';
wwv_flow_api.g_varchar2_table(815) := '6E742C0A2E742D4469616C6F672D70616765207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233030303030303B0A7D0A0A2E742D4469616C6F672D2D77697A6172642E75692D6469616C6F672C0A';
wwv_flow_api.g_varchar2_table(816) := '2E742D4469616C6F672D2D77697A6172642E75692D6469616C6F67202E75692D6469616C6F672D7469746C656261722C0A2E742D4469616C6F672D2D77697A61726420626F6479202E75692D6469616C6F67202E75692D6469616C6F672D636F6E74656E';
wwv_flow_api.g_varchar2_table(817) := '74207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D4469616C6F672D2D77697A6172642E75692D6469616C6F67202E75692D6469616C6F672D7469746C65207B0A';
wwv_flow_api.g_varchar2_table(818) := '2020636F6C6F723A20233030303030303B0A7D0A0A626F6479202E75692D636F726E65722D616C6C207B0A2020626F726465722D7261646975733A203070783B0A7D0A626F6479202E75692D636F726E65722D746F702C0A626F6479202E75692D636F72';
wwv_flow_api.g_varchar2_table(819) := '6E65722D6C6566742C0A626F6479202E75692D636F726E65722D746C207B0A2020626F726465722D746F702D6C6566742D7261646975733A203070783B0A7D0A626F6479202E75692D636F726E65722D746F702C0A626F6479202E75692D636F726E6572';
wwv_flow_api.g_varchar2_table(820) := '2D72696768742C0A626F6479202E75692D636F726E65722D7472207B0A2020626F726465722D746F702D72696768742D7261646975733A203070783B0A7D0A626F6479202E75692D636F726E65722D626F74746F6D2C0A626F6479202E75692D636F726E';
wwv_flow_api.g_varchar2_table(821) := '65722D6C6566742C0A626F6479202E75692D636F726E65722D626C207B0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A203070783B0A7D0A626F6479202E75692D636F726E65722D626F74746F6D2C0A626F6479202E75692D63';
wwv_flow_api.g_varchar2_table(822) := '6F726E65722D72696768742C0A626F6479202E75692D636F726E65722D6272207B0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A203070783B0A7D0A0A626F6479202E75692D627574746F6E2E75692D636F726E65722D616C';
wwv_flow_api.g_varchar2_table(823) := '6C207B0A2020626F726465722D7261646975733A203270783B0A7D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D746F702C0A626F6479202E75692D627574746F6E2E75692D636F726E65722D6C6566742C0A626F6479202E75692D';
wwv_flow_api.g_varchar2_table(824) := '627574746F6E2E75692D636F726E65722D746C207B0A2020626F726465722D746F702D6C6566742D7261646975733A203270783B0A7D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D746F702C0A626F6479202E75692D627574746F';
wwv_flow_api.g_varchar2_table(825) := '6E2E75692D636F726E65722D72696768742C0A626F6479202E75692D627574746F6E2E75692D636F726E65722D7472207B0A2020626F726465722D746F702D72696768742D7261646975733A203270783B0A7D0A626F6479202E75692D627574746F6E2E';
wwv_flow_api.g_varchar2_table(826) := '75692D636F726E65722D626F74746F6D2C0A626F6479202E75692D627574746F6E2E75692D636F726E65722D6C6566742C0A626F6479202E75692D627574746F6E2E75692D636F726E65722D626C207B0A2020626F726465722D626F74746F6D2D6C6566';
wwv_flow_api.g_varchar2_table(827) := '742D7261646975733A203270783B0A7D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D626F74746F6D2C0A626F6479202E75692D627574746F6E2E75692D636F726E65722D72696768742C0A626F6479202E75692D627574746F6E2E';
wwv_flow_api.g_varchar2_table(828) := '75692D636F726E65722D6272207B0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A203270783B0A7D0A0A2E61635F726573756C7473207B0A2020626F726465723A2031707820736F6C696420236439643964393B0A20206261';
wwv_flow_api.g_varchar2_table(829) := '636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233430343034303B0A7D0A2E61635F6C6F6164696E67207B0A20206261636B67726F756E643A20236666666666662075726C28272E2E2F2E2E2F2E2E2F617065785F';
wwv_flow_api.g_varchar2_table(830) := '75692F696D672F6C65676163792F6C6F6164696E6731367831362E67696627292072696768742063656E746572206E6F2D7265706561743B0A7D0A2E61635F6F6464207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A7D0A';
wwv_flow_api.g_varchar2_table(831) := '626F6479202E61635F6F766572207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D';
wwv_flow_api.g_varchar2_table(832) := '0A626F6479202E612D44334C696E654368617274202E612D44334C696E6543686172742D617869732D7469746C652C0A626F6479202E612D44334261724368617274202E612D44334C696E6543686172742D617869732D7469746C65207B0A202066696C';
wwv_flow_api.g_varchar2_table(833) := '6C3A20233430343034303B0A7D0A626F6479202E612D44334C696E654368617274202E612D44334C696E6543686172742D61786973202E7469636B20746578742C0A626F6479202E612D44334261724368617274202E612D44334C696E6543686172742D';
wwv_flow_api.g_varchar2_table(834) := '61786973202E7469636B2074657874207B0A202066696C6C3A20233830383038303B0A7D0A626F6479202E612D44334C696E654368617274202E612D44334C696E6543686172742D61786973206C696E652C0A626F6479202E612D443342617243686172';
wwv_flow_api.g_varchar2_table(835) := '74202E612D44334C696E6543686172742D61786973206C696E652C0A626F6479202E612D44334C696E654368617274202E612D44334C696E6543686172742D6178697320706174682C0A626F6479202E612D44334261724368617274202E612D44334C69';
wwv_flow_api.g_varchar2_table(836) := '6E6543686172742D617869732070617468207B0A20207374726F6B653A20236536653665363B0A7D0A626F6479202E612D44334261724368617274202E612D443342617243686172742D617869732D7469746C65207B0A202066696C6C3A202334303430';
wwv_flow_api.g_varchar2_table(837) := '34303B0A7D0A626F6479202E612D44334261724368617274202E612D443342617243686172742D67726964206C696E652C0A626F6479202E612D44334261724368617274202E612D443342617243686172742D67726964207B0A20207374726F6B653A20';
wwv_flow_api.g_varchar2_table(838) := '236536653665363B0A7D0A626F6479202E612D44334261724368617274202E612D443342617243686172742D61786973206C696E652C0A626F6479202E612D44334261724368617274202E612D443342617243686172742D617869732070617468207B0A';
wwv_flow_api.g_varchar2_table(839) := '20207374726F6B653A20236363636363633B0A7D0A626F6479202E612D44334261724368617274202E612D443342617243686172742D61786973202E7469636B2074657874207B0A202066696C6C3A20233830383038303B0A7D0A626F6479202E612D44';
wwv_flow_api.g_varchar2_table(840) := '33546F6F6C746970207B0A20206261636B67726F756E642D636F6C6F723A20233830383038303B0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0A7D0A626F6479202E612D4433546F6F6C7469702D636F6E74656E74207B0A20';
wwv_flow_api.g_varchar2_table(841) := '20626F726465722D746F703A20233939393939393B0A7D0A626F6479202E612D443343686172744C6567656E642E612D443343686172744C6567656E642D2D65787465726E616C2D626F7264657273207B0A2020626F726465722D77696474683A20303B';
wwv_flow_api.g_varchar2_table(842) := '0A7D0A626F6479202E612D443343686172744C6567656E642D6974656D2C0A626F6479202E612D443343686172744C6567656E642E612D443343686172744C6567656E642D2D6261636B67726F756E64202E612D443343686172744C6567656E642D6C61';
wwv_flow_api.g_varchar2_table(843) := '796F7574207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A2020626F726465722D77696474683A20302021696D706F7274616E743B0A7D0A626F6479202E612D443343686172744C6567656E642D6974656D2D76';
wwv_flow_api.g_varchar2_table(844) := '616C7565207B0A2020636F6C6F723A20233236323632363B0A7D0A626F6479202E612D443343686172744C6567656E642E612D443343686172744C6567656E642D2D7371756172652D636F6C6F72202E612D443343686172744C6567656E642D6974656D';
wwv_flow_api.g_varchar2_table(845) := '2D636F6C6F72207B0A2020626F726465722D7261646975733A20313030253B0A2020626F726465722D72696768742D77696474683A20303B0A7D0A2E742D426F6479207B0A20200A20200A20200A7D0A2E742D426F6479202E612D4D696E6943616C207B';
wwv_flow_api.g_varchar2_table(846) := '0A2020626F726465723A2031707820736F6C69642072676261283233302C203233302C203233302C2030293B0A2020626F726465722D7261646975733A203070783B0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C20323535';
wwv_flow_api.g_varchar2_table(847) := '2C203235352C2030293B0A7D0A2E742D426F6479202E612D4D696E6943616C2D7469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D426F6479202E612D4D696E6943616C2D6461794F665765656B207B0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(848) := '233830383038303B0A7D0A2E742D426F6479202E612D4D696E6943616C2D646179207B0A2020626F726465722D636F6C6F723A2072676261283234392C203234392C203234392C2030293B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D42';
wwv_flow_api.g_varchar2_table(849) := '6F6479202E612D4D696E6943616C2D6461792E69732D746F646179202E612D4D696E6943616C2D64617465207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(850) := '3A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D426F6479202E612D4D696E6943616C2D6461792E69732D616374697665202E612D4D696E6943616C2D64617465207B0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(851) := '3A20236666636330303B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D426F6479202E612D4D696E6943616C2D6461792E69732D7765656B656E64207B0A20206261636B67726F756E642D636F6C6F723A2072676261283235302C20323530';
wwv_flow_api.g_varchar2_table(852) := '2C203235302C2030293B0A7D0A2E742D426F6479202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0A20206261636B67726F756E642D636F6C6F723A2072676261283234352C203234352C203234352C2030293B0A7D0A2E742D526567696F';
wwv_flow_api.g_varchar2_table(853) := '6E207B0A20200A20200A20200A7D0A2E742D526567696F6E202E612D4D696E6943616C207B0A2020626F726465723A2031707820736F6C696420236536653665363B0A2020626F726465722D7261646975733A203070783B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(854) := '642D636F6C6F723A20236666666666663B0A7D0A2E742D526567696F6E202E612D4D696E6943616C2D7469746C65207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D526567696F6E202E612D4D696E6943616C2D6461794F665765656B20';
wwv_flow_api.g_varchar2_table(855) := '7B0A2020636F6C6F723A20233830383038303B0A7D0A2E742D526567696F6E202E612D4D696E6943616C2D646179207B0A2020626F726465722D636F6C6F723A20236639663966393B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D526567';
wwv_flow_api.g_varchar2_table(856) := '696F6E202E612D4D696E6943616C2D6461792E69732D746F646179202E612D4D696E6943616C2D64617465207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(857) := '3A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D526567696F6E202E612D4D696E6943616C2D6461792E69732D616374697665202E612D4D696E6943616C2D64617465207B0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(858) := '6F723A20236666636330303B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D526567696F6E202E612D4D696E6943616C2D6461792E69732D7765656B656E64207B0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0A';
wwv_flow_api.g_varchar2_table(859) := '7D0A2E742D526567696F6E202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0A7D0A2E742D426F64792D616374696F6E73207B0A20200A20200A20200A7D0A2E742D';
wwv_flow_api.g_varchar2_table(860) := '426F64792D616374696F6E73202E612D4D696E6943616C207B0A2020626F726465723A2031707820736F6C696420236439643964393B0A2020626F726465722D7261646975733A203070783B0A20206261636B67726F756E642D636F6C6F723A20236632';
wwv_flow_api.g_varchar2_table(861) := '663266323B0A7D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D7469746C65207B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461794F665765656B20';
wwv_flow_api.g_varchar2_table(862) := '7B0A2020636F6C6F723A20233732373237323B0A7D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D646179207B0A2020626F726465722D636F6C6F723A20236563656365633B0A2020636F6C6F723A20233333333333333B0A7D0A';
wwv_flow_api.g_varchar2_table(863) := '2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461792E69732D746F646179202E612D4D696E6943616C2D64617465207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C203135322C203138352C20302E';
wwv_flow_api.g_varchar2_table(864) := '3933293B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461792E69732D616374697665202E612D4D696E6943616C2D6461746520';
wwv_flow_api.g_varchar2_table(865) := '7B0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461792E69732D7765656B656E64207B0A2020626163';
wwv_flow_api.g_varchar2_table(866) := '6B67726F756E642D636F6C6F723A20236564656465643B0A7D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0A20206261636B67726F756E642D636F6C6F723A20236538653865383B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(867) := '2D426F64792D696E666F207B0A20200A20200A20200A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C207B0A2020626F726465723A2031707820736F6C696420233761616363643B0A2020626F726465722D7261646975733A203070783B';
wwv_flow_api.g_varchar2_table(868) := '0A20206261636B67726F756E642D636F6C6F723A20233966633364623B0A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D7469746C65207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D426F64792D696E666F202E612D';
wwv_flow_api.g_varchar2_table(869) := '4D696E6943616C2D6461794F665765656B207B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D646179207B0A2020626F726465722D636F6C6F723A20233936626464383B0A2020636F6C';
wwv_flow_api.g_varchar2_table(870) := '6F723A20233030303030303B0A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D746F646179202E612D4D696E6943616C2D64617465207B0A20206261636B67726F756E642D636F6C6F723A2072676261283131362C20';
wwv_flow_api.g_varchar2_table(871) := '3135322C203138352C20302E3933293B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3933293B0A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D616374697665202E612D4D696E69';
wwv_flow_api.g_varchar2_table(872) := '43616C2D64617465207B0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D7765656B656E64207B';
wwv_flow_api.g_varchar2_table(873) := '0A20206261636B67726F756E642D636F6C6F723A20233938626564383B0A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0A20206261636B67726F756E642D636F6C6F723A20233930626164353B0A7D';
wwv_flow_api.g_varchar2_table(874) := '0A0A2E742D426F6479202E612D44657461696C6564436F6E74656E744C6973742D7469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D426F64792D696E666F202E612D44657461696C6564436F6E74656E744C6973742D746974';
wwv_flow_api.g_varchar2_table(875) := '6C65207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D526567696F6E202E612D44657461696C6564436F6E74656E744C6973742D7469746C652C0A2E742D427574746F6E526567696F6E202E612D44657461696C6564436F6E74656E744C';
wwv_flow_api.g_varchar2_table(876) := '6973742D7469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D6974656D3A666F637573202E612D44657461696C6564436F6E74656E744C6973742D686561646572';
wwv_flow_api.g_varchar2_table(877) := '207B0A2020626F782D736861646F773A2030203020302031707820726762612838342C203132372C203136362C20302E39332920696E7365743B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D6974656D2E69732D657870';
wwv_flow_api.g_varchar2_table(878) := '616E646564202E612D44657461696C6564436F6E74656E744C6973742D74726967676572207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020626F782D736861646F773A20302030203020317078207267626128313136';
wwv_flow_api.g_varchar2_table(879) := '2C203135322C203138352C20302E39332920696E7365743B0A2020636F6C6F723A2072676261283131362C203135322C203138352C20302E3933293B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D6974656D2E69732D65';
wwv_flow_api.g_varchar2_table(880) := '7870616E646564202E612D44657461696C6564436F6E74656E744C6973742D747269676765723A666F637573207B0A20206261636B67726F756E642D636F6C6F723A20726762612838342C203132372C203136362C20302E3933293B0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(881) := '3A2072676261283235352C203235352C203235352C20302E3933293B0A2020626F782D736861646F773A2030203020302031707820726762612838342C203132372C203136362C20302E39332920696E7365743B0A7D0A626F6479202E612D4465746169';
wwv_flow_api.g_varchar2_table(882) := '6C6564436F6E74656E744C6973742D6865616465723A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D69636F6E207B0A2020636F';
wwv_flow_api.g_varchar2_table(883) := '6C6F723A207267626128302C20302C20302C20302E35293B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D6261646765207B0A2020636F6C6F723A20233030303030303B0A7D0A626F6479202E612D44657461696C656443';
wwv_flow_api.g_varchar2_table(884) := '6F6E74656E744C6973742D74726967676572207B0A20206261636B67726F756E643A2072676261283235352C203235352C203235352C20302E3933293B0A2020636F6C6F723A207267626128302C20302C20302C20302E3735293B0A7D0A626F6479202E';
wwv_flow_api.g_varchar2_table(885) := '612D44657461696C6564436F6E74656E744C6973742D747269676765723A686F766572207B0A2020636F6C6F723A20726762612838342C203132372C203136362C20302E3933293B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C69';
wwv_flow_api.g_varchar2_table(886) := '73742D747269676765723A666F637573207B0A2020636F6C6F723A20726762612838342C203132372C203136362C20302E3933293B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D626F6479207B0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(887) := '756E642D636F6C6F723A20236666666666663B0A7D0A626F6479202E636F6E74656E742D746F6F6C746970202E612D44657461696C6564436F6E74656E744C6973742D626F6479207B0A20206261636B67726F756E642D636F6C6F723A20726762612836';
wwv_flow_api.g_varchar2_table(888) := '372C203130312C203133322C20302E3933293B0A7D0A626F6479202E636F6E74656E742D746F6F6C746970202E612D44657461696C6564436F6E74656E744C6973742D626F64792D726F772D6C6162656C207B0A2020636F6C6F723A2072676261283235';
wwv_flow_api.g_varchar2_table(889) := '352C203235352C203235352C20302E3933293B0A7D0A626F6479202E636F6E74656E742D746F6F6C746970202E612D44657461696C6564436F6E74656E744C6973742D626F64792D726F772D636F6E74656E74207B0A2020636F6C6F723A207267626128';
wwv_flow_api.g_varchar2_table(890) := '3138342C203230322C203231392C20302E3933293B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D626F64792D686561646572207B0A20206261636B67726F756E643A2072676261283235352C203235352C203235352C20';
wwv_flow_api.g_varchar2_table(891) := '302E3933293B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D626F64792D726F772D6C6162656C207B0A2020636F6C6F723A20233030303030303B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973';
wwv_flow_api.g_varchar2_table(892) := '742D626F64792D726F772D636F6E74656E74207B0A2020636F6C6F723A20726762612836372C203130312C203133322C20302E3933293B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742E612D44657461696C6564436F6E74';
wwv_flow_api.g_varchar2_table(893) := '656E744C6973742D2D746F6F6C746970202E612D44657461696C6564436F6E74656E744C6973742D626F64793A6166746572207B0A2020626F726465722D636F6C6F723A2023666666666666207472616E73706172656E743B0A7D0A626F6479202E612D';
wwv_flow_api.g_varchar2_table(894) := '44657461696C6564436F6E74656E744C6973742E612D44657461696C6564436F6E74656E744C6973742D2D746F6F6C746970202E612D44657461696C6564436F6E74656E744C6973742D626F64793A6265666F7265207B0A2020626F726465722D636F6C';
wwv_flow_api.g_varchar2_table(895) := '6F723A2072676261283235352C203235352C203235352C20302E393329207472616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970207B0A20202D7765626B69742D626F726465722D726164';
wwv_flow_api.g_varchar2_table(896) := '6975733A203070783B0A20202D6D6F7A2D626F726465722D7261646975733A203070783B0A2020626F726465722D7261646975733A203070783B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E612D446574';
wwv_flow_api.g_varchar2_table(897) := '61696C6564436F6E74656E744C6973742D626F6479207B0A20202D7765626B69742D626F726465722D7261646975733A203070783B0A20202D6D6F7A2D626F726465722D7261646975733A203070783B0A2020626F726465722D7261646975733A203070';
wwv_flow_api.g_varchar2_table(898) := '783B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E626F74746F6D3A6265666F7265207B0A2020626F726465722D636F6C6F723A20726762612836372C203130312C203133322C20302E3933';
wwv_flow_api.g_varchar2_table(899) := '29207472616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E626F74746F6D3A6166746572207B0A2020626F726465722D636F6C6F723A20726762612836372C20313031';
wwv_flow_api.g_varchar2_table(900) := '2C203133322C20302E393329207472616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E626F74746F6D2E6C696768743A6166746572207B0A2020626F726465722D636F';
wwv_flow_api.g_varchar2_table(901) := '6C6F723A2023656165616561207472616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E746F703A6265666F7265207B0A2020626F726465722D636F6C6F723A20726762';
wwv_flow_api.g_varchar2_table(902) := '612836372C203130312C203133322C20302E393329207472616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E746F703A6166746572207B0A2020626F726465722D636F';
wwv_flow_api.g_varchar2_table(903) := '6C6F723A20726762612836372C203130312C203133322C20302E393329207472616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E6C6566743A6265666F7265207B0A20';
wwv_flow_api.g_varchar2_table(904) := '20626F726465722D636F6C6F723A207472616E73706172656E742072676261283235352C203235352C203235352C20302E393329207472616E73706172656E74207472616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E';
wwv_flow_api.g_varchar2_table(905) := '74656E742D746F6F6C746970202E6172726F772E6C6566743A6166746572207B0A2020626F726465722D636F6C6F723A207472616E73706172656E7420726762612836372C203130312C203133322C20302E393329207472616E73706172656E74207472';
wwv_flow_api.g_varchar2_table(906) := '616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E72696768743A6265666F7265207B0A2020626F726465722D636F6C6F723A207472616E73706172656E74207472616E';
wwv_flow_api.g_varchar2_table(907) := '73706172656E74207472616E73706172656E74207267626128302C20302C20302C20302E35293B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E72696768743A6166746572207B0A2020626F';
wwv_flow_api.g_varchar2_table(908) := '726465722D636F6C6F723A207472616E73706172656E74207472616E73706172656E74207472616E73706172656E7420726762612836372C203130312C203133322C20302E3933293B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E';
wwv_flow_api.g_varchar2_table(909) := '742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203129207B0A20206261636B67726F756E642D636F6C6F723A20236666326435353B0A7D0A626F6479202E742D42616467';
wwv_flow_api.g_varchar2_table(910) := '654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42';
wwv_flow_api.g_varchar2_table(911) := '616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820312920612E742D42616467654C6973742D777261703A686F766572207B0A202062';
wwv_flow_api.g_varchar2_table(912) := '6F782D736861646F773A2030202D38707820302030202366663630376520696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D69';
wwv_flow_api.g_varchar2_table(913) := '74656D3A6E74682D6368696C6428203229207B0A20206261636B67726F756E642D636F6C6F723A20233030376166663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E74';
wwv_flow_api.g_varchar2_table(914) := '2D42616467654C6973742D6974656D3A6E74682D6368696C64282032292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247';
wwv_flow_api.g_varchar2_table(915) := '202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820322920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202333333935666620696E7365743B0A';
wwv_flow_api.g_varchar2_table(916) := '7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203329207B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(917) := '723A20236666393530303B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282033292061207B0A202063';
wwv_flow_api.g_varchar2_table(918) := '6F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820332920612E742D';
wwv_flow_api.g_varchar2_table(919) := '42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366666161333320696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C697374';
wwv_flow_api.g_varchar2_table(920) := '2D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203429207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A7D0A626F6479202E742D42616467654C6973742D2D64617368';
wwv_flow_api.g_varchar2_table(921) := '2E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282034292061207B0A2020636F6C6F723A20233037316630623B0A7D0A626F6479202E742D42616467654C6973742D2D64';
wwv_flow_api.g_varchar2_table(922) := '6173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820342920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A20';
wwv_flow_api.g_varchar2_table(923) := '30202D38707820302030202332616338343520696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D636869';
wwv_flow_api.g_varchar2_table(924) := '6C6428203529207B0A20206261636B67726F756E642D636F6C6F723A20233865386539333B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(925) := '6974656D3A6E74682D6368696C64282035292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C69';
wwv_flow_api.g_varchar2_table(926) := '73742D6974656D3A6E74682D6368696C642820352920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202361386138616320696E7365743B0A7D0A626F6479202E742D42';
wwv_flow_api.g_varchar2_table(927) := '616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203629207B0A20206261636B67726F756E642D636F6C6F723A20233334616164633B';
wwv_flow_api.g_varchar2_table(928) := '0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282036292061207B0A2020636F6C6F723A202366666666';
wwv_flow_api.g_varchar2_table(929) := '66663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820362920612E742D42616467654C6973742D77';
wwv_flow_api.g_varchar2_table(930) := '7261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202335666263653420696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247';
wwv_flow_api.g_varchar2_table(931) := '202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203729207B0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(932) := '742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282037292061207B0A2020636F6C6F723A20233030303030303B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D4261646765';
wwv_flow_api.g_varchar2_table(933) := '4C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820372920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D3870782030203020';
wwv_flow_api.g_varchar2_table(934) := '2363636133303020696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203829207B0A2020';
wwv_flow_api.g_varchar2_table(935) := '6261636B67726F756E642D636F6C6F723A20233561633866613B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368';
wwv_flow_api.g_varchar2_table(936) := '696C64282038292061207B0A2020636F6C6F723A20233032333935323B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E7468';
wwv_flow_api.g_varchar2_table(937) := '2D6368696C642820382920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202332386237663920696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D64';
wwv_flow_api.g_varchar2_table(938) := '6173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203929207B0A20206261636B67726F756E642D636F6C6F723A20236666336233303B0A7D0A626F6479202E742D';
wwv_flow_api.g_varchar2_table(939) := '42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282039292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F647920';
wwv_flow_api.g_varchar2_table(940) := '2E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820392920612E742D42616467654C6973742D777261703A686F766572207B';
wwv_flow_api.g_varchar2_table(941) := '0A2020626F782D736861646F773A2030202D38707820302030202366663662363320696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C69';
wwv_flow_api.g_varchar2_table(942) := '73742D6974656D3A6E74682D6368696C642820313029207B0A20206261636B67726F756E642D636F6C6F723A20233538353664363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F726564';
wwv_flow_api.g_varchar2_table(943) := '4247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203130292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C';
wwv_flow_api.g_varchar2_table(944) := '6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031302920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202338313766653020';
wwv_flow_api.g_varchar2_table(945) := '696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313129207B0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(946) := '756E642D636F6C6F723A20236666353737373B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203131';
wwv_flow_api.g_varchar2_table(947) := '292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(948) := '282031312920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366663861613020696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E74';
wwv_flow_api.g_varchar2_table(949) := '2D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313229207B0A20206261636B67726F756E642D636F6C6F723A20233333393566663B0A7D0A626F6479202E742D42616467';
wwv_flow_api.g_varchar2_table(950) := '654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203132292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D';
wwv_flow_api.g_varchar2_table(951) := '42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031322920612E742D42616467654C6973742D777261703A686F766572207B0A20';
wwv_flow_api.g_varchar2_table(952) := '20626F782D736861646F773A2030202D38707820302030202336366166666620696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C697374';
wwv_flow_api.g_varchar2_table(953) := '2D6974656D3A6E74682D6368696C642820313329207B0A20206261636B67726F756E642D636F6C6F723A20236666616133333B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247';
wwv_flow_api.g_varchar2_table(954) := '202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203133292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F72';
wwv_flow_api.g_varchar2_table(955) := '65644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031332920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366663935303020696E';
wwv_flow_api.g_varchar2_table(956) := '7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313429207B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(957) := '642D636F6C6F723A20233730653138333B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031342920';
wwv_flow_api.g_varchar2_table(958) := '61207B0A2020636F6C6F723A20233338346333633B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820';
wwv_flow_api.g_varchar2_table(959) := '31342920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202334366438356620696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42';
wwv_flow_api.g_varchar2_table(960) := '616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313529207B0A20206261636B67726F756E642D636F6C6F723A20236135613561393B0A7D0A626F6479202E742D42616467654C';
wwv_flow_api.g_varchar2_table(961) := '6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203135292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D4261';
wwv_flow_api.g_varchar2_table(962) := '6467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031352920612E742D42616467654C6973742D777261703A686F766572207B0A202062';
wwv_flow_api.g_varchar2_table(963) := '6F782D736861646F773A2030202D38707820302030202362666266633220696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D69';
wwv_flow_api.g_varchar2_table(964) := '74656D3A6E74682D6368696C642820313629207B0A20206261636B67726F756E642D636F6C6F723A20233564626265333B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E';
wwv_flow_api.g_varchar2_table(965) := '742D42616467654C6973742D6974656D3A6E74682D6368696C6428203136292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F726564';
wwv_flow_api.g_varchar2_table(966) := '4247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031362920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202333316139646220696E7365';
wwv_flow_api.g_varchar2_table(967) := '743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313729207B0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(968) := '636F6C6F723A20236666643633333B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313729206120';
wwv_flow_api.g_varchar2_table(969) := '7B0A2020636F6C6F723A20233333333333333B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203137';
wwv_flow_api.g_varchar2_table(970) := '2920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366666363303020696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D426164';
wwv_flow_api.g_varchar2_table(971) := '67654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313829207B0A20206261636B67726F756E642D636F6C6F723A20233762643366623B0A7D0A626F6479202E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(972) := '742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203138292061207B0A2020636F6C6F723A20233335363137353B0A7D0A626F6479202E742D42616467';
wwv_flow_api.g_varchar2_table(973) := '654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031382920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F78';
wwv_flow_api.g_varchar2_table(974) := '2D736861646F773A2030202D38707820302030202334396332666120696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D697465';
wwv_flow_api.g_varchar2_table(975) := '6D3A6E74682D6368696C642820313929207B0A20206261636B67726F756E642D636F6C6F723A20236666363235393B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D';
wwv_flow_api.g_varchar2_table(976) := '42616467654C6973742D6974656D3A6E74682D6368696C6428203139292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247';
wwv_flow_api.g_varchar2_table(977) := '202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031392920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366663932386320696E7365743B';
wwv_flow_api.g_varchar2_table(978) := '0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323029207B0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(979) := '6C6F723A20233739373864653B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203230292061207B0A';
wwv_flow_api.g_varchar2_table(980) := '2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032302920';
wwv_flow_api.g_varchar2_table(981) := '612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202361326131653820696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D4261646765';
wwv_flow_api.g_varchar2_table(982) := '4C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323129207B0A20206261636B67726F756E642D636F6C6F723A20236536323934643B0A7D0A626F6479202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(983) := '2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203231292061207B0A2020636F6C6F723A20236536653665363B0A7D0A626F6479202E742D42616467654C';
wwv_flow_api.g_varchar2_table(984) := '6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032312920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D73';
wwv_flow_api.g_varchar2_table(985) := '6861646F773A2030202D38707820302030202365623536373220696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A';
wwv_flow_api.g_varchar2_table(986) := '6E74682D6368696C642820323229207B0A20206261636B67726F756E642D636F6C6F723A20233030366565363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D4261';
wwv_flow_api.g_varchar2_table(987) := '6467654C6973742D6974656D3A6E74682D6368696C6428203232292061207B0A2020636F6C6F723A20236536653665363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E';
wwv_flow_api.g_varchar2_table(988) := '742D42616467654C6973742D6974656D3A6E74682D6368696C64282032322920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202331613837666620696E7365743B0A7D';
wwv_flow_api.g_varchar2_table(989) := '0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323329207B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(990) := '723A20236536383630303B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203233292061207B0A2020';
wwv_flow_api.g_varchar2_table(991) := '636F6C6F723A20236536653665363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032332920612E';
wwv_flow_api.g_varchar2_table(992) := '742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366666130316120696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C69';
wwv_flow_api.g_varchar2_table(993) := '73742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323429207B0A20206261636B67726F756E642D636F6C6F723A20233434633335613B0A7D0A626F6479202E742D42616467654C6973742D2D64';
wwv_flow_api.g_varchar2_table(994) := '6173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203234292061207B0A2020636F6C6F723A20233036316330613B0A7D0A626F6479202E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(995) := '742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032342920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861';
wwv_flow_api.g_varchar2_table(996) := '646F773A2030202D38707820302030202336626430376320696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74';
wwv_flow_api.g_varchar2_table(997) := '682D6368696C642820323529207B0A20206261636B67726F756E642D636F6C6F723A20233830383038343B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467';
wwv_flow_api.g_varchar2_table(998) := '654C6973742D6974656D3A6E74682D6368696C6428203235292061207B0A2020636F6C6F723A20236536653665363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D';
wwv_flow_api.g_varchar2_table(999) := '42616467654C6973742D6974656D3A6E74682D6368696C64282032352920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202339613961396420696E7365743B0A7D0A62';
wwv_flow_api.g_varchar2_table(1000) := '6F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323629207B0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1001) := '20233266393963363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203236292061207B0A2020636F';
wwv_flow_api.g_varchar2_table(1002) := '6C6F723A20236536653665363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032362920612E742D';
wwv_flow_api.g_varchar2_table(1003) := '42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202335326166643620696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C697374';
wwv_flow_api.g_varchar2_table(1004) := '2D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323729207B0A20206261636B67726F756E642D636F6C6F723A20236536623830303B0A7D0A626F6479202E742D42616467654C6973742D2D646173';
wwv_flow_api.g_varchar2_table(1005) := '682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203237292061207B0A2020636F6C6F723A20233030303030303B0A7D0A626F6479202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1006) := '2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032372920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F';
wwv_flow_api.g_varchar2_table(1007) := '773A2030202D38707820302030202362333866303020696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D';
wwv_flow_api.g_varchar2_table(1008) := '6368696C642820323829207B0A20206261636B67726F756E642D636F6C6F723A20233531623465313B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C';
wwv_flow_api.g_varchar2_table(1009) := '6973742D6974656D3A6E74682D6368696C6428203238292061207B0A2020636F6C6F723A20233032333434613B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D4261';
wwv_flow_api.g_varchar2_table(1010) := '6467654C6973742D6974656D3A6E74682D6368696C64282032382920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202337636337653920696E7365743B0A7D0A626F64';
wwv_flow_api.g_varchar2_table(1011) := '79202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323929207B0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1012) := '6536333532623B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203239292061207B0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(1013) := '723A20236536653665363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032392920612E742D4261';
wwv_flow_api.g_varchar2_table(1014) := '6467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202365623630353920696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D';
wwv_flow_api.g_varchar2_table(1015) := '636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820333029207B0A20206261636B67726F756E642D636F6C6F723A20233466346463313B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E';
wwv_flow_api.g_varchar2_table(1016) := '742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203330292061207B0A2020636F6C6F723A20236536653665363B0A7D0A626F6479202E742D42616467654C6973742D2D64';
wwv_flow_api.g_varchar2_table(1017) := '6173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282033302920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A';
wwv_flow_api.g_varchar2_table(1018) := '2030202D38707820302030202337353733636520696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74';
wwv_flow_api.g_varchar2_table(1019) := '682D6368696C6428203129202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236666313434303B0A2020636F6C6F723A20236666313434303B0A7D0A626F6479202E742D42616467654C6973742D2D636972';
wwv_flow_api.g_varchar2_table(1020) := '63756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203129202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A62';
wwv_flow_api.g_varchar2_table(1021) := '6F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203129202E742D42616467654C6973742D76616C7565';
wwv_flow_api.g_varchar2_table(1022) := '2061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20236666326435353B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F72';
wwv_flow_api.g_varchar2_table(1023) := '65644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203229202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233030366565363B0A2020636F6C6F723A20233030366565363B';
wwv_flow_api.g_varchar2_table(1024) := '0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203229202E742D42616467654C6973742D77';
wwv_flow_api.g_varchar2_table(1025) := '726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D636869';
wwv_flow_api.g_varchar2_table(1026) := '6C6428203229202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20233030376166663B0A7D0A626F6479202E742D42616467654C6973742D2D6369';
wwv_flow_api.g_varchar2_table(1027) := '7263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203329202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1028) := '6536383630303B0A2020636F6C6F723A20236536383630303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E7468';
wwv_flow_api.g_varchar2_table(1029) := '2D6368696C6428203329202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F726564424720';
wwv_flow_api.g_varchar2_table(1030) := '2E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203329202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A2023666639353030';
wwv_flow_api.g_varchar2_table(1031) := '3B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203429202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1032) := '76616C7565207B0A2020626F726465722D636F6C6F723A20233337643535323B0A2020636F6C6F723A20233337643535323B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265';
wwv_flow_api.g_varchar2_table(1033) := '644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203429202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61';
wwv_flow_api.g_varchar2_table(1034) := '722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203429202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233037316630623B0A2020';
wwv_flow_api.g_varchar2_table(1035) := '6261636B67726F756E642D636F6C6F723A20233463643936343B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74';
wwv_flow_api.g_varchar2_table(1036) := '682D6368696C6428203529202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233831383138373B0A2020636F6C6F723A20233831383138373B0A7D0A626F6479202E742D42616467654C6973742D2D636972';
wwv_flow_api.g_varchar2_table(1037) := '63756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203529202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A62';
wwv_flow_api.g_varchar2_table(1038) := '6F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203529202E742D42616467654C6973742D76616C7565';
wwv_flow_api.g_varchar2_table(1039) := '2061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20233865386539333B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F72';
wwv_flow_api.g_varchar2_table(1040) := '65644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203629202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233234396564323B0A2020636F6C6F723A20233234396564323B';
wwv_flow_api.g_varchar2_table(1041) := '0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203629202E742D42616467654C6973742D77';
wwv_flow_api.g_varchar2_table(1042) := '726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D636869';
wwv_flow_api.g_varchar2_table(1043) := '6C6428203629202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20233334616164633B0A7D0A626F6479202E742D42616467654C6973742D2D6369';
wwv_flow_api.g_varchar2_table(1044) := '7263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203729202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1045) := '6536623830303B0A2020636F6C6F723A20236536623830303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E7468';
wwv_flow_api.g_varchar2_table(1046) := '2D6368696C6428203729202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F726564424720';
wwv_flow_api.g_varchar2_table(1047) := '2E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203729202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233030303030303B0A20206261636B67726F756E642D636F6C6F723A2023666663633030';
wwv_flow_api.g_varchar2_table(1048) := '3B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203829202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1049) := '76616C7565207B0A2020626F726465722D636F6C6F723A20233431633066393B0A2020636F6C6F723A20233431633066393B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265';
wwv_flow_api.g_varchar2_table(1050) := '644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203829202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61';
wwv_flow_api.g_varchar2_table(1051) := '722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203829202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233032333935323B0A2020';
wwv_flow_api.g_varchar2_table(1052) := '6261636B67726F756E642D636F6C6F723A20233561633866613B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74';
wwv_flow_api.g_varchar2_table(1053) := '682D6368696C6428203929202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236666323331373B0A2020636F6C6F723A20236666323331373B0A7D0A626F6479202E742D42616467654C6973742D2D636972';
wwv_flow_api.g_varchar2_table(1054) := '63756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203929202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A62';
wwv_flow_api.g_varchar2_table(1055) := '6F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203929202E742D42616467654C6973742D76616C7565';
wwv_flow_api.g_varchar2_table(1056) := '2061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20236666336233303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F72';
wwv_flow_api.g_varchar2_table(1057) := '65644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313029202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233434343164313B0A2020636F6C6F723A2023343434316431';
wwv_flow_api.g_varchar2_table(1058) := '3B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313029202E742D42616467654C697374';
wwv_flow_api.g_varchar2_table(1059) := '2D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D63';
wwv_flow_api.g_varchar2_table(1060) := '68696C642820313029202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20233538353664363B0A7D0A626F6479202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1061) := '2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313129202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F';
wwv_flow_api.g_varchar2_table(1062) := '723A20236666336536323B0A2020636F6C6F723A20236666336536323B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D';
wwv_flow_api.g_varchar2_table(1063) := '3A6E74682D6368696C642820313129202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F72';
wwv_flow_api.g_varchar2_table(1064) := '65644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313129202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1065) := '6666353737373B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313229202E742D426164';
wwv_flow_api.g_varchar2_table(1066) := '67654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233139383766663B0A2020636F6C6F723A20233139383766663B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1067) := '2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313229202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1068) := '2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313229202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A202366';
wwv_flow_api.g_varchar2_table(1069) := '66666666663B0A20206261636B67726F756E642D636F6C6F723A20233333393566663B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(1070) := '742D6974656D3A6E74682D6368696C642820313329202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236666613031393B0A2020636F6C6F723A20236666613031393B0A7D0A626F6479202E742D42616467';
wwv_flow_api.g_varchar2_table(1071) := '654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313329202E742D42616467654C6973742D77726170202E742D42616467654C69';
wwv_flow_api.g_varchar2_table(1072) := '73742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313329202E742D426164';
wwv_flow_api.g_varchar2_table(1073) := '67654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20236666616133333B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467';
wwv_flow_api.g_varchar2_table(1074) := '654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313429202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233562646337313B0A2020636F';
wwv_flow_api.g_varchar2_table(1075) := '6C6F723A20233562646337313B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031342920';
wwv_flow_api.g_varchar2_table(1076) := '2E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(1077) := '742D6974656D3A6E74682D6368696C642820313429202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233338346333633B0A20206261636B67726F756E642D636F6C6F723A20233730653138333B0A7D0A626F6479202E';
wwv_flow_api.g_varchar2_table(1078) := '742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313529202E742D42616467654C6973742D76616C7565207B0A20';
wwv_flow_api.g_varchar2_table(1079) := '20626F726465722D636F6C6F723A20233938393839633B0A2020636F6C6F723A20233938393839633B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D4261';
wwv_flow_api.g_varchar2_table(1080) := '6467654C6973742D6974656D3A6E74682D6368696C642820313529202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467';
wwv_flow_api.g_varchar2_table(1081) := '654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313529202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(1082) := '756E642D636F6C6F723A20236135613561393B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(1083) := '2820313629202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233437623264663B0A2020636F6C6F723A20233437623264663B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E';
wwv_flow_api.g_varchar2_table(1084) := '742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313629202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E';
wwv_flow_api.g_varchar2_table(1085) := '742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313629202E742D42616467654C6973742D76616C75652061207B';
wwv_flow_api.g_varchar2_table(1086) := '0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20233564626265333B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247';
wwv_flow_api.g_varchar2_table(1087) := '202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313729202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236666643131393B0A2020636F6C6F723A20236666643131393B0A7D0A';
wwv_flow_api.g_varchar2_table(1088) := '626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313729202E742D42616467654C6973742D777261';
wwv_flow_api.g_varchar2_table(1089) := '70202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(1090) := '2820313729202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233333333333333B0A20206261636B67726F756E642D636F6C6F723A20236666643633333B0A7D0A626F6479202E742D42616467654C6973742D2D636972';
wwv_flow_api.g_varchar2_table(1091) := '63756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313829202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1092) := '3632636266613B0A2020636F6C6F723A20233632636266613B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E7468';
wwv_flow_api.g_varchar2_table(1093) := '2D6368696C642820313829202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247';
wwv_flow_api.g_varchar2_table(1094) := '202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313829202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233335363137353B0A20206261636B67726F756E642D636F6C6F723A202337626433';
wwv_flow_api.g_varchar2_table(1095) := '66623B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313929202E742D42616467654C69';
wwv_flow_api.g_varchar2_table(1096) := '73742D76616C7565207B0A2020626F726465722D636F6C6F723A20236666346134303B0A2020636F6C6F723A20236666346134303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C';
wwv_flow_api.g_varchar2_table(1097) := '6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313929202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D636972';
wwv_flow_api.g_varchar2_table(1098) := '63756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313929202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666';
wwv_flow_api.g_varchar2_table(1099) := '663B0A20206261636B67726F756E642D636F6C6F723A20236666363235393B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974';
wwv_flow_api.g_varchar2_table(1100) := '656D3A6E74682D6368696C642820323029202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233635363364393B0A2020636F6C6F723A20233635363364393B0A7D0A626F6479202E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(1101) := '742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323029202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76';
wwv_flow_api.g_varchar2_table(1102) := '616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323029202E742D42616467654C69';
wwv_flow_api.g_varchar2_table(1103) := '73742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20233739373864653B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(1104) := '742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323129202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236462316133663B0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(1105) := '20236462316133663B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323129202E742D42';
wwv_flow_api.g_varchar2_table(1106) := '616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974';
wwv_flow_api.g_varchar2_table(1107) := '656D3A6E74682D6368696C642820323129202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236536653665363B0A20206261636B67726F756E642D636F6C6F723A20236536323934643B0A7D0A626F6479202E742D4261';
wwv_flow_api.g_varchar2_table(1108) := '6467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323229202E742D42616467654C6973742D76616C7565207B0A2020626F72';
wwv_flow_api.g_varchar2_table(1109) := '6465722D636F6C6F723A20233030363263633B0A2020636F6C6F723A20233030363263633B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C';
wwv_flow_api.g_varchar2_table(1110) := '6973742D6974656D3A6E74682D6368696C642820323229202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(1111) := '742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323229202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236536653665363B0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(1112) := '636F6C6F723A20233030366565363B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203233';
wwv_flow_api.g_varchar2_table(1113) := '29202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236363373730303B0A2020636F6C6F723A20236363373730303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D4261';
wwv_flow_api.g_varchar2_table(1114) := '6467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323329202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D4261';
wwv_flow_api.g_varchar2_table(1115) := '6467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323329202E742D42616467654C6973742D76616C75652061207B0A202063';
wwv_flow_api.g_varchar2_table(1116) := '6F6C6F723A20236536653665363B0A20206261636B67726F756E642D636F6C6F723A20236536383630303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D';
wwv_flow_api.g_varchar2_table(1117) := '42616467654C6973742D6974656D3A6E74682D6368696C642820323429202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233361623434663B0A2020636F6C6F723A20233361623434663B0A7D0A626F6479';
wwv_flow_api.g_varchar2_table(1118) := '202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323429202E742D42616467654C6973742D77726170202E74';
wwv_flow_api.g_varchar2_table(1119) := '2D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203234';
wwv_flow_api.g_varchar2_table(1120) := '29202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233036316330613B0A20206261636B67726F756E642D636F6C6F723A20233434633335613B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61';
wwv_flow_api.g_varchar2_table(1121) := '722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323529202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A202337333733';
wwv_flow_api.g_varchar2_table(1122) := '37373B0A2020636F6C6F723A20233733373337373B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D636869';
wwv_flow_api.g_varchar2_table(1123) := '6C642820323529202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D';
wwv_flow_api.g_varchar2_table(1124) := '42616467654C6973742D6974656D3A6E74682D6368696C642820323529202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236536653665363B0A20206261636B67726F756E642D636F6C6F723A20233830383038343B0A';
wwv_flow_api.g_varchar2_table(1125) := '7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323629202E742D42616467654C6973742D76';
wwv_flow_api.g_varchar2_table(1126) := '616C7565207B0A2020626F726465722D636F6C6F723A20233261383962313B0A2020636F6C6F723A20233261383962313B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F726564';
wwv_flow_api.g_varchar2_table(1127) := '4247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323629202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61';
wwv_flow_api.g_varchar2_table(1128) := '722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323629202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236536653665363B0A20';
wwv_flow_api.g_varchar2_table(1129) := '206261636B67726F756E642D636F6C6F723A20233266393963363B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E';
wwv_flow_api.g_varchar2_table(1130) := '74682D6368696C642820323729202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236363613330303B0A2020636F6C6F723A20236363613330303B0A7D0A626F6479202E742D42616467654C6973742D2D63';
wwv_flow_api.g_varchar2_table(1131) := '697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323729202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C7565';
wwv_flow_api.g_varchar2_table(1132) := '2C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323729202E742D42616467654C6973742D76';
wwv_flow_api.g_varchar2_table(1133) := '616C75652061207B0A2020636F6C6F723A20233030303030303B0A20206261636B67726F756E642D636F6C6F723A20236536623830303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D63';
wwv_flow_api.g_varchar2_table(1134) := '6F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323829202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233362616264643B0A2020636F6C6F723A20233362';
wwv_flow_api.g_varchar2_table(1135) := '616264643B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323829202E742D4261646765';
wwv_flow_api.g_varchar2_table(1136) := '4C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E';
wwv_flow_api.g_varchar2_table(1137) := '74682D6368696C642820323829202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233032333434613B0A20206261636B67726F756E642D636F6C6F723A20233531623465313B0A7D0A626F6479202E742D42616467654C';
wwv_flow_api.g_varchar2_table(1138) := '6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323929202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D';
wwv_flow_api.g_varchar2_table(1139) := '636F6C6F723A20236464323531623B0A2020636F6C6F723A20236464323531623B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1140) := '6974656D3A6E74682D6368696C642820323929202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D63';
wwv_flow_api.g_varchar2_table(1141) := '6F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323929202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236536653665363B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(1142) := '723A20236536333532623B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820333029202E74';
wwv_flow_api.g_varchar2_table(1143) := '2D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233431343062353B0A2020636F6C6F723A20233431343062353B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C';
wwv_flow_api.g_varchar2_table(1144) := '6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820333029202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C';
wwv_flow_api.g_varchar2_table(1145) := '6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820333029202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(1146) := '3A20236536653665363B0A20206261636B67726F756E642D636F6C6F723A20233466346463313B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203129207B0A2020626163';
wwv_flow_api.g_varchar2_table(1147) := '6B67726F756E642D636F6C6F723A20236666326435353B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031292061207B0A2020636F6C6F723A20236666666666663B0A7D';
wwv_flow_api.g_varchar2_table(1148) := '0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820312920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820';
wwv_flow_api.g_varchar2_table(1149) := '302030202366663630376520696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203229207B0A20206261636B67726F756E642D636F6C6F723A20233030376166';
wwv_flow_api.g_varchar2_table(1150) := '663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E';
wwv_flow_api.g_varchar2_table(1151) := '742D42616467654C6973742D6974656D3A6E74682D6368696C642820322920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202333333935666620696E7365743B0A7D0A';
wwv_flow_api.g_varchar2_table(1152) := '2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203329207B0A20206261636B67726F756E642D636F6C6F723A20236666393530303B0A7D0A2E742D43617264732D2D636F6C6F7269';
wwv_flow_api.g_varchar2_table(1153) := '7A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282033292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D';
wwv_flow_api.g_varchar2_table(1154) := '6368696C642820332920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366666161333320696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E74';
wwv_flow_api.g_varchar2_table(1155) := '2D42616467654C6973742D6974656D3A6E74682D6368696C6428203429207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A';
wwv_flow_api.g_varchar2_table(1156) := '6E74682D6368696C64282034292061207B0A2020636F6C6F723A20233037316630623B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820342920612E742D42616467654C69';
wwv_flow_api.g_varchar2_table(1157) := '73742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202332616338343520696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D63';
wwv_flow_api.g_varchar2_table(1158) := '68696C6428203529207B0A20206261636B67726F756E642D636F6C6F723A20233865386539333B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282035292061207B0A202063';
wwv_flow_api.g_varchar2_table(1159) := '6F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820352920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F78';
wwv_flow_api.g_varchar2_table(1160) := '2D736861646F773A2030202D38707820302030202361386138616320696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203629207B0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(1161) := '6E642D636F6C6F723A20233334616164633B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282036292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43';
wwv_flow_api.g_varchar2_table(1162) := '617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820362920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D387078203020302023';
wwv_flow_api.g_varchar2_table(1163) := '35666263653420696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203729207B0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0A7D0A';
wwv_flow_api.g_varchar2_table(1164) := '2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282037292061207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D426164';
wwv_flow_api.g_varchar2_table(1165) := '67654C6973742D6974656D3A6E74682D6368696C642820372920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202363636133303020696E7365743B0A7D0A2E742D4361';
wwv_flow_api.g_varchar2_table(1166) := '7264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203829207B0A20206261636B67726F756E642D636F6C6F723A20233561633866613B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E74';
wwv_flow_api.g_varchar2_table(1167) := '2D42616467654C6973742D6974656D3A6E74682D6368696C64282038292061207B0A2020636F6C6F723A20233032333935323B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(1168) := '2820382920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202332386237663920696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467';
wwv_flow_api.g_varchar2_table(1169) := '654C6973742D6974656D3A6E74682D6368696C6428203929207B0A20206261636B67726F756E642D636F6C6F723A20236666336233303B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D63';
wwv_flow_api.g_varchar2_table(1170) := '68696C64282039292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820392920612E742D42616467654C6973742D7772';
wwv_flow_api.g_varchar2_table(1171) := '61703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366663662363320696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428';
wwv_flow_api.g_varchar2_table(1172) := '20313029207B0A20206261636B67726F756E642D636F6C6F723A20233538353664363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203130292061207B0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(1173) := '723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031302920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D73';
wwv_flow_api.g_varchar2_table(1174) := '6861646F773A2030202D38707820302030202338313766653020696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313129207B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(1175) := '642D636F6C6F723A20236666353737373B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203131292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43';
wwv_flow_api.g_varchar2_table(1176) := '617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031312920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D3870782030203020';
wwv_flow_api.g_varchar2_table(1177) := '2366663861613020696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313229207B0A20206261636B67726F756E642D636F6C6F723A20233333393566663B0A';
wwv_flow_api.g_varchar2_table(1178) := '7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203132292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D';
wwv_flow_api.g_varchar2_table(1179) := '42616467654C6973742D6974656D3A6E74682D6368696C64282031322920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202336366166666620696E7365743B0A7D0A2E';
wwv_flow_api.g_varchar2_table(1180) := '742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313329207B0A20206261636B67726F756E642D636F6C6F723A20236666616133333B0A7D0A2E742D43617264732D2D636F6C6F7269';
wwv_flow_api.g_varchar2_table(1181) := '7A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203133292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E7468';
wwv_flow_api.g_varchar2_table(1182) := '2D6368696C64282031332920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366663935303020696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A6520';
wwv_flow_api.g_varchar2_table(1183) := '2E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313429207B0A20206261636B67726F756E642D636F6C6F723A20233730653138333B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974';
wwv_flow_api.g_varchar2_table(1184) := '656D3A6E74682D6368696C6428203134292061207B0A2020636F6C6F723A20233338346333633B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031342920612E742D4261';
wwv_flow_api.g_varchar2_table(1185) := '6467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202334366438356620696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A';
wwv_flow_api.g_varchar2_table(1186) := '6E74682D6368696C642820313529207B0A20206261636B67726F756E642D636F6C6F723A20236135613561393B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031352920';
wwv_flow_api.g_varchar2_table(1187) := '61207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031352920612E742D42616467654C6973742D777261703A686F766572';
wwv_flow_api.g_varchar2_table(1188) := '207B0A2020626F782D736861646F773A2030202D38707820302030202362666266633220696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313629207B0A20';
wwv_flow_api.g_varchar2_table(1189) := '206261636B67726F756E642D636F6C6F723A20233564626265333B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203136292061207B0A2020636F6C6F723A202366666666';
wwv_flow_api.g_varchar2_table(1190) := '66663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031362920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030';
wwv_flow_api.g_varchar2_table(1191) := '202D38707820302030202333316139646220696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313729207B0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1192) := '20236666643633333B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203137292061207B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D43617264732D2D636F';
wwv_flow_api.g_varchar2_table(1193) := '6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031372920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366666363303020';
wwv_flow_api.g_varchar2_table(1194) := '696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313829207B0A20206261636B67726F756E642D636F6C6F723A20233762643366623B0A7D0A2E742D436172';
wwv_flow_api.g_varchar2_table(1195) := '64732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203138292061207B0A2020636F6C6F723A20233335363137353B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(1196) := '742D6974656D3A6E74682D6368696C64282031382920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202334396332666120696E7365743B0A7D0A2E742D43617264732D';
wwv_flow_api.g_varchar2_table(1197) := '2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313929207B0A20206261636B67726F756E642D636F6C6F723A20236666363235393B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D4261';
wwv_flow_api.g_varchar2_table(1198) := '6467654C6973742D6974656D3A6E74682D6368696C6428203139292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820';
wwv_flow_api.g_varchar2_table(1199) := '31392920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366663932386320696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D4261646765';
wwv_flow_api.g_varchar2_table(1200) := '4C6973742D6974656D3A6E74682D6368696C642820323029207B0A20206261636B67726F756E642D636F6C6F723A20233739373864653B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D63';
wwv_flow_api.g_varchar2_table(1201) := '68696C6428203230292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032302920612E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1202) := '777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202361326131653820696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C';
wwv_flow_api.g_varchar2_table(1203) := '642820323129207B0A20206261636B67726F756E642D636F6C6F723A20236536323934643B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203231292061207B0A2020636F';
wwv_flow_api.g_varchar2_table(1204) := '6C6F723A20236536653665363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032312920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F78';
wwv_flow_api.g_varchar2_table(1205) := '2D736861646F773A2030202D38707820302030202365623536373220696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323229207B0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(1206) := '756E642D636F6C6F723A20233030366565363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203232292061207B0A2020636F6C6F723A20236536653665363B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(1207) := '2D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032322920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D387078203020';
wwv_flow_api.g_varchar2_table(1208) := '30202331613837666620696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323329207B0A20206261636B67726F756E642D636F6C6F723A2023653638363030';
wwv_flow_api.g_varchar2_table(1209) := '3B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203233292061207B0A2020636F6C6F723A20236536653665363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E';
wwv_flow_api.g_varchar2_table(1210) := '742D42616467654C6973742D6974656D3A6E74682D6368696C64282032332920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366666130316120696E7365743B0A7D';
wwv_flow_api.g_varchar2_table(1211) := '0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323429207B0A20206261636B67726F756E642D636F6C6F723A20233434633335613B0A7D0A2E742D43617264732D2D636F6C6F';
wwv_flow_api.g_varchar2_table(1212) := '72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203234292061207B0A2020636F6C6F723A20233036316330613B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E';
wwv_flow_api.g_varchar2_table(1213) := '74682D6368696C64282032342920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202336626430376320696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A';
wwv_flow_api.g_varchar2_table(1214) := '65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323529207B0A20206261636B67726F756E642D636F6C6F723A20233830383038343B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1215) := '6974656D3A6E74682D6368696C6428203235292061207B0A2020636F6C6F723A20236536653665363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032352920612E742D';
wwv_flow_api.g_varchar2_table(1216) := '42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202339613961396420696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D697465';
wwv_flow_api.g_varchar2_table(1217) := '6D3A6E74682D6368696C642820323629207B0A20206261636B67726F756E642D636F6C6F723A20233266393963363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203236';
wwv_flow_api.g_varchar2_table(1218) := '292061207B0A2020636F6C6F723A20236536653665363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032362920612E742D42616467654C6973742D777261703A686F76';
wwv_flow_api.g_varchar2_table(1219) := '6572207B0A2020626F782D736861646F773A2030202D38707820302030202335326166643620696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323729207B';
wwv_flow_api.g_varchar2_table(1220) := '0A20206261636B67726F756E642D636F6C6F723A20236536623830303B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203237292061207B0A2020636F6C6F723A20233030';
wwv_flow_api.g_varchar2_table(1221) := '303030303B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032372920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A';
wwv_flow_api.g_varchar2_table(1222) := '2030202D38707820302030202362333866303020696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323829207B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(1223) := '723A20233531623465313B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203238292061207B0A2020636F6C6F723A20233032333434613B0A7D0A2E742D43617264732D2D';
wwv_flow_api.g_varchar2_table(1224) := '636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032382920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D3870782030203020233763633765';
wwv_flow_api.g_varchar2_table(1225) := '3920696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323929207B0A20206261636B67726F756E642D636F6C6F723A20236536333532623B0A7D0A2E742D43';
wwv_flow_api.g_varchar2_table(1226) := '617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203239292061207B0A2020636F6C6F723A20236536653665363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C';
wwv_flow_api.g_varchar2_table(1227) := '6973742D6974656D3A6E74682D6368696C64282032392920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202365623630353920696E7365743B0A7D0A2E742D43617264';
wwv_flow_api.g_varchar2_table(1228) := '732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820333029207B0A20206261636B67726F756E642D636F6C6F723A20233466346463313B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D';
wwv_flow_api.g_varchar2_table(1229) := '42616467654C6973742D6974656D3A6E74682D6368696C6428203330292061207B0A2020636F6C6F723A20236536653665363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(1230) := '282033302920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202337353733636520696E7365743B0A7D0A2E752D436F6C6F7242472D2D31207B0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(1231) := '756E642D636F6C6F723A20236666326435353B0A7D0A2E752D436F6C6F7246472D2D31207B0A2020636F6C6F723A20236666326435353B0A7D0A2E752D436F6C6F7242472D2D32207B0A20206261636B67726F756E642D636F6C6F723A20233030376166';
wwv_flow_api.g_varchar2_table(1232) := '663B0A7D0A2E752D436F6C6F7246472D2D32207B0A2020636F6C6F723A20233030376166663B0A7D0A2E752D436F6C6F7242472D2D33207B0A20206261636B67726F756E642D636F6C6F723A20236666393530303B0A7D0A2E752D436F6C6F7246472D2D';
wwv_flow_api.g_varchar2_table(1233) := '33207B0A2020636F6C6F723A20236666393530303B0A7D0A2E752D436F6C6F7242472D2D34207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A7D0A2E752D436F6C6F7246472D2D34207B0A2020636F6C6F723A2023346364';
wwv_flow_api.g_varchar2_table(1234) := '3936343B0A7D0A2E752D436F6C6F7242472D2D35207B0A20206261636B67726F756E642D636F6C6F723A20233865386539333B0A7D0A2E752D436F6C6F7246472D2D35207B0A2020636F6C6F723A20233865386539333B0A7D0A2E752D436F6C6F724247';
wwv_flow_api.g_varchar2_table(1235) := '2D2D36207B0A20206261636B67726F756E642D636F6C6F723A20233334616164633B0A7D0A2E752D436F6C6F7246472D2D36207B0A2020636F6C6F723A20233334616164633B0A7D0A2E752D436F6C6F7242472D2D37207B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(1236) := '642D636F6C6F723A20236666636330303B0A7D0A2E752D436F6C6F7246472D2D37207B0A2020636F6C6F723A20236666636330303B0A7D0A2E752D436F6C6F7242472D2D38207B0A20206261636B67726F756E642D636F6C6F723A20233561633866613B';
wwv_flow_api.g_varchar2_table(1237) := '0A7D0A2E752D436F6C6F7246472D2D38207B0A2020636F6C6F723A20233561633866613B0A7D0A2E752D436F6C6F7242472D2D39207B0A20206261636B67726F756E642D636F6C6F723A20236666336233303B0A7D0A2E752D436F6C6F7246472D2D3920';
wwv_flow_api.g_varchar2_table(1238) := '7B0A2020636F6C6F723A20236666336233303B0A7D0A2E752D436F6C6F7242472D2D3130207B0A20206261636B67726F756E642D636F6C6F723A20233538353664363B0A7D0A2E752D436F6C6F7246472D2D3130207B0A2020636F6C6F723A2023353835';
wwv_flow_api.g_varchar2_table(1239) := '3664363B0A7D0A2E752D436F6C6F7242472D2D3131207B0A20206261636B67726F756E642D636F6C6F723A20236666353737373B0A7D0A2E752D436F6C6F7246472D2D3131207B0A2020636F6C6F723A20236666353737373B0A7D0A2E752D436F6C6F72';
wwv_flow_api.g_varchar2_table(1240) := '42472D2D3132207B0A20206261636B67726F756E642D636F6C6F723A20233333393566663B0A7D0A2E752D436F6C6F7246472D2D3132207B0A2020636F6C6F723A20233333393566663B0A7D0A2E752D436F6C6F7242472D2D3133207B0A20206261636B';
wwv_flow_api.g_varchar2_table(1241) := '67726F756E642D636F6C6F723A20236666616133333B0A7D0A2E752D436F6C6F7246472D2D3133207B0A2020636F6C6F723A20236666616133333B0A7D0A2E752D436F6C6F7242472D2D3134207B0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1242) := '3730653138333B0A7D0A2E752D436F6C6F7246472D2D3134207B0A2020636F6C6F723A20233730653138333B0A7D0A2E752D436F6C6F7242472D2D3135207B0A20206261636B67726F756E642D636F6C6F723A20236135613561393B0A7D0A2E752D436F';
wwv_flow_api.g_varchar2_table(1243) := '6C6F7246472D2D3135207B0A2020636F6C6F723A20236135613561393B0A7D0A2E752D436F6C6F7242472D2D3136207B0A20206261636B67726F756E642D636F6C6F723A20233564626265333B0A7D0A2E752D436F6C6F7246472D2D3136207B0A202063';
wwv_flow_api.g_varchar2_table(1244) := '6F6C6F723A20233564626265333B0A7D0A2E752D436F6C6F7242472D2D3137207B0A20206261636B67726F756E642D636F6C6F723A20236666643633333B0A7D0A2E752D436F6C6F7246472D2D3137207B0A2020636F6C6F723A20236666643633333B0A';
wwv_flow_api.g_varchar2_table(1245) := '7D0A2E752D436F6C6F7242472D2D3138207B0A20206261636B67726F756E642D636F6C6F723A20233762643366623B0A7D0A2E752D436F6C6F7246472D2D3138207B0A2020636F6C6F723A20233762643366623B0A7D0A2E752D436F6C6F7242472D2D31';
wwv_flow_api.g_varchar2_table(1246) := '39207B0A20206261636B67726F756E642D636F6C6F723A20236666363235393B0A7D0A2E752D436F6C6F7246472D2D3139207B0A2020636F6C6F723A20236666363235393B0A7D0A2E752D436F6C6F7242472D2D3230207B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(1247) := '642D636F6C6F723A20233739373864653B0A7D0A2E752D436F6C6F7246472D2D3230207B0A2020636F6C6F723A20233739373864653B0A7D0A2E752D436F6C6F7242472D2D3231207B0A20206261636B67726F756E642D636F6C6F723A20236536323934';
wwv_flow_api.g_varchar2_table(1248) := '643B0A7D0A2E752D436F6C6F7246472D2D3231207B0A2020636F6C6F723A20236536323934643B0A7D0A2E752D436F6C6F7242472D2D3232207B0A20206261636B67726F756E642D636F6C6F723A20233030366565363B0A7D0A2E752D436F6C6F724647';
wwv_flow_api.g_varchar2_table(1249) := '2D2D3232207B0A2020636F6C6F723A20233030366565363B0A7D0A2E752D436F6C6F7242472D2D3233207B0A20206261636B67726F756E642D636F6C6F723A20236536383630303B0A7D0A2E752D436F6C6F7246472D2D3233207B0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(1250) := '20236536383630303B0A7D0A2E752D436F6C6F7242472D2D3234207B0A20206261636B67726F756E642D636F6C6F723A20233434633335613B0A7D0A2E752D436F6C6F7246472D2D3234207B0A2020636F6C6F723A20233434633335613B0A7D0A2E752D';
wwv_flow_api.g_varchar2_table(1251) := '436F6C6F7242472D2D3235207B0A20206261636B67726F756E642D636F6C6F723A20233830383038343B0A7D0A2E752D436F6C6F7246472D2D3235207B0A2020636F6C6F723A20233830383038343B0A7D0A2E752D436F6C6F7242472D2D3236207B0A20';
wwv_flow_api.g_varchar2_table(1252) := '206261636B67726F756E642D636F6C6F723A20233266393963363B0A7D0A2E752D436F6C6F7246472D2D3236207B0A2020636F6C6F723A20233266393963363B0A7D0A2E752D436F6C6F7242472D2D3237207B0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(1253) := '6F723A20236536623830303B0A7D0A2E752D436F6C6F7246472D2D3237207B0A2020636F6C6F723A20236536623830303B0A7D0A2E752D436F6C6F7242472D2D3238207B0A20206261636B67726F756E642D636F6C6F723A20233531623465313B0A7D0A';
wwv_flow_api.g_varchar2_table(1254) := '2E752D436F6C6F7246472D2D3238207B0A2020636F6C6F723A20233531623465313B0A7D0A2E752D436F6C6F7242472D2D3239207B0A20206261636B67726F756E642D636F6C6F723A20236536333532623B0A7D0A2E752D436F6C6F7246472D2D323920';
wwv_flow_api.g_varchar2_table(1255) := '7B0A2020636F6C6F723A20236536333532623B0A7D0A2E752D436F6C6F7242472D2D3330207B0A20206261636B67726F756E642D636F6C6F723A20233466346463313B0A7D0A2E752D436F6C6F7246472D2D3330207B0A2020636F6C6F723A2023346634';
wwv_flow_api.g_varchar2_table(1256) := '6463313B0A7D0A0A2E752D436F6C6F722D312D42472D2D747874207B0A2020636F6C6F723A20236666326435353B0A7D0A2E752D436F6C6F722D312D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666326435353B0A7D0A';
wwv_flow_api.g_varchar2_table(1257) := '2E752D436F6C6F722D312D42472D2D66696C6C207B0A202066696C6C3A20236666326435353B0A7D0A2E752D436F6C6F722D312D42472D2D6272207B0A20207374726F6B653A20236666326435353B0A2020626F726465722D636F6C6F723A2023666632';
wwv_flow_api.g_varchar2_table(1258) := '6435353B0A7D0A2E752D436F6C6F722D312D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D312D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E';
wwv_flow_api.g_varchar2_table(1259) := '752D436F6C6F722D312D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D312D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A202366666666';
wwv_flow_api.g_varchar2_table(1260) := '66663B0A7D0A2E752D436F6C6F722D322D42472D2D747874207B0A2020636F6C6F723A20233030376166663B0A7D0A2E752D436F6C6F722D322D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233030376166663B0A7D0A2E75';
wwv_flow_api.g_varchar2_table(1261) := '2D436F6C6F722D322D42472D2D66696C6C207B0A202066696C6C3A20233030376166663B0A7D0A2E752D436F6C6F722D322D42472D2D6272207B0A20207374726F6B653A20233030376166663B0A2020626F726465722D636F6C6F723A20233030376166';
wwv_flow_api.g_varchar2_table(1262) := '663B0A7D0A2E752D436F6C6F722D322D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D322D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D';
wwv_flow_api.g_varchar2_table(1263) := '436F6C6F722D322D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D322D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A2023666666666666';
wwv_flow_api.g_varchar2_table(1264) := '3B0A7D0A2E752D436F6C6F722D332D42472D2D747874207B0A2020636F6C6F723A20236666393530303B0A7D0A2E752D436F6C6F722D332D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666393530303B0A7D0A2E752D43';
wwv_flow_api.g_varchar2_table(1265) := '6F6C6F722D332D42472D2D66696C6C207B0A202066696C6C3A20236666393530303B0A7D0A2E752D436F6C6F722D332D42472D2D6272207B0A20207374726F6B653A20236666393530303B0A2020626F726465722D636F6C6F723A20236666393530303B';
wwv_flow_api.g_varchar2_table(1266) := '0A7D0A2E752D436F6C6F722D332D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D332D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F';
wwv_flow_api.g_varchar2_table(1267) := '6C6F722D332D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D332D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A';
wwv_flow_api.g_varchar2_table(1268) := '7D0A2E752D436F6C6F722D342D42472D2D747874207B0A2020636F6C6F723A20233463643936343B0A7D0A2E752D436F6C6F722D342D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A7D0A2E752D436F6C';
wwv_flow_api.g_varchar2_table(1269) := '6F722D342D42472D2D66696C6C207B0A202066696C6C3A20233463643936343B0A7D0A2E752D436F6C6F722D342D42472D2D6272207B0A20207374726F6B653A20233463643936343B0A2020626F726465722D636F6C6F723A20233463643936343B0A7D';
wwv_flow_api.g_varchar2_table(1270) := '0A2E752D436F6C6F722D342D46472D2D747874207B0A2020636F6C6F723A20233037316630623B0A7D0A2E752D436F6C6F722D342D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233037316630623B0A7D0A2E752D436F6C6F';
wwv_flow_api.g_varchar2_table(1271) := '722D342D46472D2D66696C6C207B0A202066696C6C3A20233037316630623B0A7D0A2E752D436F6C6F722D342D46472D2D6272207B0A20207374726F6B653A20233037316630623B0A2020626F726465722D636F6C6F723A20233037316630623B0A7D0A';
wwv_flow_api.g_varchar2_table(1272) := '2E752D436F6C6F722D352D42472D2D747874207B0A2020636F6C6F723A20233865386539333B0A7D0A2E752D436F6C6F722D352D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233865386539333B0A7D0A2E752D436F6C6F72';
wwv_flow_api.g_varchar2_table(1273) := '2D352D42472D2D66696C6C207B0A202066696C6C3A20233865386539333B0A7D0A2E752D436F6C6F722D352D42472D2D6272207B0A20207374726F6B653A20233865386539333B0A2020626F726465722D636F6C6F723A20233865386539333B0A7D0A2E';
wwv_flow_api.g_varchar2_table(1274) := '752D436F6C6F722D352D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D352D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D';
wwv_flow_api.g_varchar2_table(1275) := '352D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D352D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E75';
wwv_flow_api.g_varchar2_table(1276) := '2D436F6C6F722D362D42472D2D747874207B0A2020636F6C6F723A20233334616164633B0A7D0A2E752D436F6C6F722D362D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233334616164633B0A7D0A2E752D436F6C6F722D36';
wwv_flow_api.g_varchar2_table(1277) := '2D42472D2D66696C6C207B0A202066696C6C3A20233334616164633B0A7D0A2E752D436F6C6F722D362D42472D2D6272207B0A20207374726F6B653A20233334616164633B0A2020626F726465722D636F6C6F723A20233334616164633B0A7D0A2E752D';
wwv_flow_api.g_varchar2_table(1278) := '436F6C6F722D362D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D362D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D362D';
wwv_flow_api.g_varchar2_table(1279) := '46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D362D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D43';
wwv_flow_api.g_varchar2_table(1280) := '6F6C6F722D372D42472D2D747874207B0A2020636F6C6F723A20236666636330303B0A7D0A2E752D436F6C6F722D372D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0A7D0A2E752D436F6C6F722D372D42';
wwv_flow_api.g_varchar2_table(1281) := '472D2D66696C6C207B0A202066696C6C3A20236666636330303B0A7D0A2E752D436F6C6F722D372D42472D2D6272207B0A20207374726F6B653A20236666636330303B0A2020626F726465722D636F6C6F723A20236666636330303B0A7D0A2E752D436F';
wwv_flow_api.g_varchar2_table(1282) := '6C6F722D372D46472D2D747874207B0A2020636F6C6F723A20233030303030303B0A7D0A2E752D436F6C6F722D372D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233030303030303B0A7D0A2E752D436F6C6F722D372D4647';
wwv_flow_api.g_varchar2_table(1283) := '2D2D66696C6C207B0A202066696C6C3A20233030303030303B0A7D0A2E752D436F6C6F722D372D46472D2D6272207B0A20207374726F6B653A20233030303030303B0A2020626F726465722D636F6C6F723A20233030303030303B0A7D0A2E752D436F6C';
wwv_flow_api.g_varchar2_table(1284) := '6F722D382D42472D2D747874207B0A2020636F6C6F723A20233561633866613B0A7D0A2E752D436F6C6F722D382D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233561633866613B0A7D0A2E752D436F6C6F722D382D42472D';
wwv_flow_api.g_varchar2_table(1285) := '2D66696C6C207B0A202066696C6C3A20233561633866613B0A7D0A2E752D436F6C6F722D382D42472D2D6272207B0A20207374726F6B653A20233561633866613B0A2020626F726465722D636F6C6F723A20233561633866613B0A7D0A2E752D436F6C6F';
wwv_flow_api.g_varchar2_table(1286) := '722D382D46472D2D747874207B0A2020636F6C6F723A20233032333935323B0A7D0A2E752D436F6C6F722D382D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233032333935323B0A7D0A2E752D436F6C6F722D382D46472D2D';
wwv_flow_api.g_varchar2_table(1287) := '66696C6C207B0A202066696C6C3A20233032333935323B0A7D0A2E752D436F6C6F722D382D46472D2D6272207B0A20207374726F6B653A20233032333935323B0A2020626F726465722D636F6C6F723A20233032333935323B0A7D0A2E752D436F6C6F72';
wwv_flow_api.g_varchar2_table(1288) := '2D392D42472D2D747874207B0A2020636F6C6F723A20236666336233303B0A7D0A2E752D436F6C6F722D392D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666336233303B0A7D0A2E752D436F6C6F722D392D42472D2D66';
wwv_flow_api.g_varchar2_table(1289) := '696C6C207B0A202066696C6C3A20236666336233303B0A7D0A2E752D436F6C6F722D392D42472D2D6272207B0A20207374726F6B653A20236666336233303B0A2020626F726465722D636F6C6F723A20236666336233303B0A7D0A2E752D436F6C6F722D';
wwv_flow_api.g_varchar2_table(1290) := '392D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D392D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D392D46472D2D6669';
wwv_flow_api.g_varchar2_table(1291) := '6C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D392D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31';
wwv_flow_api.g_varchar2_table(1292) := '302D42472D2D747874207B0A2020636F6C6F723A20233538353664363B0A7D0A2E752D436F6C6F722D31302D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233538353664363B0A7D0A2E752D436F6C6F722D31302D42472D2D';
wwv_flow_api.g_varchar2_table(1293) := '66696C6C207B0A202066696C6C3A20233538353664363B0A7D0A2E752D436F6C6F722D31302D42472D2D6272207B0A20207374726F6B653A20233538353664363B0A2020626F726465722D636F6C6F723A20233538353664363B0A7D0A2E752D436F6C6F';
wwv_flow_api.g_varchar2_table(1294) := '722D31302D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31302D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31302D46';
wwv_flow_api.g_varchar2_table(1295) := '472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D31302D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D43';
wwv_flow_api.g_varchar2_table(1296) := '6F6C6F722D31312D42472D2D747874207B0A2020636F6C6F723A20236639303032663B0A7D0A2E752D436F6C6F722D31312D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236639303032663B0A7D0A2E752D436F6C6F722D31';
wwv_flow_api.g_varchar2_table(1297) := '312D42472D2D66696C6C207B0A202066696C6C3A20236639303032663B0A7D0A2E752D436F6C6F722D31312D42472D2D6272207B0A20207374726F6B653A20236639303032663B0A2020626F726465722D636F6C6F723A20236639303032663B0A7D0A2E';
wwv_flow_api.g_varchar2_table(1298) := '752D436F6C6F722D31312D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31312D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F';
wwv_flow_api.g_varchar2_table(1299) := '722D31312D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D31312D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A';
wwv_flow_api.g_varchar2_table(1300) := '7D0A2E752D436F6C6F722D31322D42472D2D747874207B0A2020636F6C6F723A20233030363263633B0A7D0A2E752D436F6C6F722D31322D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233030363263633B0A7D0A2E752D43';
wwv_flow_api.g_varchar2_table(1301) := '6F6C6F722D31322D42472D2D66696C6C207B0A202066696C6C3A20233030363263633B0A7D0A2E752D436F6C6F722D31322D42472D2D6272207B0A20207374726F6B653A20233030363263633B0A2020626F726465722D636F6C6F723A20233030363263';
wwv_flow_api.g_varchar2_table(1302) := '633B0A7D0A2E752D436F6C6F722D31322D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31322D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E';
wwv_flow_api.g_varchar2_table(1303) := '752D436F6C6F722D31322D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D31322D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666';
wwv_flow_api.g_varchar2_table(1304) := '666666663B0A7D0A2E752D436F6C6F722D31332D42472D2D747874207B0A2020636F6C6F723A20236363373730303B0A7D0A2E752D436F6C6F722D31332D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236363373730303B0A';
wwv_flow_api.g_varchar2_table(1305) := '7D0A2E752D436F6C6F722D31332D42472D2D66696C6C207B0A202066696C6C3A20236363373730303B0A7D0A2E752D436F6C6F722D31332D42472D2D6272207B0A20207374726F6B653A20236363373730303B0A2020626F726465722D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(1306) := '236363373730303B0A7D0A2E752D436F6C6F722D31332D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31332D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666';
wwv_flow_api.g_varchar2_table(1307) := '663B0A7D0A2E752D436F6C6F722D31332D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D31332D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F';
wwv_flow_api.g_varchar2_table(1308) := '723A20236666666666663B0A7D0A2E752D436F6C6F722D31342D42472D2D747874207B0A2020636F6C6F723A20233261633834353B0A7D0A2E752D436F6C6F722D31342D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233261';
wwv_flow_api.g_varchar2_table(1309) := '633834353B0A7D0A2E752D436F6C6F722D31342D42472D2D66696C6C207B0A202066696C6C3A20233261633834353B0A7D0A2E752D436F6C6F722D31342D42472D2D6272207B0A20207374726F6B653A20233261633834353B0A2020626F726465722D63';
wwv_flow_api.g_varchar2_table(1310) := '6F6C6F723A20233261633834353B0A7D0A2E752D436F6C6F722D31342D46472D2D747874207B0A2020636F6C6F723A20233130343931393B0A7D0A2E752D436F6C6F722D31342D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(1311) := '233130343931393B0A7D0A2E752D436F6C6F722D31342D46472D2D66696C6C207B0A202066696C6C3A20233130343931393B0A7D0A2E752D436F6C6F722D31342D46472D2D6272207B0A20207374726F6B653A20233130343931393B0A2020626F726465';
wwv_flow_api.g_varchar2_table(1312) := '722D636F6C6F723A20233130343931393B0A7D0A2E752D436F6C6F722D31352D42472D2D747874207B0A2020636F6C6F723A20233734373437613B0A7D0A2E752D436F6C6F722D31352D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(1313) := '723A20233734373437613B0A7D0A2E752D436F6C6F722D31352D42472D2D66696C6C207B0A202066696C6C3A20233734373437613B0A7D0A2E752D436F6C6F722D31352D42472D2D6272207B0A20207374726F6B653A20233734373437613B0A2020626F';
wwv_flow_api.g_varchar2_table(1314) := '726465722D636F6C6F723A20233734373437613B0A7D0A2E752D436F6C6F722D31352D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31352D46472D2D6267207B0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(1315) := '6F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31352D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D31352D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A20';
wwv_flow_api.g_varchar2_table(1316) := '20626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31362D42472D2D747874207B0A2020636F6C6F723A20233231386562643B0A7D0A2E752D436F6C6F722D31362D42472D2D6267207B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(1317) := '642D636F6C6F723A20233231386562643B0A7D0A2E752D436F6C6F722D31362D42472D2D66696C6C207B0A202066696C6C3A20233231386562643B0A7D0A2E752D436F6C6F722D31362D42472D2D6272207B0A20207374726F6B653A2023323138656264';
wwv_flow_api.g_varchar2_table(1318) := '3B0A2020626F726465722D636F6C6F723A20233231386562643B0A7D0A2E752D436F6C6F722D31362D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31362D46472D2D6267207B0A20206261636B6772';
wwv_flow_api.g_varchar2_table(1319) := '6F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31362D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D31362D46472D2D6272207B0A20207374726F6B653A2023666666';
wwv_flow_api.g_varchar2_table(1320) := '6666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31372D42472D2D747874207B0A2020636F6C6F723A20236363613330303B0A7D0A2E752D436F6C6F722D31372D42472D2D6267207B0A2020626163';
wwv_flow_api.g_varchar2_table(1321) := '6B67726F756E642D636F6C6F723A20236363613330303B0A7D0A2E752D436F6C6F722D31372D42472D2D66696C6C207B0A202066696C6C3A20236363613330303B0A7D0A2E752D436F6C6F722D31372D42472D2D6272207B0A20207374726F6B653A2023';
wwv_flow_api.g_varchar2_table(1322) := '6363613330303B0A2020626F726465722D636F6C6F723A20236363613330303B0A7D0A2E752D436F6C6F722D31372D46472D2D747874207B0A2020636F6C6F723A20233161316131613B0A7D0A2E752D436F6C6F722D31372D46472D2D6267207B0A2020';
wwv_flow_api.g_varchar2_table(1323) := '6261636B67726F756E642D636F6C6F723A20233161316131613B0A7D0A2E752D436F6C6F722D31372D46472D2D66696C6C207B0A202066696C6C3A20233161316131613B0A7D0A2E752D436F6C6F722D31372D46472D2D6272207B0A20207374726F6B65';
wwv_flow_api.g_varchar2_table(1324) := '3A20233161316131613B0A2020626F726465722D636F6C6F723A20233161316131613B0A7D0A2E752D436F6C6F722D31382D42472D2D747874207B0A2020636F6C6F723A20233238623766393B0A7D0A2E752D436F6C6F722D31382D42472D2D6267207B';
wwv_flow_api.g_varchar2_table(1325) := '0A20206261636B67726F756E642D636F6C6F723A20233238623766393B0A7D0A2E752D436F6C6F722D31382D42472D2D66696C6C207B0A202066696C6C3A20233238623766393B0A7D0A2E752D436F6C6F722D31382D42472D2D6272207B0A2020737472';
wwv_flow_api.g_varchar2_table(1326) := '6F6B653A20233238623766393B0A2020626F726465722D636F6C6F723A20233238623766393B0A7D0A2E752D436F6C6F722D31382D46472D2D747874207B0A2020636F6C6F723A20233034356338343B0A7D0A2E752D436F6C6F722D31382D46472D2D62';
wwv_flow_api.g_varchar2_table(1327) := '67207B0A20206261636B67726F756E642D636F6C6F723A20233034356338343B0A7D0A2E752D436F6C6F722D31382D46472D2D66696C6C207B0A202066696C6C3A20233034356338343B0A7D0A2E752D436F6C6F722D31382D46472D2D6272207B0A2020';
wwv_flow_api.g_varchar2_table(1328) := '7374726F6B653A20233034356338343B0A2020626F726465722D636F6C6F723A20233034356338343B0A7D0A2E752D436F6C6F722D31392D42472D2D747874207B0A2020636F6C6F723A20236663306430303B0A7D0A2E752D436F6C6F722D31392D4247';
wwv_flow_api.g_varchar2_table(1329) := '2D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236663306430303B0A7D0A2E752D436F6C6F722D31392D42472D2D66696C6C207B0A202066696C6C3A20236663306430303B0A7D0A2E752D436F6C6F722D31392D42472D2D6272207B';
wwv_flow_api.g_varchar2_table(1330) := '0A20207374726F6B653A20236663306430303B0A2020626F726465722D636F6C6F723A20236663306430303B0A7D0A2E752D436F6C6F722D31392D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D3139';
wwv_flow_api.g_varchar2_table(1331) := '2D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31392D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D31392D46472D2D62';
wwv_flow_api.g_varchar2_table(1332) := '72207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32302D42472D2D747874207B0A2020636F6C6F723A20233333333163383B0A7D0A2E752D436F6C6F72';
wwv_flow_api.g_varchar2_table(1333) := '2D32302D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233333333163383B0A7D0A2E752D436F6C6F722D32302D42472D2D66696C6C207B0A202066696C6C3A20233333333163383B0A7D0A2E752D436F6C6F722D32302D4247';
wwv_flow_api.g_varchar2_table(1334) := '2D2D6272207B0A20207374726F6B653A20233333333163383B0A2020626F726465722D636F6C6F723A20233333333163383B0A7D0A2E752D436F6C6F722D32302D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F';
wwv_flow_api.g_varchar2_table(1335) := '6C6F722D32302D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32302D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D3230';
wwv_flow_api.g_varchar2_table(1336) := '2D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32312D42472D2D747874207B0A2020636F6C6F723A20236666393361383B0A7D0A2E75';
wwv_flow_api.g_varchar2_table(1337) := '2D436F6C6F722D32312D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666393361383B0A7D0A2E752D436F6C6F722D32312D42472D2D66696C6C207B0A202066696C6C3A20236666393361383B0A7D0A2E752D436F6C6F72';
wwv_flow_api.g_varchar2_table(1338) := '2D32312D42472D2D6272207B0A20207374726F6B653A20236666393361383B0A2020626F726465722D636F6C6F723A20236666393361383B0A7D0A2E752D436F6C6F722D32312D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D';
wwv_flow_api.g_varchar2_table(1339) := '0A2E752D436F6C6F722D32312D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32312D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F';
wwv_flow_api.g_varchar2_table(1340) := '6C6F722D32312D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32322D42472D2D747874207B0A2020636F6C6F723A2023363661666666';
wwv_flow_api.g_varchar2_table(1341) := '3B0A7D0A2E752D436F6C6F722D32322D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233636616666663B0A7D0A2E752D436F6C6F722D32322D42472D2D66696C6C207B0A202066696C6C3A20233636616666663B0A7D0A2E75';
wwv_flow_api.g_varchar2_table(1342) := '2D436F6C6F722D32322D42472D2D6272207B0A20207374726F6B653A20233636616666663B0A2020626F726465722D636F6C6F723A20233636616666663B0A7D0A2E752D436F6C6F722D32322D46472D2D747874207B0A2020636F6C6F723A2023666666';
wwv_flow_api.g_varchar2_table(1343) := '6666663B0A7D0A2E752D436F6C6F722D32322D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32322D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D';
wwv_flow_api.g_varchar2_table(1344) := '0A2E752D436F6C6F722D32322D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32332D42472D2D747874207B0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1345) := '6666626636363B0A7D0A2E752D436F6C6F722D32332D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666626636363B0A7D0A2E752D436F6C6F722D32332D42472D2D66696C6C207B0A202066696C6C3A2023666662663636';
wwv_flow_api.g_varchar2_table(1346) := '3B0A7D0A2E752D436F6C6F722D32332D42472D2D6272207B0A20207374726F6B653A20236666626636363B0A2020626F726465722D636F6C6F723A20236666626636363B0A7D0A2E752D436F6C6F722D32332D46472D2D747874207B0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(1347) := '3A20236666666666663B0A7D0A2E752D436F6C6F722D32332D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32332D46472D2D66696C6C207B0A202066696C6C3A2023666666';
wwv_flow_api.g_varchar2_table(1348) := '6666663B0A7D0A2E752D436F6C6F722D32332D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32342D42472D2D747874207B0A2020636F';
wwv_flow_api.g_varchar2_table(1349) := '6C6F723A20236130656261643B0A7D0A2E752D436F6C6F722D32342D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236130656261643B0A7D0A2E752D436F6C6F722D32342D42472D2D66696C6C207B0A202066696C6C3A2023';
wwv_flow_api.g_varchar2_table(1350) := '6130656261643B0A7D0A2E752D436F6C6F722D32342D42472D2D6272207B0A20207374726F6B653A20236130656261643B0A2020626F726465722D636F6C6F723A20236130656261643B0A7D0A2E752D436F6C6F722D32342D46472D2D747874207B0A20';
wwv_flow_api.g_varchar2_table(1351) := '20636F6C6F723A20233139373332383B0A7D0A2E752D436F6C6F722D32342D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233139373332383B0A7D0A2E752D436F6C6F722D32342D46472D2D66696C6C207B0A202066696C6C';
wwv_flow_api.g_varchar2_table(1352) := '3A20233139373332383B0A7D0A2E752D436F6C6F722D32342D46472D2D6272207B0A20207374726F6B653A20233139373332383B0A2020626F726465722D636F6C6F723A20233139373332383B0A7D0A2E752D436F6C6F722D32352D42472D2D74787420';
wwv_flow_api.g_varchar2_table(1353) := '7B0A2020636F6C6F723A20236332633263353B0A7D0A2E752D436F6C6F722D32352D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236332633263353B0A7D0A2E752D436F6C6F722D32352D42472D2D66696C6C207B0A202066';
wwv_flow_api.g_varchar2_table(1354) := '696C6C3A20236332633263353B0A7D0A2E752D436F6C6F722D32352D42472D2D6272207B0A20207374726F6B653A20236332633263353B0A2020626F726465722D636F6C6F723A20236332633263353B0A7D0A2E752D436F6C6F722D32352D46472D2D74';
wwv_flow_api.g_varchar2_table(1355) := '7874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32352D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32352D46472D2D66696C6C207B0A';
wwv_flow_api.g_varchar2_table(1356) := '202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D32352D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32362D4247';
wwv_flow_api.g_varchar2_table(1357) := '2D2D747874207B0A2020636F6C6F723A20233862636565623B0A7D0A2E752D436F6C6F722D32362D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233862636565623B0A7D0A2E752D436F6C6F722D32362D42472D2D66696C6C';
wwv_flow_api.g_varchar2_table(1358) := '207B0A202066696C6C3A20233862636565623B0A7D0A2E752D436F6C6F722D32362D42472D2D6272207B0A20207374726F6B653A20233862636565623B0A2020626F726465722D636F6C6F723A20233862636565623B0A7D0A2E752D436F6C6F722D3236';
wwv_flow_api.g_varchar2_table(1359) := '2D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32362D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32362D46472D2D66';
wwv_flow_api.g_varchar2_table(1360) := '696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D32362D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F72';
wwv_flow_api.g_varchar2_table(1361) := '2D32372D42472D2D747874207B0A2020636F6C6F723A20236666653036363B0A7D0A2E752D436F6C6F722D32372D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666653036363B0A7D0A2E752D436F6C6F722D32372D4247';
wwv_flow_api.g_varchar2_table(1362) := '2D2D66696C6C207B0A202066696C6C3A20236666653036363B0A7D0A2E752D436F6C6F722D32372D42472D2D6272207B0A20207374726F6B653A20236666653036363B0A2020626F726465722D636F6C6F723A20236666653036363B0A7D0A2E752D436F';
wwv_flow_api.g_varchar2_table(1363) := '6C6F722D32372D46472D2D747874207B0A2020636F6C6F723A20233333333333333B0A7D0A2E752D436F6C6F722D32372D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233333333333333B0A7D0A2E752D436F6C6F722D3237';
wwv_flow_api.g_varchar2_table(1364) := '2D46472D2D66696C6C207B0A202066696C6C3A20233333333333333B0A7D0A2E752D436F6C6F722D32372D46472D2D6272207B0A20207374726F6B653A20233333333333333B0A2020626F726465722D636F6C6F723A20233333333333333B0A7D0A2E75';
wwv_flow_api.g_varchar2_table(1365) := '2D436F6C6F722D32382D42472D2D747874207B0A2020636F6C6F723A20236264653966643B0A7D0A2E752D436F6C6F722D32382D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236264653966643B0A7D0A2E752D436F6C6F72';
wwv_flow_api.g_varchar2_table(1366) := '2D32382D42472D2D66696C6C207B0A202066696C6C3A20236264653966643B0A7D0A2E752D436F6C6F722D32382D42472D2D6272207B0A20207374726F6B653A20236264653966643B0A2020626F726465722D636F6C6F723A20236264653966643B0A7D';
wwv_flow_api.g_varchar2_table(1367) := '0A2E752D436F6C6F722D32382D46472D2D747874207B0A2020636F6C6F723A20233035376562363B0A7D0A2E752D436F6C6F722D32382D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233035376562363B0A7D0A2E752D436F';
wwv_flow_api.g_varchar2_table(1368) := '6C6F722D32382D46472D2D66696C6C207B0A202066696C6C3A20233035376562363B0A7D0A2E752D436F6C6F722D32382D46472D2D6272207B0A20207374726F6B653A20233035376562363B0A2020626F726465722D636F6C6F723A2023303537656236';
wwv_flow_api.g_varchar2_table(1369) := '3B0A7D0A2E752D436F6C6F722D32392D42472D2D747874207B0A2020636F6C6F723A20236666396339363B0A7D0A2E752D436F6C6F722D32392D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666396339363B0A7D0A2E75';
wwv_flow_api.g_varchar2_table(1370) := '2D436F6C6F722D32392D42472D2D66696C6C207B0A202066696C6C3A20236666396339363B0A7D0A2E752D436F6C6F722D32392D42472D2D6272207B0A20207374726F6B653A20236666396339363B0A2020626F726465722D636F6C6F723A2023666639';
wwv_flow_api.g_varchar2_table(1371) := '6339363B0A7D0A2E752D436F6C6F722D32392D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32392D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D';
wwv_flow_api.g_varchar2_table(1372) := '0A2E752D436F6C6F722D32392D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D32392D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1373) := '6666666666663B0A7D0A2E752D436F6C6F722D33302D42472D2D747874207B0A2020636F6C6F723A20236139613865613B0A7D0A2E752D436F6C6F722D33302D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A2023613961386561';
wwv_flow_api.g_varchar2_table(1374) := '3B0A7D0A2E752D436F6C6F722D33302D42472D2D66696C6C207B0A202066696C6C3A20236139613865613B0A7D0A2E752D436F6C6F722D33302D42472D2D6272207B0A20207374726F6B653A20236139613865613B0A2020626F726465722D636F6C6F72';
wwv_flow_api.g_varchar2_table(1375) := '3A20236139613865613B0A7D0A2E752D436F6C6F722D33302D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D33302D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A2023666666';
wwv_flow_api.g_varchar2_table(1376) := '6666663B0A7D0A2E752D436F6C6F722D33302D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D33302D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F';
wwv_flow_api.g_varchar2_table(1377) := '6C6F723A20236666666666663B0A7D0A2E752D666F6375736564207B0A2020626F782D736861646F773A2030203020302031707820236666326435352C2030203020317078203070782072676261283235352C2034352C2038352C20302E35292021696D';
wwv_flow_api.g_varchar2_table(1378) := '706F7274616E743B0A20206F75746C696E653A206E6F6E653B0A7D0A0A2F2A200A202A204F7261636C65204170706C69636174696F6E204578707265737320352E30205468656D6520526F6C6C657220437573746F6D20435353200A202A0A202A2F0A0A';
wwv_flow_api.g_varchar2_table(1379) := '2E742D50616765426F64792D2D6C6F67696E202E742D426F6479207B0A20206261636B67726F756E643A2075726C282268747470733A2F2F6A6B36342E73332E616D617A6F6E6177732E636F6D2F626C75657072696E7477616C6C70617065726A6B3634';
wwv_flow_api.g_varchar2_table(1380) := '2E706E672229206E6F2D72657065617420746F702063656E746572207363726F6C6C3B0A20206261636B67726F756E642D73697A653A2031303025206175746F3B0A7D';
null;
end;
/
begin
wwv_flow_api.create_theme_file(
 p_id=>wwv_flow_api.id(68647310793828378)
,p_theme_id=>42
,p_file_name=>'68646948418828363.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37729850850902450)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37730294384902450)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37730619894902451)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37733206747902452)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37733697662902452)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37735265885902455)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37736033194902455)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37737232013902456)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37738471935902457)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37738883348902458)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37740663308902460)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37744091002902462)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37747025791902465)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Dialog Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37754558463902470)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37754937541902470)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37755729567902470)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37756548416902471)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37757853576902472)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37759053873902474)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37759407976902474)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37762628089902476)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the amount of text to display for the Card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37764070278902477)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the style and design of the cards in the report.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37764609920902477)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37766073944902478)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37766617629902478)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37767699932902480)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37768241476902480)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37768647148902480)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37770679996902482)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37774448273902486)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37776090676902487)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37778013433902488)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37779401910902489)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37780084601902489)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37781492528902490)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37782817857902491)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37787690912902494)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37789899609902496)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37791434210902498)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37793147589902507)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37793527293902508)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37793905864902508)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37794399440902508)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37794732727902508)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37795521622902509)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37796918005902510)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37797722187902510)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37798129572902511)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37798585758902511)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37798941590902511)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Padding'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37799508377902512)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(37800127716902512)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37729686212902450)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(37729097191902448)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37730068235902450)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37729097191902448)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_api.id(37729850850902450)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37730427903902450)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37729097191902448)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_api.id(37730294384902450)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37730880888902451)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37729097191902448)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(37730619894902451)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37731067018902451)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(37729097191902448)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_api.id(37729850850902450)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37731296827902451)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(37729097191902448)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_api.id(37730294384902450)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37731402367902451)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(37729097191902448)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_api.id(37729850850902450)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37731612302902451)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37729097191902448)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_api.id(37730294384902450)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37731840855902451)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37729097191902448)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_api.id(37729850850902450)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37732024411902452)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37729097191902448)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_api.id(37730619894902451)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37733477582902452)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(37732339428902452)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(37733206747902452)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37733872090902452)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_api.id(37732339428902452)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(37733697662902452)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37734029841902454)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_api.id(37732339428902452)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(37733206747902452)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37734296548902454)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(37732339428902452)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(37733697662902452)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37735493619902455)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_api.id(37735265885902455)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37735651348902455)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_api.id(37735265885902455)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37735876898902455)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_api.id(37735265885902455)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37736248436902455)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(37736033194902455)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37736416888902456)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(37736033194902455)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37736616042902456)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(37736033194902455)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37736858122902456)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_api.id(37735265885902455)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37737012456902456)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(37736033194902455)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37737461894902456)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37737662304902456)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37737887744902456)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37738042457902456)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37738209353902457)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37738644346902457)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(37738471935902457)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37739090989902458)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(37738883348902458)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37739243564902458)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(37738471935902457)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37739406914902458)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37739626737902459)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(37733206747902452)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37739874915902459)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37740033408902459)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(37738883348902458)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37740230887902459)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37740451764902460)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37740889264902460)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_api.id(37740663308902460)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37741046562902460)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_api.id(37740663308902460)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37741209773902460)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37734319759902454)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(37733206747902452)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37742256073902461)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(37736033194902455)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37742455312902461)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(37736033194902455)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37742688684902461)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(37736033194902455)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37742876499902461)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(37736033194902455)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37743007503902461)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37743214228902462)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37743423022902462)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37743628206902462)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37743805712902462)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37744239288902462)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(37744091002902462)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37744483746902462)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(37744091002902462)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37744618973902462)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(37738883348902458)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37744828899902462)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37745043278902462)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(37733206747902452)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37745258927902462)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(37733206747902452)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37745473294902464)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(37738883348902458)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37745606203902464)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37741369186902460)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(37733206747902452)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37746809399902465)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37746295636902465)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37747279288902465)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(37746295636902465)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(37747025791902465)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37747422293902465)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37746295636902465)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(37747025791902465)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37747647093902466)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37746295636902465)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37747868167902466)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(37746295636902465)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37748083052902466)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37746295636902465)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(37747025791902465)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37748456485902466)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37748115288902466)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37748646388902466)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37748115288902466)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37750133157902467)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(37736033194902455)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37750358972902467)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(37736033194902455)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37750508167902467)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(37736033194902455)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37750713910902467)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(37736033194902455)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37750985791902468)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37751106561902468)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37751346152902468)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37751577233902468)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37751757032902468)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(37737232013902456)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37751919909902468)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(37738471935902457)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37752166461902468)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(37738883348902458)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37752313614902468)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(37738471935902457)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37752589957902468)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37752753249902468)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(37733206747902452)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37752931517902468)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(37733206747902452)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37753137028902469)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(37738883348902458)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37753313475902469)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37753506575902469)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37749289366902466)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(37733206747902452)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37754721372902470)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37753699237902469)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_api.id(37754558463902470)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37755130834902470)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37753699237902469)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_api.id(37754937541902470)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37755342235902470)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37753699237902469)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37755588424902470)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37753699237902469)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_api.id(37754937541902470)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37755994340902470)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37753699237902469)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_api.id(37755729567902470)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37756145813902470)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37753699237902469)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_api.id(37755729567902470)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37756781535902471)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(37756253337902470)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_api.id(37756548416902471)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37756927406902471)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(37756253337902470)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37757183612902471)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(37756253337902470)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_api.id(37756548416902471)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37758051703902472)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(37757299588902471)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_api.id(37757853576902472)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37758283610902472)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37757299588902471)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_api.id(37757853576902472)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37758476138902472)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(37757299588902471)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37759235058902474)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(37758756588902474)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(37759053873902474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37759662814902474)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37758756588902474)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37759888504902474)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37758756588902474)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(37759053873902474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37760061091902474)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(37758756588902474)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37760276274902475)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37758756588902474)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(37759053873902474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37760494193902475)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(37758756588902474)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37760639297902475)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(37758756588902474)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37760858355902475)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(37758756588902474)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(37759053873902474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37761050274902475)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(37758756588902474)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(37759053873902474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37761211042902475)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(37758756588902474)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37761440293902475)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_api.id(37758756588902474)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37761605083902476)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(37758756588902474)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37761885326902476)
,p_theme_id=>42
,p_name=>'RESPONSIVE'
,p_display_name=>'Responsive'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37758756588902474)
,p_css_classes=>'t-BadgeList--responsive'
,p_template_types=>'REPORT'
,p_help_text=>'Automatically resize badges to smaller sizes as screen becomes smaller.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37762030922902476)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37758756588902474)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37762447046902476)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37762827201902476)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(37762628089902476)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37763068890902476)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37763214171902476)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(37762628089902476)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37763486819902476)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37763688962902476)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(37762628089902476)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37763832080902477)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37764254890902477)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(37764070278902477)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37764461478902477)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(37764070278902477)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37764817402902477)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(37764609920902477)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37765012454902478)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(37764609920902477)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37765234907902478)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--featured'
,p_group_id=>wwv_flow_api.id(37764070278902477)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37765473367902478)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37765653206902478)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(37762628089902476)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37765839329902478)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37766290637902478)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Use Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37762113127902476)
,p_css_classes=>'t-Cards--colorize'
,p_group_id=>wwv_flow_api.id(37766073944902478)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37766829313902479)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37766323741902478)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_api.id(37766617629902478)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37767077774902479)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37766323741902478)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_api.id(37766617629902478)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37767827806902480)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37767321981902479)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(37767699932902480)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37768040480902480)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37767321981902479)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_api.id(37767699932902480)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37768426913902480)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37767321981902479)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(37768241476902480)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37768825647902480)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37767321981902479)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(37768647148902480)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37769020286902480)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(37767321981902479)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_api.id(37768647148902480)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37769255595902480)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(37767321981902479)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_api.id(37768647148902480)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37769460061902482)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37767321981902479)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_api.id(37768241476902480)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37769698274902482)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37767321981902479)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37769859749902482)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37767321981902479)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(37768647148902480)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37770243625902482)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(37769949532902482)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_api.id(37764070278902477)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact video of timeline with smaller font-sizes and fewer columns.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37770873211902482)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(37770341234902482)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(37770679996902482)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37771072127902482)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37770341234902482)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(37770679996902482)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37771285505902482)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37770341234902482)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(37770679996902482)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37771408809902483)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37770341234902482)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37771694395902483)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37770341234902482)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37771831033902483)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(37770341234902482)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(37770679996902482)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37772029765902483)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(37770341234902482)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(37770679996902482)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37772292703902483)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(37770341234902482)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(37770679996902482)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37772623915902484)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(37772350147902483)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(37770679996902482)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37772854587902484)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37772350147902483)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(37770679996902482)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37773098128902484)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37772350147902483)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(37770679996902482)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37773269740902484)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(37772350147902483)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37773467584902484)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(37772350147902483)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(37759407976902474)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37773633549902484)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(37772350147902483)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(37770679996902482)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37773883763902484)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(37772350147902483)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(37770679996902482)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37774024021902484)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(37772350147902483)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(37770679996902482)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37774671207902486)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(37774128276902485)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37774812155902486)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(37774128276902485)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37775088351902486)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(37774128276902485)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37775228123902486)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(37774128276902485)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37775428651902486)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(37774128276902485)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37775655408902486)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_api.id(37774128276902485)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37775812629902486)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(37774128276902485)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37776287298902487)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(37774128276902485)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(37776090676902487)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37776404407902487)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(37774128276902485)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(37776090676902487)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37776608397902487)
,p_theme_id=>42
,p_name=>'RESPONSIVE'
,p_display_name=>'Responsive'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37774128276902485)
,p_css_classes=>'t-BadgeList--responsive'
,p_template_types=>'LIST'
,p_help_text=>'Automatically resize badges to smaller sizes as screen becomes smaller.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37776807578902487)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37774128276902485)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(37776090676902487)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37777068804902487)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37774128276902485)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37777299563902487)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(37774128276902485)
,p_css_classes=>'.t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(37776090676902487)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37777422456902488)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(37774128276902485)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(37776090676902487)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37777811616902488)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37778296888902488)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(37778013433902488)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37778424823902488)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37778630418902488)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(37778013433902488)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37778851432902488)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37779025077902488)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(37778013433902488)
,p_template_types=>'LIST'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37779255551902488)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37779658202902489)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(37779401910902489)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37779885202902489)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(37779401910902489)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37780288377902489)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(37780084601902489)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37780400508902489)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(37780084601902489)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37780699499902490)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--featured'
,p_group_id=>wwv_flow_api.id(37779401910902489)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37780873139902490)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37781040660902490)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(37778013433902488)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37781285359902490)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37781635769902490)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Use Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37777536670902488)
,p_css_classes=>'t-Cards--colorize'
,p_group_id=>wwv_flow_api.id(37781492528902490)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37782065520902490)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37781719146902490)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_api.id(37779401910902489)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37782200042902490)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(37781719146902490)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37782472722902490)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37781719146902490)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37782640681902491)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(37781719146902490)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37783014399902491)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(37781719146902490)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(37782817857902491)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37783259408902491)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37781719146902490)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(37782817857902491)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37783601655902491)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37783399117902491)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37783889698902491)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(37783399117902491)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37784051659902492)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(37783399117902491)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37784290159902492)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(37783399117902491)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37784478935902492)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(37783399117902491)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37784642757902492)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(37783399117902491)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37784858902902492)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37783399117902491)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Shows an icon for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37785079814902492)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(37783399117902491)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37785429234902492)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(37785130772902492)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37785613489902492)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37785130772902492)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37785879189902493)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(37785130772902492)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37786008725902493)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(37785130772902492)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37787099851902494)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(37786793689902494)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_api.id(37780084601902489)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37787221607902494)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(37786793689902494)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_api.id(37774448273902486)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37787430874902494)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37786793689902494)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_api.id(37780084601902489)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37787808902902494)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37786793689902494)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_api.id(37787690912902494)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37788012412902494)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(37786793689902494)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_api.id(37779401910902489)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37788276498902495)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37786793689902494)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_api.id(37779401910902489)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37788403844902495)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(37786793689902494)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_api.id(37787690912902494)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37788868223902495)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(37788544305902495)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37789057292902495)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(37788544305902495)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37789273285902495)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(37788544305902495)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37789467185902495)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(37788544305902495)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37790044743902496)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(37789513586902495)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_api.id(37789899609902496)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37790259489902496)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(37789513586902495)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_api.id(37789899609902496)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37790489340902496)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(37789513586902495)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_api.id(37789899609902496)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37791691241902498)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(37791434210902498)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37791800499902498)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_api.id(37791434210902498)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37793384279902508)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_api.id(37793147589902507)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37793723222902508)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large Left Margin'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(37793527293902508)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37794176466902508)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large Right Margin'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_api.id(37793905864902508)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37794595004902508)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_api.id(37794399440902508)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37794941626902509)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_api.id(37794732727902508)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37795159304902509)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small Left Margin'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_api.id(37793527293902508)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37795337796902509)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small Right Margin'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_api.id(37793905864902508)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37795736848902509)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_api.id(37795521622902509)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37795948678902509)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(37795521622902509)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37796195027902510)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_api.id(37795521622902509)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37796398220902510)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_api.id(37793147589902507)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37796598324902510)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_api.id(37794732727902508)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37796757272902510)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_api.id(37794399440902508)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37797161978902510)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_api.id(37796918005902510)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37797388442902510)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_api.id(37793147589902507)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37797576961902510)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_api.id(37793147589902507)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37797976450902511)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(37797722187902510)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37798348700902511)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_api.id(37798129572902511)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37798723997902511)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(37798585758902511)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37799120754902511)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_api.id(37798941590902511)
,p_template_types=>'REGION'
,p_help_text=>'Removes padding between items.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37799329478902512)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_api.id(37798941590902511)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item padding to 4px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37799740606902512)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_api.id(37799508377902512)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37799930450902512)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_api.id(37798129572902511)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37800386246902512)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_api.id(37800127716902512)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37800555147902512)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(37800774203902512)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_api.id(37800127716902512)
,p_template_types=>'FIELD'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(46911366233766112)
,p_build_option_name=>'comment out / disabled'
,p_build_option_status=>'EXCLUDE'
);
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/translations
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts/delete_confirm_msg
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(59328175728024071)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
end;
/
prompt --application/shared_components/security/authentications/application_express_authentication
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(59324475071024006)
,p_name=>'Application Express Authentication'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_post_auth_process=>'SECURITY.post_auth'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/shared_components/security/authentications/apex_authentication_no_context
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(60530091261864787)
,p_name=>'Apex Authentication - no context'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_comments=>'This alternative authentication scheme doesn''t call our custom Security package - this means the user tracking won''t work, but makes the sample app workable from schemas that don''t have CREATE CONTEXT privilege.'
);
end;
/
prompt --application/shared_components/plugins/region_type/com_jk64_simple_google_map
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(473696923090109669)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.JK64.SIMPLE_GOOGLE_MAP'
,p_display_name=>'JK64 Simple Google Map'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.JK64.SIMPLE_GOOGLE_MAP'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- JK64 Simple Google Map v0.7',
'',
'g_tochar_format constant varchar2(100) := ''fm99999999999990.099999999999999999999999999999'';',
'',
'function render (',
'    p_region in apex_plugin.t_region,',
'    p_plugin in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean )',
'return apex_plugin.t_region_render_result',
'as',
'    subtype plugin_attr is varchar2(32767);',
'',
'    -- Variables',
'    l_result       apex_plugin.t_region_render_result;',
'    l_script       varchar2(32767);',
'    l_region       varchar2(100);',
'    l_js_params    varchar2(1000);',
'    l_lat          number;',
'    l_lng          number;',
'    l_readonly     varchar2(1000) := ''false'';',
'    l_zoom_enabled varchar2(1000) := ''true'';',
'    l_pan_enabled  varchar2(1000) := ''true'';',
'',
'    -- Plugin attributes (application level)',
'    l_api_key          plugin_attr := p_plugin.attribute_01;',
'',
'    -- Component attributes',
'    l_latlong          plugin_attr := p_region.attribute_01;',
'    l_zoom             plugin_attr := p_region.attribute_02;',
'    l_region_height    plugin_attr := p_region.attribute_03;',
'    l_item_name        plugin_attr := p_region.attribute_04;',
'    l_marker_zoom      plugin_attr := p_region.attribute_05;',
'    l_icon             plugin_attr := p_region.attribute_06;',
'    l_sign_in          plugin_attr := p_region.attribute_07;',
'    l_geocode_item     plugin_attr := p_region.attribute_08;',
'    l_country          plugin_attr := p_region.attribute_09;',
'    l_mapstyle         plugin_attr := p_region.attribute_10;',
'    l_address_item     plugin_attr := p_region.attribute_11;',
'    l_geolocate        plugin_attr := p_region.attribute_12;',
'    l_geoloc_zoom      plugin_attr := p_region.attribute_13;',
'    l_readonly_expr    plugin_attr := p_region.attribute_14;',
'    l_zoom_expr        plugin_attr := p_region.attribute_15;',
'    l_pan_expr         plugin_attr := p_region.attribute_16;',
'    l_gesture_handling plugin_attr := p_region.attribute_17;',
'    ',
'begin',
'    apex_plugin_util.debug_region (',
'        p_plugin => p_plugin,',
'        p_region => p_region,',
'        p_is_printer_friendly => p_is_printer_friendly);',
'',
'    if l_readonly_expr is not null then',
'        l_readonly := apex_plugin_util.get_plsql_expression_result (',
'            ''case when ('' || l_readonly_expr',
'            || '') then ''''true'''' else ''''false'''' end'');',
'        if l_readonly not in (''true'',''false'') then',
'            raise_application_error(-20000, ''Read-only attribute must evaluate to true or false.'');',
'        end if;',
'    end if;',
'',
'    if l_zoom_expr is not null then',
'        l_zoom_enabled := apex_plugin_util.get_plsql_expression_result (',
'            ''case when ('' || l_zoom_expr',
'            || '') then ''''true'''' else ''''false'''' end'');',
'        if l_zoom_enabled not in (''true'',''false'') then',
'            raise_application_error(-20000, ''Zoom attribute must evaluate to true or false.'');',
'        end if;',
'    end if;',
'',
'    if l_pan_expr is not null then',
'        l_pan_enabled := apex_plugin_util.get_plsql_expression_result (',
'            ''case when ('' || l_pan_expr',
'            || '') then ''''true'''' else ''''false'''' end'');',
'        if l_pan_enabled not in (''true'',''false'') then',
'            raise_application_error(-20000, ''Pan attribute must evaluate to true or false.'');',
'        end if;',
'    end if;',
'',
'    if l_sign_in = ''Y'' then',
'        l_js_params := ''&''||''signed_in=true'';',
'    end if;',
'    ',
'    apex_javascript.add_library',
'        (p_name                  => ''js?key='' || l_api_key || l_js_params',
'        ,p_directory             => ''https://maps.googleapis.com/maps/api/''',
'        ,p_skip_extension        => true);',
'',
'    apex_javascript.add_library',
'        (p_name                  => ''simplemap''',
'        ,p_directory             => p_plugin.file_prefix',
'        ,p_check_to_add_minified => true);',
'    ',
'    l_lat := to_number(substr(l_latlong,1,instr(l_latlong,'','')-1));',
'    l_lng := to_number(substr(l_latlong,instr(l_latlong,'','')+1));',
'    ',
'    l_gesture_handling := nvl(l_gesture_handling,''auto'');',
'    ',
'    l_region := case',
'                when p_region.static_id is not null',
'                then p_region.static_id',
'                else ''R''||p_region.id',
'                end;',
'    ',
'    l_script := ''<script>',
'var opt_#REGION# = {',
'container:"map_#REGION#_container"',
',regionId:"#REGION#"',
',initZoom:'' || l_zoom || ''',
',initLat:'' || to_char(l_lat,g_tochar_format) || ''',
',initLng:'' || to_char(l_lng,g_tochar_format) || ''',
',markerZoom:'' || l_marker_zoom || ''',
',icon:"'' || l_icon || ''"',
',syncItem:"'' || l_item_name || ''"',
',geocodeItem:"'' || l_geocode_item || ''"',
',country:"'' || l_country || ''"''',
'||   case when l_mapstyle is not null then ''',
',mapstyle:'' || l_mapstyle',
'     end || ''',
',addressItem:"'' || l_address_item || ''"''',
'||   case when l_geolocate = ''Y'' then ''',
',geolocate:true''',
'     ||   case when l_geoloc_zoom is not null then ''',
',geolocateZoom:'' || l_geoloc_zoom',
'          end',
'     end || ''',
',readonly:'' || l_readonly || ''',
',zoom:'' || l_zoom_enabled || ''',
',pan:'' || l_pan_enabled || ''',
',gestureHandling:"'' || l_gesture_handling || ''"',
'};',
'function r_#REGION#(f){/in/.test(document.readyState)?setTimeout("r_#REGION#("+f+")",9):f()}',
'r_#REGION#(function(){simplemap.init(opt_#REGION#);});',
'function click_#REGION#(lat,lng) {simplemap.setMarker(opt_#REGION#,lat,lng);}',
'</script>',
'<div id="map_#REGION#_container" style="min-height:'' || l_region_height || ''px"></div>'';',
'',
'  sys.htp.p(replace(l_script,''#REGION#'',l_region));',
'',
'  return l_result;',
'end render;',
''))
,p_api_version=>1
,p_render_function=>'render'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'Add a region of this type to your page and you have a map which the user can click to set a single Marker. If you set Synchronize with Item it will copy the lat,lng that the user clicks into that item; also, if the item is changed the map will move t'
||'he marker to the new location. If you set an Address item and your Google API Key, it will do a reverse geocode and put the first address result into it. You can also get the address clicked on via the "address" event whereby you can get each compone'
||'nt of an address (e.g. street number, road, locality, etc.) as separate strings.'
,p_version_identifier=>'0.7'
,p_about_url=>'https://github.com/jeffreykemp/jk64-plugin-simplemap'
,p_files_version=>32
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(482861583698812406)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Google API Key'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'Google Maps API key is required. Refer: https://developers.google.com/maps/documentation/javascript/get-api-key#get-an-api-key'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(473727366480871887)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Initial Map Position'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'0,0'
,p_max_length=>100
,p_unit=>'lat,long'
,p_is_translatable=>false
,p_help_text=>'Set the latitude and longitude as a pair of numbers to be used to position the map on page load, if no pin coordinates have been provided by the page item.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(473706784589377154)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Initial Zoom Level'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'1'
,p_max_length=>2
,p_unit=>'(0-23)'
,p_is_translatable=>false
,p_help_text=>'Set the initial map zoom level on page load, to be used if the page item has no coordinates to show.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(473707432290402714)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Min. Map Height'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'400'
,p_max_length=>5
,p_unit=>'pixels'
,p_is_translatable=>false
,p_help_text=>'Set the desired height for the map region. Note: the map width will adjust to the maximum available space.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(475365741923747824)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Synchronize with Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Position of the marker will be retrieved from and stored in this item as a Lat,Long value.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(475369756700921002)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Marker Zoom Level'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'16'
,p_unit=>'(0-23)'
,p_is_translatable=>false
,p_help_text=>'If a marker is set or moved, zoom the map to this level. Leave blank to make the map not zoom when the marker is moved.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(477635686057006140)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Marker Icon'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_max_length=>4000
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
'http://maps.google.com/mapfiles/ms/icons/purple-dot.png',
'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png',
'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
'http://maps.google.com/mapfiles/ms/icons/ylw-pushpin.png',
'http://maps.google.com/mapfiles/ms/icons/blue-pushpin.png',
'http://maps.google.com/mapfiles/ms/icons/grn-pushpin.png',
'http://maps.google.com/mapfiles/ms/icons/ltblu-pushpin.png',
'http://maps.google.com/mapfiles/ms/icons/pink-pushpin.png',
'http://maps.google.com/mapfiles/ms/icons/purple-pushpin.png',
'http://maps.google.com/mapfiles/ms/icons/red-pushpin.png'))
,p_help_text=>'URL to the icon to show for the marker. Leave blank for the default red Google pin.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(482862659076818653)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Enable Google Sign-In'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Set to Yes to enable Google sign-in on the map.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(482865055276905982)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Geocode Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Set to a text item on the page. If the text item contains the name of a location or an address, a Google Maps Geocode search will be done and, if found, the map will be moved to that location and a pin shown. NOTE: requires a Google API key to be set'
||' at the application level.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(482865811566909363)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Restrict to Country code'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>10
,p_max_length=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(482865055276905982)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_text_case=>'UPPER'
,p_examples=>'AU'
,p_help_text=>'Leave blank to allow geocoding to find any place on earth. Set to country code (see https://developers.google.com/public-data/docs/canonical/countries_csv for valid values) to restrict geocoder to that country.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(408027453678333607)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Map Style'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Here is an example, a light greyscale style map:',
'<pre>',
'[{"featureType":"water","elementType":"geometry","stylers":[{"color":"#e9e9e9"},{"lightness":17}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#f5f5f5"},{"lightness":20}]},{"featureType":"road.highway","elementType":"geom'
||'etry.fill","stylers":[{"color":"#ffffff"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#ffffff"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","style'
||'rs":[{"color":"#ffffff"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":16}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#f5f5f5"},{"lightness":21}]},{"featu'
||'reType":"poi.park","elementType":"geometry","stylers":[{"color":"#dedede"},{"lightness":21}]},{"elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#ffffff"},{"lightness":16}]},{"elementType":"labels.text.fill","stylers":[{"sat'
||'uration":36},{"color":"#333333"},{"lightness":40}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#f2f2f2"},{"lightness":19}]},{"featureType":"administrative","el'
||'ementType":"geometry.fill","stylers":[{"color":"#fefefe"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#fefefe"},{"lightness":17},{"weight":1.2}]}]',
'</pre>',
'<p>',
'To hide the (clickable) POIs from the map, use this:',
'<code>[{featureType:"poi",elementType:"labels",stylers:[{visibility:"off"}]}]</code>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'You can generate map styles using this tool: http://gmaps-samples-v3.googlecode.com/svn/trunk/styledmaps/wizard/index.html',
'<p>',
'Another way is to copy one from a site like https://snazzymaps.com/'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(257023686968386389)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Address Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Google API Key required. When the user clicks a point on the map, a Google Maps reverse geocode will be executed and the first result (usually the address) will be copied to the item you specify here.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(188035155600117451)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Geolocate'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'If Yes, on load the map will attempt to locate the user''s position and pan&zoom to that location (it might prompt the user for permission first).'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(188036756737188716)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_prompt=>'Zoom on Geolocate'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_default_value=>'13'
,p_display_length=>2
,p_max_length=>2
,p_unit=>'(0-23)'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(188035155600117451)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'If geolocation is successful, pan map and zoom to this level.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(106005738954805338)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Read-only'
,p_attribute_type=>'PLSQL EXPRESSION BOOLEAN'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<code>true</code>',
'<p>',
'<code>:P1_ITEM IS NOT NULL</code>'))
,p_help_text=>'By default, this plugin allows the user to click the map to move the marker. To make the map "readonly" (i.e. disallow the user from moving the marker), set this to a PL/SQL expression that evaluates to TRUE.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(158393229731888850)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Zoom enabled'
,p_attribute_type=>'PLSQL EXPRESSION BOOLEAN'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<code>true</code>',
'<p>',
'<code>:P1_ITEM IS NOT NULL</code>'))
,p_help_text=>'If this evaluates to true, the Zoom controls will be enabled. If no expression is supplied, the default is true (enabled).'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(158394369421891872)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>16
,p_display_sequence=>160
,p_prompt=>'Pan enabled'
,p_attribute_type=>'PLSQL EXPRESSION BOOLEAN'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<code>true</code>',
'<p>',
'<code>:P1_ITEM IS NOT NULL</code>'))
,p_help_text=>'If this evaluates to true, the Pan controls will be enabled. If no expression is supplied, the default is true (enabled).'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(158400195085001239)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>17
,p_display_sequence=>170
,p_prompt=>'Gesture Handling'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_show_in_wizard=>false
,p_default_value=>'auto'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'This attribute allows you to select how the map responds to touch gestures on a mobile device. Mobile web users often get frustrated when trying to scroll the page, but an embedded map captures their swipe and pans the map instead. This can even lead'
||' to users getting stuck on the map and having to reload the page in order to get back to the rest of the page. This option allows you to make scrolling more intuitive and less frustrating map interaction experience on mobile browsers.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(158401269227004223)
,p_plugin_attribute_id=>wwv_flow_api.id(158400195085001239)
,p_display_sequence=>10
,p_display_value=>'cooperative'
,p_return_value=>'cooperative'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Scroll events and one-finger touch gestures scroll the page, and do not zoom or pan the map. Two-finger touch gestures pan and zoom the map. Scroll events with a ctrl key or \2318 key pressed zoom the map.'),
'In this mode the map cooperates with the page.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(158401631222005964)
,p_plugin_attribute_id=>wwv_flow_api.id(158400195085001239)
,p_display_sequence=>20
,p_display_value=>'greedy'
,p_return_value=>'greedy'
,p_help_text=>'All touch gestures and scroll events pan or zoom the map.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(158402071429007254)
,p_plugin_attribute_id=>wwv_flow_api.id(158400195085001239)
,p_display_sequence=>30
,p_display_value=>'none'
,p_return_value=>'none'
,p_help_text=>'The map cannot be panned or zoomed by user gestures.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(158402452454008794)
,p_plugin_attribute_id=>wwv_flow_api.id(158400195085001239)
,p_display_sequence=>40
,p_display_value=>'auto'
,p_return_value=>'auto'
,p_help_text=>'(default) Gesture handling is either cooperative or greedy, depending on whether the page is scrollable.'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(158405803430203004)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_name=>'address'
,p_display_name=>'address'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(188038325559205753)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_name=>'geolocate'
,p_display_name=>'geolocate'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(473710585859538760)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_name=>'mapclick'
,p_display_name=>'mapClick'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(482863595625821523)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_name=>'maploaded'
,p_display_name=>'mapLoaded'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7661722073696D706C656D6170203D207B0D0A2F2F204A4B36342053696D706C6520476F6F676C65204D61702076302E360D0A0D0A67656F636F6465203A2066756E6374696F6E20286F70742C67656F636F64657229207B0D0A2020617065782E646562';
wwv_flow_api.g_varchar2_table(2) := '7567282273696D706C656D61702E67656F636F646522293B0D0A202067656F636F6465722E67656F636F6465280D0A202020207B616464726573733A202476286F70742E67656F636F64654974656D290D0A202020202C636F6D706F6E656E7452657374';
wwv_flow_api.g_varchar2_table(3) := '72696374696F6E733A206F70742E636F756E747279213D3D22223F7B636F756E7472793A6F70742E636F756E7472797D3A7B7D0D0A20207D2C2066756E6374696F6E28726573756C74732C2073746174757329207B0D0A20202020696620287374617475';
wwv_flow_api.g_varchar2_table(4) := '73203D3D20676F6F676C652E6D6170732E47656F636F6465725374617475732E4F4B29207B0D0A202020202020617065782E6465627567286F70742E726567696F6E49642B222067656F636F6465206F6B22293B0D0A20202020202076617220706F7320';
wwv_flow_api.g_varchar2_table(5) := '3D20726573756C74735B305D2E67656F6D657472792E6C6F636174696F6E3B0D0A20202020202073696D706C656D61702E7365744D61726B6572286F70742C706F732E6C617428292C706F732E6C6E672829290D0A202020202020696620286F70742E73';
wwv_flow_api.g_varchar2_table(6) := '796E634974656D213D3D222229207B0D0A20202020202020202473286F70742E73796E634974656D2C706F732E6C617428292B222C222B706F732E6C6E672829293B0D0A2020202020207D0D0A202020207D20656C7365207B0D0A202020202020617065';
wwv_flow_api.g_varchar2_table(7) := '782E6465627567286F70742E726567696F6E49642B222067656F636F64652077617320756E7375636365737366756C20666F722074686520666F6C6C6F77696E6720726561736F6E3A20222B737461747573293B0D0A202020207D0D0A20207D293B0D0A';
wwv_flow_api.g_varchar2_table(8) := '7D2C0D0A0D0A7365744D61726B6572203A2066756E6374696F6E20286F70742C6C61742C6C6E6729207B0D0A2020617065782E6465627567282273696D706C656D61702E7365744D61726B657222293B0D0A2020696620286C6174213D3D6E756C6C2026';
wwv_flow_api.g_varchar2_table(9) := '26206C6E67213D3D6E756C6C29207B0D0A20202020766172206F6C64706F73203D206F70742E6D61726B65723F6F70742E6D61726B65722E676574506F736974696F6E28293A6E657720676F6F676C652E6D6170732E4C61744C6E6728302C30293B0D0A';
wwv_flow_api.g_varchar2_table(10) := '20202020696620286C61743D3D6F6C64706F732E6C61742829202626206C6E673D3D6F6C64706F732E6C6E67282929207B0D0A202020202020617065782E6465627567286F70742E726567696F6E49642B22206D61726B6572206E6F74206368616E6765';
wwv_flow_api.g_varchar2_table(11) := '6422293B0D0A202020207D20656C7365207B0D0A202020202020617065782E6465627567286F70742E726567696F6E49642B22206D6F7665206D61726B657222293B0D0A20202020202076617220706F73203D206E657720676F6F676C652E6D6170732E';
wwv_flow_api.g_varchar2_table(12) := '4C61744C6E67286C61742C6C6E67293B0D0A2020202020206F70742E6D61702E70616E546F28706F73293B0D0A202020202020696620286F70742E6D61726B65725A6F6F6D29207B0D0A20202020202020206F70742E6D61702E7365745A6F6F6D286F70';
wwv_flow_api.g_varchar2_table(13) := '742E6D61726B65725A6F6F6D293B0D0A2020202020207D0D0A202020202020696620286F70742E6D61726B657229207B0D0A20202020202020206F70742E6D61726B65722E7365744D6170286F70742E6D6170293B0D0A20202020202020206F70742E6D';
wwv_flow_api.g_varchar2_table(14) := '61726B65722E736574506F736974696F6E28706F73293B0D0A2020202020207D20656C7365207B0D0A20202020202020206F70742E6D61726B6572203D206E657720676F6F676C652E6D6170732E4D61726B6572287B6D61703A206F70742E6D61702C20';
wwv_flow_api.g_varchar2_table(15) := '706F736974696F6E3A20706F732C2069636F6E3A206F70742E69636F6E7D293B0D0A2020202020207D0D0A202020207D0D0A20207D20656C736520696620286F70742E6D61726B657229207B0D0A20202020617065782E6465627567286F70742E726567';
wwv_flow_api.g_varchar2_table(16) := '696F6E49642B222072656D6F7665206D61726B657222293B0D0A202020206F70742E6D61726B65722E7365744D6170286E756C6C293B0D0A20207D0D0A7D2C0D0A0D0A67657441646472657373203A2066756E6374696F6E20286F70742C6C61742C6C6E';
wwv_flow_api.g_varchar2_table(17) := '6729207B0D0A2020617065782E6465627567282273696D706C656D61702E6765744164647265737322293B0D0A09766172206C61746C6E67203D207B6C61743A206C61742C206C6E673A206C6E677D3B0D0A096F70742E67656F636F6465722E67656F63';
wwv_flow_api.g_varchar2_table(18) := '6F6465287B276C6F636174696F6E273A206C61746C6E677D2C2066756E6374696F6E28726573756C74732C2073746174757329207B0D0A090969662028737461747573203D3D3D20676F6F676C652E6D6170732E47656F636F6465725374617475732E4F';
wwv_flow_api.g_varchar2_table(19) := '4B29207B0D0A090909666F722028693D303B20693C726573756C74732E6C656E6774683B20692B2B29207B0D0A09090909617065782E6465627567286F70742E726567696F6E49642B2220726573756C745B222B692B225D3D222B726573756C74735B69';
wwv_flow_api.g_varchar2_table(20) := '5D2E666F726D61747465645F616464726573732B222028222B726573756C74735B695D2E74797065732E6A6F696E28292B222922293B0D0A0909097D0D0A09090969662028726573756C74735B305D29207B0D0A090909092473286F70742E6164647265';
wwv_flow_api.g_varchar2_table(21) := '73734974656D2C726573756C74735B305D2E666F726D61747465645F61646472657373293B0D0A202020202020202076617220636F6D706F6E656E7473203D20726573756C74735B305D2E616464726573735F636F6D706F6E656E74733B0D0A20202020';
wwv_flow_api.g_varchar2_table(22) := '20202020666F722028693D303B20693C636F6D706F6E656E74732E6C656E6774683B20692B2B29207B0D0A20202020202020202020617065782E6465627567286F70742E726567696F6E49642B2220726573756C745B305D20222B636F6D706F6E656E74';
wwv_flow_api.g_varchar2_table(23) := '735B695D2E74797065732B223D222B636F6D706F6E656E74735B695D2E73686F72745F6E616D652B222028222B636F6D706F6E656E74735B695D2E6C6F6E675F6E616D652B222922293B0D0A20202020202020207D0D0A2020202020202020617065782E';
wwv_flow_api.g_varchar2_table(24) := '6A5175657279282223222B6F70742E726567696F6E4964292E74726967676572282261646472657373222C207B6D61703A6F70742E6D61702C20726573756C743A726573756C74735B305D7D293B0D0A0909097D20656C7365207B0D0A0909090977696E';
wwv_flow_api.g_varchar2_table(25) := '646F772E616C6572742827496E73756666696369656E7420726573756C747320666F756E6427293B0D0A0909097D0D0A09097D20656C73652069662028737461747573203D3D3D20676F6F676C652E6D6170732E47656F636F6465725374617475732E5A';
wwv_flow_api.g_varchar2_table(26) := '45524F5F524553554C545329207B0D0A09090977696E646F772E616C65727428224E6F20726573756C747320666F756E6422293B0D0A09097D20656C7365207B0D0A09090977696E646F772E616C657274282747656F636F646572206661696C65642064';
wwv_flow_api.g_varchar2_table(27) := '756520746F3A2027202B20737461747573293B0D0A09097D0D0A097D293B0D0A7D2C0D0A0D0A696E6974203A2066756E6374696F6E20286F707429207B0D0A2020617065782E6465627567282273696D706C656D61702E696E697422293B0D0A09766172';
wwv_flow_api.g_varchar2_table(28) := '206D794F7074696F6E73203D207B0D0A09097A6F6F6D3A206F70742E696E69745A6F6F6D2C0D0A090963656E7465723A206E657720676F6F676C652E6D6170732E4C61744C6E67286F70742E696E69744C61742C6F70742E696E69744C6E67292C0D0A09';
wwv_flow_api.g_varchar2_table(29) := '096D61705479706549643A20676F6F676C652E6D6170732E4D61705479706549642E524F41444D41500D0A097D3B0D0A096F70742E6D6170203D206E657720676F6F676C652E6D6170732E4D617028646F63756D656E742E676574456C656D656E744279';
wwv_flow_api.g_varchar2_table(30) := '4964286F70742E636F6E7461696E6572292C6D794F7074696F6E73293B0D0A09696620286F70742E6D61707374796C6529207B0D0A09096F70742E6D61702E7365744F7074696F6E73287B7374796C65733A206F70742E6D61707374796C657D293B0D0A';
wwv_flow_api.g_varchar2_table(31) := '097D0D0A2020696620286F70742E726561646F6E6C7929207B0D0A202020202F2F64697361626C65207A6F6F6D2F70616E20696620726561646F6E6C790D0A202020206F70742E6D61702E7365744F7074696F6E73287B0D0A2020202020202064697361';
wwv_flow_api.g_varchar2_table(32) := '626C6544656661756C7455493A20747275650D0A2020202020202C647261676761626C653A206F70742E70616E0D0A2020202020202C7A6F6F6D436F6E74726F6C3A206F70742E7A6F6F6D0D0A2020202020202C7363726F6C6C776865656C3A206F7074';
wwv_flow_api.g_varchar2_table(33) := '2E7A6F6F6D0D0A2020202020202C64697361626C65446F75626C65436C69636B5A6F6F6D3A2021286F70742E7A6F6F6D290D0A2020202020202C6765737475726548616E646C696E673A206F70742E6765737475726548616E646C696E670D0A20202020';
wwv_flow_api.g_varchar2_table(34) := '7D293B0D0A20207D20656C7365207B0D0A202020206F70742E6D61702E7365744F7074696F6E73287B0D0A20202020202020647261676761626C653A206F70742E70616E0D0A2020202020202C7A6F6F6D436F6E74726F6C3A206F70742E7A6F6F6D0D0A';
wwv_flow_api.g_varchar2_table(35) := '2020202020202C7363726F6C6C776865656C3A206F70742E7A6F6F6D0D0A2020202020202C64697361626C65446F75626C65436C69636B5A6F6F6D3A2021286F70742E7A6F6F6D290D0A2020202020202C6765737475726548616E646C696E673A206F70';
wwv_flow_api.g_varchar2_table(36) := '742E6765737475726548616E646C696E670D0A202020207D293B0D0A20207D0D0A09696620286F70742E73796E634974656D213D3D222229207B0D0A09097661722076616C203D202476286F70742E73796E634974656D293B0D0A09096966202876616C';
wwv_flow_api.g_varchar2_table(37) := '213D3D6E756C6C2026262076616C2E696E6465784F6628222C2229203E202D3129207B0D0A09090976617220617272203D2076616C2E73706C697428222C22293B0D0A09090973696D706C656D61702E7365744D61726B6572286F70742C6172725B305D';
wwv_flow_api.g_varchar2_table(38) := '2C6172725B315D293B0D0A09097D0D0A090924282223222B6F70742E73796E634974656D292E6368616E67652866756E6374696F6E28297B200D0A090909766172206C61746C6E67203D20746869732E76616C75653B0D0A090909696620286C61746C6E';
wwv_flow_api.g_varchar2_table(39) := '67213D3D6E756C6C202626206C61746C6E67213D3D756E646566696E6564202626206C61746C6E672E696E6465784F6628222C2229203E202D3129207B0D0A0909090976617220617272203D206C61746C6E672E73706C697428222C22293B0D0A090909';
wwv_flow_api.g_varchar2_table(40) := '0973696D706C656D61702E7365744D61726B6572286F70742C6172725B305D2C6172725B315D293B0D0A0909097D202020200D0A09097D293B0D0A097D0D0A09696620286F70742E616464726573734974656D213D3D222229207B0D0A09096F70742E67';
wwv_flow_api.g_varchar2_table(41) := '656F636F646572203D206E657720676F6F676C652E6D6170732E47656F636F6465723B0D0A097D0D0A202069662028216F70742E726561646F6E6C7929207B0D0A20202020676F6F676C652E6D6170732E6576656E742E6164644C697374656E6572286F';
wwv_flow_api.g_varchar2_table(42) := '70742E6D61702C2022636C69636B222C2066756E6374696F6E20286576656E7429207B0D0A202020202020766172206C6174203D206576656E742E6C61744C6E672E6C617428290D0A2020202020202020202C6C6E67203D206576656E742E6C61744C6E';
wwv_flow_api.g_varchar2_table(43) := '672E6C6E6728293B0D0A20202020202073696D706C656D61702E7365744D61726B6572286F70742C6C61742C6C6E67293B0D0A202020202020696620286F70742E73796E634974656D213D3D222229207B0D0A20202020202020202473286F70742E7379';
wwv_flow_api.g_varchar2_table(44) := '6E634974656D2C6C61742B222C222B6C6E67293B0D0A2020202020207D0D0A202020202020696620286F70742E616464726573734974656D213D3D222229207B0D0A202020202020202073696D706C656D61702E67657441646472657373286F70742C6C';
wwv_flow_api.g_varchar2_table(45) := '61742C6C6E67293B0D0A2020202020207D0D0A202020202020617065782E6A5175657279282223222B6F70742E726567696F6E4964292E7472696767657228226D6170636C69636B222C207B6D61703A6F70742E6D61702C206C61743A6C61742C206C6E';
wwv_flow_api.g_varchar2_table(46) := '673A6C6E677D293B0D0A202020207D293B0D0A20207D0D0A09696620286F70742E67656F636F64654974656D213D222229207B0D0A09097661722067656F636F646572203D206E657720676F6F676C652E6D6170732E47656F636F64657228293B0D0A09';
wwv_flow_api.g_varchar2_table(47) := '0924282223222B6F70742E67656F636F64654974656D292E6368616E67652866756E6374696F6E28297B0D0A09090973696D706C656D61702E67656F636F6465286F70742C67656F636F646572293B0D0A09097D293B0D0A097D0D0A09696620286F7074';
wwv_flow_api.g_varchar2_table(48) := '2E67656F6C6F6361746529207B0D0A0909696620286E6176696761746F722E67656F6C6F636174696F6E29207B0D0A090909617065782E6465627567286F70742E726567696F6E49642B222067656F6C6F6361746522293B0D0A0909096E617669676174';
wwv_flow_api.g_varchar2_table(49) := '6F722E67656F6C6F636174696F6E2E67657443757272656E74506F736974696F6E2866756E6374696F6E28706F736974696F6E29207B0D0A0909090976617220706F73203D207B0D0A09090909096C61743A20706F736974696F6E2E636F6F7264732E6C';
wwv_flow_api.g_varchar2_table(50) := '617469747564652C0D0A09090909096C6E673A20706F736974696F6E2E636F6F7264732E6C6F6E6769747564650D0A090909097D3B0D0A090909096F70742E6D61702E70616E546F28706F73293B0D0A09090909696620286F70742E67656F6C6F636174';
wwv_flow_api.g_varchar2_table(51) := '655A6F6F6D29207B0D0A0909090920206F70742E6D61702E7365745A6F6F6D286F70742E67656F6C6F636174655A6F6F6D293B0D0A090909097D0D0A2020202020202020696620286F70742E73796E634974656D213D3D222229207B0D0A202020202020';
wwv_flow_api.g_varchar2_table(52) := '202020202473286F70742E73796E634974656D2C706F732E6C61742B222C222B706F732E6C6E67293B0D0A20202020202020207D0D0A2020202020202020696620286F70742E616464726573734974656D213D3D222229207B0D0A202020202020202020';
wwv_flow_api.g_varchar2_table(53) := '2073696D706C656D61702E67657441646472657373286F70742C706F732E6C61742C706F732E6C6E67293B0D0A20202020202020207D0D0A09090909617065782E6A5175657279282223222B6F70742E726567696F6E4964292E74726967676572282267';
wwv_flow_api.g_varchar2_table(54) := '656F6C6F63617465222C207B6D61703A6F70742E6D61702C206C61743A706F732E6C61742C206C6E673A706F732E6C6E677D293B0D0A0909097D293B0D0A09097D20656C7365207B0D0A090909617065782E6465627567286F70742E726567696F6E4964';
wwv_flow_api.g_varchar2_table(55) := '2B222062726F7773657220646F6573206E6F7420737570706F72742067656F6C6F636174696F6E22293B0D0A09097D0D0A097D0D0A09617065782E6A5175657279282223222B6F70742E726567696F6E4964292E7472696767657228226D61706C6F6164';
wwv_flow_api.g_varchar2_table(56) := '6564222C207B6D61703A6F70742E6D61707D293B0D0A7D0D0A0D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(106007454908852047)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_file_name=>'simplemap.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7661722073696D706C656D61703D7B67656F636F64653A66756E6374696F6E28652C6F297B617065782E6465627567282273696D706C656D61702E67656F636F646522292C6F2E67656F636F6465287B616464726573733A247628652E67656F636F6465';
wwv_flow_api.g_varchar2_table(2) := '4974656D292C636F6D706F6E656E745265737472696374696F6E733A2222213D3D652E636F756E7472793F7B636F756E7472793A652E636F756E7472797D3A7B7D7D2C66756E6374696F6E286F2C61297B696628613D3D676F6F676C652E6D6170732E47';
wwv_flow_api.g_varchar2_table(3) := '656F636F6465725374617475732E4F4B297B617065782E646562756728652E726567696F6E49642B222067656F636F6465206F6B22293B76617220743D6F5B305D2E67656F6D657472792E6C6F636174696F6E3B73696D706C656D61702E7365744D6172';
wwv_flow_api.g_varchar2_table(4) := '6B657228652C742E6C617428292C742E6C6E672829292C2222213D3D652E73796E634974656D2626247328652E73796E634974656D2C742E6C617428292B222C222B742E6C6E672829297D656C736520617065782E646562756728652E726567696F6E49';
wwv_flow_api.g_varchar2_table(5) := '642B222067656F636F64652077617320756E7375636365737366756C20666F722074686520666F6C6C6F77696E6720726561736F6E3A20222B61297D297D2C7365744D61726B65723A66756E6374696F6E28652C6F2C61297B696628617065782E646562';
wwv_flow_api.g_varchar2_table(6) := '7567282273696D706C656D61702E7365744D61726B657222292C6E756C6C213D3D6F26266E756C6C213D3D61297B76617220743D652E6D61726B65723F652E6D61726B65722E676574506F736974696F6E28293A6E657720676F6F676C652E6D6170732E';
wwv_flow_api.g_varchar2_table(7) := '4C61744C6E6728302C30293B6966286F3D3D742E6C617428292626613D3D742E6C6E67282929617065782E646562756728652E726567696F6E49642B22206D61726B6572206E6F74206368616E67656422293B656C73657B617065782E64656275672865';
wwv_flow_api.g_varchar2_table(8) := '2E726567696F6E49642B22206D6F7665206D61726B657222293B766172206E3D6E657720676F6F676C652E6D6170732E4C61744C6E67286F2C61293B652E6D61702E70616E546F286E292C652E6D61726B65725A6F6F6D2626652E6D61702E7365745A6F';
wwv_flow_api.g_varchar2_table(9) := '6F6D28652E6D61726B65725A6F6F6D292C652E6D61726B65723F28652E6D61726B65722E7365744D617028652E6D6170292C652E6D61726B65722E736574506F736974696F6E286E29293A652E6D61726B65723D6E657720676F6F676C652E6D6170732E';
wwv_flow_api.g_varchar2_table(10) := '4D61726B6572287B6D61703A652E6D61702C706F736974696F6E3A6E2C69636F6E3A652E69636F6E7D297D7D656C736520652E6D61726B6572262628617065782E646562756728652E726567696F6E49642B222072656D6F7665206D61726B657222292C';
wwv_flow_api.g_varchar2_table(11) := '652E6D61726B65722E7365744D6170286E756C6C29297D2C676574416464726573733A66756E6374696F6E28652C6F2C61297B617065782E6465627567282273696D706C656D61702E6765744164647265737322293B76617220743D7B6C61743A6F2C6C';
wwv_flow_api.g_varchar2_table(12) := '6E673A617D3B652E67656F636F6465722E67656F636F6465287B6C6F636174696F6E3A747D2C66756E6374696F6E286F2C61297B696628613D3D3D676F6F676C652E6D6170732E47656F636F6465725374617475732E4F4B297B666F7228693D303B693C';
wwv_flow_api.g_varchar2_table(13) := '6F2E6C656E6774683B692B2B29617065782E646562756728652E726567696F6E49642B2220726573756C745B222B692B225D3D222B6F5B695D2E666F726D61747465645F616464726573732B222028222B6F5B695D2E74797065732E6A6F696E28292B22';
wwv_flow_api.g_varchar2_table(14) := '2922293B6966286F5B305D297B247328652E616464726573734974656D2C6F5B305D2E666F726D61747465645F61646472657373293B76617220743D6F5B305D2E616464726573735F636F6D706F6E656E74733B666F7228693D303B693C742E6C656E67';
wwv_flow_api.g_varchar2_table(15) := '74683B692B2B29617065782E646562756728652E726567696F6E49642B2220726573756C745B305D20222B745B695D2E74797065732B223D222B745B695D2E73686F72745F6E616D652B222028222B745B695D2E6C6F6E675F6E616D652B222922293B61';
wwv_flow_api.g_varchar2_table(16) := '7065782E6A5175657279282223222B652E726567696F6E4964292E74726967676572282261646472657373222C7B6D61703A652E6D61702C726573756C743A6F5B305D7D297D656C73652077696E646F772E616C6572742822496E73756666696369656E';
wwv_flow_api.g_varchar2_table(17) := '7420726573756C747320666F756E6422297D656C736520613D3D3D676F6F676C652E6D6170732E47656F636F6465725374617475732E5A45524F5F524553554C54533F77696E646F772E616C65727428224E6F20726573756C747320666F756E6422293A';
wwv_flow_api.g_varchar2_table(18) := '77696E646F772E616C657274282247656F636F646572206661696C65642064756520746F3A20222B61297D297D2C696E69743A66756E6374696F6E2865297B617065782E6465627567282273696D706C656D61702E696E697422293B766172206F3D7B7A';
wwv_flow_api.g_varchar2_table(19) := '6F6F6D3A652E696E69745A6F6F6D2C63656E7465723A6E657720676F6F676C652E6D6170732E4C61744C6E6728652E696E69744C61742C652E696E69744C6E67292C6D61705479706549643A676F6F676C652E6D6170732E4D61705479706549642E524F';
wwv_flow_api.g_varchar2_table(20) := '41444D41507D3B696628652E6D61703D6E657720676F6F676C652E6D6170732E4D617028646F63756D656E742E676574456C656D656E744279496428652E636F6E7461696E6572292C6F292C652E6D61707374796C652626652E6D61702E7365744F7074';
wwv_flow_api.g_varchar2_table(21) := '696F6E73287B7374796C65733A652E6D61707374796C657D292C652E726561646F6E6C793F652E6D61702E7365744F7074696F6E73287B64697361626C6544656661756C7455493A21302C647261676761626C653A652E70616E2C7A6F6F6D436F6E7472';
wwv_flow_api.g_varchar2_table(22) := '6F6C3A652E7A6F6F6D2C7363726F6C6C776865656C3A652E7A6F6F6D2C64697361626C65446F75626C65436C69636B5A6F6F6D3A21652E7A6F6F6D2C6765737475726548616E646C696E673A652E6765737475726548616E646C696E677D293A652E6D61';
wwv_flow_api.g_varchar2_table(23) := '702E7365744F7074696F6E73287B647261676761626C653A652E70616E2C7A6F6F6D436F6E74726F6C3A652E7A6F6F6D2C7363726F6C6C776865656C3A652E7A6F6F6D2C64697361626C65446F75626C65436C69636B5A6F6F6D3A21652E7A6F6F6D2C67';
wwv_flow_api.g_varchar2_table(24) := '65737475726548616E646C696E673A652E6765737475726548616E646C696E677D292C2222213D3D652E73796E634974656D297B76617220613D247628652E73796E634974656D293B6966286E756C6C213D3D612626612E696E6465784F6628222C2229';
wwv_flow_api.g_varchar2_table(25) := '3E2D31297B76617220743D612E73706C697428222C22293B73696D706C656D61702E7365744D61726B657228652C745B305D2C745B315D297D24282223222B652E73796E634974656D292E6368616E67652866756E6374696F6E28297B766172206F3D74';
wwv_flow_api.g_varchar2_table(26) := '6869732E76616C75653B6966286E756C6C213D3D6F2626766F69642030213D3D6F26266F2E696E6465784F6628222C22293E2D31297B76617220613D6F2E73706C697428222C22293B73696D706C656D61702E7365744D61726B657228652C615B305D2C';
wwv_flow_api.g_varchar2_table(27) := '615B315D297D7D297D6966282222213D3D652E616464726573734974656D262628652E67656F636F6465723D6E657720676F6F676C652E6D6170732E47656F636F646572292C652E726561646F6E6C797C7C676F6F676C652E6D6170732E6576656E742E';
wwv_flow_api.g_varchar2_table(28) := '6164644C697374656E657228652E6D61702C22636C69636B222C66756E6374696F6E286F297B76617220613D6F2E6C61744C6E672E6C617428292C743D6F2E6C61744C6E672E6C6E6728293B73696D706C656D61702E7365744D61726B657228652C612C';
wwv_flow_api.g_varchar2_table(29) := '74292C2222213D3D652E73796E634974656D2626247328652E73796E634974656D2C612B222C222B74292C2222213D3D652E616464726573734974656D262673696D706C656D61702E6765744164647265737328652C612C74292C617065782E6A517565';
wwv_flow_api.g_varchar2_table(30) := '7279282223222B652E726567696F6E4964292E7472696767657228226D6170636C69636B222C7B6D61703A652E6D61702C6C61743A612C6C6E673A747D297D292C2222213D652E67656F636F64654974656D297B766172206E3D6E657720676F6F676C65';
wwv_flow_api.g_varchar2_table(31) := '2E6D6170732E47656F636F6465723B24282223222B652E67656F636F64654974656D292E6368616E67652866756E6374696F6E28297B73696D706C656D61702E67656F636F646528652C6E297D297D652E67656F6C6F636174652626286E617669676174';
wwv_flow_api.g_varchar2_table(32) := '6F722E67656F6C6F636174696F6E3F28617065782E646562756728652E726567696F6E49642B222067656F6C6F6361746522292C6E6176696761746F722E67656F6C6F636174696F6E2E67657443757272656E74506F736974696F6E2866756E6374696F';
wwv_flow_api.g_varchar2_table(33) := '6E286F297B76617220613D7B6C61743A6F2E636F6F7264732E6C617469747564652C6C6E673A6F2E636F6F7264732E6C6F6E6769747564657D3B652E6D61702E70616E546F2861292C652E67656F6C6F636174655A6F6F6D2626652E6D61702E7365745A';
wwv_flow_api.g_varchar2_table(34) := '6F6F6D28652E67656F6C6F636174655A6F6F6D292C2222213D3D652E73796E634974656D2626247328652E73796E634974656D2C612E6C61742B222C222B612E6C6E67292C2222213D3D652E616464726573734974656D262673696D706C656D61702E67';
wwv_flow_api.g_varchar2_table(35) := '65744164647265737328652C612E6C61742C612E6C6E67292C617065782E6A5175657279282223222B652E726567696F6E4964292E74726967676572282267656F6C6F63617465222C7B6D61703A652E6D61702C6C61743A612E6C61742C6C6E673A612E';
wwv_flow_api.g_varchar2_table(36) := '6C6E677D297D29293A617065782E646562756728652E726567696F6E49642B222062726F7773657220646F6573206E6F7420737570706F72742067656F6C6F636174696F6E2229292C617065782E6A5175657279282223222B652E726567696F6E496429';
wwv_flow_api.g_varchar2_table(37) := '2E7472696767657228226D61706C6F61646564222C7B6D61703A652E6D61707D297D7D3B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(106012358399090333)
,p_plugin_id=>wwv_flow_api.id(473696923090109669)
,p_file_name=>'simplemap.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(59324280286023993)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:8:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_api.id(37801177119919474)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(37786512675902493)
,p_nav_list_template_options=>'#DEFAULT#'
,p_include_legacy_javascript=>'PRE18:18'
,p_include_jquery_migrate=>true
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(68678802447047907)
,p_nav_bar_list_template_id=>wwv_flow_api.id(37786319853902493)
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(59324280286023993)
,p_name=>'Global Page - Desktop'
,p_step_title=>'Global Page - Desktop'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_updated_by=>'JEFF'
,p_last_upd_yyyymmddhh24miss=>'20190327213256'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18325736924943716)
,p_plug_name=>'debug'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37749289366902466)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(''<small>''',
'|| ''userenv-client_identifier='' || sys_context(''userenv'',''client_identifier'')',
'|| ''<br>sample_ctx-security_group_id='' || sys_context(''sample_ctx'',''security_group_id'')',
'|| ''</small>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(59324280286023993)
,p_name=>'Events'
,p_step_title=>'Events'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Events'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(62246971721848558)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JEFF'
,p_last_upd_yyyymmddhh24miss=>'20190328212642'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59325989235024022)
,p_plug_name=>'EVENTS'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37748115288902466)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT event_id',
'      ,event_type_code',
'      ,event_type_name',
'      ,host_id',
'      ,host_name',
'      ,title',
'      ,description',
'      ,venue_id',
'      ,venue',
'      ,start_dt',
'      ,end_dt',
'      ,repeat_desc AS repeat_type',
'      ,repeat_interval',
'      ,repeat_until',
'      ,db$created_by as created_by',
'      ,db$created_dt AS created_date',
'      ,db$last_updated_by as last_updated_by',
'      ,db$last_updated_dt AS last_updated_date',
'FROM   events_vw',
'WHERE  (:P1_PAST_IND = ''Y'' OR current_ind = ''Y'')',
'AND    repeat_no = 0'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P1_PAST_IND'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'SELECT 1 FROM event_types'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(59326093163024022)
,p_name=>'EVENTS'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_LEFT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::P2_EVENT_ID:#EVENT_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#e2.gif" alt="">'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'JEFF'
,p_internal_uid=>21618731604135872
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59326164172024026)
,p_db_column_name=>'EVENT_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Event Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'EVENT_ID'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59326280416024026)
,p_db_column_name=>'TITLE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Event'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:P2_EVENT_ID:#EVENT_ID#'
,p_column_linktext=>'#TITLE#'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'TITLE'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59326372176024026)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'DESCRIPTION'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59326676595024027)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'CREATED_BY'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59326779740024027)
,p_db_column_name=>'CREATED_DATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_static_id=>'CREATED_DATE'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59326887827024027)
,p_db_column_name=>'LAST_UPDATED_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Last Updated By'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'LAST_UPDATED_BY'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59326983393024027)
,p_db_column_name=>'LAST_UPDATED_DATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Last Updated'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_static_id=>'LAST_UPDATED_DATE'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(64752191530873103)
,p_db_column_name=>'EVENT_TYPE_NAME'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_static_id=>'EVENT_TYPE_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(66964991150380663)
,p_db_column_name=>'HOST_NAME'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Host'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP,6:P6_HOST_ID:#HOST_ID#'
,p_column_linktext=>'#HOST_NAME#'
,p_column_type=>'STRING'
,p_static_id=>'HOST_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(66969183909535958)
,p_db_column_name=>'VENUE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Venue'
,p_column_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_VENUE_ID:#VENUE_ID#'
,p_column_linktext=>'#VENUE#'
,p_column_type=>'STRING'
,p_static_id=>'VENUE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27569971658966149)
,p_db_column_name=>'REPEAT_TYPE'
,p_display_order=>22
,p_column_identifier=>'M'
,p_column_label=>'Repeat type'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27570015912966150)
,p_db_column_name=>'REPEAT_INTERVAL'
,p_display_order=>32
,p_column_identifier=>'N'
,p_column_label=>'Repeat interval'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(47846755086605901)
,p_db_column_name=>'REPEAT_UNTIL'
,p_display_order=>42
,p_column_identifier=>'O'
,p_column_label=>'Repeat until'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(47846851797605902)
,p_db_column_name=>'START_DT'
,p_display_order=>52
,p_column_identifier=>'P'
,p_column_label=>'Start'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(47846990268605903)
,p_db_column_name=>'END_DT'
,p_display_order=>62
,p_column_identifier=>'Q'
,p_column_label=>'End'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(47847555320605909)
,p_db_column_name=>'HOST_ID'
,p_display_order=>82
,p_column_identifier=>'S'
,p_column_label=>'Host id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(47848631839605920)
,p_db_column_name=>'VENUE_ID'
,p_display_order=>92
,p_column_identifier=>'T'
,p_column_label=>'Venue id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17494539933379220)
,p_db_column_name=>'EVENT_TYPE_CODE'
,p_display_order=>102
,p_column_identifier=>'U'
,p_column_label=>'Event Type Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(59343078108102975)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'216358'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'TITLE:DESCRIPTION:HOST_NAME:VENUE:REPEAT_TYPE:START_DT:END_DT:LAST_UPDATED_DATE:LAST_UPDATED_BY::VENUE_ID:EVENT_TYPE_CODE'
,p_sort_column_1=>'START_DATE'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59327377527024031)
,p_plug_name=>'Breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37756253337902470)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(59325576592024018)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(37791908169902498)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94022337623071949)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(59325989235024022)
,p_button_name=>'DELETED'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_image_alt=>'Show Deleted'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP,14:P14_JN_ACTION:D'
,p_icon_css_classes=>'fa-history'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(59330483872024076)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(59325989235024022)
,p_button_name=>'ADD'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9::'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(66963773996266994)
,p_branch_name=>'setup'
,p_branch_action=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NOT_EXISTS'
,p_branch_condition=>'SELECT 1 FROM event_types'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(64752374708880936)
,p_name=>'P1_PAST_IND'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(59325989235024022)
,p_prompt=>'Show Past Events?'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:Show Past Events;Y'
,p_field_template=>wwv_flow_api.id(37790585158902496)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(64752979947885725)
,p_name=>'refresh report'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_PAST_IND'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(64753293572885727)
,p_event_id=>wwv_flow_api.id(64752979947885725)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(59325989235024022)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47849371919605927)
,p_name=>'refresh'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(59325989235024022)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47849460414605928)
,p_event_id=>wwv_flow_api.id(47849371919605927)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(59325989235024022)
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(59324280286023993)
,p_name=>'Event'
,p_page_mode=>'MODAL'
,p_step_title=>'Event'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(62246971721848558)
,p_dialog_height=>'800'
,p_dialog_width=>'800'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JEFF'
,p_last_upd_yyyymmddhh24miss=>'20190316200710'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59327684105024069)
,p_plug_name=>'Event Details'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--leftLabels'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37749289366902466)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'PLSQL_EXPRESSION'
,p_plug_read_only_when=>'NOT APEX_AUTHORIZATION.is_authorized(''Operator'') or :P2_DELETED_Y=''Y'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27568804885966138)
,p_plug_name=>'Repeat'
,p_parent_plug_id=>wwv_flow_api.id(59327684105024069)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(37749289366902466)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59330675185024078)
,p_plug_name=>'Breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37756253337902470)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(59325576592024018)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(37791908169902498)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_api.id(46911366233766112)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59333591305059503)
,p_plug_name=>'Record'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37749289366902466)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2_VERSION_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94021934662071945)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(59333591305059503)
,p_button_name=>'EDIT_LOG'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_image_alt=>'Edit Log'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP,14:P14_EVENT_ID:&P2_EVENT_ID.'
,p_icon_css_classes=>'fa-history'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(59327868528024069)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(59327684105024069)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_image_alt=>'Delete'
,p_button_position=>'TOP'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>':P2_VERSION_ID is not null and :P2_DELETED_Y is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-trash'
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17495003399379225)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(59327684105024069)
,p_button_name=>'UNDELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_image_alt=>'Undelete'
,p_button_position=>'TOP'
,p_button_execute_validations=>'N'
,p_button_condition=>':P2_VERSION_ID is not null and :P2_DELETED_Y=''Y'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-recycle'
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(59377185314275413)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(59327684105024069)
,p_button_name=>'SAVE_COPY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_image_alt=>'Copy'
,p_button_position=>'TOP'
,p_button_condition=>'P2_VERSION_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-copy'
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(59327966400024069)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(59327684105024069)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_condition=>':P2_VERSION_ID is not null and :P2_DELETED_Y is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(59328062558024069)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(59327684105024069)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'TOP'
,p_button_condition=>'P2_VERSION_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(59377973412280451)
,p_branch_action=>'f?p=&APP_ID.:9:&SESSION.:COPY:&DEBUG.:9:P9_COPY_EVENT_ID:&P2_EVENT_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(59377185314275413)
,p_branch_sequence=>11
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P2_VERSION_ID'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17494951188379224)
,p_name=>'P2_DELETED_Y'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(59333591305059503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27568988986966139)
,p_name=>'P2_REPEAT_IND'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(59327684105024069)
,p_prompt=>'Repeat ind'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Repeat...;Y'
,p_field_template=>wwv_flow_api.id(37790585158902496)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27569005587966140)
,p_name=>'P2_REPEAT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(27568804885966138)
,p_prompt=>'Repeat'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'REPEAT_TYPE'
,p_lov=>'.'||wwv_flow_api.id(47772161036509997)||'.'
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'4'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27569116965966141)
,p_name=>'P2_REPEAT_INTERVAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(27568804885966138)
,p_prompt=>'Interval'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_02=>'999'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27569275764966142)
,p_name=>'P2_REPEAT_UNTIL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(27568804885966138)
,p_prompt=>'Repeat until'
,p_format_mask=>'DD-MON-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36728135133648444)
,p_name=>'P2_END_DT_TIME'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(59327684105024069)
,p_prompt=>'Time'
,p_format_mask=>'HH:MIPM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>7
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47847883802605912)
,p_name=>'P2_VENUE_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(59327684105024069)
,p_prompt=>'New Venue'
,p_placeholder=>'Where is the event held?'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when=>'P2_VERSION_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56199317179200287)
,p_name=>'P2_START_DT_TIME'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(59327684105024069)
,p_prompt=>'Time'
,p_format_mask=>'HH:MIPM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>7
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56223770480244009)
,p_name=>'P2_EVENT_IDENT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(59327684105024069)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59328390666024073)
,p_name=>'P2_EVENT_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(59327684105024069)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59328467895024073)
,p_name=>'P2_TITLE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(59327684105024069)
,p_prompt=>'Title'
,p_placeholder=>'Event title'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59328662231024074)
,p_name=>'P2_DESCRIPTION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(59327684105024069)
,p_prompt=>'Description'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cSize=>50
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CKEDITOR3'
,p_attribute_02=>'Intermediate'
,p_attribute_03=>'N'
,p_attribute_04=>'moonocolor'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59328870482024074)
,p_name=>'P2_START_DT'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(59327684105024069)
,p_prompt=>'Start'
,p_format_mask=>'DD-MON-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>30
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-1:+1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59329063067024074)
,p_name=>'P2_END_DT'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(59327684105024069)
,p_prompt=>'End'
,p_format_mask=>'DD-MON-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>30
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-1:+1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59329286809024074)
,p_name=>'P2_CREATED_BY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(59333591305059503)
,p_prompt=>'By'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59329478932024075)
,p_name=>'P2_CREATED_DT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(59333591305059503)
,p_prompt=>'Created'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59329666137024075)
,p_name=>'P2_LAST_UPDATED_BY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(59333591305059503)
,p_prompt=>'By'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59329893735024075)
,p_name=>'P2_LAST_UPDATED_DT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(59333591305059503)
,p_prompt=>'Last Updated'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59330072898024075)
,p_name=>'P2_VERSION_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(59333591305059503)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'No help available for this page item.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(64130678017788182)
,p_name=>'P2_EVENT_TYPE_CODE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(59327684105024069)
,p_prompt=>'Event Type Code'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT description AS display_value',
'      ,event_type_code AS return_value ',
'FROM   event_types_vw',
'WHERE  event_type_code = :P2_EVENT_TYPE_CODE OR deleted_y is null',
'ORDER BY 1'))
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'5'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66965173250388939)
,p_name=>'P2_HOST_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(59327684105024069)
,p_prompt=>'Host'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NAME as display_value, HOST_ID as return_value ',
'  from HOSTS',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'SELECT 1 FROM HOSTS'
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66966279442462094)
,p_name=>'P2_HOST_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(59327684105024069)
,p_prompt=>'New Host'
,p_placeholder=>'Who is hosting the event?'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when=>'P2_VERSION_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66969365363544549)
,p_name=>'P2_VENUE_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(59327684105024069)
,p_prompt=>'Venue'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'VENUES'
,p_lov=>'SELECT name, venue_id FROM venues ORDER BY 1'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(59376867170268190)
,p_validation_name=>'val'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return events$tapi.val (rv => events$tapi.rvtype',
'  (event_id        => :P2_EVENT_ID',
'  ,host_id         => :P2_HOST_ID',
'  ,event_type_code => :P2_EVENT_TYPE_CODE',
'  ,title           => :P2_TITLE',
'  ,description     => :P2_DESCRIPTION',
'  ,venue_id        => :P2_VENUE_ID',
'  ,start_dt        => :P2_START_DT',
'  ,end_dt          => :P2_END_DT',
'  ,repeat          => :P2_REPEAT',
'  ,repeat_interval => :P2_REPEAT_INTERVAL',
'  ,repeat_until    => :P2_REPEAT_UNTIL',
'  ,deleted_y       => :P2_DELETED_Y',
'  ,version_id      => :P2_VERSION_ID));'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition_type=>'NOT_DISPLAYING_INLINE_VALIDATION_ERRORS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(66985685118033881)
,p_name=>'hide host name'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_HOST_ID'
,p_condition_element=>'P2_HOST_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(66985993276033883)
,p_event_id=>wwv_flow_api.id(66985685118033881)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_HOST_NAME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(66986171079033883)
,p_event_id=>wwv_flow_api.id(66985685118033881)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_HOST_NAME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27569393762966143)
,p_name=>'show/hide repeat fields'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_REPEAT_IND'
,p_condition_element=>'P2_REPEAT_IND'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27569497573966144)
,p_event_id=>wwv_flow_api.id(27569393762966143)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(27568804885966138)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27569528062966145)
,p_event_id=>wwv_flow_api.id(27569393762966143)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(27568804885966138)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56223105388244003)
,p_name=>'no end time if null'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_END_DT'
,p_condition_element=>'P2_END_DT'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56223315307244005)
,p_event_id=>wwv_flow_api.id(56223105388244003)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_END_DT_TIME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56223423137244006)
,p_event_id=>wwv_flow_api.id(56223105388244003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_END_DT_TIME'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56223206530244004)
,p_event_id=>wwv_flow_api.id(56223105388244003)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_END_DT_TIME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100820922281691404)
,p_name=>'hide venue name'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_VENUE_ID'
,p_condition_element=>'P2_VENUE_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100821013815691405)
,p_event_id=>wwv_flow_api.id(100820922281691404)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_VENUE_NAME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100821194061691406)
,p_event_id=>wwv_flow_api.id(100820922281691404)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_VENUE_NAME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59376573755262610)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  r events$tapi.rowtype;',
'begin',
'  r := events$tapi.get(event_id => :P2_EVENT_ID);',
'  :P2_EVENT_ID        := r.event_id;',
'  :P2_HOST_ID         := r.host_id;',
'  :P2_EVENT_TYPE_CODE := r.event_type_code;',
'  :P2_TITLE           := r.title;',
'  :P2_DESCRIPTION     := r.description;',
'  :P2_VENUE_ID        := r.venue_id;',
'  :P2_START_DT        := r.start_dt;',
'  :P2_END_DT          := r.end_dt;',
'  :P2_REPEAT          := r.repeat;',
'  :P2_REPEAT_INTERVAL := r.repeat_interval;',
'  :P2_REPEAT_UNTIL    := r.repeat_until;',
'  :P2_DELETED_Y       := r.deleted_y;',
'  :P2_CREATED_BY      := r.created_by;',
'  :P2_CREATED_DT      := r.created_dt;',
'  :P2_LAST_UPDATED_BY := r.last_updated_by;',
'  :P2_LAST_UPDATED_DT := r.last_updated_dt;',
'  :P2_VERSION_ID      := r.version_id;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59376969038270724)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'process'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  rv events$tapi.rvtype;',
'  r  events$tapi.rowtype;',
'begin',
'',
'  rv := events$tapi.rvtype',
'    (event_id        => :P2_EVENT_ID',
'    ,host_id         => :P2_HOST_ID',
'    ,event_type_code => :P2_EVENT_TYPE_CODE',
'    ,title           => :P2_TITLE',
'    ,description     => :P2_DESCRIPTION',
'    ,venue_id        => :P2_VENUE_ID',
'    ,start_dt        => :P2_START_DT',
'    ,end_dt          => :P2_END_DT',
'    ,repeat          => :P2_REPEAT',
'    ,repeat_interval => :P2_REPEAT_INTERVAL',
'    ,repeat_until    => :P2_REPEAT_UNTIL',
'    ,deleted_y       => :P2_DELETED_Y',
'    ,version_id      => :P2_VERSION_ID);',
'',
'  case',
'  when :REQUEST = ''CREATE'' then',
'    r := events$tapi.ins (rv => rv);',
'    util.success(''Event created.'');',
'  when :REQUEST like ''SAVE%'' then',
'    r := events$tapi.upd (rv => rv);',
'    util.success(''Event updated.''',
'      || case when :REQUEST = ''SAVE_COPY'' then '' Ready to create new event.'' end);',
'  when :REQUEST = ''DELETE'' then',
'    events$tapi.del (rv => rv);',
'    util.clear_page_cache;',
'    util.success(''Event deleted.'');',
'  when :REQUEST = ''UNDELETE'' then',
'    r := events$tapi.undel (rv => rv);',
'    util.success(''Event undeleted.'');',
'  else',
'    null;',
'  end case;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27568224792966132)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'close dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE_COPY'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(59324280286023993)
,p_name=>'Event Types'
,p_step_title=>'Event Types'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(62246532293840626)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JEFF'
,p_last_upd_yyyymmddhh24miss=>'20190413192609'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18326564292943724)
,p_plug_name=>'Event Types'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37749289366902466)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select et.*',
'      ,rowid',
'      ,case when et.deleted_y is null then ''UD'' end as allowed_ops',
'from   event_types et',
'where  nvl(et.deleted_y,''N'') = nvl(:P3_DELETED_Y,''N'')'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P3_DELETED_Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18326779966943726)
,p_name=>'EVENT_TYPE_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_TYPE_CODE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unique Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>400
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18326837763943727)
,p_name=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>800
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18326932070943728)
,p_name=>'CALENDAR_CSS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CALENDAR_CSS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Calendar CSS'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(47865337930471093)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18327035796943729)
,p_name=>'DELETED_Y'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DELETED_Y'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18327138386943730)
,p_name=>'DB$CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DB$CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18327297019943731)
,p_name=>'DB$CREATED_DT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DB$CREATED_DT'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Created'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18327358642943732)
,p_name=>'DB$LAST_UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DB$LAST_UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Last Updated By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18327453807943733)
,p_name=>'DB$LAST_UPDATED_DT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DB$LAST_UPDATED_DT'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Last Updated'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18327549973943734)
,p_name=>'DB$VERSION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DB$VERSION_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18327609609943735)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18327743849943736)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18327928656943738)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18328549650943744)
,p_name=>'ALLOWED_OPS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ALLOWED_OPS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(18326647525943725)
,p_internal_uid=>18326647525943725
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_edit_row_operations_column=>'ALLOWED_OPS'
,p_lost_update_check_type=>'COLUMN'
,p_row_version_column=>'DB$VERSION_ID'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(21467988183079075)
,p_interactive_grid_id=>wwv_flow_api.id(18326647525943725)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(21468090325079076)
,p_report_id=>wwv_flow_api.id(21467988183079075)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21468543391079081)
,p_view_id=>wwv_flow_api.id(21468090325079076)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(18326779966943726)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21468975808079085)
,p_view_id=>wwv_flow_api.id(21468090325079076)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(18326837763943727)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21469459615079088)
,p_view_id=>wwv_flow_api.id(21468090325079076)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(18326932070943728)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21469952219079089)
,p_view_id=>wwv_flow_api.id(21468090325079076)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(18327035796943729)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21470430526079091)
,p_view_id=>wwv_flow_api.id(21468090325079076)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(18327138386943730)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21470903442079092)
,p_view_id=>wwv_flow_api.id(21468090325079076)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(18327297019943731)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21471477898079094)
,p_view_id=>wwv_flow_api.id(21468090325079076)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(18327358642943732)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21471963409079095)
,p_view_id=>wwv_flow_api.id(21468090325079076)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(18327453807943733)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21472455337079096)
,p_view_id=>wwv_flow_api.id(21468090325079076)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(18327549973943734)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21472997465079098)
,p_view_id=>wwv_flow_api.id(21468090325079076)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(18327609609943735)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21473854199079101)
,p_view_id=>wwv_flow_api.id(21468090325079076)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(18327928656943738)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21487764528240007)
,p_view_id=>wwv_flow_api.id(21468090325079076)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(18328549650943744)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(64759592686907623)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37756253337902470)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(59325576592024018)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(37791908169902498)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22186173580515463)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18326564292943724)
,p_button_name=>'UNDELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_image_alt=>'Undelete selected'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_icon_css_classes=>'fa-recycle'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18328200151943741)
,p_name=>'P3_DELETED_Y'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(18326564292943724)
,p_prompt=>'Deleted'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Deleted;Y'
,p_field_template=>wwv_flow_api.id(37790585158902496)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22164461719368407)
,p_name=>'P3_SELECTED'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(18326564292943724)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18328017924943739)
,p_name=>'suggest code'
,p_event_sequence=>10
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(18326564292943724)
,p_triggering_element=>'NAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18328134230943740)
,p_event_id=>wwv_flow_api.id(18328017924943739)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'EVENT_TYPE_CODE'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'upper(translate(trim(:NAME),''A :/'',''A__''))'
,p_attribute_07=>'NAME'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18328333855943742)
,p_name=>'refresh report'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_DELETED_Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18328469517943743)
,p_event_id=>wwv_flow_api.id(18328333855943742)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(18326564292943724)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22186307831516998)
,p_name=>'get selected ids'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(18326564292943724)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22186790421517001)
,p_event_id=>wwv_flow_api.id(22186307831516998)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var i, selectedIds = ":", model = this.data.model;',
'for ( i = 0; i < this.data.selectedRecords.length; i++ ) {  ',
'  selectedIds += model.getValue( this.data.selectedRecords[i], "ROWID") + ":";  ',
'}',
'apex.debug(''selected=''+selectedIds);',
'$s("P3_SELECTED", selectedIds); '))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22164533526368408)
,p_name=>'show/hide undelete button'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_DELETED_Y'
,p_condition_element=>'P3_DELETED_Y'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22164655629368409)
,p_event_id=>wwv_flow_api.id(22164533526368408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(22186173580515463)
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22164716536368410)
,p_event_id=>wwv_flow_api.id(22164533526368408)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(22186173580515463)
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18327886524943737)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(18326564292943724)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Event Types - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  rv event_types$tapi.t_rv;',
'  r event_types$tapi.t_row;',
'begin',
'  rv := event_types$tapi.t_rv',
'    (rowid           => :ROWID',
'    ,event_type_code => :EVENT_TYPE_CODE',
'    ,name            => :NAME',
'    ,calendar_css    => :CALENDAR_CSS',
'    ,deleted_y       => :DELETED_Y',
'    ,db$version_id   => :DB$VERSION_ID);    ',
'  case :APEX$ROW_STATUS',
'  when ''I'' then',
'    r := event_types$tapi.ins (rv => rv);    ',
'    -- Interactive Grid needs the new PK in order to find the new record',
'    :ROWID := r.rowid;',
'  when ''U'' then',
'    r := event_types$tapi.upd (rv => rv);',
'  when ''D'' then',
'    event_types$tapi.del (rv => rv);',
'  end case;',
'end;'))
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22187114654518371)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'bulk_undel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  ids apex_t_varchar2;',
'  arr event_types$tapi.t_rvarray;',
'begin',
'  ids := apex_string.split(trim('':'' from :P3_SELECTED),'':'');',
'  for i in 1..ids.count loop',
'    arr(nvl(arr.last,0)+1) := event_types$tapi.t_rv(rowid => ids(i)); ',
'  end loop;',
'  event_types$tapi.bulk_undel(arr => arr);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22186173580515463)
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(59324280286023993)
,p_name=>'Hosts'
,p_step_title=>'Hosts'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(62246739341844416)
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JEFF'
,p_last_upd_yyyymmddhh24miss=>'20190413191927'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21851655427600537)
,p_plug_name=>'Hosts'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37749289366902466)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select h.host_id',
'      ,h.name',
'      ,h.db$last_updated_dt',
'      ,h.db$last_updated_by',
'      ,h.db$version_id',
'      ,case when h.deleted_y is null then ''UD'' end as allowed_op',
'      ,(select count(*) from events e where e.host_id = h.host_id) AS count_events',
'from hosts h',
'where nvl(h.deleted_y,''N'') = nvl(:P5_DELETED_Y,''N'')'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P5_DELETED_Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21851841992600539)
,p_name=>'HOST_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HOST_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21851967989600540)
,p_name=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>400
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21852065697600541)
,p_name=>'DB$LAST_UPDATED_DT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DB$LAST_UPDATED_DT'
,p_data_type=>'DATE'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Last Updated'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21852107330600542)
,p_name=>'DB$LAST_UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DB$LAST_UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Last Updated By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21852268988600543)
,p_name=>'DB$VERSION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DB$VERSION_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21852341426600544)
,p_name=>'ALLOWED_OP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ALLOWED_OP'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21852469267600545)
,p_name=>'COUNT_EVENTS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COUNT_EVENTS'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Events'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21852948945600550)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22163898852368401)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(21851793250600538)
,p_internal_uid=>21851793250600538
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_edit_row_operations_column=>'ALLOWED_OP'
,p_lost_update_check_type=>'COLUMN'
,p_row_version_column=>'DB$VERSION_ID'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>true
,p_public_report_auth_scheme=>wwv_flow_api.id(62246532293840626)
,p_enable_subscriptions=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(22160131311362113)
,p_interactive_grid_id=>wwv_flow_api.id(21851793250600538)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(22160263396362114)
,p_report_id=>wwv_flow_api.id(22160131311362113)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22160798852362119)
,p_view_id=>wwv_flow_api.id(22160263396362114)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(21851841992600539)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22161284472362124)
,p_view_id=>wwv_flow_api.id(22160263396362114)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(21851967989600540)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22161778731362126)
,p_view_id=>wwv_flow_api.id(22160263396362114)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(21852065697600541)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22162243759362128)
,p_view_id=>wwv_flow_api.id(22160263396362114)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(21852107330600542)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22162774741362129)
,p_view_id=>wwv_flow_api.id(22160263396362114)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(21852268988600543)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22163237323362131)
,p_view_id=>wwv_flow_api.id(22160263396362114)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(21852341426600544)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22163795403362133)
,p_view_id=>wwv_flow_api.id(22160263396362114)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(21852469267600545)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22170505781381924)
,p_view_id=>wwv_flow_api.id(22160263396362114)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(21852948945600550)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66955171620165629)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37756253337902470)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(59325576592024018)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(37791908169902498)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22179071305466561)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(21851655427600537)
,p_button_name=>'UNDELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_image_alt=>'Undelete selected'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_icon_css_classes=>'fa-recycle'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21852505359600546)
,p_name=>'P5_DELETED_Y'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21851655427600537)
,p_prompt=>'Deleted Y'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Deleted;Y'
,p_field_template=>wwv_flow_api.id(37790585158902496)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22179394242468272)
,p_name=>'P5_SELECTED'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(21851655427600537)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22164074476368403)
,p_tabular_form_region_id=>wwv_flow_api.id(21851655427600537)
,p_validation_name=>'val'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return hosts$tapi.val (rv => hosts$tapi.t_rv',
'  (host_id       => :HOST_ID',
'  ,name          => :NAME',
'  ,db$version_id => :DB$VERSION_ID));'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21852640966600547)
,p_name=>'refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_DELETED_Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21852755121600548)
,p_event_id=>wwv_flow_api.id(21852640966600547)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(21851655427600537)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22164136748368404)
,p_name=>'show/hide undelete button'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_DELETED_Y'
,p_condition_element=>'P5_DELETED_Y'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22164296825368405)
,p_event_id=>wwv_flow_api.id(22164136748368404)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(22179071305466561)
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22164315247368406)
,p_event_id=>wwv_flow_api.id(22164136748368404)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(22179071305466561)
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22182365943487730)
,p_name=>'get selected ids'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(21851655427600537)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22182729136487733)
,p_event_id=>wwv_flow_api.id(22182365943487730)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var i, selectedIds = ":", model = this.data.model;',
'for ( i = 0; i < this.data.selectedRecords.length; i++ ) {  ',
'  selectedIds += model.getValue( this.data.selectedRecords[i], "HOST_ID") + ":";  ',
'}',
'apex.debug(''selected=''+selectedIds);',
'$s("P5_SELECTED", selectedIds); '))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22163931689368402)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(21851655427600537)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Hosts - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  rv hosts$tapi.t_rv;',
'  r  hosts$tapi.t_row;',
'begin',
'  rv := hosts$tapi.t_rv',
'    (host_id       => :HOST_ID',
'    ,name          => :NAME',
'    ,db$version_id => :DB$VERSION_ID);    ',
'  case :APEX$ROW_STATUS',
'  when ''C'' then',
'    r := hosts$tapi.ins (rv => rv);    ',
'    -- Interactive Grid needs the new PK in order to find the new record',
'    :HOST_ID := r.host_id;',
'  when ''U'' then',
'    r := hosts$tapi.upd (rv => rv);',
'  when ''D'' then',
'    hosts$tapi.del (rv => rv);',
'  end case;',
'end;'))
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22179528175470412)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'bulk_undel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  ids apex_t_varchar2;',
'  arr hosts$tapi.t_rvarray;',
'begin',
'  ids := apex_string.split(trim('':'' from :P5_SELECTED),'':'');',
'  for i in 1..ids.count loop',
'    arr(nvl(arr.last,0)+1) := hosts$tapi.t_rv(host_id => ids(i)); ',
'  end loop;',
'  hosts$tapi.bulk_undel(arr => arr);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22179071305466561)
);
end;
/
prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(59324280286023993)
,p_name=>'Events Calendar'
,p_step_title=>'Events Calendar'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function refreshCalendar() {',
'  $("#refreshbutton span.t-Icon").addClass("fa-spin");',
'  window.setTimeout(function() {',
'    $("#eventscalendar_calendar").fullCalendar("refetchEvents");',
'    window.setTimeout(function() {',
'      $("#refreshbutton span.t-Icon").removeClass("fa-spin");',
'    }, 1000);',
'  }, 50);',
'}'))
,p_javascript_code_onload=>'var periodicrefresh = setInterval(function(){refreshCalendar();}, 30000);'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JEFF'
,p_last_upd_yyyymmddhh24miss=>'20190328215552'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18326105516943720)
,p_plug_name=>'No access'
,p_icon_css_classes=>'fa-lock'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_template=>wwv_flow_api.id(37729097191902448)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>'!'||wwv_flow_api.id(21221328438192087)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27568143030966131)
,p_plug_name=>'Events Calendar'
,p_region_name=>'eventscalendar'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(37749289366902466)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT event_id || ''/'' || repeat_no AS event_ident',
'      ,title',
'      ,''Event Type: '' || event_type_name || CHR(10)',
'       || CASE WHEN host_name IS NOT NULL THEN ''Hosted by: '' || host_name || CHR(10) END',
'       || CASE WHEN venue IS NOT NULL THEN ''Venue: '' || venue || CHR(10) END',
'       AS description',
'      ,calendar_css AS css_class',
'      ,this_start_dt AS start_date',
'      ,this_end_dt AS end_date',
'FROM   events_vw'))
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(62246971721848558)
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'body .fc .ui-widget-content.fc-past { background-color:#DDD; }',
'body .fc .ui-widget-content.fc-today { background-color:#D7FFD7; }',
'</style>'))
,p_attribute_01=>'START_DATE'
,p_attribute_02=>'END_DATE'
,p_attribute_03=>'TITLE'
,p_attribute_04=>'EVENT_IDENT'
,p_attribute_05=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2:P2_EVENT_IDENT:&EVENT_IDENT.'
,p_attribute_06=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9:P9_NEW_START_DT,P9_NEW_END_DT:&APEX$NEW_START_DATE.,&APEX$NEW_END_DATE.'
,p_attribute_07=>'Y'
,p_attribute_08=>wwv_flow_string.join(wwv_flow_t_varchar2(
'EVENTS$APEX.drag_drop',
'  (event_id  => TO_NUMBER(SUBSTR(:APEX$PK_VALUE, 1, INSTR(:APEX$PK_VALUE,''/'')-1))',
'  ,repeat_no => TO_NUMBER(SUBSTR(:APEX$PK_VALUE, INSTR(:APEX$PK_VALUE,''/'')+1))',
'  ,start_dt  => TO_DATE(:APEX$NEW_START_DATE, ''YYYYMMDDHH24MISS'')',
'  ,end_dt    => TO_DATE(:APEX$NEW_END_DATE, ''YYYYMMDDHH24MISS'')',
'  );'))
,p_attribute_10=>'CSV:ICAL'
,p_attribute_11=>'month:week:day:list:navigation'
,p_attribute_13=>'Y'
,p_attribute_14=>'CSS_CLASS'
,p_attribute_16=>'&DESCRIPTION!RAW.'
,p_attribute_17=>'Y'
,p_attribute_18=>'00'
,p_attribute_19=>'Y'
,p_attribute_20=>'8'
,p_attribute_21=>'99'
,p_attribute_22=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46907600407725887)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37756253337902470)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(59325576592024018)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(37791908169902498)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_api.id(46911366233766112)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(36728506127648448)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(27568143030966131)
,p_button_name=>'REFRESH'
,p_button_static_id=>'refreshbutton'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(37791089566902497)
,p_button_image_alt=>'Refresh'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(36728630250648449)
,p_name=>'refresh calendar'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(36728506127648448)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36728769641648450)
,p_event_id=>wwv_flow_api.id(36728630250648449)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'refreshCalendar();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56251390228669801)
,p_name=>'refresh on change'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#eventscalendar_calendar'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'eventDrop'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56251433486669802)
,p_event_id=>wwv_flow_api.id(56251390228669801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#eventscalendar_calendar").fullCalendar("refetchEvents");'
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(59324280286023993)
,p_name=>'New Event'
,p_page_mode=>'MODAL'
,p_step_title=>'New Event'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'New Event'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(62246739341844416)
,p_dialog_height=>'750'
,p_dialog_width=>'800'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JEFF'
,p_last_upd_yyyymmddhh24miss=>'20190316201327'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47391499801294407)
,p_plug_name=>'Event Details'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:t-Form--large:t-Form--leftLabels'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37749289366902466)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47840711268571371)
,p_plug_name=>'Repeat'
,p_parent_plug_id=>wwv_flow_api.id(47391499801294407)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(37749289366902466)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47392624624294411)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(47391499801294407)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36728068040648443)
,p_name=>'P9_START_DT_TIME'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_prompt=>'Time'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>7
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36728254770648445)
,p_name=>'P9_END_DT_TIME'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_prompt=>'Time'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>7
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36728391194648446)
,p_name=>'P9_NEW_START_DT'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_format_mask=>'YYYYMMDDHHMIPM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36728480943648447)
,p_name=>'P9_NEW_END_DT'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_format_mask=>'YYYYMMDDHHMIPM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47393890837294418)
,p_name=>'P9_HOST_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_prompt=>'Select Host'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NAME as display_value, HOST_ID as return_value ',
'  from HOSTS',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'SELECT 1 FROM HOSTS'
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47394263669294419)
,p_name=>'P9_HOST_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_prompt=>'OR - Create new host'
,p_placeholder=>'Who is hosting the event?'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47394638798294419)
,p_name=>'P9_EVENT_TYPE_CODE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_prompt=>'Event Type'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT description AS display_value',
'      ,event_type_code AS return_value ',
'FROM   event_types_vw',
'WHERE  event_type_code = :P9_EVENT_TYPE OR deleted_y is null',
'ORDER BY 1'))
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'5'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47395083620294420)
,p_name=>'P9_TITLE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_prompt=>'Title'
,p_placeholder=>'Event title'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47395477510294421)
,p_name=>'P9_DESCRIPTION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_prompt=>'Description'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cSize=>50
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'CKEDITOR3'
,p_attribute_02=>'Intermediate'
,p_attribute_03=>'N'
,p_attribute_04=>'moonocolor'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47395873095294421)
,p_name=>'P9_VENUE_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_prompt=>'Venue'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'VENUES'
,p_lov=>'SELECT name, venue_id FROM venues ORDER BY 1'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'SELECT 1 FROM VENUES'
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47396293325294421)
,p_name=>'P9_START_DT'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_prompt=>'Start'
,p_format_mask=>'DD-MON-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>30
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-1:+1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47396627060294421)
,p_name=>'P9_END_DT'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_prompt=>'End'
,p_format_mask=>'DD-MON-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>30
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-1:+1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47840521497570121)
,p_name=>'P9_REPEAT_IND'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_prompt=>'Repeat'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Repeat...;Y'
,p_field_template=>wwv_flow_api.id(37790585158902496)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47841032144571373)
,p_name=>'P9_REPEAT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(47840711268571371)
,p_prompt=>'Repeat'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'REPEAT_TYPE'
,p_lov=>'.'||wwv_flow_api.id(47772161036509997)||'.'
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'4'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47841408266571375)
,p_name=>'P9_REPEAT_INTERVAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(47840711268571371)
,p_prompt=>'Interval'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_02=>'999'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47841852692571375)
,p_name=>'P9_REPEAT_UNTIL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(47840711268571371)
,p_prompt=>'Repeat until'
,p_format_mask=>'DD-MON-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47847967809605913)
,p_name=>'P9_VENUE_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_prompt=>'OR - Create new venue'
,p_placeholder=>'Where is the event held?'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60144723665730030)
,p_name=>'P9_COPY_EVENT_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(47391499801294407)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(20488026540878197)
,p_validation_name=>'val'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return events$tapi.val (rv => events$tapi.rvtype',
'  (event_id        => :P9_EVENT_ID',
'  ,host_id         => :P9_HOST_ID',
'  ,event_type_code => :P9_EVENT_TYPE_CODE',
'  ,title           => :P9_TITLE',
'  ,description     => :P9_DESCRIPTION',
'  ,venue_id        => :P9_VENUE_ID',
'  ,start_dt        => :P9_START_DT',
'  ,end_dt          => :P9_END_DT',
'  ,repeat          => :P9_REPEAT',
'  ,repeat_interval => :P9_REPEAT_INTERVAL',
'  ,repeat_until    => :P9_REPEAT_UNTIL',
'  ,deleted_y       => :P9_DELETED_Y',
'  ,version_id      => :P9_VERSION_ID));'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition_type=>'NOT_DISPLAYING_INLINE_VALIDATION_ERRORS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47403050310294441)
,p_name=>'hide host name'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_HOST_ID'
,p_condition_element=>'P9_HOST_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47403563223294442)
,p_event_id=>wwv_flow_api.id(47403050310294441)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_HOST_NAME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47404093474294443)
,p_event_id=>wwv_flow_api.id(47403050310294441)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_HOST_NAME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27569656136966146)
,p_name=>'show/hide repeat fields'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_REPEAT_IND'
,p_condition_element=>'P9_REPEAT_IND'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27569737068966147)
,p_event_id=>wwv_flow_api.id(27569656136966146)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(47840711268571371)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27569890975966148)
,p_event_id=>wwv_flow_api.id(27569656136966146)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(47840711268571371)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100821291245691407)
,p_name=>'hide venue name'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_VENUE_ID'
,p_condition_element=>'P9_VENUE_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100821323897691408)
,p_event_id=>wwv_flow_api.id(100821291245691407)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_VENUE_NAME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100821490738691409)
,p_event_id=>wwv_flow_api.id(100821291245691407)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_VENUE_NAME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(47401890449294439)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  r events$tapi.rowtype;',
'begin',
'  r := events$tapi.get(event_id => :P9_COPY_EVENT_ID);',
'  :P9_HOST_ID         := r.host_id;',
'  :P9_EVENT_TYPE_CODE := r.event_type_code;',
'  :P9_TITLE           := r.title || case when r.event_id is not null then '' (copy)'' end;',
'  :P9_DESCRIPTION     := r.description;',
'  :P9_VENUE_ID        := r.venue_id;',
'  :P9_START_DT        := r.start_dt;',
'  :P9_END_DT          := r.end_dt;',
'  :P9_REPEAT          := r.repeat;',
'  :P9_REPEAT_INTERVAL := r.repeat_interval;',
'  :P9_REPEAT_UNTIL    := r.repeat_until;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(20488375039878847)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  r events$tapi.rowtype;',
'begin',
'  r := events$tapi.ins (rv => events$tapi.rvtype',
'    (host_id         => :P9_HOST_ID',
'    ,event_type_code => :P9_EVENT_TYPE_CODE',
'    ,title           => :P9_TITLE',
'    ,description     => :P9_DESCRIPTION',
'    ,venue_id        => :P9_VENUE_ID',
'    ,start_dt        => :P9_START_DT',
'    ,end_dt          => :P9_END_DT',
'    ,repeat          => :P9_REPEAT',
'    ,repeat_interval => :P9_REPEAT_INTERVAL',
'    ,repeat_until    => :P9_REPEAT_UNTIL));',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(47392624624294411)
,p_process_success_message=>'Event created.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(47402676119294440)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'close dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE_COPY'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(59324280286023993)
,p_name=>'Venues'
,p_step_title=>'Venues'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(62246739341844416)
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JEFF'
,p_last_upd_yyyymmddhh24miss=>'20190408201118'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61169066039993873)
,p_plug_name=>'Venues'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>wwv_flow_api.id(37748115288902466)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vn.venue_id',
'      ,vn.name',
'      ,vn.map_position',
'      ,vn.db$created_by as created_by',
'      ,vn.db$created_dt as created_dt',
'      ,vn.db$last_updated_by as last_updated_by',
'      ,vn.db$last_updated_dt as last_updated_dt',
'      ,(select count(*) from events e where e.venue_id = vn.venue_id) AS count_events',
'from venues vn',
'where nvl(vn.deleted_y,''N'')=nvl(:P11_DELETED_Y,''N'')',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P11_DELETED_Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(61169408591993874)
,p_name=>'Venues'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12:P12_VENUE_ID:#VENUE_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#e2.gif"  border="0">'
,p_owner=>'JEFF'
,p_internal_uid=>61169408591993874
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61169557760993881)
,p_db_column_name=>'VENUE_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Venue Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61169913654993884)
,p_db_column_name=>'NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Venue'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61170340365993885)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61170783833993885)
,p_db_column_name=>'CREATED_DT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61171147776993886)
,p_db_column_name=>'LAST_UPDATED_BY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Last Updated By'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61171531640993886)
,p_db_column_name=>'LAST_UPDATED_DT'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Last Updated'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(47848731934605921)
,p_db_column_name=>'COUNT_EVENTS'
,p_display_order=>16
,p_column_identifier=>'G'
,p_column_label=>'Events'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100820746551691402)
,p_db_column_name=>'MAP_POSITION'
,p_display_order=>26
,p_column_identifier=>'H'
,p_column_label=>'Map position'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(61184053609028293)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'611841'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NAME:MAP_POSITION:COUNT_EVENTS:LAST_UPDATED_DT:LAST_UPDATED_BY:'
,p_sort_column_1=>'NAME'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61172966654993889)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37756253337902470)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(59325576592024018)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(37791908169902498)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(137325050374435810)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(61169066039993873)
,p_button_name=>'DOWNLOAD_CSV'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(37791188892902498)
,p_button_image_alt=>'Download CSV'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.:CSV:&DEBUG.:RP::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(61172363632993887)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(61169066039993873)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(61191214835144541)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(61169066039993873)
,p_button_name=>'GRID_EDIT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_image_alt=>'Grid Edit'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP,13::'
,p_icon_css_classes=>'fa-table'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18329127426943750)
,p_name=>'P11_DELETED_Y'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(61169066039993873)
,p_prompt=>'Deleted Y'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Deleted;Y'
,p_field_template=>wwv_flow_api.id(37790585158902496)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47848985482605923)
,p_name=>'refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(61169066039993873)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47849048025605924)
,p_event_id=>wwv_flow_api.id(47848985482605923)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(61169066039993873)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21848062016600501)
,p_name=>'refresh report'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_DELETED_Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21848197660600502)
,p_event_id=>wwv_flow_api.id(21848062016600501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(61169066039993873)
);
end;
/
prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(59324280286023993)
,p_name=>'Venue'
,p_page_mode=>'MODAL'
,p_step_title=>'Venue'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(62246971721848558)
,p_dialog_height=>'650'
,p_dialog_width=>'650'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JEFF'
,p_last_upd_yyyymmddhh24miss=>'20190408213455'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61163042446993827)
,p_plug_name=>'Venue'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--leftLabels'
,p_plug_template=>wwv_flow_api.id(37749289366902466)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'PLSQL_EXPRESSION'
,p_plug_read_only_when=>'NOT APEX_AUTHORIZATION.is_authorized(''Operator'') or :P12_DELETED_Y=''Y'''
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21851587343600536)
,p_plug_name=>'google map'
,p_parent_plug_id=>wwv_flow_api.id(61163042446993827)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(37749289366902466)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.JK64.SIMPLE_GOOGLE_MAP'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'0,0'
,p_attribute_02=>'2'
,p_attribute_03=>'400'
,p_attribute_04=>'P12_MAP_POSITION'
,p_attribute_05=>'15'
,p_attribute_07=>'N'
,p_attribute_12=>'N'
,p_attribute_17=>'auto'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61175682915002810)
,p_plug_name=>'Record'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37749289366902466)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P12_DB$VERSION_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(61163470434993831)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(61163042446993827)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P12_VENUE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47849603107605930)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(61163042446993827)
,p_button_name=>'SAVE_COPY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_image_alt=>'Copy'
,p_button_position=>'TOP'
,p_button_condition=>'P12_DB$VERSION_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-copy'
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(61163652816993831)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(61163042446993827)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_image_alt=>'Delete'
,p_button_position=>'TOP'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>':P12_VENUE_ID is not null and :P12_DELETED_Y is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-trash'
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21848249008600503)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(61163042446993827)
,p_button_name=>'UNDELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_image_alt=>'Undelete'
,p_button_position=>'TOP'
,p_button_execute_validations=>'N'
,p_button_condition=>':P12_DELETED_Y=''Y'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-recycle'
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(61163552813993831)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(61163042446993827)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_condition=>':P12_VENUE_ID is not null and :P12_DELETED_Y is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_security_scheme=>wwv_flow_api.id(62246739341844416)
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(47849757766605931)
,p_branch_name=>'Go To Page 12'
,p_branch_action=>'f?p=&APP_ID.:12:&SESSION.:COPY:&DEBUG.:RP,12:P12_DB$SRC_ID:&P12_VENUE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18328878003943747)
,p_name=>'P12_DB$SRC_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(61175682915002810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18328964006943748)
,p_name=>'P12_DELETED_Y'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(61175682915002810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18329057738943749)
,p_name=>'P12_DB$SRC_VERSION_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(61175682915002810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61165701846993840)
,p_name=>'P12_VENUE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(61163042446993827)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61166138676993854)
,p_name=>'P12_NAME'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(61163042446993827)
,p_prompt=>'Name'
,p_placeholder=>'venue or location name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>2000
,p_field_template=>wwv_flow_api.id(37790866266902497)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61175932978002813)
,p_name=>'P12_DB$CREATED_DT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(61175682915002810)
,p_prompt=>'Created'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61176331371002814)
,p_name=>'P12_DB$CREATED_BY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(61175682915002810)
,p_prompt=>'By'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61176712952002815)
,p_name=>'P12_DB$LAST_UPDATED_DT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(61175682915002810)
,p_prompt=>'Last Updated'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61177173896002815)
,p_name=>'P12_DB$LAST_UPDATED_BY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(61175682915002810)
,p_prompt=>'By'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61177596453002815)
,p_name=>'P12_DB$VERSION_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(61175682915002810)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'No help available for this page item.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100820615999691401)
,p_name=>'P12_MAP_POSITION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(61163042446993827)
,p_prompt=>'Map position'
,p_placeholder=>'lat,lng'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47848193725605915)
,p_validation_name=>'val'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return venues$tapi.val (rv => venues$tapi.t_rv',
'  (venue_id      => :P12_VENUE_ID',
'  ,name          => :P12_NAME',
'  ,map_position  => :P12_MAP_POSITION',
'  ,deleted_y     => :P12_DELETED_Y',
'  ,db$version_id => :P12_DB$VERSION_ID));'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(47848024312605914)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  r venues$tapi.t_row;',
'begin',
'  if :request = ''COPY'' then',
'    r := venues$tapi.copy(venues$tapi.get(venue_id => :P12_DB$SRC_ID));',
'  else',
'    r := venues$tapi.get(venue_id => :P12_VENUE_ID);',
'  end if;',
'  :P12_VENUE_ID           := r.venue_id;',
'  :P12_NAME               := r.name;',
'  :P12_MAP_POSITION       := r.map_position;',
'  :P12_DELETED_Y          := r.deleted_y;',
'  :P12_DB$CREATED_BY      := r.db$created_by;',
'  :P12_DB$CREATED_DT      := to_char(r.db$created_dt, util.datetime_format);',
'  :P12_DB$LAST_UPDATED_BY := r.db$last_updated_by;',
'  :P12_DB$LAST_UPDATED_DT := to_char(r.db$last_updated_dt, util.datetime_format);',
'  :P12_DB$VERSION_ID      := r.db$version_id;',
'  :P12_DB$SRC_ID          := r.db$src_id;',
'  :P12_DB$SRC_VERSION_ID  := r.db$src_version_id;',
'end;',
''))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(47848279760605916)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'process'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  rv venues$tapi.t_rv;',
'  r  venues$tapi.t_row;',
'begin',
'  rv := venues$tapi.t_rv',
'    (venue_id          => :P12_VENUE_ID',
'    ,name              => :P12_NAME',
'    ,map_position      => :P12_MAP_POSITION',
'    ,deleted_y         => :P12_DELETED_Y',
'    ,db$version_id     => :P12_DB$VERSION_ID',
'    ,db$src_id         => :P12_DB$SRC_ID',
'    ,db$src_version_id => :P12_DB$SRC_VERSION_ID);',
'  case',
'  when :REQUEST = ''CREATE'' then',
'    r := venues$tapi.ins (rv => rv);',
'    util.success(''Venue created.'');',
'  when :REQUEST like ''SAVE%'' then',
'    r := venues$tapi.upd (rv => rv);',
'    util.success(''Venue updated.''',
'      || case when :REQUEST = ''SAVE_COPY'' then '' Ready to create new venue.'' end);',
'  when :REQUEST = ''DELETE'' then',
'    venues$tapi.del (rv => rv);',
'    util.clear_page_cache;',
'    util.success(''Venue deleted.'');',
'',
'  when :REQUEST = ''UNDELETE'' then',
'    r := venues$tapi.undel (rv => rv);',
'    util.success(''Venue undeleted.'');',
'',
'  else',
'    null;',
'  end case;',
'  if :REQUEST != ''DELETE'' then',
'    :P12_VENUE_ID           := r.venue_id;',
'    :P12_NAME               := r.name;',
'    :P12_MAP_POSITION       := r.map_position;',
'    :P12_DELETED_Y          := r.deleted_y;',
'    :P12_DB$CREATED_BY      := r.db$created_by;',
'    :P12_DB$CREATED_DT      := r.db$created_dt;',
'    :P12_DB$LAST_UPDATED_BY := r.db$last_updated_by;',
'    :P12_DB$LAST_UPDATED_DT := r.db$last_updated_dt;',
'    :P12_DB$VERSION_ID      := r.db$version_id;',
'    :P12_DB$SRC_ID          := r.db$src_id;',
'    :P12_DB$SRC_VERSION_ID  := r.db$src_version_id;',
'  end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(47848545456605919)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'close dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE_COPY'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(59324280286023993)
,p_name=>'Venues Grid Edit'
,p_step_title=>'Venues Grid Edit'
,p_step_sub_title=>'Venues Grid Edit'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JEFF'
,p_last_upd_yyyymmddhh24miss=>'20190408212140'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21880867061680030)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37756253337902470)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(59325576592024018)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(37791908169902498)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21881405006680031)
,p_plug_name=>'Venues Grid Edit'
,p_region_name=>'venues'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37749289366902466)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VENUE_ID,',
'       NAME,',
'       MAP_POSITION,',
'       DELETED_Y,',
'       DB$LAST_UPDATED_BY,',
'       DB$LAST_UPDATED_DT,',
'       DB$VERSION_ID,',
'case when deleted_y is null then ''UD'' end as allowed_op',
'  from VENUES',
'where nvl(deleted_y,''N'')=nvl(:P13_DELETED_Y,''N'')'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P13_DELETED_Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21850199308600522)
,p_name=>'ALLOWED_OP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ALLOWED_OP'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21882685504680032)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21883134011680033)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Actions'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21883700756680033)
,p_name=>'VENUE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VENUE_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_enable_filter=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21884316859680034)
,p_name=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>2000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21884949601680034)
,p_name=>'MAP_POSITION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAP_POSITION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Map Position'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>400
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21885592091680035)
,p_name=>'DELETED_Y'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DELETED_Y'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21887307593680036)
,p_name=>'DB$LAST_UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DB$LAST_UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Last Updated By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21887919068680037)
,p_name=>'DB$LAST_UPDATED_DT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DB$LAST_UPDATED_DT'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Last Updated'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21888593954680037)
,p_name=>'DB$VERSION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DB$VERSION_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(21881903515680031)
,p_internal_uid=>21881903515680031
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_edit_row_operations_column=>'ALLOWED_OP'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(21882388374680032)
,p_interactive_grid_id=>wwv_flow_api.id(21881903515680031)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(21882455494680032)
,p_report_id=>wwv_flow_api.id(21882388374680032)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21883541722680033)
,p_view_id=>wwv_flow_api.id(21882455494680032)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(21883134011680033)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21884150713680034)
,p_view_id=>wwv_flow_api.id(21882455494680032)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(21883700756680033)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21884735941680034)
,p_view_id=>wwv_flow_api.id(21882455494680032)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(21884316859680034)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21885340200680035)
,p_view_id=>wwv_flow_api.id(21882455494680032)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(21884949601680034)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21885909235680035)
,p_view_id=>wwv_flow_api.id(21882455494680032)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(21885592091680035)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21887796712680036)
,p_view_id=>wwv_flow_api.id(21882455494680032)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(21887307593680036)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21888348011680037)
,p_view_id=>wwv_flow_api.id(21882455494680032)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(21887919068680037)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21888947949680037)
,p_view_id=>wwv_flow_api.id(21882455494680032)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(21888593954680037)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21895440789684016)
,p_view_id=>wwv_flow_api.id(21882455494680032)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(21850199308600522)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21850981245600530)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(21881405006680031)
,p_button_name=>'UNDELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_image_alt=>'Undelete selected'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_icon_css_classes=>'fa-recycle'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21850230225600523)
,p_name=>'P13_DELETED_Y'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21881405006680031)
,p_prompt=>'Deleted Y'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Deleted;Y'
,p_field_template=>wwv_flow_api.id(37790585158902496)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21850669437600527)
,p_name=>'P13_SELECTED'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(21881405006680031)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(21850534443600526)
,p_tabular_form_region_id=>wwv_flow_api.id(21881405006680031)
,p_validation_name=>'val'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return venues$tapi.val (rv => venues$tapi.t_rv',
'  (venue_id      => :VENUE_ID',
'  ,name          => :NAME',
'  ,map_position  => :MAP_POSITION',
'  ,deleted_y     => :DELETED_Y',
'  ,db$version_id => :DB$VERSION_ID));'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21850327483600524)
,p_name=>'refresh report'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P13_DELETED_Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21850412121600525)
,p_event_id=>wwv_flow_api.id(21850327483600524)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(21881405006680031)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21850740069600528)
,p_name=>'get selected ids'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(21881405006680031)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21850838056600529)
,p_event_id=>wwv_flow_api.id(21850740069600528)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var i, selectedIds = ":", model = this.data.model;',
'for ( i = 0; i < this.data.selectedRecords.length; i++ ) {  ',
'  selectedIds += model.getValue( this.data.selectedRecords[i], "VENUE_ID") + ":";  ',
'}',
'apex.debug(''selected=''+selectedIds);',
'$s("P13_SELECTED", selectedIds); '))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21851026411600531)
,p_name=>'show/hide undelete button'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P13_DELETED_Y'
,p_condition_element=>'P13_DELETED_Y'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21851176991600532)
,p_event_id=>wwv_flow_api.id(21851026411600531)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(21850981245600530)
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21851227389600533)
,p_event_id=>wwv_flow_api.id(21851026411600531)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(21850981245600530)
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21890905051680039)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(21881405006680031)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>' - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  rv venues$tapi.t_rv;',
'  r  venues$tapi.t_row;',
'begin',
'  rv := venues$tapi.t_rv',
'    (venue_id      => :VENUE_ID',
'    ,name          => :NAME',
'    ,map_position  => :MAP_POSITION',
'    ,deleted_y     => :DELETED_Y',
'    ,db$version_id => :DB$VERSION_ID);    ',
'  case :APEX$ROW_STATUS',
'  when ''I'' then',
'    r := venues$tapi.ins (rv => rv);    ',
'    -- Interactive Grid needs the new PK in order to find the new record',
'    :VENUE_ID := r.venue_id;',
'  when ''U'' then',
'    r := venues$tapi.upd (rv => rv);',
'  when ''D'' then',
'    venues$tapi.del (rv => rv);',
'  end case;',
'end;'))
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21851370536600534)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'bulk_undel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  ids apex_t_varchar2;',
'  arr venues$tapi.t_rvarray;',
'begin',
'  ids := apex_string.split(trim('':'' from :P13_SELECTED),'':'');',
'  for i in 1..ids.count loop',
'    arr(nvl(arr.last,0)+1) := venues$tapi.t_rv(venue_id => ids(i)); ',
'  end loop;',
'  venues$tapi.bulk_undel(arr => arr);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(21850981245600530)
);
end;
/
prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(59324280286023993)
,p_name=>'Event Edit Log'
,p_step_title=>'Event Edit Log'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Event Edit Log'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(62246971721848558)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JEFF'
,p_last_upd_yyyymmddhh24miss=>'20190328220700'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99772719798529559)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37756253337902470)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(59325576592024018)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(37791908169902498)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99773328210529563)
,p_plug_name=>'Event Edit Log'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>wwv_flow_api.id(37748115288902466)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.event_id',
'      ,e.venue_id',
'      ,(select min(x.name)',
'               keep (dense_rank last order by x.db$version_id)',
'        from   venues$jn x',
'        where  x.venue_id = e.venue_id',
'        and    x.jn$timestamp <= e.jn$timestamp',
'       ) as venue_name',
'      ,e.host_id',
'      ,(select min(x.name)',
'               keep (dense_rank last order by x.db$version_id)',
'        from   hosts$jn x',
'        where  x.host_id = e.host_id',
'        and    x.jn$timestamp <= e.jn$timestamp',
'       ) as host_name',
'      ,e.event_type_code',
'      ,e.title',
'      ,e.start_dt',
'      ,e.end_dt',
'      ,e.db$version_id as version_id',
'      ,e.jn$action',
'      ,e.jn$timestamp',
'from   events$jn e',
'where  (e.event_id = :P14_EVENT_ID or :P14_EVENT_ID IS NULL)',
'and    (e.jn$action = :P14_JN_ACTION or :P14_JN_ACTION IS NULL)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P14_EVENT_ID,P14_JN_ACTION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(99773429373529563)
,p_name=>'Event Edit Log'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_LEFT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#ws/small_page.gif" alt="">'
,p_owner=>'JEFF'
,p_internal_uid=>99773429373529563
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99773837885529570)
,p_db_column_name=>'EVENT_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Event ID'
,p_column_type=>'NUMBER'
,p_display_condition_type=>'ITEM_IS_NULL'
,p_display_condition=>'P14_EVENT_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99774248662529573)
,p_db_column_name=>'HOST_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Host ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99775028388529573)
,p_db_column_name=>'TITLE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Title'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99775869044529575)
,p_db_column_name=>'START_DT'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Start Dt'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99776223499529575)
,p_db_column_name=>'END_DT'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'End Dt'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99778235411529577)
,p_db_column_name=>'VERSION_ID'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Version#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99778621270529577)
,p_db_column_name=>'JN$ACTION'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Edit Action'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99779003497529579)
,p_db_column_name=>'JN$TIMESTAMP'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Edit Timestamp'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99781022911529581)
,p_db_column_name=>'VENUE_ID'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Venue ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94022410837071950)
,p_db_column_name=>'VENUE_NAME'
,p_display_order=>29
,p_column_identifier=>'T'
,p_column_label=>'Venue'
,p_column_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_VENUE_ID:#VENUE_ID#'
,p_column_linktext=>'#VENUE_NAME#'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99796625387930801)
,p_db_column_name=>'HOST_NAME'
,p_display_order=>39
,p_column_identifier=>'U'
,p_column_label=>'Host'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP,6:P6_HOST_ID:#HOST_ID#'
,p_column_linktext=>'#HOST_NAME#'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17494672251379221)
,p_db_column_name=>'EVENT_TYPE_CODE'
,p_display_order=>49
,p_column_identifier=>'V'
,p_column_label=>'Event Type Code'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(99784119268568044)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'997842'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EVENT_ID:VERSION_ID:JN$ACTION:TITLE:START_DT:END_DT:VENUE_NAME:HOST_NAME:JN$TIMESTAMP::EVENT_TYPE_CODE'
,p_sort_column_1=>'EVENT_ID'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'VERSION_ID'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94021832113071944)
,p_name=>'P14_EVENT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(99773328210529563)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94022008648071946)
,p_name=>'P14_JN_ACTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(99773328210529563)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(59324280286023993)
,p_name=>'Login'
,p_alias=>'LOGIN_DESKTOP'
,p_step_title=>'Sample TAPI Application'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(37715964884902436)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JEFF'
,p_last_upd_yyyymmddhh24miss=>'20190308105140'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59324789651024012)
,p_plug_name=>'Login'
,p_icon_css_classes=>'fa-calendar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(37748740925902466)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY_3'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>'Login as demo / demodemo'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(59325068164024016)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(59324789651024012)
,p_button_name=>'P101_LOGIN'
,p_button_static_id=>'P101_LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Login'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17494417317379219)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(59324789651024012)
,p_button_name=>'JK64'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(37791266665902498)
,p_button_image_alt=>'jk64.dev'
,p_button_position=>'TOP'
,p_button_redirect_url=>'https://jk64.dev'
,p_icon_css_classes=>'fa-external-link'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59324877794024016)
,p_name=>'P101_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(59324789651024012)
,p_placeholder=>'User name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59324967987024016)
,p_name=>'P101_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(59324789651024012)
,p_placeholder=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59325278778024017)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P101_USERNAME) );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59325165464024017)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P101_USERNAME,',
'    p_password => :P101_PASSWORD );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59325493044024018)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59325380844024017)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
);
end;
/
prompt --application/pages/page_00102
begin
wwv_flow_api.create_page(
 p_id=>102
,p_user_interface_id=>wwv_flow_api.id(59324280286023993)
,p_name=>'Feedback'
,p_alias=>'FEEDBACK'
,p_page_mode=>'MODAL'
,p_step_title=>'Feedback'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JEFF'
,p_last_upd_yyyymmddhh24miss=>'20160218092502'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68683537844074664)
,p_plug_name=>'Feedback'
,p_plug_template=>wwv_flow_api.id(37757299588902471)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(68687456008074670)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(68683537844074664)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_id=>wwv_flow_api.id(37791188892902498)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Feedback'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(68687842512074671)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(68683537844074664)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_api.id(37791188892902498)
,p_button_image_alt=>'Cancel'
,p_button_position=>'TOP'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68683941853074666)
,p_name=>'P102_APPLICATION_ID'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(68683537844074664)
,p_prompt=>'Application:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>'select application_id||''. ''||application_name d, application_id v from apex_applications where application_id = :P102_APPLICATION_ID'
,p_cSize=>60
,p_tag_attributes=>'class="fielddatabold"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_help_text=>'Identifies Application.'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68684803301074668)
,p_name=>'P102_PAGE_ID'
,p_item_sequence=>2
,p_item_plug_id=>wwv_flow_api.id(68683537844074664)
,p_prompt=>'Page:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>'select page_id||''. ''||page_name d, page_id v from apex_application_pages where page_id = :P102_PAGE_ID and application_id = :P102_APPLICATION_ID'
,p_cSize=>60
,p_tag_attributes=>'class="fielddatabold"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_help_text=>'Identifies page within application.'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68685653418074668)
,p_name=>'P102_FEEDBACK'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(68683537844074664)
,p_prompt=>'Feedback'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_help_text=>'Enter your feedback and press the submit feedback button.'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68686639385074669)
,p_name=>'P102_FEEDBACK_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(68683537844074664)
,p_prompt=>'Feedback Type'
,p_source=>'1'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'select the_name, id from APEX_FEEDBACK_TYPES order by id'
,p_field_template=>wwv_flow_api.id(37790697573902496)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Please identify the type of feedback you are providing.'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(68689213944074673)
,p_validation_name=>'P102_FEEDBACK'
,p_validation_sequence=>10
,p_validation=>'P102_FEEDBACK'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_when_button_pressed=>wwv_flow_api.id(68687456008074670)
,p_associated_item=>wwv_flow_api.id(68685653418074668)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(68688299066074671)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(68687842512074671)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(68688745794074672)
,p_event_id=>wwv_flow_api.id(68688299066074671)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(68689659506074673)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Submit Feedback'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.submit_feedback (',
'    p_comment         => :P102_FEEDBACK,',
'    p_type            => :P102_FEEDBACK_TYPE,',
'    p_application_id  => :P102_APPLICATION_ID,',
'    p_page_id         => :P102_PAGE_ID,',
'    p_email           => null);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(68687456008074670)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(68690051038074674)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Window'
,p_process_sql_clob=>'CLOSE_WINDOW'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
