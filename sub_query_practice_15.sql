use sakila;

select * from employees;
-- Single Row Subquery  :

-- Find employees whose salary is greater than the average salary.

select * from employees
where salary > (select avg(salary) from employees);
-- Find employee(s) who work in the same department as Alice.

select * from employees
where department = (select department from employees
					where first_name = 'Alice');
                    

-- Find employees earning more than Bob.
select * from employees 
where salary > (select salary from employees 
				where first_name = 'Bob');
                
-- Find the employee who has the highest salary.
select * from employees
where salary = (select max(salary) from employees);
-- Find employees hired after the hire date of Emma.

select * from employees
where hire_date > (select hire_date from employees
where first_name = 'Emma');




-- Multi Row Subquery Questions:

-- Find employees who work in departments where avg salary is greater than 70000.
select * from employees
where department in (select department  from employees 
						group by department
						having avg(salary) > 70000);
-- Find employees whose department is either IT or HR using subquery.
select * from employees
where emp_id in (select emp_id from employees
where department = 'IT' or department = 'HR');

-- Find employees earning more than ANY employee in HR department.
select * from employees 
where salary > any(select salary from employees 
					where department = 'HR');
-- Find employees earning more than ALL employees in Sales department.
select * from employees 
where salary >all(select salary from employees 
					where department = 'Sales');
                    
-- Find employees who belong to departments having inactive employees.
select * from employees 
where department in (select department from employees
						where is_active = 'N');


-- Correlated Subquery Questions:

-- Find employees whose salary is greater than the average salary of their department.
select * from employees as e1
where salary > (select avg(salary) from employees e2
				where e2.department = e1.department);
-- Find the highest paid employee in each department.
select * from employees as e1
where salary = (select max(salary) from employees as e2
				where e2.department = e1.department);
                
-- Find employees who were hired earlier than the average hire date of their department.
select * from employees as e1
where hire_date < (select avg(hire_date) from employees as e2
where e2.department = e1.department);

-- Find employees whose salary is less than the highest salary in their department.
select * from employees as e1
where salary < (select max(salary) from employees as e2
where e2.department = e1.department);
-- Find employees who are the oldest in their department.

select * from employees as e1
where hire_date = (select min(hire_date) from employees as e2
where e2.department = e1.department);