CREATE DATABASE groupdb;

USE groupdb;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary INT,
    experience INT,
    gender VARCHAR(10),
    joining_date DATE
);
INSERT INTO employees VALUES
(1, 'Aman', 'HR', 'Delhi', 35000, 2, 'Male', '2021-03-15'),
(2, 'Priya', 'IT', 'Mumbai', 60000, 5, 'Female', '2019-07-10'),
(3, 'Rohit', 'Finance', 'Delhi', 50000, 4, 'Male', '2020-01-25'),
(4, 'Sneha', 'IT', 'Pune', 75000, 7, 'Female', '2018-06-11'),
(5, 'Karan', 'HR', 'Mumbai', 40000, 3, 'Male', '2022-02-18'),
(6, 'Neha', 'Finance', 'Delhi', 52000, 5, 'Female', '2019-11-30'),
(7, 'Vikas', 'Sales', 'Pune', 45000, 2, 'Male', '2021-08-05'),
(8, 'Anjali', 'Sales', 'Mumbai', 47000, 3, 'Female', '2020-09-17'),
(9, 'Rahul', 'IT', 'Delhi', 80000, 8, 'Male', '2017-04-21'),
(10, 'Pooja', 'HR', 'Pune', 39000, 2, 'Female', '2023-01-10'),
(11, 'Arjun', 'Finance', 'Mumbai', 55000, 6, 'Male', '2018-12-01'),
(12, 'Meera', 'Sales', 'Delhi', 48000, 4, 'Female', '2021-05-14'),
(13, 'Suresh', 'IT', 'Mumbai', 72000, 6, 'Male', '2019-03-19'),
(14, 'Kavita', 'HR', 'Delhi', 36000, 1, 'Female', '2023-07-22'),
(15, 'Manoj', 'Sales', 'Pune', 46000, 3, 'Male', '2020-10-28');


select * from employees;

-- GROUP BY Practice Questions
-- Basic GROUP BY Questions
-- 1. Find the total number of employees in each department.

select department , count(*) from employees 
group by department;

-- 2. Find the average salary of each department.
select department , avg(salary) from employees
group by department;

-- 3 Find the highest salary in each city.
select city , max(salary) from employees
group by city ;

-- 4.Find the minimum salary department-wise.
select department , min(salary) from employees
group by department;

-- 5.  Find total salary paid in each city.
select city , sum(salary) from employees
group by city ;

-- 6 Count how many male and female employees are there.
select gender , count(*) from employees
group by gender;

-- 7. Find average experience of employees in each department.
select department , avg(experience) from employees
group by department;

-- 8. Find number of employees joined in each year.
select year(joining_date ), count(*) from employees
group by year(joining_date);

-- 9.Find total employees working in each city.
select city , count(*) from employees
group by city;

-- 10.Find department-wise total experience.
select department , sum(experience) from employees
group by department;

-- 11.

-- Find city-wise average salary.
select city , avg(salary) from employees
group by city;

-- 12.

-- Find gender-wise maximum salary.
select gender , max(salary) from employees
group by gender;
-- 13.

-- Find department-wise minimum experience.
select department , min(salary) from employees
group by department;

-- 14.

-- Find city-wise total salary and average salary.
select city , sum(salary) , avg(salary) from employees
group by city;
-- 15.

-- Find the number of employees in each department and city combination.
select department, city , count(*) from employees
group by department , city;

-- GROUP BY + HAVING Questions
-- 16. Find departments having more than 3 employees.
select department from employees 
group by department having count(*) > 3;

-- 17 Find cities where average salary is greater than 51000.
select city  , avg(salary) from employees
group by city having avg(salary) > 51000; 
-- 18. Find departments whose total salary is greater than 150000.
select department from employees
group by department having sum(salary) > 150000;
-- 19.Find cities having less than 5 employees.
select city , count(*)from employees
group by city having count(*) < 5;
-- 20.Find departments where maximum salary is greater than 70000.
select department from employees
group by department having max(salary) > 70000;
-- 21. Find departments whose average experience is more than 4 years.
select department from employees 
group by department having avg(experience) > 4;

-- 22.Find gender groups where total salary is greater than 200000.
select gender from employees
group by gender having sum(salary) > 200000;

-- 23.Find department-city combinations having more than 1 employee.
select department , city from employees
group by department , city having count(*) > 1;

-- 24.Find cities where minimum salary is less than 40000.
select city from employees
group by city having min(salary) < 40000;

-- 25. Find departments where total employees are between 2 and 5.
select department from employees
group by department having count(*) between 2 and 5;