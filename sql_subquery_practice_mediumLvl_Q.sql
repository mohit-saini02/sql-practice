create database if not exists subdb;
use subdb;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(20),
    salary INT,
    manager_id INT,
    hire_year INT,
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

INSERT INTO employees
(emp_id, emp_name, department, salary, manager_id, hire_year)
VALUES
(101, 'Alice Johnson', 'IT', 72000, NULL, 2018),
(102, 'Bob Smith', 'IT', 65000, 101, 2019),
(103, 'Carol White', 'HR', 58000, NULL, 2017),
(104, 'David Brown', 'HR', 54000, 103, 2020),
(105, 'Eva Green', 'Finance', 80000, NULL, 2016),
(106, 'Frank Black', 'Finance', 75000, 105, 2018),
(107, 'Grace Lee', 'IT', 68000, 101, 2021),
(108, 'Henry Wilson', 'Marketing', 60000, NULL, 2017),
(109, 'Ivy Turner', 'Marketing', 56000, 108, 2022),
(110, 'Jack Davis', 'Finance', 70000, 105, 2019),
(111, 'Karen Moore', 'IT', 63000, 101, 2020),
(112, 'Leo Harris', 'HR', 50000, 103, 2021),
(113, 'Mia Clark', 'Marketing', 62000, 108, 2018),
(114, 'Nate Lewis', 'Finance', 78000, 105, 2019),
(115, 'Olivia Walker', 'IT', 71000, 101, 2017),
(116, 'Paul Hall', 'HR', 53000, 103, 2020),
(117, 'Quinn Young', 'Marketing', 59000, 108, 2021),
(118, 'Rachel King', 'Finance', 82000, 105, 2016),
(119, 'Sam Scott', 'IT', 66000, 101, 2022),
(120, 'Tina Adams', 'HR', 55000, 103, 2019);




CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    amount INT,
    order_date DATE,
    status VARCHAR(20)
);

INSERT INTO orders
(order_id, customer_id, product_id, amount, order_date, status)
VALUES
(1001, 201, 301, 1500, '2024-01-05', 'Delivered'),
(1002, 202, 302, 2300, '2024-01-12', 'Delivered'),
(1003, 203, 303, 800, '2024-02-03', 'Delivered'),
(1004, 201, 304, 3200, '2024-02-14', 'Delivered'),
(1005, 204, 301, 1100, '2024-03-01', 'Pending'),
(1006, 205, 302, 4500, '2024-03-15', 'Delivered'),
(1007, 202, 303, 950, '2024-03-22', 'Cancelled'),
(1008, 206, 304, 2100, '2024-04-05', 'Delivered'),
(1009, 203, 301, 1750, '2024-04-18', 'Pending'),
(1010, 207, 302, 3300, '2024-04-30', 'Delivered'),
(1011, 204, 303, 680, '2024-05-10', 'Cancelled'),
(1012, 208, 304, 2900, '2024-05-22', 'Delivered'),
(1013, 205, 301, 1200, '2024-06-08', 'Delivered'),
(1014, 201, 302, 2700, '2024-06-15', 'Pending'),
(1015, 209, 303, 500, '2024-06-28', 'Delivered'),
(1016, 206, 304, 3800, '2024-07-07', 'Delivered'),
(1017, 207, 301, 1600, '2024-07-19', 'Delivered'),
(1018, 210, 302, 4100, '2024-07-25', 'Delivered'),
(1019, 208, 303, 720, '2024-08-02', 'Cancelled'),
(1020, 209, 304, 2200, '2024-08-14', 'Delivered');


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price INT,
    stock_qty INT
);

