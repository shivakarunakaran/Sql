create table petrol_details(dist_id int,dist_name varchar(50),buy_rate int,sell_rate int,vol_in float,vol_out float,year int)
insert into petrol_details values(101,'reliance',45000,55000,12.5,10.5,2020)
insert into petrol_details values(102,'Reliance',40000,50000,11.5,10.5,2021),(103,'Bharath',60000,75000,14.5,13.5,2022),(104,'bharath',55000,70000,14.8,12.8,2020)
insert into petrol_details values(105,'Shell',48000,58000,10.5,8.5,2021),(106,'shell',65000,75000,14.5,13.5,2021),(107,'hp',85000,100000,17.8,15.8,2022)
insert into petrol_details values(108,'HP',35000,50000,10.5,8.5,2023),(109,'indianoil',62000,72000,14.2,13.2,2022),(110,'IndianOil',88000,102000,17.4,15.4,2023)
insert into petrol_details values(111,'HP',35000,50000,10.5,8.5,2023),(112,'indianoil',62000,72000,14.2,13.2,2022),(113,'IndianOil',8800,10200,17.5,15.3,2022)

select * from petrol_details

--1
select distinct dist_name as Delar_Name from petrol_details
--2
select distinct upper(dist_name) as upper_case from petrol_details
--3
select SUBSTRING(dist_name,1,3) as first_3_charac from petrol_details
--4
select dist_name  from petrol_details order by dist_name asc
--5
select * from petrol_details where dist_name in('Reliance','IndianOil')
--6
select * from petrol_details where dist_name like '%h%'
--7
select dist_name,sum(vol_out)as totall_sell from petrol_details group by dist_name
--8
select * from petrol_details where year between 2020 and 2022
--9
select dist_name,count(dist_name)as dist_count from petrol_details group by dist_name

select dist_name,COUNT(dist_id) as Duplicate from petrol_details group by dist_name having COUNT(dist_id)>1

select * from petrol_details