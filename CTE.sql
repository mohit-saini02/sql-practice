create database CTE;
-- Recursive CTE :
 --               Recusrsive CTE is a type of CTE that repeats itself untill a condition is not satisfied.
 
 -- (set operations : Union , union all , intersect  , except) we uses the set operations to combine the output of multiple queries.
 
-- union : combine but remove duplicates
-- union all : combine and have duplicate result also.alter
-- intersect : give common from multiple queries.
-- except : use as minus operations.

-- Example: 
use sakila;
-- union : 
select film_id from film
where film_id between 1 and 3
union
select film_id from film
where film_id in (3 , 4,5);

-- union all : 
select film_id from film
where film_id between 1 and 3
union
select film_id from film
where film_id in (3 , 4,5);










use CTE;
-- Recursive cte: 
with cte as (select 1 as n)
select n+5 from cte
where n < 10;

-- 
with recursive cte as 
(select 1 as n
union all 
select n+1 from cte
where n <= 9)         -- where executes first(means before printing the condition checks).
select * from cte;

create table employees3(
emp_id int ,
emp_name  varchar(50) , 
manager_id int);

insert into employees3 values
(1,'CEO',NUll),
(2,'John',1),
(3,'Mary',1),
(4,'David',2),
(5,'Lisa',2),
(6,'Tom',4);

select * from employees3;


--   
with cte as 
(select emp_id as b_id , emp_name as b_name , emp_name as hierarchy from employees3
where manager_id is null)

select * from cte
union all 
select emp.emp_id , emp.emp_name , concat(emp.emp_name , ' -> ' , cte.b_name) as hierarchy
from employees3 as emp
join cte where emp.manager_id = cte.b_id;

--   ----------- Final : 

with recursive cte as 
(select emp_id as b_id , emp_name as b_name , emp_name as hierarchy from employees3
where manager_id is null
union all 
select emp.emp_id , emp.emp_name , concat(emp.emp_name , ' -> ' , cte.hierarchy) as hierarchy
from employees3 as emp
join cte where emp.manager_id = cte.b_id)
select * from cte;



