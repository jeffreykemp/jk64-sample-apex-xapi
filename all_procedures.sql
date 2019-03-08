CREATE OR REPLACE PROCEDURE sv
  (p_name  IN VARCHAR2
  ,p_value IN VARCHAR2) IS
BEGIN
  UTIL.sv
    (p_name  => p_name
    ,p_value => p_value);
END sv;
/

CREATE OR REPLACE PROCEDURE sd
  (p_name  IN VARCHAR2 
  ,p_value IN DATE
  ,p_fmt   IN VARCHAR2 := NULL /*override auto-selected format*/) IS
BEGIN
  UTIL.sd
    (p_name  => p_name
    ,p_value => p_value
    ,p_fmt   => p_fmt);
END sd;
/

CREATE OR REPLACE PROCEDURE st
  (p_name  IN VARCHAR2 
  ,p_value IN TIMESTAMP
  ,p_fmt   IN VARCHAR2 := NULL /*override auto-selected format*/) IS
BEGIN
  UTIL.st
    (p_name  => p_name
    ,p_value => p_value
    ,p_fmt   => p_fmt);
END st;
/

CREATE OR REPLACE PROCEDURE assert
  (testcond  IN BOOLEAN
  ,assertion IN VARCHAR2
  ,scope     IN VARCHAR2) IS
BEGIN
  UTIL.assert
    (testcond  => testcond
    ,assertion => assertion
    ,scope     => scope);
END assert;
/
