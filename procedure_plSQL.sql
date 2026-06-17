-- stored procedure : 
                    -- stoed procedure are the named block of code which is used to execute a certail logic.
                    -- it is same as function 
        
-- ex. : 

create or replace PROCEDURE test59 is
begin

    dbms_output.put_line('hello');
end;

call TEST59();   -- you can call it anywhere ( in another files  also)



-- *** how you can provide the input (as parameters) to a procedure.

-- 1. in : it a type of parameter which is used to pass the value to the procedure . 
create or replace PROCEDURE test59(x in int ) is
begin

    dbms_output.put_line('hello');
    -- x:=10;   -- this will give an error because in parameter are can only read not change (or write.)
   
    dbms_output.put_line(x);
end;

-- 2. out 

create or replace PROCEDURE test59(x in int , y out int ) is
begin

    dbms_output.put_line('hello');
    y := x+10;
   
    dbms_output.put_line(x);
end;


create or replace PROCEDURE test59( y out int ) is
begin

   select employee_id into y from hr.employees;
end;


-- FUnction in plsql : 


create or replace function increase_salary( y int ) 
return int 
is 
begin 
    return y * 10;
end;
