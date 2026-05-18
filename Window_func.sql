use shadidb;
select * from employees;
select emp_id , name , salary ,sum(salary) over() , concat(round((salary / (sum(salary) over())* 100 )) ,'%')  from employees;

select emp_id , name , salary , sum(salary) over(order by salary) from employees;