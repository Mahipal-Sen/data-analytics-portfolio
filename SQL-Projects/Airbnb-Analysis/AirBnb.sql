create database airbnb;
use airbnb;


select * 
from booking_details bd ;

select * 
from listings l ;


-- 1.Write a query to show names from Listings table

select l.name
from listings l; 

-- 2.Write a query to fetch total listings from the listings table

select count(*) Total_Listing
from listings l ;


-- 3.Write a query to fetch total listing_id from the booking_details table

select count(listing_id) Total_Id
from booking_details l ;

-- 4.Write a query to fetch host ids from listings table

select l.host_id
from listings l ;

-- 5.Write a query to fetch all unique host name from listings table

select distinct name
from listings l ;

-- 6.Write a query to show all unique neighbourhood_group from listings table

select distinct l.neighbourhood_group
from listings l ;

-- 7.Write a query to show all unique neighbourhood from listings table

select distinct l.neighbourhood
from listings l 
order by l.neighbourhood ;

-- 8.Write a query to fetch unique room_type from listings tables

select distinct room_type
from listings l ;

-- 9.Write a query to show all values of Brooklyn & Manhattan from listings tables

select * 
from listings l 
where l.neighbourhood_group  in ('Brooklyn', 'Manhattan');

-- 10.Write a query to show maximum price from booking_details table

select max(price) 
from booking_details bd ;

-- 11.Write a query to show minimum price fron booking_details table

select min(price) 
from booking_details bd ;

-- 12.Write a query to show average price from booking_details table

select avg(price) 
from booking_details bd ;

-- 13.Write a query to show minimum value of minimum_nights from booking_details table

select min(bd.minimum_nights )
from booking_details bd; 

-- 14.Write a query to show maximum value of minimum_nights from booking_details table

select max(bd.minimum_nights )
from booking_details bd;

-- 15.Write a query to show average availability_365 

select avg(bd.availability_365 ) 
from booking_details bd   ;

-- 16.Write a query to show id , availability_365 and all availability_365 values greater than 300

select bd.listing_id  , availability_365 
from booking_details bd
where bd.availability_365 >300;


-- 17.Write a query to show count of id where price is in between 300 to 400

select count(bd.listing_id ) from booking_details bd 
where price between 300 and 400;

-- 18.Write a query to show count of id where minimum_nights spend is less than 5

select count(bd.listing_id ) from booking_details bd 
where bd.minimum_nights < 5;

-- 19.Write a query to show count where minimum_nights spend is greater than 100

select count(*) from booking_details bd 
where bd.minimum_nights > 100;

-- 20.Write a query to show all data of listings & booking_details

select * 
from listings l 
join booking_details bd 
on l.id = bd.listing_id ;


-- 21.Write a query to show host name and price 

select l.host_name, bd.price 
from listings l 
join booking_details bd 
on l.id = bd.listing_id ;


-- 22.Write a query to show room_type and price

select l.room_type , bd.price 
from listings l 
join booking_details bd 
on l.id = bd.listing_id ;

-- 23.Write a query to show neighbourhood_group & minimum_nights spend

select l.neighbourhood_group , bd.minimum_nights 
from listings l 
join booking_details bd 
on l.id = bd.listing_id ;

-- 24.Write a query to show neighbourhood & availability_365

select l.neighbourhood ,bd.availability_365  
from listings l 
join booking_details bd 
on l.id = bd.listing_id ;

-- 25.Write a query to show total price by neighbourhood_group

select l.neighbourhood_group, sum(price)  
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
group by l.neighbourhood_group ;

-- 26.Write a query to show maximum price by neighbourhood_group

select l.neighbourhood_group, max(price)  
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
group by l.neighbourhood_group ;

-- 27.Write a query to show maximum night spend by neighbourhood_group

select l.neighbourhood_group, max(bd.minimum_nights )  
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
group by l.neighbourhood_group ;

-- 28.Write a query to show maximum reviews_per_month spend by neighbourhood

select l.neighbourhood, max(reviews_per_month)  
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
group by l.neighbourhood ;


