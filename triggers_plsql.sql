
-- Triggers : trigger are the object which automatically execute when an event happen. 

-- ex : 

create or REPLACE trigger trig_emp100
before update 
on emp100

begin 
    insert into time_trigger values(current_timestamp);
end;


create table time_trigger(current_date timestamp  default current_timestamp);
select * from time_trigger;

-- Statement Level trigger : it runs only one time for a single query.
-- row level trigger  : it runs for each row in a table (for each row)

create or REPLACE trigger trig_emp100
before update 
on emp100
for each row     -- it is used to create row level trigger.

begin 
    insert into time_trigger values(current_timestamp);
end;


create table time_trigger(current_date timestamp  default current_timestamp);
select * from time_trigger;



-- create table that store old and new values if any changes occurs . 


-- table that stores the entry data when raj45 table updates.

create table table_entry
(id int , old_value varchar(50),new_value varchar(50));



-- trigger on raj 45 : 

create or REPLACE trigger trig_raj45
AFTER update 
on raj45
for each row     -- it is used to create row level trigger.
begin 
    insert into table_entry (id , old_value , new_value)
    values(:old.employee_id , :old.first_name ,:new.first_name );
end;

-- select * from table_entry;  -- to check 


-- ex : reate trigger ehich can id , first_name and last_name , old_value , new value , current time .


select * from raj45;
create table update_on_raj45(
    id int,
    first_name_old_value varchar(50),
    first_name_new_value varchar(50),
    last_name_name_old_value varchar(50),
    last_name_new_value varchar(50),
    updated_on TIMESTAMP DEFAULT current_timestamp);


create or REPLACE trigger trig_raj45
AFTER update 
on raj45
for each row     -- it is used to create row level trigger.
begin 
    insert into update_on_raj45 (id , first_name_old_value , first_name_new_value,
                                    last_name_name_old_value , last_name_new_value , UPDATED_ON)
    values(:old.employee_id , :old.first_name ,:new.first_name,:old.last_name ,:new.last_name ,current_timestamp );
end;


-- to check on update_on_raj45
select * from update_on_raj45;