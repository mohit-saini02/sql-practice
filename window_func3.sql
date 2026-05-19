use windowsdb;
select * from employees;

select * , row_number() over(order by salary) , 
rank() over(order by salary) ,
dense_rank() over(order by salary) from employees;

-- highest salary of each department ? 

select * ,
rank() over(partition by dept order by salary desc)
from employees;

-- rank() according to 
select * ,
rank() over(partition by dept order by hire_year)
from employees;


-- find salary of the employee that is max salary of their department ? 
select * from employees as e
where salary = (select max(salary) from employees where dept = e.dept);

-- using window function : 

-- method 1 : 
select * from (select *  , max(salary) over(partition by dept) as deptsalary from employees) as trh
where salary = deptsalary;  -- here we save the result (output table ) in trh and this trh is only for this query

-- method 2: using rank() fuction

select * from (select * , rank() over(partition by dept order by salary desc) as `rank` from employees) as trh
where `rank` = 1;

-- ***Q. second highest salary in given relation ? without using limit and order by ?

-- using window function : 
select * from (select * , dense_rank() over( order by salary desc) as `rank` from employees) as trh
where `rank` = 2;


-- using subquery : 

select * from employees
where salary = (select max(salary) from employees
				where salary < (select max(salary) from employees));




-- using window function : 

-- fourth lowest salary in given relation ? 

select * from (select * , dense_rank() over( order by salary ) as `rank` from employees) as trh
where `rank` = 4;














