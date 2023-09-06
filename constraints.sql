create table stu_details(stu_id int,stu_name varchar(50),stu_age int)
insert into stu_details values(101,'isla',8)
insert into stu_details values(102,'rose',7),(103,'indi',6),(104,'rae',5)
insert into stu_details(stu_id,stu_name)values(105,'ivy')
update stu_details set stu_age=9 where stu_id=105

delete from stu_details where stu_id=105
--drop table stddetails
select * from stu_details

--constraints
--unique
create table s1(stu_id int,stu_name varchar(50),stu_age int unique)
insert into s1 values(101,'isla',8)
insert into s1 values(101,'isla',8)

--not null
create table s2(stu_id int,stu_name varchar(50) not null,stu_age int unique)
insert into s2 values(101,'isla',8)
insert into s2 (stu_id,stu_age) values (101,9)

--primary key
create table s5(stu_id int primary key,stu_name varchar(50),stu_age int)
insert into s5 values(101,'isla',8)

--foreign key
create table s6(stu_id int references s5(stu_id),stu_city varchar(50))
--create table s7(stu_id int,stu_city varchar(50),foreign key(stu_id) references s5(stu_id))
insert into s6 values(101,'sydney')
select * from s6

--check
create table s7(stu_id int, sal int check(sal>10000))
insert into s7 values(101,10001)

--default
create table s8(stu_id int, sal int default 10000)
insert into s8 values(101,100)
insert into s8 values(103,default)
insert into s8 (stu_id) values (102)
delete from s8 where stu_id=2
select * from s8

--Rooms
create table rooms(room_id int primary key,available bit default 1,room_type varchar(50) check(room_type='double'
or room_type='single' or room_type='deluxe'),dailyrent int default 1000)
--create table rooms(room_id int primary key,available bit default 1,room_type varchar(50) check(room_type in('double',
--'single','deluxe'),dailyrent int default 1000))
insert into rooms values(105,default,'double',default)
select * from rooms

--room booking

create table booking(book_id int primary key,room_id int references rooms(room_id),cus_name varchar(50) not null,from_date date default getdate(),
to_date date not null,phone_no bigint unique check(len(phone_no)=10))
insert into booking values(103,105,'isea',default,'2023-05-29',9677442327)
select * from booking
