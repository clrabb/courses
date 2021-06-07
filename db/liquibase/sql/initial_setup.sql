create user courses_admin;
create group courses_sa;
create group courses_reader;
create group courses_writer;
grant courses_sa to courses_admin;

-- this grant is odd as the dba_admin 
-- account is not really all that special
-- in rds
-- If it's not here, the create schema will fail
-- (assuming you are doing this as dba_admin)
--
grant courses_sa to dba_admin;
create schema courses authorization courses_sa;

grant usage on schema courses to courses_sa;
grant usage on schema courses to courses_writer;
grant usage on schema courses to courses_reader;
