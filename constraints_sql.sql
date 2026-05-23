-- create Database :

create database if not exists const_db;

use const_db;
-- select database();    -- it is used to check the current database.

-- DDL : Data Definition Language

create table test1(
id int ,
age int
);

-- insert: (DML - Data Manipulation Language)

insert into test1 values
(101 , 32),
(102 , null);

select * from test1;


insert into test1 values
(103,25),
(101,32);
select * from test1;


--  Constraints: 
-- 				Constraints are the rules applied on the table's column to prevent from the invalid data.

-- NOT NULL 

create table test2(
id int ,
age int not null
);
insert into test2 values
(101 , 32),
(102,null);
select * from test2;

-- UNIQUE 

create table test3(
id int unique,
age int not null );

insert into test3 values
(102 , 32),
(null  , 32),
(null,33);
select * from test3;

-- DEFAULT : 



create table test4(
id int default 100,
age int not null );

insert into test4(age) values(32);
select * from test4;


-- PRIMARY KEY : 

create table test5
(id int primary key,
age int);

-- insert into test5 values
-- (null , 45);          -- gives an error

-- composite primary key : 

create table if not exists test6
(id int ,
age int ,
salary int,
primary key(id , age));      -- method to apply composite primary key on two or more columns.


insert into test6 values
(1 , 50 , 50000),
(2,40,20000),
(1,55,80000),
(3,50,50000);

desc test6;

-- CHECK : 

create table test7
(id int,
age int check (age>18));   -- You can apply any sql operator inside the check constraint.


insert into test7 values
(101, 25);

-- insert into test7 values
-- (102, 15);          -- ------------------>  It'll give an Error. 



-- FOREIGN KEY : 

create table student(
id int ,
name varchar(20),
cname varchar(20),
foreign key (cname) references s_class(cname));


insert into student values
(1,'naina','10'),
(2,'abhi',9);



select * from student;
insert into student values(3 , 'bhavesh' , 12); --   ---> this will give an error bcz  class 12 does not exists in s_class table .




create table s_class(
cname varchar(20) primary key);

insert into s_class values 
(10),
(9),
(8);






