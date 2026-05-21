create database shadidb;
use shadidb;
create table biodata(id int , name varchar(40) , age int);

insert into biodata values
(1,'rahul',28),
(2,'anjali' ,28),
(3,'aishwarya',40),
(4,'naina',23);
select * from biodata;

-- sub query: 

select * from biodata
where age = (select age from biodata where name = 'rahul');

-- 2. 
select * from biodata 
where age = (select max(age) from biodata);

-- 3. 
select * from biodata 
where age = (select min(age) from biodata);

-- 4
select * from biodata
where char_length(name) = (select char_length(name) from biodata 
where name = 'rahul');

## single row sub query : in which the inner query returns only one row .

use sakila ;
select * from film;

-- i want that movies those rental_rate is same as the movie called "AFRICAN EGG" ? 


select title , rental_rate from film
where rental_rate = (select rental_rate from film
					  where title = 'AFRICAN EGG');
                      
-- que 1. 


select film_id , title , rental_rate from film
where rental_rate = (select min(rental_rate) from film);


-- 2. 

select film_id , title , length from film
where length > (select avg(length) from film);

-- 3. 
-- select release_year from film where title = 'ALONE TRIP';
-- select rating from film where title = 'APOLLO TEEN';

select * from film
where title = (select release_year from film where title = 'ALONE TRIP') and 
rating = (select rating from film where title = 'APOLLO TEEN'); 
            


use shadidb;



select * from biodata 
where age in (select age from biodata where name  = 'anjali' or name = 'aishwarya')
and name <> 'rahul';

-- que. find the name for rahul where the age is not equal to anjali and aishwarya ? 
select * from biodata 
where age not in (select age from biodata where name  = 'anjali' or name = 'aishwarya')
and name <> 'rahul';


