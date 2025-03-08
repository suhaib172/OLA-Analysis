-- create database
create database OLA;
USE OLA;

#1. retrive all successful bookings
create view succesful_Bookings as 
select * from bookings
where booking_status ="success";

select * from succesful_Bookings;

#2. find the average ride distance for the each vehical types:
create view ride_distance_for_each_vehical as 
select vehicle_type, avg(Ride_distance) AS avg_distance
from bookings
group by vehicle_type; 

select * from ride_distance_for_each_vehical;

#3. get the total number of canceled riedes by customers:
select count(*) from bookings
where booking_status ="canceled by customer"; 
 
#4. list the top 5 customer who booked the highst number of rides:
create view top_5_customer as 
select customer_id, count(booking_id) as total_rides
from bookings
group by customer_id
order by total_rides desc
limit 5;
select * from top_5_customer;

#5. get the number of rides canceled by drivers due to personal and car-related issues:
create view canceled_by_driver_PCR_issue as 
select count(*) 
from bookings
where canceled_rides_by_driver ="personal & car related issue";
select * from canceled_by_driver_PCR_issue;

#6. find the max and min driver rating for prime sedan bookings:
create view max_min_driver_rating as 
select max(Driver_Ratings) as max_rating, min(Driver_Ratings) as min_rating
from bookings 
where vehicle_type = "Prime Sedan";
select * from max_min_driver_rating;

#7. retrive all rides where payment wes made using UPI:
create view all_upi_payment as 
select * from bookings 
where payment_Method = "UPI";
select * from all_upi_payment;

#8. find the average customer rating per vehical type:
create view avg_customer_rating as 
select vehicle_type, avg(customer_rating) as customer_avg_rating
from bookings 
group by vehicle_type;
select * from avg_customer_rating;

#9. calculate the total booking value of rides completed successfully:
create view booking_successful_ride_value as 
select sum(booking_value) as total_booking_rides_value
from bookings
where booking_status ="success";
select* from booking_successful_ride_value;
select* from bookings;

#10. list all incomplete rides along with the reason:
create view incomplete_rides_reason as 
select booking_id, incomplete_rides_reason
from bookings 
where incomplete_rides ="yes";
select * from incomplete_rides_reason;












