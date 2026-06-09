-- Indexes : 

create database if not exists indexdb;
use indexdb;

create table employees(
id int ,
name varchar(20) , 
age int);

insert into employees values 
(1,'abc',90), 
(3,'def',100),
(2,'abhi',23),
(5,'naina',7899),
(6,'shaym',100),
(4,'tushar',60);
select * from employees;


-- EXPLAIN keyword : 
explain select * from employees where id = 2;

-- Types of indexes : 
-- 1. Clustered index : when we make the primary key , is called clustered index.

-- add primary key on id atribute : 

alter table employees add primary key(id);
-- note : now the data present in sorted form because of primary key.it stores the data in the form of BTree (binary tree) data structure format.alter


explain select * from employees where id = 2;
-- but when we use name column to access data : 
explain select * from employees where name = 'tushar';

-- 2. Non-Clustered Index : it is a separate data structure from the table .it contains only the indexed column values and a pointer. it does not change the physical order of the table .
create table employees2(
id int ,
name varchar(20) , 
age int);


insert into employees2 values 
(1,'abc',90), 
(3,'def',100),
(2,'abhi',23),
(5,'naina',7899),
(6,'shaym',100),
(4,'tushar',60);

select * from employees2;

create index age_index on employees2(age);
show indexes from employees2;

explain select * from employees2 where age = 100;




-- a. Unique index : 
-- b . composite index : 

create table employees3(
id int ,
name varchar(20) , 
age int);


insert into employees3 values 
(1,'abc',90), 
(3,'def',100),
(2,'abhi',23),
(5,'naina',7899),
(6,'shaym',100),
(4,'tushar',60);

select * from employees3;

create index com_index on employees3(age,name);
show indexes from employees3;


explain select * from employees3 where age = 100 and name = 'def';
 -- note : --> you have to follow the same sequence as you declared during composite index creation .alter
		   -- > but when you use first column of composite index then it will work 
-- ex: 
explain select * from employees3 where name = 'def';  -- the composite index will not work.

explain select * from employees3 where age = 100; -- here , it will work bcz age is first column. 