INSERT INTO products
(product_id, product_name, category, price, stock_qty)
VALUES
(301, 'Laptop', 'Electronics', 55000, 30),
(302, 'Smartphone', 'Electronics', 22000, 80),
(303, 'Headphones', 'Electronics', 3500, 120),
(304, 'Monitor', 'Electronics', 18000, 45),
(305, 'Keyboard', 'Accessories', 1500, 200),
(306, 'Mouse', 'Accessories', 900, 250),
(307, 'Desk Chair', 'Furniture', 8500, 40),
(308, 'Standing Desk', 'Furniture', 22000, 15),
(309, 'Webcam', 'Electronics', 4200, 70),
(310, 'USB Hub', 'Accessories', 1200, 180),
(311, 'Notebook', 'Stationery', 150, 500),
(312, 'Pen Set', 'Stationery', 250, 600),
(313, 'Printer', 'Electronics', 12000, 25),
(314, 'Scanner', 'Electronics', 9000, 20),
(315, 'External SSD', 'Electronics', 7500, 60),
(316, 'Lamp', 'Furniture', 2200, 90),
(317, 'Whiteboard', 'Office Supplies', 3800, 35),
(318, 'Cable Organiser', 'Accessories', 600, 300),
(319, 'Power Bank', 'Electronics', 2800, 100),
(320, 'Smart Watch', 'Electronics', 15000, 55);



CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50),
    join_year INT
);

INSERT INTO customers
(customer_id, customer_name, city, country, join_year)
VALUES
(201, 'Aarav Mehta', 'Mumbai', 'India', 2021),
(202, 'Priya Sharma', 'Delhi', 'India', 2020),
(203, 'Rohan Gupta', 'Pune', 'India', 2022),
(204, 'Sunita Patel', 'Ahmedabad', 'India', 2021),
(205, 'Vikram Rao', 'Bangalore', 'India', 2019),
(206, 'Neha Singh', 'Chennai', 'India', 2023),
(207, 'Arjun Kumar', 'Hyderabad', 'India', 2020),
(208, 'Deepa Nair', 'Kochi', 'India', 2022),
(209, 'Sanjay Joshi', 'Jaipur', 'India', 2021),
(210, 'Meera Iyer', 'Coimbatore', 'India', 2023),
(211, 'Ravi Verma', 'Lucknow', 'India', 2020),
(212, 'Anita Das', 'Kolkata', 'India', 2019),
(213, 'Kiran Reddy', 'Vizag', 'India', 2022),
(214, 'Pooja Shah', 'Surat', 'India', 2021),
(215, 'Amit Bose', 'Nagpur', 'India', 2023),
(216, 'Tara Menon', 'Trivandrum', 'India', 2020),
(217, 'Nikhil Kulkarni', 'Nashik', 'India', 2022),
(218, 'Swati Chatterjee', 'Bhopal', 'India', 2019),
(219, 'Rahul Pandey', 'Patna', 'India', 2021),
(220, 'Divya Tiwari', 'Indore', 'India', 2023);


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30),
    budget INT,
    location VARCHAR(50),
    head_id INT,
    FOREIGN KEY (head_id) REFERENCES employees(emp_id)
);

INSERT INTO departments
(dept_id, dept_name, budget, location, head_id)
VALUES
(1, 'IT', 500000, 'Bangalore', 101),
(2, 'HR', 200000, 'Mumbai', 103),
(3, 'Finance', 600000, 'Delhi', 105),
(4, 'Marketing', 300000, 'Chennai', 108);

show tables;


-- Section 3 — Intermediate Questions  (Q31–Q45) 
-- 31  Using a correlated subquery, find all employees who earn more than the average salary of their own 
-- department. For each qualifying employee, also display their department's average salary (rounded to 2 decimal 
--  places). Order by department, then salary descending. 

select e.emp_name , e.department , e.salary , round((select avg(salary) from employees where department = e.department),2) as 'Avg_salary_dept' from employees as e
where salary > (select avg(salary) from employees 
				where department = e.department)
order by e.department , e.salary desc;

 
-- Q32.  For every employee, use a correlated subquery to count how many other employees in the same department 
-- earn strictly more than them. Display emp_name, department, salary, and this count as 'higher_earners'. Order by 
-- department, salary descending. 

select e.emp_name , e.department , e.salary , 
(select count(*) from employees 
where salary > e.salary and department = e.department ) as 'higher_earners'
from employees as e
order by department , e.salary desc;


-- Q33.  Using a correlated subquery inside the WHERE clause, find all customers whose total order spend (sum of all 
-- their order amounts) is greater than the average total spend per customer across all ordering customers. Display 
-- customer_id, customer_name, and total_spend. Order by total_spend descending. (Compute per-customer total and 
-- the overall average both via subqueries — no window functions.) 

--    --------------Pending____________

-- Q34.  Using a subquery in the WHERE clause with IN and a GROUP BY / HAVING inside the subquery, find all 
-- employees who belong to departments where the average salary of the department is greater than 65,000. Return 
-- emp_name, department, and salary, ordered by department and salary descending. 

