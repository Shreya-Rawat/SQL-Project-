create database travego;
use travego;
create table passenger(
passenger_id int primary key,
passenger_name varchar(20),
category varchar(20),
gender varchar(20),
boarding_city varchar(20),
destination_city varchar(20),
distance int,
bus_type varchar(20)
);
create table price(
id int primary key,
bus_type varchar(20),
distance int,
price int
);
insert into passenger values
(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
(2,	'Anmol',	'Non-AC',	'M',	'Mumbai',	'Hyderabad',	700,'Sitting'),
(3,	'Pallavi',	'AC',	'F',	'Panaji',	 'Bengaluru',	600,	'Sleeper'),
(4,	'Khusboo', 	'AC',	'F',	'Chennai',	'Mumbai',	1500,	'Sleeper'),
(5,	'Udit',	'Non-AC', 'M',	'Trivandrum',	'Panaji',	1000,	'Sleeper'),
(6,	'Ankur',	'AC',	'M',	'Nagpur',	'Hyderabad',	500,	'Sitting'),
(7,	'Hemant',	'Non-AC',	'M',	'Panaji',	'Mumbai',		700,	'Sleeper'),
(8,	'Manish',	'Non-AC',	'M',	'Hyderabad',	'Bengaluru',	500,	'Sitting'),
(9,	'Piyush',	'AC','M',	'Pune',	'Nagpur',700,	'Sitting');
insert into price values
(1, 'Sleeper',	350,	770),
(2,	'Sleeper',	500,	1100),
(3,	'Sleeper',	600,	1320),
(4,	'Sleeper',	700,	1540),
(5,	'Sleeper',	1000,	2200),
(6,	'Sleeper',	1200,	2640),
(7,	'Sleeper',	1500,	2700),
(8,	'Sitting',	500,	620),
(9,	'Sitting',	600,	744),
(10, 'Sitting',	700,	868),
(11, 'Sitting',	1000,	1240),
(12, 'Sitting',	1200,	1488),
(13, 'Sitting',	1500,	1860);
-- Select Queries:
-- a.
select count(*), gender from passenger
where distance>= 600
group by gender;
-- b.
select min(price) , bus_type, distance from price
where bus_type = 'Sleeper';
-- c.
select passenger_name from passenger 
where passenger_name like 'S%';
-- d.
select p.passenger_name, p.boarding_city, p.destination_city, p.bus_type, pr.price
from passenger p 
inner join price pr
on p.bus_type = pr.bus_type
and p.distance = pr.distance;
-- e.
select p.passenger_name, pr.price
from passenger p 
inner join price pr
on p.bus_type = pr.bus_type
and p.distance = pr.distance
where p.distance = 1000 and p.bus_type = 'Sitting';
-- f. 
select bus_type, distance, price
from price 
where distance = (select distance from passenger 
where passenger_name = 'Pallavi');
-- g.
select distinct distance from passenger
order by distance desc;
-- h.
select passenger_name, 100*distance/(select sum(distance) from passenger) as percent_distance_travelled
from passenger;

