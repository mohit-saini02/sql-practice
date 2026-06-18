
--2. create a function that take 2 paramertes first name and lastname and return 'fistrname+lastname+@gmail.com'?
CREATE OR REPLACE FUNCTION create_email(
    first_ VARCHAR2,
    last_  VARCHAR2
)
RETURN VARCHAR2
IS
    email VARCHAR2(100);
BEGIN
    email := first_ || last_ || '@gmail.com';

    RETURN email;
END;
/



-- declare
--     res varchar2(150);
-- BEGIN
--     res := create_email('mohit','saini');
--     dbms_output.put_line(res);
-- end;


select create_email(first_name , last_name) from hr.employees;
