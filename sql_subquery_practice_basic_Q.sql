use subdb;
-- Q.1
select emp_name,department,salary from employees
where salary > (select avg(salary) from employees)
order by salary desc;

-- Q.2
select emp_id,emp_name,department,salary from employees
where salary = (select max(salary) from employees);

-- Q.3
select emp_id,emp_name,department,salary from employees
where salary = (select min(salary) from employees);

-- Q.4
select emp_name,department,hire_year from employees 
where  hire_year = (select hire_year from employees 
where emp_name='Rachel king') and
emp_name != 'Rachel king';

-- Q.5
select product_name,category,price from products
where price > (select avg(price) from products)
order by price desc;

-- Q.6
select product_id,product_name,category,price from products
where price = (select max(price) from products);

-- Q.7
select product_id,product_name,category,price from products
where price = (select min(price) from products);

-- Q.8
select order_id,customer_id,amount from orders
where amount > (select avg(amount) from orders)
order by amount desc;

-- Q.9
select order_id,customer_id,amount,order_date from orders
where amount = (select max(amount) from orders);

-- Q.10
select customer_id,customer_name,city from customers
where customer_id in (select customer_id from orders 
group by customer_id
having count(customer_id)>=1);

-- Q.11
select customer_id,customer_name,city from customers
where customer_id not in (select customer_id from orders 
group by customer_id
having count(customer_id)>=1);

-- Q.12
select product_id,product_name,category,price from products
where product_id in (select product_id from orders 
group by product_id having count(customer_id) >= 1);

-- Q.13
select product_id,product_name,category,price from products
where product_id not in (select product_id from orders 
group by product_id having count(customer_id) >= 1);

-- Q.14
select emp_name,salary from employees where salary in
( select salary from employees where department='Finance')
order by salary desc;

-- Q.15
select emp_name,department,salary from employees
where salary < (select min(salary) from employees
where department='Finance') 
order by salary desc;

-- Q.16
select dept_name,budget,location from departments 
where budget = (select max(budget) from departments);

-- Q.17
select customer_id,customer_name,city from customers
where customer_id = (select customer_id from orders 
group by customer_id 
having count(customer_id)=1);

-- Q.18
select customer_id,customer_name,city from customers
where customer_id in (select customer_id from orders 
group by customer_id 
having count(customer_id)>=2);

-- Q.19
select product_name,category,price from products
where price > (select max(price) from products where category='Accessories')
order by price desc;

-- Q.20
select order_id,customer_id,amount,order_date from orders
where customer_id in (select customer_id from customers 
where join_year=2021);

-- Q.21
select emp_id,emp_name,department from employees as e
where exists (select 1 from employees m where m.manager_id=e.emp_id);

-- Q.22
select emp_id,emp_name,department from employees as e
where not exists (select 1 from employees m where m.manager_id=e.emp_id);

-- Q.23
select customer_id,customer_name,city from customers as c
where exists (select customer_id from orders as o
where c.customer_id=o.customer_id);

-- Q.24
select customer_id,customer_name,city from customers as c
where not exists (select 1 from orders as o
 where  c.customer_id=o.customer_id);
 
 -- Q.25
 select product_id,product_name,category from products as p
 where exists (select 1 from orders as o where  p.product_id=o.product_id);
 
 -- Q.26
 select emp_name,department,salary from employees
 where department = (select department from employees where emp_id=105)
 and emp_id!=105 
 order by salary desc;
 
 -- Q.27
 select order_id,customer_id,amount,order_date from orders 
 where order_date = (select max(order_date) from orders);
 
 -- Q.28
 select order_id,customer_id,amount,order_date from orders
 where order_date = (select min(order_date) from orders);
 
 -- Q.29
 select emp_name,department,salary from employees where salary >all
( select salary from employees where department='HR')
order by salary desc;

-- Q.30
select * from orders where amount>(select avg(amount) from orders 
where status='Delivered') and status='Delivered'
order by amount desc;