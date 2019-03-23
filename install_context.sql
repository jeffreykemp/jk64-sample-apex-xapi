-- run as sys; set OWNER to the target schema
create or replace context sample_ctx using &owner..security accessed globally;