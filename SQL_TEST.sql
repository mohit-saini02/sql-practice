
create database sqltestdb;
use sqltestdb;

-- Table 1: employees
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT,
    hire_date DATE
);

-- Table 2: projects
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department VARCHAR(50),
    budget INT,
    start_date DATE,
    end_date DATE
);

-- Table 3: emp_projects
CREATE TABLE emp_projects (
    emp_id INT,
    project_id INT,
    role VARCHAR(50),
    hours_logged INT,
    PRIMARY KEY (emp_id, project_id)
);

-- Table 4: sales
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    sale_date DATE,
    amount INT,
    region VARCHAR(50)
);

-- -------------------------- Data Insertion -----------------------------------------


INSERT INTO employees (emp_id, emp_name, department, manager_id, salary, hire_date) VALUES
(101, 'Alice', 'Engineering', 102, 85000, '2019-03-15'),
(102, 'Bob', 'Engineering', 105, 95000, '2017-07-01'),
(103, 'Carol', 'Marketing', 106, 72000, '2020-01-10'),
(104, 'David', 'Engineering', 102, 78000, '2021-06-20'),
(105, 'Eve', 'Engineering', NULL, 120000, '2015-11-05'),
(106, 'Frank', 'Marketing', 105, 88000, '2018-09-30'),
(107, 'Grace', 'HR', 105, 65000, '2022-02-14'),
(108, 'Henry', 'HR', 106, 68000, '2021-08-01'),
(109, 'Irene', 'Marketing', 106, 75000, '2019-05-22'),
(110, 'James', 'Engineering', 102, 82000, '2020-11-11');

INSERT INTO projects (project_id, project_name, department, budget, start_date, end_date) VALUES
(201, 'Alpha Launch', 'Engineering', 500000, '2023-01-01', '2023-06-30'),
(202, 'Beta Platform', 'Engineering', 750000, '2023-04-01', '2024-03-31'),
(203, 'Market Blitz', 'Marketing', 300000, '2023-02-01', '2023-08-31'),
(204, 'HR Revamp', 'HR', 150000, '2023-03-01', '2023-12-31'),
(205, 'Cloud Migration', 'Engineering', 900000, '2023-07-01', '2024-06-30'),
(206, 'Brand Refresh', 'Marketing', 250000, '2023-09-01', '2024-02-28'),
(207, 'Talent Pipeline', 'HR', 200000, '2024-01-01', '2024-09-30');


INSERT INTO emp_projects (emp_id, project_id, role, hours_logged) VALUES
(101, 201, 'Developer', 320),
(101, 202, 'Lead', 480),
(102, 201, 'Architect', 200),
(102, 205, 'Lead', 600),
(103, 203, 'Designer', 200),
(103, 206, 'Designer', 180),
(104, 202, 'Developer', 400),
(104, 205, 'Developer', 350),
(105, 201, 'Reviewer', 100),
(105, 202, 'Architect', 300),
(105, 205, 'Architect', 250),
(106, 203, 'Campaign Lead', 280),
(106, 206, 'Lead', 320),
(107, 204, 'Coordinator', 240),
(107, 207, 'Lead', 300),
(108, 204, 'Analyst', 180),
(108, 207, 'Analyst', 260),
(109, 203, 'Analyst', 150),
(110, 202, 'Developer', 420),
(110, 205, 'Lead', 500);



INSERT INTO sales (sale_id, emp_id, sale_date, amount, region) VALUES
(1, 101, '2023-01-15', 18000, 'North'),
(2, 104, '2023-01-22', 25000, 'South'),
(3, 101, '2023-02-10', 22000, 'North'),
(4, 110, '2023-02-18', 32000, 'East'),
(5, 104, '2023-03-05', 28000, 'South'),
(6, 101, '2023-03-25', 15000, 'West'),
(7, 110, '2023-04-08', 38000, 'East'),
(8, 104, '2023-04-20', 30000, 'North'),
(9, 101, '2023-05-12', 24000, 'North'),
(10, 110, '2023-05-28', 42000, 'East'),
(11, 106, '2023-06-10', 35000, 'South'),
(12, 103, '2023-06-22', 20000, 'West'),
(13, 109, '2023-07-05', 27000, 'North'),
(14, 106, '2023-07-18', 40000, 'South'),
(15, 103, '2023-08-02', 23000, 'West'),
(16, 109, '2023-08-15', 31000, 'East'),
(17, 106, '2023-09-10', 45000, 'South'),
(18, 109, '2023-09-25', 29000, 'North'),
(19, 110, '2023-10-05', 36000, 'East'),
(20, 104, '2023-10-18', 33000, 'South');


-- Q1.  For each department, find the employee with the second highest salary. Display the department, employee 
-- name, and their salary. If a department does not have a second distinct salary level, it should still 
-- appear if a second  employee exists at any rank. 

start transaction;
update  employees
set salary = 65000
where emp_id = 108;

with cte as(
select * , dense_rank() over(partition by department  order by salary desc) as 'rnk', 
row_number() over(partition by department order by salary desc) as 'rownum' from employees)

select emp_name , department , salary from cte 
where (rnk = 2 and rownum >=2) or (rnk < 2 and rownum>=2);
rollback;
select * from employees;

