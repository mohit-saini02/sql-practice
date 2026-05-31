use sakila;
select * from employees;
# if (condition , True statement , false statement)

select first_name , department ,salary ,if(department = "IT" , True , False) from employees;

select first_name , department ,salary ,if(department = "IT" , salary*1.1 , salary*1.05) from employees;

-- if inside if:
select first_name , department ,salary ,if(department = "IT" , salary*1.1 , if(department = 'HR' , salary*1.05 ,salary)) from employees;

/* case statement: 

select col1 , col2,
case 
	when condition  then statement
    else
end
from table_name
*/
#ex: 
 select first_name , department , salary ,
 case
	when department = 'IT' then True
    else  'Non IT'
end
from employees;

#ex_2:
select first_name , department , salary , 
case 
	when department = 'IT' or department = 'HR' then 'A category'
    else 'B category'
end 
from employees;

## Ex : 3
select first_name , department , salary , 
case 
	when department = 'IT' then salary*1.1
    when department = 'HR' then salary*1.05
    else salary
end  as 'new_salary'
from employees;


-- Que. if the hirirng data of an employee is before 2020 then
--  print --> sr. job_title  elif year 2021 print --> Associate job_title 
-- else jobtitle

select first_name , department , year(hire_date),
case 
	when year(hire_date) < 2020 then concat('Senior ',job_title)
	when year(hire_date) <= 2021 then concat('Associate ' , job_title)
    else job_title
end as 'job_title'
from employees;

-- ## Que. if the salary is greater than  70k create the category name as avg_salary if the salaray is greater than so print --> High_salary
-- if salary > 100000 then extreme High salary , therwise wise print --> low salary 

Select first_name ,department , salary,
case
	when salary > 100000 then 'Extreme_high_salary'
    When salary > 85000 then 'High_salary'
    When salary > 70000 then 'AVG_salary'
    else 'Low_salary'
end as 'Category'
from employees;

-- Que. select the job_title and print the column value based on the following condition : 
--  job_title has n persons

select  job_title , count(*) ,
case
	when count(*)>1 then concat(job_title , ' have ' , count(job_title) , ' persons')
    when count(*) = 1 then concat(job_title , ' have ' ,count(job_title) , ' person')
end as 'How_many_persons'
from employees
group by job_title
;


-- learning : what is super key , primary key , foreign key .
--            what is normalization and 1-nf  ? 



