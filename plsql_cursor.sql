-- -- %rowtype : 

-- declare 
--     emp_rec hr.employees%rowtype;

-- begin 

--     select * into emp_rec from hr.employees 
--     where employee_id = 100;

--     dbms_output.put_line(emp_rec.first_name);
-- end;


-- %rowtype: 

-- declare 
--     v_emp hr.employees %rowtype;

-- BEGIN

--     select * into v_emp from hr.EMPLOYEES where employee_id = 101;
--     dbms_output.put_line(v_emp_email);
-- end;


--      -------------------------- CURSOR ----------------------------



-- IMPLICIT CURSOR:
create table raj45 as select * from hr.employees;

-- BEGIN 
--     UPDATE raj45 SET first_name = 'aman'
--     where first_name  = 'Neena';
--     dbms_output.put_line(SQL%rowcount);
-- end;

-- -----------------------------------  Explicit cursor -----------------------


 select * from raj45;

-- create table raj47 as select employee_id , first_name ,
-- email from hr.employees where employee_id BETWEEN 101 and 105;

 select * from raj47;

-- cursor attributes : 
 ------------------------------- %isopen -----------------------------------------------------

DECLARE

    cursor raj_cursor is select * from raj47;
    raj_rec raj47%rowtype;

begin 

    open raj_cursor;   -- to start cursor
    if (raj_cursor%isopen) then                              -- %isopen check that the cursor is open or not .

        dbms_output.PUT_LINE('cursor open');
    end if;
    fetch raj_cursor into raj_rec; -- task executed here 

    close raj_cursor;                  -- cursor closed here 
end;




-- ----------------------- %found -----------------------------------

DECLARE

    cursor raj_cursor is select * from raj47;
    raj_rec raj47%rowtype;

begin 

    open raj_cursor;   -- to start cursor
    
    fetch raj_cursor into raj_rec; -- task executed here
    if (raj_cursor%found) then
        dbms_output.PUT_LINE('cursor open(found)');
    end if; 

    close raj_cursor;                  -- cursor closed here 
end;

--     ----------------------   LOOP ( to fetch rows one by one)----------------------

DECLARE

    cursor raj_cursor is select * from raj47;
    raj_rec raj47%rowtype;

begin 

    open raj_cursor;   -- to start cursor
     FETCH raj_cursor INTO raj_rec;
    
    
    while(raj_cursor%found) LOOP
        dbms_output.PUT_LINE(raj_rec.first_name || ' '|| raj_rec.employee_id);
        fetch raj_cursor into raj_rec;
    end loop;

    close raj_cursor;                  -- cursor closed here 
end;