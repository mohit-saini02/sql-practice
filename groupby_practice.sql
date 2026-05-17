use sakila;
show tables;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10),
    Category VARCHAR(20),
    OrderDate DATE,
    OrderValue DECIMAL(10,2)
);



INSERT INTO Orders VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),
(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),
(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800);


-- -------- LEVEL - 1
-- Q1. Total Revenue per Category
select category , sum(OrderValue) as 'Total_revenue' from orders
group by Category
order by sum(OrderValue) desc;

-- Q2. Total Orders per Category
select category , count(OrderID) as 'Total_orders'from orders
group by category;

-- Q3. Max Order Value per Category
select category, max(OrderValue) as 'max_order-value' from orders
group by category;

-- ---------------LEVEL-2_________________

-- Q1. Unique Categories
select distinct(category) from orders;

-- Q2. Unique CustomerIDs

select distinct(customerID) from orders;

-- Q3. Unique Customer + Category Combinations

select distinct customerID , category from orders;

-- --------------LEVEL -  3____________________

-- Q1. Revenue by CustomerID and Category

select customerID , category , sum(OrderValue) from orders
group by CustomerID , category;

--  Q2. Order Count by CustomerID and Category

select customerID , category , count(OrderValue) from orders
group by CustomerID , category;

-- Q3. Revenue by Category and Month 
select * from orders;
select category , month(orderdate) , sum(ordervalue) from orders
group by category , month(orderdate);

-- ____________________ LEVEL - 4 ________________________

-- Q.1 Q1. Categories with Revenue > $20,000 

select category  , sum(ordervalue) as Revenue from orders
group by category having Revenue > 20000;

-- Q2. Customers with More Than 1 Order 
select customerid , count(*) from orders
group by CustomerID having count(*) > 1;


-- Q3. Customer + Category Combinations Spending > $10,000 

select customerid , category , sum(ordervalue) from orders
group by customerid , category having sum(OrderValue) > 10000; 

-- ___________________LEVEL - 5 _____________________________________

-- Q1. Category Summary (Avg Order Value > $5,000, sorted by Revenue) 
select category , count(*) as total_orders , sum(ordervalue) as total_revenue , avg(ordervalue) as avg_order_value from orders
group by category  having  avg_order_value > 5000
order by total_revenue desc;

-- Q2. High-Value Repeat Customers (>1 order, Avg OrderValue > $6,000) 
select customerid , count(*) as order_count , avg(ordervalue) as avg_order_value from orders 
group by customerid having  count(*) > 1 and avg_order_value >= 6000;

-- Q3. Category-Month Summary (Min 2 Orders, Sorted by Month then Revenue) 
select * from orders;
select category , month(orderdate) as 'months', count(*) as 'orders' , 
sum(ordervalue) as 'total_revenue' , avg(ordervalue) as 'avg_order_value' from orders
group by category ,month(orderdate)  having count(*) >= 2
order by month(OrderDate) , total_revenue desc; 



