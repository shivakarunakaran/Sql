create table cust_det(cust_id int,cust_name varchar(50),address varchar(50),country varchar(50))
insert into cust_det values(101,'ivy','sydney','australia'),(102,'mae','melbourne','australia'),(103,'indi','paddington','australia')
insert into cust_det values(104,'rae','chennai','india'),(105,'isla','coimbatore','india'),(106,'rose','lords','london')
insert into cust_det values(107,'david','ovel','london'),(108,'andrew','madrid','spain'),(109,'candi','barca','spain')
select country,count(cust_id)as noofcust from cust_det group by country 
select country,count(cust_id)as noofcust from cust_det group by country having count(cust_id)>=2

select * from cust_det

select * into cust_copy from cust_det
select * from cust_copy
select cust_id,cust_name into table1 from cust_copy
select * from table1
select cust_id,address into table2 from cust_det
select * from table2
