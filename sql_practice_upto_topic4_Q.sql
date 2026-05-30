create database if not exists practicedb;
use practicedb;

-- Create Orders Table

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    amount DECIMAL(10,2),
    order_date DATE
);
-- Insert Data

INSERT INTO orders (order_id, customer_id, product_id, amount, order_date) VALUES
(1001, 201, 301, 1500, '2024-01-05'),
(1002, 202, 302, 2300, '2024-01-12'),
(1003, 203, 303, 800, '2024-02-03'),
(1004, 201, 304, 3200, '2024-02-14'),
(1005, 204, 301, 1100, '2024-03-01'),
(1006, 205, 302, 4500, '2024-03-15'),
(1007, 202, 303, 950, '2024-03-22'),
(1008, 206, 304, 2100, '2024-04-05'),
(1009, 203, 301, 1750, '2024-04-18'),
(1010, 207, 302, 3300, '2024-04-30'),
(1011, 204, 303, 680, '2024-05-10'),
(1012, 208, 304, 2900, '2024-05-22'),
(1013, 205, 301, 1200, '2024-06-08'),
(1014, 201, 302, 2700, '2024-06-15'),
(1015, 209, 303, 500, '2024-06-28'),
(1016, 206, 304, 3800, '2024-07-07'),
(1017, 207, 301, 1600, '2024-07-19'),
(1018, 210, 302, 4100, '2024-07-25'),
(1019, 208, 303, 720, '2024-08-02'),
(1020, 209, 304, 2200, '2024-08-14');


-- Create Products Table

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2),
    stock_qty INT
);
-- Insert Data

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

-- Create Customers Table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50),
    join_year INT
);

-- Insert Data

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


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    manager_id INT
);

INSERT INTO employees
(emp_id, emp_name, department, salary, manager_id)
VALUES
(101, 'Alice Johnson', 'IT', 72000, NULL),
(102, 'Bob Smith', 'IT', 65000, 101),
(103, 'Carol White', 'HR', 58000, NULL),
(104, 'David Brown', 'HR', 54000, 103),
(105, 'Eva Green', 'Finance', 80000, NULL),
(106, 'Frank Black', 'Finance', 75000, 105),
(107, 'Grace Lee', 'IT', 68000, 101),
(108, 'Henry Wilson', 'Marketing', 60000, NULL),
(109, 'Ivy Turner', 'Marketing', 56000, 108),
(110, 'Jack Davis', 'Finance', 70000, 105),
(111, 'Karen Moore', 'IT', 63000, 101),
(112, 'Leo Harris', 'HR', 50000, 103),
(113, 'Mia Clark', 'Marketing', 62000, 108),
(114, 'Nate Lewis', 'Finance', 78000, 105),
(115, 'Olivia Walker', 'IT', 71000, 101),
(116, 'Paul Hall', 'HR', 53000, 103),
(117, 'Quinn Young', 'Marketing', 59000, 108),
(118, 'Rachel King', 'Finance', 82000, 105),
(119, 'Sam Scott', 'IT', 66000, 101),
(120, 'Tina Adams', 'HR', 55000, 103);

select * from employees;
select * from orders;
select * from products;
select * from customers;


-- ___________________________ Topic - 3 : 
-- 1
select e.emp_name  , ifnull(m.emp_name , 'No Manager') as 'manager_name' from employees as e
left join employees as m
on e.manager_id = m.emp_id;


-- 2
select e.emp_name , e.salary , m.emp_name , m.salary from employees as e
join employees as m
on e.manager_id = m.emp_id
where e.salary > m.salary;

-- Q3. List all employees who are managed by 'Alice Johnson', showing the employee name and their department. 

select e.emp_name , e.department from employees as e
join employees as m 
on e.manager_id = m.emp_id
where m.emp_name = 'Alice Johnson';

-- Using sub query : 

-- select emp_name , department from employees
-- where manager_id = (select emp_id from employees
-- where emp_name  = 'Alice Johnson');

-- 4
select m.emp_name ,m.department, count(*) as 'team_size' , avg(e.salary) from employees as e
join employees as m 
on e.manager_id = m.emp_id
group by m.emp_id  , m.department;

-- 5
select e1.emp_name as 'emp1' , e2.emp_name as 'emp2' , e.department , (e1.salary - e2.salary) as 'diffsalary' from employees as e
join employees as e2
on e1.department = e2.department
where e.emp_name <> .emp_name  and e.department = m.department;

-- 5 

-- -----------------------TOPIC - 4
-- 1

select emp_name ,department, salary from employees
where salary > (select avg(salary) from employees);

-- 2

select * from employees
where salary = (select max(salary) from employees );

-- List all products whose price is greater than the average price of all products in the 'Electronics' 
-- category. 

select * from products 
where price > (select avg(price) from products 
where category = 'Electronics');

-- 4. Find all employees in the same department as the employee with the highest salary. Exclude that 
-- top-earner from the results. 

select * from employees 
where department = (select department from employees
order by salary desc limit 1) and salary < (select max(salary) from employees);

select emp_id  , emp_name , department , salary from employees 
where department = (select department from employees
where salary = (select max(salary) from employees)) and salary < (select max(salary) from employees);


-- 5
select order_id , customer_id , amount from orders
where  amount > (select avg(amount) from orders);










 


