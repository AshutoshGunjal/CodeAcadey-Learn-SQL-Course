/*Take a look at the startup table*/

select * from startups;



/*
Calculate the total number of companies in the table.
*/

select count(*)
from startups;



/*
We want to know the total value of all companies in this table.
*/


select sum(valuation)
from startups;



/*

What is the highest amount raised by a startup?
*/


select max(raised)
from startups;




/*
Edit the query so that it returns the maximum amount of money raised, during 'Seed' stage.
*/


select max(raised)
from startups
where stage = 'Seed';



/*

In what year was the oldest company on the list founded?
*/



select min(founded)
from startup;


/*
Return the average valuation.
*/

select avg(valuation)
from startups;



/*

Return the average valuation, in each category.
*/



select category, avg(valuation)
from startups
group by category;




/*
Return the average valuation, in each category.

Round the averages to two decimal places.
*/


select category, round(avg(valuation),2)
from startups
group by category;




/*
Return the average valuation, in each category.

Round the averages to two decimal places.

Lastly, order the list from highest averages to lowest.
*/


select category, round(avg(valuation),2)
from startups
group by category
order by 2 desc;



/*

First, return the name of each category with the total number of companies that belong to it.
*/


select category, count(*)
from startups
group by category;




/*
Next, filter the result to only include categories that have more than three companies in them.
*/


select category, count(*)
from startups
group by category
having count(*) > 3
order by 2 desc;




/*

What is the average size of a startup in each location?
*/


select location, avg(employees)
from startups
group by location;




/*
What is the average size of a startup in each location, with average sizes above 500?
*/


select location, avg(employees)
from startups
group by location
having avg(employees) > 500;