select * from employees 
where department in (select department  from employees
						group by department having avg(salary) > 65000)
order by department , salary desc;


-- Q35.  For every row in the orders table, use a correlated subquery inside a CASE expression to label each order as 
-- 'Above Avg' if its amount is greater than or equal to that customer's own average order amount, and 'Below Avg' 
-- otherwise. Show order_id, customer_id, amount, and the label as 'vs_cust_avg'. Order by customer_id, order_id. 

select o.order_id , o.customer_id , o.amount ,
case
when  (o.amount >= (select avg(amount) from orders 
					where customer_id = o.customer_id)) then 'Above_avg'
else 'Below_avg'
end as 'vs_cust_avg'
from orders as o
order by customer_id , order_id;


-- Q36.  Using a correlated subquery, find all products whose price is greater than the average price of other products 
-- in the same category. Display product_name, category, price, and the category average (rounded to 2 decimals) as 
-- 'cat_avg'. Order by category, price descending. 


select product_name  , category , price , round((select avg(price) from products where category = p.category ),2) as 'cat_avg' from products as p
where price > (select avg(price) from products 
					where category = p.category)
order by category , price desc;

-- Q37.  Find all employees whose salary is greater than the salary of AT LEAST ONE employee in the Marketing 
-- department. Use ANY (or equivalently, > MIN of Marketing salaries). Return emp_name, department, and salary 
-- ordered by salary descending. Note: Ivy Turner (56,000) is the lowest-paid Marketing employee — so all employees 
-- earning above 56,000 qualify. 
select * from employees 
where salary > (select min(salary) from employees 
				where department = 'Marketing')
order by salary desc;

-- Q38.  Find all employees whose salary is less than the salary of EVERY employee in the Finance department. In 
-- other words, their salary must be below even the minimum Finance salary (70,000). Use ALL (or < MIN of Finance). 
-- Return emp_name, department, and salary ordered by salary descending. 

select emp_name , department , salary from employees 
where salary <all(select salary from employees
					where department = 'Finance')
order by salary desc;



-- Q39.  Find customers who have placed at least one order AND whose every order has status = 'Delivered' (i.e., they 
-- have no Cancelled or Pending orders). Use a combination of EXISTS and NOT EXISTS. Return customer_id and 
-- customer_name ordered by customer_id.

select customer_id , customer_name from customers as c
where exists (select 1 from orders where customer_id = c.customer_id )
and not exists(select 1 from orders where customer_id = c.customer_id and status <> 'Delivered')
order by customer_id;

-- Q40.  Using nested IN subqueries, find all products that were ordered by at least one customer from the city of 
-- Mumbai. First find customer_ids from Mumbai, then find product_ids ordered by those customers, then return the 
-- product details. Show product_id, product_name, and category, ordered by product_id. 

select product_id , product_name , category from products 
where product_id in (select product_id from orders 
					where customer_id in (select customer_id from customers
										where city = 'Mumbai'))
order by product_id;


-- Q.41
 select emp_name,department,salary from employees 
 where salary = (select max(salary) from employees where salary <
 (select max(salary) from employees));

-- Q42.  Using NOT EXISTS, find all departments where every single employee earns strictly more than 50,000. (i.e., 
-- there is no employee in that department with salary <= 50,000.) Return just the department name, ordered 
-- alphabetically. Note: Leo Harris in HR earns exactly 50,000, so HR does not qualify. 

select distinct department from employees as e
where not exists (select 1 from employees 
					where salary <= 50000 and department = e.department)
order by department;



 
-- Q.43
select c.customer_id,c.customer_name from customers c
join orders o
on c.customer_id=o.customer_id
where c.customer_id in(select customer_id from orders group by customer_id
having count(*)>=2)
group by c.customer_id
order by c.customer_id;

 -- Q.44
 select emp_name,department,salary,hire_year,
 (select avg(salary) from employees where hire_year=e.hire_year) as year_avg
 from employees e
having salary > year_avg
 order by hire_year;
 
 -- Q.45
 select product_name,category,stock_qty,
 (select avg(stock_qty) from products where category=p.category) as cat
 from products as p
 having stock_qty < cat
 order by category,stock_qty;


