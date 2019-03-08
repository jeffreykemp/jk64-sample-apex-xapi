-- These types needed by CSV_UTIL_PKG (from the Alexandria PL/SQL Library)
-- Credit: https://github.com/mortenbra/alexandria-plsql-utils

CREATE OR REPLACE TYPE "T_STR_ARRAY" as table of varchar2(4000);
/
CREATE OR REPLACE TYPE "T_CSV_LINE" as object (
  line_number  number,
  line_raw     varchar2(4000),
  c001         varchar2(4000),
  c002         varchar2(4000),
  c003         varchar2(4000),
  c004         varchar2(4000),
  c005         varchar2(4000),
  c006         varchar2(4000),
  c007         varchar2(4000),
  c008         varchar2(4000),
  c009         varchar2(4000),
  c010         varchar2(4000),
  c011         varchar2(4000),
  c012         varchar2(4000),
  c013         varchar2(4000),
  c014         varchar2(4000),
  c015         varchar2(4000),
  c016         varchar2(4000),
  c017         varchar2(4000),
  c018         varchar2(4000),
  c019         varchar2(4000),
  c020         varchar2(4000)
);
/
CREATE OR REPLACE TYPE "T_CSV_TAB" as table of t_csv_line;
/
