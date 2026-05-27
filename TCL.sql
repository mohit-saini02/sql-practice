-- TCL : Transaction control language : 

-- Transaction : transaction are the group of sql statements which works as a unit.

-- this TCl ensures my data is accurate . by following properties :

-- 1. Atomicity : 
-- 2. Consistency : 
-- 3. Isolation :  
-- 4.  Durability : permanantly saved 

-- 
create database if not exists rajdb;
use rajdb;

create table rj45(id int);
select * from rj45;

-- tcl
start transaction;      -- it starts transaction means  "now the data is not direclty saved untill i commit it.
insert into rj45 values (100) , (90);
select * from rj45;
commit;           -- it is used to save data permanantly.


-- when a transaction starts : 
				-- 1. start with my using keyword ' start transaction '
                -- 2. Disable autocommit  mode.
                
-- note : transaction works when we use DML commands .

-- TO end transaction : 
		-- 1. Commit
        -- 2. rollback
        -- 3. execute ddl command
        
        
        
-- practice : 
start transaction;

update rj45 set id = 1500;
-- to revert these changes ( we use 'rollback' keyword.)
select * from rj45;
rollback;   -- it is used to revert works like undo button.

-- 2. second method to start transaction : using autocommit

start transaction;
insert into rj45 values (1001) , (1002),(1003);
delete from rj45 where id = 1001;
select * from rj45;
commit;

-- 
start transaction ;

insert into rj45 values(23) , (24) ;
savepoint rj45_insert;
select * from rj45;
update rj45 set id = 1000;
rollback to rj45_insert;    -- it reverts back to the save point instead of reverting the entire pending statments.alter

-- if we perform a ddl command then it automatically commit.
create table abc(abcid int); 

select * from rj45; -- now the peding data is commited bcz we perform a ddl command .


-- **note : we do not revert drop and truncate because these are ddl commands.






				