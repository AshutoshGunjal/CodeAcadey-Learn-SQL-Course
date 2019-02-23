/* Introduction - Aggregrate Functions
Before getting started, take a look at the data in the fake_apps table.

In the code editor, type the following:
*/

select * from fake_apps;


/* COUNT
Let's count how many apps are in the table.

In the code editor, run:
*/

select count(*)
from fake_apps;


/* 
Add a WHERE clause in the previous query to count how many free apps are in the table.
*/

select count(*)
from fake_apps
where price = 0.0;



/*  SUM
What is the total number of downloads for all of the apps combined?

*/


select sum(downloads)
from fake_apps;




/* MAX - MIN
How many downloads does the most popular app have?
*/


select max(downloads)
from fake_apps;



/*
What is the least number of times an app has been downloaded?
*/



select min(downloads)
from fake_apps;


/*
Write a new query that returns the price of the most expensive app.
*/


select max(price)
from fake_apps;



/*  AVERAGE
Calculate the average number of downloads for all the apps in the table.
*/


select avg(downloads)
from fake_apps;



/*
Write a new query that calculates the average price for all the apps in the table.
*/


select avg(price)
from fake_apps;


/* ROUND
Let's return the name column and a rounded price column.
*/

select name, round(price,0)
from fake_apps;



/*Write a query to get average price of an app and round this result to 2 decimal places*/

select round(avg(price),2)
from fake_apps;



/* GROUP BY I
Write a query to find the mean IMDb ratings for all movies each year
*/


selet year,
	avg(imdb_rating)
from movies
GROUP BY year
ORDER BY year;



/*
Write a query to find total number of apps for each price 
*/


select price, count(*)
from fake_apps
group by price;


/*
Write a query to find total number of apps for each price and count the total number of apps that have been 
downloaded more than 20,000 times, at each price.
*/


select price, count(*)
from fake_apps
where downloads > 20000
group by price;


/*
Write a new query that calculates the total number of downloads for each category
*/


select category,sum(downloads)
from fake_apps
group by category;


/*  Group By II */

SELECT category, 
   price,
   AVG(downloads)
FROM fake_apps
GROUP BY 1,2;