-- Q2.  Find all managers who have more than one direct report earning above the average salary of their own 
-- department. Show the manager's name, department, and the count of such high-earning direct reports. Sort by count 
-- descending.

with manager as (
select 
e.emp_id,
e.emp_name,
e.salary,
m.emp_id as 'm_id',
m.emp_name as 'm_name',
m.department as 'm_department'
 from employees as e
join employees as m
on e.manager_id = m.emp_id
),

dept_avg as 
(select emp_id , avg(salary) over(partition by department) as 'd_avg' from employees
)
select m.m_name ,m.m_department , count(*) 'high_earning_reports'from manager as m
join dept_avg as da
on m.emp_id = da.emp_id
where m.salary > da.d_avg
group by m.m_id , m.m_name, m.m_department having count(*) > 1;

-- Q3.  For employees who are assigned to more than one project, show their name, department, number of projects, 
-- total hours logged across all projects, and their rank within their department based on total hours (highest hours = rank 
-- 1). Order by department and rank. 

with cte as 
(
select e.emp_name , e.department , count(*) as'project_count',
sum(ep.hours_logged) as 'total_hours'
 from emp_projects as ep
join employees as e
on e.emp_id = ep.emp_id
group by ep.emp_id , e.department having project_count > 1)
select * , rank() over(partition by department order by total_hours desc) as 'rnk' from cte
order by department , rnk;

-- Q4.  For each project, calculate the total hours logged by all assigned employees, the total hours logged across all 
-- projects in the same department, and each project's share of those departmental hours as a percentage rounded to 2 
-- decimal places. Order by department and percentage descending.
with cte as (
select p.project_name,p.department , sum(ep.hours_logged) as 'project_hours'
from projects as p
join  emp_projects as ep
on p.project_id = ep.project_id
group by p.project_id , p.project_name , p.department)

select *,sum(project_hours) over(partition by department ) as 'dept_total_hours',
round((project_hours / sum(project_hours) over(partition by department ))*100,2) as 'pct_of_dept'
 from cte
 order by department , pct_of_dept desc;

-- Q5.  For each region, show the total sales per month (only months that have sales), the previous month's total sales 
-- for that region, and the month-over-month change in sales. Months with no previous data should show NULL. Order 
-- by region and month. .

with cte as (
select region , date_format(sale_date,'%Y-%m-01') as 'sale_month' ,
sum(amount) as 'monthly_sales'
 from sales
group by region , date_format(sale_date,'%Y-%m-01'))

select * , lag(monthly_sales) over(partition by region ) as 'prev_month_sales' ,
(monthly_sales -(lag(monthly_sales) over(partition by region ))) as 'mom_change' 
from cte
order by region , sale_month;


--  
-- Q6.  Find all employees whose salary is greater than the salary of every single employee in the HR department. 
-- Display their name, department, and salary. Sort by salary descending. 

select emp_name , department , salary from employees 
where salary >all(select salary from employees 
					where department = 'HR')
order by salary desc;


--   
-- Q7.  For each combination of employee and region where they made sales, calculate their total sales in that region. 
-- Then divide the employees in each region into 3 tiers based on their total sales (tier 1 = highest). Display employee 
-- name, region, total sales, and their performance tier. Order by region and tier. 

with cte as (
select e.emp_name  , s.region  , sum(s.amount) as 'total_sales' from employees as e
join sales as s
on e.emp_id  = s.emp_id
group by e.emp_name  , s.region)

select * , row_number() over(partition by region order by total_sales desc) as 'performance_tier' from cte
order by region , performance_tier;


--   
-- Q8.  Find all pairs of employees within the same department whose salaries differ by less than 10,000. For each pair 
-- show both employee names (in alphabetical order by first name), their department, their respective salaries, and the 
-- absolute salary difference. Order by department and salary difference. 

with cte as(
 select e1.emp_name as 'emp1' , e2.emp_name as 'emp2',e1.department as 'department', e1.salary as 'sal_1' , e2.salary as sal_2  from employees as e1
 join employees as e2 
 on e1.department = e2.department
 where e1.emp_name < e2.emp_name)
 
 select *,abs(sal_1 - sal_2) as 'sal_diff' from cte
 where abs(sal_1 - sal_2) < 10000
 order by department , sal_diff;
 
-- Q9.  Find all employees whose total sales amount is greater than the company-wide average total sales per 
-- employee. Show their name, department, and total sales. Order by total sales descending. 

with cte as (
select e.emp_name, e.department , sum(s.amount) as 'total_sales' from employees as e
join sales as s
on e.emp_id = s.emp_id
group by e.emp_id , e.emp_name , e.department)

select *  from cte
where total_sales > (select avg(total_sales) from cte)
order by total_sales desc;

-- Q10.  For each employee, show their name, department, salary, total hours logged across all their project 
-- assignments, and the number of projects they are assigned to. Employees with no project assignments should appear 
-- with 0 for both hours and project count. Order by project count ascending, then by total hours ascending.

select e.emp_name , e.department , e.salary , count(*) as 'project_count',
sum(ep.hours_logged) as 'total_hours'
 from employees as e
left join emp_projects as ep
on e.emp_id  = ep.emp_id
group by e.emp_name , e.department , e.salary
order by project_count , total_hours;






