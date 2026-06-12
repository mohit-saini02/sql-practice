
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



-- 2.  Find all managers who have more than one direct report earning above the average salary of their own 
-- department. Show the manager's name, department, and the count of such high-earning direct reports. Sort by count 
-- descending. 

--     ------Pending------------------------

-- Q3.  For employees who are assigned to more than one project, show their name, department, number of projects, 
-- total hours logged across all projects, and their rank within their department based on total hours (highest hours = rank 
-- 1). Order by department and rank. 
with cte as 
(select e.emp_id , e.emp_name , e.department , count(*) as 'project_count',
sum(ep.hours_logged) as 'total_hours'
from employees as e
join emp_projects as ep
on e.emp_id = ep.emp_id
group by e.emp_id , e.department having count(*) > 1)

select emp_name , department , project_count,total_hours,
rank() over(partition by department order by total_hours desc) as 'dept_rank'
from cte
order by department , dept_rank;





-- Q4.  For each project, calculate the total hours logged by all assigned employees, the total hours logged across all 
-- projects in the same department, and each project's share of those departmental hours as a percentage rounded to 2 
-- decimal places. Order by department and percentage descending. 
with cte as(
select p.project_id , p.project_name , p.department , sum(ep.hours_logged) as 'project_hours'
  from projects as p
join emp_projects as ep
on p.project_id = ep.project_id
group by p.project_id),

cte2 as 
(select project_id, sum(hours_logged) over(partition by department) from e)
select * from cte2;


-- Q9.  Find all employees whose total sales amount is greater than the company-wide average total sales per 
-- employee. Show their name, department, and total sales. Order by total sales descending. 

with cte as (
select  e.emp_id , e.emp_name , e.department , sum(s.amount) as 'total_sales'
from employees as e
join sales as s
on e.emp_id = s.emp_id
group by e.emp_id , department)

select emp_name , department , total_sales from cte
where total_sales > (select avg(total_sales) from cte)
order by total_sales desc;
