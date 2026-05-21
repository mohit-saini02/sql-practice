use shadidb;
select * from employees;

-- co-related sub query: 
-- employees whose salary is greater than the avg salary of their own department ? 
select * from employees as e 
where salary > (select avg(salary) from employees where department = e.department);


-- 
select * from employees as e 
where salary >=( select max(salary) from employees where department = e.DEPARTMENT);


 -- Find departments where all employees earn above 70000-- 
 select department from employees
 