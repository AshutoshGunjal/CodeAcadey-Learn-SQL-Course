/*
SQL commands that will help us work with data that is stored in multiple tables.
*/

select * from orders
limit 5;

select * from subscriptions 
limit 5;

select * from customers
limit 5;


/* Joins
Write SQL query to combine orders and customers
*/


select * from orders
Join customers
 	ON orders.customer_id = customers.customer_id;
  
  
  
/*
Write a query to select order's table order_id column and customers table's customer name column
*/


select orders.order_id,
			customers.customer_name
from orders
join customers
	on orders.order_id = customers.customer_id;
  
  
  
/*
Join orders table and subscriptions table and select all columns.

Make sure to join on the subscription_id column.
*/



select * 
from orders
join subscriptions
	on orders.subscription_id = subscriptions.subscription_id;
  
  

/*
Don't remove the previous query.

Add a second query after your first one that only selects rows from the join where description is equal to 'Fashion Magazine'.
*/


select * 
from orders
join subscriptions
	on orders.subscription_id = subscriptions.subscription_id
where subscriptions.description = 'Fashion Magazine';



/* Inner Joins
Suppose we are working for The Codecademy Times, a newspaper with two types of subscriptions:

print newspaper
online articles

Some users subscribe to just the newspaper, some subscribe to just the online edition, and some subscribe to both.

There is a newspaper table that contains information about the newspaper subscribers.

Count the number of subscribers who get a print newspaper using COUNT().
*/


select count(*)
from newspaper;



/*
Don't remove your previous query.

There is also an online table that contains information about the online subscribers.

Count the number of subscribers who get an online newspaper using COUNT()
*/


select count(*)
from online;



/*
Don't remove your previous queries.

Join newspaper table and online table on their id columns (the unique ID of the subscriber).

How many rows are in this table?
*/


select count(*)
from newspaper
Join online
		ON newspaper.id = online.id;
    
// answers are 60 65 and 50 



/*  Left Joins

Let's return to our newspaper and online subscribers.

Suppose we want to know how many users subscribe to the print newspaper, but not to the online.

Start by performing a left join of newspaper table and online table on their id columns and selecting all columns.
*/


select *
from newspaper 
left join online
	ON newspaper.id = online.id;
  


/* 
Don't remove your previous query.

In order to find which users do not subscribe to the online edition, we need to add a WHERE clause.
*/


select *
from newspaper 
left join online
	ON newspaper.id = online.id
where online.id is null;



/* Primary key vs Foreign Key
Suppose Columbia University has two tables in their database:

The classes table contains information on the classes that the school offers. Its primary key is id.
The students table contains information on all students in the school. Its primary key is id. It contains the foreign key 
class_id, which corresponds to the primary key of classes.

Perform an inner join of classes and students using the primary and foreign keys described above, and select all the columns.
*/


select *
from classes
join students
	ON classes.id = students.class_id;
  
  
  

/*    CROSS Joins
For instance, if we had a table of shirts and a table of pants, we might want to know all the possible combinations 
to create different outfits.
*/


select shirts.shirt_color,
			pants.pants_color
from shirts
cross join pants;


/*
Let's return to our newspaper subscriptions. This table contains two columns that we haven't discussed yet:

start_month: the first month where the customer subscribed to the print newspaper (i.e., 2 for February)
end_month: the final month where the customer subscribed to the print newspaper
Suppose we wanted to know how many users were subscribed during each month of the year. For each month (1, 2, 3) we would 
need to know if a user was subscribed. Follow the steps below to see how we can use a CROSS JOIN to solve this problem.

Eventually, we'll use a cross join to help us, but first, let's try a simpler problem.

Let's start by counting the number of customers who were subscribed to the newspaper during March.

Use COUNT(*) to count the number of rows and a WHERE clause to restrict to two conditions:

start_month <= 3
end_month >= 3
*/


SELECT COUNT(*)
FROM newspaper
WHERE start_month <= 3 
  AND end_month >= 3;
  
  
/*
Don't remove the previous query.

The previous query lets us investigate one month at a time. In order to check across all months, we're going to 
need to use a cross join.

Our database contains another table called months which contains the numbers between 1 and 12.

Select all columns from the cross join of newspaper and months.
*/


select * from newspaper
cross join months;


/*
Don't remove your previous queries.

Create a third query where you add a WHERE statement to your cross join to restrict to two conditions:

start_month <= month
end_month >= month
This will select all months where a user was subscribed.
*/


select * from newspaper
cross join months
where start_month <= month AND end_month >= month;



/*
Don't remove your previous queries.

Create a final query where you aggregate over each month to count the number of subscribers.
*/


select month, count(*) from newspaper
cross join months
where start_month <= month AND end_month >= month
group by month;




/*   UNION
We'd like to create one big table with both sets of data.

Use UNION to stack the newspaper table on top of the online table.
*/


select *
from newspaper
UNION
select *
from online;



/*   With
Let's return to our magazine order example. Our marketing department might want to know a bit more about our customers. 
For instance, they might want to know how many magazines each customer subscribes to. We can easily calculate this using our 
orders table
*/


WITH previous_query AS (
   SELECT customer_id,
      COUNT(subscription_id) AS 'subscriptions'
   FROM orders
   GROUP BY customer_id
)
SELECT customers.customer_name, 
   previous_query.subscriptions
FROM previous_query
JOIN customers
  ON previous_query.customer_id = customers.customer_id;









