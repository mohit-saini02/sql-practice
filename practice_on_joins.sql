# practice questions on joins:
-- Database_name : flipkart
-- Tables : 1. users :    [user_id , name , state , city]
--          2. orders :  [order_id  , user_id , order_date]
--          3. order_details :  [order_id , amount , profit , quantity , category_id ]
--          4. category  :  [category_id , category , vertical]



-- 1.  Find all the orders placed in pune ? 
select  t2.order_id , t1.city  from users as t1
join orders as t2
on t1.user_id = t2.user_id
where t1.city = 'Pune';

-- 2. Find all orders under chair category ? 
select *  from category as t1
join order_details as t2
on t1.category_id = t2.category_id
where vertical = 'chairs';


-- 3. Find all profitable orders ? 

-- select order_id  , sum(profit) from order_details
-- group by order_id having sum(profit) > 0;  -- using single table 

select t2.order_id , sum(profit)  from order_details as t1
join orders as t2
on t1.order_id = t2.order_id
group by order_id having sum(profit) > 0;

-- 4. find the customer(user) who has placed max numbers of orders ? 
select t1.user_id , count(t2.order_id) from users as t1
join orders as t2
on t1.user_id = t2.user_id
group by t1.user_id;

-- 5. which is the most profitable category ? 

select category  , sum(profit) from category as t1
join order_details as t2
on t1.category_id = t2.category_id
group by t1.category
order by sum(profit) desc limit 1;

-- 6. which is most profitable state ? 
select state , sum(t3.profit) from users as t1
join orders as t2
on t1.user_id = t2.user_id
join order_details as t3
on t3.order_id = t2.order_id
group by t1.state
order by sum(t3.profit) desc limit 1;

-- 7. find all vertical with profit higher than 3000 ? 

select vertical , sum(t2.profit) from category as t1
join order_details as t2
on t1.category_id = t2.category_id
group by t1.vertical having sum(t2.profit) > 3000
order by sum(t2.profit) desc;