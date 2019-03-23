create or replace procedure sv
  (p_name  in varchar2
  ,p_value in varchar2) is
begin
  util.sv
    (p_name  => p_name
    ,p_value => p_value);
end sv;
/

create or replace procedure sd
  (p_name  in varchar2 
  ,p_value in date
  ,p_fmt   in varchar2 := null /*override auto-selected format*/) is
begin
  util.sd
    (p_name  => p_name
    ,p_value => p_value
    ,p_fmt   => p_fmt);
end sd;
/

create or replace procedure st
  (p_name  in varchar2 
  ,p_value in timestamp
  ,p_fmt   in varchar2 := null /*override auto-selected format*/) is
begin
  util.st
    (p_name  => p_name
    ,p_value => p_value
    ,p_fmt   => p_fmt);
end st;
/

create or replace procedure assert
  (testcond  in boolean
  ,assertion in varchar2
  ,scope     in varchar2) is
begin
  util.assert
    (testcond  => testcond
    ,assertion => assertion
    ,scope     => scope);
end assert;
/
