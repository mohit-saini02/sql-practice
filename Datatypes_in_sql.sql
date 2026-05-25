create database if not exists datatypedb;
use datatypedb;

--    Datatypes in SQL : 


-- 1. numeric : 
--   a. tinyint : it contains 1 byte number only means(8 bit or 2**8 number ) . range(-128 to 127).

create table test1(id tinyint);
insert into test1 values (-1),(127);
select * from test1;

insert into test1 values (128);   -- it will give an error.

create table test2(age tinyint unsigned);  -- range becomes 0 to 255
insert into test2 values (255);
select * from test2; 


-- b . smallint --> 2 byte
-- c. medium int -- > 3 byte
-- d. int --> 4 byte
-- e. bigint --> 8 byte

-- 2. Decimal : 
-- a. float : it only contain 2  values after decimal point.
-- b. double : it contain 7 and more values after decimal point.
create table test3 (
salary float , salary2 double);

insert into test3 values(1989.93019322,1989093919322);
select * from test3;



