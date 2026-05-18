use shadidb;
select * from employees;


-- partition by : partition by  groups the data (create window) like group by .

select *  , sum(salary) over(partition by department), sum(salary) over() from employees;

select *  , sum(salary) over(partition by manager_id) from employees;


-- partition by with order by :
select *  , sum(salary) over(partition by department order by salary), sum(salary) over() from employees;

-- ex. employee salary is how much percent of the total salary of their department? 

select name , department , salary , sum(salary) over(partition by department) as 'total_sal',
round((salary / sum(salary) over(partition by department))*100 , 2)  as 'percent_of' from employees;




-- ============================================
--  Create the employees table
-- ============================================
CREATE TABLE employees2 (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);
 
-- ============================================
--  Insert sample data (12 employees)
-- ============================================
INSERT INTO employees2 VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2020),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);
  
  select * from employees2;
  
  --
  select * , sum(salary) over(partition by hire_year order by salary) from employees2;
  
-- change the database ::::: 

use windowsdb;

select * from employees;
select * , max(salary) over(partition by dept order by hire_year) from employees;
  
  -- partition by on two or more columns : 
  select * , sum(salary) over(partition by dept , hire_year) from employees;
  
  -- using case (when - then ): 
  
  select * , sum(salary) over(partition by dept),
  case
  when salary >  sum(salary) over(partition by dept) then 'Above avg_salary'
  else 'Less than avg_salary'
  end
  from employees;
  
   --  funcitons related to window function : 
   -- 1. row_number() : it generates unique numbers 
   select * , row_number() over() from employees;
   select * , row_number() over(order by salary) from employees;
   
   select * , row_number() over(partition by dept) from employees;
   
   -- 2. rank() : it gives the rank to the  data based on order by condition . it gives same rank to same values and next values starts with next count(count of same rank) .
   -- same salary of 2 employees  in same dept gets same rank (1) but then next employee's salary in same department gets rank - 3rd not 2nd.
   
   select * , rank() over(order by salary desc) from employees;
   select * , rank() over(partition by dept order by salary desc) from employees;
   
   select * , dense_rank() over(partition by hire_year order by salary desc) from employees ; 
   

   
  