-- 29.Write a query to show maximum price by room type

select l.room_type , max(price)  
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
group by l.room_type  ;

-- 30.Write a query to show average number_of_reviews by room_type

select l.room_type , round(avg(number_of_reviews),2)  
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
group by l.room_type  ;

-- 31.Write a query to show average price by room type

select l.room_type , round(avg(price),2)  
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
group by l.room_type  ;

-- 32.Write a query to show average night spend by room type

select l.room_type , round(avg(bd.minimum_nights ),2)  
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
group by l.room_type  ;

-- 33.Write a query to show average price by room type but average price is less than 100

select l.room_type , round(avg(price),2)  
from listings l 
join booking_details bd 
on l.id = bd.listing_id
group by l.room_type 
having avg(price)< 100;

-- 34.Write a query to show average night by neighbourhood and average_nights is greater than 5

select l.neighbourhood , round(avg(bd.minimum_nights ),2)  
from listings l 
join booking_details bd 
on l.id = bd.listing_id
group by l.neighbourhood 
having avg(bd.minimum_nights )> 5;

-- 35.Write a query to show all data from listings where price is greater than 200 using sub-query.

select *
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
where price >(
      select  200 );


-- 36.Write a query to show all values from booking_details table where host id is 314941 using sub-query.

select *
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
where l.host_id in(
      select l.host_id  
      from listings 
      where l.host_id  = 314941 );


-- 37.Find all pairs of id having the same host id, each pair coming once only.

select l1.id as id1, l2.id as id2, l1.host_id
from listings l1
join listings l2
on l1.host_id = l2.host_id
and l1.id < l2.id;

-- 38.Write an sql query to show fetch all records that have the term cozy in name

select *
from listings l 
where  name like '%cozy%';

-- 39.Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group

select price, host_id, neighbourhood_group
from listings l
join booking_details bd 
on l.id = bd.listing_id 
where l.neighbourhood_group ='Manhattan';


-- 40.Write a query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100

select l.id , host_name, neighbourhood ,price
from listings l
join booking_details bd 
on l.id = bd.listing_id 
where l.neighbourhood in ('Upper West Side','Williamsburg') and bd.price >100;

-- 41.Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant

select l.id , host_name, neighbourhood ,price
from listings l
join booking_details bd 
on l.id = bd.listing_id 
where host_name= 'Elise' and l.neighbourhood = 'Bedford-Stuyvesant';

-- 42.Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights

select host_name, availability_365,minimum_nights
from listings l
join booking_details bd 
on l.id = bd.listing_id 
where availability_365>= 100 and minimum_nights>=100 ;

-- 43.Write a query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+

select id , host_name , number_of_reviews, reviews_per_month
from listings l
join booking_details bd 
on l.id = bd.listing_id 
where number_of_reviews > 500 and reviews_per_month > 5 ;

-- 44.Write a query to show neighbourhood_group which have most total number of review 

select neighbourhood_group,sum(bd.number_of_reviews ) as Total_number_of_reviews
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
group by l.neighbourhood_group 
order by Total_number_of_reviews desc 
limit 1;

-- 45.Write a query to show host name which have most cheaper total price

select l.host_name ,sum(price ) as Total_Price
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
group by l.host_name 
order by Total_Price  asc
limit 1;

-- 46.Write a query to show host name which have most costly total price 

select l.host_name ,sum(price ) as Total_Price
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
group by l.host_name 
order by Total_Price  desc
limit 1;

-- 47.Write a query to show host name which have max price using sub-query

select l.host_name ,price 
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
where price=(
      select max(price) from booking_details bd);

-- 48.Write a query to show neighbourhood_group where price is less than 100
      
 select distinct  l.neighbourhood_group 
from listings l 
join booking_details bd 
on l.id = bd.listing_id
where price <100;
      
-- 49.Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price

select l.room_type ,max(price ) as Max_Price, avg(bd.availability_365 ) as Average_Availability_365 
from listings l 
join booking_details bd 
on l.id = bd.listing_id 
group by l.room_type  
order by Max_Price  ;

.