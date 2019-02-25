
select * from trips;

select * from riders;

select * from cars;



What's the primary key of trips?
id
What's the primary key of riders?
id
What's the primary key of cars?
id





/*Try out a simple cross join between riders and cars.*/

SELECT riders.first,
   riders.last,
   cars.model
FROM riders, cars;




/*

Suppose we want to create a Trip Log with the trips and its users.

Find the columns to join between trips and riders and combine the two tables using a LEFT JOIN.

Let trips be the left table.
*/

select trips.date,
			 trips.pickup,
       trips.dropoff,
       trips.type,
       trips.cost,
       riders.first,
       riders.last,
       riders.username
from trips
left join riders
		ON trips.rider_id = riders.id;
  
  

/*
Suppose we want to create a link between the trips and the cars used during those trips.

Find the columns to join on and combine the trips and cars table using an INNER JOIN.
*/


select *
from trips
inner join cars
		On trips.car_id = cars.id;
 
 
 
 
/*

The new riders data are in! There are three new users this month.

Stack the riders table on top of the new table named riders2.
*/


select * from riders
UNION
select * from riders2;




/*
What is the average cost for a trip and round the result to 2 decimal places?
*/


select round(avg(cost),2)
from trips;



/*

REBU is looking to do an email campaign for all the irregular users.

Find all the riders who have used REBU less than 500 times!
*/


select * from riders
where total_trips < 500;




/*

Calculate the number of cars that are active.
*/


select count(*) from cars
where status = 'active';



/*

It's safety recall time for cars that have been on the road for a while.

Write a query that finds the two cars that have the highest trips_completed.
*/


select * from cars
order by trips_completed DESC
limit 2;


    
  








