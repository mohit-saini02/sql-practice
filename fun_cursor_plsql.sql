create table emp100 as select first_name , last_name , email from hr.employees; 

create or REPLACE function fun_cursor
return int
is

    CURSOR c_cursor is -- declaration 
    select *
    from emp100;
    v_col emp100%rowtype;

begin 

   open c_cursor; -- started the file
    fetch c_cursor into v_col;

    while (c_cursor%found) loop

        dbms_output.PUT_LINE(v_col.first_name || ' ' || v_col.last_name );
        fetch c_cursor into v_col;
    end loop;
    return 1;
end;

declare
    x int;

begin 
    x := FUN_CURSOR();
end;