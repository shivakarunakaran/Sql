create table registration(sno int,name varchar(50),qualification varchar(20),address varchar(50),phone_no bigint)
insert into registration values(101,'ivy','mbbs','sydney',9834091274),(102,'mae','doc','melbourne',9346091274),(103,'indi','mba','paddington',9832741274)
insert into registration values(104,'rae','mca','perth',9834097643),(105,'isla','engg','hobart',934607302),(106,'rose','msc','gabba',9832741205)

delete from registration where sno=102
update registration set phone_no=9346073027 where sno=105
alter table registration add age int
update registration set age=26 where sno=101
select * from registration

--Operators
select * from registration where age=24
select * from registration where age>24
select * from registration where age>=24
select * from registration where age<24
select * from registration where age<=24
select * from registration where age<>25
select * from registration where age between 24 and 27
select * from registration where age in (22,24,26)
select * from registration where name like 'i%'
select * from registration where name like '%i'
select * from registration where name like '%i%'
select * from registration where name like '__d%'
select * from registration where age is null
select * from registration where name like 'i%'and age>24
select * from registration where name like 'i%'or age>24
select * from registration where name not like 'i%'

--Functions
select * from registration
select avg(age) as average from registration
select sum(age) as sum_of_age from registration
select max(age) as maximium_age from registration
select min(age) as minimum_age from registration
select count(age) as count_of_age from registration
select upper(name) as upper_case from registration
select lower(name) as lower_case from registration
select getdate() as date_time
select len(name) as name_length from registration
select avg(age) as average,sum(age) as sum_of_age,max(age) as maximium_age,min(age) as minimum_age from registration
select sum(age) as sum_of_age from registration

--Round Func
alter table registration add sal float
--alter table registration alter column sal float
alter table registration alter column sal int
update registration set sal=112320.5423 where sno=101
select round(sal,3)as placevalues from registration

select * from registration

select qualification,sum(sal)as salary from registration group by qualification