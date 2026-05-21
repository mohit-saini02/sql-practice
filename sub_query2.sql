use shadidb;
CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT
);
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);

select * from employees;


-- 
select salary from employees
where emp_id = 101;

-- department  ya to alice ka ho  ya bob ka .  vo employees btaoo? 
;

select * from employees
where department in (select department from employees
					  where name = 'Alice' or name = 'Bob');
-- Que. employees those salary is not same as the emp_id of 103 or 107 ? 

select * from employees
where salary not in (select salary from employees
						where emp_id = 103 or emp_id = 107);
-- Que. employees those salary is greater than emp_id 103 and 107 ? 


select * from employees 
where salary > any( select salary from employees
					where emp_id = 103 or emp_id = 107);
                    
-- 

select * from employees
where salary >any (select salary from employees
						where department = 'HR');
                        
-- 
select * from employees
where salary >all (select salary from employees
					where department = 'HR');

-- _________________________________________________________________________________________________________________________________________________________


-- QUE. find the employee details who works in IT department and have the salary greater than the salary of
--    emp_id 101 ? 

select * from employees 
where department = 'IT' and salary > (select salary from employees
										where emp_id = 101);
-- QUE> find the name of a person whose salary is greater than all the salaries of the HR or IT department 

select name from employees
where salary >all(select salary from employees
					where department = 'IT' or department = 'HR');

-- QUE> find the emp_id and emp_name of the employees whose salary is greater than 
-- the salary of any employee working under the manager id 101 ? 

select emp_id  , name  from employees
where salary >any (select salary from employees
						where manager_id  = 101);

-- QUE : find the second highest salary in this table  ? 
select salary from employees order by salary desc limit 1,1;

select max(salary) from employees
where salary < (select max(salary) from employees);






