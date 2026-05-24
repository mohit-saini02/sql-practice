use joinpractice;

-- 1 Display employee names along with their department names.

select e.emp_name , d.dept_name from employees as e
join departments as d
on e.dept_id= d.dept_id; 

-- 2. Display all employees and their department names, including employees without departments.

select * from employees as e
left join departments as d
on e.dept_id = d.dept_id;

-- 3.Find the total number of employees in each department.

select dept_id , count(*) as num_of_emp from employees
group by dept_id;

-- 4.Display department names along with total salary paid in each department.

select d.dept_name , sum(salary) from employees as e
join departments as d
on e.dept_id = d.dept_id 
group by d.dept_name ;


-- 5 Find the average salary in each department.
select  dept_id , avg(salary) from employees 
group by dept_id ;

-- 6 Display departments where average salary is greater than 60000.

select e.dept_id , d.dept_name , avg(salary)  from employees as e
join departments as d
on e.dept_id = d.dept_id
group by e.dept_id having avg(salary) > 60000;

-- 7 Find the maximum salary in each department.

select e.dept_id  , d.dept_name,  max(salary) from employees as e
join departments as d 
on e.dept_id  = d.dept_id
group by e.dept_id;

-- 8 Find the minimum salary in each department.
select e.dept_id , d.dept_name , min(e.salary) from employees as e
join departments as d
on d.dept_id = e.dept_id
group by e.dept_id;


-- 9 Display employee name, salary, and department name.

select e.emp_name ,e.salary , d.dept_name  
from employees as e
join departments as d
on e.dept_id = d.dept_id ;

-- 10 Find employees earning more than 60000 with their department names.

select emp_name , d.dept_name , e.salary from employees as e
join departments as d
on e.dept_id  = d.dept_id 
where salary > 60000
order by salary;

-- 11 Show all employees working in the IT department.
select * from employees as e
join departments as d 
on e.dept_id = d.dept_id 
where d.dept_name = 'IT'
order by emp_id;

-- 12 Display employee names and their manager names.
select  m.emp_id , m.emp_name,e.emp_id as 'm_id' , e.emp_name as 'm_name' from employees as e
join employees as m
on e.emp_id = m.manager_id;


-- 13 Find employees who do not have managers.
select emp_name from employees 
where manager_id is null;

-- 14 Find how many employees report to each manager.
select manager_id , count(emp_id)  from employees
group by manager_id;


-- 15 Display manager names with total team salary.
select m.manager_id , sum(m.salary) from employees as e
join employees as m
on e.emp_id = m.manager_id
group by m.manager_id;


-- 16 Display manager names with average team salary.

select m.manager_id , avg(m.salary) from employees as e
join employees as m
on e.emp_id = m.manager_id
group by m.manager_id;


-- 17 Find managers having more than 2 employees reporting to them.
select m.manager_id from employees as e
join employees as m
on e.emp_id = m.manager_id
group by m.manager_id having count(*) > 2;


-- 18 Find managers whose team average salary is greater than 55000.
select m.manager_id , avg(m.salary) from employees as e
join employees as m
on e.emp_id = m.manager_id
group by m.manager_id having avg(m.salary) > 55000;


-- 19 Find managers whose team total salary is greater than 200000.
select m.manager_id , sum(m.salary) from employees as e
join employees as m
on e.emp_id = m.manager_id
group by m.manager_id having sum(m.salary) > 200000;

-- 20 Display all departments even if no employees are assigned to them.
select * from departments as d
left join employees as e
on d.dept_id = e.dept_id;

-- 21 Find employees whose department is NULL.
select * from employees
where dept_id is null;

-- 22 Find departments name having more than 3 employees.

select e.dept_id  , d.dept_name from employees as e
join departments as d
on d.dept_id = e.dept_id
group by e.dept_id having count(e.emp_id) > 3 ;

-- 23 Find departments where total salary is greater than 150000
select e.dept_id , d.dept_name  , sum(e.salary)from employees as e
join departments as d
on d.dept_id = e.dept_id
group by e.dept_id  having sum(e.salary) > 150000; 

-- 24 Find the department name  having the highest average salary.
select  d.dept_name  from employees as e
join departments as d
on e.dept_id  = d.dept_id
group by e.dept_id
order by avg(e.salary) desc limit 1;

-- 25 Display employees along with department names ordered by department name and salary descending.
select emp_name , dept_name  from employees as e
join departments as d
on e.dept_id = d.dept_id
order by d.dept_name , e.salary desc;

-- 26 Find departments where total employees and total salary both are greater than equal to  3 and 150000 respectively.

select d.dept_name , count(*) as 'no_of_employees'  , sum(e.salary)  as total_salary from employees as e 
join departments as d 
on e.dept_id = d.dept_id 
group by e.dept_id  having  count(*) >= 3 and sum(e.salary) > 150000;




