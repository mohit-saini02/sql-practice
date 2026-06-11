use subdb;

show tables;


-- Basic Level (20 Questions)
-- ROW_NUMBER()
-- Har department ke employees ko salary descending ke hisaab se row number do.
select emp_name , department ,salary, row_number() over(partition by department order by salary desc) from employees;
-- Har customer ke orders ko order_date ke hisaab se row number do.
select order_id , customer_id , order_date , row_number() over(partition by customer_id order by order_date) from orders;
-- Har category ke products ko price descending ke hisaab se row number do.
select product_id , product_name , category , price , row_number() over(partition by category order by price desc) from products;
-- Har department me hire_year ascending ke hisaab se employees ko row number do.
select * , row_number() over(partition by department order by hire_year) from employees;
-- Delivered orders ko amount descending ke hisaab se row number do.
select * , row_number() over(order by amount desc) from orders
where status =  'delivered';

-- RANK()
-- employees me salary rank nikalo.
select emp_name , salary , rank() over(order by salary desc) from employees;
-- Har department me salary rank nikalo.
select emp_name , department , salary , rank() over(partition by department order by salary desc) from employees;
-- Har category me product price rank nikalo.
select product_id , product_name , category , price , rank() over(partition by category order by price) from products;
-- Orders ko amount ke basis par rank do.
select order_id , amount , rank() over(order by amount desc) from orders;

-- Customers ko total spend ke basis par rank do.
select order_id , customer_id ,amount , sum(amount) over(partition by customer_id) from orders;
-- DENSE_RANK()
-- department wise salary dense rank nikalo.
select emp_name , department , salary , dense_rank() over(partition by department order by salary desc) from employees;


-- Products ko category-wise dense rank do.
select product_name , category , price, dense_rank() over(partition by category order by price ) from products ;
-- Customers ko order count ke basis par dense rank do
with o_count as
		(select customer_id , count(*) as 'total_count' from orders group by customer_id)
select  customer_id , total_count , dense_rank() over(order by total_count) from o_count;
